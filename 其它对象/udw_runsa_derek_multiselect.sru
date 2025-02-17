$PBExportHeader$udw_runsa_derek_multiselect.sru
forward
global type udw_runsa_derek_multiselect from datawindow
end type
end forward

global type udw_runsa_derek_multiselect from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
event type string ue_checkrow ( long row )
event ue_dwnkey pbm_dwnkey
event type long ue_mouseleave ( )
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_dwnmousemove pbm_dwnmousemove
event ue_rowfocuschanging pbm_dwnrowchanging
event ue_lbup pbm_dwnlbuttonup
event ue_mousemove pbm_mousemove
event ue_itemchanged pbm_dwnitemchange
end type
global udw_runsa_derek_multiselect udw_runsa_derek_multiselect

type prototypes
SUBROUTINE mouse_event(uint dwFlags,uint dx, uint dy,uint dwData, ulong dwExtraInfo)  LIBRARY "user32.dll"   ALIAS FOR "mouse_event"

end prototypes

type variables
u_derek_dd u_dd
window iw_parent


//自适应大小处理
//等差
boolean xed,yed
boolean heighted,widthed

boolean xer,yer
boolean heighter,widther

private long x0,y0	//保存位置
private long width0,height0	//保存大小
private long il_parentwidth,il_parentheight	//保存父对象大小
private int i_resizetype	//1 为父对象resize,0 为自己resize

string is_dberror

string is_columns='' //#1,#2,#4

private blob ibb_sql
protected boolean ib_modified=true	//记录修改状态
public boolean ib_insert=false	//true会自动在修改状态下多出一个空行

protected boolean ib_retriving=false
protected boolean ib_updating=false	//是否正在使用uf_update保存数据
protected boolean ib_deleting=false

private long il_rows[] //被shift选中的行号
private boolean ib_isselect[] //对应il_rows[]的行号是否被shift选中

public boolean ib_clicksort=true
public boolean ib_mulineselect=true
public boolean ib_mulcellselect=false

//正在按下键
int i_lastdo
constant int i_LBdoing=1	//leftbutton
constant int i_PUdoing=2	//pageup
constant int i_PDdoing=3	//pagedown
constant int i_UAdoing=4	//uparrow
constant int i_DAdoing=5	//downarrow

private boolean ib_itemerrored=false
private boolean ib_itemfocuschanged=false

private boolean ib_LBdown=false
private long il_mouserow=0
private string is_mousedwo=''
private boolean ib_rowdrag=false
private boolean ib_celldrag=false

public string is_lastdwoname=''	//最后的当前列(包括计算列) <> getcolumname()
private long il_lastrow2=0	//用shift选择行最后的行<>getrow()
private string is_lastselected=''	//记录最后一次选中的字符 因为设置的selected<>重新取出的selected



end variables

forward prototypes
public function boolean uf_ismodify (long row)
public function boolean uf_ismodified (long row, string dwoname, string data, string as_cols)
public function string uf_update (boolean a, boolean c)
public subroutine uf_savesize (integer ai_type)
public subroutine uf_clicksort (string as_dwoname)
public function long uf_deleterow ()
public function long uf_retrieveyield ()
public function string uf_setstyle (integer ai_style)
public function long uf_rowsdiscard ()
public function integer uf_settext (long al_row, string as_columname, string as_text)
public subroutine uf_setmodify (boolean ab_modify)
public subroutine uf_intialvar ()
public function integer uf_selectrow_new (long newrow, string as_dwoname)
public subroutine uf_scrolltorow (long row, long newrow)
public function integer uf_selectcell (long newrow, string as_dwoname)
public function integer uf_selectrow_dif (long newrow, string as_dwoname)
public function integer uf_selectrow (long newrow, string as_dwoname)
public function integer uf_post (string as_varname, integer ai_value)
public function integer uf_selectrow (long row,boolean ab_select)
end prototypes

event ue_dwnkey;string ls_text,ls_selected
long l_newrow,l_getpage //当前行所在页
long l_lastpage	//最后行所在页
long l_currentpage	//当前显示页
long l_diffpage,i
int l_arrow
string ls_cols[],ls_lastdwoname
long l_pos
//message.Processed=true
//messagebox('dwn',message.number)

setredraw(false)

if keyflags=2 then 
	if keydown(keyc!) then
		
	elseif keydown(keyv!) then

	elseif key=keyE! then
		ls_text=u_dd.uf_selectedtext(this)
		::clipboard(ls_text)
	elseif key=keyR! then
		if ib_modified=false then return 
//		u_dd.setattribs(this,is_columns,'tabsequence','1')
		modify("datawindow.readonly='no' ")
		u_dd.uf_settexts(this,::clipboard())
//		modify("datawindow.readonly='yes' ")
//		u_dd.setattribs(this,is_columns,'tabsequence','0')
	elseif key=keyA! and ib_mulineselect then 
		selectrow(0,true)
	end if
end if


