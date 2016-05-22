$PBExportHeader$u_derek_v2_dd.sru
$PBExportComments$设置数据窗口属性
forward
global type u_derek_v2_dd from nonvisualobject
end type
type ids_temp from datastore within u_derek_v2_dd
end type
type ids from datastore within u_derek_v2_dd
end type
end forward

global type u_derek_v2_dd from nonvisualobject
ids_temp ids_temp
ids ids
end type
global u_derek_v2_dd u_derek_v2_dd

type prototypes
Function long GetSystemMetrics (long nIndex) Library "user32" Alias for "GetSystemMetrics;ansi"
end prototypes

type variables
string is_dberror
//window iw_wait
boolean ib_wait
blob ibb_sql
boolean ib_ufupdate=false

//XML
string is_listname[],is_listsql[],is_nodename[],is_fieldname[],is_keystring[]
datastore ids_list[],ids_nodes,ids_fields,ids_wherekeys,ids_keyparent
boolean ib_dsbuild[] /*create*/,ib_dsempty[] /*用于xmlout,空ds取parent*/
int i_listcount,i_nodecount[],i_keycount[],i_listparent[]
datastore ds_valid
//int i_tempfile
end variables

forward prototypes
public function string getquery (ref powerobject dd, string as_sql)
public function string getattribstring (string as_columns, string attrib, boolean ab_is)
public function string getupdatestring (powerobject dd, string as_tablename, string as_keys)
public function string getmodify (ref powerobject ad_dd, string as_sql, string as_tablenme, transaction as_sqlca)
public function string getquery (ref powerobject dd, string as_sql, transaction at_sqlca)
public function string setupdates (ref powerobject ad_dd, string as_tablename, string as_keys)
public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_sqlb, string l_tableb)
public function string setdbname (powerobject a_dd, string as_dbnames)
public function string xml2db (string as_xml, string as_xmltp, string as_eles, string as_tablename, string as_sql)
public function string addxmltp (powerobject a_dd, string as_head, string as_nodes, string as_eles)
public function string xmlimport (datastore a_dd, string as_xml, string as_xmltp, string as_eles)
public function string xmlimport (datawindow a_dd, string as_xml, string as_xmltp, string as_eles)
public function string getupdatestring (powerobject dd, string as_tablename, string as_keys, string as_updates)
public function string setcolumnvalues (powerobject dd, string as_column, string as_sql, string as_displayvalue, string as_datavalue)
public function string getdwosyntax (readonly string as_dwsyntax, readonly string as_dwotype, readonly string as_keyword)
public function string getresult (string as_sql)
public function string setupdates (ref powerobject ad_dd, string as_tablename, string as_keys, string as_updates)
public function string getmodify (ref powerobject ad_dd, string as_sql, string as_tablenme, string as_updates, transaction as_sqlca)
public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_tableb)
public function string setdbupdates (powerobject a_dd, string as_tablename, string as_dbnames)
public function integer wait (integer ai_position, string as_status)
public function string uf_update (powerobject dd, boolean a, boolean c)
public function any array2dsort (any a_array, string as_sort, integer al_upperbound)
public function string uf_getprop (powerobject dd, string as_str, long row)
public function string uf_dwoband (powerobject dd)
public function string uf_createdwo (string as_oldname, string as_newname, string as_addstr)
public function string setattribs (powerobject dd, string as_columns, string attrib, string as_values)
public function string getcomposite (ref powerobject dd, powerobject d_source)
public function string getattribstring (string as_columns, string attrib, string as_values)
public function string setattribs (powerobject dd, string as_columns, string attrib, boolean ab_is)
public function any getcolumns (powerobject dd, integer ai_types)
public function string getstr (readonly string as_array[], readonly string as_sep, readonly integer ai_option)
public function string uf_getdwselected (powerobject dd)
public function string uf_settexts (powerobject dd, string as_text)
public function string uf_settexts (powerobject dd, string as_text, datastore ads)
public function integer uf_settext (powerobject dd, integer al_row, string as_columname, string as_text)
public function string uf_setitems (powerobject dd, string as_text, readonly integer ai_option)
public function boolean uf_getmodifiable (powerobject dd, long row, string as_column)
public function string uf_selectedtext (powerobject dd)
public function int getquery (ref powerobject dd, string as_sql, ref string as_error)
public function integer getquery (ref powerobject dd, string as_sql, transaction at_sqlca, ref string as_error)
public function integer uf_getselected (ref powerobject apo, readonly string as_column, ref string as_values[])
public function long uf_findalike (readonly datawindow adw, readonly string as_find, long row, readonly long al_startrow)
public function string addxmltp (powerobject a_dd, string as_head, string as_nodes, string as_eles, string as_encoding)
public function string xmlfileimport (datastore a_dd, string as_xmlfile, string as_header, string as_xmltp, string as_eles, string as_encoding)
public function string xmlfile2db (string as_xmlfile, string as_header, string as_xmltp, string as_eles, string as_encoding, string as_tablename, string as_sql)
public function string xmlfile2db (string as_xmlfile, string as_header, string as_xmltp, string as_eles, string as_encoding, string as_tablename, string as_sql, string as_modify)
public function string getdisplayval (string ls_values, string ls_dataval)
public function integer uf_export (dragobject dd, boolean lb_colheading, string ls_separatorcharacter, string ls_quotecharacter, string ls_lineending)
public function integer getcolumns (powerobject dd, integer ai_types, ref string ls_column[])
public subroutine uf_example ()
public function string getattribstring (ref string as_columns[], string attrib, string as_values)
public function string setattribs (powerobject dd, ref string as_columns[], string attrib, string as_values)
public function integer uf_xmlout_destroy ()
public function string uf_xmlout (ref string ls_text)
public function integer uf_xmlout_create (ref string ls_errtext)
public subroutine uf_example2 ()
public function string uf_xmlout (ref string ls_text[], boolean lb_destroy)
public function long uf_selectedtext (powerobject dd, ref string ls_text)
public function string uf_import_bak (powerobject dd, ref string ls_inputcols, long al_row, string as_column, string as_text)
public function integer replaceex (ref string ls_text, character as_str1[], character as_str2[])
public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[])
public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[], readonly integer li_option)
public function string uf_grid2free (datawindow dw_1)
public function integer uf_getobjects (powerobject dd, string ls_band, ref string ls_column[])
public function integer uf_sql_alias (character ls_sql[], ref string ls_dbname, ref string ls_alias)
public function long uf_sql_alias_clear (character lc_sql[], ref string ls_newsql)
public function string uf_dwocopy (datawindow ldw, integer ai_column, string ls_dwoname[], string ls_appsyntax[])
public function string uf_dwocopy (datawindow ldw, integer ai_column, string ls_dwotype[], ref string ls_dwoname[], ref string ls_appsyntax[])
public function string xml2db (string as_xml, string as_xmltp, string as_eles, string as_tablename, string as_sql, string as_modify)
public function string getresult (string as_sql, transaction ltrans)
public function string uf_getdata (powerobject ldd_source, string ls_columns[], ref datastore lds_dest)
public function string uf_getdata (powerobject ldd_source, string ls_columns[], ref string ls_ref[], string ls_separator, string ls_quote)
public function long uf_findrows (powerobject ldw, string ls_findstr, ref long l_selected[])
public function string uf_getrowheight (datawindow ldw, dwobject ldwo)
public function string setcolumnvalues (powerobject dd, string as_column, datastore ldd_1, string as_displayvalue, string as_datavalue)
public subroutine uf_xmlout_append (ref string ls_text, string ls_listname, datastore ldw_parent, long l_parentrow)
public function string uf_xmlout (ref string ls_text[])
public function string uf_getdwheight (powerobject ldw, ref long l_height)
public function string uf_posvalue (string ls_args, string ls_field, string ls_endstr)
public function string uf_cutvalue (ref string ls_args, string ls_field, string ls_endstr)
private subroutine uf_sql_fields (character ls_sql[], ref string ls_dbname, ref string ls_alias)
public function integer uf_selectinto (string as_sql, any a_parm[], ref parmtype ltype_ref[])
public function string uf_parmtype (parmtype lparmtype)
public function long uf_findarray (string a_array[], string a_value, integer ai_option)
public function integer uf_xmlout_reset ()
public function integer uf_setitem (datawindow dd, long al_row, string as_columname, any a_value, integer ai_option)
public function integer uf_setitem (datastore dd, readonly long al_row, readonly string as_columname, readonly any a_value, integer ai_option)
public function string uf_dwcreatetab (powerobject ldw, string ls_tablename, transaction ltrans)
public function integer execddl (string as_sql, transaction at_trans)
public function any uf_getitem (ref datawindow dd, long al_row, string as_columname, string ls_coltype, dwbuffer ldwbuffer, boolean loriginal)
public function any uf_getitem (ref datastore dd, long al_row, string as_columname, string ls_coltype, dwbuffer ldwbuffer, boolean loriginal)
public function string uf_update (ref datastore ldw_1, string ls_param, transaction ltrans_1)
public function string uf_update (ref datawindow ldw_1, string ls_param, transaction ltrans_1)
public function string uf_xmlout (ref string ls_text, boolean lb_create, boolean lb_destroy)
public function string uf_import (datawindow dd, string ls_inputcols, long l_startrow, string ls_startcolumn, string ls_text)
public function integer uf_setcell (datawindow dd, long row, string column)
public function string valuescase (string fieldname, string fieldtype, string values, string showtype)
public function string uf_sql_explain (character ls_sql[], ref string ls_newsql, ref string ls_aliasname[], ref string ls_expression[])
public function string uf_sql_explain (character ls_sql[], string ls_param)
public function string tovalue (readonly any la_value, readonly string ls_op)
public function string uf_execute (string as_sql, any a_parm[], transaction ltrans)
end prototypes

public function string getquery (ref powerobject dd, string as_sql);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

return getquery(dd,as_sql,sqlca)
end function

public function string getattribstring (string as_columns, string attrib, boolean ab_is);
//得到设置数据窗口对象属性的字符串
//参数:1列名,{列名2,{...}}
//2:属性名 
//3.true/false
string ls_string,ls_columns[]
string ls_value

getarray(as_columns,ls_columns[],',')

if ab_is=true then
	ls_value='1'
else
	ls_value='0'
end if

ls_string=getattribstring(ls_columns[],attrib,ls_value)

return ls_string
end function

public function string getupdatestring (powerobject dd, string as_tablename, string as_keys);//得到数据窗口可修改的修改属性字符串
//参数1:为要更新的表名
//参数2:主键,如不指定则为全部字段
return getupdatestring(dd,as_tablename,as_keys,'')
end function

public function string getmodify (ref powerobject ad_dd, string as_sql, string as_tablenme, transaction as_sqlca);//参数:要改变属性的datawindow/datastore,sql语句,要更新的表名
//返回''成功,否则为失败原因
//ref参数返回一个具有保存数据的datawindow/datastore

//基础:
//datastore ds 
//ds=create datastore

//string l_sql,l_tablenme,l_syntax,l_err,l_string=''
//
//long l_return,l_pos,l_pos1
//
////建立可以保存数据的数据窗口
//l_sql=as_sql
//l_syntax=as_sqlca.syntaxfromsql(l_sql,'style(type=grid)',l_err)
//if len(l_err)>0 then
//   l_string=l_err+'~r~n'
//	goto e
//end if
//if pos(l_syntax,'update=yes',1)<=0 then
//		l_pos=0
//		l_pos1=1
//		l_pos=pos(l_syntax,'updatewhereclause = yes',l_pos1)
//		do while l_pos1<len(l_syntax) and l_pos<>0
//			l_syntax=mid(l_syntax,1,l_pos - 1) +' update=yes key=yes ' +&
//					mid(l_syntax,l_pos,len(l_syntax) - l_pos + 1) 
//			l_pos1=l_pos + 30
//			l_pos=pos(l_syntax,'updatewhereclause = yes',l_pos1)
//		loop
//		l_pos=0
//		l_pos1=1
//		l_pos=pos(l_syntax,l_sql,l_pos1)
//		if l_pos>0 then
//			l_syntax=mid(l_syntax,1,l_pos + len(l_sql) ) +&
//			'	update="'+as_tablenme+'" updatewhere=1 updatekeyinplace=no ' +&
//			mid(l_syntax,l_pos + len(l_sql)+1 ,len(l_syntax) - l_pos - len(l_sql) ) 
//		end if
//end if
//ad_dd.dynamic create(l_syntax,l_err)
//
//if len(l_err)>0 then
//   l_string=l_err+'~r~n'
//	goto e
//end if

string l_string=''

l_string=getquery(ad_dd,as_sql,as_sqlca)
if l_string<>'' then goto e

l_string=setupdates( ad_dd, as_tablenme, '')
if l_string<>'' then goto e

return ''
e:
return l_string
end function

public function string getquery (ref powerobject dd, string as_sql, transaction at_sqlca);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

string l_syntax,l_err=''
if getquery(dd,as_sql,at_sqlca,l_err)=-1 then return l_err
return ''
end function

public function string setupdates (ref powerobject ad_dd, string as_tablename, string as_keys);//使数据窗口可修改保存,所有列可修改,
//参数1:数据窗口对象
//参数2:修改到表
//参数3:主键
//返回''为成功,否则为错误信息
string ls_string
ls_string=getupdatestring( ad_dd, as_tablename, as_keys)
return ad_dd.dynamic modify(ls_string)
end function

public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_sqlb, string l_tableb);//两个事务通过rowscopy进行数据复制,没有进行提交
//返回成功行数,-1 为失败,il_dberror记录错误信息

string l_string
long i,l_rowcount

is_dberror=''	//清除错误信息

l_string=getquery(ids,l_sqlb,l_sqlcb)	//使ids成为一个可以保存的数据对象
//l_string=getmodify(ids,l_sqlb,l_tableb,l_sqlcb)	//使ids成为一个可以保存的数据对象

if l_string<>'' then 
	is_dberror+=l_string
	goto e
end if

ids.settransobject(l_sqlca)

if ids.setsqlselect(l_sqla)<>1 then 
	is_dberror+="Setsqlselect Failed:"
	goto e
end if

l_rowcount=ids.retrieve()	//返回查询行数 -1为失败

if l_rowcount=-1 then goto e

if l_rowcount=0 then goto m	//无记录

ids.settransobject(l_sqlcb)

l_string=setupdates(ids,l_tableb,'')

if l_string<>'' then 
	is_dberror+=l_string
	goto e
end if

//for i=1 to l_rowcount
//	ids.setitemstatus(i,0,Primary!	,NewModified!)
//next 

//if ids.update( )=1 then 
//	return l_rowcount
//else
//	is_dberror='保存失败!'+is_dberror
//	goto e
//end if

string ls_ret
ls_ret=uf_update(ids,'batch=50;insert=1;',l_sqlcb)
if ls_ret='' then 
	return l_rowcount
else
	is_dberror='保存失败:'+ls_ret
	goto e
end if

m:
return 0

e:
return -1
end function

public function string setdbname (powerobject a_dd, string as_dbnames);//设置dbname
//参数1为数据对象:ds/dw
//参数2为dbnames:格式:a,b,,c,,d,e
//注:空的dbname为不设置

int li_pos1,li_pos2,l
int i,li_colcount,li_ub,li_min
string ls_string,ls_dbnames[]
li_pos1=0
i=0

if as_dbnames='' or isnull(as_dbnames) then return ''
li_ub=getarray( as_dbnames,ls_dbnames[],',')
//li_ub=upperbound(ls_dbnames[])
li_colcount=integer(a_dd.dynamic describe("datawindow.column.count"))

li_min=min(li_ub,li_colcount)
for i=1 to li_min
	if ls_dbnames[i]='' then continue;
	ls_string+=' #'+string(i)+'.dbname="'+ls_dbnames[i]+'"'
next

return a_dd.dynamic modify(ls_string)
end function

public function string xml2db (string as_xml, string as_xmltp, string as_eles, string as_tablename, string as_sql);/*xml保存至数据库
参数1:xml内容
参数2:要增加模板的节点
参数3:列对应的元素
参数4:要更新至的表
参数5:创建dw/ds的sql语句,决定了更新表的字段名称
*/

return xml2db(as_xml,as_xmltp,as_eles,as_tablename,as_sql,'')
end function

public function string addxmltp (powerobject a_dd, string as_head, string as_nodes, string as_eles);/*增加xml模板,并使用该模板
a_dd:目标dw/ds
as_header:xml的header(如:<?xml version="1.0" encoding="UTF-16LE" standalone="yes"?>)
as_xmltp:要增加模板的节点
as_eles:列对应的元素
注:仅支持UTF-8
*/
return addxmltp(a_dd,as_head,as_nodes,as_eles,'UTF-8')
end function

public function string xmlimport (datastore a_dd, string as_xml, string as_xmltp, string as_eles);/*xml导入至dw/ds
参数1:目标dw/ds
参数2:xml内容
参数3:要增加模板的节点
参数4:列对应的元素
*/

int li_ret
string ls_msg,ls_dwsyntax,ls_initial

string as_head='<?xml version=~~"1.0~~" encoding=~~"UTF-8~~" standalone=~~"no~~"?>'

li_ret= XMLParseString(as_xml)

if li_ret<>0 then //验证xml
	ls_msg+='xml验证失败:'+string(li_ret)
	goto e
end if

ls_dwsyntax='release 12;~r~n table(' 
int li_count
long i
string ls_colname,ls_coltype
li_count=integer(a_dd.dynamic describe("datawindow.column.count"))
for i=1 to li_count
	ls_colname=a_dd.dynamic describe("#"+string(i)+".name")
	ls_coltype=a_dd.dynamic describe("#"+string(i)+".coltype")
	ls_initial=a_dd.dynamic describe("#"+string(i)+".initial")
	//if ls_initial='null' then ls_initial=''
	if left(ls_coltype,5)='char(' then 
		ls_dwsyntax+='~r~n column=(type=char(32766) name='+ls_colname+' dbname="'+ls_colname+'" initial="'+ls_initial+'" )' 
	else
		ls_dwsyntax+='~r~n column=(type='+ls_coltype+' name='+ls_colname+' dbname="'+ls_colname+'" initial="'+ls_initial+'"  )' 
	end if
next
ls_dwsyntax+='~r~n )'

if ids_temp.create(ls_dwsyntax,ls_msg)=-1 then goto e

ls_msg=addxmltp(ids_temp,as_head,as_xmltp,as_eles)	//设置模板
if ls_msg<>'' then goto e

is_dberror=''
li_ret=ids_temp.importstring(xml!,as_xml)		//导入xml
choose case li_ret
	case is>=0 
		if ids_temp.rowscopy(1,ids_temp.rowcount(),primary!,a_dd,a_dd.rowcount()+1,primary!)=-1 then 
			ls_msg="数据转移失败!"
			goto e
		end if
		ids_temp.dataobject='' //清空临时ds
		ls_msg=''
	case -1  
		ls_msg+="No rows or startrow value supplied is greater than the number of rows in the string"
	case -3  
		ls_msg+="Invalid argument"
	case -4  
		ls_msg+="Invalid input"
	case -11  
		ls_msg+="XML Parsing Error; XML parser libraries not found or XML not well formed"
	case -12  
		ls_msg+="XML Template does not exist or does not match the DataWindow"
	case -13   
		ls_msg+="Unsupported DataWindow style for import"
	case -14   
		ls_msg+="Error resolving DataWindow nesting"
end choose
if li_ret<0 then 
	ls_msg+='	'+is_dberror
end if

//messagebox('',li_ret)
e:
return ls_msg
end function

public function string xmlimport (datawindow a_dd, string as_xml, string as_xmltp, string as_eles);/*xml导入至dw/ds
参数1:目标dw/ds
参数2:xml内容
参数3:要增加模板的节点
参数4:列对应的元素
*/


int li_ret
string ls_msg

string as_head='<?xml version=~~"1.0~~" encoding=~~"UTF-8~~" standalone=~~"no~~"?>'

li_ret= XMLParseString(as_xml)

if li_ret<>0 then //验证xml
	ls_msg+='xml验证失败:'+string(li_ret)
	goto e
end if

ls_msg=addxmltp(a_dd,as_head,as_xmltp,as_eles)	//设置模板
if ls_msg<>'' then goto e
//clipboard(a_dd.describe("datawindow.syntax"))
//messagebox('','开始导入')

li_ret=a_dd.importstring(xml!,as_xml)		//导入xml

choose case li_ret
	case is>=0 
		ls_msg+=''
	case -1  
		ls_msg+="No rows or startrow value supplied is greater than the number of rows in the string"
	case -3  
		ls_msg+="Invalid argument"
	case -4  
		ls_msg+="Invalid input"
	case -11  
		ls_msg+="XML Parsing Error; XML parser libraries not found or XML not well formed"
	case -12  
		ls_msg+="XML Template does not exist or does not match the DataWindow"
	case -13   
		ls_msg+="Unsupported DataWindow style for import"
	case -14   
		ls_msg+="Error resolving DataWindow nesting"
end choose

//messagebox('',li_ret)
e:
return ls_msg
end function

public function string getupdatestring (powerobject dd, string as_tablename, string as_keys, string as_updates);//得到数据窗口可修改的修改属性字符串
//参数1:为要更新的表名
//参数2:主键,如不指定则为全部字段

string ls_string
string ls_colname,ls_colnames
int li_colcount
int i

ls_string="DataWindow.Table.UpdateTable='"+as_tablename+"' datawindow.table.UpdateKeyInPlace=yes datawindow.Table.UpdateWhere=2"+" "

if as_keys='' or as_updates='' then
	li_colcount=long(dd.dynamic Describe("DataWindow.Column.Count"))
	for i=1 to li_colcount
		ls_colname=string(dd.dynamic Describe("#"+string(i)+".name"))
		ls_colnames=ls_colnames+ls_colname+','
	next
end if

if as_updates='' then as_updates=ls_colnames
ls_string+=getattribstring(as_updates,'update',true)

//如果key为空则key为全部
if as_keys='' then as_keys=ls_colnames
ls_string+=getattribstring(as_keys,'key',true)+" "


return ls_string
end function

public function string setcolumnvalues (powerobject dd, string as_column, string as_sql, string as_displayvalue, string as_datavalue);//设置字段为dropdownlistbox的values
//参数dd:数据窗口
//as_column要添加values的字段,可以是#+colid
//as_sql 列表的数据
//as_displayvalue	显示的字段值
//as_datavalue	数据项

long i,l_rowcount
string ls_errortext

ls_errortext=getquery(ids,as_sql)
if ls_errortext>'' then goto e

ids.settransobject(sqlca)
l_rowcount=ids.retrieve()
if l_rowcount=-1 then 
	ls_errortext=is_dberror
	goto e
end if

ls_errortext=setcolumnvalues(dd,as_column,ids,as_displayvalue,as_datavalue)

e:
return ls_errortext
end function

public function string getdwosyntax (readonly string as_dwsyntax, readonly string as_dwotype, readonly string as_keyword);//返回一个dwo的语法,例:column(name=nb1 visible="1" ... tabsequence=0 )
//as_dwotype:column/text/compute...
//as_keyword:唯一标识,例:" id=7 "...

