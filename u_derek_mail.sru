$PBExportHeader$u_derek_mail.sru
$PBExportComments$derekר�ú���
forward
global type u_derek_mail from nonvisualobject
end type
type shellexecuteinfo from structure within u_derek_mail
end type
end forward

type shellexecuteinfo from structure
	long      cbSize   
	long      fMask   
	long      hwnd   
	string    lpVerb   
	string    lpFile   
	string    lpParameters   
	string    lpDirectory   
	long      nShow   
	long      hInstApp   
	long      lpIDList   
	string    lpClass
	long      hkeyClass   
	long      dwHotKey   
	long      hIcon   
	long      hProcess
end type

shared variables
string ss_lastopendir
end variables

global type u_derek_mail from nonvisualobject
event ue_wait ( integer li_meter,  string ls_text )
end type
global u_derek_mail u_derek_mail

type prototypes

function long ShellExecuteEx(ref shellexecuteinfo sei) library 'shell32' alias for "ShellExecuteEx;ansi"
//�ȴ����̽���
FUNCTION ulong WaitForSingleObject( ulong hHandle,ulong dwMilliseconds ) LIBRARY "kernel32.dll"alias for "WaitForSingleObject;ansi"


function   int   MyUtil_SMTP_Connect(string   host,int   port,string   UserId,string   PassWord)   library   "MyMail.dll"  alias for "MyUtil_SMTP_Connect;ansi"
function   int   MyUtil_SMTP_Disconnect()   library   "MyMail.dll" 
function   int   MyUtil_SMTP_Msg_Init()   library   "MyMail.dll" 
function   int   MyUtil_SMTP_Msg_SetInfo(int   i_type,int   i_sub_type,string   as_text)   library   "MyMail.dll" alias for "MyUtil_SMTP_Msg_SetInfo;ansi"
function   int   MyUtil_SMTP_Msg_Send()   library   "MyMail.dll" 

//�ļ���:MyUtil.dll

//��  ��:

