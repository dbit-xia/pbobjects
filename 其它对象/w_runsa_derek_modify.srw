$PBExportHeader$w_runsa_derek_modify.srw
$PBExportComments$runsa_derek修改窗口
forward
global type w_runsa_derek_modify from w_single2_parent
end type
type st_2 from statictext within w_runsa_derek_modify
end type
type pb_lhbb from picturebutton within w_runsa_derek_modify
end type
type lb_1 from listbox within w_runsa_derek_modify
end type
type pb_import from picturebutton within w_runsa_derek_modify
end type
type pb_1 from picturebutton within w_runsa_derek_modify
end type
type ids_temp from datastore within w_runsa_derek_modify
end type
end forward

global type w_runsa_derek_modify from w_single2_parent
integer width = 3694
integer height = 2148
time i_priruntime = Time("16:35:32.534000")
time i_priruntimedw = Time("16:35:32.535000")
st_2 st_2
pb_lhbb pb_lhbb
lb_1 lb_1
pb_import pb_import
pb_1 pb_1
ids_temp ids_temp
end type
global w_runsa_derek_modify w_runsa_derek_modify

type variables
string is_header_columns='bz'
string is_columns=''
string is_nos,is_outdate
u_derek_dd u_dd
u_runsa_derek u_derek
u_derek_fun u_fun
u_runsa_derek_channel u_chnel
u_derek_excel u_excel
end variables

forward prototypes
public function integer wf_initdisplay2 (integer l_flags)
public subroutine wf_controls_pos ()
public subroutine wf_cbstate_modify (boolean ab_ismod)
public function long wf_query_detail ()
public function string wf_dwcreate (integer ai_column)
public function string wf_import (string as_filepath)
end prototypes

public function integer wf_initdisplay2 (integer l_flags);/*l_flags=0 第一次 1:运行中*/
if l_flags=0 then
//	id_slbcount++;slb[id_slbcount]=ddlb_classes
//	id_scbcount++;scb[id_scbcount]=cbx_ccd
//	id_slecount++;sle[id_slecount]=sle_condition
//	id_stcount++;st[id_stcount]=st_pos
//	id_scbbuttoncount++;scb_button[id_scbbuttoncount]=cb_button
//	id_spbcount++;spb_button[id_spbcount]=cb_2
//	id_spbcount++;spb_button[id_spbcount]=pb_colthnomodify
//	id_maskcount++;smask[id_maskcount]=em_pricedec
end if
//
id_buttoncount2=0
wf_binit('report',pb_import,'',1,2)
//wf_binit('report',pb_dr,'产品导入',1,2)
//wf_binit('report',pb_upload,'图片上传',1,2)
//wf_binit('',pb_sendnote,'',1,2)
//wf_binit('',pb_import,'',1,2)
return 0

end function

public subroutine wf_controls_pos ();int li_marginx,li_marginy
int li_width

li_marginx=pixelstounits(5,XPixelsToUnits!)
li_marginy=pixelstounits(5,YPixelsToUnits!)
li_width=workspacewidth() - (2 * li_marginx)

dw_1.move(li_marginx,dw_button.y + dw_button.height + li_marginy)
dw_1.resize(li_width,workspaceheight() - dw_button.y - li_marginy)


end subroutine

public subroutine wf_cbstate_modify (boolean ab_ismod);//	wf_cbstate_modify,ab_ismod
string ls_string
string ls_modify,ls_modify2

if ab_ismod then
	pb_save.enabled=true
	pb_add.enabled=false
	pb_cancel.enabled=true
	pb_modify.enabled=false
	pb_delete.enabled=false
//	pb_gencon0.enabled=false
	pb_ok.enabled=false
	ls_modify=u_dd.getattribstring(is_header_columns,'tabsequence',true)
	ls_modify2=u_dd.getattribstring(is_columns,'tabsequence',true)
else
	pb_save.enabled=false
	pb_add.enabled=true
	pb_cancel.enabled=false
	pb_modify.enabled=true
	pb_delete.enabled=false
//	pb_gencon0.enabled=true
	pb_ok.enabled=true
	ls_modify=u_dd.getattribstring(is_header_columns,'tabsequence',false)
	ls_modify2=u_dd.getattribstring(is_columns,'tabsequence',false)
	
end if

//dw_head.modify(ls_modify)
dw_1.modify(ls_modify2)

end subroutine

public function long wf_query_detail ();string ls_errtext,ls_sql,ls_ret
boolean lb_wait
string ls_nos,ls_chnos[] 
long i,l_rowcount,li_th	//参数次序
int li_chcount	//渠道数
any la_parm[],la_empty[]
string ls_outdate,ls_expression,ls_modify,ls_channels[],ls_columns

dw_1.dataobject=dw_1.dataobject

//if dw_head.rowcount()=0 then goto e

