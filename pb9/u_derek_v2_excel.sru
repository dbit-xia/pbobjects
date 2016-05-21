$PBExportHeader$u_derek_v2_excel.sru
forward
global type u_derek_v2_excel from nonvisualobject
end type
type ids from datastore within u_derek_v2_excel
end type
type isqlca from transaction within u_derek_v2_excel
end type
type iobj from oleobject within u_derek_v2_excel
end type
end forward

shared variables
string ss_excelver
end variables

global type u_derek_v2_excel from nonvisualobject
ids ids
isqlca isqlca
iobj iobj
end type
global u_derek_v2_excel u_derek_v2_excel

type variables
string is_filename
int i_filestate //文件状态
string is_lasterror
oleobject idoc_temp
end variables

forward prototypes
public function string sheetsaveas (readonly string as_sourcepath, integer ai_sheet, readonly string as_despath, readonly integer ai_xlfileformat)
public function string geterrortext (readonly integer as_errorcode)
public function string getsheetnames (string as_filepath, ref string as_sheetnames[])
public function string replace (string as_filepath, string as_string1, string as_string2)
public function string vba_exec (string as_filepath, string as_subname, string as_subcode)
public function string texttocolumns (string as_filepath, unsignedinteger ai_widths[], unsignedinteger ai_column)
public function string getversion (ref string as_info)
public function string appconnect (string as_classname)
public function string getodbctrans (string as_filepath, string as_driver)
public function string excel2db (string as_filepath, string as_sql, string as_tablename)
public function string excel2dd (string as_filepath, string as_fields)
public function integer fileopen (string as_filepath)
public function integer fileclose ()
public function string getcolsname (string as_filepath, integer ai_sheet, integer ai_row, ref string as_cols[])
public function string uf_colname (integer ai_colno)
public function integer uf_colno (string as_colname)
public function string uf_accessvbom (unsignedlong li_keyvalue)
public function string uf_addsub (string as_subcode)
public function string uf_runsub (string as_subname)
public function string uf_sheetsaveas (string as_sourcepath, integer ai_sheet[], string as_filepath, ref string as_filename[], integer ai_startrow[], integer ai_xlfileformat)
public function decimal uf_textwidth (string ls_text, string ls_fontname, string ls_fontstyle, integer li_fontsize)
public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[])
public function string createpath (string as_filepath)
public function string uf_fileread_blob (readonly string as_filepath, ref blob ab_text, long al_start, long al_len)
public function string uf_excelmerge (string ls_filename[], string ls_sheetstr[], string ls_startrowstr[], string ls_newfilename, string ls_filetype)
public function string opentextfile (string as_filepath, string as_sepchar, string ls_)
public function string uf_excelmerge (string ls_filenamestr, string ls_sheetstr, string ls_startrowstr, string ls_newfilename, string ls_filetype)
end prototypes

public function string sheetsaveas (readonly string as_sourcepath, integer ai_sheet, readonly string as_despath, readonly integer ai_xlfileformat);//作用:将Excel文件另存为其它格式
//参数:源文件,第几个sheet,目标文件,格式(见底部列表)
//注:如果as_despath存在,则先删除目标文件!

any a_ret
Integer li_row
string ls_errtext=''
string ls_wbookname
boolean lb_alive,lb_open
//if pos(as_sourcepath,'\')>0 then
//	ls_wbookname=mid(as_sourcepath,len(as_sourcepath) - pos(reverse(as_sourcepath),'\') + 2)
//else
//	ls_wbookname=as_sourcepath
//end if

if fileexists(as_despath) then 
	if filedelete(as_despath)=false then
		ls_errtext=as_despath+"删除失败!"
		goto e
	end if
end if

lb_alive=iobj.isalive()

if lb_alive=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

if ai_sheet<=0 then ai_sheet=1

try
	iobj.application.workbooks.Open( as_sourcepath )
	//已打开文件
	lb_open=true
	
	iobj.Application.DisplayAlerts = False	//不提示保存
	
//xlapp.application.windows(ls_wbookname).visible=true	//用ConnectToObject方式时,要放开此句
//Workbooks(ls_wbookname)

	//列宽自适应
	iobj.application.Cells.EntireColumn.AutoFit
	iobj.application.ActiveWorkbook.worksheets(ai_sheet).SaveAs(as_despath,ai_XlFileFormat)	//如果ai_xlfileformat为excel文件,则转换整个文件
	
catch(runtimeerror e)
	ls_errtext=e.getmessage()
finally
	if lb_open=true then iobj.application.Workbooks.Close //如果没有此句,excel进程可能不能立即结束
	if lb_alive=false and iobj.isalive()=true then 
		iobj.application.quit
		iobj.disconnectobject()
	end if
end try

e:
return ls_errtext

/*
XlFileFormat
51 为当前版本
Constant Value 
xlAddIn  18 
xlCSV  6 	//可用
xlCSVMac  22 
xlCSVMSDOS  24 
xlCSVWindows  23 
xlCurrentPlatformText  -4158 
xlDBF2  7 
xlDBF3  8 
xlDBF4  11 
xlDIF  9 
xlExcel2  16 
xlExcel2FarEast  27 
xlExcel3  29 
xlExcel4  33 
xlExcel4Workbook  35 
xlExcel5  39 
xlExcel7  39 
xlExcel9795  43 
xlHtml  44 
xlIntlAddIn  26 
xlIntlMacro  25 
xlSYLK  2 
xlTemplate  17 
xlTextMac  19 
xlTextMSDOS  21 
xlTextPrinter  36 	//可用
xlTextWindows  20 
xlUnicodeText  42 	//可用
xlWebArchive  45 
xlWJ2WD1  14 
xlWJ3  40 
xlWJ3FJ3  41 
xlWK1  5 
xlWK1ALL  31 
xlWK1FMT  30 
xlWK3  15 
xlWK3FM3  32 
xlWK4  38 
xlWKS  4 
xlWorkbookNormal  -4143 
xlWorks2FarEast  28 
xlWQ1  34 
xlXMLData  47 
xlXMLSpreadsheet  46
*/


//名称 值 说明 
//xlAddIn 18 Excel 2007 加载项 
//xlAddIn8 18 Microsoft Excel 97-2003 加载项 
//xlCSV 6 CSV 
//xlCSVMac 22 Macintosh CSV  
//xlCSVMSDOS 24 MSDOS CSV 
//xlCSVWindows 23 Windows CSV  
//xlCurrentPlatformText -4158 当前平台文本 
//xlDBF2 7 DBF2 
//xlDBF3 8 DBF3 
//xlDBF4 11 DBF4 
//xlDIF 9 DIF 
//xlExcel12 50 Excel 12 
//xlExcel2 16 Excel 2 
//xlExcel2FarEast 27 Excel2 FarEast 
//xlExcel3 29 Excel3 
//xlExcel4 33 Excel4 
//xlExcel4Workbook 35 Excel4 工作簿 
//xlExcel5 39 Excel5 
//xlExcel7 39 Excel7 
//xlExcel8 56 Excel8 
//xlExcel9795 43 Excel9795 
//xlHtml 44 HTML 格式 
//xlIntlAddIn 26 国际加载项 
//xlIntlMacro 25 国际宏 
//xlOpenDocumentSpreadsheet 60 OpenDocument 电子表格 
//xlOpenXMLAddIn 55 打开 XML 加载项 
//xlOpenXMLTemplate 54 打开 XML 模板 
//xlOpenXMLTemplateMacroEnabled 53 打开启用的 XML 模板宏 
//xlOpenXMLWorkbook 51 打开 XML 工作簿 
//xlOpenXMLWorkbookMacroEnabled 52 打开启用的 XML 工作簿宏 
//xlSYLK 2 SYLK 
//xlTemplate 17 模板 
//xlTemplate8 17 模板 8 
//xlTextMac 19 Macintosh 文本 
//xlTextMSDOS 21 MSDOS 文本 
//xlTextPrinter 36 打印机文本 
//xlTextWindows 20 Windows 文本 
//xlUnicodeText 42 Unicode 文本 
//xlWebArchive 45 Web 档案 
//xlWJ2WD1 14 WJ2WD1 
//xlWJ3 40 WJ3 
//xlWJ3FJ3 41 WJ3FJ3 
//xlWK1 5 WK1 
//xlWK1ALL 31 WK1ALL 
//xlWK1FMT 30 WK1FMT 
//xlWK3 15 WK3 
//xlWK3FM3 32 WK3FM3 
//xlWK4 38 WK4 
//xlWKS 4 工作表 
//xlWorkbookDefault 51 默认工作簿 
//xlWorkbookNormal -4143 常规工作簿 
//xlWorks2FarEast 28 Works2 FarEast 
//xlWQ1 34 WQ1 
//xlXMLSpreadsheet 46 XML 电子表格 

