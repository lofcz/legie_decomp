//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PersistentClasses;

interface

uses
  SysUtils, Classes;

type
  TVirtualReader = class(TObject)
  public
    f4:dword;//f4
    constructor Create; virtual;//v0//00466638
    procedure v4; virtual; abstract;//v4//00402BEC
    procedure v8; virtual; abstract;//v8//00402BEC
    procedure vC; virtual; abstract;//vC//00402BEC
    procedure v10; virtual; abstract;//v10//00402BEC
    procedure v14; virtual; abstract;//v14//00402BEC
    procedure v18; virtual; abstract;//v18//00402BEC
    procedure v1C; virtual; abstract;//v1C//00402BEC
    procedure v20; virtual; abstract;//v20//00402BEC
    procedure v24; virtual; abstract;//v24//00402BEC
  end;
  TVirtualWriter = class(TObject)
  public
    f4:dword;//f4
    constructor Create; virtual;//v0//004666BC
    procedure v4; virtual; abstract;//v4//00402BEC
    procedure v8; virtual; abstract;//v8//00402BEC
    procedure vC; virtual; abstract;//vC//00402BEC
    procedure v10; virtual; abstract;//v10//00402BEC
    procedure v14; virtual; abstract;//v14//00402BEC
    procedure v18; virtual; abstract;//v18//00402BEC
    procedure v1C; virtual; abstract;//v1C//00402BEC
  end;
  TPersistentObject = class(TPersistent)
  public
    destructor Destroy; virtual;//00466718
    procedure Assign(Source:TPersistent); virtual;//v8//00466740
    constructor vC; virtual;//vC//004666E0
    //procedure v10(?:?); virtual;//v10//004667F8
    constructor Create; virtual;//v14//00466804
    constructor Create; virtual;//v18//0046680C
    //procedure sub_00466D58(?:?; ?:?); dynamic;//00466D58
    //procedure sub_00466CE8(?:?; ?:?); dynamic;//00466CE8
    //procedure sub_00466C80(?:?; ?:?); dynamic;//00466C80
    //procedure sub_00466C18(?:?; ?:?); dynamic;//00466C18
    //procedure sub_00466AF4(?:?; ?:?); dynamic;//00466AF4
    //procedure sub_00466A28(?:?; ?:?); dynamic;//00466A28
    //procedure sub_00466894(?:?); dynamic;//00466894
    //procedure sub_00466814(?:?); dynamic;//00466814
    procedure sub_004667D8; dynamic;//004667D8
  end;
  TPersistentObjectList = class(TPersistentObject)
  public
    f8:dword;//f8
    fC:dword;//fC
    f10:dword;//f10
    f14:dword;//f14
    destructor Destroy; virtual;//00466DF0
    constructor Create; virtual;//vC//00466DB4
    procedure v1C; virtual;//v1C//00466E9C
    procedure v20; virtual;//v20//004673A0
    procedure sub_00467038; dynamic;//00467038
    procedure sub_00466E50; dynamic;//00466E50
    //procedure sub_00466894(?:?); dynamic;//00467390
    //procedure sub_00466814(?:?); dynamic;//00467054
  end;
  TBinaryReader = class(TVirtualReader)
  public
    procedure v4; virtual;//v4//004673C0
    //function v8:?; virtual;//v8//004673E4
    //function vC:?; virtual;//vC//0046741C
    //function v10:?; virtual;//v10//00467490
    //procedure v14(?:?); virtual;//v14//004674B8
    procedure v18; virtual;//v18//00467654
    procedure v1C; virtual;//v1C//00467684
    procedure v20; virtual;//v20//0046769C
    function v24:Boolean; virtual;//v24//004676B4
  end;
  TBinaryWriter = class(TVirtualWriter)
  public
    procedure v4; virtual;//v4//004676C8
    //procedure v8(?:?); virtual;//v8//004676D4
    //procedure vC(?:?); virtual;//vC//00467730
    //procedure v10(?:?); virtual;//v10//00467748
    //procedure v14(?:?; ?:?; ?:?); virtual;//v14//004677C4
    procedure v18; virtual;//v18//004677F8
    procedure v1C; virtual;//v1C//0046780C
  end;
  EInvalidFileSignature = class(Exception)
  end;
  EFilerException = class(Exception)
  end;
    //procedure sub_00466450(?:TClass; ?:?);//00466450
    //procedure sub_00466524(?:AnsiString; ?:?);//00466524
    constructor Create;//00466638
    procedure sub_0046665C(?:TBinaryReader);//0046665C
    constructor Create;//004666BC
    constructor sub_004666E0;//004666E0
    destructor Destroy;//00466718
    procedure Assign(Source:TPersistent);//00466740
    procedure sub_004667D8;//004667D8
    //procedure sub_004667F8(?:?);//004667F8
    constructor Create;//00466804
    constructor Create;//0046680C
    //procedure sub_00466814(?:?);//00466814
    //procedure sub_00466894(?:?);//00466894
    //procedure sub_00466914(?:TPersistentObject; ?:?);//00466914
    //function sub_004669E8(?:?; ?:?; ?:?):?;//004669E8
    //function sub_00466A10:?;//00466A10
    procedure sub_00466A1C;//00466A1C
    //procedure sub_00466A28(?:?; ?:?);//00466A28
    //procedure sub_00466AF4(?:?; ?:?);//00466AF4
    //procedure sub_00466C18(?:?; ?:?);//00466C18
    //procedure sub_00466C80(?:?; ?:?);//00466C80
    //procedure sub_00466CE8(?:?; ?:?);//00466CE8
    //procedure sub_00466D58(?:?; ?:?);//00466D58
    constructor Create;//00466DB4
    destructor Destroy;//00466DF0
    //function sub_00466E24(?:TPersistentObjectList; ?:TObject):?;//00466E24
    procedure sub_00466E50;//00466E50
    //procedure sub_00466E6C(?:?; ?:?);//00466E6C
    procedure sub_00466E9C;//00466E9C
    //function sub_00466EF0(?:dword; ?:?):?;//00466EF0
    //function sub_00466EF8(?:?; ?:?):?;//00466EF8
    //procedure sub_00466F40(?:TPersistentObjectList; ?:?; ?:?);//00466F40
    //procedure sub_00466F8C(?:?; ?:?; ?:?);//00466F8C
    //function sub_00466F94(?:TPersistentObjectList):?;//00466F94
    //procedure sub_00466FB4(?:TPersistentObjectList; ?:?);//00466FB4
    //procedure sub_00466FDC(?:TPersistentObjectList; ?:?);//00466FDC
    procedure sub_00467014(?:TPersistentObjectList);//00467014
    procedure sub_00467038;//00467038
    //procedure sub_00466814(?:?);//00467054
    //procedure sub_004671C4(?:TPersistentObjectList; ?:?; ?:?; ?:?);//004671C4
    //procedure sub_00466894(?:?);//00467390
    procedure sub_004673A0;//004673A0
    //function sub_004673A4(?:?):?;//004673A4
    procedure sub_004673C0;//004673C0
    //function sub_004673CC(?:TBinaryReader):?;//004673CC
    //function sub_004673E4:?;//004673E4
    //function sub_0046741C:?;//0046741C
    //function sub_00467490:?;//00467490
    //procedure sub_004674B8(?:?);//004674B8
    //procedure sub_00467588(?:TBinaryReader; ?:?; ?:?);//00467588
    procedure sub_00467654;//00467654
    procedure sub_00467684;//00467684
    procedure sub_0046769C;//0046769C
    function sub_004676B4:Boolean;//004676B4
    procedure sub_004676C8;//004676C8
    //procedure sub_004676D4(?:?);//004676D4
    //procedure sub_00467730(?:?);//00467730
    //procedure sub_00467748(?:?);//00467748
    //procedure sub_004677C4(?:?; ?:?; ?:?);//004677C4
    procedure sub_004677F8;//004677F8
    procedure sub_0046780C;//0046780C

implementation

//00466450
{*procedure sub_00466450(?:TClass; ?:?);
begin
 00466450    push        ebp
 00466451    mov         ebp,esp
 00466453    add         esp,0FFFFFEF0
 00466459    push        ebx
 0046645A    push        esi
 0046645B    xor         ecx,ecx
 0046645D    mov         dword ptr [ebp-4],ecx
 00466460    mov         dword ptr [ebp-8],ecx
 00466463    mov         dword ptr [ebp-10C],ecx
 00466469    mov         dword ptr [ebp-110],ecx
 0046646F    mov         esi,edx
 00466471    mov         ebx,eax
 00466473    xor         eax,eax
 00466475    push        ebp
 00466476    push        466514
 0046647B    push        dword ptr fs:[eax]
 0046647E    mov         dword ptr fs:[eax],esp
 00466481    lea         edx,[ebp-108]
 00466487    mov         eax,ebx
 00466489    call        TObject.ClassName
 0046648E    lea         edx,[ebp-108]
 00466494    lea         eax,[ebp-8]
 00466497    call        @LStrFromString
 0046649C    push        dword ptr [ebp-8]
 0046649F    lea         edx,[ebp-10C]
 004664A5    mov         eax,466438;^gvar_005AF664
 004664AA    call        LoadStr
 004664AF    push        dword ptr [ebp-10C]
 004664B5    lea         edx,[ebp-110]
 004664BB    mov         eax,esi
 004664BD    call        IntToStr
 004664C2    push        dword ptr [ebp-110]
 004664C8    lea         eax,[ebp-4]
 004664CB    mov         edx,3
 004664D0    call        @LStrCatN
 004664D5    mov         ecx,dword ptr [ebp-4]
 004664D8    mov         dl,1
 004664DA    mov         eax,[004663D4];EFilerException
 004664DF    call        Exception.Create;EFilerException.Create
 004664E4    call        @RaiseExcept
 004664E9    xor         eax,eax
 004664EB    pop         edx
 004664EC    pop         ecx
 004664ED    pop         ecx
 004664EE    mov         dword ptr fs:[eax],edx
 004664F1    push        46651B
 004664F6    lea         eax,[ebp-110]
 004664FC    mov         edx,2
 00466501    call        @LStrArrayClr
 00466506    lea         eax,[ebp-8]
 00466509    mov         edx,2
 0046650E    call        @LStrArrayClr
 00466513    ret
>00466514    jmp         @HandleFinally
>00466519    jmp         004664F6
 0046651B    pop         esi
 0046651C    pop         ebx
 0046651D    mov         esp,ebp
 0046651F    pop         ebp
 00466520    ret
end;*}

