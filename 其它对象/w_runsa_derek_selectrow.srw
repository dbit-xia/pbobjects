$PBExportHeader$w_runsa_derek_selectrow.srw
forward
global type w_runsa_derek_selectrow from w_easy_parent
end type
type em_levels from editmask within w_runsa_derek_selectrow
end type
type st_levels from statictext within w_runsa_derek_selectrow
end type
type cbx_selectall from checkbox within w_runsa_derek_selectrow
end type
type sle_filter from singlelineedit within w_runsa_derek_selectrow
end type
type sle_2 from statictext within w_runsa_derek_selectrow
end type
type st_row from uo_derek_st within w_runsa_derek_selectrow
end type
end forward

global type w_runsa_derek_selectrow from w_easy_parent
integer width = 3643
integer height = 2040
string title = "通用查询"
em_levels em_levels
st_levels st_levels
cbx_selectall cbx_selectall
sle_filter sle_filter
sle_2 sle_2
st_row st_row
end type
global w_runsa_derek_selectrow w_runsa_derek_selectrow

type variables
powerobject i_powerobjectparm
long il_mouserow=0 //shift或mousemove到的行号
datastore ds_source
end variables

on w_runsa_derek_selectrow.create
int iCurrent
call super::create
this.em_levels=create em_levels
this.st_levels=create st_levels
this.cbx_selectall=create cbx_selectall
this.sle_filter=create sle_filter
this.sle_2=create sle_2
this.st_row=create st_row
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_levels
this.Control[iCurrent+2]=this.st_levels
this.Control[iCurrent+3]=this.cbx_selectall
this.Control[iCurrent+4]=this.sle_filter
this.Control[iCurrent+5]=this.sle_2
this.Control[iCurrent+6]=this.st_row
end on

on w_runsa_derek_selectrow.destroy
call super::destroy
destroy(this.em_levels)
destroy(this.st_levels)
destroy(this.cbx_selectall)
destroy(this.sle_filter)
destroy(this.sle_2)
destroy(this.st_row)
end on

event open;//

if g_menutext<>'' then 
	title=g_menutext+'_'+title
end if

i_powerobjectparm=message.powerobjectparm
datastore lds_temp
if typeof(i_powerobjectparm)=datastore! then 
	ds_source=i_powerobjectparm
	lds_temp=ds_source
	dw_1.create(lds_temp.describe('datawindow.syntax'))
	//lds_temp.rowscopy(1,lds_temp.rowcount(),primary!,dw_1,0,primary!) //.object.data=.object.data
	if lds_temp.rowcount()>0 then 
		dw_1.object.data=lds_temp.object.data
		dw_1.event ue_rowchecked(0)
		if dw_1.find("cp_check='0' ",1,dw_1.rowcount())=0 then 
			cbx_selectall.checked=true //全选
		end if
	end if
end if
end event

event close;//
end event

event deactivate;//
end event

event closequery;//
end event

type dw_temp from w_easy_parent`dw_temp within w_runsa_derek_selectrow
end type

type sle_wgzinout from w_easy_parent`sle_wgzinout within w_runsa_derek_selectrow
integer x = 2162
integer y = 24
integer width = 951
integer height = 96
borderstyle borderstyle = stylebox!
end type

type pb_datain from w_easy_parent`pb_datain within w_runsa_derek_selectrow
integer x = 1966
integer y = 24
integer width = 197
integer height = 96
boolean enabled = true
end type

type pb_dataout from w_easy_parent`pb_dataout within w_runsa_derek_selectrow
integer x = 1760
integer y = 24
integer width = 201
integer height = 96
end type

type pb_up from w_easy_parent`pb_up within w_runsa_derek_selectrow
end type

type pb_down from w_easy_parent`pb_down within w_runsa_derek_selectrow
end type

type pb_prior from w_easy_parent`pb_prior within w_runsa_derek_selectrow
end type

type pb_query from w_easy_parent`pb_query within w_runsa_derek_selectrow
boolean visible = true
integer x = 302
integer y = 20
integer width = 224
integer height = 96
boolean enabled = false
end type

type em_end_date from w_easy_parent`em_end_date within w_runsa_derek_selectrow
end type

type st_end_date from w_easy_parent`st_end_date within w_runsa_derek_selectrow
end type

type em_start_date from w_easy_parent`em_start_date within w_runsa_derek_selectrow
end type

type st_date from w_easy_parent`st_date within w_runsa_derek_selectrow
end type

type st_titleback from w_easy_parent`st_titleback within w_runsa_derek_selectrow
end type

type st_selected from w_easy_parent`st_selected within w_runsa_derek_selectrow
end type

