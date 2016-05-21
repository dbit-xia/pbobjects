$PBExportHeader$u_runsa_derek_lc.sru
forward
global type u_runsa_derek_lc from nonvisualobject
end type
end forward

global type u_runsa_derek_lc from nonvisualobject autoinstantiate
end type

type variables
string gs_country='6710'
u_runsa_derek u_derek
u_derek_fun u_fun
boolean ib_wait
end variables

forward prototypes
public function integer uf_goods_add ()
public function integer uf_stores_add ()
public function string uf_stock_calc (string as_cusno, string as_outdate, string as_nos)
public function string uf_getlistsql (string as_tablename)
public function string uf_gnos (string as_tablename, string as_tableflags, string as_cusno)
public function string uf_upgrade_sql ()
public subroutine uf_upgrade_db ()
public function integer uf_select_store (string as_sql)
end prototypes

public function integer uf_goods_add ();string ls_errtext

delete from lc_goods_add 
where not exists(select 1 from vw_goods t2 where lc_goods_add.Material=t2.Material);

if sqlca.sqlcode=-1 then goto e

insert into lc_goods_add(Material,flags,flags2,flags3,gxrq,gxrq2)
select Material,0,1,1,'1900-01-01','1900-01-01'
from vw_goods t1
where not exists(select 1 from lc_goods_add t2 where t1.Material=t2.Material);

if sqlca.sqlcode=-1 then goto e
commit;

return 1

e:

if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	rollback;
end if
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
return -1
end function

public function integer uf_stores_add ();string ls_errtext

delete from lc_stores_add 
where not exists(select 1 from vw_stores t2 where t2.warehouseid=:gs_country and lc_stores_add.storeid=t2.storeid);

if sqlca.sqlcode=-1 then goto e

insert into lc_stores_add(storeid,gxrq)
select storeid,'1900-01-01' 
from vw_stores t1
where t1.warehouseid=:gs_country and not exists(select 1 from lc_stores_add t2 where t1.storeid=t2.storeid);

if sqlca.sqlcode=-1 then goto e
commit;

return 1

e:

if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	rollback;
end if
if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
return -1
end function

public function string uf_stock_calc (string as_cusno, string as_outdate, string as_nos);//临时表zg_coloth_f_rnb_temp,easytemp 

long l_count
string ls_errtext
string ls_maxstockdate

//日期格式处理
//ls_outdate2=string(as_outdate,'@@@@@@@@')

delete from zg_coloth_f_rnb_temp where recno=:g_recno;
if sqlca.sqlcode=-1 then goto e
commit;

delete from easytemp where recno=:g_recno;
if sqlca.sqlcode=-1 then goto e
commit;

//是否选择产品
select count(1) into :l_count
from coloth_select2 where recno=:g_recno;

if sqlca.sqlcode=-1 then goto e

select convert(varchar,max(t2.inv_date),112) 
into :ls_maxstockdate
from vw_lc_stock t2
where (t2.warehouseid=:as_cusno or :as_cusno='' ) 
			and convert(varchar,t2.inv_date,112)<=:as_outdate;
			

////查询最大库存日
//if l_count>0 then 
//	
//	//仓库,货号,最大库存日
//	insert into zg_coloth_f_rnb_temp(recno,ckaccno,colthno,color)
//	select :g_recno,t2.material,t2.warehouseid,convert(varchar,max(t2.inv_date),112)
//	from coloth_select2 t1,vw_lc_stock t2
//	where t1.recno=:g_recno and (t2.warehouseid=:as_cusno or :as_cusno='' ) 
//			and t2.inv_date<=:ls_outdate2 and t2.material=t1.colthno 
//	group by t2.material,t2.warehouseid;
//
//else
//	
//	insert into zg_coloth_f_rnb_temp(recno,ckaccno,colthno,color)
//	select :g_recno,t2.material,t2.warehouseid,convert(varchar,max(t2.inv_date),112)
//	from vw_lc_stock t2
//	where (t2.warehouseid=:as_cusno or :as_cusno='')
//			and t2.inv_date<=:ls_outdate2 
//	group by t2.material,t2.warehouseid;
//	
//end if
//
//if sqlca.sqlcode=-1 then goto e
//commit;

