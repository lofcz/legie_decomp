//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit69;

interface

uses
  SysUtils, Classes;

    //procedure sub_0045C8C4(?:?; ?:?; ?:?; ?:?);//0045C8C4
    //procedure sub_0045C8DC(?:?; ?:?; ?:?; ?:?);//0045C8DC
    //procedure sub_0045C8F4(?:?; ?:?);//0045C8F4
    //procedure sub_0045C908(?:?; ?:?; ?:?);//0045C908
    //procedure sub_0045C928(?:?; ?:?; ?:?; ?:?; ?:?);//0045C928
    //procedure sub_0045C948(?:?; ?:?; ?:?; ?:?);//0045C948
    //procedure sub_0045C968(?:?; ?:?);//0045C968
    //procedure sub_0045C980(?:Byte; ?:?; ?:?; ?:?; ?:?);//0045C980
    //procedure sub_0045C9A0(?:?; ?:?; ?:?);//0045C9A0
    //procedure sub_0045C9C0(?:Integer; ?:?);//0045C9C0
    //procedure sub_0045C9D8(?:?; ?:?; ?:?; ?:?);//0045C9D8
    //procedure sub_0045C9FC(?:?; ?:?);//0045C9FC
    //procedure sub_0045CA18(?:?; ?:?);//0045CA18
    //procedure sub_0045CA34(?:?; ?:?; ?:?; ?:?);//0045CA34
    //procedure sub_0045CA4C(?:?; ?:?);//0045CA4C
    //procedure sub_0045CA68(?:?);//0045CA68
    //procedure sub_0045CA78(?:Integer; ?:?);//0045CA78
    //procedure sub_0045CA94(?:?; ?:?; ?:?);//0045CA94
    //procedure sub_0045CADC(?:Integer; ?:?);//0045CADC
    //procedure sub_0045CAF8(?:?; ?:?);//0045CAF8
    //procedure sub_0045CB40(?:dword; ?:?; ?:dword; ?:?);//0045CB40
    //procedure sub_0045CBA8(?:Integer; ?:?);//0045CBA8
    //procedure sub_0045CBC4(?:?; ?:?; ?:?);//0045CBC4
    //procedure sub_0045CBE4(?:?; ?:?; ?:?);//0045CBE4
    //procedure sub_0045CC04(?:Single; ?:Single; ?:?);//0045CC04
    //procedure sub_0045CC4C(?:?; ?:?; ?:?);//0045CC4C
    //procedure sub_0045CC94(?:?; ?:?);//0045CC94
    //procedure sub_0045CCB0(?:?; ?:Integer);//0045CCB0
    //procedure sub_0045CCF8(?:?; ?:?; ?:Integer);//0045CCF8
    //procedure sub_0045CD18(?:?; ?:?; ?:?; ?:?);//0045CD18
    //procedure sub_0045CD54(?:?; ?:?; ?:?);//0045CD54
    //procedure sub_0045CDB0(?:?; ?:?; ?:?; ?:?);//0045CDB0
    //function sub_0045CE18(?:?; ?:?):?;//0045CE18
    //procedure sub_0045CE30(?:?; ?:Integer);//0045CE30
    //function sub_0045CE50(?:?; ?:?):?;//0045CE50
    //procedure sub_0045CE68(?:?; ?:?; ?:?);//0045CE68
    //function sub_0045CE88(?:?; ?:?; ?:?):?;//0045CE88
    //procedure sub_0045CEA8(?:?; ?:?);//0045CEA8
    procedure sub_0045CEDC(?:Single; ?:Single; ?:Single);//0045CEDC
    //procedure sub_0045CF14(?:?; ?:?; ?:?);//0045CF14
    //procedure sub_0045CF4C(?:?; ?:?);//0045CF4C
    //procedure sub_0045CF80(?:?; ?:?);//0045CF80
    //procedure sub_0045CFB4(?:Integer; ?:Integer; ?:?);//0045CFB4
    //procedure sub_0045CFEC(?:?; ?:Byte; ?:?);//0045CFEC
    //procedure sub_0045D030(?:?; ?:?; ?:?);//0045D030
    //procedure sub_0045D074(?:?; ?:?; ?:?; ?:?);//0045D074
    //procedure sub_0045D164(?:?; ?:?; ?:?; ?:?);//0045D164
    //procedure sub_0045D18C(?:?; ?:?; ?:?; ?:?; ?:?);//0045D18C
    //procedure sub_0045D200(?:?; ?:?; ?:?);//0045D200
    //procedure sub_0045D2A8(?:?; ?:?; ?:?; ?:?; ?:?);//0045D2A8
    //procedure sub_0045D368(?:?; ?:?; ?:?);//0045D368
    //procedure sub_0045D3F0(?:?; ?:?);//0045D3F0
    //function sub_0045D408(?:?):?;//0045D408
    //function sub_0045D420(?:Single):?;//0045D420
    //function sub_0045D438(?:?):?;//0045D438
    //function sub_0045D44C(?:?):?;//0045D44C
    procedure sub_0045D460(?:Integer);//0045D460
    //procedure sub_0045D4DC(?:?; ?:?);//0045D4DC
    procedure sub_0045D558(?:dword; ?:dword);//0045D558
    procedure sub_0045D5EC(?:Integer);//0045D5EC
    //procedure sub_0045D674(?:?; ?:?);//0045D674
    //procedure sub_0045D6FC(?:?);//0045D6FC
    //procedure sub_0045D714(?:?);//0045D714
    //procedure sub_0045D734(?:?);//0045D734
    //procedure sub_0045D74C(?:?);//0045D74C
    //procedure sub_0045D76C(?:?; ?:?);//0045D76C
    //procedure sub_0045D78C(?:?; ?:?);//0045D78C
    //procedure sub_0045D7E0(?:Integer; ?:?);//0045D7E0
    //procedure sub_0045D7FC(?:?; ?:?);//0045D7FC
    //procedure sub_0045D824(?:?; ?:?);//0045D824
    //procedure sub_0045D844(?:?; ?:?);//0045D844
    //function sub_0045D870(?:dword; ?:Pointer):?;//0045D870
    //function sub_0045D898(?:?; ?:Integer):?;//0045D898
    //function sub_0045D8B4(?:Integer; ?:?):?;//0045D8B4
    //function sub_0045D8D4(?:?):?;//0045D8D4
    //function sub_0045D90C(?:?; ?:?):?;//0045D90C
    //procedure sub_0045D928(?:?; ?:?);//0045D928
    //function sub_0045D948(?:Integer; ?:?):?;//0045D948
    //procedure sub_0045D964(?:?; ?:?; ?:?);//0045D964
    //procedure sub_0045D9A4(?:?; ?:?; ?:?);//0045D9A4
    //procedure sub_0045D9E0(?:?; ?:?);//0045D9E0
    //procedure sub_0045DA0C(?:Single; ?:?; ?:?);//0045DA0C
    //procedure sub_0045DA44(?:?; ?:?; ?:?);//0045DA44
    //procedure sub_0045DA88(?:?; ?:?; ?:?);//0045DA88
    //procedure sub_0045DACC(?:?; ?:?; ?:?);//0045DACC
    //procedure sub_0045DB10(?:?; ?:?; ?:?);//0045DB10
    //procedure sub_0045DC1C(?:Single; ?:?; ?:?);//0045DC1C
    //procedure sub_0045DC38(?:Integer; ?:?; ?:?);//0045DC38
    //procedure sub_0045E014(?:?; ?:?; ?:?);//0045E014
    //procedure sub_0045E03C(?:?; ?:?; ?:?);//0045E03C
    //procedure sub_0045E138(?:Integer; ?:?);//0045E138
    //function sub_0045E18C(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//0045E18C
    //function sub_0045E1D4(?:?):?;//0045E1D4
    //procedure sub_0045E294(?:?);//0045E294
    //procedure sub_0045E5E4(?:?; ?:?);//0045E5E4
    //procedure sub_0045E620(?:?);//0045E620
    //procedure sub_0045E680(?:?);//0045E680
    //procedure sub_0045E6F0(?:?);//0045E6F0
    //procedure sub_0045E748(?:?; ?:?; ?:?);//0045E748
    //procedure sub_0045E790(?:?; ?:?);//0045E790
    //procedure sub_0045E850(?:?; ?:?);//0045E850
    //procedure sub_0045EC8C(?:Integer; ?:Integer; ?:Integer; ?:?);//0045EC8C
    //procedure sub_0045ECD4(?:?; ?:?; ?:?; ?:?);//0045ECD4
    //procedure sub_0045ED1C(?:?);//0045ED1C
    //procedure sub_0045ED54(?:?; ?:?);//0045ED54
    //function sub_0045ED70(?:?):?;//0045ED70
    //procedure sub_0045ED98(?:?);//0045ED98
    //procedure sub_0045EDF4(?:?; ?:?; ?:?);//0045EDF4
    //procedure sub_0045EE90(?:?; ?:?);//0045EE90
    //procedure sub_0045F024(?:?; ?:?; ?:?);//0045F024
    //procedure sub_0045F090(?:?; ?:?; ?:?; ?:?; ?:?);//0045F090
    //procedure sub_0045F14C(?:?; ?:?; ?:?; ?:?; ?:?);//0045F14C
    //procedure sub_0045F3CC(?:?; ?:?);//0045F3CC
    //function sub_0045F454(?:?; ?:?):?;//0045F454
    //function sub_0045F480(?:Extended):?;//0045F480
    //function sub_0045F4AC(?:?):?;//0045F4AC
    //function sub_0045F4BC(?:Extended):?;//0045F4BC
    //procedure sub_0045F4E8(?:?);//0045F4E8
    //function sub_0045F4F8(?:?):?;//0045F4F8
    procedure sub_0045F560(?:Extended);//0045F560
    //procedure sub_0045F570(?:?);//0045F570
    //procedure sub_0045F580(?:?; ?:?);//0045F580
    //function sub_0045F598(?:Extended; ?:?; ?:?):?;//0045F598
    //function sub_0045F5D4(?:Extended; ?:?; ?:?):?;//0045F5D4
    //function sub_0045F610(?:Extended; ?:Extended):?;//0045F610
    //function sub_0045F620(?:?; ?:?):?;//0045F620
    procedure sub_0045F630(?:Extended);//0045F630
    //function sub_0045F640(?:?):?;//0045F640
    //procedure sub_0045F67C(?:?);//0045F67C
    //function sub_0045F688(?:?):?;//0045F688
    procedure sub_0045F6A8(?:Extended);//0045F6A8
    //function sub_0045F6C8(?:?):?;//0045F6C8
    //function sub_0045F6EC(?:?):?;//0045F6EC
    //function sub_0045F6FC(?:Extended; ?:Extended):?;//0045F6FC
    //function sub_0045F710(?:?; ?:?):?;//0045F710
    //procedure sub_0045F718(?:?; ?:Integer; ?:?);//0045F718
    //procedure sub_0045F780(?:?; ?:?);//0045F780
    //function sub_0045F7C4(?:?; ?:?; ?:?):?;//0045F7C4
    //procedure sub_0045F7F0(?:?; ?:?; ?:?; ?:?);//0045F7F0
    //function sub_0045F94C(?:Integer; ?:Integer; ?:Integer; ?:?; ?:?; ?:?; ?:?):?;//0045F94C
    //function sub_0045FAAC(?:Integer; ?:Integer; ?:Integer; ?:?; ?:?; ?:?):?;//0045FAAC
    //function sub_0045FBB8(?:?; ?:?):?;//0045FBB8
    //procedure sub_0045FC18(?:?; ?:?);//0045FC18
    //function sub_0045FD40(?:?):?;//0045FD40
    //function sub_0045FD50(?:?; ?:?; ?:?):?;//0045FD50
    //function sub_0045FDDC(?:?; ?:?; ?:?):?;//0045FDDC

implementation

//0045C8C4
{*procedure sub_0045C8C4(?:?; ?:?; ?:?; ?:?);
begin
 0045C8C4    push        ebp
 0045C8C5    mov         ebp,esp
 0045C8C7    mov         edx,dword ptr [ebp+10]
 0045C8CA    mov         dword ptr [eax],edx
 0045C8CC    mov         edx,dword ptr [ebp+0C]
 0045C8CF    mov         dword ptr [eax+4],edx
 0045C8D2    mov         edx,dword ptr [ebp+8]
 0045C8D5    mov         dword ptr [eax+8],edx
 0045C8D8    pop         ebp
 0045C8D9    ret         0C
end;*}

//0045C8DC
{*procedure sub_0045C8DC(?:?; ?:?; ?:?; ?:?);
begin
 0045C8DC    push        ebp
 0045C8DD    mov         ebp,esp
 0045C8DF    mov         edx,dword ptr [ebp+10]
 0045C8E2    mov         dword ptr [eax],edx
 0045C8E4    mov         edx,dword ptr [ebp+0C]
 0045C8E7    mov         dword ptr [eax+4],edx
 0045C8EA    mov         edx,dword ptr [ebp+8]
 0045C8ED    mov         dword ptr [eax+8],edx
 0045C8F0    pop         ebp
 0045C8F1    ret         0C
end;*}

//0045C8F4
{*procedure sub_0045C8F4(?:?; ?:?);
begin
 0045C8F4    mov         ecx,dword ptr [edx]
 0045C8F6    mov         dword ptr [eax],ecx
 0045C8F8    mov         ecx,dword ptr [edx+4]
 0045C8FB    mov         dword ptr [eax+4],ecx
 0045C8FE    mov         edx,dword ptr [edx+8]
 0045C901    mov         dword ptr [eax+8],edx
 0045C904    ret
end;*}

//0045C908
{*procedure sub_0045C908(?:?; ?:?; ?:?);
begin
 0045C908    push        ebp
 0045C909    mov         ebp,esp
 0045C90B    mov         ecx,dword ptr [eax]
 0045C90D    mov         dword ptr [edx],ecx
 0045C90F    mov         ecx,dword ptr [eax+4]
 0045C912    mov         dword ptr [edx+4],ecx
 0045C915    mov         eax,dword ptr [eax+8]
 0045C918    mov         dword ptr [edx+8],eax
 0045C91B    mov         eax,dword ptr [ebp+8]
 0045C91E    mov         dword ptr [edx+0C],eax
 0045C921    pop         ebp
 0045C922    ret         4
end;*}

