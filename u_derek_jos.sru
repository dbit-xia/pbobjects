$PBExportHeader$u_derek_jos.sru
forward
global type u_derek_jos from internetresult
end type
type md5_ctx from structure within u_derek_jos
end type
type ds_params from datastore within u_derek_jos
end type
end forward

type md5_ctx from structure
	byte		a[8]
	byte		b[16]
	byte		c[64]
	byte		d[16]
end type

global type u_derek_jos from internetresult
event type integer ue_internetdata ( ref blob data )
ds_params ds_params
end type
global u_derek_jos u_derek_jos

type prototypes
SUBROUTINE MD5Init  (ref md5_ctx lpContext ) Library "cryptdll.dll" alias for "MD5Init;ansi"
SUBROUTINE MD5Final (ref md5_ctx lpContext ) Library "cryptdll.dll" alias for "MD5Final;ansi"
SUBROUTINE MD5Update (ref md5_ctx lpContext ,ulong lpBuffer,ulong BufSize ) Library "cryptdll.dll" alias for "MD5Update;ansi"
SUBROUTINE MD5Update (ref md5_ctx lpContext,blob lpBuffer,ulong BufSize ) Library "cryptdll.dll" alias for "MD5Update;ansi"

end prototypes

type variables

protected blob ib_result
//https://oauth.jd.com/oauth/authorize?response_type=code&client_id=F264860935BE49A10BD3650A20C4BF23&redirect_uri=http%3a%2f%2f121.41.116.8%2frest.aspx%3f&state=YOUR_CUSTOM_CODE
/*state=YOUR_CUSTOM_CODE&code=R3rOzq*/
//https://oauth.jd.com/oauth/token?grant_type=authorization_code&client_id=F264860935BE49A10BD3650A20C4BF23&redirect_uri=http%3a%2f%2f121.41.116.8%2frest.aspx%3f&code=624wZJ&client_secret=063f9e50f9ca4685b3898621db70176b
/*
{
  "access_token": "4159c111-b906-474b-919d-6362a450b1e8",
  "code": 0,
  "expires_in": 86399,
  "refresh_token": "c0f64c92-9b66-45b2-81e5-d8788eee0f1c",
  "time": "1429879237622",
  "token_type": "bearer",
  "uid": "2993645475",
  "user_nick": "A啦Dbit"
}*/

string app_url="http://gw.api.jd.com/routerjson?" 
string app_key="F264860935BE49A10BD3650A20C4BF23"
string app_secret="063f9e50f9ca4685b3898621db70176b"
string access_token='4159c111-b906-474b-919d-6362a450b1e8' //="8612ca7a98f84a3e9cdde3358e001454"


end variables
forward prototypes
public function integer internetdata (blob data)
public function string decto (decimal ad_dec, readonly unsignedinteger aui_sys)
public function string replace (string as_text, string as_str1, string as_str2)
public function string hexencode (string as_text, readonly encoding ae_encode)
public function string urlencode (character as_text[], encoding ae_encode)
public function integer hexencode (ref byte lb_array[], ref character lc_result[])
public function string uf_md5string (ref blob ls_string, ref string ls_result)
public subroutine uf_params (string ls_names[], string ls_values[])
public subroutine uf_param (string ls_name, string ls_value)
public subroutine uf_params_reset ()
public function string uf_urldata ()
public subroutine uf_example ()
public subroutine uf_params (string ls_urldata)
public function string uf_posvalue (string ls_args, string ls_field, string ls_endstr)
public function integer getresult (ref string ls_ref)
public function integer getresult (string ls_method, string ls_fields, string ls_args, ref string ls_ref)
end prototypes

event type integer ue_internetdata(ref blob data);ib_result=data
return 0
end event

public function integer internetdata (blob data);return event ue_internetdata(data)
end function

