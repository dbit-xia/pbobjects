$PBExportHeader$u_runsa_derek_pic2.sru
$PBExportComments$数据窗口翻页图片
forward
global type u_runsa_derek_pic2 from picture
end type
end forward

global type u_runsa_derek_pic2 from picture
integer width = 247
integer height = 336
boolean originalsize = true
boolean focusrectangle = false
event ue_enable pbm_enable
event ue_constructor ( )
event ue_lbdown pbm_lbuttondown
event ue_mouseactivate pbm_mouseactivate
event ue_disclicked pbm_bnclicked
event ue_lbup pbm_lbuttonup
end type
global u_runsa_derek_pic2 u_runsa_derek_pic2

type variables
private string is_picname1	//保存默认路径(不需要赋值)
string is_picname2	//按下的路径
string DisabledName //不可用路径
string is_picname3
u_runsa_derek_dw2 idw
string is_action	//设置动作(pageup,pagedown)
private boolean ib_press
end variables

event ue_enable;if enable=false then
	picturename=DisabledName
else
	picturename=is_picname1
end if
end event

event ue_constructor();if is_picname1='' then is_picname1=picturename
if is_picname2='' then is_picname2=is_picname1
if is_picname3='' then is_picname3=is_picname1
if DisabledName='' then DisabledName=is_picname3

event ue_enable(enabled)
end event

event ue_mouseactivate;//用此事件代替lbuttondown事件,因为lbuttondown执行不够及时
if message<>513 then return 
picturename=is_picname2
ib_press=true


end event

event ue_disclicked;//用于屏蔽按钮的clicked事件,请不要删除
//会在ue_lbup事件后自动触发clicked事件
end event

event ue_lbup;if ib_press=false then return //会影响单击速度
ib_press=false

//if xpos<0 or ypos<0 or xpos>width or ypos>height then

if GetFocus ( )=this then
	event clicked()
end if

event ue_enable(enabled)




	
end event

on u_runsa_derek_pic2.create
end on

on u_runsa_derek_pic2.destroy
end on

event constructor;post event ue_constructor()
end event

event clicked;if is_action='pageup' then
	idw.ScrollpriorPage()
elseif is_action='pagedown' then
	idw.ScrollnextPage()
end if

end event

