$PBExportHeader$u_runsa_derek_dw2.sru
$PBExportComments$选择商品规格的用户对象
forward
global type u_runsa_derek_dw2 from datawindow
end type
end forward

global type u_runsa_derek_dw2 from datawindow
integer width = 2766
integer height = 1324
string title = "none"
borderstyle borderstyle = stylelowered!
event ue_lbup pbm_dwnlbuttonup
event ue_pagechanged ( integer al_row )
event ue_constructor ( )
end type
global u_runsa_derek_dw2 u_runsa_derek_dw2

type variables

u_runsa_derek_pic2 p_pageup	//上一页图片
u_runsa_derek_pic2 p_pagedown
end variables

event ue_lbup;modify("p_pageup.filename='rm_24.gif'")
modify("p_pagedown.filename='rm_28.gif'")
end event

event ue_pagechanged(integer al_row);//int li_page,li_pagecount
//li_page=integer(this.Describe("evaluate('page()',"+string(al_row)+")"))
//li_pagecount=integer(this.Describe("evaluate('pagecount()',0)"))
//
//if isvalid(p_pageup)=false or isvalid(p_pagedown)=false then return 
//
//
////messagebox('',string(li_page)+string(li_pagecount))
//if li_pagecount>1 then
//	if li_page<=1 then 
//		p_pageup.enabled=false
//		p_pagedown.enabled=true
//	elseif  li_page<li_pagecount  then
//		p_pageup.enabled=true
//		p_pagedown.enabled=true 
//	else
//		p_pageup.enabled=true
//		p_pagedown.enabled=false
//	end if
//else
//	p_pageup.enabled=false
//	p_pagedown.enabled=false
//end if
//
end event

event ue_constructor();if isvalid(p_pageup) then p_pageup.idw=this
if isvalid(p_pagedown) then p_pagedown.idw=this
end event

on u_runsa_derek_dw2.create
end on

on u_runsa_derek_dw2.destroy
end on

event constructor;post event ue_constructor()

end event

event other;if message.number = 522 then return 1 //禁止鼠标中轮
end event

event retrieveend;event ue_pagechanged(0)
end event

event scrollvertical;if long(object.datawindow.lastRowOnPage)=rowcount() then 
	p_pagedown.enabled=false
else
	p_pagedown.enabled=true
end if
if long(object.datawindow.firstRowOnPage)<=1 then 
	p_pageup.enabled=false
else
	p_pageup.enabled=true
end if

//enabled
end event

