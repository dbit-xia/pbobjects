$PBExportHeader$u_sybase_ct.sru
forward
global type u_sybase_ct from nonvisualobject
end type
type cs_datafmt from structure within u_sybase_ct
end type
type cs_daterec from structure within u_sybase_ct
end type
type cs_servermsg from structure within u_sybase_ct
end type
end forward

type cs_datafmt from structure
	byte		name[132]
	long		namelen
	long		datatype
	long		format
	long		maxlength
	long		scale
	long		precision
	long		status
	long		count
	long		usertype
	long		cs_local
end type

type cs_daterec from structure
	long		dateyear
	long		datemonth
	long		datedmonth
	long		datedyear
	long		datedweek
	long		datehour
	long		dateminute
	long		datesecond
	long		datemsecond
	long		datetzone
end type

type cs_servermsg from structure
	ULong		msgnumber
	long		state
	long		severity
	character		text[1024]
	long		textlen
	character		svrname[132]
	long		svrnlen
	character		proc[132]
	long		proclen
	long		line
	long		status
	character		sqlstate[8]
	long		sqlstatelen
end type

global type u_sybase_ct from nonvisualobject
end type
global u_sybase_ct u_sybase_ct

type prototypes
FUNCTION long ct_cmd_alloc(Long connection, REF Long cmd) LIBRARY "libsybct.dll" alias for "ct_cmd_alloc;ansi"
FUNCTION Long ct_command(Long cmd, Long ltype, String Buf, Long buflen, Long option)LIBRARY "libsybct.dll" alias for "ct_command;ansi"
FUNCTION Long ct_send(Long cmd) LIBRARY "libsybct.dll" alias for "ct_send;ansi"
FUNCTION Long ct_results(Long cmd, Ref Long resulttype) LIBRARY "libsybct.dll" alias for "ct_results;ansi"
FUNCTION Long ct_fetch(Long cmd, Long ltype, Long offset, Long option, Ref Long count) LIBRARY "libsybct.dll" alias for "ct_fetch;ansi"
FUNCTION Long ct_res_info(Long cmd, Long operation, Ref Long buf, Long buflen, Ref Long outlen) LIBRARY "libsybct.dll" alias for "ct_res_info;ansi"
FUNCTION Long ct_cmd_drop(Long cmd) LIBRARY "libsybct.dll" alias for "ct_cmd_drop;ansi"
FUNCTION Long ct_describe(Long cmd, Long item, REF CS_DATAFMT datafmt) LIBRARY "libsybct.dll"  alias for "ct_describe;ansi"
FUNCTION Long ct_cancel(Long connection, Long cmd, Long ltype) LIBRARY "libsybct.dll" alias for "ct_cancel;ansi"
FUNCTION Long ct_con_props(Long connection, Long action, Long property, REF Long buffer, LONG buflen, REF Long outlen) LIBRARY "libsybct.dll" alias for "ct_con_props;ansi"
FUNCTION Long cs_dt_crack(Long context, Long datetype, REF blob buf, REF CS_DATEREC d) LIBRARY "libcs.dll"  alias for "cs_dt_crack;ansi"
FUNCTION Long ct_diag(Long connection, Long operation, Long ltype, Long index, Ref cs_servermsg buffer) LIBRARY "libsybct.dll" alias for "ct_diag;ansi"
FUNCTION Long ct_options(Long connection, Long action, Long option, Ref Long param, Long paramlen, Long outlen) LIBRARY "libsybct.dll" alias for "ct_options;ansi"
//FUNCTION Long cs_getformat(Long cmd, Long item, Ref blob buf, Long buf_len, Ref long outlen) LIBRARY "libsybct.dll" alias for "cs_getformat;ansi"
FUNCTION Long ct_bind(Long cmd, Long item,ref CS_DATAFMT datafmt, Ref any buf, Ref Long outputlen, Ref int indicator) LIBRARY "libsybct.dll" alias for "ct_bind;ansi"
FUNCTION Long ct_bind(Long cmd, Long item,ref CS_DATAFMT datafmt, Ref blob buf, Ref Long outputlen, Ref int indicator) LIBRARY "libsybct.dll" alias for "ct_bind;ansi"
FUNCTION Long ct_bind(Long cmd, Long item,ref CS_DATAFMT datafmt, Ref int buf, Ref Long outputlen, Ref int indicator) LIBRARY "libsybct.dll" alias for "ct_bind;ansi"
FUNCTION Long ct_bind(Long cmd, Long item,ref CS_DATAFMT datafmt, Ref long buf, Ref Long outputlen, Ref int indicator) LIBRARY "libsybct.dll" alias for "ct_bind;ansi"
FUNCTION Long ct_bind(Long cmd, Long item,ref CS_DATAFMT datafmt, Ref longlong buf, Ref Long outputlen, Ref int indicator) LIBRARY "libsybct.dll" alias for "ct_bind;ansi"
FUNCTION Long ct_bind(Long cmd, Long item,ref CS_DATAFMT datafmt, Ref dec buf, Ref Long outputlen, Ref int indicator) LIBRARY "libsybct.dll" alias for "ct_bind;ansi"
FUNCTION Long ct_bind(Long cmd, Long item,ref CS_DATAFMT datafmt, Ref string buf, Ref Long outputlen, Ref int indicator) LIBRARY "libsybct.dll" alias for "ct_bind;ansi"