////查询最新库存日对应的库存
//update zg_coloth_f_rnb_temp
//set rnb=t2.dc_inv_qty
//from vw_lc_stock t2
//where zg_coloth_f_rnb_temp.recno=:g_recno and t2.material=zg_coloth_f_rnb_temp.colthno and t2.warehouseid=zg_coloth_f_rnb_temp.ckaccno;
//
//if sqlca.sqlcode=-1 then goto e
//commit;


//查询最新库存信息

if l_count>0 then 
	
	insert into zg_coloth_f_rnb_temp(recno,colthno,ckaccno,rnb)
	select :g_recno,t2.material,t2.warehouseid,t2.dc_inv_qty
	from coloth_select2 t0,vw_lc_stock t2
	where t0.recno=:g_recno and (t2.warehouseid=:as_cusno or :as_cusno='' ) 
		and convert(varchar,t2.inv_date,112)=:ls_maxstockdate and t2.material=t0.colthno;
	
	if sqlca.sqlcode=-1 then goto e
	commit;
	
	//查询A-PACK数量总数
	insert into easytemp(recno,dbno,colthno,daynum)
	select :g_recno,plant,material,sum(nb)
		from(
			//apack by site
			select t1.plant as 'plant',t2.material as 'material',t2.nb as 'nb'
			from coloth_select2 t0,lc_apack t1,lc_apack_b t2
			where t0.recno=:g_recno 	and (t1.plant=:as_cusno or :as_cusno='') and  t1.outdate>=:ls_maxstockdate and t1.outdate<=:as_outdate and t1.nos<>:as_nos and t1.packflags=2 and t1.approflags=2
					and t2.nos=t1.nos and t2.material=t0.colthno
			union all
			//apack by demo
			select t1.plant,t2.material,t2.nb
			from coloth_select2 t0,lc_apack t1,lc_apack_b t2,lc_apack_c t3
			where t0.recno=:g_recno 	and (t1.plant=:as_cusno or :as_cusno='') and  t1.outdate>=:ls_maxstockdate and t1.outdate<=:as_outdate and t1.nos<>:as_nos and t1.packflags=1 and t1.approflags=2
					and t2.nos=t1.nos and t2.material=t0.colthno 
					and t3.nos=t1.nos and t3.gno=t2.gno 
					) as #tmp
		group by plant,material;
		
else
	
	insert into zg_coloth_f_rnb_temp(recno,colthno,ckaccno,rnb)
	select :g_recno,t2.material,t2.warehouseid,t2.dc_inv_qty
	from vw_lc_stock t2
	where (t2.warehouseid=:as_cusno or :as_cusno='')
			and convert(varchar,t2.inv_date,112)=:ls_maxstockdate;
	
	if sqlca.sqlcode=-1 then goto e
	commit;
	
	//查询A-PACK数量总数
	insert into easytemp(recno,dbno,colthno,daynum)
	select :g_recno,t1.plant,t2.material,sum(t2.nb)
	from lc_apack t1,lc_apack_b t2
	where (t1.plant=:as_cusno or :as_cusno='') and  t1.outdate>=:ls_maxstockdate and t1.outdate<=:as_outdate  and t1.nos<>:as_nos and t1.approflags=2
			and t2.nos=t1.nos
	group by t1.plant,t2.material;
	
end if
		
if sqlca.sqlcode=-1 then goto e
commit;

update zg_coloth_f_rnb_temp
set rnb=rnb - t2.daynum
from zg_coloth_f_rnb_temp t1,easytemp t2
where t1.recno=:g_recno and t2.recno=:g_recno and t1.ckaccno=t2.dbno and t2.colthno=t1.colthno;

