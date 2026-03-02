//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit63;

interface

uses
  SysUtils, Classes;

    sub_004A1C60;//004A1C60
    //function sub_004A1C68:?;//004A1C68
    sub_004A1C70;//004A1C70
    sub_004A1C78;//004A1C78
    //function sub_004A1C80:?;//004A1C80
    //function sub_004A1C88:?;//004A1C88
    //function sub_004A1C90:?;//004A1C90
    sub_004A1C98;//004A1C98
    sub_004A1CA0;//004A1CA0
    sub_004A1CA8;//004A1CA8
    sub_004A1CB0;//004A1CB0
    //function sub_004A1CB8:?;//004A1CB8
    sub_004A1CC0;//004A1CC0
    sub_004A1CC8;//004A1CC8
    sub_004A1CD0;//004A1CD0
    //function sub_004A1CD8:?;//004A1CD8
    sub_004A1CE0;//004A1CE0

implementation

//004A1C68
{*function sub_004A1C68:?;
begin
 004A1C68    jmp         dword ptr ds:[608A38]
end;*}

//004A1C80
{*function sub_004A1C80:?;
begin
 004A1C80    jmp         dword ptr ds:[608A2C]
end;*}

//004A1C88
{*function sub_004A1C88:?;
begin
 004A1C88    jmp         dword ptr ds:[608A28]
end;*}

//004A1C90
{*function sub_004A1C90:?;
begin
 004A1C90    jmp         dword ptr ds:[608A24]
end;*}

//004A1CB8
{*function sub_004A1CB8:?;
begin
 004A1CB8    jmp         dword ptr ds:[608A10]
end;*}

//004A1CD8
{*function sub_004A1CD8:?;
begin
 004A1CD8    jmp         dword ptr ds:[608A00]
end;*}

Initialization
//004A1D24
{*
 004A1D24    sub         dword ptr ds:[5E159C],1
>004A1D2B    jae         004A1D44
 004A1D2D    mov         eax,[005AE7C0];^gvar_005AC024
 004A1D32    mov         ax,word ptr [eax]
 004A1D35    mov         [005E15A0],ax;gvar_005E15A0
 004A1D3B    mov         ax,133F
 004A1D3F    call        Set8087CW
 004A1D44    ret
*}
Finalization
//004A1CE8
{*
 004A1CE8    push        ebp
 004A1CE9    mov         ebp,esp
 004A1CEB    xor         eax,eax
 004A1CED    push        ebp
 004A1CEE    push        4A1D1A
 004A1CF3    push        dword ptr fs:[eax]
 004A1CF6    mov         dword ptr fs:[eax],esp
 004A1CF9    inc         dword ptr ds:[5E159C]
>004A1CFF    jne         004A1D0C
 004A1D01    mov         ax,[005E15A0];gvar_005E15A0
 004A1D07    call        Set8087CW
 004A1D0C    xor         eax,eax
 004A1D0E    pop         edx
 004A1D0F    pop         ecx
 004A1D10    pop         ecx
 004A1D11    mov         dword ptr fs:[eax],edx
 004A1D14    push        4A1D21
 004A1D19    ret
>004A1D1A    jmp         @HandleFinally
>004A1D1F    jmp         004A1D19
 004A1D21    pop         ebp
 004A1D22    ret
*}
end.