//00466524
{*procedure sub_00466524(?:AnsiString; ?:?);
begin
 00466524    push        ebx
 00466525    push        esi
 00466526    push        edi
 00466527    add         esp,0FFFFFFF4
 0046652A    mov         dword ptr [esp],edx
 0046652D    mov         esi,eax
 0046652F    mov         eax,esi
 00466531    call        @LStrLen
 00466536    mov         dword ptr [esp+4],eax
 0046653A    cmp         dword ptr [esp+4],0
>0046653F    jne         0046654E
 00466541    mov         eax,dword ptr [esp]
 00466544    call        @WStrClr
>00466549    jmp         0046662E
 0046654E    mov         eax,dword ptr [esp]
 00466551    mov         edx,dword ptr [esp+4]
 00466555    call        @WStrSetLength
 0046655A    mov         edx,1
 0046655F    mov         edi,1
>00466564    jmp         00466619
 00466569    xor         eax,eax
 0046656B    xor         ecx,ecx
 0046656D    mov         cl,byte ptr [esi+edx-1]
 00466571    movzx       ecx,byte ptr [ecx+5AD094]
 00466578    mov         word ptr [esp+8],cx
 0046657D    movzx       ecx,word ptr [esp+8]
 00466582    cmp         ecx,1
>00466585    jb          00466598
 00466587    xor         ebx,ebx
 00466589    mov         bl,byte ptr [esi+edx-1]
 0046658D    add         eax,ebx
 0046658F    inc         edx
 00466590    shl         eax,6
 00466593    dec         ecx
 00466594    test        ecx,ecx
>00466596    jne         00466587
 00466598    xor         ecx,ecx
 0046659A    mov         cl,byte ptr [esi+edx-1]
 0046659E    add         eax,ecx
 004665A0    inc         edx
 004665A1    movzx       ecx,word ptr [esp+8]
 004665A6    sub         eax,dword ptr [ecx*4+5AD194]
 004665AD    cmp         eax,dword ptr ds:[5AD1AC];0xFFFF gvar_005AD1AC
>004665B3    ja          004665C2
 004665B5    mov         ecx,dword ptr [esp]
 004665B8    mov         ecx,dword ptr [ecx]
 004665BA    mov         word ptr [ecx+edi*2-2],ax
 004665BF    inc         edi
>004665C0    jmp         00466619
 004665C2    cmp         eax,dword ptr ds:[5AD1B0];0x7FFFFFFF gvar_005AD1B0
>004665C8    jbe         004665DE
 004665CA    mov         eax,dword ptr [esp]
 004665CD    mov         eax,dword ptr [eax]
 004665CF    mov         cx,word ptr ds:[5AD1B4];0xFFFD gvar_005AD1B4
 004665D6    mov         word ptr [eax+edi*2-2],cx
 004665DB    inc         edi
>004665DC    jmp         00466619
 004665DE    sub         eax,dword ptr ds:[5AD1BC]
 004665E4    mov         ecx,dword ptr ds:[5AD1B8];0xA gvar_005AD1B8
 004665EA    mov         ebx,eax
 004665EC    shr         ebx,cl
 004665EE    add         bx,word ptr ds:[5AD1C4];0xD800 gvar_005AD1C4
 004665F5    mov         ecx,dword ptr [esp]
 004665F8    mov         ecx,dword ptr [ecx]
 004665FA    mov         word ptr [ecx+edi*2-2],bx
 004665FF    inc         edi
 00466600    mov         ecx,dword ptr [esp]
 00466603    mov         ecx,dword ptr [ecx]
 00466605    and         ax,word ptr ds:[5AD1C0];0x3FF gvar_005AD1C0
 0046660C    add         ax,word ptr ds:[5AD1C8];0xDC00 gvar_005AD1C8
 00466613    mov         word ptr [ecx+edi*2-2],ax
 00466618    inc         edi
 00466619    cmp         edx,dword ptr [esp+4]
>0046661D    jbe         00466569
 00466623    mov         edx,edi
 00466625    dec         edx
 00466626    mov         eax,dword ptr [esp]
 00466629    call        @WStrSetLength
 0046662E    add         esp,0C
 00466631    pop         edi
 00466632    pop         esi
 00466633    pop         ebx
 00466634    ret
end;*}

//00466638
constructor TBinaryReader.Create;
begin
{*
 00466638    test        dl,dl
>0046663A    je          00466644
 0046663C    add         esp,0FFFFFFF0
 0046663F    call        @ClassCreate
 00466644    mov         dword ptr [eax+4],ecx;TVirtualReader.?f4:dword
 00466647    test        dl,dl
>00466649    je          0046665A
 0046664B    call        @AfterConstruction
 00466650    pop         dword ptr fs:[0]
 00466657    add         esp,0C
 0046665A    ret
*}
end;

//0046665C
procedure sub_0046665C(?:TBinaryReader);
begin
{*
 0046665C    push        ebx
 0046665D    add         esp,0FFFFFEF8
 00466663    mov         ebx,eax
 00466665    lea         edx,[esp+8]
 00466669    mov         eax,dword ptr [ebx]
 0046666B    call        TObject.ClassName
 00466670    lea         eax,[esp+8]
 00466674    mov         dword ptr [esp],eax
 00466677    mov         byte ptr [esp+4],4
 0046667C    push        esp
 0046667D    push        0
 0046667F    mov         ecx,4666A8;'%s, read type error'
 00466684    mov         dl,1
 00466686    mov         eax,[0041795C];EReadError
 0046668B    call        Exception.CreateFmt;EReadError.Create
 00466690    call        @RaiseExcept
 00466695    add         esp,108
 0046669B    pop         ebx
 0046669C    ret
*}
end;

//004666BC
constructor TBinaryWriter.Create;
begin
{*
 004666BC    test        dl,dl
>004666BE    je          004666C8
 004666C0    add         esp,0FFFFFFF0
 004666C3    call        @ClassCreate
 004666C8    mov         dword ptr [eax+4],ecx;TVirtualWriter.?f4:dword
 004666CB    test        dl,dl
>004666CD    je          004666DE
 004666CF    call        @AfterConstruction
 004666D4    pop         dword ptr fs:[0]
 004666DB    add         esp,0C
 004666DE    ret
*}
end;

//004666E0
constructor sub_004666E0;
begin
{*
 004666E0    push        ebx
 004666E1    push        esi
 004666E2    test        dl,dl
>004666E4    je          004666EE
 004666E6    add         esp,0FFFFFFF0
 004666E9    call        @ClassCreate
 004666EE    mov         ebx,edx
 004666F0    mov         esi,eax
 004666F2    xor         edx,edx
 004666F4    mov         eax,esi
 004666F6    call        TObject.Create
 004666FB    mov         eax,esi
 004666FD    test        bl,bl
>004666FF    je          00466710
 00466701    call        @AfterConstruction
 00466706    pop         dword ptr fs:[0]
 0046670D    add         esp,0C
 00466710    mov         eax,esi
 00466712    pop         esi
 00466713    pop         ebx
 00466714    ret
*}
end;

//00466718
destructor TPersistentObject.Destroy;
begin
{*
 00466718    push        ebx
 00466719    push        esi
 0046671A    call        @BeforeDestruction
 0046671F    mov         ebx,edx
 00466721    mov         esi,eax
 00466723    mov         edx,ebx
 00466725    and         dl,0FC
 00466728    mov         eax,esi
 0046672A    call        TMemoryStream.Destroy
 0046672F    test        bl,bl
>00466731    jle         0046673A
 00466733    mov         eax,esi
 00466735    call        @ClassDestroy
 0046673A    pop         esi
 0046673B    pop         ebx
 0046673C    ret
*}
end;

//00466740
procedure TPersistentObject.Assign(Source:TPersistent);
begin
{*
 00466740    push        ebp
 00466741    mov         ebp,esp
 00466743    push        ecx
 00466744    push        ebx
 00466745    push        esi
 00466746    push        edi
 00466747    mov         esi,edx
 00466749    mov         ebx,eax
 0046674B    mov         eax,esi
 0046674D    call        TObject.ClassType
 00466752    mov         edi,eax
 00466754    mov         eax,ebx
 00466756    call        TObject.ClassType
 0046675B    cmp         edi,eax
>0046675D    jne         004667C7
 0046675F    xor         ecx,ecx
 00466761    mov         dl,1
 00466763    mov         eax,[004186BC];TStringStream
 00466768    call        TStringStream.Create;TStringStream.Create
 0046676D    mov         dword ptr [ebp-4],eax
 00466770    xor         eax,eax
 00466772    push        ebp
 00466773    push        4667C0
 00466778    push        dword ptr fs:[eax]
 0046677B    mov         dword ptr fs:[eax],esp
 0046677E    xor         ecx,ecx
 00466780    mov         edx,dword ptr [ebp-4]
 00466783    mov         eax,esi
 00466785    mov         si,0FFFA
 00466789    call        @CallDynaInst
 0046678E    push        0
 00466790    push        0
 00466792    mov         eax,dword ptr [ebp-4]
 00466795    call        TStream.SetPosition
 0046679A    xor         ecx,ecx
 0046679C    mov         edx,dword ptr [ebp-4]
 0046679F    mov         eax,ebx
 004667A1    mov         si,0FFF9
 004667A5    call        @CallDynaInst;TPersistentObject.sub_00466AF4
 004667AA    xor         eax,eax
 004667AC    pop         edx
 004667AD    pop         ecx
 004667AE    pop         ecx
 004667AF    mov         dword ptr fs:[eax],edx
 004667B2    push        4667D0
 004667B7    mov         eax,dword ptr [ebp-4]
 004667BA    call        TObject.Free
 004667BF    ret
>004667C0    jmp         @HandleFinally
>004667C5    jmp         004667B7
 004667C7    mov         edx,esi
 004667C9    mov         eax,ebx
 004667CB    call        TPersistent.Assign
 004667D0    pop         edi
 004667D1    pop         esi
 004667D2    pop         ebx
 004667D3    pop         ecx
 004667D4    pop         ebp
 004667D5    ret
*}
end;

//004667D8
procedure TPersistentObject.sub_004667D8;
begin
{*
 004667D8    push        ebx
 004667D9    push        esi
 004667DA    mov         ebx,eax
 004667DC    mov         eax,ebx
 004667DE    call        TObject.ClassType
 004667E3    mov         dl,1
 004667E5    call        dword ptr [eax+0C]
 004667E8    mov         esi,eax
 004667EA    mov         edx,ebx
 004667EC    mov         eax,esi
 004667EE    mov         ecx,dword ptr [eax]
 004667F0    call        dword ptr [ecx+8]
 004667F3    mov         eax,esi
 004667F5    pop         esi
 004667F6    pop         ebx
 004667F7    ret
*}
end;

//004667F8
{*procedure sub_004667F8(?:?);
begin
 004667F8    push        ebx
 004667F9    mov         ebx,edx
 004667FB    mov         eax,ebx
 004667FD    call        @LStrClr
 00466802    pop         ebx
 00466803    ret
end;*}

//00466804
constructor TBinaryWriter.Create;
begin
{*
 00466804    mov         eax,[004662F4];TBinaryWriter
 00466809    ret
*}
end;

//0046680C
constructor TBinaryReader.Create;
begin
{*
 0046680C    mov         eax,[00466270];TBinaryReader
 00466811    ret
*}
end;

//00466814
{*procedure TPersistentObject.sub_00466814(?:?);
begin
 00466814    test        edx,edx
>00466816    jne         0046682C
 00466818    mov         ecx,274
 0046681D    mov         edx,466838;'C:\GLScene\glscene_v_1000714\Source\base\PersistentClasses.pas'
 00466822    mov         eax,466880;'Assertion failure'
 00466827    call        @Assert
 0046682C    ret
end;*}