end prototypes
type variables
//command props
CONSTANT Long CS_PARENT_HANDLE = 9130

//boolean constants
CONSTANT Long CS_TRUE = 1
CONSTANT Long CS_FALSE = 0

//connection options
CONSTANT Long CS_OPT_SHOWPLAN = 5013
CONSTANT Long CS_OPT_NOEXEC = 5014

//Result types from ct_results().
CONSTANT Long CS_ROW_RESULT = 4040
CONSTANT Long CS_CURSOR_RESULT = 4041
CONSTANT Long CS_PARAM_RESULT = 4042
CONSTANT Long CS_STATUS_RESULT = 4043
CONSTANT Long CS_MSG_RESULT = 4044
CONSTANT Long CS_COMPUTE_RESULT = 4045
CONSTANT Long CS_CMD_DONE = 4046
CONSTANT Long CS_CMD_SUCCEED = 4047
CONSTANT Long CS_CMD_FAIL = 4048
CONSTANT Long CS_ROWFMT_RESULT = 4049
CONSTANT Long CS_COMPUTEFMT_RESULT = 4050
CONSTANT Long CS_DESCRIBE_RESULT = 4051

//ct_diag() and cs_diag() type flags.
CONSTANT Long CS_SERVERMSG_TYPE = 4701
CONSTANT Long CS_ALLMSG_TYPE = 4702
CONSTANT Long SQLCA_TYPE = 4703

//Flags for getting result info using ct_res_info().
CONSTANT Long CS_ROW_COUNT = 800
CONSTANT Long CS_CMD_NUMBER = 801
CONSTANT Long CS_NUM_COMPUTES = 802
CONSTANT Long CS_NUMDATA = 803
CONSTANT Long CS_ORDERBY_COLS = 804
CONSTANT Long CS_NUMORDERCOLS = 805
CONSTANT Long CS_MSGTYPE = 806
CONSTANT Long CS_BROWSE_INFO = 807
CONSTANT Long CS_TRANS_STATE = 808
CONSTANT Long CS_NO_COUNT = -1

//Define basic default types.
CONSTANT Long CS_NULLTERM = -9
CONSTANT Long CS_UNUSED = -99999

//ct_command() command types.
CONSTANT Long CS_LANG_CMD = 148

//Define the core return codes.
CONSTANT Long CS_SUCCEED = 1
CONSTANT Long CS_FAIL = 0
CONSTANT Long CS_ROW_FAIL = -203