end function

public function string geterrortext (readonly integer as_errorcode);string ls_errtext=''
choose case as_errorcode
	case -1  
		ls_errtext="无效调用 oleobject对象变量名是某个OLE 控件的 Object属性" 
	case -2  
		ls_errtext="未找到指定的类名" 
	case -3  
		ls_errtext="不能创建对象"
	case -4  
		ls_errtext="不能连接到对象"
	case -5  
		ls_errtext="不能连接到当前活动对象"
	case -6  
		ls_errtext="无效的文件名"
	case -7  
		ls_errtext="未找到指定文件或指定文件不能被打开"
	case -8  
		ls_errtext="服务器不支持指定文件"
	case -9  
		ls_errtext="其他错误"
	case -15   
		ls_errtext="本计算机上未加载 MTS"
	case -16  
		ls_errtext="无效调用 该函数不使用于OLETxnObject对象"
	case else 
		ls_errtext="未知错误代码"
end choose
return string(as_errorcode)+":"+ls_errtext
end function

public function string getsheetnames (string as_filepath, ref string as_sheetnames[]);
int li_ret,i
string ls_errtext
long l_count

if iobj.isalive()=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

try
	//打开Excel文件
	iobj.application.workbooks.Open(as_filepath)
	
	//已打开文件
	is_filename=as_filepath
	i_filestate=1
	
	l_count=long(iobj.application.ActiveWorkbook.Worksheets.count)
	
	if l_count>0 then 
	
		for i=1 to l_count
			as_sheetnames[i]=string(iobj.application.ActiveWorkbook.Worksheets[i].name)
		next
	else
		ls_errtext+="No Sheet!"
	end if

catch (runtimeerror e)
	ls_errtext+=as_filepath+'打开失败:'+e.getmessage()
finally
	if i_filestate=1 then 
		iobj.application.workbooks.close( )
		is_filename=''
		i_filestate=0
	end if
end try

e:
return ls_errtext
end function

public function string replace (string as_filepath, string as_string1, string as_string2);string strCode,ls_excelver
oleobject oModule,oExcel,oBook 
oExcel=create oleobject 
string ls_info,ls_filepath2
int li_pointpos
int li_ret
if fileexists(as_filepath)=false then 
	ls_info+=as_filepath+"不存在!"
	goto e
end if

//li_pointpos=pos(as_filepath,'.')

//ls_filepath2=mid(as_filepath,1,li_pointpos)+'txt'
//
ls_filepath2=as_filepath+'$'

li_ret=filemove(as_filepath,ls_filepath2)
if li_ret=-1 then
	ls_info+=as_filepath+"Error opening sourcefile"
	goto e
elseif li_ret=-2 then
	ls_info+=as_filepath+"Error writing targetfile"
	goto e
end if

//strCode="Sub MyMacro()~r~n"+&
//	  "	Cells.Replace What:=~""+as_string1+"~", Replacement:=~""+as_string2+"~", LookAt:=xlPart, SearchOrder _~r~n"+&
//	  "	:=xlByRows, MatchCase:=False, SearchFormat:=False, ReplaceFormat:=False~r~n"+&
//	 "	ActiveWorkbook.SaveAs Filename:= _~r~n"+&
//      " ~""+ls_filepath2+"~", FileFormat:= _~r~n"+&
//      " xlTextPrinter, CreateBackup:=False~r~n"+&
//	"End Sub"

li_ret=oExcel.ConnectToNewObject("Excel.application" )
if li_ret<>0 then
	ls_info+=geterrortext(li_ret)
else
	
	try
	
		oExcel.application.workbooks.Open(ls_filepath2)
		oExcel.Application.DisplayAlerts = False	//不提示保存
		oBook=oExcel.Application.ActiveWorkbook//Workbooks[1]
		oBook.sheets[1].cells.replace(as_string1,as_string2)
		oBook.SaveAs(ls_filepath2,36)
		
	catch (runtimeerror e)
		ls_info+=e.getmessage()
	finally
		oBook.Close
		oExcel.Quit
	end try
end if

li_ret=filemove(ls_filepath2,as_filepath)
if li_ret=-1 then
	ls_info+=as_filepath+"被命名为"+ls_filepath2+",但没有恢复:Error opening sourcefile"
	goto e
elseif li_ret=-2 then
	ls_info+=as_filepath+"被命名为"+ls_filepath2+",但没有恢复:Error writing targetfile"
	goto e
end if

e:
return ls_info

end function

public function string vba_exec (string as_filepath, string as_subname, string as_subcode);string strCode,ls_excelver
oleobject oModule 
string ls_info,ls_filepath2
int li_pointpos
int li_ret,li_keyexist
string ls_regkey,ls_keyname
ulong li_keyvalue
string ls_errtext
boolean lb_open,lb_alive
 
//
//strCode="Sub MyMacro()~r~n"+&
//   " Cells.Replace What:=~""+as_string1+"~", Replacement:=~""+as_string2+"~", LookAt:=xlPart, SearchOrder _~r~n"+&
//   " :=xlByRows, MatchCase:=False, SearchFormat:=False, ReplaceFormat:=False~r~n"+&
//  " ActiveWorkbook.SaveAs Filename:= _~r~n"+&
//      " ~""+ls_filepath2+"~", FileFormat:= _~r~n"+&
//      " xlTextPrinter, CreateBackup:=False~r~n"+&
// "End Sub"
 
strcode=as_subcode
 
if iobj.isalive()=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if
 
try
	ls_excelver=string(iobj.application.Version)
	ls_regkey="HKEY_CURRENT_USER\Software\Microsoft\Office\"+ls_excelver+"\Excel\Security"
	ls_keyname="AccessVBOM"
	li_keyexist=RegistryGet ( ls_regkey, ls_keyname,ReguLong!, li_keyvalue )
	// messagebox('初始',li_keyvalue)
	if li_keyexist=-1 or li_keyvalue<>1 then
		if RegistrySet (ls_regkey,ls_keyname , ReguLong! , 1)<>1 then ls_info+="注册表修改失败!"  //允许创建宏
	end if
	// messagebox('','修改为1')
	if as_filepath='' or isnull(as_filepath) then 
		iobj.Application.Workbooks.Add
	else
		iobj.Application.application.workbooks.Open(as_filepath)
	end if
	lb_open=true
	iobj.Application.DisplayAlerts = False //不提示保存
	oModule = iobj.Application.ActiveWorkbook.VBProject.VBComponents.Add(1)
	oModule.CodeModule.AddFromString(strCode)
	iobj.Application.Run (as_subname)
	 
