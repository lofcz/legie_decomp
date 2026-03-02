//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit TypInfo;

interface

uses
  SysUtils, Classes;

    function GetTypeData(TypeInfo:PTypeInfo):PTypeData;//00416818
    function GetEnumName(TypeInfo:PTypeInfo; Value:Integer):AnsiString;//00416824
    function GetEnumNameValue(TypeInfo:PTypeInfo; const Name:AnsiString):Integer;//004168FC
    function GetEnumValue(TypeInfo:PTypeInfo; const Name:AnsiString):Integer;//00416948
    function GetPropInfo(TypeInfo:PTypeInfo; const PropName:AnsiString):PPropInfo;//004169AC
    procedure GetPropInfos(TypeInfo:PTypeInfo; PropList:PPropList);//00416A1C
    function IsStoredProp(Instance:TObject; PropInfo:PPropInfo):Boolean;//00416A70
    function GetOrdProp(Instance:TObject; PropInfo:PPropInfo):Longint;//00416AA0
    procedure SetOrdProp(Instance:TObject; PropInfo:PPropInfo; Value:Longint);//00416B14
    //procedure GetShortStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:ShortString; const _Dv_:?);//00416B70
    procedure SetShortStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:ShortString);//00416BB4
    procedure GetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//00416C08
    procedure SetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//00416C30
    procedure AssignLongStr(var Dest:AnsiString; const Source:AnsiString);//00416C64
    procedure GetLongStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//00416C78
    procedure SetLongStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//00416CB8
    procedure GetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//00416CF8
    procedure SetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//00416D50
    function GetStrProp(Instance:TObject; PropInfo:PPropInfo):AnsiString;//00416DA8
    procedure SetStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//00416DE8
    function GetWideStrProp(Instance:TObject; PropInfo:PPropInfo):WideString;//00416E14
    procedure SetWideStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:WideString);//00416EFC
    function GetFloatProp(Instance:TObject; PropInfo:PPropInfo):Extended;//00416FD0
    procedure SetFloatProp(Instance:TObject; PropInfo:PPropInfo; const Value:Extended);//004170E8
    procedure AssignVariant(var Dest:Variant; const Source:Variant);//004172E0
    function GetVariantProp(Instance:TObject; PropInfo:PPropInfo):Variant;//004172F4
    procedure SetVariantProp(Instance:TObject; PropInfo:PPropInfo; const Value:Variant);//00417334
    function GetMethodProp(Instance:TObject; PropInfo:PPropInfo):TMethod;//00417374
    procedure SetMethodProp(Instance:TObject; PropInfo:PPropInfo; const Value:TMethod);//004173B4
    function GetInt64Prop(Instance:TObject; PropInfo:PPropInfo):Int64;//004173EC
    procedure SetInt64Prop(Instance:TObject; PropInfo:PPropInfo; const Value:Int64);//00417414
    function GetInterfaceProp(Instance:TObject; PropInfo:PPropInfo):IInterface;//00417450
    procedure SetInterfaceProp(Instance:TObject; PropInfo:PPropInfo; const Value:IInterface);//004174D0

implementation

//00416818
function GetTypeData(TypeInfo:PTypeInfo):PTypeData;
begin
{*
 00416818    xor         edx,edx
 0041681A    mov         dl,byte ptr [eax+1]
 0041681D    lea         eax,[eax+edx+2]
 00416821    ret
*}
end;

//00416824
function GetEnumName(TypeInfo:PTypeInfo; Value:Integer):AnsiString;
begin
{*
 00416824    push        ebp
 00416825    mov         ebp,esp
 00416827    push        0
 00416829    push        ebx
 0041682A    push        esi
 0041682B    push        edi
 0041682C    mov         edi,ecx
 0041682E    mov         ebx,edx
 00416830    mov         esi,eax
 00416832    xor         eax,eax
 00416834    push        ebp
 00416835    push        4168E2
 0041683A    push        dword ptr fs:[eax]
 0041683D    mov         dword ptr fs:[eax],esp
 00416840    cmp         byte ptr [esi],1
>00416843    jne         00416850
 00416845    mov         edx,edi
 00416847    mov         eax,ebx
 00416849    call        IntToStr
>0041684E    jmp         004168CC
 00416850    mov         eax,esi
 00416852    call        GetTypeData
 00416857    mov         eax,dword ptr [eax+9]
 0041685A    mov         eax,dword ptr [eax]
 0041685C    call        GetTypeData
 00416861    cmp         esi,dword ptr ds:[401000];Boolean
>00416867    je          0041686F
 00416869    cmp         dword ptr [eax+1],0
>0041686D    jge         004168B0
 0041686F    mov         eax,edi
 00416871    test        ebx,ebx
 00416873    setne       dl
 00416876    and         edx,7F
 00416879    mov         edx,dword ptr [edx*4+5AC4DC];^'False'
 00416880    call        @LStrAsg
 00416885    mov         eax,[005AE748]
 0041688A    mov         eax,dword ptr [eax]
 0041688C    mov         edx,4168F8;'0x'
 00416891    call        SameText
 00416896    test        al,al
>00416898    je          004168CC
 0041689A    lea         edx,[ebp-4]
 0041689D    mov         eax,dword ptr [edi]
 0041689F    call        LowerCase
 004168A4    mov         edx,dword ptr [ebp-4]
 004168A7    mov         eax,edi
 004168A9    call        @LStrAsg
>004168AE    jmp         004168CC
 004168B0    lea         esi,[eax+0D]
 004168B3    test        ebx,ebx
>004168B5    je          004168C3
 004168B7    xor         eax,eax
 004168B9    mov         al,byte ptr [esi]
 004168BB    inc         eax
 004168BC    add         esi,eax
 004168BE    dec         ebx
 004168BF    test        ebx,ebx
>004168C1    jne         004168B7
 004168C3    mov         eax,edi
 004168C5    mov         edx,esi
 004168C7    call        @LStrFromString
 004168CC    xor         eax,eax
 004168CE    pop         edx
 004168CF    pop         ecx
 004168D0    pop         ecx
 004168D1    mov         dword ptr fs:[eax],edx
 004168D4    push        4168E9
 004168D9    lea         eax,[ebp-4]
 004168DC    call        @LStrClr
 004168E1    ret
>004168E2    jmp         @HandleFinally
>004168E7    jmp         004168D9
 004168E9    pop         edi
 004168EA    pop         esi
 004168EB    pop         ebx
 004168EC    pop         ecx
 004168ED    pop         ebp
 004168EE    ret
*}
end;

//004168FC
function GetEnumNameValue(TypeInfo:PTypeInfo; const Name:AnsiString):Integer;
begin
{*
 004168FC    push        ebx
 004168FD    push        esi
 004168FE    push        edi
 004168FF    test        edx,edx
>00416901    je          0041693E
 00416903    xor         ecx,ecx
 00416905    mov         cl,byte ptr [eax+1]
 00416908    mov         eax,dword ptr [eax+ecx+0B]
 0041690C    mov         eax,dword ptr [eax]
 0041690E    mov         cl,byte ptr [eax+1]
 00416911    lea         esi,[eax+ecx+0F]
 00416915    mov         edi,dword ptr [eax+ecx+7]
 00416919    xor         eax,eax
 0041691B    mov         cl,byte ptr [esi]
 0041691D    cmp         ecx,dword ptr [edx-4]
>00416920    jne         00416935
 00416922    mov         bl,byte ptr [ecx+edx-1]
 00416926    xor         bl,byte ptr [ecx+esi]
 00416929    test        bl,0DF
>0041692C    jne         00416933
 0041692E    dec         ecx
>0041692F    jne         00416922
>00416931    jmp         00416941
 00416933    mov         cl,byte ptr [esi]
 00416935    inc         eax
 00416936    lea         esi,[ecx+esi+1]
 0041693A    cmp         eax,edi
>0041693C    jle         0041691B
 0041693E    or          eax,0FFFFFFFF
 00416941    pop         edi
 00416942    pop         esi
 00416943    pop         ebx
 00416944    ret
*}
end;