long l_pos,l_pos_s,l_pos_e

string ls_syntax

if as_dwotype='datawindow' then 
	l_pos=pos(as_dwsyntax,as_keyword)
	l_pos_s=lastpos(as_dwsyntax,'~r~n'+as_dwotype,l_pos + len(as_keyword)) + 2
	l_pos_e=pos(as_dwsyntax,')~r~n',l_pos)
else
	l_pos=pos(as_dwsyntax,as_keyword)
	l_pos_s=lastpos(as_dwsyntax,'~r~n'+as_dwotype+'(',l_pos) + 2
	l_pos_e=pos(as_dwsyntax,' )~r~n',l_pos)
end if

ls_syntax=mid(as_dwsyntax,l_pos_s,l_pos_e - l_pos_s + 2 )

return ls_syntax
end function

public function string getresult (string as_sql);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

return getresult(as_sql,sqlca)
end function

public function string setupdates (ref powerobject ad_dd, string as_tablename, string as_keys, string as_updates);//使数据窗口可修改保存,所有列可修改,
//参数1:数据窗口对象
//参数2:修改到表
//参数3:主键
//返回''为成功,否则为错误信息
string ls_string
ls_string=getupdatestring( ad_dd, as_tablename, as_keys,as_updates)

return ad_dd.dynamic modify(ls_string)
end function

public function string getmodify (ref powerobject ad_dd, string as_sql, string as_tablenme, string as_updates, transaction as_sqlca);//参数:要改变属性的datawindow/datastore,sql语句,要更新的表名
//返回''成功,否则为失败原因
//ref参数返回一个具有保存数据的datawindow/datastore

//基础:
//datastore ds 
//ds=create datastore

//string l_sql,l_tablenme,l_syntax,l_err,l_string=''
//
//long l_return,l_pos,l_pos1
//
////建立可以保存数据的数据窗口
//l_sql=as_sql
//l_syntax=as_sqlca.syntaxfromsql(l_sql,'style(type=grid)',l_err)
//if len(l_err)>0 then
//   l_string=l_err+'~r~n'
//	goto e
//end if
//if pos(l_syntax,'update=yes',1)<=0 then
//		l_pos=0
//		l_pos1=1
//		l_pos=pos(l_syntax,'updatewhereclause = yes',l_pos1)
//		do while l_pos1<len(l_syntax) and l_pos<>0
//			l_syntax=mid(l_syntax,1,l_pos - 1) +' update=yes key=yes ' +&
//					mid(l_syntax,l_pos,len(l_syntax) - l_pos + 1) 
//			l_pos1=l_pos + 30
//			l_pos=pos(l_syntax,'updatewhereclause = yes',l_pos1)
//		loop
//		l_pos=0
//		l_pos1=1
//		l_pos=pos(l_syntax,l_sql,l_pos1)
//		if l_pos>0 then
//			l_syntax=mid(l_syntax,1,l_pos + len(l_sql) ) +&
//			'	update="'+as_tablenme+'" updatewhere=1 updatekeyinplace=no ' +&
//			mid(l_syntax,l_pos + len(l_sql)+1 ,len(l_syntax) - l_pos - len(l_sql) ) 
//		end if
//end if
//ad_dd.dynamic create(l_syntax,l_err)
//
//if len(l_err)>0 then
//   l_string=l_err+'~r~n'
//	goto e
//end if

string l_string=''

l_string=getquery(ad_dd,as_sql,as_sqlca)
if l_string<>'' then goto e

l_string=setupdates( ad_dd, as_tablenme,as_updates,as_updates)
if l_string<>'' then goto e

return ''
e:
return l_string
end function

public function long rowscopy (transaction l_sqlca, transaction l_sqlcb, string l_sqla, string l_tableb);//两个事务通过rowscopy进行数据复制,没有进行提交
//返回成功行数,-1 为失败,il_dberror记录错误信息

string l_string
long i,l_rowcount

is_dberror=''	//清除错误信息

//l_string=getquery(ids,l_sqlb,l_sqlcb)	//使ids成为一个可以保存的数据对象
l_string=getmodify(ids,l_sqla,l_tableb,l_sqlca)	//使ids成为一个可以保存的数据对象

if l_string<>'' then 
	is_dberror+=l_string
	goto e
end if

ids.settransobject(l_sqlca)

l_rowcount=ids.retrieve()	//返回查询行数 -1为失败

if l_rowcount=-1 then goto e

if l_rowcount=0 then goto m	//无记录

ids.settransobject(l_sqlcb)

//for i=1 to l_rowcount
//	ids.setitemstatus(i,0,Primary!	,NewModified!)
//next 

string ls_ret
ls_ret=this.uf_update(ids,'batch=50;insert=1;',l_sqlcb)
//if ids.update()=1 then 
if ls_ret='' then 
	return l_rowcount
else
	is_dberror+='保存失败:'+ls_ret
	goto e
end if

m:
return 0

e:
return -1
end function

public function string setdbupdates (powerobject a_dd, string as_tablename, string as_dbnames);//设置dbname
//参数1为数据对象:ds/dw
//参数2为dbnames:格式:a,b,,c,,d,e
//注:空的dbname为不设置

int li_pos1,li_pos2,l
int i,li_colcount,li_ub,li_min
string ls_string,ls_dbnames[]
li_pos1=0
i=0

if as_dbnames='' or isnull(as_dbnames) then return ''

ls_string="DataWindow.Table.UpdateTable='"+as_tablename+"' datawindow.table.UpdateKeyInPlace=yes datawindow.Table.UpdateWhere=0 "
li_ub=getarray( as_dbnames,ls_dbnames[],',')
//li_ub=upperbound(ls_dbnames[])
li_colcount=integer(a_dd.dynamic describe("datawindow.column.count"))
li_min=min(li_ub,li_colcount)
for i=1 to li_min
	if ls_dbnames[i]='' then continue;
	ls_string+='#'+string(i)+'.dbname="'+ls_dbnames[i]+'" #'+string(i)+'.update=yes #'+string(i)+'.key=yes '
next

return a_dd.dynamic modify(ls_string)
end function

public function integer wait (integer ai_position, string as_status);if ib_wait=false then return 1

//if isvalid(iw_wait) then return iw_wait.dynamic uf_wait(ai_position,as_status)
end function

public function string uf_update (powerobject dd, boolean a, boolean c);int li_ret=1
string ls_sql
string ls_errtext,ls_ret
ibb_sql=blob('')

if ids.create(dd.dynamic describe("datawindow.syntax"),ls_errtext)=-1 then 
	ls_errtext='Create Failed:'+ls_errtext
	goto e
end if

if dd.dynamic ShareData (ids)=-1 then 
	ls_errtext="Share Data Failed!"
	goto e
end if

ib_ufupdate=true

if ids.update(a,c)=-1 then 
	ls_errtext="Update Failed!"
	goto e
end if

if len(ibb_sql)<>0 then 
	ls_sql=string(ibb_sql)
	
	execute immediate :ls_sql;
	
	if sqlca.sqlcode=-1 then 
		ls_errtext+=sqlca.sqlerrtext
		goto e
	end if
end if



e:
ib_ufupdate=false
return ls_errtext
end function

public function any array2dsort (any a_array, string as_sort, integer al_upperbound);//功能:对2维数组排序
//参数1:要排序的数组
//参数2:升序:asc 否则为降序
//参数3:数组结束位置
//返回排序后的数组
//注:数组赋值如果界不同会先补满第一维,然后再是第二维
//调用此函数的数组上界<=1000,要排序的数据类型要一致

any la_value,la_value1,la_value2,la_array2[1000,2],la_tmp
int i,m,n
int li_ub,li_ub2
string ls_datatype	//要排序的数据类型,取第一个元素的数据类型


li_ub=upperbound(a_array)
li_ub2=upperbound(la_array2)
if al_upperbound>al_upperbound or al_upperbound=0 then al_upperbound=li_ub
if li_ub>li_ub2 then
	messagebox('提示','上界不能大于'+string(li_ub2)+'!')
	return a_array
end if

la_array2=a_array		//数组赋值如果界不同会先补满第一维,然后再是第二维

ls_datatype=classname(la_array2[1,1])

for i=1 to al_upperbound
	choose case ls_datatype
		case 'integer'
			la_value1=integer(la_array2[i,1])
		case 'long'
			la_value1=long(la_array2[i,1])
		case 'decimal'
			la_value1=dec(la_array2[i,1])
		case 'double'
			la_value1=double(la_array2[i,1])
		case 'string'
			la_value1=string(la_array2[i,1])
		case 'time'
			la_value1=time(la_array2[i,1])
		case 'date'
			la_value1=date(la_array2[i,1])
		case 'datetime'
			la_value1=datetime(la_array2[i,1])
	end choose

	if isnull(la_value1) then 
		messagebox('提示','不能有空值'+string(i)+'!')
		return a_array
	end if

	m=i
	for n=i + 1 to al_upperbound
		if isnull(la_array2[n,1]) then 
			messagebox('提示','不能有空值'+string(n)+'!')
			return a_array
		end if
		
		choose case ls_datatype
			case 'integer'
				la_tmp=integer(la_array2[n,1])
			case 'long'
				la_tmp=long(la_array2[n,1])
			case 'decimal'
				la_tmp=dec(la_array2[n,1])
			case 'double'
				la_tmp=double(la_array2[n,1])
			case 'string'
				la_tmp=string(la_array2[n,1])
			case 'time'
				la_tmp=time(la_array2[n,1])
			case 'date'
				la_tmp=date(la_array2[n,1])
			case 'datetime'
				la_tmp=datetime(la_array2[n,1])
		end choose
//		messagebox(classname(la_value1)+'/'+string(la_value1),classname(la_tmp)+'/'+string(la_tmp))
		if as_sort='asc'  then 
			if  la_value1>la_tmp then 
				la_value1=la_tmp
				if li_ub=li_ub2 then
					la_value2=la_array2[n,2]
				else
					la_value2=la_array2[n + li_ub,1]
				end if
				m=n
			end if
		else
			if  la_value1<la_tmp then 
				la_value1=la_tmp
				if li_ub=li_ub2 then
					la_value2=la_array2[n,2]
				else
					la_value2=la_array2[n + li_ub,1]
				end if
				m=n
			end if
		end if
	next

	if m>i then 
		la_array2[m,1]=la_array2[i,1]	//记录i处的值
		if li_ub=li_ub2 then
			la_array2[m,2]=la_array2[i,2]
		else
			la_array2[m + li_ub,1]=la_array2[i + li_ub,1]
		end if
		
		la_array2[i,1]=la_value1	//记录m处的值
		if li_ub=li_ub2 then
			la_array2[i,2]=la_value2
		else
			la_array2[i + li_ub,1]=la_value2
		end if
		
	end if
	
next

return la_array2
end function

public function string uf_getprop (powerobject dd, string as_str, long row);//取指定对象的属性,如uf_getprop(dw_1,codes.protect,1)
//不能提取有表达式的format属性

int i,l_cols
int l_lastpos
string ls_prop
ls_prop=dd.dynamic describe(as_str)
l_lastpos=lastpos(ls_prop,'~t')
if l_lastpos>0 then 
	ls_prop=mid(ls_prop,l_lastpos + 1,len(ls_prop) - l_lastpos - 1)
	ls_prop="Evaluate(~""+ls_prop+"~","+string(row)+")"
	ls_prop=dd.dynamic describe(ls_prop)
end if

return ls_prop
end function

public function string uf_dwoband (powerobject dd);//作用:将在background和foreground对象的band修改为header
//目的:正确取出htmltable

string ls_objects1,ls_objects[],ls_dwosyntax,ls_syntax,ls_modify,ls_modify2,ls_destroy,ls_create
int i
string ls_x,ls_width,ls_dwotype,ls_band
string ls_errtext
int li_count

ls_syntax=dd.dynamic Describe("datawindow.syntax") 
ls_objects1=dd.dynamic Describe("datawindow.objects") 
li_count=getarray(ls_objects1,ls_objects[],'~t')

for i=1 to li_count
	
	ls_band=dd.dynamic describe(ls_objects[i]+".band")
	
	if ls_band='foreground' or ls_band="background" then
		ls_dwotype=dd.dynamic describe(ls_objects[i]+".type")
		
		ls_x=uf_getprop(dd,ls_objects[i]+".x",0)
		ls_width=uf_getprop(dd,ls_objects[i]+".width",0)
		ls_dwosyntax=getdwosyntax(ls_syntax,ls_dwotype,'name='+ls_objects[i]+' ')

		ls_destroy+="destroy "+ls_objects[i]+" "
		ls_create+="create "+left(ls_dwosyntax,len(ls_dwosyntax) - 1) +" band=header ) "
		if ls_dwotype<>'text' then continue;
		ls_modify+=ls_objects[i]+".x="+ls_x+" "+ls_objects[i]+".width="+ls_width+" "
	
	end if
next

ls_errtext+=dd.dynamic modify(ls_destroy)
ls_errtext+=dd.dynamic modify(ls_create)
ls_errtext+=dd.dynamic modify(ls_modify)

return ls_errtext


end function

public function string uf_createdwo (string as_oldname, string as_newname, string as_addstr);

return ''

end function

public function string setattribs (powerobject dd, string as_columns, string attrib, string as_values);
//得到设置数据窗口对象属性的字符串
//参数:1列名,{列名2,{...}}
//2:属性名 
//3.属性值

string ls_columns[]
string ls_errtext

as_columns=string(as_columns,'')

attrib=lower(trim(string(attrib,'')))

if as_columns=''  then 
	choose case attrib
		case 'update','updatewhereclause','key','initial'
			ls_columns[]=getcolumns(dd,3)	//只返回dbcolumn
		case 'tabsequence','protect'
			ls_columns[]=getcolumns(dd,1)	//只返回column object
		case 'expression'
			ls_columns[]=getcolumns(dd,2)	//compute object
		case else
			ls_columns[]=getcolumns(dd,0)	//只返回column+compute object
	end choose
else
	getarray(as_columns,ls_columns[],',')
end if

ls_errtext=setattribs(dd,ls_columns[],attrib,as_values)

return ls_errtext
end function

public function string getcomposite (ref powerobject dd, powerobject d_source);//根据传入数据对象的datawindow属性创建空的composite风格的数据窗口
//返回值:''为成功,否则为失败信息

string ls_dwsyntax,ls_dwosyntax,ls_errtext
int li_ret

//构造composite风格的syntax
ls_dwsyntax="release 12;~r~n"
if isvalid(d_source) then
	//获取源datawindow行的syntax
	ls_dwosyntax=getdwosyntax(d_source.dynamic describe('datawindow.syntax'),'datawindow','processing=')
	ls_dwsyntax+=left(ls_dwosyntax,lastpos(ls_dwosyntax,')') - 1)+' processing=5 )~r~n'
else
	ls_dwsyntax+="Datawindow(Units=3 processing=5) "
end if
////detail为高度自适应
ls_dwsyntax+='detail(height.autosize=yes )~r~n'
//空白明细
ls_dwsyntax+='table(unbound = "yes")'

li_ret=dd.dynamic create(ls_dwsyntax,ls_errtext)

if li_ret=-1 or ls_errtext<>'' then goto e

return ''

e:
return ls_errtext
end function

public function string getattribstring (string as_columns, string attrib, string as_values);//得到设置数据窗口对象属性的字符串
//参数:1列名,{列名2,{...}}
//2:属性名 
//3.属性值

string ls_string,ls_columns[]

getarray(as_columns,ls_columns[],',')
ls_string=getattribstring(ls_columns[],attrib,as_values)

return ls_string
end function

public function string setattribs (powerobject dd, string as_columns, string attrib, boolean ab_is);//设置数据窗口对象属性
//参数:1列名,{列名2,{...}}
//2:属性名 
//3.true/false
string ls_errtext
string ls_value

if ab_is=true then 
	ls_value='1'
else
	ls_value='0'
end if

ls_errtext=setattribs(dd,as_columns,attrib, ls_value)

return ls_errtext
end function

public function any getcolumns (powerobject dd, integer ai_types);//取出detail中的对象列

string ls_columns[]
getcolumns(dd,ai_types,ls_columns[])
return ls_columns[]
end function

public function string getstr (readonly string as_array[], readonly string as_sep, readonly integer ai_option);//将字符数组拼接成字符串返回,末尾无分隔符
//参数1:数组
//参数2:为分隔符
//参数3:是否忽略空字符串

string ls_str,ls_temp
long l_count,i

l_count=upperbound(as_array[])

if l_count=0 then return ''

if ai_option=0 then 

	ls_str=as_array[1]
	
	for i=2 to l_count
		ls_str+=as_sep+as_array[i]
	next
	
elseif ai_option=1 then 
	
	for i=1 to l_count
		
		ls_temp=trim(as_array[i])
		
		if ls_temp<>'' then 
			ls_str=ls_temp
			exit
		end if
		
	next
	
	for i=i+1 to l_count
		
		ls_temp=trim(as_array[i])
		
		if ls_temp<>'' then ls_str+=as_sep+ls_temp
		
	next
	
end if

return ls_str

end function

public function string uf_getdwselected (powerobject dd);//分析数据窗口选中的矩形,并得到列表(存入ids)
//数据说明:rows=行号,colname=列名,cp_colno=列序号
//返回''为成功,否则为失败信息

string ls_pos,ls_errtext
string ls_string
string ls_rowstring[],ls_text[]
long l_row2
string ls_row2,ls_coltype
any la_value
string ls_poses[],ls_tempes[],ls_sql,ls_cols[]
int i,m,n
long l_rowcount,l_count,l_startrow,l_endrow
int li_colid/*列id*/,li_hcount,li_texthcount,li_selecthcount	//横排列数
long l_textrowcount //剪切板文本行数
long l_selectrowcount //选中行数
string ls_expression,ls_modify,ls_colname,ls_ret
string ls_dwsytax	//空对象的数据对象语法

ls_dwsytax='release 12;~r~n &
table(~r~n &
column=(type=long updatewhereclause=yes name=rows dbname="rows" )~r~n &
column=(type=char(30) updatewhereclause=yes name=colname dbname="colname" )~r~n &
 )'

//创建数据对象
ids.create(ls_dwsytax,ls_errtext)
IF Len(ls_errtext) > 0 THEN goto e

//取选中的所有位置
ls_pos=dd.dynamic describe("datawindow.selected")
if ls_pos>'' then 
	
	//得到各个选中的矩形
	getarray(ls_pos,ls_poses[],';')
	
	//得到目的dw的列顺序(包括计算列)
	ls_cols[]=getcolumns(dd,0)
	
	//得到列号的表达式
	ls_expression="case (colname "
	for i=1 to upperbound(ls_cols[])
		ls_expression+="when '"+ls_cols[i]+"' then "+string(i)+" "
	next
	ls_expression+="else 0 )"
	
	//创建计算列
	ls_modify='create compute(band=detail alignment="2" expression="'+ls_expression+'"border="6" color="0" x="0" y="0" height="20~~trowheight() - 1" width="35" format="[GENERAL]" html.valueishtml="0"  name=cp_colno visible="1"  font.face="Tahoma" font.height="-8" background.color="15790320" transparency="0" ) '
	ls_errtext=ids.modify(ls_modify)
	if ls_errtext<>'' then goto e
	
	//循环选中矩形
	for i=1 to upperbound(ls_poses[])
		li_hcount=getarray(ls_poses[i],ls_tempes[],'/')
		//li_hcount=upperbound(ls_tempes[])
		
		//取起始行和终止行,防止倒选
		l_startrow=min(long(ls_tempes[1]),long(ls_tempes[2]))
		l_endrow=max(long(ls_tempes[1]),long(ls_tempes[2])) 
		
		//遍历行号
		for m=l_startrow to l_endrow
			//遍历列
			for n=3 to li_hcount
				if ids.find("rows="+string(m)+" and colname='"+ls_tempes[n]+"' ",1,l_rowcount)>0 then continue;
				l_rowcount=ids.insertrow(0)
				ids.setitem(l_rowcount,'rows',m)
				ids.setitem(l_rowcount,'colname',ls_tempes[n])
			next
			
		next
	
	next
	
end if

//选中行
l_row2=0
do 
	l_row2=dd.dynamic getselectedrow(l_row2)
	if l_row2=0 then exit
	l_rowcount=ids.insertrow(0)
	ids.setitem(l_rowcount,'rows',l_row2)
loop  until l_row2=0

//排序
ids.setsort("rows A,cp_colno A")
ids.sort()

return ''

e:
return ls_errtext

end function

public function string uf_settexts (powerobject dd, string as_text);//作用:分析数据窗口选中的矩形 ,并粘贴数据
//powerobject dd:datawindow/datastore
//string as_text:要粘贴的字符
//返回''为成功,否则为失败信息
string ls_errtext

ls_errtext=uf_getdwselected(dd)
if ls_errtext<>'' then goto e

ls_errtext=uf_settexts(dd,as_text,ids)

e:
return ls_errtext
end function

public function string uf_settexts (powerobject dd, string as_text, datastore ads);//作用:分析数据窗口选中的矩形 ,并粘贴数据
//powerobject dd:datawindow/datastore
//string as_text:要粘贴的字符
//datastore ads:要粘贴的区域(long rows,string colname,int cp_colno)
//返回''为成功,否则为失败信息

string ls_errtext
string ls_rowstring[],ls_text[],ls_row,ls_cols[]
long l_row,l_rowcount,l_row_start,l_row_end
int i,m,n,li_ret,li_count_cols
int li_hcount,li_texthcount,li_selecthcount	//横排列数
long l_textrowcount //剪切板文本行数
long l_selectrowcount //选中行数
string ls_colname

l_rowcount=ads.rowcount()
if l_rowcount=0 then goto e
//取选中的行数
l_selectrowcount=long(ads.describe("evaluate('count(rows for all DISTINCT)',0) "))

l_textrowcount=getarray(as_text,ls_rowstring[],'~r~n')
//l_textrowcount=upperbound(ls_rowstring[])

if l_textrowcount=0 then goto e

//得到所有列(按顺序)
ls_cols[]=getcolumns(dd,0)
li_count_cols=upperbound(ls_cols[])

for i=1 to li_count_cols
	if dd.dynamic describe(ls_cols[i]+".type")<>'column' then ls_cols[i]=''
next

//第一行的内容
li_texthcount=getarray(ls_rowstring[1],ls_text[],'~t')
//li_texthcount=upperbound(ls_text[])

