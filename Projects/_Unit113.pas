//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit113;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//004BB1DC
{*
 004BB1DC    push        ebp
 004BB1DD    mov         ebp,esp
 004BB1DF    xor         eax,eax
 004BB1E1    push        ebp
 004BB1E2    push        4BB20D
 004BB1E7    push        dword ptr fs:[eax]
 004BB1EA    mov         dword ptr fs:[eax],esp
 004BB1ED    inc         dword ptr ds:[5E1804]
>004BB1F3    jne         004BB1FF
 004BB1F5    mov         eax,5E1800;gvar_005E1800:AnsiString
 004BB1FA    call        @LStrClr
 004BB1FF    xor         eax,eax
 004BB201    pop         edx
 004BB202    pop         ecx
 004BB203    pop         ecx
 004BB204    mov         dword ptr fs:[eax],edx
 004BB207    push        4BB214
 004BB20C    ret
>004BB20D    jmp         @HandleFinally
>004BB212    jmp         004BB20C
 004BB214    pop         ebp
 004BB215    ret
*}
end.