$PBExportHeader$uo_derek_datawindow.sru
forward
global type uo_derek_datawindow from datawindow
end type
type u_dd from u_derek_v2_dd within uo_derek_datawindow
end type
end forward

global type uo_derek_datawindow from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
event type string ue_checkrow ( long row )
event keydown pbm_dwnkey
event type long ue_mouseleave ( )
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_dwnmousemove pbm_dwnmousemove
event ue_rowfocuschanging pbm_dwnrowchanging
event ue_lbup pbm_dwnlbuttonup
event ue_mousemove pbm_mousemove
event ue_itemchanged pbm_dwnitemchange
event ue_dwomove ( )
event type integer ue_mousefocuschanged ( long oldrow,  string olddwoname,  long newrow,  string newdwoname )
event type long ue_hotkey ( keycode key,  unsignedlong keyflags )
event ue_newrow ( boolean ab_modify )
event type integer ue_setmodify ( boolean ab_modify )
event type string ue_checknull ( long row )
event ue_enter pbm_dwnprocessenter
event ue_postclicked ( long xpos,  long ypos,  long row,  dwobject dwo )
event ue_ncpaint pbm_ncpaint
event ue_afteropen ( )
event ue_rbuttondown pbm_dwnrbuttondown
event type long ue_retrieve ( )
event ue_rowselected ( long l_row,  boolean lb_select )
event ue_dataobject ( string ls_dataobject )
event type integer ue_settransobject ( transaction ltrans_1 )
u_dd u_dd
end type
global uo_derek_datawindow uo_derek_datawindow

type prototypes
Function Long SetCapture(Long hwnd) library "user32"
Function Long ReleaseCapture() library "user32"
Function Long GetCapture() library "user32"
Function long GetSystemMetrics (long nIndex) Library "user32" Alias for "GetSystemMetrics;ansi"
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"

end prototypes

type variables
//u_derek_v2_dd u_dd
private window iw_parent
private transaction itrans_current
private string is_inifile_ctrl

//����Ӧ��С����
//�Ȳ�
boolean xed,yed
boolean heighted,widthed

boolean xer,yer
boolean heighter,widther

private long x0,y0	//����λ��
private long width0,height0	//�����С
private long il_parentwidth,il_parentheight	//���游�����С
private int i_resizetype	//1 Ϊ������resize,0 Ϊ�Լ�resize

string is_dberror //���������ݿ����

string is_columns='' //#1,#2,#4
string is_showcol[] //��ǰ�м���(��������)
long il_colx[],il_colwidth[]


private blob ibb_sql
boolean ib_initialized=false //�Ƿ��ѳ�ʼ��
public boolean ib_modified=false	//��¼�޸�״̬
public boolean ib_insert=false	//true���Զ����޸�״̬�¶��һ������

public boolean ib_retriving=false //����retrieve
protected boolean ib_updating=false	//�Ƿ�����ʹ��uf_update��������
protected boolean ib_deleting=false //����ɾ����

private long il_rows[] //��shiftѡ�е��к�
private boolean ib_isselect[] //��Ӧil_rows[]���к��Ƿ�shiftѡ��

public boolean ib_clicksort=false //˫����������
public boolean ib_mulineselect=true //�ж�ѡ
public boolean ib_mulcellselect=false //��Ԫ���ѡ
public boolean ib_checkrow=false //��ѡ��

//���ڰ��¼�
int i_lastdo
constant int i_LBdoing=1	//leftbutton
constant int i_PUdoing=2	//pageup
constant int i_PDdoing=3	//pagedown
constant int i_UAdoing=4	//uparrow
constant int i_DAdoing=5	//downarrow

private boolean ib_itemerrored=false
private boolean ib_itemfocuschanged=false
private boolean ib_setrowed=false
private boolean ib_itemchanged=false

private:
boolean ib_LBdown=false
long il_mouserow=0 //shift��mousemove�����к�
string is_mousecolname='' //shift��mousemove�������� ��������
string is_clickdwotype='' //������Ķ�������
string is_clickdwoname='' //������Ķ������� ��shift����Ķ���
long il_clickrow //��������к�
string is_getdwoname='' //���ĵ�ǰ��(����������) ��סshift ֵ����ı�
int i_mousecolindex=0
boolean ib_rowdrag=false //������
boolean ib_celldrag=false //��Ԫ������

//public string is_mousecolname=''	//���ĵ�ǰ��(����������) <> getcolumname()
//private long il_mouserow=0	//��shiftѡ����������<>getrow()
private string is_selected=''	//��¼���һ��ѡ�е��ַ� ��Ϊ���õ�selected<>����ȡ����selected

private boolean ib_redraw=true //��ǰredraw״̬
private boolean ib_setcapture=false //�Ƿ��û�����setcapture����
private boolean ib_ishotkey=false
private int i_VScrollwidth
private long il_pagecount

//GetSystemMetrics
Constant int SM_CXVSCROLL = 2
Constant int SM_CYHSCROLL = 3

public:
long i_gid //����Ψһ��ʶ
end variables

forward prototypes
public function boolean uf_ismodify (long row)
public function boolean uf_ismodified (long row, string dwoname, string data, string as_cols)
public function string uf_update (boolean a, boolean c)
public subroutine uf_savesize (integer ai_type)
public subroutine uf_clicksort (string as_dwoname)
public function long uf_deleterow ()
public function long uf_retrieveyield ()
public function string uf_setstyle (integer ai_style)
public function long uf_rowsdiscard ()
public function integer uf_settext (long al_row, string as_columname, string as_text)
public subroutine uf_intialvar ()
public subroutine uf_scrolltorow (long row, long newrow)
public function integer uf_selectcell (long newrow, string as_dwoname)
public function integer uf_post (string as_varname, integer ai_value)
public function integer uf_selectrow (long row, boolean ab_select)
public function integer uf_getcolumn (string ls_flags)
public function boolean uf_setredraw (boolean lb_redraw)
public function integer uf_settransobject (ref transaction ltrans)
public function integer uf_fullfilter (string ls_text)
public function integer uf_checkrow (long newrow, string as_dwoname)
public function integer uf_checkrow (long row, boolean ab_select)
public function integer uf_mousedwo (string ls_dwoname)
public function integer uf_mouserow (long l_row)
public function integer uf_selectrow_nomem (long newrow, string as_dwoname)
public function integer uf_selectrow (long newrow, string as_dwoname)
public function any uf_values (string ls_names)
public function integer uf_messagebox (string ls_title, string ls_content)
public function string uf_dataobject (string ls_dataobject)
public function integer uf_settransobject ()
end prototypes

event keydown;
string ls_text,ls_selected,ls_errtext,ls_querymode,ls_modify,ls_sql,ls_ret
long l_oldrow,l_newrow,l_getpage //��ǰ������ҳ
long l_lastpage	//���������ҳ
long l_currentpage	//��ǰ��ʾҳ
long l_diffpage,i,l_getrow
int l_arrow,li_colnum
string ls_cols[],ls_lastdwoname,ls_colstr,ls_getcolumname,ls_data
long l_pos
boolean lb_oldredraw
lb_oldredraw=ib_redraw

if keyflags=2 then 
	choose case key
//		case keyr!
//			if ib_modified=false then goto e 
//			uf_setredraw(false)
//			modify("datawindow.readonly='no' ")
//			u_dd.uf_settexts(this,::clipboard())
		case keyA! 
			if ib_mulineselect then uf_selectrow(0,true)
		case keyi! 
			
			if /*ib_modified=false and*/ Describe('datawindow.querymode')='yes' then goto e 
			if u_dd.getcolumns(this,5,ls_cols[])=0 then goto e //�ɱ༭������
			ls_colstr=u_dd.getstr(ls_cols[],',',0)
			uf_setredraw(false)
			l_getrow=getrow()
			ls_getcolumname=getcolumnname()
			ls_data=::clipboard()
			ls_errtext=u_dd.uf_import(this,ls_colstr,l_getrow,ls_getcolumname,ls_data)
			if ls_errtext<>'' then 
				messagebox('','δͨ����֤��:'+ls_errtext)
			end if
		case keyo!
			//f_dw_saveas(this,'')
		case keyC! 
			ls_text=u_dd.uf_selectedtext(this)
			yield()
			 ::clipboard(ls_text)
		case keyQ!
			ls_querymode=Describe('datawindow.querymode')
			
			if ls_querymode='no' then 
				ls_sql=describe('datawindow.table.select')
				//querymode=yesǰ����б���,����querymode�����ɴ����﷨
				if u_dd.uf_sql_alias_clear(ls_sql,ls_sql)>0 then
					object.datawindow.table.select=ls_sql
				end if
				uf_setredraw(false)
				ls_ret=modify('datawindow.querymode=yes')
				if ls_ret<>'' then 
					ls_errtext='��ǰ�����֧�ֲ�ѯģʽ!'
					goto e
				end if
				if ib_modified=false then dynamic event ue_setmodify(true)
				uf_setredraw(true)
			else
				if AcceptText()=-1 then return 
				uf_setredraw(false)				
				modify('datawindow.querymode=no')
				if ib_modified=false then dynamic event ue_setmodify(false)
				dynamic event ue_retrieve()
				uf_setredraw(true)
			end if

	end choose
end if

