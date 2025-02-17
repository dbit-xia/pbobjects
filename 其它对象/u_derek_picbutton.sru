$PBExportHeader$u_derek_picbutton.sru
$PBExportComments$浪沙数字键盘上的按钮对象
forward
global type u_derek_picbutton from picturebutton
end type
end forward

global type u_derek_picbutton from picturebutton
string tag = "A"
integer width = 306
integer height = 200
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
event ue_lbdown2 ( )
event ue_enable pbm_enable
event ue_mouseactivate pbm_mouseactivate
event ue_disclicked pbm_bnclicked
end type
global u_derek_picbutton u_derek_picbutton

type prototypes
FUNCTION ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"

FUNCTION ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"



		
end prototypes

type variables
string is_picname1,is_picname2 /*点击切换图片*/
boolean ib_down
long il_cpu
long il_millsec
int i_recx1=3,i_recy1=3
int i_ovalwidth=17,i_ovalheight=17

end variables

event ue_lbup;if ib_down=false then return 
ib_down=false

if xpos<0 or ypos<0 or xpos>width or ypos>height then
	
else
	event clicked()
end if

event ue_enable(enabled)

//父对象无按钮按下
parent.dynamic uf_downstate(false)

end event

event ue_lblongdown();parent.dynamic event ue_pblongdown(this)

end event

event ue_lbdown2();il_cpu=cpu()
do while ib_down
	il_millsec=cpu() - il_cpu
	yield()
	event ue_lblongdown()
loop

end event

event ue_enable;if enable=false then
	picturename=DisabledName
else
	picturename=is_picname1
end if
end event

event ue_mouseactivate;if not (message=513 ) then return 
picturename=is_picname2

ib_down=true
//post event ue_lbdown2()

//父对象有按钮按下
parent.dynamic uf_downstate(true)

end event

event ue_disclicked;//用于屏蔽clicked事件,将在ue_lbup事件中触发clicked事件
end event

event constructor;ulong width1,height1,rgnh;

width1=UnitsToPixels(width,XUnitsToPixels!)+1
height1=UnitsToPixels(height,YUnitsToPixels!)+1

rgnh = CreateRoundRectRgn(i_recx1,i_recy1, width1 - i_recx1 , height1 - i_recy1,i_ovalwidth,i_ovalheight)//参数可适当调整以适应按钮的图片
SetWindowRgn(handle(this), rgnh, True)

if is_picname1='' then is_picname1=picturename
if is_picname2='' then is_picname2=is_picname1

event ue_enable(enabled)

end event

on u_derek_picbutton.create
end on

on u_derek_picbutton.destroy
end on

event clicked;parent.dynamic uf_sendkeys(this)
end event

