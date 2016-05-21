$PBExportHeader$w_runsa_window.srw
$PBExportComments$渠道订货
forward
global type w_runsa_window from w_print_parent_single
end type
type cbx_2 from checkbox within w_runsa_window
end type
type st_cusno from statictext within w_runsa_window
end type
type st_cusname from statictext within w_runsa_window
end type
type st_colthno from statictext within w_runsa_window
end type
type st_dates from statictext within w_runsa_window
end type
type st_chflags from statictext within w_runsa_window
end type
type st_years from statictext within w_runsa_window
end type
type pb_duowei from picturebutton within w_runsa_window
end type
type st_title from statictext within w_runsa_window
end type
type u_derek from u_runsa_derek_v2 within w_runsa_window
end type
end forward

global type w_runsa_window from w_print_parent_single
integer width = 2240
integer height = 1120
string title = ""
boolean clientedge = false
boolean center = true
windowanimationstyle openanimation = noanimation!
time i_priruntime = Time("11:18:12.166000")
cbx_2 cbx_2
st_cusno st_cusno
st_cusname st_cusname
st_colthno st_colthno
st_dates st_dates
st_chflags st_chflags
st_years st_years
pb_duowei pb_duowei
st_title st_title
u_derek u_derek
end type
global w_runsa_window w_runsa_window

type variables
int i_child,i_maxhp
string i_table
boolean ib_hpredraw=true
string is_hpsizekind
end variables

forward prototypes
public function integer wf_initdisplay2 (long l_flags)
public subroutine wf_control_pos ()
end prototypes

public function integer wf_initdisplay2 (long l_flags);/*l_flags=0 第一次 1:运行中*/
if l_flags=0 then
//	id_slbcount++;slb[id_slbcount]=ddlb_classes

//	id_scbcount++;scb[id_scbcount]=cbx_1
//	id_scbcount++;scb[id_scbcount]=cbx_2
//	id_scbcount++;scb[id_scbcount]=cbx_multicolor

//	id_slecount++;sle[id_slecount]=sle_condition
	
//	id_stcount++;st[id_stcount]=st_pos
	
//	id_scbbuttoncount++;scb_button[id_scbbuttoncount]=cb_2
//	id_spbcount++;spb_button[id_spbcount]=pb_colthnomodify
//
	//id_maskcount++;smask[id_maskcount]=em_1
end if
//
id_buttoncount2=0
//wf_binit('',pb_import_finance,'',1,2)
//wf_binit('',pb_import_man,'',1,2)
//wf_binit('',pb_duowei,'',1,2)
//wf_binit('',pb_3,'',1,2)
return 0
end function

public subroutine wf_control_pos ();

int li_marginx,li_marginy
int li_width
int li_y

setredraw(false)

//dw_button.hide() //工具栏隐藏
li_marginx=pixelstounits(5,XPixelsToUnits!)
li_marginy=pixelstounits(5,YPixelsToUnits!)
li_width=workspacewidth() - (2 * li_marginx)
vscrollbar=false
hscrollbar=false
dw_button.y=li_marginy

li_y+=li_marginy + dw_button.height

//st_years.y=li_y + 8
//em_years.y=li_y
//em_edate.y=li_y
//em_years.hide()
//em_years.show()
//em_years.y=em_years.y + 1

//st_nos.y=li_y + 8
//mle_nos.y=li_y
//ddlb_show.y=li_y
//st_show.y=li_y + 8

//li_y+=li_marginy + em_years.height

//st_cusno.y=li_y + 8
//sle_cusno.y=li_y
//st_cusname.y=li_y 
//st_chflags.y=li_y + 8
//ddlb_chflags.y=li_y
//st_colthno.y=li_y + 8
//sle_colthno.y=li_y
//cbx_colthno.y=li_y
//cbx_incusno.y=li_y

//ddlb_type.y=li_y

//cbx_addsize.y=li_y

//li_y+=li_marginy + mle_nos.height


dw_1.move(li_marginx,li_y) 
dw_1.resize(li_width,workspaceheight() - dw_1.y - li_marginy)

post setredraw(true)
end subroutine

