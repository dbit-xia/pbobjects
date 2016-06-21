$PBExportHeader$u_runsa_derek_rollout.sru
forward
global type u_runsa_derek_rollout from nonvisualobject
end type
type iu_fun from u_derek_v2_fun within u_runsa_derek_rollout
end type
end forward

global type u_runsa_derek_rollout from nonvisualobject
iu_fun iu_fun
end type
global u_runsa_derek_rollout u_runsa_derek_rollout

forward prototypes
public function string uf_totrunf (string ls_flags, ref string ls_ref)
public function string uf_tomake (string ls_flags, ref string ls_ref)
public function string uf_tort (string ls_flags, ref string ls_ref)
public function string uf_outdate_control (string ls_flags)
public function string iif (boolean lb_expression, string ls_truevalue, string ls_falsevalue)
public function string uf_outdate_control (string ls_flags, ref string ls_jzdate_max)
end prototypes

public function string uf_totrunf (string ls_flags, ref string ls_ref);string ls_msgtitle,ls_errtext
boolean lb_wait

string ls_maintable,ls_insuref,ls_newnos,ls_datatable,ls_datanos,ls_datawhere,ls_txinfo
string ls_movenos,ls_gprice,ls_sprice,ls_sql,ls_nos3
string ls_outcusno,ls_incusno,ls_outdate,ls_calcprice,ls_bulkflags,ls_trunfpnos,ls_chflags,ls_indbno,ls_bz
long l_kinds11_ref,l_bulkflags
int li_cwflags,li_ret
dec ld_per

lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent

ls_maintable='trunf'
ls_insuref='trunfb'

ls_outcusno=f_maintain_s(ls_flags,'outcusno=',';') //;
ls_incusno=f_maintain_s(ls_flags,'incusno=',';') //;
ls_gprice=f_maintain_s(ls_flags,'gprice=',';')
ls_sprice=f_maintain_s(ls_flags,'sprice=',';')
ls_calcprice=f_maintain_s(ls_flags,'calcprice=',';')
ls_txinfo=f_maintain_s(ls_flags,'txinfo=',';')

ls_datatable=f_maintain_s(ls_flags,'datatable=',',')
ls_datanos=f_maintain_s(ls_flags,'datanos=',',')
ls_datawhere=f_maintain_s(ls_flags,'datawhere=',',')


if ls_datatable='' then 
	ls_errtext='源数据表不能为空!'
	goto m
end if

//if ls_datanos='' then 
//	ls_errtext='源单号不能为空!'
//	goto m
//end if

ls_bulkflags=f_maintain_s(ls_flags,'bulkflags=',',')
ls_chflags=f_maintain_s(ls_flags,'chflags=',',')
ls_indbno=f_maintain_s(ls_flags,'indbno=',',')
ls_movenos=f_maintain_s(ls_flags,'movenos=',',')
ls_nos3=f_maintain_s(ls_flags,'nos3=',',')
ls_trunfpnos=f_maintain_s(ls_flags,'trunfpnos=',',')
ls_outdate=f_maintain_s(ls_flags,'outdate=',',') //
if ls_outdate='' then 
	ls_outdate=string(today(),'YYYYMMDD')
else
	if ls_outdate<>string(date(string(ls_outdate,'@@@@-@@-@@')),'YYYYMMDD') then 
		ls_errtext='日期无效:'+ls_outdate
		goto m
	end if	
end if

ls_bz=ls_flags

//结账日控制
ls_errtext=uf_outdate_control('cusno='+ls_outcusno+';outdate='+ls_outdate+';')
if ls_errtext<>'' then goto e
if ls_chflags='1' then 
	ls_errtext=uf_outdate_control('cusno='+ls_incusno+';outdate='+ls_outdate+';')
	if ls_errtext<>'' then goto e
end if

if ls_bulkflags='' then 
	l_bulkflags=0
else
	l_bulkflags=long(ls_bulkflags)
end if

