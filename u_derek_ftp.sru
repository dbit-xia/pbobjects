$PBExportHeader$u_derek_ftp.sru
forward
global type u_derek_ftp from nonvisualobject
end type
type filetime from structure within u_derek_ftp
end type
type win32_find_data from structure within u_derek_ftp
end type
type systemtime from structure within u_derek_ftp
end type
end forward

type filetime from structure
	unsignedlong		dwlowdatetime
	unsignedlong		dwhighdatetime
end type

type win32_find_data from structure
	unsignedlong		dwfileattributes
	filetime		ftcreationtime
	filetime		ftlastaccesstime
	filetime		ftlastwritetime
	unsignedlong		nfilesizehigh
	unsignedlong		nfilesizelow
	unsignedlong		dwreserved0
	unsignedlong		dwreserved1
	byte		cfilename[260]
	byte		calternate[14]
end type

type systemtime from structure
	integer		wYear
	integer		wMonth
	integer		wDayOfWeek
	integer		wDay
	integer		wHour
	integer		wMinute
	integer		wSecond
	integer		wMilliseconds
end type

global type u_derek_ftp from nonvisualobject
end type
global u_derek_ftp u_derek_ftp

type prototypes
FUNCTION ulong InternetGetConnectedState( REF ulong lpdwFlags, ulong dwReserved ) LIBRARY "wininet.dll"
Function Long InternetOpen(String sAgent, Long lAccessType, String sProxyName,String sProxyBypass, uLong lFlags)  Library "wininet.dll" Alias For "InternetOpenA;Ansi"
Function Long InternetConnect(Long hInternetSession, String sServerName, Integer nServerPort, String sUsername,String sPassword, Long lService, Long lFlags, Long lContext)  Library "wininet.dll" Alias For "InternetConnectA;Ansi"
Function boolean InternetCloseHandle(Long hInet) Library "wininet.dll" 

Function Boolean FtpGetCurrentDirectory(Long hFtpSession, ref String lpszDirectory, ref Long lpdwCurrentDirectory) Library "wininet.dll"  Alias For "FtpGetCurrentDirectoryA;Ansi"
Function Boolean FtpSetCurrentDirectory(Long hFtpSession, ref String lpszDirectory) Library "wininet.dll" Alias For "FtpSetCurrentDirectoryA;Ansi"
Function Long FtpFindFirstFile(Long hFtpSession, String lpszSearchFile,ref win32_find_data lpFindFileData, Long dwFlags,Long dwContent) Library "wininet.dll" Alias For "FtpFindFirstFileA;Ansi"
Function Long InternetFindNextFile(Long hFind, ref win32_find_data lpvFindData) Library "wininet.dll" Alias For "InternetFindNextFileA;Ansi" 

Function Boolean FtpGetFile(Long hFtpSession, String lpszRemoteFile, String lpszNewFile, Boolean fFailIfExists, Long dwFlagsAndAttributes, uLong dwFlags, Long dwContext) Library "wininet.dll" Alias For "FtpGetFileA;Ansi"
Function Boolean FtpPutFile(Long hFtpSession, String lpszLocalFile, String lpszRemoteFile, Long dwFlags, Long dwContext)  Library "wininet.dll" Alias For "FtpPutFileA;Ansi"
Function Boolean FtpDeleteFile(Long hFtpSession, String lpszFileName) Library "wininet.dll" Alias For "FtpDeleteFileA;Ansi"
Function Long FtpOpenFile(Long hFtpSession, String lpszRemoteFile, Long dwFlagsAndAttributes, Long dwFlags, Long dwContext) Library "wininet.dll" Alias For "FtpOpenFileA;Ansi"

Function boolean FtpRenameFile (long hFtpSession , string lpszExisting , string lpszNew ) Library "wininet.dll"  Alias for "FtpRenameFileA;ansi" 
Function boolean FtpCreateDirectory (long hFtpSession , string lpszNew ) Library "wininet.dll"  Alias for "FtpCreateDirectoryA;ansi" 
Function boolean FtpRemoveDirectory (long hFtpSession , string lpszNew ) Library "wininet.dll"  Alias for "FtpRemoveDirectoryA;ansi" 