//ls_outdate=string(dw_head.object.outdate[1],'')
//ls_nos=string(dw_head.object.nos[1],'')
//ls_chnos[]=u_dd.getsep(ls_nos,';',0,1)
//ls_ret=string(dw_head.object.cusno[1],'')
//ls_channels[]=u_dd.getsep(ls_ret,';',0,1)
////
////li_chcount=upperbound(ls_chnos[])
////
////if li_chcount=0 then goto e
////
////u_derek.wait(10,'准备临时表')
////
////delete from zg_huanan3_temp where recno=:g_recno;
////if u_derek.sqlcheck(1)=-1 then goto e
////
////u_derek.wait(20,'提取初始可配存')
////
////insert into zg_huanan3_temp(recno,colthno,color,nb0) 
////select :g_recno,t1.colthno,t1.color,sum(t1.nb)
////from zg_channel_kc t1
////where  t1.outdate=:ls_outdate
////group by t1.colthno,t1.color;
////
////if u_derek.sqlcheck(1)=-1 then goto e
////
//////update zg_huanan3_temp
//////set names=t2.colthname
//////from zg_huanan3_temp t1,coloth_t t2
//////where t1.recno=:g_recno and t2.colthno=t1.colthno;
//////
//////if u_derek.sqlcheck(1)=-1 then goto e
////
////u_derek.wait(40,'查询渠道可配存')
////
////la_parm[]=la_empty[]
////
////ls_sql=''
//////记录明细
////for i=1 to li_chcount
////	
////	ls_sql+="update zg_huanan3_temp ~r~n&
////				set nb"+string(i)+"=t2.nb ~r~n&
////				from zg_huanan3_temp t1,zg_channelb t2 &
////				where t1.recno="+string(g_recno)+" and t2.nos='"+ls_chnos[i]+"' and t2.colthno=t1.colthno and t2.color=t1.color ~r~n"
////
////next
////
////execute immediate :ls_sql;
////if u_derek.sqlcheck(1)=-1 then goto e
////
//////ls_errtext=u_derek.uf_sqlexec(ls_sql,la_parm[])
//////if ls_errtext<>'' then goto e
////
////u_derek.wait(70,'创建横排')
////
//////创建渠道横排
////ls_errtext=wf_dwcreate(li_chcount)
////if ls_errtext<>'' then goto e
////
////u_derek.wait(80,'横排渠道名称显示')
////
////is_columns=''
////ls_expression+="if(isnull(nb0),0,nb0) "
////
////for i=1 to li_chcount
////	is_columns+="nb"+string(i)+','
////	ls_modify+="nb"+string(i)+"_t.text='"+ls_channels[i]+"' "
////	ls_expression+=" - if(isnull(nb"+string(i)+"),0,nb"+string(i)+") "
////next
////
////ls_modify+="cp_diffnb.expression='"+ls_expression+"' "
////
////ls_columns="cp_diffnb,sprice,cp_smoney"
////u_dd.setattribs(dw_1,ls_columns,'visible','0')//首先隐藏总数
////
//////ls_errtext=dw_1.modify("cp_diffnb.visible=0 ")	
////ls_errtext=dw_1.modify(ls_modify)
////if ls_errtext<>'' then goto e
////
////u_dd.setattribs(dw_1,ls_columns,'visible','1')
////
////
////u_chnel.uf_setstyle(dw_1,1)
////dw_1.settransobject(sqlca)
////
////u_derek.wait(90,'数据检索')
////
////l_rowcount=dw_1.retrieve(g_recno)
//
//if lb_wait=false then u_derek.closewait()
//return l_rowcount
//
//e:
//if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
//rollback;
//if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
//if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
//if lb_wait=false then u_derek.closewait()
return -1
end function

public function string wf_dwcreate (integer ai_column);//u_derek_dd u_dd
string ls_dwsyntax,ls_syntax1,ls_modify
int i
datawindow ldw
ldw=dw_1

//加列
string ls_colname='nb1'
dec ld_colx,ld_colwidth
integer li_colid
string ls_colsyntax

//加Text
string ls_textname='nb1_t'
string ls_textsyntax
//加Text
//string ls_textname2='t_sanb1'
//string ls_textsyntax2

//string ls_cpname1='cp_xjnb1'
//string ls_cpsyntax1
string ls_cpname2='cp_sumnb1'
string ls_cpsyntax2
//string ls_cpname3='cp_sum11'
//string ls_cpsyntax3
//string ls_cpname4='cp_sum21'
//string ls_cpsyntax4
//string ls_cpname5='cp_sum31'
//string ls_cpsyntax5

ls_dwsyntax=ldw.describe("Datawindow.Syntax")

//加列
ld_colx=dec(ldw.describe(ls_colname+".x"))
ld_colwidth=dec(u_dd.uf_getprop(ldw,ls_colname+".width",0))	//得到宽度
li_colid=integer(ldw.describe(ls_colname+".id"))
ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'column','id='+string(li_colid))
ls_colsyntax='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)

//加text
ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'text','name='+ls_textname)
ls_textsyntax='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)
////加text2
//ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'text','name='+ls_textname2)
//ls_textsyntax2='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)

//加compute1
//ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'compute','name='+ls_cpname1)
//ls_cpsyntax1='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)
//加compute2
ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'compute','name='+ls_cpname2)
ls_cpsyntax2='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)
////加compute3
//ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'compute','name='+ls_cpname3)
//ls_cpsyntax3='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)
////加compute4
//ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'compute','name='+ls_cpname4)
//ls_cpsyntax4='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)
////加compute5
//ls_syntax1=u_dd.getdwosyntax(ls_dwsyntax,'compute','name='+ls_cpname5)
//ls_cpsyntax5='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)

for i=2 to ai_column
	//加列
	li_colid++
	ld_colx+=ld_colwidth
	ls_modify+=ls_colsyntax+"id="+string(li_colid)+" name=nb"+string(i)+" x='"+string(ld_colx)+"'  )~r~n"
	//加text
	ls_modify+=ls_textsyntax+"name=nb"+string(i)+"_t x='"+string(ld_colx)+"')~r~n"
	//加text2
//	ls_modify+=ls_textsyntax2+"name=t_sanb"+string(i)+" x='"+string(ld_colx)+"' text=~"~tif(string(sanb"+string(i)+")='0','',string(sanb"+string(i)+"))~")~r~n"
	//加compute1
