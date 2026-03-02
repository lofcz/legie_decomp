//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit1;

interface

uses
  SysUtils, Classes;

    function GetModuleHandleA:HMODULE; stdcall;//0040679C
    function LocalAlloc(size:Integer):Pointer; stdcall;//004067A4
    function TlsGetValue:Pointer; stdcall;//004067AC
    function TlsSetValue(lpTlsValue:Pointer):LongBool; stdcall;//004067B4
    function AllocTlsBuffer(Size:Integer):Pointer;//004067BC
    function GetTlsSize:Integer;//004067C8
    procedure InitThreadTLS;//004067D0
    function @GetTls:Pointer;//00406814
    procedure InitializeModule;//00406854
    procedure @InitExe;//00406860

implementation

//0040679C
function KERNEL32.GetModuleHandleA:HMODULE; stdcall;
begin
{*
 0040679C    jmp         dword ptr ds:[60825C]
*}
end;

//004067A4
function KERNEL32.LocalAlloc(size:Integer):Pointer; stdcall;
begin
{*
 004067A4    jmp         dword ptr ds:[608258]
*}
end;

//004067AC
function KERNEL32.TlsGetValue:Pointer; stdcall;
begin
{*
 004067AC    jmp         dword ptr ds:[608254]
*}
end;

//004067B4
function KERNEL32.TlsSetValue(lpTlsValue:Pointer):LongBool; stdcall;
begin
{*
 004067B4    jmp         dword ptr ds:[608250]
*}
end;

//004067BC
function AllocTlsBuffer(Size:Integer):Pointer;
begin
{*
 004067BC    push        eax
 004067BD    push        40
 004067BF    call        KERNEL32.LocalAlloc
 004067C4    ret
*}
end;

//004067C8
function GetTlsSize:Integer;
begin
{*
 004067C8    mov         eax,10
 004067CD    ret
*}
end;

//004067D0
procedure InitThreadTLS;
begin
{*
 004067D0    push        ebx
 004067D1    call        GetTlsSize
 004067D6    mov         ebx,eax
 004067D8    test        ebx,ebx
>004067DA    je          00406812
 004067DC    cmp         dword ptr ds:[5AC0C4],0FFFFFFFF
>004067E3    jne         004067EF
 004067E5    mov         eax,0E2
 004067EA    call        @RunError
 004067EF    mov         eax,ebx
 004067F1    call        AllocTlsBuffer
 004067F6    test        eax,eax
>004067F8    jne         00406806
 004067FA    mov         eax,0E2
 004067FF    call        @RunError
>00406804    jmp         00406812
 00406806    push        eax
 00406807    mov         eax,[005AC0C4]
 0040680C    push        eax
 0040680D    call        KERNEL32.TlsSetValue
 00406812    pop         ebx
 00406813    ret
*}
end;

//00406814
function @GetTls:Pointer;
begin
{*
 00406814    mov         cl,byte ptr ds:[5AF660]
 0040681A    mov         eax,[005AC0C4]
 0040681F    test        cl,cl
>00406821    jne         00406849
 00406823    mov         edx,dword ptr fs:[2C]
 0040682A    mov         eax,dword ptr [edx+eax*4]
 0040682D    ret
 0040682E    call        InitThreadTLS
 00406833    mov         eax,[005AC0C4]
 00406838    push        eax
 00406839    call        KERNEL32.TlsGetValue
 0040683E    test        eax,eax
>00406840    je          00406843
 00406842    ret
 00406843    mov         eax,[005AF66C]
 00406848    ret
 00406849    push        eax
 0040684A    call        KERNEL32.TlsGetValue
 0040684F    test        eax,eax
>00406851    je          0040682E
 00406853    ret
*}
end;

//00406854
procedure InitializeModule;
begin
{*
 00406854    mov         eax,5AC0CC
 00406859    call        RegisterModule
 0040685E    ret
*}
end;

//00406860
procedure @InitExe;
begin
{*
 00406860    push        ebx
 00406861    mov         ebx,eax
 00406863    xor         eax,eax
 00406865    mov         [005AC0C4],eax
 0040686A    push        0
 0040686C    call        KERNEL32.GetModuleHandleA
 00406871    mov         [005AF664],eax;gvar_005AF664
 00406876    mov         eax,[005AF664];gvar_005AF664
 0040687B    mov         [005AC0D0],eax
 00406880    xor         eax,eax
 00406882    mov         [005AC0D4],eax
 00406887    xor         eax,eax
 00406889    mov         [005AC0D8],eax
 0040688E    call        InitializeModule
 00406893    mov         edx,5AC0CC
 00406898    mov         eax,ebx
 0040689A    call        @StartExe
 0040689F    pop         ebx
 004068A0    ret
*}
end;

end.