//if keyflags=1 then 
//	choose case key
//		case KeyDownArrow!
//			i_lastdo=i_DAdoing
//			if keyflags=1 then
//				l_oldrow=il_mouserow
//			else
//				l_oldrow=getrow()
//			end if
//			if l_oldrow>=rowcount() then goto e
//			l_newrow=l_oldrow + 1
//			if ib_mulineselect or ib_mulineselect then uf_setredraw(false)
//			
//			if keyflags=1 then 
//				if ib_mulineselect and is_getdwoname='cp_rowno' then uf_selectrow(l_newrow,is_getdwoname)
//				if ib_checkrow and is_getdwoname='cp_check' then uf_checkrow(l_newrow,is_getdwoname)
//			else
//				if ib_mulineselect then uf_selectrow(l_newrow,is_mousecolname)
//				if ib_checkrow then uf_checkrow(l_newrow,is_mousecolname)
//			end if
//			if ib_mulcellselect then uf_selectcell(l_newrow,is_mousecolname)
//			uf_scrolltorow(l_oldrow,l_newrow)
//			uf_mouserow(l_newrow)
//		case KeyUpArrow!
//			i_lastdo=i_UAdoing
//			if keyflags=1 then
//				l_oldrow=il_mouserow
//			else
//				l_oldrow=getrow()
//			end if
//			if l_oldrow<=1 then goto e
//			l_newrow=l_oldrow - 1
//			if ib_mulineselect or ib_mulineselect then uf_setredraw(false)
//			
//			if keyflags=1 then 
//				if ib_mulineselect and is_getdwoname='cp_rowno' then uf_selectrow(l_newrow,is_getdwoname)
//				if ib_checkrow and is_getdwoname='cp_check' then uf_checkrow(l_newrow,is_getdwoname)
//			else
//				if ib_mulineselect then uf_selectrow(l_newrow,is_mousecolname)
//				if ib_checkrow then uf_checkrow(l_newrow,is_mousecolname)
//			end if
//			if ib_mulcellselect then uf_selectcell(l_newrow,is_mousecolname)
//			uf_scrolltorow(l_oldrow,l_newrow)
//			uf_mouserow(l_newrow)
//		case KeyPageDown!
//			i_lastdo=i_PDdoing
//			if keyflags=1 then
//				l_oldrow=il_mouserow
//			else
//				l_oldrow=getrow()
//			end if
//			if l_oldrow>=rowcount() then goto e
//			l_newrow=min(rowcount(),l_oldrow + (long(object.datawindow.lastRowOnPage) - long(object.datawindow.firstRowOnPage) + 1))
//			if ib_mulineselect or ib_mulineselect then uf_setredraw(false)
//			
//			if keyflags=1 then 
//				if ib_mulineselect and is_getdwoname='cp_rowno' then uf_selectrow(l_newrow,is_getdwoname)
//				if ib_checkrow and is_getdwoname='cp_check' then uf_checkrow(l_newrow,is_getdwoname)
//			else
//				if ib_mulineselect then uf_selectrow(l_newrow,is_mousecolname)
//				if ib_checkrow then uf_checkrow(l_newrow,is_mousecolname)
//			end if
//			if ib_mulcellselect then uf_selectcell(l_newrow,is_mousecolname)
//			uf_scrolltorow(l_oldrow,l_newrow)
//			uf_mouserow(l_newrow)
//		case KeyPageUP!
//			i_lastdo=i_PUdoing
//			if keyflags=1 then
//				l_oldrow=il_mouserow
//			else
//				l_oldrow=getrow()
//			end if
//			if l_oldrow<=1 then goto e
//			l_newrow=max(1,l_oldrow - (long(object.datawindow.lastRowOnPage) - long(object.datawindow.firstRowOnPage) + 1))
//			if ib_mulineselect or ib_mulineselect then uf_setredraw(false)
//			
//			if keyflags=1 then 
//				if ib_mulineselect and is_getdwoname='cp_rowno' then uf_selectrow(l_newrow,is_getdwoname)
//				if ib_checkrow and is_getdwoname='cp_check' then uf_checkrow(l_newrow,is_getdwoname)
//			else
//				if ib_mulineselect then uf_selectrow(l_newrow,is_mousecolname)
//				if ib_checkrow then uf_checkrow(l_newrow,is_mousecolname)
//			end if
//			if ib_mulcellselect then uf_selectcell(l_newrow,is_mousecolname)
//			
//			uf_scrolltorow(l_oldrow,l_newrow)
//			uf_mouserow(l_newrow)
//		case KeyLeftArrow!
//			if ib_modified then goto e
//			if keyflags=1 then
//				l_newrow=il_mouserow
//				ls_lastdwoname=is_mousecolname
//			else
//				l_newrow=getrow()
//				ls_lastdwoname=is_mousecolname
//			end if
//			
//			for i=1 to upperbound(is_showcol[])
//				if is_showcol[i]=ls_lastdwoname and i<>1 then 
//					ls_lastdwoname=is_showcol[i - 1]
//					exit
//				end if
//			next
//			if ib_mulineselect or ib_mulineselect then uf_setredraw(false)
//			
//			//if ib_mulineselect then uf_selectrow(l_newrow,ls_lastdwoname)
//			if ib_mulcellselect then uf_selectcell(l_newrow,ls_lastdwoname)
//			uf_scrolltorow(l_newrow,l_newrow)
//			is_mousecolname=ls_lastdwoname
//		case KeyRightArrow!
//			if ib_modified then goto e
//			if keyflags=1 then
//				l_newrow=il_mouserow
//				ls_lastdwoname=is_mousecolname
//			else
//				l_newrow=getrow()
//				ls_lastdwoname=is_mousecolname
//			end if
//			for i=1 to upperbound(is_showcol[])
//				if is_showcol[i]=ls_lastdwoname and i<>upperbound(is_showcol[]) then 
//					ls_lastdwoname=is_showcol[i +1]
//					exit
//				end if
//			next
//			if ib_mulineselect or ib_mulineselect then uf_setredraw(false)
//			
//			//if ib_mulineselect then uf_selectrow(l_newrow,ls_lastdwoname)
//			if ib_mulcellselect then uf_selectcell(l_newrow,ls_lastdwoname)
//			uf_scrolltorow(l_newrow,l_newrow)
//			is_mousecolname=ls_lastdwoname
//	end choose
//end if
goto e
e:
if ls_errtext<>'' then 
	messagebox('',ls_errtext)
end if
post uf_post('lastdo',0)//�ָ������
post uf_setredraw(lb_oldredraw)



end event

event type long ue_mouseleave();//if ib_LBdown and keydown(keyleftbutton!) then triggerevent ("ue_lbup")
return 0
end event

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

//if xed then x=x0+l_diffwidth
//if yed then Y=y0+l_diffheight
//if widthed then width=width0+l_diffwidth
//if heighted then height=height0+l_diffheight


//choose case i_sizetype
//	case 0 
//		
//	case 1	//��ȵȲ�
//		width=width0+l_diffwidth
//	case 2	//��ȵȲ�
//		height=height0+l_diffheight
//	case 3	//��/�ߵȲ�
//		width=width0+l_diffwidth
//		height=height0+l_diffheight
//	case 4	//X�Ȳ�
//		x=x0+l_diffwidth
//	case 5	//Y�Ȳ�
//		Y=y0+l_diffheight
//	case 6	//XY�Ȳ�
//		x=x0+l_diffwidth
//		Y=y0+l_diffheight
//	case 7	//X,�ߵȲ�
//		x=x0+l_diffwidth
//		height=height0+l_diffheight
//	case 8	//Y,��Ȳ�
//		Y=y0+l_diffheight
//		width=width0+l_diffwidth
//		
//end choose

end event

event ue_move;//����λ��
if i_resizetype=0 then uf_savesize(2)

end event

event ue_dwnmousemove;//iw_parent.title=string(xpos)+'/'+string(ypos)+'/'+string(GetCapture())+'/'+string(ib_setcapture)//+string(UnitsToPixels(width,XUnitsToPixels!))
string ls_dwoname,ls_band
int li_colindex,li_colnum,i
long l_hspos,currentrow
boolean lb_oldredraw

ls_dwoname=string(dwo.name)
currentrow=getrow()

if ib_lbdown then 
	
	//�༭ʱ��ִ�����´���
	/*******************/
	
	if ib_mulcellselect=true then	
		if xpos<0 then 
			send(handle(this),276,0,0)	//�������
			send(handle(this),512,8,long(2,ypos)) //������߽�
			//return 0
			li_colindex=uf_getcolumn('firstshow')
			if li_colindex<>0 then 
				ls_dwoname=is_showcol[li_colindex]
				row=il_mouserow
			end if
		elseif xpos>UnitsToPixels(width,XUnitsToPixels!) then
			
			send(handle(this),276,1,0)	//���ҹ���
			send(handle(this),512,8,long(UnitsToPixels(width,XUnitsToPixels!) - i_VScrollwidth - 3,ypos)) //�����ұ߽�
			//return 0
			li_colindex=uf_getcolumn('lastshow')
			//iw_parent.title=string(li_colindex)
			if li_colindex<>0 then 
				ls_dwoname=is_showcol[li_colindex]
				row=il_mouserow
			end if
		else //�õ�ָ��λ�õ���
			
//			l_hspos=long(Describe("DataWindow.HorizontalScrollPosition"))
//			li_colnum=upperbound(is_showcol[])
//			for i=li_colnum to 1 step -1
//				if il_colx[i] <=l_hspos + xpos then 
//					ls_dwoname=is_showcol[i]
//					exit
//				end if
//			next
//			if row=0 then 
//				ls_band=GetBandAtPointer ( ) //background���к�=0
//				row=long(mid(ls_band,pos(ls_band,'~t') + 1))
//				ls_band=left(ls_band,pos(ls_band,'~t') - 1)
//				if row=0 then row=il_mouserow
//				//head ��row=1
//				//����Ϊlastrow
//	//			row=1
//			end if
			
		end if
	end if
	
	if ypos<0 then 
		send(handle(this),277,0,0)	//���Ϲ���
		row=long(object.datawindow.firstRowOnPage)
		//row=il_mouserow - 1
		
	elseif ypos>UnitsToPixels(height,YUnitsToPixels!) then 
		send(handle(this),277,1,0)	//���¹���
		row=long(object.datawindow.lastRowOnPage)
		//row=il_mouserow+1
	end if
	
end if

if ib_lbdown and row>0 and ls_dwoname<>'datawindow' and il_mouserow>0 then
	
	if row<>il_mouserow then //row<>il_clickrow or 
		ib_rowdrag=true
		ib_celldrag=true
	elseif ls_dwoname<>is_mousecolname then //ls_dwoname<>is_clickdwoname or
		ib_celldrag=true
	else 
		return 
	end if
	//
	
	if ib_rowdrag=true then
		
		if ib_mulineselect  then
			lb_oldredraw=uf_setredraw(false)
			if keydown(keyshift!) and is_getdwoname='cp_rowno' then
				uf_selectrow(row,is_getdwoname)
			elseif is_clickdwoname='cp_rowno' then
				uf_selectrow(row,is_clickdwoname)
			end if
			uf_setredraw(lb_oldredraw)
		end if
		
		if ib_checkrow  then
			lb_oldredraw=uf_setredraw(false)
			if keydown(keyshift!) and is_getdwoname='cp_check' then
				uf_checkrow(row,is_getdwoname)
			elseif is_clickdwoname='cp_check' then
				uf_checkrow(row,is_clickdwoname)
			end if
			uf_setredraw(lb_oldredraw)
		end if
	end if	
	
//	if ib_mulcellselect and ib_celldrag=true then
//		lb_oldredraw=uf_setredraw(false)
//		uf_selectcell(row,ls_dwoname)
//		uf_setredraw(lb_oldredraw)
//	end if	
//	
	if ib_rowdrag then uf_mouserow(row)
	if ib_celldrag then is_mousecolname=ls_dwoname
end if


end event

