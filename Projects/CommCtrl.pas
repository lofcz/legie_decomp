//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CommCtrl;

interface

uses
  SysUtils, Classes;

    function ImageList_Create(CY:Integer; Flags:UINT; Initial:Integer; Grow:Integer):THandle; stdcall;//0042D644
    function ImageList_Destroy:BOOL; stdcall;//0042D64C
    function ImageList_GetImageCount:Integer; stdcall;//0042D654
    function ImageList_Add(Image:HBITMAP; Mask:HBITMAP):Integer; stdcall;//0042D65C
    function ImageList_ReplaceIcon(Index:Integer; Icon:HICON):Integer; stdcall;//0042D664
    function ImageList_SetBkColor(ClrBk:TColorRef):TColorRef; stdcall;//0042D66C
    function ImageList_GetBkColor:TColorRef; stdcall;//0042D674
    function ImageList_AddIcon(ImageList:THandle; Icon:HICON):Integer;//0042D67C
    function ImageList_Draw(Index:Integer; Dest:HDC; X:Integer; Y:Integer; Style:UINT):BOOL; stdcall;//0042D688
    function ImageList_DrawEx(Index:Integer; Dest:HDC; X:Integer; Y:Integer; DX:Integer; DY:Integer; Bk:TColorRef; Fg:TColorRef; Style:Cardinal):BOOL; stdcall;//0042D690
    function ImageList_Remove(Index:Integer):BOOL; stdcall;//0042D698
    function ImageList_BeginDrag(Track:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;//0042D6A0
    function ImageList_EndDrag:BOOL;//0042D6A8
    function ImageList_DragEnter(X:Integer; Y:Integer):BOOL; stdcall;//0042D6B0
    function ImageList_DragLeave:BOOL; stdcall;//0042D6B8
    function ImageList_DragMove(Y:Integer):BOOL; stdcall;//0042D6C0
    function ImageList_SetDragCursorImage(Drag:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;//0042D6C8
    function ImageList_DragShowNolock:BOOL; stdcall;//0042D6D0
    function ImageList_GetDragImage(HotSpot:PPoint):THandle; stdcall;//0042D6D8
    function ImageList_Read:THandle; stdcall;//0042D6E0
    function ImageList_Write(Stream:IStream):BOOL; stdcall;//0042D6E8
    function ImageList_GetIconSize(var CX:Integer; var CY:Integer):BOOL; stdcall;//0042D6F0
    function ImageList_SetIconSize(CX:Integer; CY:Integer):BOOL; stdcall;//0042D6F8

implementation

//0042D644
function comctl32.ImageList_Create(CY:Integer; Flags:UINT; Initial:Integer; Grow:Integer):THandle; stdcall;
begin
{*
 0042D644    jmp         dword ptr ds:[60880C]
*}
end;

//0042D64C
function comctl32.ImageList_Destroy:BOOL; stdcall;
begin
{*
 0042D64C    jmp         dword ptr ds:[608808]
*}
end;

//0042D654
function comctl32.ImageList_GetImageCount:Integer; stdcall;
begin
{*
 0042D654    jmp         dword ptr ds:[608804]
*}
end;

//0042D65C
function comctl32.ImageList_Add(Image:HBITMAP; Mask:HBITMAP):Integer; stdcall;
begin
{*
 0042D65C    jmp         dword ptr ds:[608800]
*}
end;

//0042D664
function comctl32.ImageList_ReplaceIcon(Index:Integer; Icon:HICON):Integer; stdcall;
begin
{*
 0042D664    jmp         dword ptr ds:[6087FC]
*}
end;

//0042D66C
function comctl32.ImageList_SetBkColor(ClrBk:TColorRef):TColorRef; stdcall;
begin
{*
 0042D66C    jmp         dword ptr ds:[6087F8]
*}
end;

//0042D674
function comctl32.ImageList_GetBkColor:TColorRef; stdcall;
begin
{*
 0042D674    jmp         dword ptr ds:[6087F4]
*}
end;

//0042D67C
function ImageList_AddIcon(ImageList:THandle; Icon:HICON):Integer;
begin
{*
 0042D67C    push        edx
 0042D67D    push        0FF
 0042D67F    push        eax
 0042D680    call        comctl32.ImageList_ReplaceIcon
 0042D685    ret
*}
end;

//0042D688
function comctl32.ImageList_Draw(Index:Integer; Dest:HDC; X:Integer; Y:Integer; Style:UINT):BOOL; stdcall;
begin
{*
 0042D688    jmp         dword ptr ds:[6087F0]
*}
end;

//0042D690
function comctl32.ImageList_DrawEx(Index:Integer; Dest:HDC; X:Integer; Y:Integer; DX:Integer; DY:Integer; Bk:TColorRef; Fg:TColorRef; Style:Cardinal):BOOL; stdcall;
begin
{*
 0042D690    jmp         dword ptr ds:[6087EC]
*}
end;

//0042D698
function comctl32.ImageList_Remove(Index:Integer):BOOL; stdcall;
begin
{*
 0042D698    jmp         dword ptr ds:[6087E8]
*}
end;

//0042D6A0
function comctl32.ImageList_BeginDrag(Track:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;
begin
{*
 0042D6A0    jmp         dword ptr ds:[6087E4]
*}
end;

//0042D6A8
function comctl32.ImageList_EndDrag:BOOL;
begin
{*
 0042D6A8    jmp         dword ptr ds:[6087E0]
*}
end;

//0042D6B0
function comctl32.ImageList_DragEnter(X:Integer; Y:Integer):BOOL; stdcall;
begin
{*
 0042D6B0    jmp         dword ptr ds:[6087DC]
*}
end;

//0042D6B8
function comctl32.ImageList_DragLeave:BOOL; stdcall;
begin
{*
 0042D6B8    jmp         dword ptr ds:[6087D8]
*}
end;

//0042D6C0
function comctl32.ImageList_DragMove(Y:Integer):BOOL; stdcall;
begin
{*
 0042D6C0    jmp         dword ptr ds:[6087D4]
*}
end;

//0042D6C8
function comctl32.ImageList_SetDragCursorImage(Drag:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;
begin
{*
 0042D6C8    jmp         dword ptr ds:[6087D0]
*}
end;

//0042D6D0
function comctl32.ImageList_DragShowNolock:BOOL; stdcall;
begin
{*
 0042D6D0    jmp         dword ptr ds:[6087CC]
*}
end;

//0042D6D8
function comctl32.ImageList_GetDragImage(HotSpot:PPoint):THandle; stdcall;
begin
{*
 0042D6D8    jmp         dword ptr ds:[6087C8]
*}
end;

//0042D6E0
function comctl32.ImageList_Read:THandle; stdcall;
begin
{*
 0042D6E0    jmp         dword ptr ds:[6087C4]
*}
end;

//0042D6E8
function comctl32.ImageList_Write(Stream:IStream):BOOL; stdcall;
begin
{*
 0042D6E8    jmp         dword ptr ds:[6087C0]
*}
end;

//0042D6F0
function comctl32.ImageList_GetIconSize(var CX:Integer; var CY:Integer):BOOL; stdcall;
begin
{*
 0042D6F0    jmp         dword ptr ds:[6087BC]
*}
end;

//0042D6F8
function comctl32.ImageList_SetIconSize(CX:Integer; CY:Integer):BOOL; stdcall;
begin
{*
 0042D6F8    jmp         dword ptr ds:[6087B8]
*}
end;

end.