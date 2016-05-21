$PBExportHeader$w_runsa_derek_multiselect.srw
forward
global type w_runsa_derek_multiselect from window
end type
type cb_refresh from commandbutton within w_runsa_derek_multiselect
end type
type cb_showall from commandbutton within w_runsa_derek_multiselect
end type
type cb_showselected from commandbutton within w_runsa_derek_multiselect
end type
type dw_main from udw_runsa_derek_multiselect within w_runsa_derek_multiselect
end type
type cb_print from commandbutton within w_runsa_derek_multiselect
end type
type cb_cancel from commandbutton within w_runsa_derek_multiselect
end type
type cb_ok from commandbutton within w_runsa_derek_multiselect
end type
type ids from datastore within w_runsa_derek_multiselect
end type
end forward

global type w_runsa_derek_multiselect from window
integer width = 3566
integer height = 1908
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_refresh cb_refresh
cb_showall cb_showall
cb_showselected cb_showselected
dw_main dw_main
cb_print cb_print
cb_cancel cb_cancel
cb_ok cb_ok
ids ids
end type
global w_runsa_derek_multiselect w_runsa_derek_multiselect

type variables
string is_sql
string is_modify
u_derek_dd u_dd
powerobject ipo
blob ib_state_full

end variables

forward prototypes
public function string uf_setstyle (powerobject adw, integer ai_style)
public function blob uf_getimg (string as_name)
public function int getquery (powerobject dd, string as_sql, transaction at_sqlca, ref string as_error)
end prototypes

public function string uf_setstyle (powerobject adw, integer ai_style);string ls_modify,ls_ret
string ls_column[],ls_columns,ls_column_t[]
int i
string ls_errtext

choose case ai_style
	case 1
		ls_modify="DataWindow.color=15790320 datawindow.transparency=0 datawindow.selected.mouse='yes' "
		ls_modify+="datawindow.header.height=25 datawindow.detail.height=21 "
//		ls_modify+="DataWindow.Grid.Lines='1' "
		ls_modify+="DataWindow.HTMLTable.GenerateCSS='1' "	//保持格式及颜色
		ls_modify+="DataWindow.HTMLTable.Border='0' "	//不要table边框
		ls_modify+="DataWindow.HTMLTable.CellSpacing='0' "	//单元格无间距
		//ls_modify+="DataWindow.HTMLTable.CellPadding='0' "
		//ls_modify+="DataWindow.HTMLTable.NoWrap='0' "
//		ls_modify+="DataWindow.ReadOnly=yes "

		ls_column[]=u_dd.getcolumns(adw,0)
		
		for i=1 to upperbound(ls_column[])
			ls_columns+=ls_column[i]+','
			ls_column_t[i]=ls_column[i]+'_t'
		next
		
		ls_modify+=u_dd.getattribstring( ls_column_t[],'Y',"0")
		ls_modify+=u_dd.getattribstring( ls_column_t[],'height',"24")
		ls_modify+=u_dd.getattribstring( ls_column_t[],'font.height',"-9")
		
		ls_modify+=u_dd.getattribstring( ls_columns,'Border',"0")
		ls_modify+=u_dd.getattribstring( ls_columns,"Color",'0~tif(isRowModified(),rgb(225,0,0),rgb(0,0,0))' )
		ls_modify+=u_dd.getattribstring( ls_columns,'Y',"0")
		ls_modify+=u_dd.getattribstring( ls_columns,'height',"21")
		ls_modify+=u_dd.getattribstring( ls_columns,'font.height',"-9")
		ls_modify+=u_dd.getattribstring( ls_columns,'tabsequence',"0")
		ls_modify+=u_dd.getattribstring( ls_columns,'Background.Color',"16777215~~tif(getrow()=currentrow(),rgb(242,220,219),rgb(255,255,255))")