//datatypes we support.
CONSTANT Long CS_ILLEGAL_TYPE = -1
CONSTANT Long CS_CHAR_TYPE = 0
CONSTANT Long CS_BINARY_TYPE = 1
CONSTANT Long CS_LONGCHAR_TYPE = 2
CONSTANT Long CS_LONGBINARY_TYPE = 3
CONSTANT Long CS_TEXT_TYPE = 4
CONSTANT Long CS_IMAGE_TYPE = 5
CONSTANT Long CS_TINYINT_TYPE = 6
CONSTANT Long CS_SMALLINT_TYPE = 7
CONSTANT Long CS_INT_TYPE = 8
CONSTANT Long CS_REAL_TYPE = 9
CONSTANT Long CS_FLOAT_TYPE = 10
CONSTANT Long CS_BIT_TYPE = 11
CONSTANT Long CS_DATETIME_TYPE = 12
CONSTANT Long CS_DATETIME4_TYPE = 13
CONSTANT Long CS_MONEY_TYPE = 14
CONSTANT Long CS_MONEY4_TYPE = 15
CONSTANT Long CS_NUMERIC_TYPE = 16
CONSTANT Long CS_DECIMAL_TYPE = 17
CONSTANT Long CS_VARCHAR_TYPE = 18
CONSTANT Long CS_VARBINARY_TYPE = 19
CONSTANT Long CS_LONG_TYPE = 20
CONSTANT Long CS_SENSITIVITY_TYPE = 21
CONSTANT Long CS_BOUNDARY_TYPE = 22
CONSTANT Long CS_VOID_TYPE = 23
CONSTANT Long CS_USHORT_TYPE = 24
CONSTANT Long CS_UNICHAR_TYPE = 25
CONSTANT Long CS_BLOB_TYPE = 26
CONSTANT Long CS_DATE_TYPE = 27
CONSTANT Long CS_TIME_TYPE = 28

//Cancel types.
CONSTANT Long CS_CANCEL_ALL = 6001

//Action flags used.
CONSTANT Long CS_GET = 33
CONSTANT Long CS_SET = 34
CONSTANT Long CS_CLEAR = 35
CONSTANT Long CS_INIT = 36
CONSTANT Long CS_STATUS = 37

CONSTANT Long CS_FMT_UNUSED = 0
CONSTANT Long CS_FMT_NULLTERM	= 1
CONSTANT Long CS_FMT_PADBLANK = 4

end variables

forward prototypes
public subroutine uf_diag ()
public function string uf_getdatatype (integer ai_datatype)
public function string uf_getresult (long l_dbhandle, string ls_sql, ref string ls_data)
public function string uf_fetchtable (long ll_command, ref string ls_table)
end prototypes

public subroutine uf_diag ();//long ll_servercount,ll_return
//transaction atr
////Get message count
//ll_return = ct_diag_status(atr.DBHandle(), CS_STATUS, CS_SERVERMSG_TYPE, CS_UNUSED, ll_servercount)
//
//IF ll_servercount > 0 THEN
//	FOR ll_index = 1 TO ll_servercount
//		ll_return = ct_diag(atr.DBHandle(), CS_GET, CS_SERVERMSG_TYPE, ll_index, server_msg)
//	NEXT
//END IF
//
////Clear the structures of existing error messages
//ct_diag(atr.DBHandle(), CS_CLEAR, CS_SERVERMSG_TYPE, CS_UNUSED, server_msg)
end subroutine

