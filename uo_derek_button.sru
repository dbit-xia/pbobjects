$PBExportHeader$uo_derek_button.sru
forward
global type uo_derek_button from userobject
end type
type dw__ from datawindow within uo_derek_button
end type
end forward

global type uo_derek_button from userobject
integer width = 283
integer height = 360
long backcolor = 553648127
string text = "None"
long tabtextcolor = 33554432
long picturemaskcolor = 134217729
event clicked pbm_bnclicked
event ue_clicked pbm_bnclicked
event ue_enable pbm_enable
event getfocus pbm_setfocus
dw__ dw__
end type
global uo_derek_button uo_derek_button

type prototypes
Function Long SetCapture(Long hwnd) library "user32"
Function Long ReleaseCapture() library "user32"
Function Long GetCapture() library "user32"
end prototypes

type variables
private boolean ib_mousemove //是否已触发mousemove
private boolean ib_initial
protected boolean ib_enabled=true 
private boolean ib_lbdown //右键按下
end variables

forward prototypes
public function integer settext (string ls_text)
public function string uf_draw (string ls_var, string ls_value)
public function string uf_setvalue (string ls_var, string ls_value)
end prototypes

event ue_enable;if ib_enabled=false and enabled=true then 
	enabled=ib_enabled
	return 1
end if

post uf_draw('enable','')

end event

event getfocus;setfocus(dw__)
end event

public function integer settext (string ls_text);dw__.object.t_text.text=ls_text
return 0
end function

public function string uf_draw (string ls_var, string ls_value);ib_initial=true
long l_xpos,l_ypos
choose case ls_var
	case 'enable'
		if enabled=true then 
			//dw__.modify('rr_enable.x=0 rr_enable.y=0')
			dw__.setposition('rr_enable','band', true)
		else
			//dw__.modify('rr_disable.x=0 rr_disable.y=0')
			dw__.setposition('rr_disable','band', true)
		end if
	case 'mousemove'
		if ib_lbdown=false then 
			dw__.setposition('rr_mousemove','band', true)
		end if
	case 'press'
		//dw__.modify('rr_press.x=0 rr_press.y=0')
		dw__.setposition('rr_press','band', true)
	case 'mouseleave'
		if ib_lbdown=false then 
			uf_draw('enable','')
		end if
	case 'unpress'
		l_xpos=pointerX()
		l_ypos=pointerY()
		if l_xpos>=0 and l_xpos<=width and l_ypos>=0 and l_ypos<=height then 
			uf_draw('mousemove','')
		else
			uf_draw('enable','')
		end if
end choose
return ''
end function

public function string uf_setvalue (string ls_var, string ls_value);choose case ls_var
	case 'enabled'
		ib_enabled=(ls_value='1')
		if ib_enabled=false then enabled=ib_enabled
end choose

return ''
end function

on uo_derek_button.create
this.dw__=create dw__
this.Control[]={this.dw__}
end on

on uo_derek_button.destroy
destroy(this.dw__)
end on

type dw__ from datawindow within uo_derek_button
event ue_dwnlbuttonup pbm_dwnlbuttonup
event ue_dwnmousemove pbm_dwnmousemove
event type long ue_mouseleave ( )
event ue_mouseactivate pbm_mouseactivate
event ue_nclbuttondown pbm_ncpaint
event keydown pbm_dwnkey
event ue_enter pbm_dwnprocessenter
event keyup pbm_keyup
integer width = 279
integer height = 292
integer taborder = 10
string title = "none"
string dataobject = "d_derek_button"
boolean border = false
end type

event ue_dwnlbuttonup;if ib_enabled=false then return 0 //禁止点击
//xpos/ypos 为像素
if ib_lbdown then 
	ib_lbdown=false
	if GetCapture()=handle(this) then ReleaseCapture()
	if not isvalid(this) then return //防止窗口先关闭
	//转换为pbunits
	xpos=pixelstounits(xpos,Xpixelstounits!)
	ypos=pixelstounits(ypos,ypixelstounits!)
	if xpos>=0 and xpos<=width and ypos>=0 and ypos<=height then 
		event clicked()
	end if
	if not isvalid(this) then return  //防止窗口先关闭
	uf_draw('unpress','')
end if

end event

event ue_dwnmousemove;if ib_lbdown=true then return 
if ib_mousemove=false then 
	ib_mousemove=true 
	uf_draw('mousemove','')
end if


end event

event type long ue_mouseleave();if ib_lbdown then return 0 //按下时不重绘
uf_draw('mouseleave','')
ib_mousemove=false
return 0
end event

event ue_mouseactivate;if message=513 then //左击事件
	uf_draw('press','')
	ib_lbdown=true
	SetCapture(handle(this))
end if
end event

event keydown;if key=KeySpaceBar! then  
	uf_draw('press','')
end if
end event

event ue_enter;uf_draw('press','')
event clicked()
if isvalid(this) then uf_draw('unpress','')

end event

event keyup;
if key=KeySpaceBar! then 
	if isvalid(this) then uf_draw('unpress','')
	event clicked()
end if
end event

event constructor;
parent.settext( text)
resize( parent.width, parent.height)
string ls_width,ls_height,ls_modify
string ls_objects[]={'rr_enable','rr_disable','rr_mousemove','rr_press'}
int i,i_count,i_textheight,i_y
ls_height=string(unitstopixels(parent.height,Yunitstopixels!))
ls_width=string(unitstopixels(parent.width,Xunitstopixels!))
i_count=upperbound(ls_objects[])
ls_modify='datawindow.header.height="'+ls_height+'" '

i_textheight=long(describe('t_text.height'))
i_y=(long(ls_height) - i_textheight) / 2

ls_modify+='t_text.width="'+ls_width+'" t_text.y="'+string(i_y)+'" '

for i=1 to i_count
	ls_modify+=ls_objects[i]+'.x="0" '
	ls_modify+=ls_objects[i]+'.y="0" '
	ls_modify+=ls_objects[i]+'.width="'+ls_width+'" '
	ls_modify+=ls_objects[i]+'.height="'+ls_height+'" '
next

modify(ls_modify)
uf_draw('enable','')


end event

event other;if message.number=675 then triggerevent("ue_mouseleave")
if message.number=1305 then 
	return 1 //不允许导出
end if
end event

event getfocus;string ls_modify
string ls_objects[]={'rr_enable','rr_disable','rr_mousemove','rr_press'}
int i,i_count
i_count=upperbound(ls_objects[])
for i=1 to i_count
	ls_modify+=ls_objects[i]+'.Pen.Style="2" '
next

modify(ls_modify)

end event

event losefocus;ib_lbdown=false
if GetCapture()=handle(this) then ReleaseCapture()
string ls_modify
string ls_objects[]={'rr_enable','rr_disable','rr_mousemove','rr_press'}
int i,i_count
i_count=upperbound(ls_objects[])
for i=1 to i_count
	ls_modify+=ls_objects[i]+'.Pen.Style="0" '
next

modify(ls_modify)

end event