//00416948
function GetEnumValue(TypeInfo:PTypeInfo; const Name:AnsiString):Integer;
begin
{*
 00416948    push        ebx
 00416949    push        esi
 0041694A    mov         esi,edx
 0041694C    mov         ebx,eax
 0041694E    cmp         byte ptr [ebx],1
>00416951    jne         0041695D
 00416953    mov         eax,esi
 00416955    call        StrToInt
 0041695A    pop         esi
 0041695B    pop         ebx
 0041695C    ret
 0041695D    mov         eax,ebx
 0041695F    call        GetTypeData
 00416964    cmp         dword ptr [eax+1],0
>00416968    jge         0041699E
 0041696A    mov         edx,dword ptr ds:[5AC4DC];^'False'
 00416970    mov         eax,esi
 00416972    call        SameText
 00416977    test        al,al
>00416979    je          0041697F
 0041697B    xor         eax,eax
>0041697D    jmp         004169A7
 0041697F    mov         edx,dword ptr ds:[5AC4E0];^'True'
 00416985    mov         eax,esi
 00416987    call        SameText
 0041698C    test        al,al
>0041698E    je          00416995
 00416990    or          eax,0FFFFFFFF
>00416993    jmp         004169A7
 00416995    mov         eax,esi
 00416997    call        StrToInt
>0041699C    jmp         004169A7
 0041699E    mov         edx,esi
 004169A0    mov         eax,ebx
 004169A2    call        GetEnumNameValue
 004169A7    pop         esi
 004169A8    pop         ebx
 004169A9    ret
*}
end;

//004169AC
function GetPropInfo(TypeInfo:PTypeInfo; const PropName:AnsiString):PPropInfo;
begin
{*
 004169AC    push        ebx
 004169AD    push        esi
 004169AE    push        edi
 004169AF    test        eax,eax
>004169B1    je          00416A18
 004169B3    mov         ecx,edx
 004169B5    or          edx,edx
>004169B7    je          004169C4
 004169B9    mov         cl,byte ptr [edx-4]
 004169BC    mov         ch,byte ptr [edx]
 004169BE    and         ecx,0DFFF
 004169C4    xor         ebx,ebx
 004169C6    mov         bl,byte ptr [eax+1]
 004169C9    lea         esi,[eax+ebx+2]
 004169CD    mov         bl,byte ptr [esi+0A]
 004169D0    movzx       edi,word ptr [esi+ebx+0B]
 004169D5    test        edi,edi
>004169D7    je          004169F1
 004169D9    lea         eax,[esi+ebx+0D]
 004169DD    mov         bx,word ptr [eax+1A]
 004169E1    and         bh,0DF
 004169E4    cmp         ebx,ecx
>004169E6    je          00416A06
 004169E8    mov         bh,0
 004169EA    dec         edi
 004169EB    lea         eax,[eax+ebx+1B]
>004169EF    jne         004169DD
 004169F1    mov         eax,dword ptr [esi+4]
 004169F4    test        eax,eax
>004169F6    je          00416A18
 004169F8    mov         eax,dword ptr [eax]
>004169FA    jmp         004169C4
 004169FC    mov         ch,byte ptr [edx]
 004169FE    and         ch,0DF
 00416A01    mov         bl,byte ptr [eax+1A]
>00416A04    jmp         004169E8
 00416A06    mov         bh,0
 00416A08    mov         ch,byte ptr [ebx+edx-1]
 00416A0C    xor         ch,byte ptr [eax+ebx+1A]
 00416A10    test        ch,0DF
>00416A13    jne         004169FC
 00416A15    dec         ebx
>00416A16    jne         00416A08
 00416A18    pop         edi
 00416A19    pop         esi
 00416A1A    pop         ebx
 00416A1B    ret
*}
end;

//00416A1C
procedure GetPropInfos(TypeInfo:PTypeInfo; PropList:PPropList);
begin
{*
 00416A1C    push        ebx
 00416A1D    push        esi
 00416A1E    push        edi
 00416A1F    xor         ecx,ecx
 00416A21    mov         esi,eax
 00416A23    mov         cl,byte ptr [eax+1]
 00416A26    mov         edi,edx
 00416A28    xor         eax,eax
 00416A2A    movzx       ecx,word ptr [esi+ecx+0A]
 00416A2F    rep stos    dword ptr [edi]
 00416A31    mov         cl,byte ptr [esi+1]
 00416A34    lea         esi,[esi+ecx+2]
 00416A38    mov         cl,byte ptr [esi+0A]
 00416A3B    movzx       eax,word ptr [esi+ecx+0B]
 00416A40    test        eax,eax
>00416A42    je          00416A5F
 00416A44    lea         edi,[esi+ecx+0D]
 00416A48    movzx       ebx,word ptr [edi+18]
 00416A4C    mov         cl,byte ptr [edi+1A]
 00416A4F    cmp         dword ptr [edx+ebx*4],0
>00416A53    jne         00416A58
 00416A55    mov         dword ptr [edx+ebx*4],edi
 00416A58    lea         edi,[edi+ecx+1B]
 00416A5C    dec         eax
>00416A5D    jne         00416A48
 00416A5F    mov         esi,dword ptr [esi+4]
 00416A62    xor         ecx,ecx
 00416A64    test        esi,esi
>00416A66    je          00416A6C
 00416A68    mov         esi,dword ptr [esi]
>00416A6A    jmp         00416A31
 00416A6C    pop         edi
 00416A6D    pop         esi
 00416A6E    pop         ebx
 00416A6F    ret
*}
end;

//00416A70
function IsStoredProp(Instance:TObject; PropInfo:PPropInfo):Boolean;
begin
{*
 00416A70    mov         ecx,dword ptr [edx+0C]
 00416A73    test        ecx,0FFFFFF00
>00416A79    je          00416A9A
 00416A7B    cmp         byte ptr [edx+0F],0FE
 00416A7F    mov         edx,dword ptr [edx+10]
>00416A82    jb          00416A8E
>00416A84    ja          00416A91
 00416A86    movsx       ecx,cx
 00416A89    add         ecx,dword ptr [eax]
 00416A8B    call        dword ptr [ecx]
 00416A8D    ret
 00416A8E    call        ecx
 00416A90    ret
 00416A91    and         ecx,0FFFFFF
 00416A97    mov         cl,byte ptr [ecx+eax]
 00416A9A    mov         al,cl
 00416A9C    ret
*}
end;