choose case key
	case KeyDownArrow!
		if keyflags=1 then
			if il_lastrow2<>rowcount() then 
				l_newrow=il_lastrow2 + 1
				uf_scrolltorow(il_lastrow2,l_newrow)
				if ib_mulineselect then uf_selectrow(l_newrow,is_lastdwoname)
				if ib_mulcellselect then 
					if is_lastselected='' then 
						ls_lastdwoname=is_lastdwoname
					else
						ls_lastdwoname=mid(is_lastselected,lastpos(is_lastselected,'/') + 1)
					end if
					uf_selectcell(l_newrow,ls_lastdwoname)
				end if
			end if
		else
			if getrow()<>rowcount() then 			
				l_newrow=getrow() + 1
				scrolltorow(l_newrow)
			end if
		end if
		i_lastdo=i_DAdoing
	case KeyUpArrow!
		if keyflags=1 then 
			if il_lastrow2<>1 then 
				l_newrow=il_lastrow2 - 1
				uf_scrolltorow(il_lastrow2,l_newrow)
				if ib_mulineselect then uf_selectrow(l_newrow,is_lastdwoname)
				if ib_mulcellselect then 
					if is_lastselected='' then 
						ls_lastdwoname=is_lastdwoname
					else
						ls_lastdwoname=mid(is_lastselected,lastpos(is_lastselected,'/') + 1)
					end if
					uf_selectcell(l_newrow,ls_lastdwoname)
				end if
			end if
		else
			if getrow()<>1 then 
				l_newrow=getrow() - 1
				ScrollToRow(l_newrow)
			end if
		end if
		i_lastdo=i_UAdoing
	case KeyPageDown!
		
			if keyflags=1 then 
				if il_lastrow2<>rowcount() then 
					l_newrow=il_lastrow2 + (long(object.datawindow.lastRowOnPage) - long(object.datawindow.firstRowOnPage) + 1)
					if l_newrow>rowcount() then l_newrow=rowcount()
					uf_scrolltorow(il_lastrow2,l_newrow)
					if ib_mulineselect then uf_selectrow(l_newrow,is_lastdwoname)
					if ib_mulcellselect then 
						if is_lastselected='' then 
							ls_lastdwoname=is_lastdwoname
						else
							ls_lastdwoname=mid(is_lastselected,lastpos(is_lastselected,'/') + 1)
						end if
						uf_selectcell(l_newrow,ls_lastdwoname)
					end if
				end if
			else
				if getrow()<>rowcount() then 
					l_newrow=getrow() + (long(object.datawindow.lastRowOnPage) - long(object.datawindow.firstRowOnPage) + 1)
					if l_newrow>rowcount() then l_newrow=rowcount()
					ScrollToRow(l_newrow)
				end if
			end if
			
		i_lastdo=i_PDdoing
	case KeyPageUP!
		
		if keyflags=1 then 
			if il_lastrow2<>1 then 
				l_newrow=il_lastrow2 - (long(object.datawindow.lastRowOnPage) - long(object.datawindow.firstRowOnPage) + 1)
				if l_newrow<1 then l_newrow=1
				uf_scrolltorow(il_lastrow2,l_newrow)
				if ib_mulineselect then uf_selectrow(l_newrow,is_lastdwoname)
				if ib_mulcellselect then 
					if is_lastselected='' then 
						ls_lastdwoname=is_lastdwoname
					else
						ls_lastdwoname=mid(is_lastselected,lastpos(is_lastselected,'/') + 1)
					end if
					uf_selectcell(l_newrow,ls_lastdwoname)
				end if
			end if
		else
			if getrow()<>1 then 
				l_newrow=getrow() - (long(object.datawindow.lastRowOnPage) - long(object.datawindow.firstRowOnPage) + 1)
				if l_newrow<1 then l_newrow=1
				ScrollToRow(l_newrow)
			end if
		end if
		i_lastdo=i_PUdoing
		
	case KeyLeftArrow!
		
		if ib_mulcellselect then 
			if keydown(keyshift!) then 
				if is_lastselected='' then 
					ls_lastdwoname=is_lastdwoname
				else
					ls_lastdwoname=mid(is_lastselected,lastpos(is_lastselected,'/') + 1)
				end if
				
				ls_cols[]=u_dd.getcolumns(this,0)
				for i=1 to upperbound(ls_cols[])
					if ls_cols[i]=ls_lastdwoname and i<>1 then 
						ls_lastdwoname=ls_cols[i - 1]
						exit
					end if
				next

				uf_selectcell(il_lastrow2,ls_lastdwoname)
				
			else
				ls_cols[]=u_dd.getcolumns(this,0)
				for i=1 to upperbound(ls_cols[])
					if ls_cols[i]=is_lastdwoname and i<>1 then 
						is_lastdwoname=ls_cols[i - 1]
						exit
					end if
				next
				uf_selectcell(getrow(),is_lastdwoname)
			end if
		end if
		
	case KeyRightArrow!
		if ib_mulcellselect then 
			if keydown(keyshift!) then 
				if is_lastselected='' then 
					ls_lastdwoname=is_lastdwoname
				else
					ls_lastdwoname=mid(is_lastselected,lastpos(is_lastselected,'/') + 1)
				end if
				
				ls_cols[]=u_dd.getcolumns(this,0)
				for i=1 to upperbound(ls_cols[])
					if ls_cols[i]=ls_lastdwoname and i<>upperbound(ls_cols[]) then 
						ls_lastdwoname=ls_cols[i +1]
						exit
					end if
				next
				
				uf_selectcell(il_lastrow2,ls_lastdwoname)
				
			else
				ls_cols[]=u_dd.getcolumns(this,0)
				for i=1 to upperbound(ls_cols[])
					if ls_cols[i]=is_lastdwoname and i<>upperbound(ls_cols[]) then 
						is_lastdwoname=ls_cols[i + 1]
						exit
					end if
				next
				
				uf_selectcell(getrow(),is_lastdwoname)
			end if
		end if
	
end choose


//e:
post uf_post('lastdo',0)//恢复最后动作
//post 
setredraw(true)



end event

event type long ue_mouseleave();//if ib_LBdown and keydown(keyleftbutton!) then triggerevent ("ue_lbup")
return 0
end event

event parentresize(long newwidth, long newheight);//父对象改变大小时,需要程序触发

long l_diffwidth,l_diffheight
dec ld_perwidth,ld_perheight

//父对象resize标记
i_resizetype=1

//等差
l_diffwidth=newwidth - il_parentwidth
l_diffheight=newheight - il_parentheight

if xed and yed then 
	move(x0+l_diffwidth,y0+l_diffheight)
elseif xed then 
	x=x0+l_diffwidth
elseif yed then 
	Y=y0+l_diffheight
end if

if widthed and heighted then 
	resize(width0+l_diffwidth,height0+l_diffheight)
elseif widthed then 
	width=width0+l_diffwidth
elseif heighted then 
	height=height0+l_diffheight
end if

//等比
if il_parentwidth=0 then 
	ld_perwidth=0
else
	ld_perwidth=newwidth / il_parentwidth
end if

if il_parentheight=0 then 
	ld_perheight=0
else
	ld_perheight=newheight / il_parentheight
end if

if xer and yer then 
	move(x0 * ld_perwidth,y0 * ld_perheight)
elseif xer then 
	x=x0 * ld_perwidth
elseif yer then 
	Y=y0 * ld_perheight
end if

if widther and heighter then 
	resize(width0 * ld_perwidth,height0 * ld_perheight)
