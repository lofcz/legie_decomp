//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit49;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//004332DC
{*
 004332DC    push        ebp
 004332DD    mov         ebp,esp
 004332DF    xor         eax,eax
 004332E1    push        ebp
 004332E2    push        433321
 004332E7    push        dword ptr fs:[eax]
 004332EA    mov         dword ptr fs:[eax],esp
 004332ED    inc         dword ptr ds:[5E0BC4]
>004332F3    jne         00433313
 004332F5    cmp         dword ptr ds:[5ACAC8],0;gvar_005ACAC8
>004332FC    je          00433309
 004332FE    mov         eax,[005ACAC8];0x0 gvar_005ACAC8
 00433303    push        eax
 00433304    call        KERNEL32.FreeLibrary
 00433309    mov         eax,5ACAC4;^'MAPI32.DLL'
 0043330E    call        @LStrClr
 00433313    xor         eax,eax
 00433315    pop         edx
 00433316    pop         ecx
 00433317    pop         ecx
 00433318    mov         dword ptr fs:[eax],edx
 0043331B    push        433328
 00433320    ret
>00433321    jmp         @HandleFinally
>00433326    jmp         00433320
 00433328    pop         ebp
 00433329    ret
*}
end.