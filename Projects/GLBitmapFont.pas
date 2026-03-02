//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLBitmapFont;

interface

uses
  SysUtils, Classes, GLBitmapFont, Graphics, , GLTexture;

type
  TBitmapFontRange = class(TCollectionItem)
  public
    StartASCII:Char;//fC
    StopASCII:Char;//fD
    StartGlyphIdx:Integer;//f10
    destructor Destroy; virtual;//0049FED4
    procedure Assign(Source:TPersistent); virtual;//v8//0049FEFC
    //procedure GetDisplayName(?:?); virtual;//vC//0049FF54
    constructor Create(Collection:TCollection); virtual;//v1C//0049FE9C
    procedure SetStartASCII(Value:Char);//0049FFE0
    procedure SetStopASCII(Value:Char);//0049FFF8
    procedure SetStartGlyphIdx(Value:Integer);//004A0010
  end;
  TBitmapFontRanges = class(TCollection)
  public
    f18:dword;//f18
    destructor Destroy; virtual;//004A0068
    procedure sub_0041ADA4; dynamic;//004A0090
    constructor Create;//004A0028
  end;
  TDynIntegerArray = array of ?;
//elSize = 4
//varType equivalent: varInteger;
  .4 = array of ?;
//elSize = 10;
  TGLCustomBitmapFont = class(TGLUpdateAbleComponent)
  public
    f30:TBitmapFontRanges;//f30
    f34:TPicture;//f34
    f38:Integer;//f38
    f3C:Integer;//f3C
    f40:Integer;//f40
    f44:Integer;//f44
    f48:Integer;//f48
    f4C:Integer;//f4C
    f54:TList;//f54
    f58:TGLTextureHandle;//f58
    f5C:byte;//f5C
    f5D:byte;//f5D
    f5E:byte;//f5E
    f60:dword;//f60
    f64:dword;//f64
    f68:byte;//f68
    f6C:TDynIntegerArray;//f6C
    f70:.4;//f70
    destructor Destroy; virtual;//004A0184
    constructor Create(AOwner:TComponent); virtual;//v2C//004A00D4
    procedure v38; virtual;//v38//004A0490
    //procedure v3C(?:?); virtual;//v3C//004A03F0
    procedure v40; virtual;//v40//004A0484
    procedure sub_004A0E68; dynamic;//004A0E68
    procedure sub_004A0E54; dynamic;//004A0E54
  end;
  TGLBitmapFont = class(TGLCustomBitmapFont)
    procedure SetRanges(Value:TBitmapFontRanges);//004A0314
    procedure SetGlyphs(Value:TPicture);//004A0328
    procedure SetCharWidth(Value:Integer);//004A0338
    procedure SetCharHeight(Value:Integer);//004A0354
    procedure SetGlyphsIntervalX(Value:Integer);//004A0370
    procedure SetGlyphsIntervalY(Value:Integer);//004A0384
    procedure SetHSpace(Value:Integer);//004A0398
    procedure SetVSpace(Value:Integer);//004A03AC
    procedure SetMagFilter(Value:TGLMagFilter);//004A03C0
    procedure SetMinFilter(Value:TGLMinFilter);//004A03D4
  end;
  TGLFlatTextOption = (ftoTwoSided);
  TGLFlatTextOptions = set of TGLFlatTextOption;
  TGLFlatText = class(TGLImmaterialSceneObject)
  public
    BitmapFont:TGLCustomBitmapFont;//f98
    Text:String;//f9C
    Alignment:TAlignment;//fA0
    Layout:TGLTextLayout;//fA1
    ModulateColor:TGLColor;//fA4
    Options:TGLFlatTextOptions;//fA8
    destructor Destroy; virtual;//004A0ED4
    procedure Assign(Source:TPersistent); virtual;//v8//004A10F8
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004A0F10
    constructor Create(AOwner:TComponent); virtual;//v2C//004A0E70
    //procedure v68(?:?); virtual;//v68//004A101C
    procedure SetBitmapFont(Value:TGLCustomBitmapFont);//004A0F40
    procedure SetText(Value:String);//004A0F90
    procedure SetAlignment(Value:TAlignment);//004A0FB4
    procedure SetLayout(Value:TGLTextLayout);//004A0FCC
    procedure SetModulateColor(Value:TGLColor);//004A0FE4
    procedure SetOptions(Value:TGLFlatTextOptions);//004A0FF0
  end;
    constructor Create(Collection:TCollection);//0049FE9C
    destructor Destroy;//0049FED4
    procedure Assign(Source:TPersistent);//0049FEFC
    procedure sub_0049FF34(?:TBitmapFontRange);//0049FF34
    //procedure GetDisplayName(?:?);//0049FF54
    destructor Destroy;//004A0068
    procedure sub_0041ADA4;//004A0090
    //procedure sub_004A0094(?:?; ?:?);//004A0094
    procedure sub_004A00A8(?:TCollection);//004A00A8
    constructor Create(AOwner:TComponent);//004A00D4
    destructor Destroy;//004A0184
    //function sub_004A0244(?:?; ?:?):?;//004A0244
    //function sub_004A0270(?:?; ?:?):?;//004A0270
    //procedure sub_004A02CC(?:TGLBitmapFont; ?:?);//004A02CC
    //procedure sub_004A03F0(?:?);//004A03F0
    procedure sub_004A0484;//004A0484
    procedure sub_004A0490;//004A0490
    //procedure sub_004A062C(?:?);//004A062C
    //procedure sub_004A06D0(?:?; ?:?);//004A06D0
    //procedure sub_004A07CC(?:?);//004A07CC
    //procedure sub_004A0888(?:TGLCustomBitmapFont; ?:?; ?:String; ?:?; ?:?; ?:?);//004A0888
    //function sub_004A0C4C(?:?):?;//004A0C4C
    //procedure sub_004A0C78(?:?; ?:?; ?:?; ?:?);//004A0C78
    procedure sub_004A0E08(?:TGLBitmapFont; ?:TBitmapFontRanges);//004A0E08
    procedure sub_004A0E54;//004A0E54
    procedure sub_004A0E68;//004A0E68
    constructor Create(AOwner:TComponent);//004A0E70
    destructor Destroy;//004A0ED4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004A0F10
    //procedure sub_004A101C(?:?);//004A101C
    procedure Assign(Source:TPersistent);//004A10F8

implementation

//0049FE9C
constructor TBitmapFontRange.Create(Collection:TCollection);
begin
{*
 0049FE9C    push        ebx
 0049FE9D    push        esi
 0049FE9E    test        dl,dl
>0049FEA0    je          0049FEAA
 0049FEA2    add         esp,0FFFFFFF0
 0049FEA5    call        @ClassCreate
 0049FEAA    mov         ebx,edx
 0049FEAC    mov         esi,eax
 0049FEAE    xor         edx,edx
 0049FEB0    mov         eax,esi
 0049FEB2    call        TCollectionItem.Create
 0049FEB7    mov         eax,esi
 0049FEB9    test        bl,bl
>0049FEBB    je          0049FECC
 0049FEBD    call        @AfterConstruction
 0049FEC2    pop         dword ptr fs:[0]
 0049FEC9    add         esp,0C
 0049FECC    mov         eax,esi
 0049FECE    pop         esi
 0049FECF    pop         ebx
 0049FED0    ret
*}
end;

//0049FED4
destructor TBitmapFontRange.Destroy;
begin
{*
 0049FED4    push        ebx
 0049FED5    push        esi
 0049FED6    call        @BeforeDestruction
 0049FEDB    mov         ebx,edx
 0049FEDD    mov         esi,eax
 0049FEDF    mov         edx,ebx
 0049FEE1    and         dl,0FC
 0049FEE4    mov         eax,esi
 0049FEE6    call        TCollectionItem.Destroy
 0049FEEB    test        bl,bl
>0049FEED    jle         0049FEF6
 0049FEEF    mov         eax,esi
 0049FEF1    call        @ClassDestroy
 0049FEF6    pop         esi
 0049FEF7    pop         ebx
 0049FEF8    ret
*}
end;

//0049FEFC
procedure TBitmapFontRange.Assign(Source:TPersistent);
begin
{*
 0049FEFC    push        ebx
 0049FEFD    push        esi
 0049FEFE    mov         esi,edx
 0049FF00    mov         ebx,eax
 0049FF02    mov         eax,esi
 0049FF04    mov         edx,dword ptr ds:[49F6C8];TBitmapFontRange
 0049FF0A    call        @IsClass
 0049FF0F    test        al,al
>0049FF11    je          0049FF27
 0049FF13    mov         eax,esi
 0049FF15    mov         dl,byte ptr [eax+0C]
 0049FF18    mov         byte ptr [ebx+0C],dl;TBitmapFontRange.StartASCII:Char
 0049FF1B    mov         dl,byte ptr [eax+0D]
 0049FF1E    mov         byte ptr [ebx+0D],dl;TBitmapFontRange.StopASCII:Char
 0049FF21    mov         eax,dword ptr [eax+10]
 0049FF24    mov         dword ptr [ebx+10],eax;TBitmapFontRange.StartGlyphIdx:Integer
 0049FF27    mov         edx,esi
 0049FF29    mov         eax,ebx
 0049FF2B    call        TPersistent.Assign
 0049FF30    pop         esi
 0049FF31    pop         ebx
 0049FF32    ret
*}
end;

//0049FF34
procedure sub_0049FF34(?:TBitmapFontRange);
begin
{*
 0049FF34    push        ebx
 0049FF35    push        esi
 0049FF36    mov         ebx,eax
 0049FF38    mov         esi,dword ptr [ebx+4]
 0049FF3B    test        esi,esi
>0049FF3D    je          0049FF51
 0049FF3F    mov         eax,esi
 0049FF41    mov         edx,dword ptr ds:[49F7E8];TBitmapFontRanges
 0049FF47    call        @AsClass
 0049FF4C    call        004A00A8
 0049FF51    pop         esi
 0049FF52    pop         ebx
 0049FF53    ret
*}
end;

