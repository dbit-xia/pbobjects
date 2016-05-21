$PBExportHeader$w_derek_printer.srw
forward
global type w_derek_printer from window
end type
type dw_1 from datawindow within w_derek_printer
end type
end forward

global type w_derek_printer from window
integer width = 1408
integer height = 1148
boolean titlebar = true
string title = "打印机选择"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_derek_printer w_derek_printer

on w_derek_printer.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_derek_printer.destroy
destroy(this.dw_1)
end on

event open;string ls_stringparm
long l_row,l_rowcount
l_rowcount=dw_1.importstring(Text!,PrintGetPrinters())
if l_rowcount=0 then return 
ls_stringparm=message.stringparm
if isnull(ls_stringparm) or ls_stringparm='' then
else
	l_row=dw_1.find("#1='"+ls_stringparm+"'",1,l_rowcount)
	if l_row<>0 then
		dw_1.scroll(l_row)
		dw_1.Modify("DataWindow.Selected='"+string(l_row)+"/"+string(l_row)+"/printers/printers'")
	end if
end if
end event

type dw_1 from datawindow within w_derek_printer
integer width = 1399
integer height = 1080
integer taborder = 10
string title = "none"
string dataobject = "d_derek_printer"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row=0 then return 
closewithreturn(parent,getitemstring(row,1))
end event

