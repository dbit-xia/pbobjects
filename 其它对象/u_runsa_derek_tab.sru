$PBExportHeader$u_runsa_derek_tab.sru
forward
global type u_runsa_derek_tab from datawindow
end type
end forward

global type u_runsa_derek_tab from datawindow
integer width = 2203
integer height = 1364
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event type integer tabchanging ( integer ai_currentab,  integer ai_newtab )
event type integer tabchanged ( integer ai_currentab,  integer ai_newtab )
event ue_constructor ( )
end type
global u_runsa_derek_tab u_runsa_derek_tab

type prototypes
FUNCTION ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"

FUNCTION ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"

end prototypes

type variables
string is_distabpic="rs_04.gif"
string is_curtabpic="rs_03.gif"
int i_width=133
int i_disheight=49,i_curheight=56
int i_currenttab=1
int i_tabnum=2
string is_sheetsname[]

tab itab

end variables

forward prototypes
public function string getcreatebitmap (string as_pid, string as_picpath, integer ai_x, integer ai_y, integer ai_width, integer ai_height)
public function string drawtab (string as_sheetsname[])
public function string dwcreate ()
public function any settab (tab a_tab)
public function string getcreatebitmap (string as_pid, string as_picpath, integer ai_x, integer ai_y, integer ai_width, integer ai_height, string as_band)
end prototypes

event type integer tabchanged(integer ai_currentab, integer ai_newtab);string ls_currentab
string ls_newtab

if ai_currentab=ai_newtab then return 0

if event tabchanging(ai_currentab,ai_newtab)=1 then return 1

ls_currentab=string(ai_currentab)
ls_newtab=string(ai_newtab)

if ai_currentab<>0 then 
	modify("p_tab"+ls_currentab+".height="+string(i_disheight)+" p_tab"+ls_currentab+".filename='"+is_distabpic+"'")
end if

modify("p_tab"+ls_newtab+".height="+string(i_curheight)+" p_tab"+ls_newtab+".filename='"+is_curtabpic+"'")

i_currenttab=ai_newtab

if isvalid(itab) then itab.selectedtab=i_currenttab
end event

event ue_constructor();ulong width1,height1,rgnh;
ulong l_tabpage1x,l_tabpage1y

setredraw(false)

dwcreate()
bringtotop=true
settab(itab)
drawtab(is_sheetsname)


if isvalid(itab) then 

	width1=UnitsToPixels(width,XUnitsToPixels!)
	height1=UnitsToPixels(height,YUnitsToPixels!)
	
	l_tabpage1x=UnitsToPixels(itab.control[1].x,XUnitsToPixels!)
	l_tabpage1y=UnitsToPixels(itab.control[1].y,YUnitsToPixels!)
	
	rgnh = CreateRoundRectRgn(l_tabpage1x,l_tabpage1y , width1 - l_tabpage1x - 15 , height1 - l_tabpage1y - 25,0,0)//参数可适当调整以适应按钮的图片
	SetWindowRgn(handle(itab), rgnh, True)
	itab.bringtotop=true
	
end if
event tabchanged(0,i_currenttab)

setredraw(true)

//messagebox('',::clipboard(string(object.datawindow.syntax)))


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

//画图
ls_create='create bitmap(band=foreground filename="'+as_picpath+'" x="'+string(ai_x)+'" y="'+string(ai_y)+'" height="'+string(ai_height)+'" width="'+string(ai_width)+'" border="0" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" originalsize=no  name='+as_pid+' visible="1" transparency="0" )'

return ls_create 
end function

public function string drawtab (string as_sheetsname[]);//createbitmap()

string ls_create
int i,ai_num
int l_width,l_height
string ls_sheetsname[]
ls_sheetsname=as_sheetsname[]

ai_num=upperbound(ls_sheetsname)

l_width=UnitsToPixels(width,XUnitsToPixels!)
l_height=UnitsToPixels(height,YUnitsToPixels!)

//i_disheight
ls_create+=getcreatebitmap('p_top_right',"rs_14.gif",l_width - 20,i_disheight,20,20)	//右上
ls_create+=getcreatebitmap('p_bottom_left',"rs_17.gif",0,l_height - 20,20,20)	//左下
ls_create+=getcreatebitmap('p_bottom_right',"rs_19.gif",l_width - 20,l_height - 20,20,20)	//右下

ls_create+=getcreatebitmap('p_top_middle',"rs_13.gif",0,i_disheight,l_width - 20,20)	//上中
ls_create+=getcreatebitmap('p_bottom_middle',"rs_18.gif",20,l_height - 20,l_width - 20 - 20,20)	//下中
ls_create+=getcreatebitmap('p_middle_left',"rs_16.gif",0,i_disheight + 5,20,l_height - i_disheight - 20)	//左中
ls_create+=getcreatebitmap('p_middle_right',"rs_15.gif",l_width - 20,i_disheight + 20,20,l_height - i_disheight - 20 - 20)	//右中

//sheet
for i=1 to ai_num
	ls_create+=getcreatebitmap('p_tab'+string(i),is_distabpic,(i - 1) * i_width ,0,i_width,i_disheight)
	ls_create+=' create text(band=foreground  name=t_tab'+string(i)+' alignment="2" text="'+ls_sheetsname[i]+'" border="0" color="33554432" x="'+string((i - 1) * i_width)+'" y="21" height="20" width="'+string(i_width)+'"  visible="1" background.mode="2" background.color="553648127" background.transparency="0"  transparency="0" )'
next
//font.face="Tahoma" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0"

//左边线
ls_create+=' create line(band=foreground x1="0" y1="'+string(i_disheight)+'" x2="0" y2="'+string(i_disheight + 5)+'"  name=l_left visible="1" pen.style="0" pen.width="1" pen.color="33554432"  background.mode="2" background.color="1073741824" background.transparency="0"  )'

//messagebox('',ls_create)

return modify(ls_create)

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

public function any settab (tab a_tab);int l_sheetnum,i
if not isvalid(a_tab) then return  is_sheetsname
l_sheetnum=upperbound(a_tab.control[])
for i=1 to l_sheetnum
	if a_tab.control[i].visible=false then continue
	is_sheetsname[upperbound(is_sheetsname) + 1]=a_tab.control[i].text
	a_tab.control[i].backcolor=8902391	//247,214,135 背景颜色和数据窗口同一颜色
next
move(a_tab.x,a_tab.y)
resize(a_tab.width,a_tab.height)

a_tab.move(a_tab.x + (50 - a_tab.control[1].x),a_tab.y + (250 - a_tab.control[1].y))


return is_sheetsname


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

//画图
ls_create='create bitmap(band='+as_band+' filename="'+as_picpath+'" x="'+string(ai_x)+'" y="'+string(ai_y)+'" height="'+string(ai_height)+'" width="'+string(ai_width)+'" border="0" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" originalsize=no  name='+as_pid+' visible="1" transparency="0" )'

return ls_create 
end function

on u_runsa_derek_tab.create
end on

on u_runsa_derek_tab.destroy
end on

event clicked;string ls_dwoname
int li_newtab

if  dwo.type='bitmap' or dwo.type='text' then  
	ls_dwoname=string(dwo.name)
	if left(ls_dwoname,5)="p_tab" or left(ls_dwoname,5)="t_tab"  then
		li_newtab=integer(mid(ls_dwoname,6))
		event tabchanged(i_currenttab,li_newtab)
	end if
else
	return 
end if

end event

event constructor;post event ue_constructor()
end event