//00416AA0
function GetOrdProp(Instance:TObject; PropInfo:PPropInfo):Longint;
begin
{*
 00416AA0    push        ebx
 00416AA1    push        edi
 00416AA2    mov         edi,dword ptr [edx]
 00416AA4    mov         edi,dword ptr [edi]
 00416AA6    mov         bl,4
 00416AA8    cmp         byte ptr [edi],7
>00416AAB    je          00416AB6
 00416AAD    xor         ecx,ecx
 00416AAF    mov         cl,byte ptr [edi+1]
 00416AB2    mov         bl,byte ptr [edi+ecx+2]
 00416AB6    mov         ecx,dword ptr [edx+4]
 00416AB9    cmp         byte ptr [edx+7],0FE
 00416ABD    mov         edx,dword ptr [edx+10]
>00416AC0    jb          00416ACD
>00416AC2    ja          00416AD1
 00416AC4    movsx       ecx,cx
 00416AC7    add         ecx,dword ptr [eax]
 00416AC9    call        dword ptr [ecx]
>00416ACB    jmp         00416AEA
 00416ACD    call        ecx
>00416ACF    jmp         00416AEA
 00416AD1    and         ecx,0FFFFFF
 00416AD7    add         ecx,eax
 00416AD9    mov         al,byte ptr [ecx]
 00416ADB    cmp         bl,2
>00416ADE    jb          00416AEA
 00416AE0    mov         ax,word ptr [ecx]
 00416AE3    cmp         bl,4
>00416AE6    jb          00416AEA
 00416AE8    mov         eax,dword ptr [ecx]
 00416AEA    cmp         bl,4
>00416AED    jae         00416B0E
 00416AEF    cmp         bl,2
>00416AF2    jae         00416B04
 00416AF4    cmp         bl,0
 00416AF7    movsx       eax,al
>00416AFA    je          00416B0E
 00416AFC    and         eax,0FF
 00416B01    pop         edi
 00416B02    pop         ebx
 00416B03    ret
 00416B04    movsx       eax,ax
>00416B07    je          00416B0E
 00416B09    and         eax,0FFFF
 00416B0E    pop         edi
 00416B0F    pop         ebx
 00416B10    ret
*}
end;

//00416B14
procedure SetOrdProp(Instance:TObject; PropInfo:PPropInfo; Value:Longint);
begin
{*
 00416B14    push        ebx
 00416B15    push        esi
 00416B16    push        edi
 00416B17    mov         edi,edx
 00416B19    mov         esi,dword ptr [edi]
 00416B1B    mov         esi,dword ptr [esi]
 00416B1D    mov         bl,4
 00416B1F    cmp         byte ptr [esi],7
>00416B22    je          00416B2D
 00416B24    xor         ebx,ebx
 00416B26    mov         bl,byte ptr [esi+1]
 00416B29    mov         bl,byte ptr [esi+ebx+2]
 00416B2D    mov         edx,dword ptr [edi+10]
 00416B30    cmp         edx,80000000
>00416B36    jne         00416B3A
 00416B38    mov         edx,ecx
 00416B3A    mov         esi,dword ptr [edi+8]
 00416B3D    cmp         byte ptr [edi+0B],0FE
>00416B41    ja          00416B52
>00416B43    jb          00416B4E
 00416B45    movsx       esi,si
 00416B48    add         esi,dword ptr [eax]
 00416B4A    call        dword ptr [esi]
>00416B4C    jmp         00416B6B
 00416B4E    call        esi
>00416B50    jmp         00416B6B
 00416B52    and         esi,0FFFFFF
 00416B58    add         eax,esi
 00416B5A    mov         byte ptr [eax],cl
 00416B5C    cmp         bl,2
>00416B5F    jb          00416B6B
 00416B61    mov         word ptr [eax],cx
 00416B64    cmp         bl,4
>00416B67    jb          00416B6B
 00416B69    mov         dword ptr [eax],ecx
 00416B6B    pop         edi
 00416B6C    pop         esi
 00416B6D    pop         ebx
 00416B6E    ret
*}
end;

//00416B70
{*procedure GetShortStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:ShortString; const _Dv_:?);
begin
 00416B70    push        ebp
 00416B71    mov         ebp,esp
 00416B73    push        esi
 00416B74    push        edi
 00416B75    mov         edi,edx
 00416B77    mov         edx,dword ptr [edi+10]
 00416B7A    cmp         edx,80000000
>00416B80    jne         00416B84
 00416B82    mov         edx,ecx
 00416B84    mov         esi,dword ptr [edi+4]
 00416B87    cmp         byte ptr [edi+7],0FE
>00416B8B    ja          00416B9C
>00416B8D    jb          00416B98
 00416B8F    movsx       esi,si
 00416B92    add         esi,dword ptr [eax]
 00416B94    call        dword ptr [esi]
>00416B96    jmp         00416BAD
 00416B98    call        esi
>00416B9A    jmp         00416BAD
 00416B9C    and         esi,0FFFFFF
 00416BA2    add         esi,eax
 00416BA4    mov         edi,ecx
 00416BA6    xor         ecx,ecx
 00416BA8    mov         cl,byte ptr [esi]
 00416BAA    inc         ecx
 00416BAB    rep movs    byte ptr [edi],byte ptr [esi]
 00416BAD    pop         edi
 00416BAE    pop         esi
 00416BAF    pop         ebp
 00416BB0    ret         4
end;*}

//00416BB4
procedure SetShortStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:ShortString);
begin
{*
 00416BB4    push        esi
 00416BB5    push        edi
 00416BB6    mov         esi,edx
 00416BB8    mov         edx,dword ptr [esi+10]
 00416BBB    cmp         edx,80000000
>00416BC1    jne         00416BC5
 00416BC3    mov         edx,ecx
 00416BC5    mov         edi,dword ptr [esi+8]
 00416BC8    cmp         byte ptr [esi+0B],0FE
>00416BCC    ja          00416BDF
>00416BCE    jb          00416BDA
 00416BD0    movsx       edi,di
 00416BD3    add         edi,dword ptr [eax]
 00416BD5    call        dword ptr [edi]
 00416BD7    pop         edi
 00416BD8    pop         esi
 00416BD9    ret
 00416BDA    call        edi
 00416BDC    pop         edi
 00416BDD    pop         esi
 00416BDE    ret
 00416BDF    and         edi,0FFFFFF
 00416BE5    add         edi,eax
 00416BE7    mov         eax,dword ptr [esi]
 00416BE9    mov         eax,dword ptr [eax]
 00416BEB    mov         esi,ecx
 00416BED    xor         ecx,ecx
 00416BEF    mov         cl,byte ptr [eax+1]
 00416BF2    mov         cl,byte ptr [eax+ecx+2]
 00416BF6    lods        byte ptr [esi]
 00416BF7    cmp         al,cl
>00416BF9    jb          00416BFD
 00416BFB    mov         al,cl
 00416BFD    stos        byte ptr [edi]
 00416BFE    mov         cl,al
 00416C00    rep movs    byte ptr [edi],byte ptr [esi]
 00416C02    pop         edi
 00416C03    pop         esi
 00416C04    ret
*}
end;

//00416C08
procedure GetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 00416C08    push        ebx
 00416C09    add         esp,0FFFFFF00
 00416C0F    mov         ebx,ecx
 00416C11    push        0FF
 00416C16    lea         ecx,[esp+4]
 00416C1A    call        GetShortStrProp
 00416C1F    mov         eax,ebx
 00416C21    mov         edx,esp
 00416C23    call        @LStrFromString
 00416C28    add         esp,100
 00416C2E    pop         ebx
 00416C2F    ret
*}
end;

//00416C30
procedure SetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 00416C30    push        ebx
 00416C31    push        esi
 00416C32    push        edi
 00416C33    add         esp,0FFFFFF00
 00416C39    mov         edi,ecx
 00416C3B    mov         esi,edx
 00416C3D    mov         ebx,eax
 00416C3F    mov         eax,esp
 00416C41    mov         edx,edi
 00416C43    mov         ecx,0FF
 00416C48    call        @LStrToString
 00416C4D    mov         ecx,esp
 00416C4F    mov         edx,esi
 00416C51    mov         eax,ebx
 00416C53    call        SetShortStrProp
 00416C58    add         esp,100
 00416C5E    pop         edi
 00416C5F    pop         esi
 00416C60    pop         ebx
 00416C61    ret
*}
end;

//00416C64
procedure AssignLongStr(var Dest:AnsiString; const Source:AnsiString);
begin
{*
 00416C64    push        ebx
 00416C65    push        esi
 00416C66    mov         esi,edx
 00416C68    mov         ebx,eax
 00416C6A    mov         eax,ebx
 00416C6C    mov         edx,esi
 00416C6E    call        @LStrAsg
 00416C73    pop         esi
 00416C74    pop         ebx
 00416C75    ret
*}
end;

