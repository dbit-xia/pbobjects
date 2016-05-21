$PBExportHeader$w_couple_parent_sheet_derek.srw
$PBExportComments$双数据窗口祖宗
forward
global type w_couple_parent_sheet_derek from w_runsa_sheet_derek
end type
type pb_attach from picturebutton within w_couple_parent_sheet_derek
end type
type p_11 from picture within w_couple_parent_sheet_derek
end type
type dw_26 from datawindow within w_couple_parent_sheet_derek
end type
type dw_25 from datawindow within w_couple_parent_sheet_derek
end type
type dw_24 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input60 from datawindow within w_couple_parent_sheet_derek
end type
type cb_send from picturebutton within w_couple_parent_sheet_derek
end type
type cbx_dw2xj from checkbox within w_couple_parent_sheet_derek
end type
type st_pos from statictext within w_couple_parent_sheet_derek
end type
type sle_pos from singlelineedit within w_couple_parent_sheet_derek
end type
type cbx_multicolor from checkbox within w_couple_parent_sheet_derek
end type
type dw_view from datawindow within w_couple_parent_sheet_derek
end type
type pb_autorecovery from picturebutton within w_couple_parent_sheet_derek
end type
type pb_autosave from picturebutton within w_couple_parent_sheet_derek
end type
type dw_pos from datawindow within w_couple_parent_sheet_derek
end type
type dw_button2 from datawindow within w_couple_parent_sheet_derek
end type
type st_button from statictext within w_couple_parent_sheet_derek
end type
type pb_rowcopy from picturebutton within w_couple_parent_sheet_derek
end type
type dw_input50 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input40 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input20 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input10 from datawindow within w_couple_parent_sheet_derek
end type
type cb_check from picturebutton within w_couple_parent_sheet_derek
end type
type pb_help from picturebutton within w_couple_parent_sheet_derek
end type
type dw_23 from datawindow within w_couple_parent_sheet_derek
end type
type dw_22 from datawindow within w_couple_parent_sheet_derek
end type
type dw_21 from datawindow within w_couple_parent_sheet_derek
end type
type pb_21cancel from picturebutton within w_couple_parent_sheet_derek
end type
type pb_21delete from picturebutton within w_couple_parent_sheet_derek
end type
type pb_21save from picturebutton within w_couple_parent_sheet_derek
end type
type pb_21add from picturebutton within w_couple_parent_sheet_derek
end type
type dw_words from datawindow within w_couple_parent_sheet_derek
end type
type dw_input6 from datawindow within w_couple_parent_sheet_derek
end type
type cb_report from picturebutton within w_couple_parent_sheet_derek
end type
type dw_input5 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input4 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input3 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input2 from datawindow within w_couple_parent_sheet_derek
end type
type dw_input1 from datawindow within w_couple_parent_sheet_derek
end type
type pb_modify from picturebutton within w_couple_parent_sheet_derek
end type
type st_1 from statictext within w_couple_parent_sheet_derek
end type
type pb_cancel from picturebutton within w_couple_parent_sheet_derek
end type
type pb_add from picturebutton within w_couple_parent_sheet_derek
end type
type pb_save from picturebutton within w_couple_parent_sheet_derek
end type
type pb_delete from picturebutton within w_couple_parent_sheet_derek
end type
type cb_detail from picturebutton within w_couple_parent_sheet_derek
end type
type cb_browseall from picturebutton within w_couple_parent_sheet_derek
end type
type cb_add from picturebutton within w_couple_parent_sheet_derek
end type
type cb_modify from picturebutton within w_couple_parent_sheet_derek
end type
type cb_cancel from picturebutton within w_couple_parent_sheet_derek
end type
type cb_save from picturebutton within w_couple_parent_sheet_derek
end type
type cb_query from picturebutton within w_couple_parent_sheet_derek
end type
type cb_last from picturebutton within w_couple_parent_sheet_derek
end type
type cb_first from picturebutton within w_couple_parent_sheet_derek
end type
type cb_next from picturebutton within w_couple_parent_sheet_derek
end type
type cb_prior from picturebutton within w_couple_parent_sheet_derek
end type
type cb_print from picturebutton within w_couple_parent_sheet_derek
end type
type cb_browse from picturebutton within w_couple_parent_sheet_derek
end type
type cb_delete from picturebutton within w_couple_parent_sheet_derek
end type
type cb_exit from picturebutton within w_couple_parent_sheet_derek
end type
type dw_1 from datawindow within w_couple_parent_sheet_derek
end type
type dw_browse from datawindow within w_couple_parent_sheet_derek
end type
type dw_browseall from datawindow within w_couple_parent_sheet_derek
end type
type sle_1 from singlelineedit within w_couple_parent_sheet_derek
end type
type sle_2 from singlelineedit within w_couple_parent_sheet_derek
end type
type dw_button from datawindow within w_couple_parent_sheet_derek
end type
type st_info from statictext within w_couple_parent_sheet_derek
end type
type dw_2 from datawindow within w_couple_parent_sheet_derek
end type
type u_derek from u_runsa_derek_v2 within w_couple_parent_sheet_derek
end type
end forward

global type w_couple_parent_sheet_derek from w_runsa_sheet_derek
string tag = "单窗口"
integer x = 46
integer y = 124
integer width = 3671
integer height = 2304
windowtype windowtype = response!
long backcolor = 79741120
boolean clientedge = true
integer animationtime = 500
event ue_setsql ( )
event type long ue_key ( keycode key,  unsignedinteger keyflags )
event ue_position ( )
event type long ue_afteropen ( )
event type long ue_beforeopen ( string ls_flags )
pb_attach pb_attach
p_11 p_11
dw_26 dw_26
dw_25 dw_25
dw_24 dw_24
dw_input60 dw_input60
cb_send cb_send
cbx_dw2xj cbx_dw2xj
st_pos st_pos
sle_pos sle_pos
cbx_multicolor cbx_multicolor
dw_view dw_view
pb_autorecovery pb_autorecovery
pb_autosave pb_autosave
dw_pos dw_pos
dw_button2 dw_button2
st_button st_button
pb_rowcopy pb_rowcopy
dw_input50 dw_input50
dw_input40 dw_input40
dw_input20 dw_input20
dw_input10 dw_input10
cb_check cb_check
pb_help pb_help
dw_23 dw_23
dw_22 dw_22
dw_21 dw_21
pb_21cancel pb_21cancel
pb_21delete pb_21delete
pb_21save pb_21save
pb_21add pb_21add
dw_words dw_words
dw_input6 dw_input6
cb_report cb_report
dw_input5 dw_input5
dw_input4 dw_input4
dw_input3 dw_input3
dw_input2 dw_input2
dw_input1 dw_input1
pb_modify pb_modify
st_1 st_1
pb_cancel pb_cancel
pb_add pb_add
pb_save pb_save
pb_delete pb_delete
cb_detail cb_detail
cb_browseall cb_browseall
cb_add cb_add
cb_modify cb_modify
cb_cancel cb_cancel
cb_save cb_save
cb_query cb_query
cb_last cb_last
cb_first cb_first
cb_next cb_next
cb_prior cb_prior
cb_print cb_print
cb_browse cb_browse
cb_delete cb_delete
cb_exit cb_exit
dw_1 dw_1
dw_browse dw_browse
dw_browseall dw_browseall
sle_1 sle_1
sle_2 sle_2
dw_button dw_button
st_info st_info
dw_2 dw_2
u_derek u_derek
end type
global w_couple_parent_sheet_derek w_couple_parent_sheet_derek

type variables
private:
int i_status=0,i_itemfocuschange=0,i_clicked=0,ii_enter=0,i_auto=0,i_runcount=0,i_itemchangedrun=0
int i_xg=0,i_tab=0,i_esc=0,i_mx=0,i_addsrow=1,i_viewwidth=0,i_deleteall=0,i_onlyprice=0
string i_dwfocus='',is_keybfield='colthno',is_admit,is_admitbz
long i_row,i_enter=0,i_browse=0,i_rowfocus=0,i_newrow=0,i_childclose=0
string i_columnname,i_itemchanged='success',i_itemfocus='failure',i_nowkey='',i_prikey=''
string i_cusno,i_outdate,i_name
boolean i_trigger_itemchanged=false,i_noclosequery=false,i_setlastcolumn=true

string  i_editchanged_column='',i_pricolumn='',i_priitem='',i_sort=''
long i_editchanged_row=0,i_column ,i_flowno=0,i_prirow=0,i_rowcopy=0,i_autocancel=0,i_autoclose=0
long i_modifytable=0,i_itemfocuschanged_message=0,i_superlevel=-1,i_selectprirow=0,i_shiftrow=0
boolean i_itemchtrue=true,i_rowdefault=true,i_delete=false,id_bstatus[],ib_deletenos

string	id_button[],i_ext='jpg',pb_text[],ispb_help[],pb_text2[],id_button2[],ispb_help2[]
string id_buttonpic[],i_pridouble='',i_saveflags='',i_primouse='',i_midnos='',is_piv,is_tempstring=''
picturebutton pb_button[],cb_button[],spb_button[],pb_button2[]

checkbox scb[]
statictext st_static[],st_static2[],st[]
singlelineedit sle[]
editmask smask[]
long id_slecount=0,id_stcount=0,id_maskcount=0,i_fwq=0,i_fnkey=0,i_delete0=0,i_newmodify=1
GraphicObject id_view[]
long id_view_yx[],id_xh[],id_viewcount,id_yx,i_px,i_py,i_prisizerow=0,i_midchlevel=20,i_inmid=0,i_autosave=1
long i_nolosefocus=0,i_triggerclasses=0,i_mdnos=0,i_keyflags=1,i_autochange=0
time i_priruntime=now()

public:
string i_message='',i_table='',i_menutext
string i_nos,is_chfield='chflags'
s_parm i_parm
string is_tabledetail
boolean ib_insert=true

protected:
string i_priorbutton
dropdownlistbox slb[]
long id_buttoncount=0,id_spbcount=0,id_slbcount=0,id_scbcount=0,id_buttoncount2=0,i_view=1,i_odd=1

string is_dwnotnull_head
string is_dwnotnull_detail
string is_dwunique_detail
string is_dwupdate_detail
string is_dwupdate_head

string is_hidefield_head
string is_hidefield_detail
string is_rightfield_detail

boolean ib_checkrow=true

s_zg_gencon i_zg_gencon

GraphicObject i_lastfocus
blob ib_fullstate_head,ib_fullstate_detail
int i_open=0


end variables

forward prototypes
private function integer wf_button_status (boolean lb_true)
public function integer wf_query ()
private function integer wf_deleteb ()
private function integer wf_multicolor (string ls_flags)
public function integer wf_initdisplay2 (long l_flags)
private function integer wf_initdisplay ()
private function integer wf_retrieveend2 ()
private function long wf_ue_key ()
private function long wf_end (string ls_flags)
private function integer wf_otherkey ()
private function integer wf_mousemove (string l_mouse, string ls_flags)
private function integer wf_ue_key0 ()
private function integer wf_onenos ()
private function integer wf_rbdown (datawindow dw_rtemp1)
private function long wf_inputkey (datawindow dw_ikey)
private function integer wf_mdnos (string ls_flags)
private function long wf_bsave (boolean lb_true, string ls_flags)
private function long wf_hsave (string l_nos, string ls_flags)
private function integer wf_out_deal ()
private function integer wf_deleteemp (string l_field1, string l_field2)
public subroutine wf_control_pos ()
private function integer wf_add (string l_field1)
private function integer wf_auto (string ls_flags)
private function integer wf_bactive (string ls_flags)
protected function integer wf_binit (string l_name, picturebutton l_button, string l_help, long l_i, long buttonflags)
public function integer wf_savemsg ()
public subroutine wf_cbstate_modify (boolean ab_ismod)
public function int wf_newnos ()
end prototypes

event ue_setsql();string l_table,l_ctable,l_dates
datetime l_tt
long l_return,l_second,l_com


i_keyflags=1
if not isvalid(wchild) then 
	wchild=this
elseif wchild=this then
		
elseif  not isvalid(wchild2) then 
	wchild2=this
end if
if Pos(g_menutext,'	')>0 then g_menutext=Mid(g_menutext,1,Pos(g_menutext,'	') - 1)
if Pos(g_menutext,'Alt')>0 then g_menutext=Mid(g_menutext,1,Pos(g_menutext,'Alt') - 1)

if isvalid(gdw_1) then
	//防止程序未释放
	messagebox('','存在异常gdw_1,请立刻通知厂商前面打开的最后一个界面和操作')
	messagebox('','存在异常gdw_1,请立刻通知厂商')
end if
i_auto=0
sqlca.autocommit=false
dw_input1.settransobject(sqlca)
dw_input1.setrowfocusindicator(hand!)
if dw_input1.dataobject<>'' then	f_displayonly(dw_input1,'displayonly')

dw_input2.settransobject(sqlca)
dw_input2.setrowfocusindicator(hand!)
if dw_input2.dataobject<>'' then	f_displayonly(dw_input2,'displayonly')

dw_input10.settransobject(sqlca)
dw_input10.setrowfocusindicator(hand!)
if dw_input10.dataobject<>'' then	f_displayonly(dw_input10,'displayonly')

dw_input20.settransobject(sqlca)
dw_input20.setrowfocusindicator(hand!)
if dw_input20.dataobject<>'' then	f_displayonly(dw_input20,'displayonly')


dw_input3.settransobject(sqlca)
dw_input3.setrowfocusindicator(hand!)
if dw_input3.dataobject<>'' then	f_displayonly(dw_input3,'displayonly')

dw_input4.settransobject(sqlca)
dw_input4.setrowfocusindicator(hand!)
if dw_input4.dataobject<>'' then	f_displayonly(dw_input4,'displayonly')

dw_input5.settransobject(sqlca)
dw_input5.setrowfocusindicator(hand!)
if dw_input5.dataobject<>'' then	f_displayonly(dw_input5,'displayonly')

dw_input40.settransobject(sqlca)
dw_input40.setrowfocusindicator(hand!)
if dw_input40.dataobject<>'' then	f_displayonly(dw_input40,'displayonly')

dw_input50.settransobject(sqlca)
dw_input50.setrowfocusindicator(hand!)
if dw_input5.dataobject<>'' then	f_displayonly(dw_input50,'displayonly')

dw_input6.settransobject(sqlca)
dw_input6.setrowfocusindicator(hand!)
if dw_input6.dataobject<>'' then	f_displayonly(dw_input6,'displayonly')

dw_words.settransobject(sqlca)
dw_words.setrowfocusindicator(hand!)
if dw_words.dataobject<>'' then	f_displayonly(dw_words,'displayonly')

dw_browse.settransobject(sqlca)
dw_browse.setrowfocusindicator(hand!)
if dw_browse.dataobject<>'' then	f_displayonly(dw_browse,'displayonly')
is_piv=f_maintain('colothpic','picv=')

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
//f_displayonly(dw_2,'displayonly')
//,'displayonly')
//dw_2.setrowfocusindicator(hand!)
dw_2.setrowfocusindicator(FocusRect!)
dw_21.settransobject(sqlca)
dw_21.setrowfocusindicator(hand!)
dw_22.settransobject(sqlca)
dw_22.setrowfocusindicator(hand!)
dw_23.settransobject(sqlca)
dw_23.setrowfocusindicator(hand!)
dw_24.settransobject(sqlca)
dw_24.setrowfocusindicator(hand!)
dw_25.settransobject(sqlca)
dw_25.setrowfocusindicator(hand!)
dw_26.settransobject(sqlca)
dw_26.setrowfocusindicator(hand!)
f_dw_deal(dw_1,'display','')

 if f_zg_w_deal(this,'issheet')=1 then
 else
	this.controlmenu=false
 end if
 
l_table=f_updatetable(dw_1)

//跟踪操作员,只允许运行一次
if g_tracetf=1 then
 if i_modifytable=0 then
	i_modifytable++
	f_wgz_tableflow(l_table,i_flowno,'')
 end if
end if

f_w_language(this,'');if i_menutext='' then i_menutext=g_menutext;if is_admit='' then is_admit=gs_admit;if is_admitbz='' then is_admitbz=gs_admitbz
/*superlevel*/
i_superlevel=f_zg_superlevel(l_table)

/*自动保存*/

l_return=f_registry_cardpos(l_com,'r','savesecond')
if l_return=0 then
	l_second=l_com
else
	l_second=120
end if
if l_second<10 and not fileexists('zx_00.pbl') then
	l_second=10
end if
timer(l_second)
i_deleteall=0

end event

event type long ue_key(keycode key, unsignedinteger keyflags);
return 0

end event

event type long ue_afteropen();
if g_menutext<>'' then f_menu_control_special(this,g_menutext)
this.windowstate=normal!
this.setredraw(true)
if g_menutext<>'' then f_maintain_s(gs_runmemory,'windowopenend=','')
return 0
end event

event type long ue_beforeopen(string ls_flags);
if g_tbp=1 and dw_button.visible=false then
	//this.visible=false
end if

if i_menutext='' then i_menutext=g_menutext

//出现区域pos  open trigger 死机
//if i_open=0 then
//	id_buttoncount=0
//	id_spbcount=0
//	id_slbcount=0
//	id_scbcount=0
//	id_buttoncount2=0
//	id_slecount=0
//	id_stcount=0
//	id_maskcount=0
//end if
//
gs_mdikey='0'

return 0
end event

private function integer wf_button_status (boolean lb_true);
picturebutton ld_button[]
long ld_count,l_i

ld_count=0
ld_count=ld_count + 1;ld_button[ld_count]=cb_add
ld_count=ld_count + 1;ld_button[ld_count]=cb_save
ld_count=ld_count + 1;ld_button[ld_count]=cb_browse
ld_count=ld_count + 1;ld_button[ld_count]=cb_delete
ld_count=ld_count + 1;ld_button[ld_count]=cb_modify
ld_count=ld_count + 1;ld_button[ld_count]=cb_query
ld_count=ld_count + 1;ld_button[ld_count]=cb_detail
ld_count=ld_count + 1;ld_button[ld_count]=cb_report
ld_count=ld_count + 1;ld_button[ld_count]=cb_exit

if lb_true then
	for l_i=1 to ld_count
		ld_button[l_i].enabled=id_bstatus[l_i]
	next
else
	/*记忆*/
	for l_i=1 to ld_count
		id_bstatus[l_i]=ld_button[l_i].enabled
		ld_button[l_i].enabled=false
	next

end if


return 0
end function

public function integer wf_query ();
return 0
end function

private function integer wf_deleteb ();


/*if wf_deleteb()=1 then return*/
long l_selectrow,l_rowcount,l_i,l_k,l_redraw=0,l_nowrow=0

if dw_2.getrow()=0 or dw_2.rowcount()=0 or pb_delete.enabled=false &
											or pb_delete.visible=false then return 1

if dw_2.getrow()>0 then
	l_rowcount=dw_2.rowcount()
	l_selectrow=0
	for l_i=1 to l_rowcount
		if dw_2.isselected(l_i) then
			l_selectrow=l_selectrow + 1
		end if
	next
end if	

if (l_selectrow=l_rowcount or i_deleteall=1) and cb_delete.visible=true then
	if f_messagebox('',f_wl('是否删除所有行立刻保存')+' '+string(l_rowcount),2,2)=2 then 
		return 1
	end if
elseif l_selectrow=0 then
	if f_messagebox('',f_wl('是否删除当前行'),2,2)=2 then 
		return 1
	end if
else
	if f_messagebox('',f_wl('是否删除选中行')+' '+string(l_selectrow),2,2)=2 then 
		return 1
	end if
end if

i_itemchanged='success'

if dw_2.getrow()>0 then
//	i_delete=true
	
	if (l_selectrow=l_rowcount or i_deleteall=1) and cb_delete.visible=true then
		i_delete=false
		i_autocancel=1
		pb_cancel.triggerevent(clicked!)
		cb_delete.triggerevent(clicked!)
		i_autocancel=0
		//dw_button.post event ue_init(0)
		
		return 1
	elseif l_selectrow=0 then
		l_nowrow=dw_2.getrow()
		if dw_2.dataobject='d_zg_hp_input2_apack' and i_delete0=1  then
			for l_k=1 to g_hpcolumns
				dw_2.setitem(dw_2.getrow(),'price'+string(l_k),0)
			next
			dw_2.setitem(dw_2.getrow(),'pricehj',0)
		else
			dw_2.deleterow(dw_2.getrow())
		end if
		if l_nowrow>1 then dw_2.scrolltorow(l_nowrow - 1)	
	
	else
		l_i=1
		if dw_2.rowcount()>2 then 
			dw_2.setredraw(false)
			l_redraw++
		end if
		
		i_delete=true
		do while l_i<=dw_2.rowcount()
			if dw_2.rowcount()>1 then 
				f_wgz_meter(l_i*100/dw_2.rowcount())
			else
				dw_2.setredraw(true)
				l_redraw=l_redraw - 1
			end if
			
			if dw_2.isselected(l_i) then
				if dw_2.dataobject='d_zg_hp_input2_apack' and i_delete0=1  then
					for l_k=1 to g_hpcolumns
						dw_2.setitem(l_i,'price'+string(l_k),0)
					next
					dw_2.setitem(l_i,'pricehj',0)
					l_i=l_i + 1
				else
					dw_2.deleterow(l_i)
				end if
			else
				l_i=l_i + 1
			end if
			
		loop
		i_delete=false
		if l_redraw>0 then dw_2.setredraw(true)
		dw_2.triggerevent(rowfocuschanged!)
	end if
//	i_delete=false
end if
i_itemchanged='success'
pb_save.enabled=true
wf_add(is_keybfield)

dw_2.setfocus()

return 0


///*if wf_deleteb()=1 then return*/
//long l_selectrow,l_rowcount,l_i,l_k,l_redraw=0,l_nowrow=0
//
//if dw_2.getrow()=0 or dw_2.rowcount()=0 or pb_delete.enabled=false &
//											or pb_delete.visible=false then return 1
//
//if dw_2.getrow()>0 then
//	l_rowcount=dw_2.rowcount()
//	l_selectrow=0
//	for l_i=1 to l_rowcount
//		if dw_2.isselected(l_i) then
//			l_selectrow=l_selectrow + 1
//		end if
//	next
//end if	
//
//if l_selectrow=0 then
//	if f_messagebox('',f_wl('是否删除当前行'),2,2)=2 then 
//		return 1
//	end if
//elseif l_selectrow=l_rowcount and cb_delete.visible=true then
//	if f_messagebox('',f_wl('是否删除所有行立刻保存')+' '+string(l_selectrow),2,2)=2 then 
//		return 1
//	end if
//else
//	if f_messagebox('',f_wl('是否删除选中行')+' '+string(l_selectrow),2,2)=2 then 
//		return 1
//	end if
//end if
//
//
//if dw_2.getrow()>0 then
////	i_delete=true
//		
//	if l_selectrow=0 then
//		l_nowrow=dw_2.getrow()
//		if dw_2.dataobject='d_zg_hp_input2_apack' and i_delete0=1  then
//			for l_k=1 to g_hpcolumns
//				dw_2.setitem(dw_2.getrow(),'price'+string(l_k),0)
//			next
//			dw_2.setitem(dw_2.getrow(),'pricehj',0)
//		else
//			dw_2.deleterow(dw_2.getrow())
//		end if
//		if l_nowrow>1 then dw_2.scrolltorow(l_nowrow - 1)	
//	elseif l_selectrow=l_rowcount and cb_delete.visible=true then
//		i_delete=false
//		i_autocancel=1
//		pb_cancel.triggerevent(clicked!)
//		cb_delete.triggerevent(clicked!)
//		i_autocancel=0
//		return 1
//	else
//		l_i=1
//		if dw_2.rowcount()>2 then 
//			dw_2.setredraw(false)
//			l_redraw++
//		end if
//		
//		i_delete=true
//		do while l_i<=dw_2.rowcount()
//			if dw_2.rowcount()>1 then 
//				f_wgz_meter(l_i*100/dw_2.rowcount())
//			else
//				dw_2.setredraw(true)
//				l_redraw=l_redraw - 1
//			end if
//			
//			if dw_2.isselected(l_i) then
//				if dw_2.dataobject='d_zg_hp_input2_apack' and i_delete0=1  then
//					for l_k=1 to g_hpcolumns
//						dw_2.setitem(l_i,'price'+string(l_k),0)
//					next
//					dw_2.setitem(l_i,'pricehj',0)
//					l_i=l_i + 1
//				else
//					dw_2.deleterow(l_i)
//				end if
//			else
//				l_i=l_i + 1
//			end if
//			
//		loop
//		i_delete=false
//		if l_redraw>0 then dw_2.setredraw(true)
//		dw_2.triggerevent(rowfocuschanged!)
//	end if
////	i_delete=false
//end if
//
//pb_save.enabled=true
//wf_add(is_keybfield)
//i_itemchanged='success'
//dw_2.setfocus()
//
//return 0
//
end function

private function integer wf_multicolor (string ls_flags);


/*自动多色处理wf_multicolor(''rowchange'/'')*/
string l_colthno,l_pricolthno,ld_color[],l_color,l_nowcolor,l_columnname,l_field='',l_nextcolthno=''
string l_colthname
long ld_count,l_row,l_i=0,l_nowrow
if dw_2.dataobject<>'d_zg_hp_input2_apack' or g_style_color>0 or dw_2.getrow()=0 then
	return 0
end if
/*记忆*/

if cbx_multicolor.checked=false or cbx_multicolor.visible=false or cbx_multicolor.thirdstate=true then
	return 0
end if

if dw_2.getcolumnname()='colors'  or dw_2.getcolumnname()='colthno' then
else
	return 0
end if
l_nowrow=dw_2.getrow()
l_columnname=dw_2.getcolumnname()

l_colthno=trim(dw_2.getitemstring(dw_2.getrow(),'colthno'))
if isnull(l_colthno) then l_colthno=''
if l_colthno='' then return 0

l_nowcolor=dw_2.getitemstring(dw_2.getrow(),'colors')
if l_nowcolor='' or isnull(l_nowcolor) then
	return 0
end if

if dw_2.getrow()>1 then
	l_pricolthno=trim(dw_2.getitemstring(dw_2.getrow() - 1,'colthno'))
	if isnull(l_pricolthno) then l_pricolthno=''
end if

if dw_2.getrow()<dw_2.rowcount() then
	l_nextcolthno=trim(dw_2.getitemstring(dw_2.getrow() + 1,'colthno'))
	if isnull(l_nextcolthno) then l_nextcolthno=''
end if

if ls_flags='rowchange' then
	if l_pricolthno=l_colthno and l_nowcolor<>'' then
		for l_i=1 to g_hpcolumns
			l_field='price'+string(l_i)
			dw_2.setcolumn(l_field)
			if dw_2.getcolumnname()=l_field then
				exit			
			end if
		next
	end if
	
	return 0
end if

if l_pricolthno=l_colthno or l_colthno='' or l_nextcolthno=l_colthno then
	return 0
end if

declare l_cur cursor for 
	select aa=max(substring(color_nos,:g_color_s,:g_colorf_len)) from coloth_easy 
where colthno=:l_colthno 
		group by substring(color_nos,:g_color_s,:g_colorf_len) 
		order by aa;  //substring(color_nos,:g_color_s,:g_color_len);
open l_cur;
f_sqlca_check('')
setnull(l_color)
fetch l_cur into :l_color;
f_sqlca_check('')
ld_count=0
do while not isnull(l_color)
	ld_count=ld_count + 1
	ld_color[ld_count]=l_color
	setnull(l_color)
	fetch l_cur into :l_color;
	f_sqlca_check('')
loop
close l_cur;

if ld_count=0 then return 0

l_color=dw_2.getitemstring(dw_2.getrow(),'colors')+dw_2.getitemstring(dw_2.getrow(),'fwd')
if ld_count<=1 or ld_color[1]<>l_color then return 0
///*增加行*/

/*增加行*/
for l_i=1 to ld_count - 1
	/*行复制 产生getrow变化*/
	dw_2.rowsCopy(l_nowrow,l_nowrow,Primary!,dw_2,l_nowrow + l_i,Primary!)
	dw_2.setitem(l_nowrow + l_i,'colors',Mid(ld_color[l_i + 1],1,g_color_len))
	dw_2.setitem(l_nowrow + l_i,'fwd',Mid(ld_color[l_i + 1],g_color_len + 1,g_f_len))
	
	if g_hpnames=2 then
		f_hp_colthname(l_colthno,Mid(ld_color[l_i + 1],1,g_color_len),l_colthname)
		dw_2.setitem(l_nowrow + l_i,'colthname',l_colthname)
	end if
	dw_2.scrolltorow(l_nowrow + l_i)
	dw_2.setcolumn('colors')
	dw_2.triggerevent(editchanged!)
//	dw_2.triggerevent(itemchanged!)
	
next

dw_2.scrolltorow(l_nowrow)
if dw_2.getcolumnname()<>l_columnname then 
	dw_2.setcolumn(l_columnname)
end if

return 0
end function

public function integer wf_initdisplay2 (long l_flags);
/*l_flags=0 第一次 1:运行中*/

//
if l_flags=0 then
	
	
//	id_slbcount++
//	slb[id_slbcount]=ddlb_classes


//	id_scbcount++
//	scb[id_scbcount]=cbx_ccd
//	id_scbcount++
//	scb[id_scbcount]=cbx_combind
//	id_scbcount++
//	scb[id_scbcount]=cbx_multicolor
//	
//	
//	id_slecount++
//	sle[id_slecount]=sle_pos
//
	
//	id_stcount++
//	st[id_stcount]=st_pos
	
	
//	id_spbcount++;spb_button[id_spbcount]=pb_resetprice
//	id_spbcount++;spb_button[id_spbcount]=pb_colthnomodify
//
//	id_maskcount++;smask[id_maskcount]=em_pricedec
	

end if
//
id_buttoncount2=0
//wf_binit('delete',cb_delete,'删除点击信息',1,2)
//wf_binit('downup',pb_downup,'盘点器输入',1,2)
//wf_binit('send',pb_send,'发送确认',2,2)
//wf_binit('tosa',pb_tosa,'转销',3,2)
//wf_binit('cegui',pb_cegui,'撤柜',4,2)
//wf_binit('buyp',pb_buyp,'配货单',5,2)
//wf_binit('rt',pb_rt,'退货',6,2)
//wf_binit('rowcopy',pb_rowcopy,'行复制',7,2)
//wf_binit('copy',pb_copy,'复制',8,2)
//wf_binit('xh',pb_xh,'整箱',9,2)
//wf_binit('combine',pb_combine,'合并',10,2)
//

/*更换按钮*/
//for l_i=1 to id_buttoncount
//	if id_button[l_i]='check' then
//		pb_button[l_i]=pb_pay
//		cb_button[l_i]=pb_pay
//		ispb_help[l_i]='收款'
//		exit
//	end if
//next
//
return 0
end function

private function integer wf_initdisplay ();
s_parm l_parm
string l_value
long l_i

//f_yield(this,'')  //存在问题

if not isvalid(this) then
	return 0
end if

i_newmodify=1
/*单号删除*/
ib_deletenos=false
if cbx_multicolor.visible=true and i_priorbutton<>'cb_exit' and i_runcount=0 then
	f_registry_wgz(l_value,'r',g_menutext+'multicolor')
	if l_value='3' then
		cbx_multicolor.thirdstate=true
	elseif l_value<>'1' then
		 cbx_multicolor.checked=false
		
	else
		 cbx_multicolor.checked=true
	end if
	
	f_registry_wgz(l_value,'r',g_menutext+'dw2xj')
	if l_value<>'1' then
		 cbx_dw2xj.checked=false
		
	else
		 cbx_dw2xj.checked=true
	end if


	i_runcount++
end if


