$PBExportHeader$uo_derek_ddlb.sru
forward
global type uo_derek_ddlb from dropdownlistbox
end type
type ids from datastore within uo_derek_ddlb
end type
end forward

global type uo_derek_ddlb from dropdownlistbox
integer width = 457
integer height = 460
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
event ue_afteropen ( )
event ue_ncpaint pbm_ncpaint
event type string ue_getlistsql ( )
ids ids
end type
global uo_derek_ddlb uo_derek_ddlb

type prototypes
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"

end prototypes

type variables
string is_value,is_values[]
string is_empty[]
int i_index=1
boolean ib_initialized
string is_inifile_ctrl
window iw_parent
string is_oldtext
public:
boolean ib_memory=true
end variables

forward prototypes
public function string uf_setitems (string as_sql, string as_displayvalue, string as_datavalue)
public function string getquery (powerobject dd, string as_sql)
public function string uf_setitems (datastore ads, string as_displayvalue, string as_datavalue)
public function integer uf_selectitem (integer ai_index)
public function integer settext (string as_text)
end prototypes

event ue_afteropen();powerobject lpo

string ls_Path 
ulong lul_handle,ul_size=1024
int li_index

ls_Path = space(1024) 
lul_handle = Handle(GetApplication()) 
GetModuleFilename(lul_handle, ls_Path, ul_size) 
ls_Path=mid(ls_Path,1,lastpos(ls_Path,'\'))

is_inifile_ctrl=ls_Path+"control.ini"

lpo=this
//查找所属窗口
do 
	lpo=lpo.getparent()
loop until typeof(lpo)=window! 

iw_parent=lpo

//默认取初始值
long l_totalitems,i
string ls_text
if ib_memory then 
	ls_text=profilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),'0')
	settext(ls_text)
end if
l_totalitems=this.totalitems()
if text='' and this.allowedit=false and l_totalitems>0 then uf_selectitem(1)

goto m
m:
is_oldtext=text
ib_initialized=true
end event

event ue_ncpaint;if ib_initialized=false then event ue_afteropen()
end event

public function string uf_setitems (string as_sql, string as_displayvalue, string as_datavalue);//设置字段为dropdownlistbox的items
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

public function string uf_setitems (datastore ads, string as_displayvalue, string as_datavalue);//设置字段为dropdownlistbox的items
//datastore
//as_displayvalue	显示的字段值
//as_datavalue	数据项

string ls_ret
long i,l_rowcount,l_ret,l_displayid,l_dataid
string ls_errortext
boolean lb_sorted

l_rowcount=ads.rowcount()

is_values[]=is_empty[]

l_displayid=integer(ads.describe(as_displayvalue+".id"))
if l_displayid=0 then 
	ls_errortext="'"+as_displayvalue+"' Invalid!"
	goto e
end if
l_dataid=integer(ads.describe(as_datavalue+".id"))
if l_dataid=0 then 
	ls_errortext="'"+as_datavalue+"' Invalid!"
	goto e
end if

lb_sorted=sorted

if lb_sorted then sorted=false

for i=1 to l_rowcount
	ls_ret=string(ads.object.data[i,l_displayid],'')
	l_ret=additem(ls_ret)
	
	if l_ret=-1 then 
		ls_errortext="Set '"+ls_ret+"' Failed!"
		goto e
	end if
	
	is_values[l_ret]=string(ads.object.data[i,l_dataid],'')
	
next

//if lb_sorted then sorted=false

e:
return ls_errortext

end function

public function integer uf_selectitem (integer ai_index);//设置item的当前index,替代selectitem函数

int li_ret
if ai_index=0 then return 0
li_ret=selectitem(ai_index)
if li_ret>=1 and li_ret=ai_index then
	//记录当前index
	i_index=ai_index
	if upperbound(is_values)>=ai_index then 
		is_value=is_values[ai_index]
	else
		is_value=text(ai_index)
	end if
end if

return li_ret
end function

public function integer settext (string as_text);long l_totalitems,li_index
l_totalitems=this.totalitems()
if this.allowedit=false then 
	for li_index=l_totalitems to 1 step -1
		if this.text(li_index)=as_text then exit
	next
	if li_index=0 then return -1
	uf_selectitem(li_index)
else
	this.text=as_text
end if
return event modified()
end function

on uo_derek_ddlb.create
this.ids=create ids
end on

on uo_derek_ddlb.destroy
destroy(this.ids)
end on

event selectionchanged;event modified()
end event

event modified;if ib_initialized=true then 
	setprofilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),text)
end if
is_oldtext=text
end event

type ids from datastore within uo_derek_ddlb descriptor "pb_nvo" = "true" 
end type

on ids.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

