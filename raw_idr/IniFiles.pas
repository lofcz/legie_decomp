//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IniFiles;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//004326F4
{*
 004326F4    push        ebp
 004326F5    mov         ebp,esp
 004326F7    xor         eax,eax
 004326F9    push        ebp
 004326FA    push        432730
 004326FF    push        dword ptr fs:[eax]
 00432702    mov         dword ptr fs:[eax],esp
 00432705    inc         dword ptr ds:[5E0BBC]
>0043270B    jne         00432722
 0043270D    mov         eax,5ACAB4
 00432712    mov         ecx,2
 00432717    mov         edx,dword ptr ds:[4010B4];String
 0043271D    call        @FinalizeArray
 00432722    xor         eax,eax
 00432724    pop         edx
 00432725    pop         ecx
 00432726    pop         ecx
 00432727    mov         dword ptr fs:[eax],edx
 0043272A    push        432737
 0043272F    ret
>00432730    jmp         @HandleFinally
>00432735    jmp         0043272F
 00432737    pop         ebp
 00432738    ret
*}
end.