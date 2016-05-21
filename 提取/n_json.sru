$PBExportHeader$n_json.sru
forward
global type n_json from nonvisualobject
end type
end forward

global type n_json from nonvisualobject native "PowerUIExt.dll"
public function  boolean IsEmpty()
public function  boolean IsNull()
public function  long GetType()
public function  string GetName()
public function  long SetName(readonly string name)
public function  string GetValueString()
public function  long GetValueLong()
public function  longlong GetValueLongLong()
public function  double GetValueDouble()
public function  boolean GetValueBoolean()
public function  long SetValue(readonly string val)
public function  long SetValue(readonly long val)
public function  long SetValue(readonly longlong val)
public function  long SetValue(readonly double val)
public function  long SetValue(readonly boolean val)
public function  int GetChildCount()
public function  long GetChildType(readonly string key)
public function  long GetChildType(readonly int index)
public function  boolean IsChildNull(readonly string key)
public function  boolean IsChildNull(readonly int index)
public function  string GetChildString(readonly string key)
public function  string GetChildString(readonly int index)
public function  long GetChildLong(readonly string key)
public function  long GetChildLong(readonly int index)
public function  longlong GetChildLongLong(readonly string key)
public function  longlong GetChildLongLong(readonly int index)
public function  double GetChildDouble(readonly string key)
public function  double GetChildDouble(readonly int index)
public function  boolean GetChildBoolean(readonly string key)
public function  boolean GetChildBoolean(readonly int index)
public function  long SetChild(readonly string key,readonly string val)
public function  long SetChild(readonly int index,readonly string val)
public function  long SetChild(readonly string key,readonly long val)
public function  long SetChild(readonly int index,readonly long val)
public function  long SetChild(readonly string key,readonly longlong val)
public function  long SetChild(readonly int index,readonly longlong val)
public function  long SetChild(readonly string key,readonly double val)
public function  long SetChild(readonly int index,readonly double val)
public function  long SetChild(readonly string key,readonly boolean val)
public function  long SetChild(readonly int index,readonly boolean val)
public function  long SetChild(readonly string key,readonly n_json obj)
public function  long SetChild(readonly int index,readonly n_json obj)
public function  n_json GetOwner()
public function  n_json GetPrevious()
public function  n_json GetNext()
public function  n_json GetFirstChild()
public function  n_json GetLastChild()
public function  n_json GetChild(readonly string key)
public function  n_json GetChild(readonly int index)
public function  n_json AddChild(readonly string key,readonly string val)
public function  n_json AddChild(readonly string val)
public function  n_json AddChild(readonly string key,readonly long val)
public function  n_json AddChild(readonly long val)
public function  n_json AddChild(readonly string key,readonly longlong val)
public function  n_json AddChild(readonly longlong val)
public function  n_json AddChild(readonly string key,readonly double val)
public function  n_json AddChild(readonly double val)
public function  n_json AddChild(readonly string key,readonly boolean val)
public function  n_json AddChild(readonly boolean val)
public function  n_json AddChild(readonly string key,readonly n_json obj)
public function  n_json AddChild(readonly n_json obj)
public function  long RemoveChild(readonly string key)
public function  long RemoveChild(readonly int index)
public function  long Parse(readonly string jsonstr)
public function  long LoadFile(readonly string filename)
public function  long SaveFile(readonly string filename)
public function  long SaveFile(readonly string filename,readonly ulong format)
public function  long SaveString(ref string jsonstr)
public function  long SaveString(ref string jsonstr,readonly ulong format)
public subroutine  Reset()
end type
global n_json n_json

on n_json.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_json.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