//0049FF54
{*procedure TBitmapFontRange.GetDisplayName(?:?);
begin
 0049FF54    push        ebx
 0049FF55    push        esi
 0049FF56    push        edi
 0049FF57    push        ebp
 0049FF58    add         esp,0FFFFFFDC
 0049FF5B    mov         dword ptr [esp],edx
 0049FF5E    mov         ebx,eax
 0049FF60    mov         eax,dword ptr [esp]
 0049FF63    push        eax
 0049FF64    movzx       ebp,byte ptr [ebx+0C];TBitmapFontRange.StartASCII:Char
 0049FF68    mov         dword ptr [esp+8],ebp
 0049FF6C    mov         byte ptr [esp+0C],0
 0049FF71    movzx       edi,byte ptr [ebx+0D];TBitmapFontRange.StopASCII:Char
 0049FF75    mov         dword ptr [esp+10],edi
 0049FF79    mov         byte ptr [esp+14],0
 0049FF7E    mov         esi,dword ptr [ebx+10];TBitmapFontRange.StartGlyphIdx:Integer
 0049FF81    mov         dword ptr [esp+18],esi
 0049FF85    mov         byte ptr [esp+1C],0
 0049FF8A    add         edi,esi
 0049FF8C    sub         edi,ebp
 0049FF8E    mov         dword ptr [esp+20],edi
 0049FF92    mov         byte ptr [esp+24],0
 0049FF97    lea         edx,[esp+8]
 0049FF9B    mov         ecx,3
 0049FFA0    mov         eax,49FFBC;'ASCII [#%d, #%d] -> Glyphs [%d, %d]'
 0049FFA5    call        Format
 0049FFAA    add         esp,24
 0049FFAD    pop         ebp
 0049FFAE    pop         edi
 0049FFAF    pop         esi
 0049FFB0    pop         ebx
 0049FFB1    ret
end;*}

//0049FFE0
procedure TBitmapFontRange.SetStartASCII(Value:Char);
begin
{*
 0049FFE0    cmp         dl,byte ptr [eax+0C];TBitmapFontRange.StartASCII:Char
>0049FFE3    je          0049FFF7
 0049FFE5    mov         ecx,edx
 0049FFE7    mov         byte ptr [eax+0C],cl;TBitmapFontRange.StartASCII:Char
 0049FFEA    cmp         cl,byte ptr [eax+0D];TBitmapFontRange.StopASCII:Char
>0049FFED    jbe         0049FFF2
 0049FFEF    mov         byte ptr [eax+0D],cl;TBitmapFontRange.StopASCII:Char
 0049FFF2    call        0049FF34
 0049FFF7    ret
*}
end;

//0049FFF8
procedure TBitmapFontRange.SetStopASCII(Value:Char);
begin
{*
 0049FFF8    cmp         dl,byte ptr [eax+0D];TBitmapFontRange.StopASCII:Char
>0049FFFB    je          004A000F
 0049FFFD    mov         ecx,edx
 0049FFFF    mov         byte ptr [eax+0D],cl;TBitmapFontRange.StopASCII:Char
 004A0002    cmp         cl,byte ptr [eax+0C];TBitmapFontRange.StartASCII:Char
>004A0005    jae         004A000A
 004A0007    mov         byte ptr [eax+0C],cl;TBitmapFontRange.StartASCII:Char
 004A000A    call        0049FF34
 004A000F    ret
*}
end;

//004A0010
procedure TBitmapFontRange.SetStartGlyphIdx(Value:Integer);
begin
{*
 004A0010    test        edx,edx
>004A0012    jl          004A0019
 004A0014    mov         dword ptr [eax+10],edx;TBitmapFontRange.StartGlyphIdx:Integer
>004A0017    jmp         004A001E
 004A0019    xor         edx,edx
 004A001B    mov         dword ptr [eax+10],edx;TBitmapFontRange.StartGlyphIdx:Integer
 004A001E    mov         eax,dword ptr [eax+4];TBitmapFontRange.FCollection:TCollection
 004A0021    call        004A00A8
 004A0026    ret
*}
end;

//004A0028
constructor TBitmapFontRanges.Create;
begin
{*
 004A0028    push        ebx
 004A0029    push        esi
 004A002A    test        dl,dl
>004A002C    je          004A0036
 004A002E    add         esp,0FFFFFFF0
 004A0031    call        @ClassCreate
 004A0036    mov         ebx,edx
 004A0038    mov         esi,eax
 004A003A    mov         dword ptr [esi+18],ecx
 004A003D    mov         ecx,dword ptr ds:[49F6C8];TBitmapFontRange
 004A0043    xor         edx,edx
 004A0045    mov         eax,esi
 004A0047    call        TCollection.Create
 004A004C    mov         eax,esi
 004A004E    test        bl,bl
>004A0050    je          004A0061
 004A0052    call        @AfterConstruction
 004A0057    pop         dword ptr fs:[0]
 004A005E    add         esp,0C
 004A0061    mov         eax,esi
 004A0063    pop         esi
 004A0064    pop         ebx
 004A0065    ret
*}
end;

//004A0068
destructor TBitmapFontRanges.Destroy;
begin
{*
 004A0068    push        ebx
 004A0069    push        esi
 004A006A    call        @BeforeDestruction
 004A006F    mov         ebx,edx
 004A0071    mov         esi,eax
 004A0073    mov         edx,ebx
 004A0075    and         dl,0FC
 004A0078    mov         eax,esi
 004A007A    call        TCollection.Destroy
 004A007F    test        bl,bl
>004A0081    jle         004A008A
 004A0083    mov         eax,esi
 004A0085    call        @ClassDestroy
 004A008A    pop         esi
 004A008B    pop         ebx
 004A008C    ret
*}
end;

//004A0090
procedure TBitmapFontRanges.sub_0041ADA4;
begin
{*
 004A0090    mov         eax,dword ptr [eax+18];TBitmapFontRanges.?f18:dword
 004A0093    ret
*}
end;

//004A0094
{*procedure sub_004A0094(?:?; ?:?);
begin
 004A0094    push        ebx
 004A0095    push        esi
 004A0096    mov         esi,edx
 004A0098    mov         ebx,eax
 004A009A    mov         edx,esi
 004A009C    mov         eax,ebx
 004A009E    call        TCollection.GetItem
 004A00A3    pop         esi
 004A00A4    pop         ebx
 004A00A5    ret
end;*}

//004A00A8
procedure sub_004A00A8(?:TCollection);
begin
{*
 004A00A8    push        ebx
 004A00A9    push        esi
 004A00AA    mov         ebx,eax
 004A00AC    mov         esi,dword ptr [ebx+18]
 004A00AF    test        esi,esi
>004A00B1    je          004A00CF
 004A00B3    mov         eax,esi
 004A00B5    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 004A00BB    call        @IsClass
 004A00C0    test        al,al
>004A00C2    je          004A00CF
 004A00C4    mov         eax,esi
 004A00C6    mov         si,0FFE7
 004A00CA    call        @CallDynaInst
 004A00CF    pop         esi
 004A00D0    pop         ebx
 004A00D1    ret
*}
end;

//004A00D4
constructor TGLCustomBitmapFont.Create(AOwner:TComponent);
begin
{*
 004A00D4    push        ebp
 004A00D5    mov         ebp,esp
 004A00D7    push        ecx
 004A00D8    push        ebx
 004A00D9    push        esi
 004A00DA    test        dl,dl
>004A00DC    je          004A00E6
 004A00DE    add         esp,0FFFFFFF0
 004A00E1    call        @ClassCreate
 004A00E6    mov         byte ptr [ebp-1],dl
 004A00E9    mov         ebx,eax
 004A00EB    xor         edx,edx
 004A00ED    mov         eax,ebx
 004A00EF    call        TComponent.Create
 004A00F4    mov         ecx,ebx
 004A00F6    mov         dl,1
 004A00F8    mov         eax,[0049F7E8];TBitmapFontRanges
 004A00FD    call        TBitmapFontRanges.Create;TBitmapFontRanges.Create
 004A0102    mov         dword ptr [ebx+30],eax;TGLCustomBitmapFont.?f30:TBitmapFontRanges
 004A0105    mov         dl,1
 004A0107    mov         eax,[00424C0C];TPicture
 004A010C    call        TPicture.Create;TPicture.Create
 004A0111    mov         esi,eax
 004A0113    mov         dword ptr [ebx+34],esi;TGLCustomBitmapFont.?f34:TPicture
 004A0116    mov         dword ptr [esi+14],ebx;TPicture.?f14:TGLPersistentImage
 004A0119    mov         dword ptr [esi+10],4A03E8;TPicture.FOnChange:TNotifyEvent
 004A0120    mov         dword ptr [ebx+38],10;TGLCustomBitmapFont.?f38:Integer
 004A0127    mov         dword ptr [ebx+3C],10;TGLCustomBitmapFont.?f3C:Integer
 004A012E    mov         dword ptr [ebx+48],1;TGLCustomBitmapFont.?f48:Integer
 004A0135    mov         dword ptr [ebx+4C],1;TGLCustomBitmapFont.?f4C:Integer
 004A013C    mov         dl,1
 004A013E    mov         eax,[00417CEC];TList
 004A0143    call        TObject.Create;TList.Create
 004A0148    mov         dword ptr [ebx+54],eax;TGLCustomBitmapFont.?f54:TList
 004A014B    mov         byte ptr [ebx+5C],1;TGLCustomBitmapFont.?f5C:byte
 004A014F    mov         byte ptr [ebx+5D],1;TGLCustomBitmapFont.?f5D:byte
 004A0153    mov         byte ptr [ebx+5E],1;TGLCustomBitmapFont.?f5E:byte
 004A0157    mov         dl,1
 004A0159    mov         eax,[0046C11C];TGLTextureHandle
 004A015E    call        TGLVirtualHandle.Create;TGLTextureHandle.Create
 004A0163    mov         dword ptr [ebx+58],eax;TGLCustomBitmapFont.?f58:TGLTextureHandle
 004A0166    mov         eax,ebx
 004A0168    cmp         byte ptr [ebp-1],0
>004A016C    je          004A017D
 004A016E    call        @AfterConstruction
 004A0173    pop         dword ptr fs:[0]
 004A017A    add         esp,0C
 004A017D    mov         eax,ebx
 004A017F    pop         esi
 004A0180    pop         ebx
 004A0181    pop         ecx
 004A0182    pop         ebp
 004A0183    ret
*}
end;

//004A0184
destructor TGLCustomBitmapFont.Destroy;
begin
{*
 004A0184    push        ebx
 004A0185    push        esi
 004A0186    call        @BeforeDestruction
 004A018B    mov         ebx,edx
 004A018D    mov         esi,eax
 004A018F    mov         edx,ebx
 004A0191    and         dl,0FC
 004A0194    mov         eax,esi
 004A0196    call        TComponent.Destroy
 004A019B    mov         eax,dword ptr [esi+58];TGLCustomBitmapFont.?f58:TGLTextureHandle
 004A019E    call        TObject.Free
 004A01A3    mov         eax,dword ptr [esi+30];TGLCustomBitmapFont.?f30:TBitmapFontRanges
 004A01A6    call        TObject.Free
 004A01AB    mov         eax,dword ptr [esi+34];TGLCustomBitmapFont.?f34:TPicture
 004A01AE    call        TObject.Free
 004A01B3    mov         eax,dword ptr [esi+54];TGLCustomBitmapFont.?f54:TList
 004A01B6    cmp         dword ptr [eax+8],0;TList.FCount:Integer
>004A01BA    je          004A01D0
 004A01BC    mov         ecx,210
 004A01C1    mov         edx,4A01F0;'C:\GLScene\glscene_v_1000714\Source\GLBitmapFont.pas'
 004A01C6    mov         eax,4A0230;'Assertion failure'
 004A01CB    call        @Assert
 004A01D0    mov         eax,dword ptr [esi+54];TGLCustomBitmapFont.?f54:TList
 004A01D3    call        TObject.Free
 004A01D8    test        bl,bl
>004A01DA    jle         004A01E3
 004A01DC    mov         eax,esi
 004A01DE    call        @ClassDestroy
 004A01E3    pop         esi
 004A01E4    pop         ebx
 004A01E5    ret
*}
end;

