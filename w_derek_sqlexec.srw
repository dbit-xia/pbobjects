$PBExportHeader$w_derek_sqlexec.srw
forward
global type w_derek_sqlexec from window
end type
type cbx_edit from checkbox within w_derek_sqlexec
end type
type cbx_yield from checkbox within w_derek_sqlexec
end type
type cb_3 from commandbutton within w_derek_sqlexec
end type
type cb_delete from commandbutton within w_derek_sqlexec
end type
type cb_1 from commandbutton within w_derek_sqlexec
end type
type cb_rollback from commandbutton within w_derek_sqlexec
end type
type cb_commit from commandbutton within w_derek_sqlexec
end type
type cbx_autocommit from checkbox within w_derek_sqlexec
end type
type cb_ins from commandbutton within w_derek_sqlexec
end type
type cb_save from commandbutton within w_derek_sqlexec
end type
type dw_result from uo_derek_datawindow within w_derek_sqlexec
end type
type cb_2 from commandbutton within w_derek_sqlexec
end type
type st_split from uo_derek_st_split within w_derek_sqlexec
end type
type rte_sql from uo_derek_rte within w_derek_sqlexec
end type
type cbx_need from checkbox within w_derek_sqlexec
end type
type cb_exec from commandbutton within w_derek_sqlexec
end type
type u_dd from u_derek_v2_dd within w_derek_sqlexec
end type
type u_fun from u_derek_v2_fun within w_derek_sqlexec
end type
type ids_temp from datastore within w_derek_sqlexec
end type
end forward

global type w_derek_sqlexec from window
integer width = 3826
integer height = 2308
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event pbm_command pbm_command
cbx_edit cbx_edit
cbx_yield cbx_yield
cb_3 cb_3
cb_delete cb_delete
cb_1 cb_1
cb_rollback cb_rollback
cb_commit cb_commit
cbx_autocommit cbx_autocommit
cb_ins cb_ins
cb_save cb_save
dw_result dw_result
cb_2 cb_2
st_split st_split
rte_sql rte_sql
cbx_need cbx_need
cb_exec cb_exec
u_dd u_dd
u_fun u_fun
ids_temp ids_temp
end type
global w_derek_sqlexec w_derek_sqlexec

type prototypes
Function long SetWindowLongA(ulong hWnd, int nIndex, long dwNewLong) library "user32"
Function long GetWindowLongA(ulong hWnd, int nIndex) library "user32"
SUBROUTINE mouse_event(uint dwFlags,uint dx, uint dy,uint dwData, ulong dwExtraInfo)  LIBRARY "user32.dll"   ALIAS FOR "mouse_event"

end prototypes

type variables
//u_derek_v2_dd u_dd
//u_derek_v2_fun u_fun
boolean ib_cancel = false

int oldwidth,oldheight

boolean ib_response
window iw_parent



Constant Long GWL_STYLE = -16           //窗口样式
Constant Long WS_SYSMENU = 524288       //带系统菜单的窗口
constant long WS_THICKFRAME=262144	//窗口可以改变大小
Constant Long WS_MINIMIZEBOX = 131072   //创建一个有最小化按扭的窗体。
Constant Long WS_MAXIMIZEBOX = 65536    //创建一个有最大化按扭的窗体。

boolean ib_controlmenu=true	//控制菜单
boolean ib_maxbox=true	//最大化按钮
boolean ib_minbox=true	//最小化按钮
boolean ib_resizable=true	//改变大小


end variables

forward prototypes
public function integer execddl (string as_sql)
public subroutine uf_autofix (powerobject ldw)
public subroutine uf_control_pos ()
end prototypes

public function integer execddl (string as_sql);int li_ret=0
boolean lb_commit

lb_commit=sqlca.autocommit

//执行SQL时是否要自动提交
if cbx_autocommit.checked then sqlca.autocommit=true

execute immediate :as_sql;

if cbx_autocommit.checked then sqlca.autocommit=lb_commit

if sqlca.sqlcode=-1 then li_ret=-1

return li_ret
end function

public subroutine uf_autofix (powerobject ldw);string ls_column[],ls_maxtext[],ls_modify
string ls_editSty,ls_mask,ls_format
long i,l_titlelength[],l_colength[],l_colcount,l_row,l_ret,l_rowcount
//datawindow ldw
//ldw=this
l_colcount=u_dd.getcolumns(ldw,1,ls_column[])
l_rowcount=ldw.dynamic rowcount()

