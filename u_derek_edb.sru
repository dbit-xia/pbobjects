$PBExportHeader$u_derek_edb.sru
forward
global type u_derek_edb from internetresult
end type
type md5_ctx from structure within u_derek_edb
end type
type ds_params from datastore within u_derek_edb
end type
end forward

type md5_ctx from structure
	byte		a[8]
	byte		b[16]
	byte		c[64]
	byte		d[16]
end type

global type u_derek_edb from internetresult
event type integer ue_internetdata ( ref blob data )
ds_params ds_params
end type
global u_derek_edb u_derek_edb

type prototypes
SUBROUTINE MD5Init  (ref md5_ctx lpContext ) Library "cryptdll.dll" alias for "MD5Init;ansi"
SUBROUTINE MD5Final (ref md5_ctx lpContext ) Library "cryptdll.dll" alias for "MD5Final;ansi"
SUBROUTINE MD5Update (ref md5_ctx lpContext ,ulong lpBuffer,ulong BufSize ) Library "cryptdll.dll" alias for "MD5Update;ansi"
SUBROUTINE MD5Update (ref md5_ctx lpContext,blob lpBuffer,ulong BufSize ) Library "cryptdll.dll" alias for "MD5Update;ansi"

end prototypes

type variables

protected blob ib_result

string app_url="http://vip802.6x86.com/edb2/rest/index.aspx?" 
string app_key="393021b7"
string app_secret="adeaac8b252e4ed6a564cdcb1a064082"
string is_dbhost="edb_a12345"
string is_token="8612ca7a98f84a3e9cdde3358e001454"


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
public function integer uf_errorlevel (string ls_errorcode)
public function integer getresult (ref string ls_ref)
end prototypes

public function integer internetdata (blob data);return event ue_internetdata(data)
end function

public function string decto (decimal ad_dec, readonly unsignedinteger aui_sys);//����:��ʮ��������ת�����������ַ���
//����1:ʮ��������
//����2:Ŀ�����
string ls_ret	//���صĽ��
string ls_dec
string ls_left,ls_right,ls_mod
uint ld_mod	/*����Ϊ����*/
dec ld_mul	//ȡС���ĳ˻�Ϊdec
int i,li_pos,li_len,li_pointpos,li_maxpower,li_minpower
if isnull(ad_dec) or isnull(aui_sys) or aui_sys<2 then goto e

ls_dec=string(ad_dec)
li_pointpos=pos(ls_dec,'.')

if li_pointpos=0 then 

	if ad_dec<aui_sys then	//����10����
		if ad_dec<=9 then
			ls_ret=string(ad_dec)
			goto e
		elseif ad_dec>9 and ad_dec<aui_sys then
			ls_ret=char(64 - 9 + ad_dec)		//����9������Ϊת��Ϊ��ĸ
			goto e
		end if
	else
		do
			ld_mod=mod(ad_dec,aui_sys)	//ȡ����
			ls_mod=decto(ld_mod,aui_sys)
			ls_ret=ls_mod+ls_ret

			ad_dec=long(( ad_dec - ld_mod) / aui_sys )		//ȥ��ȡ��
			
		loop until ad_dec<aui_sys
		
		if ad_dec>9 then 
			ls_ret=char(64 - 9 + ad_dec)+ls_ret
		else
			ls_ret=string(ad_dec)+ls_ret
		end if
		
	end if
else
	ls_left=mid(ls_dec,1,li_pointpos)			//ȡ����
	ls_right=mid(ls_dec,li_pointpos)			//ȡС��
	ls_ret=decto(dec(ls_left),aui_sys)+'.'		//��������ת��

	ld_mul=dec(ls_right)
	for i=1 to 10 	//��󾫶�Ϊ10
		ld_mul=ld_mul * aui_sys
		ls_ret=ls_ret+string(int(ld_mul))	//ȡ��
		if ld_mul=int(ld_mul) then exit		//û������
		ld_mul=ld_mul - int(ld_mul)		//ȥ������
	next

end if

e:
return ls_ret

end function

public function string replace (string as_text, string as_str1, string as_str2);//�ַ����滻����
//����1:�������ַ���
//����2:Ҫ�滻���ַ�
//����3:Ŀ���ַ�

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

public function string hexencode (string as_text, readonly encoding ae_encode);//���ַ�ת����16���Ʊ���
//����1:��Ҫת�����ַ�
//����2:Դ�ַ��б���
//����16���Ʊ���

blob lb_text
blob{100} lb_stext
string ls_text2,ls_ret,ls_str1
uint i,li_len,li_asc
string ls_hex
//ls_text2=space(100)

//ת���ɱ���encodingutf16BE
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
	if ae_encode=encodingutf16BE! then	//��β
		ls_hex=fill('0',4 - len(ls_hex))+ls_hex
		ls_ret=ls_ret+ls_hex
	elseif ae_encode=encodingutf16lE! then	//��β
		ls_hex=fill('0',4 - len(ls_hex))+ls_hex
		ls_ret=ls_ret+ls_hex
	else
		if right(ls_hex,2)='00' then	ls_hex=left(ls_hex,2)
		ls_ret=ls_ret+ls_hex
	end if
