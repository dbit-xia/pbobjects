$PBExportHeader$u_runsa_derek_dw.sru
forward
global type u_runsa_derek_dw from datawindow
end type
end forward

global type u_runsa_derek_dw from datawindow
integer width = 896
integer height = 780
string title = "none"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event ue_lbup pbm_dwnlbuttonup
end type
global u_runsa_derek_dw u_runsa_derek_dw

type variables
string is_draw_where	//out为在窗口上画图(可以拖拉,可以用水平滚动条,不会打印出图片),否则为在数据窗口内部画图(不可用水平滚动条)
string is_bottom_band	//footer 为最下方的图片画在footer里(可以打印,不可以拖拉),否则为background(可以拖拉,不可打印),均不可用水平滚动条
u_derek_api u_api
u_runsa_derek_vsbar ivsb	//要使用的垂直滚动条,必须是u_runsa_derek_vsbar创建
u_runsa_derek_hsbar ihsb	//要使用的水平滚动条,必须是u_runsa_derek_hsbar创建
//int i_spos
window iw_parent	//要画图的父窗口,使用时自动赋值
end variables
forward prototypes
public subroutine newpic (string as_filepath, integer ai_x, integer ai_y, integer ai_width, integer ai_height)
public subroutine newpic (string as_filepath, integer ai_x, integer ai_y)
public subroutine afteretrieve ()
public subroutine outdraw ()
end prototypes

event ue_lbup;
//if ypos <= long(describe("datawindow.header.height")) then 
	 post afteretrieve()
//end if

end event

public subroutine newpic (string as_filepath, integer ai_x, integer ai_y, integer ai_width, integer ai_height);/*
在窗口上画图,
参数:as_filepath 为图片路径
ai_x 为X轴(-1为数据窗口的右边缘)
ai_Y 为Y轴(-1为数据窗口的下边缘)
ai_width 为图片宽度(0=原始宽度)
ai_height 为图片高度(0=原始高度)
*/

picture lpic;
iw_parent.OpenUserObject( lpic, "picture", ai_x, ai_y);
lpic.picturename =as_filepath
lpic.originalsize = true
lpic.originalsize = false

if ai_x=-1  then ai_x=x + width - lpic.width

if ai_y=-1  then ai_y=y + height - lpic.height

lpic.move(ai_x,ai_y)

if ai_width<>0 then lpic.width=ai_width

if ai_height<>0 then lpic.height=ai_height

lpic.focusrectangle = false
iw_parent.control[ UpperBound( iw_parent.control ) + 1] =  lpic
end subroutine

public subroutine newpic (string as_filepath, integer ai_x, integer ai_y);/*
在窗口上画图,
参数:as_filepath 为图片路径
ai_x 为X轴(-1为数据窗口的右边缘)
ai_Y 为Y轴(-1为数据窗口的下边缘)

*/


picture lpic;
iw_parent.OpenUserObject( lpic, "picture", ai_x, ai_y);
lpic. picturename =as_filepath
lpic. originalsize = true

if ai_x=-1  then ai_x=x + width - lpic.width

if ai_y=-1  then ai_y=y + height - lpic.height

lpic.move(ai_x,ai_y)

lpic. focusrectangle = false
iw_parent.control[ UpperBound(iw_parent. control ) + 1] =  lpic
end subroutine

public subroutine afteretrieve ();/*
处理滚动条的位置等
*/

boolean lb_hasvsb=false,lb_hashsb=false

if isvalid(ivsb) and long(this.DESCRIBE("DataWindow.VerticalScrollMaximum"))>0 then lb_hasvsb=true
if isvalid(ihsb) and long(this.DESCRIBE("DataWindow.HorizontalScrollMaximum"))>0 then lb_hashsb=true

if lb_hasvsb then
	//垂直滚动条
	ivsb.idw=this

	if lb_hashsb then
		ivsb.height=this.height - PixelsToUnits(long(this.object.datawindow.header.height),YPixelsToUnits! ) - PixelsToUnits(long(this.object.datawindow.footer.height),YPixelsToUnits! ) - ihsb.height
	else
		ivsb.height=this.height - PixelsToUnits(long(this.object.datawindow.header.height),YPixelsToUnits! ) - PixelsToUnits(long(this.object.datawindow.footer.height),YPixelsToUnits! )
	end if
	ivsb.maxposition=long(this.Describe("DataWindow.VerticalScrollMaximum"))

	ivsb.move(this.x + this.width - ivsb.width,this.y+ PixelsToUnits(long(this.object.datawindow.header.height),YPixelsToUnits! ))
	
	ivsb.visible=true	
else
	if isvalid(ivsb) then ivsb.visible=false
end if


if lb_hashsb then 
	ihsb.idw=this
	if lb_hasvsb then
		ihsb.width=this.width - ivsb.width
	else	
		ihsb.width=this.width
	end if
	ihsb.maxposition=long(this.Describe("DataWindow.HorizontalScrollMaximum"))
	ihsb.move(this.x,this.y+ height - ihsb.height)
	
	ihsb.visible=true
else
	if isvalid(ihsb) then  ihsb.visible=false
end if
	
end subroutine

public subroutine outdraw ();iw_parent=parent
	
newpic("rd_01.gif",x,y)
newpic("rd_02.gif",-1,y)

//newpic("rd_05.gif",x,-1)
//newpic("rd_07.gif",-1,-1)

newpic("rd_05.gif",x,y+height)
newpic("rd_07.gif",-1,y+height)

newpic("rd_03.gif",x,y,width,0)
//newpic("rd_08.gif",x,-1,width,0)
newpic("rd_08.gif",x,y+height,width,0)

newpic("rd_04.gif",x,y,0,height)
newpic("rd_06.gif",-1,y,0,height)
end subroutine

on u_runsa_derek_dw.create
end on

on u_runsa_derek_dw.destroy
end on

event constructor;//
string ls_msg
ulong width1,height1,rgnh;

width1=UnitsToPixels(width,XUnitsToPixels!)+1
height1=UnitsToPixels(height,YUnitsToPixels!)+1

rgnh = u_api.CreateRoundRectRgn(0,0, width1 - 0 , height1 - 0,28,28)//参数可适当调整以适应按钮的图片
u_api.SetWindowRgn(handle(this), rgnh, True)


if upper(is_draw_where)='OUT' then		//在窗口上画图

	outdraw()
	
else	//在数据窗口内部画图
	
	ls_msg=f_derek_dwdraw(this,is_bottom_band)

	if ls_msg<>'' then messagebox('',ls_msg)
	
end if
end event

event retrieveend;post afteretrieve()
end event

event rowfocuschanged;post afteretrieve()
end event

event scrollvertical;if isvalid(ivsb) then 
	ivsb.position=scrollpos
end if
end event

event scrollhorizontal;if isvalid(ihsb) then 
	ihsb.position=scrollpos
end if

end event