//00466894
{*procedure TPersistentObject.sub_00466894(?:?);
begin
 00466894    test        edx,edx
>00466896    jne         004668AC
 00466898    mov         ecx,27C
 0046689D    mov         edx,4668B8;'C:\GLScene\glscene_v_1000714\Source\base\PersistentClasses.pas'
 004668A2    mov         eax,466900;'Assertion failure'
 004668A7    call        @Assert
 004668AC    ret
end;*}

//00466914
{*procedure sub_00466914(?:TPersistentObject; ?:?);
begin
 00466914    push        ebp
 00466915    mov         ebp,esp
 00466917    add         esp,0FFFFFEF0
 0046691D    push        ebx
 0046691E    push        esi
 0046691F    xor         ecx,ecx
 00466921    mov         dword ptr [ebp-4],ecx
 00466924    mov         dword ptr [ebp-8],ecx
 00466927    mov         dword ptr [ebp-10C],ecx
 0046692D    mov         dword ptr [ebp-110],ecx
 00466933    mov         esi,edx
 00466935    mov         ebx,eax
 00466937    xor         eax,eax
 00466939    push        ebp
 0046693A    push        4669D8
 0046693F    push        dword ptr fs:[eax]
 00466942    mov         dword ptr fs:[eax],esp
 00466945    lea         edx,[ebp-108]
 0046694B    mov         eax,dword ptr [ebx]
 0046694D    call        TObject.ClassName
 00466952    lea         edx,[ebp-108]
 00466958    lea         eax,[ebp-8]
 0046695B    call        @LStrFromString
 00466960    push        dword ptr [ebp-8]
 00466963    lea         edx,[ebp-10C]
 00466969    mov         eax,466438;^gvar_005AF664
 0046696E    call        LoadStr
 00466973    push        dword ptr [ebp-10C]
 00466979    lea         edx,[ebp-110]
 0046697F    mov         eax,esi
 00466981    call        IntToStr
 00466986    push        dword ptr [ebp-110]
 0046698C    lea         eax,[ebp-4]
 0046698F    mov         edx,3
 00466994    call        @LStrCatN
 00466999    mov         ecx,dword ptr [ebp-4]
 0046699C    mov         dl,1
 0046699E    mov         eax,[004663D4];EFilerException
 004669A3    call        Exception.Create;EFilerException.Create
 004669A8    call        @RaiseExcept
 004669AD    xor         eax,eax
 004669AF    pop         edx
 004669B0    pop         ecx
 004669B1    pop         ecx
 004669B2    mov         dword ptr fs:[eax],edx
 004669B5    push        4669DF
 004669BA    lea         eax,[ebp-110]
 004669C0    mov         edx,2
 004669C5    call        @LStrArrayClr
 004669CA    lea         eax,[ebp-8]
 004669CD    mov         edx,2
 004669D2    call        @LStrArrayClr
 004669D7    ret
>004669D8    jmp         @HandleFinally
>004669DD    jmp         004669BA
 004669DF    pop         esi
 004669E0    pop         ebx
 004669E1    mov         esp,ebp
 004669E3    pop         ebp
 004669E4    ret
end;*}

//004669E8
{*function sub_004669E8(?:?; ?:?; ?:?):?;
begin
 004669E8    push        ebp
 004669E9    mov         ebp,esp
 004669EB    push        ebx
 004669EC    mov         ebx,dword ptr [ebp+8]
 004669EF    mov         ecx,dword ptr [ebp+10]
 004669F2    mov         edx,dword ptr [ebp+0C]
 004669F5    mov         eax,ebx
 004669F7    call        TObject.GetInterface
 004669FC    test        al,al
>004669FE    je          00466A04
 00466A00    xor         eax,eax
>00466A02    jmp         00466A09
 00466A04    mov         eax,80004002
 00466A09    pop         ebx
 00466A0A    pop         ebp
 00466A0B    ret         0C
end;*}

//00466A10
{*function sub_00466A10:?;
begin
 00466A10    push        ebp
 00466A11    mov         ebp,esp
 00466A13    mov         eax,1
 00466A18    pop         ebp
 00466A19    ret         4
end;*}

//00466A1C
procedure sub_00466A1C;
begin
{*
 00466A1C    push        ebp
 00466A1D    mov         ebp,esp
 00466A1F    xor         eax,eax
 00466A21    pop         ebp
 00466A22    ret         4
*}
end;

//00466A28
{*procedure TPersistentObject.sub_00466A28(?:?; ?:?);
begin
 00466A28    push        ebp
 00466A29    mov         ebp,esp
 00466A2B    add         esp,0FFFFFFF0
 00466A2E    push        ebx
 00466A2F    push        esi
 00466A30    xor         ebx,ebx
 00466A32    mov         dword ptr [ebp-10],ebx
 00466A35    mov         dword ptr [ebp-0C],ebx
 00466A38    mov         dword ptr [ebp-4],edx
 00466A3B    mov         ebx,eax
 00466A3D    xor         eax,eax
 00466A3F    push        ebp
 00466A40    push        466AE7
 00466A45    push        dword ptr fs:[eax]
 00466A48    mov         dword ptr fs:[eax],esp
 00466A4B    test        ecx,ecx
>00466A4D    jne         00466A55
 00466A4F    mov         ecx,dword ptr ds:[4662F4];TBinaryWriter
 00466A55    mov         dl,1
 00466A57    mov         eax,ecx
 00466A59    mov         ecx,dword ptr [ebp-4]
 00466A5C    call        dword ptr [eax]
 00466A5E    mov         dword ptr [ebp-8],eax
 00466A61    xor         eax,eax
 00466A63    push        ebp
 00466A64    push        466AC5
 00466A69    push        dword ptr fs:[eax]
 00466A6C    mov         dword ptr fs:[eax],esp
 00466A6F    lea         edx,[ebp-10]
 00466A72    mov         eax,dword ptr [ebx]
 00466A74    call        dword ptr [eax+10];TPersistentObject.sub_004667F8
 00466A77    cmp         dword ptr [ebp-10],0
>00466A7B    je          00466AA1
 00466A7D    lea         edx,[ebp-0C]
 00466A80    mov         eax,dword ptr [ebx]
 00466A82    call        dword ptr [eax+10];TPersistentObject.sub_004667F8
 00466A85    mov         eax,dword ptr [ebp-0C]
 00466A88    call        @LStrLen
 00466A8D    push        eax
 00466A8E    lea         eax,[ebp-0C]
 00466A91    call        @UniqueStringA
 00466A96    mov         edx,eax
 00466A98    mov         eax,dword ptr [ebp-8]
 00466A9B    pop         ecx
 00466A9C    mov         esi,dword ptr [eax]
 00466A9E    call        dword ptr [esi+4]
 00466AA1    mov         edx,dword ptr [ebp-8]
 00466AA4    mov         eax,ebx
 00466AA6    mov         si,0FFFC
 00466AAA    call        @CallDynaInst;TPersistentObject.sub_00466814
 00466AAF    xor         eax,eax
 00466AB1    pop         edx
 00466AB2    pop         ecx
 00466AB3    pop         ecx
 00466AB4    mov         dword ptr fs:[eax],edx
 00466AB7    push        466ACC
 00466ABC    mov         eax,dword ptr [ebp-8]
 00466ABF    call        TObject.Free
 00466AC4    ret
>00466AC5    jmp         @HandleFinally
>00466ACA    jmp         00466ABC
 00466ACC    xor         eax,eax
 00466ACE    pop         edx
 00466ACF    pop         ecx
 00466AD0    pop         ecx
 00466AD1    mov         dword ptr fs:[eax],edx
 00466AD4    push        466AEE
 00466AD9    lea         eax,[ebp-10]
 00466ADC    mov         edx,2
 00466AE1    call        @LStrArrayClr
 00466AE6    ret
>00466AE7    jmp         @HandleFinally
>00466AEC    jmp         00466AD9
 00466AEE    pop         esi
 00466AEF    pop         ebx
 00466AF0    mov         esp,ebp
 00466AF2    pop         ebp
 00466AF3    ret
end;*}

//00466AF4
{*procedure TPersistentObject.sub_00466AF4(?:?; ?:?);
begin
 00466AF4    push        ebp
 00466AF5    mov         ebp,esp
 00466AF7    push        0
 00466AF9    push        0
 00466AFB    push        0
 00466AFD    push        0
 00466AFF    push        0
 00466B01    push        0
 00466B03    push        0
 00466B05    push        0
 00466B07    push        ebx
 00466B08    push        esi
 00466B09    mov         dword ptr [ebp-4],edx
 00466B0C    mov         ebx,eax
 00466B0E    xor         eax,eax
 00466B10    push        ebp
 00466B11    push        466C08
 00466B16    push        dword ptr fs:[eax]
 00466B19    mov         dword ptr fs:[eax],esp
 00466B1C    test        ecx,ecx
>00466B1E    jne         00466B26
 00466B20    mov         ecx,dword ptr ds:[466270];TBinaryReader
 00466B26    mov         dl,1
 00466B28    mov         eax,ecx
 00466B2A    mov         ecx,dword ptr [ebp-4]
 00466B2D    call        dword ptr [eax]
 00466B2F    mov         dword ptr [ebp-8],eax
 00466B32    xor         eax,eax
 00466B34    push        ebp
 00466B35    push        466BE6
 00466B3A    push        dword ptr fs:[eax]
 00466B3D    mov         dword ptr fs:[eax],esp
 00466B40    lea         edx,[ebp-10]
 00466B43    mov         eax,dword ptr [ebx]
 00466B45    call        dword ptr [eax+10];TPersistentObject.sub_004667F8
 00466B48    cmp         dword ptr [ebp-10],0
>00466B4C    je          00466BC2
 00466B4E    lea         edx,[ebp-14]
 00466B51    mov         eax,dword ptr [ebx]
 00466B53    call        dword ptr [eax+10];TPersistentObject.sub_004667F8
 00466B56    mov         eax,dword ptr [ebp-14]
 00466B59    call        @LStrLen
 00466B5E    mov         edx,eax
 00466B60    lea         eax,[ebp-0C]
 00466B63    call        @LStrSetLength
 00466B68    lea         edx,[ebp-18]
 00466B6B    mov         eax,dword ptr [ebx]
 00466B6D    call        dword ptr [eax+10];TPersistentObject.sub_004667F8
 00466B70    mov         eax,dword ptr [ebp-18]
 00466B73    call        @LStrLen
 00466B78    push        eax
 00466B79    lea         eax,[ebp-0C]
 00466B7C    call        @UniqueStringA
 00466B81    mov         edx,eax
 00466B83    mov         eax,dword ptr [ebp-8]
 00466B86    pop         ecx
 00466B87    mov         esi,dword ptr [eax]
 00466B89    call        dword ptr [esi+4]
 00466B8C    lea         edx,[ebp-1C]
 00466B8F    mov         eax,dword ptr [ebx]
 00466B91    call        dword ptr [eax+10];TPersistentObject.sub_004667F8
 00466B94    mov         edx,dword ptr [ebp-1C]
 00466B97    mov         eax,dword ptr [ebp-0C]
 00466B9A    call        @LStrCmp
>00466B9F    je          00466BC2
 00466BA1    lea         edx,[ebp-20]
 00466BA4    mov         eax,466430;^gvar_005AF664
 00466BA9    call        LoadStr
 00466BAE    mov         ecx,dword ptr [ebp-20]
 00466BB1    mov         dl,1
 00466BB3    mov         eax,[00466370];EInvalidFileSignature
 00466BB8    call        Exception.Create;EInvalidFileSignature.Create
 00466BBD    call        @RaiseExcept
 00466BC2    mov         edx,dword ptr [ebp-8]
 00466BC5    mov         eax,ebx
 00466BC7    mov         si,0FFFB
 00466BCB    call        @CallDynaInst;TPersistentObject.sub_00466894
 00466BD0    xor         eax,eax
 00466BD2    pop         edx
 00466BD3    pop         ecx
 00466BD4    pop         ecx
 00466BD5    mov         dword ptr fs:[eax],edx
 00466BD8    push        466BED
 00466BDD    mov         eax,dword ptr [ebp-8]
 00466BE0    call        TObject.Free
 00466BE5    ret
>00466BE6    jmp         @HandleFinally
>00466BEB    jmp         00466BDD
 00466BED    xor         eax,eax
 00466BEF    pop         edx
 00466BF0    pop         ecx
 00466BF1    pop         ecx
 00466BF2    mov         dword ptr fs:[eax],edx
 00466BF5    push        466C0F
 00466BFA    lea         eax,[ebp-20]
 00466BFD    mov         edx,6
 00466C02    call        @LStrArrayClr
 00466C07    ret
>00466C08    jmp         @HandleFinally
>00466C0D    jmp         00466BFA
 00466C0F    pop         esi
 00466C10    pop         ebx
 00466C11    mov         esp,ebp
 00466C13    pop         ebp
 00466C14    ret
end;*}