public function string decto (decimal ad_dec, readonly unsignedinteger aui_sys);//作用:将十进制数字转成其它进制字符串
//参数1:十进制数字
//参数2:目标进制
string ls_ret	//返回的结果
string ls_dec
string ls_left,ls_right,ls_mod
uint ld_mod	/*余数为整数*/
dec ld_mul	//取小数的乘积为dec
int i,li_pos,li_len,li_pointpos,li_maxpower,li_minpower
if isnull(ad_dec) or isnull(aui_sys) or aui_sys<2 then goto e

ls_dec=string(ad_dec)
li_pointpos=pos(ls_dec,'.')

if li_pointpos=0 then 

	if ad_dec<aui_sys then	//大于10进制
		if ad_dec<=9 then
			ls_ret=string(ad_dec)
			goto e
		elseif ad_dec>9 and ad_dec<aui_sys then
			ls_ret=char(64 - 9 + ad_dec)		//大于9的数字为转换为字母
			goto e
		end if
	else
		do
			ld_mod=mod(ad_dec,aui_sys)	//取余数
			ls_mod=decto(ld_mod,aui_sys)
			ls_ret=ls_mod+ls_ret

			ad_dec=long(( ad_dec - ld_mod) / aui_sys )		//去余取商
			
		loop until ad_dec<aui_sys
		
		if ad_dec>9 then 
			ls_ret=char(64 - 9 + ad_dec)+ls_ret
		else
			ls_ret=string(ad_dec)+ls_ret
		end if
		
	end if
else
	ls_left=mid(ls_dec,1,li_pointpos)			//取整数
	ls_right=mid(ls_dec,li_pointpos)			//取小数
	ls_ret=decto(dec(ls_left),aui_sys)+'.'		//整数部分转换

	ld_mul=dec(ls_right)
	for i=1 to 10 	//最大精度为10
		ld_mul=ld_mul * aui_sys
		ls_ret=ls_ret+string(int(ld_mul))	//取整
		if ld_mul=int(ld_mul) then exit		//没有余数
		ld_mul=ld_mul - int(ld_mul)		//去除整数
	next

end if

e:
return ls_ret

end function

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
	li_pos=Pos(as_text,as_str1,li_pos + li_len2 )
loop
return as_text
end function

public function string hexencode (string as_text, readonly encoding ae_encode);//将字符转换成16进制编码
//参数1:是要转换的字符
//参数2:源字符中编码
//返回16进制编码

blob lb_text
blob{100} lb_stext
string ls_text2,ls_ret,ls_str1
uint i,li_len,li_asc
string ls_hex
//ls_text2=space(100)

//转换成编码encodingutf16BE
if len(as_text)<=50 then
	lb_stext=blob(as_text,ae_encode)
	ls_text2=string(lb_stext,encodingutf16Be!)
else
	lb_text=blob(as_text,ae_encode)
	ls_text2=string(lb_text,encodingutf16Be!)
end if

li_len=len(ls_text2)

for i=1 to li_len
	ls_str1=mid(ls_text2,i,1)
	li_asc=asc(ls_str1)
	ls_hex=decto(li_asc,16)
	
	////
	if ae_encode=encodingutf16BE! then	//高尾
		ls_hex=fill('0',4 - len(ls_hex))+ls_hex
		ls_ret=ls_ret+ls_hex
	elseif ae_encode=encodingutf16lE! then	//低尾
		ls_hex=fill('0',4 - len(ls_hex))+ls_hex
		ls_ret=ls_ret+ls_hex
	else
		if right(ls_hex,2)='00' then	ls_hex=left(ls_hex,2)
		ls_ret=ls_ret+ls_hex
	end if
next

return ls_ret
end function

public function string urlencode (character as_text[], encoding ae_encode);//对中文字符进行url 编码
//参数1:要编码的字符串
//参数2:要以哪种字符集编码
char lc_ret[]
string ls_ret
long i,j,li_len
string ls_temp
if match(as_text[],'^[\-\_\.A-Za-z0-9]*$')=true then
	ls_ret=as_text[]
