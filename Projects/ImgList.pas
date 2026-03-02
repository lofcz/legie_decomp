//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ImgList;

interface

uses
  SysUtils, Classes, ImgList, Graphics;

type
  TChangeLink = class(TObject)
  public
    FSender:TCustomImageList;//f4
    FOnChange:TNotifyEvent;//f8
    procedure Change; dynamic;//00449D78
    destructor Destroy;//00449D44
  end;
  TCustomImageList = class(TComponent)
  public
    FHeight:Integer;//f30
    FWidth:Integer;//f34
    FAllocBy:Integer;//f38
    FHandle:HIMAGELIST;//f3C
    FDrawingStyle:TDrawingStyle;//f40
    FMasked:Boolean;//f41
    FShareImages:Boolean;//f42
    FImageType:TImageType;//f43
    FBkColor:TColor;//f44
    FBlendColor:TColor;//f48
    FClients:TList;//f4C
    FBitmap:TBitmap;//f50
    FMonoBitmap:TBitmap;//f54
    FChanged:Boolean;//f58
    FUpdateCount:Integer;//f5C
    FOnChange:TNotifyEvent;//f60
    destructor Destroy; virtual;//004488C4
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00449314
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0044969C
    procedure Assign(Source:TPersistent); virtual;//v8//00449254
    constructor Create(AOwner:TComponent); virtual;//v2C//00448878
    //procedure v30(?:?; ?:?; ?:?; ?:?; ?:?; ?:?); virtual;//v30//00448E48
    procedure v34; virtual;//v34//00448930
    procedure ReadData(Stream:TStream); virtual;//v38//00449B50
    procedure WriteData(Stream:TStream); virtual;//v3C//00449BDC
    function GetHotSpot:TPoint; virtual;//v40//00449454
    procedure Change; dynamic;//00449464
    function HandleAllocated:Boolean;//004489E8
    procedure HandleNeeded;//004489F0
    procedure InitBitmap;//004489FC
    procedure SetNewDimensions(Value:HIMAGELIST);//00448AC0
    procedure SetHandle(Value:HIMAGELIST);//00448AF8
    function GetHandle:HIMAGELIST;//00448B24
    function GetImageHandle(Image:TBitmap; ImageDDB:TBitmap):HBITMAP;//00448B34
    procedure FreeHandle;//00448B88
    procedure CreateImageList;//00448BC0
    function Add(Image:TBitmap; Mask:TBitmap):Integer;//00448C60
    function GetCount:Integer;//00448D2C
    procedure Delete(Index:Integer);//00448D50
    procedure Clear;//00448DDC
    procedure SetBkColor(Value:TColor);//00448DE8
    function GetBkColor:TColor;//00448E20
    procedure Draw(Canvas:TCanvas; X:Integer; Y:Integer; Index:Integer; Enabled:Boolean);//0044901C
    procedure Draw(Canvas:TCanvas; X:Integer; Y:Integer; Index:Integer; ADrawingStyle:TDrawingStyle; AImageType:TImageType; Enabled:Boolean);//00449040
    procedure CopyImages(Value:HIMAGELIST; Index:Integer);//0044908C
    procedure AddImages(Value:TCustomImageList);//00449234
    procedure CheckImage(Image:TGraphic);//004493C4
    procedure SetDrawingStyle(Value:TDrawingStyle);//0044943C
    procedure UnRegisterChanges(Value:TChangeLink);//004494B4
    procedure RegisterChanges(Value:TChangeLink);//004494F8
    function Equal(IL:TCustomImageList):Boolean;//00449550
    procedure ReadD2Stream(Stream:TStream);//004496F4
    procedure ReadD3Stream(Stream:TStream);//00449988
    procedure BeginUpdate;//00449D20
    procedure EndUpdate;//00449D24
  end;
    function GetRGBColor(Value:TColor):DWORD;//00448838
    function GetColor(Value:DWORD):TColor;//00448858
    constructor Create(AOwner:TComponent);//00448878
    destructor Destroy;//004488C4
    procedure sub_00448930;//00448930
    //procedure sub_00448E48(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00448E48
    procedure Assign(Source:TPersistent);//00449254
    procedure AssignTo(Dest:TPersistent);//00449314
    function GetHotSpot:TPoint;//00449454
    procedure Change;//00449464
    function StreamsEqual(S1:TMemoryStream; S2:TMemoryStream):Boolean;//0044950C
    function DoWrite:Boolean;//00449640
    procedure DefineProperties(Filer:TFiler);//0044969C
    procedure ReadData(Stream:TStream);//00449B50
    procedure WriteData(Stream:TStream);//00449BDC
    procedure Change;//00449D78

implementation

//00448838
function GetRGBColor(Value:TColor):DWORD;
begin
{*
 00448838    call        ColorToRGB
 0044883D    mov         edx,eax
 0044883F    sub         edx,1FFFFFFF
>00448845    je          0044884C
 00448847    dec         edx
>00448848    je          00448850
>0044884A    jmp         00448855
 0044884C    or          eax,0FFFFFFFF
 0044884F    ret
 00448850    mov         eax,0FF000000
 00448855    ret
*}
end;

//00448858
function GetColor(Value:DWORD):TColor;
begin
{*
 00448858    mov         edx,eax
 0044885A    sub         edx,0FF000000
>00448860    je          00448870
 00448862    sub         edx,0FFFFFF
>00448868    jne         00448875
 0044886A    mov         eax,1FFFFFFF
 0044886F    ret
 00448870    mov         eax,20000000
 00448875    ret
*}
end;

//00448878
constructor TCustomImageList.Create(AOwner:TComponent);
begin
{*
 00448878    push        ebx
 00448879    push        esi
 0044887A    test        dl,dl
>0044887C    je          00448886
 0044887E    add         esp,0FFFFFFF0
 00448881    call        @ClassCreate
 00448886    mov         ebx,edx
 00448888    mov         esi,eax
 0044888A    xor         edx,edx
 0044888C    mov         eax,esi
 0044888E    call        TComponent.Create
 00448893    mov         dword ptr [esi+34],10
 0044889A    mov         dword ptr [esi+30],10
 004488A1    mov         eax,esi
 004488A3    mov         edx,dword ptr [eax]
 004488A5    call        dword ptr [edx+34]
 004488A8    mov         eax,esi
 004488AA    test        bl,bl
>004488AC    je          004488BD
 004488AE    call        @AfterConstruction
 004488B3    pop         dword ptr fs:[0]
 004488BA    add         esp,0C
 004488BD    mov         eax,esi
 004488BF    pop         esi
 004488C0    pop         ebx
 004488C1    ret
*}
end;

//004488C4
destructor TCustomImageList.Destroy;
begin
{*
 004488C4    push        ebx
 004488C5    push        esi
 004488C6    push        edi
 004488C7    call        @BeforeDestruction
 004488CC    mov         ebx,edx
 004488CE    mov         edi,eax
>004488D0    jmp         004488E2
 004488D2    mov         eax,esi
 004488D4    call        TList.Last
 004488D9    mov         edx,eax
 004488DB    mov         eax,edi
 004488DD    call        TCustomImageList.UnRegisterChanges
 004488E2    mov         esi,dword ptr [edi+4C]
 004488E5    cmp         dword ptr [esi+8],0
>004488E9    jg          004488D2
 004488EB    mov         eax,dword ptr [edi+50]
 004488EE    call        TObject.Free
 004488F3    mov         eax,edi
 004488F5    call        TCustomImageList.FreeHandle
 004488FA    mov         eax,dword ptr [edi+4C]
 004488FD    call        TObject.Free
 00448902    xor         eax,eax
 00448904    mov         dword ptr [edi+4C],eax
 00448907    mov         eax,dword ptr [edi+54]
 0044890A    test        eax,eax
>0044890C    je          00448913
 0044890E    call        TObject.Free
 00448913    mov         edx,ebx
 00448915    and         dl,0FC
 00448918    mov         eax,edi
 0044891A    call        TComponent.Destroy
 0044891F    test        bl,bl
>00448921    jle         0044892A
 00448923    mov         eax,edi
 00448925    call        @ClassDestroy
 0044892A    pop         edi
 0044892B    pop         esi
 0044892C    pop         ebx
 0044892D    ret
*}
end;

//00448930
procedure sub_00448930;
begin
{*
 00448930    push        ebp
 00448931    mov         ebp,esp
 00448933    push        0
 00448935    push        ebx
 00448936    mov         ebx,eax
 00448938    xor         eax,eax
 0044893A    push        ebp
 0044893B    push        4489DD
 00448940    push        dword ptr fs:[eax]
 00448943    mov         dword ptr fs:[eax],esp
 00448946    mov         dl,1
 00448948    mov         eax,[00417CEC];TList
 0044894D    call        TObject.Create;TList.Create
 00448952    mov         dword ptr [ebx+4C],eax;TCustomImageList.FClients:TList
 00448955    mov         eax,dword ptr [ebx+30];TCustomImageList.FHeight:Integer
 00448958    cmp         eax,1
>0044895B    jl          0044896A
 0044895D    cmp         eax,8000
>00448962    jg          0044896A
 00448964    cmp         dword ptr [ebx+34],1;TCustomImageList.FWidth:Integer
>00448968    jge         0044898B
 0044896A    lea         edx,[ebp-4]
 0044896D    mov         eax,[005AE2B8];^SInvalidImageSize:TResStringRec
 00448972    call        LoadStr
 00448977    mov         ecx,dword ptr [ebp-4]
 0044897A    mov         dl,1
 0044897C    mov         eax,[00417C8C];EInvalidOperation
 00448981    call        Exception.Create;EInvalidOperation.Create
 00448986    call        @RaiseExcept
 0044898B    mov         dword ptr [ebx+38],4;TCustomImageList.FAllocBy:Integer
 00448992    mov         byte ptr [ebx+41],1;TCustomImageList.FMasked:Boolean
 00448996    mov         dl,2
 00448998    mov         eax,ebx
 0044899A    call        TCustomImageList.SetDrawingStyle
 0044899F    mov         byte ptr [ebx+43],0;TCustomImageList.FImageType:TImageType
 004489A3    mov         dword ptr [ebx+44],1FFFFFFF;TCustomImageList.FBkColor:TColor
 004489AA    mov         dword ptr [ebx+48],1FFFFFFF;TCustomImageList.FBlendColor:TColor
 004489B1    mov         dl,1
 004489B3    mov         eax,[00424EB8];TBitmap
 004489B8    call        TBitmap.Create;TBitmap.Create
 004489BD    mov         dword ptr [ebx+50],eax;TCustomImageList.FBitmap:TBitmap
 004489C0    mov         eax,ebx
 004489C2    call        TCustomImageList.InitBitmap
 004489C7    xor         eax,eax
 004489C9    pop         edx
 004489CA    pop         ecx
 004489CB    pop         ecx
 004489CC    mov         dword ptr fs:[eax],edx
 004489CF    push        4489E4
 004489D4    lea         eax,[ebp-4]
 004489D7    call        @LStrClr
 004489DC    ret
>004489DD    jmp         @HandleFinally
>004489E2    jmp         004489D4
 004489E4    pop         ebx
 004489E5    pop         ecx
 004489E6    pop         ebp
 004489E7    ret
*}
end;

//004489E8
function TCustomImageList.HandleAllocated:Boolean;
begin
{*
 004489E8    cmp         dword ptr [eax+3C],0
 004489EC    setne       al
 004489EF    ret
*}
end;

//004489F0
procedure TCustomImageList.HandleNeeded;
begin
{*
 004489F0    cmp         dword ptr [eax+3C],0
>004489F4    jne         004489FB
 004489F6    call        TCustomImageList.CreateImageList
 004489FB    ret
*}
end;