//004A0244
{*function sub_004A0244(?:?; ?:?):?;
begin
 004A0244    push        ebx
 004A0245    push        esi
 004A0246    mov         ebx,edx
 004A0248    mov         esi,eax
 004A024A    mov         eax,dword ptr [esi+6C]
 004A024D    call        @DynArrayLength
 004A0252    test        eax,eax
>004A0254    jne         004A0260
 004A0256    or          edx,0FFFFFFFF
 004A0259    mov         eax,esi
 004A025B    call        004A02CC
 004A0260    xor         eax,eax
 004A0262    mov         al,bl
 004A0264    mov         edx,dword ptr [esi+6C]
 004A0267    mov         eax,dword ptr [edx+eax*4]
 004A026A    pop         esi
 004A026B    pop         ebx
 004A026C    ret
end;*}

//004A0270
{*function sub_004A0270(?:?; ?:?):?;
begin
 004A0270    push        ebx
 004A0271    push        esi
 004A0272    push        edi
 004A0273    push        ebp
 004A0274    push        ecx
 004A0275    mov         ebp,edx
 004A0277    mov         esi,eax
 004A0279    test        ebp,ebp
>004A027B    je          004A02BC
 004A027D    mov         eax,ebp
 004A027F    call        @LStrLen
 004A0284    mov         edx,dword ptr [esi+50]
 004A0287    add         edx,dword ptr [esi+48]
 004A028A    imul        edx
 004A028C    mov         edx,dword ptr [esi+48]
 004A028F    neg         edx
 004A0291    add         eax,edx
 004A0293    mov         dword ptr [esp],eax
 004A0296    mov         eax,ebp
 004A0298    call        @LStrLen
 004A029D    mov         ebx,eax
 004A029F    test        ebx,ebx
>004A02A1    jle         004A02C1
 004A02A3    mov         edi,1
 004A02A8    mov         dl,byte ptr [ebp+edi-1]
 004A02AC    mov         eax,esi
 004A02AE    call        004A0244
 004A02B3    add         dword ptr [esp],eax
 004A02B6    inc         edi
 004A02B7    dec         ebx
>004A02B8    jne         004A02A8
>004A02BA    jmp         004A02C1
 004A02BC    xor         eax,eax
 004A02BE    mov         dword ptr [esp],eax
 004A02C1    mov         eax,dword ptr [esp]
 004A02C4    pop         edx
 004A02C5    pop         ebp
 004A02C6    pop         edi
 004A02C7    pop         esi
 004A02C8    pop         ebx
 004A02C9    ret
end;*}

//004A02CC
{*procedure sub_004A02CC(?:TGLBitmapFont; ?:?);
begin
 004A02CC    push        ebx
 004A02CD    push        esi
 004A02CE    mov         esi,edx
 004A02D0    mov         ebx,eax
 004A02D2    mov         eax,dword ptr [ebx+6C]
 004A02D5    call        @DynArrayLength
 004A02DA    test        eax,eax
>004A02DC    jne         004A02F9
 004A02DE    push        100
 004A02E3    lea         eax,[ebx+6C]
 004A02E6    mov         ecx,1
 004A02EB    mov         edx,dword ptr ds:[49F8A8];TDynIntegerArray
 004A02F1    call        @DynArraySetLength
 004A02F6    add         esp,4
 004A02F9    test        esi,esi
>004A02FB    jge         004A0300
 004A02FD    mov         esi,dword ptr [ebx+38]
 004A0300    xor         eax,eax
 004A0302    mov         edx,dword ptr [ebx+6C]
 004A0305    mov         dword ptr [edx+eax*4],esi
 004A0308    inc         eax
 004A0309    cmp         eax,100
>004A030E    jne         004A0302
 004A0310    pop         esi
 004A0311    pop         ebx
 004A0312    ret
end;*}

//004A0314
procedure TGLBitmapFont.SetRanges(Value:TBitmapFontRanges);
begin
{*
 004A0314    push        esi
 004A0315    mov         esi,eax
 004A0317    mov         eax,dword ptr [esi+30];TGLBitmapFont.?f30:TBitmapFontRanges
 004A031A    mov         ecx,dword ptr [eax]
 004A031C    call        dword ptr [ecx+8];TCollection.Assign
 004A031F    mov         eax,esi
 004A0321    call        004A0E08
 004A0326    pop         esi
 004A0327    ret
*}
end;

//004A0328
procedure TGLBitmapFont.SetGlyphs(Value:TPicture);
begin
{*
 004A0328    push        esi
 004A0329    mov         esi,eax
 004A032B    mov         eax,dword ptr [esi+34];TGLBitmapFont.?f34:TPicture
 004A032E    mov         ecx,dword ptr [eax]
 004A0330    call        dword ptr [ecx+8];TPicture.Assign
 004A0333    pop         esi
 004A0334    ret
*}
end;

//004A0338
procedure TGLBitmapFont.SetCharWidth(Value:Integer);
begin
{*
 004A0338    cmp         edx,dword ptr [eax+38];TGLBitmapFont.?f38:Integer
>004A033B    je          004A0353
 004A033D    cmp         edx,1
>004A0340    jle         004A0347
 004A0342    mov         dword ptr [eax+38],edx;TGLBitmapFont.?f38:Integer
>004A0345    jmp         004A034E
 004A0347    mov         dword ptr [eax+38],1;TGLBitmapFont.?f38:Integer
 004A034E    call        004A0E08
 004A0353    ret
*}
end;

//004A0354
procedure TGLBitmapFont.SetCharHeight(Value:Integer);
begin
{*
 004A0354    cmp         edx,dword ptr [eax+3C];TGLBitmapFont.?f3C:Integer
>004A0357    je          004A036F
 004A0359    cmp         edx,1
>004A035C    jle         004A0363
 004A035E    mov         dword ptr [eax+3C],edx;TGLBitmapFont.?f3C:Integer
>004A0361    jmp         004A036A
 004A0363    mov         dword ptr [eax+3C],1;TGLBitmapFont.?f3C:Integer
 004A036A    call        004A0E08
 004A036F    ret
*}
end;

//004A0370
procedure TGLBitmapFont.SetGlyphsIntervalX(Value:Integer);
begin
{*
 004A0370    test        edx,edx
>004A0372    jle         004A0379
 004A0374    mov         dword ptr [eax+40],edx;TGLBitmapFont.?f40:Integer
>004A0377    jmp         004A037E
 004A0379    xor         edx,edx
 004A037B    mov         dword ptr [eax+40],edx;TGLBitmapFont.?f40:Integer
 004A037E    call        004A0E08
 004A0383    ret
*}
end;

//004A0384
procedure TGLBitmapFont.SetGlyphsIntervalY(Value:Integer);
begin
{*
 004A0384    test        edx,edx
>004A0386    jle         004A038D
 004A0388    mov         dword ptr [eax+44],edx;TGLBitmapFont.?f44:Integer
>004A038B    jmp         004A0392
 004A038D    xor         edx,edx
 004A038F    mov         dword ptr [eax+44],edx;TGLBitmapFont.?f44:Integer
 004A0392    call        004A0E08
 004A0397    ret
*}
end;

//004A0398
procedure TGLBitmapFont.SetHSpace(Value:Integer);
begin
{*
 004A0398    test        edx,edx
>004A039A    jle         004A03A1
 004A039C    mov         dword ptr [eax+48],edx;TGLBitmapFont.?f48:Integer
>004A039F    jmp         004A03A6
 004A03A1    xor         edx,edx
 004A03A3    mov         dword ptr [eax+48],edx;TGLBitmapFont.?f48:Integer
 004A03A6    call        004A0E08
 004A03AB    ret
*}
end;

//004A03AC
procedure TGLBitmapFont.SetVSpace(Value:Integer);
begin
{*
 004A03AC    test        edx,edx
>004A03AE    jle         004A03B5
 004A03B0    mov         dword ptr [eax+4C],edx;TGLBitmapFont.?f4C:Integer
>004A03B3    jmp         004A03BA
 004A03B5    xor         edx,edx
 004A03B7    mov         dword ptr [eax+4C],edx;TGLBitmapFont.?f4C:Integer
 004A03BA    call        004A0E08
 004A03BF    ret
*}
end;

//004A03C0
procedure TGLBitmapFont.SetMagFilter(Value:TGLMagFilter);
begin
{*
 004A03C0    cmp         dl,byte ptr [eax+5E];TGLBitmapFont.?f5E:byte
>004A03C3    je          004A03D1
 004A03C5    mov         byte ptr [eax+5E],dl;TGLBitmapFont.?f5E:byte
 004A03C8    mov         byte ptr [eax+5C],1;TGLBitmapFont.?f5C:byte
 004A03CC    call        004A0E08
 004A03D1    ret
*}
end;

//004A03D4
procedure TGLBitmapFont.SetMinFilter(Value:TGLMinFilter);
begin
{*
 004A03D4    cmp         dl,byte ptr [eax+5D];TGLBitmapFont.?f5D:byte
>004A03D7    je          004A03E5
 004A03D9    mov         byte ptr [eax+5D],dl;TGLBitmapFont.?f5D:byte
 004A03DC    mov         byte ptr [eax+5C],1;TGLBitmapFont.?f5C:byte
 004A03E0    call        004A0E08
 004A03E5    ret
*}
end;

//004A03F0
{*procedure sub_004A03F0(?:?);
begin
 004A03F0    push        ebx
 004A03F1    push        esi
 004A03F2    mov         esi,edx
 004A03F4    mov         ebx,eax
 004A03F6    mov         edx,esi
 004A03F8    mov         eax,dword ptr [ebx+54];TGLCustomBitmapFont.?f54:TList
 004A03FB    call        TList.IndexOf
 004A0400    test        eax,eax
>004A0402    jl          004A0418
 004A0404    mov         ecx,2C3
 004A0409    mov         edx,4A0430;'C:\GLScene\glscene_v_1000714\Source\GLBitmapFont.pas'
 004A040E    mov         eax,4A0470;'Assertion failure'
 004A0413    call        @Assert
 004A0418    mov         edx,esi
 004A041A    mov         eax,dword ptr [ebx+54];TGLCustomBitmapFont.?f54:TList
 004A041D    call        TList.Add
 004A0422    pop         esi
 004A0423    pop         ebx
 004A0424    ret
end;*}

