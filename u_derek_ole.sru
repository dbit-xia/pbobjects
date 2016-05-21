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

public function string getfiletime (string as_filepath, integer ai_timetype);//作用:得到文件的时间属性
//ai_timetype   0:创建时间,1为修改时间,2访问时间
//返回值:''为失败,否则为创建时间,修改时间,访问时间

int li_ret
string ls_ret
oleobject fso,o_file

if fileexists(as_filepath)=false then return ''//判断文件存在

fso=create oleobject
li_ret=fso.ConnectTonewObject ('scripting.filesystemobject')
if li_ret=0 then 
	o_file=fso.getfile(as_filepath)	//得到文件对象
	if ai_timetype=0 then 
		ls_ret=string(o_file.DateCreated,'YYYY-MM-DD hh:mm:ss')	//创建时间
	elseif ai_timetype=1 then 
		ls_ret=string(o_file.DateLastModified,'YYYY-MM-DD hh:mm:ss')	//最后修改时间
	elseif ai_timetype=2 then 
		ls_ret=string(o_file.DateLastAccessed,'YYYY-MM-DD hh:mm:ss')	//最后访问时间
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

