$PBExportHeader$w_sort.srw
forward
global type w_sort from w_window
end type
type pb_cancel from uo_button within w_sort
end type
type pb_ok from uo_button within w_sort
end type
type pb_delete from uo_button within w_sort
end type
type sle_cusname from uo_derek_sle within w_sort
end type
type st_1 from uo_derek_st within w_sort
end type
type sle_cusno from uo_derek_sle within w_sort
end type
type dw_1 from uo_datawindow_grid within w_sort
end type
type ds_temp from datastore within w_sort
end type
type iu_dd from u_derek_v2_dd within w_sort
end type
end forward

global type w_sort from w_window
integer width = 1376
integer height = 1216
string title = "高级排序"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "DataWindow5!"
pb_cancel pb_cancel
pb_ok pb_ok
pb_delete pb_delete
sle_cusname sle_cusname
st_1 st_1
sle_cusno sle_cusno
dw_1 dw_1
ds_temp ds_temp
iu_dd iu_dd
end type
global w_sort w_sort

type variables

string i_message
boolean ib_checkrow=true
s_condition_parm i_condition_parm
datawindow idw_1
boolean lb_subtotal
string is_column[],is_groupby
long i_colcount,i_groupbycount
end variables

forward prototypes
public function boolean uf_setmodify (boolean lb_value)
public subroutine uf_control_pos ()
public function integer wf_savemsg ()
public function integer uf_button_enable ()
end prototypes

public function boolean uf_setmodify (boolean lb_value);//boolean lb_unvalue
//string ls_modify,ls_ret,ls_errtext
//
//if dw_1.describe('datawindow.querymode')='yes' then return false
//
//lb_unvalue=(lb_value=false)
//
//dw_1.event ue_setfields('update',gu_fun.getarray(is_dwupdate_detail,',',0))
//dw_1.event ue_setfields('notnull',gu_fun.getarray(is_dwnotnull_detail,',',0))
//dw_1.event ue_setfields('unique',gu_fun.getarray(is_dwunique_detail,',',0))
//
//if dw_1.event ue_setmodify(lb_value)=-1 then goto e
//
//pb_modify.enabled=lb_unvalue
//pb_add.enabled=lb_value
//pb_delete.enabled=lb_value
//pb_save.enabled=lb_value
//pb_cancel.enabled=lb_value
//pb_ok.enabled=lb_unvalue
//pb_exit.enabled=lb_unvalue
//
////自动新增行,会访问pb_add.enabled属性
//dw_1.event ue_newrow(lb_value)
//
return true
//
//goto e
//e:
//if ls_errtext<>'' then 
//	f_messagebox('',ls_errtext)
//end if
//return false
//
end function

public subroutine uf_control_pos ();int li_marginx,li_marginy,li_xpixel,li_ypixel
int li_width,li_height
int li_y

setredraw(false)

li_xpixel=pixelstounits(1,XPixelsToUnits!)
li_ypixel=pixelstounits(1,YPixelsToUnits!)

li_marginx=pixelstounits(5,XPixelsToUnits!)
li_marginy=pixelstounits(5,YPixelsToUnits!)
li_width=workspacewidth()
li_height=workspaceheight()

li_y=li_marginy

pb_ok.y=li_y
pb_delete.y=li_y
pb_cancel.y=li_y

li_y+=pb_ok.height+li_marginy

dw_1.move(li_marginx,li_y)
dw_1.resize(li_width - (2*li_marginx), li_height - dw_1.y - li_marginy)

hscrollbar=false
vscrollbar=false

setredraw(true)
end subroutine

public function integer wf_savemsg ();//int li_ret
//string ls_errtext
//boolean lb_wait
//long l_row,l_row2
////lb_wait=isvalid(w_wait)
//if not(pb_save.enabled=true and pb_save.visible=true) then return 0
//
////if dw_1.accepttext()=-1 then goto e
////if dw_2.accepttext()=-1 then goto e
//
////l_row=dw_1.getrow()
////l_row2=dw_2.getrow()
//
////ls_errtext=dw_1.event ue_checknull(l_row)
////if ls_errtext<>'' then goto e
////ls_errtext=dw_2.event ue_checknull(l_row2)
////if ls_errtext<>'' then goto e
//
////if dw_1.ModifiedCount()=0 and dw_1.DeletedCount ( )=0 &
////	and dw_2.ModifiedCount()=0 and dw_2.DeletedCount ( )=0 then return 0
//
//li_ret=f_messagebox(title,'是否自动保存?',3,3)
//if li_ret=1 then 
//	if pb_save.event clicked()=-1 then goto e //自动保存
	return 1
