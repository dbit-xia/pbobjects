$PBExportHeader$uo_runsa_derek_tab.sru
forward
global type uo_runsa_derek_tab from datawindow
end type
end forward

global type uo_runsa_derek_tab from datawindow
integer width = 2203
integer height = 1364
string title = "none"
boolean border = false
boolean livescroll = true
event tabchanged ( integer ai_currentab,  integer ai_newtab )
end type
global uo_runsa_derek_tab uo_runsa_derek_tab

type prototypes
FUNCTION ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"

FUNCTION ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"

end prototypes

type variables

int i_style=1
string is_distabpic="rs_04.gif"
string is_curtabpic="rs_03.gif"
int i_width=133
int i_disheight=49,i_curheight=56
private int i_currenttab=1
private int i_tabnum=2,i_sheetheight_old,i_sheetheight_new
private string is_sheetsname[]
int i_cross=0
private int i_textsize=-9
private string is_facename
int i_texty=22
tab itab
int i_leftmargin,i_rightmargin,i_topmargin,i_bottomMargin
end variables

forward prototypes
public function string getcreatebitmap (string as_pid, string as_picpath, integer ai_x, integer ai_y, integer ai_width, integer ai_height)
public function string dwcreate ()
public function string getcreatebitmap (string as_pid, string as_picpath, integer ai_x, integer ai_y, integer ai_width, integer ai_height, string as_band)
public function string uf_style1 ()
public function string drawtab ()
public function string uf_style2 ()
public function string uf_style0 ()
public subroutine settab (tab a_tab)
public subroutine settab (tab atab, integer ai_style)
end prototypes

event tabchanged(integer ai_currentab, integer ai_newtab);//ѡ�мӴ�

string ls_currentab
string ls_newtab
int i
string ls_modify

if not isvalid(itab) then return 

ls_currentab=string(ai_currentab)
ls_newtab=string(ai_newtab)

setredraw(false)

if ai_currentab>0 then 
	ls_modify+="p_tab"+ls_currentab+".height="+string(i_disheight)+" p_tab"+ls_currentab+".filename='"+is_distabpic+"' "
	if itab.boldselectedtext then ls_modify+="t_tab"+ls_currentab+".font.weight=0 "
end if

ls_modify+="p_tab"+ls_newtab+".height="+string(i_curheight)+" p_tab"+ls_newtab+".filename='"+is_curtabpic+"' "
if itab.boldselectedtext then ls_modify+="t_tab"+ls_newtab+".font.weight=700 "

modify(ls_modify)

////���õ�ǰsheetͼƬ���ö�����
//for i=1 to i_tabnum
//	if i=ai_newtab then continue
//	SetPosition ("p_tab"+string(i),'',false)
//next

//���õ�ǰsheetͼƬ���ö�����
for i=ai_currentab - 1 to 1 step -1
	if i=ai_newtab or is_sheetsname[i]='' then continue
	SetPosition ("p_tab"+string(i),'',true)
	SetPosition ("t_tab"+string(i),'',true)
next

SetPosition ("p_tab"+string(ai_newtab),'',true)
SetPosition ("t_tab"+string(ai_newtab),'',true)

setredraw(true)

//��¼��ǰtab index
i_currenttab=ai_newtab




end event

public function string getcreatebitmap (string as_pid, string as_picpath, integer ai_x, integer ai_y, integer ai_width, integer ai_height);string ls_create
string ls_x,ls_y,ls_width,ls_height

if ai_x=-1 then 
	ls_x=string(width - ai_width)
else
	ls_x=string(ai_x)
end if

if ai_y=-1 then 
	ls_y=string(height - ai_height)
else
	ls_y=string(ai_y)
end if

//��ͼ
ls_create='create bitmap(band=foreground filename="'+as_picpath+'" x="'+string(ai_x)+'" y="'+string(ai_y)+'" height="'+string(ai_height)+'" width="'+string(ai_width)+'" border="0" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" originalsize=no  name='+as_pid+' visible="1" transparency="0" )'

return ls_create 
end function

