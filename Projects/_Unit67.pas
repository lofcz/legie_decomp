//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit67;

interface

uses
  SysUtils, Classes;

type
  TMapTexCoordMode = (mtcmUndefined, mtcmNull, mtcmMain, mtcmDual, mtcmSecond, mtcmArbitrary);
  .2 = array of ?;
//elSize = 1;
  .3 = array of ?;
//elSize = 4
//varType equivalent: varInteger;
  .4 = array of ?;
//elSize = 4
//varType equivalent: varInteger;
    //procedure sub_0046989C(?:?; ?:?);//0046989C
    //procedure sub_004698D0(?:?);//004698D0
    //procedure sub_00469904(?:?; ?:?; ?:?);//00469904
    //procedure sub_0046993C(?:?);//0046993C
    //procedure sub_00469970(?:?; ?:?; ?:?; ?:?);//00469970
    //procedure sub_004699AC(?:?);//004699AC
    //procedure sub_004699E0(?:?; ?:?; ?:?);//004699E0
    //procedure sub_00469A30(?:?; ?:?; ?:?);//00469A30
    //procedure sub_00469A80(?:?; ?:?; ?:?);//00469A80
    //procedure sub_00469AD0(?:?; ?:?; ?:?);//00469AD0
    //procedure sub_00469B20(?:?);//00469B20
    //procedure sub_00469B68(?:?);//00469B68
    //procedure sub_00469BB0(?:?; ?:?; ?:?; ?:?);//00469BB0
    //procedure sub_00469C04(?:?);//00469C04
    //procedure sub_00469C4C(?:?);//00469C4C
    //function sub_00469C94(?:?; ?:?):?;//00469C94
    //function sub_00469CB0(?:?):?;//00469CB0
    //function sub_00469CCC(?:?; ?:?; ?:?):?;//00469CCC
    //function sub_00469CEC(?:?):?;//00469CEC
    //function sub_00469D08(?:?; ?:?; ?:?; ?:?):?;//00469D08
    //function sub_00469D2C(?:?):?;//00469D2C
    //function sub_00469D48(?:?; ?:?; ?:?):?;//00469D48
    //function sub_00469D7C(?:?; ?:?; ?:?):?;//00469D7C
    //function sub_00469DB0(?:?; ?:?; ?:?):?;//00469DB0
    //function sub_00469DE4(?:?; ?:?; ?:?):?;//00469DE4
    //function sub_00469E18(?:?):?;//00469E18
    //function sub_00469E44(?:?):?;//00469E44
    //function sub_00469E70(?:?; ?:?; ?:?; ?:?):?;//00469E70
    //function sub_00469EA8(?:?):?;//00469EA8
    //function sub_00469ED4(?:?):?;//00469ED4
    //function sub_00469F00(?:?; ?:?):?;//00469F00
    //procedure sub_00469F28(?:?);//00469F28
    //function sub_00469F4C(?:?; ?:?; ?:?):?;//00469F4C
    //procedure sub_00469F78(?:?);//00469F78
    //function sub_00469F9C(?:?; ?:?; ?:?; ?:?):?;//00469F9C
    //procedure sub_00469FD0(?:?);//00469FD0
    //procedure sub_00469FF4(?:?; ?:?; ?:?);//00469FF4
    //procedure sub_0046A038(?:?; ?:?; ?:?);//0046A038
    //procedure sub_0046A07C(?:?; ?:?; ?:?);//0046A07C
    //procedure sub_0046A0C0(?:?; ?:?; ?:?);//0046A0C0
    //procedure sub_0046A104(?:?);//0046A104
    //procedure sub_0046A138(?:?);//0046A138
    //procedure sub_0046A16C(?:?; ?:?; ?:?; ?:?);//0046A16C
    //procedure sub_0046A1B8(?:?);//0046A1B8
    //procedure sub_0046A1EC(?:?);//0046A1EC
    procedure sub_0046A220;//0046A220
    procedure sub_0046A228;//0046A228
    procedure sub_0046A230;//0046A230
    procedure sub_0046A238;//0046A238
    procedure sub_0046A240;//0046A240
    procedure sub_0046A248;//0046A248
    procedure sub_0046A250;//0046A250
    procedure sub_0046A258;//0046A258
    procedure sub_0046A260;//0046A260
    procedure sub_0046A268;//0046A268
    procedure sub_0046A270;//0046A270
    procedure sub_0046A278;//0046A278
    procedure sub_0046A280;//0046A280
    procedure sub_0046A288;//0046A288
    procedure sub_0046A290;//0046A290
    procedure sub_0046A298;//0046A298
    procedure sub_0046A2C0;//0046A2C0
    procedure sub_0046A3B0;//0046A3B0
    procedure sub_0046A3B8;//0046A3B8
    procedure sub_0046A3C0;//0046A3C0
    procedure sub_0046A47C;//0046A47C
    procedure sub_0046A538;//0046A538
    procedure sub_0046A684;//0046A684
    //procedure sub_0046A7D0(?:?; ?:Longint);//0046A7D0
    //procedure sub_0046A984(?:?);//0046A984
    //procedure sub_0046AA28(?:?);//0046AA28
    //function sub_0046AA3C:?;//0046AA3C

implementation

//0046989C
{*procedure sub_0046989C(?:?; ?:?);
begin
 0046989C    push        ebp
 0046989D    mov         ebp,esp
 0046989F    push        ebx
 004698A0    push        esi
 004698A1    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 004698A7    test        ebx,ebx
>004698A9    jl          004698CA
 004698AB    inc         ebx
 004698AC    xor         esi,esi
 004698AE    push        dword ptr [ebp+0C]
 004698B1    push        dword ptr [ebp+8]
 004698B4    mov         eax,[005E1390];gvar_005E1390:?
 004698B9    mov         eax,dword ptr [eax+esi*4]
 004698BC    push        eax
 004698BD    mov         eax,[005AE47C];^gvar_005E0E30
 004698C2    mov         eax,dword ptr [eax]
 004698C4    call        eax
 004698C6    inc         esi
 004698C7    dec         ebx
>004698C8    jne         004698AE
 004698CA    pop         esi
 004698CB    pop         ebx
 004698CC    pop         ebp
 004698CD    ret         8
end;*}

//004698D0
{*procedure sub_004698D0(?:?);
begin
 004698D0    push        ebp
 004698D1    mov         ebp,esp
 004698D3    push        ebx
 004698D4    push        esi
 004698D5    push        edi
 004698D6    mov         edi,dword ptr [ebp+8]
 004698D9    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 004698DF    test        ebx,ebx
>004698E1    jl          004698FD
 004698E3    inc         ebx
 004698E4    xor         esi,esi
 004698E6    push        edi
 004698E7    mov         eax,[005E1390];gvar_005E1390:?
 004698EC    mov         eax,dword ptr [eax+esi*4]
 004698EF    push        eax
 004698F0    mov         eax,[005AE6A4];^gvar_005E0E34
 004698F5    mov         eax,dword ptr [eax]
 004698F7    call        eax
 004698F9    inc         esi
 004698FA    dec         ebx
>004698FB    jne         004698E6
 004698FD    pop         edi
 004698FE    pop         esi
 004698FF    pop         ebx
 00469900    pop         ebp
 00469901    ret         4
end;*}

//00469904
{*procedure sub_00469904(?:?; ?:?; ?:?);
begin
 00469904    push        ebp
 00469905    mov         ebp,esp
 00469907    push        ebx
 00469908    push        esi
 00469909    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 0046990F    test        ebx,ebx
>00469911    jl          00469935
 00469913    inc         ebx
 00469914    xor         esi,esi
 00469916    push        dword ptr [ebp+10]
 00469919    push        dword ptr [ebp+0C]
 0046991C    push        dword ptr [ebp+8]
 0046991F    mov         eax,[005E1390];gvar_005E1390:?
 00469924    mov         eax,dword ptr [eax+esi*4]
 00469927    push        eax
 00469928    mov         eax,[005AE200];^gvar_005E0E50
 0046992D    mov         eax,dword ptr [eax]
 0046992F    call        eax
 00469931    inc         esi
 00469932    dec         ebx
>00469933    jne         00469916
 00469935    pop         esi
 00469936    pop         ebx
 00469937    pop         ebp
 00469938    ret         0C
end;*}

//0046993C
{*procedure sub_0046993C(?:?);
begin
 0046993C    push        ebp
 0046993D    mov         ebp,esp
 0046993F    push        ebx
 00469940    push        esi
 00469941    push        edi
 00469942    mov         edi,dword ptr [ebp+8]
 00469945    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 0046994B    test        ebx,ebx
>0046994D    jl          00469969
 0046994F    inc         ebx
 00469950    xor         esi,esi
 00469952    push        edi
 00469953    mov         eax,[005E1390];gvar_005E1390:?
 00469958    mov         eax,dword ptr [eax+esi*4]
 0046995B    push        eax
 0046995C    mov         eax,[005AE434];^gvar_005E0E54
 00469961    mov         eax,dword ptr [eax]
 00469963    call        eax
 00469965    inc         esi
 00469966    dec         ebx
>00469967    jne         00469952
 00469969    pop         edi
 0046996A    pop         esi
 0046996B    pop         ebx
 0046996C    pop         ebp
 0046996D    ret         4
end;*}