//00416C78
procedure GetLongStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 00416C78    push        esi
 00416C79    push        edi
 00416C7A    mov         edi,edx
 00416C7C    mov         edx,dword ptr [edi+10]
 00416C7F    cmp         edx,80000000
>00416C85    jne         00416C89
 00416C87    mov         edx,ecx
 00416C89    mov         esi,dword ptr [edi+4]
 00416C8C    cmp         byte ptr [edi+7],0FE
>00416C90    ja          00416CA3
>00416C92    jb          00416C9E
 00416C94    movsx       esi,si
 00416C97    add         esi,dword ptr [eax]
 00416C99    call        dword ptr [esi]
 00416C9B    pop         edi
 00416C9C    pop         esi
 00416C9D    ret
 00416C9E    call        esi
 00416CA0    pop         edi
 00416CA1    pop         esi
 00416CA2    ret
 00416CA3    and         esi,0FFFFFF
 00416CA9    mov         edx,dword ptr [esi+eax]
 00416CAC    mov         eax,ecx
 00416CAE    call        AssignLongStr
 00416CB3    pop         edi
 00416CB4    pop         esi
 00416CB5    ret
*}
end;

//00416CB8
procedure SetLongStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 00416CB8    push        esi
 00416CB9    push        edi
 00416CBA    mov         esi,edx
 00416CBC    mov         edx,dword ptr [esi+10]
 00416CBF    cmp         edx,80000000
>00416CC5    jne         00416CC9
 00416CC7    mov         edx,ecx
 00416CC9    mov         edi,dword ptr [esi+8]
 00416CCC    cmp         byte ptr [esi+0B],0FE
>00416CD0    ja          00416CE3
>00416CD2    jb          00416CDE
 00416CD4    movsx       edi,di
 00416CD7    add         edi,dword ptr [eax]
 00416CD9    call        dword ptr [edi]
 00416CDB    pop         edi
 00416CDC    pop         esi
 00416CDD    ret
 00416CDE    call        edi
 00416CE0    pop         edi
 00416CE1    pop         esi
 00416CE2    ret
 00416CE3    and         edi,0FFFFFF
 00416CE9    add         eax,edi
 00416CEB    mov         edx,ecx
 00416CED    call        AssignLongStr
 00416CF2    pop         edi
 00416CF3    pop         esi
 00416CF4    ret
*}
end;

//00416CF8
procedure GetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 00416CF8    push        ebp
 00416CF9    mov         ebp,esp
 00416CFB    push        0
 00416CFD    push        ebx
 00416CFE    push        esi
 00416CFF    push        edi
 00416D00    mov         edi,ecx
 00416D02    mov         esi,edx
 00416D04    mov         ebx,eax
 00416D06    xor         eax,eax
 00416D08    push        ebp
 00416D09    push        416D40
 00416D0E    push        dword ptr fs:[eax]
 00416D11    mov         dword ptr fs:[eax],esp
 00416D14    lea         ecx,[ebp-4]
 00416D17    mov         edx,esi
 00416D19    mov         eax,ebx
 00416D1B    call        GetWideStrProp
 00416D20    mov         edx,dword ptr [ebp-4]
 00416D23    mov         eax,edi
 00416D25    call        @LStrFromWStr
 00416D2A    xor         eax,eax
 00416D2C    pop         edx
 00416D2D    pop         ecx
 00416D2E    pop         ecx
 00416D2F    mov         dword ptr fs:[eax],edx
 00416D32    push        416D47
 00416D37    lea         eax,[ebp-4]
 00416D3A    call        @WStrClr
 00416D3F    ret
>00416D40    jmp         @HandleFinally
>00416D45    jmp         00416D37
 00416D47    pop         edi
 00416D48    pop         esi
 00416D49    pop         ebx
 00416D4A    pop         ecx
 00416D4B    pop         ebp
 00416D4C    ret
*}
end;

//00416D50
procedure SetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 00416D50    push        ebp
 00416D51    mov         ebp,esp
 00416D53    push        0
 00416D55    push        ebx
 00416D56    push        esi
 00416D57    push        edi
 00416D58    mov         edi,ecx
 00416D5A    mov         esi,edx
 00416D5C    mov         ebx,eax
 00416D5E    xor         eax,eax
 00416D60    push        ebp
 00416D61    push        416D98
 00416D66    push        dword ptr fs:[eax]
 00416D69    mov         dword ptr fs:[eax],esp
 00416D6C    lea         eax,[ebp-4]
 00416D6F    mov         edx,edi
 00416D71    call        @WStrFromLStr
 00416D76    mov         ecx,dword ptr [ebp-4]
 00416D79    mov         edx,esi
 00416D7B    mov         eax,ebx
 00416D7D    call        SetWideStrProp
 00416D82    xor         eax,eax
 00416D84    pop         edx
 00416D85    pop         ecx
 00416D86    pop         ecx
 00416D87    mov         dword ptr fs:[eax],edx
 00416D8A    push        416D9F
 00416D8F    lea         eax,[ebp-4]
 00416D92    call        @WStrClr
 00416D97    ret
>00416D98    jmp         @HandleFinally
>00416D9D    jmp         00416D8F
 00416D9F    pop         edi
 00416DA0    pop         esi
 00416DA1    pop         ebx
 00416DA2    pop         ecx
 00416DA3    pop         ebp
 00416DA4    ret
*}
end;

//00416DA8
function GetStrProp(Instance:TObject; PropInfo:PPropInfo):AnsiString;
begin
{*
 00416DA8    push        ebx
 00416DA9    mov         ebx,ecx
 00416DAB    mov         ecx,dword ptr [edx]
 00416DAD    mov         ecx,dword ptr [ecx]
 00416DAF    mov         cl,byte ptr [ecx]
 00416DB1    sub         cl,5
>00416DB4    je          00416DC1
 00416DB6    sub         cl,5
>00416DB9    je          00416DCA
 00416DBB    dec         cl
>00416DBD    je          00416DD3
>00416DBF    jmp         00416DDC
 00416DC1    mov         ecx,ebx
 00416DC3    call        GetShortStrPropAsLongStr
 00416DC8    pop         ebx
 00416DC9    ret
 00416DCA    mov         ecx,ebx
 00416DCC    call        GetLongStrProp
 00416DD1    pop         ebx
 00416DD2    ret
 00416DD3    mov         ecx,ebx
 00416DD5    call        GetWideStrPropAsLongStr
 00416DDA    pop         ebx
 00416DDB    ret
 00416DDC    mov         eax,ebx
 00416DDE    call        @LStrClr
 00416DE3    pop         ebx
 00416DE4    ret
*}
end;

//00416DE8
procedure SetStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 00416DE8    push        ebx
 00416DE9    mov         ebx,dword ptr [edx]
 00416DEB    mov         ebx,dword ptr [ebx]
 00416DED    mov         bl,byte ptr [ebx]
 00416DEF    sub         bl,5
>00416DF2    je          00416DFF
 00416DF4    sub         bl,5
>00416DF7    je          00416E06
 00416DF9    dec         bl
>00416DFB    je          00416E0D
>00416DFD    jmp         00416E12
 00416DFF    call        SetShortStrPropAsLongStr
 00416E04    pop         ebx
 00416E05    ret
 00416E06    call        SetLongStrProp
 00416E0B    pop         ebx
 00416E0C    ret
 00416E0D    call        SetWideStrPropAsLongStr
 00416E12    pop         ebx
 00416E13    ret
*}
end;