//	ls_modify+=ls_cpsyntax1+"name=cp_xjnb"+string(i)+" x='"+string(ld_colx)+"' expression=~"sum(nb"+string(i)+" for group 1)~")~r~n"
	//加compute2
	ls_modify+=ls_cpsyntax2+"name=cp_sumnb"+string(i)+" x='"+string(ld_colx)+"' expression=~"sum(nb"+string(i)+" for all)~")~r~n"
	//加compute3
//	ls_modify+=ls_cpsyntax3+"name=cp_sum1"+string(i)+" x='"+string(ld_colx)+"' expression=~"0~")~r~n"
//	//加compute4
//	ls_modify+=ls_cpsyntax4+"name=cp_sum2"+string(i)+" x='"+string(ld_colx)+"' expression=~"integer(Describe(~~~"Evaluate('sum(abs(sign(nb"+string(i)+")) for group 1)',~~~"+string(currentrow())+~~~")~~~"))~")~r~n"
//	//加compute5
//	ls_modify+=ls_cpsyntax5+"name=cp_sum3"+string(i)+" x='"+string(ld_colx)+"' expression=~"sum(abs(sign(nb"+string(i)+")))~")~r~n"
	
next

return ldw.modify(ls_modify)

	
end function

public function string wf_import (string as_filepath);string ls_field,ls_temptable,ls_infile2,ls_where
string ls_filepath,ls_ret,ls_filename,ls_sql,ls_errtext,ls_channels[],ls_cols[],ls_string,ls_channels2[]
long l_rows,i,m
boolean lb_wait
int li_chcount,li_pos

//查询设置的渠道
ls_sql="select codes from rt_cause where tablename='channel' "
ls_ret=u_dd.getresult(ls_sql)

if ls_ret='' then 
	ls_errtext="请先设置渠道!"
	goto e
end if

ls_channels[]=u_fun.getsep(ls_ret,'~r~n',0)
li_chcount=upperbound(ls_channels[])

//检索excel的渠道名
ls_errtext=u_excel.getcolsname(as_filepath,1,1,ls_cols[])
if ls_errtext<>'' then goto e
ls_string=';'+u_fun.getstr(ls_cols,';',0)+';'

//查找excel中的渠道
for i=1 to li_chcount
	li_pos=pos(ls_string,';'+ls_channels[i]+';')
	if li_pos=0 then ls_errtext+=ls_channels[i]+"~r~n"
next

if ls_errtext<>'' then 
	ls_errtext="缺少渠道:~r~n"+ls_errtext
	goto e
end if

ls_field="colthno,colors,nb1,nb2,nb3,nb4,nb5,nb6,nb7,nb8,nb9,nb10"
ls_temptable='zg_hptemp'
ls_where=' recno='+string(g_recno)
ls_field='recno=recno,'+ls_field
ls_infile2=g_zgtemppath+'\'+'winfile.txt'

u_derek.wait(5,'process temp data')

delete zg_hptemp where recno=:g_recno; 
if u_derek.sqlcheck(1)=-1 then goto e

u_derek.wait(10,'Excel Convert')

if f_wgz_to_dbf(as_filepath,ls_infile2,'')<>0 then 
   ls_ret=f_wl('Failed')+ ' ~r~n'
	ls_errtext+='Filename:'+ls_filename+',convert failed:'+string(ls_ret)
	goto e
else
	f_wgz_meter(10)
	w_wait.st_1.text='准备...'
	l_rows=f_wgz_pipe_foxtodb(ls_infile2,sqlca,ls_temptable,ls_where,'key=colthno+colors,'+ls_field,'bcpupdate')
	if l_rows=0 then 
		ls_errtext+='Filename:'+ls_filename+',导入错误:'+string(ls_ret)
		goto e
	end if
	delete from zg_hptemp where recno=:g_recno and isnull(colthno,'')='' ;
	if u_derek.sqlcheck(1)=-1 then goto e
end if

u_derek.wait(30,'货号检查')

ls_ret=''
ls_sql="select distinct colthno from zg_hptemp t1 where recno="+string(g_recno)+" and not exists(select 1 from coloth_t t2 where t2.colthno=t1.colthno)"
ls_ret=u_dd.getresult(ls_sql)
if ls_ret<>'' then
	ls_errtext+="Filename:"+as_filepath+"~r~n无效货号~r~n"+ls_ret+""
	goto e
end if	

ls_ret=''
ls_sql="select distinct colthno,colors from zg_hptemp t1 where recno="+string(g_recno)+" and not exists(select 1 from coloth_easy t2 where t2.colthno=t1.colthno and t2.color_nos=isnull(t1.colors,'') )"
ls_ret=u_dd.getresult(ls_sql)
if ls_ret<>'' then
	ls_errtext+="Filename:"+as_filepath+"~r~n无效货号~t色尺~r~n"+ls_ret+""
	goto e
end if	

insert into zg_hptemp(recno,colthno,colors,nb1,nb2,nb3,nb4,nb5,nb6,nb7,nb8,nb9,nb10)
select :g_recno,colthno,colors,nb1,nb2,nb3,nb4,nb5,nb6,nb7,nb8,nb9,nb10
from zg_hptemp t1
where t1.recno=:g_recno 
	and not exists(select 1 from zg_hptemp t2 where t2.recno=:g_recno and t2.colthno=t1.colthno and t2.colors=t1.colors);

if u_derek.sqlcheck(1)=-1 then goto e

openwithparm(w_derek_sqlexec,"select colthno,colors,nb1,nb2,nb3,nb4,nb5,nb6,nb7,nb8,nb9,nb10 from zg_hptemp where recno="+string(g_recno))