else
	for i=1 to upperbound(as_text)
		if match(as_text[i],'[\-\_\.A-Za-z0-9]')=false then
			ls_temp=hexencode(as_text[i],ae_encode)
			li_len=len(ls_temp)
			li_len=li_len + li_len / 2		//增加百分号以后长度会增加1/2
			for j=1 to  li_len step 3
				ls_temp=replace(ls_temp,j,0,'%')
			next
		else
			ls_temp=as_text[i]
		end if
		ls_ret+=ls_temp
	next
end if

return ls_ret
end function

public function integer hexencode (ref byte lb_array[], ref character lc_result[]);//将字符转换成16进制编码
//参数1:是要转换的字符
//参数2:源字符中编码
//返回16进制编码
long l_len,i,l_num
char lc_temp[2]

l_len=upperbound(lb_array[])
 
for i=1 to l_len
	l_num= (2 * i) - 1
	if lb_array[i]<16 then //小于16的要补0
		lc_temp[1]='0'
		lc_temp[2]=decto(lb_array[i],16)
	else
		lc_temp[]=decto(lb_array[i],16)
	end if
	lc_result[l_num]=lc_temp[1]
	lc_result[l_num + 1]=lc_temp[2]
next
 
return l_len*2


//blob lb_text
//blob{100} lb_stext
//string ls_text2,ls_ret,ls_str1
//int i,li_len,li_asc
//string ls_hex
////ls_text2=space(100)
//
////转换成编码encodingutf16BE
//if len(as_text)<=50 then
//	lb_stext=blob(as_text,ae_encode)
//	ls_text2=string(lb_stext,encodingutf16Be!)
//else
//	lb_text=blob(as_text,ae_encode)
//	ls_text2=string(lb_text,encodingutf16Be!)
//end if
//
//li_len=len(ls_text2)
//
//for i=1 to li_len
//	ls_str1=mid(ls_text2,i,1)
//	li_asc=asc(ls_str1)
//	ls_hex=decto(li_asc,16)
//	
//	////
//	if ae_encode=encodingutf16BE! then	//高尾
//		ls_hex=fill('0',4 - len(ls_hex))+ls_hex
//		ls_ret=ls_ret+ls_hex
//	elseif ae_encode=encodingutf16lE! then	//低尾
//		ls_hex=fill('0',4 - len(ls_hex))+ls_hex
//		ls_ret=ls_ret+ls_hex
//	else
//		if right(ls_hex,2)='00' then	ls_hex=left(ls_hex,2)
//		ls_ret=ls_ret+ls_hex
//	end if
//next
//
//return ls_ret


end function

public function string uf_md5string (ref blob ls_string, ref string ls_result);ulong l_size
md5_ctx lpContext
char lc_result[]
byte lbyte_result[]
ls_result=''
l_size=len(ls_string)

MD5Init(lpContext)
MD5Update(lpContext,ls_string,l_size)
MD5Final(lpContext)

lbyte_result[]=lpContext.b[]
hexencode(lbyte_result[],lc_result[])
ls_result=lc_result[]

return ''
end function

public subroutine uf_params (string ls_names[], string ls_values[]);uf_params_reset()
long l_count,l_rowcount
l_rowcount=ds_params.rowcount( )
l_count=upperbound(ls_names[])
if l_count>0 then 
	ds_params.object.names.primary[l_rowcount+1,l_rowcount + l_count]=ls_names[]
	ds_params.object.values.primary[l_rowcount+1,l_rowcount + l_count]=ls_values[]
end if
end subroutine

public subroutine uf_param (string ls_name, string ls_value);long l_row,l_rowcount
l_rowcount=ds_params.rowcount()
if l_rowcount>0 then 
	l_row=ds_params.find( "names='"+ls_name+"' ", 1,l_rowcount)
end if
if l_row<=0 then 
	l_row=ds_params.insertrow( 0)
	ds_params.setitem(l_row,'names',ls_name)
end if
ds_params.setitem(l_row,'values',ls_value)
end subroutine

public subroutine uf_params_reset ();
ds_params.reset()