event ue_rowfocuschanging;//or i_lastdo=i_PUdoing &
//or i_lastdo=i_PDdoing  &
//or  i_lastdo=i_UAdoing &
//or  i_lastdo=i_DAdoing  &
long l_shiftrow,l_firstrow,l_lastrow
ib_setrowed=true
post uf_post('setrowed',0)
//iw_parent.title='rc'+string(currentrow,'')+'->'+string(newrow,'')
int l_ret
//shift+����/����(ҳ) ���λ���
if keydown(keyshift!) then 
	if keydown(KeyLeftButton!) then //��Դ��clicked,
		l_shiftrow=newrow
		uf_selectrow(l_shiftrow,is_getdwoname)
		uf_mouserow(l_shiftrow)
	elseif keydown(keypageup!) then //����
		if il_mouserow>1 then  
			l_firstrow=long(object.datawindow.firstRowOnPage)
			l_lastrow=long(object.datawindow.lastRowOnPage)
			if il_mouserow>l_firstrow and il_mouserow<=l_lastrow then
				l_shiftrow=l_firstrow
				uf_selectrow(l_shiftrow,is_getdwoname)
			else //���״η�ҳ
				l_shiftrow=il_mouserow - (l_lastrow - l_firstrow + 1)
				if l_shiftrow<1 then l_shiftrow=1
				uf_selectrow(l_shiftrow,is_getdwoname)
				uf_scrolltorow(il_mouserow,l_shiftrow)
			end if
			uf_mouserow(l_shiftrow)
		end if
	elseif keydown(keypagedown!) then //���·�ҳ
		if il_mouserow<rowcount() then 
			l_firstrow=long(object.datawindow.firstRowOnPage)
			l_lastrow=long(object.datawindow.lastRowOnPage)
			if il_mouserow>=l_firstrow and il_mouserow<l_lastrow then
				l_shiftrow=l_lastrow
				uf_selectrow(l_shiftrow,is_getdwoname)
			else //���״η�ҳ
				l_shiftrow=il_mouserow + (l_lastrow - l_firstrow + 1)
				if l_shiftrow>rowcount() then l_shiftrow=rowcount()
				uf_selectrow(l_shiftrow,is_getdwoname)
				uf_scrolltorow(il_mouserow,l_shiftrow)
			end if
			uf_mouserow(l_shiftrow)
		end if
	else
		//���¼�
		l_shiftrow=il_mouserow + (newrow - currentrow)
		if l_shiftrow>=1 and l_shiftrow<=rowcount() then
			uf_selectrow(l_shiftrow,is_getdwoname)
			uf_scrolltorow(il_mouserow,l_shiftrow)
			uf_mouserow(l_shiftrow)
		end if
	end if
	return 1
end if

if describe('datawindow.querymode')='yes' then 
else
	l_ret=event rowfocuschanging(currentrow,newrow)
end if
if l_ret<>1 then 
	il_rows[]={0}
	if ib_mulineselect then uf_selectrow(newrow,is_clickdwoname)
	if ib_checkrow then uf_checkrow(newrow,is_clickdwoname)
	uf_mouserow(newrow)
end if
//if l_ret=1 then uf_scrolltorow(newrow,currentrow)
return l_ret
end event

event ue_lbup;
//if ib_setcapture=false and GetCapture()=handle(this) then //���϶�
////	if describe("DataWindow.Syntax.Modified")='yes' then //lbup����޸�syntax
//		//�����Զ����¼�
//		post event ue_dwomove()
//	end if
//end if

post uf_post('releasecapture',0)

//il_mouserow=0
ib_lbdown=false
ib_rowdrag=false
ib_celldrag=false

return 0

end event

event ue_itemchanged;//messagebox('',data)
//if ib_itemchanged=true then return 
//ib_itemchanged=true
//uf_post('itemchanged',0)
//post 
int li_ret
if describe('datawindow.querymode')='yes' then return 0

data=string(data,'')
string ls_coltype,ls_format,ls_errtext

ls_coltype=string(dwo.coltype)
choose case lower(left(ls_coltype,5))
	case 'datet','date'
		ls_format=dwo.format
		if ls_format='YYYY-MM-DD' then 
			if isdate(data)=false then 
				ls_errtext='������Ч!'
				goto e
			end if
		end if
	case 'long','numbe','decim'
		if isnumber(data)=false then 
			ls_errtext='��ֵ��Ч!'
			goto e
		end if
end choose

li_ret=event itemchanged(row,dwo,data)

//ʹ���Զ�����
if li_ret<>1 and ib_insert then 
	if getitemstatus(row,0,primary!)=new! then
		SetItemStatus(row,0,primary!,newModified!)
	end if
	event ue_newrow(ib_modified)
	
end if 

return li_ret

goto e
e:
uf_messagebox('',ls_errtext)
return 1

end event

event ue_dwomove();u_dd.getcolumns(this,0,is_showcol[]) //post ������¼���ɺ��ٴ���
il_colx[]=u_dd.ids_temp.object.colx.current //λ��
il_colwidth[]=u_dd.ids_temp.object.colwidth.current //���

end event

event type integer ue_mousefocuschanged(long oldrow, string olddwoname, long newrow, string newdwoname);//��grid�����Ҫ����
if describe('datawindow.processing')<>'1' then return 0

if oldrow=newrow and olddwoname=newdwoname then return 0
//iw_parent.title=string(oldrow)+'->'+string(newrow)+'   '+olddwoname+'->'+newdwoname
if olddwoname=newdwoname then return 0
if newrow=0 or newdwoname='' then return 0

int li_oldindex,li_newindex
int i,li_colnum,li_firstcolindex,li_lastcolindex
int li_showwidth
li_colnum=upperbound(is_showcol[])

if li_colnum=0 then return 0

for i=1 to li_colnum
	if is_showcol[i]=olddwoname then 
		li_oldindex=i
		exit
	end if
next
for i=1 to li_colnum
	if is_showcol[i]=newdwoname then 
		li_newindex=i
		exit
	end if
next

//����
//if li_newindex<li_oldindex then 
//	li_firstcolindex=uf_getcolumn('firstshow')
//	if li_firstcolindex>li_newindex then 
//		object.DataWindow.HorizontalScrollPosition=il_colx[li_newindex] - 1
//	end if
//else //����
//	li_lastcolindex=uf_getcolumn('lastshow')
//	li_showwidth=unitstopixels(width,Xunitstopixels!)
//	if li_lastcolindex<li_newindex then 
//		object.DataWindow.HorizontalScrollPosition=il_colx[li_newindex]+il_colwidth[li_newindex] - (li_showwidth - (sign(il_pagecount - 1) * i_VScrollwidth)) + 3
//	end if
//end if

//if oldrow<>newrow then uf_scrolltorow(oldrow,newrow)

return 0
end event

event type long ue_hotkey(keycode key, unsignedlong keyflags);
string ls_text,ls_selected,ls_errtext
long l_oldrow,l_newrow,l_getpage //��ǰ������ҳ
long l_lastpage	//���������ҳ
long l_currentpage	//��ǰ��ʾҳ
long l_diffpage,i
int l_arrow,li_colnum
string ls_cols[],ls_lastdwoname,ls_colstr
long l_pos
boolean lb_oldredraw
lb_oldredraw=ib_redraw

//iw_parent.title+='key'
//if keyflags=2 or keyflags=3 then //Ctrl/Ctrl + shift
//	choose case key
//		case keyleftarrow!
//			li_colnum=upperbound(is_showcol[])
//			if li_colnum>0 then 
//				if ib_modified then 
//					for i=1 to li_colnum
//						if u_dd.uf_getmodifiable(this,il_mouserow,is_showcol[i])=true then exit
//					next
//				else
//					i=1 
//				end if
//				if ib_mulcellselect then uf_selectcell(il_mouserow,is_showcol[i]) //����
//			end if
//		case keyrightarrow!
//			li_colnum=upperbound(is_showcol[])
//			if li_colnum>0 then 
//				if ib_modified then 
//					for i=li_colnum to 1 step -1
//						if u_dd.uf_getmodifiable(this,il_mouserow,is_showcol[i])=true then exit
//					next
//				else
//					i=li_colnum
//				end if
//				if ib_mulcellselect then uf_selectcell(il_mouserow,is_showcol[i]) //ĩ��
//			end if
//		case KeyUpArrow!
//			i_lastdo=i_UAdoing
//			if ib_mulineselect then uf_selectrow(1,is_mousecolname)
//			if ib_mulcellselect then uf_selectcell(1,is_mousecolname)
//			uf_scrolltorow(il_mouserow,1)
//		case KeyDownArrow!
//			i_lastdo=i_DAdoing
//			l_newrow=rowcount()
//			if ib_mulineselect then uf_selectrow(l_newrow,is_mousecolname)
//			if ib_mulcellselect then uf_selectcell(l_newrow,is_mousecolname)
//			uf_scrolltorow(il_mouserow,l_newrow)
//	end choose
//	goto e
//end if
//

event keydown(key,keyflags)

goto e
e:
post uf_post('lastdo',0)//�ָ������
if ib_redraw<>lb_oldredraw then post uf_setredraw(lb_oldredraw)
return 0


end event

event ue_newrow(boolean ab_modify);long l_rowcount
long l_row
boolean lb_oldredraw
lb_oldredraw=ib_redraw

//���Զ���������
if ib_insert=false then return

l_rowcount=rowcount()

if ab_modify then 
	if l_rowcount=0 then 
		insertrow(0)
	else
		l_row=find("isRowNew() and (not isRowModified())",1,l_rowcount)
		if l_row=0 then insertrow(0)
	end if
else

	//ʹ���Զ�ɾ������
	if l_rowcount>0 then 
		uf_setredraw(false)
		do while(1=1)
			l_row=find("(not isRowModified()) and isRowNew()",1,rowcount())
			if l_row<=0 then exit
			if l_row>0 then deleterow(l_row)
		loop
	end if
end if

if lb_oldredraw<>ib_redraw then uf_setredraw(lb_oldredraw)

ib_modified=ab_modify
end event

event type integer ue_setmodify(boolean ab_modify);if describe('datawindow.querymode')='yes' then 
	if ab_modify=false then modify('datawindow.querymode=no')
else
	ib_modified=ab_modify
end if
return 1
end event

event ue_postclicked(long xpos, long ypos, long row, dwobject dwo);if ib_itemerrored=true then goto e

string ls_dwoname
boolean lb_oldredraw
string ls_dwotype

ls_dwoname=dwo.name
ls_dwotype=dwo.type

if row=0 then 
	//��ȫѡ
	if  ls_dwoname='cp_rowno_t' and ib_mulineselect then 
		uf_selectrow(row,ls_dwoname)
	end if
	
	if ls_dwoname='cp_check_t' and ib_checkrow then 
		uf_checkrow(row,ls_dwoname)
	end if
	
else
	
	
	if ls_dwoname='datawindow' then ls_dwoname=is_getdwoname
	
	if getrow()<>row then 
		if setrow(row)=-1 then goto e //����Ӱ�����Ĵ���ִ��
		if getrow()<>row then goto e
	end if
	
end if

if ls_dwotype='column' or ls_dwotype='compute' then 
	event ue_mousefocuschanged(il_mouserow,is_mousecolname,row,ls_dwoname)
	is_mousecolname=ls_dwoname	//��¼���������
	//il_mouserow=row
else
	event ue_mousefocuschanged(il_mouserow,is_mousecolname,row,is_mousecolname)
	//il_mouserow=row
end if

if keydown(keyshift!)=false and (ls_dwotype='column' or ls_dwotype='compute') then 
	is_getdwoname=ls_dwoname
end if

