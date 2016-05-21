$PBExportHeader$w_dbit_msinet.srw
forward
global type w_dbit_msinet from window
end type
type cb_3 from commandbutton within w_dbit_msinet
end type
type cb_2 from commandbutton within w_dbit_msinet
end type
type cb_1 from commandbutton within w_dbit_msinet
end type
type ole_msinet from olecustomcontrol within w_dbit_msinet
end type
type st_msg from multilineedit within w_dbit_msinet
end type
end forward

global type w_dbit_msinet from window
integer width = 1627
integer height = 380
boolean titlebar = true
string title = "执行网络命令"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "DataPipeline!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ole_msinet ole_msinet
st_msg st_msg
end type
global w_dbit_msinet w_dbit_msinet

type variables
long il_resultcode
string is_description

end variables

forward prototypes
public function string setproper (string as_server, string as_uid, string as_pwd, integer ai_timeout)
public function string uf_dir (string as_server, string as_uid, string as_pwd, string as_dir, ref string as_dirlist)
public function string uf_exec (any a_1, any a_2, any a_3, any a_4)
public function string uf_exec (string as_server, string as_uid, string as_pwd, unsignedinteger ai_timeout, string as_cmd)
public function string uf_get (string as_server, string as_uid, string as_pwd, string as_rpath, string as_lpath)
public function string uf_put (string as_lpath, string as_rpath)
public function string uf_put (string as_server, string as_uid, string as_pwd, string as_lpath, string as_rpath)
public function string uf_exec (string as_cmd)
end prototypes

public function string setproper (string as_server, string as_uid, string as_pwd, integer ai_timeout);string ls_errtext
oleobject objinet
objinet=ole_msinet.object
as_server=trim(as_server)
if upper(left(as_server,4))<>'FTP:' then as_server='FTP://'+as_server

try
	objInet.URL = as_server //ftp地址(IP或计算机名)
	objInet.Username =as_uid
	objInet.Password =as_pwd
	objInet.RequestTimeout = ai_timeout
catch(runtimeerror e)
	ls_errtext=e.getmessage()
end try

return ls_errtext
end function

public function string uf_dir (string as_server, string as_uid, string as_pwd, string as_dir, ref string as_dirlist);/*
参数说明:
as_server:服务器IP
as_uid:ftp用户名
as_pwd:ftp登录密码
as_dir:目录
as_dirlist:返回列表
*/

string l_string

l_string=setproper(as_server,as_uid,as_pwd,10)
if l_string<>'' then goto e

l_string=uf_Exec("", "dir "+as_dir,'','')

if il_resultcode<>0 or (ole_msinet.object.responsecode<>0 and ole_msinet.object.responsecode<>18) then 
	l_string+=string(ole_msinet.object.responseinfo)
	goto e
end if
//messagebox('',string(ole_msinet.object.GetHeader()))
as_dirlist = trim(ole_msinet.object.GetChunk(512))
ole_msinet.object.cancel()

return ''

e:
ole_msinet.object.cancel()
return l_string
end function

public function string uf_exec (any a_1, any a_2, any a_3, any a_4);//il_haserr=0

if ole_msinet.object.StillExecuting then 
	il_resultcode=-1
	is_description="命令还在执行!"
	return is_description
end if

il_resultcode=0
is_description=''
st_msg.text='执行:'+string(a_1)+' '+string(a_2)+' '+string(a_3)+' '+string(a_4)

ole_msinet.object.Execute(a_1, a_2,a_3,a_4)
do While ole_msinet.object.StillExecuting
	yield()
loop

st_msg.text='执行:'+string(a_1)+' '+string(a_2)+' '+string(a_3)+' '+string(a_4)+'完毕!'

if il_resultcode<>0 then
	return is_description
end if
return ''
end function

public function string uf_exec (string as_server, string as_uid, string as_pwd, unsignedinteger ai_timeout, string as_cmd);string l_string

l_string=setproper(as_server,as_uid,as_pwd,10)
if l_string<>'' then goto e

l_string=uf_exec("",as_cmd,"","")
if il_resultcode<>0 or ole_msinet.object.responsecode<>0 then 
	l_string+=l_string+string(ole_msinet.object.responseinfo)
	goto e
end if

return ''

e:
return l_string
end function

public function string uf_get (string as_server, string as_uid, string as_pwd, string as_rpath, string as_lpath);/*
参数说明:
as_server:服务器IP
as_uid:ftp用户名
as_pwd:ftp登录密码
as_lpath:远程路径
as_rpath:本地路径
*/
string l_string

l_string=setproper(as_server,as_uid,as_pwd,10)
if l_string<>'' then goto e