//剪切板里只有一个单元格的内容
if l_textrowcount=1 and li_texthcount=1 then 
	
	//逐个重复填充
	l_row=0
	
	for i=1 to l_selectrowcount

		//取最小行号的记录
		ls_row=ads.describe("evaluate('small(rows,rows,"+string(i)+" for all DISTINCT)',0) ")
		l_row=long(ls_row)
		//起始记录
		l_row_start=ads.find("rows="+ls_row,1,ads.rowcount())
		
		if string(ads.object.colname[l_row_start],'')='' then //行选中
			
			//逐个填充
			for m=1 to li_count_cols
				if ls_cols[m]='' then continue;
				if uf_getmodifiable(dd,l_row,ls_cols[m])=false then continue;	//忽略不可修改的单元格
				li_ret=uf_settext(dd,l_row,ls_cols[m],ls_text[1])
				if li_ret=1 then li_ret=dd.dynamic accepttext()
				if li_ret=-1 then 
					ls_errtext+=string(l_row)+"/"+ls_cols[m]+"~r~n"
					goto e
				end if
			next
			
		else
			//本行选中单元格数
			li_selecthcount=integer(ids.describe("evaluate('sum(if(rows="+ls_row+",1,0))',0) "))

			//结束记录
			l_row_end=l_row_start + li_selecthcount - 1
			
			//逐个填充
			for m=l_row_start to l_row_end
				
				ls_colname=string(ads.object.colname[m])
				if dd.dynamic describe(ls_colname+".type")<>'column' then continue;
				if uf_getmodifiable(dd,l_row,ls_colname)=false then continue;	//忽略不可修改的单元格

				li_ret=uf_settext(dd,l_row,ls_colname,ls_text[1])
				if li_ret=1 then li_ret=dd.dynamic accepttext()
				if li_ret=-1 then 
					ls_errtext+=string(l_row)+"/"+ls_colname+"~r~n"
					goto e
				end if
				
			next
		end if
	next
	
else
	
	//取小的行数
	l_rowcount=min(l_textrowcount,l_selectrowcount)
	
	l_row=0
	
	for i=1 to l_rowcount
		
		li_texthcount=getarray(ls_rowstring[i],ls_text[],'~t')
		//li_texthcount=upperbound(ls_text[])
		
		//取最小行号的记录
		ls_row=ads.describe("evaluate('small(rows,rows,"+string(i)+" for all DISTINCT)',0) ")
		l_row=long(ls_row)
		//起始记录
		l_row_start=ads.find("rows="+ls_row,1,ads.rowcount())
		
		if string(ads.object.colname[l_row_start],'')='' then //行选中
		
			//取横排小的数量
			li_hcount=min(li_count_cols,li_texthcount)
			
			//逐个填充
			for m=1 to li_hcount
				if ls_cols[m]='' then continue;
				if uf_getmodifiable(dd,l_row,ls_cols[m])=false then continue;	//忽略不可修改的单元格
				li_ret=uf_settext(dd,l_row,ls_cols[m],ls_text[m])
				if li_ret=1 then li_ret=dd.dynamic accepttext()
				if li_ret=-1 then 
					ls_errtext+=string(l_row)+"/"+ls_cols[m]+"~r~n"
					goto e
				end if
			next
			
		else
			//本行选中单元格数
			li_selecthcount=integer(ids.describe("evaluate('sum(if(rows="+ls_row+",1,0))',0) "))
			//取横排小的数量
			li_hcount=min(li_selecthcount,li_texthcount)
			//结束记录
			l_row_end=l_row_start + li_hcount - 1
			
			//逐个填充
			for m=l_row_start to l_row_end
				
				ls_colname=string(ads.object.colname[m])
				if dd.dynamic describe(ls_colname+".type")<>'column' then continue;
				if uf_getmodifiable(dd,l_row,ls_colname)=false then continue;	//忽略不可修改的单元格

				li_ret=uf_settext(dd,l_row,ls_colname,ls_text[m - l_row_start + 1])
				if li_ret=1 then li_ret=dd.dynamic accepttext()
				if li_ret=-1 then 
					ls_errtext+=string(l_row)+"/"+ls_colname+"~r~n"
					goto e
				end if
				
			next
		end if
	next

end if

if ls_errtext<>'' then ls_errtext+='设置失败!'

e:
return ls_errtext
end function

public function integer uf_settext (powerobject dd, integer al_row, string as_columname, string as_text);//返回0为未设值,1成功,-1 为失败

if uf_setcell(dd,al_row,as_columname)=-1 then goto e
return dd.dynamic settext(as_text)

e:
return -1
end function

public function string uf_setitems (powerobject dd, string as_text, readonly integer ai_option);
//分析数据窗口选中的矩形 ,并粘贴数据
//ai_option=1为不设置类型不兼容的值,0 为全部设置

string ls_pos,ls_errtext
string ls_string
string ls_rowstring[],ls_text[]
long l_row2
string ls_row2,ls_coltype
any la_value
string ls_poses[],ls_tempes[],ls_sql,ls_cols[]
int i,m,n
long l_rowcount,l_count,l_startrow,l_endrow
int li_colid/*列id*/,li_hcount,li_texthcount,li_selecthcount	//横排列数
long l_textrowcount //剪切板文本行数
long l_selectrowcount //选中行数
string ls_expression,ls_modify,ls_colname,ls_ret
string ls_dwsytax	//空对象的数据对象语法
//提取选中信息
ls_errtext=uf_getdwselected(dd)
if ls_errtext<>'' then goto e
if ids.rowcount()=0 then goto e
//取选中的行数
l_selectrowcount=long(ids.describe("evaluate('count(rows for all DISTINCT)',0) "))

//取剪切板
ls_string=as_text

l_textrowcount=getarray(ls_string,ls_rowstring[],'~r~n')
//l_textrowcount=upperbound(ls_rowstring[])

//第一行的内容
li_texthcount=getarray(ls_rowstring[1],ls_text[],'~t')
//li_texthcount=upperbound(ls_text[])

//剪切板里只有一个单元格的内容
if l_textrowcount=1 and li_texthcount=1 then 
	
	//逐个重复填充
	for m=1 to l_rowcount
		ls_colname=string(ids.object.colname[m])
		l_row2=ids.object.rows[m]
		
		ls_ret=string(uf_setitem(dd,l_row2,ls_colname,ls_text[1],ai_option),'')
		
		if ls_ret<>'0' and ls_ret<>'1' then
			ls_errtext+=string(l_row2)+"/"+ls_colname+"~r~n"
		end if
	next
	
else
	
	//取小的行数
	l_rowcount=min(l_textrowcount,l_selectrowcount)
	
	l_row2=0
	
	for i=1 to l_rowcount
		
		li_texthcount=getarray(ls_rowstring[i],ls_text[],'~t')
		//li_texthcount=upperbound(ls_text[])
		
		ids.setfilter("")
		ids.filter()
		
		//取最小行号的记录
		l_row2=long(ids.describe("evaluate('small( rows,rows ,"+string(i)+" for all distinct)',0)"))
		ids.setfilter("rows="+string(l_row2))
		ids.filter()
		li_selecthcount=ids.rowcount()
		
		//取横排小的数量
		li_hcount=min(li_selecthcount,li_texthcount)
		//逐个填充
		for m=1 to li_hcount
			
			ls_colname=string(ids.object.colname[m])
			
			ls_ret=string(uf_setitem(dd,l_row2,ls_colname,ls_text[m],ai_option),'')
			if ls_ret<>'0' and ls_ret<>'1' then
				ls_errtext+=string(l_row2)+"/"+ls_colname+"~r~n"
			end if
			
		next
	
	next

end if

if ls_errtext<>'' then ls_errtext+='设置失败!'

e:
return ls_errtext


end function

public function boolean uf_getmodifiable (powerobject dd, long row, string as_column);//判断单元格是否可修改
int li_protect,li_tabsq

if row<=0 or row>dd.dynamic rowcount() then return false
if dd.dynamic describe(as_column+".type")<>'column' then return false

li_protect=integer(uf_getprop(dd,as_column+".protect",row))
li_tabsq=integer(dd.dynamic describe(as_column+".tabsequence"))

if li_protect=0 and li_tabsq>0 then return true

return false
end function

public function string uf_selectedtext (powerobject dd);string ls_string
uf_selectedtext(dd,ls_string)
return ls_string
end function

public function int getquery (ref powerobject dd, string as_sql, ref string as_error);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

return getquery(dd,as_sql,sqlca,as_error)
end function

public function integer getquery (ref powerobject dd, string as_sql, transaction at_sqlca, ref string as_error);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore
//as_sql 支持如下:列名#类型#默认值#update#updatewhere;
// column=a{,b#char#null#yes#yes}; //指定列名+指定类型 (推荐)
// column=*{#char#null#yes#yes}; //自截取列名+指定类型
// column=a#*{,b#*#null#yes#yes}; //指定列名+cursor获取类型
// column=*#*{#null#yes#yes}; //自截取列名+cursor获取类型

string l_syntax,ls_modify,ls_ret,ls_ref
string ls_key[]={'table','column','dataobject'}
string ls_tablevalue,ls_dataobject,ls_table
string ls_dbname[],ls_temp[]
long l_count,i,l_colcount
any la_parm[]
parmtype lparmtype_ref[]
datawindow ldw_1
datastore lds_1

as_error=string(as_error,'')
if left(as_sql,len(ls_key[1]))=ls_key[1] then 
	ls_table=uf_cutvalue(as_sql,ls_key[1]+'=',';')
end if
if left(as_sql,len(ls_key[2]))=ls_key[2] then 
	ls_tablevalue=uf_cutvalue(as_sql,ls_key[2]+'=',';')
end if
if left(as_sql,len(ls_key[3]))=ls_key[3] then 
	ls_dataobject=uf_cutvalue(as_sql,ls_key[3]+'=',';')
end if

if ls_tablevalue<>'' then 
	l_syntax="release 12;table("
	
	//列名,类型,initial,update,key

	string ls_coldefine[],ls_temp2[]
	string ls_name[],ls_type[],ls_initial[],ls_update[],ls_updatewhere[]
	string ls_dwsyntax,ls_errtext
	l_colcount=getarray(ls_tablevalue,ls_coldefine[],',')
	
	for i=1 to l_colcount
		ls_temp2[]={'col'+string(i),'char(32766)','null','yes','yes'}
		l_count=getarray(ls_coldefine[i],ls_temp2[],'#')
		ls_name[i]=trim(ls_temp2[1])
		ls_type[i]=trim(ls_temp2[2])
		ls_initial[i]=trim(ls_temp2[3])
		ls_update[i]=trim(ls_temp2[4])
		ls_updatewhere[i]=trim(ls_temp2[5])
		
//		if match(left(ls_name[i],1),'[a-zA-Z]')=false then 
//			ls_errtext="列名"+string(i)+"无效:"+ls_name[i]
//			goto e
//		end if
		if ls_type[i]='' then 
			ls_type[i]='char(32766)'
		elseif ls_type[i]='char' then 
			ls_type[i]='char(32766)'
		elseif ls_type[i]='string' then 
			ls_type[i]='char(32766)'
		end if
	next
	
	if ls_name[1]='*' then 
		uf_sql_explain(as_sql,ls_ref,ls_dbname[],ls_temp[])
		l_count=upperbound(ls_dbname[])
		if l_count<=0 then 
			as_error="提取列名失败:"+string(l_count)
			goto e
		end if
		l_colcount=l_count
		ls_name[]=ls_dbname[]
		for i=2 to l_colcount
			ls_type[i]=ls_type[1]
			ls_initial[i]=ls_initial[1]
			ls_update[i]=ls_update[1]
			ls_updatewhere[i]=ls_updatewhere[1]
		next
	end if
	
	if ls_type[1]='*' then 
		//用dynamic_cursor自动获取数据类型
		l_count=uf_selectinto(as_sql,la_parm[],lparmtype_ref[])
		if l_count<>l_colcount then 
			as_error="select列数不匹配:"+string(l_count)+'/'+string(l_colcount)
			goto e
		end if
		for i=1 to l_count
			ls_type[i]=uf_parmtype(lparmtype_ref[i])
		next
	end if
	
	for i=1 to l_colcount
		l_syntax+="column=(type="+ls_type[i]+" name="+ls_name[i]+" dbname=~""+ls_name[i]+"~" update="+ls_update[i]+" key="+ls_updatewhere[i]+" updatewhereclause="+ls_updatewhere[i]+" initial=~""+ls_initial[i]+"~") ~r~n"
	next
	
	//l_syntax+=ls_ref
	if as_sql<>'' then 
		l_syntax+="retrieve=~""+as_sql+"~" "
	end if
	if ls_table<>'' then 
		l_syntax+="update=~""+ls_table+"~" "
	end if
	l_syntax+=' updatewhere=1 updatekeyinplace=no )'
	if dd.dynamic create(l_syntax,as_error)=-1 then goto e
elseif ls_dataobject<>'' then 
	if typeof(dd)=datawindow! then 
		ldw_1=dd
		ldw_1.dataobject=ls_dataobject
	else
		lds_1=dd
		lds_1.dataobject=ls_dataobject
	end if
else
	l_syntax=at_sqlca.syntaxfromsql(as_sql,"style(type=grid) datawindow(units=1 Message.Title='Message' color=67108864 ) Column(Background.Mode=0 background.color=1073741824 ) Text(Background.Mode=0 background.color=67108864 ) ",as_error)
	if len(as_error)>0 then goto e
	if dd.dynamic create(l_syntax,as_error)=-1 then goto e
end if
//messagebox('',l_syntax)
//if ls_settrans='0' then //不设置事务
//else
	dd.dynamic settransobject(at_sqlca)
//end if

return 1

e:
as_error='异常:'+as_error
return -1
end function

public function integer uf_getselected (ref powerobject apo, readonly string as_column, ref string as_values[]);
long l_rows,i
string ls_empty[]

as_values[]=ls_empty[]

l_rows=long(apo.dynamic describe("Evaluate('sum(if(isselected(),1,0))',0)"))

if l_rows=0 then 
	l_rows=0
elseif l_rows=1 then 
	l_rows=apo.dynamic getselectedrow(0)
	as_values[1]=apo.dynamic describe("evaluate('"+as_column+"',"+string(l_rows)+")")
	l_rows=1
elseif l_rows>1 then 
	
	i=apo.dynamic getselectedrow(0)
	do 
		as_values[upperbound(as_values[])+1]=apo.dynamic describe("evaluate('"+as_column+"',"+string(i)+")")
		i=apo.dynamic getselectedrow(i)
	loop  until i=0
	
end if

return l_rows


end function

public function long uf_findalike (readonly datawindow adw, readonly string as_find, long row, readonly long al_startrow);//查找符合条件的行
//adw 数据窗口
//as_find查询条件
//row忽略的行(当前行)
//startrow查询起始行


long l_row
long l_rowcount

if row=0 then return 0
l_rowcount=adw.rowcount()
if al_startrow>l_rowcount then return 0

//检查重复
l_row=adw.find(as_find,al_startrow,l_rowcount)
if l_row=row and l_row<l_rowcount then l_row=adw.find(as_find,l_row + 1,l_rowcount)
if l_row>0 and l_row<>row then return l_row

return 0
end function

public function string addxmltp (powerobject a_dd, string as_head, string as_nodes, string as_eles, string as_encoding);/*增加xml模板,并使用该模板
a_dd:目标dw/ds
as_header:xml的header(如:<?xml version="1.0" encoding="UTF-16LE" standalone="yes"?>)
as_xmltp:要增加模板的节点
as_eles:列对应的元素
as_encoding:编码类型(UTF-8/UTF16LE/UTF16BE/GB2312)
*/
long l_pos1,l_pos2,l_count
int i,li_up
string ls_dsyntax,ls_xml,ls_colname,ls_column[]
string ls_msg,ls_ele,ls_eles[],ls_null[]
string as_tname='runsa'
//string as_head
string ls_end
string ls_data
ls_data=space(10000)
ls_data=''

if pos(as_head,'~~')=0 then
	//转义双引
	replaceex(as_head,'"','~~"')
	//转义单引
	replaceex(as_head,"'",'~~"')
end if

if as_nodes='' or isnull(as_nodes) then as_nodes='runsa,row'

li_up=getarray(as_nodes,ls_eles[],',')

//li_up=upperbound(ls_eles)

for i=1 to li_up
	if i=li_up and i<>1 then
		as_head+='<'+ls_eles[i]+' __pbband=~~"detail~~">'
	else
		as_head+='<'+ls_eles[i]+'>'
	end if
	
	ls_end='</'+ls_eles[i]+'>'+ls_end
next


l_count=long(a_dd.dynamic describe("DataWindow.Export.XML.TemplateCount"))

for i=1 to l_count
	if string(a_dd.dynamic describe("DataWindow.Export.XML.Template["+string(i)+"].Name"))=as_tname then //判断是否存在此模板
		if a_dd.dynamic describe("DataWindow.Export.XML.UseTemplate")<>as_tname then	//如果存在则设置使用该模板
			ls_msg=a_dd.dynamic modify("DataWindow.Export.XML.UseTemplate='"+as_tname+"'")
			if ls_msg<>'' then goto e
			ls_msg=a_dd.dynamic modify("DataWindow.Import.XML.UseTemplate='"+as_tname+"'")
			if ls_msg<>'' then goto e
		end if
		goto e
	end if
next

ls_xml=as_head

//l_count=long(a_dd.dynamic Describe("DataWindow.Column.Count"))	//列数
//
//ls_eles[]=ls_null[]

l_count=getcolumns(a_dd,3,ls_column[])
li_up=getarray(as_eles,ls_eles[],',')
if li_up<=0 then //全部列
	for i=1 to l_count
		ls_xml+="<"+ls_column[i]+">"+ls_column[i]+"</"+ls_column[i]+">"
	next
else //指定节点
	for i=1 to li_up
		ls_xml+="<"+trim(ls_eles[i],true)+">"+ls_column[i]+"</"+trim(ls_eles[i],true)+">"
	next
end if

ls_xml+=ls_end

l_count=a_dd.dynamic rowcount()

if l_count>0 then ls_data=a_dd.dynamic describe("datawindow.data")

ls_dsyntax=a_dd.dynamic describe("datawindow.syntax")

l_pos1=pos(ls_dsyntax,")~r~nimport.xml(")

ls_dsyntax=mid(ls_dsyntax,1,l_pos1 - 1) +&
				' template=(comment="" encoding="'+as_encoding+'" name="'+as_tname+'" xml="'+ls_xml+'")' +&
				mid(ls_dsyntax,l_pos1)

if a_dd.dynamic create(ls_dsyntax,ls_msg)<>1 then goto e

ls_msg=a_dd.dynamic modify("DataWindow.Export.XML.UseTemplate='"+as_tname+"'")
if ls_msg<>'' then goto e

ls_msg=a_dd.dynamic modify("DataWindow.Import.XML.UseTemplate='"+as_tname+"'")
if ls_msg<>'' then goto e

if ls_data>'' then
	if a_dd.dynamic importstring(Text!,ls_data)<>l_count then ls_msg="数据未能成功恢复!"
end if



return ''

e:
return ls_msg

end function

public function string xmlfileimport (datastore a_dd, string as_xmlfile, string as_header, string as_xmltp, string as_eles, string as_encoding);/*xml导入至dw/ds
a_dd:目标dw/ds
as_xmlfile:xml文件路径
as_header:xml的header(如:<?xml version="1.0" encoding="UTF-16LE" standalone="yes"?>)
as_xmltp:要增加模板的节点
as_eles:列对应的元素
as_encoding:编码类型(UTF-8/UTF16LE/UTF16BE/GB2312)
*/

int li_ret
string ls_msg

//设置模板
ls_msg=addxmltp(a_dd,as_header,as_xmltp,as_eles,as_encoding)	
if ls_msg<>'' then goto e

//验证xml
li_ret= XMLParsefile(as_xmlfile,ls_msg)
if li_ret<>0 then 
	ls_msg+='xml验证失败:'+string(li_ret)+'	'+ls_msg
	goto e
end if

//导入xml
li_ret=a_dd.importfile(xml!,as_xmlfile)		

choose case li_ret
	case is>=0 
		ls_msg+=''
	case -1  
		ls_msg+="No rows or startrow value supplied is greater than the number of rows in the file"
	case -2  
		ls_msg+="Empty file"
	case -3  
		ls_msg+="Invalid argument"
	case -4  
		ls_msg+="Invalid input"
	case -5  
		ls_msg+="Could not open the file"
	case -6  
		ls_msg+="Could not close the file"
	case -7  
		ls_msg+="Error reading the text"
	case -8  
		ls_msg+="Unsupported file name suffix (must be *.txt, *.csv, *.dbf or *.xml)"
	case -10  
		ls_msg+="Unsupported dBase file format (not version 2 or 3)"
	case -11  
		ls_msg+="XML Parsing Error; XML parser libraries not found or XML not well formed"
	case -12  
		ls_msg+="XML Template does not exist or does not match the DataWindow"
	case -13  
		ls_msg+=" Unsupported DataWindow style for import"
	case -14  
		ls_msg+=" Error resolving DataWindow nesting"
	case -15  
		ls_msg+=" File size exceeds limit"
end choose

//messagebox('',li_ret)
e:
return ls_msg
end function

public function string xmlfile2db (string as_xmlfile, string as_header, string as_xmltp, string as_eles, string as_encoding, string as_tablename, string as_sql);/*xml保存至数据库
a_dd:目标dw/ds
as_xmlfile:xml文件路径
as_header:xml的header(如:<?xml version="1.0" encoding="UTF-16LE" standalone="yes"?>)
as_xmltp:要增加模板的节点
as_eles:列对应的元素
as_encoding:编码类型(UTF-8/UTF16LE/UTF16BE/GB2312)
as_tablename:要更新至的表
as_sql:创建dw/ds的sql语句,决定了更新表的字段名称
*/

return xmlfile2db(as_xmlfile,as_header,as_xmltp,as_eles,as_encoding,as_tablename,as_sql,'')
end function

public function string xmlfile2db (string as_xmlfile, string as_header, string as_xmltp, string as_eles, string as_encoding, string as_tablename, string as_sql, string as_modify);/*xml保存至数据库
a_dd:目标dw/ds
as_xmlfile:xml文件路径
as_header:xml的header(如:<?xml version="1.0" encoding="UTF-16LE" standalone="yes"?>)
as_xmltp:要增加模板的节点
as_eles:列对应的元素
as_encoding:编码类型(UTF-8/UTF16LE/UTF16BE/GB2312)
as_tablename:要更新至的表
as_sql:创建dw/ds的sql语句,决定了更新表的字段名称
as_fixcolumn:固定值的列名
as_initial:固定值的默认值
*/

string ls_msg//,ls_modify
int li_ret,i,li_count
string ls_fixcols[],ls_inivalues[]

//如果更新的字段和表字段不一样,要在sql中使用as关键字匹配xml元素,as_columns参数要赋值数据表字段1,字段2
//得到数据窗口
ls_msg=getmodify(ids,as_sql,as_tablename,sqlca)	
if ls_msg<>'' then goto e

//if as_fixcolumns<>'' then 
//	ls_fixcols[]=getarray(as_fixcolumns,',',0,0)
//	ls_inivalues[]=getarray(as_initials,',',0,0)
//	li_count=min(upperbound(ls_fixcols[]),upperbound(ls_inivalues[]))
//	for i=1 to li_count
//		ls_modify+=ls_fixcols[i]+'.initial="'+ls_inivalues[i]+'" '
//	next
//	ls_msg=ids.modify(ls_modify)
//	if ls_msg<>'' then goto e
//end if

if as_modify<>'' then 
	ls_msg=ids.modify(as_modify)
	if ls_msg<>'' then 
		ls_msg='Modify:'+ls_msg+' ~r~n'+as_modify
		goto e
	end if
end if