FUNCTION ulong FileTimeToSystemTime(ref FILETIME lpFileTime,ref SYSTEMTIME lpSystemTime) LIBRARY "kernel32.dll" alias for "FileTimeToSystemTime;Ansi"

FUNCTION ulong GetCurrentDirectory(ulong nBufferLength,ref string lpBuffer) LIBRARY "kernel32.dll" Alias For "GetCurrentDirectoryA;Ansi"
FUNCTION ulong SetCurrentDirectory(ref string lpPathName) LIBRARY "kernel32.dll" ALIAS FOR "SetCurrentDirectoryA;Ansi"
FUNCTION ulong FindFirstFile(ref string lpFileName,ref WIN32_FIND_DATA lpFindFileData) LIBRARY "kernel32.dll" ALIAS FOR "FindFirstFileA;Ansi"
FUNCTION ulong FindNextFile(ulong hFindFile,ref WIN32_FIND_DATA lpFindFileData) LIBRARY "kernel32.dll" ALIAS FOR "FindNextFileA;Ansi"
FUNCTION ulong GetDriveType(ref string nDrive) LIBRARY "kernel32.dll" ALIAS FOR "GetDriveTypeA;Ansi"
FUNCTION ulong DeleteFile(ref string lpFileName) LIBRARY "kernel32.dll" ALIAS FOR "DeleteFileA;Ansi"
Function ulong ShellExecute(ulong hwnd,ref string lpOperation,ref string lpFile,ref string lpParameters,ref string lpDirectory,ulong nShowCmd) LIBRARY "shell32.dll" ALIAS FOR "ShellExecuteA;Ansi"

function boolean InternetGetLastResponseInfo(ref ulong lpdwError,ref char lpszBuffer[],ref int lpdwBufferLength) Library "wininet.dll" Alias for "InternetGetLastResponseInfoA;Ansi"

function ulong FtpGetFileSize(ulong hFile,ulong lpdwFileSizeHigh) Library "wininet" alias for 'FtpGetFileSize;ansi'
function boolean InternetReadFile(ulong hFile, ref string lpBuffer,ulong dwNumberOfBytesToRead,ref ulong lpdwNumberOfBytesRead)  library 'wininet.dll' alias for "InternetReadFile;Ansi" 
function boolean InternetReadFile(ulong hFile, ref blob lpBuffer,ulong dwNumberOfBytesToRead,ref ulong lpdwNumberOfBytesRead)  library 'wininet.dll'  alias for "InternetReadFile;Ansi" 

function boolean DeleteUrlCacheEntry(string lpszUrlName) Library "wininet" alias for 'DeleteUrlCacheEntry;ansi'

end prototypes

type variables
Private:
Long il_dwflags = 2      //传输方式1为ASSIC方式，2为二进制方式
Boolean ib_overfile = true   //是否覆盖己存在的文件
boolean ib_keeploading
boolean ib_stop

constant long GENERIC_READ=2147483648
constant ulong FILE_BEGIN = 0

constant ulong INTERNET_FLAG_NO_CACHE_WRITE = 67108864
constant ulong INTERNET_OPEN_TYPE_DIRECT = 1
constant ulong INTERNET_SERVICE_FTP = 1
constant ulong INTERNET_FLAG_ElXISTING_CONNECT = 536870912
constant ulong INTERNET_FLAG_PASSIVE=134217728
constant ulong FTP_TRANSFER_TYPE_ASCII = 1
constant ulong FTP_TRANSFER_TYPE_BINARY = 2

constant ulong INTERNET_OPEN_TYPE_PRECONFIG = 0
constant ulong ERROR_NO_MORE_FILES = 18
constant ulong FILE_ATTRIBUTE_DIRECTORY = 16

Long il_netconn = 0       //是否连接上网络 0 不成功
Long il_ftpconn = 0     //连接上FTP的句柄 0 不成功

public:
String is_servername
String is_username
String is_password
Integer ii_port=21
boolean ib_yield
string is_otherparm //PASSIVE=1;


end variables