//00416E14
function GetWideStrProp(Instance:TObject; PropInfo:PPropInfo):WideString;
begin
{*
 00416E14    push        ebp
 00416E15    mov         ebp,esp
 00416E17    add         esp,0FFFFFFF0
 00416E1A    push        ebx
 00416E1B    push        esi
 00416E1C    xor         ebx,ebx
 00416E1E    mov         dword ptr [ebp-10],ebx
 00416E21    mov         dword ptr [ebp-4],ecx
 00416E24    mov         ebx,edx
 00416E26    mov         esi,eax
 00416E28    xor         eax,eax
 00416E2A    push        ebp
 00416E2B    push        416EEC
 00416E30    push        dword ptr fs:[eax]
 00416E33    mov         dword ptr fs:[eax],esp
 00416E36    mov         eax,dword ptr [ebx]
 00416E38    mov         eax,dword ptr [eax]
 00416E3A    mov         al,byte ptr [eax]
 00416E3C    sub         al,5
>00416E3E    je          00416E4D
 00416E40    sub         al,5
>00416E42    je          00416E4D
 00416E44    dec         al
>00416E46    je          00416E66
>00416E48    jmp         00416ECE
 00416E4D    lea         ecx,[ebp-10]
 00416E50    mov         edx,ebx
 00416E52    mov         eax,esi
 00416E54    call        GetStrProp
 00416E59    mov         edx,dword ptr [ebp-10]
 00416E5C    mov         eax,dword ptr [ebp-4]
 00416E5F    call        @WStrFromLStr
>00416E64    jmp         00416ED6
 00416E66    mov         eax,dword ptr [ebx+4]
 00416E69    mov         edx,eax
 00416E6B    and         edx,0FF000000
 00416E71    cmp         edx,0FF000000
>00416E77    jne         00416E8F
 00416E79    mov         ebx,eax
 00416E7B    and         ebx,0FFFFFF
 00416E81    add         ebx,esi
 00416E83    mov         eax,dword ptr [ebp-4]
 00416E86    mov         edx,dword ptr [ebx]
 00416E88    call        @WStrAsg
>00416E8D    jmp         00416ED6
 00416E8F    cmp         edx,0FE000000
>00416E95    jne         00416EA5
 00416E97    mov         edx,dword ptr [esi]
 00416E99    movsx       eax,ax
 00416E9C    add         edx,eax
 00416E9E    mov         eax,dword ptr [edx]
 00416EA0    mov         dword ptr [ebp-0C],eax
>00416EA3    jmp         00416EA8
 00416EA5    mov         dword ptr [ebp-0C],eax
 00416EA8    mov         dword ptr [ebp-8],esi
 00416EAB    mov         esi,dword ptr [ebx+10]
 00416EAE    cmp         esi,80000000
>00416EB4    jne         00416EC1
 00416EB6    mov         edx,dword ptr [ebp-4]
 00416EB9    mov         eax,dword ptr [ebp-8]
 00416EBC    call        dword ptr [ebp-0C]
>00416EBF    jmp         00416ED6
 00416EC1    mov         ecx,dword ptr [ebp-4]
 00416EC4    mov         edx,esi
 00416EC6    mov         eax,dword ptr [ebp-8]
 00416EC9    call        dword ptr [ebp-0C]
>00416ECC    jmp         00416ED6
 00416ECE    mov         eax,dword ptr [ebp-4]
 00416ED1    call        @WStrClr
 00416ED6    xor         eax,eax
 00416ED8    pop         edx
 00416ED9    pop         ecx
 00416EDA    pop         ecx
 00416EDB    mov         dword ptr fs:[eax],edx
 00416EDE    push        416EF3
 00416EE3    lea         eax,[ebp-10]
 00416EE6    call        @LStrClr
 00416EEB    ret
>00416EEC    jmp         @HandleFinally
>00416EF1    jmp         00416EE3
 00416EF3    pop         esi
 00416EF4    pop         ebx
 00416EF5    mov         esp,ebp
 00416EF7    pop         ebp
 00416EF8    ret
*}
end;

//00416EFC
procedure SetWideStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:WideString);
begin
{*
 00416EFC    push        ebp
 00416EFD    mov         ebp,esp
 00416EFF    add         esp,0FFFFFFF4
 00416F02    push        ebx
 00416F03    push        esi
 00416F04    push        edi
 00416F05    xor         ebx,ebx
 00416F07    mov         dword ptr [ebp-0C],ebx
 00416F0A    mov         edi,ecx
 00416F0C    mov         ebx,edx
 00416F0E    mov         esi,eax
 00416F10    xor         eax,eax
 00416F12    push        ebp
 00416F13    push        416FC2
 00416F18    push        dword ptr fs:[eax]
 00416F1B    mov         dword ptr fs:[eax],esp
 00416F1E    mov         eax,dword ptr [ebx]
 00416F20    mov         eax,dword ptr [eax]
 00416F22    mov         al,byte ptr [eax]
 00416F24    sub         al,5
>00416F26    je          00416F32
 00416F28    sub         al,5
>00416F2A    je          00416F32
 00416F2C    dec         al
>00416F2E    je          00416F4A
>00416F30    jmp         00416FAC
 00416F32    lea         eax,[ebp-0C]
 00416F35    mov         edx,edi
 00416F37    call        @LStrFromWStr
 00416F3C    mov         ecx,dword ptr [ebp-0C]
 00416F3F    mov         edx,ebx
 00416F41    mov         eax,esi
 00416F43    call        SetStrProp
>00416F48    jmp         00416FAC
 00416F4A    mov         eax,dword ptr [ebx+8]
 00416F4D    mov         edx,eax
 00416F4F    and         edx,0FF000000
 00416F55    cmp         edx,0FF000000
>00416F5B    jne         00416F72
 00416F5D    mov         ebx,eax
 00416F5F    and         ebx,0FFFFFF
 00416F65    add         ebx,esi
 00416F67    mov         eax,ebx
 00416F69    mov         edx,edi
 00416F6B    call        @WStrAsg
>00416F70    jmp         00416FAC
 00416F72    cmp         edx,0FE000000
>00416F78    jne         00416F88
 00416F7A    mov         edx,dword ptr [esi]
 00416F7C    movsx       eax,ax
 00416F7F    add         edx,eax
 00416F81    mov         eax,dword ptr [edx]
 00416F83    mov         dword ptr [ebp-8],eax
>00416F86    jmp         00416F8B
 00416F88    mov         dword ptr [ebp-8],eax
 00416F8B    mov         dword ptr [ebp-4],esi
 00416F8E    mov         eax,dword ptr [ebx+10]
 00416F91    cmp         eax,80000000
>00416F96    jne         00416FA2
 00416F98    mov         edx,edi
 00416F9A    mov         eax,dword ptr [ebp-4]
 00416F9D    call        dword ptr [ebp-8]
>00416FA0    jmp         00416FAC
 00416FA2    mov         ecx,edi
 00416FA4    mov         edx,eax
 00416FA6    mov         eax,dword ptr [ebp-4]
 00416FA9    call        dword ptr [ebp-8]
 00416FAC    xor         eax,eax
 00416FAE    pop         edx
 00416FAF    pop         ecx
 00416FB0    pop         ecx
 00416FB1    mov         dword ptr fs:[eax],edx
 00416FB4    push        416FC9
 00416FB9    lea         eax,[ebp-0C]
 00416FBC    call        @LStrClr
 00416FC1    ret
>00416FC2    jmp         @HandleFinally
>00416FC7    jmp         00416FB9
 00416FC9    pop         edi
 00416FCA    pop         esi
 00416FCB    pop         ebx
 00416FCC    mov         esp,ebp
 00416FCE    pop         ebp
 00416FCF    ret
*}
end;