if sqlca.sqlcode=-1 then goto e
commit;

return ''

e:
if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	rollback;
end if
//if ls_errtext<>'' then f_messagebox('',ls_errtext,0,0)
return ls_errtext

end function

public function string uf_getlistsql (string as_tablename);string ls_sql
as_tablename=lower(as_tablename)

choose case as_tablename
	case "mcat2"  
		ls_sql="SELECT 'Frames' as 'names','A' as 'codes' &
					union all SELECT 'Sunglasesses','G' "
	case "dc"
		ls_sql="select 'China' as 'names',6710 as 'codes' "
//		ls_sql="select causename as 'names',codes as 'codes' from rt_cause where tablename='lc_plant' "
end choose

return ls_sql
		
end function

public function string uf_gnos (string as_tablename, string as_tableflags, string as_cusno);//生成指定表名,列名,店仓名的单号
//参数:as_tablename	单号从表中生成
//as_tableflags	一表多种单据时的值
//as_cusno	店仓代号

string l_cusnoold,l_head_s,l_head_e,l_tps,l_head,l_nos

if f_wgz_lock('exc,'+as_tablename,sqlca)=-1 then 
	rollback;
	f_messagebox('','表未锁住'+','+'请重试',0,0)
	close(w_wait)
	return '-1'
end if 
if as_cusno<>'' then
	l_cusnoold=as_cusno
else
	l_cusnoold='000'+g_stanos
end if

setnull(l_tps)
choose case as_tablename
	case 'lc_dplan'	//delivery plan 单号
		l_head=as_cusno+'DP'	//没有单号时用
		select max(nos) into :l_tps from lc_dplan where plant=:as_cusno;
	case 'lc_apack'	//delivery plan 单号
		l_head=as_cusno+'AP'	//没有单号时用
		select max(nos) into :l_tps from lc_apack where plant=:as_cusno;
	case 'lc_asso_fd'	//delivery plan 单号
		l_head=as_cusno+'FD'	//没有单号时用
		select max(nos) into :l_tps from lc_asso_plan where plant=:as_cusno and mc2='A' and kinds1=1;
	case 'lc_asso_fs'	//delivery plan 单号
		l_head=as_cusno+'FS'	//没有单号时用
		select max(nos) into :l_tps from lc_asso_plan where plant=:as_cusno and mc2='A' and kinds1=2;
	case 'lc_asso_sd'	//delivery plan 单号
		l_head=as_cusno+'SD'	//没有单号时用
		select max(nos) into :l_tps from lc_asso_plan where plant=:as_cusno and mc2='G' and kinds1=1;
	case 'lc_asso_ss'	//delivery plan 单号
		l_head=as_cusno+'SS'	//没有单号时用
		select max(nos) into :l_tps from lc_asso_plan where plant=:as_cusno and mc2='G' and kinds1=2;
	case 'lc_asso_unite'	//delivery plan 单号
		l_head=as_cusno+'CP'	//没有单号时用
		select max(nos) into :l_tps from lc_asso_unite where plant=:as_cusno;
	case else
		l_nos='-1'
		goto e
end choose

if isnull(l_tps) then
	l_nos=l_head+'0001'
else
	l_nos=f_countplus1(l_tps,4)
end if

e:
return l_nos
end function

