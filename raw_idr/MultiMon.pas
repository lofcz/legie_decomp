//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit MultiMon;

interface

uses
  SysUtils, Classes;

    function InitAnApi(mmAPI:TMultiMonApi; ApiStub:Pointer; ApiName:AnsiString):Pointer;//0042D738
    function _GetSystemMetrics(nIndex:Integer):Integer; stdcall;//0042D820
    function xMonitorFromRect(lprcScreenCoords:PRect; dwFlags:DWORD):HMONITOR; stdcall;//0042D8A8
    function xMonitorFromWindow(hWnd:HWND; dwFlags:DWORD):HMONITOR; stdcall;//0042D938
    function xMonitorFromPoint(ptScreenCoords:TPoint; dwFlags:DWORD):HMONITOR; stdcall;//0042D9D0
    function xGetMonitorInfo(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;//0042DA68
    function xGetMonitorInfoA(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;//0042DB3C
    function xGetMonitorInfoW(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoW):Boolean; stdcall;//0042DC10
    function xEnumDisplayMonitors(hdcOptionalForPainting:HDC; lprcEnumMonitorsThatIntersect:PRect; lpfnEnumProc:TMonitorEnumProc; dwData:LPARAM):Boolean; stdcall;//0042DCE4
    procedure InitMultiMonStubs;//0042DE14

implementation

//0042D738
function InitAnApi(mmAPI:TMultiMonApi; ApiStub:Pointer; ApiName:AnsiString):Pointer;
begin
{*
 0042D738    push        ebp
 0042D739    mov         ebp,esp
 0042D73B    push        ecx
 0042D73C    push        ebx
 0042D73D    push        esi
 0042D73E    push        edi
 0042D73F    mov         dword ptr [ebp-4],ecx
 0042D742    mov         edi,edx
 0042D744    mov         ebx,eax
 0042D746    mov         eax,dword ptr [ebp-4]
 0042D749    call        @LStrAddRef
 0042D74E    xor         eax,eax
 0042D750    push        ebp
 0042D751    push        42D7F7
 0042D756    push        dword ptr fs:[eax]
 0042D759    mov         dword ptr fs:[eax],esp
 0042D75C    xor         esi,esi
 0042D75E    xor         eax,eax
 0042D760    mov         al,bl
 0042D762    cmp         byte ptr [eax+5E09F0],0;InitApis:array[$0..$7] of System.Boolean
>0042D769    jne         0042D7E1
 0042D76B    cmp         dword ptr ds:[5E09EC],0;User32Dll:THandle
>0042D772    je          0042D7C1
 0042D774    test        bl,bl
>0042D776    jne         0042D7A9
 0042D778    cmp         byte ptr ds:[5E09F8],0;MMAvailable:Boolean
>0042D77F    jne         0042D7A9
 0042D781    mov         ecx,42D810;'GetMonitorInfoA'
 0042D786    mov         edx,dword ptr ds:[5E09D8];GetMonitorInfo:TGetMonitorInfoA
 0042D78C    mov         al,4
 0042D78E    call        InitAnApi
 0042D793    mov         [005E09D8],eax;GetMonitorInfo:TGetMonitorInfoA
 0042D798    cmp         byte ptr ds:[5E09F8],0;MMAvailable:Boolean
>0042D79F    jne         0042D7A9
 0042D7A1    lea         eax,[ebp-4]
 0042D7A4    call        @LStrClr
 0042D7A9    mov         eax,dword ptr [ebp-4]
 0042D7AC    call        @LStrToPChar
 0042D7B1    push        eax
 0042D7B2    mov         eax,[005E09EC];User32Dll:THandle
 0042D7B7    push        eax
 0042D7B8    call        KERNEL32.GetProcAddress
 0042D7BD    mov         esi,eax
>0042D7BF    jmp         0042D7C3
 0042D7C1    xor         esi,esi
 0042D7C3    test        esi,esi
>0042D7C5    jne         0042D7CB
 0042D7C7    mov         esi,edi
>0042D7C9    jmp         0042D7D6
 0042D7CB    test        bl,bl
>0042D7CD    je          0042D7D6
 0042D7CF    mov         byte ptr ds:[5E09F8],1;MMAvailable:Boolean
 0042D7D6    xor         eax,eax
 0042D7D8    mov         al,bl
 0042D7DA    mov         byte ptr [eax+5E09F0],1;InitApis:array[$0..$7] of System.Boolean
 0042D7E1    xor         eax,eax
 0042D7E3    pop         edx
 0042D7E4    pop         ecx
 0042D7E5    pop         ecx
 0042D7E6    mov         dword ptr fs:[eax],edx
 0042D7E9    push        42D7FE
 0042D7EE    lea         eax,[ebp-4]
 0042D7F1    call        @LStrClr
 0042D7F6    ret
>0042D7F7    jmp         @HandleFinally
>0042D7FC    jmp         0042D7EE
 0042D7FE    mov         eax,esi
 0042D800    pop         edi
 0042D801    pop         esi
 0042D802    pop         ebx
 0042D803    pop         ecx
 0042D804    pop         ebp
 0042D805    ret
*}
end;

//0042D820
function _GetSystemMetrics(nIndex:Integer):Integer; stdcall;
begin
{*
 0042D820    push        ebp
 0042D821    mov         ebp,esp
 0042D823    push        ebx
 0042D824    mov         ebx,dword ptr [ebp+8]
 0042D827    cmp         byte ptr ds:[5E09F0],0;InitApis:array[$0..$7] of System.Boolean
>0042D82E    jne         0042D850
 0042D830    mov         ecx,42D894;'GetSystemMetrics'
 0042D835    mov         edx,dword ptr ds:[5E09C8]
 0042D83B    xor         eax,eax
 0042D83D    call        InitAnApi
 0042D842    mov         [005E09C8],eax
 0042D847    push        ebx
 0042D848    call        dword ptr ds:[5E09C8]
>0042D84E    jmp         0042D887
 0042D850    or          eax,0FFFFFFFF
 0042D853    mov         edx,ebx
 0042D855    add         edx,0FFFFFFB4
 0042D858    sub         edx,2
>0042D85B    jb          0042D86F
>0042D85D    je          0042D873
 0042D85F    dec         edx
>0042D860    je          0042D877
 0042D862    dec         edx
 0042D863    sub         edx,2
>0042D866    jae         0042D87C
 0042D868    mov         eax,1
>0042D86D    jmp         0042D87C
 0042D86F    xor         eax,eax
>0042D871    jmp         0042D87C
 0042D873    xor         ebx,ebx
>0042D875    jmp         0042D87C
 0042D877    mov         ebx,1
 0042D87C    cmp         eax,0FFFFFFFF
>0042D87F    jne         0042D887
 0042D881    push        ebx
 0042D882    call        user32.GetSystemMetrics
 0042D887    pop         ebx
 0042D888    pop         ebp
 0042D889    ret         4
*}
end;

//0042D8A8
function xMonitorFromRect(lprcScreenCoords:PRect; dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 0042D8A8    push        ebp
 0042D8A9    mov         ebp,esp
 0042D8AB    push        ebx
 0042D8AC    push        esi
 0042D8AD    push        edi
 0042D8AE    mov         edi,dword ptr [ebp+0C]
 0042D8B1    mov         ebx,dword ptr [ebp+8]
 0042D8B4    cmp         byte ptr ds:[5E09F2],0
>0042D8BB    jne         0042D8E0
 0042D8BD    mov         ecx,42D928;'MonitorFromRect'
 0042D8C2    mov         edx,dword ptr ds:[5E09D0];MonitorFromRect:TMonitorFromRect
 0042D8C8    mov         al,2
 0042D8CA    call        InitAnApi
 0042D8CF    mov         [005E09D0],eax;MonitorFromRect:TMonitorFromRect
 0042D8D4    push        edi
 0042D8D5    push        ebx
 0042D8D6    call        dword ptr ds:[5E09D0]
 0042D8DC    mov         esi,eax
>0042D8DE    jmp         0042D915
 0042D8E0    xor         esi,esi
 0042D8E2    mov         eax,edi
 0042D8E4    and         eax,3
 0042D8E7    test        al,al
>0042D8E9    jne         0042D910
 0042D8EB    cmp         dword ptr [ebx+8],0
>0042D8EF    jle         0042D915
 0042D8F1    cmp         dword ptr [ebx+0C],0
>0042D8F5    jle         0042D915
 0042D8F7    push        0
 0042D8F9    call        dword ptr ds:[5E09C8]
 0042D8FF    cmp         eax,dword ptr [ebx]
>0042D901    jle         0042D915
 0042D903    push        1
 0042D905    call        dword ptr ds:[5E09C8]
 0042D90B    cmp         eax,dword ptr [ebx+4]
>0042D90E    jle         0042D915
 0042D910    mov         esi,12340042
 0042D915    mov         eax,esi
 0042D917    pop         edi
 0042D918    pop         esi
 0042D919    pop         ebx
 0042D91A    pop         ebp
 0042D91B    ret         8
*}
end;

//0042D938
function xMonitorFromWindow(hWnd:HWND; dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 0042D938    push        ebp
 0042D939    mov         ebp,esp
 0042D93B    add         esp,0FFFFFFD4
 0042D93E    push        ebx
 0042D93F    push        esi
 0042D940    mov         ebx,dword ptr [ebp+0C]
 0042D943    mov         esi,dword ptr [ebp+8]
 0042D946    cmp         byte ptr ds:[5E09F1],0
>0042D94D    jne         0042D970
 0042D94F    mov         ecx,42D9BC;'MonitorFromWindow'
 0042D954    mov         edx,dword ptr ds:[5E09CC];MonitorFromWindow:TMonitorFromWindow
 0042D95A    mov         al,1
 0042D95C    call        InitAnApi
 0042D961    mov         [005E09CC],eax;MonitorFromWindow:TMonitorFromWindow
 0042D966    push        ebx
 0042D967    push        esi
 0042D968    call        dword ptr ds:[5E09CC]
>0042D96E    jmp         0042D9AA
 0042D970    mov         eax,ebx
 0042D972    and         eax,3
 0042D975    test        al,al
>0042D977    je          0042D980
 0042D979    mov         eax,12340042
>0042D97E    jmp         0042D9AA
 0042D980    push        esi
 0042D981    call        user32.IsIconic
 0042D986    test        eax,eax
>0042D988    je          0042D996
 0042D98A    lea         eax,[ebp-2C]
 0042D98D    push        eax
 0042D98E    push        esi
 0042D98F    call        user32.GetWindowPlacement
>0042D994    jmp         0042D9A0
 0042D996    lea         eax,[ebp-10]
 0042D999    push        eax
 0042D99A    push        esi
 0042D99B    call        user32.GetWindowRect
 0042D9A0    push        ebx
 0042D9A1    lea         eax,[ebp-10]
 0042D9A4    push        eax
 0042D9A5    call        xMonitorFromRect
 0042D9AA    pop         esi
 0042D9AB    pop         ebx
 0042D9AC    mov         esp,ebp
 0042D9AE    pop         ebp
 0042D9AF    ret         8
*}
end;

//0042D9D0
function xMonitorFromPoint(ptScreenCoords:TPoint; dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 0042D9D0    push        ebp
 0042D9D1    mov         ebp,esp
 0042D9D3    push        ebx
 0042D9D4    push        esi
 0042D9D5    push        edi
 0042D9D6    mov         edi,dword ptr [ebp+10]
 0042D9D9    cmp         byte ptr ds:[5E09F3],0
>0042D9E0    jne         0042DA0A
 0042D9E2    mov         ecx,42DA54;'MonitorFromPoint'
 0042D9E7    mov         edx,dword ptr ds:[5E09D4];MonitorFromPoint:TMonitorFromPoint
 0042D9ED    mov         al,3
 0042D9EF    call        InitAnApi
 0042D9F4    mov         [005E09D4],eax;MonitorFromPoint:TMonitorFromPoint
 0042D9F9    push        edi
 0042D9FA    push        dword ptr [ebp+0C]
 0042D9FD    push        dword ptr [ebp+8]
 0042DA00    call        dword ptr ds:[5E09D4]
 0042DA06    mov         ebx,eax
>0042DA08    jmp         0042DA40
 0042DA0A    xor         ebx,ebx
 0042DA0C    mov         eax,edi
 0042DA0E    and         eax,3
 0042DA11    test        al,al
>0042DA13    jne         0042DA3B
 0042DA15    mov         esi,dword ptr [ebp+8]
 0042DA18    test        esi,esi
>0042DA1A    jl          0042DA40
 0042DA1C    push        0
 0042DA1E    call        dword ptr ds:[5E09C8]
 0042DA24    cmp         esi,eax
>0042DA26    jge         0042DA40
 0042DA28    cmp         dword ptr [ebp+0C],0
>0042DA2C    jl          0042DA40
 0042DA2E    push        1
 0042DA30    call        dword ptr ds:[5E09C8]
 0042DA36    cmp         eax,dword ptr [ebp+0C]
>0042DA39    jle         0042DA40
 0042DA3B    mov         ebx,12340042
 0042DA40    mov         eax,ebx
 0042DA42    pop         edi
 0042DA43    pop         esi
 0042DA44    pop         ebx
 0042DA45    pop         ebp
 0042DA46    ret         0C
*}
end;

//0042DA68
function xGetMonitorInfo(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;
begin
{*
 0042DA68    push        ebp
 0042DA69    mov         ebp,esp
 0042DA6B    add         esp,0FFFFFFF0
 0042DA6E    push        ebx
 0042DA6F    push        esi
 0042DA70    push        edi
 0042DA71    mov         esi,dword ptr [ebp+0C]
 0042DA74    mov         edi,dword ptr [ebp+8]
 0042DA77    cmp         byte ptr ds:[5E09F4],0
>0042DA7E    jne         0042DAA3
 0042DA80    mov         ecx,42DB24;'GetMonitorInfo'
 0042DA85    mov         edx,dword ptr ds:[5E09D8];GetMonitorInfo:TGetMonitorInfoA
 0042DA8B    mov         al,4
 0042DA8D    call        InitAnApi
 0042DA92    mov         [005E09D8],eax;GetMonitorInfo:TGetMonitorInfoA
 0042DA97    push        esi
 0042DA98    push        edi
 0042DA99    call        dword ptr ds:[5E09D8]
 0042DA9F    mov         ebx,eax
>0042DAA1    jmp         0042DB11
 0042DAA3    xor         ebx,ebx
 0042DAA5    cmp         edi,12340042
>0042DAAB    jne         0042DB11
 0042DAAD    test        esi,esi
>0042DAAF    je          0042DB11
 0042DAB1    cmp         dword ptr [esi],28
>0042DAB4    jb          0042DB11
 0042DAB6    push        0
 0042DAB8    lea         eax,[ebp-10]
 0042DABB    push        eax
 0042DABC    push        0
 0042DABE    push        30
 0042DAC0    call        user32.SystemParametersInfoA
 0042DAC5    test        eax,eax
>0042DAC7    je          0042DB11
 0042DAC9    xor         eax,eax
 0042DACB    mov         dword ptr [esi+4],eax
 0042DACE    xor         eax,eax
 0042DAD0    mov         dword ptr [esi+8],eax
 0042DAD3    push        0
 0042DAD5    call        dword ptr ds:[5E09C8]
 0042DADB    mov         dword ptr [esi+0C],eax
 0042DADE    push        1
 0042DAE0    call        dword ptr ds:[5E09C8]
 0042DAE6    mov         dword ptr [esi+10],eax
 0042DAE9    push        esi
 0042DAEA    lea         edi,[esi+14]
 0042DAED    lea         esi,[ebp-10]
 0042DAF0    movs        dword ptr [edi],dword ptr [esi]
 0042DAF1    movs        dword ptr [edi],dword ptr [esi]
 0042DAF2    movs        dword ptr [edi],dword ptr [esi]
 0042DAF3    movs        dword ptr [edi],dword ptr [esi]
 0042DAF4    pop         esi
 0042DAF5    mov         dword ptr [esi+24],1
 0042DAFC    cmp         dword ptr [esi],4C
>0042DAFF    jb          0042DB0F
 0042DB01    push        42DB34
 0042DB06    lea         eax,[esi+28]
 0042DB09    push        eax
 0042DB0A    call        KERNEL32.lstrcpyA
 0042DB0F    mov         bl,1
 0042DB11    mov         eax,ebx
 0042DB13    pop         edi
 0042DB14    pop         esi
 0042DB15    pop         ebx
 0042DB16    mov         esp,ebp
 0042DB18    pop         ebp
 0042DB19    ret         8
*}
end;

//0042DB3C
function xGetMonitorInfoA(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;
begin
{*
 0042DB3C    push        ebp
 0042DB3D    mov         ebp,esp
 0042DB3F    add         esp,0FFFFFFF0
 0042DB42    push        ebx
 0042DB43    push        esi
 0042DB44    push        edi
 0042DB45    mov         esi,dword ptr [ebp+0C]
 0042DB48    mov         edi,dword ptr [ebp+8]
 0042DB4B    cmp         byte ptr ds:[5E09F5],0
>0042DB52    jne         0042DB77
 0042DB54    mov         ecx,42DBF8;'GetMonitorInfoA'
 0042DB59    mov         edx,dword ptr ds:[5E09DC];GetMonitorInfoA:TGetMonitorInfoA
 0042DB5F    mov         al,5
 0042DB61    call        InitAnApi
 0042DB66    mov         [005E09DC],eax;GetMonitorInfoA:TGetMonitorInfoA
 0042DB6B    push        esi
 0042DB6C    push        edi
 0042DB6D    call        dword ptr ds:[5E09DC]
 0042DB73    mov         ebx,eax
>0042DB75    jmp         0042DBE5
 0042DB77    xor         ebx,ebx
 0042DB79    cmp         edi,12340042
>0042DB7F    jne         0042DBE5
 0042DB81    test        esi,esi
>0042DB83    je          0042DBE5
 0042DB85    cmp         dword ptr [esi],28
>0042DB88    jb          0042DBE5
 0042DB8A    push        0
 0042DB8C    lea         eax,[ebp-10]
 0042DB8F    push        eax
 0042DB90    push        0
 0042DB92    push        30
 0042DB94    call        user32.SystemParametersInfoA
 0042DB99    test        eax,eax
>0042DB9B    je          0042DBE5
 0042DB9D    xor         eax,eax
 0042DB9F    mov         dword ptr [esi+4],eax
 0042DBA2    xor         eax,eax
 0042DBA4    mov         dword ptr [esi+8],eax
 0042DBA7    push        0
 0042DBA9    call        dword ptr ds:[5E09C8]
 0042DBAF    mov         dword ptr [esi+0C],eax
 0042DBB2    push        1
 0042DBB4    call        dword ptr ds:[5E09C8]
 0042DBBA    mov         dword ptr [esi+10],eax
 0042DBBD    push        esi
 0042DBBE    lea         edi,[esi+14]
 0042DBC1    lea         esi,[ebp-10]
 0042DBC4    movs        dword ptr [edi],dword ptr [esi]
 0042DBC5    movs        dword ptr [edi],dword ptr [esi]
 0042DBC6    movs        dword ptr [edi],dword ptr [esi]
 0042DBC7    movs        dword ptr [edi],dword ptr [esi]
 0042DBC8    pop         esi
 0042DBC9    mov         dword ptr [esi+24],1
 0042DBD0    cmp         dword ptr [esi],4C
>0042DBD3    jb          0042DBE3
 0042DBD5    push        42DC08
 0042DBDA    lea         eax,[esi+28]
 0042DBDD    push        eax
 0042DBDE    call        KERNEL32.lstrcpyA
 0042DBE3    mov         bl,1
 0042DBE5    mov         eax,ebx
 0042DBE7    pop         edi
 0042DBE8    pop         esi
 0042DBE9    pop         ebx
 0042DBEA    mov         esp,ebp
 0042DBEC    pop         ebp
 0042DBED    ret         8
*}
end;

//0042DC10
function xGetMonitorInfoW(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoW):Boolean; stdcall;
begin
{*
 0042DC10    push        ebp
 0042DC11    mov         ebp,esp
 0042DC13    add         esp,0FFFFFFF0
 0042DC16    push        ebx
 0042DC17    push        esi
 0042DC18    push        edi
 0042DC19    mov         esi,dword ptr [ebp+0C]
 0042DC1C    mov         edi,dword ptr [ebp+8]
 0042DC1F    cmp         byte ptr ds:[5E09F6],0
>0042DC26    jne         0042DC4B
 0042DC28    mov         ecx,42DCCC;'GetMonitorInfoW'
 0042DC2D    mov         edx,dword ptr ds:[5E09E0];GetMonitorInfoW:TGetMonitorInfoW
 0042DC33    mov         al,6
 0042DC35    call        InitAnApi
 0042DC3A    mov         [005E09E0],eax;GetMonitorInfoW:TGetMonitorInfoW
 0042DC3F    push        esi
 0042DC40    push        edi
 0042DC41    call        dword ptr ds:[5E09E0]
 0042DC47    mov         ebx,eax
>0042DC49    jmp         0042DCB9
 0042DC4B    xor         ebx,ebx
 0042DC4D    cmp         edi,12340042
>0042DC53    jne         0042DCB9
 0042DC55    test        esi,esi
>0042DC57    je          0042DCB9
 0042DC59    cmp         dword ptr [esi],28
>0042DC5C    jb          0042DCB9
 0042DC5E    push        0
 0042DC60    lea         eax,[ebp-10]
 0042DC63    push        eax
 0042DC64    push        0
 0042DC66    push        30
 0042DC68    call        user32.SystemParametersInfoA
 0042DC6D    test        eax,eax
>0042DC6F    je          0042DCB9
 0042DC71    xor         eax,eax
 0042DC73    mov         dword ptr [esi+4],eax
 0042DC76    xor         eax,eax
 0042DC78    mov         dword ptr [esi+8],eax
 0042DC7B    push        0
 0042DC7D    call        dword ptr ds:[5E09C8]
 0042DC83    mov         dword ptr [esi+0C],eax
 0042DC86    push        1
 0042DC88    call        dword ptr ds:[5E09C8]
 0042DC8E    mov         dword ptr [esi+10],eax
 0042DC91    push        esi
 0042DC92    lea         edi,[esi+14]
 0042DC95    lea         esi,[ebp-10]
 0042DC98    movs        dword ptr [edi],dword ptr [esi]
 0042DC99    movs        dword ptr [edi],dword ptr [esi]
 0042DC9A    movs        dword ptr [edi],dword ptr [esi]
 0042DC9B    movs        dword ptr [edi],dword ptr [esi]
 0042DC9C    pop         esi
 0042DC9D    mov         dword ptr [esi+24],1
 0042DCA4    cmp         dword ptr [esi],4C
>0042DCA7    jb          0042DCB7
 0042DCA9    push        42DCDC
 0042DCAE    lea         eax,[esi+28]
 0042DCB1    push        eax
 0042DCB2    call        KERNEL32.lstrcpyA
 0042DCB7    mov         bl,1
 0042DCB9    mov         eax,ebx
 0042DCBB    pop         edi
 0042DCBC    pop         esi
 0042DCBD    pop         ebx
 0042DCBE    mov         esp,ebp
 0042DCC0    pop         ebp
 0042DCC1    ret         8
*}
end;

//0042DCE4
function xEnumDisplayMonitors(hdcOptionalForPainting:HDC; lprcEnumMonitorsThatIntersect:PRect; lpfnEnumProc:TMonitorEnumProc; dwData:LPARAM):Boolean; stdcall;
begin
{*
 0042DCE4    push        ebp
 0042DCE5    mov         ebp,esp
 0042DCE7    add         esp,0FFFFFFD4
 0042DCEA    push        ebx
 0042DCEB    push        esi
 0042DCEC    push        edi
 0042DCED    mov         edi,dword ptr [ebp+0C]
 0042DCF0    mov         esi,dword ptr [ebp+8]
 0042DCF3    cmp         byte ptr ds:[5E09F7],0
>0042DCFA    jne         0042DD2A
 0042DCFC    mov         ecx,42DE00;'EnumDisplayMonitors'
 0042DD01    mov         edx,dword ptr ds:[5E09E4];EnumDisplayMonitors:TEnumDisplayMonitors
 0042DD07    mov         al,7
 0042DD09    call        InitAnApi
 0042DD0E    mov         [005E09E4],eax;EnumDisplayMonitors:TEnumDisplayMonitors
 0042DD13    mov         eax,dword ptr [ebp+14]
 0042DD16    push        eax
 0042DD17    mov         eax,dword ptr [ebp+10]
 0042DD1A    push        eax
 0042DD1B    push        edi
 0042DD1C    push        esi
 0042DD1D    call        dword ptr ds:[5E09E4]
 0042DD23    mov         ebx,eax
>0042DD25    jmp         0042DDEC
 0042DD2A    xor         ebx,ebx
 0042DD2C    cmp         dword ptr [ebp+10],0
>0042DD30    je          0042DDEC
 0042DD36    xor         eax,eax
 0042DD38    mov         dword ptr [ebp-1C],eax
 0042DD3B    xor         eax,eax
 0042DD3D    mov         dword ptr [ebp-18],eax
 0042DD40    push        0
 0042DD42    call        dword ptr ds:[5E09C8]
 0042DD48    mov         dword ptr [ebp-14],eax
 0042DD4B    push        1
 0042DD4D    call        dword ptr ds:[5E09C8]
 0042DD53    mov         dword ptr [ebp-10],eax
 0042DD56    test        esi,esi
>0042DD58    je          0042DDBF
 0042DD5A    lea         eax,[ebp-2C]
 0042DD5D    push        eax
 0042DD5E    push        esi
 0042DD5F    call        gdi32.GetClipBox
 0042DD64    mov         dword ptr [ebp-0C],eax
 0042DD67    lea         eax,[ebp-8]
 0042DD6A    push        eax
 0042DD6B    push        esi
 0042DD6C    call        gdi32.GetDCOrgEx
 0042DD71    test        eax,eax
>0042DD73    je          0042DDEC
 0042DD75    mov         eax,dword ptr [ebp-4]
 0042DD78    neg         eax
 0042DD7A    push        eax
 0042DD7B    mov         eax,dword ptr [ebp-8]
 0042DD7E    neg         eax
 0042DD80    push        eax
 0042DD81    lea         eax,[ebp-1C]
 0042DD84    push        eax
 0042DD85    call        user32.OffsetRect
 0042DD8A    lea         eax,[ebp-2C]
 0042DD8D    push        eax
 0042DD8E    lea         eax,[ebp-1C]
 0042DD91    push        eax
 0042DD92    lea         eax,[ebp-1C]
 0042DD95    push        eax
 0042DD96    call        user32.IntersectRect
 0042DD9B    test        eax,eax
>0042DD9D    je          0042DDA3
 0042DD9F    test        edi,edi
>0042DDA1    je          0042DDD9
 0042DDA3    push        edi
 0042DDA4    lea         eax,[ebp-1C]
 0042DDA7    push        eax
 0042DDA8    lea         eax,[ebp-1C]
 0042DDAB    push        eax
 0042DDAC    call        user32.IntersectRect
 0042DDB1    test        eax,eax
>0042DDB3    jne         0042DDD9
 0042DDB5    cmp         dword ptr [ebp-0C],1
>0042DDB9    jne         0042DDEC
 0042DDBB    mov         bl,1
>0042DDBD    jmp         0042DDEC
 0042DDBF    test        edi,edi
>0042DDC1    je          0042DDD9
 0042DDC3    push        edi
 0042DDC4    lea         eax,[ebp-1C]
 0042DDC7    push        eax
 0042DDC8    lea         eax,[ebp-1C]
 0042DDCB    push        eax
 0042DDCC    call        user32.IntersectRect
 0042DDD1    test        eax,eax
>0042DDD3    jne         0042DDD9
 0042DDD5    mov         bl,1
>0042DDD7    jmp         0042DDEC
 0042DDD9    mov         eax,dword ptr [ebp+14]
 0042DDDC    push        eax
 0042DDDD    lea         eax,[ebp-1C]
 0042DDE0    push        eax
 0042DDE1    push        esi
 0042DDE2    push        12340042
 0042DDE7    call        dword ptr [ebp+10]
 0042DDEA    mov         ebx,eax
 0042DDEC    mov         eax,ebx
 0042DDEE    pop         edi
 0042DDEF    pop         esi
 0042DDF0    pop         ebx
 0042DDF1    mov         esp,ebp
 0042DDF3    pop         ebp
 0042DDF4    ret         10
*}
end;

//0042DE14
procedure InitMultiMonStubs;
begin
{*
 0042DE14    push        42DE74
 0042DE19    call        KERNEL32.GetModuleHandleA
 0042DE1E    mov         [005E09EC],eax;User32Dll:THandle
 0042DE23    mov         dword ptr ds:[5E09C8],42D820
 0042DE2D    mov         dword ptr ds:[5E09CC],42D938
 0042DE37    mov         dword ptr ds:[5E09D0],42D8A8
 0042DE41    mov         dword ptr ds:[5E09D4],42D9D0
 0042DE4B    mov         dword ptr ds:[5E09D8],42DA68
 0042DE55    mov         dword ptr ds:[5E09DC],42DB3C
 0042DE5F    mov         dword ptr ds:[5E09E0],42DC10
 0042DE69    mov         dword ptr ds:[5E09E4],42DCE4
 0042DE73    ret
*}
end;

Initialization
//0042DEB0
{*
 0042DEB0    sub         dword ptr ds:[5E09E8],1
>0042DEB7    jae         0042DEBE
 0042DEB9    call        InitMultiMonStubs
 0042DEBE    ret
*}
Finalization
end.