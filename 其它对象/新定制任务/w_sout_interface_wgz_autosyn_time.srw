$PBExportHeader$w_sout_interface_wgz_autosyn_time.srw
$PBExportComments$渠道订货
forward
global type w_sout_interface_wgz_autosyn_time from w_print_parent_single
end type
type pb_save from picturebutton within w_sout_interface_wgz_autosyn_time
end type
type pb_autorun from picturebutton within w_sout_interface_wgz_autosyn_time
end type
type st_now from statictext within w_sout_interface_wgz_autosyn_time
end type
type st_lastrun from statictext within w_sout_interface_wgz_autosyn_time
end type
type u_derek from u_runsa_derek_v2 within w_sout_interface_wgz_autosyn_time
end type
end forward

global type w_sout_interface_wgz_autosyn_time from w_print_parent_single
integer width = 3314
integer height = 1456
string title = "特殊任务运行"
boolean controlmenu = false
long backcolor = 1073741824
boolean clientedge = false
boolean center = true
windowanimationstyle openanimation = noanimation!
time i_priruntime = Time("11:18:12.166000")
event ue_timer ( )
pb_save pb_save
pb_autorun pb_autorun
st_now st_now
st_lastrun st_lastrun
u_derek u_derek
end type
global w_sout_interface_wgz_autosyn_time w_sout_interface_wgz_autosyn_time

type variables
string i_table
datetime ldt_lastruntime,ldt_nextruntime
boolean ib_enabled[]
end variables

forward prototypes
public function integer wf_initdisplay2 (long l_flags)
public subroutine wf_control_pos ()
public subroutine uf_control_enabled (boolean lb_enable)
end prototypes

event ue_timer();f_sout_interface('runsaautorun,;')
dw_1.settransobject(sqlca)
dw_1.retrieve( )
end event

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

li_y=li_marginy
pb_autorun.move(li_marginx,li_y)

st_now.y=li_y
st_lastrun.y=li_y + st_now.height - 4

li_y+=pb_autorun.height + li_marginy

dw_1.move(li_marginx,pb_autorun.y+pb_autorun.height+li_marginy) 
dw_1.resize(li_width,workspaceheight() - dw_1.y - li_marginy)
setredraw(true)
end subroutine

public subroutine uf_control_enabled (boolean lb_enable);long i,ll_pos,ll_num
string ls_classname
editmask lem_1
statictext lst_1
multilineedit lmle_1
checkbox lcbx_1 
commandbutton lcb_1
datawindow ldw_1
picturebutton lpb_1
boolean lb_temp
long l_count
l_count=upperbound(control[])
if lb_enable=false then ib_enabled[l_count]=false //拓位
for i = 1 to l_count
	if lb_enable=false then 
		lb_temp=lb_enable //禁用
	else
		lb_temp=ib_enabled[i] //还原
	end if
	choose case control[i].typeof() 
		case editmask! 
			lem_1=control[i]
			ib_enabled[i]=lem_1.enabled
			lem_1.enabled=lb_temp
		case statictext!
			lst_1=control[i]
			ib_enabled[i]=lst_1.enabled
			lst_1.enabled=lb_temp
		case multilineedit!
			lmle_1=control[i]
			ib_enabled[i]=lmle_1.enabled
			lmle_1.enabled=lb_temp
		case checkbox!
			lcbx_1=control[i]
			ib_enabled[i]=lcbx_1.enabled
			lcbx_1.enabled=lb_temp
		case commandbutton!
			lcb_1=control[i]
			ib_enabled[i]=lcb_1.enabled
			lcb_1.enabled=lb_temp
		case picturebutton!
			lpb_1=control[i]
			ib_enabled[i]=lpb_1.enabled
			lpb_1.enabled=lb_temp
		case datawindow!
			ldw_1=control[i]
			if ldw_1.describe('datawindow.name')<>'' then 
				ib_enabled[i]=(string(ldw_1.object.datawindow.readonly,'')='no')
				ldw_1.object.datawindow.readonly=(lb_temp=false)
			end if
	end choose
	
next
end subroutine

on w_sout_interface_wgz_autosyn_time.create
int iCurrent
call super::create
this.pb_save=create pb_save
this.pb_autorun=create pb_autorun
this.st_now=create st_now
this.st_lastrun=create st_lastrun
this.u_derek=create u_derek
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_save
this.Control[iCurrent+2]=this.pb_autorun
this.Control[iCurrent+3]=this.st_now
this.Control[iCurrent+4]=this.st_lastrun
end on

on w_sout_interface_wgz_autosyn_time.destroy
call super::destroy
destroy(this.pb_save)
destroy(this.pb_autorun)
destroy(this.st_now)
destroy(this.st_lastrun)
destroy(this.u_derek)
end on

event open;//


//hide()
//post show()

