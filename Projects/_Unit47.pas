//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit47;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//0043251C
{*
 0043251C    sub         dword ptr ds:[5E0B7C],1
>00432523    jae         0043254C
 00432525    push        432550;'Delphi Picture'
 0043252A    call        user32.RegisterClipboardFormatA
 0043252F    mov         [005E0B78],ax;gvar_005E0B78:LongWord
 00432535    push        432560;'Delphi Component'
 0043253A    call        user32.RegisterClipboardFormatA
 0043253F    mov         [005E0B7A],ax;gvar_005E0B7A:LongWord
 00432545    xor         eax,eax
 00432547    mov         [005E0B80],eax;gvar_005E0B80
 0043254C    ret
*}
Finalization
//004324E0
{*
 004324E0    push        ebp
 004324E1    mov         ebp,esp
 004324E3    xor         eax,eax
 004324E5    push        ebp
 004324E6    push        432511
 004324EB    push        dword ptr fs:[eax]
 004324EE    mov         dword ptr fs:[eax],esp
 004324F1    inc         dword ptr ds:[5E0B7C]
>004324F7    jne         00432503
 004324F9    mov         eax,[005E0B80];gvar_005E0B80
 004324FE    call        TObject.Free
 00432503    xor         eax,eax
 00432505    pop         edx
 00432506    pop         ecx
 00432507    pop         ecx
 00432508    mov         dword ptr fs:[eax],edx
 0043250B    push        432518
 00432510    ret
>00432511    jmp         @HandleFinally
>00432516    jmp         00432510
 00432518    pop         ebp
 00432519    ret
*}
end.