ls_sql=''
//excel中的渠道顺序
for i=1 to upperbound(ls_cols[])
	for m=1 to li_chcount
		if ls_cols[i]=ls_channels[m] then
			
			//前两列为货号,色尺 所以要 - 2
			
			ls_sql+="update zg_huanan3_temp &
						set nb"+string(m)+"=t2.nb"+string(i - 2)+" &
						from zg_huanan3_temp t1,zg_hptemp t2 &
						where t1.recno="+string(g_recno)+" and t2.recno="+string(g_recno)+" and t2.colthno=t1.colthno and t2.colors=t1.color "
						
			exit
		end if
	next
next

f_messagebox('',ls_sql,0,0)

execute immediate :ls_sql;
if u_derek.sqlcheck(1)=-1 then goto e

dw_1.retrieve(g_recno)

//
if lb_wait=false then u_derek.closewait()
return ''

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then u_derek.closewait()
return ls_errtext
end function

on w_runsa_derek_modify.create
int iCurrent
call super::create
this.st_2=create st_2
this.pb_lhbb=create pb_lhbb
this.lb_1=create lb_1
this.pb_import=create pb_import
this.pb_1=create pb_1
this.ids_temp=create ids_temp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.pb_lhbb
this.Control[iCurrent+3]=this.lb_1
this.Control[iCurrent+4]=this.pb_import
this.Control[iCurrent+5]=this.pb_1
end on

on w_runsa_derek_modify.destroy
call super::destroy
destroy(this.st_2)
destroy(this.pb_lhbb)
destroy(this.lb_1)
destroy(this.pb_import)
destroy(this.pb_1)
destroy(this.ids_temp)
end on

event open;call super::open;if i_open=0 then
//	i_message=message.stringparm
//	f_yield(this,'')
//	this.trigger event  ue_setsql()
//	this.post event  ue_position()
//	this.trigger event  ue_sheet()
	
	i_open=i_open+1
	wf_initdisplay()
	i_headnew=0
	dw_button.post event ue_init(1)
	
//	select isnull(min(outdate),'') into :is_outdate
//	from zg_channel
//	where tablename='mid';
//	
//	if sqlca.sqlcode=-1 then f_messagebox('',sqlca.sqlerrtext,0,0)
//	
//	if is_outdate<>'' then 
////		wf_query_head(is_outdate)
//		wf_query_detail()
//	end if
	
	
	post wf_controls_pos()
	wf_cbstate_modify(false)

	
end if





end event

event closequery;//
end event

type p_11 from w_single2_parent`p_11 within w_runsa_derek_modify
end type

type pb_sendnote from w_single2_parent`pb_sendnote within w_runsa_derek_modify
integer x = 869
integer y = 1808
end type

type pb_daoru from w_single2_parent`pb_daoru within w_runsa_derek_modify
end type

type pb_gencon0 from w_single2_parent`pb_gencon0 within w_runsa_derek_modify
boolean visible = true
integer x = 41
integer y = 12
integer width = 274
integer height = 104
boolean enabled = false
boolean originalsize = false
string picturename = "gen.jpg"
string disabledname = "gen1.jpg"
end type

event pb_gencon0::clicked;
i_zg_gencon.control='s_outdate=1,e_outdate=1,ck=1,db=1,'
i_zg_gencon.st_date[1]=f_wl('起始日:')
i_zg_gencon.st_date[2]=f_wl('终止日:')
openwithparm(w_zg_gencon,i_zg_gencon)
i_zg_gencon=message.powerobjectparm

end event

type cb_2 from w_single2_parent`cb_2 within w_runsa_derek_modify
boolean visible = false
integer x = 375
integer y = 20
end type

type st_button from w_single2_parent`st_button within w_runsa_derek_modify
end type

type dw_view from w_single2_parent`dw_view within w_runsa_derek_modify
end type

type dw_button2 from w_single2_parent`dw_button2 within w_runsa_derek_modify
end type

type dw_button from w_single2_parent`dw_button within w_runsa_derek_modify
integer x = 0
integer y = 0
end type

type pb_deleteall from w_single2_parent`pb_deleteall within w_runsa_derek_modify
end type

type pb_rowcopy from w_single2_parent`pb_rowcopy within w_runsa_derek_modify
end type

type dw_input6 from w_single2_parent`dw_input6 within w_runsa_derek_modify
end type

type pb_help from w_single2_parent`pb_help within w_runsa_derek_modify
end type

type em_zoom from w_single2_parent`em_zoom within w_runsa_derek_modify
end type

type pb_preview from w_single2_parent`pb_preview within w_runsa_derek_modify
end type

type dw_brow from w_single2_parent`dw_brow within w_runsa_derek_modify
integer x = 1627
integer y = 476
end type

type pb_browse from w_single2_parent`pb_browse within w_runsa_derek_modify
end type

type dw_words from w_single2_parent`dw_words within w_runsa_derek_modify
integer x = 0
integer y = 400
integer width = 2729
integer height = 1060
string dataobject = ""
end type

type pb_modify from w_single2_parent`pb_modify within w_runsa_derek_modify
integer x = 1349
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "修改"
boolean originalsize = false
string picturename = "modify.jpg"
string disabledname = "modify1.jpg"
alignment htextalign = center!
end type

event pb_modify::clicked;//
wf_cbstate_modify(true)
end event

type dw_input5 from w_single2_parent`dw_input5 within w_runsa_derek_modify
integer x = 1390
integer y = 12
end type

