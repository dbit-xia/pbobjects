$PBExportHeader$u_interface_taskautorun.sru
forward
global type u_interface_taskautorun from nonvisualobject
end type
end forward

shared variables
long il_hwd_service,il_hwd_service_text
long sl_timeout=60
end variables

global type u_interface_taskautorun from nonvisualobject
end type
global u_interface_taskautorun u_interface_taskautorun

type prototypes
Function long FindWindowEx(long hWnd1, long hWnd2 , string lpsz1 , string lpsz2 ) Library "user32" Alias for "FindWindowExA;ansi" 
//执行应用程序
FUNCTION long WinExec(string lpCmdLine,ulong nCmdShow) LIBRARY "kernel32.dll" ALIAS FOR "WinExec;ansi"

end prototypes

type variables

end variables

forward prototypes
public function string uf_taskautorun (string ls_flags)
public function long uf_timeout (long l_second)
public function long uf_timeout ()
public function window uf_getposwindow (powerobject lpo)
end prototypes

public function string uf_taskautorun (string ls_flags);//gdw_1=dw_1;f_zg_sout('taskautorun,id=open,;','');gdw_1=gdw_emp
//gdw_1=dw_1;f_zg_sout('taskautorun,id=end,;','');gdw_1=gdw_emp
//gdw_1=dw_1;f_zg_sout('taskautorun,id=timer,;','');gdw_1=gdw_emp
//string ls_commandline
//ls_commandline=f_zg_multirun('commandline=1;all=1;','')
//gdw_1=dw_1;f_zg_sout('taskautorun,id=start,commandline='+ls_commandline+';','');gdw_1=gdw_emp

long l_hwd_service //,l_handle
string ls_null,ls_lparam,ls_id,ls_commandline,ls_field,ls_timeout
long l_ret,l_taskhwd,l_pos
ulong l_ref
string ls_service_path='runsatask.exe',ls_service_ini='runsatask.ini'
window lw_task


l_taskhwd=long(f_maintain_s(ls_flags,'taskhwd=',','))
if l_taskhwd<>0 then 
	//优先取传入handle
elseif isvalid(gdw_1) then 
	lw_task=uf_getposwindow(gdw_1) //支持通用窗口
	l_taskhwd=handle(lw_task)
elseif isvalid(w_zg_auto_run) then 
	l_taskhwd=handle(w_zg_auto_run)
elseif isvalid(w_stainfo_communication_zb) then 
	l_taskhwd=handle(w_stainfo_communication_zb)
elseif isvalid(w_stainfo_communication) then 
	l_taskhwd=handle(w_stainfo_communication)
end if
if l_taskhwd=0 then return '1'

ls_id=f_maintain_s(ls_flags,'id=',',')

choose case ls_id
	case 'open' //
		ls_service_path=g_current_path+ls_service_path
		l_hwd_service=FindWindowEx(0,0,ls_null,'RUNSA服务组件')
		if l_hwd_service=0 then 
			if fileexists(ls_service_path) then 
				WinExec('cmd /c RunDLL32 Shell32,ShellExec_RunDLL "'+ls_service_path+'"',0)
				//l_hwd_service=FindWindowEx(0,0,ls_null,'RUNSA服务组件')
			end if
		end if
	case 'start'
		ls_timeout=f_maintain_s(ls_flags,'timeout=',',')
		if ls_timeout='' then ls_timeout=profilestring(ls_service_ini,'reg','timeout',string(sl_timeout))
		if ls_timeout='' then ls_timeout=string(sl_timeout)
		
		ls_field='commandline='
		l_pos=pos(ls_flags,ls_field)
		l_pos+=len(ls_field)
		ls_commandline=mid(ls_flags,l_pos,len(ls_flags) - l_pos)
		
		setnull(ls_null)
		l_hwd_service=FindWindowEx(0,0,ls_null,'RUNSA服务组件')
		if l_hwd_service<>0 then 
			//l_handle=l_taskhwd
			il_hwd_service=l_hwd_service
			il_hwd_service_text=send(il_hwd_service,1025,0,0)
			ls_lparam='whandle='+string(l_taskhwd)+'|timeout='+ls_timeout+'|runcmd='+ls_commandline+'|'
			Send(il_hwd_service_text,12,0,ls_lparam)
			Send(il_hwd_service,1024,1,l_taskhwd)
		end if
	case 'timer'
		if il_hwd_service<>0 then 
			ls_lparam='whandle='+string(l_taskhwd)+'|'
			Send(il_hwd_service_text,12,0,ls_lparam)
			Send(il_hwd_service,1024,2,l_taskhwd)
		end if
	case 'end'
		if il_hwd_service<>0 then 
			ls_lparam='whandle='+string(l_taskhwd)+'|'
			Send(il_hwd_service_text,12,0,ls_lparam)
			Send(il_hwd_service,1024,3,l_taskhwd)
			il_hwd_service_text=0
			il_hwd_service=0
		end if
end choose

return '1'
end function

public function long uf_timeout (long l_second);long l_oldtimeout
l_oldtimeout=sl_timeout
sl_timeout=l_Second
return l_oldtimeout
end function

public function long uf_timeout ();return sl_timeout
end function

public function window uf_getposwindow (powerobject lpo);powerobject lpo_parent

lpo_parent=lpo
//查找所属窗口
do while typeof(lpo_parent)<>window!
	lpo_parent=lpo_parent.getparent()
loop 

return lpo_parent
end function

on u_interface_taskautorun.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_interface_taskautorun.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

