//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit95;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//00497294
{*
 00497294    push        ebp
 00497295    mov         ebp,esp
 00497297    xor         eax,eax
 00497299    push        ebp
 0049729A    push        4972CB
 0049729F    push        dword ptr fs:[eax]
 004972A2    mov         dword ptr fs:[eax],esp
 004972A5    inc         dword ptr ds:[5E1580]
>004972AB    jne         004972BD
 004972AD    mov         eax,5AD784;gvar_005AD784:?
 004972B2    mov         edx,dword ptr ds:[4970CC];TObjMat3DS
 004972B8    call        @FinalizeRecord
 004972BD    xor         eax,eax
 004972BF    pop         edx
 004972C0    pop         ecx
 004972C1    pop         ecx
 004972C2    mov         dword ptr fs:[eax],edx
 004972C5    push        4972D2
 004972CA    ret
>004972CB    jmp         @HandleFinally
>004972D0    jmp         004972CA
 004972D2    pop         ebp
 004972D3    ret
*}
end.