li_cwflags=f_zg_cwflags(ls_incusno,ls_outcusno,l_kinds11_ref)
if li_cwflags=-1 then
	ls_errtext="计算区间失败!"
	goto m
end if
ls_newnos = f_zg_nos(ls_outcusno,1,'trunfb',g_stanos) 
if ls_newnos = '-1' then
	/*记录失败店家*/
	ls_errtext='单号无效:'+ls_newnos
	goto m
end if

if li_cwflags>=5 then //退货取发方退货折数
	select isnull(max(rtpers),1) into :ld_per
	from zgck_acc
	where ckaccno=:ls_outcusno;
	
	if sqlca.sqlcode = -1 then goto e
else
	select isnull(max(ckpers),1) into :ld_per
	from zgck_acc
	where ckaccno=:ls_incusno;
	
	if sqlca.sqlcode = -1 then goto e
end if
				
//表头
insert into trunf(cusno,inckno,nos,outdate,per,nb,now,now_real,now_cost,rmark,gxrq,zdr,
							flags,stanos,chflags,olddate,kinds1,cwflags,loginckaccno,kinds11,bulkflags,bz,nos3,trunfpnos,movenos,indbno)
values(:ls_outcusno,:ls_incusno,:ls_newnos,:ls_outdate,:ld_per,0,0,0,0,'0',getdate(),:personcode,
						1,:g_stanos,'0',:ls_outdate,0 ,:li_cwflags,:g_stanos,:l_kinds11_ref,:l_bulkflags,:ls_bz,:ls_nos3,:ls_trunfpnos,:ls_movenos,:ls_indbno);


if sqlca.sqlcode = -1 then goto e

if ls_datatable='buypb' then
	insert into trunfb(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice)
	select :ls_newnos,t1.nos_rec,t1.colthno,t1.color,t1.xh,t1.xhnb,t1.nb,t1.nb,t1.price,t1.pers,t1.endprice
	from buypb t1
	where t1.nos=:ls_datanos and t1.nb<>0;
	
	if sqlca.sqlcode=-1 then goto e
elseif ls_datatable<>'' then
	ls_sql="insert into trunfb(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice) &
		select '"+ls_newnos+"',nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice &
		from "+ls_datatable+" "
		if ls_datawhere<>'' then ls_sql+=" where "+ls_datawhere
	execute immediate :ls_sql;
	if sqlca.sqlcode=-1 then goto e
end if

if ls_gprice='1' then 
	
	update trunfb
	set price=t2.sprice
	from trunfb t1,coloth t2
	where t1.nos=:ls_newnos and t2.colthno=t1.colthno and t2.color_nos=t1.color and isnull(t1.price,0)=0;
	
	if sqlca.sqlcode=-1 then goto e
	
	update trunfb
	set endprice=t2.gprice
	from trunfb t1,coloth_t t2
	where t1.nos=:ls_newnos and t2.colthno=t1.colthno;
	
	if sqlca.sqlcode=-1 then goto e
	
	update trunfb
	set pers=case when isnull(price,0) = 0 then 0 when round(endprice / price,4)>=10 then 9.9999 else round(endprice / price,4) end
	where nos=:ls_newnos;
	
	if sqlca.sqlcode=-1 then goto e
	
elseif ls_sprice='1' then
	
	update trunfb
	set price=t2.sprice,pers=1,endprice=t2.sprice
	from trunfb t1,coloth t2
	where t1.nos=:ls_newnos and t2.colthno=t1.colthno and t2.color_nos=t1.color;
	
	if sqlca.sqlcode=-1 then goto e
	
end if

if ls_calcprice='1' then 

	update trunfb
	set pers=:ld_per,endprice=t3.sprice * :ld_per
	from trunfb t1,coloth_easy t3
	where t1.nos=:ls_newnos and t3.colthno=t1.colthno and t3.color_nos=t1.color;
	
	if sqlca.sqlcode = -1 then goto e
	
