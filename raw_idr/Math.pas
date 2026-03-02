//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Math;

interface

uses
  SysUtils, Classes;

    function Min(const A:Integer; const B:Integer):Integer;//0042D2F8
    function Max(const A:Integer; const B:Integer):Integer;//0042D300

implementation

//0042D2F8
function Min(const A:Integer; const B:Integer):Integer;
begin
{*
 0042D2F8    cmp         edx,eax
>0042D2FA    jg          0042D2FE
 0042D2FC    mov         eax,edx
 0042D2FE    ret
*}
end;

//0042D300
function Max(const A:Integer; const B:Integer):Integer;
begin
{*
 0042D300    cmp         edx,eax
>0042D302    jl          0042D306
 0042D304    mov         eax,edx
 0042D306    ret
*}
end;

end.