//00416FD0
function GetFloatProp(Instance:TObject; PropInfo:PPropInfo):Extended;
begin
{*
 00416FD0    push        ebx
 00416FD1    push        esi
 00416FD2    add         esp,0FFFFFFEC
 00416FD5    mov         ebx,edx
 00416FD7    mov         edx,dword ptr [ebx+4]
 00416FDA    mov         ecx,edx
 00416FDC    and         ecx,0FF000000
 00416FE2    cmp         ecx,0FF000000
>00416FE8    jne         0041707A
 00416FEE    mov         esi,edx
 00416FF0    and         esi,0FFFFFF
 00416FF6    add         esi,eax
 00416FF8    mov         eax,dword ptr [ebx]
 00416FFA    mov         eax,dword ptr [eax]
 00416FFC    call        GetTypeData
 00417001    movzx       eax,byte ptr [eax]
 00417004    cmp         eax,4
>00417007    ja          0041706A
 00417009    jmp         dword ptr [eax*4+417010]
 00417009    dd          00417024
 00417009    dd          0041702F
 00417009    dd          0041703A
 00417009    dd          00417054
 00417009    dd          0041705C
 00417024    fld         dword ptr [esi]
 00417026    fstp        tbyte ptr [esp]
 00417029    wait
>0041702A    jmp         004170DA
 0041702F    fld         qword ptr [esi]
 00417031    fstp        tbyte ptr [esp]
 00417034    wait
>00417035    jmp         004170DA
 0041703A    mov         eax,dword ptr [esi]
 0041703C    mov         dword ptr [esp],eax
 0041703F    mov         eax,dword ptr [esi+4]
 00417042    mov         dword ptr [esp+4],eax
 00417046    mov         ax,word ptr [esi+8]
 0041704A    mov         word ptr [esp+8],ax
>0041704F    jmp         004170DA
 00417054    fild        qword ptr [esi]
 00417056    fstp        tbyte ptr [esp]
 00417059    wait
>0041705A    jmp         004170DA
 0041705C    fild        qword ptr [esi]
 0041705E    fdiv        dword ptr ds:[4170E4]
 00417064    fstp        tbyte ptr [esp]
 00417067    wait
>00417068    jmp         004170DA
 0041706A    xor         eax,eax
 0041706C    mov         dword ptr [esp],eax
 0041706F    mov         dword ptr [esp+4],eax
 00417073    mov         word ptr [esp+8],ax
>00417078    jmp         004170DA
 0041707A    cmp         ecx,0FE000000
>00417080    jne         00417091
 00417082    mov         ecx,dword ptr [eax]
 00417084    movsx       edx,dx
 00417087    add         ecx,edx
 00417089    mov         edx,dword ptr [ecx]
 0041708B    mov         dword ptr [esp+0C],edx
>0041708F    jmp         00417095
 00417091    mov         dword ptr [esp+0C],edx
 00417095    mov         dword ptr [esp+10],eax
 00417099    mov         eax,dword ptr [ebx+10]
 0041709C    cmp         eax,80000000
>004170A1    jne         004170B1
 004170A3    mov         eax,dword ptr [esp+10]
 004170A7    call        dword ptr [esp+0C]
 004170AB    fstp        tbyte ptr [esp]
 004170AE    wait
>004170AF    jmp         004170BF
 004170B1    mov         edx,eax
 004170B3    mov         eax,dword ptr [esp+10]
 004170B7    call        dword ptr [esp+0C]
 004170BB    fstp        tbyte ptr [esp]
 004170BE    wait
 004170BF    mov         eax,dword ptr [ebx]
 004170C1    mov         eax,dword ptr [eax]
 004170C3    call        GetTypeData
 004170C8    cmp         byte ptr [eax],4
>004170CB    jne         004170DA
 004170CD    fld         tbyte ptr [esp]
 004170D0    fdiv        dword ptr ds:[4170E4]
 004170D6    fstp        tbyte ptr [esp]
 004170D9    wait
 004170DA    fld         tbyte ptr [esp]
 004170DD    add         esp,14
 004170E0    pop         esi
 004170E1    pop         ebx
 004170E2    ret
*}
end;

//004170E8
procedure SetFloatProp(Instance:TObject; PropInfo:PPropInfo; const Value:Extended);
begin
{*
 004170E8    push        ebp
 004170E9    mov         ebp,esp
 004170EB    add         esp,0FFFFFFF8
 004170EE    push        ebx
 004170EF    push        esi
 004170F0    push        edi
 004170F1    mov         esi,edx
 004170F3    mov         edi,eax
 004170F5    mov         ebx,dword ptr [esi+8]
 004170F8    mov         eax,dword ptr [esi]
 004170FA    mov         eax,dword ptr [eax]
 004170FC    call        GetTypeData
 00417101    mov         al,byte ptr [eax]
 00417103    mov         edx,ebx
 00417105    and         edx,0FF000000
 0041710B    cmp         edx,0FF000000
>00417111    jne         0041718E
 00417113    mov         edx,ebx
 00417115    and         edx,0FFFFFF
 0041711B    add         edx,edi
 0041711D    and         eax,7F
 00417120    cmp         eax,4
>00417123    ja          004172D2
 00417129    jmp         dword ptr [eax*4+417130]
 00417129    dd          00417144
 00417129    dd          0041714F
 00417129    dd          0041715A
 00417129    dd          00417172
 00417129    dd          0041717D
 00417144    fld         tbyte ptr [ebp+8]
 00417147    fstp        dword ptr [edx]
 00417149    wait
>0041714A    jmp         004172D2
 0041714F    fld         tbyte ptr [ebp+8]
 00417152    fstp        qword ptr [edx]
 00417154    wait
>00417155    jmp         004172D2
 0041715A    mov         eax,dword ptr [ebp+8]
 0041715D    mov         dword ptr [edx],eax
 0041715F    mov         eax,dword ptr [ebp+0C]
 00417162    mov         dword ptr [edx+4],eax
 00417165    mov         ax,word ptr [ebp+10]
 00417169    mov         word ptr [edx+8],ax
>0041716D    jmp         004172D2
 00417172    fld         tbyte ptr [ebp+8]
 00417175    fistp       qword ptr [edx]
 00417177    wait
>00417178    jmp         004172D2
 0041717D    fld         tbyte ptr [ebp+8]
 00417180    fmul        dword ptr ds:[4172DC]
 00417186    fistp       qword ptr [edx]
 00417188    wait
>00417189    jmp         004172D2
 0041718E    cmp         edx,0FE000000
>00417194    jne         004171A4
 00417196    mov         edx,dword ptr [edi]
 00417198    movsx       ecx,bx
 0041719B    add         edx,ecx
 0041719D    mov         edx,dword ptr [edx]
 0041719F    mov         dword ptr [ebp-8],edx
>004171A2    jmp         004171A7
 004171A4    mov         dword ptr [ebp-8],ebx
 004171A7    mov         dword ptr [ebp-4],edi
 004171AA    mov         edx,dword ptr [esi+10]
 004171AD    cmp         edx,80000000
>004171B3    jne         00417250
 004171B9    and         eax,7F
 004171BC    cmp         eax,4
>004171BF    ja          004172D2
 004171C5    jmp         dword ptr [eax*4+4171CC]
 004171C5    dd          004171E0
 004171C5    dd          004171F5
 004171C5    dd          0041720A
 004171C5    dd          00417220
 004171C5    dd          00417235
 004171E0    fld         tbyte ptr [ebp+8]
 004171E3    add         esp,0FFFFFFFC
 004171E6    fstp        dword ptr [esp]
 004171E9    wait
 004171EA    mov         eax,dword ptr [ebp-4]
 004171ED    call        dword ptr [ebp-8]
>004171F0    jmp         004172D2
 004171F5    fld         tbyte ptr [ebp+8]
 004171F8    add         esp,0FFFFFFF8
 004171FB    fstp        qword ptr [esp]
 004171FE    wait
 004171FF    mov         eax,dword ptr [ebp-4]
 00417202    call        dword ptr [ebp-8]
>00417205    jmp         004172D2
 0041720A    mov         ax,word ptr [ebp+10]
 0041720E    push        eax
 0041720F    push        dword ptr [ebp+0C]
 00417212    push        dword ptr [ebp+8]
 00417215    mov         eax,dword ptr [ebp-4]
 00417218    call        dword ptr [ebp-8]
>0041721B    jmp         004172D2
 00417220    fld         tbyte ptr [ebp+8]
 00417223    add         esp,0FFFFFFF8
 00417226    fistp       qword ptr [esp]
 00417229    wait
 0041722A    mov         eax,dword ptr [ebp-4]
 0041722D    call        dword ptr [ebp-8]
>00417230    jmp         004172D2
 00417235    fld         tbyte ptr [ebp+8]
 00417238    fmul        dword ptr ds:[4172DC]
 0041723E    add         esp,0FFFFFFF8
 00417241    fistp       qword ptr [esp]
 00417244    wait
 00417245    mov         eax,dword ptr [ebp-4]
 00417248    call        dword ptr [ebp-8]
>0041724B    jmp         004172D2
 00417250    and         eax,7F
 00417253    cmp         eax,4
>00417256    ja          004172D2
 00417258    jmp         dword ptr [eax*4+41725F]
 00417258    dd          00417273
 00417258    dd          00417285
 00417258    dd          00417297
 00417258    dd          004172AA
 00417258    dd          004172BC
 00417273    fld         tbyte ptr [ebp+8]
 00417276    add         esp,0FFFFFFFC
 00417279    fstp        dword ptr [esp]
 0041727C    wait
 0041727D    mov         eax,dword ptr [ebp-4]
 00417280    call        dword ptr [ebp-8]
>00417283    jmp         004172D2
 00417285    fld         tbyte ptr [ebp+8]
 00417288    add         esp,0FFFFFFF8
 0041728B    fstp        qword ptr [esp]
 0041728E    wait
 0041728F    mov         eax,dword ptr [ebp-4]
 00417292    call        dword ptr [ebp-8]
>00417295    jmp         004172D2
 00417297    mov         ax,word ptr [ebp+10]
 0041729B    push        eax
 0041729C    push        dword ptr [ebp+0C]
 0041729F    push        dword ptr [ebp+8]
 004172A2    mov         eax,dword ptr [ebp-4]
 004172A5    call        dword ptr [ebp-8]
>004172A8    jmp         004172D2
 004172AA    fld         tbyte ptr [ebp+8]
 004172AD    add         esp,0FFFFFFF8
 004172B0    fistp       qword ptr [esp]
 004172B3    wait
 004172B4    mov         eax,dword ptr [ebp-4]
 004172B7    call        dword ptr [ebp-8]
>004172BA    jmp         004172D2
 004172BC    fld         tbyte ptr [ebp+8]
 004172BF    fmul        dword ptr ds:[4172DC]
 004172C5    add         esp,0FFFFFFF8
 004172C8    fistp       qword ptr [esp]
 004172CB    wait
 004172CC    mov         eax,dword ptr [ebp-4]
 004172CF    call        dword ptr [ebp-8]
 004172D2    pop         edi
 004172D3    pop         esi
 004172D4    pop         ebx
 004172D5    pop         ecx
 004172D6    pop         ecx
 004172D7    pop         ebp
 004172D8    ret         0C
*}
end;