ls_msg=xmlfileimport(ids,as_xmlfile, as_header,as_xmltp,as_eles,as_encoding)
if ls_msg<>'' then goto e

//要更新的事务
li_ret=ids.settransobject(sqlca)		
if li_ret<>1 then 
	ls_msg+="事务设置失败:"+string(li_ret)
	goto e
end if

string ls_ret
//li_ret=ids.update(false,false)
ls_ret=this.uf_update(ids,'batch=50;insert=1;',sqlca)

if ls_ret='' then 	//update 
	commit;
else
	rollback;
	ls_msg+="保存失败:"+ls_ret
end if

e:
return ls_msg
end function

public function string getdisplayval (string ls_values, string ls_dataval);int li_pos1,li_pos2
string ls_ret
li_pos1=pos(ls_values,'~t'+ls_dataval+'/')

if li_pos1>0 then 
	li_pos2=lastpos(ls_values,'/',li_pos1 - 1)
	ls_ret=mid(ls_values,li_pos2 + 1,li_pos1 - li_pos2 - 1)
end if

return ls_ret

end function

public function integer uf_export (dragobject dd, boolean lb_colheading, string ls_separatorcharacter, string ls_quotecharacter, string ls_lineending);string ls_type
string ls_headheight
//1.saveasascii
//2.导出列的data+compute的值
//3.只导出列的data

choose case ls_type
	case 'saveasascii'
		if lb_colheading=true then 
			
			dd.dynamic saveasascii('temp.txt',ls_separatorcharacter,ls_quotecharacter,ls_lineending)
			
		else
			
			ls_headheight=dd.dynamic describe('datawindow.header.height')
			dd.dynamic modify('datawindow.header=0 ')
			
			dd.dynamic saveasascii('temp.txt',ls_separatorcharacter,ls_quotecharacter,ls_lineending)
			
			dd.dynamic modify('datawindow.header='+ls_headheight+' ')
			
		end if 
		
	case 'alldata'
		
		
	case 'columndata'
		
		
		
end choose
	

return 0
end function

public function integer getcolumns (powerobject dd, integer ai_types, ref string ls_column[]);//取出detail中的对象列

string ls_objects1,ls_objects[]
int i,j,li_count
//any as_columns[] //la_columns[1000,2],
string ls_dwsyntax,ls_errtext,ls_empty[]
//dwobject lobj
//int li_count

ls_dwsyntax='release 12;'+&
		+'~r~n table(' &
		+'~r~n column=(type=long name=colx dbname="" )' &
		+'~r~n column=(type=char(32766) name=objname dbname="" )' &
		+'~r~n column=(type=long name=colwidth dbname="" )' &
		+'~r~n )'
		
choose case ai_types
	case 0	//返回object:columns+computes
		ls_column[]=ls_empty[]
		ids_temp.create(ls_dwsyntax,ls_errtext)
		//lobj=ids_temp.object
		
		ls_objects1=dd.dynamic Describe("datawindow.objects") 
		li_count=getarray(ls_objects1,ls_objects[],'~t')
		for i=1 to li_count
			if dd.dynamic describe(ls_objects[i]+".band")='detail' and (dd.dynamic describe(ls_objects[i]+".type")='column' or dd.dynamic describe(ls_objects[i]+".type")='compute' ) then
				j++ 
				ids_temp.insertrow(0) //webservice 必须要先insertrow
				ids_temp.setitem(j,1,dec(dd.dynamic describe(ls_objects[i]+".x")))
				ids_temp.setitem(j,2,dd.dynamic describe(ls_objects[i]+".name"))
				ids_temp.setitem(j,3,dec(dd.dynamic describe(ls_objects[i]+".width")))
			end if
		next
		//la_columns=array2dsort(la_columns,'desc',j)
//		for i=j to 1 step -1
//			ls_column[j - i + 1]=string(lobj.data[i,2])
//		next
		li_count=ids_temp.rowcount()
		if li_count=0 then goto m
		ids_temp.setsort('#1 asc')
		ids_temp.sort()
		ids_temp.setfilter( 'not (objname=objname[-1])')
		ids_temp.filter( )
		ls_column[]=ids_temp.object.#2.primary
		li_count=ids_temp.rowcount()
	
	case 1	//返回object:columns
		ls_column[]=ls_empty[]
		ls_objects1=dd.dynamic Describe("datawindow.table.GridColumns") 
		li_count=getarray(ls_objects1,ls_objects[],'~t')
		j=0
		for i=1 to li_count
			if integer(ls_objects[i])>=1001 then continue;
			j++
			ls_column[j]=string(dd.dynamic describe('#'+ls_objects[i]+'.name'))
		next
		li_count=j
		
	case 2	//返回object:computes
		ls_column[]=ls_empty[]
		ids_temp.create(ls_dwsyntax,ls_errtext)
//		lobj=ids_temp.object
		
		ls_objects1=dd.dynamic Describe("datawindow.objects") 
		li_count=getarray(ls_objects1,ls_objects[],'~t')
		for i=1 to li_count
			if dd.dynamic describe(ls_objects[i]+".band")='detail' and dd.dynamic describe(ls_objects[i]+".type")='compute'  then
				j++ 
				ids_temp.insertrow(0) //webservice 必须要先insertrow
				ids_temp.setitem(j,1,dec(dd.dynamic describe(ls_objects[i]+".x")))
				ids_temp.setitem(j,2,dd.dynamic describe(ls_objects[i]+".name"))
				//lobj.data[j,3]=dec(dd.dynamic describe(ls_objects[i]+".width"))
			end if
		next
		//la_columns=array2dsort(la_columns,'desc',j)
//		for i=j to 1 step -1
//			as_columns[j - i + 1]=string(lobj.data[i,2])
//		next
		li_count=ids_temp.rowcount()
		if li_count=0 then goto m
		ids_temp.setsort('#1 asc')
		ids_temp.sort()
		ls_column[]=ids_temp.object.#2.primary
		li_count=ids_temp.rowcount()
		
	case 3	//返回dbcolumns
		ls_column[]=ls_empty[]
		li_count=integer(dd.dynamic describe("datawindow.column.count"))
		for i=1 to li_count
			ls_column[i]=dd.dynamic describe("#"+string(i)+".name")
		next
	case 4 //列排序
		ids_temp.create(ls_dwsyntax,ls_errtext)
//		lobj=ids_temp.object
		
		li_count=upperbound(ls_column[])
		for i=1 to li_count
			ids_temp.insertrow(0)
			ids_temp.setitem(i,1,dec(dd.dynamic describe(ls_column[i]+".x")))
			ids_temp.setitem(i,2,dd.dynamic describe(ls_column[i]+".name"))
			//lobj.data[j,3]=dec(dd.dynamic describe(ls_column[i]+".width"))
		next
		li_count=ids_temp.rowcount()
		if li_count=0 then goto m
		ids_temp.setsort('#1 asc')
		ids_temp.sort()
		ls_column[]=ids_temp.object.#2.primary
		
	case 5 //返回可编辑的列
		ls_column[]=ls_empty[]
		ls_objects1=dd.dynamic Describe("datawindow.table.GridColumns") 
		li_count=getarray(ls_objects1,ls_objects[],'~t')
		j=0
		for i=1 to li_count
			if integer(ls_objects[i])>=1001 then continue;
			if string(dd.dynamic describe('#'+ls_objects[i]+'.TabSequence'))='0' or string(dd.dynamic describe('#'+ls_objects[i]+'.Protect'))='1' then continue;
			j++
			ls_column[j]=string(dd.dynamic describe('#'+ls_objects[i]+'.name'))
		next
		li_count=j
		
	case 6 //返回隐藏的列+计算列
		ls_column[]=ls_empty[]
		ids_temp.create(ls_dwsyntax,ls_errtext)
//		lobj=ids_temp.object
		
		ls_objects1=dd.dynamic Describe("datawindow.objects") 
		li_count=getarray(ls_objects1,ls_objects[],'~t')
		for i=1 to li_count
			if dd.dynamic describe(ls_objects[i]+".band")<>'detail' then continue; 
			if (dd.dynamic describe(ls_objects[i]+".type")<>'column' and dd.dynamic describe(ls_objects[i]+".type")<>'compute' ) then continue;
			if dd.dynamic describe(ls_objects[i]+".visible")='1' then continue; //只返回隐藏的列
			j++ 
			ids_temp.insertrow(0)
			ids_temp.setitem(j,1,dec(dd.dynamic describe(ls_objects[i]+".x")))
			ids_temp.setitem(j,2,dd.dynamic describe(ls_objects[i]+".name"))
			ids_temp.setitem(j,3,dec(dd.dynamic describe(ls_objects[i]+".width")))
		next
		//la_columns=array2dsort(la_columns,'desc',j)
//		for i=j to 1 step -1
//			ls_column[j - i + 1]=string(lobj.data[i,2])
//		next
		li_count=ids_temp.rowcount()
		if li_count=0 then goto m
		ids_temp.setsort('#1 asc')
		ids_temp.sort()
		ls_column[]=ids_temp.object.#2.primary
end choose 
	
goto m
m:
return li_count
end function

public subroutine uf_example ();is_listname[]={'root','产品信息','row','条码信息','颜色信息','1:row'}

is_nodename[1]='产品信息' 
is_nodename[2]='产品货号,产品名称=,条码信息,产品价格,尺寸类型,1:row,' //1:row不同节点相同节点名
is_nodename[3]='type=,row' //type=跟在节点内的属性值 
is_nodename[4]='type=,颜色代号=,颜色信息,尺寸代号,条码,'
is_nodename[5]='颜色名称,'
is_nodename[6]='颜色代号,颜色信息'

is_fieldname[1]=',' //空字符串表示列表
is_fieldname[2]="colthno,~"co~~lthname~",,sprice,sizekind,," //字段
is_fieldname[3]="~"list~",,"
is_fieldname[4]="~"list~",color,,size,words," //单/双引的字符串,也支持数字
is_fieldname[5]='color_name'
is_fieldname[6]='color,string(today(),"YYYY-MM-DD hh:mm:ss"),' //dw表达式

is_listsql[1]=""
is_listsql[2]="select colthno,colthname,sprice,sizekind from coloth_t where colthno like '%ALL%' order by colthno"
is_listsql[3]=""
is_listsql[4]="select colthno,color=substring(color_nos,1,3),size=substring(color_nos,5,10),words from coloth_easy where colthno like '%ALL%' order by colthno,color,size,words"
is_listsql[5]="select color=color_no,color_name from gg_color order by color_no "
is_listsql[6]="select distinct colthno,color=substring(color_nos,1,3) from coloth_easy where colthno like '%ALL%' order by colthno,color"

is_keystring[1]=''
is_keystring[2]=''
is_keystring[3]=''
is_keystring[4]='colthno'
is_keystring[5]='color'
is_keystring[6]='colthno'

string ls_text
string ls_ret
ls_ret=uf_xmlout(ls_text)

if ls_ret<>'' then 
	messagebox('',ls_ret)
else
	clipboard(ls_text)
	messagebox('','已复制到剪切板!')
end if

end subroutine

public function string getattribstring (ref string as_columns[], string attrib, string as_values);
//得到设置数据窗口对象属性的字符串
//参数:1列名,{列名2,{...}}
//2:属性名 
//3.属性值

string ls_string
int i,l_cols,li_order

l_cols=upperbound(as_columns[])

attrib=lower(trim(string(attrib,'')))

choose case attrib
	case 'update','updatewhereclause','key','edit.focusrectangle','edit.displayonly'
		if as_values='1' then 
			as_values='yes'
		elseif as_values='0' then 
			as_values='no'
		end if
		for i=1 to l_cols
			if as_columns[i]='' then continue;
			ls_string+=as_columns[i]+'.'+attrib+'='+as_values+' '
		next
	case 'tabsequence'
		for i=1 to l_cols
			if as_columns[i]='' then continue;
			if as_values<>'0' then 
				li_order=li_order + 10
				as_values=string(li_order)
			else
				as_values='0'
			end if
			ls_string+=as_columns[i]+'.'+attrib+'='+as_values+' '
		next
//	case 'protect'
//		for i=1 to l_cols
//			if as_columns[i]='' then continue;
//			ls_string+=as_columns[i]+'.'+attrib+'='+as_values+' '
//		next
	case else
		for i=1 to l_cols
			if as_columns[i]='' then continue;
			ls_string+=as_columns[i]+'.'+attrib+'="'+as_values+'" '
		next
end choose
//messagebox('get',ls_string)
return ls_string
end function

public function string setattribs (powerobject dd, ref string as_columns[], string attrib, string as_values);
//得到设置数据窗口对象属性的字符串
//参数:1列名,{列名2,{...}}
//2:属性名 
//3.true/false

string ls_string
int i,l_cols
long l_pos
string ls_errtext

l_cols=upperbound(as_columns[])

if (attrib='visible' and as_values='1') or attrib='x' then
	for i=1 to l_cols
		if as_columns[i]='' then continue;
		ls_string=as_columns[i]+'.'+attrib+'='+as_values
		ls_errtext+=dd.dynamic modify(ls_string)
	next
else
	ls_string=getattribstring(as_columns[],attrib,as_values)
	if ((attrib='tabsequence' and as_values='0') or (attrib='protect' and as_values='1')) and dd.dynamic getcolumn()>0 then //防止触发多个itemfocuschanged事件,将当前列放在最后一个
		l_pos=pos(ls_string,'#'+string(dd.dynamic getcolumn()))
		if l_pos=0 then l_pos=pos(ls_string,string(dd.dynamic getcolumnname()))
		if l_pos>0 then 
			ls_string=left(ls_string,l_pos - 1) + mid(ls_string,pos(ls_string,' ',l_pos + 1) + 1) + mid(ls_string,l_pos,pos(ls_string,' ',l_pos + 1) - l_pos + 1)
		end if
	end if
	
	ls_errtext=dd.dynamic modify(ls_string)
end if

return ls_errtext
end function

public function integer uf_xmlout_destroy ();
int i
long l_count

l_count=min(i_listcount,upperbound(ids_list[]))
//销毁数据窗口
for i=1 to l_count
	if not isvalid(ids_list[i]) then continue;
	if ib_dsbuild[i] then 
		destroy ids_list[i] //只销毁自动创建的
	else
		ids_list[i]=ds_valid //断开原引用
	end if
next
ids_list={ds_valid}
destroy ids_nodes
destroy ids_fields
destroy ids_wherekeys
destroy ids_keyparent
destroy ds_valid

ib_dsbuild[]={false} //不能用setnull,否则不能重新使用
ib_dsempty[]={true}
is_listname[]={''}
is_listsql[]={''}
is_nodename[]={''}
is_fieldname[]={''}
is_keystring[]={''}
i_listcount=0
i_nodecount[]={0}
i_keycount[]={0}
i_listparent[]={0}

//fileclose(i_tempfile)

return 0

end function

public function string uf_xmlout (ref string ls_text);//create+append+destroy 
return uf_xmlout(ref ls_text,true,true)
end function

public function integer uf_xmlout_create (ref string ls_errtext);
int i,j,li_upbound,li_temparray[]
string ls_dwsyntax,ls_ret
string ls_array[],ls_empty[]
dwobject ldwo
datastore lds_temp
boolean lb_created

//先清除上次构造
if i_listcount<>0 then 
	ls_errtext='必须先释放上次的XML模板!'
	goto e
	//uf_xmlout_destroy()
end if

//初始化逻辑结构
i_listcount=upperbound(is_listname[])
ib_dsbuild[i_listcount]=false //初始化为非创建
ib_dsempty[i_listcount]=false //初始化为非空
i_keycount[i_listcount]=0

if upperbound(is_listsql[])<>i_listcount then ls_errtext+='列表个数('+string(i_listcount)+')与SQL个数('+string(upperbound(is_listsql[]))+')不一致!~r~n'
if upperbound(is_nodename[])<>i_listcount then ls_errtext+='列表个数('+string(i_listcount)+')与Node列表个数('+string(upperbound(is_nodename[]))+')不一致!~r~n'
if upperbound(is_fieldname[])<>i_listcount then ls_errtext+='列表个数('+string(i_listcount)+')与Field列表个数('+string(upperbound(is_fieldname[]))+')不一致!~r~n'
if upperbound(is_keystring[])<>i_listcount then ls_errtext+='列表个数('+string(i_listcount)+')与Key列表个数('+string(upperbound(is_keystring[]))+')不一致!~r~n'

lb_created=true 
//创建数据窗口
for i=1 to i_listcount
	if upperbound(ids_list[])>=i then //防止数组越界
		if isvalid(ids_list[i]) then 
			if ids_list[i].describe('datawindow.name')<>'' then continue;
		end if
	end if
	
	if is_listsql[i]='' then 
		if isvalid(ds_valid)=false then 
			ds_valid=create datastore
			if ds_valid.create("release 12;table(column=(type=long name=a dbname=~"~" ))",ls_ret)=-1 then 
				ls_errtext+='ds_valid.create:'+ls_ret
				goto e
			end if
			//ds_valid.insertrow(0) //默认的ds 移到xmlout函数里
		end if
		ids_list[i]=ds_valid
	else
		ids_list[i]=create datastore
		ib_dsbuild[i]=true
		ls_ret=getquery(ids_list[i],is_listsql[i])
		if ls_ret<>'' then 
			ls_errtext+=ls_ret
			goto e
		end if
	end if
next

string ls_dwsyntax_number
ls_dwsyntax='release 12;'
ls_dwsyntax+='table('
ls_dwsyntax_number=ls_dwsyntax
for i=1 to i_listcount
	ls_dwsyntax+='~r~n column=(type=char(32766) name=col'+string(i)+' dbname="col'+string(i)+'" )'
	ls_dwsyntax_number+='~r~n column=(type=long name=col'+string(i)+' dbname="col'+string(i)+'" )'
next
ls_dwsyntax+=')'
ls_dwsyntax_number+=')'

ids_nodes=create datastore
if ids_nodes.create(ls_dwsyntax,ls_ret)=-1 then 
	ls_errtext='ids_nodes.Create : '+ls_ret
	goto e
end if

ids_fields=create datastore
if ids_fields.create(ls_dwsyntax,ls_ret)=-1 then 
	ls_errtext+='ds_fields.Create : '+ls_ret
	goto e
end if

ids_wherekeys=create datastore
if ids_wherekeys.create(ls_dwsyntax,ls_ret)=-1 then 
	ls_errtext+='ds_wherekeys.Create : '+ls_ret
	goto e
end if

ids_keyparent=create datastore
if ids_keyparent.create(ls_dwsyntax_number,ls_ret)=-1 then 
	ls_errtext+='ds_keyparent.Create : '+ls_ret
	goto e
end if

long m,l_findrow
for i=1 to i_listcount
	
	//获取取上级listID
	if i=1 then 
		i_listparent[i]=1
	else
		i_listparent[i]=0
		for m=i - 1 to 1 step -1
			l_findrow=ids_nodes.find("col"+string(m)+"='"+is_listname[i]+"' ",1,i_nodecount[m])
			if l_findrow>0 then 
				if string(ids_fields.getitemstring(l_findrow,m),'')='' then 
					i_listparent[i]=m
					exit
				end if
			end if
		next
	end if
	
	//节点
	ls_array[]=ls_empty[]
	i_nodecount[i]=getarray(is_nodename[i],ls_array[],',')
	
	if i_nodecount[i]>0 then 
		ldwo=ids_nodes.object.__get_attribute('#'+string(i),false)
		ldwo.primary=ls_array[]
	end if
	
	//对应字段
	ls_array[]=ls_empty[]
	li_upbound=getarray(is_fieldname[i],ls_array[],',',2)  //支持括号包含的表达式:(expression)
	if li_upbound<>i_nodecount[i] then ls_errtext+=is_listname[i]+' : Node个数('+string(i_nodecount[i])+')与Field个数('+string(li_upbound)+')不一致!~r~n'
	if li_upbound>0 then 
		
		for j=1 to li_upbound
			if ls_array[j]='' then continue;
			if isvalid(ids_list[i])=false then 
				lds_temp=ds_valid
			else
				lds_temp=ids_list[i]
			end if
			
			replaceex(ls_array[j],"'","~~'")
			replaceex(ls_array[j],'"','~~"')
			
			if lds_temp.describe("Evaluate('"+ls_array[j]+"',0)")='!' then
				ls_errtext+=is_listname[i]+' : '+ls_array[j]+' 无效表达式!~r~n'
			end if
		next
		
		ldwo=ids_fields.object.__get_attribute('#'+string(i),false)
		ldwo.primary=ls_array[]
	end if
	
	//where条件的字段
	i_keycount[i]=0
    	ls_array[]=ls_empty[]
	li_upbound=getarray(is_keystring[i],ls_array[],',')
	for j=1 to li_upbound //字段检查
		if ls_array[j]='' then continue; //忽略空key
		if isnumber(ls_array[j]) then continue; //忽略常量key
		i_keycount[i]++
		if isvalid(ids_list[i])=false then 
			lds_temp=ds_valid
		else
			lds_temp=ids_list[i]
		end if
		
		replaceex(ls_array[j],"'","~~'")
		replaceex(ls_array[j],'"','~~"')
		
		if lds_temp.describe("Evaluate('"+ls_array[j]+"',0)")='!' then
			ls_errtext+=is_listname[i]+'.'+ls_array[j]+' 键值无效!~r~n'
		end if
		
		int li_prilevel=0
		li_prilevel=0
		m=i
		l_findrow=0
		do
			li_prilevel++ //上级层数
			m=i_listparent[m]
			//查找是否存在key
			//l_findrow=ids_fields.find("#"+string(m)+"='"+ls_array[j]+"' ",1,i_nodecount[m])
			if ids_list[m].describe(ls_array[j]+".name")=ls_array[j] then //
				l_findrow=1
			end if
		loop until l_findrow>0 or m<=1
		
		if l_findrow<=0 then 
			ls_errtext+=is_listname[i]+'.'+ls_array[j]+' 未找到主键值!~r~n'
			goto e
		end if
		
//		li_temparray[j]=li_prilevel
		if ids_wherekeys.rowcount()<i_keycount[i] then ids_wherekeys.insertrow(0) //appendrow
		if ids_keyparent.rowcount()<i_keycount[i] then ids_keyparent.insertrow(0) //appendrow
		ids_wherekeys.setitem(i_keycount[i],i,ls_array[j])
		ids_keyparent.setitem(i_keycount[i],i,li_prilevel)
	next
	//i_keycount[i]=li_upbound
//	ldwo=ids_wherekeys.object.__get_attribute('#'+string(i),false)
//	ldwo.primary=ls_array[]
//	
//	ldwo=ids_keyparent.object.__get_attribute('#'+string(i),false)
//	ldwo.primary=li_temparray[]
	
next

if ls_errtext<>'' then goto e

//准备数据
for i=1 to i_listcount
	if is_listsql[i]='' then continue;
	ids_list[i].settransobject(sqlca)
	if ids_list[i].rowcount()<=0 then 
		if ids_list[i].GetSQLSelect ( )<>'' then 
			if ids_list[i].retrieve()=-1 then 
				ls_errtext+='数据集'+string(i)+'检索失败!'
				goto e
			end if
		end if
	end if
