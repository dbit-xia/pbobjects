$PBExportHeader$uo_derek_st_split.sru
forward
global type uo_derek_st_split from statictext
end type
end forward

global type uo_derek_st_split from statictext
integer width = 146
integer height = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "SizeNS!"
long textcolor = 33554432
long backcolor = 553648127
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_resize pbm_size
event ue_lbdown pbm_lbuttondown
event ue_mousemove pbm_mousemove
event ue_lbup pbm_lbuttonup
event setteam ( dragobject ado_team )
end type
global uo_derek_st_split uo_derek_st_split

type variables
string is_inifile_ctrl
window iw_parent
listbox ilb_add

powerobject ipo_parent
boolean ib_hsplit=false
private boolean ib_moving=false
dragobject ido_ctrl1,ido_ctrl2[]

//����Ӧ��С����
//�Ȳ�
boolean xed,yed
boolean heighted,widthed

boolean xer,yer
boolean heighter,widther

private long x0,y0	//����λ��
private long width0,height0	//�����С
private long il_parentwidth,il_parentheight	//���游�����С
int i_resizetype	//1 Ϊ������resize,0 Ϊ�Լ�resize,2Ϊteam����
end variables

forward prototypes
public subroutine uf_savesize (integer ai_type)
end prototypes

event parentresize(long newwidth, long newheight);//������ı��Сʱ,��Ҫ���򴥷�

long l_diffwidth,l_diffheight
dec ld_perwidth,ld_perheight

//������resize���
i_resizetype=1

//�Ȳ�
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

//�ȱ�
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

event ue_lbup(0,x,y)

//������resize��ʶ��ԭ
i_resizetype=0

end event

event ue_move;//����λ��

if i_resizetype=0 then 
	uf_savesize(2)
elseif i_resizetype=2 then 
	event ue_lbup(0,x,y)
end if 

end event

event ue_resize;//�����С,λ�ü�������Ĵ�С
if i_resizetype=0 then uf_savesize(0)
end event

event ue_lbdown;border=true
ib_moving=true
end event

event ue_mousemove;if flags=1 then 
	if ib_hsplit=false then 
		y +=ypos
	else
		x +=xpos
	end if
end if 
end event

event ue_lbup;
int i
border=false

if ib_moving=true or i_resizetype=0 or i_resizetype=2 then uf_savesize(2)
ib_moving=false

ipo_parent.dynamic setredraw(false)

if i_resizetype=2 then 
	
else
	
	if ib_hsplit=false then 
		ido_ctrl1.height +=ido_ctrl1.y - (y + height )
		ido_ctrl1.y =y + height 
	else
		ido_ctrl1.width +=ido_ctrl1.x - (x + width )
		ido_ctrl1.x =x + width 
	end if
	
end if

if ib_hsplit=false then 
	for i=1 to upperbound(ido_ctrl2[])
		ido_ctrl2[i].height= y - ido_ctrl2[i].y
	next
else
	for i=1 to upperbound(ido_ctrl2[])
		ido_ctrl2[i].width= x - ido_ctrl2[i].x
	next
end if

ipo_parent.dynamic setredraw(true)

end event

event setteam(dragobject ado_team);ido_ctrl1=ado_team

if ib_hsplit then 
	resize(20,ido_ctrl1.height)
	move(ido_ctrl1.x - 20,ido_ctrl1.Y )
else
	resize(ido_ctrl1.width,20)
	move(ido_ctrl1.x,ido_ctrl1.Y - 20)
end if


end event

public subroutine uf_savesize (integer ai_type);//���浱ǰ��С,λ�ü�������Ĵ�С
window lw
dragobject ldr
x0=x
y0=y

if ai_type=2 then return //�ƶ�λ��

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

on uo_derek_st_split.create
end on

on uo_derek_st_split.destroy
end on

event constructor;ipo_parent=getparent()
uf_savesize(0)
if ib_hsplit then 
	pointer='SizeWE!'
else
	pointer='SizeNS!'
end if
end event

event other;//�ı��С��Ϊdw�����Զ�����resize�¼�
if Message.Number=5 then event ue_resize(0,width,height)

end event