//00469970
{*procedure sub_00469970(?:?; ?:?; ?:?; ?:?);
begin
 00469970    push        ebp
 00469971    mov         ebp,esp
 00469973    push        ebx
 00469974    push        esi
 00469975    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 0046997B    test        ebx,ebx
>0046997D    jl          004699A4
 0046997F    inc         ebx
 00469980    xor         esi,esi
 00469982    push        dword ptr [ebp+14]
 00469985    push        dword ptr [ebp+10]
 00469988    push        dword ptr [ebp+0C]
 0046998B    push        dword ptr [ebp+8]
 0046998E    mov         eax,[005E1390];gvar_005E1390:?
 00469993    mov         eax,dword ptr [eax+esi*4]
 00469996    push        eax
 00469997    mov         eax,[005AE78C];^gvar_005E0E70
 0046999C    mov         eax,dword ptr [eax]
 0046999E    call        eax
 004699A0    inc         esi
 004699A1    dec         ebx
>004699A2    jne         00469982
 004699A4    pop         esi
 004699A5    pop         ebx
 004699A6    pop         ebp
 004699A7    ret         10
end;*}

//004699AC
{*procedure sub_004699AC(?:?);
begin
 004699AC    push        ebp
 004699AD    mov         ebp,esp
 004699AF    push        ebx
 004699B0    push        esi
 004699B1    push        edi
 004699B2    mov         edi,dword ptr [ebp+8]
 004699B5    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 004699BB    test        ebx,ebx
>004699BD    jl          004699D9
 004699BF    inc         ebx
 004699C0    xor         esi,esi
 004699C2    push        edi
 004699C3    mov         eax,[005E1390];gvar_005E1390:?
 004699C8    mov         eax,dword ptr [eax+esi*4]
 004699CB    push        eax
 004699CC    mov         eax,[005AE254];^gvar_005E0E74
 004699D1    mov         eax,dword ptr [eax]
 004699D3    call        eax
 004699D5    inc         esi
 004699D6    dec         ebx
>004699D7    jne         004699C2
 004699D9    pop         edi
 004699DA    pop         esi
 004699DB    pop         ebx
 004699DC    pop         ebp
 004699DD    ret         4
end;*}

//004699E0
{*procedure sub_004699E0(?:?; ?:?; ?:?);
begin
 004699E0    push        ebp
 004699E1    mov         ebp,esp
 004699E3    push        ebx
 004699E4    push        esi
 004699E5    push        edi
 004699E6    mov         edi,dword ptr [ebp+8]
 004699E9    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 004699EF    test        ebx,ebx
>004699F1    jl          00469A19
 004699F3    inc         ebx
 004699F4    xor         esi,esi
 004699F6    mov         eax,[005E1390];gvar_005E1390:?
 004699FB    mov         eax,dword ptr [eax+esi*4]
 004699FE    push        eax
 004699FF    mov         eax,[005AE62C];^gvar_005E0E88
 00469A04    mov         eax,dword ptr [eax]
 00469A06    call        eax
 00469A08    push        dword ptr [ebp+10]
 00469A0B    mov         eax,dword ptr [ebp+0C]
 00469A0E    push        eax
 00469A0F    push        edi
 00469A10    call        OpenGL32.glTexGenf
 00469A15    inc         esi
 00469A16    dec         ebx
>00469A17    jne         004699F6
 00469A19    push        84C0
 00469A1E    mov         eax,[005AE62C];^gvar_005E0E88
 00469A23    mov         eax,dword ptr [eax]
 00469A25    call        eax
 00469A27    pop         edi
 00469A28    pop         esi
 00469A29    pop         ebx
 00469A2A    pop         ebp
 00469A2B    ret         0C
end;*}

//00469A30
{*procedure sub_00469A30(?:?; ?:?; ?:?);
begin
 00469A30    push        ebp
 00469A31    mov         ebp,esp
 00469A33    push        ebx
 00469A34    push        esi
 00469A35    push        edi
 00469A36    mov         edi,dword ptr [ebp+8]
 00469A39    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469A3F    test        ebx,ebx
>00469A41    jl          00469A6A
 00469A43    inc         ebx
 00469A44    xor         esi,esi
 00469A46    mov         eax,[005E1390];gvar_005E1390:?
 00469A4B    mov         eax,dword ptr [eax+esi*4]
 00469A4E    push        eax
 00469A4F    mov         eax,[005AE62C];^gvar_005E0E88
 00469A54    mov         eax,dword ptr [eax]
 00469A56    call        eax
 00469A58    mov         eax,dword ptr [ebp+10]
 00469A5B    push        eax
 00469A5C    mov         eax,dword ptr [ebp+0C]
 00469A5F    push        eax
 00469A60    push        edi
 00469A61    call        OpenGL32.glTexGenfv
 00469A66    inc         esi
 00469A67    dec         ebx
>00469A68    jne         00469A46
 00469A6A    push        84C0
 00469A6F    mov         eax,[005AE62C];^gvar_005E0E88
 00469A74    mov         eax,dword ptr [eax]
 00469A76    call        eax
 00469A78    pop         edi
 00469A79    pop         esi
 00469A7A    pop         ebx
 00469A7B    pop         ebp
 00469A7C    ret         0C
end;*}

//00469A80
{*procedure sub_00469A80(?:?; ?:?; ?:?);
begin
 00469A80    push        ebp
 00469A81    mov         ebp,esp
 00469A83    push        ebx
 00469A84    push        esi
 00469A85    push        edi
 00469A86    mov         edi,dword ptr [ebp+8]
 00469A89    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469A8F    test        ebx,ebx
>00469A91    jl          00469ABA
 00469A93    inc         ebx
 00469A94    xor         esi,esi
 00469A96    mov         eax,[005E1390];gvar_005E1390:?
 00469A9B    mov         eax,dword ptr [eax+esi*4]
 00469A9E    push        eax
 00469A9F    mov         eax,[005AE62C];^gvar_005E0E88
 00469AA4    mov         eax,dword ptr [eax]
 00469AA6    call        eax
 00469AA8    mov         eax,dword ptr [ebp+10]
 00469AAB    push        eax
 00469AAC    mov         eax,dword ptr [ebp+0C]
 00469AAF    push        eax
 00469AB0    push        edi
 00469AB1    call        OpenGL32.glTexGeni
 00469AB6    inc         esi
 00469AB7    dec         ebx
>00469AB8    jne         00469A96
 00469ABA    push        84C0
 00469ABF    mov         eax,[005AE62C];^gvar_005E0E88
 00469AC4    mov         eax,dword ptr [eax]
 00469AC6    call        eax
 00469AC8    pop         edi
 00469AC9    pop         esi
 00469ACA    pop         ebx
 00469ACB    pop         ebp
 00469ACC    ret         0C
end;*}

//00469AD0
{*procedure sub_00469AD0(?:?; ?:?; ?:?);
begin
 00469AD0    push        ebp
 00469AD1    mov         ebp,esp
 00469AD3    push        ebx
 00469AD4    push        esi
 00469AD5    push        edi
 00469AD6    mov         edi,dword ptr [ebp+8]
 00469AD9    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469ADF    test        ebx,ebx
>00469AE1    jl          00469B0A
 00469AE3    inc         ebx
 00469AE4    xor         esi,esi
 00469AE6    mov         eax,[005E1390];gvar_005E1390:?
 00469AEB    mov         eax,dword ptr [eax+esi*4]
 00469AEE    push        eax
 00469AEF    mov         eax,[005AE62C];^gvar_005E0E88
 00469AF4    mov         eax,dword ptr [eax]
 00469AF6    call        eax
 00469AF8    mov         eax,dword ptr [ebp+10]
 00469AFB    push        eax
 00469AFC    mov         eax,dword ptr [ebp+0C]
 00469AFF    push        eax
 00469B00    push        edi
 00469B01    call        OpenGL32.glTexGeniv
 00469B06    inc         esi
 00469B07    dec         ebx
>00469B08    jne         00469AE6
 00469B0A    push        84C0
 00469B0F    mov         eax,[005AE62C];^gvar_005E0E88
 00469B14    mov         eax,dword ptr [eax]
 00469B16    call        eax
 00469B18    pop         edi
 00469B19    pop         esi
 00469B1A    pop         ebx
 00469B1B    pop         ebp
 00469B1C    ret         0C
end;*}

//00469B20
{*procedure sub_00469B20(?:?);
begin
 00469B20    push        ebp
 00469B21    mov         ebp,esp
 00469B23    push        ebx
 00469B24    push        esi
 00469B25    push        edi
 00469B26    mov         edi,dword ptr [ebp+8]
 00469B29    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469B2F    test        ebx,ebx
>00469B31    jl          00469B52
 00469B33    inc         ebx
 00469B34    xor         esi,esi
 00469B36    mov         eax,[005E1390];gvar_005E1390:?
 00469B3B    mov         eax,dword ptr [eax+esi*4]
 00469B3E    push        eax
 00469B3F    mov         eax,[005AE62C];^gvar_005E0E88
 00469B44    mov         eax,dword ptr [eax]
 00469B46    call        eax
 00469B48    push        edi
 00469B49    call        OpenGL32.glEnable
 00469B4E    inc         esi
 00469B4F    dec         ebx
>00469B50    jne         00469B36
 00469B52    push        84C0
 00469B57    mov         eax,[005AE62C];^gvar_005E0E88
 00469B5C    mov         eax,dword ptr [eax]
 00469B5E    call        eax
 00469B60    pop         edi
 00469B61    pop         esi
 00469B62    pop         ebx
 00469B63    pop         ebp
 00469B64    ret         4
end;*}