goto e
e:
if ls_dwotype='column' or ls_dwotype='compute' then 
	if ib_mulcellselect then uf_selectcell(row,ls_dwoname)
	is_mousecolname=ls_dwoname
end if
if row<>0 then uf_mouserow(row)

end event

event ue_ncpaint;if ib_initialized=false then event ue_afteropen()
end event

event ue_afteropen();string ls_Path 
ulong lul_handle,ul_size=1024
ls_Path = space(1024) 
lul_handle = Handle(GetApplication()) 
GetModuleFilename(lul_handle, ls_Path, ul_size) 
ls_Path=mid(ls_Path,1,lastpos(ls_Path,'\'))

is_inifile_ctrl=ls_Path+"control.ini"

powerobject lpo
lpo=this
//������������
do 
	lpo=lpo.getparent()
loop until typeof(lpo)=window! 
iw_parent=lpo


uf_savesize(0) //�����С
//uf_settransobject(sqlca)
ib_initialized=true
end event

event ue_rbuttondown;long l_ret

l_ret=event rbuttondown(xpos,ypos,row,dwo)
if l_ret=1 then return 1

if not isnull(FindClassDefinition("m_dw")) then //�Ƿ���ں��� 
	menu lmenu
	lmenu=create using 'm_dw'
	lmenu.dynamic uf_setdw(this,'text') 
	destroy lmenu
	return 1
end if

return 0


end event

event type long ue_retrieve();if isvalid(itrans_current) then settransobject(itrans_current)
return 0
end event

event type integer ue_settransobject(transaction ltrans_1);return uf_settransobject(ltrans_1)
end event

public function boolean uf_ismodify (long row);int i,l_cols
int l_lastpos
string ls_prop

l_cols=integer(describe("datawindow.column.count"))
for i=1 to l_cols
	ls_prop=u_dd.uf_getprop(this,"#"+string(i)+".protect",row)
	if integer(ls_prop)=0 and integer(describe("#"+string(i)+".tabsequence"))>0 then return true
next
return false
end function

public function boolean uf_ismodified (long row, string dwoname, string data, string as_cols);//����rowָ���к�
//dwoname ������(������#colid)
//data	itemchangedʱ��gettext()
//�жϵĿ����޸ĵ���(������Զ��ŷָ�)

//NewModified!�ĳ�ʼֵһֱ�ڱ�

int i,l_colcount,l_colid,i2
string ls_cols[]

u_dd.getarray(as_cols,ls_cols[],',')

data=string(data,'')

//l_colid=integer(describe(dwoname+".id"))
//messagebox('',string(object.data.primary.Original[row,l_colid],'')+'/'+string(object.data.primary.Original[row,l_colid],'')+'/'+string(data,''))
		
if dwoname='' then 
	//��itemchangedʱִ��
	choose case getitemstatus(row,0,primary!)
		case NotModified!
			return false
		case New!
			return false
		case NewModified!
			if as_cols='' then 
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if string(object.data.primary.Original[row,i],'')<>'' then //string(object.data.primary.Current[row,i],'')
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
					if string(object.data.primary.Original[row,i2],'')<>'' then //string(object.data.primary.Current[row,i2],'')
						return true
					end if
				next
			end if
		case DataModified!
			if as_cols='' then
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if getitemstatus(row,i,primary!)=NotModified! then continue;
					if string(object.data.primary.Original[row,i],'')<>string(object.data.primary.Current[row,i],'') then 
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
//					messagebox(ls_cols[i],string(object.data.primary.Original[row,i2],'')<>string(object.data.primary.Current[row,i2],''))
					if getitemstatus(row,i2,primary!)=NotModified! then continue;
					if string(object.data.primary.Original[row,i2],'')<>string(object.data.primary.Current[row,i2],'') then 
						return true
					end if
				next
			end if
	end choose
else
	//itemchangedʱִ��
	choose case getitemstatus(row,0,primary!)
		case NotModified! 
//			post setitemstatus(row,0,primary!,DataModified!)
			return true
		case New!
//			post setitemstatus(row,0,primary!,NewModified!)
			return true
		case NewModified!
			//��ǰ���Ƿ��޸�
			if data<>'' then return true
			//ȡ��ID
			l_colid=integer(describe(dwoname+".id"))
			
			if as_cols='' then 
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if i=l_colid then
						continue
					elseif string(object.data.primary.Original[row,i],'')<>'' then //string(object.data.primary.Current[row,i],'')
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
					if i2=l_colid then continue;
					if string(object.data.primary.Original[row,i2],'')<>'' then //string(object.data.primary.Current[row,i2],'')
						return true
					end if
				next
			end if
			//���ܽ������ó�New!
//			post messagebox('setNew!',setitemstatus(row,0,primary!,New!))
		case DataModified!
			l_colid=integer(describe(dwoname+".id"))
			if as_cols='' then 
				l_colcount=integer(object.datawindow.Column.Count)
				for i=1 to l_colcount
					if i=l_colid then
						if string(object.data.primary.Original[row,i],'')<>data then return true
					elseif string(object.data.primary.Original[row,i],'')<>string(object.data.primary.Current[row,i],'') then 
						return true
					end if
				next
			else
				l_colcount=upperbound(ls_cols)
				for i=1 to l_colcount
					i2=integer(describe(ls_cols[i]+".id"))
					if i2=l_colid then 
						if string(object.data.primary.Original[row,i2],'')<>data then return true
					elseif string(object.data.primary.Original[row,i2],'')<>string(object.data.primary.Current[row,i2],'') then 
						return true
					end if
				next
			end if
			//����״̬��ı�item�ĳ�ʼֵ
//			post messagebox('setNotModified!',setitemstatus(row,0,primary!,NotModified!))
	end choose
	
end if

return false


end function

public function string uf_update (boolean a, boolean c);//ƴ��SQL��������

int li_ret=1
string ls_sql
string ls_errtext,ls_ret

ibb_sql=blob('')
ib_updating=true

if update(a,c)=-1 then 
	ls_errtext="Update Failed!"
	goto e
end if

if len(ibb_sql)=0 then goto e

ls_sql=string(ibb_sql)

execute immediate :ls_sql;

if sqlca.sqlcode=-1 then 
	ls_errtext+=sqlca.sqlerrtext
	goto e
end if

e:
ib_updating=false
return ls_errtext
end function

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

public subroutine uf_clicksort (string as_dwoname);//����������,֧��+ctrl��������

string ls_dwoname,ls_colname,ls_coltype,ls_colid
int li_pos,li_pos2
string ls_sort,ls_str,ls_sort_temp
boolean lb_oldredraw

ls_dwoname=as_dwoname

ls_colname=left(ls_dwoname,len(ls_dwoname) - 2)

ls_coltype=describe(ls_colname+".type")

if (ls_coltype='column' or ls_coltype='compute') then
	
	ls_sort=Describe("DataWindow.Table.Sort")
	
	if ls_sort='?' then ls_sort=''
	
	li_pos=pos(ls_sort,ls_colname+' ')
	
	if li_pos=0 and ls_coltype='column' then 
		ls_colid=describe(ls_colname+".id")
		li_pos=pos(ls_sort,'#'+ls_colid)
		if li_pos>0 then ls_colname='#'+ls_colid
	end if 
	
	if keydown(keycontrol!) then 
	
		if li_pos>0 then 
			ls_sort_temp=trim(mid(ls_sort,1,li_pos - 1))
			li_pos2=pos(ls_sort,',',li_pos + len(ls_colname) + 1)
			if li_pos2=0 then 
				ls_str=mid(ls_sort,li_pos + len(ls_colname)+1)
			else
				ls_str=mid(ls_sort,li_pos + len(ls_colname) + 1,li_pos2 - (li_pos + len(ls_colname) + 1))
				ls_sort_temp+=mid(ls_sort,li_pos2 + 1)
				if ls_sort_temp<>'' then ls_sort_temp+=','
			end if
			
			if left(trim(ls_str),1)='A' then 
				ls_sort_temp+=ls_colname+' D'
			else
				ls_sort_temp+=ls_colname+' A'
			end if
			
		else
			ls_sort_temp=ls_sort
			if ls_sort_temp<>'' then ls_sort_temp+=','
			ls_sort_temp+=ls_colname+' A'
		end if
	else
		if li_pos>0 then 
			if left(trim(mid(ls_sort,li_pos + len(ls_colname)+1)),1)='A' then 
				ls_sort_temp=ls_colname+' D'
			else
				ls_sort_temp=ls_colname+' A'
			end if
		else
			ls_sort_temp=ls_colname+' A'
		end if
	end if
	//��������
	setsort(ls_sort_temp)
	lb_oldredraw=uf_setredraw(false)
	sort()
	uf_setredraw(lb_oldredraw)
end if
		

end subroutine

public function long uf_deleterow ();
long l_rows,i
string ls_msg
boolean lb_mulineselect,lb_oldredraw

l_rows=long(describe("Evaluate('sum(if(isselected(),1,0))',0)"))

ib_deleting=true
lb_oldredraw=uf_setredraw(false)

if l_rows=0 then 
	deleterow(0)
	l_rows=1
elseif l_rows=1 then 
	deleterow(getselectedrow(0))
	l_rows=1
elseif l_rows>1 then 
	
	if ib_mulineselect=true then 
		lb_mulineselect=ib_mulineselect	//����ɾ��ʱ�����ж�ѡ
		ib_mulineselect=false
	end if
	
	i=getselectedrow(0)
	do 
		deleterow(i)
		i=getselectedrow(i - 1)
	loop  until i=0
	
	if lb_mulineselect=true then ib_mulineselect=true
	
end if
uf_setredraw(lb_oldredraw)
ib_deleting=false

return l_rows


end function

public function long uf_retrieveyield ();//if describe("DataWindow.Retrieve.AsNeeded")='no' then ib_retriving=true
long l_rowcount
ib_retriving=true
//�첽����
send(handle(this), 1306, 1, 0)
l_rowcount=rowcount()
ib_retriving=false
return l_rowcount

end function

public function string uf_setstyle (integer ai_style);//������ɫ����
string ls_modify,ls_ret
string ls_column[],ls_column_t[]
int i
string ls_errtext

choose case ai_style
	case 1
		ls_modify="DataWindow.color=67108864 datawindow.transparency=0 "
		
		ls_column[]=u_dd.getcolumns(this,0)
		
		for i=1 to upperbound(ls_column[])
			ls_column_t[i]+=ls_column[i]+'_t'
		next
		
		ls_modify+="DataWindow.HTMLTable.GenerateCSS='1' "	//���ָ�ʽ����ɫ
		ls_modify+="DataWindow.HTMLTable.Border='0' "	//��Ҫtable�߿�
		ls_modify+="DataWindow.HTMLTable.CellSpacing='0' "	//��Ԫ���޼��
		//ls_modify+="DataWindow.HTMLTable.CellPadding='0' "
		//ls_modify+="DataWindow.HTMLTable.NoWrap='0' "
		ls_modify+=u_dd.getattribstring( ls_column[],'Border',"0")
		ls_modify+=u_dd.getattribstring( ls_column[],"Color",'0~~tif(isRowModified(),rgb(225,0,0),rgb(0,0,0))' ) //
		ls_modify+=u_dd.getattribstring( ls_column[],'Y',"0")
//		ls_modify+=u_dd.getattribstring( ls_column[],'Edit.FocusRectangle','1') //���ɷ����Ч
		//ls_modify+=u_dd.getattribstring( ls_column[],'height',dd.Describe("DataWindow.Detail.Height"))
		ls_modify+=u_dd.getattribstring( ls_column[],'Background.Color',"16777215~~tif(getrow()=currentrow(),rgb(255,255,225),rgb(255,255,255))") //rgb(242,220,219)
		
		ls_modify+=u_dd.getattribstring( ls_column_t,'Background.Color',"67108864") //rgb(242,220,219)
		//ls_modify+=u_dd.getattribstring( ls_column_t,'y',"0")
		
		if dynamic describe('datawindow.Units')='1' then
			ls_modify+=u_dd.getattribstring( ls_column[],'height',string(long(Describe("DataWindow.Detail.Height")) - 1 ))
			//�к�
			ls_ret=dynamic describe("cp_rowno.name")
			if ls_ret='!' then 
				ls_modify+='create compute(band=detail alignment="2" expression="getrow()"border="0	if (currentrow()=getrow(),4,0)" color="0" x="0" y="0" height="20~~trowheight() - 0" width="35" format="[GENERAL]" html.valueishtml="0"  name=cp_rowno visible="1"  font.face="Tahoma" font.height="-9" background.color="67108864" transparency="0" ) '
	//			ls_modify+='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="24" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="32630492" background.transparency="0" transparency="0" ) '
			else
				ls_modify+='cp_rowno.border="0	if (currentrow()=getrow(),4,0)" cp_rowno.height="20~~trowheight() - 0" cp_rowno.background.color="67108864" ' //15790320
			end if
			
		end if
		
		ls_ret=dynamic describe("cp_check.name")
		if ls_ret='cp_check' then 
			
		end if
		
		ls_errtext=dynamic modify(ls_modify)
		
		if dynamic describe('datawindow.Units')='1' then
			ls_ret=dynamic describe("cp_rowno_t.name")
			if ls_ret='!' then 
				ls_modify='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="'+describe('datawindow.header.height')+'" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" transparency="0" ) '
				ls_errtext+=dynamic modify(ls_modify)
			end if
		end if
	
	case 2
		
		ls_modify="DataWindow.color=67108864 datawindow.transparency=0 "
		
		ls_column[]=u_dd.getcolumns(this,0)
		
		for i=1 to upperbound(ls_column[])
			ls_column_t[i]+=ls_column[i]+'_t'
		next
		
		ls_modify+="DataWindow.HTMLTable.GenerateCSS='1' "	//���ָ�ʽ����ɫ
		ls_modify+="DataWindow.HTMLTable.Border='0' "	//��Ҫtable�߿�
		ls_modify+="DataWindow.HTMLTable.CellSpacing='0' "	//��Ԫ���޼��
		//ls_modify+="DataWindow.HTMLTable.CellPadding='0' "
		//ls_modify+="DataWindow.HTMLTable.NoWrap='0' "
		ls_modify+=u_dd.getattribstring( ls_column[],'Border',"0") //��border
//		ls_modify+=u_dd.getattribstring( ls_column[],"Color",'0~~tif(isRowModified(),rgb(225,0,0),rgb(0,0,0))' ) //
		ls_modify+=u_dd.getattribstring( ls_column[],'Y',"0") //�ϵ���
//		ls_modify+=u_dd.getattribstring( ls_column[],'Edit.FocusRectangle','1') //���ɷ����Ч
		
		ls_modify+=u_dd.getattribstring( ls_column[],'Background.Color',"16777215~~tif(getrow()=currentrow(),rgb(255,255,225),rgb(255,255,255))") //rgb(242,220,219)
		ls_modify+=u_dd.getattribstring( ls_column_t,'Background.Color',"12639424") //rgb(242,220,219)
		//ls_modify+=u_dd.getattribstring( ls_column_t,'y',"0")
		
		
		if dynamic describe('datawindow.Units')='1' then
			ls_modify+=u_dd.getattribstring( ls_column[],'height',string(long(Describe("DataWindow.Detail.Height")) - 1 ))
			//�к�
			ls_ret=dynamic describe("cp_rowno.name")
			if ls_ret='!' then 
				ls_modify+='create compute(band=detail alignment="2" expression="getrow()"border="0" color="0" x="0" y="0" height="20~~trowheight() - 0" width="35" format="[GENERAL]" html.valueishtml="0"  name=cp_rowno visible="1"  font.face="Tahoma" font.height="-9" background.color="67108864" transparency="0" ) '
	//			ls_modify+='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="24" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="32630492" background.transparency="0" transparency="0" ) '
			else
				ls_modify+='cp_rowno.border="0" cp_rowno.height="20~~trowheight() - 0" cp_rowno.background.color="67108864" ' //15790320
			end if
		end if
		
		ls_errtext=dynamic modify(ls_modify)
		
		if dynamic describe('datawindow.Units')='1' then
			ls_ret=dynamic describe("cp_rowno_t.name")
			if ls_ret='!' then 
				ls_modify='create text(band=header alignment="2" text="No." border="0" color="33554432" x="2" y="0" height="24" width="31" html.valueishtml="0"  name=cp_rowno_t visible="1"  font.face="Arial" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" background.transparency="0" transparency="0" ) '
				ls_errtext+=dynamic modify(ls_modify)
			end if
		end if
		
//		f_messagebox(ls_errtext,ls_modify,0,0)
		
end choose 
	
return ls_errtext


end function

public function long uf_rowsdiscard ();
long l_rows,l_row
string ls_msg
boolean lb_oldredraw

l_rows=long(describe("Evaluate('sum(if(isselected(),1,0))',0)"))
l_row=getrow()
ib_deleting=true
lb_oldredraw=uf_setredraw(false)

if l_rows=0 then 
	RowsDiscard(l_row,l_row,primary!)
	l_rows=1
elseif l_rows=1 then 
	l_row=getselectedrow(0)
	RowsDiscard(l_row,l_row,primary!)
	l_rows=1
elseif l_rows>1 then 
	l_row=getselectedrow(0)
	do 
		RowsDiscard(l_row,l_row,primary!)
		l_row=getselectedrow(l_row - 1)
	loop  until l_row=0
	
end if
uf_setredraw(lb_oldredraw)
ib_deleting=false

return l_rows


end function

public function integer uf_settext (long al_row, string as_columname, string as_text);//����0Ϊδ��ֵ,1�ɹ�,-1 Ϊʧ��

if u_dd.uf_setcell(this,al_row,as_columname)=-1 then goto e
return settext(as_text)

e:
return -1
end function

public subroutine uf_intialvar ();long l_empty[]
boolean lb_empty[]

i_lastdo=0
is_mousecolname=''
i_mousecolindex=0
ib_retriving=false
ib_updating=false	//�Ƿ�����ʹ��uf_update��������
ib_deleting=false

il_rows[]=l_empty[]
ib_isselect[]=lb_empty[]

is_dberror=''
end subroutine

public subroutine uf_scrolltorow (long row, long newrow);//������ָ����,shift��setrow
//����excel������

long l_showpage
long l_newpage
long l_diffpage
int li_diffrow
long l_firstrow,l_lastrow,l_pagerowcount
int l_arrow
long i
boolean lb_oldredraw

if newrow>rowcount() then return 

//iw_parent.title+=string(row)+'>'+string(newrow)

lb_oldredraw=uf_setredraw(false)

l_firstrow=long(object.datawindow.firstRowOnPage)
l_lastrow=long(object.datawindow.lastRowOnPage)
l_pagerowcount=(l_lastrow - l_firstrow + 1)

if newrow=1 then 
	object.DataWindow.VerticalScrollPosition=0 //��ҳ
elseif newrow=rowcount() then
	object.DataWindow.VerticalScrollPosition=object.DataWindow.VerticalScrollMaximum //���һҳ
elseif (newrow>=l_firstrow and newrow<=l_lastrow) then //��ǰҳ
	
elseif newrow=l_lastrow + 1 then //ĩ�� + 1
	send(handle(this),277,1,0)
elseif newrow=l_firstrow - 1 then //���� - 1
	send(handle(this),277,0,0)
else
	
//	if (newrow>=l_firstrow and newrow<=l_lastrow) then //��ҳ
		
//		if newrow>row then //�·�ҳ
//			l_arrow=3
//		else	//�Ϸ�ҳ
//			l_arrow=2
//		end if
//		send(handle(this),277,l_arrow,0)

//	else
		
		//l_showpage=long(describe("evaluate('page()',"+string(l_firstrow)+")"))	//��ǰ��ʾҳ
		//l_newpage=long(describe("evaluate('page()',"+string(newrow)+")"))	//��������ҳ
		if newrow>l_lastrow then 
			l_diffpage=Ceiling((newrow - l_lastrow) * 1.0 / l_pagerowcount)
			l_arrow=3
		elseif newrow<l_firstrow then 
			l_diffpage=Ceiling((l_firstrow - newrow) * 1.0 / l_pagerowcount)
			l_arrow=2
		end if
		//l_newpage=l_showpage + ()
		//l_diffpage=l_newpage
		//iw_parent.title+='P='+string(l_diffpage)
//		if l_diffpage>=1 then //�·�
//			l_arrow=3
//		elseif l_diffpage<=-1 then //�Ϸ�
//			l_arrow=2
//		end if
		
		//����ҳ
		for i=1 to l_diffpage
			send(handle(this),277,l_arrow,0)
		next
		
		//������Ϊ��ʾҳ���һ��,����Ϊ��ʾҳ������
//		l_firstrow=long(object.datawindow.firstRowOnPage)	//��ҳ����
//		l_lastrow=long(object.datawindow.lastRowOnPage)	//��ҳĩ��
		
//		if newrow>l_firstrow then //�·�
//			li_diffrow=newrow - l_firstrow
//			l_arrow=1
//		else //�Ϸ�
//			li_diffrow=l_lastrow - newrow
//			l_arrow=0
//		end if
//		
//		//������
//		for i=1 to abs(li_diffrow)
//			send(handle(this),277,l_arrow,0)
//		next
		
//	end if
	
end if

//if not(keydown(keyshift!)=true or ib_rowdrag) then 
//	//��clicked�¼�����ûᵼ���ظ�ִ��
//	//if setrow(newrow)=-1 then return
//	//iw_parent.title=string(newrow)
//	setrow(newrow)
//end if
//event ue_mousefocuschanged�����ô˺���
//event ue_mousefocuschanged(il_mouserow,is_mousecolname,newrow,is_mousecolname)
//uf_mouserow(newrow)
uf_setredraw(lb_oldredraw)

end subroutine

public function integer uf_selectcell (long newrow, string as_dwoname);
if newrow=0 then return 0

string ls_array[],ls_cols[]
string ls_selected,ls_select
int li_ret,li_startcol,li_endcol,li_colcount
long l_pos,l_startrow,l_endrow,i
string ls_startdwoname,ls_enddwoname,ls_lastselected
boolean lb_oldredraw

lb_oldredraw=ib_redraw

if as_dwoname='datawindow' or newrow=0 or as_dwoname='' then 
	return 0
end if

if ib_modified=true then goto m

//if trim(describe("datawindow.selected"))='' then //shiftʱclick����1,����selected=''
//	ls_selected=''
//else
	ls_selected=is_selected
//end if

//iw_parent.title+='G:'+ls_selected
if keydown(KeyShift!) or ib_celldrag then
	
	l_pos=lastpos(ls_selected,';')
	if l_pos=0 then 
		if ls_selected='' then
			ls_lastselected=string(newrow)+'/'+string(newrow)+'/'+as_dwoname
		else
			ls_lastselected=ls_selected
			ls_selected=''
		end if
	else
		
		ls_lastselected=mid(ls_selected,l_pos + 1)
		ls_selected=mid(ls_selected,1,l_pos)
	end if
	
	if u_dd.getarray(ls_lastselected,ls_array[],'/')=0 then goto e
		
	l_startrow=long(ls_array[1])
	ls_startdwoname=ls_array[3]
	
	ls_cols[]=is_showcol[]
	//u_dd.getcolumns(this,0,ls_cols[])
	li_colcount=upperbound(ls_cols[])
	if li_colcount=0 then goto e
	for i=1 to li_colcount
		if ls_cols[i]=ls_startdwoname then li_startcol=i
		if ls_cols[i]=as_dwoname then li_endcol=i
	next
	
	ls_select=string(l_startrow)+'/'+string(newrow)
	
	if li_startcol<=li_endcol then 
		for i=li_startcol to li_endcol
			ls_select+='/'+ls_cols[i]
		next
	else
		for i=li_startcol to li_endcol step -1
			ls_select+='/'+ls_cols[i]
		next
		
	end if
	
	li_ret=1
elseif keydown(KeyControl!) then
	//messagebox('','')
	ls_select=string(newrow)+'/'+string(newrow)+'/'+as_dwoname
	l_pos=pos(';'+ls_selected+';',';'+ls_select+';')
	if l_pos>0 then //�Ѵ���,��Ҫ��ȥ��
		ls_selected=replace(ls_selected,l_pos,len(ls_select)+1,'')
	end if
else
	ls_selected=''
	ls_select=string(newrow)+'/'+string(newrow)+'/'+as_dwoname
end if

if ls_selected<>'' and right(ls_selected,1)<>';' then 
	ls_selected+=';'
end if

//��¼selected,����datawindow.selected����
is_selected=ls_selected+ls_select
//iw_parent.title+='S:'+is_selected

uf_setredraw(false)
if ib_celldrag=true then 
	modify("datawindow.selected='"+ls_selected+ls_select+"' ")
else
	//post 
	modify("datawindow.selected='"+ls_selected+ls_select+"' ")
end if

//iw_parent.title=ls_selected+ls_select+'*****'+trim(describe("datawindow.selected"))

m:
//if not (keydown(KeyShift!)  or ib_celldrag) then
//	setcolumn(as_dwoname)
//end if


e:
event ue_mousefocuschanged(il_mouserow,is_mousecolname,newrow,as_dwoname)
//il_mouserow=newrow
//is_mousecolname=as_dwoname
//if not (keydown(KeyShift!) or ib_celldrag) then 
//	is_mousecolname=as_dwoname
//end if
if lb_oldredraw<>ib_redraw then uf_setredraw(lb_oldredraw)
return li_ret

end function

public function integer uf_post (string as_varname, integer ai_value);
choose case as_varname
	case 'itemerrored'
		ib_itemerrored=(1=ai_value)
	case 'itemfocuschanged'
		ib_itemfocuschanged=(1=ai_value)
	case 'setrow'
		if ai_value<>getrow() and ib_itemerrored=false then //��<>��ǰ��  
			if accepttext()<>-1 then setrow(ai_value)
		end if
	case 'lastdo'
		i_lastdo=ai_value
	case 'setcapture'
		if GetCapture()=handle(this) then //PB_SetCapture
			//�����ж��Ƿ��޸����﷨(��:��������)
			Object.DataWindow.Syntax.Modified ="no"
		else //�û�_SetCapture
			SetCapture(handle(this))
			ib_setcapture=true
		end if
	case 'releasecapture'
		if ib_setcapture=true then //������û�_SetCapture
			ReleaseCapture()
			ib_setcapture=false
		else //�Ƿ��﷨�޸�(��:��������)
			if Object.DataWindow.Syntax.Modified ="yes" then event ue_dwomove()
		end if
	case 'setrowed'
		ib_setrowed=(1=ai_value)
	case 'itemchanged'
		ib_itemchanged=(1=ai_value)
end choose

return 0
end function

public function integer uf_selectrow (long row, boolean ab_select);int li_ret

char lc_check='0',lc_check_0[],lc_check_1[]
string ls_array[]
long l_row,l_rowcount
//if describe('cp_check.type')='column' then 
//	if row=0 then 
//		
//		if ab_select=true then 
//			l_rowcount=rowcount()
//			lc_check_1[]=fill('1',l_rowcount)
//			ls_array[]=lc_check_1[]
//			object.cp_check.primary.current=ls_array // object.cp_check.primary.Original
//		else
//			l_rowcount=rowcount()
//			lc_check_0[]=fill('0',l_rowcount)
//			ls_array[]=lc_check_0[]
//			//������� new!��newmodified!״̬,��Original��һֱ�仯
////			for l_row=1 to l_rowcount
////				setitemstatus(l_row,0,Primary!,DataModified!)
////			next
//			//object.cp_check.primary.current=lc_check_0[]
//			object.cp_check.primary.current=ls_array[]
//		end if
//	else
//		if ab_select=true then lc_check='1'
//		if setitem(row,'cp_check',lc_check)=-1 then 
//			messagebox('','selectrow setitem ʧ��')
//		end if
//	end if
//	//resetupdate()
//end if

li_ret=SelectRow(row,ab_select)

event ue_rowselected(row,ab_select)

return li_ret
end function

public function integer uf_getcolumn (string ls_flags);//modify('fax.format="" ')
long l_hsmaxpos,l_hspos
int li_colnum,li_index
long l_realwidth,i,l_showwidth

li_colnum=upperbound(il_colx[])

//l_hsmaxpos=long(Describe("DataWindow.HorizontalScrollMaximum"))
l_hspos=long(Describe("DataWindow.HorizontalScrollPosition"))

choose case ls_flags
	case 'firstshow'
		for i=1 to li_colnum
			if il_colx[i]>=l_hspos then 
				li_index=i
				exit
			end if 
		next
	case 'lastshow'
		l_showwidth=unitstopixels(width,XUnitsToPixels!)
		il_pagecount=long(describe("Evaluate('PageCountAcross ( )',0)"))
		if il_pagecount>1 then 
			i_VScrollwidth=GetSystemMetrics(SM_CXVSCROLL)
			l_showwidth=l_showwidth - i_VScrollwidth
		end if
		l_realwidth=il_colx[li_colnum]+il_colwidth[li_colnum]+1
		
		for i=li_colnum to 1 step -1
			if il_colx[i]>l_hspos+l_showwidth then continue;
			if il_colx[i]<l_hspos+l_showwidth and il_colx[i]+il_colwidth[i]<=l_hspos+l_showwidth then 
				li_index=i
				exit
			end if 
		next
end choose

return li_index

end function

public function boolean uf_setredraw (boolean lb_redraw);int li_ret
boolean lb_oldredraw
lb_oldredraw=ib_redraw
if lb_redraw<>lb_oldredraw then 
	li_ret=setredraw(lb_redraw)
	if li_ret=1 then ib_redraw=lb_redraw
end if
return lb_oldredraw
end function

public function integer uf_settransobject (ref transaction ltrans);int li_ret
if itrans_current<>ltrans then itrans_current=ltrans
li_ret=settransobject(ltrans)
return li_ret
end function

public function integer uf_fullfilter (string ls_text);string ls_filter
int li_colnb,i
string ls_colname

if ls_text>'' then 
	
	li_colnb=upperbound(is_showcol[])
	ls_filter='1<>1 '
	for i=1 to li_colnb
		ls_colname=is_showcol[i]
		if ls_colname='cp_rowno' then continue;
		if describe(ls_colname+'.type')='column' then 
			ls_filter+=" or (lookupdisplay("+ls_colname+") like '%"+ls_text+"%') " 
		else
			ls_filter+=" or (string("+ls_colname+",'') like '%"+ls_text+"%') " 
		end if
	next 
end if

setfilter(ls_filter)
return filter()
end function

public function integer uf_checkrow (long newrow, string as_dwoname);long l_startrow,currentrow,i,l_oldrow/*ԭshift�����к�*/
int li_ret
string ls_dwoname
string ls_dwotype
string ls_dwoband
boolean lb_currentisselect,lb_oldredraw
lb_oldredraw=ib_redraw

if as_dwoname='datawindow' then 
//	if newrow>0 then return 1
	return 0
end if

uf_setredraw(false)
if as_dwoname='' then as_dwoname=is_mousecolname
ls_dwoname=as_dwoname
currentrow=getrow()

choose case ls_dwoname
	case 'cp_check_t' //ȫѡ'',
		
		if long(describe("evaluate(~"sum(if(cp_check='1',1,0))~",0)"))=rowcount() then
			uf_checkrow(0,false)
		else
			uf_checkrow(0,true)
		end if 
		li_ret=0
	case 'cp_check'	//ѡ��	'',	
		if (ib_rowdrag=true or keydown(KeyShift!)) then//2
			//if keydown(keycontrol!) then //3������ѡ
				if il_mouserow=currentrow then //��ǰ��
					if newrow<il_mouserow then //��ʼ����
						for i=il_mouserow - 1 to newrow step -1
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
					elseif newrow>il_mouserow then //��ʼ����
						for i=il_mouserow + 1  to newrow
							uf_checkrow(i,object.cp_check[i]<>'1')
						next				
					end if
				elseif il_mouserow<currentrow then //��������
					if newrow<il_mouserow then //��������
						for i=il_mouserow - 1  to newrow step -1
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
					elseif newrow>=currentrow then //����-->����
						for i=il_mouserow to currentrow - 1
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
						for i=currentrow+1  to newrow
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
					else //��ͷ
						for i=il_mouserow  to newrow - 1
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
					end if
				elseif il_mouserow>currentrow then //��������
					if newrow>il_mouserow then //��������
						for i=il_mouserow + 1  to newrow 
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
					elseif newrow<=currentrow then //����-->����
						for i=il_mouserow to currentrow + 1 step -1
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
						for i=currentrow - 1  to newrow step -1
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
					else //��ͷ
						for i=il_mouserow  to newrow + 1 step -1
							uf_checkrow(i,object.cp_check[i]<>'1')
						next
					end if
				end if
//			else //3����ѡ��
//				if il_mouserow=currentrow then //��ǰ��
//					if newrow<il_mouserow then //��ʼ����
//						for i=il_mouserow - 1 to newrow step -1
//							if object.cp_check[i]='0' then uf_checkrow(i,true)
//						next
//					elseif newrow>il_mouserow then //��ʼ����
//						for i=il_mouserow + 1  to newrow
//							if object.cp_check[i]='0' then uf_checkrow(i,true)
//						next				
//					end if
//				elseif il_mouserow<currentrow then //��������
//					if newrow<il_mouserow then //��������
//						for i=il_mouserow - 1  to newrow step -1
//							if object.cp_check[i]='0' then uf_checkrow(i,true)
//						next
//					elseif newrow>=currentrow then //����-->����
//						for i=il_mouserow to currentrow - 1
//							if object.cp_check[i]='1' then uf_checkrow(i,false)
//						next
//						for i=currentrow+1  to newrow
//							if object.cp_check[i]='0' then uf_checkrow(i,true)
//						next
//					else //��ͷ
//						for i=il_mouserow  to newrow - 1
//							if object.cp_check[i]='1' then uf_checkrow(i,false)
//						next
//					end if
//				elseif il_mouserow>currentrow then //��������
//					if newrow>il_mouserow then //��������
//						for i=il_mouserow + 1  to newrow 
//							if object.cp_check[i]='0' then uf_checkrow(i,true)
//						next
//					elseif newrow<=currentrow then //����-->����
//						for i=il_mouserow to currentrow + 1 step -1
//							if object.cp_check[i]='1' then uf_checkrow(i,false)
//						next
//						for i=currentrow - 1  to newrow step -1
//							if object.cp_check[i]='0' then uf_checkrow(i,true)
//						next
//					else //��ͷ
//						for i=il_mouserow  to newrow + 1 step -1
//							if object.cp_check[i]='1' then uf_checkrow(i,false)
//						next
//					end if
//				end if
//				
//			end if //3
			li_ret=1
		else //2
			uf_checkrow(newrow,object.cp_check[newrow]<>'1')
			li_ret=0
		end if //2
	case else	//ȡ��ѡ��
		li_ret=0
end choose

if lb_oldredraw<>ib_redraw then uf_setredraw(lb_oldredraw)

return li_ret
end function

public function integer uf_checkrow (long row, boolean ab_select);int li_ret

char lc_check='0',lc_check_0[],lc_check_1[]
string ls_array[]
long l_row,l_rowcount
string la_value
if describe('cp_check.type')='column' then 
	if row=0 then 
		
		l_rowcount=rowcount()
		if l_rowcount<=0 then goto m
		
		if ab_select=true then 
			lc_check_1[]=fill('1',l_rowcount)
			ls_array[]=lc_check_1[]
			object.cp_check.primary.Original=ls_array[] //  
		else
			lc_check_0[]=fill('0',l_rowcount)
			ls_array[]=lc_check_0[]
			object.cp_check.primary.Original=ls_array[] //  
		end if
	else
		if ab_select=true then lc_check='1'
		object.cp_check.primary[row]=lc_check //.Original ����������� .Original
	end if
end if

goto m
m:
return li_ret
end function

public function integer uf_mousedwo (string ls_dwoname);is_mousecolname=ls_dwoname
return 0
end function

public function integer uf_mouserow (long l_row);il_mouserow=l_row
return 0
end function

public function integer uf_selectrow_nomem (long newrow, string as_dwoname);long l_startrow,currentrow,i
int li_ret
string ls_dwoname
string ls_dwotype
string ls_dwoband
boolean lb_currentisselect,lb_oldredraw
lb_oldredraw=ib_redraw

if as_dwoname='datawindow' then 
//	if newrow>0 then return 1
	return 0
end if

uf_setredraw(false)
if as_dwoname='' then as_dwoname=is_mousecolname
ls_dwoname=as_dwoname
currentrow=getrow()

choose case ls_dwoname //1
	case 'cp_rowno_t' //ȫѡ'cp_check_t',
		if long(describe("evaluate('sum(if(isselected(),1,0))',0)"))=rowcount() then
			uf_selectrow(0,false)
		else
			uf_selectrow(0,true)
		end if 
	case 'cp_rowno'	//1ѡ��	'cp_check',	
		if ib_rowdrag=true or keydown(KeyShift!) then //2
			
			if keydown(keycontrol!) then //3��ѡ
				
				if il_mouserow=currentrow then //4��ǰ��
					if newrow<il_mouserow then //5��ʼ����
						for i=il_mouserow - 1 to newrow step -1
							uf_selectrow(i,isselected(i)=false)
						next
					elseif newrow>il_mouserow then //��ʼ����
						for i=il_mouserow + 1  to newrow
							uf_selectrow(i,isselected(i)=false)
						next				
					end if
				elseif il_mouserow<currentrow then //��������
					if newrow<il_mouserow then //��������
						for i=il_mouserow - 1  to newrow step -1
							uf_selectrow(i,isselected(i)=false)
						next
					elseif newrow>currentrow then //����-->����
						for i=il_mouserow to currentrow - 1
							uf_selectrow(i,isselected(i)=false)
						next
						for i=currentrow+1  to newrow
							uf_selectrow(i,isselected(i)=false)
						next
					else //��ͷ
						for i=il_mouserow  to newrow - 1
							uf_selectrow(i,isselected(i)=false)
						next
					end if
				elseif il_mouserow>currentrow then //4��������
					if newrow>il_mouserow then //��������
						for i=il_mouserow + 1  to newrow 
							uf_selectrow(i,isselected(i)=false)
						next
					elseif newrow<currentrow then //����-->����
						for i=il_mouserow to currentrow + 1 step -1
							uf_selectrow(i,isselected(i)=false)
						next
						for i=currentrow - 1  to newrow step -1
							uf_selectrow(i,isselected(i)=false)
						next
					else //��ͷ
						for i=il_mouserow  to newrow + 1 step -1
							uf_selectrow(i,isselected(i)=false)
						next
					end if
				end if //4
			else //3����ѡ��
				
				if il_mouserow=currentrow then //4��ǰ��
					if newrow<il_mouserow then //��ʼ����
						for i=il_mouserow - 1 to newrow step -1
							if isselected(i)=false then uf_selectrow(i,true)
						next
					elseif newrow>il_mouserow then //��ʼ����
						for i=il_mouserow + 1  to newrow
							if isselected(i)=false then uf_selectrow(i,true)
						next				
					end if
				elseif il_mouserow<currentrow then //4��������
					if newrow<il_mouserow then //��������
						for i=il_mouserow - 1  to newrow step -1
							if isselected(i)=false then uf_selectrow(i,true)
						next
					elseif newrow>currentrow then //����-->����
						for i=il_mouserow to currentrow - 1 //����ȫ��
							if isselected(i) then uf_selectrow(i,false)
						next
						for i=currentrow+1  to newrow
							if isselected(i)=false then uf_selectrow(i,true)
						next
					else //��ͷ
						for i=il_mouserow to newrow - 1
							if isselected(i) then uf_selectrow(i,false)
						next
					end if
				elseif il_mouserow>currentrow then //4��������
					if newrow>il_mouserow then //��������
						for i=il_mouserow + 1  to newrow 
							if isselected(i)=false then 
								uf_selectrow(i,true)
							end if
						next
					elseif newrow<currentrow then //����-->����
						for i=il_mouserow to currentrow+1 step -1//����ȫ��
							if isselected(i) then uf_selectrow(i,false)
						next
						for i=currentrow - 1  to newrow step -1
							if isselected(i)=false then uf_selectrow(i,true)
						next
					else //��ͷ
						for i=il_mouserow  to newrow + 1 step -1
							if isselected(i) then uf_selectrow(i,false)
						next
					end if
				end if //4
			end if //3
		elseif keydown(KeyControl!)  then //2
			
			uf_selectrow(newrow,isselected(newrow)=false)
		
		else //2
			//if describe("cp_check.name")='!' then 
			uf_selectrow(0,false)
//			if i_lastdo=i_LBdoing then 
//				uf_selectrow(newrow,isselected(newrow)=false)
//			else
				if IsSelected (newrow)=false then uf_selectrow(newrow,true )
//			end if
			
		end if //2
	case else	//ȡ��ѡ��
		//if describe("cp_check.name")='!' then 
		uf_selectrow(0,false)
end choose

event ue_mousefocuschanged(il_mouserow,is_mousecolname,newrow,as_dwoname)
//il_mouserow=newrow
//is_mousecolname=as_dwoname

if lb_oldredraw<>ib_redraw then uf_setredraw(lb_oldredraw)

return li_ret
end function

public function integer uf_selectrow (long newrow, string as_dwoname);/*����shiftѡ��ǰ�ļ�¼,��������Ҫά��il_mouserow[],�������Ͻ�������������*/
long l_startrow,currentrow,i,l_oldrow/*ԭshift�����к�*/,l_rows[]/*��ʱ�����к�*/,l_index/*�����е����*/
boolean lb_isselect[] /*��ʱ����ѡ�б��*/
int li_ret
string ls_dwoname
string ls_dwotype
string ls_dwoband
boolean lb_currentisselect,lb_oldredraw
lb_oldredraw=ib_redraw

if as_dwoname='datawindow' then 
//	if newrow>0 then return 1
	return 0
end if

uf_setredraw(false)
if as_dwoname='' then as_dwoname=is_mousecolname
ls_dwoname=as_dwoname
currentrow=getrow()

choose case ls_dwoname //1
	case 'cp_rowno_t' //ȫѡ'cp_check_t',
		if long(describe("evaluate('sum(if(isselected(),1,0))',0)"))=rowcount() then
			uf_selectrow(0,false)
		else
			uf_selectrow(0,true)
		end if 
		il_rows=l_rows[] //���¼�¼***
	case 'cp_rowno'	//1ѡ��	'cp_check',	
		if ib_rowdrag=true or keydown(KeyShift!) then //2
			
			if keydown(keycontrol!) then //3��ѡ
				
				if il_mouserow=currentrow then //4��ǰ��
					if newrow<il_mouserow then //5��ʼ����
						for i=il_mouserow - 1 to newrow step -1
							uf_selectrow(i,isselected(i)=false)
							l_rows[currentrow - i]=i
						next
					elseif newrow>il_mouserow then //��ʼ����
						for i=il_mouserow + 1  to newrow
							uf_selectrow(i,isselected(i)=false)
							l_rows[i - currentrow]=i
						next				
					end if
					il_rows[]=l_rows[]
				elseif il_mouserow<currentrow then //��������
					if newrow<il_mouserow then //��������
						for i=il_mouserow - 1  to newrow step -1
							uf_selectrow(i,isselected(i)=false)
							il_rows[currentrow - i]=i
						next
					elseif newrow>=currentrow then //����-->����
						for i=il_mouserow to currentrow - 1
							if il_rows[currentrow - i]=0 then continue
							uf_selectrow(i,isselected(i)=false)
							il_rows[currentrow - i]=0
						next
						il_rows[]=l_rows[]
						for i=currentrow+1  to newrow
							uf_selectrow(i,isselected(i)=false)
							il_rows[i - currentrow]=i
						next
					else //��ͷ
						for i=il_mouserow  to newrow - 1
							if il_rows[currentrow - i]=0 then continue
							uf_selectrow(i,isselected(i)=false)
							il_rows[currentrow - i]=0
						next
					end if
				elseif il_mouserow>currentrow then //4��������
					if newrow>il_mouserow then //��������
						for i=il_mouserow + 1  to newrow 
							uf_selectrow(i,isselected(i)=false)
							il_rows[i - currentrow]=i
						next
					elseif newrow<=currentrow then //����-->����
						for i=il_mouserow to currentrow + 1 step -1
							if il_rows[i - currentrow]=0 then continue
							uf_selectrow(i,isselected(i)=false)
							il_rows[i - currentrow]=0
						next
						il_rows[]=l_rows[]
						for i=currentrow - 1  to newrow step -1
							uf_selectrow(i,isselected(i)=false)
							il_rows[currentrow - 1]=i
						next
					else //��ͷ
						for i=il_mouserow  to newrow + 1 step -1
							if il_rows[i - currentrow]=0 then continue
							uf_selectrow(i,isselected(i)=false)
							il_rows[i - currentrow]=0
						next
					end if
				end if //4
				//il_rows=l_rows[] //���¼�¼***
			else //3����ѡ��
				
				if il_mouserow=currentrow then //4��ǰ��
					if newrow<il_mouserow then //��ʼ����
						for i=il_mouserow - 1 to newrow step -1
							if isselected(i)=false then 
								uf_selectrow(i,true)
								l_rows[currentrow - i]=i
							end if
						next
					elseif newrow>il_mouserow then //��ʼ����
						for i=il_mouserow + 1  to newrow
							if isselected(i)=false then 
								uf_selectrow(i,true)
								l_rows[i - currentrow]=i
							end if
						next				
					end if
					il_rows[]=l_rows[] //��¼***
				elseif il_mouserow<currentrow then //4��������
					if newrow<il_mouserow then //��������
						for i=il_mouserow - 1  to newrow step -1
							if isselected(i)=false then 
								uf_selectrow(i,true)
								il_rows[currentrow - i]=i
							end if
						next
					elseif newrow>=currentrow then //����-->����
						for i=upperbound(il_rows[]) to 1 step -1//����ȫ��
							if il_rows[i]=0 then continue 
							uf_selectrow(il_rows[i],isselected(il_rows[i])=false) //ȡ��,��ֹ��;��ѡ
							//il_rows[i]=0
						next
						il_rows=l_rows[] //���¼�¼***
						for i=currentrow+1  to newrow
							if isselected(i)=false then 
								uf_selectrow(i,true)
								il_rows[i - currentrow]=i
							end if
						next
					else //��ͷ
						for i=il_mouserow to newrow - 1
							l_index=currentrow - i
							//iw_parent.title=string(currentrow)+'/'+string(il_mouserow)+'/'+string(newrow)
							if il_rows[l_index]=0 then continue //
							uf_selectrow(il_rows[l_index],isselected(il_rows[l_index])=false)
							il_rows[l_index]=0
						next
					end if
				elseif il_mouserow>currentrow then //4��������
					if newrow>il_mouserow then //��������
						for i=il_mouserow + 1  to newrow 
							if isselected(i)=false then 
								uf_selectrow(i,true)
								il_rows[i - currentrow]=i
							end if
						next
					elseif newrow<=currentrow then //����-->����
						for i=upperbound(il_rows[]) to 1 step -1//����ȫ��
							if il_rows[i]=0 then continue 
							uf_selectrow(il_rows[i],isselected(il_rows[i])=false)
							il_rows[i]=0
						next
						il_rows=l_rows[] //���¼�¼***
						for i=currentrow - 1  to newrow step -1
							if isselected(i)=false then 
								uf_selectrow(i,true)
								il_rows[currentrow - i]=i
							end if
						next
					else //��ͷ
						for i=il_mouserow  to newrow + 1 step -1
							l_index=i - currentrow
							if il_rows[l_index]=0 then continue //
							uf_selectrow(il_rows[l_index],isselected(il_rows[l_index])=false)
							il_rows[l_index]=0
						next
					end if
				end if //4
				//il_rows=l_rows[] //���¼�¼***
			end if //3
		elseif keydown(KeyControl!)  then //2
			//iw_parent.title+='s>'+string(newrow)
			uf_selectrow(newrow,isselected(newrow)=false)
			il_rows=l_rows[] //���¼�¼***
		
		else //2
			//if describe("cp_check.name")='!' then 
			uf_selectrow(0,false)
//			if i_lastdo=i_LBdoing then 
//				uf_selectrow(newrow,isselected(newrow)=false)
//			else
				if IsSelected (newrow)=false then uf_selectrow(newrow,true )
//			end if
			il_rows=l_rows[] //���¼�¼***
			
		end if //2
	case else	//ȡ��ѡ��
		if keydown(keycontrol!)=false and keydown(keyshift!)=false then 
			uf_selectrow(0,false)
			il_rows=l_rows[] //���¼�¼***
		end if
end choose

event ue_mousefocuschanged(il_mouserow,is_mousecolname,newrow,as_dwoname)
//il_mouserow=newrow
//is_mousecolname=as_dwoname

//for i=upperbound(il_rows[]) to 1 step -1
//	object.rowno.original[i]=il_rows[i]
//next

if lb_oldredraw<>ib_redraw then uf_setredraw(lb_oldredraw)

return li_ret
end function

public function any uf_values (string ls_names);choose case ls_names
	case 'modified'
		return ib_modified
end choose
end function

public function integer uf_messagebox (string ls_title, string ls_content);return messagebox(ls_title,ls_content)
end function

public function string uf_dataobject (string ls_dataobject);dataobject=ls_dataobject
dynamic event ue_dataobject(ls_dataobject)
return ''
end function

public function integer uf_settransobject ();if isvalid(itrans_current) then return uf_settransobject(itrans_current)
return 0
end function

on uo_derek_datawindow.create
this.u_dd=create u_dd
end on

on uo_derek_datawindow.destroy
destroy(this.u_dd)
end on

event dberror;is_dberror=sqlerrtext

end event

event sqlpreview;if request=PreviewFunctionUpdate!  then
	if ib_updating then
		ibb_sql+=blob(sqlsyntax+' ~r~n')
		return 2
	end if
end if
end event

event resize;//�����С,λ�ü�������Ĵ�С
if i_resizetype=0 then uf_savesize(0)
end event

event clicked;//����Ӷ���Ҫʹ��clicked�¼���ʹ�ö�ѡ����,һ��Ҫreturn AncestorReturnValue
//row=GetClickedRow()
//clicked ����itemerror
//if getfocus()<>this then return 0

string ls_dwotype
string ls_dwoname
string ls_column[]
boolean lb_oldredraw

ls_dwotype=string(dwo.type)
ls_dwoname=string(dwo.name)

if ls_dwoname='datawindow' then ls_dwoname=is_getdwoname

il_clickrow=row
is_clickdwoname=ls_dwoname
	
if row=getrow() then 
	if keydown(keyshift!) then
		if ib_checkrow and is_getdwoname='cp_check' then uf_checkrow(row,is_getdwoname)
		if ib_mulineselect and is_getdwoname='cp_rowno' then uf_selectrow(row,is_getdwoname)
		uf_mouserow(row)
		ib_lbdown=true	//����ڶ����ϰ���
		return 0
	else
		if ib_checkrow then uf_checkrow(row,is_clickdwoname)
		if ib_mulineselect then uf_selectrow(row,is_clickdwoname)
	end if
end if

////��clicked�����󴥷�
post event ue_postclicked(xpos,ypos,row,dwo)

//if ls_dwoname='datawindow' and row>0 then goto e
if ib_modified=true then 
	if GetColumnName()<>ls_dwoname or row<>getrow() then 
		if accepttext()=-1 then goto e //��ֹ����ƿ�,ֵδ����
	end if
end if
//
if getcolumnname()<>ls_dwoname then //��ֹ�ɱ༭�������ѡ��
	if ls_dwotype<>'button' then //�����Ӱ�찴ť�ĵ����¼� [pbm_dwnbuttonclicked]
		post uf_post('setcapture',1) //����API���ж�PB����Ϣ
	end if
end if
//
i_lastdo=i_LBdoing	//��¼������µ�˲��,�ڽű�����ʱpost�ָ�
//
////��¼lb����״̬,mousemove��
ib_lbdown=true	//����ڶ����ϰ���

goto m
m:
post uf_post('lastdo',0)//�ָ������
return 0
e:
//�ָ������
post uf_post('lastdo',0)//�ָ������
return 1

//
//
end event

event doubleclicked;string ls_dwoname

//�����������
if ib_clicksort then
	ls_dwoname=string(dwo.name)
	if ls_dwoname<>'cp_check_t' and ls_dwoname<>'cp_rowno_t' then 	//���кŻ�ѡ��
		uf_clicksort(ls_dwoname)
	end if
end if
end event

event other;if message.number=675 then triggerevent("ue_mouseleave")

end event

event itemfocuschanged;string ls_dwoname
if not isnull(dwo) then ls_dwoname=dwo.name
if ib_mulcellselect then uf_selectcell(row,ls_dwoname)
post selecttext(1,32766)
end event

event losefocus;if ib_LBdown and keydown(keyleftbutton!) then triggerevent ("ue_lbup")

end event

event itemerror;if ib_itemerrored=true then return 1
ib_itemerrored=true
post uf_post('itemerrored',0)
//messagebox('','����:~r~n'+string(data,'')+"~r~nδͨ����֤!")

return 2
end event

event editchanged;
string ls_dwoname
ls_dwoname=string(dwo.name)
if is_mousecolname<>ls_dwoname then 
	//setcolumn(ls_dwoname) //��ֹ����ʱ���δ����������
	event ue_mousefocuschanged(il_mouserow,is_mousecolname,il_mouserow,ls_dwoname)
	is_mousecolname=ls_dwoname
end if
end event

event retrieveend;//��¼��˳��
event ue_dwomove()
end event

event constructor;if dataobject<>'' then dynamic event ue_dataobject(this.dataobject)
end event

event rowfocuschanging;//����һ�����,����ѡ����������
end event

type u_dd from u_derek_v2_dd within uo_derek_datawindow descriptor "pb_nvo" = "true" 
end type

on u_dd.create
call super::create
end on

on u_dd.destroy
call super::destroy
end on