on w_runsa_window.create
int iCurrent
call super::create
this.cbx_2=create cbx_2
this.st_cusno=create st_cusno
this.st_cusname=create st_cusname
this.st_colthno=create st_colthno
this.st_dates=create st_dates
this.st_chflags=create st_chflags
this.st_years=create st_years
this.pb_duowei=create pb_duowei
this.st_title=create st_title
this.u_derek=create u_derek
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_2
this.Control[iCurrent+2]=this.st_cusno
this.Control[iCurrent+3]=this.st_cusname
this.Control[iCurrent+4]=this.st_colthno
this.Control[iCurrent+5]=this.st_dates
this.Control[iCurrent+6]=this.st_chflags
this.Control[iCurrent+7]=this.st_years
this.Control[iCurrent+8]=this.pb_duowei
this.Control[iCurrent+9]=this.st_title
end on

on w_runsa_window.destroy
call super::destroy
destroy(this.cbx_2)
destroy(this.st_cusno)
destroy(this.st_cusname)
destroy(this.st_colthno)
destroy(this.st_dates)
destroy(this.st_chflags)
destroy(this.st_years)
destroy(this.pb_duowei)
destroy(this.st_title)
destroy(this.u_derek)
end on

event open;//

hide()
post show()

string ls_stringparm
if i_open=0 then
	i_open=i_open+1
	if g_menutext='' then 
		g_menutext=classname()
		g_menutext='预算达成跟踪表'
	end if
	
	//i_menutext=g_menutext
	title=g_menutext+'_'+title
	//st_title.text=i_menutext
	
	i_message=message.stringparm
	ls_stringparm=i_message
	i_table=f_maintain_s(ls_stringparm,'table=',';')
	
	if g_menutext<>'' then 
//		Super::EVENT open()
//		wf_initdisplay()
//		i_newhead=80
		//dw_button.event ue_init(1)
	end if
	//resize(PixelsToUnits (500,Xpixelstounits!),PixelsToUnits (300,Ypixelstounits!))
	wf_control_pos()
	
	//pb_ok.post event clicked()
end if
	

end event

event resize;call super::resize;post wf_control_pos()
end event

event other;//
end event

event close;//
delete from sonendtree where recno=:g_recno4;
commit;
delete from huanankc where recno=:g_recno;
commit;
delete from huanankc where recno=:g_recno2;
commit;
//年月表
delete from easytemp where recno=:g_recno;
commit;
//单位+年月
delete from easytemp where recno=:g_recno2;
commit;
//明细项
delete from db_sa_temp where recno=:g_recno;
commit;
//所有产品,计算最新成本用
delete from coloth_select where recno=:g_recno;
commit;
end event

event deactivate;//
end event

event closequery;//
end event

event activate;
//
end event

type p_11 from w_print_parent_single`p_11 within w_runsa_window
end type

type pb_help from w_print_parent_single`pb_help within w_runsa_window
integer taborder = 290
end type

type pb_gencon0 from w_print_parent_single`pb_gencon0 within w_runsa_window
boolean visible = true
integer x = 709
integer y = 368
integer width = 283
integer height = 212
integer taborder = 20
integer weight = 700
fontcharset fontcharset = gb2312charset!
string facename = "微软雅黑"
string text = ""
string picturename = "gen.jpg"
string disabledname = "gen1.jpg"
end type

event pb_gencon0::clicked;
//if i_zg_gencon.dblevels='' then i_zg_gencon.dblevels='管辖区'
i_zg_gencon.control='city=1,db=1,cost=1,' //dblevels=1,
//messagebox('',i_zg_gencon.control)
//i_zg_gencon.st_date[1]=f_wl('起始日:')
//i_zg_gencon.st_date[2]=f_wl('终止日:')
openwithparm(w_zg_gencon,i_zg_gencon)
i_zg_gencon=message.powerobjectparm

end event

type dw_button from w_print_parent_single`dw_button within w_runsa_window
integer taborder = 70
end type

type dw_button2 from w_print_parent_single`dw_button2 within w_runsa_window
integer taborder = 390
end type

type dw_view from w_print_parent_single`dw_view within w_runsa_window
integer taborder = 400
end type

type st_button from w_print_parent_single`st_button within w_runsa_window
end type

type st_condition from w_print_parent_single`st_condition within w_runsa_window
boolean visible = false
end type

type sle_condition from w_print_parent_single`sle_condition within w_runsa_window
boolean visible = false
integer x = 3945
integer y = 200
integer width = 357
integer taborder = 130
end type

event sle_condition::rbuttondown;//if dw_input1.rowcount()=0 then
//			dw_input1.retrieve('')
//		end if
//		commit;
//	if dw_input1.rowcount()>0 then
//			dw_input1.visible=true
//			dw_input1.setfocus()
//			dw_input1.setfilter("1=1 and closeif<>1 and ckflags2<>9 and ckkinds1=1   ") 
//			dw_input1.filter()
//			
//	end if
//	return 1
end event

event sle_condition::losefocus;call super::losefocus;//string l_ckaccname,l_ckaccno
//l_ckaccno=trim(sle_condition.text)
//select ckaccname into:l_ckaccname from zgck_acc where ckaccno=:l_ckaccno;
//st_9.text=l_ckaccname
end event

type dw_1 from w_print_parent_single`dw_1 within w_runsa_window
boolean visible = false
integer x = 37
integer y = 116
integer width = 3511
integer taborder = 410
end type

