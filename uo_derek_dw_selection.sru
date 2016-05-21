$PBExportHeader$uo_derek_dw_selection.sru
forward
global type uo_derek_dw_selection from datawindow
end type
type u_dd from u_derek_v2_dd within uo_derek_dw_selection
end type
end forward

global type uo_derek_dw_selection from datawindow
integer width = 1582
integer height = 1504
boolean titlebar = true
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
string icon = "DosEdit5!"
boolean livescroll = true
event ue_enter pbm_dwnprocessenter
u_dd u_dd
end type
global uo_derek_dw_selection uo_derek_dw_selection

type variables
dragobject idragobj
string is_refield,is_column[]
string is_fieldtype='' //column/expression
end variables

forward prototypes
public function string uf_setstyle (integer ai_style)
public subroutine uf_clicksort (string as_dwoname)
public function string getquery (powerobject dd, string as_sql, transaction at_sqlca)
public subroutine uf_initial ()
end prototypes

event ue_enter;if getrow()>0 then 
	event doubleclicked(0,0,getrow(),object.datawindow)
end if
end event

public function string uf_setstyle (integer ai_style);//设置颜色风格等
string ls_modify,ls_ret
string ls_column[],ls_columns,ls_column_t[]
int i
string ls_errtext

choose case ai_style
	case 1
		ls_modify="DataWindow.color=67108864 datawindow.transparency=0 "

		ls_column[]=u_dd.getcolumns(this,0)
		
		for i=1 to upperbound(ls_column[])
			ls_columns+=ls_column[i]+','
			ls_column_t[i]=ls_column[i]+'_t'
		next
		
		ls_modify+="DataWindow.HTMLTable.GenerateCSS='1' "	//保持格式及颜色
		ls_modify+="DataWindow.HTMLTable.Border='0' "	//不要table边框
		ls_modify+="DataWindow.HTMLTable.CellSpacing='0' "	//单元格无间距
		ls_modify+="DataWindow.header.height='25' "	//单元格无间距
		//ls_modify+="DataWindow.HTMLTable.CellPadding='0' "
		//ls_modify+="DataWindow.HTMLTable.NoWrap='0' "
		
		//标题设置
		ls_modify+=u_dd.getattribstring( ls_column_t,'height',"25")
		ls_modify+=u_dd.getattribstring( ls_column_t,'Border',"0")
		
		ls_modify+=u_dd.getattribstring( ls_columns,'edit.DisplayOnly','yes') //只读
		ls_modify+=u_dd.getattribstring( ls_columns,'Border',"0")
		ls_modify+=u_dd.getattribstring( ls_columns,"Color",'0~tif(isRowModified(),rgb(225,0,0),rgb(0,0,0))' )
		ls_modify+=u_dd.getattribstring( ls_columns,'Y',"0")
		ls_modify+=u_dd.getattribstring( ls_columns,'height',"20~~trowheight() - 0")
		ls_modify+=u_dd.getattribstring( ls_columns,'Background.Color',"16777215~~tif(getrow()=currentrow(),rgb(255,255,225),rgb(255,255,255))")
		
		
		
		//行号
		ls_ret=this.dynamic describe("cp_rowno.name")
		if ls_ret='!' then 
			ls_modify+='create compute(band=detail alignment="2" expression="getrow()"border="0" color="0" x="0" y="0" height="20~~trowheight() - 0" width="0" format="[GENERAL]" html.valueishtml="0"  name=cp_rowno visible="1"  font.face="Tahoma" font.height="-9" background.color="553648127" transparency="0" ) '
		else
			ls_modify+='cp_rowno.border="0" cp_rowno.height="20~~trowheight() - 0" cp_rowno.background.color="553648127" ' //67108864
		end if

		ls_errtext=this.dynamic modify(ls_modify)

end choose 
	
return ls_errtext


end function

public subroutine uf_clicksort (string as_dwoname);//单击排序功能,支持+ctrl多列排序

string ls_dwoname,ls_colname,ls_coltype,ls_colid
int li_pos,li_pos2
string ls_sort,ls_str,ls_sort_temp

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
	//进行排序
	setsort(ls_sort_temp)
	setredraw(false)
	sort()
	setredraw(true)
end if
		

end subroutine

public function string getquery (powerobject dd, string as_sql, transaction at_sqlca);//根据sql语句创建一个grid风格数据窗口,返回错误原因,''为成功
//得到一个可以查询的数据窗口/datastore

string l_syntax,l_err=''
l_syntax=at_sqlca.syntaxfromsql(as_sql,&
"style(type=grid Detail_Bottom_Margin=0 Detail_Top_Margin=0 Header_Bottom_Margin=1 Header_Top_Margin=1) &
datawindow(units=1 Message.Title='Message' ) &
Text(Font.Face='Arial' Font.Height=-9 Background.Color=15853276 Background.Mode=0 Border=2 ) &
Column(Background.Mode=0 Font.Face='Arial' Font.Height=-9 ) ",l_err)
if len(l_err)>0 then
	goto e
end if

dd.dynamic create(l_syntax,l_err)
if len(l_err)>0 then
	goto e
end if

return ''

e:
return l_err
end function

public subroutine uf_initial ();is_refield=''
is_column[]={''}
is_fieldtype='' 
end subroutine

on uo_derek_dw_selection.create
this.u_dd=create u_dd
end on

on uo_derek_dw_selection.destroy
destroy(this.u_dd)
end on

event doubleclicked;string ls_errtext
string ls_text
long l_ret
string ls_dwoname

datawindow ldw
singlelineedit lsle
EditMask lem


if row<=0 then 
	//点击标题排序
	ls_dwoname=string(dwo.name)
	if ls_dwoname<>'cp_check_t' or ls_dwoname<>'cp_rowno_t' then 	//非行号或勾选框
		uf_clicksort(ls_dwoname)
	end if
	return 
end if

if is_refield='' then return 
if isvalid(idragobj)=false then return 

ls_text=describe("evaluate(~""+is_refield+"~","+string(row)+")")

choose case typeof(idragobj) 
	case singlelineedit!
		lsle=idragobj
		lsle.text=ls_text
		lsle.event Modified()
	case editmask!
		lem=idragobj
		lem.text=ls_text
		lem.event Modified()
	case datawindow!
		ldw=idragobj
		ldw.settext(ls_text)
		ldw.accepttext()
end choose

//设置
idragobj.setfocus()

//hide()


end event

event losefocus;hide()
end event

event clicked;setrow(row)
end event

event rbuttondown;
string ls_function='f_wgz_zg_sort'
function_object lfo_rsd
if not isnull(FindClassDefinition(ls_function)) then //是否存在函数 
	lfo_rsd=create using ls_function
	lfo_rsd.dynamic f_wgz_zg_sort(this,'')
	if isvalid(lfo_rsd) then destroy lfo_rsd
	return 1
end if

if not isnull(FindClassDefinition("m_dw")) then //是否存在函数 
	menu lmenu
	lmenu=create using 'm_dw'
	lmenu.dynamic uf_setdw(this,'text') 
	destroy lmenu
end if
end event

type u_dd from u_derek_v2_dd within uo_derek_dw_selection descriptor "pb_nvo" = "true" 
end type

on u_dd.create
call super::create
end on

on u_dd.destroy
call super::destroy
end on

