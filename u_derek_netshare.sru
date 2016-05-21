$PBExportHeader$u_derek_netshare.sru
forward
global type u_derek_netshare from nonvisualobject
end type
type s_var from structure within u_derek_netshare
end type
end forward

type s_var from structure
	long		dwScope
	long		dwType
	long		dwDisplayType
	long		dwUsage
	string		lplocalname
	string		lpremotename
	string		ipcomment
	long		lppovider
end type

global type u_derek_netshare from nonvisualobject
end type
global u_derek_netshare u_derek_netshare

type prototypes
 //Ôö¼ÓÍøÂç¹²ÏíÓ³Éä
 function   ulong     WNetAddConnection2A(ref   s_var   lnet,ref   string   pass,ref   string   username,ulong   dwflags)   library   "mpr.dll"     
 //¶Ï¿ªÍøÂç¹²ÏíÓ³Éä
 FUNCTION   ulong   WNetCancelConnection2A(ref   string   lpName,ulong   dwFlags,ulong   fForce)   LIBRARY   "mpr.dll"   
end prototypes
type variables

end variables

forward prototypes
public function integer uf_add (string lplocalname, string l_shuser, string l_shpwd, string lpremotename)
end prototypes

public function integer uf_add (string lplocalname, string l_shuser, string l_shpwd, string lpremotename);//Ôö¼ÓÍøÂç¹²ÏíÓ³Éä

//,long dwscope, long dwtype, long dwdisplaytype, long dwusage, string ipcomment, long lppovider
s_var s_var
//s_var.dwScope=dwScope
//s_var.dwType=dwType
//s_var.dwDisplayType= dwDisplayType 
//s_var.dwUsage=  dwUsage
s_var.lplocalname= lplocalname  //Ó³Éä±¾µØ´ÅÅÌ·ûºÅ
s_var.lpremotename=lpremotename  //ÍøÂç¹²ÏíµØÖ·
//s_var.ipcomment= ipcomment  
//s_var.lppovider=lppovider
   
  string   err,lpname     
    
  ulong   dwflags=0,lu_return,lu_nbuffsize=256,errcode      
  setnull(s_var.lppovider)   
 
  return WNetAddConnection2A(s_var,l_shpwd,l_shuser,dwflags)     

end function

on u_derek_netshare.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_derek_netshare.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor; s_var s_var
 s_var.dwScope=1
end event