public function string uf_getdatatype (integer ai_datatype);CHOOSE CASE ai_datatype
	CASE CS_MONEY_TYPE, CS_MONEY4_TYPE, CS_DECIMAL_TYPE, CS_FLOAT_TYPE, CS_NUMERIC_TYPE
			RETURN 'decimal'
	CASE CS_TINYINT_TYPE, CS_SMALLINT_TYPE
			RETURN 'integer'
	CASE CS_REAL_TYPE
			RETURN 'real'
	CASE CS_LONG_TYPE, CS_BIT_TYPE, CS_INT_TYPE
			RETURN 'long'
	CASE CS_CHAR_TYPE, CS_LONGCHAR_TYPE, CS_TEXT_TYPE, CS_VARCHAR_TYPE
			RETURN 'string'
	CASE CS_DATE_TYPE
			RETURN 'date'
	CASE CS_DATETIME_TYPE, CS_DATETIME4_TYPE
			RETURN 'datetime'
	CASE CS_TIME_TYPE
			RETURN 'time'
	CASE CS_BINARY_TYPE, CS_LONGBINARY_TYPE, CS_VARBINARY_TYPE
			RETURN 'binary'
	CASE ELSE
			RETURN 'string'
END CHOOSE
end function

public function string uf_getresult (long l_dbhandle, string ls_sql, ref string ls_data);long ll_command,ll_resulttype
long l_ret
string ls_errtext

if l_dbhandle=0 then l_dbhandle=SQLCA.DBHandle()

//Allocate command structure
l_ret=ct_cmd_alloc(l_dbhandle, ll_command)
if l_ret<>1 then ls_errtext+='ct_cmd_alloc:'+string(l_ret)
//Tie an SQL statement (ls_sql) to the command structure allocated above.
l_ret=ct_command(ll_command, CS_LANG_CMD, ls_sql, CS_NULLTERM, CS_UNUSED)
if l_ret<>1 then ls_errtext+='ct_command:'+string(l_ret)
//Send the command to the database
l_ret=ct_send(ll_command)
if l_ret<>1 then ls_errtext+='ct_send:'+string(l_ret)

l_ret=ct_results(ll_command, ll_resulttype)
if l_ret<>1 then ls_errtext+='ct_results:'+string(l_ret)
//Loop through all the result sets
DO WHILE  l_ret= CS_SUCCEED
	CHOOSE CASE ll_resulttype
		CASE CS_ROW_RESULT
			uf_fetchtable(ll_command,ls_data)
			//Rows returned from and SQL Select statement
		CASE CS_CURSOR_RESULT
			//Cursor results
		CASE CS_PARAM_RESULT
			//Called when a stored procedure has an output variable
		CASE CS_STATUS_RESULT
			//Return status. E.g. result of compiling a Stored Procedure
		CASE CS_MSG_RESULT
		CASE CS_COMPUTE_RESULT
			//Rows returned from an SQL Compute statement
		CASE CS_CMD_DONE
			//Results are done.
		CASE CS_CMD_SUCCEED
			//No special result returned just a success indicator
		CASE CS_CMD_FAIL
			//Database error - error executing sent SQL.
		CASE CS_ROWFMT_RESULT
		CASE CS_COMPUTEFMT_RESULT
		CASE CS_DESCRIBE_RESULT
	END CHOOSE
	l_ret=ct_results(ll_command, ll_resulttype)
LOOP

//Drop/Destroy the command structure
goto e
e:
if ll_command>0 then 
	l_ret=ct_cmd_drop(ll_command)
	if l_ret<>1 then ls_errtext+='ct_cmd_drop:'+string(l_ret)
end if
return ls_errtext
end function

public function string uf_fetchtable (long ll_command, ref string ls_table);long ll_colcount,ll_index=1,ll_outlen,ll_null,ll_rows,l_ret,l_row
int li_out2[]
byte lb_ref[],lb_null[],lb_reverse[],lb_temp[]
long l_out[],l_out2
cs_datafmt datafmt[]
string ls_datatype[],ls_data
blob lany_ref[],lblob_value
longlong ld_temp
int i
int li_hh,li_ss,li_mm
date ld_date

//get column count
l_ret=ct_res_info(ll_command, CS_NUMDATA, ll_colcount, 1000, ll_outlen)

l_out[ll_colcount]=0
li_out2[ll_colcount]=0

