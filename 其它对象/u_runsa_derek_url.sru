$PBExportHeader$u_runsa_derek_url.sru
$PBExportComments$derek专用函数
forward
global type u_runsa_derek_url from nonvisualobject
end type
type shfileopstruct from structure within u_runsa_derek_url
end type
type md5_ctx from structure within u_runsa_derek_url
end type
end forward

type shfileopstruct from structure
	unsignedlong		hwnd
	unsignedlong		wfunc
	string		pfrom
	string		pto
	integer		fflags
	long		fanyoperationsaborted
	long		hnamemappings
	string		lpszprogresstitle
end type

type md5_ctx from structure
	byte		a[8]
	byte		b[16]
	byte		c[64]
	byte		d[16]
end type

shared variables
string ss_lastopendir
end variables

global type u_runsa_derek_url from nonvisualobject
end type
global u_runsa_derek_url u_runsa_derek_url

type prototypes
//执行应用程序
FUNCTION long WinExec(string lpCmdLine,ulong nCmdShow) LIBRARY "kernel32.dll" ALIAS FOR "WinExec;ansi"
//操作文件
FUNCTION long ShellExecute(ulong hwnd,string lpOperation,ref string lpFile,ref string lpParameters,ref string lpDirectory,ulong nShowCmd) LIBRARY "shell32.dll" ALIAS FOR "ShellExecuteA;ansi"

Function long  SHFileOperation(ref shfileopstruct shfile)  Library  "shell32.dll"  Alias FOR "SHFileOperation"  //不能加;ansi 否则会有时失败

function long GetParent(long hwnd) library "user32.dll"  ALIAS FOR "GetParent;ansi"
//查找窗口
Function ulong GetForegroundWindow () Library "user32.dll"  ALIAS FOR "GetForegroundWindow;ansi"
Function ulong GetActiveWindow() Library "user32.dll"  ALIAS FOR "GetActiveWindow;ansi"
Function ulong SetActiveWindow(ulong hwnd) Library "user32.dll"  ALIAS FOR "SetActiveWindow;ansi"
FUNCTION ulong GetWindowThreadProcessId(ulong hwnd,ref ulong lpdwProcessId) LIBRARY "user32.dll" ALIAS FOR "GetWindowThreadProcessId;ansi"

Function long FindWindow(string classname, String windowname) Library "user32.dll"  ALIAS FOR "FindWindowA;ansi"
Function long FindWindow(long classname, String windowname) Library "user32.dll"  ALIAS FOR "FindWindowA;ansi"
Function long FindWindowEx(long hWnd1, long hWnd2 , string lpsz1 , string lpsz2 ) Library "user32" Alias for "FindWindowExA;ansi" 
//是否是窗口
Function boolean IsWindow (Long hwnd ) Library "user32.dll" ALIAS FOR "IsWindow;ansi"

FUNCTION long OpenProcess(long dwDesiredAccess,long bInheritHandle,long dwProcessId) LIBRARY "kernel32.dll" ALIAS FOR "OpenProcess;ansi"
Function boolean CloseHandle (long hObject )  Library "kernel32" Alias for "CloseHandle;ansi" 
FUNCTION ulong TerminateProcess(ulong hProcess,ulong uExitCode) LIBRARY "kernel32.dll" ALIAS FOR "TerminateProcess;ansi"
Function ulong LoadLibrary(ref string lpLibFileName) LIBRARY "kernel32.dll" ALIAS FOR "LoadLibraryA;ansi"
Function ulong FreeLibrary(ulong hLibModule) LIBRARY "kernel32.dll" ALIAS FOR "FreeLibrary;ansi"
Subroutine FreeLibraryAndExitThread(ulong hLibModule,ulong dwExitCode) LIBRARY "kernel32.dll"ALIAS FOR "FreeLibraryAndExitThread;ansi"
Function ulong GetProcAddress(ulong hModule,ref string lpProcName) LIBRARY "kernel32.dll"ALIAS FOR "GetProcAddress;ansi"
Function ulong GetLastError() LIBRARY "kernel32.dll"ALIAS FOR "GetLastError;ansi"
Function ulong CallWindowProc(ulong lpPrevWndFunc,ulong hWnd,ulong Msg,ulong wParam,ulong lParam) LIBRARY "user32.dll" ALIAS FOR "CallWindowProcA;ansi"
//检索指定坐标点的像素的RGB颜色值
Function long GetPixel (long hdc , long  x , long Y) Library "gdi32.dll"ALIAS FOR "GetPixel;ansi"
Function long SetForegroundWindow (long hwnd ) Library "user32.dll" Alias for "SetForegroundWindow;ansi" 
//设定指定坐标点的像素的RGB颜色值
Function long SetPixelV (long hdc , long x , long Y , long crColor )  Library "gdi32.dll"ALIAS FOR "SetPixelV;ansi"
FUNCTION ulong SetSysColors(ulong nChanges,ref ulong lpSysColor,ref ulong lpColorValues) LIBRARY "user32.dll"

