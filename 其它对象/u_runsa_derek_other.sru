$PBExportHeader$u_runsa_derek_other.sru
forward
global type u_runsa_derek_other from nonvisualobject
end type
end forward

shared variables
boolean sb_constructor //是否已经取过一次值,唯一码状态只取一次即可
string ss_doing //当前动作
end variables

global type u_runsa_derek_other from nonvisualobject
end type
global u_runsa_derek_other u_runsa_derek_other

type variables
u_runsa_derek_v2 u_derek

end variables

forward prototypes
public function string uf_inivar (string ls_varname)
end prototypes

public function string uf_inivar (string ls_varname);choose case ls_varname
	case 'u_derek'
		if not isvalid(u_derek) then u_derek=create u_runsa_derek_v2
end choose
return ''
end function

on u_runsa_derek_other.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_runsa_derek_other.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

