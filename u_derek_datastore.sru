$PBExportHeader$u_derek_datastore.sru
forward
global type u_derek_datastore from datastore
end type
end forward

global type u_derek_datastore from datastore
end type
global u_derek_datastore u_derek_datastore

type variables
string is_dberror
end variables
on u_derek_datastore.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_derek_datastore.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror;is_dberror=string(sqldbcode,'')+' '+string(sqlerrtext,'')+' '+string(sqlsyntax,'')
return 1  //不显示出错信息
end event

event itemerror;is_dberror=string(row,'')+'/'+string(dwo.name,'')+':'+string(data,'')+' 未通过验证!'
return 1  //不显示出错信息
end event

