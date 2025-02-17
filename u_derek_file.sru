$PBExportHeader$u_derek_file.sru
forward
global type u_derek_file from nonvisualobject
end type
end forward

global type u_derek_file from nonvisualobject
end type
global u_derek_file u_derek_file

forward prototypes
public function string uf_filewrite (readonly string as_filepath, readonly string as_text, readonly writemode a_writemode, readonly encoding a_encoding)
public function string uf_filewrite (readonly string as_filepath, readonly blob ab_text)
public function string createpath (string as_filepath)
public function string uf_filewrite (readonly string as_filepath, readonly string as_text)
end prototypes

public function string uf_filewrite (readonly string as_filepath, readonly string as_text, readonly writemode a_writemode, readonly encoding a_encoding);//写文件的内容
//参数:as_filepath 文件路径,as_text 返回blob类型的内容,a_writemode 写入模式,a_encoding 字符编码
//返回值:''为成功,否则为失败信息

long l_hwd,l_ret,i
long l_length
string ls_errtext


l_hwd=fileopen(as_filepath,textMode!,write!,lockwrite!,a_writemode,a_encoding)
if l_hwd=-1 then 
	ls_errtext+='文件:'+as_filepath+'打开失败!'
	goto e
end if

l_ret=filewriteex(l_hwd,as_text)

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

l_ret=filewriteex(l_hwd,ab_text)

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

public function string uf_filewrite (readonly string as_filepath, readonly string as_text);//写文件的内容
//参数:as_filepath 文件路径,as_text 返回blob类型的内容
//返回值:''为成功,否则为失败信息

#if defined PBDOTNET then
//	using System.IO;
//	using System.Text;
	System.Web.Services.WebService lws ;
	lws=create System.Web.Services.WebService;
	string ls_path;
	ls_path=as_filepath
	if (ls_path.Contains(":") = false) then
		ls_path =lws.Server .MapPath(ls_path);
	end if
	System.IO.File.AppendAllText(ls_path, DateTime.Now.ToString() + "~r~n", System.Text.Encoding.Default);
	return "";
#end if

return uf_filewrite(as_filepath,as_text,Append!,EncodingANSI! )
end function

on u_derek_file.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_derek_file.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