forward prototypes
public subroutine uf_sendmode (string as_mode)
public function string uf_open (string as_servername, string as_username, string as_password, integer ai_port)
public function string uf_get (string as_remotefile, string as_newfile)
public function string uf_put (string as_localfile, string as_remotefile)
public function string uf_rename (string as_localfile, string as_remotefile)
public function string uf_delete (string as_remotefile)
public function string uf_quit ()
public function string uf_open ()
public function boolean uf_getlastinfo (ref unsignedlong ul1, ref character lc_info[])
public function long uf_dir (string ls_filemask, ref string ls_filelist[], long l_maxcount)
public function long uf_dir (string ls_filemask, ref string ls_filelist[])
public subroutine uf_stop ()
public subroutine uf_reset ()
public function string uf_readfile (string as_remotefile, string as_newfile, boolean lb_keeploading)
public function string uf_mkdir (string as_remotefile)
public function string uf_rmdir (string as_remotefile)
end prototypes

public subroutine uf_sendmode (string as_mode);String ls_mode
ls_mode = Upper(as_mode)
If ls_mode = 'BIN' Then
	il_dwflags = 2
Else
	il_dwflags = 1
End If

end subroutine

public function string uf_open (string as_servername, string as_username, string as_password, integer ai_port);String ls_proxyname,ls_proxypass
Long ll_handle
string ls_errtext
ulong l_code,l_len=256
char ls_info[]

//ls_info=space(l_len)

SetNull(ls_proxyname)
SetNull(ls_proxypass)

if il_ftpconn<>0 then 
	ls_errtext='FTP未断开:'
	goto e
end if

if il_netconn<>0 then 
	ls_errtext='网络未断开。'
	goto e
end if
//ulong INTERNET_FLAG_RELOAD=2147483648

il_netconn = InternetOpen("FTP Control",1,ls_proxyname,ls_proxypass,10000000)
If il_netconn = 0 Then 
	uf_getlastinfo(l_code,ls_info)
	ls_errtext='不能打开Ftp控制:'+ls_info
	goto e
End If

//long INTERNET_SERVICE_FTP=1
//long INTERNET_SERVICE_GOPHER=2
//long INTERNET_SERVICE_HTTP=3

long lFlags=0
if pos(';'+is_otherparm,';PASSIVE=1;')>0 then //被动模式
	lFlags=INTERNET_FLAG_PASSIVE
end if

il_ftpconn = InternetConnect(il_netconn,as_servername,ai_port,as_username,as_password,INTERNET_SERVICE_FTP,lFlags,0) 
If il_ftpconn = 0 Then
	uf_getlastinfo(l_code,ls_info)
	ls_errtext='不能连接主机 :'+as_servername+' '+ls_info
	goto e
End If

is_servername = as_servername
is_username = as_username
is_password = as_password
ii_port = ai_port

return ''

e:
if il_netconn>0 or il_ftpconn>0 then uf_quit()
return ls_errtext
end function

public function string uf_get (string as_remotefile, string as_newfile);
Boolean lb_ok,lb_notover
lb_notover = Not ib_overfile
char ls_ret[]
ulong ul1,ul2
int li_pos1,li_pos2
string ls_lastchar
//li_pos1=

//if DeleteUrlCacheEntry(as_remotefile)=false then
//	Return 'DeleteUrlCacheEntry 失败!'
//end if
//ulong INTERNET_FLAG_NO_CACHE_WRITE=67108864

if il_ftpconn=0 then 
	ls_ret="FTP未连接"
	goto e
end if

lb_ok = FtpGetFile(il_ftpconn,as_remotefile,as_newfile,lb_notover,0,il_dwflags+INTERNET_FLAG_NO_CACHE_WRITE,0)
IF lb_ok = False Then
	uf_getlastinfo(ul1,ls_ret)
	if ls_ret='' then 
		ls_lastchar=right(as_newfile,1)
		if as_remotefile='' then 
			ls_ret='远程路径不能为空!'
		elseif ls_lastchar='/' or ls_lastchar='\' then
			ls_ret='本地路径"'+as_newfile+'"必须指定文件名称!'
		elseif fileexists(as_newfile)=false then
			ls_ret='本地路径"'+as_newfile+'"不存在!'
		else
			ls_ret="未知错误"
		end if
	end if
	goto e
End If

Return ''

e:
return ls_ret+';get '+as_remotefile+' '+as_newfile
end function

public function string uf_put (string as_localfile, string as_remotefile);Boolean lb_ok
char ls_ret[]
ulong ul1,ul2
string ls_lastchar

