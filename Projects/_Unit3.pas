//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit3;

interface

uses
  SysUtils, Classes;

    //procedure sub_004068DC(?:?; ?:?; ?:?; ?:?; ?:?);//004068DC
    //procedure sub_004068F8(?:?; ?:?; ?:?);//004068F8
    //procedure sub_00406900(?:?; ?:?; ?:?; ?:?; ?:?);//00406900

implementation

//004068DC
{*procedure sub_004068DC(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004068DC    push        ebp
 004068DD    mov         ebp,esp
 004068DF    push        ebx
 004068E0    mov         ebx,dword ptr [ebp+8]
 004068E3    mov         dword ptr [ebx],eax
 004068E5    mov         dword ptr [ebx+4],edx
 004068E8    mov         eax,dword ptr [ebp+0C]
 004068EB    mov         dword ptr [ebx+0C],eax
 004068EE    mov         dword ptr [ebx+8],ecx
 004068F1    pop         ebx
 004068F2    pop         ebp
 004068F3    ret         8
end;*}

//004068F8
{*procedure sub_004068F8(?:?; ?:?; ?:?);
begin
 004068F8    mov         dword ptr [ecx],eax
 004068FA    mov         dword ptr [ecx+4],edx
 004068FD    ret
end;*}

//00406900
{*procedure sub_00406900(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00406900    push        ebp
 00406901    mov         ebp,esp
 00406903    push        ebx
 00406904    mov         ebx,dword ptr [ebp+8]
 00406907    mov         dword ptr [ebx],eax
 00406909    mov         dword ptr [ebx+4],edx
 0040690C    add         ecx,eax
 0040690E    mov         dword ptr [ebx+8],ecx
 00406911    add         edx,dword ptr [ebp+0C]
 00406914    mov         dword ptr [ebx+0C],edx
 00406917    pop         ebx
 00406918    pop         ebp
 00406919    ret         8
end;*}

end.