next


//i_tempfile=fileopen("xmlappend.txt",textMode!,write!,shared!,Replace!)

return 0

e:
if lb_created=true then uf_xmlout_destroy()
return -1
end function

public subroutine uf_example2 ();is_listname[]={'产品信息','row'}

is_nodename[1]='row'
is_nodename[2]='产品货号,产品名称=,产品价格,尺寸类型,'

is_fieldname[1]=','
is_fieldname[2]="colthno,colthname,sprice,sizekind,"

is_listsql[1]=''
is_listsql[2]="select colthno,colthname,sprice,sizekind from coloth_t where colthno like '%ANTA%' order by colthno"

is_keystring[1]=''
is_keystring[2]='colthno'

string ls_text[]
string ls_ret
ls_ret=uf_xmlout(ls_text,true)

if ls_ret<>'' then 
	messagebox('',ls_ret)
else
	//clipboard(ls_text)
	messagebox('',upperbound(ls_text))
	messagebox('','已复制到剪切板!')
end if

end subroutine

public function string uf_xmlout (ref string ls_text[], boolean lb_destroy);string ls_errtext,ls_ret
long l_row,l_rowcount
int i,li_mainlistindex

if uf_xmlout_create(ls_errtext)=-1 then goto e

ls_errtext=uf_xmlout(ls_text[])
if ls_errtext<>'' then goto e

if lb_destroy=true then 
	//销毁数据窗口
	uf_xmlout_destroy()
end if

return ''

e:
return ls_errtext
end function

public function long uf_selectedtext (powerobject dd, ref string ls_text);string ls_pos
ls_pos=dd.dynamic describe("datawindow.selected")
if ls_pos='' then 
	ls_text=dd.dynamic selectedtext()
else
	ls_text=dd.dynamic describe("DataWindow.Selected.Data")
end if
//暂时只用
return len(ls_text)


//作用:分析数据窗口选中的矩形 ,并返回数据
//powerobject dd:datawindow/datastore
//返回值:选中的数据

string ls_errtext,ls_expression,ls_expression2
string ls_string,ls_row2,ls_colname,ls_cols[],ls_lookups[]
long l_selectrowcount,i,m,l_row_start,l_row_end
int li_selecthcount,li_count_cols

//得到所有列(按顺序)
ls_cols[]=getcolumns(dd,0)
li_count_cols=upperbound(ls_cols[])

for i=1 to li_count_cols
	if dd.dynamic describe(ls_cols[i]+".type")='column' then 
		ls_lookups[i]="LookUpDisplay("+ls_cols[i]+")"
	else	//计算列
		ls_lookups[i]="if(isnull("+ls_cols[i]+"),~"~","+"string("+ls_cols[i]+"))"	//避免null
	end if
next
	
//拼接整行数据表达式 ~t=char(9)
if li_count_cols>=1 then 
	ls_expression=ls_lookups[1]
end if

for i=2 to li_count_cols
	ls_expression+=" + ~"	~" + "+ls_lookups[i]
next

//提取选中信息
ls_errtext=uf_getdwselected(dd)
if ls_errtext<>'' then goto e
//messagebox('',ids.rowcount())
if ids.rowcount()=0 then goto e

//取选中的行数
l_selectrowcount=long(ids.describe("evaluate('count(rows for all DISTINCT)',0) "))

for i=1 to l_selectrowcount
	
	if i>1 then ls_string+='~r~n'
	
	//取最小行号的记录
	ls_row2=ids.describe("evaluate('small(rows,rows,"+string(i)+" for all DISTINCT)',0) ")
	//起始记录
	l_row_start=ids.find("rows="+ls_row2,1,ids.rowcount())
	
	if string(ids.object.colname[l_row_start],'')='' then //行选中
		ls_expression2=ls_expression
	else
		
		//本行选中单元格数
		li_selecthcount=integer(ids.describe("evaluate('sum(if(rows="+ls_row2+",1,0))',0) "))
		//结束记录
		l_row_end=l_row_start + li_selecthcount - 1
		
		//逐行提取
		for m=l_row_start to l_row_end
			
			ls_colname=string(ids.object.colname[m],'')		
			
			if dd.dynamic describe(ls_colname+".type")='column' then 
				if m=l_row_start then 
					ls_expression2="LookUpDisplay ("+ls_colname+")"
				else
					ls_expression2+=" + ~"	~" + LookUpDisplay ("+ls_colname+")"
				end if
			else	//计算列
				if m=l_row_start then 
					ls_expression2="if(isnull("+ls_colname+"),~"~","+"string("+ls_colname+"))"
				else
					ls_expression2+=" + ~"	~" + if(isnull("+ls_colname+"),~"~","+"string("+ls_colname+"))"//避免null
				end if
			end if
	
		next
	end if

	ls_string+=dd.dynamic describe("evaluate('"+ls_expression2+"',"+ls_row2+") ")
	
next

e:
return len(ls_string)


end function

public function string uf_import_bak (powerobject dd, ref string ls_inputcols, long al_row, string as_column, string as_text);//作用:分析数据窗口选中的矩形 ,并粘贴数据
//powerobject dd:datawindow/datastore
//string as_text:要粘贴的字符
//返回''为成功,否则为失败信息

string ls_errtext
string ls_rowstring[],ls_text[],ls_cols[]
long l_row,l_rowcount
int i,m,n,li_ret,li_colno_start,li_colno
int li_hcount,li_texthcount,li_selecthcount	/*横排列数*/,li_count_col
long l_textrowcount //剪切板文本行数
long l_selectrowcount //选中行数
string ls_colname,ls_gridcolumns,ls_colid

//默认为新行
if al_row<=0 or al_row>dd.dynamic rowcount() then al_row=dd.dynamic rowcount() + 1

//默认为第一列
if as_column<>'' then 
	ls_colname=dd.dynamic describe(as_column+".name")
end if
if as_column='' or ls_colname='!' then li_colno_start=1

//取列顺序
if ls_inputcols='' then 
	li_count_col=getcolumns(dd,5,ls_cols[])
else
	li_count_col=getarray(ls_inputcols,ls_cols[],',')
	//messagebox('',li_count_col)
	li_count_col=getcolumns(dd,4,ls_cols[]) //列排序
	
	
end if
if li_count_col=0 then goto e

for i=1 to li_count_col
	if ls_cols[i]=ls_colname then li_colno_start=i
	if dd.dynamic describe(ls_cols[i]+'.type')<>'column' then 
		ls_cols[i]=''
		continue;
	end if
//	if integer(dd.dynamic describe(ls_cols[i]+'.TabSequence'))=0 then //
//		ls_cols[i]=''
//		continue;
//	end if
next

l_textrowcount=getarray(as_text,ls_rowstring[],'~r~n')
//l_textrowcount=replaceex(as_text,'~n','~n')
//l_textrowcount=upperbound(ls_rowstring[])
if l_textrowcount=0 then goto e
//goto e
//dd.dynamic setredraw(false)

l_row=al_row - 1

for i=1 to l_textrowcount
	
	if ls_rowstring[i]='' then continue;
	
	l_row++
	if l_row>dd.dynamic rowcount() then 
		l_row=dd.dynamic insertrow(0)
	end if
	
	li_texthcount=getarray(ls_rowstring[i],ls_text[],'~t',1)
	//li_texthcount=upperbound(ls_text[])
	
	//取横排小的数量
	li_hcount=min(li_count_col - li_colno_start + 1,li_texthcount)
	
	//逐个填充
	for m=1 to li_hcount
		
		li_colno=li_colno_start + m - 1
		
		if ls_cols[li_colno]='' then continue;	//忽略compute
		if uf_getmodifiable(dd,l_row,ls_cols[li_colno])=false then continue;	//忽略不可修改的单元格
		
		li_ret=uf_settext(dd,l_row,ls_cols[li_colno],ls_text[m])
	
		if li_ret=1 then li_ret=dd.dynamic accepttext()
		
		if li_ret=-1 then 
			ls_errtext+=string(l_row)+"/"+ls_cols[m]+"~r~n"
			goto e
		end if
		
	next
	
next

if ls_errtext<>'' then ls_errtext+='设置失败!'

e:
//dd.dynamic setredraw(true)
return ls_errtext
//

end function

public function integer replaceex (ref string ls_text, character as_str1[], character as_str2[]);//字符串替换函数
//参数1:引用变量,操作的字符串
//参数2:要替换的字符
//参数3:目标字符
//返回值:替换成功的数目

long li_pos,i,l_len,l_index
int li_len1,li_len2,li_matchindex=1 /*查找位置*/
char lc_char[]
li_len1=upperbound(as_str1[])
li_len2=upperbound(as_str2[])

if li_len1=li_len2 then //等长,则使用char[]查找法
	lc_char[]=ls_text
	l_len=upperbound(lc_char[])
	li_matchindex=1
	if as_str1[]=as_str2[] then //字符串相等,则只查找个数
		for l_index=1 to l_len
			if lc_char[l_index]=as_str1[li_matchindex] then 
				if li_len1=li_matchindex then 
					i++
				else
					li_matchindex++
					continue;
				end if
			end if 
			if li_matchindex>1 then l_index=l_index - li_matchindex + 1
			li_matchindex=1
		next
	else //替换
		for l_index=1 to l_len
			if lc_char[l_index]=as_str1[li_matchindex] then 
				if li_len1=li_matchindex then 
					for li_matchindex=li_matchindex - 1 to 0 step -1
						lc_char[l_index - li_matchindex]=as_str2[li_len1 - li_matchindex]
					next
					i++
				else
					li_matchindex++
					continue;
				end if
			end if 
			if li_matchindex>1 then l_index=l_index - li_matchindex + 1
			li_matchindex=1
		next
		ls_text=lc_char[] //保存替换结果
	end if
	
else //非等长替换,效率低
	li_pos=Pos(ls_text,as_str1,1)
	//替换
	do while(li_pos>0)
		i++
		ls_text=Replace(ls_text,li_pos,li_len1,as_str2)
		li_pos=Pos(ls_text,as_str1,li_pos + li_len2 )
	loop
end if


////如果是一个字符,则使用char数组进行查找/替换
//if li_len1=1 and li_len2=1 then 
//	lc_char[]=ls_text
//	l_len=upperbound(lc_char[])
//	if as_str1=as_str2 then //不是替换,而是查找个数
//		for l_index=1 to l_len
//			if lc_char[l_index]=as_str1[l_index] then i++
//		next
//	else	//替换
//		for l_index=1 to l_len
//			if lc_char[l_index]=as_str1 then 
//				i++
//				lc_char[l_index]=as_str2
//			end if
//		next
//		ls_text=lc_char[]
//	end if
//	
//else
//	li_pos=Pos(ls_text,as_str1,1)
//	if as_str1=as_str2 then //不是替换,而是查找个数
//		do while(li_pos>0)
//			i++
//			li_pos=Pos(ls_text,as_str1,li_pos + li_len2  )
//		loop
//	else	//替换
//		do while(li_pos>0)
//			i++
//			ls_text=Replace(ls_text,li_pos,li_len1,as_str2)
//			li_pos=Pos(ls_text,as_str1,li_pos + li_len2 )
//		loop
//	end if
//end if
//messagebox('',i)
return i
end function

public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[]);//得到分隔符分开后的数组
//参数1:要分隔的字符串
//参数2:输出分开后的数组
//参数3:分隔符
//返回数组的上限数
return getarray(as_text,ls_ret[],as_sep[],0)
end function

public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[], readonly integer li_option);//得到分隔符分开后的数组
//参数1:要分隔的字符串
//参数2:输出分开后的数组
//参数3:分隔符
//返回数组的上限数
//li_option 1:严格要求不以分隔符结束 0:取到无内容为止 2:表达式分析(支持非",',(,) 分隔的表达式 )
//ls_ret[] 引用,不能清空(用于默认值,getquery引用),根据返回值确定个数

char lc_text[]
long i,l_len,l_index

int li_seplen,li_matchindex=1 /*正在匹配索引*/
long l_lastmatchindex=0 //最后一次全匹配成功的位置

long l_newindex,l_newlen
char lc_newchar[]
char ls_temp,ls_quot
long l_explevel

li_seplen=upperbound(as_sep[])
lc_text[]=as_text
l_len=upperbound(lc_text[])
li_matchindex=1 //先匹配首个字符

for l_index=1 to l_len //逐个匹配
	if li_option=2 then 
		ls_temp=lc_text[l_index]
		if ls_temp="'" or ls_temp='"' then //2
			if ls_quot='' then //3
				ls_quot=ls_temp
			elseif ls_quot=ls_temp then //3
				ls_quot=''
			end if //3
			goto nx
		end if //2
		if ls_quot<>'' then goto nx
		if ls_temp='('  then 
			l_explevel++
			goto nx
		end if
		if ls_temp=')' then 
			if l_explevel=0 then 
				messagebox('','缺少左( ,位置:'+string(l_index))
			else
				l_explevel=l_explevel - 1
			end if
			goto nx
			//if l_explevel=0 then goto nex
		end if
		
		if l_explevel>0 then goto nx
	end if
	
	if lc_text[l_index]=as_sep[li_matchindex] then //是否匹配
		if li_seplen=li_matchindex then //全匹配
			//lastgroup:
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
	nx:
next
if l_lastmatchindex<l_len then //goto lastgroup
	lc_newchar[]=''
	l_newlen=l_len - l_lastmatchindex //需要截取的长度
	for l_newindex=1 to l_newlen
		lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
	next
	l_lastmatchindex=l_index //记录最后一次全匹配成功的位置
	i++
	ls_ret[i]=lc_newchar[] //
end if

if li_option=2 then 
	if ls_quot<>'' then 
		messagebox('','缺少右'+ls_quot)
	elseif l_explevel>0 then 
		messagebox('','缺少右'+')')
	end if
end if

//要求不以分隔符结尾
if li_option=1 and l_lastmatchindex=l_len then 
	i++
	ls_ret[i]=''
end if

return i


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
//if li_option=1 or l_len>=li_startpos then 
//	i++
//	ls_ret[i]=mid(as_text,li_startpos)
//end if
//
//return i
end function

public function string uf_grid2free (datawindow dw_1);string ls_column[]
long i,l_width,l_count
string ls_modify,ls_syntax,ls_errtext
blob lb_fullstate

ls_syntax=dw_1.describe('datawindow.syntax')
if replaceex(ls_syntax,'processing=1','processing=0')=0 then goto m

l_count=uf_getobjects(dw_1,'band',ls_column[])

for i=1 to l_count
	l_width=long(dw_1.describe(ls_column[i]+'.width')) + 1
	ls_modify+=ls_column[i]+".width="+string(l_width)+" "
next

dw_1.getfullstate(lb_fullstate)
ids_temp.setfullstate(lb_fullstate)

dw_1.create (ls_syntax,ls_errtext)
if ls_errtext<>'' then goto e

ls_errtext=dw_1.modify(ls_modify)
if ls_errtext<>'' then goto e
messagebox('',ids_temp.rowcount())
ids_temp.rowsmove(1,ids_temp.rowcount(),primary!, dw_1,1,primary!)

ids_temp.dataobject=''

goto m
m:
return ''

goto e
e:
return ''
end function

public function integer uf_getobjects (powerobject dd, string ls_band, ref string ls_column[]);//取出detail中的对象列

string ls_objects1,ls_objects[]
int i,j,li_count
//any as_columns[] //la_columns[1000,2],
string ls_dwsyntax,ls_errtext,ls_empty[]
//dwobject lobj
string ls_band_temp

ls_dwsyntax='release 12;'+&
		+'~r~n table(' &
		+'~r~n column=(type=long name=colx dbname="" )' &
		+'~r~n column=(type=char(32766) name=objname dbname="" )' &
		+'~r~n column=(type=long name=colwidth dbname="" )' &
		+'~r~n )'
		
ids_temp.create(ls_dwsyntax,ls_errtext)
//lobj=ids_temp.object

ls_objects1=dd.dynamic Describe("datawindow.objects") 
li_count=getarray(ls_objects1,ls_objects[],'~t')

if ls_band='' then 
	ls_column[]=ls_objects[]
elseif ls_band='band' then 
	for i=1 to li_count
		ls_band_temp=dd.dynamic describe(ls_objects[i]+".band")
		if ls_band_temp<>'?' and ls_band_temp<>'background' and ls_band_temp<>'foreground' then
			j++ 
			ids_temp.insertrow(0)
			ids_temp.setitem(j,2,ls_objects[i])
		end if
	next

	li_count=ids_temp.rowcount()
	
	if li_count>0 then 
		ls_column[]=ids_temp.object.objname.primary
	end if
else
	for i=1 to li_count
		ls_band_temp=dd.dynamic describe(ls_objects[i]+".band")
		if ls_band_temp=ls_band then
			j++ 
			ids_temp.insertrow(0)
			ids_temp.setitem(j,2,ls_objects[i])
		end if
	next

	li_count=ids_temp.rowcount()
	
	if li_count>0 then 
		ls_column[]=ids_temp.object.objname.primary
	end if
end if

return li_count
end function

public function integer uf_sql_alias (character ls_sql[], ref string ls_dbname, ref string ls_alias);return 0
////解析select语句的字段及别名
////string ls_exp[]
////ls_exp[1]='1    a'
////ls_exp[2]='2 as b'
////ls_exp[3]="3 as ')c'"
////ls_exp[4]="'d'=4"
////ls_exp[5]='no_s=t1.nos'
////ls_exp[6]="postdate='a' + 'convert(date,''+t1.postdate)'"
////ls_exp[7]='storecusname=(select names from warehouse t11 where t11.cusno=t1.storecusno)'
//
//long l_index,l_length
//string ls_words[]
//long i,l_explevel
//string ls_temp,ls_text,ls_singleword //,ls_alias,ls_dbname
//string ls_quot,ls_pfillchar,ls_pchar,ls_unitext
////char ls_sql[]
////ls_sql[]=ls_exp[7]
//ls_dbname=''
//ls_alias=''
//l_length=upperbound(ls_sql[])
//i++
//ls_words[i]=''
//for l_index=1 to l_length
//	ls_temp=ls_sql[l_index]
//	
//	if ls_temp="'" or ls_temp='"' then 
//		if ls_quot='' then 
//			ls_quot=ls_temp
//		elseif ls_quot=ls_temp then 
//			ls_quot=''
//		end if
//		goto append
//	end if
//	
//	if ls_quot<>'' then 
//		goto append
//	end if
//	
//	if ls_temp='('  then 
//		l_explevel++
//		goto append
//	end if
//	if ls_temp=')' then 
//		if l_explevel=0 then 
//			messagebox('','缺少左括号:'+string(l_index))
//			return -1
//		end if
//		l_explevel=l_explevel - 1
//		goto append
//		//if l_explevel=0 then goto nex
//	end if
//	
//	if l_explevel>0 then 
//		goto append
//	end if
//	
//	if ls_temp='=' then 
//		ls_alias=ls_singleword
//		ls_dbname=mid(ls_sql[],l_index+1)
//		exit
//	end if
//	
//	//首个字符
//	if ls_pfillchar='' then goto append
//	//前一个为非空字符相连的非空字符
//	if ls_pchar<>' ' and ls_temp<>' ' then goto append
//	//其它空字符相加
//	if ls_temp=' ' or ls_temp='~r' or ls_temp='~n' or ls_temp='~t' then goto append
//	
//	//非空字符
//	choose case ls_pfillchar
//		case '+','-','*','/' //计算符
//			goto append
//		case else
//			choose case ls_temp
//				case '+','-','*','/' //计算符
//					goto append
//				case else
//					if ls_dbname='' then 
//						ls_dbname=ls_singleword
//					else
//						if ls_singleword='as' then 
//							ls_alias=mid(ls_sql[],l_index)
//							exit
//						end if
//					end if
//					
//					//重新组词
//					ls_singleword=ls_temp
//					ls_pfillchar=ls_temp
//					ls_pchar=ls_temp
//					ls_unitext=''
//					continue;
//			end choose
//			
//	end choose
//	
//	goto append
//	append:
//	if ls_singleword<>'' and isnumber(ls_singleword) and match(ls_temp,'[_A-Za-z]')=true then 
//		ls_dbname=ls_singleword
//		ls_singleword=ls_temp
//	else
//		ls_pchar=ls_temp
//		if ls_temp=' ' or ls_temp='~r' or ls_temp='~n' or ls_temp='~t' then
//			ls_unitext+=ls_temp //其它符号
//		else
//			ls_pfillchar=ls_temp
//			ls_singleword+=ls_unitext+ls_temp
//			ls_unitext=''
//		end if
//		
//	end if
//	
//next
//
////未拆解
//if ls_dbname='' and ls_alias='' then 
//	ls_dbname=ls_sql[]
//	ls_alias=ls_sql[]
//else
//	if ls_alias='' then 
//		ls_alias=ls_singleword
//	end if
//end if
//
//return 1
//
end function