if fileexists(as_localfile)=false then 
	ls_ret='源文件'+as_localfile+'不存在!'
	goto e
end if

if il_ftpconn=0 then 
	ls_ret="FTP未连接"
	goto e
end if

lb_ok = FtpPutFile(il_ftpconn,as_localfile,as_remotefile,il_dwflags,0) 
IF lb_ok = False Then
	uf_getlastinfo(ul1,ls_ret)
	if ls_ret='' then 
		ls_lastchar=right(as_localfile,1)
		if as_remotefile='' then 
			ls_ret='远程路径不能为空!'
		elseif ls_lastchar='/' or ls_lastchar='\' then
			ls_ret='本地路径"'+as_localfile+'"必须指定文件名称!'
		elseif fileexists(as_localfile)=false then 
			ls_ret='本地路径"'+as_localfile+'"不存在!'
		else
			ls_ret="未知错误"
		end if
	end if
	goto e
End If

Return ''

e:
return ls_ret+';PUT '+as_localfile+' '+as_remotefile

end function

public function string uf_rename (string as_localfile, string as_remotefile);Boolean lb_ok
char strInfo[]
ulong ul1,ul2
lb_ok = FtpRenameFile(il_ftpconn,as_localfile,as_remotefile) 
IF lb_ok = False Then
	uf_getlastinfo(ul1,strInfo)
	Return 'Rename失败:'+string(strInfo)
End If

Return ''
end function

public function string uf_delete (string as_remotefile);Boolean lb_ok
ulong ul1,ul2
char strInfo[]

lb_ok = FtpDeleteFile(il_ftpconn,as_remotefile)
IF lb_ok = False Then
	uf_getlastinfo(ul1,strInfo)
	Return 'DeleteFile失败 '+strInfo
End If
Return ''

end function

public function string uf_quit ();Long ll_ok
boolean lb_ret
ulong l_code
char ls_info[]
string ls_errtext

if il_ftpconn<>0 then 
	lb_ret = InternetCloseHandle(il_ftpconn)
	If lb_ret = false Then
		uf_getlastinfo(l_code,ls_info)
		ls_errtext+='FTP未断开 :'+ls_info
	else
		il_ftpconn=0
	end if
end if

if il_netconn<>0 then 
	lb_ret = InternetCloseHandle(il_netconn)
	If lb_ret=false Then
		uf_getlastinfo(l_code,ls_info)
		ls_errtext+='网络未断开 :'+ls_info
	else
		il_netconn = 0
	end if
end if

Return ls_errtext

end function

public function string uf_open ();return uf_open(is_servername,is_username, is_password,ii_port)
end function

public function boolean uf_getlastinfo (ref unsignedlong ul1, ref character lc_info[]);boolean lb_ret
int li_pos,li_len
char lc_empty[]
ul1=0
lc_info[]=lc_empty[]
if li_len=0 then li_len=512
//if upperbound(lc_info[])=0 then lc_info[li_len]=''
lc_info[li_len]=''

lb_ret=InternetGetLastResponseInfo(ul1,lc_info,li_len)

li_pos=pos(lc_info,'End')
if li_pos>0 then lc_info=left(lc_info,li_pos + 3)

return lb_ret

//return true
end function

public function long uf_dir (string ls_filemask, ref string ls_filelist[], long l_maxcount);//返回获取的列表数
//ls_filelist[]为输出文件名结果
//l_maxcount为指定要获取的最大个数

string ls_filename,ls_null
long l_index
long l_lastfile,l_dir
win32_find_data lstr_empty,lstr_data

l_dir=FtpFindFirstFile(il_ftpconn,ls_filemask,lstr_data,0,0)

if l_dir=0 then goto m
Do 
	l_index++
	ls_filelist[l_index]=Trim(string(blob(lstr_data.cfilename[]),encodingansi!))
	if l_maxcount>0 then 
		if l_index>=l_maxcount then exit
	end if
	lstr_data=lstr_empty
	l_lastfile =InternetFindNextFile(l_dir,lstr_data)
Loop until l_lastfile=0

InternetCloseHandle(l_dir)

m:
return l_index

end function

public function long uf_dir (string ls_filemask, ref string ls_filelist[]);//返回获取的列表数
//ls_filelist[]为输出文件名结果

