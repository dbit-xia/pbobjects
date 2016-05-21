$PBExportHeader$u_runsa_derek.sru
$PBExportComments$夏子省浪沙专用用户对象
forward
global type u_runsa_derek from nonvisualobject
end type
type ids from datastore within u_runsa_derek
end type
end forward

shared variables
string ss_filename_app
string ss_dir_app
string ss_flags='|'
end variables

global type u_runsa_derek from nonvisualobject autoinstantiate
ids ids
end type

type variables
privateWrite string is_dberror
u_derek_dd u_dd
u_derek_excel u_excel
u_derek_fun u_fun
boolean ib_wait
privateWrite blob ibb_sql
boolean ib_ufupdate=false
string is_inifile='runsa.ini'
string is_profile_control='control.ini'
privateWrite long il_nrows //最后一次update/retreive成功的行数
boolean ib_cancel
end variables

forward prototypes
public function string gnos (string as_tablename, string as_tableflags, string as_cusno)
public subroutine move (datawindow adw_control)
public function string replace (string as_text, string as_str1, string as_str2)
public function integer uf_dw_excel (datawindow dw_1, string ls_flags, string ls_special)
public function string excel2db (string as_filepath, string as_fields, string as_tablename, string as_dbnames)
public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_tableb)
public function string excel2db_new (string as_filepath, string as_fields, string as_tablename)
public subroutine closewait ()
public function datetime getdate ()
public function string uf_update (boolean a, boolean c)
public function string uf_saveas_lc (datawindow adw, string as_replace)
public function integer sqlcheck (integer ai_commit)
public function integer execddl (string as_sql)
public function string uf_allot_ref (string as_ckaccno, string as_colthno)
public function string uf_sqlexec (string as_sql, any a_parm[])
public function integer uf_sqlexec (string as_sql)
public function string uf_coloth_check (string as_colthno, string as_color)
public function string uf_calendar (dragobject aobj, string as_format)
public subroutine uf_winstyle (window lw_win)
public function string uf_rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_sqlb, string l_tableb)
public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_sqlb, string l_tableb)
public function string uf_db_check (string as_dbno)
public subroutine wait (readonly integer ai_per, readonly string as_text, string as_text2)
public subroutine wait (readonly integer ai_per, readonly string as_text)
public function integer execddl (string as_sql, transaction at_trans)
public function string uf_maintain (string l_field, string l_flags)
public function integer uf_recno_change (string as_tablename, ref long al_recno_current, ref long al_recno_new)
public function window uf_getactivesheet (ref window aw_sheet, readonly string as_classname)
public function window uf_getwindow (ref window aw_sheet, readonly string as_classname)
public function string uf_setstyle (datawindow dd, readonly integer ai_style)
public function integer uf_recno_copy (string as_tablename, ref long al_recno_current, ref long al_recno_new)
public function any getgvar (readonly string as_varname)
public function string getsvar (string ls_varname)
public function string uf_sheet_list ()
public function window uf_getwindow (ref window aw_sheet, readonly string as_classname, string as_menuid)
public function window uf_getactivesheet (ref window aw_sheet, readonly string as_classname, string as_menuid)
public function string uf_maintain (string l_field, string l_flags, ref decimal ld_refvalue, ref string ls_refvalue)
public function string wintype2string (windowtype l_wintype)
public function integer uf_selectinto (string as_sql, ref any a_parm[])
public function string uf_hpbuilder (datawindow dw, string ls_flags)
public function integer uf_log (string as_tablename, string ls_errtext, string ls_nos, integer ai_sucflags, long l_orgcount, long l_newcount)
end prototypes

public function string gnos (string as_tablename, string as_tableflags, string as_cusno);//生成指定表名,列名,店仓名的单号
//参数:as_tablename	单号从表中生成
//as_tableflags	一表多种单据时的值
//as_cusno	店仓代号

string l_cusnoold,l_head_s,l_head_e,l_tps,l_head,l_nos

if f_wgz_lock('exc,'+as_tablename,sqlca)=-1 then 
	rollback;
	f_messagebox('','表未锁住'+','+'请重试',0,0)
	close(w_wait)
	return '-1'
end if 
if as_cusno<>'' then
	l_cusnoold=as_cusno
else
	l_cusnoold='000'+g_stanos
end if

setnull(l_tps)
choose case as_tablename
	case 'nos_mendb'
		choose case as_tableflags
			case 'dbpacka' 	//预发货单号
				l_head=l_cusnoold+'P'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from nos_mendb 
					where colthno=:as_cusno and tablename=:as_tableflags;
			case 'dbod_rollout' 	//预发货单号
				l_head=l_cusnoold+'P'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from nos_mendb 
					where colthno=:as_cusno and tablename=:as_tableflags;
		end choose
	case 'rf_ma'
		choose case as_tableflags
			case '10'
				l_head=as_cusno+'O'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from rf_ma 
					where rtypes=:as_tableflags and ck=:as_cusno;
			case '5'
				l_head=as_cusno+'E'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from rf_ma 
					where rtypes=:as_tableflags and ck=:as_cusno;
			case '9'
				l_head=as_cusno+'I'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from rf_ma 
					where rtypes=:as_tableflags and ck=:as_cusno;
		end choose
	case 'zg_channel'
		choose case as_tableflags
			case 'mid'
				l_head=as_cusno+'N'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from zg_channel 
					where tablename=:as_tableflags and cusno=:as_cusno;
			case 'cnfnod'
				l_head=as_cusno+'D'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from zg_channel 
					where tablename=:as_tableflags and cusno=:as_cusno;
			case 'make'
				l_head=as_cusno+'B'+g_stanos	//没有单号时用
				select max(nos) into :l_tps from zg_channel 
					where tablename=:as_tableflags and cusno=:as_cusno;
		end choose
end choose

if isnull(l_tps) then
	l_nos=l_head+'0001'
else
	l_nos=f_countplus1(l_tps,4)
end if
return l_nos
end function

public subroutine move (datawindow adw_control);
int x2,y2
//powerobject po_1
//po_1=adw_control
//do until typeof(po_1)=window!
//	po_1=po_1.getparent()
//loop
//window w_2
//w_2=po_1
//
//x2=w_2.PointerX ()
//y2=w_2.PointerY ()
//
//messagebox('',string(x2)+string(y2,'/###'))
//
//if w_2.PointerX () + adw_control.width > w_2.width then
//	x2=w_2.PointerX () - adw_control.width
//end if
//if w_2.PointerY () + adw_control.height > w_2.height then
//	y2=w_2.PointerY () - adw_control.height
//end if
//adw_control.bringtotop=true
//adw_control.move(x2,y2)
powerobject po_parent
po_parent=adw_control.getparent()
adw_control.bringtotop=true
adw_control.move(po_parent.dynamic pointerx(),po_parent.dynamic pointery())
end subroutine

public function string replace (string as_text, string as_str1, string as_str2);//字符串替换函数
//参数1:操作的字符串
//参数2:要替换的字符
//参数3:目标字符

int li_pos
int li_len1,li_len2
li_len1=len(as_str1)
li_len2=len(as_str2)
li_pos=Pos(as_text,as_str1,1)
do while(li_pos>0)
	as_text=Replace(as_text,li_pos,li_len1,as_str2)
	li_pos=Pos(as_text,as_str1,li_pos + li_len2 + 1)
loop
return as_text
end function

public function integer uf_dw_excel (datawindow dw_1, string ls_flags, string ls_special);//f_dw_excel(dw_1,'dfile=c:\qqq.xls;num','heady=头部分离位置;')  解决头部导致的错位问题

String l_excelfile = "c:\office971\office\excel.exe",l_tempfile = "",l_bat,l_tempstring = '',l_tempfile2 = '',l_dwobject
String l_file0 = '',l_wfile0 = '',ls_error = '',ls_temp,l_xlstempfile,l_tps = '',ls_xlsext,l_tempfile3,ls_tps,l_tempfilet
String l_registerstring,l_returnstring,l_field,ld_field[300],ld_son[1000],l_d_file = '',ls_notxtxls = '',ls_tempfile
Long l_return,l_fp,ld_count = 0,l_i,l_j,ld_right[100],l_pos,l_emprow,l_noemp = 0,l_kk,l_heady = 0
Boolean lb_wait = False
u_rjh_excel ui_xls
Any l_any1,l_any2,l_any3,ld_nameany,ld_typeany,ld_contentany
datawindow dw_100,dw_temp
datawindowchild dw_s

//解决头部太复杂导致错位，采用分离技术实现 
l_heady = Long(f_maintain_s(ls_special,'heady=',''))

//l_d_file = f_maintain_s(ls_flags,'dfile=','')
//messagebox(ls_flags,l_d_file)
l_pos=Pos(ls_flags,'dfile=')
if l_pos>0 then
 l_d_file=Mid(ls_flags,l_pos+6,Len(ls_flags))
 ls_flags=Mid(ls_flags,1,l_pos -  1) + Mid(l_d_file,Pos(l_d_file,';')+1,Len(l_d_file)) 
 l_d_file=Mid(l_d_file,1,Pos(l_d_file,';') - 1)