//	update trunfb
//	set pers=case when isnull(price,0) = 0 then 0 when round(endprice / price,4)>=10 then 9.9999 else round(endprice / price,4) end
//	where nos=:ls_newnos;
//	
//	if sqlca.sqlcode = -1 then goto e
	
	li_ret=f_zg_nos_endprice(ls_newnos,'trunfb','')
	if li_ret=-1 then 
		ls_errtext='计算价格失败!'
		goto m
	end if
end if
//else
//	insert into trunfb(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice)
//	select :ls_newnos,t1.nos_rec,t1.colthno,t1.color,t1.xh,1,t1.nb,t1.nb,t1.now,1,t1.now_real
//	from trunfb1 t1
//	where t1.nos=:g_recno2 and t1.nb<>0;
//	
//	if sqlca.sqlcode = -1 then goto e
//	
//end if

//函数复杂,可能报错并rollback
//f_zg_bznos(gdw_emp,'nos='+ls_newnos+';trunf')

//过账
li_ret=f_trunfb(ls_newnos,1,1)
if li_ret=-1 then
	ls_errtext='新单据过账失败!'
	goto m
end if

if ls_chflags='1' then 
	//过账
	li_ret=f_trunfb(ls_newnos,-1,1)
	if li_ret=-1 then
		ls_errtext='移仓单确认_反过账失败!'
		goto m
	end if
	
	update trunf
	set chflags=:ls_chflags,gxrq=getdate(),zdr=:personcode
	where nos=:ls_newnos;
	
	//过账
	li_ret=f_trunfb(ls_newnos,1,1)
	if li_ret=-1 then
		ls_errtext='移仓单确认_过账失败!'
		goto m
	end if

end if

if ls_txinfo='0' then 
	//不发送
else
	//发送
	li_ret=f_zg_txinfo_nos('trunf',ls_newnos,g_dbstatus,'')
	if li_ret= -1 then 
		ls_errtext="移仓单发送失败!"
		goto m
	end if
end if

if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_newnos
return '1'

goto m
m:
if sqlca.sqlcode=-1 then goto e
rollback;
if sqlca.sqlcode=-1 then goto e
if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_errtext //+' '+ls_outcusno+'-->'+ls_incusno
return '0'

goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext+'~r~n'
if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_errtext //+' '+ls_outcusno+'-->'+ls_incusno
return '-1'
end function

public function string uf_tomake (string ls_flags, ref string ls_ref);string ls_msgtitle,ls_errtext
boolean lb_wait

string ls_maintable,ls_insuref,ls_newnos,ls_datatable,ls_datanos
string ls_movenos,ls_gprice,ls_sprice
string ls_outcusno,ls_incusno,ls_outdate,ls_calcprice,ls_bulkflags,ls_contractno,ls_chflags,ls_preindate,ls_odno,ls_bz
long l_bulkflags
int li_cwflags,li_ret
dec ld_per
dec ldec_tax_val
string ls_ret

lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent

ls_maintable='ma'
ls_insuref='make'

ls_outcusno=f_maintain_s(ls_flags,'outcusno=',';') //;
ls_incusno=f_maintain_s(ls_flags,'incusno=',';') //;
ls_gprice=f_maintain_s(ls_flags,'gprice=',';')
ls_sprice=f_maintain_s(ls_flags,'sprice=',';')

ls_datatable=f_maintain_s(ls_flags,'datatable=',',')
ls_datanos=f_maintain_s(ls_flags,'datanos=',',')


if ls_datatable='' then 
	ls_errtext='源数据表不能为空!'
	goto m
end if

if ls_datanos='' then 
	ls_errtext='源单号不能为空!'
	goto m
end if

ls_outdate=f_maintain_s(ls_flags,'outdate=',',') //
if ls_outdate='' then 
	ls_outdate=string(today(),'YYYYMMDD')
else
	if ls_outdate<>string(date(string(ls_outdate,'@@@@-@@-@@')),'YYYYMMDD') then 
		ls_errtext='日期无效:'+ls_outdate
		goto m
	end if	
end if