type st_selection from w_easy_parent`st_selection within w_runsa_derek_selectrow
end type

type pb_dselectall from w_easy_parent`pb_dselectall within w_runsa_derek_selectrow
end type

type pb_dselect from w_easy_parent`pb_dselect within w_runsa_derek_selectrow
end type

type pb_selectall from w_easy_parent`pb_selectall within w_runsa_derek_selectrow
end type

type pb_select from w_easy_parent`pb_select within w_runsa_derek_selectrow
end type

type lb_selected from w_easy_parent`lb_selected within w_runsa_derek_selectrow
end type

type lb_selection from w_easy_parent`lb_selection within w_runsa_derek_selectrow
end type

type pb_print from w_easy_parent`pb_print within w_runsa_derek_selectrow
boolean visible = true
integer x = 526
integer y = 20
integer width = 224
integer height = 96
integer textsize = -9
fontcharset fontcharset = ansi!
string text = "打印"
string picturename = ""
alignment htextalign = center!
end type

type dw_1 from w_easy_parent`dw_1 within w_runsa_derek_selectrow
event ue_summo ( )
event ue_rowchecked ( long row )
boolean visible = true
integer x = 9
integer y = 136
integer width = 3589
integer height = 1788
end type

event dw_1::ue_rowchecked(long row);string ls_describe
long l_selectedcount,l_rowcount

ls_describe="Evaluate(~"sum(long(cp_check))~",0)"
l_rowcount=dw_1.rowcount()
l_selectedcount=long(this.describe(ls_describe))
//if keydown(keycontrol!) then messagebox('',string(l_selectedcount)+'/'+string(l_rowcount))
cbx_selectall.checked=(l_rowcount=l_selectedcount)
st_row.text='选中记录数:'+string(l_selectedcount)+'/'+string(l_rowcount)
end event

event dw_1::retrievestart;call super::retrievestart;sle_filter.event ue_enchange()
end event

event dw_1::clicked;//
if keydown(keyshift!)=true then 
	if row<=0 then return 
	//parent.title=string(row)
	long l_row,l_getrow
	string ls_check
	l_getrow=this.getrow()
	ls_check=this.getitemstring(l_getrow,'cp_check')
//	if ls_check='1' then 
//		ls_check='0'
//	else
//		ls_check='1'
//	end if
	if l_getrow=row then 
		
	elseif row>getrow() then 
		for l_row=getrow()+1 to row
			this.setitem(l_row,'cp_check',ls_check)
			this.event itemchanged(l_row,this.object.cp_check,ls_check)
		next
	elseif row<getrow() then 
		for l_row=getrow() - 1 to row step -1
			this.setitem(l_row,'cp_check',ls_check)
			this.event itemchanged(l_row,this.object.cp_check,ls_check)
		next
	end if
	dw_1.event ue_rowchecked(0)
	il_mouserow=row
	return 1
end if
end event

event dw_1::itemchanged;call super::itemchanged;string ls_dwoname
if row<=0 then return 
if isnull(dwo) then return 
ls_dwoname=string(dwo.name)

choose case ls_dwoname
	case 'cp_check_' to 'cp_check_Z'
		dw_1.post event ue_rowchecked(row)
end choose 
end event

event dw_1::rbuttondown;call super::rbuttondown;this.event ue_rowchecked(0)

end event

event dw_1::key;if key=keyA! and keyflags=1 then 
	this.selectrow(0,false)
end if
end event

type pb_ok from w_easy_parent`pb_ok within w_runsa_derek_selectrow
integer x = 750
integer y = 20
integer width = 224
integer height = 96
integer textsize = -9
fontcharset fontcharset = ansi!
string text = "完成"
string picturename = ""
string disabledname = ""
end type

event pb_ok::clicked;//
long l_ret,l_selectrows[],l_count,l_row
u_runsa_derek_v2 lu_derek
string ls_msgtitle,ls_errtext,ls_msgbox='1'
boolean lb_wait
string ls_codestr
powerobject lpo_value
lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent

lu_derek=create u_runsa_derek_v2

l_ret=lu_derek.u_dd.uf_findrows(dw_1,"isselected() or cp_check='1'",l_selectrows[])
//if l_ret<=0 then 
//	if f_messagebox('','未选中任何记录,是否继续?',2,2)<>1 then goto e
//	//goto e
//end if
l_count=l_ret

//
for l_row=1 to l_count
	if dw_1.IsSelected(l_selectrows[l_row]) then 
		dw_1.setitem(l_selectrows[l_row],'cp_check','1')
	end if
next

char lc_values[]
string ls_values[]

