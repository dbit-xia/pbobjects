$PBExportHeader$uo_derek_sle.sru
forward
global type uo_derek_sle from singlelineedit
end type
end forward

global type uo_derek_sle from singlelineedit
integer width = 421
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
event ue_keydown pbm_keydown
event type integer ue_enter ( )
event ue_afteropen ( )
event ue_ncpaint pbm_ncpaint
event type string ue_getlistsql ( )
event ue_enchange pbm_enchange
event ue_dropfiles pbm_dropfiles
end type
global uo_derek_sle uo_derek_sle

type prototypes
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"
subroutine DragAcceptFiles(ulong hndle, boolean bflag ) library 'shell32.dll' alias for "DragAcceptFiles;ansi"
function ulong DragQueryFile( ulong ul_Drop, ulong ul_index, ref string LPTSTR, ulong cb ) library 'shell32.dll' alias for "DragQueryFileA;Ansi" 
Subroutine DragFinish(ULong hDrop) Library "Shell32.dll"

Function Long GlobalUnlock   (long hMem ) Library "kernel32" alias for "GlobalUnlock;ansi"

Function long OpenClipboard (long hwnd )  Library "user32" alias for "OpenClipboard;ansi"
Function long CloseClipboard()  Library "user32"  alias for "CloseClipboard;ansi"
Function long GetClipboardData(long wFormat )  Library "user32" alias for "GetClipboardData;ansi"

end prototypes

type variables
private:
string is_inifile_ctrl
window iw_parent
listbox ilb_add
string is_oldtext

public:
boolean ib_memory=true

protected:
boolean ib_dropfiles=false

private:
long CF_HDROP=15
//正在按下键
string is_lastdo
boolean ib_initialized


end variables

forward prototypes
public function integer settext (string as_text)
public function string text ()
public function int uf_post (string as_var, any a_value)
public function string uf_clipfiles (ref string ls_files)
end prototypes

event ue_keydown;string ls_files
long i
if key=keyenter! then 
	return event ue_enter()
end if

if key=keyV! and keyflags=2 then 
	if clipboard()='' and ib_dropfiles=true then 
		uf_Clipfiles(ls_files)
		if ls_files<>'' then
			if enabled=true and displayonly=false then settext(ls_files)
		end if
	end if
end if

end event

event type integer ue_enter();if is_oldtext<>text then event modified()
return 0
end event

event ue_afteropen();if ib_dropfiles=true then DragAcceptFiles(handle(this),true)

is_lastdo='afteropen'
post uf_post('lastdo','')

powerobject lpo

string ls_Path 
ulong lul_handle,ul_size=1024
ls_Path = space(1024) 
lul_handle = Handle(GetApplication()) 
GetModuleFilename(lul_handle, ls_Path, ul_size) 
ls_Path=mid(ls_Path,1,lastpos(ls_Path,'\'))

is_inifile_ctrl=ls_Path+"control.ini"

lpo=this
//查找所属窗口
do 
	lpo=lpo.getparent()
loop until typeof(lpo)=window! 

iw_parent=lpo

//默认取初始值
if ib_memory then 
	text=profilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),text)
end if
is_oldtext=text

ib_initialized=true
end event

event ue_ncpaint;if ib_initialized=false then event ue_afteropen()
end event

event ue_dropfiles;/*win8 如果程序以管理员而explorer非管理员方式运行时,不能触发该事件*/

string ls_files
ulong li_count
// first get the number of files, use as index -1
li_count = DragQueryFile(handle,-1,ls_files,0)
if li_count>0 then 
	ls_files = space(255) 
	DragQueryFile(handle,1 - 1,ls_files,255) //取第一个
	if ls_files<>'' then 
		if this.enabled=true and this.displayonly=false then settext(ls_files)
	end if
end if
DragFinish(handle)
end event

public function integer settext (string as_text);this.text=as_text
return event modified()
end function

public function string text ();return this.text
end function

public function int uf_post (string as_var, any a_value);choose case lower(as_var)
	case 'is_oldtext'
		is_oldtext=a_value
	case 'lastdo'
		is_lastdo=a_value
end choose

return 0
end function

public function string uf_clipfiles (ref string ls_files);long lHandle 
Long i 
long l_openclip,l_ret
string ls_errtext,ls_null
long l_count,l_index
setnull(ls_null)

try
	l_openclip=OpenClipboard(0)
	If l_openclip<=0 Then
		ls_errtext+="OpenClipboard:"+string(l_openclip)+'~r~n'
		throw create runtimeerror
	end if

	lHandle = GetClipboardData(CF_HDROP)
	If lHandle = 0 Then 
		throw create runtimeerror //无内容
	end if
	
	If lHandle < 0 Then
		ls_errtext+="GetClipboardData:"+string(lHandle)+'~r~n'
		throw create runtimeerror
	end if 
	   
	l_count=DragQueryFile(lHandle,-1,ls_null,0);
	for l_index=1 to 1 //取第一个
		ls_files= space(255) 
		l_ret=DragQueryFile(lHandle,l_index - 1,ls_files,255);
	next

catch (runtimeerror e)
	ls_errtext+=e.getmessage()
finally
	if lHandle>0 then GlobalUnlock (lHandle)
	if l_openclip>0 then CloseClipboard()
end try

return ls_errtext
end function

on uo_derek_sle.create
end on

on uo_derek_sle.destroy
end on

event losefocus;//messagebox('','super lose:'+is_oldtext+'/'+text);
if is_oldtext<>text then 
//	send(handle(parent),258,asc('1'),1/*发送一次*/)
//	send(handle(this),256,asc('~h0D'),1) //回车 目的:中断上次定位,重新定位
end if

if isvalid(ilb_add) then 
	if GetFocus ( )<>ilb_add then ilb_add.visible=false
end if

end event

event getfocus;
if isvalid(ilb_add) then 
	ilb_add.move(x,y+height - 3)
	ilb_add.width=width
	ilb_add.visible=true
//	ilb_add.setfocus()
end if
end event

event modified;if isvalid(iw_parent) then 
	setprofilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),text)
end if
is_oldtext=text
end event

event rbuttondown;is_lastdo='rbuttondown'
post uf_post('lastdo','')
end event

event destructor;if ib_dropfiles=true then DragAcceptFiles(handle(this),false)
end event