//获取指定窗口的设备场景 (该函数检索一指定窗口的客户区域或整个屏幕的显示设备上下文环境的句柄，以后可以在GDI函数中使用该句柄来在设备上下文环境中绘图。)
Function long GetDC(long hwnd) LIBRARY "user32.dll"ALIAS FOR "GetDC;ansi"
//系统鼠标位置
Function ulong GetCursorPos(ref long lpPoint[2]) LIBRARY "user32.dll"ALIAS FOR "GetCursorPos;ansi"
//创建
FUNCTION ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"ALIAS FOR "CreateRoundRectRgn;ansi"
FUNCTION ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"ALIAS FOR "SetWindowRgn;ansi"

Subroutine  BringWindowToTop(int hWnd)  Library "User32.dll" alias for "BringWindowToTop;ansi"
Function long GetNextWindow(long hWnd, int Flag)  Library "user32.dll" alias for 'GetWindow;ansi'
Function      uint  GetWindowText(uint hWnd, REF string Title, uint Size ) Library  "user32.dll"
Function      long  ShowWindow(long  hWnd, long  CmdShow)  Library "user32.dll" alias for 'ShowWindow;ansi'
Function Long IsWindowEnabled(Long hwnd ) Library "user32.dll" Alias for "IsWindowEnabled;ansi"
//窗口是否最小化
Function    integer  IsIconic(uint  hWnd)  Library "user32.dll" alias for "IsIconic;ansi"
Function    integer  OpenIcon(uint hWnd)  Library  "user32.dll" alias for "OpenIcon;ansi"

//启动定时器timer事件
Function   Long   SetTimer(Long   hWnd,   long   nIDEvent,   Long   uElapse,   Long   lpTimerFunc)   Library   "user32.dll" alias for "SetTimer;ansi"
//关闭定时器timer事件
Function   Long   KillTimer(Long   hWnd,   Long   uIDEvent)   Library   "user32.dll"  alias for "KillTimer;ansi"

//设置当前目录
Function ulong SetCurrentDirectory(ref string lpPathName) LIBRARY "kernel32.dll" ALIAS FOR "SetCurrentDirectoryA;ansi"
//得到当前应用程序的完整路径
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"

Function long SetWindowLongA(ulong hWnd, int nIndex, long dwNewLong) library "user32.dll" ALIAS FOR "SetWindowLongA;ansi"
Function long GetWindowLongA(ulong hWnd, int nIndex) library "user32.dll" ALIAS FOR "GetWindowLongA;ansi"
Function ulong ExitWindowsEx(ulong uFlags,ulong dwReserved) LIBRARY "user32.dll" ALIAS FOR "ExitWindowsEx;ansi"

