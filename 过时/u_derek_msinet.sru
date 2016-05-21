$PBExportHeader$u_derek_msinet.sru
forward
global type u_derek_msinet from nonvisualobject
end type
end forward

global type u_derek_msinet from nonvisualobject autoinstantiate
end type

forward prototypes
public function string uf_exec (string as_server, string as_uid, string as_pwd, unsignedinteger ai_timeout, string as_cmd)
public function string uf_get (string as_server, string as_uid, string as_pwd, string as_rpath, string as_lpath)
public function string uf_put (string as_server, string as_uid, string as_pwd, string as_lpath, string as_rpath)
public function string uf_dir (string as_server, string as_uid, string as_pwd, string as_dir, ref string as_dirlist)
end prototypes

public function string uf_exec (string as_server, string as_uid, string as_pwd, unsignedinteger ai_timeout, string as_cmd);
string ls_ret
try
	open(w_derek_msinet)
	ls_ret=w_derek_msinet.uf_exec (as_server,  as_uid,  as_pwd,  ai_timeout,  as_cmd)
	close(w_derek_msinet)
catch(runtimeerror e)
	ls_ret+=e.getmessage()
end try
return ls_ret

end function

public function string uf_get (string as_server, string as_uid, string as_pwd, string as_rpath, string as_lpath);
string ls_ret
try
	open(w_derek_msinet)
	ls_ret=w_derek_msinet.uf_get ( as_server,  as_uid,  as_pwd,  as_rpath,  as_lpath)
	close(w_derek_msinet)
catch(runtimeerror e)
	ls_ret+=e.getmessage()
end try
return ls_ret

end function

public function string uf_put (string as_server, string as_uid, string as_pwd, string as_lpath, string as_rpath);
string ls_ret
try
	open(w_derek_msinet)
	ls_ret=w_derek_msinet.uf_put ( as_server,  as_uid,  as_pwd,  as_lpath,  as_rpath)
	close(w_derek_msinet)
catch(runtimeerror e)
	ls_ret+=e.getmessage()
end try
return ls_ret

end function

public function string uf_dir (string as_server, string as_uid, string as_pwd, string as_dir, ref string as_dirlist);
string ls_ret
try
	open(w_derek_msinet)
	ls_ret=w_derek_msinet.uf_dir ( as_server,  as_uid,  as_pwd,  as_dir,  as_dirlist)
	close(w_derek_msinet)
catch(runtimeerror e)
	ls_ret+=e.getmessage()
end try
return ls_ret

end function

on u_derek_msinet.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_derek_msinet.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