else
 l_d_file=''
end if

//messagebox(ls_flags,l_d_file)
l_dwobject = f_dw_dataobject(dw_1,'')

ls_xlsext = 'xls'
If gs_xlsver >= '2007' And ls_flags <> 'excel' Then
	ls_xlsext = 'xlsx'
End If

l_wfile0 = g_zgtemppath+'\'+'wexcel'+gs_id
l_file0 = g_zgtemppath+'\'+'excel'+gs_id


If dw_1.RowCount() = 0 Then
	f_messagebox('',f_wl('无记录'),0,0)
	Return 0
End If

FileDelete(l_wfile0+"."+ls_xlsext)
FileDelete(l_wfile0+".dbf")

FileDelete(l_file0)
FileDelete(l_file0+".txt")
FileDelete(l_file0+"."+ls_xlsext)
FileDelete(l_file0+".dbf")
sleep(1)
ld_count = 0
If ls_special <> '' Then
	ld_count = 0
	Do While Pos(ls_special,',') > 0
		If f_field(dw_1,Mid(ls_special,1,Pos(ls_special,',') - 1),'valid') = 0 Then
			ld_count = ld_count + 1
			ld_field[ld_count] = Mid(ls_special,1,Pos(ls_special,',') - 1)
		End If
		ls_special = Mid(ls_special,Pos(ls_special,',') + 1,Len(ls_special))
	Loop
End If

If  f_wgz_dw_syntax(dw_1,'style','') = 'report'  Then
	/*每个子窗口复制到文件并合并  and (dw_1.dataobject='d_zg_hp_print_contract' or dw_1.dataobject='d_colothcost_craft')*/
	
	
	l_tempfile = l_file0+".txt"
	l_tempfile2 = l_file0+"2.txt"
	/*套表不支持xlsx格式*/
	l_xlstempfile = l_file0+"."+'xls' //ls_xlsext
	dw_100 = w_main.dw_1
	dw_100.Reset()
	
	FileDelete(l_tempfile)
	
	/*动态无*/
	ld_count = f_dw_band(dw_1,l_any1,l_any2,l_any3,'report')
	ld_son = l_any1
	
	If ld_count > 0 Then
		For l_i = 1 To ld_count
			If dw_1.GetChild(ld_son[l_i],dw_s) = 1 Then
				l_return = dw_100.Create(dw_s.Describe('datawindow.syntax'),ls_error)
				If l_return = 1 Then
					dw_100.SetTransObject(sqlca)
					l_return = dw_s.RowsCopy(1,dw_s.RowCount(),Primary!, dw_100, 1, Primary!)
					l_return = dw_100.RowCount()
					
					/*060927 新版本*/
					FileDelete(l_xlstempfile)
					FileDelete(l_tempfile2)
					uf_save_dw_as_excel(dw_100,l_xlstempfile)
					
					w_mdi_zx.ole_xls.Object.txtfile = l_xlstempfile
					w_mdi_zx.ole_xls.Object.xlsopen(False)
					w_mdi_zx.ole_xls.Object.XlsSaveas(l_tempfile2,True,'')
					w_mdi_zx.ole_xls.Object.xlclose(1)
					
					//      /*并入l_tempfile*/
					f_wgz_file_copy(l_tempfile2,l_tempfile,'append')
					
				End If
			End If
		Next
		// w_mdi_zx.ole_xls.object.xlclose()
	End If
	
	w_mdi_zx.ole_xls.Object.txtfile = l_tempfile
	If ls_temp = '' Then ls_temp = '1'
	w_mdi_zx.ole_xls.Object.Opentext2(1,ls_temp,1)
	w_mdi_zx.ole_xls.Object.xlclose()
	Return 0
ElseIf  l_dwobject = 'ewewewewewewewe' Then //'d_u2analysis_stock_2' then //dw_1.dataobject='d_u2analysis_stock' or
	/*黑名单crosstab*/
	l_tempfile = l_wfile0+"."+ls_xlsext //xls"
	dw_1.SaveAs(l_tempfile,excel8!,True)
	
Else
	
//	messagebox('ls_flags',ls_flags)
	
	Choose Case ls_flags
		Case 'excel'
			l_tempfile = l_wfile0+"."+ls_xlsext //xls"
			dw_1.SaveAs(l_tempfile,excel8!,True)
		Case Else
			l_tempfile = l_file0+"1.txt"
			If FileExists(l_tempfile) Then
				FileDelete(l_tempfile)
			End If
			
			
			If FileExists(l_tempfile) Then
				For l_i = 1 To 1000
					l_tps = l_file0+'WX'+String(l_i)+'A1'+'.txt'
					If FileExists(l_tps) Then
						FileDelete(l_tps)
					End If
					If Not FileExists(l_tps) Then
						l_tempfile = l_file0+'WX'+String(l_i)+'A'+'.txt'
						Exit
					End If
				Next
			Else
				l_tempfile = l_file0+".txt"
			End If
			
			If ls_xlsext = 'xls' And dw_1.RowCount() >= 65000 Then
				f_messagebox('','Excel2003只能打开65000行记录;'+&
					'本次导出超出行数,系统自动将文件作为txt保存;'+&
					'请用Excel2007打开该txt文件',0,0)
				
			End If
			
			If Pos(f_dw_dataobject(dw_1,''),'d_zg_hp_print') > 0  And l_heady = 0 Then
				l_heady = Long(dw_1.Describe('colthno_t.y'))
				
			End If
			
//			messagebox('l_heady',l_heady)
			
			If l_heady > 0 Then
				//采用两个文件合并，解决横排错位问题
				//dw_1.SaveAs("c:\myxml.xml", XML!, false)
				
				If Pos(dw_1.DataObject,'.psr') = 0 Then
					l_file0 = l_file0 + l_dwobject
				End If
				
				l_tempfile2 = l_file0+"2.txt"
				l_tempfilet = l_file0+"t.txt"
				l_tempfile3 = l_file0+".psr"
				
				FileDelete(l_tempfile2)
				FileDelete(l_tempfilet)
				FileDelete(l_tempfile3)
				
				dw_1.SaveAs(l_tempfile3,PSReport!,True)
				
				/********/
				Open(w_gen_ole)
				dw_temp = w_gen_ole.dw_1
				dw_temp.DataObject = l_tempfile3
				f_dw_band(dw_temp,ld_nameany,ld_typeany,ld_contentany,'headerinvisible='+String(l_heady))
				dw_temp.SaveAsAscii(l_tempfile2)
				ui_xls = Create u_rjh_excel
				ui_xls.txt_xls(l_tempfile2,'"~t')
				l_tempfile2 = l_file0+"21.txt"
				Destroy ui_xls
				
				//明细 l_tempfile2
				dw_temp.DataObject = l_tempfile3
				//头部 l_tempfile
				f_field(dw_temp,'','nodetail')
				f_field(dw_temp,'','nodetail1')
				f_field(dw_temp,'','nodetail2')
				dw_temp.SaveAsAscii(l_tempfile)
				//空行处理
				l_fp = FileOpen(l_tempfile2,linemode!,Read!)
				l_emprow = 0
				Do While FileRead(l_fp,ls_tps) >= 0 And  l_emprow < 100
					//"" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" //
					l_noemp = 0
					For l_kk = 1 To 100
						If  Mid(ls_tps,l_kk,1) = '"' Or  Mid(ls_tps,l_kk,1) = ' ' Or   Mid(ls_tps,l_kk,1) = '' Then
						Else
							l_noemp = 1
							Exit
						End If
					Next
					If l_noemp = 0 Then
						l_emprow = l_emprow + 1
					Else
						Exit
					End If
				Loop
				FileClose(l_fp)
				//取消 l_tempfile   空行下面记录
				filecopy(l_tempfile,l_tempfilet)
				
				//
				f_wgz_file_copy(l_tempfilet,l_tempfile,'endrow='+String(l_emprow)+';')
				f_wgz_file_copy(l_tempfile2,l_tempfile,'startrow='+String(l_emprow + 1)+';append')
				Close(w_gen_ole)
				//dw_1.dataobject=l_tempfile3 
				
				/********/
				
				ls_notxtxls = '1'
				/***********/
			Else
				
				//grid特殊处理 xp在20万以处理psr上容易崩溃
				//if f_wgz_dw_syntax(dw_1,'style','')='grid' then
				If f_wgz_dw_syntax(dw_1,'style','') = 'grid' And Not(g_os+g_os2 = 'nt5.1' And dw_1.RowCount() > 20*10000)  Then
					