/**************************************************
***                                            ***
***               POP3���ʼ�                   ***
***                                            ***
**************************************************/
//1.
function int MyUtil_POP3_Connect(string host,int port,string UserId,string PassWord,string AttachPath) library "MyMail.dll" alias for "MyUtil_POP3_Connect;ansi"
/*
���� : ����POP3������
���� : host          �����������ַ
       port          �˿�(110)
       UserId        �ʺ�
       PassWord      ����
       AttachPath    ���渽����Ŀ¼��
���� : <0            ʧ��
       >=0           ��ǰ��������ʼ�����
*/
//2.
function int MyUtil_POP3_Msg_Count(string host,int port,string UserId,string PassWord) library "MyMail.dll" alias for "MyUtil_POP3_Msg_Count;ansi"
//���� : ֱ�Ӳ�ѯ��ǰ��������ʼ�����
//���� : host          �����������ַ
//       port          �˿�(110)
//       UserId        �ʺ�
//       PassWord      ����
//���� : <0            ʧ��
//       >=0           ��ǰ��������ʼ�����
//3.
Function int MyUtil_POP3_Disconnect()  library "MyMail.dll"  
//���� : �ж���POP3������������
//���� : <0            ʧ��
//       >0            �ɹ�
//4.
Function int MyUtil_POP3_GetMail(int MailID )  library "MyMail.dll"  alias for "MyUtil_POP3_GetMail;ansi"
//���� : ���ʼ���������ȡMailID��ָ�����ʼ���Ϣ,������һ���ʼ�����(�ö�����û����ɼ�)��
//���� : MailID        �ʼ������
//���� : <0            ʧ��
//       >0            �ɹ�
//5.
Function int MyUtil_POP3_GetMailFromFile(string filename,string AttachPath)  library "MyMail.dll"  alias for "MyUtil_POP3_GetMailFromFile;ansi"
//���� : ��filenameָ�����ʼ��ļ��л�ȡ�ʼ���Ϣ,������һ���ʼ�����(�ö�����û����ɼ�)��
//���� : filename      �ʼ��ļ���ȫ·��
//       AttachPath    ���渽����Ŀ¼��(��\��β)
//���� : <0            ʧ��
//       >0            �ɹ�
//6.
Function int MyUtil_POP3_DeleteMail( int MailID )  library "MyMail.dll"  alias for "MyUtil_POP3_DeleteMail;ansi"
//���� : ���ʼ�������ɾ��MailID��ָ�����ʼ�
//���� : MailID        �ʼ������
//���� : <0            ʧ��
//       >0            �ɹ�
//7.
Function int MyUtil_POP3_Msg_GetInfo(int i_type,int i_sub_type, ref string  as_text)  library "MyMail.dll"  alias for "MyUtil_POP3_Msg_GetInfo;ansi"
//���� : �ڴӷ����� �� �ļ�����ָ���ʼ���,����i_type��i_sub_type��ȡ�ʼ��ĸ�����Ϣ,�������as_text
//���� : i_type        ��Ϣ����
//       i_sub_type    i_type�ĸ�����Ϣ
//       as_text       �����Ϣ
//���� : <0            ʧ��
//       >0            �ɹ�
//˵�� : i_type = 1          ��ȡ�ʼ���������Ϣ
//         i_sub_type = 1    �������ʼ���ַ
//         i_sub_type = 2    ����������
//         i_sub_type = 3    ����������+��ַ
//
//       i_type = 3          ��ȡ�ʼ�����(SUBJECT)
//         i_sub_type = x    (����)
//
//       i_type = 4          ��ȡ�ʼ�����ʱ��
//         i_sub_type = x    (����)
//    
//       i_type = 5          ��ȡ�ʼ�������Ϣ
//         i_sub_type = 0    ���������ʼ����ĵ�������
//         i_sub_type = n    ��as_text����ʼ����ĵ�n����Ϣ   
//
//       i_type = 6          ��ȡ�ʼ�������Ϣ
//         i_sub_type = 0    ���������ʼ�����������
//         i_sub_type = n    ��as_text�����n�������ľ���·����Ϣ   
//
//**************************************************
//***                                            ***
//***               SMTP���ʼ�                   ***
//***                                            ***
//**************************************************
//1.
//Function MyUtil_SMTP_Connect(host:pchar;port:integer;UserId,PassWord:pchar): integer;stdcall;
//���� : ����SMTP������
//���� : host          �����������ַ
//       port          �˿�(25)
//       UserId        �ʺ�
//       PassWord      ����
//���� : <0            ʧ��
//       >=0           �ɹ�
//2.
//Function MyUtil_SMTP_Disconnect(): integer;StdCall;
//���� : �ж���SMTP������������
//���� : <0            ʧ��
//       >0            �ɹ�
//3.
//Function MyUtil_SMTP_Msg_Init():integer;stdcall;
//���� : ��ʼ���������ʼ��ṹ����
//���� : <0            ʧ��
//       >0            �ɹ�
//4.
//Function MyUtil_SMTP_Msg_SetInfo(i_type,i_sub_type:integer;as_text:pchar):integer;stdcall;
//���� : ����i_type��i_sub_type��֯�ʼ��ĸ�����Ϣ,��as_text����
//���� : i_type        ��Ϣ����
//       i_sub_type    i_type�ĸ�����Ϣ
//       as_text       ������Ϣ
//���� : <0            ʧ��
//       >0            �ɹ�
//˵�� : i_type = 1          �����ʼ���������Ϣ
//         i_sub_type = 1    �������ʼ���ַ
//         i_sub_type = 2    ����������
//         i_sub_type = 3    ����������+��ַ
//
//       i_type = 2          �����ʼ������ߵ�ַ
//         i_sub_type = x    (����)
//
//       i_type = 3          �����ʼ�����(SUBJECT)
//         i_sub_type = x    (����)
//    
//       i_type = 5          ׷��һ����Ϣ���ʼ�����
//         i_sub_type = x    (����)
//
//       i_type = 6          ׷��һ������,��as_text����׷�Ӹ����ľ���·����Ϣ   
//         i_sub_type = x    (����)
//5.
//Function MyUtil_SMTP_Msg_Send():integer;stdcall;
//���� : ͨ��SMTP�����������Ѿ���֯�õ��ʼ�
//���� : <0            ʧ��
//       >0            �ɹ�
//6.
//Function MyUtil_SMTP_Msg_SendToFile(FileName :pchar):integer;stdcall;
//���� : �����Ѿ���֯�õ��ʼ���һ�������ļ�(FileName)
//���� : <0            ʧ��
//       >0            �ɹ�
//**************************************************
//***                                            ***
//***              QP��BASE64����                ***
//***                                            ***
//**************************************************
//1.
//Function MyUtil_QB_Decode(s_in:pchar;out s_out : ShortString):integer;stdcall;
//���� : ���ʼ��е���Ϣ(�� SUBJECT��SENDERNAME�����ĸ������� ��)����QB �� BASE64 ����
//���� : s_in          ������ַ���
//       s_out         ������ַ���
//���� : <0            ʧ��
//       >0            �ɹ�
//**************************************************
//***                                            ***
//***              ��ȡ������Ϣ                  ***
//***                                            ***
//**************************************************
//1.
Function int MyUtil_GetLastError(ref string  msg )   library "MyMail.dll"  alias for "MyUtil_GetLastError;ansi"
//���� : ���շ��ʼ��Ĺ�����,���д�����,���������øú�����ȡ��ش�����Ϣ,����msg����
//���� : msg           ���ڷ�����ش�����Ϣ
//���� : <0            ʧ��
//       >0            �ɹ�
//**************************************************
//***                                            ***
//***              ʹ��˵��                      ***
//***                                            ***
//**************************************************
//1.ͨ�����緢�ʼ�
//  (1) MyUtil_SMTP_Msg_Init
//  (2) MyUtil_SMTP_Msg_SetInfo
//  (3) MyUtil_SMTP_Connect
//  (4) MyUtil_SMTP_Msg_Send
//  (5) MyUtil_SMTP_Disconnect
//2.���ʼ��������ļ�
//  (1) MyUtil_SMTP_Msg_Init
//  (2) MyUtil_SMTP_Msg_SetInfo
//  (3) MyUtil_SMTP_Msg_SendToFile
//3.ͨ���������ʼ�
//  (1) n = MyUtil_POP3_Connect
//  (2) for i = 1 to n
//      MyUtil_POP3_GetMail
//      MyUtil_POP3_Msg_GetInfo
//      MyUtil_POP3_DeleteMail
//  (3) MyUtil_POP3_Disconnect
//4.���ļ������ʼ�
//  (1) MyUtil_POP3_GetMailFromFile
//  (2) MyUtil_POP3_Msg_GetInfo
//