catch (runtimeerror e)
	ls_info+=e.getmessage()
finally
	if lb_open=true then iobj.application.Workbooks.Close //如果没有此句,excel进程可能不能立即结束
	if lb_alive=false and iobj.isalive()=true then 
		iobj.application.quit
		iobj.disconnectobject()
	end if
	// if li_keyexist=-1 then 
	// RegistryDelete ( ls_regkey, ls_keyname )
	// elseif li_keyexist=1 and li_keyvalue<>1 then 
	// RegistrySet (ls_regkey,ls_keyname , ReguLong! ,li_keyvalue) //还原注册表值(还原无效,还原后会自动值为1)
	// end if
 
end try
 
e:
return ls_info
end function

public function string texttocolumns (string as_filepath, unsignedinteger ai_widths[], unsignedinteger ai_column);string strCode,ls_excelver,ls_vbacode
string ls_info,ls_filepath2
int li_pointpos
int li_ret,i
string ls_column,ls_widths

oleobject oModule,oExcel,oBook 

//oExcel=create oleobject 

if fileexists(as_filepath)=false then 
	ls_info+=as_filepath+"不存在!"
	goto e
end if

ls_filepath2=as_filepath+'$'

li_ret=filemove(as_filepath,ls_filepath2)
if li_ret=-1 then
	ls_info+=as_filepath+"Error opening sourcefile"
	goto e
elseif li_ret=-2 then
	ls_info+=as_filepath+"Error writing targetfile"
	goto e
end if

if ai_column<=0 then ai_column=1	//列不能小于1

ls_column=char(64 + ai_column)

//ls_widths="Array("+string(ai_widths[1] - 1)+", 1)"

for i=1 to upperbound(ai_widths[])
	ls_widths+=", Array("+string(ai_widths[i] - 1)+", 2)"
next
//messagebox('',ls_widths)
ls_vbacode="Sub MyMacro()~r~n"+&
				"	Columns(~""+ls_column+":"+ls_column+"~").Select~r~n"+&
				"	Selection.TextToColumns Destination:=Range(~""+ls_column+"1~"), DataType:=xlFixedWidth, _~r~n"+&
				"		FieldInfo:=Array(Array(0, 2)"+ls_widths+"), _~r~n"+&
				"		TrailingMinusNumbers:=True~r~n"+&
				"	ActiveWorkbook.SaveAs Filename:= _~r~n"+&
				"		~""+ls_filepath2+"~", FileFormat:=xlCSV, _~r~n"+&
				"		CreateBackup:=False~r~n"+&
				"End Sub"

try
	ls_info+=vba_exec(ls_filepath2,'mymacro',ls_vbacode)
catch (runtimeerror e)
	ls_info+=e.getmessage()
finally
	li_ret=filemove(ls_filepath2,as_filepath)
	if li_ret=-1 then
		ls_info+=as_filepath+"被命名为"+ls_filepath2+",但没有恢复:Error opening sourcefile"
	elseif li_ret=-2 then
		ls_info+=as_filepath+"被命名为"+ls_filepath2+",但没有恢复:Error writing targetfile"
	end if
end try

e:
return ls_info

end function

public function string getversion (ref string as_info);//得到excel版本号

string ls_excelver
boolean lb_alive

//是否已获取过
if ss_excelver<>'' then return ss_excelver

lb_alive=iobj.isalive()

if lb_alive=false then 
	as_info=appconnect("Excel.application" )
	if as_info<>'' then goto e
end if

try
	ls_excelver=string(iobj.application.Version)
	ss_excelver=ls_excelver
catch (runtimeerror e)
	as_info+=e.getmessage()
finally
	iobj.Quit
end try

e:
if lb_alive=false and iobj.isalive()=true then iobj.disconnectobject()
return ls_excelver

end function

public function string appconnect (string as_classname);int li_ret
string ls_ret

if as_classname='' then as_classname="Excel.application"

li_ret=iobj.ConnectToNewObject( as_classname)
if li_ret<>0 then
	ls_ret=geterrortext(li_ret)
end if

return ls_ret
end function

public function string getodbctrans (string as_filepath, string as_driver);string ls_errtext
string ls_ver
dec ld_ver

as_filepath=string(as_filepath,'')
if as_filepath='' then 
	ls_errtext='Filename not empty!'
	goto e
end if

if FileExists (as_filepath)=false then 
	ls_errtext='Filename not exists!'
	goto e
end if

if iobj.isalive()=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

as_driver=string(as_driver,'')

if as_driver='' then 
	
	ls_ver=getversion(ls_errtext)
	if ls_ver='' then goto e
	
	ld_ver=dec(ls_ver)
	
	if ld_ver>=12.0 then 
		as_driver="Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)"
	else
		as_driver="Microsoft Excel Driver (*.xls)"
	end if 
	
end if

isqlca.DBMS = "ODBC"
isqlca.AutoCommit = False
isqlca.DBParm = "ConnectString='Driver={"+as_driver+"}; DBQ="+as_filepath+";',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using isqlca;

if isqlca.sqlcode=-1 then goto e 

return ''

e:
if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	rollback;
end if
return ls_errtext
end function

public function string excel2db (string as_filepath, string as_sql, string as_tablename);string ls_sheetnames[]
string ls_filename

string ls_info
string ls_path	//选择的路径
string ls_files	//选择的文件
long i,l_ret,l_count,l_rowcount
string ls_ret
string ls_errtext
string ls_sql

//ib_wait=isvalid(w_wait)

//g_current_path=GetCurrentDirectory()

//批量导入
l_ret=GetFileOpenName("Select File",ls_path,ls_files,"Excel", "Excel(*.xls*),*.xls*,All Files (*.*), *.*")
if l_ret=-1 then
	ls_errtext='GetFileOpenName Failed!'
	goto e
elseif l_ret=0 then
	goto e 
end if
ls_filename=ls_path

//u_derek.wait(10,'Get sheetnames')

ls_errtext=getsheetnames(ls_filename,ls_sheetnames[])
if ls_errtext<>'' then goto e

//u_derek.wait(20,'Create connection')

ls_errtext=getodbctrans(ls_filename,'')

iobj.disconnectobject()

if ls_errtext<>'' then goto e

//u_derek.wait(30,'Create data object')

//ls_errtext=u_dd.getmodify(dw_1,"select "+string(g_recno)+" as recno,article as kh,[current status] as a1 from ["+ls_sheetnames[1]+"$]",'huanankc',u_excel.isqlca)
if ls_errtext<>'' then goto e

//u_derek.wait(40,'Importing')

ids.settransobject(isqlca)
l_rowcount=ids.retrieve()
disconnect using isqlca;

if l_rowcount=0 then 
	ls_errtext="No data!"
	goto e
end if

//u_derek.wait(50,'Data processing')

for i=1 to l_rowcount
	ids.SetItemStatus(i,0,primary!,newmodified!)
next

//delete from huanankc where recno=:g_recno;
//if sqlca.sqlcode=-1 then goto e
//commit;

//u_derek.wait(60,'Data Saving')

ids.settransobject(sqlca)
if ids.update()=1 then 
//	u_derek.wait(70,'Commiting')
	commit;
else
	ls_errtext="Save Failed!"
	goto e
end if
	

//dw_1.BringToTop=true
//if ib_wait=false and isvalid(w_wait) then close(w_wait)

return ls_errtext

