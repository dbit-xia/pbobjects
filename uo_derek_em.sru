$PBExportHeader$uo_derek_em.sru
forward
global type uo_derek_em from editmask
end type
end forward

global type uo_derek_em from editmask
integer width = 457
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_ncpaint pbm_ncpaint
event ue_afteropen ( )
end type
global uo_derek_em uo_derek_em

type prototypes
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"

end prototypes

type variables
public string is_inifile_ctrl
window iw_parent
listbox ilb_add
boolean ib_initialized
//自适应大小处理
//等差
boolean xed,yed
boolean heighted,widthed

boolean xer,yer
boolean heighter,widther

private long x0,y0	//保存位置
private long width0,height0	//保存大小
private long il_parentwidth,il_parentheight	//保存父对象大小
private int i_resizetype	//1 为父对象resize,0 为自己resize

boolean ib_memory=true
end variables

forward prototypes
public function integer settext (string as_text)
public subroutine uf_savesize (integer ai_type)
end prototypes

event parentresize(long newwidth, long newheight);//父对象改变大小时,需要程序触发

long l_diffwidth,l_diffheight
dec ld_perwidth,ld_perheight

//父对象resize标记
i_resizetype=1

//等差
l_diffwidth=newwidth - il_parentwidth
l_diffheight=newheight - il_parentheight

if xed and yed then 
	move(x0+l_diffwidth,y0+l_diffheight)
elseif xed then 
	x=x0+l_diffwidth
elseif yed then 
	Y=y0+l_diffheight
end if

if widthed and heighted then 
	resize(width0+l_diffwidth,height0+l_diffheight)
elseif widthed then 
	width=width0+l_diffwidth
elseif heighted then 
	height=height0+l_diffheight
end if

//等比
if il_parentwidth=0 then 
	ld_perwidth=0
else
	ld_perwidth=newwidth / il_parentwidth
end if

if il_parentheight=0 then 
	ld_perheight=0
else
	ld_perheight=newheight / il_parentheight
end if

if xer and yer then 
	move(x0 * ld_perwidth,y0 * ld_perheight)
elseif xer then 
	x=x0 * ld_perwidth
elseif yer then 
	Y=y0 * ld_perheight
end if

if widther and heighter then 
	resize(width0 * ld_perwidth,height0 * ld_perheight)
elseif widther then 
	width=width0 * ld_perwidth
elseif heighter then 
	height=height0 * ld_perheight
end if

//父对象resize标识还原
i_resizetype=0

end event

event ue_move;//保存大小,位置及父对象的大小
if i_resizetype=0 then uf_savesize(2)
end event

event ue_ncpaint;//保存大小,位置及父对象的大小
if ib_initialized=false then event ue_afteropen()
if i_resizetype=0 then uf_savesize(0)
end event

event ue_afteropen();powerobject lpo
string ls_Path 
ulong lul_handle,ul_size=1024
date ld_data
datetime ldt_data
time lt_data

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

//保存大小
uf_savesize(0)

//默认取初始值
if ib_memory then 
	text=profilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),this.text)
end if

choose case maskdatatype
	case datemask! 
		if GetData(ld_data)=-1 then text=string(today(),mask)
	case timemask! 
		if GetData(lt_data)=-1 then text=string(now(),mask)
	case datetimemask!  
		if GetData(ldt_data)=-1 then text=string(now(),mask)
end choose

//if if em_date.GetData(ld_date)=-1 then 
//	ls_errtext='日期错误!'
//	goto e
//end if
//

ib_initialized=true
end event

public function integer settext (string as_text);text=as_text
return event modified()
end function

public subroutine uf_savesize (integer ai_type);//保存当前大小,位置及父对象的大小

powerobject lparent
window lw
dragobject ldr
x0=x
y0=y

if ai_type=2 then return //移动位置

width0=width
height0=height

lparent=getparent()

if typeof(lparent)=window! then 
	lw=lparent
	il_parentwidth=lw.WorkSpaceWidth()
	il_parentheight=lw.WorkSpaceheight()
else
	ldr=lparent
	il_parentwidth=ldr.Width
	il_parentheight=ldr.height
end if


end subroutine

on uo_derek_em.create
end on

on uo_derek_em.destroy
end on

event modified;date ld_data
string ls_text
datetime ldt_data
ls_text=text
choose case this.maskdatatype
	case datemask! 
		GetData(ld_data)
		if ld_data=today() then ls_text=''
	case datetimemask!  
		GetData(ldt_data)
		if date(ldt_data)=today() then ls_text=''
end choose
setprofilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),ls_text)

end event