event dw_1::constructor;call super::constructor;//iu_anta.post uf_setstyle(this,1)
this.settransobject(sqlca)
end event

event dw_1::retrievestart;//
//iu_anta.uf_setstyle(this,1)
end event

event dw_1::keydown;call super::keydown;string ls_text
if keyflags=2 and key=keyc!  then 
	ls_text=u_derek.u_dd.uf_selectedtext(this)
	yield()
	if ls_text<>'' then
		::clipboard(ls_text)
	end if
end if
end event

event dw_1::doubleclicked;call super::doubleclicked;//window lw_this
//
//if row<=0 then return 
//
//closewithreturn(parent,string(object.nos[row],''))
end event

event dw_1::retrieveend;//
end event

event dw_1::ue_retrieveend;//
end event

event dw_1::rowfocuschanged;//
end event

event dw_1::rowfocuschanging;//
end event

event dw_1::itemfocuschanged;//
post SelectText(1, 32766)
end event

event dw_1::getfocus;//
end event

type pb_prior from w_print_parent_single`pb_prior within w_runsa_window
boolean visible = false
integer taborder = 140
end type

type pb_next from w_print_parent_single`pb_next within w_runsa_window
boolean visible = false
integer taborder = 150
end type

type st_8 from w_print_parent_single`st_8 within w_runsa_window
boolean visible = false
end type

type em_end_date from w_print_parent_single`em_end_date within w_runsa_window
boolean visible = false
integer taborder = 170
end type

type em_start_date from w_print_parent_single`em_start_date within w_runsa_window
boolean visible = false
integer taborder = 120
end type

type st_15 from w_print_parent_single`st_15 within w_runsa_window
boolean visible = false
end type

type st_14 from w_print_parent_single`st_14 within w_runsa_window
boolean visible = false
end type

type em_end_date_range from w_print_parent_single`em_end_date_range within w_runsa_window
boolean visible = false
integer taborder = 160
end type

type em_start_date_range from w_print_parent_single`em_start_date_range within w_runsa_window
boolean visible = false
integer taborder = 220
end type

type st_13 from w_print_parent_single`st_13 within w_runsa_window
boolean visible = false
end type

type st_11 from w_print_parent_single`st_11 within w_runsa_window
boolean visible = false
end type

type cb_1 from w_print_parent_single`cb_1 within w_runsa_window
boolean visible = false
integer x = 1801
integer y = 324
integer taborder = 350
end type

type cbx_1 from w_print_parent_single`cbx_1 within w_runsa_window
boolean visible = false
integer x = 1509
integer y = 340
end type

type pb_ok from w_print_parent_single`pb_ok within w_runsa_window
integer x = 1083
integer y = 368
integer width = 265
integer height = 212
integer taborder = 30
integer weight = 700
fontcharset fontcharset = gb2312charset!
string facename = "微软雅黑"
string picturename = "query.jpg"
string disabledname = "query1.jpg"
vtextalign vtextalign = vcenter!
end type

type st_7 from w_print_parent_single`st_7 within w_runsa_window
end type

type st_4 from w_print_parent_single`st_4 within w_runsa_window
end type

type sle_left from w_print_parent_single`sle_left within w_runsa_window
integer taborder = 280
end type

type sle_right from w_print_parent_single`sle_right within w_runsa_window
integer taborder = 90
end type

type st_6 from w_print_parent_single`st_6 within w_runsa_window
end type

type sle_bottom from w_print_parent_single`sle_bottom within w_runsa_window
integer taborder = 250
end type

type st_3 from w_print_parent_single`st_3 within w_runsa_window
end type

type st_5 from w_print_parent_single`st_5 within w_runsa_window
end type

type sle_top from w_print_parent_single`sle_top within w_runsa_window
integer taborder = 300
end type

type st_2 from w_print_parent_single`st_2 within w_runsa_window
end type

