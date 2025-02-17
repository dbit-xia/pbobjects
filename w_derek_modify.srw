$PBExportHeader$w_derek_modify.srw
$PBExportComments$可继承的修改窗口
forward
global type w_derek_modify from w_derek_window
end type
type pb_delete from uo_derek_picbutton1 within w_derek_modify
end type
type pb_1 from uo_derek_picbutton1 within w_derek_modify
end type
type pb_export from uo_derek_picbutton1 within w_derek_modify
end type
type dw_main from uo_derek_datawindow within w_derek_modify
end type
type pb_query from uo_derek_picbutton1 within w_derek_modify
end type
type pb_exit from uo_derek_picbutton1 within w_derek_modify
end type
type pb_import from uo_derek_picbutton1 within w_derek_modify
end type
type pb_cancel from uo_derek_picbutton1 within w_derek_modify
end type
type pb_save from uo_derek_picbutton1 within w_derek_modify
end type
type pb_modify from uo_derek_picbutton1 within w_derek_modify
end type
type pb_add from uo_derek_picbutton1 within w_derek_modify
end type
end forward

global type w_derek_modify from w_derek_window
integer width = 3675
integer height = 1924
string title = ""
string menuname = ""
windowtype windowtype = popup!
windowstate windowstate = normal!
pb_delete pb_delete
pb_1 pb_1
pb_export pb_export
dw_main dw_main
pb_query pb_query
pb_exit pb_exit
pb_import pb_import
pb_cancel pb_cancel
pb_save pb_save
pb_modify pb_modify
pb_add pb_add
end type
global w_derek_modify w_derek_modify

type variables
string is_columns=""
u_derek_dd u_dd
u_runsa_derek u_derek
u_derek_api u_api
end variables

forward prototypes
public function long wf_dwquery (datawindow adw)
end prototypes

public function long wf_dwquery (datawindow adw);return 0
end function

on w_derek_modify.create
int iCurrent
call super::create
this.pb_delete=create pb_delete
this.pb_1=create pb_1
this.pb_export=create pb_export
this.dw_main=create dw_main
this.pb_query=create pb_query
this.pb_exit=create pb_exit
this.pb_import=create pb_import
this.pb_cancel=create pb_cancel
this.pb_save=create pb_save
this.pb_modify=create pb_modify
this.pb_add=create pb_add
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_delete
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.pb_export
this.Control[iCurrent+4]=this.dw_main
this.Control[iCurrent+5]=this.pb_query
this.Control[iCurrent+6]=this.pb_exit
this.Control[iCurrent+7]=this.pb_import
this.Control[iCurrent+8]=this.pb_cancel
this.Control[iCurrent+9]=this.pb_save
this.Control[iCurrent+10]=this.pb_modify
this.Control[iCurrent+11]=this.pb_add
end on

on w_derek_modify.destroy
call super::destroy
destroy(this.pb_delete)
destroy(this.pb_1)
destroy(this.pb_export)
destroy(this.dw_main)
destroy(this.pb_query)
destroy(this.pb_exit)
destroy(this.pb_import)
destroy(this.pb_cancel)
destroy(this.pb_save)
destroy(this.pb_modify)
destroy(this.pb_add)
end on

event resize;call super::resize;//处理dw_main的大小
if oldwidth<>0 then controlresize(dw_main,7)
end event

type pb_delete from uo_derek_picbutton1 within w_derek_modify
integer x = 3570
integer y = 16
integer taborder = 100
integer weight = 700
string text = "Delete"
end type

event clicked;call super::clicked;
long l_rows,i
string ls_msg
datawindow ldw
ldw=dw_main

l_rows=long(ldw.describe("Evaluate('sum(if(isselected(),1,0))',0)"))

if l_rows=0 and ldw.getrow()>0 then 
	ls_msg='You want to delete the current row?'
elseif l_rows=1 then 
	ls_msg='You want to delete the 1 row?'
elseif l_rows>1 then
	ls_msg='You want to delete the '+string(l_rows)+' rows?'
else
	return -1
end if 

if f_messagebox('',ls_msg,2,2)=2 then return 0

if l_rows=0 then 
	ldw.deleterow(0)
	return 1
elseif l_rows=1 then 
	ldw.deleterow(ldw.getselectedrow(0))
	return 1
elseif l_rows>1 then 
	i=ldw.getselectedrow(0)
	do 
		ldw.deleterow(i)
		i=ldw.getselectedrow(i - 1)
	loop  until i=0
	return l_rows
end if



end event

type pb_1 from uo_derek_picbutton1 within w_derek_modify
integer x = 3223
integer y = 20
integer taborder = 90
integer weight = 700
string text = "Print"
end type

event clicked;call super::clicked;
s_ps.dw_1=dw_main
open(w_print_setting)


end event

type pb_export from uo_derek_picbutton1 within w_derek_modify
integer x = 2857
integer y = 20
integer taborder = 80
integer weight = 700
string text = "Export"
end type

event clicked;call super::clicked;//设置当前目录
g_current_path=GetCurrentDirectory()
u_derek.uf_savesa_lc( dw_main,'')
u_api.SetCurrentDirectory(g_current_path)
end event

type dw_main from uo_derek_datawindow within w_derek_modify
integer x = 32
integer y = 236
integer width = 3561
integer height = 1560
integer taborder = 80
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylebox!
end type

event rbuttondown;call super::rbuttondown;f_wgz_zg_sort(this,'')
end event

event rowfocuschanging;call super::rowfocuschanging;return f_runsa_derek_dw_multi(this,currentrow,newrow)
end event

type pb_query from uo_derek_picbutton1 within w_derek_modify
integer x = 2478
integer y = 20
integer taborder = 70
integer weight = 700
string text = "Query"
end type

event clicked;call super::clicked;dw_main.retrieve()
wf_cbstate_modify(false)
end event

type pb_exit from uo_derek_picbutton1 within w_derek_modify
integer x = 2098
integer y = 20
integer taborder = 60
integer weight = 700
string text = "Exit"
end type

event clicked;call super::clicked;close(parent)
end event

type pb_import from uo_derek_picbutton1 within w_derek_modify
integer x = 1687
integer y = 20
integer taborder = 50
integer weight = 700
string text = "Import"
end type

type pb_cancel from uo_derek_picbutton1 within w_derek_modify
integer x = 1275
integer y = 20
integer taborder = 40
integer weight = 700
string text = "Cancel"
end type

event clicked;call super::clicked;dw_main.retrieve()
wf_cbstate_modify(false)
end event

type pb_save from uo_derek_picbutton1 within w_derek_modify
integer x = 864
integer y = 20
integer taborder = 30
integer weight = 700
string text = "Save"
end type

event clicked;call super::clicked;if dw_main.update()=1 then
	commit;
	wf_cbstate_modify(false)
else
	rollback;
	messagebox('','failture')
	return 
end if


end event

type pb_modify from uo_derek_picbutton1 within w_derek_modify
integer x = 453
integer y = 20
integer taborder = 20
integer weight = 700
string text = "Modify"
end type

event clicked;call super::clicked;wf_cbstate_modify(true)
enabled=false
end event

type pb_add from uo_derek_picbutton1 within w_derek_modify
integer x = 41
integer y = 20
integer taborder = 10
integer weight = 700
string text = "Add"
end type

event clicked;call super::clicked;long l_row
l_row=dw_main.insertrow(0)
DW_MAIN.scrolltorow(l_row)

end event

