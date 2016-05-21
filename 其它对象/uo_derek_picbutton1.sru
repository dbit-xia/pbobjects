$PBExportHeader$uo_derek_picbutton1.sru
$PBExportComments$图片按钮对象,可以单独使用
forward
global type uo_derek_picbutton1 from picturebutton
end type
end forward

global type uo_derek_picbutton1 from picturebutton
string tag = "A"
integer width = 375
integer height = 212
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
boolean flatstyle = true
string picturename = "btn1_link.png"
string disabledname = "btn1_link.png"
vtextalign vtextalign = vcenter!
long backcolor = 553648127
event ue_lbdown pbm_lbuttondown
event ue_lbup pbm_lbuttonup
event ue_lblongdown ( )
event ue_lbdown2 ( )
event ue_enable pbm_enable
event ue_lbdclick pbm_lbuttondblclk
event ue_mousemove pbm_mousemove
end type
global uo_derek_picbutton1 uo_derek_picbutton1

type prototypes
FUNCTION ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"

FUNCTION ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"



		
end prototypes

type variables
string is_picname1,is_picname2="btn1_hover.png" /*点击切换图片*/
boolean ib_down
long il_cpu
long il_millsec
int i_recx1=3,i_recy1=3
int i_ovalwidth=18,i_ovalheight=18
int i_allow
end variables

event ue_lbdown;//if enabled=false then return 

is_picname1=picturename
if is_picname2<>'' then picturename=is_picname2

ib_down=true
//post event ue_lbdown2()

//父对象有按钮按下
//parent.dynamic uf_downstate(true)
end event

event ue_lbup;

//if enabled=false then return 
if is_picname1<>'' then picturename=is_picname1
ib_down=false
//父对象无按钮按下
//parent.dynamic uf_downstate(false)
//parent.dynamic uf_setfocus()
end event

event ue_lblongdown();//parent.dynamic event ue_pblongdown(this)

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
int li_pos

//,modify=1,,check=1,,uncheck=1,,print=1,,add=1,,delete=1,,invisible=;

choose case lower(text)
	case 'add','new'
		li_pos=pos(gs_admit,',add=1')
	case 'modify','convert','generate','submit','import'
		li_pos=pos(gs_admit,',modify=1')
	case 'delete'
		li_pos=pos(gs_admit,',delete=1')
	case 'approval/reject'
		li_pos=pos(gs_admit,',uncheck=1') * pos(gs_admit,',check=1')
	case 'reject','uncheck'
		li_pos=pos(gs_admit,',uncheck=1')
	case 'approval','check'
		li_pos=pos(gs_admit,',check=1')
	case 'print','export'
		li_pos=pos(gs_admit,',print=1')
end choose

if li_pos>0 and enabled=true then 
	enabled=false
end if

end event

event ue_lbdclick;triggerevent("clicked")

end event

event constructor;ulong width1,height1,rgnh;
int l_diff=-5
width1=UnitsToPixels(width,XUnitsToPixels!)+1
height1=UnitsToPixels(height,YUnitsToPixels!)+1

Environment env
if env.OSMinorRevision<>2 then
	l_diff=0
end if 

rgnh = CreateRoundRectRgn(i_recx1,i_recy1, width1 - i_recx1 , height1 - i_recy1 - 3,i_ovalwidth + l_diff,i_ovalheight + l_diff)//参数可适当调整以适应按钮的图片
SetWindowRgn(handle(this), rgnh, True)

if is_picname1='' then is_picname1=picturename
//powertiptext=text

//gs_admit=''
//f_menu_control_special(parent,g_menutext)
//event ue_enable(enabled)

end event

on uo_derek_picbutton1.create
end on

on uo_derek_picbutton1.destroy
end on