for i=1 to l_colcount
	l_titlelength[i]=lena(string(ldw.dynamic describe(ls_column[i]+'_t.text'))) //lena的参数要先转换成string,否则会计算翻倍
	l_colength[i]=long(ldw.dynamic describe('Evaluate("max(lena(lookupdisplay('+ls_column[i]+')))",0)'))
	
	if l_titlelength[i]>=l_colength[i] then 
		ls_maxtext[i]=ldw.dynamic describe(ls_column[i]+'_t.text')
	else
		l_row=ldw.dynamic find('lena(lookupdisplay('+ls_column[i]+'))='+string(l_colength[i]),1,l_rowcount)
		if l_row>0 then 
			ls_maxtext[i]=ldw.dynamic describe('Evaluate("lookupdisplay('+ls_column[i]+')",'+string(l_row)+')')
		end if
//		ls_editSty =ldw.dynamic Describe(ls_column[i]+".Edit.Style") 
//		if ls_editSty="editmask" then //有掩码 int li_colNum string ls_mask
//			ls_mask =ldw.dynamic Describe(ls_column[i]+".EditMask.Mask")
////			if Left(ldw.dynamic Describe(ls_column[i]+".Coltype"),4)="char" then //字符型掩码 //字符可以转化为数字（直接用string(s,"##")得不到） n_cst_string inv_str
////				ls_mask=u_fun.replace(ls_mask,"#","@")
////			end if
//			ls_maxtext[i]=ldw.dynamic describe('Evaluate("string('+ls_column[i]+',~''+ls_mask+'~')",'+string(l_row)+')')
//			messagebox('',ls_maxtext[i])
//		end if 
		
	end if
	
	u_fun.uf_fontfromdwo(st_split,ldw,ls_column[i])
	
	l_ret=u_fun.uf_textextent(handle(st_split),ls_maxtext[i])
	if l_ret>0 then 
		ls_modify+=ls_column[i]+".width="+string(l_ret + 10)+" "
	end if
	
next

ldw.dynamic modify(ls_modify)
end subroutine

public subroutine uf_control_pos ();
int li_marginx,li_marginy,li_xpixel,li_ypixel
int li_width
int li_y

setredraw(false)

li_xpixel=pixelstounits(1,XPixelsToUnits!)
li_ypixel=pixelstounits(1,YPixelsToUnits!)

li_marginx=pixelstounits(5,XPixelsToUnits!)
li_marginy=pixelstounits(5,YPixelsToUnits!)
li_width=workspacewidth()

li_y=rte_sql.y

rte_sql.move(li_marginx,li_y)
rte_sql.width=li_width - rte_sql.x - li_marginx

li_y+= rte_sql.height 

st_split.move(li_marginx,li_y) 
st_split.resize(rte_sql.width,20) 

li_y+=st_split.height //- li_ypixel

dw_result.move(li_marginx,li_y) 
dw_result.resize(rte_sql.width,workspaceheight() - dw_result.y - li_marginy)

hscrollbar=false
vscrollbar=false

setredraw(true)
end subroutine

on w_derek_sqlexec.create
this.cbx_edit=create cbx_edit
this.cbx_yield=create cbx_yield
this.cb_3=create cb_3
this.cb_delete=create cb_delete
this.cb_1=create cb_1
this.cb_rollback=create cb_rollback
this.cb_commit=create cb_commit
this.cbx_autocommit=create cbx_autocommit
this.cb_ins=create cb_ins
this.cb_save=create cb_save
this.dw_result=create dw_result
this.cb_2=create cb_2
this.st_split=create st_split
this.rte_sql=create rte_sql
this.cbx_need=create cbx_need
this.cb_exec=create cb_exec
this.u_dd=create u_dd
this.u_fun=create u_fun
this.ids_temp=create ids_temp
this.Control[]={this.cbx_edit,&
this.cbx_yield,&
this.cb_3,&
this.cb_delete,&
this.cb_1,&
this.cb_rollback,&
this.cb_commit,&
this.cbx_autocommit,&
this.cb_ins,&
this.cb_save,&
this.dw_result,&
this.cb_2,&
this.st_split,&
this.rte_sql,&
this.cbx_need,&
this.cb_exec}
end on

on w_derek_sqlexec.destroy
destroy(this.cbx_edit)
destroy(this.cbx_yield)
destroy(this.cb_3)
destroy(this.cb_delete)
destroy(this.cb_1)
destroy(this.cb_rollback)
destroy(this.cb_commit)
destroy(this.cbx_autocommit)
destroy(this.cb_ins)
destroy(this.cb_save)
destroy(this.dw_result)
destroy(this.cb_2)
destroy(this.st_split)
destroy(this.rte_sql)
destroy(this.cbx_need)
destroy(this.cb_exec)
destroy(this.u_dd)
destroy(this.u_fun)
destroy(this.ids_temp)
end on