string ls_format='json' //可选，指定响应格式。默认xml,目前支持格式为xml,json
string ls_partner_id='top-apitools'	//
string ls_sign_method='md5'	//参数的加密方法选择，可选值是：md5,hmac
string ls_timestamp=''	//时间戳，格式为yyyy-mm-dd HH:mm:ss，例如：2008-01-25 20:23:30。淘宝API服务端允许客户端请求时间误差为10分钟(授权码10分钟有效期)。
string ls_v='2.0' //API协议版本，可选值:2.0。
ls_timestamp=string(today(),'YYYY-MM-DD hh:mm:ss')

//系统参数
uf_param("app_key",app_key)
//uf_param("format",ls_format)
if access_token<>'' then uf_param("access_token",access_token)
//uf_param("sign_method",ls_sign_method)
uf_param("timestamp",ls_timestamp)
uf_param("v",ls_v)

end subroutine

public function string uf_urldata ();//返回urlencode后的urldata串
string ls_urldata="" //
string ls_sign=''	//API签名结果
string ls_str=''		//md5计算序列
blob ls_temp
long i,l_count
string ls_name,ls_value

ds_params.setsort("names asc")
ds_params.sort( )

l_count=ds_params.rowcount()
ls_str=''
for i=1 to l_count
	ls_name=ds_params.getitemstring( i,"names")
	ls_value=ds_params.getitemstring( i,"values")
	ls_str+=ls_name+ls_value
	//if ls_name='token' then continue;
	ls_value=urlencode(ls_value,encodingutf8!)
	if ls_urldata='' then 
		ls_urldata=ls_name+'='+ls_value
	else
		ls_urldata+='&'+ls_name+'='+ls_value
	end if
next

ls_temp=blob(app_secret+ls_str+app_secret,encodingutf8!)	//对字符utf8编码后进行md5 hash
uf_md5string(ls_temp,ls_sign)	
ls_urldata+="&sign="+ls_sign

return ls_urldata
end function

public subroutine uf_example ();string ls_ret,ls_result
int li_ret

//app_url='https://api.jd.com/routerjson?'
//app_key='393021b7'	//app_key
//app_secret='adeaac8b252e4ed6a564cdcb1a064082'	//app_secret
//access_token='8612ca7a98f84a3e9cdde3358e001454' 

uf_params_reset()
uf_param("method",'jingdong.ware.product.search.list.get')
uf_params("isLoadAverageScore=true&isLoadPromotion=true")
uf_params("sort=1&page=1&pageSize=10")
uf_param("keyword",'电饭锅')
uf_param("client",'apple')
//uf_param("fields",'class_code,class_name,')
li_ret=getresult(ls_result)
if li_ret=0 then 
	messagebox('成功',ls_result) 
elseif li_ret=-2 then 
	messagebox('数据错误',ls_ret) 
else
	messagebox('系统错误',ls_ret) 
end if 
end subroutine

public subroutine uf_params (string ls_urldata);//格式:arg1=value1{&arg2=value2{&...}}
string ls_args
int li_pos1,li_pos2
int l_count
string ls_name,ls_value

//进行拼接
ls_args=ls_urldata
do
	li_pos1=pos(ls_args,"=",li_pos2 + 1)
	if li_pos1=0 then exit
	
	ls_name=mid(ls_args,li_pos2 + 1,li_pos1 - li_pos2 -1)
	li_pos2=pos(ls_args,'&',li_pos1 + 1)
	if li_pos2>0 then 
		ls_value=mid(ls_args,li_pos1 + 1,li_pos2 - li_pos1 - 1)
	else
		ls_value=mid(ls_args,li_pos1 + 1)
	end if
	l_count++
	uf_param(ls_name,ls_value)
loop until li_pos2<=0


end subroutine