//					messagebox('Open(w_gen_ole)',l_tempfile)
					Open(w_gen_ole)
					dw_100 = w_gen_ole.dw_1
					
					//     dw_100=w_main.dw_1
					ls_tempfile = g_zgtemppath+'\'+sqlca.Database+'gridout'+'-'+l_dwobject+'.psr'
					dw_1.SaveAs(ls_tempfile,PSReport!,True)
					dw_100.DataObject = ls_tempfile
					/*同时解决无法导出问题，必须是band*/
					f_dw_band(dw_100,l_any1,l_any2,l_any3,'ground_header')
					If ls_tempfile <> '' Then FileDelete(ls_tempfile)
					If dw_100.SaveAsAscii(l_tempfile) = -1 Then
						f_messagebox('',f_wl('文件保存失败')+' ~r~n'+f_wl('没有空间或没有写的权限')+'  ~r~n'+l_tempfile,0,0)
						Return 0
					End If
					
					Close(w_gen_ole)
				Else
//					messagebox('SaveAsAscii','SaveAsAscii')
					If dw_1.SaveAsAscii(l_tempfile) = -1 Then
						f_messagebox('',f_wl('文件保存失败')+' ~r~n'+f_wl('没有空间或没有写的权限')+'  ~r~n'+l_tempfile,0,0)
						Return 0
					End If
				End If
			End If
			
			
	End Choose
End If
//MessageBox('l_d_file',l_d_file)
If l_d_file <> '' Then
	w_mdi_zx.ole_xls.Object.txtfile = l_tempfile
	w_mdi_zx.ole_xls.Object.Opentext2(1,'',1)
	FileDelete(l_d_file)
	w_mdi_zx.ole_xls.Object.xlssaveas(l_d_file)
	w_mdi_zx.ole_xls.Object.xlclose(1)
	l_tempfile = l_d_file
End If
f_excel_file('notxtxls='+ls_notxtxls+';'+l_tempfile,dw_1,ls_flags)

Return 0


end function

public function string excel2db (string as_filepath, string as_fields, string as_tablename, string as_dbnames);//参数1:文件路径
//参数2:excel中的字段名称,如果有空格则要加[],如果起别名并且字段没有打到,则会提示别名异常
//参数3:要更新的表名
//参数4:更新到表中的字段名称(格式:a,b,,c,d,,f...),会按照参数2的顺序一个一个设置dbname,为空的跳过

string ls_sheetnames[]
long i,l_rowcount
string ls_ret,ls_modify
string ls_errtext
string ls_current_path,ls_files
int li_ret

//获取当前目录
ls_current_path=GetCurrentDirectory()
ib_wait=isvalid(w_wait)

if as_filepath='' then 
	//批量导入
	li_ret=GetFileOpenName("Select File",as_filepath,ls_files,"Excel", "Excel(*.xls*),*.xls*,All Files (*.*), *.*")
	if li_ret=-1 then
		ls_errtext='GetFileOpenName Failed!'
		goto e
	elseif li_ret=0 then
		ls_errtext='0'
		goto e 
	end if
end if

wait(10,'Get sheetnames')

//自动连接excel app,但不自动断开
ls_errtext=u_excel.getsheetnames(as_filepath,ls_sheetnames[])

if ls_errtext<>'' then goto e

wait(20,'Create connection')

//根据excel app版本获取odbc_excel的drive,并connect
ls_errtext=u_excel.getodbctrans(as_filepath,'')

//断开excel app
u_excel.iobj.disconnectobject()

if ls_errtext<>'' then goto e

wait(30,'Create data object')

ls_errtext=u_dd.getquery(ids,"select "+as_fields+" from ["+ls_sheetnames[1]+"$]",u_excel.isqlca)
if ls_errtext<>'' then goto e

wait(33,'Set object dbname')

ls_errtext=u_dd.setdbname(ids,as_dbnames)
if ls_errtext<>'' then goto e

wait(36,'Set object updates')

//if right(as_dbnames,1)<>',' then as_dbnames+=','
//
//li_ret=u_fun.replaceex(as_dbnames,',',',')
//ls_modify="DataWindow.Table.UpdateTable='"+as_tablename+"' datawindow.table.UpdateKeyInPlace=yes datawindow.Table.UpdateWhere=0 "
//for i=1 to li_ret
//	ls_modify+="#"+string(i)+".update=yes #"+string(i)+".key=yes "
//next
//
//ls_errtext=ids.modify(ls_modify)
//if ls_errtext<>'' then goto e

ls_errtext=u_dd.setdbupdates(ids,as_tablename,as_dbnames)
if ls_errtext<>'' then goto e


wait(40,'Importing')

ids.settransobject(u_excel.isqlca)
l_rowcount=ids.retrieve()
disconnect using u_excel.isqlca;


if l_rowcount<=0 then 
	ls_errtext="No data!"
	goto e
end if

wait(50,'Data processing')

for i=1 to l_rowcount
	ids.SetItemStatus(i,0,primary!,newmodified!)
next

wait(60,'Data Saving')

ids.settransobject(sqlca)

if ids.update()=1 then 

else
	ls_errtext="Save Failed:"+is_dberror
	goto e
end if

e:
if isalive(u_excel.iobj) then u_excel.iobj.disconnectobject()
u_fun.SetCurrentDirectory(g_current_path)
if ib_wait=false then closewait()
return ls_errtext
end function

public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_tableb);//两个事务通过rowscopy进行数据复制,没有进行提交
//返回成功行数,-1 为失败,il_dberror记录错误信息
 
string l_string
long i,l_rowcount

is_dberror=''	//清除错误信息

wait(10,'创建数据对象')

//l_string=u_dd.getquery(ids,l_sqlb,l_sqlcb)	//使ids成为一个可以保存的数据对象
l_string=u_dd.getmodify(ids,l_sqla,l_tableb,l_sqlca)	//使ids成为一个可以保存的数据对象

if l_string<>'' then 
	is_dberror+=l_string
	goto e
end if

ids.settransobject(l_sqlca)

wait(20,'正在检索数据')

l_rowcount=ids.retrieve()	//返回查询行数 -1为失败

if l_rowcount=-1 then goto e

if l_rowcount=0 then goto m	//无记录

ids.settransobject(l_sqlcb)

wait(40,'数据正在传输')

for i=1 to l_rowcount
	ids.setitemstatus(i,0,Primary!	,NewModified!)
next 

wait(50,'数据正在保存')

if ids.update()=1 then  
	return l_rowcount
else
	is_dberror+='保存失败!'
	goto e
end if

m:
return 0

e:
return -1
end function

public function string excel2db_new (string as_filepath, string as_fields, string as_tablename);//参数1:文件路径
//参数2:excel中的字段名称,如果有空格则要加[],如果起别名并且字段没有打到,则会提示别名异常
//参数3:要更新的表名
//参数4:更新到表中的字段名称(格式:a,b,,c,d,,f...),会按照参数2的顺序一个一个设置dbname,为空的跳过

string ls_sheetnames[]
long i,l_rowcount
string ls_ret
string ls_errtext
string ls_current_path,ls_files,ls_sqla
int li_ret

//获取当前目录
ls_current_path=GetCurrentDirectory()
ib_wait=isvalid(w_wait)

if as_filepath='' then 
	//批量导入
	li_ret=GetFileOpenName("Select File",as_filepath,ls_files,"Excel", "Excel(*.xls*),*.xls*,All Files (*.*), *.*")
	if li_ret=-1 then
		ls_errtext='GetFileOpenName Failed!'
		goto e
	elseif li_ret=0 then
		ls_errtext='0'
		goto e 
	end if
end if

wait(10,'Get sheetnames')

//自动连接excel app,但不自动断开
ls_errtext=u_excel.getsheetnames(as_filepath,ls_sheetnames[])

if ls_errtext<>'' then goto e

wait(20,'Create connection')

//根据excel app版本获取odbc_excel的drive,并connect
ls_errtext=u_excel.getodbctrans(as_filepath,'')

//断开excel app
u_excel.iobj.disconnectobject()

if ls_errtext<>'' then goto e

wait(30,'Create data object')

//ls_errtext=u_dd.getmodify(ids,"select "+as_fields+" from ["+ls_sheetnames[1]+"$]",as_tablename,u_excel.isqlca)
//if ls_errtext<>'' then goto e
//
//ls_errtext=u_dd.setdbname(ids,as_dbnames)
//if ls_errtext<>'' then goto e
//
//wait(40,'Importing')
//
//ids.settransobject(u_excel.isqlca)
//l_rowcount=ids.retrieve()
//disconnect using u_excel.isqlca;


ls_sqla="select "+as_fields+" from ["+ls_sheetnames[1]+"$]"

l_rowcount=rowscopy(u_excel.isqlca,sqlca,ls_sqla,as_tablename)
messagebox('',l_rowcount)
disconnect using u_excel.isqlca;

if l_rowcount=-1 then 
	ls_errtext="Save Failed:"+is_dberror
	goto e
end if 

if l_rowcount<=0 then 
	ls_errtext="No data!"
	goto e
end if

//wait(50,'Data processing')
//
//for i=1 to l_rowcount
//	ids.SetItemStatus(i,0,primary!,newmodified!)
//next
//
//wait(60,'Data Saving')
//
//ids.settransobject(sqlca)
//if ids.update()=1 then 
//
//else
//	ls_errtext="Save Failed:"+is_dberror
//	goto e
//end if