event open;if message.stringparm<>'' then 
	rte_sql.ReplaceText (message.stringparm)
	cb_exec.event clicked()
end if

iw_parent=parentwindow()

Long lStyle

if windowtype=response! and controlmenu=false then
	
	lStyle = GetWindowLonga( Handle(This), -16) //获取原风格
	
	if ib_controlmenu then 
		lStyle+=WS_SYSMENU	//控制菜单
		if ib_maxbox then
			lStyle+=WS_MAXIMIZEBOX	//最大化按钮
		end if
		if ib_minbox then
			lStyle+=WS_MINIMIZEBOX	//最小化按钮
		end if
	end if
	if ib_resizable then
		lStyle+=WS_THICKFRAME	//改变大小
	end if
	 
	SetWindowLonga( Handle(This),  -16, lStyle ) //设置新的风格
	
	//窗口大小会有所改变,所以重新resize
	resize(workspacewidth(),workspaceheight())
	
elseif ib_response and isvalid(iw_parent) then 
	
	iw_parent.enabled=false
	
end if




end event

event key;if (keyflags=0 and key=keyescape!) or (keyflags=2 and key=keyw!) then 
	close(this)
end if
end event

event resize;if sizetype<>1 then  uf_control_pos()
end event

event other;int i,l_count
if wparam<>0 then
	l_count=upperbound(u_fun.is_hotkey[])
	for i=1 to l_count
		if wparam=u_fun.il_atom[i] then 
			//触发控件的keydown事件
			u_fun.ipo_hotkey[i].event dynamic ue_hotkey(u_fun.ikc_hotkeycode[i],u_fun.i_keyflags[i])
		end if
	next
end if
end event

type cbx_edit from checkbox within w_derek_sqlexec
integer x = 1966
integer y = 28
integer width = 206
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Edit"
end type

event clicked;dw_result.event ue_setmodify(checked)

end event

type cbx_yield from checkbox within w_derek_sqlexec
integer x = 2181
integer y = 28
integer width = 233
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Yield"
boolean checked = true
end type

type cb_3 from commandbutton within w_derek_sqlexec
boolean visible = false
integer x = 1751
integer y = 12
integer width = 274
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Select"
end type

event clicked;if text='&Select' then 
	u_dd.setattribs(dw_result,dw_result.is_columns,'tabsequence','0')
	text='&Edit'
else
	u_dd.setattribs(dw_result,dw_result.is_columns,'tabsequence','1')
	text='&Select'
end if

end event

type cb_delete from commandbutton within w_derek_sqlexec
integer x = 878
integer y = 12
integer width = 293
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&Delete"
end type

event clicked;dw_result.uf_deleterow()

end event

type cb_1 from commandbutton within w_derek_sqlexec
integer x = 1179
integer y = 12
integer width = 274
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Import"
end type

event clicked;//dw_result.create('release 12;table()')
dw_result.importfile('')
end event

type cb_rollback from commandbutton within w_derek_sqlexec
integer x = 3113
integer y = 12
integer width = 274
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Rollback"
end type

event clicked;rollback;
if sqlca.sqlcode=-1 then messagebox('Commit',sqlca.sqlerrtext)
end event

type cb_commit from commandbutton within w_derek_sqlexec
integer x = 3392
integer y = 12
integer width = 274
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Commit"
end type

event clicked;commit;

if sqlca.sqlcode=-1 then messagebox('Commit',sqlca.sqlerrtext)

end event

type cbx_autocommit from checkbox within w_derek_sqlexec
integer x = 2807
integer y = 20
integer width = 302
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "自动提交"
boolean checked = true
end type

type cb_ins from commandbutton within w_derek_sqlexec
integer x = 594
integer y = 12
integer width = 274
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&New"
end type

event clicked;dw_result.insertrow(0)
end event

type cb_save from commandbutton within w_derek_sqlexec
integer x = 311
integer y = 12
integer width = 274
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&SAVE"
end type

event clicked;long l_count
string ls_ret
string ls_errtext

if dw_result.accepttext()=-1 then return 
l_count=dw_result.ModifiedCount() + dw_result.deletedCount()
if messagebox('提示','有'+string(l_count)+'行被修改,真的要保存么?',Question!,OKcancel!,2) <>1 then return 

//dw_result.update()
ls_ret=dw_result.uf_update(true,false)
if ls_ret='' then 
	commit;
	if sqlca.sqlcode=-1 then goto e
	messagebox('','保存成功!')
	if dw_result.ResetUpdate ( ) =-1 then cb_exec.event clicked()
