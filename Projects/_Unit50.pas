//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit50;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//00433334
{*
 00433334    push        ebp
 00433335    mov         ebp,esp
 00433337    xor         eax,eax
 00433339    push        ebp
 0043333A    push        433378
 0043333F    push        dword ptr fs:[eax]
 00433342    mov         dword ptr fs:[eax],esp
 00433345    inc         dword ptr ds:[5E0BC8]
>0043334B    jne         0043336A
 0043334D    cmp         byte ptr ds:[5E0BD0],0;gvar_005E0BD0
>00433354    je          0043336A
 00433356    cmp         dword ptr ds:[5E0BCC],0;gvar_005E0BCC
>0043335D    je          0043336A
 0043335F    mov         eax,[005E0BCC];gvar_005E0BCC
 00433364    push        eax
 00433365    call        KERNEL32.FreeLibrary
 0043336A    xor         eax,eax
 0043336C    pop         edx
 0043336D    pop         ecx
 0043336E    pop         ecx
 0043336F    mov         dword ptr fs:[eax],edx
 00433372    push        43337F
 00433377    ret
>00433378    jmp         @HandleFinally
>0043337D    jmp         00433377
 0043337F    pop         ebp
 00433380    ret
*}
end.