//00466C18
{*procedure TPersistentObject.sub_00466C18(?:?; ?:?);
begin
 00466C18    push        ebp
 00466C19    mov         ebp,esp
 00466C1B    push        ecx
 00466C1C    push        ebx
 00466C1D    push        esi
 00466C1E    push        edi
 00466C1F    mov         esi,ecx
 00466C21    mov         edi,edx
 00466C23    mov         ebx,eax
 00466C25    test        esi,esi
>00466C27    jne         00466C30
 00466C29    mov         eax,dword ptr [ebx]
 00466C2B    call        dword ptr [eax+14];TPersistentObject.sub_00466804
 00466C2E    mov         esi,eax
 00466C30    mov         dx,0FFFF
 00466C34    mov         eax,edi
 00466C36    call        00465A70
 00466C3B    mov         dword ptr [ebp-4],eax
 00466C3E    xor         eax,eax
 00466C40    push        ebp
 00466C41    push        466C72
 00466C46    push        dword ptr fs:[eax]
 00466C49    mov         dword ptr fs:[eax],esp
 00466C4C    mov         ecx,esi
 00466C4E    mov         edx,dword ptr [ebp-4]
 00466C51    mov         eax,ebx
 00466C53    mov         si,0FFFA
 00466C57    call        @CallDynaInst;TPersistentObject.sub_00466A28
 00466C5C    xor         eax,eax
 00466C5E    pop         edx
 00466C5F    pop         ecx
 00466C60    pop         ecx
 00466C61    mov         dword ptr fs:[eax],edx
 00466C64    push        466C79
 00466C69    mov         eax,dword ptr [ebp-4]
 00466C6C    call        TObject.Free
 00466C71    ret
>00466C72    jmp         @HandleFinally
>00466C77    jmp         00466C69
 00466C79    pop         edi
 00466C7A    pop         esi
 00466C7B    pop         ebx
 00466C7C    pop         ecx
 00466C7D    pop         ebp
 00466C7E    ret
end;*}

//00466C80
{*procedure TPersistentObject.sub_00466C80(?:?; ?:?);
begin
 00466C80    push        ebp
 00466C81    mov         ebp,esp
 00466C83    push        ecx
 00466C84    push        ebx
 00466C85    push        esi
 00466C86    push        edi
 00466C87    mov         esi,ecx
 00466C89    mov         edi,edx
 00466C8B    mov         ebx,eax
 00466C8D    test        esi,esi
>00466C8F    jne         00466C98
 00466C91    mov         eax,dword ptr [ebx]
 00466C93    call        dword ptr [eax+18];TPersistentObject.sub_0046680C
 00466C96    mov         esi,eax
 00466C98    mov         dx,20
 00466C9C    mov         eax,edi
 00466C9E    call        00465A70
 00466CA3    mov         dword ptr [ebp-4],eax
 00466CA6    xor         eax,eax
 00466CA8    push        ebp
 00466CA9    push        466CDA
 00466CAE    push        dword ptr fs:[eax]
 00466CB1    mov         dword ptr fs:[eax],esp
 00466CB4    mov         ecx,esi
 00466CB6    mov         edx,dword ptr [ebp-4]
 00466CB9    mov         eax,ebx
 00466CBB    mov         si,0FFF9
 00466CBF    call        @CallDynaInst;TPersistentObject.sub_00466AF4
 00466CC4    xor         eax,eax
 00466CC6    pop         edx
 00466CC7    pop         ecx
 00466CC8    pop         ecx
 00466CC9    mov         dword ptr fs:[eax],edx
 00466CCC    push        466CE1
 00466CD1    mov         eax,dword ptr [ebp-4]
 00466CD4    call        TObject.Free
 00466CD9    ret
>00466CDA    jmp         @HandleFinally
>00466CDF    jmp         00466CD1
 00466CE1    pop         edi
 00466CE2    pop         esi
 00466CE3    pop         ebx
 00466CE4    pop         ecx
 00466CE5    pop         ebp
 00466CE6    ret
end;*}

//00466CE8
{*procedure TPersistentObject.sub_00466CE8(?:?; ?:?);
begin
 00466CE8    push        ebp
 00466CE9    mov         ebp,esp
 00466CEB    add         esp,0FFFFFFF8
 00466CEE    push        ebx
 00466CEF    push        esi
 00466CF0    mov         dword ptr [ebp-4],ecx
 00466CF3    mov         esi,edx
 00466CF5    mov         ebx,eax
 00466CF7    xor         ecx,ecx
 00466CF9    mov         dl,1
 00466CFB    mov         eax,[004186BC];TStringStream
 00466D00    call        TStringStream.Create;TStringStream.Create
 00466D05    mov         dword ptr [ebp-8],eax
 00466D08    xor         eax,eax
 00466D0A    push        ebp
 00466D0B    push        466D4A
 00466D10    push        dword ptr fs:[eax]
 00466D13    mov         dword ptr fs:[eax],esp
 00466D16    mov         ecx,esi
 00466D18    mov         edx,dword ptr [ebp-8]
 00466D1B    mov         eax,ebx
 00466D1D    mov         si,0FFFA
 00466D21    call        @CallDynaInst;TPersistentObject.sub_00466A28
 00466D26    mov         eax,dword ptr [ebp-4]
 00466D29    mov         edx,dword ptr [ebp-8]
 00466D2C    mov         edx,dword ptr [edx+4];TStringStream.FDataString:String
 00466D2F    call        @LStrAsg
 00466D34    xor         eax,eax
 00466D36    pop         edx
 00466D37    pop         ecx
 00466D38    pop         ecx
 00466D39    mov         dword ptr fs:[eax],edx
 00466D3C    push        466D51
 00466D41    mov         eax,dword ptr [ebp-8]
 00466D44    call        TObject.Free
 00466D49    ret
>00466D4A    jmp         @HandleFinally
>00466D4F    jmp         00466D41
 00466D51    pop         esi
 00466D52    pop         ebx
 00466D53    pop         ecx
 00466D54    pop         ecx
 00466D55    pop         ebp
 00466D56    ret
end;*}

//00466D58
{*procedure TPersistentObject.sub_00466D58(?:?; ?:?);
begin
 00466D58    push        ebp
 00466D59    mov         ebp,esp
 00466D5B    push        ecx
 00466D5C    push        ebx
 00466D5D    push        esi
 00466D5E    mov         esi,ecx
 00466D60    mov         ebx,eax
 00466D62    mov         ecx,edx
 00466D64    mov         eax,[004186BC];TStringStream
 00466D69    mov         dl,1
 00466D6B    call        TStringStream.Create;TStringStream.Create
 00466D70    mov         dword ptr [ebp-4],eax
 00466D73    xor         eax,eax
 00466D75    push        ebp
 00466D76    push        466DA7
 00466D7B    push        dword ptr fs:[eax]
 00466D7E    mov         dword ptr fs:[eax],esp
 00466D81    mov         ecx,esi
 00466D83    mov         edx,dword ptr [ebp-4]
 00466D86    mov         eax,ebx
 00466D88    mov         si,0FFF9
 00466D8C    call        @CallDynaInst;TPersistentObject.sub_00466AF4
 00466D91    xor         eax,eax
 00466D93    pop         edx
 00466D94    pop         ecx
 00466D95    pop         ecx
 00466D96    mov         dword ptr fs:[eax],edx
 00466D99    push        466DAE
 00466D9E    mov         eax,dword ptr [ebp-4]
 00466DA1    call        TObject.Free
 00466DA6    ret
>00466DA7    jmp         @HandleFinally
>00466DAC    jmp         00466D9E
 00466DAE    pop         esi
 00466DAF    pop         ebx
 00466DB0    pop         ecx
 00466DB1    pop         ebp
 00466DB2    ret
end;*}

//00466DB4
constructor TPersistentObjectList.Create;
begin
{*
 00466DB4    push        ebx
 00466DB5    push        esi
 00466DB6    test        dl,dl
>00466DB8    je          00466DC2
 00466DBA    add         esp,0FFFFFFF0
 00466DBD    call        @ClassCreate
 00466DC2    mov         ebx,edx
 00466DC4    mov         esi,eax
 00466DC6    xor         edx,edx
 00466DC8    mov         eax,esi
 00466DCA    call        004666E0
 00466DCF    mov         dword ptr [esi+14],10;TPersistentObjectList.?f14:dword
 00466DD6    mov         eax,esi
 00466DD8    test        bl,bl
>00466DDA    je          00466DEB
 00466DDC    call        @AfterConstruction
 00466DE1    pop         dword ptr fs:[0]
 00466DE8    add         esp,0C
 00466DEB    mov         eax,esi
 00466DED    pop         esi
 00466DEE    pop         ebx
 00466DEF    ret
*}
end;