string ls_stringparm,ls_ret
if i_open=0 then
	u_derek.u_fun.post uf_winstyle(this)
	i_open=i_open+1	
	if g_menutext='' then g_menutext="X.测试"
	i_menutext=g_menutext
	title=g_menutext+'_'+title+'_'+personcode
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
	
	gdw_1=dw_1;f_zg_sout('taskautorun,id=open,taskhwd='+string(handle(this),'')+',;','');gdw_1=gdw_emp
	
	pb_ok.event clicked()
	
	string ls_commandline
	ls_commandline=gs_commandline
	if f_maintain_s(ls_commandline,'runmenu=',';')=i_menutext then 
		pb_autorun.event clicked( )
	end if
end if


end event

event resize;call super::resize;wf_control_pos()
end event

event other;//
end event

event close;//
timer(0)
gs_task='0'

end event

event deactivate;//
end event

event closequery;//
if pb_autorun.text='停止' then 
	if pb_autorun.event clicked()=-1 then return 1
end if
end event

event activate;
//
end event

event timer;call super::timer;
st_now.text='正在运行 '+string(now(),'hh:mm:ss')

if datetime(today(),now())>=ldt_nextruntime then

	ldt_lastruntime=datetime(today(),now())
	ldt_nextruntime=u_derek.u_fun.uf_dateadd('ss',60,ldt_lastruntime)
	
	st_lastrun.text='下次运行时间:'+string(ldt_nextruntime,'hh:mm:ss')
	/*数据库连接检查,断开重连*/
	if f_reconnect('connect')=0 then
		gdw_1=dw_1;f_zg_sout('taskautorun,id=timer,taskhwd='+string(handle(this),'')+',;','');gdw_1=gdw_emp
		event ue_timer()
		
	end if
end if
end event

type p_11 from w_print_parent_single`p_11 within w_sout_interface_wgz_autosyn_time
end type

type pb_help from w_print_parent_single`pb_help within w_sout_interface_wgz_autosyn_time
integer taborder = 290
end type

type pb_gencon0 from w_print_parent_single`pb_gencon0 within w_sout_interface_wgz_autosyn_time
integer x = 0
integer y = 0
integer width = 283
integer height = 212
integer taborder = 20
integer weight = 700
fontcharset fontcharset = gb2312charset!
string facename = "微软雅黑"
string text = ""
boolean originalsize = false
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

type dw_button from w_print_parent_single`dw_button within w_sout_interface_wgz_autosyn_time
integer taborder = 70
end type

type dw_button2 from w_print_parent_single`dw_button2 within w_sout_interface_wgz_autosyn_time
integer taborder = 390
end type

type dw_view from w_print_parent_single`dw_view within w_sout_interface_wgz_autosyn_time
integer taborder = 400
end type

type st_button from w_print_parent_single`st_button within w_sout_interface_wgz_autosyn_time
end type

type st_condition from w_print_parent_single`st_condition within w_sout_interface_wgz_autosyn_time
boolean visible = false
end type

type sle_condition from w_print_parent_single`sle_condition within w_sout_interface_wgz_autosyn_time
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

type dw_1 from w_print_parent_single`dw_1 within w_sout_interface_wgz_autosyn_time
integer x = 0
integer y = 196
integer width = 3291
integer height = 1168
integer taborder = 410
string dataobject = "d_sout_interface_wgz_autosyn_time"
end type

event dw_1::constructor;call super::constructor;//iu_anta.post uf_setstyle(this,1)
this.settransobject(sqlca)
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

//
string ls_msgtitle,ls_errtext,ls_msgbox='1'
boolean lb_wait
lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent
string ls_controls
string ls_interfacestr
select max(controls) into :ls_controls
from password readpast
where codes=:personcode and plevel=:g_level;

if sqlca.sqlcode=-1 then goto e

ls_interfacestr=f_maintain_s(ls_controls,'interfaces=',';')
//ls_interfacestr='101'
string ls_interfaces[],ls_temparray[]={'',''},ls_findstr
long i,l_count,l_findrow
l_count=u_derek.u_fun.getarray( ls_interfacestr,ls_interfaces[],',')
if l_count>0 then 
	for i=1 to l_count
		ls_temparray[]={'',''}
		u_derek.u_fun.getarray( ls_interfaces[i],ls_temparray[],'#')
		ls_findstr='flags='+ls_temparray[1]
		//if ls_temparray[2]<>'' then ls_findstr+=" and lookupdisplay(time_s)='"+ls_temparray[2]+"' "
		l_findrow=this.find(ls_findstr,1,rowcount)
		if l_findrow>0 then
			this.setitem( l_findrow,'cp_check', '1')
		end if
	next
end if

goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
if ls_msgbox='1' and ls_errtext<>'' then 
	rollback;
	if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext+'~r~n'
	if pos(ls_errtext,'~r~n')>0 then ls_errtext+=fill(' ',max(40 - len(ls_errtext),0))
	f_messagebox('',ls_errtext,0,0)
end if
if lb_wait=false and isvalid(w_wait) then close(w_wait)
return -1
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

event dw_1::retrievestart;//
end event

type pb_prior from w_print_parent_single`pb_prior within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer taborder = 140
end type

type pb_next from w_print_parent_single`pb_next within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer taborder = 150
end type

type st_8 from w_print_parent_single`st_8 within w_sout_interface_wgz_autosyn_time
boolean visible = false
end type

type em_end_date from w_print_parent_single`em_end_date within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer taborder = 170
end type

type em_start_date from w_print_parent_single`em_start_date within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer taborder = 120
end type

type st_15 from w_print_parent_single`st_15 within w_sout_interface_wgz_autosyn_time
boolean visible = false
end type

type st_14 from w_print_parent_single`st_14 within w_sout_interface_wgz_autosyn_time
boolean visible = false
end type

type em_end_date_range from w_print_parent_single`em_end_date_range within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer taborder = 160
end type

type em_start_date_range from w_print_parent_single`em_start_date_range within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer taborder = 220
end type

type st_13 from w_print_parent_single`st_13 within w_sout_interface_wgz_autosyn_time
boolean visible = false
end type

type st_11 from w_print_parent_single`st_11 within w_sout_interface_wgz_autosyn_time
boolean visible = false
end type

type cb_1 from w_print_parent_single`cb_1 within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 1801
integer y = 324
integer taborder = 350
end type

type cbx_1 from w_print_parent_single`cbx_1 within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 1509
integer y = 340
end type

type pb_ok from w_print_parent_single`pb_ok within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 375
integer y = 0
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

event pb_ok::clicked;call super::clicked;string ls_ret
ls_ret=f_sout_interface('autorunflags,;')
if ls_ret<>'1' then 
	dw_1.modify("flags.values='"+ls_ret+"' ")
end if
	
dw_1.settransobject(sqlca)
dw_1.retrieve( )


end event

type st_7 from w_print_parent_single`st_7 within w_sout_interface_wgz_autosyn_time
end type

type st_4 from w_print_parent_single`st_4 within w_sout_interface_wgz_autosyn_time
end type

type sle_left from w_print_parent_single`sle_left within w_sout_interface_wgz_autosyn_time
integer taborder = 280
end type

type sle_right from w_print_parent_single`sle_right within w_sout_interface_wgz_autosyn_time
integer taborder = 90
end type

type st_6 from w_print_parent_single`st_6 within w_sout_interface_wgz_autosyn_time
end type

type sle_bottom from w_print_parent_single`sle_bottom within w_sout_interface_wgz_autosyn_time
integer taborder = 250
end type

type st_3 from w_print_parent_single`st_3 within w_sout_interface_wgz_autosyn_time
end type

type st_5 from w_print_parent_single`st_5 within w_sout_interface_wgz_autosyn_time
end type

type sle_top from w_print_parent_single`sle_top within w_sout_interface_wgz_autosyn_time
integer taborder = 300
end type

type st_2 from w_print_parent_single`st_2 within w_sout_interface_wgz_autosyn_time
end type

type st_1 from w_print_parent_single`st_1 within w_sout_interface_wgz_autosyn_time
end type

type em_1 from w_print_parent_single`em_1 within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 2126
integer y = 300
integer taborder = 330
end type

type pb_prevew from w_print_parent_single`pb_prevew within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 329
integer y = 0
integer width = 265
integer height = 232
integer taborder = 310
string text = "预览"
end type

type pb_print from w_print_parent_single`pb_print within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 603
integer y = 0
integer width = 265
integer height = 232
integer taborder = 340
string text = "打印"
end type

type pb_exit from w_print_parent_single`pb_exit within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 667
integer y = 0
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

type sle_background from w_print_parent_single`sle_background within w_sout_interface_wgz_autosyn_time
integer taborder = 360
end type

type dw_input1 from w_print_parent_single`dw_input1 within w_sout_interface_wgz_autosyn_time
integer taborder = 180
string dataobject = "d_zgck_acc_browse"
end type

type dw_input2 from w_print_parent_single`dw_input2 within w_sout_interface_wgz_autosyn_time
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

type dw_input3 from w_print_parent_single`dw_input3 within w_sout_interface_wgz_autosyn_time
integer taborder = 380
end type

type dw_input4 from w_print_parent_single`dw_input4 within w_sout_interface_wgz_autosyn_time
integer taborder = 210
end type

type dw_input5 from w_print_parent_single`dw_input5 within w_sout_interface_wgz_autosyn_time
integer taborder = 370
end type

type sle_background2 from w_print_parent_single`sle_background2 within w_sout_interface_wgz_autosyn_time
integer taborder = 80
end type