e:
if isalive(u_excel.iobj) then u_excel.iobj.disconnectobject()
u_fun.SetCurrentDirectory(g_current_path)
if ib_wait=false then closewait()
return ls_errtext
end function

public subroutine closewait ();
if isvalid(w_wait) then close(w_wait)

//u_dd.closewait()



end subroutine

public function datetime getdate ();//得到事务SQLCA的数据库时间
datetime ld_getdate
ld_getdate=datetime(today(),now())
select isnull(max(getdate()),getdate()) into :ld_getdate from onerecord where 1<>1;
if sqlca.sqlcode=-1 then 
	f_messagebox('',sqlca.sqlerrtext,0,0)
end if
return ld_getdate
end function

public function string uf_update (boolean a, boolean c);int li_ret=1
string ls_sql
string ls_errtext,ls_ret

ibb_sql=blob('')
ib_ufupdate=true

if ids.update(a,c)=-1 then 
	ls_errtext="Update Failed!"
	goto e
end if

if len(ibb_sql)=0 then goto e

ls_sql=string(ibb_sql)

execute immediate :ls_sql;

if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	goto e
end if

e:
ib_ufupdate=false
return ls_errtext
end function

public function string uf_saveas_lc (datawindow adw, string as_replace);
string ls_path,ls_file,ls_file_temp,ls_ext	//选择的路径	//选择的文件
long i,l_ret,l_count,l_pos
string ls_errtext
string ls_excelext
dec ld_excelver
string ls_current_path,ls_htmlsyntax
string ls_extstring="Comma-separated values(*.csv),*.csv,Text Document(*.txt),*.txt,Html Table(*.html),*.html,Powersoft Report(*.psr),*.psr,Enhanced Metafile Format(*.emf),*.emf,All Files (*.*),*.*"
ls_path=adw.title



//f_dw_excel只能正常导出xls
ld_excelver=dec(u_excel.getversion(ls_errtext))
if ls_errtext='' then 
	if ld_excelver>=12.0 then 
		ls_excelext="xlsx"
	else
		ls_excelext="xls"
	end if 
	ls_extstring="Excel(*."+ls_excelext+"),*."+ls_excelext+","+ls_extstring
else
	f_messagebox('',ls_errtext,0,0)
	ls_errtext=''
end if
//获取当前目录
ls_current_path=GetCurrentDirectory()
ib_wait=isvalid(w_wait)


//批量导入
l_ret=GetFileSaveName("Save as",ls_path,ls_file,"", ls_extstring)
if l_ret=-1 then
	ls_errtext='打开函数调用失败!'
	goto e
elseif l_ret=0 then
	ls_errtext='0'
	goto e 
end if

if fileexists(ls_path) then 
	if upper(as_replace)='Y' then

	else
		if messagebox('','File "'+ls_path+'" already exists,replace?',exclamation!,yesno!,2)<>1 then 
			ls_errtext='0'
			goto e 
		end if
	end if
end if

//临时文件路径
ls_file=g_zgtemppath+'\'+ls_file
l_pos=lastpos(ls_file,'.')
ls_ext=upper(mid(ls_file,l_pos))

choose case ls_ext
	case '.TXT' //指定txt类型时会系统自动加上txt后缀
		l_ret=adw.SaveAsFormattedText(ls_file,Encodingansi!)
	case '.CSV','.XLSX','.XLS'
		ls_file_temp=mid(ls_file,1,l_pos - 1)+'.csv'
		l_ret=adw.SaveAsFormattedText(ls_file_temp,encodingansi!,',','"')
		if l_ret=1 and ls_ext<>'.CSV' then
			if ld_excelver>=12.0 then	//>=2007
				if ls_ext='.XLSX'  then 
					ls_errtext=u_excel.sheetsaveas(ls_file_temp,1,ls_file,51)
				elseif ls_ext='.XLS' then
					ls_errtext=u_excel.sheetsaveas(ls_file_temp,1,ls_file,56)
				end if
			elseif ld_excelver>0 then	//小于2007
				ls_errtext=u_excel.sheetsaveas(ls_file_temp,1,ls_file,51)
			else	//无excel
				l_ret=filecopy(ls_file_temp,ls_file,true)
			end if
				
			filedelete(ls_file_temp)			
			if ls_errtext<>'' then goto e
		end if
	case '.HTM','.HTML'
		adw.modify("DataWindow.HTMLTable.GenerateCSS='1'")	//保持格式及颜色
		adw.modify("DataWindow.HTMLTable.Border='0'")	//不要table边框
		adw.modify("DataWindow.HTMLTable.CellSpacing='0'")	//单元格无间距
		
//		ls_errtext=u_dd.uf_dwoband(adw)
//		if ls_errtext<>'' then goto e
		//增加html标记,否则excel打开时会提示后缀名错误
		ls_htmlsyntax="<html>"+adw.describe("datawindow.data.html")+"</html>"
		//去除css中开头的无效分号
		ls_htmlsyntax=u_fun.replace(ls_htmlsyntax,'{;','{')
		
		if fileexists(ls_file) then 
			if filedelete(ls_file)=false then
				ls_errtext=ls_file+" delete failed!"
				goto e
			end if
		end if
		
		ls_errtext=u_fun.uf_filewrite(ls_file,ls_htmlsyntax)
		if ls_errtext<>'' then goto e
		
//		l_ret=adw.saveas(ls_file,htmltable!,true)
	case '.PSR'
		l_ret=adw.saveas(ls_file,PSReport!,true)
	case '.EMF'
		l_ret=adw.saveas(ls_file,EMF!,true)
	case else
		l_ret=adw.saveas('',PSReport!,true)
end choose

if l_ret<>1 then 
	ls_errtext='File '+ls_file+' Export Failed!'
	goto e
end if

//删除目标文件
if fileexists(ls_path) then 

	if filedelete(ls_path)=false then
		ls_errtext=ls_path+" delete failed!"
		goto e
	end if

end if

//转移到最终路径
l_ret=filemove(ls_file,ls_path)
if l_ret<>1 then 
	ls_errtext='File '+ls_file+' Move Failed:'+string(l_ret)
	goto e
end if

e:
if ls_errtext<>'' and ls_errtext<>'0'  then f_messagebox('',ls_errtext,0,0)

u_fun.SetCurrentDirectory(g_current_path)
if ib_wait=false then closewait()
return ls_errtext
end function

public function integer sqlcheck (integer ai_commit);if sqlca.sqlcode=-1 then goto e
if ai_commit=1 then 
	commit;
	if sqlca.sqlcode=-1 then goto e
end if

return 0

e:
return -1
end function

public function integer execddl (string as_sql);int li_ret=0
boolean lb_commit

lb_commit=sqlca.autocommit

sqlca.autocommit=true

execute immediate :as_sql;

sqlca.autocommit=lb_commit

if sqlca.sqlcode=-1 then li_ret=-1

return li_ret
end function

public function string uf_allot_ref (string as_ckaccno, string as_colthno);//easytemp(g_recno),dba1_nbtemp(g_recno)

string ls_sql,ls_colthno,ls_cusno,ls_errtext
long l_count,i
boolean lb_wait

if string(as_ckaccno,'')<>'' then 
	ls_sql="select ckaccno='"+as_ckaccno+"' "
else
	ls_sql="select ckaccno from zgck_select where recno="+string(g_recno)+" order by ckaccno "
end if
u_dd.getquery(ids,ls_sql)
ids.settransobject(sqlca)
l_count=ids.retrieve()

if l_count=0 then  return ''

delete from easytemp where recno=:g_recno;
if sqlcheck(1)=-1 then goto e

for i=1 to l_count
	ls_cusno=ids.getitemstring(i,'ckaccno')
	f_zg_allot_ref(ls_cusno,'nohp,outck',as_colthno)
	
	if sqlcheck(1)=-1 then goto e
	
	insert into easytemp (recno,dbno,colthno,color,daynum)
	select :g_recno,dbno,colthno,color,nb
	from dba1_nbtemp
	where recno=:g_recno;
	
	if sqlcheck(1)=-1 then goto e
	
next 

return ''

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then closewait()
return ls_errtext
end function

public function string uf_sqlexec (string as_sql, any a_parm[]);int i,li_parmcount
string ls_errtext

PREPARE SQLSA FROM :as_sql; 
DESCRIBE SQLSA INTO SQLDA; 

//若DESCRIBE成功，则输入描述符数组将包含一个输入描述符， 
//在打开游标前必须先给输入描述符赋值。 

li_parmcount=upperbound(a_Parm[])

for i=1 to li_parmcount
	if SetDynamicParm(SQLDA,i,a_Parm[i])<>1 then 
		ls_errtext+='SetDynamicParm:'+string(i)+'失败!~r~n'
	end if
next

DECLARE c1 DYNAMIC cursor FOR SQLSA;

open DYNAMIC c1 USING DESCRIPTOR SQLDA; 

if sqlca.sqlcode=-1 then ls_errtext=sqlca.sqlerrtext+'~r~n'

