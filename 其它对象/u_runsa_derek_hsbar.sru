$PBExportHeader$u_runsa_derek_hsbar.sru
forward
global type u_runsa_derek_hsbar from hscrollbar
end type
end forward

global type u_runsa_derek_hsbar from hscrollbar
integer width = 293
integer height = 64
boolean stdheight = false
end type
global u_runsa_derek_hsbar u_runsa_derek_hsbar

type variables
datawindow idw
end variables

forward prototypes
public subroutine setpos (integer ai_pos)
end prototypes

public subroutine setpos (integer ai_pos);position=ai_pos
if ai_pos=0 then 
	visible=false
else 
	visible=true
end if 
end subroutine

on u_runsa_derek_hsbar.create
end on

on u_runsa_derek_hsbar.destroy
end on

event pageright;long l_pos
if isvalid(idw) then 
	l_pos=position + UnitsToPixels (idw.width,xUnitsToPixels!)
	if l_pos>maxposition then l_pos=maxposition
	idw.Object.DataWindow.HorizontalScrollPosition=l_pos
	position=l_pos
end if
end event

event pageleft;long l_pos
if isvalid(idw) then 
	l_pos=position - UnitsToPixels (idw.width,xUnitsToPixels!)
	if l_pos<0 then l_pos=0
	idw.Object.DataWindow.HorizontalScrollPosition=l_pos
	position=l_pos
end if
end event

event moved;if isvalid(idw) then 
	idw.object.DataWindow.HorizontalScrollPosition=scrollpos
end if
end event

event lineleft;event pageleft()
end event

event lineright;event pageright()
end event