end if

return 
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then messagebox('',ls_errtext)
return -1
end event

type dw_result from uo_derek_datawindow within w_derek_sqlexec
event ue_dragleave pbm_dragleave
event ue_keydown pbm_keydown
integer x = 18
integer y = 864
integer width = 3781
integer height = 1348
integer taborder = 20
boolean heighted = true
boolean widthed = true
boolean ib_mulcellselect = true
end type

event ue_keydown;messagebox('','')
end event

event retrieveend;call super::retrieveend;cb_exec.text='&Query'
uf_autofix(dw_result)
end event

event retrievestart;call super::retrievestart;string ls_modify

cbx_edit.event clicked()
if ib_mulcellselect then 
	object.DataWindow.Selected.Mouse=false
end if

if cbx_need.checked then 
	ls_modify+="DataWindow.Retrieve.AsNeeded = 'yes' "
	Modify(ls_modify)
else
	cb_exec.text='&Stop'
end if
uf_setstyle(1)
//u_dd.getcolumns(this,0,is_column[])

end event

event doubleclicked;call super::doubleclicked;
//if string(dwo.type)<>'column' then return 
//
//setredraw(false)
//if getcolumn()>0 then 
//	u_dd.setattribs(this,'','tabsequence','0')
//	mouse_event(4, 0, 0, 0,0) //释放lb 防止重复
//	mouse_event(2, 0, 0, 0,0) //按下lb 实现当前单元格选中
////	mouse_event(4, 0, 0, 0,0) //释放lb 不释放可以实现即刻拖拉选中
//
//else
//	u_dd.setattribs(this,is_columns,'tabsequence','1')
//	setcolumn(integer(dwo.id)) //防止当前列移动到第一列
//end if
//setredraw(true)



end event

event getfocus;call super::getfocus;//注册热键
if this.ib_modified then 
	u_fun.ipo_hotkey[]={dw_result &
										,dw_result,dw_result,dw_result,dw_result,dw_result,dw_result &
										}
	u_fun.is_hotkeyflags[]={'ctrl' &
										,'ctrl','ctrl','shift','shift','ctrl+shift','ctrl+shift' &
										} //{'Ctrl'} 
	u_fun.is_hotkey[]={char('C') &
								,char(38),char(40),char(38),char(40),char(38),char(40) &
								} //C,left,right,up,down					
	u_fun.uf_hotkey_initial()
	u_fun.uf_hotkey_reg(parent,this)
	
else
	
	u_fun.ipo_hotkey[]={dw_result &
										,dw_result,dw_result,dw_result,dw_result,dw_result,dw_result,dw_result,dw_result &
										,dw_result,dw_result,dw_result,dw_result,dw_result,dw_result,dw_result,dw_result}
	u_fun.is_hotkeyflags[]={'ctrl' &
										,'','','ctrl','ctrl','shift','shift','ctrl+shift','ctrl+shift' &
										,'','','ctrl','ctrl','shift','shift','ctrl+shift','ctrl+shift'} //{'Ctrl'} 
	u_fun.is_hotkey[]={char('C') &
								,char(37),char(39),char(37),char(39),char(37),char(39),char(37),char(39) &
								,char(38),char(40),char(38),char(40),char(38),char(40),char(38),char(40)} //C,left,right,up,down
	
	u_fun.uf_hotkey_initial()
	u_fun.uf_hotkey_reg(parent,this)
end if
end event

event losefocus;call super::losefocus;u_fun.uf_hotkey_unreg(parent,this)
end event

event other;call super::other;//if keydown(KeyControl!) then 
//	long l_xpos,l_ypos
//	l_xpos=unitstopixels(this.PointerX(),Xunitstopixels!)
//	l_ypos=unitstopixels(this.PointerY(),Yunitstopixels!)
//	u_fun.uf_filewrite('C:\123.txt',string(message.number)+','+string(wparam)+','+string(lparam)+','+string(long(l_xpos,l_ypos))+'~r~n')
//end if
end event

type cb_2 from commandbutton within w_derek_sqlexec
integer x = 1463
integer y = 12
integer width = 274
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export"
end type

event clicked;dw_result.saveas('',text!,true)
//s_ps.dw_1=dw_result
//
//         open(w_print_setting)
//
end event

type st_split from uo_derek_st_split within w_derek_sqlexec
integer x = 1605
integer y = 84
integer width = 293
integer height = 44
boolean bringtotop = true
integer textsize = -8
long backcolor = 134217731
long bordercolor = 33554431
boolean widthed = true
end type

event constructor;call super::constructor;st_split.uf_register_vs({rte_sql},{dw_result})
end event

