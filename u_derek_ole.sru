$PBExportHeader$u_derek_ole.sru
forward
global type u_derek_ole from nonvisualobject
end type
end forward

global type u_derek_ole from nonvisualobject autoinstantiate
end type

forward prototypes
public function string getfiletime (string as_filepath, integer ai_timetype)
end prototypes

public function string getfiletime (string as_filepath, integer ai_timetype);//����:�õ��ļ���ʱ������
//ai_timetype   0:����ʱ��,1Ϊ�޸�ʱ��,2����ʱ��
//����ֵ:''Ϊʧ��,����Ϊ����ʱ��,�޸�ʱ��,����ʱ��

int li_ret
string ls_ret
oleobject fso,o_file

if fileexists(as_filepath)=false then return ''//�ж��ļ�����

fso=create oleobject
li_ret=fso.ConnectTonewObject ('scripting.filesystemobject')
if li_ret=0 then 
	o_file=fso.getfile(as_filepath)	//�õ��ļ�����
	if ai_timetype=0 then 
		ls_ret=string(o_file.DateCreated,'YYYY-MM-DD hh:mm:ss')	//����ʱ��
	elseif ai_timetype=1 then 
		ls_ret=string(o_file.DateLastModified,'YYYY-MM-DD hh:mm:ss')	//����޸�ʱ��
	elseif ai_timetype=2 then 
		ls_ret=string(o_file.DateLastAccessed,'YYYY-MM-DD hh:mm:ss')	//������ʱ��
	end if
	fso.disconnectobject()
end if
return ls_ret
end function

on u_derek_ole.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_derek_ole.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