//00469B68
{*procedure sub_00469B68(?:?);
begin
 00469B68    push        ebp
 00469B69    mov         ebp,esp
 00469B6B    push        ebx
 00469B6C    push        esi
 00469B6D    push        edi
 00469B6E    mov         edi,dword ptr [ebp+8]
 00469B71    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469B77    test        ebx,ebx
>00469B79    jl          00469B9A
 00469B7B    inc         ebx
 00469B7C    xor         esi,esi
 00469B7E    mov         eax,[005E1390];gvar_005E1390:?
 00469B83    mov         eax,dword ptr [eax+esi*4]
 00469B86    push        eax
 00469B87    mov         eax,[005AE62C];^gvar_005E0E88
 00469B8C    mov         eax,dword ptr [eax]
 00469B8E    call        eax
 00469B90    push        edi
 00469B91    call        OpenGL32.glDisable
 00469B96    inc         esi
 00469B97    dec         ebx
>00469B98    jne         00469B7E
 00469B9A    push        84C0
 00469B9F    mov         eax,[005AE62C];^gvar_005E0E88
 00469BA4    mov         eax,dword ptr [eax]
 00469BA6    call        eax
 00469BA8    pop         edi
 00469BA9    pop         esi
 00469BAA    pop         ebx
 00469BAB    pop         ebp
 00469BAC    ret         4
end;*}

//00469BB0
{*procedure sub_00469BB0(?:?; ?:?; ?:?; ?:?);
begin
 00469BB0    push        ebp
 00469BB1    mov         ebp,esp
 00469BB3    push        ebx
 00469BB4    push        esi
 00469BB5    push        edi
 00469BB6    mov         edi,dword ptr [ebp+8]
 00469BB9    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469BBF    test        ebx,ebx
>00469BC1    jl          00469BEE
 00469BC3    inc         ebx
 00469BC4    xor         esi,esi
 00469BC6    mov         eax,[005E1390];gvar_005E1390:?
 00469BCB    mov         eax,dword ptr [eax+esi*4]
 00469BCE    push        eax
 00469BCF    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469BD4    mov         eax,dword ptr [eax]
 00469BD6    call        eax
 00469BD8    mov         eax,dword ptr [ebp+14]
 00469BDB    push        eax
 00469BDC    mov         eax,dword ptr [ebp+10]
 00469BDF    push        eax
 00469BE0    mov         eax,dword ptr [ebp+0C]
 00469BE3    push        eax
 00469BE4    push        edi
 00469BE5    call        OpenGL32.glTexCoordPointer
 00469BEA    inc         esi
 00469BEB    dec         ebx
>00469BEC    jne         00469BC6
 00469BEE    push        84C0
 00469BF3    mov         eax,[005AE62C];^gvar_005E0E88
 00469BF8    mov         eax,dword ptr [eax]
 00469BFA    call        eax
 00469BFC    pop         edi
 00469BFD    pop         esi
 00469BFE    pop         ebx
 00469BFF    pop         ebp
 00469C00    ret         10
end;*}

//00469C04
{*procedure sub_00469C04(?:?);
begin
 00469C04    push        ebp
 00469C05    mov         ebp,esp
 00469C07    push        ebx
 00469C08    push        esi
 00469C09    push        edi
 00469C0A    mov         edi,dword ptr [ebp+8]
 00469C0D    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469C13    test        ebx,ebx
>00469C15    jl          00469C36
 00469C17    inc         ebx
 00469C18    xor         esi,esi
 00469C1A    mov         eax,[005E1390];gvar_005E1390:?
 00469C1F    mov         eax,dword ptr [eax+esi*4]
 00469C22    push        eax
 00469C23    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469C28    mov         eax,dword ptr [eax]
 00469C2A    call        eax
 00469C2C    push        edi
 00469C2D    call        OpenGL32.glEnableClientState
 00469C32    inc         esi
 00469C33    dec         ebx
>00469C34    jne         00469C1A
 00469C36    push        84C0
 00469C3B    mov         eax,[005AE62C];^gvar_005E0E88
 00469C40    mov         eax,dword ptr [eax]
 00469C42    call        eax
 00469C44    pop         edi
 00469C45    pop         esi
 00469C46    pop         ebx
 00469C47    pop         ebp
 00469C48    ret         4
end;*}

//00469C4C
{*procedure sub_00469C4C(?:?);
begin
 00469C4C    push        ebp
 00469C4D    mov         ebp,esp
 00469C4F    push        ebx
 00469C50    push        esi
 00469C51    push        edi
 00469C52    mov         edi,dword ptr [ebp+8]
 00469C55    mov         ebx,dword ptr ds:[5E1394];gvar_005E1394
 00469C5B    test        ebx,ebx
>00469C5D    jl          00469C7E
 00469C5F    inc         ebx
 00469C60    xor         esi,esi
 00469C62    mov         eax,[005E1390];gvar_005E1390:?
 00469C67    mov         eax,dword ptr [eax+esi*4]
 00469C6A    push        eax
 00469C6B    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469C70    mov         eax,dword ptr [eax]
 00469C72    call        eax
 00469C74    push        edi
 00469C75    call        OpenGL32.glDisableClientState
 00469C7A    inc         esi
 00469C7B    dec         ebx
>00469C7C    jne         00469C62
 00469C7E    push        84C0
 00469C83    mov         eax,[005AE62C];^gvar_005E0E88
 00469C88    mov         eax,dword ptr [eax]
 00469C8A    call        eax
 00469C8C    pop         edi
 00469C8D    pop         esi
 00469C8E    pop         ebx
 00469C8F    pop         ebp
 00469C90    ret         4
end;*}

//00469C94
{*function sub_00469C94(?:?; ?:?):?;
begin
 00469C94    push        ebp
 00469C95    mov         ebp,esp
 00469C97    push        dword ptr [ebp+0C]
 00469C9A    push        dword ptr [ebp+8]
 00469C9D    push        84C1
 00469CA2    mov         eax,[005AE47C];^gvar_005E0E30
 00469CA7    mov         eax,dword ptr [eax]
 00469CA9    call        eax
 00469CAB    pop         ebp
 00469CAC    ret         8
end;*}

//00469CB0
{*function sub_00469CB0(?:?):?;
begin
 00469CB0    push        ebp
 00469CB1    mov         ebp,esp
 00469CB3    mov         eax,dword ptr [ebp+8]
 00469CB6    push        eax
 00469CB7    push        84C1
 00469CBC    mov         eax,[005AE6A4];^gvar_005E0E34
 00469CC1    mov         eax,dword ptr [eax]
 00469CC3    call        eax
 00469CC5    pop         ebp
 00469CC6    ret         4
end;*}

//00469CCC
{*function sub_00469CCC(?:?; ?:?; ?:?):?;
begin
 00469CCC    push        ebp
 00469CCD    mov         ebp,esp
 00469CCF    push        dword ptr [ebp+10]
 00469CD2    push        dword ptr [ebp+0C]
 00469CD5    push        dword ptr [ebp+8]
 00469CD8    push        84C1
 00469CDD    mov         eax,[005AE200];^gvar_005E0E50
 00469CE2    mov         eax,dword ptr [eax]
 00469CE4    call        eax
 00469CE6    pop         ebp
 00469CE7    ret         0C
end;*}

//00469CEC
{*function sub_00469CEC(?:?):?;
begin
 00469CEC    push        ebp
 00469CED    mov         ebp,esp
 00469CEF    mov         eax,dword ptr [ebp+8]
 00469CF2    push        eax
 00469CF3    push        84C1
 00469CF8    mov         eax,[005AE434];^gvar_005E0E54
 00469CFD    mov         eax,dword ptr [eax]
 00469CFF    call        eax
 00469D01    pop         ebp
 00469D02    ret         4
end;*}

//00469D08
{*function sub_00469D08(?:?; ?:?; ?:?; ?:?):?;
begin
 00469D08    push        ebp
 00469D09    mov         ebp,esp
 00469D0B    push        dword ptr [ebp+14]
 00469D0E    push        dword ptr [ebp+10]
 00469D11    push        dword ptr [ebp+0C]
 00469D14    push        dword ptr [ebp+8]
 00469D17    push        84C1
 00469D1C    mov         eax,[005AE78C];^gvar_005E0E70
 00469D21    mov         eax,dword ptr [eax]
 00469D23    call        eax
 00469D25    pop         ebp
 00469D26    ret         10
end;*}

//00469D2C
{*function sub_00469D2C(?:?):?;
begin
 00469D2C    push        ebp
 00469D2D    mov         ebp,esp
 00469D2F    mov         eax,dword ptr [ebp+8]
 00469D32    push        eax
 00469D33    push        84C1
 00469D38    mov         eax,[005AE254];^gvar_005E0E74
 00469D3D    mov         eax,dword ptr [eax]
 00469D3F    call        eax
 00469D41    pop         ebp
 00469D42    ret         4
end;*}

//00469D48
{*function sub_00469D48(?:?; ?:?; ?:?):?;
begin
 00469D48    push        ebp
 00469D49    mov         ebp,esp
 00469D4B    push        84C1
 00469D50    mov         eax,[005AE62C];^gvar_005E0E88
 00469D55    mov         eax,dword ptr [eax]
 00469D57    call        eax
 00469D59    push        dword ptr [ebp+10]
 00469D5C    mov         eax,dword ptr [ebp+0C]
 00469D5F    push        eax
 00469D60    mov         eax,dword ptr [ebp+8]
 00469D63    push        eax
 00469D64    call        OpenGL32.glTexGenf
 00469D69    push        84C0
 00469D6E    mov         eax,[005AE62C];^gvar_005E0E88
 00469D73    mov         eax,dword ptr [eax]
 00469D75    call        eax
 00469D77    pop         ebp
 00469D78    ret         0C
end;*}