//004A0484
procedure sub_004A0484;
begin
{*
 004A0484    mov         eax,dword ptr [eax+54];TGLCustomBitmapFont.?f54:TList
 004A0487    call        TList.Remove
 004A048C    ret
*}
end;

//004A0490
procedure sub_004A0490;
begin
{*
 004A0490    push        ebx
 004A0491    push        esi
 004A0492    push        edi
 004A0493    mov         ebx,eax
 004A0495    mov         dl,1
 004A0497    mov         eax,[00424EB8];TBitmap
 004A049C    call        TBitmap.Create;TBitmap.Create
 004A04A1    mov         esi,eax
 004A04A3    mov         dl,6
 004A04A5    mov         eax,esi
 004A04A7    call        TBitmap.SetPixelFormat
 004A04AC    mov         eax,dword ptr [ebx+34];TGLCustomBitmapFont.?f34:TPicture
 004A04AF    call        TPicture.GetWidth
 004A04B4    call        0046BCE8
 004A04B9    mov         edx,eax
 004A04BB    mov         eax,esi
 004A04BD    mov         ecx,dword ptr [eax]
 004A04BF    call        dword ptr [ecx+40];TBitmap.SetWidth
 004A04C2    mov         eax,dword ptr [ebx+34];TGLCustomBitmapFont.?f34:TPicture
 004A04C5    call        TPicture.GetHeight
 004A04CA    call        0046BCE8
 004A04CF    mov         edx,eax
 004A04D1    mov         eax,esi
 004A04D3    mov         ecx,dword ptr [eax]
 004A04D5    call        dword ptr [ecx+34];TBitmap.SetHeight
 004A04D8    mov         eax,dword ptr [ebx+34];TGLCustomBitmapFont.?f34:TPicture
 004A04DB    mov         eax,dword ptr [eax+0C];TPicture.FGraphic:TGraphic
 004A04DE    push        eax
 004A04DF    mov         eax,esi
 004A04E1    call        TBitmap.GetCanvas
 004A04E6    xor         ecx,ecx
 004A04E8    xor         edx,edx
 004A04EA    call        TCanvas.Draw
 004A04EF    mov         dl,1
 004A04F1    mov         eax,[0046F8F4];TGLBitmap32
 004A04F6    call        TGLBitmap32.Create;TGLBitmap32.Create
 004A04FB    mov         edi,eax
 004A04FD    mov         edx,esi
 004A04FF    mov         eax,edi
 004A0501    mov         ecx,dword ptr [eax]
 004A0503    call        dword ptr [ecx+8];TGLBitmap32.Assign
 004A0506    mov         eax,esi
 004A0508    call        TObject.Free
 004A050D    xor         eax,eax
 004A050F    mov         al,byte ptr [ebx+68];TGLCustomBitmapFont.?f68:byte
 004A0512    cmp         eax,6
>004A0515    ja          004A0588
 004A0517    jmp         dword ptr [eax*4+4A051E]
 004A0517    dd          004A0572
 004A0517    dd          004A053A
 004A0517    dd          004A0543
 004A0517    dd          004A054E
 004A0517    dd          004A0557
 004A0517    dd          004A0567
 004A0517    dd          004A0572
 004A053A    mov         eax,edi
 004A053C    call        004703A8
>004A0541    jmp         004A059C
 004A0543    xor         edx,edx
 004A0545    mov         eax,edi
 004A0547    call        004703F0
>004A054C    jmp         004A059C
 004A054E    mov         eax,edi
 004A0550    call        004703A8
>004A0555    jmp         004A059C
 004A0557    mov         eax,edi
 004A0559    call        004703A8
 004A055E    mov         eax,edi
 004A0560    call        00470508
>004A0565    jmp         004A059C
 004A0567    mov         dl,0FF
 004A0569    mov         eax,edi
 004A056B    call        004704B4
>004A0570    jmp         004A059C
 004A0572    mov         eax,dword ptr [edi+0C];TGLBitmap32.?fC:dword
 004A0575    dec         eax
 004A0576    imul        dword ptr [edi+8];TGLBitmap32.?f8:dword
 004A0579    mov         edx,dword ptr [edi+4];TGLBitmap32.?f4:dword
 004A057C    mov         edx,dword ptr [edx+eax*4]
 004A057F    mov         eax,edi
 004A0581    call        00470430
>004A0586    jmp         004A059C
 004A0588    mov         ecx,2F1
 004A058D    mov         edx,4A05D8;'C:\GLScene\glscene_v_1000714\Source\GLBitmapFont.pas'
 004A0592    mov         eax,4A0618;'Assertion failure'
 004A0597    call        @Assert
 004A059C    mov         eax,ebx
 004A059E    mov         si,0FFEE
 004A05A2    call        @CallDynaInst;TGLCustomBitmapFont.sub_004A0E68
 004A05A7    push        eax
 004A05A8    mov         cl,byte ptr [ebx+5D];TGLCustomBitmapFont.?f5D:byte
 004A05AB    mov         edx,0DE1
 004A05B0    mov         eax,edi
 004A05B2    call        004705AC
 004A05B7    mov         eax,dword ptr [edi+8];TGLBitmap32.?f8:dword
 004A05BA    mov         dword ptr [ebx+60],eax;TGLCustomBitmapFont.?f60:dword
 004A05BD    mov         eax,dword ptr [edi+0C];TGLBitmap32.?fC:dword
 004A05C0    mov         dword ptr [ebx+64],eax;TGLCustomBitmapFont.?f64:dword
 004A05C3    mov         eax,edi
 004A05C5    call        TObject.Free
 004A05CA    pop         edi
 004A05CB    pop         esi
 004A05CC    pop         ebx
 004A05CD    ret
*}
end;

//004A062C
{*procedure sub_004A062C(?:?);
begin
 004A062C    push        ebx
 004A062D    mov         ebx,eax
 004A062F    push        1102
 004A0634    push        0C50
 004A0639    call        OpenGL32.glHint
 004A063E    push        4
 004A0640    push        0CF5
 004A0645    call        OpenGL32.glPixelStorei
 004A064A    push        0
 004A064C    push        0CF2
 004A0651    call        OpenGL32.glPixelStorei
 004A0656    push        0
 004A0658    push        0CF3
 004A065D    call        OpenGL32.glPixelStorei
 004A0662    push        0
 004A0664    push        0CF4
 004A0669    call        OpenGL32.glPixelStorei
 004A066E    push        2901
 004A0673    push        2802
 004A0678    push        0DE1
 004A067D    call        OpenGL32.glTexParameteri
 004A0682    push        2901
 004A0687    push        2803
 004A068C    push        0DE1
 004A0691    call        OpenGL32.glTexParameteri
 004A0696    xor         eax,eax
 004A0698    mov         al,byte ptr [ebx+5D]
 004A069B    mov         eax,dword ptr [eax*4+5AD7A4]
 004A06A2    push        eax
 004A06A3    push        2801
 004A06A8    push        0DE1
 004A06AD    call        OpenGL32.glTexParameteri
 004A06B2    xor         eax,eax
 004A06B4    mov         al,byte ptr [ebx+5E]
 004A06B7    mov         eax,dword ptr [eax*4+5AD79C]
 004A06BE    push        eax
 004A06BF    push        2800
 004A06C4    push        0DE1
 004A06C9    call        OpenGL32.glTexParameteri
 004A06CE    pop         ebx
 004A06CF    ret
end;*}

//004A06D0
{*procedure sub_004A06D0(?:?; ?:?);
begin
 004A06D0    push        ebp
 004A06D1    mov         ebp,esp
 004A06D3    add         esp,0FFFFFFF0
 004A06D6    push        ebx
 004A06D7    push        esi
 004A06D8    push        edi
 004A06D9    xor         edx,edx
 004A06DB    mov         dword ptr [ebp-10],edx
 004A06DE    mov         dword ptr [ebp-8],edx
 004A06E1    mov         ebx,eax
 004A06E3    mov         edi,dword ptr [ebp+8]
 004A06E6    add         edi,0FFFFFFFC
 004A06E9    xor         eax,eax
 004A06EB    push        ebp
 004A06EC    push        4A07B4
 004A06F1    push        dword ptr fs:[eax]
 004A06F4    mov         dword ptr fs:[eax],esp
 004A06F7    xor         esi,esi
>004A06F9    jmp         004A06FD
 004A06FB    inc         ebx
 004A06FC    inc         esi
 004A06FD    mov         eax,dword ptr [edi]
 004A06FF    call        @LStrLen
 004A0704    cmp         ebx,eax
>004A0706    jg          004A0711
 004A0708    mov         eax,dword ptr [edi]
 004A070A    cmp         byte ptr [eax+ebx-1],0D
>004A070F    jne         004A06FB
 004A0711    mov         eax,dword ptr [ebp+8]
 004A0714    mov         al,byte ptr [eax+18]
 004A0717    sub         al,1
>004A0719    jb          004A071F
>004A071B    je          004A0726
>004A071D    jmp         004A0753
 004A071F    xor         eax,eax
 004A0721    mov         dword ptr [ebp-4],eax
>004A0724    jmp         004A0796
 004A0726    lea         eax,[ebp-8]
 004A0729    push        eax
 004A072A    mov         edx,ebx
 004A072C    sub         edx,esi
 004A072E    mov         eax,dword ptr [edi]
 004A0730    mov         ecx,esi
 004A0732    call        @LStrCopy
 004A0737    mov         edx,dword ptr [ebp-8]
 004A073A    mov         eax,dword ptr [ebp+8]
 004A073D    mov         eax,dword ptr [eax-8]
 004A0740    call        004A0270
 004A0745    neg         eax
 004A0747    mov         dword ptr [ebp-0C],eax
 004A074A    fild        dword ptr [ebp-0C]
 004A074D    fstp        dword ptr [ebp-4]
 004A0750    wait
>004A0751    jmp         004A0796
 004A0753    lea         eax,[ebp-10]
 004A0756    push        eax
 004A0757    mov         edx,ebx
 004A0759    sub         edx,esi
 004A075B    mov         eax,dword ptr [edi]
 004A075D    mov         ecx,esi
 004A075F    call        @LStrCopy
 004A0764    mov         edx,dword ptr [ebp-10]
 004A0767    mov         eax,dword ptr [ebp+8]
 004A076A    mov         eax,dword ptr [eax-8]
 004A076D    call        004A0270
 004A0772    neg         eax
 004A0774    mov         dword ptr [ebp-0C],eax
 004A0777    fild        dword ptr [ebp-0C]
 004A077A    fmul        dword ptr ds:[4A07C8];0.5:Single
 004A0780    add         esp,0FFFFFFFC
 004A0783    fstp        dword ptr [esp]
 004A0786    wait
 004A0787    call        0045F6EC
 004A078C    mov         dword ptr [ebp-0C],eax
 004A078F    fild        dword ptr [ebp-0C]
 004A0792    fstp        dword ptr [ebp-4]
 004A0795    wait
 004A0796    xor         eax,eax
 004A0798    pop         edx
 004A0799    pop         ecx
 004A079A    pop         ecx
 004A079B    mov         dword ptr fs:[eax],edx
 004A079E    push        4A07BB
 004A07A3    lea         eax,[ebp-10]
 004A07A6    call        @LStrClr
 004A07AB    lea         eax,[ebp-8]
 004A07AE    call        @LStrClr
 004A07B3    ret
>004A07B4    jmp         @HandleFinally
>004A07B9    jmp         004A07A3
 004A07BB    fld         dword ptr [ebp-4]
 004A07BE    pop         edi
 004A07BF    pop         esi
 004A07C0    pop         ebx
 004A07C1    mov         esp,ebp
 004A07C3    pop         ebp
 004A07C4    ret
end;*}