ls_bz=f_maintain_s(ls_flags,'bz=',',')
if ls_bz<>'' then 
	ls_bz=iu_fun.urldecode(ls_bz,encodingutf8!)
end if

ls_bulkflags=f_maintain_s(ls_flags,'bulkflags=',',')
ls_contractno=f_maintain_s(ls_flags,'contractno=',',')
ls_movenos=f_maintain_s(ls_flags,'movenos=',',')
ls_chflags=f_maintain_s(ls_flags,'chflags=',',')
ls_odno=f_maintain_s(ls_flags,'odno=',',')
ls_preindate=f_maintain_s(ls_flags,'preindate=',',')
ls_calcprice=f_maintain_s(ls_flags,'calcprice=',';')

if ls_bulkflags='' then 
	l_bulkflags=0
else
	l_bulkflags=long(ls_bulkflags)
end if

if ls_datatable='cnfnodb' and ls_datanos<>''  then
	if ls_outcusno='' then 
		select max(cusno) into :ls_outcusno from cnfnod where nos=:ls_datanos;
		if sqlca.sqlcode=-1 then goto e
	end if
end if

//li_cwflags=f_zg_cwflags(ls_incusno,ls_outcusno,l_kinds11_ref)
//if li_cwflags=-1 then
//	ls_errtext="计算区间失败!"
//	goto m
//end if

if string(ls_outcusno,'')='' then 
	ls_errtext="供应商不能为空!"
	goto e
end if

ls_newnos = f_zg_nos(ls_outcusno,1,'make',g_stanos) 
if ls_newnos = '-1' then
	/*记录失败店家*/
	ls_errtext='单号无效:'+ls_newnos
	goto m
end if

select isnull(max(ckpers),1) into :ld_per
from zgck_acc
where ckaccno=:ls_incusno;

if sqlca.sqlcode = -1 then goto e

ls_ret=f_maintain('tax_val','decimals')
ldec_tax_val=dec(ls_ret)
				
//表头
insert into ma(cusno,ckaccno,nos,outdate,per,nb,now,now_real,now_cost,rmark,gxrq,zdr,
							flags,stanos,chflags,olddate,kinds1,cwchflags,bulkflags,bz,nos3,contractno,odno,movenos,
							endflags,taxratio)
values(:ls_outcusno,:ls_incusno,:ls_newnos,:ls_outdate,:ld_per,0,0,0,0,'0',getdate(),:personcode,
						1,:g_stanos,'0',:ls_outdate,1/*合同入库*/ ,'0',:l_bulkflags,:ls_bz,'',:ls_contractno,:ls_odno,:ls_movenos,
						'0',:ldec_tax_val);


if sqlca.sqlcode = -1 then goto e
if ls_preindate<>'' then 
	insert into nos_insuref(nos,tablename,outdate,outcusno,incusno,ckaccno,preindate,yhid,gxrq)
	select :ls_newnos,'make',:ls_outdate,:ls_outcusno,:ls_incusno,:ls_incusno,:ls_preindate,:personcode,getdate();
	
	if sqlca.sqlcode = -1 then goto e
	
end if

if ls_datatable='cnfnodb' and ls_datanos<>'' then
	
	insert into make(nos,nos_rec,colthno,color,xh,xhnb,odnb,outnb,nb,price,pers,endprice)
	select :ls_newnos,t1.nos_rec,t1.colthno,t1.color,t1.xh,t1.xhnb,t1.nb,t1.nb,t1.nb,t1.price,t1.pers,t1.endprice
	from cnfnodb t1
	where t1.nos=:ls_datanos and t1.nb<>0;
	
	if sqlca.sqlcode=-1 then goto e

end if