//00469D7C
{*function sub_00469D7C(?:?; ?:?; ?:?):?;
begin
 00469D7C    push        ebp
 00469D7D    mov         ebp,esp
 00469D7F    push        84C1
 00469D84    mov         eax,[005AE62C];^gvar_005E0E88
 00469D89    mov         eax,dword ptr [eax]
 00469D8B    call        eax
 00469D8D    mov         eax,dword ptr [ebp+10]
 00469D90    push        eax
 00469D91    mov         eax,dword ptr [ebp+0C]
 00469D94    push        eax
 00469D95    mov         eax,dword ptr [ebp+8]
 00469D98    push        eax
 00469D99    call        OpenGL32.glTexGenfv
 00469D9E    push        84C0
 00469DA3    mov         eax,[005AE62C];^gvar_005E0E88
 00469DA8    mov         eax,dword ptr [eax]
 00469DAA    call        eax
 00469DAC    pop         ebp
 00469DAD    ret         0C
end;*}

//00469DB0
{*function sub_00469DB0(?:?; ?:?; ?:?):?;
begin
 00469DB0    push        ebp
 00469DB1    mov         ebp,esp
 00469DB3    push        84C1
 00469DB8    mov         eax,[005AE62C];^gvar_005E0E88
 00469DBD    mov         eax,dword ptr [eax]
 00469DBF    call        eax
 00469DC1    mov         eax,dword ptr [ebp+10]
 00469DC4    push        eax
 00469DC5    mov         eax,dword ptr [ebp+0C]
 00469DC8    push        eax
 00469DC9    mov         eax,dword ptr [ebp+8]
 00469DCC    push        eax
 00469DCD    call        OpenGL32.glTexGeni
 00469DD2    push        84C0
 00469DD7    mov         eax,[005AE62C];^gvar_005E0E88
 00469DDC    mov         eax,dword ptr [eax]
 00469DDE    call        eax
 00469DE0    pop         ebp
 00469DE1    ret         0C
end;*}

//00469DE4
{*function sub_00469DE4(?:?; ?:?; ?:?):?;
begin
 00469DE4    push        ebp
 00469DE5    mov         ebp,esp
 00469DE7    push        84C1
 00469DEC    mov         eax,[005AE62C];^gvar_005E0E88
 00469DF1    mov         eax,dword ptr [eax]
 00469DF3    call        eax
 00469DF5    mov         eax,dword ptr [ebp+10]
 00469DF8    push        eax
 00469DF9    mov         eax,dword ptr [ebp+0C]
 00469DFC    push        eax
 00469DFD    mov         eax,dword ptr [ebp+8]
 00469E00    push        eax
 00469E01    call        OpenGL32.glTexGeniv
 00469E06    push        84C0
 00469E0B    mov         eax,[005AE62C];^gvar_005E0E88
 00469E10    mov         eax,dword ptr [eax]
 00469E12    call        eax
 00469E14    pop         ebp
 00469E15    ret         0C
end;*}

//00469E18
{*function sub_00469E18(?:?):?;
begin
 00469E18    push        ebp
 00469E19    mov         ebp,esp
 00469E1B    push        84C1
 00469E20    mov         eax,[005AE62C];^gvar_005E0E88
 00469E25    mov         eax,dword ptr [eax]
 00469E27    call        eax
 00469E29    mov         eax,dword ptr [ebp+8]
 00469E2C    push        eax
 00469E2D    call        OpenGL32.glEnable
 00469E32    push        84C0
 00469E37    mov         eax,[005AE62C];^gvar_005E0E88
 00469E3C    mov         eax,dword ptr [eax]
 00469E3E    call        eax
 00469E40    pop         ebp
 00469E41    ret         4
end;*}

//00469E44
{*function sub_00469E44(?:?):?;
begin
 00469E44    push        ebp
 00469E45    mov         ebp,esp
 00469E47    push        84C1
 00469E4C    mov         eax,[005AE62C];^gvar_005E0E88
 00469E51    mov         eax,dword ptr [eax]
 00469E53    call        eax
 00469E55    mov         eax,dword ptr [ebp+8]
 00469E58    push        eax
 00469E59    call        OpenGL32.glDisable
 00469E5E    push        84C0
 00469E63    mov         eax,[005AE62C];^gvar_005E0E88
 00469E68    mov         eax,dword ptr [eax]
 00469E6A    call        eax
 00469E6C    pop         ebp
 00469E6D    ret         4
end;*}

//00469E70
{*function sub_00469E70(?:?; ?:?; ?:?; ?:?):?;
begin
 00469E70    push        ebp
 00469E71    mov         ebp,esp
 00469E73    push        84C1
 00469E78    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469E7D    mov         eax,dword ptr [eax]
 00469E7F    call        eax
 00469E81    mov         eax,dword ptr [ebp+14]
 00469E84    push        eax
 00469E85    mov         eax,dword ptr [ebp+10]
 00469E88    push        eax
 00469E89    mov         eax,dword ptr [ebp+0C]
 00469E8C    push        eax
 00469E8D    mov         eax,dword ptr [ebp+8]
 00469E90    push        eax
 00469E91    call        OpenGL32.glTexCoordPointer
 00469E96    push        84C0
 00469E9B    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469EA0    mov         eax,dword ptr [eax]
 00469EA2    call        eax
 00469EA4    pop         ebp
 00469EA5    ret         10
end;*}

//00469EA8
{*function sub_00469EA8(?:?):?;
begin
 00469EA8    push        ebp
 00469EA9    mov         ebp,esp
 00469EAB    push        84C1
 00469EB0    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469EB5    mov         eax,dword ptr [eax]
 00469EB7    call        eax
 00469EB9    mov         eax,dword ptr [ebp+8]
 00469EBC    push        eax
 00469EBD    call        OpenGL32.glEnableClientState
 00469EC2    push        84C0
 00469EC7    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469ECC    mov         eax,dword ptr [eax]
 00469ECE    call        eax
 00469ED0    pop         ebp
 00469ED1    ret         4
end;*}

//00469ED4
{*function sub_00469ED4(?:?):?;
begin
 00469ED4    push        ebp
 00469ED5    mov         ebp,esp
 00469ED7    push        84C1
 00469EDC    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469EE1    mov         eax,dword ptr [eax]
 00469EE3    call        eax
 00469EE5    mov         eax,dword ptr [ebp+8]
 00469EE8    push        eax
 00469EE9    call        OpenGL32.glDisableClientState
 00469EEE    push        84C0
 00469EF3    mov         eax,[005AE6B8];^gvar_005E0E8C
 00469EF8    mov         eax,dword ptr [eax]
 00469EFA    call        eax
 00469EFC    pop         ebp
 00469EFD    ret         4
end;*}

//00469F00
{*function sub_00469F00(?:?; ?:?):?;
begin
 00469F00    push        ebp
 00469F01    mov         ebp,esp
 00469F03    push        dword ptr [ebp+0C]
 00469F06    push        dword ptr [ebp+8]
 00469F09    call        OpenGL32.glTexCoord2f
 00469F0E    push        dword ptr [ebp+0C]
 00469F11    push        dword ptr [ebp+8]
 00469F14    push        84C1
 00469F19    mov         eax,[005AE47C];^gvar_005E0E30
 00469F1E    mov         eax,dword ptr [eax]
 00469F20    call        eax
 00469F22    pop         ebp
 00469F23    ret         8
end;*}

//00469F28
{*procedure sub_00469F28(?:?);
begin
 00469F28    push        ebp
 00469F29    mov         ebp,esp
 00469F2B    push        ebx
 00469F2C    mov         ebx,dword ptr [ebp+8]
 00469F2F    push        ebx
 00469F30    call        OpenGL32.glTexCoord2fv
 00469F35    push        ebx
 00469F36    push        84C1
 00469F3B    mov         eax,[005AE6A4];^gvar_005E0E34
 00469F40    mov         eax,dword ptr [eax]
 00469F42    call        eax
 00469F44    pop         ebx
 00469F45    pop         ebp
 00469F46    ret         4
end;*}

//00469F4C
{*function sub_00469F4C(?:?; ?:?; ?:?):?;
begin
 00469F4C    push        ebp
 00469F4D    mov         ebp,esp
 00469F4F    push        dword ptr [ebp+10]
 00469F52    push        dword ptr [ebp+0C]
 00469F55    push        dword ptr [ebp+8]
 00469F58    call        OpenGL32.glTexCoord3f
 00469F5D    push        dword ptr [ebp+10]
 00469F60    push        dword ptr [ebp+0C]
 00469F63    push        dword ptr [ebp+8]
 00469F66    push        84C1
 00469F6B    mov         eax,[005AE200];^gvar_005E0E50
 00469F70    mov         eax,dword ptr [eax]
 00469F72    call        eax
 00469F74    pop         ebp
 00469F75    ret         0C
end;*}

//00469F78
{*procedure sub_00469F78(?:?);
begin
 00469F78    push        ebp
 00469F79    mov         ebp,esp
 00469F7B    push        ebx
 00469F7C    mov         ebx,dword ptr [ebp+8]
 00469F7F    push        ebx
 00469F80    call        OpenGL32.glTexCoord3fv
 00469F85    push        ebx
 00469F86    push        84C1
 00469F8B    mov         eax,[005AE434];^gvar_005E0E54
 00469F90    mov         eax,dword ptr [eax]
 00469F92    call        eax
 00469F94    pop         ebx
 00469F95    pop         ebp
 00469F96    ret         4
end;*}