elseif widther then 
	width=width0 * ld_perwidth
elseif heighter then 
	height=height0 * ld_perheight
end if

//父对象resize标识还原
i_resizetype=0

//if xed then x=x0+l_diffwidth
//if yed then Y=y0+l_diffheight
//if widthed then width=width0+l_diffwidth
//if heighted then height=height0+l_diffheight


//choose case i_sizetype
//	case 0 
//		
//	case 1	//宽度等差
//		width=width0+l_diffwidth
//	case 2	//宽度等差
//		height=height0+l_diffheight
//	case 3	//宽/高等差
//		width=width0+l_diffwidth
//		height=height0+l_diffheight
//	case 4	//X等差
//		x=x0+l_diffwidth
//	case 5	//Y等差
//		Y=y0+l_diffheight
//	case 6	//XY等差
//		x=x0+l_diffwidth
//		Y=y0+l_diffheight
//	case 7	//X,高等差
//		x=x0+l_diffwidth
//		height=height0+l_diffheight
//	case 8	//Y,宽等差
//		Y=y0+l_diffheight
//		width=width0+l_diffwidth
//		
//end choose

end event

event ue_move;//保存位置
if i_resizetype=0 then uf_savesize(2)

end event

event ue_dwnmousemove;string ls_dwoname

ls_dwoname=string(dwo.name)

if ib_lbdown and keydown(keyleftbutton!) and row>0 and ls_dwoname<>'datawindow' then
	
	if il_mouserow=row and is_mousedwo=ls_dwoname then return 
	
	if row<>il_mouserow then 
		ib_rowdrag=true
		ib_celldrag=true
		il_mouserow=row
		is_mousedwo=ls_dwoname
	elseif ls_dwoname<>is_lastdwoname then
		ib_celldrag=true
		il_mouserow=row
		is_mousedwo=ls_dwoname
	end if
	
//	if keydown(keyleftbutton!)  then messagebox('',ib_celldrag)
	
	if (ib_rowdrag=true and ((ib_mulineselect and (is_lastdwoname='cp_rowno' or is_lastdwoname='cp_check') ) or ib_mulcellselect) ) &
		or (ib_celldrag=true and ib_mulcellselect) then
		setredraw(false)
		if ib_rowdrag then 
				if ib_mulineselect=true and (is_lastdwoname='cp_rowno' or is_lastdwoname='cp_check') then uf_selectrow(row,is_lastdwoname)
				if ib_mulcellselect=true then uf_selectcell(row,ls_dwoname)
		elseif ib_celldrag=true and ib_mulcellselect=true then
			uf_selectcell(row,ls_dwoname)
		end if
		setredraw(true)
	end if	
	
end if


end event

event ue_rowfocuschanging;if keydown(keyshift!) &
or i_lastdo=i_PUdoing &
or i_lastdo=i_PDdoing  &
or  i_lastdo=i_UAdoing &
or  i_lastdo=i_DAdoing  &
or (i_lastdo=i_LBdoing and is_lastdwoname='datawindow') &
then return 1

return event rowfocuschanging(currentrow,newrow)
end event

event ue_lbup;
il_mouserow=0
ib_lbdown=false
ib_rowdrag=false
ib_celldrag=false

return 0

end event

event ue_itemchanged;
int li_ret

li_ret=event itemchanged(row,dwo,data)

//使用自动新增
if li_ret<>1 and ib_insert then 
	uf_setmodify(ib_modified)
end if 

return li_ret

end event

public function boolean uf_ismodify (long row);int i,l_cols
int l_lastpos
string ls_prop

l_cols=integer(describe("datawindow.column.count"))
for i=1 to l_cols
	ls_prop=u_dd.uf_getprop(this,"#"+string(i)+".protect",row)
	if integer(ls_prop)=0 and integer(describe("#"+string(i)+".tabsequence"))>0 then return true
next
return false
end function

public function boolean uf_ismodified (long row, string dwoname, string data, string as_cols);//参数row指定行号
//dwoname 列名称(可以是#colid)
//data	itemchanged时的gettext()
//判断的可以修改的列(多个列以逗号分隔)

//NewModified!的初始值一直在变

int i,l_colcount,l_colid,i2
string ls_cols[]

u_dd.getarray(as_cols,ls_cols[],',')

data=string(data,'')

//l_colid=integer(describe(dwoname+".id"))
//messagebox('',string(object.data.primary.Original[row,l_colid],'')+'/'+string(object.data.primary.Original[row,l_colid],'')+'/'+string(data,''))
		
if dwoname='' then 
	//非itemchanged时执行
	choose case getitemstatus(row,0,primary!)
		case NotModified!
			return false
		case New!
			return false
		case NewModified!
			if as_cols='' then 
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if string(object.data.primary.Original[row,i],'')<>'' then //string(object.data.primary.Current[row,i],'')
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
					if string(object.data.primary.Original[row,i2],'')<>'' then //string(object.data.primary.Current[row,i2],'')
						return true
					end if
				next
			end if
		case DataModified!
			if as_cols='' then
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if getitemstatus(row,i,primary!)=NotModified! then continue;
					if string(object.data.primary.Original[row,i],'')<>string(object.data.primary.Current[row,i],'') then 
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
//					messagebox(ls_cols[i],string(object.data.primary.Original[row,i2],'')<>string(object.data.primary.Current[row,i2],''))
					if getitemstatus(row,i2,primary!)=NotModified! then continue;
					if string(object.data.primary.Original[row,i2],'')<>string(object.data.primary.Current[row,i2],'') then 
						return true
					end if
				next
			end if
	end choose
else
	//itemchanged时执行
	choose case getitemstatus(row,0,primary!)
		case NotModified! 
//			post setitemstatus(row,0,primary!,DataModified!)
			return true
		case New!
//			post setitemstatus(row,0,primary!,NewModified!)
			return true
		case NewModified!
			//当前列是否修改
			if data<>'' then return true
			//取列ID
			l_colid=integer(describe(dwoname+".id"))
			
			if as_cols='' then 
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if i=l_colid then
						continue
					elseif string(object.data.primary.Original[row,i],'')<>'' then //string(object.data.primary.Current[row,i],'')
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
					if i2=l_colid then continue;
					if string(object.data.primary.Original[row,i2],'')<>'' then //string(object.data.primary.Current[row,i2],'')
						return true
					end if
				next
			end if
			//不能将行设置成New!