function long WindowFromPoint(int li_x,int li_y) library 'user32.dll' alias for "WindowFromPoint;ansi"
Function long ChildWindowFromPoint (long hWnd , long xPoint , long yPoint ) Library "user32" Alias for "ChildWindowFromPoint;ansi" 
Function long ScreenToClient (long hwnd ,ref long lpPoint[2] ) Library "user32" Alias for "ScreenToClient;ansi" 
Function long GetClassName(Long hwd ,ref String clnm , Long sz  )  Library "user32" alias for "GetClassNameA;ansi"
Function Long GetWindowText(long hwnd,ref string lpstring,long nmaxcount) Library "user32.dll" Alias for "GetWindowTextA;ansi"
function long GetDesktopWindow() library 'user32.dll' alias for 'GetDesktopWindow;ansi'
function long GetWindowDC(long hwnd) library 'user32.dll' alias for 'GetWindowDC;ansi'
function long ReleaseDC(long hWnd, long hdc) library 'user32.dll' alias for 'ReleaseDC;ansi'
Function long CreatePen (long nPenStyle , long nWidth , long crColor ) Library "gdi32" Alias for "CreatePen;ansi" 
function long SelectObject ( long hdc, long hobject ) library "gdi32"
Function long Rectangle  (Long hdc , Long X1 , Long Y1 , Long X2 , Long Y2 )  Library "gdi32" Alias for "Rectangle;ansi"
Function long SetROP2 (Long hdc , Long nDrawMode ) Library "gdi32" Alias for "SetROP2;ansi" 
Function long GetWindowRect (long hwnd , ref long nrect[4]) Library "user32" Alias for "GetWindowRect;ansi" 
Function long DeleteObject  (long hObject ) Library "gdi32" Alias for"DeleteObject;ansi"

//取得与指定“地方”有关的信息
Function long GetLocaleInfo (Long Locale , long LCType ,ref  string lpLCData , long cchData ) Library "kernel32" Alias for "GetLocaleInfoA;ansi" 
								
//获取一个路径如:\Device\HarddiskVolume2\Program Files (x86)\Sybase\PowerBuilder 12.0\PB120.EXE
Function long GetProcessImageFileName(long hProcess,ref string lpFilename,long nSize) library 'psapi.dll' alias for 'GetProcessImageFileNameA;ansi'
//获取全路径
Function long QueryFullProcessImageName(long hProcess,long lll,ref string lpFilename,ref long nSize) library 'Kernel32.dll' alias for 'QueryFullProcessImageNameA;ansi'
//32位获取全路径,不能用于64位
Function long GetModuleFileNameEx(long hProcess,long lll,ref string lpFilename,long nSize) library 'psapi.dll' alias for 'GetModuleFileNameExA;ansi'

FUNCTION  boolean RegisterHotKey(long hwnd,long id,long fsModifiers,long vk) LIBRARY "user32.dll" alias for "RegisterHotKey;ansi"
Function boolean UnregisterHotKey(long hwnd , long id ) library 'user32' alias for 'UnregisterHotKey;ansi'
FUNCTION long GlobalAddAtom(ref string lpString) LIBRARY "kernel32.dll" ALIAS FOR "GlobalAddAtomA;ansi"
FUNCTION long GlobalDeleteAtom(long nAtom )  Library "kernel32" Alias for "GlobalDeleteAtom;ansi" 

Function long GetTextExtentPoint32 (long hdc , string lpszStr , long cchString , ref long lpSize[2] ) library "gdi32" Alias for "GetTextExtentPoint32A;ansi"
Function long GetTextExtentExPoint (long hdc , string lpszStr , long cchString , long nMaxExtent , ref long lpnFit , ref long alpDx ,ref long lpSize[2] ) library "gdi32" Alias for "GetTextExtentExPointA;ansi"

//Function long CreateFontIndirect(logfont lpLogFont )  Library "gdi32" Alias for "CreateFontIndirectA;ansi" 
Function long TextOut  (long hdc , long x , long y , string lpString , long nCount ) Library "gdi32" Alias for "TextOutA;ansi"
Function long GetSystemMetrics (long nIndex) Library "user32" Alias for "GetSystemMetrics;ansi"
Function long EnableWindow(long hwnd , long fEnable ) Library "user32" Alias for "EnableWindow;ansi" 
SUBROUTINE keybd_event (BYTE bVk,BYTE bScan,long dwFlags,long dwExtralnfo) LIBRARY "user32.dll"   ALIAS FOR "keybd_event;ansi"
SUBROUTINE mouse_event(Long dwFlags, Long dx , Long dy , Long cButtons, Long dwExtraInfo) LIBRARY "user32" Alias for "mouse_event;ansi" 