//00466DF0
destructor TPersistentObjectList.Destroy;
begin
{*
 00466DF0    push        ebx
 00466DF1    push        esi
 00466DF2    push        edi
 00466DF3    call        @BeforeDestruction
 00466DF8    mov         ebx,edx
 00466DFA    mov         edi,eax
 00466DFC    mov         eax,edi
 00466DFE    mov         si,0FFF4
 00466E02    call        @CallDynaInst;TPersistentObjectList.sub_00466E50
 00466E07    mov         edx,ebx
 00466E09    and         dl,0FC
 00466E0C    mov         eax,edi
 00466E0E    call        TPersistentObject.Destroy
 00466E13    test        bl,bl
>00466E15    jle         00466E1E
 00466E17    mov         eax,edi
 00466E19    call        @ClassDestroy
 00466E1E    pop         edi
 00466E1F    pop         esi
 00466E20    pop         ebx
 00466E21    ret
*}
end;

//00466E24
{*function sub_00466E24(?:TPersistentObjectList; ?:TObject):?;
begin
 00466E24    push        ebx
 00466E25    push        esi
 00466E26    push        edi
 00466E27    mov         edi,edx
 00466E29    mov         ebx,eax
 00466E2B    mov         esi,dword ptr [ebx+0C]
 00466E2E    mov         eax,dword ptr [ebx+10]
 00466E31    cmp         esi,eax
>00466E33    jne         00466E41
 00466E35    mov         edx,eax
 00466E37    add         edx,dword ptr [ebx+14]
 00466E3A    mov         eax,ebx
 00466E3C    call        00466FB4
 00466E41    mov         eax,dword ptr [ebx+8]
 00466E44    mov         dword ptr [eax+esi*4],edi
 00466E47    inc         dword ptr [ebx+0C]
 00466E4A    mov         eax,esi
 00466E4C    pop         edi
 00466E4D    pop         esi
 00466E4E    pop         ebx
 00466E4F    ret
end;*}

//00466E50
procedure TPersistentObjectList.sub_00466E50;
begin
{*
 00466E50    push        ebx
 00466E51    mov         ebx,eax
 00466E53    test        ebx,ebx
>00466E55    je          00466E69
 00466E57    xor         edx,edx
 00466E59    mov         eax,ebx
 00466E5B    call        00466FDC
 00466E60    xor         edx,edx
 00466E62    mov         eax,ebx
 00466E64    call        00466FB4
 00466E69    pop         ebx
 00466E6A    ret
*}
end;

//00466E6C
{*procedure sub_00466E6C(?:?; ?:?);
begin
 00466E6C    push        ebx
 00466E6D    push        esi
 00466E6E    dec         dword ptr [eax+0C]
 00466E71    mov         ecx,dword ptr [eax+0C]
 00466E74    cmp         edx,ecx
>00466E76    jge         00466E97
 00466E78    mov         ebx,dword ptr [eax+8]
 00466E7B    lea         ebx,[ebx+edx*4+4]
 00466E7F    mov         esi,dword ptr [eax+8]
 00466E82    lea         esi,[esi+edx*4]
 00466E85    sub         ecx,edx
 00466E87    mov         eax,ecx
 00466E89    shl         eax,2
 00466E8C    mov         ecx,eax
 00466E8E    mov         eax,ebx
 00466E90    mov         edx,esi
 00466E92    call        Move
 00466E97    pop         esi
 00466E98    pop         ebx
 00466E99    ret
end;*}

//00466E9C
procedure sub_00466E9C;
begin
{*
 00466E9C    push        ebp
 00466E9D    mov         ebp,esp
 00466E9F    push        0
 00466EA1    xor         eax,eax
 00466EA3    push        ebp
 00466EA4    push        466EE6
 00466EA9    push        dword ptr fs:[eax]
 00466EAC    mov         dword ptr fs:[eax],esp
 00466EAF    lea         edx,[ebp-4]
 00466EB2    mov         eax,466448;^gvar_005AF664
 00466EB7    call        LoadStr
 00466EBC    mov         ecx,dword ptr [ebp-4]
 00466EBF    mov         dl,1
 00466EC1    mov         eax,[00417AC4];EListError
 00466EC6    call        Exception.Create;EListError.Create
 00466ECB    call        @RaiseExcept
 00466ED0    xor         eax,eax
 00466ED2    pop         edx
 00466ED3    pop         ecx
 00466ED4    pop         ecx
 00466ED5    mov         dword ptr fs:[eax],edx
 00466ED8    push        466EED
 00466EDD    lea         eax,[ebp-4]
 00466EE0    call        @LStrClr
 00466EE5    ret
>00466EE6    jmp         @HandleFinally
>00466EEB    jmp         00466EDD
 00466EED    pop         ecx
 00466EEE    pop         ebp
 00466EEF    ret
*}
end;

//00466EF0
{*function sub_00466EF0(?:dword; ?:?):?;
begin
 00466EF0    mov         eax,dword ptr [eax+8]
 00466EF3    mov         eax,dword ptr [eax+edx*4]
 00466EF6    ret
end;*}

//00466EF8
{*function sub_00466EF8(?:?; ?:?):?;
begin
 00466EF8    push        ebp
 00466EF9    mov         ebp,esp
 00466EFB    add         esp,0FFFFFFF0
 00466EFE    mov         dword ptr [ebp-4],edx
 00466F01    mov         edx,dword ptr [eax+0C]
 00466F04    test        edx,edx
>00466F06    jg          00466F11
 00466F08    mov         dword ptr [ebp-10],0FFFFFFFF
>00466F0F    jmp         00466F38
 00466F11    mov         dword ptr [ebp-8],edx
 00466F14    mov         eax,dword ptr [eax+8]
 00466F17    mov         dword ptr [ebp-0C],eax
 00466F1A    mov         eax,dword ptr [ebp-4]
 00466F1D    mov         ecx,dword ptr [ebp-8]
 00466F20    mov         edx,ecx
 00466F22    push        edi
 00466F23    mov         edi,dword ptr [ebp-0C]
 00466F26    repne scas  dword ptr [edi]
>00466F28    je          00466F31
 00466F2A    mov         edx,0FFFFFFFF
>00466F2F    jmp         00466F34
 00466F31    sub         edx,ecx
 00466F33    dec         edx
 00466F34    mov         dword ptr [ebp-10],edx
 00466F37    pop         edi
 00466F38    mov         eax,dword ptr [ebp-10]
 00466F3B    mov         esp,ebp
 00466F3D    pop         ebp
 00466F3E    ret
end;*}

//00466F40
{*procedure sub_00466F40(?:TPersistentObjectList; ?:?; ?:?);
begin
 00466F40    push        ebx
 00466F41    push        esi
 00466F42    push        edi
 00466F43    mov         edi,ecx
 00466F45    mov         esi,edx
 00466F47    mov         ebx,eax
 00466F49    mov         eax,dword ptr [ebx+10]
 00466F4C    cmp         eax,dword ptr [ebx+0C]
>00466F4F    jne         00466F5D
 00466F51    mov         edx,eax
 00466F53    add         edx,dword ptr [ebx+14]
 00466F56    mov         eax,ebx
 00466F58    call        00466FB4
 00466F5D    mov         eax,dword ptr [ebx+0C]
 00466F60    cmp         esi,eax
>00466F62    jge         00466F7D
 00466F64    sub         eax,esi
 00466F66    mov         ecx,eax
 00466F68    shl         ecx,2
 00466F6B    mov         eax,dword ptr [ebx+8]
 00466F6E    lea         edx,[eax+esi*4+4]
 00466F72    mov         eax,dword ptr [ebx+8]
 00466F75    lea         eax,[eax+esi*4]
 00466F78    call        Move
 00466F7D    mov         eax,dword ptr [ebx+8]
 00466F80    mov         dword ptr [eax+esi*4],edi
 00466F83    inc         dword ptr [ebx+0C]
 00466F86    pop         edi
 00466F87    pop         esi
 00466F88    pop         ebx
 00466F89    ret
end;*}

//00466F8C
{*procedure sub_00466F8C(?:?; ?:?; ?:?);
begin
 00466F8C    mov         eax,dword ptr [eax+8]
 00466F8F    mov         dword ptr [eax+edx*4],ecx
 00466F92    ret
end;*}

//00466F94
{*function sub_00466F94(?:TPersistentObjectList):?;
begin
 00466F94    push        ebx
 00466F95    push        esi
 00466F96    mov         ebx,eax
 00466F98    mov         eax,ebx
 00466F9A    call        00466EF8
 00466F9F    mov         esi,eax
 00466FA1    test        esi,esi
>00466FA3    jl          00466FAE
 00466FA5    mov         edx,esi
 00466FA7    mov         eax,ebx
 00466FA9    call        00466E6C
 00466FAE    mov         eax,esi
 00466FB0    pop         esi
 00466FB1    pop         ebx
 00466FB2    ret
end;*}

//00466FB4
{*procedure sub_00466FB4(?:TPersistentObjectList; ?:?);
begin
 00466FB4    push        ebx
 00466FB5    push        esi
 00466FB6    mov         esi,edx
 00466FB8    mov         ebx,eax
 00466FBA    cmp         esi,dword ptr [ebx+10];TPersistentObjectList.?f10:dword
>00466FBD    je          00466FD7
 00466FBF    cmp         esi,dword ptr [ebx+0C];TPersistentObjectList.?fC:dword
>00466FC2    jge         00466FC7
 00466FC4    mov         dword ptr [ebx+0C],esi;TPersistentObjectList.?fC:dword
 00466FC7    mov         edx,esi
 00466FC9    shl         edx,2
 00466FCC    lea         eax,[ebx+8];TPersistentObjectList.?f8:dword
 00466FCF    call        @ReallocMem
 00466FD4    mov         dword ptr [ebx+10],esi;TPersistentObjectList.?f10:dword
 00466FD7    pop         esi
 00466FD8    pop         ebx
 00466FD9    ret
end;*}

//00466FDC
{*procedure sub_00466FDC(?:TPersistentObjectList; ?:?);
begin
 00466FDC    push        ebx
 00466FDD    push        esi
 00466FDE    mov         esi,edx
 00466FE0    mov         ebx,eax
 00466FE2    cmp         esi,dword ptr [ebx+10];TPersistentObjectList.?f10:dword
>00466FE5    jle         00466FF0
 00466FE7    mov         edx,esi
 00466FE9    mov         eax,ebx
 00466FEB    call        00466FB4
 00466FF0    mov         eax,dword ptr [ebx+0C];TPersistentObjectList.?fC:dword
 00466FF3    cmp         esi,eax
>00466FF5    jle         0046700E
 00466FF7    mov         edx,dword ptr [ebx+8];TPersistentObjectList.?f8:dword
 00466FFA    lea         edx,[edx+eax*4]
 00466FFD    mov         ecx,esi
 00466FFF    sub         ecx,eax
 00467001    mov         eax,ecx
 00467003    shl         eax,2
 00467006    xor         ecx,ecx
 00467008    xchg        eax,edx
 00467009    call        @FillChar
 0046700E    mov         dword ptr [ebx+0C],esi;TPersistentObjectList.?fC:dword
 00467011    pop         esi
 00467012    pop         ebx
 00467013    ret
end;*}