//			post messagebox('setNew!',setitemstatus(row,0,primary!,New!))
		case DataModified!
			l_colid=integer(describe(dwoname+".id"))
			if as_cols='' then 
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if i=l_colid then
						if string(object.data.primary.Original[row,i],'')<>data then return true
					elseif string(object.data.primary.Original[row,i],'')<>string(object.data.primary.Current[row,i],'') then 
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
					if i2=l_colid then 
						if string(object.data.primary.Original[row,i2],'')<>data then return true
					elseif string(object.data.primary.Original[row,i2],'')<>string(object.data.primary.Current[row,i2],'') then 
						return true
					end if
				next
			end if
			//设置状态会改变item的初始值
//			post messagebox('setNotModified!',setitemstatus(row,0,primary!,NotModified!))
	end choose
	
end if

return false


end function

public function string uf_update (boolean a, boolean c);//拼接SQL保存数据

int li_ret=1
string ls_sql
string ls_errtext,ls_ret

ibb_sql=blob('')
ib_updating=true

if update(a,c)=-1 then 
	ls_errtext="Update Failed!"
	goto e
end if

if len(ibb_sql)=0 then goto e

ls_sql=string(ibb_sql)

execute immediate :ls_sql;

if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	goto e
end if

e:
ib_updating=false
return ls_errtext
end function

public subroutine uf_savesize (integer ai_type);//保存当前大小,位置及父对象的大小

powerobject lparent
window lw
dragobject ldr
x0=x
y0=y

if ai_type=2 then return //移动位置

width0=width
height0=height

lparent=getparent()

if typeof(lparent)=window! then 
	lw=lparent
	il_parentwidth=lw.WorkSpaceWidth()
	il_parentheight=lw.WorkSpaceheight()
else
	ldr=lparent
	il_parentwidth=ldr.Width
	il_parentheight=ldr.height
end if


end subroutine

public subroutine uf_clicksort (string as_dwoname);//单击排序功能,支持+ctrl多列排序

string ls_dwoname,ls_colname,ls_coltype,ls_colid
int li_pos,li_pos2
string ls_sort,ls_str,ls_sort_temp

ls_dwoname=as_dwoname

ls_colname=left(ls_dwoname,len(ls_dwoname) - 2)

ls_coltype=describe(ls_colname+".type")

if (ls_coltype='column' or ls_coltype='compute') then
	
	ls_sort=Describe("DataWindow.Table.Sort")
	
	if ls_sort='?' then ls_sort=''
	
	li_pos=pos(ls_sort,ls_colname+' ')
	
	if li_pos=0 and ls_coltype='column' then 
		ls_colid=describe(ls_colname+".id")
		li_pos=pos(ls_sort,'#'+ls_colid)
		if li_pos>0 then ls_colname='#'+ls_colid
	end if 
	
	if keydown(keycontrol!) then 
	
		if li_pos>0 then 
			ls_sort_temp=trim(mid(ls_sort,1,li_pos - 1))
			li_pos2=pos(ls_sort,',',li_pos + len(ls_colname) + 1)
			if li_pos2=0 then 
				ls_str=mid(ls_sort,li_pos + len(ls_colname)+1)
			else
				ls_str=mid(ls_sort,li_pos + len(ls_colname) + 1,li_pos2 - (li_pos + len(ls_colname) + 1))
				ls_sort_temp+=mid(ls_sort,li_pos2 + 1)
				if ls_sort_temp<>'' then ls_sort_temp+=','
			end if
			
			if left(trim(ls_str),1)='A' then 
				ls_sort_temp+=ls_colname+' D'
			else
				ls_sort_temp+=ls_colname+' A'
			end if
			
		else
			ls_sort_temp=ls_sort
			if ls_sort_temp<>'' then ls_sort_temp+=','
			ls_sort_temp+=ls_colname+' A'
		end if
	else
		if li_pos>0 then 
			if left(trim(mid(ls_sort,li_pos + len(ls_colname)+1)),1)='A' then 
				ls_sort_temp=ls_colname+' D'
			else
				ls_sort_temp=ls_colname+' A'
			end if
		else
			ls_sort_temp=ls_colname+' A'
		end if
	end if
	//进行排序
	setsort(ls_sort_temp)
	setredraw(false)
	sort()
	setredraw(true)
end if
		

end subroutine

public function long uf_deleterow ();
long l_rows,i
string ls_msg
boolean lb_mulineselect

l_rows=long(describe("Evaluate('sum(if(isselected(),1,0))',0)"))

ib_deleting=true
setredraw(false)

if l_rows=0 then 
	deleterow(0)
	l_rows=1
elseif l_rows=1 then 
	deleterow(getselectedrow(0))
	l_rows=1
elseif l_rows>1 then 
	
	if ib_mulineselect=true then 
		lb_mulineselect=ib_mulineselect	//避免删除时触发行多选
		ib_mulineselect=false
	end if
	
	i=getselectedrow(0)
	do 
		deleterow(i)
		i=getselectedrow(i - 1)
	loop  until i=0
	
	if lb_mulineselect=true then ib_mulineselect=true
	
end if
setredraw(true)
ib_deleting=false

return l_rows


end function

public function long uf_retrieveyield ();//if describe("DataWindow.Retrieve.AsNeeded")='no' then ib_retriving=true
long l_rowcount
ib_retriving=true
//异步检索
send(handle(this), 1306, 1, 0)
l_rowcount=rowcount()
ib_retriving=false
return l_rowcount

end function

public function string uf_setstyle (integer ai_style);//设置颜色风格等
string ls_modify,ls_ret
string ls_column[],ls_columns
int i
string ls_errtext