e:
//if isalive(u_excel.iobj) then u_excel.iobj.disconnectobject()
if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	rollback;
end if
//if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
//if ib_wait=false and isvalid(w_wait) then close(w_wait)
return ls_errtext
end function

public function string excel2dd (string as_filepath, string as_fields);//参数1:文件路径
//参数2:excel中的字段名称,如果有空格则要加[],如果起别名并且字段没有打到,则会提示别名异常

string ls_sheetnames[]
long i,l_rowcount
string ls_ret,ls_modify
string ls_errtext
string ls_current_path,ls_files
int li_ret

//wait(10,'Get sheetnames')

//自动连接excel app,但不自动断开
ls_errtext=getsheetnames(as_filepath,ls_sheetnames[])

if ls_errtext<>'' then goto e

//wait(20,'Create connection')

//根据excel app版本获取odbc_excel的drive,并connect
ls_errtext=getodbctrans(as_filepath,'')

//断开excel app
iobj.disconnectobject()

if ls_errtext<>'' then goto e

//wait(30,'Create data object')

//ls_errtext=u_dd.getquery(ids,"select "+as_fields+" from ["+ls_sheetnames[1]+"$]",isqlca)
if ls_errtext<>'' then goto e

//wait(40,'Importing')

ids.settransobject(isqlca)
l_rowcount=ids.retrieve()
disconnect using isqlca;

if l_rowcount<=0 then 
	ls_errtext="No data!"
	goto e
end if

ids.saveas('C:\ids.csv',csv!,true)

e:
return ls_errtext
end function

public function integer fileopen (string as_filepath);int li_ret,i
string ls_errtext
long l_count
boolean lb_alive

is_lasterror=''

lb_alive=iobj.isalive()

if lb_alive=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

try
	//打开Excel文件
	iobj.application.workbooks.Open(as_filepath)

	//已打开文件
	is_filename=as_filepath
	i_filestate=1

catch (runtimeerror e)
	ls_errtext+=as_filepath+'打开失败:'+e.getmessage()
	if lb_alive=false then iobj.disconnectobject()
	
end try

if ls_errtext<>'' then goto e

return 1

e:
ls_errtext=is_lasterror
return -1
end function

public function integer fileclose ();string ls_errtext
int li_ret
try
	//打开Excel文件
	iobj.application.workbooks.close( )

	//已关闭文件
	is_filename=''
	i_filestate=0
	
catch (runtimeerror e)
	ls_errtext='workbooks关闭失败:'+e.getmessage()
end try

if ls_errtext<>'' then goto e

return 1

e:
is_lasterror=ls_errtext
return -1

end function

public function string getcolsname (string as_filepath, integer ai_sheet, integer ai_row, ref string as_cols[]);
int li_ret,i
string ls_errtext,ls_ret,ls_range
long l_count
boolean lb_open,lb_alive
any la_text[]

if ai_sheet<=0 then ai_sheet=1
if ai_row<=0 then ai_row=1

lb_alive=iobj.isalive()

if lb_alive=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

try
	//打开Excel文件
	iobj.application.workbooks.Open(as_filepath)
	
	lb_open=true
	
	iobj.Application.DisplayAlerts = False	//不提示保存
	l_count=long(iobj.application.ActiveWorkbook.worksheets(ai_sheet).UsedRange.Columns.count)
	ls_range="A"+string(ai_row)+":"+uf_colname(l_count)+string(ai_row)
	//iobj.application.ActiveWorkbook.worksheets(ai_sheet).Range("A1:"+uf_colname(l_count)+'1').NumberFormatLocal = "@"
	la_text[]=iobj.application.ActiveWorkbook.worksheets(ai_sheet).Range(ls_range).value
	l_count=upperbound(la_text[])
	for i=1 to l_count
		if string(la_text[i],'')='' then exit
		as_cols[i]=string(la_text[i],'')
	next
	
//	i=1
//	do 
//		ls_ret=string(iobj.application.ActiveWorkbook.worksheets(ai_sheet).cells(ai_row,i),'')
//		if ls_ret='' then exit
//		as_cols[upperbound(as_cols[]) + 1]=ls_ret
//		i++
//	loop until(1<>1)

catch (runtimeerror e)
	ls_errtext+=as_filepath+'打开失败:'+e.getmessage()
finally
	if lb_open=true then iobj.application.Workbooks.Close //如果没有此句,excel进程可能不能立即结束
	if lb_alive=false and iobj.isalive()=true then 
		iobj.application.quit
		iobj.disconnectobject()
	end if
end try

e:
return ls_errtext
end function

public function string uf_colname (integer ai_colno);//char ls_colname[]
//int li_mod,li_int
//if ai_colno<=26 then 
//	ls_colname[1]=char(64 + ai_colno )
//elseif ai_colno<=702 then
//	li_int=int(ai_colno / 26)
//	li_mod=mod(ai_colno,26)
//	if li_mod=0 then 
//		li_int=li_int - 1
//		li_mod=26 //如果余数=0 则应以Z结尾
//	end if
//		
//	ls_colname[1]=char(64 + li_int)
//	ls_colname[2]=char(64 + li_mod)
//end if
////
////52
//
//return ls_colname

/*
 函数名:of_ConvertToColName(Long al_ColNum)
 功能:将索引号转换为对应的EXCEL列名 如A,B,C,D,E,AA,AB,AC,AD
 参数:Long al_ColNum 索引号
 返回:String 转换后的列名
*/

int ll_mod
String ColName

do while ai_colno > 0
	ll_mod = Mod(ai_colno,26)
	if ll_mod=0 then
		ColName="Z"+ColName
		ll_mod = 1
	else
		ColName=String(Char(ll_mod + 64))+ColName
	end if
	ai_colno = (ai_colno - ll_mod) / 26
loop

return ColName
end function

public function integer uf_colno (string as_colname);/*
 函数名:of_ConvertToIndex(string as_ColName)
 功能:将列名转换为对应的索引号
 参数:string as_ColName 列名
 返回:long 转换后的索引号
*/
int ColIndex,i

for i=len(as_colname) to 1 step -1
 colindex+=(Asc(Mid(as_colname,i,1)) - 64) * 26^(len(as_colname) - i)
next

return colindex
end function

public function string uf_accessvbom (unsignedlong li_keyvalue);string ls_excelver
int li_ret
string ls_regkey,ls_keyname
string ls_errtext

try
	ls_excelver=string(iobj.application.Version)
catch(runtimeerror e)
	ls_errtext+=e.getmessage()
finally
end try

if ls_errtext<>'' then goto e

ls_regkey="HKEY_CURRENT_USER\Software\Microsoft\Office\"+ls_excelver+"\Excel\Security"
ls_keyname="AccessVBOM"

li_ret=RegistryGet ( ls_regkey, ls_keyname,ReguLong!, li_keyvalue )
if li_ret=-1 or li_keyvalue<>1 then
	if RegistrySet (ls_regkey,ls_keyname , ReguLong! , 1)<>1 then 
		ls_errtext="注册表修改失败!"	 //允许创建宏
		goto e
	end if
end if

return ''

e:
return ls_errtext
end function

public function string uf_addsub (string as_subcode);//根据字符串增加VBA模块,参数为方法内容

oleobject oModule 
string ls_errtext
 
//
//strCode="Sub MyMacro()~r~n"+&
//   " Cells.Replace What:=~""+as_string1+"~", Replacement:=~""+as_string2+"~", LookAt:=xlPart, SearchOrder _~r~n"+&
//   " :=xlByRows, MatchCase:=False, SearchFormat:=False, ReplaceFormat:=False~r~n"+&
//  " ActiveWorkbook.SaveAs Filename:= _~r~n"+&
//      " ~""+ls_filepath2+"~", FileFormat:= _~r~n"+&
//      " xlTextPrinter, CreateBackup:=False~r~n"+&
// "End Sub"