//00467014
procedure sub_00467014(?:TPersistentObjectList);
begin
{*
 00467014    push        ebx
 00467015    push        esi
 00467016    mov         esi,eax
 00467018    mov         ebx,dword ptr [esi+0C]
 0046701B    dec         ebx
 0046701C    test        ebx,ebx
>0046701E    jl          00467035
 00467020    cmp         ebx,dword ptr [esi+0C]
>00467023    jge         00467030
 00467025    mov         eax,dword ptr [esi+8]
 00467028    mov         eax,dword ptr [eax+ebx*4]
 0046702B    call        TObject.Free
 00467030    dec         ebx
 00467031    test        ebx,ebx
>00467033    jge         00467020
 00467035    pop         esi
 00467036    pop         ebx
 00467037    ret
*}
end;

//00467038
procedure TPersistentObjectList.sub_00467038;
begin
{*
 00467038    push        ebx
 00467039    push        esi
 0046703A    mov         ebx,eax
 0046703C    mov         eax,ebx
 0046703E    call        00467014
 00467043    mov         eax,ebx
 00467045    mov         si,0FFF4
 00467049    call        @CallDynaInst;TPersistentObjectList.sub_00466E50
 0046704E    pop         esi
 0046704F    pop         ebx
 00467050    ret
*}
end;

//00467054
{*procedure TPersistentObjectList.sub_00466814(?:?);
begin
 00467054    push        ebp
 00467055    mov         ebp,esp
 00467057    add         esp,0FFFFFEF0
 0046705D    push        ebx
 0046705E    push        esi
 0046705F    push        edi
 00467060    xor         ecx,ecx
 00467062    mov         dword ptr [ebp-10],ecx
 00467065    mov         edi,edx
 00467067    mov         dword ptr [ebp-4],eax
 0046706A    xor         eax,eax
 0046706C    push        ebp
 0046706D    push        4671B3
 00467072    push        dword ptr fs:[eax]
 00467075    mov         dword ptr fs:[eax],esp
 00467078    mov         dl,1
 0046707A    mov         eax,[00417CEC];TList
 0046707F    call        TObject.Create;TList.Create
 00467084    mov         dword ptr [ebp-8],eax
 00467087    xor         edx,edx
 00467089    push        ebp
 0046708A    push        467196
 0046708F    push        dword ptr fs:[edx]
 00467092    mov         dword ptr fs:[edx],esp
 00467095    xor         edx,edx
 00467097    mov         eax,edi
 00467099    mov         ecx,dword ptr [eax]
 0046709B    call        dword ptr [ecx+8]
 0046709E    mov         eax,edi
 004670A0    mov         edx,dword ptr [eax]
 004670A2    call        dword ptr [edx+18]
 004670A5    mov         eax,dword ptr [ebp-4]
 004670A8    mov         eax,dword ptr [eax+0C];TPersistentObjectList.?fC:dword
 004670AB    dec         eax
 004670AC    test        eax,eax
>004670AE    jl          00467179
 004670B4    inc         eax
 004670B5    mov         dword ptr [ebp-0C],eax
 004670B8    xor         ebx,ebx
 004670BA    mov         eax,dword ptr [ebp-4]
 004670BD    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 004670C0    mov         esi,dword ptr [eax+ebx*4]
 004670C3    test        esi,esi
>004670C5    jne         004670DE
 004670C7    xor         edx,edx
 004670C9    mov         eax,edi
 004670CB    mov         ecx,dword ptr [eax]
 004670CD    call        dword ptr [ecx+0C]
 004670D0    xor         edx,edx
 004670D2    mov         eax,edi
 004670D4    mov         ecx,dword ptr [eax]
 004670D6    call        dword ptr [ecx+8]
>004670D9    jmp         0046716F
 004670DE    mov         eax,esi
 004670E0    mov         edx,dword ptr ds:[4660A8];TPersistentObject
 004670E6    call        @IsClass
 004670EB    test        al,al
>004670ED    je          00467156
 004670EF    mov         eax,esi
 004670F1    call        TObject.ClassType
 004670F6    mov         esi,eax
 004670F8    mov         edx,esi
 004670FA    mov         eax,dword ptr [ebp-8]
 004670FD    call        TList.IndexOf
 00467102    test        eax,eax
>00467104    jge         00467137
 00467106    mov         edx,esi
 00467108    mov         eax,dword ptr [ebp-8]
 0046710B    call        TList.Add
 00467110    lea         edx,[ebp-110]
 00467116    mov         eax,esi
 00467118    call        TObject.ClassName
 0046711D    lea         edx,[ebp-110]
 00467123    lea         eax,[ebp-10]
 00467126    call        @LStrFromString
 0046712B    mov         edx,dword ptr [ebp-10]
 0046712E    mov         eax,edi
 00467130    mov         ecx,dword ptr [eax]
 00467132    call        dword ptr [ecx+10]
>00467135    jmp         00467140
 00467137    mov         edx,eax
 00467139    mov         eax,edi
 0046713B    mov         ecx,dword ptr [eax]
 0046713D    call        dword ptr [ecx+8]
 00467140    mov         eax,dword ptr [ebp-4]
 00467143    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 00467146    mov         eax,dword ptr [eax+ebx*4]
 00467149    mov         edx,edi
 0046714B    mov         si,0FFFC
 0046714F    call        @CallDynaInst
>00467154    jmp         0046716F
 00467156    xor         edx,edx
 00467158    mov         eax,edi
 0046715A    mov         ecx,dword ptr [eax]
 0046715C    call        dword ptr [ecx+0C]
 0046715F    mov         eax,dword ptr [ebp-4]
 00467162    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 00467165    mov         edx,dword ptr [eax+ebx*4]
 00467168    mov         eax,edi
 0046716A    mov         ecx,dword ptr [eax]
 0046716C    call        dword ptr [ecx+8]
 0046716F    inc         ebx
 00467170    dec         dword ptr [ebp-0C]
>00467173    jne         004670BA
 00467179    mov         eax,edi
 0046717B    mov         edx,dword ptr [eax]
 0046717D    call        dword ptr [edx+1C]
 00467180    xor         eax,eax
 00467182    pop         edx
 00467183    pop         ecx
 00467184    pop         ecx
 00467185    mov         dword ptr fs:[eax],edx
 00467188    push        46719D
 0046718D    mov         eax,dword ptr [ebp-8]
 00467190    call        TObject.Free
 00467195    ret
>00467196    jmp         @HandleFinally
>0046719B    jmp         0046718D
 0046719D    xor         eax,eax
 0046719F    pop         edx
 004671A0    pop         ecx
 004671A1    pop         ecx
 004671A2    mov         dword ptr fs:[eax],edx
 004671A5    push        4671BA
 004671AA    lea         eax,[ebp-10]
 004671AD    call        @LStrClr
 004671B2    ret
>004671B3    jmp         @HandleFinally
>004671B8    jmp         004671AA
 004671BA    pop         edi
 004671BB    pop         esi
 004671BC    pop         ebx
 004671BD    mov         esp,ebp
 004671BF    pop         ebp
 004671C0    ret
end;*}

//004671C4
{*procedure sub_004671C4(?:TPersistentObjectList; ?:?; ?:?; ?:?);
begin
 004671C4    push        ebp
 004671C5    mov         ebp,esp
 004671C7    add         esp,0FFFFFFF0
 004671CA    push        ebx
 004671CB    push        esi
 004671CC    push        edi
 004671CD    xor         ecx,ecx
 004671CF    mov         dword ptr [ebp-10],ecx
 004671D2    mov         dword ptr [ebp-0C],ecx
 004671D5    mov         ebx,edx
 004671D7    mov         edi,eax
 004671D9    xor         eax,eax
 004671DB    push        ebp
 004671DC    push        46737D
 004671E1    push        dword ptr fs:[eax]
 004671E4    mov         dword ptr fs:[eax],esp
 004671E7    mov         dl,1
 004671E9    mov         eax,[00417CEC];TList
 004671EE    call        TObject.Create;TList.Create
 004671F3    mov         dword ptr [ebp-8],eax
 004671F6    xor         edx,edx
 004671F8    push        ebp
 004671F9    push        46735B
 004671FE    push        dword ptr fs:[edx]
 00467201    mov         dword ptr fs:[edx],esp
 00467204    mov         eax,edi
 00467206    mov         si,0FFF3
 0046720A    call        @CallDynaInst
 0046720F    mov         eax,ebx
 00467211    mov         edx,dword ptr [eax]
 00467213    call        dword ptr [edx+0C]
 00467216    test        eax,eax
>00467218    jne         0046733C
 0046721E    mov         eax,ebx
 00467220    mov         edx,dword ptr [eax]
 00467222    call        dword ptr [edx+1C]
>00467225    jmp         00467324
 0046722A    mov         eax,ebx
 0046722C    mov         edx,dword ptr [eax]
 0046722E    call        dword ptr [edx+8]
 00467231    add         al,0FE
 00467233    sub         al,3
>00467235    jb          004672BC
 0046723B    dec         al
>0046723D    je          0046726A
 0046723F    add         al,0FE
 00467241    sub         al,2
>00467243    jb          0046724E
 00467245    sub         al,2
>00467247    je          0046726A
>00467249    jmp         00467303
 0046724E    mov         eax,ebx
 00467250    mov         edx,dword ptr [eax]
 00467252    call        dword ptr [edx+10]
 00467255    mov         eax,ebx
 00467257    mov         edx,dword ptr [eax]
 00467259    call        dword ptr [edx+0C]
 0046725C    mov         edx,eax
 0046725E    mov         eax,edi
 00467260    call        00466E24
>00467265    jmp         00467324
 0046726A    lea         edx,[ebp-0C]
 0046726D    mov         eax,ebx
 0046726F    mov         ecx,dword ptr [eax]
 00467271    call        dword ptr [ecx+14]
 00467274    mov         eax,dword ptr [ebp-0C]
 00467277    call        FindClass
 0046727C    mov         esi,eax
 0046727E    mov         edx,esi
 00467280    mov         eax,dword ptr [ebp-8]
 00467283    call        TList.Add
 00467288    mov         dl,1
 0046728A    mov         eax,esi
 0046728C    call        dword ptr [eax+0C]
 0046728F    mov         dword ptr [ebp-4],eax
 00467292    cmp         word ptr [ebp+0A],0
>00467297    je          004672A2
 00467299    mov         edx,dword ptr [ebp-4]
 0046729C    mov         eax,dword ptr [ebp+0C]
 0046729F    call        dword ptr [ebp+8]
 004672A2    mov         edx,ebx
 004672A4    mov         eax,dword ptr [ebp-4]
 004672A7    mov         si,0FFFB
 004672AB    call        @CallDynaInst
 004672B0    mov         edx,dword ptr [ebp-4]
 004672B3    mov         eax,edi
 004672B5    call        00466E24
>004672BA    jmp         00467324
 004672BC    mov         eax,ebx
 004672BE    mov         edx,dword ptr [eax]
 004672C0    call        dword ptr [edx+0C]
 004672C3    mov         edx,eax
 004672C5    mov         eax,dword ptr [ebp-8]
 004672C8    call        TList.Get
 004672CD    mov         esi,eax
 004672CF    mov         dl,1
 004672D1    mov         eax,esi
 004672D3    call        dword ptr [eax+0C]
 004672D6    mov         dword ptr [ebp-4],eax
 004672D9    cmp         word ptr [ebp+0A],0
>004672DE    je          004672E9
 004672E0    mov         edx,dword ptr [ebp-4]
 004672E3    mov         eax,dword ptr [ebp+0C]
 004672E6    call        dword ptr [ebp+8]
 004672E9    mov         edx,ebx
 004672EB    mov         eax,dword ptr [ebp-4]
 004672EE    mov         si,0FFFB
 004672F2    call        @CallDynaInst
 004672F7    mov         edx,dword ptr [ebp-4]
 004672FA    mov         eax,edi
 004672FC    call        00466E24
>00467301    jmp         00467324
 00467303    lea         edx,[ebp-10]
 00467306    mov         eax,466440;^gvar_005AF664
 0046730B    call        LoadStr
 00467310    mov         ecx,dword ptr [ebp-10]
 00467313    mov         dl,1
 00467315    mov         eax,[00408B30];Exception
 0046731A    call        Exception.Create;Exception.Create
 0046731F    call        @RaiseExcept
 00467324    mov         eax,ebx
 00467326    mov         edx,dword ptr [eax]
 00467328    call        dword ptr [edx+24]
 0046732B    test        al,al
>0046732D    je          0046722A
 00467333    mov         eax,ebx
 00467335    mov         edx,dword ptr [eax]
 00467337    call        dword ptr [edx+20]
>0046733A    jmp         00467345
 0046733C    mov         edx,eax
 0046733E    mov         eax,edi
 00467340    call        00466914
 00467345    xor         eax,eax
 00467347    pop         edx
 00467348    pop         ecx
 00467349    pop         ecx
 0046734A    mov         dword ptr fs:[eax],edx
 0046734D    push        467362
 00467352    mov         eax,dword ptr [ebp-8]
 00467355    call        TObject.Free
 0046735A    ret
>0046735B    jmp         @HandleFinally
>00467360    jmp         00467352
 00467362    xor         eax,eax
 00467364    pop         edx
 00467365    pop         ecx
 00467366    pop         ecx
 00467367    mov         dword ptr fs:[eax],edx
 0046736A    push        467384
 0046736F    lea         eax,[ebp-10]
 00467372    mov         edx,2
 00467377    call        @LStrArrayClr
 0046737C    ret
>0046737D    jmp         @HandleFinally
>00467382    jmp         0046736F
 00467384    pop         edi
 00467385    pop         esi
 00467386    pop         ebx
 00467387    mov         esp,ebp
 00467389    pop         ebp
 0046738A    ret         8
end;*}

