$PBExportHeader$w_runsa_derek_check.srw
forward
global type w_runsa_derek_check from window
end type
type pb_valid from picturebutton within w_runsa_derek_check
end type
type pb_restore from picturebutton within w_runsa_derek_check
end type
type pb_uncheck from picturebutton within w_runsa_derek_check
end type
type pb_cancel from picturebutton within w_runsa_derek_check
end type
type pb_invalid from picturebutton within w_runsa_derek_check
end type
type pb_check from picturebutton within w_runsa_derek_check
end type
end forward

global type w_runsa_derek_check from window
integer width = 1248
integer height = 716
boolean titlebar = true
string title = "确认与作废"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_valid pb_valid
pb_restore pb_restore
pb_uncheck pb_uncheck
pb_cancel pb_cancel
pb_invalid pb_invalid
pb_check pb_check
end type
global w_runsa_derek_check w_runsa_derek_check

type variables
string i_table
string i_nos
end variables

on w_runsa_derek_check.create
this.pb_valid=create pb_valid
this.pb_restore=create pb_restore
this.pb_uncheck=create pb_uncheck
this.pb_cancel=create pb_cancel
this.pb_invalid=create pb_invalid
this.pb_check=create pb_check
this.Control[]={this.pb_valid,&
this.pb_restore,&
this.pb_uncheck,&
this.pb_cancel,&
this.pb_invalid,&
this.pb_check}
end on

on w_runsa_derek_check.destroy
destroy(this.pb_valid)
destroy(this.pb_restore)
destroy(this.pb_uncheck)
destroy(this.pb_cancel)
destroy(this.pb_invalid)
destroy(this.pb_check)
end on

event open;
string ls_stringparm,ls_oldchflags
int li_pos
ls_stringparm=string(message.stringparm,'')
li_pos=pos(ls_stringparm,';')
if li_pos>0 then 
	ls_oldchflags=left(ls_stringparm,li_pos - 1)
	i_table=f_maintain_s(ls_stringparm,'tablename=',';')
	i_nos=f_maintain_s(ls_stringparm,'nos=',';')
else
	ls_oldchflags=ls_stringparm
end if

choose case ls_oldchflags
	case '0'
		pb_check.enabled=true
		pb_invalid.enabled=true
	case '1'
		pb_uncheck.enabled=true
		pb_invalid.enabled=true
	case '2'
		pb_check.enabled=false
		pb_valid.enabled=true
	case else
		pb_check.enabled=true
		pb_invalid.enabled=true
		pb_uncheck.enabled=true
		pb_valid.enabled=true
end choose

end event

event key;if keyflags=0 and key=keyescape! then 
	close(this)
end if
end event

type pb_valid from picturebutton within w_runsa_derek_check
string tag = "反作废"
integer x = 466
integer y = 320
integer width = 265
integer height = 212
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "反作废"
boolean originalsize = true
string picturename = "disinvalid.jpg"
string disabledname = "disinvalid1.jpg"
end type

event clicked;closewithreturn(parent,tag)
end event

event constructor;text=''
end event

type pb_restore from picturebutton within w_runsa_derek_check
string tag = "恢复"
integer x = 800
integer y = 64
integer width = 265
integer height = 212
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "恢复"
boolean originalsize = true
string picturename = "Comeback.jpg"
string disabledname = "Comeback1.jpg"
end type

event clicked;closewithreturn(parent,tag)
end event

event constructor;text=''
end event

type pb_uncheck from picturebutton within w_runsa_derek_check
string tag = "反确认"
integer x = 466
integer y = 64
integer width = 265
integer height = 212
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "反确认"
boolean originalsize = true
string picturename = "discheck.jpg"
string disabledname = "discheck1.jpg"
end type

event clicked;closewithreturn(parent,tag)
end event

event constructor;text=''
end event

type pb_cancel from picturebutton within w_runsa_derek_check
integer x = 800
integer y = 320
integer width = 265
integer height = 212
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "取消"
boolean originalsize = true
string picturename = "Cancel.jpg"
string disabledname = "Cancel1.jpg"
end type

event clicked;closewithreturn(parent,tag)
end event

event constructor;text=''
end event

type pb_invalid from picturebutton within w_runsa_derek_check
string tag = "作废"
integer x = 133
integer y = 320
integer width = 265
integer height = 212
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "作废"
boolean originalsize = true
string picturename = "invalid.jpg"
string disabledname = "invalid1.jpg"
end type

event clicked;closewithreturn(parent,tag)
end event

event constructor;text=''
end event

type pb_check from picturebutton within w_runsa_derek_check
string tag = "确认"
integer x = 133
integer y = 64
integer width = 265
integer height = 212
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "确认"
boolean originalsize = true
string picturename = "check.jpg"
string disabledname = "check1.jpg"
end type

event clicked;if i_table<>'' then 
	if f_zg_sout("nosaftercheck,tablename="+i_table+",nos="+i_nos+",;",'')='-1' then return 
end if

closewithreturn(parent,tag)
end event

event constructor;text=''
end event

