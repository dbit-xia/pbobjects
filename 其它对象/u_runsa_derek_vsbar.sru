$PBExportHeader$u_runsa_derek_vsbar.sru
forward
global type u_runsa_derek_vsbar from vscrollbar
end type
end forward

global type u_runsa_derek_vsbar from vscrollbar
integer width = 73
integer height = 256
boolean stdwidth = false
end type
global u_runsa_derek_vsbar u_runsa_derek_vsbar

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

on u_runsa_derek_vsbar.create
end on

on u_runsa_derek_vsbar.destroy
end on

event moved;if isvalid(idw) then 
	idw.object.DataWindow.VerticalScrollPosition=scrollpos
end if
end event

event pagedown;if isvalid(idw) then 
	idw.ScrollNextPage ( )
	this.position=long(idw.Object.DataWindow.VerticalScrollPosition)
end if
end event

event pageup;if isvalid(idw) then 
	idw.ScrollPriorPage ( )
	this.position=long(idw.Object.DataWindow.VerticalScrollPosition)
end if
end event

event linedown;event pagedown()
end event

event lineup;event pageup()
end event