//elseif li_ret=2 then
//	return 2
//end if
//
//e:
//if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
//rollback;
//if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
//if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
////if lb_wait=false then u_derek.closewait()
//return -1
end function

public function integer uf_button_enable ();//
return 0
end function

on w_sort.create
int iCurrent
call super::create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.pb_delete=create pb_delete
this.sle_cusname=create sle_cusname
this.st_1=create st_1
this.sle_cusno=create sle_cusno
this.dw_1=create dw_1
this.ds_temp=create ds_temp
this.iu_dd=create iu_dd
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_cancel
this.Control[iCurrent+2]=this.pb_ok
this.Control[iCurrent+3]=this.pb_delete
this.Control[iCurrent+4]=this.sle_cusname
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.sle_cusno
this.Control[iCurrent+7]=this.dw_1
end on

on w_sort.destroy
call super::destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.pb_delete)
destroy(this.sle_cusname)
destroy(this.st_1)
destroy(this.sle_cusno)
destroy(this.dw_1)
destroy(this.ds_temp)
destroy(this.iu_dd)
end on

event open;call super::open;idw_1=message.powerobjectparm

string ls_msgtitle,ls_errtext,ls_msgbox='1',ls_ret
boolean lb_wait
lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent
long l_count,i,l_ret,l_pos,l_sortcount
l_count=gu_dd.getcolumns(idw_1,0,is_column[])
i_colcount=l_count
string ls_values,ls_modify
for i=1 to l_count
	if is_column[i]='cp_rowno' then continue;
	if idw_1.describe(is_column[i]+'.visible')='0' then continue;
	ls_values+=idw_1.describe(is_column[i]+"_t.text")+'~t'+is_column[i]+'/'
	dw_1.insertrow(0)
next

ls_modify="column_name.values='"+ls_values+"' "

long l_height_band1
l_height_band1=long(idw_1.Describe("DataWindow.Trailer.1.Height"))
if l_height_band1>0 then 
	lb_subtotal=true 
else
	lb_subtotal=false
	ls_modify+="subtotal.visible=0 subtotal_t.visible=0 "
end if

ls_ret=dw_1.modify(ls_modify)
if ls_ret<>'' then 
	ls_errtext=ls_ret+ls_modify
	goto e
end if

string ls_sortstring,ls_temparray[],ls_colname
ls_sortstring=idw_1.Describe("DataWindow.Table.Sort")
if ls_sortstring='?' then ls_sortstring=''

l_sortcount=gu_dd.getarray(ls_sortstring,ls_temparray[],',')
if l_sortcount>0 then 
	for i=1 to l_sortcount
		l_pos=pos(ls_temparray[i],' ')
		ls_colname=trim(left(ls_temparray[i],l_pos - 1))
		dw_1.setitem( i,'column_name',ls_colname)
		dw_1.setitem( i,'sort',upper(left(trim(mid(ls_temparray[i],l_pos + 1)),1)))
		if left(idw_1.describe(ls_colname+'.coltype'),4)<>'char' then 
			dw_1.setitem( i,'subtotal','')
		end if
	next
end if