//00469F9C
{*function sub_00469F9C(?:?; ?:?; ?:?; ?:?):?;
begin
 00469F9C    push        ebp
 00469F9D    mov         ebp,esp
 00469F9F    push        dword ptr [ebp+14]
 00469FA2    push        dword ptr [ebp+10]
 00469FA5    push        dword ptr [ebp+0C]
 00469FA8    push        dword ptr [ebp+8]
 00469FAB    call        OpenGL32.glTexCoord4f
 00469FB0    push        dword ptr [ebp+14]
 00469FB3    push        dword ptr [ebp+10]
 00469FB6    push        dword ptr [ebp+0C]
 00469FB9    push        dword ptr [ebp+8]
 00469FBC    push        84C1
 00469FC1    mov         eax,[005AE78C];^gvar_005E0E70
 00469FC6    mov         eax,dword ptr [eax]
 00469FC8    call        eax
 00469FCA    pop         ebp
 00469FCB    ret         10
end;*}

//00469FD0
{*procedure sub_00469FD0(?:?);
begin
 00469FD0    push        ebp
 00469FD1    mov         ebp,esp
 00469FD3    push        ebx
 00469FD4    mov         ebx,dword ptr [ebp+8]
 00469FD7    push        ebx
 00469FD8    call        OpenGL32.glTexCoord4fv
 00469FDD    push        ebx
 00469FDE    push        84C1
 00469FE3    mov         eax,[005AE254];^gvar_005E0E74
 00469FE8    mov         eax,dword ptr [eax]
 00469FEA    call        eax
 00469FEC    pop         ebx
 00469FED    pop         ebp
 00469FEE    ret         4
end;*}

//00469FF4
{*procedure sub_00469FF4(?:?; ?:?; ?:?);
begin
 00469FF4    push        ebp
 00469FF5    mov         ebp,esp
 00469FF7    push        ebx
 00469FF8    push        esi
 00469FF9    mov         esi,dword ptr [ebp+0C]
 00469FFC    mov         ebx,dword ptr [ebp+8]
 00469FFF    push        dword ptr [ebp+10]
 0046A002    push        esi
 0046A003    push        ebx
 0046A004    call        OpenGL32.glTexGenf
 0046A009    push        84C1
 0046A00E    mov         eax,[005AE62C];^gvar_005E0E88
 0046A013    mov         eax,dword ptr [eax]
 0046A015    call        eax
 0046A017    push        dword ptr [ebp+10]
 0046A01A    push        esi
 0046A01B    push        ebx
 0046A01C    call        OpenGL32.glTexGenf
 0046A021    push        84C0
 0046A026    mov         eax,[005AE62C];^gvar_005E0E88
 0046A02B    mov         eax,dword ptr [eax]
 0046A02D    call        eax
 0046A02F    pop         esi
 0046A030    pop         ebx
 0046A031    pop         ebp
 0046A032    ret         0C
end;*}

//0046A038
{*procedure sub_0046A038(?:?; ?:?; ?:?);
begin
 0046A038    push        ebp
 0046A039    mov         ebp,esp
 0046A03B    push        ebx
 0046A03C    push        esi
 0046A03D    push        edi
 0046A03E    mov         edi,dword ptr [ebp+10]
 0046A041    mov         esi,dword ptr [ebp+0C]
 0046A044    mov         ebx,dword ptr [ebp+8]
 0046A047    push        edi
 0046A048    push        esi
 0046A049    push        ebx
 0046A04A    call        OpenGL32.glTexGenfv
 0046A04F    push        84C1
 0046A054    mov         eax,[005AE62C];^gvar_005E0E88
 0046A059    mov         eax,dword ptr [eax]
 0046A05B    call        eax
 0046A05D    push        edi
 0046A05E    push        esi
 0046A05F    push        ebx
 0046A060    call        OpenGL32.glTexGenfv
 0046A065    push        84C0
 0046A06A    mov         eax,[005AE62C];^gvar_005E0E88
 0046A06F    mov         eax,dword ptr [eax]
 0046A071    call        eax
 0046A073    pop         edi
 0046A074    pop         esi
 0046A075    pop         ebx
 0046A076    pop         ebp
 0046A077    ret         0C
end;*}

//0046A07C
{*procedure sub_0046A07C(?:?; ?:?; ?:?);
begin
 0046A07C    push        ebp
 0046A07D    mov         ebp,esp
 0046A07F    push        ebx
 0046A080    push        esi
 0046A081    push        edi
 0046A082    mov         edi,dword ptr [ebp+10]
 0046A085    mov         esi,dword ptr [ebp+0C]
 0046A088    mov         ebx,dword ptr [ebp+8]
 0046A08B    push        edi
 0046A08C    push        esi
 0046A08D    push        ebx
 0046A08E    call        OpenGL32.glTexGeni
 0046A093    push        84C1
 0046A098    mov         eax,[005AE62C];^gvar_005E0E88
 0046A09D    mov         eax,dword ptr [eax]
 0046A09F    call        eax
 0046A0A1    push        edi
 0046A0A2    push        esi
 0046A0A3    push        ebx
 0046A0A4    call        OpenGL32.glTexGeni
 0046A0A9    push        84C0
 0046A0AE    mov         eax,[005AE62C];^gvar_005E0E88
 0046A0B3    mov         eax,dword ptr [eax]
 0046A0B5    call        eax
 0046A0B7    pop         edi
 0046A0B8    pop         esi
 0046A0B9    pop         ebx
 0046A0BA    pop         ebp
 0046A0BB    ret         0C
end;*}

//0046A0C0
{*procedure sub_0046A0C0(?:?; ?:?; ?:?);
begin
 0046A0C0    push        ebp
 0046A0C1    mov         ebp,esp
 0046A0C3    push        ebx
 0046A0C4    push        esi
 0046A0C5    push        edi
 0046A0C6    mov         edi,dword ptr [ebp+10]
 0046A0C9    mov         esi,dword ptr [ebp+0C]
 0046A0CC    mov         ebx,dword ptr [ebp+8]
 0046A0CF    push        edi
 0046A0D0    push        esi
 0046A0D1    push        ebx
 0046A0D2    call        OpenGL32.glTexGeniv
 0046A0D7    push        84C1
 0046A0DC    mov         eax,[005AE62C];^gvar_005E0E88
 0046A0E1    mov         eax,dword ptr [eax]
 0046A0E3    call        eax
 0046A0E5    push        edi
 0046A0E6    push        esi
 0046A0E7    push        ebx
 0046A0E8    call        OpenGL32.glTexGeniv
 0046A0ED    push        84C0
 0046A0F2    mov         eax,[005AE62C];^gvar_005E0E88
 0046A0F7    mov         eax,dword ptr [eax]
 0046A0F9    call        eax
 0046A0FB    pop         edi
 0046A0FC    pop         esi
 0046A0FD    pop         ebx
 0046A0FE    pop         ebp
 0046A0FF    ret         0C
end;*}

//0046A104
{*procedure sub_0046A104(?:?);
begin
 0046A104    push        ebp
 0046A105    mov         ebp,esp
 0046A107    push        ebx
 0046A108    mov         ebx,dword ptr [ebp+8]
 0046A10B    push        ebx
 0046A10C    call        OpenGL32.glEnable
 0046A111    push        84C1
 0046A116    mov         eax,[005AE62C];^gvar_005E0E88
 0046A11B    mov         eax,dword ptr [eax]
 0046A11D    call        eax
 0046A11F    push        ebx
 0046A120    call        OpenGL32.glEnable
 0046A125    push        84C0
 0046A12A    mov         eax,[005AE62C];^gvar_005E0E88
 0046A12F    mov         eax,dword ptr [eax]
 0046A131    call        eax
 0046A133    pop         ebx
 0046A134    pop         ebp
 0046A135    ret         4
end;*}

//0046A138
{*procedure sub_0046A138(?:?);
begin
 0046A138    push        ebp
 0046A139    mov         ebp,esp
 0046A13B    push        ebx
 0046A13C    mov         ebx,dword ptr [ebp+8]
 0046A13F    push        ebx
 0046A140    call        OpenGL32.glDisable
 0046A145    push        84C1
 0046A14A    mov         eax,[005AE62C];^gvar_005E0E88
 0046A14F    mov         eax,dword ptr [eax]
 0046A151    call        eax
 0046A153    push        ebx
 0046A154    call        OpenGL32.glDisable
 0046A159    push        84C0
 0046A15E    mov         eax,[005AE62C];^gvar_005E0E88
 0046A163    mov         eax,dword ptr [eax]
 0046A165    call        eax
 0046A167    pop         ebx
 0046A168    pop         ebp
 0046A169    ret         4
end;*}