type dw_input4 from w_single2_parent`dw_input4 within w_runsa_derek_modify
end type

type dw_input3 from w_single2_parent`dw_input3 within w_runsa_derek_modify
end type

type dw_input2 from w_single2_parent`dw_input2 within w_runsa_derek_modify
integer x = 55
integer y = 160
integer width = 1522
integer height = 416
end type

event dw_input2::doubleclicked;//if this.getrow()>0 then
//	sle_2.text=trim(this.getitemstring(this.getrow(),'dbno'))
//	this.visible=false
//	sle_2.setfocus()
//	sle_2.triggerevent(modified!)
//end if
end event

type dw_input1 from w_single2_parent`dw_input1 within w_runsa_derek_modify
end type

type pb_ok from w_single2_parent`pb_ok within w_runsa_derek_modify
integer x = 325
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
boolean underline = false
boolean enabled = false
string text = "查询"
boolean originalsize = false
string picturename = "query.jpg"
string disabledname = "query1.jpg"
end type

event pb_ok::clicked;//
end event

type sle_condition from w_single2_parent`sle_condition within w_runsa_derek_modify
boolean visible = false
integer x = 338
integer y = 32
integer width = 535
integer height = 96
end type

event sle_condition::modified;call super::modified;if i_itemchanged='failure' then
	if f_messagebox('',f_wgz_language('是否取消?'),2,1)=2 then 
			dw_1.setfocus()
			pb_cancel.enabled=true
			return
	end if
end if

long l_i
if i_itemchanged='success' then 
//if (dw_1.modifiedcount()>0 or dw_1.deletedcount()>0)  &
//											and pb_save.enabled=true then
//		l_i=f_messagebox('',f_wgz_language('是否保存?'),2,1)
//	choose case	l_i
//		case  1 	
//			pb_save.triggerevent(clicked!) 
//	end choose
//end if
end if

i_itemchanged='success'
i_priorbutton='pb_ok'
string l_condition,ls_return
l_condition=trim(sle_condition.text)

if isnull(l_condition) or trim(l_condition)='' then
	l_condition=''
	ls_return=f_wgz_dw_syntax(dw_1,'countcon',l_condition+g_ft)
	if ls_return='-100' then
	 //close(w_wait)
	 //f_messagebox('','数据量过大，请输入条件查询',0,0)
	 return 0
	end if
else
	l_condition=l_condition
end if
dw_1.retrieve(l_condition)
commit;

if dw_1.rowcount()=0 and is_trigger='' then 
	f_messagebox('',f_wgz_language('无记录')+'2',0,0)
else
	dw_1.setfocus()
	dw_1.scrolltorow(1)
end if
commit;
end event

type pb_report from w_single2_parent`pb_report within w_runsa_derek_modify
boolean visible = false
integer x = 114
integer y = 20
end type

type st_info from w_single2_parent`st_info within w_runsa_derek_modify
end type

type st_1 from w_single2_parent`st_1 within w_runsa_derek_modify
end type

type pb_6 from w_single2_parent`pb_6 within w_runsa_derek_modify
end type

type pb_next from w_single2_parent`pb_next within w_runsa_derek_modify
end type

type pb_5 from w_single2_parent`pb_5 within w_runsa_derek_modify
end type

type pb_prior from w_single2_parent`pb_prior within w_runsa_derek_modify
end type

type pb_cancel from w_single2_parent`pb_cancel within w_runsa_derek_modify
integer x = 1093
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "取消"
boolean originalsize = false
string picturename = "cancel.jpg"
string disabledname = "cancel1.jpg"
alignment htextalign = center!
end type

event pb_cancel::clicked;//
//wf_query_head(is_outdate)
wf_query_detail()
wf_cbstate_modify(false)
end event