public function long uf_sql_alias_clear (character lc_sql[], ref string ls_newsql);return 0
////清除SQL的列别名,可避免datawindow.querymode因为别名生成的错误条件
////1.传入SQL
////2.输入新SQL
////返回清除的别名数
//
////char lc_sql[]
////lc_sql[]="select top 10000 1    a,2 as b,3 as ')c',d=4,no_s=t1.nos,postdate='a' + 'convert(date,''+t1.postdate)',cusno=t1.cusno,maker=t1.maker,makedate=t1.makedate,chflags=t1.chflags,storecusno=t1.storecusno,bz=t1.bz,luid=t1.luid,lutime=t1.lutime, &
////	storecusname=(select names from warehouse t11 where t11.cusno=t1.storecusno), &
////	cusname=(select names from warehouse t12 where t12.cusno=t1.cusno),1 as e &
////from warehouse t0,salesorder t1 &
////where t0.types=3 and t1.cusno=t0.cusno  &
////order by makedate desc "
//
//long l_index,l_length
//string ls_words[],ls_empty[]
//long i,l_explevel,l_clearcount
//string ls_temp,ls_text,ls_singleword
//boolean lb_select,lb_top,lb_fields,lb_from,lb_quot
//string ls_types,ls_quot,ls_dbname,ls_alias,ls_unitext
//
//ls_newsql=''
//
////ls_fields[]=ls_empty[]
//
//l_length=upperbound(lc_sql[])
//i++
//ls_words[i]=''
//for l_index=1 to l_length
//	ls_temp=lc_sql[l_index]
//	
//	if ls_temp="'" or ls_temp='"' then 
//		if ls_quot='' then 
//			ls_quot=ls_temp
//		elseif ls_quot=ls_temp then 
//			ls_quot=''
//		end if
//		goto append
//	end if
//	
//	if ls_quot<>'' then 
//		goto append
//	end if
//	
//	if ls_temp='('  then 
//		l_explevel++
//		goto append
//	end if
//	if ls_temp=')' then 
//		if l_explevel=0 then 
//			messagebox('','缺少左括号:'+string(l_index))
//			return -1
//		end if
//		l_explevel=l_explevel - 1
//		goto append
//		//if l_explevel=0 then goto nex
//	end if
//	
//	if l_explevel>0 then 
//		goto append
//	end if
//	
//	if ls_temp=',' then 
//		if ls_types='select' then 
//			ls_newsql='select '
//			ls_types='fields'
//		end if
//		if ls_types='fields' then
//			
//			ls_text+=ls_singleword
//			uf_sql_alias(ls_text,ls_dbname,ls_alias)
//			if ls_alias<>ls_dbname then l_clearcount++
////			ls_fields[l_clearcount]=ls_dbname
//			ls_newsql+=ls_dbname+','
//			goto nex
//		end if
//	end if
//	
//	if ls_temp=' ' or ls_temp='~r' or ls_temp='~n' or ls_temp='~t' then 
//		if ls_singleword='' then continue;
//		if ls_types='' then 
//			if lower(ls_singleword)='select' then 
//				ls_words[i]=ls_singleword
//				ls_types=lower(ls_singleword)
//				goto nex
//			end if
//		elseif ls_types='select' then 
//			if lower(ls_singleword)='top' then
//				ls_words[i]=ls_singleword
//				ls_types=lower(ls_singleword)
//				goto nex
//			else
//				ls_newsql='select '
//				ls_types='fields'
//			end if
//		elseif ls_types='top' then 
//			ls_newsql='select top '+ls_singleword+' '
//			ls_words[i]=ls_singleword
//			ls_types='fields'
//			goto nex
//		elseif ls_types='fields' then 
//			if lower(ls_singleword)='from' then //最后一列
//				uf_sql_alias(ls_text,ls_dbname,ls_alias)
//				if ls_alias<>ls_dbname then l_clearcount++
////				ls_fields[l_clearcount]=ls_dbname
//				ls_newsql+=ls_dbname+' from '+mid(lc_sql,l_index)
//				i++
//				ls_words[i]=ls_singleword
//				ls_types=lower(ls_singleword)
//				exit
//			end if
//		end if
//		
//		//++并重新组词
//		ls_text+=ls_singleword //+ls_temp
//		ls_singleword=''
//		continue;
//	end if
//	
//	//if match(ls_temp,'[=._0-9A-Za-z]')=true then 
////		ls_words[i]+=ls_temp
////		ls_text+=ls_temp
////		continue;
//	//end if
//	
//	goto append
//	append:
//	ls_singleword+=ls_temp
//	
//	continue;
//	
//	goto nex
//	nex:
//	i++
//	ls_words[i]=''
//	ls_text=''
//	ls_singleword=''
//	ls_unitext=''
//next
//
//return l_clearcount
end function

public function string uf_dwocopy (datawindow ldw, integer ai_column, string ls_dwoname[], string ls_appsyntax[]);string ls_dwsyntax
string ls_syntax1,ls_appsyntax1,ls_modify
int i,m,li_count
dec ld_colx,ld_colwidth,l_colspace
integer li_colid
string ls_dwosyntax[],ls_dwotype[]
long l_Rows_Per_Detail

l_Rows_Per_Detail=long(ldw.Describe("DataWindow.Rows_Per_Detail"))

li_count=upperbound(ls_dwoname[])

if li_count<=0 then return ''
if ai_column<=0 then return ''

ls_dwsyntax=ldw.describe("Datawindow.Syntax")
if ldw.Describe("DataWindow.Processing")='2' then 
	l_colspace=2
else
	l_colspace=1
end if

//将列调整到最后一列
ldw.modify(ls_dwoname[1]+'.visible=0 ')
ldw.modify(ls_dwoname[1]+'.visible=1 ')

for i=1 to li_count
	ls_dwotype[i]=ldw.describe(ls_dwoname[i]+'.type')
next

//加列
ld_colx=dec(ldw.describe(ls_dwoname[1]+".x"))
ld_colwidth=dec(uf_getprop(ldw,ls_dwoname[1]+".width",0))	//得到宽度
li_colid=integer(ldw.describe(ls_dwoname[1]+".id"))

ls_syntax1=getdwosyntax(ls_dwsyntax,ls_dwotype[1],'id='+string(li_colid)+' ') //column要用id定位,避免与table(..column=..)冲突
ls_dwosyntax[1]='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)

for i=2 to li_count
	ls_syntax1=getdwosyntax(ls_dwsyntax,ls_dwotype[i],'name='+ls_dwoname[i]+' ')
	ls_dwosyntax[i]='create '+mid(ls_syntax1,1,len(ls_syntax1) - 1)
next

for m=2 to ai_column
	
	//分栏风格的id不++
	if l_Rows_Per_Detail<=1 then li_colid++
	ld_colx+=ld_colwidth + l_colspace
	
	ls_appsyntax1=ls_appsyntax[1]
	replaceex(ls_appsyntax1,'#',string(m))
	ls_modify+=ls_dwosyntax[1]+ls_appsyntax1+" id="+string(li_colid)+" x='"+string(ld_colx)+"'  )~r~n"
	
	for i=2 to li_count
		ls_appsyntax1=ls_appsyntax[i]
		replaceex(ls_appsyntax1,'#',string(m))
		ls_modify+=ls_dwosyntax[i]+ls_appsyntax1+" x='"+string(ld_colx)+"'  )~r~n"
	next
next

return ldw.modify(ls_modify)

	
end function

public function string uf_dwocopy (datawindow ldw, integer ai_column, string ls_dwotype[], ref string ls_dwoname[], ref string ls_appsyntax[]);return uf_dwocopy(ldw,ai_column,ls_dwoname[],ls_appsyntax[])
end function

public function string xml2db (string as_xml, string as_xmltp, string as_eles, string as_tablename, string as_sql, string as_modify);/*xml保存至数据库
参数1:xml内容
参数2:要增加模板的节点
参数3:列对应的元素
参数4:要更新至的表
参数5:创建dw/ds的sql语句,决定了更新表的字段名称
*/

string ls_msg
int li_ret

//如果更新的字段和表字段不一样,要在sql中使用as关键字匹配xml元素,as_columns参数要赋值数据表字段1,字段2

ls_msg=getmodify(ids,as_sql,as_tablename,sqlca)	//得到数据窗口
if ls_msg<>'' then goto e

if as_modify<>'' then 
	ls_msg=ids.modify(as_modify)
	if ls_msg<>'' then 
		ls_msg='Modify:'+ls_msg+' ~r~n'+as_modify
		goto e
	end if
end if

ls_msg=xmlimport(ids, as_xml,as_xmltp,as_eles)
if ls_msg<>'' then goto e

//ls_msg=setdbname( ids,as_columns)	//要更新的表字段,顺序
//if ls_msg<>'' then goto e

li_ret=ids.settransobject(sqlca)		//要更新的事务
if li_ret<>1 then 
	ls_msg+="事务设置失败:"+string(li_ret)
	goto e
end if

string ls_ret
ls_ret=this.uf_update(ids,'batch=50;insert=1;',sqlca)
//li_ret=ids.update(false,false)

if ls_ret='' then 	//update 
	commit;
else
	rollback;
	ls_msg+="保存失败:"+ls_ret
end if

e:
return ls_msg
end function

public function string getresult (string as_sql, transaction ltrans);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

string l_syntax,ls_ret=''
long l_rowcount

ls_ret=getquery(ids,as_sql,ltrans)
if ls_ret<>'' then goto e

ids.settransobject(ltrans)
l_rowcount=ids.retrieve()
if l_rowcount=-1 then 
	ls_ret=is_dberror
	goto e
end if
if l_rowcount=0 then goto e

ls_ret=ids.describe("datawindow.data")+'~r~n'	//增加换行符为避免返回空字符串时的冲突

e:
return ls_ret
end function

public function string uf_getdata (powerobject ldd_source, string ls_columns[], ref datastore lds_dest);string ls_dwsyntax,ls_errtext,ls_dwotype,ls_coltype
int li_column_count,i
datawindow ldw_source
datastore lds_source
dwobject ldwo_source,ldwo_dest
object type_obj

type_obj=ldd_source.typeof()

choose case type_obj
	case datawindow!
		ldw_source=ldd_source		
	case datastore!
		lds_source=ldd_source
	case else
		ls_errtext='第一个参数只能是datawindow 或 datastore !'
		goto e
end choose

//无数据不执行数据copy
if ldd_source.dynamic rowcount()<=0 then goto m

//ids_temp.create(ldd_source.dynamic describe('datawindow.syntax'))
//ldd_source.dynamic sharedata(ids_temp)
//ls_dwsyntax=''
//for i=1 to li_column_count
//	li_pos=pos(ls_columns[i],'=')
//	if li_pos=0 then continue;
//	ls_columns[i]=left(ls_columns[i],li_pos - 1)
//	ls_expression=mid(ls_columns[i],li_pos+1)
//	ls_dwsyntax+='create compute(band=detail name=cp_temp111 expression="'+ls_expression+'" x="0" y="0" width="0" height="0" ) '
//next

ls_dwsyntax="release 12;table("

li_column_count=upperbound(ls_columns[])

for i=1 to li_column_count
	ls_dwotype=ldd_source.dynamic describe(ls_columns[i]+'.type')
	//if ls_dwotype='column' then 
		ls_coltype=ldd_source.dynamic describe(ls_columns[i]+'.Coltype')
//	else
//		if type_obj=datawindow! then 
//			ldwo_source=ldw_source.object.__get_attribute(ls_columns[i],false)
//		else
//			ldwo_source=lds_source.object.__get_attribute(ls_columns[i],false)
//		end if
//		ls_coltype=classname(ldwo_source.current[1])
//		choose case ls_coltype
//			case 'string'
//				ls_coltype='char(32766)'
//			case 'double'
//				ls_coltype='number'
//		end choose
//	end if
	
	choose case ls_coltype
		case 'char' //计算列
			ls_coltype='char(32766)'
		case 'number' //计算列
			ls_coltype='number'
	end choose
	ls_dwsyntax+="column=(type="+ls_coltype+" updatewhereclause=no name="+ls_columns[i]+" dbname=~""+ls_columns[i]+"~") "
next

ls_dwsyntax+=")"

if lds_dest.dynamic create(ls_dwsyntax,ls_errtext)=-1 then 
	ls_errtext='Create : '+ls_errtext
	goto e
end if

if type_obj=datawindow! then
	for i=1 to li_column_count
		ldwo_source=ldw_source.object.__get_attribute(ls_columns[i],false)
		ldwo_dest=lds_dest.object.__get_attribute('#'+string(i),false)
		ldwo_dest.primary=ldwo_source.primary
	next
else
	for i=1 to li_column_count
		ldwo_source=lds_source.object.__get_attribute(ls_columns[i],false)
		ldwo_dest=lds_dest.object.__get_attribute('#'+string(i),false)
		ldwo_dest.primary=ldwo_source.primary
	next
end if

goto m
m:
return ''

goto e
e:
return ls_errtext
end function

public function string uf_getdata (powerobject ldd_source, string ls_columns[], ref string ls_ref[], string ls_separator, string ls_quote);string ls_dwocreate,ls_errtext,ls_ret
int li_column_count,i
dwobject ldwo_source
string ls_expression
object type_obj
datawindow ldw_source
datastore lds_source

type_obj=ldd_source.typeof()
choose case type_obj
	case datawindow!
		ldw_source=ldd_source
	case datastore!
		lds_source=ldd_source
	case else
		ls_errtext='第一个参数只能是datawindow 或 datastore !'
		goto e
end choose

li_column_count=upperbound(ls_columns[])
if li_column_count=0 then goto m
if ldd_source.dynamic rowcount()<=0 then goto m

replaceex(ls_quote,'~~','~~~~~~~~')
replaceex(ls_quote,'"','~~~~~~~"')
replaceex(ls_separator,'~~','~~~~~~~~')
replaceex(ls_separator,'"','~~~~~~~"')

string ls_strmethod
if ldd_source.dynamic describe('datawindow.table.GridColumns')='?' then 
	ls_strmethod='String'
else
	ls_strmethod='Lookupdisplay'
end if
ls_expression="~~~""+ls_quote+"~~~" + "+ls_strmethod+"("+ls_columns[1]+") + ~~~""+ls_quote+"~~~" "
for i=2 to li_column_count
	ls_expression+=" + ~~~""+ls_separator+"~~~" + ~~~""+ls_quote+"~~~" + "+ls_strmethod+"("+ls_columns[i]+") + ~~~""+ls_quote+"~~~" "
next

ls_dwocreate='create compute(band=detail name=cp_temp111 expression="'+ls_expression+'" x="0" y="0" width="0" height="0" ) '
ldd_source.dynamic modify('destroy cp_temp111')
ls_ret=ldd_source.dynamic modify(ls_dwocreate)
if ls_ret<>'' then 
	ls_errtext="uf_getdata "+ls_ret+' ~r~n'+ls_dwocreate
	goto e
end if

if type_obj=datawindow! then
	ls_ref[]=ldw_source.object.cp_temp111.primary
else
	ls_ref[]=lds_source.object.cp_temp111.primary
end if

ldd_source.dynamic modify('destroy cp_temp111')

goto m
m:
return ''

goto e
e:
return ls_errtext
end function

public function long uf_findrows (powerobject ldw, string ls_findstr, ref long l_selected[]);long l_startrow=1,l_rowcount,l_findrow,l_emptyarray[]
long l_count,l_ret
l_selected[]=l_emptyarray[]

l_ret=ldw.dynamic rowcount()
if l_ret<=0 then goto e
l_rowcount=l_ret

l_findrow=0
do
	l_ret=ldw.dynamic find(ls_findstr,l_findrow + 1,l_rowcount)
	if l_ret<=0 then exit
	l_findrow=l_ret
	l_count++
	l_selected[l_count]=l_findrow
loop until l_findrow=l_rowcount

return l_count

goto e
e:
return l_ret
end function

public function string uf_getrowheight (datawindow ldw, dwobject ldwo);/*将每行的rowheight赋值到一个列上*/
//dwobject参数默认就是引用传递

string ls_dwocreate,ls_ret,ls_errtext

if ldw.rowcount()<=0 then return ''

ls_dwocreate='create compute(band=detail name=cp_temp111 expression="rowheight()" x="0" y="0" width="0" height="0" ) '
ldw.dynamic modify('destroy cp_temp111')
ls_ret=ldw.dynamic modify(ls_dwocreate)
if ls_ret<>'' then 
	ls_errtext="uf_getrowheight "+ls_ret+' ~r~n'+ls_dwocreate
	goto e
end if

ldwo.primary=ldw.object.cp_temp111.primary
ldw.dynamic modify('destroy cp_temp111')

return ''

goto e
e:
return ls_errtext
end function

public function string setcolumnvalues (powerobject dd, string as_column, datastore ldd_1, string as_displayvalue, string as_datavalue);//设置字段为dropdownlistbox的values
//参数dd:数据窗口
//as_column要添加values的字段,可以是#+colid
//as_sql 列表的数据
//as_displayvalue	显示的字段值
//as_datavalue	数据项

string ls_value
long i,l_rowcount
int l_displayid,l_dataid
string ls_errortext

//ls_errortext=getquery(ldd_1,as_sql)
//if ls_errortext>'' then goto e
//
//ldd_1.settransobject(sqlca)
//l_rowcount=ldd_1.retrieve()
//if l_rowcount=-1 then 
//	ls_errortext=is_dberror
//	goto e
//end if
l_rowcount=ldd_1.rowcount()
if l_rowcount<=0 then 
	return ''
end if

//l_displayid=integer(ldd_1.describe(as_displayvalue+".id"))
//if l_displayid=0 then 
//	ls_errortext="'"+as_displayvalue+"' Invalid!"
//	goto e
//end if
l_dataid=integer(ldd_1.describe(as_datavalue+".id"))
if l_dataid=0 then 
	ls_errortext="'"+as_datavalue+"' Invalid!"
	goto e
end if

for i=1 to l_rowcount
	ls_value+=ldd_1.describe("Evaluate(~""+as_displayvalue+"~","+string(i)+")")+"~t"+string(ldd_1.object.data[i,l_dataid],'')+'/'
next

ls_errortext=dd.dynamic modify(as_column+".values='"+ls_value+"'")

e:
return ls_errortext
end function

public subroutine uf_xmlout_append (ref string ls_text, string ls_listname, datastore ldw_parent, long l_parentrow);long l_listindex,l_startrow,l_endrow,l_rowcount 
string ls_filter,ls_listname_real
long l_row,i
int li_index
string ls_nodenames[],ls_fieldnames[],ls_key[]
dwobject ldwo
datastore lds_main
string ls_endstring
//boolean

for i=1 to i_listcount
	if is_listname[i]=ls_listname then 
		l_listindex=i
		exit
	end if
next 

if l_listindex=0 then return 

//将节点存入数组
ldwo=ids_nodes.object.__get_attribute('#'+string(l_listindex),false)
ls_nodenames[]=ldwo.primary

//将字段名存入数组
ldwo=ids_fields.object.__get_attribute('#'+string(l_listindex),false)
ls_fieldnames[]=ldwo.primary

lds_main=ids_list[l_listindex] //数据
boolean lb_parent
//if lds_main.describe('datawindow.name')='' then //无效dw,则取传入数据
	lb_parent=ib_dsempty[l_listindex] //空ds取上级
//end if

if lb_parent=true then
	lds_main=ldw_parent
	l_startrow=l_parentrow
	l_endrow=l_parentrow
else
	if i_keycount[l_listindex]>0 then 
		//将where条件需要的字段存入数组
		ldwo=ids_wherekeys.object.__get_attribute('#'+string(l_listindex),false)
		if ids_wherekeys.rowcount()>0 then ls_key[]=ldwo.primary //防止key全部没有
	end if
	
	for i=1 to i_keycount[l_listindex]
		if i<>1 then 
			ls_filter+=" and "
		end if
		ls_filter+="string("+ls_key[i]+",'')='"+ldw_parent.describe("Evaluate('"+ls_key[i]+"',"+string(l_parentrow)+")")+"' "
	next
	
	l_rowcount=lds_main.rowcount()
	
	if ls_filter='' then 
		l_startrow=1 
		l_endrow=l_rowcount
	else
		l_startrow=lds_main.find(ls_filter,1,l_rowcount) //起始行
		if l_startrow<=0 then goto m //无对应数据
		l_endrow=lds_main.find('not('+ls_filter+')',l_startrow + 1,l_rowcount) //结束行+1
	
		if l_endrow<=0 then 
			if lds_main.find(ls_filter,l_rowcount,l_rowcount)=l_rowcount then //可能到最后一行
				l_endrow=l_rowcount
			else
				l_endrow=l_startrow
			end if
		else
			l_endrow=l_endrow - 1
		end if
	end if

end if

ls_listname_real=mid(ls_listname,pos(ls_listname,':') + 1) //区分别名

for l_row=l_startrow to l_endrow
	ls_text+=('<'+ls_listname_real) //开头内容
	
	ls_endstring='>' //结尾内容
	
	for li_index=1 to i_nodecount[l_listindex]
		if right(ls_nodenames[li_index],1)='=' then //如果是属性
			ls_text+=(' '+ls_nodenames[li_index]+'"'+lds_main.describe("Evaluate('"+ls_fieldnames[li_index]+"',"+string(l_row)+")")+'"')
			continue;
		elseif ls_endstring<>'' then //如果有结尾内容
			ls_text+=(ls_endstring)
			ls_endstring=''
		end if
		if string(ls_fieldnames[li_index],'')='' then //如果是列表
			uf_xmlout_append(ref ls_text,ls_nodenames[li_index],lds_main,l_row)
			continue;
		end if
		ls_text+=('<'+ls_nodenames[li_index])
		ls_endstring='>'+lds_main.describe("Evaluate('"+ls_fieldnames[li_index]+"',"+string(l_row)+")")+'</'+ls_nodenames[li_index]+'>'
	next
	
	ls_text+=(ls_endstring+'</'+ls_listname_real+'>')
next

goto m
m:


end subroutine

public function string uf_xmlout (ref string ls_text[]);string ls_errtext,ls_ret
long l_row,l_rowcount
int i,li_mainlistindex

//if uf_xmlout_create(ls_errtext)=-1 then goto e

//for i=1 to i_listcount
//	if ids_list[i].GetSQLSelect ()<>'' then 
//		li_mainlistindex=i
//		exit
//	end if
//next

if i_listcount>0 then li_mainlistindex=1
if li_mainlistindex=0 then 
	ls_errtext='无数据列表!'
	goto e
end if 

//if isvalid(ds_valid) then ds_valid.insertrow(0) //引用默认的ds
for i=1 to i_listcount
	if ids_list[i].rowcount()=0 then
		if ids_list[i].getsqlselect()='' then 
			ids_list[i].insertrow(0) //导出xml,常数ds默认新增一行
			ib_dsempty[i]=true //标记为空ds
		end if
	end if
next
l_rowcount=ids_list[li_mainlistindex].rowcount()

for l_row=1 to l_rowcount
	ls_ret=''
	uf_xmlout_append(ref ls_ret,is_listname[1],ids_list[li_mainlistindex],l_row)
	ls_text[l_row]=ls_ret
next

//if lb_destroy=true then 
//	//销毁数据窗口
//	uf_xmlout_destroy()
//end if

return ''

e:
return ls_errtext
end function

public function string uf_getdwheight (powerobject ldw, ref long l_height);string ls_path='temp.psr'
string ls_errtext,ls_ret
datawindowchild ldw_child

if fileexists(ls_path) then 
	if filedelete(ls_path)=false then 
		ls_errtext='临时文件删除失败:'+ls_path
		goto e
	end if
end if

if ldw.dynamic saveas(ls_path,psreport!,true)=-1 then 
	ls_errtext='存档失败!'
	goto e
end if

ls_errtext=getcomposite(ids_temp,ldw)
if ls_errtext<>'' then goto e

ls_errtext=ids_temp.Modify( &
"create report(band=Detail dataobject='"+ls_path+"'  x='0' y='0' height='0' width='100' name=dw_1 height.autosize=yes ) ")
if ls_errtext<>'' then goto e


if ids_temp.getchild('dw_1',ldw_child)=-1 then 
	ls_errtext='getchild失败!'
	goto e
end if

if ldw.dynamic sharedata(ldw_child)=-1 then 
	ls_errtext='getchild失败!'
	goto e
end if

ls_ret=ids_temp.describe('Evaluate("rowheight()",0)')
if ls_ret='!' or ls_ret='' then 
	ls_errtext='rowheight失败!'
	goto e
end if

l_height=long(ls_ret)
filedelete(ls_path)

e:
return ls_errtext

end function

public function string uf_posvalue (string ls_args, string ls_field, string ls_endstr);
//查找以分号结束的值
string ls_value
long l_row,l_pos,l_endpos,l_startpos,l_endlen
int li_cutout
l_endlen=len(ls_endstr)
l_pos=pos(ls_args,ls_field)
if l_pos<=0 then goto m

l_startpos=l_pos+len(ls_field)
l_endpos=pos(ls_args,ls_endstr,l_startpos)
if l_endpos=0 then 
	ls_value=mid(ls_args,l_startpos)
else
	ls_value=mid(ls_args,l_startpos,l_endpos - l_startpos)
end if
//ls_args=left(ls_args,l_pos - 1)+mid(ls_args,l_endpos+l_endlen)

