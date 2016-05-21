$PBExportHeader$u_derek_v2_fun.sru
$PBExportComments$derek专用函数
forward
global type u_derek_v2_fun from nonvisualobject
end type
type shfileopstruct from structure within u_derek_v2_fun
end type
type md5_ctx from structure within u_derek_v2_fun
end type
type shellexecuteinfo from structure within u_derek_v2_fun
end type
type ole_vbscript from oleobject within u_derek_v2_fun
end type
type ids_temp from datastore within u_derek_v2_fun
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
	char		a[8]
	char		b[16]
	char		c[64]
	char		d[16]
end type

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

global type u_derek_v2_fun from nonvisualobject
ole_vbscript ole_vbscript
ids_temp ids_temp
end type
global u_derek_v2_fun u_derek_v2_fun

type prototypes
//执行应用程序
FUNCTION long WinExec(string lpCmdLine,ulong nCmdShow) LIBRARY "kernel32.dll" ALIAS FOR "WinExec;ansi"
//操作文件
FUNCTION long ShellExecute(ulong hwnd,string lpOperation,ref string lpFile,ref string lpParameters,ref string lpDirectory,ulong nShowCmd) LIBRARY "shell32.dll" ALIAS FOR "ShellExecuteA;ansi"
function long ShellExecuteEx(ref shellexecuteinfo sei) library 'shell32' alias for "ShellExecuteEx;ansi"
//等待进程结束
FUNCTION ulong WaitForSingleObject( ulong hHandle,ulong dwMilliseconds ) LIBRARY "kernel32.dll"alias for "WaitForSingleObject;ansi"

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
Function long GetStockObject (long nIndex ) Library "gdi32" Alias for "GetStockObject;ansi" 

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
SUBROUTINE keybd_event (int bVk,int bScan,long dwFlags,long dwExtralnfo) LIBRARY "user32.dll"   ALIAS FOR "keybd_event;ansi"
SUBROUTINE mouse_event(Long dwFlags, Long dx , Long dy , Long cButtons, Long dwExtraInfo) LIBRARY "user32" Alias for "mouse_event;ansi" 
function long GetKeyState  (Long nVirtKey ) Library "user32" Alias for "GetKeyState;ansi" 

Function long SendMessage ( Long hwnd, Long wMsg,/*不用 ref*/ Long wParam, ref string lParam ) library "user32" Alias for "SendMessageA;ansi"
Function long SendMessage ( Long hwnd, Long wMsg,/*不用 ref*/ Long wParam, ref char lParam[]) library "user32" Alias for "SendMessageA;ansi"
Function long SendMessage(long hWnd, long uMsg, long wParam, REF long ToolInfo[]) library "user32.dll" Alias For "SendMessageA;ansi" 

FUNCTION ulong CreateFile(ref string lpFileName,ulong dwDesiredAccess,ulong dwShareMode,ref ulong lpSecurityAttributes[3],ulong dwCreationDisposition,ulong dwFlagsAndAttributes,ulong hTemplateFile) LIBRARY "kernel32.dll" ALIAS FOR "CreateFileA;ansi" 
Function ulong CreateFileMapping (ulong hFile ,ulong lpFileMappigAttributes[3], ulong flProtect , ulong dwMaximumSizeHigh , ulong dwMaximumSizeLow ,ref String lpName ) Library "kernel32" Alias for "CreateFileMappingA;ansi" 
Function ulong OpenFileMapping(ulong dwDesiredAccess , boolean bInheritHandle ,ref string lpName)  Library "kernel32" Alias for "OpenFileMappingA;ansi" 
Function ulong  MapViewOfFile  (ulong hFileMappingObject , ulong dwDesiredAccess , ulong dwFileOffsetHigh , ulong dwFileOffsetLow , ulong dwNumberOfBytesToMap ) Library "kernel32"Alias for "MapViewOfFile" 
SUBROUTINE UnmapViewOfFile (ulong lpBaseAddress ) Library "kernel32" alias for "UnmapViewOfFile;ansi"

Function long LocalAlloc(long Flags, long Bytes) library "kernel32.dll"  alias for "LocalAlloc;ansi"
Function long LocalFree(long MemHandle) library "kernel32.dll"  alias for "LocalFree;ansi"

Function long lstrcpy(/*不加ref*/ long Destination, string Source) library "kernel32.dll" ALIAS FOR "lstrcpy;ansi";
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

CONSTANT long TTM_UPDATETIPTEXTA=1024+12


end variables

forward prototypes
public subroutine move (datawindow adw_control)
public function string replace (string as_text, string as_str1, string as_str2)
public function decimal power (decimal ad_num, integer ad_power)
public function any arraysort (any a[], readonly string as_sort)
public function string hexstring (string as_text) //, readonly encoding ae_encode
public function string decto (decimal ad_dec, readonly unsignedinteger aui_sys)
public function string createpath (string as_filepath)
public function any array2dsort (any a_array, string as_sort, integer al_upperbound)
public function long readtxt (readonly string as_filepath, ref string as_text)
public function long readblob (readonly string as_filepath, ref blob ab_text, long al_start, long al_len)
public function string uf_filewrite (readonly string as_filepath, readonly string as_text)
public function string uf_checkdll (string as_classname, string as_dllname, integer ai_reg)
public function string geterror (string as_apiname, integer as_errorcode)
public function integer uf_getweek (date ad_date, integer ai_firstday)
public function integer uf_daynumber (date ad_date, integer ai_firstday)
public function string uf_filewrite (readonly string as_filepath, readonly blob ab_text)
public function integer shfilecopy (string source, string dest)
public function string getstr (readonly string as_array[], readonly string as_sep, readonly integer ai_option)
public function integer getfileopenname (string title, ref string pathname, ref string filename, string extension, string filter, string initdir, unsignedlong aflag)
public function integer getfileopenname (string title, ref string pathname, ref string filename[], string extension, string filter, string initdir, unsignedlong aflag)
public function integer getfilesavename (string title, ref string pathname, ref string filename, string extension, string filter, string initdir, unsignedlong aflag)
public function integer getfilesavename (string title, ref string pathname, ref string filename[], string extension, string filter, string initdir, unsignedlong aflag)
public function any getarray (ref string as_text, readonly string as_sep, readonly integer li_lastsep)
public function string uf_getimg (string as_filepath, ref string as_type, ref long al_width, ref long al_height)
public function integer uf_days_month (date ad_date)
public function long uf_findarray (ref long a_array[], readonly long a_value)
public function long uf_findarray (ref string a_array[], readonly string a_value)
public function string uf_registrypos (string as_key, string as_valuename)
public function long uf_findarray (ref string a_array[], readonly string a_value, integer ai_option)
public function decimal todec (string as_num, readonly decimal ad_sys)
public subroutine chartobyte (ref character ac_char[], ref int lb_byte[])
public subroutine hextobyte (ref character lc_char[], ref int lb_byte[])
public subroutine hextoasc (ref character lc_char[2], ref int lb_byte)
public subroutine hextochar (ref character lc_org[], ref character lc_new[])
public function string hexdecode (ref character ac_text[]) //, readonly encoding ae_encode
public function string uf_filewrite (readonly string as_filepath, readonly string as_text, readonly writemode a_writemode) //, readonly encoding a_encoding
public function string sendemail (string as_smtp, integer al_port, string as_logid, string as_logpwd, string as_from, string as_to, string as_subject, string as_body, string as_attachments)
public function window uf_getposwindow (powerobject lpo)
public subroutine uf_hotkey_initial ()
public subroutine uf_hotkey_reg (window lw_panret, powerobject lpo_child)
public subroutine uf_hotkey_unreg (window lw_parent, powerobject lpo_child)
public function keycode uf_getkeycode (string ls_key)
public function decimal uf_textextent (long l_handle, string ls_text)
public subroutine uf_fontfromdwo (statictext lst_text, datawindow ldw, string ls_dwoname)
public function integer replaceex (ref string ls_text, character as_str1[], character as_str2[])
public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[])
public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[], integer li_option)
public function any getarray (ref string as_text, readonly character as_sep[], readonly integer li_lastsep, readonly integer ai_trim)
public subroutine uf_winstyle (window lw_win)
public function datetime uf_dateadd (string as_datepart, long ai_number, datetime adt_date)
public function long uf_datediff (string ls_part, datetime ldt_start, datetime ldt_end)
public function string uf_vbscript_initial ()
public function string uf_msscript_addcode (oleobject lole, string ls_script)
public function integer uf_base64 (ref blob lb_content, ref string ls_result)
public function integer hexencode (ref int lb_array[], ref character lc_result[])
public function string uf_md5file (ref string ls_filename, ref string ls_result)
public function string urlencode (character as_text[])
public function string hexencode (readonly string as_text)
public function string uf_md5string (ref blob ls_string, ref string ls_result)
public function string uf_clipfiles (ref string ls_files[])
public function string uf_posvalue (string ls_args,string ls_field,string ls_endstr)
public function string uf_tooltip_get (long l_winhwd, ref long l_tiphwd)
public function string uf_tooltip_set (long l_whandle, long l_tiphwd, ref string tiptext)
public function string uf_getkeycode (keycode lkeycode)
public function integer regdll (string as_dllpath, string as_function, ref string as_info)
public function string uf_run (string ls_file, string ls_param, string ls_directory, long l_show, string ls_verb, long l_parenthandle)
public function integer uf_urldata (ref string ls_urldata, ref string ls_names[], ref string ls_values[])
public function string urldecode (readonly character as_text[])
public function string uf_geterrtext (string ls_methodname, integer li_errcode)
end prototypes

public subroutine move (datawindow adw_control);
int x2,y2
//powerobject po_1
//po_1=adw_control
//do until typeof(po_1)=window!
//	po_1=po_1.getparent()
//loop
//window w_2
//w_2=po_1
//
//x2=w_2.PointerX ()
//y2=w_2.PointerY ()
//
//messagebox('',string(x2)+string(y2,'/###'))
//
//if w_2.PointerX () + adw_control.width > w_2.width then
//	x2=w_2.PointerX () - adw_control.width
//end if
//if w_2.PointerY () + adw_control.height > w_2.height then
//	y2=w_2.PointerY () - adw_control.height
//end if
//adw_control.bringtotop=true
//adw_control.move(x2,y2)
powerobject po_parent
po_parent=adw_control.getparent()
adw_control.bringtotop=true
adw_control.move(po_parent.dynamic pointerx(),po_parent.dynamic pointery())
end subroutine

public function string replace (string as_text, string as_str1, string as_str2);//字符串替换函数
//参数1:操作的字符串
//参数2:要替换的字符
//参数3:目标字符
//返回值:返回已替换的字符串

long li_pos
long li_len1,li_len2
li_len1=len(as_str1)
li_len2=len(as_str2)
li_pos=Pos(as_text,as_str1,1)
do while(li_pos>0)
	as_text=Replace(as_text,li_pos,li_len1,as_str2)
	li_pos=Pos(as_text,as_str1,li_pos + li_len2 )
loop
return as_text
end function

public function decimal power (decimal ad_num, integer ad_power);//作用:得到数字的指定次方
//参数1:要操作的数字
//参数2:次方数
//说明:ad_power 只能是整数

//dec i 
//dec ld_result
//
//if ad_num=0 then //操作数为零时,返回值始终为0 
//	ld_result=0 
//	goto e
//end if
//
//if ad_power=0 then //次方为零时,返回值为1
//	ld_result=1
//	goto e
//else	//次方不等于零时
//	ld_result=ad_num
//	for i=2 to abs(ad_power) 
//		ld_result*=ad_num
//	next
//end if
//
//if ad_power<0 then ld_result=1 / ld_result	//次方小于零时,返回值为1 / 结果
//
//e:
//return ld_result

return ad_num^ad_power	//返回ad_num的ad_power次幂
end function

public function any arraysort (any a[], readonly string as_sort);//对一维数组进行排序
//参数1:要排序的数组
//参数2:升序:asc 否则为降序
//返回排序后的数组

any c[]
int i,m,n

for i=1 to upperbound(a)
	m=i
	for n=i + 1 to upperbound(a)
		if as_sort='asc'  then 
			if  a[m]>a[n] then m=n
		else
			if  a[m]<a[n] then m=n
		end if
	next
	c[i]=a[m] //记录值
	a[m]=a[i] //记录i处的值
