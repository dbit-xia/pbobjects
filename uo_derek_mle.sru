$PBExportHeader$uo_derek_mle.sru
forward
global type uo_derek_mle from multilineedit
end type
end forward

global type uo_derek_mle from multilineedit
integer width = 421
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
event ue_keydown pbm_keydown
event type integer ue_enter ( )
event ue_afteropen ( )
event ue_ncpaint pbm_ncpaint
event type string ue_getlistsql ( )
event parentresize ( long newwidth,  long newheight )
event ue_move pbm_move
event ue_resize pbm_size
event ue_dropfiles pbm_dropfiles
end type
global uo_derek_mle uo_derek_mle

type prototypes
Function ulong GetModuleFileName(ulong hModule,ref string lpFileName,ulong nSize) LIBRARY "kernel32.dll" ALIAS FOR "GetModuleFileNameA;ansi"
subroutine DragAcceptFiles(ulong hndle, boolean bflag ) library 'shell32.dll' alias for "DragAcceptFiles;ansi"
function ulong DragQueryFile( ulong ul_Drop, ulong ul_index, ref string LPTSTR, ulong cb ) library 'shell32.dll' alias for "DragQueryFileA;Ansi" 
Subroutine DragFinish(ULong hDrop) Library "Shell32.dll"

Function Long GlobalUnlock   (long hMem ) Library "kernel32" alias for "GlobalUnlock;ansi"

Function long OpenClipboard (long hwnd )  Library "user32" alias for "OpenClipboard;ansi"
Function long CloseClipboard()  Library "user32"  alias for "CloseClipboard;ansi"
Function long GetClipboardData(long wFormat )  Library "user32" alias for "GetClipboardData;ansi"
end prototypes

type variables
private long x0,y0	//����λ��
private long width0,height0	//�����С
private long il_parentwidth,il_parentheight	//���游�����С
private int i_resizetype	//1 Ϊ������resize,0 Ϊ�Լ�resize
private:
string is_inifile_ctrl
window iw_parent
listbox ilb_add
string is_oldtext
//���ڰ��¼�
string is_lastdo
boolean ib_initialized

public:
boolean ib_memory=true
//����Ӧ��С����
//�Ȳ�
boolean xed,yed
boolean heighted,widthed
boolean xer,yer
boolean heighter,widther

protected:
boolean ib_dropfiles=false

private:
long CF_HDROP=15


end variables

forward prototypes
public function integer settext (string as_text)
public function int uf_post (string as_var, any a_value)
public subroutine uf_savesize (integer ai_type)
public function string uf_clipfiles (ref string ls_files[])
public function integer replaceex (ref string ls_text, character as_str1[], character as_str2[])
end prototypes

event ue_keydown;string ls_files[],ls_text
long i

if key=keyenter! then 
	return event ue_enter()
end if

if key=keyA! and keyflags=2 then 
	selecttext(1,len(text))
end if

if key=keyV! and keyflags=2 then 
	if ib_dropfiles=true and clipboard()='' then 
		uf_Clipfiles(ls_files[])
		if upperbound(ls_files[])>0 then 
			for i=1 to upperbound(ls_files[])
				if i<>1 then ls_text+='~r~n'
				ls_text+=ls_files[i]
			next
			if enabled=true and displayonly=false then settext(ls_text)
		end if
	end if
end if
end event

event type integer ue_enter();if is_oldtext<>text then event modified()
return 0
end event

event ue_afteropen();if ib_dropfiles=true then DragAcceptFiles(handle(this),true)

powerobject lpo

string ls_Path 
ulong lul_handle,ul_size=1024
string ls_text

ls_Path = space(1024) 
lul_handle = Handle(GetApplication()) 
GetModuleFilename(lul_handle, ls_Path, ul_size) 
ls_Path=mid(ls_Path,1,lastpos(ls_Path,'\'))

is_inifile_ctrl=ls_Path+"control.ini"

lpo=this
//������������
do 
	lpo=lpo.getparent()
loop until typeof(lpo)=window! 

iw_parent=lpo
if ib_memory then 
	ls_text=profilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),text)
	replaceex(ls_text,'~~r','~r')
	replaceex(ls_text,'~~n','~n')
	//Ĭ��ȡ��ʼֵ
	text=ls_text
end if
is_oldtext=text

ib_initialized=true
end event

event ue_ncpaint;if ib_initialized=false then event ue_afteropen()
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

event ue_move;//�����С,λ�ü�������Ĵ�С
if i_resizetype=0 then uf_savesize(2)
end event

event ue_resize;//�����С,λ�ü�������Ĵ�С
if i_resizetype=0 then uf_savesize(0)
end event

event ue_dropfiles;/*win8 ��������Թ���Ա��explorer�ǹ���Ա��ʽ����ʱ,���ܴ������¼�*/

string ls_name,ls_text
long li_count,l_index
// first get the number of files, use as index -1
li_count = DragQueryFile(handle,-1,ls_name,0)
// allocate some space
if li_count>0 then 
	for l_index=1 to li_count
		ls_name= space(255) 
		DragQueryFile(handle,l_index - 1,ls_name,255);
		if l_index<>1 then ls_text+='~r~n'
		ls_text+=ls_name
	next
	
	if this.enabled=true and this.displayonly=false then settext(ls_text)
end if
DragFinish(handle)
end event

public function integer settext (string as_text);text=as_text
return event modified()
end function

public function int uf_post (string as_var, any a_value);choose case lower(as_var)
	case 'is_oldtext'
		is_oldtext=a_value
	case 'lastdo'
		is_lastdo=a_value
end choose

return 0
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