//004A07CC
{*procedure sub_004A07CC(?:?);
begin
 004A07CC    push        ebp
 004A07CD    mov         ebp,esp
 004A07CF    add         esp,0FFFFFFF8
 004A07D2    push        ebx
 004A07D3    push        esi
 004A07D4    mov         esi,1
 004A07D9    mov         eax,dword ptr [ebp+8]
 004A07DC    mov         eax,dword ptr [eax-4]
 004A07DF    call        @LStrLen
 004A07E4    test        eax,eax
>004A07E6    jle         004A07FF
 004A07E8    mov         edx,1
 004A07ED    mov         ecx,dword ptr [ebp+8]
 004A07F0    mov         ecx,dword ptr [ecx-4]
 004A07F3    cmp         byte ptr [ecx+edx-1],0D
>004A07F8    jne         004A07FB
 004A07FA    inc         esi
 004A07FB    inc         edx
 004A07FC    dec         eax
>004A07FD    jne         004A07ED
 004A07FF    mov         eax,dword ptr [ebp+8]
 004A0802    mov         al,byte ptr [eax+14]
 004A0805    sub         al,1
>004A0807    jb          004A080F
 004A0809    dec         al
>004A080B    je          004A0816
>004A080D    jmp         004A083E
 004A080F    xor         eax,eax
 004A0811    mov         dword ptr [ebp-4],eax
>004A0814    jmp         004A087B
 004A0816    mov         edx,dword ptr [ebp+8]
 004A0819    mov         edx,dword ptr [edx-8]
 004A081C    mov         edx,dword ptr [edx+3C]
 004A081F    mov         eax,dword ptr [ebp+8]
 004A0822    mov         eax,dword ptr [eax-8]
 004A0825    mov         eax,dword ptr [eax+4C]
 004A0828    add         edx,eax
 004A082A    imul        edx,esi
 004A082D    mov         ecx,dword ptr [ebp+8]
 004A0830    sub         edx,eax
 004A0832    mov         dword ptr [ebp-8],edx
 004A0835    fild        dword ptr [ebp-8]
 004A0838    fstp        dword ptr [ebp-4]
 004A083B    wait
>004A083C    jmp         004A087B
 004A083E    mov         eax,dword ptr [ebp+8]
 004A0841    mov         eax,dword ptr [eax-8]
 004A0844    mov         eax,dword ptr [eax+3C]
 004A0847    mov         edx,dword ptr [ebp+8]
 004A084A    mov         edx,dword ptr [edx-8]
 004A084D    mov         ebx,dword ptr [edx+4C]
 004A0850    add         eax,ebx
 004A0852    imul        esi
 004A0854    mov         edx,dword ptr [ebp+8]
 004A0857    sub         eax,ebx
 004A0859    mov         dword ptr [ebp-8],eax
 004A085C    fild        dword ptr [ebp-8]
 004A085F    fmul        dword ptr ds:[4A0884];0.5:Single
 004A0865    add         esp,0FFFFFFFC
 004A0868    fstp        dword ptr [esp]
 004A086B    wait
 004A086C    call        0045F6EC
 004A0871    mov         dword ptr [ebp-8],eax
 004A0874    fild        dword ptr [ebp-8]
 004A0877    fstp        dword ptr [ebp-4]
 004A087A    wait
 004A087B    fld         dword ptr [ebp-4]
 004A087E    pop         esi
 004A087F    pop         ebx
 004A0880    pop         ecx
 004A0881    pop         ecx
 004A0882    pop         ebp
 004A0883    ret
end;*}

