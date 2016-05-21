$PBExportHeader$u_thread.sru
forward
global type u_thread from nonvisualobject
end type
end forward

global type u_thread from nonvisualobject
end type
global u_thread u_thread

type variables
private :
window iw_temp[]
int i_firstfindindex
end variables

forward prototypes
public function string uf_sodir (ref string as_instancenames[], ref string as_classnames[])
public function string uf_soreg (string as_classname, string as_instancename)
public function string uf_sounreg (string as_instancename)
public function string uf_soget (string as_instancename, ref powerobject apo_objectinstance)
public function string uf_soset (string as_instancename, ref powerobject apo_objectinstance)
public function integer uf_openwindow (string ls_windowname)
public function integer uf_closewindow ()
public subroutine uf_destroy (powerobject lobj)
public function integer uf_closewindow (string ls_windowname)
public function boolean uf_isvalid (string ls_windowname)
public function window uf_getwindow (string ls_windowname)
public function integer uf_findwindow (string ls_windowname)
public function integer uf_firstfind (integer li_index)
public function integer uf_openwindow (ref window lw_empty, string ls_windowname)
end prototypes

public function string uf_sodir (ref string as_instancenames[], ref string as_classnames[]);
ErrorReturn ler

ler=SharedObjectDirectory ( as_instancenames[],as_classnames[])

choose case ler
	case Success! 
		return ''
	case FeatureNotSupportedError! 
		return 'FeatureNotSupportedError!'
end choose

return 'Unknown!'
end function

public function string uf_soreg (string as_classname, string as_instancename);ErrorReturn ler
ler=SharedObjectRegister(as_classname,as_instancename)
choose case ler
	case Success! 
		return ''
	case SharedObjectExistsError!
		return 'SharedObjectExistsError!'
	case SharedObjectCreateInstanceError!
		return 'SharedObjectCreateInstanceError!'
	case SharedObjectCreatePBSessionError!
		return 'SharedObjectCreatePBSessionError!'
end choose

return 'Unknown!'


end function

public function string uf_sounreg (string as_instancename);//sleep(2)

ErrorReturn ler
ler=SharedObjectUnRegister(as_instancename)
choose case ler
	case Success! 
		return ''
	case SharedObjectNotExistsError!
		return 'SharedObjectNotExistsError!'
end choose

return 'Unknown!'
end function

public function string uf_soget (string as_instancename, ref powerobject apo_objectinstance);ErrorReturn ler
try
	ler=SharedObjectget(as_instancename,apo_objectinstance)
	choose case ler
		case Success! 
			return ''
		case SharedObjectCreateInstanceError!
			return 'SharedObjectCreateInstanceError!'
		case SharedObjectNotExistsError!
			return 'SharedObjectNotExistsError!'
	end choose
catch(runtimeerror e)
	messagebox('',e.getmessage())
end try

return 'Unknown!'


end function

public function string uf_soset (string as_instancename, ref powerobject apo_objectinstance);string ls_errtext
string ls_newinstancename
ls_newinstancename=as_instancename
ls_errtext=uf_soreg(as_instancename,ls_newinstancename)
if ls_errtext<>'' then goto e

ls_errtext=uf_soget(ls_newinstancename,apo_objectinstance)
if ls_errtext<>'' then goto e

return ''
e:
return ls_errtext


end function

public function integer uf_openwindow (string ls_windowname);int l_wincount,i,l_emptyindex,l_findindex
l_findindex=uf_findwindow(ls_windowname)
if l_findindex>0 then return l_findindex

l_wincount=upperbound(iw_temp[])

l_findindex=0
for i=1 to l_wincount
	if not isvalid(iw_temp[i]) then 
		l_findindex=i
		exit
	end if
next

if l_findindex=0 then l_findindex=l_wincount+1
open(iw_temp[l_findindex],ls_windowname)

return l_findindex
end function

public function integer uf_closewindow ();int l_wincount,i,l_closecount
l_wincount=upperbound(iw_temp[])

for i=1 to l_wincount
	if not isvalid(iw_temp[i]) then continue;	
	close(iw_temp[i])
	l_closecount++
next

return l_closecount
end function

public subroutine uf_destroy (powerobject lobj);destroy lobj
end subroutine

public function integer uf_closewindow (string ls_windowname);int l_findindex
l_findindex=uf_findwindow(ls_windowname)
if l_findindex<=0 then return l_findindex
if isvalid(iw_temp[l_findindex]) then 
	l_findindex=close(iw_temp[l_findindex])
	return l_findindex
end if
return 0
end function

public function boolean uf_isvalid (string ls_windowname);int l_findindex
l_findindex=uf_findwindow(ls_windowname)
if l_findindex>0 then return true
return false
end function

public function window uf_getwindow (string ls_windowname);//优先获取指定索引的窗口
int l_findindex
window lw_empty
l_findindex=uf_findwindow(ls_windowname)
if l_findindex>0 then return iw_temp[l_findindex]
return lw_empty
end function

public function integer uf_findwindow (string ls_windowname);int l_wincount,i,l_findindex
l_findindex=i_firstfindindex
l_wincount=upperbound(iw_temp[])

//优先查找指定的索引
if l_findindex>0 and l_findindex<=l_wincount then 
	if isvalid(iw_temp[l_findindex]) then
		if classname(iw_temp[l_findindex])=ls_windowname then return l_findindex
	end if
end if

l_findindex=0
for i=1 to l_wincount
	if not isvalid(iw_temp[i]) then continue;	
	if classname(iw_temp[i])=ls_windowname then 
		l_findindex=i
		exit
	end if
next

return l_findindex
end function

public function integer uf_firstfind (integer li_index);i_firstfindindex=li_index
return i_firstfindindex
end function

public function integer uf_openwindow (ref window lw_empty, string ls_windowname);return open(lw_empty,ls_windowname)

end function

on u_thread.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_thread.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

