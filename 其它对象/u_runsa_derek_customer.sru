$PBExportHeader$u_runsa_derek_elle.sru
forward
global type u_runsa_derek_elle from nonvisualobject
end type
type ids_temp from datastore within u_runsa_derek_elle
end type
end forward

shared variables
boolean sb_constructor //是否已经取过一次值,唯一码状态只取一次即可
string ss_doing //当前动作
end variables

global type u_runsa_derek_elle from nonvisualobject
ids_temp ids_temp
end type
global u_runsa_derek_elle u_runsa_derek_elle

type variables
long il_sec //一天经过的秒数
string is_inifile='runsa_elle.ini',is_ftpsection='runsa_mend'

int i_getsvrno
int i_svrnum=1//业务数
string is_svrnames[]={"elle_runsa_mend"}

//u_derek_dd u_dd
u_runsa_derek u_derek

string is_task_current

string is_xmlhead='<?xml version=~~"1.0~~" encoding=~~"UTF-16LE~~" standalone=~~"no~~"?>'	//数据窗口的模板head
string is_xmlstr='<?xml version="1.0" encoding="UTF-16LE" standalone="no"?>'	//xml拼接时的head
string is_encoding="UTF-16LE"

string is_xmlheadd='<?xml version=~~"1.0~~" encoding=~~"UTF-16LE~~" standalone=~~"yes~~"?>'	//数据窗口的模板head
string is_xmlstrd='<?xml version="1.0" encoding="UTF-16LE" standalone="yes"?>'	//xml拼接时的head
string is_encodingd="UTF-16LE"

encoding i_encoding=encodingutf16le!
int i_autorun=0
end variables

forward prototypes
public function string uf_setstyle (powerobject dd, integer ai_style)
public function string uf_getsql (string as_dataobject)
public function string uf_upgrade_sybase ()
public function integer uf_log (string as_tablename, string ls_errtext, string ls_nos, integer ai_sucflags, long l_orgcount, long l_newcount)
public function string uf_initial_check ()
public subroutine uf_autorun ()
end prototypes

public function string uf_setstyle (powerobject dd, integer ai_style);return u_derek.uf_setstyle(dd,1)
end function

public function string uf_getsql (string as_dataobject);string ls_sql
long l_ret
ls_sql=""

//1读取sql文件
l_ret=u_derek.u_fun.readtxt(g_current_path+'\'+as_dataobject+'.sql',ls_sql)
if l_ret<=0 then 
	//取默认定义sql
	u_derek.u_dd.ids.dataobject=as_dataobject
	ls_sql=u_derek.u_dd.ids.getsqlselect()
end if

return ls_sql
end function

public function string uf_upgrade_sybase ();//分销库建表
//返回失败信息

string ls_text,ls_errtext
long l_ret
int li_upb,i
string ls_sqls[]
boolean lb_wait
boolean lb_AutoCommit

lb_AutoCommit=sqlca.AutoCommit
lb_wait=isvalid(w_wait)

u_derek.wait(1,'Get upgrade data')

ls_text=uf_getsql('d_runsa_derek_records_create')

ls_sqls=u_derek.u_fun.getarray(ls_text,"~r~nGO~r~n",0,1)
li_upb=upperbound(ls_sqls)
if li_upb>0 then 
	SQLCA.AutoCommit   =   TRUE
	for i=1 to li_upb
		u_derek.wait(100 * i / li_upb,ls_sqls[i])
		execute immediate :ls_sqls[i];
		if sqlca.sqlcode=-1 and sqlca.sqldbcode<>2714 and sqlca.sqldbcode<>1913 then //忽略表存在,索引存在
			ls_errtext+=sqlca.sqlerrtext+"~r~n"
			uf_log('interface_upgrade',sqlca.sqlerrtext,'',2,0,0)
		end if
	next
	
	if lb_autocommit=false then sqlca.AutoCommit   =   false
end if

//if ls_errtext<>'' then 
//	f_messagebox('',ls_errtext,0,0)
//end if

if lb_wait=false then u_derek.closewait()
return ls_errtext
end function

public function integer uf_log (string as_tablename, string ls_errtext, string ls_nos, integer ai_sucflags, long l_orgcount, long l_newcount);//写日志,A714
//类型,错误信息,单号,是否成功,原数量,成功数量
if as_tablename='' then as_tablename='interface_800best'
return f_wgz_errorlog('tablename='+as_tablename+';'+ls_errtext+';nos='+ls_nos+';sucflags='+string(ai_sucflags,'')+';nb='+string(l_orgcount)+';nb2='+string(l_newcount,'')+';')
end function

public function string uf_initial_check ();long l_count
string ls_errtext
boolean lb_wait
lb_wait=isvalid(w_wait)

select count(1) into :l_count
from sysobjects
where name='derek_records';

if l_count=0 then 
	ls_errtext='首次使用需要先初始化!'
	goto e
end if
	
return ''

e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
//if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then u_derek.closewait()
return ls_errtext
end function

public subroutine uf_autorun ();string ls_now
long ll_cpu,l_count
int i
string ls_errtext
boolean lb_wait
ll_cpu=cpu()

int li_max,li_ret,li_index
string ls_sql

ls_now=string(today(),'hh:mm:ss')
l_count=0

//109: 维修单接口
select count(1)
into :l_count
from wgz_autosyn_time
where flags=109 and convert(time,getdate()) between convert(time,time_s) and convert(time,time_e)
	and DATEDIFF(mi,convert(time,time_s),convert(time,getdate())) % times=0;
if sqlca.sqlcode =-1 then goto e

//if l_count>0 then 
//	ls_errtext=uf_initial_check()
//	if ls_errtext<>'' then goto e
//	uf_zg_mend_send(is_svrnames[1])
//end if

goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
if lb_wait=false then u_derek.closewait()
return 

end subroutine

on u_runsa_derek_elle.create
call super::create
this.ids_temp=create ids_temp
TriggerEvent( this, "constructor" )
end on

on u_runsa_derek_elle.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.ids_temp)
end on

type ids_temp from datastore within u_runsa_derek_elle descriptor "pb_nvo" = "true" 
end type

on ids_temp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_temp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