public function string uf_clipfiles (ref string ls_files[]);long lHandle ,lHandle2
Long lpResults
Long lRet 
Long i 
long l_openclip,l_ret
string ls_errtext,ls_null
long l_count,l_index
setnull(ls_null)

try
	l_openclip=OpenClipboard(0)
	If l_openclip<=0 Then
		ls_errtext+="OpenClipboard:"+string(l_openclip)+'~r~n'
		throw create runtimeerror
	end if

	lHandle = GetClipboardData(CF_HDROP)
	If lHandle = 0 Then 
		throw create runtimeerror //������
	end if
	
	If lHandle < 0 Then
		ls_errtext+="GetClipboardData:"+string(lHandle)+'~r~n'
		throw create runtimeerror
	end if 
	   
	l_count=DragQueryFile(lHandle,-1,ls_null,0);
	for l_index=1 to l_count
		ls_files[l_index]= space(255) 
		l_ret=DragQueryFile(lHandle,l_index - 1,ls_files[l_index],255);
	next

catch (runtimeerror e)
	ls_errtext+=e.getmessage()
finally
	if lHandle>0 then GlobalUnlock (lHandle)
	if l_openclip>0 then CloseClipboard()
end try

return ls_errtext
end function

public function integer replaceex (ref string ls_text, character as_str1[], character as_str2[]);//�ַ����滻����
//����1:���ñ���,�������ַ���
//����2:Ҫ�滻���ַ�
//����3:Ŀ���ַ�
//����ֵ:�滻�ɹ�����Ŀ

long li_pos,i,l_len,l_index
int li_len1,li_len2,li_matchindex=1 /*����λ��*/
char lc_char[]
li_len1=upperbound(as_str1[])
li_len2=upperbound(as_str2[])

if li_len1=li_len2 then //�ȳ�,��ʹ��char[]���ҷ�
	lc_char[]=ls_text
	l_len=upperbound(lc_char[])
	li_matchindex=1
	if as_str1[]=as_str2[] then //�ַ������,��ֻ���Ҹ���
		for l_index=1 to l_len
			if lc_char[l_index]=as_str1[li_matchindex] then 
				if li_len1=li_matchindex then 
					i++
				else
					li_matchindex++
					continue;
				end if
			end if 
			if li_matchindex>1 then l_index=l_index - li_matchindex + 1
			li_matchindex=1
		next
	else //�滻
		for l_index=1 to l_len
			if lc_char[l_index]=as_str1[li_matchindex] then 
				if li_len1=li_matchindex then 
					for li_matchindex=li_matchindex - 1 to 0 step -1
						lc_char[l_index - li_matchindex]=as_str2[li_len1 - li_matchindex]
					next
					i++
				else
					li_matchindex++
					continue;
				end if
			end if 
			if li_matchindex>1 then l_index=l_index - li_matchindex + 1
			li_matchindex=1
		next
		ls_text=lc_char[] //�����滻���
	end if
	
else //�ǵȳ��滻,Ч�ʵ�
	li_pos=Pos(ls_text,as_str1,1)
	//�滻
	do while(li_pos>0)
		i++
		ls_text=Replace(ls_text,li_pos,li_len1,as_str2)
		li_pos=Pos(ls_text,as_str1,li_pos + li_len2 )
	loop
end if


////�����һ���ַ�,��ʹ��char������в���/�滻
//if li_len1=1 and li_len2=1 then 
//	lc_char[]=ls_text
//	l_len=upperbound(lc_char[])
//	if as_str1=as_str2 then //�����滻,���ǲ��Ҹ���
//		for l_index=1 to l_len
//			if lc_char[l_index]=as_str1[l_index] then i++
//		next
//	else	//�滻
//		for l_index=1 to l_len
//			if lc_char[l_index]=as_str1 then 
//				i++
//				lc_char[l_index]=as_str2
//			end if
//		next
//		ls_text=lc_char[]
//	end if
//	
//else
//	li_pos=Pos(ls_text,as_str1,1)
//	if as_str1=as_str2 then //�����滻,���ǲ��Ҹ���
//		do while(li_pos>0)
//			i++
//			li_pos=Pos(ls_text,as_str1,li_pos + li_len2  )
//		loop
//	else	//�滻
//		do while(li_pos>0)
//			i++
//			ls_text=Replace(ls_text,li_pos,li_len1,as_str2)
//			li_pos=Pos(ls_text,as_str1,li_pos + li_len2 )
//		loop
//	end if
//end if
//messagebox('',i)
return i
end function

on uo_derek_mle.create
end on

on uo_derek_mle.destroy
end on

event losefocus;//messagebox('','super lose:'+is_oldtext+'/'+text);
if is_oldtext<>text then 
//	send(handle(parent),258,asc('1'),1/*����һ��*/)
//	send(handle(this),256,asc('~h0D'),1) //�س� Ŀ��:�ж��ϴζ�λ,���¶�λ
end if

if isvalid(ilb_add) then 
	if GetFocus ( )<>ilb_add then ilb_add.visible=false
end if

end event

event getfocus;
if isvalid(ilb_add) then 
	ilb_add.move(x,y+height - 3)
	ilb_add.width=width
	ilb_add.visible=true
//	ilb_add.setfocus()
end if
end event

event modified;string ls_text
ls_text=text
replaceex(ls_text,'~r','~~r')
replaceex(ls_text,'~n','~~n')
setprofilestring(is_inifile_ctrl,iw_parent.classname()+'_'+iw_parent.title,classname(),ls_text)
is_oldtext=text
end event

event rbuttondown;is_lastdo='rbuttondown'
post uf_post('lastdo','')
end event

event destructor;if ib_dropfiles=true then DragAcceptFiles(handle(this),false)
end event