id_slbcount=0
id_spbcount=0
id_slecount=0
id_stcount=0
id_scbcount=0
id_maskcount=0
	
	
id_spbcount=0
id_buttoncount=0
id_slbcount=0
id_scbcount=0
id_buttoncount2=0
id_slecount=0
id_stcount=0

l_parm.ld_count=0
l_parm.ld_count=l_parm.ld_count + 1
l_parm.l_any[l_parm.ld_count]=sle_1
l_parm.l_anyclass[l_parm.ld_count]='singlelineedit'

l_parm.ld_count=l_parm.ld_count + 1
l_parm.l_any[l_parm.ld_count]=dw_1
l_parm.l_anyclass[l_parm.ld_count]='datawindow_x'

l_parm.ld_count=l_parm.ld_count + 1
l_parm.l_any[l_parm.ld_count]=dw_browse
l_parm.l_anyclass[l_parm.ld_count]='datawindow_pos'

/*促销问题*/
//l_parm.ld_count=l_parm.ld_count + 1
//l_parm.l_any[l_parm.ld_count]=dw_input50
//l_parm.l_anyclass[l_parm.ld_count]='datawindow_y'

l_parm.ld_count=l_parm.ld_count + 1
l_parm.l_any[l_parm.ld_count]=dw_2
l_parm.l_anyclass[l_parm.ld_count]='datawindow'

l_parm.ld_count=l_parm.ld_count + 1
l_parm.l_any[l_parm.ld_count]=sle_2
l_parm.l_anyclass[l_parm.ld_count]='singlelineedit_x'

l_parm.ld_count=l_parm.ld_count + 1
l_parm.l_any[l_parm.ld_count]=st_info
l_parm.l_anyclass[l_parm.ld_count]='statictext_x'
if g_style_color>0 then
	cbx_multicolor.visible=false
end if

f_wgz_w_autosize(this,'',l_parm)


id_buttoncount=0
id_buttoncount2=0
id_buttoncount++
id_button[id_buttoncount]='add'
pb_button[id_buttoncount]=cb_add 
cb_button[id_buttoncount]=cb_add   //取消增加 pb_add
ispb_help[id_buttoncount]='增加新的单据'

id_buttoncount++
id_button[id_buttoncount]='modify'
pb_button[id_buttoncount]=cb_modify
cb_button[id_buttoncount]=pb_modify
ispb_help[id_buttoncount]='修改单据'

id_buttoncount++
id_button[id_buttoncount]='save'
pb_button[id_buttoncount]=cb_save
cb_button[id_buttoncount]=pb_save
ispb_help[id_buttoncount]='保存'

id_buttoncount++
id_button[id_buttoncount]='delete'
pb_button[id_buttoncount]=pb_delete  //取消删除 cb_delete
cb_button[id_buttoncount]=pb_delete
ispb_help[id_buttoncount]='删除单据明细'

id_buttoncount++
id_button[id_buttoncount]='cancel'
pb_button[id_buttoncount]=cb_cancel
cb_button[id_buttoncount]=pb_cancel
ispb_help[id_buttoncount]='取消最近一次修改'



id_buttoncount++
id_button[id_buttoncount]='check'
if i_fwq=1 then
	pb_button[id_buttoncount]=cb_send
	cb_button[id_buttoncount]=cb_send
	ispb_help[id_buttoncount]='提交'
else
	pb_button[id_buttoncount]=cb_check
	cb_button[id_buttoncount]=cb_check
	ispb_help[id_buttoncount]='确认,作废,反确认,反作废'
end if

id_buttoncount++
id_button[id_buttoncount]='browse'
pb_button[id_buttoncount]=cb_browse
cb_button[id_buttoncount]=cb_browse
ispb_help[id_buttoncount]='查询近日单据'

id_buttoncount++
id_button[id_buttoncount]='query'
pb_button[id_buttoncount]=cb_query
cb_button[id_buttoncount]=cb_query
pb_text[id_buttoncount]=''
ispb_help[id_buttoncount]='查询历史单据'

id_buttoncount++
id_button[id_buttoncount]='prior'
pb_button[id_buttoncount]=cb_prior
cb_button[id_buttoncount]=cb_prior
ispb_help[id_buttoncount]='前一页'

id_buttoncount++
id_button[id_buttoncount]='next'
pb_button[id_buttoncount]=cb_next
cb_button[id_buttoncount]=cb_next
ispb_help[id_buttoncount]='下一页'

//id_buttoncount++
//id_button[id_buttoncount]='detail'
//pb_button[id_buttoncount]=cb_detail
//cb_button[id_buttoncount]=cb_detail
//ispb_help[id_buttoncount]='单据输入上下切换'
//

id_buttoncount++
id_button[id_buttoncount]='view'
ispb_help[id_buttoncount]='各种选择和条件'


id_buttoncount++
id_button[id_buttoncount]='tool'
ispb_help[id_buttoncount]='各种特殊功能'


id_buttoncount++
id_button[id_buttoncount]='print'
pb_button[id_buttoncount]=cb_print
cb_button[id_buttoncount]=cb_print
ispb_help[id_buttoncount]='打印单据'


id_buttoncount++
id_button[id_buttoncount]='exit'
pb_button[id_buttoncount]=cb_exit
cb_button[id_buttoncount]=cb_exit
ispb_help[id_buttoncount]='退出界面'
pb_text[id_buttoncount]=''

for l_i=1 to id_buttoncount
	id_buttonpic[l_i]=''
next

id_slbcount=0
id_spbcount=0
id_slecount=0
id_stcount=0
id_scbcount=0
id_maskcount=0
	
wf_initdisplay2(0)
/*通用增加*/

return 0
end function

private function integer wf_retrieveend2 ();

return 0
end function

private function long wf_ue_key ();
GraphicObject which_control
datawindow dw_tps
long l_i
string l_nowclassname=''



if i_priorbutton='sle_pos' and keydown(keyenter!) then
	sle_pos.trigger event ue_enter()
	i_priorbutton=''
	return 1
end if



if keydown(keyescape!) 	then
	//防止界面未打开退出
	yield();if not isvalid(this) then return 1
	
	if isvalid(w_messagebox) or isvalid(w_zg_nos_query) then
		/*不能退出*/
		return 2
	end if
	
	if dw_browse.visible=true then
		/*pb8.0出现崩溃完善*/
		//yield()
		dw_browse.trigger event  ue_losefocus()
		dw_2.setfocus()
		/*已经button处理了*/
		return 2
		
	elseif dw_input1.visible=true then
		/*pb8.0出现崩溃完善 ->9.0测试*/
		//yield()
		dw_input1.trigger event  losefocus()
		if dw_input1.visible=false then	return 2		
	elseif dw_input2.visible=true then
		//yield()
		dw_input2.trigger event  losefocus()
		if dw_input2.visible=false then	return 2		
		
	elseif dw_input3.visible=true then
		//yield()
		dw_input3.trigger event  losefocus()
		if dw_input3.visible=false then	return 2		
		
	elseif dw_input4.visible=true then
		//yield()
		dw_input4.trigger event  losefocus()
		if dw_input4.visible=false then	return 2		
		
	elseif dw_input5.visible=true then
		//yield()
		dw_input5.trigger event  losefocus()
		if dw_input5.visible=false then	return 2		
		
	elseif dw_input6.visible=true then
		//yield()
		dw_input6.trigger event  losefocus()
		if dw_input6.visible=false then	return 2				
		
	elseif dw_input10.visible=true then
		//yield()
		dw_input10.trigger event  losefocus()
		if dw_input10.visible=false then	return 2		
		
	elseif dw_input20.visible=true then
		//yield()
		dw_input20.trigger event  losefocus()
		if dw_input20.visible=false then	return 2		
		
	elseif dw_input40.visible=true then
		//yield()
		dw_input40.trigger event  losefocus()
		if dw_input40.visible=false then	return 2				
		
	elseif dw_input50.visible=true then
		//yield()
		dw_input50.trigger event  losefocus()
		if dw_input50.visible=false then	return 2		
	
	end if
end if

if keydown(keyescape!) 	then
	//防止界面未打开退出
	//yield()
	if pb_cancel.enabled and pb_cancel.visible then 
		//i_esc=1
		if i_childclose=1 then
			pb_cancel.trigger event clicked()
			return 2
		else
			i_fnkey=1
			pb_cancel.trigger event clicked()
			
		end if
		return 1
	elseif cb_cancel.enabled and cb_cancel.visible then
		//i_esc=1
		cb_cancel.trigger event clicked()
		return 1
	elseif cb_exit.enabled and cb_exit.visible  then
		//if i_esc=0 then
			cb_exit.triggerevent(clicked!)
			/*退出不能更新dw_button*/
			return 0
//		else
//			i_esc=0
//		end if
		
		return 1
	end if
end if
//
if (keydown(keyf1!) or keydown(keyinsert!)) and cb_add.enabled &
	and cb_add.visible then
	cb_add.triggerevent(clicked!)
	return 1
end if
//

//if keydown(keyf2!) then
//	f_messagebox('','wgztest',0,0)
//end if

if keydown(keyf2!) and cb_save.enabled and cb_save.visible then
	cb_save.triggerevent(clicked!)
	return 1
end if
//
if keydown(keyf3!) and cb_browse.enabled and cb_browse.visible then
	cb_browse.triggerevent(clicked!)
	return 1
end if
//
if keydown(keyf4!) and cb_modify.enabled and cb_modify.visible then
	cb_modify.triggerevent(clicked!)
	return 1
end if

/*处理头部不修改*/
if keydown(keyf4!) and cb_modify.visible=false and cb_detail.visible and cb_detail.enabled then
	cb_detail.triggerevent(clicked!)
	return 1
end if

//
if keydown(keyf5!) and cb_print.enabled and cb_print.visible then
	cb_print.triggerevent(clicked!)
	return 1
end if
//

////or keydown(keydelete!)
if (keydown(keyf7!) ) &   
		and cb_delete.enabled and cb_delete.visible and dw_button.visible=false then
	cb_delete.triggerevent(clicked!)
	return 1
end if
//
if dw_button.visible=true and keydown(keyf8!) then
	/*切换*/
	
	if pb_save.enabled=true and pb_save.visible=true then
		dw_1.triggerevent(clicked!)
	elseif cb_save.enabled=true and cb_save.visible=true then
		dw_2.triggerevent(clicked!)
	end if
	return 1
end if



if keydown(keyf8!) and cb_detail.enabled and cb_detail.visible then
	cb_detail.triggerevent(clicked!)
	return  1
end if
//
if keydown(keypageup!) and cb_prior.enabled and cb_prior.visible then
	cb_prior.triggerevent(clicked!)
	return 1
end if
//
if keydown(keypagedown!) and cb_next.enabled and cb_next.visible then
	cb_next.triggerevent(clicked!)
	return 1
end if

which_control = GetFocus()
if isvalid(which_control) then
	if TypeOf(which_control)=datawindow! then
		dw_tps=which_control
		l_nowclassname=classname(dw_tps)
	end if
end if

if keydown(keyf12!) and dw_button.visible=true then
	
	if dw_view.visible=true or dw_button2.visible=true or not isvalid(dw_tps) then
		
	else
//		which_control = GetFocus()
//		if TypeOf(which_control)=datawindow! then
//			dw_tps=which_control
			
			if classname(dw_tps)="dw_button" then
				if i_dwfocus='dw_1' then
					dw_1.setfocus()
					return 1
				elseif i_dwfocus='dw_2' then
					dw_2.setfocus()
					return 1
				end if
				
				
			end if
		//end if
	end if
	
	dw_button.setfocus()
	
	l_i=wf_bactive('button')
	if l_i>0 then
		wf_mousemove('p_'+id_button[l_i],'button')
		if dw_view.visible=true or dw_button2.visible=true then
			dw_button.postevent(clicked!)
		end if
	else
		l_i=0
		do while l_i<id_buttoncount
			l_i++
			wf_mousemove('p_'+id_button[l_i],'button')
			if dw_button.describe('b_'+id_button[l_i]+'.visible')='1' then
				return 1
			end if
		loop
	end if
	
	return 1
end if
//i_nowmouse

if keydown(keyrightarrow!) and dw_view.visible=true and id_yx>0 then
	id_yx=f_zg_view_deal(id_view,id_view_yx,id_viewcount,id_yx)
	return 1
end if

if (keydown(keyenter!)) and dw_button2.visible=true  and l_nowclassname="dw_button2"  then
	dw_button2.postevent(clicked!)
	return 0
end if

if (keydown(keyenter!)) and dw_button.visible=true  and l_nowclassname="dw_button"  then
	dw_button.postevent(clicked!)
	
	
	return 0
end if

string l_tt


return wf_otherkey()

end function

private function long wf_end (string ls_flags);
/*处理运行结束问题 代替goto出现的问题*/



return 0
end function

private function integer wf_otherkey ();
/**/

return 0
end function

private function integer wf_mousemove (string l_mouse, string ls_flags);

long l_i,l_button=0,l_tool=0
string l_field,l_text,l_tps
choose case ls_flags
	case 'button'
		/*tool特殊处理*/
				
		if Mid(l_mouse,3,4) <> 'tool' and dw_button2.visible=true  then
			/*特殊Bug,自动运行dw_2的getfocus*/
		
			//dw_button.setfocus()
			dw_button2.visible=false
		
		end if
		
		l_tps=l_mouse
		if Mid(l_mouse,3,4) <> 'view' and dw_view.visible=true then
			if Left(l_tps,6)<>'l_head' then
				dw_view.trigger event ue_init(0)
				dw_view.visible=false
			end if
		end if
		
			for l_i=1 to id_buttoncount
				l_field=pb_text[l_i]
				if pb_text[l_i]='' then
					if Left(l_mouse,2+Len(id_button[l_i])) = 'p_'+id_button[l_i] then
						if Right(dw_button.describe('p_'+id_button[l_i]+'.filename'),Len('1.'+i_ext))='1.'+i_ext then
							/*disable*/
						else
							dw_button.modify('p_'+id_button[l_i]+'.visible="0"')
							dw_button.modify('b_'+id_button[l_i]+'.visible="1"')
							st_button.x=dw_button.x+long(dw_button.describe('b_'+id_button[l_i]+'.x'))
							st_button.y=dw_button.y+dw_button.height  //long(dw_button.describe('b_'+id_button[l_i]+'.height'))+40
							l_button=1
							st_button.text=ispb_help[l_i]
						end if
						
					//	exit
					elseif Left(l_mouse,2+Len(id_button[l_i])) = 'b_'+id_button[l_i] then
						l_button=1
						//st_button.visible=true
					else
						dw_button.modify('p_'+id_button[l_i]+'.visible="1"')
						dw_button.modify('b_'+id_button[l_i]+'.visible="0"')
						//st_button.visible=false
					end if
				else
					if Left(l_mouse,2+Len(l_field)) = 't_'+l_field then
						if dw_button.describe('t_'+l_field+'.text')='' then
							/*disable*/
						else
							dw_button.modify('t_'+l_field+'.visible="0"')
							dw_button.modify('b_'+l_field+'.visible="1"')
							dw_button.modify('b_'+l_field+'.text="'+pb_button[l_i].text+'"')
						end if
						exit
					elseif Left(l_mouse,2+Len(l_field)) = 'b_'+l_field then
					else
						dw_button.modify('t_'+l_field+'.visible="1"')
						dw_button.modify('b_'+l_field+'.visible="0"')
					end if
					
				end if
			next
		//end if
		
		if dw_button2.visible=true or dw_view.visible=true then
			st_button.visible=false
		elseif l_button=1 and dw_button2.visible=false then
			st_button.visible=true
			st_button.width=30*Len(st_button.text)
		else
			st_button.visible=false
		end if
		
		
		if Mid(l_mouse,3,4) = 'view' and dw_view.visible=false and Mid(i_primouse,3,4) <> 'view' then
			st_button.visible=false
			dw_button.triggerevent(clicked!)
		elseif Mid(l_mouse,3,4) = 'tool' and dw_button2.visible=false and Mid(i_primouse,3,4) <> 'tool' then
			st_button.visible=false
			dw_button.triggerevent(clicked!)
		end if
		
		i_primouse=l_mouse
		if (cb_save.enabled=true and cb_save.visible=true) &
				or (pb_save.enabled=true and pb_save.visible=true) or dw_browse.visible=true  then
		else		
			if Mid(l_mouse,3,4) <> 'tool' and l_mouse<>'' then dw_button.setfocus()
			
			if Mid(l_mouse,3,4) = 'tool' and dw_button.visible=true and dw_button2.visible=true  then
				dw_button2.setfocus()
			end if
		end if
	case else
		/*button2*/

		for l_i=id_buttoncount2 to 1 step -1
			l_field=pb_text2[l_i]
			l_text=pb_button2[l_i].text
			if l_text='' then l_text=ispb_help2[l_i]
			if Left(l_mouse,2+Len(l_field)) = 't_'+l_field and l_button=0 then
					if dw_button2.describe('t_'+l_field+'.text')='' then
						l_text=l_text
					elseif pb_button2[l_i].enabled=false then
						l_text=l_text
						/*disable*/
					else
						dw_button2.modify('t_'+l_field+'.visible="0"')
						dw_button2.modify('b_'+l_field+'.visible="1"')
						dw_button2.modify('b_'+l_field+'.text="'+l_text+'"')  //pb_button2[l_i].text
						st_button.x=dw_button2.x+dw_button2.width+5
						st_button.y=dw_button2.y + 76*(l_i - 1)
						
						l_button=1
						st_button.text=ispb_help2[l_i]
							
					end if
					//exit
			elseif Left(l_mouse,2+Len(l_field)) = 'b_'+l_field then
				l_button=1
			else
				dw_button2.modify('t_'+l_field+'.visible="1"')
				dw_button2.modify('b_'+l_field+'.visible="0"')
			end if
		next
		
		if l_button=1 then
			st_button.visible=true
		else
			st_button.visible=false
		end if
		
		st_button.width=35*Len(st_button.text)
end choose

return 1
end function

private function integer wf_ue_key0 ();
return wf_ue_key()
end function

private function integer wf_onenos ();
cb_add.visible=false
cb_browse.visible=false
cb_next.visible=false
cb_prior.visible=false
cb_query.visible=false
		
return 0
end function

private function integer wf_rbdown (datawindow dw_rtemp1);

if Pos(g_controls,'RPX=0')=0 then
	i_nolosefocus=1
	f_wgz_zg_sort(dw_rtemp1,'')
	i_nolosefocus=0
else
	dw_rtemp1.triggerevent(doubleclicked!)
end if
return 1
end function

private function long wf_inputkey (datawindow dw_ikey);
/*wf_inputkey(this)*/
if keydown(keyenter!) then
	dw_ikey.triggerevent(doubleclicked!)
	return 1
end if
if keydown(keyescape!) then
//	i_esc=1
//	this.triggerevent(losefocus!)
	return 1
end if


if keydown(keyf3!) then
	long l_k
	if dw_ikey.getrow()>0 and dw_ikey.getrow()<dw_ikey.rowcount() then
		for l_k=dw_ikey.getrow() + 1 to dw_ikey.rowcount()
			if dw_ikey.isselected(l_k) then
				dw_ikey.scrolltorow(l_k)
				exit
			end if
		next
	end if
	return 1
end if

return 0
end function

private function integer wf_mdnos (string ls_flags);
/*wf_mdnos(insert,'')*/
string l_table,l_nos

if dw_1.getrow()=0 or (ls_flags<>'insert' and i_mdnos=0) then return 0

/*关闭并发*/
if f_maintain('audit','PMD=')='0' then
	return 0
end if

if f_field(dw_1,'nos','isvalid')=0 then
	l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
	l_table=f_updatetable(dw_1)
end if

if isnull(l_nos) then l_nos=''

long l_return
if l_nos='' or l_table='' then
	return 0
end if

l_return=0

choose case ls_flags
	case 'insert'
		if (pb_save.enabled=true and pb_save.visible=true) or (cb_save.enabled=true and cb_save.visible=true) then
			 l_return=f_nos_modify_check(l_table,l_nos,'insert')  
			 i_mdnos=1
		end if
	case else
		if (pb_save.enabled=true and pb_save.visible=true) or (cb_save.enabled=true and cb_save.visible=true) then
		else
			l_return=f_nos_modify_check(l_table,l_nos,'')   ///reset')
		end if
end choose

return l_return
end function

private function long wf_bsave (boolean lb_true, string ls_flags);

/*wf_savestatus(true)*/
long l_return=0
//pb_nike_in.enabled=lb_true
//pb_send.enabled=lb_true
//pb_price.enabled=lb_true
cb_check.enabled=lb_true
if ls_flags='mdnos' then
	if lb_true then
		l_return=wf_mdnos('')
	else
		l_return=wf_mdnos('insert')
	end if
end if

//pb_downup.enabled=lb_true
//cb_generate.enabled=lb_true
//pb_send.enabled=lb_true
//dw_button.post event ue_init(0)
return l_return
end function

private function long wf_hsave (string l_nos, string ls_flags);	
string l_where,l_sql,l_table,l_tsql,ls_p1,ls_p2
long l_return=0,l_rows=0,l_tcount=0,l_i

if dw_2.dataobject<>'d_zg_hp_input2_apack' then
	
		
	if  f_field(dw_2,'endprice','isvisible')=0 then
		ls_p1='endprice'
	end if
	
	if  f_field(dw_2,'endprice2','isvisible')=0 then
		ls_p2='endprice2'
	end if
	
	if dw_2.rowcount()>0 and (ls_p1<>'' or ls_p2<>'')  then
		for l_i=1 to dw_2.rowcount()
			if ls_p1<>'' then
				if dw_2.getitemnumber(l_i,ls_p1)<0 then
					rollback;
					f_messagebox('','价格不能为负',0,0)
					return -1
				end if
			end if
			
			if ls_p2<>'' then
				if dw_2.getitemnumber(l_i,ls_p2)<0 then
					rollback;
					f_messagebox('','价格2不能为负',0,0)
					return -1
				end if
			end if
		next
		
		
	end if
	
//	if dw_2.rowcount()>0 and f_field(dw_2,'endprice','isvisible')=0 then
//		for l_i=1 to dw_2.rowcount()
//			if dw_2.getitemnumber(l_i,'endprice')<0 then
//				rollback;
//				f_messagebox('','价格不能为负',0,0)
//				return -1
//			end if
//			
//		next
//		
//		
//	end if
	
	
	l_where='nos=~''+l_nos+'~''
	if Pos(ls_flags,'temp=1,')>0 then
		l_table=f_updatetable(dw_2)
		/*保存到临时表 必须预先建好  目前先trunfpb,以后要用多表的sql建立某个表的保存*/
		l_sql=dw_2.describe('datawindow.table.select')
		l_sql=f_wgz_string_replace(l_sql,l_table,'#'+l_table,'')
		
		/*参数取消*/
		if Pos(l_sql,' where ')>0 then
			l_sql=Mid(l_sql,1,Pos(l_sql,' where ') - 1)
		elseif Pos(l_sql,' WHERE ')>0 then
			l_sql=Mid(l_sql,1,Pos(l_sql,' WHERE ') - 1)
		end if
		if dw_2.rowcount()=0 then
			l_tsql="delete "+'#'+l_table
			execute immediate :l_tsql;
		end if
		
		
		f_wgz_sql_dw(w_main.dw_temp,'#'+l_table,l_sql,'update',sqlca)
		l_rows=dw_2.rowscopy(1,dw_2.rowcount(),Primary!,w_main.dw_temp,1,Primary!)
		
		if l_rows<=0 then
			l_return=w_main.dw_temp.update()
		else
				/*强行用高速*/
			if f_wgz_dwbcp_tran(w_main.dw_temp,'bcp=1,#'+l_table,sqlca,sqlca,l_where,l_where,'')=0 then
				l_return=1
			else
				l_return=-1
	//			w_wait.st_wait.text=f_wgz_language("直接保存")
	//			l_return=dw_ltemp.update(true,false)
			end if 
		end if
		
		w_main.dw_temp.reset()
	else
		if f_wgz_dwbcp_tran(dw_2,'',sqlca,sqlca,l_where,l_where,'')=0 then
			l_return=1
		else
			/*失败在写入errorlog前 必须回滚,否则有问题*/
		
			w_wait.st_wait.text=f_wgz_language("直接保存")
			l_return=dw_2.update(true,false)
		end if
	end if	
else
	l_where='recno='+string(g_recno)+''
	
//	l_sql="update zg_hptemp1 set colthno=colthno where "+l_where
//	execute immediate :l_sql;
//	
//	if dw_2.rowcount()>0 then
		if f_wgz_dwbcp_tran(dw_2,'bcp=1,'+'zg_hptemp1',sqlca,sqlca,l_where,l_where,'')=0 then
			l_return=1
		else
			/*失败在写入errorlog前 必须回滚,否则有问题*/
		
			w_wait.st_wait.text=f_wgz_language("直接保存")
			l_return=dw_2.update(true,false)
		end if
		
		/*价格负数控制*/
		select count(*) into :l_tcount from zg_hptemp1 where recno=:g_recno and price<0;
		if l_tcount>0 then
			rollback;
			f_messagebox('','价格不能为负',0,0)
			return -1
		end if
		
		
		
//	else
//		l_return=dw_2.update(true,false)
//	end if
end if

return l_return
end function

private function integer wf_out_deal ();
//导出安全控制
return 0
end function

private function integer wf_deleteemp (string l_field1, string l_field2);
/*删除空行 wf_deleteemp('colthno','color')*/
string l_tps1,l_tps2,l_field3,l_field4,l_tps3,l_tps4
long l_i=0,l_total

dw_2.filter()

l_field3=''
l_field4=''
if Pos(l_field1,',')>0 then
	l_field2=Mid(l_field1,Pos(l_field1,',') + 1,Len(l_field1))
	l_field1=Mid(l_field1,1,Pos(l_field1,',') - 1)
	if Pos(l_field2,',')>0 then
		l_field3=Mid(l_field2,Pos(l_field2,',') + 1,Len(l_field2))
		l_field2=Mid(l_field2,1,Pos(l_field2,',') - 1)
	end if
	
	if Pos(l_field3,',')>0 then
		l_field4=Mid(l_field3,Pos(l_field3,',') + 1,Len(l_field3))
		l_field3=Mid(l_field3,1,Pos(l_field3,',') - 1)
	end if
	
elseif dw_2.dataobject='d_zg_hp_input2_apack' then
	if l_field1='' then l_field1='colthno'
	if l_field2='' then l_field1='colors'
	/*空记录崩溃*/
	dw_2.setredraw(true)
elseif l_field1='' then
	l_field1='colthno'
   l_field2='color'
end if

if dw_2.rowcount()=0 or l_field1='' then return 0

if l_field1<>'' then
	if f_field(dw_2,l_field1,'isvalid')=-1 then
		return 0
	end if
end if

if l_field2<>'' then
	if f_field(dw_2,l_field2,'isvalid')=-1 then
		return 0
	end if
end if

if isvalid(w_wait) then w_wait.st_wait.text=f_wl('清理空记录')

l_i=1
l_total=dw_2.rowcount()

dw_2.setredraw(false)
do while l_i<=dw_2.rowcount()
//for l_i=1 to dw_2.rowcount() 
	if dw_2.rowcount()=1 then
		dw_2.setredraw(true)
	end if
	
	if mod(l_i,100)=0 then
		f_wgz_meter(l_i*100/dw_2.rowcount())
	end if
	l_tps1=dw_2.getitemstring(l_i,l_field1)
	if isnull(l_tps1) then l_tps1=''
	if l_field2<>'' then
		l_tps2=dw_2.getitemstring(l_i,l_field2)
	else
		l_tps2='wgz'
	end if
	if isnull(l_tps2) then l_tps2=''
	
	if l_field3<>'' then
		l_tps3=dw_2.getitemstring(l_i,l_field3)
	else
		l_tps3='wgz'
	end if
	if isnull(l_tps3) then l_tps3=''
	
	if l_field4<>'' then
		l_tps4=dw_2.getitemstring(l_i,l_field4)
	else
		l_tps4='wgz'
	end if
	if isnull(l_tps4) then l_tps4=''
	
	if l_tps1='' or l_tps2='' or l_tps3='' or l_tps4='' then
		/*删除与rowfocuschanged冲突  退出 */
		i_delete=true
		dw_2.deleterow(l_i)
		i_delete=false
	else
		l_i=l_i + 1
	end if
loop
if dw_2.rowcount()>0 then
	dw_2.setredraw(true)
end if
//next
if isvalid(w_wait) then w_wait.st_wait.text=f_wl('清理空记录')+'ok'
return 0
end function

public subroutine wf_control_pos ();int li_marginx,li_marginy,li_xpixel,li_ypixel
int li_width
int li_y

setredraw(false)

li_xpixel=pixelstounits(1,XPixelsToUnits!)
li_ypixel=pixelstounits(1,YPixelsToUnits!)

li_marginx=pixelstounits(5,XPixelsToUnits!)
li_marginy=pixelstounits(5,YPixelsToUnits!)
li_width=workspacewidth() - (2 * li_marginx)

li_y=li_marginy
dw_button.move(li_marginx,li_y)
//dw_button.show()

li_y+= dw_button.height + li_marginy

dw_1.move(li_marginx,li_y)
dw_1.width=li_width

li_y+= dw_1.height - li_ypixel//+ li_marginy

dw_2.move(li_marginx,li_y) 
dw_2.resize(li_width,workspaceheight() - dw_2.y - li_marginy)

hscrollbar=false
vscrollbar=false

post setredraw(true)
end subroutine

private function integer wf_add (string l_field1);
/*由于dw_button取消增加,保证最后一行是空行*/
if dw_button.visible=false or pb_add.visible=false or pb_add.enabled=false or ii_enter=1 then 
	return 0
end if
string l_s1
long l_row
if dw_2.rowcount()=0 then
	l_s1=''
else
	if f_field(dw_2,l_field1,'isvalid')=-1 then return 0
	l_s1=trim(dw_2.getitemstring(dw_2.rowcount(),l_field1))
end if
if isnull(l_s1) then l_s1=''
if l_s1<>'' or dw_2.rowcount()=0 then
	if pb_add.visible=true and pb_add.enabled=true then
		i_addsrow=0
		pb_add.triggerevent(clicked!)
		i_addsrow=1
	end if
end if

return 0
end function

private function integer wf_auto (string ls_flags);
/*wf_auto('save/recovery/delete')*/
string l_nos,l_filename,l_file,named,l_filename2,l_tfilename[20],l_filename0,l_infile2,ls_pwd,ls_tfile
string l_tps=''
long l_return=0,l_i=0,value,l_ok,l_dealreturn,l_row0=0
boolean lb_true,lb_nos
datetime l_time1,l_time2


/*20120806 B/S  解决本地路径*/
string l_zgusepath2
l_zgusepath2=''
f_registry_wgz(l_zgusepath2,'r','zgusepath2')
if l_zgusepath2='' then
	l_zgusepath2=g_zgtemppath
end if


l_filename2=l_zgusepath2+'\'+'wio_'+gs_id+'.xls'
ls_tfile=l_zgusepath2+'\'+'wio_runsa'+'.xls'

if dw_1.getrow()>0 then
	if f_field(dw_1,'nos','isvalid')=0 then
		l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
	else
		l_nos=''
	end if
else
	return -1
end if

l_filename0=l_zgusepath2+'\'+sqlca.database+'auto'+l_nos+dw_2.dataobject
l_filename=l_filename0+string(i_odd)+'.xls'

ls_pwd=''
//if (g_flags1=0 and isvalid(w_make)) or (g_eprice=0) then
if (g_flags1=0 and classname(dw_1.getparent())='w_make') or (g_eprice=0) then
	ls_pwd=trim(f_maintain('security','XPD='))
	if isnull(ls_pwd) then ls_pwd=''
