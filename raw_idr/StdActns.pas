//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit StdActns;

interface

uses
  SysUtils, Classes;

type
  THintAction = class(TCustomAction)
  public
    constructor Create(AOwner:TComponent); virtual;//v2C//00435DCC
  end;
    constructor Create(AOwner:TComponent);//00435DCC

implementation

//00435DCC
constructor THintAction.Create(AOwner:TComponent);
begin
{*
 00435DCC    push        ebx
 00435DCD    push        esi
 00435DCE    test        dl,dl
>00435DD0    je          00435DDA
 00435DD2    add         esp,0FFFFFFF0
 00435DD5    call        @ClassCreate
 00435DDA    mov         ebx,edx
 00435DDC    mov         esi,eax
 00435DDE    xor         edx,edx
 00435DE0    mov         eax,esi
 00435DE2    call        TCustomAction.Create
 00435DE7    mov         byte ptr [esi+60],0
 00435DEB    mov         eax,esi
 00435DED    test        bl,bl
>00435DEF    je          00435E00
 00435DF1    call        @AfterConstruction
 00435DF6    pop         dword ptr fs:[0]
 00435DFD    add         esp,0C
 00435E00    mov         eax,esi
 00435E02    pop         esi
 00435E03    pop         ebx
 00435E04    ret
*}
end;

end.