public function string uf_upgrade_sql ();string ls_sql
ls_sql="use lsd~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_stores_add]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_stores_add](~r~n&
	[storeid] [char](4) NOT NULL,~r~n&
	[gno] [varchar](20) NULL,~r~n&
	[yhid] [varchar](20) NULL,~r~n&
	[gxrq] [datetime] NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_goods_add]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_goods_add](~r~n&
	[Material] [varchar](20) NOT NULL,~r~n&
	[plant] [varchar](20) NULL,~r~n&
	[cnfnno] [varchar](20) NULL,~r~n&
	[flags] [int] NULL,~r~n&
	[flags2] [int] NULL,~r~n&
	[flags3] [int] NULL,~r~n&
	[status] [int] NULL,~r~n&
	[yhid] [varchar](20) NULL,~r~n&
	[gxrq] [datetime] NULL,~r~n&
	[yhid2] [varchar](20) NULL,~r~n&
	[gxrq2] [datetime] NULL,~r~n&
 CONSTRAINT [PK_lc_goods_add] PRIMARY KEY CLUSTERED ~r~n&
(~r~n&
	[Material] ASC~r~n&
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_dplan_b]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_dplan_b](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[Material] [varchar](20) NOT NULL,~r~n&
	[flags] [int] NULL,~r~n&
	[bz] [varchar](50) NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_dplan]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_dplan](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[outdate] [varchar](8) NULL,~r~n&
	[plant] [varchar](30) NULL,~r~n&
	[mc2] [varchar](20) NULL,~r~n&
	[nb] [int] NULL,~r~n&
	[approflags] [int] NULL,~r~n&
	[markflags] [varchar](100) NULL,~r~n&
	[yhid] [varchar](20) NULL,~r~n&
	[gxrq] [datetime] NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_brd_select]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_brd_select](~r~n&
	[recno] [int] NULL,~r~n&
	[codes] [varchar](30) NULL,~r~n&
	[names] [varchar](50) NULL,~r~n&
	[mc2_nm] [varchar](50) NULL,~r~n&
	[class] [varchar](50) NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_brd_mapping]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_brd_mapping](~r~n&
	[plant] [varchar](30) NOT NULL,~r~n&
	[mt_group] [char](5) NOT NULL,~r~n&
	[gno] [varchar](20) NOT NULL,~r~n&
	[nb] [int] NULL,~r~n&
	[yhid] [varchar](20) NULL,~r~n&
	[gxrq] [datetime] NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_asso_unite_b]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_asso_unite_b](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[material] [varchar](20) NOT NULL,~r~n&
	[cusno] [varchar](20) NOT NULL,~r~n&
	[nb] [int] NULL,~r~n&
 CONSTRAINT [PK_lc_asso_unite_b] PRIMARY KEY CLUSTERED ~r~n&
(~r~n&
	[nos] ASC,~r~n&
	[material] ASC,~r~n&
	[cusno] ASC~r~n&
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_asso_unite]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_asso_unite](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[outdate] [varchar](10) NULL,~r~n&
	[plant] [varchar](30) NULL,~r~n&
	[nos_fd] [varchar](20) NULL,~r~n&
	[nos_fs] [varchar](20) NULL,~r~n&
	[nos_sd] [varchar](20) NULL,~r~n&
	[nos_ss] [varchar](20) NULL,~r~n&
	[expflags] [int] NULL,~r~n&
	[yhid] [varchar](20) NULL,~r~n&
	[gxrq] [datetime] NULL,~r~n&
 CONSTRAINT [PK_lc_asso_unite] PRIMARY KEY CLUSTERED ~r~n&
(~r~n&
	[nos] ASC~r~n&
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_asso_plan_c]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_asso_plan_c](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[material] [varchar](20) NULL,~r~n&
	[cusno] [varchar](20) NOT NULL,~r~n&
	[gno] [varchar](20) NULL,~r~n&
	[nb] [int] NULL,~r~n&
	[expflags] [int] NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_asso_plan_b]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_asso_plan_b](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[material] [varchar](20) NOT NULL,~r~n&
	[gno] [varchar](20) NOT NULL,~r~n&
	[nb] [int] NULL,~r~n&
	[expflags] [int] NULL,~r~n&
 CONSTRAINT [PK_lc_asso_plan_b] PRIMARY KEY CLUSTERED ~r~n&
(~r~n&
	[nos] ASC,~r~n&
	[material] ASC,~r~n&
	[gno] ASC~r~n&
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_asso_plan]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_asso_plan](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[outdate] [char](8) NULL,~r~n&
	[plant] [varchar](30) NULL,~r~n&
	[mc2] [varchar](20) NULL,~r~n&
	[kinds1] [smallint] NULL,~r~n&
	[approflags] [int] NULL,~r~n&
	[sal_sdate] [varchar](10) NULL,~r~n&
	[sal_edate] [varchar](10) NULL,~r~n&
	[flags1] [smallint] NULL,~r~n&
	[flags2] [smallint] NULL,~r~n&
	[bz] [varchar](100) NULL,~r~n&
	[yhid] [varchar](20) NULL,~r~n&
	[gxrq] [datetime] NULL,~r~n&
 CONSTRAINT [PK_lc_asso_plan] PRIMARY KEY CLUSTERED ~r~n&
(~r~n&
	[nos] ASC~r~n&
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_apack_d]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_apack_d](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[cusno] [varchar](20) NOT NULL,~r~n&
	[gno] [varchar](20) NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_apack_c]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_apack_c](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[material] [varchar](20) NULL,~r~n&
	[cusno] [varchar](20) NOT NULL,~r~n&
	[gno] [varchar](20) NULL,~r~n&
	[nb] [int] NULL,~r~n&
	[expflags] [int] NULL~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_apack_b]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_apack_b](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[material] [varchar](20) NOT NULL,~r~n&
	[gno] [varchar](20) NOT NULL,~r~n&
	[nb] [int] NULL,~r~n&
	[expflags] [int] NULL,~r~n&
 CONSTRAINT [PK_lc_apack_b] PRIMARY KEY CLUSTERED ~r~n&
(~r~n&
	[nos] ASC,~r~n&
	[material] ASC,~r~n&
	[gno] ASC~r~n&
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  Table [dbo].[lc_apack]    Script Date: 12/10/2011 10:27:52 ******/~r~n&
CREATE TABLE [dbo].[lc_apack](~r~n&
	[nos] [varchar](20) NOT NULL,~r~n&
	[outdate] [char](8) NULL,~r~n&
	[plant] [varchar](30) NULL,~r~n&
	[nos_dp] [varchar](20) NULL,~r~n&
	[mc2] [varchar](20) NULL,~r~n&
	[packflags] [smallint] NULL,~r~n&
	[approflags] [int] NULL,~r~n&
	[markflags] [varchar](100) NULL,~r~n&
	[yhid] [varchar](20) NULL,~r~n&
	[gxrq] [datetime] NULL,~r~n&
 CONSTRAINT [PK_lc_apack] PRIMARY KEY CLUSTERED ~r~n&
(~r~n&
	[nos] ASC~r~n&
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]~r~n&
) ON [PRIMARY]~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_dim_time]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
create view [dbo].[vw_dim_time]~r~n&
as~r~n&
select * from luxottica..dim_time~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_brd_price_map]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
CREATE view [dbo].[vw_brd_price_map]~r~n&
as~r~n&
select ~r~n&
* from luxottica..dim_pro_brd_price_map~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_dim_pro_brd_MC2_map]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
create view [dbo].[vw_dim_pro_brd_MC2_map]~r~n&
as ~r~n&
select * from luxottica..dim_pro_brd_MC2_map~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_brand_info]    Script Date: 12/10/2011 10:27:55 ******/~r~n&
CREATE view [dbo].[vw_brand_info]~r~n&
as~r~n&
select ~r~n&
* from luxottica..dim_pro_brand_info~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_price_band]    Script Date: 12/10/2011 10:27:57 ******/~r~n&
create view [dbo].[vw_price_band]~r~n&
as~r~n&
select * from luxottica..dim_pro_price_band~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_stores]    Script Date: 12/10/2011 10:27:57 ******/~r~n&
CREATE view [dbo].[vw_stores]~r~n&
as SELECT t1.*~r~n&
  FROM [luxottica].[dbo].[dim_store_info] t1~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_lc_stock]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