public function string uf_posvalue (string ls_args, string ls_field, string ls_endstr);
//查找以分号结束的值
string ls_value
long l_row,l_pos,l_endpos,l_startpos,l_endlen
l_endlen=len(ls_endstr)
l_pos=pos(ls_args,ls_field)
if l_pos>0 then
	l_startpos=l_pos+len(ls_field)
	l_endpos=pos(ls_args,ls_endstr,l_startpos)
	if l_endpos=0 then 
		ls_value=mid(ls_args,l_startpos)
	else
		ls_value=mid(ls_args,l_startpos,l_endpos - l_startpos)
	end if
	//ls_args=left(ls_args,l_pos - 1)+mid(ls_args,l_endpos+l_endlen)
end if

return ls_value

end function

public function integer getresult (ref string ls_ref);

Blob lblb_args 
String ls_urldata,ls_result
String ls_url,ls_IsSuccess,ls_errtext
String ls_header
long ll_length,l_port=80
integer li_ret
inet linet 
boolean lb_wait
//lb_wait=isvalid(w_wait)

ls_url=app_url
if right(ls_url,1)<>'?' then ls_url+='?'

ls_urldata=uf_urldata()

lblb_args = Blob( ls_urldata,encodingutf8! )

ll_length = LenA( lblb_args )

//if pos(ls_args,'{')>0 then 
//	ls_header="Content-Type: application/json~r~n"
//else
	ls_header="Content-Type: application/x-www-form-urlencoded~r~n"
//end if
//ls_header+="Accept: application/json~r~n"
ls_header+="Content-Length: " + String( ll_length ) + "~r~n"

linet=create inet
li_ret = linet.PostURL( ls_url, lblb_args,ls_header,l_port, this )
//li_ret = linet.GetURL( ls_url+ls_urldata, this )
destroy linet

choose case li_ret
	case  1  
		//ls_errtext=Success
	case -1  
		ls_errtext='General error'
	case -2 
		ls_errtext='Invalid URL'
	case -4 
		ls_errtext='Cannot connect to the Internet'
	case -5  
		ls_errtext='Unsupported secure (HTTPS) connection attempted'
	case -6  
		ls_errtext='Internet request failed'
end choose 
if ls_errtext<>'' then 
	ls_errtext='访问服务器异常:'+ls_errtext
	goto e
end if

ls_result=string(ib_result,encodingutf8!)

string ls_retcode
ls_retcode=uf_posvalue(ls_result,'<error_code>','</error_code>')

//if ls_retcode='' then 
//	if pos(ls_result,'<warning>')>0 then 
//		ls_errtext+=uf_posvalue(ls_result,'<warning>','</warning>')
//		li_ret=-2
//		goto dataerr //自定义错误级别
//	end if
//else
//	ls_IsSuccess='false' 
//	if pos(ls_result,'<error_msg>')>0 then 
//		ls_errtext=uf_posvalue(ls_result,'<error_msg>','</error_msg>')
//	end if
//	
//	if ls_errtext='' then 
//		ls_errtext="No errorMsg!"
//	end if
//	
//	//检查错误级别,因为存在数据拒收的情况
//	li_ret=uf_errorlevel(ls_retcode)
//	goto dataerr //自定义错误级别
//	
//end if

goto m
m:
ls_ref=ls_result //成功返回数据
return 0 //没有错误

goto dataerr
dataerr:
ls_ref=ls_errtext //失败描述
return li_ret

goto e
e:
ls_ref=ls_errtext //失败描述
return -1 //系统错误


end function

public function integer getresult (string ls_method, string ls_fields, string ls_args, ref string ls_ref);uf_params_reset()
uf_param("method",ls_method)
uf_param("fields",ls_fields)
uf_params(ls_args)

return getresult(ls_ref)
end function

on u_derek_jos.create
call super::create
this.ds_params=create ds_params
TriggerEvent( this, "constructor" )
end on

on u_derek_jos.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ds_params)
end on

type ds_params from datastore within u_derek_jos descriptor "pb_nvo" = "true" 
end type

on ds_params.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ds_params.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;string ls_dwsyntax
ls_dwsyntax='release 12;&
table( &
	column=(type=char(255) updatewhereclause=yes name=names dbname="names" ) &
	column=(type=char(32766) updatewhereclause=yes name=values dbname="values") &
 )'
create(ls_dwsyntax)
end event