//0046A16C
{*procedure sub_0046A16C(?:?; ?:?; ?:?; ?:?);
begin
 0046A16C    push        ebp
 0046A16D    mov         ebp,esp
 0046A16F    push        ebx
 0046A170    push        esi
 0046A171    push        edi
 0046A172    mov         edi,dword ptr [ebp+10]
 0046A175    mov         esi,dword ptr [ebp+0C]
 0046A178    mov         ebx,dword ptr [ebp+8]
 0046A17B    mov         eax,dword ptr [ebp+14]
 0046A17E    push        eax
 0046A17F    push        edi
 0046A180    push        esi
 0046A181    push        ebx
 0046A182    call        OpenGL32.glTexCoordPointer
 0046A187    push        84C1
 0046A18C    mov         eax,[005AE6B8];^gvar_005E0E8C
 0046A191    mov         eax,dword ptr [eax]
 0046A193    call        eax
 0046A195    mov         eax,dword ptr [ebp+14]
 0046A198    push        eax
 0046A199    push        edi
 0046A19A    push        esi
 0046A19B    push        ebx
 0046A19C    call        OpenGL32.glTexCoordPointer
 0046A1A1    push        84C0
 0046A1A6    mov         eax,[005AE6B8];^gvar_005E0E8C
 0046A1AB    mov         eax,dword ptr [eax]
 0046A1AD    call        eax
 0046A1AF    pop         edi
 0046A1B0    pop         esi
 0046A1B1    pop         ebx
 0046A1B2    pop         ebp
 0046A1B3    ret         10
end;*}

//0046A1B8
{*procedure sub_0046A1B8(?:?);
begin
 0046A1B8    push        ebp
 0046A1B9    mov         ebp,esp
 0046A1BB    push        ebx
 0046A1BC    mov         ebx,dword ptr [ebp+8]
 0046A1BF    push        ebx
 0046A1C0    call        OpenGL32.glEnableClientState
 0046A1C5    push        84C1
 0046A1CA    mov         eax,[005AE6B8];^gvar_005E0E8C
 0046A1CF    mov         eax,dword ptr [eax]
 0046A1D1    call        eax
 0046A1D3    push        ebx
 0046A1D4    call        OpenGL32.glEnableClientState
 0046A1D9    push        84C0
 0046A1DE    mov         eax,[005AE6B8];^gvar_005E0E8C
 0046A1E3    mov         eax,dword ptr [eax]
 0046A1E5    call        eax
 0046A1E7    pop         ebx
 0046A1E8    pop         ebp
 0046A1E9    ret         4
end;*}

//0046A1EC
{*procedure sub_0046A1EC(?:?);
begin
 0046A1EC    push        ebp
 0046A1ED    mov         ebp,esp
 0046A1EF    push        ebx
 0046A1F0    mov         ebx,dword ptr [ebp+8]
 0046A1F3    push        ebx
 0046A1F4    call        OpenGL32.glDisableClientState
 0046A1F9    push        84C1
 0046A1FE    mov         eax,[005AE6B8];^gvar_005E0E8C
 0046A203    mov         eax,dword ptr [eax]
 0046A205    call        eax
 0046A207    push        ebx
 0046A208    call        OpenGL32.glDisableClientState
 0046A20D    push        84C0
 0046A212    mov         eax,[005AE6B8];^gvar_005E0E8C
 0046A217    mov         eax,dword ptr [eax]
 0046A219    call        eax
 0046A21B    pop         ebx
 0046A21C    pop         ebp
 0046A21D    ret         4
end;*}

//0046A220
procedure sub_0046A220;
begin
{*
 0046A220    push        ebp
 0046A221    mov         ebp,esp
 0046A223    pop         ebp
 0046A224    ret         8
*}
end;

//0046A228
procedure sub_0046A228;
begin
{*
 0046A228    push        ebp
 0046A229    mov         ebp,esp
 0046A22B    pop         ebp
 0046A22C    ret         4
*}
end;

//0046A230
procedure sub_0046A230;
begin
{*
 0046A230    push        ebp
 0046A231    mov         ebp,esp
 0046A233    pop         ebp
 0046A234    ret         0C
*}
end;

//0046A238
procedure sub_0046A238;
begin
{*
 0046A238    push        ebp
 0046A239    mov         ebp,esp
 0046A23B    pop         ebp
 0046A23C    ret         4
*}
end;

//0046A240
procedure sub_0046A240;
begin
{*
 0046A240    push        ebp
 0046A241    mov         ebp,esp
 0046A243    pop         ebp
 0046A244    ret         10
*}
end;

//0046A248
procedure sub_0046A248;
begin
{*
 0046A248    push        ebp
 0046A249    mov         ebp,esp
 0046A24B    pop         ebp
 0046A24C    ret         4
*}
end;

//0046A250
procedure sub_0046A250;
begin
{*
 0046A250    push        ebp
 0046A251    mov         ebp,esp
 0046A253    pop         ebp
 0046A254    ret         0C
*}
end;

//0046A258
procedure sub_0046A258;
begin
{*
 0046A258    push        ebp
 0046A259    mov         ebp,esp
 0046A25B    pop         ebp
 0046A25C    ret         0C
*}
end;

//0046A260
procedure sub_0046A260;
begin
{*
 0046A260    push        ebp
 0046A261    mov         ebp,esp
 0046A263    pop         ebp
 0046A264    ret         0C
*}
end;

//0046A268
procedure sub_0046A268;
begin
{*
 0046A268    push        ebp
 0046A269    mov         ebp,esp
 0046A26B    pop         ebp
 0046A26C    ret         0C
*}
end;

//0046A270
procedure sub_0046A270;
begin
{*
 0046A270    push        ebp
 0046A271    mov         ebp,esp
 0046A273    pop         ebp
 0046A274    ret         4
*}
end;

//0046A278
procedure sub_0046A278;
begin
{*
 0046A278    push        ebp
 0046A279    mov         ebp,esp
 0046A27B    pop         ebp
 0046A27C    ret         4
*}
end;

//0046A280
procedure sub_0046A280;
begin
{*
 0046A280    push        ebp
 0046A281    mov         ebp,esp
 0046A283    pop         ebp
 0046A284    ret         10
*}
end;

//0046A288
procedure sub_0046A288;
begin
{*
 0046A288    push        ebp
 0046A289    mov         ebp,esp
 0046A28B    pop         ebp
 0046A28C    ret         4
*}
end;

//0046A290
procedure sub_0046A290;
begin
{*
 0046A290    push        ebp
 0046A291    mov         ebp,esp
 0046A293    pop         ebp
 0046A294    ret         4
*}
end;

//0046A298
procedure sub_0046A298;
begin
{*
 0046A298    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046A29F    jne         0046A2B6
 0046A2A1    mov         dword ptr ds:[5E1384],1;gvar_005E1384
 0046A2AB    mov         al,[005E1340];gvar_005E1340
 0046A2B0    mov         [005E1388],al;gvar_005E1388
 0046A2B5    ret
 0046A2B6    inc         dword ptr ds:[5E1384];gvar_005E1384
 0046A2BC    ret
*}
end;

//0046A2C0
procedure sub_0046A2C0;
begin
{*
 0046A2C0    dec         dword ptr ds:[5E1384];gvar_005E1384
 0046A2C6    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046A2CD    jne         0046A353
 0046A2D3    mov         al,[005E1388];gvar_005E1388
 0046A2D8    cmp         al,byte ptr ds:[5E1340];gvar_005E1340
>0046A2DE    je          0046A353
 0046A2E0    xor         eax,eax
 0046A2E2    mov         al,[005E1388];gvar_005E1388
 0046A2E7    cmp         eax,5
>0046A2EA    ja          0046A33F
 0046A2EC    jmp         dword ptr [eax*4+46A2F3]
 0046A2EC    dd          0046A33F
 0046A2EC    dd          0046A30B
 0046A2EC    dd          0046A312
 0046A2EC    dd          0046A319
 0046A2EC    dd          0046A320
 0046A2EC    dd          0046A327
 0046A30B    call        0046A3C0
>0046A310    jmp         0046A353
 0046A312    call        0046A47C
>0046A317    jmp         0046A353
 0046A319    call        0046A684
>0046A31E    jmp         0046A353
 0046A320    call        0046A538
>0046A325    jmp         0046A353
 0046A327    mov         eax,[005E1390];gvar_005E1390:?
 0046A32C    call        @DynArrayHigh
 0046A331    mov         edx,eax
 0046A333    mov         eax,[005E1390];gvar_005E1390:?
 0046A338    call        0046A7D0
>0046A33D    jmp         0046A353
 0046A33F    mov         ecx,231
 0046A344    mov         edx,46A35C;'C:\GLScene\glscene_v_1000714\Source\base\XOpenGL.pas'
 0046A349    mov         eax,46A39C;'Assertion failure'
 0046A34E    call        @Assert
 0046A353    ret
*}
end;

//0046A3B0
procedure sub_0046A3B0;
begin
{*
 0046A3B0    mov         byte ptr ds:[5E1341],1;gvar_005E1341
 0046A3B7    ret
*}
end;

//0046A3B8
procedure sub_0046A3B8;
begin
{*
 0046A3B8    mov         byte ptr ds:[5E1341],0;gvar_005E1341
 0046A3BF    ret
*}
end;

//0046A3C0
procedure sub_0046A3C0;
begin
{*
 0046A3C0    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046A3C7    je          0046A3D1
 0046A3C9    mov         byte ptr ds:[5E1388],1;gvar_005E1388
 0046A3D0    ret
 0046A3D1    cmp         byte ptr ds:[5E1340],1;gvar_005E1340
>0046A3D8    je          0046A47B
 0046A3DE    mov         byte ptr ds:[5E1340],1;gvar_005E1340
 0046A3E5    mov         dword ptr ds:[5E1344],46A220
 0046A3EF    mov         dword ptr ds:[5E1348],46A228
 0046A3F9    mov         dword ptr ds:[5E134C],46A230
 0046A403    mov         dword ptr ds:[5E1350],46A238
 0046A40D    mov         dword ptr ds:[5E1354],46A240
 0046A417    mov         dword ptr ds:[5E1358],46A248
 0046A421    mov         dword ptr ds:[5E135C],46A250
 0046A42B    mov         dword ptr ds:[5E1360],46A258
 0046A435    mov         dword ptr ds:[5E1364],46A260
 0046A43F    mov         dword ptr ds:[5E1368],46A268
 0046A449    mov         dword ptr ds:[5E136C],46A280
 0046A453    mov         dword ptr ds:[5E1370],46A288
 0046A45D    mov         dword ptr ds:[5E1374],46A290
 0046A467    mov         dword ptr ds:[5E1378],46A270
 0046A471    mov         dword ptr ds:[5E137C],46A278
 0046A47B    ret
*}
end;

