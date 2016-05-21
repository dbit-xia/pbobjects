$PBExportHeader$w_derek_password_input.srw
forward
global type w_derek_password_input from window
end type
type mle_input from singlelineedit within w_derek_password_input
end type
type st_1 from statictext within w_derek_password_input
end type
type cb_2 from commandbutton within w_derek_password_input
end type
type cb_1 from commandbutton within w_derek_password_input
end type
end forward

global type w_derek_password_input from window
integer width = 1440
integer height = 496
boolean titlebar = true
string title = "输入短信内容"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_input mle_input
st_1 st_1
cb_2 cb_2
cb_1 cb_1
end type
global w_derek_password_input w_derek_password_input

type variables
long i_charcount
end variables

on w_derek_password_input.create
this.mle_input=create mle_input
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.mle_input,&
this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_derek_password_input.destroy
destroy(this.mle_input)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string ls_text
ls_text=message.stringparm

i_charcount=long(f_maintain_s(ls_text,'charcount=',';'))
if i_charcount>0 then 
	mle_input.limit=i_charcount  
else
	i_charcount=32766
end if
this.title=f_maintain_s(ls_text,'title=',';')

//ls_text=u_fun.replace(ls_text,'~~n','~n')
//ls_text=u_fun.replace(ls_text,'~~r','~r')

st_1.text="最大支持输入字节数:"+string(i_charcount)
mle_input.text=ls_text
end event

type mle_input from singlelineedit within w_derek_password_input
integer y = 144
integer width = 1394
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
end type

type st_1 from statictext within w_derek_password_input
integer y = 16
integer width = 1417
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "最大支持输入字符数:XX"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_derek_password_input
integer x = 1056
integer y = 272
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "取消"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_derek_password_input
integer x = 681
integer y = 276
integer width = 343
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "确认"
end type

event clicked;string ls_text
ls_text=trim(mle_input.text)

//ls_text=u_fun.replace(ls_text,'~r~n','~~r~~n')
//ls_text=u_fun.replace(ls_text,'~r','~~r')
//ls_text=u_fun.replace(ls_text,'~n','~~n')
//if lenA(ls_text)>i_charcount then 
//	f_messagebox('','字节数不能超过:'+string(i_charcount),0,0)
//	return 
//end if

if ls_text='' then 
	f_messagebox('','内容不能为空!',0,0)
	return 
end if

closewithreturn(parent,'content='+ls_text)
end event

