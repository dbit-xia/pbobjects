$PBExportHeader$uo_derek_datepicker.sru
$PBExportComments$设置数据窗口属性
forward
global type uo_derek_datepicker from datepicker
end type
end forward

global type uo_derek_datepicker from datepicker
integer width = 553
integer height = 100
boolean border = true
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("1900-01-01"), Time("00:00:00.000000"))
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 0
boolean todaysection = true
boolean todaycircle = true
end type
global uo_derek_datepicker uo_derek_datepicker

type prototypes
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"

end prototypes
type variables
string is_inifile_ctrl
window iw_parent
end variables

on uo_derek_datepicker.create
end on

on uo_derek_datepicker.destroy
end on

event constructor;powerobject lpo

string ls_Path 
ulong lul_handle,ul_size=1024

ls_Path = space(1024) 
lul_handle = Handle(GetApplication()) 
GetModuleFilename(lul_handle, ls_Path, ul_size) 
ls_Path=mid(ls_Path,1,lastpos(ls_Path,'\'))

is_inifile_ctrl=ls_Path+"control.ini"

//查找所属窗口
do 
	lpo=getparent()
loop until typeof(lpo)=window! 

iw_parent=lpo

setvalue(datetime(profilestring(is_inifile_ctrl,iw_parent.classname(),classname(),'')))

end event

event valuechanged;setprofilestring(is_inifile_ctrl,iw_parent.classname(),classname(),string(dtm))
end event