/****** Script for SelectTopNRows command from SSMS  ******/~r~n&
create view [dbo].[vw_lc_stock]~r~n&
as~r~n&
SELECT *~r~n&
  FROM [luxottica].[dbo].[fac_day_inv_Warehouse]~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_group_db]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
CREATE view [dbo].[vw_group_db]~r~n&
as~r~n&
select codes as gno,stanos,causename as gname,yhid,gxrq,tablename,bz,bz6 as 'status',bz7 as 'sorts',bz1,bz2,bz3,bz4,bz5,bz8,bz9,bz10~r~n&
from rt_cause~r~n&
where tablename='lc_group_db'~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_goods]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
CREATE view [dbo].[vw_goods]~r~n&
as~r~n&
SELECT *~r~n&
  FROM [luxottica].[dbo].[dim_pro_art_info]~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_fac_wk_sal_cwu_atc]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
CREATE view [dbo].[vw_fac_wk_sal_cwu_atc]~r~n&
as~r~n&
SELECT top 1000 StoreID,Week_Year,MC2,MT_Group,convert(varchar,convert(int,Material)) as 'Material',MTT~r~n&
	,cwu_sal_qty,cwu_sal_amt,cwu_sal_discount,Update_Date~r~n&
  FROM [luxottica].[dbo].[fac_wk_sal_cwu_atc]~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_fac_day_inv_Warehouse]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