CLOSE c1;

return ls_errtext
end function

public function integer uf_sqlexec (string as_sql);int li_ret=0
boolean lb_commit

lb_commit=sqlca.autocommit

sqlca.autocommit=true

execute immediate :as_sql;

sqlca.autocommit=lb_commit

if sqlca.sqlcode=-1 then li_ret=-1

return li_ret
end function

public function string uf_coloth_check (string as_colthno, string as_color);string ls_errtext
boolean lb_wait
long l_count

lb_wait=isvalid(w_wait)

as_colthno=string(as_colthno,'')
as_color=string(as_color,'')

//货号存在检查
select count(1) into :l_count
from coloth_t
where colthno=:as_colthno;

if sqlca.sqlcode=-1 then goto e

if l_count=0 then 
	ls_errtext='货号:'+as_colthno+'不存在!'
	goto e
end if

if as_color='' then return ''

//色尺检查
select count(1) into :l_count
from coloth_easy 
where colthno=:as_colthno and color_nos=:as_color;

if sqlca.sqlcode=-1 then goto e

if l_count=0 then 
	ls_errtext='色尺:'+as_color+'不存在!'
	goto e
end if

return ''

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
if lb_wait=false then closewait()
return ls_errtext
end function

public function string uf_calendar (dragobject aobj, string as_format);string ls_sql,ls_errtext
string ls_dwoname,ls_dwo
string l_dates
date l_date
long l_row
datawindow ldw
editmask lem
singlelineedit lsle

choose case typeof(aobj)
	case datawindow!

		ldw=aobj
		ls_dwo=ldw.getobjectatpointer()
		ls_dwoname=mid(ls_dwo,1,pos(ls_dwo,'~t') - 1)
		
		if ldw.describe(ls_dwoname+".type")<>'column' then goto e
		
		l_row=long(mid(ls_dwo,pos(ls_dwo,'~t') + 1))
		if l_row=0 then goto e
		
		if ldw.getrow()<>l_row or ldw.getcolumnname()<>ls_dwoname then 
			if ldw.accepttext()=-1 then goto e
			if  ldw.getrow()<>l_row then 
				if ldw.accepttext()=-1 then goto e
				if ldw.setrow(l_row)=-1 then goto e
				if ldw.getrow()<>l_row then goto e
			end if
			if ldw.getcolumnname()<>ls_dwoname then
				if ldw.setcolumn(ls_dwoname)=-1 then goto e
				if ldw.getcolumnname()<>ls_dwoname then goto e
			end if
		end if
		
		openwithparm(w_calendar,ldw.gettext())
		if as_format='YYYYMMDD' then 
			l_dates=message.stringparm
		else
			l_dates=string(date(string(message.stringparm,'@@@@-@@-@@')),as_format)
		end if
		if l_dates<>'' then 
			ldw.settext(l_dates)
			ldw.accepttext()
		end if
	case editmask!
		lem=aobj
		lem.getdata(l_date)
		openwithparm(w_calendar,string(l_date,'YYYYMMDD'))
		if as_format='YYYYMMDD' then 
			l_dates=message.stringparm
		else
			l_dates=string(date(string(message.stringparm,'@@@@-@@-@@')),as_format)
		end if
		
		lem.text=l_dates
		
	case singlelineedit!
		lsle=aobj
		if isdate(lsle.text) then 
			l_date=date(lsle.text)
		else
			l_date=today()
		end if
		openwithparm(w_calendar,string(l_date,'YYYYMMDD'))
		if as_format='YYYYMMDD' then 
			l_dates=message.stringparm
		else
			l_dates=string(date(string(message.stringparm,'@@@@-@@-@@')),as_format)
		end if
		
		lsle.text=l_dates
		
end choose

return ''

e:
return ls_errtext

end function

public subroutine uf_winstyle (window lw_win);//设置response窗口的风格,使可以resize+max
Long lStyle
Constant Long GWL_STYLE = -16           //窗口样式
Constant Long WS_SYSMENU = 524288       //带系统菜单的窗口
constant long WS_THICKFRAME=262144	//窗口可以改变大小
Constant Long WS_MINIMIZEBOX = 131072   //创建一个有最小化按扭的窗体。
Constant Long WS_MAXIMIZEBOX = 65536    //创建一个有最大化按扭的窗体。

if lw_win.windowtype=response! and lw_win.controlmenu=false then
		
	lStyle = u_fun.GetWindowLongA( Handle(lw_win), -16) //获取原风格
	
	lStyle+=WS_SYSMENU	//控制菜单
	lStyle+=WS_MAXIMIZEBOX	//最大化按钮
//	lStyle+=WS_MINIMIZEBOX	//最小化按钮
	lStyle+=WS_THICKFRAME	//改变大小
	u_fun.SetWindowLongA( Handle(lw_win),  -16, lStyle ) //设置新的风格
	
	//窗口大小会有所改变,所以重新resize
	lw_win.resize(lw_win.workspacewidth(),lw_win.workspaceheight())
	
end if




end subroutine

public function string uf_rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_sqlb, string l_tableb);//两个事务通过rowscopy进行数据复制,没有进行提交
//返回成功行数,-1 为失败,il_dberror记录错误信息
 
string l_string
long i,l_rowcount
string ls_errtext
boolean lb_wait

lb_wait=isvalid(w_wait)

il_nrows=0
is_dberror=''	//清除错误信息

wait(10,'创建数据对象')

l_string=u_dd.getquery(ids,l_sqlb,l_sqlcb)	//使ids成为一个可以保存的数据对象

if l_string<>'' then 
	ls_errtext=l_string
	goto e
end if

ids.settransobject(l_sqlca)

if ids.setsqlselect(l_sqla)<>1 then 
	ls_errtext="Setsqlselect Failed:"
	goto e
end if
wait(20,'正在检索数据')

l_rowcount=ids.retrieve()	//返回查询行数 -1为失败

if l_rowcount=-1 then 
	ls_errtext="检索失败!"
	goto e
end if

if l_rowcount=0 then 
	goto e
end if

ids.settransobject(l_sqlcb)

l_string=u_dd.setupdates(ids,l_tableb,'')

if l_string<>'' then 
	ls_errtext=l_string
	goto e
end if

wait(40,'数据正在传输')

for i=1 to l_rowcount
	ids.setitemstatus(i,0,Primary!	,NewModified!)
next 

wait(50,'数据正在保存')

if ids.update()=-1 then 
	ls_errtext="保存失败!"
	goto e
end if

if lb_wait=false then closewait()
return ''
e:
if is_dberror<>'' then ls_errtext+='~r~n'+is_dberror
if lb_wait=false then closewait()
return ls_errtext
end function

public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_sqlb, string l_tableb);//两个事务通过rowscopy进行数据复制,没有进行提交
//返回成功行数,-1 为失败,il_dberror记录错误信息
 
string ls_ret
ls_ret=uf_rowscopy(l_sqlca,l_sqlcb,l_sqla,l_sqlb,l_tableb)

if ls_ret<>'' then 
	is_dberror=ls_ret
	return -1
else
	return il_nrows
end if
end function

public function string uf_db_check (string as_dbno);string ls_errtext
boolean lb_wait
long l_count

lb_wait=isvalid(w_wait)

as_dbno=string(as_dbno,'')

//货号存在检查
select count(1) into :l_count
from db
where dbno=:as_dbno;

if sqlca.sqlcode=-1 then goto e

if l_count=0 then 
	ls_errtext='店铺代号:'+as_dbno+'不存在!'
	goto e
end if

//色尺检查
select count(1) into :l_count
from db 
where dbno=:as_dbno and (db.stanos = :g_stanos or substring(:g_stanos,1,1) in('Z','X','Y')) and (:g_ckno2='' or 
		db.ckaccno in(select ckaccnomx from zgck_login where ckaccno=:g_ckno2) 
		or db.dbno in(select ckaccnomx from zgck_login where ckaccno=:g_ckno2)) ;


if sqlca.sqlcode=-1 then goto e

if l_count=0 then 
	ls_errtext='非管辖店铺:'+as_dbno+'!'
	goto e
end if

if lb_wait=false then closewait()
return ''

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
if lb_wait=false then closewait()
return ls_errtext
end function

public subroutine wait (readonly integer ai_per, readonly string as_text, string as_text2);//runsa的进度显示窗口
if not isvalid(w_wait) then open(w_wait)
if ai_per<>0 then f_wgz_meter(ai_per)
w_wait.st_1.text=as_text2+''
w_wait.st_wait.text=as_text+''
//w_wait.st_wait2.text=as_text+'...'

//if profilestring(ls_inifile,'derek','exec','')='1' then open(w_derek_sqlexec)

//if not isvalid(w_derek_wait) then 
//	open(w_derek_wait)
//	u_dd.setwait(w_derek_wait)
//end if
//u_dd.wait(ai_per,as_text)

end subroutine