try
	oModule = iobj.Application.ActiveWorkbook.VBProject.VBComponents.Add(1)
	oModule.CodeModule.AddFromString(as_subcode)
//	iobj.Application.Run (as_subname)
catch (runtimeerror e)
	ls_errtext=e.getmessage()
finally
 
end try
 
return ls_errtext
end function

public function string uf_runsub (string as_subname);//执行VBA的方法,参数为方法名

string ls_errtext

try
	iobj.Application.Run (as_subname)
catch (runtimeerror e)
	ls_errtext=e.getmessage()
finally
 
end try
 
return ls_errtext
end function

public function string uf_sheetsaveas (string as_sourcepath, integer ai_sheet[], string as_filepath, ref string as_filename[], integer ai_startrow[], integer ai_xlfileformat);//作用:将Excel文件另存为其它格式
//参数:源文件,第几个sheet,目标文件,格式(见底部列表)
//注:如果as_despath存在,则先删除目标文件!

any a_ret
Integer li_row,li_sheetcount,li_allsheetcount,li_maxsheetno
string ls_errtext=''
string ls_wbookname
boolean lb_alive,lb_open
long i
string ls_allsheetname[],ls_extension

choose case ai_xlfileformat
	case 42
		ls_extension='.txt'
	case 6
		ls_extension='.csv'
end choose

li_sheetcount=upperbound(ai_sheet[])

//if upperbound(ai_sheet[])<li_sheetcount then ai_sheet[li_sheetcount]=li_sheetcount
if upperbound(ai_startrow[])<li_sheetcount then ai_startrow[li_sheetcount]=1
if upperbound(as_filename[])<li_sheetcount then as_filename[li_sheetcount]=''

for i=1 to li_sheetcount
	
	if ai_sheet[i]=0 then ai_sheet[i]=i
	if ai_sheet[i]>li_maxsheetno then li_maxsheetno=ai_sheet[i]
	if ai_startrow[i]<=0 then ai_startrow[i]=1
	
next

lb_alive=iobj.isalive()

if lb_alive=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

ls_errtext=getsheetnames(as_sourcepath,ls_allsheetname[])
if ls_errtext<>'' then goto e

li_allsheetcount=upperbound(ls_allsheetname[])

if li_allsheetcount<li_maxsheetno then 
	ls_errtext='文件Sheet数不能小于'+string(li_maxsheetno)
	goto e
end if

for i=1 to li_sheetcount	
	if as_filename[i]='' then as_filename[i]=ls_allsheetname[ai_sheet[i]]+ls_extension
	
	if fileexists(as_filename[i]) then 
		if filedelete(as_filename[i])=false then
			ls_errtext=as_filename[i]+"删除失败!"
			goto e
		end if
	end if
	
next

try
	
	if lower(right(as_sourcepath,4))='.txt' then
//		ActiveSheet.QueryTables.Add(Connection:= _
//        "TEXT;C:\Users\Dbit.runsaxia\Desktop\jc.txt", Destination:=Range("$A$1"))
//        .Name = "jc"
//        .FieldNames = True
//        .RowNumbers = False
//        .FillAdjacentFormulas = False
//        .PreserveFormatting = True
//        .RefreshOnFileOpen = False
//        .RefreshStyle = xlInsertDeleteCells
//        .SavePassword = False
//        .SaveData = True
//        .AdjustColumnWidth = True
//        .RefreshPeriod = 0
//        .TextFilePromptOnRefresh = False
//        .TextFilePlatform = 1252
//        .TextFileStartRow = 1
//        .TextFileParseType = xlDelimited
//        .TextFileTextQualifier = xlTextQualifierDoubleQuote
//        .TextFileConsecutiveDelimiter = False
//        .TextFileTabDelimiter = True
//        .TextFileSemicolonDelimiter = False
//        .TextFileCommaDelimiter = False
//        .TextFileSpaceDelimiter = False
//        .TextFileColumnDataTypes = Array(2)
//        .TextFileTrailingMinusNumbers = True
//        .Refresh BackgroundQuery:=False
	else
		iobj.application.workbooks.Open( as_sourcepath )
	end if
	//已打开文件
	lb_open=true
	
	iobj.Application.DisplayAlerts = False	//不提示保存
	
//xlapp.application.windows(ls_wbookname).visible=true	//用ConnectToObject方式时,要放开此句
//Workbooks(ls_wbookname)
	
	for i=1 to li_sheetcount
		if ai_startrow[i]>=2 then //删除起始 - 1行
			//iobj.application.ActiveWorkbook.worksheets(ai_sheet[i]).Rows("1:"+string(ai_startrow[i])).Select
    			iobj.application.ActiveWorkbook.worksheets(ai_sheet[i]).Rows("1:"+string(ai_startrow[i] - 1)).Delete(-4162)// Shift:=xlUp
		end if
		iobj.application.ActiveWorkbook.worksheets(ai_sheet[i]).SaveAs(as_filepath+as_filename[i],ai_XlFileFormat)	//如果ai_xlfileformat为excel文件,则转换整个文件
	next
catch(runtimeerror e)
	ls_errtext=e.getmessage()
finally
	if lb_open=true then iobj.application.Workbooks.Close //如果没有此句,excel进程可能不能立即结束
end try

e:
if lb_alive=false and iobj.isalive()=true then 
	iobj.application.quit
	iobj.disconnectobject()
end if
return ls_errtext

/*
XlFileFormat
51 为当前版本
Constant Value 
xlAddIn  18 
xlCSV  6 	//可用
xlCSVMac  22 
xlCSVMSDOS  24 
xlCSVWindows  23 
xlCurrentPlatformText  -4158 
xlDBF2  7 
xlDBF3  8 
xlDBF4  11 
xlDIF  9 
xlExcel2  16 
xlExcel2FarEast  27 
xlExcel3  29 
xlExcel4  33 
xlExcel4Workbook  35 
xlExcel5  39 
xlExcel7  39 
xlExcel9795  43 
xlHtml  44 
xlIntlAddIn  26 
xlIntlMacro  25 
xlSYLK  2 
xlTemplate  17 
xlTextMac  19 
xlTextMSDOS  21 
xlTextPrinter  36 	//可用
xlTextWindows  20 
xlUnicodeText  42 	//可用
xlWebArchive  45 
xlWJ2WD1  14 
xlWJ3  40 
xlWJ3FJ3  41 
xlWK1  5 
xlWK1ALL  31 
xlWK1FMT  30 
xlWK3  15 
xlWK3FM3  32 
xlWK4  38 
xlWKS  4 
xlWorkbookNormal  -4143 
xlWorks2FarEast  28 
xlWQ1  34 
xlXMLData  47 
xlXMLSpreadsheet  46
*/