type dw_input6 from w_print_parent_single`dw_input6 within w_sout_interface_wgz_autosyn_time
integer width = 1349
integer height = 1524
integer taborder = 230
boolean titlebar = true
end type

type dw_input7 from w_print_parent_single`dw_input7 within w_sout_interface_wgz_autosyn_time
integer taborder = 240
end type

type dw_input8 from w_print_parent_single`dw_input8 within w_sout_interface_wgz_autosyn_time
integer taborder = 260
end type

type pb_save from picturebutton within w_sout_interface_wgz_autosyn_time
boolean visible = false
integer x = 1321
integer width = 402
integer height = 164
integer taborder = 370
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "微软雅黑"
string text = "保存勾选"
boolean flatstyle = true
boolean originalsize = true
vtextalign vtextalign = vcenter!
long backcolor = 15780518
end type

event clicked;string ls_msgtitle,ls_errtext,ls_msgbox='1'
boolean lb_wait
lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent
string ls_controls_new,ls_controls_old
string ls_interfacestr,ls_cp_check
long l_rowcount,i
long l_flags
string ls_time_s

select isnull(max(controls),'') into :ls_controls_old
from password
where codes=:personcode and plevel=:g_level;

if sqlca.sqlcode=-1 then goto e
ls_controls_old=string(ls_controls_old,'')

ls_controls_new=ls_controls_old
f_maintain_s(ls_controls_new,'interfaces=',';') //剪切原interface
ls_interfacestr=''
l_rowcount=dw_1.rowcount( )
for i=1 to l_rowcount
	ls_cp_check=dw_1.getitemstring(i,'cp_check')
	ls_time_s=dw_1.describe('Evaluate("lookupdisplay(time_s)",'+string(i)+')')
	if ls_cp_check='1' then 
		l_flags=dw_1.getitemnumber(i,'flags')
		ls_interfacestr+=string(l_flags,'')+','
		//ls_interfacestr+=string(l_flags,'')+'#'+ls_time_s+','
	end if
next
ls_controls_new+='interfaces='+ls_interfacestr+';'

update password
set controls=:ls_controls_new
where codes=:personcode and plevel=:g_level and isnull(controls,'')=:ls_controls_old;

if sqlca.sqlcode=-1 then goto e
commit;
if sqlca.sqlcode=-1 then goto e

if lb_wait=false and isvalid(w_wait) then close(w_wait)
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
if lb_wait=false and isvalid(w_wait) then close(w_wait)
return -1
end event

type pb_autorun from picturebutton within w_sout_interface_wgz_autosyn_time
integer x = 18
integer width = 402
integer height = 164
integer taborder = 380
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "微软雅黑"
string text = "自动运行"
boolean flatstyle = true
boolean originalsize = true
vtextalign vtextalign = vcenter!
long backcolor = 15780518
end type

event clicked;
if text='停止' then 
	timer(0)
	gs_task='0'
	//dw_1.object.datawindow.readonly=false
	dw_1.modify( 'cp_check.tooltip.tip="" ')
	gdw_1=dw_1;f_zg_sout('taskautorun,id=end,taskhwd='+string(handle(parent),'')+',;','');gdw_1=gdw_emp
	text='自动运行'
	uf_control_enabled(true)
	//if isvalid(w_wait) then close(w_wait)
else
	if pb_save.event clicked()<>-1 then 
		
		string ls_commandline
		ls_commandline=f_zg_multirun('commandline=1;all=1;','')+'autosyn=1;'+'runmenu='+i_menutext+';'
		gdw_1=dw_1;f_zg_sout('taskautorun,id=start,taskhwd='+string(handle(parent),'')+',commandline='+ls_commandline+';','');gdw_1=gdw_emp
		
		//dw_1.object.datawindow.readonly=true
		dw_1.modify( 'cp_check.tooltip.tip="停止后,才可以修改!" ')
		
		//u_derek.wait( 0, '')
		ldt_nextruntime=datetime(today(),now())
		gs_task='1'
		//parent.event timer()
		timer(1)
		text='停止'
		uf_control_enabled(false)
		this.enabled=true
	end if
end if

end event

type st_now from statictext within w_sout_interface_wgz_autosyn_time
integer x = 462
integer width = 805
integer height = 84
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "微软雅黑"
long textcolor = 33554432
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_lastrun from statictext within w_sout_interface_wgz_autosyn_time
integer x = 462
integer y = 88
integer width = 805
integer height = 84
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "微软雅黑"
long textcolor = 33554432
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type u_derek from u_runsa_derek_v2 within w_sout_interface_wgz_autosyn_time descriptor "pb_nvo" = "true" 
end type

on u_derek.create
call super::create
end on

on u_derek.destroy
call super::destroy
end on

