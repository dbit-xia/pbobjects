$PBExportHeader$uo_derek_listbox.sru
forward
global type uo_derek_listbox from listbox
end type
type ids from datastore within uo_derek_listbox
end type
end forward

global type uo_derek_listbox from listbox
integer width = 512
integer height = 520
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean multiselect = true
borderstyle borderstyle = StyleBox!
boolean extendedselect = true
ids ids
end type
global uo_derek_listbox uo_derek_listbox

type variables
powerobject ip_add
string is_values[],is_empty[],is_value
end variables

forward prototypes
public function string getquery (powerobject dd, string as_sql)
public function string setitems (string as_sql, string as_displayvalue, string as_datavalue)
end prototypes

public function string getquery (powerobject dd, string as_sql);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

string l_syntax,l_err=''
l_syntax=sqlca.syntaxfromsql(as_sql,'style(type=grid)',l_err)
if len(l_err)>0 then
	goto e
end if

dd.dynamic create(l_syntax,l_err)
if len(l_err)>0 then
	goto e
end if

return ''

e:
return l_err
end function

public function string setitems (string as_sql, string as_displayvalue, string as_datavalue);//设置字段为dropdownlistbox的items
//as_sql 列表的数据
//as_displayvalue	显示的字段值
//as_datavalue	数据项

string ls_ret
long i,l_rowcount,l_ret,l_displayid,l_dataid
string ls_errortext
boolean lb_sorted

ls_errortext=getquery(ids,as_sql)
if ls_errortext>'' then goto e

ids.settransobject(sqlca)
l_rowcount=ids.retrieve()

is_values[]=is_empty[]

l_displayid=integer(ids.describe(as_displayvalue+".id"))
if l_displayid=0 then 
	ls_errortext="'"+as_displayvalue+"' Invalid!"
	goto e
end if
l_dataid=integer(ids.describe(as_datavalue+".id"))
if l_dataid=0 then 
	ls_errortext="'"+as_datavalue+"' Invalid!"
	goto e
end if

lb_sorted=sorted

if lb_sorted then sorted=false

for i=1 to l_rowcount
	ls_ret=string(ids.object.data[i,l_displayid],'')
	l_ret=additem(ls_ret)
	
	if l_ret=-1 then 
		ls_errortext="Set '"+ls_ret+"' Failed!"
		goto e
	end if
	
	is_values[l_ret]=string(ids.object.data[i,l_dataid],'')
	
next

//if lb_sorted then sorted=false

e:
return ls_errortext

end function

on uo_derek_listbox.create
this.ids=create ids
end on

on uo_derek_listbox.destroy
destroy(this.ids)
end on

event losefocus;if isvalid(ip_add) then 
	if GetFocus ( )<>ip_add then visible=false
end if
end event

type ids from datastore within uo_derek_listbox descriptor "pb_nvo" = "true" 
end type

on ids.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