//0046A47C
procedure sub_0046A47C;
begin
{*
 0046A47C    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046A483    je          0046A48D
 0046A485    mov         byte ptr ds:[5E1388],2;gvar_005E1388
 0046A48C    ret
 0046A48D    cmp         byte ptr ds:[5E1340],2;gvar_005E1340
>0046A494    je          0046A537
 0046A49A    mov         byte ptr ds:[5E1340],2;gvar_005E1340
 0046A4A1    mov         eax,460134;OpenGL32.glTexCoord2f
 0046A4A6    mov         [005E1344],eax;gvar_005E1344
 0046A4AB    mov         eax,46013C;OpenGL32.glTexCoord2fv
 0046A4B0    mov         [005E1348],eax;gvar_005E1348
 0046A4B5    mov         eax,460144;OpenGL32.glTexCoord3f
 0046A4BA    mov         [005E134C],eax;gvar_005E134C
 0046A4BF    mov         eax,46014C;OpenGL32.glTexCoord3fv
 0046A4C4    mov         [005E1350],eax;gvar_005E1350
 0046A4C9    mov         eax,460154;OpenGL32.glTexCoord4f
 0046A4CE    mov         [005E1354],eax;gvar_005E1354
 0046A4D3    mov         eax,46015C;OpenGL32.glTexCoord4fv
 0046A4D8    mov         [005E1358],eax;gvar_005E1358
 0046A4DD    mov         eax,46017C;OpenGL32.glTexGenf
 0046A4E2    mov         [005E135C],eax;gvar_005E135C
 0046A4E7    mov         eax,460184;OpenGL32.glTexGenfv
 0046A4EC    mov         [005E1360],eax;gvar_005E1360
 0046A4F1    mov         eax,46018C;OpenGL32.glTexGeni
 0046A4F6    mov         [005E1364],eax;gvar_005E1364
 0046A4FB    mov         eax,460194;OpenGL32.glTexGeniv
 0046A500    mov         [005E1368],eax;gvar_005E1368
 0046A505    mov         eax,460164;OpenGL32.glTexCoordPointer
 0046A50A    mov         [005E136C],eax;gvar_005E136C
 0046A50F    mov         eax,45FF94;OpenGL32.glEnableClientState
 0046A514    mov         [005E1370],eax;gvar_005E1370
 0046A519    mov         eax,45FF6C;OpenGL32.glDisableClientState
 0046A51E    mov         [005E1374],eax;gvar_005E1374
 0046A523    mov         eax,45FF8C;OpenGL32.glEnable
 0046A528    mov         [005E1378],eax;gvar_005E1378
 0046A52D    mov         eax,45FF64;OpenGL32.glDisable
 0046A532    mov         [005E137C],eax;gvar_005E137C
 0046A537    ret
*}
end;

//0046A538
procedure sub_0046A538;
begin
{*
 0046A538    cmp         byte ptr ds:[5E1341],0;gvar_005E1341
>0046A53F    je          0046A547
 0046A541    call        0046A3C0
 0046A546    ret
 0046A547    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046A54E    je          0046A55C
 0046A550    mov         byte ptr ds:[5E1388],4;gvar_005E1388
>0046A557    jmp         0046A624
 0046A55C    cmp         byte ptr ds:[5E1340],4;gvar_005E1340
>0046A563    je          0046A624
 0046A569    mov         byte ptr ds:[5E1340],4;gvar_005E1340
 0046A570    mov         eax,[005AE588];^gvar_005E0CE2
 0046A575    cmp         byte ptr [eax],0
>0046A578    jne         0046A58E
 0046A57A    mov         ecx,2AD
 0046A57F    mov         edx,46A630;'C:\GLScene\glscene_v_1000714\Source\base\XOpenGL.pas'
 0046A584    mov         eax,46A670;'Assertion failure'
 0046A589    call        @Assert
 0046A58E    mov         dword ptr ds:[5E1344],469C94
 0046A598    mov         dword ptr ds:[5E1348],469CB0
 0046A5A2    mov         dword ptr ds:[5E134C],469CCC
 0046A5AC    mov         dword ptr ds:[5E1350],469CEC
 0046A5B6    mov         dword ptr ds:[5E1354],469D08
 0046A5C0    mov         dword ptr ds:[5E1358],469D2C
 0046A5CA    mov         dword ptr ds:[5E135C],469D48
 0046A5D4    mov         dword ptr ds:[5E1360],469D7C
 0046A5DE    mov         dword ptr ds:[5E1364],469DB0
 0046A5E8    mov         dword ptr ds:[5E1368],469DE4
 0046A5F2    mov         dword ptr ds:[5E136C],469E70
 0046A5FC    mov         dword ptr ds:[5E1370],469EA8
 0046A606    mov         dword ptr ds:[5E1374],469ED4
 0046A610    mov         dword ptr ds:[5E1378],469E18
 0046A61A    mov         dword ptr ds:[5E137C],469E44
 0046A624    ret
*}
end;

//0046A684
procedure sub_0046A684;
begin
{*
 0046A684    cmp         byte ptr ds:[5E1341],0;gvar_005E1341
>0046A68B    je          0046A693
 0046A68D    call        0046A47C
 0046A692    ret
 0046A693    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046A69A    je          0046A6A8
 0046A69C    mov         byte ptr ds:[5E1388],3;gvar_005E1388
>0046A6A3    jmp         0046A770
 0046A6A8    cmp         byte ptr ds:[5E1340],3;gvar_005E1340
>0046A6AF    je          0046A770
 0046A6B5    mov         byte ptr ds:[5E1340],3;gvar_005E1340
 0046A6BC    mov         eax,[005AE588];^gvar_005E0CE2
 0046A6C1    cmp         byte ptr [eax],0
>0046A6C4    jne         0046A6DA
 0046A6C6    mov         ecx,2D0
 0046A6CB    mov         edx,46A77C;'C:\GLScene\glscene_v_1000714\Source\base\XOpenGL.pas'
 0046A6D0    mov         eax,46A7BC;'Assertion failure'
 0046A6D5    call        @Assert
 0046A6DA    mov         dword ptr ds:[5E1344],469F00
 0046A6E4    mov         dword ptr ds:[5E1348],469F28
 0046A6EE    mov         dword ptr ds:[5E134C],469F4C
 0046A6F8    mov         dword ptr ds:[5E1350],469F78
 0046A702    mov         dword ptr ds:[5E1354],469F9C
 0046A70C    mov         dword ptr ds:[5E1358],469FD0
 0046A716    mov         dword ptr ds:[5E135C],469FF4
 0046A720    mov         dword ptr ds:[5E1360],46A038
 0046A72A    mov         dword ptr ds:[5E1364],46A07C
 0046A734    mov         dword ptr ds:[5E1368],46A0C0
 0046A73E    mov         dword ptr ds:[5E136C],46A16C
 0046A748    mov         dword ptr ds:[5E1370],46A1B8
 0046A752    mov         dword ptr ds:[5E1374],46A1EC
 0046A75C    mov         dword ptr ds:[5E1378],46A104
 0046A766    mov         dword ptr ds:[5E137C],46A138
 0046A770    ret
*}
end;