if ls_gprice='1' then 
	
	update make
	set price=t2.sprice
	from make t1,coloth t2
	where t1.nos=:ls_newnos and t2.colthno=t1.colthno and t2.color_nos=t1.color and isnull(t1.price,0)=0;
	
	if sqlca.sqlcode=-1 then goto e
	
	update make
	set endprice=t2.gprice
	from make t1,coloth_t t2
	where t1.nos=:ls_newnos and t2.colthno=t1.colthno;
	
	if sqlca.sqlcode=-1 then goto e
	
	update make
	set pers=case when isnull(price,0) = 0 then 0 when round(endprice / price,4)>=10 then 9.9999 else round(endprice / price,4) end
	where nos=:ls_newnos;
	
	if sqlca.sqlcode=-1 then goto e
	
elseif ls_sprice='1' then
	
	update make
	set price=t2.sprice,pers=1,endprice=t2.sprice
	from make t1,coloth t2
	where t1.nos=:ls_newnos and t2.colthno=t1.colthno and t2.color_nos=t1.color;
	
	if sqlca.sqlcode=-1 then goto e
	
end if

//if ls_calcprice='1' then 
//
//	insert into make(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice)
//	select :ls_newnos,t1.nos_rec,t1.colthno,t1.color,t1.xh,1,t1.nb,t1.nb,t3.sprice,1,t3.sprice * :ld_per
//	from zg_nosb_temp t1,coloth_easy t3
//	where t1.recno=:g_recno2 and t1.nb<>0 and t3.colthno=t1.colthno and t3.color_nos=t1.color;
//	
//	if sqlca.sqlcode = -1 then goto e
//	
//	update make
//	set pers=case when isnull(price,0) = 0 then 0 when round(endprice / price,4)>=10 then 9.9999 else round(endprice / price,4) end
//	where nos=:ls_newnos;
//	
//	if sqlca.sqlcode = -1 then goto e
//	
//	li_ret=f_zg_nos_endprice(ls_newnos,'make','')
//	if li_ret=-1 then 
//		ls_errtext='计算价格失败!'
//		goto m
//	end if
//else
//	insert into make(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice)
//	select :ls_newnos,t1.nos_rec,t1.colthno,t1.color,t1.xh,1,t1.nb,t1.nb,t1.now,1,t1.now_real
//	from make1 t1
//	where t1.nos=:g_recno2 and t1.nb<>0;
//	
//	if sqlca.sqlcode = -1 then goto e
//	
//end if

//函数复杂,可能报错并rollback
//f_zg_bznos(gdw_emp,'nos='+ls_newnos+';ma')

//过账
li_ret=f_make(ls_newnos,1,1)
if li_ret=-1 then
	ls_errtext='新单据过账失败!'
	goto m
end if

if ls_chflags='1' then 
	//过账
	li_ret=f_make(ls_newnos,-1,1)
	if li_ret=-1 then
		ls_errtext='新单据确认_反过账失败!'
		goto m
	end if
	
	update ma
	set chflags=:ls_chflags,gxrq=getdate(),zdr=:personcode
	where nos=:ls_newnos;
	
	//过账
	li_ret=f_make(ls_newnos,1,1)
	if li_ret=-1 then
		ls_errtext='新单据确认_过账失败!'
		goto m
	end if

end if

//发送
li_ret=f_zg_txinfo_nos('ma',ls_newnos,g_dbstatus,'')
if li_ret= -1 then 
	ls_errtext="新单据发送失败!"
	goto m
end if

if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_newnos
return '1'

goto m
m:
if sqlca.sqlcode=-1 then goto e
rollback;
if sqlca.sqlcode=-1 then goto e
if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_errtext //+' '+ls_outcusno+'-->'+ls_incusno
return '0'

goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext+'~r~n'
if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_errtext //+' '+ls_outcusno+'-->'+ls_incusno
return '-1'
end function

public function string uf_tort (string ls_flags, ref string ls_ref);string ls_msgtitle,ls_errtext
boolean lb_wait

string ls_maintable,ls_insuref,ls_newnos,ls_datatable,ls_datanos,ls_datawhere,ls_txinfo
string ls_movenos,ls_gprice,ls_sprice,ls_sql,ls_nos3
string ls_outcusno,ls_incusno,ls_outdate,ls_calcprice,ls_bulkflags,ls_rtpnos,ls_chflags,ls_indbno,ls_bz
long l_kinds11_ref,l_bulkflags
int li_cwflags,li_ret
dec ld_per

lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent

ls_maintable='rt'
ls_insuref='h2ort'

ls_outcusno=f_maintain_s(ls_flags,'outcusno=',';') //;
ls_incusno=f_maintain_s(ls_flags,'incusno=',';') //;
ls_txinfo=f_maintain_s(ls_flags,'txinfo=',';') //;

ls_datatable=f_maintain_s(ls_flags,'datatable=',',')
ls_datanos=f_maintain_s(ls_flags,'datanos=',',')
ls_datawhere=f_maintain_s(ls_flags,'datawhere=',',')


if ls_datatable='' then 
	ls_errtext='源数据表不能为空!'
	goto m
end if

//if ls_datanos='' then 
//	ls_errtext='源单号不能为空!'
//	goto m
//end if

ls_bulkflags=f_maintain_s(ls_flags,'bulkflags=',',')
ls_chflags=f_maintain_s(ls_flags,'chflags=',',')
//ls_indbno=f_maintain_s(ls_flags,'indbno=',',')
//ls_movenos=f_maintain_s(ls_flags,'movenos=',',')
ls_nos3=f_maintain_s(ls_flags,'nos3=',',')
ls_outdate=f_maintain_s(ls_flags,'outdate=',',') //
if ls_outdate='' then 
	ls_outdate=string(today(),'YYYYMMDD')
else
	if ls_outdate<>string(date(string(ls_outdate,'@@@@-@@-@@')),'YYYYMMDD') then 
		ls_errtext='日期无效:'+ls_outdate
		goto m
	end if	
end if

//ls_calcprice=f_maintain_s(ls_flags,'calcprice=',';')
ls_bz=ls_flags

//结账日控制
ls_errtext=uf_outdate_control('cusno='+ls_outcusno+';outdate='+ls_outdate+';')
if ls_errtext<>'' then goto e
if ls_chflags='1' then 
	ls_errtext=uf_outdate_control('cusno='+ls_incusno+';outdate='+ls_outdate+';')
	if ls_errtext<>'' then goto e
end if

if ls_bulkflags='' then 
	l_bulkflags=0
else
	l_bulkflags=long(ls_bulkflags)
end if

ls_newnos = f_zg_nos(ls_outcusno,1,'h2ort',g_stanos) 
if ls_newnos = '-1' then
	/*记录失败店家*/
	ls_errtext='单号无效:'+ls_newnos
	goto m
end if

//select isnull(max(ckpers),1) into :ld_per
//from zgck_acc
//where ckaccno=:ls_incusno;
//
//if sqlca.sqlcode = -1 then goto e
				
//表头
insert into rt(cusno,olddate,outdate,per,salescode,nos3,bz,ckaccno,
				kinds1, price_kind, nos,zdr, sanos,flags, stanos, gxrq,chflags,kinds3,bulkflags)
select :ls_outcusno,:ls_outdate,:ls_outdate,per,'',:ls_nos3,:ls_bz,:ls_incusno,//w_u2_sendreceive.i_ckaccno
	kinds1,1,:ls_newnos,:personcode,'',0,:g_stanos,getdate(),'0',0,:l_bulkflags /*网销类型才可以直接出货*/
from db 
where dbno = :ls_outcusno;

if sqlca.sqlcode = -1 then goto e

ls_sql="insert into h2ort(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice) &
	select '"+ls_newnos+"',nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice &
	from "+ls_datatable+" "
	if ls_datawhere<>'' then ls_sql+=" where "+ls_datawhere
execute immediate :ls_sql;
if sqlca.sqlcode=-1 then goto e