type pb_save from w_single2_parent`pb_save within w_runsa_derek_modify
integer x = 837
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "保存"
boolean originalsize = false
string picturename = "save.jpg"
string disabledname = "save1.jpg"
alignment htextalign = center!
end type

event pb_save::clicked;//
string ls_nos,ls_cusno,ls_outdate,ls_bz,ls_nos_temp,ls_chnos[],ls_tablename='mid'
long l_count,i
string ls_errtext,ls_sql,ls_channels[],ls_channel,ls_ret
boolean lb_wait
int li_chcount,li_th
any la_parm[],la_empty[]

//if dw_head.rowcount()=0 then return 0

//if dw_head.accepttext()=-1 then goto e
//
//ls_errtext=dw_head.event ue_checkrow(1)
//if ls_errtext<>'' then goto e
//
//ls_outdate=string(dw_head.object.outdate[1],'')
//ls_nos=string(dw_head.object.nos[1],'')
//ls_cusno=string(dw_head.object.cusno[1],'')
//ls_bz=string(dw_head.object.bz[1],'')

ls_channels[]=u_fun.getsep(ls_cusno,';',0,1)
ls_chnos[]=u_fun.getsep(ls_nos,';',0,1)

li_chcount=upperbound(ls_channels[])
if li_chcount=0 then 
	ls_errtext='渠道不能为空!'
	goto e
end if

if dw_1.accepttext()=-1 then goto e

ls_ret=dw_1.describe("Evaluate(~"sum(if(cp_diffnb<>0,1,0))~",0)")
if ls_ret<>'0' then 
	ls_errtext='存在'+ls_ret+'行总和与可配量不一致,请处理!'
	goto e
end if

u_derek.wait(10,'保存明细数据')

if dw_1.update(true,true)=1 then 
	commit;
	if sqlca.sqlcode=-1 then goto e
else
	rollback;
	ls_errtext="保存失败!"
	goto e
end if

if ls_nos='' then 
	
	u_derek.wait(40,"生成单据")
	
	ls_sql=''
	
	for i=1 to li_chcount
		
		u_derek.wait(40,"渠道:"+ls_channels[i]+'生成单据')
		
		ls_channel=ls_channels[i]
		
//		ls_nos_temp=f_zg_nos(ls_channel,1,'tableflags=F;cusno=cusno;zg_channel',g_stanos)
		ls_nos_temp=u_derek.gnos('zg_channel','mid',ls_channel)
		if ls_nos_temp='-1' then 
			ls_errtext="生成单据号失败!"
			goto e
		end if
		
		u_derek.wait(40,"渠道:"+ls_channels[i]+'记录明细')
		
		//记录明细
		ls_sql="insert into zg_channelb(nos,colthno,color,nb,price,pers,endprice) &
					select ?,t1.colthno,t1.color,t1.nb"+string(i)+",t2.sprice,1,t2.sprice &
					from zg_huanan3_temp t1,coloth_easy t2 &
					where t1.recno=? and t2.colthno=t1.colthno and t2.color_nos=t1.color "
		
		prepare sqlsa from :ls_sql;
		execute sqlsa using :ls_nos_temp,:g_recno;
		
		if sqlca.sqlcode=-1 then goto e
		
	//	//记录抬头
	//	insert into zg_channel(cusno,outdate,nos,stanos,tablename,yhid,gxrq,bz,kinds1)
	//	values(:ls_channel,:ls_outdate,:ls_chnos,:g_stanos,:ls_tablename,:personcode,getdate(),:ls_bz,4);
		
	//	if sqlca.sqlcode=-1 then goto e
		
		u_derek.wait(40,"渠道:"+ls_channels[i]+'记录抬头')
		
		//记录抬头
		insert into zg_channel(cusno,outdate,nos,stanos,tablename,yhid,gxrq,bz,kinds1,nb,now,now_real)
		select :ls_channel,:ls_outdate,:ls_nos_temp,:g_stanos,:ls_tablename,:personcode,getdate(),:ls_bz,4
				,sum(nb),sum(price),sum(endprice)
		from zg_channelb t2
		where t2.nos=:ls_nos_temp;
		
		if sqlca.sqlcode=-1 then goto e
		
	next
	
else
	
	u_derek.wait(30,"更新单据")
	
	la_parm[]=la_empty[]
	
	ls_sql=''
	//记录明细
	for i=1 to li_chcount
		
			ls_sql+="delete from zg_channelb where nos='"+ls_chnos[i]+"' ~r~n"
		
			ls_sql+="insert into zg_channelb(nos,colthno,color,nb,price,pers,endprice) ~r~n&
							select '"+ls_chnos[i]+"',t1.colthno,t1.color,t1.nb"+string(i)+",t2.sprice,1,t2.sprice ~r~n&
							from zg_huanan3_temp t1,coloth_easy t2 ~r~n&
							where t1.recno="+string(g_recno)+" and t2.colthno=t1.colthno and t2.color_nos=t1.color ~r~n"
			
			update zg_channel 
			set bz=:ls_bz,gxrq=getdate(),yhid=:personcode,
				nb=(select sum(nb) from zg_channelb t2 where t2.nos=zg_channel.nos)
			where nos=:ls_chnos[i];
			
			if sqlca.sqlcode=-1 then goto e
			
	next
	
	f_messagebox('',ls_sql,0,0)
	
	execute immediate :ls_sql;
	if sqlca.sqlcode=-1 then goto e
	
//	for i=1 to li_chcount
	//		ls_sql+="delete from zg_channelb where nos=? ~r~n"
//		
//		ls_sql+="insert into zg_channelb(nos,colthno,color,nb,price,pers,endprice) ~r~n&
//						select ?,t1.colthno,t1.color,t1.nb"+string(i)+",t2.sprice,1,t2.sprice ~r~n&
//						from zg_huanan3_temp t1,coloth_easy t2 ~r~n&
//						where t1.recno=? and t2.colthno=t1.colthno and t2.color_nos=t1.color ~r~n"
//		
//		ls_sql+="update zg_channel ~r~n&
//					set bz=?,gxrq=getdate(),yhid=?, ~r~n&
//						nb=(select sum(nb) from zg_channelb t2 where t2.nos=zg_channel.nos) ~r~n&
//					where nos=? ~r~n"
//		
//		
//		
//		li_th=(i - 1) * 6
//		la_parm[li_th + 1]=ls_chnos[i]
//		la_parm[li_th + 2]=ls_chnos[i]
//		la_parm[li_th + 3]=g_recno
//		la_parm[li_th + 4]=ls_bz
//		la_parm[li_th + 5]=personcode
//		la_parm[li_th + 6]=ls_chnos[i]
	//next
	//	ls_errtext=u_derek.uf_sqlexec(ls_sql,la_parm[])
//	if ls_errtext<>'' then goto e

	u_derek.wait(50,"清除渠道库存")
	
	delete from zg_channel_kc where outdate=:ls_outdate;
	if sqlca.sqlcode=-1 then goto e
	
end if

u_derek.wait(60,"更新渠道库存")

//生成结算日库存
insert into zg_channel_kc(cusno,outdate,colthno,color,nb)
select t1.cusno,:ls_outdate,colthno,color,sum(t2.nb)
from zg_channel t1,zg_channelb t2
where t1.outdate=:ls_outdate and t2.nos=t1.nos
group by t1.cusno,colthno,color;

if u_derek.sqlcheck(1)=-1 then goto e

u_derek.wait(70,"重新检索")

//wf_query_head(ls_outdate)
wf_query_detail()

wf_cbstate_modify(false)
if lb_wait=false then u_derek.closewait()
return 1

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then u_derek.closewait()
return -1
end event

type pb_print from w_single2_parent`pb_print within w_runsa_derek_modify
integer x = 1861
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
string text = "打印"
boolean originalsize = false
string picturename = "print.jpg"
string disabledname = "print1.jpg"
alignment htextalign = center!
end type