public function string dwcreate ();string ls_err//553648127
string ls_syntax='release 12;~r~n&
datawindow(units=1 timer_interval=0 color=553648127 brushmode=0 transparency=0 gradient.angle=0 gradient.color=8421504 gradient.focus=0 gradient.repetition.count=0 gradient.repetition.length=100 gradient.repetition.mode=0 gradient.scale=100 gradient.spread=100 gradient.transparency=0 picture.blur=0 picture.clip.bottom=0 picture.clip.left=0 picture.clip.right=0 picture.clip.top=0 picture.mode=0 picture.scale.x=100 picture.scale.y=100 picture.transparency=0 processing=0 HTMLDW=no print.printername="" print.documentname="" print.orientation = 0 print.margin.left = 24 print.margin.right = 24 print.margin.top = 24 print.margin.bottom = 24 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes print.background=no print.preview.background=no print.preview.outline=yes hidegrayline=no showbackcoloronxp=no picture.file="" )~r~n&
header(height=0 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n&
summary(height=0 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n&
footer(height=0 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n&
detail(height=0 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n&
table(column=(type=char(10) updatewhereclause=yes name=a dbname="a" )~r~n&
 )~r~n&
htmltable(border="1" )~r~n&
htmlgen(clientevents="1" clientvalidation="1" clientcomputedfields="1" clientformatting="0" clientscriptable="0" generatejavascript="1" encodeselflinkargs="1" netscapelayers="0" pagingmethod=0 generatedddwframes="1" )~r~n&
xhtmlgen() cssgen(sessionspecific="0" )~r~n&
xmlgen(inline="0" )~r~n&
xsltgen()~r~n&
jsgen()~r~n&
export.xml(headgroups="1" includewhitespace="0" metadatatype=0 savemetadata=0 )~r~n&
import.xml()~r~n&
export.pdf(method=0 distill.custompostscript="0" xslfop.print="0" )~r~n&
export.xhtml()'

create(ls_syntax,ls_err)
return ls_err
end function

public function string getcreatebitmap (string as_pid, string as_picpath, integer ai_x, integer ai_y, integer ai_width, integer ai_height, string as_band);string ls_create
string ls_x,ls_y,ls_width,ls_height

if ai_x=-1 then 
	ls_x=string(width - ai_width)
else
	ls_x=string(ai_x)
end if

if ai_y=-1 then 
	ls_y=string(height - ai_height)
else
	ls_y=string(ai_y)
end if

//��ͼ
ls_create='create bitmap(band='+as_band+' filename="'+as_picpath+'" x="'+string(ai_x)+'" y="'+string(ai_y)+'" height="'+string(ai_height)+'" width="'+string(ai_width)+'" border="0" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" originalsize=no  name='+as_pid+' visible="1" transparency="0" )'

return ls_create 
end function

public function string uf_style1 ();//createbitmap()

string ls_create
int i,ai_num
int l_width,l_height,li_x,li_validindex
//int i_sheetheight_new	//��sheet�ĸ߶�

//���ֵĵ�λ��Ϊ����
is_distabpic = "rs_04.gif" //δѡ��ʱ��ͼƬ
is_curtabpic = "rs_03.gif" //ѡ��ʱ��ͼƬ
i_width = 133 //sheet�Ŀ��
i_disheight = 49 //δѡ��ʱ��ͼƬ�ĸ߶�(��������sheet�ĸ߶�)
i_curheight = 56 //ѡ��ʱ��ͼƬ�ĸ߶�(��������sheet�ĸ߶�)
i_cross = 0 //sheet�����
i_texty = 22 //sheetname������
i_leftmargin = 10 //tabpage����߾�
i_rightmargin = 10 //tabpage���ұ߾�
i_topmargin = 10 //tabpage���ϱ߾�
i_bottommargin = 10 //tabpage���±߾�

ai_num=upperbound(is_sheetsname)

l_width=UnitsToPixels(width,XUnitsToPixels!)
l_height=UnitsToPixels(height,YUnitsToPixels!)

//���Ե���sheet�߶�
i_sheetheight_new=max(i_disheight,i_curheight)  - 7

//��̬�õ�����ͼƬ�ؼ����﷨
ls_create+=getcreatebitmap('p_top_right',"rs_14.gif",l_width - 20,i_sheetheight_new,20,20)	//����
ls_create+=getcreatebitmap('p_bottom_left',"rs_17.gif",0,l_height - 20,20,20)	//����
ls_create+=getcreatebitmap('p_bottom_right',"rs_19.gif",l_width - 20,l_height - 20,20,20)	//����

ls_create+=getcreatebitmap('p_top_middle',"rs_13.gif",0,i_sheetheight_new,l_width - 20,20)	//����
ls_create+=getcreatebitmap('p_bottom_middle',"rs_18.gif",20,l_height - 20,l_width - 20 - 20,20)	//����
ls_create+=getcreatebitmap('p_middle_left',"rs_16.gif",0,i_sheetheight_new + 5,20,l_height - i_sheetheight_new - 20)	//����
ls_create+=getcreatebitmap('p_middle_right',"rs_15.gif",l_width - 20,i_sheetheight_new + 20,20,l_height - i_sheetheight_new - 20 - 20)	//����

//sheet
for i=1 to ai_num
	
	if is_sheetsname[i]='' then continue 
	
	li_validindex++
	
	if i=1 then 
		li_x=0
	else
		li_x=(li_validindex - 1) * i_width - (li_validindex - 1) * i_cross
	end if
	ls_create+=getcreatebitmap('p_tab'+string(i),is_distabpic,li_x ,0,i_width,i_disheight)
	
	ls_create+=' create text(band=foreground  name=t_tab'+string(i)+' alignment="2" text="'+is_sheetsname[i]+'" border="0" color="33554432" x="'+string(li_x)+'" y="'+string(i_texty)+'" height="20" width="'+string(i_width)+'"  visible="1" background.mode="2" background.color="553648127" background.transparency="0"  transparency="0" font.height="'+string(i_textsize)+'" font.face="'+is_facename+'" )'
next

//�����
ls_create+=' create line(band=foreground x1="0" y1="'+string(i_sheetheight_new)+'" x2="0" y2="'+string(i_sheetheight_new + 5)+'"  name=l_left visible="1" pen.style="0" pen.width="1" pen.color="33554432"  background.mode="2" background.color="1073741824" background.transparency="0"  )'

return modify(ls_create)

end function

public function string drawtab ();string ls_ret

//���õķ��
choose case i_style
	case 1 
		ls_ret=uf_style1()
	case 2
		ls_ret=uf_style2()
	case else
		ls_ret=uf_style0()
end choose

return ls_ret
end function

public function string uf_style2 ();//createbitmap()

string ls_create
int i,ai_num
int l_width,l_height,li_x,li_validindex
//int i_sheetheight_new	//��sheet�ĸ߶�

//���ֵĵ�λ��Ϊ����
is_distabpic = "rsmain_tab02.png" //δѡ��ʱ��ͼƬ
is_curtabpic = "rsmain_tab01.png" //ѡ��ʱ��ͼƬ
i_width = 121 //sheet�Ŀ��
i_disheight = 25 //δѡ��ʱ��ͼƬ�ĸ߶�(��������sheet�ĸ߶�)
i_curheight = 25 //ѡ��ʱ��ͼƬ�ĸ߶�(��������sheet�ĸ߶�)
i_cross = 10 //sheet�����
i_texty = 5 //sheetname������
i_leftmargin = 5 //tabpage����߾�
i_rightmargin = 5 //tabpage���ұ߾�
i_topmargin = 5 //tabpage���ϱ߾�
i_bottommargin = 5 //tabpage���±߾�


ai_num=upperbound(is_sheetsname)

l_width=UnitsToPixels(width,XUnitsToPixels!)
l_height=UnitsToPixels(height,YUnitsToPixels!)

//���Ե���sheet�߶�
i_sheetheight_new=max(i_disheight,i_curheight) - 1

////��̬�õ�����ͼƬ�ؼ����﷨
//ls_create+=getcreatebitmap('p_top_right',"rs_14.gif",l_width - 20,i_sheetheight_new,20,20)	//����
//ls_create+=getcreatebitmap('p_bottom_left',"rsmain_tab_left.gif",0,l_height - 10,10,10)	//����
//ls_create+=getcreatebitmap('p_bottom_right',"rsmain_tab_left.gif",l_width - 10,l_height - 10,10,10)	//����
//
//ls_create+=getcreatebitmap('p_top_middle',"rs_13.gif",0,i_sheetheight_new,l_width - 20,20)	//����
//ls_create+=getcreatebitmap('p_bottom_middle',"rs_18.gif",20,l_height - 20,l_width - 20 - 20,20)	//����
//ls_create+=getcreatebitmap('p_middle_left',"rs_16.gif",0,i_sheetheight_new + 5,20,l_height - i_sheetheight_new - 20)	//����
//ls_create+=getcreatebitmap('p_middle_right',"rs_15.gif",l_width - 20,i_sheetheight_new + 20,20,l_height - i_sheetheight_new - 20 - 20)	//����
//
//sheet
for i=1 to ai_num
	if is_sheetsname[i]='' then continue 
	
	li_validindex++
	
	if i=1 then 
		li_x=0
	else
		li_x=(li_validindex - 1) * i_width - (li_validindex - 1) * i_cross
	end if
	ls_create+=getcreatebitmap('p_tab'+string(i),is_distabpic,li_x ,0,i_width,i_disheight)
	
	ls_create+=' create text(band=foreground  name=t_tab'+string(i)+' alignment="2" text="'+is_sheetsname[i]+'" border="0" color="33554432" x="'+string(li_x)+'" y="'+string(i_texty)+'" height="20" width="'+string(i_width)+'"  visible="1" background.mode="2" background.color="553648127" background.transparency="0"  transparency="0" font.height="'+string(i_textsize)+'" font.face="'+is_facename+'" )'
next

//�����
ls_create+=' create rectangle(band=foreground x="0" y="'+string(i_sheetheight_new)+'" height="'+string(l_height - i_sheetheight_new)+'" width="'+string(l_width)+'"  name=r_bkg visible="1" brush.hatch="6" brush.color="16777215" pen.style="0" pen.width="1" pen.color="134217751~trgb(119,160,171)"  background.mode="2" background.color="33554432" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" ) '
ls_create+=getcreatebitmap('p_bottom_left',"rsmain_tab_left.gif",0,l_height - 10,10,10)	//����
ls_create+=getcreatebitmap('p_bottom_right',"rsmain_tab_right.gif",l_width - 10,l_height - 10,10,10)	//����
return modify(ls_create)

end function

public function string uf_style0 ();//createbitmap()

string ls_create
int i,ai_num
int l_width,l_height,li_x,li_validindex
//int i_sheetheight_new	//��sheet�ĸ߶�

ai_num=upperbound(is_sheetsname)

l_width=UnitsToPixels(width,XUnitsToPixels!)
l_height=UnitsToPixels(height,YUnitsToPixels!)

//���Ե���sheet�߶�
i_sheetheight_new=max(i_disheight,i_curheight) - 1

//��̬�õ�����ͼƬ�ؼ����﷨
ls_create+=getcreatebitmap('p_top_right',"rs_14.gif",l_width - 20,i_sheetheight_new,20,20)	//����
ls_create+=getcreatebitmap('p_bottom_left',"rs_17.gif",0,l_height - 20,20,20)	//����
ls_create+=getcreatebitmap('p_bottom_right',"rs_19.gif",l_width - 20,l_height - 20,20,20)	//����

ls_create+=getcreatebitmap('p_top_middle',"rs_13.gif",0,i_sheetheight_new,l_width - 20,20)	//����
ls_create+=getcreatebitmap('p_bottom_middle',"rs_18.gif",20,l_height - 20,l_width - 20 - 20,20)	//����
ls_create+=getcreatebitmap('p_middle_left',"rs_16.gif",0,i_sheetheight_new + 5,20,l_height - i_sheetheight_new - 20)	//����
ls_create+=getcreatebitmap('p_middle_right',"rs_15.gif",l_width - 20,i_sheetheight_new + 20,20,l_height - i_sheetheight_new - 20 - 20)	//����

//sheet
for i=1 to ai_num
	
	if is_sheetsname[i]='' then continue 
	
	li_validindex++
	
	if i=1 then 
		li_x=0
	else
		li_x=(li_validindex - 1) * i_width - (li_validindex - 1) * i_cross
	end if
	
	ls_create+=getcreatebitmap('p_tab'+string(i),is_distabpic,li_x ,0,i_width,i_disheight)
	
	ls_create+=' create text(band=foreground  name=t_tab'+string(i)+' alignment="2" text="'+is_sheetsname[i]+'" border="0" color="33554432" x="'+string(li_x)+'" y="'+string(i_texty)+'" height="20" width="'+string(i_width)+'"  visible="1" background.mode="2" background.color="553648127" background.transparency="0"  transparency="0" font.height="'+string(i_textsize)+'" font.face="'+is_facename+'" )'
next

//�����
ls_create+=' create line(band=foreground x1="0" y1="'+string(i_sheetheight_new)+'" x2="0" y2="'+string(i_sheetheight_new + 5)+'"  name=l_left visible="1" pen.style="0" pen.width="1" pen.color="33554432"  background.mode="2" background.color="1073741824" background.transparency="0"  )'

return modify(ls_create)

end function

public subroutine settab (tab a_tab);int l_sheetnum/*sheet�ĸ���*/,i
int width1,height1,l_tabpage1x,l_tabpage1y
long rgnh

if not isvalid(a_tab) then return 

itab=a_tab
i_currenttab=itab.selectedtab	//��ǰtabindex
i_textsize=itab.textsize
is_facename=itab.facename
i_sheetheight_old=itab.control[1].y	//tabpage��y,��sheet�ĸ߶�

//tab��sheet����
i_tabnum=upperbound(itab.control[])
for i=1 to i_tabnum
	if itab.control[i].visible=false then 
		is_sheetsname[upperbound(is_sheetsname) + 1]=''
		continue
	end if
	is_sheetsname[upperbound(is_sheetsname) + 1]=itab.control[i].text
//	itab.control[i].backcolor=8902391	//247,214,135 ������ɫ�����ݴ���ͬһ��ɫ
next


setredraw(false)

//������tab��λ�úʹ�С
move(itab.x,itab.y)
resize(itab.width,itab.height)

//�����ݴ���
dwcreate()

//�������ݴ��ڵĴ�С�л滭���µ�sheet
drawtab()

//��tab�ö�
for i=i_tabnum to 1 step -1
	if is_sheetsname[i]='' then continue
	SetPosition ("p_tab"+string(i),'',true)
	SetPosition ("t_tab"+string(i),'',true)
next

//������tab��λ�úʹ�С
itab.move(itab.x - itab.control[1].x + PixelsToUnits ( i_leftmargin, xPixelsToUnits! ),itab.y -  i_sheetheight_old + (PixelsToUnits (i_sheetheight_new + i_topmargin , YPixelsToUnits! ) ))
itab.resize(itab.width + (itab.width - itab.control[1].width) - PixelsToUnits ( i_leftmargin + i_rightmargin, xPixelsToUnits! ),itab.height + (itab.height - itab.control[1].height) - PixelsToUnits ( i_sheetheight_new + i_topmargin + i_bottommargin, YPixelsToUnits! ))

//(PixelsToUnits (i_sheetheight_new, YPixelsToUnits! ) -  i_sheetheight_old) - PixelsToUnits ( i_topmargin + i_bottommargin, YPixelsToUnits! ) + 18

//��tab��sheet�����APIĨ��
l_tabpage1x=UnitsToPixels(itab.control[1].x,XUnitsToPixels!)
l_tabpage1y=UnitsToPixels(itab.control[1].y,YUnitsToPixels!)

width1=UnitsToPixels(itab.control[1].width,XUnitsToPixels!)
height1=UnitsToPixels(itab.control[1].height,YUnitsToPixels!)

rgnh = CreateRoundRectRgn(l_tabpage1x,l_tabpage1y ,l_tabpage1x + width1,l_tabpage1y + height1,0,0)//�������ʵ���������Ӧ��ť��ͼƬ
SetWindowRgn(handle(itab), rgnh, true)	//Ҫ����Ϊtrue,������ܻ��в�Ӱ

itab.bringtotop=true

setredraw(true)
end subroutine

public subroutine settab (tab atab, integer ai_style);i_style=ai_style
settab(atab)
end subroutine

on uo_runsa_derek_tab.create
end on

on uo_runsa_derek_tab.destroy
end on

event clicked;string ls_dwoname
int li_newtab

//�õ������sheet index
if  dwo.type='bitmap' or dwo.type='text' then  
	ls_dwoname=string(dwo.name)
	//��sheetͼƬ��sheetname
	if left(ls_dwoname,5)="p_tab" or left(ls_dwoname,5)="t_tab"  then
		li_newtab=integer(mid(ls_dwoname,6))
		//�޸�tab��selectindex
		if isvalid(itab) then itab.SelectedTab = li_newtab
	end if
else
	return 
end if

end event

event other;//��ֹ���zoom
if message.number = 522 and keydown(keycontrol!) then return 1
end event