choose case ai_style
	case 1
		ls_modify="DataWindow.color=15790320 datawindow.transparency=0 datawindow.selected.mouse='yes' "
		
		ls_column[]=u_dd.getcolumns(this,0)
		
		for i=1 to upperbound(ls_column[])
			ls_columns+=ls_column[i]+','
		next
		
		ls_modify+="DataWindow.HTMLTable.GenerateCSS='1' "	//保持格式及颜色
		ls_modify+="DataWindow.HTMLTable.Border='0' "	//不要table边框
		ls_modify+="DataWindow.HTMLTable.CellSpacing='0' "	//单元格无间距
		//ls_modify+="DataWindow.HTMLTable.CellPadding='0' "
		//ls_modify+="DataWindow.HTMLTable.NoWrap='0' "
		ls_modify+=u_dd.getattribstring( ls_columns,'Border',"0")
		ls_modify+=u_dd.getattribstring( ls_columns,"Color",'0~tif(isRowModified(),rgb(225,0,0),rgb(0,0,0))' )
		ls_modify+=u_dd.getattribstring( ls_columns,'Y',"0")
		ls_modify+=u_dd.getattribstring( ls_columns,'height',"20~~trowheight() - 0")
		ls_modify+=u_dd.getattribstring( ls_columns,'Background.Color',"16777215~~tif(getrow()=currentrow(),rgb(242,220,219),rgb(255,255,255))")
//		ls_modify+="DataWindow.Grid.Lines='1' "
		
		//行号
		ls_ret=describe("cp_rowno.name")
		if ls_ret='!' then 
			ls_modify+='create compute(band=detail alignment="2" expression="getrow()"border="6" color="0" x="0" y="0" height="20~~trowheight() - 0" width="35" format="[GENERAL]" html.valueishtml="0"  name=cp_rowno visible="1"  font.face="Tahoma" font.height="-9" background.color="67108864" transparency="0" ) '
		else
			ls_modify+='cp_rowno.border="6" cp_rowno.height="20~~trowheight() - 0" cp_rowno.background.color="67108864" ' //15790320
		end if
		ls_errtext=modify(ls_modify)
		
end choose 
return ls_errtext


end function

public function long uf_rowsdiscard ();
long l_rows,i,l_currentrow
string ls_msg

l_rows=long(describe("Evaluate('sum(if(isselected(),1,0))',0)"))
l_currentrow=getrow()
ib_deleting=true
setredraw(false)

if l_rows=0 then 
	RowsDiscard(l_currentrow,1,primary!)
	l_rows=1
elseif l_rows=1 then 
	RowsDiscard(getselectedrow(0),1,primary!)
	l_rows=1
elseif l_rows>1 then 
	i=getselectedrow(0)
	do 
		RowsDiscard(i,i,primary!)
		i=getselectedrow(i - 1)
	loop  until i=0
	
end if
setredraw(true)
ib_deleting=false

return l_rows


end function

public function integer uf_settext (long al_row, string as_columname, string as_text);//返回0为未设值,1成功,-1 为失败

if u_dd.uf_setcell(this,al_row,as_columname)=-1 then goto e
return settext(as_text)

e:
return -1
end function

public subroutine uf_setmodify (boolean ab_modify);long l_rowcount
long l_row

l_rowcount=rowcount()

setredraw(false)

if ab_modify then 
	
	u_dd.setattribs(this,is_columns,'tabsequence','1')
	
	//使用自动新增空行
	if ib_insert then 
		if l_rowcount=0 then 
			insertrow(0)
		else
			l_row=find("isRowNew() and (not isRowModified())",1,l_rowcount)
			if l_row=0 then insertrow(0)
		end if
	end if
else

	u_dd.setattribs(this,is_columns,'tabsequence','0')
	
	//使用自动新增空行
	if ib_insert then 
		if l_rowcount>0 then 
			l_row=find(" isRowNew() and (not isRowModified())",1,rowcount())
			if  l_row>0 then deleterow(l_row)
		end if
	end if
end if

setredraw(true)

ib_modified=ab_modify
end subroutine

public subroutine uf_intialvar ();long l_empty[]
boolean lb_empty[]

i_lastdo=0
is_lastdwoname=''
ib_retriving=false
ib_updating=false	//是否正在使用uf_update保存数据
ib_deleting=false

il_rows[]=l_empty[]
ib_isselect[]=lb_empty[]

is_dberror=''
end subroutine

public function integer uf_selectrow_new (long newrow, string as_dwoname);long l_startrow,currentrow,i,l_oldrow/*原shift结束行号*/,l_rows[]/*临时保存行号*/,l_no/*数组中的序号*/
boolean lb_isselect[] /*临时保存选中标记*/
int li_ret
string ls_dwoname
string ls_dwotype
string ls_dwoband
boolean lb_currentisselect

if as_dwoname='datawindow' then 
//	if newrow>0 then return 1
	return 0
end if

ls_dwoname=as_dwoname
currentrow=getrow()


choose case ls_dwoname
	case 'cp_check_t','cp_rowno_t' //全选
		
		if long(describe("Evaluate('sum(if(isselected(),1,0))',0)"))=rowcount() then
			selectrow(0,false)
		else
			selectrow(0,true)
		end if 
		li_ret=0
	case 'cp_check','cp_rowno'	//选中
		
		if keydown(KeyShift!) then
			
			setredraw(false)
			
			if upperbound(il_rows[])=1  then 		
				if il_rows[1]=newrow then 
					selectrow(newrow,isselected(currentrow)=false)
					ib_isselect[1]=false
				end if
			end if
			
			l_startrow=il_rows[1]
			
			lb_currentisselect=isselected(l_startrow)	//开始行选中状态
			//反选
			for i=1 to upperbound(il_rows[])
				if ib_isselect[i]=true then selectrow(il_rows[i],lb_currentisselect=false)
			next
			
			//重选
			il_rows[]=l_rows[]
			ib_isselect[]=lb_isselect[]
			
			l_no=0
			if newrow>=l_startrow then 
				for i=l_startrow to newrow
					l_no++
					il_rows[l_no]=i
					if IsSelected (i)=lb_currentisselect then 
						ib_isselect[l_no]=false
					else
						selectrow(i,lb_currentisselect)
						ib_isselect[l_no]=true
					end if
				next
			else
				for i=l_startrow to newrow step -1
					l_no++
					il_rows[l_no]=i
					if IsSelected (i)=lb_currentisselect then 
						ib_isselect[l_no]=false
					else
						selectrow(i,lb_currentisselect)
						ib_isselect[l_no]=true
					end if
				next
			end if
			
			setredraw(true)
			li_ret=1
		elseif keydown(KeyControl!)  then
			
			if isselected(newrow)then
				selectrow(newrow,false)
			else
				selectrow(newrow,true)
			end if
			li_ret=0
		else
			
			if ls_dwoname="cp_check" then 
				if isselected(newrow)then
					selectrow(newrow,false)
				else
					selectrow(newrow,true)
				end if
			else
				if describe("cp_check.name")='!' then selectrow(0,false)
				if IsSelected (newrow)=false then selectrow(newrow,true )
			end if
			li_ret=0
			
		end if
	case else	//取消选中
		if describe("cp_check.name")='!' then selectrow(0,false)
		li_ret=0
