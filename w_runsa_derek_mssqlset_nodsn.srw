$PBExportHeader$w_runsa_derek_mssqlset_nodsn.srw
forward
global type w_runsa_derek_mssqlset_nodsn from window
end type
type st_6 from statictext within w_runsa_derek_mssqlset_nodsn
end type
type sle_other from singlelineedit within w_runsa_derek_mssqlset_nodsn
end type
type st_7 from statictext within w_runsa_derek_mssqlset_nodsn
end type
type sle_7 from singlelineedit within w_runsa_derek_mssqlset_nodsn
end type
type sle_server from singlelineedit within w_runsa_derek_mssqlset_nodsn
end type
type cb_cancel from commandbutton within w_runsa_derek_mssqlset_nodsn
end type
type cb_ok from commandbutton within w_runsa_derek_mssqlset_nodsn
end type
type sle_db from singlelineedit within w_runsa_derek_mssqlset_nodsn
end type
type sle_pwd from singlelineedit within w_runsa_derek_mssqlset_nodsn
end type
type sle_uid from singlelineedit within w_runsa_derek_mssqlset_nodsn
end type
type sle_2 from singlelineedit within w_runsa_derek_mssqlset_nodsn
end type
type st_5 from statictext within w_runsa_derek_mssqlset_nodsn
end type
type st_4 from statictext within w_runsa_derek_mssqlset_nodsn
end type
type st_3 from statictext within w_runsa_derek_mssqlset_nodsn
end type
type st_2 from statictext within w_runsa_derek_mssqlset_nodsn
end type
type st_1 from statictext within w_runsa_derek_mssqlset_nodsn
end type
type st_mysql from statictext within w_runsa_derek_mssqlset_nodsn
end type
type mssqlca from transaction within w_runsa_derek_mssqlset_nodsn
end type
end forward

global type w_runsa_derek_mssqlset_nodsn from window
integer width = 1134
integer height = 1116
boolean titlebar = true
string title = "MSSQL Server"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_6 st_6
sle_other sle_other
st_7 st_7
sle_7 sle_7
sle_server sle_server
cb_cancel cb_cancel
cb_ok cb_ok
sle_db sle_db
sle_pwd sle_pwd
sle_uid sle_uid
sle_2 sle_2
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
st_mysql st_mysql
mssqlca mssqlca
end type
global w_runsa_derek_mssqlset_nodsn w_runsa_derek_mssqlset_nodsn

type variables
string is_inifile
string is_section="ConnectString"

end variables

on w_runsa_derek_mssqlset_nodsn.create
this.st_6=create st_6
this.sle_other=create sle_other
this.st_7=create st_7
this.sle_7=create sle_7
this.sle_server=create sle_server
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_db=create sle_db
this.sle_pwd=create sle_pwd
this.sle_uid=create sle_uid
this.sle_2=create sle_2
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_mysql=create st_mysql
this.mssqlca=create mssqlca
this.Control[]={this.st_6,&
this.sle_other,&
this.st_7,&
this.sle_7,&
this.sle_server,&
this.cb_cancel,&
this.cb_ok,&
this.sle_db,&
this.sle_pwd,&
this.sle_uid,&
this.sle_2,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.st_mysql}
end on

on w_runsa_derek_mssqlset_nodsn.destroy
destroy(this.st_6)
destroy(this.sle_other)
destroy(this.st_7)
destroy(this.sle_7)
destroy(this.sle_server)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_db)
destroy(this.sle_pwd)
destroy(this.sle_uid)
destroy(this.sle_2)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_mysql)
destroy(this.mssqlca)
end on

event open;//取得ini文件的内容
string l_registrypath,ls_server,ls_port,ls_uid,ls_pwd,ls_db,ls_charset
string ls_stringparm
long l_pos
ls_stringparm=message.stringparm
l_pos=pos(ls_stringparm,',')

if l_pos>0 then 
	is_inifile=left(ls_stringparm, l_pos - 1)
	is_section=mid(ls_stringparm,pos(ls_stringparm,',') + 1)
else
	is_inifile=ls_stringparm
	is_section="ConnectString"
end if

sle_server.text=ProfileString(is_inifile, is_section, "server", "127.0.0.1,1433")
sle_uid.text=ProfileString(is_inifile, is_section, "LastUser", "")
sle_pwd.text=ProfileString(is_inifile, is_section, "pwd", "")
sle_db.text=ProfileString(is_inifile, is_section, "database", "")
sle_other.text=ProfileString(is_inifile, is_section, "other", "")