//004489FC
procedure TCustomImageList.InitBitmap;
begin
{*
 004489FC    push        ebp
 004489FD    mov         ebp,esp
 004489FF    add         esp,0FFFFFFE8
 00448A02    push        ebx
 00448A03    mov         dword ptr [ebp-4],eax
 00448A06    push        0
 00448A08    call        user32.GetDC
 00448A0D    mov         dword ptr [ebp-8],eax
 00448A10    xor         eax,eax
 00448A12    push        ebp
 00448A13    push        448A9D
 00448A18    push        dword ptr fs:[eax]
 00448A1B    mov         dword ptr fs:[eax],esp
 00448A1E    mov         eax,dword ptr [ebp-4]
 00448A21    mov         ebx,dword ptr [eax+50]
 00448A24    mov         eax,dword ptr [ebp-4]
 00448A27    mov         eax,dword ptr [eax+30]
 00448A2A    push        eax
 00448A2B    mov         eax,dword ptr [ebp-4]
 00448A2E    mov         eax,dword ptr [eax+34]
 00448A31    push        eax
 00448A32    mov         eax,dword ptr [ebp-8]
 00448A35    push        eax
 00448A36    call        gdi32.CreateCompatibleBitmap
 00448A3B    mov         edx,eax
 00448A3D    mov         eax,ebx
 00448A3F    call        TBitmap.SetHandle
 00448A44    mov         eax,ebx
 00448A46    call        TBitmap.GetCanvas
 00448A4B    mov         eax,dword ptr [eax+14]
 00448A4E    xor         edx,edx
 00448A50    call        TBrush.SetColor
 00448A55    mov         eax,ebx
 00448A57    mov         edx,dword ptr [eax]
 00448A59    call        dword ptr [edx+20]
 00448A5C    push        eax
 00448A5D    lea         eax,[ebp-18]
 00448A60    push        eax
 00448A61    mov         eax,ebx
 00448A63    mov         edx,dword ptr [eax]
 00448A65    call        dword ptr [edx+2C]
 00448A68    mov         ecx,eax
 00448A6A    xor         edx,edx
 00448A6C    xor         eax,eax
 00448A6E    call        Bounds
 00448A73    lea         eax,[ebp-18]
 00448A76    push        eax
 00448A77    mov         eax,ebx
 00448A79    call        TBitmap.GetCanvas
 00448A7E    pop         edx
 00448A7F    call        TCanvas.FillRect
 00448A84    xor         eax,eax
 00448A86    pop         edx
 00448A87    pop         ecx
 00448A88    pop         ecx
 00448A89    mov         dword ptr fs:[eax],edx
 00448A8C    push        448AA4
 00448A91    mov         eax,dword ptr [ebp-8]
 00448A94    push        eax
 00448A95    push        0
 00448A97    call        user32.ReleaseDC
 00448A9C    ret
>00448A9D    jmp         @HandleFinally
>00448AA2    jmp         00448A91
 00448AA4    mov         eax,dword ptr [ebp-4]
 00448AA7    mov         eax,dword ptr [eax+54]
 00448AAA    test        eax,eax
>00448AAC    je          00448ABB
 00448AAE    call        TObject.Free
 00448AB3    mov         eax,dword ptr [ebp-4]
 00448AB6    xor         edx,edx
 00448AB8    mov         dword ptr [eax+54],edx
 00448ABB    pop         ebx
 00448ABC    mov         esp,ebp
 00448ABE    pop         ebp
 00448ABF    ret
*}
end;

//00448AC0
procedure TCustomImageList.SetNewDimensions(Value:HIMAGELIST);
begin
{*
 00448AC0    push        ebx
 00448AC1    add         esp,0FFFFFFF8
 00448AC4    mov         ebx,eax
 00448AC6    mov         eax,dword ptr [ebx+34]
 00448AC9    mov         dword ptr [esp+4],eax
 00448ACD    mov         eax,dword ptr [ebx+30]
 00448AD0    mov         dword ptr [esp],eax
 00448AD3    push        esp
 00448AD4    lea         eax,[esp+8]
 00448AD8    push        eax
 00448AD9    push        edx
 00448ADA    call        comctl32.ImageList_GetIconSize
 00448ADF    mov         eax,dword ptr [esp+4]
 00448AE3    mov         dword ptr [ebx+34],eax
 00448AE6    mov         eax,dword ptr [esp]
 00448AE9    mov         dword ptr [ebx+30],eax
 00448AEC    mov         eax,ebx
 00448AEE    call        TCustomImageList.InitBitmap
 00448AF3    pop         ecx
 00448AF4    pop         edx
 00448AF5    pop         ebx
 00448AF6    ret
*}
end;

//00448AF8
procedure TCustomImageList.SetHandle(Value:HIMAGELIST);
begin
{*
 00448AF8    push        ebx
 00448AF9    push        esi
 00448AFA    mov         esi,edx
 00448AFC    mov         ebx,eax
 00448AFE    mov         eax,ebx
 00448B00    call        TCustomImageList.FreeHandle
 00448B05    test        esi,esi
>00448B07    je          00448B20
 00448B09    mov         edx,esi
 00448B0B    mov         eax,ebx
 00448B0D    call        TCustomImageList.SetNewDimensions
 00448B12    mov         dword ptr [ebx+3C],esi
 00448B15    mov         eax,ebx
 00448B17    mov         si,0FFEF
 00448B1B    call        @CallDynaInst
 00448B20    pop         esi
 00448B21    pop         ebx
 00448B22    ret
*}
end;

//00448B24
function TCustomImageList.GetHandle:HIMAGELIST;
begin
{*
 00448B24    push        ebx
 00448B25    mov         ebx,eax
 00448B27    mov         eax,ebx
 00448B29    call        TCustomImageList.HandleNeeded
 00448B2E    mov         eax,dword ptr [ebx+3C]
 00448B31    pop         ebx
 00448B32    ret
*}
end;

//00448B34
function TCustomImageList.GetImageHandle(Image:TBitmap; ImageDDB:TBitmap):HBITMAP;
begin
{*
 00448B34    push        ebx
 00448B35    push        esi
 00448B36    push        edi
 00448B37    mov         edi,ecx
 00448B39    mov         ebx,edx
 00448B3B    mov         esi,eax
 00448B3D    mov         edx,ebx
 00448B3F    mov         eax,esi
 00448B41    call        TCustomImageList.CheckImage
 00448B46    test        ebx,ebx
>00448B48    je          00448B79
 00448B4A    mov         eax,ebx
 00448B4C    call        TBitmap.GetHandleType
 00448B51    cmp         al,1
>00448B53    jne         00448B5E
 00448B55    mov         eax,ebx
 00448B57    mov         edx,dword ptr [eax]
 00448B59    call        dword ptr [edx+64]
>00448B5C    jmp         00448B81
 00448B5E    mov         edx,ebx
 00448B60    mov         eax,edi
 00448B62    mov         ecx,dword ptr [eax]
 00448B64    call        dword ptr [ecx+8]
 00448B67    mov         dl,1
 00448B69    mov         eax,edi
 00448B6B    mov         ecx,dword ptr [eax]
 00448B6D    call        dword ptr [ecx+6C]
 00448B70    mov         eax,edi
 00448B72    mov         edx,dword ptr [eax]
 00448B74    call        dword ptr [edx+64]
>00448B77    jmp         00448B81
 00448B79    mov         eax,dword ptr [esi+50]
 00448B7C    mov         edx,dword ptr [eax]
 00448B7E    call        dword ptr [edx+64]
 00448B81    pop         edi
 00448B82    pop         esi
 00448B83    pop         ebx
 00448B84    ret
*}
end;

//00448B88
procedure TCustomImageList.FreeHandle;
begin
{*
 00448B88    push        ebx
 00448B89    push        esi
 00448B8A    mov         ebx,eax
 00448B8C    mov         eax,ebx
 00448B8E    call        TCustomImageList.HandleAllocated
 00448B93    test        al,al
>00448B95    je          00448BAA
 00448B97    cmp         byte ptr [ebx+42],0
>00448B9B    jne         00448BAA
 00448B9D    mov         eax,ebx
 00448B9F    call        TCustomImageList.GetHandle
 00448BA4    push        eax
 00448BA5    call        comctl32.ImageList_Destroy
 00448BAA    xor         eax,eax
 00448BAC    mov         dword ptr [ebx+3C],eax
 00448BAF    mov         eax,ebx
 00448BB1    mov         si,0FFEF
 00448BB5    call        @CallDynaInst
 00448BBA    pop         esi
 00448BBB    pop         ebx
 00448BBC    ret
*}
end;

//00448BC0
procedure TCustomImageList.CreateImageList;
begin
{*
 00448BC0    push        ebp
 00448BC1    mov         ebp,esp
 00448BC3    push        0
 00448BC5    push        ebx
 00448BC6    push        esi
 00448BC7    mov         ebx,eax
 00448BC9    xor         eax,eax
 00448BCB    push        ebp
 00448BCC    push        448C53
 00448BD1    push        dword ptr fs:[eax]
 00448BD4    mov         dword ptr fs:[eax],esp
 00448BD7    mov         esi,dword ptr [ebx+38]
 00448BDA    push        esi
 00448BDB    push        esi
 00448BDC    xor         eax,eax
 00448BDE    mov         al,byte ptr [ebx+41]
 00448BE1    mov         eax,dword ptr [eax*4+5ACCB8]
 00448BE8    or          eax,0FE
 00448BED    push        eax
 00448BEE    mov         eax,dword ptr [ebx+30]
 00448BF1    push        eax
 00448BF2    mov         eax,dword ptr [ebx+34]
 00448BF5    push        eax
 00448BF6    call        comctl32.ImageList_Create
 00448BFB    mov         dword ptr [ebx+3C],eax
 00448BFE    mov         eax,ebx
 00448C00    call        TCustomImageList.HandleAllocated
 00448C05    test        al,al
>00448C07    jne         00448C2A
 00448C09    lea         edx,[ebp-4]
 00448C0C    mov         eax,[005AE5AC];^SInvalidImageList:TResStringRec
 00448C11    call        LoadStr
 00448C16    mov         ecx,dword ptr [ebp-4]
 00448C19    mov         dl,1
 00448C1B    mov         eax,[00417C8C];EInvalidOperation
 00448C20    call        Exception.Create
 00448C25    call        @RaiseExcept
 00448C2A    mov         eax,dword ptr [ebx+44]
 00448C2D    cmp         eax,1FFFFFFF
>00448C32    je          00448C3D
 00448C34    mov         edx,eax
 00448C36    mov         eax,ebx
 00448C38    call        TCustomImageList.SetBkColor
 00448C3D    xor         eax,eax
 00448C3F    pop         edx
 00448C40    pop         ecx
 00448C41    pop         ecx
 00448C42    mov         dword ptr fs:[eax],edx
 00448C45    push        448C5A
 00448C4A    lea         eax,[ebp-4]
 00448C4D    call        @LStrClr
 00448C52    ret
>00448C53    jmp         @HandleFinally
>00448C58    jmp         00448C4A
 00448C5A    pop         esi
 00448C5B    pop         ebx
 00448C5C    pop         ecx
 00448C5D    pop         ebp
 00448C5E    ret
*}
end;