event pb_print::clicked;datawindow dw
dw=dw_1
s_ps.dw_1=dw
if s_ps.dw_1.rowcount()>0 then
	open(w_print_setting)
end if

end event

type pb_exit from w_single2_parent`pb_exit within w_runsa_derek_modify
integer x = 2117
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
string text = "退出"
boolean originalsize = false
string picturename = "exit.jpg"
string disabledname = "exit1.jpg"
alignment htextalign = center!
end type

event pb_exit::clicked;//
i_priorbutton='cb_exit'
close(parent)
end event

type pb_delete from w_single2_parent`pb_delete within w_runsa_derek_modify
integer x = 1605
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "删除"
boolean originalsize = false
string picturename = "delete.jpg"
string disabledname = "delete1.jpg"
alignment htextalign = center!
end type

event pb_delete::clicked;if dw_1.getrow()=0 then return 
if f_messagebox('提示','确定要删除么?',2,2)<>1 then return
dw_1.deleterow(1)
end event

type pb_add from w_single2_parent`pb_add within w_runsa_derek_modify
integer x = 581
integer y = 8
integer height = 104
integer textsize = -9
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "新增"
boolean originalsize = false
string picturename = "add.jpg"
string disabledname = "add1.jpg"
alignment htextalign = center!
end type

event pb_add::clicked;//
//zgck_select(g_recno),zg_huanan3_temp(g_recno),coloth_select(g_recno)
//计算可配存用easytemp(g_recno),dba1_nbtemp(g_recno)
string ls_outdate,ls_channel,ls_channels[]
string ls_sql,ls_errtext,ls_datas[],ls_modify,ls_ret,ls_expression,ls_columns
boolean lb_wait
long l_rowcount,i
int li_chcount

ls_outdate=string(today(),'YYYYMMDD')

//ls_errtext+=dw_head.modify("outdate.initial='"+ls_outdate+"'")

ls_sql="select codes from rt_cause where tablename='channel' "
ls_ret=u_dd.getresult(ls_sql)

if ls_ret='' then 
	ls_errtext="请先设置渠道!"
	goto e
end if

ls_channels[]=u_fun.getsep(ls_ret,'~r~n',0)
li_chcount=u_fun.replaceex(ls_ret,'~r~n',';')
//ls_errtext+=dw_head.modify("cusno.initial='"+ls_ret+"'")

if ls_errtext<>'' then goto e

delete from zgck_select where recno=:g_recno;

if u_derek.sqlcheck(1)=-1 then goto e

//查询设置渠道的仓库
insert into zgck_select(recno,ckaccno)
select :g_recno,t1.dbno 
from db_local t1,zgck_acc t2
where isnull(channels,'')<>'' and t2.ckaccno=t1.dbno and t2.ckkinds1=0;

if u_derek.sqlcheck(1)=-1 then goto e

delete from coloth_select where recno=:g_recno;

if u_derek.sqlcheck(1)=-1 then goto e

//查询渠道仓库中所有产品
insert into coloth_select(recno,colthno,color_nos)
select distinct :g_recno,t1.colthno,t1.color_nos
from zgck_select t0,coloth_f t1
where t0.recno=:g_recno and t1.ckaccno=t0.ckaccno;

if u_derek.sqlcheck(1)=-1 then goto e

//计算选择仓库和产品的可配存
ls_errtext=u_derek.uf_allot_ref('','')

if ls_errtext<>'' then goto e

delete from zg_huanan3_temp where recno=:g_recno;

if u_derek.sqlcheck(1)=-1 then goto e

insert into zg_huanan3_temp(recno,colthno,color,nb0)
select :g_recno,t1.colthno,t1.color,isnull(sum(t1.daynum),0)
from easytemp t1
where t1.recno=:g_recno
group by t1.colthno,t1.color;

if u_derek.sqlcheck(1)=-1 then goto e

ls_sql="select tt1.colthno,tt1.color_nos,tt1.nb,tt2.nb0 &
			from (select t1.colthno,t1.color_nos,isnull(sum(isnull(t1.rnb,0) - isnull(t1.tempoutnb,0)),0) as nb &
					from zgck_select t0,coloth_f t1,coloth_select t2 &
					where t0.recno="+string(g_recno)+" and t1.ckaccno=t0.ckaccno and t2.colthno=t1.colthno &
					group by t1.colthno,t1.color_nos) tt1,zg_huanan3_temp tt2 &
					where tt2.recno="+string(g_recno)+" and  tt2.colthno=tt1.colthno and tt2.color=tt1.color_nos and tt2.nb0<>tt1.nb"

ls_ret=''
ls_ret=u_dd.getresult(ls_sql)
if ls_ret<>'' then
	ls_errtext+="可配存不等于实物存~r~货号 色尺 实物存 可配存~r~n"+ls_ret+""
	goto e
end if	

//update zg_huanan3_temp
//set names=t2.colthname
//from zg_huanan3_temp t1,coloth_t t2
//where t1.recno=:g_recno and t2.colthno=t1.colthno;
//
//if u_derek.sqlcheck(1)=-1 then goto e

////ls_sql="select recno,colthno,color,nb0 from zg_huanan3_temp where recno="+string(g_recno)
////
////ls_errtext=u_dd.getquery(dw_1,ls_sql)
////
////if ls_errtext<>'' then goto e

//dw_head.insertrow(0)
dw_1.dataobject=dw_1.dataobject


u_derek.wait(70,'创建横排')

//创建渠道横排
ls_errtext=wf_dwcreate(li_chcount)
if ls_errtext<>'' then goto e

u_derek.wait(80,'横排渠道名称显示')

is_columns=''
ls_expression+="if(isnull(nb0),0,nb0) "

for i=1 to li_chcount
	is_columns+="nb"+string(i)+','
	ls_modify+="nb"+string(i)+"_t.text='"+ls_channels[i]+"' "
	ls_expression+=" - if(isnull(nb"+string(i)+"),0,nb"+string(i)+") "
next

ls_modify+="cp_diffnb.expression='"+ls_expression+"' "

ls_columns="cp_diffnb,sprice,cp_smoney"
u_dd.setattribs(dw_1,ls_columns,'visible','0')//首先隐藏总数

//ls_errtext=dw_1.modify("cp_diffnb.visible=0 ")	
ls_errtext=dw_1.modify(ls_modify)

u_dd.setattribs(dw_1,ls_columns,'visible','1')


if ls_errtext<>'' then goto e

u_chnel.uf_setstyle(dw_1,1)
dw_1.settransobject(sqlca)
dw_1.retrieve(g_recno)

wf_cbstate_modify(true)

if lb_wait=false then u_derek.closewait()
return 0

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
//if ls_errtext<>'' then messagebox('',ls_errtext)
if lb_wait=false then u_derek.closewait()
return -1
end event

type dw_1 from w_single2_parent`dw_1 within w_runsa_derek_modify
integer x = 23
integer y = 136
integer width = 3607
integer height = 1900
string dataobject = "d_runsa_derek_channel_initial_b"
end type

