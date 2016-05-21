$PBExportHeader$uo_derek_st.sru
forward
global type uo_derek_st from statictext
end type
end forward

global type uo_derek_st from statictext
integer width = 146
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "none"
boolean focusrectangle = false
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_resize pbm_size
end type
global uo_derek_st uo_derek_st

type variables
string is_inifile_ctrl
window iw_parent
listbox ilb_add

//����Ӧ��С����
//�Ȳ�
boolean xed,yed
boolean heighted,widthed

boolean xer,yer
boolean heighter,widther

long x0,y0	//����λ��
private long width0,height0	//�����С
private long il_parentwidth,il_parentheight	//���游�����С
int i_resizetype	//1 Ϊ������resize,0 Ϊ�Լ�resize
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

//������resize��ʶ��ԭ
i_resizetype=0

end event

event ue_move;//�����С,λ�ü�������Ĵ�С
if i_resizetype=0 then uf_savesize(2)
end event

event ue_resize;//�����С,λ�ü�������Ĵ�С
if i_resizetype=0 then uf_savesize(0)
end event

public subroutine uf_savesize (integer ai_type);//���浱ǰ��С,λ�ü�������Ĵ�С

powerobject lparent
window lw
dragobject ldr
x0=x
y0=y

if ai_type=2 then return //�ƶ�λ��

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

on uo_derek_st.create
end on

on uo_derek_st.destroy
end on

event constructor;uf_savesize(0)
end event