end if
		
choose case ls_flags
	case 'delete'
		if fileexists(l_filename) then
			filedelete(l_filename)
		end if
	case 'save','save1'
		/*自动备份*/
		
		if i_auto=0 then
			/*计算odd/even*/
			
			l_tfilename[1]=l_filename0+'1'+'.xls'
			l_tfilename[2]=l_filename0+'2'+'.xls'
			i_odd=1
			if not fileexists(l_tfilename[1]) then
				i_odd=1
			elseif not fileexists(l_tfilename[2]) then
				i_odd=2
			else
				//存在崩溃 
				if filelength(l_tfilename[1])>filelength(l_tfilename[2]) then
					i_odd=2
				else
					i_odd=1
				end if
				

			end if
		end if
		
		l_filename=l_filename0+string(i_odd)+'.xls'
		
		l_ok=1
		if dw_2.rowcount()>0 then 
			lb_true=i_itemchtrue
			i_itemchtrue=false
			
			if wf_out_deal()=-1 then
				l_ok=-1
			else
				
				if dw_2.saveas(l_filename,excel8!, TRUE)=1 then
					g_gen.f_excel_pwd(l_filename,ls_pwd,'')
				else
					l_ok=0
				end if
			end if
			
			i_itemchtrue=lb_true
			i_auto=1
		end if
		if ls_flags='save1' and l_ok=1 then
			/*允许选择文件 加密*/
			//f_getfileopenname('',l_filename2,l_filename, "xls","xls Files (*.xls;*.xlsx),*.xls;*.xlsx,")
			f_getfileopenname('',l_filename2,l_filename, "xls","xls Files (*.xls),*.xls,")
			if l_filename2='' then return 0
				
			if Right(l_filename2,4)<>'.xls' then
				f_messagebox('',f_wl('扩展名必须是xls'),0,0)
				return 0
			end if
			if dw_2.saveas(l_filename2,excel8!,TRUE)=1 then
				g_gen.f_excel_pwd(l_filename2,ls_pwd,'')
			else
				l_ok=0
			end if
			
		
		end if
		
	
		if l_ok=1 then
		//	f_messagebox('',f_wl('本地保存成功')+' ~r~n'+l_filename2,0,0)
	elseif l_ok=0 then
			f_messagebox('',f_wl('本地自动保存失败')+' ~r~n'+l_filename2,0,0)
		end if
//		
//		存:
//
//w_mdi_zx.ole_xls.Txtfile = "c:\temp.xls"
//w_mdi_zx.ole_xls.Xlsopen(False)
//w_mdi_zx.ole_xls.XlsSaveas("c:\temp.xls",True,'123')
////
//“123”:为读密码，”abc”:为写密码
//
//打开:
//
//rjhxls1.Txtfile = "c:\temp.xls"
//
//Call rjhxls1.Xlsopen(True, "123", "abc")
//
// 
//
//注：



	case 'recovery'
		if dw_2.enabled=true and pb_save.enabled=true and pb_save.visible=true &
									and pb_delete.enabled=true and pb_delete.visible=true then
			//if f_messagebox('',f_wl('是否恢复?')+' ~r~n'+f_wl(''),2,2)=1 then
				
//			l_return=f_messagebox('','本地恢复处理'+' ~r~n'+'1.是(Y):本单保存的文件恢复'+'~r~n'+&
//												"2.否(N):通用导出的文件恢复"+'~r~n'+'3.取消(C):不处理,',3,3)
			l_return=f_messagebox('','本地恢复处理'+' ~r~n'+'本单文件恢复格式是 xls文件'+' ~r~n'+&
					'yncrename=Y 本单文件恢复,N 通用文件恢复,C 取消;',3,3)									
			if l_return=2 then
				//f_getfileopenname('',l_filename2,l_filename, "xls","xls Files (*.xls;*.xlsx),*.xls;*.xlsx,")
				f_getfileopenname('',l_filename2,l_filename, "xls","xls Files (*.xls),*.xls,")
				l_filename=l_filename2
				if l_filename='' then return 0
			elseif l_return=3 then
				 return 0
			else
				
				l_tfilename[1]=l_filename0+'1'+'.xls'
				l_tfilename[2]=l_filename0+'2'+'.xls'
				
				
				if not fileexists(l_tfilename[1]) then
					l_filename=l_tfilename[2]
				elseif not fileexists(l_tfilename[2]) then
					l_filename=l_tfilename[1]
				elseif filelength(l_tfilename[1])>filelength(l_tfilename[2]) then
					l_filename=l_tfilename[1]
				else
					l_filename=l_tfilename[2]
				end if
			end if
			
			/*恢复*/
			if dw_2.rowcount()>0 then
//				if f_messagebox('',f_wl('恢复将覆盖已有记录')+' ~r~n'+f_wl('是否继续?'),2,2)=2 then
//					return -1
//				end if

				l_dealreturn=f_messagebox('',f_wl('已有记录')+' ~r~n'+'累计增加可能出现重复记录导致保存失败'+' ~r~n'+&
																			' yncrename=Y 覆盖,N 累计增加,C 取消;',3,3)
				if l_dealreturn=3 then
					return -1
				end if

			end if
			//dw_2.reset()
			
					
//			if not fileexists(l_filename) then
//				f_messagebox('',f_wl('文件不存在')+' ~r~n'+l_filename,0,0)
//				return -1
//			end if
			l_infile2=l_zgusepath2+'\'+'winfile.txt'   //dbf'
			
			l_tps=''
			if ls_pwd<>'' then
				l_tps=l_tps+'PWD='+ls_pwd+';'
			end if
			
			if f_wgz_to_dbf_dw(l_filename,l_infile2,l_tps,dw_2)<>0 then 
				f_messagebox('',l_filename+'  ~r~n'+f_wl('转换标准文件失败'),0,0)
				return -1
			end if
			
			i_delete=true
			
			
			dw_2.setredraw(false)
			if l_dealreturn=1 then
				do while dw_2.rowcount()>0
					dw_2.deleterow(0)
				loop
			else
				//空行要删除
				wf_deleteemp(is_keybfield,'')
			end if
			
			i_delete=false
			
			l_return=dw_2.importfile(l_infile2)
			filedelete(l_infile2)
			
			l_row0=dw_2.rowcount()
			wf_deleteemp(is_keybfield,'')
			l_return=dw_2.rowcount() - l_row0 + l_return
			
			
			//l_return=dw_2.importfile(l_filename)
			if l_return>0 then
				/*横排序号处理*/
				if f_field(dw_2,'nos','isvalid')=0 then
					lb_nos=true
				else
					lb_nos=false
				end if
				if dw_2.dataobject='d_zg_hp_input2_apack' or (l_nos<>'' and lb_nos=true ) then 
					l_i=1
					do while l_i<=dw_2.rowcount()
						if dw_2.dataobject='d_zg_hp_input2_apack' then
							dw_2.setitem(l_i,'recno',g_recno)
						else
							
							dw_2.setitem(l_i,'nos',l_nos)
						end if
						l_i=l_i + 1
					loop
					
				end if
				
				f_messagebox('',f_wl('成功恢复记录')+string(l_return)+' ~r~n'+&
												f_wl('保存后生效')+' ~r~n'+l_filename,0,0)
			else
				f_messagebox('',f_wl('恢复记录失败')+string(l_return)+'  '+l_filename,0,0)
			end if
		else
			f_messagebox('',f_wl('请在修改和允许删除状态下点表身恢复'),0,0)
		end if
		dw_2.setredraw(true)
end choose
	
gu_ext_func.uf_SetCurrentDirectory(g_current_path)

//gf_setcurrent
return 0
end function

private function integer wf_bactive (string ls_flags);
/*获取活动的按扭wf_bactibe('button')*/
long l_i
string l_field

choose case ls_flags 
	case ''
		for l_i=1 to 15
			if l_i=1 then
				l_field='b_other01'
			else
				l_field='b_other'+string(l_i)
			end if
			
			if dw_button2.describe(l_field+'.visible')='1' then
				return l_i
			end if
		next
	case 'button'
		for l_i=1 to id_buttoncount
			l_field=id_button[l_i]
			if dw_button.describe('b_'+l_field+'.visible')='1' then
				return l_i
			end if
		next
end choose

return 0
end function

protected function integer wf_binit (string l_name, picturebutton l_button, string l_help, long l_i, long buttonflags);
/*wf_binit(l_name,l_button,l_help)*/

if l_help='' then l_help=l_button.text

if buttonflags=2 then
	if l_button.visible=true then  //l_button.enabled=true  then  
		id_buttoncount2++
		if l_button.text='盘点器' then 
			l_button.text='盘点器(&X)'
//			l_button.text=l_name
		end if
		id_button2[id_buttoncount2]=l_name
		pb_button2[id_buttoncount2]=l_button
		ispb_help2[id_buttoncount2]=l_help
		if id_buttoncount2=1 then
			pb_text2[id_buttoncount2]='other01'
		else
			pb_text2[id_buttoncount2]='other'+string(id_buttoncount2)
		end if
	end if
else
	id_buttoncount++

	id_button[id_buttoncount]=l_name
	pb_button[id_buttoncount]=l_button
	cb_button[id_buttoncount]=l_button
	ispb_help[id_buttoncount]=l_help
	
	pb_text[id_buttoncount]='other'+string(l_i)
end if

return 0
end function

public function integer wf_savemsg ();int li_ret
string ls_errtext
boolean lb_wait
long l_row,l_row2
lb_wait=isvalid(w_wait)
if not(pb_save.enabled=true and pb_save.visible=true) then return 0

//if dw_1.accepttext()=-1 then goto e
//if dw_2.accepttext()=-1 then goto e

//l_row=dw_1.getrow()
//l_row2=dw_2.getrow()

//ls_errtext=dw_1.event ue_checknull(l_row)
//if ls_errtext<>'' then goto e
//ls_errtext=dw_2.event ue_checknull(l_row2)
//if ls_errtext<>'' then goto e

//if dw_1.ModifiedCount()=0 and dw_1.DeletedCount ( )=0 &
//	and dw_2.ModifiedCount()=0 and dw_2.DeletedCount ( )=0 then return 0

li_ret=f_messagebox('','是否自动保存?',3,3)
if li_ret=1 then 
	if pb_save.event clicked()=-1 then goto e //自动保存
	return 1
elseif li_ret=2 then
	return 2
end if

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then u_derek.closewait()
return -1
end function

public subroutine wf_cbstate_modify (boolean ab_ismod);
int li_x=10000
boolean lb_unvalue
string ls_modify_detail,ls_modify_head
string ls_value,ls_errtext
long l_row
if ab_ismod=true then
	 if dw_1.rowcount()<=0 then 
		ls_errtext='无记录!'
		goto e
	 end if
end if

lb_unvalue=(ab_ismod=false)

cb_modify.enabled=lb_unvalue
pb_modify.enabled=lb_unvalue
cb_exit.enabled=lb_unvalue
cb_print.enabled=lb_unvalue
cb_query.enabled=lb_unvalue
cb_browseall.enabled=lb_unvalue
cb_last.enabled=lb_unvalue
cb_first.enabled=lb_unvalue
cb_next.enabled=lb_unvalue
cb_prior.enabled=lb_unvalue
cb_send.enabled=lb_unvalue
cb_check.enabled=lb_unvalue

cb_add.enabled=lb_unvalue
pb_add.enabled=ab_ismod
cb_delete.enabled=ab_ismod
pb_delete.enabled=ab_ismod
cb_save.enabled=ab_ismod
pb_save.enabled=ab_ismod
cb_cancel.enabled=ab_ismod
pb_cancel.enabled=ab_ismod

if ab_ismod=true then 
	ls_modify_detail+="DataWindow.Selected.Mouse=no " //防止修改时焦点不在输入栏里
	ls_value='1'
else
	ls_modify_detail+="DataWindow.Selected.Mouse=yes "
	ls_value='0'
end if

//逗号分隔字符串
ls_modify_head+=u_derek.u_dd.getattribstring(is_dwupdate_head,'tabsequence',ls_value)
ls_modify_detail+=u_derek.u_dd.getattribstring(is_dwupdate_detail,'tabsequence',ls_value)

//messagebox('',ls_modify_head)
ls_errtext=dw_1.modify(ls_modify_head)
if ls_errtext<>'' then goto e

ls_errtext+=dw_2.modify(ls_modify_detail)
if ls_errtext<>'' then goto e

dw_2.post event ue_setmodify(ab_ismod)

return //true
e:
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
return //false
//if lb_wait=false then u_derek.closewait()


end subroutine

public function int wf_newnos ();return 0
end function

on w_couple_parent_sheet_derek.create
int iCurrent
call super::create
this.pb_attach=create pb_attach
this.p_11=create p_11
this.dw_26=create dw_26
this.dw_25=create dw_25
this.dw_24=create dw_24
this.dw_input60=create dw_input60
this.cb_send=create cb_send
this.cbx_dw2xj=create cbx_dw2xj
this.st_pos=create st_pos
this.sle_pos=create sle_pos
this.cbx_multicolor=create cbx_multicolor
this.dw_view=create dw_view
this.pb_autorecovery=create pb_autorecovery
this.pb_autosave=create pb_autosave
this.dw_pos=create dw_pos
this.dw_button2=create dw_button2
this.st_button=create st_button
this.pb_rowcopy=create pb_rowcopy
this.dw_input50=create dw_input50
this.dw_input40=create dw_input40
this.dw_input20=create dw_input20
this.dw_input10=create dw_input10
this.cb_check=create cb_check
this.pb_help=create pb_help
this.dw_23=create dw_23
this.dw_22=create dw_22
this.dw_21=create dw_21
this.pb_21cancel=create pb_21cancel
this.pb_21delete=create pb_21delete
this.pb_21save=create pb_21save
this.pb_21add=create pb_21add
this.dw_words=create dw_words
this.dw_input6=create dw_input6
this.cb_report=create cb_report
this.dw_input5=create dw_input5
this.dw_input4=create dw_input4
this.dw_input3=create dw_input3
this.dw_input2=create dw_input2
this.dw_input1=create dw_input1
this.pb_modify=create pb_modify
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_add=create pb_add
this.pb_save=create pb_save
this.pb_delete=create pb_delete
this.cb_detail=create cb_detail
this.cb_browseall=create cb_browseall
this.cb_add=create cb_add
this.cb_modify=create cb_modify
this.cb_cancel=create cb_cancel
this.cb_save=create cb_save
this.cb_query=create cb_query
this.cb_last=create cb_last
this.cb_first=create cb_first
this.cb_next=create cb_next
this.cb_prior=create cb_prior
this.cb_print=create cb_print
this.cb_browse=create cb_browse
this.cb_delete=create cb_delete
this.cb_exit=create cb_exit
this.dw_1=create dw_1
this.dw_browse=create dw_browse
this.dw_browseall=create dw_browseall
this.sle_1=create sle_1
this.sle_2=create sle_2
this.dw_button=create dw_button
this.st_info=create st_info
this.dw_2=create dw_2
this.u_derek=create u_derek
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_attach
this.Control[iCurrent+2]=this.p_11
this.Control[iCurrent+3]=this.dw_26
this.Control[iCurrent+4]=this.dw_25
this.Control[iCurrent+5]=this.dw_24
this.Control[iCurrent+6]=this.dw_input60
this.Control[iCurrent+7]=this.cb_send
this.Control[iCurrent+8]=this.cbx_dw2xj
this.Control[iCurrent+9]=this.st_pos
this.Control[iCurrent+10]=this.sle_pos
this.Control[iCurrent+11]=this.cbx_multicolor
this.Control[iCurrent+12]=this.dw_view
this.Control[iCurrent+13]=this.pb_autorecovery
this.Control[iCurrent+14]=this.pb_autosave
this.Control[iCurrent+15]=this.dw_pos
this.Control[iCurrent+16]=this.dw_button2
this.Control[iCurrent+17]=this.st_button
this.Control[iCurrent+18]=this.pb_rowcopy
this.Control[iCurrent+19]=this.dw_input50
this.Control[iCurrent+20]=this.dw_input40
this.Control[iCurrent+21]=this.dw_input20
this.Control[iCurrent+22]=this.dw_input10
this.Control[iCurrent+23]=this.cb_check
this.Control[iCurrent+24]=this.pb_help
this.Control[iCurrent+25]=this.dw_23
this.Control[iCurrent+26]=this.dw_22
this.Control[iCurrent+27]=this.dw_21
this.Control[iCurrent+28]=this.pb_21cancel
this.Control[iCurrent+29]=this.pb_21delete
this.Control[iCurrent+30]=this.pb_21save
this.Control[iCurrent+31]=this.pb_21add
this.Control[iCurrent+32]=this.dw_words
this.Control[iCurrent+33]=this.dw_input6
this.Control[iCurrent+34]=this.cb_report
this.Control[iCurrent+35]=this.dw_input5
this.Control[iCurrent+36]=this.dw_input4
this.Control[iCurrent+37]=this.dw_input3
this.Control[iCurrent+38]=this.dw_input2
this.Control[iCurrent+39]=this.dw_input1
this.Control[iCurrent+40]=this.pb_modify
this.Control[iCurrent+41]=this.st_1
this.Control[iCurrent+42]=this.pb_cancel
this.Control[iCurrent+43]=this.pb_add
this.Control[iCurrent+44]=this.pb_save
this.Control[iCurrent+45]=this.pb_delete
this.Control[iCurrent+46]=this.cb_detail
this.Control[iCurrent+47]=this.cb_browseall
this.Control[iCurrent+48]=this.cb_add
this.Control[iCurrent+49]=this.cb_modify
this.Control[iCurrent+50]=this.cb_cancel
this.Control[iCurrent+51]=this.cb_save
this.Control[iCurrent+52]=this.cb_query
this.Control[iCurrent+53]=this.cb_last
this.Control[iCurrent+54]=this.cb_first
this.Control[iCurrent+55]=this.cb_next
this.Control[iCurrent+56]=this.cb_prior
this.Control[iCurrent+57]=this.cb_print
this.Control[iCurrent+58]=this.cb_browse
this.Control[iCurrent+59]=this.cb_delete
this.Control[iCurrent+60]=this.cb_exit
this.Control[iCurrent+61]=this.dw_1
this.Control[iCurrent+62]=this.dw_browse
this.Control[iCurrent+63]=this.dw_browseall
this.Control[iCurrent+64]=this.sle_1
this.Control[iCurrent+65]=this.sle_2
this.Control[iCurrent+66]=this.dw_button
this.Control[iCurrent+67]=this.st_info
this.Control[iCurrent+68]=this.dw_2
end on

on w_couple_parent_sheet_derek.destroy
call super::destroy
destroy(this.pb_attach)
destroy(this.p_11)
destroy(this.dw_26)
destroy(this.dw_25)
destroy(this.dw_24)
destroy(this.dw_input60)
destroy(this.cb_send)
destroy(this.cbx_dw2xj)
destroy(this.st_pos)
destroy(this.sle_pos)
destroy(this.cbx_multicolor)
destroy(this.dw_view)
destroy(this.pb_autorecovery)
destroy(this.pb_autosave)
destroy(this.dw_pos)
destroy(this.dw_button2)
destroy(this.st_button)
destroy(this.pb_rowcopy)
destroy(this.dw_input50)
destroy(this.dw_input40)
destroy(this.dw_input20)
destroy(this.dw_input10)
destroy(this.cb_check)
destroy(this.pb_help)
destroy(this.dw_23)
destroy(this.dw_22)
destroy(this.dw_21)
destroy(this.pb_21cancel)
destroy(this.pb_21delete)
destroy(this.pb_21save)
destroy(this.pb_21add)
destroy(this.dw_words)
destroy(this.dw_input6)
destroy(this.cb_report)
destroy(this.dw_input5)
destroy(this.dw_input4)
destroy(this.dw_input3)
destroy(this.dw_input2)
destroy(this.dw_input1)
destroy(this.pb_modify)
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_add)
destroy(this.pb_save)
destroy(this.pb_delete)
destroy(this.cb_detail)
destroy(this.cb_browseall)
destroy(this.cb_add)
destroy(this.cb_modify)
destroy(this.cb_cancel)
destroy(this.cb_save)
destroy(this.cb_query)
destroy(this.cb_last)
destroy(this.cb_first)
destroy(this.cb_next)
destroy(this.cb_prior)
destroy(this.cb_print)
destroy(this.cb_browse)
destroy(this.cb_delete)
destroy(this.cb_exit)
destroy(this.dw_1)
destroy(this.dw_browse)
destroy(this.dw_browseall)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.dw_button)
destroy(this.st_info)
destroy(this.dw_2)
destroy(this.u_derek)
end on

event open;call super::open;
i_lastfocus=this
string l_nossql
i_message=message.stringparm

hide()
post show()

//if g_menutext<>'' then 
//	i_menutext=g_menutext
//	title=i_menutext
//	 //必须在参数获取前
//	this.trigger event ue_beforeopen('')
//	//f_yield(this,'')
//	if not isvalid(this) then return 0
//	this.trigger event  ue_setsql()
//	windowstate=Maximized!
//	wf_initdisplay()
//	
//	dw_button.event ue_init(1)
//	
//	this.enabled=true
//	
//	this.post event  ue_afteropen()
//	
//else
//	i_menutext=title
//end if

dw_1.dataobject=dw_1.dataobject
dw_2.dataobject=dw_2.dataobject
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

wf_cbstate_modify(false)
wf_control_pos()
end event

event activate;call super::activate;if g_menutext='' then return 
//f_position_windows(this) 	//定位
//显示热键 父窗口为 主窗口 含Microhelp
window l_parent,l_parent2

if i_menutext<>'' and g_menutext<>i_menutext then
	if f_pri_sheet('allopen',w_mdi_zx)=0 then
		g_menutext=i_menutext;gs_admit=is_admit;gs_admitbz=is_admitbz
	end if
end if

setnull(l_parent)
l_parent=this.parentwindow()
if l_parent=l_parent2 then return 1
this.parentwindow().setmicrohelp(f_wgz_language('F1/Ins新增 F2保存 F3浏览 F4修改 F5列印 F7删除 F8切换 F9输入 F12快键 Esc取消/退出 PU前笔 PD后笔'))

end event

event closequery;if wf_savemsg()=-1 then return 1
end event

event deactivate;window l_parent,l_parent2
setnull(l_parent)
l_parent=this.parentwindow()
if l_parent=l_parent2 then return 1
this.parentwindow().setmicrohelp(g_info)
end event

event clicked;
dw_button.trigger event ue_input()
i_clicked=i_clicked + 1
if i_clicked=1 then
	return 
	
end if
//f_messagebox('',string(xpos)+'-'+string(ypos),0,0)
//if xpos>=dw_2.x and xpos<=dw_2.x+dw_2.width and ypos>=dw_2.y and ypos<=dw_2.y+dw_2.height then
//	if cb_save.enabled=true and cb_save.visible=true then
//		if not (dw_1.modifiedcount()>0 or dw_1.deletedcount()>0) then
//			cb_cancel.triggerevent(clicked!)
//		else
//			cb_save.triggerevent(clicked!)
//		end if
//	end if
//	
//	if cb_detail.visible=true and cb_detail.enabled=true then
//		cb_detail.triggerevent(clicked!)
//	end if
//	
//end if
//
//if xpos>=dw_1.x and xpos<=dw_1.x+dw_1.width and ypos>=dw_1.y and ypos<=dw_1.y+dw_1.height then
//	if pb_save.enabled=true and pb_save.visible=true then
//		if not (dw_2.modifiedcount()>0 or dw_2.deletedcount()>0) then
//			pb_cancel.triggerevent(clicked!)
//		else
//			pb_save.triggerevent(clicked!)
//		end if
//	elseif pb_cancel.enabled=true and pb_cancel.visible=true then
//		pb_cancel.triggerevent(clicked!)
//	end if
//	
//	
//	
//	
//	if cb_modify.visible=true and cb_modify.enabled=true then
//		cb_modify.triggerevent(clicked!)
//	end if
//	
//end if

/*窗口事件屏蔽*/
//if xpos>=dw_button.x and xpos<=dw_button.x+long(dw_button.describe('b_add.width'))+&
//							long(dw_button.describe('b_add.x')) &
//			and ypos>=dw_button.y and ypos<=dw_button.y+dw_button.height then
//	
//	if cb_save.enabled=true and cb_save.visible=true then
//		cb_save.triggerevent(clicked!)
//	end if
//	
//	if cb_add.visible=true and cb_add.enabled=true then
//		cb_add.triggerevent(clicked!)
//	end if
//	
//end if


if dw_button.visible=true then dw_button.post event ue_init(0)
end event

event timer;
//l_return=f_registry_cardpos(l_com,'w','savesecond')

string l_filename,l_filename2,l_nos,l_value
long l_i,l_return

if dw_2.enabled=true and pb_save.enabled=true and pb_save.visible=true then
	l_return=f_registry_wgz(l_value,'r','autosave')
	if l_value='1' then
		wf_auto('save')
	end if
end if


end event

event key;

//this.post event ue_key(key,keyflags)


if keydown(keyQ!) and keyflags=2 then
	//f_messagebox('','ctrl+f1',0,0)
	f_zg_multirun('')
	return 1
end if

if i_keyflags=0 then return 0

if abs(g_gen.msdiff(i_priruntime,now()))<500 then //=string(datetime(today(),now()),'yyyymmdd hh:mm:ss:ff') then
//	/*一秒内只运行一次*/
	return 1
else
	i_priruntime=now()   //string(datetime(today(),now()),'yyyymmdd hh:mm:ss:ff')

end if


if wf_ue_key0()=1 then
	
	if isvalid(this) then
		if dw_button.visible=true then 
			dw_button.post event ue_init(0)
		end if
	end if
end if


return 0

end event

event show;


this.setfocus()
end event

event doubleclicked;
if fileexists('zx_00.pbl') then
	f_messagebox('',this.classname(),0,0)
end if
end event

event close;call super::close;


//if isvalid(this) then 
//	g_tempstring=''
//	gs_mdikey='1'
//end if

//if isvalid(w_mdi_zx) then w_mdi_zx.wf_sheetclose(this,'')
//if w_mdi_zx.wf_sheet('')<=1 and  f_zg_w_deal(this,'issheet')=1  then
//		//w_mdi_zx.wf_qq_menu(true,'')
//		w_mdi_zx.rjh_right.visible=true
//		w_mdi_zx.rjh_right.bringtotop=true
//	end if
//	
end event

event other;

Choose   Case   Message.Number   
Case   522   //中轮滚动
	if   IntHigh(message.wordparm)   =   120   then   
	send(handle(this),277,2,0)    //向上
	else   
	send(handle(this),277,3,0)    //向下
	end   if   
end choose
end event

event resize;if sizetype<>1 then  wf_control_pos()
end event

type pb_attach from picturebutton within w_couple_parent_sheet_derek
integer x = 1175
integer y = 2016
integer width = 293
integer height = 120
integer taborder = 390
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "通用附件"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;
/**/
long value,l_excellen,l_fp,l_modi
string l_file,named,l_infonos,l_excelfile='',l_filename,l_bz='',l_bat=''
s_parm l_parm

if dw_1.getrow()=0 then 
	f_messagebox('',f_wl('无记录'),0,0)
	return
end if

l_parm.stringparm=f_updatetable(dw_1)
l_parm.stringparm2=dw_1.getitemstring(dw_1.getrow(),'nos')
openwithparm(w_zg_attachfile,l_parm)	

end event

type p_11 from picture within w_couple_parent_sheet_derek
boolean visible = false
integer x = 2528
integer y = 2056
integer width = 165
integer height = 144
boolean originalsize = true
end type

event doubleclicked;
this.visible=false
end event

type dw_26 from datawindow within w_couple_parent_sheet_derek
event type long ue_words ( )
event enterastab pbm_dwnprocessenter
event keydown pbm_dwnkey
boolean visible = false
integer x = 718
integer y = 508
integer width = 315
integer height = 112
integer taborder = 290
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event ue_words;if not this.getrow()>0 then return 0
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return 0
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
	commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
return 0
end event

event enterastab;

if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
if this.rowcount()>0 then
	//this.triggerevent(itemchanged!)
	if i_itemchanged='failure' then return	1
	if f_enter(this)=1 then 
		pb_add.triggerevent(clicked!)
	end if
end if
return 1
end event

event keydown;if keydown(keyescape!) and pb_cancel.enabled and pb_cancel.visible then 
	i_esc=1
	pb_cancel.triggerevent(clicked!)
	return 1
end if
if keydown(keyf1!) and pb_add.enabled and pb_add.visible then 
	pb_add.triggerevent(clicked!)
	return 1
end if
if keydown(keyf2!) and pb_save.enabled and pb_save.visible then 
	pb_save.triggerevent(clicked!)
	return 1
end if
if keydown(keyf4!) and pb_modify.enabled and pb_modify.visible then 
	pb_modify.triggerevent(clicked!)
	return 1
end if
if (keydown(keyf7!)) and pb_delete.enabled and pb_delete.visible  then
	pb_delete.triggerevent(clicked!)
	return 1
end if 
if keydown(keyf9!) then 
	dw_2.triggerevent(rbuttondown!)
	return 1
end if
//if  keydown(keyf12!) then
//	this.post event ue_words()
//	return 1
//end if

end event

event clicked;if not this.getrow()>0 then return 1
string l_tt
if (f_edit_styles(dw_1,this.getcolumnname())<>'edit') and (f_edit_styles(dw_1,this.getcolumnname())<>'editmask') then return
if dw_1.rowcount()>0 then
	i_trigger_itemchanged=true
//	this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	0
end if


end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
f_setcolumn(this,f_updatetable(this),i_columnname)
return  l_temp
end event

event doubleclicked;//if not this.getrow()>0 then return
//if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
//if pb_save.enabled=false or pb_save.visible=false  then return
//dw_input4  dw_input5 dw_input6 
//choose case  this.getcolumnname()
//	case 'colthno' 
//		if dw_input5.rowcount()=0 then 
//			dw_input5.retrieve()
//			f_displayonly(dw_input5,'displayonly')
//		if dw_input5.rowcount()>0 then
//			dw_input5.visible=true
//			dw_input5.setfocus()
//		else
//			f_messagebox('','无货号色号信息!',0,0)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//		if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if
//end choose
//return 1

end event

event editchanged;i_editchanged_column=this.getcolumnname()
i_editchanged_row=this.getrow()
if i_itemchanged='failure' then
	f_dw_prochange(this)
	i_itemchanged='success'
end if

//choose case this.getcolumnname()
//	case 'yg_no'
//		if len(trim(this.gettext()))=personcode_len then
//			this.trigger event enterastab()
//		end if
//	case 'yz_cod'
//		if len(trim(this.gettext()))=g_ziplen then
//			this.trigger event enterastab()
//		end if
//	case 'ghno'
//		if len(trim(this.gettext()))=g_ghlen then
//			this.trigger event enterastab()
//		end if
//	case 'yg_id'
//		if len(trim(this.gettext()))=g_idlen then
//			this.trigger event enterastab()
//		end if
//end choose
end event