return ls_value

goto m
m:
return ''
end function

public function string uf_cutvalue (ref string ls_args, string ls_field, string ls_endstr);
//查找以分号结束的值
string ls_value
long l_row,l_pos,l_endpos,l_startpos,l_endlen
int li_cutout
l_endlen=len(ls_endstr)
l_pos=pos(ls_args,ls_field)
if l_pos<=0 then goto m

l_startpos=l_pos+len(ls_field)
l_endpos=pos(ls_args,ls_endstr,l_startpos)
if l_endpos=0 then 
	ls_value=mid(ls_args,l_startpos)
else
	ls_value=mid(ls_args,l_startpos,l_endpos - l_startpos)
end if
ls_args=replace(ls_args,l_pos,l_endpos,'') //

return ls_value

goto m
m:
return ''
end function

private subroutine uf_sql_fields (character ls_sql[], ref string ls_dbname, ref string ls_alias);//解析select语句的字段及别名
//string ls_exp[]
//ls_exp[1]='1    a'
//ls_exp[2]='2 as b'
//ls_exp[3]="3 as ')c'"
//ls_exp[4]="'d'=4"
//ls_exp[5]='no_s=t1.nos'
//ls_exp[6]="postdate='a' + 'convert(date,''+t1.postdate)'"
//ls_exp[7]='storecusname=(select names from warehouse t11 where t11.cusno=t1.storecusno)'

long l_index,l_length
string ls_words[]
long i,l_explevel
string ls_temp,ls_text,ls_singleword //,ls_alias,ls_dbname
string ls_quot,ls_pfillchar,ls_pchar,ls_unitext
//char ls_sql[]
//ls_sql[]=ls_exp[7]
ls_dbname=''
ls_alias=''
l_length=upperbound(ls_sql[])
i++
ls_words[i]=''
for l_index=1 to l_length
	ls_temp=ls_sql[l_index]
	
	if ls_temp="'" or ls_temp='"' then 
		if ls_quot='' then 
			ls_quot=ls_temp
		elseif ls_quot=ls_temp then 
			ls_quot=''
		end if
		goto append
	end if
	
	if ls_quot<>'' then 
		goto append
	end if
	
	if ls_temp='('  then 
		l_explevel++
		goto append
	end if
	if ls_temp=')' then 
		if l_explevel=0 then 
			messagebox('','缺少左括号:'+string(l_index))
			return 
		end if
		l_explevel=l_explevel - 1
		goto append
		//if l_explevel=0 then goto nex
	end if
	
	if l_explevel>0 then 
		goto append
	end if
	
	if ls_temp='=' then 
		ls_alias=ls_singleword
		ls_dbname=mid(ls_sql[],l_index+1)
		exit
	end if
	
	//首个字符
	if ls_pfillchar='' then goto append
	//前一个为非空字符相连的非空字符
	if ls_pchar<>' ' and ls_temp<>' ' then goto append
	//其它空字符相加
	//if ls_temp=' ' or ls_temp='~r' or ls_temp='~n' or ls_temp='~t' then goto append
	
	//非空字符
	choose case ls_pfillchar
		case '+','-','*','/' //计算符
			goto append
		case else
			choose case ls_temp
				case '+','-','*','/' //计算符
					goto append
				case else
					if ls_dbname='' then 
						ls_dbname=ls_singleword
					else
						if upper(ls_singleword)='AS' then 
							ls_alias=mid(ls_sql[],l_index)
							exit
						end if
					end if
					
					//重新组词
					ls_singleword=ls_temp
					ls_pfillchar=ls_temp
					ls_pchar=ls_temp
					ls_unitext=''
					continue;
			end choose
			
	end choose
	
	goto append
	append:
	if ls_singleword<>'' and isnumber(ls_singleword) and match(ls_temp,'[_A-Za-z]')=true then 
		ls_dbname=ls_singleword
		ls_singleword=ls_temp
	else
		ls_pchar=ls_temp
		if ls_temp=' ' or ls_temp='~r' or ls_temp='~n' or ls_temp='~t' then
			ls_unitext+=ls_temp //其它符号
		else
			ls_pfillchar=ls_temp
			ls_singleword+=ls_unitext+ls_temp
			ls_unitext=''
		end if
		
	end if
	
next

//未拆解
if ls_dbname='' and ls_alias='' then 
	ls_dbname=ls_sql[]
	ls_alias=ls_sql[]
else
	if ls_alias='' then 
		ls_alias=ls_singleword
	end if
end if

//去除前后空格
ls_dbname=trim(ls_dbname,true)
ls_alias=trim(ls_alias,true)

//messagebox('',ls_dbname+' as '+ls_alias)

end subroutine

public function integer uf_selectinto (string as_sql, any a_parm[], ref parmtype ltype_ref[]);string Stringvar, Sqlstatement
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

ltype_ref[]=SQLDA.OutParmType[]

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

public function string uf_parmtype (parmtype lparmtype);string ls_ret
CHOOSE CASE lParmType
	CASE TypeString!
		ls_ret='char(32766)'
	CASE TypeInteger!,TypeLong!,TypeByte!,TypeUInt!,TypeUInt!,TypeULong!
		ls_ret='long'
	CASE TypeLongLong!,TypeDecimal!,TypeReal!,TypeDouble!
		ls_ret='decimal(9)'
	case Typedate! 
		ls_ret='date'
	case typedatetime!
		ls_ret='datetime'
	case typetime!
		ls_ret='time'
END CHOOSE
return ls_ret
end function

public function long uf_findarray (string a_array[], string a_value, integer ai_option);long l_count,i

l_count=upperbound(a_array[])
if l_count=0 then goto e

if ai_option=1 then //忽略大小写

	for i=1 to l_count
		if upper(a_array[i])=upper(a_value) then exit
		if i=l_count then goto e
	next
else
	for i=1 to l_count
		if a_array[i]=a_value then exit
		if i=l_count then goto e
	next
end if

return i

e:
return 0
end function

public function integer uf_xmlout_reset ();
int i

//销毁数据窗口
for i=1 to i_listcount
	if isvalid(ids_list[i])=false then continue;
	if ib_dsbuild[i] then ids_list[i].reset() //清空数据
next

return 0

end function

public function integer uf_setitem (datawindow dd, long al_row, string as_columname, any a_value, integer ai_option);//设置any多种类型的值
//ai_option=1为不设置类型不兼容的值,0 为全部设置,>100时触发itemchanged事件
//返回0为未设值,1成功,-1 为失败

string ls_coltype
any la_value
dwobject ldwo
datawindow ldw
datastore lds
boolean lb_triggeritemchanged=false

if string(as_columname,'')='' or string(al_row,'')<'1' then goto e

ls_coltype=dd.describe(as_columname+".coltype")

if ls_coltype='!' then goto e

if ai_option>100 then 
	lb_triggeritemchanged=true 
	ai_option =ai_option - 100
end if