//004A0888
{*procedure sub_004A0888(?:TGLCustomBitmapFont; ?:?; ?:String; ?:?; ?:?; ?:?);
begin
 004A0888    push        ebp
 004A0889    mov         ebp,esp
 004A088B    add         esp,0FFFFFFB4
 004A088E    push        ebx
 004A088F    push        esi
 004A0890    push        edi
 004A0891    mov         dword ptr [ebp-4],ecx
 004A0894    mov         dword ptr [ebp-0C],edx
 004A0897    mov         dword ptr [ebp-8],eax
 004A089A    mov         eax,dword ptr [ebp-8]
 004A089D    mov         eax,dword ptr [eax+34]
 004A08A0    call        TPicture.GetWidth
 004A08A5    test        eax,eax
>004A08A7    je          004A0BE3
 004A08AD    cmp         dword ptr [ebp-4],0
>004A08B1    je          004A0BE3
 004A08B7    mov         eax,dword ptr [ebp-8]
 004A08BA    cmp         byte ptr [eax+5C],0
>004A08BE    jne         004A08CC
 004A08C0    mov         eax,dword ptr [ebp-8]
 004A08C3    mov         eax,dword ptr [eax+58]
 004A08C6    cmp         dword ptr [eax+8],0
>004A08CA    jne         004A093F
 004A08CC    mov         eax,dword ptr [ebp-8]
 004A08CF    mov         eax,dword ptr [eax+58]
 004A08D2    cmp         dword ptr [eax+8],0
>004A08D6    jne         004A08FD
 004A08D8    call        0046CEE8
 004A08DD    mov         eax,dword ptr [ebp-8]
 004A08E0    mov         eax,dword ptr [eax+58]
 004A08E3    cmp         dword ptr [eax+8],0
>004A08E7    jne         004A08FD
 004A08E9    mov         ecx,345
 004A08EE    mov         edx,4A0BF4;'C:\GLScene\glscene_v_1000714\Source\GLBitmapFont.pas'
 004A08F3    mov         eax,4A0C34;'Assertion failure'
 004A08F8    call        @Assert
 004A08FD    mov         eax,dword ptr [ebp-8]
 004A0900    mov         eax,dword ptr [eax+58]
 004A0903    mov         eax,dword ptr [eax+8]
 004A0906    push        eax
 004A0907    mov         eax,dword ptr [ebp-0C]
 004A090A    mov         eax,dword ptr [eax+5C]
 004A090D    mov         ecx,0DE1
 004A0912    xor         edx,edx
 004A0914    call        0046D8B8
 004A0919    mov         eax,dword ptr [ebp-8]
 004A091C    mov         eax,dword ptr [eax+34]
 004A091F    call        TPicture.GetWidth
 004A0924    test        eax,eax
>004A0926    je          004A0938
 004A0928    mov         eax,dword ptr [ebp-8]
 004A092B    mov         edx,dword ptr [eax]
 004A092D    call        dword ptr [edx+38]
 004A0930    mov         eax,dword ptr [ebp-8]
 004A0933    call        004A062C
 004A0938    mov         eax,dword ptr [ebp-8]
 004A093B    mov         byte ptr [eax+5C],0
 004A093F    cmp         dword ptr [ebp+0C],0
>004A0943    je          004A097D
 004A0945    push        ebp
 004A0946    mov         eax,1
 004A094B    call        004A06D0
 004A0950    pop         ecx
 004A0951    mov         eax,dword ptr [ebp+0C]
 004A0954    fadd        dword ptr [eax]
 004A0956    add         esp,0FFFFFFFC
 004A0959    fstp        dword ptr [esp]
 004A095C    wait
 004A095D    push        ebp
 004A095E    call        004A07CC
 004A0963    pop         ecx
 004A0964    mov         eax,dword ptr [ebp+0C]
 004A0967    fadd        dword ptr [eax+4]
 004A096A    add         esp,0FFFFFFFC
 004A096D    fstp        dword ptr [esp]
 004A0970    wait
 004A0971    push        0
 004A0973    lea         eax,[ebp-38]
 004A0976    call        0045C9D8
>004A097B    jmp         004A09A8
 004A097D    push        ebp
 004A097E    mov         eax,1
 004A0983    call        004A06D0
 004A0988    pop         ecx
 004A0989    add         esp,0FFFFFFFC
 004A098C    fstp        dword ptr [esp]
 004A098F    wait
 004A0990    push        ebp
 004A0991    call        004A07CC
 004A0996    pop         ecx
 004A0997    add         esp,0FFFFFFFC
 004A099A    fstp        dword ptr [esp]
 004A099D    wait
 004A099E    push        0
 004A09A0    lea         eax,[ebp-38]
 004A09A3    call        0045C9D8
 004A09A8    mov         eax,dword ptr [ebp-8]
 004A09AB    mov         eax,dword ptr [eax+3C]
 004A09AE    mov         edx,eax
 004A09B0    mov         ecx,dword ptr [ebp-8]
 004A09B3    add         edx,dword ptr [ecx+4C]
 004A09B6    neg         edx
 004A09B8    mov         dword ptr [ebp-4C],edx
 004A09BB    fild        dword ptr [ebp-4C]
 004A09BE    fstp        dword ptr [ebp-24]
 004A09C1    wait
 004A09C2    cmp         byte ptr [ebp+8],0
>004A09C6    je          004A09D7
 004A09C8    mov         dword ptr [ebp-4C],eax
 004A09CB    fild        dword ptr [ebp-4C]
 004A09CE    fadd        dword ptr [ebp-34]
 004A09D1    fstp        dword ptr [ebp-44]
 004A09D4    wait
>004A09D5    jmp         004A09E4
 004A09D7    mov         dword ptr [ebp-4C],eax
 004A09DA    fild        dword ptr [ebp-4C]
 004A09DD    fsubr       dword ptr [ebp-34]
 004A09E0    fstp        dword ptr [ebp-44]
 004A09E3    wait
 004A09E4    xor         eax,eax
 004A09E6    mov         dword ptr [ebp-40],eax
 004A09E9    mov         dword ptr [ebp-3C],3F800000
 004A09F0    mov         dl,20
 004A09F2    mov         eax,dword ptr [ebp-8]
 004A09F5    call        004A0244
 004A09FA    mov         edx,dword ptr [ebp-8]
 004A09FD    add         eax,dword ptr [edx+50]
 004A0A00    mov         edx,dword ptr [ebp-8]
 004A0A03    add         eax,dword ptr [edx+48]
 004A0A06    mov         dword ptr [ebp-4C],eax
 004A0A09    fild        dword ptr [ebp-4C]
 004A0A0C    fstp        dword ptr [ebp-28]
 004A0A0F    wait
 004A0A10    push        0DE1
 004A0A15    call        OpenGL32.glEnable
 004A0A1A    push        0B50
 004A0A1F    call        OpenGL32.glDisable
 004A0A24    push        0BE2
 004A0A29    call        OpenGL32.glEnable
 004A0A2E    push        303
 004A0A33    push        302
 004A0A38    call        OpenGL32.glBlendFunc
 004A0A3D    mov         eax,dword ptr [ebp-8]
 004A0A40    mov         eax,dword ptr [eax+58]
 004A0A43    mov         eax,dword ptr [eax+8]
 004A0A46    push        eax
 004A0A47    mov         eax,dword ptr [ebp-0C]
 004A0A4A    mov         eax,dword ptr [eax+5C]
 004A0A4D    mov         ecx,0DE1
 004A0A52    xor         edx,edx
 004A0A54    call        0046D8B8
 004A0A59    push        2100
 004A0A5E    push        2200
 004A0A63    push        2300
 004A0A68    call        OpenGL32.glTexEnvi
 004A0A6D    push        1
 004A0A6F    call        OpenGL32.glPushAttrib
 004A0A74    mov         eax,dword ptr [ebp+10]
 004A0A77    push        eax
 004A0A78    call        OpenGL32.glColor4fv
 004A0A7D    push        7
 004A0A7F    call        OpenGL32.glBegin
 004A0A84    mov         eax,dword ptr [ebp-4]
 004A0A87    call        @LStrLen
 004A0A8C    mov         esi,eax
 004A0A8E    test        esi,esi
>004A0A90    jle         004A0BCE
 004A0A96    mov         edi,1
 004A0A9B    mov         eax,dword ptr [ebp-4]
 004A0A9E    mov         bl,byte ptr [eax+edi-1]
 004A0AA2    mov         eax,ebx
 004A0AA4    sub         al,0D
>004A0AA6    jb          004A0BC6
>004A0AAC    je          004A0ABB
 004A0AAE    dec         eax
 004A0AAF    sub         al,12
>004A0AB1    jb          004A0BC6
>004A0AB7    je          004A0B18
>004A0AB9    jmp         004A0B27
 004A0ABB    cmp         dword ptr [ebp+0C],0
>004A0ABF    je          004A0AD6
 004A0AC1    push        ebp
 004A0AC2    lea         eax,[edi+1]
 004A0AC5    call        004A06D0
 004A0ACA    pop         ecx
 004A0ACB    mov         eax,dword ptr [ebp+0C]
 004A0ACE    fadd        dword ptr [eax]
 004A0AD0    fstp        dword ptr [ebp-38]
 004A0AD3    wait
>004A0AD4    jmp         004A0AE4
 004A0AD6    push        ebp
 004A0AD7    lea         eax,[edi+1]
 004A0ADA    call        004A06D0
 004A0ADF    pop         ecx
 004A0AE0    fstp        dword ptr [ebp-38]
 004A0AE3    wait
 004A0AE4    fld         dword ptr [ebp-34]
 004A0AE7    fadd        dword ptr [ebp-24]
 004A0AEA    fstp        dword ptr [ebp-34]
 004A0AED    wait
 004A0AEE    cmp         byte ptr [ebp+8],0
>004A0AF2    je          004A0B06
 004A0AF4    mov         eax,dword ptr [ebp-8]
 004A0AF7    fild        dword ptr [eax+3C]
 004A0AFA    fadd        dword ptr [ebp-34]
 004A0AFD    fstp        dword ptr [ebp-44]
 004A0B00    wait
>004A0B01    jmp         004A0BC6
 004A0B06    mov         eax,dword ptr [ebp-8]
 004A0B09    fild        dword ptr [eax+3C]
 004A0B0C    fsubr       dword ptr [ebp-34]
 004A0B0F    fstp        dword ptr [ebp-44]
 004A0B12    wait
>004A0B13    jmp         004A0BC6
 004A0B18    fld         dword ptr [ebp-38]
 004A0B1B    fadd        dword ptr [ebp-28]
 004A0B1E    fstp        dword ptr [ebp-38]
 004A0B21    wait
>004A0B22    jmp         004A0BC6
 004A0B27    mov         edx,ebx
 004A0B29    mov         eax,dword ptr [ebp-8]
 004A0B2C    call        004A0244
 004A0B31    mov         dword ptr [ebp-4C],eax
 004A0B34    fild        dword ptr [ebp-4C]
 004A0B37    fstp        dword ptr [ebp-20]
 004A0B3A    wait
 004A0B3B    fld         dword ptr [ebp-20]
 004A0B3E    fcomp       dword ptr ds:[4A0C48];0:Single
 004A0B44    fnstsw      al
 004A0B46    sahf
>004A0B47    jbe         004A0BC6
 004A0B49    lea         eax,[ebp-1C]
 004A0B4C    push        eax
 004A0B4D    lea         ecx,[ebp-14]
 004A0B50    mov         edx,ebx
 004A0B52    mov         eax,dword ptr [ebp-8]
 004A0B55    call        004A0C78
 004A0B5A    fld         dword ptr [ebp-38]
 004A0B5D    fadd        dword ptr [ebp-20]
 004A0B60    fstp        dword ptr [ebp-48]
 004A0B63    wait
 004A0B64    lea         eax,[ebp-14]
 004A0B67    push        eax
 004A0B68    call        OpenGL32.glTexCoord2fv
 004A0B6D    lea         eax,[ebp-38]
 004A0B70    push        eax
 004A0B71    call        OpenGL32.glVertex4fv
 004A0B76    push        dword ptr [ebp-18]
 004A0B79    push        dword ptr [ebp-14]
 004A0B7C    call        OpenGL32.glTexCoord2f
 004A0B81    push        dword ptr [ebp-44]
 004A0B84    push        dword ptr [ebp-38]
 004A0B87    call        OpenGL32.glVertex2f
 004A0B8C    lea         eax,[ebp-1C]
 004A0B8F    push        eax
 004A0B90    call        OpenGL32.glTexCoord2fv
 004A0B95    lea         eax,[ebp-48]
 004A0B98    push        eax
 004A0B99    call        OpenGL32.glVertex4fv
 004A0B9E    push        dword ptr [ebp-10]
 004A0BA1    push        dword ptr [ebp-1C]
 004A0BA4    call        OpenGL32.glTexCoord2f
 004A0BA9    push        dword ptr [ebp-34]
 004A0BAC    push        dword ptr [ebp-48]
 004A0BAF    call        OpenGL32.glVertex2f
 004A0BB4    fld         dword ptr [ebp-38]
 004A0BB7    fadd        dword ptr [ebp-20]
 004A0BBA    mov         eax,dword ptr [ebp-8]
 004A0BBD    fild        dword ptr [eax+48]
 004A0BC0    faddp       st(1),st
 004A0BC2    fstp        dword ptr [ebp-38]
 004A0BC5    wait
 004A0BC6    inc         edi
 004A0BC7    dec         esi
>004A0BC8    jne         004A0A9B
 004A0BCE    call        OpenGL32.glEnd
 004A0BD3    call        OpenGL32.glPopAttrib
 004A0BD8    mov         eax,dword ptr [ebp-0C]
 004A0BDB    mov         eax,dword ptr [eax+5C]
 004A0BDE    call        0046D8E4
 004A0BE3    pop         edi
 004A0BE4    pop         esi
 004A0BE5    pop         ebx
 004A0BE6    mov         esp,ebp
 004A0BE8    pop         ebp
 004A0BE9    ret         14
end;*}

//004A0C4C
{*function sub_004A0C4C(?:?):?;
begin
 004A0C4C    push        ebx
 004A0C4D    push        esi
 004A0C4E    mov         ebx,eax
 004A0C50    mov         eax,dword ptr [ebx+34]
 004A0C53    call        TPicture.GetWidth
 004A0C58    test        eax,eax
>004A0C5A    jle         004A0C72
 004A0C5C    mov         eax,dword ptr [ebx+34]
 004A0C5F    call        TPicture.GetWidth
 004A0C64    mov         esi,dword ptr [ebx+40]
 004A0C67    add         eax,esi
 004A0C69    add         esi,dword ptr [ebx+38]
 004A0C6C    cdq
 004A0C6D    idiv        eax,esi
 004A0C6F    pop         esi
 004A0C70    pop         ebx
 004A0C71    ret
 004A0C72    xor         eax,eax
 004A0C74    pop         esi
 004A0C75    pop         ebx
 004A0C76    ret
end;*}