Function long SendMessage ( Long hwnd, Long wMsg,/*不用 ref*/ Long wParam, ref string lParam ) library "user32" Alias for "SendMessageA;ansi"
Function long SendMessage ( Long hwnd, Long wMsg,/*不用 ref*/ Long wParam, ref char lParam[]) library "user32" Alias for "SendMessageA;ansi"

FUNCTION ulong CreateFile(ref string lpFileName,ulong dwDesiredAccess,ulong dwShareMode,ref ulong lpSecurityAttributes[3],ulong dwCreationDisposition,ulong dwFlagsAndAttributes,ulong hTemplateFile) LIBRARY "kernel32.dll" ALIAS FOR "CreateFileA;ansi" 
Function ulong CreateFileMapping (ulong hFile ,ulong lpFileMappigAttributes[3], ulong flProtect , ulong dwMaximumSizeHigh , ulong dwMaximumSizeLow ,ref String lpName ) Library "kernel32" Alias for "CreateFileMappingA;ansi" 
Function ulong OpenFileMapping(ulong dwDesiredAccess , boolean bInheritHandle ,ref string lpName)  Library "kernel32" Alias for "OpenFileMappingA;ansi" 
Function ulong  MapViewOfFile  (ulong hFileMappingObject , ulong dwDesiredAccess , ulong dwFileOffsetHigh , ulong dwFileOffsetLow , ulong dwNumberOfBytesToMap ) Library "kernel32"Alias for "MapViewOfFile" 
SUBROUTINE UnmapViewOfFile (ulong lpBaseAddress ) Library "kernel32" alias for "UnmapViewOfFile;ansi"

Function ulong lstrcpyA(ref string Destination, string Source) library "kernel32.dll" ALIAS FOR "lstrcpy;ansi";
Function ulong lstrcpyA(ref ulong Destination, string Source) library "kernel32.dll" ALIAS FOR "lstrcpyA;ansi";
Function ulong lstrcpyA(ref ulong Destination, blob Source) library "kernel32.dll" ALIAS FOR "lstrcpy;ansi";

Function ulong lstrcpyW(ref string Destination, string Source) library "kernel32.dll" ALIAS FOR "lstrcpyW";
Function ulong lstrcpyW(ref ulong Destination, string Source) library "kernel32.dll" ALIAS FOR "lstrcpyW";
Function ulong lstrcpyW(ref ulong Destination, blob Source) library "kernel32.dll" ALIAS FOR "lstrcpyW";

SUBROUTINE MD5Init  (ref md5_ctx lpContext ) Library "cryptdll.dll" alias for "MD5Init;ansi"
SUBROUTINE MD5Final (ref md5_ctx lpContext ) Library "cryptdll.dll" alias for "MD5Final;ansi"
SUBROUTINE MD5Update (ref md5_ctx lpContext ,ulong lpBuffer,ulong BufSize ) Library "cryptdll.dll" alias for "MD5Update;ansi"
SUBROUTINE MD5Update (ref md5_ctx lpContext,blob lpBuffer,ulong BufSize ) Library "cryptdll.dll" alias for "MD5Update;ansi"

Function long GlobalAlloc (long hMem,long l_size )  Library "kernel32" alias for "GlobalAlloc;ansi"
Function long GlobalSize (long hMem )  Library "kernel32" alias for "GlobalSize;ansi"
Function Long GlobalLock   (long hMem ) Library "kernel32" alias for "GlobalLock;ansi"
Function Long GlobalUnlock   (long hMem ) Library "kernel32" alias for "GlobalUnlock;ansi"

Function long OpenClipboard (long hwnd )  Library "user32" alias for "OpenClipboard;ansi"
Function long CloseClipboard()  Library "user32"  alias for "CloseClipboard;ansi"
Function long GetClipboardData(long wFormat )  Library "user32" alias for "GetClipboardData;ansi"

subroutine DragAcceptFiles(ulong hndle, boolean bflag ) library 'shell32.dll' alias for "DragAcceptFiles;ansi"
function ulong DragQueryFile( ulong ul_Drop, ulong ul_index, ref string LPTSTR, ulong cb ) library 'shell32.dll' alias for "DragQueryFileA;Ansi" 
Subroutine DragFinish(ULong hDrop) Library "Shell32.dll"
end prototypes

