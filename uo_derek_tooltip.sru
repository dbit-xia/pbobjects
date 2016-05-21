$PBExportHeader$uo_derek_tooltip.sru
forward
global type uo_derek_tooltip from datawindow
end type
end forward

global type uo_derek_tooltip from datawindow
integer width = 466
integer height = 252
boolean enabled = false
string title = "none"
string dataobject = "d_derek_tooltip"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event ue_show pbm_showwindow
event ue_mouseactivate pbm_mouseactivate
end type
global uo_derek_tooltip uo_derek_tooltip

type variables
dragobject ido_current
string is_ObjectAtPointer
end variables

forward prototypes
public subroutine uf_sleep ()
end prototypes

event ue_show;//parent.settext( text)
//resize( parent.width, parent.height)
string ls_width,ls_height,ls_modify
string ls_objects[]={'rr_1'}
int i,i_count,i_textheight,i_y
ls_height=string(unitstopixels(height,Yunitstopixels!))
ls_width=string(unitstopixels(width,Xunitstopixels!))
i_count=upperbound(ls_objects[])
//ls_modify='datawindow.header.height="'+ls_height+'" '

//i_textheight=long(describe('t_text.height'))
//i_y=(long(ls_height) - i_textheight) / 2

//ls_modify+='t_text.width="'+ls_width+'" t_text.y="'+string(i_y)+'" '

for i=1 to i_count
	ls_modify+=ls_objects[i]+'.x="0" '
	ls_modify+=ls_objects[i]+'.y="0" '
	ls_modify+=ls_objects[i]+'.width="'+ls_width+'" '
	ls_modify+=ls_objects[i]+'.height="'+ls_height+'" '
next

//modify(ls_modify)
//uf_draw('enable','')
//if isvalid(ido_current) then
//	i_x=ido_current.pointerX()
//	i_Y=ido_current.pointerY()
//end if
//post uf_sleep()

end event

public subroutine uf_sleep ();//long l_cpu
//l_cpu=cpu()
//datawindow ldw_temp
//do
//	yield()
//	if isnull(this) then return 
//	if not isvalid(this) then return 
//	if visible=false then return 
//	if isvalid(ido_current) then 
//		if typeof(ido_current)=datawindow! then
//			ldw_temp=ido_current
//			if ldw_temp.getobjectatpointer()<>is_ObjectAtPointer then exit
//		else
//			if ido_current.PointerX()<0 then exit
//			if ido_current.PointerX()>ido_current.width then exit
//			if ido_current.PointerY()<0 then exit
//			if ido_current.PointerY()>ido_current.height then exit
//		end if
//	end if
//loop until 1<>1 //cpu() - l_cpu>=3000
//
//if isvalid(this) then
//	if visible=true then hide()
//end if
//
end subroutine

on uo_derek_tooltip.create
end on

on uo_derek_tooltip.destroy
end on

