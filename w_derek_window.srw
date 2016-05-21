$PBExportHeader$w_derek_window.srw
$PBExportComments$可继承窗口对象
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
int i_allowclose=1	//是否允许关闭窗口
string gs_country=""	//国家代号
boolean ib_response
window iw_parent
string is_inifile_ctrl //保存控件的值


Constant Long GWL_STYLE = -16           //窗口样式
Constant Long WS_SYSMENU = 524288       //带系统菜单的窗口
constant long WS_THICKFRAME=262144	//窗口可以改变大小
Constant Long WS_MINIMIZEBOX = 131072   //创建一个有最小化按扭的窗体。
Constant Long WS_MAXIMIZEBOX = 65536    //创建一个有最大化按扭的窗体。

boolean ib_controlmenu=true	//控制菜单
boolean ib_maxbox=true	//最大化按钮
boolean ib_minbox=true	//最小化按钮
boolean ib_resizable=true	//改变大小

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

public subroutine controlresize (powerobject apo, integer ai_arg);//要用post 调用该函数,只在resize完毕时调整大小
int l_wx,l_wy
int l_wwidth,l_wheight
datawindow ldw

////只在第一次执行
//if ib_resizing=false then return 

choose case ai_arg
	case	7	//X,Y,右/下边距不变
		if apo.typeof()=Datawindow! then 
			ldw=apo
			ldw.resize(ldw.width + (width - oldwidth),ldw.height + (height - oldheight))
		end if
	case	6	//X,Y,右边距不变
		if apo.typeof()=Datawindow! then 
			ldw=apo
			ldw.resize(ldw.width + (width - oldwidth),ldw.height)
		end if
	case 8 //自动位置+宽度
		if apo.typeof()=Datawindow! then 
			ldw=apo
			ldw.move(40,ldw.y)
			ldw.resize(width - 150,ldw.height)
		end if
	case 9 //自动位置+宽度+高度
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

////阻止执行第二次
//ib_resizing=false

end subroutine

public subroutine wf_winresize (integer ai_arg);int l_wx,l_wy
int l_wwidth,l_wheight
datawindow ldw
window lw_parent

lw_parent=ParentWindow ( )

choose case ai_arg
	
	case 1 //自动位置+宽度+高度
		if isvalid(lw_parent) then
			height=lw_parent.height - 60
			width=lw_parent.width - 70
		end if
		
end  choose
	
end subroutine

public function integer wf_button_enable ();//得到权限控制字符串,并遍历所有PictureButton ue_enable event

int i,li_ret,li_pos
uo_derek_picbutton1 pb_temp
window lw_temp//lw_temp必须是个空窗口,否则会隐藏指定窗口无权按钮

//查找菜单ID(可以避免不通过菜单打开窗口时的权限问题)
li_ret=u_lc.getmenu(classname(),2)
if li_ret>0 then 
	g_menutext=u_lc.is_menus[li_ret,1]
end if

//菜单权限控制查询
gs_admit=''
//lw_temp必须是个空窗口,否则会隐藏指定窗口无权按钮
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
	
	lStyle = GetWindowLonga( Handle(This), -16) //获取原风格
	
	if ib_controlmenu then 
		lStyle+=WS_SYSMENU	//控制菜单
		if ib_maxbox then
			lStyle+=WS_MAXIMIZEBOX	//最大化按钮
		end if
		if ib_minbox then
			lStyle+=WS_MINIMIZEBOX	//最小化按钮
		end if
	end if
	if ib_resizable then
		lStyle+=WS_THICKFRAME	//改变大小
	end if
	 
	SetWindowLonga( Handle(This),  -16, lStyle ) //设置新的风格
	
	//窗口大小会有所改变,所以重新resize
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