type variables
//hotkey
powerobject ipo_hotkey[] //{dw_1}
string is_hotkeyflags[] //{'Ctrl'}
char is_hotkey[] //{'A'}
long il_atom[]
int i_keyflags[]
keycode ikc_hotkeycode[]

private:
int i_hotkeyflags[]
string is_atom[]

public:
//winuser.h
Constant Long GWL_STYLE = -16 //窗口样式
Constant Long WS_SYSMENU = 524288 //带系统菜单的窗口
Constant long WS_THICKFRAME=262144	//窗口可以改变大小
Constant Long WS_MINIMIZEBOX = 131072 //创建一个有最小化按扭的窗体。
Constant Long WS_MAXIMIZEBOX = 65536 //创建一个有最大化按扭的窗体。
Constant Long WS_DLGFRAME = 4194304 //创建一个有双边但无标题的窗体。
Constant Long WS_VSCROLL = 2097152 //创建一个有垂直滚动条的窗体。
Constant Long WS_HSCROLL = 1048576 //创建一个带水平滚动条的窗体。
Constant Long WS_GROUP = 131072 //指定一组控制的第一个控制
 
//ExitWindowsEx第一个参数
Constant Long EWX_FORCE=4; //关闭所有程序并以其他用户身份登录？（！！应为“强制执行否”吧！！）
Constant Long EWX_LOGOFF=0; //重新启动计算机并切换到MS-DOS方式
Constant Long EWX_REBOOT=2; //重新启动计算机
Constant Long EWX_SHUTDOWN=1;//关闭计算机
Constant Long EWX_POWEROFF=8;//把电源切断

// Shell File Operations
constant int FO_MOVE = asc('~h01')
constant int FO_COPY = asc('~h02')
constant int FO_DELETE = asc('~h03')
constant int FO_RENAME = asc('~h04')
constant int FOF_MULTIDESTFILES = asc('~h01')
constant int FOF_CONFIRMMOUSE = asc('~h02')
constant int FOF_SILENT = asc('~h04') //don't create progress/report
constant int FOF_RENAMEONCOLLISION = asc('~h08')
constant int FOF_NOCONFIRMATION = asc('~h10') // Don't prompt the user.
constant int FOF_WANTMAPPINGHANDLE = asc('~h20') // Fill in SHFILEOPSTRUCT.hNameMappings
 // Must be freed using SHFreeNameMappings
constant int FOF_ALLOWUNDO = asc('~h40')
constant int FOF_FILESONLY = asc('~h80') // on *.*, do only files
constant int FOF_SIMPLEPROGRESS = asc('~h10') * asc('~h10') // means don't show names of files
constant int FOF_NOCONFIRMMKDIR = asc('~h10') * asc('~h20') // don't confirm making any needed dirs

constant int PO_DELETE = asc('~h13') // printer is being deleted
constant int PO_RENAME = asc('~h14') // printer is being renamed
constant int PO_PORTCHANGE = asc('~h20') // port this printer connected to is being changed
 // if this id is set, the strings received by
 // the copyhook are a doubly-null terminated
 // list of strings. The first is the printer
 // name and the second is the printer port.
constant int PO_REN_PORT = asc('~h34') // PO_RENAME and PO_PORTCHANGE at same time.

Constant long TV_FIRST = 4352 
Constant long TVM_DELETEITEM = (TV_FIRST + 1) 
Constant long TVM_EXPAND = (TV_FIRST + 2) 
Constant long TVM_GETITEMRECT = (TV_FIRST + 4) 
Constant long TVM_GETCOUNT = (TV_FIRST + 5) 
Constant long TVM_GETINDENT = (TV_FIRST + 6) 
Constant long TVM_SETINDENT = (TV_FIRST + 7) 
Constant long TVM_GETIMAGELIST = (TV_FIRST + 8) 
Constant long TVM_SETIMAGELIST = (TV_FIRST + 9) 
Constant long TVM_GETNEXTITEM = (TV_FIRST + 10) 
Constant long TVM_SELECTITEM = (TV_FIRST + 11) 

 Constant long TVM_GETITEM = (TV_FIRST + 62) 
 Constant long TVM_SETITEM = (TV_FIRST + 63) 
 Constant long TVM_EDITLABEL = (TV_FIRST + 65) 

 