end prototypes

type variables
string is_smtp,is_from,is_pop3
int i_port_smtp,i_port_pop3
long i_pop3_mailcount
string is_user,is_pass
private string is_module='jmail'
end variables

forward prototypes
public function string uf_checkdll (string as_classname, string as_dllname, integer ai_reg)
public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[])
public function integer regdll (string as_dllpath, string as_function, ref string as_info)
public function integer uf_setproper (string ls_var, any la_value)
public function string sendemail (string as_smtp, integer al_port, string as_logid, string as_logpwd, string as_from, string as_to, string as_subject, string as_body, string as_attachments)
private function string sendemail_mymail (string as_to, string as_subject, string as_body, string as_attachments)
private function string sendemail_jmail (string as_to, string as_subject, string as_body, string as_attachments)
public function string uf_smtp (string as_smtp, integer al_port, string as_logid, string as_logpwd, string as_from)
public function string uf_pop3 (string as_pop3, integer al_port, string as_logid, string as_logpwd, string as_from)
public function string uf_pop3_open (string ls_attachdir, ref long l_mailcount)
public function string uf_pop3_close ()
public function string uf_pop3_get (long l_index)
public function string uf_pop3_getinfo (string ls_var, ref string ls_ref)
public function string uf_pop3_find (string ls_param, boolean lb_open, boolean lb_close)
public function string sendemail (string as_to, string as_subject, string as_body, string as_attachments)
end prototypes