//过滤的记录取消勾选
l_count=dw_1.FilteredCount()
if l_count>0 then 
	lc_values[]=fill('0',l_count)
	ls_values[]=lc_values[]
	dw_1.object.cp_check.filter[]=ls_values[]
end if

//提交勾选数据
dw_1.setfilter('')
dw_1.filter()
ds_source.object.data=dw_1.object.data

if isvalid(lu_derek) then destroy lu_derek
if lb_wait=false and isvalid(w_wait) then close(w_wait)
closewithreturn(parent,'1')
return 0
goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
if ls_msgbox='1' and ls_errtext<>'' then 
	rollback;
	if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext+'~r~n'
	if pos(ls_errtext,'~r~n')>0 then ls_errtext+=fill(' ',max(40 - len(ls_errtext),0))
	f_messagebox('',ls_errtext,0,0)
end if
if isvalid(lu_derek) then destroy lu_derek
if lb_wait=false and isvalid(w_wait) then close(w_wait)
return -1
end event

type dw_input5 from w_easy_parent`dw_input5 within w_runsa_derek_selectrow
end type

type dw_input4 from w_easy_parent`dw_input4 within w_runsa_derek_selectrow
end type

type dw_input3 from w_easy_parent`dw_input3 within w_runsa_derek_selectrow
end type

type dw_input2 from w_easy_parent`dw_input2 within w_runsa_derek_selectrow
end type

type dw_input1 from w_easy_parent`dw_input1 within w_runsa_derek_selectrow
end type

type st_info from w_easy_parent`st_info within w_runsa_derek_selectrow
boolean visible = false
integer x = 279
integer y = 2000
integer width = 3077
end type

type st_1 from w_easy_parent`st_1 within w_runsa_derek_selectrow
boolean visible = false
integer x = 5
integer y = 1976
end type

type cb_exit from w_easy_parent`cb_exit within w_runsa_derek_selectrow
integer x = 974
integer y = 20
integer width = 224
integer height = 96
integer textsize = -9
fontcharset fontcharset = ansi!
string text = "取消"
string picturename = ""
string disabledname = ""
alignment htextalign = center!
end type

type sle_1 from w_easy_parent`sle_1 within w_runsa_derek_selectrow
integer width = 3333
integer height = 1800
end type

type em_levels from editmask within w_runsa_derek_selectrow
boolean visible = false
integer x = 1413
integer y = 20
integer width = 343
integer height = 104
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
alignment alignment = center!
string mask = "#####0"
boolean spin = true
double increment = 1
end type

type st_levels from statictext within w_runsa_derek_selectrow
boolean visible = false
integer x = 1198
integer y = 32
integer width = 206
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "级别"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_selectall from checkbox within w_runsa_derek_selectrow
integer x = 55
integer y = 28
integer width = 238
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "全选"
end type

event clicked;long l_rowcount
char lc_values[]
string ls_values[]

l_rowcount=dw_1.rowcount( )

if l_rowcount<=0 then return 

if checked=true then 
	lc_values[]=fill('1',l_rowcount)
else
	lc_values[]=fill('0',l_rowcount)
end if
ls_values[]=lc_values[]
dw_1.setredraw(false)
dw_1.object.cp_check.primary=ls_values[]
dw_1.event ue_rowchecked(0)
dw_1.setredraw(true)
end event

type sle_filter from singlelineedit within w_runsa_derek_selectrow
event ue_enchange pbm_enchange
integer x = 3058
integer y = 20
integer width = 535
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
end type

event ue_enchange;string ls_filter
int li_colnb,i
string ls_colname

//string is_showcol[]={'#1'}
string ls_text
ls_text=text
if ls_text>'' then 
	
	li_colnb=long(dw_1.describe("datawindow.column.count"))
	
	//li_colnb=upperbound(is_showcol[])
	ls_filter='1<>1 '
	for i=1 to li_colnb
		ls_colname='#'+string(i)
		if ls_colname='cp_rowno' then continue;
		if dw_1.describe(ls_colname+'.type')='column' then 
			ls_filter+=" or (lookupdisplay("+ls_colname+") like '%"+ls_text+"%') " 
		else
			ls_filter+=" or (string("+ls_colname+",'') like '%"+ls_text+"%') " 
		end if
	next 
end if

dw_1.setfilter(ls_filter)
dw_1.filter()
dw_1.event ue_rowchecked(0)
end event

type sle_2 from statictext within w_runsa_derek_selectrow
integer x = 2885
integer y = 32
integer width = 155
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 553648127
string text = "筛选:"
end type

type st_row from uo_derek_st within w_runsa_derek_selectrow
integer x = 2080
integer y = 36
integer width = 663
integer height = 76
boolean bringtotop = true
string text = "选中记录数:"
end type