public subroutine wait (readonly integer ai_per, readonly string as_text);//runsa的进度显示窗口
if not isvalid(w_wait) then open(w_wait)
if ai_per<>0 then f_wgz_meter(ai_per)
w_wait.st_wait.text=as_text+''
end subroutine

public function integer execddl (string as_sql, transaction at_trans);int li_ret=0
boolean lb_commit

lb_commit=at_trans.autocommit

at_trans.autocommit=true

execute immediate :as_sql using at_trans;

at_trans.autocommit=lb_commit

if at_trans.sqlcode=-1 then li_ret=-1

return li_ret
end function

public function string uf_maintain (string l_field, string l_flags);//取最新系统变量

string ls_strings,ls_ret

select isnull(max(strings),'') into :ls_strings
from maintain
where enames=:l_field;

if sqlca.sqlcode=-1 then 
	f_messagebox('',sqlca.sqlerrtext,0,0)
	return ''
end if

ls_ret=f_maintain_s(ls_strings,l_flags,'')

return ls_ret


end function

public function integer uf_recno_change (string as_tablename, ref long al_recno_current, ref long al_recno_new);string ls_sql
string ls_errtext
boolean lb_wait

lb_wait=isvalid(w_wait)

ls_sql="delete from "+as_tablename+" where recno="+string(al_recno_new)

execute immediate :ls_sql;

if sqlca.sqlcode=-1 then goto e

ls_sql="update "+as_tablename+" set recno="+string(al_recno_new)+" where recno="+string(al_recno_current)

execute immediate :ls_sql;

if sqlca.sqlcode=-1 then goto e

if lb_wait=false then closewait()
return 0
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then closewait()
return -1
end function

public function window uf_getactivesheet (ref window aw_sheet, readonly string as_classname);//返回第一个classname匹配的窗口
//先返回open的窗口
//再返回活动的sheet

return uf_getactivesheet(aw_sheet,as_classname,'')

//window lw_sheet
//window lw_empty
//
////优先返回窗口类型
//if isvalid(aw_sheet) then return aw_sheet
//
////然后查找当前sheet
//lw_sheet=w_mdi_zx.GetActiveSheet ( )
//if isvalid(lw_sheet) then
//	if classname(lw_sheet)=as_classname then return lw_sheet
//end if
//
//return lw_empty
end function

public function window uf_getwindow (ref window aw_sheet, readonly string as_classname);//返回第一个classname匹配的窗口
//先返回open的窗口
//再返回活动的sheet
//最后按顺序查找

return uf_getwindow(aw_sheet,as_classname,'')

//window lw_sheet
//
////优先返回窗口类型
//if isvalid(aw_sheet) then return aw_sheet
//
////然后查找当前sheet
//lw_sheet=w_mdi_zx.GetActiveSheet ( )
//if isvalid(lw_sheet) then
//	if classname(lw_sheet)=as_classname then goto e
//end if
//
////最后逐个查找sheet
//lw_sheet = w_mdi_zx.GetFirstSheet()
//
//DO WHILE isvalid(lw_sheet)
//
//	if classname(lw_sheet)=as_classname then exit
//	
//	lw_sheet = w_mdi_zx.GetNextSheet(lw_sheet)
//
//LOOP 
//
//e:
//return lw_sheet
end function

public function string uf_setstyle (datawindow dd, readonly integer ai_style);//设置颜色风格等
string ls_modify,ls_ret
string ls_column[],ls_column_t[]
int i
string ls_errtext

choose case ai_style
	case 1
		ls_modify="DataWindow.color=67108864 datawindow.transparency=0 "
		
		ls_column[]=u_dd.getcolumns(dd,0)
		
		for i=1 to upperbound(ls_column[])
			ls_column_t[i]+=ls_column[i]+'_t'
		next
		
		ls_modify+="DataWindow.HTMLTable.GenerateCSS='1' "	//保持格式及颜色
		ls_modify+="DataWindow.HTMLTable.Border='0' "	//不要table边框
		ls_modify+="DataWindow.HTMLTable.CellSpacing='0' "	//单元格无间距
		//ls_modify+="DataWindow.HTMLTable.CellPadding='0' "
		//ls_modify+="DataWindow.HTMLTable.NoWrap='0' "
		ls_modify+=u_dd.getattribstring( ls_column[],'Border',"0")
		ls_modify+=u_dd.getattribstring( ls_column[],"Color",'0~~tif(isRowModified(),rgb(225,0,0),rgb(0,0,0))' ) //
		ls_modify+=u_dd.getattribstring( ls_column[],'Y',"0")
//		ls_modify+=u_dd.getattribstring( ls_column[],'Edit.FocusRectangle','1') //自由风格有效
		//ls_modify+=u_dd.getattribstring( ls_column[],'height',dd.Describe("DataWindow.Detail.Height"))
		ls_modify+=u_dd.getattribstring( ls_column[],'Background.Color',"16777215~~tif(getrow()=currentrow(),rgb(255,255,225),rgb(255,255,255))") //rgb(242,220,219)
		
		ls_modify+=u_dd.getattribstring( ls_column_t,'Background.Color',"12639424") //rgb(242,220,219)
		//ls_modify+=u_dd.getattribstring( ls_column_t,'y',"0")
		
		if dd.dynamic describe('datawindow.Units')='1' then
			ls_modify+=u_dd.getattribstring( ls_column[],'height',string(long(dd.Describe("DataWindow.Detail.Height")) - 1 ))
			//行号
			ls_ret=dd.dynamic describe("cp_rowno.name")
			if ls_ret='!' then 
				ls_modify+='create compute(band=detail alignment="2" expression="getrow()"border="0" color="0" x="0" y="0" height="20~~trowheight() - 0" width="35" format="[GENERAL]" html.valueishtml="0"  name=cp_rowno visible="1"  font.face="Tahoma" font.height="-9" background.color="67108864" transparency="0" ) '
	//			ls_modify+='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="24" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="32630492" background.transparency="0" transparency="0" ) '
			else
				ls_modify+='cp_rowno.border="0" cp_rowno.height="20~~trowheight() - 0" cp_rowno.background.color="67108864" ' //15790320
			end if
			
		end if
		
		ls_errtext=dd.dynamic modify(ls_modify)
		
		if dd.dynamic describe('datawindow.Units')='1' then
			ls_ret=dd.dynamic describe("cp_rowno_t.name")
			if ls_ret='!' then 
				ls_modify='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="24" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" background.transparency="0" transparency="0" ) '
				ls_errtext+=dd.dynamic modify(ls_modify)
			end if
		end if
	
	case 2
		
		ls_modify="DataWindow.color=67108864 datawindow.transparency=0 "
		
		ls_column[]=u_dd.getcolumns(dd,0)
		
		for i=1 to upperbound(ls_column[])
			ls_column_t[i]+=ls_column[i]+'_t'
		next
		
		ls_modify+="DataWindow.HTMLTable.GenerateCSS='1' "	//保持格式及颜色
		ls_modify+="DataWindow.HTMLTable.Border='0' "	//不要table边框
		ls_modify+="DataWindow.HTMLTable.CellSpacing='0' "	//单元格无间距
		//ls_modify+="DataWindow.HTMLTable.CellPadding='0' "
		//ls_modify+="DataWindow.HTMLTable.NoWrap='0' "
		ls_modify+=u_dd.getattribstring( ls_column[],'Border',"0") //无border
//		ls_modify+=u_dd.getattribstring( ls_column[],"Color",'0~~tif(isRowModified(),rgb(225,0,0),rgb(0,0,0))' ) //
		ls_modify+=u_dd.getattribstring( ls_column[],'Y',"0") //上到顶
//		ls_modify+=u_dd.getattribstring( ls_column[],'Edit.FocusRectangle','1') //自由风格有效
		
		ls_modify+=u_dd.getattribstring( ls_column[],'Background.Color',"16777215~~tif(getrow()=currentrow(),rgb(255,255,225),rgb(255,255,255))") //rgb(242,220,219)
		ls_modify+=u_dd.getattribstring( ls_column_t,'Background.Color',"12639424") //rgb(242,220,219)
		//ls_modify+=u_dd.getattribstring( ls_column_t,'y',"0")
		
		
		if dd.dynamic describe('datawindow.Units')='1' then
			ls_modify+=u_dd.getattribstring( ls_column[],'height',string(long(dd.Describe("DataWindow.Detail.Height")) - 1 ))
			//行号
			ls_ret=dd.dynamic describe("cp_rowno.name")
			if ls_ret='!' then 
				ls_modify+='create compute(band=detail alignment="2" expression="getrow()"border="0" color="0" x="0" y="0" height="20~~trowheight() - 0" width="35" format="[GENERAL]" html.valueishtml="0"  name=cp_rowno visible="1"  font.face="Tahoma" font.height="-9" background.color="67108864" transparency="0" ) '
	//			ls_modify+='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="24" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="32630492" background.transparency="0" transparency="0" ) '
			else
				ls_modify+='cp_rowno.border="0" cp_rowno.height="20~~trowheight() - 0" cp_rowno.background.color="67108864" ' //15790320
			end if
		end if
		
		ls_errtext=dd.dynamic modify(ls_modify)
		
		if dd.dynamic describe('datawindow.Units')='1' then
			ls_ret=dd.dynamic describe("cp_rowno_t.name")
			if ls_ret='!' then 
				ls_modify='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="24" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" background.transparency="0" transparency="0" ) '
				ls_errtext+=dd.dynamic modify(ls_modify)
			end if
		end if
		