end choose

if li_ret<>1 then 
	il_rows[]=l_rows[]
	ib_isselect[]=lb_isselect[]

	il_rows[1]=newrow
	ib_isselect[1]=false

end if



return li_ret
end function

public subroutine uf_scrolltorow (long row, long newrow);//滚动至指定行,但不setrow
//类似excel滚动行

long l_showpage
long l_newpage
long l_diffpage
int li_diffrow
long l_firstrow,l_lastrow
int l_arrow
long i

l_firstrow=long(object.datawindow.firstRowOnPage)
l_lastrow=long(object.datawindow.lastRowOnPage)

if (newrow>=l_firstrow and newrow<=l_lastrow) then //当前页
	return
elseif newrow>row and newrow=l_lastrow + 1 then //末行 + 1
	send(handle(this),277,1,0)
elseif newrow<row and newrow=l_firstrow - 1 then //首行 - 1
	send(handle(this),277,0,0)
else
	
	if (row>=l_firstrow and row<=l_lastrow) then //翻页
		
		if newrow>row then //下翻页
			l_arrow=3
		else	//上翻页
			l_arrow=2
		end if
		send(handle(this),277,l_arrow,0)

	else
		
		l_showpage=long(describe("evaluate('page()',"+string(l_firstrow)+")"))	//当前显示页
		l_newpage=long(describe("evaluate('page()',"+string(newrow)+")"))	//新行所在页
		l_diffpage=l_newpage - l_showpage
		if l_diffpage>=1 then //下翻
			l_arrow=3
		elseif l_diffpage<=-1 then //上翻
			l_arrow=2
		end if
		
		//翻多页
		for i=1 to abs(l_diffpage)
			send(handle(this),277,l_arrow,0)
		next
		
		//向上则为显示页最后一行,下则为显示页的首行
		l_firstrow=long(object.datawindow.firstRowOnPage)	//新页首行
		l_lastrow=long(object.datawindow.lastRowOnPage)	//新页末行
		
		if newrow>row then //下翻
			li_diffrow=newrow - l_firstrow
			l_arrow=1
		else //上翻
			li_diffrow=l_lastrow - newrow
			l_arrow=0
		end if
		
		//翻多行
		for i=1 to abs(li_diffrow)
			send(handle(this),277,l_arrow,0)
		next
		
	end if
	
end if
	



end subroutine

public function integer uf_selectcell (long newrow, string as_dwoname);string ls_lastselected[],ls_cols[]
string ls_selected,ls_select
int li_ret,li_startcol,li_endcol
long l_pos,l_startrow,l_endrow,i
string ls_startdwoname,ls_enddwoname

ls_selected=trim(describe("datawindow.selected"))

if as_dwoname='datawindow' or newrow=0 or as_dwoname='' then 
	return 0
end if

if keydown(KeyShift!) or ib_celldrag then
	l_pos=lastpos(ls_selected,';')
	if l_pos=0 then 
		ls_selected=''
	else
		ls_selected=mid(ls_selected,1,l_pos)
	end if
	
	if is_lastselected='' then is_lastselected=string(newrow)+'/'+string(newrow)+'/'+as_dwoname
	
	u_dd.getarray(is_lastselected,ls_lastselected[],'/')
	l_startrow=long(ls_lastselected[1])
	
	ls_startdwoname=ls_lastselected[3]
	
	ls_cols[]=u_dd.getcolumns(this,0)
	
	for i=1 to upperbound(ls_cols[])
		if ls_cols[i]=ls_startdwoname then li_startcol=i
		if ls_cols[i]=as_dwoname then li_endcol=i
	next
	
	ls_select=string(l_startrow)+'/'+string(newrow)
	
	if li_startcol<=li_endcol then 
		for i=li_startcol to li_endcol
			ls_select+='/'+ls_cols[i]
		next
	else
		for i=li_startcol to li_endcol step -1
			ls_select+='/'+ls_cols[i]
		next
	end if

	li_ret=1
elseif keydown(KeyControl!)  then
	ls_select=string(newrow)+'/'+string(newrow)+'/'+as_dwoname
else
	ls_selected=''
	ls_select=string(newrow)+'/'+string(newrow)+'/'+as_dwoname
end if

if ls_selected<>'' then 
	ls_selected+=';'
end if

is_lastselected=ls_select

//messagebox('',ls_select)
post modify("datawindow.selected='"+ls_selected+ls_select+"' ")

return li_ret

end function

public function integer uf_selectrow_dif (long newrow, string as_dwoname);long l_startrow,currentrow,i,l_oldrow/*原shift结束行号*/,l_rows[]/*临时保存行号*/,l_no/*数组中的序号*/
boolean lb_isselect[] /*临时保存选中标记*/
int li_ret
string ls_dwotype
string ls_dwoband
boolean lb_currentisselect
string ls_selected,ls_selected_new
string ls_lastdwoname,ls_lastselected
long l_lastrow,l_pos

if as_dwoname='datawindow' then 
//	if newrow>0 then return 1
	return 0
end if

currentrow=getrow()

