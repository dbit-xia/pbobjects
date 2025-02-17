$PBExportHeader$u_derek_inetresult.sru
forward
global type u_derek_inetresult from internetresult
end type
type ds_params from datastore within u_derek_inetresult
end type
end forward

global type u_derek_inetresult from internetresult
event type integer ue_internetdata ( ref blob data )
ds_params ds_params
end type
global u_derek_inetresult u_derek_inetresult

type variables
string is_url
end variables

forward prototypes
public function integer internetdata (blob data)
public function string decto (decimal ad_dec, readonly unsignedinteger aui_sys)
public function string hexencode (string as_text, readonly encoding ae_encode)
public function string urlencode (character as_text[], encoding ae_encode)
public function integer hexencode (ref byte lb_array[], ref character lc_result[])
public subroutine uf_params (string ls_names[], string ls_values[])
public subroutine uf_param (string ls_name, string ls_value)
public subroutine uf_params_reset ()
public subroutine uf_example ()
public subroutine uf_params (string ls_urldata)
public function string uf_posvalue (string ls_args, string ls_field, string ls_endstr)
public function long replaceex (ref string ls_text, character as_str1[], character as_str2[])
public function string uf_urldata (ref string ls_url, ref string ls_urldata)
public function string uf_param (string ls_name)
end prototypes

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

//string ls_format='json' //可选，指定响应格式。默认xml,目前支持格式为xml,json
//string ls_partner_id='top-apitools'	//
//string ls_sign_method='md5'	//参数的加密方法选择，可选值是：md5,hmac
//string ls_timestamp=''	//时间戳，格式为yyyy-mm-dd HH:mm:ss，例如：2008-01-25 20:23:30。淘宝API服务端允许客户端请求时间误差为10分钟(授权码10分钟有效期)。
//string ls_v='2.0' //API协议版本，可选值:2.0。
//ls_timestamp=string(today(),'YYYY-MM-DD hh:mm:ss')
//
////系统参数
//uf_param("app_key",app_key)
////uf_param("format",ls_format)
//if access_token<>'' then uf_param("access_token",access_token)
////uf_param("sign_method",ls_sign_method)
//uf_param("timestamp",ls_timestamp)
//uf_param("v",ls_v)

end subroutine

public subroutine uf_example ();string ls_url,ls_urldata
string ls_ret

is_url="www.baidu.com/s?wd={wd}"

uf_params_reset()
uf_param("wd",'电饭锅')
uf_params("a=value1&b=value2")
ls_ret=uf_urldata(ref ls_url,ref ls_urldata)
messagebox('成功',ls_ret+'~r~n'+ls_url+'~r~n'+ls_urldata) 

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

public function long replaceex (ref string ls_text, character as_str1[], character as_str2[]);//字符串替换函数
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

public function string uf_urldata (ref string ls_url, ref string ls_urldata);//返回urlencode后的urldata串
//string 

string ls_sign=''	//API签名结果
string ls_str=''		//md5计算序列
blob ls_temp
long i,l_count
string ls_name,ls_value
string ls_geturl

ls_url=is_url
ls_urldata="" //

ds_params.setsort("names asc")
ds_params.sort( )

l_count=ds_params.rowcount()
ls_str=''
for i=1 to l_count
	ls_name=ds_params.getitemstring( i,"names")
	ls_value=ds_params.getitemstring( i,"values")
	//ls_str+=ls_name+ls_value
	//if ls_name='token' then continue;
	ls_value=urlencode(ls_value,encodingutf8!)
	if replaceex(ls_url,'{'+ls_name+'}',ls_value)>0 then //定义了参数
		//指定位置替换值
	else
		if ls_urldata='' then 
			ls_urldata+=ls_name+'='+ls_value
		else
			ls_urldata+='&'+ls_name+'='+ls_value
		end if
//		if i=1 then 
//			if right(ls_url_get,1)='?' then 
//				ls_url_get+=ls_name+'='+ls_value
//			elseif pos(ls_url_get,'?')=0 then 
//				ls_url_get+='?'+ls_name+'='+ls_value
//			else
//				ls_url_get+='&'+ls_name+'='+ls_value
//			end if
//		else
//			ls_url_get+='&'+ls_name+'='+ls_value
//		end if
	end if
next

ls_geturl=ls_url
if right(ls_geturl,1)='?' then 
	ls_geturl+=ls_urldata
elseif pos(ls_geturl,'?')=0 then 
	ls_geturl+='?'+ls_urldata
else
	ls_geturl+='&'+ls_urldata
end if

return ls_geturl
end function

public function string uf_param (string ls_name);long l_findrow
l_findrow=ds_params.find("names='"+ls_name+"'",1,ds_params.rowcount())
if l_findrow>0 then 
	return ds_params.getitemstring(l_findrow,'values')
end if
return ''
end function

on u_derek_inetresult.create
call super::create
this.ds_params=create ds_params
TriggerEvent( this, "constructor" )
end on

on u_derek_inetresult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ds_params)
end on

type ds_params from datastore within u_derek_inetresult descriptor "pb_nvo" = "true" 
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
this.create(ls_dwsyntax)
end event