//004172E0
procedure AssignVariant(var Dest:Variant; const Source:Variant);
begin
{*
 004172E0    push        ebx
 004172E1    push        esi
 004172E2    mov         esi,edx
 004172E4    mov         ebx,eax
 004172E6    mov         eax,ebx
 004172E8    mov         edx,esi
 004172EA    call        @VarCopy
 004172EF    pop         esi
 004172F0    pop         ebx
 004172F1    ret
*}
end;

//004172F4
function GetVariantProp(Instance:TObject; PropInfo:PPropInfo):Variant;
begin
{*
 004172F4    push        esi
 004172F5    push        edi
 004172F6    mov         edi,edx
 004172F8    mov         edx,dword ptr [edi+10]
 004172FB    cmp         edx,80000000
>00417301    jne         00417305
 00417303    mov         edx,ecx
 00417305    mov         esi,dword ptr [edi+4]
 00417308    cmp         byte ptr [edi+7],0FE
>0041730C    ja          0041731F
>0041730E    jb          0041731A
 00417310    movsx       esi,si
 00417313    add         esi,dword ptr [eax]
 00417315    call        dword ptr [esi]
 00417317    pop         edi
 00417318    pop         esi
 00417319    ret
 0041731A    call        esi
 0041731C    pop         edi
 0041731D    pop         esi
 0041731E    ret
 0041731F    and         esi,0FFFFFF
 00417325    lea         edx,[esi+eax]
 00417328    mov         eax,ecx
 0041732A    call        AssignVariant
 0041732F    pop         edi
 00417330    pop         esi
 00417331    ret
*}
end;

//00417334
procedure SetVariantProp(Instance:TObject; PropInfo:PPropInfo; const Value:Variant);
begin
{*
 00417334    push        esi
 00417335    push        edi
 00417336    mov         esi,edx
 00417338    mov         edx,dword ptr [esi+10]
 0041733B    cmp         edx,80000000
>00417341    jne         00417345
 00417343    mov         edx,ecx
 00417345    mov         edi,dword ptr [esi+8]
 00417348    cmp         byte ptr [esi+0B],0FE
>0041734C    ja          0041735F
>0041734E    jb          0041735A
 00417350    movsx       edi,di
 00417353    add         edi,dword ptr [eax]
 00417355    call        dword ptr [edi]
 00417357    pop         edi
 00417358    pop         esi
 00417359    ret
 0041735A    call        edi
 0041735C    pop         edi
 0041735D    pop         esi
 0041735E    ret
 0041735F    and         edi,0FFFFFF
 00417365    add         eax,edi
 00417367    mov         edx,ecx
 00417369    call        AssignVariant
 0041736E    pop         edi
 0041736F    pop         esi
 00417370    ret
*}
end;

//00417374
function GetMethodProp(Instance:TObject; PropInfo:PPropInfo):TMethod;
begin
{*
 00417374    push        ebx
 00417375    push        esi
 00417376    mov         esi,edx
 00417378    mov         edx,dword ptr [esi+10]
 0041737B    cmp         edx,80000000
>00417381    jne         00417385
 00417383    mov         edx,ecx
 00417385    mov         ebx,dword ptr [esi+4]
 00417388    cmp         byte ptr [esi+7],0FE
>0041738C    ja          0041739F
>0041738E    jb          0041739A
 00417390    movsx       ebx,bx
 00417393    add         ebx,dword ptr [eax]
 00417395    call        dword ptr [ebx]
 00417397    pop         esi
 00417398    pop         ebx
 00417399    ret
 0041739A    call        ebx
 0041739C    pop         esi
 0041739D    pop         ebx
 0041739E    ret
 0041739F    and         ebx,0FFFFFF
 004173A5    add         eax,ebx
 004173A7    mov         edx,dword ptr [eax]
 004173A9    mov         ebx,dword ptr [eax+4]
 004173AC    mov         dword ptr [ecx],edx
 004173AE    mov         dword ptr [ecx+4],ebx
 004173B1    pop         esi
 004173B2    pop         ebx
 004173B3    ret
*}
end;