if lb_subtotal=true then 
	string ls_dwsyntax,ls_groupby
	long l_pos2
	
	if idw_1.describe("cp_sum1_rowno.name")='cp_sum1_rowno' then //特殊分组
		ls_groupby=idw_1.describe("cp_sum1_rowno.tag")
		if ls_groupby<>'' then 
			
			long l_row
			i_groupbycount=gu_dd.getarray(ls_groupby,ls_temparray[],"+' '+") //设置逗号分隔,但取出是空格分隔
			if i_groupbycount>0 then 
				for i=1 to i_groupbycount
					ls_ret=ls_temparray[i]
					if isnumber(ls_ret) then continue; //全数字为常数
					l_row=dw_1.find( "column_name='"+ls_ret+"' ",1,i_colcount)
					if l_row<=0 then
						l_sortcount++
						l_row=l_sortcount
						dw_1.setitem( l_row,'column_name',ls_ret)
					end if
					dw_1.setitem(l_row,'subtotal','1')
				next
			end if
			
		end if
	else //通用分组
	
		ls_dwsyntax=idw_1.describe("Datawindow.syntax")
		l_pos=pos(ls_dwsyntax,'~r~ngroup(level=1 ')
		if l_pos=0 then 
			ls_errtext='获取分组失败(1)'
			goto e
		end if
		l_pos=pos(ls_dwsyntax,' by=(',l_pos)
		if l_pos=0 then 
			ls_errtext='获取分组失败(2)'
			goto e
		end if 
		l_pos=l_pos+5
		l_pos2=pos(ls_dwsyntax,')',l_pos+1)
		if l_pos2=0 then 
			ls_errtext='获取分组失败(2)'
			goto e
		end if 
		
		is_groupby=mid(ls_dwsyntax,l_pos,l_pos2 - l_pos - 1)
		i_groupbycount=gu_dd.getarray(is_groupby,ls_temparray[],' ') //设置逗号分隔,但取出是空格分隔
		if i_groupbycount>0 then 
			for i=1 to i_groupbycount
				ls_ret=mid(trim(ls_temparray[i],true),2,len(trim(ls_temparray[i],true)) - 2)
				if isnumber(ls_ret) then continue; //全数字为常数
				l_row=dw_1.find( "column_name='"+ls_ret+"' ",1,i_colcount)
				if l_row<=0 then
					l_sortcount++
					l_row=l_sortcount
					dw_1.setitem( l_row,'column_name',ls_ret)
				end if
				dw_1.setitem(l_row,'subtotal','1')
			next
		end if
	end if
	
end if

return 0
goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
if ls_msgbox='1' and ls_errtext<>'' then 
	rollback;
	if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext+'~r~n'
	if pos(ls_errtext,'~r~n')>0 then ls_errtext+=fill(' ',max(40 - len(ls_errtext),0))
	f_messagebox('',ls_errtext)
end if
return -1
end event

event resize;call super::resize;if sizetype<>1 then  uf_control_pos()
end event

event closequery;call super::closequery;if wf_savemsg()=-1 then return 1

end event

event key;//
//if pb_cancel.enabled=true then 
//	//pb_cancel.event clicked()
//	return 1
//end if
//if pb_cancel.enabled=false then 
//	return 1
//end if
return super::event key(key,keyflags)
end event

event doubleclicked;call super::doubleclicked;w_mdihelp lw_mdiframe 
lw_mdiframe=parentwindow()
if isvalid(lw_mdiframe) then 
	if lw_mdiframe.GetActiveSheet()=this then 
		move(0,0)
		resize(lw_mdiframe.mdi_1.width - 20,lw_mdiframe.mdi_1.height - 16)
	end if
end if
end event

type pb_cancel from uo_button within w_sort
integer x = 622
integer y = 36
integer width = 274
integer height = 104
integer taborder = 120
fontfamily fontfamily = anyfont!
string facename = "宋体"
string text = "取消(&Q)"
alignment htextalign = right!
end type

event clicked;call super::clicked;close(parent)
end event

type pb_ok from uo_button within w_sort
integer x = 320
integer y = 36
integer width = 274
integer height = 104
integer taborder = 20
fontfamily fontfamily = anyfont!
string facename = "宋体"
string text = "确定(&O)"
alignment htextalign = right!
end type

event clicked;call super::clicked;string ls_msgtitle,ls_errtext,ls_msgbox='1',ls_modify1,ls_modify2,ls_ret
boolean lb_wait
lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent
long l_rowcount,l_row,l_pos,l_pos2
string ls_sortstring,ls_groupby
string ls_column_name,ls_sort,ls_subtotal,ls_dwoname
l_rowcount=dw_1.rowcount( )
string ls_dwsyntax
transaction ltrans_temp