type rte_sql from uo_derek_rte within w_derek_sqlexec
integer x = 18
integer y = 116
integer width = 3781
integer height = 728
integer taborder = 50
integer weight = 700
fontcharset fontcharset = ansi!
boolean init_vscrollbar = true
boolean init_popmenu = true
boolean widthed = true
end type

event key;call super::key;//Ctrl+E
//Ctrl+enter
//Alt+X
//F9

if (keyflags=2 and key=keye!) &
or (keyflags=2 and key=keyenter! ) &
or (keyflags=4 and keydown(KeyAlt!) and key=keyx! ) &
or (keyflags=0 and key=keyf9! ) then 
	cb_exec.event clicked()
	return 1
end if
end event

type cbx_need from checkbox within w_derek_sqlexec
integer x = 2418
integer y = 28
integer width = 361
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "AsNeeded"
end type

type cb_exec from commandbutton within w_derek_sqlexec
integer x = 27
integer y = 12
integer width = 274
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Query"
end type

event clicked;string l_sql,ls_info
string ls_tablename
long l_pos,l_pos2

if text<>'&Query' then
	dw_result.dbcancel()
	text='&Query'
	return 
end if

l_sql=trim(rte_sql.SelectedText ( ))

if l_sql='' then l_sql=trim(rte_sql.TextLine ( ))

//if l_sql='' then rte_sql.SelectTextLine ( )
//
//l_sql=trim(rte_sql.SelectedText ( ))

if right(l_sql,1)=';' then l_sql=mid(l_sql,1,len(l_sql) - 1)

if l_sql='' then return

//保存按钮不可用
cb_save.enabled=false
cb_ins.enabled=false
cb_delete.enabled=false
if upper(l_sql)='LOGPASS' then
	ls_info=sqlca.logpass
	goto p
end if

//s:

if upper(left(l_sql,6))='SELECT' then
	ls_info=u_dd.getquery(dw_result,l_sql)
	if ls_info<>'' then 
		goto p
	end if
	//uf_autofix(dw_result)
	dw_result.settransobject(sqlca)
	
	if cbx_yield.checked then //异步检索数据
		dw_result.uf_retrieveyield()
	else
		dw_result.uf_setredraw(false)
		dw_result.retrieve()
	end if
	dw_result.uf_setredraw(true)
	goto e
end if

if left(l_sql,1)='@' then
	l_sql=mid(l_sql,2)
	if messagebox('继续么?',l_sql,question!,yesno!)=2 then goto e
else
	ls_info='不允许:'+l_sql
	goto p
end if

if upper(left(l_sql,6))='SELECT' then
	
	l_pos=0
	l_pos=pos(l_sql,' from ',l_pos + 1) + 6
	l_pos2=pos(l_sql,' ',l_pos + 1)
	if l_pos2=0 then l_pos2=len(l_sql) + 1
	ls_tablename=mid(l_sql,l_pos,l_pos2 - l_pos)
	
//	messagebox('',string(l_pos) +'/'+ string(l_pos2)+'['+ ls_tablename+']')
	
	ls_info=u_dd.getmodify(dw_result,l_sql,ls_tablename,sqlca)
	if ls_info<>'' then 
		goto p
	end if
	//uf_autofix(this)
	dw_result.settransobject(sqlca)
	
	if cbx_yield.checked then //异步检索数据
		dw_result.uf_retrieveyield()
	else
		dw_result.uf_setredraw(false)
		dw_result.retrieve()
	end if
	
	dw_result.uf_setredraw(true)
	
	cb_save.enabled=true
	cb_ins.enabled=true
	cb_delete.enabled=true
	goto e
end if

if execddl(l_sql)=-1 then 
	ls_info=sqlca.sqlerrtext
	goto p
else
	ls_info='影响行数:'+string(sqlca.sqlnrows)
	goto p
end if

e:

rte_sql.setfocus()
return

p:
u_dd.getquery(dw_result,"select space(300) '执行结果'")
dw_result.insertrow(0)
dw_result.setitem(1,1,ls_info)
goto e


		

end event

type u_dd from u_derek_v2_dd within w_derek_sqlexec descriptor "pb_nvo" = "true" 
end type

on u_dd.create
call super::create
end on

on u_dd.destroy
call super::destroy
end on

type u_fun from u_derek_v2_fun within w_derek_sqlexec descriptor "pb_nvo" = "true" 
end type

on u_fun.create
call super::create
end on

on u_fun.destroy
call super::destroy
end on

type ids_temp from datastore within w_derek_sqlexec descriptor "pb_nvo" = "true" 
end type

on ids_temp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_temp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