//00448C60
function TCustomImageList.Add(Image:TBitmap; Mask:TBitmap):Integer;
begin
{*
 00448C60    push        ebp
 00448C61    mov         ebp,esp
 00448C63    add         esp,0FFFFFFF0
 00448C66    push        ebx
 00448C67    push        esi
 00448C68    mov         esi,ecx
 00448C6A    mov         ebx,edx
 00448C6C    mov         dword ptr [ebp-4],eax
 00448C6F    mov         dl,1
 00448C71    mov         eax,[00424EB8];TBitmap
 00448C76    call        TBitmap.Create
 00448C7B    mov         dword ptr [ebp-0C],eax
 00448C7E    xor         eax,eax
 00448C80    push        ebp
 00448C81    push        448D0F
 00448C86    push        dword ptr fs:[eax]
 00448C89    mov         dword ptr fs:[eax],esp
 00448C8C    mov         dl,1
 00448C8E    mov         eax,[00424EB8];TBitmap
 00448C93    call        TBitmap.Create
 00448C98    mov         dword ptr [ebp-10],eax
 00448C9B    xor         eax,eax
 00448C9D    push        ebp
 00448C9E    push        448CF2
 00448CA3    push        dword ptr fs:[eax]
 00448CA6    mov         dword ptr fs:[eax],esp
 00448CA9    mov         eax,dword ptr [ebp-4]
 00448CAC    call        TCustomImageList.HandleNeeded
 00448CB1    mov         ecx,dword ptr [ebp-10]
 00448CB4    mov         edx,esi
 00448CB6    mov         eax,dword ptr [ebp-4]
 00448CB9    call        TCustomImageList.GetImageHandle
 00448CBE    push        eax
 00448CBF    mov         ecx,dword ptr [ebp-0C]
 00448CC2    mov         edx,ebx
 00448CC4    mov         eax,dword ptr [ebp-4]
 00448CC7    call        TCustomImageList.GetImageHandle
 00448CCC    push        eax
 00448CCD    mov         eax,dword ptr [ebp-4]
 00448CD0    mov         eax,dword ptr [eax+3C]
 00448CD3    push        eax
 00448CD4    call        comctl32.ImageList_Add
 00448CD9    mov         dword ptr [ebp-8],eax
 00448CDC    xor         eax,eax
 00448CDE    pop         edx
 00448CDF    pop         ecx
 00448CE0    pop         ecx
 00448CE1    mov         dword ptr fs:[eax],edx
 00448CE4    push        448CF9
 00448CE9    mov         eax,dword ptr [ebp-10]
 00448CEC    call        TObject.Free
 00448CF1    ret
>00448CF2    jmp         @HandleFinally
>00448CF7    jmp         00448CE9
 00448CF9    xor         eax,eax
 00448CFB    pop         edx
 00448CFC    pop         ecx
 00448CFD    pop         ecx
 00448CFE    mov         dword ptr fs:[eax],edx
 00448D01    push        448D16
 00448D06    mov         eax,dword ptr [ebp-0C]
 00448D09    call        TObject.Free
 00448D0E    ret
>00448D0F    jmp         @HandleFinally
>00448D14    jmp         00448D06
 00448D16    mov         eax,dword ptr [ebp-4]
 00448D19    mov         si,0FFEF
 00448D1D    call        @CallDynaInst
 00448D22    mov         eax,dword ptr [ebp-8]
 00448D25    pop         esi
 00448D26    pop         ebx
 00448D27    mov         esp,ebp
 00448D29    pop         ebp
 00448D2A    ret
*}
end;

//00448D2C
function TCustomImageList.GetCount:Integer;
begin
{*
 00448D2C    push        ebx
 00448D2D    mov         ebx,eax
 00448D2F    mov         eax,ebx
 00448D31    call        TCustomImageList.HandleAllocated
 00448D36    test        al,al
>00448D38    je          00448D49
 00448D3A    mov         eax,ebx
 00448D3C    call        TCustomImageList.GetHandle
 00448D41    push        eax
 00448D42    call        comctl32.ImageList_GetImageCount
 00448D47    pop         ebx
 00448D48    ret
 00448D49    xor         eax,eax
 00448D4B    pop         ebx
 00448D4C    ret
*}
end;

//00448D50
procedure TCustomImageList.Delete(Index:Integer);
begin
{*
 00448D50    push        ebp
 00448D51    mov         ebp,esp
 00448D53    push        0
 00448D55    push        ebx
 00448D56    push        esi
 00448D57    mov         esi,edx
 00448D59    mov         ebx,eax
 00448D5B    xor         eax,eax
 00448D5D    push        ebp
 00448D5E    push        448DCF
 00448D63    push        dword ptr fs:[eax]
 00448D66    mov         dword ptr fs:[eax],esp
 00448D69    mov         eax,ebx
 00448D6B    call        TCustomImageList.GetCount
 00448D70    cmp         esi,eax
>00448D72    jl          00448D95
 00448D74    lea         edx,[ebp-4]
 00448D77    mov         eax,[005AE2CC];^SImageIndexError:TResStringRec
 00448D7C    call        LoadStr
 00448D81    mov         ecx,dword ptr [ebp-4]
 00448D84    mov         dl,1
 00448D86    mov         eax,[00417C8C];EInvalidOperation
 00448D8B    call        Exception.Create
 00448D90    call        @RaiseExcept
 00448D95    mov         eax,ebx
 00448D97    call        TCustomImageList.HandleAllocated
 00448D9C    test        al,al
>00448D9E    je          00448DAE
 00448DA0    push        esi
 00448DA1    mov         eax,ebx
 00448DA3    call        TCustomImageList.GetHandle
 00448DA8    push        eax
 00448DA9    call        comctl32.ImageList_Remove
 00448DAE    mov         eax,ebx
 00448DB0    mov         si,0FFEF
 00448DB4    call        @CallDynaInst
 00448DB9    xor         eax,eax
 00448DBB    pop         edx
 00448DBC    pop         ecx
 00448DBD    pop         ecx
 00448DBE    mov         dword ptr fs:[eax],edx
 00448DC1    push        448DD6
 00448DC6    lea         eax,[ebp-4]
 00448DC9    call        @LStrClr
 00448DCE    ret
>00448DCF    jmp         @HandleFinally
>00448DD4    jmp         00448DC6
 00448DD6    pop         esi
 00448DD7    pop         ebx
 00448DD8    pop         ecx
 00448DD9    pop         ebp
 00448DDA    ret
*}
end;

//00448DDC
procedure TCustomImageList.Clear;
begin
{*
 00448DDC    or          edx,0FFFFFFFF
 00448DDF    call        TCustomImageList.Delete
 00448DE4    ret
*}
end;

//00448DE8
procedure TCustomImageList.SetBkColor(Value:TColor);
begin
{*
 00448DE8    push        ebx
 00448DE9    push        esi
 00448DEA    mov         esi,edx
 00448DEC    mov         ebx,eax
 00448DEE    mov         eax,ebx
 00448DF0    call        TCustomImageList.HandleAllocated
 00448DF5    test        al,al
>00448DF7    je          00448E0C
 00448DF9    mov         eax,esi
 00448DFB    call        GetRGBColor
 00448E00    push        eax
 00448E01    mov         eax,dword ptr [ebx+3C]
 00448E04    push        eax
 00448E05    call        comctl32.ImageList_SetBkColor
>00448E0A    jmp         00448E0F
 00448E0C    mov         dword ptr [ebx+44],esi
 00448E0F    mov         eax,ebx
 00448E11    mov         si,0FFEF
 00448E15    call        @CallDynaInst
 00448E1A    pop         esi
 00448E1B    pop         ebx
 00448E1C    ret
*}
end;

//00448E20
function TCustomImageList.GetBkColor:TColor;
begin
{*
 00448E20    push        ebx
 00448E21    mov         ebx,eax
 00448E23    mov         eax,ebx
 00448E25    call        TCustomImageList.HandleAllocated
 00448E2A    test        al,al
>00448E2C    je          00448E42
 00448E2E    mov         eax,ebx
 00448E30    call        TCustomImageList.GetHandle
 00448E35    push        eax
 00448E36    call        comctl32.ImageList_GetBkColor
 00448E3B    call        GetColor
 00448E40    pop         ebx
 00448E41    ret
 00448E42    mov         eax,dword ptr [ebx+44]
 00448E45    pop         ebx
 00448E46    ret
*}
end;

