$PBExportHeader$uo_derek_st_split.sru
forward
global type uo_derek_st_split from statictext
end type
end forward

global type uo_derek_st_split from statictext
integer width = 169
integer height = 16
integer textsize = -2
integer weight = 700
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "黑体"
string pointer = "SizeNS!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
long bordercolor = 16711680
fillpattern fillpattern = diamond!
boolean focusrectangle = false
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_resize pbm_size
event ue_lbdown pbm_lbuttondown
event ue_mousemove pbm_mousemove
event ue_lbup pbm_lbuttonup
end type
global uo_derek_st_split uo_derek_st_split

type variables
private string is_inifile_ctrl
window iw_parent
listbox ilb_add

powerobject ipo_parent
boolean ib_hsplit=false

private boolean ib_moving=false
dragobject iobj_above[],iobj_below[]
dragobject iobj_left[],iobj_right[]
dragobject iobj_move_vs[]
dragobject iobj_move_hs[]

private:
int i_clickpos
int i_miny,i_maxy
int i_minx,i_maxx

public:
long i_minsize=80
//自适应大小处理
//等差
boolean xed,yed
boolean heighted,widthed

boolean xer,yer
boolean heighter,widther

private:
private long x0,y0	//保存位置
private long width0,height0	//保存大小
private long il_parentwidth,il_parentheight	//保存父对象大小
private int i_resizetype	//1 为父对象resize,0 为自己resize
end variables

forward prototypes
public subroutine uf_savesize (integer ai_type)
public function integer uf_register_vs (dragobject ldo_above[], dragobject ldo_below[])
public function integer uf_register_hs (dragobject ldo_left[], dragobject ldo_right[])
public subroutine uf_setmove_hs (dragobject lobj[])
public subroutine uf_setmove_vs (dragobject lobj[])
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

//event ue_lbup(0,x,y)

//父对象resize标识还原
i_resizetype=0



end event

event ue_move;//保存位置
if i_resizetype=0 then uf_savesize(2)

end event

event ue_resize;//保存大小,位置及父对象的大小
//if i_resizetype=0 then uf_savesize(0)
end event

event ue_lbdown;border=true
ib_moving=true
long i,li_minsize,l_count
if ib_hsplit=true then 
	i_clickpos=this.x
	l_count=upperbound(iobj_left[])
	//取最小宽度,以计算X的最小值和最大值
	li_minsize=9999999
	for i=1 to l_count
		li_minsize=min(li_minsize,iobj_left[i].width)
	next
	
	l_count=upperbound(iobj_right[])
	i_minx=this.x - (li_minsize - i_minsize)
	li_minsize=9999999
	for i=1 to l_count
		li_minsize=min(li_minsize,iobj_right[i].width)
	next
	i_maxx=this.x + (li_minsize - i_minsize)
else
	i_clickpos=this.y
	l_count=upperbound(iobj_above[])
	//取最小高度,以计算Y的最小值和最大值
	li_minsize=9999999
	for i=1 to l_count
		li_minsize=min(li_minsize,iobj_above[i].height)
	next
	
	l_count=upperbound(iobj_below[])
	i_miny=this.y - (li_minsize - i_minsize)
	li_minsize=9999999
	for i=1 to upperbound(iobj_below[])
		li_minsize=min(li_minsize,iobj_below[i].height)
	next
	i_maxy=this.y + (li_minsize - i_minsize)
end if
end event

event ue_mousemove;int i,li_movepos,li_newpos

if flags=1 and ib_moving then 
	if ib_hsplit=true then //左右
		li_movepos=xpos
		li_newpos=(this.x + li_movepos)
		
		if li_newpos<i_minx then 
			this.x=i_minx
			return 
		end if
		
		if li_newpos>i_maxx then 
			this.x=i_maxx
			return 
		end if
		
		this.x =li_newpos
	else //上下
		li_movepos=ypos
		li_newpos=(this.y + li_movepos)
		
		if li_newpos<i_miny then 
			this.y=i_miny
			return 
		end if
		
		if li_newpos>i_maxy then 
			this.y=i_maxy
			return 
		end if
		
		this.y =li_newpos
	end if
	
end if 
end event

event ue_lbup;int i

if ib_moving=false then return 

ipo_parent.dynamic setredraw(false)

if ib_hsplit=false then 
	
	for i=1 to upperbound(iobj_above[])
		iobj_above[i].height+= (this.y - i_clickpos)
	next
	
	for i=1 to upperbound(iobj_below[])
		iobj_below[i].height =iobj_below[i].height - (this.y - i_clickpos) 
		iobj_below[i].y +=(this.y - i_clickpos)
	next
	
	for i=1 to upperbound(iobj_move_vs[])
		iobj_move_vs[i].y=iobj_move_vs[i].y + (this.y - i_clickpos)
	next
	
else
	
	for i=1 to upperbound(iobj_left[])
		iobj_left[i].width+= (this.x - i_clickpos)
	next
	
	for i=1 to upperbound(iobj_right[])
		iobj_right[i].width =iobj_right[i].width - (this.x - i_clickpos) 
		iobj_right[i].x +=(this.x - i_clickpos)
	next
	
	for i=1 to upperbound(iobj_move_hs[])
		iobj_move_hs[i].x =iobj_move_hs[i].x + (this.x - i_clickpos)
	next
	
end if

ipo_parent.dynamic setredraw(true)

ib_moving=false
border=false
uf_savesize(2)
end event

public subroutine uf_savesize (integer ai_type);//保存当前大小,位置及父对象的大小
window lw
dragobject ldr
x0=x
y0=y

if ai_type=2 then return //移动位置

width0=width
height0=height

if typeof(ipo_parent)=window! then 
	lw=ipo_parent
	il_parentwidth=lw.WorkSpaceWidth()
	il_parentheight=lw.WorkSpaceheight()
else
	ldr=ipo_parent
	il_parentwidth=ldr.Width
	il_parentheight=ldr.height
end if


end subroutine

public function integer uf_register_vs (dragobject ldo_above[], dragobject ldo_below[]);ib_hsplit=false
iobj_above[]=ldo_above[]
iobj_below[]=ldo_below[]
this.pointer='SizeNS!'
return 0
end function

public function integer uf_register_hs (dragobject ldo_left[], dragobject ldo_right[]);ib_hsplit=true
iobj_left[]=ldo_left[]
iobj_right[]=ldo_right[]
this.pointer='SizeWE!'
return 0
end function

public subroutine uf_setmove_hs (dragobject lobj[]);iobj_move_hs[]=lobj[]
//pointer='SizeWE!'
end subroutine

public subroutine uf_setmove_vs (dragobject lobj[]);iobj_move_vs[]=lobj[]
//pointer='SizeNE!'
end subroutine

on uo_derek_st_split.create
end on

on uo_derek_st_split.destroy
end on

event constructor;ipo_parent=getparent()
uf_savesize(0)
//if ib_hsplit then 
//	pointer='SizeWE!'
//else
//	pointer='SizeNS!'
//end if
end event