string ls_filename,ls_null
long l_index
long l_lastfile,l_dir
win32_find_data lstr_empty,lstr_data

l_dir=FtpFindFirstFile(il_ftpconn,ls_filemask,lstr_data,0,0)

if l_dir=0 then goto m
Do 
	l_index++
	ls_filelist[l_index]=Trim(string(blob(lstr_data.cfilename[]),encodingansi!))
	lstr_data=lstr_empty
	l_lastfile =InternetFindNextFile(l_dir,lstr_data)
Loop until l_lastfile=0

InternetCloseHandle(l_dir)

m:
return l_index

end function

public subroutine uf_stop ();ib_stop=true
end subroutine

public subroutine uf_reset ();ib_stop=false
end subroutine

public function string uf_readfile (string as_remotefile, string as_newfile, boolean lb_keeploading);
Boolean lb_ret
string ls_errtext
char strInfo[]
ulong ul1,ul2

long l_finishsize
int li_fileno,li_ret
string ls_lastchar
long l_filehandle
ulong ulNull

long ulfs1,ulfs2
long l_buffersize=2^10
ulong l_realsize
blob lb_buffer

SetNull(ulNull)

uf_reset()

l_filehandle=FtpOpenFile(il_ftpconn,as_remotefile,GENERIC_READ,FTP_TRANSFER_TYPE_ASCII,ulNull)
if l_filehandle <= 0 then 
	uf_getlastinfo(ul1,strInfo)
	ls_errtext='FtpOpenFile失败 '+strInfo
	goto e
end if

ulfs1 = FtpGetFileSize(l_filehandle,ulfs2)
if ulfs1<0 then 
	uf_getlastinfo(ul1,strInfo)
	ls_errtext='FtpGetFileSize失败 '+strInfo
	goto e
end if

li_fileno = FileOpen(as_newfile,StreamMode!, Write!, LockWrite!, Replace!)
if li_fileno=-1 then 
	ls_errtext='FileOpen失败 '+string(li_fileno)
	goto e
end if

l_finishsize=0
lb_buffer = blob(space(l_buffersize))
do
	if ib_yield then yield()
	lb_ret=InternetReadFile(l_filehandle,lb_buffer,l_buffersize,l_realsize)
	if lb_ret=false then
		uf_getlastinfo(ul1,strInfo)
		ls_errtext='InternetReadFile失败 '+strInfo
		goto e
	end if
	if ib_yield then yield()
	l_finishsize+=l_realsize
	li_ret=FileWriteex(li_fileno,BlobMid(lb_buffer,1,l_realsize))
	if li_ret=-1 then 
		ls_errtext='FileWriteex失败 '+string(li_ret)
		goto e
	end if
loop until l_realsize< l_buffersize or ib_stop

e:
if li_fileno>0 then 
	li_ret=FileClose(li_fileno)
	if li_ret=-1 then ls_errtext+='FileClose失败 '+string(li_ret)
	if ib_stop=true then 
		ls_errtext+='用户中止!'
		if lb_keeploading=false then 
			lb_ret=filedelete(as_newfile)
			if lb_ret=false then ls_errtext+='filedelete失败 '+string(lb_ret)
		end if
	end if
end if
if l_filehandle>0 then 
	lb_ret=InternetCloseHandle(l_filehandle)
	if lb_ret=false then 
		uf_getlastinfo(ul1,strInfo)
		ls_errtext+='InternetCloseHandle失败 '+strInfo
	end if
end if 
return ls_errtext

end function

public function string uf_mkdir (string as_remotefile);Boolean lb_ok
ulong ul1,ul2
char strInfo[]

lb_ok = FtpCreateDirectory(il_ftpconn,as_remotefile)
IF lb_ok = False Then
	uf_getlastinfo(ul1,strInfo)
	Return 'CreateDir失败 '+strInfo
End If
Return ''

end function

public function string uf_rmdir (string as_remotefile);Boolean lb_ok
ulong ul1,ul2
char strInfo[]

lb_ok = FtpRemoveDirectory(il_ftpconn,as_remotefile)
IF lb_ok = False Then
	uf_getlastinfo(ul1,strInfo)
	Return 'RemoveDir失败 '+strInfo
End If
Return ''

end function

on u_derek_ftp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_derek_ftp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