l_string=uf_exec("","get "+as_rpath+" "+as_lpath,"","")
if il_resultcode<>0 or (ole_msinet.object.responsecode<>0 and ole_msinet.object.responsecode<>18) then 
	l_string+=string(ole_msinet.object.responseinfo)
	goto e
end if
ole_msinet.object.cancel()
return ''

e:
ole_msinet.object.cancel()
return l_string
end function

public function string uf_put (string as_lpath, string as_rpath);/*
参数说明:
as_lpath:本地路径
as_rpath:远程路径
*/

string l_string
string ls_cmd

ls_cmd='put "'+as_lpath+'" "'+as_rpath+'"'

l_string=uf_exec('',ls_cmd,'','')
if il_resultcode<>0 or (ole_msinet.object.responsecode<>0 and ole_msinet.object.responsecode<>18) then 
	l_string+=string(ole_msinet.object.responseinfo)
	goto e
end if

return ''

e:
return l_string
end function

public function string uf_put (string as_server, string as_uid, string as_pwd, string as_lpath, string as_rpath);/*
参数说明:
as_server:服务器IP
as_uid:ftp用户名
as_pwd:ftp登录密码
as_lpath:本地路径
as_rpath:远程路径
*/

string l_string
string ls_cmd

ls_cmd='put "'+as_lpath+'" "'+as_rpath+'"'

l_string=setproper(as_server,as_uid,as_pwd,10)
if l_string<>'' then goto e

l_string=uf_exec('',ls_cmd,'','')
if il_resultcode<>0 or (ole_msinet.object.responsecode<>0 and ole_msinet.object.responsecode<>18) then 
	l_string+=string(ole_msinet.object.responseinfo)
	goto e
end if

ole_msinet.object.cancel()
return ''

e:
ole_msinet.object.cancel()
return l_string
end function

public function string uf_exec (string as_cmd);string l_string

l_string=uf_exec("",as_cmd,"","")
if il_resultcode<>0 or ole_msinet.object.responsecode<>0 then 
	l_string+=l_string+string(ole_msinet.object.responseinfo)
	goto e
end if

return ''

e:
return l_string
end function

on w_dbit_msinet.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ole_msinet=create ole_msinet
this.st_msg=create st_msg
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.ole_msinet,&
this.st_msg}
end on

on w_dbit_msinet.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ole_msinet)
destroy(this.st_msg)
end on

event closequery;if ole_msinet.object.StillExecuting then 
	if messagebox('提示','程序还没有执行完毕,要停止么?',question!,okcancel!,2)=1 then 
		ole_msinet.object.cancel()
		il_resultcode=-1
		is_description='用户中止!'
	end if
	return 1
end if


end event

type cb_3 from commandbutton within w_dbit_msinet
boolean visible = false
integer x = 640
integer y = 264
integer width = 288
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "get"
end type

event clicked;string ls_dir
messagebox('',uf_get('ftp://runsaxia','runsa','runsa468','derek/1.xls','E:\2.xls'))

end event

type cb_2 from commandbutton within w_dbit_msinet
boolean visible = false
integer x = 334
integer y = 264
integer width = 288
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "put"
end type

event clicked;string ls_dir
messagebox('',uf_put('ftp://192.168.1.210','runsa','runsa468','E:\智慧Book2.xls','derek/1.xls'))

end event

type cb_1 from commandbutton within w_dbit_msinet
boolean visible = false
integer x = 23
integer y = 264
integer width = 288
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "dir"
end type

event clicked;string ls_dir
messagebox('',uf_dir('ftp://192.168.1.50/','xia','xia','*',ls_dir))
messagebox('',ls_dir)
end event

type ole_msinet from olecustomcontrol within w_dbit_msinet
event statechanged ( integer state )
integer width = 174
integer height = 152
integer taborder = 10
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_dbit_msinet.win"
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

event externalexception;
il_resultcode=resultcode
is_description=description

action=exceptionignore!
end event

type st_msg from multilineedit within w_dbit_msinet
integer width = 1614
integer height = 292
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "等待命令... ..."
boolean displayonly = true
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fw_dbit_msinet.bin 
2200000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000f398b6b001cd045700000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000480000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000003a00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000448e5929311cf9880aa0054970809c00000000000f398b6b001cd0457f398b6b001cd045700000000000000000000000000000001fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff003800370031004500440042003100440039002d00340039002d003100310031006600630039002d00350037002d003600300030004100410030003000300043003900300038003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234432100000008000003ed000003ed48e592910006000000010000000000000000005000000000000000000000000000000000003c000000000000000000001234432100000008000003ed000003ed48e592910006000000010000000000000000005000000000000000000000000000000000003c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000003a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_dbit_msinet.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
