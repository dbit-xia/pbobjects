$PBExportHeader$uo_derek_checkbox.sru
forward
global type uo_derek_checkbox from checkbox
end type
end forward

global type uo_derek_checkbox from checkbox
integer width = 457
integer height = 96
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "none"
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_ncpaint pbm_ncpaint
event ue_afteropen ( )
end type
global uo_derek_checkbox uo_derek_checkbox

type prototypes
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"

end prototypes

type variables
public:
boolean ib_savevalue=true
//自适应大小处理
//等差
boolean xed,yed
boolean heighted,widthed

boolean xer,yer
boolean heighter,widther


private: 
boolean ib_initialized,ib_defaultvalue
string is_inifile_ctrl
window iw_parent
listbox ilb_add
long x0,y0	//保存位置
long width0,height0	//保存大小
long il_parentwidth,il_parentheight	//保存父对象大小
int i_resizetype	//1 为父对象resize,0 为自己resize



end variables

forward prototypes
public subroutine setvalue (boolean ai_type)
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

ib_defaultvalue=checked

if ib_savevalue then 
	//默认取初始值
	checked=(profilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),string(this.checked))='true')
end if

uf_savesize(0)
ib_initialized=true
end event

public subroutine setvalue (boolean ai_type);
if ib_savevalue=true then setprofilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),string(checked))
end subroutine

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

on uo_derek_checkbox.create
end on

on uo_derek_checkbox.destroy
end on

event clicked;this.setvalue(checked)
end event

