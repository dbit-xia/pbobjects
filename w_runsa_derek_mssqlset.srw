$PBExportHeader$w_runsa_derek_mssqlset.srw
forward
global type w_runsa_derek_mssqlset from window
end type
type st_7 from statictext within w_runsa_derek_mssqlset
end type
type sle_7 from singlelineedit within w_runsa_derek_mssqlset
end type
type sle_1 from singlelineedit within w_runsa_derek_mssqlset
end type
type sle_6 from singlelineedit within w_runsa_derek_mssqlset
end type
type st_6 from statictext within w_runsa_derek_mssqlset
end type
type cb_2 from commandbutton within w_runsa_derek_mssqlset
end type
type cb_1 from commandbutton within w_runsa_derek_mssqlset
end type
type sle_5 from singlelineedit within w_runsa_derek_mssqlset
end type
type sle_4 from singlelineedit within w_runsa_derek_mssqlset
end type
type sle_3 from singlelineedit within w_runsa_derek_mssqlset
end type
type sle_2 from singlelineedit within w_runsa_derek_mssqlset
end type
type st_5 from statictext within w_runsa_derek_mssqlset
end type
type st_4 from statictext within w_runsa_derek_mssqlset
end type
type st_3 from statictext within w_runsa_derek_mssqlset
end type
type st_2 from statictext within w_runsa_derek_mssqlset
end type
type st_1 from statictext within w_runsa_derek_mssqlset
end type
type st_mysql from statictext within w_runsa_derek_mssqlset
end type
end forward

global type w_runsa_derek_mssqlset from window
integer width = 1390
integer height = 1200
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_7 st_7
sle_7 sle_7
sle_1 sle_1
sle_6 sle_6
st_6 st_6
cb_2 cb_2
cb_1 cb_1
sle_5 sle_5
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
st_mysql st_mysql
end type
global w_runsa_derek_mssqlset w_runsa_derek_mssqlset

type variables
string is_inifile
string is_section="ConnectString"
end variables

on w_runsa_derek_mssqlset.create
this.st_7=create st_7
this.sle_7=create sle_7
this.sle_1=create sle_1
this.sle_6=create sle_6
this.st_6=create st_6
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_5=create sle_5
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_mysql=create st_mysql
this.Control[]={this.st_7,&
this.sle_7,&
this.sle_1,&
this.sle_6,&
this.st_6,&
this.cb_2,&
this.cb_1,&
this.sle_5,&
this.sle_4,&
this.sle_3,&
this.sle_2,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.st_mysql}
end on

on w_runsa_derek_mssqlset.destroy
destroy(this.st_7)
destroy(this.sle_7)
destroy(this.sle_1)
destroy(this.sle_6)
destroy(this.st_6)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_mysql)
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

sle_1.text=ProfileString(is_inifile, is_section, "server", "127.0.0.1")
sle_3.text=ProfileString(is_inifile, is_section, "LastUser", "")
sle_4.text=ProfileString(is_inifile, is_section, "pwd", "")
sle_5.text=ProfileString(is_inifile, is_section, "database", "")
sle_6.text=ProfileString(is_inifile, is_section, "name", "")
end event

type st_7 from statictext within w_runsa_derek_mssqlset
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

type sle_7 from singlelineedit within w_runsa_derek_mssqlset
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

type sle_1 from singlelineedit within w_runsa_derek_mssqlset
integer x = 457
integer y = 392
integer width = 713
integer height = 108
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "127.0.0.1"
borderstyle borderstyle = stylelowered!
end type

type sle_6 from singlelineedit within w_runsa_derek_mssqlset
integer x = 453
integer y = 280
integer width = 718
integer height = 96
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_runsa_derek_mssqlset
integer x = 101
integer y = 280
integer width = 297
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Name:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_runsa_derek_mssqlset
integer x = 777
integer y = 944
integer width = 302
integer height = 104
integer taborder = 90
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "取消"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_runsa_derek_mssqlset
integer x = 398
integer y = 944
integer width = 302
integer height = 104
integer taborder = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "确定"
boolean default = true
end type

event clicked;

string ls_dbparm=''
string l_registrypath,ls_server,ls_port,ls_uid,ls_pwd,ls_db,ls_name,ls_charset

ls_server=sle_1.text
ls_uid=sle_3.text
ls_pwd=sle_4.text
ls_db=sle_5.text
ls_name=sle_6.text

ls_dbparm="ConnectString='DSN="+ls_name+";UID="+ls_uid+";PWD="+ls_pwd+"',CommitOnDisconnect='No',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

l_registrypath='HKEY_CURRENT_USER\Software\ODBC\ODBC.INI\'+ls_name
registryset(l_registrypath,'Database',ls_db)
registryset(l_registrypath,'PWD',ls_pwd)
registryset(l_registrypath,'LastUser',ls_uid)
registryset(l_registrypath,'Server',ls_server)
registryset(l_registrypath,'DRIVER','C:\\WINDOWS\\system32\\SQLSRV32.dll')
registryset('HKEY_CURRENT_USER\Software\ODBC\ODBC.INI\ODBC Data Sources\',ls_name,'SQL Server')

setProfileString(is_inifile, is_section, "server", ls_server)
setProfileString(is_inifile, is_section, "LastUser", ls_uid)
setProfileString(is_inifile, is_section, "pwd", ls_pwd)
setProfileString(is_inifile, is_section, "database", ls_db)
setProfileString(is_inifile, is_section, "name", ls_name)
setProfileString(is_inifile, is_section, 'Dbparm',ls_dbparm)

// Profile 
transaction mssqlca
mssqlca=create transaction
mssqlca.DBMS = "ODBC"
mssqlca.AutoCommit = False
mssqlca.DBParm =ls_dbparm

connect using mssqlca;

if mssqlca.sqlcode=-1 then 
	messagebox('提示','连接失败'+mssqlca.sqlerrtext)
	destroy mssqlca
	return 0
end if

destroy mssqlca
closewithreturn(parent,'1')


end event

type sle_5 from singlelineedit within w_runsa_derek_mssqlset
integer x = 443
integer y = 760
integer width = 718
integer height = 96
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_4 from singlelineedit within w_runsa_derek_mssqlset
integer x = 448
integer y = 640
integer width = 718
integer height = 96
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_3 from singlelineedit within w_runsa_derek_mssqlset
integer x = 448
integer y = 520
integer width = 718
integer height = 96
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_runsa_derek_mssqlset
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

type st_5 from statictext within w_runsa_derek_mssqlset
integer x = 101
integer y = 760
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
string text = "DB:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_runsa_derek_mssqlset
integer x = 101
integer y = 640
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
string text = "Pwd:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_runsa_derek_mssqlset
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
string text = "Uid:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_runsa_derek_mssqlset
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

type st_1 from statictext within w_runsa_derek_mssqlset
integer x = 101
integer y = 400
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
string text = "Server:"
boolean focusrectangle = false
end type

type st_mysql from statictext within w_runsa_derek_mssqlset
integer x = 567
integer y = 60
integer width = 416
integer height = 128
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "MsSql"
boolean focusrectangle = false
end type