event itemchanged;
//if pb_save.enabled=false or pb_save.visible=false  then return
//if f_displayonly(this,'isdy')='0' then  return
//i_itemchanged='success'
//if not this.accepttext()=1 then return
//if not this.getrow()>0 then return
//string l_cusno,l_annotate,l_cusno_temp,l_codes,l_names
//string l_rmark,l_colthno,l_color
//decimal{2} l_price,l_money
//decimal{0} l_nb
//long l_row,l_len,l_count
//i_row=this.getrow()
//i_columnname=this.getcolumnname()
//
//choose case i_columnname
//	case 'codes' 
//		//检测
//		l_cusno=trim(this.getitemstring(this.getrow(),'codes'))
//		if not (isnull(l_cusno) or len(l_cusno)=0) then
//		setnull(l_cusno_temp)
//		select names into :l_cusno_temp from products where codes=:l_cusno;
//			if isnull(l_cusno_temp) then
//				beep(9)
//				f_messagebox('','货号不存在,请修改货号!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//			else
//				this.setitem(this.getrow(),'names',l_cusno_temp)
//				i_itemchanged='success'
//			end if
//		end if
//	case 'gg'
//	
//		l_colthno=this.getitemstring(this.getrow(),'codes')
//		l_color=this.getitemstring(this.getrow(),'gg')
//		if not (isnull(l_color) or len(l_color)=0) then
//		setnull(l_price)
//		select price,count(*) into :l_price,:l_count from products
//			where codes=:l_colthno and gg=:l_color;
//		if l_count=0 then
//				beep(9)
//				f_messagebox('','货号/规格不存在,请修改货号/规格!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//		else
//				this.setitem(this.getrow(),'price',l_price)
//				i_itemchanged='success'
//		end if
//	end if
//case 'nb','price'
//	l_money=this.getitemdecimal(this.getrow(),'money')
//	if isnull(l_money) or l_money=0 then
//		this.setitem(this.getrow(),'money',&
//			this.getitemdecimal(this.getrow(),'nb')* &
//				this.getitemdecimal(this.getrow(),'price'))
//	end if
//case else
//	
//end choose
//i_itemchanged='success'
end event

event itemerror;//出错,恢复原值
boolean l_true
string l_outdate,l_message
setnull(l_message)
l_message=this.describe(this.getcolumnname()+'.validationmsg')
//itemchanged 出错
if i_itemchanged='failure' then
	return 1
else
	i_itemchanged='failure'
	i_row=this.getrow()
	i_columnname=this.getcolumnname()
end if
//
choose case this.getcolumnname()
	case  'dates' 

end choose
if isnull(l_message) or l_message='?' then
	l_message='没有通过合法检查!请重新修改数据!否则无法离开焦点!'
end if
f_sound('','beep')
f_messagebox('对不起',l_message,0,0)
this.setfocus()
return 1
end event

event itemfocuschanged;//////初值处理
//if f_displayonly(this,'isdy')='0' then  return
//if not this.getrow()>0 then return
//if not this.accepttext()=1 then return 
//
//if i_itemchanged='failure' then
//	if not ( isnull(i_columnname) or i_columnname='') then
//		//规格出错可修改货号
//		if not (i_columnname='gg' and this.getcolumnname()='codes') then
//			this.setcolumn(i_columnname)
//		end if
//		////
//		f_setcolumn(this,f_updatetable(this),i_columnname)  //一般
//		this.scrolltorow(i_row)
//	end if
//	this.setfocus()
//	if i_itemfocus='failure' then	return
//end if
//
//
////////
///////初值处理
////choose case this.getcolumnname()
////	case 'dates' 
////		setnull(l_outdate)
////		l_outdate=this.getitemstring(this.getrow(),'dates')
////		if isnull(l_outdate) or trim(l_outdate)='' then
////			this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
////		end if
////		if i_itemfocus='success' then this.triggerevent(itemchanged!)
////end choose
end event

event losefocus;g_enter=1
end event

event rbuttondown;this.triggerevent(doubleclicked!)
return 1
end event

type dw_25 from datawindow within w_couple_parent_sheet_derek
event type long ue_words ( )
event enterastab pbm_dwnprocessenter
event keydown pbm_dwnkey
boolean visible = false
integer x = 379
integer y = 508
integer width = 315
integer height = 112
integer taborder = 290
boolean enabled = false
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event ue_words;if not this.getrow()>0 then return 0
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return 0
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
	commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
return 0
end event

event enterastab;

if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
if this.rowcount()>0 then
	//this.triggerevent(itemchanged!)
	if i_itemchanged='failure' then return	1
	if f_enter(this)=1 then 
		pb_add.triggerevent(clicked!)
	end if
end if
return 1
end event

event keydown;if keydown(keyescape!) and pb_cancel.enabled and pb_cancel.visible then 
	i_esc=1
	pb_cancel.triggerevent(clicked!)
	return 1
end if
if keydown(keyf1!) and pb_add.enabled and pb_add.visible then 
	pb_add.triggerevent(clicked!)
	return 1
end if
if keydown(keyf2!) and pb_save.enabled and pb_save.visible then 
	pb_save.triggerevent(clicked!)
	return 1
end if
if keydown(keyf4!) and pb_modify.enabled and pb_modify.visible then 
	pb_modify.triggerevent(clicked!)
	return 1
end if
if (keydown(keyf7!)) and pb_delete.enabled and pb_delete.visible  then
	pb_delete.triggerevent(clicked!)
	return 1
end if 
if keydown(keyf9!) then 
	dw_2.triggerevent(rbuttondown!)
	return 1
end if
//if  keydown(keyf12!) then
//	this.post event ue_words()
//	return 1
//end if

end event

event clicked;if not this.getrow()>0 then return 1
string l_tt
if (f_edit_styles(dw_1,this.getcolumnname())<>'edit') and (f_edit_styles(dw_1,this.getcolumnname())<>'editmask') then return
if dw_1.rowcount()>0 then
	i_trigger_itemchanged=true
//	this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	0
end if


end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
f_setcolumn(this,f_updatetable(this),i_columnname)
return  l_temp
end event

event doubleclicked;//if not this.getrow()>0 then return
//if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
//if pb_save.enabled=false or pb_save.visible=false  then return
//dw_input4  dw_input5 dw_input6 
//choose case  this.getcolumnname()
//	case 'colthno' 
//		if dw_input5.rowcount()=0 then 
//			dw_input5.retrieve()
//			f_displayonly(dw_input5,'displayonly')
//		if dw_input5.rowcount()>0 then
//			dw_input5.visible=true
//			dw_input5.setfocus()
//		else
//			f_messagebox('','无货号色号信息!',0,0)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//		if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if
//end choose
//return 1

end event

event editchanged;i_editchanged_column=this.getcolumnname()
i_editchanged_row=this.getrow()
if i_itemchanged='failure' then
	f_dw_prochange(this)
	i_itemchanged='success'
end if

//choose case this.getcolumnname()
//	case 'yg_no'
//		if len(trim(this.gettext()))=personcode_len then
//			this.trigger event enterastab()
//		end if
//	case 'yz_cod'
//		if len(trim(this.gettext()))=g_ziplen then
//			this.trigger event enterastab()
//		end if
//	case 'ghno'
//		if len(trim(this.gettext()))=g_ghlen then
//			this.trigger event enterastab()
//		end if
//	case 'yg_id'
//		if len(trim(this.gettext()))=g_idlen then
//			this.trigger event enterastab()
//		end if
//end choose
end event

event itemchanged;
//if pb_save.enabled=false or pb_save.visible=false  then return
//if f_displayonly(this,'isdy')='0' then  return
//i_itemchanged='success'
//if not this.accepttext()=1 then return
//if not this.getrow()>0 then return
//string l_cusno,l_annotate,l_cusno_temp,l_codes,l_names
//string l_rmark,l_colthno,l_color
//decimal{2} l_price,l_money
//decimal{0} l_nb
//long l_row,l_len,l_count
//i_row=this.getrow()
//i_columnname=this.getcolumnname()
//
//choose case i_columnname
//	case 'codes' 
//		//检测
//		l_cusno=trim(this.getitemstring(this.getrow(),'codes'))
//		if not (isnull(l_cusno) or len(l_cusno)=0) then
//		setnull(l_cusno_temp)
//		select names into :l_cusno_temp from products where codes=:l_cusno;
//			if isnull(l_cusno_temp) then
//				beep(9)
//				f_messagebox('','货号不存在,请修改货号!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//			else
//				this.setitem(this.getrow(),'names',l_cusno_temp)
//				i_itemchanged='success'
//			end if
//		end if
//	case 'gg'
//	
//		l_colthno=this.getitemstring(this.getrow(),'codes')
//		l_color=this.getitemstring(this.getrow(),'gg')
//		if not (isnull(l_color) or len(l_color)=0) then
//		setnull(l_price)
//		select price,count(*) into :l_price,:l_count from products
//			where codes=:l_colthno and gg=:l_color;
//		if l_count=0 then
//				beep(9)
//				f_messagebox('','货号/规格不存在,请修改货号/规格!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//		else
//				this.setitem(this.getrow(),'price',l_price)
//				i_itemchanged='success'
//		end if
//	end if
//case 'nb','price'
//	l_money=this.getitemdecimal(this.getrow(),'money')
//	if isnull(l_money) or l_money=0 then
//		this.setitem(this.getrow(),'money',&
//			this.getitemdecimal(this.getrow(),'nb')* &
//				this.getitemdecimal(this.getrow(),'price'))
//	end if
//case else
//	
//end choose
//i_itemchanged='success'
end event

event itemerror;//出错,恢复原值
boolean l_true
string l_outdate,l_message
setnull(l_message)
l_message=this.describe(this.getcolumnname()+'.validationmsg')
//itemchanged 出错
if i_itemchanged='failure' then
	return 1
else
	i_itemchanged='failure'
	i_row=this.getrow()
	i_columnname=this.getcolumnname()
end if
//
choose case this.getcolumnname()
	case  'dates' 

end choose
if isnull(l_message) or l_message='?' then
	l_message='没有通过合法检查!请重新修改数据!否则无法离开焦点!'
end if
f_sound('','beep')
f_messagebox('对不起',l_message,0,0)
this.setfocus()
return 1
end event

event itemfocuschanged;//////初值处理
//if f_displayonly(this,'isdy')='0' then  return
//if not this.getrow()>0 then return
//if not this.accepttext()=1 then return 
//
//if i_itemchanged='failure' then
//	if not ( isnull(i_columnname) or i_columnname='') then
//		//规格出错可修改货号
//		if not (i_columnname='gg' and this.getcolumnname()='codes') then
//			this.setcolumn(i_columnname)
//		end if
//		////
//		f_setcolumn(this,f_updatetable(this),i_columnname)  //一般
//		this.scrolltorow(i_row)
//	end if
//	this.setfocus()
//	if i_itemfocus='failure' then	return
//end if
//
//
////////
///////初值处理
////choose case this.getcolumnname()
////	case 'dates' 
////		setnull(l_outdate)
////		l_outdate=this.getitemstring(this.getrow(),'dates')
////		if isnull(l_outdate) or trim(l_outdate)='' then
////			this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
////		end if
////		if i_itemfocus='success' then this.triggerevent(itemchanged!)
////end choose
end event

event losefocus;g_enter=1
end event

event rbuttondown;this.triggerevent(doubleclicked!)
return 1
end event

type dw_24 from datawindow within w_couple_parent_sheet_derek
event type long ue_words ( )
event enterastab pbm_dwnprocessenter
event keydown pbm_dwnkey
boolean visible = false
integer x = 41
integer y = 512
integer width = 315
integer height = 112
integer taborder = 310
boolean enabled = false
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event ue_words;if not this.getrow()>0 then return 0
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return 0
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
	commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
return 0
end event

event enterastab;

if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
if this.rowcount()>0 then
	//this.triggerevent(itemchanged!)
	if i_itemchanged='failure' then return	1
	if f_enter(this)=1 then 
		pb_add.triggerevent(clicked!)
	end if
end if
return 1
end event

event keydown;if keydown(keyescape!) and pb_cancel.enabled and pb_cancel.visible then 
	i_esc=1
	pb_cancel.triggerevent(clicked!)
	return 1
end if
if keydown(keyf1!) and pb_add.enabled and pb_add.visible then 
	pb_add.triggerevent(clicked!)
	return 1
end if
if keydown(keyf2!) and pb_save.enabled and pb_save.visible then 
	pb_save.triggerevent(clicked!)
	return 1
end if
if keydown(keyf4!) and pb_modify.enabled and pb_modify.visible then 
	pb_modify.triggerevent(clicked!)
	return 1
end if
if (keydown(keyf7!)) and pb_delete.enabled and pb_delete.visible  then
	pb_delete.triggerevent(clicked!)
	return 1
end if 
if keydown(keyf9!) then 
	dw_2.triggerevent(rbuttondown!)
	return 1
end if
//if  keydown(keyf12!) then
//	this.post event ue_words()
//	return 1
//end if

end event

event clicked;if not this.getrow()>0 then return 1
string l_tt
if (f_edit_styles(dw_1,this.getcolumnname())<>'edit') and (f_edit_styles(dw_1,this.getcolumnname())<>'editmask') then return
if dw_1.rowcount()>0 then
	i_trigger_itemchanged=true
//	this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	0
end if


end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
f_setcolumn(this,f_updatetable(this),i_columnname)
return  l_temp
end event

event doubleclicked;//if not this.getrow()>0 then return
//if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
//if pb_save.enabled=false or pb_save.visible=false  then return
//dw_input4  dw_input5 dw_input6 
//choose case  this.getcolumnname()
//	case 'colthno' 
//		if dw_input5.rowcount()=0 then 
//			dw_input5.retrieve()
//			f_displayonly(dw_input5,'displayonly')
//		if dw_input5.rowcount()>0 then
//			dw_input5.visible=true
//			dw_input5.setfocus()
//		else
//			f_messagebox('','无货号色号信息!',0,0)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//		if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if
//end choose
//return 1

end event

event editchanged;i_editchanged_column=this.getcolumnname()
i_editchanged_row=this.getrow()
if i_itemchanged='failure' then
	f_dw_prochange(this)
	i_itemchanged='success'
end if

//choose case this.getcolumnname()
//	case 'yg_no'
//		if len(trim(this.gettext()))=personcode_len then
//			this.trigger event enterastab()
//		end if
//	case 'yz_cod'
//		if len(trim(this.gettext()))=g_ziplen then
//			this.trigger event enterastab()
//		end if
//	case 'ghno'
//		if len(trim(this.gettext()))=g_ghlen then
//			this.trigger event enterastab()
//		end if
//	case 'yg_id'
//		if len(trim(this.gettext()))=g_idlen then
//			this.trigger event enterastab()
//		end if
//end choose
end event

event itemchanged;
//if pb_save.enabled=false or pb_save.visible=false  then return
//if f_displayonly(this,'isdy')='0' then  return
//i_itemchanged='success'
//if not this.accepttext()=1 then return
//if not this.getrow()>0 then return
//string l_cusno,l_annotate,l_cusno_temp,l_codes,l_names
//string l_rmark,l_colthno,l_color
//decimal{2} l_price,l_money
//decimal{0} l_nb
//long l_row,l_len,l_count
//i_row=this.getrow()
//i_columnname=this.getcolumnname()
//
//choose case i_columnname
//	case 'codes' 
//		//检测
//		l_cusno=trim(this.getitemstring(this.getrow(),'codes'))
//		if not (isnull(l_cusno) or len(l_cusno)=0) then
//		setnull(l_cusno_temp)
//		select names into :l_cusno_temp from products where codes=:l_cusno;
//			if isnull(l_cusno_temp) then
//				beep(9)
//				f_messagebox('','货号不存在,请修改货号!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//			else
//				this.setitem(this.getrow(),'names',l_cusno_temp)
//				i_itemchanged='success'
//			end if
//		end if
//	case 'gg'
//	
//		l_colthno=this.getitemstring(this.getrow(),'codes')
//		l_color=this.getitemstring(this.getrow(),'gg')
//		if not (isnull(l_color) or len(l_color)=0) then
//		setnull(l_price)
//		select price,count(*) into :l_price,:l_count from products
//			where codes=:l_colthno and gg=:l_color;
//		if l_count=0 then
//				beep(9)
//				f_messagebox('','货号/规格不存在,请修改货号/规格!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//		else
//				this.setitem(this.getrow(),'price',l_price)
//				i_itemchanged='success'
//		end if
//	end if
//case 'nb','price'
//	l_money=this.getitemdecimal(this.getrow(),'money')
//	if isnull(l_money) or l_money=0 then
//		this.setitem(this.getrow(),'money',&
//			this.getitemdecimal(this.getrow(),'nb')* &
//				this.getitemdecimal(this.getrow(),'price'))
//	end if
//case else
//	
//end choose
//i_itemchanged='success'
end event

event itemerror;//出错,恢复原值
boolean l_true
string l_outdate,l_message
setnull(l_message)
l_message=this.describe(this.getcolumnname()+'.validationmsg')
//itemchanged 出错
if i_itemchanged='failure' then
	return 1
else
	i_itemchanged='failure'
	i_row=this.getrow()
	i_columnname=this.getcolumnname()
end if
//
choose case this.getcolumnname()
	case  'dates' 

end choose
if isnull(l_message) or l_message='?' then
	l_message='没有通过合法检查!请重新修改数据!否则无法离开焦点!'
end if
f_sound('','beep')
f_messagebox('对不起',l_message,0,0)
this.setfocus()
return 1
end event

event itemfocuschanged;//////初值处理
//if f_displayonly(this,'isdy')='0' then  return
//if not this.getrow()>0 then return
//if not this.accepttext()=1 then return 
//
//if i_itemchanged='failure' then
//	if not ( isnull(i_columnname) or i_columnname='') then
//		//规格出错可修改货号
//		if not (i_columnname='gg' and this.getcolumnname()='codes') then
//			this.setcolumn(i_columnname)
//		end if
//		////
//		f_setcolumn(this,f_updatetable(this),i_columnname)  //一般
//		this.scrolltorow(i_row)
//	end if
//	this.setfocus()
//	if i_itemfocus='failure' then	return
//end if
//
//
////////
///////初值处理
////choose case this.getcolumnname()
////	case 'dates' 
////		setnull(l_outdate)
////		l_outdate=this.getitemstring(this.getrow(),'dates')
////		if isnull(l_outdate) or trim(l_outdate)='' then
////			this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
////		end if
////		if i_itemfocus='success' then this.triggerevent(itemchanged!)
////end choose
end event

event losefocus;g_enter=1
end event

event rbuttondown;this.triggerevent(doubleclicked!)
return 1
end event

type dw_input60 from datawindow within w_couple_parent_sheet_derek
event key pbm_dwnkey
boolean visible = false
integer x = 1010
integer y = 180
integer width = 1184
integer height = 80
integer taborder = 60
string title = "临时专用全选功能"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event key;
long l_i

if i_shiftrow=0 then i_shiftrow=this.getrow()

i_nowkey=''
i_rowcopy=0
if keydown(keyshift!) then	
	i_rowcopy=1
	i_nowkey='shift'
end if

if keydown(keycontrol!) then	
	i_rowcopy=1
	i_nowkey='control'
end if

if i_prikey='control' then
	if keydown(keyA!) or keydown(keya!) then 
		l_i=1
		do while l_i<=this.rowcount()
			this.selectrow(l_i,true)
			l_i=l_i + 1
		loop
		i_prikey=''
	else
		i_prikey=i_nowkey
	end if
else
	i_prikey=i_nowkey
end if

return wf_inputkey(this)



end event

event clicked;

long i,l_endrow
if i_rowcopy=1 then
	l_endrow=row
	this.triggerevent("key")
	if i_nowkey ='shift' and i_shiftrow<>0 then
		if i_prikey<>'control'	then 
			f_dw_select(this,1,this.rowcount(),false)
		end if
		
		if i_shiftrow<l_endrow then
			for i=i_shiftrow to l_endrow
				this.selectrow(i,true)
			next
		else
			for i=l_endrow to i_shiftrow
				this.selectrow(i,true)
			next
		end if
		i_prikey='shift'
	elseif i_nowkey='control' and i_shiftrow<>0 then
		this.selectrow(row,not this.isselected(row))
		i_shiftrow=row
		i_prikey='control'
	else
		if i_prikey='shift' or i_prikey='control' or (i_nowkey<>'control' and i_nowkey<>'shift') then
			f_dw_select(this,1,this.rowcount(),false)
			i_prikey=''
		end if

		if i_selectprirow<>row then 
			this.selectrow(i_selectprirow,false)
		end if
		
		if i_nowkey='control' then
			this.selectrow(row,not this.isselected(row))
		end if	
		i_selectprirow=row
			
		i_shiftrow=row
	end if

//	if this.IsSelected (row )=true then
//		this.selectrow(row,false)
//	else
//		this.selectrow(row,true)
//	end if
	return 0
else
	this.selectrow(0,false)
	i_shiftrow=row
end if
end event

event doubleclicked;//if this.getrow()>0 then
//	dw_2.setitem(dw_2.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	i_editchanged_column=dw_2.getcolumnname()
//	i_editchanged_row=dw_2.getrow()
//	dw_2.setfocus()
//	dw_2.triggerevent(editchanged!)
// dw_2.triggerevent(itemchanged!)

////连环套触发
////	if i_itemchanged='success' then
////		dw_2.setcolumn('color')
////		dw_2.triggerevent(rbuttondown!)
////	end if
//end if
end event

event itemerror;


//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

event losefocus;//this.visible=false
//if not isvalid(w_calendar) then dw_2.setfocus()
//g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

type cb_send from picturebutton within w_couple_parent_sheet_derek
integer x = 2345
integer y = 2020
integer width = 219
integer height = 112
integer taborder = 370
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "发送"
vtextalign vtextalign = vcenter!
end type

event clicked;
//
//string l_nos,l_chflags,l_names
//long l_flags,l_return
//u_rjh_aee_interface l_aee
//u_rjh_nike_interface lu_rjh_nike_interface
//if dw_1.getrow()=0 then return
//l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
////
//if cb_add.enabled=false then 
//	f_messagebox('',f_wgz_language('请先保存单据'),0,0)
//	return
//end if
//
//l_names=dw_1.getitemstring(dw_1.getrow(),'names')
//if pos(l_names,'工厂店')>0 then
//	lu_rjh_nike_interface=create u_rjh_nike_interface
//	l_return=lu_rjh_nike_interface.f_rjh_nike_buy(l_nos,'仓出店',0)
//	destroy lu_rjh_nike_interface
//	if l_return=-1 then
//		f_messagebox('','Nike工厂店失败'+'~r~n'+sqlca.sqlerrtext,0,0)
//	end if
//end if
//
//if g_dbstatuscount<=1 then return
//l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
//l_flags=dw_1.getitemnumber(dw_1.getrow(),'flags')
//if (l_flags=1 or l_flags=2) and g_dbstatus>4 then
//	f_messagebox('',f_wgz_language('单据已发送或接收'),0,0)
//	if g_level>i_superlevel then	return 
//end if
//
//l_chflags=dw_1.getitemstring(dw_1.getrow(),'chflags')
//if l_chflags='1' then
//	f_messagebox('',f_wl('单据已确认'),0,0)
//	return
//end if
//
//if i_priorbutton='pb_save' and g_dbstatus=3 then
////	i_priorbutton=''
////	f_zg_txinfo_nos('buy',l_nos,g_dbstatus)
////	commit;
//elseif f_messagebox('',f_wgz_language('是否发送?'),2,1)=1 then
//	if f_zg_txinfo_nos('buy',l_nos,g_dbstatus,'')=0 then
//		if pos(g_controls,'FWQ')>0 then
//			dw_1.setitem(dw_1.getrow(),'flags',3)
//			dw_1.update()
//		end if
//	end if
//	commit;
//end if
////dw_1.setitem(dw_1.getrow(),'flags',3)
////	dw_1.update()
//dw_1.triggerevent(retrieveend!)
////	commit;
end event

type cbx_dw2xj from checkbox within w_couple_parent_sheet_derek
boolean visible = false
integer x = 2016
integer y = 2168
integer width = 206
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "小计"
end type

type st_pos from statictext within w_couple_parent_sheet_derek
boolean visible = false
integer x = 1509
integer y = 2096
integer width = 128
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "定位"
boolean focusrectangle = false
end type

type sle_pos from singlelineedit within w_couple_parent_sheet_derek
event ue_enter ( )
boolean visible = false
integer x = 1513
integer y = 2168
integer width = 498
integer height = 104
integer taborder = 400
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_enter();
string l_colthno,l_words,l_find=''
string l_filter,l_wordsold
long l_row,l_count,l_tempcount

if dw_2.rowcount()=0 then return

l_colthno=this.text
if l_colthno='' then
	return
end if


/*提高性能 全匹配检查*/
l_find="colthno ='"+l_colthno+"'"
if dw_2.find(l_find,1,dw_2.rowcount())=0 then
	/*****/
	
	/*条码优先*/
	l_words=l_colthno
	/*条码查询*/
	setnull(l_colthno)
	select max(colthno) into :l_colthno from coloth_easy where words=:l_words;
	if isnull(l_colthno) then
		select max(colthno) into :l_colthno from coloth_b where words=:l_words;
	end if
	
	if isnull(l_colthno) then
		l_colthno=l_words
	else
		this.text=l_colthno
	end if
	/******/
end if

l_find='colthno like "%'+l_colthno+'%"'
if l_find<>'' then
	l_row=dw_2.find(l_find,dw_2.getrow()+1,dw_2.rowcount())

	if l_row=0 or dw_2.getrow()=dw_2.rowcount() then
		l_row=dw_2.find(l_find,1,dw_2.rowcount())
	end if
	
	if l_row>0 then
		dw_2.scrolltorow(l_row)
		this.setfocus()
	else
		f_messagebox('',f_wl('无匹配产品'),0,0)
		this.setfocus()
	end if
end if
if f_displayonly(dw_1,'isdy')='0' then
	dw_2.setfocus()
end if

end event

event getfocus;
i_priorbutton='sle_pos'
end event

event losefocus;
i_priorbutton=''
end event

type cbx_multicolor from checkbox within w_couple_parent_sheet_derek
boolean visible = false
integer x = 1806
integer y = 2084
integer width = 210
integer height = 96
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "多色"
end type

type dw_view from datawindow within w_couple_parent_sheet_derek
event ue_init ( long l_flags )
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1673
integer y = 180
integer width = 1595
integer height = 300
integer taborder = 110
string dataobject = "d_wgz_view"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_init(long l_flags);

/*按钮初始化 多语言未处理*/
long l_i=0,ld_y[],l_x,l_y,l_okcount=0
string l_field

if l_flags=0 then
	/*不可见*/
	st_button.visible=false

	if id_spbcount>0 then
		for l_i=1 to id_spbcount
			spb_button[l_i].y=spb_button[l_i].y + 9000
		next
	end if
	
	if id_slbcount>0 then
		for l_i=1 to id_slbcount
			slb[l_i].y=slb[l_i].y + 9000
		next
	end if
	
	if id_scbcount>0 then
		for l_i=1 to id_scbcount
			scb[l_i].y=scb[l_i].y + 9000
		next
	end if

	if id_slecount>0 then
		for l_i=1 to id_slecount
			sle[l_i].y=sle[l_i].y + 9000
		next
	end if

	if id_stcount>0 then
		for l_i=1 to id_stcount
			st[l_i].y=st[l_i].y + 9000
		next
	end if
	
	if id_maskcount>0 then
		for l_i=1 to id_maskcount
			smask[l_i].y=smask[l_i].y + 9000
		next
	end if
	return
end if


if this.rowcount()=0 then
	this.insertrow(0)
end if

if id_spbcount>0 or id_scbcount>0 or id_slbcount>0 or id_slecount>0 or id_stcount>0 then
	dw_view.visible=true
	dw_button.setfocus()
	dw_button2.visible=false
end if

l_okcount=0
if id_spbcount>0 and id_spbcount<3000 then
	for l_i=1 to id_spbcount
		spb_button[l_i].y=spb_button[l_i].y - 9000
		spb_button[l_i].bringtotop=true
		if spb_button[l_i].visible=true then
			l_okcount++
			id_view[l_okcount]=spb_button[l_i]
			id_view_yx[l_okcount]=spb_button[l_i].y*10000+spb_button[l_i].x
			id_xh[l_okcount]=l_okcount
		end if
	next
end if

if id_slbcount>0 and id_slbcount<3000 then
	for l_i=1 to id_slbcount
		slb[l_i].y=slb[l_i].y - 9000
		slb[l_i].bringtotop=true
		if slb[l_i].visible=true then
			l_okcount++
			id_view[l_okcount]=slb[l_i]
			id_view_yx[l_okcount]=slb[l_i].y*10000+slb[l_i].x
			id_xh[l_okcount]=l_okcount
		end if
	next
end if

if id_scbcount>0 and id_scbcount<3000 then
	for l_i=1 to id_scbcount
		scb[l_i].y=scb[l_i].y - 9000
		scb[l_i].bringtotop=true
		if scb[l_i].visible=true then
			l_okcount++
			id_view[l_okcount]=scb[l_i]
			id_view_yx[l_okcount]=scb[l_i].y*10000+scb[l_i].x
			id_xh[l_okcount]=l_okcount
		end if
	next
end if

if id_slecount>0 and id_slecount<3000 then
	for l_i=1 to id_slecount
		sle[l_i].y=sle[l_i].y - 9000
		sle[l_i].bringtotop=true
		if sle[l_i].visible=true then
			l_okcount++
			id_view[l_okcount]=sle[l_i]
			id_view_yx[l_okcount]=sle[l_i].y*10000+sle[l_i].x
			id_xh[l_okcount]=l_okcount
		end if
	next
end if


	
if id_maskcount>0 and id_maskcount<3000 then
	for l_i=1 to id_maskcount
		smask[l_i].y=smask[l_i].y - 9000
		smask[l_i].bringtotop=true
		if smask[l_i].visible=true then
			l_okcount++
			id_view[l_okcount]=smask[l_i]
			id_view_yx[l_okcount]=smask[l_i].y*10000+smask[l_i].x
			id_xh[l_okcount]=l_okcount
		end if
	next
end if

if id_stcount>0 and id_stcount<3000 then
	for l_i=1 to id_stcount
		st[l_i].y=st[l_i].y - 9000
		st[l_i].bringtotop=true
		if st[l_i].visible=true then
			l_okcount++
			id_view[l_okcount]=st[l_i]
			id_view_yx[l_okcount]=st[l_i].y*10000+st[l_i].x
			id_xh[l_okcount]=l_okcount
		end if
	next
end if

id_viewcount=l_okcount
if l_okcount=0 then 
//	//id_spbcount>0 or id_scbcount>0 or id_slbcount>0 or id_slecount>0 or id_stcount>0 then
	dw_view.visible=false
//	dw_button2.visible=false
end if
id_yx=0
return 
end event

event ue_mousemove;
long l_i,l_button=0
string l_field
for l_i=id_buttoncount2 to 1 step -1
	l_field=pb_text2[l_i]
	if Left(this.GetObjectAtPointer(),2+Len(l_field)) = 't_'+l_field and l_button=0 then
			if this.describe('t_'+l_field+'.text')='' or  pb_button2[l_i].enabled=false then
				/*disable*/
			else
				this.modify('t_'+l_field+'.visible="0"')
				this.modify('b_'+l_field+'.visible="1"')
				this.modify('b_'+l_field+'.text="'+pb_button2[l_i].text+'"')
				
//				st_button.x=dw_button2.x+long(this.describe('b_'+l_field+'.x'))
//				if mod(long(right(l_field,1)),2)=1 then
//					st_button.y=dw_button2.y - st_button.height
//				else
//					st_button.y=dw_button2.y + dw_button2.height
//				end if
				st_button.x=dw_button2.x+dw_button2.width+5
				st_button.y=dw_button2.y + 76*(l_i - 1)
				
				l_button=1
				st_button.text=ispb_help2[l_i]
					
			end if
			exit
		elseif Left(this.GetObjectAtPointer(),2+Len(l_field)) = 'b_'+l_field then
			l_button=1
		else
			this.modify('t_'+l_field+'.visible="1"')
			this.modify('b_'+l_field+'.visible="0"')
		end if
	
next

if l_button=1 then
	st_button.visible=true
else
	st_button.visible=false
end if

st_button.width=35*Len(st_button.text)

end event