//		//行号
//		ls_ret=adw.dynamic describe("cp_rowno.name")
//		if ls_ret='!' then 
//			ls_modify+='create compute(band=detail alignment="2" expression="getrow()"border="6" color="0" x="-1" y="0" height="20~~trowheight() - 0" width="0" format="[GENERAL]" html.valueishtml="0"  name=cp_rowno visible="1"  font.face="Tahoma" font.height="-9" background.color="67108864" transparency="0" ) '
//		else
//			ls_modify+='cp_rowno.border="6" cp_rowno.height="20~~trowheight() - 0" cp_rowno.background.color="67108864" ' //15790320
//		end if
		
		ls_errtext=adw.dynamic modify(ls_modify)
		
		ls_ret=adw.dynamic describe("cp_check.name")
		if ls_ret='!' then 
			ls_modify='create compute(band=detail name=cp_check x="0" y="1" height="20" width="21" expression="bitmap(if(isSelected(),~'checked.png~',~'uncheck.png~'))" ) '
			ls_errtext+=dw_main.modify(ls_modify)
			ls_modify='create compute(band=header name=cp_check_t x="0" y="2" height="20" width="21" expression="bitmap(if(sum(if(isselected(),1,0))=rowcount(),~'checked.png~',~'uncheck.png~'))"  ) '
			ls_errtext+=dw_main.modify(ls_modify)
		end if
		
end choose 
return ls_errtext
end function

public function blob uf_getimg (string as_name);byte lb_uncheck[]={137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,21,0,0,0,20,8,6,0,0,0,98,75,118,51,0,0,0,46,73,68,65,84,56,141,99,96,24,42,128,17,141,255,159,138,102,81,108,40,138,62,38,50,13,193,11,70,13,29,53,116,212,208,145,105,40,11,22,49,74,138,191,33,6,0,34,227,4,29,225,148,49,90,0,0,0,0,73,69,78,68,174,66,96,130}
byte lb_checked[]={137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,21,0,0,0,20,8,6,0,0,0,98,75,118,51,0,0,0,138,73,68,65,84,56,141,213,148,203,18,192,16,20,67,147,78,255,255,151,211,69,49,212,197,173,97,33,11,27,230,72,226,65,44,148,36,0,192,181,18,26,197,239,102,179,32,73,137,117,247,38,61,34,89,153,217,18,191,114,234,81,112,7,188,14,171,100,83,80,12,186,255,29,159,100,14,52,251,31,66,73,166,184,5,80,54,16,48,226,27,167,73,11,40,8,108,112,91,78,243,213,42,54,9,192,158,122,241,107,27,14,224,8,90,130,157,64,192,119,165,24,199,86,135,95,109,121,81,231,64,173,78,167,191,191,243,244,0,127,242,33,57,89,220,53,197,0,0,0,0,73,69,78,68,174,66,96,130}
choose case as_name
	case 'uncheck'
		return blob(lb_uncheck[])
	case 'checked'
		return blob(lb_checked[])
end choose

return blob('')

//string ls_bytearray
//int i
//blob lb_img
//lb_img=blob(lby_check[])
//lby_check=getbytearray(lb_img)
//
//for i=1 to upperbound(lby_check[])
//	ls_bytearray+=string(lby_check[i])+','
//	if mod(i,16)=0 then ls_bytearray+='&~r~n'
//next
//clipboard(ls_bytearray)




end function

public function int getquery (powerobject dd, string as_sql, transaction at_sqlca, ref string as_error);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

string l_syntax

as_error=string(as_error,'')

l_syntax=at_sqlca.syntaxfromsql(as_sql,"style(type=grid) datawindow(units=1 Message.Title='Message' ) Column(Background.Mode=0) ",as_error)
if len(as_error)>0 then
	goto e
end if

if dd.dynamic create(l_syntax,as_error)=-1 then goto e

return 1

e:
as_error='异常:'+as_error
return -1
end function

on w_runsa_derek_multiselect.create
this.cb_refresh=create cb_refresh
this.cb_showall=create cb_showall
this.cb_showselected=create cb_showselected
this.dw_main=create dw_main
this.cb_print=create cb_print
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.ids=create ids
this.Control[]={this.cb_refresh,&
this.cb_showall,&
this.cb_showselected,&
this.dw_main,&
this.cb_print,&
this.cb_cancel,&
this.cb_ok}
end on