//004A0C78
{*procedure sub_004A0C78(?:?; ?:?; ?:?; ?:?);
begin
 004A0C78    push        ebp
 004A0C79    mov         ebp,esp
 004A0C7B    add         esp,0FFFFFFDC
 004A0C7E    push        ebx
 004A0C7F    push        esi
 004A0C80    push        edi
 004A0C81    mov         dword ptr [ebp-8],ecx
 004A0C84    mov         byte ptr [ebp-1],dl
 004A0C87    mov         ebx,eax
 004A0C89    mov         eax,dword ptr [ebx+70]
 004A0C8C    call        @DynArrayLength
 004A0C91    test        eax,eax
>004A0C93    jne         004A0DC3
 004A0C99    push        100
 004A0C9E    lea         eax,[ebx+70]
 004A0CA1    mov         ecx,1
 004A0CA6    mov         edx,dword ptr ds:[49F8DC];.4
 004A0CAC    call        @DynArraySetLength
 004A0CB1    add         esp,4
 004A0CB4    mov         eax,dword ptr [ebx+30]
 004A0CB7    call        TCollection.GetCount
 004A0CBC    dec         eax
 004A0CBD    test        eax,eax
>004A0CBF    jl          004A0DC3
 004A0CC5    inc         eax
 004A0CC6    mov         dword ptr [ebp-1C],eax
 004A0CC9    mov         dword ptr [ebp-0C],0
 004A0CD0    mov         edx,dword ptr [ebp-0C]
 004A0CD3    mov         eax,dword ptr [ebx+30]
 004A0CD6    call        004A0094
 004A0CDB    xor         edx,edx
 004A0CDD    mov         dl,byte ptr [eax+0C]
 004A0CE0    mov         edi,dword ptr [eax+10]
 004A0CE3    movzx       eax,byte ptr [eax+0D]
 004A0CE7    sub         eax,edx
>004A0CE9    jl          004A0DB7
 004A0CEF    inc         eax
 004A0CF0    mov         dword ptr [ebp-20],eax
 004A0CF3    mov         dword ptr [ebp-10],edx
 004A0CF6    mov         eax,dword ptr [ebp-10]
 004A0CF9    add         eax,eax
 004A0CFB    mov         edx,dword ptr [ebx+70]
 004A0CFE    lea         esi,[edx+eax*8]
 004A0D01    mov         eax,ebx
 004A0D03    call        004A0C4C
 004A0D08    push        eax
 004A0D09    mov         eax,edi
 004A0D0B    pop         edx
 004A0D0C    mov         ecx,edx
 004A0D0E    cdq
 004A0D0F    idiv        eax,ecx
 004A0D11    mov         eax,dword ptr [ebx+38]
 004A0D14    add         eax,dword ptr [ebx+40]
 004A0D17    imul        edx,eax
 004A0D1A    mov         dword ptr [ebp-14],edx
 004A0D1D    mov         eax,ebx
 004A0D1F    call        004A0C4C
 004A0D24    push        eax
 004A0D25    mov         eax,edi
 004A0D27    pop         edx
 004A0D28    mov         ecx,edx
 004A0D2A    cdq
 004A0D2B    idiv        eax,ecx
 004A0D2D    mov         edx,dword ptr [ebx+3C]
 004A0D30    add         edx,dword ptr [ebx+44]
 004A0D33    imul        edx
 004A0D35    mov         dword ptr [ebp-18],eax
 004A0D38    fild        dword ptr [ebp-14]
 004A0D3B    fld         tbyte ptr ds:[4A0DFC];0.05:Extended
 004A0D41    faddp       st(1),st
 004A0D43    fild        dword ptr [ebx+60]
 004A0D46    fdivp       st(1),st
 004A0D48    fstp        dword ptr [esi]
 004A0D4A    wait
 004A0D4B    fild        dword ptr [ebx+64]
 004A0D4E    fild        dword ptr [ebp-18]
 004A0D51    fld         tbyte ptr ds:[4A0DFC];0.05:Extended
 004A0D57    faddp       st(1),st
 004A0D59    fsubp       st(1),st
 004A0D5B    fild        dword ptr [ebx+64]
 004A0D5E    fdivp       st(1),st
 004A0D60    fstp        dword ptr [esi+4]
 004A0D63    wait
 004A0D64    mov         dl,byte ptr [ebp-10]
 004A0D67    mov         eax,ebx
 004A0D69    call        004A0244
 004A0D6E    add         eax,dword ptr [ebp-14]
 004A0D71    mov         dword ptr [ebp-24],eax
 004A0D74    fild        dword ptr [ebp-24]
 004A0D77    fld         tbyte ptr ds:[4A0DFC];0.05:Extended
 004A0D7D    fsubp       st(1),st
 004A0D7F    fild        dword ptr [ebx+60]
 004A0D82    fdivp       st(1),st
 004A0D84    fstp        dword ptr [esi+8]
 004A0D87    wait
 004A0D88    fild        dword ptr [ebx+64]
 004A0D8B    mov         eax,dword ptr [ebp-18]
 004A0D8E    add         eax,dword ptr [ebx+3C]
 004A0D91    mov         dword ptr [ebp-24],eax
 004A0D94    fild        dword ptr [ebp-24]
 004A0D97    fld         tbyte ptr ds:[4A0DFC];0.05:Extended
 004A0D9D    fsubp       st(1),st
 004A0D9F    fsubp       st(1),st
 004A0DA1    fild        dword ptr [ebx+64]
 004A0DA4    fdivp       st(1),st
 004A0DA6    fstp        dword ptr [esi+0C]
 004A0DA9    wait
 004A0DAA    inc         edi
 004A0DAB    inc         dword ptr [ebp-10]
 004A0DAE    dec         dword ptr [ebp-20]
>004A0DB1    jne         004A0CF6
 004A0DB7    inc         dword ptr [ebp-0C]
 004A0DBA    dec         dword ptr [ebp-1C]
>004A0DBD    jne         004A0CD0
 004A0DC3    xor         eax,eax
 004A0DC5    mov         al,byte ptr [ebp-1]
 004A0DC8    add         eax,eax
 004A0DCA    mov         edx,dword ptr [ebx+70]
 004A0DCD    lea         esi,[edx+eax*8]
 004A0DD0    mov         eax,dword ptr [ebp-8]
 004A0DD3    mov         edx,dword ptr [esi]
 004A0DD5    mov         dword ptr [eax],edx
 004A0DD7    mov         eax,dword ptr [ebp-8]
 004A0DDA    mov         edx,dword ptr [esi+4]
 004A0DDD    mov         dword ptr [eax+4],edx
 004A0DE0    mov         eax,dword ptr [ebp+8]
 004A0DE3    mov         edx,dword ptr [esi+8]
 004A0DE6    mov         dword ptr [eax],edx
 004A0DE8    mov         eax,dword ptr [ebp+8]
 004A0DEB    mov         edx,dword ptr [esi+0C]
 004A0DEE    mov         dword ptr [eax+4],edx
 004A0DF1    pop         edi
 004A0DF2    pop         esi
 004A0DF3    pop         ebx
 004A0DF4    mov         esp,ebp
 004A0DF6    pop         ebp
 004A0DF7    ret         4
end;*}

//004A0E08
procedure sub_004A0E08(?:TGLBitmapFont; ?:TBitmapFontRanges);
begin
{*
 004A0E08    push        ebx
 004A0E09    push        esi
 004A0E0A    mov         esi,eax
 004A0E0C    or          edx,0FFFFFFFF
 004A0E0F    mov         eax,esi
 004A0E11    call        004A02CC
 004A0E16    push        0
 004A0E18    lea         eax,[esi+70];TGLBitmapFont.?f70:.4
 004A0E1B    mov         ecx,1
 004A0E20    mov         edx,dword ptr ds:[49F8DC];.4
 004A0E26    call        @DynArraySetLength
 004A0E2B    add         esp,4
 004A0E2E    mov         eax,dword ptr [esi+54];TGLBitmapFont.?f54:TList
 004A0E31    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 004A0E34    dec         ebx
 004A0E35    cmp         ebx,0
>004A0E38    jl          004A0E51
 004A0E3A    mov         edx,ebx
 004A0E3C    mov         eax,dword ptr [esi+54];TGLBitmapFont.?f54:TList
 004A0E3F    call        TList.Get
 004A0E44    mov         edx,esi
 004A0E46    mov         ecx,dword ptr [eax]
 004A0E48    call        dword ptr [ecx+34]
 004A0E4B    dec         ebx
 004A0E4C    cmp         ebx,0FFFFFFFF
>004A0E4F    jne         004A0E3A
 004A0E51    pop         esi
 004A0E52    pop         ebx
 004A0E53    ret
*}
end;

//004A0E54
procedure TGLCustomBitmapFont.sub_004A0E54;
begin
{*
 004A0E54    push        ebx
 004A0E55    mov         ebx,eax
 004A0E57    mov         eax,dword ptr [ebx+58];TGLCustomBitmapFont.?f58:TGLTextureHandle
 004A0E5A    call        0046CFA8
 004A0E5F    mov         byte ptr [ebx+5C],1;TGLCustomBitmapFont.?f5C:byte
 004A0E63    pop         ebx
 004A0E64    ret
*}
end;

//004A0E68
procedure TGLCustomBitmapFont.sub_004A0E68;
begin
{*
 004A0E68    mov         eax,1908
 004A0E6D    ret
*}
end;

//004A0E70
constructor TGLFlatText.Create(AOwner:TComponent);
begin
{*
 004A0E70    push        ebx
 004A0E71    push        esi
 004A0E72    test        dl,dl
>004A0E74    je          004A0E7E
 004A0E76    add         esp,0FFFFFFF0
 004A0E79    call        @ClassCreate
 004A0E7E    mov         ebx,edx
 004A0E80    mov         esi,eax
 004A0E82    xor         edx,edx
 004A0E84    mov         eax,esi
 004A0E86    call        TGLCustomSceneObject.Create
 004A0E8B    mov         al,byte ptr [esi+3C];TGLFlatText.?f3C:byte
 004A0E8E    or          al,byte ptr ds:[4A0ED0];0x9 gvar_004A0ED0
 004A0E94    mov         byte ptr [esi+3C],al;TGLFlatText.?f3C:byte
 004A0E97    mov         eax,[005AE830];^gvar_005AD44C
 004A0E9C    push        eax
 004A0E9D    push        0
 004A0E9F    push        0
 004A0EA1    mov         ecx,esi
 004A0EA3    mov         dl,1
 004A0EA5    mov         eax,[00470BF8];TGLColor
 004A0EAA    call        TGLColor.Create;TGLColor.Create
 004A0EAF    mov         dword ptr [esi+0A4],eax;TGLFlatText.ModulateColor:TGLColor
 004A0EB5    mov         eax,esi
 004A0EB7    test        bl,bl
>004A0EB9    je          004A0ECA
 004A0EBB    call        @AfterConstruction
 004A0EC0    pop         dword ptr fs:[0]
 004A0EC7    add         esp,0C
 004A0ECA    mov         eax,esi
 004A0ECC    pop         esi
 004A0ECD    pop         ebx
 004A0ECE    ret
*}
end;

//004A0ED4
destructor TGLFlatText.Destroy;
begin
{*
 004A0ED4    push        ebx
 004A0ED5    push        esi
 004A0ED6    call        @BeforeDestruction
 004A0EDB    mov         ebx,edx
 004A0EDD    mov         esi,eax
 004A0EDF    mov         eax,dword ptr [esi+0A4];TGLFlatText.ModulateColor:TGLColor
 004A0EE5    call        TObject.Free
 004A0EEA    xor         edx,edx
 004A0EEC    mov         eax,esi
 004A0EEE    call        TGLFlatText.SetBitmapFont
 004A0EF3    mov         edx,ebx
 004A0EF5    and         dl,0FC
 004A0EF8    mov         eax,esi
 004A0EFA    call        TGLCustomSceneObject.Destroy
 004A0EFF    test        bl,bl
>004A0F01    jle         004A0F0A
 004A0F03    mov         eax,esi
 004A0F05    call        @ClassDestroy
 004A0F0A    pop         esi
 004A0F0B    pop         ebx
 004A0F0C    ret
*}
end;

//004A0F10
procedure TGLFlatText.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004A0F10    push        ebx
 004A0F11    push        esi
 004A0F12    push        edi
 004A0F13    mov         ebx,ecx
 004A0F15    mov         esi,edx
 004A0F17    mov         edi,eax
 004A0F19    cmp         bl,1
>004A0F1C    jne         004A0F2F
 004A0F1E    cmp         esi,dword ptr [edi+98];TGLFlatText.BitmapFont:TGLCustomBitmapFont
>004A0F24    jne         004A0F2F
 004A0F26    xor         edx,edx
 004A0F28    mov         eax,edi
 004A0F2A    call        TGLFlatText.SetBitmapFont
 004A0F2F    mov         ecx,ebx
 004A0F31    mov         edx,esi
 004A0F33    mov         eax,edi
 004A0F35    call        TComponent.Notification
 004A0F3A    pop         edi
 004A0F3B    pop         esi
 004A0F3C    pop         ebx
 004A0F3D    ret