for l_row=1 to l_rowcount
	ls_column_name=dw_1.getitemstring(l_row,'column_name')
	ls_sort=dw_1.getitemstring(l_row,'sort')
	if string(ls_column_name,'')='' then continue;
	if string(ls_sort,'')<>'D' then ls_sort='A' ;
	if ls_sortstring<>'' then ls_sortstring+=','
	ls_sortstring+=ls_column_name+' '+ls_sort
	
	if lb_subtotal=true then 
		ls_subtotal=dw_1.getitemstring(l_row,'subtotal')
		ls_dwoname='t_sum1_'+ls_column_name
		if idw_1.describe(ls_dwoname+'.name')=ls_dwoname then
			if string(ls_subtotal,'')='1' then 
				if idw_1.describe("cp_sum1_rowno.name")='cp_sum1_rowno' then //特殊分组
					if ls_groupby<>'' then ls_groupby+="+' '+"	//可空格,可逗号,create后会变成空格
					ls_groupby+=ls_column_name
				else
					if ls_groupby<>'' then ls_groupby+=','	//可空格,可逗号,create后会变成空格
					ls_groupby+='"'+ls_column_name+'"'
				end if
				ls_modify2+= ls_dwoname+ '.text = "~~t lookupdisplay(' + ls_column_name + ')" ' 
			end if
		end if
	end if
next

if lb_subtotal=true then 
	for l_row=1 to l_rowcount
		ls_column_name=is_column[l_row]
		ls_dwoname='t_sum1_'+ls_column_name
		if idw_1.describe(ls_dwoname+'.name')=ls_dwoname then
			ls_modify1+= ls_dwoname+ '.text = "" '
		end if
	next
end if

ls_ret=idw_1.modify(ls_modify1)
if ls_ret<>'' then 
	ls_errtext=ls_ret+ls_modify1
	goto e
end if

if lb_subtotal=true then 
	if idw_1.describe("cp_sum1_rowno.name")='cp_sum1_rowno' then //特殊分组
		if ls_groupby='' then ls_groupby='"1" '
		ls_modify2+="cp_sum1_rowno.tag=~""+ls_groupby+"~" "
	else
		if ls_groupby='' then ls_groupby='"1" '
	
		ls_dwsyntax=idw_1.describe("Datawindow.syntax")
		l_pos=pos(ls_dwsyntax,'~r~ngroup(level=1 ')
		if l_pos=0 then 
			ls_errtext='获取分组失败(1)'
			goto e
		end if
		l_pos=pos(ls_dwsyntax,' by=(',l_pos)
		if l_pos=0 then 
			ls_errtext='获取分组失败(2)'
			goto e
		end if 
		l_pos=l_pos+5
		l_pos2=pos(ls_dwsyntax,')',l_pos+1)
		if l_pos2=0 then 
			ls_errtext='获取分组失败(2)'
			goto e
		end if 
		
		ls_dwsyntax=replace(ls_dwsyntax,l_pos,l_pos2 - l_pos,ls_groupby)
	//	ltrans_temp=create transaction
	//	if idw_1.GetTrans (ltrans_temp)=-1 then 
	//		ls_errtext='GetTrans失败:-1'
	//		goto e
	//	end if
		
		l_rowcount=idw_1.rowcount()
		if l_rowcount>0 then 
			if ds_temp.create(ls_dwsyntax,ls_errtext)=-1 then 
				ls_errtext='ds_temp.Create失败:'+ls_errtext
				goto e
			end if
			ds_temp.object.data=idw_1.object.data
		end if
		
		//下拉数据窗口的值会丢失
		if idw_1.create(ls_dwsyntax,ls_errtext)=-1 then 
			ls_errtext='Create失败:'+ls_errtext
			goto e
		end if
		//idw_1.settransobject(ltrans_temp)
		if l_rowcount>0 then 
			idw_1.object.data=ds_temp.object.data
		end if
		if isvalid(ds_temp)  then destroy ds_temp
	end if
end if

ls_ret=idw_1.modify(ls_modify2)
if ls_ret<>'' then 
	ls_errtext=ls_ret+ls_modify2
	goto e
end if

if ls_sortstring<>'' then 
	idw_1.setsort(ls_sortstring)
	idw_1.sort()
	idw_1.GroupCalc()
end if

if isvalid(ltrans_temp)  then destroy ltrans_temp

close(parent)

return 
goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
if ls_msgbox='1' and ls_errtext<>'' then 
	rollback;
	if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext+'~r~n'
	if pos(ls_errtext,'~r~n')>0 then ls_errtext+=fill(' ',max(40 - len(ls_errtext),0))
	f_messagebox('',ls_errtext,0,0)
end if
if isvalid(ltrans_temp)  then destroy ltrans_temp
if lb_wait=false and isvalid(w_wait) then close(w_wait)
return -1
end event