public function string uf_checkdll (string as_classname, string as_dllname, integer ai_reg);//��������
//����:as_classname Ҫ��������
//as_dllname	Ҫע���dll/ocx
//ʧ���Ƿ��Զ�ע��,"1":��,����ע��

string ls_ret
int l_ret

oleobject lobj
lobj=create oleobject

as_dllname=trim(as_dllname)

l_ret=lobj.connecttonewobject(as_classname)

if l_ret<>0 then
	
	if ai_reg=1 and as_dllname<>'' then
		if regdll(as_dllname,'reg',ls_ret)=-1 then 
			ls_ret=as_dllname+"ע��ʧ��:"+ls_ret
			goto e
		else
			ls_ret=uf_checkdll(as_classname,'',0)
			if ls_ret<>'' then 
				ls_ret='����'+ls_ret
				goto e
			end if 
		end if
	else
		ls_ret="���ӵ�����:"+as_classname+"ʧ��:"+string(l_ret)
		goto e
	end if
	
end if

lobj.DisconnectObject ( )

e:
destroy lobj
return ls_ret
end function

public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[]);//�ַ����滻����
//����1:���ñ���,�������ַ���
//����2:Ҫ�滻���ַ�
//����3:Ŀ���ַ�
//����ֵ:�滻�ɹ�����Ŀ

char lc_text[]
long i,l_len,l_index

int li_seplen,li_matchindex=1 /*����ƥ������*/
long l_lastmatchindex=0 //���һ��ȫƥ��ɹ���λ��

long l_newindex,l_newlen
char lc_newchar[]

li_seplen=upperbound(as_sep[])
lc_text[]=as_text
l_len=upperbound(lc_text[])
li_matchindex=1 //��ƥ���׸��ַ�

for l_index=1 to l_len //���ƥ��
	if lc_text[l_index]=as_sep[li_matchindex] then //�Ƿ�ƥ��
		if li_seplen=li_matchindex then //ȫƥ��
			lc_newchar[]=''
			l_newlen=l_index - li_seplen - l_lastmatchindex //��Ҫ��ȡ�ĳ���
			for l_newindex=1 to l_newlen
				lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
			next
			l_lastmatchindex=l_index //��¼���һ��ȫƥ��ɹ���λ��
			i++
			ls_ret[i]=lc_newchar[] //
		else //����ƥ��
			li_matchindex++ //ƥ�� + 1
			continue;
		end if
	end if 
	if li_matchindex>1 then l_index=l_index - li_matchindex + 1
	li_matchindex=1 //����ƥ��
next

if l_lastmatchindex<>l_len then 
	lc_newchar[]=''
	l_newlen=l_len - l_lastmatchindex
	for l_newindex=1 to l_newlen
		lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
	next
	l_lastmatchindex=l_len
	i++
	ls_ret[i]=lc_newchar[]
end if

return i

////�õ��ָ����ֿ��������
////����1:Ҫ�ָ����ַ���
////����2:����ֿ��������
////����3:�ָ���
////���������������
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
////������ȡ
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

public function integer regdll (string as_dllpath, string as_function, ref string as_info);as_function=lower(as_function)
as_info=''
int li_ret,li_retvalue
string ls_CurrentDir
shellexecuteinfo sei