choose case as_dwoname
	case 'cp_check_t','cp_rowno_t' //全选
		if long(describe("evaluate('sum(if(isselected(),1,0))',0)"))=rowcount() then
			selectrow(0,false)
		else
			selectrow(0,true)
		end if 
		li_ret=0
	case 'cp_check','cp_rowno'	//选中
		
		if keydown(KeyShift!) then
			
			//复杂,增量选中
			
			//判断是否是首次shift点击
			if upperbound(il_rows[])>0 then l_oldrow=il_rows[upperbound(il_rows[])]
			
			//非首次shift点击,且全大于当前行
			if l_oldrow>0 and l_oldrow>=currentrow and newrow>=currentrow then //原结束行>当前行 新结束行>当前行 
				if newrow>=l_oldrow then //新结束行>原结束行	数组增加	行增加
					
					for i=l_oldrow + 1 to newrow
						
						l_no=i - currentrow + 1
						if IsSelected (i)=true then 
							ib_isselect[l_no]=false
						else
							selectrow(i,true)
							ib_isselect[l_no]=true
						end if
						il_rows[l_no]=i
					next
				else //新结束行<原结束行	数组重置	行减少
					
					l_no=0
					for i=currentrow to newrow
						
						l_no=i - currentrow + 1
						l_rows[l_no]=il_rows[l_no]
						lb_isselect[l_no]=ib_isselect[l_no]
					next
					
					for i=i  to l_oldrow
						
						l_no=i - currentrow + 1
						if ib_isselect[l_no]=false then continue;
						selectrow(il_rows[l_no],false)
					next
					
					il_rows[]=l_rows[]
					ib_isselect[]=lb_isselect[]
					
				end if
			elseif l_oldrow>0 and l_oldrow<=currentrow and newrow<=currentrow then //非首次shift点击,且全小于当前行,原结束行<当前行 新结束行<当前行
				if newrow<=l_oldrow then //新结束行<原结束行	数组增加	行增加
					
					for i=l_oldrow - 1 to newrow step -1
						
						l_no=currentrow - i + 1
						if IsSelected (i)=true then 
							ib_isselect[l_no]=false
						else
							selectrow(i,true)
							ib_isselect[l_no]=true
						end if
						il_rows[l_no]=i
					next
					
				else //新结束行>原结束行	数组重置	行减少
					
					for i=currentrow to newrow step -1
						
						l_no=currentrow - i + 1
						l_rows[l_no]=il_rows[l_no]
						lb_isselect[l_no]=ib_isselect[l_no]
					next
					
					for i=i  to l_oldrow step -1
						
						l_no=currentrow - i + 1
						if ib_isselect[l_no]=false then continue;
						selectrow(il_rows[l_no],false)
					next
					
					il_rows[]=l_rows[]
					ib_isselect[]=lb_isselect[]
					
				end if
			else
				
				if newrow>=currentrow then
					
					if l_oldrow<>0 then //非首次shift点击,且与当前行一大一小
					
						for i=l_oldrow to currentrow
							
							l_no=currentrow - i + 1
							
							if ib_isselect[l_no]=true then selectrow(i,false)
						next
						
					end if
					
					il_rows[]=l_rows[]
					ib_isselect[]=lb_isselect[]
					
					for i=currentrow to newrow
						
						l_no=i - currentrow + 1
						if IsSelected (i)=true then 
							ib_isselect[l_no]=false
						else
							selectrow(i,true)
							ib_isselect[l_no]=true
						end if
						il_rows[l_no]=i
					next
					
				else
					
					if l_oldrow<>0 then //非首次shift点击,且与当前行一大一小
						for i=l_oldrow to currentrow  step -1
							
							l_no=i - currentrow + 1
							if ib_isselect[l_no]=true then selectrow(i,false)
						next
					end if
					
					il_rows[]=l_rows[]
					ib_isselect[]=lb_isselect[]
					
					for i=currentrow to newrow step -1
						
						l_no=currentrow - i + 1
						if IsSelected (i)=true then 
							ib_isselect[l_no]=false
						else
							selectrow(i,true)
							ib_isselect[l_no]=true
						end if
						il_rows[l_no]=i
					next
				end if
				
			end if
			
			li_ret=1
		elseif keydown(KeyControl!)  then
			
			if isselected(newrow)then
				selectrow(newrow,false)
			else
				selectrow(newrow,true)
			end if
			li_ret=0
		else
			
			if as_dwoname="cp_check" then 
				if isselected(newrow)then
					selectrow(newrow,false)
				else
					selectrow(newrow,true)
				end if
			else
				if describe("cp_check.name")='!' then selectrow(0,false)
				if IsSelected (newrow)=false then selectrow(newrow,true )
			end if
			li_ret=0
			
		end if
	case else	//取消选中
		if describe("cp_check.name")='!' then selectrow(0,false)		
		li_ret=0
end choose

if li_ret=1 then 
	
else
	il_rows[]=l_rows[]
	ib_isselect[]=lb_isselect[]
end if

il_lastrow2=newrow

return li_ret
end function

public function integer uf_selectrow (long newrow, string as_dwoname);long l_startrow,currentrow,i,l_oldrow/*原shift结束行号*/,l_rows[]/*临时保存行号*/,l_no/*数组中的序号*/
boolean lb_isselect[] /*临时保存选中标记*/
int li_ret
string ls_dwoname
string ls_dwotype
string ls_dwoband
boolean lb_currentisselect

if as_dwoname='datawindow' then 
//	if newrow>0 then return 1
	return 0
end if

setredraw(false)

ls_dwoname=as_dwoname
currentrow=getrow()