next
return c


end function

public function string hexstring (string as_text);//将字符转换成16进制编码
//参数1:是要转换的字符
//参数2:源字符中编码
//返回16进制编码

return hexencode(as_text)
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

public function string createpath (string as_filepath);//作用:创建路径
//参数:路径
//返回值:成功返回空字符串,失败返回创建失败的路径,参数为null或''则返回''
//说明:
//1.以'\'结尾则创建路径中所有文件夹,否则创建所有文件夹及一个文件
//2.以'\'开头,则在当前磁盘根目录下创建
//3.可以指定绝对路径(C:\1\2\3.txt)
//4.可以指定相对路径(.\1\2\3.txt)


string ls_dir
long l_hwd
int li_pos=0
as_filepath=trim(as_filepath)
if isnull(as_filepath) or as_filepath='' then return ''

if mid(as_filepath,2,1)=':' then li_pos=3	//绝对路径

do
	li_pos=pos(as_filepath,'\',li_pos + 1)
	if li_pos=0 then exit;
	ls_dir=mid(as_filepath,1,li_pos - 1)
	if directoryexists(ls_dir)=false then 
		if createdirectory(ls_dir)=-1 then return ls_dir
	end if
loop until li_pos=0

if left(as_filepath,1)<>'\' then 
	if fileexists(as_filepath)=false then
		l_hwd=fileopen(as_filepath,Linemode!,Write!,LockWrite!,Append!)
		fileclose(l_hwd)
		if l_hwd=-1 then return as_filepath
	end if
end if

return ''
end function

public function any array2dsort (any a_array, string as_sort, integer al_upperbound);//功能:对2维数组排序
//参数1:要排序的数组
//参数2:升序:asc 否则为降序
//参数3:数组结束位置
//返回排序后的数组
//注:数组赋值如果界不同会先补满第一维,然后再是第二维
//调用此函数的数组上界<=1000,要排序的数据类型要一致

any la_value,la_value1,la_value2,la_array2[1000,2],la_tmp
int i,m,n
int li_ub,li_ub2
string ls_datatype	//要排序的数据类型,取第一个元素的数据类型


li_ub=upperbound(a_array)
li_ub2=upperbound(la_array2)
if al_upperbound>al_upperbound or al_upperbound=0 then al_upperbound=li_ub
if li_ub>li_ub2 then
	messagebox('提示','上界不能大于'+string(li_ub2)+'!')
	return a_array
end if

la_array2=a_array		//数组赋值如果界不同会先补满第一维,然后再是第二维

ls_datatype=classname(la_array2[1,1])

for i=1 to al_upperbound
	choose case ls_datatype
		case 'integer'
			la_value1=integer(la_array2[i,1])
		case 'long'
			la_value1=long(la_array2[i,1])
		case 'decimal'
			la_value1=dec(la_array2[i,1])
		case 'double'
			la_value1=double(la_array2[i,1])
		case 'string'
			la_value1=string(la_array2[i,1])
		case 'time'
			la_value1=time(la_array2[i,1])
		case 'date'
			la_value1=date(la_array2[i,1])
		case 'datetime'
			la_value1=datetime(la_array2[i,1])
	end choose

	if isnull(la_value1) then 
		messagebox('提示','不能有空值'+string(i)+'!')
		return a_array
	end if

	m=i
	for n=i + 1 to al_upperbound
		if isnull(la_array2[n,1]) then 
			messagebox('提示','不能有空值'+string(n)+'!')
			return a_array
		end if
		
		choose case ls_datatype
			case 'integer'
				la_tmp=integer(la_array2[n,1])
			case 'long'
				la_tmp=long(la_array2[n,1])
			case 'decimal'
				la_tmp=dec(la_array2[n,1])
			case 'double'
				la_tmp=double(la_array2[n,1])
			case 'string'
				la_tmp=string(la_array2[n,1])
			case 'time'
				la_tmp=time(la_array2[n,1])
			case 'date'
				la_tmp=date(la_array2[n,1])
			case 'datetime'
				la_tmp=datetime(la_array2[n,1])
		end choose
//		messagebox(classname(la_value1)+'/'+string(la_value1),classname(la_tmp)+'/'+string(la_tmp))
		if as_sort='asc'  then 
			if  la_value1>la_tmp then 
				la_value1=la_tmp
				if li_ub=li_ub2 then
					la_value2=la_array2[n,2]
				else
					la_value2=la_array2[n + li_ub,1]
				end if
				m=n
			end if
		else
			if  la_value1<la_tmp then 
				la_value1=la_tmp
				if li_ub=li_ub2 then
					la_value2=la_array2[n,2]
				else
					la_value2=la_array2[n + li_ub,1]
				end if
				m=n
			end if
		end if
	next

	if m>i then 
		la_array2[m,1]=la_array2[i,1]	//记录i处的值
		if li_ub=li_ub2 then
			la_array2[m,2]=la_array2[i,2]
		else
			la_array2[m + li_ub,1]=la_array2[i + li_ub,1]
		end if
		
		la_array2[i,1]=la_value1	//记录m处的值
		if li_ub=li_ub2 then
			la_array2[i,2]=la_value2
		else
			la_array2[i + li_ub,1]=la_value2
		end if
		
	end if
	
next

return la_array2
end function

public function long readtxt (readonly string as_filepath, ref string as_text);//读取txt文本的内容
//最大内容1073741823字节
//参数:as_filepath 文件路径,as_text 返回文本内容
//返回值:返回内容的字节数,内容放在as_text变量中,失败返回-1

long l_hwd,l_ret
long l_length
string ls_errtext

if string(trim(as_filepath),'')='' then
	ls_errtext='文件名不能为空!'
	goto e
end if

if fileexists(as_filepath)=false then 
	ls_errtext='文件'+as_filepath+'不存在!'
	goto e
end if


l_length=FileLength(as_filepath)

if l_length>1073741823 then 
	ls_errtext='文件大小'+string(l_length)+',只能读取1,073,741,823字节'
end if

//int(-32768 to +32767)	16
//long(-2147483648 to +2147483647)	32
//longlong(-9223372036854775808 to 9223372036854775807)	64
//uint(0 to 65535)	16
//ulong(0 to 4,294,967,295)	32
//string(1,073,741,823)
//dec(123.456, 0.000000000000000000000001 or 12345678901234.5678901234)
//real(-3.402822E-38 to -3.402822E+38)
//double(2.2250738585073E-308 to 1.79769313486231E+308)
//time(00:00:00 to 23:59:59.999999)
//date(1000 to 3000)

l_hwd=fileopen(as_filepath,lineMode!,read!,lockwrite!)
if l_hwd=-1 then 
	ls_errtext='文件:'+as_filepath+'打开失败!'
	goto e
end if

l_length=fileread(l_hwd,as_text)
if l_length=-100 then l_length=0	//无内容
if l_length>=0 then 
else
	ls_errtext+='文件:'+as_filepath+'读取失败!'
end if

l_ret=fileclose(l_hwd)

if l_ret=-1 then 
	ls_errtext+='文件:'+as_filepath+'关闭失败!'
end if

//if ls_errtext<>'' then messagebox('',ls_errtext)
return l_length

e:
//if ls_errtext<>'' then messagebox('',ls_errtext)
return -1

end function

public function long readblob (readonly string as_filepath, ref blob ab_text, long al_start, long al_len);//读取文件的内容
//参数:as_filepath 文件路径,ab_text 返回blob类型的内容,开始读取的字节位,字节读取的长度
//返回值:返回内容的字节数,内容放在ab_text变量中,失败返回-1

long l_hwd,l_ret,i
long l_length
string ls_errtext

if string(trim(as_filepath),'')='' then
	ls_errtext='文件名不能为空!'
	goto e
end if

if fileexists(as_filepath)=false then 
	ls_errtext='文件'+as_filepath+'不存在!'
	goto e
end if


//l_length=FileLength(as_filepath)
//
//if l_length>1073741823 then 
//	ls_errtext='文件大小'+string(l_length)+',只能读取1,073,741,823字节'
//end if

//int(-32768 to +32767)	16
//long(-2147483648 to +2147483647)	32
//longlong(-9223372036854775808 to 9223372036854775807)	64
//uint(0 to 65535)	16
//ulong(0 to 4,294,967,295)	32
//string(1,073,741,823)
//dec(123.456, 0.000000000000000000000001 or 12345678901234.5678901234)
//real(-3.402822E-38 to -3.402822E+38)
//double(2.2250738585073E-308 to 1.79769313486231E+308)
//time(00:00:00 to 23:59:59.999999)
//date(1000 to 3000)

l_hwd=fileopen(as_filepath,StreamMode!,read!,lockwrite!)
if l_hwd=-1 then 
	ls_errtext='文件:'+as_filepath+'打开失败!'
	goto e
end if

if al_start<=1 then
	
else

	//l_length=fileread(l_hwd,ab_text,al_start - 1)
	if l_length=-100 then l_length=0	//无内容
	if l_length>=0 then 
	else
		messagebox('','文件:'+as_filepath+'读取失败!')
	end if
	
end if

if al_len<=0 then 
	l_length=fileread(l_hwd,ab_text)
	if l_length=-100 then l_length=0	//无内容
	if l_length>=0 then 
	else
		messagebox('','文件:'+as_filepath+'读取失败!')
	end if
else
	//l_length=fileread(l_hwd,ab_text,al_len)
	if l_length=-100 then l_length=0	//无内容
	if l_length>=0 then 
	else
		messagebox('','文件:'+as_filepath+'读取失败!')
	end if

end if


l_ret=fileclose(l_hwd)

if l_ret=-1 then 
	messagebox('','文件:'+as_filepath+'关闭失败!')
end if

return l_length


e:
if ls_errtext<>'' then messagebox('',ls_errtext)
return -1

end function

public function string uf_filewrite (readonly string as_filepath, readonly string as_text);//写文件的内容
//参数:as_filepath 文件路径,as_text 返回blob类型的内容
//返回值:''为成功,否则为失败信息

return uf_filewrite(as_filepath,as_text,Append!)
end function

public function string uf_checkdll (string as_classname, string as_dllname, integer ai_reg);//检查对象类
//参数:as_classname 要检查的类名
//as_dllname	要注册的dll/ocx
//失败是否自动注册,"1":是,否则不注册

string ls_ret
int l_ret

oleobject lobj
lobj=create oleobject

as_dllname=trim(as_dllname)

l_ret=lobj.connecttonewobject(as_classname)

if l_ret<>0 then
	
	if ai_reg=1 and as_dllname<>'' then
		if regdll(as_dllname,'reg',ls_ret)=-1 then 
			ls_ret=as_dllname+"注册失败:"+ls_ret
			goto e
		else
			ls_ret=uf_checkdll(as_classname,'',0)
			if ls_ret<>'' then 
				ls_ret='重新'+ls_ret
				goto e
			end if 
		end if
	else
		ls_ret="连接到对象:"+as_classname+"失败:"+string(l_ret)
		goto e
	end if
	
end if

lobj.DisconnectObject ( )

e:
destroy lobj
return ls_ret
end function

public function string geterror (string as_apiname, integer as_errorcode);string ls_errtext=""
choose case lower(as_apiname)
	case "shellexecute","winexec"
		choose case as_errorcode
			case 0 
				ls_errtext="System was out of memory, executable file was corrupt, orrelocations were invalid."
			case 2 
				ls_errtext="File was not found."
			case 3 
				ls_errtext="Path was not found. "
			case 5 
				ls_errtext="Attempt was made to dynamically link to a task, or therewas a sharing or network-protection error."
			case 6  
				ls_errtext="Library required separate data segments for each task."
			case 8  
				ls_errtext="There was insufficient memory to start the application."
			case 10  
				ls_errtext="Windows version was incorrect."
			case 11  
				ls_errtext="Executable file was invalid. Either it was not a Windowsapplication, or there was an error in the .exe image."
			case 12  
				ls_errtext="Application was designed for a different operating system."
			case 13  
				ls_errtext="Application was designed for MS-DOS 4.0."
			case 14  
				ls_errtext="Type of executable file was unknown."
			case 15  
				ls_errtext="Attempt was made to load a real-mode application (developed for an earlier version of Windows)."
			case 16  
				ls_errtext="Attempt was made to load a second instance of anexecutable file containing multiple data segments thatwere not marked read-only."
			case 19  
				ls_errtext="Attempt was made to load a compressed executable file. Thefile must be decompressed before it can be loaded."
			case 20  
				ls_errtext="Dynamic-link library (DLL) file was invalid. One of theDLLs required to run this application was corrupt."
			case 21  
				ls_errtext="Application requires Microsoft Windows 32-bit extensions."
			case 31  
				ls_errtext="指定的操作没有关联."
		end choose
end choose
return ls_errtext
end function

public function integer uf_getweek (date ad_date, integer ai_firstday);integer   li_count,li_begin,li_end,li_period 
date   dd_begin,dd_end 
dd_begin=date(string(ad_date,'YYYY')+ '/01/01 ') 
dd_end=ad_date
//得到以周日为开始的日次
li_begin=daynumber(dd_begin) 
li_end=daynumber(dd_end) 

if ai_firstday=1 then 
	//周一为一周的开始
	if li_begin=1 then 
		li_begin=7
	else
		li_begin=li_begin - 1
	end if

	if li_end=1 then 
		li_end=7
	else
		li_end=li_end - 1
	end if
end if

li_count=daysafter(dd_begin,dd_end) 
li_period=integer(li_count/7)+1 
if   li_end>=li_begin   then 
	li_period=li_period 
else 
	li_period=li_period+1 
end   if 

return li_period
end function

public function integer uf_daynumber (date ad_date, integer ai_firstday);int l_daynum
//指定日期为当周的第几天
l_daynum=daynumber(ad_date)
if ai_firstday=1 then 
	if l_daynum=1 then 
		l_daynum=7
	else
		l_daynum=l_daynum - 1
	end if
end if
return l_daynum
end function

public function string uf_filewrite (readonly string as_filepath, readonly blob ab_text);//写文件的内容
//参数:as_filepath 文件路径,ab_text 返回blob类型的内容
//返回值:''为成功,否则为失败信息

long l_hwd,l_ret,i
long l_length
string ls_errtext


l_hwd=fileopen(as_filepath,StreamMode!,write!,lockwrite!)
if l_hwd=-1 then 
	ls_errtext+='文件:'+as_filepath+'打开失败!'
	goto e
end if

l_ret=filewrite(l_hwd,ab_text)

if l_ret=-1 then 
	ls_errtext+='文件:'+as_filepath+'写入失败'+string(l_ret)+'!'
end if 


l_ret=fileclose(l_hwd)

if l_ret=-1 then 
	ls_errtext+='文件:'+as_filepath+'关闭失败!'
end if

e:
return ls_errtext

end function

public function integer shfilecopy (string source, string dest);//boolean shfilecopy(string Source , string Dest)

//函数返回值为:boolean,成功执行，返回true,未成功返回false

//参数：string source为源文件

//            string dest为目标文件


boolean ib_return
long  result,l_lena,i
int lb_spath[],lb_dest[]

SHFILEOPSTRUCT fileop

//lb_spath[]=GetByteArray(blob(Source,encodingansi!))
//lb_dest[]=GetByteArray(blob(Dest,encodingansi!))

//初始化结构体
fileop.hwnd = 0 
fileop.wFunc = FO_COPY 
//fileop.pFrom = lb_spath
//fileop.pTo = lb_dest
//fileop.pFrom = blob(lb_spath)
//fileop.pTo = blob(lb_dest)
fileop.pFrom =string( blob(Source))
fileop.pTo = string(blob(Dest))

//fileop.pFrom =string( blob(Source,encodingutf16le!))
//fileop.pTo = string(blob(Dest,encodingutf16le!))

//fileop.pFrom =Source
//fileop.pTo = Dest
//
fileop.fFlags = FOF_NOCONFIRMATION 

result = SHFileOperation(fileop) 

return result


end function

public function string getstr (readonly string as_array[], readonly string as_sep, readonly integer ai_option);//将字符数组拼接成字符串返回,末尾无分隔符
//参数1:数组
//参数2:为分隔符
//参数3:是否忽略空字符串

string ls_str,ls_temp
long l_count,i

l_count=upperbound(as_array[])

if l_count=0 then return ''

if ai_option=0 then 

	ls_str=as_array[1]
	
	for i=2 to l_count
		ls_str+=as_sep+string(as_array[i],'')
	next
	
elseif ai_option=1 then 
	
	for i=1 to l_count
		
		ls_temp=trim(string(as_array[i],''))
		
		if ls_temp<>'' then 
			ls_str=ls_temp
			exit
		end if
		
	next
	
	for i=i+1 to l_count
		
		ls_temp=trim(string(as_array[i],''))
		
		if ls_temp<>'' then ls_str+=as_sep+ls_temp
		
	next
	
end if

return ls_str

end function

public function integer getfileopenname (string title, ref string pathname, ref string filename, string extension, string filter, string initdir, unsignedlong aflag);//系统的选择文件窗口,但不改变当前目录

string ls_GetCurrentDir
int li_ret
//aFlag=2 + 2^4

ls_GetCurrentDir=GetCurrentDirectory()

if initdir='' then initdir=ss_lastopendir

li_ret=::GetFileOpenName ( title, pathname, filename , extension , filter  , initdir , aFlag)

//DESTROY lsf_PB

if li_ret<>0 then 
	ss_lastopendir=GetCurrentDirectory()
	if ls_GetCurrentDir<>GetCurrentDirectory() then ChangeDirectory (ls_GetCurrentDir)
end if

return li_ret
end function

public function integer getfileopenname (string title, ref string pathname, ref string filename[], string extension, string filter, string initdir, unsignedlong aflag);//系统的选择文件窗口,但不改变当前目录

string ls_GetCurrentDir
int li_ret
ls_GetCurrentDir=GetCurrentDirectory()
if initdir='' then initdir=ss_lastopendir

li_ret=::GetFileOpenName ( title, pathname, filename , extension , filter  , initdir , aFlag)

if li_ret<>0 then 
	ss_lastopendir=GetCurrentDirectory()
	if ls_GetCurrentDir<>GetCurrentDirectory() then ChangeDirectory (ls_GetCurrentDir)
end if

return li_ret
end function

public function integer getfilesavename (string title, ref string pathname, ref string filename, string extension, string filter, string initdir, unsignedlong aflag);//系统的文件保存至窗口,但不改变当前目录

string ls_GetCurrentDir
int li_ret
ls_GetCurrentDir=GetCurrentDirectory()
if initdir='' then initdir=ss_lastopendir

li_ret=::GetFileSaveName ( title, pathname, filename , extension , filter  , initdir , aFlag)

if li_ret<>0 then 
	ss_lastopendir=GetCurrentDirectory()
	if ls_GetCurrentDir<>GetCurrentDirectory() then ChangeDirectory (ls_GetCurrentDir)
end if

return li_ret
end function

public function integer getfilesavename (string title, ref string pathname, ref string filename[], string extension, string filter, string initdir, unsignedlong aflag);//系统的文件保存至窗口,但不改变当前目录

string ls_GetCurrentDir
int li_ret
ls_GetCurrentDir=GetCurrentDirectory()
if initdir='' then initdir=ss_lastopendir

li_ret=::GetFileSaveName ( title, pathname, filename , extension , filter  , initdir , aFlag)

if li_ret<>0 then 
	ss_lastopendir=GetCurrentDirectory()
	if ls_GetCurrentDir<>GetCurrentDirectory() then ChangeDirectory (ls_GetCurrentDir)
end if

return li_ret
end function

public function any getarray (ref string as_text, readonly string as_sep, readonly integer li_lastsep);//得到分隔符分开后的数组
//参数1:要分隔的字符串
//参数2:分隔符
//参数3:是否以分隔符结尾(1:保留结尾的空字符 0:忽略最后的空字符)

string ls_ret[]
long l_count
l_count=getarray(as_text,ls_ret[],as_sep,li_lastsep)
return ls_ret[]
end function

public function string uf_getimg (string as_filepath, ref string as_type, ref long al_width, ref long al_height);//获取图片的类型及宽度,高度
//支持bmp,gif,png,emf,tif,jpg,wmf,ico...等

blob lb_header
int lb_array[]
long l_hwd,l_ret,i
long l_length,l_num
string ls_errtext
string ls_vbsscript,ls_imginfo
int li_ret,li_pos,li_pos2
boolean lb_msscript_create

as_type=''
al_width=0
al_height=0

ls_vbsscript="Function getimg(as_filepath) ~r~n set img=loadpicture(as_filepath) ~r~n getimg=img.type&~"	~"&img.width&~"	~"&img.height ~r~n end function"

l_hwd=fileopen(as_filepath,StreamMode!,read!,lockwrite!)
if l_hwd=-1 then 
	ls_errtext='文件:'+as_filepath+'打开失败!'
	goto e
end if

l_length=fileread(l_hwd,lb_header)

l_ret=fileclose(l_hwd)

if l_ret=-1 then 
	ls_errtext='文件:'+as_filepath+'关闭失败!'
	goto e
end if

if l_length<=0 then 
	ls_errtext='文件:'+as_filepath+'无图像信息!'
	goto e
end if

//lb_array[]=getbytearray(lb_header)
	
if l_length>=2 then
	if char(lb_array[1])+char(lb_array[2])='BM' then //BM
		as_type='BMP'
		if l_length>=26 then 
			al_width=lb_array[19] + lb_array[20] * 256^1 + lb_array[21] * 256^2 + lb_array[22] * 256^3
			al_height=lb_array[23] + lb_array[24] * 256^1 + lb_array[25] * 256^2 + lb_array[26] * 256^3
		end if
		goto e
	end if
	if char(lb_array[1])+char(lb_array[2])='II' then 
		as_type='TIF'
		if l_length>=8 then 
			l_num=lb_array[5] + lb_array[6] * 256^1 + lb_array[7] * 256^2  + lb_array[8] * 256^3	//取DE的数量
			if l_length>=l_num + 37 then 
				al_width=lb_array[l_num + 23] + lb_array[l_num + 24] * 256^1 + lb_array[l_num + 25] * 256^2
				al_height=lb_array[l_num + 35] + lb_array[l_num + 36] * 256^1 + lb_array[l_num + 37] * 256^2
			end if
		end if
		goto e
	end if 
end if

if l_length>=3 then
	if char(lb_array[1])+char(lb_array[2])+char(lb_array[3])='GIF' then 
		as_type='GIF'
		if l_length>=10 then
			al_width=lb_array[7] + lb_array[8] * 256 
			al_height=lb_array[9] + lb_array[10] * 256
		end if
		goto e
	end if
end if

if l_length>=4 then
	if char(lb_array[2])+char(lb_array[3])+char(lb_array[4])='PNG' then 
		as_type='PNG'
		if l_length>=24 then 
			al_width=lb_array[19] * 256 + lb_array[20] 
			al_height=lb_array[23] * 256 + lb_array[24]
		end if
		goto e
	end if
end if

if l_length>=44 then
	if char(lb_array[42])+char(lb_array[43])+char(lb_array[44])='EMF' then 
		as_type='EMF'
		if l_length>=24 then 
			al_width=lb_array[17] + lb_array[18] * 256^1 + lb_array[19] * 256^2 + lb_array[20] * 256^3
			al_height=lb_array[21] + lb_array[22] * 256^1 + lb_array[23] * 256^2 + lb_array[24] * 256^3
		end if
		goto e
	end if 
end if

if l_length>=10 then
	if char(lb_array[7])+char(lb_array[8])+char(lb_array[9])+char(lb_array[10])='JFIF' then as_type='JPG'
end if
if as_type='' and l_length>=53 then
	if char(lb_array[51])+char(lb_array[52])+char(lb_array[53])='WMF' then as_type='WMF'
end if
//	for i=1 to l_length
//		if lb_array[i]=255 and lb_array[i + 1]=192 then //找位置 FF C0 
//			al_width=lb_array[i + 7] * 256 + lb_array[i + 8]
//			al_height=lb_array[i + 5] * 256 + lb_array[ i + 6]
//			exit
//		end if
//	next

//loo_msscript=create oleobject 


try 
	if not isalive(ole_vbscript) then 
		ls_errtext=uf_vbscript_initial()
		if ls_errtext<>'' then 
			THROW create runtimeerror
		end if
		lb_msscript_create=true //当前过程创建
		uf_msscript_addCode(ole_vbscript,'getimg')
	end if
	//运行一个指定的过程(返回过程的返回值),不定参数
	ls_imginfo=string(ole_vbscript.run('getimg',as_filepath))
catch (runtimeerror e)
	ls_errtext+='获取图像数据失败:'+e.getmessage()
finally
	//ole_vbscript.DisconnectObject ( )
end try

if ls_errtext<>'' then goto e

li_pos=pos(ls_imginfo,'~t')
li_pos2=pos(ls_imginfo,'~t',li_pos + 1)

if as_type='' then 

	choose case left(ls_imginfo,li_pos - 1)
		case '0'
//				as_type='None'
		case '1'
//				as_type='Bitmap'
		case '2'
//				as_type='Metafile'
		case '3'
//				as_type='Icon'
			as_type='ICO'
		case '4'
//				as_type='Win32-enhanced'
	end choose
end if

al_width=long(mid(ls_imginfo,li_pos + 1,li_pos2 - li_pos - 1)) / 26.4583
al_height=long(mid(ls_imginfo,li_pos2 + 1)) / 26.4583

e:
if lb_msscript_create=true then
	if isalive(ole_vbscript) then ole_vbscript.disconnectobject()
end if
return ls_errtext
end function

public function integer uf_days_month (date ad_date);int li_year,li_month
int li_days
boolean lb_leap //是否是闰年

li_year=year(ad_date)

li_month=month(ad_date)

choose case li_month
	case 1,3,5,7,8,10,12
		li_days=31
	case 4,6,9,11
		li_days=30
	case 2
		if mod(li_year,400)=0 then //被400整除为闰年
				lb_leap=true
			elseif mod(li_year,100)=0 then //不能被400整除,且能被100整除的不为闰年
				lb_leap=false
			elseif mod(li_year,4)=0 then //不能被100整除,且能被4整除的为闰年
				lb_leap=true
			else
				lb_leap=false
		end if
		if lb_leap=true then 
			li_days=29
		else
			li_days=28
		end if		
end choose
return li_days
end function

public function long uf_findarray (ref long a_array[], readonly long a_value);long l_count,i

l_count=upperbound(a_array[])
if l_count=0 then goto e

for i=1 to l_count
	if a_array[i]=a_value then exit
	if i=l_count then goto e
next

return i

e:
return 0



end function

public function long uf_findarray (ref string a_array[], readonly string a_value);
return uf_findarray(a_array,a_value,0)



//string ls_dwsyntax="release 12; "
//string ls_colsyntax
//string ls_datatype,ls_datatype_arg
//
//ls_dwsyntax+='~r~ntable('
//ls_colsyntax='column=(type='
//
//ls_datatype=classname(a_value)
//choose case ls_datatype
//	case 'integer','long'
//		ls_datatype='long'
//		ls_datatype_arg='number'
//	case 'decimal','double'
//		ls_datatype='number'
//		ls_datatype_arg='decimal'
//	case 'string'
//		ls_datatype='char(32768)'
//		ls_datatype_arg='string'
//	case 'time'
//		ls_datatype='time'
//		ls_datatype_arg=ls_datatype
//	case 'date'
//		ls_datatype='date'
//		ls_datatype_arg=ls_datatype
//	case 'datetime'
//		ls_datatype='datetime'
//		ls_datatype_arg=ls_datatype
//end choose
//ls_colsyntax+=ls_datatype+' updatewhereclause=yes name=a dbname="a" ) '
//
//ls_dwsyntax+=' ~r~n'+ls_colsyntax+' ~r~n retrieve="" arguments=(("b", '+ls_datatype_arg+')) ) '
//
////retrieve="" (必须要有retrieve参数,否则retrieve时参数值带不进去)
//
//ids_temp.create(ls_dwsyntax)
//
////设置参数值(返回-1参数值也会传进去)
//ids_temp.retrieve(a_value)
//
//ids_temp.object.a.primary=a_array
//
//return ids_temp.find('a=b',1,upperbound(a_array))
//
//
end function

public function string uf_registrypos (string as_key, string as_valuename);long l_hwd,l_hwd_systree,l_hwd_syslist
long l_hwd_menu
long l_ret
char lc_word[]
long i,j,l_count
string ls_words[]
boolean lb_open=true
string ls_valuearray[]
string ls_errtext
long id
long hItem,l_currentitem,l_parentitem,l_lastitem,l_rootitem

if RegistryValues(as_key, ls_valuearray)=-1 then
	ls_errtext="指定项未找到!"
	goto e
end if

if as_valuename<>'' then
	if uf_findarray(ls_valuearray[],as_valuename,1)=0 then  //忽略大小写
		ls_errtext='指定值未找到!'
		goto e
	end if
end if

//查找注册表窗口
l_hwd=findwindow('RegEdit_RegEdit','注册表编辑器')

//先关闭regedit窗口,不在当前打开的注册表上操作,为避免按键消息不稳定的问题
//if l_hwd>0 then 
//	send(l_hwd,asc('~h10'),0,0)
//	l_hwd=0
//end if

if l_hwd<=0 then //未打开则执行regedit.exe
	
	lb_open=false
	if RegistrySet ('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit','Lastkey',RegString! ,as_key)=-1 then
		ls_errtext='写注册表失败!'
		goto e
	end if
	//打开注册表
	ls_errtext=geterror('winexec',WinExec('regedit.exe',1))
	if ls_errtext<>'' then goto e
	
	//查找注册表窗口,获取句柄
	l_hwd=findwindow('RegEdit_RegEdit','注册表编辑器')
	if l_hwd<=0 then 
		ls_errtext='注册表未打开!'
		goto e
	end if

end if

//防止重绘 WM_SETREDRAW = &HB
//post(l_hwd_systree,asc('~h0B'),0,0)
//post(l_hwd_syslist,asc('~h0B'),0,0)
	
if lb_open=true then
	SetForegroundWindow(l_hwd)


	 
	 //*************************
	
//	hItem=send(l_hwd_systree,  TV_FIRST + 10,0,0)//root
	
//	messagebox('',send(l_hwd_systree,TVM_EXPAND,1,hItem)) //折叠 返回1 成功,0 为已折叠
//	messagebox('',send(l_hwd_systree,TVM_EXPAND,2,hItem)) //展开 返回1 成功,0 为已展开
//	hItem=Send(l_hwd_systree, TVM_GETNEXTITEM, TVGN_CARET,0) //当前选中项
//	send(l_hwd_systree,TVM_EXPAND,2,hItem) //展开
//	messagebox('',) //得到选中项

	
	
//	messagebox('',send(l_hwd_systree, TV_FIRST + 2,2,hItem)) // 是否可展开
//	messagebox('',send(l_hwd_systree,  TV_FIRST + 11,TVGN_CARET,hItem)) // 选中指定项
//	
//	l_nextitem=send(l_hwd_systree,  TV_FIRST + 10,6, hItem);//下一个可见项
//	messagebox('',send(l_hwd_systree,  TV_FIRST + 11,TVGN_CARET,l_nextitem)) // 选中指定项
//	 messagebox('',send(l_hwd_systree,TVM_GETINDENT,0,0)) //获取缩进量
//	 messagebox('',send(l_hwd_systree,TVM_SETINDENT,10,0)) //设置缩进量
	  
	 
	 
//*************************
//	 long hStr
//	 string astr
//	 hStr = GlobalAlloc(0,1024)
//	messagebox('',hstr)
//	hItem=send(l_hwd_systree,  TV_FIRST + 10,0,0)//root
//	messagebox('',hItem)
//	tvitem tv
//	tv.mask = 1
//	
//	tv.HTreeItem = hItem 
//	
//	tv.pszText = hStr
//	
//	tv.cchTextMax = 1023
//	
//	l_ret=Send(l_hwd_systree,TVM_GETITEM,0,tv)
//	
//	messagebox('',l_ret)
//	
//	   astr = space(1024)
//
////注：此处一定要分配足够空间，否则易非法操作
//
//    CopyMemory(astr, hStr, 1024)
//	 messagebox('',astr)
//
//    //bstr = Left(astr, (pos(astr, Char(0)) - 1))
//
//    l_ret = GlobalFree(hStr)
//

//*************************
//	tvhittestinfo tf
//	point pt
////	GetCursorPos(pt)
//	pt.x=987
//	pt.y=214
//	tf.pt=pt
//	tf.flags=TVHT_ONITEMLABEL
//	
//	hItem=send(l_hwd_systree,TVM_HITTEST,0,tf)//root
//	
//	messagebox('',hItem)
	

	
//*************************
	
//	send(l_hwd,260,asc('~h41'),536870912);
//	send(l_hwd,asc('~h32'),1089, 0)

//	send(l_hwd,256,asc('~h79'),1) //F10

	
//	 l_hwd_menu = GetSubMenu(l_hwd_menu, 3) //横向第几个菜单 - 1
//	 Send (l_hwd_menu, 262, asc('~h41'), 1)
//	 messagebox('',GetMenuItemCount(l_hwd_menu))
//	 id = GetMenuItemID(l_hwd_menu, 1) //纵向第几个菜单 - 1
//	  Send (l_hwd, 273, id, 0)
//	  messagebox('',string(l_hwd_menu)+'/'+string(id))
//	if RegistrySet ('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites','temp',RegString! ,as_key)=-1 then
//		ls_errtext='写注册表失败!'
//		goto e
//	end if
//	
//	l_hwd_menu=GetMenu(l_hwd)
//	l_hwd_menu = GetSubMenu(l_hwd_menu, 3) //横向第几个菜单 - 1
//	
//	keybd_event(18, 0, 0, 0) //按下alt
//	keybd_event(18, 0,2, 0) //释放alt
//	keybd_event(65, 0, 0, 0) //按下Tab  
//	keybd_event(65, 0, 2, 0) //释放Tab  
//	keybd_event(38, 0, 0, 0) //按下Tab  
//	keybd_event(38, 0, 2, 0) //释放Tab  
//	
//	keybd_event(13, 0, 0, 0) //按下Tab  
//	keybd_event(13, 0, 2, 0) //释放Tab  
	
//	id=GetMenuItemCount(l_hwd_menu) - 1
//	if id<>4 then messagebox('',id)
//	id = GetMenuItemID(l_hwd_menu, id) //纵向第几个菜单 - 1
//	Send (l_hwd, 273, id, 0)
	
//	Registrydelete ('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites','temp' )
	
//	send(l_hwd_menu,256,asc('~h79'),1) //F10
//	send(l_hwd_menu,asc('~h07'),0,0)
//	post(l_hwd_menu,256,asc('~h26'),1) //UP
//	post(l_hwd_menu,256,asc('~h0D'),1) //enter
	
	
	//查找树形控件
	l_hwd_systree=FindWindowEx(l_hwd,0,'SysTreeView32','')
	if l_hwd_systree<=0 then goto e
	
	ls_words[]=getarray(as_key,'\',0,1)
//	send(l_hwd_systree,256,asc('~h24'),1) //VK_HOME = &H24
	
	//将root设置为起始位置
	l_lastitem=send(l_hwd_systree,TVM_GETNEXTITEM,0,0) //获取root句柄
	send(l_hwd_systree, TVM_SELECTITEM,TVGN_CARET,l_lastitem) //选中root
	
	for i=1 to upperbound(ls_words[])
		
//		//收缩当前项
//		send(l_hwd_systree,TVM_EXPAND,1,l_lastitem) //l_currentitem=0 为root
//		//对子项排序
//		Send(l_hwd_systree, TVM_SORTCHILDREN, 0,l_lastitem)
//		//发送right键(展开)
//		send(l_hwd_systree,256,asc('~h27'),1) //VK_RIGHT = &H27
		
		//排序
		Send(l_hwd_systree, TVM_SORTCHILDREN, 0,l_lastitem)
		//展开
		send(l_hwd_systree,TVM_EXPAND,2,l_lastitem)
		//重新定位
		send(l_hwd_systree,256,asc('~h0D'),1) //回车 目的:中断上次定位,重新定位
		
		lc_word=ls_words[i]
		
		pos: //定位
		for j=1 to upperbound(lc_word[])
			send(l_hwd_systree,258,asc(lc_word[j]),1/*发送一次*/)
		next
		
		//当前选中项
		l_currentitem=Send(l_hwd_systree, TVM_GETNEXTITEM, TVGN_CARET,0)
		//父项
		l_parentitem=Send(l_hwd_systree, TVM_GETNEXTITEM,TVGN_PARENT,l_currentitem)
		
		//父项<>上一个节点
		if l_parentitem<>l_lastitem then 
			send(l_hwd_systree,256,asc('~h0D'),1) //回车 目的:中断上次定位,重新定位
//			messagebox(string(l_lastitem),string(l_parentitem)+'/'+string(l_currentitem))
			goto pos
		end if
		
		//记录当前节点
		l_lastitem=l_currentitem
	
	next
	
end if

if as_valuename<>'' then //查找列表控件
	
	l_hwd_syslist=FindWindowEx(l_hwd,0,'SysListView32','')
	if l_hwd_syslist<=0 then goto e

//	send(l_hwd_syslist,asc('~h0B'),0,0)
	
//定位值时要先等待一下,否则会定位不成功
//	for i=1 to 1000000
//	next
//	sleep(1)
	lc_word[]=as_valuename
	send(l_hwd_syslist,asc('~h07'),0,0)
	send(l_hwd_syslist,256,asc('~h01'),1)
	for j=1 to upperbound(lc_word[])
		send(l_hwd_syslist,258,asc(lc_word[j]),1/*发送一次*/)
	next
	
//	post(l_hwd_syslist,asc('~h0B'),1,0)
	
end if

//恢复重绘 WM_SETREDRAW = &HB
//post(l_hwd_systree,asc('~h0B'),1,0)
//post(l_hwd_syslist,asc('~h0B'),1,0)

return ''

e:
ls_errtext='定位注册表失败:'+ls_errtext
return ls_errtext




end function

public function long uf_findarray (ref string a_array[], readonly string a_value, integer ai_option);long l_count,i

l_count=upperbound(a_array[])
if l_count=0 then goto e

if ai_option=1 then //忽略大小写

	for i=1 to l_count
		if upper(a_array[i])=upper(a_value) then exit
		if i=l_count then goto e
	next
else
	for i=1 to l_count
		if a_array[i]=a_value then exit
		if i=l_count then goto e
	next
end if

return i

e:
return 0



//string ls_dwsyntax="release 12; "
//string ls_colsyntax
//string ls_datatype,ls_datatype_arg
//
//ls_dwsyntax+='~r~ntable('
//ls_colsyntax='column=(type='
//
//ls_datatype=classname(a_value)
//choose case ls_datatype
//	case 'integer','long'
//		ls_datatype='long'
//		ls_datatype_arg='number'
//	case 'decimal','double'
//		ls_datatype='number'
//		ls_datatype_arg='decimal'
//	case 'string'
//		ls_datatype='char(32768)'
//		ls_datatype_arg='string'
//	case 'time'
//		ls_datatype='time'
//		ls_datatype_arg=ls_datatype
//	case 'date'
//		ls_datatype='date'
//		ls_datatype_arg=ls_datatype
//	case 'datetime'
//		ls_datatype='datetime'
//		ls_datatype_arg=ls_datatype
//end choose
//ls_colsyntax+=ls_datatype+' updatewhereclause=yes name=a dbname="a" ) '
//
//ls_dwsyntax+=' ~r~n'+ls_colsyntax+' ~r~n retrieve="" arguments=(("b", '+ls_datatype_arg+')) ) '
//
////retrieve="" (必须要有retrieve参数,否则retrieve时参数值带不进去)
//
//ids_temp.create(ls_dwsyntax)
//
////设置参数值(返回-1参数值也会传进去)
//ids_temp.retrieve(a_value)
//
//ids_temp.object.a.primary=a_array
//
//return ids_temp.find('a=b',1,upperbound(a_array))
//
//
end function

public function decimal todec (string as_num, readonly decimal ad_sys);//其它进制转10进制数字函数
//参数1:要转换的数字
//参数2:源进制
//说明:ad_sys只能为整数

dec ld_num,ld_num1
string  ls_num1
int i,li_sign=1
int li_pos,li_len,li_pointpos,li_maxpower,li_minpower

if isnull(as_num) or isnull(ad_sys)  then return 0

if dec(as_num)<0 then 	//是负数
	li_sign=-1	
	as_num=mid(as_num,1)	//去除负号
end if

li_len=len(as_num)

if li_len=1 then
	if as_num>'9' then	//如果是字符
		ld_num=asc(as_num) - 64 + 9
	else
		ld_num=dec(as_num)
	end if
	
else

	li_pointpos=pos(as_num,'.')	//点的位置
	
	if li_pointpos=0 then 
		li_maxpower=li_len - 1
		li_minpower=0
	else
		li_maxpower=li_pointpos - 2
		li_minpower= li_pointpos - li_len 
	end if

	li_pos=1
	for i=li_maxpower to li_minpower step -1
		if li_pos=li_pointpos then 	//位置到点的位置
			i ++
		else
			ls_num1=mid(as_num,li_pos,1)
			ld_num1=todec(ls_num1,ad_sys)
			ld_num=ld_num + (ld_num1  * (ad_sys^i) )
		end if
		li_pos++	//位置加1
	next
	
end if

return ld_num * li_sign
end function

public subroutine chartobyte (ref character ac_char[], ref int lb_byte[]);//char[] -> byte[]
//256->0

ulong i,l_len
l_len=upperbound(ac_char[])
for i=1 to l_len
//	if asc(ac_char[i])=256 then
//		lb_byte[i]=0
//	else
		lb_byte[i]=asc(ac_char[i])
//	end if
next
end subroutine

public subroutine hextobyte (ref character lc_char[], ref int lb_byte[]);//将16进制串每两位转换->byte[]

int i,li_len
char lc_temp[2]
li_len=upperbound(lc_char[]) / 2
for i=1 to li_len step 1
	lc_temp[1]=lc_char[2 * i - 1]
	lc_temp[2]=lc_char[2 * i]
	hextoasc(lc_temp[],lb_byte[i])
next

////效率高,但其中加了if语句,导致效率降低
//char lc_new[]
//hextochar(lc_char[],lc_new[])
//chartobyte(lc_new[],lb_byte[])

end subroutine

public subroutine hextoasc (ref character lc_char[2], ref int lb_byte);//两位16进制转换成10进制byte

int i,li_len,j

lb_byte=0
li_len=upperbound(lc_char[])

for i=li_len to 1 //step - 1
	j++
	if isnumber(lc_char[i]) then // lc_char[i]<='9' then
		//lb_byte+=byte(lc_char[i]) * (16 ^ (j - 1))
	else
		//lb_byte+=(asc(lc_char[i]) - 55) * (16 ^ (j - 1))
	end if
	
//	choose case lc_char[i]
//		case is<= '9' //'0' to '9' //'0','1','2','3','4','5','6','7','8','9'
//			lb_byte+=byte(lc_char[i]) * (16 ^ (j - 1))
//		case else // 'A' to 'F'
//			lb_byte+=(asc(lc_char[i]) - 55) * (16 ^ (j - 1))
////		case 'B'
////			lb_byte+=11 * (16 ^ (j - 1))
////		case 'C'
////			lb_byte+=12 * (16 ^ (j - 1))
////		case 'D'
////			lb_byte+=13 * (16 ^ (j - 1))
////		case 'E'
////			lb_byte+=14 * (16 ^ (j - 1))
////		case 'F'
////			lb_byte+=15 * (16 ^ (j - 1))
//	end choose

next


end subroutine

public subroutine hextochar (ref character lc_org[], ref character lc_new[]);//每两位16进制-->char[]
//不支持'~h00',用char(256)代替

long l_upperbound,i
string ls_expression="''"

l_upperbound=upperbound(lc_org[]) / 2

//if l_upperbound=1 then
//	if lc_org[1]='21' then lc_new[1]='!'
//	return 
//end if

for i=1 to l_upperbound
//	if lc_org[2 * i - 1]='0' and lc_org[2 * i ]='0' then //空字符串
//		ls_expression+=" + char(256) "
//	elseif lc_org[2 * i - 1]='2' and lc_org[2 * i ]='7' then //单引
//		ls_expression+=" + char(39) "
//	elseif lc_org[2 * i - 1]='7' and lc_org[2 * i ]='E' then //波浪号
//		ls_expression+=" + char(126) "
//	else
		ls_expression+=" + '~~~~h"+lc_org[2 * i - 1]+lc_org[2 * i ]+"' "
//	end if
next

lc_new[]=ids_temp.describe("evaluate(~""+ls_expression+"~",0)")

//if ls_expression<>'!' then lc_new[]=ls_expression

end subroutine

public function string hexdecode (ref character ac_text[]);//16进制字符串转换成指定编码的字符
//C1AACDA8 -> 联通

int lb_byte[]
char lc_new[]
//低效率,支持'~h00'
//hextobyte(ac_text[],lb_byte[])

//高效率,不支持'~h00'
hextochar(ac_text[],lc_new[])
//chartobyte(lc_new[],lb_byte[])
//lc_new[]=string(blob(lb_byte[]))
return lc_new[]

//PB12 代码转换(低效率)
//int i
//byte lb_byte[]
//blob lb_blob
//char ls_result[]
//for i=1 to upperbound(ac_text) / 2   
//    lb_byte[i]=todec(ac_text[2 * i - 1]+ac_text[2 * i],16) //用户对象其中todec 是其它进制转10进制的函数
//next
//lb_blob=blob(lb_byte)
//ls_result=string(lb_blob,ae_encode)
//
//return ls_result[]



////PB9 
//
//int i
//char lc_ret[]
//for i=1 to upperbound(ac_text) / 2 
//	lc_ret[i]=charA(todec(ac_text[2 * i - 1]+ac_text[2 * i],16))
//next
//clipboard(lc_ret)
//return lc_ret
end function

public function string uf_filewrite (readonly string as_filepath, readonly string as_text, readonly writemode a_writemode);//写文件的内容
//参数:as_filepath 文件路径,as_text 返回blob类型的内容,a_writemode 写入模式,a_encoding 字符编码
//返回值:''为成功,否则为失败信息

long l_hwd,l_ret,i
long l_length
string ls_errtext


l_hwd=fileopen(as_filepath,lineMode!,write!,lockwrite!,a_writemode)//,a_encoding
if l_hwd=-1 then 
	ls_errtext+='文件:'+as_filepath+'打开失败!'
	goto e
end if

l_ret=filewrite(l_hwd,as_text)

if l_ret=-1 then 
	ls_errtext+='文件:'+as_filepath+'写入失败'+string(l_ret)+'!'
end if 


l_ret=fileclose(l_hwd)

if l_ret=-1 then 
	ls_errtext+='文件:'+as_filepath+'关闭失败!'
end if

e:
return ls_errtext

end function

public function string sendemail (string as_smtp, integer al_port, string as_logid, string as_logpwd, string as_from, string as_to, string as_subject, string as_body, string as_attachments);//发送html邮件
//注:目录下需要有Jmail.dll
string   ls_smtp,ls_logid,ls_logpwd,ls_sender
int   l_port,l_ret,i
string ls_recipient,ls_recipients[]
string ls_body
string ls_Subject
string ls_errtext,ls_ret
string ls_attachments[]
oleobject lobj
string ls_inifile,ls_section,ls_value
string ls_classname='Jmail.Message'

ls_sender=as_from
ls_smtp=as_smtp		//服务器地址
l_port=al_port   					//发送服务器的smtp端口号，没改的话一般是25
ls_logid=as_logid 		//发件人登陆发件服务器时的用户名 
ls_logpwd=as_logpwd		//发件人登陆发件服务器时的密码 
ls_recipient=as_to	
ls_body=as_body
ls_Subject=as_subject

lobj=create oleobject

//u_derek.wait(20,'连接Jmail')
ls_errtext=uf_checkdll(ls_classname,"jmail.dll",1)
if ls_errtext<>'' then goto e

l_ret=lobj.connecttonewobject(ls_classname)

if l_ret<>0 then
	ls_errtext="ConnectToNewobject:"+string(l_ret)
	goto e
end if

//u_derek.wait(50,'设置邮件属性')

try
	lobj.silent=true
	lobj.Logging = True
	lobj.Charset = "gb2312"
	If Not(ls_logid = "" Or ls_logpwd = "") Then
		lobj.MailServerUserName = ls_logid
		lobj.MailServerPassword = ls_logpwd
	End If
//	lobj.ContentType = "text/html"
	lobj.Priority = 3	//优先级一般
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
	
//	u_derek.wait(60,'正在发送给'+ls_recipient)
	if lobj.Send (ls_smtp+':'+string(l_port))=false then ls_errtext+="发送失败!"
catch (RuntimeError e)
	ls_errtext="Jmail发送失败:"+e.getmessage()
finally
	lobj.DisconnectObject()
end try

e:
if isvalid(lobj) then destroy lobj
//if isvalid(w_wait) then close(w_wait)
return ls_errtext


end function

public function window uf_getposwindow (powerobject lpo);powerobject lpo_parent

lpo_parent=lpo
//查找所属窗口
do while typeof(lpo_parent)<>window!
	lpo_parent=lpo_parent.getparent()
loop 

return lpo_parent
end function

public subroutine uf_hotkey_initial ();//ipo_hotkey[]={dw_1}
//is_hotkeyflags[]={'Ctrl'}
//is_hotkey[]={'C'}

int li_keyflags=0,li_hotkeyflags=0
int i

for i=1 to upperbound(is_hotkey[])
	
	il_atom[i]=0
	li_keyflags=0
	li_hotkeyflags=0
	
	if pos(lower(is_hotkeyflags[i]),'alt')>0 then 
		li_keyflags=0
		li_hotkeyflags+=1
	end if
	if pos(lower(is_hotkeyflags[i]),'ctrl')>0 then 
		li_keyflags+=2
		li_hotkeyflags+=2
	end if
	if pos(lower(is_hotkeyflags[i]),'shift')>0 then 
		li_keyflags+=1
		li_hotkeyflags+=4
	end if
	
	i_keyflags[i]=li_keyflags
	i_hotkeyflags[i]=li_hotkeyflags
	
	ikc_hotkeycode[i]=uf_getkeycode(is_hotkey[i])
	
next

end subroutine

public subroutine uf_hotkey_reg (window lw_panret, powerobject lpo_child);long ll_rc
int i
for i=1 to upperbound(is_hotkey[])
	if ipo_hotkey[i]<>lpo_child then continue;
	is_atom[i]=string(Handle(lw_panret))+'_'+classname(lpo_child)+'_'+is_hotkeyflags[i]+'_'+is_hotkey[i]  //可以任意定义，是识别这个ID的关键字
	il_atom[i]=GlobalAddAtom(is_atom[i])//获得注册成功的唯一ID
	 //Ctrl为2，Alt为1，Shift为4
	if RegisterHotKey(Handle(lw_panret), il_atom[i],i_hotkeyflags[i], asc(is_hotkey[i]))=false then
//		GlobalDeleteAtom(il_atom[i])
		il_atom[i]=0
		messagebox('',is_hotkeyflags[i]+'_'+is_hotkey[i]+':Faild!')
	end if
next

end subroutine

public subroutine uf_hotkey_unreg (window lw_parent, powerobject lpo_child);long ll_rc
int i
for i=1 to upperbound(is_hotkey[])
	if ipo_hotkey[i]<>lpo_child then continue;
	if UnregisterHotKey(handle(lw_parent),il_atom[i])=true then
		GlobalDeleteAtom(il_atom[i])
		il_atom[i]=0
	else
		messagebox('',is_hotkeyflags[i]+'_'+is_hotkey[i])
	end if
next
end subroutine

public function keycode uf_getkeycode (string ls_key);keycode lkeycode
choose case ls_key
	case 'A';lkeycode=keyA!
	case 'B';lkeycode=keyB!
	case 'C';lkeycode=keyC!
	case 'D';lkeycode=keyD!
	case 'E';lkeycode=keyE!
	case 'F';lkeycode=keyF!
	case 'G';lkeycode=keyG!
	case 'H';lkeycode=keyH!
	case 'I';lkeycode=keyI!
	case 'J';lkeycode=keyJ!
	case 'K';lkeycode=keyK!
	case 'L';lkeycode=keyL!
	case 'M';lkeycode=keyM!
	case 'N';lkeycode=keyN!
	case 'O';lkeycode=keyO!
	case 'P';lkeycode=keyP!
	case 'Q';lkeycode=keyQ!
	case 'R';lkeycode=keyR!
	case 'S';lkeycode=keyS!
	case 'T';lkeycode=keyT!
	case 'U';lkeycode=keyU!
	case 'V';lkeycode=keyV!
	case 'W';lkeycode=keyW!
	case 'X';lkeycode=keyX!
	case 'Y';lkeycode=keyY!
	case 'Z';lkeycode=keyZ!
	case char(37);lkeycode=KeyLeftArrow!
	case char(39);lkeycode=KeyRightArrow!
	case char(38);lkeycode=KeyupArrow!
	case char(40);lkeycode=KeydownArrow!
end choose

return lkeycode
end function

public function decimal uf_textextent (long l_handle, string ls_text);long l_dc
long lpSize[2]
long  ll_hFont,ll_oldhFont

constant long WM_GETFONT=49

//获取字体
ll_hFont= Send(l_handle, WM_GETFONT, 0, 0)

l_dc=GetDC(l_handle)
ll_oldhFont=SelectObject(l_dc, ll_hFont)
//messagebox('',string(ll_oldhFont)+'/'+string(ll_hFont))
GetTextExtentPoint32(l_dc,ls_text, len(ls_text) , lpSize)
//SelectObject(l_dc, ll_oldhFont)

//DeleteObject( ll_hFont )   
//ReleaseDC(l_handle, l_dc ) 

//messagebox('',lpSize[1])

return lpSize[1]
end function

public subroutine uf_fontfromdwo (statictext lst_text, datawindow ldw, string ls_dwoname);//根据数据窗口的列设置对象的字体属性

// give static text same font properties as column
lst_text.FaceName = ldw.Describe(ls_dwoname + ".Font.Face")
lst_text.TextSize = Integer(ldw.Describe(ls_dwoname + ".Font.Height"))
lst_text.Weight = Integer(ldw.Describe(ls_dwoname + ".Font.Weight"))

// set italic property
If ldw.Describe(ls_dwoname + ".Font.Italic") = "1" Then
	lst_text.Italic = True
Else
	lst_text.Italic = False
End If

// set charset property
CHOOSE CASE ldw.Describe(ls_dwoname + ".Font.CharSet")
	CASE "0"
		lst_text.FontCharSet = ANSI!
	CASE "2"
		lst_text.FontCharSet = Symbol!
	CASE "128"
		lst_text.FontCharSet = ShiftJIS!
	CASE "255"
		lst_text.FontCharSet = OEM!
	CASE ELSE
		lst_text.FontCharSet = DefaultCharSet!
END CHOOSE

// set family property
CHOOSE CASE ldw.Describe(ls_dwoname + ".Font.Family")
	CASE "1"
		lst_text.FontFamily = Roman!
	CASE "2"
		lst_text.FontFamily = Swiss!
	CASE "3"
		lst_text.FontFamily = Modern!
	CASE "4"
		lst_text.FontFamily = Script!
	CASE "5"
		lst_text.FontFamily = Decorative!
	CASE ELSE
		lst_text.FontFamily = AnyFont!
END CHOOSE

// set pitch property
CHOOSE CASE ldw.Describe(ls_dwoname + ".Font.Pitch")
	CASE "1"
		lst_text.FontPitch = Fixed!
	CASE "2"
		lst_text.FontPitch = Variable!
	CASE ELSE
		lst_text.FontPitch = Default!
END CHOOSE
end subroutine

public function integer replaceex (ref string ls_text, character as_str1[], character as_str2[]);//字符串替换函数
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

public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[]);//字符串替换函数
//参数1:引用变量,操作的字符串
//参数2:要替换的字符
//参数3:目标字符
//返回值:替换成功的数目

char lc_text[]
long i,l_len,l_index

int li_seplen,li_matchindex=1 /*正在匹配索引*/
long l_lastmatchindex=0 //最后一次全匹配成功的位置

long l_newindex,l_newlen
char lc_newchar[]

li_seplen=upperbound(as_sep[])
lc_text[]=as_text
l_len=upperbound(lc_text[])
li_matchindex=1 //先匹配首个字符

for l_index=1 to l_len //逐个匹配
	if lc_text[l_index]=as_sep[li_matchindex] then //是否匹配
		if li_seplen=li_matchindex then //全匹配
			lc_newchar[]=''
			l_newlen=l_index - li_seplen - l_lastmatchindex //需要截取的长度
			for l_newindex=1 to l_newlen
				lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
			next
			l_lastmatchindex=l_index //记录最后一次全匹配成功的位置
			i++
			ls_ret[i]=lc_newchar[] //
		else //部分匹配
			li_matchindex++ //匹配 + 1
			continue;
		end if
	end if 
	if li_matchindex>1 then l_index=l_index - li_matchindex + 1
	li_matchindex=1 //重新匹配
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

////得到分隔符分开后的数组
////参数1:要分隔的字符串
////参数2:输出分开后的数组
////参数3:分隔符
////返回数组的上限数
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
////正常截取
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

public function long getarray (ref string as_text, ref string ls_ret[], readonly character as_sep[], integer li_option);//得到分隔符分开后的数组
//参数1:要分隔的字符串
//参数2:输出分开后的数组
//参数3:分隔符
//返回数组的上限数
//li_option 1:严格要求不以分隔符结束 0:取到无内容为止

char lc_text[]
long i,l_len,l_index

int li_seplen,li_matchindex=1 /*正在匹配索引*/
long l_lastmatchindex=0 //最后一次全匹配成功的位置

long l_newindex,l_newlen
char lc_newchar[]

li_seplen=upperbound(as_sep[])
lc_text[]=as_text
l_len=upperbound(lc_text[])
li_matchindex=1 //先匹配首个字符

for l_index=1 to l_len //逐个匹配
	if lc_text[l_index]=as_sep[li_matchindex] then //是否匹配
		if li_seplen=li_matchindex then //全匹配
			lc_newchar[]=''
			l_newlen=l_index - li_seplen - l_lastmatchindex //需要截取的长度
			for l_newindex=1 to l_newlen
				lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
			next
			l_lastmatchindex=l_index //记录最后一次全匹配成功的位置
			i++
			ls_ret[i]=lc_newchar[] //
		else //部分匹配
			li_matchindex++ //匹配 + 1
			continue;
		end if
	end if 
	if li_matchindex>1 then l_index=l_index - li_matchindex + 1
	li_matchindex=1 //重新匹配
next

if l_lastmatchindex<>l_len then 
	lc_newchar[]=''
	l_newlen=l_len - l_lastmatchindex
	for l_newindex=1 to l_newlen
		lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
	next
	i++
	ls_ret[i]=lc_newchar[]
end if

//要求不以分隔符结尾
if li_option=1 and l_lastmatchindex=l_len then 
	i++
	ls_ret[i]=''
end if

return i


//long li_pos=0,li_startpos=1,i=0,l_len,li_lastpos
//int l_lensep
//string ls_empty[]
//ls_ret[]=ls_empty[]
//
//l_len=len(as_text)
//l_lensep=len(as_sep)
//
//li_pos=pos(as_text,as_sep)
////正常截取
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
//if li_option=1 or l_len>=li_startpos then 
//	i++
//	ls_ret[i]=mid(as_text,li_startpos)
//end if
//
//return i
end function

public function any getarray (ref string as_text, readonly character as_sep[], readonly integer li_lastsep, readonly integer ai_trim);//得到分隔符分开后的数组
//参数1:要分隔的字符串
//参数2:分隔符
//参数3:是否以分隔符结尾(1:保留结尾的空字符 0:忽略最后的空字符)
//参数4:是否忽略空格

string ls_ret[],ls_temp

if ai_trim=0 then 
	getarray(as_text,ls_ret[],as_sep,li_lastsep)
	return ls_ret[]
end if

char lc_text[]
long i,l_len,l_index

int li_seplen,li_matchindex=1 /*正在匹配索引*/
long l_lastmatchindex=0 //最后一次全匹配成功的位置

long l_newindex,l_newlen
char lc_newchar[]

li_seplen=upperbound(as_sep[])
lc_text[]=as_text
l_len=upperbound(lc_text[])
li_matchindex=1 //先匹配首个字符

for l_index=1 to l_len //逐个匹配
	if lc_text[l_index]=as_sep[li_matchindex] then //是否匹配
		if li_seplen=li_matchindex then //全匹配
			lc_newchar[]=''
			l_newlen=l_index - li_seplen - l_lastmatchindex //需要截取的长度
			for l_newindex=1 to l_newlen
				lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
			next
			l_lastmatchindex=l_index //记录最后一次全匹配成功的位置
			ls_temp=trim(lc_newchar[])
			if ls_temp<>'' then //忽略空格
				i++
				ls_ret[i]=ls_temp //
			end if
		else //部分匹配
			li_matchindex++ //匹配 + 1
			continue;
		end if
	end if 
	if li_matchindex>1 then l_index=l_index - li_matchindex + 1
	li_matchindex=1 //重新匹配
next

if l_lastmatchindex<>l_len then 
	lc_newchar[]=''
	l_newlen=l_len - l_lastmatchindex
	for l_newindex=1 to l_newlen
		lc_newchar[l_newindex]=lc_text[l_lastmatchindex + l_newindex]
	next
	ls_temp=trim(lc_newchar[])
	if ls_temp<>'' then //忽略空格
		i++
		ls_ret[i]=ls_temp //
	end if
end if

return ls_ret[]

////除去空字符串
//long li_pos=0,li_startpos=1,i=0,l_len,li_lastpos
//int l_lensep
//string ls_empty[],ls_temp
//ls_ret[]=ls_empty[]
//
//l_len=len(as_text)
//l_lensep=len(as_sep)
//
//li_pos=pos(as_text,as_sep)
////正常截取
//do while (li_pos>0)
//	ls_temp=trim(mid(as_text,li_startpos,li_pos - li_startpos))
//	if ls_temp<>'' then 
//		i++
//		ls_ret[i]=ls_temp
//	end if
//	
//	li_lastpos=li_pos
//	li_startpos=li_lastpos + l_lensep
//	li_pos=pos(as_text,as_sep,li_startpos)
//
//loop
//
//if l_len>=li_startpos then 
//	ls_temp=trim(mid(as_text,li_startpos))
//	if ls_temp<>'' then 
//		i++
//		ls_ret[i]=ls_temp
//	end if
//end if
//
//return ls_ret[]
end function

public subroutine uf_winstyle (window lw_win);//设置response窗口的风格,使可以resize+max
Long lStyle
//Constant Long GWL_STYLE = -16           //窗口样式
//Constant Long WS_SYSMENU = 524288       //带系统菜单的窗口
//constant long WS_THICKFRAME=262144	//窗口可以改变大小
//Constant Long WS_MINIMIZEBOX = 131072   //创建一个有最小化按扭的窗体。
//Constant Long WS_MAXIMIZEBOX = 65536    //创建一个有最大化按扭的窗体。

if lw_win.windowtype=response! and lw_win.controlmenu=false then
		
	lStyle = GetWindowLongA( Handle(lw_win), -16) //获取原风格
	
	lStyle+=WS_SYSMENU	//控制菜单
	lStyle+=WS_MAXIMIZEBOX	//最大化按钮
//	lStyle+=WS_MINIMIZEBOX	//最小化按钮
	lStyle+=WS_THICKFRAME	//改变大小
	SetWindowLongA( Handle(lw_win),  -16, lStyle ) //设置新的风格
	
	//窗口大小会有所改变,所以重新resize
	lw_win.resize(lw_win.workspacewidth(),lw_win.workspaceheight())
	
end if




end subroutine

public function datetime uf_dateadd (string as_datepart, long ai_number, datetime adt_date);datetime ldt_date_new
date ld_date_new,ld_date
time lt_time,lt_time_new=00:00:00
int li_month,li_year,li_day
int li_year_new,li_month_new,li_day_new
long l_daynum,l_ssnum

ld_date=date(adt_date)
lt_time=time(adt_date)
li_month=month(date(adt_date))
li_year=year(date(adt_date))
li_day=day(date(adt_date))

as_datepart=lower(as_datepart)
choose case as_datepart
	case 'month','mm','m'
		if ai_number>=0 then 
			li_year_new=li_year + int( 1.0 * (ai_number + li_month - 1) / 12)  //直接去小数 如果
			li_month_new=mod(ai_number + li_month,12)
		else
			li_year_new=li_year + Ceiling(1.0 * (li_month - 12 + ai_number) / 12) //取大于数值的最小整数
			li_month_new=12 + mod(li_month - 12 + ai_number,12)
		end if
		
		if li_month_new=0 then li_month_new=12
		//取月的最大天数
		li_day_new=uf_days_month(date(li_year_new,li_month_new,1)) //32 - day(relativedate(date(li_year_new,li_month_new,1),31))
		if li_day<li_day_new then li_day_new=li_day
		
		ld_date_new=date(li_year_new,li_month_new ,li_day_new)
		
		ldt_date_new=datetime(ld_date_new,lt_time)
		
	case 'ss','s','second'
		
		//取整数天数部分
		l_daynum=integer(1.0 * ai_number / (24 * 60 * 60))
		ai_number=mod(ai_number ,(24 * 60 * 60))
//		
		if ai_number>=0 then 
			l_ssnum=SecondsAfter(time(adt_date),23:59:59)
			if ai_number<=l_ssnum then
				lt_time_new=Relativetime(time(adt_date),ai_number)  //最大到23:59:59
				ldt_date_new=datetime(relativedate(date(adt_date),l_daynum),lt_time_new)
			else
				l_daynum++ //跨日
				ai_number=ai_number - l_ssnum - 1 //
				ldt_date_new=datetime(relativedate(date(adt_date),l_daynum),relativetime(00:00:00,ai_number))
			end if
		else
			l_ssnum=SecondsAfter(time(adt_date),00:00:00)
			if ai_number>=l_ssnum then
				lt_time_new=Relativetime(time(adt_date),ai_number)  //最小取到00:00:00
				ldt_date_new=datetime(relativedate(date(adt_date),l_daynum),lt_time_new)
			else
				l_daynum=l_daynum - 1 //跨日
				ai_number=ai_number - l_ssnum + 1
				ldt_date_new=datetime(relativedate(date(adt_date),l_daynum),relativetime(23:59:59,ai_number))
			end if
		end if
	case 'day','dd','d'
		ldt_date_new=datetime(relativedate(ld_date,ai_number),lt_time)
end choose

return ldt_date_new

/*
datepart	Abbreviations
year	yy, yyyy
quarter	qq, q
month	mm, m
dayofyear	dy, y
day	dd, d
week	wk, ww
weekday	dw, w
hour	hh
minute	mi, n
second	ss, s
millisecond	ms
microsecond	mcs
nanosecond	ns
*/

end function

public function long uf_datediff (string ls_part, datetime ldt_start, datetime ldt_end);long l_daynum,l_secnum,l_num

l_daynum=DaysAfter ( date(ldt_start), date(ldt_end))
l_secnum=SecondsAfter ( time(ldt_start), time(ldt_end))

choose case ls_part
	case 'ss','s'
		l_num=l_daynum * 24 * 60 * 60 + l_secnum
end choose
return l_num
end function

public function string uf_vbscript_initial ();int li_ret
string ls_ret
string ls_vbsscript
li_ret=ole_vbscript.connecttonewobject("MSScriptControl.ScriptControl.1")

choose case li_ret
	case 0
		ole_vbscript.Language="VBScript"
	case -1  
		ls_ret="Invalid Call: the argument is the Object property of a control"
	case -2  
		ls_ret="Class name not found"
	case -3  
		ls_ret="Object could not be created"
	case -4  
		ls_ret="Could not connect to object"
	case -9  
		ls_ret="Other error"
	case -15  
		ls_ret="COM+ is not loaded on this computer"
	case -16  
		ls_ret="Invalid Call: this function not applicable"
	case else
		
end choose

return ls_ret
end function

public function string uf_msscript_addcode (oleobject lole, string ls_script);
//string ls_vbsscript

choose case ls_script
	case 'getimg'
		ls_script="Function getimg(as_filepath) ~r~n set img=loadpicture(as_filepath) ~r~n getimg=img.type&~"	~"&img.width&~"	~"&img.height ~r~n end function"
	case else
		
end choose
lole.Addcode(ls_script)

return ''
end function

public function integer uf_base64 (ref blob lb_content, ref string ls_result);int lbyte_array[],lbyte_result[]
char lc_array[],lc_temp[]
long i,j,l_count,l_index
int l_mod

//lbyte_array[]=getbytearray(lb_content)


//将每一个元素转换成8位的二进制,并拼接
l_count=upperbound(lbyte_array[])
for i=1 to l_count
	lc_temp[]=decto(lbyte_array[i],2)
	lc_array[]=lc_array[]+fill('0',8 - upperbound(lc_temp[]))+lc_temp[]
next

l_mod=mod(l_count * 8,6)

if l_mod<>0 then lc_array[]=lc_array[]+fill('0',6 - l_mod)

//messagebox('',lc_array[])

//将串分6位为一组,再转换成10进制对应的字符
l_count=upperbound(lc_array[])
l_count=l_count/6
for i=1 to l_count
	l_index=(i - 1) * 6 + 1
	
	lc_temp[]=mid(lc_array[],l_index,6)
//	lc_temp[]={lc_array[l_index]}
//	for j=2 to 6
//		lc_temp[j]=lc_array[l_index + j - 1]
//	next
	lbyte_result[i]=todec(lc_temp[],2)
	
//	if i=l_count then 
//		if l_mod<>0 then 
//			lbyte_result[i]=asc('=')
//			continue;
//		end if
//	end if
	
	choose case lbyte_result[i]
		case 0 to 25 // A~Z 65 - 0=65
			lbyte_result[i]+=65
		case 26 to 51 // a~Z 97 - 26=71
			lbyte_result[i]+=71
		case 53 to 61 // 0~9 48 - 52=-4
			lbyte_result[i]+=-4
		case 62 // +
			lbyte_result[i]=34
		case 63 // /
			lbyte_result[i]=37
	end choose
next

//ls_result=string(blob(lbyte_result[])) //,encodingansi!

return i
end function

public function integer hexencode (ref int lb_array[], ref character lc_result[]);//将字符转换成16进制编码
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

public function string uf_md5file (ref string ls_filename, ref string ls_result);ulong l_size
//ulong l_hfile,l_hmap,l_pAddr
//long l_ret
//ulong l_Secu[3]
//md5_ctx lpContext
//char lc_result[]
//int lbyte_result[]
//string ls_ref,ls_errtext
//boolean lb_ret
//
//ls_result=''
//ls_filename=string(ls_filename,'')
//
//if DirectoryExists ( ls_filename )=true then 
//	ls_errtext='不能是文件夹!' //+string(ls_filename)+'~r~n'
//	goto e
//end if 
//
//if fileexists(ls_filename)=false then 
//	ls_errtext='文件不存在!' //+string(ls_filename)+'~r~n'
//	goto e
//end if 
//
//l_size=FileLength ( ls_filename )
//if l_size=-1 then 
//	ls_errtext='FileLength:'+string(l_size)+'~r~n'
//	goto e
//end if
//
//if l_size=0 then 
//	ls_errtext='文件内容不能为空:'+string(l_size)+'~r~n'
//	goto e
//end if
//
//if l_size>2*645*1024*1024 then  //最大支持
//	ls_errtext='最大支持:'+string(2*645*1024*1024,'###,###,##0')+'~r~n'
//	goto e
//end if
//
//try
//	
//	l_hfile=CreateFile(ls_filename,GENERIC_READ,FILE_SHARE_READ,l_Secu[],OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0)
//	if l_hfile<=0 then 
//		ls_errtext='CreateFile:'+string(l_hfile)+'~r~n'
//		THROW create runtimeerror
//	end if
//	
//	l_hmap= CreateFileMapping(l_hfile, l_Secu, PAGE_READONLY, 0, 0, ls_ref)
//	if l_hmap<=0 then 
//		ls_errtext='CreateFileMapping:'+string(l_hmap)+'~r~n'
//		THROW create runtimeerror
//	end if
//	
//	l_pAddr=MapViewOfFile(l_hmap, FILE_MAP_READ,0,0,l_size);
//	if l_pAddr<=0 then 
//		ls_errtext='MapViewOfFile:'+string(l_pAddr)+'~r~n'
//		THROW create runtimeerror
//	end if
//	
//	MD5Init(lpContext)
//	MD5Update(lpContext,l_pAddr,l_size)
//	MD5Final(lpContext)
//	
//catch(runtimeerror e)
//	ls_errtext+=e.getmessage()
//finally
//	
//	if l_pAddr>0 then 
//		UnmapViewOfFile(l_pAddr); 
//		l_pAddr=0
//	end if
//	
//	if l_hmap>0 then 
//		lb_ret=CloseHandle(l_hmap)
//		if lb_ret=false then 
//			ls_errtext+='CloseHandle:'+string(lb_ret)+'~r~n'
//			//goto e
//		else
//			l_hmap=0
//		end if
//	end if
//	
//	if l_hfile>0 then 
//		lb_ret=CloseHandle(l_hfile)
//		if lb_ret=false then 
//			ls_errtext+='CloseHandle:'+string(lb_ret)+'~r~n'
//			//goto e
//		else
//			l_hfile=0
//		end if
//	end if
//	
//end try
//
//if ls_errtext<>'' then goto e
//
//lbyte_result[]=lpContext.b[]
//hexencode(lbyte_result[],lc_result[])
//ls_result=lc_result[]

return ''

//goto e
//e:
//return ls_errtext
end function

public function string urlencode (character as_text[]);//对中文字符进行url 编码, encoding ae_encode
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
			ls_temp=hexencode(as_text[i])
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

public function string hexencode (readonly string as_text);//将字符转换成16进制编码, readonly encoding ae_encode
//参数1:是要转换的字符
//参数2:源字符中编码
//返回16进制编码

int lb_array[]
char lc_result[]

//lb_array[]=getbytearray(blob(as_text,ae_encode))
hexencode(lb_array[],lc_result[])
 
return lc_result[]


end function

public function string uf_md5string (ref blob ls_string, ref string ls_result);ulong l_size
md5_ctx lpContext
char lc_result[]
int lbyte_result[]
ls_result=''
l_size=len(ls_string)

//MD5Init(lpContext)
//MD5Update(lpContext,ls_string,l_size)
//MD5Final(lpContext)
//
//lbyte_result[]=lpContext.b[]
//hexencode(lbyte_result[],lc_result[])
//ls_result=lc_result[]

return ''
end function

public function string uf_clipfiles (ref string ls_files[]);long lHandle ,lHandle2
Long lpResults
Long lRet 
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
	If lHandle <0 Then
		ls_errtext+="GetClipboardData:"+string(lHandle)+'~r~n'
		throw create runtimeerror
	end if 
	   
	l_count=DragQueryFile(lHandle,-1,ls_null,0);
	for l_index=1 to l_count
		ls_files[l_index]= space(255) 
		l_ret=DragQueryFile(lHandle,l_index - 1,ls_files[l_index],255);
	next

catch (runtimeerror e)
	ls_errtext+=e.getmessage()
finally
	if lHandle>0 then GlobalUnlock (lHandle)
	if l_openclip>0 then CloseClipboard()
end try

goto m
m:
return ''

goto e
e:
return ls_errtext
end function

public function string uf_posvalue (string ls_args,string ls_field,string ls_endstr);
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

public function string uf_tooltip_get (long l_winhwd, ref long l_tiphwd);
string ls_classname,ls_ref,ls_errtext,ls_null
ulong l_pid,l_parentpid
long l_lasthwd
setnull(ls_null)

ls_classname='tooltips_class32'

GetWindowThreadProcessId(l_winhwd,l_parentpid)

l_lasthwd=l_winhwd
do
	l_lasthwd=GetNextWindow(l_lasthwd,3)
	//l_lasthwd=FindWindowEx(l_lasthwd,0,ls_classname,ls_null)
	if l_lasthwd=0 then exit
	ls_ref=space(50)
	GetClassName(l_lasthwd,ls_ref,len(ls_ref))
	if ls_ref=ls_classname then 
		GetWindowThreadProcessId(l_lasthwd,l_pid)
		if l_pid=l_parentpid then 
			l_tiphwd=l_lasthwd
			exit
		end if
	end if
loop until false

return ''
end function

public function string uf_tooltip_set (long l_whandle, long l_tiphwd, ref string tiptext);long lpszText 
long ToolInfo[]

lpszText = LocalAlloc(0,255) 
lstrcpy(lpszText,Left(TipText,255)) 

ToolInfo[3] = l_whandle
ToolInfo[4] = 0 
ToolInfo[10] = lpszText 

SendMessage(l_tiphwd,TTM_UPDATETIPTEXTA,0,ToolInfo) 

LocalFree(lpszText) 
return ''

end function

public function string uf_getkeycode (keycode lkeycode);string ls_keychar
choose case lkeycode
	case keyA!;ls_keychar='A'
	case keyB!;ls_keychar='B'
	case keyC!;ls_keychar='C'
	case keyD!;ls_keychar='D'
	case keyE!;ls_keychar='E'
	case keyF!;ls_keychar='F'
	case keyG!;ls_keychar='G'
	case keyH!;ls_keychar='H'
	case keyI!;ls_keychar='I'
	case keyJ!;ls_keychar='J'
	case keyK!;ls_keychar='K'
	case keyL!;ls_keychar='L'
	case keyM!;ls_keychar='M'
	case keyN!;ls_keychar='N'
	case keyO!;ls_keychar='O'
	case keyP!;ls_keychar='P'
	case keyQ!;ls_keychar='Q'
	case keyR!;ls_keychar='R'
	case keyS!;ls_keychar='S'
	case keyT!;ls_keychar='T'
	case keyU!;ls_keychar='U'
	case keyV!;ls_keychar='V'
	case keyW!;ls_keychar='W'
	case keyX!;ls_keychar='X'
	case keyY!;ls_keychar='Y'
	case keyZ!;ls_keychar='Z'
	case key1!,keynumpad1!;ls_keychar='1'
	case key2!,keynumpad2!;ls_keychar='2'
	case key3!,keynumpad3!;ls_keychar='3'
	case key4!,keynumpad4!;ls_keychar='4'
	case key5!,keynumpad5!;ls_keychar='5'
	case key6!,keynumpad6!;ls_keychar='6'
	case key7!,keynumpad7!;ls_keychar='7'
	case key8!,keynumpad8!;ls_keychar='8'
	case key9!,keynumpad9!;ls_keychar='9'
	case key0!,keynumpad0!;ls_keychar='0'
	case keyback!;ls_keychar=char('~h08')
end choose

return ls_keychar
end function

public function integer regdll (string as_dllpath, string as_function, ref string as_info);as_function=lower(as_function)
as_info=''
int li_ret,li_retvalue
string ls_CurrentDir
shellexecuteinfo sei

ls_CurrentDir=GetCurrentDirectory()

if fileexists(ls_CurrentDir+'\'+as_dllpath) then as_dllpath=ls_CurrentDir+'\'+as_dllpath
if not fileexists(as_dllpath) then 
	li_retvalue=-1 
	as_info='文件不存在:'+as_dllpath
	goto e
end if

sei.cbSize =60
sei.hwnd=0;
sei.fMask=64+1024;
sei.lpVerb= 'runas'; //管理员身份运行
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
	as_info='ShellExecuteEx 失败:'+string(li_ret)
	goto e
end if

//等待结束
WaitForSingleObject(sei.hProcess,65535)


return 1

goto e
e:
return li_retvalue

//
//if upper(as_function)="UNREG" then	//反注册
//	as_function='DllUnregisterServer'
//elseif upper(as_function)="REG" then	//注册
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

public function string uf_run (string ls_file, string ls_param, string ls_directory, long l_show, string ls_verb, long l_parenthandle);
int li_ret
string ls_retvalue
long l_pos
string ls_CurrentDir
shellexecuteinfo sei

sei.cbSize =60
sei.hwnd=l_parenthandle;
sei.fMask=64+1024;
sei.lpVerb=ls_Verb // 'runas'; //管理员身份运行
sei.lpFile=ls_File
sei.nShow=l_show;
sei.lpDirectory=ls_Directory
sei.lpParameters=ls_param

li_ret=ShellExecuteEx(sei)
if li_ret<1 then 
	ls_retvalue='ShellExecuteEx 失败:'+string(li_ret)
	goto e
end if

//等待结束
WaitForSingleObject(sei.hProcess,65535)

return ''

goto e
e:
return ls_retvalue

//
//if upper(as_function)="UNREG" then	//反注册
//	as_function='DllUnregisterServer'
//elseif upper(as_function)="REG" then	//注册
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

public function integer uf_urldata (ref string ls_urldata, ref string ls_names[], ref string ls_values[]);//, encoding lencoding格式:arg1=value1{&arg2=value2{&...}}
string ls_args
int li_pos1,li_pos2
int l_count
char lc_temp[]

//进行拼接
ls_args=ls_urldata
do
	li_pos1=pos(ls_args,"=",li_pos2 + 1)
	if li_pos1>0 then 
		l_count++
		lc_temp[]=mid(ls_args,li_pos2 + 1,li_pos1 - li_pos2 -1)
		ls_names[l_count]=urldecode(lc_temp[]) //,lencoding
	else
		exit
	end if
	li_pos2=pos(ls_args,'&',li_pos1 + 1)
	if li_pos2>0 then 
		lc_temp[]=mid(ls_args,li_pos1 + 1,li_pos2 - li_pos1 - 1)
	else
		lc_temp[]=mid(ls_args,li_pos1 + 1)
	end if
	ls_values[l_count]=urldecode(lc_temp[])//,lencoding
	
loop until li_pos2<=0

return l_count

end function

public function string urldecode (readonly character as_text[]);//, readonly encoding ae_encode对中文字符进行url 解码
//参数1:要解码的字符串
//参数2:要以哪种字符集解码

string ls_ret
long i,l_len
char ls_str1[]

l_len=upperbound(as_text)

for i=1 to l_len
	if as_text[i]='%' then
		ls_str1[upperbound(ls_str1) + 1]=as_text[i + 1]
		ls_str1[upperbound(ls_str1) + 1]=as_text[i + 2]
		i=i + 2
	else
		if ls_str1>'' then
			ls_ret+=hexdecode(ls_str1)
			ls_str1=''
		end if
		ls_ret=ls_ret+as_text[i]
	end if
next
if ls_str1>'' then
	ls_ret+=hexdecode(ls_str1)
end if

return ls_ret
end function

public function string uf_geterrtext (string ls_methodname, integer li_errcode);string ls_errtext=''
choose case lower(ls_methodname)
	case 'connecttonewobject','connecttonewobject'
		choose case li_errcode
			case 0 //成功
					
			case -1  
				ls_errtext="无效调用 oleobject对象变量名是某个OLE 控件的 Object属性" 
			case -2  
				ls_errtext="未找到指定的类名" 
			case -3  
				ls_errtext="不能创建对象"
			case -4  
				ls_errtext="不能连接到对象"
			case -5  
				ls_errtext="不能连接到当前活动对象"
			case -6  
				ls_errtext="无效的文件名"
			case -7  
				ls_errtext="未找到指定文件或指定文件不能被打开"
			case -8  
				ls_errtext="服务器不支持指定文件"
			case -9  
				ls_errtext="其他错误"
			case -15   
				ls_errtext="本计算机上未加载 MTS"
			case -16  
				ls_errtext="无效调用 该函数不使用于OLETxnObject对象"
			case else 
				ls_errtext="未知错误代码"
		end choose
end choose
if ls_errtext<>'' then 
	return string(li_errcode)+":"+ls_errtext
end if
return ''
end function

on u_derek_v2_fun.create
call super::create
this.ole_vbscript=create ole_vbscript
this.ids_temp=create ids_temp
TriggerEvent( this, "constructor" )
end on

on u_derek_v2_fun.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ole_vbscript)
destroy(this.ids_temp)
end on

type ole_vbscript from oleobject within u_derek_v2_fun descriptor "pb_nvo" = "true" 
end type

on ole_vbscript.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ole_vbscript.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

type ids_temp from datastore within u_derek_v2_fun descriptor "pb_nvo" = "true" 
end type

on ids_temp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_temp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;create('release 12;table()')
end event