//		f_messagebox(ls_errtext,ls_modify,0,0)
		
end choose 
	
return ls_errtext


end function

public function integer uf_recno_copy (string as_tablename, ref long al_recno_current, ref long al_recno_new);string ls_sql
string ls_errtext
boolean lb_wait

lb_wait=isvalid(w_wait)

ls_sql="delete from "+as_tablename+" where recno="+string(al_recno_new)

execute immediate :ls_sql;

if sqlca.sqlcode=-1 then goto e

choose case as_tablename
	case 'zgck_select'
		
		insert into zgck_select(recno,ckaccno,ckaccname)
		select :al_recno_new,t1.ckaccno,t2.ckaccname
		from zgck_select t1,zgck_acc t2
		where t1.recno=:al_recno_current and t2.ckaccno=t1.ckaccno;
		
		if sqlca.sqlcode=-1 then goto e
		
	case 'sonendtree'
		
		insert into sonendtree(recno,codes,names,ckaccno)
		select :al_recno_new,t2.dbno,t2.names,t2.ckaccno
		from sonendtree t1,db t2
		where t1.recno=:al_recno_current and t2.dbno=t1.codes;
		
		if sqlca.sqlcode=-1 then goto e
		
	case 'coloth_select'
		
		insert into coloth_select(recno,colthno,color_nos)
		select :al_recno_new,t1.colthno,t1.color_nos
		from coloth_select t1
		where t1.recno=:al_recno_current ;
		
		if sqlca.sqlcode=-1 then goto e

end choose

if lb_wait=false then closewait()
return 0
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then closewait()
return -1
end function

public function any getgvar (readonly string as_varname);choose case lower(as_varname)
	case 'g_recno'
		return g_recno
	case 'g_recno2'
		return g_recno2
	case 'g_recno3'
		return g_recno3
	case 'g_recno4'
		return g_recno4
	case 'g_current_path'
		return g_current_path
	case 'g_color_s'
		return g_color_s
	case 'g_color_len'
		return g_color_len
	case 'g_size_s'
		return g_size_s
	case 'g_size_len'
		return g_size_len
	case 'g_colorf_len'
		return g_colorf_len
	case 'g_stanos'
		return g_stanos
	case 'g_bands'
		return g_bands
	case 'g_dbno'
		return g_dbno
	case 'g_flags1'
		return g_flags1
	case 'g_level'
		return g_level
	case 'personcode'
		return personcode
	case 'password'
		return password
	case 'g_dbstatus'
		return g_dbstatus
	case 'personname'
		return personname
	case 'gs_admit'
		return gs_admit
	case 'g_menutext'
		return g_menutext
	case 'g_controls2'
		return g_controls2
	case else
		return ''
end choose
end function

public function string getsvar (string ls_varname);ls_varname=lower(ls_varname)
if left(ls_varname,1)='|' then 
	if pos(ss_flags,ls_varname)>0 then 
		return '1'
	else
		return ''
	end if
end if
choose case lower(ls_varname)
	case 'ss_filename_app'
		return ss_filename_app
	case 'ss_dir_app'
		return ss_dir_app
	case 'ss_flags'
		return ss_flags
end choose
end function

public function string uf_sheet_list ();window wSheet
string ls_msg

//然后查找当前sheet
wSheet=w_mdi_zx.GetActiveSheet ( )
if isvalid(wSheet) then
	ls_msg+='ActiveSheet:'+classname(wSheet)+'~t'+wSheet.title+'~t'+wintype2string(wSheet.windowtype)+'~r~n'
end if

//最后逐个查找sheet
wSheet = w_mdi_zx.GetFirstSheet()

DO WHILE isvalid(wSheet)
	ls_msg+=classname(wSheet)+'~t'+wSheet.title+'~t'+wintype2string(wSheet.windowtype)+'~r~n'
	wSheet = w_mdi_zx.GetNextSheet(wSheet)
LOOP 

return ls_msg
end function

public function window uf_getwindow (ref window aw_sheet, readonly string as_classname, string as_menuid);//返回第一个classname匹配的窗口
//先返回open的窗口
//再返回活动的sheet
//最后按顺序查找

window lw_sheet
window lw_empty
string ls_title

//优先返回单窗口
if isvalid(aw_sheet) then
	if as_menuid='' then 
		lw_sheet=aw_sheet
		goto ok
	end if
	ls_title=aw_sheet.title
	if left(ls_title,pos(ls_title,'.'))=as_menuid then 
		lw_sheet=aw_sheet
		goto ok
	end if
end if

//然后查找当前sheet
lw_sheet=w_mdi_zx.GetActiveSheet ( )
if isvalid(lw_sheet) then
	if classname(lw_sheet)=as_classname then 
		if as_menuid='' then goto ok
		ls_title=lw_sheet.title
		if left(ls_title,pos(ls_title,'.'))=as_menuid then goto ok
	end if
end if

//最后逐个查找sheet
lw_sheet = w_mdi_zx.GetFirstSheet()

DO WHILE isvalid(lw_sheet)

	if classname(lw_sheet)=as_classname then 
		if as_menuid='' then goto ok
		ls_title=lw_sheet.title
		if left(ls_title,pos(ls_title,'.'))=as_menuid then goto ok
	end if
	lw_sheet = w_mdi_zx.GetNextSheet(lw_sheet)

LOOP 


return lw_empty

ok:
return lw_sheet
end function

public function window uf_getactivesheet (ref window aw_sheet, readonly string as_classname, string as_menuid);//返回第一个classname匹配的窗口
//先返回open的窗口
//再返回活动的sheet

window lw_sheet
window lw_empty
string ls_title

//优先返回窗口类型
if isvalid(aw_sheet) then
	if as_menuid='' then 
		lw_sheet=aw_sheet
		goto ok
	end if
	ls_title=aw_sheet.title
	if left(ls_title,pos(ls_title,'.'))=as_menuid then 
		lw_sheet=aw_sheet
		goto ok
	end if
end if

//然后查找当前sheet
lw_sheet=w_mdi_zx.GetActiveSheet ( )
if isvalid(lw_sheet) then
	if classname(lw_sheet)=as_classname then 
		if as_menuid='' then goto ok
		ls_title=lw_sheet.title
		if left(ls_title,pos(ls_title,'.'))=as_menuid then goto ok
	end if
end if

return lw_empty

ok:
return lw_sheet
end function

public function string uf_maintain (string l_field, string l_flags, ref decimal ld_refvalue, ref string ls_refvalue);//取最新系统变量

string ls_strings,ls_ret

ld_refvalue=0
ls_refvalue=''

select isnull(max(decimals),0),isnull(max(strings),'') into :ld_refvalue,:ls_strings
from maintain
where enames=:l_field;

if sqlca.sqlcode=-1 then goto e

if l_flags<>'' then 
	ls_refvalue=f_maintain_s(ls_strings,l_flags,'')
else
	ls_refvalue=ls_strings
end if

return ''

e:
return sqlca.sqlerrtext


end function

public function string wintype2string (windowtype l_wintype);choose case l_wintype
	case child!
		return 'Child!'
	case response!
		return  'Response!'
	case Main!
		return 'Main!'
	case mdi!
		return 'Mdi!'
	case mdihelp!
		return 'Mdihelp!'
	case popup!
		return 'Popup!'
end choose
end function

public function integer uf_selectinto (string as_sql, ref any a_parm[]);string Stringvar, Sqlstatement
integer i,Intvar,li_NumOutputs
Long LongVar

Sqlstatement = as_sql

PREPARE SQLSA FROM :Sqlstatement ;
if sqlca.sqlcode=-1 then goto e
DESCRIBE SQLSA INTO SQLDA ;
if sqlca.sqlcode=-1 then goto e
DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
if sqlca.sqlcode=-1 then goto e
OPEN DYNAMIC my_cursor USING DESCRIPTOR SQLDA ;
if sqlca.sqlcode=-1 then goto e
FETCH my_cursor USING DESCRIPTOR SQLDA ;
if sqlca.sqlcode=-1 then goto e

li_NumOutputs=SQLDA.NumOutputs

for i=1 to li_NumOutputs
	CHOOSE CASE SQLDA.OutParmType[i]
		CASE TypeString!
			Stringvar = GetDynamicString(SQLDA, i)
			a_parm[i]=Stringvar
		CASE TypeInteger!,TypeLong!,TypeByte!,TypeUInt!,TypeUInt!,TypeULong!
			Intvar = GetDynamicNumber(SQLDA, i)
			a_parm[i]=Intvar
		CASE TypeLongLong!,TypeDecimal!,TypeReal!,TypeDouble!
			 Longvar = GetDynamicDecimal(SQLDA, i)
			 a_parm[i]=Longvar
		case Typedate! 
			a_parm[i]=GetDynamicDate (SQLDA, i)
		case typedatetime!
			a_parm[i]=GetDynamicDateTime (SQLDA, i)
		case typetime!
			a_parm[i]=GetDynamicTime(SQLDA, i)
	END CHOOSE