//名称 值 说明 
//xlAddIn 18 Excel 2007 加载项 
//xlAddIn8 18 Microsoft Excel 97-2003 加载项 
//xlCSV 6 CSV 
//xlCSVMac 22 Macintosh CSV  
//xlCSVMSDOS 24 MSDOS CSV 
//xlCSVWindows 23 Windows CSV  
//xlCurrentPlatformText -4158 当前平台文本 
//xlDBF2 7 DBF2 
//xlDBF3 8 DBF3 
//xlDBF4 11 DBF4 
//xlDIF 9 DIF 
//xlExcel12 50 Excel 12 
//xlExcel2 16 Excel 2 
//xlExcel2FarEast 27 Excel2 FarEast 
//xlExcel3 29 Excel3 
//xlExcel4 33 Excel4 
//xlExcel4Workbook 35 Excel4 工作簿 
//xlExcel5 39 Excel5 
//xlExcel7 39 Excel7 
//xlExcel8 56 Excel8 
//xlExcel9795 43 Excel9795 
//xlHtml 44 HTML 格式 
//xlIntlAddIn 26 国际加载项 
//xlIntlMacro 25 国际宏 
//xlOpenDocumentSpreadsheet 60 OpenDocument 电子表格 
//xlOpenXMLAddIn 55 打开 XML 加载项 
//xlOpenXMLTemplate 54 打开 XML 模板 
//xlOpenXMLTemplateMacroEnabled 53 打开启用的 XML 模板宏 
//xlOpenXMLWorkbook 51 打开 XML 工作簿 
//xlOpenXMLWorkbookMacroEnabled 52 打开启用的 XML 工作簿宏 
//xlSYLK 2 SYLK 
//xlTemplate 17 模板 
//xlTemplate8 17 模板 8 
//xlTextMac 19 Macintosh 文本 
//xlTextMSDOS 21 MSDOS 文本 
//xlTextPrinter 36 打印机文本 
//xlTextWindows 20 Windows 文本 
//xlUnicodeText 42 Unicode 文本 
//xlWebArchive 45 Web 档案 
//xlWJ2WD1 14 WJ2WD1 
//xlWJ3 40 WJ3 
//xlWJ3FJ3 41 WJ3FJ3 
//xlWK1 5 WK1 
//xlWK1ALL 31 WK1ALL 
//xlWK1FMT 30 WK1FMT 
//xlWK3 15 WK3 
//xlWK3FM3 32 WK3FM3 
//xlWK4 38 WK4 
//xlWKS 4 工作表 
//xlWorkbookDefault 51 默认工作簿 
//xlWorkbookNormal -4143 常规工作簿 
//xlWorks2FarEast 28 Works2 FarEast 
//xlWQ1 34 WQ1 
//xlXMLSpreadsheet 46 XML 电子表格 

end function

public function decimal uf_textwidth (string ls_text, string ls_fontname, string ls_fontstyle, integer li_fontsize);//作用:将Excel文件另存为其它格式
//参数:源文件,第几个sheet,目标文件,格式(见底部列表)
//注:如果as_despath存在,则先删除目标文件!
string ls_errtext=''
boolean lb_alive,lb_open
long i
string ls_allsheetname[],ls_extension
oleobject lobj_cells
dec ld_width

is_lasterror=''

//lb_alive=iobj.isalive()
//
//if lb_alive=false then 
//	ls_errtext=appconnect("Excel.application" )
//	if ls_errtext<>'' then goto e
//end if

try
//	iobj.application.workbooks.add
//	idoc_temp=iobj.application.ActiveWorkbook
//	lb_open=true
	
	lobj_cells=idoc_temp.worksheets(1).cells[1,1]
	lobj_cells.Font.Name =ls_fontname
	lobj_cells.Font.FontStyle = ls_FontStyle //常规,加粗,倾斜,加粗倾斜,
	lobj_cells.Font.size = li_fontsize 
	
	lobj_cells.value=ls_text
	lobj_cells.EntireColumn.AutoFit
	
	ld_width=lobj_cells.ColumnWidth * 8 + 5
	
catch(runtimeerror e)
	ls_errtext=e.getmessage()
finally
	//if lb_open=true then iobj.application.Workbooks.Close //如果没有此句,excel进程可能不能立即结束
end try

//e:
//if lb_alive=false and iobj.isalive()=true then 
//	iobj.application.quit
//	iobj.disconnectobject()
//end if
is_lasterror=ls_errtext
return ld_width


end function

public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[]);//字符串替换函数
//参数1:引用变量,操作的字符串
//参数2:要替换的字符
//参数3:目标字符
//返回值:替换成功的数目

char lc_text[]
long i,l_len,l_index

int li_seplen,li_matchindex=1 /*正在匹配索引*/
long l_lastmatchindex=0 //最后一次全匹配成功的位置

long l_newindex,l_newlen
char lc_newchar[]

li_seplen=upperbound(as_sep[])
lc_text[]=as_text
l_len=upperbound(lc_text[])
li_matchindex=1 //先匹配首个字符

for l_index=1 to l_len //逐个匹配
	if lc_text[l_index]=as_sep[li_matchindex] then //是否匹配
		if li_seplen=li_matchindex then //全匹配
			lc_newchar[]=''
			l_newlen=l_index - li_seplen - l_lastmatchindex //需要截取的长度
			for l_newindex=1 to l_newlen
				lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
			next
			l_lastmatchindex=l_index //记录最后一次全匹配成功的位置
			i++
			ls_ret[i]=lc_newchar[] //
		else //部分匹配
			li_matchindex++ //匹配 + 1
			continue;
		end if
	end if 
	if li_matchindex>1 then l_index=l_index - li_matchindex + 1
	li_matchindex=1 //重新匹配
next

if l_lastmatchindex<>l_len then 
	lc_newchar[]=''
	l_newlen=l_len - l_lastmatchindex
	for l_newindex=1 to l_newlen
		lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
	next
	i++
	ls_ret[i]=lc_newchar[]
end if

return i

////得到分隔符分开后的数组
////参数1:要分隔的字符串
////参数2:输出分开后的数组
////参数3:分隔符
////返回数组的上限数
//
//long li_pos=0,li_startpos=1,i=0,l_len,li_lastpos
//int l_lensep
//string ls_empty[]
//ls_ret[]=ls_empty[]
//
//l_len=len(as_text)
//l_lensep=len(as_sep)
//
//li_pos=pos(as_text,as_sep)
////正常截取
//do while(li_pos>0)
//	i++
//	ls_ret[i]=mid(as_text,li_startpos,li_pos - li_startpos)
//	
//	li_lastpos=li_pos
//	li_startpos=li_lastpos + l_lensep
//	li_pos=pos(as_text,as_sep,li_startpos)
//	
//loop 
//		
//if l_len>=li_startpos then 
//	i++
//	ls_ret[i]=mid(as_text,li_startpos)
//end if
//
//
//return i
end function

public function string createpath (string as_filepath);//作用:创建路径
//参数:路径
//返回值:成功返回空字符串,失败返回创建失败的路径,参数为null或''则返回''
//说明:
//1.以'\'结尾则创建路径中所有文件夹,否则创建所有文件夹及一个文件
//2.以'\'开头,则在当前磁盘根目录下创建
//3.可以指定绝对路径(C:\1\2\3.txt)
//4.可以指定相对路径(.\1\2\3.txt)


string ls_dir
long l_hwd
int li_pos=0
as_filepath=trim(as_filepath)
if isnull(as_filepath) or as_filepath='' then return ''

if mid(as_filepath,2,1)=':' then li_pos=3	//绝对路径

