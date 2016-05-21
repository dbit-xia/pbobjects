$PBExportHeader$w_derek_window.srw
$PBExportComments$�ɼ̳д��ڶ���
forward
global type w_derek_window from window
end type
end forward

global type w_derek_window from window
integer width = 3625
integer height = 2012
boolean titlebar = true
string menuname = "m_mdi_out_runsa"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_derek_window w_derek_window

type prototypes
Function long SetWindowLongA(ulong hWnd, int nIndex, long dwNewLong) library "user32"
Function long GetWindowLongA(ulong hWnd, int nIndex) library "user32"

end prototypes

type variables
int oldwidth,oldheight
int i_allowclose=1	//�Ƿ�����رմ���
string gs_country=""	//���Ҵ���
boolean ib_response
window iw_parent
string is_inifile_ctrl //����ؼ���ֵ


Constant Long GWL_STYLE = -16           //������ʽ
Constant Long WS_SYSMENU = 524288       //��ϵͳ�˵��Ĵ���
constant long WS_THICKFRAME=262144	//���ڿ��Ըı��С
Constant Long WS_MINIMIZEBOX = 131072   //����һ������С����Ť�Ĵ��塣
Constant Long WS_MAXIMIZEBOX = 65536    //����һ������󻯰�Ť�Ĵ��塣

boolean ib_controlmenu=true	//���Ʋ˵�
boolean ib_maxbox=true	//��󻯰�ť
boolean ib_minbox=true	//��С����ť
boolean ib_resizable=true	//�ı��С

u_runsa_derek_lc u_lc
end variables

forward prototypes
public subroutine wf_cbstate_modify (boolean ab_ismod)
public subroutine controlresize (powerobject apo, integer ai_arg)
public subroutine wf_winresize (integer ai_arg)
public function integer wf_button_enable ()
end prototypes

public subroutine wf_cbstate_modify (boolean ab_ismod);
end subroutine

public subroutine controlresize (powerobject apo, integer ai_arg);//Ҫ��post ���øú���,ֻ��resize���ʱ������С
int l_wx,l_wy
int l_wwidth,l_wheight
datawindow ldw

////ֻ�ڵ�һ��ִ��
//if ib_resizing=false then return 

choose case ai_arg
	case	7	//X,Y,��/�±߾಻��
		if apo.typeof()=Datawindow! then 
			ldw=apo
			ldw.resize(ldw.width + (width - oldwidth),ldw.height + (height - oldheight))
		end if
	case	6	//X,Y,�ұ߾಻��
		if apo.typeof()=Datawindow! then 
			ldw=apo
			ldw.resize(ldw.width + (width - oldwidth),ldw.height)
		end if
	case 8 //�Զ�λ��+���
		if apo.typeof()=Datawindow! then 
			ldw=apo
			ldw.move(40,ldw.y)
			ldw.resize(width - 150,ldw.height)
		end if
	case 9 //�Զ�λ��+���+�߶�
		if apo.typeof()=Datawindow! then 
			ldw=apo
			ldw.move(40,ldw.y)
			Environment env
			if env.OSMinorRevision=2 then
				ldw.resize(width - 150 + 30,height - ldw.y - 180 + 40)
			else
				ldw.resize(width - 150,height - ldw.y - 180)
			end if 
		end if
end  choose

////��ִֹ�еڶ���
//ib_resizing=false

end subroutine

public subroutine wf_winresize (integer ai_arg);int l_wx,l_wy
int l_wwidth,l_wheight
datawindow ldw
window lw_parent

lw_parent=ParentWindow ( )

choose case ai_arg
	
	case 1 //�Զ�λ��+���+�߶�
		if isvalid(lw_parent) then
			height=lw_parent.height - 60
			width=lw_parent.width - 70
		end if
		
end  choose
	
end subroutine

public function integer wf_button_enable ();//�õ�Ȩ�޿����ַ���,����������PictureButton ue_enable event

int i,li_ret,li_pos
uo_derek_picbutton1 pb_temp
window lw_temp//lw_temp�����Ǹ��մ���,���������ָ��������Ȩ��ť

//���Ҳ˵�ID(���Ա��ⲻͨ���˵��򿪴���ʱ��Ȩ������)
li_ret=u_lc.getmenu(classname(),2)
if li_ret>0 then 
	g_menutext=u_lc.is_menus[li_ret,1]
end if

//�˵�Ȩ�޿��Ʋ�ѯ
gs_admit=''
//lw_temp�����Ǹ��մ���,���������ָ��������Ȩ��ť
f_menu_control_special(lw_temp,g_menutext)
//,modify=1,,check=1,,uncheck=1,,print=1,,add=1,,delete=1,,invisible=;
//f_messagebox('',gs_admit,0,0)

for i = 1 to upperbound(control[])
	
	choose case control[i].typeof() 
		case PictureButton!
			pb_temp=control[i]
			choose case lower(pb_temp.text)
				case 'add','new'
					li_pos=pos(gs_admit,',add=1')
				case 'modify','convert','generate','submit','import'
					li_pos=pos(gs_admit,',modify=1')
				case 'delete'
					li_pos=pos(gs_admit,',delete=1')
				case 'approval/reject'
					li_pos=pos(gs_admit,',uncheck=1') * pos(gs_admit,',check=1')
				case 'reject','uncheck'
					li_pos=pos(gs_admit,',uncheck=1')
				case 'approval','check'
					li_pos=pos(gs_admit,',check=1')
				case 'print','export'
					li_pos=pos(gs_admit,',print=1')
			end choose
			if li_pos=0 then 
				pb_temp.ib_admit=true
			end if
//			pb_temp.is_admit=gs_admit
			pb_temp.event ue_enable(pb_temp.enabled) 
	end choose
	
next
return 0
end function

on w_derek_window.create
if this.MenuName = "m_mdi_out_runsa" then this.MenuID = create m_mdi_out_runsa
end on

on w_derek_window.destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event key;if (keyflags=0 and key=keyescape!) or (keyflags=2 and key=keyw!) then 
	close(this)
end if

end event

event open;iw_parent=parentwindow()
is_inifile_ctrl=g_current_path+"\control.ini" 

Long lStyle

if windowtype=response! and controlmenu=false then
	
	lStyle = GetWindowLonga( Handle(This), -16) //��ȡԭ���
	
	if ib_controlmenu then 
		lStyle+=WS_SYSMENU	//���Ʋ˵�
		if ib_maxbox then
			lStyle+=WS_MAXIMIZEBOX	//��󻯰�ť
		end if
		if ib_minbox then
			lStyle+=WS_MINIMIZEBOX	//��С����ť
		end if
	end if
	if ib_resizable then
		lStyle+=WS_THICKFRAME	//�ı��С
	end if
	 
	SetWindowLonga( Handle(This),  -16, lStyle ) //�����µķ��
	
	//���ڴ�С�������ı�,��������resize
	resize(width,height)
	
elseif ib_response and isvalid(iw_parent) then 
	
	iw_parent.enabled=false
	
end if

gs_country=u_lc.is_country
if gs_country='' then 
	f_messagebox('','DC not empty,set please!',0,0)
	close(this)
	return
end if 

u_lc.uf_stores_add()
u_lc.uf_goods_add()
wf_button_enable()


end event

event close;
if windowtype<>response! and ib_response and isvalid(iw_parent) then iw_parent.enabled=true
end event