//Loop through each column so we can bind it to a program variable
FOR ll_index = 1 TO ll_colcount
	//get column information (size, type etc...)
	l_ret=ct_describe(ll_command, ll_index, datafmt[ll_index])

	//of_GetDataType contains code found in listing 3
	ls_datatype[ll_index] = uf_getdatatype(datafmt[ll_index].datatype)
	
	lb_temp[]=lb_null[] //重置
	lb_temp[datafmt[ll_index].maxlength]=0 //扩充
	lany_ref[ll_index]=blob(lb_temp[]) //绑定大小
	
	l_ret=ct_bind(ll_command,ll_index , datafmt[ll_index], lany_ref[ll_index], l_out[ll_index],li_out2[ll_index])
	
NEXT

//Fetch first row
l_ret=ct_fetch(ll_command, CS_UNUSED, CS_UNUSED, CS_UNUSED, ll_rows)

DO WHILE l_ret= CS_SUCCEED
	l_row++
	
	FOR ll_index = 1 TO ll_colcount
		ls_data=''
		//提取指定大小的值
		lblob_value=BlobMid(lany_ref[ll_index],1,l_out[ll_index])
		//lb_ref[]=getbytearray(lblob_value)
		CHOOSE CASE ls_datatype[ll_index]
			case 'string'
				ls_data=string(lblob_value,encodingansi!)
			case 'long','integer' //固定大小,4b,8b,16b 可以用函数直接转换
				ls_data=string(long(lblob_value))
			case 'decimal' //可变大小?b,程序转换
				//16位可用下列方法
				lb_ref[]=getbytearray(lblob_value)
//				for i=l_out[ll_index] to 3 step -1
//					lb_reverse[l_out[ll_index] - i + 1]=lb_ref[i]
//				next
//				lb_reverse[l_out[ll_index]]=lb_ref[2]
//				ls_data+=string(dec(Blob(lb_reverse[])))+',' //非等长,不能使用此方法
				
				/*小数位数 lb_ref[2]=lb_ref[1] - 10*/
				ld_temp=0
				for i=3 to l_out[ll_index]
					if lb_ref[i]=0 then continue;
					ld_temp+=lb_ref[i] * 256.0 ^(l_out[ll_index] - i)
				next
				ls_data=string(ld_temp / 10.0^lb_ref[2],'0.'+fill('0',lb_ref[2]))
			case 'datetime','date','time'
				lb_ref[]=getbytearray(lblob_value)
				
				ld_temp=0
				for i=1 to 4 //前4位为日期
					if lb_ref[i]=0 then continue;
					ld_temp+=lb_ref[i] * 256.0 ^(i - 1)
				next
				
				ld_date=1900-01-01
				//RelativeDate第二个参数为int,最大为32767,所以分次计算
				do while(ld_temp>32767)
					ld_date=RelativeDate (ld_date ,32767) //
					ld_temp = ld_temp - 32767
				loop
				ld_date=RelativeDate (ld_date ,ld_temp)
				
				ls_data+=string(ld_date,'YYYY-MM-DD')+' '
				
				ld_temp=0
				for i=5 to l_out[ll_index] //第5位开始为时间
					if lb_ref[i]=0 then continue;
					ld_temp+=lb_ref[i] * 256.0 ^(i - 5)
				next
				
				li_hh=int(ld_temp / (300 * 60 * 60 ))
				ld_temp=mod(ld_temp , (300 * 60 * 60 ))
				li_mm=int(ld_temp / (300 * 60 ))
				ld_temp=mod(ld_temp , (300 * 60))
				li_ss=int(ld_temp / (300 ))
				ld_temp=mod(ld_temp , 300) * 10 / 3 //转换成毫秒
				
				ls_data=string(time(li_hh,li_mm,li_ss),'hh:mm:ss.')+string(ld_temp,'000')
				
		end choose
		ls_table+=ls_data+'~t'	
	next
	ls_table+='~r~n'	

	//fetch next row
	l_ret=ct_fetch(ll_command, CS_UNUSED, CS_UNUSED, CS_UNUSED, ll_rows)
LOOP

return ''
end function

on u_sybase_ct.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_sybase_ct.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

