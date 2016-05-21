$PBExportHeader$uo_picturebutton.sru
forward
global type uo_picturebutton from picturebutton
end type
end forward

global type uo_picturebutton from picturebutton
string tag = "A"
integer width = 261
integer height = 168
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
boolean flatstyle = true
vtextalign vtextalign = vcenter!
event ue_lbdown pbm_lbuttondown
event ue_lbup pbm_lbuttonup
event ue_lblongdown ( )
event ue_enable pbm_enable
event ue_mouseactivate pbm_mouseactivate
event ue_disclicked pbm_bnclicked
event ue_keyup pbm_keyup
event keydown pbm_keydown
event type long ue_clicked ( )
event ue_ncpaint pbm_ncpaint
event ue_afteropen ( )
end type
global uo_picturebutton uo_picturebutton

type prototypes
FUNCTION ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"

FUNCTION ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"



		
end prototypes

type variables
private string is_picname0
string is_picname2 /*点击切换图片*/
boolean ib_down
long il_cpu
long il_millsec
int i_recx1=3,i_recy1=3
int i_ovalwidth=17,i_ovalheight=17
private boolean ib_initialized
protected boolean ib_enabled=true
end variables

forward prototypes
public function string uf_setvalue (string ls_var, string ls_value)
public function integer settext (string ls_text)
end prototypes

event ue_lbup;if ib_down=false then return 
ib_down=false

//如果对象已关闭
if not(isvalid(this)) then return 

if xpos<0 or ypos<0 or xpos>width or ypos>height then
	
else
	event ue_clicked()
end if

if not(isvalid(this)) then return 
event ue_enable(enabled)

if is_picname0<>'' then 
	picturename=is_picname0
//else
//	map3dcolors=(map3dcolors=false)
end if

end event

event ue_enable;if ib_enabled=false and enabled=true then 
	enabled=ib_enabled
	return 1
end if
//
//if enable=false then
//	picturename=DisabledName
//else
//	if is_picname0<>'' then picturename=is_picname0
//end if
end event

event ue_mouseactivate;if not (message=513 ) then return 
if is_picname2<>'' then 
	is_picname0=picturename
	picturename=is_picname2
//else
//	map3dcolors=(map3dcolors=false)
end if

ib_down=true
end event

event ue_disclicked;//用于屏蔽clicked事件,将在ue_lbup事件中触发clicked事件

end event

event ue_keyup;if key=KeySpaceBar!  then 
	event ue_clicked()
end if


end event

event keydown;if key=keyenter!  then 
	event ue_clicked()
end if

end event

event type long ue_clicked();//自定义事件,可以控制在clicked事件前后
if ib_enabled=false then return 0 //禁止点击
return event clicked()
end event

event ue_ncpaint;if ib_initialized=false then event ue_afteropen()
end event

event ue_afteropen();string ls_picturename
if enabled=true then 
	ls_picturename=picturename
else
	ls_picturename=disabledname
end if
if fileexists(ls_picturename) then text=''

ib_initialized=true
end event

public function string uf_setvalue (string ls_var, string ls_value);choose case ls_var
	case 'enabled'
		ib_enabled=(ls_value='1')
		if ib_enabled=false then enabled=ib_enabled
end choose

return ''
end function

public function integer settext (string ls_text);text=ls_text
return 0
end function

on uo_picturebutton.create
end on

on uo_picturebutton.destroy
end on