event dw_1::rbuttondown;
f_wgz_zg_sort(this,'')

	
		
end event

event dw_1::itemchanged;//

end event

event dw_1::doubleclicked;//
end event

event dw_1::clicked;//

return super::event clicked(xpos,ypos,row,dwo)
end event

event dw_1::dberror;//
end event

event dw_1::editchanged;//
end event

event dw_1::enterastab;//
end event

event dw_1::itemerror;//
end event

event dw_1::itemfocuschanged;//
end event

event dw_1::losefocus;//
end event

event dw_1::retrieveend;//
end event

event dw_1::retrievestart;//
end event

event dw_1::rowfocuschanged;//
end event

event dw_1::rowfocuschanging;//
end event

event dw_1::ue_rowchanged;//
end event

event dw_1::ue_rowchanged2;//
end event

event dw_1::ue_scrolltorow;//
end event

event dw_1::ue_select;//
end event

event dw_1::ue_setcolumn;//
return 0
end event

event dw_1::ue_words;//
end event

event dw_1::key;call super::key;string ls_text
if keyflags=2 and keydown(keyc!) then
	ls_text=this.describe("datawindow.selected.data")
	if ls_text='' then 
	else
		//避免clipboard文本不正确
		yield()
		::clipboard(ls_text)
	end if
end if
end event

type sle_1 from w_single2_parent`sle_1 within w_runsa_derek_modify
end type

type sle_3 from w_single2_parent`sle_3 within w_runsa_derek_modify
end type

type st_2 from statictext within w_runsa_derek_modify
boolean visible = false
integer x = 27
integer y = 132
integer width = 302
integer height = 84
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "货号"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_lhbb from picturebutton within w_runsa_derek_modify
boolean visible = false
integer x = 800
integer y = 84
integer width = 315
integer height = 108
integer taborder = 160
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "灵活报表"
boolean originalsize = true
end type

event clicked;f_zg_pmmasc_kehu(dw_1,'','')
end event

type lb_1 from listbox within w_runsa_derek_modify
boolean visible = false
integer x = 457
integer y = 828
integer width = 818
integer height = 376
integer taborder = 280
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type pb_import from picturebutton within w_runsa_derek_modify
integer x = 2400
integer y = 8
integer width = 265
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "导入"
boolean originalsize = true
end type

event clicked;string ls_ret
string ls_errtext
string ls_sql,ls_path,ls_files
boolean lb_wait
int li_ret

if pb_ok.enabled=false then 
	ls_errtext='请在修改状态下导入!'
	goto e
end if

lb_wait=isvalid(w_wait)

//批量导入
li_ret=GetFileOpenName("Select File",ls_path,ls_files,"Excel", "Excel(*.xls*),*.xls*,All Files (*.*), *.*")
if li_ret=-1 then
	ls_errtext='GetFileOpenName Failed!'
	goto e
elseif li_ret=0 then
	goto e 
end if

ls_errtext=wf_import(ls_path)
if ls_errtext<>'' then goto e

if lb_wait=false then u_derek.closewait()
return 


e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then u_derek.closewait()
return -1
end event

type pb_1 from picturebutton within w_runsa_derek_modify
integer x = 2400
integer y = 132
integer width = 265
integer height = 104
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "测试"
boolean originalsize = true
end type

event clicked;//messagebox('',f_zg_nos('ABCD',1,'tableflags=F;cusno=cusno;buy',g_stanos))
//messagebox('',f_zg_nos('ABCD',1,'tableflags=F;cusno=cusno;zg_channel',g_stanos))

messagebox('',classname(parentwindow()))
end event

type ids_temp from datastore within w_runsa_derek_modify descriptor "pb_nvo" = "true" 
end type

on ids_temp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_temp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

