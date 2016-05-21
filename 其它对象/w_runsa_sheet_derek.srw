$PBExportHeader$w_runsa_sheet_derek.srw
$PBExportComments$批量处理
forward
global type w_runsa_sheet_derek from w_zg_navigate_parent
end type
end forward

global type w_runsa_sheet_derek from w_zg_navigate_parent
integer width = 1632
integer height = 940
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
windowstate windowstate = maximized!
event ue_openend ( )
end type
global w_runsa_sheet_derek w_runsa_sheet_derek

type variables
private boolean ib_openend
string is_stringparm
end variables

event ue_openend();window lw_parentwindow
lw_parentwindow=parentwindow()
if isvalid(lw_parentwindow) then 
	if title='' then title='无标题'
	lw_parentwindow .dynamic wf_sheet_add(this,title)
end if

ib_openend=true

end event

on w_runsa_sheet_derek.create
call super::create
end on

on w_runsa_sheet_derek.destroy
call super::destroy
end on

event activate;call super::activate;window lw_parentwindow
lw_parentwindow=parentwindow()
IF IsValid (lw_parentwindow) and ib_openend=true THEN 
	lw_parentwindow.dynamic wf_sheet_activate (f_runsatony_menu(title))
end if

end event

event open;call super::open;is_stringparm=message.stringparm
title=f_maintain_s(is_stringparm,'title=','nochange')
this.backcolor=rgb(238,249,253)
post event ue_openend()

end event

event close;call super::close;
window lw_parentwindow
lw_parentwindow=parentwindow()
IF IsValid (lw_parentwindow) THEN lw_parentwindow.dynamic wf_sheet_del (f_runsatony_menu(title))
end event