event clicked;//
//
//long l_i,l_exit=0
//string l_field
//
//for l_i=id_buttoncount2 to 1 step -1
//	l_field=id_button2[l_i]
//	if pb_text2[l_i]<>'' then l_field=pb_text2[l_i]
//	
//	//f_messagebox('',left(this.GetObjectAtPointer(),2+len(l_field)),0,0)
//	if left(this.GetObjectAtPointer(),2+len(l_field)) = 'b_'+l_field then
//		if (pb_text2[l_i]='' and this.describe('b_'+id_button2[l_i]+'.filename')='1.'+i_ext) or &
//				(pb_text2[l_i]<>'' and this.describe('t_'+l_field+'.text')='')  then
//			/*disable*/
//		
//		elseif (pb_button2[l_i].visible=true and pb_button2[l_i].enabled=true) then
//			pb_button2[l_i].triggerevent(clicked!)
//			//this.post event ue_init()
//			/*debug*/
//			exit
//		end if
//	end if
//next
//
//this.visible=false
//
//
end event

type pb_autorecovery from picturebutton within w_couple_parent_sheet_derek
integer x = 1490
integer y = 2024
integer width = 261
integer height = 108
integer taborder = 330
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "本地恢复"
boolean originalsize = true
alignment htextalign = left!
vtextalign vtextalign = vcenter!
end type

event clicked;

if pb_save.enabled=true and pb_save.visible=true then
else
	f_messagebox('',f_wl('必须在明细修改状态下才生效'),0,0)
	return
end if


if sqlca.sqlcode<>0 then
	f_messagebox('',f_wl('数据库连接有问题'),0,0)
	return
end if

	i_itemchanged='success'
	if not dw_2.accepttext()=1 then return
	//if dw_2.getrow()>0  then dw_2.triggerevent(itemchanged!)
	if i_itemchanged='failure' then
		dw_2.setfocus()
		return
	end if



wf_auto('recovery')
wf_deleteemp('','')

dw_2.setfocus()
end event

type pb_autosave from picturebutton within w_couple_parent_sheet_derek
integer x = 2066
integer y = 2024
integer width = 261
integer height = 116
integer taborder = 380
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "本地保存"
boolean originalsize = true
alignment htextalign = left!
vtextalign vtextalign = vcenter!
end type

event clicked;
if sqlca.sqlcode=0 then
	i_itemchanged='success'
	if not dw_2.accepttext()=1 then return
	//if dw_2.getrow()>0  then dw_2.triggerevent(itemchanged!)
	if i_itemchanged='failure' then
		dw_2.setfocus()
		return
	end if
end if

if this.tag='auto' then
	wf_auto('save')
else
	wf_auto('save1')
end if
end event

type dw_pos from datawindow within w_couple_parent_sheet_derek
event ue_init ( string l_field1,  string l_field2 )
boolean visible = false
integer x = 23
integer y = 444
integer width = 1271
integer height = 1196
integer taborder = 290
boolean titlebar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_init(string l_field1, string l_field2);
string l_dwsql,l_tps1,l_tps2
long l_i

if this.rowcount()=0 then
	l_dwsql="colthno,货号,varchar(20),20;colthname,名称,varchar(60),40;"
	f_wgz_dyndw(this,l_dwsql,'')
end if

if dw_2.rowcount()>0 then
	if f_field(dw_1,l_field1,'isvalid')=-1 then
		l_field1=''
	end if
	
	if f_field(dw_1,l_field2,'isvalid')=-1 then
		l_field2=''
	end if
	
	this.reset()
	for l_i=1 to dw_2.rowcount()
		if l_field1<>'' then
			l_tps1=dw_2.getitemstring(l_i,l_field1)
		end if
		
		if l_field2<>'' then
			l_tps2=dw_2.getitemstring(l_i,l_field2)
		end if
		
	next
end if




//f_wgz_dyndw(dw_1,l_dwsql,l_sql)
//	 Example:
//		l_dwsql="update=表名;colthno,货号,varchar(20),20;color,颜色,char(10),10;"
//		如果sql存在，可以省: 类型和宽度
//update=表名;表示需要具备保存功能
//		f_wgz_dyndw(dw_1,l_dwsql,"select distinct colthno=colthno,
//color=substring(color,"+string(g_color_s)+","+string(g_color_len)+") from cnfnodb where nos='"+i_nos+"'")
//
end event

type dw_button2 from datawindow within w_couple_parent_sheet_derek
event ue_init ( )
event ue_mousemove pbm_mousemove
event ue_keydown pbm_dwnkey
boolean visible = false
integer x = 1851
integer y = 80
integer width = 421
integer height = 1328
integer taborder = 20
string dataobject = "d_wgz_button2"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event ue_init();
/*按钮初始化 多语言未处理*/
long l_i=0,ld_y[],l_x,l_y
string l_field,l_text

if g_tbp=1 or id_buttoncount2=0 then
else
	return 
end if

if this.rowcount()=0 then
	this.insertrow(0)
end if
 f_menu_control_special(parent,g_menutext)
//
wf_initdisplay2(1)

if (cb_save.visible=true or pb_save.visible=true) and i_autosave<>0 and wf_out_deal()<>-1 then
//	pb_autosave.visible=true
//	pb_autorecovery.visible=true
	pb_autosave.y=9000
	pb_autorecovery.y=9000
	 f_menu_control_special(parent,g_menutext)
	 
	wf_binit('autosave',pb_autosave,'',30,2)
	wf_binit('autorecovery',pb_autorecovery,'',31,2)
end if

if (cb_save.visible=true or pb_save.visible=true) &
			and Pos(g_controls2,'NATH=1')>0 and f_field(dw_1,'nos','isvalid')=0 then
	pb_attach.visible=true
	pb_attach.y=9000
	wf_binit('attach',pb_attach,'',32,2)

end if

for l_i=1 to id_buttoncount2
	l_field=id_button2[l_i]
	if l_i=20 then
		l_i=l_i
	end if
	if pb_text2[l_i]<>'' then
		l_field=pb_text2[l_i]
	end if
	
	l_text=pb_button2[l_i].text
	
	
//	if isvalid(pb_button2[l_i]) then
//		pb_button2[l_i].taborder=0
//	end if
		
		
	if l_text='' then
		l_text=ispb_help2[l_i]
	end if
	
	if Left(l_text,1)='&' then
		l_text=trim(Mid(l_text,3,30))+'('+Left(l_text,2)+')'
	end if
				
	
	if pb_button2[l_i].visible=true and pb_button2[l_i].enabled=true then
		if pb_text2[l_i]='' then		
			if fileexists(id_button2[l_i]+'.'+i_ext) then
				this.modify('p_'+l_field+'.filename="'+id_button2[l_i]+'.'+i_ext+'"')			
			else
				this.modify('p_'+l_field+'.text="'+l_text+'"')			
			end if
		else
			this.modify('t_'+l_field+'.text="'+l_text+'"')					
			
		end if
		/*颜色变无效*/
		this.modify('t_'+l_field+'.color="'+'0'+'"')	
	else
		if pb_text2[l_i]='' then
			if fileexists(id_button2[l_i]+'1.'+i_ext) then
				this.modify('p_'+l_field+'.filename="'+id_button2[l_i]+'1.'+i_ext+'"')	
				this.modify('p_'+l_field+'.visible="1"')	
				this.modify('b_'+l_field+'.visible="0"')	
			else
				this.modify('p_'+l_field+'.text="'+''+'"')		
			end if
		else
			this.modify('t_'+l_field+'.text="'+l_text+'"')	
			/*颜色变无效*/
			this.modify('t_'+l_field+'.color="'+'134217729'+'"')	
			
			
			
		end if
	end if
	
next

if id_buttoncount2<16 then
	for l_i=id_buttoncount2+1 to 16
		this.modify('t_other'+string(l_i)+'.text="'+''+'"')		
		
	next
end if

dw_button2.height=80*id_buttoncount2

dw_button2.visible=true


return 
end event

event ue_mousemove;
if not(abs(xpos - i_px)>5 or  abs(ypos - i_py)>5) then return 1
i_px=xpos;i_py=ypos

wf_mousemove(this.GetObjectAtPointer(),'')
return 0
end event

event ue_keydown;
long l_i
string l_field
if dw_button2.visible=true then
	choose case true
	case keydown(keydownarrow!),keydown(keyuparrow!)
		l_i=wf_bactive('')
		
		if keydown(keydownarrow!) then
			if l_i=id_buttoncount2  + 1 then
				l_i=0
			end if
				do while l_i<id_buttoncount2
					l_i++
					if l_i=1 then
						l_field='t_other0'+string(l_i)
					else
						l_field='t_other'+string(l_i)
					end if

					wf_mousemove(l_field,'')
					if dw_button2.describe('b'+Mid(l_field,2,Len(l_field))+'.visible')='1' then
						exit
					end if
				loop
	
		else
			do while l_i>1
				l_i=l_i - 1
				if l_i=1 then
					l_field='t_other01'
				else
					l_field='t_other'+string(l_i)
				end if
				wf_mousemove(l_field,'')
				if dw_button2.describe('b'+Mid(l_field,2,Len(l_field))+'.visible')='1' then
					exit
				end if
			loop
		end if
	
		return 1
	case keydown(keyleftarrow!),keydown(keyrightarrow!)	
		dw_button.triggerevent("ue_keydown")
		return 1
	case else
end choose	
end if

return 1

end event

event clicked;

long l_i,l_exit=0
string l_field

for l_i=id_buttoncount2 to 1 step -1
	l_field=id_button2[l_i]
	if pb_text2[l_i]<>'' then l_field=pb_text2[l_i]

	if this.describe('b_'+l_field+'.visible')='1' then
		if (pb_text2[l_i]='' and this.describe('b_'+id_button2[l_i]+'.filename')='1.'+i_ext) or &
				(pb_text2[l_i]<>'' and this.describe('t_'+l_field+'.text')='')  then
			/*disable*/
		
		elseif (pb_button2[l_i].visible=true and pb_button2[l_i].enabled=true) then
			pb_button2[l_i].triggerevent(clicked!)
			//this.post event ue_init()
			/*debug*/
			exit
		end if
	end if
next

if isvalid(this) then this.visible=false


end event

event losefocus;
st_button.visible=false
end event

event other;
/*屏蔽mouse滚轮*/
if wparam=4287102976 or wparam=7864320 or message.number=522 then
	return 1
end if

end event

type st_button from statictext within w_couple_parent_sheet_derek
boolean visible = false
integer x = 2363
integer y = 100
integer width = 448
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean border = true
boolean focusrectangle = false
end type

type pb_rowcopy from picturebutton within w_couple_parent_sheet_derek
event type long ue_copy ( long l_oldrow,  long l_newrow )
integer x = 1778
integer y = 2024
integer width = 261
integer height = 108
integer taborder = 490
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "行复制"
boolean originalsize = true
alignment htextalign = left!
end type

event type long ue_copy(long l_oldrow, long l_newrow);
long l_j
string ls_field
for l_j=1 to 40
	w_wait.st_wait.text='Now Deal:'+string(l_newrow)+' '+string(l_j)
	if f_field(dw_2,'price'+string(l_j),'valid')=0 then
		dw_2.setitem(l_newrow,'price'+string(l_j),dw_2.getitemnumber(l_oldrow,'price'+string(l_j)))
	end if
					
next

ls_field='nb3'
	if f_field(dw_2,ls_field,'valid')=0 then
		dw_2.setitem(l_newrow,ls_field,dw_2.getitemnumber(l_oldrow,ls_field))
	end if

	ls_field='bz9'
	if f_field(dw_2,ls_field,'valid')=0 then
		dw_2.setitem(l_newrow,ls_field,dw_2.getitemstring(l_oldrow,ls_field))
	end if
				
return 0
end event

event clicked;


if dw_2.rowcount()=0 then return
if pb_save.enabled=false or pb_save.visible=false then
	f_messagebox('',f_wl('请点击明细修改'),0,0)
	return
end if

long l_row,l_i,l_currentrow=0,l_j
/*先选中需要复制行，后复制*/
if i_rowcopy=0 then
	f_messagebox('',f_wl('请点中复制范围!'),0,0)
	i_rowcopy=1
else
	l_currentrow=dw_2.getrow()
	if f_messagebox('',f_wl('是否将最后点中行')+string(l_currentrow)+f_wl('复制?'),2,2)=1 then
		open(w_wait)
		dw_2.setredraw(false)
		for l_i=1 to dw_2.rowcount()
			if l_i<>l_currentrow and dw_2.IsSelected(l_i)=true then
				this.trigger event ue_copy(l_currentrow,l_i)
				
			end if
			dw_2.selectrow(l_i,false)
		next
		close(w_wait)
		dw_2.setredraw(true)
		i_rowcopy=0
	else
		if f_messagebox('',f_wl('是否取消全部选中的行'),2,2)=1 then
			for l_i=1 to dw_2.rowcount()
				if dw_2.IsSelected(l_i)=true then
					dw_2.selectrow(l_i,false)
				end if
			
			next
			i_rowcopy=0
		end if
	end if
end if
end event

type dw_input50 from datawindow within w_couple_parent_sheet_derek
event key pbm_dwnkey
boolean visible = false
integer x = 873
integer y = 180
integer width = 1184
integer height = 80
integer taborder = 50
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event key;

return wf_inputkey(this)
end event

event doubleclicked;//if this.getrow()>0 then
//	dw_2.setitem(dw_2.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	i_editchanged_column=dw_2.getcolumnname()
//	i_editchanged_row=dw_2.getrow()
//	dw_2.setfocus()
//	dw_2.triggerevent(editchanged!)
// dw_2.triggerevent(itemchanged!)

////连环套触发
////	if i_itemchanged='success' then
////		dw_2.setcolumn('color')
////		dw_2.triggerevent(rbuttondown!)
////	end if
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_2.setfocus()
g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

event itemerror;


//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type dw_input40 from datawindow within w_couple_parent_sheet_derek
event key pbm_dwnkey
boolean visible = false
integer x = 558
integer y = 180
integer width = 1179
integer height = 80
integer taborder = 60
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event key;
return wf_inputkey(this)
end event

event doubleclicked;//if this.getrow()>0 then
//	dw_2.setitem(dw_2.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	i_editchanged_column=dw_2.getcolumnname()
//	i_editchanged_row=dw_2.getrow()
//	dw_2.setfocus()
//	dw_2.triggerevent(editchanged!)
//	dw_2.triggerevent(itemchanged!)
////连环套触发
////	if i_itemchanged='success' then
////		dw_2.setcolumn('color')
////		dw_2.triggerevent(rbuttondown!)
////	end if
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_2.setfocus()
g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type dw_input20 from datawindow within w_couple_parent_sheet_derek
event key pbm_dwnkey
boolean visible = false
integer x = 293
integer y = 184
integer width = 1179
integer height = 76
integer taborder = 160
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event key;
return wf_inputkey(this)
end event

event doubleclicked;//if this.getrow()>0 then
//	dw_1.setitem(dw_1.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	dw_1.setfocus()
//	dw_1.triggerevent(editchanged!)
//	dw_1.triggerevent(itemchanged!)
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_1.setfocus()
g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type dw_input10 from datawindow within w_couple_parent_sheet_derek
event key pbm_dwnkey
boolean visible = false
integer x = 119
integer y = 184
integer width = 1179
integer height = 80
integer taborder = 170
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event key;
return wf_inputkey(this)
end event

event doubleclicked;//if this.getrow()>0 then
//	dw_1.setitem(dw_1.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	dw_1.setfocus()
//	dw_1.triggerevent(editchanged!)
//	dw_1.triggerevent(itemchanged!)
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_1.setfocus()
g_enter=0
end event

event rbuttondown;//this.triggerevent(doubleclicked!)
return wf_rbdown(this)

end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type cb_check from picturebutton within w_couple_parent_sheet_derek
integer x = 1833
integer y = 40
integer width = 270
integer height = 184
integer taborder = 360
integer textsize = -11
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "确认作废"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;

//if dw_1.getrow()=0 then return
//
//s_parm l_parm
//string ls_return,l_nos
//if cb_save.enabled=true or pb_cancel.visible=true then
//	f_messagebox('',f_wl('请在正常状态下确认'),0,0)
//	return
//end if
//l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
//l_parm.stringparm=dw_1.getitemstring(dw_1.getrow(),'nos')
//
//l_parm.stringparm1='rt'
//
//openwithparm(w_nos_check_select,l_parm)
//ls_return=message.stringparm
//

//if ls_return='' then return
//
//if ls_return='recycle' then
//	open(w_wait)
//	if f_aah2ort(l_nos,-1,0)=-1 then
//		rollback;
//		close(w_wait)
//		return
//	end if
//	
//	//反过帐
//	close(w_wait)
//	
//end if
//
//if ls_return='unrecycle' then
//	open(w_wait)
//	if f_aah2ort(l_nos,1,0)=-1 then
//		rollback;
//		close(w_wait)
//		return
//	end if
//		
//	//反过帐
//	close(w_wait)
//end if
//
//dw_1.retrieve(l_parm.stringparm)
//dw_1.triggerevent(rowfocuschanged!)
//commit;
//
end event

type pb_help from picturebutton within w_couple_parent_sheet_derek
integer x = 896
integer y = 2016
integer width = 242
integer height = 120
integer taborder = 450
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "帮助"
boolean originalsize = true
alignment htextalign = left!
end type

type dw_23 from datawindow within w_couple_parent_sheet_derek
event clicked pbm_dwnlbuttonclk
event dberror pbm_dwndberror
event doubleclicked pbm_dwnlbuttondblclk
event editchanged pbm_dwnchanging
event itemchanged pbm_dwnitemchange
event itemerror pbm_dwnitemvalidationerror
event itemfocuschanged pbm_dwnitemchangefocus
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event type long ue_words ( )
event enterastab pbm_dwnprocessenter
event keydown pbm_dwnkey
boolean visible = false
integer x = 41
integer y = 628
integer width = 315
integer height = 112
integer taborder = 300
boolean enabled = false
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;if not this.getrow()>0 then return 1
string l_tt
if (f_edit_styles(dw_1,this.getcolumnname())<>'edit') and (f_edit_styles(dw_1,this.getcolumnname())<>'editmask') then return
if dw_1.rowcount()>0 then
	i_trigger_itemchanged=true
	//this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	0
end if


end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
f_setcolumn(this,f_updatetable(this),i_columnname)
return  l_temp
end event

event doubleclicked;//if not this.getrow()>0 then return
//if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
//if pb_save.enabled=false or pb_save.visible=false  then return
//dw_input4  dw_input5 dw_input6 
//choose case  this.getcolumnname()
//	case 'colthno' 
//		if dw_input5.rowcount()=0 then 
//			dw_input5.retrieve()
//			f_displayonly(dw_input5,'displayonly')
//		if dw_input5.rowcount()>0 then
//			dw_input5.visible=true
//			dw_input5.setfocus()
//		else
//			f_messagebox('','无货号色号信息!',0,0)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//		if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if
//end choose
//return 1

end event

event editchanged;i_editchanged_column=this.getcolumnname()
i_editchanged_row=this.getrow()
if i_itemchanged='failure' then
	f_dw_prochange(this)
	i_itemchanged='success'
end if

//choose case this.getcolumnname()
//	case 'yg_no'
//		if len(trim(this.gettext()))=personcode_len then
//			this.trigger event enterastab()
//		end if
//	case 'yz_cod'
//		if len(trim(this.gettext()))=g_ziplen then
//			this.trigger event enterastab()
//		end if
//	case 'ghno'
//		if len(trim(this.gettext()))=g_ghlen then
//			this.trigger event enterastab()
//		end if
//	case 'yg_id'
//		if len(trim(this.gettext()))=g_idlen then
//			this.trigger event enterastab()
//		end if
//end choose
end event

event itemchanged;
//if pb_save.enabled=false or pb_save.visible=false  then return
//if f_displayonly(this,'isdy')='0' then  return
//i_itemchanged='success'
//if not this.accepttext()=1 then return
//if not this.getrow()>0 then return
//string l_cusno,l_annotate,l_cusno_temp,l_codes,l_names
//string l_rmark,l_colthno,l_color
//decimal{2} l_price,l_money
//decimal{0} l_nb
//long l_row,l_len,l_count
//i_row=this.getrow()
//i_columnname=this.getcolumnname()
//
//choose case i_columnname
//	case 'codes' 
//		//检测
//		l_cusno=trim(this.getitemstring(this.getrow(),'codes'))
//		if not (isnull(l_cusno) or len(l_cusno)=0) then
//		setnull(l_cusno_temp)
//		select names into :l_cusno_temp from products where codes=:l_cusno;
//			if isnull(l_cusno_temp) then
//				beep(9)
//				f_messagebox('','货号不存在,请修改货号!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//			else
//				this.setitem(this.getrow(),'names',l_cusno_temp)
//				i_itemchanged='success'
//			end if
//		end if
//	case 'gg'
//	
//		l_colthno=this.getitemstring(this.getrow(),'codes')
//		l_color=this.getitemstring(this.getrow(),'gg')
//		if not (isnull(l_color) or len(l_color)=0) then
//		setnull(l_price)
//		select price,count(*) into :l_price,:l_count from products
//			where codes=:l_colthno and gg=:l_color;
//		if l_count=0 then
//				beep(9)
//				f_messagebox('','货号/规格不存在,请修改货号/规格!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//		else
//				this.setitem(this.getrow(),'price',l_price)
//				i_itemchanged='success'
//		end if
//	end if
//case 'nb','price'
//	l_money=this.getitemdecimal(this.getrow(),'money')
//	if isnull(l_money) or l_money=0 then
//		this.setitem(this.getrow(),'money',&
//			this.getitemdecimal(this.getrow(),'nb')* &
//				this.getitemdecimal(this.getrow(),'price'))
//	end if
//case else
//	
//end choose
//i_itemchanged='success'
end event

event itemerror;//出错,恢复原值
boolean l_true
string l_outdate,l_message
setnull(l_message)
l_message=this.describe(this.getcolumnname()+'.validationmsg')
//itemchanged 出错
if i_itemchanged='failure' then
	return 1
else
	i_itemchanged='failure'
	i_row=this.getrow()
	i_columnname=this.getcolumnname()
end if
//
choose case this.getcolumnname()
	case  'dates' 
//			g_enter=0
//			i_columnname=''
//			setnull(l_outdate)
//			l_outdate=this.getitemstring(this.getrow(),'dates')
//			if isnull(l_outdate)  then
//				this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
//			end if
//			f_messagebox('','日期无效 ,yyyymmdd',0,0)
//			this.setfocus()
//			return 1
end choose
if isnull(l_message) or l_message='?' then
	l_message='没有通过合法检查!请重新修改数据!否则无法离开焦点!'
end if
f_sound('','beep')
f_messagebox('对不起',l_message,0,0)
this.setfocus()
return 1
end event

event itemfocuschanged;//////初值处理
//if f_displayonly(this,'isdy')='0' then  return
//if not this.getrow()>0 then return
//if not this.accepttext()=1 then return 
//
//if i_itemchanged='failure' then
//	if not ( isnull(i_columnname) or i_columnname='') then
//		//规格出错可修改货号
//		if not (i_columnname='gg' and this.getcolumnname()='codes') then
//			this.setcolumn(i_columnname)
//		end if
//		////
//		f_setcolumn(this,f_updatetable(this),i_columnname)  //一般
//		this.scrolltorow(i_row)
//	end if
//	this.setfocus()
//	if i_itemfocus='failure' then	return
//end if
//
//
////////
///////初值处理
////choose case this.getcolumnname()
////	case 'dates' 
////		setnull(l_outdate)
////		l_outdate=this.getitemstring(this.getrow(),'dates')
////		if isnull(l_outdate) or trim(l_outdate)='' then
////			this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
////		end if
////		if i_itemfocus='success' then this.triggerevent(itemchanged!)
////end choose
end event

event losefocus;g_enter=1
end event

event rbuttondown;this.triggerevent(doubleclicked!)
return 1
end event

event ue_words;if not this.getrow()>0 then return 0
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return 0
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
	commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
return 0
end event

event enterastab;

if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
if this.rowcount()>0 then
	//this.triggerevent(itemchanged!)
	if i_itemchanged='failure' then return	1
	if f_enter(this)=1 then 
		pb_add.triggerevent(clicked!)
	end if
end if
return 1
end event

event keydown;if keydown(keyescape!) and pb_cancel.enabled and pb_cancel.visible then 
	i_esc=1
	pb_cancel.triggerevent(clicked!)
	return 1
end if
if keydown(keyf1!) and pb_add.enabled and pb_add.visible then 
	pb_add.triggerevent(clicked!)
	return 1
end if
if keydown(keyf2!) and pb_save.enabled and pb_save.visible then 
	pb_save.triggerevent(clicked!)
	return 1
end if
if keydown(keyf4!) and pb_modify.enabled and pb_modify.visible then 
	pb_modify.triggerevent(clicked!)
	return 1
end if
if (keydown(keyf7!)) and pb_delete.enabled and pb_delete.visible  then
	pb_delete.triggerevent(clicked!)
	return 1
end if 
if keydown(keyf9!) then 
	dw_2.triggerevent(rbuttondown!)
	return 1
end if
//if  keydown(keyf12!) then
//	this.post event ue_words()
//	return 1
//end if

end event

type dw_22 from datawindow within w_couple_parent_sheet_derek
event clicked pbm_dwnlbuttonclk
event dberror pbm_dwndberror
event doubleclicked pbm_dwnlbuttondblclk
event editchanged pbm_dwnchanging
event itemchanged pbm_dwnitemchange
event itemerror pbm_dwnitemvalidationerror
event itemfocuschanged pbm_dwnitemchangefocus
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event type long ue_words ( )
event enterastab pbm_dwnprocessenter
event keydown pbm_dwnkey
boolean visible = false
integer x = 37
integer y = 504
integer width = 302
integer height = 116
integer taborder = 280
boolean enabled = false
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;if not this.getrow()>0 then return 1
string l_tt
if (f_edit_styles(dw_1,this.getcolumnname())<>'edit') and (f_edit_styles(dw_1,this.getcolumnname())<>'editmask') then return
if dw_1.rowcount()>0 then
	i_trigger_itemchanged=true
	//this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	0
end if


end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
f_setcolumn(this,f_updatetable(this),i_columnname)
return  l_temp
end event

event doubleclicked;//if not this.getrow()>0 then return
//if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
//if pb_save.enabled=false or pb_save.visible=false  then return
//dw_input4  dw_input5 dw_input6 
//choose case  this.getcolumnname()
//	case 'colthno' 
//		if dw_input5.rowcount()=0 then 
//			dw_input5.retrieve()
//			f_displayonly(dw_input5,'displayonly')
//		if dw_input5.rowcount()>0 then
//			dw_input5.visible=true
//			dw_input5.setfocus()
//		else
//			f_messagebox('','无货号色号信息!',0,0)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//		if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if

//end choose
//return 1

end event

event editchanged;i_editchanged_column=this.getcolumnname()
i_editchanged_row=this.getrow()
if i_itemchanged='failure' then
	f_dw_prochange(this)
	i_itemchanged='success'
end if

//choose case this.getcolumnname()
//	case 'yg_no'
//		if len(trim(this.gettext()))=personcode_len then
//			this.trigger event enterastab()
//		end if
//	case 'yz_cod'
//		if len(trim(this.gettext()))=g_ziplen then
//			this.trigger event enterastab()
//		end if
//	case 'ghno'
//		if len(trim(this.gettext()))=g_ghlen then
//			this.trigger event enterastab()
//		end if
//	case 'yg_id'
//		if len(trim(this.gettext()))=g_idlen then
//			this.trigger event enterastab()
//		end if
//end choose
end event

event itemchanged;
//if pb_save.enabled=false or pb_save.visible=false  then return
//if f_displayonly(this,'isdy')='0' then  return
//i_itemchanged='success'
//if not this.accepttext()=1 then return
//if not this.getrow()>0 then return
//string l_cusno,l_annotate,l_cusno_temp,l_codes,l_names
//string l_rmark,l_colthno,l_color
//decimal{2} l_price,l_money
//decimal{0} l_nb
//long l_row,l_len,l_count
//i_row=this.getrow()
//i_columnname=this.getcolumnname()
//
//choose case i_columnname
//	case 'codes' 
//		//检测
//		l_cusno=trim(this.getitemstring(this.getrow(),'codes'))
//		if not (isnull(l_cusno) or len(l_cusno)=0) then
//		setnull(l_cusno_temp)
//		select names into :l_cusno_temp from products where codes=:l_cusno;
//			if isnull(l_cusno_temp) then
//				beep(9)
//				f_messagebox('注意','货号不存在,请修改货号!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//			else
//				this.setitem(this.getrow(),'names',l_cusno_temp)
//				i_itemchanged='success'
//			end if
//		end if
//	case 'gg'
//	
//		l_colthno=this.getitemstring(this.getrow(),'codes')
//		l_color=this.getitemstring(this.getrow(),'gg')
//		if not (isnull(l_color) or len(l_color)=0) then
//		setnull(l_price)
//		select price,count(*) into :l_price,:l_count from products
//			where codes=:l_colthno and gg=:l_color;
//		if l_count=0 then
//				beep(9)
//				f_messagebox('注意','货号/规格不存在,请修改货号/规格!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//		else
//				this.setitem(this.getrow(),'price',l_price)
//				i_itemchanged='success'
//		end if
//	end if
//case 'nb','price'
//	l_money=this.getitemdecimal(this.getrow(),'money')
//	if isnull(l_money) or l_money=0 then
//		this.setitem(this.getrow(),'money',&
//			this.getitemdecimal(this.getrow(),'nb')* &
//				this.getitemdecimal(this.getrow(),'price'))
//	end if
//case else
//	
//end choose
//i_itemchanged='success'
end event

event itemerror;//出错,恢复原值
boolean l_true
string l_outdate,l_message
setnull(l_message)
l_message=this.describe(this.getcolumnname()+'.validationmsg')
//itemchanged 出错
if i_itemchanged='failure' then
	return 1
else
	i_itemchanged='failure'
	i_row=this.getrow()
	i_columnname=this.getcolumnname()
end if
//
choose case this.getcolumnname()
	case  'dates' 
//			g_enter=0
//			i_columnname=''
//			setnull(l_outdate)
//			l_outdate=this.getitemstring(this.getrow(),'dates')
//			if isnull(l_outdate)  then
//				this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
//			end if
//			f_messagebox('对不起','日期输入无效， ,yyyymmdd',0,0)
//			this.setfocus()
//			return 1
end choose
if isnull(l_message) or l_message='?' then
	l_message='没有通过合法检查!请重新修改数据!否则无法离开焦点!'
end if
f_sound('','beep')
f_messagebox('',l_message,0,0)
this.setfocus()
return 1
end event

event itemfocuschanged;//////初值处理
//if f_displayonly(this,'isdy')='0' then  return
//if not this.getrow()>0 then return
//if not this.accepttext()=1 then return 
//
//if i_itemchanged='failure' then
//	if not ( isnull(i_columnname) or i_columnname='') then
//		//规格出错可修改货号
//		if not (i_columnname='gg' and this.getcolumnname()='codes') then
//			this.setcolumn(i_columnname)
//		end if
//		////
//		f_setcolumn(this,f_updatetable(this),i_columnname)  //一般
//		this.scrolltorow(i_row)
//	end if
//	this.setfocus()
//	if i_itemfocus='failure' then	return
//end if
//
//
////////
///////初值处理
////choose case this.getcolumnname()
////	case 'dates' 
////		setnull(l_outdate)
////		l_outdate=this.getitemstring(this.getrow(),'dates')
////		if isnull(l_outdate) or trim(l_outdate)='' then
////			this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
////		end if
////		if i_itemfocus='success' then this.triggerevent(itemchanged!)
////end choose
end event

