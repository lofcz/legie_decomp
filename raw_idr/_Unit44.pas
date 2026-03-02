//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit44;

interface

uses
  SysUtils, Classes;

    procedure sub_004325AC;//004325AC

implementation

//004325AC
procedure sub_004325AC;
begin
{*
 004325AC    push        ebx
 004325AD    push        esi
 004325AE    mov         bl,0B
 004325B0    mov         esi,5E0B8C;gvar_005E0B8C:Pointer
 004325B5    mov         eax,dword ptr [esi]
 004325B7    call        TObject.Free
 004325BC    add         esi,4
 004325BF    dec         bl
>004325C1    jne         004325B5
 004325C3    pop         esi
 004325C4    pop         ebx
 004325C5    ret
*}
end;

Initialization
//0043267C
{*
 0043267C    sub         dword ptr ds:[5E0B88],1
>00432683    jae         004326A0
 00432685    mov         eax,4325C8
 0043268A    call        @InitImports
 0043268F    mov         eax,5E0B8C;gvar_005E0B8C:Pointer
 00432694    xor         ecx,ecx
 00432696    mov         edx,2C
 0043269B    call        @FillChar
 004326A0    ret
*}
Finalization
end.