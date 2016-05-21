$PBExportHeader$uo_derek_picbutton.sru
$PBExportComments$浪沙数字键盘上的按钮对象
forward
global type uo_derek_picbutton from picturebutton
end type
end forward

global type uo_derek_picbutton from picturebutton
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
event ue_lbdclick pbm_lbuttondblclk
end type
global uo_derek_picbutton uo_derek_picbutton

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

event ue_lbdown;//if enabled=false then return 

is_picname1=picturename
if is_picname2<>'' then picturename=is_picname2

ib_down=true
//post event ue_lbdown2()

end event

event ue_lbup;

//if enabled=false then return 
if is_picname1<>'' then picturename=is_picname1
ib_down=false
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
	if DisabledName='' then DisabledName=picturename
end if
end event

event ue_lbdclick;triggerevent("clicked")

end event

event constructor;ulong width1,height1,rgnh;

width1=UnitsToPixels(width,XUnitsToPixels!)+1
height1=UnitsToPixels(height,YUnitsToPixels!)+1

rgnh = CreateRoundRectRgn(i_recx1,i_recy1, width1 - i_recx1 , height1 - i_recy1,i_ovalwidth,i_ovalheight)//参数可适当调整以适应按钮的图片
SetWindowRgn(handle(this), rgnh, True)

if is_picname1='' then is_picname1=picturename

end event

on uo_derek_picbutton.create
end on

on uo_derek_picbutton.destroy
end on

event clicked;
end event

