$PBExportHeader$u_derek_powerui_json.sru
forward
global type u_derek_powerui_json from u_derek_v2_dd
end type
end forward

global type u_derek_powerui_json from u_derek_v2_dd
end type
global u_derek_powerui_json u_derek_powerui_json

forward prototypes
public function string uf_json_parse (ref string ls_xml, boolean lb_autoinstance)
public function string uf_json_parse_child (string ls_listname, n_json ldom_root)
end prototypes

public function string uf_json_parse (ref string ls_xml, boolean lb_autoinstance);string ls_errtext
string ls_name
int l_listindex

if lb_autoinstance=true then 
	if uf_xmlout_create(ls_errtext)=-1 then goto e
end if

n_json ldom_bldr
n_json ldom_doc
n_json ldom_root

Try
	// Create a PBDOM_DOCUMENT from the XMl file
	ldom_bldr = Create n_json
	if left(ls_xml,1)='{' then 
		//ldom_doc = 
		ldom_bldr.parse (ls_xml) 
	else
		//ldom_doc = 
		ldom_bldr.loadfile (ls_xml) //"20110820orders.xml"
	end if
	ldom_doc=ldom_bldr
	ldom_root=ldom_doc.getfirstchild( )
	ls_name=ldom_root.GetName()
	
	l_listindex=uf_findarray(is_listname[],ls_name,0)
	if l_listindex=0 then 
		ls_errtext="未定义的根结节:"+ls_name
		throw create runtimeerror
	end if
	
	ls_errtext=uf_json_parse_child(ls_name,ldom_root)
	if ls_errtext<>'' then 
		throw create runtimeerror
	end if
	
//ldom_doc.savedocument("D:\1.xml")
	
 CATCH (runtimeerror except)
	ls_errtext+=except.Text

finally
	if isvalid(ldom_root) then destroy ldom_root
	if isvalid(ldom_doc) then destroy ldom_doc
	if isvalid(ldom_bldr) then Destroy ldom_bldr
	
 END TRY	
 
if lb_autoinstance=true then 
	//销毁数据窗口
	uf_xmlout_destroy()
end if

if ls_errtext<>'' then goto e
return ''

e:
return ls_errtext
end function

public function string uf_json_parse_child (string ls_listname, n_json ldom_root);/*value可以是数字,但key仅支持string类型*/
//json类型一定要和datawindow类型一致,否则值会取不出来
string ls_errtext
string ls_name,ls_temp
n_json ldom_child[]
long i
int m
string ls_field
long l_rowcount,l_newrow
int l_findrow
int l_listindex,l_keycount,l_nodecount
int li_ret
any la_value

//ls_name=ldom_root.GetName()
//if li_parentlist<>0 then 
//	l_findrow=ids_nodes.find("(col"+string(li_parentlist)+"='"+ls_name+"') or (col"+string(li_parentlist)+" like '%:"+ls_name+"') ",1,i_nodecount[li_parentlist])
//	if l_findrow>0 then 
//		ls_name=ids_nodes.getitemstring(l_findrow,li_parentlist) //取定义的列表名称
//	else
//		ls_errtext='未找到关联的上级节点!'
//		goto e
//	end if
//end if
//

l_listindex=uf_findarray(is_listname[],ls_listname,0)
if l_listindex=0 then 
	ls_errtext="未定义列表:"+ls_listname
	goto e
end if
long l_childcount
l_childcount=ldom_root.getchildcount()
for i=1 to l_childcount
	ldom_child[i]=ldom_root.getchild(i)
next
//ldom_root.GetChildElements(ldom_child[])

l_rowcount=upperbound(ldom_child[])
l_nodecount=i_nodecount[l_listindex] //子节点数

l_keycount=i_keycount[l_listindex]
n_json ldom_parent,ldom_temp
for i=1 to l_keycount
	ls_name=ids_wherekeys.getitemstring(i,'col'+string(l_listindex))
	
	ldom_parent=ldom_root
	if ldom_parent.gettype()=5 then ldom_parent=ldom_parent.getowner( )
	li_ret=ids_keyparent.getitemnumber(i,l_listindex)
	for m=1 to li_ret //上级数
		ldom_parent=ldom_parent.getowner( )
		if ldom_parent.gettype()=5 then ldom_parent=ldom_parent.getowner( ) //列表要再取上级
	next 
	
	ls_temp=''
	ldom_temp=ldom_parent./*dynamic*/ getchild(ls_name)
	if isnull(ldom_temp)=false then
//		ldom_temp=ldom_temp.clone( true) //复制一下,否则只能add一次
//		ldom_root.addcontent(ldom_temp)
		ls_temp=ldom_parent./*dynamic*/ getchildstring(ls_name) //getchild(ls_name).getvaluestring()
	end if
	ids_list[l_listindex].modify(ls_name+".initial='"+ls_temp+"' ")
next

l_newrow=ids_list[l_listindex].insertrow(0)
for i=1 to l_rowcount
	if ldom_root.gettype()=5 then //列表取上级name,否则取不出来
		ls_name=ldom_root.getname()
	else
		ls_name=ldom_child[i].getname()
	end if
	l_findrow=ids_nodes.find(" (#"+string(l_listindex)+"='"+ls_name+"') or (#"+string(l_listindex)+" like '%:"+ls_name+"') ",1,i_nodecount[l_listindex])
	if l_findrow>0 then 
		ls_name=ids_nodes.getitemstring(l_findrow,l_listindex) //取定义的列表名称
		ls_field=ids_fields.getitemstring(l_findrow,l_listindex)
		if ls_field<>'' then 
			
			choose case lower(left(ids_list[l_listindex].describe(ls_field+".coltype"),5))
				case 'decim','numbe','int','long' //,'ulong','real'
					la_value=ldom_child[i].getvaluedouble()
					li_ret=ids_list[l_listindex].setitem(l_newrow,ls_field,la_value)
					if li_ret=-1 then 
						ls_errtext=string(la_value,'')+" 未通过验证!"
						if ls_errtext<>'' then goto e
					end if
				case 'char('
					la_value=ldom_child[i].getvaluestring()
					li_ret=ids_list[l_listindex].setitem(l_newrow,ls_field,la_value) 
					if li_ret=-1 then 
						ls_errtext=la_value+" 未通过验证!"
						if ls_errtext<>'' then goto e
					end if
				case else
					la_value=ldom_child[i].getvaluestring()
					li_ret=uf_setitem(ids_list[l_listindex],l_newrow,ls_field,la_value,0)
					if li_ret=-1 then 
						ls_errtext=la_value+" 未通过验证!"
						if ls_errtext<>'' then goto e
					end if
			end choose
		else
			if ldom_child[i].gettype()=5 then ls_name=ls_listname //如果是列表,还是当前节点
			ls_errtext=uf_json_parse_child(ls_name,ldom_child[i])
			if ls_errtext<>'' then goto e
		end if
	end if		
next

goto e
e:
return ls_errtext
end function

on u_derek_powerui_json.create
call super::create
end on

on u_derek_powerui_json.destroy
call super::destroy
end on