end event

type st_6 from statictext within w_runsa_derek_mssqlset_nodsn
integer x = 55
integer y = 672
integer width = 224
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Other:"
boolean focusrectangle = false
end type

type sle_other from singlelineedit within w_runsa_derek_mssqlset_nodsn
integer x = 288
integer y = 672
integer width = 713
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_7 from statictext within w_runsa_derek_mssqlset_nodsn
boolean visible = false
integer x = 101
integer y = 1008
integer width = 320
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Charset:"
boolean focusrectangle = false
end type

type sle_7 from singlelineedit within w_runsa_derek_mssqlset_nodsn
boolean visible = false
integer x = 443
integer y = 1000
integer width = 718
integer height = 96
integer taborder = 70
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "gbk"
borderstyle borderstyle = stylelowered!
end type

type sle_server from singlelineedit within w_runsa_derek_mssqlset_nodsn
integer x = 288
integer y = 240
integer width = 713
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "127.0.0.1,1433"
end type

type cb_cancel from commandbutton within w_runsa_derek_mssqlset_nodsn
integer x = 571
integer y = 852
integer width = 302
integer height = 104
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
end type

event clicked;close(parent)
end event

type cb_ok from commandbutton within w_runsa_derek_mssqlset_nodsn
integer x = 192
integer y = 852
integer width = 302
integer height = 104
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
boolean default = true
end type

event clicked;string ls_dbparm=''
string ls_server,ls_uid,ls_pwd,ls_db,ls_other

ls_server=sle_server.text
ls_uid=sle_uid.text
ls_pwd=sle_pwd.text
ls_db=sle_db.text
ls_other=sle_other.text

setProfileString(is_inifile, is_section, "server", ls_server)
setProfileString(is_inifile, is_section, "LastUser", ls_uid)
setProfileString(is_inifile, is_section, "pwd", ls_pwd)
setProfileString(is_inifile, is_section, "database", ls_db)
setProfileString(is_inifile, is_section, "other", ls_other)

if trim(ls_other)<>'' then ls_other=','+ls_other

ls_dbparm="ConnectString='Driver={SQL Server};server="+ls_server+";database="+ls_db+";uid="+ls_uid+";pwd="+ls_pwd+"',CommitOnDisconnect='No',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"+ls_other+""

mssqlca.DBMS = "ODBC"
mssqlca.AutoCommit = False
mssqlca.DBParm = ls_dbparm

connect using mssqlca;

if mssqlca.sqlcode=-1 then 
	messagebox('提示','连接失败'+mssqlca.sqlerrtext)
	return 0
end if

if sqlca.dbhandle()>0 then 
	disconnect using  mssqlca;
end if

closewithreturn(parent,'1')


end event

type sle_db from singlelineedit within w_runsa_derek_mssqlset_nodsn
integer x = 288
integer y = 564
integer width = 713
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_pwd from singlelineedit within w_runsa_derek_mssqlset_nodsn
integer x = 288
integer y = 456
integer width = 713
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
boolean hideselection = false
end type

type sle_uid from singlelineedit within w_runsa_derek_mssqlset_nodsn
integer x = 288
integer y = 348
integer width = 713
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_2 from singlelineedit within w_runsa_derek_mssqlset_nodsn
boolean visible = false
integer x = 448
integer y = 520
integer width = 718
integer height = 96
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "1433"
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_runsa_derek_mssqlset_nodsn
integer x = 55
integer y = 564
integer width = 224
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "DB:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_runsa_derek_mssqlset_nodsn
integer x = 55
integer y = 456
integer width = 224
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Pwd:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_runsa_derek_mssqlset_nodsn
integer x = 55
integer y = 348
integer width = 224
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Uid:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_runsa_derek_mssqlset_nodsn
boolean visible = false
integer x = 101
integer y = 520
integer width = 288
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Port:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_runsa_derek_mssqlset_nodsn
integer x = 55
integer y = 240
integer width = 224
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Server:"
boolean focusrectangle = false
end type

type st_mysql from statictext within w_runsa_derek_mssqlset_nodsn
integer y = 60
integer width = 1138
integer height = 128
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "MSSQL(ODBC)"
alignment alignment = center!
boolean focusrectangle = false
end type

type mssqlca from transaction within w_runsa_derek_mssqlset_nodsn descriptor "pb_nvo" = "true" 
end type

on mssqlca.create
call super::create
TriggerEvent( this, "constructor" )
end on

on mssqlca.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