//0045C928
{*procedure sub_0045C928(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0045C928    push        ebp
 0045C929    mov         ebp,esp
 0045C92B    mov         edx,dword ptr [ebp+14]
 0045C92E    mov         dword ptr [eax],edx
 0045C930    mov         edx,dword ptr [ebp+10]
 0045C933    mov         dword ptr [eax+4],edx
 0045C936    mov         edx,dword ptr [ebp+0C]
 0045C939    mov         dword ptr [eax+8],edx
 0045C93C    mov         edx,dword ptr [ebp+8]
 0045C93F    mov         dword ptr [eax+0C],edx
 0045C942    pop         ebp
 0045C943    ret         10
end;*}

//0045C948
{*procedure sub_0045C948(?:?; ?:?; ?:?; ?:?);
begin
 0045C948    push        ebp
 0045C949    mov         ebp,esp
 0045C94B    mov         edx,dword ptr [ebp+10]
 0045C94E    mov         dword ptr [eax],edx
 0045C950    mov         edx,dword ptr [ebp+0C]
 0045C953    mov         dword ptr [eax+4],edx
 0045C956    mov         edx,dword ptr [ebp+8]
 0045C959    mov         dword ptr [eax+8],edx
 0045C95C    mov         dword ptr [eax+0C],3F800000
 0045C963    pop         ebp
 0045C964    ret         0C
end;*}

//0045C968
{*procedure sub_0045C968(?:?; ?:?);
begin
 0045C968    mov         ecx,dword ptr [eax]
 0045C96A    mov         dword ptr [edx],ecx
 0045C96C    mov         ecx,dword ptr [eax+4]
 0045C96F    mov         dword ptr [edx+4],ecx
 0045C972    mov         eax,dword ptr [eax+8]
 0045C975    mov         dword ptr [edx+8],eax
 0045C978    mov         dword ptr [edx+0C],3F800000
 0045C97F    ret
end;*}

//0045C980
{*procedure sub_0045C980(?:Byte; ?:?; ?:?; ?:?; ?:?);
begin
 0045C980    push        ebp
 0045C981    mov         ebp,esp
 0045C983    mov         edx,dword ptr [ebp+14]
 0045C986    mov         dword ptr [eax],edx
 0045C988    mov         edx,dword ptr [ebp+10]
 0045C98B    mov         dword ptr [eax+4],edx
 0045C98E    mov         edx,dword ptr [ebp+0C]
 0045C991    mov         dword ptr [eax+8],edx
 0045C994    mov         edx,dword ptr [ebp+8]
 0045C997    mov         dword ptr [eax+0C],edx
 0045C99A    pop         ebp
 0045C99B    ret         10
end;*}

//0045C9A0
{*procedure sub_0045C9A0(?:?; ?:?; ?:?);
begin
 0045C9A0    push        ebp
 0045C9A1    mov         ebp,esp
 0045C9A3    mov         ecx,dword ptr [edx]
 0045C9A5    mov         dword ptr [eax],ecx
 0045C9A7    mov         ecx,dword ptr [edx+4]
 0045C9AA    mov         dword ptr [eax+4],ecx
 0045C9AD    mov         edx,dword ptr [edx+8]
 0045C9B0    mov         dword ptr [eax+8],edx
 0045C9B3    mov         edx,dword ptr [ebp+8]
 0045C9B6    mov         dword ptr [eax+0C],edx
 0045C9B9    pop         ebp
 0045C9BA    ret         4
end;*}

//0045C9C0
{*procedure sub_0045C9C0(?:Integer; ?:?);
begin
 0045C9C0    mov         ecx,dword ptr [edx]
 0045C9C2    mov         dword ptr [eax],ecx
 0045C9C4    mov         ecx,dword ptr [edx+4]
 0045C9C7    mov         dword ptr [eax+4],ecx
 0045C9CA    mov         ecx,dword ptr [edx+8]
 0045C9CD    mov         dword ptr [eax+8],ecx
 0045C9D0    mov         edx,dword ptr [edx+0C]
 0045C9D3    mov         dword ptr [eax+0C],edx
 0045C9D6    ret
end;*}

//0045C9D8
{*procedure sub_0045C9D8(?:?; ?:?; ?:?; ?:?);
begin
 0045C9D8    push        ebp
 0045C9D9    mov         ebp,esp
 0045C9DB    mov         edx,dword ptr [ebp+10]
 0045C9DE    mov         dword ptr [eax],edx
 0045C9E0    mov         edx,dword ptr [ebp+0C]
 0045C9E3    mov         dword ptr [eax+4],edx
 0045C9E6    mov         edx,dword ptr [ebp+8]
 0045C9E9    mov         dword ptr [eax+8],edx
 0045C9EC    mov         edx,dword ptr ds:[5AD06C];0x3F800000 gvar_005AD06C:Single
 0045C9F2    mov         dword ptr [eax+0C],edx
 0045C9F5    pop         ebp
 0045C9F6    ret         0C
end;*}

//0045C9FC
{*procedure sub_0045C9FC(?:?; ?:?);
begin
 0045C9FC    mov         ecx,dword ptr [edx]
 0045C9FE    mov         dword ptr [eax],ecx
 0045CA00    mov         ecx,dword ptr [edx+4]
 0045CA03    mov         dword ptr [eax+4],ecx
 0045CA06    mov         edx,dword ptr [edx+8]
 0045CA09    mov         dword ptr [eax+8],edx
 0045CA0C    mov         edx,dword ptr ds:[5AD06C];0x3F800000 gvar_005AD06C:Single
 0045CA12    mov         dword ptr [eax+0C],edx
 0045CA15    ret
end;*}

//0045CA18
{*procedure sub_0045CA18(?:?; ?:?);
begin
 0045CA18    mov         ecx,dword ptr [edx]
 0045CA1A    mov         dword ptr [eax],ecx
 0045CA1C    mov         ecx,dword ptr [edx+4]
 0045CA1F    mov         dword ptr [eax+4],ecx
 0045CA22    mov         edx,dword ptr [edx+8]
 0045CA25    mov         dword ptr [eax+8],edx
 0045CA28    mov         edx,dword ptr ds:[5AD06C];0x3F800000 gvar_005AD06C:Single
 0045CA2E    mov         dword ptr [eax+0C],edx
 0045CA31    ret
end;*}

//0045CA34
{*procedure sub_0045CA34(?:?; ?:?; ?:?; ?:?);
begin
 0045CA34    push        ebp
 0045CA35    mov         ebp,esp
 0045CA37    mov         edx,dword ptr [ebp+10]
 0045CA3A    mov         dword ptr [eax],edx
 0045CA3C    mov         edx,dword ptr [ebp+0C]
 0045CA3F    mov         dword ptr [eax+4],edx
 0045CA42    mov         edx,dword ptr [ebp+8]
 0045CA45    mov         dword ptr [eax+8],edx
 0045CA48    pop         ebp
 0045CA49    ret         0C
end;*}

//0045CA4C
{*procedure sub_0045CA4C(?:?; ?:?);
begin
 0045CA4C    mov         ecx,dword ptr [edx]
 0045CA4E    mov         dword ptr [eax],ecx
 0045CA50    mov         ecx,dword ptr [edx+4]
 0045CA53    mov         dword ptr [eax+4],ecx
 0045CA56    mov         edx,dword ptr [edx+8]
 0045CA59    mov         dword ptr [eax+8],edx
 0045CA5C    mov         edx,dword ptr ds:[5AD068];0x0 gvar_005AD068:Single
 0045CA62    mov         dword ptr [eax+0C],edx
 0045CA65    ret
end;*}

//0045CA68
{*procedure sub_0045CA68(?:?);
begin
 0045CA68    xor         edx,edx
 0045CA6A    mov         dword ptr [eax],edx
 0045CA6C    mov         dword ptr [eax+4],edx
 0045CA6F    mov         dword ptr [eax+8],edx
 0045CA72    mov         dword ptr [eax+0C],edx
 0045CA75    ret
end;*}

//0045CA78
{*procedure sub_0045CA78(?:Integer; ?:?);
begin
 0045CA78    fld         dword ptr [eax]
 0045CA7A    fadd        dword ptr [edx]
 0045CA7C    fstp        dword ptr [ecx]
 0045CA7E    fld         dword ptr [eax+4]
 0045CA81    fadd        dword ptr [edx+4]
 0045CA84    fstp        dword ptr [ecx+4]
 0045CA87    fld         dword ptr [eax+8]
 0045CA8A    fadd        dword ptr [edx+8]
 0045CA8D    fstp        dword ptr [ecx+8]
 0045CA90    ret
end;*}

//0045CA94
{*procedure sub_0045CA94(?:?; ?:?; ?:?);
begin
 0045CA94    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CA9B    je          0045CAB7
 0045CA9D    movq        mm0,mmword ptr [eax]
 0045CAA0    pfadd       mm0,mmword ptr [edx]
 0045CAA4    movq        mmword ptr [ecx],mm0
 0045CAA7    movq        mm1,mmword ptr [eax+8]
 0045CAAB    pfadd       mm1,mmword ptr [edx+8]
 0045CAB0    movq        mmword ptr [ecx+8],mm1
 0045CAB4    femms
 0045CAB6    ret
 0045CAB7    fld         dword ptr [eax]
 0045CAB9    fadd        dword ptr [edx]
 0045CABB    fstp        dword ptr [ecx]
 0045CABD    fld         dword ptr [eax+4]
 0045CAC0    fadd        dword ptr [edx+4]
 0045CAC3    fstp        dword ptr [ecx+4]
 0045CAC6    fld         dword ptr [eax+8]
 0045CAC9    fadd        dword ptr [edx+8]
 0045CACC    fstp        dword ptr [ecx+8]
 0045CACF    fld         dword ptr [eax+0C]
 0045CAD2    fadd        dword ptr [edx+0C]
 0045CAD5    fstp        dword ptr [ecx+0C]
 0045CAD8    ret
end;*}

//0045CADC
{*procedure sub_0045CADC(?:Integer; ?:?);
begin
 0045CADC    fld         dword ptr [eax]
 0045CADE    fadd        dword ptr [edx]
 0045CAE0    fstp        dword ptr [eax]
 0045CAE2    fld         dword ptr [eax+4]
 0045CAE5    fadd        dword ptr [edx+4]
 0045CAE8    fstp        dword ptr [eax+4]
 0045CAEB    fld         dword ptr [eax+8]
 0045CAEE    fadd        dword ptr [edx+8]
 0045CAF1    fstp        dword ptr [eax+8]
 0045CAF4    ret
end;*}

//0045CAF8
{*procedure sub_0045CAF8(?:?; ?:?);
begin
 0045CAF8    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CAFF    je          0045CB1B
 0045CB01    movq        mm0,mmword ptr [eax]
 0045CB04    pfadd       mm0,mmword ptr [edx]
 0045CB08    movq        mmword ptr [eax],mm0
 0045CB0B    movq        mm1,mmword ptr [eax+8]
 0045CB0F    pfadd       mm1,mmword ptr [edx+8]
 0045CB14    movq        mmword ptr [eax+8],mm1
 0045CB18    femms
 0045CB1A    ret
 0045CB1B    fld         dword ptr [eax]
 0045CB1D    fadd        dword ptr [edx]
 0045CB1F    fstp        dword ptr [eax]
 0045CB21    fld         dword ptr [eax+4]
 0045CB24    fadd        dword ptr [edx+4]
 0045CB27    fstp        dword ptr [eax+4]
 0045CB2A    fld         dword ptr [eax+8]
 0045CB2D    fadd        dword ptr [edx+8]
 0045CB30    fstp        dword ptr [eax+8]
 0045CB33    fld         dword ptr [eax+0C]
 0045CB36    fadd        dword ptr [edx+0C]
 0045CB39    fstp        dword ptr [eax+0C]
 0045CB3C    ret
end;*}

//0045CB40
{*procedure sub_0045CB40(?:dword; ?:?; ?:dword; ?:?);
begin
 0045CB40    push        ebp
 0045CB41    mov         ebp,esp
 0045CB43    or          ecx,ecx
>0045CB45    je          0045CBA3
 0045CB47    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CB4E    jne         0045CB78
 0045CB50    push        edi
 0045CB51    mov         edi,dword ptr [ebp+8]
 0045CB54    fld         dword ptr [eax]
 0045CB56    fadd        dword ptr [edx]
 0045CB58    fstp        dword ptr [edi]
 0045CB5A    fld         dword ptr [eax+4]
 0045CB5D    fadd        dword ptr [edx+4]
 0045CB60    fstp        dword ptr [edi+4]
 0045CB63    fld         dword ptr [eax+8]
 0045CB66    fadd        dword ptr [edx+8]
 0045CB69    fstp        dword ptr [edi+8]
 0045CB6C    add         eax,0C
 0045CB6F    add         edi,0C
 0045CB72    dec         ecx
>0045CB73    jne         0045CB54
 0045CB75    pop         edi
>0045CB76    jmp         0045CBA3
 0045CB78    movq        mm0,mmword ptr [edx]
 0045CB7B    movd        mm1,dword ptr [edx+8]
 0045CB7F    mov         edx,dword ptr [ebp+8]
 0045CB82    movq        mm2,mmword ptr [eax]
 0045CB85    movd        mm3,dword ptr [eax+8]
 0045CB89    pfadd       mm2,mm0
 0045CB8D    pfadd       mm3,mm1
 0045CB91    movq        mmword ptr [edx],mm2
 0045CB94    movd        dword ptr [edx+8],mm3
 0045CB98    add         eax,0C
 0045CB9B    add         edx,0C
 0045CB9E    dec         ecx
>0045CB9F    jne         0045CB82
 0045CBA1    femms
 0045CBA3    pop         ebp
 0045CBA4    ret         4
end;*}

//0045CBA8
{*procedure sub_0045CBA8(?:Integer; ?:?);
begin
 0045CBA8    fld         dword ptr [eax]
 0045CBAA    fsub        dword ptr [edx]
 0045CBAC    fstp        dword ptr [ecx]
 0045CBAE    fld         dword ptr [eax+4]
 0045CBB1    fsub        dword ptr [edx+4]
 0045CBB4    fstp        dword ptr [ecx+4]
 0045CBB7    fld         dword ptr [eax+8]
 0045CBBA    fsub        dword ptr [edx+8]
 0045CBBD    fstp        dword ptr [ecx+8]
 0045CBC0    ret
end;*}

//0045CBC4
{*procedure sub_0045CBC4(?:?; ?:?; ?:?);
begin
 0045CBC4    fld         dword ptr [eax]
 0045CBC6    fsub        dword ptr [edx]
 0045CBC8    fstp        dword ptr [ecx]
 0045CBCA    fld         dword ptr [eax+4]
 0045CBCD    fsub        dword ptr [edx+4]
 0045CBD0    fstp        dword ptr [ecx+4]
 0045CBD3    fld         dword ptr [eax+8]
 0045CBD6    fsub        dword ptr [edx+8]
 0045CBD9    fstp        dword ptr [ecx+8]
 0045CBDC    xor         eax,eax
 0045CBDE    mov         dword ptr [ecx+0C],eax
 0045CBE1    ret
end;*}

//0045CBE4
{*procedure sub_0045CBE4(?:?; ?:?; ?:?);
begin
 0045CBE4    fld         dword ptr [eax]
 0045CBE6    fsub        dword ptr [edx]
 0045CBE8    fstp        dword ptr [ecx]
 0045CBEA    fld         dword ptr [eax+4]
 0045CBED    fsub        dword ptr [edx+4]
 0045CBF0    fstp        dword ptr [ecx+4]
 0045CBF3    fld         dword ptr [eax+8]
 0045CBF6    fsub        dword ptr [edx+8]
 0045CBF9    fstp        dword ptr [ecx+8]
 0045CBFC    mov         edx,dword ptr [eax+0C]
 0045CBFF    mov         dword ptr [ecx+0C],edx
 0045CC02    ret
end;*}

//0045CC04
{*procedure sub_0045CC04(?:Single; ?:Single; ?:?);
begin
 0045CC04    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CC0B    je          0045CC27
 0045CC0D    movq        mm0,mmword ptr [eax]
 0045CC10    pfsub       mm0,mmword ptr [edx]
 0045CC14    movq        mmword ptr [ecx],mm0
 0045CC17    movq        mm1,mmword ptr [eax+8]
 0045CC1B    pfsub       mm1,mmword ptr [edx+8]
 0045CC20    movq        mmword ptr [ecx+8],mm1
 0045CC24    femms
 0045CC26    ret
 0045CC27    fld         dword ptr [eax]
 0045CC29    fsub        dword ptr [edx]
 0045CC2B    fstp        dword ptr [ecx]
 0045CC2D    fld         dword ptr [eax+4]
 0045CC30    fsub        dword ptr [edx+4]
 0045CC33    fstp        dword ptr [ecx+4]
 0045CC36    fld         dword ptr [eax+8]
 0045CC39    fsub        dword ptr [edx+8]
 0045CC3C    fstp        dword ptr [ecx+8]
 0045CC3F    fld         dword ptr [eax+0C]
 0045CC42    fsub        dword ptr [edx+0C]
 0045CC45    fstp        dword ptr [ecx+0C]
 0045CC48    ret
end;*}

//0045CC4C
{*procedure sub_0045CC4C(?:?; ?:?; ?:?);
begin
 0045CC4C    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CC53    je          0045CC6F
 0045CC55    movq        mm0,mmword ptr [eax]
 0045CC58    pfsub       mm0,mmword ptr [edx]
 0045CC5C    movq        mmword ptr [ecx],mm0
 0045CC5F    movq        mm1,mmword ptr [eax+8]
 0045CC63    pfsub       mm1,mmword ptr [edx+8]
 0045CC68    movq        mmword ptr [ecx+8],mm1
 0045CC6C    femms
 0045CC6E    ret
 0045CC6F    fld         dword ptr [eax]
 0045CC71    fsub        dword ptr [edx]
 0045CC73    fstp        dword ptr [ecx]
 0045CC75    fld         dword ptr [eax+4]
 0045CC78    fsub        dword ptr [edx+4]
 0045CC7B    fstp        dword ptr [ecx+4]
 0045CC7E    fld         dword ptr [eax+8]
 0045CC81    fsub        dword ptr [edx+8]
 0045CC84    fstp        dword ptr [ecx+8]
 0045CC87    fld         dword ptr [eax+0C]
 0045CC8A    fsub        dword ptr [edx+0C]
 0045CC8D    fstp        dword ptr [ecx+0C]
 0045CC90    ret
end;*}

//0045CC94
{*procedure sub_0045CC94(?:?; ?:?);
begin
 0045CC94    fld         dword ptr [eax]
 0045CC96    fsub        dword ptr [edx]
 0045CC98    fstp        dword ptr [eax]
 0045CC9A    fld         dword ptr [eax+4]
 0045CC9D    fsub        dword ptr [edx+4]
 0045CCA0    fstp        dword ptr [eax+4]
 0045CCA3    fld         dword ptr [eax+8]
 0045CCA6    fsub        dword ptr [edx+8]
 0045CCA9    fstp        dword ptr [eax+8]
 0045CCAC    ret
end;*}

//0045CCB0
{*procedure sub_0045CCB0(?:?; ?:Integer);
begin
 0045CCB0    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CCB7    je          0045CCD3
 0045CCB9    movq        mm0,mmword ptr [eax]
 0045CCBC    pfsub       mm0,mmword ptr [edx]
 0045CCC0    movq        mmword ptr [eax],mm0
 0045CCC3    movq        mm1,mmword ptr [eax+8]
 0045CCC7    pfsub       mm1,mmword ptr [edx+8]
 0045CCCC    movq        mmword ptr [eax+8],mm1
 0045CCD0    femms
 0045CCD2    ret
 0045CCD3    fld         dword ptr [eax]
 0045CCD5    fsub        dword ptr [edx]
 0045CCD7    fstp        dword ptr [eax]
 0045CCD9    fld         dword ptr [eax+4]
 0045CCDC    fsub        dword ptr [edx+4]
 0045CCDF    fstp        dword ptr [eax+4]
 0045CCE2    fld         dword ptr [eax+8]
 0045CCE5    fsub        dword ptr [edx+8]
 0045CCE8    fstp        dword ptr [eax+8]
 0045CCEB    fld         dword ptr [eax+0C]
 0045CCEE    fsub        dword ptr [edx+0C]
 0045CCF1    fstp        dword ptr [eax+0C]
 0045CCF4    ret
end;*}

//0045CCF8
{*procedure sub_0045CCF8(?:?; ?:?; ?:Integer);
begin
 0045CCF8    fld         dword ptr [edx]
 0045CCFA    fmul        dword ptr [ecx]
 0045CCFC    fadd        dword ptr [eax]
 0045CCFE    fstp        dword ptr [eax]
 0045CD00    fld         dword ptr [edx+4]
 0045CD03    fmul        dword ptr [ecx]
 0045CD05    fadd        dword ptr [eax+4]
 0045CD08    fstp        dword ptr [eax+4]
 0045CD0B    fld         dword ptr [edx+8]
 0045CD0E    fmul        dword ptr [ecx]
 0045CD10    fadd        dword ptr [eax+8]
 0045CD13    fstp        dword ptr [eax+8]
 0045CD16    ret
end;*}

//0045CD18
{*procedure sub_0045CD18(?:?; ?:?; ?:?; ?:?);
begin
 0045CD18    push        ebp
 0045CD19    mov         ebp,esp
 0045CD1B    fld         dword ptr [ebp+0C]
 0045CD1E    fmul        dword ptr [eax]
 0045CD20    fld         dword ptr [ebp+8]
 0045CD23    fmul        dword ptr [edx]
 0045CD25    faddp       st(1),st
 0045CD27    fstp        dword ptr [ecx]
 0045CD29    wait
 0045CD2A    fld         dword ptr [ebp+0C]
 0045CD2D    fmul        dword ptr [eax+4]
 0045CD30    fld         dword ptr [ebp+8]
 0045CD33    fmul        dword ptr [edx+4]
 0045CD36    faddp       st(1),st
 0045CD38    fstp        dword ptr [ecx+4]
 0045CD3B    wait
 0045CD3C    fld         dword ptr [ebp+0C]
 0045CD3F    fmul        dword ptr [eax+8]
 0045CD42    fld         dword ptr [ebp+8]
 0045CD45    fmul        dword ptr [edx+8]
 0045CD48    faddp       st(1),st
 0045CD4A    fstp        dword ptr [ecx+8]
 0045CD4D    wait
 0045CD4E    pop         ebp
 0045CD4F    ret         8
end;*}

//0045CD54
{*procedure sub_0045CD54(?:?; ?:?; ?:?);
begin
 0045CD54    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CD5B    je          0045CD85
 0045CD5D    movd        mm2,dword ptr [ecx]
 0045CD60    punpcklbq   mm2,mm2
 0045CD63    movq        mm0,mmword ptr [edx]
 0045CD66    pfmul       mm0,mm2
 0045CD6A    pfadd       mm0,mmword ptr [eax]
 0045CD6E    movq        mmword ptr [eax],mm0
 0045CD71    movq        mm1,mmword ptr [edx+8]
 0045CD75    pfmul       mm1,mm2
 0045CD79    pfadd       mm1,mmword ptr [eax+8]
 0045CD7E    movq        mmword ptr [eax+8],mm1
 0045CD82    femms
 0045CD84    ret
 0045CD85    fld         dword ptr [edx]
 0045CD87    fmul        dword ptr [ecx]
 0045CD89    fadd        dword ptr [eax]
 0045CD8B    fstp        dword ptr [eax]
 0045CD8D    fld         dword ptr [edx+4]
 0045CD90    fmul        dword ptr [ecx]
 0045CD92    fadd        dword ptr [eax+4]
 0045CD95    fstp        dword ptr [eax+4]
 0045CD98    fld         dword ptr [edx+8]
 0045CD9B    fmul        dword ptr [ecx]
 0045CD9D    fadd        dword ptr [eax+8]
 0045CDA0    fstp        dword ptr [eax+8]
 0045CDA3    fld         dword ptr [edx+0C]
 0045CDA6    fmul        dword ptr [ecx]
 0045CDA8    fadd        dword ptr [eax+0C]
 0045CDAB    fstp        dword ptr [eax+0C]
 0045CDAE    ret
end;*}

//0045CDB0
{*procedure sub_0045CDB0(?:?; ?:?; ?:?; ?:?);
begin
 0045CDB0    push        ebp
 0045CDB1    mov         ebp,esp
 0045CDB3    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045CDBA    je          0045CDE8
 0045CDBC    movd        mm2,dword ptr [ebp+8]
 0045CDC0    punpcklbq   mm2,mm2
 0045CDC3    movq        mm4,mmword ptr [edx]
 0045CDC6    movq        mm6,mmword ptr [edx+8]
 0045CDCA    pfmul       mm4,mm2
 0045CDCE    pfmul       mm6,mm2
 0045CDD2    pfadd       mm4,mmword ptr [eax]
 0045CDD6    pfadd       mm6,mmword ptr [eax+8]
 0045CDDB    movq        mmword ptr [ecx],mm4
 0045CDDE    movq        mmword ptr [ecx+8],mm6
 0045CDE2    femms
 0045CDE4    pop         ebp
 0045CDE5    ret         4
 0045CDE8    fld         dword ptr [ebp+8]
 0045CDEB    fld         dword ptr [edx]
 0045CDED    fmul        st,st(1)
 0045CDEF    fadd        dword ptr [eax]
 0045CDF1    fstp        dword ptr [ecx]
 0045CDF3    fld         dword ptr [edx+4]
 0045CDF6    fmul        st,st(1)
 0045CDF8    fadd        dword ptr [eax+4]
 0045CDFB    fstp        dword ptr [ecx+4]
 0045CDFE    fld         dword ptr [edx+8]
 0045CE01    fmul        st,st(1)
 0045CE03    fadd        dword ptr [eax+8]
 0045CE06    fstp        dword ptr [ecx+8]
 0045CE09    fld         dword ptr [edx+0C]
 0045CE0C    fmulp       st(1),st
 0045CE0E    fadd        dword ptr [eax+0C]
 0045CE11    fstp        dword ptr [ecx+0C]
 0045CE14    pop         ebp
 0045CE15    ret         4
end;*}

//0045CE18
{*function sub_0045CE18(?:?; ?:?):?;
begin
 0045CE18    fld         dword ptr [eax]
 0045CE1A    fmul        dword ptr [edx]
 0045CE1C    fld         dword ptr [eax+4]
 0045CE1F    fmul        dword ptr [edx+4]
 0045CE22    faddp       st(1),st
 0045CE24    fld         dword ptr [eax+8]
 0045CE27    fmul        dword ptr [edx+8]
 0045CE2A    faddp       st(1),st
 0045CE2C    ret
end;*}

//0045CE30
{*procedure sub_0045CE30(?:?; ?:Integer);
begin
 0045CE30    fld         dword ptr [eax]
 0045CE32    fmul        dword ptr [edx]
 0045CE34    fld         dword ptr [eax+4]
 0045CE37    fmul        dword ptr [edx+4]
 0045CE3A    faddp       st(1),st
 0045CE3C    fld         dword ptr [eax+8]
 0045CE3F    fmul        dword ptr [edx+8]
 0045CE42    faddp       st(1),st
 0045CE44    fld         dword ptr [eax+0C]
 0045CE47    fmul        dword ptr [edx+0C]
 0045CE4A    faddp       st(1),st
 0045CE4C    ret
end;*}

//0045CE50
{*function sub_0045CE50(?:?; ?:?):?;
begin
 0045CE50    fld         dword ptr [eax]
 0045CE52    fmul        dword ptr [edx]
 0045CE54    fld         dword ptr [eax+4]
 0045CE57    fmul        dword ptr [edx+4]
 0045CE5A    faddp       st(1),st
 0045CE5C    fld         dword ptr [eax+8]
 0045CE5F    fmul        dword ptr [edx+8]
 0045CE62    faddp       st(1),st
 0045CE64    ret
end;*}

//0045CE68
{*procedure sub_0045CE68(?:?; ?:?; ?:?);
begin
 0045CE68    fld         dword ptr [eax]
 0045CE6A    fsub        dword ptr [edx]
 0045CE6C    fmul        dword ptr [ecx]
 0045CE6E    fld         dword ptr [eax+4]
 0045CE71    fsub        dword ptr [edx+4]
 0045CE74    fmul        dword ptr [ecx+4]
 0045CE77    faddp       st(1),st
 0045CE79    fld         dword ptr [eax+8]
 0045CE7C    fsub        dword ptr [edx+8]
 0045CE7F    fmul        dword ptr [ecx+8]
 0045CE82    faddp       st(1),st
 0045CE84    ret
end;*}

//0045CE88
{*function sub_0045CE88(?:?; ?:?; ?:?):?;
begin
 0045CE88    fld         dword ptr [eax]
 0045CE8A    fsub        dword ptr [edx]
 0045CE8C    fmul        dword ptr [ecx]
 0045CE8E    fld         dword ptr [eax+4]
 0045CE91    fsub        dword ptr [edx+4]
 0045CE94    fmul        dword ptr [ecx+4]
 0045CE97    faddp       st(1),st
 0045CE99    fld         dword ptr [eax+8]
 0045CE9C    fsub        dword ptr [edx+8]
 0045CE9F    fmul        dword ptr [ecx+8]
 0045CEA2    faddp       st(1),st
 0045CEA4    ret
end;*}

//0045CEA8
{*procedure sub_0045CEA8(?:?; ?:?);
begin
 0045CEA8    fld         dword ptr [eax+4]
 0045CEAB    fmul        dword ptr [edx+8]
 0045CEAE    fld         dword ptr [eax+8]
 0045CEB1    fmul        dword ptr [edx+4]
 0045CEB4    fsubp       st(1),st
 0045CEB6    fstp        dword ptr [ecx]
 0045CEB8    wait
 0045CEB9    fld         dword ptr [eax+8]
 0045CEBC    fmul        dword ptr [edx]
 0045CEBE    fld         dword ptr [eax]
 0045CEC0    fmul        dword ptr [edx+8]
 0045CEC3    fsubp       st(1),st
 0045CEC5    fstp        dword ptr [ecx+4]
 0045CEC8    wait
 0045CEC9    fld         dword ptr [eax]
 0045CECB    fmul        dword ptr [edx+4]
 0045CECE    fld         dword ptr [eax+4]
 0045CED1    fmul        dword ptr [edx]
 0045CED3    fsubp       st(1),st
 0045CED5    fstp        dword ptr [ecx+8]
 0045CED8    wait
 0045CED9    ret
end;*}

//0045CEDC
procedure sub_0045CEDC(?:Single; ?:Single; ?:Single);
begin
{*
 0045CEDC    fld         dword ptr [eax+4]
 0045CEDF    fmul        dword ptr [edx+8]
 0045CEE2    fld         dword ptr [eax+8]
 0045CEE5    fmul        dword ptr [edx+4]
 0045CEE8    fsubp       st(1),st
 0045CEEA    fstp        dword ptr [ecx]
 0045CEEC    wait
 0045CEED    fld         dword ptr [eax+8]
 0045CEF0    fmul        dword ptr [edx]
 0045CEF2    fld         dword ptr [eax]
 0045CEF4    fmul        dword ptr [edx+8]
 0045CEF7    fsubp       st(1),st
 0045CEF9    fstp        dword ptr [ecx+4]
 0045CEFC    wait
 0045CEFD    fld         dword ptr [eax]
 0045CEFF    fmul        dword ptr [edx+4]
 0045CF02    fld         dword ptr [eax+4]
 0045CF05    fmul        dword ptr [edx]
 0045CF07    fsubp       st(1),st
 0045CF09    fstp        dword ptr [ecx+8]
 0045CF0C    wait
 0045CF0D    xor         eax,eax
 0045CF0F    mov         dword ptr [ecx+0C],eax
 0045CF12    ret
*}
end;

//0045CF14
{*procedure sub_0045CF14(?:?; ?:?; ?:?);
begin
 0045CF14    fld         dword ptr [eax+4]
 0045CF17    fmul        dword ptr [edx+8]
 0045CF1A    fld         dword ptr [eax+8]
 0045CF1D    fmul        dword ptr [edx+4]
 0045CF20    fsubp       st(1),st
 0045CF22    fstp        dword ptr [ecx]
 0045CF24    wait
 0045CF25    fld         dword ptr [eax+8]
 0045CF28    fmul        dword ptr [edx]
 0045CF2A    fld         dword ptr [eax]
 0045CF2C    fmul        dword ptr [edx+8]
 0045CF2F    fsubp       st(1),st
 0045CF31    fstp        dword ptr [ecx+4]
 0045CF34    wait
 0045CF35    fld         dword ptr [eax]
 0045CF37    fmul        dword ptr [edx+4]
 0045CF3A    fld         dword ptr [eax+4]
 0045CF3D    fmul        dword ptr [edx]
 0045CF3F    fsubp       st(1),st
 0045CF41    fstp        dword ptr [ecx+8]
 0045CF44    wait
 0045CF45    xor         eax,eax
 0045CF47    mov         dword ptr [ecx+0C],eax
 0045CF4A    ret
end;*}

//0045CF4C
{*procedure sub_0045CF4C(?:?; ?:?);
begin
 0045CF4C    fld         dword ptr [eax+4]
 0045CF4F    fmul        dword ptr [edx+8]
 0045CF52    fld         dword ptr [eax+8]
 0045CF55    fmul        dword ptr [edx+4]
 0045CF58    fsubp       st(1),st
 0045CF5A    fstp        dword ptr [ecx]
 0045CF5C    wait
 0045CF5D    fld         dword ptr [eax+8]
 0045CF60    fmul        dword ptr [edx]
 0045CF62    fld         dword ptr [eax]
 0045CF64    fmul        dword ptr [edx+8]
 0045CF67    fsubp       st(1),st
 0045CF69    fstp        dword ptr [ecx+4]
 0045CF6C    wait
 0045CF6D    fld         dword ptr [eax]
 0045CF6F    fmul        dword ptr [edx+4]
 0045CF72    fld         dword ptr [eax+4]
 0045CF75    fmul        dword ptr [edx]
 0045CF77    fsubp       st(1),st
 0045CF79    fstp        dword ptr [ecx+8]
 0045CF7C    wait
 0045CF7D    ret
end;*}

//0045CF80
{*procedure sub_0045CF80(?:?; ?:?);
begin
 0045CF80    fld         dword ptr [eax+4]
 0045CF83    fmul        dword ptr [edx+8]
 0045CF86    fld         dword ptr [eax+8]
 0045CF89    fmul        dword ptr [edx+4]
 0045CF8C    fsubp       st(1),st
 0045CF8E    fstp        dword ptr [ecx]
 0045CF90    wait
 0045CF91    fld         dword ptr [eax+8]
 0045CF94    fmul        dword ptr [edx]
 0045CF96    fld         dword ptr [eax]
 0045CF98    fmul        dword ptr [edx+8]
 0045CF9B    fsubp       st(1),st
 0045CF9D    fstp        dword ptr [ecx+4]
 0045CFA0    wait
 0045CFA1    fld         dword ptr [eax]
 0045CFA3    fmul        dword ptr [edx+4]
 0045CFA6    fld         dword ptr [eax+4]
 0045CFA9    fmul        dword ptr [edx]
 0045CFAB    fsubp       st(1),st
 0045CFAD    fstp        dword ptr [ecx+8]
 0045CFB0    wait
 0045CFB1    ret
end;*}

//0045CFB4
{*procedure sub_0045CFB4(?:Integer; ?:Integer; ?:?);
begin
 0045CFB4    push        ebp
 0045CFB5    mov         ebp,esp
 0045CFB7    fld         dword ptr [ebp+8]
 0045CFBA    fld         dword ptr [eax]
 0045CFBC    fld         dword ptr [edx]
 0045CFBE    fsub        st,st(1)
 0045CFC0    fmul        st,st(2)
 0045CFC2    faddp       st(1),st
 0045CFC4    fstp        dword ptr [ecx]
 0045CFC6    fld         dword ptr [eax+4]
 0045CFC9    fld         dword ptr [edx+4]
 0045CFCC    fsub        st,st(1)
 0045CFCE    fmul        st,st(2)
 0045CFD0    faddp       st(1),st
 0045CFD2    fstp        dword ptr [ecx+4]
 0045CFD5    fld         dword ptr [eax+8]
 0045CFD8    fld         dword ptr [edx+8]
 0045CFDB    fsub        st,st(1)
 0045CFDD    fmul        st,st(2)
 0045CFDF    faddp       st(1),st
 0045CFE1    fstp        dword ptr [ecx+8]
 0045CFE4    ffree       st(0)
 0045CFE6    pop         ebp
 0045CFE7    ret         4
end;*}

//0045CFEC
{*procedure sub_0045CFEC(?:?; ?:Byte; ?:?);
begin
 0045CFEC    push        ebp
 0045CFED    mov         ebp,esp
 0045CFEF    fld         dword ptr [edx]
 0045CFF1    fsub        dword ptr [eax]
 0045CFF3    fmul        dword ptr [ebp+8]
 0045CFF6    fadd        dword ptr [eax]
 0045CFF8    fstp        dword ptr [ecx]
 0045CFFA    wait
 0045CFFB    fld         dword ptr [edx+4]
 0045CFFE    fsub        dword ptr [eax+4]
 0045D001    fmul        dword ptr [ebp+8]
 0045D004    fadd        dword ptr [eax+4]
 0045D007    fstp        dword ptr [ecx+4]
 0045D00A    wait
 0045D00B    fld         dword ptr [edx+8]
 0045D00E    fsub        dword ptr [eax+8]
 0045D011    fmul        dword ptr [ebp+8]
 0045D014    fadd        dword ptr [eax+8]
 0045D017    fstp        dword ptr [ecx+8]
 0045D01A    wait
 0045D01B    fld         dword ptr [edx+0C]
 0045D01E    fsub        dword ptr [eax+0C]
 0045D021    fmul        dword ptr [ebp+8]
 0045D024    fadd        dword ptr [eax+0C]
 0045D027    fstp        dword ptr [ecx+0C]
 0045D02A    wait
 0045D02B    pop         ebp
 0045D02C    ret         4
end;*}

//0045D030
{*procedure sub_0045D030(?:?; ?:?; ?:?);
begin
 0045D030    push        ebp
 0045D031    mov         ebp,esp
 0045D033    fld         dword ptr [edx]
 0045D035    fsub        dword ptr [eax]
 0045D037    fmul        dword ptr [ebp+8]
 0045D03A    fadd        dword ptr [eax]
 0045D03C    fstp        dword ptr [ecx]
 0045D03E    wait
 0045D03F    fld         dword ptr [edx+4]
 0045D042    fsub        dword ptr [eax+4]
 0045D045    fmul        dword ptr [ebp+8]
 0045D048    fadd        dword ptr [eax+4]
 0045D04B    fstp        dword ptr [ecx+4]
 0045D04E    wait
 0045D04F    fld         dword ptr [edx+8]
 0045D052    fsub        dword ptr [eax+8]
 0045D055    fmul        dword ptr [ebp+8]
 0045D058    fadd        dword ptr [eax+8]
 0045D05B    fstp        dword ptr [ecx+8]
 0045D05E    wait
 0045D05F    fld         dword ptr [edx+0C]
 0045D062    fsub        dword ptr [eax+0C]
 0045D065    fmul        dword ptr [ebp+8]
 0045D068    fadd        dword ptr [eax+0C]
 0045D06B    fstp        dword ptr [ecx+0C]
 0045D06E    wait
 0045D06F    pop         ebp
 0045D070    ret         4
end;*}

//0045D074
{*procedure sub_0045D074(?:?; ?:?; ?:?; ?:?);
begin
 0045D074    push        ebp
 0045D075    mov         ebp,esp
 0045D077    add         esp,0FFFFFF50
 0045D07D    push        ebx
 0045D07E    push        esi
 0045D07F    push        edi
 0045D080    mov         edi,ecx
 0045D082    mov         esi,edx
 0045D084    mov         ebx,eax
 0045D086    mov         edx,esi
 0045D088    mov         eax,ebx
 0045D08A    call        0045D898
 0045D08F    test        al,al
>0045D091    je          0045D0A8
 0045D093    mov         eax,dword ptr [ebx]
 0045D095    mov         dword ptr [edi],eax
 0045D097    mov         eax,dword ptr [ebx+4]
 0045D09A    mov         dword ptr [edi+4],eax
 0045D09D    mov         eax,dword ptr [ebx+8]
 0045D0A0    mov         dword ptr [edi+8],eax
>0045D0A3    jmp         0045D158
 0045D0A8    push        dword ptr [ebx]
 0045D0AA    call        0045F4E8
 0045D0AF    add         esp,0FFFFFFFC
 0045D0B2    fstp        dword ptr [esp]
 0045D0B5    wait
 0045D0B6    push        dword ptr [ebx+4]
 0045D0B9    call        0045F4E8
 0045D0BE    add         esp,0FFFFFFFC
 0045D0C1    fstp        dword ptr [esp]
 0045D0C4    wait
 0045D0C5    push        dword ptr [ebx+8]
 0045D0C8    call        0045F4E8
 0045D0CD    add         esp,0FFFFFFFC
 0045D0D0    fstp        dword ptr [esp]
 0045D0D3    wait
 0045D0D4    lea         edx,[ebp-10]
 0045D0D7    mov         al,5
 0045D0D9    call        0045F14C
 0045D0DE    push        dword ptr [esi]
 0045D0E0    call        0045F4E8
 0045D0E5    add         esp,0FFFFFFFC
 0045D0E8    fstp        dword ptr [esp]
 0045D0EB    wait
 0045D0EC    push        dword ptr [esi+4]
 0045D0EF    call        0045F4E8
 0045D0F4    add         esp,0FFFFFFFC
 0045D0F7    fstp        dword ptr [esp]
 0045D0FA    wait
 0045D0FB    push        dword ptr [esi+8]
 0045D0FE    call        0045F4E8
 0045D103    add         esp,0FFFFFFFC
 0045D106    fstp        dword ptr [esp]
 0045D109    wait
 0045D10A    lea         edx,[ebp-20]
 0045D10D    mov         al,5
 0045D10F    call        0045F14C
 0045D114    push        dword ptr [ebp+8]
 0045D117    lea         ecx,[ebp-30]
 0045D11A    lea         edx,[ebp-20]
 0045D11D    lea         eax,[ebp-10]
 0045D120    call        0045F7F0
 0045D125    lea         edx,[ebp-70]
 0045D128    lea         eax,[ebp-30]
 0045D12B    call        0045EE90
 0045D130    lea         edx,[ebp-0B0]
 0045D136    lea         eax,[ebp-70]
 0045D139    call        0045E850
 0045D13E    mov         eax,dword ptr [ebp-98]
 0045D144    mov         dword ptr [edi],eax
 0045D146    mov         eax,dword ptr [ebp-94]
 0045D14C    mov         dword ptr [edi+4],eax
 0045D14F    mov         eax,dword ptr [ebp-90]
 0045D155    mov         dword ptr [edi+8],eax
 0045D158    pop         edi
 0045D159    pop         esi
 0045D15A    pop         ebx
 0045D15B    mov         esp,ebp
 0045D15D    pop         ebp
 0045D15E    ret         4
end;*}

//0045D164
{*procedure sub_0045D164(?:?; ?:?; ?:?; ?:?);
begin
 0045D164    push        ebp
 0045D165    mov         ebp,esp
 0045D167    push        ebx
 0045D168    push        esi
 0045D169    push        edi
 0045D16A    mov         edi,ecx
 0045D16C    mov         esi,edx
 0045D16E    mov         ebx,eax
 0045D170    push        3F800000
 0045D175    push        dword ptr [ebp+8]
 0045D178    mov         ecx,edi
 0045D17A    mov         edx,esi
 0045D17C    mov         eax,ebx
 0045D17E    call        0045CD18
 0045D183    pop         edi
 0045D184    pop         esi
 0045D185    pop         ebx
 0045D186    pop         ebp
 0045D187    ret         4
end;*}

//0045D18C
{*procedure sub_0045D18C(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0045D18C    push        ebp
 0045D18D    mov         ebp,esp
 0045D18F    push        ecx
 0045D190    lea         eax,[ebp+10]
 0045D193    mov         dword ptr [ebp-4],eax
 0045D196    push        ebx
 0045D197    push        edi
 0045D198    mov         eax,dword ptr [ebp+8]
 0045D19B    mov         edx,dword ptr [ebp+0C]
 0045D19E    mov         ecx,dword ptr [ebp+14]
 0045D1A1    mov         ebx,dword ptr [ebp+18]
 0045D1A4    mov         edi,dword ptr [ebp-4]
 0045D1A7    femms
 0045D1A9    movd        mm7,dword ptr [edi]
 0045D1AC    punpcklbq   mm7,mm7
 0045D1AF    movq        mm0,mmword ptr [eax]
 0045D1B2    movq        mm2,mmword ptr [eax+8]
 0045D1B6    movq        mm1,mm0
 0045D1B9    movq        mm3,mm2
 0045D1BC    pfsubr      mm0,mmword ptr [edx]
 0045D1C0    pfsubr      mm2,mmword ptr [edx+8]
 0045D1C5    prefetchw   [ebx+20]
 0045D1C9    pfmul       mm0,mm7
 0045D1CD    pfmul       mm2,mm7
 0045D1D1    add         eax,10
 0045D1D4    add         edx,10
 0045D1D7    prefetch    [eax+20]
 0045D1DB    pfadd       mm0,mm1
 0045D1DF    pfadd       mm2,mm3
 0045D1E3    prefetch    [edx+20]
 0045D1E7    movq        mmword ptr [ebx],mm0
 0045D1EA    movq        mmword ptr [ebx+8],mm2
 0045D1EE    add         ebx,10
 0045D1F1    dec         ecx
>0045D1F2    jne         0045D1AF
 0045D1F4    femms
 0045D1F6    pop         edi
 0045D1F7    pop         ebx
 0045D1F8    pop         ecx
 0045D1F9    pop         ebp
 0045D1FA    ret         14
end;*}

//0045D200
{*procedure sub_0045D200(?:?; ?:?; ?:?);
begin
 0045D200    push        ebp
 0045D201    mov         ebp,esp
 0045D203    push        ecx
 0045D204    push        ebx
 0045D205    push        esi
 0045D206    mov         esi,eax
 0045D208    cmp         byte ptr ds:[5AD060],1;gvar_005AD060
>0045D20F    jne         0045D222
 0045D211    mov         eax,dword ptr [ebp+8]
 0045D214    push        eax
 0045D215    push        ecx
 0045D216    push        dword ptr [ebp+0C]
 0045D219    push        edx
 0045D21A    push        esi
 0045D21B    call        0045D18C
>0045D220    jmp         0045D29F
 0045D222    dec         ecx
 0045D223    test        ecx,ecx
>0045D225    jl          0045D29F
 0045D227    inc         ecx
 0045D228    mov         dword ptr [ebp-4],ecx
 0045D22B    xor         eax,eax
 0045D22D    mov         ecx,eax
 0045D22F    add         ecx,ecx
 0045D231    fld         dword ptr [edx+ecx*8]
 0045D234    mov         ebx,eax
 0045D236    add         ebx,ebx
 0045D238    fsub        dword ptr [esi+ebx*8]
 0045D23B    fmul        dword ptr [ebp+0C]
 0045D23E    fadd        dword ptr [esi+ecx*8]
 0045D241    mov         ebx,dword ptr [ebp+8]
 0045D244    fstp        dword ptr [ebx+ecx*8]
 0045D247    wait
 0045D248    fld         dword ptr [edx+ecx*8+4]
 0045D24C    mov         ebx,eax
 0045D24E    add         ebx,ebx
 0045D250    fsub        dword ptr [esi+ebx*8+4]
 0045D254    fmul        dword ptr [ebp+0C]
 0045D257    fadd        dword ptr [esi+ecx*8+4]
 0045D25B    mov         ebx,dword ptr [ebp+8]
 0045D25E    fstp        dword ptr [ebx+ecx*8+4]
 0045D262    wait
 0045D263    fld         dword ptr [edx+ecx*8+8]
 0045D267    mov         ebx,eax
 0045D269    add         ebx,ebx
 0045D26B    fsub        dword ptr [esi+ebx*8+8]
 0045D26F    fmul        dword ptr [ebp+0C]
 0045D272    fadd        dword ptr [esi+ecx*8+8]
 0045D276    mov         ebx,dword ptr [ebp+8]
 0045D279    fstp        dword ptr [ebx+ecx*8+8]
 0045D27D    wait
 0045D27E    fld         dword ptr [edx+ecx*8+0C]
 0045D282    mov         ebx,eax
 0045D284    add         ebx,ebx
 0045D286    fsub        dword ptr [esi+ebx*8+0C]
 0045D28A    fmul        dword ptr [ebp+0C]
 0045D28D    fadd        dword ptr [esi+ecx*8+0C]
 0045D291    mov         ebx,dword ptr [ebp+8]
 0045D294    fstp        dword ptr [ebx+ecx*8+0C]
 0045D298    wait
 0045D299    inc         eax
 0045D29A    dec         dword ptr [ebp-4]
>0045D29D    jne         0045D22D
 0045D29F    pop         esi
 0045D2A0    pop         ebx
 0045D2A1    pop         ecx
 0045D2A2    pop         ebp
 0045D2A3    ret         8
end;*}

//0045D2A8
{*procedure sub_0045D2A8(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0045D2A8    push        ebp
 0045D2A9    mov         ebp,esp
 0045D2AB    push        ecx
 0045D2AC    push        ebx
 0045D2AD    lea         eax,[ebp+10]
 0045D2B0    mov         dword ptr [ebp-4],eax
 0045D2B3    push        ebx
 0045D2B4    push        edi
 0045D2B5    mov         eax,dword ptr [ebp+8]
 0045D2B8    mov         edx,dword ptr [ebp+0C]
 0045D2BB    mov         ecx,dword ptr [ebp+14]
 0045D2BE    cmp         ecx,1
>0045D2C1    jbe         0045D332
 0045D2C3    shr         ecx,1
 0045D2C5    mov         ebx,dword ptr [ebp+18]
 0045D2C8    mov         edi,dword ptr [ebp-4]
 0045D2CB    femms
 0045D2CD    movd        mm7,dword ptr [edi]
 0045D2D0    punpcklbq   mm7,mm7
 0045D2D3    movq        mm0,mmword ptr [eax]
 0045D2D6    movq        mm2,mmword ptr [eax+8]
 0045D2DA    movq        mm4,mmword ptr [eax+10]
 0045D2DE    movq        mm1,mm0
 0045D2E1    movq        mm3,mm2
 0045D2E4    movq        mm5,mm4
 0045D2E7    pfsubr      mm0,mmword ptr [edx]
 0045D2EB    pfsubr      mm2,mmword ptr [edx+8]
 0045D2F0    pfsubr      mm4,mmword ptr [edx+10]
 0045D2F5    prefetchw   [ebx+40]
 0045D2F9    pfmul       mm0,mm7
 0045D2FD    pfmul       mm2,mm7
 0045D301    pfmul       mm4,mm7
 0045D305    prefetch    [eax+40]
 0045D309    add         eax,18
 0045D30C    add         edx,18
 0045D30F    pfadd       mm0,mm1
 0045D313    pfadd       mm2,mm3
 0045D317    pfadd       mm4,mm5
 0045D31B    prefetch    [edx+40]
 0045D31F    movq        mmword ptr [ebx],mm0
 0045D322    movq        mmword ptr [ebx+8],mm2
 0045D326    movq        mmword ptr [ebx+10],mm4
 0045D32A    add         ebx,18
 0045D32D    dec         ecx
>0045D32E    jne         0045D2D3
 0045D330    femms
 0045D332    pop         edi
 0045D333    pop         ebx
 0045D334    mov         eax,dword ptr [ebp+14]
 0045D337    and         eax,1
 0045D33A    dec         eax
>0045D33B    jne         0045D360
 0045D33D    push        dword ptr [ebp+10]
 0045D340    mov         eax,dword ptr [ebp+14]
 0045D343    lea         eax,[eax+eax*2]
 0045D346    mov         edx,dword ptr [ebp+18]
 0045D349    lea         ecx,[edx+eax*4-0C]
 0045D34D    mov         edx,dword ptr [ebp+0C]
 0045D350    lea         edx,[edx+eax*4-0C]
 0045D354    mov         ebx,dword ptr [ebp+8]
 0045D357    lea         eax,[ebx+eax*4-0C]
 0045D35B    call        0045CFB4
 0045D360    pop         ebx
 0045D361    pop         ecx
 0045D362    pop         ebp
 0045D363    ret         14
end;*}

//0045D368
{*procedure sub_0045D368(?:?; ?:?; ?:?);
begin
 0045D368    push        ebp
 0045D369    mov         ebp,esp
 0045D36B    push        ecx
 0045D36C    push        ebx
 0045D36D    push        esi
 0045D36E    mov         esi,eax
 0045D370    cmp         byte ptr ds:[5AD060],1;gvar_005AD060
>0045D377    jne         0045D38A
 0045D379    mov         eax,dword ptr [ebp+8]
 0045D37C    push        eax
 0045D37D    push        ecx
 0045D37E    push        dword ptr [ebp+0C]
 0045D381    push        edx
 0045D382    push        esi
 0045D383    call        0045D2A8
>0045D388    jmp         0045D3E8
 0045D38A    dec         ecx
 0045D38B    test        ecx,ecx
>0045D38D    jl          0045D3E8
 0045D38F    inc         ecx
 0045D390    mov         dword ptr [ebp-4],ecx
 0045D393    xor         eax,eax
 0045D395    lea         ecx,[eax+eax*2]
 0045D398    fld         dword ptr [edx+ecx*4]
 0045D39B    lea         ebx,[eax+eax*2]
 0045D39E    fsub        dword ptr [esi+ebx*4]
 0045D3A1    fmul        dword ptr [ebp+0C]
 0045D3A4    fadd        dword ptr [esi+ecx*4]
 0045D3A7    mov         ebx,dword ptr [ebp+8]
 0045D3AA    fstp        dword ptr [ebx+ecx*4]
 0045D3AD    wait
 0045D3AE    fld         dword ptr [edx+ecx*4+4]
 0045D3B2    lea         ebx,[eax+eax*2]
 0045D3B5    fsub        dword ptr [esi+ebx*4+4]
 0045D3B9    fmul        dword ptr [ebp+0C]
 0045D3BC    fadd        dword ptr [esi+ecx*4+4]
 0045D3C0    mov         ebx,dword ptr [ebp+8]
 0045D3C3    fstp        dword ptr [ebx+ecx*4+4]
 0045D3C7    wait
 0045D3C8    fld         dword ptr [edx+ecx*4+8]
 0045D3CC    lea         ebx,[eax+eax*2]
 0045D3CF    fsub        dword ptr [esi+ebx*4+8]
 0045D3D3    fmul        dword ptr [ebp+0C]
 0045D3D6    fadd        dword ptr [esi+ecx*4+8]
 0045D3DA    mov         ebx,dword ptr [ebp+8]
 0045D3DD    fstp        dword ptr [ebx+ecx*4+8]
 0045D3E1    wait
 0045D3E2    inc         eax
 0045D3E3    dec         dword ptr [ebp-4]
>0045D3E6    jne         0045D395
 0045D3E8    pop         esi
 0045D3E9    pop         ebx
 0045D3EA    pop         ecx
 0045D3EB    pop         ebp
 0045D3EC    ret         8
end;*}

//0045D3F0
{*procedure sub_0045D3F0(?:?; ?:?);
begin
 0045D3F0    push        ebp
 0045D3F1    mov         ebp,esp
 0045D3F3    fld         dword ptr [ebp+0C]
 0045D3F6    fmul        st,st(0)
 0045D3F8    fld         dword ptr [ebp+8]
 0045D3FB    fmul        st,st(0)
 0045D3FD    faddp       st(1),st
 0045D3FF    fsqrt
 0045D401    pop         ebp
 0045D402    ret         8
end;*}

//0045D408
{*function sub_0045D408(?:?):?;
begin
 0045D408    fld         dword ptr [eax]
 0045D40A    fmul        st,st(0)
 0045D40C    fld         dword ptr [eax+4]
 0045D40F    fmul        st,st(0)
 0045D411    faddp       st(1),st
 0045D413    fld         dword ptr [eax+8]
 0045D416    fmul        st,st(0)
 0045D418    faddp       st(1),st
 0045D41A    fsqrt
 0045D41C    ret
end;*}

//0045D420
{*function sub_0045D420(?:Single):?;
begin
 0045D420    fld         dword ptr [eax]
 0045D422    fmul        st,st(0)
 0045D424    fld         dword ptr [eax+4]
 0045D427    fmul        st,st(0)
 0045D429    faddp       st(1),st
 0045D42B    fld         dword ptr [eax+8]
 0045D42E    fmul        st,st(0)
 0045D430    faddp       st(1),st
 0045D432    fsqrt
 0045D434    ret
end;*}

//0045D438
{*function sub_0045D438(?:?):?;
begin
 0045D438    fld         dword ptr [eax]
 0045D43A    fmul        st,st(0)
 0045D43C    fld         dword ptr [eax+4]
 0045D43F    fmul        st,st(0)
 0045D441    faddp       st(1),st
 0045D443    fld         dword ptr [eax+8]
 0045D446    fmul        st,st(0)
 0045D448    faddp       st(1),st
 0045D44A    ret
end;*}

//0045D44C
{*function sub_0045D44C(?:?):?;
begin
 0045D44C    fld         dword ptr [eax]
 0045D44E    fmul        st,st(0)
 0045D450    fld         dword ptr [eax+4]
 0045D453    fmul        st,st(0)
 0045D455    faddp       st(1),st
 0045D457    fld         dword ptr [eax+8]
 0045D45A    fmul        st,st(0)
 0045D45C    faddp       st(1),st
 0045D45E    ret
end;*}

//0045D460
procedure sub_0045D460(?:Integer);
begin
{*
 0045D460    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045D467    je          0045D4AE
 0045D469    movq        mm0,mmword ptr [eax]
 0045D46C    movd        mm1,dword ptr [eax+8]
 0045D470    movq        mm4,mm0
 0045D473    movq        mm3,mm1
 0045D476    pfmul       mm0,mm0
 0045D47A    pfmul       mm1,mm1
 0045D47E    pfacc       mm0,mm0
 0045D482    pfadd       mm0,mm1
 0045D486    pfrsqrt     mm1,mm0
 0045D48A    movq        mm2,mm1
 0045D48D    pfmul       mm1,mm1
 0045D491    pfrsqit1    mm1,mm0
 0045D495    pfrcpit2    mm1,mm2
 0045D499    punpcklbq   mm1,mm1
 0045D49C    pfmul       mm3,mm1
 0045D4A0    pfmul       mm4,mm1
 0045D4A4    movd        dword ptr [eax+8],mm3
 0045D4A8    movq        mmword ptr [eax],mm4
 0045D4AB    femms
 0045D4AD    ret
 0045D4AE    fld         dword ptr [eax]
 0045D4B0    fmul        st,st(0)
 0045D4B2    fld         dword ptr [eax+4]
 0045D4B5    fmul        st,st(0)
 0045D4B7    faddp       st(1),st
 0045D4B9    fld         dword ptr [eax+8]
 0045D4BC    fmul        st,st(0)
 0045D4BE    faddp       st(1),st
 0045D4C0    fsqrt
 0045D4C2    fld1
 0045D4C4    fdivrp      st(1),st
 0045D4C6    fld         st(0)
 0045D4C8    fmul        dword ptr [eax]
 0045D4CA    fstp        dword ptr [eax]
 0045D4CC    fld         st(0)
 0045D4CE    fmul        dword ptr [eax+4]
 0045D4D1    fstp        dword ptr [eax+4]
 0045D4D4    fmul        dword ptr [eax+8]
 0045D4D7    fstp        dword ptr [eax+8]
 0045D4DA    ret
*}
end;

//0045D4DC
{*procedure sub_0045D4DC(?:?; ?:?);
begin
 0045D4DC    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045D4E3    je          0045D52A
 0045D4E5    movq        mm0,mmword ptr [eax]
 0045D4E8    movd        mm1,dword ptr [eax+8]
 0045D4EC    movq        mm4,mm0
 0045D4EF    movq        mm3,mm1
 0045D4F2    pfmul       mm0,mm0
 0045D4F6    pfmul       mm1,mm1
 0045D4FA    pfacc       mm0,mm0
 0045D4FE    pfadd       mm0,mm1
 0045D502    pfrsqrt     mm1,mm0
 0045D506    movq        mm2,mm1
 0045D509    pfmul       mm1,mm1
 0045D50D    pfrsqit1    mm1,mm0
 0045D511    pfrcpit2    mm1,mm2
 0045D515    punpcklbq   mm1,mm1
 0045D518    pfmul       mm3,mm1
 0045D51C    pfmul       mm4,mm1
 0045D520    movd        dword ptr [edx+8],mm3
 0045D524    movq        mmword ptr [edx],mm4
 0045D527    femms
 0045D529    ret
 0045D52A    fld         dword ptr [eax]
 0045D52C    fmul        st,st(0)
 0045D52E    fld         dword ptr [eax+4]
 0045D531    fmul        st,st(0)
 0045D533    faddp       st(1),st
 0045D535    fld         dword ptr [eax+8]
 0045D538    fmul        st,st(0)
 0045D53A    faddp       st(1),st
 0045D53C    fsqrt
 0045D53E    fld1
 0045D540    fdivrp      st(1),st
 0045D542    fld         st(0)
 0045D544    fmul        dword ptr [eax]
 0045D546    fstp        dword ptr [edx]
 0045D548    fld         st(0)
 0045D54A    fmul        dword ptr [eax+4]
 0045D54D    fstp        dword ptr [edx+4]
 0045D550    fmul        dword ptr [eax+8]
 0045D553    fstp        dword ptr [edx+8]
 0045D556    ret
end;*}

//0045D558
procedure sub_0045D558(?:dword; ?:dword);
begin
{*
 0045D558    or          edx,edx
>0045D55A    je          0045D5EA
 0045D560    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045D567    je          0045D5B8
 0045D569    movq        mm0,mmword ptr [eax]
 0045D56C    movd        mm1,dword ptr [eax+8]
 0045D570    movq        mm4,mm0
 0045D573    movq        mm3,mm1
 0045D576    pfmul       mm0,mm0
 0045D57A    pfmul       mm1,mm1
 0045D57E    pfacc       mm0,mm0
 0045D582    pfadd       mm0,mm1
 0045D586    pfrsqrt     mm1,mm0
 0045D58A    movq        mm2,mm1
 0045D58D    pfmul       mm1,mm1
 0045D591    pfrsqit1    mm1,mm0
 0045D595    pfrcpit2    mm1,mm2
 0045D599    punpcklbq   mm1,mm1
 0045D59C    pfmul       mm3,mm1
 0045D5A0    pfmul       mm4,mm1
 0045D5A4    movd        dword ptr [eax+8],mm3
 0045D5A8    movq        mmword ptr [eax],mm4
 0045D5AB    femms
 0045D5AD    add         eax,0C
 0045D5B0    prefetch    [eax+60]
 0045D5B4    dec         edx
>0045D5B5    jne         0045D569
 0045D5B7    ret
 0045D5B8    fld         dword ptr [eax]
 0045D5BA    fmul        st,st(0)
 0045D5BC    fld         dword ptr [eax+4]
 0045D5BF    fmul        st,st(0)
 0045D5C1    faddp       st(1),st
 0045D5C3    fld         dword ptr [eax+8]
 0045D5C6    fmul        st,st(0)
 0045D5C8    faddp       st(1),st
 0045D5CA    fsqrt
 0045D5CC    fld1
 0045D5CE    fdivrp      st(1),st
 0045D5D0    fld         st(0)
 0045D5D2    fmul        dword ptr [eax]
 0045D5D4    fstp        dword ptr [eax]
 0045D5D6    fld         st(0)
 0045D5D8    fmul        dword ptr [eax+4]
 0045D5DB    fstp        dword ptr [eax+4]
 0045D5DE    fmul        dword ptr [eax+8]
 0045D5E1    fstp        dword ptr [eax+8]
 0045D5E4    add         eax,0C
 0045D5E7    dec         edx
>0045D5E8    jne         0045D5B8
 0045D5EA    ret
*}
end;

//0045D5EC
procedure sub_0045D5EC(?:Integer);
begin
{*
 0045D5EC    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045D5F3    je          0045D63F
 0045D5F5    movq        mm0,mmword ptr [eax]
 0045D5F8    movd        mm1,dword ptr [eax+8]
 0045D5FC    movq        mm4,mm0
 0045D5FF    movq        mm3,mm1
 0045D602    pfmul       mm0,mm0
 0045D606    pfmul       mm1,mm1
 0045D60A    pfacc       mm0,mm0
 0045D60E    pfadd       mm0,mm1
 0045D612    pfrsqrt     mm1,mm0
 0045D616    movq        mm2,mm1
 0045D619    pfmul       mm1,mm1
 0045D61D    pfrsqit1    mm1,mm0
 0045D621    pfrcpit2    mm1,mm2
 0045D625    punpcklbq   mm1,mm1
 0045D628    pfmul       mm3,mm1
 0045D62C    pfmul       mm4,mm1
 0045D630    movd        dword ptr [eax+8],mm3
 0045D634    movq        mmword ptr [eax],mm4
 0045D637    femms
 0045D639    xor         edx,edx
 0045D63B    mov         dword ptr [eax+0C],edx
 0045D63E    ret
 0045D63F    fld         dword ptr [eax]
 0045D641    fmul        st,st(0)
 0045D643    fld         dword ptr [eax+4]
 0045D646    fmul        st,st(0)
 0045D648    faddp       st(1),st
 0045D64A    fld         dword ptr [eax+8]
 0045D64D    fmul        st,st(0)
 0045D64F    faddp       st(1),st
 0045D651    fsqrt
 0045D653    fld1
 0045D655    fdivrp      st(1),st
 0045D657    fld         st(0)
 0045D659    fmul        dword ptr [eax]
 0045D65B    fstp        dword ptr [eax]
 0045D65D    fld         st(0)
 0045D65F    fmul        dword ptr [eax+4]
 0045D662    fstp        dword ptr [eax+4]
 0045D665    fmul        dword ptr [eax+8]
 0045D668    fstp        dword ptr [eax+8]
 0045D66B    xor         edx,edx
 0045D66D    mov         dword ptr [eax+0C],edx
 0045D670    ret
*}
end;

//0045D674
{*procedure sub_0045D674(?:?; ?:?);
begin
 0045D674    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045D67B    je          0045D6C7
 0045D67D    movq        mm0,mmword ptr [eax]
 0045D680    movd        mm1,dword ptr [eax+8]
 0045D684    movq        mm4,mm0
 0045D687    movq        mm3,mm1
 0045D68A    pfmul       mm0,mm0
 0045D68E    pfmul       mm1,mm1
 0045D692    pfacc       mm0,mm0
 0045D696    pfadd       mm0,mm1
 0045D69A    pfrsqrt     mm1,mm0
 0045D69E    movq        mm2,mm1
 0045D6A1    pfmul       mm1,mm1
 0045D6A5    pfrsqit1    mm1,mm0
 0045D6A9    pfrcpit2    mm1,mm2
 0045D6AD    punpcklbq   mm1,mm1
 0045D6B0    pfmul       mm3,mm1
 0045D6B4    pfmul       mm4,mm1
 0045D6B8    movd        dword ptr [edx+8],mm3
 0045D6BC    movq        mmword ptr [edx],mm4
 0045D6BF    femms
 0045D6C1    xor         eax,eax
 0045D6C3    mov         dword ptr [edx+0C],eax
 0045D6C6    ret
 0045D6C7    fld         dword ptr [eax]
 0045D6C9    fmul        st,st(0)
 0045D6CB    fld         dword ptr [eax+4]
 0045D6CE    fmul        st,st(0)
 0045D6D0    faddp       st(1),st
 0045D6D2    fld         dword ptr [eax+8]
 0045D6D5    fmul        st,st(0)
 0045D6D7    faddp       st(1),st
 0045D6D9    fsqrt
 0045D6DB    fld1
 0045D6DD    fdivrp      st(1),st
 0045D6DF    fld         st(0)
 0045D6E1    fmul        dword ptr [eax]
 0045D6E3    fstp        dword ptr [edx]
 0045D6E5    fld         st(0)
 0045D6E7    fmul        dword ptr [eax+4]
 0045D6EA    fstp        dword ptr [edx+4]
 0045D6ED    fmul        dword ptr [eax+8]
 0045D6F0    fstp        dword ptr [edx+8]
 0045D6F3    xor         eax,eax
 0045D6F5    mov         dword ptr [edx+0C],eax
 0045D6F8    ret
end;*}

//0045D6FC
{*procedure sub_0045D6FC(?:?);
begin
 0045D6FC    fld         dword ptr [eax]
 0045D6FE    fchs
 0045D700    fstp        dword ptr [edx]
 0045D702    fld         dword ptr [eax+4]
 0045D705    fchs
 0045D707    fstp        dword ptr [edx+4]
 0045D70A    fld         dword ptr [eax+8]
 0045D70D    fchs
 0045D70F    fstp        dword ptr [edx+8]
 0045D712    ret
end;*}

//0045D714
{*procedure sub_0045D714(?:?);
begin
 0045D714    fld         dword ptr [eax]
 0045D716    fchs
 0045D718    fstp        dword ptr [edx]
 0045D71A    fld         dword ptr [eax+4]
 0045D71D    fchs
 0045D71F    fstp        dword ptr [edx+4]
 0045D722    fld         dword ptr [eax+8]
 0045D725    fchs
 0045D727    fstp        dword ptr [edx+8]
 0045D72A    fld         dword ptr [eax+0C]
 0045D72D    fchs
 0045D72F    fstp        dword ptr [edx+0C]
 0045D732    ret
end;*}

//0045D734
{*procedure sub_0045D734(?:?);
begin
 0045D734    fld         dword ptr [eax]
 0045D736    fchs
 0045D738    fstp        dword ptr [eax]
 0045D73A    fld         dword ptr [eax+4]
 0045D73D    fchs
 0045D73F    fstp        dword ptr [eax+4]
 0045D742    fld         dword ptr [eax+8]
 0045D745    fchs
 0045D747    fstp        dword ptr [eax+8]
 0045D74A    ret
end;*}

//0045D74C
{*procedure sub_0045D74C(?:?);
begin
 0045D74C    fld         dword ptr [eax]
 0045D74E    fchs
 0045D750    fstp        dword ptr [eax]
 0045D752    fld         dword ptr [eax+4]
 0045D755    fchs
 0045D757    fstp        dword ptr [eax+4]
 0045D75A    fld         dword ptr [eax+8]
 0045D75D    fchs
 0045D75F    fstp        dword ptr [eax+8]
 0045D762    fld         dword ptr [eax+0C]
 0045D765    fchs
 0045D767    fstp        dword ptr [eax+0C]
 0045D76A    ret
end;*}

//0045D76C
{*procedure sub_0045D76C(?:?; ?:?);
begin
 0045D76C    push        ebp
 0045D76D    mov         ebp,esp
 0045D76F    fld         dword ptr [eax]
 0045D771    fmul        dword ptr [ebp+8]
 0045D774    fstp        dword ptr [eax]
 0045D776    fld         dword ptr [eax+4]
 0045D779    fmul        dword ptr [ebp+8]
 0045D77C    fstp        dword ptr [eax+4]
 0045D77F    fld         dword ptr [eax+8]
 0045D782    fmul        dword ptr [ebp+8]
 0045D785    fstp        dword ptr [eax+8]
 0045D788    pop         ebp
 0045D789    ret         4
end;*}

//0045D78C
{*procedure sub_0045D78C(?:?; ?:?);
begin
 0045D78C    push        ebp
 0045D78D    mov         ebp,esp
 0045D78F    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045D796    je          0045D7BB
 0045D798    movd        mm1,dword ptr [ebp+8]
 0045D79C    punpcklbq   mm1,mm1
 0045D79F    movq        mm0,mmword ptr [eax]
 0045D7A2    movq        mm2,mmword ptr [eax+8]
 0045D7A6    pfmul       mm0,mm1
 0045D7AA    pfmul       mm2,mm1
 0045D7AE    movq        mmword ptr [eax],mm0
 0045D7B1    movq        mmword ptr [eax+8],mm2
 0045D7B5    femms
 0045D7B7    pop         ebp
 0045D7B8    ret         4
 0045D7BB    fld         dword ptr [ebp+8]
 0045D7BE    fld         dword ptr [eax]
 0045D7C0    fmul        st,st(1)
 0045D7C2    fstp        dword ptr [eax]
 0045D7C4    fld         dword ptr [eax+4]
 0045D7C7    fmul        st,st(1)
 0045D7C9    fstp        dword ptr [eax+4]
 0045D7CC    fld         dword ptr [eax+8]
 0045D7CF    fmul        st,st(1)
 0045D7D1    fstp        dword ptr [eax+8]
 0045D7D4    fld         dword ptr [eax+0C]
 0045D7D7    fmulp       st(1),st
 0045D7D9    fstp        dword ptr [eax+0C]
 0045D7DC    pop         ebp
 0045D7DD    ret         4
end;*}

//0045D7E0
{*procedure sub_0045D7E0(?:Integer; ?:?);
begin
 0045D7E0    fld         dword ptr [eax]
 0045D7E2    fmul        dword ptr [edx]
 0045D7E4    fstp        dword ptr [eax]
 0045D7E6    wait
 0045D7E7    fld         dword ptr [eax+4]
 0045D7EA    fmul        dword ptr [edx+4]
 0045D7ED    fstp        dword ptr [eax+4]
 0045D7F0    wait
 0045D7F1    fld         dword ptr [eax+8]
 0045D7F4    fmul        dword ptr [edx+8]
 0045D7F7    fstp        dword ptr [eax+8]
 0045D7FA    wait
 0045D7FB    ret
end;*}

//0045D7FC
{*procedure sub_0045D7FC(?:?; ?:?);
begin
 0045D7FC    fld         dword ptr [eax]
 0045D7FE    fmul        dword ptr [edx]
 0045D800    fstp        dword ptr [eax]
 0045D802    wait
 0045D803    fld         dword ptr [eax+4]
 0045D806    fmul        dword ptr [edx+4]
 0045D809    fstp        dword ptr [eax+4]
 0045D80C    wait
 0045D80D    fld         dword ptr [eax+8]
 0045D810    fmul        dword ptr [edx+8]
 0045D813    fstp        dword ptr [eax+8]
 0045D816    wait
 0045D817    fld         dword ptr [eax+0C]
 0045D81A    fmul        dword ptr [edx+0C]
 0045D81D    fstp        dword ptr [eax+0C]
 0045D820    wait
 0045D821    ret
end;*}

//0045D824
{*procedure sub_0045D824(?:?; ?:?);
begin
 0045D824    push        ebp
 0045D825    mov         ebp,esp
 0045D827    fld         dword ptr [eax]
 0045D829    fmul        dword ptr [ebp+8]
 0045D82C    fstp        dword ptr [edx]
 0045D82E    fld         dword ptr [eax+4]
 0045D831    fmul        dword ptr [ebp+8]
 0045D834    fstp        dword ptr [edx+4]
 0045D837    fld         dword ptr [eax+8]
 0045D83A    fmul        dword ptr [ebp+8]
 0045D83D    fstp        dword ptr [edx+8]
 0045D840    pop         ebp
 0045D841    ret         4
end;*}

//0045D844
{*procedure sub_0045D844(?:?; ?:?);
begin
 0045D844    push        ebp
 0045D845    mov         ebp,esp
 0045D847    fld         dword ptr [eax]
 0045D849    fmul        dword ptr [ebp+8]
 0045D84C    fstp        dword ptr [edx]
 0045D84E    fld         dword ptr [eax+4]
 0045D851    fmul        dword ptr [ebp+8]
 0045D854    fstp        dword ptr [edx+4]
 0045D857    fld         dword ptr [eax+8]
 0045D85A    fmul        dword ptr [ebp+8]
 0045D85D    fstp        dword ptr [edx+8]
 0045D860    fld         dword ptr [eax+0C]
 0045D863    fmul        dword ptr [ebp+8]
 0045D866    fstp        dword ptr [edx+0C]
 0045D869    pop         ebp
 0045D86A    ret         4
end;*}

//0045D870
{*function sub_0045D870(?:dword; ?:Pointer):?;
begin
 0045D870    mov         ecx,dword ptr [edx]
 0045D872    cmp         ecx,dword ptr [eax]
>0045D874    jne         0045D894
 0045D876    mov         ecx,dword ptr [edx+4]
 0045D879    cmp         ecx,dword ptr [eax+4]
>0045D87C    jne         0045D894
 0045D87E    mov         ecx,dword ptr [edx+8]
 0045D881    cmp         ecx,dword ptr [eax+8]
>0045D884    jne         0045D894
 0045D886    mov         ecx,dword ptr [edx+0C]
 0045D889    cmp         ecx,dword ptr [eax+0C]
>0045D88C    jne         0045D894
 0045D88E    mov         eax,1
 0045D893    ret
 0045D894    xor         eax,eax
 0045D896    ret
end;*}

//0045D898
{*function sub_0045D898(?:?; ?:Integer):?;
begin
 0045D898    mov         ecx,dword ptr [edx]
 0045D89A    cmp         ecx,dword ptr [eax]
>0045D89C    jne         0045D8B1
 0045D89E    mov         ecx,dword ptr [edx+4]
 0045D8A1    cmp         ecx,dword ptr [eax+4]
>0045D8A4    jne         0045D8B1
 0045D8A6    mov         ecx,dword ptr [edx+8]
 0045D8A9    cmp         ecx,dword ptr [eax+8]
>0045D8AC    jne         0045D8B1
 0045D8AE    mov         al,1
 0045D8B0    ret
 0045D8B1    xor         eax,eax
 0045D8B3    ret
end;*}

//0045D8B4
{*function sub_0045D8B4(?:Integer; ?:?):?;
begin
 0045D8B4    mov         ecx,dword ptr [edx]
 0045D8B6    cmp         ecx,dword ptr [eax]
>0045D8B8    jne         0045D8D0
 0045D8BA    mov         ecx,dword ptr [edx+4]
 0045D8BD    cmp         ecx,dword ptr [eax+4]
>0045D8C0    jne         0045D8D0
 0045D8C2    mov         ecx,dword ptr [edx+8]
 0045D8C5    cmp         ecx,dword ptr [eax+8]
>0045D8C8    jne         0045D8D0
 0045D8CA    mov         eax,1
 0045D8CF    ret
 0045D8D0    xor         eax,eax
 0045D8D2    ret
end;*}

//0045D8D4
{*function sub_0045D8D4(?:?):?;
begin
 0045D8D4    mov         edx,eax
 0045D8D6    fld         dword ptr [edx]
 0045D8D8    fcomp       dword ptr ds:[45D908];0:Single
 0045D8DE    fnstsw      al
 0045D8E0    sahf
>0045D8E1    jne         0045D8FF
 0045D8E3    fld         dword ptr [edx+4]
 0045D8E6    fcomp       dword ptr ds:[45D908];0:Single
 0045D8EC    fnstsw      al
 0045D8EE    sahf
>0045D8EF    jne         0045D8FF
 0045D8F1    fld         dword ptr [edx+8]
 0045D8F4    fcomp       dword ptr ds:[45D908];0:Single
 0045D8FA    fnstsw      al
 0045D8FC    sahf
>0045D8FD    je          0045D902
 0045D8FF    xor         eax,eax
 0045D901    ret
 0045D902    mov         al,1
 0045D904    ret
end;*}

//0045D90C
{*function sub_0045D90C(?:?; ?:?):?;
begin
 0045D90C    fld         dword ptr [eax]
 0045D90E    fsub        dword ptr [edx]
 0045D910    fabs
 0045D912    fld         dword ptr [eax+4]
 0045D915    fsub        dword ptr [edx+4]
 0045D918    fabs
 0045D91A    faddp       st(1),st
 0045D91C    fld         dword ptr [eax+8]
 0045D91F    fsub        dword ptr [edx+8]
 0045D922    fabs
 0045D924    faddp       st(1),st
 0045D926    ret
end;*}

//0045D928
{*procedure sub_0045D928(?:?; ?:?);
begin
 0045D928    fld         dword ptr [eax]
 0045D92A    fsub        dword ptr [edx]
 0045D92C    fmul        st,st(0)
 0045D92E    fld         dword ptr [eax+4]
 0045D931    fsub        dword ptr [edx+4]
 0045D934    fmul        st,st(0)
 0045D936    faddp       st(1),st
 0045D938    fld         dword ptr [eax+8]
 0045D93B    fsub        dword ptr [edx+8]
 0045D93E    fmul        st,st(0)
 0045D940    faddp       st(1),st
 0045D942    fsqrt
 0045D944    ret
end;*}

//0045D948
{*function sub_0045D948(?:Integer; ?:?):?;
begin
 0045D948    fld         dword ptr [eax]
 0045D94A    fsub        dword ptr [edx]
 0045D94C    fmul        st,st(0)
 0045D94E    fld         dword ptr [eax+4]
 0045D951    fsub        dword ptr [edx+4]
 0045D954    fmul        st,st(0)
 0045D956    faddp       st(1),st
 0045D958    fld         dword ptr [eax+8]
 0045D95B    fsub        dword ptr [edx+8]
 0045D95E    fmul        st,st(0)
 0045D960    faddp       st(1),st
 0045D962    ret
end;*}

//0045D964
{*procedure sub_0045D964(?:?; ?:?; ?:?);
begin
 0045D964    push        ebx
 0045D965    push        esi
 0045D966    push        edi
 0045D967    push        ecx
 0045D968    mov         edi,ecx
 0045D96A    mov         esi,edx
 0045D96C    mov         ebx,eax
 0045D96E    mov         edx,esi
 0045D970    mov         eax,ebx
 0045D972    call        0045CE18
 0045D977    fstp        dword ptr [esp]
 0045D97A    wait
 0045D97B    fld         dword ptr [esp]
 0045D97E    fmul        dword ptr [esi]
 0045D980    fsubr       dword ptr [ebx]
 0045D982    fstp        dword ptr [edi]
 0045D984    wait
 0045D985    fld         dword ptr [esp]
 0045D988    fmul        dword ptr [esi+4]
 0045D98B    fsubr       dword ptr [ebx+4]
 0045D98E    fstp        dword ptr [edi+4]
 0045D991    wait
 0045D992    fld         dword ptr [esp]
 0045D995    fmul        dword ptr [esi+8]
 0045D998    fsubr       dword ptr [ebx+8]
 0045D99B    fstp        dword ptr [edi+8]
 0045D99E    wait
 0045D99F    pop         edx
 0045D9A0    pop         edi
 0045D9A1    pop         esi
 0045D9A2    pop         ebx
 0045D9A3    ret
end;*}

//0045D9A4
{*procedure sub_0045D9A4(?:?; ?:?; ?:?);
begin
 0045D9A4    push        ebp
 0045D9A5    mov         ebp,esp
 0045D9A7    add         esp,0FFFFFFB0
 0045D9AA    push        ebx
 0045D9AB    push        esi
 0045D9AC    push        edi
 0045D9AD    mov         esi,edx
 0045D9AF    mov         ebx,eax
 0045D9B1    push        dword ptr [ebp+8]
 0045D9B4    lea         edx,[ebp-40]
 0045D9B7    mov         eax,esi
 0045D9B9    call        0045DB10
 0045D9BE    lea         ecx,[ebp-50]
 0045D9C1    lea         edx,[ebp-40]
 0045D9C4    mov         eax,ebx
 0045D9C6    call        0045E03C
 0045D9CB    lea         esi,[ebp-50]
 0045D9CE    mov         edi,ebx
 0045D9D0    movs        dword ptr [edi],dword ptr [esi]
 0045D9D1    movs        dword ptr [edi],dword ptr [esi]
 0045D9D2    movs        dword ptr [edi],dword ptr [esi]
 0045D9D3    movs        dword ptr [edi],dword ptr [esi]
 0045D9D4    pop         edi
 0045D9D5    pop         esi
 0045D9D6    pop         ebx
 0045D9D7    mov         esp,ebp
 0045D9D9    pop         ebp
 0045D9DA    ret         4
end;*}

//0045D9E0
{*procedure sub_0045D9E0(?:?; ?:?);
begin
 0045D9E0    push        ebx
 0045D9E1    push        esi
 0045D9E2    mov         esi,edx
 0045D9E4    mov         ebx,eax
 0045D9E6    fld         dword ptr [ebx]
 0045D9E8    fabs
 0045D9EA    fstp        dword ptr [esi]
 0045D9EC    wait
 0045D9ED    fld         dword ptr [ebx+4]
 0045D9F0    fabs
 0045D9F2    fstp        dword ptr [esi+4]
 0045D9F5    wait
 0045D9F6    fld         dword ptr [ebx+8]
 0045D9F9    fabs
 0045D9FB    fstp        dword ptr [esi+8]
 0045D9FE    wait
 0045D9FF    fld         dword ptr [ebx+0C]
 0045DA02    fabs
 0045DA04    fstp        dword ptr [esi+0C]
 0045DA07    wait
 0045DA08    pop         esi
 0045DA09    pop         ebx
 0045DA0A    ret
end;*}

//0045DA0C
{*procedure sub_0045DA0C(?:Single; ?:?; ?:?);
begin
 0045DA0C    push        ebx
 0045DA0D    push        esi
 0045DA0E    push        edi
 0045DA0F    mov         ebx,ecx
 0045DA11    mov         edi,ebx
 0045DA13    mov         esi,5ACFB4;gvar_005ACFB4
 0045DA18    mov         ecx,10
 0045DA1D    rep movs    dword ptr [edi],dword ptr [esi]
 0045DA1F    mov         ecx,dword ptr [eax]
 0045DA21    mov         dword ptr [ebx],ecx
 0045DA23    mov         ecx,dword ptr [edx]
 0045DA25    mov         dword ptr [ebx+30],ecx
 0045DA28    mov         ecx,dword ptr [eax+4]
 0045DA2B    mov         dword ptr [ebx+14],ecx
 0045DA2E    mov         ecx,dword ptr [edx+4]
 0045DA31    mov         dword ptr [ebx+34],ecx
 0045DA34    mov         eax,dword ptr [eax+8]
 0045DA37    mov         dword ptr [ebx+28],eax
 0045DA3A    mov         eax,dword ptr [edx+8]
 0045DA3D    mov         dword ptr [ebx+38],eax
 0045DA40    pop         edi
 0045DA41    pop         esi
 0045DA42    pop         ebx
 0045DA43    ret
end;*}

//0045DA44
{*procedure sub_0045DA44(?:?; ?:?; ?:?);
begin
 0045DA44    push        ebp
 0045DA45    mov         ebp,esp
 0045DA47    push        esi
 0045DA48    push        edi
 0045DA49    mov         edi,eax
 0045DA4B    mov         esi,5ACFF4
 0045DA50    mov         ecx,10
 0045DA55    rep movs    dword ptr [edi],dword ptr [esi]
 0045DA57    mov         dword ptr [eax],3F800000
 0045DA5D    mov         edx,dword ptr [ebp+8]
 0045DA60    mov         dword ptr [eax+14],edx
 0045DA63    mov         edx,dword ptr [ebp+0C]
 0045DA66    mov         dword ptr [eax+18],edx
 0045DA69    fld         dword ptr [ebp+0C]
 0045DA6C    fchs
 0045DA6E    fstp        dword ptr [eax+24]
 0045DA71    wait
 0045DA72    mov         edx,dword ptr [ebp+8]
 0045DA75    mov         dword ptr [eax+28],edx
 0045DA78    mov         dword ptr [eax+3C],3F800000
 0045DA7F    pop         edi
 0045DA80    pop         esi
 0045DA81    pop         ebp
 0045DA82    ret         8
end;*}

//0045DA88
{*procedure sub_0045DA88(?:?; ?:?; ?:?);
begin
 0045DA88    push        ebp
 0045DA89    mov         ebp,esp
 0045DA8B    push        esi
 0045DA8C    push        edi
 0045DA8D    mov         edi,eax
 0045DA8F    mov         esi,5ACFF4
 0045DA94    mov         ecx,10
 0045DA99    rep movs    dword ptr [edi],dword ptr [esi]
 0045DA9B    mov         edx,dword ptr [ebp+8]
 0045DA9E    mov         dword ptr [eax],edx
 0045DAA0    fld         dword ptr [ebp+0C]
 0045DAA3    fchs
 0045DAA5    fstp        dword ptr [eax+8]
 0045DAA8    wait
 0045DAA9    mov         dword ptr [eax+14],3F800000
 0045DAB0    mov         edx,dword ptr [ebp+0C]
 0045DAB3    mov         dword ptr [eax+20],edx
 0045DAB6    mov         edx,dword ptr [ebp+8]
 0045DAB9    mov         dword ptr [eax+28],edx
 0045DABC    mov         dword ptr [eax+3C],3F800000
 0045DAC3    pop         edi
 0045DAC4    pop         esi
 0045DAC5    pop         ebp
 0045DAC6    ret         8
end;*}

//0045DACC
{*procedure sub_0045DACC(?:?; ?:?; ?:?);
begin
 0045DACC    push        ebp
 0045DACD    mov         ebp,esp
 0045DACF    push        esi
 0045DAD0    push        edi
 0045DAD1    mov         edi,eax
 0045DAD3    mov         esi,5ACFF4
 0045DAD8    mov         ecx,10
 0045DADD    rep movs    dword ptr [edi],dword ptr [esi]
 0045DADF    mov         edx,dword ptr [ebp+8]
 0045DAE2    mov         dword ptr [eax],edx
 0045DAE4    mov         edx,dword ptr [ebp+0C]
 0045DAE7    mov         dword ptr [eax+4],edx
 0045DAEA    fld         dword ptr [ebp+0C]
 0045DAED    fchs
 0045DAEF    fstp        dword ptr [eax+10]
 0045DAF2    wait
 0045DAF3    mov         edx,dword ptr [ebp+8]
 0045DAF6    mov         dword ptr [eax+14],edx
 0045DAF9    mov         dword ptr [eax+28],3F800000
 0045DB00    mov         dword ptr [eax+3C],3F800000
 0045DB07    pop         edi
 0045DB08    pop         esi
 0045DB09    pop         ebp
 0045DB0A    ret         8
end;*}

//0045DB10
{*procedure sub_0045DB10(?:?; ?:?; ?:?);
begin
 0045DB10    push        ebp
 0045DB11    mov         ebp,esp
 0045DB13    add         esp,0FFFFFFE8
 0045DB16    push        ebx
 0045DB17    push        esi
 0045DB18    push        edi
 0045DB19    mov         ebx,edx
 0045DB1B    mov         edi,eax
 0045DB1D    lea         esi,[ebp-18]
 0045DB20    push        dword ptr [ebp+8]
 0045DB23    lea         edx,[ebp-4]
 0045DB26    lea         eax,[ebp-8]
 0045DB29    call        0045F570
 0045DB2E    fld         dword ptr ds:[45DC18];1:Single
 0045DB34    fsub        dword ptr [ebp-4]
 0045DB37    fstp        dword ptr [ebp-0C]
 0045DB3A    wait
 0045DB3B    mov         edx,esi
 0045DB3D    mov         eax,edi
 0045DB3F    call        0045D4DC
 0045DB44    fld         dword ptr [ebp-0C]
 0045DB47    fmul        dword ptr [esi]
 0045DB49    fmul        dword ptr [esi]
 0045DB4B    fadd        dword ptr [ebp-4]
 0045DB4E    fstp        dword ptr [ebx]
 0045DB50    wait
 0045DB51    fld         dword ptr [ebp-0C]
 0045DB54    fmul        dword ptr [esi]
 0045DB56    fmul        dword ptr [esi+4]
 0045DB59    fld         dword ptr [esi+8]
 0045DB5C    fmul        dword ptr [ebp-8]
 0045DB5F    fsubp       st(1),st
 0045DB61    fstp        dword ptr [ebx+4]
 0045DB64    wait
 0045DB65    fld         dword ptr [ebp-0C]
 0045DB68    fmul        dword ptr [esi+8]
 0045DB6B    fmul        dword ptr [esi]
 0045DB6D    fld         dword ptr [esi+4]
 0045DB70    fmul        dword ptr [ebp-8]
 0045DB73    faddp       st(1),st
 0045DB75    fstp        dword ptr [ebx+8]
 0045DB78    wait
 0045DB79    xor         eax,eax
 0045DB7B    mov         dword ptr [ebx+0C],eax
 0045DB7E    fld         dword ptr [ebp-0C]
 0045DB81    fmul        dword ptr [esi]
 0045DB83    fmul        dword ptr [esi+4]
 0045DB86    fld         dword ptr [esi+8]
 0045DB89    fmul        dword ptr [ebp-8]
 0045DB8C    faddp       st(1),st
 0045DB8E    fstp        dword ptr [ebx+10]
 0045DB91    wait
 0045DB92    fld         dword ptr [ebp-0C]
 0045DB95    fmul        dword ptr [esi+4]
 0045DB98    fmul        dword ptr [esi+4]
 0045DB9B    fadd        dword ptr [ebp-4]
 0045DB9E    fstp        dword ptr [ebx+14]
 0045DBA1    wait
 0045DBA2    fld         dword ptr [ebp-0C]
 0045DBA5    fmul        dword ptr [esi+4]
 0045DBA8    fmul        dword ptr [esi+8]
 0045DBAB    fld         dword ptr [esi]
 0045DBAD    fmul        dword ptr [ebp-8]
 0045DBB0    fsubp       st(1),st
 0045DBB2    fstp        dword ptr [ebx+18]
 0045DBB5    wait
 0045DBB6    xor         eax,eax
 0045DBB8    mov         dword ptr [ebx+1C],eax
 0045DBBB    fld         dword ptr [ebp-0C]
 0045DBBE    fmul        dword ptr [esi+8]
 0045DBC1    fmul        dword ptr [esi]
 0045DBC3    fld         dword ptr [esi+4]
 0045DBC6    fmul        dword ptr [ebp-8]
 0045DBC9    fsubp       st(1),st
 0045DBCB    fstp        dword ptr [ebx+20]
 0045DBCE    wait
 0045DBCF    fld         dword ptr [ebp-0C]
 0045DBD2    fmul        dword ptr [esi+4]
 0045DBD5    fmul        dword ptr [esi+8]
 0045DBD8    fld         dword ptr [esi]
 0045DBDA    fmul        dword ptr [ebp-8]
 0045DBDD    faddp       st(1),st
 0045DBDF    fstp        dword ptr [ebx+24]
 0045DBE2    wait
 0045DBE3    fld         dword ptr [ebp-0C]
 0045DBE6    fmul        dword ptr [esi+8]
 0045DBE9    fmul        dword ptr [esi+8]
 0045DBEC    fadd        dword ptr [ebp-4]
 0045DBEF    fstp        dword ptr [ebx+28]
 0045DBF2    wait
 0045DBF3    xor         eax,eax
 0045DBF5    mov         dword ptr [ebx+2C],eax
 0045DBF8    xor         eax,eax
 0045DBFA    mov         dword ptr [ebx+30],eax
 0045DBFD    xor         eax,eax
 0045DBFF    mov         dword ptr [ebx+34],eax
 0045DC02    xor         eax,eax
 0045DC04    mov         dword ptr [ebx+38],eax
 0045DC07    mov         dword ptr [ebx+3C],3F800000
 0045DC0E    pop         edi
 0045DC0F    pop         esi
 0045DC10    pop         ebx
 0045DC11    mov         esp,ebp
 0045DC13    pop         ebp
 0045DC14    ret         4
end;*}

//0045DC1C
{*procedure sub_0045DC1C(?:Single; ?:?; ?:?);
begin
 0045DC1C    push        ebp
 0045DC1D    mov         ebp,esp
 0045DC1F    push        ebx
 0045DC20    push        esi
 0045DC21    mov         esi,edx
 0045DC23    mov         ebx,eax
 0045DC25    push        dword ptr [ebp+8]
 0045DC28    mov         edx,esi
 0045DC2A    mov         eax,ebx
 0045DC2C    call        0045DB10
 0045DC31    pop         esi
 0045DC32    pop         ebx
 0045DC33    pop         ebp
 0045DC34    ret         4
end;*}

//0045DC38
{*procedure sub_0045DC38(?:Integer; ?:?; ?:?);
begin
 0045DC38    cmp         byte ptr ds:[5AD060],1;gvar_005AD060
>0045DC3F    jne         0045DDFB
 0045DC45    xchg        eax,ecx
 0045DC46    movq        mm0,mmword ptr [ecx]
 0045DC49    movq        mm1,mmword ptr [ecx+8]
 0045DC4D    movq        mm4,mmword ptr [edx]
 0045DC50    punpckhbq   mm2,mm0
 0045DC53    movq        mm5,mmword ptr [edx+10]
 0045DC57    punpckhbq   mm3,mm1
 0045DC5A    movq        mm6,mmword ptr [edx+20]
 0045DC5E    punpcklbq   mm0,mm0
 0045DC61    punpcklbq   mm1,mm1
 0045DC64    pfmul       mm4,mm0
 0045DC68    punpckhbq   mm2,mm2
 0045DC6B    pfmul       mm0,mmword ptr [edx+8]
 0045DC70    movq        mm7,mmword ptr [edx+30]
 0045DC74    pfmul       mm5,mm2
 0045DC78    punpckhbq   mm3,mm3
 0045DC7B    pfmul       mm2,mmword ptr [edx+18]
 0045DC80    pfmul       mm6,mm1
 0045DC84    pfadd       mm5,mm4
 0045DC88    pfmul       mm1,mmword ptr [edx+28]
 0045DC8D    pfadd       mm2,mm0
 0045DC91    pfmul       mm7,mm3
 0045DC95    pfadd       mm6,mm5
 0045DC99    pfmul       mm3,mmword ptr [edx+38]
 0045DC9E    pfadd       mm2,mm1
 0045DCA2    pfadd       mm7,mm6
 0045DCA6    movq        mm0,mmword ptr [ecx+10]
 0045DCAA    pfadd       mm3,mm2
 0045DCAE    movq        mm1,mmword ptr [ecx+18]
 0045DCB2    movq        mmword ptr [eax],mm7
 0045DCB5    movq        mm4,mmword ptr [edx]
 0045DCB8    movq        mmword ptr [eax+8],mm3
 0045DCBC    punpckhbq   mm2,mm0
 0045DCBF    movq        mm5,mmword ptr [edx+10]
 0045DCC3    punpckhbq   mm3,mm1
 0045DCC6    movq        mm6,mmword ptr [edx+20]
 0045DCCA    punpcklbq   mm0,mm0
 0045DCCD    punpcklbq   mm1,mm1
 0045DCD0    pfmul       mm4,mm0
 0045DCD4    punpckhbq   mm2,mm2
 0045DCD7    pfmul       mm0,mmword ptr [edx+8]
 0045DCDC    movq        mm7,mmword ptr [edx+30]
 0045DCE0    pfmul       mm5,mm2
 0045DCE4    punpckhbq   mm3,mm3
 0045DCE7    pfmul       mm2,mmword ptr [edx+18]
 0045DCEC    pfmul       mm6,mm1
 0045DCF0    pfadd       mm5,mm4
 0045DCF4    pfmul       mm1,mmword ptr [edx+28]
 0045DCF9    pfadd       mm2,mm0
 0045DCFD    pfmul       mm7,mm3
 0045DD01    pfadd       mm6,mm5
 0045DD05    pfmul       mm3,mmword ptr [edx+38]
 0045DD0A    pfadd       mm2,mm1
 0045DD0E    pfadd       mm7,mm6
 0045DD12    movq        mm0,mmword ptr [ecx+20]
 0045DD16    pfadd       mm3,mm2
 0045DD1A    movq        mm1,mmword ptr [ecx+28]
 0045DD1E    movq        mmword ptr [eax+10],mm7
 0045DD22    movq        mm4,mmword ptr [edx]
 0045DD25    movq        mmword ptr [eax+18],mm3
 0045DD29    punpckhbq   mm2,mm0
 0045DD2C    movq        mm5,mmword ptr [edx+10]
 0045DD30    punpckhbq   mm3,mm1
 0045DD33    movq        mm6,mmword ptr [edx+20]
 0045DD37    punpcklbq   mm0,mm0
 0045DD3A    punpcklbq   mm1,mm1
 0045DD3D    pfmul       mm4,mm0
 0045DD41    punpckhbq   mm2,mm2
 0045DD44    pfmul       mm0,mmword ptr [edx+8]
 0045DD49    movq        mm7,mmword ptr [edx+30]
 0045DD4D    pfmul       mm5,mm2
 0045DD51    punpckhbq   mm3,mm3
 0045DD54    pfmul       mm2,mmword ptr [edx+18]
 0045DD59    pfmul       mm6,mm1
 0045DD5D    pfadd       mm5,mm4
 0045DD61    pfmul       mm1,mmword ptr [edx+28]
 0045DD66    pfadd       mm2,mm0
 0045DD6A    pfmul       mm7,mm3
 0045DD6E    pfadd       mm6,mm5
 0045DD72    pfmul       mm3,mmword ptr [edx+38]
 0045DD77    pfadd       mm2,mm1
 0045DD7B    pfadd       mm7,mm6
 0045DD7F    movq        mm0,mmword ptr [ecx+30]
 0045DD83    pfadd       mm3,mm2
 0045DD87    movq        mm1,mmword ptr [ecx+38]
 0045DD8B    movq        mmword ptr [eax+20],mm7
 0045DD8F    movq        mm4,mmword ptr [edx]
 0045DD92    movq        mmword ptr [eax+28],mm3
 0045DD96    punpckhbq   mm2,mm0
 0045DD99    movq        mm5,mmword ptr [edx+10]
 0045DD9D    punpckhbq   mm3,mm1
 0045DDA0    movq        mm6,mmword ptr [edx+20]
 0045DDA4    punpcklbq   mm0,mm0
 0045DDA7    punpcklbq   mm1,mm1
 0045DDAA    pfmul       mm4,mm0
 0045DDAE    punpckhbq   mm2,mm2
 0045DDB1    pfmul       mm0,mmword ptr [edx+8]
 0045DDB6    movq        mm7,mmword ptr [edx+30]
 0045DDBA    pfmul       mm5,mm2
 0045DDBE    punpckhbq   mm3,mm3
 0045DDC1    pfmul       mm2,mmword ptr [edx+18]
 0045DDC6    pfmul       mm6,mm1
 0045DDCA    pfadd       mm5,mm4
 0045DDCE    pfmul       mm1,mmword ptr [edx+28]
 0045DDD3    pfadd       mm2,mm0
 0045DDD7    pfmul       mm7,mm3
 0045DDDB    pfadd       mm6,mm5
 0045DDDF    pfmul       mm3,mmword ptr [edx+38]
 0045DDE4    pfadd       mm2,mm1
 0045DDE8    pfadd       mm7,mm6
 0045DDEC    pfadd       mm3,mm2
 0045DDF0    movq        mmword ptr [eax+30],mm7
 0045DDF4    movq        mmword ptr [eax+38],mm3
 0045DDF8    femms
 0045DDFA    ret
 0045DDFB    fld         dword ptr [eax]
 0045DDFD    fmul        dword ptr [edx]
 0045DDFF    fld         dword ptr [eax+4]
 0045DE02    fmul        dword ptr [edx+10]
 0045DE05    faddp       st(1),st
 0045DE07    fld         dword ptr [eax+8]
 0045DE0A    fmul        dword ptr [edx+20]
 0045DE0D    faddp       st(1),st
 0045DE0F    fld         dword ptr [eax+0C]
 0045DE12    fmul        dword ptr [edx+30]
 0045DE15    faddp       st(1),st
 0045DE17    fstp        dword ptr [ecx]
 0045DE19    wait
 0045DE1A    fld         dword ptr [eax]
 0045DE1C    fmul        dword ptr [edx+4]
 0045DE1F    fld         dword ptr [eax+4]
 0045DE22    fmul        dword ptr [edx+14]
 0045DE25    faddp       st(1),st
 0045DE27    fld         dword ptr [eax+8]
 0045DE2A    fmul        dword ptr [edx+24]
 0045DE2D    faddp       st(1),st
 0045DE2F    fld         dword ptr [eax+0C]
 0045DE32    fmul        dword ptr [edx+34]
 0045DE35    faddp       st(1),st
 0045DE37    fstp        dword ptr [ecx+4]
 0045DE3A    wait
 0045DE3B    fld         dword ptr [eax]
 0045DE3D    fmul        dword ptr [edx+8]
 0045DE40    fld         dword ptr [eax+4]
 0045DE43    fmul        dword ptr [edx+18]
 0045DE46    faddp       st(1),st
 0045DE48    fld         dword ptr [eax+8]
 0045DE4B    fmul        dword ptr [edx+28]
 0045DE4E    faddp       st(1),st
 0045DE50    fld         dword ptr [eax+0C]
 0045DE53    fmul        dword ptr [edx+38]
 0045DE56    faddp       st(1),st
 0045DE58    fstp        dword ptr [ecx+8]
 0045DE5B    wait
 0045DE5C    fld         dword ptr [eax]
 0045DE5E    fmul        dword ptr [edx+0C]
 0045DE61    fld         dword ptr [eax+4]
 0045DE64    fmul        dword ptr [edx+1C]
 0045DE67    faddp       st(1),st
 0045DE69    fld         dword ptr [eax+8]
 0045DE6C    fmul        dword ptr [edx+2C]
 0045DE6F    faddp       st(1),st
 0045DE71    fld         dword ptr [eax+0C]
 0045DE74    fmul        dword ptr [edx+3C]
 0045DE77    faddp       st(1),st
 0045DE79    fstp        dword ptr [ecx+0C]
 0045DE7C    wait
 0045DE7D    fld         dword ptr [eax+10]
 0045DE80    fmul        dword ptr [edx]
 0045DE82    fld         dword ptr [eax+14]
 0045DE85    fmul        dword ptr [edx+10]
 0045DE88    faddp       st(1),st
 0045DE8A    fld         dword ptr [eax+18]
 0045DE8D    fmul        dword ptr [edx+20]
 0045DE90    faddp       st(1),st
 0045DE92    fld         dword ptr [eax+1C]
 0045DE95    fmul        dword ptr [edx+30]
 0045DE98    faddp       st(1),st
 0045DE9A    fstp        dword ptr [ecx+10]
 0045DE9D    wait
 0045DE9E    fld         dword ptr [eax+10]
 0045DEA1    fmul        dword ptr [edx+4]
 0045DEA4    fld         dword ptr [eax+14]
 0045DEA7    fmul        dword ptr [edx+14]
 0045DEAA    faddp       st(1),st
 0045DEAC    fld         dword ptr [eax+18]
 0045DEAF    fmul        dword ptr [edx+24]
 0045DEB2    faddp       st(1),st
 0045DEB4    fld         dword ptr [eax+1C]
 0045DEB7    fmul        dword ptr [edx+34]
 0045DEBA    faddp       st(1),st
 0045DEBC    fstp        dword ptr [ecx+14]
 0045DEBF    wait
 0045DEC0    fld         dword ptr [eax+10]
 0045DEC3    fmul        dword ptr [edx+8]
 0045DEC6    fld         dword ptr [eax+14]
 0045DEC9    fmul        dword ptr [edx+18]
 0045DECC    faddp       st(1),st
 0045DECE    fld         dword ptr [eax+18]
 0045DED1    fmul        dword ptr [edx+28]
 0045DED4    faddp       st(1),st
 0045DED6    fld         dword ptr [eax+1C]
 0045DED9    fmul        dword ptr [edx+38]
 0045DEDC    faddp       st(1),st
 0045DEDE    fstp        dword ptr [ecx+18]
 0045DEE1    wait
 0045DEE2    fld         dword ptr [eax+10]
 0045DEE5    fmul        dword ptr [edx+0C]
 0045DEE8    fld         dword ptr [eax+14]
 0045DEEB    fmul        dword ptr [edx+1C]
 0045DEEE    faddp       st(1),st
 0045DEF0    fld         dword ptr [eax+18]
 0045DEF3    fmul        dword ptr [edx+2C]
 0045DEF6    faddp       st(1),st
 0045DEF8    fld         dword ptr [eax+1C]
 0045DEFB    fmul        dword ptr [edx+3C]
 0045DEFE    faddp       st(1),st
 0045DF00    fstp        dword ptr [ecx+1C]
 0045DF03    wait
 0045DF04    fld         dword ptr [eax+20]
 0045DF07    fmul        dword ptr [edx]
 0045DF09    fld         dword ptr [eax+24]
 0045DF0C    fmul        dword ptr [edx+10]
 0045DF0F    faddp       st(1),st
 0045DF11    fld         dword ptr [eax+28]
 0045DF14    fmul        dword ptr [edx+20]
 0045DF17    faddp       st(1),st
 0045DF19    fld         dword ptr [eax+2C]
 0045DF1C    fmul        dword ptr [edx+30]
 0045DF1F    faddp       st(1),st
 0045DF21    fstp        dword ptr [ecx+20]
 0045DF24    wait
 0045DF25    fld         dword ptr [eax+20]
 0045DF28    fmul        dword ptr [edx+4]
 0045DF2B    fld         dword ptr [eax+24]
 0045DF2E    fmul        dword ptr [edx+14]
 0045DF31    faddp       st(1),st
 0045DF33    fld         dword ptr [eax+28]
 0045DF36    fmul        dword ptr [edx+24]
 0045DF39    faddp       st(1),st
 0045DF3B    fld         dword ptr [eax+2C]
 0045DF3E    fmul        dword ptr [edx+34]
 0045DF41    faddp       st(1),st
 0045DF43    fstp        dword ptr [ecx+24]
 0045DF46    wait
 0045DF47    fld         dword ptr [eax+20]
 0045DF4A    fmul        dword ptr [edx+8]
 0045DF4D    fld         dword ptr [eax+24]
 0045DF50    fmul        dword ptr [edx+18]
 0045DF53    faddp       st(1),st
 0045DF55    fld         dword ptr [eax+28]
 0045DF58    fmul        dword ptr [edx+28]
 0045DF5B    faddp       st(1),st
 0045DF5D    fld         dword ptr [eax+2C]
 0045DF60    fmul        dword ptr [edx+38]
 0045DF63    faddp       st(1),st
 0045DF65    fstp        dword ptr [ecx+28]
 0045DF68    wait
 0045DF69    fld         dword ptr [eax+20]
 0045DF6C    fmul        dword ptr [edx+0C]
 0045DF6F    fld         dword ptr [eax+24]
 0045DF72    fmul        dword ptr [edx+1C]
 0045DF75    faddp       st(1),st
 0045DF77    fld         dword ptr [eax+28]
 0045DF7A    fmul        dword ptr [edx+2C]
 0045DF7D    faddp       st(1),st
 0045DF7F    fld         dword ptr [eax+2C]
 0045DF82    fmul        dword ptr [edx+3C]
 0045DF85    faddp       st(1),st
 0045DF87    fstp        dword ptr [ecx+2C]
 0045DF8A    wait
 0045DF8B    fld         dword ptr [eax+30]
 0045DF8E    fmul        dword ptr [edx]
 0045DF90    fld         dword ptr [eax+34]
 0045DF93    fmul        dword ptr [edx+10]
 0045DF96    faddp       st(1),st
 0045DF98    fld         dword ptr [eax+38]
 0045DF9B    fmul        dword ptr [edx+20]
 0045DF9E    faddp       st(1),st
 0045DFA0    fld         dword ptr [eax+3C]
 0045DFA3    fmul        dword ptr [edx+30]
 0045DFA6    faddp       st(1),st
 0045DFA8    fstp        dword ptr [ecx+30]
 0045DFAB    wait
 0045DFAC    fld         dword ptr [eax+30]
 0045DFAF    fmul        dword ptr [edx+4]
 0045DFB2    fld         dword ptr [eax+34]
 0045DFB5    fmul        dword ptr [edx+14]
 0045DFB8    faddp       st(1),st
 0045DFBA    fld         dword ptr [eax+38]
 0045DFBD    fmul        dword ptr [edx+24]
 0045DFC0    faddp       st(1),st
 0045DFC2    fld         dword ptr [eax+3C]
 0045DFC5    fmul        dword ptr [edx+34]
 0045DFC8    faddp       st(1),st
 0045DFCA    fstp        dword ptr [ecx+34]
 0045DFCD    wait
 0045DFCE    fld         dword ptr [eax+30]
 0045DFD1    fmul        dword ptr [edx+8]
 0045DFD4    fld         dword ptr [eax+34]
 0045DFD7    fmul        dword ptr [edx+18]
 0045DFDA    faddp       st(1),st
 0045DFDC    fld         dword ptr [eax+38]
 0045DFDF    fmul        dword ptr [edx+28]
 0045DFE2    faddp       st(1),st
 0045DFE4    fld         dword ptr [eax+3C]
 0045DFE7    fmul        dword ptr [edx+38]
 0045DFEA    faddp       st(1),st
 0045DFEC    fstp        dword ptr [ecx+38]
 0045DFEF    wait
 0045DFF0    fld         dword ptr [eax+30]
 0045DFF3    fmul        dword ptr [edx+0C]
 0045DFF6    fld         dword ptr [eax+34]
 0045DFF9    fmul        dword ptr [edx+1C]
 0045DFFC    faddp       st(1),st
 0045DFFE    fld         dword ptr [eax+38]
 0045E001    fmul        dword ptr [edx+2C]
 0045E004    faddp       st(1),st
 0045E006    fld         dword ptr [eax+3C]
 0045E009    fmul        dword ptr [edx+3C]
 0045E00C    faddp       st(1),st
 0045E00E    fstp        dword ptr [ecx+3C]
 0045E011    wait
 0045E012    ret
end;*}

//0045E014
{*procedure sub_0045E014(?:?; ?:?; ?:?);
begin
 0045E014    push        ebx
 0045E015    push        esi
 0045E016    push        edi
 0045E017    add         esp,0FFFFFFC0
 0045E01A    mov         edi,ecx
 0045E01C    mov         esi,edx
 0045E01E    mov         ebx,eax
 0045E020    mov         ecx,esp
 0045E022    mov         edx,esi
 0045E024    mov         eax,ebx
 0045E026    call        0045DC38
 0045E02B    mov         esi,esp
 0045E02D    mov         ecx,10
 0045E032    rep movs    dword ptr [edi],dword ptr [esi]
 0045E034    add         esp,40
 0045E037    pop         edi
 0045E038    pop         esi
 0045E039    pop         ebx
 0045E03A    ret
end;*}

//0045E03C
{*procedure sub_0045E03C(?:?; ?:?; ?:?);
begin
 0045E03C    cmp         byte ptr ds:[5AD060],1;gvar_005AD060
>0045E043    jne         0045E0B3
 0045E045    movq        mm0,mmword ptr [eax]
 0045E048    movq        mm1,mmword ptr [eax+8]
 0045E04C    movq        mm4,mmword ptr [edx]
 0045E04F    punpckhbq   mm2,mm0
 0045E052    movq        mm5,mmword ptr [edx+10]
 0045E056    punpcklbq   mm0,mm0
 0045E059    movq        mm6,mmword ptr [edx+20]
 0045E05D    pfmul       mm4,mm0
 0045E061    movq        mm7,mmword ptr [edx+30]
 0045E065    punpckhbq   mm2,mm2
 0045E068    punpckhbq   mm3,mm1
 0045E06B    pfmul       mm5,mm2
 0045E06F    punpcklbq   mm1,mm1
 0045E072    pfmul       mm0,mmword ptr [edx+8]
 0045E077    punpckhbq   mm3,mm3
 0045E07A    pfmul       mm2,mmword ptr [edx+18]
 0045E07F    pfmul       mm6,mm1
 0045E083    pfadd       mm5,mm4
 0045E087    pfmul       mm1,mmword ptr [edx+28]
 0045E08C    pfadd       mm2,mm0
 0045E090    pfmul       mm7,mm3
 0045E094    pfadd       mm6,mm5
 0045E098    pfmul       mm3,mmword ptr [edx+38]
 0045E09D    pfadd       mm2,mm1
 0045E0A1    pfadd       mm7,mm6
 0045E0A5    pfadd       mm3,mm2
 0045E0A9    movq        mmword ptr [ecx],mm7
 0045E0AC    movq        mmword ptr [ecx+8],mm3
 0045E0B0    femms
 0045E0B2    ret
 0045E0B3    fld         dword ptr [eax]
 0045E0B5    fmul        dword ptr [edx]
 0045E0B7    fld         dword ptr [eax+4]
 0045E0BA    fmul        dword ptr [edx+10]
 0045E0BD    faddp       st(1),st
 0045E0BF    fld         dword ptr [eax+8]
 0045E0C2    fmul        dword ptr [edx+20]
 0045E0C5    faddp       st(1),st
 0045E0C7    fld         dword ptr [eax+0C]
 0045E0CA    fmul        dword ptr [edx+30]
 0045E0CD    faddp       st(1),st
 0045E0CF    fstp        dword ptr [ecx]
 0045E0D1    wait
 0045E0D2    fld         dword ptr [eax]
 0045E0D4    fmul        dword ptr [edx+4]
 0045E0D7    fld         dword ptr [eax+4]
 0045E0DA    fmul        dword ptr [edx+14]
 0045E0DD    faddp       st(1),st
 0045E0DF    fld         dword ptr [eax+8]
 0045E0E2    fmul        dword ptr [edx+24]
 0045E0E5    faddp       st(1),st
 0045E0E7    fld         dword ptr [eax+0C]
 0045E0EA    fmul        dword ptr [edx+34]
 0045E0ED    faddp       st(1),st
 0045E0EF    fstp        dword ptr [ecx+4]
 0045E0F2    wait
 0045E0F3    fld         dword ptr [eax]
 0045E0F5    fmul        dword ptr [edx+8]
 0045E0F8    fld         dword ptr [eax+4]
 0045E0FB    fmul        dword ptr [edx+18]
 0045E0FE    faddp       st(1),st
 0045E100    fld         dword ptr [eax+8]
 0045E103    fmul        dword ptr [edx+28]
 0045E106    faddp       st(1),st
 0045E108    fld         dword ptr [eax+0C]
 0045E10B    fmul        dword ptr [edx+38]
 0045E10E    faddp       st(1),st
 0045E110    fstp        dword ptr [ecx+8]
 0045E113    wait
 0045E114    fld         dword ptr [eax]
 0045E116    fmul        dword ptr [edx+0C]
 0045E119    fld         dword ptr [eax+4]
 0045E11C    fmul        dword ptr [edx+1C]
 0045E11F    faddp       st(1),st
 0045E121    fld         dword ptr [eax+8]
 0045E124    fmul        dword ptr [edx+2C]
 0045E127    faddp       st(1),st
 0045E129    fld         dword ptr [eax+0C]
 0045E12C    fmul        dword ptr [edx+3C]
 0045E12F    faddp       st(1),st
 0045E131    fstp        dword ptr [ecx+0C]
 0045E134    wait
 0045E135    ret
end;*}

//0045E138
{*procedure sub_0045E138(?:Integer; ?:?);
begin
 0045E138    fld         dword ptr [eax]
 0045E13A    fmul        dword ptr [edx]
 0045E13C    fld         dword ptr [eax+4]
 0045E13F    fmul        dword ptr [edx+10]
 0045E142    faddp       st(1),st
 0045E144    fld         dword ptr [eax+8]
 0045E147    fmul        dword ptr [edx+20]
 0045E14A    faddp       st(1),st
 0045E14C    fadd        dword ptr [edx+30]
 0045E14F    fstp        dword ptr [ecx]
 0045E151    wait
 0045E152    fld         dword ptr [eax]
 0045E154    fmul        dword ptr [edx+4]
 0045E157    fld         dword ptr [eax+4]
 0045E15A    fmul        dword ptr [edx+14]
 0045E15D    faddp       st(1),st
 0045E15F    fld         dword ptr [eax+8]
 0045E162    fmul        dword ptr [edx+24]
 0045E165    faddp       st(1),st
 0045E167    fadd        dword ptr [edx+34]
 0045E16A    fstp        dword ptr [ecx+4]
 0045E16D    wait
 0045E16E    fld         dword ptr [eax]
 0045E170    fmul        dword ptr [edx+8]
 0045E173    fld         dword ptr [eax+4]
 0045E176    fmul        dword ptr [edx+18]
 0045E179    faddp       st(1),st
 0045E17B    fld         dword ptr [eax+8]
 0045E17E    fmul        dword ptr [edx+28]
 0045E181    faddp       st(1),st
 0045E183    fadd        dword ptr [edx+38]
 0045E186    fstp        dword ptr [ecx+8]
 0045E189    wait
 0045E18A    ret
end;*}

//0045E18C
{*function sub_0045E18C(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0045E18C    push        ebp
 0045E18D    mov         ebp,esp
 0045E18F    push        ecx
 0045E190    fld         dword ptr [ebp+18]
 0045E193    fmul        dword ptr [ebp+8]
 0045E196    fld         dword ptr [ebp+14]
 0045E199    fmul        dword ptr [ebp+0C]
 0045E19C    fsubp       st(1),st
 0045E19E    fmul        dword ptr [ebp+28]
 0045E1A1    fld         dword ptr [ebp+24]
 0045E1A4    fmul        dword ptr [ebp+8]
 0045E1A7    fld         dword ptr [ebp+20]
 0045E1AA    fmul        dword ptr [ebp+0C]
 0045E1AD    fsubp       st(1),st
 0045E1AF    fmul        dword ptr [ebp+1C]
 0045E1B2    fsubp       st(1),st
 0045E1B4    fld         dword ptr [ebp+24]
 0045E1B7    fmul        dword ptr [ebp+14]
 0045E1BA    fld         dword ptr [ebp+20]
 0045E1BD    fmul        dword ptr [ebp+18]
 0045E1C0    fsubp       st(1),st
 0045E1C2    fmul        dword ptr [ebp+10]
 0045E1C5    faddp       st(1),st
 0045E1C7    fstp        dword ptr [ebp-4]
 0045E1CA    wait
 0045E1CB    fld         dword ptr [ebp-4]
 0045E1CE    pop         ecx
 0045E1CF    pop         ebp
 0045E1D0    ret         24
end;*}

//0045E1D4
{*function sub_0045E1D4(?:?):?;
begin
 0045E1D4    push        ebx
 0045E1D5    add         esp,0FFFFFFD8
 0045E1D8    mov         ebx,eax
 0045E1DA    push        dword ptr [ebx+14]
 0045E1DD    push        dword ptr [ebx+24]
 0045E1E0    push        dword ptr [ebx+34]
 0045E1E3    push        dword ptr [ebx+18]
 0045E1E6    push        dword ptr [ebx+28]
 0045E1E9    push        dword ptr [ebx+38]
 0045E1EC    push        dword ptr [ebx+1C]
 0045E1EF    push        dword ptr [ebx+2C]
 0045E1F2    push        dword ptr [ebx+3C]
 0045E1F5    call        0045E18C
 0045E1FA    fmul        dword ptr [ebx]
 0045E1FC    fstp        tbyte ptr [esp+4]
 0045E200    wait
 0045E201    push        dword ptr [ebx+10]
 0045E204    push        dword ptr [ebx+20]
 0045E207    push        dword ptr [ebx+30]
 0045E20A    push        dword ptr [ebx+18]
 0045E20D    push        dword ptr [ebx+28]
 0045E210    push        dword ptr [ebx+38]
 0045E213    push        dword ptr [ebx+1C]
 0045E216    push        dword ptr [ebx+2C]
 0045E219    push        dword ptr [ebx+3C]
 0045E21C    call        0045E18C
 0045E221    fmul        dword ptr [ebx+4]
 0045E224    fld         tbyte ptr [esp+4]
 0045E228    fsubrp      st(1),st
 0045E22A    fstp        tbyte ptr [esp+10]
 0045E22E    wait
 0045E22F    push        dword ptr [ebx+10]
 0045E232    push        dword ptr [ebx+20]
 0045E235    push        dword ptr [ebx+30]
 0045E238    push        dword ptr [ebx+14]
 0045E23B    push        dword ptr [ebx+24]
 0045E23E    push        dword ptr [ebx+34]
 0045E241    push        dword ptr [ebx+1C]
 0045E244    push        dword ptr [ebx+2C]
 0045E247    push        dword ptr [ebx+3C]
 0045E24A    call        0045E18C
 0045E24F    fmul        dword ptr [ebx+8]
 0045E252    fld         tbyte ptr [esp+10]
 0045E256    faddp       st(1),st
 0045E258    fstp        tbyte ptr [esp+1C]
 0045E25C    wait
 0045E25D    push        dword ptr [ebx+10]
 0045E260    push        dword ptr [ebx+20]
 0045E263    push        dword ptr [ebx+30]
 0045E266    push        dword ptr [ebx+14]
 0045E269    push        dword ptr [ebx+24]
 0045E26C    push        dword ptr [ebx+34]
 0045E26F    push        dword ptr [ebx+18]
 0045E272    push        dword ptr [ebx+28]
 0045E275    push        dword ptr [ebx+38]
 0045E278    call        0045E18C
 0045E27D    fmul        dword ptr [ebx+0C]
 0045E280    fld         tbyte ptr [esp+1C]
 0045E284    fsubrp      st(1),st
 0045E286    fstp        dword ptr [esp]
 0045E289    wait
 0045E28A    fld         dword ptr [esp]
 0045E28D    add         esp,28
 0045E290    pop         ebx
 0045E291    ret
end;*}

//0045E294
{*procedure sub_0045E294(?:?);
begin
 0045E294    push        ebx
 0045E295    add         esp,0FFFFFFC0
 0045E298    mov         ebx,eax
 0045E29A    mov         eax,dword ptr [ebx]
 0045E29C    mov         dword ptr [esp],eax
 0045E29F    mov         eax,dword ptr [ebx+4]
 0045E2A2    mov         dword ptr [esp+10],eax
 0045E2A6    mov         eax,dword ptr [ebx+8]
 0045E2A9    mov         dword ptr [esp+20],eax
 0045E2AD    mov         eax,dword ptr [ebx+0C]
 0045E2B0    mov         dword ptr [esp+30],eax
 0045E2B4    mov         eax,dword ptr [ebx+10]
 0045E2B7    mov         dword ptr [esp+4],eax
 0045E2BB    mov         eax,dword ptr [ebx+14]
 0045E2BE    mov         dword ptr [esp+14],eax
 0045E2C2    mov         eax,dword ptr [ebx+18]
 0045E2C5    mov         dword ptr [esp+24],eax
 0045E2C9    mov         eax,dword ptr [ebx+1C]
 0045E2CC    mov         dword ptr [esp+34],eax
 0045E2D0    mov         eax,dword ptr [ebx+20]
 0045E2D3    mov         dword ptr [esp+8],eax
 0045E2D7    mov         eax,dword ptr [ebx+24]
 0045E2DA    mov         dword ptr [esp+18],eax
 0045E2DE    mov         eax,dword ptr [ebx+28]
 0045E2E1    mov         dword ptr [esp+28],eax
 0045E2E5    mov         eax,dword ptr [ebx+2C]
 0045E2E8    mov         dword ptr [esp+38],eax
 0045E2EC    mov         eax,dword ptr [ebx+30]
 0045E2EF    mov         dword ptr [esp+0C],eax
 0045E2F3    mov         eax,dword ptr [ebx+34]
 0045E2F6    mov         dword ptr [esp+1C],eax
 0045E2FA    mov         eax,dword ptr [ebx+38]
 0045E2FD    mov         dword ptr [esp+2C],eax
 0045E301    mov         eax,dword ptr [ebx+3C]
 0045E304    mov         dword ptr [esp+3C],eax
 0045E308    push        dword ptr [esp+14]
 0045E30C    push        dword ptr [esp+1C]
 0045E310    push        dword ptr [esp+24]
 0045E314    push        dword ptr [esp+30]
 0045E318    push        dword ptr [esp+38]
 0045E31C    push        dword ptr [esp+40]
 0045E320    push        dword ptr [esp+4C]
 0045E324    push        dword ptr [esp+54]
 0045E328    push        dword ptr [esp+5C]
 0045E32C    call        0045E18C
 0045E331    fstp        dword ptr [ebx]
 0045E333    wait
 0045E334    push        dword ptr [esp+4]
 0045E338    push        dword ptr [esp+0C]
 0045E33C    push        dword ptr [esp+14]
 0045E340    push        dword ptr [esp+30]
 0045E344    push        dword ptr [esp+38]
 0045E348    push        dword ptr [esp+40]
 0045E34C    push        dword ptr [esp+4C]
 0045E350    push        dword ptr [esp+54]
 0045E354    push        dword ptr [esp+5C]
 0045E358    call        0045E18C
 0045E35D    fchs
 0045E35F    fstp        dword ptr [ebx+10]
 0045E362    wait
 0045E363    push        dword ptr [esp+4]
 0045E367    push        dword ptr [esp+0C]
 0045E36B    push        dword ptr [esp+14]
 0045E36F    push        dword ptr [esp+20]
 0045E373    push        dword ptr [esp+28]
 0045E377    push        dword ptr [esp+30]
 0045E37B    push        dword ptr [esp+4C]
 0045E37F    push        dword ptr [esp+54]
 0045E383    push        dword ptr [esp+5C]
 0045E387    call        0045E18C
 0045E38C    fstp        dword ptr [ebx+20]
 0045E38F    wait
 0045E390    push        dword ptr [esp+4]
 0045E394    push        dword ptr [esp+0C]
 0045E398    push        dword ptr [esp+14]
 0045E39C    push        dword ptr [esp+20]
 0045E3A0    push        dword ptr [esp+28]
 0045E3A4    push        dword ptr [esp+30]
 0045E3A8    push        dword ptr [esp+3C]
 0045E3AC    push        dword ptr [esp+44]
 0045E3B0    push        dword ptr [esp+4C]
 0045E3B4    call        0045E18C
 0045E3B9    fchs
 0045E3BB    fstp        dword ptr [ebx+30]
 0045E3BE    wait
 0045E3BF    push        dword ptr [esp+10]
 0045E3C3    push        dword ptr [esp+1C]
 0045E3C7    push        dword ptr [esp+24]
 0045E3CB    push        dword ptr [esp+2C]
 0045E3CF    push        dword ptr [esp+38]
 0045E3D3    push        dword ptr [esp+40]
 0045E3D7    push        dword ptr [esp+48]
 0045E3DB    push        dword ptr [esp+54]
 0045E3DF    push        dword ptr [esp+5C]
 0045E3E3    call        0045E18C
 0045E3E8    fchs
 0045E3EA    fstp        dword ptr [ebx+4]
 0045E3ED    wait
 0045E3EE    push        dword ptr [esp]
 0045E3F1    push        dword ptr [esp+0C]
 0045E3F5    push        dword ptr [esp+14]
 0045E3F9    push        dword ptr [esp+2C]
 0045E3FD    push        dword ptr [esp+38]
 0045E401    push        dword ptr [esp+40]
 0045E405    push        dword ptr [esp+48]
 0045E409    push        dword ptr [esp+54]
 0045E40D    push        dword ptr [esp+5C]
 0045E411    call        0045E18C
 0045E416    fstp        dword ptr [ebx+14]
 0045E419    wait
 0045E41A    push        dword ptr [esp]
 0045E41D    push        dword ptr [esp+0C]
 0045E421    push        dword ptr [esp+14]
 0045E425    push        dword ptr [esp+1C]
 0045E429    push        dword ptr [esp+28]
 0045E42D    push        dword ptr [esp+30]
 0045E431    push        dword ptr [esp+48]
 0045E435    push        dword ptr [esp+54]
 0045E439    push        dword ptr [esp+5C]
 0045E43D    call        0045E18C
 0045E442    fchs
 0045E444    fstp        dword ptr [ebx+24]
 0045E447    wait
 0045E448    push        dword ptr [esp]
 0045E44B    push        dword ptr [esp+0C]
 0045E44F    push        dword ptr [esp+14]
 0045E453    push        dword ptr [esp+1C]
 0045E457    push        dword ptr [esp+28]
 0045E45B    push        dword ptr [esp+30]
 0045E45F    push        dword ptr [esp+38]
 0045E463    push        dword ptr [esp+44]
 0045E467    push        dword ptr [esp+4C]
 0045E46B    call        0045E18C
 0045E470    fstp        dword ptr [ebx+34]
 0045E473    wait
 0045E474    push        dword ptr [esp+10]
 0045E478    push        dword ptr [esp+18]
 0045E47C    push        dword ptr [esp+24]
 0045E480    push        dword ptr [esp+2C]
 0045E484    push        dword ptr [esp+34]
 0045E488    push        dword ptr [esp+40]
 0045E48C    push        dword ptr [esp+48]
 0045E490    push        dword ptr [esp+50]
 0045E494    push        dword ptr [esp+5C]
 0045E498    call        0045E18C
 0045E49D    fstp        dword ptr [ebx+8]
 0045E4A0    wait
 0045E4A1    push        dword ptr [esp]
 0045E4A4    push        dword ptr [esp+8]
 0045E4A8    push        dword ptr [esp+14]
 0045E4AC    push        dword ptr [esp+2C]
 0045E4B0    push        dword ptr [esp+34]
 0045E4B4    push        dword ptr [esp+40]
 0045E4B8    push        dword ptr [esp+48]
 0045E4BC    push        dword ptr [esp+50]
 0045E4C0    push        dword ptr [esp+5C]
 0045E4C4    call        0045E18C
 0045E4C9    fchs
 0045E4CB    fstp        dword ptr [ebx+18]
 0045E4CE    wait
 0045E4CF    push        dword ptr [esp]
 0045E4D2    push        dword ptr [esp+8]
 0045E4D6    push        dword ptr [esp+14]
 0045E4DA    push        dword ptr [esp+1C]
 0045E4DE    push        dword ptr [esp+24]
 0045E4E2    push        dword ptr [esp+30]
 0045E4E6    push        dword ptr [esp+48]
 0045E4EA    push        dword ptr [esp+50]
 0045E4EE    push        dword ptr [esp+5C]
 0045E4F2    call        0045E18C
 0045E4F7    fstp        dword ptr [ebx+28]
 0045E4FA    wait
 0045E4FB    push        dword ptr [esp]
 0045E4FE    push        dword ptr [esp+8]
 0045E502    push        dword ptr [esp+14]
 0045E506    push        dword ptr [esp+1C]
 0045E50A    push        dword ptr [esp+24]
 0045E50E    push        dword ptr [esp+30]
 0045E512    push        dword ptr [esp+38]
 0045E516    push        dword ptr [esp+40]
 0045E51A    push        dword ptr [esp+4C]
 0045E51E    call        0045E18C
 0045E523    fchs
 0045E525    fstp        dword ptr [ebx+38]
 0045E528    wait
 0045E529    push        dword ptr [esp+10]
 0045E52D    push        dword ptr [esp+18]
 0045E531    push        dword ptr [esp+20]
 0045E535    push        dword ptr [esp+2C]
 0045E539    push        dword ptr [esp+34]
 0045E53D    push        dword ptr [esp+3C]
 0045E541    push        dword ptr [esp+48]
 0045E545    push        dword ptr [esp+50]
 0045E549    push        dword ptr [esp+58]
 0045E54D    call        0045E18C
 0045E552    fchs
 0045E554    fstp        dword ptr [ebx+0C]
 0045E557    wait
 0045E558    push        dword ptr [esp]
 0045E55B    push        dword ptr [esp+8]
 0045E55F    push        dword ptr [esp+10]
 0045E563    push        dword ptr [esp+2C]
 0045E567    push        dword ptr [esp+34]
 0045E56B    push        dword ptr [esp+3C]
 0045E56F    push        dword ptr [esp+48]
 0045E573    push        dword ptr [esp+50]
 0045E577    push        dword ptr [esp+58]
 0045E57B    call        0045E18C
 0045E580    fstp        dword ptr [ebx+1C]
 0045E583    wait
 0045E584    push        dword ptr [esp]
 0045E587    push        dword ptr [esp+8]
 0045E58B    push        dword ptr [esp+10]
 0045E58F    push        dword ptr [esp+1C]
 0045E593    push        dword ptr [esp+24]
 0045E597    push        dword ptr [esp+2C]
 0045E59B    push        dword ptr [esp+48]
 0045E59F    push        dword ptr [esp+50]
 0045E5A3    push        dword ptr [esp+58]
 0045E5A7    call        0045E18C
 0045E5AC    fchs
 0045E5AE    fstp        dword ptr [ebx+2C]
 0045E5B1    wait
 0045E5B2    push        dword ptr [esp]
 0045E5B5    push        dword ptr [esp+8]
 0045E5B9    push        dword ptr [esp+10]
 0045E5BD    push        dword ptr [esp+1C]
 0045E5C1    push        dword ptr [esp+24]
 0045E5C5    push        dword ptr [esp+2C]
 0045E5C9    push        dword ptr [esp+38]
 0045E5CD    push        dword ptr [esp+40]
 0045E5D1    push        dword ptr [esp+48]
 0045E5D5    call        0045E18C
 0045E5DA    fstp        dword ptr [ebx+3C]
 0045E5DD    wait
 0045E5DE    add         esp,40
 0045E5E1    pop         ebx
 0045E5E2    ret
end;*}

//0045E5E4
{*procedure sub_0045E5E4(?:?; ?:?);
begin
 0045E5E4    push        ebp
 0045E5E5    mov         ebp,esp
 0045E5E7    mov         ecx,4
 0045E5EC    mov         edx,eax
 0045E5EE    fld         dword ptr [edx]
 0045E5F0    fmul        dword ptr [ebp+8]
 0045E5F3    fstp        dword ptr [edx]
 0045E5F5    wait
 0045E5F6    fld         dword ptr [edx+4]
 0045E5F9    fmul        dword ptr [ebp+8]
 0045E5FC    fstp        dword ptr [edx+4]
 0045E5FF    wait
 0045E600    fld         dword ptr [edx+8]
 0045E603    fmul        dword ptr [ebp+8]
 0045E606    fstp        dword ptr [edx+8]
 0045E609    wait
 0045E60A    fld         dword ptr [edx+0C]
 0045E60D    fmul        dword ptr [ebp+8]
 0045E610    fstp        dword ptr [edx+0C]
 0045E613    wait
 0045E614    add         edx,10
 0045E617    dec         ecx
>0045E618    jne         0045E5EE
 0045E61A    pop         ebp
 0045E61B    ret         4
end;*}

//0045E620
{*procedure sub_0045E620(?:?);
begin
 0045E620    push        ebx
 0045E621    push        esi
 0045E622    push        edi
 0045E623    add         esp,0FFFFFFF0
 0045E626    mov         ebx,eax
 0045E628    xor         eax,eax
 0045E62A    mov         dword ptr [ebx+0C],eax
 0045E62D    mov         eax,ebx
 0045E62F    call        0045D5EC
 0045E634    xor         eax,eax
 0045E636    mov         dword ptr [ebx+1C],eax
 0045E639    lea         eax,[ebx+10]
 0045E63C    call        0045D5EC
 0045E641    mov         ecx,esp
 0045E643    lea         edx,[ebx+10]
 0045E646    mov         eax,ebx
 0045E648    call        0045CEDC
 0045E64D    mov         esi,esp
 0045E64F    lea         edi,[ebx+20]
 0045E652    movs        dword ptr [edi],dword ptr [esi]
 0045E653    movs        dword ptr [edi],dword ptr [esi]
 0045E654    movs        dword ptr [edi],dword ptr [esi]
 0045E655    movs        dword ptr [edi],dword ptr [esi]
 0045E656    mov         ecx,esp
 0045E658    lea         edx,[ebx+20]
 0045E65B    lea         eax,[ebx+10]
 0045E65E    call        0045CEDC
 0045E663    mov         esi,esp
 0045E665    mov         edi,ebx
 0045E667    movs        dword ptr [edi],dword ptr [esi]
 0045E668    movs        dword ptr [edi],dword ptr [esi]
 0045E669    movs        dword ptr [edi],dword ptr [esi]
 0045E66A    movs        dword ptr [edi],dword ptr [esi]
 0045E66B    lea         edi,[ebx+30]
 0045E66E    mov         esi,5ACF54
 0045E673    movs        dword ptr [edi],dword ptr [esi]
 0045E674    movs        dword ptr [edi],dword ptr [esi]
 0045E675    movs        dword ptr [edi],dword ptr [esi]
 0045E676    movs        dword ptr [edi],dword ptr [esi]
 0045E677    add         esp,10
 0045E67A    pop         edi
 0045E67B    pop         esi
 0045E67C    pop         ebx
 0045E67D    ret
end;*}

//0045E680
{*procedure sub_0045E680(?:?);
begin
 0045E680    push        ecx
 0045E681    mov         edx,dword ptr [eax+4]
 0045E684    mov         dword ptr [esp],edx
 0045E687    mov         edx,dword ptr [eax+10]
 0045E68A    mov         dword ptr [eax+4],edx
 0045E68D    mov         edx,dword ptr [esp]
 0045E690    mov         dword ptr [eax+10],edx
 0045E693    mov         edx,dword ptr [eax+8]
 0045E696    mov         dword ptr [esp],edx
 0045E699    mov         edx,dword ptr [eax+20]
 0045E69C    mov         dword ptr [eax+8],edx
 0045E69F    mov         edx,dword ptr [esp]
 0045E6A2    mov         dword ptr [eax+20],edx
 0045E6A5    mov         edx,dword ptr [eax+0C]
 0045E6A8    mov         dword ptr [esp],edx
 0045E6AB    mov         edx,dword ptr [eax+30]
 0045E6AE    mov         dword ptr [eax+0C],edx
 0045E6B1    mov         edx,dword ptr [esp]
 0045E6B4    mov         dword ptr [eax+30],edx
 0045E6B7    mov         edx,dword ptr [eax+18]
 0045E6BA    mov         dword ptr [esp],edx
 0045E6BD    mov         edx,dword ptr [eax+24]
 0045E6C0    mov         dword ptr [eax+18],edx
 0045E6C3    mov         edx,dword ptr [esp]
 0045E6C6    mov         dword ptr [eax+24],edx
 0045E6C9    mov         edx,dword ptr [eax+1C]
 0045E6CC    mov         dword ptr [esp],edx
 0045E6CF    mov         edx,dword ptr [eax+34]
 0045E6D2    mov         dword ptr [eax+1C],edx
 0045E6D5    mov         edx,dword ptr [esp]
 0045E6D8    mov         dword ptr [eax+34],edx
 0045E6DB    mov         edx,dword ptr [eax+2C]
 0045E6DE    mov         dword ptr [esp],edx
 0045E6E1    mov         edx,dword ptr [eax+38]
 0045E6E4    mov         dword ptr [eax+2C],edx
 0045E6E7    mov         edx,dword ptr [esp]
 0045E6EA    mov         dword ptr [eax+38],edx
 0045E6ED    pop         edx
 0045E6EE    ret
end;*}

//0045E6F0
{*procedure sub_0045E6F0(?:?);
begin
 0045E6F0    push        ebx
 0045E6F1    push        esi
 0045E6F2    push        edi
 0045E6F3    push        ecx
 0045E6F4    mov         ebx,eax
 0045E6F6    mov         eax,ebx
 0045E6F8    call        0045E1D4
 0045E6FD    fstp        dword ptr [esp]
 0045E700    wait
 0045E701    fld         dword ptr [esp]
 0045E704    fabs
 0045E706    fcomp       dword ptr ds:[5AD044];9.99994610111476E-41:Single
 0045E70C    fnstsw      al
 0045E70E    sahf
>0045E70F    jae         0045E721
 0045E711    mov         edi,ebx
 0045E713    mov         esi,5ACFB4;gvar_005ACFB4
 0045E718    mov         ecx,10
 0045E71D    rep movs    dword ptr [edi],dword ptr [esi]
>0045E71F    jmp         0045E73F
 0045E721    mov         eax,ebx
 0045E723    call        0045E294
 0045E728    fld         dword ptr ds:[45E744];1:Single
 0045E72E    fdiv        dword ptr [esp]
 0045E731    add         esp,0FFFFFFFC
 0045E734    fstp        dword ptr [esp]
 0045E737    wait
 0045E738    mov         eax,ebx
 0045E73A    call        0045E5E4
 0045E73F    pop         edx
 0045E740    pop         edi
 0045E741    pop         esi
 0045E742    pop         ebx
 0045E743    ret
end;*}

//0045E748
{*procedure sub_0045E748(?:?; ?:?; ?:?);
begin
 0045E748    fld         dword ptr [ecx]
 0045E74A    fld         st(0)
 0045E74C    fmul        dword ptr [eax]
 0045E74E    fstp        dword ptr [edx]
 0045E750    fld         st(0)
 0045E752    fmul        dword ptr [eax+4]
 0045E755    fstp        dword ptr [edx+10]
 0045E758    fmul        dword ptr [eax+8]
 0045E75B    fstp        dword ptr [edx+20]
 0045E75E    fld         dword ptr [ecx]
 0045E760    fld         st(0)
 0045E762    fmul        dword ptr [eax+10]
 0045E765    fstp        dword ptr [edx+4]
 0045E768    fld         st(0)
 0045E76A    fmul        dword ptr [eax+14]
 0045E76D    fstp        dword ptr [edx+14]
 0045E770    fmul        dword ptr [eax+18]
 0045E773    fstp        dword ptr [edx+24]
 0045E776    fld         dword ptr [ecx]
 0045E778    fld         st(0)
 0045E77A    fmul        dword ptr [eax+20]
 0045E77D    fstp        dword ptr [edx+8]
 0045E780    fld         st(0)
 0045E782    fmul        dword ptr [eax+24]
 0045E785    fstp        dword ptr [edx+18]
 0045E788    fmul        dword ptr [eax+28]
 0045E78B    fstp        dword ptr [edx+28]
 0045E78E    ret
end;*}

//0045E790
{*procedure sub_0045E790(?:?; ?:?);
begin
 0045E790    push        ebx
 0045E791    push        esi
 0045E792    push        edi
 0045E793    push        ecx
 0045E794    mov         ebx,edx
 0045E796    mov         esi,eax
 0045E798    mov         eax,esi
 0045E79A    call        0045D44C
 0045E79F    fstp        dword ptr [esp]
 0045E7A2    wait
 0045E7A3    fld         dword ptr [esp]
 0045E7A6    fabs
 0045E7A8    fcomp       dword ptr ds:[5AD044];9.99994610111476E-41:Single
 0045E7AE    fnstsw      al
 0045E7B0    sahf
>0045E7B1    jae         0045E7C6
 0045E7B3    mov         edi,ebx
 0045E7B5    mov         esi,5ACFB4;gvar_005ACFB4
 0045E7BA    mov         ecx,10
 0045E7BF    rep movs    dword ptr [edi],dword ptr [esi]
>0045E7C1    jmp         0045E847
 0045E7C6    fld         dword ptr ds:[45E84C];1:Single
 0045E7CC    fdiv        dword ptr [esp]
 0045E7CF    fstp        dword ptr [esp]
 0045E7D2    wait
 0045E7D3    xor         eax,eax
 0045E7D5    mov         dword ptr [ebx+0C],eax
 0045E7D8    xor         eax,eax
 0045E7DA    mov         dword ptr [ebx+1C],eax
 0045E7DD    xor         eax,eax
 0045E7DF    mov         dword ptr [ebx+2C],eax
 0045E7E2    mov         dword ptr [ebx+3C],3F800000
 0045E7E9    mov         ecx,esp
 0045E7EB    mov         edx,ebx
 0045E7ED    mov         eax,esi
 0045E7EF    call        0045E748
 0045E7F4    fld         dword ptr [ebx]
 0045E7F6    fmul        dword ptr [esi+30]
 0045E7F9    fld         dword ptr [ebx+10]
 0045E7FC    fmul        dword ptr [esi+34]
 0045E7FF    faddp       st(1),st
 0045E801    fld         dword ptr [ebx+20]
 0045E804    fmul        dword ptr [esi+38]
 0045E807    faddp       st(1),st
 0045E809    fchs
 0045E80B    fstp        dword ptr [ebx+30]
 0045E80E    wait
 0045E80F    fld         dword ptr [ebx+4]
 0045E812    fmul        dword ptr [esi+30]
 0045E815    fld         dword ptr [ebx+14]
 0045E818    fmul        dword ptr [esi+34]
 0045E81B    faddp       st(1),st
 0045E81D    fld         dword ptr [ebx+24]
 0045E820    fmul        dword ptr [esi+38]
 0045E823    faddp       st(1),st
 0045E825    fchs
 0045E827    fstp        dword ptr [ebx+34]
 0045E82A    wait
 0045E82B    fld         dword ptr [ebx+8]
 0045E82E    fmul        dword ptr [esi+30]
 0045E831    fld         dword ptr [ebx+18]
 0045E834    fmul        dword ptr [esi+34]
 0045E837    faddp       st(1),st
 0045E839    fld         dword ptr [ebx+28]
 0045E83C    fmul        dword ptr [esi+38]
 0045E83F    faddp       st(1),st
 0045E841    fchs
 0045E843    fstp        dword ptr [ebx+38]
 0045E846    wait
 0045E847    pop         edx
 0045E848    pop         edi
 0045E849    pop         esi
 0045E84A    pop         ebx
 0045E84B    ret
end;*}

//0045E850
{*procedure sub_0045E850(?:?; ?:?);
begin
 0045E850    push        ebx
 0045E851    push        esi
 0045E852    push        edi
 0045E853    add         esp,0FFFFFEE8
 0045E859    mov         esi,edx
 0045E85B    xor         ebx,ebx
 0045E85D    push        esi
 0045E85E    mov         esi,eax
 0045E860    lea         edi,[esp+0C]
 0045E864    mov         ecx,10
 0045E869    rep movs    dword ptr [edi],dword ptr [esi]
 0045E86B    pop         esi
 0045E86C    fld         dword ptr [esp+44]
 0045E870    fcomp       dword ptr ds:[45EC88];0:Single
 0045E876    fnstsw      al
 0045E878    sahf
>0045E879    je          0045EC7B
 0045E87F    mov         edx,4
 0045E884    lea         eax,[esp+8]
 0045E888    mov         dword ptr [esp+4],eax
 0045E88C    mov         ecx,4
 0045E891    mov         eax,dword ptr [esp+4]
 0045E895    fld         dword ptr [eax]
 0045E897    fdiv        dword ptr [esp+44]
 0045E89B    fstp        dword ptr [eax]
 0045E89D    wait
 0045E89E    add         eax,4
 0045E8A1    dec         ecx
>0045E8A2    jne         0045E895
 0045E8A4    add         dword ptr [esp+4],10
 0045E8A9    dec         edx
>0045E8AA    jne         0045E88C
 0045E8AC    push        esi
 0045E8AD    lea         esi,[esp+0C]
 0045E8B1    lea         edi,[esp+4C]
 0045E8B5    mov         ecx,10
 0045E8BA    rep movs    dword ptr [edi],dword ptr [esi]
 0045E8BC    pop         esi
 0045E8BD    mov         edx,3
 0045E8C2    lea         eax,[esp+54]
 0045E8C6    xor         ecx,ecx
 0045E8C8    mov         dword ptr [eax],ecx
 0045E8CA    add         eax,10
 0045E8CD    dec         edx
>0045E8CE    jne         0045E8C6
 0045E8D0    mov         dword ptr [esp+84],3F800000
 0045E8DB    lea         eax,[esp+48]
 0045E8DF    call        0045E1D4
 0045E8E4    fcomp       dword ptr ds:[45EC88];0:Single
 0045E8EA    fnstsw      al
 0045E8EC    sahf
>0045E8ED    je          0045EC7B
 0045E8F3    fld         dword ptr [esp+14]
 0045E8F7    fcomp       dword ptr ds:[45EC88];0:Single
 0045E8FD    fnstsw      al
 0045E8FF    sahf
>0045E900    jne         0045E924
 0045E902    fld         dword ptr [esp+24]
 0045E906    fcomp       dword ptr ds:[45EC88];0:Single
 0045E90C    fnstsw      al
 0045E90E    sahf
>0045E90F    jne         0045E924
 0045E911    fld         dword ptr [esp+34]
 0045E915    fcomp       dword ptr ds:[45EC88];0:Single
 0045E91B    fnstsw      al
 0045E91D    sahf
>0045E91E    je          0045E9DA
 0045E924    mov         eax,dword ptr [esp+14]
 0045E928    mov         dword ptr [esp+0C8],eax
 0045E92F    mov         eax,dword ptr [esp+24]
 0045E933    mov         dword ptr [esp+0CC],eax
 0045E93A    mov         eax,dword ptr [esp+34]
 0045E93E    mov         dword ptr [esp+0D0],eax
 0045E945    mov         eax,dword ptr [esp+44]
 0045E949    mov         dword ptr [esp+0D4],eax
 0045E950    push        esi
 0045E951    lea         esi,[esp+4C]
 0045E955    lea         edi,[esp+8C]
 0045E95C    mov         ecx,10
 0045E961    rep movs    dword ptr [edi],dword ptr [esi]
 0045E963    pop         esi
 0045E964    lea         eax,[esp+88]
 0045E96B    call        0045E6F0
 0045E970    lea         eax,[esp+88]
 0045E977    call        0045E680
 0045E97C    lea         ecx,[esp+0D8]
 0045E983    lea         edx,[esp+88]
 0045E98A    lea         eax,[esp+0C8]
 0045E991    call        0045E03C
 0045E996    mov         eax,dword ptr [esp+0D8]
 0045E99D    mov         dword ptr [esi+30],eax
 0045E9A0    mov         eax,dword ptr [esp+0DC]
 0045E9A7    mov         dword ptr [esi+34],eax
 0045E9AA    mov         eax,dword ptr [esp+0E0]
 0045E9B1    mov         dword ptr [esi+38],eax
 0045E9B4    mov         eax,dword ptr [esp+0E4]
 0045E9BB    mov         dword ptr [esi+3C],eax
 0045E9BE    xor         eax,eax
 0045E9C0    mov         dword ptr [esp+14],eax
 0045E9C4    xor         eax,eax
 0045E9C6    mov         dword ptr [esp+24],eax
 0045E9CA    xor         eax,eax
 0045E9CC    mov         dword ptr [esp+34],eax
 0045E9D0    mov         dword ptr [esp+44],3F800000
>0045E9D8    jmp         0045E9EE
 0045E9DA    xor         eax,eax
 0045E9DC    mov         dword ptr [esi+30],eax
 0045E9DF    xor         eax,eax
 0045E9E1    mov         dword ptr [esi+34],eax
 0045E9E4    xor         eax,eax
 0045E9E6    mov         dword ptr [esi+38],eax
 0045E9E9    xor         eax,eax
 0045E9EB    mov         dword ptr [esi+3C],eax
 0045E9EE    xor         edx,edx
 0045E9F0    lea         eax,[esp+38]
 0045E9F4    mov         ecx,edx
 0045E9F6    add         cl,9
 0045E9F9    and         ecx,7F
 0045E9FC    mov         ebx,dword ptr [eax]
 0045E9FE    mov         dword ptr [esi+ecx*4],ebx
 0045EA01    xor         ecx,ecx
 0045EA03    mov         dword ptr [eax],ecx
 0045EA05    inc         edx
 0045EA06    add         eax,4
 0045EA09    cmp         edx,3
>0045EA0C    jne         0045E9F4
 0045EA0E    lea         edx,[esp+8]
 0045EA12    lea         eax,[esp+0E8]
 0045EA19    call        0045C8F4
 0045EA1E    lea         edx,[esp+18]
 0045EA22    lea         eax,[esp+0F4]
 0045EA29    call        0045C8F4
 0045EA2E    lea         edx,[esp+28]
 0045EA32    lea         eax,[esp+100]
 0045EA39    call        0045C8F4
 0045EA3E    lea         eax,[esp+0E8]
 0045EA45    call        0045D438
 0045EA4A    fstp        dword ptr [esi]
 0045EA4C    wait
 0045EA4D    push        dword ptr [esi]
 0045EA4F    call        0045F640
 0045EA54    add         esp,0FFFFFFFC
 0045EA57    fstp        dword ptr [esp]
 0045EA5A    wait
 0045EA5B    lea         edx,[esp+110]
 0045EA62    lea         eax,[esp+0EC]
 0045EA69    call        0045D824
 0045EA6E    lea         edx,[esp+0F4]
 0045EA75    lea         eax,[esp+0E8]
 0045EA7C    call        0045CE18
 0045EA81    fstp        dword ptr [esi+0C]
 0045EA84    wait
 0045EA85    fld         dword ptr [esi+0C]
 0045EA88    fchs
 0045EA8A    fstp        dword ptr [esp]
 0045EA8D    wait
 0045EA8E    mov         ecx,esp
 0045EA90    lea         edx,[esp+0E8]
 0045EA97    lea         eax,[esp+0F4]
 0045EA9E    call        0045CCF8
 0045EAA3    lea         eax,[esp+0F4]
 0045EAAA    call        0045D438
 0045EAAF    fstp        dword ptr [esi+4]
 0045EAB2    wait
 0045EAB3    push        dword ptr [esi+4]
 0045EAB6    call        0045F640
 0045EABB    add         esp,0FFFFFFFC
 0045EABE    fstp        dword ptr [esp]
 0045EAC1    wait
 0045EAC2    lea         edx,[esp+110]
 0045EAC9    lea         eax,[esp+0F8]
 0045EAD0    call        0045D824
 0045EAD5    fld         dword ptr [esi+0C]
 0045EAD8    fdiv        dword ptr [esi+4]
 0045EADB    fstp        dword ptr [esi+0C]
 0045EADE    wait
 0045EADF    lea         edx,[esp+100]
 0045EAE6    lea         eax,[esp+0E8]
 0045EAED    call        0045CE18
 0045EAF2    fstp        dword ptr [esi+10]
 0045EAF5    wait
 0045EAF6    fld         dword ptr [esi+10]
 0045EAF9    fchs
 0045EAFB    fstp        dword ptr [esp]
 0045EAFE    wait
 0045EAFF    mov         ecx,esp
 0045EB01    lea         edx,[esp+0E8]
 0045EB08    lea         eax,[esp+100]
 0045EB0F    call        0045CCF8
 0045EB14    lea         edx,[esp+100]
 0045EB1B    lea         eax,[esp+0F4]
 0045EB22    call        0045CE18
 0045EB27    fstp        dword ptr [esi+14]
 0045EB2A    wait
 0045EB2B    fld         dword ptr [esi+14]
 0045EB2E    fchs
 0045EB30    fstp        dword ptr [esp]
 0045EB33    wait
 0045EB34    mov         ecx,esp
 0045EB36    lea         edx,[esp+0F4]
 0045EB3D    lea         eax,[esp+100]
 0045EB44    call        0045CCF8
 0045EB49    lea         eax,[esp+100]
 0045EB50    call        0045D438
 0045EB55    fstp        dword ptr [esi+8]
 0045EB58    wait
 0045EB59    push        dword ptr [esi+8]
 0045EB5C    call        0045F640
 0045EB61    add         esp,0FFFFFFFC
 0045EB64    fstp        dword ptr [esp]
 0045EB67    wait
 0045EB68    lea         edx,[esp+110]
 0045EB6F    lea         eax,[esp+104]
 0045EB76    call        0045D824
 0045EB7B    fld         dword ptr [esi+10]
 0045EB7E    fdiv        dword ptr [esi+8]
 0045EB81    fstp        dword ptr [esi+10]
 0045EB84    wait
 0045EB85    fld         dword ptr [esi+14]
 0045EB88    fdiv        dword ptr [esi+8]
 0045EB8B    fstp        dword ptr [esi+14]
 0045EB8E    wait
 0045EB8F    lea         ecx,[esp+10C]
 0045EB96    lea         edx,[esp+100]
 0045EB9D    lea         eax,[esp+0F4]
 0045EBA4    call        0045CEA8
 0045EBA9    lea         edx,[esp+10C]
 0045EBB0    lea         eax,[esp+0E8]
 0045EBB7    call        0045CE18
 0045EBBC    fcomp       dword ptr ds:[45EC88];0:Single
 0045EBC2    fnstsw      al
 0045EBC4    sahf
>0045EBC5    jae         0045EC01
 0045EBC7    xor         edx,edx
 0045EBC9    mov         eax,edx
 0045EBCB    and         eax,7F
 0045EBCE    fld         dword ptr [esi+eax*4]
 0045EBD1    fchs
 0045EBD3    fstp        dword ptr [esi+eax*4]
 0045EBD6    wait
 0045EBD7    inc         edx
 0045EBD8    cmp         edx,3
>0045EBDB    jne         0045EBC9
 0045EBDD    lea         eax,[esp+0E8]
 0045EBE4    call        0045D734
 0045EBE9    lea         eax,[esp+0F4]
 0045EBF0    call        0045D734
 0045EBF5    lea         eax,[esp+100]
 0045EBFC    call        0045D734
 0045EC01    fld         dword ptr [esp+0F0]
 0045EC08    fchs
 0045EC0A    add         esp,0FFFFFFF4
 0045EC0D    fstp        tbyte ptr [esp]
 0045EC10    wait
 0045EC11    call        0045F5D4
 0045EC16    fstp        dword ptr [esi+1C]
 0045EC19    wait
 0045EC1A    fld         dword ptr [esi+1C]
 0045EC1D    call        @COS
 0045EC22    fcomp       dword ptr ds:[45EC88];0:Single
 0045EC28    fnstsw      al
 0045EC2A    sahf
>0045EC2B    je          0045EC5D
 0045EC2D    push        dword ptr [esp+0FC]
 0045EC34    push        dword ptr [esp+10C]
 0045EC3B    call        0045F620
 0045EC40    fstp        dword ptr [esi+18]
 0045EC43    wait
 0045EC44    push        dword ptr [esp+0EC]
 0045EC4B    push        dword ptr [esp+0EC]
 0045EC52    call        0045F620
 0045EC57    fstp        dword ptr [esi+20]
 0045EC5A    wait
>0045EC5B    jmp         0045EC79
 0045EC5D    push        dword ptr [esp+0F4]
 0045EC64    push        dword ptr [esp+0FC]
 0045EC6B    call        0045F620
 0045EC70    fstp        dword ptr [esi+18]
 0045EC73    wait
 0045EC74    xor         eax,eax
 0045EC76    mov         dword ptr [esi+20],eax
 0045EC79    mov         bl,1
 0045EC7B    mov         eax,ebx
 0045EC7D    add         esp,118
 0045EC83    pop         edi
 0045EC84    pop         esi
 0045EC85    pop         ebx
 0045EC86    ret
end;*}

//0045EC8C
{*procedure sub_0045EC8C(?:Integer; ?:Integer; ?:Integer; ?:?);
begin
 0045EC8C    push        ebp
 0045EC8D    mov         ebp,esp
 0045EC8F    add         esp,0FFFFFFE4
 0045EC92    push        ebx
 0045EC93    push        esi
 0045EC94    mov         dword ptr [ebp-4],ecx
 0045EC97    mov         ebx,eax
 0045EC99    mov         esi,dword ptr [ebp+8]
 0045EC9C    lea         ecx,[ebp-10]
 0045EC9F    mov         eax,edx
 0045ECA1    mov         edx,ebx
 0045ECA3    call        0045CBA8
 0045ECA8    lea         ecx,[ebp-1C]
 0045ECAB    mov         edx,ebx
 0045ECAD    mov         eax,dword ptr [ebp-4]
 0045ECB0    call        0045CBA8
 0045ECB5    mov         ecx,esi
 0045ECB7    lea         edx,[ebp-1C]
 0045ECBA    lea         eax,[ebp-10]
 0045ECBD    call        0045CF80
 0045ECC2    mov         eax,esi
 0045ECC4    call        0045D460
 0045ECC9    pop         esi
 0045ECCA    pop         ebx
 0045ECCB    mov         esp,ebp
 0045ECCD    pop         ebp
 0045ECCE    ret         4
end;*}

//0045ECD4
{*procedure sub_0045ECD4(?:?; ?:?; ?:?; ?:?);
begin
 0045ECD4    push        ebp
 0045ECD5    mov         ebp,esp
 0045ECD7    add         esp,0FFFFFFE4
 0045ECDA    push        ebx
 0045ECDB    push        esi
 0045ECDC    mov         dword ptr [ebp-4],ecx
 0045ECDF    mov         ebx,eax
 0045ECE1    mov         esi,dword ptr [ebp+8]
 0045ECE4    lea         ecx,[ebp-10]
 0045ECE7    mov         eax,edx
 0045ECE9    mov         edx,ebx
 0045ECEB    call        0045CBA8
 0045ECF0    lea         ecx,[ebp-1C]
 0045ECF3    mov         edx,ebx
 0045ECF5    mov         eax,dword ptr [ebp-4]
 0045ECF8    call        0045CBA8
 0045ECFD    mov         ecx,esi
 0045ECFF    lea         edx,[ebp-1C]
 0045ED02    lea         eax,[ebp-10]
 0045ED05    call        0045CF80
 0045ED0A    mov         eax,esi
 0045ED0C    call        0045D460
 0045ED11    pop         esi
 0045ED12    pop         ebx
 0045ED13    mov         esp,ebp
 0045ED15    pop         ebp
 0045ED16    ret         4
end;*}

//0045ED1C
{*procedure sub_0045ED1C(?:?);
begin
 0045ED1C    push        ebx
 0045ED1D    push        ecx
 0045ED1E    mov         ebx,eax
 0045ED20    fld         dword ptr [ebx]
 0045ED22    fmul        dword ptr [ebx]
 0045ED24    fld         dword ptr [ebx+4]
 0045ED27    fmul        dword ptr [ebx+4]
 0045ED2A    faddp       st(1),st
 0045ED2C    fld         dword ptr [ebx+8]
 0045ED2F    fmul        dword ptr [ebx+8]
 0045ED32    faddp       st(1),st
 0045ED34    add         esp,0FFFFFFFC
 0045ED37    fstp        dword ptr [esp]
 0045ED3A    wait
 0045ED3B    call        0045F640
 0045ED40    fstp        dword ptr [esp]
 0045ED43    wait
 0045ED44    push        dword ptr [esp]
 0045ED47    mov         eax,ebx
 0045ED49    call        0045D78C
 0045ED4E    pop         edx
 0045ED4F    pop         ebx
 0045ED50    ret
end;*}

//0045ED54
{*procedure sub_0045ED54(?:?; ?:?);
begin
 0045ED54    fld         dword ptr [eax]
 0045ED56    fmul        dword ptr [edx]
 0045ED58    fld         dword ptr [eax+4]
 0045ED5B    fmul        dword ptr [edx+4]
 0045ED5E    faddp       st(1),st
 0045ED60    fld         dword ptr [eax+8]
 0045ED63    fmul        dword ptr [edx+8]
 0045ED66    faddp       st(1),st
 0045ED68    fld         dword ptr [eax+0C]
 0045ED6B    faddp       st(1),st
 0045ED6D    ret
end;*}

//0045ED70
{*function sub_0045ED70(?:?):?;
begin
 0045ED70    push        ebx
 0045ED71    add         esp,0FFFFFFF8
 0045ED74    mov         ebx,eax
 0045ED76    mov         eax,ebx
 0045ED78    call        0045D438
 0045ED7D    fstp        dword ptr [esp+4]
 0045ED81    wait
 0045ED82    fld         dword ptr [ebx+0C]
 0045ED85    fmul        st,st(0)
 0045ED87    fadd        dword ptr [esp+4]
 0045ED8B    fsqrt
 0045ED8D    fstp        dword ptr [esp]
 0045ED90    wait
 0045ED91    fld         dword ptr [esp]
 0045ED94    pop         ecx
 0045ED95    pop         edx
 0045ED96    pop         ebx
 0045ED97    ret
end;*}

//0045ED98
{*procedure sub_0045ED98(?:?);
begin
 0045ED98    push        ebx
 0045ED99    push        esi
 0045ED9A    push        edi
 0045ED9B    add         esp,0FFFFFFF8
 0045ED9E    mov         ebx,eax
 0045EDA0    mov         eax,ebx
 0045EDA2    call        0045ED70
 0045EDA7    fstp        dword ptr [esp]
 0045EDAA    wait
 0045EDAB    fld         dword ptr [esp]
 0045EDAE    fcomp       dword ptr ds:[5AD048];1.00000000317108E-30:Single
 0045EDB4    fnstsw      al
 0045EDB6    sahf
>0045EDB7    jbe         0045EDDF
 0045EDB9    fld         dword ptr ds:[45EDF0];1:Single
 0045EDBF    fdiv        dword ptr [esp]
 0045EDC2    fstp        dword ptr [esp+4]
 0045EDC6    wait
 0045EDC7    push        dword ptr [esp+4]
 0045EDCB    mov         eax,ebx
 0045EDCD    call        0045D76C
 0045EDD2    fld         dword ptr [ebx+0C]
 0045EDD5    fmul        dword ptr [esp+4]
 0045EDD9    fstp        dword ptr [ebx+0C]
 0045EDDC    wait
>0045EDDD    jmp         0045EDEA
 0045EDDF    mov         edi,ebx
 0045EDE1    mov         esi,5AD034;gvar_005AD034
 0045EDE6    movs        dword ptr [edi],dword ptr [esi]
 0045EDE7    movs        dword ptr [edi],dword ptr [esi]
 0045EDE8    movs        dword ptr [edi],dword ptr [esi]
 0045EDE9    movs        dword ptr [edi],dword ptr [esi]
 0045EDEA    pop         ecx
 0045EDEB    pop         edx
 0045EDEC    pop         edi
 0045EDED    pop         esi
 0045EDEE    pop         ebx
 0045EDEF    ret
end;*}

//0045EDF4
{*procedure sub_0045EDF4(?:?; ?:?; ?:?);
begin
 0045EDF4    push        ebx
 0045EDF5    push        esi
 0045EDF6    push        edi
 0045EDF7    add         esp,0FFFFFFF0
 0045EDFA    mov         ebx,ecx
 0045EDFC    fld         dword ptr [eax+0C]
 0045EDFF    fmul        dword ptr [edx+0C]
 0045EE02    fld         dword ptr [eax]
 0045EE04    fmul        dword ptr [edx]
 0045EE06    fsubp       st(1),st
 0045EE08    fld         dword ptr [eax+4]
 0045EE0B    fmul        dword ptr [edx+4]
 0045EE0E    fsubp       st(1),st
 0045EE10    fld         dword ptr [eax+8]
 0045EE13    fmul        dword ptr [edx+8]
 0045EE16    fsubp       st(1),st
 0045EE18    fstp        dword ptr [esp+0C]
 0045EE1C    wait
 0045EE1D    fld         dword ptr [eax+0C]
 0045EE20    fmul        dword ptr [edx]
 0045EE22    fld         dword ptr [eax]
 0045EE24    fmul        dword ptr [edx+0C]
 0045EE27    faddp       st(1),st
 0045EE29    fld         dword ptr [eax+4]
 0045EE2C    fmul        dword ptr [edx+8]
 0045EE2F    faddp       st(1),st
 0045EE31    fld         dword ptr [eax+8]
 0045EE34    fmul        dword ptr [edx+4]
 0045EE37    fsubp       st(1),st
 0045EE39    fstp        dword ptr [esp]
 0045EE3C    wait
 0045EE3D    fld         dword ptr [eax+0C]
 0045EE40    fmul        dword ptr [edx+4]
 0045EE43    fld         dword ptr [eax+4]
 0045EE46    fmul        dword ptr [edx+0C]
 0045EE49    faddp       st(1),st
 0045EE4B    fld         dword ptr [eax+8]
 0045EE4E    fmul        dword ptr [edx]
 0045EE50    faddp       st(1),st
 0045EE52    fld         dword ptr [eax]
 0045EE54    fmul        dword ptr [edx+8]
 0045EE57    fsubp       st(1),st
 0045EE59    fstp        dword ptr [esp+4]
 0045EE5D    wait
 0045EE5E    fld         dword ptr [eax+0C]
 0045EE61    fmul        dword ptr [edx+8]
 0045EE64    fld         dword ptr [eax+8]
 0045EE67    fmul        dword ptr [edx+0C]
 0045EE6A    faddp       st(1),st
 0045EE6C    fld         dword ptr [eax]
 0045EE6E    fmul        dword ptr [edx+4]
 0045EE71    faddp       st(1),st
 0045EE73    fld         dword ptr [eax+4]
 0045EE76    fmul        dword ptr [edx]
 0045EE78    fsubp       st(1),st
 0045EE7A    fstp        dword ptr [esp+8]
 0045EE7E    wait
 0045EE7F    mov         edi,ebx
 0045EE81    mov         esi,esp
 0045EE83    movs        dword ptr [edi],dword ptr [esi]
 0045EE84    movs        dword ptr [edi],dword ptr [esi]
 0045EE85    movs        dword ptr [edi],dword ptr [esi]
 0045EE86    movs        dword ptr [edi],dword ptr [esi]
 0045EE87    add         esp,10
 0045EE8A    pop         edi
 0045EE8B    pop         esi
 0045EE8C    pop         ebx
 0045EE8D    ret
end;*}

//0045EE90
{*procedure sub_0045EE90(?:?; ?:?);
begin
 0045EE90    push        ebx
 0045EE91    push        esi
 0045EE92    push        edi
 0045EE93    add         esp,0FFFFFFBC
 0045EE96    mov         esi,eax
 0045EE98    lea         edi,[esp+34]
 0045EE9C    movs        dword ptr [edi],dword ptr [esi]
 0045EE9D    movs        dword ptr [edi],dword ptr [esi]
 0045EE9E    movs        dword ptr [edi],dword ptr [esi]
 0045EE9F    movs        dword ptr [edi],dword ptr [esi]
 0045EEA0    mov         ebx,edx
 0045EEA2    lea         eax,[esp+34]
 0045EEA6    call        0045ED98
 0045EEAB    mov         eax,dword ptr [esp+40]
 0045EEAF    mov         dword ptr [esp],eax
 0045EEB2    mov         eax,dword ptr [esp+34]
 0045EEB6    mov         dword ptr [esp+4],eax
 0045EEBA    mov         eax,dword ptr [esp+38]
 0045EEBE    mov         dword ptr [esp+8],eax
 0045EEC2    mov         eax,dword ptr [esp+3C]
 0045EEC6    mov         dword ptr [esp+0C],eax
 0045EECA    fld         dword ptr [esp+4]
 0045EECE    fmul        dword ptr [esp+4]
 0045EED2    fstp        dword ptr [esp+10]
 0045EED6    wait
 0045EED7    fld         dword ptr [esp+4]
 0045EEDB    fmul        dword ptr [esp+8]
 0045EEDF    fstp        dword ptr [esp+14]
 0045EEE3    wait
 0045EEE4    fld         dword ptr [esp+4]
 0045EEE8    fmul        dword ptr [esp+0C]
 0045EEEC    fstp        dword ptr [esp+18]
 0045EEF0    wait
 0045EEF1    fld         dword ptr [esp+4]
 0045EEF5    fmul        dword ptr [esp]
 0045EEF8    fstp        dword ptr [esp+1C]
 0045EEFC    wait
 0045EEFD    fld         dword ptr [esp+8]
 0045EF01    fmul        dword ptr [esp+8]
 0045EF05    fstp        dword ptr [esp+20]
 0045EF09    wait
 0045EF0A    fld         dword ptr [esp+8]
 0045EF0E    fmul        dword ptr [esp+0C]
 0045EF12    fstp        dword ptr [esp+24]
 0045EF16    wait
 0045EF17    fld         dword ptr [esp+8]
 0045EF1B    fmul        dword ptr [esp]
 0045EF1E    fstp        dword ptr [esp+28]
 0045EF22    wait
 0045EF23    fld         dword ptr [esp+0C]
 0045EF27    fmul        dword ptr [esp+0C]
 0045EF2B    fstp        dword ptr [esp+2C]
 0045EF2F    wait
 0045EF30    fld         dword ptr [esp+0C]
 0045EF34    fmul        dword ptr [esp]
 0045EF37    fstp        dword ptr [esp+30]
 0045EF3B    wait
 0045EF3C    fld         dword ptr [esp+20]
 0045EF40    fadd        dword ptr [esp+2C]
 0045EF44    fmul        dword ptr ds:[45F01C];2:Single
 0045EF4A    fsubr       dword ptr ds:[45F020];1:Single
 0045EF50    fstp        dword ptr [ebx]
 0045EF52    wait
 0045EF53    fld         dword ptr [esp+14]
 0045EF57    fsub        dword ptr [esp+30]
 0045EF5B    fmul        dword ptr ds:[45F01C];2:Single
 0045EF61    fstp        dword ptr [ebx+10]
 0045EF64    wait
 0045EF65    fld         dword ptr [esp+18]
 0045EF69    fadd        dword ptr [esp+28]
 0045EF6D    fmul        dword ptr ds:[45F01C];2:Single
 0045EF73    fstp        dword ptr [ebx+20]
 0045EF76    wait
 0045EF77    xor         eax,eax
 0045EF79    mov         dword ptr [ebx+30],eax
 0045EF7C    fld         dword ptr [esp+14]
 0045EF80    fadd        dword ptr [esp+30]
 0045EF84    fmul        dword ptr ds:[45F01C];2:Single
 0045EF8A    fstp        dword ptr [ebx+4]
 0045EF8D    wait
 0045EF8E    fld         dword ptr [esp+10]
 0045EF92    fadd        dword ptr [esp+2C]
 0045EF96    fmul        dword ptr ds:[45F01C];2:Single
 0045EF9C    fsubr       dword ptr ds:[45F020];1:Single
 0045EFA2    fstp        dword ptr [ebx+14]
 0045EFA5    wait
 0045EFA6    fld         dword ptr [esp+24]
 0045EFAA    fsub        dword ptr [esp+1C]
 0045EFAE    fmul        dword ptr ds:[45F01C];2:Single
 0045EFB4    fstp        dword ptr [ebx+24]
 0045EFB7    wait
 0045EFB8    xor         eax,eax
 0045EFBA    mov         dword ptr [ebx+34],eax
 0045EFBD    fld         dword ptr [esp+18]
 0045EFC1    fsub        dword ptr [esp+28]
 0045EFC5    fmul        dword ptr ds:[45F01C];2:Single
 0045EFCB    fstp        dword ptr [ebx+8]
 0045EFCE    wait
 0045EFCF    fld         dword ptr [esp+24]
 0045EFD3    fadd        dword ptr [esp+1C]
 0045EFD7    fmul        dword ptr ds:[45F01C];2:Single
 0045EFDD    fstp        dword ptr [ebx+18]
 0045EFE0    wait
 0045EFE1    fld         dword ptr [esp+10]
 0045EFE5    fadd        dword ptr [esp+20]
 0045EFE9    fmul        dword ptr ds:[45F01C];2:Single
 0045EFEF    fsubr       dword ptr ds:[45F020];1:Single
 0045EFF5    fstp        dword ptr [ebx+28]
 0045EFF8    wait
 0045EFF9    xor         eax,eax
 0045EFFB    mov         dword ptr [ebx+38],eax
 0045EFFE    xor         eax,eax
 0045F000    mov         dword ptr [ebx+0C],eax
 0045F003    xor         eax,eax
 0045F005    mov         dword ptr [ebx+1C],eax
 0045F008    xor         eax,eax
 0045F00A    mov         dword ptr [ebx+2C],eax
 0045F00D    mov         dword ptr [ebx+3C],3F800000
 0045F014    add         esp,44
 0045F017    pop         edi
 0045F018    pop         esi
 0045F019    pop         ebx
 0045F01A    ret
end;*}

//0045F024
{*procedure sub_0045F024(?:?; ?:?; ?:?);
begin
 0045F024    push        ebp
 0045F025    mov         ebp,esp
 0045F027    add         esp,0FFFFFFF4
 0045F02A    push        ebx
 0045F02B    push        esi
 0045F02C    mov         esi,edx
 0045F02E    mov         ebx,eax
 0045F030    fld         dword ptr [ebp+8]
 0045F033    fmul        dword ptr ds:[5AD070];0.5:Single
 0045F039    add         esp,0FFFFFFF4
 0045F03C    fstp        tbyte ptr [esp]
 0045F03F    wait
 0045F040    call        0045F480
 0045F045    add         esp,0FFFFFFFC
 0045F048    fstp        dword ptr [esp]
 0045F04B    wait
 0045F04C    lea         edx,[ebp-0C]
 0045F04F    lea         eax,[ebp-8]
 0045F052    call        0045F570
 0045F057    mov         eax,dword ptr [ebp-0C]
 0045F05A    mov         dword ptr [esi+0C],eax
 0045F05D    mov         eax,ebx
 0045F05F    call        0045D408
 0045F064    fdivr       dword ptr [ebp-8]
 0045F067    fstp        dword ptr [ebp-4]
 0045F06A    wait
 0045F06B    fld         dword ptr [ebx]
 0045F06D    fmul        dword ptr [ebp-4]
 0045F070    fstp        dword ptr [esi]
 0045F072    wait
 0045F073    fld         dword ptr [ebx+4]
 0045F076    fmul        dword ptr [ebp-4]
 0045F079    fstp        dword ptr [esi+4]
 0045F07C    wait
 0045F07D    fld         dword ptr [ebx+8]
 0045F080    fmul        dword ptr [ebp-4]
 0045F083    fstp        dword ptr [esi+8]
 0045F086    wait
 0045F087    pop         esi
 0045F088    pop         ebx
 0045F089    mov         esp,ebp
 0045F08B    pop         ebp
 0045F08C    ret         4
end;*}

//0045F090
{*procedure sub_0045F090(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0045F090    push        ebp
 0045F091    mov         ebp,esp
 0045F093    add         esp,0FFFFFFC0
 0045F096    push        ebx
 0045F097    push        esi
 0045F098    push        edi
 0045F099    mov         esi,edx
 0045F09B    mov         ebx,eax
 0045F09D    push        dword ptr [ebp+10]
 0045F0A0    lea         edx,[ebp-40]
 0045F0A3    mov         eax,5ACEE8;gvar_005ACEE8
 0045F0A8    call        0045F024
 0045F0AD    xor         eax,eax
 0045F0AF    mov         al,bl
 0045F0B1    lea         edi,[eax+eax*2]
 0045F0B4    xor         eax,eax
 0045F0B6    mov         al,byte ptr [edi+5AD074]
 0045F0BC    add         eax,eax
 0045F0BE    push        esi
 0045F0BF    push        edi
 0045F0C0    lea         esi,[ebp-40]
 0045F0C3    lea         edi,[ebp+eax*8-40]
 0045F0C7    movs        dword ptr [edi],dword ptr [esi]
 0045F0C8    movs        dword ptr [edi],dword ptr [esi]
 0045F0C9    movs        dword ptr [edi],dword ptr [esi]
 0045F0CA    movs        dword ptr [edi],dword ptr [esi]
 0045F0CB    pop         edi
 0045F0CC    pop         esi
 0045F0CD    push        dword ptr [ebp+0C]
 0045F0D0    lea         edx,[ebp-40]
 0045F0D3    mov         eax,5ACEF4;gvar_005ACEF4
 0045F0D8    call        0045F024
 0045F0DD    xor         eax,eax
 0045F0DF    mov         al,byte ptr [edi+5AD075]
 0045F0E5    add         eax,eax
 0045F0E7    push        esi
 0045F0E8    push        edi
 0045F0E9    lea         esi,[ebp-40]
 0045F0EC    lea         edi,[ebp+eax*8-40]
 0045F0F0    movs        dword ptr [edi],dword ptr [esi]
 0045F0F1    movs        dword ptr [edi],dword ptr [esi]
 0045F0F2    movs        dword ptr [edi],dword ptr [esi]
 0045F0F3    movs        dword ptr [edi],dword ptr [esi]
 0045F0F4    pop         edi
 0045F0F5    pop         esi
 0045F0F6    push        dword ptr [ebp+8]
 0045F0F9    lea         edx,[ebp-40]
 0045F0FC    mov         eax,5ACF00;gvar_005ACF00
 0045F101    call        0045F024
 0045F106    xor         eax,eax
 0045F108    mov         al,byte ptr [edi+5AD076]
 0045F10E    add         eax,eax
 0045F110    push        esi
 0045F111    lea         esi,[ebp-40]
 0045F114    lea         edi,[ebp+eax*8-40]
 0045F118    movs        dword ptr [edi],dword ptr [esi]
 0045F119    movs        dword ptr [edi],dword ptr [esi]
 0045F11A    movs        dword ptr [edi],dword ptr [esi]
 0045F11B    movs        dword ptr [edi],dword ptr [esi]
 0045F11C    pop         esi
 0045F11D    mov         ecx,esi
 0045F11F    lea         edx,[ebp-10]
 0045F122    lea         eax,[ebp-20]
 0045F125    call        0045EDF4
 0045F12A    lea         ecx,[ebp-40]
 0045F12D    mov         edx,esi
 0045F12F    lea         eax,[ebp-30]
 0045F132    call        0045EDF4
 0045F137    mov         edi,esi
 0045F139    lea         esi,[ebp-40]
 0045F13C    movs        dword ptr [edi],dword ptr [esi]
 0045F13D    movs        dword ptr [edi],dword ptr [esi]
 0045F13E    movs        dword ptr [edi],dword ptr [esi]
 0045F13F    movs        dword ptr [edi],dword ptr [esi]
 0045F140    pop         edi
 0045F141    pop         esi
 0045F142    pop         ebx
 0045F143    mov         esp,ebp
 0045F145    pop         ebp
 0045F146    ret         0C
end;*}

//0045F14C
{*procedure sub_0045F14C(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0045F14C    push        ebp
 0045F14D    mov         ebp,esp
 0045F14F    add         esp,0FFFFFFE0
 0045F152    push        ebx
 0045F153    push        esi
 0045F154    mov         esi,edx
 0045F156    mov         ebx,eax
 0045F158    push        dword ptr [ebp+10]
 0045F15B    call        0045F4F8
 0045F160    fstp        st(0)
 0045F162    push        dword ptr [ebp+0C]
 0045F165    call        0045F4F8
 0045F16A    fstp        st(0)
 0045F16C    push        dword ptr [ebp+8]
 0045F16F    call        0045F4F8
 0045F174    fstp        st(0)
 0045F176    xor         eax,eax
 0045F178    mov         al,bl
 0045F17A    cmp         eax,5
>0045F17D    ja          0045F1EF
 0045F17F    jmp         dword ptr [eax*4+45F186]
 0045F17F    dd          0045F19E
 0045F17F    dd          0045F1D4
 0045F17F    dd          0045F1B9
 0045F17F    dd          0045F1D4
 0045F17F    dd          0045F1B9
 0045F17F    dd          0045F19E
 0045F19E    fld         dword ptr [ebp+0C]
 0045F1A1    fabs
 0045F1A3    fsub        dword ptr ds:[45F35C];90:Single
 0045F1A9    fabs
 0045F1AB    fcomp       dword ptr ds:[5AD048];1.00000000317108E-30:Single
 0045F1B1    fnstsw      al
 0045F1B3    sahf
 0045F1B4    setbe       al
>0045F1B7    jmp         0045F205
 0045F1B9    fld         dword ptr [ebp+10]
 0045F1BC    fabs
 0045F1BE    fsub        dword ptr ds:[45F35C];90:Single
 0045F1C4    fabs
 0045F1C6    fcomp       dword ptr ds:[5AD048];1.00000000317108E-30:Single
 0045F1CC    fnstsw      al
 0045F1CE    sahf
 0045F1CF    setbe       al
>0045F1D2    jmp         0045F205
 0045F1D4    fld         dword ptr [ebp+8]
 0045F1D7    fabs
 0045F1D9    fsub        dword ptr ds:[45F35C];90:Single
 0045F1DF    fabs
 0045F1E1    fcomp       dword ptr ds:[5AD048];1.00000000317108E-30:Single
 0045F1E7    fnstsw      al
 0045F1E9    sahf
 0045F1EA    setbe       al
>0045F1ED    jmp         0045F205
 0045F1EF    mov         ecx,18AD
 0045F1F4    mov         edx,45F368;'C:\GLScene\glscene_v_1000714\Source\base\VectorGeometry.pas'
 0045F1F9    mov         eax,45F3AC;'Assertion failure'
 0045F1FE    call        @Assert
 0045F203    xor         eax,eax
 0045F205    test        al,al
>0045F207    je          0045F341
 0045F20D    xor         eax,eax
 0045F20F    mov         al,bl
 0045F211    cmp         eax,5
>0045F214    ja          0045F29D
 0045F21A    jmp         dword ptr [eax*4+45F221]
 0045F21A    dd          0045F239
 0045F21A    dd          0045F27D
 0045F21A    dd          0045F25B
 0045F21A    dd          0045F27D
 0045F21A    dd          0045F25B
 0045F21A    dd          0045F239
 0045F239    push        dword ptr [ebp+10]
 0045F23C    fld         tbyte ptr ds:[45F3C0];0.001:Extended
 0045F242    fsubr       dword ptr [ebp+0C]
 0045F245    add         esp,0FFFFFFFC
 0045F248    fstp        dword ptr [esp]
 0045F24B    wait
 0045F24C    push        dword ptr [ebp+8]
 0045F24F    lea         edx,[ebp-10]
 0045F252    mov         eax,ebx
 0045F254    call        0045F090
>0045F259    jmp         0045F29D
 0045F25B    fld         tbyte ptr ds:[45F3C0];0.001:Extended
 0045F261    fsubr       dword ptr [ebp+10]
 0045F264    add         esp,0FFFFFFFC
 0045F267    fstp        dword ptr [esp]
 0045F26A    wait
 0045F26B    push        dword ptr [ebp+0C]
 0045F26E    push        dword ptr [ebp+8]
 0045F271    lea         edx,[ebp-10]
 0045F274    mov         eax,ebx
 0045F276    call        0045F090
>0045F27B    jmp         0045F29D
 0045F27D    push        dword ptr [ebp+10]
 0045F280    push        dword ptr [ebp+0C]
 0045F283    fld         tbyte ptr ds:[45F3C0];0.001:Extended
 0045F289    fsubr       dword ptr [ebp+8]
 0045F28C    add         esp,0FFFFFFFC
 0045F28F    fstp        dword ptr [esp]
 0045F292    wait
 0045F293    lea         edx,[ebp-10]
 0045F296    mov         eax,ebx
 0045F298    call        0045F090
 0045F29D    xor         eax,eax
 0045F29F    mov         al,bl
 0045F2A1    cmp         eax,5
>0045F2A4    ja          0045F32D
 0045F2AA    jmp         dword ptr [eax*4+45F2B1]
 0045F2AA    dd          0045F2C9
 0045F2AA    dd          0045F30D
 0045F2AA    dd          0045F2EB
 0045F2AA    dd          0045F30D
 0045F2AA    dd          0045F2EB
 0045F2AA    dd          0045F2C9
 0045F2C9    push        dword ptr [ebp+10]
 0045F2CC    fld         tbyte ptr ds:[45F3C0];0.001:Extended
 0045F2D2    fadd        dword ptr [ebp+0C]
 0045F2D5    add         esp,0FFFFFFFC
 0045F2D8    fstp        dword ptr [esp]
 0045F2DB    wait
 0045F2DC    push        dword ptr [ebp+8]
 0045F2DF    lea         edx,[ebp-20]
 0045F2E2    mov         eax,ebx
 0045F2E4    call        0045F090
>0045F2E9    jmp         0045F32D
 0045F2EB    fld         tbyte ptr ds:[45F3C0];0.001:Extended
 0045F2F1    fadd        dword ptr [ebp+10]
 0045F2F4    add         esp,0FFFFFFFC
 0045F2F7    fstp        dword ptr [esp]
 0045F2FA    wait
 0045F2FB    push        dword ptr [ebp+0C]
 0045F2FE    push        dword ptr [ebp+8]
 0045F301    lea         edx,[ebp-20]
 0045F304    mov         eax,ebx
 0045F306    call        0045F090
>0045F30B    jmp         0045F32D
 0045F30D    push        dword ptr [ebp+10]
 0045F310    push        dword ptr [ebp+0C]
 0045F313    fld         tbyte ptr ds:[45F3C0];0.001:Extended
 0045F319    fadd        dword ptr [ebp+8]
 0045F31C    add         esp,0FFFFFFFC
 0045F31F    fstp        dword ptr [esp]
 0045F322    wait
 0045F323    lea         edx,[ebp-20]
 0045F326    mov         eax,ebx
 0045F328    call        0045F090
 0045F32D    push        3F000000
 0045F332    mov         ecx,esi
 0045F334    lea         edx,[ebp-20]
 0045F337    lea         eax,[ebp-10]
 0045F33A    call        0045F7F0
>0045F33F    jmp         0045F353
 0045F341    push        dword ptr [ebp+10]
 0045F344    push        dword ptr [ebp+0C]
 0045F347    push        dword ptr [ebp+8]
 0045F34A    mov         edx,esi
 0045F34C    mov         eax,ebx
 0045F34E    call        0045F090
 0045F353    pop         esi
 0045F354    pop         ebx
 0045F355    mov         esp,ebp
 0045F357    pop         ebp
 0045F358    ret         0C
end;*}

//0045F3CC
{*procedure sub_0045F3CC(?:?; ?:?);
begin
 0045F3CC    push        ebp
 0045F3CD    mov         ebp,esp
 0045F3CF    push        ecx
 0045F3D0    fld         dword ptr [ebp+8]
 0045F3D3    fcomp       dword ptr ds:[5AD068];gvar_005AD068:Single
 0045F3D9    fnstsw      al
 0045F3DB    sahf
>0045F3DC    jne         0045F3E8
 0045F3DE    mov         eax,[005AD06C];0x3F800000 gvar_005AD06C:Single
 0045F3E3    mov         dword ptr [ebp-4],eax
>0045F3E6    jmp         0045F449
 0045F3E8    fld         dword ptr [ebp+0C]
 0045F3EB    fcomp       dword ptr ds:[5AD068];gvar_005AD068:Single
 0045F3F1    fnstsw      al
 0045F3F3    sahf
>0045F3F4    jne         0045F40E
 0045F3F6    fld         dword ptr [ebp+8]
 0045F3F9    fcomp       dword ptr ds:[5AD068];gvar_005AD068:Single
 0045F3FF    fnstsw      al
 0045F401    sahf
>0045F402    jbe         0045F40E
 0045F404    mov         eax,[005AD068];0x0 gvar_005AD068:Single
 0045F409    mov         dword ptr [ebp-4],eax
>0045F40C    jmp         0045F449
 0045F40E    push        dword ptr [ebp+8]
 0045F411    call        0045F67C
 0045F416    fcomp       dword ptr [ebp+8]
 0045F419    fnstsw      al
 0045F41B    sahf
>0045F41C    jne         0045F434
 0045F41E    push        dword ptr [ebp+0C]
 0045F421    push        dword ptr [ebp+8]
 0045F424    call        0045F6EC
 0045F429    call        0045F454
 0045F42E    fstp        dword ptr [ebp-4]
 0045F431    wait
>0045F432    jmp         0045F449
 0045F434    fld         dword ptr [ebp+0C]
 0045F437    fldln2
 0045F439    fxch        st(1)
 0045F43B    fyl2x
 0045F43D    fmul        dword ptr [ebp+8]
 0045F440    call        @EXP
 0045F445    fstp        dword ptr [ebp-4]
 0045F448    wait
 0045F449    fld         dword ptr [ebp-4]
 0045F44C    pop         ecx
 0045F44D    pop         ebp
 0045F44E    ret         8
end;*}

//0045F454
{*function sub_0045F454(?:?; ?:?):?;
begin
 0045F454    push        ebp
 0045F455    mov         ebp,esp
 0045F457    mov         ecx,eax
 0045F459    cdq
 0045F45A    fld1
 0045F45C    xor         eax,edx
 0045F45E    sub         eax,edx
>0045F460    je          0045F47C
 0045F462    fld         dword ptr [ebp+8]
>0045F465    jmp         0045F469
 0045F467    fmul        st,st(0)
 0045F469    shr         eax,1
>0045F46B    jae         0045F467
 0045F46D    fmul        st(1),st
>0045F46F    jne         0045F467
 0045F471    fstp        st(0)
 0045F473    cmp         ecx,0
>0045F476    jge         0045F47C
 0045F478    fld1
 0045F47A    fdivrp      st(1),st
 0045F47C    pop         ebp
 0045F47D    ret         4
end;*}

//0045F480
{*function sub_0045F480(?:Extended):?;
begin
 0045F480    push        ebp
 0045F481    mov         ebp,esp
 0045F483    add         esp,0FFFFFFF0
 0045F486    fld         tbyte ptr [ebp+8]
 0045F489    fld         tbyte ptr ds:[45F4A0];0.0174532925199433:Extended
 0045F48F    fmulp       st(1),st
 0045F491    fstp        tbyte ptr [ebp-10]
 0045F494    wait
 0045F495    fld         tbyte ptr [ebp-10]
 0045F498    mov         esp,ebp
 0045F49A    pop         ebp
 0045F49B    ret         0C
end;*}

//0045F4AC
{*function sub_0045F4AC(?:?):?;
begin
 0045F4AC    push        ebp
 0045F4AD    mov         ebp,esp
 0045F4AF    fld         dword ptr [ebp+8]
 0045F4B2    fmul        dword ptr ds:[5AD04C];0.0174532923847437:Single
 0045F4B8    pop         ebp
 0045F4B9    ret         4
end;*}

//0045F4BC
{*function sub_0045F4BC(?:Extended):?;
begin
 0045F4BC    push        ebp
 0045F4BD    mov         ebp,esp
 0045F4BF    add         esp,0FFFFFFF0
 0045F4C2    fld         tbyte ptr [ebp+8]
 0045F4C5    fld         tbyte ptr ds:[45F4DC];57.2957795130823:Extended
 0045F4CB    fmulp       st(1),st
 0045F4CD    fstp        tbyte ptr [ebp-10]
 0045F4D0    wait
 0045F4D1    fld         tbyte ptr [ebp-10]
 0045F4D4    mov         esp,ebp
 0045F4D6    pop         ebp
 0045F4D7    ret         0C
end;*}

//0045F4E8
{*procedure sub_0045F4E8(?:?);
begin
 0045F4E8    push        ebp
 0045F4E9    mov         ebp,esp
 0045F4EB    fld         dword ptr [ebp+8]
 0045F4EE    fmul        dword ptr ds:[5AD050];57.2957801818848:Single
 0045F4F4    pop         ebp
 0045F4F5    ret         4
end;*}

//0045F4F8
{*function sub_0045F4F8(?:?):?;
begin
 0045F4F8    push        ebp
 0045F4F9    mov         ebp,esp
 0045F4FB    push        ecx
 0045F4FC    fld         dword ptr [ebp+8]
 0045F4FF    fmul        dword ptr ds:[5AD054];0.00277777784503996:Single
 0045F505    add         esp,0FFFFFFF4
 0045F508    fstp        tbyte ptr [esp]
 0045F50B    wait
 0045F50C    call        0045F6A8
 0045F511    fmul        dword ptr ds:[5AD05C];360:Single
 0045F517    fsubr       dword ptr [ebp+8]
 0045F51A    fstp        dword ptr [ebp-4]
 0045F51D    wait
 0045F51E    fld         dword ptr [ebp-4]
 0045F521    fcomp       dword ptr ds:[5AD058];180:Single
 0045F527    fnstsw      al
 0045F529    sahf
>0045F52A    jbe         0045F53B
 0045F52C    fld         dword ptr [ebp-4]
 0045F52F    fsub        dword ptr ds:[5AD05C];360:Single
 0045F535    fstp        dword ptr [ebp-4]
 0045F538    wait
>0045F539    jmp         0045F558
 0045F53B    fld         dword ptr ds:[5AD058];180:Single
 0045F541    fchs
 0045F543    fcomp       dword ptr [ebp-4]
 0045F546    fnstsw      al
 0045F548    sahf
>0045F549    jbe         0045F558
 0045F54B    fld         dword ptr [ebp-4]
 0045F54E    fadd        dword ptr ds:[5AD05C];360:Single
 0045F554    fstp        dword ptr [ebp-4]
 0045F557    wait
 0045F558    fld         dword ptr [ebp-4]
 0045F55B    pop         ecx
 0045F55C    pop         ebp
 0045F55D    ret         4
end;*}

//0045F560
procedure sub_0045F560(?:Extended);
begin
{*
 0045F560    push        ebp
 0045F561    mov         ebp,esp
 0045F563    fld         tbyte ptr [ebp+8]
 0045F566    fsincos
 0045F568    fstp        tbyte ptr [edx]
 0045F56A    fstp        tbyte ptr [eax]
 0045F56C    pop         ebp
 0045F56D    ret         0C
*}
end;

//0045F570
{*procedure sub_0045F570(?:?);
begin
 0045F570    push        ebp
 0045F571    mov         ebp,esp
 0045F573    fld         dword ptr [ebp+8]
 0045F576    fsincos
 0045F578    fstp        dword ptr [edx]
 0045F57A    fstp        dword ptr [eax]
 0045F57C    pop         ebp
 0045F57D    ret         4
end;*}

//0045F580
{*procedure sub_0045F580(?:?; ?:?);
begin
 0045F580    push        ebp
 0045F581    mov         ebp,esp
 0045F583    fld         dword ptr [ebp+0C]
 0045F586    fsincos
 0045F588    fmul        dword ptr [ebp+8]
 0045F58B    fstp        dword ptr [edx]
 0045F58D    fmul        dword ptr [ebp+8]
 0045F590    fstp        dword ptr [eax]
 0045F592    pop         ebp
 0045F593    ret         8
end;*}

//0045F598
{*function sub_0045F598(?:Extended; ?:?; ?:?):?;
begin
 0045F598    push        ebp
 0045F599    mov         ebp,esp
 0045F59B    add         esp,0FFFFFFF0
 0045F59E    fld         tbyte ptr [ebp+8]
 0045F5A1    fmul        st,st(0)
 0045F5A3    fsubr       dword ptr ds:[45F5D0];1:Single
 0045F5A9    fsqrt
 0045F5AB    add         esp,0FFFFFFF4
 0045F5AE    fstp        tbyte ptr [esp]
 0045F5B1    wait
 0045F5B2    mov         ax,word ptr [ebp+10]
 0045F5B6    push        eax
 0045F5B7    push        dword ptr [ebp+0C]
 0045F5BA    push        dword ptr [ebp+8]
 0045F5BD    call        0045F610
 0045F5C2    fstp        tbyte ptr [ebp-10]
 0045F5C5    wait
 0045F5C6    fld         tbyte ptr [ebp-10]
 0045F5C9    mov         esp,ebp
 0045F5CB    pop         ebp
 0045F5CC    ret         0C
end;*}

//0045F5D4
{*function sub_0045F5D4(?:Extended; ?:?; ?:?):?;
begin
 0045F5D4    push        ebp
 0045F5D5    mov         ebp,esp
 0045F5D7    add         esp,0FFFFFFF0
 0045F5DA    mov         ax,word ptr [ebp+10]
 0045F5DE    push        eax
 0045F5DF    push        dword ptr [ebp+0C]
 0045F5E2    push        dword ptr [ebp+8]
 0045F5E5    fld         tbyte ptr [ebp+8]
 0045F5E8    fmul        st,st(0)
 0045F5EA    fsubr       dword ptr ds:[45F60C];1:Single
 0045F5F0    fsqrt
 0045F5F2    add         esp,0FFFFFFF4
 0045F5F5    fstp        tbyte ptr [esp]
 0045F5F8    wait
 0045F5F9    call        0045F610
 0045F5FE    fstp        tbyte ptr [ebp-10]
 0045F601    wait
 0045F602    fld         tbyte ptr [ebp-10]
 0045F605    mov         esp,ebp
 0045F607    pop         ebp
 0045F608    ret         0C
end;*}

//0045F610
{*function sub_0045F610(?:Extended; ?:Extended):?;
begin
 0045F610    push        ebp
 0045F611    mov         ebp,esp
 0045F613    fld         tbyte ptr [ebp+14]
 0045F616    fld         tbyte ptr [ebp+8]
 0045F619    fpatan
 0045F61B    pop         ebp
 0045F61C    ret         18
end;*}

//0045F620
{*function sub_0045F620(?:?; ?:?):?;
begin
 0045F620    push        ebp
 0045F621    mov         ebp,esp
 0045F623    fld         dword ptr [ebp+0C]
 0045F626    fld         dword ptr [ebp+8]
 0045F629    fpatan
 0045F62B    pop         ebp
 0045F62C    ret         8
end;*}

//0045F630
procedure sub_0045F630(?:Extended);
begin
{*
 0045F630    push        ebp
 0045F631    mov         ebp,esp
 0045F633    fld         tbyte ptr [ebp+8]
 0045F636    fptan
 0045F638    fstp        st(0)
 0045F63A    pop         ebp
 0045F63B    ret         0C
*}
end;

//0045F640
{*function sub_0045F640(?:?):?;
begin
 0045F640    push        ebp
 0045F641    mov         ebp,esp
 0045F643    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045F64A    je          0045F66E
 0045F64C    lea         eax,[ebp+8]
 0045F64F    movd        mm0,dword ptr [eax]
 0045F652    pfrsqrt     mm1,mm0
 0045F656    movq        mm2,mm1
 0045F659    pfmul       mm1,mm1
 0045F65D    pfrsqit1    mm1,mm0
 0045F661    pfrcpit2    mm1,mm2
 0045F665    movd        dword ptr [eax],mm1
 0045F668    femms
 0045F66A    fld         dword ptr [eax]
>0045F66C    jmp         0045F677
 0045F66E    fld         dword ptr [ebp+8]
 0045F671    fsqrt
 0045F673    fld1
 0045F675    fdivrp      st(1),st
 0045F677    pop         ebp
 0045F678    ret         4
end;*}

//0045F67C
{*procedure sub_0045F67C(?:?);
begin
 0045F67C    push        ebp
 0045F67D    mov         ebp,esp
 0045F67F    fld         dword ptr [ebp+8]
 0045F682    frndint
 0045F684    pop         ebp
 0045F685    ret         4
end;*}

//0045F688
{*function sub_0045F688(?:?):?;
begin
 0045F688    push        ebp
 0045F689    mov         ebp,esp
 0045F68B    sub         esp,8
 0045F68E    wait
 0045F68F    fnstcw      word ptr [esp]
 0045F692    fldcw       word ptr ds:[5AD064]
 0045F698    fld         dword ptr [ebp+8]
 0045F69B    fistp       dword ptr [esp+4]
 0045F69F    fldcw       word ptr [esp]
 0045F6A2    pop         ecx
 0045F6A3    pop         eax
 0045F6A4    pop         ebp
 0045F6A5    ret         4
end;*}

//0045F6A8
procedure sub_0045F6A8(?:Extended);
begin
{*
 0045F6A8    push        ebp
 0045F6A9    mov         ebp,esp
 0045F6AB    sub         esp,4
 0045F6AE    wait
 0045F6AF    fnstcw      word ptr [esp]
 0045F6B2    fldcw       word ptr ds:[5AD064]
 0045F6B8    fld         tbyte ptr [ebp+8]
 0045F6BB    frndint
 0045F6BD    fldcw       word ptr [esp]
 0045F6C0    add         esp,4
 0045F6C3    pop         ebp
 0045F6C4    ret         0C
*}
end;

//0045F6C8
{*function sub_0045F6C8(?:?):?;
begin
 0045F6C8    push        ebp
 0045F6C9    mov         ebp,esp
 0045F6CB    sub         esp,4
 0045F6CE    wait
 0045F6CF    fnstcw      word ptr [esp]
 0045F6D2    fldcw       word ptr ds:[5AD064]
 0045F6D8    fld         dword ptr [ebp+8]
 0045F6DB    fld         st(0)
 0045F6DD    frndint
 0045F6DF    fsubp       st(1),st
 0045F6E1    fldcw       word ptr [esp]
 0045F6E4    add         esp,4
 0045F6E7    pop         ebp
 0045F6E8    ret         4
end;*}

//0045F6EC
{*function sub_0045F6EC(?:?):?;
begin
 0045F6EC    push        ebp
 0045F6ED    mov         ebp,esp
 0045F6EF    fld         dword ptr [ebp+8]
 0045F6F2    fistp       dword ptr [ebp+8]
 0045F6F5    mov         eax,dword ptr [ebp+8]
 0045F6F8    pop         ebp
 0045F6F9    ret         4
end;*}

//0045F6FC
{*function sub_0045F6FC(?:Extended; ?:Extended):?;
begin
 0045F6FC    push        ebp
 0045F6FD    mov         ebp,esp
 0045F6FF    fld         tbyte ptr [ebp+14]
 0045F702    fld         tbyte ptr [ebp+8]
 0045F705    fcomi       st,st(1)
 0045F707    fcmovb      st,st(1)
 0045F709    ffree       st(1)
 0045F70B    pop         ebp
 0045F70C    ret         18
end;*}

//0045F710
{*function sub_0045F710(?:?; ?:?):?;
begin
 0045F710    cmp         eax,edx
 0045F712    cmovl       eax,edx
 0045F715    ret
end;*}

//0045F718
{*procedure sub_0045F718(?:?; ?:Integer; ?:?);
begin
 0045F718    test        byte ptr ds:[5AD060],1;gvar_005AD060
>0045F71F    je          0045F755
 0045F721    push        edx
 0045F722    shr         edx,2
 0045F725    or          edx,edx
>0045F727    je          0045F755
 0045F729    movd        mm7,dword ptr [ecx]
 0045F72C    punpcklbq   mm7,mm7
 0045F72F    prefetchw   [eax+40]
 0045F733    movq        mm0,mmword ptr [eax]
 0045F736    movq        mm1,mmword ptr [eax+8]
 0045F73A    pfmul       mm0,mm7
 0045F73E    pfmul       mm1,mm7
 0045F742    movq        mmword ptr [eax],mm0
 0045F745    movq        mmword ptr [eax+8],mm1
 0045F749    add         eax,10
 0045F74C    dec         edx
>0045F74D    jne         0045F72F
 0045F74F    pop         edx
 0045F750    and         edx,3
 0045F753    femms
 0045F755    push        edx
 0045F756    shr         edx,1
 0045F758    or          edx,edx
>0045F75A    je          0045F770
 0045F75C    fld         dword ptr [eax]
 0045F75E    fmul        dword ptr [ecx]
 0045F760    fstp        dword ptr [eax]
 0045F762    fld         dword ptr [eax+4]
 0045F765    fmul        dword ptr [ecx]
 0045F767    fstp        dword ptr [eax+4]
 0045F76A    add         eax,8
 0045F76D    dec         edx
>0045F76E    jne         0045F75C
 0045F770    pop         edx
 0045F771    test        edx,1
>0045F777    je          0045F77F
 0045F779    fld         dword ptr [eax]
 0045F77B    fmul        dword ptr [ecx]
 0045F77D    fstp        dword ptr [eax]
 0045F77F    ret
end;*}

//0045F780
{*procedure sub_0045F780(?:?; ?:?);
begin
 0045F780    mov         ecx,eax
 0045F782    fld         dword ptr [edx]
 0045F784    fcomp       dword ptr [ecx]
 0045F786    fnstsw      al
 0045F788    sahf
>0045F789    jbe         0045F78F
 0045F78B    mov         eax,dword ptr [edx]
 0045F78D    mov         dword ptr [ecx],eax
 0045F78F    fld         dword ptr [edx+4]
 0045F792    fcomp       dword ptr [ecx+4]
 0045F795    fnstsw      al
 0045F797    sahf
>0045F798    jbe         0045F7A0
 0045F79A    mov         eax,dword ptr [edx+4]
 0045F79D    mov         dword ptr [ecx+4],eax
 0045F7A0    fld         dword ptr [edx+8]
 0045F7A3    fcomp       dword ptr [ecx+8]
 0045F7A6    fnstsw      al
 0045F7A8    sahf
>0045F7A9    jbe         0045F7B1
 0045F7AB    mov         eax,dword ptr [edx+8]
 0045F7AE    mov         dword ptr [ecx+8],eax
 0045F7B1    fld         dword ptr [edx+0C]
 0045F7B4    fcomp       dword ptr [ecx+0C]
 0045F7B7    fnstsw      al
 0045F7B9    sahf
>0045F7BA    jbe         0045F7C2
 0045F7BC    mov         eax,dword ptr [edx+0C]
 0045F7BF    mov         dword ptr [ecx+0C],eax
 0045F7C2    ret
end;*}

//0045F7C4
{*function sub_0045F7C4(?:?; ?:?; ?:?):?;
begin
 0045F7C4    push        ebp
 0045F7C5    mov         ebp,esp
 0045F7C7    fld         dword ptr [ebp+10]
 0045F7CA    fcom        dword ptr [ebp+0C]
 0045F7CD    wait
 0045F7CE    fnstsw      al
 0045F7D0    sahf
>0045F7D1    jb          0045F7E5
 0045F7D3    fcom        dword ptr [ebp+8]
 0045F7D6    wait
 0045F7D7    fnstsw      al
 0045F7D9    sahf
>0045F7DA    ja          0045F7E0
 0045F7DC    pop         ebp
 0045F7DD    ret         0C
 0045F7E0    fld         dword ptr [ebp+8]
>0045F7E3    jmp         0045F7E8
 0045F7E5    fld         dword ptr [ebp+0C]
 0045F7E8    ffree       st(1)
 0045F7EA    pop         ebp
 0045F7EB    ret         0C
end;*}

//0045F7F0
{*procedure sub_0045F7F0(?:?; ?:?; ?:?; ?:?);
begin
 0045F7F0    push        ebp
 0045F7F1    mov         ebp,esp
 0045F7F3    add         esp,0FFFFFF9C
 0045F7F6    push        ebx
 0045F7F7    push        esi
 0045F7F8    mov         esi,ecx
 0045F7FA    mov         ebx,eax
 0045F7FC    fld         dword ptr [ebx]
 0045F7FE    fmul        dword ptr [edx]
 0045F800    fld         dword ptr [ebx+4]
 0045F803    fmul        dword ptr [edx+4]
 0045F806    faddp       st(1),st
 0045F808    fld         dword ptr [ebx+8]
 0045F80B    fmul        dword ptr [edx+8]
 0045F80E    faddp       st(1),st
 0045F810    fld         dword ptr [ebx+0C]
 0045F813    fmul        dword ptr [edx+0C]
 0045F816    faddp       st(1),st
 0045F818    fstp        tbyte ptr [ebp-20]
 0045F81B    wait
 0045F81C    fld         tbyte ptr [ebp-20]
 0045F81F    fcomp       dword ptr ds:[45F944];0:Single
 0045F825    fnstsw      al
 0045F827    sahf
>0045F828    jae         0045F858
 0045F82A    fld         tbyte ptr [ebp-20]
 0045F82D    fchs
 0045F82F    fstp        tbyte ptr [ebp-20]
 0045F832    wait
 0045F833    fld         dword ptr [edx]
 0045F835    fchs
 0045F837    fstp        dword ptr [ebp-64]
 0045F83A    wait
 0045F83B    fld         dword ptr [edx+4]
 0045F83E    fchs
 0045F840    fstp        dword ptr [ebp-60]
 0045F843    wait
 0045F844    fld         dword ptr [edx+8]
 0045F847    fchs
 0045F849    fstp        dword ptr [ebp-5C]
 0045F84C    wait
 0045F84D    fld         dword ptr [edx+0C]
 0045F850    fchs
 0045F852    fstp        dword ptr [ebp-58]
 0045F855    wait
>0045F856    jmp         0045F86F
 0045F858    mov         eax,dword ptr [edx]
 0045F85A    mov         dword ptr [ebp-64],eax
 0045F85D    mov         eax,dword ptr [edx+4]
 0045F860    mov         dword ptr [ebp-60],eax
 0045F863    mov         eax,dword ptr [edx+8]
 0045F866    mov         dword ptr [ebp-5C],eax
 0045F869    mov         eax,dword ptr [edx+0C]
 0045F86C    mov         dword ptr [ebp-58],eax
 0045F86F    fld         tbyte ptr [ebp-20]
 0045F872    fsubr       dword ptr ds:[45F948];1:Single
 0045F878    fcomp       dword ptr ds:[5AD048];1.00000000317108E-30:Single
 0045F87E    fnstsw      al
 0045F880    sahf
>0045F881    jbe         0045F8DB
 0045F883    mov         ax,word ptr [ebp-18]
 0045F887    push        eax
 0045F888    push        dword ptr [ebp-1C]
 0045F88B    push        dword ptr [ebp-20]
 0045F88E    call        0045F598
 0045F893    fstp        tbyte ptr [ebp-10]
 0045F896    wait
 0045F897    fld         tbyte ptr [ebp-10]
 0045F89A    call        @SIN
 0045F89F    fdivr       dword ptr ds:[45F948];1:Single
 0045F8A5    fstp        tbyte ptr [ebp-30]
 0045F8A8    wait
 0045F8A9    fld         dword ptr ds:[45F948];1:Single
 0045F8AF    fsub        dword ptr [ebp+8]
 0045F8B2    fld         tbyte ptr [ebp-10]
 0045F8B5    fmulp       st(1),st
 0045F8B7    call        @SIN
 0045F8BC    fld         tbyte ptr [ebp-30]
 0045F8BF    fmulp       st(1),st
 0045F8C1    fstp        tbyte ptr [ebp-40]
 0045F8C4    wait
 0045F8C5    fld         tbyte ptr [ebp-10]
 0045F8C8    fmul        dword ptr [ebp+8]
 0045F8CB    call        @SIN
 0045F8D0    fld         tbyte ptr [ebp-30]
 0045F8D3    fmulp       st(1),st
 0045F8D5    fstp        tbyte ptr [ebp-50]
 0045F8D8    wait
>0045F8D9    jmp         0045F8EF
 0045F8DB    fld         dword ptr ds:[45F948];1:Single
 0045F8E1    fsub        dword ptr [ebp+8]
 0045F8E4    fstp        tbyte ptr [ebp-40]
 0045F8E7    wait
 0045F8E8    fld         dword ptr [ebp+8]
 0045F8EB    fstp        tbyte ptr [ebp-50]
 0045F8EE    wait
 0045F8EF    fld         tbyte ptr [ebp-40]
 0045F8F2    fmul        dword ptr [ebx]
 0045F8F4    fld         tbyte ptr [ebp-50]
 0045F8F7    fmul        dword ptr [ebp-64]
 0045F8FA    faddp       st(1),st
 0045F8FC    fstp        dword ptr [esi]
 0045F8FE    wait
 0045F8FF    fld         tbyte ptr [ebp-40]
 0045F902    fmul        dword ptr [ebx+4]
 0045F905    fld         tbyte ptr [ebp-50]
 0045F908    fmul        dword ptr [ebp-60]
 0045F90B    faddp       st(1),st
 0045F90D    fstp        dword ptr [esi+4]
 0045F910    wait
 0045F911    fld         tbyte ptr [ebp-40]
 0045F914    fmul        dword ptr [ebx+8]
 0045F917    fld         tbyte ptr [ebp-50]
 0045F91A    fmul        dword ptr [ebp-5C]
 0045F91D    faddp       st(1),st
 0045F91F    fstp        dword ptr [esi+8]
 0045F922    wait
 0045F923    fld         tbyte ptr [ebp-40]
 0045F926    fmul        dword ptr [ebx+0C]
 0045F929    fld         tbyte ptr [ebp-50]
 0045F92C    fmul        dword ptr [ebp-58]
 0045F92F    faddp       st(1),st
 0045F931    fstp        dword ptr [esi+0C]
 0045F934    wait
 0045F935    mov         eax,esi
 0045F937    call        0045ED98
 0045F93C    pop         esi
 0045F93D    pop         ebx
 0045F93E    mov         esp,ebp
 0045F940    pop         ebp
 0045F941    ret         4
end;*}

//0045F94C
{*function sub_0045F94C(?:Integer; ?:Integer; ?:Integer; ?:?; ?:?; ?:?; ?:?):?;
begin
 0045F94C    push        ebp
 0045F94D    mov         ebp,esp
 0045F94F    add         esp,0FFFFFFA0
 0045F952    push        ebx
 0045F953    push        esi
 0045F954    push        edi
 0045F955    mov         ebx,ecx
 0045F957    mov         esi,edx
 0045F959    mov         edi,eax
 0045F95B    lea         ecx,[ebp-30]
 0045F95E    mov         edx,ebx
 0045F960    mov         eax,dword ptr [ebp+14]
 0045F963    call        0045CBC4
 0045F968    lea         ecx,[ebp-40]
 0045F96B    mov         edx,ebx
 0045F96D    mov         eax,dword ptr [ebp+10]
 0045F970    call        0045CBC4
 0045F975    lea         ecx,[ebp-20]
 0045F978    lea         edx,[ebp-40]
 0045F97B    mov         eax,esi
 0045F97D    call        0045CF4C
 0045F982    lea         edx,[ebp-20]
 0045F985    lea         eax,[ebp-30]
 0045F988    call        0045CE50
 0045F98D    fstp        dword ptr [ebp-10]
 0045F990    wait
 0045F991    fld         dword ptr [ebp-10]
 0045F994    fcomp       dword ptr ds:[5AD048];1.00000000317108E-30:Single
 0045F99A    fnstsw      al
 0045F99C    sahf
>0045F99D    jae         0045F9B6
 0045F99F    fld         dword ptr ds:[5AD048];1.00000000317108E-30:Single
 0045F9A5    fchs
 0045F9A7    fcomp       dword ptr [ebp-10]
 0045F9AA    fnstsw      al
 0045F9AC    sahf
>0045F9AD    jae         0045F9B6
 0045F9AF    xor         ebx,ebx
>0045F9B1    jmp         0045FA99
 0045F9B6    fld         dword ptr ds:[5AD06C];gvar_005AD06C:Single
 0045F9BC    fdiv        dword ptr [ebp-10]
 0045F9BF    fstp        dword ptr [ebp-14]
 0045F9C2    wait
 0045F9C3    lea         ecx,[ebp-60]
 0045F9C6    mov         edx,ebx
 0045F9C8    mov         eax,edi
 0045F9CA    call        0045CBE4
 0045F9CF    lea         edx,[ebp-20]
 0045F9D2    lea         eax,[ebp-60]
 0045F9D5    call        0045CE50
 0045F9DA    fmul        dword ptr [ebp-14]
 0045F9DD    fstp        dword ptr [ebp-8]
 0045F9E0    wait
 0045F9E1    fld         dword ptr [ebp-8]
 0045F9E4    fcomp       dword ptr ds:[45FAA4];0:Single
 0045F9EA    fnstsw      al
 0045F9EC    sahf
>0045F9ED    jb          0045F9FD
 0045F9EF    fld         dword ptr [ebp-8]
 0045F9F2    fcomp       dword ptr ds:[45FAA8];1:Single
 0045F9F8    fnstsw      al
 0045F9FA    sahf
>0045F9FB    jbe         0045FA04
 0045F9FD    xor         ebx,ebx
>0045F9FF    jmp         0045FA99
 0045FA04    lea         ecx,[ebp-50]
 0045FA07    lea         edx,[ebp-30]
 0045FA0A    lea         eax,[ebp-60]
 0045FA0D    call        0045CEDC
 0045FA12    lea         edx,[ebp-50]
 0045FA15    mov         eax,esi
 0045FA17    call        0045CE30
 0045FA1C    fmul        dword ptr [ebp-14]
 0045FA1F    fstp        dword ptr [ebp-0C]
 0045FA22    wait
 0045FA23    fld         dword ptr [ebp-0C]
 0045FA26    fcomp       dword ptr ds:[45FAA4];0:Single
 0045FA2C    fnstsw      al
 0045FA2E    sahf
>0045FA2F    jb          0045FA42
 0045FA31    fld         dword ptr [ebp-8]
 0045FA34    fadd        dword ptr [ebp-0C]
 0045FA37    fcomp       dword ptr ds:[45FAA8];1:Single
 0045FA3D    fnstsw      al
 0045FA3F    sahf
>0045FA40    jbe         0045FA46
 0045FA42    xor         ebx,ebx
>0045FA44    jmp         0045FA48
 0045FA46    mov         bl,1
 0045FA48    test        bl,bl
>0045FA4A    je          0045FA99
 0045FA4C    lea         edx,[ebp-50]
 0045FA4F    lea         eax,[ebp-40]
 0045FA52    call        0045CE30
 0045FA57    fmul        dword ptr [ebp-14]
 0045FA5A    fstp        dword ptr [ebp-4]
 0045FA5D    wait
 0045FA5E    fld         dword ptr [ebp-4]
 0045FA61    fcomp       dword ptr ds:[45FAA4];0:Single
 0045FA67    fnstsw      al
 0045FA69    sahf
>0045FA6A    jbe         0045FA97
 0045FA6C    cmp         dword ptr [ebp+0C],0
>0045FA70    je          0045FA81
 0045FA72    push        dword ptr [ebp-4]
 0045FA75    mov         ecx,dword ptr [ebp+0C]
 0045FA78    mov         edx,esi
 0045FA7A    mov         eax,edi
 0045FA7C    call        0045CDB0
 0045FA81    cmp         dword ptr [ebp+8],0
>0045FA85    je          0045FA99
 0045FA87    mov         ecx,dword ptr [ebp+8]
 0045FA8A    lea         edx,[ebp-40]
 0045FA8D    lea         eax,[ebp-30]
 0045FA90    call        0045CF14
>0045FA95    jmp         0045FA99
 0045FA97    xor         ebx,ebx
 0045FA99    mov         eax,ebx
 0045FA9B    pop         edi
 0045FA9C    pop         esi
 0045FA9D    pop         ebx
 0045FA9E    mov         esp,ebp
 0045FAA0    pop         ebp
 0045FAA1    ret         10
end;*}

//0045FAAC
{*function sub_0045FAAC(?:Integer; ?:Integer; ?:Integer; ?:?; ?:?; ?:?):?;
begin
 0045FAAC    push        ebp
 0045FAAD    mov         ebp,esp
 0045FAAF    add         esp,0FFFFFFE8
 0045FAB2    push        ebx
 0045FAB3    push        esi
 0045FAB4    push        edi
 0045FAB5    mov         edi,ecx
 0045FAB7    mov         esi,edx
 0045FAB9    mov         ebx,eax
 0045FABB    mov         ecx,esi
 0045FABD    mov         edx,ebx
 0045FABF    mov         eax,edi
 0045FAC1    call        0045CE88
 0045FAC6    fstp        dword ptr [ebp-4]
 0045FAC9    wait
 0045FACA    push        dword ptr [ebp-4]
 0045FACD    lea         ecx,[ebp-18]
 0045FAD0    mov         edx,esi
 0045FAD2    mov         eax,ebx
 0045FAD4    call        0045CDB0
 0045FAD9    lea         edx,[ebp-18]
 0045FADC    mov         eax,edi
 0045FADE    call        0045D948
 0045FAE3    fld         dword ptr [ebp+10]
 0045FAE6    fmul        dword ptr [ebp+10]
 0045FAE9    fsubrp      st(1),st
 0045FAEB    fstp        dword ptr [ebp-8]
 0045FAEE    wait
 0045FAEF    lea         eax,[ebp-8]
 0045FAF2    mov         eax,dword ptr [eax]
 0045FAF4    test        eax,eax
>0045FAF6    jl          0045FBA7
 0045FAFC    test        eax,eax
>0045FAFE    jne         0045FB25
 0045FB00    lea         eax,[ebp-4]
 0045FB03    cmp         dword ptr [eax],0
>0045FB06    jle         0045FBA7
 0045FB0C    push        dword ptr [ebp-4]
 0045FB0F    mov         ecx,dword ptr [ebp+0C]
 0045FB12    mov         edx,esi
 0045FB14    mov         eax,ebx
 0045FB16    call        0045CDB0
 0045FB1B    mov         eax,1
>0045FB20    jmp         0045FBA9
 0045FB25    test        eax,eax
>0045FB27    jle         0045FBA7
 0045FB29    fld         dword ptr [ebp-8]
 0045FB2C    fsqrt
 0045FB2E    fstp        dword ptr [ebp-8]
 0045FB31    wait
 0045FB32    fld         dword ptr [ebp-4]
 0045FB35    fcomp       dword ptr [ebp-8]
 0045FB38    fnstsw      al
 0045FB3A    sahf
>0045FB3B    jb          0045FB76
 0045FB3D    fld         dword ptr [ebp-4]
 0045FB40    fsub        dword ptr [ebp-8]
 0045FB43    add         esp,0FFFFFFFC
 0045FB46    fstp        dword ptr [esp]
 0045FB49    wait
 0045FB4A    mov         ecx,dword ptr [ebp+0C]
 0045FB4D    mov         edx,esi
 0045FB4F    mov         eax,ebx
 0045FB51    call        0045CDB0
 0045FB56    fld         dword ptr [ebp-4]
 0045FB59    fadd        dword ptr [ebp-8]
 0045FB5C    add         esp,0FFFFFFFC
 0045FB5F    fstp        dword ptr [esp]
 0045FB62    wait
 0045FB63    mov         ecx,dword ptr [ebp+8]
 0045FB66    mov         edx,esi
 0045FB68    mov         eax,ebx
 0045FB6A    call        0045CDB0
 0045FB6F    mov         eax,2
>0045FB74    jmp         0045FBA9
 0045FB76    fld         dword ptr [ebp-4]
 0045FB79    fadd        dword ptr [ebp-8]
 0045FB7C    fcomp       dword ptr ds:[45FBB4];0:Single
 0045FB82    fnstsw      al
 0045FB84    sahf
>0045FB85    jb          0045FBA7
 0045FB87    fld         dword ptr [ebp-4]
 0045FB8A    fadd        dword ptr [ebp-8]
 0045FB8D    add         esp,0FFFFFFFC
 0045FB90    fstp        dword ptr [esp]
 0045FB93    wait
 0045FB94    mov         ecx,dword ptr [ebp+0C]
 0045FB97    mov         edx,esi
 0045FB99    mov         eax,ebx
 0045FB9B    call        0045CDB0
 0045FBA0    mov         eax,1
>0045FBA5    jmp         0045FBA9
 0045FBA7    xor         eax,eax
 0045FBA9    pop         edi
 0045FBAA    pop         esi
 0045FBAB    pop         ebx
 0045FBAC    mov         esp,ebp
 0045FBAE    pop         ebp
 0045FBAF    ret         0C
end;*}

//0045FBB8
{*function sub_0045FBB8(?:?; ?:?):?;
begin
 0045FBB8    push        ebp
 0045FBB9    mov         ebp,esp
 0045FBBB    add         esp,0FFFFFFEC
 0045FBBE    fld         dword ptr [ebp+0C]
 0045FBC1    fmul        dword ptr [ebp+0C]
 0045FBC4    fstp        dword ptr [ebp-8]
 0045FBC7    wait
 0045FBC8    fld         dword ptr [ebp+8]
 0045FBCB    fmul        dword ptr [ebp+8]
 0045FBCE    fstp        dword ptr [ebp-0C]
 0045FBD1    wait
 0045FBD2    fld         dword ptr [ebp-8]
 0045FBD5    fsub        dword ptr [ebp-0C]
 0045FBD8    fsqrt
 0045FBDA    fstp        dword ptr [ebp-10]
 0045FBDD    wait
 0045FBDE    fld         dword ptr [ebp-10]
 0045FBE1    fmul        st,st(0)
 0045FBE3    fld         dword ptr [ebp-8]
 0045FBE6    fadd        dword ptr [ebp-0C]
 0045FBE9    fsubrp      st(1),st
 0045FBEB    fld         dword ptr ds:[45FC14];2:Single
 0045FBF1    fmul        dword ptr [ebp-10]
 0045FBF4    fdivp       st(1),st
 0045FBF6    fstp        dword ptr [ebp-14]
 0045FBF9    wait
 0045FBFA    fld         dword ptr [ebp-14]
 0045FBFD    fmul        st,st(0)
 0045FBFF    fadd        dword ptr [ebp-0C]
 0045FC02    fsqrt
 0045FC04    fstp        dword ptr [ebp-4]
 0045FC07    wait
 0045FC08    fld         dword ptr [ebp-4]
 0045FC0B    mov         esp,ebp
 0045FC0D    pop         ebp
 0045FC0E    ret         8
end;*}

//0045FC18
{*procedure sub_0045FC18(?:?; ?:?);
begin
 0045FC18    push        ebx
 0045FC19    push        esi
 0045FC1A    mov         esi,edx
 0045FC1C    mov         ebx,eax
 0045FC1E    fld         dword ptr [ebx+0C]
 0045FC21    fadd        dword ptr [ebx]
 0045FC23    fstp        dword ptr [esi]
 0045FC25    wait
 0045FC26    fld         dword ptr [ebx+1C]
 0045FC29    fadd        dword ptr [ebx+10]
 0045FC2C    fstp        dword ptr [esi+4]
 0045FC2F    wait
 0045FC30    fld         dword ptr [ebx+2C]
 0045FC33    fadd        dword ptr [ebx+20]
 0045FC36    fstp        dword ptr [esi+8]
 0045FC39    wait
 0045FC3A    fld         dword ptr [ebx+3C]
 0045FC3D    fadd        dword ptr [ebx+30]
 0045FC40    fstp        dword ptr [esi+0C]
 0045FC43    wait
 0045FC44    mov         eax,esi
 0045FC46    call        0045ED1C
 0045FC4B    fld         dword ptr [ebx+0C]
 0045FC4E    fsub        dword ptr [ebx+4]
 0045FC51    fstp        dword ptr [esi+10]
 0045FC54    wait
 0045FC55    fld         dword ptr [ebx+1C]
 0045FC58    fsub        dword ptr [ebx+14]
 0045FC5B    fstp        dword ptr [esi+14]
 0045FC5E    wait
 0045FC5F    fld         dword ptr [ebx+2C]
 0045FC62    fsub        dword ptr [ebx+24]
 0045FC65    fstp        dword ptr [esi+18]
 0045FC68    wait
 0045FC69    fld         dword ptr [ebx+3C]
 0045FC6C    fsub        dword ptr [ebx+34]
 0045FC6F    fstp        dword ptr [esi+1C]
 0045FC72    wait
 0045FC73    lea         eax,[esi+10]
 0045FC76    call        0045ED1C
 0045FC7B    fld         dword ptr [ebx+0C]
 0045FC7E    fsub        dword ptr [ebx]
 0045FC80    fstp        dword ptr [esi+20]
 0045FC83    wait
 0045FC84    fld         dword ptr [ebx+1C]
 0045FC87    fsub        dword ptr [ebx+10]
 0045FC8A    fstp        dword ptr [esi+24]
 0045FC8D    wait
 0045FC8E    fld         dword ptr [ebx+2C]
 0045FC91    fsub        dword ptr [ebx+20]
 0045FC94    fstp        dword ptr [esi+28]
 0045FC97    wait
 0045FC98    fld         dword ptr [ebx+3C]
 0045FC9B    fsub        dword ptr [ebx+30]
 0045FC9E    fstp        dword ptr [esi+2C]
 0045FCA1    wait
 0045FCA2    lea         eax,[esi+20]
 0045FCA5    call        0045ED1C
 0045FCAA    fld         dword ptr [ebx+0C]
 0045FCAD    fadd        dword ptr [ebx+4]
 0045FCB0    fstp        dword ptr [esi+30]
 0045FCB3    wait
 0045FCB4    fld         dword ptr [ebx+1C]
 0045FCB7    fadd        dword ptr [ebx+14]
 0045FCBA    fstp        dword ptr [esi+34]
 0045FCBD    wait
 0045FCBE    fld         dword ptr [ebx+2C]
 0045FCC1    fadd        dword ptr [ebx+24]
 0045FCC4    fstp        dword ptr [esi+38]
 0045FCC7    wait
 0045FCC8    fld         dword ptr [ebx+3C]
 0045FCCB    fadd        dword ptr [ebx+34]
 0045FCCE    fstp        dword ptr [esi+3C]
 0045FCD1    wait
 0045FCD2    lea         eax,[esi+30]
 0045FCD5    call        0045ED1C
 0045FCDA    fld         dword ptr [ebx+0C]
 0045FCDD    fsub        dword ptr [ebx+8]
 0045FCE0    fstp        dword ptr [esi+50]
 0045FCE3    wait
 0045FCE4    fld         dword ptr [ebx+1C]
 0045FCE7    fsub        dword ptr [ebx+18]
 0045FCEA    fstp        dword ptr [esi+54]
 0045FCED    wait
 0045FCEE    fld         dword ptr [ebx+2C]
 0045FCF1    fsub        dword ptr [ebx+28]
 0045FCF4    fstp        dword ptr [esi+58]
 0045FCF7    wait
 0045FCF8    fld         dword ptr [ebx+3C]
 0045FCFB    fsub        dword ptr [ebx+38]
 0045FCFE    fstp        dword ptr [esi+5C]
 0045FD01    wait
 0045FD02    lea         eax,[esi+50]
 0045FD05    call        0045ED1C
 0045FD0A    fld         dword ptr [ebx+0C]
 0045FD0D    fadd        dword ptr [ebx+8]
 0045FD10    fstp        dword ptr [esi+40]
 0045FD13    wait
 0045FD14    fld         dword ptr [ebx+1C]
 0045FD17    fadd        dword ptr [ebx+18]
 0045FD1A    fstp        dword ptr [esi+44]
 0045FD1D    wait
 0045FD1E    fld         dword ptr [ebx+2C]
 0045FD21    fadd        dword ptr [ebx+28]
 0045FD24    fstp        dword ptr [esi+48]
 0045FD27    wait
 0045FD28    fld         dword ptr [ebx+3C]
 0045FD2B    fadd        dword ptr [ebx+38]
 0045FD2E    fstp        dword ptr [esi+4C]
 0045FD31    wait
 0045FD32    lea         eax,[esi+40]
 0045FD35    call        0045ED1C
 0045FD3A    pop         esi
 0045FD3B    pop         ebx
 0045FD3C    ret
end;*}

//0045FD40
{*function sub_0045FD40(?:?):?;
begin
 0045FD40    push        ebp
 0045FD41    mov         ebp,esp
 0045FD43    push        dword ptr [ebp+8]
 0045FD46    call        0045FD50
 0045FD4B    pop         ebp
 0045FD4C    ret         4
end;*}

//0045FD50
{*function sub_0045FD50(?:?; ?:?; ?:?):?;
begin
 0045FD50    push        ebp
 0045FD51    mov         ebp,esp
 0045FD53    push        ecx
 0045FD54    push        ebx
 0045FD55    push        esi
 0045FD56    mov         esi,edx
 0045FD58    mov         ebx,eax
 0045FD5A    fld         dword ptr [ebp+8]
 0045FD5D    fchs
 0045FD5F    fstp        dword ptr [ebp-4]
 0045FD62    wait
 0045FD63    mov         edx,ebx
 0045FD65    lea         eax,[esi+28]
 0045FD68    call        0045ED54
 0045FD6D    fcomp       dword ptr [ebp-4]
 0045FD70    fnstsw      al
 0045FD72    sahf
>0045FD73    jb          0045FDD3
 0045FD75    mov         edx,ebx
 0045FD77    lea         eax,[esi+38]
 0045FD7A    call        0045ED54
 0045FD7F    fcomp       dword ptr [ebp-4]
 0045FD82    fnstsw      al
 0045FD84    sahf
>0045FD85    jb          0045FDD3
 0045FD87    mov         edx,ebx
 0045FD89    lea         eax,[esi+48]
 0045FD8C    call        0045ED54
 0045FD91    fcomp       dword ptr [ebp-4]
 0045FD94    fnstsw      al
 0045FD96    sahf
>0045FD97    jb          0045FDD3
 0045FD99    mov         edx,ebx
 0045FD9B    lea         eax,[esi+58]
 0045FD9E    call        0045ED54
 0045FDA3    fcomp       dword ptr [ebp-4]
 0045FDA6    fnstsw      al
 0045FDA8    sahf
>0045FDA9    jb          0045FDD3
 0045FDAB    mov         edx,ebx
 0045FDAD    lea         eax,[esi+68]
 0045FDB0    call        0045ED54
 0045FDB5    fcomp       dword ptr [ebp-4]
 0045FDB8    fnstsw      al
 0045FDBA    sahf
>0045FDBB    jb          0045FDD3
 0045FDBD    mov         edx,ebx
 0045FDBF    lea         eax,[esi+78]
 0045FDC2    call        0045ED54
 0045FDC7    fcomp       dword ptr [ebp-4]
 0045FDCA    fnstsw      al
 0045FDCC    sahf
>0045FDCD    jb          0045FDD3
 0045FDCF    xor         eax,eax
>0045FDD1    jmp         0045FDD5
 0045FDD3    mov         al,1
 0045FDD5    pop         esi
 0045FDD6    pop         ebx
 0045FDD7    pop         ecx
 0045FDD8    pop         ebp
 0045FDD9    ret         4
end;*}

//0045FDDC
{*function sub_0045FDDC(?:?; ?:?; ?:?):?;
begin
 0045FDDC    push        ebx
 0045FDDD    push        esi
 0045FDDE    push        edi
 0045FDDF    add         esp,0FFFFFFE8
 0045FDE2    mov         edi,ecx
 0045FDE4    mov         esi,edx
 0045FDE6    mov         ebx,eax
 0045FDE8    mov         edx,esi
 0045FDEA    mov         eax,ebx
 0045FDEC    call        0045D928
 0045FDF1    fmul        dword ptr ds:[45FE30];0.5:Single
 0045FDF7    add         esp,0FFFFFFFC
 0045FDFA    fstp        dword ptr [esp]
 0045FDFD    wait
 0045FDFE    push        3F000000
 0045FE03    lea         ecx,[esp+14]
 0045FE07    mov         edx,esi
 0045FE09    mov         eax,ebx
 0045FE0B    call        0045CA78
 0045FE10    lea         eax,[esp+14]
 0045FE14    lea         edx,[esp+8]
 0045FE18    call        0045D824
 0045FE1D    lea         eax,[esp+4]
 0045FE21    mov         edx,edi
 0045FE23    call        0045FD50
 0045FE28    add         esp,18
 0045FE2B    pop         edi
 0045FE2C    pop         esi
 0045FE2D    pop         ebx
 0045FE2E    ret
end;*}

Initialization
//0045FE64
{*
 0045FE64    push        ebp
 0045FE65    mov         ebp,esp
 0045FE67    push        ebx
 0045FE68    push        esi
 0045FE69    push        edi
 0045FE6A    sub         dword ptr ds:[5E0CD0],1
>0045FE71    jae         0045FEC4
 0045FE73    xor         eax,eax
 0045FE75    push        ebp
 0045FE76    push        45FEB3
 0045FE7B    push        dword ptr fs:[eax]
 0045FE7E    mov         dword ptr fs:[eax],esp
 0045FE81    pusha
 0045FE83    mov         eax,80000000
 0045FE88    cpuid
 0045FE8A    cmp         eax,80000000
>0045FE8F    jbe         0045FEA7
 0045FE91    mov         eax,80000001
 0045FE96    cpuid
 0045FE98    test        edx,80000000
>0045FE9E    je          0045FEA7
 0045FEA0    mov         byte ptr ds:[5AD060],1;gvar_005AD060
 0045FEA7    popa
 0045FEA9    xor         eax,eax
 0045FEAB    pop         edx
 0045FEAC    pop         ecx
 0045FEAD    pop         ecx
 0045FEAE    mov         dword ptr fs:[eax],edx
>0045FEB1    jmp         0045FEC4
>0045FEB3    jmp         @HandleAnyException
 0045FEB8    mov         byte ptr ds:[5AD060],0;gvar_005AD060
 0045FEBF    call        @DoneExcept
 0045FEC4    pop         edi
 0045FEC5    pop         esi
 0045FEC6    pop         ebx
 0045FEC7    pop         ebp
 0045FEC8    ret
*}
Finalization
end.