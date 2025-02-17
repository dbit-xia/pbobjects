$PBExportHeader$u_derek_pipeline.sru
forward
global type u_derek_pipeline from pipeline
end type
type ids from datastore within u_derek_pipeline
end type
end forward

global type u_derek_pipeline from pipeline
ids ids
end type
global u_derek_pipeline u_derek_pipeline

type variables
boolean ib_cancel
long il_rowscommit=100
end variables
forward prototypes
public function string uf_rowscopy (transaction atr_source, transaction atr_destin, string as_sql1, string as_sql2, string as_tablename, string as_piptype)
public function string uf_geterror (integer ai_code)
public function string uf_gensyntax (transaction atr_destin, string as_sql1, string as_sql2, ref string as_tablename, string as_piptype, ref string as_err)
public function integer uf_cancel ()
end prototypes

public function string uf_rowscopy (transaction atr_source, transaction atr_destin, string as_sql1, string as_sql2, string as_tablename, string as_piptype);//数据复制,
//参数:源连接,目的连接,源SQL,目的SQL,更新表名,传输类型(create(add),replace(drop/add),refash(delete/insert),append(insert),update(update/insert))
//返回值:''成功,其它为失败信息
string ls_syntax
string ls_err
int li_ret

ls_syntax=uf_gensyntax(atr_destin,as_sql1,as_sql2,as_tablename,as_piptype,ls_err)
syntax=ls_syntax

if len(ls_err)<>0 then 
	return ls_err
else
	ib_cancel=false
	li_ret=start(atr_source,atr_destin,ids)
	
	choose case li_ret
		case 1 
			if ib_cancel=true then 
				ls_err='传输中断!'
			else
				ls_err=''
			end if
		case -10
			ls_err=ids.describe("datawindow.data")
		case else
			ls_err=uf_geterror(li_ret)
	end choose
	
end if

return ls_err


end function

public function string uf_geterror (integer ai_code);choose case  ai_code
	case -1  
		return "Pipe open failed"
	case -2
		return "Too many columns"
	case -3   
		return "Table already exists"
	case -4   
		return "Table does not exist"
	case -5   
		return "Missing connection"
	case -6   
		return "Wrong arguments"
	case -7   
		return "Column mismatch"
	case -8   
		return "Fatal SQL error in source"
	case -9   
		return "Fatal SQL error in destination"
	case -10  
		return "Maximum number of errors exceeded"
	case -12  
		return "Bad table syntax"
	case -13 
		return "Key required but not supplied"
	case -15 
		return "Pipe already in progress"
	case -16  
		return "Error in source database"
	case -17  
		return "Error in destination database"
	case -18  
		return "Destination database is read-only"
	case 1
		return ''
	case else
		return string(ai_code)
end choose

end function

public function string uf_gensyntax (transaction atr_destin, string as_sql1, string as_sql2, ref string as_tablename, string as_piptype, ref string as_err);string ls_colums1,ls_colums2
string ls_ddsyntax,ls_dderr,ls_pipsyntax
string ls_ddcoltypes[],ls_dbnames[],ls_ddcoltypes2[]
int li_pos1,li_pos2,i,li_pos
int li_len1,li_len2,li_len3,li_len4

string ls_starts[]
string ls_ends[]

ls_starts[1]='column=(type='
ls_ends[1]=' '
ls_starts[2]='dbname="'
ls_ends[2]='")'




//datastore lds
ls_ddsyntax=atr_destin.SyntaxFromSQL ( as_sql2, '', ls_dderr )
if ls_ddsyntax='' then //得到数据窗口语法错误
	as_err=ls_dderr
	goto e
end if

li_pos2=0
i=0

li_pos1=pos(ls_ddsyntax,ls_starts[1],1)

do while(li_pos1>0)
	
	i++
	li_pos2=pos(ls_ddsyntax,ls_ends[1],li_pos1 + len(ls_starts[1]))
	ls_ddcoltypes[i]=mid(ls_ddsyntax,li_pos1 + len(ls_starts[1]),li_pos2  - li_pos1 - len(ls_starts[1]))
//	messagebox('',ls_ddcoltypes[i])
	
	li_pos=pos(ls_ddcoltypes[i],'(')
	if li_pos>0 then 
		ls_ddcoltypes2[i]=mid(ls_ddcoltypes[i],1,li_pos - 1)
	else
		ls_ddcoltypes2[i]=ls_ddcoltypes[i]
	end if
	
	li_pos1=pos(ls_ddsyntax,ls_starts[2],li_pos2 + len(ls_ends[1]))
	li_pos2=pos(ls_ddsyntax,ls_ends[2],li_pos1 + len(ls_starts[2]))
	ls_dbnames[i]=mid(ls_ddsyntax,li_pos1 + len(ls_starts[2]),li_pos2  - li_pos1 - len(ls_starts[2]))
	
//	messagebox('',ls_dbnames[i])
	
	
	ls_colums1+='COLUMN(type='+ls_ddcoltypes2[i]+',name="'+ls_dbnames[i]+'",dbtype="'+ls_ddcoltypes[i]+'",nulls_allowed=yes)'+' ~r~n'
	
	ls_colums2+='COLUMN(type='+ls_ddcoltypes2[i]+',name="'+ls_dbnames[i]+'",dbtype="'+ls_ddcoltypes[i]+'",nulls_allowed=yes,nulls_allowed=yes,default_value="NULL")'+' ~r~n'
	
	li_pos1=pos(ls_ddsyntax,ls_starts[1],li_pos2 + len(ls_ends[2]))
	

loop 

ls_pipsyntax='PIPELINE(source_connect=conn1,destination_connect=conn2,type='+as_piptype+',commit='+string(il_rowscommit)+',errors=1) ~r~n'+&
 'SOURCE(name="'+as_tablename+'",'+ls_colums1+')~r~n'+&
 'RETRIEVE(statement=" '+as_sql1+'")~r~n'+&
 'DESTINATION(name="'+as_tablename+'",'+ls_colums2+')'


//messagebox('',ls_pipsyntax)

e:
return ls_pipsyntax
end function

public function integer uf_cancel ();if cancel()=1 then
	ib_cancel=true
	return 1
end if

return -1
end function

on u_derek_pipeline.create
call super::create
this.ids=create ids
TriggerEvent( this, "constructor" )
end on

on u_derek_pipeline.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ids)
end on

type ids from datastore within u_derek_pipeline descriptor "pb_nvo" = "true" 
end type

on ids.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