choose case lower(left(ls_coltype,5))
	case 'char('
		la_value=string(a_value)
	case 'date'
		if ai_option=0 then
			la_value=date(a_value)
		else
			if isdate(a_value)=false then goto m
		end if
	case 'datet'
		la_value=datetime(date(a_value),time(a_value))
	case 'decim','numbe'
		if ai_option=0 then
			la_value=dec(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'int'
		if ai_option=0 then
			la_value=integer(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'long','ulong'
		if ai_option=0 then
			la_value=long(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'real'
		if ai_option=0 then
			la_value=real(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'time','times'
		if ai_option=0 then
			la_value=real(a_value)
		else
			if IsTime(a_value)=false then goto m; 
		end if
end choose

//触发itemchanged事件
if lb_triggeritemchanged then 
	
	//获取列对象
	choose case typeof(dd)
		case datawindow! 
			ldw=dd
			ldwo=ldw.object.__get_attribute(as_columname,false)
//		case datastore!
//			lds=dd
//			ldwo=lds.object.__get_attribute(as_columname,false)
	end choose
	
	if dd./*dynamic */event ItemChanged(al_row,ldwo,string(a_value))<>0 then goto e
	
end if

return setitem(dd,al_row,as_columname,la_value)

m:
return 0

e:
return -1
end function

public function integer uf_setitem (datastore dd, readonly long al_row, readonly string as_columname, readonly any a_value, integer ai_option);//设置any多种类型的值
//ai_option=1为不设置类型不兼容的值,0 为全部设置,>100时触发itemchanged事件
//返回0为未设值,1成功,-1 为失败

string ls_coltype
any la_value
dwobject ldwo
datawindow ldw
datastore lds
boolean lb_triggeritemchanged=false

if string(as_columname,'')='' or string(al_row,'')<'1' then goto e

ls_coltype=dd.describe(as_columname+".coltype")
//ls_coltype=uf_describe(dd,as_columname+".coltype")

if ls_coltype='!' then goto e

if ai_option>100 then 
	lb_triggeritemchanged=true 
	ai_option =ai_option - 100
end if

choose case lower(left(ls_coltype,5))
	case 'char('
		la_value=string(a_value)
	case 'date'
		if ai_option=0 then
			la_value=date(a_value)
		else
			if isdate(a_value)=false then goto m
		end if
	case 'datet'
		la_value=datetime(date(a_value),time(a_value))
	case 'decim','numbe'
		if ai_option=0 then
			la_value=dec(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'int'
		if ai_option=0 then
			la_value=integer(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'long','ulong'
		if ai_option=0 then
			la_value=long(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'real'
		if ai_option=0 then
			la_value=real(a_value)
		else
			if isnumber(a_value)=false then goto m; 
		end if
	case 'time','times'
		if ai_option=0 then
			la_value=real(a_value)
		else
			if IsTime(a_value)=false then goto m; 
		end if
end choose

//触发itemchanged事件
if lb_triggeritemchanged then 
	
	//获取列对象
	choose case typeof(dd)
//		case datawindow! 
//			ldw=dd
//			ldwo=ldw.object.__get_attribute(as_columname,false)
		case datastore!
			lds=dd
			ldwo=lds.object.__get_attribute(as_columname,false)
	end choose
	
	if dd./*dynamic */event ItemChanged(al_row,ldwo,string(a_value))<>0 then goto e
	
end if

return dd.setitem(al_row,as_columname,la_value)

m:
return 0

e:
return -1
end function

public function string uf_dwcreatetab (powerobject ldw, string ls_tablename, transaction ltrans);long l_count,i
string ls_ret,ls_errtext,ls_sqlsyntax
string ls_coltype,ls_colname
string ls_key[]={'dbms','temp'}
string ls_dbms,ls_temp

/*需要从开头按顺序传入*/
if left(ls_tablename,len(ls_key[1]))=ls_key[1] then ls_dbms=uf_cutvalue(ls_tablename,ls_key[1]+'=',';')
if left(ls_tablename,len(ls_key[2]))=ls_key[2] then ls_temp=uf_cutvalue(ls_tablename,ls_key[2]+'=',';')

ls_ret=ldw.dynamic describe("datawindow.column.count")
l_count=long(ls_ret)
if isnumber(ls_ret)=false or l_count<=0 then 
	ls_errtext="提取列数失败:"+ls_ret
	goto e
end if

string ls_field_id='id'
string ls_datatype_identity='numeric'
string ls_keyword_identity='identity'
ls_sqlsyntax="create table "
choose case ls_dbms
	case 'mysql'
		if ls_temp='1' then ls_sqlsyntax="create TEMPORARY table "
		ls_datatype_identity='bigint'
		ls_keyword_identity='AUTO_INCREMENT'
end choose

if ldw.dynamic describe("id.dbname")='id' then //避免原单存在id列
	ls_field_id='autoid'
end if
ls_sqlsyntax+=ls_tablename+"("+ls_field_id+" "+ls_datatype_identity+" "+ls_keyword_identity+" "
	
for i=1 to l_count
	ls_colname=ldw.dynamic describe("#"+string(i)+".dbname")
	ls_coltype=ldw.dynamic describe("#"+string(i)+".coltype")
	choose case lower(left(ls_coltype,5))
		case 'char('
			ls_coltype='var'+ls_coltype
		case 'decim','numbe','real'
			ls_coltype='decimal(15,4)'
		case 'long','ulong'
			ls_coltype='int'
		case 'longlong'
			ls_coltype='long'
	end choose
	ls_sqlsyntax+=","+ls_colname+"	"+ls_coltype+" null"
next

choose case ls_dbms
	case 'mysql'
		ls_sqlsyntax+=",PRIMARY KEY ("+ls_field_id+")"
end choose

ls_sqlsyntax+=")"

if execddl(ls_sqlsyntax,ltrans)=-1 then goto e

return ''

goto e
e:
if ltrans.sqlcode=-1 then ls_errtext+=ltrans.sqlerrtext
return ls_errtext
end function

public function integer execddl (string as_sql, transaction at_trans);int li_ret=0
boolean lb_commit

lb_commit=at_trans.autocommit

at_trans.autocommit=true

execute immediate :as_sql using at_trans;

at_trans.autocommit=lb_commit

if at_trans.sqlcode=-1 then li_ret=-1

return li_ret
end function

public function any uf_getitem (ref datawindow dd, long al_row, string as_columname, string ls_coltype, dwbuffer ldwbuffer, boolean loriginal);//设置any多种类型的值
any la_value
datawindow ldw
datastore lds

//if ls_coltype='' then ls_coltype=dd.describe(as_columname+".coltype")
//if ls_coltype='!' then goto e

choose case lower(left(ls_coltype,5))
	case 'char('
		return dd.getitemstring(al_row,as_columname,ldwbuffer,loriginal)
	case 'date'
		return dd.getitemdate(al_row,as_columname,ldwbuffer,loriginal)
	case 'time'
		return dd.getitemtime(al_row,as_columname,ldwbuffer,loriginal)
	case 'datet'
		return dd.getitemdatetime(al_row,as_columname,ldwbuffer,loriginal)
	case 'decim'
		return dd.GetItemDecimal (al_row,as_columname,ldwbuffer,loriginal)
	case else //'numbe','long','ulong','real'
		return dd.getitemnumber(al_row,as_columname,ldwbuffer,loriginal)
end choose

goto e
e:
return la_value
end function

public function any uf_getitem (ref datastore dd, long al_row, string as_columname, string ls_coltype, dwbuffer ldwbuffer, boolean loriginal);//设置any多种类型的值
any la_value
datawindow ldw
datastore lds

//if ls_coltype='' then ls_coltype=dd.describe(as_columname+".coltype")
//if ls_coltype='!' then goto e

choose case lower(left(ls_coltype,5))
	case 'char('
		return dd.getitemstring(al_row,as_columname,ldwbuffer,loriginal)
	case 'date'
		return dd.getitemdate(al_row,as_columname,ldwbuffer,loriginal)
	case 'time'
		return dd.getitemtime(al_row,as_columname,ldwbuffer,loriginal)
	case 'datet'
		return dd.getitemdatetime(al_row,as_columname,ldwbuffer,loriginal)
	case 'decim'
		return dd.GetItemDecimal (al_row,as_columname,ldwbuffer,loriginal)
	case else //'numbe','long','ulong','real'
		return dd.getitemnumber(al_row,as_columname,ldwbuffer,loriginal)
end choose

goto e
e:
return la_value
end function

public function string uf_update (ref datastore ldw_1, string ls_param, transaction ltrans_1);//拼接SQL-->执行
//拼接SQL-->压缩-->解压-->执行
//1.delete-->2.update-->3.insert //最后insert待完善!!
string ls_errtext

//if ldw_1.event UpdateStart()=1 then 
//	ls_errtext='UpdateStart:1'
//	goto e
//end if
string ls_key[]={'batch','check','insert','table'} 
long l_batch
int li_check=1 /*默认检查*/
int li_insert=0 /*将当前数据强制执行insert*/
string ls_updatetable
string ls_UpdateWhere //<0 - Key Columns, 1 - Key and Updateable Columns, 2 - Key and Modified Columns>
string ls_UpdateKeyinPlace //<yes or no>

/*需要从开头按顺序传入*/
if left(ls_param,len(ls_key[1]))=ls_key[1] then l_batch=long(uf_cutvalue(ls_param,ls_key[1]+'=',';'))
if l_batch=0 then l_batch=1
if left(ls_param,len(ls_key[2]))=ls_key[2] then li_check=integer(uf_cutvalue(ls_param,ls_key[2]+'=',';')) //0为不检查
if l_batch>1 then li_check=0 /*批处理时,sqlnrows只返回最后一个结果,所以不能check*/
if left(ls_param,len(ls_key[3]))=ls_key[3] then li_insert=integer(uf_cutvalue(ls_param,ls_key[3]+'=',';')) //1为insert
if left(ls_param,len(ls_key[4]))=ls_key[4] then ls_updatetable=uf_cutvalue(ls_param,ls_key[4]+'=',';') //要更新的表名

//获取表名+键值+更新方式(key,key+updatecolumn,modfied)(update,delete+insert)
if ls_updatetable='' then ls_updatetable=ldw_1.describe("DataWindow.Table.UpdateTable")
if ls_updatetable='' then goto m
ls_UpdateWhere=ldw_1.describe("DataWindow.table.updatewhere")
ls_UpdateKeyinPlace=ldw_1.describe("DataWindow.table.UpdateKeyinPlace")

//获取列的数据类型
string ls_dbname_temp,ls_coltype_temp,ls_temp2,ls_ret,ls_colname_temp
int li_columncount,i,li_keycount,li_updatecount
string ls_colname[],ls_dbname[] //支持更新的column
string ls_coltype[]
int li_key[] /*主键*/,li_update[]

li_columncount=long(ldw_1.describe("datawindow.column.count"))
li_keycount=0
li_updatecount=0
for i=1 to li_columncount
	ls_colname_temp=ldw_1.describe("#"+string(i)+".name")
	ls_coltype_temp=ldw_1.describe("#"+string(i)+".coltype")
	ls_dbname_temp=ldw_1.describe("#"+string(i)+".dbname")
	
	ls_colname[i]=ls_colname_temp
	ls_dbname[i]=ls_dbname_temp
	ls_coltype[i]=ls_coltype_temp
	
	if ls_dbname_temp='' then continue;
	
	ls_ret=ldw_1.describe("#"+string(i)+".update")
	if ls_ret='yes' then 
		li_updatecount++
		li_update[li_updatecount]=i
	end if
	ls_ret=ldw_1.describe("#"+string(i)+".key")
	if ls_ret='yes' then 
		li_keycount++
		li_key[li_keycount]=i
	end if
next



string ls_sql
long l_row,l_subcount,l_sqlcount,l_rowcount
long l_rowsinserted,l_rowsupdated,l_rowsdeleted
DWitemstatus lrowstatus
string ls_deletesyntax,ls_where
string ls_insertsyntax,ls_valuesyntax,ls_setsyntax
string ls_dbvalue
dwbuffer ldw_buffer[]={filter!,primary!}
int li_bufferindex
any la_parm[];any la_empty
long l_parmcount
//ids_temp.create('release 12;table(column=(type=char(32766) updatewhereclause=no name=a dbname="a" ))');

i=1
ls_insertsyntax="insert into "+ls_updatetable+"("+ls_dbname[li_update[i]]
for i=2 to li_updatecount
	ls_insertsyntax+=","+ls_dbname[li_update[i]]
next
ls_insertsyntax+=')'

if li_insert=1 then //采用全insert的模式
	l_rowcount=ldw_1.rowcount()
	l_sqlcount=0
	l_row=0
	ls_sql=''
	l_subcount=0
	l_rowsinserted=0
	
	for l_row=1 to l_rowcount
		i=1
		//ls_insertsyntax="insert into "+ls_updatetable+"("+ls_dbname[li_update[i]]
		//ls_valuesyntax="values("+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_update[i]],ls_coltype[li_update[i]],primary!,false),'')
		ls_valuesyntax="select ?"
		//ls_valuesyntax="("+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_update[i]],ls_coltype[li_update[i]],primary!,false),'')
		//ls_valuesyntax="(?"
		l_parmcount++;la_parm[l_parmcount]=ldw_1.object.data[l_row,i]
		for i=2 to li_updatecount
			//ls_insertsyntax+=","+ls_dbname[li_update[i]]
			//ls_valuesyntax+=","+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_update[i]],ls_coltype[li_update[i]],primary!,false),'')
			ls_valuesyntax+=',?'
			l_parmcount++;la_parm[l_parmcount]=ldw_1.object.data[l_row,i]
		next
		//ls_sql+=ls_insertsyntax+ls_valuesyntax+") ~r~n"
		//ls_valuesyntax+=')'
		if l_subcount=0 then 
			ls_sql=ls_insertsyntax //+' values'
		else
			ls_sql+='~r~nunion all '
			//ls_sql+=','
		end if
		ls_sql+='~r~n'+ls_valuesyntax
		
		l_rowsinserted++
		l_subcount++
		
		if l_subcount=l_batch then 
			l_sqlcount+=l_subcount
			ls_ret=uf_execute(ls_sql,la_parm[],ltrans_1)
			if ls_ret<>'' then 
				ls_errtext='uf_execute:'+ls_ret
				goto e
			end if
//			execute immediate :ls_sql using ltrans_1;
//			if ltrans_1.sqlcode=-1 then goto e
			if li_check=1 then 
				if ltrans_1.sqlnrows<>l_subcount then 
					ls_errtext='Has nochanges '
					goto e
				end if
			end if
			l_subcount=0
			ls_sql=''
			la_parm[]={''}
			l_parmcount=0
		end if
	next
	goto p //转到最后一批
end if

//遍历需要保存的行
//获取更新的列和值
//获取更新的类型(update/insert/delete)
//获取更新的记录数(modifiedcount,deletedcount)
long l_modifiedcount,l_deletedcount,l_filtercount

l_modifiedcount=ldw_1.modifiedcount()
l_deletedcount=ldw_1.deletedcount()
if l_modifiedcount+l_deletedcount=0 then goto m

//删除行
l_row=0
l_sqlcount=0
for l_row=1 to l_deletedcount
	lrowstatus=ldw_1.GetItemStatus(l_row,0,delete!)
	if lrowstatus=New! or lrowstatus=NewModified! then continue;
	i=1
	ls_deletesyntax="delete from "+ls_updatetable+" "
	//ls_where="where "+ls_dbname[li_key[i]]+" "+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_key[i]],ls_coltype[li_key[i]],delete!,true),'where')+" "
	ls_where="where "+ls_dbname[li_key[i]]+"=? "
	l_parmcount++;la_parm[l_parmcount]=ldw_1.object.data.delete.original[l_row,li_key[i]]
	for i=2 to li_keycount
		//ls_where+=" and "+ls_colname[li_key[i]]+" "+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_key[i]],ls_coltype[li_key[i]],delete!,true),'where')+" "
		ls_where+="and "+ls_colname[li_key[i]]+"=? " 
		l_parmcount++;la_parm[l_parmcount]=ldw_1.object.data.delete.original[l_row,li_key[i]]
	next
	ls_sql+=ls_deletesyntax+ls_where+" ~r~n"
	l_rowsdeleted++
	l_subcount++
	if l_subcount=l_batch then 
		l_sqlcount+=l_subcount
		ls_ret=uf_execute(ls_sql,la_parm[],ltrans_1)
		if ls_ret<>'' then 
			ls_errtext='uf_execute:'+ls_ret
			goto e
		end if
		//execute immediate :ls_sql using ltrans_1;
		//if ltrans_1.sqlcode=-1 then goto e
		if li_check=1 then 
			if ltrans_1.sqlnrows<>l_subcount then 
				ls_errtext='Has nochanges '
				goto e
			end if
		end if
		l_subcount=0
		ls_sql=''
		l_parmcount=0
		la_parm[]={''}
	end if
next

dwobject buffer_data

for li_bufferindex=1 to 2
	buffer_data=ldw_1.object.__get_attribute('data',false)
	if ldw_buffer[li_bufferindex]=filter! then 
		if ldw_1.FilteredCount()<=0 then continue;
		buffer_data=buffer_data.__get_attribute('filter',false)
	else
		if ldw_1.rowCount()<=0 then continue;
		buffer_data=buffer_data.__get_attribute('primary',false)
	end if
	l_row=0
	do 
		l_row=ldw_1.GetNextModified(l_row,ldw_buffer[li_bufferindex])
		if l_row=0 then exit
		lrowstatus=ldw_1.GetItemStatus(l_row,0,ldw_buffer[li_bufferindex])
		if lrowstatus=NewModified! then //insert
			i=1
			ls_valuesyntax="select ?"
			l_parmcount++;la_parm[l_parmcount]=buffer_data.current[l_row,i]
			for i=2 to li_updatecount
				ls_valuesyntax+=',?'
				l_parmcount++;la_parm[l_parmcount]=buffer_data.current[l_row,i]
			next
			if l_subcount=0 then 
				ls_sql=ls_insertsyntax 
			else
				ls_sql+='~r~nunion all '
			end if
			ls_sql+='~r~n '+ls_valuesyntax
			
			l_rowsinserted++
			l_subcount++
		else //update
			if li_keycount<=0 then 
				ls_errtext='未设置主键!'
				goto e
			end if
			
			ls_setsyntax=''
			for i=1 to li_updatecount
				if ldw_1.getitemstatus(l_row,ls_colname[li_update[i]],ldw_buffer[li_bufferindex])=notmodified! then continue;
				if ls_setsyntax='' then 
					//ls_setsyntax+="set "+ls_dbname[li_update[i]]+"="+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_update[i]],ls_coltype[li_update[i]],ldw_buffer[li_bufferindex],false),'')+" "
					ls_setsyntax+="set "+ls_dbname[li_update[i]]+"=? "
				else
					//ls_setsyntax+=","+ls_dbname[li_update[i]]+"="+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_update[i]],ls_coltype[li_update[i]],ldw_buffer[li_bufferindex],false),'')+" "
					ls_setsyntax+=","+ls_dbname[li_update[i]]+"=? "
				end if
				l_parmcount++;la_parm[l_parmcount]=buffer_data.current[l_row,li_update[i]]
			next
			if ls_setsyntax='' then continue;
			
			i=1
			//ls_where="where "+ls_colname[li_key[i]]+" "+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_key[i]],ls_coltype[li_key[i]],ldw_buffer[li_bufferindex],true),'where')+" "
			ls_where="where "+ls_colname[li_key[i]]+"=? "
			l_parmcount++;la_parm[l_parmcount]=buffer_data.original[l_row,li_key[i]]
			for i=2 to li_keycount
				//ls_where+="and "+ls_colname[li_key[i]]+" "+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_key[i]],ls_coltype[li_key[i]],ldw_buffer[li_bufferindex],true),'where')+" "
				ls_where+="and "+ls_colname[li_key[i]]+"=? "
				l_parmcount++;la_parm[l_parmcount]=buffer_data.original[l_row,li_key[i]]
			next
			if ls_UpdateWhere='1' then //key+Updateable
				for i=1 to li_updatecount
					//ls_where+="and "+ls_dbname[li_update[i]]+""+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_update[i]],ls_coltype[li_update[i]],ldw_buffer[li_bufferindex],true),'where')+" "
					ls_where+="and "+ls_dbname[li_update[i]]+"=? "
					l_parmcount++;la_parm[l_parmcount]=buffer_data.original[l_row,li_update[i]]
				next
			elseif ls_UpdateWhere='2' then 
				for i=1 to li_updatecount
					if ldw_1.getitemstatus(l_row,ls_colname[li_update[i]],ldw_buffer[li_bufferindex])=notmodified! then continue;
					//ls_where+="and "+ls_dbname[li_update[i]]+""+tovalue(uf_getitem(ldw_1,l_row,ls_colname[li_update[i]],ls_coltype[li_update[i]],ldw_buffer[li_bufferindex],true),'where')+" " //key+modified
					ls_where+="and "+ls_dbname[li_update[i]]+"=? " 
					l_parmcount++;la_parm[l_parmcount]=buffer_data.original[l_row,li_update[i]]
				next
			end if
			
			ls_sql+="update "+ls_updatetable+" "+ls_setsyntax+ls_where+" ~r~n"
			l_rowsupdated++
			l_subcount++
		end if
		
		if l_subcount=l_batch then 
			l_sqlcount+=l_subcount
			ls_ret=uf_execute(ls_sql,la_parm[],ltrans_1)
			if ls_ret<>'' then 
				ls_errtext='uf_execute:'+ls_ret
				goto e
			end if
			//execute immediate :ls_sql using ltrans_1;
			//if ltrans_1.sqlcode=-1 then goto e
			if li_check=1 then 
				if ltrans_1.sqlnrows<>l_subcount then 
					ls_errtext='Has nochanges '
					goto e
				end if
			end if
			l_subcount=0
			ls_sql=''
			l_parmcount=0
			la_parm[]={''}
		end if
	loop  until l_row=0
next

p:
if ls_sql<>'' then 
	l_sqlcount+=l_subcount
	ls_ret=uf_execute(ls_sql,la_parm[],ltrans_1)
	if ls_ret<>'' then 
		ls_errtext='uf_execute:'+ls_ret
		goto e
	end if
//	execute immediate :ls_sql using ltrans_1;
//	if ltrans_1.sqlcode=-1 then goto e
	if li_check=1 then 
		if ltrans_1.sqlnrows<>l_subcount then 
			ls_errtext='Has nochanges '
			goto e
		end if
	end if
	l_subcount=0
	ls_sql=''
	l_parmcount=0
	la_parm[]={''}
end if

goto m
m:
//ldw_1.event UpdateEnd(l_rowsinserted,l_rowsupdated,l_rowsdeleted)
return ''

goto e
e:
if ltrans_1.sqlcode=-1 then 
	ls_errtext+=ltrans_1.sqlerrtext+'~r~n'
end if
ls_errtext+='row:'+string(l_sqlcount - l_subcount+1) 
if l_batch>1 then ls_errtext+='~~'+ string(l_sqlcount)
ls_errtext+='~r~n'+ls_sql
return ls_errtext
end function

public function string uf_update (ref datawindow ldw_1, string ls_param, transaction ltrans_1);int li_ret
string ls_errtext
li_ret=ids_temp.create(ldw_1.describe("datawindow.syntax"),ref ls_errtext)
if li_ret=-1 then 
	ls_errtext="Create失败 "+ls_errtext
	goto e
end if
li_ret=ldw_1.sharedata(ids_temp)
if li_ret=-1 then 
	ls_errtext='ShareData失败 '
	goto e
end if
ls_errtext=uf_update(ids_temp,ls_param,ltrans_1) 
ids_temp.sharedataoff() //rowcount=>0
ids_temp.dataobject=''

return ls_errtext

goto e
e:
return ls_errtext
end function

public function string uf_xmlout (ref string ls_text, boolean lb_create, boolean lb_destroy);//{create+}append{+destroy}
string ls_errtext
int i

if lb_create=true then 
	if uf_xmlout_create(ls_errtext)=-1 then goto e
end if
for i=1 to i_listcount
	if ids_list[i].rowcount()=0 then
		if ids_list[i].getsqlselect()='' then 
			ids_list[i].insertrow(0) //导出xml,常数ds默认新增一行
			ib_dsempty[i]=true //标记为空ds
		end if
	end if
next

ls_text=''
uf_xmlout_append(ref ls_text,is_listname[1],ids_list[1],1)

//int li_tempfile
//ls_text=''
//li_tempfile=fileopen("xmlappend.txt",textMode!,read!,shared!)
//filereadex(li_tempfile,ref ls_text)
//fileclose(li_tempfile)

if lb_destroy=true then 
	//销毁数据窗口
	uf_xmlout_destroy()
end if

return ''

e:
return ls_errtext
end function

public function string uf_import (datawindow dd, string ls_inputcols, long l_startrow, string ls_startcolumn, string ls_text);//作用:分析数据窗口选中的矩形 ,矩形覆盖导入
//powerobject dd:datawindow/datastore
//string as_text:要粘贴的字符
//返回''为成功,否则为失败信息

string ls_errtext,ls_lasterr
string ls_cols[],ls_editstyle[]
long l_row,l_rowcount
int i,m,n,li_ret,li_startcolno,li_colno,li_colcount,li_minhcount

int li_texthcount
long l_textrowcount //剪切板文本行数
string ls_rowtext,ls_celltext

int li_selecthcount	/*横排列数*/
long l_selectrowcount //选中行数

string ls_colname,ls_colid

long l_pos
string ls_dwsyntax

string ls_key[]={'insertrow'}
string ls_insertrow

if left(ls_inputcols,len(ls_key[1]))=ls_key[1] then 
	ls_insertrow=uf_cutvalue(ls_inputcols,ls_key[1]+'=',';')
end if

//默认为当前行
if l_startrow<=0 then l_startrow=dd.getrow() 
if ls_insertrow<>'1' and l_startrow>dd.rowcount() then goto e

//默认为当前列
if ls_startcolumn='' then 
	ls_startcolumn=dd.getcolumnname()
else
	ls_colname=dd.describe(ls_startcolumn+".name")
end if

//取列顺序
if ls_inputcols='' then 
	li_colcount=getcolumns(dd,5,ls_cols[]) //返回可编辑的列
else
	li_colcount=getarray(ls_inputcols,ls_cols[],',')
	li_colcount=getcolumns(dd,4,ls_cols[]) //列排序
end if
if li_colcount=0 then goto e

for i=1 to li_colcount
	if ls_cols[i]=ls_colname then 
		li_startcolno=i
		exit
	end if
next
if li_startcolno=0 then li_startcolno=1

l_pos=pos(ls_text,'~r~n')

if l_pos>0 then 
	ls_rowtext=left(ls_text,l_pos - 1)
else
	ls_rowtext=ls_text
end if

li_texthcount=replaceex(ls_rowtext,'~t','~t') + 1 //取首行的列数

li_minhcount=min(li_colcount - li_startcolno + 1,li_texthcount)
string ls_valueslist[]

//messagebox('',li_minhcount)
ls_dwsyntax='release 12;'
ls_dwsyntax+='table('
for i=1 to li_minhcount
	ls_dwsyntax+='~r~n column=(type=char(32766) name=col'+string(i)+' dbname="" )'
	ls_editstyle[i]=dd.describe(ls_cols[i]+".edit.style")
	ls_valueslist[i]=dd.describe(ls_cols[i]+".values")
	if len(ls_valueslist[i])>=2 then 
		if ls_editstyle[i]='ddlb' and dd.describe(ls_cols[i]+".DDLB.AllowEdit")='yes' then ls_valueslist[i]=''
	else
		ls_valueslist[i]=''
	end if
next
ls_dwsyntax+=')'

if ids_temp.create(ls_dwsyntax,ls_errtext)=-1 then 
	ls_errtext='Create : '+ls_errtext
	goto e
end if

//分解字符串
l_textrowcount=ids_temp.importstring(ls_text)
if l_textrowcount=0 then goto e
//messagebox('',l_textrowcount)
//ids_temp.saveas('C:\123.txt',text!,true)
//goto e
//

//dd.setredraw(false)

l_row=l_startrow - 1

for i=1 to l_textrowcount
	
	l_row++
	if l_row>dd.rowcount() then 
		if ls_insertrow<>'1' then goto e //不自动新增行
		if l_row<>dd.dynamic event ue_insertrow(0) then goto e
	end if
	
	//逐个填充
	for m=1 to li_minhcount
		
		//if ids_temp.getitemstatus(i,m,primary!)=NotModified! then continue;
		
		ls_celltext=string(ids_temp.getitemstring(i,m),'')
		
		li_colno=li_startcolno + m - 1
		
		if uf_getmodifiable(dd,l_row,ls_cols[li_colno])=false then continue;	//忽略不可修改的单元格
		
		if uf_setcell(dd,l_row,ls_cols[m])=-1 then goto e //活动单元格
		
		//ls_lasterr=string(l_row)+"/"+ls_cols[m]
		
		if ls_valueslist[m]<>'' then 
			if pos('/'+ls_valueslist[m],'/'+ls_celltext+'~t')=0 and pos('/'+ls_valueslist[m],'~t'+ls_celltext+'/')=0 then 
				//ls_lasterr='值不在下拉列表'
				goto status
			end if
		end if
		if ls_editstyle[m]='checkbox' then 
			li_ret=this.uf_setitem(dd,l_row,ls_cols[m],ls_celltext,100)
			if li_ret=-1 then goto status
		else
			li_ret=dd.settext(ls_celltext)
			if li_ret=1 then li_ret=dd.accepttext()
			if li_ret=-1 then goto status
		end if
		
		continue;
		
		status:
		ls_errtext='第'+string(l_row)+'行的'+dd.describe(ls_cols[m]+"_t.text")+'无效 "'+ls_celltext+'" '
		goto e
	next
	
next

if ls_errtext<>'' then ls_errtext+='设置失败!'

e:
//dd.setredraw(true)
return ls_errtext
//

end function

public function integer uf_setcell (datawindow dd, long row, string column);if string(column,'')='' or row<=0 then goto e
if dd.describe(column+".type")<>'column' then goto e

if dd.getrow()<>row or dd.getcolumnname()<>column then 
	if dd.accepttext()=-1 then goto e
	if  dd.getrow()<>row then 
		if dd.setrow(row)=-1 then goto e
		if dd.getrow()<>row then goto e
	end if
	if dd.getcolumnname()<>column then
		if dd.setcolumn(column)=-1 then goto e
		if dd.getcolumnname()<>column then goto e
	end if
end if

return 1
e:
return -1
end function

public function string valuescase (string fieldname, string fieldtype, string values, string showtype);string ls_temparray[]
int l_count,i,li_pos
string ls_casestr

if fieldtype='char' then;fieldtype='~'';else; fieldtype=''; end if
if showtype='char' then;showtype='~'';else; showtype=''; end if

l_count=getarray(values,ref ls_temparray[],'/')
ls_casestr='case '
for i=1 to l_count
	li_pos=pos(ls_temparray[i],'~t')
	ls_casestr+="when "+fieldname+"="+fieldtype+mid(ls_temparray[i],li_pos+1)+fieldtype+" then "+showtype+left(ls_temparray[i],li_pos - 1)+showtype+" "
next
ls_casestr+='end '

return ls_casestr
end function

public function string uf_sql_explain (character ls_sql[], ref string ls_newsql, ref string ls_aliasname[], ref string ls_expression[]);//char ls_sql[]
//ls_sql[]="select top 10000 1    a,2 as b,3 as ')c',d=4,no_s=t1.nos,postdate='a' + 'convert(date,''+t1.postdate)',abc,cusno=t1.cusno,maker=t1.maker,makedate=t1.makedate,chflags=t1.chflags,storecusno=t1.storecusno,bz=t1.bz,luid=t1.luid,lutime=t1.lutime, &
//	storecusname=(select names from warehouse t11 where t11.cusno=t1.storecusno), &
//	cusname=(select names from warehouse t12 where t12.cusno=t1.cusno),1 as e &
//from warehouse t0,salesorder t1 &
//where t0.types=3 and t1.cusno=t0.cusno  &
//order by makedate desc "


long l_index,l_length
string ls_words[]
long i,l_explevel,l_pos_from
string ls_temp,ls_text,ls_singleword,ls_topstr
boolean lb_select,lb_top,lb_fields,lb_from,lb_quot
string ls_types,ls_quot

l_length=upperbound(ls_sql[])
//ls_types='select'
//i++
//ls_words[i]=''
for l_index=1 to l_length //1
	ls_temp=ls_sql[l_index]
	
	if ls_temp="'" or ls_temp='"' then //2
		if ls_quot='' then //3
			ls_quot=ls_temp
		elseif ls_quot=ls_temp then //3
			ls_quot=''
		end if //3
		goto append
	end if //2
	
	if ls_quot<>'' then 
		goto append
	end if
	
	if ls_temp='('  then 
		l_explevel++
		goto append
	end if
	if ls_temp=')' then 
		if l_explevel=0 then 
			messagebox('','缺少左括号:'+string(l_index))
			return ''
		end if
		l_explevel=l_explevel - 1
		goto append
		//if l_explevel=0 then goto nex
	end if
	
	if l_explevel>0 then 
		goto append
	end if
	
	if ls_temp=',' then 
		if ls_types='SELECT' then ls_types='FIELDS'
		if ls_types='FIELDS' then
			ls_text+=ls_singleword
			i++
			ls_words[i]=trim(ls_text,true)
			goto nex
		end if
	end if
	
	if trim(ls_temp,true)='' then //2
		//if ls_singleword='' then continue;
		if ls_types='' then //3
			if upper(ls_singleword)='SELECT' then //4
				//ls_words[i]=ls_singleword
				ls_types='SELECT'
				ls_singleword=''
				continue;
			end if //4
		elseif ls_types='SELECT' then //3
			if upper(ls_singleword)='TOP' then //4
				//ls_words[i]=ls_singleword
				ls_types='TOP'
				ls_singleword=''
				continue;
			else //4 //无TOP,继续检查FIELDS
				ls_types='FIELDS'
			end if //4
		end if //3
		
		if ls_types='TOP'  then //3 //and ls_text<>'TOP'
			//ls_words[i]=ls_singleword
			ls_topstr='TOP '+ls_singleword
			ls_types='FIELDS'
			ls_singleword=''
			continue;
		elseif ls_types='FIELDS' then //3
			if upper(ls_singleword)='FROM'  then //4 //FROM 或无FROM
				l_pos_from=l_index
				i++
				ls_words[i]=trim(ls_text,true)
//				i++
//				ls_words[i]=ls_singleword
				ls_types=ls_singleword
				exit
			end if //4
		end if //3
		
	end if //2
	
	//if match(ls_temp,'[=._0-9A-Za-z]')=true then 
//		ls_words[i]+=ls_temp
//		ls_text+=ls_temp
//		continue;
	//end if
	
	goto append
	append:
	if trim(ls_temp,true)=''  then 
		ls_text+=ls_singleword+ls_temp
		ls_singleword=''
	else
		ls_singleword+=ls_temp
	end if
	
	if l_index=l_length then
		ls_text+=ls_singleword
		ls_singleword=''
		i++
		ls_words[i]=trim(ls_text,true)
	end if
	
	continue;
	
	goto nex
	nex:
//	i++
//	ls_words[i]=''
	ls_text=''
	ls_singleword=''
next

ls_temp=''

string ls_dbname,ls_alias,ls_fieldstr
long l_count
ls_newsql="SELECT "+ls_topstr+' '
l_count=upperbound(ls_words[])
l_index=1
//if ls_words[1]='top' then 
//	ls_newsql+=' '+ls_words[l_index]+' '+ls_words[l_index+1]+' '
//	l_index=3
//end if
for l_index=l_index to l_count
	uf_sql_fields(ls_words[l_index],ls_dbname,ls_alias)
	ls_expression[l_index]=ls_dbname
	ls_aliasname[l_index]=ls_alias
	if ls_fieldstr='' then 
		ls_fieldstr+=ls_dbname+' as '+ls_alias
	else
		ls_fieldstr+=','+ls_dbname+' as '+ls_alias
	end if
next
ls_newsql+=ls_fieldstr
if l_pos_from<>0 and l_pos_from<l_length then //拼接from后的内容
	ls_newsql+=' FROM '+mid(ls_sql,l_pos_from+1)
end if

end function

public function string uf_sql_explain (character ls_sql[], string ls_param);string ls_newsql
string ls_a[],ls_b[]
uf_sql_explain(ls_sql[],ref ls_newsql,ref ls_a[], ref ls_b[])
return ls_newsql
end function

public function string tovalue (readonly any la_value, readonly string ls_op);string ls_value
if ls_op='where' then 
	if isnull(la_value) then return ' is NULL'
	choose case classname(la_value)
		case 'string'
			ls_value=la_value
			replaceex(ls_value,'~'','~'~'')
			return "='"+ls_value+"'"
		case 'datetime'
			return "='"+string(la_value,'YYYY-MM-DD hh:mm:ss.fff')+"'"
		case else
			return '='+string(la_value)
	end choose
else
	if isnull(la_value) then return 'NULL'
	choose case classname(la_value)
		case 'string'
			ls_value=la_value
			replaceex(ls_value,'~'','~'~'')
			return "'"+ls_value+"'"
		case 'datetime'
			return "'"+string(la_value,'YYYY-MM-DD hh:mm:ss.fff')+"'"
		case else
			return string(la_value)
	end choose
end if


end function

public function string uf_execute (string as_sql, any a_parm[], transaction ltrans);int i,li_parmcount
string ls_errtext
long l_sqlnrows

PREPARE SQLSA FROM :as_sql using ltrans; 
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

if ltrans.sqlcode=-1 then ls_errtext=ltrans.sqlerrtext+'~r~n'
l_sqlnrows=ltrans.sqlnrows
CLOSE c1;
ltrans.sqlnrows=l_sqlnrows

return ls_errtext
end function

on u_derek_v2_dd.create
call super::create
this.ids_temp=create ids_temp
this.ids=create ids
TriggerEvent( this, "constructor" )
end on

on u_derek_v2_dd.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ids_temp)
destroy(this.ids)
end on

type ids_temp from datastore within u_derek_v2_dd descriptor "pb_nvo" = "true" 
end type

on ids_temp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_temp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror;is_dberror=string(sqldbcode,'')+' '+string(sqlerrtext,'')+' '+string(sqlsyntax,'')
return 1  //不显示出错信息
end event

event itemerror;is_dberror=string(row,'')+'/'+string(dwo.name,'')+':'+string(data,'')+' 未通过验证!'
return 1  //不显示出错信息
end event

type ids from datastore within u_derek_v2_dd descriptor "pb_nvo" = "true" 
end type

on ids.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror;is_dberror=string(sqldbcode,'')+' '+string(sqlerrtext,'')+' '+string(sqlsyntax,'')
return 1  //不显示出错信息
end event

event error;is_dberror+=errortext 
end event

event sqlpreview;if request=PreviewFunctionUpdate!  then
	if ib_ufupdate then
		ibb_sql+=blob(sqlsyntax+' ~r~n')
		return 2
	end if
end if
end event

event itemerror;is_dberror=string(row,'')+'/'+string(dwo.name,'')+':'+string(data,'')+' 未通过验证!'
return 1  //不显示出错信息
end event