next

return ls_ret
end function

public function string urlencode (character as_text[], encoding ae_encode);//�������ַ�����url ����
//����1:Ҫ������ַ���
//����2:Ҫ�������ַ�������
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
			li_len=li_len + li_len / 2		//���Ӱٷֺ��Ժ󳤶Ȼ�����1/2
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

public function integer hexencode (ref byte lb_array[], ref character lc_result[]);//���ַ�ת����16���Ʊ���
//����1:��Ҫת�����ַ�
//����2:Դ�ַ��б���
//����16���Ʊ���
long l_len,i,l_num
char lc_temp[2]

l_len=upperbound(lb_array[])
 
for i=1 to l_len
	l_num= (2 * i) - 1
	if lb_array[i]<16 then //С��16��Ҫ��0
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
////ת���ɱ���encodingutf16BE
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
//	if ae_encode=encodingutf16BE! then	//��β
//		ls_hex=fill('0',4 - len(ls_hex))+ls_hex
//		ls_ret=ls_ret+ls_hex
//	elseif ae_encode=encodingutf16lE! then	//��β
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
//ϵͳ����
uf_param("appkey",app_key)
uf_param("appscret",app_secret)
uf_param("token",is_token)
uf_param("dbhost",is_dbhost)
//uf_param("Ip",'127.0.0.1')
uf_param("format",'XML')
uf_param("slencry",'0')
uf_param("timestamp",string(now(),'YYYYMMDDhhmm'))
uf_param("v",'2.0')
end subroutine

public function string uf_urldata ();//����urlencode���urldata��
string ls_urldata="" //
string ls_sign=''	//APIǩ�����
string ls_str=''		//md5��������
blob ls_temp
long i,l_count
string ls_name,ls_value

ds_params.setsort("names asc")
ds_params.sort( )

l_count=ds_params.rowcount()
ls_str=app_key
for i=1 to l_count
	ls_name=ds_params.getitemstring( i,"names")
	ls_value=ds_params.getitemstring( i,"values")
	ls_str+=ls_name+ls_value
	if ls_name='appscret' then continue;
	if ls_name='token' then continue;
	ls_value=urlencode(ls_value,encodingutf8!)
	if ls_urldata='' then 
		ls_urldata=ls_name+'='+ls_value
	else
		ls_urldata+='&'+ls_name+'='+ls_value
	end if
next

ls_temp=blob(ls_str,encodingutf8!)	//���ַ�utf8��������md5 hash
uf_md5string(ls_temp,ls_sign)	
ls_urldata+="&sign="+ls_sign

return ls_urldata
end function

public subroutine uf_example ();string ls_ret,ls_result
int li_ret

app_url='http://vip802.6x86.com/edb2/rest/index.aspx?'
app_key='393021b7'	//app_key
app_secret='adeaac8b252e4ed6a564cdcb1a064082'	//app_secret
is_token='8612ca7a98f84a3e9cdde3358e001454' 
is_dbhost="edb_a12345"

uf_params_reset()
uf_param("method",'edbProductClassGet')
uf_param("fields",'class_code,class_name,')
li_ret=getresult(ls_result)
if li_ret=0 then 
	messagebox('�ɹ�',ls_result) 
elseif li_ret=-2 then 
	messagebox('���ݴ���',ls_ret) 
else
	messagebox('ϵͳ����',ls_ret) 
end if 
end subroutine

public subroutine uf_params (string ls_urldata);//��ʽ:arg1=value1{&arg2=value2{&...}}
string ls_args
int li_pos1,li_pos2
int l_count
string ls_name,ls_value

//����ƴ��
ls_args=ls_urldata
do
	li_pos1=pos(ls_args,"=",li_pos2 + 1)
	if li_pos1>0 then 
		ls_name=mid(ls_args,li_pos2 + 1,li_pos1 - li_pos2 -1)
	else
		exit
	end if
	li_pos2=pos(ls_args,'&',li_pos1 + 1)
	if li_pos2>0 then 
		ls_value=mid(ls_args,li_pos1 + 1,li_pos2 - li_pos1 - 1)
	else
		ls_value=mid(ls_args,li_pos1 + 1)
	end if
	l_count++
	uf_param(ls_name,ls_value)
	if li_pos2<=0 then exit
loop until 1<>1


end subroutine

public function string uf_posvalue (string ls_args, string ls_field, string ls_endstr);
//�����ԷֺŽ�����ֵ
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

public function integer uf_errorlevel (string ls_errorcode);string ls_syserr
ls_syserr=',1,2,3,4,5,6,7,20,21,22,50,51,52,60,100,201,202,203,204,205,206,404,'
if pos(ls_syserr,','+ls_errorcode+',')>0 then return -1 //ϵͳ������

return -2 //���ݴ���

