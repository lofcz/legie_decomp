//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit35;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//0042EF28
{*
 0042EF28    push        ebp
 0042EF29    mov         ebp,esp
 0042EF2B    xor         eax,eax
 0042EF2D    push        ebp
 0042EF2E    push        42EF59
 0042EF33    push        dword ptr fs:[eax]
 0042EF36    mov         dword ptr fs:[eax],esp
 0042EF39    inc         dword ptr ds:[5E0A0C]
>0042EF3F    jne         0042EF4B
 0042EF41    mov         eax,[005AC858];0x0 gvar_005AC858
 0042EF46    call        TObject.Free
 0042EF4B    xor         eax,eax
 0042EF4D    pop         edx
 0042EF4E    pop         ecx
 0042EF4F    pop         ecx
 0042EF50    mov         dword ptr fs:[eax],edx
 0042EF53    push        42EF60
 0042EF58    ret
>0042EF59    jmp         @HandleFinally
>0042EF5E    jmp         0042EF58
 0042EF60    pop         ebp
 0042EF61    ret
*}
end.