type st_1 from w_print_parent_single`st_1 within w_runsa_window
end type

type em_1 from w_print_parent_single`em_1 within w_runsa_window
boolean visible = false
integer x = 2126
integer y = 300
integer taborder = 330
end type

type pb_prevew from w_print_parent_single`pb_prevew within w_runsa_window
boolean visible = false
integer x = 329
integer y = 0
integer width = 265
integer height = 232
integer taborder = 310
string text = "预览"
end type

type pb_print from w_print_parent_single`pb_print within w_runsa_window
boolean visible = false
integer x = 603
integer y = 0
integer width = 265
integer height = 232
integer taborder = 340
string text = "打印"
end type

type pb_exit from w_print_parent_single`pb_exit within w_runsa_window
integer x = 1870
integer y = 752
integer width = 265
integer height = 212
integer taborder = 40
integer weight = 700
fontcharset fontcharset = gb2312charset!
string facename = "微软雅黑"
string picturename = "Exit.jpg"
string disabledname = "Exit1.jpg"
vtextalign vtextalign = vcenter!
end type

event pb_exit::clicked;//delete huanankc where recno=:g_recno or recno=:g_recno2 or recno=:g_recno3;
//f_sqlca_check('')
//delete coloth_select where recno=:g_recno;
//f_sqlca_check('')
//delete zg_coloth_f_rnb_temp where recno=:g_recno;
//f_sqlca_check('')
commit;
i_priorbutton='cb_exit'
close(parent)

end event

type sle_background from w_print_parent_single`sle_background within w_runsa_window
integer taborder = 360
end type

type dw_input1 from w_print_parent_single`dw_input1 within w_runsa_window
integer taborder = 180
string dataobject = "d_zgck_acc_browse"
end type

type dw_input2 from w_print_parent_single`dw_input2 within w_runsa_window
integer x = 37
integer y = 308
integer width = 1577
integer height = 640
integer taborder = 190
end type

event dw_input2::doubleclicked;call super::doubleclicked;//if this.getrow()>0 then
//	sle_1.text=trim(this.getitemstring(this.getrow(),'ckaccno'))
//	this.visible=false
//	sle_1.setfocus()
//	sle_1.triggerevent(modified!)
//end if
end event

type dw_input3 from w_print_parent_single`dw_input3 within w_runsa_window
integer taborder = 380
end type

type dw_input4 from w_print_parent_single`dw_input4 within w_runsa_window
integer taborder = 210
end type

type dw_input5 from w_print_parent_single`dw_input5 within w_runsa_window
integer taborder = 370
end type

type sle_background2 from w_print_parent_single`sle_background2 within w_runsa_window
integer taborder = 80
end type

type dw_input6 from w_print_parent_single`dw_input6 within w_runsa_window
integer width = 1349
integer height = 1524
integer taborder = 230
boolean titlebar = true
end type

type dw_input7 from w_print_parent_single`dw_input7 within w_runsa_window
integer taborder = 240
end type

type dw_input8 from w_print_parent_single`dw_input8 within w_runsa_window
integer taborder = 260
end type

type cbx_2 from checkbox within w_runsa_window
boolean visible = false
integer x = 416
integer y = 8
integer width = 361
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
string text = "只查可换货"
end type

type st_cusno from statictext within w_runsa_window
boolean visible = false
integer x = 27
integer y = 120
integer width = 160
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "仓库:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_cusname from statictext within w_runsa_window
boolean visible = false
integer x = 494
integer y = 120
integer width = 745
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type st_colthno from statictext within w_runsa_window
boolean visible = false
integer x = 1280
integer y = 120
integer width = 165
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "货号:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_dates from statictext within w_runsa_window
boolean visible = false
integer x = 32
integer y = 108
integer width = 160
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "日期:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_chflags from statictext within w_runsa_window
boolean visible = false
integer x = 1600
integer y = 216
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "确认标记:"
boolean focusrectangle = false
end type

type st_years from statictext within w_runsa_window
integer x = 210
integer y = 384
integer width = 165
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "微软雅黑"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "年份:"
boolean focusrectangle = false
end type

type pb_duowei from picturebutton within w_runsa_window
boolean visible = false
integer x = 1614
integer y = 68
integer width = 274
integer height = 112
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "查询2"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

type st_title from statictext within w_runsa_window
integer x = 485
integer y = 152
integer width = 1129
integer height = 144
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "微软雅黑"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type u_derek from u_runsa_derek_v2 within w_runsa_window descriptor "pb_nvo" = "true" 
end type

on u_derek.create
call super::create
end on

on u_derek.destroy
call super::destroy
end on