ls_CurrentDir=GetCurrentDirectory()
if pos(as_dllpath,'\')=0 then 
	if fileexists(ls_CurrentDir+'\'+as_dllpath) then as_dllpath=ls_CurrentDir+'\'+as_dllpath
end if
if not fileexists(as_dllpath) then 
	li_retvalue=-1 
	as_info='�ļ�������:'+as_dllpath
	goto e
end if

sei.cbSize =60
sei.hwnd=0;
sei.fMask=64+1024;
sei.lpVerb= 'runas'; //����Ա�������
sei.lpFile="regsvr32.exe";
sei.nShow=1;
sei.lpDirectory=ls_CurrentDir

if as_function='unreg' then 
	sei.lpParameters=' /u /s "'+as_dllpath+'" ';
else
	sei.lpParameters=' /s "'+as_dllpath+'" ';
end if

li_ret=ShellExecuteEx(sei)
if li_ret<1 then 
	li_retvalue=-2
	as_info='ShellExecuteEx ʧ��:'+string(li_ret)
	goto e
end if

//�ȴ�����
WaitForSingleObject(sei.hProcess,65535)


return 1

goto e
e:
return li_retvalue

//
//if upper(as_function)="UNREG" then	//��ע��
//	as_function='DllUnregisterServer'
//elseif upper(as_function)="REG" then	//ע��
//	as_function='DllRegisterServer'
//end if
//
//
//ulong l_hwd,l_hwd2
//l_hwd=LoadLibrary(as_dllpath)
//if l_hwd=0 then 
//	as_info="LoadLibrary"
//	goto p
//end if
//
//l_hwd2=GetProcAddress(l_hwd,as_function)
//if l_hwd2=0 then 
//	as_info="GetProcAddress"
//	goto p
//end if
//
//CallWindowProc(l_hwd2,0,0,0,0)
//
//p:
//l_hwd2=GetLastError()
//
//if l_hwd2<>0 then as_info+=':'+string(l_hwd2)
//
//if l_hwd<>0 then 
//	l_hwd=FreeLibrary(l_hwd)
//	if l_hwd<>1 then 
//		as_info+='FreeLibrary:'+string(l_hwd)
//		goto e
//	end if
//	if l_hwd2=0 and l_hwd=1 then return 1
//end if
//
//e:
//return -1
//
end function

public function integer uf_setproper (string ls_var, any la_value);choose case ls_var
	case 'module'
		is_module=la_value
end choose

return -1
end function

public function string sendemail (string as_smtp, integer al_port, string as_logid, string as_logpwd, string as_from, string as_to, string as_subject, string as_body, string as_attachments);string ls_errtext,ls_ret
uf_smtp(as_smtp,al_port,as_logid,as_logpwd,as_from)
return sendemail(as_to,as_subject,as_body,as_attachments)


end function

private function string sendemail_mymail (string as_to, string as_subject, string as_body, string as_attachments);//����html�ʼ�
//ע:Ŀ¼����Ҫ��Jmail.dll
int   l_ret,i
string ls_recipients[]
string ls_errtext,ls_ret,ls_ref
string ls_attachments[]
boolean lb_connect

//�ʼ���ʼ���� 
if MyUtil_SMTP_Msg_Init()<0 then 
	ls_errtext+="Init Failed"; 
	goto e
end if
//
//������ַ
if MyUtil_SMTP_Msg_SetInfo(1,1,is_from)<0 then 
	ls_errtext+="Set from failed "
	goto e
end if
//����������
if MyUtil_SMTP_Msg_SetInfo(1,2, is_user)<0 then 
	ls_errtext+="Set user failed "
	goto e
end if
//���յ�ַ �ֺŷָ�
if MyUtil_SMTP_Msg_SetInfo(2,1,as_to)<0 then 
	ls_errtext+="Set recipient failed:"+as_to
	goto e
end if
//����
if MyUtil_SMTP_Msg_SetInfo(3,1,as_subject)<0 then 
	ls_errtext+="Set subject failed "
	goto e
end if
//׷��һ����Ϣ���ʼ����� 
if MyUtil_SMTP_Msg_SetInfo(5,1,as_body)<0 then 
	ls_errtext+="Set body failed "
	goto e
end if
//׷��һ������,��as_text����׷�Ӹ����ľ���·����Ϣ
if as_attachments>'' then 
	getarray(as_attachments,ls_attachments[],';')
	for i=1 to upperbound(ls_attachments)
		if not fileexists(ls_attachments[i]) then 
			ls_errtext+="Not Exists attachment:"+ls_attachments[i]+' ~r~n'
			goto e
		end if
		if  MyUtil_SMTP_Msg_SetInfo(6,1,ls_attachments[i] ) <0  then
			ls_errtext+="Set attachment faild:"+ls_attachments[i]+' ~r~n'
			goto e
		end if
	next
end if

if MyUtil_SMTP_Connect(is_smtp,i_port_smtp,is_user,is_pass)<0 then 
	ls_errtext+="connect failed "
	goto e
end if
lb_connect=true

if as_to<>'' then 
	if MyUtil_SMTP_Msg_Send()<0 then 
		ls_errtext+="send failed "
		goto e
	end if
end if

if MyUtil_SMTP_Disconnect()<0 then 
	lb_connect=false
	ls_errtext+="disconnect failed "
	goto e
end if

return ''
goto e
e:
if lb_connect=true then 
	ls_ref=space(2048) 
	MyUtil_GetLastError(ls_ref)
	ls_errtext+=ls_ref
	MyUtil_SMTP_Disconnect()
end if
return ls_errtext
end function

private function string sendemail_jmail (string as_to, string as_subject, string as_body, string as_attachments);//����html�ʼ�
//ע:Ŀ¼����Ҫ��Jmail.dll
string   ls_smtp,ls_logid,ls_logpwd,ls_sender
int   l_port,l_ret,i
string ls_recipient,ls_recipients[]
string ls_body
string ls_Subject
string ls_errtext,ls_ret
string ls_attachments[]
oleobject lobj
string ls_classname='Jmail.Message'

ls_sender=is_from
ls_smtp=is_smtp		//��������ַ
l_port=i_port_smtp   					//���ͷ�������smtp�˿ںţ�û�ĵĻ�һ����25
ls_logid=is_user 		//�����˵�½����������ʱ���û��� 
ls_logpwd=is_pass		//�����˵�½����������ʱ������ 
ls_recipient=as_to	
ls_body=as_body
ls_Subject=as_subject

lobj=create oleobject

//u_derek.wait(20,'����Jmail')
ls_errtext=uf_checkdll(ls_classname,"jmail.dll",1)
if ls_errtext<>'' then goto e

l_ret=lobj.connecttonewobject(ls_classname)

if l_ret<>0 then
	ls_errtext="ConnectToNewobject:"+string(l_ret)
	goto e
end if

//u_derek.wait(50,'�����ʼ�����')

try
	lobj.silent=true
	lobj.Logging = True
	lobj.Charset = "gb2312"
	If Not(ls_logid = "" Or ls_logpwd = "") Then
		lobj.MailServerUserName = ls_logid
		lobj.MailServerPassword = ls_logpwd
	End If
//	lobj.ContentType = "text/html"
	lobj.Priority = 3	//���ȼ�һ��
	lobj.From = ls_sender
	lobj.FromName = ls_logid
	getarray(ls_recipient,ls_recipients[],';')
	for i=1 to upperbound(ls_recipients)
//		messagebox('',ls_recipients[i])
		lobj.AddRecipient(ls_recipients[i])
	next
	lobj.Subject = ls_Subject
	if left(ls_body,1)='<' then 
		lobj.HtmlBody = ls_body
	else
		lobj.Body = ls_body
	end if
	if as_attachments>'' then 
		getarray(as_attachments,ls_attachments[],';')
		for i=1 to upperbound(ls_attachments)
			lobj.AddAttachment(ls_attachments[i])
		next
	end if
	
//	u_derek.wait(60,'���ڷ��͸�'+ls_recipient)
	if lobj.Send (ls_smtp+':'+string(l_port))=false then ls_errtext+="����ʧ��!"
catch (RuntimeError e)
	ls_errtext="Jmail����ʧ��:"+e.getmessage()
finally
	lobj.DisconnectObject()
end try

e:
if isvalid(lobj) then destroy lobj
//if isvalid(w_wait) then close(w_wait)
return ls_errtext


end function

public function string uf_smtp (string as_smtp, integer al_port, string as_logid, string as_logpwd, string as_from);is_smtp=as_smtp
is_from=as_from
i_port_smtp=al_port
is_user=as_logid
is_pass=as_logpwd

return ''
end function

public function string uf_pop3 (string as_pop3, integer al_port, string as_logid, string as_logpwd, string as_from);is_pop3=as_pop3
is_from=as_from
i_port_pop3=al_port
is_user=as_logid
is_pass=as_logpwd

return ''
end function

public function string uf_pop3_open (string ls_attachdir, ref long l_mailcount);string ls_errtext,ls_ref
if trim(ls_attachdir,true)='' then ls_errtext='����Ŀ¼����Ϊ��!'
this.event ue_wait(0,"������:"+is_pop3)
gu_fun.uf_run('cmd /c del /Q '+ls_attachdir+'\*','show=0;')
l_mailcount= MyUtil_POP3_Connect(is_pop3,i_port_pop3,is_user,is_pass,ls_attachdir)
if l_mailcount<0 then
	ls_ref=space(512) 
	MyUtil_GetLastError(ls_ref)
	ls_errtext=ls_ref
	goto e
end if

i_pop3_mailcount=l_mailcount

return ''
goto e
e:
return 'Open>'+ls_errtext
end function

public function string uf_pop3_close ();string ls_errtext,ls_ref
long l_ret
//sle_1.text="�����У����Ժ�~~~~"
l_ret= MyUtil_POP3_Disconnect()
if l_ret<0 then
	ls_ref=space(512) 
	MyUtil_GetLastError(ls_ref)
	ls_errtext="Close:"+ls_ref
	goto e
end if

return ''
goto e
e:
return ls_errtext
end function

public function string uf_pop3_get (long l_index);string ls_errtext,ls_ref
long l_ret
this.event ue_wait(0,"���ڽ���:"+string (l_index))
l_ret=MyUtil_POP3_GetMail(l_index)
if l_ret<0 then
	ls_ref=space(512) 
	MyUtil_GetLastError(ls_ref)
	ls_errtext="GetMail:"+ls_ref
	goto e
end if

return ''
goto e
e:
return ls_errtext

end function

public function string uf_pop3_getinfo (string ls_var, ref string ls_ref);string ls_errtext
long l_ret,i,l_count
string ls_ret
ls_ref=''
choose case ls_var
	case 'from'
		ls_ref=space(1024)
		l_ret=MyUtil_POP3_Msg_GetInfo(1,1,ref ls_ref)
	case 'subject'
		ls_ref=space(1024)
		l_ret=MyUtil_POP3_Msg_GetInfo(3,1,ref ls_ref)
	case 'sendtime'
		ls_ref=space(1024)
		l_ret=MyUtil_POP3_Msg_GetInfo(4,1,ref ls_ref)
	case 'content'
		l_count=MyUtil_POP3_Msg_GetInfo(5,0,ref ls_ret)
		for i=1 to l_count
			ls_ret=space(1024)
			l_ret=MyUtil_POP3_Msg_GetInfo(5,i,ref ls_ret)
			ls_ref+=ls_ret
		next
	case 'attach'
		l_count=MyUtil_POP3_Msg_GetInfo(6,0,ref ls_ret)
		for i=1 to l_count
			ls_ret=space(1024)
			l_ret=MyUtil_POP3_Msg_GetInfo(6,i,ref ls_ret)
			ls_ref+=ls_ret+'|'
		next
end choose

if l_ret<0 then
	ls_ref=space(512) 
	MyUtil_GetLastError(ls_ref)
	ls_errtext="GetInfo:"+ls_ref
	goto e
end if

return ''
goto e
e:
return ls_errtext

//Function int MyUtil_POP3_Msg_GetInfo(int i_type,int i_sub_type, ref string  as_text)  library "MyMail.dll"  alias for "MyUtil_POP3_Msg_GetInfo;ansi"
//���� : �ڴӷ����� �� �ļ�����ָ���ʼ���,����i_type��i_sub_type��ȡ�ʼ��ĸ�����Ϣ,�������as_text
//���� : i_type        ��Ϣ����
//       i_sub_type    i_type�ĸ�����Ϣ
//       as_text       �����Ϣ
//���� : <0            ʧ��
//       >0            �ɹ�
//˵�� : i_type = 1          ��ȡ�ʼ���������Ϣ
//         i_sub_type = 1    �������ʼ���ַ
//         i_sub_type = 2    ����������
//         i_sub_type = 3    ����������+��ַ
//
//       i_type = 3          ��ȡ�ʼ�����(SUBJECT)
//         i_sub_type = x    (����)
//
//       i_type = 4          ��ȡ�ʼ�����ʱ��
//         i_sub_type = x    (����)
//    
//       i_type = 5          ��ȡ�ʼ�������Ϣ
//         i_sub_type = 0    ���������ʼ����ĵ�������
//         i_sub_type = n    ��as_text����ʼ����ĵ�n����Ϣ   
//
//       i_type = 6          ��ȡ�ʼ�������Ϣ
//         i_sub_type = 0    ���������ʼ�����������
//         i_sub_type = n    ��as_text�����n�������ľ���·����Ϣ   
end function

public function string uf_pop3_find (string ls_param, boolean lb_open, boolean lb_close);int   l_ret,i
boolean lb_connect

long l_connect
string ls_attachpath,ls_from,ls_subject
string ls_errtext,ls_ref
long l_lastcount,l_findindex,l_minindex
ls_attachpath=f_cutvalue(ls_param,'attachpath=',';')
ls_from=f_cutvalue(ls_param,'from=',';')
l_lastcount=long(f_cutvalue(ls_param,'lastcount=',';'))
ls_subject=f_cutvalue(ls_param,'subject=',';')

string ls_text

if lb_open=true then 
	ls_errtext=uf_pop3_open(ls_attachpath,ref l_connect)
	if ls_errtext<>'' then goto e
	lb_connect=true
else
	l_connect=i_pop3_mailcount
end if

l_minindex=l_connect - min(l_connect,l_lastcount) + 1
l_findindex=0
for i=l_connect to l_minindex step -1
	ls_errtext=uf_pop3_get(i)
	if ls_errtext<>'' then continue; //goto e
	if ls_from<>'' then 
		ls_errtext=uf_pop3_getinfo('from', ref ls_text) //������ַ
		if ls_errtext<>'' then goto e
		if ls_text<>ls_from then continue;
	end if
	if ls_subject<>'' then 
		ls_errtext=uf_pop3_getinfo('subject', ref ls_text) //����
		if ls_errtext<>'' then goto e
		if match(ls_text,ls_subject)=false then continue;
	end if
	l_findindex=i
	exit
next

if lb_close=true then 
	ls_errtext=uf_pop3_close()
	if ls_errtext<>'' then goto e
end if

return string(l_findindex)
goto e
e:
if lb_connect=true then 
	if lb_close=true then uf_pop3_close()
end if
return 'Find.'+ls_errtext
end function

public function string sendemail (string as_to, string as_subject, string as_body, string as_attachments);string ls_errtext,ls_ret

//uf_smtp(as_smtp,al_port,as_logid,as_logpwd,as_from)
choose case is_module
	case 'jmail'
		ls_ret=sendemail_jmail(as_to,as_subject,as_body,as_attachments)
	case 'mymail'
		ls_ret=sendemail_mymail(as_to,as_subject,as_body,as_attachments)
end choose
return ls_ret


end function

on u_derek_mail.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_derek_mail.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