//004173B4
procedure SetMethodProp(Instance:TObject; PropInfo:PPropInfo; const Value:TMethod);
begin
{*
 004173B4    push        ebx
 004173B5    mov         ebx,dword ptr [edx+8]
 004173B8    cmp         byte ptr [edx+0B],0FE
>004173BC    ja          004173D5
 004173BE    mov         edx,dword ptr [edx+10]
 004173C1    push        dword ptr [ecx+4]
 004173C4    push        dword ptr [ecx]
>004173C6    jb          004173D1
 004173C8    movsx       ebx,bx
 004173CB    add         ebx,dword ptr [eax]
 004173CD    call        dword ptr [ebx]
 004173CF    pop         ebx
 004173D0    ret
 004173D1    call        ebx
 004173D3    pop         ebx
 004173D4    ret
 004173D5    and         ebx,0FFFFFF
 004173DB    add         eax,ebx
 004173DD    mov         edx,dword ptr [ecx]
 004173DF    mov         ebx,dword ptr [ecx+4]
 004173E2    mov         dword ptr [eax],edx
 004173E4    mov         dword ptr [eax+4],ebx
 004173E7    pop         ebx
 004173E8    ret
*}
end;

//004173EC
function GetInt64Prop(Instance:TObject; PropInfo:PPropInfo):Int64;
begin
{*
 004173EC    cmp         byte ptr [edx+7],0FE
 004173F0    mov         ecx,dword ptr [edx+4]
 004173F3    mov         edx,dword ptr [edx+10]
>004173F6    ja          00417405
>004173F8    jb          00417402
 004173FA    movsx       ecx,cx
 004173FD    add         ecx,dword ptr [eax]
 004173FF    call        dword ptr [ecx]
 00417401    ret
 00417402    call        ecx
 00417404    ret
 00417405    and         ecx,0FFFFFF
 0041740B    add         eax,ecx
 0041740D    mov         edx,dword ptr [eax+4]
 00417410    mov         eax,dword ptr [eax]
 00417412    ret
*}
end;

//00417414
procedure SetInt64Prop(Instance:TObject; PropInfo:PPropInfo; const Value:Int64);
begin
{*
 00417414    push        ebp
 00417415    mov         ebp,esp
 00417417    cmp         byte ptr [edx+0B],0FE
 0041741B    mov         ecx,dword ptr [edx+8]
>0041741E    ja          00417438
 00417420    mov         edx,dword ptr [edx+10]
 00417423    push        dword ptr [ebp+0C]
 00417426    push        dword ptr [ebp+8]
>00417429    jb          00417434
 0041742B    movsx       ecx,cx
 0041742E    add         ecx,dword ptr [eax]
 00417430    call        dword ptr [ecx]
>00417432    jmp         0041744B
 00417434    call        ecx
>00417436    jmp         0041744B
 00417438    and         ecx,0FFFFFF
 0041743E    add         eax,ecx
 00417440    mov         edx,dword ptr [ebp+8]
 00417443    mov         ecx,dword ptr [ebp+0C]
 00417446    mov         dword ptr [eax],edx
 00417448    mov         dword ptr [eax+4],ecx
 0041744B    pop         ebp
 0041744C    ret         8
*}
end;

//00417450
function GetInterfaceProp(Instance:TObject; PropInfo:PPropInfo):IInterface;
begin
{*
 00417450    push        ebx
 00417451    push        esi
 00417452    add         esp,0FFFFFFF4
 00417455    mov         dword ptr [esp],ecx
 00417458    mov         ebx,edx
 0041745A    mov         edx,dword ptr [ebx+4]
 0041745D    mov         ecx,edx
 0041745F    and         ecx,0FF000000
 00417465    cmp         ecx,0FF000000
>0041746B    jne         00417483
 0041746D    mov         ebx,edx
 0041746F    and         ebx,0FFFFFF
 00417475    add         ebx,eax
 00417477    mov         eax,dword ptr [esp]
 0041747A    mov         edx,dword ptr [ebx]
 0041747C    call        @IntfCopy
>00417481    jmp         004174C7
 00417483    cmp         ecx,0FE000000
>00417489    jne         0041749A
 0041748B    mov         ecx,dword ptr [eax]
 0041748D    movsx       edx,dx
 00417490    add         ecx,edx
 00417492    mov         edx,dword ptr [ecx]
 00417494    mov         dword ptr [esp+4],edx
>00417498    jmp         0041749E
 0041749A    mov         dword ptr [esp+4],edx
 0041749E    mov         dword ptr [esp+8],eax
 004174A2    mov         esi,dword ptr [ebx+10]
 004174A5    cmp         esi,80000000
>004174AB    jne         004174BA
 004174AD    mov         edx,dword ptr [esp]
 004174B0    mov         eax,dword ptr [esp+8]
 004174B4    call        dword ptr [esp+4]
>004174B8    jmp         004174C7
 004174BA    mov         ecx,dword ptr [esp]
 004174BD    mov         edx,esi
 004174BF    mov         eax,dword ptr [esp+8]
 004174C3    call        dword ptr [esp+4]
 004174C7    add         esp,0C
 004174CA    pop         esi
 004174CB    pop         ebx
 004174CC    ret
*}
end;

//004174D0
procedure SetInterfaceProp(Instance:TObject; PropInfo:PPropInfo; const Value:IInterface);
begin
{*
 004174D0    push        ebx
 004174D1    push        esi
 004174D2    add         esp,0FFFFFFF8
 004174D5    mov         esi,ecx
 004174D7    mov         ecx,dword ptr [edx+8]
 004174DA    mov         ebx,ecx
 004174DC    and         ebx,0FF000000
 004174E2    cmp         ebx,0FF000000
>004174E8    jne         004174FF
 004174EA    mov         ebx,ecx
 004174EC    and         ebx,0FFFFFF
 004174F2    add         ebx,eax
 004174F4    mov         eax,ebx
 004174F6    mov         edx,esi
 004174F8    call        @IntfCopy
>004174FD    jmp         0041753C
 004174FF    cmp         ebx,0FE000000
>00417505    jne         00417515
 00417507    mov         ebx,dword ptr [eax]
 00417509    movsx       ecx,cx
 0041750C    add         ebx,ecx
 0041750E    mov         ecx,dword ptr [ebx]
 00417510    mov         dword ptr [esp],ecx
>00417513    jmp         00417518
 00417515    mov         dword ptr [esp],ecx
 00417518    mov         dword ptr [esp+4],eax
 0041751C    mov         eax,dword ptr [edx+10]
 0041751F    cmp         eax,80000000
>00417524    jne         00417531
 00417526    mov         edx,esi
 00417528    mov         eax,dword ptr [esp+4]
 0041752C    call        dword ptr [esp]
>0041752F    jmp         0041753C
 00417531    mov         ecx,esi
 00417533    mov         edx,eax
 00417535    mov         eax,dword ptr [esp+4]
 00417539    call        dword ptr [esp]
 0041753C    pop         ecx
 0041753D    pop         edx
 0041753E    pop         esi
 0041753F    pop         ebx
 00417540    ret
*}
end;

Initialization
Finalization
//00417544
{*
 00417544    push        ebp
 00417545    mov         ebp,esp
 00417547    xor         eax,eax
 00417549    push        ebp
 0041754A    push        41758A
 0041754F    push        dword ptr fs:[eax]
 00417552    mov         dword ptr fs:[eax],esp
 00417555    inc         dword ptr ds:[5E0910]
>0041755B    jne         0041757C
 0041755D    mov         eax,5AC4E4;^'.'
 00417562    call        @LStrClr
 00417567    mov         eax,5AC4DC;^'False'
 0041756C    mov         ecx,2
 00417571    mov         edx,dword ptr ds:[4010B4];String
 00417577    call        @FinalizeArray
 0041757C    xor         eax,eax
 0041757E    pop         edx
 0041757F    pop         ecx
 00417580    pop         ecx
 00417581    mov         dword ptr fs:[eax],edx
 00417584    push        417591
 00417589    ret
>0041758A    jmp         @HandleFinally
>0041758F    jmp         00417589
 00417591    pop         ebp
 00417592    ret
*}
end.