/*
404	SYS_404:Զ�̷��������ش���,�����ʺŲ�����
206	IP��ֹ����
205	���������Ӧ��
100	PARAM_100:ָ�����������ڻ�����Ч�����������Ƿ��б�Ҫ����δ�ύ�������ύ�Ĳ���ֵ���ǺϷ���
60	USER_60:����д����Ĳ���
22	SYS_PARAM_22:�����ڸ÷���,���ѯmethod�Ƿ�������ȷ
21	SYS_PARAM_21:�û�������������ѯ�û��������Ƿ���ȷ
20	SYS_PARAM_20:ǩ��(sig)��������ȷ,���ѯǩ���Ƿ����
204	ʱ�������Ϊ�գ����ѯtimestamp�Ƿ�Ϊ��
203	ʱ�䳤�Ȳ��ԣ�����ʱ������ȣ�12λ������
202	û��Ȩ�޷��ʽӿ�,�������Ա��ϵ
201	SIGN:ǩ����֤��ʱ
52	SYS_52:�������ڲ�����
51	SYS_51:���ӷ���������������
50	SYS_50:δ֪����,�������ύ
6	SYS_PARAM_6:��������Ϊ��,���ѯ�Ƿ���ڸ�����
5	SYS_PARAM_5:ǩ������Ϊ��,���ѯsign�Ƿ�Ϊ��
4	SYS_PARAM_4:��������Ϊ��,���ѯmethod�Ƿ�Ϊ��
3	SYS_PARAM_3:��֤�벻��Ϊ��,���ѯappKey�Ƿ�Ϊ��
2	SYS_PARAM_2:�û�������Ϊ��,���ѯwfpuser�Ƿ�Ϊ��
1	SYS_PARAM_1:���ʺŲ���Ϊ��,���ѯdbhost�Ƿ�Ϊ��
*/

end function

public function integer getresult (ref string ls_ref);//
//
//Blob lblb_args 
//String ls_urldata,ls_result
//String ls_url,ls_IsSuccess,ls_errtext
//String ls_header
//long ll_length,l_port=80
//integer li_ret
//inet linet 
//boolean lb_wait
//lb_wait=isvalid(w_wait)
//
//ls_url=app_url
//if right(ls_url,1)<>'?' then ls_url+='?'
//
//ls_urldata=uf_urldata()
//
//lblb_args = Blob( ls_urldata,encodingutf8! )
//
//ll_length = LenA( lblb_args )
//
////if pos(ls_args,'{')>0 then 
////	ls_header="Content-Type: application/json~r~n"
////else
//	ls_header="Content-Type: application/x-www-form-urlencoded~r~n"
////end if
////ls_header+="Accept: application/json~r~n"
//ls_header+="Content-Length: " + String( ll_length ) + "~r~n"
//
//linet=create inet
//li_ret = linet.PostURL( ls_url, lblb_args,ls_header,l_port, this )
////li_ret = linet.GetURL( ls_url+ls_urldata, this )
//destroy linet
//
//choose case li_ret
//	case  1  
//		//ls_errtext=Success
//	case -1  
//		ls_errtext='General error'
//	case -2 
//		ls_errtext='Invalid URL'
//	case -4 
//		ls_errtext='Cannot connect to the Internet'
//	case -5  
//		ls_errtext='Unsupported secure (HTTPS) connection attempted'
//	case -6  
//		ls_errtext='Internet request failed'
//end choose 
//if ls_errtext<>'' then 
//	ls_errtext='���ʷ������쳣:'+ls_errtext
//	goto e
//end if
//
//ls_result=string(ib_result,encodingutf8!)
//
//string ls_retcode
//ls_retcode=uf_posvalue(ls_result,'<error_code>','</error_code>')
//
//if ls_retcode='' then 
//	if pos(ls_result,'<warning>')>0 then 
//		ls_errtext+=uf_posvalue(ls_result,'<warning>','</warning>')
//		li_ret=-2
//		goto dataerr //�Զ�����󼶱�
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
//	//�����󼶱�,��Ϊ�������ݾ��յ����
//	li_ret=uf_errorlevel(ls_retcode)
//	goto dataerr //�Զ�����󼶱�
//	
//end if
//
//goto m
//m:
//ls_ref=ls_result //�ɹ���������
//if lb_wait=false and isvalid(w_wait) then close(w_wait)
//return 0 //û�д���
//
//goto dataerr
//dataerr:
//if lb_wait=false and isvalid(w_wait) then close(w_wait)
//ls_ref=ls_errtext //ʧ������
//return li_ret
//
//goto e
//e:
//if lb_wait=false and isvalid(w_wait) then close(w_wait)
//ls_ref=ls_errtext //ʧ������
return -1 //ϵͳ����
//
//
end function

on u_derek_edb.create
call super::create
this.ds_params=create ds_params
TriggerEvent( this, "constructor" )
end on

on u_derek_edb.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ds_params)
end on

type ds_params from datastore within u_derek_edb descriptor "pb_nvo" = "true" 
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