event losefocus;g_enter=1
end event

event rbuttondown;this.triggerevent(doubleclicked!)
return 1
end event

event ue_words;if not this.getrow()>0 then return 0
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return 0
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
	commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
return 0
end event

event enterastab;

if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
if this.rowcount()>0 then
	//this.triggerevent(itemchanged!)
	if i_itemchanged='failure' then return	1
	if f_enter(this)=1 then 
		pb_add.triggerevent(clicked!)
	end if
end if
return 1
end event

event keydown;if keydown(keyescape!) and pb_cancel.enabled and pb_cancel.visible then 
	i_esc=1
	pb_cancel.triggerevent(clicked!)
	return 1
end if
if keydown(keyf1!) and pb_add.enabled and pb_add.visible then 
	pb_add.triggerevent(clicked!)
	return 1
end if
if keydown(keyf2!) and pb_save.enabled and pb_save.visible then 
	pb_save.triggerevent(clicked!)
	return 1
end if
if keydown(keyf4!) and pb_modify.enabled and pb_modify.visible then 
	pb_modify.triggerevent(clicked!)
	return 1
end if
if (keydown(keyf7!)) and pb_delete.enabled and pb_delete.visible  then
	pb_delete.triggerevent(clicked!)
	return 1
end if 
if keydown(keyf9!) then 
	dw_2.triggerevent(rbuttondown!)
	return 1
end if
//if  keydown(keyf12!) then
//	this.post event ue_words()
//	return 1
//end if

end event

type dw_21 from datawindow within w_couple_parent_sheet_derek
event clicked pbm_dwnlbuttonclk
event dberror pbm_dwndberror
event doubleclicked pbm_dwnlbuttondblclk
event editchanged pbm_dwnchanging
event itemchanged pbm_dwnitemchange
event itemerror pbm_dwnitemvalidationerror
event itemfocuschanged pbm_dwnitemchangefocus
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event type long ue_words ( )
event enterastab pbm_dwnprocessenter
event keydown pbm_dwnkey
boolean visible = false
integer x = 32
integer y = 364
integer width = 329
integer height = 124
integer taborder = 150
boolean enabled = false
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;if not this.getrow()>0 then return 1
string l_tt
if (f_edit_styles(dw_1,this.getcolumnname())<>'edit') and (f_edit_styles(dw_1,this.getcolumnname())<>'editmask') then return
if dw_1.rowcount()>0 then
	i_trigger_itemchanged=true
	//this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	0
end if


end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
f_setcolumn(this,f_updatetable(this),i_columnname)
return  l_temp
end event

event doubleclicked;//if not this.getrow()>0 then return
//if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
//if pb_save.enabled=false or pb_save.visible=false  then return
//dw_input4  dw_input5 dw_input6 
//choose case  this.getcolumnname()
//	case 'colthno' 
//		if dw_input5.rowcount()=0 then 
//			dw_input5.retrieve()
//			f_displayonly(dw_input5,'displayonly')
//		if dw_input5.rowcount()>0 then
//			dw_input5.visible=true
//			dw_input5.setfocus()
//		else
//			f_messagebox('','无货号色号信息!',0,0)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//		if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if

//end choose
//return 1

end event

event editchanged;i_editchanged_column=this.getcolumnname()
i_editchanged_row=this.getrow()
if i_itemchanged='failure' then
	f_dw_prochange(this)
	i_itemchanged='success'
end if

//choose case this.getcolumnname()
//	case 'yg_no'
//		if len(trim(this.gettext()))=personcode_len then
//			this.trigger event enterastab()
//		end if
//	case 'yz_cod'
//		if len(trim(this.gettext()))=g_ziplen then
//			this.trigger event enterastab()
//		end if
//	case 'ghno'
//		if len(trim(this.gettext()))=g_ghlen then
//			this.trigger event enterastab()
//		end if
//	case 'yg_id'
//		if len(trim(this.gettext()))=g_idlen then
//			this.trigger event enterastab()
//		end if
//end choose
end event

event itemchanged;
//if pb_save.enabled=false or pb_save.visible=false  then return
//if f_displayonly(this,'isdy')='0' then  return
//i_itemchanged='success'
//if not this.accepttext()=1 then return
//if not this.getrow()>0 then return
//string l_cusno,l_annotate,l_cusno_temp,l_codes,l_names
//string l_rmark,l_colthno,l_color
//decimal{2} l_price,l_money
//decimal{0} l_nb
//long l_row,l_len,l_count
//i_row=this.getrow()
//i_columnname=this.getcolumnname()
//
//choose case i_columnname
//	case 'codes' 
//		//检测
//		l_cusno=trim(this.getitemstring(this.getrow(),'codes'))
//		if not (isnull(l_cusno) or len(l_cusno)=0) then
//		setnull(l_cusno_temp)
//		select names into :l_cusno_temp from products where codes=:l_cusno;
//			if isnull(l_cusno_temp) then
//				beep(9)
//				f_messagebox('','货号不存在,请修改货号!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//			else
//				this.setitem(this.getrow(),'names',l_cusno_temp)
//				i_itemchanged='success'
//			end if
//		end if
//	case 'gg'
//	
//		l_colthno=this.getitemstring(this.getrow(),'codes')
//		l_color=this.getitemstring(this.getrow(),'gg')
//		if not (isnull(l_color) or len(l_color)=0) then
//		setnull(l_price)
//		select price,count(*) into :l_price,:l_count from products
//			where codes=:l_colthno and gg=:l_color;
//		if l_count=0 then
//				beep(9)
//				f_messagebox('','货号/规格不存在,请修改货号/规格!否则无法离开焦点!',0,0)
//				this.setfocus()
//				i_itemchanged='failure'
//				return 1
//		else
//				this.setitem(this.getrow(),'price',l_price)
//				i_itemchanged='success'
//		end if
//	end if
//case 'nb','price'
//	l_money=this.getitemdecimal(this.getrow(),'money')
//	if isnull(l_money) or l_money=0 then
//		this.setitem(this.getrow(),'money',&
//			this.getitemdecimal(this.getrow(),'nb')* &
//				this.getitemdecimal(this.getrow(),'price'))
//	end if
//case else
//	
//end choose
//i_itemchanged='success'
end event

event itemerror;//出错,恢复原值
boolean l_true
string l_outdate,l_message
setnull(l_message)
l_message=this.describe(this.getcolumnname()+'.validationmsg')
//itemchanged 出错
if i_itemchanged='failure' then
	return 1
else
	i_itemchanged='failure'
	i_row=this.getrow()
	i_columnname=this.getcolumnname()
end if
//
choose case this.getcolumnname()
	case  'dates' 
//			g_enter=0
//			i_columnname=''
//			setnull(l_outdate)
//			l_outdate=this.getitemstring(this.getrow(),'dates')
//			if isnull(l_outdate)  then
//				this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
//			end if
//			f_messagebox('对不起','日期输入无效 ,yyyymmdd',0,0)
//			this.setfocus()
//			return 1
end choose
if isnull(l_message) or l_message='?' then
	l_message='没有通过合法检查!请重新修改数据!否则无法离开焦点!'
end if
f_sound('','beep')
f_messagebox('',l_message,0,0)
this.setfocus()
return 1
end event

event itemfocuschanged;//////初值处理
//if f_displayonly(this,'isdy')='0' then  return
//if not this.getrow()>0 then return
//if not this.accepttext()=1 then return 
//
//if i_itemchanged='failure' then
//	if not ( isnull(i_columnname) or i_columnname='') then
//		//规格出错可修改货号
//		if not (i_columnname='gg' and this.getcolumnname()='codes') then
//			this.setcolumn(i_columnname)
//		end if
//		////
//		f_setcolumn(this,f_updatetable(this),i_columnname)  //一般
//		this.scrolltorow(i_row)
//	end if
//	this.setfocus()
//	if i_itemfocus='failure' then	return
//end if
//
//
////////
///////初值处理
////choose case this.getcolumnname()
////	case 'dates' 
////		setnull(l_outdate)
////		l_outdate=this.getitemstring(this.getrow(),'dates')
////		if isnull(l_outdate) or trim(l_outdate)='' then
////			this.setitem(this.getrow(),'dates',string(today(),'yyyymmdd'))
////		end if
////		if i_itemfocus='success' then this.triggerevent(itemchanged!)
////end choose
end event

event losefocus;g_enter=1
end event

event rbuttondown;this.triggerevent(doubleclicked!)
return 1
end event

event ue_words;if not this.getrow()>0 then return 0
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return 0
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
	commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
return 0
end event

event enterastab;

if this.describe(this.describe('#1.name')+'.edit.displayonly')='yes' then return
if this.rowcount()>0 then
	//this.triggerevent(itemchanged!)
	if i_itemchanged='failure' then return	1
	if f_enter(this)=1 then 
		pb_add.triggerevent(clicked!)
	end if
end if
return 1
end event

event keydown;if keydown(keyescape!) and pb_cancel.enabled and pb_cancel.visible then 
	i_esc=1
	pb_cancel.triggerevent(clicked!)
	return 1
end if
if keydown(keyf1!) and pb_add.enabled and pb_add.visible then 
	pb_add.triggerevent(clicked!)
	return 1
end if
if keydown(keyf2!) and pb_save.enabled and pb_save.visible then 
	pb_save.triggerevent(clicked!)
	return 1
end if
if keydown(keyf4!) and pb_modify.enabled and pb_modify.visible then 
	pb_modify.triggerevent(clicked!)
	return 1
end if
if (keydown(keyf7!)) and pb_delete.enabled and pb_delete.visible  then
	pb_delete.triggerevent(clicked!)
	return 1
end if 
if keydown(keyf9!) then 
	dw_2.triggerevent(rbuttondown!)
	return 1
end if
//if  keydown(keyf12!) then
//	this.post event ue_words()
//	return 1
//end if

end event

type pb_21cancel from picturebutton within w_couple_parent_sheet_derek
boolean visible = false
integer x = 485
integer y = 940
integer width = 155
integer height = 100
integer taborder = 270
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
string text = "取消"
alignment htextalign = left!
end type

type pb_21delete from picturebutton within w_couple_parent_sheet_derek
boolean visible = false
integer x = 329
integer y = 940
integer width = 155
integer height = 100
integer taborder = 260
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
string text = "删除"
alignment htextalign = left!
end type

type pb_21save from picturebutton within w_couple_parent_sheet_derek
boolean visible = false
integer x = 174
integer y = 940
integer width = 155
integer height = 100
integer taborder = 240
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
string text = "保存"
alignment htextalign = left!
end type

type pb_21add from picturebutton within w_couple_parent_sheet_derek
boolean visible = false
integer x = 14
integer y = 940
integer width = 155
integer height = 100
integer taborder = 250
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
string text = "增加"
alignment htextalign = left!
end type

type dw_words from datawindow within w_couple_parent_sheet_derek
event doubleclicked pbm_dwnlbuttondblclk
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event key pbm_dwnkey
boolean visible = false
integer x = 672
integer y = 308
integer width = 1815
integer height = 812
integer taborder = 30
string dataobject = "dw_words_browse"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;if this.getrow()>0 then
	if f_displayonly(dw_1,'isdy')<>'0' then //dw_1.enabled=true then
		dw_1.settext(this.getitemstring(this.getrow(),'words'))
		this.visible=false
		dw_1.setfocus()
		//dw_1.triggerevent(itemchanged!)
	else
		dw_2.settext(this.getitemstring(this.getrow(),'words'))
		this.visible=false
		dw_2.setfocus()
		//dw_2.triggerevent(itemchanged!)
	end if
end if
end event

event losefocus;this.visible=false
dw_1.setfocus()
g_enter=0
end event

event rbuttondown;this.triggerevent(doubleclicked!)
end event

event key;if keydown(keyenter!) then
	this.triggerevent(doubleclicked!)
	return 1
end if
if keydown(keyescape!) then
	i_esc=1
	this.triggerevent(losefocus!)
	return 1
end if
end event

type dw_input6 from datawindow within w_couple_parent_sheet_derek
event doubleclicked pbm_dwnlbuttondblclk
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event key pbm_dwnkey
boolean visible = false
integer x = 814
integer y = 72
integer width = 1179
integer height = 76
integer taborder = 100
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//if this.getrow()>0 then
//	dw_2.setitem(dw_2.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	i_editchanged_column=dw_2.getcolumnname()
//	i_editchanged_row=dw_2.getrow()
//	dw_2.setfocus()
//	dw_2.triggerevent(editchanged!)
// dw_2.triggerevent(itemchanged!)
////连环套触发
////	if i_itemchanged='success' then
////		dw_2.setcolumn('color')
////		dw_2.triggerevent(rbuttondown!)
////	end if
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_2.setfocus()
g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