//00467390
{*procedure TPersistentObjectList.sub_00466894(?:?);
begin
 00467390    push        eax
 00467391    mov         ecx,dword ptr [eax]
 00467393    mov         ecx,dword ptr [ecx+20]
 00467396    push        ecx
 00467397    call        004671C4
 0046739C    ret
end;*}

//004673A0
procedure sub_004673A0;
begin
{*
 004673A0    ret
*}
end;

//004673A4
{*function sub_004673A4(?:?):?;
begin
 004673A4    mov         edx,dword ptr [eax+0C]
 004673A7    test        edx,edx
>004673A9    jle         004673B8
 004673AB    mov         ecx,dword ptr [eax+8]
 004673AE    mov         edx,dword ptr [ecx+edx*4-4]
 004673B2    dec         dword ptr [eax+0C]
 004673B5    mov         eax,edx
 004673B7    ret
 004673B8    xor         edx,edx
 004673BA    mov         eax,edx
 004673BC    ret
end;*}

//004673C0
procedure sub_004673C0;
begin
{*
 004673C0    push        ebx
 004673C1    mov         eax,dword ptr [eax+4];TBinaryReader.?f4:dword
 004673C4    mov         ebx,dword ptr [eax]
 004673C6    call        dword ptr [ebx+0C]
 004673C9    pop         ebx
 004673CA    ret
*}
end;

//004673CC
{*function sub_004673CC(?:TBinaryReader):?;
begin
 004673CC    push        ebx
 004673CD    push        ecx
 004673CE    mov         edx,esp
 004673D0    mov         ecx,1
 004673D5    mov         eax,dword ptr [eax+4]
 004673D8    mov         ebx,dword ptr [eax]
 004673DA    call        dword ptr [ebx+0C]
 004673DD    mov         al,byte ptr [esp]
 004673E0    pop         edx
 004673E1    pop         ebx
 004673E2    ret
end;*}

//004673E4
{*function sub_004673E4:?;
begin
 004673E4    push        ebx
 004673E5    push        esi
 004673E6    add         esp,0FFFFFFF8
 004673E9    mov         esi,eax
 004673EB    mov         eax,dword ptr [esi+4];TBinaryReader.?f4:dword
 004673EE    call        TStream.GetPosition
 004673F3    mov         dword ptr [esp],eax
 004673F6    mov         dword ptr [esp+4],edx
 004673FA    mov         eax,esi
 004673FC    call        004673CC
 00467401    mov         ebx,eax
 00467403    push        dword ptr [esp+4]
 00467407    push        dword ptr [esp+4]
 0046740B    mov         eax,dword ptr [esi+4];TBinaryReader.?f4:dword
 0046740E    call        TStream.SetPosition
 00467413    mov         eax,ebx
 00467415    pop         ecx
 00467416    pop         edx
 00467417    pop         esi
 00467418    pop         ebx
 00467419    ret
end;*}

//0046741C
{*function sub_0046741C:?;
begin
 0046741C    push        ebx
 0046741D    add         esp,0FFFFFFF8
 00467420    mov         ebx,eax
 00467422    mov         eax,ebx
 00467424    call        004673CC
 00467429    sub         al,2
>0046742B    je          00467437
 0046742D    dec         al
>0046742F    je          00467451
 00467431    dec         al
>00467433    je          0046746B
>00467435    jmp         0046747B
 00467437    lea         edx,[esp+4]
 0046743B    mov         ecx,1
 00467440    mov         eax,ebx
 00467442    mov         ebx,dword ptr [eax]
 00467444    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
 00467447    movsx       eax,byte ptr [esp+4]
 0046744C    mov         dword ptr [esp],eax
>0046744F    jmp         00467487
 00467451    lea         edx,[esp+6]
 00467455    mov         ecx,2
 0046745A    mov         eax,ebx
 0046745C    mov         ebx,dword ptr [eax]
 0046745E    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
 00467461    movsx       eax,word ptr [esp+6]
 00467466    mov         dword ptr [esp],eax
>00467469    jmp         00467487
 0046746B    mov         edx,esp
 0046746D    mov         ecx,4
 00467472    mov         eax,ebx
 00467474    mov         ebx,dword ptr [eax]
 00467476    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
>00467479    jmp         00467487
 0046747B    xor         eax,eax
 0046747D    mov         dword ptr [esp],eax
 00467480    mov         eax,ebx
 00467482    call        0046665C
 00467487    mov         eax,dword ptr [esp]
 0046748A    pop         ecx
 0046748B    pop         edx
 0046748C    pop         ebx
 0046748D    ret
end;*}

//00467490
{*function sub_00467490:?;
begin
 00467490    push        ebx
 00467491    mov         ebx,eax
 00467493    mov         eax,ebx
 00467495    call        004673CC
 0046749A    sub         al,8
>0046749C    je          004674A6
 0046749E    dec         al
>004674A0    jne         004674AA
 004674A2    mov         al,1
 004674A4    pop         ebx
 004674A5    ret
 004674A6    xor         eax,eax
 004674A8    pop         ebx
 004674A9    ret
 004674AA    mov         eax,ebx
 004674AC    call        0046665C
 004674B1    xor         eax,eax
 004674B3    pop         ebx
 004674B4    ret
end;*}

//004674B8
{*procedure sub_004674B8(?:?);
begin
 004674B8    push        ebp
 004674B9    mov         ebp,esp
 004674BB    add         esp,0FFFFFFF4
 004674BE    push        ebx
 004674BF    push        esi
 004674C0    xor         ecx,ecx
 004674C2    mov         dword ptr [ebp-0C],ecx
 004674C5    mov         dword ptr [ebp-4],edx
 004674C8    mov         esi,eax
 004674CA    xor         eax,eax
 004674CC    push        ebp
 004674CD    push        46757B
 004674D2    push        dword ptr fs:[eax]
 004674D5    mov         dword ptr fs:[eax],esp
 004674D8    xor         eax,eax
 004674DA    mov         dword ptr [ebp-8],eax
 004674DD    mov         eax,esi
 004674DF    call        004673CC
 004674E4    mov         ebx,eax
 004674E6    xor         eax,eax
 004674E8    mov         al,bl
 004674EA    sub         eax,6
>004674ED    je          00467517
 004674EF    sub         eax,6
>004674F2    je          00467528
 004674F4    sub         eax,6
>004674F7    je          004674FE
 004674F9    sub         eax,2
>004674FC    jne         00467539
 004674FE    lea         ecx,[ebp-0C]
 00467501    mov         edx,ebx
 00467503    mov         eax,esi
 00467505    call        00467588
 0046750A    mov         edx,dword ptr [ebp-0C]
 0046750D    mov         eax,dword ptr [ebp-4]
 00467510    call        @LStrFromWStr
>00467515    jmp         00467565
 00467517    lea         edx,[ebp-8]
 0046751A    mov         ecx,1
 0046751F    mov         eax,esi
 00467521    mov         ebx,dword ptr [eax]
 00467523    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
>00467526    jmp         00467540
 00467528    lea         edx,[ebp-8]
 0046752B    mov         ecx,4
 00467530    mov         eax,esi
 00467532    mov         ebx,dword ptr [eax]
 00467534    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
>00467537    jmp         00467540
 00467539    mov         eax,esi
 0046753B    call        0046665C
 00467540    mov         eax,dword ptr [ebp-4]
 00467543    mov         edx,dword ptr [ebp-8]
 00467546    call        @LStrSetLength
 0046754B    cmp         dword ptr [ebp-8],0
>0046754F    jbe         00467565
 00467551    mov         eax,dword ptr [ebp-4]
 00467554    call        @UniqueStringA
 00467559    mov         edx,eax
 0046755B    mov         ecx,dword ptr [ebp-8]
 0046755E    mov         eax,esi
 00467560    mov         ebx,dword ptr [eax]
 00467562    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
 00467565    xor         eax,eax
 00467567    pop         edx
 00467568    pop         ecx
 00467569    pop         ecx
 0046756A    mov         dword ptr fs:[eax],edx
 0046756D    push        467582
 00467572    lea         eax,[ebp-0C]
 00467575    call        @WStrClr
 0046757A    ret
>0046757B    jmp         @HandleFinally
>00467580    jmp         00467572
 00467582    pop         esi
 00467583    pop         ebx
 00467584    mov         esp,ebp
 00467586    pop         ebp
 00467587    ret
end;*}