//if ls_gprice='1' then 
//	
//	update h2ort
//	set price=t2.sprice
//	from h2ort t1,coloth t2
//	where t1.nos=:ls_newnos and t2.colthno=t1.colthno and t2.color_nos=t1.color and isnull(t1.price,0)=0;
//	
//	if sqlca.sqlcode=-1 then goto e
//	
//	update h2ort
//	set endprice=t2.gprice
//	from h2ort t1,coloth_t t2
//	where t1.nos=:ls_newnos and t2.colthno=t1.colthno;
//	
//	if sqlca.sqlcode=-1 then goto e
//	
//	update h2ort
//	set pers=case when isnull(price,0) = 0 then 0 when round(endprice / price,4)>=10 then 9.9999 else round(endprice / price,4) end
//	where nos=:ls_newnos;
//	
//	if sqlca.sqlcode=-1 then goto e
//	
//elseif ls_sprice='1' then
//	
//	update h2ort
//	set price=t2.sprice,pers=1,endprice=t2.sprice
//	from h2ort t1,coloth t2
//	where t1.nos=:ls_newnos and t2.colthno=t1.colthno and t2.color_nos=t1.color;
//	
//	if sqlca.sqlcode=-1 then goto e
//	
//end if

//if ls_calcprice='1' then 
//
//	insert into h2ort(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice)
//	select :ls_newnos,t1.nos_rec,t1.colthno,t1.color,t1.xh,1,t1.nb,t1.nb,t3.sprice,1,t3.sprice * :ld_per
//	from zg_nosb_temp t1,coloth_easy t3
//	where t1.recno=:g_recno2 and t1.nb<>0 and t3.colthno=t1.colthno and t3.color_nos=t1.color;
//	
//	if sqlca.sqlcode = -1 then goto e
//	
//	update h2ort
//	set pers=case when isnull(price,0) = 0 then 0 when round(endprice / price,4)>=10 then 9.9999 else round(endprice / price,4) end
//	where nos=:ls_newnos;
//	
//	if sqlca.sqlcode = -1 then goto e
//	
//	li_ret=f_zg_nos_endprice(ls_newnos,'h2ort','')
//	if li_ret=-1 then 
//		ls_errtext='计算价格失败!'
//		goto m
//	end if
//else
//	insert into h2ort(nos,nos_rec,colthno,color,xh,xhnb,outnb,nb,price,pers,endprice)
//	select :ls_newnos,t1.nos_rec,t1.colthno,t1.color,t1.xh,1,t1.nb,t1.nb,t1.now,1,t1.now_real
//	from h2ort1 t1
//	where t1.nos=:g_recno2 and t1.nb<>0;
//	
//	if sqlca.sqlcode = -1 then goto e
//	
//end if

//过账
li_ret=f_h2ort(ls_newnos,1,1)
if li_ret=-1 then
	ls_errtext='新单据过账失败!'
	goto m
end if

if ls_chflags='1' then 
	//过账
	li_ret=f_h2ort(ls_newnos,-1,1)
	if li_ret=-1 then
		ls_errtext='退仓单确认_反过账失败!'
		goto m
	end if
	
	update rt
	set chflags=:ls_chflags,gxrq=getdate(),zdr=:personcode
	where nos=:ls_newnos;
	
	//过账
	li_ret=f_h2ort(ls_newnos,1,1)
	if li_ret=-1 then
		ls_errtext='退仓单确认_过账失败!'
		goto m
	end if
end if

if ls_txinfo='0' then 
	//不发送
else
	//发送
	li_ret=f_zg_txinfo_nos('rt',ls_newnos,g_dbstatus,'')
	if li_ret= -1 then 
		ls_errtext="退仓单发送失败!"
		goto m
	end if
end if

if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_newnos
return '1'

goto m
m:
if sqlca.sqlcode=-1 then goto e
rollback;
if sqlca.sqlcode=-1 then goto e
if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_errtext //+' '+ls_outcusno+'-->'+ls_incusno
return '0'

goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
rollback;
if sqlca.sqlcode=-1 then ls_errtext+='Rollback:'+sqlca.sqlerrtext+'~r~n'
if lb_wait=false and isvalid(w_wait) then close(w_wait)
ls_ref=ls_errtext //+' '+ls_outcusno+'-->'+ls_incusno
return '-1'
end function

