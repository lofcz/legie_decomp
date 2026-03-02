//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit FlatSB;

interface

uses
  SysUtils, Classes;

    function FlatSB_SetScrollProp(p1:HWND; index:Integer; newValue:Integer; p4:BOOL):BOOL; stdcall;//0042EF6C
    function InitializeFlatSB(hWnd:HWND):BOOL; stdcall;//0042EFA0
    procedure InitFlatSB;//0042EFC8

implementation

//0042EF6C
function FlatSB_SetScrollProp(p1:HWND; index:Integer; newValue:Integer; p4:BOOL):BOOL; stdcall;
begin
{*
 0042EF6C    push        ebp
 0042EF6D    mov         ebp,esp
 0042EF6F    cmp         dword ptr ds:[5E0A38],0;_FlatSB_SetScrollProp:function(val p1:Windows.HWND;val index:Sys...
>0042EF76    je          0042EF92
 0042EF78    mov         eax,dword ptr [ebp+14]
 0042EF7B    push        eax
 0042EF7C    mov         eax,dword ptr [ebp+10]
 0042EF7F    push        eax
 0042EF80    mov         eax,dword ptr [ebp+0C]
 0042EF83    push        eax
 0042EF84    mov         eax,dword ptr [ebp+8]
 0042EF87    push        eax
 0042EF88    call        dword ptr ds:[5E0A38]
 0042EF8E    test        eax,eax
>0042EF90    jne         0042EF96
 0042EF92    xor         eax,eax
>0042EF94    jmp         0042EF98
 0042EF96    mov         al,1
 0042EF98    neg         al
 0042EF9A    sbb         eax,eax
 0042EF9C    pop         ebp
 0042EF9D    ret         10
*}
end;

//0042EFA0
function InitializeFlatSB(hWnd:HWND):BOOL; stdcall;
begin
{*
 0042EFA0    push        ebp
 0042EFA1    mov         ebp,esp
 0042EFA3    cmp         dword ptr ds:[5E0A3C],0;_InitializeFlatSB:function(val hWnd:Windows.HWND):Windows.BOOL s...
>0042EFAA    je          0042EFBA
 0042EFAC    mov         eax,dword ptr [ebp+8]
 0042EFAF    push        eax
 0042EFB0    call        dword ptr ds:[5E0A3C]
 0042EFB6    test        eax,eax
>0042EFB8    jne         0042EFBE
 0042EFBA    xor         eax,eax
>0042EFBC    jmp         0042EFC0
 0042EFBE    mov         al,1
 0042EFC0    neg         al
 0042EFC2    sbb         eax,eax
 0042EFC4    pop         ebp
 0042EFC5    ret         4
*}
end;

//0042EFC8
procedure InitFlatSB;
begin
{*
 0042EFC8    push        ebx
 0042EFC9    push        esi
 0042EFCA    push        42F12C
 0042EFCF    call        KERNEL32.GetModuleHandleA
 0042EFD4    mov         ebx,eax
 0042EFD6    test        ebx,ebx
>0042EFD8    je          0042F126
 0042EFDE    push        42F13C
 0042EFE3    push        ebx
 0042EFE4    call        KERNEL32.GetProcAddress
 0042EFE9    mov         [005E0A3C],eax;_InitializeFlatSB:function(val hWnd:Windows.HWND):Windows.BOOL stdcall
 0042EFEE    push        42F150
 0042EFF3    push        ebx
 0042EFF4    call        KERNEL32.GetProcAddress
 0042EFF9    mov         [005E0A40],eax;_UninitializeFlatSB:procedure(val hWnd:Windows.HWND) stdcall
 0042EFFE    push        42F164
 0042F003    push        ebx
 0042F004    call        KERNEL32.GetProcAddress
 0042F009    mov         [005E0A34],eax;_FlatSB_GetScrollProp:function(val p1:Windows.HWND;val propIndex:System.I...
 0042F00E    push        42F17C
 0042F013    push        ebx
 0042F014    call        KERNEL32.GetProcAddress
 0042F019    mov         [005E0A38],eax;_FlatSB_SetScrollProp:function(val p1:Windows.HWND;val index:System.Integ...
 0042F01E    push        42F194
 0042F023    push        ebx
 0042F024    call        KERNEL32.GetProcAddress
 0042F029    mov         esi,eax
 0042F02B    mov         dword ptr ds:[5E0A10],esi;FlatSB_EnableScrollBar:function(val hWnd:Windows.HWND;val wSBf...
 0042F031    test        esi,esi
>0042F033    jne         0042F03F
 0042F035    mov         eax,407054;user32.EnableScrollBar:LongBool
 0042F03A    mov         [005E0A10],eax;FlatSB_EnableScrollBar:function(val hWnd:Windows.HWND;val wSBflags:Window...
 0042F03F    push        42F1AC
 0042F044    push        ebx
 0042F045    call        KERNEL32.GetProcAddress
 0042F04A    mov         esi,eax
 0042F04C    mov         dword ptr ds:[5E0A14],esi;FlatSB_ShowScrollBar:function(val hWnd:Windows.HWND;val wBar:S...
 0042F052    test        esi,esi
>0042F054    jne         0042F060
 0042F056    mov         eax,40741C;user32.ShowScrollBar:LongBool
 0042F05B    mov         [005E0A14],eax;FlatSB_ShowScrollBar:function(val hWnd:Windows.HWND;val wBar:System.Integ...
 0042F060    push        42F1C4
 0042F065    push        ebx
 0042F066    call        KERNEL32.GetProcAddress
 0042F06B    mov         esi,eax
 0042F06D    mov         dword ptr ds:[5E0A18],esi;FlatSB_GetScrollRange:function(val hWnd:Windows.HWND;val nBar:...
 0042F073    test        esi,esi
>0042F075    jne         0042F081
 0042F077    mov         eax,40719C;user32.GetScrollRange:LongBool
 0042F07C    mov         [005E0A18],eax;FlatSB_GetScrollRange:function(val hWnd:Windows.HWND;val nBar:System.Inte...
 0042F081    push        42F1DC
 0042F086    push        ebx
 0042F087    call        KERNEL32.GetProcAddress
 0042F08C    mov         esi,eax
 0042F08E    mov         dword ptr ds:[5E0A1C],esi;FlatSB_GetScrollInfo:function(val hWnd:Windows.HWND;val BarFla...
 0042F094    test        esi,esi
>0042F096    jne         0042F0A2
 0042F098    mov         eax,40718C;user32.GetScrollInfo:LongBool
 0042F09D    mov         [005E0A1C],eax;FlatSB_GetScrollInfo:function(val hWnd:Windows.HWND;val BarFlag:System.In...
 0042F0A2    push        42F1F4
 0042F0A7    push        ebx
 0042F0A8    call        KERNEL32.GetProcAddress
 0042F0AD    mov         esi,eax
 0042F0AF    mov         dword ptr ds:[5E0A20],esi;FlatSB_GetScrollPos:function(val hWnd:Windows.HWND;val nBar:Sy...
 0042F0B5    test        esi,esi
>0042F0B7    jne         0042F0C3
 0042F0B9    mov         eax,407194;user32.GetScrollPos:Integer
 0042F0BE    mov         [005E0A20],eax;FlatSB_GetScrollPos:function(val hWnd:Windows.HWND;val nBar:System.Intege...
 0042F0C3    push        42F208
 0042F0C8    push        ebx
 0042F0C9    call        KERNEL32.GetProcAddress
 0042F0CE    mov         esi,eax
 0042F0D0    mov         dword ptr ds:[5E0A24],esi;FlatSB_SetScrollPos:function(val hWnd:Windows.HWND;val nBar:Sy...
 0042F0D6    test        esi,esi
>0042F0D8    jne         0042F0E4
 0042F0DA    mov         eax,4073CC;user32.SetScrollPos:Integer
 0042F0DF    mov         [005E0A24],eax;FlatSB_SetScrollPos:function(val hWnd:Windows.HWND;val nBar:System.Intege...
 0042F0E4    push        42F21C
 0042F0E9    push        ebx
 0042F0EA    call        KERNEL32.GetProcAddress
 0042F0EF    mov         esi,eax
 0042F0F1    mov         dword ptr ds:[5E0A28],esi;FlatSB_SetScrollInfo:function(val hWnd:Windows.HWND;val BarFla...
 0042F0F7    test        esi,esi
>0042F0F9    jne         0042F105
 0042F0FB    mov         eax,4073C4;user32.SetScrollInfo:Integer
 0042F100    mov         [005E0A28],eax;FlatSB_SetScrollInfo:function(val hWnd:Windows.HWND;val BarFlag:System.In...
 0042F105    push        42F234
 0042F10A    push        ebx
 0042F10B    call        KERNEL32.GetProcAddress
 0042F110    mov         esi,eax
 0042F112    mov         dword ptr ds:[5E0A2C],esi;FlatSB_SetScrollRange:function(val hWnd:Windows.HWND;val nBar:...
 0042F118    test        esi,esi
>0042F11A    jne         0042F126
 0042F11C    mov         eax,4073D4;user32.SetScrollRange:LongBool
 0042F121    mov         [005E0A2C],eax;FlatSB_SetScrollRange:function(val hWnd:Windows.HWND;val nBar:System.Inte...
 0042F126    pop         esi
 0042F127    pop         ebx
 0042F128    ret
*}
end;

Initialization
//0042F27C
{*
 0042F27C    sub         dword ptr ds:[5E0A30],1
>0042F283    jae         0042F28A
 0042F285    call        InitFlatSB
 0042F28A    ret
*}
Finalization
end.