next

CLOSE my_cursor ;
if sqlca.sqlcode=-1 then goto e

return li_NumOutputs

e:
return -1
end function

public function string uf_hpbuilder (datawindow dw, string ls_flags);
//ue_cm  动态添加及给列赋值
string ls_cm1,ls_cm2,ls_cm3,ls_cm4,ls_cm5,ls_cm6,ls_cm7,ls_cm8,ls_cm9,ls_cm10
string ls_cm11,ls_cm12,ls_cm13,ls_cm14,ls_cm15,ls_cm16,ls_cm17,ls_cm18,ls_cm19
string ls_cm20
integer i,j,m,z
integer li_count=0
integer li_y=0 
integer li_yy
integer li_t
string ls_syntax
string str_object
string str_objects,ls_sizekind
integer int_pos
int li_visible
int li_kinds,li_print,li_rowheight=20
string ls_ggname
string ls_sql
string ls_errtext,ls_modify
string ls_hpsd,ls_band,ls_border

li_visible=0
ls_syntax = dw.object.datawindow.syntax

ls_sql=f_maintain_s(ls_flags,'sql=',';')
ls_band=f_maintain_s(ls_flags,'band=',';')
if ls_band='' then ls_band='Header'
ls_border=f_maintain_s(ls_flags,'border=',';')
if ls_border='' then ls_border='4'

if ls_sql='' then
	
	ls_hpsd=f_maintain_s(ls_flags,'HPSD=',';')
	if ls_hpsd='' then 
		ls_hpsd=uf_maintain('hpsizekind','HPSD=')
	end if
	
	if ls_hpsd='1' then
		
		ls_sql='select kinds=(select count(t3.sizekind) from (select sizekind=sizekindhp from gg_sizekind union select sizekind from gg where not exists(select 1 from gg_sizekind where gg_sizekind.sizekind=gg.sizekind)) t3 where t3.sizekind<=tmp.sizekind),*  from &
					(select distinct sizekind=t1.sizekindhp,gg_print=gg.gg_print,gg_no=gg.gg_no,gg_name=gg.gg_name &
						from gg_sizekind t1,gg &
						where gg.sizekind=t1.sizekind &
						union all &
						select sizekind=sizekind,gg_print=gg.gg_print,gg_no=gg.gg_no,gg_name=gg.gg_name &
						from gg &
						where not exists(select 1 from gg_sizekind where gg_sizekind.sizekind=gg.sizekind) &
					) tmp &
					order by kinds' 
					
	else
		ls_sql='select distinct kinds=kinds ,sizekind=sizekind,gg_print=gg.gg_print,gg_no=gg.gg_no,gg_name=gg.gg_name &
					from gg &
					order by kinds' 
	end if
	
end if
//messagebox('',ls_sql)
//clipboard(ls_sql)
			
ls_errtext=u_dd.getquery(ids,ls_sql) 
if ls_errtext<>'' then goto e
ids.settransobject(sqlca)
if ids.retrieve()=-1 then 
	ls_errtext='Retrieve:'+is_dberror
	goto e
end if

li_kinds=integer(ids.describe("Evaluate('max(kinds)',0)"))
li_print=integer(ids.describe("Evaluate('max(gg_print)',0)"))

for i=1 to li_kinds
	if li_count = 0 then
		li_yy = 1
	else
		li_yy = ((li_rowheight + 1) * li_count) + 1
	end if
	z=integer(ids.describe("Evaluate('sum(if(kinds="+string(i)+",1,0))',0)"))
	if z<1 then continue;
	for j=1 to li_print 
		ls_ggname=ids.describe("Evaluate(~"max(if(kinds="+string(i)+" and gg_print="+string(j)+",gg_name,''))~",0)")
		ls_syntax = ls_syntax + "~r~n" + 'text(name=t_price'+string(j)+' visible="1" band='+ls_band+' font.charset="0" font.face="Arial" font.family="2" font.height="-9" font.pitch="2" font.weight="400" background.mode="1" background.color="536870912" color="33554432" alignment="2" border="'+ls_border+'"  x="'+ dw.describe("price"+string(j)+".X") + '" y="' + string(li_y + li_yy ) + '" height="'+string(li_rowheight)+'" width="'+ dw.describe("price"+string(j)+".width") + '" text="' + ls_ggname + '" )'
	next
	ls_sizekind=ids.describe("Evaluate(~"max(if(kinds="+string(i)+" ,sizekind,''))~",0)")
	ls_syntax = ls_syntax + "~r~n" + 'text(name=t_sizekind'+string(i)+' visible="1" band='+ls_band+' font.charset="0" font.face="Arial" font.family="2" font.height="-9" font.pitch="2" font.weight="400" background.mode="1" background.color="536870912" color="33554432" alignment="2" border="'+ls_border+'"  x="'+ dw.describe("bz10.X") + '" y="' + string(li_y + li_yy ) + '" height="'+string(li_rowheight)+'" width="'+ dw.describe("bz10.width") + '" text="' + ls_sizekind + '" )'
	li_count = li_count + 1
next

//ls_syntax = replace(ls_syntax,pos(ls_syntax,"processing="),12,"processing=1")

if dw.create(ls_syntax)=-1 then 
	ls_errtext='Create=-1'
	goto e
end if

ls_modify+="DataWindow."+ls_band+".Height='" + string(((li_rowheight + 1) * li_count)) + "' "

//messagebox('',li_print)
//for m=li_print + 1 to 20
//	ls_modify+="price"+string(m)+".Visible='0' "
//next
//messagebox('',ls_modify)
//do while int_pos > 0
//	str_object = left(str_objects,int_pos - 1)
//	str_objects = mid(str_objects,int_pos + 1)
//	int_pos = pos(str_objects,"~t")
//	if dw.describe(str_object + ".Band") = "header" and left(str_object,2) <> "t_" then
//		ls_modify+=str_object+".y='"+string(li_count*60 - 100)+"' "
//	end if
//loop

ls_errtext=dw.Modify(ls_modify)
if ls_errtext<>'' then goto e

return ''

e:
return ls_errtext


end function

public function integer uf_log (string as_tablename, string ls_errtext, string ls_nos, integer ai_sucflags, long l_orgcount, long l_newcount);//写日志,A714
//类型,错误信息,单号,是否成功,原数量,成功数量
if as_tablename='' then as_tablename='sout_interface'
return f_wgz_errorlog('tablename='+as_tablename+';'+ls_errtext+';nos='+ls_nos+';sucflags='+string(ai_sucflags,'')+';nb='+string(l_orgcount)+';nb2='+string(l_newcount,'')+';')

end function

on u_runsa_derek.create
call super::create
this.ids=create ids
TriggerEvent( this, "constructor" )
end on

on u_runsa_derek.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ids)
end on

event constructor;if ss_filename_app='' then 
	
	string ls_Path 
	ulong lul_handle,ul_size=1024
	
	ls_Path = space(1024) 
	lul_handle = Handle(GetApplication()) 
	u_fun.GetModuleFilename(lul_handle, ls_Path, ul_size) 
	ss_dir_app=mid(ls_Path,1,lastpos(ls_Path,'\'))
	ss_filename_app=mid(ls_Path,lastpos(ls_Path,'\') + 1)
	
	//自动创建控件记忆的配置文件
	is_profile_control=ss_dir_app+'control.ini'
	u_fun.createpath(is_profile_control)
	
	if fileexists(ss_dir_app+'修名_pbl.bat') then ss_flags+='debug|'
	
end if
end event

type ids from datastore within u_runsa_derek descriptor "pb_nvo" = "true" 
end type

on ids.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event error;is_dberror+=errortext 
end event

event dberror;//sqlpreview事件return 1时也会触发该事件
is_dberror+=sqlerrtext 
il_nrows=row - 1 //记录成功的记录数
return 1  //不显示出错信息
end event

event retrievestart;il_nrows=0
end event

event sqlpreview;//return 1 会触发dberror事件
if request=PreviewFunctionUpdate!  then
	yield()
	if mod(row,100)=1 then 
		wait(0,'已传输'+string(row - 1 )+'行!')
		if ib_cancel then 
			ib_cancel=false 
			return 1	//停止更新
		end if
	end if
	
//	if ib_ufupdate then
//		ibb_sql+=blob(sqlsyntax+' ~r~n')
//		return 2
//	end if
end if
end event

event updateend;//update失败时参数的值=0
if il_nrows=0 then il_nrows=rowsinserted + rowsupdated + rowsdeleted

end event

event retrieveend;il_nrows=rowcount
end event

event updatestart;il_nrows=0
end event