choose case ls_dwoname
	case 'cp_check_t','cp_rowno_t' //全选
		
		if long(describe("evaluate('sum(if(isselected(),1,0))',0)"))=rowcount() then
			selectrow(0,false)
		else
			selectrow(0,true)
		end if 
		li_ret=0
	case 'cp_check','cp_rowno'	//选中		
		if (keydown(KeyControl!) or is_lastdwoname='cp_check') and ib_rowdrag=true then
			
			/*保留shift前的选中记录(以下两种方式)*/
			//简单,重新选中
			for i=1 to upperbound(il_rows[])
				selectrow(il_rows[i],isselected(il_rows[i])=false)
			next
			
			il_rows[]=l_rows[]
			
			if newrow>=currentrow then
				for i=currentrow + 1 to newrow
					selectrow(i,isselected(i)=false)
					il_rows[upperbound(il_rows[]) + 1]=i
				next
			else
				for i=currentrow - 1 to newrow step -1
					selectrow(i,isselected(i)=false)
					il_rows[upperbound(il_rows[]) + 1]=i
				next
			end if
			
			li_ret=1
		elseif keydown(KeyShift!) or ib_rowdrag=true then
			
			/*保留shift前的选中记录(以下两种方式)*/
			//简单,重新选中
			for i=1 to upperbound(il_rows[])
				selectrow(il_rows[i],false)
			next
			
			il_rows[]=l_rows[]
			
			if newrow>=currentrow then
				for i=currentrow to newrow
					if IsSelected (i)=false then 
						selectrow(i,true)
						il_rows[upperbound(il_rows[]) + 1]=i
					end if
				next
			else
				for i=currentrow to newrow step -1
					if IsSelected (i)=false then 
						selectrow(i,true)
						il_rows[upperbound(il_rows[]) + 1]=i
					end if
				next
			end if
			
			li_ret=1
		elseif keydown(KeyControl!)  then
			
			if isselected(newrow)then
				selectrow(newrow,false)
			else
				selectrow(newrow,true)
			end if
			li_ret=0
		
		else
			if describe("cp_check.name")='!' then selectrow(0,false)
			if i_lastdo=i_LBdoing then 
				if isselected(newrow)then
					selectrow(newrow,false)
				else
					selectrow(newrow,true)
				end if
			else
				
				if ls_dwoname='cp_rowno' and IsSelected (newrow)=false then selectrow(newrow,true )
			end if
			li_ret=0
			
		end if
	case else	//取消选中
		if describe("cp_check.name")='!' then selectrow(0,false)
		li_ret=0
end choose

if li_ret<>1 then 
	il_rows[]=l_rows[]
	ib_isselect[]=lb_isselect[]
end if

il_lastrow2=newrow

setredraw(true)

return li_ret
end function

public function integer uf_post (string as_varname, integer ai_value);
choose case as_varname
	case 'itemerrored'
		ib_itemerrored=(1=ai_value)
	case 'itemfocuschanged'
		ib_itemfocuschanged=(1=ai_value)
	case 'setrow'
		if ai_value<>getrow() and ib_itemerrored=false then //不<>当前行  
			if accepttext()<>-1 then setrow(ai_value)
		end if
	case 'lastdo'
		i_lastdo=ai_value
end choose

return 0
end function

public function integer uf_selectrow (long row,boolean ab_select);
return SelectRow(row,ab_select)
end function

on udw_runsa_derek_multiselect.create
end on

on udw_runsa_derek_multiselect.destroy
end on

event constructor;powerobject lpo

//查找所属窗口
do 
	lpo=getparent()
loop until typeof(lpo)=window! 

iw_parent=lpo

//保存大小
uf_savesize(0)

settransobject(sqlca)
end event

event rbuttondown;////设置当前行
//if row<>0 and getrow()<>0 and dwo.type='column' then
//	if uf_ismodify(row)=true then 
//		post setrow(row)
//		post setcolumn(string(dwo.name))
//	end if
//end if
if row<>0 and getrow()<>0  and dwo.type='column' then
	if dwo.tabsequence>'0' and (getrow()<>row or getcolumnname()<>string(dwo.name)) then 
		if row<>getrow() then post setrow(row)
		if getcolumnname()<>string(dwo.name) then post setcolumn(string(dwo.name))
	end if
end if
end event

event dberror;is_dberror=sqlerrtext
end event

event sqlpreview;if request=PreviewFunctionUpdate!  then
	if ib_updating then
		ibb_sql+=blob(sqlsyntax+' ~r~n')
		return 2
	end if
end if


end event

event resize;//保存大小,位置及父对象的大小
if i_resizetype=0 then uf_savesize(0)
end event

event clicked;//如果子对象要使用clicked事件并使用多选功能,一定要return AncestorReturnValue
//row=GetClickedRow()

string ls_dwotype
string ls_dwoname

ls_dwotype=string(dwo.type)
ls_dwoname=string(dwo.name)

ib_lbdown=true	//左键在对象上按下
i_lastdo=i_LBdoing	//记录左键按下的瞬间,会脚本结束时post恢复
is_lastdwoname=ls_dwoname	//记录点击的对象名
il_mouserow=row

if row=0 then 
	//行全选
	if ls_dwoname='cp_check_t' or ls_dwoname='cp_rowno_t' then uf_selectrow(row,dwo.name)
else
	
	//行多选
	if keydown(keyshift!) then 
		if ib_mulineselect then uf_selectrow(row,is_lastdwoname)
		if ib_mulcellselect then uf_selectcell(row,is_lastdwoname)
	else
		if row=getrow() then 
			if ib_mulineselect then uf_selectrow(row,is_lastdwoname)
			if ib_mulcellselect then uf_selectcell(row,is_lastdwoname)
		elseif row<>0 and (ls_dwotype='compute' or ls_dwotype='column') then 
			post uf_post('setrow',row)
		end if
	end if
	
end if

//恢复最后动作
post uf_post('lastdo',0)//恢复最后动作




end event

event doubleclicked;string ls_dwoname

//点击标题排序
if ib_clicksort then
	ls_dwoname=string(dwo.name)
	if ls_dwoname<>'cp_check_t' and ls_dwoname<>'cp_rowno_t' then 	//非行号或勾选框
		uf_clicksort(ls_dwoname)
	end if
end if
end event

event rowfocuschanged;if ib_mulineselect then uf_selectrow(currentrow,is_lastdwoname)


end event

event other;if message.number=675 then triggerevent("ue_mouseleave")
//if message.number=273 then 
//	message.Processed=true
//	messagebox(string(wparam)+'/'+string(lparam),message.number)
//end if
//if keydown(keyb!) then messagebox(string(wparam)+'/'+string(lparam),message.number)
//if keydown(keyc!) then messagebox(string(wparam)+'/'+string(lparam),message.number)
//if keydown(keyd!) then messagebox(string(wparam)+'/'+string(lparam),message.number)
end event

event itemfocuschanged;if ib_mulcellselect then uf_selectcell(row,is_lastdwoname)
end event

event losefocus;if ib_LBdown and keydown(keyleftbutton!) then triggerevent ("ue_lbup")
end event

event itemerror;ib_itemerrored=true
//messagebox('',ib_itemerrored)
post uf_post('itemerrored',0)
messagebox('','数据:~r~n'+string(data,'')+"~r~n未通过验证!")
return 1
end event