on w_runsa_derek_multiselect.destroy
destroy(this.cb_refresh)
destroy(this.cb_showall)
destroy(this.cb_showselected)
destroy(this.dw_main)
destroy(this.cb_print)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.ids)
end on

event open;string ls_modify
ipo=message.powerobjectparm
string ls_filename_uncheck='uncheck.png'
string ls_filename_checked='checked.png'

u_derek_fun u_fun

if FileExists (ls_filename_uncheck)=false then 
	u_fun.uf_filewrite(ls_filename_uncheck,uf_getimg('uncheck'))
end if

if FileExists (ls_filename_checked)=false then 
	u_fun.uf_filewrite(ls_filename_checked,uf_getimg('checked'))
end if

if isvalid(ipo) then 
	ipo.dynamic getfullstate(ib_state_full)
	dw_main.setfullstate(ib_state_full)
	uf_setstyle(dw_main,1)
end if
dw_main.is_lastdwoname='cp_check'
dw_main.setfocus()

end event

event resize;dw_main.event parentresize(newwidth,newheight)

//cb_refresh.event parentresize(newwidth,newheight)
//cb_ok.event parentresize(newwidth,newheight)
//cb_cancel.event parentresize(newwidth,newheight)
//cb_showselected.event parentresize(newwidth,newheight)
//cb_showall.event parentresize(newwidth,newheight)
//cb_print.event parentresize(newwidth,newheight)
end event

type cb_refresh from commandbutton within w_runsa_derek_multiselect
integer x = 27
integer y = 8
integer width = 425
integer height = 108
integer taborder = 20
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "查询"
end type

event clicked;dw_main.settransobject(sqlca)
dw_main.retrieve()
end event

type cb_showall from commandbutton within w_runsa_derek_multiselect
integer x = 1317
integer y = 8
integer width = 425
integer height = 108
integer taborder = 50
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "显示所有行"
end type

event clicked;dw_main.setfilter('')
dw_main.filter()
end event

type cb_showselected from commandbutton within w_runsa_derek_multiselect
integer x = 887
integer y = 8
integer width = 425
integer height = 108
integer taborder = 40
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "仅显示选中行"
end type

event clicked;dw_main.setfilter('isselected()')
dw_main.filter()
//filter会清除记录高亮
dw_main.selectrow(0,true)
end event

type dw_main from udw_runsa_derek_multiselect within w_runsa_derek_multiselect
integer x = 32
integer y = 132
integer width = 3488
integer height = 1664
integer taborder = 10
boolean heighted = true
boolean widthed = true
end type

event ue_dwnkey;call super::ue_dwnkey;string ls_text
if keyflags=2 then 
	if key=keyC! then
		ls_text=u_dd.uf_selectedtext(this)
		::clipboard(ls_text)
	end if
end if
end event

event rbuttondown;call super::rbuttondown;f_wgz_zg_sort(this,'')
end event

type cb_print from commandbutton within w_runsa_derek_multiselect
integer x = 1746
integer y = 8
integer width = 425
integer height = 108
integer taborder = 60
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "打印"
end type

event clicked;s_ps.dw_1=dw_main
open(w_print_setting)

end event

type cb_cancel from commandbutton within w_runsa_derek_multiselect
integer x = 2176
integer y = 8
integer width = 425
integer height = 108
integer taborder = 70
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "退出"
end type

event clicked;close(parent)
end event

type cb_ok from commandbutton within w_runsa_derek_multiselect
integer x = 457
integer y = 8
integer width = 425
integer height = 108
integer taborder = 30
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "完成"
end type

event clicked;long l_rowcount_select

l_rowcount_select=long(dw_main.describe("Evaluate('sum(if(isselected(),1,0))',0)"))

if l_rowcount_select=0 then 
	if messagebox('','选择0条记录,是否继续?',Exclamation!,okcancel!,2)<>1 then 
		return 
	end if
end if

cb_showselected.event clicked()

dw_main.getfullstate(ib_state_full)

if isvalid(ipo) then ipo.dynamic SetFullState(ib_state_full)

closewithreturn(parent,1)
end event

type ids from datastore within w_runsa_derek_multiselect descriptor "pb_nvo" = "true" 
end type

on ids.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