//00448E48
{*procedure sub_00448E48(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00448E48    push        ebp
 00448E49    mov         ebp,esp
 00448E4B    add         esp,0FFFFFFD8
 00448E4E    push        ebx
 00448E4F    push        esi
 00448E50    push        edi
 00448E51    mov         edi,ecx
 00448E53    mov         dword ptr [ebp-4],edx
 00448E56    mov         ebx,eax
 00448E58    mov         eax,ebx
 00448E5A    call        TCustomImageList.HandleAllocated
 00448E5F    test        al,al
>00448E61    je          00449013
 00448E67    cmp         byte ptr [ebp+8],0
>00448E6B    je          00448EB1
 00448E6D    mov         eax,dword ptr [ebp+0C]
 00448E70    push        eax
 00448E71    mov         eax,dword ptr [ebx+48];TCustomImageList.FBlendColor:TColor
 00448E74    call        GetRGBColor
 00448E79    push        eax
 00448E7A    mov         eax,ebx
 00448E7C    call        TCustomImageList.GetBkColor
 00448E81    call        GetRGBColor
 00448E86    push        eax
 00448E87    push        0
 00448E89    push        0
 00448E8B    mov         eax,dword ptr [ebp+10]
 00448E8E    push        eax
 00448E8F    mov         eax,dword ptr [ebp+14]
 00448E92    push        eax
 00448E93    mov         eax,edi
 00448E95    call        TCanvas.GetHandle
 00448E9A    push        eax
 00448E9B    mov         eax,dword ptr [ebp-4]
 00448E9E    push        eax
 00448E9F    mov         eax,ebx
 00448EA1    call        TCustomImageList.GetHandle
 00448EA6    push        eax
 00448EA7    call        comctl32.ImageList_DrawEx
>00448EAC    jmp         00449013
 00448EB1    cmp         dword ptr [ebx+54],0;TCustomImageList.FMonoBitmap:TBitmap
>00448EB5    jne         00448EE5
 00448EB7    mov         dl,1
 00448EB9    mov         eax,[00424EB8];TBitmap
 00448EBE    call        TBitmap.Create;TBitmap.Create
 00448EC3    mov         esi,eax
 00448EC5    mov         dword ptr [ebx+54],esi;TCustomImageList.FMonoBitmap:TBitmap
 00448EC8    mov         dl,1
 00448ECA    mov         eax,esi
 00448ECC    call        TBitmap.SetMonochrome
 00448ED1    mov         edx,dword ptr [ebx+34];TCustomImageList.FWidth:Integer
 00448ED4    mov         eax,esi
 00448ED6    mov         ecx,dword ptr [eax]
 00448ED8    call        dword ptr [ecx+40];TBitmap.SetWidth
 00448EDB    mov         edx,dword ptr [ebx+30];TCustomImageList.FHeight:Integer
 00448EDE    mov         eax,esi
 00448EE0    mov         ecx,dword ptr [eax]
 00448EE2    call        dword ptr [ecx+34];TBitmap.SetHeight
 00448EE5    mov         eax,dword ptr [ebx+54];TCustomImageList.FMonoBitmap:TBitmap
 00448EE8    call        TBitmap.GetCanvas
 00448EED    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 00448EF0    mov         edx,0FFFFFF
 00448EF5    call        TBrush.SetColor
 00448EFA    mov         eax,dword ptr [ebx+30];TCustomImageList.FHeight:Integer
 00448EFD    push        eax
 00448EFE    lea         eax,[ebp-28]
 00448F01    push        eax
 00448F02    mov         ecx,dword ptr [ebx+34];TCustomImageList.FWidth:Integer
 00448F05    xor         edx,edx
 00448F07    xor         eax,eax
 00448F09    call        Bounds
 00448F0E    lea         eax,[ebp-28]
 00448F11    push        eax
 00448F12    mov         eax,dword ptr [ebx+54];TCustomImageList.FMonoBitmap:TBitmap
 00448F15    call        TBitmap.GetCanvas
 00448F1A    pop         edx
 00448F1B    call        TCanvas.FillRect
 00448F20    push        0
 00448F22    push        0
 00448F24    push        0FF
 00448F26    push        0
 00448F28    push        0
 00448F2A    push        0
 00448F2C    push        0
 00448F2E    mov         eax,dword ptr [ebx+54];TCustomImageList.FMonoBitmap:TBitmap
 00448F31    call        TBitmap.GetCanvas
 00448F36    call        TCanvas.GetHandle
 00448F3B    push        eax
 00448F3C    mov         eax,dword ptr [ebp-4]
 00448F3F    push        eax
 00448F40    mov         eax,ebx
 00448F42    call        TCustomImageList.GetHandle
 00448F47    push        eax
 00448F48    call        comctl32.ImageList_DrawEx
 00448F4D    mov         eax,dword ptr [ebp+10]
 00448F50    add         eax,dword ptr [ebx+30];TCustomImageList.FHeight:Integer
 00448F53    push        eax
 00448F54    lea         eax,[ebp-18]
 00448F57    push        eax
 00448F58    mov         ecx,dword ptr [ebp+14]
 00448F5B    add         ecx,dword ptr [ebx+34];TCustomImageList.FWidth:Integer
 00448F5E    mov         edx,dword ptr [ebp+10]
 00448F61    mov         eax,dword ptr [ebp+14]
 00448F64    call        Bounds
 00448F69    mov         eax,dword ptr [ebx+54];TCustomImageList.FMonoBitmap:TBitmap
 00448F6C    call        TBitmap.GetCanvas
 00448F71    call        TCanvas.GetHandle
 00448F76    mov         dword ptr [ebp-8],eax
 00448F79    mov         eax,dword ptr [edi+14]
 00448F7C    mov         edx,0FF000014
 00448F81    call        TBrush.SetColor
 00448F86    mov         eax,edi
 00448F88    call        TCanvas.GetHandle
 00448F8D    mov         esi,eax
 00448F8F    push        0FFFFFF
 00448F94    push        esi
 00448F95    call        gdi32.SetTextColor
 00448F9A    push        0
 00448F9C    push        esi
 00448F9D    call        gdi32.SetBkColor
 00448FA2    push        0E20746
 00448FA7    push        0
 00448FA9    push        0
 00448FAB    mov         eax,dword ptr [ebp-8]
 00448FAE    push        eax
 00448FAF    mov         eax,dword ptr [ebx+30];TCustomImageList.FHeight:Integer
 00448FB2    push        eax
 00448FB3    mov         eax,dword ptr [ebx+34];TCustomImageList.FWidth:Integer
 00448FB6    push        eax
 00448FB7    mov         eax,dword ptr [ebp+10]
 00448FBA    inc         eax
 00448FBB    push        eax
 00448FBC    mov         eax,dword ptr [ebp+14]
 00448FBF    inc         eax
 00448FC0    push        eax
 00448FC1    push        esi
 00448FC2    call        gdi32.BitBlt
 00448FC7    mov         eax,dword ptr [edi+14]
 00448FCA    mov         edx,0FF000010
 00448FCF    call        TBrush.SetColor
 00448FD4    mov         eax,edi
 00448FD6    call        TCanvas.GetHandle
 00448FDB    mov         esi,eax
 00448FDD    push        0FFFFFF
 00448FE2    push        esi
 00448FE3    call        gdi32.SetTextColor
 00448FE8    push        0
 00448FEA    push        esi
 00448FEB    call        gdi32.SetBkColor
 00448FF0    push        0E20746
 00448FF5    push        0
 00448FF7    push        0
 00448FF9    mov         eax,dword ptr [ebp-8]
 00448FFC    push        eax
 00448FFD    mov         eax,dword ptr [ebx+30];TCustomImageList.FHeight:Integer
 00449000    push        eax
 00449001    mov         eax,dword ptr [ebx+34];TCustomImageList.FWidth:Integer
 00449004    push        eax
 00449005    mov         eax,dword ptr [ebp+10]
 00449008    push        eax
 00449009    mov         eax,dword ptr [ebp+14]
 0044900C    push        eax
 0044900D    push        esi
 0044900E    call        gdi32.BitBlt
 00449013    pop         edi
 00449014    pop         esi
 00449015    pop         ebx
 00449016    mov         esp,ebp
 00449018    pop         ebp
 00449019    ret         10
end;*}

//0044901C
procedure TCustomImageList.Draw(Canvas:TCanvas; X:Integer; Y:Integer; Index:Integer; Enabled:Boolean);
begin
{*
 0044901C    push        ebp
 0044901D    mov         ebp,esp
 0044901F    push        ebx
 00449020    mov         ebx,dword ptr [ebp+10]
 00449023    push        ebx
 00449024    mov         ebx,dword ptr [ebp+0C]
 00449027    push        ebx
 00449028    mov         bl,byte ptr [eax+40]
 0044902B    push        ebx
 0044902C    mov         bl,byte ptr [eax+43]
 0044902F    push        ebx
 00449030    mov         bl,byte ptr [ebp+8]
 00449033    push        ebx
 00449034    call        TCustomImageList.Draw
 00449039    pop         ebx
 0044903A    pop         ebp
 0044903B    ret         0C
*}
end;

//00449040
procedure TCustomImageList.Draw(Canvas:TCanvas; X:Integer; Y:Integer; Index:Integer; ADrawingStyle:TDrawingStyle; AImageType:TImageType; Enabled:Boolean);
begin
{*
 00449040    push        ebp
 00449041    mov         ebp,esp
 00449043    push        ebx
 00449044    push        esi
 00449045    push        edi
 00449046    mov         edi,ecx
 00449048    mov         esi,edx
 0044904A    mov         ebx,eax
 0044904C    mov         eax,ebx
 0044904E    call        TCustomImageList.HandleAllocated
 00449053    test        al,al
>00449055    je          00449085
 00449057    push        edi
 00449058    mov         eax,dword ptr [ebp+18]
 0044905B    push        eax
 0044905C    xor         eax,eax
 0044905E    mov         al,byte ptr [ebp+10]
 00449061    mov         eax,dword ptr [eax*4+5ACCA0]
 00449068    xor         edx,edx
 0044906A    mov         dl,byte ptr [ebp+0C]
 0044906D    or          eax,dword ptr [edx*4+5ACCB0]
 00449074    push        eax
 00449075    mov         al,byte ptr [ebp+8]
 00449078    push        eax
 00449079    mov         ecx,esi
 0044907B    mov         edx,dword ptr [ebp+14]
 0044907E    mov         eax,ebx
 00449080    mov         ebx,dword ptr [eax]
 00449082    call        dword ptr [ebx+30]
 00449085    pop         edi
 00449086    pop         esi
 00449087    pop         ebx
 00449088    pop         ebp
 00449089    ret         14
*}
end;

//0044908C
procedure TCustomImageList.CopyImages(Value:HIMAGELIST; Index:Integer);
begin
{*
 0044908C    push        ebp
 0044908D    mov         ebp,esp
 0044908F    add         esp,0FFFFFFD8
 00449092    push        ebx
 00449093    push        esi
 00449094    push        edi
 00449095    mov         edi,ecx
 00449097    mov         dword ptr [ebp-8],edx
 0044909A    mov         dword ptr [ebp-4],eax
 0044909D    mov         eax,dword ptr [ebp-4]
 004490A0    mov         eax,dword ptr [eax+30]
 004490A3    push        eax
 004490A4    lea         eax,[ebp-28]
 004490A7    push        eax
 004490A8    mov         eax,dword ptr [ebp-4]
 004490AB    mov         ecx,dword ptr [eax+34]
 004490AE    xor         edx,edx
 004490B0    xor         eax,eax
 004490B2    call        Bounds
 004490B7    mov         eax,dword ptr [ebp-4]
 004490BA    call        TCustomImageList.BeginUpdate
 004490BF    xor         eax,eax
 004490C1    push        ebp
 004490C2    push        449225
 004490C7    push        dword ptr fs:[eax]
 004490CA    mov         dword ptr fs:[eax],esp
 004490CD    mov         dl,1
 004490CF    mov         eax,[00424EB8];TBitmap
 004490D4    call        TBitmap.Create
 004490D9    mov         dword ptr [ebp-0C],eax
 004490DC    xor         eax,eax
 004490DE    push        ebp
 004490DF    push        449208
 004490E4    push        dword ptr fs:[eax]
 004490E7    mov         dword ptr fs:[eax],esp
 004490EA    mov         eax,dword ptr [ebp-4]
 004490ED    mov         edx,dword ptr [eax+30]
 004490F0    mov         eax,dword ptr [ebp-0C]
 004490F3    mov         ecx,dword ptr [eax]
 004490F5    call        dword ptr [ecx+34]
 004490F8    mov         eax,dword ptr [ebp-4]
 004490FB    mov         edx,dword ptr [eax+34]
 004490FE    mov         eax,dword ptr [ebp-0C]
 00449101    mov         ecx,dword ptr [eax]
 00449103    call        dword ptr [ecx+40]
 00449106    mov         dl,1
 00449108    mov         eax,[00424EB8];TBitmap
 0044910D    call        TBitmap.Create
 00449112    mov         dword ptr [ebp-10],eax
 00449115    xor         eax,eax
 00449117    push        ebp
 00449118    push        4491EB
 0044911D    push        dword ptr fs:[eax]
 00449120    mov         dword ptr fs:[eax],esp
 00449123    mov         dl,1
 00449125    mov         eax,dword ptr [ebp-10]
 00449128    call        TBitmap.SetMonochrome
 0044912D    mov         eax,dword ptr [ebp-4]
 00449130    mov         edx,dword ptr [eax+30]
 00449133    mov         eax,dword ptr [ebp-10]
 00449136    mov         ecx,dword ptr [eax]
 00449138    call        dword ptr [ecx+34]
 0044913B    mov         eax,dword ptr [ebp-4]
 0044913E    mov         edx,dword ptr [eax+34]
 00449141    mov         eax,dword ptr [ebp-10]
 00449144    mov         ecx,dword ptr [eax]
 00449146    call        dword ptr [ecx+40]
 00449149    mov         eax,dword ptr [ebp-8]
 0044914C    push        eax
 0044914D    call        comctl32.ImageList_GetImageCount
 00449152    mov         esi,eax
 00449154    dec         esi
 00449155    test        esi,esi
>00449157    jl          004491D5
 00449159    inc         esi
 0044915A    xor         ebx,ebx
 0044915C    cmp         edi,0FFFFFFFF
>0044915F    je          00449165
 00449161    cmp         ebx,edi
>00449163    jne         004491D1
 00449165    mov         eax,dword ptr [ebp-0C]
 00449168    call        TBitmap.GetCanvas
 0044916D    mov         dword ptr [ebp-14],eax
 00449170    lea         edx,[ebp-28]
 00449173    mov         eax,dword ptr [ebp-14]
 00449176    call        TCanvas.FillRect
 0044917B    push        0
 0044917D    push        0
 0044917F    push        0
 00449181    mov         eax,dword ptr [ebp-14]
 00449184    call        TCanvas.GetHandle
 00449189    push        eax
 0044918A    push        ebx
 0044918B    mov         eax,dword ptr [ebp-8]
 0044918E    push        eax
 0044918F    call        comctl32.ImageList_Draw
 00449194    mov         eax,dword ptr [ebp-10]
 00449197    call        TBitmap.GetCanvas
 0044919C    mov         dword ptr [ebp-18],eax
 0044919F    lea         edx,[ebp-28]
 004491A2    mov         eax,dword ptr [ebp-18]
 004491A5    call        TCanvas.FillRect
 004491AA    push        10
 004491AC    push        0
 004491AE    push        0
 004491B0    mov         eax,dword ptr [ebp-18]
 004491B3    call        TCanvas.GetHandle
 004491B8    push        eax
 004491B9    push        ebx
 004491BA    mov         eax,dword ptr [ebp-8]
 004491BD    push        eax
 004491BE    call        comctl32.ImageList_Draw
 004491C3    mov         ecx,dword ptr [ebp-10]
 004491C6    mov         edx,dword ptr [ebp-0C]
 004491C9    mov         eax,dword ptr [ebp-4]
 004491CC    call        TCustomImageList.Add
 004491D1    inc         ebx
 004491D2    dec         esi
>004491D3    jne         0044915C
 004491D5    xor         eax,eax
 004491D7    pop         edx
 004491D8    pop         ecx
 004491D9    pop         ecx
 004491DA    mov         dword ptr fs:[eax],edx
 004491DD    push        4491F2
 004491E2    mov         eax,dword ptr [ebp-10]
 004491E5    call        TObject.Free
 004491EA    ret
>004491EB    jmp         @HandleFinally
>004491F0    jmp         004491E2
 004491F2    xor         eax,eax
 004491F4    pop         edx
 004491F5    pop         ecx
 004491F6    pop         ecx
 004491F7    mov         dword ptr fs:[eax],edx
 004491FA    push        44920F
 004491FF    mov         eax,dword ptr [ebp-0C]
 00449202    call        TObject.Free
 00449207    ret
>00449208    jmp         @HandleFinally
>0044920D    jmp         004491FF
 0044920F    xor         eax,eax
 00449211    pop         edx
 00449212    pop         ecx
 00449213    pop         ecx
 00449214    mov         dword ptr fs:[eax],edx
 00449217    push        44922C
 0044921C    mov         eax,dword ptr [ebp-4]
 0044921F    call        TCustomImageList.EndUpdate
 00449224    ret
>00449225    jmp         @HandleFinally
>0044922A    jmp         0044921C
 0044922C    pop         edi
 0044922D    pop         esi
 0044922E    pop         ebx
 0044922F    mov         esp,ebp
 00449231    pop         ebp
 00449232    ret
*}
end;

//00449234
procedure TCustomImageList.AddImages(Value:TCustomImageList);
begin
{*
 00449234    push        ebx
 00449235    push        esi
 00449236    mov         esi,edx
 00449238    mov         ebx,eax
 0044923A    test        esi,esi
>0044923C    je          00449251
 0044923E    mov         eax,esi
 00449240    call        TCustomImageList.GetHandle
 00449245    mov         edx,eax
 00449247    or          ecx,0FFFFFFFF
 0044924A    mov         eax,ebx
 0044924C    call        TCustomImageList.CopyImages
 00449251    pop         esi
 00449252    pop         ebx
 00449253    ret
*}
end;

//00449254
procedure TCustomImageList.Assign(Source:TPersistent);
begin
{*
 00449254    push        ebx
 00449255    push        esi
 00449256    mov         esi,edx
 00449258    mov         ebx,eax
 0044925A    test        esi,esi
>0044925C    jne         00449268
 0044925E    mov         eax,ebx
 00449260    call        TCustomImageList.FreeHandle
 00449265    pop         esi
 00449266    pop         ebx
 00449267    ret
 00449268    mov         eax,esi
 0044926A    mov         edx,dword ptr ds:[448760];TCustomImageList
 00449270    call        @IsClass
 00449275    test        al,al
>00449277    je          00449305
 0044927D    mov         eax,ebx
 0044927F    call        TCustomImageList.Clear
 00449284    mov         al,byte ptr [esi+41]
 00449287    mov         byte ptr [ebx+41],al
 0044928A    mov         al,byte ptr [esi+43]
 0044928D    mov         byte ptr [ebx+43],al
 00449290    mov         dl,byte ptr [esi+40]
 00449293    mov         eax,ebx
 00449295    call        TCustomImageList.SetDrawingStyle
 0044929A    mov         al,byte ptr [esi+42]
 0044929D    mov         byte ptr [ebx+42],al
 004492A0    mov         eax,esi
 004492A2    call        TCustomImageList.GetHandle
 004492A7    mov         edx,eax
 004492A9    mov         eax,ebx
 004492AB    call        TCustomImageList.SetNewDimensions
 004492B0    mov         eax,ebx
 004492B2    call        TCustomImageList.HandleAllocated
 004492B7    test        al,al
>004492B9    jne         004492C4
 004492BB    mov         eax,ebx
 004492BD    call        TCustomImageList.HandleNeeded
>004492C2    jmp         004492D9
 004492C4    mov         eax,dword ptr [ebx+30]
 004492C7    push        eax
 004492C8    mov         eax,dword ptr [ebx+34]
 004492CB    push        eax
 004492CC    mov         eax,ebx
 004492CE    call        TCustomImageList.GetHandle
 004492D3    push        eax
 004492D4    call        comctl32.ImageList_SetIconSize
 004492D9    mov         eax,esi
 004492DB    call        TCustomImageList.GetHandle
 004492E0    push        eax
 004492E1    call        comctl32.ImageList_GetBkColor
 004492E6    call        GetColor
 004492EB    mov         edx,eax
 004492ED    mov         eax,ebx
 004492EF    call        TCustomImageList.SetBkColor
 004492F4    mov         eax,dword ptr [esi+48]
 004492F7    mov         dword ptr [ebx+48],eax
 004492FA    mov         edx,esi
 004492FC    mov         eax,ebx
 004492FE    call        TCustomImageList.AddImages
>00449303    jmp         0044930E
 00449305    mov         edx,esi
 00449307    mov         eax,ebx
 00449309    call        TPersistent.Assign
 0044930E    pop         esi
 0044930F    pop         ebx
 00449310    ret
*}
end;

//00449314
procedure TCustomImageList.AssignTo(Dest:TPersistent);
begin
{*
 00449314    push        ebx
 00449315    push        esi
 00449316    mov         ebx,edx
 00449318    mov         esi,eax
 0044931A    mov         eax,ebx
 0044931C    mov         edx,dword ptr ds:[448760];TCustomImageList
 00449322    call        @IsClass
 00449327    test        al,al
>00449329    je          004493B8
 0044932F    mov         al,byte ptr [esi+41]
 00449332    mov         byte ptr [ebx+41],al
 00449335    mov         al,byte ptr [esi+43]
 00449338    mov         byte ptr [ebx+43],al
 0044933B    mov         dl,byte ptr [esi+40]
 0044933E    mov         eax,ebx
 00449340    call        TCustomImageList.SetDrawingStyle
 00449345    mov         al,byte ptr [esi+42]
 00449348    mov         byte ptr [ebx+42],al
 0044934B    mov         eax,dword ptr [esi+48]
 0044934E    mov         dword ptr [ebx+48],eax
 00449351    mov         eax,ebx
 00449353    call        TCustomImageList.Clear
 00449358    mov         eax,esi
 0044935A    call        TCustomImageList.GetHandle
 0044935F    mov         edx,eax
 00449361    mov         eax,ebx
 00449363    call        TCustomImageList.SetNewDimensions
 00449368    mov         eax,ebx
 0044936A    call        TCustomImageList.HandleAllocated
 0044936F    test        al,al
>00449371    jne         0044937C
 00449373    mov         eax,ebx
 00449375    call        TCustomImageList.HandleNeeded
>0044937A    jmp         00449391
 0044937C    mov         eax,dword ptr [ebx+30]
 0044937F    push        eax
 00449380    mov         eax,dword ptr [ebx+34]
 00449383    push        eax
 00449384    mov         eax,ebx
 00449386    call        TCustomImageList.GetHandle
 0044938B    push        eax
 0044938C    call        comctl32.ImageList_SetIconSize
 00449391    mov         eax,esi
 00449393    call        TCustomImageList.GetHandle
 00449398    push        eax
 00449399    call        comctl32.ImageList_GetBkColor
 0044939E    call        GetColor
 004493A3    mov         edx,eax
 004493A5    mov         eax,ebx
 004493A7    call        TCustomImageList.SetBkColor
 004493AC    mov         edx,esi
 004493AE    mov         eax,ebx
 004493B0    call        TCustomImageList.AddImages
 004493B5    pop         esi
 004493B6    pop         ebx
 004493B7    ret
 004493B8    mov         edx,ebx
 004493BA    mov         eax,esi
 004493BC    call        TPersistent.AssignTo
 004493C1    pop         esi
 004493C2    pop         ebx
 004493C3    ret
*}
end;

//004493C4
procedure TCustomImageList.CheckImage(Image:TGraphic);
begin
{*
 004493C4    push        ebp
 004493C5    mov         ebp,esp
 004493C7    push        0
 004493C9    push        ebx
 004493CA    push        esi
 004493CB    mov         esi,edx
 004493CD    mov         ebx,eax
 004493CF    xor         eax,eax
 004493D1    push        ebp
 004493D2    push        449430
 004493D7    push        dword ptr fs:[eax]
 004493DA    mov         dword ptr fs:[eax],esp
 004493DD    test        esi,esi
>004493DF    je          0044941A
 004493E1    mov         eax,esi
 004493E3    mov         edx,dword ptr [eax]
 004493E5    call        dword ptr [edx+20]
 004493E8    cmp         eax,dword ptr [ebx+30]
>004493EB    jl          004493F9
 004493ED    mov         eax,esi
 004493EF    mov         edx,dword ptr [eax]
 004493F1    call        dword ptr [edx+2C]
 004493F4    cmp         eax,dword ptr [ebx+34]
>004493F7    jge         0044941A
 004493F9    lea         edx,[ebp-4]
 004493FC    mov         eax,[005AE2B8];^SInvalidImageSize:TResStringRec
 00449401    call        LoadStr
 00449406    mov         ecx,dword ptr [ebp-4]
 00449409    mov         dl,1
 0044940B    mov         eax,[00417C8C];EInvalidOperation
 00449410    call        Exception.Create
 00449415    call        @RaiseExcept
 0044941A    xor         eax,eax
 0044941C    pop         edx
 0044941D    pop         ecx
 0044941E    pop         ecx
 0044941F    mov         dword ptr fs:[eax],edx
 00449422    push        449437
 00449427    lea         eax,[ebp-4]
 0044942A    call        @LStrClr
 0044942F    ret
>00449430    jmp         @HandleFinally
>00449435    jmp         00449427
 00449437    pop         esi
 00449438    pop         ebx
 00449439    pop         ecx
 0044943A    pop         ebp
 0044943B    ret
*}
end;

//0044943C
procedure TCustomImageList.SetDrawingStyle(Value:TDrawingStyle);
begin
{*
 0044943C    push        esi
 0044943D    mov         esi,eax
 0044943F    cmp         dl,byte ptr [esi+40]
>00449442    je          00449452
 00449444    mov         byte ptr [esi+40],dl
 00449447    mov         eax,esi
 00449449    mov         si,0FFEF
 0044944D    call        @CallDynaInst
 00449452    pop         esi
 00449453    ret
*}
end;

//00449454
function TCustomImageList.GetHotSpot:TPoint;
begin
{*
 00449454    push        ebx
 00449455    mov         ebx,edx
 00449457    mov         ecx,ebx
 00449459    xor         edx,edx
 0044945B    xor         eax,eax
 0044945D    call        Point
 00449462    pop         ebx
 00449463    ret
*}
end;

//00449464
procedure TCustomImageList.Change;
begin
{*
 00449464    push        ebx
 00449465    push        esi
 00449466    push        edi
 00449467    push        ebp
 00449468    mov         ebx,eax
 0044946A    mov         byte ptr [ebx+58],1
 0044946E    cmp         dword ptr [ebx+5C],0
>00449472    jg          004494AC
 00449474    mov         eax,dword ptr [ebx+4C]
 00449477    test        eax,eax
>00449479    je          0044949D
 0044947B    mov         edi,dword ptr [eax+8]
 0044947E    dec         edi
 0044947F    test        edi,edi
>00449481    jl          0044949D
 00449483    inc         edi
 00449484    xor         ebp,ebp
 00449486    mov         edx,ebp
 00449488    mov         eax,dword ptr [ebx+4C]
 0044948B    call        TList.Get
 00449490    mov         si,0FFFF
 00449494    call        @CallDynaInst
 00449499    inc         ebp
 0044949A    dec         edi
>0044949B    jne         00449486
 0044949D    cmp         word ptr [ebx+62],0
>004494A2    je          004494AC
 004494A4    mov         edx,ebx
 004494A6    mov         eax,dword ptr [ebx+64]
 004494A9    call        dword ptr [ebx+60]
 004494AC    pop         ebp
 004494AD    pop         edi
 004494AE    pop         esi
 004494AF    pop         ebx
 004494B0    ret
*}
end;

//004494B4
procedure TCustomImageList.UnRegisterChanges(Value:TChangeLink);
begin
{*
 004494B4    push        ebx
 004494B5    push        esi
 004494B6    push        edi
 004494B7    push        ebp
 004494B8    mov         ebp,edx
 004494BA    mov         ebx,eax
 004494BC    mov         eax,dword ptr [ebx+4C]
 004494BF    test        eax,eax
>004494C1    je          004494F1
 004494C3    mov         edi,dword ptr [eax+8]
 004494C6    dec         edi
 004494C7    test        edi,edi
>004494C9    jl          004494F1
 004494CB    inc         edi
 004494CC    xor         esi,esi
 004494CE    mov         edx,esi
 004494D0    mov         eax,dword ptr [ebx+4C]
 004494D3    call        TList.Get
 004494D8    cmp         ebp,eax
>004494DA    jne         004494ED
 004494DC    xor         eax,eax
 004494DE    mov         dword ptr [ebp+4],eax
 004494E1    mov         edx,esi
 004494E3    mov         eax,dword ptr [ebx+4C]
 004494E6    call        TList.Delete
>004494EB    jmp         004494F1
 004494ED    inc         esi
 004494EE    dec         edi
>004494EF    jne         004494CE
 004494F1    pop         ebp
 004494F2    pop         edi
 004494F3    pop         esi
 004494F4    pop         ebx
 004494F5    ret
*}
end;

//004494F8
procedure TCustomImageList.RegisterChanges(Value:TChangeLink);
begin
{*
 004494F8    mov         dword ptr [edx+4],eax
 004494FB    mov         ecx,dword ptr [eax+4C]
 004494FE    test        ecx,ecx
>00449500    je          00449509
 00449502    mov         eax,ecx
 00449504    call        TList.Add
 00449509    ret
*}
end;

//0044950C
function StreamsEqual(S1:TMemoryStream; S2:TMemoryStream):Boolean;
begin
{*
 0044950C    push        ebx
 0044950D    push        esi
 0044950E    mov         esi,edx
 00449510    mov         ebx,eax
 00449512    mov         eax,ebx
 00449514    mov         edx,dword ptr [eax]
 00449516    call        dword ptr [edx]
 00449518    push        edx
 00449519    push        eax
 0044951A    mov         eax,esi
 0044951C    mov         edx,dword ptr [eax]
 0044951E    call        dword ptr [edx]
 00449520    cmp         edx,dword ptr [esp+4]
>00449524    jne         00449529
 00449526    cmp         eax,dword ptr [esp]
 00449529    pop         edx
 0044952A    pop         eax
>0044952B    jne         00449544
 0044952D    mov         eax,ebx
 0044952F    mov         edx,dword ptr [eax]
 00449531    call        dword ptr [edx]
 00449533    mov         ecx,eax
 00449535    mov         edx,dword ptr [esi+4]
 00449538    mov         eax,dword ptr [ebx+4]
 0044953B    call        CompareMem
 00449540    test        al,al
>00449542    jne         00449549
 00449544    xor         eax,eax
 00449546    pop         esi
 00449547    pop         ebx
 00449548    ret
 00449549    mov         al,1
 0044954B    pop         esi
 0044954C    pop         ebx
 0044954D    ret
*}
end;

//00449550
function TCustomImageList.Equal(IL:TCustomImageList):Boolean;
begin
{*
 00449550    push        ebp
 00449551    mov         ebp,esp
 00449553    add         esp,0FFFFFFF4
 00449556    push        ebx
 00449557    push        esi
 00449558    push        edi
 00449559    mov         edi,edx
 0044955B    mov         esi,eax
 0044955D    test        edi,edi
>0044955F    je          00449575
 00449561    mov         eax,esi
 00449563    call        TCustomImageList.GetCount
 00449568    mov         ebx,eax
 0044956A    mov         eax,edi
 0044956C    call        TCustomImageList.GetCount
 00449571    cmp         ebx,eax
>00449573    je          0044957E
 00449575    mov         byte ptr [ebp-1],0
>00449579    jmp         00449633
 0044957E    mov         eax,esi
 00449580    call        TCustomImageList.GetCount
 00449585    test        eax,eax
>00449587    jne         0044959D
 00449589    mov         eax,edi
 0044958B    call        TCustomImageList.GetCount
 00449590    test        eax,eax
>00449592    jne         0044959D
 00449594    mov         byte ptr [ebp-1],1
>00449598    jmp         00449633
 0044959D    mov         dl,1
 0044959F    mov         eax,[00418640];TMemoryStream
 004495A4    call        TObject.Create
 004495A9    mov         dword ptr [ebp-8],eax
 004495AC    xor         eax,eax
 004495AE    push        ebp
 004495AF    push        44962C
 004495B4    push        dword ptr fs:[eax]
 004495B7    mov         dword ptr fs:[eax],esp
 004495BA    mov         edx,dword ptr [ebp-8]
 004495BD    mov         eax,esi
 004495BF    mov         ecx,dword ptr [eax]
 004495C1    call        dword ptr [ecx+3C]
 004495C4    mov         dl,1
 004495C6    mov         eax,[00418640];TMemoryStream
 004495CB    call        TObject.Create
 004495D0    mov         dword ptr [ebp-0C],eax
 004495D3    xor         eax,eax
 004495D5    push        ebp
 004495D6    push        44960F
 004495DB    push        dword ptr fs:[eax]
 004495DE    mov         dword ptr fs:[eax],esp
 004495E1    mov         edx,dword ptr [ebp-0C]
 004495E4    mov         eax,edi
 004495E6    mov         ecx,dword ptr [eax]
 004495E8    call        dword ptr [ecx+3C]
 004495EB    mov         edx,dword ptr [ebp-0C]
 004495EE    mov         eax,dword ptr [ebp-8]
 004495F1    call        StreamsEqual
 004495F6    mov         byte ptr [ebp-1],al
 004495F9    xor         eax,eax
 004495FB    pop         edx
 004495FC    pop         ecx
 004495FD    pop         ecx
 004495FE    mov         dword ptr fs:[eax],edx
 00449601    push        449616
 00449606    mov         eax,dword ptr [ebp-0C]
 00449609    call        TObject.Free
 0044960E    ret
>0044960F    jmp         @HandleFinally
>00449614    jmp         00449606
 00449616    xor         eax,eax
 00449618    pop         edx
 00449619    pop         ecx
 0044961A    pop         ecx
 0044961B    mov         dword ptr fs:[eax],edx
 0044961E    push        449633
 00449623    mov         eax,dword ptr [ebp-8]
 00449626    call        TObject.Free
 0044962B    ret
>0044962C    jmp         @HandleFinally
>00449631    jmp         00449623
 00449633    mov         al,byte ptr [ebp-1]
 00449636    pop         edi
 00449637    pop         esi
 00449638    pop         ebx
 00449639    mov         esp,ebp
 0044963B    pop         ebp
 0044963C    ret
*}
end;

//00449640
function DoWrite:Boolean;
begin
{*
 00449640    push        ebp
 00449641    mov         ebp,esp
 00449643    push        ebx
 00449644    mov         eax,dword ptr [ebp+8]
 00449647    mov         eax,dword ptr [eax-4]
 0044964A    cmp         dword ptr [eax+20],0
>0044964E    je          00449687
 00449650    mov         eax,dword ptr [ebp+8]
 00449653    mov         eax,dword ptr [eax-4]
 00449656    mov         ebx,dword ptr [eax+20]
 00449659    mov         eax,ebx
 0044965B    mov         edx,dword ptr ds:[448760];TCustomImageList
 00449661    call        @IsClass
 00449666    test        al,al
>00449668    je          00449682
 0044966A    mov         eax,dword ptr [ebp+8]
 0044966D    mov         edx,ebx
 0044966F    mov         eax,dword ptr [ebp+8]
 00449672    mov         eax,dword ptr [eax-8]
 00449675    call        TCustomImageList.Equal
 0044967A    test        al,al
>0044967C    je          00449682
 0044967E    xor         eax,eax
>00449680    jmp         00449697
 00449682    mov         al,1
 00449684    pop         ebx
 00449685    pop         ebp
 00449686    ret
 00449687    mov         eax,dword ptr [ebp+8]
 0044968A    mov         eax,dword ptr [eax-8]
 0044968D    call        TCustomImageList.GetCount
 00449692    test        eax,eax
 00449694    setg        al
 00449697    pop         ebx
 00449698    pop         ebp
 00449699    ret
*}
end;

//0044969C
procedure TCustomImageList.DefineProperties(Filer:TFiler);
begin
{*
 0044969C    push        ebp
 0044969D    mov         ebp,esp
 0044969F    add         esp,0FFFFFFF8
 004496A2    push        ebx
 004496A3    mov         dword ptr [ebp-4],edx
 004496A6    mov         dword ptr [ebp-8],eax
 004496A9    mov         edx,dword ptr [ebp-4]
 004496AC    mov         eax,dword ptr [ebp-8]
 004496AF    call        TComponent.DefineProperties
 004496B4    mov         eax,dword ptr [ebp-8]
 004496B7    push        eax
 004496B8    mov         eax,dword ptr [eax]
 004496BA    mov         eax,dword ptr [eax+38]
 004496BD    push        eax
 004496BE    mov         eax,dword ptr [ebp-8]
 004496C1    push        eax
 004496C2    mov         eax,dword ptr [eax]
 004496C4    mov         eax,dword ptr [eax+3C]
 004496C7    push        eax
 004496C8    push        ebp
 004496C9    call        DoWrite
 004496CE    pop         ecx
 004496CF    mov         ecx,eax
 004496D1    mov         edx,4496EC;'Bitmap'
 004496D6    mov         eax,dword ptr [ebp-4]
 004496D9    mov         ebx,dword ptr [eax]
 004496DB    call        dword ptr [ebx+8]
 004496DE    pop         ebx
 004496DF    pop         ecx
 004496E0    pop         ecx
 004496E1    pop         ebp
 004496E2    ret
*}
end;

//004496F4
procedure TCustomImageList.ReadD2Stream(Stream:TStream);
begin
{*
 004496F4    push        ebp
 004496F5    mov         ebp,esp
 004496F7    add         esp,0FFFFFFC0
 004496FA    push        ebx
 004496FB    push        esi
 004496FC    push        edi
 004496FD    mov         ebx,edx
 004496FF    mov         dword ptr [ebp-4],eax
 00449702    lea         edx,[ebp-18]
 00449705    mov         ecx,4
 0044970A    mov         eax,ebx
 0044970C    call        TStream.ReadBuffer
 00449711    lea         edx,[ebp-1C]
 00449714    mov         ecx,4
 00449719    mov         eax,ebx
 0044971B    call        TStream.ReadBuffer
 00449720    mov         dl,1
 00449722    mov         eax,[00424EB8];TBitmap
 00449727    call        TBitmap.Create
 0044972C    mov         dword ptr [ebp-8],eax
 0044972F    xor         eax,eax
 00449731    push        ebp
 00449732    push        449978
 00449737    push        dword ptr fs:[eax]
 0044973A    mov         dword ptr fs:[eax],esp
 0044973D    mov         eax,ebx
 0044973F    call        TStream.GetPosition
 00449744    mov         esi,eax
 00449746    mov         edx,ebx
 00449748    mov         eax,dword ptr [ebp-8]
 0044974B    mov         ecx,dword ptr [eax]
 0044974D    call        dword ptr [ecx+54]
 00449750    mov         eax,dword ptr [ebp-18]
 00449753    add         eax,esi
 00449755    cdq
 00449756    push        edx
 00449757    push        eax
 00449758    mov         eax,ebx
 0044975A    call        TStream.SetPosition
 0044975F    mov         dl,1
 00449761    mov         eax,[00424EB8];TBitmap
 00449766    call        TBitmap.Create
 0044976B    mov         dword ptr [ebp-10],eax
 0044976E    xor         eax,eax
 00449770    push        ebp
 00449771    push        44995B
 00449776    push        dword ptr fs:[eax]
 00449779    mov         dword ptr fs:[eax],esp
 0044977C    mov         edx,ebx
 0044977E    mov         eax,dword ptr [ebp-10]
 00449781    mov         ecx,dword ptr [eax]
 00449783    call        dword ptr [ecx+54]
 00449786    mov         dl,1
 00449788    mov         eax,[00424EB8];TBitmap
 0044978D    call        TBitmap.Create
 00449792    mov         dword ptr [ebp-0C],eax
 00449795    mov         eax,dword ptr [ebp-4]
 00449798    mov         edx,dword ptr [eax+34]
 0044979B    mov         eax,dword ptr [ebp-0C]
 0044979E    mov         ecx,dword ptr [eax]
 004497A0    call        dword ptr [ecx+40]
 004497A3    mov         eax,dword ptr [ebp-4]
 004497A6    mov         edx,dword ptr [eax+30]
 004497A9    mov         eax,dword ptr [ebp-0C]
 004497AC    mov         ecx,dword ptr [eax]
 004497AE    call        dword ptr [ecx+34]
 004497B1    mov         dl,1
 004497B3    mov         eax,[00424EB8];TBitmap
 004497B8    call        TBitmap.Create
 004497BD    mov         dword ptr [ebp-14],eax
 004497C0    mov         dl,1
 004497C2    mov         eax,dword ptr [ebp-14]
 004497C5    call        TBitmap.SetMonochrome
 004497CA    mov         eax,dword ptr [ebp-4]
 004497CD    mov         edx,dword ptr [eax+34]
 004497D0    mov         eax,dword ptr [ebp-14]
 004497D3    mov         ecx,dword ptr [eax]
 004497D5    call        dword ptr [ecx+40]
 004497D8    mov         eax,dword ptr [ebp-4]
 004497DB    mov         edx,dword ptr [eax+30]
 004497DE    mov         eax,dword ptr [ebp-14]
 004497E1    mov         ecx,dword ptr [eax]
 004497E3    call        dword ptr [ecx+34]
 004497E6    mov         eax,dword ptr [ebp-4]
 004497E9    mov         eax,dword ptr [eax+30]
 004497EC    push        eax
 004497ED    lea         eax,[ebp-30]
 004497F0    push        eax
 004497F1    mov         eax,dword ptr [ebp-4]
 004497F4    mov         ecx,dword ptr [eax+34]
 004497F7    xor         edx,edx
 004497F9    xor         eax,eax
 004497FB    call        Bounds
 00449800    mov         eax,dword ptr [ebp-4]
 00449803    call        TCustomImageList.BeginUpdate
 00449808    xor         eax,eax
 0044980A    push        ebp
 0044980B    push        44993E
 00449810    push        dword ptr fs:[eax]
 00449813    mov         dword ptr fs:[eax],esp
 00449816    mov         eax,dword ptr [ebp-8]
 00449819    mov         edx,dword ptr [eax]
 0044981B    call        dword ptr [edx+20]
 0044981E    mov         edx,dword ptr [ebp-4]
 00449821    mov         ecx,dword ptr [edx+30]
 00449824    cdq
 00449825    idiv        eax,ecx
 00449827    dec         eax
 00449828    test        eax,eax
>0044982A    jl          00449918
 00449830    inc         eax
 00449831    mov         dword ptr [ebp-20],eax
 00449834    xor         edi,edi
 00449836    cmp         dword ptr [ebp-1C],0
>0044983A    je          00449918
 00449840    mov         eax,dword ptr [ebp-8]
 00449843    mov         edx,dword ptr [eax]
 00449845    call        dword ptr [edx+2C]
 00449848    mov         edx,dword ptr [ebp-4]
 0044984B    mov         ecx,dword ptr [edx+34]
 0044984E    cdq
 0044984F    idiv        eax,ecx
 00449851    mov         esi,eax
 00449853    dec         esi
 00449854    test        esi,esi
>00449856    jl          0044990E
 0044985C    inc         esi
 0044985D    xor         ebx,ebx
 0044985F    cmp         dword ptr [ebp-1C],0
>00449863    je          0044990E
 00449869    mov         eax,dword ptr [ebp-4]
 0044986C    mov         eax,dword ptr [eax+30]
 0044986F    push        eax
 00449870    lea         eax,[ebp-40]
 00449873    push        eax
 00449874    mov         eax,dword ptr [ebp-4]
 00449877    mov         ecx,dword ptr [eax+34]
 0044987A    mov         eax,dword ptr [ebp-4]
 0044987D    mov         edx,dword ptr [eax+30]
 00449880    imul        edx,edi
 00449883    mov         eax,dword ptr [ebp-4]
 00449886    mov         eax,dword ptr [eax+34]
 00449889    imul        eax,ebx
 0044988C    call        Rect
 00449891    lea         eax,[ebp-40]
 00449894    push        eax
 00449895    mov         eax,dword ptr [ebp-8]
 00449898    call        TBitmap.GetCanvas
 0044989D    push        eax
 0044989E    mov         eax,dword ptr [ebp-0C]
 004498A1    call        TBitmap.GetCanvas
 004498A6    lea         edx,[ebp-30]
 004498A9    pop         ecx
 004498AA    call        TCanvas.CopyRect
 004498AF    mov         eax,dword ptr [ebp-4]
 004498B2    mov         eax,dword ptr [eax+30]
 004498B5    push        eax
 004498B6    lea         eax,[ebp-40]
 004498B9    push        eax
 004498BA    mov         eax,dword ptr [ebp-4]
 004498BD    mov         ecx,dword ptr [eax+34]
 004498C0    mov         eax,dword ptr [ebp-4]
 004498C3    mov         edx,dword ptr [eax+30]
 004498C6    imul        edx,edi
 004498C9    mov         eax,dword ptr [ebp-4]
 004498CC    mov         eax,dword ptr [eax+34]
 004498CF    imul        eax,ebx
 004498D2    call        Rect
 004498D7    lea         eax,[ebp-40]
 004498DA    push        eax
 004498DB    mov         eax,dword ptr [ebp-10]
 004498DE    call        TBitmap.GetCanvas
 004498E3    push        eax
 004498E4    mov         eax,dword ptr [ebp-14]
 004498E7    call        TBitmap.GetCanvas
 004498EC    lea         edx,[ebp-30]
 004498EF    pop         ecx
 004498F0    call        TCanvas.CopyRect
 004498F5    mov         ecx,dword ptr [ebp-14]
 004498F8    mov         edx,dword ptr [ebp-0C]
 004498FB    mov         eax,dword ptr [ebp-4]
 004498FE    call        TCustomImageList.Add
 00449903    dec         dword ptr [ebp-1C]
 00449906    inc         ebx
 00449907    dec         esi
>00449908    jne         0044985F
 0044990E    inc         edi
 0044990F    dec         dword ptr [ebp-20]
>00449912    jne         00449836
 00449918    xor         eax,eax
 0044991A    pop         edx
 0044991B    pop         ecx
 0044991C    pop         ecx
 0044991D    mov         dword ptr fs:[eax],edx
 00449920    push        449945
 00449925    mov         eax,dword ptr [ebp-0C]
 00449928    call        TObject.Free
 0044992D    mov         eax,dword ptr [ebp-14]
 00449930    call        TObject.Free
 00449935    mov         eax,dword ptr [ebp-4]
 00449938    call        TCustomImageList.EndUpdate
 0044993D    ret
>0044993E    jmp         @HandleFinally
>00449943    jmp         00449925
 00449945    xor         eax,eax
 00449947    pop         edx
 00449948    pop         ecx
 00449949    pop         ecx
 0044994A    mov         dword ptr fs:[eax],edx
 0044994D    push        449962
 00449952    mov         eax,dword ptr [ebp-10]
 00449955    call        TObject.Free
 0044995A    ret
>0044995B    jmp         @HandleFinally
>00449960    jmp         00449952
 00449962    xor         eax,eax
 00449964    pop         edx
 00449965    pop         ecx
 00449966    pop         ecx
 00449967    mov         dword ptr fs:[eax],edx
 0044996A    push        44997F
 0044996F    mov         eax,dword ptr [ebp-8]
 00449972    call        TObject.Free
 00449977    ret
>00449978    jmp         @HandleFinally
>0044997D    jmp         0044996F
 0044997F    pop         edi
 00449980    pop         esi
 00449981    pop         ebx
 00449982    mov         esp,ebp
 00449984    pop         ebp
 00449985    ret
*}
end;

//00449988
procedure TCustomImageList.ReadD3Stream(Stream:TStream);
begin
{*
 00449988    push        ebp
 00449989    mov         ebp,esp
 0044998B    add         esp,0FFFFFFEC
 0044998E    push        ebx
 0044998F    push        esi
 00449990    mov         dword ptr [ebp-8],edx
 00449993    mov         dword ptr [ebp-4],eax
 00449996    push        0
 00449998    mov         ecx,dword ptr [ebp-8]
 0044999B    mov         dl,1
 0044999D    mov         eax,[004188D0];TStreamAdapter
 004499A2    call        TStreamAdapter.Create
 004499A7    mov         dword ptr [ebp-0C],eax
 004499AA    xor         eax,eax
 004499AC    push        ebp
 004499AD    push        4499E8
 004499B2    push        dword ptr fs:[eax]
 004499B5    mov         dword ptr fs:[eax],esp
 004499B8    mov         eax,dword ptr [ebp-0C]
 004499BB    test        eax,eax
>004499BD    je          004499C2
 004499BF    sub         eax,0FFFFFFEC
 004499C2    push        eax
 004499C3    call        comctl32.ImageList_Read
 004499C8    mov         edx,eax
 004499CA    mov         eax,dword ptr [ebp-4]
 004499CD    call        TCustomImageList.SetHandle
 004499D2    xor         eax,eax
 004499D4    pop         edx
 004499D5    pop         ecx
 004499D6    pop         ecx
 004499D7    mov         dword ptr fs:[eax],edx
 004499DA    push        4499EF
 004499DF    mov         eax,dword ptr [ebp-0C]
 004499E2    call        TObject.Free
 004499E7    ret
>004499E8    jmp         @HandleFinally
>004499ED    jmp         004499DF
 004499EF    mov         eax,dword ptr [ebp-4]
 004499F2    call        TCustomImageList.HandleAllocated
 004499F7    test        al,al
>004499F9    jne         00449B48
 004499FF    xor         ebx,ebx
 00449A01    mov         dl,1
 00449A03    mov         eax,[00418640];TMemoryStream
 00449A08    call        TObject.Create
 00449A0D    mov         dword ptr [ebp-10],eax
 00449A10    xor         eax,eax
 00449A12    push        ebp
 00449A13    push        449B1E
 00449A18    push        dword ptr fs:[eax]
 00449A1B    mov         dword ptr fs:[eax],esp
 00449A1E    push        0
 00449A20    push        0
 00449A22    mov         eax,dword ptr [ebp-8]
 00449A25    call        TStream.SetPosition
 00449A2A    mov         edx,dword ptr [ebp-8]
 00449A2D    mov         eax,dword ptr [ebp-10]
 00449A30    call        TMemoryStream.LoadFromStream
 00449A35    push        0
 00449A37    push        12
 00449A39    mov         eax,dword ptr [ebp-10]
 00449A3C    call        TStream.SetPosition
 00449A41    lea         edx,[ebp-11]
 00449A44    mov         ecx,1
 00449A49    mov         eax,dword ptr [ebp-10]
 00449A4C    mov         esi,dword ptr [eax]
 00449A4E    call        dword ptr [esi+0C]
 00449A51    dec         eax
>00449A52    jne         00449A9F
 00449A54    cmp         byte ptr [ebp-11],1
>00449A58    jne         00449A9F
 00449A5A    push        0
 00449A5C    push        38
 00449A5E    mov         eax,dword ptr [ebp-10]
 00449A61    call        TStream.SetPosition
 00449A66    lea         edx,[ebp-12]
 00449A69    mov         ecx,1
 00449A6E    mov         eax,dword ptr [ebp-10]
 00449A71    mov         esi,dword ptr [eax]
 00449A73    call        dword ptr [esi+0C]
 00449A76    dec         eax
>00449A77    jne         00449A9F
 00449A79    mov         al,byte ptr [ebp-12]
 00449A7C    or          byte ptr [ebp-11],al
 00449A7F    push        0
 00449A81    push        12
 00449A83    mov         eax,dword ptr [ebp-10]
 00449A86    call        TStream.SetPosition
 00449A8B    lea         edx,[ebp-11]
 00449A8E    mov         ecx,1
 00449A93    mov         eax,dword ptr [ebp-10]
 00449A96    mov         ebx,dword ptr [eax]
 00449A98    call        dword ptr [ebx+10]
 00449A9B    dec         eax
 00449A9C    sete        bl
 00449A9F    test        bl,bl
>00449AA1    je          00449B08
 00449AA3    push        0
 00449AA5    push        0
 00449AA7    mov         eax,dword ptr [ebp-10]
 00449AAA    call        TStream.SetPosition
 00449AAF    push        0
 00449AB1    mov         ecx,dword ptr [ebp-10]
 00449AB4    mov         dl,1
 00449AB6    mov         eax,[004188D0];TStreamAdapter
 00449ABB    call        TStreamAdapter.Create
 00449AC0    mov         dword ptr [ebp-0C],eax
 00449AC3    xor         eax,eax
 00449AC5    push        ebp
 00449AC6    push        449B01
 00449ACB    push        dword ptr fs:[eax]
 00449ACE    mov         dword ptr fs:[eax],esp
 00449AD1    mov         eax,dword ptr [ebp-0C]
 00449AD4    test        eax,eax
>00449AD6    je          00449ADB
 00449AD8    sub         eax,0FFFFFFEC
 00449ADB    push        eax
 00449ADC    call        comctl32.ImageList_Read
 00449AE1    mov         edx,eax
 00449AE3    mov         eax,dword ptr [ebp-4]
 00449AE6    call        TCustomImageList.SetHandle
 00449AEB    xor         eax,eax
 00449AED    pop         edx
 00449AEE    pop         ecx
 00449AEF    pop         ecx
 00449AF0    mov         dword ptr fs:[eax],edx
 00449AF3    push        449B08
 00449AF8    mov         eax,dword ptr [ebp-0C]
 00449AFB    call        TObject.Free
 00449B00    ret
>00449B01    jmp         @HandleFinally
>00449B06    jmp         00449AF8
 00449B08    xor         eax,eax
 00449B0A    pop         edx
 00449B0B    pop         ecx
 00449B0C    pop         ecx
 00449B0D    mov         dword ptr fs:[eax],edx
 00449B10    push        449B25
 00449B15    mov         eax,dword ptr [ebp-10]
 00449B18    call        TObject.Free
 00449B1D    ret
>00449B1E    jmp         @HandleFinally
>00449B23    jmp         00449B15
 00449B25    mov         eax,dword ptr [ebp-4]
 00449B28    call        TCustomImageList.HandleAllocated
 00449B2D    test        al,al
>00449B2F    jne         00449B48
 00449B31    mov         ecx,dword ptr ds:[5AE614];^SImageReadFail:TResStringRec
 00449B37    mov         dl,1
 00449B39    mov         eax,[0041795C];EReadError
 00449B3E    call        Exception.CreateRes
 00449B43    call        @RaiseExcept
 00449B48    pop         esi
 00449B49    pop         ebx
 00449B4A    mov         esp,ebp
 00449B4C    pop         ebp
 00449B4D    ret
*}
end;

//00449B50
procedure TCustomImageList.ReadData(Stream:TStream);
begin
{*
 00449B50    push        ebx
 00449B51    push        esi
 00449B52    push        edi
 00449B53    add         esp,0FFFFFFF0
 00449B56    mov         edi,edx
 00449B58    mov         esi,eax
 00449B5A    mov         eax,esi
 00449B5C    call        TCustomImageList.FreeHandle
 00449B61    mov         eax,edi
 00449B63    call        TStream.GetPosition
 00449B68    mov         dword ptr [esp+0C],eax
 00449B6C    mov         edx,esp
 00449B6E    mov         ecx,4
 00449B73    mov         eax,edi
 00449B75    mov         ebx,dword ptr [eax]
 00449B77    call        dword ptr [ebx+0C]
 00449B7A    lea         edx,[esp+4]
 00449B7E    mov         ecx,4
 00449B83    mov         eax,edi
 00449B85    mov         ebx,dword ptr [eax]
 00449B87    call        dword ptr [ebx+0C]
 00449B8A    mov         bl,byte ptr [esp]
 00449B8D    and         bl,0FF
 00449B90    mov         ax,word ptr [esp]
 00449B94    shr         ax,8
 00449B98    mov         byte ptr [esp+8],al
 00449B9C    mov         eax,dword ptr [esp+0C]
 00449BA0    cdq
 00449BA1    push        edx
 00449BA2    push        eax
 00449BA3    mov         eax,edi
 00449BA5    call        TStream.SetPosition
 00449BAA    mov         eax,dword ptr [esp]
 00449BAD    cmp         eax,dword ptr [esp+4]
>00449BB1    je          00449BCA
 00449BB3    cmp         bl,49
>00449BB6    jne         00449BCA
 00449BB8    cmp         byte ptr [esp+8],4C
>00449BBD    jne         00449BCA
 00449BBF    mov         edx,edi
 00449BC1    mov         eax,esi
 00449BC3    call        TCustomImageList.ReadD3Stream
>00449BC8    jmp         00449BD3
 00449BCA    mov         edx,edi
 00449BCC    mov         eax,esi
 00449BCE    call        TCustomImageList.ReadD2Stream
 00449BD3    add         esp,10
 00449BD6    pop         edi
 00449BD7    pop         esi
 00449BD8    pop         ebx
 00449BD9    ret
*}
end;

//00449BDC
procedure TCustomImageList.WriteData(Stream:TStream);
begin
{*
 00449BDC    push        ebp
 00449BDD    mov         ebp,esp
 00449BDF    push        ecx
 00449BE0    push        ebx
 00449BE1    push        esi
 00449BE2    push        edi
 00449BE3    mov         esi,edx
 00449BE5    mov         ebx,eax
 00449BE7    cmp         dword ptr ds:[5E0C94],0;CachedComCtrlVer:Cardinal
>00449BEE    jne         00449C2B
 00449BF0    mov         eax,449CEC;'comctl32.dll'
 00449BF5    call        GetFileVersion
 00449BFA    mov         [005E0C94],eax;CachedComCtrlVer:Cardinal
 00449BFF    cmp         dword ptr ds:[5E0C94],60000;CachedComCtrlVer:Cardinal
>00449C09    jb          00449C2B
 00449C0B    push        449CFC
 00449C10    call        KERNEL32.GetModuleHandleA
 00449C15    mov         edi,eax
 00449C17    test        edi,edi
>00449C19    je          00449C2B
 00449C1B    push        449D0C
 00449C20    push        edi
 00449C21    call        KERNEL32.GetProcAddress
 00449C26    mov         [005E0C98],eax;ImageListWriteExProc:function(val ImageList:CommCtrl.HIMAGELIST;val Flags...
 00449C2B    push        0
 00449C2D    mov         ecx,esi
 00449C2F    mov         dl,1
 00449C31    mov         eax,[004188D0];TStreamAdapter
 00449C36    call        TStreamAdapter.Create
 00449C3B    mov         dword ptr [ebp-4],eax
 00449C3E    xor         eax,eax
 00449C40    push        ebp
 00449C41    push        449CD6
 00449C46    push        dword ptr fs:[eax]
 00449C49    mov         dword ptr fs:[eax],esp
 00449C4C    cmp         dword ptr ds:[5E0C98],0;ImageListWriteExProc:function(val ImageList:CommCtrl.HIMAGELIST;...
>00449C53    je          00449C8D
 00449C55    mov         eax,dword ptr [ebp-4]
 00449C58    test        eax,eax
>00449C5A    je          00449C5F
 00449C5C    sub         eax,0FFFFFFEC
 00449C5F    push        eax
 00449C60    push        1
 00449C62    mov         eax,ebx
 00449C64    call        TCustomImageList.GetHandle
 00449C69    push        eax
 00449C6A    call        dword ptr ds:[5E0C98]
 00449C70    test        eax,eax
>00449C72    je          00449CC0
 00449C74    mov         ecx,dword ptr ds:[5AE388];^SImageWriteFail:TResStringRec
 00449C7A    mov         dl,1
 00449C7C    mov         eax,[004179B4];EWriteError
 00449C81    call        Exception.CreateRes
 00449C86    call        @RaiseExcept
>00449C8B    jmp         00449CC0
 00449C8D    mov         eax,dword ptr [ebp-4]
 00449C90    test        eax,eax
>00449C92    je          00449C97
 00449C94    sub         eax,0FFFFFFEC
 00449C97    push        eax
 00449C98    mov         eax,ebx
 00449C9A    call        TCustomImageList.GetHandle
 00449C9F    push        eax
 00449CA0    call        comctl32.ImageList_Write
 00449CA5    test        eax,eax
>00449CA7    jne         00449CC0
 00449CA9    mov         ecx,dword ptr ds:[5AE388];^SImageWriteFail:TResStringRec
 00449CAF    mov         dl,1
 00449CB1    mov         eax,[004179B4];EWriteError
 00449CB6    call        Exception.CreateRes
 00449CBB    call        @RaiseExcept
 00449CC0    xor         eax,eax
 00449CC2    pop         edx
 00449CC3    pop         ecx
 00449CC4    pop         ecx
 00449CC5    mov         dword ptr fs:[eax],edx
 00449CC8    push        449CDD
 00449CCD    mov         eax,dword ptr [ebp-4]
 00449CD0    call        TObject.Free
 00449CD5    ret
>00449CD6    jmp         @HandleFinally
>00449CDB    jmp         00449CCD
 00449CDD    pop         edi
 00449CDE    pop         esi
 00449CDF    pop         ebx
 00449CE0    pop         ecx
 00449CE1    pop         ebp
 00449CE2    ret
*}
end;

//00449D20
procedure TCustomImageList.BeginUpdate;
begin
{*
 00449D20    inc         dword ptr [eax+5C]
 00449D23    ret
*}
end;

//00449D24
procedure TCustomImageList.EndUpdate;
begin
{*
 00449D24    push        esi
 00449D25    cmp         dword ptr [eax+5C],0
>00449D29    jle         00449D2E
 00449D2B    dec         dword ptr [eax+5C]
 00449D2E    cmp         byte ptr [eax+58],0
>00449D32    je          00449D41
 00449D34    mov         byte ptr [eax+58],0
 00449D38    mov         si,0FFEF
 00449D3C    call        @CallDynaInst
 00449D41    pop         esi
 00449D42    ret
*}
end;

//00449D44
destructor TChangeLink.Destroy;
begin
{*
 00449D44    push        ebx
 00449D45    push        esi
 00449D46    call        @BeforeDestruction
 00449D4B    mov         ebx,edx
 00449D4D    mov         esi,eax
 00449D4F    mov         eax,dword ptr [esi+4]
 00449D52    test        eax,eax
>00449D54    je          00449D5D
 00449D56    mov         edx,esi
 00449D58    call        TCustomImageList.UnRegisterChanges
 00449D5D    mov         edx,ebx
 00449D5F    and         dl,0FC
 00449D62    mov         eax,esi
 00449D64    call        TObject.Destroy
 00449D69    test        bl,bl
>00449D6B    jle         00449D74
 00449D6D    mov         eax,esi
 00449D6F    call        @ClassDestroy
 00449D74    pop         esi
 00449D75    pop         ebx
 00449D76    ret
*}
end;

//00449D78
procedure TChangeLink.Change;
begin
{*
 00449D78    push        ebx
 00449D79    cmp         word ptr [eax+0A],0
>00449D7E    je          00449D8B
 00449D80    mov         ebx,eax
 00449D82    mov         edx,dword ptr [eax+4]
 00449D85    mov         eax,dword ptr [ebx+0C]
 00449D88    call        dword ptr [ebx+8]
 00449D8B    pop         ebx
 00449D8C    ret
*}
end;

end.