type pb_delete from uo_button within w_sort
integer x = 18
integer y = 36
integer width = 274
integer height = 104
integer taborder = 10
fontfamily fontfamily = anyfont!
string facename = "宋体"
string text = "删除(&D)"
alignment htextalign = right!
end type

event clicked;call super::clicked;long l_i,l_ret
l_ret=dw_1.uf_deleterow( )

for l_ret=l_ret to 1 step -1
	dw_1.insertrow( 0)
next

end event

type sle_cusname from uo_derek_sle within w_sort
boolean visible = false
integer x = 562
integer y = 216
integer width = 613
integer height = 88
integer taborder = 110
integer textsize = -10
fontcharset fontcharset = gb2312charset!
fontfamily fontfamily = anyfont!
string facename = "宋体"
long backcolor = 67108864
boolean displayonly = true
end type

type st_1 from uo_derek_st within w_sort
boolean visible = false
integer x = 78
integer y = 232
fontcharset fontcharset = gb2312charset!
string facename = "微软雅黑"
string text = "代号:"
end type

type sle_cusno from uo_derek_sle within w_sort
boolean visible = false
integer x = 251
integer y = 216
integer width = 315
integer height = 88
integer taborder = 80
integer textsize = -10
fontcharset fontcharset = gb2312charset!
fontfamily fontfamily = anyfont!
string facename = "宋体"
end type

type dw_1 from uo_datawindow_grid within w_sort
integer x = 18
integer y = 172
integer width = 1326
integer height = 952
integer taborder = 140
string dataobject = "d_sort"
end type

event ue_newrow;////
//long l_rowcount
//long l_row
//
//l_row=getrow()
//l_rowcount=rowcount()
//
//if ab_modify then 
//	
//	//使用自动新增空行
//	if ib_insert then 
//		if l_rowcount=0 then 
//			pb_add.event clicked() //insertrow(0)
//		else
//			l_row=find("isRowNew() and (not isRowModified())",1,l_rowcount)
//			if l_row=0 and pb_add.enabled=true then pb_add.event clicked() //insertrow(0)
//		end if
//	end if
//else
//	
//	//使用自动删除空行
//	if ib_insert then 
//		if l_rowcount>0 then 
//			setredraw(false)
//			do while(1=1)
//				l_row=find("(not isRowModified()) and isRowNew()",1,rowcount())
//				if l_row<=0 then exit
//				if l_row>0 then deleterow(l_row)
//			loop
//			setredraw(true)
//		end if
//	end if
//end if
//
//return
//
//
end event

event doubleclicked;call super::doubleclicked;string ls_dwoname
ls_dwoname=string(dwo.name)

if ls_dwoname<>'cp_rowno' then return 

if row<>getrow() then 
	if setrow(row)=-1 then return 
end if
if row<>getrow() then return 
openwithparm(w_freeform,this)
end event

event rowfocuschanging;call super::rowfocuschanging;//
//string ls_errtext
//
//if pb_save.enabled=false then return 0
//
//if parent.ib_checkrow=false then return 0
//
//if accepttext()=-1 then return 1
//
//ls_errtext=event ue_checknull(currentrow)
//if ls_errtext<>'' then 
//	f_messagebox('',ls_errtext,0,0)
//	return 1
//end if
//
end event

event ue_retrieve;call super::ue_retrieve;return retrieve()
end event

event itemchanged;call super::itemchanged;string ls_dwoname,ls_sum1_name
data=string(data)
ls_dwoname=string(dwo.name)
choose case ls_dwoname
	case 'column_name'
		if data='' then 
			setitem(row,'sort','')
			setitem(row,'subtotal','0')
			goto m
		end if
		if left(idw_1.describe(data+'.coltype'),4)<>'char' then
			setitem(row,'subtotal','')
		else
			setitem(row,'subtotal','0')
		end if
		setitem(row,'sort','A')
end choose

goto m
m:

end event

type ds_temp from datastore within w_sort descriptor "pb_nvo" = "true" 
end type

on ds_temp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ds_temp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

type iu_dd from u_derek_v2_dd within w_sort descriptor "pb_nvo" = "true" 
end type

on iu_dd.create
call super::create
end on

on iu_dd.destroy
call super::destroy
end on

