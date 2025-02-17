$PBExportHeader$w_pipline.srw
forward
global type w_pipline from window
end type
type ddlb_type from dropdownlistbox within w_pipline
end type
type cbx_autogen from checkbox within w_pipline
end type
type sle_tabname from singlelineedit within w_pipline
end type
type sle_sql2 from singlelineedit within w_pipline
end type
type sle_sql1 from singlelineedit within w_pipline
end type
type sle_des from multilineedit within w_pipline
end type
type cb_1 from commandbutton within w_pipline
end type
type sle_sour from multilineedit within w_pipline
end type
type trans_2 from transaction within w_pipline
end type
type trans_1 from transaction within w_pipline
end type
type u_pip from u_derek_pipeline within w_pipline
end type
end forward

global type w_pipline from window
integer width = 3045
integer height = 1332
boolean titlebar = true
string title = "数据传输"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ddlb_type ddlb_type
cbx_autogen cbx_autogen
sle_tabname sle_tabname
sle_sql2 sle_sql2
sle_sql1 sle_sql1
sle_des sle_des
cb_1 cb_1
sle_sour sle_sour
trans_2 trans_2
trans_1 trans_1
u_pip u_pip
end type
global w_pipline w_pipline

type variables
u_runsa_derek u_derek
end variables

on w_pipline.create
this.ddlb_type=create ddlb_type
this.cbx_autogen=create cbx_autogen
this.sle_tabname=create sle_tabname
this.sle_sql2=create sle_sql2
this.sle_sql1=create sle_sql1
this.sle_des=create sle_des
this.cb_1=create cb_1
this.sle_sour=create sle_sour
this.trans_2=create trans_2
this.trans_1=create trans_1
this.u_pip=create u_pip
this.Control[]={this.ddlb_type,&
this.cbx_autogen,&
this.sle_tabname,&
this.sle_sql2,&
this.sle_sql1,&
this.sle_des,&
this.cb_1,&
this.sle_sour}
end on

on w_pipline.destroy
destroy(this.ddlb_type)
destroy(this.cbx_autogen)
destroy(this.sle_tabname)
destroy(this.sle_sql2)
destroy(this.sle_sql1)
destroy(this.sle_des)
destroy(this.cb_1)
destroy(this.sle_sour)
destroy(this.trans_2)
destroy(this.trans_1)
destroy(this.u_pip)
end on

type ddlb_type from dropdownlistbox within w_pipline
integer x = 946
integer y = 576
integer width = 411
integer height = 472
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"append","create","replace","refresh","update"}
end type

event constructor;text=item[1]
end event

type cbx_autogen from checkbox within w_pipline
integer x = 581
integer y = 584
integer width = 315
integer height = 72
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "自动生成"
boolean checked = true
end type

type sle_tabname from singlelineedit within w_pipline
integer x = 114
integer y = 576
integer width = 457
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "db"
end type

event modified;if cbx_autogen.checked then
	sle_sql1.text='select * from '+sle_tabname.text
	sle_sql2.text='select * from '+sle_tabname.text
end if
end event

type sle_sql2 from singlelineedit within w_pipline
integer x = 114
integer y = 856
integer width = 2848
integer height = 176
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "select * from db"
end type

type sle_sql1 from singlelineedit within w_pipline
integer x = 114
integer y = 676
integer width = 2848
integer height = 176
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "select * from db"
end type

type sle_des from multilineedit within w_pipline
integer x = 114
integer y = 296
integer width = 2848
integer height = 276
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Driver={Adaptive Server Enterprise};server=localhost;uid=zgsybase;pwd=zgsybase;port=5000;database=runsadb;language=us_english"
boolean vscrollbar = true
boolean hideselection = false
end type

type cb_1 from commandbutton within w_pipline
integer x = 110
integer y = 1056
integer width = 361
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "执行(&E)"
end type

event clicked;string ls_ret,ls_ConnectString
string ls_errtext
boolean lb_wait
if text='停止' then
	u_pip.uf_cancel()
	text='立即同步'
	return 
end if

u_derek.wait(0,'连接到源数据')

ls_ConnectString=sle_sour.text
trans_1.DBMS = "ODBC"
trans_1.AutoCommit = False
trans_1.DBParm ="ConnectString='"+ls_ConnectString+"',CommitOnDisconnect='No'"//,ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using trans_1;
if trans_1.sqlcode=-1 then 
	ls_errtext='源事务:'+trans_1.sqlerrtext
	goto e 
end if

u_derek.wait(0,'连接到目标数据')

ls_ConnectString=sle_des.text
trans_2.DBMS = "ODBC"
trans_2.AutoCommit = False
trans_2.DBParm ="ConnectString='"+ls_ConnectString+"',CommitOnDisconnect='No'"//,ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using trans_2;
if trans_2.sqlcode=-1 then 
	ls_errtext='目标事务:'+trans_2.sqlerrtext
	goto e 
end if

u_derek.wait(0,'数据检索')
text='停止'
ls_ret=u_pip.uf_rowscopy(trans_1, trans_2,sle_sql1.text ,sle_sql2.text,sle_tabname.text,ddlb_type.text)

messagebox('','执行结果:'+ls_ret&
				+'~r~n读取行数:'+string(u_pip.RowsRead)&
				+'~r~n传输行数:'+string(u_pip.RowsWritten))



e:
if trans_1.dbhandle()>0 then 
	disconnect using  trans_1;
end if
if trans_2.dbhandle()>0 then 
	disconnect using  trans_2;
end if
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then u_derek.closewait()
text='立即同步'
return 



end event

type sle_sour from multilineedit within w_pipline
integer x = 114
integer y = 16
integer width = 2848
integer height = 276
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Driver={Adaptive Server Enterprise};server=wgz.runsa.cn;uid=sybderek;port=52330;pwd=xia233;database=jasonwood;language=us_english"
boolean vscrollbar = true
end type

type trans_2 from transaction within w_pipline descriptor "pb_nvo" = "true" 
end type

on trans_2.create
call super::create
TriggerEvent( this, "constructor" )
end on

on trans_2.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

type trans_1 from transaction within w_pipline descriptor "pb_nvo" = "true" 
end type

on trans_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on trans_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

type u_pip from u_derek_pipeline within w_pipline descriptor "pb_nvo" = "true" 
long il_rowscommit = 1
end type

on u_pip.create
call super::create
end on

on u_pip.destroy
call super::destroy
end on

event pipemeter;call super::pipemeter;u_derek.wait(0,'已传输:'+String(This.RowsWritten)+'/'+string(rowsread))
end event