event key;
return wf_inputkey(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type cb_report from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 2578
integer y = 2024
integer width = 265
integer height = 232
integer taborder = 320
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
string facename = "宋体"
string text = "报表"
boolean originalsize = true
string picturename = "report.bmp"
string disabledname = "report1.bmp"
end type

event clicked;
string l_table,l_table1,l_dbname
long l_count,l_len

s_freereport l_report
if pb_add.visible=true then
	l_dbname=dw_2.describe(dw_1.describe('#1.name')+'.dbname')
	s_ps.tables=f_updatetable(dw_2)
	l_report.dw_1=dw_2
else
	l_dbname=dw_1.describe(dw_1.describe('#1.name')+'.dbname')
	s_ps.tables=f_updatetable(dw_1)
	l_report.dw_1=dw_1
end if
l_len=Pos(l_dbname,'.')
//s_ps.tables=mid(l_dbname,1,l_len - 1)
setnull(l_count)
l_table=s_ps.tables
select count(*) into :l_count from tmanage where t_name_e=:l_table;
if l_count>0 then 
	l_report.table=s_ps.tables
	openwithparm(w_query_kehu,l_report)   //s_ps.tables)
	//openwithparm(w_query_kehu,s_ps.tables)
else
	f_messagebox('',f_wl('无管理信息!'),0,0)
end if
commit;
if f_dbms()=1 then parent.trigger event  ue_setsql()
end event

type dw_input5 from datawindow within w_couple_parent_sheet_derek
event doubleclicked pbm_dwnlbuttondblclk
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event key pbm_dwnkey
boolean visible = false
integer x = 654
integer y = 72
integer width = 1184
integer height = 80
integer taborder = 70
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//if this.getrow()>0 then
//	dw_2.setitem(dw_2.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	i_editchanged_column=dw_2.getcolumnname()
//	i_editchanged_row=dw_2.getrow()
//	dw_2.setfocus()
//	dw_2.triggerevent(editchanged!)
// dw_2.triggerevent(itemchanged!)

////连环套触发
////	if i_itemchanged='success' then
////		dw_2.setcolumn('color')
////		dw_2.triggerevent(rbuttondown!)
////	end if
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_2.setfocus()
g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

event key;
return wf_inputkey(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type dw_input4 from datawindow within w_couple_parent_sheet_derek
event doubleclicked pbm_dwnlbuttondblclk
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event key pbm_dwnkey
boolean visible = false
integer x = 553
integer y = 72
integer width = 1179
integer height = 80
integer taborder = 90
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//if this.getrow()>0 then
//	dw_2.setitem(dw_2.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	i_editchanged_column=dw_2.getcolumnname()
//	i_editchanged_row=dw_2.getrow()
//	dw_2.setfocus()
//	dw_2.triggerevent(editchanged!)
//	dw_2.triggerevent(itemchanged!)
////连环套触发
////	if i_itemchanged='success' then
////		dw_2.setcolumn('color')
////		dw_2.triggerevent(rbuttondown!)
////	end if
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_2.setfocus()
g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

event key;
return wf_inputkey(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type dw_input3 from datawindow within w_couple_parent_sheet_derek
event doubleclicked pbm_dwnlbuttondblclk
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event key pbm_dwnkey
boolean visible = false
integer x = 425
integer y = 72
integer width = 1179
integer height = 80
integer taborder = 40
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//if this.getrow()>0 then
//	dw_1.setitem(dw_1.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	dw_1.setfocus()
//	dw_1.triggerevent(editchanged!)
//	dw_1.triggerevent(itemchanged!)
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_1.setfocus()
g_enter=0
end event

event rbuttondown;return wf_rbdown(this)
end event

event key;
return wf_inputkey(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type dw_input2 from datawindow within w_couple_parent_sheet_derek
event doubleclicked pbm_dwnlbuttondblclk
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event key pbm_dwnkey
boolean visible = false
integer x = 256
integer y = 72
integer width = 1179
integer height = 76
integer taborder = 80
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//if this.getrow()>0 then
//	dw_1.setitem(dw_1.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	dw_1.setfocus()
//	dw_1.triggerevent(editchanged!)
//	dw_1.triggerevent(itemchanged!)
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_1.setfocus()
g_enter=0
end event

event rbuttondown;
return wf_rbdown(this)
end event

event key;
return wf_inputkey(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type dw_input1 from datawindow within w_couple_parent_sheet_derek
event doubleclicked pbm_dwnlbuttondblclk
event losefocus pbm_dwnkillfocus
event rbuttondown pbm_dwnrbuttondown
event key pbm_dwnkey
boolean visible = false
integer x = 105
integer y = 72
integer width = 1179
integer height = 80
integer taborder = 130
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;//if this.getrow()>0 then
//	dw_1.setitem(dw_1.getrow(),'deptcode', &
//		this.getitemstring(this.getrow(),'deptcode'))
//	this.visible=false
//	dw_1.setfocus()
//	dw_1.triggerevent(editchanged!)
//	dw_1.triggerevent(itemchanged!)
//end if
end event

event losefocus;
if i_nolosefocus=1 then return
this.visible=false
if not isvalid(w_calendar) then dw_1.setfocus()
g_enter=0
end event

event rbuttondown;///this.triggerevent(doubleclicked!)

return wf_rbdown(this)
end event

event key;
return wf_inputkey(this)
end event

event itemerror;

//出错,恢复原值
boolean l_true
string l_outdate,l_message
long l_return

l_return=f_itemerror(this,data)

return 1
end event

type pb_modify from picturebutton within w_couple_parent_sheet_derek
integer x = 2665
integer y = 136
integer width = 265
integer height = 232
integer taborder = 410
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "修改"
boolean originalsize = true
string picturename = "modify.bmp"
string disabledname = "modify1.bmp"
alignment htextalign = left!
end type

event clicked;//if wf_cbstate_modify(true) then 
//	dw_1.getfullstate(ib_fullstate_head)
//	dw_2.getfullstate(ib_fullstate_detail)
//end if
wf_cbstate_modify(true)
end event

type st_1 from statictext within w_couple_parent_sheet_derek
boolean visible = false
integer x = 2811
integer y = 2020
integer width = 261
integer height = 100
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
string facename = "宋体"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "信息栏"
boolean border = true
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_couple_parent_sheet_derek
integer x = 3227
integer y = 136
integer width = 265
integer height = 232
integer taborder = 430
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "取消"
boolean originalsize = true
string picturename = "cancel.bmp"
string disabledname = "cancel1.bmp"
end type

event clicked;if len(ib_fullstate_head)>0 then 
	dw_1.setfullstate(ib_fullstate_head)
	dw_2.setfullstate(ib_fullstate_detail)
end if
wf_cbstate_modify(false)
wf_query()


end event

type pb_add from picturebutton within w_couple_parent_sheet_derek
integer x = 2651
integer y = 24
integer width = 265
integer height = 232
integer taborder = 350
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "新增"
boolean originalsize = true
string picturename = "add.bmp"
string disabledname = "add1.bmp"
alignment htextalign = left!
end type

event clicked;//if pb_save.enabled=true then 
	dw_2.insertrow(0)
end event

type pb_save from picturebutton within w_couple_parent_sheet_derek
integer x = 2862
integer y = 28
integer width = 265
integer height = 232
integer taborder = 340
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "保存"
boolean originalsize = true
string picturename = "save.bmp"
string disabledname = "save1.bmp"
alignment htextalign = left!
end type

event clicked;wf_cbstate_modify(false)
end event

type pb_delete from picturebutton within w_couple_parent_sheet_derek
integer x = 2930
integer y = 136
integer width = 265
integer height = 232
integer taborder = 390
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "删除"
boolean originalsize = true
string picturename = "delete.bmp"
string disabledname = "delete1.bmp"
alignment htextalign = left!
end type

event clicked;
if not dw_2.rowcount()>0 then 
	f_messagebox('',f_wgz_language('无记录!'),0,0)
	return 
end if 
//防止删除时检查行
ib_checkrow=false
if wf_deleteb()=1 then 
	ib_checkrow=true
	return 
end if
ib_checkrow=true
end event

type cb_detail from picturebutton within w_couple_parent_sheet_derek
integer x = 2441
integer y = 32
integer width = 265
integer height = 232
integer taborder = 440
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "明细"
boolean originalsize = true
string picturename = "detail.bmp"
string disabledname = "detail1.bmp"
alignment htextalign = left!
vtextalign vtextalign = vcenter!
end type

event clicked;
if not dw_1.getrow()>0 then 
	f_messagebox('','单据不存在',0,0)
	return
end if
if not i_priorbutton='cb_add' then
	//f_protect(dw_2,f_updatetable(dw_2),'protect')
   //f_displayonly(dw_2,'displayonly')
end if
if dw_2.rowcount()=0 then
	i_rowdefault=false
	pb_add.triggerevent(clicked!)
	i_rowdefault=true
end if
//
i_prisizerow=0

pb_cancel.visible=true
pb_add.visible=true
pb_save.visible=true
pb_delete.visible=true
pb_modify.visible=true
//
pb_delete.enabled=true
pb_save.enabled=false
pb_add.enabled=true
pb_modify.enabled=true
pb_cancel.enabled=true
//
//dw_1.enabled=false
//f_displayonly(dw_1,'dy') 
//dw_2.enabled=true
//f_displayonly(dw_2,'edit') 

cb_add.enabled=false
cb_save.enabled=false
cb_delete.enabled=false
cb_cancel.enabled=false
cb_prior.enabled=false
cb_next.enabled=false
cb_first.enabled=false
cb_last.enabled=false
cb_query.enabled=false
cb_browse.enabled=false
cb_print.enabled=false
cb_modify.enabled=false
cb_detail.enabled=false
cb_browseall.enabled=false
cb_exit.enabled=false
i_editchanged_column=''
i_editchanged_row=0
g_enter=0
st_info.text=g_info
dw_2.setfocus()
if dw_2.getrow()>0 then
	i_columnname=dw_2.getcolumnname()
	i_row=dw_2.getrow()
else
	i_columnname=''
	i_row=0
end if
i_itemchanged='success'
i_itemfocus='failure'
f_menu_control_special(parent,g_menutext)

if pb_modify.enabled=true and pb_modify.visible=true  then
	pb_modify.triggerevent(clicked!)
end if
wf_bsave(false,'')
end event

type cb_browseall from picturebutton within w_couple_parent_sheet_derek
integer x = 18
integer y = 2016
integer width = 265
integer height = 232
integer taborder = 460
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "浏览所有"
boolean originalsize = true
string picturename = "browall.bmp"
string disabledname = "browall1.bmp"
vtextalign vtextalign = multiline!
end type

event clicked;dw_browseall.settransobject(sqlca)
if dw_browseall.retrieve()>0 then
//	f_position(dw_4,43,458,2657,845)
	dw_browseall.visible=true
	dw_browseall.setfocus()
else
	f_messagebox('',f_wl('无记录!'),0,0)
	return
end if
//dw_1.enabled=false
//f_displayonly(dw_1,'displayonly') 
//dw_2.enabled=false
//f_displayonly(dw_2,'displayonly') 
cb_add.enabled=false
cb_save.enabled=false
cb_delete.enabled=false
cb_cancel.enabled=false
cb_prior.enabled=false
cb_next.enabled=false
cb_first.enabled=false
cb_last.enabled=false
cb_query.enabled=false
cb_browse.enabled=false
cb_print.enabled=false
cb_modify.enabled=false
cb_detail.enabled=false
cb_browseall.enabled=false
pb_add.enabled=false
cb_exit.enabled=false
end event

type cb_add from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 27
integer y = 24
integer width = 265
integer height = 232
integer taborder = 180
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "新增"
boolean originalsize = true
string picturename = "add.bmp"
string disabledname = "add1.bmp"
alignment htextalign = left!
end type

event clicked;long l_row
dw_1.reset()
dw_2.reset()
l_row=dw_1.insertrow(0)
dw_1.scrolltorow(l_row)
dw_1.SetItemStatus(l_row,0,Primary!,NewModified!)
wf_cbstate_modify(true)


//if i_dwfocus='dw_2' then
//	cb_detail.triggerevent(clicked!)
//	if pb_add.enabled=true and pb_add.visible=true then
//		pb_add.triggerevent(clicked!)
//	else
//		f_messagebox('','不允许增加表身记录',0,0)
//		pb_cancel.triggerevent(clicked!)
//	end if
//	return
//end if

//dw_2.reset()
//f_protect(dw_1,f_updatetable(dw_1),'modify')
//i_row=dw_1.getrow()
//dw_1.setfocus()
//dw_1.setcolumn(1)
//i_rowfocus=1
//dw_1.reset()
//dw_2.reset()
//
//i_row=dw_1.insertrow(0)
//dw_1.scrolltorow(i_row)
//i_rowfocus=0
//i_priorbutton=''
////dw_1.enabled=true
//f_displayonly(dw_1,'edit') 
//dw_1.setcolumn(1)
////dw_2.enabled=false
//f_displayonly(dw_2,'displayonly') 
//cb_add.enabled=false
//cb_save.enabled=true
//cb_delete.enabled=false
//cb_cancel.enabled=true
//cb_prior.enabled=false
//cb_next.enabled=false
//cb_first.enabled=false
//cb_last.enabled=false
//cb_query.enabled=false
//cb_browse.enabled=false
//cb_print.enabled=false
//cb_modify.enabled=false
//cb_detail.enabled=false
//cb_browseall.enabled=false
//pb_add.enabled=false
//cb_exit.enabled=false
//i_priorbutton='cb_add'
//g_enter=0
//i_columnname=''
//i_itemchanged='success'
//i_itemfocus='failure'
//
//wf_bsave(false,'')
//

end event

type cb_modify from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 795
integer y = 24
integer width = 265
integer height = 232
integer taborder = 190
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "修改"
boolean originalsize = true
string picturename = "modify.bmp"
string disabledname = "modify1.bmp"
alignment htextalign = left!
end type

event clicked;
pb_modify.event clicked()

//if not dw_1.getrow()>0 then 
//	f_messagebox('',f_wgz_language('无记录!'),0,0)
//	return 
//end if



//if i_dwfocus='dw_2' then
//	cb_detail.triggerevent(clicked!)
//	if pb_save.enabled=false then
//		f_messagebox('','不允许修改表身记录',0,0)
//		pb_cancel.triggerevent(clicked!)
//	end if
//	return
//end if



//if dw_1.getitemstring(dw_1.getrow(),'chflags')<>'0' then
//	f_messagebox('',f_wl('单据已确认或作废'),0,0)
//	return
//end if

//i_priorbutton='cb_modify'
//i_row=dw_1.getrow()
////dw_1.enabled=true
//f_displayonly(dw_1,'edit') 
////dw_2.enabled=false
//f_displayonly(dw_2,'displayonly') 
//cb_add.enabled=false
//cb_save.enabled=true
//cb_delete.enabled=false
//cb_cancel.enabled=true
//cb_prior.enabled=false
//cb_next.enabled=false
//cb_first.enabled=false
//cb_last.enabled=false
//cb_query.enabled=false
//cb_browse.enabled=false
//cb_print.enabled=false
//cb_modify.enabled=false
//cb_detail.enabled=false
//cb_browseall.enabled=false
//pb_add.enabled=false
//cb_exit.enabled=false
//dw_1.setfocus()
//dw_1.setcolumn(1)
//g_enter=0
//i_itemchanged='success'
//i_itemfocus='failure'
//f_protect(dw_1,f_updatetable(dw_1),'protect')
//i_row=dw_1.getrow()
//i_columnname=dw_1.getcolumnname()
//if wf_bsave(false,'mdnos')=-1 then
//	i_autocancel=1
//	cb_cancel.triggerevent(clicked!)
//	i_autocancel=0
//	return
//end if
//

end event

type cb_cancel from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 1051
integer y = 24
integer width = 265
integer height = 232
integer taborder = 200
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "取消"
boolean originalsize = true
string picturename = "cancel.bmp"
string disabledname = "cancel1.bmp"
alignment htextalign = left!
end type

event clicked;pb_cancel.event clicked()

//if i_autocancel=1 or (dw_1.modifiedcount()=0 and dw_1.deletedcount()=0) then
//	
//elseif f_messagebox('',f_wgz_language('是否取消?'),2,1)=2 then 
//	dw_1.setfocus()
//	return
//end if

////dw_1.enabled=false
//f_displayonly(dw_1,'dy') 
////dw_2.enabled=false
//f_displayonly(dw_2,'dy') 
//cb_add.enabled=true
//cb_save.enabled=false
//cb_delete.enabled=true
//cb_cancel.enabled=false
//cb_prior.enabled=true
//cb_next.enabled=true
//cb_first.enabled=true
//cb_last.enabled=true
//cb_query.enabled=true
//cb_browse.enabled=true
//cb_print.enabled=true
//cb_modify.enabled=true
//cb_detail.enabled=true
//cb_browseall.enabled=true
//cb_exit.enabled=true
//
//if i_priorbutton='cb_add' or f_field(dw_1,'nos','isvalid')<>0 then
//	i_priorbutton='cb_cancel'
//	dw_1.deleterow(0)
//	parent.triggerevent(open!)
//else
////	dw_2.reset()
//	dw_1.retrieve(dw_1.getitemstring(dw_1.getrow(),'nos'))
//	if dw_1.rowcount()>0 then
//		dw_1.triggerevent(rowfocuschanged!)
//	end if
//
//end if
//i_itemchanged='success'
//
//commit;
//
//i_priorbutton='cb_cancel'
//wf_bsave(true,'mdnos')
////wf_mdnos('')
////parent.triggerevent(open!)
//
//
//
end event

type cb_save from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 283
integer y = 24
integer width = 265
integer height = 232
integer taborder = 210
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "保存"
boolean originalsize = true
string picturename = "save.bmp"
string disabledname = "save1.bmp"
alignment htextalign = left!
end type

event clicked;pb_save.event clicked()
end event

type cb_query from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 1577
integer y = 36
integer width = 265
integer height = 232
integer taborder = 220
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "查询"
boolean originalsize = true
string picturename = "query.bmp"
string disabledname = "query1.bmp"
alignment htextalign = left!
end type

event clicked;
//i_priorbutton='cb_query'

//string l_codes,l_find
//long l_row
//s_parm l_parm
//
//l_parm.stringparm1='buy'
//l_parm.stringparm2='db'
//l_parm.stringparm3='t1.kinds1='+string(i_kinds1)
//l_parm.dw_1=dw_1
//l_parm.window1=parent;openwithparm(w_zg_nos_query,l_parm)
//l_codes=message.stringparm
//if l_codes<>'' then
//	dw_1.retrieve(l_codes)
//	dw_1.triggerevent(rowfocuschanged!)
//	commit;
//end if
//
//
end event

type cb_last from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 603
integer y = 2016
integer width = 265
integer height = 232
integer taborder = 520
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "最后"
boolean originalsize = true
string picturename = "last.bmp"
alignment htextalign = left!
end type

event clicked;i_priorbutton='cb_last'
dw_1.scrolltorow(dw_1.rowcount())
end event

type cb_first from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 311
integer y = 2016
integer width = 265
integer height = 232
integer taborder = 510
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "第一"
boolean originalsize = true
string picturename = "first.bmp"
string disabledname = "first0.bmp"
alignment htextalign = left!
end type

event clicked;i_priorbutton='cb_first'
dw_1.scrolltorow(1)
end event

type cb_next from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 2149
integer y = 136
integer width = 151
integer height = 120
integer taborder = 500
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "下一页"
boolean originalsize = true
string picturename = "next_s.bmp"
string disabledname = "next_s1.bmp"
alignment htextalign = left!
end type

type cb_prior from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 2144
integer y = 24
integer width = 151
integer height = 120
integer taborder = 480
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "前一页"
boolean originalsize = true
string picturename = "prior_s.bmp"
string disabledname = "prior_s1.bmp"
alignment htextalign = left!
end type

type cb_print from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 3049
integer y = 32
integer width = 265
integer height = 232
integer taborder = 470
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "打印"
boolean originalsize = true
string picturename = "print.bmp"
string disabledname = "print1.bmp"
alignment htextalign = left!
end type

event clicked;datawindow dw
dw=dw_2
s_ps.dw_1=dw
if s_ps.dw_1.rowcount()>0 then
	open(w_print_setting)
end if

end event

type cb_browse from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
event ue_focus ( )
integer x = 539
integer y = 24
integer width = 265
integer height = 232
integer taborder = 530
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "浏览"
boolean originalsize = true
string picturename = "browse.bmp"
string disabledname = "browse1.bmp"
vtextalign vtextalign = multiline!
end type

event clicked;
if not dw_1.rowcount()>0 then return
string l_find
long l_row,l_browse=0
i_browse=1
i_priorbutton='cb_browse'
l_find=''
if dw_1.getrow()>0 then l_find=f_find_key(dw_1)
if dw_browse.retrieve()>0 then
//	f_position(dw_3,1544,589,1163,750)

	l_browse=1
	
	if dw_1.getrow()>0 then 
		l_row=dw_browse.find(l_find,1,dw_browse.rowcount())
	end if
	if l_row>0 then dw_browse.scrolltorow(l_row)
	
	
	//end if
else
	f_messagebox('',f_wgz_language('无记录!'),0,0)
	return
end if
i_browse=0
if dw_browse.rowcount()>0 then dw_browse.triggerevent(rowfocuschanged!)
//i_browse=0
//dw_1.enabled=false
//f_displayonly(dw_1,'displayonly') 
//dw_2.enabled=false
//f_displayonly(dw_2,'displayonly') 
cb_add.enabled=false
cb_save.enabled=false
cb_delete.enabled=false
cb_cancel.enabled=false
cb_prior.enabled=false
cb_next.enabled=false
cb_first.enabled=false
cb_last.enabled=false
cb_query.enabled=false
cb_browse.enabled=false
cb_print.enabled=false
cb_modify.enabled=false
cb_detail.enabled=false
cb_browseall.enabled=false
pb_add.enabled=false
cb_exit.enabled=false
wf_bsave(false,'')

if l_browse=1 then
	yield()


	dw_browse.setfocus()
	dw_browse.visible=true
end if	

end event

event ue_focus();
this.setfocus()
end event

type cb_delete from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 1307
integer y = 24
integer width = 265
integer height = 232
integer taborder = 540
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "删除"
boolean originalsize = true
string picturename = "delete.bmp"
string disabledname = "delete1.bmp"
alignment htextalign = left!
end type

event clicked;pb_delete.event clicked()
end event

type cb_exit from picturebutton within w_couple_parent_sheet_derek
event clicked pbm_bnclicked
integer x = 3232
integer y = 32
integer width = 265
integer height = 232
integer taborder = 550
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "退出"
boolean originalsize = true
string picturename = "exit.bmp"
string disabledname = "exit1.bmp"
alignment htextalign = left!
end type

event clicked;

i_priorbutton='cb_exit'
//if i_parm.sheet=1 then
//	close(parent)
if f_zg_w_deal(parent,'issheet')=1 then
	//必须的
	close(parent)
else
	//closewithreturn()
	close(parent)
end if

end event

type dw_1 from datawindow within w_couple_parent_sheet_derek
event keydown pbm_dwnkey
event ue_words ( )
event type long ue_key ( keycode key,  unsignedinteger keyflags )
event ue_select ( )
event type long ue_retrieveend2 ( )
event type string ue_checknull ( long row )
event enterastab pbm_dwnprocessenter
event type string ue_getlistsql ( string ls_dwoname )
integer y = 260
integer width = 3451
integer height = 396
integer taborder = 10
boolean livescroll = true
end type

event keydown;

long l_return=0

if i_keyflags=0 then return 0
/*2006-05-04*/
if keydown(keyleftarrow!) or  keydown(keyrightarrow!) then 
	dw_1.post event ue_select()
	return 1
end if

//l_return=this.trigger event ue_skey(key,keyflags)

if l_return>0 then
	return l_return
end if

//l_return=this.trigger event ue_key(key,keyflags)
if l_return=1 then
	yield()
	if not isvalid(this) then return
	
	if dw_button.visible=true then 
		
		dw_button.post event ue_init(0)
	end if
elseif l_return=2 then
	return 1
end if
/*2006-05-04*/
//if keydown(keyleftarrow!) or  keydown(keyrightarrow!) then 
//	dw_1.post event ue_select()
//end if
return l_return


end event

event ue_words;if not this.getrow()>0 then return
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
end event

event type long ue_key(keycode key, unsignedinteger keyflags);



if keydown(keyescape!) then
	return 2
//	if dw_browse.visible=true then
//		dw_browse.triggerevent("keydown")
//		return 1
//	elseif cb_cancel.enabled and cb_cancel.visible then
//		i_esc=1
//		cb_cancel.post event clicked()
//		return 1
//	end if
end if

/*统一Esc*/

//if keydown(keyf2!) and cb_save.enabled and cb_save.visible then
//	cb_save.post event clicked()
//	return 1
//end if
//if keydown(keyf7!) and cb_delete.enabled and cb_delete.visible then
//	cb_delete.post event clicked()
//	return 1
//end if
if keydown(keyf9!) then
	dw_1.postevent(doubleclicked!)
	return 1
end if
//if keydown(keyf12!) then
//		this.post event ue_words()
//		return  1
//end if

if (keydown(KeyLeftArrow!) or keydown(KeyrightArrow!) or keydown(KeyupArrow!) or keydown(KeydownArrow!)) &
																												and g_lrarrow='yes' then
   i_trigger_itemchanged=true
	//this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	1
end if	
	
	
if keydown(KeyLeftArrow!)  and g_lrarrow='yes' then
	f_dw_arrow(this,'left',0)
	return 1
end if

if keydown(KeyrightArrow!)  and g_lrarrow='yes' then
	f_dw_arrow(this,'right',0)
	return 1
end if


if keydown(KeyupArrow!)  and g_lrarrow='yes' then
	f_dw_arrow(this,'up',2)
	return 1
end if

if keydown(KeydownArrow!)  and g_lrarrow='yes' then
	f_dw_arrow(this,'down',2)
	return 1
end if


if  keydown(KeyPageUp!) or keydown(KeyPageDown!) then
		return 1
end if
//		
parent.post event key(key,keyflags)

return 0
end event

event ue_select();
yield()
if f_edit_styles(this,this.getcolumnname())='edit' then   
	
	if this.describe(this.getcolumnname()+'.edit.autohscroll')='yes' then
	else
		this.selecttext(1,100)
	end if
end if
//f_messagebox('','1',0,0)
//this.setfocus()
//this.selecttext(1,100)
//f_messagebox('','2',0,0)
//this.selecttext(1,100)
//this.setfocus()
//
end event

event type long ue_retrieveend2();
/*二次用，返回1代表需要头部重新初始化*/

return 0
/**/
end event

event type string ue_checknull(long row);string ls_errtext,ls_title,ls_find
string ls_notnull[]
long i
long l_row
string ls_unique[]

ls_notnull[]=u_derek.u_fun.getarray(is_dwnotnull_head,',',0)
//ls_unique[]=is_dwnotnull_head[]

//if getitemstatus(row,0,primary!)<>new! then
	for i=1 to upperbound(ls_notnull)
		if trim(describe("Evaluate(~""+ls_notnull[i]+"~","+string(row)+")"))='' then 
			ls_title=describe(ls_notnull[i]+'_t.text')
			ls_errtext+=ls_title+'不能为空!~r~n'
		end if
	next
	
//end if

if ls_errtext<>'' then goto e
return ''
e:
return ls_errtext
end event

event enterastab;Send(Handle(this),256,9,0)
return 1
end event

event doubleclicked;
//if i_autochange=1 then return 1
//if not this.getrow()>0 then return
//if f_displayonly(this,'isdy')='0' then return  //this.enabled=false then  return
//if cb_save.enabled=false or cb_save.visible=false  then return

////dw_input1,dw_input2,dw_input3
//
//if not this.getrow()>0 then return
//string l_pathname,l_filename
//choose case  this.getcolumnname()
//	case 'deptcode' 
//		if dw_input1.rowcount()=0 then
//			dw_input1.retrieve()
//			f_displayonly(dw_input1,'displayonly')
//		end if
//		commit;
//		if dw_input1.rowcount()>0 then
//			dw_input1.visible=true
//			dw_input1.setfocus()
//		else
//			f_messagebox('',f_wl('无厂商信息!'),0,0)
//		end if
//	case 'bz' 
//		f_GetFileOpenName ( 'hello', l_pathname,l_filename,'','')
//		if not isnull(l_filename) then
//			this.setitem(this.getrow(),'bz',l_filename)
//			this.triggerevent(itemchanged!)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//			if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if
//case 'codes'
//		open(w_grjb_query)
//		l_codes=message.stringparm
//		if l_codes<>'' then
//			select names into :l_names from clerk where codes=:l_codes;
//			this.settext(l_codes)
//			this.triggerevent(editchanged!)
//			this.triggerevent(itemchanged!)
//		end if
//		
//end choose
//return 1


end event

event itemerror;
//////出错,恢复原值
//出错,恢复原值
boolean l_true
string l_outdate,l_message,l_datatype,l_styles
long l_return


if this.getrow()=0 then return
l_datatype=f_edit_datatype(this,this.getcolumnname())
if (l_datatype='long' or Mid(l_datatype,1,7)='decimal') and not isnumber(this.gettext()) then
	
	l_styles=f_edit_styles(this,this.getcolumnname())
	if l_styles='edit' then
		i_row=dw_1.getrow()
		i_columnname=dw_1.getcolumnname()
		//f_messagebox('',f_wl('请输入数字'),0,0)
		this.settext('0')
		this.selecttext(1,1)
		this.setfocus()
		i_itemchtrue=true
		//this.triggerevent(editchanged!)
		//this.triggerevent(itemchanged!)
		return 1
	end if
end if

if i_itemchangedrun=0 then 
	//this.triggerevent(itemchanged!)
	return 1
end if


setnull(l_message)
l_message=dw_1.describe(dw_1.getcolumnname()+'.validationmsg')
//itemchanged 出错
if i_itemchanged='failure' then
	return 1
else
	i_itemchanged='failure'
	i_row=dw_1.getrow()
	i_columnname=dw_1.getcolumnname()
end if
//
l_return=f_itemerror(this,data)
if l_return=0 then i_itemchanged='success'
return 1

end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
return  l_temp
end event

event other;

/*屏蔽mouse滚轮*/
if wparam=4287102976 or wparam=7864320  or message.number=522 then
	return 1
end if
end event

event retrieveend;
//dw_button.post event ue_init(0)

/*不是新加记录*/
long l_init=0,l_priceflags
string ls_window

i_newrow=0
i_auto=0
i_newmodify=1

ls_window=classname(dw_1.getparent())

if this.getrow()>0 and dw_browse.visible=false  then

	if f_field(this,is_chfield,'isvalid')=0 then
		if this.getitemstring(this.getrow(),is_chfield)='1' or this.getitemstring(this.getrow(),is_chfield)='2' then
			//cb_modify.enabled=false
			i_newmodify=0
		else
			//cb_modify.enabled=true
		end if
		
		
		l_priceflags=0
		if ls_window='w_make' then  //isvalid(w_make) then
			l_priceflags=1
		elseif  ls_window='w_h2oin' then  //isvalid(w_h2oin) then
			w_h2oin lw_h2oin
			lw_h2oin=dw_1.getparent()
			if lw_h2oin.i_kinds1=1 then
				l_priceflags=1
			end if
		elseif ls_window='w_h2ort' then   // isvalid(w_h2ort) then
			w_h2ort lw_h2ort
			lw_h2ort=dw_1.getparent()
			if lw_h2ort.i_kinds1=1 then
				l_priceflags=1
			end if	
		elseif  ls_window='w_trunf' then  //isvalid(w_trunf) then
			w_trunf lw_trunf
			lw_trunf=dw_1.getparent()
			if lw_trunf.i_js=1 then
				l_priceflags=1
			end if
		end if
		
		if  l_priceflags=1 and g_flags1=1 and Pos(','+g_bz1+',',',MC,')>0 then
			//cb_modify.enabled=true
			i_newmodify=1
		elseif cb_modify.enabled=false then
			/*不允许修改表身*/
			
		end if
		l_init=1
	end if
	
	if f_field(this,'flags','isvalid')=0 and cb_send.visible=true and i_fwq=1 then
		if this.getitemnumber(this.getrow(),'flags')=0 then
			cb_send.enabled=true
		else
			cb_send.enabled=false
		end if
		l_init=1
	end if
	
	if this.trigger event ue_retrieveend2()=1 then
		l_init=1
	end if
	
	if l_init=1 then 
		/*060930 被ue_init中的wf_bsave覆盖 0->2不动*/
		
		dw_button.trigger event ue_init(0)
		//dw_button.tpost event ue_init(0)
	end if
end if

wf_retrieveend2()

end event

event itemfocuschanged;post SelectText(1, 32766)
end event

event getfocus;if i_lastfocus=this then return 
i_lastfocus=this
end event

type dw_browse from datawindow within w_couple_parent_sheet_derek
event enterastab pbm_dwnprocessenter
event type long ue_losefocus ( )
boolean visible = false
integer x = 1737
integer y = 388
integer width = 1623
integer height = 1272
integer taborder = 310
boolean bringtotop = true
boolean titlebar = true
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "runsa.ico"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enterastab;

this.triggerevent(doubleclicked!)
return 1
end event

event type long ue_losefocus();
if i_browse=2 then return 0

dw_browse.visible=false
//dw_1.enabled=false
//f_displayonly(dw_1,'displayonly') 
//dw_2.enabled=false
//f_displayonly(dw_2,'displayonly') 
cb_add.enabled=true
cb_save.enabled=false
cb_delete.enabled=true
cb_cancel.enabled=false
cb_prior.enabled=true
cb_next.enabled=true
cb_first.enabled=true
cb_last.enabled=true
cb_query.enabled=true
cb_browse.enabled=true
cb_print.enabled=true
cb_modify.enabled=true
cb_detail.enabled=true
cb_browseall.enabled=true
pb_add.enabled=false
cb_exit.enabled=true
dw_1.setfocus()
wf_bsave(true,'')
dw_1.triggerevent(retrieveend!)

dw_button.trigger event ue_init(0)

return 0
end event

event losefocus;
if i_browse=2 then return 0

//dw_browse.visible=false
////dw_1.enabled=false
//,'displayonly') 
////dw_2.enabled=false
//f_displayonly(dw_2,'displayonly') 
//cb_add.enabled=true
//cb_save.enabled=false
//cb_delete.enabled=true
//cb_cancel.enabled=false
//cb_prior.enabled=true
//cb_next.enabled=true
//cb_first.enabled=true
//cb_last.enabled=true
//cb_query.enabled=true
//cb_browse.enabled=true
//cb_print.enabled=true
//cb_modify.enabled=true
//cb_detail.enabled=true
//cb_browseall.enabled=true
//pb_add.enabled=false
//cb_exit.enabled=true

if dw_button.visible=true then 
	dw_button.post event ue_init(0)
end if
//dw_1.setfocus()
cb_browse.post event ue_focus()
end event

event rowfocuschanged;//if i_browse=1 then return
//if dw_browse.getrow()>0 then
//	setnull(i_nos)
//	i_nos=dw_browse.getitemstring(dw_browse.getrow(),'cnos')
//	dw_1.retrieve(i_nos)
//	dw_1.scrolltorow(1)
//	i_browse=2
//	dw_1.triggerevent(rowfocuschanged!)
//	i_browse=0
//end if


end event

event doubleclicked;
long l_trigger=1
if this.rowcount()=0 then  return
//if dw_1.rowcount()=0 then 
	if dw_1.getrow()>0 and dw_1.rowcount()>0 and this.getrow()>0 then
		if f_field(dw_1,'nos','isvalid')=0 and  f_field(this,'nos','isvalid')=0 then
			if dw_1.getitemstring(dw_1.getrow(),'nos')=this.getitemstring(this.getrow(),'nos') then
				l_trigger=0
			end if
		end if
		
	end if
	if l_trigger=1 then
		this.triggerevent(rowfocuschanged!)
	end if
//elseif this.rowcount()=1 then 
//	this.triggerevent(rowfocuschanged!)
//end if

this.trigger event  ue_losefocus()
end event

event rbuttondown;//this.triggerevent(doubleclicked!)
//return 1

//this.triggerevent(doubleclicked!)
string l_columnname


if this.getrow()>0 then
	//i_browse=2
	comsleep(500)
	i_sort=f_wgz_zg_sort(this,'')
	//i_browse=0
	if i_sort<>'' then
		this.triggerevent(rowfocuschanged!)
		this.setsort(i_sort)
	end if
else
	this.triggerevent(doubleclicked!)
end if




return 1
end event

event other;

if wparam=61536 then
	this.trigger event ue_losefocus()
elseif wparam=61587 or wparam=61539 then
	return 1
end if
end event

event dberror;
int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
this.setfocus()
i_itemchanged='failure'
i_itemfocus='success'
i_row=row
this.triggerevent(itemfocuschanged!)
i_itemfocus='failure'
f_setcolumn(this,f_updatetable(this),i_columnname)
return  l_temp
end event

type dw_browseall from datawindow within w_couple_parent_sheet_derek
event keydown pbm_dwnkey
boolean visible = false
integer x = 183
integer y = 312
integer width = 2432
integer height = 900
integer taborder = 230
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keydown;if keydown(keyescape!) then
	i_esc=1
	this.triggerevent(losefocus!)
end if
end event

event losefocus;this.visible=false
//dw_1.enabled=false
//f_displayonly(dw_1,'displayonly') 
//dw_2.enabled=false
//f_displayonly(dw_2,'displayonly') 
cb_add.enabled=true
cb_save.enabled=false
cb_delete.enabled=true
cb_cancel.enabled=false
cb_prior.enabled=true
cb_next.enabled=true
cb_first.enabled=true
cb_last.enabled=true
cb_query.enabled=true
cb_browse.enabled=true
cb_print.enabled=true
cb_modify.enabled=true
cb_detail.enabled=true
cb_browseall.enabled=true
pb_add.enabled=false
cb_exit.enabled=true
end event

event doubleclicked;this.triggerevent(losefocus!)

end event

type sle_1 from singlelineedit within w_couple_parent_sheet_derek
boolean visible = false
integer x = 18
integer y = 16
integer width = 3497
integer height = 1644
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_couple_parent_sheet_derek
integer width = 3497
integer height = 260
integer taborder = 420
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_button from datawindow within w_couple_parent_sheet_derek
event ue_init ( long l_flags )
event ue_mousemove pbm_mousemove
event ue_keydown pbm_dwnkey
event ue_input ( )
boolean visible = false
integer width = 3584
integer height = 228
integer taborder = 120
string dataobject = "d_wgz_button"
boolean border = false
boolean livescroll = true
end type

event ue_init(long l_flags);

/*按钮初始化 多语言未处理 l_flags 1初始化*/
long l_i=0,ld_y[],l_x,l_y,l_true=0,l_k=0
string l_field,l_filename,l_pic,l_chflags='',ls_chflags,ls_refer=''

if not isvalid(this) then
	return
end if

if l_flags=2 then
else
	//dw_2.SetRowFocusIndicator ( Hand! )
	cb_cancel.enabled=false
	if cb_save.enabled=true and cb_save.visible=true then
		wf_bsave(false,'')
		cb_cancel.enabled=true
	elseif cb_detail.enabled=false and cb_detail.visible=true then
		wf_bsave(false,'')
	else
		wf_bsave(true,'')
	end if
	if (cb_save.enabled=false or cb_save.visible=false) and dw_button.visible=true then
	//if cb_save.enabled=false or cb_save.visible=false then
		cb_delete.enabled=false
	end if
end if

if l_flags=0 and dw_button.visible=false then
	return
end if

if not isvalid(dw_button) then
	return
end if

if g_tbp=1 then  // pos(f_maintain('easymenu','string'),'TBP')>0 then
else
	return 
end if

if this.rowcount()=0 then
	this.insertrow(0)
end if


//shett有问题
if  f_zg_w_deal(parent,'issheet')=1 then
else
	//if parent.y<>80 then parent.y=80
end if


if id_buttoncount<17 then
	for l_i=id_buttoncount+1 to 17
		this.modify('t_other'+string(l_i - 14)+'.text="'+''+'"')		
		
	next
end if

if dw_button.visible=false then
	/*移动界面 */
	//parent.y=0
	
	parent.visible=false
	parent.setredraw(false)
	dw_button.visible=true
	sle_2.visible=false
	ld_y[1]=st_1.y
	ld_y[2]=st_info.y
	f_w_language(parent,'y=1,add='+string(dw_button.height + 20)+',allcon,')
	dw_button.x=dw_1.x
	dw_button.y=5  //1
	dw_button.width=dw_button.width + 250*long((id_buttoncount -  13)/2)
	st_1.y=ld_y[1]
	st_info.y=ld_y[2]
	
	cb_detail.y=9000   //cb_detail.y * 4
	cb_detail.taborder=0
	for l_i=1 to id_buttoncount
		if id_button[l_i]<>'tool' and id_button[l_i]<>'view' then
			pb_button[l_i].y=9000   //pb_button[l_i].y * 4
			cb_button[l_i].y=9000   //cb_button[l_i].y * 4
			/*taborder=0*/
			pb_button[l_i].taborder=0
			cb_button[l_i].taborder=0
		end if
	next
	

	dw_view.x=dw_button.x+long(dw_button.describe('b_view.x'))
	dw_view.y=dw_button.y+long(dw_button.describe('b_view.height'))
				
	l_x=9000
	l_y=9000

	
	for l_k=1 to 2
		/*l_k=1获取最左上位置*/
		if l_k=2 then
			if l_x=9000 and l_y=9000 then
				i_view=0
			end if
			l_y=l_y - (dw_view.y + 20)
			l_x=l_x - (dw_view.x + 20)
			
			
		end if
		
		if id_spbcount>0 and upperbound(spb_button)>0 then
			for l_i=1 to id_spbcount
				if isvalid(spb_button[l_i]) then
					if l_k=1 then
						l_y=min(l_y,spb_button[l_i].y)
						l_x=min(l_x,spb_button[l_i].x)
					else
						spb_button[l_i].x=spb_button[l_i].x - l_x
						i_viewwidth=max(i_viewwidth , spb_button[l_i].x + spb_button[l_i].width)
						
						spb_button[l_i].y=spb_button[l_i].y - l_y + 9000
					end if				
				end if
			next
		end if
		
		if id_slbcount>0 and upperbound(slb)>0 then
			
			for l_i=1 to id_slbcount
				if isvalid(slb[l_i]) then
					if l_k=1 then
						l_y=min(l_y,slb[l_i].y)
						l_x=min(l_x,slb[l_i].x)
					else
						slb[l_i].x=slb[l_i].x - l_x
						i_viewwidth=max(i_viewwidth , slb[l_i].x + slb[l_i].width)
						slb[l_i].y=slb[l_i].y - l_y + 9000
					end if
				end if
			next
		end if
	
		
		
		if id_scbcount>0 and upperbound(scb)>0  then
			for l_i=1 to id_scbcount
				if l_k=1 then
					l_y=min(l_y,scb[l_i].y)
					l_x=min(l_x,scb[l_i].x)
				else
					scb[l_i].x=scb[l_i].x - l_x
					i_viewwidth=max(i_viewwidth , scb[l_i].x + scb[l_i].width)
					scb[l_i].y=scb[l_i].y - l_y + 9000
				end if
			next
		end if
	
		if id_stcount>0 and upperbound(st)>0  then
			for l_i=1 to id_stcount
				if l_k=1 then
					l_y=min(l_y,st[l_i].y)
					l_x=min(l_x,st[l_i].x)
				else
					st[l_i].x=st[l_i].x - l_x
					i_viewwidth=max(i_viewwidth , st[l_i].x + st[l_i].width)
					st[l_i].y=st[l_i].y - l_y + 9000
				end if				
			next
		end if
		
	
		if id_slecount>0 and upperbound(sle)>0  then
			for l_i=1 to id_slecount
				if l_k=1 then
					l_y=min(l_y,sle[l_i].y)
					l_x=min(l_x,sle[l_i].x)
				else
					sle[l_i].x=sle[l_i].x - l_x
					i_viewwidth=max(i_viewwidth , sle[l_i].x + sle[l_i].width)
					sle[l_i].y=sle[l_i].y - l_y + 9000
				end if				
			next
		end if
		
		if id_maskcount>0 and upperbound(smask)>0  then
			for l_i=1 to id_maskcount
				if l_k=1 then
					l_y=min(l_y,smask[l_i].y)
					l_x=min(l_x,smask[l_i].x)
				else
					smask[l_i].x=smask[l_i].x - l_x
					i_viewwidth=max(i_viewwidth , smask[l_i].x + smask[l_i].width)
					smask[l_i].y=smask[l_i].y - l_y + 9000
				end if
			next
		end if
	next
	
	
	dw_view.width=i_viewwidth - dw_view.x + 100
	/*定位与多色处理*/
	if sle_pos.visible=false then

	end if
	
	if id_buttoncount2>0 then
		for l_i=1 to id_buttoncount2
			pb_button2[l_i].y=9000   //pb_button2[l_i].y*4
			pb_button2[l_i].taborder=0
		next
	end if
	
	pb_add.y=pb_add.y*6
	cb_delete.y=cb_delete.y*6
	parent.setredraw(true)
	parent.visible=true
	i_parm.sheet=f_zg_w_deal(parent,'')
end if

//
/**/

//if pb_button[l_i]=cb_save and cb_save.enabled=false then
////						wf_bsave(true)
//					elseif pb_button[l_i]=cb_cancel and cb_cancel.enabled=false then
//						wf_bsave(true)
//					elseif pb_button[l_i]=cb_modify and cb_modify.enabled=false then
//						wf_bsave(false)
//					elseif pb_button[l_i]=cb_browse and cb_browse.enabled=false then
//						wf_bsave(false)
//					elseif pb_button[l_i]=cb_detail and cb_detail.enabled=false then
//						wf_bsave(false)
//	


for l_i=1 to id_buttoncount
	l_field=id_button[l_i]
	
	
	if id_buttonpic[l_i]<>'' then
		l_pic=id_buttonpic[l_i]
	else
		l_pic=id_button[l_i]
	end if
				
				
	if l_i=20 then
		l_i=l_i
	end if
	if pb_text[l_i]<>'' then
		l_field=pb_text[l_i]
	end if
		/*debug*/
		
//		if isvalid(pb_button[l_i]) then
//			pb_button[l_i].taborder=0
//		end if
//		if isvalid(cb_button[l_i]) then
//			cb_button[l_i].taborder=0
//		end if
		
		if pb_button[l_i]=cb_check then
			l_i=l_i
			//lb_true=cb_check.visible
			//lb_true=cb_check.visible
		end if
		
		if id_button[l_i]='tool' then
			if id_buttoncount2=0 or dw_browse.visible=true then
				l_true=0
			else
				l_true=1
			end if
		elseif id_button[l_i]='view'    then
			if i_view=1 and dw_browse.visible=false then
				l_true=1
			else
				l_true=0
			end if
		elseif (cb_delete.visible=true and cb_delete.enabled=true) &
					and  cb_button[l_i]=pb_delete and ib_deletenos=true then
			l_true=1
			
		elseif (cb_button[l_i].visible=true and cb_button[l_i].enabled=true) &
					or  (pb_button[l_i].visible=true and pb_button[l_i].enabled=true) &
					or (pb_button[l_i]=cb_modify and cb_modify.visible=false &
						and cb_button[l_i].visible=false and cb_detail.visible=true &
						and i_newmodify=1 and dw_browse.visible=false and Pos(gs_admit,',modify=1,')=0) then
			l_true=1
		else
			l_true=0
		end if
	
		
		if l_true=1 then
			if pb_text[l_i]='' then	
				l_filename=''
			//	if fileexists(l_pic+'.'+i_ext) then
					l_filename=l_pic+'.'+i_ext
//				elseif fileexists(l_pic+'.'+'bmp') then
//					l_filename=l_pic+'.'+'bmp'
//				end if
				
				if i_fwq=1 then
					if l_filename='check.jpg' then
						l_filename='refer.jpg'
					elseif l_filename='check1.jpg' then
						l_filename='refer1.jpg'
					end if
				end if
				
			
					/*对于确认反确认的处理*/
					if l_filename='check.jpg' then
						if dw_1.getrow()>0 then
							if is_chfield<>'' then
								ls_chflags=is_chfield
							else
								ls_chflags='chflags'
							end if
							
							
							if f_field(dw_1,ls_chflags,'isvalid')=0 then
								l_chflags=dw_1.getitemstring(dw_1.getrow(),ls_chflags)
								if l_chflags='1' then
									l_filename='discheck.jpg'
								elseif l_chflags='2' then
									l_filename='disinvalid.jpg'
								end if
							end if
						end if
					end if
					
					/*对于提交的处理*/
					if l_filename='refer.jpg' or l_filename='refer1.jpg' then
						if dw_1.getrow()>0 then
							ls_refer='flags'
							if f_field(dw_1,ls_refer,'isvalid')=0 then
								ls_refer=string(dw_1.getitemnumber(dw_1.getrow(),ls_refer))
								if ls_refer='0' or isnull(ls_refer) then
									l_filename='refer.jpg'
								else
									l_filename='refer1.jpg'
								end if
							end if
						end if
					end if
					
					
			//	if fileexists(l_filename) then
					this.modify('p_'+l_field+'.filename="'+l_filename+'"')			
					this.modify('b_'+l_field+'.filename="'+l_filename+'"')			
//				else
//					this.modify('p_'+l_field+'.text="'+pb_button[l_i].text+'"')			
//				end if
			else
				this.modify('t_'+l_field+'.text="'+pb_button[l_i].text+'"')					
				
			end if
		else
			if pb_text[l_i]='' then
				l_filename=''
			//	if fileexists(l_pic+'1.'+i_ext) then
					l_filename=l_pic+'1.'+i_ext  //id_button[l_i]
//				elseif fileexists(l_pic+'1.'+'bmp') then
//					l_filename=l_pic+'1.'+'bmp'   //id_button[l_i]
//				end if
				
				if i_fwq=1 then
					if l_filename='check.jpg' then
						l_filename='refer.jpg'
					elseif l_filename='check1.jpg' then
						l_filename='refer1.jpg'
					end if
				else
				
					
					
				end if


			//	if fileexists(l_filename) then
					this.modify('p_'+l_field+'.filename="'+l_filename+'"')	
					this.modify('p_'+l_field+'.visible="1"')	
					this.modify('b_'+l_field+'.visible="0"')	
//				else
//					this.modify('p_'+l_field+'.text="'+''+'"')		
//				end if
			else
				this.modify('t_'+l_field+'.text="'+''+'"')					
			end if
		end if
				
next

cb_check.y=9000

//if isvalid(this)  then
//	if dw_input1.visible or dw_input2.visible or dw_input3.visible   or dw_input4.visiblethen
//		
//	elseif i_dwfocus='dw_2' then
//		dw_2.setfocus()
//	else
//		dw_1.setfocus()
//	end if
//end if
int li_y=9000
cb_modify.y=li_y
pb_modify.y=li_y
cb_add.y=li_y
pb_add.y=li_y
cb_delete.y=li_y
pb_delete.y=li_y
cb_save.y=li_y
pb_save.y=li_y
cb_cancel.y=li_y
pb_cancel.y=li_y

return 
end event

event ue_mousemove;

if not(abs(xpos - i_px)>5 or  abs(ypos - i_py)>5) then return 1
i_px=xpos;i_py=ypos

wf_mousemove(this.GetObjectAtPointer(),'button')
return 1
end event

event ue_keydown;

long l_i
string l_tt,l_field
if this.visible=true then
	choose case true
	case keydown(keyleftarrow!),keydown(keyrightarrow!)
		l_i=wf_bactive('button')

		if keydown(keyrightarrow!) then
			
			if l_i=id_buttoncount - 1 then
				l_i=id_buttoncount - 1
			end if
			if l_i=id_buttoncount + 1 then
				l_i=0
			end if
				do while l_i<id_buttoncount
					l_i++
					wf_mousemove('p_'+id_button[l_i],'button')
					if dw_button.describe('b_'+id_button[l_i]+'.visible')='1' then
						exit
					end if
				loop
		else
			if l_i=id_buttoncount + 1 then
				l_i=id_buttoncount
			end if
			do while l_i>1
				l_i=l_i - 1
				wf_mousemove('p_'+id_button[l_i],'button')
				if dw_button.describe('b_'+id_button[l_i]+'.visible')='1' then
					exit
				end if
			loop
		end if
		
		return 1
	case keydown(keydownarrow!)
		if dw_button.describe('b_view.visible')='1' then
			if dw_view.visible=true then
				id_yx=f_zg_view_deal(id_view,id_view_yx,id_viewcount,0)
				return 1
			else
				this.triggerevent(clicked!)
				id_yx=f_zg_view_deal(id_view,id_view_yx,id_viewcount,0)
				return 1
			end if
		elseif  dw_button.describe('b_tool.visible')='1' then
			if dw_button2.visible=true then
			//	id_yx=f_zg_view_deal(id_view,id_xh,id_viewcount,0)
			//	return 1
			else
				this.triggerevent(clicked!)
				if dw_button2.visible=true then
					dw_button2.setfocus()
				end if
				//id_yx=f_zg_view_deal(id_view,id_xh,id_viewcount,0)
				return 1
			end if
		end if

		
	case else
end choose	
end if

return 1
end event

event ue_input();

if dw_button2.visible=true then 
	
	dw_button2.visible=false
	wf_mousemove('','button')
elseif dw_view.visible=true then 
	dw_view.visible=false
	dw_view.trigger event ue_init(0)
	wf_mousemove('','button')
end if


end event

event clicked;

long l_i,l_exit=0,l_handle
string l_field,l_nos,l_table
long l_debug=0

l_debug=0

if l_Debug=1 then f_wgz_errorlog('u2sale click 001')

if isvalid(w_messagebox) then return 
	
if l_Debug=1 then f_wgz_errorlog('u2sale click 011')

for l_i=1 to id_buttoncount
	l_field=id_button[l_i]
	if pb_text[l_i]<>'' then l_field=pb_text[l_i]
	
	if l_Debug=1 then f_wgz_errorlog('u2sale click 021'+' '+pb_text[l_i])
	
	//f_messagebox('',left(this.GetObjectAtPointer(),2+len(l_field)),0,0)
	//if left(this.GetObjectAtPointer(),2+len(l_field)) = 'b_'+l_field then
	if this.describe('b_'+l_field+'.visible')='1' then
		if (pb_text[l_i]='' and this.describe('b_'+id_button[l_i]+'.filename')='1.'+i_ext) or &
				(pb_text[l_i]<>'' and this.describe('t_'+l_field+'.text')='')  then
			/*disable*/
			if l_Debug=1 then f_wgz_errorlog('u2sale click 021'+' '+pb_text[l_i]+'  disable')
		elseif id_button[l_i]='tool' then
			if dw_button2.visible=true then
				dw_button.setfocus()
			 	dw_button2.visible=false
			
			else
				dw_button2.x=dw_button.x+long(dw_button.describe('b_tool.x'))
				dw_button2.y=dw_button.y+long(dw_button.describe('b_tool.height')) - 15
				dw_button2.trigger event ue_init()
				st_button.visible=false
			end if
		elseif id_button[l_i]='view' then
			if dw_view.visible=true then
				dw_view.visible=false
				dw_view.trigger event ue_init(0)
			else
				st_button.visible=false
				dw_view.trigger event ue_init(1)
			end if	
		elseif (pb_button[l_i].visible=true and pb_button[l_i].enabled=true) then
			if id_button[l_i]='exit' then l_exit=1
			i_columnname=''
			pb_button[l_i].triggerevent(clicked!)
			
//			if pb_button[l_i]=pb_modify then
//				if pb_save.enabled=true and pb_save.visible=true then
//					if dw_1.getrow()>0 and f_field(dw_1,'nos','isedit')=0 then
//						l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
//						l_table=f_updatetable(dw_1)
//						f_nos_modify_check(l_table,l_nos,'insert')   ///reset')
//					end if
//				end if
//			elseif pb_button[l_i]=pb_save or pb_button[l_i]=pb_cancel then
//				if not (pb_save.enabled=true and pb_save.visible=true) then
//					if dw_1.getrow()>0 and f_field(dw_1,'nos','isedit')=0 then
//						l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
//						l_table=f_updatetable(dw_1)
//						f_nos_modify_check(l_table,l_nos,'')   ///reset')
//					end if
//				end if
//			end if
			
			if l_exit=1 then
				return
			else
	
				if isvalid(this) then 	this.post event ue_init(0)
		
				//end if
				/*debug*/
			end if
			exit
		elseif pb_button[l_i]=cb_modify and (cb_modify.visible=false or cb_modify.enabled=false) then
			i_columnname=''
			cb_detail.triggerevent(clicked!)
			if isvalid(this) then 	
				this.post event ue_init(0)
				exit
			end if
			
		elseif (cb_button[l_i].visible=true and cb_button[l_i].enabled=true) then
			if id_button[l_i]='exit' then l_exit=1
			i_columnname=''
			
			if l_Debug=1 then f_wgz_errorlog('u2sale click 021'+' '+pb_text[l_i]+'  cb_button click')
			
			cb_button[l_i].triggerevent(clicked!)
			
//			if cb_button[l_i]=cb_modify then
//				if (pb_save.enabled=true and pb_save.visible=true) or (cb_save.enabled=true and cb_save.visible=true) then
//					if dw_1.getrow()>0 and f_field(dw_1,'nos','isedit')=0 then
//						l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
//						l_table=f_updatetable(dw_1)
//						f_nos_modify_check(l_table,l_nos,'insert')   ///reset')
//					end if
//				end if
//			elseif cb_button[l_i]=cb_save or cb_button[l_i]=cb_cancel then
//				if not ((pb_save.enabled=true and pb_save.visible=true) or (cb_save.enabled=true and cb_save.visible=true)) then
//					if dw_1.getrow()>0 and f_field(dw_1,'nos','isedit')=0 then
//						l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
//						l_table=f_updatetable(dw_1)
//						f_nos_modify_check(l_table,l_nos,'')   ///reset')
//					end if
//				end if
//			end if
			
			if l_exit=1 then
				return
			else

				if isvalid(this) then this.post event ue_init(0)

			end if
			exit
		elseif cb_delete.visible=true and cb_delete.enabled=true and cb_button[l_i]=pb_delete and ib_deletenos then
			cb_delete.triggerevent(clicked!)
			this.post event ue_init(0)
			exit
		end if
	
	end if
next

if l_Debug=1 then f_wgz_errorlog('u2sale click 061')
return





end event

event losefocus;

st_button.visible=false
/*所有按扭变成图片*/
long l_i
if dw_button2.visible=false and dw_view.visible=false then
	l_i=wf_bactive('button')
	if l_i>0 then
		wf_mousemove('','button')
	end if
end if
end event

event rbuttondown;
if fileexists('zx_00.pbl') then
	
	if cb_modify.enabled=false then
		f_messagebox('','nomodify',0,0)
	end if
	
	if cb_modify.visible=false then
		f_messagebox('','novisible',0,0)
	end if
	s_ps.dw_1=this
	open(w_print_setting)

end if
end event

event other;
/*屏蔽mouse滚轮*/
if wparam=4287102976 or wparam=7864320 or message.number=522 then
	return 1
end if

end event

type st_info from statictext within w_couple_parent_sheet_derek
event ue_init ( string ls_text,  long l_x,  long l_y )
boolean visible = false
integer y = 1928
integer width = 3246
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
long textcolor = 16711680
long backcolor = 31254515
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

event ue_init(string ls_text, long l_x, long l_y);
//if mid(this.GetObjectAtPointer(),1,7)='colthno' then
//	st_info.trigger event ue_init('双击输入切换到点击产品',&
//			this.pointerx()+this.x+160,this.pointery()+this.y+20)
//end if

st_info.text=f_wl(ls_text)
st_info.x=l_x
st_info.y=l_y
st_info.bringtotop=true
st_info.visible=true
st_info.width=35*Len(ls_text)	

return 
end event

type dw_2 from datawindow within w_couple_parent_sheet_derek
event type long ue_words ( )
event enterastab pbm_dwnprocessenter
event keydown pbm_dwnkey
event ue_select ( )
event type long ue_key ( keycode key,  unsignedinteger keyflags )
event type long ue_rowfocuschanged ( long currentrow )
event ue_rowchanged2 ( )
event type long ue_afterchange ( long l_row,  string l_columnname,  string ls_value )
event type string ue_checknull ( long row )
event ue_setmodify ( boolean ab_modify )
event type integer ue_post ( string as_varname,  integer ai_value )
event type string ue_getlistsql ( string ls_dwoname )
event ue_itemchanged pbm_dwnitemchange
integer y = 652
integer width = 3451
integer height = 1252
integer taborder = 140
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

event ue_words;if not this.getrow()>0 then return 0
if this.describe(this.getcolumnname()+'.edit.displayonly')='yes' then return 0
string l_pathname,l_filename
if dw_words.rowcount()=0 then
		dw_words.retrieve()
end if
	commit;
if dw_words.rowcount()>0 then
		dw_words.visible=true
		dw_words.setfocus()
end if
return 0
end event

event enterastab;Send(Handle(this),256,9,0)
return 1
end event

event keydown;string ls_errtext
string ls_empty=''
if pb_save.enabled=true then 
	if keyflags=2 and key=keyi! then 
		//ib_checkrow=false
		ls_errtext=u_derek.u_dd.uf_import(this,is_dwupdate_detail,getrow(),getcolumnname(),clipboard())
		//ib_checkrow=true
		if ls_errtext<>'' then 
			f_messagebox('','未通过验证项:'+ls_errtext,0,0)
		end if
	end if
	
end if

if keyflags=2 and key=keyo! then 
	//run('cmd')
	u_derek.uf_saveas_lc(this,'')
end if

long l_return=0,l_column1,l_column2

if i_keyflags=0 then return 0
if i_noclosequery=true then
	return
end if

i_fnkey=0

l_column1=this.getcolumn()
//f_messagebox('','001',0,0)
l_return=this.trigger event ue_key(key,keyflags)


if not isvalid(this)  then
	return
end if

//if i_itemchanged='failure' then
//	return 1
//end if


if l_return=0 then
//	if f_displayonly(this,'isdy')='0' then 
//		/*parent自动运行key,不用重复触发产生崩溃 2006-07-03*/
//		//parent.postevent(key!)
//		return 1
//	end if
  
	return 0
elseif l_return=2 then
	 /*上级自动运行 防止本级继续运行*/
	return 1
end if

if i_fnkey=1 and not isvalid(w_zg_nos_query) then
	
	//yield()

	if not isvalid(this) then return

	if dw_button.visible=true then 
		if i_noclosequery=false then
			dw_button.post event ue_init(0)
		end if
	end if
end if

l_column2=this.getcolumn()
if l_column1<>l_column2 then
	//this.post event ue_select()
end if

return l_return


end event

event ue_select();
string l_tps
if f_edit_styles(dw_2,dw_2.getcolumnname())='edit' then 
	l_tps=dw_1.SelectedText ( )
	if l_tps ='' then
		this.selecttext(1,100)
	end if
end if
end event

event type long ue_key(keycode key, unsignedinteger keyflags);
long l_column,l_i
i_rowcopy=0

i_nowkey=''

if keydown(keyshift!) then	
	i_rowcopy=1
	i_nowkey='shift'
end if

if keydown(keycontrol!) then	
	i_rowcopy=1
	i_nowkey='control'
end if

//if f_displayonly(this,'isdy')='0' then
//	//f_messagebox('','isdy',0,0)
//	i_rowcopy=0
//else
if i_prikey='control' then
	if keydown(keyA!) or keydown(keya!) then 
		l_i=1
		do while l_i<=dw_2.rowcount()
			dw_2.selectrow(l_i,true)
			l_i=l_i + 1
		loop
//	elseif keydown(keyV!) or keydown(keyv!) then 
//		//f_messagebox('','debug ctrl v',0,0)
//		this.triggerevent(itemchanged!)
		
	else
		//dw_2.selectrow(dw_2.getrow(),false)
	end if
	i_prikey=''
else
	i_prikey=i_nowkey
end if


if keydown(keyescape!) then 
//	if dw_browse.visible=true then
//		dw_browse.triggerevent("keydown")
//		return 1
//	elseif pb_cancel.enabled and pb_cancel.visible then 
//		
//		i_esc=1
//		if i_childclose=1 then
//			pb_cancel.trigger event clicked()
//			return 2
//		else
//			pb_cancel.trigger event clicked()
//			i_fnkey=1
//		end if
//		return 1
//	end if
   return 2
end if
if keydown(keyf1!) and pb_add.enabled and pb_add.visible and dw_button.visible=false then 
	i_fnkey=1
	pb_add.trigger event clicked()
	
	return 1
end if
if keydown(keyf2!) and pb_save.enabled and pb_save.visible then 
	if i_childclose=1 then
		pb_save.trigger event clicked()
		return 2
	else
		i_fnkey=1
		pb_save.trigger event clicked()
		
	end if
	return 1
end if
if keydown(keyf4!) and pb_modify.enabled and pb_modify.visible then 
	i_fnkey=1
	pb_modify.trigger event clicked()

	return 1
end if
if (keydown(keyf7!)) and pb_delete.enabled and pb_delete.visible  then
	i_fnkey=1
	pb_delete.trigger event clicked()
	
	return 1
end if 

if keydown(keydelete!) and pb_delete.enabled and pb_delete.visible  then
	if dw_2.isselected(dw_2.getrow())=true then
		i_fnkey=1
		pb_delete.trigger event clicked()
		//if dw_2.getrow()>0 then dw_2.selectrow(dw_2.getrow(),false)
		
		return 1
	end if
end if 


if keydown(keyf9!) then 
	dw_2.postevent(rbuttondown!)
	i_fnkey=1
	return 1
end if
//if  keydown(keyf12!) then
//	this.post event ue_words()
//	i_fnkey=1
//	return 1
//end if
//
if (keydown(KeyLeftArrow!) or keydown(KeyrightArrow!) or keydown(KeyupArrow!) or keydown(KeydownArrow!)) &
																												and g_lrarrow='yes' then
   i_trigger_itemchanged=true
	//this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	1
end if	
	
	
if keydown(KeyLeftArrow!)  then
	f_dw_arrow(this,'left',0)
	return 1
end if

if keydown(KeyrightArrow!) then
	i_setlastcolumn=false
	f_dw_arrow(this,'right',0)
	return 1
end if

if keydown(KeydownArrow!)  then
	f_dw_arrow(this,'down',0)
	return 1
end if

if keydown(KeyupArrow!)  then
	f_dw_arrow(this,'up',0)
	return 1
end if


/*控制不了*/
//if keydown(Keytab!)  then
//	if pb_save.visible=true and pb_save.enabled=true then
//		this.triggerevent(itemchanged!)
//		if i_itemchanged='failure' then 
//			return 1
//		else
//			return 0
//		end if
//	end if
//end if


//if f_displayonly(this,'isdy')='0' then
parent.post event key(key,keyflags)

return 0
end event

event type long ue_rowfocuschanged(long currentrow);return 0
end event

event ue_rowchanged2();



string l_colthno,l_backcolor,l_tps,ls_return=''
any l_any1,l_any2,l_any3
long l_i,newrow

newrow=this.getrow()

choose case dw_1.dataobject
	case 'd_u2pack_apack'   //,'d_cnfnma' 
	case else
		if dw_2.dataobject='d_zg_hp_input2_apack' then
		  if pb_save.enabled=true and pb_save.visible=true then
				f_zginput_size_control(this,'price','')
			end if
			
			if f_maintain('hpautosize','MSC=')<>'' and pb_save.enabled=false  then
			//	f_zg_hp_dw_headsize(dw_2,'')
			end if
			
		end if
end choose

//if newrow>0  and id_dw2fcount>0 then
//	if Pos(f_maintain('hpinputflags','string'),'tcolor,')>0 then
//		l_backcolor='~"16777215~~tif (getrow()=currentRow(),16777215,12639424)~"'
//		/*20080205  订补货bl配码货号复制出现箱数输入不能立刻更新 setredraw太多产生问题*/
//			for l_i=1 to id_dw2fcount
//				if this.describe(id_dw2field[l_i]+'.band')='detail' then 
//						l_tps=this.describe(id_dw2field[l_i]+'.background.color')
//						if pos(l_tps,'if (getrow()=currentRow(),16777215,12639424)')>0 then
//							exit
//						end if
//						
//						if id_dw2field[l_i]='nb3'  then  //'price6' then
//							l_i=l_i
//						end if
//						
//						
//						if l_tps<>'12639424' and l_tps<>'553648127'  then
//							l_tps=id_dw2field[l_i]+'.background.color='+l_backcolor
//							if f_field(this,id_dw2field[l_i],'isvisible')=0 then
//								
//								ls_return=this.modify(l_tps)
//								if ls_return<>'' then
//									f_messagebox('',ls_return+' ~r~n'+l_tps,0,0)
//								end if
//							end if
//						end if
//				end if
//			next	
//	end if
//
//end if
//


if is_keybfield<>'' then wf_add(is_keybfield)

//聚焦
if isvalid(this) then
	this.SelectText (1, 100)
end if

//
//
//
//
//string l_colthno,l_backcolor,l_tps,ls_return=''
//any l_any1,l_any2,l_any3
//long l_i,newrow
//
//newrow=this.getrow()
//
//choose case dw_1.dataobject
//	case 'd_u2pack_apack','d_cnfnma' 
//	case else
//		if dw_2.dataobject='d_zg_hp_input2_apack' and pb_save.enabled=true then
//			f_zginput_size_control(this,'price','')
//		end if
//end choose
//
//if newrow>0  and id_dw2fcount>0 then
//	if pos(f_maintain('hpinputflags','string'),'tcolor,')>0 then
//	 
//		if this.dataobject='d_zg_hp_input2_apack' then
//			l_colthno=this.getitemstring(newrow,'colthno')
//				
//			if l_colthno='' or isnull(l_colthno) then
//				l_backcolor='background.color=~'16777215~''
//			else
//				l_backcolor='background.color=~"16777215~~tif (colthno=~''+l_colthno+'~',16777215,12639424)~"'
//			end if	
//		else
//			l_backcolor='background.color=~"16777215~~tif (getrow()='+string(newrow)+',16777215,12639424)~"'
//		end if
//		this.setredraw(false)
//			for l_i=1 to id_dw2fcount
//				if this.describe(id_dw2field[l_i]+'.band')='detail' then 
//						l_tps=this.describe(id_dw2field[l_i]+'.background.color')
//						
//						if id_dw2field[l_i]='price6' then
//							l_i=l_i
//						end if
//						
//						if l_tps<>'12639424' and l_tps<>'553648127' then
//							l_tps=id_dw2field[l_i]+'.'+l_backcolor
//							if f_field(this,id_dw2field[l_i],'isvisible')=0 then
//								ls_return=this.modify(l_tps)
//								if ls_return<>'' then
//									f_messagebox('',ls_return+' ~r~n'+l_tps,0,0)
//								end if
//							end if
//						end if
//				end if
//			next	
//			this.setredraw(true)
//	end if
//
//end if
//
//
//
//if is_keybfield<>'' then wf_add(is_keybfield)
end event

event type string ue_checknull(long row);string ls_errtext,ls_title,ls_find
string ls_notnull[]
long i
long l_row
string ls_unique[]

u_derek.u_dd.getarray(is_dwnotnull_detail,ls_notnull[],',')
u_derek.u_dd.getarray(is_dwunique_detail,ls_unique[],',')

if getitemstatus(row,0,primary!)<>new! then
	for i=1 to upperbound(ls_notnull)
		if describe("Evaluate(~""+ls_notnull[i]+"~","+string(row)+")")='' then 
			ls_title=describe(ls_notnull[i]+'_t.text')
			ls_errtext+=ls_title+'不能为空!~r~n'
		end if
	next
	
	if ls_errtext<>'' then goto e
	
	//if u_derek.u_fun.uf_findarray(ls_unique[],ls_dwoname)>0 then
		for i=1 to upperbound(ls_unique[])
			if i<>1 then ls_find+='and '
	//		if ls_unique[i]=ls_dwoname then 
	//			ls_find+="string("+ls_unique[i]+",'')='"+data+"' "
	//		else
				//ls_find+=""+ls_unique[i]+"='"+string(dw_1.getitemstring(row,ls_unique[i]),'')+"' "
				ls_find+="lookupdisplay("+ls_unique[i]+")='"+string(getitemstring(row,ls_unique[i]),'')+"' "
	//		end if
		next
		
		//检查重复
		l_row=u_derek.u_dd.uf_findalike(this,ls_find,row,1)
		
		if l_row>0 then 
			ls_errtext="与第"+string(l_row)+"行记录重复!"
			goto e
		end if
		
	//end if
	
end if

e:
return ls_errtext
end event

event ue_setmodify(boolean ab_modify);long l_rowcount
long l_row
//boolean ib_insert=true
string ls_nos
string ls_errtext
boolean lb_wait

lb_wait=isvalid(w_wait)

l_rowcount=rowcount()
l_row=dw_1.getrow()
if l_row<=0 then return
ls_nos=string(dw_1.object.nos[l_row],'')
if ls_nos='' then return

//if dw_2.describe('nos.name')<>'!' then 
//	ls_errtext=dw_2.modify("nos.initial='"+ls_nos+"' ")
//	if ls_errtext<>'' then goto e
//end if
//
//if dw_2.describe('recno.name')<>'!' then 
//	ls_errtext=dw_2.modify("recno.initial='"+string(g_recno)+"' ")
//	if ls_errtext<>'' then goto e
//end if
//
// and fwd=:i_menutext

if ab_modify then 
	
	//使用自动新增空行
	if ib_insert then 
		if l_rowcount=0 then 
			pb_add.event clicked() //insertrow(0)
		else
			l_row=find("isRowNew() and (not isRowModified())",1,l_rowcount)
			if l_row=0 and pb_add.enabled=true then pb_add.event clicked() //insertrow(0)
		end if
	end if
else
	
	//使用自动删除空行
	if ib_insert then 
		if l_rowcount>0 then 
			setredraw(false)
			do while(1=1)
				l_row=find("(not isRowModified()) and isRowNew()",1,rowcount())
				if l_row<=0 then exit
				if l_row>0 then deleterow(l_row)
			loop
			setredraw(true)
		end if
	end if
end if

return

//e:
//if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
//rollback;
//if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
//if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
//if lb_wait=false then u_derek.closewait()
//return 
end event

event type int ue_post(string as_varname, integer ai_value);
choose case as_varname
	case 'setrow'
		if ai_value<>getrow()  then //不<>当前行  
			if accepttext()<>-1 then setrow(ai_value)
		end if
end choose

return 0
end event

event ue_itemchanged;string ls_editstyle
ls_editstyle=string(dwo.edit.style)
choose case ls_editstyle
	case 'ddlb' 
		if string(dwo.ddlb.allowedit)='no' then //=yes/no
			if pos(string(dwo.values),'	'+data+'/')=0 then 
				return 1
			end if
		end if
end choose

//messagebox('',data)
//if ib_itemchanged=true then return 
//ib_itemchanged=true
//uf_post('itemchanged',0)
//post 
int li_ret
if describe('datawindow.querymode')='yes' then return 0
li_ret=event itemchanged(row,dwo,data)

//使用自动新增
if li_ret<>1 then 
	if getitemstatus(row,0,primary!)=new! then
		SetItemStatus(row,0,primary!,newModified!)
	end if
	event ue_setmodify(true)
	
end if 

return li_ret

end event

event dberror;int l_temp
l_temp=f_dberror(this,sqldbcode,sqlerrtext,sqlsyntax,row,i_columnname)
return  l_temp
end event

event doubleclicked;//if not this.getrow()>0 then return
////if not this.accepttext()=1 then return
//if f_displayonly(this,'isdy')='0' then return
//if pb_save.enabled=false or pb_save.visible=false  then return
//dw_input4  dw_input5 dw_input6 
//choose case  this.getcolumnname()
//	case 'colthno' 
//		if dw_input5.rowcount()=0 then 
//			dw_input5.retrieve()
//			f_displayonly(dw_input5,'displayonly')
//			commit;
//		end if
////   l_qdbno=this.getitemstring(this.getrow(),'qdbno')
////		if isnull(l_qdbno) then l_qdbno=''
////		if l_qdbno='' then
////			l_filter=" qdbno like '%'"
////		else
////			l_filter=" qdbno like '%"+l_qdbno+"%'"
////		end if
////		dw_input6.setfilter(l_filter)
////		dw_input6.filter()
//


//		if dw_input5.rowcount()>0 then
//			dw_input5.visible=true
//			dw_input5.setfocus()
//		else
//			f_messagebox('',f_wl('无货号色号信息!'),0,0)
//		end if
//	case 'birthday' ,'jcdate','htdate' 
//		openwithparm(w_calendar,&
//				this.getitemstring(this.getrow(),this.getcolumn()))
//		if message.stringparm<>'' then
//			this.setitem(this.getrow(),this.getcolumn(),message.stringparm)
//			this.triggerevent(editchanged!)
//			this.!)
//		end if

//end choose
//return 1





end event

event rowfocuschanging;
string ls_errtext

if pb_save.enabled=false then return 0

if ib_checkrow=false then return 0

if accepttext()=-1 then return 1
ls_errtext=event ue_checknull(currentrow)
if ls_errtext<>'' then 
	f_messagebox('',ls_errtext,0,0)
	return 1
end if

end event

event clicked;
string l_tt,l_nos
long i,l_endrow,l_init=0

//防止
if pb_save.enabled=true then 
	if GetColumnName()<>string(dwo.name) or row<>getrow() then 
		if accepttext()=-1 then 
			goto e
		end if
	end if
end if

//messagebox('',row)
//post event ue_post('setrow',row)

//this.setfocus()
if i_autochange=1 then goto e
if i_priorbutton='cb_add' and cb_save.visible=true  and cb_save.enabled=true  then
	if dw_1.accepttext()=1 then
	   if dw_1.modifiedcount()=0 then
			f_messagebox('','请先输入表头',0,0)
			goto e
		end if
	end if
end if

dw_button.trigger event ue_input()

//f_messagebox('','test',0,0)
/*头部自动选中*/
if pb_save.enabled=true and pb_save.visible=true and this.dataobject='d_zg_hp_input2_apack' then
	if Left(this.GetObjectAtPointer(),7)='recnoxh' then
		this.selectrow(this.getrow(),true)
		return
	end if
end if
//f_messagebox('','w001'+string(cb_modify.enabled),0,0)

if cb_modify.enabled=false and dw_1.getrow()>0 and pb_modify.visible=false and dw_button.visible=true then
	i_autochange=1
	if f_field(dw_1,'nos','isvalid')=0 then
		l_nos=dw_1.getitemstring(dw_1.getrow(),'nos')
	elseif f_field(dw_1,'colthno','isvalid')=0 then
		l_nos=dw_1.getitemstring(dw_1.getrow(),'colthno')
	end if
//	f_messagebox('','w01',0,0)
		if isnull(l_nos) then l_nos=''
		
		//if l_nos<>'' then
			if cb_save.enabled=true and cb_save.visible=true then
				dw_1.accepttext()
				if dw_1.modifiedcount()=0 and dw_1.deletedcount()=0 then
					cb_cancel.triggerevent(clicked!)
					l_init=1
				else
					cb_save.triggerevent(clicked!)
					l_init=1
				end if
				if cb_detail.visible=true and cb_detail.enabled=true then
					cb_detail.triggerevent(clicked!)
					l_init=1
				else
				//	if dw_button.visible=true then dw_button.post event ue_init(0)
				//	return 
				end if
			end if
			if dw_button.visible=true and l_init=1 then 
				dw_button.post event ue_init(0)
			end if
			
		//end if
	i_autochange=0
	return
end if

if not this.getrow()>0 then goto e


if i_rowcopy=1 then
	l_endrow=row
	this.triggerevent("keydown")
	if i_nowkey ='shift' and i_shiftrow<>0 then
		if i_prikey<>'control'	then 
			f_dw_select(this,1,this.rowcount(),false)
		end if
		
		if i_shiftrow<l_endrow then
			for i=i_shiftrow to l_endrow
				this.selectrow(i,true)
			next
		else
			for i=l_endrow to i_shiftrow
				this.selectrow(i,true)
			next
		end if
		i_prikey='shift'
	elseif i_nowkey='control' and i_shiftrow<>0 then
		this.selectrow(row,not this.isselected(row))
		i_shiftrow=row
		i_prikey='control'
	else
		if i_prikey='shift' or i_prikey='control' then
			f_dw_select(this,1,this.rowcount(),false)
			i_prikey=''
		end if
		if i_selectprirow<>row then 
			this.selectrow(i_selectprirow,false)
		end if
		this.selectrow(row,not this.isselected(row))
		i_selectprirow=row
		i_shiftrow=row
	end if

//	if this.IsSelected (row )=true then
//		this.selectrow(row,false)
//	else
//		this.selectrow(row,true)
//	end if
	return 0
else
	this.selectrow(0,false)
	
	i_shiftrow=row
	
end if

/*当前位置不能再提示错误*/
if (this.getcolumnname()=i_editchanged_column and this.getrow()=i_editchanged_row) &
																		or i_editchanged_column=''  then 
	return
end if

if (f_edit_styles(this,this.getcolumnname())<>'edit') &
		and (f_edit_styles(this,this.getcolumnname())<>'editmask') then 
	return
end if

if this.rowcount()>0 then
	i_trigger_itemchanged=true
	//this.triggerevent(itemchanged!)
	i_trigger_itemchanged=false
	if i_itemchanged='failure' then return	0
end if

return 
e:
return 1

end event

event getfocus;if pb_save.enabled=true then 
	event ue_setmodify(true)
end if
end event

event itemerror;return 1
end event

event rowfocuschanged;if ib_checkrow=false then return 0
return event ue_rowfocuschanged(currentrow)
end event

event itemfocuschanged;post SelectText(1, 32766)
end event

type u_derek from u_runsa_derek_v2 within w_couple_parent_sheet_derek descriptor "pb_nvo" = "true" 
end type

on u_derek.create
call super::create
end on

on u_derek.destroy
call super::destroy
end on