//0046A7D0
{*procedure sub_0046A7D0(?:?; ?:Longint);
begin
 0046A7D0    push        ebx
 0046A7D1    push        esi
 0046A7D2    mov         ebx,eax
 0046A7D4    lea         esi,[edx+1]
 0046A7D7    push        esi
 0046A7D8    mov         eax,5E1390;gvar_005E1390:?
 0046A7DD    mov         ecx,1
 0046A7E2    mov         edx,dword ptr ds:[46987C];.3
 0046A7E8    call        @DynArraySetLength
 0046A7ED    add         esp,4
 0046A7F0    xor         ecx,ecx
 0046A7F2    dec         esi
 0046A7F3    mov         dword ptr ds:[5E1394],esi;gvar_005E1394
 0046A7F9    mov         edx,dword ptr ds:[5E1394];gvar_005E1394
 0046A7FF    test        edx,edx
>0046A801    jl          0046A829
 0046A803    inc         edx
 0046A804    mov         eax,ebx
 0046A806    cmp         byte ptr ds:[5E1341],0;gvar_005E1341
>0046A80D    je          0046A817
 0046A80F    cmp         dword ptr [eax],84C1
>0046A815    je          0046A823
 0046A817    mov         ebx,dword ptr ds:[5E1390];gvar_005E1390:?
 0046A81D    mov         esi,dword ptr [eax]
 0046A81F    mov         dword ptr [ebx+ecx*4],esi
 0046A822    inc         ecx
 0046A823    add         eax,4
 0046A826    dec         edx
>0046A827    jne         0046A806
 0046A829    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046A830    je          0046A83C
 0046A832    mov         byte ptr ds:[5E1388],5;gvar_005E1388
 0046A839    pop         esi
 0046A83A    pop         ebx
 0046A83B    ret
 0046A83C    cmp         byte ptr ds:[5E1340],5;gvar_005E1340
>0046A843    je          0046A904
 0046A849    mov         byte ptr ds:[5E1340],5;gvar_005E1340
 0046A850    mov         eax,[005AE588];^gvar_005E0CE2
 0046A855    cmp         byte ptr [eax],0
>0046A858    jne         0046A86E
 0046A85A    mov         ecx,2FD
 0046A85F    mov         edx,46A910;'C:\GLScene\glscene_v_1000714\Source\base\XOpenGL.pas'
 0046A864    mov         eax,46A950;'Assertion failure'
 0046A869    call        @Assert
 0046A86E    mov         dword ptr ds:[5E1344],46989C
 0046A878    mov         dword ptr ds:[5E1348],4698D0
 0046A882    mov         dword ptr ds:[5E134C],469904
 0046A88C    mov         dword ptr ds:[5E1350],46993C
 0046A896    mov         dword ptr ds:[5E1354],469970
 0046A8A0    mov         dword ptr ds:[5E1358],4699AC
 0046A8AA    mov         dword ptr ds:[5E135C],4699E0
 0046A8B4    mov         dword ptr ds:[5E1360],469A30
 0046A8BE    mov         dword ptr ds:[5E1364],469A80
 0046A8C8    mov         dword ptr ds:[5E1368],469AD0
 0046A8D2    mov         dword ptr ds:[5E136C],469BB0
 0046A8DC    mov         dword ptr ds:[5E1370],469C04
 0046A8E6    mov         dword ptr ds:[5E1374],469C4C
 0046A8F0    mov         dword ptr ds:[5E1378],469B20
 0046A8FA    mov         dword ptr ds:[5E137C],469B68
 0046A904    pop         esi
 0046A905    pop         ebx
 0046A906    ret
end;*}

//0046A984
{*procedure sub_0046A984(?:?);
begin
 0046A984    push        ebp
 0046A985    mov         ebp,esp
 0046A987    push        0
 0046A989    push        ebx
 0046A98A    push        esi
 0046A98B    mov         esi,eax
 0046A98D    xor         eax,eax
 0046A98F    push        ebp
 0046A990    push        46AA1C
 0046A995    push        dword ptr fs:[eax]
 0046A998    mov         dword ptr fs:[eax],esp
 0046A99B    xor         ebx,ebx
 0046A99D    xor         eax,eax
 0046A99F    mov         ecx,eax
 0046A9A1    mov         edx,1
 0046A9A6    shl         edx,cl
 0046A9A8    test        edx,esi
>0046A9AA    je          0046A9AD
 0046A9AC    inc         ebx
 0046A9AD    inc         eax
 0046A9AE    cmp         eax,8
>0046A9B1    jne         0046A99F
 0046A9B3    push        ebx
 0046A9B4    lea         eax,[ebp-4]
 0046A9B7    mov         ecx,1
 0046A9BC    mov         edx,dword ptr ds:[46A964];.4
 0046A9C2    call        @DynArraySetLength
 0046A9C7    add         esp,4
 0046A9CA    xor         ebx,ebx
 0046A9CC    xor         eax,eax
 0046A9CE    mov         ecx,eax
 0046A9D0    mov         edx,1
 0046A9D5    shl         edx,cl
 0046A9D7    test        edx,esi
>0046A9D9    je          0046A9E8
 0046A9DB    lea         edx,[eax+84C0]
 0046A9E1    mov         ecx,dword ptr [ebp-4]
 0046A9E4    mov         dword ptr [ecx+ebx*4],edx
 0046A9E7    inc         ebx
 0046A9E8    inc         eax
 0046A9E9    cmp         eax,8
>0046A9EC    jne         0046A9CE
 0046A9EE    mov         eax,dword ptr [ebp-4]
 0046A9F1    call        @DynArrayHigh
 0046A9F6    mov         edx,eax
 0046A9F8    mov         eax,dword ptr [ebp-4]
 0046A9FB    call        0046A7D0
 0046AA00    xor         eax,eax
 0046AA02    pop         edx
 0046AA03    pop         ecx
 0046AA04    pop         ecx
 0046AA05    mov         dword ptr fs:[eax],edx
 0046AA08    push        46AA23
 0046AA0D    lea         eax,[ebp-4]
 0046AA10    mov         edx,dword ptr ds:[46A964];.4
 0046AA16    call        @DynArrayClear
 0046AA1B    ret
>0046AA1C    jmp         @HandleFinally
>0046AA21    jmp         0046AA0D
 0046AA23    pop         esi
 0046AA24    pop         ebx
 0046AA25    pop         ecx
 0046AA26    pop         ebp
 0046AA27    ret
end;*}

//0046AA28
{*procedure sub_0046AA28(?:?);
begin
 0046AA28    push        ebx
 0046AA29    mov         ebx,eax
 0046AA2B    call        0046AA3C
 0046AA30    or          eax,ebx
 0046AA32    call        0046A984
 0046AA37    pop         ebx
 0046AA38    ret
end;*}

//0046AA3C
{*function sub_0046AA3C:?;
begin
 0046AA3C    push        ebx
 0046AA3D    push        esi
 0046AA3E    cmp         dword ptr ds:[5E1384],0;gvar_005E1384
>0046AA45    jle         0046AA4E
 0046AA47    mov         al,[005E1388];gvar_005E1388
>0046AA4C    jmp         0046AA53
 0046AA4E    mov         al,[005E1340];gvar_005E1340
 0046AA53    xor         ebx,ebx
 0046AA55    sub         al,2
>0046AA57    je          0046AA67
 0046AA59    dec         al
>0046AA5B    je          0046AA6E
 0046AA5D    dec         al
>0046AA5F    je          0046AA75
 0046AA61    dec         al
>0046AA63    je          0046AA7C
>0046AA65    jmp         0046AAA6
 0046AA67    mov         ebx,1
>0046AA6C    jmp         0046AABA
 0046AA6E    mov         ebx,3
>0046AA73    jmp         0046AABA
 0046AA75    mov         ebx,2
>0046AA7A    jmp         0046AABA
 0046AA7C    mov         eax,[005E1394];gvar_005E1394
 0046AA81    test        eax,eax
>0046AA83    jb          0046AABA
 0046AA85    inc         eax
 0046AA86    xor         edx,edx
 0046AA88    mov         ecx,dword ptr ds:[5E1390];gvar_005E1390:?
 0046AA8E    mov         ecx,dword ptr [ecx+edx*4]
 0046AA91    sub         ecx,84C0
 0046AA97    mov         esi,1
 0046AA9C    shl         esi,cl
 0046AA9E    or          ebx,esi
 0046AAA0    inc         edx
 0046AAA1    dec         eax
>0046AAA2    jne         0046AA88
>0046AAA4    jmp         0046AABA
 0046AAA6    mov         ecx,349
 0046AAAB    mov         edx,46AAC8;'C:\GLScene\glscene_v_1000714\Source\base\XOpenGL.pas'
 0046AAB0    mov         eax,46AB08;'Assertion failure'
 0046AAB5    call        @Assert
 0046AABA    mov         eax,ebx
 0046AABC    pop         esi
 0046AABD    pop         ebx
 0046AABE    ret
end;*}

Initialization
//0046AB6C
{*
 0046AB6C    push        ebp
 0046AB6D    mov         ebp,esp
 0046AB6F    xor         eax,eax
 0046AB71    push        ebp
 0046AB72    push        46ABA0
 0046AB77    push        dword ptr fs:[eax]
 0046AB7A    mov         dword ptr fs:[eax],esp
 0046AB7D    sub         dword ptr ds:[5E1380],1
>0046AB84    jae         0046AB92
 0046AB86    mov         byte ptr ds:[5E1340],0;gvar_005E1340
 0046AB8D    call        0046A3C0
 0046AB92    xor         eax,eax
 0046AB94    pop         edx
 0046AB95    pop         ecx
 0046AB96    pop         ecx
 0046AB97    mov         dword ptr fs:[eax],edx
 0046AB9A    push        46ABA7
 0046AB9F    ret
>0046ABA0    jmp         @HandleFinally
>0046ABA5    jmp         0046AB9F
 0046ABA7    pop         ebp
 0046ABA8    ret
*}
Finalization
//0046AB1C
{*
 0046AB1C    push        ebp
 0046AB1D    mov         ebp,esp
 0046AB1F    xor         eax,eax
 0046AB21    push        ebp
 0046AB22    push        46AB63
 0046AB27    push        dword ptr fs:[eax]
 0046AB2A    mov         dword ptr fs:[eax],esp
 0046AB2D    inc         dword ptr ds:[5E1380]
>0046AB33    jne         0046AB55
 0046AB35    mov         eax,5E1390;gvar_005E1390:?
 0046AB3A    mov         edx,dword ptr ds:[46987C];.3
 0046AB40    call        @DynArrayClear
 0046AB45    mov         eax,5E138C;gvar_005E138C:?
 0046AB4A    mov         edx,dword ptr ds:[46985C];.2
 0046AB50    call        @DynArrayClear
 0046AB55    xor         eax,eax
 0046AB57    pop         edx
 0046AB58    pop         ecx
 0046AB59    pop         ecx
 0046AB5A    mov         dword ptr fs:[eax],edx
 0046AB5D    push        46AB6A
 0046AB62    ret
>0046AB63    jmp         @HandleFinally
>0046AB68    jmp         0046AB62
 0046AB6A    pop         ebp
 0046AB6B    ret
*}
end.