//00467588
{*procedure sub_00467588(?:TBinaryReader; ?:?; ?:?);
begin
 00467588    push        ebp
 00467589    mov         ebp,esp
 0046758B    add         esp,0FFFFFFF4
 0046758E    push        ebx
 0046758F    push        esi
 00467590    push        edi
 00467591    xor         ebx,ebx
 00467593    mov         dword ptr [ebp-0C],ebx
 00467596    mov         dword ptr [ebp-4],ecx
 00467599    mov         ebx,edx
 0046759B    mov         esi,eax
 0046759D    xor         eax,eax
 0046759F    push        ebp
 004675A0    push        467644
 004675A5    push        dword ptr fs:[eax]
 004675A8    mov         dword ptr fs:[eax],esp
 004675AB    lea         edx,[ebp-8]
 004675AE    mov         ecx,4
 004675B3    mov         eax,esi
 004675B5    mov         edi,dword ptr [eax]
 004675B7    call        dword ptr [edi+4];TBinaryReader.sub_004673C0
 004675BA    xor         eax,eax
 004675BC    mov         al,bl
 004675BE    sub         eax,12
>004675C1    je          004675CA
 004675C3    sub         eax,2
>004675C6    je          004675F5
>004675C8    jmp         00467627
 004675CA    mov         eax,dword ptr [ebp-4]
 004675CD    mov         edx,dword ptr [ebp-8]
 004675D0    call        @WStrSetLength
 004675D5    cmp         dword ptr [ebp-8],0
>004675D9    jbe         0046762E
 004675DB    mov         eax,dword ptr [ebp-4]
 004675DE    mov         eax,dword ptr [eax]
 004675E0    call        @WStrToPWChar
 004675E5    mov         edx,eax
 004675E7    mov         ecx,dword ptr [ebp-8]
 004675EA    add         ecx,ecx
 004675EC    mov         eax,esi
 004675EE    mov         ebx,dword ptr [eax]
 004675F0    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
>004675F3    jmp         0046762E
 004675F5    lea         eax,[ebp-0C]
 004675F8    mov         edx,dword ptr [ebp-8]
 004675FB    call        @LStrSetLength
 00467600    cmp         dword ptr [ebp-8],0
>00467604    jbe         0046762E
 00467606    lea         eax,[ebp-0C]
 00467609    call        @UniqueStringA
 0046760E    mov         edx,eax
 00467610    mov         ecx,dword ptr [ebp-8]
 00467613    mov         eax,esi
 00467615    mov         ebx,dword ptr [eax]
 00467617    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
 0046761A    mov         edx,dword ptr [ebp-4]
 0046761D    mov         eax,dword ptr [ebp-0C]
 00467620    call        00466524
>00467625    jmp         0046762E
 00467627    mov         eax,esi
 00467629    call        0046665C
 0046762E    xor         eax,eax
 00467630    pop         edx
 00467631    pop         ecx
 00467632    pop         ecx
 00467633    mov         dword ptr fs:[eax],edx
 00467636    push        46764B
 0046763B    lea         eax,[ebp-0C]
 0046763E    call        @LStrClr
 00467643    ret
>00467644    jmp         @HandleFinally
>00467649    jmp         0046763B
 0046764B    pop         edi
 0046764C    pop         esi
 0046764D    pop         ebx
 0046764E    mov         esp,ebp
 00467650    pop         ebp
 00467651    ret
end;*}

//00467654
procedure sub_00467654;
begin
{*
 00467654    push        ebx
 00467655    add         esp,0FFFFFFF4
 00467658    mov         ebx,eax
 0046765A    mov         eax,ebx
 0046765C    call        004673CC
 00467661    cmp         al,5
>00467663    jne         00467675
 00467665    mov         edx,esp
 00467667    mov         ecx,0A
 0046766C    mov         eax,ebx
 0046766E    mov         ebx,dword ptr [eax]
 00467670    call        dword ptr [ebx+4];TBinaryReader.sub_004673C0
>00467673    jmp         0046767C
 00467675    mov         eax,ebx
 00467677    call        0046665C
 0046767C    fld         tbyte ptr [esp]
 0046767F    add         esp,0C
 00467682    pop         ebx
 00467683    ret
*}
end;

//00467684
procedure sub_00467684;
begin
{*
 00467684    push        ebx
 00467685    mov         ebx,eax
 00467687    mov         eax,ebx
 00467689    call        004673CC
 0046768E    cmp         al,1
>00467690    je          00467699
 00467692    mov         eax,ebx
 00467694    call        0046665C
 00467699    pop         ebx
 0046769A    ret
*}
end;

//0046769C
procedure sub_0046769C;
begin
{*
 0046769C    push        ebx
 0046769D    mov         ebx,eax
 0046769F    mov         eax,ebx
 004676A1    call        004673CC
 004676A6    test        al,al
>004676A8    je          004676B1
 004676AA    mov         eax,ebx
 004676AC    call        0046665C
 004676B1    pop         ebx
 004676B2    ret
*}
end;

//004676B4
function sub_004676B4:Boolean;
begin
{*
 004676B4    push        ebx
 004676B5    mov         ebx,eax
 004676B7    mov         eax,ebx
 004676B9    mov         edx,dword ptr [eax]
 004676BB    call        dword ptr [edx+8];TBinaryReader.sub_004673E4
 004676BE    test        al,al
 004676C0    sete        al
 004676C3    pop         ebx
 004676C4    ret
*}
end;

//004676C8
procedure sub_004676C8;
begin
{*
 004676C8    push        ebx
 004676C9    mov         eax,dword ptr [eax+4];TBinaryWriter.?f4:dword
 004676CC    mov         ebx,dword ptr [eax]
 004676CE    call        dword ptr [ebx+10]
 004676D1    pop         ebx
 004676D2    ret
*}
end;

//004676D4
{*procedure sub_004676D4(?:?);
begin
 004676D4    push        ebx
 004676D5    add         esp,0FFFFFFF8
 004676D8    mov         dword ptr [esp+1],edx
 004676DC    cmp         edx,0FFFFFF80
>004676DF    jl          004676F8
 004676E1    cmp         edx,7F
>004676E4    jg          004676F8
 004676E6    mov         byte ptr [esp],2
 004676EA    mov         edx,esp
 004676EC    mov         ecx,2
 004676F1    mov         ebx,dword ptr [eax]
 004676F3    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
>004676F6    jmp         0046772A
 004676F8    cmp         edx,0FFFF8000
>004676FE    jl          0046771A
 00467700    cmp         edx,7FFF
>00467706    jg          0046771A
 00467708    mov         byte ptr [esp],3
 0046770C    mov         edx,esp
 0046770E    mov         ecx,3
 00467713    mov         ebx,dword ptr [eax]
 00467715    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
>00467718    jmp         0046772A
 0046771A    mov         byte ptr [esp],4
 0046771E    mov         edx,esp
 00467720    mov         ecx,5
 00467725    mov         ebx,dword ptr [eax]
 00467727    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
 0046772A    pop         ecx
 0046772B    pop         edx
 0046772C    pop         ebx
 0046772D    ret
end;*}

//00467730
{*procedure sub_00467730(?:?);
begin
 00467730    push        ebx
 00467731    and         edx,7F
 00467734    add         edx,5AD1CC
 0046773A    mov         ecx,1
 0046773F    mov         ebx,dword ptr [eax]
 00467741    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
 00467744    pop         ebx
 00467745    ret
end;*}

//00467748
{*procedure sub_00467748(?:?);
begin
 00467748    push        ebx
 00467749    push        esi
 0046774A    push        edi
 0046774B    add         esp,0FFFFFFF8
 0046774E    mov         edi,edx
 00467750    mov         ebx,eax
 00467752    mov         eax,edi
 00467754    call        @LStrLen
 00467759    mov         esi,eax
 0046775B    mov         dword ptr [esp+1],esi
 0046775F    cmp         esi,0FF
>00467765    jg          00467795
 00467767    mov         byte ptr [esp],6
 0046776B    mov         edx,esp
 0046776D    mov         ecx,2
 00467772    mov         eax,ebx
 00467774    mov         esi,dword ptr [eax]
 00467776    call        dword ptr [esi+4];TBinaryWriter.sub_004676C8
 00467779    mov         esi,dword ptr [esp+1]
 0046777D    test        esi,esi
>0046777F    jle         004677BB
 00467781    mov         eax,edi
 00467783    call        @LStrToPChar
 00467788    mov         edx,eax
 0046778A    mov         ecx,esi
 0046778C    mov         eax,ebx
 0046778E    mov         ebx,dword ptr [eax]
 00467790    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
>00467793    jmp         004677BB
 00467795    mov         byte ptr [esp],0C
 00467799    mov         edx,esp
 0046779B    mov         ecx,5
 004677A0    mov         eax,ebx
 004677A2    mov         esi,dword ptr [eax]
 004677A4    call        dword ptr [esi+4];TBinaryWriter.sub_004676C8
 004677A7    mov         eax,edi
 004677A9    call        @LStrToPChar
 004677AE    mov         edx,eax
 004677B0    mov         ecx,dword ptr [esp+1]
 004677B4    mov         eax,ebx
 004677B6    mov         ebx,dword ptr [eax]
 004677B8    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
 004677BB    pop         ecx
 004677BC    pop         edx
 004677BD    pop         edi
 004677BE    pop         esi
 004677BF    pop         ebx
 004677C0    ret
end;*}

//004677C4
{*procedure sub_004677C4(?:?; ?:?; ?:?);
begin
 004677C4    push        ebp
 004677C5    mov         ebp,esp
 004677C7    add         esp,0FFFFFFF4
 004677CA    push        ebx
 004677CB    mov         byte ptr [ebp-0B],5
 004677CF    mov         edx,dword ptr [ebp+8]
 004677D2    mov         dword ptr [ebp-0A],edx
 004677D5    mov         edx,dword ptr [ebp+0C]
 004677D8    mov         dword ptr [ebp-6],edx
 004677DB    mov         dx,word ptr [ebp+10]
 004677DF    mov         word ptr [ebp-2],dx
 004677E3    lea         edx,[ebp-0B]
 004677E6    mov         ecx,0B
 004677EB    mov         ebx,dword ptr [eax]
 004677ED    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
 004677F0    pop         ebx
 004677F1    mov         esp,ebp
 004677F3    pop         ebp
 004677F4    ret         0C
end;*}

//004677F8
procedure sub_004677F8;
begin
{*
 004677F8    push        ebx
 004677F9    mov         edx,5AD1D0
 004677FE    mov         ecx,1
 00467803    mov         ebx,dword ptr [eax]
 00467805    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
 00467808    pop         ebx
 00467809    ret
*}
end;

//0046780C
procedure sub_0046780C;
begin
{*
 0046780C    push        ebx
 0046780D    mov         edx,5AD1D4
 00467812    mov         ecx,1
 00467817    mov         ebx,dword ptr [eax]
 00467819    call        dword ptr [ebx+4];TBinaryWriter.sub_004676C8
 0046781C    pop         ebx
 0046781D    ret
*}
end;

Initialization
//00467850
{*
 00467850    sub         dword ptr ds:[5E1338],1
>00467857    jae         00467863
 00467859    mov         eax,[00466194];TPersistentObjectList
 0046785E    call        RegisterClass
 00467863    ret
*}
Finalization
end.