do
	li_pos=pos(as_filepath,'\',li_pos + 1)
	if li_pos=0 then exit;
	ls_dir=mid(as_filepath,1,li_pos - 1)
	if directoryexists(ls_dir)=false then 
		if createdirectory(ls_dir)=-1 then return ls_dir
	end if
loop until li_pos=0

if left(as_filepath,1)<>'\' then 
	if fileexists(as_filepath)=false then
		l_hwd=fileopen(as_filepath,Linemode!,Write!,LockWrite!,Append!)
		fileclose(l_hwd)
		if l_hwd=-1 then return as_filepath
	end if
end if

return ''
end function

public function string uf_fileread_blob (readonly string as_filepath, ref blob ab_text, long al_start, long al_len);//读取文件的内容
//参数:as_filepath 文件路径,ab_text 返回blob类型的内容,开始读取的字节位,字节读取的长度
//返回值:返回内容的字节数,内容放在ab_text变量中,失败返回-1

long l_hwd,l_ret,i
long l_length
string ls_errtext
boolean lb_open

if string(trim(as_filepath),'')='' then
	ls_errtext='文件名不能为空!'
	goto e
end if

if fileexists(as_filepath)=false then 
	ls_errtext='文件不存在'+as_filepath
	goto e
end if


//l_length=FileLength(as_filepath)
//
//if l_length>1073741823 then 
//	ls_errtext='文件大小'+string(l_length)+',只能读取1,073,741,823字节'
//end if

//int(-32768 to +32767)	16
//long(-2147483648 to +2147483647)	32
//longlong(-9223372036854775808 to 9223372036854775807)	64
//uint(0 to 65535)	16
//ulong(0 to 4,294,967,295)	32
//string(1,073,741,823)
//dec(123.456, 0.000000000000000000000001 or 12345678901234.5678901234)
//real(-3.402822E-38 to -3.402822E+38)
//double(2.2250738585073E-308 to 1.79769313486231E+308)
//time(00:00:00 to 23:59:59.999999)
//date(1000 to 3000)

l_hwd=fileopen(as_filepath,StreamMode!,read!,lockwrite!)
if l_hwd=-1 then 
	ls_errtext='文件打开失败:'+as_filepath
	goto e
end if
lb_open=true

if al_start<=1 then
	
else

	l_length=fileread(l_hwd,ab_text)
	if l_length=-100 then l_length=0	//无内容
	if l_length>=0 then 
	else
		ls_errtext='文件读取失败:'+as_filepath
		goto e
	end if
	
end if

if al_len<=0 then 
	l_length=fileread(l_hwd,ab_text)
	if l_length=-100 then l_length=0	//无内容
	if l_length>=0 then 
	else
		ls_errtext='文件读取失败:'+as_filepath
		goto e
	end if
else
	l_length=fileread(l_hwd,ab_text)
	if l_length=-100 then l_length=0	//无内容
	if l_length>=0 then 
	else
		ls_errtext='文件读取失败:'+as_filepath
		goto e
	end if

end if

l_ret=fileclose(l_hwd)

if l_ret=-1 then 
	ls_errtext='文件关闭失败:'+as_filepath
	goto e
end if
lb_open=false

return ''

goto e
e:
if lb_open=true then 
	l_ret=fileclose(l_hwd)
	if l_ret=-1 then 
		ls_errtext+='~r~n文件关闭失败:'+as_filepath
	else
		lb_open=false
	end if
end if
return ls_errtext

end function

public function string uf_excelmerge (string ls_filename[], string ls_sheetstr[], string ls_startrowstr[], string ls_newfilename, string ls_filetype);//string 
//ls_filename[] ={'D:\a.xlsx','D:\b.xlsx','D:\1.xlsx'}
////string 
//ls_sheetstr[] ={'1,2,3','1,2,3','1,2,3'}
////string 
//ls_startrowstr[] ={'1,2,2','2,2,2','1,1,1'}
////string 
//ls_newfilename ="D:\newfile.xlsx"
//ls_filetype='excel'

boolean lb_alive,lb_newopen
string ls_errtext,ls_textfile,ls_titlename[]
string ls_dirpath //='D:\'
long l_filecount,i,j,l_count
string ls_sheets[],ls_startrow[],ls_tempout[],ls_outfilename[]
long li_sheet[],l_startrow[],l_TextFileColumnDataTypes[]
l_filecount=upperbound(ls_filename[])

ls_dirpath=GetCurrentDirectory ( )+'\'

ls_textfile=ls_dirpath+'$temp.csv'

if l_filecount=0 then return ''

//先删除目的文件
if fileexists(ls_textfile) then 
	if filedelete(ls_textfile)=false then 
		ls_errtext='临时文件删除失败:'+ls_textfile
		goto e
	end if
end if

//先删除目的文件
if fileexists(ls_newfilename) then 
	if filedelete(ls_newfilename)=false then 
		ls_errtext='文件删除失败:'+ls_newfilename
		goto e
	end if
end if

//先连接classname,减少函数内连接
lb_alive=iobj.isalive()

if lb_alive=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

//创建目录
ls_errtext=createpath(ls_dirpath)
if ls_errtext<>'' then goto e

//将指定sheet生成临时text文件
for i=1 to l_filecount
	l_count=getarray(ls_sheetstr[i],ls_sheets[],',')
	l_count=upperbound(ls_sheets[])
	
	for j=1 to l_count
		li_sheet[j]=integer(ls_sheets[j])
	next
	
	l_count=getarray(ls_startrowstr[i],ls_startrow[],',')
	l_count=upperbound(ls_startrow[])
	
	for j=1 to l_count
		l_startrow[j]=long(ls_startrow[j])
	next
	
	//依据第一个sheet,获取标题及列数
	if i=1 then 
		ls_errtext=getcolsname(ls_filename[i],li_sheet[1],l_startrow[1],ls_titlename[])
		if ls_errtext<>'' then goto e
	end if
	
	ls_errtext=uf_sheetsaveas( ls_filename[i], li_sheet[],ls_dirpath+'$'+string(i), ls_tempout[], l_startrow[],6 /*csv*/)
	if ls_errtext<>'' then goto e
	
	for j=1 to l_count
		ls_outfilename[upperbound(ls_outfilename)+1]=ls_dirpath+'$'+string(i)+ls_tempout[j]
	next
	
next

l_count=upperbound(ls_outfilename[])

//合并生成的text文件
blob lblob_content
boolean lb_fileopen
long l_hwd,l_ret
long l_length

l_hwd=fileopen(ls_textfile,StreamMode!,write!,lockwrite!)
if l_hwd=-1 then 
	ls_errtext+='文件打开失败:'+ls_textfile
	goto e
end if
lb_fileopen=true

for i=1 to l_count
	
	ls_errtext=uf_fileread_blob(ls_outfilename[i],lblob_content,0,0)
	if ls_errtext<>'' then goto e
//	ls_errtext=lu_fun.uf_filewrite(ls_textfile,lblob_content)
//	if ls_errtext<>'' then goto e
	
	l_ret=filewrite(l_hwd,lblob_content)
	if l_ret=-1 then 
		ls_errtext+='文件写入失败:'+string(l_ret)+' '+ls_textfile
		goto e
	end if 
	
	if filedelete(ls_outfilename[i])=false then 
		ls_errtext='文件删除失败:'+ls_outfilename[i]
		goto e
	end if
next

l_ret=fileclose(l_hwd)
if l_ret=-1 then 
	ls_errtext+='文件关闭失败:'+ls_textfile
	goto e
end if
lb_fileopen=false 

choose case ls_filetype
	case 'text',''
		//转移到指定路径
		l_ret=filemove(ls_textfile,ls_newfilename)
		if l_ret<>1 then 
			ls_errtext='生成csv文件失败:'+string(l_ret,'')+'~r~n'+ls_textfile+' '+ls_newfilename
			goto e
		end if
	case 'excel'
		//ls_errtext=sheetsaveas(ls_textfile, 1, ls_newfilename, 51)
		//将text文件用excel打开,并且每一列都设置为文本
		oleobject lole_QueryTables
		
		try 
			iobj.application.workbooks.Add
			lb_newopen=true
			lole_QueryTables=iobj.application.ActiveWorkbook.ActiveSheet.QueryTables.Add("TEXT;"+ls_textfile, iobj.Range("$A$1"))
			lole_QueryTables.Name = "Sheet1"
			lole_QueryTables.FieldNames = True
			lole_QueryTables.RowNumbers = False
			lole_QueryTables.FillAdjacentFormulas = False
			lole_QueryTables.PreserveFormatting = True
			lole_QueryTables.RefreshOnFileOpen = False
			lole_QueryTables.RefreshStyle = 1//xlInsertDeleteCells
			lole_QueryTables.SavePassword = False
			lole_QueryTables.SaveData = True
			lole_QueryTables.AdjustColumnWidth = True
			lole_QueryTables.RefreshPeriod = 0
			lole_QueryTables.TextFilePromptOnRefresh = False
			lole_QueryTables.TextFilePlatform = 936
			lole_QueryTables.TextFileStartRow = 1
			lole_QueryTables.TextFileParseType =1// xlDelimited
			lole_QueryTables.TextFileTextQualifier =1// xlTextQualifierDoubleQuote
			lole_QueryTables.TextFileConsecutiveDelimiter = False
			lole_QueryTables.TextFileTabDelimiter = True //tab
			lole_QueryTables.TextFileSemicolonDelimiter = False
			lole_QueryTables.TextFileCommaDelimiter = true //逗号
			lole_QueryTables.TextFileSpaceDelimiter = False
			
			//根据将所以有列设置为text
			for i=1 to upperbound(ls_titlename[])
				l_TextFileColumnDataTypes[i]=2 //xlTextFormat
			next
			
			lole_QueryTables.TextFileColumnDataTypes = l_TextFileColumnDataTypes
			lole_QueryTables.TextFileTrailingMinusNumbers = True
			lole_QueryTables.Refresh(False)
			
			lole_QueryTables=iobj.application.ActiveWorkbook.ActiveSheet.saveas(ls_newfilename,51)
		catch (runtimeerror e)
			ls_errtext='生成Excel文件失败:'+e.getmessage()+'~r~n'+ls_textfile+' '+ls_newfilename
		finally
			if lb_newopen=true then iobj.application.Workbooks.Close
		end try 
		if ls_errtext<>'' then goto e
		
		filedelete(ls_textfile)
		
end choose

if lb_alive=false and isalive(iobj) then
	iobj.application.quit
	iobj.disconnectobject()
end if
lb_alive=false
return ''

goto e
e:

if lb_fileopen=true then
	l_ret=fileclose(l_hwd)
	if l_ret=-1 then 
		ls_errtext+='文件关闭失败:'+ls_textfile
	else
		lb_fileopen=false 
	end if
end if

if lb_alive=false and isalive(iobj) then
	iobj.disconnectobject()
end if
lb_alive=false
return ls_errtext
end function

public function string opentextfile (string as_filepath, string as_sepchar, string ls_);int li_ret,i
string ls_errtext
long l_count
boolean lb_alive,lb_open
oleobject lole_QueryTables

is_lasterror=''

lb_alive=iobj.isalive()

if lb_alive=false then 
	ls_errtext=appconnect("Excel.application" )
	if ls_errtext<>'' then goto e
end if

try
	//打开Excel文件
	iobj.application.workbooks.Add
	lole_QueryTables=iobj.application.ActiveWorkbook.ActiveSheet.QueryTables.Add("TEXT;"+as_filepath, iobj.Range("$A$1"))
	lole_QueryTables.Name = "Sheet1"
	lole_QueryTables.FieldNames = True
	lole_QueryTables.RowNumbers = False
	lole_QueryTables.FillAdjacentFormulas = False
	lole_QueryTables.PreserveFormatting = True
	lole_QueryTables.RefreshOnFileOpen = False
	lole_QueryTables.RefreshStyle = 1//xlInsertDeleteCells
	lole_QueryTables.SavePassword = False
	lole_QueryTables.SaveData = True
	lole_QueryTables.AdjustColumnWidth = True
	lole_QueryTables.RefreshPeriod = 0
	lole_QueryTables.TextFilePromptOnRefresh = False
	lole_QueryTables.TextFilePlatform = 936
	lole_QueryTables.TextFileStartRow = 1
	lole_QueryTables.TextFileParseType =1// xlDelimited
	lole_QueryTables.TextFileTextQualifier =1// xlTextQualifierDoubleQuote
	lole_QueryTables.TextFileConsecutiveDelimiter = False
	lole_QueryTables.TextFileTabDelimiter = True
	lole_QueryTables.TextFileSemicolonDelimiter = False
	lole_QueryTables.TextFileCommaDelimiter = False
	lole_QueryTables.TextFileSpaceDelimiter = False
	lole_QueryTables.TextFileColumnDataTypes = {2, 2, 2}
	lole_QueryTables.TextFileTrailingMinusNumbers = True
	lole_QueryTables.Refresh(False)
	
//	iobj.application.ActiveWorkbook.ActiveSheet.SaveAs('D:\1.xlsx',51)
	
//	//已打开文件
//	is_filename=as_filepath
//	i_filestate=1

catch (runtimeerror e)
	ls_errtext+=as_filepath+'打开失败:'+e.getmessage()
finally
//	if lb_open=true then iobj.application.Workbooks.Close //如果没有此句,excel进程可能不能立即结束
//	if lb_alive=false and iobj.isalive()=true then 
//		iobj.application.quit
//		iobj.disconnectobject()
//	end if
end try

if ls_errtext<>'' then goto e

return ''

e:
ls_errtext=is_lasterror
return ls_errtext


//xlDMYFormat 4 DMY 日期格式。 
//xlDYMFormat 7 DYM 日期格式。 
//xlEMDFormat 10 EMD 日期格式。 
//xlGeneralFormat 1 常规。 
//xlMDYFormat 3 MDY 日期格式。 
//xlMYDFormat 6 MYD 日期格式。 
//xlSkipColumn 9 列未分列。 
//xlTextFormat 2 文本。 
//xlYDMFormat 8 YDM 日期格式。 
//xlYMDFormat 5 YMD 日期格式。 

end function

public function string uf_excelmerge (string ls_filenamestr, string ls_sheetstr, string ls_startrowstr, string ls_newfilename, string ls_filetype);string ls_filename[]
string ls_sheet[]
string ls_startrow[]

getarray(ls_filenamestr,ls_filename[],';')
getarray(ls_sheetstr,ls_sheet[],';')
getarray(ls_startrowstr,ls_startrow[],';')

return uf_excelmerge(ls_filename[],ls_sheet[],ls_startrow[],ls_newfilename,ls_filetype)
end function

on u_derek_v2_excel.create
call super::create
this.ids=create ids
this.isqlca=create isqlca
this.iobj=create iobj
TriggerEvent( this, "constructor" )
end on

on u_derek_v2_excel.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ids)
destroy(this.isqlca)
destroy(this.iobj)
end on

type ids from datastore within u_derek_v2_excel descriptor "pb_nvo" = "true" 
end type

on ids.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror;is_lasterror+=sqlerrtext 
return 1  //不显示出错信息
end event

event error;is_lasterror+=errortext 
end event

type isqlca from transaction within u_derek_v2_excel descriptor "pb_nvo" = "true" 
end type

on isqlca.create
call super::create
TriggerEvent( this, "constructor" )
end on

on isqlca.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;if this.dbhandle()>0 then 
	disconnect using isqlca;
end if
end event

type iobj from oleobject within u_derek_v2_excel descriptor "pb_nvo" = "true" 
end type

on iobj.create
call super::create
TriggerEvent( this, "constructor" )
end on

on iobj.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;if IsAlive() then 
	this.DisconnectObject()
end if
end event