Constant long TVM_GETEDITCONTROL = (TV_FIRST + 15) 
Constant long TVM_GETVISIBLECOUNT = (TV_FIRST + 16) 
Constant long TVM_HITTEST = (TV_FIRST + 17) 
Constant long TVM_CREATEDRAGIMAGE = (TV_FIRST + 18) 
Constant long TVM_SORTCHILDREN = (TV_FIRST + 19) 
Constant long TVM_ENSUREVISIBLE = (TV_FIRST + 20) 
Constant long TVM_SORTCHILDRENCB = (TV_FIRST + 21) 
Constant long TVM_ENDEDITLABELNOW = (TV_FIRST + 22) 
 Constant long TVM_GETISEARCHSTRING = (TV_FIRST + 64) 
Constant long TVM_SETTOOLTIPS = (TV_FIRST + 24) 
Constant long TVM_GETTOOLTIPS = (TV_FIRST + 25) 

//Public Enum TVM_EXPAND_wParam 
Constant long TVE_COLLAPSE = 1 
Constant long TVE_EXPAND = 2 
Constant long TVE_TOGGLE = 3 
Constant long TVE_EXPANDPARTIAL = 16384
Constant long TVE_COLLAPSERESET = 32768

Constant long TVGN_ROOT = asc('~h00') 
Constant long TVGN_NEXT = asc('~h01') 
Constant long TVGN_PREVIOUS = asc('~h02') 
Constant long TVGN_PARENT = asc('~h03') 
Constant long TVGN_CHILD = asc('~h04') 
Constant long TVGN_FIRSTVISIBLE = asc('~h05') 
Constant long TVGN_NEXTVISIBLE = asc('~h06') 
Constant long TVGN_PREVIOUSVISIBLE = asc('~h07') 
Constant long TVGN_DROPHILITE = asc('~h08') 
Constant long TVGN_CARET = asc('~h09') 
Constant long TVHT_ONITEMLABEL=4

CONSTANT int VK_TAB=09
CONSTANT int VK_SHIFT=16
CONSTANT int VK_CONTROL=11

constant long WM_GETTEXTLENGTH=asc('~h0E')
constant long WM_GETTEXT=asc('~h0D')

CONSTANT ulong GENERIC_READ=2147483648
CONSTANT ulong FILE_SHARE_READ=1
CONSTANT ulong OPEN_EXISTING=3
CONSTANT ulong FILE_ATTRIBUTE_NORMAL=128
CONSTANT ulong PAGE_READONLY=2
CONSTANT ulong FILE_MAP_READ=4

CONSTANT long CF_HDROP=15




end variables

forward prototypes
public function string decto (decimal ad_dec, readonly unsignedinteger aui_sys)
public function integer hexencode (ref byte lb_array[], ref character lc_result[])
public function string hexencode (readonly string as_text, readonly encoding ae_encode)
public function string urlencode (string ls_text, encoding ae_encode)
end prototypes

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

public function string hexencode (readonly string as_text, readonly encoding ae_encode);//将字符转换成16进制编码
//参数1:是要转换的字符
//参数2:源字符中编码
//返回16进制编码

byte lb_array[]
char lc_result[]

lb_array[]=getbytearray(blob(as_text,ae_encode))
hexencode(lb_array[],lc_result[])
 
return lc_result[]


end function

public function string urlencode (string ls_text, encoding ae_encode);//对中文字符进行url 编码
//参数1:要编码的字符串
//参数2:要以哪种字符集编码
char lc_ret[],as_text[]
string ls_ret
int i,j,li_len
string ls_temp

as_text[]=ls_text

for i=1 to upperbound(as_text)
	//if asc(as_text[i])>19968 then
		ls_temp=hexencode(as_text[i],ae_encode)
		li_len=len(ls_temp)
		li_len=li_len + li_len / 2		//增加百分号以后长度会增加1/2
		for j=1 to  li_len step 3
			ls_temp=replace(ls_temp,j,0,'%')
		next
//	else
//		ls_temp=as_text[i]
//	end if
	ls_ret+=ls_temp
next

return ls_ret
end function

on u_runsa_derek_url.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_runsa_derek_url.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