public function string uf_outdate_control (string ls_flags);string ls_ref
return uf_outdate_control(ls_flags,ref ls_ref)
end function

public function string iif (boolean lb_expression, string ls_truevalue, string ls_falsevalue);
	if lb_expression then return ls_truevalue
	return ls_falsevalue

end function

public function string uf_outdate_control (string ls_flags, ref string ls_jzdate_max);string ls_msgtitle,ls_errtext,ls_msgbox='1'
boolean lb_wait
lb_wait=isvalid(w_wait)
PopulateError(0, '');ls_msgtitle=error.object+'.'+error.objectevent
string ls_cwdate,ls_dbdate,ls_outdate,ls_cusno

ls_cusno=f_maintain_s(ls_flags,'cusno=',';')
ls_outdate=f_maintain_s(ls_flags,'outdate=',';')

select max(cwdate),max(dbdate) into :ls_cwdate,:ls_dbdate
from zg_jzdate ;
if sqlca.sqlcode=-1 then goto e

ls_cwdate=string(ls_cwdate,'')
ls_dbdate=string(ls_dbdate,'')

ls_jzdate_max=ls_cwdate
if(ls_dbdate>ls_jzdate_max) then ls_jzdate_max=ls_dbdate

//if ls_outdate<=ls_cwdate then 
//	ls_errtext=f_wl('财务已结帐')+' '+ls_cwdate
//	goto e
//end if
//
//if ls_outdate<=ls_dbdate then 
//	ls_errtext=f_wl('分销已结帐')+' '+ls_dbdate
//	goto e
//end if

long l_count
string ls_tbtime
//结账日检查
select count(*),max(convert(char(8),tbtime,112)) 
into :l_count,:ls_tbtime
from zg_pos_control 
where conclass=1 and dbno=:ls_cusno 
	and (convert(char(8),tbtime,112)>=:ls_outdate) and conflags in(1,2);
if sqlca.sqlcode=-1 then goto e

if(ls_tbtime>ls_jzdate_max) then ls_jzdate_max=ls_tbtime

//if l_count>0 then 
//	ls_errtext=f_wl('单位已结帐')+' '+ls_cusno+' '+ls_outdate
//	goto e
//end if

string ls_jzdate
select max(t3.jzdate) into :ls_jzdate
from dbck t1,coloth_bcost_ck t2,zg_jzdateb t3
where t1.cusno=:ls_cusno and t2.ckaccnomx=t1.mainckaccno and t3.cusno=t2.ckaccno;

if sqlca.sqlcode=-1 then goto e
ls_jzdate=string(ls_jzdate,'')
if(ls_jzdate>ls_jzdate_max) then ls_jzdate_max=ls_jzdate

//if ls_jzdate>=ls_outdate then 
//	ls_errtext=f_wl('套账已结账')+' '+ls_cusno+' '+ls_outdate
//	goto e
//end if

if ls_jzdate_max>=ls_outdate then 
	ls_errtext=f_wl('指定日期已结账')+' '+ls_cusno+' '+ls_outdate
	goto e
end if

return ''

goto e
e:
if sqlca.sqlcode=-1 then ls_errtext+=sqlca.sqlerrtext+'~r~n'
if lb_wait=false and isvalid(w_wait) then close(w_wait)
if ls_errtext<>'' then ls_errtext='结账日检查:'+ls_errtext
return ls_errtext
end function

on u_runsa_derek_rollout.create
call super::create
this.iu_fun=create iu_fun
TriggerEvent( this, "constructor" )
end on

on u_runsa_derek_rollout.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.iu_fun)
end on

type iu_fun from u_derek_v2_fun within u_runsa_derek_rollout descriptor "pb_nvo" = "true" 
end type

on iu_fun.create
call super::create
end on

on iu_fun.destroy
call super::destroy
end on