*}
end;

//004A0F40
procedure TGLFlatText.SetBitmapFont(Value:TGLCustomBitmapFont);
begin
{*
 004A0F40    push        esi
 004A0F41    push        edi
 004A0F42    push        ebp
 004A0F43    mov         edi,edx
 004A0F45    mov         esi,eax
 004A0F47    mov         ebp,dword ptr [esi+98];TGLFlatText.BitmapFont:TGLCustomBitmapFont
 004A0F4D    cmp         edi,ebp
>004A0F4F    je          004A0F8B
 004A0F51    test        ebp,ebp
>004A0F53    je          004A0F5E
 004A0F55    mov         edx,esi
 004A0F57    mov         eax,ebp
 004A0F59    mov         ecx,dword ptr [eax]
 004A0F5B    call        dword ptr [ecx+40];TGLCustomBitmapFont.sub_004A0484
 004A0F5E    mov         ebp,edi
 004A0F60    mov         dword ptr [esi+98],ebp;TGLFlatText.BitmapFont:TGLCustomBitmapFont
 004A0F66    test        ebp,ebp
>004A0F68    je          004A0F80
 004A0F6A    mov         edx,esi
 004A0F6C    mov         eax,ebp
 004A0F6E    mov         ecx,dword ptr [eax]
 004A0F70    call        dword ptr [ecx+3C];TGLCustomBitmapFont.sub_004A03F0
 004A0F73    mov         edx,esi
 004A0F75    mov         eax,dword ptr [esi+98];TGLFlatText.BitmapFont:TGLCustomBitmapFont
 004A0F7B    call        TComponent.FreeNotification
 004A0F80    mov         eax,esi
 004A0F82    mov         si,0FFE7
 004A0F86    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A0F8B    pop         ebp
 004A0F8C    pop         edi
 004A0F8D    pop         esi
 004A0F8E    ret
*}
end;

//004A0F90
procedure TGLFlatText.SetText(Value:String);
begin
{*
 004A0F90    push        ebx
 004A0F91    push        esi
 004A0F92    mov         esi,edx
 004A0F94    mov         ebx,eax
 004A0F96    lea         eax,[ebx+9C];TGLFlatText.Text:String
 004A0F9C    mov         edx,esi
 004A0F9E    call        @LStrAsg
 004A0FA3    mov         eax,ebx
 004A0FA5    mov         si,0FFE7
 004A0FA9    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A0FAE    pop         esi
 004A0FAF    pop         ebx
 004A0FB0    ret
*}
end;

//004A0FB4
procedure TGLFlatText.SetAlignment(Value:TAlignment);
begin
{*
 004A0FB4    push        esi
 004A0FB5    mov         esi,eax
 004A0FB7    mov         byte ptr [esi+0A0],dl;TGLFlatText.Alignment:TAlignment
 004A0FBD    mov         eax,esi
 004A0FBF    mov         si,0FFE7
 004A0FC3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A0FC8    pop         esi
 004A0FC9    ret
*}
end;

//004A0FCC
procedure TGLFlatText.SetLayout(Value:TGLTextLayout);
begin
{*
 004A0FCC    push        esi
 004A0FCD    mov         esi,eax
 004A0FCF    mov         byte ptr [esi+0A1],dl;TGLFlatText.Layout:TGLTextLayout
 004A0FD5    mov         eax,esi
 004A0FD7    mov         si,0FFE7
 004A0FDB    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A0FE0    pop         esi
 004A0FE1    ret
*}
end;

//004A0FE4
procedure TGLFlatText.SetModulateColor(Value:TGLColor);
begin
{*
 004A0FE4    mov         eax,dword ptr [eax+0A4];TGLFlatText.ModulateColor:TGLColor
 004A0FEA    mov         ecx,dword ptr [eax]
 004A0FEC    call        dword ptr [ecx+8];TGLColor.Assign
 004A0FEF    ret
*}
end;

//004A0FF0
procedure TGLFlatText.SetOptions(Value:TGLFlatTextOptions);
begin
{*
 004A0FF0    push        ebx
 004A0FF1    push        esi
 004A0FF2    push        ecx
 004A0FF3    mov         byte ptr [esp],dl
 004A0FF6    mov         ebx,eax
 004A0FF8    mov         al,byte ptr [ebx+0A8];TGLFlatText.Options:TGLFlatTextOptions
 004A0FFE    cmp         al,byte ptr [esp]
>004A1001    je          004A1017
 004A1003    mov         al,byte ptr [esp]
 004A1006    mov         byte ptr [ebx+0A8],al;TGLFlatText.Options:TGLFlatTextOptions
 004A100C    mov         eax,ebx
 004A100E    mov         si,0FFE7
 004A1012    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A1017    pop         edx
 004A1018    pop         esi
 004A1019    pop         ebx
 004A101A    ret
*}
end;

//004A101C
{*procedure sub_004A101C(?:?);
begin
 004A101C    push        ebp
 004A101D    mov         ebp,esp
 004A101F    push        ebx
 004A1020    push        esi
 004A1021    mov         esi,edx
 004A1023    mov         ebx,eax
 004A1025    cmp         dword ptr [ebx+98],0;TGLFlatText.BitmapFont:TGLCustomBitmapFont
>004A102C    je          004A10CF
 004A1032    cmp         dword ptr [ebx+9C],0;TGLFlatText.Text:String
>004A1039    je          004A10CF
 004A103F    mov         eax,dword ptr [esi+5C]
 004A1042    mov         ecx,1B02
 004A1047    mov         edx,408
 004A104C    call        0046D670
 004A1051    push        2000
 004A1056    call        OpenGL32.glPushAttrib
 004A105B    mov         eax,dword ptr [ebx+0A4];TGLFlatText.ModulateColor:TGLColor
 004A1061    fld         dword ptr [eax+24];TGLColor.Alpha:Single
 004A1064    fcomp       dword ptr ds:[4A10F4];1:Single
 004A106A    fnstsw      al
 004A106C    sahf
>004A106D    je          004A1088
 004A106F    push        0BE2
 004A1074    call        OpenGL32.glEnable
 004A1079    push        303
 004A107E    push        302
 004A1083    call        OpenGL32.glBlendFunc
 004A1088    test        byte ptr [ebx+0A8],1;TGLFlatText.Options:TGLFlatTextOptions
>004A108F    je          004A109B
 004A1091    push        0B44
 004A1096    call        OpenGL32.glDisable
 004A109B    mov         al,byte ptr [ebx+0A0];TGLFlatText.Alignment:TAlignment
 004A10A1    push        eax
 004A10A2    mov         al,byte ptr [ebx+0A1];TGLFlatText.Layout:TGLTextLayout
 004A10A8    push        eax
 004A10A9    mov         eax,dword ptr [ebx+0A4];TGLFlatText.ModulateColor:TGLColor
 004A10AF    add         eax,18;TGLColor.Red:Single
 004A10B2    push        eax
 004A10B3    push        0
 004A10B5    push        0
 004A10B7    mov         edx,esi
 004A10B9    mov         ecx,dword ptr [ebx+9C];TGLFlatText.Text:String
 004A10BF    mov         eax,dword ptr [ebx+98];TGLFlatText.BitmapFont:TGLCustomBitmapFont
 004A10C5    call        004A0888
 004A10CA    call        OpenGL32.glPopAttrib
 004A10CF    mov         eax,ebx
 004A10D1    call        0047BA94
 004A10D6    test        eax,eax
>004A10D8    jle         004A10EE
 004A10DA    push        esi
 004A10DB    mov         eax,ebx
 004A10DD    call        0047BA94
 004A10E2    mov         ecx,eax
 004A10E4    dec         ecx
 004A10E5    xor         edx,edx
 004A10E7    mov         eax,ebx
 004A10E9    mov         ebx,dword ptr [eax]
 004A10EB    call        dword ptr [ebx+6C];TGLFlatText.sub_0047D7AC
 004A10EE    pop         esi
 004A10EF    pop         ebx
 004A10F0    pop         ebp
 004A10F1    ret         4
end;*}

//004A10F8
procedure TGLFlatText.Assign(Source:TPersistent);
begin
{*
 004A10F8    push        ebx
 004A10F9    push        esi
 004A10FA    push        edi
 004A10FB    mov         ebx,edx
 004A10FD    mov         esi,eax
 004A10FF    test        ebx,ebx
>004A1101    je          004A1164
 004A1103    mov         eax,ebx
 004A1105    mov         edx,dword ptr ds:[49FCC0];TGLFlatText
 004A110B    call        @IsClass
 004A1110    test        al,al
>004A1112    je          004A1164
 004A1114    mov         edi,ebx
 004A1116    mov         edx,dword ptr [edi+98]
 004A111C    mov         eax,esi
 004A111E    call        TGLFlatText.SetBitmapFont
 004A1123    mov         edx,dword ptr [edi+9C]
 004A1129    mov         eax,esi
 004A112B    call        TGLFlatText.SetText
 004A1130    mov         dl,byte ptr [edi+0A0]
 004A1136    mov         eax,esi
 004A1138    call        TGLFlatText.SetAlignment
 004A113D    mov         dl,byte ptr [edi+0A1]
 004A1143    mov         eax,esi
 004A1145    call        TGLFlatText.SetLayout
 004A114A    mov         edx,dword ptr [edi+0A4]
 004A1150    mov         eax,esi
 004A1152    call        TGLFlatText.SetModulateColor
 004A1157    mov         dl,byte ptr [edi+0A8]
 004A115D    mov         eax,esi
 004A115F    call        TGLFlatText.SetOptions
 004A1164    mov         edx,ebx
 004A1166    mov         eax,esi
 004A1168    call        TGLCustomSceneObject.Assign
 004A116D    pop         edi
 004A116E    pop         esi
 004A116F    pop         ebx
 004A1170    ret
*}
end;

Initialization
//004A11A4
{*
 004A11A4    push        ebp
 004A11A5    mov         ebp,esp
 004A11A7    add         esp,0FFFFFFF8
 004A11AA    sub         dword ptr ds:[5E1590],1
>004A11B1    jae         004A11D0
 004A11B3    mov         eax,[0049FA04];TGLBitmapFont
 004A11B8    mov         dword ptr [ebp-8],eax
 004A11BB    mov         eax,[0049FCC0];TGLFlatText
 004A11C0    mov         dword ptr [ebp-4],eax
 004A11C3    lea         eax,[ebp-8]
 004A11C6    mov         edx,1
 004A11CB    call        RegisterClasses
 004A11D0    pop         ecx
 004A11D1    pop         ecx
 004A11D2    pop         ebp
 004A11D3    ret
*}
Finalization
end.