/****** Script for SelectTopNRows command from SSMS  ******/~r~n&
create view [dbo].[vw_fac_day_inv_Warehouse]~r~n&
as~r~n&
SELECT *~r~n&
  FROM [luxottica].[dbo].[fac_day_inv_Warehouse]~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_fac_day_inv_store]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
create view  [dbo].[vw_fac_day_inv_store]~r~n&
as~r~n&
SELECT *~r~n&
  FROM [luxottica].[dbo].[fac_day_inv_store]~r~n&
GO~r~n&
/****** Object:  View [dbo].[vw_dim_time_wk]    Script Date: 12/10/2011 10:27:56 ******/~r~n&
/****** Script for SelectTopNRows command from SSMS  ******/~r~n&
CREATE view [dbo].[vw_dim_time_wk]~r~n&
as~r~n&
SELECT *~r~n&
  FROM luxottica.[dbo].[dim_time_wk]~r~n&
GO~r~n"

return ls_sql
end function

public subroutine uf_upgrade_db ();string ls_text,ls_errtext
long l_ret
int li_upb,i
string ls_sqls[]

u_derek.wait(1,'Get upgrade data')

l_ret=u_fun.readtxt(g_current_path+'\lc_upgrade.sql',ls_text)
if l_ret<=0 then 
	ls_text=uf_upgrade_sql()
end if
ls_sqls=u_fun.getsep(ls_text,"~r~nGO~r~n",0)
li_upb=upperbound(ls_sqls)
if li_upb>0 then 
	SQLCA.AutoCommit   =   TRUE
	for i=1 to li_upb
		u_derek.wait(100 * i / li_upb,ls_sqls[i])
		execute immediate :ls_sqls[i];
		if sqlca.sqlcode=-1 then 
			ls_errtext+=sqlca.sqlerrtext+"~r~n"
			f_wgz_errorlog('onlyfile'+sqlca.sqlerrtext)
		end if
	next
	SQLCA.AutoCommit   =   false
end if

if ls_errtext<>'' then 
	f_messagebox('',ls_errtext,0,0)
else
	f_messagebox('','Succeeded!',0,0)
end if

if ib_wait=false then u_derek.closewait()

end subroutine

public function integer uf_select_store (string as_sql);openwithparm(w_derek_select_store2,as_sql)
return message.DoubleParm
end function

on u_runsa_derek_lc.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_runsa_derek_lc.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

