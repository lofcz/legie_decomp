//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Graphics;

interface

uses
  SysUtils, Classes, Graphics, GLTexture;

type
  EInvalidGraphic = class(Exception)
  end;
  EInvalidGraphicOperation = class(Exception)
  end;
  TFontPitch = (fpDefault, fpVariable, fpFixed);
  TFontStyle = (fsBold, fsItalic, fsUnderline, fsStrikeOut);
  TFontStyles = set of TFontStyle;
  TPenStyle = (psSolid, psDash, psDot, psDashDot, psDashDotDot, psClear, psInsideFrame);
  TPenMode = (pmBlack, pmWhite, pmNop, pmNot, pmCopy, pmNotCopy, pmMergePenNot, pmMaskPenNot, pmMergeNotPen, pmMaskNotPen, pmMerge, pmNotMerge, pmMask, pmNotMask, pmXor, pmNotXor);
  TBrushStyle = (bsSolid, bsClear, bsHorizontal, bsVertical, bsFDiagonal, bsBDiagonal, bsCross, bsDiagCross);
  TGraphicsObject = class(TPersistent)
  public
    FOnChange:TNotifyEvent;//f8
    FResource:PResource;//f10
    FOwnerLock:PRTLCriticalSection;//f14
    procedure Changed; dynamic;//004259D4
    procedure Lock;//004259E8
    procedure Unlock;//004259F8
  end;
  TFont = class(TGraphicsObject)
  public
    Color:TColor;//f18
    FPixelsPerInch:Integer;//f1C
    FNotify:IChangeNotifier;//f20
    destructor Destroy; virtual;//00425CE4
    procedure Assign(Source:TPersistent); virtual;//v8//00425D28
    procedure Changed; dynamic;//00425D0C
    constructor Create;//00425C90
    procedure GetData(var FontData:TFontData);//00425DFC
    procedure SetData(const FontData:TFontData);//00425E14
    procedure SetColor(Value:TColor);//00425E64
    function GetHandle:HFONT;//00425E78
    procedure SetHandle(Value:HFONT);//00426020
    function GetHeight:Integer;//00426044
    procedure SetHeight(Value:Integer);//0042604C
    function GetName:TFontName;//00426074
    procedure SetName(const Value:TFontName);//0042608C
    function GetSize:Integer;//004260E8
    procedure SetSize(Value:Integer);//00426104
    function GetStyle:TFontStyles;//00426124
    procedure SetStyle(Value:TFontStyles);//00426130
    function GetPitch:TFontPitch;//0042615C
    procedure SetPitch(Value:TFontPitch);//00426164
    //function GetCharset:?;//0042618C
    procedure SetCharset(Value:TFontCharset);//00426194
  end;
  TPen = class(TGraphicsObject)
  public
    Mode:TPenMode;//f18
    destructor Destroy; virtual;//00426200
    procedure Assign(Source:TPersistent); virtual;//v8//00426228
    constructor Create;//004261BC
    procedure GetData(var PenData:TPenData);//004262E0
    procedure SetData(const PenData:TPenData);//004262F8
    //function GetColor:?;//00426348
    procedure SetColor(Value:TColor);//00426350
    function GetHandle:HPEN;//00426378
    procedure SetMode(Value:TPenMode);//00426410
    //function GetStyle:?;//00426424
    procedure SetStyle(Value:TPenStyle);//0042642C
    //function GetWidth:?;//00426454
    procedure SetWidth(Value:Integer);//0042645C
  end;
  TBrush = class(TGraphicsObject)
  public
    destructor Destroy; virtual;//004264C8
    procedure Assign(Source:TPersistent); virtual;//v8//004264F0
    constructor Create;//00426488
    procedure GetData(var BrushData:TBrushData);//00426598
    procedure SetData(const BrushData:TBrushData);//004265B4
    procedure SetBitmap(Value:TBitmap);//00426604
    function GetColor:TColor;//00426628
    procedure SetColor(Value:TColor);//00426630
    function GetHandle:HBRUSH;//00426664
    function GetStyle:TBrushStyle;//00426744
    procedure SetStyle(Value:TBrushStyle);//0042674C
  end;
  TCanvas = class(TPersistent)
  public
    FHandle:HDC;//f4
    State:TCanvasState;//f8
    Font:TFont;//fC
    Pen:TPen;//f10
    Brush:TBrush;//f14
    FPenPos:TPoint;//f18
    CopyMode:Integer;//f20
    FOnChange:TNotifyEvent;//f28
    FOnChanging:TNotifyEvent;//f30
    FLock:TRTLCriticalSection;//f38
    FLockCount:Integer;//f50
    FTextFlags:Longint;//f54
    destructor Destroy; virtual;//00426844
    procedure Changed; virtual;//vC//00426E60
    procedure Changing; virtual;//v10//00426E4C
    procedure CreateHandle; virtual;//v14//00426D80
    constructor Create;//00426780
    procedure CopyRect(const Dest:TRect; Canvas:TCanvas; const Source:TRect);//004268A0
    procedure Draw(X:Integer; Y:Integer; Graphic:TGraphic);//00426928
    procedure FillRect(const Rect:TRect);//004269D4
    procedure LineTo(X:Integer; Y:Integer);//00426A10
    procedure Lock;//00426A48
    procedure MoveTo(X:Integer; Y:Integer);//00426A70
    procedure Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer);//00426A9C
    procedure StretchDraw(const Rect:TRect; Graphic:TPersistent);//00426AE4
    function TextExtent(const Text:AnsiString):TSize;//00426B20
    function TextWidth(const Text:AnsiString):Integer;//00426B64
    function TextHeight(const Text:AnsiString):Integer;//00426B80
    function TryLock:Boolean;//00426BA0
    procedure Unlock;//00426BFC
    procedure SetFont(Value:TFont);//00426C24
    procedure SetPen(Value:TPen);//00426C34
    procedure SetBrush(Value:TBrush);//00426C40
    function GetPenPos:TPoint;//00426C4C
    procedure SetPenPos(Value:TPoint);//00426C70
    function GetPixel(X:Integer; Y:Integer):TColor;//00426C90
    procedure SetPixel(X:Integer; Y:Integer; Value:TColor);//00426CBC
    function GetHandle:HDC;//00426D04
    procedure DeselectHandles;//00426D24
    procedure SetHandle(Value:HDC);//00426D84
    procedure RequiredState(ReqState:TCanvasState);//00426DD8
    procedure CreateFont;//00426E74
    procedure CreatePen;//00426EA0
    procedure CreateBrush;//00426ED0
    procedure FontChanged(AFont:TObject);//00426F4C
    procedure PenChanged(APen:TObject);//00426F6C
    procedure BrushChanged(ABrush:TObject);//00426F8C
  end;
  TProgressStage = (psStarting, psRunning, psEnding);
  TProgressEvent = procedure(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:String) of object;;
  TGraphic = class(TInterfacedPersistent)
  public
    FOnChange:TNotifyEvent;//f10
    FOnProgress:TProgressEvent;//f18
    FModified:Boolean;//f20
    FTransparent:Boolean;//f21
    FPaletteModified:Boolean;//f22
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00428324
    procedure Changed(Sender:TObject); virtual;//v10//004282B4
    procedure Draw; virtual; abstract;//v14//00402BEC
    function Equals(Graphic:TGraphic):Boolean; virtual;//v18//00428370
    procedure GetEmpty; virtual; abstract;//v1C//00402BEC
    procedure GetHeight; virtual; abstract;//v20//00402BEC
    //function v24:?; virtual;//v24//004284B8
    //function v28:?; virtual;//v28//004284BC
    procedure GetWidth; virtual; abstract;//v2C//00402BEC
    procedure ReadData(Stream:TStream); virtual;//v30//0042853C
    procedure SetHeight; virtual; abstract;//v34//00402BEC
    procedure v38; virtual;//v38//004285A0
    procedure SetTransparent(Value:Boolean); virtual;//v3C//004285A4
    procedure SetWidth; virtual; abstract;//v40//00402BEC
    procedure WriteData(Stream:TStream); virtual;//v44//004285B4
    constructor Create; virtual;//v48//0042827C
    procedure LoadFromFile(const Filename:AnsiString); virtual;//v4C//004284C0
    procedure SaveToFile(const Filename:AnsiString); virtual;//v50//00428548
    procedure LoadFromStream; virtual; abstract;//v54//00402BEC
    procedure SaveToStream; virtual; abstract;//v58//00402BEC
    procedure LoadFromClipboardFormat; virtual; abstract;//v5C//00402BEC
    procedure SaveToClipboardFormat; virtual; abstract;//v60//00402BEC
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString); dynamic;//00428514
  end;
  TPicture = class(TInterfacedPersistent)
  public
    FGraphic:TGraphic;//fC
    FOnChange:TNotifyEvent;//f10
    f14:TGLPersistentImage;//f14
    FNotify:IChangeNotifier;//f18
    FOnProgress:TProgressEvent;//f20
    destructor Destroy; virtual;//00428C20
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00428C50
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00429230
    procedure Assign(Source:TPersistent); virtual;//v8//00428F44
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString); dynamic;//00429018
    procedure Changed(Sender:TObject); dynamic;//00428FF4
    constructor Create;//00428BE0
    procedure ForceType(GraphicType:TGraphicClass);//00428C84
    function GetBitmap:TBitmap;//00428CE8
    function GetIcon:TIcon;//00428D00
    procedure SetGraphic(Value:TGraphic);//00428D18
    procedure SaveToFile(const Filename:AnsiString);//00428EFC
    procedure LoadFromStream(Stream:TStream);//00428F14
    procedure SaveToStream(Stream:TStream);//00428F2C
    procedure RegisterFileFormat(const AExtension:AnsiString; const ADescription:AnsiString; AGraphicClass:TGraphicClass);//00428FA0
    procedure UnregisterGraphicClass(AClass:TGraphicClass);//00428FC4
    procedure ReadData(Stream:TStream);//00429040
    procedure WriteData(Stream:TStream);//00429158
    function GetWidth:Integer;//0042927C
    function GetHeight:Integer;//00429294
  end;
  TSharedImage = class(TObject)
  public
    FRefCount:Integer;//f4
    procedure FreeHandle; virtual; abstract;//v0//00402BEC
    procedure Reference;//0042A308
    procedure Release;//0042A30C
  end;
  TMetafileImage = class(TSharedImage)
  public
    FHandle:THandle;//f8
    FWidth:Integer;//fC
    FHeight:Integer;//f10
    FPalette:HPALETTE;//f14
    FInch:Word;//f18
    FTempWidth:Integer;//f1C
    FTempHeight:Integer;//f20
    destructor Destroy; virtual;//004292AC
    procedure FreeHandle; virtual;//v0//004292E8
  end;
  TMetafile = class(TGraphic)
  public
    FImage:TMetafileImage;//f28
    FEnhanced:Boolean;//f2C
    destructor Destroy; virtual;//00429334
    procedure Assign(Source:TPersistent); virtual;//v8//00429364
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//004293F8
    function GetEmpty:Boolean; virtual;//v1C//00429488
    function GetHeight:Integer; virtual;//v20//00429490
    function GetPalette:HPALETTE; virtual;//v24//004294F4
    function GetWidth:Integer; virtual;//v2C//00429580
    procedure ReadData(Stream:TStream); virtual;//v30//00429660
    procedure SetHeight(Value:Integer); virtual;//v34//004299FC
    procedure SetTransparent(Value:Boolean); virtual;//v3C//00429AE8
    procedure SetWidth(Value:Integer); virtual;//v40//00429AEC
    procedure WriteData(Stream:TStream); virtual;//v44//00429C44
    constructor Create; virtual;//v48//004292EC
    procedure SaveToFile(const Filename:AnsiString); virtual;//v50//0042991C
    procedure LoadFromStream(Stream:TStream); virtual;//v54//004295E4
    procedure SaveToStream(Stream:TStream); virtual;//v58//004299E0
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE); virtual;//v5C//00429E98
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE); virtual;//v60//00429F1C
    procedure NewImage;//00429638
    procedure ReadEMFStream(Stream:TStream);//004296CC
    procedure ReadWMFStream(Stream:TStream; Length:Longint);//0042979C
    procedure SetMMHeight(Value:Integer);//00429A70
    procedure SetMMWidth(Value:Integer);//00429AAC
    function TestEMF(Stream:TStream):Boolean;//00429B60
    procedure UniqueImage;//00429BC0
    procedure WriteEMFStream(Stream:TStream);//00429CC4
    procedure WriteWMFStream(Stream:TStream);//00429D50
  end;
  TBitmapImage = class(TSharedImage)
  public
    FHandle:HBITMAP;//f8
    FMaskHandle:HBITMAP;//fC
    FPalette:HPALETTE;//f10
    FDIBHandle:HBITMAP;//f14
    FDIB:TDIBSection;//f18
    FSaveStream:TMemoryStream;//f6C
    FOS2Format:Boolean;//f70
    FHalftone:Boolean;//f71
    destructor Destroy; virtual;//0042A32C
    procedure FreeHandle; virtual;//v0//0042A388
  end;
  TBitmap = class(TGraphic)
  public
    FImage:TBitmapImage;//f28
    FCanvas:TCanvas;//f2C
    FIgnorePalette:Boolean;//f30
    FMaskBitsValid:Boolean;//f31
    FMaskValid:Boolean;//f32
    FTransparentColor:TColor;//f34
    FTransparentMode:TTransparentMode;//f38
    destructor Destroy; virtual;//0042AE18
    procedure Assign(Source:TPersistent); virtual;//v8//0042AE54
    procedure Changed(Sender:TObject); virtual;//v10//0042B028
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//0042B0A8
    function GetEmpty:Boolean; virtual;//v1C//0042B35C
    function GetHeight:Integer; virtual;//v20//0042B410
    function GetPalette:HPALETTE; virtual;//v24//0042B450
    //function GetWidth:?; virtual;//v2C//0042B598
    procedure ReadData(Stream:TStream); virtual;//v30//0042B984
    procedure SetHeight(Value:Integer); virtual;//v34//0042C180
    procedure SetPalette(Value:HPALETTE); virtual;//v38//0042C254
    procedure SetWidth(Value:Integer); virtual;//v40//0042C490
    procedure WriteData(Stream:TStream); virtual;//v44//0042C4E4
    constructor Create; virtual;//v48//0042ADB0
    procedure LoadFromStream(Stream:TStream); virtual;//v54//0042B860
    procedure SaveToStream(Stream:TStream); virtual;//v58//0042C7A4
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE); virtual;//v5C//0042B7DC
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE); virtual;//v60//0042C7AC
    function GetHandle:HBITMAP; virtual;//v64//0042B3C0
    function GetMaskHandle:HBITMAP; virtual;//v68//0042B420
    procedure SetHandleType(Value:TBitmapHandleType); virtual;//v6C//0042C048
    procedure CopyImage(AHandle:HBITMAP; APalette:HPALETTE; DIB:TDIBSection);//0042AF44
    procedure Changing(Sender:TObject);//0042B004
    procedure Dormant;//0042B034
    procedure FreeImage;//0042B2F8
    function GetCanvas:TCanvas;//0042B378
    function GetHandleType:TBitmapHandleType;//0042B3E4
    function GetMonochrome:Boolean;//0042B434
    function GetPixelFormat:TPixelFormat;//0042B464
    function GetScanline(Row:Integer):Pointer;//0042B4E8
    function GetTransparentColor:TColor;//0042B550
    procedure DIBNeeded;//0042B5A0
    procedure FreeContext;//0042B614
    procedure HandleNeeded;//0042B624
    procedure MaskHandleNeeded;//0042B6C4
    procedure PaletteNeeded;//0042B724
    procedure NewImage(NewHandle:HBITMAP; NewPalette:HPALETTE; const NewDIB:TDIBSection; OS2Format:Boolean; RLEStream:TStream);//0042B884
    procedure ReadDIB(Stream:TStream; ImageSize:LongWord; bmf:PBitmapFileHeader);//0042B9AC
    procedure ReadStream(Stream:TStream; Size:Longint);//0042BF14
    procedure SetHandle(Value:HBITMAP);//0042BF84
    procedure SetMonochrome(Value:Boolean);//0042C1D4
    procedure SetPixelFormat(Value:TPixelFormat);//0042C328
    procedure WriteStream(Stream:TStream; WriteSize:Boolean);//0042C4EC
  end;
  TIconImage = class(TSharedImage)
  public
    FHandle:HICON;//f8
    FMemoryImage:TCustomMemoryStream;//fC
    FSize:TPoint;//f10
    destructor Destroy; virtual;//0042C84C
    procedure FreeHandle; virtual;//v0//0042C87C
  end;
  TIcon = class(TGraphic)
  public
    FImage:TIconImage;//f28
    FRequestedSize:TPoint;//f2C
    destructor Destroy; virtual;//0042C8E8
    procedure Assign(Source:TPersistent); virtual;//v8//0042C918
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//0042C978
    function GetEmpty:Boolean; virtual;//v1C//0042C9B8
    function GetHeight:Integer; virtual;//v20//0042C9E4
    function GetWidth:Integer; virtual;//v2C//0042C9F8
    procedure SetHeight(Value:Integer); virtual;//v34//0042CC7C
    procedure SetTransparent(Value:Boolean); virtual;//v3C//0042CC94
    procedure SetWidth(Value:Integer); virtual;//v40//0042CC98
    constructor Create; virtual;//v48//0042C894
    procedure LoadFromStream(Stream:TStream); virtual;//v54//0042CB38
    procedure SaveToStream(Stream:TStream); virtual;//v58//0042CCB0
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE); virtual;//v5C//0042CCD8
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE); virtual;//v60//0042CCEC
    function GetHandle:HICON;//0042C9D0
    procedure HandleNeeded;//0042CA0C
    procedure ImageNeeded;//0042CA84
    procedure NewImage(NewHandle:HICON; NewImage:TMemoryStream);//0042CBF0
    procedure SetHandle(Value:HICON);//0042CC64
  end;
  TResourceManager = class(TObject)
  public
    ResList:PResource;//f4
    FLock:TRTLCriticalSection;//f8
    ResDataSize:Word;//f20
    constructor Create(AResDataSize:Word);//0042515C
    destructor Destroy;//00425198
    procedure Lock;//004251BC
    procedure Unlock;//004251C8
    function AllocResource(const ResData:void ):PResource;//004251D4
    procedure FreeResource(Resource:PResource);//004252B8
    procedure ChangeResource(GraphicsObject:TGraphicsObject; const ResData:void );//00425368
    procedure AssignResource(GraphicsObject:TGraphicsObject; AResource:PResource);//004253E0
  end;
  TFileFormat = TFileFormat = record//size=0x10
f4:String;//f4
f8:String;//f8
end;;
  TFileFormatsList = class(TList)
  public
    destructor Destroy; virtual;//00428790
    constructor Create;//0042865C
    procedure Add(const Ext:AnsiString; const Desc:AnsiString; DescID:Integer; AClass:TGraphicClass);//004287DC
    function FindExt(Ext:AnsiString):TGraphicClass;//00428870
    function FindClassName(const Classname:AnsiString):TGraphicClass;//00428908
    procedure Remove(AClass:TGraphicClass);//00428998
  end;
  TClipboardFormats = class(TObject)
  public
    FClasses:TList;//f4
    FFormats:TList;//f8
    constructor Create;//00428A44
    destructor Destroy;//00428AC4
    procedure Add(Fmt:Word; AClass:TGraphicClass);//00428AF0
    procedure Remove(AClass:TGraphicClass);//00428B58
  end;
  TBitmapCanvas = class(TCanvas)
  public
    FBitmap:TBitmap;//f58
    FOldBitmap:HBITMAP;//f5C
    FOldPalette:HPALETTE;//f60
    destructor Destroy; virtual;//0042A150
    procedure CreateHandle; virtual;//v14//0042A21C
    constructor Create(ABitmap:TBitmap);//0042A114
    procedure FreeContext;//0042A17C
  end;
  TPatternManager = class(TObject)
  public
    List:PPattern;//f4
    FLock:TRTLCriticalSection;//f8
    constructor Create;//0042CE48
    destructor Destroy;//0042CE80
    procedure Lock;//0042CEAC
    procedure Unlock;//0042CEB8
    function AllocPattern(BkColor:TColorRef; FgColor:TColorRef):PPattern;//0042CEC4
    function CreateBitmap(BkColor:TColor; FgColor:TColor):TBitmap;//0042CF78
    procedure FreePatterns;//0042D078
  end;
    procedure InternalDeletePalette(Pal:HPALETTE);//004250D4
    function GetHashCode(const Buffer:void ; Count:Integer):Word;//00425148
    procedure ClearColor(ResMan:TResourceManager);//0042544C
    procedure PaletteChanged;//004254B8
    function ColorToRGB(Color:TColor):Longint;//004259A4
    function ColorToIdent(Color:Longint; var Ident:AnsiString):Boolean;//004259B4
    function IdentToColor(const Ident:AnsiString; var Color:Longint):Boolean;//004259C4
    procedure Changed;//004259D4
    function CharsetToIdent(Charset:Longint; var Ident:AnsiString):Boolean;//00425BBC
    function IdentToCharset(const Ident:AnsiString; var Charset:Longint):Boolean;//00425BCC
    function GetFontData(Font:HFONT):TFontData;//00425BDC
    destructor Destroy;//00425CE4
    procedure Changed;//00425D0C
    procedure Assign(Source:TPersistent);//00425D28
    destructor Destroy;//00426200
    procedure Assign(Source:TPersistent);//00426228
    destructor Destroy;//004264C8
    procedure Assign(Source:TPersistent);//004264F0
    destructor Destroy;//00426844
    procedure CreateHandle;//00426D80
    procedure Changing;//00426E4C
    procedure Changed;//00426E60
    procedure InvalidOperation(Str:PResStringRec);//00426FAC
    procedure InvalidGraphic(Str:PResStringRec);//00426FC4
    procedure InvalidBitmap;//00426FDC
    procedure InvalidIcon;//00426FE8
    procedure InvalidMetafile;//00426FF4
    procedure OutOfResources;//00427000
    procedure GDIError;//00427054
    function GDICheck(Value:Integer):Integer;//004270FC
    function DupBits(Src:HBITMAP; Size:TPoint; Mono:Boolean):HBITMAP;//0042710C
    function GetDInColors(BitCount:Word):Integer;//0042726C
    function BytesPerScanline(PixelsPerScanline:Longint; BitsPerPixel:Longint; Alignment:Longint):Longint;//0042728C
    function TransparentStretchBlt(DstDC:HDC; DstX:Integer; DstY:Integer; DstW:Integer; DstH:Integer; SrcDC:HDC; SrcX:Integer; SrcY:Integer; SrcW:Integer; SrcH:Integer; MaskDC:HDC; MaskX:Integer; MaskY:Integer):Boolean;//004272A0
    procedure RGBTripleToQuad(var ColorTable:void );//00427534
    procedure RGBQuadToTriple(var ColorTable:void ; var ColorCount:Integer);//0042756C
    procedure ByteSwapColors(var Colors:void ; Count:Integer);//004275E4
    //function CreateSystemPalette(const Entries:array[$0..-$1] of TColor; const _Dv_:?):HPALETTE;//0042763C
    function SystemPaletteOverride(var Pal:TMaxLogPalette):Boolean;//00427754
    function PaletteFromDIBColorTable(DIBHandle:THandle; ColorTable:Pointer; ColorCount:Integer):HPALETTE;//004277EC
    //function PaletteToDIBColorTable(Pal:HPALETTE; var ColorTable:array[$0..-$1] of Windows.TRGBQuad; const _Dv_:?):Integer;//00427890
    procedure TwoBitsFromDIB(var BI:TBitmapInfoHeader; var XorBits:HBITMAP; var AndBits:HBITMAP; const IconSize:TPoint);//004278E4
    function AdjustColor(I:Integer):Integer;//00427AA0
    function BetterSize(const Old:TIconRec; const New:TIconRec):Boolean;//00427AAC
    procedure ReadIcon(Stream:TStream; var Icon:HICON; ImageCount:Integer; StartOffset:Integer; const RequestedSize:TPoint; var IconSize:TPoint);//00427B3C
    function ComputeAldusChecksum(var WMF:TMetafileHeader):Word;//00427E44
    procedure InitializeBitmapInfoHeader(Bitmap:HBITMAP; var BI:TBitmapInfoHeader; Colors:Integer);//00427E5C
    procedure InternalGetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD; Colors:Integer);//00427F40
    procedure GetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD);//00427FA4
    function InternalGetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ; Colors:Integer):Boolean;//00427FAC
    function GetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ):Boolean;//0042805C
    procedure WinError;//00428070
    procedure CheckBool(Result:BOOL);//00428074
    procedure WriteIcon(Stream:TStream; Icon:HICON; WriteLength:Boolean);//00428080
    constructor Create;//0042827C
    procedure Changed(Sender:TObject);//004282B4
    function DoWrite:Boolean;//004282CC
    procedure DefineProperties(Filer:TFiler);//00428324
    function Equals(Graphic:TGraphic):Boolean;//00428370
    //function sub_004284B8:?;//004284B8
    //function sub_004284BC:?;//004284BC
    procedure LoadFromFile(const Filename:AnsiString);//004284C0
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);//00428514
    procedure ReadData(Stream:TStream);//0042853C
    procedure SaveToFile(const Filename:AnsiString);//00428548
    procedure sub_004285A0;//004285A0
    procedure SetTransparent(Value:Boolean);//004285A4
    procedure WriteData(Stream:TStream);//004285B4
    destructor Destroy;//00428790
    function GetFileFormats:TFileFormatsList;//00428BA0
    function GetClipboardFormats:TClipboardFormats;//00428BC0
    destructor Destroy;//00428C20
    procedure AssignTo(Dest:TPersistent);//00428C50
    //procedure sub_00428DC8(?:?; ?:AnsiString);//00428DC8
    procedure Assign(Source:TPersistent);//00428F44
    procedure Changed(Sender:TObject);//00428FF4
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);//00429018
    function DoWrite:Boolean;//004291B4
    procedure DefineProperties(Filer:TFiler);//00429230
    destructor Destroy;//004292AC
    procedure FreeHandle;//004292E8
    constructor Create;//004292EC
    destructor Destroy;//00429334
    procedure Assign(Source:TPersistent);//00429364
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//004293F8
    function GetEmpty:Boolean;//00429488
    function GetHeight:Integer;//00429490
    function GetPalette:HPALETTE;//004294F4
    function GetWidth:Integer;//00429580
    procedure LoadFromStream(Stream:TStream);//004295E4
    procedure ReadData(Stream:TStream);//00429660
    procedure SaveToFile(const Filename:AnsiString);//0042991C
    procedure SaveToStream(Stream:TStream);//004299E0
    procedure SetHeight(Value:Integer);//004299FC
    procedure SetTransparent(Value:Boolean);//00429AE8
    procedure SetWidth(Value:Integer);//00429AEC
    procedure WriteData(Stream:TStream);//00429C44
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//00429E98
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);//00429F1C
    procedure FreeMemoryContexts;//00429FEC
    procedure DeselectBitmap(AHandle:HBITMAP);//0042A098
    destructor Destroy;//0042A150
    procedure CreateHandle;//0042A21C
    destructor Destroy;//0042A32C
    procedure FreeHandle;//0042A388
    procedure UpdateDIBColorTable(DIBHandle:HBITMAP; Pal:HPALETTE; const DIB:TDIBSection);//0042A3D4
    procedure FixupBitFields(var DIB:TDIBSection);//0042A490
    function CopyBitmap(Handle:HBITMAP; OldPalette:HPALETTE; NewPalette:HPALETTE; var DIB:TDIBSection; Canvas:TCanvas):HBITMAP;//0042A4DC
    function CopyPalette(Palette:HPALETTE):HPALETTE;//0042AB40
    function CopyBitmapAsMask(Handle:HBITMAP; Palette:HPALETTE; TransparentColor:TColorRef):HBITMAP;//0042ABA4
    constructor Create;//0042ADB0
    destructor Destroy;//0042AE18
    procedure Assign(Source:TPersistent);//0042AE54
    procedure Changed(Sender:TObject);//0042B028
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//0042B0A8
    function GetEmpty:Boolean;//0042B35C
    function GetHandle:HBITMAP;//0042B3C0
    function GetHeight:Integer;//0042B410
    function GetMaskHandle:HBITMAP;//0042B420
    function GetPalette:HPALETTE;//0042B450
    //function GetWidth:?;//0042B598
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//0042B7DC
    procedure LoadFromStream(Stream:TStream);//0042B860
    procedure ReadData(Stream:TStream);//0042B984
    procedure SetHandleType(Value:TBitmapHandleType);//0042C048
    procedure SetHeight(Value:Integer);//0042C180
    procedure SetPalette(Value:HPALETTE);//0042C254
    procedure SetWidth(Value:Integer);//0042C490
    procedure WriteData(Stream:TStream);//0042C4E4
    procedure SaveToStream(Stream:TStream);//0042C7A4
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);//0042C7AC
    destructor Destroy;//0042C84C
    procedure FreeHandle;//0042C87C
    constructor Create;//0042C894
    destructor Destroy;//0042C8E8
    procedure Assign(Source:TPersistent);//0042C918
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//0042C978
    function GetEmpty:Boolean;//0042C9B8
    function GetHeight:Integer;//0042C9E4
    function GetWidth:Integer;//0042C9F8
    procedure LoadFromStream(Stream:TStream);//0042CB38
    procedure SetHeight(Value:Integer);//0042CC7C
    procedure SetTransparent(Value:Boolean);//0042CC94
    procedure SetWidth(Value:Integer);//0042CC98
    procedure SaveToStream(Stream:TStream);//0042CCB0
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//0042CCD8
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);//0042CCEC
    procedure InitScreenLogPixels;//0042CD00
    function GetDefFontCharSet:TFontCharset;//0042CD38
    procedure InitDefFontData;//0042CD7C
    function AllocPatternBitmap(BkColor:TColor; FgColor:TColor):TBitmap;//0042D0F0

implementation

//004250D4
procedure InternalDeletePalette(Pal:HPALETTE);
begin
{*
 004250D4    test        eax,eax
>004250D6    je          004250E6
 004250D8    cmp         eax,dword ptr ds:[5E095C];SystemPalette16:HPALETTE
>004250DE    je          004250E6
 004250E0    push        eax
 004250E1    call        gdi32.DeleteObject
 004250E6    ret
*}
end;

//00425148
function GetHashCode(const Buffer:void ; Count:Integer):Word;
begin
{*
 00425148    mov         ecx,edx
 0042514A    mov         edx,eax
 0042514C    xor         eax,eax
 0042514E    rol         ax,5
 00425152    xor         al,byte ptr [edx]
 00425154    inc         edx
 00425155    dec         ecx
>00425156    jne         0042514E
 00425158    ret
*}
end;

//0042515C
constructor TResourceManager.Create(AResDataSize:Word);
begin
{*
 0042515C    push        ebx
 0042515D    push        esi
 0042515E    test        dl,dl
>00425160    je          0042516A
 00425162    add         esp,0FFFFFFF0
 00425165    call        @ClassCreate
 0042516A    mov         ebx,edx
 0042516C    mov         esi,eax
 0042516E    mov         word ptr [esi+20],cx
 00425172    lea         eax,[esi+8]
 00425175    push        eax
 00425176    call        KERNEL32.InitializeCriticalSection
 0042517B    mov         eax,esi
 0042517D    test        bl,bl
>0042517F    je          00425190
 00425181    call        @AfterConstruction
 00425186    pop         dword ptr fs:[0]
 0042518D    add         esp,0C
 00425190    mov         eax,esi
 00425192    pop         esi
 00425193    pop         ebx
 00425194    ret
*}
end;

//00425198
destructor TResourceManager.Destroy;
begin
{*
 00425198    push        ebx
 00425199    push        esi
 0042519A    call        @BeforeDestruction
 0042519F    mov         ebx,edx
 004251A1    mov         esi,eax
 004251A3    lea         eax,[esi+8]
 004251A6    push        eax
 004251A7    call        KERNEL32.DeleteCriticalSection
 004251AC    test        bl,bl
>004251AE    jle         004251B7
 004251B0    mov         eax,esi
 004251B2    call        @ClassDestroy
 004251B7    pop         esi
 004251B8    pop         ebx
 004251B9    ret
*}
end;

//004251BC
procedure TResourceManager.Lock;
begin
{*
 004251BC    add         eax,8
 004251BF    push        eax
 004251C0    call        KERNEL32.EnterCriticalSection
 004251C5    ret
*}
end;

//004251C8
procedure TResourceManager.Unlock;
begin
{*
 004251C8    add         eax,8
 004251CB    push        eax
 004251CC    call        KERNEL32.LeaveCriticalSection
 004251D1    ret
*}
end;

//004251D4
function TResourceManager.AllocResource(const ResData:void ):PResource;
begin
{*
 004251D4    push        ebp
 004251D5    mov         ebp,esp
 004251D7    add         esp,0FFFFFFF8
 004251DA    push        ebx
 004251DB    push        esi
 004251DC    mov         ebx,edx
 004251DE    mov         dword ptr [ebp-4],eax
 004251E1    mov         eax,dword ptr [ebp-4]
 004251E4    movzx       edx,word ptr [eax+20]
 004251E8    mov         eax,ebx
 004251EA    call        GetHashCode
 004251EF    mov         esi,eax
 004251F1    mov         eax,dword ptr [ebp-4]
 004251F4    call        TResourceManager.Lock
 004251F9    xor         edx,edx
 004251FB    push        ebp
 004251FC    push        4252A8
 00425201    push        dword ptr fs:[edx]
 00425204    mov         dword ptr fs:[edx],esp
 00425207    mov         eax,dword ptr [ebp-4]
 0042520A    mov         eax,dword ptr [eax+4]
 0042520D    mov         dword ptr [ebp-8],eax
>00425210    jmp         0042521A
 00425212    mov         eax,dword ptr [ebp-8]
 00425215    mov         eax,dword ptr [eax]
 00425217    mov         dword ptr [ebp-8],eax
 0042521A    cmp         dword ptr [ebp-8],0
>0042521E    je          00425241
 00425220    mov         eax,dword ptr [ebp-8]
 00425223    cmp         si,word ptr [eax+0C]
>00425227    jne         00425212
 00425229    mov         eax,dword ptr [ebp-4]
 0042522C    movzx       ecx,word ptr [eax+20]
 00425230    mov         edx,ebx
 00425232    mov         eax,dword ptr [ebp-8]
 00425235    add         eax,10
 00425238    call        CompareMem
 0042523D    test        al,al
>0042523F    je          00425212
 00425241    cmp         dword ptr [ebp-8],0
>00425245    jne         0042528C
 00425247    mov         eax,dword ptr [ebp-4]
 0042524A    movzx       eax,word ptr [eax+20]
 0042524E    add         eax,10
 00425251    call        @GetMem
 00425256    mov         dword ptr [ebp-8],eax
 00425259    mov         eax,dword ptr [ebp-8]
 0042525C    mov         edx,dword ptr [ebp-4]
 0042525F    mov         edx,dword ptr [edx+4]
 00425262    mov         dword ptr [eax],edx
 00425264    xor         edx,edx
 00425266    mov         dword ptr [eax+4],edx
 00425269    mov         edx,dword ptr [ebx]
 0042526B    mov         dword ptr [eax+8],edx
 0042526E    mov         word ptr [eax+0C],si
 00425272    mov         edx,dword ptr [ebp-4]
 00425275    movzx       ecx,word ptr [edx+20]
 00425279    lea         edx,[eax+10]
 0042527C    mov         eax,ebx
 0042527E    call        Move
 00425283    mov         eax,dword ptr [ebp-4]
 00425286    mov         edx,dword ptr [ebp-8]
 00425289    mov         dword ptr [eax+4],edx
 0042528C    mov         eax,dword ptr [ebp-8]
 0042528F    inc         dword ptr [eax+4]
 00425292    xor         eax,eax
 00425294    pop         edx
 00425295    pop         ecx
 00425296    pop         ecx
 00425297    mov         dword ptr fs:[eax],edx
 0042529A    push        4252AF
 0042529F    mov         eax,dword ptr [ebp-4]
 004252A2    call        TResourceManager.Unlock
 004252A7    ret
>004252A8    jmp         @HandleFinally
>004252AD    jmp         0042529F
 004252AF    mov         eax,dword ptr [ebp-8]
 004252B2    pop         esi
 004252B3    pop         ebx
 004252B4    pop         ecx
 004252B5    pop         ecx
 004252B6    pop         ebp
 004252B7    ret
*}
end;

//004252B8
procedure TResourceManager.FreeResource(Resource:PResource);
begin
{*
 004252B8    push        ebp
 004252B9    mov         ebp,esp
 004252BB    add         esp,0FFFFFFF0
 004252BE    mov         dword ptr [ebp-8],edx
 004252C1    mov         dword ptr [ebp-4],eax
 004252C4    cmp         dword ptr [ebp-8],0
>004252C8    je          00425364
 004252CE    mov         eax,dword ptr [ebp-8]
 004252D1    mov         dword ptr [ebp-10],eax
 004252D4    mov         eax,dword ptr [ebp-4]
 004252D7    call        TResourceManager.Lock
 004252DC    xor         ecx,ecx
 004252DE    push        ebp
 004252DF    push        42533F
 004252E4    push        dword ptr fs:[ecx]
 004252E7    mov         dword ptr fs:[ecx],esp
 004252EA    mov         eax,dword ptr [ebp-10]
 004252ED    dec         dword ptr [eax+4]
 004252F0    mov         eax,dword ptr [ebp-10]
 004252F3    cmp         dword ptr [eax+4],0
 004252F7    sete        byte ptr [ebp-9]
 004252FB    cmp         byte ptr [ebp-9],0
>004252FF    je          00425329
 00425301    mov         eax,dword ptr [ebp-4]
 00425304    mov         eax,dword ptr [eax+4]
 00425307    cmp         eax,dword ptr [ebp-8]
>0042530A    jne         0042531B
 0042530C    mov         eax,dword ptr [ebp-8]
 0042530F    mov         eax,dword ptr [eax]
 00425311    mov         edx,dword ptr [ebp-4]
 00425314    mov         dword ptr [edx+4],eax
>00425317    jmp         00425329
 00425319    mov         eax,edx
 0042531B    mov         edx,dword ptr [eax]
 0042531D    cmp         edx,dword ptr [ebp-8]
>00425320    jne         00425319
 00425322    mov         edx,dword ptr [ebp-8]
 00425325    mov         edx,dword ptr [edx]
 00425327    mov         dword ptr [eax],edx
 00425329    xor         eax,eax
 0042532B    pop         edx
 0042532C    pop         ecx
 0042532D    pop         ecx
 0042532E    mov         dword ptr fs:[eax],edx
 00425331    push        425346
 00425336    mov         eax,dword ptr [ebp-4]
 00425339    call        TResourceManager.Unlock
 0042533E    ret
>0042533F    jmp         @HandleFinally
>00425344    jmp         00425336
 00425346    cmp         byte ptr [ebp-9],0
>0042534A    je          00425364
 0042534C    mov         eax,dword ptr [ebp-10]
 0042534F    mov         eax,dword ptr [eax+8]
 00425352    test        eax,eax
>00425354    je          0042535C
 00425356    push        eax
 00425357    call        gdi32.DeleteObject
 0042535C    mov         eax,dword ptr [ebp-8]
 0042535F    call        @FreeMem
 00425364    mov         esp,ebp
 00425366    pop         ebp
 00425367    ret
*}
end;

//00425368
procedure TResourceManager.ChangeResource(GraphicsObject:TGraphicsObject; const ResData:void );
begin
{*
 00425368    push        ebp
 00425369    mov         ebp,esp
 0042536B    add         esp,0FFFFFFF8
 0042536E    push        ebx
 0042536F    push        esi
 00425370    push        edi
 00425371    mov         dword ptr [ebp-8],ecx
 00425374    mov         ebx,edx
 00425376    mov         dword ptr [ebp-4],eax
 00425379    mov         eax,dword ptr [ebp-4]
 0042537C    call        TResourceManager.Lock
 00425381    xor         eax,eax
 00425383    push        ebp
 00425384    push        4253D1
 00425389    push        dword ptr fs:[eax]
 0042538C    mov         dword ptr fs:[eax],esp
 0042538F    mov         edi,dword ptr [ebx+10]
 00425392    mov         edx,dword ptr [ebp-8]
 00425395    mov         eax,dword ptr [ebp-4]
 00425398    call        TResourceManager.AllocResource
 0042539D    mov         esi,eax
 0042539F    mov         dword ptr [ebx+10],esi
 004253A2    cmp         edi,esi
>004253A4    je          004253B1
 004253A6    mov         eax,ebx
 004253A8    mov         si,0FFFD
 004253AC    call        @CallDynaInst
 004253B1    mov         edx,edi
 004253B3    mov         eax,dword ptr [ebp-4]
 004253B6    call        TResourceManager.FreeResource
 004253BB    xor         eax,eax
 004253BD    pop         edx
 004253BE    pop         ecx
 004253BF    pop         ecx
 004253C0    mov         dword ptr fs:[eax],edx
 004253C3    push        4253D8
 004253C8    mov         eax,dword ptr [ebp-4]
 004253CB    call        TResourceManager.Unlock
 004253D0    ret
>004253D1    jmp         @HandleFinally
>004253D6    jmp         004253C8
 004253D8    pop         edi
 004253D9    pop         esi
 004253DA    pop         ebx
 004253DB    pop         ecx
 004253DC    pop         ecx
 004253DD    pop         ebp
 004253DE    ret
*}
end;

//004253E0
procedure TResourceManager.AssignResource(GraphicsObject:TGraphicsObject; AResource:PResource);
begin
{*
 004253E0    push        ebp
 004253E1    mov         ebp,esp
 004253E3    push        ecx
 004253E4    push        ebx
 004253E5    push        esi
 004253E6    push        edi
 004253E7    mov         edi,ecx
 004253E9    mov         esi,edx
 004253EB    mov         dword ptr [ebp-4],eax
 004253EE    mov         eax,dword ptr [ebp-4]
 004253F1    call        TResourceManager.Lock
 004253F6    xor         eax,eax
 004253F8    push        ebp
 004253F9    push        42543C
 004253FE    push        dword ptr fs:[eax]
 00425401    mov         dword ptr fs:[eax],esp
 00425404    mov         ebx,dword ptr [esi+10]
 00425407    cmp         edi,ebx
>00425409    je          00425426
 0042540B    inc         dword ptr [edi+4]
 0042540E    mov         dword ptr [esi+10],edi
 00425411    mov         eax,esi
 00425413    mov         si,0FFFD
 00425417    call        @CallDynaInst
 0042541C    mov         edx,ebx
 0042541E    mov         eax,dword ptr [ebp-4]
 00425421    call        TResourceManager.FreeResource
 00425426    xor         eax,eax
 00425428    pop         edx
 00425429    pop         ecx
 0042542A    pop         ecx
 0042542B    mov         dword ptr fs:[eax],edx
 0042542E    push        425443
 00425433    mov         eax,dword ptr [ebp-4]
 00425436    call        TResourceManager.Unlock
 0042543B    ret
>0042543C    jmp         @HandleFinally
>00425441    jmp         00425433
 00425443    pop         edi
 00425444    pop         esi
 00425445    pop         ebx
 00425446    pop         ecx
 00425447    pop         ebp
 00425448    ret
*}
end;

//0042544C
procedure ClearColor(ResMan:TResourceManager);
begin
{*
 0042544C    push        ebp
 0042544D    mov         ebp,esp
 0042544F    push        ecx
 00425450    push        ebx
 00425451    push        esi
 00425452    mov         dword ptr [ebp-4],eax
 00425455    mov         eax,dword ptr [ebp-4]
 00425458    call        TResourceManager.Lock
 0042545D    xor         edx,edx
 0042545F    push        ebp
 00425460    push        4254AB
 00425465    push        dword ptr fs:[edx]
 00425468    mov         dword ptr fs:[edx],esp
 0042546B    mov         eax,dword ptr [ebp-4]
 0042546E    mov         ebx,dword ptr [eax+4]
 00425471    test        ebx,ebx
>00425473    je          00425495
 00425475    mov         esi,ebx
 00425477    mov         eax,dword ptr [esi+8]
 0042547A    test        eax,eax
>0042547C    je          0042548F
 0042547E    cmp         dword ptr [esi+14],0
>00425482    jge         0042548F
 00425484    push        eax
 00425485    call        gdi32.DeleteObject
 0042548A    xor         eax,eax
 0042548C    mov         dword ptr [esi+8],eax
 0042548F    mov         ebx,dword ptr [ebx]
 00425491    test        ebx,ebx
>00425493    jne         00425475
 00425495    xor         eax,eax
 00425497    pop         edx
 00425498    pop         ecx
 00425499    pop         ecx
 0042549A    mov         dword ptr fs:[eax],edx
 0042549D    push        4254B2
 004254A2    mov         eax,dword ptr [ebp-4]
 004254A5    call        TResourceManager.Unlock
 004254AA    ret
>004254AB    jmp         @HandleFinally
>004254B0    jmp         004254A2
 004254B2    pop         esi
 004254B3    pop         ebx
 004254B4    pop         ecx
 004254B5    pop         ebp
 004254B6    ret
*}
end;

//004254B8
procedure PaletteChanged;
begin
{*
 004254B8    push        ebp
 004254B9    mov         ebp,esp
 004254BB    add         esp,0FFFFFFF8
 004254BE    push        ebx
 004254BF    push        esi
 004254C0    xor         eax,eax
 004254C2    mov         dword ptr [ebp-4],eax
 004254C5    mov         eax,[005E09B4];CanvasList:TThreadList
 004254CA    call        TThreadList.LockList
 004254CF    mov         dword ptr [ebp-8],eax
 004254D2    xor         eax,eax
 004254D4    push        ebp
 004254D5    push        425555
 004254DA    push        dword ptr fs:[eax]
 004254DD    mov         dword ptr fs:[eax],esp
>004254E0    jmp         00425500
 004254E2    mov         edx,dword ptr [ebp-4]
 004254E5    mov         eax,dword ptr [ebp-8]
 004254E8    call        TList.Get
 004254ED    mov         ebx,eax
 004254EF    mov         eax,ebx
 004254F1    call        TCanvas.Lock
 004254F6    inc         dword ptr [ebp-4]
 004254F9    mov         eax,ebx
 004254FB    call        TCanvas.DeselectHandles
 00425500    mov         eax,dword ptr [ebp-8]
 00425503    mov         eax,dword ptr [eax+8]
 00425506    cmp         eax,dword ptr [ebp-4]
>00425509    jg          004254E2
 0042550B    mov         eax,[005E09AC];PenManager:TResourceManager
 00425510    call        ClearColor
 00425515    mov         eax,[005E09B0];BrushManager:TResourceManager
 0042551A    call        ClearColor
 0042551F    xor         eax,eax
 00425521    pop         edx
 00425522    pop         ecx
 00425523    pop         ecx
 00425524    mov         dword ptr fs:[eax],edx
 00425527    push        42555C
 0042552C    mov         ebx,dword ptr [ebp-4]
 0042552F    dec         ebx
 00425530    test        ebx,ebx
>00425532    jl          0042554A
 00425534    inc         ebx
 00425535    xor         esi,esi
 00425537    mov         edx,esi
 00425539    mov         eax,dword ptr [ebp-8]
 0042553C    call        TList.Get
 00425541    call        TCanvas.Unlock
 00425546    inc         esi
 00425547    dec         ebx
>00425548    jne         00425537
 0042554A    mov         eax,[005E09B4];CanvasList:TThreadList
 0042554F    call        TThreadList.UnlockList
 00425554    ret
>00425555    jmp         @HandleFinally
>0042555A    jmp         0042552C
 0042555C    pop         esi
 0042555D    pop         ebx
 0042555E    pop         ecx
 0042555F    pop         ecx
 00425560    pop         ebp
 00425561    ret
*}
end;

//004259A4
function ColorToRGB(Color:TColor):Longint;
begin
{*
 004259A4    test        eax,eax
>004259A6    jge         004259B3
 004259A8    and         eax,0FF
 004259AD    push        eax
 004259AE    call        user32.GetSysColor
 004259B3    ret
*}
end;

//004259B4
function ColorToIdent(Color:Longint; var Ident:AnsiString):Boolean;
begin
{*
 004259B4    push        33
 004259B6    mov         ecx,5AC57C
 004259BB    call        IntToIdent
 004259C0    ret
*}
end;

//004259C4
function IdentToColor(const Ident:AnsiString; var Color:Longint):Boolean;
begin
{*
 004259C4    push        33
 004259C6    mov         ecx,5AC57C
 004259CB    call        IdentToInt
 004259D0    ret
*}
end;

//004259D4
procedure TGraphicsObject.Changed;
begin
{*
 004259D4    push        ebx
 004259D5    cmp         word ptr [eax+0A],0
>004259DA    je          004259E6
 004259DC    mov         ebx,eax
 004259DE    mov         edx,eax
 004259E0    mov         eax,dword ptr [ebx+0C]
 004259E3    call        dword ptr [ebx+8]
 004259E6    pop         ebx
 004259E7    ret
*}
end;

//004259E8
procedure TGraphicsObject.Lock;
begin
{*
 004259E8    mov         edx,dword ptr [eax+14]
 004259EB    test        edx,edx
>004259ED    je          004259F5
 004259EF    push        edx
 004259F0    call        KERNEL32.EnterCriticalSection
 004259F5    ret
*}
end;

//004259F8
procedure TGraphicsObject.Unlock;
begin
{*
 004259F8    mov         edx,dword ptr [eax+14]
 004259FB    test        edx,edx
>004259FD    je          00425A05
 004259FF    push        edx
 00425A00    call        KERNEL32.LeaveCriticalSection
 00425A05    ret
*}
end;

//00425BBC
function CharsetToIdent(Charset:Longint; var Ident:AnsiString):Boolean;
begin
{*
 00425BBC    push        11
 00425BBE    mov         ecx,5AC71C
 00425BC3    call        IntToIdent
 00425BC8    ret
*}
end;

//00425BCC
function IdentToCharset(const Ident:AnsiString; var Charset:Longint):Boolean;
begin
{*
 00425BCC    push        11
 00425BCE    mov         ecx,5AC71C
 00425BD3    call        IdentToInt
 00425BD8    ret
*}
end;

//00425BDC
function GetFontData(Font:HFONT):TFontData;
begin
{*
 00425BDC    push        ebx
 00425BDD    push        esi
 00425BDE    push        edi
 00425BDF    add         esp,0FFFFFFA0
 00425BE2    mov         ebx,edx
 00425BE4    mov         esi,eax
 00425BE6    push        esi
 00425BE7    mov         edi,ebx
 00425BE9    mov         esi,5AC54C
 00425BEE    mov         ecx,0B
 00425BF3    rep movs    dword ptr [edi],dword ptr [esi]
 00425BF5    pop         esi
 00425BF6    test        esi,esi
>00425BF8    je          00425C87
 00425BFE    push        esp
 00425BFF    push        3C
 00425C01    push        esi
 00425C02    call        gdi32.GetObjectA
 00425C07    test        eax,eax
>00425C09    je          00425C87
 00425C0B    mov         eax,dword ptr [esp]
 00425C0E    mov         dword ptr [ebx+4],eax
 00425C11    cmp         dword ptr [esp+10],2BC
>00425C19    jl          00425C1F
 00425C1B    or          byte ptr [ebx+9],1
 00425C1F    cmp         byte ptr [esp+14],1
>00425C24    jne         00425C2A
 00425C26    or          byte ptr [ebx+9],2
 00425C2A    cmp         byte ptr [esp+15],1
>00425C2F    jne         00425C35
 00425C31    or          byte ptr [ebx+9],4
 00425C35    cmp         byte ptr [esp+16],1
>00425C3A    jne         00425C40
 00425C3C    or          byte ptr [ebx+9],8
 00425C40    mov         al,byte ptr [esp+17]
 00425C44    mov         byte ptr [ebx+0A],al
 00425C47    lea         eax,[esp+3C]
 00425C4B    lea         edx,[esp+1C]
 00425C4F    mov         ecx,20
 00425C54    call        @_CLenToPasStr
 00425C59    lea         edx,[esp+3C]
 00425C5D    lea         eax,[ebx+0B]
 00425C60    mov         cl,1F
 00425C62    call        @PStrNCpy
 00425C67    mov         al,byte ptr [esp+1B]
 00425C6B    and         al,0F
 00425C6D    dec         al
>00425C6F    je          00425C7B
 00425C71    dec         al
>00425C73    jne         00425C81
 00425C75    mov         byte ptr [ebx+8],1
>00425C79    jmp         00425C85
 00425C7B    mov         byte ptr [ebx+8],2
>00425C7F    jmp         00425C85
 00425C81    mov         byte ptr [ebx+8],0
 00425C85    mov         dword ptr [ebx],esi
 00425C87    add         esp,60
 00425C8A    pop         edi
 00425C8B    pop         esi
 00425C8C    pop         ebx
 00425C8D    ret
*}
end;

//00425C90
constructor TFont.Create;
begin
{*
 00425C90    push        ebx
 00425C91    push        esi
 00425C92    test        dl,dl
>00425C94    je          00425C9E
 00425C96    add         esp,0FFFFFFF0
 00425C99    call        @ClassCreate
 00425C9E    mov         ebx,edx
 00425CA0    mov         esi,eax
 00425CA2    xor         eax,eax
 00425CA4    mov         [005AC54C],eax
 00425CA9    mov         edx,5AC54C
 00425CAE    mov         eax,[005E09A8];FontManager:TResourceManager
 00425CB3    call        TResourceManager.AllocResource
 00425CB8    mov         dword ptr [esi+10],eax
 00425CBB    mov         dword ptr [esi+18],0FF000008
 00425CC2    mov         eax,[005E0964];ScreenLogPixels:Integer
 00425CC7    mov         dword ptr [esi+1C],eax
 00425CCA    mov         eax,esi
 00425CCC    test        bl,bl
>00425CCE    je          00425CDF
 00425CD0    call        @AfterConstruction
 00425CD5    pop         dword ptr fs:[0]
 00425CDC    add         esp,0C
 00425CDF    mov         eax,esi
 00425CE1    pop         esi
 00425CE2    pop         ebx
 00425CE3    ret
*}
end;

//00425CE4
destructor TFont.Destroy;
begin
{*
 00425CE4    push        ebx
 00425CE5    push        esi
 00425CE6    call        @BeforeDestruction
 00425CEB    mov         ebx,edx
 00425CED    mov         esi,eax
 00425CEF    mov         edx,dword ptr [esi+10]
 00425CF2    mov         eax,[005E09A8];FontManager:TResourceManager
 00425CF7    call        TResourceManager.FreeResource
 00425CFC    test        bl,bl
>00425CFE    jle         00425D07
 00425D00    mov         eax,esi
 00425D02    call        @ClassDestroy
 00425D07    pop         esi
 00425D08    pop         ebx
 00425D09    ret
*}
end;

//00425D0C
procedure TFont.Changed;
begin
{*
 00425D0C    push        ebx
 00425D0D    mov         ebx,eax
 00425D0F    mov         eax,ebx
 00425D11    call        TGraphicsObject.Changed
 00425D16    cmp         dword ptr [ebx+20],0
>00425D1A    je          00425D24
 00425D1C    mov         eax,dword ptr [ebx+20]
 00425D1F    mov         edx,dword ptr [eax]
 00425D21    call        dword ptr [edx+0C]
 00425D24    pop         ebx
 00425D25    ret
*}
end;

//00425D28
procedure TFont.Assign(Source:TPersistent);
begin
{*
 00425D28    push        ebp
 00425D29    mov         ebp,esp
 00425D2B    add         esp,0FFFFFFF8
 00425D2E    push        ebx
 00425D2F    mov         dword ptr [ebp-8],edx
 00425D32    mov         dword ptr [ebp-4],eax
 00425D35    mov         eax,dword ptr [ebp-8]
 00425D38    mov         edx,dword ptr ds:[42451C];TFont
 00425D3E    call        @IsClass
 00425D43    test        al,al
>00425D45    je          00425DEA
 00425D4B    mov         eax,dword ptr [ebp-4]
 00425D4E    call        TGraphicsObject.Lock
 00425D53    xor         eax,eax
 00425D55    push        ebp
 00425D56    push        425DE3
 00425D5B    push        dword ptr fs:[eax]
 00425D5E    mov         dword ptr fs:[eax],esp
 00425D61    mov         ebx,dword ptr [ebp-8]
 00425D64    mov         eax,ebx
 00425D66    call        TGraphicsObject.Lock
 00425D6B    xor         eax,eax
 00425D6D    push        ebp
 00425D6E    push        425DC6
 00425D73    push        dword ptr fs:[eax]
 00425D76    mov         dword ptr fs:[eax],esp
 00425D79    mov         ecx,dword ptr [ebx+10]
 00425D7C    mov         edx,dword ptr [ebp-4]
 00425D7F    mov         eax,[005E09A8];FontManager:TResourceManager
 00425D84    call        TResourceManager.AssignResource
 00425D89    mov         edx,dword ptr [ebx+18]
 00425D8C    mov         eax,dword ptr [ebp-4]
 00425D8F    call        TFont.SetColor
 00425D94    mov         eax,dword ptr [ebp-4]
 00425D97    mov         eax,dword ptr [eax+1C]
 00425D9A    cmp         eax,dword ptr [ebx+1C]
>00425D9D    je          00425DB0
 00425D9F    mov         eax,ebx
 00425DA1    call        TFont.GetSize
 00425DA6    mov         edx,eax
 00425DA8    mov         eax,dword ptr [ebp-4]
 00425DAB    call        TFont.SetSize
 00425DB0    xor         eax,eax
 00425DB2    pop         edx
 00425DB3    pop         ecx
 00425DB4    pop         ecx
 00425DB5    mov         dword ptr fs:[eax],edx
 00425DB8    push        425DCD
 00425DBD    mov         eax,dword ptr [ebp-8]
 00425DC0    call        TGraphicsObject.Unlock
 00425DC5    ret
>00425DC6    jmp         @HandleFinally
>00425DCB    jmp         00425DBD
 00425DCD    xor         eax,eax
 00425DCF    pop         edx
 00425DD0    pop         ecx
 00425DD1    pop         ecx
 00425DD2    mov         dword ptr fs:[eax],edx
 00425DD5    push        425DF5
 00425DDA    mov         eax,dword ptr [ebp-4]
 00425DDD    call        TGraphicsObject.Unlock
 00425DE2    ret
>00425DE3    jmp         @HandleFinally
>00425DE8    jmp         00425DDA
 00425DEA    mov         edx,dword ptr [ebp-8]
 00425DED    mov         eax,dword ptr [ebp-4]
 00425DF0    call        TPersistent.Assign
 00425DF5    pop         ebx
 00425DF6    pop         ecx
 00425DF7    pop         ecx
 00425DF8    pop         ebp
 00425DF9    ret
*}
end;

//00425DFC
procedure TFont.GetData(var FontData:TFontData);
begin
{*
 00425DFC    push        esi
 00425DFD    push        edi
 00425DFE    mov         eax,dword ptr [eax+10]
 00425E01    lea         esi,[eax+10]
 00425E04    mov         edi,edx
 00425E06    mov         ecx,0B
 00425E0B    rep movs    dword ptr [edi],dword ptr [esi]
 00425E0D    xor         eax,eax
 00425E0F    mov         dword ptr [edx],eax
 00425E11    pop         edi
 00425E12    pop         esi
 00425E13    ret
*}
end;

//00425E14
procedure TFont.SetData(const FontData:TFontData);
begin
{*
 00425E14    push        ebp
 00425E15    mov         ebp,esp
 00425E17    push        ecx
 00425E18    push        ebx
 00425E19    mov         ebx,edx
 00425E1B    mov         dword ptr [ebp-4],eax
 00425E1E    mov         eax,dword ptr [ebp-4]
 00425E21    call        TGraphicsObject.Lock
 00425E26    xor         eax,eax
 00425E28    push        ebp
 00425E29    push        425E59
 00425E2E    push        dword ptr fs:[eax]
 00425E31    mov         dword ptr fs:[eax],esp
 00425E34    mov         ecx,ebx
 00425E36    mov         edx,dword ptr [ebp-4]
 00425E39    mov         eax,[005E09A8];FontManager:TResourceManager
 00425E3E    call        TResourceManager.ChangeResource
 00425E43    xor         eax,eax
 00425E45    pop         edx
 00425E46    pop         ecx
 00425E47    pop         ecx
 00425E48    mov         dword ptr fs:[eax],edx
 00425E4B    push        425E60
 00425E50    mov         eax,dword ptr [ebp-4]
 00425E53    call        TGraphicsObject.Unlock
 00425E58    ret
>00425E59    jmp         @HandleFinally
>00425E5E    jmp         00425E50
 00425E60    pop         ebx
 00425E61    pop         ecx
 00425E62    pop         ebp
 00425E63    ret
*}
end;

//00425E64
procedure TFont.SetColor(Value:TColor);
begin
{*
 00425E64    push        esi
 00425E65    cmp         edx,dword ptr [eax+18]
>00425E68    je          00425E76
 00425E6A    mov         dword ptr [eax+18],edx
 00425E6D    mov         si,0FFFD
 00425E71    call        @CallDynaInst
 00425E76    pop         esi
 00425E77    ret
*}
end;

//00425E78
function TFont.GetHandle:HFONT;
begin
{*
 00425E78    push        ebp
 00425E79    mov         ebp,esp
 00425E7B    add         esp,0FFFFFFB4
 00425E7E    push        ebx
 00425E7F    xor         edx,edx
 00425E81    mov         dword ptr [ebp-4C],edx
 00425E84    mov         dword ptr [ebp-48],edx
 00425E87    mov         dword ptr [ebp-44],edx
 00425E8A    mov         ebx,eax
 00425E8C    xor         eax,eax
 00425E8E    push        ebp
 00425E8F    push        426001
 00425E94    push        dword ptr fs:[eax]
 00425E97    mov         dword ptr fs:[eax],esp
 00425E9A    mov         eax,dword ptr [ebx+10]
 00425E9D    mov         dword ptr [ebp-4],eax
 00425EA0    mov         eax,dword ptr [ebp-4]
 00425EA3    cmp         dword ptr [eax+8],0
>00425EA7    jne         00425FE0
 00425EAD    mov         eax,[005E09A8];FontManager:TResourceManager
 00425EB2    call        TResourceManager.Lock
 00425EB7    xor         eax,eax
 00425EB9    push        ebp
 00425EBA    push        425FD9
 00425EBF    push        dword ptr fs:[eax]
 00425EC2    mov         dword ptr fs:[eax],esp
 00425EC5    mov         eax,dword ptr [ebp-4]
 00425EC8    cmp         dword ptr [eax+8],0
>00425ECC    jne         00425FC1
 00425ED2    mov         eax,dword ptr [ebp-4]
 00425ED5    mov         eax,dword ptr [eax+14]
 00425ED8    mov         dword ptr [ebp-40],eax
 00425EDB    xor         eax,eax
 00425EDD    mov         dword ptr [ebp-3C],eax
 00425EE0    xor         eax,eax
 00425EE2    mov         dword ptr [ebp-38],eax
 00425EE5    xor         eax,eax
 00425EE7    mov         dword ptr [ebp-34],eax
 00425EEA    mov         eax,dword ptr [ebp-4]
 00425EED    test        byte ptr [eax+19],1
>00425EF1    je          00425EFC
 00425EF3    mov         dword ptr [ebp-30],2BC
>00425EFA    jmp         00425F03
 00425EFC    mov         dword ptr [ebp-30],190
 00425F03    mov         eax,dword ptr [ebp-4]
 00425F06    test        byte ptr [eax+19],2
 00425F0A    setne       al
 00425F0D    mov         byte ptr [ebp-2C],al
 00425F10    mov         eax,dword ptr [ebp-4]
 00425F13    test        byte ptr [eax+19],4
 00425F17    setne       al
 00425F1A    mov         byte ptr [ebp-2B],al
 00425F1D    mov         eax,dword ptr [ebp-4]
 00425F20    test        byte ptr [eax+19],8
 00425F24    setne       al
 00425F27    mov         byte ptr [ebp-2A],al
 00425F2A    mov         eax,dword ptr [ebp-4]
 00425F2D    mov         al,byte ptr [eax+1A]
 00425F30    mov         byte ptr [ebp-29],al
 00425F33    lea         eax,[ebp-44]
 00425F36    mov         edx,dword ptr [ebp-4]
 00425F39    add         edx,1B
 00425F3C    call        @LStrFromString
 00425F41    mov         eax,dword ptr [ebp-44]
 00425F44    mov         edx,426018;'Default'
 00425F49    call        AnsiCompareText
 00425F4E    test        eax,eax
>00425F50    jne         00425F6C
 00425F52    lea         eax,[ebp-48]
 00425F55    mov         edx,5AC557
 00425F5A    call        @LStrFromString
 00425F5F    mov         edx,dword ptr [ebp-48]
 00425F62    lea         eax,[ebp-24]
 00425F65    call        StrPCopy
>00425F6A    jmp         00425F85
 00425F6C    lea         eax,[ebp-4C]
 00425F6F    mov         edx,dword ptr [ebp-4]
 00425F72    add         edx,1B
 00425F75    call        @LStrFromString
 00425F7A    mov         edx,dword ptr [ebp-4C]
 00425F7D    lea         eax,[ebp-24]
 00425F80    call        StrPCopy
 00425F85    mov         byte ptr [ebp-26],0
 00425F89    mov         byte ptr [ebp-28],0
 00425F8D    mov         byte ptr [ebp-27],0
 00425F91    mov         eax,ebx
 00425F93    call        TFont.GetPitch
 00425F98    dec         al
>00425F9A    je          00425FA2
 00425F9C    dec         al
>00425F9E    je          00425FA8
>00425FA0    jmp         00425FAE
 00425FA2    mov         byte ptr [ebp-25],2
>00425FA6    jmp         00425FB2
 00425FA8    mov         byte ptr [ebp-25],1
>00425FAC    jmp         00425FB2
 00425FAE    mov         byte ptr [ebp-25],0
 00425FB2    lea         eax,[ebp-40]
 00425FB5    push        eax
 00425FB6    call        gdi32.CreateFontIndirectA
 00425FBB    mov         edx,dword ptr [ebp-4]
 00425FBE    mov         dword ptr [edx+8],eax
 00425FC1    xor         eax,eax
 00425FC3    pop         edx
 00425FC4    pop         ecx
 00425FC5    pop         ecx
 00425FC6    mov         dword ptr fs:[eax],edx
 00425FC9    push        425FE0
 00425FCE    mov         eax,[005E09A8];FontManager:TResourceManager
 00425FD3    call        TResourceManager.Unlock
 00425FD8    ret
>00425FD9    jmp         @HandleFinally
>00425FDE    jmp         00425FCE
 00425FE0    mov         eax,dword ptr [ebp-4]
 00425FE3    mov         ebx,dword ptr [eax+8]
 00425FE6    xor         eax,eax
 00425FE8    pop         edx
 00425FE9    pop         ecx
 00425FEA    pop         ecx
 00425FEB    mov         dword ptr fs:[eax],edx
 00425FEE    push        426008
 00425FF3    lea         eax,[ebp-4C]
 00425FF6    mov         edx,3
 00425FFB    call        @LStrArrayClr
 00426000    ret
>00426001    jmp         @HandleFinally
>00426006    jmp         00425FF3
 00426008    mov         eax,ebx
 0042600A    pop         ebx
 0042600B    mov         esp,ebp
 0042600D    pop         ebp
 0042600E    ret
*}
end;

//00426020
procedure TFont.SetHandle(Value:HFONT);
begin
{*
 00426020    push        ebx
 00426021    push        esi
 00426022    add         esp,0FFFFFFD4
 00426025    mov         esi,edx
 00426027    mov         ebx,eax
 00426029    mov         edx,esp
 0042602B    mov         eax,esi
 0042602D    call        GetFontData
 00426032    mov         edx,esp
 00426034    mov         eax,ebx
 00426036    call        TFont.SetData
 0042603B    add         esp,2C
 0042603E    pop         esi
 0042603F    pop         ebx
 00426040    ret
*}
end;

//00426044
function TFont.GetHeight:Integer;
begin
{*
 00426044    mov         eax,dword ptr [eax+10]
 00426047    mov         eax,dword ptr [eax+14]
 0042604A    ret
*}
end;

//0042604C
procedure TFont.SetHeight(Value:Integer);
begin
{*
 0042604C    push        ebx
 0042604D    push        esi
 0042604E    add         esp,0FFFFFFD4
 00426051    mov         esi,edx
 00426053    mov         ebx,eax
 00426055    mov         edx,esp
 00426057    mov         eax,ebx
 00426059    call        TFont.GetData
 0042605E    mov         dword ptr [esp+4],esi
 00426062    mov         edx,esp
 00426064    mov         eax,ebx
 00426066    call        TFont.SetData
 0042606B    add         esp,2C
 0042606E    pop         esi
 0042606F    pop         ebx
 00426070    ret
*}
end;

//00426074
function TFont.GetName:TFontName;
begin
{*
 00426074    push        ebx
 00426075    push        esi
 00426076    mov         esi,edx
 00426078    mov         ebx,eax
 0042607A    mov         eax,esi
 0042607C    mov         edx,dword ptr [ebx+10]
 0042607F    add         edx,1B
 00426082    call        @LStrFromString
 00426087    pop         esi
 00426088    pop         ebx
 00426089    ret
*}
end;

//0042608C
procedure TFont.SetName(const Value:TFontName);
begin
{*
 0042608C    push        ebx
 0042608D    push        esi
 0042608E    add         esp,0FFFFFED4
 00426094    mov         esi,edx
 00426096    mov         ebx,eax
 00426098    test        esi,esi
>0042609A    je          004260DD
 0042609C    mov         edx,esp
 0042609E    mov         eax,ebx
 004260A0    call        TFont.GetData
 004260A5    lea         eax,[esp+0B]
 004260A9    xor         ecx,ecx
 004260AB    mov         edx,20
 004260B0    call        @FillChar
 004260B5    lea         eax,[esp+2C]
 004260B9    mov         edx,esi
 004260BB    mov         ecx,0FF
 004260C0    call        @LStrToString
 004260C5    lea         edx,[esp+2C]
 004260C9    lea         eax,[esp+0B]
 004260CD    mov         cl,1F
 004260CF    call        @PStrNCpy
 004260D4    mov         edx,esp
 004260D6    mov         eax,ebx
 004260D8    call        TFont.SetData
 004260DD    add         esp,12C
 004260E3    pop         esi
 004260E4    pop         ebx
 004260E5    ret
*}
end;

//004260E8
function TFont.GetSize:Integer;
begin
{*
 004260E8    push        ebx
 004260E9    mov         ebx,eax
 004260EB    mov         eax,dword ptr [ebx+1C]
 004260EE    push        eax
 004260EF    push        48
 004260F1    mov         eax,ebx
 004260F3    call        TFont.GetHeight
 004260F8    push        eax
 004260F9    call        KERNEL32.MulDiv
 004260FE    neg         eax
 00426100    pop         ebx
 00426101    ret
*}
end;

//00426104
procedure TFont.SetSize(Value:Integer);
begin
{*
 00426104    push        ebx
 00426105    push        esi
 00426106    mov         esi,edx
 00426108    mov         ebx,eax
 0042610A    push        48
 0042610C    mov         eax,dword ptr [ebx+1C]
 0042610F    push        eax
 00426110    push        esi
 00426111    call        KERNEL32.MulDiv
 00426116    mov         edx,eax
 00426118    neg         edx
 0042611A    mov         eax,ebx
 0042611C    call        TFont.SetHeight
 00426121    pop         esi
 00426122    pop         ebx
 00426123    ret
*}
end;

//00426124
function TFont.GetStyle:TFontStyles;
begin
{*
 00426124    mov         eax,dword ptr [eax+10]
 00426127    mov         dl,byte ptr [eax+19]
 0042612A    mov         eax,edx
 0042612C    ret
*}
end;

//00426130
procedure TFont.SetStyle(Value:TFontStyles);
begin
{*
 00426130    push        ebx
 00426131    add         esp,0FFFFFFD0
 00426134    mov         byte ptr [esp],dl
 00426137    mov         ebx,eax
 00426139    lea         edx,[esp+4]
 0042613D    mov         eax,ebx
 0042613F    call        TFont.GetData
 00426144    mov         al,byte ptr [esp]
 00426147    mov         byte ptr [esp+0D],al
 0042614B    lea         edx,[esp+4]
 0042614F    mov         eax,ebx
 00426151    call        TFont.SetData
 00426156    add         esp,30
 00426159    pop         ebx
 0042615A    ret
*}
end;

//0042615C
function TFont.GetPitch:TFontPitch;
begin
{*
 0042615C    mov         eax,dword ptr [eax+10]
 0042615F    mov         al,byte ptr [eax+18]
 00426162    ret
*}
end;

//00426164
procedure TFont.SetPitch(Value:TFontPitch);
begin
{*
 00426164    push        ebx
 00426165    push        esi
 00426166    add         esp,0FFFFFFD4
 00426169    mov         ebx,edx
 0042616B    mov         esi,eax
 0042616D    mov         edx,esp
 0042616F    mov         eax,esi
 00426171    call        TFont.GetData
 00426176    mov         byte ptr [esp+8],bl
 0042617A    mov         edx,esp
 0042617C    mov         eax,esi
 0042617E    call        TFont.SetData
 00426183    add         esp,2C
 00426186    pop         esi
 00426187    pop         ebx
 00426188    ret
*}
end;

//0042618C
{*function TFont.GetCharset:?;
begin
 0042618C    mov         eax,dword ptr [eax+10];TFont.FResource:PResource
 0042618F    mov         al,byte ptr [eax+1A]
 00426192    ret
end;*}

//00426194
procedure TFont.SetCharset(Value:TFontCharset);
begin
{*
 00426194    push        ebx
 00426195    push        esi
 00426196    add         esp,0FFFFFFD4
 00426199    mov         ebx,edx
 0042619B    mov         esi,eax
 0042619D    mov         edx,esp
 0042619F    mov         eax,esi
 004261A1    call        TFont.GetData
 004261A6    mov         byte ptr [esp+0A],bl
 004261AA    mov         edx,esp
 004261AC    mov         eax,esi
 004261AE    call        TFont.SetData
 004261B3    add         esp,2C
 004261B6    pop         esi
 004261B7    pop         ebx
 004261B8    ret
*}
end;

//004261BC
constructor TPen.Create;
begin
{*
 004261BC    push        ebx
 004261BD    push        esi
 004261BE    test        dl,dl
>004261C0    je          004261CA
 004261C2    add         esp,0FFFFFFF0
 004261C5    call        @ClassCreate
 004261CA    mov         ebx,edx
 004261CC    mov         esi,eax
 004261CE    mov         edx,5AC7AC
 004261D3    mov         eax,[005E09AC];PenManager:TResourceManager
 004261D8    call        TResourceManager.AllocResource
 004261DD    mov         dword ptr [esi+10],eax
 004261E0    mov         byte ptr [esi+18],4
 004261E4    mov         eax,esi
 004261E6    test        bl,bl
>004261E8    je          004261F9
 004261EA    call        @AfterConstruction
 004261EF    pop         dword ptr fs:[0]
 004261F6    add         esp,0C
 004261F9    mov         eax,esi
 004261FB    pop         esi
 004261FC    pop         ebx
 004261FD    ret
*}
end;

//00426200
destructor TPen.Destroy;
begin
{*
 00426200    push        ebx
 00426201    push        esi
 00426202    call        @BeforeDestruction
 00426207    mov         ebx,edx
 00426209    mov         esi,eax
 0042620B    mov         edx,dword ptr [esi+10]
 0042620E    mov         eax,[005E09AC];PenManager:TResourceManager
 00426213    call        TResourceManager.FreeResource
 00426218    test        bl,bl
>0042621A    jle         00426223
 0042621C    mov         eax,esi
 0042621E    call        @ClassDestroy
 00426223    pop         esi
 00426224    pop         ebx
 00426225    ret
*}
end;

//00426228
procedure TPen.Assign(Source:TPersistent);
begin
{*
 00426228    push        ebp
 00426229    mov         ebp,esp
 0042622B    add         esp,0FFFFFFF8
 0042622E    push        ebx
 0042622F    mov         dword ptr [ebp-8],edx
 00426232    mov         dword ptr [ebp-4],eax
 00426235    mov         eax,dword ptr [ebp-8]
 00426238    mov         edx,dword ptr ds:[424698];TPen
 0042623E    call        @IsClass
 00426243    test        al,al
>00426245    je          004262CE
 0042624B    mov         eax,dword ptr [ebp-4]
 0042624E    call        TGraphicsObject.Lock
 00426253    xor         eax,eax
 00426255    push        ebp
 00426256    push        4262C7
 0042625B    push        dword ptr fs:[eax]
 0042625E    mov         dword ptr fs:[eax],esp
 00426261    mov         ebx,dword ptr [ebp-8]
 00426264    mov         eax,ebx
 00426266    call        TGraphicsObject.Lock
 0042626B    xor         eax,eax
 0042626D    push        ebp
 0042626E    push        4262AA
 00426273    push        dword ptr fs:[eax]
 00426276    mov         dword ptr fs:[eax],esp
 00426279    mov         ecx,dword ptr [ebx+10]
 0042627C    mov         edx,dword ptr [ebp-4]
 0042627F    mov         eax,[005E09AC];PenManager:TResourceManager
 00426284    call        TResourceManager.AssignResource
 00426289    mov         dl,byte ptr [ebx+18]
 0042628C    mov         eax,dword ptr [ebp-4]
 0042628F    call        TPen.SetMode
 00426294    xor         eax,eax
 00426296    pop         edx
 00426297    pop         ecx
 00426298    pop         ecx
 00426299    mov         dword ptr fs:[eax],edx
 0042629C    push        4262B1
 004262A1    mov         eax,dword ptr [ebp-8]
 004262A4    call        TGraphicsObject.Unlock
 004262A9    ret
>004262AA    jmp         @HandleFinally
>004262AF    jmp         004262A1
 004262B1    xor         eax,eax
 004262B3    pop         edx
 004262B4    pop         ecx
 004262B5    pop         ecx
 004262B6    mov         dword ptr fs:[eax],edx
 004262B9    push        4262D9
 004262BE    mov         eax,dword ptr [ebp-4]
 004262C1    call        TGraphicsObject.Unlock
 004262C6    ret
>004262C7    jmp         @HandleFinally
>004262CC    jmp         004262BE
 004262CE    mov         edx,dword ptr [ebp-8]
 004262D1    mov         eax,dword ptr [ebp-4]
 004262D4    call        TPersistent.Assign
 004262D9    pop         ebx
 004262DA    pop         ecx
 004262DB    pop         ecx
 004262DC    pop         ebp
 004262DD    ret
*}
end;

//004262E0
procedure TPen.GetData(var PenData:TPenData);
begin
{*
 004262E0    push        esi
 004262E1    push        edi
 004262E2    mov         eax,dword ptr [eax+10]
 004262E5    lea         esi,[eax+10]
 004262E8    mov         edi,edx
 004262EA    movs        dword ptr [edi],dword ptr [esi]
 004262EB    movs        dword ptr [edi],dword ptr [esi]
 004262EC    movs        dword ptr [edi],dword ptr [esi]
 004262ED    movs        dword ptr [edi],dword ptr [esi]
 004262EE    xor         eax,eax
 004262F0    mov         dword ptr [edx],eax
 004262F2    pop         edi
 004262F3    pop         esi
 004262F4    ret
*}
end;

//004262F8
procedure TPen.SetData(const PenData:TPenData);
begin
{*
 004262F8    push        ebp
 004262F9    mov         ebp,esp
 004262FB    push        ecx
 004262FC    push        ebx
 004262FD    mov         ebx,edx
 004262FF    mov         dword ptr [ebp-4],eax
 00426302    mov         eax,dword ptr [ebp-4]
 00426305    call        TGraphicsObject.Lock
 0042630A    xor         eax,eax
 0042630C    push        ebp
 0042630D    push        42633D
 00426312    push        dword ptr fs:[eax]
 00426315    mov         dword ptr fs:[eax],esp
 00426318    mov         ecx,ebx
 0042631A    mov         edx,dword ptr [ebp-4]
 0042631D    mov         eax,[005E09AC];PenManager:TResourceManager
 00426322    call        TResourceManager.ChangeResource
 00426327    xor         eax,eax
 00426329    pop         edx
 0042632A    pop         ecx
 0042632B    pop         ecx
 0042632C    mov         dword ptr fs:[eax],edx
 0042632F    push        426344
 00426334    mov         eax,dword ptr [ebp-4]
 00426337    call        TGraphicsObject.Unlock
 0042633C    ret
>0042633D    jmp         @HandleFinally
>00426342    jmp         00426334
 00426344    pop         ebx
 00426345    pop         ecx
 00426346    pop         ebp
 00426347    ret
*}
end;

//00426348
{*function TPen.GetColor:?;
begin
 00426348    mov         eax,dword ptr [eax+10];TPen.FResource:PResource
 0042634B    mov         eax,dword ptr [eax+14]
 0042634E    ret
end;*}

//00426350
procedure TPen.SetColor(Value:TColor);
begin
{*
 00426350    push        ebx
 00426351    push        esi
 00426352    add         esp,0FFFFFFF0
 00426355    mov         esi,edx
 00426357    mov         ebx,eax
 00426359    mov         edx,esp
 0042635B    mov         eax,ebx
 0042635D    call        TPen.GetData
 00426362    mov         dword ptr [esp+4],esi
 00426366    mov         edx,esp
 00426368    mov         eax,ebx
 0042636A    call        TPen.SetData
 0042636F    add         esp,10
 00426372    pop         esi
 00426373    pop         ebx
 00426374    ret
*}
end;

//00426378
function TPen.GetHandle:HPEN;
begin
{*
 00426378    push        ebp
 00426379    mov         ebp,esp
 0042637B    add         esp,0FFFFFFEC
 0042637E    mov         eax,dword ptr [eax+10]
 00426381    mov         dword ptr [ebp-4],eax
 00426384    mov         eax,dword ptr [ebp-4]
 00426387    cmp         dword ptr [eax+8],0
>0042638B    jne         00426405
 0042638D    mov         eax,[005E09AC];PenManager:TResourceManager
 00426392    call        TResourceManager.Lock
 00426397    xor         eax,eax
 00426399    push        ebp
 0042639A    push        4263FE
 0042639F    push        dword ptr fs:[eax]
 004263A2    mov         dword ptr fs:[eax],esp
 004263A5    mov         eax,dword ptr [ebp-4]
 004263A8    cmp         dword ptr [eax+8],0
>004263AC    jne         004263E6
 004263AE    mov         eax,dword ptr [ebp-4]
 004263B1    movzx       eax,byte ptr [eax+1C]
 004263B5    movzx       eax,word ptr [eax*2+5AC7BC]
 004263BD    mov         dword ptr [ebp-14],eax
 004263C0    mov         eax,dword ptr [ebp-4]
 004263C3    mov         eax,dword ptr [eax+18]
 004263C6    mov         dword ptr [ebp-10],eax
 004263C9    mov         eax,dword ptr [ebp-4]
 004263CC    mov         eax,dword ptr [eax+14]
 004263CF    call        ColorToRGB
 004263D4    mov         dword ptr [ebp-8],eax
 004263D7    lea         eax,[ebp-14]
 004263DA    push        eax
 004263DB    call        gdi32.CreatePenIndirect
 004263E0    mov         edx,dword ptr [ebp-4]
 004263E3    mov         dword ptr [edx+8],eax
 004263E6    xor         eax,eax
 004263E8    pop         edx
 004263E9    pop         ecx
 004263EA    pop         ecx
 004263EB    mov         dword ptr fs:[eax],edx
 004263EE    push        426405
 004263F3    mov         eax,[005E09AC];PenManager:TResourceManager
 004263F8    call        TResourceManager.Unlock
 004263FD    ret
>004263FE    jmp         @HandleFinally
>00426403    jmp         004263F3
 00426405    mov         eax,dword ptr [ebp-4]
 00426408    mov         eax,dword ptr [eax+8]
 0042640B    mov         esp,ebp
 0042640D    pop         ebp
 0042640E    ret
*}
end;

//00426410
procedure TPen.SetMode(Value:TPenMode);
begin
{*
 00426410    push        esi
 00426411    cmp         dl,byte ptr [eax+18]
>00426414    je          00426422
 00426416    mov         byte ptr [eax+18],dl
 00426419    mov         si,0FFFD
 0042641D    call        @CallDynaInst
 00426422    pop         esi
 00426423    ret
*}
end;

//00426424
{*function TPen.GetStyle:?;
begin
 00426424    mov         eax,dword ptr [eax+10];TPen.FResource:PResource
 00426427    mov         al,byte ptr [eax+1C]
 0042642A    ret
end;*}

//0042642C
procedure TPen.SetStyle(Value:TPenStyle);
begin
{*
 0042642C    push        ebx
 0042642D    push        esi
 0042642E    add         esp,0FFFFFFF0
 00426431    mov         ebx,edx
 00426433    mov         esi,eax
 00426435    mov         edx,esp
 00426437    mov         eax,esi
 00426439    call        TPen.GetData
 0042643E    mov         byte ptr [esp+0C],bl
 00426442    mov         edx,esp
 00426444    mov         eax,esi
 00426446    call        TPen.SetData
 0042644B    add         esp,10
 0042644E    pop         esi
 0042644F    pop         ebx
 00426450    ret
*}
end;

//00426454
{*function TPen.GetWidth:?;
begin
 00426454    mov         eax,dword ptr [eax+10];TPen.FResource:PResource
 00426457    mov         eax,dword ptr [eax+18]
 0042645A    ret
end;*}

//0042645C
procedure TPen.SetWidth(Value:Integer);
begin
{*
 0042645C    push        ebx
 0042645D    push        esi
 0042645E    add         esp,0FFFFFFF0
 00426461    mov         esi,edx
 00426463    mov         ebx,eax
 00426465    test        esi,esi
>00426467    jl          0042647F
 00426469    mov         edx,esp
 0042646B    mov         eax,ebx
 0042646D    call        TPen.GetData
 00426472    mov         dword ptr [esp+8],esi
 00426476    mov         edx,esp
 00426478    mov         eax,ebx
 0042647A    call        TPen.SetData
 0042647F    add         esp,10
 00426482    pop         esi
 00426483    pop         ebx
 00426484    ret
*}
end;

//00426488
constructor TBrush.Create;
begin
{*
 00426488    push        ebx
 00426489    push        esi
 0042648A    test        dl,dl
>0042648C    je          00426496
 0042648E    add         esp,0FFFFFFF0
 00426491    call        @ClassCreate
 00426496    mov         ebx,edx
 00426498    mov         esi,eax
 0042649A    mov         edx,5AC7CC
 0042649F    mov         eax,[005E09B0];BrushManager:TResourceManager
 004264A4    call        TResourceManager.AllocResource
 004264A9    mov         dword ptr [esi+10],eax
 004264AC    mov         eax,esi
 004264AE    test        bl,bl
>004264B0    je          004264C1
 004264B2    call        @AfterConstruction
 004264B7    pop         dword ptr fs:[0]
 004264BE    add         esp,0C
 004264C1    mov         eax,esi
 004264C3    pop         esi
 004264C4    pop         ebx
 004264C5    ret
*}
end;

//004264C8
destructor TBrush.Destroy;
begin
{*
 004264C8    push        ebx
 004264C9    push        esi
 004264CA    call        @BeforeDestruction
 004264CF    mov         ebx,edx
 004264D1    mov         esi,eax
 004264D3    mov         edx,dword ptr [esi+10]
 004264D6    mov         eax,[005E09B0];BrushManager:TResourceManager
 004264DB    call        TResourceManager.FreeResource
 004264E0    test        bl,bl
>004264E2    jle         004264EB
 004264E4    mov         eax,esi
 004264E6    call        @ClassDestroy
 004264EB    pop         esi
 004264EC    pop         ebx
 004264ED    ret
*}
end;

//004264F0
procedure TBrush.Assign(Source:TPersistent);
begin
{*
 004264F0    push        ebp
 004264F1    mov         ebp,esp
 004264F3    add         esp,0FFFFFFF8
 004264F6    push        ebx
 004264F7    mov         dword ptr [ebp-8],edx
 004264FA    mov         dword ptr [ebp-4],eax
 004264FD    mov         eax,dword ptr [ebp-8]
 00426500    mov         edx,dword ptr ds:[424798];TBrush
 00426506    call        @IsClass
 0042650B    test        al,al
>0042650D    je          00426587
 0042650F    mov         eax,dword ptr [ebp-4]
 00426512    call        TGraphicsObject.Lock
 00426517    xor         eax,eax
 00426519    push        ebp
 0042651A    push        426580
 0042651F    push        dword ptr fs:[eax]
 00426522    mov         dword ptr fs:[eax],esp
 00426525    mov         ebx,dword ptr [ebp-8]
 00426528    mov         eax,ebx
 0042652A    call        TGraphicsObject.Lock
 0042652F    xor         eax,eax
 00426531    push        ebp
 00426532    push        426563
 00426537    push        dword ptr fs:[eax]
 0042653A    mov         dword ptr fs:[eax],esp
 0042653D    mov         ecx,dword ptr [ebx+10]
 00426540    mov         edx,dword ptr [ebp-4]
 00426543    mov         eax,[005E09B0];BrushManager:TResourceManager
 00426548    call        TResourceManager.AssignResource
 0042654D    xor         eax,eax
 0042654F    pop         edx
 00426550    pop         ecx
 00426551    pop         ecx
 00426552    mov         dword ptr fs:[eax],edx
 00426555    push        42656A
 0042655A    mov         eax,dword ptr [ebp-8]
 0042655D    call        TGraphicsObject.Unlock
 00426562    ret
>00426563    jmp         @HandleFinally
>00426568    jmp         0042655A
 0042656A    xor         eax,eax
 0042656C    pop         edx
 0042656D    pop         ecx
 0042656E    pop         ecx
 0042656F    mov         dword ptr fs:[eax],edx
 00426572    push        426592
 00426577    mov         eax,dword ptr [ebp-4]
 0042657A    call        TGraphicsObject.Unlock
 0042657F    ret
>00426580    jmp         @HandleFinally
>00426585    jmp         00426577
 00426587    mov         edx,dword ptr [ebp-8]
 0042658A    mov         eax,dword ptr [ebp-4]
 0042658D    call        TPersistent.Assign
 00426592    pop         ebx
 00426593    pop         ecx
 00426594    pop         ecx
 00426595    pop         ebp
 00426596    ret
*}
end;

//00426598
procedure TBrush.GetData(var BrushData:TBrushData);
begin
{*
 00426598    push        esi
 00426599    push        edi
 0042659A    mov         eax,dword ptr [eax+10]
 0042659D    lea         esi,[eax+10]
 004265A0    mov         edi,edx
 004265A2    movs        dword ptr [edi],dword ptr [esi]
 004265A3    movs        dword ptr [edi],dword ptr [esi]
 004265A4    movs        dword ptr [edi],dword ptr [esi]
 004265A5    movs        dword ptr [edi],dword ptr [esi]
 004265A6    xor         eax,eax
 004265A8    mov         dword ptr [edx],eax
 004265AA    xor         eax,eax
 004265AC    mov         dword ptr [edx+8],eax
 004265AF    pop         edi
 004265B0    pop         esi
 004265B1    ret
*}
end;

//004265B4
procedure TBrush.SetData(const BrushData:TBrushData);
begin
{*
 004265B4    push        ebp
 004265B5    mov         ebp,esp
 004265B7    push        ecx
 004265B8    push        ebx
 004265B9    mov         ebx,edx
 004265BB    mov         dword ptr [ebp-4],eax
 004265BE    mov         eax,dword ptr [ebp-4]
 004265C1    call        TGraphicsObject.Lock
 004265C6    xor         eax,eax
 004265C8    push        ebp
 004265C9    push        4265F9
 004265CE    push        dword ptr fs:[eax]
 004265D1    mov         dword ptr fs:[eax],esp
 004265D4    mov         ecx,ebx
 004265D6    mov         edx,dword ptr [ebp-4]
 004265D9    mov         eax,[005E09B0];BrushManager:TResourceManager
 004265DE    call        TResourceManager.ChangeResource
 004265E3    xor         eax,eax
 004265E5    pop         edx
 004265E6    pop         ecx
 004265E7    pop         ecx
 004265E8    mov         dword ptr fs:[eax],edx
 004265EB    push        426600
 004265F0    mov         eax,dword ptr [ebp-4]
 004265F3    call        TGraphicsObject.Unlock
 004265F8    ret
>004265F9    jmp         @HandleFinally
>004265FE    jmp         004265F0
 00426600    pop         ebx
 00426601    pop         ecx
 00426602    pop         ebp
 00426603    ret
*}
end;

//00426604
procedure TBrush.SetBitmap(Value:TBitmap);
begin
{*
 00426604    push        esi
 00426605    push        edi
 00426606    add         esp,0FFFFFFF0
 00426609    mov         esi,5AC7CC
 0042660E    mov         edi,esp
 00426610    movs        dword ptr [edi],dword ptr [esi]
 00426611    movs        dword ptr [edi],dword ptr [esi]
 00426612    movs        dword ptr [edi],dword ptr [esi]
 00426613    movs        dword ptr [edi],dword ptr [esi]
 00426614    mov         dword ptr [esp+8],edx
 00426618    mov         edx,esp
 0042661A    call        TBrush.SetData
 0042661F    add         esp,10
 00426622    pop         edi
 00426623    pop         esi
 00426624    ret
*}
end;

//00426628
function TBrush.GetColor:TColor;
begin
{*
 00426628    mov         eax,dword ptr [eax+10]
 0042662B    mov         eax,dword ptr [eax+14]
 0042662E    ret
*}
end;

//00426630
procedure TBrush.SetColor(Value:TColor);
begin
{*
 00426630    push        ebx
 00426631    push        esi
 00426632    add         esp,0FFFFFFF0
 00426635    mov         esi,edx
 00426637    mov         ebx,eax
 00426639    mov         edx,esp
 0042663B    mov         eax,ebx
 0042663D    call        TBrush.GetData
 00426642    mov         dword ptr [esp+4],esi
 00426646    cmp         byte ptr [esp+0C],1
>0042664B    jne         00426652
 0042664D    mov         byte ptr [esp+0C],0
 00426652    mov         edx,esp
 00426654    mov         eax,ebx
 00426656    call        TBrush.SetData
 0042665B    add         esp,10
 0042665E    pop         esi
 0042665F    pop         ebx
 00426660    ret
*}
end;

//00426664
function TBrush.GetHandle:HBRUSH;
begin
{*
 00426664    push        ebp
 00426665    mov         ebp,esp
 00426667    add         esp,0FFFFFFF0
 0042666A    mov         eax,dword ptr [eax+10]
 0042666D    mov         dword ptr [ebp-4],eax
 00426670    mov         eax,dword ptr [ebp-4]
 00426673    cmp         dword ptr [eax+8],0
>00426677    jne         00426738
 0042667D    mov         eax,[005E09B0];BrushManager:TResourceManager
 00426682    call        TResourceManager.Lock
 00426687    xor         edx,edx
 00426689    push        ebp
 0042668A    push        426731
 0042668F    push        dword ptr fs:[edx]
 00426692    mov         dword ptr fs:[edx],esp
 00426695    mov         eax,dword ptr [ebp-4]
 00426698    cmp         dword ptr [eax+8],0
>0042669C    jne         00426719
 0042669E    mov         eax,dword ptr [ebp-4]
 004266A1    mov         eax,dword ptr [eax+18]
 004266A4    test        eax,eax
>004266A6    je          004266C6
 004266A8    mov         dword ptr [ebp-10],3
 004266AF    mov         dl,1
 004266B1    mov         ecx,dword ptr [eax]
 004266B3    call        dword ptr [ecx+6C]
 004266B6    mov         eax,dword ptr [ebp-4]
 004266B9    mov         eax,dword ptr [eax+18]
 004266BC    mov         edx,dword ptr [eax]
 004266BE    call        dword ptr [edx+64]
 004266C1    mov         dword ptr [ebp-8],eax
>004266C4    jmp         004266FC
 004266C6    xor         eax,eax
 004266C8    mov         dword ptr [ebp-8],eax
 004266CB    mov         eax,dword ptr [ebp-4]
 004266CE    mov         al,byte ptr [eax+1C]
 004266D1    mov         edx,eax
 004266D3    sub         dl,1
>004266D6    jb          004266DC
>004266D8    je          004266E3
>004266DA    jmp         004266EC
 004266DC    xor         eax,eax
 004266DE    mov         dword ptr [ebp-10],eax
>004266E1    jmp         004266FC
 004266E3    mov         dword ptr [ebp-10],1
>004266EA    jmp         004266FC
 004266EC    mov         dword ptr [ebp-10],2
 004266F3    and         eax,7F
 004266F6    sub         eax,2
 004266F9    mov         dword ptr [ebp-8],eax
 004266FC    mov         eax,dword ptr [ebp-4]
 004266FF    mov         eax,dword ptr [eax+14]
 00426702    call        ColorToRGB
 00426707    mov         dword ptr [ebp-0C],eax
 0042670A    lea         eax,[ebp-10]
 0042670D    push        eax
 0042670E    call        gdi32.CreateBrushIndirect
 00426713    mov         edx,dword ptr [ebp-4]
 00426716    mov         dword ptr [edx+8],eax
 00426719    xor         eax,eax
 0042671B    pop         edx
 0042671C    pop         ecx
 0042671D    pop         ecx
 0042671E    mov         dword ptr fs:[eax],edx
 00426721    push        426738
 00426726    mov         eax,[005E09B0];BrushManager:TResourceManager
 0042672B    call        TResourceManager.Unlock
 00426730    ret
>00426731    jmp         @HandleFinally
>00426736    jmp         00426726
 00426738    mov         eax,dword ptr [ebp-4]
 0042673B    mov         eax,dword ptr [eax+8]
 0042673E    mov         esp,ebp
 00426740    pop         ebp
 00426741    ret
*}
end;

//00426744
function TBrush.GetStyle:TBrushStyle;
begin
{*
 00426744    mov         eax,dword ptr [eax+10]
 00426747    mov         al,byte ptr [eax+1C]
 0042674A    ret
*}
end;

//0042674C
procedure TBrush.SetStyle(Value:TBrushStyle);
begin
{*
 0042674C    push        ebx
 0042674D    push        esi
 0042674E    add         esp,0FFFFFFF0
 00426751    mov         ebx,edx
 00426753    mov         esi,eax
 00426755    mov         edx,esp
 00426757    mov         eax,esi
 00426759    call        TBrush.GetData
 0042675E    mov         eax,ebx
 00426760    mov         byte ptr [esp+0C],al
 00426764    cmp         al,1
>00426766    jne         00426770
 00426768    mov         dword ptr [esp+4],0FFFFFF
 00426770    mov         edx,esp
 00426772    mov         eax,esi
 00426774    call        TBrush.SetData
 00426779    add         esp,10
 0042677C    pop         esi
 0042677D    pop         ebx
 0042677E    ret
*}
end;

//00426780
constructor TCanvas.Create;
begin
{*
 00426780    push        ebx
 00426781    push        esi
 00426782    push        edi
 00426783    test        dl,dl
>00426785    je          0042678F
 00426787    add         esp,0FFFFFFF0
 0042678A    call        @ClassCreate
 0042678F    mov         ebx,edx
 00426791    mov         edi,eax
 00426793    xor         edx,edx
 00426795    mov         eax,edi
 00426797    call        TObject.Create
 0042679C    lea         eax,[edi+38]
 0042679F    push        eax
 004267A0    call        KERNEL32.InitializeCriticalSection
 004267A5    mov         dl,1
 004267A7    mov         eax,[0042451C];TFont
 004267AC    call        TFont.Create
 004267B1    mov         esi,eax
 004267B3    mov         dword ptr [edi+0C],esi
 004267B6    mov         dword ptr [esi+0C],edi
 004267B9    mov         dword ptr [esi+8],426F4C;TCanvas.FontChanged
 004267C0    lea         eax,[edi+38]
 004267C3    mov         dword ptr [esi+14],eax
 004267C6    mov         dl,1
 004267C8    mov         eax,[00424698];TPen
 004267CD    call        TPen.Create
 004267D2    mov         esi,eax
 004267D4    mov         dword ptr [edi+10],esi
 004267D7    mov         dword ptr [esi+0C],edi
 004267DA    mov         dword ptr [esi+8],426F6C;TCanvas.PenChanged
 004267E1    lea         eax,[edi+38]
 004267E4    mov         dword ptr [esi+14],eax
 004267E7    mov         dl,1
 004267E9    mov         eax,[00424798];TBrush
 004267EE    call        TBrush.Create
 004267F3    mov         esi,eax
 004267F5    mov         dword ptr [edi+14],esi
 004267F8    mov         dword ptr [esi+0C],edi
 004267FB    mov         dword ptr [esi+8],426F8C;TCanvas.BrushChanged
 00426802    lea         eax,[edi+38]
 00426805    mov         dword ptr [esi+14],eax
 00426808    mov         dword ptr [edi+20],0CC0020
 0042680F    mov         al,[00426840]
 00426814    mov         byte ptr [edi+8],al
 00426817    mov         edx,edi
 00426819    mov         eax,[005E09B4];CanvasList:TThreadList
 0042681E    call        TThreadList.Add
 00426823    mov         eax,edi
 00426825    test        bl,bl
>00426827    je          00426838
 00426829    call        @AfterConstruction
 0042682E    pop         dword ptr fs:[0]
 00426835    add         esp,0C
 00426838    mov         eax,edi
 0042683A    pop         edi
 0042683B    pop         esi
 0042683C    pop         ebx
 0042683D    ret
*}
end;

//00426844
destructor TCanvas.Destroy;
begin
{*
 00426844    push        ebx
 00426845    push        esi
 00426846    call        @BeforeDestruction
 0042684B    mov         ebx,edx
 0042684D    mov         esi,eax
 0042684F    mov         edx,esi
 00426851    mov         eax,[005E09B4];CanvasList:TThreadList
 00426856    call        TThreadList.Remove
 0042685B    xor         edx,edx
 0042685D    mov         eax,esi
 0042685F    call        TCanvas.SetHandle
 00426864    mov         eax,dword ptr [esi+0C]
 00426867    call        TObject.Free
 0042686C    mov         eax,dword ptr [esi+10]
 0042686F    call        TObject.Free
 00426874    mov         eax,dword ptr [esi+14]
 00426877    call        TObject.Free
 0042687C    lea         eax,[esi+38]
 0042687F    push        eax
 00426880    call        KERNEL32.DeleteCriticalSection
 00426885    mov         edx,ebx
 00426887    and         dl,0FC
 0042688A    mov         eax,esi
 0042688C    call        TMemoryStream.Destroy
 00426891    test        bl,bl
>00426893    jle         0042689C
 00426895    mov         eax,esi
 00426897    call        @ClassDestroy
 0042689C    pop         esi
 0042689D    pop         ebx
 0042689E    ret
*}
end;

//004268A0
procedure TCanvas.CopyRect(const Dest:TRect; Canvas:TCanvas; const Source:TRect);
begin
{*
 004268A0    push        ebp
 004268A1    mov         ebp,esp
 004268A3    push        ecx
 004268A4    push        ebx
 004268A5    push        esi
 004268A6    push        edi
 004268A7    mov         dword ptr [ebp-4],ecx
 004268AA    mov         esi,edx
 004268AC    mov         ebx,eax
 004268AE    mov         edi,dword ptr [ebp+8]
 004268B1    mov         eax,ebx
 004268B3    mov         edx,dword ptr [eax]
 004268B5    call        dword ptr [edx+10]
 004268B8    mov         dl,byte ptr ds:[426920]
 004268BE    mov         eax,ebx
 004268C0    call        TCanvas.RequiredState
 004268C5    mov         dl,byte ptr ds:[426924]
 004268CB    mov         eax,dword ptr [ebp-4]
 004268CE    call        TCanvas.RequiredState
 004268D3    mov         edx,dword ptr [ebx+20]
 004268D6    push        edx
 004268D7    mov         edx,dword ptr [edi+0C]
 004268DA    sub         edx,dword ptr [edi+4]
 004268DD    push        edx
 004268DE    mov         edx,dword ptr [edi+8]
 004268E1    sub         edx,dword ptr [edi]
 004268E3    push        edx
 004268E4    mov         edx,dword ptr [edi+4]
 004268E7    push        edx
 004268E8    mov         edx,dword ptr [edi]
 004268EA    push        edx
 004268EB    mov         edx,dword ptr [ebp-4]
 004268EE    mov         edx,dword ptr [edx+4]
 004268F1    push        edx
 004268F2    mov         edx,dword ptr [esi+0C]
 004268F5    sub         edx,dword ptr [esi+4]
 004268F8    push        edx
 004268F9    mov         edx,dword ptr [esi+8]
 004268FC    mov         eax,dword ptr [esi]
 004268FE    sub         edx,eax
 00426900    push        edx
 00426901    mov         edx,dword ptr [esi+4]
 00426904    push        edx
 00426905    push        eax
 00426906    mov         eax,dword ptr [ebx+4]
 00426909    push        eax
 0042690A    call        gdi32.StretchBlt
 0042690F    mov         eax,ebx
 00426911    mov         edx,dword ptr [eax]
 00426913    call        dword ptr [edx+0C]
 00426916    pop         edi
 00426917    pop         esi
 00426918    pop         ebx
 00426919    pop         ecx
 0042691A    pop         ebp
 0042691B    ret         4
*}
end;

//00426928
procedure TCanvas.Draw(X:Integer; Y:Integer; Graphic:TGraphic);
begin
{*
 00426928    push        ebp
 00426929    mov         ebp,esp
 0042692B    add         esp,0FFFFFFEC
 0042692E    push        ebx
 0042692F    push        esi
 00426930    push        edi
 00426931    mov         dword ptr [ebp-4],ecx
 00426934    mov         edi,edx
 00426936    mov         ebx,eax
 00426938    mov         esi,dword ptr [ebp+8]
 0042693B    test        esi,esi
>0042693D    je          004269C5
 00426943    mov         eax,esi
 00426945    mov         edx,dword ptr [eax]
 00426947    call        dword ptr [edx+1C]
 0042694A    test        al,al
>0042694C    jne         004269C5
 0042694E    mov         eax,ebx
 00426950    mov         edx,dword ptr [eax]
 00426952    call        dword ptr [edx+10]
 00426955    mov         dl,byte ptr ds:[4269D0]
 0042695B    mov         eax,ebx
 0042695D    call        TCanvas.RequiredState
 00426962    mov         eax,dword ptr [ebx+14]
 00426965    call        TBrush.GetColor
 0042696A    call        ColorToRGB
 0042696F    push        eax
 00426970    mov         eax,dword ptr [ebx+4]
 00426973    push        eax
 00426974    call        gdi32.SetBkColor
 00426979    mov         eax,dword ptr [ebx+0C]
 0042697C    mov         eax,dword ptr [eax+18]
 0042697F    call        ColorToRGB
 00426984    push        eax
 00426985    mov         eax,dword ptr [ebx+4]
 00426988    push        eax
 00426989    call        gdi32.SetTextColor
 0042698E    mov         eax,esi
 00426990    mov         edx,dword ptr [eax]
 00426992    call        dword ptr [edx+20]
 00426995    add         eax,dword ptr [ebp-4]
 00426998    push        eax
 00426999    lea         eax,[ebp-14]
 0042699C    push        eax
 0042699D    mov         eax,esi
 0042699F    mov         edx,dword ptr [eax]
 004269A1    call        dword ptr [edx+2C]
 004269A4    mov         ecx,eax
 004269A6    add         ecx,edi
 004269A8    mov         edx,dword ptr [ebp-4]
 004269AB    mov         eax,edi
 004269AD    call        Bounds
 004269B2    lea         ecx,[ebp-14]
 004269B5    mov         edx,ebx
 004269B7    mov         eax,esi
 004269B9    mov         esi,dword ptr [eax]
 004269BB    call        dword ptr [esi+14]
 004269BE    mov         eax,ebx
 004269C0    mov         edx,dword ptr [eax]
 004269C2    call        dword ptr [edx+0C]
 004269C5    pop         edi
 004269C6    pop         esi
 004269C7    pop         ebx
 004269C8    mov         esp,ebp
 004269CA    pop         ebp
 004269CB    ret         4
*}
end;

//004269D4
procedure TCanvas.FillRect(const Rect:TRect);
begin
{*
 004269D4    push        ebx
 004269D5    push        esi
 004269D6    mov         esi,edx
 004269D8    mov         ebx,eax
 004269DA    mov         eax,ebx
 004269DC    mov         edx,dword ptr [eax]
 004269DE    call        dword ptr [edx+10]
 004269E1    mov         dl,byte ptr ds:[426A0C]
 004269E7    mov         eax,ebx
 004269E9    call        TCanvas.RequiredState
 004269EE    mov         eax,dword ptr [ebx+14]
 004269F1    call        TBrush.GetHandle
 004269F6    push        eax
 004269F7    push        esi
 004269F8    mov         eax,dword ptr [ebx+4]
 004269FB    push        eax
 004269FC    call        user32.FillRect
 00426A01    mov         eax,ebx
 00426A03    mov         edx,dword ptr [eax]
 00426A05    call        dword ptr [edx+0C]
 00426A08    pop         esi
 00426A09    pop         ebx
 00426A0A    ret
*}
end;

//00426A10
procedure TCanvas.LineTo(X:Integer; Y:Integer);
begin
{*
 00426A10    push        ebx
 00426A11    push        esi
 00426A12    push        edi
 00426A13    mov         edi,ecx
 00426A15    mov         esi,edx
 00426A17    mov         ebx,eax
 00426A19    mov         eax,ebx
 00426A1B    mov         edx,dword ptr [eax]
 00426A1D    call        dword ptr [edx+10]
 00426A20    mov         dl,byte ptr ds:[426A44]
 00426A26    mov         eax,ebx
 00426A28    call        TCanvas.RequiredState
 00426A2D    push        edi
 00426A2E    push        esi
 00426A2F    mov         eax,dword ptr [ebx+4]
 00426A32    push        eax
 00426A33    call        gdi32.LineTo
 00426A38    mov         eax,ebx
 00426A3A    mov         edx,dword ptr [eax]
 00426A3C    call        dword ptr [edx+0C]
 00426A3F    pop         edi
 00426A40    pop         esi
 00426A41    pop         ebx
 00426A42    ret
*}
end;

//00426A48
procedure TCanvas.Lock;
begin
{*
 00426A48    push        ebx
 00426A49    mov         ebx,eax
 00426A4B    push        5E0990;CounterLock:TRTLCriticalSection
 00426A50    call        KERNEL32.EnterCriticalSection
 00426A55    inc         dword ptr [ebx+50]
 00426A58    push        5E0990;CounterLock:TRTLCriticalSection
 00426A5D    call        KERNEL32.LeaveCriticalSection
 00426A62    lea         eax,[ebx+38]
 00426A65    push        eax
 00426A66    call        KERNEL32.EnterCriticalSection
 00426A6B    pop         ebx
 00426A6C    ret
*}
end;

//00426A70
procedure TCanvas.MoveTo(X:Integer; Y:Integer);
begin
{*
 00426A70    push        ebx
 00426A71    push        esi
 00426A72    push        edi
 00426A73    mov         edi,ecx
 00426A75    mov         esi,edx
 00426A77    mov         ebx,eax
 00426A79    mov         dl,byte ptr ds:[426A98]
 00426A7F    mov         eax,ebx
 00426A81    call        TCanvas.RequiredState
 00426A86    push        0
 00426A88    push        edi
 00426A89    push        esi
 00426A8A    mov         eax,dword ptr [ebx+4]
 00426A8D    push        eax
 00426A8E    call        gdi32.MoveToEx
 00426A93    pop         edi
 00426A94    pop         esi
 00426A95    pop         ebx
 00426A96    ret
*}
end;

//00426A9C
procedure TCanvas.Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer);
begin
{*
 00426A9C    push        ebp
 00426A9D    mov         ebp,esp
 00426A9F    push        ebx
 00426AA0    push        esi
 00426AA1    push        edi
 00426AA2    mov         edi,ecx
 00426AA4    mov         esi,edx
 00426AA6    mov         ebx,eax
 00426AA8    mov         eax,ebx
 00426AAA    mov         edx,dword ptr [eax]
 00426AAC    call        dword ptr [edx+10]
 00426AAF    mov         dl,byte ptr ds:[426AE0]
 00426AB5    mov         eax,ebx
 00426AB7    call        TCanvas.RequiredState
 00426ABC    mov         eax,dword ptr [ebp+8]
 00426ABF    push        eax
 00426AC0    mov         eax,dword ptr [ebp+0C]
 00426AC3    push        eax
 00426AC4    push        edi
 00426AC5    push        esi
 00426AC6    mov         eax,dword ptr [ebx+4]
 00426AC9    push        eax
 00426ACA    call        gdi32.Rectangle
 00426ACF    mov         eax,ebx
 00426AD1    mov         edx,dword ptr [eax]
 00426AD3    call        dword ptr [edx+0C]
 00426AD6    pop         edi
 00426AD7    pop         esi
 00426AD8    pop         ebx
 00426AD9    pop         ebp
 00426ADA    ret         8
*}
end;

//00426AE4
procedure TCanvas.StretchDraw(const Rect:TRect; Graphic:TPersistent);
begin
{*
 00426AE4    push        ebx
 00426AE5    push        esi
 00426AE6    push        edi
 00426AE7    mov         esi,ecx
 00426AE9    mov         edi,edx
 00426AEB    mov         ebx,eax
 00426AED    test        esi,esi
>00426AEF    je          00426B17
 00426AF1    mov         eax,ebx
 00426AF3    mov         edx,dword ptr [eax]
 00426AF5    call        dword ptr [edx+10]
 00426AF8    mov         dl,byte ptr ds:[426B1C]
 00426AFE    mov         eax,ebx
 00426B00    call        TCanvas.RequiredState
 00426B05    mov         ecx,edi
 00426B07    mov         edx,ebx
 00426B09    mov         eax,esi
 00426B0B    mov         esi,dword ptr [eax]
 00426B0D    call        dword ptr [esi+14]
 00426B10    mov         eax,ebx
 00426B12    mov         edx,dword ptr [eax]
 00426B14    call        dword ptr [edx+0C]
 00426B17    pop         edi
 00426B18    pop         esi
 00426B19    pop         ebx
 00426B1A    ret
*}
end;

//00426B20
function TCanvas.TextExtent(const Text:AnsiString):TSize;
begin
{*
 00426B20    push        ebx
 00426B21    push        esi
 00426B22    push        edi
 00426B23    mov         esi,ecx
 00426B25    mov         edi,edx
 00426B27    mov         ebx,eax
 00426B29    mov         dl,byte ptr ds:[426B60]
 00426B2F    mov         eax,ebx
 00426B31    call        TCanvas.RequiredState
 00426B36    xor         eax,eax
 00426B38    mov         dword ptr [esi],eax
 00426B3A    xor         eax,eax
 00426B3C    mov         dword ptr [esi+4],eax
 00426B3F    push        esi
 00426B40    mov         eax,edi
 00426B42    call        @LStrLen
 00426B47    push        eax
 00426B48    mov         eax,edi
 00426B4A    call        @LStrToPChar
 00426B4F    push        eax
 00426B50    mov         eax,dword ptr [ebx+4]
 00426B53    push        eax
 00426B54    call        gdi32.GetTextExtentPoint32A
 00426B59    pop         edi
 00426B5A    pop         esi
 00426B5B    pop         ebx
 00426B5C    ret
*}
end;

//00426B64
function TCanvas.TextWidth(const Text:AnsiString):Integer;
begin
{*
 00426B64    push        ebx
 00426B65    push        esi
 00426B66    add         esp,0FFFFFFF8
 00426B69    mov         esi,edx
 00426B6B    mov         ebx,eax
 00426B6D    mov         ecx,esp
 00426B6F    mov         edx,esi
 00426B71    mov         eax,ebx
 00426B73    call        TCanvas.TextExtent
 00426B78    mov         eax,dword ptr [esp]
 00426B7B    pop         ecx
 00426B7C    pop         edx
 00426B7D    pop         esi
 00426B7E    pop         ebx
 00426B7F    ret
*}
end;

//00426B80
function TCanvas.TextHeight(const Text:AnsiString):Integer;
begin
{*
 00426B80    push        ebx
 00426B81    push        esi
 00426B82    add         esp,0FFFFFFF8
 00426B85    mov         esi,edx
 00426B87    mov         ebx,eax
 00426B89    mov         ecx,esp
 00426B8B    mov         edx,esi
 00426B8D    mov         eax,ebx
 00426B8F    call        TCanvas.TextExtent
 00426B94    mov         eax,dword ptr [esp+4]
 00426B98    pop         ecx
 00426B99    pop         edx
 00426B9A    pop         esi
 00426B9B    pop         ebx
 00426B9C    ret
*}
end;

//00426BA0
function TCanvas.TryLock:Boolean;
begin
{*
 00426BA0    push        ebp
 00426BA1    mov         ebp,esp
 00426BA3    push        ecx
 00426BA4    push        ebx
 00426BA5    mov         ebx,eax
 00426BA7    push        5E0990;CounterLock:TRTLCriticalSection
 00426BAC    call        KERNEL32.EnterCriticalSection
 00426BB1    xor         eax,eax
 00426BB3    push        ebp
 00426BB4    push        426BEC
 00426BB9    push        dword ptr fs:[eax]
 00426BBC    mov         dword ptr fs:[eax],esp
 00426BBF    cmp         dword ptr [ebx+50],0
 00426BC3    sete        byte ptr [ebp-1]
 00426BC7    cmp         byte ptr [ebp-1],0
>00426BCB    je          00426BD4
 00426BCD    mov         eax,ebx
 00426BCF    call        TCanvas.Lock
 00426BD4    xor         eax,eax
 00426BD6    pop         edx
 00426BD7    pop         ecx
 00426BD8    pop         ecx
 00426BD9    mov         dword ptr fs:[eax],edx
 00426BDC    push        426BF3
 00426BE1    push        5E0990;CounterLock:TRTLCriticalSection
 00426BE6    call        KERNEL32.LeaveCriticalSection
 00426BEB    ret
>00426BEC    jmp         @HandleFinally
>00426BF1    jmp         00426BE1
 00426BF3    mov         al,byte ptr [ebp-1]
 00426BF6    pop         ebx
 00426BF7    pop         ecx
 00426BF8    pop         ebp
 00426BF9    ret
*}
end;

//00426BFC
procedure TCanvas.Unlock;
begin
{*
 00426BFC    push        ebx
 00426BFD    mov         ebx,eax
 00426BFF    lea         eax,[ebx+38]
 00426C02    push        eax
 00426C03    call        KERNEL32.LeaveCriticalSection
 00426C08    push        5E0990;CounterLock:TRTLCriticalSection
 00426C0D    call        KERNEL32.EnterCriticalSection
 00426C12    dec         dword ptr [ebx+50]
 00426C15    push        5E0990;CounterLock:TRTLCriticalSection
 00426C1A    call        KERNEL32.LeaveCriticalSection
 00426C1F    pop         ebx
 00426C20    ret
*}
end;

//00426C24
procedure TCanvas.SetFont(Value:TFont);
begin
{*
 00426C24    push        esi
 00426C25    mov         esi,eax
 00426C27    mov         eax,dword ptr [esi+0C]
 00426C2A    mov         ecx,dword ptr [eax]
 00426C2C    call        dword ptr [ecx+8]
 00426C2F    pop         esi
 00426C30    ret
*}
end;

//00426C34
procedure TCanvas.SetPen(Value:TPen);
begin
{*
 00426C34    mov         eax,dword ptr [eax+10]
 00426C37    mov         ecx,dword ptr [eax]
 00426C39    call        dword ptr [ecx+8]
 00426C3C    ret
*}
end;

//00426C40
procedure TCanvas.SetBrush(Value:TBrush);
begin
{*
 00426C40    mov         eax,dword ptr [eax+14]
 00426C43    mov         ecx,dword ptr [eax]
 00426C45    call        dword ptr [ecx+8]
 00426C48    ret
*}
end;

//00426C4C
function TCanvas.GetPenPos:TPoint;
begin
{*
 00426C4C    push        ebx
 00426C4D    push        esi
 00426C4E    mov         esi,edx
 00426C50    mov         ebx,eax
 00426C52    mov         dl,byte ptr ds:[426C6C]
 00426C58    mov         eax,ebx
 00426C5A    call        TCanvas.RequiredState
 00426C5F    push        esi
 00426C60    mov         eax,dword ptr [ebx+4]
 00426C63    push        eax
 00426C64    call        gdi32.GetCurrentPositionEx
 00426C69    pop         esi
 00426C6A    pop         ebx
 00426C6B    ret
*}
end;

//00426C70
procedure TCanvas.SetPenPos(Value:TPoint);
begin
{*
 00426C70    push        esi
 00426C71    push        edi
 00426C72    add         esp,0FFFFFFF8
 00426C75    mov         esi,edx
 00426C77    lea         edi,[esp]
 00426C7A    movs        dword ptr [edi],dword ptr [esi]
 00426C7B    movs        dword ptr [edi],dword ptr [esi]
 00426C7C    mov         ecx,dword ptr [esp+4]
 00426C80    mov         edx,dword ptr [esp]
 00426C83    call        TCanvas.MoveTo
 00426C88    pop         ecx
 00426C89    pop         edx
 00426C8A    pop         edi
 00426C8B    pop         esi
 00426C8C    ret
*}
end;

//00426C90
function TCanvas.GetPixel(X:Integer; Y:Integer):TColor;
begin
{*
 00426C90    push        ebx
 00426C91    push        esi
 00426C92    push        edi
 00426C93    mov         edi,ecx
 00426C95    mov         esi,edx
 00426C97    mov         ebx,eax
 00426C99    mov         dl,byte ptr ds:[426CB8]
 00426C9F    mov         eax,ebx
 00426CA1    call        TCanvas.RequiredState
 00426CA6    push        edi
 00426CA7    push        esi
 00426CA8    mov         eax,dword ptr [ebx+4]
 00426CAB    push        eax
 00426CAC    call        gdi32.GetPixel
 00426CB1    pop         edi
 00426CB2    pop         esi
 00426CB3    pop         ebx
 00426CB4    ret
*}
end;

//00426CBC
procedure TCanvas.SetPixel(X:Integer; Y:Integer; Value:TColor);
begin
{*
 00426CBC    push        ebp
 00426CBD    mov         ebp,esp
 00426CBF    push        ebx
 00426CC0    push        esi
 00426CC1    push        edi
 00426CC2    mov         edi,ecx
 00426CC4    mov         esi,edx
 00426CC6    mov         ebx,eax
 00426CC8    mov         eax,ebx
 00426CCA    mov         edx,dword ptr [eax]
 00426CCC    call        dword ptr [edx+10]
 00426CCF    mov         dl,byte ptr ds:[426D00]
 00426CD5    mov         eax,ebx
 00426CD7    call        TCanvas.RequiredState
 00426CDC    mov         eax,dword ptr [ebp+8]
 00426CDF    call        ColorToRGB
 00426CE4    push        eax
 00426CE5    push        edi
 00426CE6    push        esi
 00426CE7    mov         eax,dword ptr [ebx+4]
 00426CEA    push        eax
 00426CEB    call        gdi32.SetPixel
 00426CF0    mov         eax,ebx
 00426CF2    mov         edx,dword ptr [eax]
 00426CF4    call        dword ptr [edx+0C]
 00426CF7    pop         edi
 00426CF8    pop         esi
 00426CF9    pop         ebx
 00426CFA    pop         ebp
 00426CFB    ret         4
*}
end;

//00426D04
function TCanvas.GetHandle:HDC;
begin
{*
 00426D04    push        ebx
 00426D05    mov         ebx,eax
 00426D07    mov         eax,ebx
 00426D09    mov         edx,dword ptr [eax]
 00426D0B    call        dword ptr [edx+10]
 00426D0E    mov         dl,byte ptr ds:[426D20]
 00426D14    mov         eax,ebx
 00426D16    call        TCanvas.RequiredState
 00426D1B    mov         eax,dword ptr [ebx+4]
 00426D1E    pop         ebx
 00426D1F    ret
*}
end;

//00426D24
procedure TCanvas.DeselectHandles;
begin
{*
 00426D24    push        ebx
 00426D25    push        esi
 00426D26    mov         ebx,eax
 00426D28    mov         esi,dword ptr [ebx+4]
 00426D2B    test        esi,esi
>00426D2D    je          00426D77
 00426D2F    mov         al,[00426D7C]
 00426D34    not         eax
 00426D36    and         al,byte ptr [ebx+8]
 00426D39    mov         dl,byte ptr [ebx+8]
 00426D3C    cmp         dl,al
>00426D3E    je          00426D77
 00426D40    mov         eax,[005E0968];StockPen:HPEN
 00426D45    push        eax
 00426D46    push        esi
 00426D47    call        gdi32.SelectObject
 00426D4C    mov         eax,[005E096C];StockBrush:HBRUSH
 00426D51    push        eax
 00426D52    mov         eax,dword ptr [ebx+4]
 00426D55    push        eax
 00426D56    call        gdi32.SelectObject
 00426D5B    mov         eax,[005E0970];StockFont:HFONT
 00426D60    push        eax
 00426D61    mov         eax,dword ptr [ebx+4]
 00426D64    push        eax
 00426D65    call        gdi32.SelectObject
 00426D6A    mov         al,[00426D7C]
 00426D6F    not         eax
 00426D71    and         al,byte ptr [ebx+8]
 00426D74    mov         byte ptr [ebx+8],al
 00426D77    pop         esi
 00426D78    pop         ebx
 00426D79    ret
*}
end;

//00426D80
procedure TCanvas.CreateHandle;
begin
{*
 00426D80    ret
*}
end;

//00426D84
procedure TCanvas.SetHandle(Value:HDC);
begin
{*
 00426D84    push        ebx
 00426D85    push        esi
 00426D86    add         esp,0FFFFFFF8
 00426D89    mov         esi,edx
 00426D8B    mov         ebx,eax
 00426D8D    mov         eax,dword ptr [ebx+4]
 00426D90    cmp         esi,eax
>00426D92    je          00426DD3
 00426D94    test        eax,eax
>00426D96    je          00426DBE
 00426D98    mov         eax,ebx
 00426D9A    call        TCanvas.DeselectHandles
 00426D9F    mov         edx,esp
 00426DA1    mov         eax,ebx
 00426DA3    call        TCanvas.GetPenPos
 00426DA8    mov         eax,dword ptr [esp]
 00426DAB    mov         dword ptr [ebx+18],eax
 00426DAE    mov         eax,dword ptr [esp+4]
 00426DB2    mov         dword ptr [ebx+1C],eax
 00426DB5    xor         eax,eax
 00426DB7    mov         dword ptr [ebx+4],eax
 00426DBA    and         byte ptr [ebx+8],0FE
 00426DBE    test        esi,esi
>00426DC0    je          00426DD3
 00426DC2    or          byte ptr [ebx+8],1
 00426DC6    mov         dword ptr [ebx+4],esi
 00426DC9    lea         edx,[ebx+18]
 00426DCC    mov         eax,ebx
 00426DCE    call        TCanvas.SetPenPos
 00426DD3    pop         ecx
 00426DD4    pop         edx
 00426DD5    pop         esi
 00426DD6    pop         ebx
 00426DD7    ret
*}
end;

//00426DD8
procedure TCanvas.RequiredState(ReqState:TCanvasState);
begin
{*
 00426DD8    push        ebx
 00426DD9    push        esi
 00426DDA    push        ecx
 00426DDB    mov         byte ptr [esp],dl
 00426DDE    mov         esi,eax
 00426DE0    mov         bl,byte ptr [esi+8]
 00426DE3    not         ebx
 00426DE5    and         bl,byte ptr [esp]
 00426DE8    mov         al,[00426E48]
 00426DED    cmp         al,bl
>00426DEF    je          00426E44
 00426DF1    test        bl,1
>00426DF4    je          00426E1A
 00426DF6    mov         eax,esi
 00426DF8    mov         edx,dword ptr [eax]
 00426DFA    call        dword ptr [edx+14]
 00426DFD    cmp         dword ptr [esi+4],0
>00426E01    jne         00426E1A
 00426E03    mov         ecx,dword ptr ds:[5AE358];^SNoCanvasHandle:TResStringRec
 00426E09    mov         dl,1
 00426E0B    mov         eax,[00417C8C];EInvalidOperation
 00426E10    call        Exception.CreateRes
 00426E15    call        @RaiseExcept
 00426E1A    test        bl,2
>00426E1D    je          00426E26
 00426E1F    mov         eax,esi
 00426E21    call        TCanvas.CreateFont
 00426E26    test        bl,4
>00426E29    je          00426E32
 00426E2B    mov         eax,esi
 00426E2D    call        TCanvas.CreatePen
 00426E32    test        bl,8
>00426E35    je          00426E3E
 00426E37    mov         eax,esi
 00426E39    call        TCanvas.CreateBrush
 00426E3E    or          bl,byte ptr [esi+8]
 00426E41    mov         byte ptr [esi+8],bl
 00426E44    pop         edx
 00426E45    pop         esi
 00426E46    pop         ebx
 00426E47    ret
*}
end;

//00426E4C
procedure TCanvas.Changing;
begin
{*
 00426E4C    push        ebx
 00426E4D    cmp         word ptr [eax+32],0
>00426E52    je          00426E5E
 00426E54    mov         ebx,eax
 00426E56    mov         edx,eax
 00426E58    mov         eax,dword ptr [ebx+34]
 00426E5B    call        dword ptr [ebx+30]
 00426E5E    pop         ebx
 00426E5F    ret
*}
end;

//00426E60
procedure TCanvas.Changed;
begin
{*
 00426E60    push        ebx
 00426E61    cmp         word ptr [eax+2A],0
>00426E66    je          00426E72
 00426E68    mov         ebx,eax
 00426E6A    mov         edx,eax
 00426E6C    mov         eax,dword ptr [ebx+2C]
 00426E6F    call        dword ptr [ebx+28]
 00426E72    pop         ebx
 00426E73    ret
*}
end;

//00426E74
procedure TCanvas.CreateFont;
begin
{*
 00426E74    push        ebx
 00426E75    mov         ebx,eax
 00426E77    mov         eax,dword ptr [ebx+0C]
 00426E7A    call        TFont.GetHandle
 00426E7F    push        eax
 00426E80    mov         eax,dword ptr [ebx+4]
 00426E83    push        eax
 00426E84    call        gdi32.SelectObject
 00426E89    mov         eax,dword ptr [ebx+0C]
 00426E8C    mov         eax,dword ptr [eax+18]
 00426E8F    call        ColorToRGB
 00426E94    push        eax
 00426E95    mov         eax,dword ptr [ebx+4]
 00426E98    push        eax
 00426E99    call        gdi32.SetTextColor
 00426E9E    pop         ebx
 00426E9F    ret
*}
end;

//00426EA0
procedure TCanvas.CreatePen;
begin
{*
 00426EA0    push        ebx
 00426EA1    mov         ebx,eax
 00426EA3    mov         eax,dword ptr [ebx+10]
 00426EA6    call        TPen.GetHandle
 00426EAB    push        eax
 00426EAC    mov         eax,dword ptr [ebx+4]
 00426EAF    push        eax
 00426EB0    call        gdi32.SelectObject
 00426EB5    mov         eax,dword ptr [ebx+10]
 00426EB8    movzx       eax,byte ptr [eax+18]
 00426EBC    movzx       eax,word ptr [eax*2+5AC7DC]
 00426EC4    push        eax
 00426EC5    mov         eax,dword ptr [ebx+4]
 00426EC8    push        eax
 00426EC9    call        gdi32.SetROP2
 00426ECE    pop         ebx
 00426ECF    ret
*}
end;

//00426ED0
procedure TCanvas.CreateBrush;
begin
{*
 00426ED0    push        ebx
 00426ED1    mov         ebx,eax
 00426ED3    mov         eax,dword ptr [ebx+14]
 00426ED6    call        TBrush.GetHandle
 00426EDB    push        eax
 00426EDC    call        gdi32.UnrealizeObject
 00426EE1    mov         eax,dword ptr [ebx+14]
 00426EE4    call        TBrush.GetHandle
 00426EE9    push        eax
 00426EEA    mov         eax,dword ptr [ebx+4]
 00426EED    push        eax
 00426EEE    call        gdi32.SelectObject
 00426EF3    mov         eax,dword ptr [ebx+14]
 00426EF6    call        TBrush.GetStyle
 00426EFB    test        al,al
>00426EFD    jne         00426F23
 00426EFF    mov         eax,dword ptr [ebx+14]
 00426F02    call        TBrush.GetColor
 00426F07    call        ColorToRGB
 00426F0C    push        eax
 00426F0D    mov         eax,dword ptr [ebx+4]
 00426F10    push        eax
 00426F11    call        gdi32.SetBkColor
 00426F16    push        2
 00426F18    mov         eax,dword ptr [ebx+4]
 00426F1B    push        eax
 00426F1C    call        gdi32.SetBkMode
 00426F21    pop         ebx
 00426F22    ret
 00426F23    mov         eax,dword ptr [ebx+14]
 00426F26    call        TBrush.GetColor
 00426F2B    call        ColorToRGB
 00426F30    not         eax
 00426F32    push        eax
 00426F33    mov         eax,dword ptr [ebx+4]
 00426F36    push        eax
 00426F37    call        gdi32.SetBkColor
 00426F3C    push        1
 00426F3E    mov         eax,dword ptr [ebx+4]
 00426F41    push        eax
 00426F42    call        gdi32.SetBkMode
 00426F47    pop         ebx
 00426F48    ret
*}
end;

//00426F4C
procedure TCanvas.FontChanged(AFont:TObject);
begin
{*
 00426F4C    push        ebx
 00426F4D    mov         ebx,eax
 00426F4F    test        byte ptr [ebx+8],2
>00426F53    je          00426F68
 00426F55    and         byte ptr [ebx+8],0FD
 00426F59    mov         eax,[005E0970];StockFont:HFONT
 00426F5E    push        eax
 00426F5F    mov         eax,dword ptr [ebx+4]
 00426F62    push        eax
 00426F63    call        gdi32.SelectObject
 00426F68    pop         ebx
 00426F69    ret
*}
end;

//00426F6C
procedure TCanvas.PenChanged(APen:TObject);
begin
{*
 00426F6C    push        ebx
 00426F6D    mov         ebx,eax
 00426F6F    test        byte ptr [ebx+8],4
>00426F73    je          00426F88
 00426F75    and         byte ptr [ebx+8],0FB
 00426F79    mov         eax,[005E0968];StockPen:HPEN
 00426F7E    push        eax
 00426F7F    mov         eax,dword ptr [ebx+4]
 00426F82    push        eax
 00426F83    call        gdi32.SelectObject
 00426F88    pop         ebx
 00426F89    ret
*}
end;

//00426F8C
procedure TCanvas.BrushChanged(ABrush:TObject);
begin
{*
 00426F8C    push        ebx
 00426F8D    mov         ebx,eax
 00426F8F    test        byte ptr [ebx+8],8
>00426F93    je          00426FA8
 00426F95    and         byte ptr [ebx+8],0F7
 00426F99    mov         eax,[005E096C];StockBrush:HBRUSH
 00426F9E    push        eax
 00426F9F    mov         eax,dword ptr [ebx+4]
 00426FA2    push        eax
 00426FA3    call        gdi32.SelectObject
 00426FA8    pop         ebx
 00426FA9    ret
*}
end;

//00426FAC
procedure InvalidOperation(Str:PResStringRec);
begin
{*
 00426FAC    push        ebx
 00426FAD    mov         ebx,eax
 00426FAF    mov         ecx,ebx
 00426FB1    mov         dl,1
 00426FB3    mov         eax,[00424168];EInvalidGraphicOperation
 00426FB8    call        Exception.CreateRes
 00426FBD    call        @RaiseExcept
 00426FC2    pop         ebx
 00426FC3    ret
*}
end;

//00426FC4
procedure InvalidGraphic(Str:PResStringRec);
begin
{*
 00426FC4    push        ebx
 00426FC5    mov         ebx,eax
 00426FC7    mov         ecx,ebx
 00426FC9    mov         dl,1
 00426FCB    mov         eax,[0042410C];EInvalidGraphic
 00426FD0    call        Exception.CreateRes
 00426FD5    call        @RaiseExcept
 00426FDA    pop         ebx
 00426FDB    ret
*}
end;

//00426FDC
procedure InvalidBitmap;
begin
{*
 00426FDC    mov         eax,[005AE2FC];^SInvalidBitmap:TResStringRec
 00426FE1    call        InvalidGraphic
 00426FE6    ret
*}
end;

//00426FE8
procedure InvalidIcon;
begin
{*
 00426FE8    mov         eax,[005AE30C];^SInvalidIcon:TResStringRec
 00426FED    call        InvalidGraphic
 00426FF2    ret
*}
end;

//00426FF4
procedure InvalidMetafile;
begin
{*
 00426FF4    mov         eax,[005AE5E8];^SInvalidMetafile:TResStringRec
 00426FF9    call        InvalidGraphic
 00426FFE    ret
*}
end;

//00427000
procedure OutOfResources;
begin
{*
 00427000    push        ebp
 00427001    mov         ebp,esp
 00427003    push        0
 00427005    xor         eax,eax
 00427007    push        ebp
 00427008    push        42704A
 0042700D    push        dword ptr fs:[eax]
 00427010    mov         dword ptr fs:[eax],esp
 00427013    lea         edx,[ebp-4]
 00427016    mov         eax,[005AE1D0];^SOutOfResources:TResStringRec
 0042701B    call        LoadStr
 00427020    mov         ecx,dword ptr [ebp-4]
 00427023    mov         dl,1
 00427025    mov         eax,[00417C30];EOutOfResources
 0042702A    call        Exception.Create
 0042702F    call        @RaiseExcept
 00427034    xor         eax,eax
 00427036    pop         edx
 00427037    pop         ecx
 00427038    pop         ecx
 00427039    mov         dword ptr fs:[eax],edx
 0042703C    push        427051
 00427041    lea         eax,[ebp-4]
 00427044    call        @LStrClr
 00427049    ret
>0042704A    jmp         @HandleFinally
>0042704F    jmp         00427041
 00427051    pop         ecx
 00427052    pop         ebp
 00427053    ret
*}
end;

//00427054
procedure GDIError;
begin
{*
 00427054    push        ebp
 00427055    mov         ebp,esp
 00427057    add         esp,0FFFFFEFC
 0042705D    push        ebx
 0042705E    xor         eax,eax
 00427060    mov         dword ptr [ebp-104],eax
 00427066    xor         eax,eax
 00427068    push        ebp
 00427069    push        4270F0
 0042706E    push        dword ptr fs:[eax]
 00427071    mov         dword ptr fs:[eax],esp
 00427074    call        KERNEL32.GetLastError
 00427079    mov         ebx,eax
 0042707B    test        ebx,ebx
>0042707D    je          004270D2
 0042707F    push        0
 00427081    push        100
 00427086    lea         eax,[ebp-100]
 0042708C    push        eax
 0042708D    push        400
 00427092    push        ebx
 00427093    push        0
 00427095    push        1000
 0042709A    call        KERNEL32.FormatMessageA
 0042709F    test        eax,eax
>004270A1    je          004270D2
 004270A3    lea         eax,[ebp-104]
 004270A9    lea         edx,[ebp-100]
 004270AF    mov         ecx,100
 004270B4    call        @LStrFromArray
 004270B9    mov         ecx,dword ptr [ebp-104]
 004270BF    mov         dl,1
 004270C1    mov         eax,[00417C30];EOutOfResources
 004270C6    call        Exception.Create
 004270CB    call        @RaiseExcept
>004270D0    jmp         004270D7
 004270D2    call        OutOfResources
 004270D7    xor         eax,eax
 004270D9    pop         edx
 004270DA    pop         ecx
 004270DB    pop         ecx
 004270DC    mov         dword ptr fs:[eax],edx
 004270DF    push        4270F7
 004270E4    lea         eax,[ebp-104]
 004270EA    call        @LStrClr
 004270EF    ret
>004270F0    jmp         @HandleFinally
>004270F5    jmp         004270E4
 004270F7    pop         ebx
 004270F8    mov         esp,ebp
 004270FA    pop         ebp
 004270FB    ret
*}
end;

//004270FC
function GDICheck(Value:Integer):Integer;
begin
{*
 004270FC    push        ebx
 004270FD    mov         ebx,eax
 004270FF    test        ebx,ebx
>00427101    jne         00427108
 00427103    call        GDIError
 00427108    mov         eax,ebx
 0042710A    pop         ebx
 0042710B    ret
*}
end;

//0042710C
function DupBits(Src:HBITMAP; Size:TPoint; Mono:Boolean):HBITMAP;
begin
{*
 0042710C    push        ebp
 0042710D    mov         ebp,esp
 0042710F    add         esp,0FFFFFFCC
 00427112    push        ebx
 00427113    push        esi
 00427114    push        edi
 00427115    mov         esi,edx
 00427117    lea         edi,[ebp-0C]
 0042711A    movs        dword ptr [edi],dword ptr [esi]
 0042711B    movs        dword ptr [edi],dword ptr [esi]
 0042711C    mov         ebx,ecx
 0042711E    mov         dword ptr [ebp-4],eax
 00427121    push        0
 00427123    call        gdi32.CreateCompatibleDC
 00427128    mov         dword ptr [ebp-18],eax
 0042712B    push        0
 0042712D    call        gdi32.CreateCompatibleDC
 00427132    mov         dword ptr [ebp-1C],eax
 00427135    xor         eax,eax
 00427137    push        ebp
 00427138    push        42725A
 0042713D    push        dword ptr fs:[eax]
 00427140    mov         dword ptr fs:[eax],esp
 00427143    lea         eax,[ebp-34]
 00427146    push        eax
 00427147    push        18
 00427149    mov         eax,dword ptr [ebp-4]
 0042714C    push        eax
 0042714D    call        gdi32.GetObjectA
 00427152    test        bl,bl
>00427154    je          0042716E
 00427156    push        0
 00427158    push        1
 0042715A    push        1
 0042715C    mov         eax,dword ptr [ebp-8]
 0042715F    push        eax
 00427160    mov         eax,dword ptr [ebp-0C]
 00427163    push        eax
 00427164    call        gdi32.CreateBitmap
 00427169    mov         dword ptr [ebp-10],eax
>0042716C    jmp         004271D0
 0042716E    push        0
 00427170    call        user32.GetDC
 00427175    mov         dword ptr [ebp-14],eax
 00427178    cmp         dword ptr [ebp-14],0
>0042717C    jne         00427183
 0042717E    call        GDIError
 00427183    xor         eax,eax
 00427185    push        ebp
 00427186    push        4271C9
 0042718B    push        dword ptr fs:[eax]
 0042718E    mov         dword ptr fs:[eax],esp
 00427191    mov         eax,dword ptr [ebp-8]
 00427194    push        eax
 00427195    mov         eax,dword ptr [ebp-0C]
 00427198    push        eax
 00427199    mov         eax,dword ptr [ebp-14]
 0042719C    push        eax
 0042719D    call        gdi32.CreateCompatibleBitmap
 004271A2    mov         dword ptr [ebp-10],eax
 004271A5    cmp         dword ptr [ebp-10],0
>004271A9    jne         004271B0
 004271AB    call        GDIError
 004271B0    xor         eax,eax
 004271B2    pop         edx
 004271B3    pop         ecx
 004271B4    pop         ecx
 004271B5    mov         dword ptr fs:[eax],edx
 004271B8    push        4271D0
 004271BD    mov         eax,dword ptr [ebp-14]
 004271C0    push        eax
 004271C1    push        0
 004271C3    call        user32.ReleaseDC
 004271C8    ret
>004271C9    jmp         @HandleFinally
>004271CE    jmp         004271BD
 004271D0    cmp         dword ptr [ebp-10],0
>004271D4    je          0042723A
 004271D6    mov         eax,dword ptr [ebp-4]
 004271D9    push        eax
 004271DA    mov         eax,dword ptr [ebp-18]
 004271DD    push        eax
 004271DE    call        gdi32.SelectObject
 004271E3    mov         ebx,eax
 004271E5    mov         eax,dword ptr [ebp-10]
 004271E8    push        eax
 004271E9    mov         eax,dword ptr [ebp-1C]
 004271EC    push        eax
 004271ED    call        gdi32.SelectObject
 004271F2    mov         esi,eax
 004271F4    push        0CC0020
 004271F9    mov         eax,dword ptr [ebp-2C]
 004271FC    push        eax
 004271FD    mov         eax,dword ptr [ebp-30]
 00427200    push        eax
 00427201    push        0
 00427203    push        0
 00427205    mov         eax,dword ptr [ebp-18]
 00427208    push        eax
 00427209    mov         eax,dword ptr [ebp-8]
 0042720C    push        eax
 0042720D    mov         eax,dword ptr [ebp-0C]
 00427210    push        eax
 00427211    push        0
 00427213    push        0
 00427215    mov         eax,dword ptr [ebp-1C]
 00427218    push        eax
 00427219    call        gdi32.StretchBlt
 0042721E    test        ebx,ebx
>00427220    je          0042722C
 00427222    push        ebx
 00427223    mov         eax,dword ptr [ebp-18]
 00427226    push        eax
 00427227    call        gdi32.SelectObject
 0042722C    test        esi,esi
>0042722E    je          0042723A
 00427230    push        esi
 00427231    mov         eax,dword ptr [ebp-1C]
 00427234    push        eax
 00427235    call        gdi32.SelectObject
 0042723A    xor         eax,eax
 0042723C    pop         edx
 0042723D    pop         ecx
 0042723E    pop         ecx
 0042723F    mov         dword ptr fs:[eax],edx
 00427242    push        427261
 00427247    mov         eax,dword ptr [ebp-18]
 0042724A    push        eax
 0042724B    call        gdi32.DeleteDC
 00427250    mov         eax,dword ptr [ebp-1C]
 00427253    push        eax
 00427254    call        gdi32.DeleteDC
 00427259    ret
>0042725A    jmp         @HandleFinally
>0042725F    jmp         00427247
 00427261    mov         eax,dword ptr [ebp-10]
 00427264    pop         edi
 00427265    pop         esi
 00427266    pop         ebx
 00427267    mov         esp,ebp
 00427269    pop         ebp
 0042726A    ret
*}
end;

//0042726C
function GetDInColors(BitCount:Word):Integer;
begin
{*
 0042726C    mov         edx,eax
 0042726E    dec         dx
>00427271    je          0042727F
 00427273    sub         dx,3
>00427277    je          0042727F
 00427279    sub         dx,4
>0042727D    jne         00427289
 0042727F    mov         ecx,eax
 00427281    mov         eax,1
 00427286    shl         eax,cl
 00427288    ret
 00427289    xor         eax,eax
 0042728B    ret
*}
end;

//0042728C
function BytesPerScanline(PixelsPerScanline:Longint; BitsPerPixel:Longint; Alignment:Longint):Longint;
begin
{*
 0042728C    dec         ecx
 0042728D    imul        edx
 0042728F    add         eax,ecx
 00427291    not         ecx
 00427293    and         eax,ecx
 00427295    test        eax,eax
>00427297    jns         0042729C
 00427299    add         eax,7
 0042729C    sar         eax,3
 0042729F    ret
*}
end;

//004272A0
function TransparentStretchBlt(DstDC:HDC; DstX:Integer; DstY:Integer; DstW:Integer; DstH:Integer; SrcDC:HDC; SrcX:Integer; SrcY:Integer; SrcW:Integer; SrcH:Integer; MaskDC:HDC; MaskX:Integer; MaskY:Integer):Boolean;
begin
{*
 004272A0    push        ebp
 004272A1    mov         ebp,esp
 004272A3    add         esp,0FFFFFFDC
 004272A6    push        ebx
 004272A7    push        esi
 004272A8    push        edi
 004272A9    mov         dword ptr [ebp-8],ecx
 004272AC    mov         dword ptr [ebp-4],edx
 004272AF    mov         edi,eax
 004272B1    mov         esi,dword ptr [ebp+14]
 004272B4    mov         ebx,dword ptr [ebp+18]
 004272B7    mov         byte ptr [ebp-9],1
 004272BB    mov         eax,[005AE800]
 004272C0    cmp         dword ptr [eax],2
>004272C3    jne         0042737A
 004272C9    cmp         ebx,dword ptr [ebp+2C]
>004272CC    jne         0042737A
 004272D2    cmp         esi,dword ptr [ebp+28]
>004272D5    jne         0042737A
 004272DB    push        1
 004272DD    push        1
 004272DF    mov         eax,dword ptr [ebp+24]
 004272E2    push        eax
 004272E3    call        gdi32.CreateCompatibleBitmap
 004272E8    call        GDICheck
 004272ED    mov         dword ptr [ebp-14],eax
 004272F0    mov         eax,dword ptr [ebp-14]
 004272F3    push        eax
 004272F4    mov         eax,dword ptr [ebp+10]
 004272F7    push        eax
 004272F8    call        gdi32.SelectObject
 004272FD    mov         dword ptr [ebp-14],eax
 00427300    xor         eax,eax
 00427302    push        ebp
 00427303    push        427373
 00427308    push        dword ptr fs:[eax]
 0042730B    mov         dword ptr fs:[eax],esp
 0042730E    mov         edx,0CC0020
 00427313    mov         eax,0AA0029
 00427318    call        MakeROP4
 0042731D    push        eax
 0042731E    mov         eax,dword ptr [ebp+8]
 00427321    push        eax
 00427322    mov         eax,dword ptr [ebp+0C]
 00427325    push        eax
 00427326    mov         eax,dword ptr [ebp-14]
 00427329    push        eax
 0042732A    mov         eax,dword ptr [ebp+1C]
 0042732D    push        eax
 0042732E    mov         eax,dword ptr [ebp+20]
 00427331    push        eax
 00427332    mov         eax,dword ptr [ebp+24]
 00427335    push        eax
 00427336    mov         eax,dword ptr [ebp+28]
 00427339    push        eax
 0042733A    mov         eax,dword ptr [ebp+2C]
 0042733D    push        eax
 0042733E    mov         eax,dword ptr [ebp-8]
 00427341    push        eax
 00427342    mov         eax,dword ptr [ebp-4]
 00427345    push        eax
 00427346    push        edi
 00427347    call        gdi32.MaskBlt
 0042734C    xor         eax,eax
 0042734E    pop         edx
 0042734F    pop         ecx
 00427350    pop         ecx
 00427351    mov         dword ptr fs:[eax],edx
 00427354    push        427527
 00427359    mov         eax,dword ptr [ebp-14]
 0042735C    push        eax
 0042735D    mov         eax,dword ptr [ebp+10]
 00427360    push        eax
 00427361    call        gdi32.SelectObject
 00427366    mov         dword ptr [ebp-14],eax
 00427369    mov         eax,dword ptr [ebp-14]
 0042736C    push        eax
 0042736D    call        gdi32.DeleteObject
 00427372    ret
>00427373    jmp         @HandleFinally
>00427378    jmp         00427359
 0042737A    xor         eax,eax
 0042737C    mov         dword ptr [ebp-24],eax
 0042737F    push        0
 00427381    call        gdi32.CreateCompatibleDC
 00427386    call        GDICheck
 0042738B    mov         dword ptr [ebp-10],eax
 0042738E    xor         eax,eax
 00427390    push        ebp
 00427391    push        427520
 00427396    push        dword ptr fs:[eax]
 00427399    mov         dword ptr fs:[eax],esp
 0042739C    push        esi
 0042739D    push        ebx
 0042739E    mov         eax,dword ptr [ebp+24]
 004273A1    push        eax
 004273A2    call        gdi32.CreateCompatibleBitmap
 004273A7    call        GDICheck
 004273AC    mov         dword ptr [ebp-14],eax
 004273AF    mov         eax,dword ptr [ebp-14]
 004273B2    push        eax
 004273B3    mov         eax,dword ptr [ebp-10]
 004273B6    push        eax
 004273B7    call        gdi32.SelectObject
 004273BC    mov         dword ptr [ebp-18],eax
 004273BF    push        0
 004273C1    mov         eax,[005E095C];SystemPalette16:HPALETTE
 004273C6    push        eax
 004273C7    mov         eax,dword ptr [ebp+24]
 004273CA    push        eax
 004273CB    call        gdi32.SelectPalette
 004273D0    mov         dword ptr [ebp-24],eax
 004273D3    push        0
 004273D5    mov         eax,dword ptr [ebp-24]
 004273D8    push        eax
 004273D9    mov         eax,dword ptr [ebp+24]
 004273DC    push        eax
 004273DD    call        gdi32.SelectPalette
 004273E2    cmp         dword ptr [ebp-24],0
>004273E6    je          004273FC
 004273E8    push        0FF
 004273EA    mov         eax,dword ptr [ebp-24]
 004273ED    push        eax
 004273EE    mov         eax,dword ptr [ebp-10]
 004273F1    push        eax
 004273F2    call        gdi32.SelectPalette
 004273F7    mov         dword ptr [ebp-24],eax
>004273FA    jmp         00427410
 004273FC    push        0FF
 004273FE    mov         eax,[005E095C];SystemPalette16:HPALETTE
 00427403    push        eax
 00427404    mov         eax,dword ptr [ebp-10]
 00427407    push        eax
 00427408    call        gdi32.SelectPalette
 0042740D    mov         dword ptr [ebp-24],eax
 00427410    mov         eax,dword ptr [ebp-10]
 00427413    push        eax
 00427414    call        gdi32.RealizePalette
 00427419    push        0CC0020
 0042741E    push        esi
 0042741F    push        ebx
 00427420    mov         eax,dword ptr [ebp+8]
 00427423    push        eax
 00427424    mov         eax,dword ptr [ebp+0C]
 00427427    push        eax
 00427428    mov         eax,dword ptr [ebp+10]
 0042742B    push        eax
 0042742C    push        esi
 0042742D    push        ebx
 0042742E    push        0
 00427430    push        0
 00427432    mov         eax,dword ptr [ebp-10]
 00427435    push        eax
 00427436    call        gdi32.StretchBlt
 0042743B    push        440328
 00427440    push        esi
 00427441    push        ebx
 00427442    mov         eax,dword ptr [ebp+1C]
 00427445    push        eax
 00427446    mov         eax,dword ptr [ebp+20]
 00427449    push        eax
 0042744A    mov         eax,dword ptr [ebp+24]
 0042744D    push        eax
 0042744E    push        esi
 0042744F    push        ebx
 00427450    push        0
 00427452    push        0
 00427454    mov         eax,dword ptr [ebp-10]
 00427457    push        eax
 00427458    call        gdi32.StretchBlt
 0042745D    push        0
 0042745F    push        edi
 00427460    call        gdi32.SetTextColor
 00427465    mov         dword ptr [ebp-1C],eax
 00427468    push        0FFFFFF
 0042746D    push        edi
 0042746E    call        gdi32.SetBkColor
 00427473    mov         dword ptr [ebp-20],eax
 00427476    push        8800C6
 0042747B    push        esi
 0042747C    push        ebx
 0042747D    mov         eax,dword ptr [ebp+8]
 00427480    push        eax
 00427481    mov         eax,dword ptr [ebp+0C]
 00427484    push        eax
 00427485    mov         eax,dword ptr [ebp+10]
 00427488    push        eax
 00427489    mov         eax,dword ptr [ebp+28]
 0042748C    push        eax
 0042748D    mov         eax,dword ptr [ebp+2C]
 00427490    push        eax
 00427491    mov         eax,dword ptr [ebp-8]
 00427494    push        eax
 00427495    mov         eax,dword ptr [ebp-4]
 00427498    push        eax
 00427499    push        edi
 0042749A    call        gdi32.StretchBlt
 0042749F    push        660046
 004274A4    push        esi
 004274A5    push        ebx
 004274A6    push        0
 004274A8    push        0
 004274AA    mov         eax,dword ptr [ebp-10]
 004274AD    push        eax
 004274AE    mov         eax,dword ptr [ebp+28]
 004274B1    push        eax
 004274B2    mov         eax,dword ptr [ebp+2C]
 004274B5    push        eax
 004274B6    mov         eax,dword ptr [ebp-8]
 004274B9    push        eax
 004274BA    mov         eax,dword ptr [ebp-4]
 004274BD    push        eax
 004274BE    push        edi
 004274BF    call        gdi32.StretchBlt
 004274C4    mov         eax,dword ptr [ebp-1C]
 004274C7    push        eax
 004274C8    push        edi
 004274C9    call        gdi32.SetTextColor
 004274CE    mov         eax,dword ptr [ebp-20]
 004274D1    push        eax
 004274D2    push        edi
 004274D3    call        gdi32.SetBkColor
 004274D8    cmp         dword ptr [ebp-18],0
>004274DC    je          004274EB
 004274DE    mov         eax,dword ptr [ebp-18]
 004274E1    push        eax
 004274E2    mov         eax,dword ptr [ebp-10]
 004274E5    push        eax
 004274E6    call        gdi32.SelectObject
 004274EB    mov         eax,dword ptr [ebp-14]
 004274EE    push        eax
 004274EF    call        gdi32.DeleteObject
 004274F4    xor         eax,eax
 004274F6    pop         edx
 004274F7    pop         ecx
 004274F8    pop         ecx
 004274F9    mov         dword ptr fs:[eax],edx
 004274FC    push        427527
 00427501    cmp         dword ptr [ebp-24],0
>00427505    je          00427516
 00427507    push        0
 00427509    mov         eax,dword ptr [ebp-24]
 0042750C    push        eax
 0042750D    mov         eax,dword ptr [ebp-10]
 00427510    push        eax
 00427511    call        gdi32.SelectPalette
 00427516    mov         eax,dword ptr [ebp-10]
 00427519    push        eax
 0042751A    call        gdi32.DeleteDC
 0042751F    ret
>00427520    jmp         @HandleFinally
>00427525    jmp         00427501
 00427527    mov         al,byte ptr [ebp-9]
 0042752A    pop         edi
 0042752B    pop         esi
 0042752C    pop         ebx
 0042752D    mov         esp,ebp
 0042752F    pop         ebp
 00427530    ret         28
*}
end;

//00427534
procedure RGBTripleToQuad(var ColorTable:void );
begin
{*
 00427534    push        ebx
 00427535    push        esi
 00427536    push        edi
 00427537    mov         esi,eax
 00427539    mov         edi,esi
 0042753B    mov         edx,0FF
 00427540    lea         eax,[edi+edx*4]
 00427543    lea         ecx,[edx+edx*2]
 00427546    lea         ecx,[esi+ecx]
 00427549    mov         bl,byte ptr [ecx+2]
 0042754C    mov         byte ptr [eax+2],bl
 0042754F    mov         bl,byte ptr [ecx+1]
 00427552    mov         byte ptr [eax+1],bl
 00427555    mov         cl,byte ptr [ecx]
 00427557    mov         byte ptr [eax],cl
 00427559    mov         byte ptr [eax+3],0
 0042755D    dec         edx
 0042755E    test        edx,edx
>00427560    jne         00427540
 00427562    mov         byte ptr [edi+3],0
 00427566    pop         edi
 00427567    pop         esi
 00427568    pop         ebx
 00427569    ret
*}
end;

//0042756C
procedure RGBQuadToTriple(var ColorTable:void ; var ColorCount:Integer);
begin
{*
 0042756C    push        ebx
 0042756D    push        esi
 0042756E    push        edi
 0042756F    add         esp,0FFFFFFF8
 00427572    mov         dword ptr [esp],edx
 00427575    mov         esi,eax
 00427577    mov         dword ptr [esp+4],esi
 0042757B    mov         edi,dword ptr [esp]
 0042757E    mov         edi,dword ptr [edi]
 00427580    dec         edi
 00427581    test        edi,edi
>00427583    jle         004275AB
 00427585    mov         ecx,1
 0042758A    mov         eax,dword ptr [esp+4]
 0042758E    lea         eax,[eax+ecx*4]
 00427591    lea         edx,[ecx+ecx*2]
 00427594    lea         edx,[esi+edx]
 00427597    mov         bl,byte ptr [eax+2]
 0042759A    mov         byte ptr [edx+2],bl
 0042759D    mov         bl,byte ptr [eax+1]
 004275A0    mov         byte ptr [edx+1],bl
 004275A3    mov         al,byte ptr [eax]
 004275A5    mov         byte ptr [edx],al
 004275A7    inc         ecx
 004275A8    dec         edi
>004275A9    jne         0042758A
 004275AB    mov         eax,dword ptr [esp]
 004275AE    cmp         dword ptr [eax],100
>004275B4    jge         004275DE
 004275B6    mov         eax,dword ptr [esp]
 004275B9    mov         edx,100
 004275BE    sub         edx,dword ptr [eax]
 004275C0    lea         edx,[edx+edx*2]
 004275C3    mov         eax,dword ptr [esp]
 004275C6    mov         eax,dword ptr [eax]
 004275C8    lea         eax,[eax+eax*2]
 004275CB    lea         eax,[esi+eax]
 004275CE    xor         ecx,ecx
 004275D0    call        @FillChar
 004275D5    mov         eax,dword ptr [esp]
 004275D8    mov         dword ptr [eax],100
 004275DE    pop         ecx
 004275DF    pop         edx
 004275E0    pop         edi
 004275E1    pop         esi
 004275E2    pop         ebx
 004275E3    ret
*}
end;

//004275E4
procedure ByteSwapColors(var Colors:void ; Count:Integer);
begin
{*
 004275E4    push        ebp
 004275E5    mov         ebp,esp
 004275E7    add         esp,0FFFFFFD4
 004275EA    mov         dword ptr [ebp-8],edx
 004275ED    mov         dword ptr [ebp-4],eax
 004275F0    lea         eax,[ebp-2C]
 004275F3    push        eax
 004275F4    call        KERNEL32.GetSystemInfo
 004275F9    mov         edx,dword ptr [ebp-4]
 004275FC    mov         ecx,dword ptr [ebp-8]
 004275FF    dec         ecx
>00427600    js          00427635
 00427602    lea         eax,[ebp-2C]
 00427605    cmp         word ptr [eax+20],3
>0042760A    je          0042761C
 0042760C    mov         eax,dword ptr [edx+ecx*4]
 0042760F    bswap       eax
 00427611    shr         eax,8
 00427614    mov         dword ptr [edx+ecx*4],eax
 00427617    dec         ecx
>00427618    jns         0042760C
>0042761A    jmp         00427635
 0042761C    push        ebx
 0042761D    xor         ebx,ebx
 0042761F    mov         eax,dword ptr [edx+ecx*4]
 00427622    mov         bh,al
 00427624    mov         bl,ah
 00427626    shr         eax,10
 00427629    shl         ebx,8
 0042762C    mov         bl,al
 0042762E    mov         dword ptr [edx+ecx*4],ebx
 00427631    dec         ecx
>00427632    jns         0042761D
 00427634    pop         ebx
 00427635    mov         esp,ebp
 00427637    pop         ebp
 00427638    ret
*}
end;

//0042763C
{*function CreateSystemPalette(const Entries:array[$0..-$1] of TColor; const _Dv_:?):HPALETTE;
begin
 0042763C    push        ebp
 0042763D    mov         ebp,esp
 0042763F    add         esp,0FFFFFBF8
 00427645    push        ebx
 00427646    mov         word ptr [ebp-408],300
 0042764F    mov         word ptr [ebp-406],10
 00427658    lea         edx,[ebp-404]
 0042765E    mov         ecx,40
 00427663    call        Move
 00427668    push        0
 0042766A    call        user32.GetDC
 0042766F    mov         dword ptr [ebp-4],eax
 00427672    xor         eax,eax
 00427674    push        ebp
 00427675    push        427739
 0042767A    push        dword ptr fs:[eax]
 0042767D    mov         dword ptr fs:[eax],esp
 00427680    push        68
 00427682    mov         eax,dword ptr [ebp-4]
 00427685    push        eax
 00427686    call        gdi32.GetDeviceCaps
 0042768B    mov         ebx,eax
 0042768D    cmp         ebx,10
>00427690    jl          00427720
 00427696    lea         eax,[ebp-404]
 0042769C    push        eax
 0042769D    push        8
 0042769F    push        0
 004276A1    mov         eax,dword ptr [ebp-4]
 004276A4    push        eax
 004276A5    call        gdi32.GetSystemPaletteEntries
 004276AA    cmp         dword ptr [ebp-3E8],0C0C0C0
>004276B4    jne         00427702
 004276B6    lea         eax,[ebp-3E8]
 004276BC    push        eax
 004276BD    push        1
 004276BF    mov         eax,ebx
 004276C1    sub         eax,8
 004276C4    push        eax
 004276C5    mov         eax,dword ptr [ebp-4]
 004276C8    push        eax
 004276C9    call        gdi32.GetSystemPaletteEntries
 004276CE    movzx       eax,word ptr [ebp-406]
 004276D5    lea         eax,[ebp+eax*4-420]
 004276DC    push        eax
 004276DD    push        7
 004276DF    sub         ebx,7
 004276E2    push        ebx
 004276E3    mov         eax,dword ptr [ebp-4]
 004276E6    push        eax
 004276E7    call        gdi32.GetSystemPaletteEntries
 004276EC    lea         eax,[ebp-3E4]
 004276F2    push        eax
 004276F3    push        1
 004276F5    push        7
 004276F7    mov         eax,dword ptr [ebp-4]
 004276FA    push        eax
 004276FB    call        gdi32.GetSystemPaletteEntries
>00427700    jmp         00427720
 00427702    movzx       eax,word ptr [ebp-406]
 00427709    lea         eax,[ebp+eax*4-424]
 00427710    push        eax
 00427711    push        8
 00427713    sub         ebx,8
 00427716    push        ebx
 00427717    mov         eax,dword ptr [ebp-4]
 0042771A    push        eax
 0042771B    call        gdi32.GetSystemPaletteEntries
 00427720    xor         eax,eax
 00427722    pop         edx
 00427723    pop         ecx
 00427724    pop         ecx
 00427725    mov         dword ptr fs:[eax],edx
 00427728    push        427740
 0042772D    mov         eax,dword ptr [ebp-4]
 00427730    push        eax
 00427731    push        0
 00427733    call        user32.ReleaseDC
 00427738    ret
>00427739    jmp         @HandleFinally
>0042773E    jmp         0042772D
 00427740    lea         eax,[ebp-408]
 00427746    push        eax
 00427747    call        gdi32.CreatePalette
 0042774C    pop         ebx
 0042774D    mov         esp,ebp
 0042774F    pop         ebp
 00427750    ret
end;*}

//00427754
function SystemPaletteOverride(var Pal:TMaxLogPalette):Boolean;
begin
{*
 00427754    push        ebp
 00427755    mov         ebp,esp
 00427757    add         esp,0FFFFFFF8
 0042775A    push        ebx
 0042775B    mov         ebx,eax
 0042775D    mov         byte ptr [ebp-1],0
 00427761    cmp         dword ptr ds:[5E095C],0;SystemPalette16:HPALETTE
>00427768    je          004277E1
 0042776A    push        0
 0042776C    call        user32.GetDC
 00427771    mov         dword ptr [ebp-8],eax
 00427774    xor         edx,edx
 00427776    push        ebp
 00427777    push        4277DA
 0042777C    push        dword ptr fs:[edx]
 0042777F    mov         dword ptr fs:[edx],esp
 00427782    push        68
 00427784    mov         eax,dword ptr [ebp-8]
 00427787    push        eax
 00427788    call        gdi32.GetDeviceCaps
 0042778D    cmp         eax,10
>00427790    jl          004277C1
 00427792    lea         eax,[ebx+4]
 00427795    push        eax
 00427796    push        8
 00427798    push        0
 0042779A    mov         eax,[005E095C];SystemPalette16:HPALETTE
 0042779F    push        eax
 004277A0    call        gdi32.GetPaletteEntries
 004277A5    movzx       eax,word ptr [ebx+2]
 004277A9    lea         eax,[ebx+eax*4-1C]
 004277AD    push        eax
 004277AE    push        8
 004277B0    push        8
 004277B2    mov         eax,[005E095C];SystemPalette16:HPALETTE
 004277B7    push        eax
 004277B8    call        gdi32.GetPaletteEntries
 004277BD    mov         byte ptr [ebp-1],1
 004277C1    xor         eax,eax
 004277C3    pop         edx
 004277C4    pop         ecx
 004277C5    pop         ecx
 004277C6    mov         dword ptr fs:[eax],edx
 004277C9    push        4277E1
 004277CE    mov         eax,dword ptr [ebp-8]
 004277D1    push        eax
 004277D2    push        0
 004277D4    call        user32.ReleaseDC
 004277D9    ret
>004277DA    jmp         @HandleFinally
>004277DF    jmp         004277CE
 004277E1    mov         al,byte ptr [ebp-1]
 004277E4    pop         ebx
 004277E5    pop         ecx
 004277E6    pop         ecx
 004277E7    pop         ebp
 004277E8    ret
*}
end;

//004277EC
function PaletteFromDIBColorTable(DIBHandle:THandle; ColorTable:Pointer; ColorCount:Integer):HPALETTE;
begin
{*
 004277EC    push        ebx
 004277ED    push        esi
 004277EE    push        edi
 004277EF    add         esp,0FFFFFBFC
 004277F5    mov         edi,eax
 004277F7    xor         esi,esi
 004277F9    mov         word ptr [esp],300
 004277FF    test        edi,edi
>00427801    je          0042783B
 00427803    push        0
 00427805    call        gdi32.CreateCompatibleDC
 0042780A    mov         ebx,eax
 0042780C    push        edi
 0042780D    push        ebx
 0042780E    call        gdi32.SelectObject
 00427813    mov         edi,eax
 00427815    lea         eax,[esp+4]
 00427819    push        eax
 0042781A    push        100
 0042781F    push        0
 00427821    push        ebx
 00427822    call        gdi32.GetDIBColorTable
 00427827    mov         word ptr [esp+2],ax
 0042782C    push        edi
 0042782D    push        ebx
 0042782E    call        gdi32.SelectObject
 00427833    push        ebx
 00427834    call        gdi32.DeleteDC
>00427839    jmp         0042784E
 0042783B    mov         word ptr [esp+2],cx
 00427840    mov         eax,edx
 00427842    lea         edx,[esp+4]
 00427846    shl         ecx,2
 00427849    call        Move
 0042784E    cmp         word ptr [esp+2],0
>00427854    je          00427881
 00427856    cmp         word ptr [esp+2],10
>0042785C    jne         00427869
 0042785E    mov         eax,esp
 00427860    call        SystemPaletteOverride
 00427865    test        al,al
>00427867    jne         00427877
 00427869    movzx       edx,word ptr [esp+2]
 0042786E    lea         eax,[esp+4]
 00427872    call        ByteSwapColors
 00427877    mov         eax,esp
 00427879    push        eax
 0042787A    call        gdi32.CreatePalette
 0042787F    mov         esi,eax
 00427881    mov         eax,esi
 00427883    add         esp,404
 00427889    pop         edi
 0042788A    pop         esi
 0042788B    pop         ebx
 0042788C    ret
*}
end;

//00427890
{*function PaletteToDIBColorTable(Pal:HPALETTE; var ColorTable:array[$0..-$1] of Windows.TRGBQuad; const _Dv_:?):Integer;
begin
 00427890    push        ebx
 00427891    push        esi
 00427892    push        edi
 00427893    push        ecx
 00427894    mov         edi,ecx
 00427896    mov         esi,edx
 00427898    mov         ebx,eax
 0042789A    xor         eax,eax
 0042789C    mov         dword ptr [esp],eax
 0042789F    test        ebx,ebx
>004278A1    je          004278D9
 004278A3    push        esp
 004278A4    push        4
 004278A6    push        ebx
 004278A7    call        gdi32.GetObjectA
 004278AC    test        eax,eax
>004278AE    je          004278D9
 004278B0    cmp         dword ptr [esp],0
>004278B4    je          004278D9
 004278B6    lea         eax,[edi+1]
 004278B9    cmp         eax,dword ptr [esp]
>004278BC    jge         004278C1
 004278BE    mov         dword ptr [esp],eax
 004278C1    push        esi
 004278C2    mov         eax,dword ptr [esp+4]
 004278C6    push        eax
 004278C7    push        0
 004278C9    push        ebx
 004278CA    call        gdi32.GetPaletteEntries
 004278CF    mov         eax,esi
 004278D1    mov         edx,dword ptr [esp]
 004278D4    call        ByteSwapColors
 004278D9    mov         eax,dword ptr [esp]
 004278DC    pop         edx
 004278DD    pop         edi
 004278DE    pop         esi
 004278DF    pop         ebx
 004278E0    ret
end;*}

//004278E4
procedure TwoBitsFromDIB(var BI:TBitmapInfoHeader; var XorBits:HBITMAP; var AndBits:HBITMAP; const IconSize:TPoint);
begin
{*
 004278E4    push        ebp
 004278E5    mov         ebp,esp
 004278E7    add         esp,0FFFFFFEC
 004278EA    push        ebx
 004278EB    push        esi
 004278EC    push        edi
 004278ED    mov         dword ptr [ebp-8],ecx
 004278F0    mov         ebx,edx
 004278F2    mov         dword ptr [ebp-4],eax
 004278F5    mov         eax,dword ptr [ebp-4]
 004278F8    shr         dword ptr [eax+8],1
 004278FB    mov         edx,dword ptr [ebp-4]
 004278FE    movzx       edx,word ptr [edx+0E]
 00427902    mov         eax,dword ptr [ebp-4]
 00427905    mov         eax,dword ptr [eax+4]
 00427908    mov         ecx,20
 0042790D    call        BytesPerScanline
 00427912    mov         edx,dword ptr [ebp-4]
 00427915    imul        dword ptr [edx+8]
 00427918    mov         edx,dword ptr [ebp-4]
 0042791B    mov         dword ptr [edx+14],eax
 0042791E    mov         eax,dword ptr [ebp-4]
 00427921    mov         ax,word ptr [eax+0E]
 00427925    call        GetDInColors
 0042792A    mov         esi,eax
 0042792C    push        0
 0042792E    call        user32.GetDC
 00427933    mov         dword ptr [ebp-10],eax
 00427936    cmp         dword ptr [ebp-10],0
>0042793A    jne         00427941
 0042793C    call        OutOfResources
 00427941    xor         edx,edx
 00427943    push        ebp
 00427944    push        427A90
 00427949    push        dword ptr fs:[edx]
 0042794C    mov         dword ptr fs:[edx],esp
 0042794F    mov         edi,dword ptr [ebp-4]
 00427952    mov         eax,edi
 00427954    add         eax,28
 00427957    mov         edx,esi
 00427959    shl         edx,2
 0042795C    add         eax,edx
 0042795E    mov         dword ptr [ebp-14],eax
 00427961    push        0
 00427963    mov         eax,dword ptr [ebp-4]
 00427966    push        edi
 00427967    mov         eax,dword ptr [ebp-14]
 0042796A    push        eax
 0042796B    push        4
 0042796D    mov         eax,dword ptr [ebp-4]
 00427970    push        eax
 00427971    mov         eax,dword ptr [ebp-10]
 00427974    push        eax
 00427975    call        gdi32.CreateDIBitmap
 0042797A    call        GDICheck
 0042797F    mov         dword ptr [ebp-0C],eax
 00427982    xor         eax,eax
 00427984    push        ebp
 00427985    push        4279B6
 0042798A    push        dword ptr fs:[eax]
 0042798D    mov         dword ptr fs:[eax],esp
 00427990    mov         edx,dword ptr [ebp+8]
 00427993    xor         ecx,ecx
 00427995    mov         eax,dword ptr [ebp-0C]
 00427998    call        DupBits
 0042799D    mov         dword ptr [ebx],eax
 0042799F    xor         eax,eax
 004279A1    pop         edx
 004279A2    pop         ecx
 004279A3    pop         ecx
 004279A4    mov         dword ptr fs:[eax],edx
 004279A7    push        4279BD
 004279AC    mov         eax,dword ptr [ebp-0C]
 004279AF    push        eax
 004279B0    call        gdi32.DeleteObject
 004279B5    ret
>004279B6    jmp         @HandleFinally
>004279BB    jmp         004279AC
 004279BD    mov         eax,dword ptr [ebp-4]
 004279C0    mov         eax,dword ptr [eax+14]
 004279C3    add         dword ptr [ebp-14],eax
 004279C6    mov         eax,dword ptr [ebp-4]
 004279C9    mov         bx,1
 004279CD    mov         word ptr [eax+0E],bx
 004279D1    mov         eax,dword ptr [ebp-4]
 004279D4    movzx       edx,bx
 004279D7    mov         eax,dword ptr [ebp-4]
 004279DA    mov         eax,dword ptr [eax+4]
 004279DD    mov         ecx,20
 004279E2    call        BytesPerScanline
 004279E7    mov         edx,dword ptr [ebp-4]
 004279EA    imul        dword ptr [edx+8]
 004279ED    mov         edx,dword ptr [ebp-4]
 004279F0    mov         dword ptr [edx+14],eax
 004279F3    mov         eax,dword ptr [ebp-4]
 004279F6    mov         dword ptr [eax+20],2
 004279FD    mov         eax,dword ptr [ebp-4]
 00427A00    mov         dword ptr [eax+24],2
 00427A07    mov         eax,dword ptr [ebp-4]
 00427A0A    add         eax,28
 00427A0D    xor         edx,edx
 00427A0F    mov         dword ptr [eax],edx
 00427A11    mov         dword ptr [eax+4],0FFFFFF
 00427A18    push        0
 00427A1A    mov         ebx,dword ptr [ebp-4]
 00427A1D    push        ebx
 00427A1E    mov         eax,dword ptr [ebp-14]
 00427A21    push        eax
 00427A22    push        4
 00427A24    mov         eax,dword ptr [ebp-4]
 00427A27    push        ebx
 00427A28    mov         eax,dword ptr [ebp-10]
 00427A2B    push        eax
 00427A2C    call        gdi32.CreateDIBitmap
 00427A31    call        GDICheck
 00427A36    mov         dword ptr [ebp-0C],eax
 00427A39    xor         eax,eax
 00427A3B    push        ebp
 00427A3C    push        427A70
 00427A41    push        dword ptr fs:[eax]
 00427A44    mov         dword ptr fs:[eax],esp
 00427A47    mov         edx,dword ptr [ebp+8]
 00427A4A    mov         cl,1
 00427A4C    mov         eax,dword ptr [ebp-0C]
 00427A4F    call        DupBits
 00427A54    mov         edx,dword ptr [ebp-8]
 00427A57    mov         dword ptr [edx],eax
 00427A59    xor         eax,eax
 00427A5B    pop         edx
 00427A5C    pop         ecx
 00427A5D    pop         ecx
 00427A5E    mov         dword ptr fs:[eax],edx
 00427A61    push        427A77
 00427A66    mov         eax,dword ptr [ebp-0C]
 00427A69    push        eax
 00427A6A    call        gdi32.DeleteObject
 00427A6F    ret
>00427A70    jmp         @HandleFinally
>00427A75    jmp         00427A66
 00427A77    xor         eax,eax
 00427A79    pop         edx
 00427A7A    pop         ecx
 00427A7B    pop         ecx
 00427A7C    mov         dword ptr fs:[eax],edx
 00427A7F    push        427A97
 00427A84    mov         eax,dword ptr [ebp-10]
 00427A87    push        eax
 00427A88    push        0
 00427A8A    call        user32.ReleaseDC
 00427A8F    ret
>00427A90    jmp         @HandleFinally
>00427A95    jmp         00427A84
 00427A97    pop         edi
 00427A98    pop         esi
 00427A99    pop         ebx
 00427A9A    mov         esp,ebp
 00427A9C    pop         ebp
 00427A9D    ret         4
*}
end;

//00427AA0
function AdjustColor(I:Integer):Integer;
begin
{*
 00427AA0    test        eax,eax
>00427AA2    jne         00427AA9
 00427AA4    mov         eax,7FFFFFFF
 00427AA9    ret
*}
end;

//00427AAC
function BetterSize(const Old:TIconRec; const New:TIconRec):Boolean;
begin
{*
 00427AAC    push        ebp
 00427AAD    mov         ebp,esp
 00427AAF    add         esp,0FFFFFFF8
 00427AB2    push        ebx
 00427AB3    push        esi
 00427AB4    push        edi
 00427AB5    mov         dword ptr [ebp-4],eax
 00427AB8    xor         ecx,ecx
 00427ABA    mov         cl,byte ptr [edx]
 00427ABC    mov         eax,dword ptr [ebp+8]
 00427ABF    mov         eax,dword ptr [eax+8]
 00427AC2    mov         eax,dword ptr [eax]
 00427AC4    sub         ecx,eax
 00427AC6    xor         ebx,ebx
 00427AC8    mov         bl,byte ptr [edx+1]
 00427ACB    mov         edx,dword ptr [ebp+8]
 00427ACE    mov         edx,dword ptr [edx+8]
 00427AD1    sub         ebx,dword ptr [edx+4]
 00427AD4    mov         esi,dword ptr [ebp-4]
 00427AD7    movzx       esi,byte ptr [esi]
 00427ADA    mov         edx,dword ptr [ebp+8]
 00427ADD    mov         edx,dword ptr [edx+8]
 00427AE0    sub         esi,eax
 00427AE2    mov         eax,dword ptr [ebp-4]
 00427AE5    movzx       eax,byte ptr [eax+1]
 00427AE9    mov         edx,dword ptr [ebp+8]
 00427AEC    mov         edx,dword ptr [edx+8]
 00427AEF    sub         eax,dword ptr [edx+4]
 00427AF2    mov         dword ptr [ebp-8],eax
 00427AF5    mov         eax,ecx
 00427AF7    cdq
 00427AF8    xor         eax,edx
 00427AFA    sub         eax,edx
 00427AFC    mov         edi,eax
 00427AFE    mov         eax,esi
 00427B00    cdq
 00427B01    xor         eax,edx
 00427B03    sub         eax,edx
 00427B05    cmp         edi,eax
>00427B07    jg          00427B2F
 00427B09    test        ecx,ecx
>00427B0B    jle         00427B11
 00427B0D    cmp         esi,ecx
>00427B0F    jl          00427B2F
 00427B11    mov         eax,ebx
 00427B13    cdq
 00427B14    xor         eax,edx
 00427B16    sub         eax,edx
 00427B18    mov         ecx,eax
 00427B1A    mov         eax,dword ptr [ebp-8]
 00427B1D    cdq
 00427B1E    xor         eax,edx
 00427B20    sub         eax,edx
 00427B22    cmp         ecx,eax
>00427B24    jg          00427B2F
 00427B26    test        ebx,ebx
>00427B28    jle         00427B33
 00427B2A    cmp         ebx,dword ptr [ebp-8]
>00427B2D    jle         00427B33
 00427B2F    xor         eax,eax
>00427B31    jmp         00427B35
 00427B33    mov         al,1
 00427B35    pop         edi
 00427B36    pop         esi
 00427B37    pop         ebx
 00427B38    pop         ecx
 00427B39    pop         ecx
 00427B3A    pop         ebp
 00427B3B    ret
*}
end;

//00427B3C
procedure ReadIcon(Stream:TStream; var Icon:HICON; ImageCount:Integer; StartOffset:Integer; const RequestedSize:TPoint; var IconSize:TPoint);
begin
{*
 00427B3C    push        ebp
 00427B3D    mov         ebp,esp
 00427B3F    add         esp,0FFFFFF90
 00427B42    push        ebx
 00427B43    push        esi
 00427B44    push        edi
 00427B45    mov         dword ptr [ebp-0C],ecx
 00427B48    mov         dword ptr [ebp-8],edx
 00427B4B    mov         dword ptr [ebp-4],eax
 00427B4E    mov         ebx,dword ptr [ebp+0C]
 00427B51    mov         eax,dword ptr [ebp-0C]
 00427B54    shl         eax,4
 00427B57    mov         dword ptr [ebp-14],eax
 00427B5A    mov         eax,dword ptr [ebp-14]
 00427B5D    call        AllocMem
 00427B62    mov         dword ptr [ebp-10],eax
 00427B65    xor         edx,edx
 00427B67    push        ebp
 00427B68    push        427E33
 00427B6D    push        dword ptr fs:[edx]
 00427B70    mov         dword ptr fs:[edx],esp
 00427B73    mov         edx,dword ptr [ebp-10]
 00427B76    mov         ecx,dword ptr [ebp-14]
 00427B79    mov         eax,dword ptr [ebp-4]
 00427B7C    mov         esi,dword ptr [eax]
 00427B7E    call        dword ptr [esi+0C]
 00427B81    mov         eax,dword ptr [ebx]
 00427B83    or          eax,dword ptr [ebx+4]
>00427B86    jne         00427BA3
 00427B88    push        0B
 00427B8A    call        user32.GetSystemMetrics
 00427B8F    mov         edx,dword ptr [ebp+8]
 00427B92    mov         dword ptr [edx],eax
 00427B94    push        0C
 00427B96    call        user32.GetSystemMetrics
 00427B9B    mov         edx,dword ptr [ebp+8]
 00427B9E    mov         dword ptr [edx+4],eax
>00427BA1    jmp         00427BB0
 00427BA3    mov         eax,dword ptr [ebp+8]
 00427BA6    mov         edx,dword ptr [ebx]
 00427BA8    mov         dword ptr [eax],edx
 00427BAA    mov         edx,dword ptr [ebx+4]
 00427BAD    mov         dword ptr [eax+4],edx
 00427BB0    push        0
 00427BB2    call        user32.GetDC
 00427BB7    mov         dword ptr [ebp-28],eax
 00427BBA    cmp         dword ptr [ebp-28],0
>00427BBE    jne         00427BC5
 00427BC0    call        OutOfResources
 00427BC5    xor         edx,edx
 00427BC7    push        ebp
 00427BC8    push        427C25
 00427BCD    push        dword ptr fs:[edx]
 00427BD0    mov         dword ptr fs:[edx],esp
 00427BD3    push        0E
 00427BD5    mov         eax,dword ptr [ebp-28]
 00427BD8    push        eax
 00427BD9    call        gdi32.GetDeviceCaps
 00427BDE    mov         ebx,eax
 00427BE0    push        0C
 00427BE2    mov         eax,dword ptr [ebp-28]
 00427BE5    push        eax
 00427BE6    call        gdi32.GetDeviceCaps
 00427BEB    imul        bx,ax
 00427BEF    mov         eax,ebx
 00427BF1    cmp         ax,8
>00427BF5    jbe         00427C00
 00427BF7    mov         dword ptr [ebp-1C],7FFFFFFF
>00427BFE    jmp         00427C0C
 00427C00    mov         ecx,eax
 00427C02    mov         eax,1
 00427C07    shl         eax,cl
 00427C09    mov         dword ptr [ebp-1C],eax
 00427C0C    xor         eax,eax
 00427C0E    pop         edx
 00427C0F    pop         ecx
 00427C10    pop         ecx
 00427C11    mov         dword ptr fs:[eax],edx
 00427C14    push        427C2C
 00427C19    mov         eax,dword ptr [ebp-28]
 00427C1C    push        eax
 00427C1D    push        0
 00427C1F    call        user32.ReleaseDC
 00427C24    ret
>00427C25    jmp         @HandleFinally
>00427C2A    jmp         00427C19
 00427C2C    xor         eax,eax
 00427C2E    mov         dword ptr [ebp-24],eax
 00427C31    mov         eax,dword ptr [ebp-10]
 00427C34    movzx       eax,word ptr [eax+2]
 00427C38    call        AdjustColor
 00427C3D    mov         dword ptr [ebp-20],eax
 00427C40    mov         edi,dword ptr [ebp-0C]
 00427C43    dec         edi
 00427C44    test        edi,edi
>00427C46    jle         00427C94
 00427C48    mov         esi,1
 00427C4D    mov         eax,esi
 00427C4F    add         eax,eax
 00427C51    mov         edx,dword ptr [ebp-10]
 00427C54    movzx       eax,word ptr [edx+eax*8+2]
 00427C59    call        AdjustColor
 00427C5E    mov         ebx,eax
 00427C60    cmp         ebx,dword ptr [ebp-1C]
>00427C63    jg          00427C90
 00427C65    cmp         ebx,dword ptr [ebp-20]
>00427C68    jl          00427C90
 00427C6A    push        ebp
 00427C6B    mov         eax,esi
 00427C6D    add         eax,eax
 00427C6F    mov         edx,dword ptr [ebp-10]
 00427C72    lea         edx,[edx+eax*8]
 00427C75    mov         eax,dword ptr [ebp-24]
 00427C78    add         eax,eax
 00427C7A    mov         ecx,dword ptr [ebp-10]
 00427C7D    lea         eax,[ecx+eax*8]
 00427C80    call        BetterSize
 00427C85    pop         ecx
 00427C86    test        al,al
>00427C88    je          00427C90
 00427C8A    mov         dword ptr [ebp-24],esi
 00427C8D    mov         dword ptr [ebp-20],ebx
 00427C90    inc         esi
 00427C91    dec         edi
>00427C92    jne         00427C4D
 00427C94    mov         eax,dword ptr [ebp-24]
 00427C97    add         eax,eax
 00427C99    mov         edx,dword ptr [ebp-10]
 00427C9C    lea         eax,[edx+eax*8]
 00427C9F    mov         dword ptr [ebp-40],eax
 00427CA2    mov         eax,dword ptr [ebp-40]
 00427CA5    movzx       eax,byte ptr [eax]
 00427CA8    mov         edx,dword ptr [ebp+8]
 00427CAB    mov         dword ptr [edx],eax
 00427CAD    mov         eax,dword ptr [ebp-40]
 00427CB0    movzx       eax,byte ptr [eax+1]
 00427CB4    mov         edx,dword ptr [ebp+8]
 00427CB7    mov         dword ptr [edx+4],eax
 00427CBA    mov         eax,dword ptr [ebp-40]
 00427CBD    mov         eax,dword ptr [eax+8]
 00427CC0    call        AllocMem
 00427CC5    mov         dword ptr [ebp-2C],eax
 00427CC8    xor         eax,eax
 00427CCA    push        ebp
 00427CCB    push        427E13
 00427CD0    push        dword ptr fs:[eax]
 00427CD3    mov         dword ptr fs:[eax],esp
 00427CD6    mov         eax,dword ptr [ebp-40]
 00427CD9    mov         edx,dword ptr [eax+0C]
 00427CDC    mov         eax,dword ptr [ebp-14]
 00427CDF    add         eax,dword ptr [ebp+10]
 00427CE2    sub         edx,eax
 00427CE4    mov         cx,1
 00427CE8    mov         eax,dword ptr [ebp-4]
 00427CEB    mov         ebx,dword ptr [eax]
 00427CED    call        dword ptr [ebx+14]
 00427CF0    mov         eax,dword ptr [ebp-40]
 00427CF3    mov         ecx,dword ptr [eax+8]
 00427CF6    mov         ebx,dword ptr [ebp-2C]
 00427CF9    mov         edx,ebx
 00427CFB    mov         eax,dword ptr [ebp-4]
 00427CFE    mov         esi,dword ptr [eax]
 00427D00    call        dword ptr [esi+0C]
 00427D03    mov         eax,dword ptr [ebp+8]
 00427D06    push        eax
 00427D07    lea         ecx,[ebp-38]
 00427D0A    lea         edx,[ebp-34]
 00427D0D    mov         eax,ebx
 00427D0F    call        TwoBitsFromDIB
 00427D14    lea         eax,[ebp-70]
 00427D17    push        eax
 00427D18    push        18
 00427D1A    mov         eax,dword ptr [ebp-38]
 00427D1D    push        eax
 00427D1E    call        gdi32.GetObjectA
 00427D23    lea         eax,[ebp-58]
 00427D26    push        eax
 00427D27    push        18
 00427D29    mov         eax,dword ptr [ebp-34]
 00427D2C    push        eax
 00427D2D    call        gdi32.GetObjectA
 00427D32    mov         ebx,dword ptr [ebp-64]
 00427D35    imul        ebx,dword ptr [ebp-68]
 00427D39    movzx       eax,word ptr [ebp-60]
 00427D3D    imul        ebx,eax
 00427D40    mov         eax,dword ptr [ebp-4C]
 00427D43    imul        dword ptr [ebp-50]
 00427D46    movzx       edx,word ptr [ebp-48]
 00427D4A    imul        edx
 00427D4C    mov         dword ptr [ebp-3C],eax
 00427D4F    mov         eax,dword ptr [ebp-3C]
 00427D52    add         eax,ebx
 00427D54    mov         dword ptr [ebp-18],eax
 00427D57    mov         eax,dword ptr [ebp-18]
 00427D5A    call        AllocMem
 00427D5F    mov         dword ptr [ebp-30],eax
 00427D62    xor         eax,eax
 00427D64    push        ebp
 00427D65    push        427DF0
 00427D6A    push        dword ptr fs:[eax]
 00427D6D    mov         dword ptr fs:[eax],esp
 00427D70    mov         edi,dword ptr [ebp-30]
 00427D73    mov         esi,dword ptr [ebp-30]
 00427D76    add         esi,ebx
 00427D78    push        edi
 00427D79    push        ebx
 00427D7A    mov         eax,dword ptr [ebp-38]
 00427D7D    push        eax
 00427D7E    call        gdi32.GetBitmapBits
 00427D83    push        esi
 00427D84    mov         eax,dword ptr [ebp-3C]
 00427D87    push        eax
 00427D88    mov         eax,dword ptr [ebp-34]
 00427D8B    push        eax
 00427D8C    call        gdi32.GetBitmapBits
 00427D91    mov         eax,dword ptr [ebp-34]
 00427D94    push        eax
 00427D95    call        gdi32.DeleteObject
 00427D9A    mov         eax,dword ptr [ebp-38]
 00427D9D    push        eax
 00427D9E    call        gdi32.DeleteObject
 00427DA3    push        esi
 00427DA4    push        edi
 00427DA5    mov         al,byte ptr [ebp-46]
 00427DA8    push        eax
 00427DA9    mov         al,byte ptr [ebp-48]
 00427DAC    push        eax
 00427DAD    mov         eax,dword ptr [ebp+8]
 00427DB0    mov         eax,dword ptr [eax+4]
 00427DB3    push        eax
 00427DB4    mov         eax,dword ptr [ebp+8]
 00427DB7    mov         eax,dword ptr [eax]
 00427DB9    push        eax
 00427DBA    mov         eax,[005AF664];gvar_005AF664
 00427DBF    push        eax
 00427DC0    call        user32.CreateIcon
 00427DC5    mov         edx,dword ptr [ebp-8]
 00427DC8    mov         dword ptr [edx],eax
 00427DCA    mov         eax,dword ptr [ebp-8]
 00427DCD    cmp         dword ptr [eax],0
>00427DD0    jne         00427DD7
 00427DD2    call        GDIError
 00427DD7    xor         eax,eax
 00427DD9    pop         edx
 00427DDA    pop         ecx
 00427DDB    pop         ecx
 00427DDC    mov         dword ptr fs:[eax],edx
 00427DDF    push        427DF7
 00427DE4    mov         edx,dword ptr [ebp-18]
 00427DE7    mov         eax,dword ptr [ebp-30]
 00427DEA    call        @FreeMem
 00427DEF    ret
>00427DF0    jmp         @HandleFinally
>00427DF5    jmp         00427DE4
 00427DF7    xor         eax,eax
 00427DF9    pop         edx
 00427DFA    pop         ecx
 00427DFB    pop         ecx
 00427DFC    mov         dword ptr fs:[eax],edx
 00427DFF    push        427E1A
 00427E04    mov         eax,dword ptr [ebp-40]
 00427E07    mov         edx,dword ptr [eax+8]
 00427E0A    mov         eax,dword ptr [ebp-2C]
 00427E0D    call        @FreeMem
 00427E12    ret
>00427E13    jmp         @HandleFinally
>00427E18    jmp         00427E04
 00427E1A    xor         eax,eax
 00427E1C    pop         edx
 00427E1D    pop         ecx
 00427E1E    pop         ecx
 00427E1F    mov         dword ptr fs:[eax],edx
 00427E22    push        427E3A
 00427E27    mov         edx,dword ptr [ebp-14]
 00427E2A    mov         eax,dword ptr [ebp-10]
 00427E2D    call        @FreeMem
 00427E32    ret
>00427E33    jmp         @HandleFinally
>00427E38    jmp         00427E27
 00427E3A    pop         edi
 00427E3B    pop         esi
 00427E3C    pop         ebx
 00427E3D    mov         esp,ebp
 00427E3F    pop         ebp
 00427E40    ret         0C
*}
end;

//00427E44
function ComputeAldusChecksum(var WMF:TMetafileHeader):Word;
begin
{*
 00427E44    xor         ecx,ecx
 00427E46    mov         edx,eax
 00427E48    add         eax,14
>00427E4B    jmp         00427E53
 00427E4D    xor         cx,word ptr [edx]
 00427E50    add         edx,2
 00427E53    cmp         edx,eax
>00427E55    jl          00427E4D
 00427E57    mov         eax,ecx
 00427E59    ret
*}
end;

//00427E5C
procedure InitializeBitmapInfoHeader(Bitmap:HBITMAP; var BI:TBitmapInfoHeader; Colors:Integer);
begin
{*
 00427E5C    push        ebx
 00427E5D    push        esi
 00427E5E    push        edi
 00427E5F    add         esp,0FFFFFFAC
 00427E62    mov         esi,ecx
 00427E64    mov         ebx,edx
 00427E66    xor         edx,edx
 00427E68    mov         dword ptr [esp+18],edx
 00427E6C    push        esp
 00427E6D    push        54
 00427E6F    push        eax
 00427E70    call        gdi32.GetObjectA
 00427E75    test        eax,eax
>00427E77    jne         00427E80
 00427E79    call        InvalidBitmap
>00427E7E    jmp         00427EBF
 00427E80    cmp         eax,40
>00427E83    jl          00427E9D
 00427E85    cmp         dword ptr [esp+18],28
>00427E8A    jb          00427E9D
 00427E8C    push        esi
 00427E8D    mov         edi,ebx
 00427E8F    lea         esi,[esp+1C]
 00427E93    mov         ecx,0A
 00427E98    rep movs    dword ptr [edi],dword ptr [esi]
 00427E9A    pop         esi
>00427E9B    jmp         00427EBF
 00427E9D    mov         eax,ebx
 00427E9F    xor         ecx,ecx
 00427EA1    mov         edx,28
 00427EA6    call        @FillChar
 00427EAB    mov         dword ptr [ebx],28
 00427EB1    mov         eax,dword ptr [esp+4]
 00427EB5    mov         dword ptr [ebx+4],eax
 00427EB8    mov         eax,dword ptr [esp+8]
 00427EBC    mov         dword ptr [ebx+8],eax
 00427EBF    mov         eax,esi
 00427EC1    sub         eax,2
>00427EC4    je          00427ED5
 00427EC6    dec         eax
 00427EC7    sub         eax,0E
>00427ECA    jb          00427EDD
 00427ECC    sub         eax,0F0
>00427ED1    jb          00427EE8
>00427ED3    jmp         00427EF3
 00427ED5    mov         word ptr [ebx+0E],1
>00427EDB    jmp         00427F01
 00427EDD    mov         word ptr [ebx+0E],4
 00427EE3    mov         dword ptr [ebx+20],esi
>00427EE6    jmp         00427F01
 00427EE8    mov         word ptr [ebx+0E],8
 00427EEE    mov         dword ptr [ebx+20],esi
>00427EF1    jmp         00427F01
 00427EF3    mov         ax,word ptr [esp+12]
 00427EF8    imul        word ptr [esp+10]
 00427EFD    mov         word ptr [ebx+0E],ax
 00427F01    mov         word ptr [ebx+0C],1
 00427F07    mov         eax,dword ptr [ebx+20]
 00427F0A    cmp         eax,dword ptr [ebx+24]
>00427F0D    jae         00427F12
 00427F0F    mov         dword ptr [ebx+24],eax
 00427F12    cmp         dword ptr [ebx+14],0
>00427F16    jne         00427F39
 00427F18    movzx       edx,word ptr [ebx+0E]
 00427F1C    mov         eax,dword ptr [ebx+4]
 00427F1F    mov         ecx,20
 00427F24    call        BytesPerScanline
 00427F29    mov         ecx,eax
 00427F2B    mov         eax,dword ptr [ebx+8]
 00427F2E    cdq
 00427F2F    xor         eax,edx
 00427F31    sub         eax,edx
 00427F33    imul        ecx,eax
 00427F36    mov         dword ptr [ebx+14],ecx
 00427F39    add         esp,54
 00427F3C    pop         edi
 00427F3D    pop         esi
 00427F3E    pop         ebx
 00427F3F    ret
*}
end;

//00427F40
procedure InternalGetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD; Colors:Integer);
begin
{*
 00427F40    push        ebp
 00427F41    mov         ebp,esp
 00427F43    add         esp,0FFFFFFD8
 00427F46    push        ebx
 00427F47    push        esi
 00427F48    mov         esi,ecx
 00427F4A    mov         ebx,edx
 00427F4C    lea         edx,[ebp-28]
 00427F4F    mov         ecx,dword ptr [ebp+8]
 00427F52    call        InitializeBitmapInfoHeader
 00427F57    mov         ax,word ptr [ebp-1A]
 00427F5B    cmp         ax,8
>00427F5F    jbe         00427F72
 00427F61    mov         dword ptr [ebx],28
 00427F67    test        byte ptr [ebp-18],3
>00427F6B    je          00427F96
 00427F6D    add         dword ptr [ebx],0C
>00427F70    jmp         00427F96
 00427F72    mov         edx,dword ptr [ebp-8]
 00427F75    test        edx,edx
>00427F77    jne         00427F8C
 00427F79    mov         ecx,eax
 00427F7B    mov         eax,1
 00427F80    shl         eax,cl
 00427F82    shl         eax,2
 00427F85    add         eax,28
 00427F88    mov         dword ptr [ebx],eax
>00427F8A    jmp         00427F96
 00427F8C    mov         eax,edx
 00427F8E    shl         eax,2
 00427F91    add         eax,28
 00427F94    mov         dword ptr [ebx],eax
 00427F96    mov         eax,dword ptr [ebp-14]
 00427F99    mov         dword ptr [esi],eax
 00427F9B    pop         esi
 00427F9C    pop         ebx
 00427F9D    mov         esp,ebp
 00427F9F    pop         ebp
 00427FA0    ret         4
*}
end;

//00427FA4
procedure GetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD);
begin
{*
 00427FA4    push        0
 00427FA6    call        InternalGetDIBSizes
 00427FAB    ret
*}
end;

//00427FAC
function InternalGetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ; Colors:Integer):Boolean;
begin
{*
 00427FAC    push        ebp
 00427FAD    mov         ebp,esp
 00427FAF    add         esp,0FFFFFFF4
 00427FB2    push        ebx
 00427FB3    push        esi
 00427FB4    push        edi
 00427FB5    mov         ebx,ecx
 00427FB7    mov         edi,edx
 00427FB9    mov         esi,eax
 00427FBB    mov         edx,ebx
 00427FBD    mov         ecx,dword ptr [ebp+8]
 00427FC0    mov         eax,esi
 00427FC2    call        InitializeBitmapInfoHeader
 00427FC7    xor         eax,eax
 00427FC9    mov         dword ptr [ebp-8],eax
 00427FCC    push        0
 00427FCE    call        gdi32.CreateCompatibleDC
 00427FD3    mov         dword ptr [ebp-0C],eax
 00427FD6    xor         eax,eax
 00427FD8    push        ebp
 00427FD9    push        428049
 00427FDE    push        dword ptr fs:[eax]
 00427FE1    mov         dword ptr fs:[eax],esp
 00427FE4    test        edi,edi
>00427FE6    je          00428000
 00427FE8    push        0
 00427FEA    push        edi
 00427FEB    mov         eax,dword ptr [ebp-0C]
 00427FEE    push        eax
 00427FEF    call        gdi32.SelectPalette
 00427FF4    mov         dword ptr [ebp-8],eax
 00427FF7    mov         eax,dword ptr [ebp-0C]
 00427FFA    push        eax
 00427FFB    call        gdi32.RealizePalette
 00428000    push        0
 00428002    push        ebx
 00428003    mov         eax,dword ptr [ebp+0C]
 00428006    push        eax
 00428007    mov         eax,dword ptr [ebx+8]
 0042800A    push        eax
 0042800B    push        0
 0042800D    push        esi
 0042800E    mov         eax,dword ptr [ebp-0C]
 00428011    push        eax
 00428012    call        gdi32.GetDIBits
 00428017    test        eax,eax
 00428019    setne       byte ptr [ebp-1]
 0042801D    xor         eax,eax
 0042801F    pop         edx
 00428020    pop         ecx
 00428021    pop         ecx
 00428022    mov         dword ptr fs:[eax],edx
 00428025    push        428050
 0042802A    cmp         dword ptr [ebp-8],0
>0042802E    je          0042803F
 00428030    push        0
 00428032    mov         eax,dword ptr [ebp-8]
 00428035    push        eax
 00428036    mov         eax,dword ptr [ebp-0C]
 00428039    push        eax
 0042803A    call        gdi32.SelectPalette
 0042803F    mov         eax,dword ptr [ebp-0C]
 00428042    push        eax
 00428043    call        gdi32.DeleteDC
 00428048    ret
>00428049    jmp         @HandleFinally
>0042804E    jmp         0042802A
 00428050    mov         al,byte ptr [ebp-1]
 00428053    pop         edi
 00428054    pop         esi
 00428055    pop         ebx
 00428056    mov         esp,ebp
 00428058    pop         ebp
 00428059    ret         8
*}
end;

//0042805C
function GetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ):Boolean;
begin
{*
 0042805C    push        ebp
 0042805D    mov         ebp,esp
 0042805F    push        ebx
 00428060    mov         ebx,dword ptr [ebp+8]
 00428063    push        ebx
 00428064    push        0
 00428066    call        InternalGetDIB
 0042806B    pop         ebx
 0042806C    pop         ebp
 0042806D    ret         4
*}
end;

//00428070
procedure WinError;
begin
{*
 00428070    ret
*}
end;

//00428074
procedure CheckBool(Result:BOOL);
begin
{*
 00428074    test        eax,eax
>00428076    jne         0042807D
 00428078    call        WinError
 0042807D    ret
*}
end;

//00428080
procedure WriteIcon(Stream:TStream; Icon:HICON; WriteLength:Boolean);
begin
{*
 00428080    push        ebp
 00428081    mov         ebp,esp
 00428083    add         esp,0FFFFFFAC
 00428086    push        ebx
 00428087    push        esi
 00428088    push        edi
 00428089    mov         byte ptr [ebp-1],cl
 0042808C    mov         esi,edx
 0042808E    mov         ebx,eax
 00428090    lea         eax,[ebp-2A]
 00428093    xor         ecx,ecx
 00428095    mov         edx,6
 0042809A    call        @FillChar
 0042809F    lea         eax,[ebp-54]
 004280A2    xor         ecx,ecx
 004280A4    mov         edx,10
 004280A9    call        @FillChar
 004280AE    lea         eax,[ebp-44]
 004280B1    push        eax
 004280B2    push        esi
 004280B3    call        user32.GetIconInfo
 004280B8    call        CheckBool
 004280BD    xor         edx,edx
 004280BF    push        ebp
 004280C0    push        42826E
 004280C5    push        dword ptr fs:[edx]
 004280C8    mov         dword ptr fs:[edx],esp
 004280CB    push        2
 004280CD    lea         ecx,[ebp-10]
 004280D0    lea         edx,[ebp-8]
 004280D3    mov         eax,dword ptr [ebp-38]
 004280D6    call        InternalGetDIBSizes
 004280DB    push        10
 004280DD    lea         ecx,[ebp-14]
 004280E0    lea         edx,[ebp-0C]
 004280E3    mov         eax,dword ptr [ebp-34]
 004280E6    call        InternalGetDIBSizes
 004280EB    xor         eax,eax
 004280ED    mov         dword ptr [ebp-18],eax
 004280F0    xor         eax,eax
 004280F2    mov         dword ptr [ebp-1C],eax
 004280F5    xor         eax,eax
 004280F7    mov         dword ptr [ebp-20],eax
 004280FA    xor         eax,eax
 004280FC    mov         dword ptr [ebp-24],eax
 004280FF    xor         edx,edx
 00428101    push        ebp
 00428102    push        428247
 00428107    push        dword ptr fs:[edx]
 0042810A    mov         dword ptr fs:[edx],esp
 0042810D    mov         eax,dword ptr [ebp-8]
 00428110    call        AllocMem
 00428115    mov         dword ptr [ebp-18],eax
 00428118    mov         eax,dword ptr [ebp-10]
 0042811B    call        AllocMem
 00428120    mov         dword ptr [ebp-1C],eax
 00428123    mov         eax,dword ptr [ebp-0C]
 00428126    call        AllocMem
 0042812B    mov         dword ptr [ebp-20],eax
 0042812E    mov         eax,dword ptr [ebp-14]
 00428131    call        AllocMem
 00428136    mov         dword ptr [ebp-24],eax
 00428139    mov         eax,dword ptr [ebp-1C]
 0042813C    push        eax
 0042813D    push        2
 0042813F    mov         ecx,dword ptr [ebp-18]
 00428142    xor         edx,edx
 00428144    mov         eax,dword ptr [ebp-38]
 00428147    call        InternalGetDIB
 0042814C    mov         eax,dword ptr [ebp-24]
 0042814F    push        eax
 00428150    push        10
 00428152    mov         ecx,dword ptr [ebp-20]
 00428155    xor         edx,edx
 00428157    mov         eax,dword ptr [ebp-34]
 0042815A    call        InternalGetDIB
 0042815F    cmp         byte ptr [ebp-1],0
>00428163    je          00428183
 00428165    mov         eax,dword ptr [ebp-0C]
 00428168    add         eax,16
 0042816B    add         eax,dword ptr [ebp-14]
 0042816E    add         eax,dword ptr [ebp-10]
 00428171    mov         dword ptr [ebp-30],eax
 00428174    lea         edx,[ebp-30]
 00428177    mov         ecx,4
 0042817C    mov         eax,ebx
 0042817E    mov         esi,dword ptr [eax]
 00428180    call        dword ptr [esi+10]
 00428183    mov         word ptr [ebp-28],1
 00428189    mov         word ptr [ebp-26],1
 0042818F    lea         edx,[ebp-2A]
 00428192    mov         ecx,6
 00428197    mov         eax,ebx
 00428199    mov         esi,dword ptr [eax]
 0042819B    call        dword ptr [esi+10]
 0042819E    mov         esi,dword ptr [ebp-20]
 004281A1    mov         eax,esi
 004281A3    mov         dl,byte ptr [eax+4]
 004281A6    mov         byte ptr [ebp-54],dl
 004281A9    mov         dl,byte ptr [eax+8]
 004281AC    mov         byte ptr [ebp-53],dl
 004281AF    mov         dx,word ptr [eax+0C]
 004281B3    imul        dx,word ptr [eax+0E]
 004281B8    mov         word ptr [ebp-52],dx
 004281BC    mov         eax,dword ptr [ebp-0C]
 004281BF    add         eax,dword ptr [ebp-14]
 004281C2    add         eax,dword ptr [ebp-10]
 004281C5    mov         dword ptr [ebp-4C],eax
 004281C8    mov         dword ptr [ebp-48],16
 004281CF    lea         edx,[ebp-54]
 004281D2    mov         ecx,10
 004281D7    mov         eax,ebx
 004281D9    mov         edi,dword ptr [eax]
 004281DB    call        dword ptr [edi+10]
 004281DE    mov         eax,esi
 004281E0    mov         edx,dword ptr [eax+8]
 004281E3    add         dword ptr [eax+8],edx
 004281E6    mov         edx,dword ptr [ebp-20]
 004281E9    mov         ecx,dword ptr [ebp-0C]
 004281EC    mov         eax,ebx
 004281EE    mov         esi,dword ptr [eax]
 004281F0    call        dword ptr [esi+10]
 004281F3    mov         edx,dword ptr [ebp-24]
 004281F6    mov         ecx,dword ptr [ebp-14]
 004281F9    mov         eax,ebx
 004281FB    mov         esi,dword ptr [eax]
 004281FD    call        dword ptr [esi+10]
 00428200    mov         edx,dword ptr [ebp-1C]
 00428203    mov         ecx,dword ptr [ebp-10]
 00428206    mov         eax,ebx
 00428208    mov         ebx,dword ptr [eax]
 0042820A    call        dword ptr [ebx+10]
 0042820D    xor         eax,eax
 0042820F    pop         edx
 00428210    pop         ecx
 00428211    pop         ecx
 00428212    mov         dword ptr fs:[eax],edx
 00428215    push        42824E
 0042821A    mov         edx,dword ptr [ebp-0C]
 0042821D    mov         eax,dword ptr [ebp-20]
 00428220    call        @FreeMem
 00428225    mov         edx,dword ptr [ebp-14]
 00428228    mov         eax,dword ptr [ebp-24]
 0042822B    call        @FreeMem
 00428230    mov         edx,dword ptr [ebp-8]
 00428233    mov         eax,dword ptr [ebp-18]
 00428236    call        @FreeMem
 0042823B    mov         edx,dword ptr [ebp-10]
 0042823E    mov         eax,dword ptr [ebp-1C]
 00428241    call        @FreeMem
 00428246    ret
>00428247    jmp         @HandleFinally
>0042824C    jmp         0042821A
 0042824E    xor         eax,eax
 00428250    pop         edx
 00428251    pop         ecx
 00428252    pop         ecx
 00428253    mov         dword ptr fs:[eax],edx
 00428256    push        428275
 0042825B    mov         eax,dword ptr [ebp-34]
 0042825E    push        eax
 0042825F    call        gdi32.DeleteObject
 00428264    mov         eax,dword ptr [ebp-38]
 00428267    push        eax
 00428268    call        gdi32.DeleteObject
 0042826D    ret
>0042826E    jmp         @HandleFinally
>00428273    jmp         0042825B
 00428275    pop         edi
 00428276    pop         esi
 00428277    pop         ebx
 00428278    mov         esp,ebp
 0042827A    pop         ebp
 0042827B    ret
*}
end;

//0042827C
constructor TGraphic.Create;
begin
{*
 0042827C    push        ebx
 0042827D    push        esi
 0042827E    test        dl,dl
>00428280    je          0042828A
 00428282    add         esp,0FFFFFFF0
 00428285    call        @ClassCreate
 0042828A    mov         ebx,edx
 0042828C    mov         esi,eax
 0042828E    xor         edx,edx
 00428290    mov         eax,esi
 00428292    call        TObject.Create
 00428297    mov         eax,esi
 00428299    test        bl,bl
>0042829B    je          004282AC
 0042829D    call        @AfterConstruction
 004282A2    pop         dword ptr fs:[0]
 004282A9    add         esp,0C
 004282AC    mov         eax,esi
 004282AE    pop         esi
 004282AF    pop         ebx
 004282B0    ret
*}
end;

//004282B4
procedure TGraphic.Changed(Sender:TObject);
begin
{*
 004282B4    push        ebx
 004282B5    mov         byte ptr [eax+20],1
 004282B9    cmp         word ptr [eax+12],0
>004282BE    je          004282CA
 004282C0    mov         ebx,eax
 004282C2    mov         edx,eax
 004282C4    mov         eax,dword ptr [ebx+14]
 004282C7    call        dword ptr [ebx+10]
 004282CA    pop         ebx
 004282CB    ret
*}
end;

//004282CC
function DoWrite:Boolean;
begin
{*
 004282CC    push        ebp
 004282CD    mov         ebp,esp
 004282CF    push        ebx
 004282D0    mov         eax,dword ptr [ebp+8]
 004282D3    mov         eax,dword ptr [eax-4]
 004282D6    cmp         dword ptr [eax+20],0
>004282DA    je          00428313
 004282DC    mov         eax,dword ptr [ebp+8]
 004282DF    mov         eax,dword ptr [eax-4]
 004282E2    mov         ebx,dword ptr [eax+20]
 004282E5    mov         eax,ebx
 004282E7    mov         edx,dword ptr ds:[424AB8];TGraphic
 004282ED    call        @IsClass
 004282F2    test        al,al
>004282F4    je          0042830E
 004282F6    mov         eax,dword ptr [ebp+8]
 004282F9    mov         edx,ebx
 004282FB    mov         eax,dword ptr [ebp+8]
 004282FE    mov         eax,dword ptr [eax-8]
 00428301    mov         ecx,dword ptr [eax]
 00428303    call        dword ptr [ecx+18]
 00428306    test        al,al
>00428308    je          0042830E
 0042830A    xor         eax,eax
>0042830C    jmp         00428320
 0042830E    mov         al,1
 00428310    pop         ebx
 00428311    pop         ebp
 00428312    ret
 00428313    mov         eax,dword ptr [ebp+8]
 00428316    mov         eax,dword ptr [eax-8]
 00428319    mov         edx,dword ptr [eax]
 0042831B    call        dword ptr [edx+1C]
 0042831E    xor         al,1
 00428320    pop         ebx
 00428321    pop         ebp
 00428322    ret
*}
end;

//00428324
procedure TGraphic.DefineProperties(Filer:TFiler);
begin
{*
 00428324    push        ebp
 00428325    mov         ebp,esp
 00428327    add         esp,0FFFFFFF8
 0042832A    push        ebx
 0042832B    mov         dword ptr [ebp-4],edx
 0042832E    mov         dword ptr [ebp-8],eax
 00428331    mov         eax,dword ptr [ebp-8]
 00428334    push        eax
 00428335    mov         eax,dword ptr [eax]
 00428337    mov         eax,dword ptr [eax+30]
 0042833A    push        eax
 0042833B    mov         eax,dword ptr [ebp-8]
 0042833E    push        eax
 0042833F    mov         eax,dword ptr [eax]
 00428341    mov         eax,dword ptr [eax+44]
 00428344    push        eax
 00428345    push        ebp
 00428346    call        DoWrite
 0042834B    pop         ecx
 0042834C    mov         ecx,eax
 0042834E    mov         edx,428368;'Data'
 00428353    mov         eax,dword ptr [ebp-4]
 00428356    mov         ebx,dword ptr [eax]
 00428358    call        dword ptr [ebx+8]
 0042835B    pop         ebx
 0042835C    pop         ecx
 0042835D    pop         ecx
 0042835E    pop         ebp
 0042835F    ret
*}
end;

//00428370
function TGraphic.Equals(Graphic:TGraphic):Boolean;
begin
{*
 00428370    push        ebp
 00428371    mov         ebp,esp
 00428373    add         esp,0FFFFFFF4
 00428376    push        ebx
 00428377    push        esi
 00428378    push        edi
 00428379    mov         esi,edx
 0042837B    mov         ebx,eax
 0042837D    test        esi,esi
>0042837F    je          00428395
 00428381    mov         eax,ebx
 00428383    call        TObject.ClassType
 00428388    mov         edi,eax
 0042838A    mov         eax,esi
 0042838C    call        TObject.ClassType
 00428391    cmp         edi,eax
>00428393    je          00428399
 00428395    xor         eax,eax
>00428397    jmp         0042839B
 00428399    mov         al,1
 0042839B    mov         byte ptr [ebp-1],al
 0042839E    mov         eax,ebx
 004283A0    mov         edx,dword ptr [eax]
 004283A2    call        dword ptr [edx+1C]
 004283A5    test        al,al
>004283A7    jne         004283B4
 004283A9    mov         eax,esi
 004283AB    mov         edx,dword ptr [eax]
 004283AD    call        dword ptr [edx+1C]
 004283B0    test        al,al
>004283B2    je          004283D8
 004283B4    mov         eax,ebx
 004283B6    mov         edx,dword ptr [eax]
 004283B8    call        dword ptr [edx+1C]
 004283BB    test        al,al
>004283BD    je          004283CA
 004283BF    mov         eax,esi
 004283C1    mov         edx,dword ptr [eax]
 004283C3    call        dword ptr [edx+1C]
 004283C6    test        al,al
>004283C8    jne         004283CE
 004283CA    xor         eax,eax
>004283CC    jmp         004283D0
 004283CE    mov         al,1
 004283D0    mov         byte ptr [ebp-1],al
>004283D3    jmp         004284AE
 004283D8    cmp         byte ptr [ebp-1],0
>004283DC    je          004284AE
 004283E2    mov         dl,1
 004283E4    mov         eax,[00418640];TMemoryStream
 004283E9    call        TObject.Create
 004283EE    mov         dword ptr [ebp-8],eax
 004283F1    xor         eax,eax
 004283F3    push        ebp
 004283F4    push        4284A7
 004283F9    push        dword ptr fs:[eax]
 004283FC    mov         dword ptr fs:[eax],esp
 004283FF    mov         edx,dword ptr [ebp-8]
 00428402    mov         eax,ebx
 00428404    mov         ecx,dword ptr [eax]
 00428406    call        dword ptr [ecx+44]
 00428409    mov         dl,1
 0042840B    mov         eax,[00418640];TMemoryStream
 00428410    call        TObject.Create
 00428415    mov         dword ptr [ebp-0C],eax
 00428418    xor         eax,eax
 0042841A    push        ebp
 0042841B    push        42848A
 00428420    push        dword ptr fs:[eax]
 00428423    mov         dword ptr fs:[eax],esp
 00428426    mov         edx,dword ptr [ebp-0C]
 00428429    mov         eax,esi
 0042842B    mov         ecx,dword ptr [eax]
 0042842D    call        dword ptr [ecx+44]
 00428430    mov         eax,dword ptr [ebp-8]
 00428433    mov         edx,dword ptr [eax]
 00428435    call        dword ptr [edx]
 00428437    push        edx
 00428438    push        eax
 00428439    mov         eax,dword ptr [ebp-0C]
 0042843C    mov         edx,dword ptr [eax]
 0042843E    call        dword ptr [edx]
 00428440    cmp         edx,dword ptr [esp+4]
>00428444    jne         00428449
 00428446    cmp         eax,dword ptr [esp]
 00428449    pop         edx
 0042844A    pop         eax
>0042844B    jne         0042846B
 0042844D    mov         eax,dword ptr [ebp-8]
 00428450    mov         edx,dword ptr [eax]
 00428452    call        dword ptr [edx]
 00428454    mov         ecx,eax
 00428456    mov         eax,dword ptr [ebp-0C]
 00428459    mov         edx,dword ptr [eax+4]
 0042845C    mov         eax,dword ptr [ebp-8]
 0042845F    mov         eax,dword ptr [eax+4]
 00428462    call        CompareMem
 00428467    test        al,al
>00428469    jne         0042846F
 0042846B    xor         eax,eax
>0042846D    jmp         00428471
 0042846F    mov         al,1
 00428471    mov         byte ptr [ebp-1],al
 00428474    xor         eax,eax
 00428476    pop         edx
 00428477    pop         ecx
 00428478    pop         ecx
 00428479    mov         dword ptr fs:[eax],edx
 0042847C    push        428491
 00428481    mov         eax,dword ptr [ebp-0C]
 00428484    call        TObject.Free
 00428489    ret
>0042848A    jmp         @HandleFinally
>0042848F    jmp         00428481
 00428491    xor         eax,eax
 00428493    pop         edx
 00428494    pop         ecx
 00428495    pop         ecx
 00428496    mov         dword ptr fs:[eax],edx
 00428499    push        4284AE
 0042849E    mov         eax,dword ptr [ebp-8]
 004284A1    call        TObject.Free
 004284A6    ret
>004284A7    jmp         @HandleFinally
>004284AC    jmp         0042849E
 004284AE    mov         al,byte ptr [ebp-1]
 004284B1    pop         edi
 004284B2    pop         esi
 004284B3    pop         ebx
 004284B4    mov         esp,ebp
 004284B6    pop         ebp
 004284B7    ret
*}
end;

//004284B8
{*function sub_004284B8:?;
begin
 004284B8    xor         eax,eax
 004284BA    ret
end;*}

//004284BC
{*function sub_004284BC:?;
begin
 004284BC    mov         al,byte ptr [eax+21];TGraphic.FTransparent:Boolean
 004284BF    ret
end;*}

//004284C0
procedure TGraphic.LoadFromFile(const Filename:AnsiString);
begin
{*
 004284C0    push        ebp
 004284C1    mov         ebp,esp
 004284C3    push        ecx
 004284C4    push        esi
 004284C5    mov         esi,eax
 004284C7    push        20
 004284C9    mov         ecx,edx
 004284CB    mov         eax,[00418550];TFileStream
 004284D0    mov         dl,1
 004284D2    call        TFileStream.Create
 004284D7    mov         dword ptr [ebp-4],eax
 004284DA    xor         eax,eax
 004284DC    push        ebp
 004284DD    push        428508
 004284E2    push        dword ptr fs:[eax]
 004284E5    mov         dword ptr fs:[eax],esp
 004284E8    mov         edx,dword ptr [ebp-4]
 004284EB    mov         eax,esi
 004284ED    mov         ecx,dword ptr [eax]
 004284EF    call        dword ptr [ecx+54]
 004284F2    xor         eax,eax
 004284F4    pop         edx
 004284F5    pop         ecx
 004284F6    pop         ecx
 004284F7    mov         dword ptr fs:[eax],edx
 004284FA    push        42850F
 004284FF    mov         eax,dword ptr [ebp-4]
 00428502    call        TObject.Free
 00428507    ret
>00428508    jmp         @HandleFinally
>0042850D    jmp         004284FF
 0042850F    pop         esi
 00428510    pop         ecx
 00428511    pop         ebp
 00428512    ret
*}
end;

//00428514
procedure TGraphic.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);
begin
{*
 00428514    push        ebp
 00428515    mov         ebp,esp
 00428517    push        ebx
 00428518    cmp         word ptr [eax+1A],0
>0042851D    je          00428537
 0042851F    mov         bl,byte ptr [ebp+14]
 00428522    push        ebx
 00428523    mov         bl,byte ptr [ebp+10]
 00428526    push        ebx
 00428527    mov         ebx,dword ptr [ebp+0C]
 0042852A    push        ebx
 0042852B    mov         ebx,dword ptr [ebp+8]
 0042852E    push        ebx
 0042852F    mov         ebx,eax
 00428531    mov         eax,dword ptr [ebx+1C]
 00428534    call        dword ptr [ebx+18]
 00428537    pop         ebx
 00428538    pop         ebp
 00428539    ret         10
*}
end;

//0042853C
procedure TGraphic.ReadData(Stream:TStream);
begin
{*
 0042853C    push        esi
 0042853D    mov         esi,eax
 0042853F    mov         eax,esi
 00428541    mov         ecx,dword ptr [eax]
 00428543    call        dword ptr [ecx+54]
 00428546    pop         esi
 00428547    ret
*}
end;

//00428548
procedure TGraphic.SaveToFile(const Filename:AnsiString);
begin
{*
 00428548    push        ebp
 00428549    mov         ebp,esp
 0042854B    push        ecx
 0042854C    push        esi
 0042854D    mov         esi,eax
 0042854F    push        0FFFF
 00428554    mov         ecx,edx
 00428556    mov         eax,[00418550];TFileStream
 0042855B    mov         dl,1
 0042855D    call        TFileStream.Create
 00428562    mov         dword ptr [ebp-4],eax
 00428565    xor         eax,eax
 00428567    push        ebp
 00428568    push        428593
 0042856D    push        dword ptr fs:[eax]
 00428570    mov         dword ptr fs:[eax],esp
 00428573    mov         edx,dword ptr [ebp-4]
 00428576    mov         eax,esi
 00428578    mov         ecx,dword ptr [eax]
 0042857A    call        dword ptr [ecx+58]
 0042857D    xor         eax,eax
 0042857F    pop         edx
 00428580    pop         ecx
 00428581    pop         ecx
 00428582    mov         dword ptr fs:[eax],edx
 00428585    push        42859A
 0042858A    mov         eax,dword ptr [ebp-4]
 0042858D    call        TObject.Free
 00428592    ret
>00428593    jmp         @HandleFinally
>00428598    jmp         0042858A
 0042859A    pop         esi
 0042859B    pop         ecx
 0042859C    pop         ebp
 0042859D    ret
*}
end;

//004285A0
procedure sub_004285A0;
begin
{*
 004285A0    ret
*}
end;

//004285A4
procedure TGraphic.SetTransparent(Value:Boolean);
begin
{*
 004285A4    cmp         dl,byte ptr [eax+21]
>004285A7    je          004285B3
 004285A9    mov         byte ptr [eax+21],dl
 004285AC    mov         edx,eax
 004285AE    mov         ecx,dword ptr [eax]
 004285B0    call        dword ptr [ecx+10]
 004285B3    ret
*}
end;

//004285B4
procedure TGraphic.WriteData(Stream:TStream);
begin
{*
 004285B4    push        esi
 004285B5    mov         esi,eax
 004285B7    mov         eax,esi
 004285B9    mov         ecx,dword ptr [eax]
 004285BB    call        dword ptr [ecx+58]
 004285BE    pop         esi
 004285BF    ret
*}
end;

//0042865C
constructor TFileFormatsList.Create;
begin
{*
 0042865C    push        ebp
 0042865D    mov         ebp,esp
 0042865F    xor         ecx,ecx
 00428661    push        ecx
 00428662    push        ecx
 00428663    push        ecx
 00428664    push        ecx
 00428665    push        ebx
 00428666    push        esi
 00428667    test        dl,dl
>00428669    je          00428673
 0042866B    add         esp,0FFFFFFF0
 0042866E    call        @ClassCreate
 00428673    mov         ebx,edx
 00428675    mov         esi,eax
 00428677    xor         eax,eax
 00428679    push        ebp
 0042867A    push        428739
 0042867F    push        dword ptr fs:[eax]
 00428682    mov         dword ptr fs:[eax],esp
 00428685    xor         edx,edx
 00428687    mov         eax,esi
 00428689    call        TObject.Create
 0042868E    push        0
 00428690    mov         eax,[00424D78];TMetafile
 00428695    push        eax
 00428696    lea         edx,[ebp-4]
 00428699    mov         eax,[005AE4A8];^SVMetafiles:TResStringRec
 0042869E    call        LoadStr
 004286A3    mov         ecx,dword ptr [ebp-4]
 004286A6    mov         edx,428768;'wmf'
 004286AB    mov         eax,esi
 004286AD    call        TFileFormatsList.Add
 004286B2    push        0
 004286B4    mov         eax,[00424D78];TMetafile
 004286B9    push        eax
 004286BA    lea         edx,[ebp-8]
 004286BD    mov         eax,[005AE1EC];^SVEnhMetafiles:TResStringRec
 004286C2    call        LoadStr
 004286C7    mov         ecx,dword ptr [ebp-8]
 004286CA    mov         edx,428774;'emf'
 004286CF    mov         eax,esi
 004286D1    call        TFileFormatsList.Add
 004286D6    push        0
 004286D8    mov         eax,[00424FFC];TIcon
 004286DD    push        eax
 004286DE    lea         edx,[ebp-0C]
 004286E1    mov         eax,[005AE1E8];^SVIcons:TResStringRec
 004286E6    call        LoadStr
 004286EB    mov         ecx,dword ptr [ebp-0C]
 004286EE    mov         edx,428780;'ico'
 004286F3    mov         eax,esi
 004286F5    call        TFileFormatsList.Add
 004286FA    push        0
 004286FC    mov         eax,[00424EB8];TBitmap
 00428701    push        eax
 00428702    lea         edx,[ebp-10]
 00428705    mov         eax,[005AE1E4];^SVBitmaps:TResStringRec
 0042870A    call        LoadStr
 0042870F    mov         ecx,dword ptr [ebp-10]
 00428712    mov         edx,42878C;'bmp'
 00428717    mov         eax,esi
 00428719    call        TFileFormatsList.Add
 0042871E    xor         eax,eax
 00428720    pop         edx
 00428721    pop         ecx
 00428722    pop         ecx
 00428723    mov         dword ptr fs:[eax],edx
 00428726    push        428740
 0042872B    lea         eax,[ebp-10]
 0042872E    mov         edx,4
 00428733    call        @LStrArrayClr
 00428738    ret
>00428739    jmp         @HandleFinally
>0042873E    jmp         0042872B
 00428740    mov         eax,esi
 00428742    test        bl,bl
>00428744    je          00428755
 00428746    call        @AfterConstruction
 0042874B    pop         dword ptr fs:[0]
 00428752    add         esp,0C
 00428755    mov         eax,esi
 00428757    pop         esi
 00428758    pop         ebx
 00428759    mov         esp,ebp
 0042875B    pop         ebp
 0042875C    ret
*}
end;

//00428790
destructor TFileFormatsList.Destroy;
begin
{*
 00428790    push        ebx
 00428791    push        esi
 00428792    push        edi
 00428793    push        ebp
 00428794    call        @BeforeDestruction
 00428799    mov         ebx,edx
 0042879B    mov         edi,eax
 0042879D    mov         ebp,dword ptr [edi+8]
 004287A0    dec         ebp
 004287A1    test        ebp,ebp
>004287A3    jl          004287C0
 004287A5    inc         ebp
 004287A6    xor         esi,esi
 004287A8    mov         edx,esi
 004287AA    mov         eax,edi
 004287AC    call        TList.Get
 004287B1    mov         edx,dword ptr ds:[4285C0];TFileFormat
 004287B7    call        @Dispose
 004287BC    inc         esi
 004287BD    dec         ebp
>004287BE    jne         004287A8
 004287C0    mov         edx,ebx
 004287C2    and         dl,0FC
 004287C5    mov         eax,edi
 004287C7    call        TList.Destroy
 004287CC    test        bl,bl
>004287CE    jle         004287D7
 004287D0    mov         eax,edi
 004287D2    call        @ClassDestroy
 004287D7    pop         ebp
 004287D8    pop         edi
 004287D9    pop         esi
 004287DA    pop         ebx
 004287DB    ret
*}
end;

//004287DC
procedure TFileFormatsList.Add(const Ext:AnsiString; const Desc:AnsiString; DescID:Integer; AClass:TGraphicClass);
begin
{*
 004287DC    push        ebp
 004287DD    mov         ebp,esp
 004287DF    add         esp,0FFFFFFF4
 004287E2    push        ebx
 004287E3    push        esi
 004287E4    push        edi
 004287E5    xor         ebx,ebx
 004287E7    mov         dword ptr [ebp-0C],ebx
 004287EA    mov         dword ptr [ebp-8],ecx
 004287ED    mov         dword ptr [ebp-4],edx
 004287F0    mov         edi,eax
 004287F2    xor         eax,eax
 004287F4    push        ebp
 004287F5    push        42885F
 004287FA    push        dword ptr fs:[eax]
 004287FD    mov         dword ptr fs:[eax],esp
 00428800    mov         edx,dword ptr ds:[4285C0];TFileFormat
 00428806    mov         eax,10
 0042880B    call        @New
 00428810    mov         esi,eax
 00428812    mov         ebx,esi
 00428814    lea         edx,[ebp-0C]
 00428817    mov         eax,dword ptr [ebp-4]
 0042881A    call        AnsiLowerCase
 0042881F    mov         edx,dword ptr [ebp-0C]
 00428822    lea         eax,[ebx+4]
 00428825    call        @LStrAsg
 0042882A    mov         eax,dword ptr [ebp+8]
 0042882D    mov         dword ptr [ebx],eax
 0042882F    lea         eax,[ebx+8]
 00428832    mov         edx,dword ptr [ebp-8]
 00428835    call        @LStrAsg
 0042883A    mov         eax,dword ptr [ebp+0C]
 0042883D    mov         dword ptr [ebx+0C],eax
 00428840    mov         edx,esi
 00428842    mov         eax,edi
 00428844    call        TList.Add
 00428849    xor         eax,eax
 0042884B    pop         edx
 0042884C    pop         ecx
 0042884D    pop         ecx
 0042884E    mov         dword ptr fs:[eax],edx
 00428851    push        428866
 00428856    lea         eax,[ebp-0C]
 00428859    call        @LStrClr
 0042885E    ret
>0042885F    jmp         @HandleFinally
>00428864    jmp         00428856
 00428866    pop         edi
 00428867    pop         esi
 00428868    pop         ebx
 00428869    mov         esp,ebp
 0042886B    pop         ebp
 0042886C    ret         8
*}
end;

//00428870
function TFileFormatsList.FindExt(Ext:AnsiString):TGraphicClass;
begin
{*
 00428870    push        ebp
 00428871    mov         ebp,esp
 00428873    add         esp,0FFFFFFF8
 00428876    push        ebx
 00428877    push        esi
 00428878    push        edi
 00428879    xor         ecx,ecx
 0042887B    mov         dword ptr [ebp-8],ecx
 0042887E    mov         dword ptr [ebp-4],edx
 00428881    mov         edi,eax
 00428883    mov         eax,dword ptr [ebp-4]
 00428886    call        @LStrAddRef
 0042888B    xor         eax,eax
 0042888D    push        ebp
 0042888E    push        4288F7
 00428893    push        dword ptr fs:[eax]
 00428896    mov         dword ptr fs:[eax],esp
 00428899    lea         edx,[ebp-8]
 0042889C    mov         eax,dword ptr [ebp-4]
 0042889F    call        AnsiLowerCase
 004288A4    mov         edx,dword ptr [ebp-8]
 004288A7    lea         eax,[ebp-4]
 004288AA    call        @LStrLAsg
 004288AF    mov         ebx,dword ptr [edi+8]
 004288B2    dec         ebx
 004288B3    cmp         ebx,0
>004288B6    jl          004288DA
 004288B8    mov         edx,ebx
 004288BA    mov         eax,edi
 004288BC    call        TList.Get
 004288C1    mov         esi,eax
 004288C3    mov         eax,dword ptr [esi+4]
 004288C6    mov         edx,dword ptr [ebp-4]
 004288C9    call        @LStrCmp
>004288CE    jne         004288D4
 004288D0    mov         ebx,dword ptr [esi]
>004288D2    jmp         004288DC
 004288D4    dec         ebx
 004288D5    cmp         ebx,0FFFFFFFF
>004288D8    jne         004288B8
 004288DA    xor         ebx,ebx
 004288DC    xor         eax,eax
 004288DE    pop         edx
 004288DF    pop         ecx
 004288E0    pop         ecx
 004288E1    mov         dword ptr fs:[eax],edx
 004288E4    push        4288FE
 004288E9    lea         eax,[ebp-8]
 004288EC    mov         edx,2
 004288F1    call        @LStrArrayClr
 004288F6    ret
>004288F7    jmp         @HandleFinally
>004288FC    jmp         004288E9
 004288FE    mov         eax,ebx
 00428900    pop         edi
 00428901    pop         esi
 00428902    pop         ebx
 00428903    pop         ecx
 00428904    pop         ecx
 00428905    pop         ebp
 00428906    ret
*}
end;

//00428908
function TFileFormatsList.FindClassName(const Classname:AnsiString):TGraphicClass;
begin
{*
 00428908    push        ebp
 00428909    mov         ebp,esp
 0042890B    add         esp,0FFFFFEF8
 00428911    push        ebx
 00428912    push        esi
 00428913    push        edi
 00428914    xor         ecx,ecx
 00428916    mov         dword ptr [ebp-8],ecx
 00428919    mov         dword ptr [ebp-4],edx
 0042891C    mov         edi,eax
 0042891E    xor         eax,eax
 00428920    push        ebp
 00428921    push        428986
 00428926    push        dword ptr fs:[eax]
 00428929    mov         dword ptr fs:[eax],esp
 0042892C    mov         ebx,dword ptr [edi+8]
 0042892F    dec         ebx
 00428930    cmp         ebx,0
>00428933    jl          0042896E
 00428935    mov         edx,ebx
 00428937    mov         eax,edi
 00428939    call        TList.Get
 0042893E    mov         esi,dword ptr [eax]
 00428940    lea         edx,[ebp-108]
 00428946    mov         eax,esi
 00428948    call        TObject.ClassName
 0042894D    lea         edx,[ebp-108]
 00428953    lea         eax,[ebp-8]
 00428956    call        @LStrFromString
 0042895B    mov         eax,dword ptr [ebp-8]
 0042895E    mov         edx,dword ptr [ebp-4]
 00428961    call        @LStrCmp
>00428966    je          00428970
 00428968    dec         ebx
 00428969    cmp         ebx,0FFFFFFFF
>0042896C    jne         00428935
 0042896E    xor         esi,esi
 00428970    xor         eax,eax
 00428972    pop         edx
 00428973    pop         ecx
 00428974    pop         ecx
 00428975    mov         dword ptr fs:[eax],edx
 00428978    push        42898D
 0042897D    lea         eax,[ebp-8]
 00428980    call        @LStrClr
 00428985    ret
>00428986    jmp         @HandleFinally
>0042898B    jmp         0042897D
 0042898D    mov         eax,esi
 0042898F    pop         edi
 00428990    pop         esi
 00428991    pop         ebx
 00428992    mov         esp,ebp
 00428994    pop         ebp
 00428995    ret
*}
end;

//00428998
procedure TFileFormatsList.Remove(AClass:TGraphicClass);
begin
{*
 00428998    push        ebx
 00428999    push        esi
 0042899A    push        edi
 0042899B    push        ebp
 0042899C    mov         ebp,edx
 0042899E    mov         edi,eax
 004289A0    mov         ebx,dword ptr [edi+8]
 004289A3    dec         ebx
 004289A4    cmp         ebx,0
>004289A7    jl          004289DD
 004289A9    mov         edx,ebx
 004289AB    mov         eax,edi
 004289AD    call        TList.Get
 004289B2    mov         esi,eax
 004289B4    mov         edx,ebp
 004289B6    mov         eax,dword ptr [esi]
 004289B8    call        TObject.InheritsFrom
 004289BD    test        al,al
>004289BF    je          004289D7
 004289C1    mov         edx,dword ptr ds:[4285C0];TFileFormat
 004289C7    mov         eax,esi
 004289C9    call        @Dispose
 004289CE    mov         edx,ebx
 004289D0    mov         eax,edi
 004289D2    call        TList.Delete
 004289D7    dec         ebx
 004289D8    cmp         ebx,0FFFFFFFF
>004289DB    jne         004289A9
 004289DD    pop         ebp
 004289DE    pop         edi
 004289DF    pop         esi
 004289E0    pop         ebx
 004289E1    ret
*}
end;

//00428A44
constructor TClipboardFormats.Create;
begin
{*
 00428A44    push        ebx
 00428A45    push        esi
 00428A46    test        dl,dl
>00428A48    je          00428A52
 00428A4A    add         esp,0FFFFFFF0
 00428A4D    call        @ClassCreate
 00428A52    mov         ebx,edx
 00428A54    mov         esi,eax
 00428A56    mov         dl,1
 00428A58    mov         eax,[00417CEC];TList
 00428A5D    call        TObject.Create
 00428A62    mov         dword ptr [esi+4],eax
 00428A65    mov         dl,1
 00428A67    mov         eax,[00417CEC];TList
 00428A6C    call        TObject.Create
 00428A71    mov         dword ptr [esi+8],eax
 00428A74    mov         ecx,dword ptr ds:[424D78];TMetafile
 00428A7A    mov         dx,3
 00428A7E    mov         eax,esi
 00428A80    call        TClipboardFormats.Add
 00428A85    mov         ecx,dword ptr ds:[424D78];TMetafile
 00428A8B    mov         dx,0E
 00428A8F    mov         eax,esi
 00428A91    call        TClipboardFormats.Add
 00428A96    mov         ecx,dword ptr ds:[424EB8];TBitmap
 00428A9C    mov         dx,2
 00428AA0    mov         eax,esi
 00428AA2    call        TClipboardFormats.Add
 00428AA7    mov         eax,esi
 00428AA9    test        bl,bl
>00428AAB    je          00428ABC
 00428AAD    call        @AfterConstruction
 00428AB2    pop         dword ptr fs:[0]
 00428AB9    add         esp,0C
 00428ABC    mov         eax,esi
 00428ABE    pop         esi
 00428ABF    pop         ebx
 00428AC0    ret
*}
end;

//00428AC4
destructor TClipboardFormats.Destroy;
begin
{*
 00428AC4    push        ebx
 00428AC5    push        esi
 00428AC6    call        @BeforeDestruction
 00428ACB    mov         ebx,edx
 00428ACD    mov         esi,eax
 00428ACF    mov         eax,dword ptr [esi+4]
 00428AD2    call        TObject.Free
 00428AD7    mov         eax,dword ptr [esi+8]
 00428ADA    call        TObject.Free
 00428ADF    test        bl,bl
>00428AE1    jle         00428AEA
 00428AE3    mov         eax,esi
 00428AE5    call        @ClassDestroy
 00428AEA    pop         esi
 00428AEB    pop         ebx
 00428AEC    ret
*}
end;

//00428AF0
procedure TClipboardFormats.Add(Fmt:Word; AClass:TGraphicClass);
begin
{*
 00428AF0    push        ebp
 00428AF1    mov         ebp,esp
 00428AF3    add         esp,0FFFFFFF8
 00428AF6    push        ebx
 00428AF7    push        esi
 00428AF8    push        edi
 00428AF9    mov         ebx,edx
 00428AFB    mov         dword ptr [ebp-4],eax
 00428AFE    mov         eax,dword ptr [ebp-4]
 00428B01    mov         eax,dword ptr [eax+4]
 00428B04    mov         edx,ecx
 00428B06    call        TList.Add
 00428B0B    mov         dword ptr [ebp-8],eax
 00428B0E    xor         eax,eax
 00428B10    push        ebp
 00428B11    push        428B34
 00428B16    push        dword ptr fs:[eax]
 00428B19    mov         dword ptr fs:[eax],esp
 00428B1C    movzx       edx,bx
 00428B1F    mov         eax,dword ptr [ebp-4]
 00428B22    mov         eax,dword ptr [eax+8]
 00428B25    call        TList.Add
 00428B2A    xor         eax,eax
 00428B2C    pop         edx
 00428B2D    pop         ecx
 00428B2E    pop         ecx
 00428B2F    mov         dword ptr fs:[eax],edx
>00428B32    jmp         00428B51
>00428B34    jmp         @HandleAnyException
 00428B39    mov         eax,dword ptr [ebp-4]
 00428B3C    mov         eax,dword ptr [eax+4]
 00428B3F    mov         edx,dword ptr [ebp-8]
 00428B42    call        TList.Delete
 00428B47    call        @RaiseAgain
 00428B4C    call        @DoneExcept
 00428B51    pop         edi
 00428B52    pop         esi
 00428B53    pop         ebx
 00428B54    pop         ecx
 00428B55    pop         ecx
 00428B56    pop         ebp
 00428B57    ret
*}
end;

//00428B58
procedure TClipboardFormats.Remove(AClass:TGraphicClass);
begin
{*
 00428B58    push        ebx
 00428B59    push        esi
 00428B5A    push        edi
 00428B5B    mov         edi,edx
 00428B5D    mov         esi,eax
 00428B5F    mov         eax,dword ptr [esi+4]
 00428B62    mov         ebx,dword ptr [eax+8]
 00428B65    dec         ebx
 00428B66    cmp         ebx,0
>00428B69    jl          00428B9A
 00428B6B    mov         edx,ebx
 00428B6D    mov         eax,dword ptr [esi+4]
 00428B70    call        TList.Get
 00428B75    mov         edx,edi
 00428B77    call        TObject.InheritsFrom
 00428B7C    test        al,al
>00428B7E    je          00428B94
 00428B80    mov         edx,ebx
 00428B82    mov         eax,dword ptr [esi+4]
 00428B85    call        TList.Delete
 00428B8A    mov         edx,ebx
 00428B8C    mov         eax,dword ptr [esi+8]
 00428B8F    call        TList.Delete
 00428B94    dec         ebx
 00428B95    cmp         ebx,0FFFFFFFF
>00428B98    jne         00428B6B
 00428B9A    pop         edi
 00428B9B    pop         esi
 00428B9C    pop         ebx
 00428B9D    ret
*}
end;

//00428BA0
function GetFileFormats:TFileFormatsList;
begin
{*
 00428BA0    cmp         dword ptr ds:[5AC800],0;gvar_005AC800
>00428BA7    jne         00428BBA
 00428BA9    mov         dl,1
 00428BAB    mov         eax,[004285EC];TFileFormatsList
 00428BB0    call        TFileFormatsList.Create
 00428BB5    mov         [005AC800],eax;gvar_005AC800
 00428BBA    mov         eax,[005AC800];gvar_005AC800
 00428BBF    ret
*}
end;

//00428BC0
function GetClipboardFormats:TClipboardFormats;
begin
{*
 00428BC0    cmp         dword ptr ds:[5AC7FC],0
>00428BC7    jne         00428BDA
 00428BC9    mov         dl,1
 00428BCB    mov         eax,[004289E4];TClipboardFormats
 00428BD0    call        TClipboardFormats.Create
 00428BD5    mov         [005AC7FC],eax
 00428BDA    mov         eax,[005AC7FC]
 00428BDF    ret
*}
end;

//00428BE0
constructor TPicture.Create;
begin
{*
 00428BE0    push        ebx
 00428BE1    push        esi
 00428BE2    test        dl,dl
>00428BE4    je          00428BEE
 00428BE6    add         esp,0FFFFFFF0
 00428BE9    call        @ClassCreate
 00428BEE    mov         ebx,edx
 00428BF0    mov         esi,eax
 00428BF2    xor         edx,edx
 00428BF4    mov         eax,esi
 00428BF6    call        TObject.Create
 00428BFB    call        GetFileFormats
 00428C00    call        GetClipboardFormats
 00428C05    mov         eax,esi
 00428C07    test        bl,bl
>00428C09    je          00428C1A
 00428C0B    call        @AfterConstruction
 00428C10    pop         dword ptr fs:[0]
 00428C17    add         esp,0C
 00428C1A    mov         eax,esi
 00428C1C    pop         esi
 00428C1D    pop         ebx
 00428C1E    ret
*}
end;

//00428C20
destructor TPicture.Destroy;
begin
{*
 00428C20    push        ebx
 00428C21    push        esi
 00428C22    call        @BeforeDestruction
 00428C27    mov         ebx,edx
 00428C29    mov         esi,eax
 00428C2B    mov         eax,dword ptr [esi+0C];TPicture.FGraphic:TGraphic
 00428C2E    call        TObject.Free
 00428C33    mov         edx,ebx
 00428C35    and         dl,0FC
 00428C38    mov         eax,esi
 00428C3A    call        TMemoryStream.Destroy
 00428C3F    test        bl,bl
>00428C41    jle         00428C4A
 00428C43    mov         eax,esi
 00428C45    call        @ClassDestroy
 00428C4A    pop         esi
 00428C4B    pop         ebx
 00428C4C    ret
*}
end;

//00428C50
procedure TPicture.AssignTo(Dest:TPersistent);
begin
{*
 00428C50    push        ebx
 00428C51    push        esi
 00428C52    mov         esi,edx
 00428C54    mov         ebx,eax
 00428C56    mov         eax,esi
 00428C58    call        TObject.ClassType
 00428C5D    mov         edx,eax
 00428C5F    mov         eax,dword ptr [ebx+0C]
 00428C62    call        @IsClass
 00428C67    test        al,al
>00428C69    je          00428C78
 00428C6B    mov         edx,dword ptr [ebx+0C]
 00428C6E    mov         eax,esi
 00428C70    mov         ecx,dword ptr [eax]
 00428C72    call        dword ptr [ecx+8]
 00428C75    pop         esi
 00428C76    pop         ebx
 00428C77    ret
 00428C78    mov         edx,esi
 00428C7A    mov         eax,ebx
 00428C7C    call        TPersistent.AssignTo
 00428C81    pop         esi
 00428C82    pop         ebx
 00428C83    ret
*}
end;

//00428C84
procedure TPicture.ForceType(GraphicType:TGraphicClass);
begin
{*
 00428C84    push        ebx
 00428C85    push        esi
 00428C86    push        edi
 00428C87    mov         edi,edx
 00428C89    mov         ebx,eax
 00428C8B    mov         esi,dword ptr [ebx+0C]
 00428C8E    mov         eax,esi
 00428C90    mov         edx,edi
 00428C92    call        @IsClass
 00428C97    test        al,al
>00428C99    jne         00428CE2
 00428C9B    mov         eax,esi
 00428C9D    call        TObject.Free
 00428CA2    xor         eax,eax
 00428CA4    mov         dword ptr [ebx+0C],eax
 00428CA7    mov         dl,1
 00428CA9    mov         eax,edi
 00428CAB    call        dword ptr [eax+48]
 00428CAE    mov         esi,eax
 00428CB0    mov         dword ptr [ebx+0C],esi
 00428CB3    mov         dword ptr [esi+14],ebx
 00428CB6    mov         eax,ebx
 00428CB8    mov         dx,0FFFD
 00428CBC    call        @FindDynaInst
 00428CC1    mov         dword ptr [esi+10],eax
 00428CC4    mov         dword ptr [esi+1C],ebx
 00428CC7    mov         eax,ebx
 00428CC9    mov         dx,0FFFC
 00428CCD    call        @FindDynaInst
 00428CD2    mov         dword ptr [esi+18],eax
 00428CD5    mov         edx,ebx
 00428CD7    mov         eax,ebx
 00428CD9    mov         si,0FFFD
 00428CDD    call        @CallDynaInst
 00428CE2    pop         edi
 00428CE3    pop         esi
 00428CE4    pop         ebx
 00428CE5    ret
*}
end;

//00428CE8
function TPicture.GetBitmap:TBitmap;
begin
{*
 00428CE8    push        ebx
 00428CE9    mov         ebx,eax
 00428CEB    mov         edx,dword ptr ds:[424EB8];TBitmap
 00428CF1    mov         eax,ebx
 00428CF3    call        TPicture.ForceType
 00428CF8    mov         eax,dword ptr [ebx+0C]
 00428CFB    pop         ebx
 00428CFC    ret
*}
end;

//00428D00
function TPicture.GetIcon:TIcon;
begin
{*
 00428D00    push        ebx
 00428D01    mov         ebx,eax
 00428D03    mov         edx,dword ptr ds:[424FFC];TIcon
 00428D09    mov         eax,ebx
 00428D0B    call        TPicture.ForceType
 00428D10    mov         eax,dword ptr [ebx+0C]
 00428D13    pop         ebx
 00428D14    ret
*}
end;

//00428D18
procedure TPicture.SetGraphic(Value:TGraphic);
begin
{*
 00428D18    push        ebp
 00428D19    mov         ebp,esp
 00428D1B    push        ecx
 00428D1C    push        ebx
 00428D1D    push        esi
 00428D1E    push        edi
 00428D1F    mov         esi,edx
 00428D21    mov         ebx,eax
 00428D23    xor         eax,eax
 00428D25    mov         dword ptr [ebp-4],eax
 00428D28    test        esi,esi
>00428D2A    je          00428D75
 00428D2C    mov         eax,esi
 00428D2E    call        TObject.ClassType
 00428D33    mov         dl,1
 00428D35    call        dword ptr [eax+48]
 00428D38    mov         dword ptr [ebp-4],eax
 00428D3B    mov         edx,esi
 00428D3D    mov         eax,dword ptr [ebp-4]
 00428D40    mov         ecx,dword ptr [eax]
 00428D42    call        dword ptr [ecx+8]
 00428D45    mov         eax,dword ptr [ebp-4]
 00428D48    mov         dword ptr [eax+14],ebx
 00428D4B    push        eax
 00428D4C    mov         eax,ebx
 00428D4E    mov         dx,0FFFD
 00428D52    call        @FindDynaInst
 00428D57    mov         edx,eax
 00428D59    pop         eax
 00428D5A    mov         dword ptr [eax+10],edx
 00428D5D    mov         eax,dword ptr [ebp-4]
 00428D60    mov         dword ptr [eax+1C],ebx
 00428D63    push        eax
 00428D64    mov         eax,ebx
 00428D66    mov         dx,0FFFC
 00428D6A    call        @FindDynaInst
 00428D6F    mov         edx,eax
 00428D71    pop         eax
 00428D72    mov         dword ptr [eax+18],edx
 00428D75    xor         eax,eax
 00428D77    push        ebp
 00428D78    push        428DA8
 00428D7D    push        dword ptr fs:[eax]
 00428D80    mov         dword ptr fs:[eax],esp
 00428D83    mov         eax,dword ptr [ebx+0C]
 00428D86    call        TObject.Free
 00428D8B    mov         eax,dword ptr [ebp-4]
 00428D8E    mov         dword ptr [ebx+0C],eax
 00428D91    mov         edx,ebx
 00428D93    mov         eax,ebx
 00428D95    mov         si,0FFFD
 00428D99    call        @CallDynaInst
 00428D9E    xor         eax,eax
 00428DA0    pop         edx
 00428DA1    pop         ecx
 00428DA2    pop         ecx
 00428DA3    mov         dword ptr fs:[eax],edx
>00428DA6    jmp         00428DBF
>00428DA8    jmp         @HandleAnyException
 00428DAD    mov         eax,dword ptr [ebp-4]
 00428DB0    call        TObject.Free
 00428DB5    call        @RaiseAgain
 00428DBA    call        @DoneExcept
 00428DBF    pop         edi
 00428DC0    pop         esi
 00428DC1    pop         ebx
 00428DC2    pop         ecx
 00428DC3    pop         ebp
 00428DC4    ret
*}
end;

//00428DC8
{*procedure sub_00428DC8(?:?; ?:AnsiString);
begin
 00428DC8    push        ebp
 00428DC9    mov         ebp,esp
 00428DCB    add         esp,0FFFFFFEC
 00428DCE    push        ebx
 00428DCF    push        esi
 00428DD0    push        edi
 00428DD1    xor         ecx,ecx
 00428DD3    mov         dword ptr [ebp-14],ecx
 00428DD6    mov         dword ptr [ebp-4],ecx
 00428DD9    mov         esi,edx
 00428DDB    mov         ebx,eax
 00428DDD    xor         eax,eax
 00428DDF    push        ebp
 00428DE0    push        428EEC
 00428DE5    push        dword ptr fs:[eax]
 00428DE8    mov         dword ptr fs:[eax],esp
 00428DEB    lea         edx,[ebp-4]
 00428DEE    mov         eax,esi
 00428DF0    call        ExtractFileExt
 00428DF5    lea         eax,[ebp-4]
 00428DF8    mov         ecx,1
 00428DFD    mov         edx,1
 00428E02    call        @LStrDelete
 00428E07    mov         edx,dword ptr [ebp-4]
 00428E0A    mov         eax,[005AC800];0x0 gvar_005AC800
 00428E0F    call        TFileFormatsList.FindExt
 00428E14    test        eax,eax
>00428E16    jne         00428E49
 00428E18    mov         eax,dword ptr [ebp-4]
 00428E1B    mov         dword ptr [ebp-10],eax
 00428E1E    mov         byte ptr [ebp-0C],0B
 00428E22    lea         eax,[ebp-10]
 00428E25    push        eax
 00428E26    push        0
 00428E28    lea         edx,[ebp-14]
 00428E2B    mov         eax,[005AE7FC];^SUnknownExtension:TResStringRec
 00428E30    call        LoadStr
 00428E35    mov         ecx,dword ptr [ebp-14]
 00428E38    mov         dl,1
 00428E3A    mov         eax,[0042410C];EInvalidGraphic
 00428E3F    call        Exception.CreateFmt;EInvalidGraphic.Create
 00428E44    call        @RaiseExcept
 00428E49    mov         dl,1
 00428E4B    call        dword ptr [eax+48]
 00428E4E    mov         dword ptr [ebp-8],eax
 00428E51    xor         eax,eax
 00428E53    push        ebp
 00428E54    push        428E8B
 00428E59    push        dword ptr fs:[eax]
 00428E5C    mov         dword ptr fs:[eax],esp
 00428E5F    mov         eax,dword ptr [ebp-8]
 00428E62    mov         dword ptr [eax+1C],ebx
 00428E65    push        eax
 00428E66    mov         eax,ebx
 00428E68    mov         dx,0FFFC
 00428E6C    call        @FindDynaInst
 00428E71    mov         edx,eax
 00428E73    pop         eax
 00428E74    mov         dword ptr [eax+18],edx
 00428E77    mov         edx,esi
 00428E79    mov         eax,dword ptr [ebp-8]
 00428E7C    mov         ecx,dword ptr [eax]
 00428E7E    call        dword ptr [ecx+4C]
 00428E81    xor         eax,eax
 00428E83    pop         edx
 00428E84    pop         ecx
 00428E85    pop         ecx
 00428E86    mov         dword ptr fs:[eax],edx
>00428E89    jmp         00428EA2
>00428E8B    jmp         @HandleAnyException
 00428E90    mov         eax,dword ptr [ebp-8]
 00428E93    call        TObject.Free
 00428E98    call        @RaiseAgain
 00428E9D    call        @DoneExcept
 00428EA2    mov         eax,dword ptr [ebx+0C]
 00428EA5    call        TObject.Free
 00428EAA    mov         esi,dword ptr [ebp-8]
 00428EAD    mov         dword ptr [ebx+0C],esi
 00428EB0    mov         dword ptr [esi+14],ebx
 00428EB3    mov         eax,ebx
 00428EB5    mov         dx,0FFFD
 00428EB9    call        @FindDynaInst
 00428EBE    mov         dword ptr [esi+10],eax
 00428EC1    mov         edx,ebx
 00428EC3    mov         eax,ebx
 00428EC5    mov         si,0FFFD
 00428EC9    call        @CallDynaInst
 00428ECE    xor         eax,eax
 00428ED0    pop         edx
 00428ED1    pop         ecx
 00428ED2    pop         ecx
 00428ED3    mov         dword ptr fs:[eax],edx
 00428ED6    push        428EF3
 00428EDB    lea         eax,[ebp-14]
 00428EDE    call        @LStrClr
 00428EE3    lea         eax,[ebp-4]
 00428EE6    call        @LStrClr
 00428EEB    ret
>00428EEC    jmp         @HandleFinally
>00428EF1    jmp         00428EDB
 00428EF3    pop         edi
 00428EF4    pop         esi
 00428EF5    pop         ebx
 00428EF6    mov         esp,ebp
 00428EF8    pop         ebp
 00428EF9    ret
end;*}

//00428EFC
procedure TPicture.SaveToFile(const Filename:AnsiString);
begin
{*
 00428EFC    push        esi
 00428EFD    push        edi
 00428EFE    mov         esi,eax
 00428F00    mov         edi,dword ptr [esi+0C]
 00428F03    test        edi,edi
>00428F05    je          00428F0E
 00428F07    mov         eax,edi
 00428F09    mov         ecx,dword ptr [eax]
 00428F0B    call        dword ptr [ecx+50]
 00428F0E    pop         edi
 00428F0F    pop         esi
 00428F10    ret
*}
end;

//00428F14
procedure TPicture.LoadFromStream(Stream:TStream);
begin
{*
 00428F14    push        ebx
 00428F15    push        esi
 00428F16    mov         esi,edx
 00428F18    mov         ebx,eax
 00428F1A    mov         eax,ebx
 00428F1C    call        TPicture.GetBitmap
 00428F21    mov         edx,esi
 00428F23    mov         ecx,dword ptr [eax]
 00428F25    call        dword ptr [ecx+54]
 00428F28    pop         esi
 00428F29    pop         ebx
 00428F2A    ret
*}
end;

//00428F2C
procedure TPicture.SaveToStream(Stream:TStream);
begin
{*
 00428F2C    push        esi
 00428F2D    push        edi
 00428F2E    mov         edi,edx
 00428F30    mov         esi,eax
 00428F32    mov         eax,esi
 00428F34    call        TPicture.GetBitmap
 00428F39    mov         edx,edi
 00428F3B    mov         ecx,dword ptr [eax]
 00428F3D    call        dword ptr [ecx+58]
 00428F40    pop         edi
 00428F41    pop         esi
 00428F42    ret
*}
end;

//00428F44
procedure TPicture.Assign(Source:TPersistent);
begin
{*
 00428F44    push        ebx
 00428F45    push        esi
 00428F46    mov         ebx,edx
 00428F48    mov         esi,eax
 00428F4A    test        ebx,ebx
>00428F4C    jne         00428F5A
 00428F4E    xor         edx,edx
 00428F50    mov         eax,esi
 00428F52    call        TPicture.SetGraphic
 00428F57    pop         esi
 00428F58    pop         ebx
 00428F59    ret
 00428F5A    mov         eax,ebx
 00428F5C    mov         edx,dword ptr ds:[424C0C];TPicture
 00428F62    call        @IsClass
 00428F67    test        al,al
>00428F69    je          00428F77
 00428F6B    mov         edx,dword ptr [ebx+0C]
 00428F6E    mov         eax,esi
 00428F70    call        TPicture.SetGraphic
>00428F75    jmp         00428F9C
 00428F77    mov         eax,ebx
 00428F79    mov         edx,dword ptr ds:[424AB8];TGraphic
 00428F7F    call        @IsClass
 00428F84    test        al,al
>00428F86    je          00428F93
 00428F88    mov         edx,ebx
 00428F8A    mov         eax,esi
 00428F8C    call        TPicture.SetGraphic
>00428F91    jmp         00428F9C
 00428F93    mov         edx,ebx
 00428F95    mov         eax,esi
 00428F97    call        TPersistent.Assign
 00428F9C    pop         esi
 00428F9D    pop         ebx
 00428F9E    ret
*}
end;

//00428FA0
procedure TPicture.RegisterFileFormat(const AExtension:AnsiString; const ADescription:AnsiString; AGraphicClass:TGraphicClass);
begin
{*
 00428FA0    push        ebp
 00428FA1    mov         ebp,esp
 00428FA3    push        ebx
 00428FA4    push        esi
 00428FA5    mov         esi,ecx
 00428FA7    mov         ebx,edx
 00428FA9    push        0
 00428FAB    mov         eax,dword ptr [ebp+8]
 00428FAE    push        eax
 00428FAF    call        GetFileFormats
 00428FB4    mov         ecx,esi
 00428FB6    mov         edx,ebx
 00428FB8    call        TFileFormatsList.Add
 00428FBD    pop         esi
 00428FBE    pop         ebx
 00428FBF    pop         ebp
 00428FC0    ret         4
*}
end;

//00428FC4
procedure TPicture.UnregisterGraphicClass(AClass:TGraphicClass);
begin
{*
 00428FC4    push        ebx
 00428FC5    mov         ebx,edx
 00428FC7    cmp         dword ptr ds:[5AC800],0;gvar_005AC800
>00428FCE    je          00428FDC
 00428FD0    mov         edx,ebx
 00428FD2    mov         eax,[005AC800];gvar_005AC800
 00428FD7    call        TFileFormatsList.Remove
 00428FDC    cmp         dword ptr ds:[5AC7FC],0
>00428FE3    je          00428FF1
 00428FE5    mov         edx,ebx
 00428FE7    mov         eax,[005AC7FC]
 00428FEC    call        TClipboardFormats.Remove
 00428FF1    pop         ebx
 00428FF2    ret
*}
end;

//00428FF4
procedure TPicture.Changed(Sender:TObject);
begin
{*
 00428FF4    push        ebx
 00428FF5    mov         ebx,eax
 00428FF7    cmp         word ptr [ebx+12],0
>00428FFC    je          00429006
 00428FFE    mov         edx,ebx
 00429000    mov         eax,dword ptr [ebx+14]
 00429003    call        dword ptr [ebx+10]
 00429006    cmp         dword ptr [ebx+18],0
>0042900A    je          00429014
 0042900C    mov         eax,dword ptr [ebx+18]
 0042900F    mov         edx,dword ptr [eax]
 00429011    call        dword ptr [edx+0C]
 00429014    pop         ebx
 00429015    ret
*}
end;

//00429018
procedure TPicture.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);
begin
{*
 00429018    push        ebp
 00429019    mov         ebp,esp
 0042901B    push        ebx
 0042901C    cmp         word ptr [eax+22],0
>00429021    je          0042903B
 00429023    mov         bl,byte ptr [ebp+14]
 00429026    push        ebx
 00429027    mov         bl,byte ptr [ebp+10]
 0042902A    push        ebx
 0042902B    mov         ebx,dword ptr [ebp+0C]
 0042902E    push        ebx
 0042902F    mov         ebx,dword ptr [ebp+8]
 00429032    push        ebx
 00429033    mov         ebx,eax
 00429035    mov         eax,dword ptr [ebx+24]
 00429038    call        dword ptr [ebx+20]
 0042903B    pop         ebx
 0042903C    pop         ebp
 0042903D    ret         10
*}
end;

//00429040
procedure TPicture.ReadData(Stream:TStream);
begin
{*
 00429040    push        ebp
 00429041    mov         ebp,esp
 00429043    add         esp,0FFFFFFB8
 00429046    push        ebx
 00429047    push        esi
 00429048    push        edi
 00429049    xor         ecx,ecx
 0042904B    mov         dword ptr [ebp-48],ecx
 0042904E    mov         esi,edx
 00429050    mov         ebx,eax
 00429052    xor         eax,eax
 00429054    push        ebp
 00429055    push        429147
 0042905A    push        dword ptr fs:[eax]
 0042905D    mov         dword ptr fs:[eax],esp
 00429060    lea         edx,[ebp-44]
 00429063    mov         ecx,1
 00429068    mov         eax,esi
 0042906A    mov         edi,dword ptr [eax]
 0042906C    call        dword ptr [edi+0C]
 0042906F    xor         ecx,ecx
 00429071    mov         cl,byte ptr [ebp-44]
 00429074    lea         edx,[ebp-43]
 00429077    mov         eax,esi
 00429079    mov         edi,dword ptr [eax]
 0042907B    call        dword ptr [edi+0C]
 0042907E    lea         eax,[ebp-48]
 00429081    lea         edx,[ebp-44]
 00429084    call        @LStrFromString
 00429089    mov         edx,dword ptr [ebp-48]
 0042908C    mov         eax,[005AC800];gvar_005AC800
 00429091    call        TFileFormatsList.FindClassName
 00429096    xor         edx,edx
 00429098    mov         dword ptr [ebp-4],edx
 0042909B    test        eax,eax
>0042909D    je          004290E0
 0042909F    mov         dl,1
 004290A1    call        dword ptr [eax+48]
 004290A4    mov         dword ptr [ebp-4],eax
 004290A7    xor         eax,eax
 004290A9    push        ebp
 004290AA    push        4290C9
 004290AF    push        dword ptr fs:[eax]
 004290B2    mov         dword ptr fs:[eax],esp
 004290B5    mov         edx,esi
 004290B7    mov         eax,dword ptr [ebp-4]
 004290BA    mov         ecx,dword ptr [eax]
 004290BC    call        dword ptr [ecx+30]
 004290BF    xor         eax,eax
 004290C1    pop         edx
 004290C2    pop         ecx
 004290C3    pop         ecx
 004290C4    mov         dword ptr fs:[eax],edx
>004290C7    jmp         004290E0
>004290C9    jmp         @HandleAnyException
 004290CE    mov         eax,dword ptr [ebp-4]
 004290D1    call        TObject.Free
 004290D6    call        @RaiseAgain
 004290DB    call        @DoneExcept
 004290E0    mov         eax,dword ptr [ebx+0C]
 004290E3    call        TObject.Free
 004290E8    mov         eax,dword ptr [ebp-4]
 004290EB    mov         dword ptr [ebx+0C],eax
 004290EE    cmp         dword ptr [ebp-4],0
>004290F2    je          00429124
 004290F4    mov         eax,dword ptr [ebp-4]
 004290F7    mov         dword ptr [eax+14],ebx
 004290FA    push        eax
 004290FB    mov         eax,ebx
 004290FD    mov         dx,0FFFD
 00429101    call        @FindDynaInst
 00429106    mov         edx,eax
 00429108    pop         eax
 00429109    mov         dword ptr [eax+10],edx
 0042910C    mov         eax,dword ptr [ebp-4]
 0042910F    mov         dword ptr [eax+1C],ebx
 00429112    push        eax
 00429113    mov         eax,ebx
 00429115    mov         dx,0FFFC
 00429119    call        @FindDynaInst
 0042911E    mov         edx,eax
 00429120    pop         eax
 00429121    mov         dword ptr [eax+18],edx
 00429124    mov         edx,ebx
 00429126    mov         eax,ebx
 00429128    mov         si,0FFFD
 0042912C    call        @CallDynaInst
 00429131    xor         eax,eax
 00429133    pop         edx
 00429134    pop         ecx
 00429135    pop         ecx
 00429136    mov         dword ptr fs:[eax],edx
 00429139    push        42914E
 0042913E    lea         eax,[ebp-48]
 00429141    call        @LStrClr
 00429146    ret
>00429147    jmp         @HandleFinally
>0042914C    jmp         0042913E
 0042914E    pop         edi
 0042914F    pop         esi
 00429150    pop         ebx
 00429151    mov         esp,ebp
 00429153    pop         ebp
 00429154    ret
*}
end;

//00429158
procedure TPicture.WriteData(Stream:TStream);
begin
{*
 00429158    push        ebx
 00429159    push        esi
 0042915A    push        edi
 0042915B    add         esp,0FFFFFEC0
 00429161    mov         esi,edx
 00429163    mov         ebx,eax
 00429165    mov         edi,dword ptr [ebx+0C]
 00429168    test        edi,edi
>0042916A    je          00429186
 0042916C    lea         edx,[esp+40]
 00429170    mov         eax,dword ptr [edi]
 00429172    call        TObject.ClassName
 00429177    lea         edx,[esp+40]
 0042917B    mov         eax,esp
 0042917D    mov         cl,3F
 0042917F    call        @PStrNCpy
>00429184    jmp         0042918A
 00429186    mov         byte ptr [esp],0
 0042918A    xor         ecx,ecx
 0042918C    mov         cl,byte ptr [esp]
 0042918F    inc         ecx
 00429190    mov         edx,esp
 00429192    mov         eax,esi
 00429194    mov         edi,dword ptr [eax]
 00429196    call        dword ptr [edi+10]
 00429199    mov         eax,dword ptr [ebx+0C]
 0042919C    test        eax,eax
>0042919E    je          004291A7
 004291A0    mov         edx,esi
 004291A2    mov         ecx,dword ptr [eax]
 004291A4    call        dword ptr [ecx+44]
 004291A7    add         esp,140
 004291AD    pop         edi
 004291AE    pop         esi
 004291AF    pop         ebx
 004291B0    ret
*}
end;

//004291B4
function DoWrite:Boolean;
begin
{*
 004291B4    push        ebp
 004291B5    mov         ebp,esp
 004291B7    push        ebx
 004291B8    push        esi
 004291B9    mov         eax,dword ptr [ebp+8]
 004291BC    mov         eax,dword ptr [eax-4]
 004291BF    mov         esi,dword ptr [eax+20]
 004291C2    test        esi,esi
>004291C4    je          0042921D
 004291C6    mov         bl,1
 004291C8    mov         eax,dword ptr [ebp+8]
 004291CB    mov         eax,esi
 004291CD    mov         edx,dword ptr ds:[424C0C];TPicture
 004291D3    call        @IsClass
 004291D8    test        al,al
>004291DA    je          0042922A
 004291DC    mov         eax,dword ptr [ebp+8]
 004291DF    mov         ebx,esi
 004291E1    mov         eax,dword ptr [ebp+8]
 004291E4    mov         eax,dword ptr [eax-8]
 004291E7    mov         eax,dword ptr [eax+0C]
 004291EA    cmp         eax,dword ptr [ebx+0C]
>004291ED    je          00429213
 004291EF    mov         eax,dword ptr [ebp+8]
 004291F2    mov         eax,dword ptr [eax-8]
 004291F5    mov         esi,dword ptr [eax+0C]
 004291F8    test        esi,esi
>004291FA    je          00429217
 004291FC    cmp         dword ptr [ebx+0C],0
>00429200    je          00429217
 00429202    mov         edx,dword ptr [ebx+0C]
 00429205    mov         eax,dword ptr [ebp+8]
 00429208    mov         eax,esi
 0042920A    mov         ecx,dword ptr [eax]
 0042920C    call        dword ptr [ecx+18]
 0042920F    test        al,al
>00429211    je          00429217
 00429213    xor         eax,eax
>00429215    jmp         00429219
 00429217    mov         al,1
 00429219    mov         ebx,eax
>0042921B    jmp         0042922A
 0042921D    mov         eax,dword ptr [ebp+8]
 00429220    mov         eax,dword ptr [eax-8]
 00429223    cmp         dword ptr [eax+0C],0
 00429227    setne       bl
 0042922A    mov         eax,ebx
 0042922C    pop         esi
 0042922D    pop         ebx
 0042922E    pop         ebp
 0042922F    ret
*}
end;

//00429230
procedure TPicture.DefineProperties(Filer:TFiler);
begin
{*
 00429230    push        ebp
 00429231    mov         ebp,esp
 00429233    add         esp,0FFFFFFF8
 00429236    push        ebx
 00429237    mov         dword ptr [ebp-4],edx
 0042923A    mov         dword ptr [ebp-8],eax
 0042923D    mov         eax,dword ptr [ebp-8]
 00429240    push        eax
 00429241    push        429040;TPicture.ReadData
 00429246    mov         eax,dword ptr [ebp-8]
 00429249    push        eax
 0042924A    push        429158;TPicture.WriteData
 0042924F    push        ebp
 00429250    call        DoWrite
 00429255    pop         ecx
 00429256    mov         ecx,eax
 00429258    mov         edx,429274;'Data'
 0042925D    mov         eax,dword ptr [ebp-4]
 00429260    mov         ebx,dword ptr [eax]
 00429262    call        dword ptr [ebx+8]
 00429265    pop         ebx
 00429266    pop         ecx
 00429267    pop         ecx
 00429268    pop         ebp
 00429269    ret
*}
end;

//0042927C
function TPicture.GetWidth:Integer;
begin
{*
 0042927C    xor         edx,edx
 0042927E    mov         ecx,dword ptr [eax+0C]
 00429281    test        ecx,ecx
>00429283    je          0042928E
 00429285    mov         eax,ecx
 00429287    mov         edx,dword ptr [eax]
 00429289    call        dword ptr [edx+2C]
 0042928C    mov         edx,eax
 0042928E    mov         eax,edx
 00429290    ret
*}
end;

//00429294
function TPicture.GetHeight:Integer;
begin
{*
 00429294    xor         edx,edx
 00429296    mov         ecx,dword ptr [eax+0C]
 00429299    test        ecx,ecx
>0042929B    je          004292A6
 0042929D    mov         eax,ecx
 0042929F    mov         edx,dword ptr [eax]
 004292A1    call        dword ptr [edx+20]
 004292A4    mov         edx,eax
 004292A6    mov         eax,edx
 004292A8    ret
*}
end;

//004292AC
destructor TMetafileImage.Destroy;
begin
{*
 004292AC    push        ebx
 004292AD    push        esi
 004292AE    call        @BeforeDestruction
 004292B3    mov         ebx,edx
 004292B5    mov         esi,eax
 004292B7    mov         eax,dword ptr [esi+8]
 004292BA    test        eax,eax
>004292BC    je          004292C4
 004292BE    push        eax
 004292BF    call        gdi32.DeleteEnhMetaFile
 004292C4    mov         eax,dword ptr [esi+14]
 004292C7    call        InternalDeletePalette
 004292CC    mov         edx,ebx
 004292CE    and         dl,0FC
 004292D1    mov         eax,esi
 004292D3    call        TObject.Destroy
 004292D8    test        bl,bl
>004292DA    jle         004292E3
 004292DC    mov         eax,esi
 004292DE    call        @ClassDestroy
 004292E3    pop         esi
 004292E4    pop         ebx
 004292E5    ret
*}
end;

//004292E8
procedure TMetafileImage.FreeHandle;
begin
{*
 004292E8    ret
*}
end;

//004292EC
constructor TMetafile.Create;
begin
{*
 004292EC    push        ebx
 004292ED    push        esi
 004292EE    test        dl,dl
>004292F0    je          004292FA
 004292F2    add         esp,0FFFFFFF0
 004292F5    call        @ClassCreate
 004292FA    mov         ebx,edx
 004292FC    mov         esi,eax
 004292FE    xor         edx,edx
 00429300    mov         eax,esi
 00429302    call        TGraphic.Create
 00429307    mov         byte ptr [esi+2C],1
 0042930B    mov         byte ptr [esi+21],1
 0042930F    xor         edx,edx
 00429311    mov         eax,esi
 00429313    mov         ecx,dword ptr [eax]
 00429315    call        dword ptr [ecx+8]
 00429318    mov         eax,esi
 0042931A    test        bl,bl
>0042931C    je          0042932D
 0042931E    call        @AfterConstruction
 00429323    pop         dword ptr fs:[0]
 0042932A    add         esp,0C
 0042932D    mov         eax,esi
 0042932F    pop         esi
 00429330    pop         ebx
 00429331    ret
*}
end;

//00429334
destructor TMetafile.Destroy;
begin
{*
 00429334    push        ebx
 00429335    push        esi
 00429336    call        @BeforeDestruction
 0042933B    mov         ebx,edx
 0042933D    mov         esi,eax
 0042933F    mov         eax,dword ptr [esi+28];TMetafile.FImage:TMetafileImage
 00429342    call        TSharedImage.Release
 00429347    mov         edx,ebx
 00429349    and         dl,0FC
 0042934C    mov         eax,esi
 0042934E    call        TMemoryStream.Destroy
 00429353    test        bl,bl
>00429355    jle         0042935E
 00429357    mov         eax,esi
 00429359    call        @ClassDestroy
 0042935E    pop         esi
 0042935F    pop         ebx
 00429360    ret
*}
end;

//00429364
procedure TMetafile.Assign(Source:TPersistent);
begin
{*
 00429364    push        ebx
 00429365    push        esi
 00429366    push        edi
 00429367    mov         esi,edx
 00429369    mov         ebx,eax
 0042936B    test        esi,esi
>0042936D    je          00429380
 0042936F    mov         eax,esi
 00429371    mov         edx,dword ptr ds:[424D78];TMetafile
 00429377    call        @IsClass
 0042937C    test        al,al
>0042937E    je          004293EA
 00429380    xor         edi,edi
 00429382    mov         eax,dword ptr [ebx+28]
 00429385    test        eax,eax
>00429387    je          00429391
 00429389    mov         edi,dword ptr [eax+14]
 0042938C    call        TSharedImage.Release
 00429391    test        esi,esi
>00429393    je          004293A5
 00429395    mov         eax,esi
 00429397    mov         edx,dword ptr [eax+28]
 0042939A    mov         dword ptr [ebx+28],edx
 0042939D    mov         al,byte ptr [eax+2C]
 004293A0    mov         byte ptr [ebx+2C],al
>004293A3    jmp         004293B8
 004293A5    mov         dl,1
 004293A7    mov         eax,[00424D18];TMetafileImage
 004293AC    call        TObject.Create
 004293B1    mov         dword ptr [ebx+28],eax
 004293B4    mov         byte ptr [ebx+2C],1
 004293B8    mov         eax,dword ptr [ebx+28]
 004293BB    call        TSharedImage.Reference
 004293C0    mov         eax,ebx
 004293C2    mov         edx,dword ptr [eax]
 004293C4    call        dword ptr [edx+24]
 004293C7    cmp         edi,eax
>004293C9    je          004293D6
 004293CB    mov         eax,ebx
 004293CD    mov         edx,dword ptr [eax]
 004293CF    call        dword ptr [edx+24]
 004293D2    test        eax,eax
>004293D4    jne         004293DA
 004293D6    xor         eax,eax
>004293D8    jmp         004293DC
 004293DA    mov         al,1
 004293DC    mov         byte ptr [ebx+22],al
 004293DF    mov         edx,ebx
 004293E1    mov         eax,ebx
 004293E3    mov         ecx,dword ptr [eax]
 004293E5    call        dword ptr [ecx+10]
>004293E8    jmp         004293F3
 004293EA    mov         edx,esi
 004293EC    mov         eax,ebx
 004293EE    call        TPersistent.Assign
 004293F3    pop         edi
 004293F4    pop         esi
 004293F5    pop         ebx
 004293F6    ret
*}
end;

//004293F8
procedure TMetafile.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 004293F8    push        ebx
 004293F9    push        esi
 004293FA    push        edi
 004293FB    push        ebp
 004293FC    add         esp,0FFFFFFEC
 004293FF    mov         dword ptr [esp],ecx
 00429402    mov         edi,edx
 00429404    mov         ebx,eax
 00429406    cmp         dword ptr [ebx+28],0
>0042940A    je          00429480
 0042940C    mov         eax,ebx
 0042940E    mov         edx,dword ptr [eax]
 00429410    call        dword ptr [edx+24]
 00429413    mov         esi,eax
 00429415    xor         ebp,ebp
 00429417    test        esi,esi
>00429419    je          0042943A
 0042941B    push        0FF
 0042941D    push        esi
 0042941E    mov         eax,edi
 00429420    call        TCanvas.GetHandle
 00429425    push        eax
 00429426    call        gdi32.SelectPalette
 0042942B    mov         ebp,eax
 0042942D    mov         eax,edi
 0042942F    call        TCanvas.GetHandle
 00429434    push        eax
 00429435    call        gdi32.RealizePalette
 0042943A    mov         eax,dword ptr [esp]
 0042943D    push        esi
 0042943E    push        edi
 0042943F    mov         esi,eax
 00429441    lea         edi,[esp+0C]
 00429445    movs        dword ptr [edi],dword ptr [esi]
 00429446    movs        dword ptr [edi],dword ptr [esi]
 00429447    movs        dword ptr [edi],dword ptr [esi]
 00429448    movs        dword ptr [edi],dword ptr [esi]
 00429449    pop         edi
 0042944A    pop         esi
 0042944B    dec         dword ptr [esp+0C]
 0042944F    dec         dword ptr [esp+10]
 00429453    lea         eax,[esp+4]
 00429457    push        eax
 00429458    mov         eax,dword ptr [ebx+28]
 0042945B    mov         eax,dword ptr [eax+8]
 0042945E    push        eax
 0042945F    mov         eax,edi
 00429461    call        TCanvas.GetHandle
 00429466    push        eax
 00429467    call        gdi32.PlayEnhMetaFile
 0042946C    test        esi,esi
>0042946E    je          00429480
 00429470    push        0FF
 00429472    push        ebp
 00429473    mov         eax,edi
 00429475    call        TCanvas.GetHandle
 0042947A    push        eax
 0042947B    call        gdi32.SelectPalette
 00429480    add         esp,14
 00429483    pop         ebp
 00429484    pop         edi
 00429485    pop         esi
 00429486    pop         ebx
 00429487    ret
*}
end;

//00429488
function TMetafile.GetEmpty:Boolean;
begin
{*
 00429488    cmp         dword ptr [eax+28],0
 0042948C    sete        al
 0042948F    ret
*}
end;

//00429490
function TMetafile.GetHeight:Integer;
begin
{*
 00429490    push        ebx
 00429491    add         esp,0FFFFFF9C
 00429494    mov         ebx,eax
 00429496    cmp         dword ptr [ebx+28],0
>0042949A    jne         004294A3
 0042949C    mov         eax,ebx
 0042949E    call        TMetafile.NewImage
 004294A3    mov         ebx,dword ptr [ebx+28]
 004294A6    cmp         word ptr [ebx+18],0
>004294AB    jne         004294D8
 004294AD    mov         eax,dword ptr [ebx+8]
 004294B0    test        eax,eax
>004294B2    jne         004294B9
 004294B4    mov         eax,dword ptr [ebx+20]
>004294B7    jmp         004294EC
 004294B9    push        esp
 004294BA    push        64
 004294BC    push        eax
 004294BD    call        gdi32.GetEnhMetaFileHeader
 004294C2    imul        eax,dword ptr [esp+54],64
 004294C7    push        eax
 004294C8    mov         eax,dword ptr [esp+50]
 004294CC    push        eax
 004294CD    mov         eax,dword ptr [ebx+10]
 004294D0    push        eax
 004294D1    call        KERNEL32.MulDiv
>004294D6    jmp         004294EC
 004294D8    push        9EC
 004294DD    mov         eax,[005E0964];ScreenLogPixels:Integer
 004294E2    push        eax
 004294E3    mov         eax,dword ptr [ebx+10]
 004294E6    push        eax
 004294E7    call        KERNEL32.MulDiv
 004294EC    add         esp,64
 004294EF    pop         ebx
 004294F0    ret
*}
end;

//004294F4
function TMetafile.GetPalette:HPALETTE;
begin
{*
 004294F4    push        ebx
 004294F5    push        esi
 004294F6    push        edi
 004294F7    add         esp,0FFFFFBFC
 004294FD    mov         ebx,eax
 004294FF    xor         edi,edi
 00429501    mov         eax,dword ptr [ebx+28]
 00429504    test        eax,eax
>00429506    je          00429571
 00429508    cmp         dword ptr [eax+8],0
>0042950C    je          00429571
 0042950E    cmp         dword ptr [eax+14],0
>00429512    jne         0042956B
 00429514    push        0
 00429516    push        0
 00429518    mov         eax,dword ptr [eax+8]
 0042951B    push        eax
 0042951C    call        gdi32.GetEnhMetaFilePaletteEntries
 00429521    mov         esi,eax
 00429523    test        esi,esi
>00429525    je          00429571
 00429527    cmp         esi,100
>0042952D    jle         00429535
 0042952F    and         esi,0FF
 00429535    mov         eax,dword ptr [ebx+28]
 00429538    mov         eax,dword ptr [eax+14]
 0042953B    call        InternalDeletePalette
 00429540    mov         word ptr [esp],300
 00429546    mov         word ptr [esp+2],si
 0042954B    lea         eax,[esp+4]
 0042954F    push        eax
 00429550    push        esi
 00429551    mov         eax,dword ptr [ebx+28]
 00429554    mov         eax,dword ptr [eax+8]
 00429557    push        eax
 00429558    call        gdi32.GetEnhMetaFilePaletteEntries
 0042955D    mov         eax,esp
 0042955F    push        eax
 00429560    call        gdi32.CreatePalette
 00429565    mov         edx,dword ptr [ebx+28]
 00429568    mov         dword ptr [edx+14],eax
 0042956B    mov         eax,dword ptr [ebx+28]
 0042956E    mov         edi,dword ptr [eax+14]
 00429571    mov         eax,edi
 00429573    add         esp,404
 00429579    pop         edi
 0042957A    pop         esi
 0042957B    pop         ebx
 0042957C    ret
*}
end;

//00429580
function TMetafile.GetWidth:Integer;
begin
{*
 00429580    push        ebx
 00429581    add         esp,0FFFFFF9C
 00429584    mov         ebx,eax
 00429586    cmp         dword ptr [ebx+28],0
>0042958A    jne         00429593
 0042958C    mov         eax,ebx
 0042958E    call        TMetafile.NewImage
 00429593    mov         ebx,dword ptr [ebx+28]
 00429596    cmp         word ptr [ebx+18],0
>0042959B    jne         004295C8
 0042959D    mov         eax,dword ptr [ebx+8]
 004295A0    test        eax,eax
>004295A2    jne         004295A9
 004295A4    mov         eax,dword ptr [ebx+1C]
>004295A7    jmp         004295DC
 004295A9    push        esp
 004295AA    push        64
 004295AC    push        eax
 004295AD    call        gdi32.GetEnhMetaFileHeader
 004295B2    imul        eax,dword ptr [esp+50],64
 004295B7    push        eax
 004295B8    mov         eax,dword ptr [esp+4C]
 004295BC    push        eax
 004295BD    mov         eax,dword ptr [ebx+0C]
 004295C0    push        eax
 004295C1    call        KERNEL32.MulDiv
>004295C6    jmp         004295DC
 004295C8    push        9EC
 004295CD    mov         eax,[005E0964];ScreenLogPixels:Integer
 004295D2    push        eax
 004295D3    mov         eax,dword ptr [ebx+0C]
 004295D6    push        eax
 004295D7    call        KERNEL32.MulDiv
 004295DC    add         esp,64
 004295DF    pop         ebx
 004295E0    ret
*}
end;

//004295E4
procedure TMetafile.LoadFromStream(Stream:TStream);
begin
{*
 004295E4    push        ebx
 004295E5    push        esi
 004295E6    mov         esi,edx
 004295E8    mov         ebx,eax
 004295EA    mov         edx,esi
 004295EC    mov         eax,ebx
 004295EE    call        TMetafile.TestEMF
 004295F3    test        al,al
>004295F5    je          00429602
 004295F7    mov         edx,esi
 004295F9    mov         eax,ebx
 004295FB    call        TMetafile.ReadEMFStream
>00429600    jmp         0042961C
 00429602    mov         eax,esi
 00429604    mov         edx,dword ptr [eax]
 00429606    call        dword ptr [edx]
 00429608    push        eax
 00429609    mov         eax,esi
 0042960B    call        TStream.GetPosition
 00429610    pop         ecx
 00429611    sub         ecx,eax
 00429613    mov         edx,esi
 00429615    mov         eax,ebx
 00429617    call        TMetafile.ReadWMFStream
 0042961C    mov         eax,ebx
 0042961E    mov         edx,dword ptr [eax]
 00429620    call        dword ptr [edx+24]
 00429623    test        eax,eax
 00429625    setne       al
 00429628    mov         byte ptr [ebx+22],al
 0042962B    mov         edx,ebx
 0042962D    mov         eax,ebx
 0042962F    mov         ecx,dword ptr [eax]
 00429631    call        dword ptr [ecx+10]
 00429634    pop         esi
 00429635    pop         ebx
 00429636    ret
*}
end;

//00429638
procedure TMetafile.NewImage;
begin
{*
 00429638    push        ebx
 00429639    push        esi
 0042963A    mov         ebx,eax
 0042963C    mov         eax,dword ptr [ebx+28]
 0042963F    call        TSharedImage.Release
 00429644    mov         dl,1
 00429646    mov         eax,[00424D18];TMetafileImage
 0042964B    call        TObject.Create
 00429650    mov         esi,eax
 00429652    mov         dword ptr [ebx+28],esi
 00429655    mov         eax,esi
 00429657    call        TSharedImage.Reference
 0042965C    pop         esi
 0042965D    pop         ebx
 0042965E    ret
*}
end;

//00429660
procedure TMetafile.ReadData(Stream:TStream);
begin
{*
 00429660    push        ebx
 00429661    push        esi
 00429662    push        edi
 00429663    push        ecx
 00429664    mov         esi,edx
 00429666    mov         ebx,eax
 00429668    mov         edx,esp
 0042966A    mov         ecx,4
 0042966F    mov         eax,esi
 00429671    mov         edi,dword ptr [eax]
 00429673    call        dword ptr [edi+0C]
 00429676    cmp         dword ptr [esp],4
>0042967A    jg          00429687
 0042967C    xor         edx,edx
 0042967E    mov         eax,ebx
 00429680    mov         ecx,dword ptr [eax]
 00429682    call        dword ptr [ecx+8]
>00429685    jmp         004296AE
 00429687    mov         edx,esi
 00429689    mov         eax,ebx
 0042968B    call        TMetafile.TestEMF
 00429690    test        al,al
>00429692    je          0042969F
 00429694    mov         edx,esi
 00429696    mov         eax,ebx
 00429698    call        TMetafile.ReadEMFStream
>0042969D    jmp         004296AE
 0042969F    mov         ecx,dword ptr [esp]
 004296A2    sub         ecx,4
 004296A5    mov         edx,esi
 004296A7    mov         eax,ebx
 004296A9    call        TMetafile.ReadWMFStream
 004296AE    mov         eax,ebx
 004296B0    mov         edx,dword ptr [eax]
 004296B2    call        dword ptr [edx+24]
 004296B5    test        eax,eax
 004296B7    setne       al
 004296BA    mov         byte ptr [ebx+22],al
 004296BD    mov         edx,ebx
 004296BF    mov         eax,ebx
 004296C1    mov         ecx,dword ptr [eax]
 004296C3    call        dword ptr [ecx+10]
 004296C6    pop         edx
 004296C7    pop         edi
 004296C8    pop         esi
 004296C9    pop         ebx
 004296CA    ret
*}
end;

//004296CC
procedure TMetafile.ReadEMFStream(Stream:TStream);
begin
{*
 004296CC    push        ebp
 004296CD    mov         ebp,esp
 004296CF    add         esp,0FFFFFF98
 004296D2    push        ebx
 004296D3    push        esi
 004296D4    push        edi
 004296D5    mov         edi,edx
 004296D7    mov         esi,eax
 004296D9    mov         eax,esi
 004296DB    call        TMetafile.NewImage
 004296E0    lea         edx,[ebp-68]
 004296E3    mov         ecx,64
 004296E8    mov         eax,edi
 004296EA    call        TStream.ReadBuffer
 004296EF    cmp         dword ptr [ebp-40],464D4520
>004296F6    je          004296FD
 004296F8    call        InvalidMetafile
 004296FD    mov         eax,dword ptr [ebp-38]
 00429700    call        @GetMem
 00429705    mov         dword ptr [ebp-4],eax
 00429708    mov         ebx,dword ptr [esi+28]
 0042970B    xor         eax,eax
 0042970D    push        ebp
 0042970E    push        42978C
 00429713    push        dword ptr fs:[eax]
 00429716    mov         dword ptr fs:[eax],esp
 00429719    mov         edx,dword ptr [ebp-4]
 0042971C    lea         eax,[ebp-68]
 0042971F    mov         ecx,64
 00429724    call        Move
 00429729    mov         ecx,dword ptr [ebp-38]
 0042972C    sub         ecx,64
 0042972F    mov         edx,dword ptr [ebp-4]
 00429732    add         edx,64
 00429735    mov         eax,edi
 00429737    call        TStream.ReadBuffer
 0042973C    mov         eax,dword ptr [ebp-4]
 0042973F    push        eax
 00429740    mov         eax,dword ptr [ebp-38]
 00429743    push        eax
 00429744    call        gdi32.SetEnhMetaFileBits
 00429749    mov         edi,eax
 0042974B    mov         dword ptr [ebx+8],edi
 0042974E    test        edi,edi
>00429750    jne         00429757
 00429752    call        InvalidMetafile
 00429757    mov         word ptr [ebx+18],0
 0042975D    mov         eax,dword ptr [ebp-48]
 00429760    sub         eax,dword ptr [ebp-50]
 00429763    mov         dword ptr [ebx+0C],eax
 00429766    mov         eax,dword ptr [ebp-44]
 00429769    sub         eax,dword ptr [ebp-4C]
 0042976C    mov         dword ptr [ebx+10],eax
 0042976F    mov         byte ptr [esi+2C],1
 00429773    xor         eax,eax
 00429775    pop         edx
 00429776    pop         ecx
 00429777    pop         ecx
 00429778    mov         dword ptr fs:[eax],edx
 0042977B    push        429793
 00429780    mov         edx,dword ptr [ebp-38]
 00429783    mov         eax,dword ptr [ebp-4]
 00429786    call        @FreeMem
 0042978B    ret
>0042978C    jmp         @HandleFinally
>00429791    jmp         00429780
 00429793    pop         edi
 00429794    pop         esi
 00429795    pop         ebx
 00429796    mov         esp,ebp
 00429798    pop         ebp
 00429799    ret
*}
end;

//0042979C
procedure TMetafile.ReadWMFStream(Stream:TStream; Length:Longint);
begin
{*
 0042979C    push        ebp
 0042979D    mov         ebp,esp
 0042979F    add         esp,0FFFFFF68
 004297A5    push        ebx
 004297A6    push        esi
 004297A7    push        edi
 004297A8    mov         dword ptr [ebp-8],ecx
 004297AB    mov         dword ptr [ebp-4],edx
 004297AE    mov         esi,eax
 004297B0    mov         eax,esi
 004297B2    call        TMetafile.NewImage
 004297B7    lea         edx,[ebp-22]
 004297BA    mov         ecx,16
 004297BF    mov         eax,dword ptr [ebp-4]
 004297C2    mov         ebx,dword ptr [eax]
 004297C4    call        dword ptr [ebx+0C]
 004297C7    cmp         dword ptr [ebp-22],9AC6CDD7
>004297CE    jne         004297DE
 004297D0    lea         eax,[ebp-22]
 004297D3    call        ComputeAldusChecksum
 004297D8    cmp         ax,word ptr [ebp-0E]
>004297DC    je          004297E3
 004297DE    call        InvalidMetafile
 004297E3    sub         dword ptr [ebp-8],16
 004297E7    mov         eax,dword ptr [ebp-8]
 004297EA    call        @GetMem
 004297EF    mov         dword ptr [ebp-0C],eax
 004297F2    mov         ebx,dword ptr [esi+28]
 004297F5    xor         eax,eax
 004297F7    push        ebp
 004297F8    push        42990B
 004297FD    push        dword ptr fs:[eax]
 00429800    mov         dword ptr fs:[eax],esp
 00429803    mov         edx,dword ptr [ebp-0C]
 00429806    mov         ecx,dword ptr [ebp-8]
 00429809    mov         eax,dword ptr [ebp-4]
 0042980C    mov         edi,dword ptr [eax]
 0042980E    call        dword ptr [edi+0C]
 00429811    mov         eax,dword ptr [esi+28]
 00429814    mov         dx,word ptr [ebp-14]
 00429818    mov         word ptr [eax+18],dx
 0042981C    cmp         word ptr [ebp-14],0
>00429821    jne         00429829
 00429823    mov         word ptr [ebp-14],60
 00429829    movzx       eax,word ptr [ebp-14]
 0042982D    push        eax
 0042982E    push        9EC
 00429833    movsx       eax,word ptr [ebp-18]
 00429837    movsx       edx,word ptr [ebp-1C]
 0042983B    sub         eax,edx
 0042983D    push        eax
 0042983E    call        KERNEL32.MulDiv
 00429843    mov         dword ptr [ebx+0C],eax
 00429846    movzx       eax,word ptr [ebp-14]
 0042984A    push        eax
 0042984B    push        9EC
 00429850    movsx       eax,word ptr [ebp-16]
 00429854    movsx       edx,word ptr [ebp-1A]
 00429858    sub         eax,edx
 0042985A    push        eax
 0042985B    call        KERNEL32.MulDiv
 00429860    mov         dword ptr [ebx+10],eax
 00429863    mov         dword ptr [ebp-32],8
 0042986A    xor         eax,eax
 0042986C    mov         dword ptr [ebp-2E],eax
 0042986F    xor         eax,eax
 00429871    mov         dword ptr [ebp-2A],eax
 00429874    xor         eax,eax
 00429876    mov         dword ptr [ebp-26],eax
 00429879    lea         eax,[ebp-32]
 0042987C    push        eax
 0042987D    push        0
 0042987F    mov         eax,dword ptr [ebp-0C]
 00429882    push        eax
 00429883    mov         eax,dword ptr [ebp-8]
 00429886    push        eax
 00429887    call        gdi32.SetWinMetaFileBits
 0042988C    mov         edi,eax
 0042988E    mov         dword ptr [ebx+8],edi
 00429891    test        edi,edi
>00429893    jne         0042989A
 00429895    call        InvalidMetafile
 0042989A    lea         eax,[ebp-96]
 004298A0    push        eax
 004298A1    push        64
 004298A3    mov         eax,dword ptr [ebx+8]
 004298A6    push        eax
 004298A7    call        gdi32.GetEnhMetaFileHeader
 004298AC    mov         dword ptr [ebp-32],8
 004298B3    mov         eax,dword ptr [ebp-76]
 004298B6    mov         dword ptr [ebp-2E],eax
 004298B9    mov         eax,dword ptr [ebp-72]
 004298BC    mov         dword ptr [ebp-2A],eax
 004298BF    xor         eax,eax
 004298C1    mov         dword ptr [ebp-26],eax
 004298C4    mov         eax,dword ptr [ebx+8]
 004298C7    push        eax
 004298C8    call        gdi32.DeleteEnhMetaFile
 004298CD    lea         eax,[ebp-32]
 004298D0    push        eax
 004298D1    push        0
 004298D3    mov         eax,dword ptr [ebp-0C]
 004298D6    push        eax
 004298D7    mov         eax,dword ptr [ebp-8]
 004298DA    push        eax
 004298DB    call        gdi32.SetWinMetaFileBits
 004298E0    mov         edi,eax
 004298E2    mov         dword ptr [ebx+8],edi
 004298E5    test        edi,edi
>004298E7    jne         004298EE
 004298E9    call        InvalidMetafile
 004298EE    mov         byte ptr [esi+2C],0
 004298F2    xor         eax,eax
 004298F4    pop         edx
 004298F5    pop         ecx
 004298F6    pop         ecx
 004298F7    mov         dword ptr fs:[eax],edx
 004298FA    push        429912
 004298FF    mov         edx,dword ptr [ebp-8]
 00429902    mov         eax,dword ptr [ebp-0C]
 00429905    call        @FreeMem
 0042990A    ret
>0042990B    jmp         @HandleFinally
>00429910    jmp         004298FF
 00429912    pop         edi
 00429913    pop         esi
 00429914    pop         ebx
 00429915    mov         esp,ebp
 00429917    pop         ebp
 00429918    ret
*}
end;

//0042991C
procedure TMetafile.SaveToFile(const Filename:AnsiString);
begin
{*
 0042991C    push        ebp
 0042991D    mov         ebp,esp
 0042991F    add         esp,0FFFFFFF0
 00429922    push        ebx
 00429923    xor         ecx,ecx
 00429925    mov         dword ptr [ebp-0C],ecx
 00429928    mov         dword ptr [ebp-10],ecx
 0042992B    mov         ebx,edx
 0042992D    mov         dword ptr [ebp-4],eax
 00429930    xor         eax,eax
 00429932    push        ebp
 00429933    push        4299C3
 00429938    push        dword ptr fs:[eax]
 0042993B    mov         dword ptr fs:[eax],esp
 0042993E    mov         eax,dword ptr [ebp-4]
 00429941    mov         al,byte ptr [eax+2C]
 00429944    mov         byte ptr [ebp-5],al
 00429947    xor         eax,eax
 00429949    push        ebp
 0042994A    push        4299A1
 0042994F    push        dword ptr fs:[eax]
 00429952    mov         dword ptr fs:[eax],esp
 00429955    lea         edx,[ebp-10]
 00429958    mov         eax,ebx
 0042995A    call        ExtractFileExt
 0042995F    mov         eax,dword ptr [ebp-10]
 00429962    lea         edx,[ebp-0C]
 00429965    call        AnsiLowerCaseFileName
 0042996A    mov         eax,dword ptr [ebp-0C]
 0042996D    mov         edx,4299D8;'.wmf'
 00429972    call        @LStrCmp
>00429977    jne         00429980
 00429979    mov         eax,dword ptr [ebp-4]
 0042997C    mov         byte ptr [eax+2C],0
 00429980    mov         edx,ebx
 00429982    mov         eax,dword ptr [ebp-4]
 00429985    call        TGraphic.SaveToFile
 0042998A    xor         eax,eax
 0042998C    pop         edx
 0042998D    pop         ecx
 0042998E    pop         ecx
 0042998F    mov         dword ptr fs:[eax],edx
 00429992    push        4299A8
 00429997    mov         eax,dword ptr [ebp-4]
 0042999A    mov         dl,byte ptr [ebp-5]
 0042999D    mov         byte ptr [eax+2C],dl
 004299A0    ret
>004299A1    jmp         @HandleFinally
>004299A6    jmp         00429997
 004299A8    xor         eax,eax
 004299AA    pop         edx
 004299AB    pop         ecx
 004299AC    pop         ecx
 004299AD    mov         dword ptr fs:[eax],edx
 004299B0    push        4299CA
 004299B5    lea         eax,[ebp-10]
 004299B8    mov         edx,2
 004299BD    call        @LStrArrayClr
 004299C2    ret
>004299C3    jmp         @HandleFinally
>004299C8    jmp         004299B5
 004299CA    pop         ebx
 004299CB    mov         esp,ebp
 004299CD    pop         ebp
 004299CE    ret
*}
end;

//004299E0
procedure TMetafile.SaveToStream(Stream:TStream);
begin
{*
 004299E0    cmp         dword ptr [eax+28],0
>004299E4    je          004299F8
 004299E6    cmp         byte ptr [eax+2C],0
>004299EA    je          004299F3
 004299EC    call        TMetafile.WriteEMFStream
>004299F1    jmp         004299F8
 004299F3    call        TMetafile.WriteWMFStream
 004299F8    ret
*}
end;

//004299FC
procedure TMetafile.SetHeight(Value:Integer);
begin
{*
 004299FC    push        ebx
 004299FD    push        esi
 004299FE    add         esp,0FFFFFF9C
 00429A01    mov         esi,edx
 00429A03    mov         ebx,eax
 00429A05    cmp         dword ptr [ebx+28],0
>00429A09    jne         00429A12
 00429A0B    mov         eax,ebx
 00429A0D    call        TMetafile.NewImage
 00429A12    mov         eax,dword ptr [ebx+28]
 00429A15    cmp         word ptr [eax+18],0
>00429A1A    jne         00429A4D
 00429A1C    mov         edx,dword ptr [eax+8]
 00429A1F    test        edx,edx
>00429A21    jne         00429A28
 00429A23    mov         dword ptr [eax+20],esi
>00429A26    jmp         00429A67
 00429A28    push        esp
 00429A29    push        64
 00429A2B    push        edx
 00429A2C    call        gdi32.GetEnhMetaFileHeader
 00429A31    mov         eax,dword ptr [esp+4C]
 00429A35    push        eax
 00429A36    imul        eax,dword ptr [esp+58],64
 00429A3B    push        eax
 00429A3C    push        esi
 00429A3D    call        KERNEL32.MulDiv
 00429A42    mov         edx,eax
 00429A44    mov         eax,ebx
 00429A46    call        TMetafile.SetMMHeight
>00429A4B    jmp         00429A67
 00429A4D    mov         eax,[005E0964];ScreenLogPixels:Integer
 00429A52    push        eax
 00429A53    push        9EC
 00429A58    push        esi
 00429A59    call        KERNEL32.MulDiv
 00429A5E    mov         edx,eax
 00429A60    mov         eax,ebx
 00429A62    call        TMetafile.SetMMHeight
 00429A67    add         esp,64
 00429A6A    pop         esi
 00429A6B    pop         ebx
 00429A6C    ret
*}
end;

//00429A70
procedure TMetafile.SetMMHeight(Value:Integer);
begin
{*
 00429A70    push        ebx
 00429A71    push        esi
 00429A72    mov         esi,edx
 00429A74    mov         ebx,eax
 00429A76    cmp         dword ptr [ebx+28],0
>00429A7A    jne         00429A83
 00429A7C    mov         eax,ebx
 00429A7E    call        TMetafile.NewImage
 00429A83    mov         eax,dword ptr [ebx+28]
 00429A86    xor         edx,edx
 00429A88    mov         dword ptr [eax+20],edx
 00429A8B    cmp         esi,dword ptr [eax+10]
>00429A8E    je          00429AA6
 00429A90    mov         eax,ebx
 00429A92    call        TMetafile.UniqueImage
 00429A97    mov         eax,dword ptr [ebx+28]
 00429A9A    mov         dword ptr [eax+10],esi
 00429A9D    mov         edx,ebx
 00429A9F    mov         eax,ebx
 00429AA1    mov         ecx,dword ptr [eax]
 00429AA3    call        dword ptr [ecx+10]
 00429AA6    pop         esi
 00429AA7    pop         ebx
 00429AA8    ret
*}
end;

//00429AAC
procedure TMetafile.SetMMWidth(Value:Integer);
begin
{*
 00429AAC    push        ebx
 00429AAD    push        esi
 00429AAE    mov         esi,edx
 00429AB0    mov         ebx,eax
 00429AB2    cmp         dword ptr [ebx+28],0
>00429AB6    jne         00429ABF
 00429AB8    mov         eax,ebx
 00429ABA    call        TMetafile.NewImage
 00429ABF    mov         eax,dword ptr [ebx+28]
 00429AC2    xor         edx,edx
 00429AC4    mov         dword ptr [eax+1C],edx
 00429AC7    cmp         esi,dword ptr [eax+0C]
>00429ACA    je          00429AE2
 00429ACC    mov         eax,ebx
 00429ACE    call        TMetafile.UniqueImage
 00429AD3    mov         eax,dword ptr [ebx+28]
 00429AD6    mov         dword ptr [eax+0C],esi
 00429AD9    mov         edx,ebx
 00429ADB    mov         eax,ebx
 00429ADD    mov         ecx,dword ptr [eax]
 00429ADF    call        dword ptr [ecx+10]
 00429AE2    pop         esi
 00429AE3    pop         ebx
 00429AE4    ret
*}
end;

//00429AE8
procedure TMetafile.SetTransparent(Value:Boolean);
begin
{*
 00429AE8    ret
*}
end;

//00429AEC
procedure TMetafile.SetWidth(Value:Integer);
begin
{*
 00429AEC    push        ebx
 00429AED    push        esi
 00429AEE    add         esp,0FFFFFF9C
 00429AF1    mov         esi,edx
 00429AF3    mov         ebx,eax
 00429AF5    cmp         dword ptr [ebx+28],0
>00429AF9    jne         00429B02
 00429AFB    mov         eax,ebx
 00429AFD    call        TMetafile.NewImage
 00429B02    mov         eax,dword ptr [ebx+28]
 00429B05    cmp         word ptr [eax+18],0
>00429B0A    jne         00429B3D
 00429B0C    mov         edx,dword ptr [eax+8]
 00429B0F    test        edx,edx
>00429B11    jne         00429B18
 00429B13    mov         dword ptr [eax+1C],esi
>00429B16    jmp         00429B57
 00429B18    push        esp
 00429B19    push        64
 00429B1B    push        edx
 00429B1C    call        gdi32.GetEnhMetaFileHeader
 00429B21    mov         eax,dword ptr [esp+48]
 00429B25    push        eax
 00429B26    imul        eax,dword ptr [esp+54],64
 00429B2B    push        eax
 00429B2C    push        esi
 00429B2D    call        KERNEL32.MulDiv
 00429B32    mov         edx,eax
 00429B34    mov         eax,ebx
 00429B36    call        TMetafile.SetMMWidth
>00429B3B    jmp         00429B57
 00429B3D    mov         eax,[005E0964];ScreenLogPixels:Integer
 00429B42    push        eax
 00429B43    push        9EC
 00429B48    push        esi
 00429B49    call        KERNEL32.MulDiv
 00429B4E    mov         edx,eax
 00429B50    mov         eax,ebx
 00429B52    call        TMetafile.SetMMWidth
 00429B57    add         esp,64
 00429B5A    pop         esi
 00429B5B    pop         ebx
 00429B5C    ret
*}
end;

//00429B60
function TMetafile.TestEMF(Stream:TStream):Boolean;
begin
{*
 00429B60    push        ebx
 00429B61    push        esi
 00429B62    push        edi
 00429B63    add         esp,0FFFFFF9C
 00429B66    mov         ebx,edx
 00429B68    mov         eax,ebx
 00429B6A    mov         edx,dword ptr [eax]
 00429B6C    call        dword ptr [edx]
 00429B6E    mov         esi,eax
 00429B70    mov         eax,ebx
 00429B72    call        TStream.GetPosition
 00429B77    sub         esi,eax
 00429B79    cmp         esi,64
>00429B7C    jle         00429B9C
 00429B7E    mov         edx,esp
 00429B80    mov         ecx,64
 00429B85    mov         eax,ebx
 00429B87    mov         edi,dword ptr [eax]
 00429B89    call        dword ptr [edi+0C]
 00429B8C    mov         cx,1
 00429B90    mov         edx,0FFFFFF9C
 00429B95    mov         eax,ebx
 00429B97    mov         ebx,dword ptr [eax]
 00429B99    call        dword ptr [ebx+14]
 00429B9C    cmp         esi,64
>00429B9F    jle         00429BB1
 00429BA1    cmp         dword ptr [esp],1
>00429BA5    jne         00429BB1
 00429BA7    cmp         dword ptr [esp+28],464D4520
>00429BAF    je          00429BB5
 00429BB1    xor         eax,eax
>00429BB3    jmp         00429BB7
 00429BB5    mov         al,1
 00429BB7    add         esp,64
 00429BBA    pop         edi
 00429BBB    pop         esi
 00429BBC    pop         ebx
 00429BBD    ret
*}
end;

//00429BC0
procedure TMetafile.UniqueImage;
begin
{*
 00429BC0    push        ebx
 00429BC1    push        esi
 00429BC2    push        edi
 00429BC3    mov         ebx,eax
 00429BC5    mov         eax,dword ptr [ebx+28]
 00429BC8    test        eax,eax
>00429BCA    jne         00429BD5
 00429BCC    mov         eax,ebx
 00429BCE    call        TMetafile.NewImage
>00429BD3    jmp         00429C3F
 00429BD5    cmp         dword ptr [eax+4],1
>00429BD9    jle         00429C3F
 00429BDB    mov         dl,1
 00429BDD    mov         eax,[00424D18];TMetafileImage
 00429BE2    call        TObject.Create
 00429BE7    mov         esi,eax
 00429BE9    mov         eax,dword ptr [ebx+28]
 00429BEC    mov         edi,dword ptr [eax+8]
 00429BEF    test        edi,edi
>00429BF1    je          00429BFE
 00429BF3    push        0
 00429BF5    push        edi
 00429BF6    call        gdi32.CopyEnhMetaFileA
 00429BFB    mov         dword ptr [esi+8],eax
 00429BFE    mov         eax,dword ptr [ebx+28]
 00429C01    mov         eax,dword ptr [eax+10]
 00429C04    mov         dword ptr [esi+10],eax
 00429C07    mov         eax,dword ptr [ebx+28]
 00429C0A    mov         eax,dword ptr [eax+0C]
 00429C0D    mov         dword ptr [esi+0C],eax
 00429C10    mov         eax,dword ptr [ebx+28]
 00429C13    mov         ax,word ptr [eax+18]
 00429C17    mov         word ptr [esi+18],ax
 00429C1B    mov         eax,dword ptr [ebx+28]
 00429C1E    mov         eax,dword ptr [eax+1C]
 00429C21    mov         dword ptr [esi+1C],eax
 00429C24    mov         eax,dword ptr [ebx+28]
 00429C27    mov         eax,dword ptr [eax+20]
 00429C2A    mov         dword ptr [esi+20],eax
 00429C2D    mov         eax,dword ptr [ebx+28]
 00429C30    call        TSharedImage.Release
 00429C35    mov         eax,esi
 00429C37    mov         dword ptr [ebx+28],eax
 00429C3A    call        TSharedImage.Reference
 00429C3F    pop         edi
 00429C40    pop         esi
 00429C41    pop         ebx
 00429C42    ret
*}
end;

//00429C44
procedure TMetafile.WriteData(Stream:TStream);
begin
{*
 00429C44    push        ebx
 00429C45    push        esi
 00429C46    push        edi
 00429C47    push        ecx
 00429C48    mov         ebx,edx
 00429C4A    mov         esi,eax
 00429C4C    cmp         dword ptr [esi+28],0
>00429C50    je          00429CBF
 00429C52    xor         eax,eax
 00429C54    mov         dword ptr [esp],eax
 00429C57    mov         edx,esp
 00429C59    mov         ecx,4
 00429C5E    mov         eax,ebx
 00429C60    mov         edi,dword ptr [eax]
 00429C62    call        dword ptr [edi+10]
 00429C65    mov         eax,ebx
 00429C67    call        TStream.GetPosition
 00429C6C    sub         eax,4
 00429C6F    mov         dword ptr [esp],eax
 00429C72    cmp         byte ptr [esi+2C],0
>00429C76    je          00429C83
 00429C78    mov         edx,ebx
 00429C7A    mov         eax,esi
 00429C7C    call        TMetafile.WriteEMFStream
>00429C81    jmp         00429C8C
 00429C83    mov         edx,ebx
 00429C85    mov         eax,esi
 00429C87    call        TMetafile.WriteWMFStream
 00429C8C    xor         ecx,ecx
 00429C8E    mov         edx,dword ptr [esp]
 00429C91    mov         eax,ebx
 00429C93    mov         esi,dword ptr [eax]
 00429C95    call        dword ptr [esi+14]
 00429C98    mov         eax,ebx
 00429C9A    mov         edx,dword ptr [eax]
 00429C9C    call        dword ptr [edx]
 00429C9E    sub         eax,dword ptr [esp]
 00429CA1    mov         dword ptr [esp],eax
 00429CA4    mov         edx,esp
 00429CA6    mov         ecx,4
 00429CAB    mov         eax,ebx
 00429CAD    mov         esi,dword ptr [eax]
 00429CAF    call        dword ptr [esi+10]
 00429CB2    mov         cx,2
 00429CB6    xor         edx,edx
 00429CB8    mov         eax,ebx
 00429CBA    mov         ebx,dword ptr [eax]
 00429CBC    call        dword ptr [ebx+14]
 00429CBF    pop         edx
 00429CC0    pop         edi
 00429CC1    pop         esi
 00429CC2    pop         ebx
 00429CC3    ret
*}
end;

//00429CC4
procedure TMetafile.WriteEMFStream(Stream:TStream);
begin
{*
 00429CC4    push        ebp
 00429CC5    mov         ebp,esp
 00429CC7    add         esp,0FFFFFFF8
 00429CCA    push        ebx
 00429CCB    push        esi
 00429CCC    mov         esi,edx
 00429CCE    mov         ebx,eax
 00429CD0    mov         eax,dword ptr [ebx+28]
 00429CD3    test        eax,eax
>00429CD5    je          00429D47
 00429CD7    push        0
 00429CD9    push        0
 00429CDB    mov         eax,dword ptr [eax+8]
 00429CDE    push        eax
 00429CDF    call        gdi32.GetEnhMetaFileBits
 00429CE4    mov         dword ptr [ebp-8],eax
 00429CE7    cmp         dword ptr [ebp-8],0
>00429CEB    je          00429D47
 00429CED    mov         eax,dword ptr [ebp-8]
 00429CF0    call        @GetMem
 00429CF5    mov         dword ptr [ebp-4],eax
 00429CF8    xor         eax,eax
 00429CFA    push        ebp
 00429CFB    push        429D40
 00429D00    push        dword ptr fs:[eax]
 00429D03    mov         dword ptr fs:[eax],esp
 00429D06    mov         eax,dword ptr [ebp-4]
 00429D09    push        eax
 00429D0A    mov         eax,dword ptr [ebp-8]
 00429D0D    push        eax
 00429D0E    mov         eax,dword ptr [ebx+28]
 00429D11    mov         eax,dword ptr [eax+8]
 00429D14    push        eax
 00429D15    call        gdi32.GetEnhMetaFileBits
 00429D1A    mov         edx,dword ptr [ebp-4]
 00429D1D    mov         ecx,dword ptr [ebp-8]
 00429D20    mov         eax,esi
 00429D22    call        TStream.WriteBuffer
 00429D27    xor         eax,eax
 00429D29    pop         edx
 00429D2A    pop         ecx
 00429D2B    pop         ecx
 00429D2C    mov         dword ptr fs:[eax],edx
 00429D2F    push        429D47
 00429D34    mov         edx,dword ptr [ebp-8]
 00429D37    mov         eax,dword ptr [ebp-4]
 00429D3A    call        @FreeMem
 00429D3F    ret
>00429D40    jmp         @HandleFinally
>00429D45    jmp         00429D34
 00429D47    pop         esi
 00429D48    pop         ebx
 00429D49    pop         ecx
 00429D4A    pop         ecx
 00429D4B    pop         ebp
 00429D4C    ret
*}
end;

//00429D50
procedure TMetafile.WriteWMFStream(Stream:TStream);
begin
{*
 00429D50    push        ebp
 00429D51    mov         ebp,esp
 00429D53    add         esp,0FFFFFFDC
 00429D56    push        ebx
 00429D57    push        esi
 00429D58    mov         esi,edx
 00429D5A    mov         ebx,eax
 00429D5C    cmp         dword ptr [ebx+28],0
>00429D60    je          00429E92
 00429D66    lea         eax,[ebp-22]
 00429D69    xor         ecx,ecx
 00429D6B    mov         edx,16
 00429D70    call        @FillChar
 00429D75    mov         ebx,dword ptr [ebx+28]
 00429D78    mov         dword ptr [ebp-22],9AC6CDD7
 00429D7F    mov         ax,word ptr [ebx+18]
 00429D83    test        ax,ax
>00429D86    jne         00429D90
 00429D88    mov         word ptr [ebp-14],60
>00429D8E    jmp         00429D94
 00429D90    mov         word ptr [ebp-14],ax
 00429D94    push        9EC
 00429D99    movzx       eax,word ptr [ebp-14]
 00429D9D    push        eax
 00429D9E    mov         eax,dword ptr [ebx+0C]
 00429DA1    push        eax
 00429DA2    call        KERNEL32.MulDiv
 00429DA7    mov         word ptr [ebp-18],ax
 00429DAB    push        9EC
 00429DB0    movzx       eax,word ptr [ebp-14]
 00429DB4    push        eax
 00429DB5    mov         eax,dword ptr [ebx+10]
 00429DB8    push        eax
 00429DB9    call        KERNEL32.MulDiv
 00429DBE    mov         word ptr [ebp-16],ax
 00429DC2    lea         eax,[ebp-22]
 00429DC5    call        ComputeAldusChecksum
 00429DCA    mov         word ptr [ebp-0E],ax
 00429DCE    push        0
 00429DD0    call        user32.GetDC
 00429DD5    mov         dword ptr [ebp-0C],eax
 00429DD8    xor         eax,eax
 00429DDA    push        ebp
 00429DDB    push        429E8B
 00429DE0    push        dword ptr fs:[eax]
 00429DE3    mov         dword ptr fs:[eax],esp
 00429DE6    mov         eax,dword ptr [ebp-0C]
 00429DE9    push        eax
 00429DEA    push        8
 00429DEC    push        0
 00429DEE    push        0
 00429DF0    mov         eax,dword ptr [ebx+8]
 00429DF3    push        eax
 00429DF4    call        gdi32.GetWinMetaFileBits
 00429DF9    mov         dword ptr [ebp-8],eax
 00429DFC    mov         eax,dword ptr [ebp-8]
 00429DFF    call        @GetMem
 00429E04    mov         dword ptr [ebp-4],eax
 00429E07    xor         eax,eax
 00429E09    push        ebp
 00429E0A    push        429E6B
 00429E0F    push        dword ptr fs:[eax]
 00429E12    mov         dword ptr fs:[eax],esp
 00429E15    mov         eax,dword ptr [ebp-0C]
 00429E18    push        eax
 00429E19    push        8
 00429E1B    mov         eax,dword ptr [ebp-4]
 00429E1E    push        eax
 00429E1F    mov         eax,dword ptr [ebp-8]
 00429E22    push        eax
 00429E23    mov         eax,dword ptr [ebx+8]
 00429E26    push        eax
 00429E27    call        gdi32.GetWinMetaFileBits
 00429E2C    cmp         eax,dword ptr [ebp-8]
>00429E2F    jae         00429E36
 00429E31    call        GDIError
 00429E36    lea         edx,[ebp-22]
 00429E39    mov         ecx,16
 00429E3E    mov         eax,esi
 00429E40    call        TStream.WriteBuffer
 00429E45    mov         edx,dword ptr [ebp-4]
 00429E48    mov         ecx,dword ptr [ebp-8]
 00429E4B    mov         eax,esi
 00429E4D    call        TStream.WriteBuffer
 00429E52    xor         eax,eax
 00429E54    pop         edx
 00429E55    pop         ecx
 00429E56    pop         ecx
 00429E57    mov         dword ptr fs:[eax],edx
 00429E5A    push        429E72
 00429E5F    mov         edx,dword ptr [ebp-8]
 00429E62    mov         eax,dword ptr [ebp-4]
 00429E65    call        @FreeMem
 00429E6A    ret
>00429E6B    jmp         @HandleFinally
>00429E70    jmp         00429E5F
 00429E72    xor         eax,eax
 00429E74    pop         edx
 00429E75    pop         ecx
 00429E76    pop         ecx
 00429E77    mov         dword ptr fs:[eax],edx
 00429E7A    push        429E92
 00429E7F    mov         eax,dword ptr [ebp-0C]
 00429E82    push        eax
 00429E83    push        0
 00429E85    call        user32.ReleaseDC
 00429E8A    ret
>00429E8B    jmp         @HandleFinally
>00429E90    jmp         00429E7F
 00429E92    pop         esi
 00429E93    pop         ebx
 00429E94    mov         esp,ebp
 00429E96    pop         ebp
 00429E97    ret
*}
end;

//00429E98
procedure TMetafile.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 00429E98    push        ebp
 00429E99    mov         ebp,esp
 00429E9B    add         esp,0FFFFFF9C
 00429E9E    push        ebx
 00429E9F    push        esi
 00429EA0    push        edi
 00429EA1    mov         ebx,eax
 00429EA3    push        0E
 00429EA5    call        user32.GetClipboardData
 00429EAA    mov         edi,eax
 00429EAC    test        edi,edi
>00429EAE    jne         00429EBA
 00429EB0    mov         eax,[005AE5A8];^SUnknownClipboardFormat:TResStringRec
 00429EB5    call        InvalidGraphic
 00429EBA    mov         eax,ebx
 00429EBC    call        TMetafile.NewImage
 00429EC1    mov         esi,dword ptr [ebx+28]
 00429EC4    push        0
 00429EC6    push        edi
 00429EC7    call        gdi32.CopyEnhMetaFileA
 00429ECC    mov         dword ptr [esi+8],eax
 00429ECF    lea         eax,[ebp-64]
 00429ED2    push        eax
 00429ED3    push        64
 00429ED5    mov         eax,dword ptr [esi+8]
 00429ED8    push        eax
 00429ED9    call        gdi32.GetEnhMetaFileHeader
 00429EDE    mov         eax,dword ptr [ebp-44]
 00429EE1    sub         eax,dword ptr [ebp-4C]
 00429EE4    mov         dword ptr [esi+0C],eax
 00429EE7    mov         eax,dword ptr [ebp-40]
 00429EEA    sub         eax,dword ptr [ebp-48]
 00429EED    mov         dword ptr [esi+10],eax
 00429EF0    mov         word ptr [esi+18],0
 00429EF6    mov         byte ptr [ebx+2C],1
 00429EFA    mov         eax,ebx
 00429EFC    mov         edx,dword ptr [eax]
 00429EFE    call        dword ptr [edx+24]
 00429F01    test        eax,eax
 00429F03    setne       al
 00429F06    mov         byte ptr [ebx+22],al
 00429F09    mov         edx,ebx
 00429F0B    mov         eax,ebx
 00429F0D    mov         ecx,dword ptr [eax]
 00429F0F    call        dword ptr [ecx+10]
 00429F12    pop         edi
 00429F13    pop         esi
 00429F14    pop         ebx
 00429F15    mov         esp,ebp
 00429F17    pop         ebp
 00429F18    ret         4
*}
end;

//00429F1C
procedure TMetafile.SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);
begin
{*
 00429F1C    push        ebp
 00429F1D    mov         ebp,esp
 00429F1F    push        ebx
 00429F20    push        esi
 00429F21    push        edi
 00429F22    mov         edi,ecx
 00429F24    mov         ebx,eax
 00429F26    mov         esi,dword ptr [ebx+28]
 00429F29    test        esi,esi
>00429F2B    je          00429F46
 00429F2D    mov         word ptr [edx],0E
 00429F32    mov         eax,dword ptr [ebp+8]
 00429F35    xor         edx,edx
 00429F37    mov         dword ptr [eax],edx
 00429F39    push        0
 00429F3B    mov         eax,dword ptr [esi+8]
 00429F3E    push        eax
 00429F3F    call        gdi32.CopyEnhMetaFileA
 00429F44    mov         dword ptr [edi],eax
 00429F46    pop         edi
 00429F47    pop         esi
 00429F48    pop         ebx
 00429F49    pop         ebp
 00429F4A    ret         4
*}
end;

//00429FEC
procedure FreeMemoryContexts;
begin
{*
 00429FEC    push        ebp
 00429FED    mov         ebp,esp
 00429FEF    add         esp,0FFFFFFF4
 00429FF2    mov         eax,[005AC804]
 00429FF7    call        TThreadList.LockList
 00429FFC    mov         dword ptr [ebp-8],eax
 00429FFF    xor         eax,eax
 0042A001    push        ebp
 0042A002    push        42A08A
 0042A007    push        dword ptr fs:[eax]
 0042A00A    mov         dword ptr fs:[eax],esp
 0042A00D    mov         eax,dword ptr [ebp-8]
 0042A010    mov         eax,dword ptr [eax+8]
 0042A013    dec         eax
 0042A014    cmp         eax,0
>0042A017    jl          0042A072
 0042A019    mov         dword ptr [ebp-4],eax
 0042A01C    mov         edx,dword ptr [ebp-4]
 0042A01F    mov         eax,dword ptr [ebp-8]
 0042A022    call        TList.Get
 0042A027    mov         dword ptr [ebp-0C],eax
 0042A02A    mov         eax,dword ptr [ebp-0C]
 0042A02D    call        TCanvas.TryLock
 0042A032    test        al,al
>0042A034    je          0042A069
 0042A036    xor         eax,eax
 0042A038    push        ebp
 0042A039    push        42A062
 0042A03E    push        dword ptr fs:[eax]
 0042A041    mov         dword ptr fs:[eax],esp
 0042A044    mov         eax,dword ptr [ebp-0C]
 0042A047    call        TBitmapCanvas.FreeContext
 0042A04C    xor         eax,eax
 0042A04E    pop         edx
 0042A04F    pop         ecx
 0042A050    pop         ecx
 0042A051    mov         dword ptr fs:[eax],edx
 0042A054    push        42A069
 0042A059    mov         eax,dword ptr [ebp-0C]
 0042A05C    call        TCanvas.Unlock
 0042A061    ret
>0042A062    jmp         @HandleFinally
>0042A067    jmp         0042A059
 0042A069    dec         dword ptr [ebp-4]
 0042A06C    cmp         dword ptr [ebp-4],0FFFFFFFF
>0042A070    jne         0042A01C
 0042A072    xor         eax,eax
 0042A074    pop         edx
 0042A075    pop         ecx
 0042A076    pop         ecx
 0042A077    mov         dword ptr fs:[eax],edx
 0042A07A    push        42A091
 0042A07F    mov         eax,[005AC804]
 0042A084    call        TThreadList.UnlockList
 0042A089    ret
>0042A08A    jmp         @HandleFinally
>0042A08F    jmp         0042A07F
 0042A091    mov         esp,ebp
 0042A093    pop         ebp
 0042A094    ret
*}
end;

//0042A098
procedure DeselectBitmap(AHandle:HBITMAP);
begin
{*
 0042A098    push        ebp
 0042A099    mov         ebp,esp
 0042A09B    push        ecx
 0042A09C    push        ebx
 0042A09D    push        esi
 0042A09E    mov         dword ptr [ebp-4],eax
 0042A0A1    cmp         dword ptr [ebp-4],0
>0042A0A5    je          0042A10F
 0042A0A7    mov         eax,[005AC804]
 0042A0AC    call        TThreadList.LockList
 0042A0B1    mov         esi,eax
 0042A0B3    xor         ecx,ecx
 0042A0B5    push        ebp
 0042A0B6    push        42A108
 0042A0BB    push        dword ptr fs:[ecx]
 0042A0BE    mov         dword ptr fs:[ecx],esp
 0042A0C1    mov         ebx,dword ptr [esi+8]
 0042A0C4    dec         ebx
 0042A0C5    cmp         ebx,0
>0042A0C8    jl          0042A0F0
 0042A0CA    mov         edx,ebx
 0042A0CC    mov         eax,esi
 0042A0CE    call        TList.Get
 0042A0D3    mov         edx,dword ptr [eax+58]
 0042A0D6    test        edx,edx
>0042A0D8    je          0042A0EA
 0042A0DA    mov         edx,dword ptr [edx+28]
 0042A0DD    mov         edx,dword ptr [edx+8]
 0042A0E0    cmp         edx,dword ptr [ebp-4]
>0042A0E3    jne         0042A0EA
 0042A0E5    call        TBitmapCanvas.FreeContext
 0042A0EA    dec         ebx
 0042A0EB    cmp         ebx,0FFFFFFFF
>0042A0EE    jne         0042A0CA
 0042A0F0    xor         eax,eax
 0042A0F2    pop         edx
 0042A0F3    pop         ecx
 0042A0F4    pop         ecx
 0042A0F5    mov         dword ptr fs:[eax],edx
 0042A0F8    push        42A10F
 0042A0FD    mov         eax,[005AC804]
 0042A102    call        TThreadList.UnlockList
 0042A107    ret
>0042A108    jmp         @HandleFinally
>0042A10D    jmp         0042A0FD
 0042A10F    pop         esi
 0042A110    pop         ebx
 0042A111    pop         ecx
 0042A112    pop         ebp
 0042A113    ret
*}
end;

//0042A114
constructor TBitmapCanvas.Create(ABitmap:TBitmap);
begin
{*
 0042A114    push        ebx
 0042A115    push        esi
 0042A116    push        edi
 0042A117    test        dl,dl
>0042A119    je          0042A123
 0042A11B    add         esp,0FFFFFFF0
 0042A11E    call        @ClassCreate
 0042A123    mov         esi,ecx
 0042A125    mov         ebx,edx
 0042A127    mov         edi,eax
 0042A129    xor         edx,edx
 0042A12B    mov         eax,edi
 0042A12D    call        TCanvas.Create
 0042A132    mov         dword ptr [edi+58],esi
 0042A135    mov         eax,edi
 0042A137    test        bl,bl
>0042A139    je          0042A14A
 0042A13B    call        @AfterConstruction
 0042A140    pop         dword ptr fs:[0]
 0042A147    add         esp,0C
 0042A14A    mov         eax,edi
 0042A14C    pop         edi
 0042A14D    pop         esi
 0042A14E    pop         ebx
 0042A14F    ret
*}
end;

//0042A150
destructor TBitmapCanvas.Destroy;
begin
{*
 0042A150    push        ebx
 0042A151    push        esi
 0042A152    call        @BeforeDestruction
 0042A157    mov         ebx,edx
 0042A159    mov         esi,eax
 0042A15B    mov         eax,esi
 0042A15D    call        TBitmapCanvas.FreeContext
 0042A162    mov         edx,ebx
 0042A164    and         dl,0FC
 0042A167    mov         eax,esi
 0042A169    call        TCanvas.Destroy
 0042A16E    test        bl,bl
>0042A170    jle         0042A179
 0042A172    mov         eax,esi
 0042A174    call        @ClassDestroy
 0042A179    pop         esi
 0042A17A    pop         ebx
 0042A17B    ret
*}
end;

//0042A17C
procedure TBitmapCanvas.FreeContext;
begin
{*
 0042A17C    push        ebp
 0042A17D    mov         ebp,esp
 0042A17F    push        ecx
 0042A180    push        ebx
 0042A181    mov         dword ptr [ebp-4],eax
 0042A184    mov         eax,dword ptr [ebp-4]
 0042A187    cmp         dword ptr [eax+4],0
>0042A18B    je          0042A217
 0042A191    mov         eax,dword ptr [ebp-4]
 0042A194    call        TCanvas.Lock
 0042A199    xor         edx,edx
 0042A19B    push        ebp
 0042A19C    push        42A210
 0042A1A1    push        dword ptr fs:[edx]
 0042A1A4    mov         dword ptr fs:[edx],esp
 0042A1A7    mov         eax,dword ptr [ebp-4]
 0042A1AA    mov         eax,dword ptr [eax+5C]
 0042A1AD    test        eax,eax
>0042A1AF    je          0042A1BE
 0042A1B1    push        eax
 0042A1B2    mov         eax,dword ptr [ebp-4]
 0042A1B5    mov         eax,dword ptr [eax+4]
 0042A1B8    push        eax
 0042A1B9    call        gdi32.SelectObject
 0042A1BE    mov         eax,dword ptr [ebp-4]
 0042A1C1    mov         eax,dword ptr [eax+60]
 0042A1C4    test        eax,eax
>0042A1C6    je          0042A1D7
 0042A1C8    push        0FF
 0042A1CA    push        eax
 0042A1CB    mov         eax,dword ptr [ebp-4]
 0042A1CE    mov         eax,dword ptr [eax+4]
 0042A1D1    push        eax
 0042A1D2    call        gdi32.SelectPalette
 0042A1D7    mov         eax,dword ptr [ebp-4]
 0042A1DA    mov         ebx,dword ptr [eax+4]
 0042A1DD    xor         edx,edx
 0042A1DF    mov         eax,dword ptr [ebp-4]
 0042A1E2    call        TCanvas.SetHandle
 0042A1E7    push        ebx
 0042A1E8    call        gdi32.DeleteDC
 0042A1ED    mov         edx,dword ptr [ebp-4]
 0042A1F0    mov         eax,[005AC804]
 0042A1F5    call        TThreadList.Remove
 0042A1FA    xor         eax,eax
 0042A1FC    pop         edx
 0042A1FD    pop         ecx
 0042A1FE    pop         ecx
 0042A1FF    mov         dword ptr fs:[eax],edx
 0042A202    push        42A217
 0042A207    mov         eax,dword ptr [ebp-4]
 0042A20A    call        TCanvas.Unlock
 0042A20F    ret
>0042A210    jmp         @HandleFinally
>0042A215    jmp         0042A207
 0042A217    pop         ebx
 0042A218    pop         ecx
 0042A219    pop         ebp
 0042A21A    ret
*}
end;

//0042A21C
procedure TBitmapCanvas.CreateHandle;
begin
{*
 0042A21C    push        ebp
 0042A21D    mov         ebp,esp
 0042A21F    push        ecx
 0042A220    push        ebx
 0042A221    push        esi
 0042A222    mov         dword ptr [ebp-4],eax
 0042A225    mov         eax,dword ptr [ebp-4]
 0042A228    cmp         dword ptr [eax+58],0
>0042A22C    je          0042A302
 0042A232    mov         eax,dword ptr [ebp-4]
 0042A235    call        TCanvas.Lock
 0042A23A    xor         eax,eax
 0042A23C    push        ebp
 0042A23D    push        42A2FB
 0042A242    push        dword ptr fs:[eax]
 0042A245    mov         dword ptr fs:[eax],esp
 0042A248    mov         eax,dword ptr [ebp-4]
 0042A24B    mov         eax,dword ptr [eax+58]
 0042A24E    call        TBitmap.HandleNeeded
 0042A253    mov         eax,dword ptr [ebp-4]
 0042A256    mov         eax,dword ptr [eax+58]
 0042A259    mov         eax,dword ptr [eax+28]
 0042A25C    mov         eax,dword ptr [eax+8]
 0042A25F    call        DeselectBitmap
 0042A264    mov         eax,dword ptr [ebp-4]
 0042A267    mov         eax,dword ptr [eax+58]
 0042A26A    call        TBitmap.PaletteNeeded
 0042A26F    push        0
 0042A271    call        gdi32.CreateCompatibleDC
 0042A276    mov         ebx,eax
 0042A278    mov         eax,dword ptr [ebp-4]
 0042A27B    mov         eax,dword ptr [eax+58]
 0042A27E    mov         eax,dword ptr [eax+28]
 0042A281    mov         esi,dword ptr [eax+8]
 0042A284    test        esi,esi
>0042A286    je          0042A297
 0042A288    push        esi
 0042A289    push        ebx
 0042A28A    call        gdi32.SelectObject
 0042A28F    mov         edx,dword ptr [ebp-4]
 0042A292    mov         dword ptr [edx+5C],eax
>0042A295    jmp         0042A29F
 0042A297    mov         eax,dword ptr [ebp-4]
 0042A29A    xor         edx,edx
 0042A29C    mov         dword ptr [eax+5C],edx
 0042A29F    mov         eax,dword ptr [ebp-4]
 0042A2A2    mov         eax,dword ptr [eax+58]
 0042A2A5    mov         eax,dword ptr [eax+28]
 0042A2A8    mov         esi,dword ptr [eax+10]
 0042A2AB    test        esi,esi
>0042A2AD    je          0042A2C6
 0042A2AF    push        0FF
 0042A2B1    push        esi
 0042A2B2    push        ebx
 0042A2B3    call        gdi32.SelectPalette
 0042A2B8    mov         edx,dword ptr [ebp-4]
 0042A2BB    mov         dword ptr [edx+60],eax
 0042A2BE    push        ebx
 0042A2BF    call        gdi32.RealizePalette
>0042A2C4    jmp         0042A2CE
 0042A2C6    mov         eax,dword ptr [ebp-4]
 0042A2C9    xor         edx,edx
 0042A2CB    mov         dword ptr [eax+60],edx
 0042A2CE    mov         edx,ebx
 0042A2D0    mov         eax,dword ptr [ebp-4]
 0042A2D3    call        TCanvas.SetHandle
 0042A2D8    mov         edx,dword ptr [ebp-4]
 0042A2DB    mov         eax,[005AC804]
 0042A2E0    call        TThreadList.Add
 0042A2E5    xor         eax,eax
 0042A2E7    pop         edx
 0042A2E8    pop         ecx
 0042A2E9    pop         ecx
 0042A2EA    mov         dword ptr fs:[eax],edx
 0042A2ED    push        42A302
 0042A2F2    mov         eax,dword ptr [ebp-4]
 0042A2F5    call        TCanvas.Unlock
 0042A2FA    ret
>0042A2FB    jmp         @HandleFinally
>0042A300    jmp         0042A2F2
 0042A302    pop         esi
 0042A303    pop         ebx
 0042A304    pop         ecx
 0042A305    pop         ebp
 0042A306    ret
*}
end;

//0042A308
procedure TSharedImage.Reference;
begin
{*
 0042A308    inc         dword ptr [eax+4]
 0042A30B    ret
*}
end;

//0042A30C
procedure TSharedImage.Release;
begin
{*
 0042A30C    push        ebx
 0042A30D    mov         ebx,eax
 0042A30F    test        ebx,ebx
>0042A311    je          0042A329
 0042A313    dec         dword ptr [ebx+4]
 0042A316    cmp         dword ptr [ebx+4],0
>0042A31A    jne         0042A329
 0042A31C    mov         eax,ebx
 0042A31E    mov         edx,dword ptr [eax]
 0042A320    call        dword ptr [edx]
 0042A322    mov         eax,ebx
 0042A324    call        TObject.Free
 0042A329    pop         ebx
 0042A32A    ret
*}
end;

//0042A32C
destructor TBitmapImage.Destroy;
begin
{*
 0042A32C    push        ebx
 0042A32D    push        esi
 0042A32E    call        @BeforeDestruction
 0042A333    mov         ebx,edx
 0042A335    mov         esi,eax
 0042A337    mov         eax,dword ptr [esi+14]
 0042A33A    test        eax,eax
>0042A33C    je          0042A351
 0042A33E    call        DeselectBitmap
 0042A343    mov         eax,dword ptr [esi+14]
 0042A346    push        eax
 0042A347    call        gdi32.DeleteObject
 0042A34C    xor         eax,eax
 0042A34E    mov         dword ptr [esi+14],eax
 0042A351    mov         eax,esi
 0042A353    mov         edx,dword ptr [eax]
 0042A355    call        dword ptr [edx]
 0042A357    mov         eax,dword ptr [esi+64]
 0042A35A    test        eax,eax
>0042A35C    je          0042A364
 0042A35E    push        eax
 0042A35F    call        KERNEL32.CloseHandle
 0042A364    lea         eax,[esi+6C]
 0042A367    call        FreeAndNil
 0042A36C    mov         edx,ebx
 0042A36E    and         dl,0FC
 0042A371    mov         eax,esi
 0042A373    call        TObject.Destroy
 0042A378    test        bl,bl
>0042A37A    jle         0042A383
 0042A37C    mov         eax,esi
 0042A37E    call        @ClassDestroy
 0042A383    pop         esi
 0042A384    pop         ebx
 0042A385    ret
*}
end;

//0042A388
procedure TBitmapImage.FreeHandle;
begin
{*
 0042A388    push        ebx
 0042A389    mov         ebx,eax
 0042A38B    mov         eax,dword ptr [ebx+8]
 0042A38E    test        eax,eax
>0042A390    je          0042A3A5
 0042A392    cmp         eax,dword ptr [ebx+14]
>0042A395    je          0042A3A5
 0042A397    call        DeselectBitmap
 0042A39C    mov         eax,dword ptr [ebx+8]
 0042A39F    push        eax
 0042A3A0    call        gdi32.DeleteObject
 0042A3A5    mov         eax,dword ptr [ebx+0C]
 0042A3A8    test        eax,eax
>0042A3AA    je          0042A3BF
 0042A3AC    call        DeselectBitmap
 0042A3B1    mov         eax,dword ptr [ebx+0C]
 0042A3B4    push        eax
 0042A3B5    call        gdi32.DeleteObject
 0042A3BA    xor         eax,eax
 0042A3BC    mov         dword ptr [ebx+0C],eax
 0042A3BF    mov         eax,dword ptr [ebx+10]
 0042A3C2    call        InternalDeletePalette
 0042A3C7    xor         eax,eax
 0042A3C9    mov         dword ptr [ebx+8],eax
 0042A3CC    xor         eax,eax
 0042A3CE    mov         dword ptr [ebx+10],eax
 0042A3D1    pop         ebx
 0042A3D2    ret
*}
end;

//0042A3D4
procedure UpdateDIBColorTable(DIBHandle:HBITMAP; Pal:HPALETTE; const DIB:TDIBSection);
begin
{*
 0042A3D4    push        ebp
 0042A3D5    mov         ebp,esp
 0042A3D7    add         esp,0FFFFFBF0
 0042A3DD    push        ebx
 0042A3DE    push        esi
 0042A3DF    mov         dword ptr [ebp-4],edx
 0042A3E2    mov         esi,eax
 0042A3E4    test        esi,esi
>0042A3E6    je          0042A48A
 0042A3EC    cmp         word ptr [ecx+26],8
>0042A3F1    ja          0042A48A
 0042A3F7    lea         edx,[ebp-410]
 0042A3FD    mov         ecx,0FF
 0042A402    mov         eax,dword ptr [ebp-4]
 0042A405    call        PaletteToDIBColorTable
 0042A40A    mov         ebx,eax
 0042A40C    test        ebx,ebx
>0042A40E    je          0042A48A
 0042A410    push        0
 0042A412    call        user32.GetDC
 0042A417    mov         dword ptr [ebp-8],eax
 0042A41A    mov         eax,dword ptr [ebp-8]
 0042A41D    push        eax
 0042A41E    call        gdi32.CreateCompatibleDC
 0042A423    mov         dword ptr [ebp-0C],eax
 0042A426    push        esi
 0042A427    mov         eax,dword ptr [ebp-0C]
 0042A42A    push        eax
 0042A42B    call        gdi32.SelectObject
 0042A430    mov         dword ptr [ebp-10],eax
 0042A433    xor         eax,eax
 0042A435    push        ebp
 0042A436    push        42A483
 0042A43B    push        dword ptr fs:[eax]
 0042A43E    mov         dword ptr fs:[eax],esp
 0042A441    lea         eax,[ebp-410]
 0042A447    push        eax
 0042A448    push        ebx
 0042A449    push        0
 0042A44B    mov         eax,dword ptr [ebp-0C]
 0042A44E    push        eax
 0042A44F    call        gdi32.SetDIBColorTable
 0042A454    xor         eax,eax
 0042A456    pop         edx
 0042A457    pop         ecx
 0042A458    pop         ecx
 0042A459    mov         dword ptr fs:[eax],edx
 0042A45C    push        42A48A
 0042A461    mov         eax,dword ptr [ebp-10]
 0042A464    push        eax
 0042A465    mov         eax,dword ptr [ebp-0C]
 0042A468    push        eax
 0042A469    call        gdi32.SelectObject
 0042A46E    mov         eax,dword ptr [ebp-0C]
 0042A471    push        eax
 0042A472    call        gdi32.DeleteDC
 0042A477    mov         eax,dword ptr [ebp-8]
 0042A47A    push        eax
 0042A47B    push        0
 0042A47D    call        user32.ReleaseDC
 0042A482    ret
>0042A483    jmp         @HandleFinally
>0042A488    jmp         0042A461
 0042A48A    pop         esi
 0042A48B    pop         ebx
 0042A48C    mov         esp,ebp
 0042A48E    pop         ebp
 0042A48F    ret
*}
end;

//0042A490
procedure FixupBitFields(var DIB:TDIBSection);
begin
{*
 0042A490    test        byte ptr [eax+28],3
>0042A494    je          0042A4D8
 0042A496    cmp         dword ptr [eax+40],0
>0042A49A    jne         0042A4D8
 0042A49C    mov         dx,word ptr [eax+26]
 0042A4A0    cmp         dx,10
>0042A4A4    jne         0042A4BD
 0042A4A6    mov         dword ptr [eax+40],0F800
 0042A4AD    mov         dword ptr [eax+44],7E0
 0042A4B4    mov         dword ptr [eax+48],1F
>0042A4BB    jmp         0042A4D8
 0042A4BD    cmp         dx,20
>0042A4C1    jne         0042A4D8
 0042A4C3    mov         dword ptr [eax+40],0FF0000
 0042A4CA    mov         dword ptr [eax+44],0FF00
 0042A4D1    mov         dword ptr [eax+48],0FF
 0042A4D8    ret
*}
end;

//0042A4DC
function CopyBitmap(Handle:HBITMAP; OldPalette:HPALETTE; NewPalette:HPALETTE; var DIB:TDIBSection; Canvas:TCanvas):HBITMAP;
begin
{*
 0042A4DC    push        ebp
 0042A4DD    mov         ebp,esp
 0042A4DF    add         esp,0FFFFFF68
 0042A4E5    push        ebx
 0042A4E6    push        esi
 0042A4E7    push        edi
 0042A4E8    mov         dword ptr [ebp-0C],ecx
 0042A4EB    mov         dword ptr [ebp-8],edx
 0042A4EE    mov         dword ptr [ebp-4],eax
 0042A4F1    xor         eax,eax
 0042A4F3    mov         dword ptr [ebp-10],eax
 0042A4F6    mov         eax,dword ptr [ebp+0C]
 0042A4F9    cmp         dword ptr [eax+18],0
>0042A4FD    je          0042A519
 0042A4FF    mov         eax,dword ptr [ebp+0C]
 0042A502    cmp         dword ptr [eax+1C],0
>0042A506    je          0042AB31
 0042A50C    mov         eax,dword ptr [ebp+0C]
 0042A50F    cmp         dword ptr [eax+20],0
>0042A513    je          0042AB31
 0042A519    mov         eax,dword ptr [ebp+0C]
 0042A51C    cmp         dword ptr [eax+18],0
>0042A520    jne         0042A53C
 0042A522    mov         eax,dword ptr [ebp+0C]
 0042A525    cmp         dword ptr [eax+4],0
>0042A529    je          0042AB31
 0042A52F    mov         eax,dword ptr [ebp+0C]
 0042A532    cmp         dword ptr [eax+8],0
>0042A536    je          0042AB31
 0042A53C    mov         eax,dword ptr [ebp-4]
 0042A53F    call        DeselectBitmap
 0042A544    xor         eax,eax
 0042A546    mov         dword ptr [ebp-70],eax
 0042A549    cmp         dword ptr [ebp-4],0
>0042A54D    je          0042A56B
 0042A54F    lea         eax,[ebp-88]
 0042A555    push        eax
 0042A556    push        54
 0042A558    mov         eax,dword ptr [ebp-4]
 0042A55B    push        eax
 0042A55C    call        gdi32.GetObjectA
 0042A561    cmp         eax,18
>0042A564    jge         0042A56B
 0042A566    call        InvalidBitmap
 0042A56B    push        0
 0042A56D    call        user32.GetDC
 0042A572    call        GDICheck
 0042A577    mov         dword ptr [ebp-18],eax
 0042A57A    mov         eax,dword ptr [ebp-18]
 0042A57D    push        eax
 0042A57E    call        gdi32.CreateCompatibleDC
 0042A583    call        GDICheck
 0042A588    mov         dword ptr [ebp-1C],eax
 0042A58B    xor         edx,edx
 0042A58D    push        ebp
 0042A58E    push        42AB2A
 0042A593    push        dword ptr fs:[edx]
 0042A596    mov         dword ptr fs:[edx],esp
 0042A599    mov         eax,dword ptr [ebp+0C]
 0042A59C    cmp         dword ptr [eax+18],28
>0042A5A0    jae         0042A600
 0042A5A2    mov         eax,dword ptr [ebp+0C]
 0042A5A5    mov         ax,word ptr [eax+10]
 0042A5A9    mov         edx,dword ptr [ebp+0C]
 0042A5AC    or          ax,word ptr [edx+12]
 0042A5B0    cmp         ax,1
>0042A5B4    jne         0042A5DC
 0042A5B6    push        0
 0042A5B8    push        1
 0042A5BA    push        1
 0042A5BC    mov         eax,dword ptr [ebp+0C]
 0042A5BF    mov         eax,dword ptr [eax+8]
 0042A5C2    push        eax
 0042A5C3    mov         eax,dword ptr [ebp+0C]
 0042A5C6    mov         eax,dword ptr [eax+4]
 0042A5C9    push        eax
 0042A5CA    call        gdi32.CreateBitmap
 0042A5CF    call        GDICheck
 0042A5D4    mov         dword ptr [ebp-10],eax
>0042A5D7    jmp         0042A83B
 0042A5DC    mov         eax,dword ptr [ebp+0C]
 0042A5DF    mov         eax,dword ptr [eax+8]
 0042A5E2    push        eax
 0042A5E3    mov         eax,dword ptr [ebp+0C]
 0042A5E6    mov         eax,dword ptr [eax+4]
 0042A5E9    push        eax
 0042A5EA    mov         eax,dword ptr [ebp-18]
 0042A5ED    push        eax
 0042A5EE    call        gdi32.CreateCompatibleBitmap
 0042A5F3    call        GDICheck
 0042A5F8    mov         dword ptr [ebp-10],eax
>0042A5FB    jmp         0042A83B
 0042A600    mov         eax,42C
 0042A605    call        @GetMem
 0042A60A    mov         dword ptr [ebp-24],eax
 0042A60D    xor         edx,edx
 0042A60F    push        ebp
 0042A610    push        42A834
 0042A615    push        dword ptr fs:[edx]
 0042A618    mov         dword ptr fs:[edx],esp
 0042A61B    mov         eax,dword ptr [ebp+0C]
 0042A61E    mov         dword ptr [eax+18],28
 0042A625    mov         eax,dword ptr [ebp+0C]
 0042A628    mov         word ptr [eax+24],1
 0042A62E    mov         eax,dword ptr [ebp+0C]
 0042A631    cmp         word ptr [eax+26],0
>0042A636    jne         0042A65B
 0042A638    push        0C
 0042A63A    mov         eax,dword ptr [ebp-18]
 0042A63D    push        eax
 0042A63E    call        gdi32.GetDeviceCaps
 0042A643    mov         ebx,eax
 0042A645    push        0E
 0042A647    mov         eax,dword ptr [ebp-18]
 0042A64A    push        eax
 0042A64B    call        gdi32.GetDeviceCaps
 0042A650    imul        bx,ax
 0042A654    mov         eax,dword ptr [ebp+0C]
 0042A657    mov         word ptr [eax+26],bx
 0042A65B    mov         eax,dword ptr [ebp+0C]
 0042A65E    mov         edx,dword ptr [ebp-24]
 0042A661    lea         esi,[eax+18]
 0042A664    mov         edi,edx
 0042A666    mov         ecx,0A
 0042A66B    rep movs    dword ptr [edi],dword ptr [esi]
 0042A66D    mov         eax,dword ptr [ebp+0C]
 0042A670    mov         eax,dword ptr [eax+1C]
 0042A673    mov         edx,dword ptr [ebp+0C]
 0042A676    mov         dword ptr [edx+4],eax
 0042A679    mov         eax,dword ptr [ebp+0C]
 0042A67C    mov         eax,dword ptr [eax+20]
 0042A67F    mov         edx,dword ptr [ebp+0C]
 0042A682    mov         dword ptr [edx+8],eax
 0042A685    mov         eax,dword ptr [ebp+0C]
 0042A688    cmp         word ptr [eax+26],8
>0042A68D    ja          0042A75A
 0042A693    mov         eax,dword ptr [ebp+0C]
 0042A696    cmp         word ptr [eax+26],1
>0042A69B    jne         0042A6C5
 0042A69D    cmp         dword ptr [ebp-4],0
>0042A6A1    je          0042A6A9
 0042A6A3    cmp         dword ptr [ebp-74],0
>0042A6A7    jne         0042A6C5
 0042A6A9    mov         eax,dword ptr [ebp-24]
 0042A6AC    xor         edx,edx
 0042A6AE    mov         dword ptr [eax+28],edx
 0042A6B1    mov         eax,dword ptr [ebp-24]
 0042A6B4    add         eax,28
 0042A6B7    add         eax,4
 0042A6BA    mov         dword ptr [eax],0FFFFFF
>0042A6C0    jmp         0042A797
 0042A6C5    cmp         dword ptr [ebp-0C],0
>0042A6C9    je          0042A6E3
 0042A6CB    mov         eax,dword ptr [ebp-24]
 0042A6CE    lea         edx,[eax+28]
 0042A6D1    mov         ecx,0FF
 0042A6D6    mov         eax,dword ptr [ebp-0C]
 0042A6D9    call        PaletteToDIBColorTable
>0042A6DE    jmp         0042A797
 0042A6E3    cmp         dword ptr [ebp-4],0
>0042A6E7    je          0042A797
 0042A6ED    mov         eax,dword ptr [ebp-4]
 0042A6F0    push        eax
 0042A6F1    mov         eax,dword ptr [ebp-1C]
 0042A6F4    push        eax
 0042A6F5    call        gdi32.SelectObject
 0042A6FA    mov         dword ptr [ebp-14],eax
 0042A6FD    cmp         dword ptr [ebp-70],0
>0042A701    jbe         0042A728
 0042A703    cmp         dword ptr [ebp-74],0
>0042A707    je          0042A728
 0042A709    mov         eax,dword ptr [ebp-24]
 0042A70C    add         eax,28
 0042A70F    push        eax
 0042A710    push        100
 0042A715    push        0
 0042A717    mov         eax,dword ptr [ebp-1C]
 0042A71A    push        eax
 0042A71B    call        gdi32.GetDIBColorTable
 0042A720    mov         edx,dword ptr [ebp+0C]
 0042A723    mov         dword ptr [edx+38],eax
>0042A726    jmp         0042A74B
 0042A728    push        0
 0042A72A    mov         eax,dword ptr [ebp-24]
 0042A72D    push        eax
 0042A72E    push        0
 0042A730    mov         eax,dword ptr [ebp+0C]
 0042A733    mov         eax,dword ptr [eax+20]
 0042A736    cdq
 0042A737    xor         eax,edx
 0042A739    sub         eax,edx
 0042A73B    push        eax
 0042A73C    push        0
 0042A73E    mov         eax,dword ptr [ebp-4]
 0042A741    push        eax
 0042A742    mov         eax,dword ptr [ebp-1C]
 0042A745    push        eax
 0042A746    call        gdi32.GetDIBits
 0042A74B    mov         eax,dword ptr [ebp-14]
 0042A74E    push        eax
 0042A74F    mov         eax,dword ptr [ebp-1C]
 0042A752    push        eax
 0042A753    call        gdi32.SelectObject
>0042A758    jmp         0042A797
 0042A75A    mov         eax,dword ptr [ebp+0C]
 0042A75D    mov         ax,word ptr [eax+26]
 0042A761    cmp         ax,10
>0042A765    je          0042A770
 0042A767    mov         edx,dword ptr [ebp+0C]
 0042A76A    cmp         ax,20
>0042A76E    jne         0042A797
 0042A770    mov         eax,dword ptr [ebp+0C]
 0042A773    test        byte ptr [eax+28],3
>0042A777    je          0042A797
 0042A779    mov         eax,dword ptr [ebp+0C]
 0042A77C    call        FixupBitFields
 0042A781    mov         eax,dword ptr [ebp-24]
 0042A784    lea         edx,[eax+28]
 0042A787    mov         eax,dword ptr [ebp+0C]
 0042A78A    add         eax,40
 0042A78D    mov         ecx,0C
 0042A792    call        Move
 0042A797    push        0
 0042A799    push        0
 0042A79B    lea         eax,[ebp-28]
 0042A79E    push        eax
 0042A79F    push        0
 0042A7A1    mov         eax,dword ptr [ebp-24]
 0042A7A4    push        eax
 0042A7A5    mov         eax,dword ptr [ebp-18]
 0042A7A8    push        eax
 0042A7A9    call        gdi32.CreateDIBSection
 0042A7AE    call        GDICheck
 0042A7B3    mov         dword ptr [ebp-10],eax
 0042A7B6    cmp         dword ptr [ebp-28],0
>0042A7BA    jne         0042A7C1
 0042A7BC    call        GDIError
 0042A7C1    cmp         dword ptr [ebp-4],0
>0042A7C5    je          0042A81E
 0042A7C7    mov         eax,dword ptr [ebp+0C]
 0042A7CA    mov         eax,dword ptr [eax+1C]
 0042A7CD    cmp         eax,dword ptr [ebp-84]
>0042A7D3    jne         0042A81E
 0042A7D5    mov         eax,dword ptr [ebp+0C]
 0042A7D8    mov         eax,dword ptr [eax+20]
 0042A7DB    cmp         eax,dword ptr [ebp-80]
>0042A7DE    jne         0042A81E
 0042A7E0    mov         eax,dword ptr [ebp+0C]
 0042A7E3    cmp         word ptr [eax+26],8
>0042A7E8    jbe         0042A81E
 0042A7EA    push        0
 0042A7EC    mov         eax,dword ptr [ebp-24]
 0042A7EF    push        eax
 0042A7F0    mov         eax,dword ptr [ebp-28]
 0042A7F3    push        eax
 0042A7F4    mov         eax,dword ptr [ebp+0C]
 0042A7F7    mov         eax,dword ptr [eax+20]
 0042A7FA    cdq
 0042A7FB    xor         eax,edx
 0042A7FD    sub         eax,edx
 0042A7FF    push        eax
 0042A800    push        0
 0042A802    mov         eax,dword ptr [ebp-4]
 0042A805    push        eax
 0042A806    mov         eax,dword ptr [ebp-1C]
 0042A809    push        eax
 0042A80A    call        gdi32.GetDIBits
 0042A80F    call        @TryFinallyExit
 0042A814    call        @TryFinallyExit
>0042A819    jmp         0042AB31
 0042A81E    xor         eax,eax
 0042A820    pop         edx
 0042A821    pop         ecx
 0042A822    pop         ecx
 0042A823    mov         dword ptr fs:[eax],edx
 0042A826    push        42A83B
 0042A82B    mov         eax,dword ptr [ebp-24]
 0042A82E    call        @FreeMem
 0042A833    ret
>0042A834    jmp         @HandleFinally
>0042A839    jmp         0042A82B
 0042A83B    mov         eax,dword ptr [ebp-10]
 0042A83E    call        GDICheck
 0042A843    mov         eax,dword ptr [ebp-10]
 0042A846    push        eax
 0042A847    mov         eax,dword ptr [ebp-1C]
 0042A84A    push        eax
 0042A84B    call        gdi32.SelectObject
 0042A850    call        GDICheck
 0042A855    mov         dword ptr [ebp-14],eax
 0042A858    xor         eax,eax
 0042A85A    push        ebp
 0042A85B    push        42AADB
 0042A860    push        dword ptr fs:[eax]
 0042A863    mov         dword ptr fs:[eax],esp
 0042A866    xor         eax,eax
 0042A868    push        ebp
 0042A869    push        42AACA
 0042A86E    push        dword ptr fs:[eax]
 0042A871    mov         dword ptr fs:[eax],esp
 0042A874    xor         eax,eax
 0042A876    mov         dword ptr [ebp-34],eax
 0042A879    xor         ebx,ebx
 0042A87B    cmp         dword ptr [ebp-0C],0
>0042A87F    je          0042A89C
 0042A881    push        0
 0042A883    mov         eax,dword ptr [ebp-0C]
 0042A886    push        eax
 0042A887    mov         eax,dword ptr [ebp-1C]
 0042A88A    push        eax
 0042A88B    call        gdi32.SelectPalette
 0042A890    mov         dword ptr [ebp-34],eax
 0042A893    mov         eax,dword ptr [ebp-1C]
 0042A896    push        eax
 0042A897    call        gdi32.RealizePalette
 0042A89C    xor         eax,eax
 0042A89E    push        ebp
 0042A89F    push        42AAA8
 0042A8A4    push        dword ptr fs:[eax]
 0042A8A7    mov         dword ptr fs:[eax],esp
 0042A8AA    cmp         dword ptr [ebp+8],0
>0042A8AE    je          0042A969
 0042A8B4    mov         eax,dword ptr [ebp+8]
 0042A8B7    mov         eax,dword ptr [eax+14]
 0042A8BA    call        TBrush.GetHandle
 0042A8BF    push        eax
 0042A8C0    mov         eax,dword ptr [ebp+0C]
 0042A8C3    mov         eax,dword ptr [eax+8]
 0042A8C6    push        eax
 0042A8C7    lea         eax,[ebp-98]
 0042A8CD    push        eax
 0042A8CE    mov         ecx,dword ptr [ebp+0C]
 0042A8D1    mov         ecx,dword ptr [ecx+4]
 0042A8D4    xor         edx,edx
 0042A8D6    xor         eax,eax
 0042A8D8    call        Bounds
 0042A8DD    lea         eax,[ebp-98]
 0042A8E3    push        eax
 0042A8E4    mov         eax,dword ptr [ebp-1C]
 0042A8E7    push        eax
 0042A8E8    call        user32.FillRect
 0042A8ED    mov         eax,dword ptr [ebp+8]
 0042A8F0    mov         eax,dword ptr [eax+0C]
 0042A8F3    mov         eax,dword ptr [eax+18]
 0042A8F6    call        ColorToRGB
 0042A8FB    push        eax
 0042A8FC    mov         eax,dword ptr [ebp-1C]
 0042A8FF    push        eax
 0042A900    call        gdi32.SetTextColor
 0042A905    mov         eax,dword ptr [ebp+8]
 0042A908    mov         eax,dword ptr [eax+14]
 0042A90B    call        TBrush.GetColor
 0042A910    call        ColorToRGB
 0042A915    push        eax
 0042A916    mov         eax,dword ptr [ebp-1C]
 0042A919    push        eax
 0042A91A    call        gdi32.SetBkColor
 0042A91F    mov         eax,dword ptr [ebp+0C]
 0042A922    cmp         word ptr [eax+26],1
>0042A927    jne         0042A989
 0042A929    mov         eax,dword ptr [ebp+0C]
 0042A92C    cmp         dword ptr [eax+14],0
>0042A930    je          0042A989
 0042A932    mov         eax,dword ptr [ebp+8]
 0042A935    mov         eax,dword ptr [eax+0C]
 0042A938    mov         eax,dword ptr [eax+18]
 0042A93B    call        ColorToRGB
 0042A940    mov         dword ptr [ebp-30],eax
 0042A943    mov         eax,dword ptr [ebp+8]
 0042A946    mov         eax,dword ptr [eax+14]
 0042A949    call        TBrush.GetColor
 0042A94E    call        ColorToRGB
 0042A953    mov         dword ptr [ebp-2C],eax
 0042A956    lea         eax,[ebp-30]
 0042A959    push        eax
 0042A95A    push        2
 0042A95C    push        0
 0042A95E    mov         eax,dword ptr [ebp-1C]
 0042A961    push        eax
 0042A962    call        gdi32.SetDIBColorTable
>0042A967    jmp         0042A989
 0042A969    push        0FF0062
 0042A96E    mov         eax,dword ptr [ebp+0C]
 0042A971    mov         eax,dword ptr [eax+8]
 0042A974    push        eax
 0042A975    mov         eax,dword ptr [ebp+0C]
 0042A978    mov         eax,dword ptr [eax+4]
 0042A97B    push        eax
 0042A97C    push        0
 0042A97E    push        0
 0042A980    mov         eax,dword ptr [ebp-1C]
 0042A983    push        eax
 0042A984    call        gdi32.PatBlt
 0042A989    cmp         dword ptr [ebp-4],0
>0042A98D    je          0042AA85
 0042A993    mov         eax,dword ptr [ebp-18]
 0042A996    push        eax
 0042A997    call        gdi32.CreateCompatibleDC
 0042A99C    call        GDICheck
 0042A9A1    mov         dword ptr [ebp-20],eax
 0042A9A4    xor         eax,eax
 0042A9A6    push        ebp
 0042A9A7    push        42AA7E
 0042A9AC    push        dword ptr fs:[eax]
 0042A9AF    mov         dword ptr fs:[eax],esp
 0042A9B2    mov         eax,dword ptr [ebp-4]
 0042A9B5    push        eax
 0042A9B6    mov         eax,dword ptr [ebp-20]
 0042A9B9    push        eax
 0042A9BA    call        gdi32.SelectObject
 0042A9BF    call        GDICheck
 0042A9C4    mov         esi,eax
 0042A9C6    cmp         dword ptr [ebp-8],0
>0042A9CA    je          0042A9E6
 0042A9CC    push        0
 0042A9CE    mov         eax,dword ptr [ebp-8]
 0042A9D1    push        eax
 0042A9D2    mov         eax,dword ptr [ebp-20]
 0042A9D5    push        eax
 0042A9D6    call        gdi32.SelectPalette
 0042A9DB    mov         ebx,eax
 0042A9DD    mov         eax,dword ptr [ebp-20]
 0042A9E0    push        eax
 0042A9E1    call        gdi32.RealizePalette
 0042A9E6    cmp         dword ptr [ebp+8],0
>0042A9EA    je          0042AA1E
 0042A9EC    mov         eax,dword ptr [ebp+8]
 0042A9EF    mov         eax,dword ptr [eax+0C]
 0042A9F2    mov         eax,dword ptr [eax+18]
 0042A9F5    call        ColorToRGB
 0042A9FA    push        eax
 0042A9FB    mov         eax,dword ptr [ebp-20]
 0042A9FE    push        eax
 0042A9FF    call        gdi32.SetTextColor
 0042AA04    mov         eax,dword ptr [ebp+8]
 0042AA07    mov         eax,dword ptr [eax+14]
 0042AA0A    call        TBrush.GetColor
 0042AA0F    call        ColorToRGB
 0042AA14    push        eax
 0042AA15    mov         eax,dword ptr [ebp-20]
 0042AA18    push        eax
 0042AA19    call        gdi32.SetBkColor
 0042AA1E    push        0CC0020
 0042AA23    push        0
 0042AA25    push        0
 0042AA27    mov         eax,dword ptr [ebp-20]
 0042AA2A    push        eax
 0042AA2B    mov         eax,dword ptr [ebp+0C]
 0042AA2E    mov         eax,dword ptr [eax+8]
 0042AA31    push        eax
 0042AA32    mov         eax,dword ptr [ebp+0C]
 0042AA35    mov         eax,dword ptr [eax+4]
 0042AA38    push        eax
 0042AA39    push        0
 0042AA3B    push        0
 0042AA3D    mov         eax,dword ptr [ebp-1C]
 0042AA40    push        eax
 0042AA41    call        gdi32.BitBlt
 0042AA46    cmp         dword ptr [ebp-8],0
>0042AA4A    je          0042AA58
 0042AA4C    push        0FF
 0042AA4E    push        ebx
 0042AA4F    mov         eax,dword ptr [ebp-20]
 0042AA52    push        eax
 0042AA53    call        gdi32.SelectPalette
 0042AA58    push        esi
 0042AA59    mov         eax,dword ptr [ebp-20]
 0042AA5C    push        eax
 0042AA5D    call        gdi32.SelectObject
 0042AA62    call        GDICheck
 0042AA67    xor         eax,eax
 0042AA69    pop         edx
 0042AA6A    pop         ecx
 0042AA6B    pop         ecx
 0042AA6C    mov         dword ptr fs:[eax],edx
 0042AA6F    push        42AA85
 0042AA74    mov         eax,dword ptr [ebp-20]
 0042AA77    push        eax
 0042AA78    call        gdi32.DeleteDC
 0042AA7D    ret
>0042AA7E    jmp         @HandleFinally
>0042AA83    jmp         0042AA74
 0042AA85    xor         eax,eax
 0042AA87    pop         edx
 0042AA88    pop         ecx
 0042AA89    pop         ecx
 0042AA8A    mov         dword ptr fs:[eax],edx
 0042AA8D    push        42AAAF
 0042AA92    cmp         dword ptr [ebp-0C],0
>0042AA96    je          0042AAA7
 0042AA98    push        0FF
 0042AA9A    mov         eax,dword ptr [ebp-34]
 0042AA9D    push        eax
 0042AA9E    mov         eax,dword ptr [ebp-1C]
 0042AAA1    push        eax
 0042AAA2    call        gdi32.SelectPalette
 0042AAA7    ret
>0042AAA8    jmp         @HandleFinally
>0042AAAD    jmp         0042AA92
 0042AAAF    xor         eax,eax
 0042AAB1    pop         edx
 0042AAB2    pop         ecx
 0042AAB3    pop         ecx
 0042AAB4    mov         dword ptr fs:[eax],edx
 0042AAB7    push        42AAD1
 0042AABC    mov         eax,dword ptr [ebp-14]
 0042AABF    push        eax
 0042AAC0    mov         eax,dword ptr [ebp-1C]
 0042AAC3    push        eax
 0042AAC4    call        gdi32.SelectObject
 0042AAC9    ret
>0042AACA    jmp         @HandleFinally
>0042AACF    jmp         0042AABC
 0042AAD1    xor         eax,eax
 0042AAD3    pop         edx
 0042AAD4    pop         ecx
 0042AAD5    pop         ecx
 0042AAD6    mov         dword ptr fs:[eax],edx
>0042AAD9    jmp         0042AAF3
>0042AADB    jmp         @HandleAnyException
 0042AAE0    mov         eax,dword ptr [ebp-10]
 0042AAE3    push        eax
 0042AAE4    call        gdi32.DeleteObject
 0042AAE9    call        @RaiseAgain
 0042AAEE    call        @DoneExcept
 0042AAF3    xor         eax,eax
 0042AAF5    pop         edx
 0042AAF6    pop         ecx
 0042AAF7    pop         ecx
 0042AAF8    mov         dword ptr fs:[eax],edx
 0042AAFB    push        42AB31
 0042AB00    mov         eax,dword ptr [ebp-1C]
 0042AB03    push        eax
 0042AB04    call        gdi32.DeleteDC
 0042AB09    mov         eax,dword ptr [ebp-18]
 0042AB0C    push        eax
 0042AB0D    push        0
 0042AB0F    call        user32.ReleaseDC
 0042AB14    cmp         dword ptr [ebp-10],0
>0042AB18    je          0042AB29
 0042AB1A    mov         eax,dword ptr [ebp+0C]
 0042AB1D    push        eax
 0042AB1E    push        54
 0042AB20    mov         eax,dword ptr [ebp-10]
 0042AB23    push        eax
 0042AB24    call        gdi32.GetObjectA
 0042AB29    ret
>0042AB2A    jmp         @HandleFinally
>0042AB2F    jmp         0042AB00
 0042AB31    mov         eax,dword ptr [ebp-10]
 0042AB34    pop         edi
 0042AB35    pop         esi
 0042AB36    pop         ebx
 0042AB37    mov         esp,ebp
 0042AB39    pop         ebp
 0042AB3A    ret         8
*}
end;

//0042AB40
function CopyPalette(Palette:HPALETTE):HPALETTE;
begin
{*
 0042AB40    push        ebx
 0042AB41    push        esi
 0042AB42    add         esp,0FFFFFBF8
 0042AB48    mov         ebx,eax
 0042AB4A    xor         esi,esi
 0042AB4C    test        ebx,ebx
>0042AB4E    je          0042AB96
 0042AB50    xor         eax,eax
 0042AB52    mov         dword ptr [esp],eax
 0042AB55    push        esp
 0042AB56    push        4
 0042AB58    push        ebx
 0042AB59    call        gdi32.GetObjectA
 0042AB5E    test        eax,eax
>0042AB60    je          0042AB96
 0042AB62    cmp         dword ptr [esp],0
>0042AB66    je          0042AB96
 0042AB68    mov         word ptr [esp+4],300
 0042AB6F    mov         ax,word ptr [esp]
 0042AB73    mov         word ptr [esp+6],ax
 0042AB78    lea         eax,[esp+8]
 0042AB7C    push        eax
 0042AB7D    mov         eax,dword ptr [esp+4]
 0042AB81    push        eax
 0042AB82    push        0
 0042AB84    push        ebx
 0042AB85    call        gdi32.GetPaletteEntries
 0042AB8A    lea         eax,[esp+4]
 0042AB8E    push        eax
 0042AB8F    call        gdi32.CreatePalette
 0042AB94    mov         esi,eax
 0042AB96    mov         eax,esi
 0042AB98    add         esp,408
 0042AB9E    pop         esi
 0042AB9F    pop         ebx
 0042ABA0    ret
*}
end;

//0042ABA4
function CopyBitmapAsMask(Handle:HBITMAP; Palette:HPALETTE; TransparentColor:TColorRef):HBITMAP;
begin
{*
 0042ABA4    push        ebp
 0042ABA5    mov         ebp,esp
 0042ABA7    add         esp,0FFFFFF90
 0042ABAA    push        ebx
 0042ABAB    push        esi
 0042ABAC    push        edi
 0042ABAD    mov         edi,ecx
 0042ABAF    mov         esi,edx
 0042ABB1    mov         ebx,eax
 0042ABB3    xor         eax,eax
 0042ABB5    mov         dword ptr [ebp-4],eax
 0042ABB8    test        ebx,ebx
>0042ABBA    je          0042ADA6
 0042ABC0    lea         eax,[ebp-70]
 0042ABC3    push        eax
 0042ABC4    push        54
 0042ABC6    push        ebx
 0042ABC7    call        gdi32.GetObjectA
 0042ABCC    test        eax,eax
>0042ABCE    je          0042ADA6
 0042ABD4    mov         eax,ebx
 0042ABD6    call        DeselectBitmap
 0042ABDB    xor         eax,eax
 0042ABDD    mov         dword ptr [ebp-8],eax
 0042ABE0    xor         eax,eax
 0042ABE2    mov         dword ptr [ebp-10],eax
 0042ABE5    xor         eax,eax
 0042ABE7    push        ebp
 0042ABE8    push        42AD9F
 0042ABED    push        dword ptr fs:[eax]
 0042ABF0    mov         dword ptr fs:[eax],esp
 0042ABF3    push        0
 0042ABF5    call        user32.GetDC
 0042ABFA    call        GDICheck
 0042ABFF    mov         dword ptr [ebp-8],eax
 0042AC02    mov         eax,dword ptr [ebp-8]
 0042AC05    push        eax
 0042AC06    call        gdi32.CreateCompatibleDC
 0042AC0B    call        GDICheck
 0042AC10    mov         dword ptr [ebp-10],eax
 0042AC13    push        0
 0042AC15    push        1
 0042AC17    push        1
 0042AC19    mov         eax,dword ptr [ebp-68]
 0042AC1C    push        eax
 0042AC1D    mov         eax,dword ptr [ebp-6C]
 0042AC20    push        eax
 0042AC21    call        gdi32.CreateBitmap
 0042AC26    mov         dword ptr [ebp-4],eax
 0042AC29    cmp         dword ptr [ebp-4],0
>0042AC2D    je          0042AD71
 0042AC33    mov         eax,dword ptr [ebp-4]
 0042AC36    push        eax
 0042AC37    mov         eax,dword ptr [ebp-10]
 0042AC3A    push        eax
 0042AC3B    call        gdi32.SelectObject
 0042AC40    mov         dword ptr [ebp-1C],eax
 0042AC43    cmp         edi,1FFFFFFF
>0042AC49    jne         0042AC67
 0042AC4B    push        42
 0042AC4D    mov         eax,dword ptr [ebp-68]
 0042AC50    push        eax
 0042AC51    mov         eax,dword ptr [ebp-6C]
 0042AC54    push        eax
 0042AC55    push        0
 0042AC57    push        0
 0042AC59    mov         eax,dword ptr [ebp-10]
 0042AC5C    push        eax
 0042AC5D    call        gdi32.PatBlt
>0042AC62    jmp         0042AD5E
 0042AC67    mov         eax,dword ptr [ebp-8]
 0042AC6A    push        eax
 0042AC6B    call        gdi32.CreateCompatibleDC
 0042AC70    call        GDICheck
 0042AC75    mov         dword ptr [ebp-0C],eax
 0042AC78    xor         eax,eax
 0042AC7A    push        ebp
 0042AC7B    push        42AD57
 0042AC80    push        dword ptr fs:[eax]
 0042AC83    mov         dword ptr fs:[eax],esp
 0042AC86    cmp         dword ptr [ebp-5C],0
>0042AC8A    je          0042ACAA
 0042AC8C    mov         byte ptr [ebp-11],1
 0042AC90    xor         eax,eax
 0042AC92    mov         dword ptr [ebp-58],eax
 0042AC95    lea         eax,[ebp-70]
 0042AC98    push        eax
 0042AC99    push        0
 0042AC9B    mov         ecx,esi
 0042AC9D    mov         edx,esi
 0042AC9F    mov         eax,ebx
 0042ACA1    call        CopyBitmap
 0042ACA6    mov         ebx,eax
>0042ACA8    jmp         0042ACAE
 0042ACAA    mov         byte ptr [ebp-11],0
 0042ACAE    push        ebx
 0042ACAF    mov         eax,dword ptr [ebp-0C]
 0042ACB2    push        eax
 0042ACB3    call        gdi32.SelectObject
 0042ACB8    mov         dword ptr [ebp-18],eax
 0042ACBB    test        esi,esi
>0042ACBD    je          0042ACE9
 0042ACBF    push        0
 0042ACC1    push        esi
 0042ACC2    mov         eax,dword ptr [ebp-0C]
 0042ACC5    push        eax
 0042ACC6    call        gdi32.SelectPalette
 0042ACCB    mov         eax,dword ptr [ebp-0C]
 0042ACCE    push        eax
 0042ACCF    call        gdi32.RealizePalette
 0042ACD4    push        0
 0042ACD6    push        esi
 0042ACD7    mov         eax,dword ptr [ebp-10]
 0042ACDA    push        eax
 0042ACDB    call        gdi32.SelectPalette
 0042ACE0    mov         eax,dword ptr [ebp-10]
 0042ACE3    push        eax
 0042ACE4    call        gdi32.RealizePalette
 0042ACE9    push        edi
 0042ACEA    mov         eax,dword ptr [ebp-0C]
 0042ACED    push        eax
 0042ACEE    call        gdi32.SetBkColor
 0042ACF3    mov         esi,eax
 0042ACF5    push        0CC0020
 0042ACFA    push        0
 0042ACFC    push        0
 0042ACFE    mov         eax,dword ptr [ebp-0C]
 0042AD01    push        eax
 0042AD02    mov         eax,dword ptr [ebp-68]
 0042AD05    push        eax
 0042AD06    mov         eax,dword ptr [ebp-6C]
 0042AD09    push        eax
 0042AD0A    push        0
 0042AD0C    push        0
 0042AD0E    mov         eax,dword ptr [ebp-10]
 0042AD11    push        eax
 0042AD12    call        gdi32.BitBlt
 0042AD17    push        esi
 0042AD18    mov         eax,dword ptr [ebp-0C]
 0042AD1B    push        eax
 0042AD1C    call        gdi32.SetBkColor
 0042AD21    cmp         dword ptr [ebp-18],0
>0042AD25    je          0042AD34
 0042AD27    mov         eax,dword ptr [ebp-18]
 0042AD2A    push        eax
 0042AD2B    mov         eax,dword ptr [ebp-0C]
 0042AD2E    push        eax
 0042AD2F    call        gdi32.SelectObject
 0042AD34    cmp         byte ptr [ebp-11],0
>0042AD38    je          0042AD40
 0042AD3A    push        ebx
 0042AD3B    call        gdi32.DeleteObject
 0042AD40    xor         eax,eax
 0042AD42    pop         edx
 0042AD43    pop         ecx
 0042AD44    pop         ecx
 0042AD45    mov         dword ptr fs:[eax],edx
 0042AD48    push        42AD5E
 0042AD4D    mov         eax,dword ptr [ebp-0C]
 0042AD50    push        eax
 0042AD51    call        gdi32.DeleteDC
 0042AD56    ret
>0042AD57    jmp         @HandleFinally
>0042AD5C    jmp         0042AD4D
 0042AD5E    cmp         dword ptr [ebp-1C],0
>0042AD62    je          0042AD71
 0042AD64    mov         eax,dword ptr [ebp-1C]
 0042AD67    push        eax
 0042AD68    mov         eax,dword ptr [ebp-10]
 0042AD6B    push        eax
 0042AD6C    call        gdi32.SelectObject
 0042AD71    xor         eax,eax
 0042AD73    pop         edx
 0042AD74    pop         ecx
 0042AD75    pop         ecx
 0042AD76    mov         dword ptr fs:[eax],edx
 0042AD79    push        42ADA6
 0042AD7E    cmp         dword ptr [ebp-10],0
>0042AD82    je          0042AD8D
 0042AD84    mov         eax,dword ptr [ebp-10]
 0042AD87    push        eax
 0042AD88    call        gdi32.DeleteDC
 0042AD8D    cmp         dword ptr [ebp-8],0
>0042AD91    je          0042AD9E
 0042AD93    mov         eax,dword ptr [ebp-8]
 0042AD96    push        eax
 0042AD97    push        0
 0042AD99    call        user32.ReleaseDC
 0042AD9E    ret
>0042AD9F    jmp         @HandleFinally
>0042ADA4    jmp         0042AD7E
 0042ADA6    mov         eax,dword ptr [ebp-4]
 0042ADA9    pop         edi
 0042ADAA    pop         esi
 0042ADAB    pop         ebx
 0042ADAC    mov         esp,ebp
 0042ADAE    pop         ebp
 0042ADAF    ret
*}
end;

//0042ADB0
constructor TBitmap.Create;
begin
{*
 0042ADB0    push        ebx
 0042ADB1    push        esi
 0042ADB2    push        edi
 0042ADB3    test        dl,dl
>0042ADB5    je          0042ADBF
 0042ADB7    add         esp,0FFFFFFF0
 0042ADBA    call        @ClassCreate
 0042ADBF    mov         ebx,edx
 0042ADC1    mov         edi,eax
 0042ADC3    xor         edx,edx
 0042ADC5    mov         eax,edi
 0042ADC7    call        TGraphic.Create
 0042ADCC    mov         dword ptr [edi+34],20000000
 0042ADD3    mov         dl,1
 0042ADD5    mov         eax,[00424E58];TBitmapImage
 0042ADDA    call        TObject.Create
 0042ADDF    mov         esi,eax
 0042ADE1    mov         dword ptr [edi+28],esi
 0042ADE4    mov         eax,esi
 0042ADE6    call        TSharedImage.Reference
 0042ADEB    cmp         byte ptr ds:[5AC578],0
>0042ADF2    je          0042ADFD
 0042ADF4    mov         dl,1
 0042ADF6    mov         eax,edi
 0042ADF8    mov         ecx,dword ptr [eax]
 0042ADFA    call        dword ptr [ecx+6C]
 0042ADFD    mov         eax,edi
 0042ADFF    test        bl,bl
>0042AE01    je          0042AE12
 0042AE03    call        @AfterConstruction
 0042AE08    pop         dword ptr fs:[0]
 0042AE0F    add         esp,0C
 0042AE12    mov         eax,edi
 0042AE14    pop         edi
 0042AE15    pop         esi
 0042AE16    pop         ebx
 0042AE17    ret
*}
end;

//0042AE18
destructor TBitmap.Destroy;
begin
{*
 0042AE18    push        ebx
 0042AE19    push        esi
 0042AE1A    call        @BeforeDestruction
 0042AE1F    mov         ebx,edx
 0042AE21    mov         esi,eax
 0042AE23    mov         eax,esi
 0042AE25    call        TBitmap.FreeContext
 0042AE2A    mov         eax,dword ptr [esi+28];TBitmap.FImage:TBitmapImage
 0042AE2D    call        TSharedImage.Release
 0042AE32    mov         eax,dword ptr [esi+2C];TBitmap.FCanvas:TCanvas
 0042AE35    call        TObject.Free
 0042AE3A    mov         edx,ebx
 0042AE3C    and         dl,0FC
 0042AE3F    mov         eax,esi
 0042AE41    call        TMemoryStream.Destroy
 0042AE46    test        bl,bl
>0042AE48    jle         0042AE51
 0042AE4A    mov         eax,esi
 0042AE4C    call        @ClassDestroy
 0042AE51    pop         esi
 0042AE52    pop         ebx
 0042AE53    ret
*}
end;

//0042AE54
procedure TBitmap.Assign(Source:TPersistent);
begin
{*
 0042AE54    push        ebp
 0042AE55    mov         ebp,esp
 0042AE57    add         esp,0FFFFFFA8
 0042AE5A    push        ebx
 0042AE5B    push        esi
 0042AE5C    mov         ebx,edx
 0042AE5E    mov         dword ptr [ebp-4],eax
 0042AE61    test        ebx,ebx
>0042AE63    je          0042AE7A
 0042AE65    mov         eax,ebx
 0042AE67    mov         edx,dword ptr ds:[424EB8];TBitmap
 0042AE6D    call        @IsClass
 0042AE72    test        al,al
>0042AE74    je          0042AF33
 0042AE7A    push        5E0978;BitmapImageLock:TRTLCriticalSection
 0042AE7F    call        KERNEL32.EnterCriticalSection
 0042AE84    xor         eax,eax
 0042AE86    push        ebp
 0042AE87    push        42AF0C
 0042AE8C    push        dword ptr fs:[eax]
 0042AE8F    mov         dword ptr fs:[eax],esp
 0042AE92    test        ebx,ebx
>0042AE94    je          0042AED1
 0042AE96    mov         esi,ebx
 0042AE98    mov         eax,dword ptr [esi+28]
 0042AE9B    call        TSharedImage.Reference
 0042AEA0    mov         eax,dword ptr [ebp-4]
 0042AEA3    mov         eax,dword ptr [eax+28]
 0042AEA6    call        TSharedImage.Release
 0042AEAB    mov         eax,dword ptr [esi+28]
 0042AEAE    mov         edx,dword ptr [ebp-4]
 0042AEB1    mov         dword ptr [edx+28],eax
 0042AEB4    mov         al,byte ptr [esi+21]
 0042AEB7    mov         edx,dword ptr [ebp-4]
 0042AEBA    mov         byte ptr [edx+21],al
 0042AEBD    mov         eax,dword ptr [esi+34]
 0042AEC0    mov         edx,dword ptr [ebp-4]
 0042AEC3    mov         dword ptr [edx+34],eax
 0042AEC6    mov         al,byte ptr [esi+38]
 0042AEC9    mov         edx,dword ptr [ebp-4]
 0042AECC    mov         byte ptr [edx+38],al
>0042AECF    jmp         0042AEF4
 0042AED1    lea         eax,[ebp-58]
 0042AED4    xor         ecx,ecx
 0042AED6    mov         edx,54
 0042AEDB    call        @FillChar
 0042AEE0    lea         eax,[ebp-58]
 0042AEE3    push        eax
 0042AEE4    push        0
 0042AEE6    push        0
 0042AEE8    xor         ecx,ecx
 0042AEEA    xor         edx,edx
 0042AEEC    mov         eax,dword ptr [ebp-4]
 0042AEEF    call        TBitmap.NewImage
 0042AEF4    xor         eax,eax
 0042AEF6    pop         edx
 0042AEF7    pop         ecx
 0042AEF8    pop         ecx
 0042AEF9    mov         dword ptr fs:[eax],edx
 0042AEFC    push        42AF13
 0042AF01    push        5E0978;BitmapImageLock:TRTLCriticalSection
 0042AF06    call        KERNEL32.LeaveCriticalSection
 0042AF0B    ret
>0042AF0C    jmp         @HandleFinally
>0042AF11    jmp         0042AF01
 0042AF13    mov         eax,dword ptr [ebp-4]
 0042AF16    mov         edx,dword ptr [eax]
 0042AF18    call        dword ptr [edx+24]
 0042AF1B    test        eax,eax
 0042AF1D    setne       al
 0042AF20    mov         edx,dword ptr [ebp-4]
 0042AF23    mov         byte ptr [edx+22],al
 0042AF26    mov         edx,dword ptr [ebp-4]
 0042AF29    mov         eax,dword ptr [ebp-4]
 0042AF2C    mov         ecx,dword ptr [eax]
 0042AF2E    call        dword ptr [ecx+10]
>0042AF31    jmp         0042AF3D
 0042AF33    mov         edx,ebx
 0042AF35    mov         eax,dword ptr [ebp-4]
 0042AF38    call        TPersistent.Assign
 0042AF3D    pop         esi
 0042AF3E    pop         ebx
 0042AF3F    mov         esp,ebp
 0042AF41    pop         ebp
 0042AF42    ret
*}
end;

//0042AF44
procedure TBitmap.CopyImage(AHandle:HBITMAP; APalette:HPALETTE; DIB:TDIBSection);
begin
{*
 0042AF44    push        ebp
 0042AF45    mov         ebp,esp
 0042AF47    add         esp,0FFFFFFA4
 0042AF4A    push        ebx
 0042AF4B    push        esi
 0042AF4C    push        edi
 0042AF4D    mov         esi,dword ptr [ebp+8]
 0042AF50    lea         edi,[ebp-5C]
 0042AF53    push        ecx
 0042AF54    mov         ecx,15
 0042AF59    rep movs    dword ptr [edi],dword ptr [esi]
 0042AF5B    pop         ecx
 0042AF5C    mov         esi,ecx
 0042AF5E    mov         edi,edx
 0042AF60    mov         ebx,eax
 0042AF62    mov         eax,ebx
 0042AF64    call        TBitmap.FreeContext
 0042AF69    xor         eax,eax
 0042AF6B    mov         dword ptr [ebp-4],eax
 0042AF6E    xor         eax,eax
 0042AF70    mov         dword ptr [ebp-8],eax
 0042AF73    xor         eax,eax
 0042AF75    push        ebp
 0042AF76    push        42AFD3
 0042AF7B    push        dword ptr fs:[eax]
 0042AF7E    mov         dword ptr fs:[eax],esp
 0042AF81    cmp         esi,dword ptr ds:[5E095C];SystemPalette16:HPALETTE
>0042AF87    jne         0042AF8E
 0042AF89    mov         dword ptr [ebp-8],esi
>0042AF8C    jmp         0042AF98
 0042AF8E    mov         eax,esi
 0042AF90    call        CopyPalette
 0042AF95    mov         dword ptr [ebp-8],eax
 0042AF98    lea         eax,[ebp-5C]
 0042AF9B    push        eax
 0042AF9C    mov         eax,dword ptr [ebx+2C]
 0042AF9F    push        eax
 0042AFA0    mov         ecx,dword ptr [ebp-8]
 0042AFA3    mov         edx,esi
 0042AFA5    mov         eax,edi
 0042AFA7    call        CopyBitmap
 0042AFAC    mov         dword ptr [ebp-4],eax
 0042AFAF    lea         eax,[ebp-5C]
 0042AFB2    push        eax
 0042AFB3    mov         eax,dword ptr [ebx+28]
 0042AFB6    mov         al,byte ptr [eax+70]
 0042AFB9    push        eax
 0042AFBA    push        0
 0042AFBC    mov         ecx,dword ptr [ebp-8]
 0042AFBF    mov         edx,dword ptr [ebp-4]
 0042AFC2    mov         eax,ebx
 0042AFC4    call        TBitmap.NewImage
 0042AFC9    xor         eax,eax
 0042AFCB    pop         edx
 0042AFCC    pop         ecx
 0042AFCD    pop         ecx
 0042AFCE    mov         dword ptr fs:[eax],edx
>0042AFD1    jmp         0042AFF9
>0042AFD3    jmp         @HandleAnyException
 0042AFD8    mov         eax,dword ptr [ebp-8]
 0042AFDB    call        InternalDeletePalette
 0042AFE0    cmp         dword ptr [ebp-4],0
>0042AFE4    je          0042AFEF
 0042AFE6    mov         eax,dword ptr [ebp-4]
 0042AFE9    push        eax
 0042AFEA    call        gdi32.DeleteObject
 0042AFEF    call        @RaiseAgain
 0042AFF4    call        @DoneExcept
 0042AFF9    pop         edi
 0042AFFA    pop         esi
 0042AFFB    pop         ebx
 0042AFFC    mov         esp,ebp
 0042AFFE    pop         ebp
 0042AFFF    ret         4
*}
end;

//0042B004
procedure TBitmap.Changing(Sender:TObject);
begin
{*
 0042B004    push        ebx
 0042B005    mov         ebx,eax
 0042B007    mov         eax,ebx
 0042B009    call        TBitmap.FreeImage
 0042B00E    mov         eax,dword ptr [ebx+28]
 0042B011    xor         edx,edx
 0042B013    mov         dword ptr [eax+50],edx
 0042B016    xor         edx,edx
 0042B018    mov         dword ptr [eax+54],edx
 0042B01B    add         eax,6C
 0042B01E    call        FreeAndNil
 0042B023    pop         ebx
 0042B024    ret
*}
end;

//0042B028
procedure TBitmap.Changed(Sender:TObject);
begin
{*
 0042B028    mov         byte ptr [eax+31],0
 0042B02C    call        TGraphic.Changed
 0042B031    ret
*}
end;

//0042B034
procedure TBitmap.Dormant;
begin
{*
 0042B034    push        ebx
 0042B035    push        esi
 0042B036    push        edi
 0042B037    add         esp,0FFFFFFAC
 0042B03A    mov         ebx,eax
 0042B03C    mov         dl,1
 0042B03E    mov         eax,[00418640];TMemoryStream
 0042B043    call        TObject.Create
 0042B048    mov         esi,eax
 0042B04A    mov         edx,esi
 0042B04C    mov         eax,ebx
 0042B04E    mov         ecx,dword ptr [eax]
 0042B050    call        dword ptr [ecx+58]
 0042B053    mov         eax,esi
 0042B055    mov         edx,dword ptr [eax]
 0042B057    call        dword ptr [edx]
 0042B059    push        edx
 0042B05A    push        eax
 0042B05B    mov         eax,esi
 0042B05D    call        TStream.SetSize64
 0042B062    mov         eax,dword ptr [ebx+28]
 0042B065    push        esi
 0042B066    lea         esi,[eax+18]
 0042B069    lea         edi,[esp+4]
 0042B06D    mov         ecx,15
 0042B072    rep movs    dword ptr [edi],dword ptr [esi]
 0042B074    pop         esi
 0042B075    xor         eax,eax
 0042B077    mov         dword ptr [esp+14],eax
 0042B07B    mov         eax,ebx
 0042B07D    call        TBitmap.FreeContext
 0042B082    lea         eax,[ebx+2C]
 0042B085    call        FreeAndNil
 0042B08A    push        esp
 0042B08B    mov         eax,dword ptr [ebx+28]
 0042B08E    mov         al,byte ptr [eax+70]
 0042B091    push        eax
 0042B092    push        esi
 0042B093    xor         ecx,ecx
 0042B095    xor         edx,edx
 0042B097    mov         eax,ebx
 0042B099    call        TBitmap.NewImage
 0042B09E    add         esp,54
 0042B0A1    pop         edi
 0042B0A2    pop         esi
 0042B0A3    pop         ebx
 0042B0A4    ret
*}
end;

//0042B0A8
procedure TBitmap.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 0042B0A8    push        ebp
 0042B0A9    mov         ebp,esp
 0042B0AB    add         esp,0FFFFFFE4
 0042B0AE    push        ebx
 0042B0AF    push        esi
 0042B0B0    push        edi
 0042B0B1    mov         edi,ecx
 0042B0B3    mov         dword ptr [ebp-4],edx
 0042B0B6    mov         ebx,eax
 0042B0B8    mov         esi,dword ptr [ebx+28]
 0042B0BB    mov         dl,byte ptr ds:[42B2F4]
 0042B0C1    mov         eax,dword ptr [ebp-4]
 0042B0C4    call        TCanvas.RequiredState
 0042B0C9    mov         eax,ebx
 0042B0CB    call        TBitmap.PaletteNeeded
 0042B0D0    xor         eax,eax
 0042B0D2    mov         dword ptr [ebp-8],eax
 0042B0D5    mov         byte ptr [ebp-9],0
 0042B0D9    mov         eax,dword ptr [esi+10]
 0042B0DC    test        eax,eax
>0042B0DE    je          0042B102
 0042B0E0    push        0FF
 0042B0E2    push        eax
 0042B0E3    mov         eax,dword ptr [ebp-4]
 0042B0E6    mov         eax,dword ptr [eax+4]
 0042B0E9    push        eax
 0042B0EA    call        gdi32.SelectPalette
 0042B0EF    mov         dword ptr [ebp-8],eax
 0042B0F2    mov         eax,dword ptr [ebp-4]
 0042B0F5    mov         eax,dword ptr [eax+4]
 0042B0F8    push        eax
 0042B0F9    call        gdi32.RealizePalette
 0042B0FE    mov         byte ptr [ebp-9],1
 0042B102    push        0C
 0042B104    mov         eax,dword ptr [ebp-4]
 0042B107    mov         eax,dword ptr [eax+4]
 0042B10A    push        eax
 0042B10B    call        gdi32.GetDeviceCaps
 0042B110    push        eax
 0042B111    push        0E
 0042B113    mov         eax,dword ptr [ebp-4]
 0042B116    mov         eax,dword ptr [eax+4]
 0042B119    push        eax
 0042B11A    call        gdi32.GetDeviceCaps
 0042B11F    mov         edx,eax
 0042B121    pop         eax
 0042B122    imul        edx
 0042B124    cmp         eax,8
>0042B127    jg          0042B138
 0042B129    movzx       edx,word ptr [esi+2A]
 0042B12D    movzx       ecx,word ptr [esi+28]
 0042B131    imul        edx,ecx
 0042B134    cmp         eax,edx
>0042B136    jl          0042B13C
 0042B138    xor         eax,eax
>0042B13A    jmp         0042B13E
 0042B13C    mov         al,1
 0042B13E    test        al,al
>0042B140    je          0042B17A
 0042B142    lea         eax,[ebp-11]
 0042B145    push        eax
 0042B146    mov         eax,dword ptr [ebp-4]
 0042B149    mov         eax,dword ptr [eax+4]
 0042B14C    push        eax
 0042B14D    call        gdi32.GetBrushOrgEx
 0042B152    push        4
 0042B154    mov         eax,dword ptr [ebp-4]
 0042B157    mov         eax,dword ptr [eax+4]
 0042B15A    push        eax
 0042B15B    call        gdi32.SetStretchBltMode
 0042B160    lea         eax,[ebp-11]
 0042B163    push        eax
 0042B164    mov         eax,dword ptr [ebp-0D]
 0042B167    push        eax
 0042B168    mov         eax,dword ptr [ebp-11]
 0042B16B    push        eax
 0042B16C    mov         eax,dword ptr [ebp-4]
 0042B16F    mov         eax,dword ptr [eax+4]
 0042B172    push        eax
 0042B173    call        gdi32.SetBrushOrgEx
>0042B178    jmp         0042B195
 0042B17A    mov         eax,ebx
 0042B17C    call        TBitmap.GetMonochrome
 0042B181    test        al,al
>0042B183    jne         0042B195
 0042B185    push        3
 0042B187    mov         eax,dword ptr [ebp-4]
 0042B18A    call        TCanvas.GetHandle
 0042B18F    push        eax
 0042B190    call        gdi32.SetStretchBltMode
 0042B195    xor         eax,eax
 0042B197    push        ebp
 0042B198    push        42B2E4
 0042B19D    push        dword ptr fs:[eax]
 0042B1A0    mov         dword ptr fs:[eax],esp
 0042B1A3    mov         eax,ebx
 0042B1A5    mov         edx,dword ptr [eax]
 0042B1A7    call        dword ptr [edx+28]
 0042B1AA    test        al,al
>0042B1AC    je          0042B1B5
 0042B1AE    mov         eax,ebx
 0042B1B0    call        TBitmap.MaskHandleNeeded
 0042B1B5    mov         eax,ebx
 0042B1B7    call        TBitmap.GetCanvas
 0042B1BC    mov         dl,byte ptr ds:[42B2F4]
 0042B1C2    call        TCanvas.RequiredState
 0042B1C7    mov         eax,ebx
 0042B1C9    mov         edx,dword ptr [eax]
 0042B1CB    call        dword ptr [edx+28]
 0042B1CE    test        al,al
>0042B1D0    je          0042B280
 0042B1D6    xor         eax,eax
 0042B1D8    mov         dword ptr [ebp-1C],eax
 0042B1DB    xor         eax,eax
 0042B1DD    mov         dword ptr [ebp-18],eax
 0042B1E0    xor         eax,eax
 0042B1E2    push        ebp
 0042B1E3    push        42B279
 0042B1E8    push        dword ptr fs:[eax]
 0042B1EB    mov         dword ptr fs:[eax],esp
 0042B1EE    push        0
 0042B1F0    call        gdi32.CreateCompatibleDC
 0042B1F5    call        GDICheck
 0042B1FA    mov         dword ptr [ebp-18],eax
 0042B1FD    mov         eax,dword ptr [esi+0C]
 0042B200    push        eax
 0042B201    mov         eax,dword ptr [ebp-18]
 0042B204    push        eax
 0042B205    call        gdi32.SelectObject
 0042B20A    mov         dword ptr [ebp-1C],eax
 0042B20D    mov         eax,dword ptr [edi+8]
 0042B210    sub         eax,dword ptr [edi]
 0042B212    push        eax
 0042B213    mov         eax,dword ptr [edi+0C]
 0042B216    sub         eax,dword ptr [edi+4]
 0042B219    push        eax
 0042B21A    mov         eax,ebx
 0042B21C    call        TBitmap.GetCanvas
 0042B221    mov         eax,dword ptr [eax+4]
 0042B224    push        eax
 0042B225    push        0
 0042B227    push        0
 0042B229    mov         eax,dword ptr [esi+1C]
 0042B22C    push        eax
 0042B22D    mov         eax,dword ptr [esi+20]
 0042B230    push        eax
 0042B231    mov         eax,dword ptr [ebp-18]
 0042B234    push        eax
 0042B235    push        0
 0042B237    push        0
 0042B239    mov         ecx,dword ptr [edi+4]
 0042B23C    mov         edx,dword ptr [edi]
 0042B23E    mov         eax,dword ptr [ebp-4]
 0042B241    mov         eax,dword ptr [eax+4]
 0042B244    call        TransparentStretchBlt
 0042B249    xor         eax,eax
 0042B24B    pop         edx
 0042B24C    pop         ecx
 0042B24D    pop         ecx
 0042B24E    mov         dword ptr fs:[eax],edx
 0042B251    push        42B2BE
 0042B256    cmp         dword ptr [ebp-1C],0
>0042B25A    je          0042B269
 0042B25C    mov         eax,dword ptr [ebp-1C]
 0042B25F    push        eax
 0042B260    mov         eax,dword ptr [ebp-18]
 0042B263    push        eax
 0042B264    call        gdi32.SelectObject
 0042B269    cmp         dword ptr [ebp-18],0
>0042B26D    je          0042B278
 0042B26F    mov         eax,dword ptr [ebp-18]
 0042B272    push        eax
 0042B273    call        gdi32.DeleteDC
 0042B278    ret
>0042B279    jmp         @HandleFinally
>0042B27E    jmp         0042B256
 0042B280    mov         eax,dword ptr [ebp-4]
 0042B283    mov         eax,dword ptr [eax+20]
 0042B286    push        eax
 0042B287    mov         eax,dword ptr [esi+20]
 0042B28A    push        eax
 0042B28B    mov         eax,dword ptr [esi+1C]
 0042B28E    push        eax
 0042B28F    push        0
 0042B291    push        0
 0042B293    mov         eax,ebx
 0042B295    call        TBitmap.GetCanvas
 0042B29A    mov         eax,dword ptr [eax+4]
 0042B29D    push        eax
 0042B29E    mov         eax,dword ptr [edi+0C]
 0042B2A1    sub         eax,dword ptr [edi+4]
 0042B2A4    push        eax
 0042B2A5    mov         eax,dword ptr [edi+8]
 0042B2A8    sub         eax,dword ptr [edi]
 0042B2AA    push        eax
 0042B2AB    mov         eax,dword ptr [edi+4]
 0042B2AE    push        eax
 0042B2AF    mov         eax,dword ptr [edi]
 0042B2B1    push        eax
 0042B2B2    mov         eax,dword ptr [ebp-4]
 0042B2B5    mov         eax,dword ptr [eax+4]
 0042B2B8    push        eax
 0042B2B9    call        gdi32.StretchBlt
 0042B2BE    xor         eax,eax
 0042B2C0    pop         edx
 0042B2C1    pop         ecx
 0042B2C2    pop         ecx
 0042B2C3    mov         dword ptr fs:[eax],edx
 0042B2C6    push        42B2EB
 0042B2CB    cmp         byte ptr [ebp-9],0
>0042B2CF    je          0042B2E3
 0042B2D1    push        0FF
 0042B2D3    mov         eax,dword ptr [ebp-8]
 0042B2D6    push        eax
 0042B2D7    mov         eax,dword ptr [ebp-4]
 0042B2DA    mov         eax,dword ptr [eax+4]
 0042B2DD    push        eax
 0042B2DE    call        gdi32.SelectPalette
 0042B2E3    ret
>0042B2E4    jmp         @HandleFinally
>0042B2E9    jmp         0042B2CB
 0042B2EB    pop         edi
 0042B2EC    pop         esi
 0042B2ED    pop         ebx
 0042B2EE    mov         esp,ebp
 0042B2F0    pop         ebp
 0042B2F1    ret
*}
end;

//0042B2F8
procedure TBitmap.FreeImage;
begin
{*
 0042B2F8    push        ebx
 0042B2F9    push        esi
 0042B2FA    mov         esi,eax
 0042B2FC    mov         ebx,dword ptr [esi+28]
 0042B2FF    cmp         dword ptr [ebx+4],1
>0042B303    jle         0042B32C
 0042B305    mov         eax,esi
 0042B307    call        TBitmap.HandleNeeded
 0042B30C    cmp         byte ptr [ebx+71],0
>0042B310    je          0042B316
 0042B312    xor         eax,eax
>0042B314    jmp         0042B319
 0042B316    mov         eax,dword ptr [ebx+10]
 0042B319    lea         edx,[ebx+18]
 0042B31C    push        edx
 0042B31D    mov         ecx,eax
 0042B31F    mov         edx,dword ptr [ebx+8]
 0042B322    mov         eax,esi
 0042B324    call        TBitmap.CopyImage
 0042B329    pop         esi
 0042B32A    pop         ebx
 0042B32B    ret
 0042B32C    mov         eax,dword ptr [ebx+8]
 0042B32F    test        eax,eax
>0042B331    je          0042B358
 0042B333    cmp         eax,dword ptr [ebx+14]
>0042B336    je          0042B358
 0042B338    mov         esi,dword ptr [ebx+14]
 0042B33B    test        esi,esi
>0042B33D    je          0042B34E
 0042B33F    push        esi
 0042B340    call        gdi32.DeleteObject
 0042B345    test        eax,eax
>0042B347    jne         0042B34E
 0042B349    call        GDIError
 0042B34E    xor         eax,eax
 0042B350    mov         dword ptr [ebx+14],eax
 0042B353    xor         eax,eax
 0042B355    mov         dword ptr [ebx+2C],eax
 0042B358    pop         esi
 0042B359    pop         ebx
 0042B35A    ret
*}
end;

//0042B35C
function TBitmap.GetEmpty:Boolean;
begin
{*
 0042B35C    mov         eax,dword ptr [eax+28]
 0042B35F    cmp         dword ptr [eax+8],0
>0042B363    jne         0042B371
 0042B365    cmp         dword ptr [eax+14],0
>0042B369    jne         0042B371
 0042B36B    cmp         dword ptr [eax+6C],0
>0042B36F    je          0042B374
 0042B371    xor         eax,eax
 0042B373    ret
 0042B374    mov         al,1
 0042B376    ret
*}
end;

//0042B378
function TBitmap.GetCanvas:TCanvas;
begin
{*
 0042B378    push        ebx
 0042B379    push        esi
 0042B37A    mov         ebx,eax
 0042B37C    cmp         dword ptr [ebx+2C],0
>0042B380    jne         0042B3B7
 0042B382    mov         eax,ebx
 0042B384    call        TBitmap.HandleNeeded
 0042B389    cmp         dword ptr [ebx+2C],0
>0042B38D    jne         0042B3B7
 0042B38F    mov         ecx,ebx
 0042B391    mov         dl,1
 0042B393    mov         eax,[00429F50];TBitmapCanvas
 0042B398    call        TBitmapCanvas.Create
 0042B39D    mov         esi,eax
 0042B39F    mov         dword ptr [ebx+2C],esi
 0042B3A2    mov         dword ptr [esi+2C],ebx
 0042B3A5    mov         eax,dword ptr [ebx]
 0042B3A7    mov         eax,dword ptr [eax+10]
 0042B3AA    mov         dword ptr [esi+28],eax
 0042B3AD    mov         dword ptr [esi+34],ebx
 0042B3B0    mov         dword ptr [esi+30],42B004;TBitmap.Changing
 0042B3B7    mov         eax,dword ptr [ebx+2C]
 0042B3BA    pop         esi
 0042B3BB    pop         ebx
 0042B3BC    ret
*}
end;

//0042B3C0
function TBitmap.GetHandle:HBITMAP;
begin
{*
 0042B3C0    push        ebx
 0042B3C1    mov         ebx,eax
 0042B3C3    mov         eax,ebx
 0042B3C5    call        TBitmap.FreeContext
 0042B3CA    mov         eax,ebx
 0042B3CC    call        TBitmap.HandleNeeded
 0042B3D1    mov         edx,ebx
 0042B3D3    mov         eax,ebx
 0042B3D5    call        TBitmap.Changing
 0042B3DA    mov         eax,dword ptr [ebx+28]
 0042B3DD    mov         eax,dword ptr [eax+8]
 0042B3E0    pop         ebx
 0042B3E1    ret
*}
end;

//0042B3E4
function TBitmap.GetHandleType:TBitmapHandleType;
begin
{*
 0042B3E4    mov         eax,dword ptr [eax+28]
 0042B3E7    mov         edx,dword ptr [eax+8]
 0042B3EA    test        edx,edx
>0042B3EC    je          0042B3F3
 0042B3EE    cmp         edx,dword ptr [eax+14]
>0042B3F1    jne         0042B40A
 0042B3F3    cmp         dword ptr [eax+14],0
>0042B3F7    jne         0042B407
 0042B3F9    cmp         dword ptr [eax+30],0
>0042B3FD    jne         0042B403
 0042B3FF    mov         al,1
>0042B401    jmp         0042B40C
 0042B403    xor         eax,eax
>0042B405    jmp         0042B40C
 0042B407    xor         eax,eax
 0042B409    ret
 0042B40A    mov         al,1
 0042B40C    ret
*}
end;

//0042B410
function TBitmap.GetHeight:Integer;
begin
{*
 0042B410    mov         ecx,eax
 0042B412    mov         eax,dword ptr [ecx+28]
 0042B415    mov         eax,dword ptr [eax+20]
 0042B418    cdq
 0042B419    xor         eax,edx
 0042B41B    sub         eax,edx
 0042B41D    ret
*}
end;

//0042B420
function TBitmap.GetMaskHandle:HBITMAP;
begin
{*
 0042B420    push        ebx
 0042B421    mov         ebx,eax
 0042B423    mov         eax,ebx
 0042B425    call        TBitmap.MaskHandleNeeded
 0042B42A    mov         eax,dword ptr [ebx+28]
 0042B42D    mov         eax,dword ptr [eax+0C]
 0042B430    pop         ebx
 0042B431    ret
*}
end;

//0042B434
function TBitmap.GetMonochrome:Boolean;
begin
{*
 0042B434    mov         eax,dword ptr [eax+28]
 0042B437    add         eax,18
 0042B43A    cmp         word ptr [eax+10],1
>0042B43F    jne         0042B448
 0042B441    cmp         word ptr [eax+12],1
>0042B446    je          0042B44B
 0042B448    xor         eax,eax
 0042B44A    ret
 0042B44B    mov         al,1
 0042B44D    ret
*}
end;

//0042B450
function TBitmap.GetPalette:HPALETTE;
begin
{*
 0042B450    push        ebx
 0042B451    mov         ebx,eax
 0042B453    mov         eax,ebx
 0042B455    call        TBitmap.PaletteNeeded
 0042B45A    mov         eax,dword ptr [ebx+28]
 0042B45D    mov         eax,dword ptr [eax+10]
 0042B460    pop         ebx
 0042B461    ret
*}
end;

//0042B464
function TBitmap.GetPixelFormat:TPixelFormat;
begin
{*
 0042B464    push        ebx
 0042B465    push        esi
 0042B466    mov         esi,eax
 0042B468    mov         bl,8
 0042B46A    mov         eax,esi
 0042B46C    call        TBitmap.GetHandleType
 0042B471    cmp         al,1
>0042B473    jne         0042B479
 0042B475    xor         ebx,ebx
>0042B477    jmp         0042B4E0
 0042B479    mov         eax,dword ptr [esi+28]
 0042B47C    lea         edx,[eax+18]
 0042B47F    lea         eax,[edx+18]
 0042B482    movzx       ecx,word ptr [eax+0E]
 0042B486    cmp         ecx,10
>0042B489    jg          0042B49C
>0042B48B    je          0042B4B4
 0042B48D    dec         ecx
>0042B48E    je          0042B4A8
 0042B490    sub         ecx,3
>0042B493    je          0042B4AC
 0042B495    sub         ecx,4
>0042B498    je          0042B4B0
>0042B49A    jmp         0042B4E0
 0042B49C    sub         ecx,18
>0042B49F    je          0042B4D4
 0042B4A1    sub         ecx,8
>0042B4A4    je          0042B4D8
>0042B4A6    jmp         0042B4E0
 0042B4A8    mov         bl,1
>0042B4AA    jmp         0042B4E0
 0042B4AC    mov         bl,2
>0042B4AE    jmp         0042B4E0
 0042B4B0    mov         bl,3
>0042B4B2    jmp         0042B4E0
 0042B4B4    mov         eax,dword ptr [eax+10]
 0042B4B7    sub         eax,1
>0042B4BA    jb          0042B4C3
 0042B4BC    sub         eax,2
>0042B4BF    je          0042B4C7
>0042B4C1    jmp         0042B4E0
 0042B4C3    mov         bl,4
>0042B4C5    jmp         0042B4E0
 0042B4C7    cmp         dword ptr [edx+44],7E0
>0042B4CE    jne         0042B4E0
 0042B4D0    mov         bl,5
>0042B4D2    jmp         0042B4E0
 0042B4D4    mov         bl,6
>0042B4D6    jmp         0042B4E0
 0042B4D8    cmp         dword ptr [eax+10],0
>0042B4DC    jne         0042B4E0
 0042B4DE    mov         bl,7
 0042B4E0    mov         eax,ebx
 0042B4E2    pop         esi
 0042B4E3    pop         ebx
 0042B4E4    ret
*}
end;

//0042B4E8
function TBitmap.GetScanline(Row:Integer):Pointer;
begin
{*
 0042B4E8    push        ebx
 0042B4E9    push        esi
 0042B4EA    push        edi
 0042B4EB    push        ebp
 0042B4EC    mov         edi,edx
 0042B4EE    mov         ebx,eax
 0042B4F0    mov         edx,ebx
 0042B4F2    mov         eax,ebx
 0042B4F4    call        TBitmap.Changing
 0042B4F9    mov         eax,dword ptr [ebx+28]
 0042B4FC    add         eax,18
 0042B4FF    mov         ebp,eax
 0042B501    lea         esi,[eax+18]
 0042B504    test        edi,edi
>0042B506    jl          0042B50D
 0042B508    cmp         edi,dword ptr [ebp+8]
>0042B50B    jl          0042B517
 0042B50D    mov         eax,[005AE660];^SScanLine:TResStringRec
 0042B512    call        InvalidOperation
 0042B517    mov         eax,ebx
 0042B519    call        TBitmap.DIBNeeded
 0042B51E    call        gdi32.GdiFlush
 0042B523    mov         eax,dword ptr [esi+8]
 0042B526    test        eax,eax
>0042B528    jle         0042B52F
 0042B52A    sub         eax,edi
 0042B52C    dec         eax
 0042B52D    mov         edi,eax
 0042B52F    movzx       edx,word ptr [esi+0E]
 0042B533    mov         ecx,20
 0042B538    mov         eax,dword ptr [esi+4]
 0042B53B    call        BytesPerScanline
 0042B540    imul        edi
 0042B542    add         eax,dword ptr [ebp+14]
 0042B545    mov         ebx,eax
 0042B547    mov         eax,ebx
 0042B549    pop         ebp
 0042B54A    pop         edi
 0042B54B    pop         esi
 0042B54C    pop         ebx
 0042B54D    ret
*}
end;

//0042B550
function TBitmap.GetTransparentColor:TColor;
begin
{*
 0042B550    push        ebx
 0042B551    mov         ebx,eax
 0042B553    mov         eax,dword ptr [ebx+34]
 0042B556    cmp         eax,20000000
>0042B55B    jne         0042B589
 0042B55D    mov         eax,ebx
 0042B55F    call        TBitmap.GetMonochrome
 0042B564    test        al,al
>0042B566    je          0042B56F
 0042B568    mov         eax,0FFFFFF
>0042B56D    jmp         0042B58E
 0042B56F    mov         eax,ebx
 0042B571    mov         edx,dword ptr [eax]
 0042B573    call        dword ptr [edx+20]
 0042B576    dec         eax
 0042B577    push        eax
 0042B578    mov         eax,ebx
 0042B57A    call        TBitmap.GetCanvas
 0042B57F    xor         edx,edx
 0042B581    pop         ecx
 0042B582    call        TCanvas.GetPixel
>0042B587    jmp         0042B58E
 0042B589    call        ColorToRGB
 0042B58E    or          eax,2000000
 0042B593    pop         ebx
 0042B594    ret
*}
end;

//0042B598
{*function TBitmap.GetWidth:?;
begin
 0042B598    mov         eax,dword ptr [eax+28];TBitmap.FImage:TBitmapImage
 0042B59B    mov         eax,dword ptr [eax+1C]
 0042B59E    ret
end;*}

//0042B5A0
procedure TBitmap.DIBNeeded;
begin
{*
 0042B5A0    push        ebx
 0042B5A1    push        esi
 0042B5A2    mov         ebx,dword ptr [eax+28]
 0042B5A5    cmp         dword ptr [ebx+8],0
>0042B5A9    je          0042B610
 0042B5AB    cmp         dword ptr [ebx+14],0
>0042B5AF    jne         0042B610
 0042B5B1    call        TBitmap.PaletteNeeded
 0042B5B6    cmp         dword ptr [ebx+30],0
>0042B5BA    jne         0042B5F8
 0042B5BC    lea         eax,[ebx+18]
 0042B5BF    push        eax
 0042B5C0    push        54
 0042B5C2    mov         eax,dword ptr [ebx+8]
 0042B5C5    push        eax
 0042B5C6    call        gdi32.GetObjectA
 0042B5CB    lea         eax,[ebx+18]
 0042B5CE    mov         edx,eax
 0042B5D0    add         eax,18
 0042B5D3    mov         dword ptr [eax],28
 0042B5D9    mov         ecx,dword ptr [edx+4]
 0042B5DC    mov         dword ptr [eax+4],ecx
 0042B5DF    mov         ecx,dword ptr [edx+8]
 0042B5E2    mov         dword ptr [eax+8],ecx
 0042B5E5    mov         word ptr [eax+0C],1
 0042B5EB    mov         cx,word ptr [edx+10]
 0042B5EF    imul        cx,word ptr [edx+12]
 0042B5F4    mov         word ptr [eax+0E],cx
 0042B5F8    lea         eax,[ebx+18]
 0042B5FB    push        eax
 0042B5FC    push        0
 0042B5FE    mov         esi,dword ptr [ebx+10]
 0042B601    mov         ecx,esi
 0042B603    mov         edx,esi
 0042B605    mov         eax,dword ptr [ebx+8]
 0042B608    call        CopyBitmap
 0042B60D    mov         dword ptr [ebx+14],eax
 0042B610    pop         esi
 0042B611    pop         ebx
 0042B612    ret
*}
end;

//0042B614
procedure TBitmap.FreeContext;
begin
{*
 0042B614    mov         edx,dword ptr [eax+2C]
 0042B617    test        edx,edx
>0042B619    je          0042B622
 0042B61B    mov         eax,edx
 0042B61D    call        TBitmapCanvas.FreeContext
 0042B622    ret
*}
end;

//0042B624
procedure TBitmap.HandleNeeded;
begin
{*
 0042B624    push        ebp
 0042B625    mov         ebp,esp
 0042B627    add         esp,0FFFFFFF0
 0042B62A    mov         dword ptr [ebp-4],eax
 0042B62D    mov         eax,dword ptr [ebp-4]
 0042B630    mov         eax,dword ptr [eax+28]
 0042B633    cmp         dword ptr [eax+8],0
>0042B637    jne         0042B6AE
 0042B639    cmp         dword ptr [eax+14],0
>0042B63D    jne         0042B6AE
 0042B63F    cmp         dword ptr [eax+6C],0
>0042B643    je          0042B6AE
 0042B645    push        0
 0042B647    push        0
 0042B649    mov         eax,dword ptr [eax+6C]
 0042B64C    call        TStream.SetPosition
 0042B651    mov         eax,dword ptr [ebp-4]
 0042B654    mov         edx,dword ptr [eax+10]
 0042B657    mov         dword ptr [ebp-10],edx
 0042B65A    mov         edx,dword ptr [eax+14]
 0042B65D    mov         dword ptr [ebp-0C],edx
 0042B660    xor         eax,eax
 0042B662    push        ebp
 0042B663    push        42B6A7
 0042B668    push        dword ptr fs:[eax]
 0042B66B    mov         dword ptr fs:[eax],esp
 0042B66E    mov         eax,dword ptr [ebp-4]
 0042B671    xor         edx,edx
 0042B673    mov         dword ptr [eax+10],edx
 0042B676    mov         dword ptr [eax+14],edx
 0042B679    mov         eax,dword ptr [ebp-4]
 0042B67C    mov         eax,dword ptr [eax+28]
 0042B67F    mov         edx,dword ptr [eax+6C]
 0042B682    mov         eax,dword ptr [ebp-4]
 0042B685    mov         ecx,dword ptr [eax]
 0042B687    call        dword ptr [ecx+54]
 0042B68A    xor         eax,eax
 0042B68C    pop         edx
 0042B68D    pop         ecx
 0042B68E    pop         ecx
 0042B68F    mov         dword ptr fs:[eax],edx
 0042B692    push        42B6AE
 0042B697    mov         eax,dword ptr [ebp-4]
 0042B69A    mov         edx,dword ptr [ebp-10]
 0042B69D    mov         dword ptr [eax+10],edx
 0042B6A0    mov         edx,dword ptr [ebp-0C]
 0042B6A3    mov         dword ptr [eax+14],edx
 0042B6A6    ret
>0042B6A7    jmp         @HandleFinally
>0042B6AC    jmp         0042B697
 0042B6AE    mov         eax,dword ptr [ebp-4]
 0042B6B1    mov         eax,dword ptr [eax+28]
 0042B6B4    cmp         dword ptr [eax+8],0
>0042B6B8    jne         0042B6C0
 0042B6BA    mov         edx,dword ptr [eax+14]
 0042B6BD    mov         dword ptr [eax+8],edx
 0042B6C0    mov         esp,ebp
 0042B6C2    pop         ebp
 0042B6C3    ret
*}
end;

//0042B6C4
procedure TBitmap.MaskHandleNeeded;
begin
{*
 0042B6C4    push        ebx
 0042B6C5    push        esi
 0042B6C6    mov         ebx,eax
 0042B6C8    cmp         byte ptr [ebx+32],0
>0042B6CC    je          0042B6D4
 0042B6CE    cmp         byte ptr [ebx+31],0
>0042B6D2    jne         0042B721
 0042B6D4    mov         esi,dword ptr [ebx+28]
 0042B6D7    mov         eax,dword ptr [esi+0C]
 0042B6DA    test        eax,eax
>0042B6DC    je          0042B6F1
 0042B6DE    call        DeselectBitmap
 0042B6E3    mov         eax,dword ptr [esi+0C]
 0042B6E6    push        eax
 0042B6E7    call        gdi32.DeleteObject
 0042B6EC    xor         eax,eax
 0042B6EE    mov         dword ptr [esi+0C],eax
 0042B6F1    mov         eax,ebx
 0042B6F3    call        TBitmap.FreeContext
 0042B6F8    mov         eax,ebx
 0042B6FA    call        TBitmap.HandleNeeded
 0042B6FF    mov         esi,dword ptr [ebx+28]
 0042B702    mov         eax,ebx
 0042B704    call        TBitmap.GetTransparentColor
 0042B709    mov         ecx,eax
 0042B70B    mov         edx,dword ptr [esi+10]
 0042B70E    mov         eax,dword ptr [esi+8]
 0042B711    call        CopyBitmapAsMask
 0042B716    mov         dword ptr [esi+0C],eax
 0042B719    mov         byte ptr [ebx+32],1
 0042B71D    mov         byte ptr [ebx+31],1
 0042B721    pop         esi
 0042B722    pop         ebx
 0042B723    ret
*}
end;

//0042B724
procedure TBitmap.PaletteNeeded;
begin
{*
 0042B724    push        ebx
 0042B725    push        esi
 0042B726    push        edi
 0042B727    push        ebp
 0042B728    mov         edi,eax
 0042B72A    mov         ebp,dword ptr [edi+28]
 0042B72D    cmp         byte ptr [edi+30],0
>0042B731    jne         0042B7D7
 0042B737    cmp         dword ptr [ebp+10],0
>0042B73B    jne         0042B7D7
 0042B741    cmp         dword ptr [ebp+14],0
>0042B745    je          0042B7D7
 0042B74B    mov         eax,dword ptr [ebp+14]
 0042B74E    cmp         eax,dword ptr [ebp+8]
>0042B751    jne         0042B758
 0042B753    call        DeselectBitmap
 0042B758    mov         cx,word ptr [ebp+3E]
 0042B75C    mov         eax,1
 0042B761    shl         eax,cl
 0042B763    mov         ecx,eax
 0042B765    xor         edx,edx
 0042B767    mov         eax,dword ptr [ebp+14]
 0042B76A    call        PaletteFromDIBColorTable
 0042B76F    mov         esi,eax
 0042B771    mov         dword ptr [ebp+10],esi
 0042B774    test        esi,esi
>0042B776    jne         0042B7D7
 0042B778    push        0
 0042B77A    call        user32.GetDC
 0042B77F    call        GDICheck
 0042B784    mov         esi,eax
 0042B786    cmp         byte ptr [ebp+71],0
>0042B78A    jne         0042B7B3
 0042B78C    push        0C
 0042B78E    push        esi
 0042B78F    call        gdi32.GetDeviceCaps
 0042B794    mov         ebx,eax
 0042B796    push        0E
 0042B798    push        esi
 0042B799    call        gdi32.GetDeviceCaps
 0042B79E    imul        ebx,eax
 0042B7A1    movzx       eax,word ptr [ebp+2A]
 0042B7A5    movzx       edx,word ptr [ebp+28]
 0042B7A9    imul        edx
 0042B7AB    cmp         ebx,eax
>0042B7AD    jl          0042B7B3
 0042B7AF    xor         ebx,ebx
>0042B7B1    jmp         0042B7B5
 0042B7B3    mov         bl,1
 0042B7B5    mov         byte ptr [ebp+71],bl
 0042B7B8    test        bl,bl
>0042B7BA    je          0042B7C5
 0042B7BC    push        esi
 0042B7BD    call        gdi32.CreateHalftonePalette
 0042B7C2    mov         dword ptr [ebp+10],eax
 0042B7C5    push        esi
 0042B7C6    push        0
 0042B7C8    call        user32.ReleaseDC
 0042B7CD    cmp         dword ptr [ebp+10],0
>0042B7D1    jne         0042B7D7
 0042B7D3    mov         byte ptr [edi+30],1
 0042B7D7    pop         ebp
 0042B7D8    pop         edi
 0042B7D9    pop         esi
 0042B7DA    pop         ebx
 0042B7DB    ret
*}
end;

//0042B7DC
procedure TBitmap.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 0042B7DC    push        ebp
 0042B7DD    mov         ebp,esp
 0042B7DF    add         esp,0FFFFFFAC
 0042B7E2    push        ebx
 0042B7E3    push        esi
 0042B7E4    mov         ebx,ecx
 0042B7E6    mov         esi,eax
 0042B7E8    cmp         dx,2
>0042B7EC    jne         0042B7F2
 0042B7EE    test        ebx,ebx
>0042B7F0    jne         0042B7FC
 0042B7F2    mov         eax,[005AE5A8];^SUnknownClipboardFormat:TResStringRec
 0042B7F7    call        InvalidGraphic
 0042B7FC    mov         eax,esi
 0042B7FE    call        TBitmap.FreeContext
 0042B803    lea         eax,[ebp-54]
 0042B806    xor         ecx,ecx
 0042B808    mov         edx,54
 0042B80D    call        @FillChar
 0042B812    lea         eax,[ebp-54]
 0042B815    push        eax
 0042B816    push        54
 0042B818    push        ebx
 0042B819    call        gdi32.GetObjectA
 0042B81E    cmp         dword ptr [ebp-40],0
>0042B822    jne         0042B829
 0042B824    xor         eax,eax
 0042B826    mov         dword ptr [ebp-3C],eax
 0042B829    lea         eax,[ebp-54]
 0042B82C    push        eax
 0042B82D    mov         ecx,dword ptr [ebp+8]
 0042B830    mov         edx,ebx
 0042B832    mov         eax,esi
 0042B834    call        TBitmap.CopyImage
 0042B839    mov         eax,dword ptr [esi+28]
 0042B83C    mov         byte ptr [eax+70],0
 0042B840    mov         eax,esi
 0042B842    mov         edx,dword ptr [eax]
 0042B844    call        dword ptr [edx+24]
 0042B847    test        eax,eax
 0042B849    setne       al
 0042B84C    mov         byte ptr [esi+22],al
 0042B84F    mov         edx,esi
 0042B851    mov         eax,esi
 0042B853    mov         ecx,dword ptr [eax]
 0042B855    call        dword ptr [ecx+10]
 0042B858    pop         esi
 0042B859    pop         ebx
 0042B85A    mov         esp,ebp
 0042B85C    pop         ebp
 0042B85D    ret         4
*}
end;

//0042B860
procedure TBitmap.LoadFromStream(Stream:TStream);
begin
{*
 0042B860    push        ebx
 0042B861    push        esi
 0042B862    mov         ebx,edx
 0042B864    mov         esi,eax
 0042B866    mov         eax,ebx
 0042B868    mov         edx,dword ptr [eax]
 0042B86A    call        dword ptr [edx]
 0042B86C    push        eax
 0042B86D    mov         eax,ebx
 0042B86F    call        TStream.GetPosition
 0042B874    pop         ecx
 0042B875    sub         ecx,eax
 0042B877    mov         edx,ebx
 0042B879    mov         eax,esi
 0042B87B    call        TBitmap.ReadStream
 0042B880    pop         esi
 0042B881    pop         ebx
 0042B882    ret
*}
end;

//0042B884
procedure TBitmap.NewImage(NewHandle:HBITMAP; NewPalette:HPALETTE; const NewDIB:TDIBSection; OS2Format:Boolean; RLEStream:TStream);
begin
{*
 0042B884    push        ebp
 0042B885    mov         ebp,esp
 0042B887    add         esp,0FFFFFFF8
 0042B88A    push        ebx
 0042B88B    push        esi
 0042B88C    push        edi
 0042B88D    mov         esi,ecx
 0042B88F    mov         ebx,edx
 0042B891    mov         dword ptr [ebp-4],eax
 0042B894    mov         dl,1
 0042B896    mov         eax,[00424E58];TBitmapImage
 0042B89B    call        TObject.Create
 0042B8A0    mov         dword ptr [ebp-8],eax
 0042B8A3    xor         eax,eax
 0042B8A5    push        ebp
 0042B8A6    push        42B90B
 0042B8AB    push        dword ptr fs:[eax]
 0042B8AE    mov         dword ptr fs:[eax],esp
 0042B8B1    mov         eax,dword ptr [ebp-8]
 0042B8B4    mov         dword ptr [eax+8],ebx
 0042B8B7    mov         eax,dword ptr [ebp-8]
 0042B8BA    mov         dword ptr [eax+10],esi
 0042B8BD    mov         eax,dword ptr [ebp+10]
 0042B8C0    mov         edx,dword ptr [ebp-8]
 0042B8C3    mov         esi,eax
 0042B8C5    lea         edi,[edx+18]
 0042B8C8    mov         ecx,15
 0042B8CD    rep movs    dword ptr [edi],dword ptr [esi]
 0042B8CF    mov         eax,dword ptr [ebp-8]
 0042B8D2    mov         dl,byte ptr [ebp+0C]
 0042B8D5    mov         byte ptr [eax+70],dl
 0042B8D8    mov         eax,dword ptr [ebp-8]
 0042B8DB    cmp         dword ptr [eax+2C],0
>0042B8DF    je          0042B8ED
 0042B8E1    mov         eax,dword ptr [ebp-8]
 0042B8E4    mov         eax,dword ptr [eax+8]
 0042B8E7    mov         edx,dword ptr [ebp-8]
 0042B8EA    mov         dword ptr [edx+14],eax
 0042B8ED    mov         eax,dword ptr [ebp+8]
 0042B8F0    mov         edx,dword ptr ds:[418640];TMemoryStream
 0042B8F6    call        @AsClass
 0042B8FB    mov         edx,dword ptr [ebp-8]
 0042B8FE    mov         dword ptr [edx+6C],eax
 0042B901    xor         eax,eax
 0042B903    pop         edx
 0042B904    pop         ecx
 0042B905    pop         ecx
 0042B906    mov         dword ptr fs:[eax],edx
>0042B909    jmp         0042B922
>0042B90B    jmp         @HandleAnyException
 0042B910    mov         eax,dword ptr [ebp-8]
 0042B913    call        TObject.Free
 0042B918    call        @RaiseAgain
 0042B91D    call        @DoneExcept
 0042B922    push        5E0978;BitmapImageLock:TRTLCriticalSection
 0042B927    call        KERNEL32.EnterCriticalSection
 0042B92C    xor         edx,edx
 0042B92E    push        ebp
 0042B92F    push        42B96B
 0042B934    push        dword ptr fs:[edx]
 0042B937    mov         dword ptr fs:[edx],esp
 0042B93A    mov         eax,dword ptr [ebp-4]
 0042B93D    mov         eax,dword ptr [eax+28]
 0042B940    call        TSharedImage.Release
 0042B945    mov         edx,dword ptr [ebp-4]
 0042B948    mov         eax,dword ptr [ebp-8]
 0042B94B    mov         dword ptr [edx+28],eax
 0042B94E    call        TSharedImage.Reference
 0042B953    xor         eax,eax
 0042B955    pop         edx
 0042B956    pop         ecx
 0042B957    pop         ecx
 0042B958    mov         dword ptr fs:[eax],edx
 0042B95B    push        42B972
 0042B960    push        5E0978;BitmapImageLock:TRTLCriticalSection
 0042B965    call        KERNEL32.LeaveCriticalSection
 0042B96A    ret
>0042B96B    jmp         @HandleFinally
>0042B970    jmp         0042B960
 0042B972    mov         eax,dword ptr [ebp-4]
 0042B975    mov         byte ptr [eax+32],0
 0042B979    pop         edi
 0042B97A    pop         esi
 0042B97B    pop         ebx
 0042B97C    pop         ecx
 0042B97D    pop         ecx
 0042B97E    pop         ebp
 0042B97F    ret         0C
*}
end;

//0042B984
procedure TBitmap.ReadData(Stream:TStream);
begin
{*
 0042B984    push        ebx
 0042B985    push        esi
 0042B986    push        edi
 0042B987    push        ecx
 0042B988    mov         esi,edx
 0042B98A    mov         ebx,eax
 0042B98C    mov         edx,esp
 0042B98E    mov         ecx,4
 0042B993    mov         eax,esi
 0042B995    mov         edi,dword ptr [eax]
 0042B997    call        dword ptr [edi+0C]
 0042B99A    mov         ecx,dword ptr [esp]
 0042B99D    mov         edx,esi
 0042B99F    mov         eax,ebx
 0042B9A1    call        TBitmap.ReadStream
 0042B9A6    pop         edx
 0042B9A7    pop         edi
 0042B9A8    pop         esi
 0042B9A9    pop         ebx
 0042B9AA    ret
*}
end;

//0042B9AC
procedure TBitmap.ReadDIB(Stream:TStream; ImageSize:LongWord; bmf:PBitmapFileHeader);
begin
{*
 0042B9AC    push        ebp
 0042B9AD    mov         ebp,esp
 0042B9AF    add         esp,0FFFFFF54
 0042B9B5    push        ebx
 0042B9B6    push        esi
 0042B9B7    push        edi
 0042B9B8    mov         esi,ecx
 0042B9BA    mov         dword ptr [ebp-8],edx
 0042B9BD    mov         dword ptr [ebp-4],eax
 0042B9C0    xor         eax,eax
 0042B9C2    mov         dword ptr [ebp-30],eax
 0042B9C5    xor         eax,eax
 0042B9C7    mov         dword ptr [ebp-28],eax
 0042B9CA    xor         eax,eax
 0042B9CC    mov         dword ptr [ebp-38],eax
 0042B9CF    lea         edx,[ebp-20]
 0042B9D2    mov         ecx,4
 0042B9D7    mov         eax,dword ptr [ebp-8]
 0042B9DA    mov         ebx,dword ptr [eax]
 0042B9DC    call        dword ptr [ebx+0C]
 0042B9DF    cmp         dword ptr [ebp-20],0C
 0042B9E3    sete        byte ptr [ebp-21]
 0042B9E7    cmp         byte ptr [ebp-21],0
>0042B9EB    je          0042B9F4
 0042B9ED    mov         dword ptr [ebp-20],28
 0042B9F4    mov         eax,dword ptr [ebp-20]
 0042B9F7    add         eax,0C
 0042B9FA    add         eax,400
 0042B9FF    call        @GetMem
 0042BA04    mov         dword ptr [ebp-18],eax
 0042BA07    mov         eax,dword ptr [ebp-18]
 0042BA0A    mov         dword ptr [ebp-3C],eax
 0042BA0D    xor         edx,edx
 0042BA0F    push        ebp
 0042BA10    push        42BEC9
 0042BA15    push        dword ptr fs:[edx]
 0042BA18    mov         dword ptr fs:[edx],esp
 0042BA1B    xor         edx,edx
 0042BA1D    push        ebp
 0042BA1E    push        42BE9C
 0042BA23    push        dword ptr fs:[edx]
 0042BA26    mov         dword ptr fs:[edx],esp
 0042BA29    cmp         byte ptr [ebp-21],0
>0042BA2D    je          0042BA7B
 0042BA2F    lea         edx,[ebp-48]
 0042BA32    add         edx,4
 0042BA35    mov         ecx,8
 0042BA3A    mov         eax,dword ptr [ebp-8]
 0042BA3D    mov         ebx,dword ptr [eax]
 0042BA3F    call        dword ptr [ebx+0C]
 0042BA42    mov         ebx,dword ptr [ebp-3C]
 0042BA45    mov         eax,ebx
 0042BA47    xor         ecx,ecx
 0042BA49    mov         edx,28
 0042BA4E    call        @FillChar
 0042BA53    mov         eax,ebx
 0042BA55    movzx       edx,word ptr [ebp-44]
 0042BA59    mov         dword ptr [eax+4],edx
 0042BA5C    movzx       edx,word ptr [ebp-42]
 0042BA60    mov         dword ptr [eax+8],edx
 0042BA63    mov         dx,word ptr [ebp-40]
 0042BA67    mov         word ptr [eax+0C],dx
 0042BA6B    mov         dx,word ptr [ebp-3E]
 0042BA6F    mov         word ptr [eax+0E],dx
 0042BA73    sub         esi,0C
>0042BA76    jmp         0042BB48
 0042BA7B    mov         ecx,dword ptr [ebp-20]
 0042BA7E    sub         ecx,4
 0042BA81    mov         edx,dword ptr [ebp-18]
 0042BA84    add         edx,4
 0042BA87    mov         eax,dword ptr [ebp-8]
 0042BA8A    mov         ebx,dword ptr [eax]
 0042BA8C    call        dword ptr [ebx+0C]
 0042BA8F    sub         esi,dword ptr [ebp-20]
 0042BA92    mov         eax,dword ptr [ebp-3C]
 0042BA95    mov         eax,dword ptr [eax+10]
 0042BA98    cmp         eax,3
>0042BA9B    je          0042BB48
 0042BAA1    test        eax,eax
>0042BAA3    je          0042BB48
 0042BAA9    mov         dl,1
 0042BAAB    mov         eax,[00418640];TMemoryStream
 0042BAB0    call        TObject.Create
 0042BAB5    mov         dword ptr [ebp-38],eax
 0042BAB8    cmp         dword ptr [ebp+8],0
>0042BABC    jne         0042BAED
 0042BABE    lea         eax,[ebp-0AA]
 0042BAC4    xor         ecx,ecx
 0042BAC6    mov         edx,0E
 0042BACB    call        @FillChar
 0042BAD0    mov         word ptr [ebp-0AA],4D42
 0042BAD9    mov         eax,dword ptr [ebp-20]
 0042BADC    add         eax,esi
 0042BADE    mov         dword ptr [ebp-0A8],eax
 0042BAE4    lea         eax,[ebp-0AA]
 0042BAEA    mov         dword ptr [ebp+8],eax
 0042BAED    mov         edx,dword ptr [ebp+8]
 0042BAF0    mov         ecx,0E
 0042BAF5    mov         eax,dword ptr [ebp-38]
 0042BAF8    mov         ebx,dword ptr [eax]
 0042BAFA    call        dword ptr [ebx+10]
 0042BAFD    lea         edx,[ebp-20]
 0042BB00    mov         ecx,4
 0042BB05    mov         eax,dword ptr [ebp-38]
 0042BB08    mov         ebx,dword ptr [eax]
 0042BB0A    call        dword ptr [ebx+10]
 0042BB0D    mov         ecx,dword ptr [ebp-20]
 0042BB10    sub         ecx,4
 0042BB13    mov         edx,dword ptr [ebp-18]
 0042BB16    add         edx,4
 0042BB19    mov         eax,dword ptr [ebp-38]
 0042BB1C    mov         ebx,dword ptr [eax]
 0042BB1E    call        dword ptr [ebx+10]
 0042BB21    mov         eax,esi
 0042BB23    xor         edx,edx
 0042BB25    push        edx
 0042BB26    push        eax
 0042BB27    mov         edx,dword ptr [ebp-8]
 0042BB2A    mov         eax,dword ptr [ebp-38]
 0042BB2D    call        TStream.CopyFrom
 0042BB32    mov         edx,esi
 0042BB34    neg         edx
 0042BB36    mov         cx,2
 0042BB3A    mov         eax,dword ptr [ebp-38]
 0042BB3D    mov         ebx,dword ptr [eax]
 0042BB3F    call        dword ptr [ebx+14]
 0042BB42    mov         eax,dword ptr [ebp-38]
 0042BB45    mov         dword ptr [ebp-8],eax
 0042BB48    mov         ebx,dword ptr [ebp-3C]
 0042BB4B    mov         eax,dword ptr [ebp-20]
 0042BB4E    mov         dword ptr [ebx],eax
 0042BB50    mov         eax,dword ptr [ebp-18]
 0042BB53    add         eax,dword ptr [ebp-20]
 0042BB56    mov         dword ptr [ebp-1C],eax
 0042BB59    cmp         word ptr [ebx+0C],1
>0042BB5E    je          0042BB65
 0042BB60    call        InvalidBitmap
 0042BB65    cmp         dword ptr [ebp-20],28
>0042BB69    jne         0042BB98
 0042BB6B    mov         ax,word ptr [ebx+0E]
 0042BB6F    cmp         ax,10
>0042BB73    je          0042BB7B
 0042BB75    cmp         ax,20
>0042BB79    jne         0042BB98
 0042BB7B    cmp         dword ptr [ebx+10],3
>0042BB7F    jne         0042BB98
 0042BB81    mov         edx,dword ptr [ebp-1C]
 0042BB84    mov         ecx,0C
 0042BB89    mov         eax,dword ptr [ebp-8]
 0042BB8C    call        TStream.ReadBuffer
 0042BB91    add         dword ptr [ebp-1C],0C
 0042BB95    sub         esi,0C
 0042BB98    cmp         dword ptr [ebx+20],0
>0042BB9C    jne         0042BBAA
 0042BB9E    mov         ax,word ptr [ebx+0E]
 0042BBA2    call        GetDInColors
 0042BBA7    mov         dword ptr [ebx+20],eax
 0042BBAA    mov         ecx,dword ptr [ebx+20]
 0042BBAD    movzx       edi,byte ptr [ebp-21]
 0042BBB1    xor         eax,eax
 0042BBB3    mov         al,byte ptr [edi+5AC808]
 0042BBB9    imul        ecx,eax
 0042BBBC    mov         edx,dword ptr [ebp-1C]
 0042BBBF    mov         eax,dword ptr [ebp-8]
 0042BBC2    call        TStream.ReadBuffer
 0042BBC7    mov         eax,dword ptr [ebx+20]
 0042BBCA    xor         edx,edx
 0042BBCC    mov         dl,byte ptr [edi+5AC808]
 0042BBD2    imul        edx
 0042BBD4    sub         esi,eax
 0042BBD6    cmp         dword ptr [ebx+14],0
>0042BBDA    jne         0042BBFD
 0042BBDC    movzx       edx,word ptr [ebx+0E]
 0042BBE0    mov         eax,dword ptr [ebx+4]
 0042BBE3    mov         ecx,20
 0042BBE8    call        BytesPerScanline
 0042BBED    mov         ecx,eax
 0042BBEF    mov         eax,dword ptr [ebx+8]
 0042BBF2    cdq
 0042BBF3    xor         eax,edx
 0042BBF5    sub         eax,edx
 0042BBF7    imul        ecx,eax
 0042BBFA    mov         dword ptr [ebx+14],ecx
 0042BBFD    mov         eax,dword ptr [ebx+14]
 0042BC00    cmp         esi,eax
>0042BC02    jbe         0042BC06
 0042BC04    mov         esi,eax
 0042BC06    cmp         byte ptr [ebp-21],0
>0042BC0A    je          0042BC14
 0042BC0C    mov         eax,dword ptr [ebp-1C]
 0042BC0F    call        RGBTripleToQuad
 0042BC14    push        0
 0042BC16    call        user32.GetDC
 0042BC1B    call        GDICheck
 0042BC20    mov         dword ptr [ebp-0C],eax
 0042BC23    xor         edx,edx
 0042BC25    push        ebp
 0042BC26    push        42BE17
 0042BC2B    push        dword ptr fs:[edx]
 0042BC2E    mov         dword ptr fs:[edx],esp
 0042BC31    mov         eax,dword ptr [ebp-3C]
 0042BC34    mov         eax,dword ptr [eax+10]
 0042BC37    test        eax,eax
>0042BC39    je          0042BC40
 0042BC3B    cmp         eax,3
>0042BC3E    jne         0042BC4D
 0042BC40    cmp         byte ptr ds:[5AC578],0
>0042BC47    je          0042BD86
 0042BC4D    xor         eax,eax
 0042BC4F    mov         dword ptr [ebp-10],eax
 0042BC52    mov         eax,esi
 0042BC54    call        @GetMem
 0042BC59    mov         dword ptr [ebp-14],eax
 0042BC5C    xor         edx,edx
 0042BC5E    push        ebp
 0042BC5F    push        42BD7F
 0042BC64    push        dword ptr fs:[edx]
 0042BC67    mov         dword ptr fs:[edx],esp
 0042BC6A    mov         edx,dword ptr [ebp-14]
 0042BC6D    mov         ecx,esi
 0042BC6F    mov         eax,dword ptr [ebp-8]
 0042BC72    call        TStream.ReadBuffer
 0042BC77    mov         eax,dword ptr [ebp-0C]
 0042BC7A    push        eax
 0042BC7B    call        gdi32.CreateCompatibleDC
 0042BC80    call        GDICheck
 0042BC85    mov         dword ptr [ebp-10],eax
 0042BC88    push        1
 0042BC8A    push        1
 0042BC8C    mov         eax,dword ptr [ebp-0C]
 0042BC8F    push        eax
 0042BC90    call        gdi32.CreateCompatibleBitmap
 0042BC95    push        eax
 0042BC96    mov         eax,dword ptr [ebp-10]
 0042BC99    push        eax
 0042BC9A    call        gdi32.SelectObject
 0042BC9F    mov         dword ptr [ebp-2C],eax
 0042BCA2    xor         eax,eax
 0042BCA4    mov         dword ptr [ebp-34],eax
 0042BCA7    mov         eax,dword ptr [ebp-3C]
 0042BCAA    mov         eax,dword ptr [eax+20]
 0042BCAD    test        eax,eax
>0042BCAF    jbe         0042BCDB
 0042BCB1    mov         ecx,eax
 0042BCB3    mov         edx,dword ptr [ebp-1C]
 0042BCB6    xor         eax,eax
 0042BCB8    call        PaletteFromDIBColorTable
 0042BCBD    mov         dword ptr [ebp-30],eax
 0042BCC0    push        0
 0042BCC2    mov         eax,dword ptr [ebp-30]
 0042BCC5    push        eax
 0042BCC6    mov         eax,dword ptr [ebp-10]
 0042BCC9    push        eax
 0042BCCA    call        gdi32.SelectPalette
 0042BCCF    mov         dword ptr [ebp-34],eax
 0042BCD2    mov         eax,dword ptr [ebp-10]
 0042BCD5    push        eax
 0042BCD6    call        gdi32.RealizePalette
 0042BCDB    xor         edx,edx
 0042BCDD    push        ebp
 0042BCDE    push        42BD53
 0042BCE3    push        dword ptr fs:[edx]
 0042BCE6    mov         dword ptr fs:[edx],esp
 0042BCE9    push        0
 0042BCEB    mov         eax,dword ptr [ebp-18]
 0042BCEE    push        eax
 0042BCEF    mov         edx,dword ptr [ebp-14]
 0042BCF2    push        edx
 0042BCF3    push        4
 0042BCF5    push        eax
 0042BCF6    mov         eax,dword ptr [ebp-10]
 0042BCF9    push        eax
 0042BCFA    call        gdi32.CreateDIBitmap
 0042BCFF    mov         dword ptr [ebp-28],eax
 0042BD02    cmp         dword ptr [ebp-28],0
>0042BD06    jne         0042BD1D
 0042BD08    call        KERNEL32.GetLastError
 0042BD0D    test        eax,eax
>0042BD0F    jne         0042BD18
 0042BD11    call        InvalidBitmap
>0042BD16    jmp         0042BD1D
 0042BD18    call        RaiseLastOSError
 0042BD1D    xor         eax,eax
 0042BD1F    pop         edx
 0042BD20    pop         ecx
 0042BD21    pop         ecx
 0042BD22    mov         dword ptr fs:[eax],edx
 0042BD25    push        42BD5A
 0042BD2A    cmp         dword ptr [ebp-34],0
>0042BD2E    je          0042BD3F
 0042BD30    push        0FF
 0042BD32    mov         eax,dword ptr [ebp-34]
 0042BD35    push        eax
 0042BD36    mov         eax,dword ptr [ebp-10]
 0042BD39    push        eax
 0042BD3A    call        gdi32.SelectPalette
 0042BD3F    mov         eax,dword ptr [ebp-2C]
 0042BD42    push        eax
 0042BD43    mov         eax,dword ptr [ebp-10]
 0042BD46    push        eax
 0042BD47    call        gdi32.SelectObject
 0042BD4C    push        eax
 0042BD4D    call        gdi32.DeleteObject
 0042BD52    ret
>0042BD53    jmp         @HandleFinally
>0042BD58    jmp         0042BD2A
 0042BD5A    xor         eax,eax
 0042BD5C    pop         edx
 0042BD5D    pop         ecx
 0042BD5E    pop         ecx
 0042BD5F    mov         dword ptr fs:[eax],edx
 0042BD62    push        42BDFE
 0042BD67    cmp         dword ptr [ebp-10],0
>0042BD6B    je          0042BD76
 0042BD6D    mov         eax,dword ptr [ebp-10]
 0042BD70    push        eax
 0042BD71    call        gdi32.DeleteDC
 0042BD76    mov         eax,dword ptr [ebp-14]
 0042BD79    call        @FreeMem
 0042BD7E    ret
>0042BD7F    jmp         @HandleFinally
>0042BD84    jmp         0042BD67
 0042BD86    push        0
 0042BD88    push        0
 0042BD8A    lea         eax,[ebp-14]
 0042BD8D    push        eax
 0042BD8E    push        0
 0042BD90    mov         eax,dword ptr [ebp-18]
 0042BD93    push        eax
 0042BD94    mov         eax,dword ptr [ebp-0C]
 0042BD97    push        eax
 0042BD98    call        gdi32.CreateDIBSection
 0042BD9D    mov         dword ptr [ebp-28],eax
 0042BDA0    cmp         dword ptr [ebp-28],0
>0042BDA4    je          0042BDAC
 0042BDA6    cmp         dword ptr [ebp-14],0
>0042BDAA    jne         0042BDC1
 0042BDAC    call        KERNEL32.GetLastError
 0042BDB1    test        eax,eax
>0042BDB3    jne         0042BDBC
 0042BDB5    call        InvalidBitmap
>0042BDBA    jmp         0042BDC1
 0042BDBC    call        RaiseLastOSError
 0042BDC1    xor         eax,eax
 0042BDC3    push        ebp
 0042BDC4    push        42BDE6
 0042BDC9    push        dword ptr fs:[eax]
 0042BDCC    mov         dword ptr fs:[eax],esp
 0042BDCF    mov         edx,dword ptr [ebp-14]
 0042BDD2    mov         ecx,esi
 0042BDD4    mov         eax,dword ptr [ebp-8]
 0042BDD7    call        TStream.ReadBuffer
 0042BDDC    xor         eax,eax
 0042BDDE    pop         edx
 0042BDDF    pop         ecx
 0042BDE0    pop         ecx
 0042BDE1    mov         dword ptr fs:[eax],edx
>0042BDE4    jmp         0042BDFE
>0042BDE6    jmp         @HandleAnyException
 0042BDEB    mov         eax,dword ptr [ebp-28]
 0042BDEE    push        eax
 0042BDEF    call        gdi32.DeleteObject
 0042BDF4    call        @RaiseAgain
 0042BDF9    call        @DoneExcept
 0042BDFE    xor         eax,eax
 0042BE00    pop         edx
 0042BE01    pop         ecx
 0042BE02    pop         ecx
 0042BE03    mov         dword ptr fs:[eax],edx
 0042BE06    push        42BE1E
 0042BE0B    mov         eax,dword ptr [ebp-0C]
 0042BE0E    push        eax
 0042BE0F    push        0
 0042BE11    call        user32.ReleaseDC
 0042BE16    ret
>0042BE17    jmp         @HandleFinally
>0042BE1C    jmp         0042BE0B
 0042BE1E    mov         eax,dword ptr [ebp-3C]
 0042BE21    cmp         word ptr [eax+0E],8
>0042BE26    jbe         0042BE4A
 0042BE28    mov         eax,dword ptr [ebp-3C]
 0042BE2B    cmp         dword ptr [eax+20],0
>0042BE2F    jbe         0042BE4A
 0042BE31    cmp         dword ptr [ebp-30],0
>0042BE35    jne         0042BE4A
 0042BE37    mov         eax,dword ptr [ebp-3C]
 0042BE3A    mov         ecx,dword ptr [eax+20]
 0042BE3D    mov         edx,dword ptr [ebp-1C]
 0042BE40    xor         eax,eax
 0042BE42    call        PaletteFromDIBColorTable
 0042BE47    mov         dword ptr [ebp-30],eax
 0042BE4A    lea         eax,[ebp-9C]
 0042BE50    xor         ecx,ecx
 0042BE52    mov         edx,54
 0042BE57    call        @FillChar
 0042BE5C    lea         eax,[ebp-9C]
 0042BE62    push        eax
 0042BE63    push        54
 0042BE65    mov         eax,dword ptr [ebp-28]
 0042BE68    push        eax
 0042BE69    call        gdi32.GetObjectA
 0042BE6E    mov         eax,dword ptr [ebp-3C]
 0042BE71    mov         eax,dword ptr [eax+18]
 0042BE74    mov         dword ptr [ebp-6C],eax
 0042BE77    mov         eax,dword ptr [ebp-3C]
 0042BE7A    mov         eax,dword ptr [eax+1C]
 0042BE7D    mov         dword ptr [ebp-68],eax
 0042BE80    mov         eax,dword ptr [ebp-3C]
 0042BE83    mov         eax,dword ptr [eax+20]
 0042BE86    mov         dword ptr [ebp-64],eax
 0042BE89    mov         eax,dword ptr [ebp-3C]
 0042BE8C    mov         eax,dword ptr [eax+24]
 0042BE8F    mov         dword ptr [ebp-60],eax
 0042BE92    xor         eax,eax
 0042BE94    pop         edx
 0042BE95    pop         ecx
 0042BE96    pop         ecx
 0042BE97    mov         dword ptr fs:[eax],edx
>0042BE9A    jmp         0042BEB3
>0042BE9C    jmp         @HandleAnyException
 0042BEA1    mov         eax,dword ptr [ebp-38]
 0042BEA4    call        TObject.Free
 0042BEA9    call        @RaiseAgain
 0042BEAE    call        @DoneExcept
 0042BEB3    xor         eax,eax
 0042BEB5    pop         edx
 0042BEB6    pop         ecx
 0042BEB7    pop         ecx
 0042BEB8    mov         dword ptr fs:[eax],edx
 0042BEBB    push        42BED0
 0042BEC0    mov         eax,dword ptr [ebp-18]
 0042BEC3    call        @FreeMem
 0042BEC8    ret
>0042BEC9    jmp         @HandleFinally
>0042BECE    jmp         0042BEC0
 0042BED0    lea         eax,[ebp-9C]
 0042BED6    push        eax
 0042BED7    mov         al,byte ptr [ebp-21]
 0042BEDA    push        eax
 0042BEDB    mov         eax,dword ptr [ebp-38]
 0042BEDE    push        eax
 0042BEDF    mov         ecx,dword ptr [ebp-30]
 0042BEE2    mov         edx,dword ptr [ebp-28]
 0042BEE5    mov         eax,dword ptr [ebp-4]
 0042BEE8    call        TBitmap.NewImage
 0042BEED    mov         eax,dword ptr [ebp-4]
 0042BEF0    mov         edx,dword ptr [eax]
 0042BEF2    call        dword ptr [edx+24]
 0042BEF5    test        eax,eax
 0042BEF7    setne       al
 0042BEFA    mov         edx,dword ptr [ebp-4]
 0042BEFD    mov         byte ptr [edx+22],al
 0042BF00    mov         edx,dword ptr [ebp-4]
 0042BF03    mov         eax,dword ptr [ebp-4]
 0042BF06    mov         ecx,dword ptr [eax]
 0042BF08    call        dword ptr [ecx+10]
 0042BF0B    pop         edi
 0042BF0C    pop         esi
 0042BF0D    pop         ebx
 0042BF0E    mov         esp,ebp
 0042BF10    pop         ebp
 0042BF11    ret         4
*}
end;

//0042BF14
procedure TBitmap.ReadStream(Stream:TStream; Size:Longint);
begin
{*
 0042BF14    push        ebx
 0042BF15    push        esi
 0042BF16    push        edi
 0042BF17    add         esp,0FFFFFF9C
 0042BF1A    mov         esi,ecx
 0042BF1C    mov         edi,edx
 0042BF1E    mov         ebx,eax
 0042BF20    mov         eax,ebx
 0042BF22    call        TBitmap.FreeContext
 0042BF27    test        esi,esi
>0042BF29    jne         0042BF51
 0042BF2B    lea         eax,[esp+0E]
 0042BF2F    xor         ecx,ecx
 0042BF31    mov         edx,54
 0042BF36    call        @FillChar
 0042BF3B    lea         eax,[esp+0E]
 0042BF3F    push        eax
 0042BF40    push        0
 0042BF42    push        0
 0042BF44    xor         ecx,ecx
 0042BF46    xor         edx,edx
 0042BF48    mov         eax,ebx
 0042BF4A    call        TBitmap.NewImage
>0042BF4F    jmp         0042BF7B
 0042BF51    mov         edx,esp
 0042BF53    mov         ecx,0E
 0042BF58    mov         eax,edi
 0042BF5A    call        TStream.ReadBuffer
 0042BF5F    cmp         word ptr [esp],4D42
>0042BF65    je          0042BF6C
 0042BF67    call        InvalidBitmap
 0042BF6C    push        esp
 0042BF6D    mov         ecx,esi
 0042BF6F    sub         ecx,0E
 0042BF72    mov         edx,edi
 0042BF74    mov         eax,ebx
 0042BF76    call        TBitmap.ReadDIB
 0042BF7B    add         esp,64
 0042BF7E    pop         edi
 0042BF7F    pop         esi
 0042BF80    pop         ebx
 0042BF81    ret
*}
end;

//0042BF84
procedure TBitmap.SetHandle(Value:HBITMAP);
begin
{*
 0042BF84    push        ebp
 0042BF85    mov         ebp,esp
 0042BF87    add         esp,0FFFFFFA8
 0042BF8A    push        ebx
 0042BF8B    push        esi
 0042BF8C    push        edi
 0042BF8D    mov         edi,edx
 0042BF8F    mov         ebx,eax
 0042BF91    mov         esi,dword ptr [ebx+28]
 0042BF94    cmp         edi,dword ptr [esi+8]
>0042BF97    je          0042C03F
 0042BF9D    mov         eax,ebx
 0042BF9F    call        TBitmap.FreeContext
 0042BFA4    lea         eax,[ebp-58]
 0042BFA7    xor         ecx,ecx
 0042BFA9    mov         edx,54
 0042BFAE    call        @FillChar
 0042BFB3    test        edi,edi
>0042BFB5    je          0042BFC3
 0042BFB7    lea         eax,[ebp-58]
 0042BFBA    push        eax
 0042BFBB    push        54
 0042BFBD    push        edi
 0042BFBE    call        gdi32.GetObjectA
 0042BFC3    cmp         dword ptr [esi+4],1
>0042BFC7    jne         0042BFD6
 0042BFC9    mov         eax,dword ptr [esi+10]
 0042BFCC    mov         dword ptr [ebp-4],eax
 0042BFCF    xor         eax,eax
 0042BFD1    mov         dword ptr [esi+10],eax
>0042BFD4    jmp         0042BFF3
 0042BFD6    mov         eax,dword ptr [esi+10]
 0042BFD9    cmp         eax,dword ptr ds:[5E095C];SystemPalette16:HPALETTE
>0042BFDF    jne         0042BFEB
 0042BFE1    mov         eax,[005E095C];SystemPalette16:HPALETTE
 0042BFE6    mov         dword ptr [ebp-4],eax
>0042BFE9    jmp         0042BFF3
 0042BFEB    call        CopyPalette
 0042BFF0    mov         dword ptr [ebp-4],eax
 0042BFF3    xor         eax,eax
 0042BFF5    push        ebp
 0042BFF6    push        42C01F
 0042BFFB    push        dword ptr fs:[eax]
 0042BFFE    mov         dword ptr fs:[eax],esp
 0042C001    lea         eax,[ebp-58]
 0042C004    push        eax
 0042C005    push        0
 0042C007    push        0
 0042C009    mov         ecx,dword ptr [ebp-4]
 0042C00C    mov         edx,edi
 0042C00E    mov         eax,ebx
 0042C010    call        TBitmap.NewImage
 0042C015    xor         eax,eax
 0042C017    pop         edx
 0042C018    pop         ecx
 0042C019    pop         ecx
 0042C01A    mov         dword ptr fs:[eax],edx
>0042C01D    jmp         0042C036
>0042C01F    jmp         @HandleAnyException
 0042C024    mov         eax,dword ptr [ebp-4]
 0042C027    call        InternalDeletePalette
 0042C02C    call        @RaiseAgain
 0042C031    call        @DoneExcept
 0042C036    mov         edx,ebx
 0042C038    mov         eax,ebx
 0042C03A    mov         ecx,dword ptr [eax]
 0042C03C    call        dword ptr [ecx+10]
 0042C03F    pop         edi
 0042C040    pop         esi
 0042C041    pop         ebx
 0042C042    mov         esp,ebp
 0042C044    pop         ebp
 0042C045    ret
*}
end;

//0042C048
procedure TBitmap.SetHandleType(Value:TBitmapHandleType);
begin
{*
 0042C048    push        ebx
 0042C049    push        esi
 0042C04A    push        edi
 0042C04B    push        ebp
 0042C04C    add         esp,0FFFFFFAC
 0042C04F    mov         ebx,edx
 0042C051    mov         esi,eax
 0042C053    mov         eax,esi
 0042C055    call        TBitmap.GetHandleType
 0042C05A    cmp         bl,al
>0042C05C    je          0042C178
 0042C062    mov         edi,dword ptr [esi+28]
 0042C065    cmp         dword ptr [edi+8],0
>0042C069    jne         0042C08C
 0042C06B    cmp         dword ptr [edi+14],0
>0042C06F    jne         0042C08C
 0042C071    cmp         bl,1
>0042C074    jne         0042C080
 0042C076    xor         eax,eax
 0042C078    mov         dword ptr [edi+30],eax
>0042C07B    jmp         0042C178
 0042C080    mov         dword ptr [edi+30],28
>0042C087    jmp         0042C178
 0042C08C    test        bl,bl
>0042C08E    jne         0042C0F8
 0042C090    mov         eax,dword ptr [edi+14]
 0042C093    test        eax,eax
>0042C095    je          0042C0A0
 0042C097    cmp         eax,dword ptr [edi+8]
>0042C09A    je          0042C178
 0042C0A0    mov         eax,esi
 0042C0A2    call        TBitmap.FreeContext
 0042C0A7    mov         eax,esi
 0042C0A9    call        TBitmap.PaletteNeeded
 0042C0AE    mov         eax,esi
 0042C0B0    call        TBitmap.DIBNeeded
 0042C0B5    cmp         dword ptr [edi+4],1
>0042C0B9    jne         0042C0E5
 0042C0BB    mov         eax,dword ptr [edi+14]
 0042C0BE    xor         edx,edx
 0042C0C0    mov         dword ptr [edi+14],edx
 0042C0C3    mov         ebp,dword ptr [edi+10]
 0042C0C6    xor         edx,edx
 0042C0C8    mov         dword ptr [edi+10],edx
 0042C0CB    lea         edx,[edi+18]
 0042C0CE    push        edx
 0042C0CF    mov         dl,byte ptr [edi+70]
 0042C0D2    push        edx
 0042C0D3    push        0
 0042C0D5    mov         ecx,ebp
 0042C0D7    mov         edx,eax
 0042C0D9    mov         eax,esi
 0042C0DB    call        TBitmap.NewImage
>0042C0E0    jmp         0042C16F
 0042C0E5    lea         eax,[edi+18]
 0042C0E8    push        eax
 0042C0E9    mov         ecx,dword ptr [edi+10]
 0042C0EC    mov         edx,dword ptr [edi+14]
 0042C0EF    mov         eax,esi
 0042C0F1    call        TBitmap.CopyImage
>0042C0F6    jmp         0042C16F
 0042C0F8    mov         eax,dword ptr [edi+8]
 0042C0FB    test        eax,eax
>0042C0FD    je          0042C104
 0042C0FF    cmp         eax,dword ptr [edi+14]
>0042C102    jne         0042C178
 0042C104    mov         eax,esi
 0042C106    call        TBitmap.FreeContext
 0042C10B    mov         eax,esi
 0042C10D    call        TBitmap.PaletteNeeded
 0042C112    push        esi
 0042C113    push        edi
 0042C114    lea         esi,[edi+18]
 0042C117    lea         edi,[esp+8]
 0042C11B    mov         ecx,15
 0042C120    rep movs    dword ptr [edi],dword ptr [esi]
 0042C122    pop         edi
 0042C123    pop         esi
 0042C124    xor         eax,eax
 0042C126    mov         dword ptr [esp+18],eax
 0042C12A    cmp         dword ptr [edi+4],1
 0042C12E    sete        bl
 0042C131    test        bl,bl
>0042C133    je          0042C13A
 0042C135    mov         ebp,dword ptr [edi+10]
>0042C138    jmp         0042C144
 0042C13A    mov         eax,dword ptr [edi+10]
 0042C13D    call        CopyPalette
 0042C142    mov         ebp,eax
 0042C144    push        esp
 0042C145    push        0
 0042C147    mov         ecx,ebp
 0042C149    mov         edx,dword ptr [edi+10]
 0042C14C    mov         eax,dword ptr [edi+14]
 0042C14F    call        CopyBitmap
 0042C154    test        bl,bl
>0042C156    je          0042C15D
 0042C158    mov         dword ptr [edi+8],eax
>0042C15B    jmp         0042C16F
 0042C15D    push        esp
 0042C15E    mov         dl,byte ptr [edi+70]
 0042C161    push        edx
 0042C162    push        0
 0042C164    mov         ecx,ebp
 0042C166    mov         edx,eax
 0042C168    mov         eax,esi
 0042C16A    call        TBitmap.NewImage
 0042C16F    mov         edx,esi
 0042C171    mov         eax,esi
 0042C173    mov         ecx,dword ptr [eax]
 0042C175    call        dword ptr [ecx+10]
 0042C178    add         esp,54
 0042C17B    pop         ebp
 0042C17C    pop         edi
 0042C17D    pop         esi
 0042C17E    pop         ebx
 0042C17F    ret
*}
end;

//0042C180
procedure TBitmap.SetHeight(Value:Integer);
begin
{*
 0042C180    push        ebx
 0042C181    push        esi
 0042C182    push        edi
 0042C183    add         esp,0FFFFFFAC
 0042C186    mov         edi,edx
 0042C188    mov         ebx,eax
 0042C18A    mov         esi,dword ptr [ebx+28]
 0042C18D    cmp         edi,dword ptr [esi+20]
>0042C190    je          0042C1CA
 0042C192    mov         eax,ebx
 0042C194    call        TBitmap.HandleNeeded
 0042C199    push        esi
 0042C19A    push        edi
 0042C19B    add         esi,18
 0042C19E    lea         edi,[esp+8]
 0042C1A2    mov         ecx,15
 0042C1A7    rep movs    dword ptr [edi],dword ptr [esi]
 0042C1A9    pop         edi
 0042C1AA    pop         esi
 0042C1AB    mov         dword ptr [esp+8],edi
 0042C1AF    mov         dword ptr [esp+20],edi
 0042C1B3    push        esp
 0042C1B4    mov         ecx,dword ptr [esi+10]
 0042C1B7    mov         edx,dword ptr [esi+8]
 0042C1BA    mov         eax,ebx
 0042C1BC    call        TBitmap.CopyImage
 0042C1C1    mov         edx,ebx
 0042C1C3    mov         eax,ebx
 0042C1C5    mov         ecx,dword ptr [eax]
 0042C1C7    call        dword ptr [ecx+10]
 0042C1CA    add         esp,54
 0042C1CD    pop         edi
 0042C1CE    pop         esi
 0042C1CF    pop         ebx
 0042C1D0    ret
*}
end;

//0042C1D4
procedure TBitmap.SetMonochrome(Value:Boolean);
begin
{*
 0042C1D4    push        ebx
 0042C1D5    push        esi
 0042C1D6    push        edi
 0042C1D7    add         esp,0FFFFFFAC
 0042C1DA    mov         ebx,edx
 0042C1DC    mov         edi,eax
 0042C1DE    mov         esi,dword ptr [edi+28]
 0042C1E1    lea         eax,[esi+30]
 0042C1E4    cmp         word ptr [eax+0C],1
>0042C1E9    jne         0042C1F2
 0042C1EB    cmp         word ptr [eax+0E],1
>0042C1F0    je          0042C1F6
 0042C1F2    xor         eax,eax
>0042C1F4    jmp         0042C1F8
 0042C1F6    mov         al,1
 0042C1F8    cmp         bl,al
>0042C1FA    je          0042C24A
 0042C1FC    mov         eax,edi
 0042C1FE    call        TBitmap.HandleNeeded
 0042C203    push        esi
 0042C204    push        edi
 0042C205    add         esi,18
 0042C208    lea         edi,[esp+8]
 0042C20C    mov         ecx,15
 0042C211    rep movs    dword ptr [edi],dword ptr [esi]
 0042C213    pop         edi
 0042C214    pop         esi
 0042C215    xor         eax,eax
 0042C217    mov         dword ptr [esp+18],eax
 0042C21B    xor         eax,eax
 0042C21D    mov         al,bl
 0042C21F    mov         word ptr [esp+24],ax
 0042C224    mov         word ptr [esp+26],ax
 0042C229    mov         word ptr [esp+10],ax
 0042C22E    mov         word ptr [esp+12],ax
 0042C233    push        esp
 0042C234    mov         ecx,dword ptr [esi+10]
 0042C237    mov         edx,dword ptr [esi+8]
 0042C23A    mov         eax,edi
 0042C23C    call        TBitmap.CopyImage
 0042C241    mov         edx,edi
 0042C243    mov         eax,edi
 0042C245    mov         ecx,dword ptr [eax]
 0042C247    call        dword ptr [ecx+10]
 0042C24A    add         esp,54
 0042C24D    pop         edi
 0042C24E    pop         esi
 0042C24F    pop         ebx
 0042C250    ret
*}
end;

//0042C254
procedure TBitmap.SetPalette(Value:HPALETTE);
begin
{*
 0042C254    push        ebp
 0042C255    mov         ebp,esp
 0042C257    add         esp,0FFFFFFA8
 0042C25A    push        ebx
 0042C25B    push        esi
 0042C25C    push        edi
 0042C25D    mov         edi,edx
 0042C25F    mov         ebx,eax
 0042C261    mov         eax,dword ptr [ebx+28]
 0042C264    cmp         edi,dword ptr [eax+10]
>0042C267    je          0042C320
 0042C26D    mov         esi,eax
 0042C26F    test        edi,edi
>0042C271    jne         0042C288
 0042C273    cmp         dword ptr [esi+4],1
>0042C277    jne         0042C288
 0042C279    mov         eax,dword ptr [esi+10]
 0042C27C    call        InternalDeletePalette
 0042C281    xor         eax,eax
 0042C283    mov         dword ptr [esi+10],eax
>0042C286    jmp         0042C303
 0042C288    mov         eax,ebx
 0042C28A    call        TBitmap.FreeContext
 0042C28F    mov         eax,ebx
 0042C291    call        TBitmap.HandleNeeded
 0042C296    push        esi
 0042C297    push        edi
 0042C298    add         esi,18
 0042C29B    lea         edi,[ebp-58]
 0042C29E    mov         ecx,15
 0042C2A3    rep movs    dword ptr [edi],dword ptr [esi]
 0042C2A5    pop         edi
 0042C2A6    pop         esi
 0042C2A7    lea         eax,[ebp-58]
 0042C2AA    push        eax
 0042C2AB    push        0
 0042C2AD    mov         edx,dword ptr [esi+10]
 0042C2B0    mov         eax,dword ptr [esi+8]
 0042C2B3    mov         ecx,edi
 0042C2B5    call        CopyBitmap
 0042C2BA    mov         dword ptr [ebp-4],eax
 0042C2BD    xor         eax,eax
 0042C2BF    push        ebp
 0042C2C0    push        42C2EB
 0042C2C5    push        dword ptr fs:[eax]
 0042C2C8    mov         dword ptr fs:[eax],esp
 0042C2CB    lea         eax,[ebp-58]
 0042C2CE    push        eax
 0042C2CF    mov         al,byte ptr [esi+70]
 0042C2D2    push        eax
 0042C2D3    push        0
 0042C2D5    mov         ecx,edi
 0042C2D7    mov         edx,dword ptr [ebp-4]
 0042C2DA    mov         eax,ebx
 0042C2DC    call        TBitmap.NewImage
 0042C2E1    xor         eax,eax
 0042C2E3    pop         edx
 0042C2E4    pop         ecx
 0042C2E5    pop         ecx
 0042C2E6    mov         dword ptr fs:[eax],edx
>0042C2E9    jmp         0042C303
>0042C2EB    jmp         @HandleAnyException
 0042C2F0    mov         eax,dword ptr [ebp-4]
 0042C2F3    push        eax
 0042C2F4    call        gdi32.DeleteObject
 0042C2F9    call        @RaiseAgain
 0042C2FE    call        @DoneExcept
 0042C303    mov         eax,dword ptr [ebx+28]
 0042C306    lea         ecx,[eax+18]
 0042C309    mov         eax,dword ptr [eax+14]
 0042C30C    mov         edx,edi
 0042C30E    call        UpdateDIBColorTable
 0042C313    mov         byte ptr [ebx+22],1
 0042C317    mov         edx,ebx
 0042C319    mov         eax,ebx
 0042C31B    mov         ecx,dword ptr [eax]
 0042C31D    call        dword ptr [ecx+10]
 0042C320    pop         edi
 0042C321    pop         esi
 0042C322    pop         ebx
 0042C323    mov         esp,ebp
 0042C325    pop         ebp
 0042C326    ret
*}
end;

//0042C328
procedure TBitmap.SetPixelFormat(Value:TPixelFormat);
begin
{*
 0042C328    push        ebp
 0042C329    mov         ebp,esp
 0042C32B    add         esp,0FFFFFFA0
 0042C32E    push        ebx
 0042C32F    push        esi
 0042C330    push        edi
 0042C331    mov         ebx,edx
 0042C333    mov         dword ptr [ebp-4],eax
 0042C336    mov         eax,dword ptr [ebp-4]
 0042C339    call        TBitmap.GetPixelFormat
 0042C33E    cmp         bl,al
>0042C340    je          0042C487
 0042C346    mov         eax,ebx
 0042C348    sub         al,1
>0042C34A    jb          0042C352
 0042C34C    sub         al,7
>0042C34E    je          0042C361
>0042C350    jmp         0042C370
 0042C352    mov         dl,1
 0042C354    mov         eax,dword ptr [ebp-4]
 0042C357    mov         ecx,dword ptr [eax]
 0042C359    call        dword ptr [ecx+6C]
>0042C35C    jmp         0042C487
 0042C361    mov         eax,[005AE2EC];^SInvalidPixelFormat:TResStringRec
 0042C366    call        InvalidGraphic
>0042C36B    jmp         0042C487
 0042C370    lea         eax,[ebp-5D]
 0042C373    xor         ecx,ecx
 0042C375    mov         edx,54
 0042C37A    call        @FillChar
 0042C37F    mov         eax,dword ptr [ebp-4]
 0042C382    mov         eax,dword ptr [eax+28]
 0042C385    lea         esi,[eax+18]
 0042C388    lea         edi,[ebp-5D]
 0042C38B    mov         ecx,6
 0042C390    rep movs    dword ptr [edi],dword ptr [esi]
 0042C392    mov         byte ptr [ebp-9],0
 0042C396    xor         edx,edx
 0042C398    mov         dword ptr [ebp-49],edx
 0042C39B    mov         dword ptr [ebp-45],28
 0042C3A2    mov         edx,dword ptr [ebp-59]
 0042C3A5    mov         dword ptr [ebp-41],edx
 0042C3A8    mov         edx,dword ptr [ebp-55]
 0042C3AB    mov         dword ptr [ebp-3D],edx
 0042C3AE    mov         word ptr [ebp-39],1
 0042C3B4    xor         edx,edx
 0042C3B6    mov         dl,bl
 0042C3B8    movzx       edx,byte ptr [edx+5AC80B]
 0042C3BF    mov         word ptr [ebp-37],dx
 0042C3C3    mov         eax,dword ptr [eax+10]
 0042C3C6    mov         dword ptr [ebp-8],eax
 0042C3C9    sub         bl,2
>0042C3CC    je          0042C3D9
 0042C3CE    dec         bl
>0042C3D0    je          0042C3E3
 0042C3D2    sub         bl,2
>0042C3D5    je          0042C408
>0042C3D7    jmp         0042C424
 0042C3D9    mov         eax,[005E095C];SystemPalette16:HPALETTE
 0042C3DE    mov         dword ptr [ebp-8],eax
>0042C3E1    jmp         0042C424
 0042C3E3    push        0
 0042C3E5    call        user32.GetDC
 0042C3EA    call        GDICheck
 0042C3EF    mov         ebx,eax
 0042C3F1    push        ebx
 0042C3F2    call        gdi32.CreateHalftonePalette
 0042C3F7    mov         dword ptr [ebp-8],eax
 0042C3FA    mov         byte ptr [ebp-9],1
 0042C3FE    push        ebx
 0042C3FF    push        0
 0042C401    call        user32.ReleaseDC
>0042C406    jmp         0042C424
 0042C408    mov         dword ptr [ebp-35],3
 0042C40F    mov         dword ptr [ebp-1D],0F800
 0042C416    mov         dword ptr [ebp-19],7E0
 0042C41D    mov         dword ptr [ebp-15],1F
 0042C424    xor         eax,eax
 0042C426    push        ebp
 0042C427    push        42C475
 0042C42C    push        dword ptr fs:[eax]
 0042C42F    mov         dword ptr fs:[eax],esp
 0042C432    lea         eax,[ebp-5D]
 0042C435    push        eax
 0042C436    mov         eax,dword ptr [ebp-4]
 0042C439    mov         edx,dword ptr [eax]
 0042C43B    call        dword ptr [edx+64]
 0042C43E    mov         edx,eax
 0042C440    mov         ecx,dword ptr [ebp-8]
 0042C443    mov         eax,dword ptr [ebp-4]
 0042C446    call        TBitmap.CopyImage
 0042C44B    cmp         dword ptr [ebp-8],0
 0042C44F    setne       al
 0042C452    mov         edx,dword ptr [ebp-4]
 0042C455    mov         byte ptr [edx+22],al
 0042C458    xor         eax,eax
 0042C45A    pop         edx
 0042C45B    pop         ecx
 0042C45C    pop         ecx
 0042C45D    mov         dword ptr fs:[eax],edx
 0042C460    push        42C47C
 0042C465    cmp         byte ptr [ebp-9],0
>0042C469    je          0042C474
 0042C46B    mov         eax,dword ptr [ebp-8]
 0042C46E    push        eax
 0042C46F    call        gdi32.DeleteObject
 0042C474    ret
>0042C475    jmp         @HandleFinally
>0042C47A    jmp         0042C465
 0042C47C    mov         edx,dword ptr [ebp-4]
 0042C47F    mov         eax,dword ptr [ebp-4]
 0042C482    mov         ecx,dword ptr [eax]
 0042C484    call        dword ptr [ecx+10]
 0042C487    pop         edi
 0042C488    pop         esi
 0042C489    pop         ebx
 0042C48A    mov         esp,ebp
 0042C48C    pop         ebp
 0042C48D    ret
*}
end;

//0042C490
procedure TBitmap.SetWidth(Value:Integer);
begin
{*
 0042C490    push        ebx
 0042C491    push        esi
 0042C492    push        edi
 0042C493    add         esp,0FFFFFFAC
 0042C496    mov         edi,edx
 0042C498    mov         ebx,eax
 0042C49A    mov         esi,dword ptr [ebx+28]
 0042C49D    cmp         edi,dword ptr [esi+1C]
>0042C4A0    je          0042C4DA
 0042C4A2    mov         eax,ebx
 0042C4A4    call        TBitmap.HandleNeeded
 0042C4A9    push        esi
 0042C4AA    push        edi
 0042C4AB    add         esi,18
 0042C4AE    lea         edi,[esp+8]
 0042C4B2    mov         ecx,15
 0042C4B7    rep movs    dword ptr [edi],dword ptr [esi]
 0042C4B9    pop         edi
 0042C4BA    pop         esi
 0042C4BB    mov         dword ptr [esp+4],edi
 0042C4BF    mov         dword ptr [esp+1C],edi
 0042C4C3    push        esp
 0042C4C4    mov         ecx,dword ptr [esi+10]
 0042C4C7    mov         edx,dword ptr [esi+8]
 0042C4CA    mov         eax,ebx
 0042C4CC    call        TBitmap.CopyImage
 0042C4D1    mov         edx,ebx
 0042C4D3    mov         eax,ebx
 0042C4D5    mov         ecx,dword ptr [eax]
 0042C4D7    call        dword ptr [ecx+10]
 0042C4DA    add         esp,54
 0042C4DD    pop         edi
 0042C4DE    pop         esi
 0042C4DF    pop         ebx
 0042C4E0    ret
*}
end;

//0042C4E4
procedure TBitmap.WriteData(Stream:TStream);
begin
{*
 0042C4E4    mov         cl,1
 0042C4E6    call        TBitmap.WriteStream
 0042C4EB    ret
*}
end;

//0042C4EC
procedure TBitmap.WriteStream(Stream:TStream; WriteSize:Boolean);
begin
{*
 0042C4EC    push        ebx
 0042C4ED    push        esi
 0042C4EE    push        edi
 0042C4EF    push        ebp
 0042C4F0    add         esp,0FFFFFBD4
 0042C4F6    mov         ebx,ecx
 0042C4F8    mov         edi,edx
 0042C4FA    mov         esi,eax
 0042C4FC    lea         eax,[esp+10]
 0042C500    xor         ecx,ecx
 0042C502    mov         edx,0E
 0042C507    call        @FillChar
 0042C50C    mov         word ptr [esp+10],4D42
 0042C513    mov         eax,dword ptr [esi+28]
 0042C516    mov         ebp,dword ptr [eax+6C]
 0042C519    test        ebp,ebp
>0042C51B    je          0042C555
 0042C51D    mov         eax,ebp
 0042C51F    mov         edx,dword ptr [eax]
 0042C521    call        dword ptr [edx]
 0042C523    mov         dword ptr [esp],eax
 0042C526    test        bl,bl
>0042C528    je          0042C538
 0042C52A    mov         edx,esp
 0042C52C    mov         ecx,4
 0042C531    mov         eax,edi
 0042C533    call        TStream.WriteBuffer
 0042C538    mov         eax,dword ptr [esi+28]
 0042C53B    mov         ebx,dword ptr [eax+6C]
 0042C53E    mov         eax,ebx
 0042C540    mov         edx,dword ptr [eax]
 0042C542    call        dword ptr [edx]
 0042C544    mov         ecx,eax
 0042C546    mov         edx,dword ptr [ebx+4]
 0042C549    mov         eax,edi
 0042C54B    mov         ebx,dword ptr [eax]
 0042C54D    call        dword ptr [ebx+10]
>0042C550    jmp         0042C793
 0042C555    mov         eax,esi
 0042C557    call        TBitmap.DIBNeeded
 0042C55C    mov         ebp,dword ptr [esi+28]
 0042C55F    xor         eax,eax
 0042C561    mov         dword ptr [esp],eax
 0042C564    mov         eax,dword ptr [ebp+14]
 0042C567    test        eax,eax
>0042C569    je          0042C687
 0042C56F    mov         edx,dword ptr [ebp+50]
 0042C572    push        edx
 0042C573    lea         ecx,[esp+4]
 0042C577    lea         edx,[esp+0C]
 0042C57B    call        InternalGetDIBSizes
 0042C580    cmp         byte ptr [ebp+70],0
>0042C584    je          0042C5A8
 0042C586    mov         dword ptr [esp+8],0C
 0042C58E    mov         ax,word ptr [ebp+3E]
 0042C592    cmp         ax,8
>0042C596    ja          0042C5A8
 0042C598    mov         ecx,eax
 0042C59A    mov         eax,1
 0042C59F    shl         eax,cl
 0042C5A1    lea         eax,[eax+eax*2]
 0042C5A4    add         dword ptr [esp+8],eax
 0042C5A8    mov         eax,dword ptr [esp+8]
 0042C5AC    add         eax,0E
 0042C5AF    add         dword ptr [esp],eax
 0042C5B2    lea         eax,[esp+10]
 0042C5B6    xor         ecx,ecx
 0042C5B8    mov         edx,0E
 0042C5BD    call        @FillChar
 0042C5C2    mov         word ptr [esp+10],4D42
 0042C5C9    mov         eax,esi
 0042C5CB    call        TBitmap.GetCanvas
 0042C5D0    mov         dl,byte ptr ds:[42C7A0]
 0042C5D6    call        TCanvas.RequiredState
 0042C5DB    mov         eax,dword ptr [ebp+14]
 0042C5DE    push        eax
 0042C5DF    mov         eax,dword ptr [esi+2C]
 0042C5E2    mov         eax,dword ptr [eax+4]
 0042C5E5    push        eax
 0042C5E6    call        gdi32.SelectObject
 0042C5EB    call        GDICheck
 0042C5F0    mov         dword ptr [esp+0C],eax
 0042C5F4    lea         eax,[esp+2A]
 0042C5F8    push        eax
 0042C5F9    push        100
 0042C5FE    push        0
 0042C600    mov         eax,dword ptr [esi+2C]
 0042C603    mov         eax,dword ptr [eax+4]
 0042C606    push        eax
 0042C607    call        gdi32.GetDIBColorTable
 0042C60C    mov         dword ptr [esp+4],eax
 0042C610    mov         eax,dword ptr [esp+0C]
 0042C614    push        eax
 0042C615    mov         eax,dword ptr [esi+2C]
 0042C618    mov         eax,dword ptr [eax+4]
 0042C61B    push        eax
 0042C61C    call        gdi32.SelectObject
 0042C621    mov         eax,dword ptr [ebp+50]
 0042C624    test        eax,eax
>0042C626    jbe         0042C632
 0042C628    cmp         eax,dword ptr [esp+4]
>0042C62C    jae         0042C632
 0042C62E    mov         dword ptr [esp+4],eax
 0042C632    cmp         byte ptr [ebp+70],0
>0042C636    jne         0042C675
 0042C638    cmp         dword ptr [esp+4],0
>0042C63D    jne         0042C675
 0042C63F    cmp         dword ptr [ebp+10],0
>0042C643    je          0042C675
 0042C645    cmp         byte ptr [ebp+71],0
>0042C649    jne         0042C675
 0042C64B    lea         edx,[esp+2A]
 0042C64F    mov         ecx,0FF
 0042C654    mov         eax,dword ptr [ebp+10]
 0042C657    call        PaletteToDIBColorTable
 0042C65C    mov         dword ptr [esp+4],eax
 0042C660    cmp         word ptr [ebp+3E],8
>0042C665    jbe         0042C675
 0042C667    mov         eax,dword ptr [esp+4]
 0042C66B    shl         eax,2
 0042C66E    add         dword ptr [esp],eax
 0042C671    add         dword ptr [esp+8],eax
 0042C675    mov         eax,dword ptr [esp]
 0042C678    mov         dword ptr [esp+12],eax
 0042C67C    mov         eax,dword ptr [esp+8]
 0042C680    add         eax,0E
 0042C683    mov         dword ptr [esp+1A],eax
 0042C687    test        bl,bl
>0042C689    je          0042C699
 0042C68B    mov         edx,esp
 0042C68D    mov         ecx,4
 0042C692    mov         eax,edi
 0042C694    call        TStream.WriteBuffer
 0042C699    cmp         dword ptr [esp],0
>0042C69D    je          0042C793
 0042C6A3    lea         eax,[ebp+18]
 0042C6A6    call        FixupBitFields
 0042C6AB    cmp         dword ptr [esp+4],0
>0042C6B0    je          0042C6D9
 0042C6B2    mov         eax,dword ptr [ebp+50]
 0042C6B5    test        eax,eax
>0042C6B7    je          0042C6BF
 0042C6B9    cmp         eax,dword ptr [esp+4]
>0042C6BD    je          0042C6C6
 0042C6BF    mov         eax,dword ptr [esp+4]
 0042C6C3    mov         dword ptr [ebp+50],eax
 0042C6C6    cmp         byte ptr [ebp+70],0
>0042C6CA    je          0042C6D9
 0042C6CC    lea         edx,[esp+4]
 0042C6D0    lea         eax,[esp+2A]
 0042C6D4    call        RGBQuadToTriple
 0042C6D9    cmp         byte ptr [ebp+70],0
>0042C6DD    je          0042C72E
 0042C6DF    lea         eax,[ebp+30]
 0042C6E2    mov         dword ptr [esp+1E],0C
 0042C6EA    mov         dx,word ptr [eax+4]
 0042C6EE    mov         word ptr [esp+22],dx
 0042C6F3    mov         dx,word ptr [eax+8]
 0042C6F7    mov         word ptr [esp+24],dx
 0042C6FC    mov         word ptr [esp+26],1
 0042C703    mov         ax,word ptr [eax+0E]
 0042C707    mov         word ptr [esp+28],ax
 0042C70C    lea         edx,[esp+10]
 0042C710    mov         ecx,0E
 0042C715    mov         eax,edi
 0042C717    call        TStream.WriteBuffer
 0042C71C    lea         edx,[esp+1E]
 0042C720    mov         ecx,0C
 0042C725    mov         eax,edi
 0042C727    call        TStream.WriteBuffer
>0042C72C    jmp         0042C769
 0042C72E    lea         edx,[esp+10]
 0042C732    mov         ecx,0E
 0042C737    mov         eax,edi
 0042C739    call        TStream.WriteBuffer
 0042C73E    lea         edx,[ebp+30]
 0042C741    mov         ecx,28
 0042C746    mov         eax,edi
 0042C748    call        TStream.WriteBuffer
 0042C74D    cmp         word ptr [ebp+3E],8
>0042C752    jbe         0042C769
 0042C754    test        byte ptr [ebp+40],3
>0042C758    je          0042C769
 0042C75A    lea         edx,[ebp+58]
 0042C75D    mov         ecx,0C
 0042C762    mov         eax,edi
 0042C764    call        TStream.WriteBuffer
 0042C769    xor         eax,eax
 0042C76B    mov         al,byte ptr [ebp+70]
 0042C76E    xor         ecx,ecx
 0042C770    mov         cl,byte ptr [eax+5AC814]
 0042C776    imul        ecx,dword ptr [esp+4]
 0042C77B    lea         edx,[esp+2A]
 0042C77F    mov         eax,edi
 0042C781    call        TStream.WriteBuffer
 0042C786    mov         edx,dword ptr [ebp+2C]
 0042C789    mov         ecx,dword ptr [ebp+44]
 0042C78C    mov         eax,edi
 0042C78E    call        TStream.WriteBuffer
 0042C793    add         esp,42C
 0042C799    pop         ebp
 0042C79A    pop         edi
 0042C79B    pop         esi
 0042C79C    pop         ebx
 0042C79D    ret
*}
end;

//0042C7A4
procedure TBitmap.SaveToStream(Stream:TStream);
begin
{*
 0042C7A4    xor         ecx,ecx
 0042C7A6    call        TBitmap.WriteStream
 0042C7AB    ret
*}
end;

//0042C7AC
procedure TBitmap.SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);
begin
{*
 0042C7AC    push        ebp
 0042C7AD    mov         ebp,esp
 0042C7AF    add         esp,0FFFFFFA8
 0042C7B2    push        ebx
 0042C7B3    push        esi
 0042C7B4    push        edi
 0042C7B5    mov         dword ptr [ebp-4],ecx
 0042C7B8    mov         ebx,eax
 0042C7BA    mov         word ptr [edx],2
 0042C7BF    mov         eax,ebx
 0042C7C1    call        TBitmap.HandleNeeded
 0042C7C6    mov         esi,dword ptr [ebx+28]
 0042C7C9    push        esi
 0042C7CA    add         esi,18
 0042C7CD    lea         edi,[ebp-58]
 0042C7D0    mov         ecx,15
 0042C7D5    rep movs    dword ptr [edi],dword ptr [esi]
 0042C7D7    pop         esi
 0042C7D8    xor         eax,eax
 0042C7DA    mov         dword ptr [ebp-40],eax
 0042C7DD    xor         eax,eax
 0042C7DF    mov         dword ptr [ebp-44],eax
 0042C7E2    lea         eax,[ebp-58]
 0042C7E5    push        eax
 0042C7E6    mov         eax,dword ptr [ebx+2C]
 0042C7E9    push        eax
 0042C7EA    mov         edi,dword ptr [esi+10]
 0042C7ED    mov         ecx,edi
 0042C7EF    mov         edx,edi
 0042C7F1    mov         eax,dword ptr [esi+8]
 0042C7F4    call        CopyBitmap
 0042C7F9    mov         edx,dword ptr [ebp-4]
 0042C7FC    mov         dword ptr [edx],eax
 0042C7FE    xor         eax,eax
 0042C800    push        ebp
 0042C801    push        42C826
 0042C806    push        dword ptr fs:[eax]
 0042C809    mov         dword ptr fs:[eax],esp
 0042C80C    mov         eax,dword ptr [ebx+28]
 0042C80F    mov         eax,dword ptr [eax+10]
 0042C812    call        CopyPalette
 0042C817    mov         edx,dword ptr [ebp+8]
 0042C81A    mov         dword ptr [edx],eax
 0042C81C    xor         eax,eax
 0042C81E    pop         edx
 0042C81F    pop         ecx
 0042C820    pop         ecx
 0042C821    mov         dword ptr fs:[eax],edx
>0042C824    jmp         0042C840
>0042C826    jmp         @HandleAnyException
 0042C82B    mov         eax,dword ptr [ebp-4]
 0042C82E    mov         eax,dword ptr [eax]
 0042C830    push        eax
 0042C831    call        gdi32.DeleteObject
 0042C836    call        @RaiseAgain
 0042C83B    call        @DoneExcept
 0042C840    pop         edi
 0042C841    pop         esi
 0042C842    pop         ebx
 0042C843    mov         esp,ebp
 0042C845    pop         ebp
 0042C846    ret         4
*}
end;

//0042C84C
destructor TIconImage.Destroy;
begin
{*
 0042C84C    push        ebx
 0042C84D    push        esi
 0042C84E    call        @BeforeDestruction
 0042C853    mov         ebx,edx
 0042C855    mov         esi,eax
 0042C857    mov         eax,dword ptr [esi+0C]
 0042C85A    call        TObject.Free
 0042C85F    mov         edx,ebx
 0042C861    and         dl,0FC
 0042C864    mov         eax,esi
 0042C866    call        TObject.Destroy
 0042C86B    test        bl,bl
>0042C86D    jle         0042C876
 0042C86F    mov         eax,esi
 0042C871    call        @ClassDestroy
 0042C876    pop         esi
 0042C877    pop         ebx
 0042C878    ret
*}
end;

//0042C87C
procedure TIconImage.FreeHandle;
begin
{*
 0042C87C    push        ebx
 0042C87D    mov         ebx,eax
 0042C87F    mov         eax,dword ptr [ebx+8]
 0042C882    test        eax,eax
>0042C884    je          0042C88C
 0042C886    push        eax
 0042C887    call        user32.DestroyIcon
 0042C88C    xor         eax,eax
 0042C88E    mov         dword ptr [ebx+8],eax
 0042C891    pop         ebx
 0042C892    ret
*}
end;

//0042C894
constructor TIcon.Create;
begin
{*
 0042C894    push        ebx
 0042C895    push        esi
 0042C896    push        edi
 0042C897    test        dl,dl
>0042C899    je          0042C8A3
 0042C89B    add         esp,0FFFFFFF0
 0042C89E    call        @ClassCreate
 0042C8A3    mov         ebx,edx
 0042C8A5    mov         edi,eax
 0042C8A7    xor         edx,edx
 0042C8A9    mov         eax,edi
 0042C8AB    call        TGraphic.Create
 0042C8B0    mov         byte ptr [edi+21],1
 0042C8B4    mov         dl,1
 0042C8B6    mov         eax,[00424FA0];TIconImage
 0042C8BB    call        TObject.Create
 0042C8C0    mov         esi,eax
 0042C8C2    mov         dword ptr [edi+28],esi
 0042C8C5    mov         eax,esi
 0042C8C7    call        TSharedImage.Reference
 0042C8CC    mov         eax,edi
 0042C8CE    test        bl,bl
>0042C8D0    je          0042C8E1
 0042C8D2    call        @AfterConstruction
 0042C8D7    pop         dword ptr fs:[0]
 0042C8DE    add         esp,0C
 0042C8E1    mov         eax,edi
 0042C8E3    pop         edi
 0042C8E4    pop         esi
 0042C8E5    pop         ebx
 0042C8E6    ret
*}
end;

//0042C8E8
destructor TIcon.Destroy;
begin
{*
 0042C8E8    push        ebx
 0042C8E9    push        esi
 0042C8EA    call        @BeforeDestruction
 0042C8EF    mov         ebx,edx
 0042C8F1    mov         esi,eax
 0042C8F3    mov         eax,dword ptr [esi+28];TIcon.FImage:TIconImage
 0042C8F6    call        TSharedImage.Release
 0042C8FB    mov         edx,ebx
 0042C8FD    and         dl,0FC
 0042C900    mov         eax,esi
 0042C902    call        TMemoryStream.Destroy
 0042C907    test        bl,bl
>0042C909    jle         0042C912
 0042C90B    mov         eax,esi
 0042C90D    call        @ClassDestroy
 0042C912    pop         esi
 0042C913    pop         ebx
 0042C914    ret
*}
end;

//0042C918
procedure TIcon.Assign(Source:TPersistent);
begin
{*
 0042C918    push        ebx
 0042C919    push        esi
 0042C91A    push        edi
 0042C91B    mov         ebx,edx
 0042C91D    mov         esi,eax
 0042C91F    test        ebx,ebx
>0042C921    je          0042C934
 0042C923    mov         eax,ebx
 0042C925    mov         edx,dword ptr ds:[424FFC];TIcon
 0042C92B    call        @IsClass
 0042C930    test        al,al
>0042C932    je          0042C968
 0042C934    test        ebx,ebx
>0042C936    je          0042C952
 0042C938    mov         edi,ebx
 0042C93A    mov         eax,dword ptr [edi+28]
 0042C93D    call        TSharedImage.Reference
 0042C942    mov         eax,dword ptr [esi+28]
 0042C945    call        TSharedImage.Release
 0042C94A    mov         eax,dword ptr [edi+28]
 0042C94D    mov         dword ptr [esi+28],eax
>0042C950    jmp         0042C95D
 0042C952    xor         ecx,ecx
 0042C954    xor         edx,edx
 0042C956    mov         eax,esi
 0042C958    call        TIcon.NewImage
 0042C95D    mov         edx,esi
 0042C95F    mov         eax,esi
 0042C961    mov         ecx,dword ptr [eax]
 0042C963    call        dword ptr [ecx+10]
>0042C966    jmp         0042C971
 0042C968    mov         edx,ebx
 0042C96A    mov         eax,esi
 0042C96C    call        TPersistent.Assign
 0042C971    pop         edi
 0042C972    pop         esi
 0042C973    pop         ebx
 0042C974    ret
*}
end;

//0042C978
procedure TIcon.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 0042C978    push        ebx
 0042C979    push        esi
 0042C97A    push        edi
 0042C97B    mov         edi,ecx
 0042C97D    mov         esi,edx
 0042C97F    mov         ebx,eax
 0042C981    mov         dl,byte ptr ds:[42C9B4]
 0042C987    mov         eax,esi
 0042C989    call        TCanvas.RequiredState
 0042C98E    push        3
 0042C990    push        0
 0042C992    push        0
 0042C994    push        0
 0042C996    push        0
 0042C998    mov         eax,ebx
 0042C99A    call        TIcon.GetHandle
 0042C99F    push        eax
 0042C9A0    mov         eax,dword ptr [edi+4]
 0042C9A3    push        eax
 0042C9A4    mov         eax,dword ptr [edi]
 0042C9A6    push        eax
 0042C9A7    mov         eax,dword ptr [esi+4]
 0042C9AA    push        eax
 0042C9AB    call        user32.DrawIconEx
 0042C9B0    pop         edi
 0042C9B1    pop         esi
 0042C9B2    pop         ebx
 0042C9B3    ret
*}
end;

//0042C9B8
function TIcon.GetEmpty:Boolean;
begin
{*
 0042C9B8    mov         eax,dword ptr [eax+28]
 0042C9BB    cmp         dword ptr [eax+8],0
>0042C9BF    jne         0042C9C7
 0042C9C1    cmp         dword ptr [eax+0C],0
>0042C9C5    je          0042C9CA
 0042C9C7    xor         eax,eax
 0042C9C9    ret
 0042C9CA    mov         al,1
 0042C9CC    ret
*}
end;

//0042C9D0
function TIcon.GetHandle:HICON;
begin
{*
 0042C9D0    push        ebx
 0042C9D1    mov         ebx,eax
 0042C9D3    mov         eax,ebx
 0042C9D5    call        TIcon.HandleNeeded
 0042C9DA    mov         eax,dword ptr [ebx+28]
 0042C9DD    mov         eax,dword ptr [eax+8]
 0042C9E0    pop         ebx
 0042C9E1    ret
*}
end;

//0042C9E4
function TIcon.GetHeight:Integer;
begin
{*
 0042C9E4    mov         eax,dword ptr [eax+28]
 0042C9E7    mov         eax,dword ptr [eax+14]
 0042C9EA    test        eax,eax
>0042C9EC    jne         0042C9F5
 0042C9EE    push        0C
 0042C9F0    call        user32.GetSystemMetrics
 0042C9F5    ret
*}
end;

//0042C9F8
function TIcon.GetWidth:Integer;
begin
{*
 0042C9F8    mov         eax,dword ptr [eax+28]
 0042C9FB    mov         eax,dword ptr [eax+10]
 0042C9FE    test        eax,eax
>0042CA00    jne         0042CA09
 0042CA02    push        0B
 0042CA04    call        user32.GetSystemMetrics
 0042CA09    ret
*}
end;

//0042CA0C
procedure TIcon.HandleNeeded;
begin
{*
 0042CA0C    push        ebx
 0042CA0D    push        esi
 0042CA0E    add         esp,0FFFFFFF4
 0042CA11    mov         esi,eax
 0042CA13    mov         ebx,dword ptr [esi+28]
 0042CA16    cmp         dword ptr [ebx+8],0
>0042CA1A    jne         0042CA7E
 0042CA1C    mov         eax,dword ptr [ebx+0C]
 0042CA1F    test        eax,eax
>0042CA21    je          0042CA7E
 0042CA23    push        0
 0042CA25    push        0
 0042CA27    call        TStream.SetPosition
 0042CA2C    mov         edx,esp
 0042CA2E    mov         ecx,6
 0042CA33    mov         eax,dword ptr [ebx+0C]
 0042CA36    call        TStream.ReadBuffer
 0042CA3B    mov         ax,word ptr [esp+2]
 0042CA40    sub         ax,1
>0042CA44    jb          0042CA4A
>0042CA46    je          0042CA55
>0042CA48    jmp         0042CA72
 0042CA4A    mov         eax,[005E0974];StockIcon:HICON
 0042CA4F    mov         dword ptr [esp+8],eax
>0042CA53    jmp         0042CA77
 0042CA55    push        6
 0042CA57    lea         eax,[esi+2C]
 0042CA5A    push        eax
 0042CA5B    lea         eax,[ebx+10]
 0042CA5E    push        eax
 0042CA5F    movzx       ecx,word ptr [esp+10]
 0042CA64    lea         edx,[esp+14]
 0042CA68    mov         eax,dword ptr [ebx+0C]
 0042CA6B    call        ReadIcon
>0042CA70    jmp         0042CA77
 0042CA72    call        InvalidIcon
 0042CA77    mov         eax,dword ptr [esp+8]
 0042CA7B    mov         dword ptr [ebx+8],eax
 0042CA7E    add         esp,0C
 0042CA81    pop         esi
 0042CA82    pop         ebx
 0042CA83    ret
*}
end;

//0042CA84
procedure TIcon.ImageNeeded;
begin
{*
 0042CA84    push        ebp
 0042CA85    mov         ebp,esp
 0042CA87    add         esp,0FFFFFFF4
 0042CA8A    push        ebx
 0042CA8B    push        esi
 0042CA8C    push        edi
 0042CA8D    mov         esi,eax
 0042CA8F    mov         ebx,dword ptr [esi+28]
 0042CA92    cmp         dword ptr [ebx+0C],0
>0042CA96    jne         0042CB2E
 0042CA9C    cmp         dword ptr [ebx+8],0
>0042CAA0    jne         0042CAA7
 0042CAA2    call        InvalidIcon
 0042CAA7    mov         dl,1
 0042CAA9    mov         eax,[00418640];TMemoryStream
 0042CAAE    call        TObject.Create
 0042CAB3    mov         dword ptr [ebp-4],eax
 0042CAB6    xor         eax,eax
 0042CAB8    push        ebp
 0042CAB9    push        42CB11
 0042CABE    push        dword ptr fs:[eax]
 0042CAC1    mov         dword ptr fs:[eax],esp
 0042CAC4    mov         eax,esi
 0042CAC6    call        TIcon.GetHandle
 0042CACB    cmp         eax,dword ptr ds:[5E0974];StockIcon:HICON
>0042CAD1    jne         0042CAF4
 0042CAD3    lea         eax,[ebp-0A]
 0042CAD6    xor         ecx,ecx
 0042CAD8    mov         edx,6
 0042CADD    call        @FillChar
 0042CAE2    lea         edx,[ebp-0A]
 0042CAE5    mov         ecx,6
 0042CAEA    mov         eax,dword ptr [ebp-4]
 0042CAED    call        TStream.WriteBuffer
>0042CAF2    jmp         0042CB07
 0042CAF4    mov         eax,esi
 0042CAF6    call        TIcon.GetHandle
 0042CAFB    mov         edx,eax
 0042CAFD    xor         ecx,ecx
 0042CAFF    mov         eax,dword ptr [ebp-4]
 0042CB02    call        WriteIcon
 0042CB07    xor         eax,eax
 0042CB09    pop         edx
 0042CB0A    pop         ecx
 0042CB0B    pop         ecx
 0042CB0C    mov         dword ptr fs:[eax],edx
>0042CB0F    jmp         0042CB28
>0042CB11    jmp         @HandleAnyException
 0042CB16    mov         eax,dword ptr [ebp-4]
 0042CB19    call        TObject.Free
 0042CB1E    call        @RaiseAgain
 0042CB23    call        @DoneExcept
 0042CB28    mov         eax,dword ptr [ebp-4]
 0042CB2B    mov         dword ptr [ebx+0C],eax
 0042CB2E    pop         edi
 0042CB2F    pop         esi
 0042CB30    pop         ebx
 0042CB31    mov         esp,ebp
 0042CB33    pop         ebp
 0042CB34    ret
*}
end;

//0042CB38
procedure TIcon.LoadFromStream(Stream:TStream);
begin
{*
 0042CB38    push        ebp
 0042CB39    mov         ebp,esp
 0042CB3B    add         esp,0FFFFFFF4
 0042CB3E    push        ebx
 0042CB3F    push        esi
 0042CB40    push        edi
 0042CB41    mov         esi,edx
 0042CB43    mov         ebx,eax
 0042CB45    mov         dl,1
 0042CB47    mov         eax,[00418640];TMemoryStream
 0042CB4C    call        TObject.Create
 0042CB51    mov         dword ptr [ebp-4],eax
 0042CB54    xor         eax,eax
 0042CB56    push        ebp
 0042CB57    push        42CBC6
 0042CB5C    push        dword ptr fs:[eax]
 0042CB5F    mov         dword ptr fs:[eax],esp
 0042CB62    mov         eax,esi
 0042CB64    mov         edx,dword ptr [eax]
 0042CB66    call        dword ptr [edx]
 0042CB68    push        eax
 0042CB69    mov         eax,esi
 0042CB6B    call        TStream.GetPosition
 0042CB70    pop         edx
 0042CB71    sub         edx,eax
 0042CB73    mov         eax,dword ptr [ebp-4]
 0042CB76    mov         ecx,dword ptr [eax]
 0042CB78    call        dword ptr [ecx+4]
 0042CB7B    mov         eax,dword ptr [ebp-4]
 0042CB7E    mov         edx,dword ptr [eax]
 0042CB80    call        dword ptr [edx]
 0042CB82    mov         ecx,eax
 0042CB84    mov         eax,dword ptr [ebp-4]
 0042CB87    mov         edx,dword ptr [eax+4]
 0042CB8A    mov         eax,esi
 0042CB8C    call        TStream.ReadBuffer
 0042CB91    lea         edx,[ebp-0A]
 0042CB94    mov         ecx,6
 0042CB99    mov         eax,dword ptr [ebp-4]
 0042CB9C    call        TStream.ReadBuffer
 0042CBA1    mov         ax,word ptr [ebp-8]
 0042CBA5    sub         ax,2
>0042CBA9    jb          0042CBB0
 0042CBAB    call        InvalidIcon
 0042CBB0    mov         ecx,dword ptr [ebp-4]
 0042CBB3    xor         edx,edx
 0042CBB5    mov         eax,ebx
 0042CBB7    call        TIcon.NewImage
 0042CBBC    xor         eax,eax
 0042CBBE    pop         edx
 0042CBBF    pop         ecx
 0042CBC0    pop         ecx
 0042CBC1    mov         dword ptr fs:[eax],edx
>0042CBC4    jmp         0042CBDD
>0042CBC6    jmp         @HandleAnyException
 0042CBCB    mov         eax,dword ptr [ebp-4]
 0042CBCE    call        TObject.Free
 0042CBD3    call        @RaiseAgain
 0042CBD8    call        @DoneExcept
 0042CBDD    mov         edx,ebx
 0042CBDF    mov         eax,ebx
 0042CBE1    mov         ecx,dword ptr [eax]
 0042CBE3    call        dword ptr [ecx+10]
 0042CBE6    pop         edi
 0042CBE7    pop         esi
 0042CBE8    pop         ebx
 0042CBE9    mov         esp,ebp
 0042CBEB    pop         ebp
 0042CBEC    ret
*}
end;

//0042CBF0
procedure TIcon.NewImage(NewHandle:HICON; NewImage:TMemoryStream);
begin
{*
 0042CBF0    push        ebp
 0042CBF1    mov         ebp,esp
 0042CBF3    push        ecx
 0042CBF4    push        ebx
 0042CBF5    push        esi
 0042CBF6    push        edi
 0042CBF7    mov         edi,ecx
 0042CBF9    mov         esi,edx
 0042CBFB    mov         ebx,eax
 0042CBFD    mov         dl,1
 0042CBFF    mov         eax,[00424FA0];TIconImage
 0042CC04    call        TObject.Create
 0042CC09    mov         dword ptr [ebp-4],eax
 0042CC0C    xor         eax,eax
 0042CC0E    push        ebp
 0042CC0F    push        42CC30
 0042CC14    push        dword ptr fs:[eax]
 0042CC17    mov         dword ptr fs:[eax],esp
 0042CC1A    mov         eax,dword ptr [ebp-4]
 0042CC1D    mov         dword ptr [eax+8],esi
 0042CC20    mov         eax,dword ptr [ebp-4]
 0042CC23    mov         dword ptr [eax+0C],edi
 0042CC26    xor         eax,eax
 0042CC28    pop         edx
 0042CC29    pop         ecx
 0042CC2A    pop         ecx
 0042CC2B    mov         dword ptr fs:[eax],edx
>0042CC2E    jmp         0042CC47
>0042CC30    jmp         @HandleAnyException
 0042CC35    mov         eax,dword ptr [ebp-4]
 0042CC38    call        TObject.Free
 0042CC3D    call        @RaiseAgain
 0042CC42    call        @DoneExcept
 0042CC47    mov         eax,dword ptr [ebp-4]
 0042CC4A    call        TSharedImage.Reference
 0042CC4F    mov         eax,dword ptr [ebx+28]
 0042CC52    call        TSharedImage.Release
 0042CC57    mov         eax,dword ptr [ebp-4]
 0042CC5A    mov         dword ptr [ebx+28],eax
 0042CC5D    pop         edi
 0042CC5E    pop         esi
 0042CC5F    pop         ebx
 0042CC60    pop         ecx
 0042CC61    pop         ebp
 0042CC62    ret
*}
end;

//0042CC64
procedure TIcon.SetHandle(Value:HICON);
begin
{*
 0042CC64    push        ebx
 0042CC65    mov         ebx,eax
 0042CC67    xor         ecx,ecx
 0042CC69    mov         eax,ebx
 0042CC6B    call        TIcon.NewImage
 0042CC70    mov         edx,ebx
 0042CC72    mov         eax,ebx
 0042CC74    mov         ecx,dword ptr [eax]
 0042CC76    call        dword ptr [ecx+10]
 0042CC79    pop         ebx
 0042CC7A    ret
*}
end;

//0042CC7C
procedure TIcon.SetHeight(Value:Integer);
begin
{*
 0042CC7C    mov         ecx,dword ptr [eax+28]
 0042CC7F    cmp         dword ptr [ecx+8],0
>0042CC83    jne         0042CC89
 0042CC85    mov         dword ptr [eax+30],edx
 0042CC88    ret
 0042CC89    mov         eax,[005AE2BC];^SChangeIconSize:TResStringRec
 0042CC8E    call        InvalidOperation
 0042CC93    ret
*}
end;

//0042CC94
procedure TIcon.SetTransparent(Value:Boolean);
begin
{*
 0042CC94    ret
*}
end;

//0042CC98
procedure TIcon.SetWidth(Value:Integer);
begin
{*
 0042CC98    mov         ecx,dword ptr [eax+28]
 0042CC9B    cmp         dword ptr [ecx+8],0
>0042CC9F    jne         0042CCA5
 0042CCA1    mov         dword ptr [eax+2C],edx
 0042CCA4    ret
 0042CCA5    mov         eax,[005AE2BC];^SChangeIconSize:TResStringRec
 0042CCAA    call        InvalidOperation
 0042CCAF    ret
*}
end;

//0042CCB0
procedure TIcon.SaveToStream(Stream:TStream);
begin
{*
 0042CCB0    push        ebx
 0042CCB1    push        esi
 0042CCB2    mov         esi,edx
 0042CCB4    mov         ebx,eax
 0042CCB6    mov         eax,ebx
 0042CCB8    call        TIcon.ImageNeeded
 0042CCBD    mov         eax,dword ptr [ebx+28]
 0042CCC0    mov         ebx,dword ptr [eax+0C]
 0042CCC3    mov         eax,ebx
 0042CCC5    mov         edx,dword ptr [eax]
 0042CCC7    call        dword ptr [edx]
 0042CCC9    mov         ecx,eax
 0042CCCB    mov         edx,dword ptr [ebx+4]
 0042CCCE    mov         eax,esi
 0042CCD0    call        TStream.WriteBuffer
 0042CCD5    pop         esi
 0042CCD6    pop         ebx
 0042CCD7    ret
*}
end;

//0042CCD8
procedure TIcon.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 0042CCD8    push        ebp
 0042CCD9    mov         ebp,esp
 0042CCDB    mov         eax,[005AE120];^SIconToClipboard:TResStringRec
 0042CCE0    call        InvalidOperation
 0042CCE5    pop         ebp
 0042CCE6    ret         4
*}
end;

//0042CCEC
procedure TIcon.SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);
begin
{*
 0042CCEC    push        ebp
 0042CCED    mov         ebp,esp
 0042CCEF    mov         eax,[005AE120];^SIconToClipboard:TResStringRec
 0042CCF4    call        InvalidOperation
 0042CCF9    pop         ebp
 0042CCFA    ret         4
*}
end;

//0042CD00
procedure InitScreenLogPixels;
begin
{*
 0042CD00    push        ebx
 0042CD01    push        0
 0042CD03    call        user32.GetDC
 0042CD08    mov         ebx,eax
 0042CD0A    push        5A
 0042CD0C    push        ebx
 0042CD0D    call        gdi32.GetDeviceCaps
 0042CD12    mov         [005E0964],eax;ScreenLogPixels:Integer
 0042CD17    push        ebx
 0042CD18    push        0
 0042CD1A    call        user32.ReleaseDC
 0042CD1F    mov         eax,5AC818
 0042CD24    mov         edx,0F
 0042CD29    call        CreateSystemPalette
 0042CD2E    mov         [005E095C],eax;SystemPalette16:HPALETTE
 0042CD33    pop         ebx
 0042CD34    ret
*}
end;

//0042CD38
function GetDefFontCharSet:TFontCharset;
begin
{*
 0042CD38    push        ebx
 0042CD39    push        esi
 0042CD3A    add         esp,0FFFFFFC8
 0042CD3D    mov         bl,1
 0042CD3F    push        0
 0042CD41    call        user32.GetDC
 0042CD46    mov         esi,eax
 0042CD48    test        esi,esi
>0042CD4A    je          0042CD73
 0042CD4C    mov         eax,[005E0970];StockFont:HFONT
 0042CD51    push        eax
 0042CD52    push        esi
 0042CD53    call        gdi32.SelectObject
 0042CD58    test        eax,eax
>0042CD5A    je          0042CD6B
 0042CD5C    push        esp
 0042CD5D    push        esi
 0042CD5E    call        gdi32.GetTextMetricsA
 0042CD63    test        eax,eax
>0042CD65    je          0042CD6B
 0042CD67    mov         bl,byte ptr [esp+34]
 0042CD6B    push        esi
 0042CD6C    push        0
 0042CD6E    call        user32.ReleaseDC
 0042CD73    mov         eax,ebx
 0042CD75    add         esp,38
 0042CD78    pop         esi
 0042CD79    pop         ebx
 0042CD7A    ret
*}
end;

//0042CD7C
procedure InitDefFontData;
begin
{*
 0042CD7C    push        ebx
 0042CD7D    push        esi
 0042CD7E    push        edi
 0042CD7F    push        48
 0042CD81    mov         eax,[005E0964];ScreenLogPixels:Integer
 0042CD86    push        eax
 0042CD87    push        8
 0042CD89    call        KERNEL32.MulDiv
 0042CD8E    neg         eax
 0042CD90    mov         [005AC550],eax
 0042CD95    mov         eax,[005AE810];^SysLocale:TSysLocale
 0042CD9A    cmp         byte ptr [eax+0C],0
>0042CD9E    je          0042CDD7
 0042CDA0    call        GetDefFontCharSet
 0042CDA5    mov         ebx,eax
 0042CDA7    mov         eax,ebx
 0042CDA9    sub         al,80
>0042CDAB    jne         0042CDD7
 0042CDAD    mov         esi,42CDDC
 0042CDB2    mov         edi,5AC557
 0042CDB7    movs        dword ptr [edi],dword ptr [esi]
 0042CDB8    movs        dword ptr [edi],dword ptr [esi]
 0042CDB9    movs        dword ptr [edi],dword ptr [esi]
 0042CDBA    movs        dword ptr [edi],dword ptr [esi]
 0042CDBB    push        48
 0042CDBD    mov         eax,[005E0964];ScreenLogPixels:Integer
 0042CDC2    push        eax
 0042CDC3    push        9
 0042CDC5    call        KERNEL32.MulDiv
 0042CDCA    neg         eax
 0042CDCC    mov         [005AC550],eax
 0042CDD1    mov         byte ptr ds:[5AC556],bl
 0042CDD7    pop         edi
 0042CDD8    pop         esi
 0042CDD9    pop         ebx
 0042CDDA    ret
*}
end;

//0042CE48
constructor TPatternManager.Create;
begin
{*
 0042CE48    push        ebx
 0042CE49    push        esi
 0042CE4A    test        dl,dl
>0042CE4C    je          0042CE56
 0042CE4E    add         esp,0FFFFFFF0
 0042CE51    call        @ClassCreate
 0042CE56    mov         ebx,edx
 0042CE58    mov         esi,eax
 0042CE5A    lea         eax,[esi+8]
 0042CE5D    push        eax
 0042CE5E    call        KERNEL32.InitializeCriticalSection
 0042CE63    mov         eax,esi
 0042CE65    test        bl,bl
>0042CE67    je          0042CE78
 0042CE69    call        @AfterConstruction
 0042CE6E    pop         dword ptr fs:[0]
 0042CE75    add         esp,0C
 0042CE78    mov         eax,esi
 0042CE7A    pop         esi
 0042CE7B    pop         ebx
 0042CE7C    ret
*}
end;

//0042CE80
destructor TPatternManager.Destroy;
begin
{*
 0042CE80    push        ebx
 0042CE81    push        esi
 0042CE82    call        @BeforeDestruction
 0042CE87    mov         ebx,edx
 0042CE89    mov         esi,eax
 0042CE8B    mov         eax,esi
 0042CE8D    call        TPatternManager.FreePatterns
 0042CE92    lea         eax,[esi+8]
 0042CE95    push        eax
 0042CE96    call        KERNEL32.DeleteCriticalSection
 0042CE9B    test        bl,bl
>0042CE9D    jle         0042CEA6
 0042CE9F    mov         eax,esi
 0042CEA1    call        @ClassDestroy
 0042CEA6    pop         esi
 0042CEA7    pop         ebx
 0042CEA8    ret
*}
end;

//0042CEAC
procedure TPatternManager.Lock;
begin
{*
 0042CEAC    add         eax,8
 0042CEAF    push        eax
 0042CEB0    call        KERNEL32.EnterCriticalSection
 0042CEB5    ret
*}
end;

//0042CEB8
procedure TPatternManager.Unlock;
begin
{*
 0042CEB8    add         eax,8
 0042CEBB    push        eax
 0042CEBC    call        KERNEL32.LeaveCriticalSection
 0042CEC1    ret
*}
end;

//0042CEC4
function TPatternManager.AllocPattern(BkColor:TColorRef; FgColor:TColorRef):PPattern;
begin
{*
 0042CEC4    push        ebp
 0042CEC5    mov         ebp,esp
 0042CEC7    add         esp,0FFFFFFF8
 0042CECA    push        ebx
 0042CECB    push        esi
 0042CECC    push        edi
 0042CECD    mov         esi,ecx
 0042CECF    mov         ebx,edx
 0042CED1    mov         dword ptr [ebp-4],eax
 0042CED4    mov         eax,dword ptr [ebp-4]
 0042CED7    call        TPatternManager.Lock
 0042CEDC    xor         eax,eax
 0042CEDE    push        ebp
 0042CEDF    push        42CF65
 0042CEE4    push        dword ptr fs:[eax]
 0042CEE7    mov         dword ptr fs:[eax],esp
 0042CEEA    mov         eax,dword ptr [ebp-4]
 0042CEED    mov         eax,dword ptr [eax+4]
 0042CEF0    mov         dword ptr [ebp-8],eax
>0042CEF3    jmp         0042CEFD
 0042CEF5    mov         eax,dword ptr [ebp-8]
 0042CEF8    mov         eax,dword ptr [eax]
 0042CEFA    mov         dword ptr [ebp-8],eax
 0042CEFD    cmp         dword ptr [ebp-8],0
>0042CF01    je          0042CF13
 0042CF03    mov         eax,dword ptr [ebp-8]
 0042CF06    cmp         ebx,dword ptr [eax+8]
>0042CF09    jne         0042CEF5
 0042CF0B    mov         eax,dword ptr [ebp-8]
 0042CF0E    cmp         esi,dword ptr [eax+0C]
>0042CF11    jne         0042CEF5
 0042CF13    cmp         dword ptr [ebp-8],0
>0042CF17    jne         0042CF4F
 0042CF19    mov         eax,10
 0042CF1E    call        @GetMem
 0042CF23    mov         dword ptr [ebp-8],eax
 0042CF26    mov         edi,dword ptr [ebp-8]
 0042CF29    mov         eax,dword ptr [ebp-4]
 0042CF2C    mov         eax,dword ptr [eax+4]
 0042CF2F    mov         dword ptr [edi],eax
 0042CF31    mov         ecx,esi
 0042CF33    mov         edx,ebx
 0042CF35    mov         eax,dword ptr [ebp-4]
 0042CF38    call        TPatternManager.CreateBitmap
 0042CF3D    mov         dword ptr [edi+4],eax
 0042CF40    mov         dword ptr [edi+8],ebx
 0042CF43    mov         dword ptr [edi+0C],esi
 0042CF46    mov         eax,dword ptr [ebp-4]
 0042CF49    mov         edx,dword ptr [ebp-8]
 0042CF4C    mov         dword ptr [eax+4],edx
 0042CF4F    xor         eax,eax
 0042CF51    pop         edx
 0042CF52    pop         ecx
 0042CF53    pop         ecx
 0042CF54    mov         dword ptr fs:[eax],edx
 0042CF57    push        42CF6C
 0042CF5C    mov         eax,dword ptr [ebp-4]
 0042CF5F    call        TPatternManager.Unlock
 0042CF64    ret
>0042CF65    jmp         @HandleFinally
>0042CF6A    jmp         0042CF5C
 0042CF6C    mov         eax,dword ptr [ebp-8]
 0042CF6F    pop         edi
 0042CF70    pop         esi
 0042CF71    pop         ebx
 0042CF72    pop         ecx
 0042CF73    pop         ecx
 0042CF74    pop         ebp
 0042CF75    ret
*}
end;

//0042CF78
function TPatternManager.CreateBitmap(BkColor:TColor; FgColor:TColor):TBitmap;
begin
{*
 0042CF78    push        ebp
 0042CF79    mov         ebp,esp
 0042CF7B    add         esp,0FFFFFFE8
 0042CF7E    push        ebx
 0042CF7F    push        esi
 0042CF80    push        edi
 0042CF81    mov         dword ptr [ebp-4],ecx
 0042CF84    mov         ebx,edx
 0042CF86    mov         dl,1
 0042CF88    mov         eax,[00424EB8];TBitmap
 0042CF8D    call        TBitmap.Create
 0042CF92    mov         dword ptr [ebp-8],eax
 0042CF95    xor         eax,eax
 0042CF97    push        ebp
 0042CF98    push        42D057
 0042CF9D    push        dword ptr fs:[eax]
 0042CFA0    mov         dword ptr fs:[eax],esp
 0042CFA3    mov         edx,8
 0042CFA8    mov         eax,dword ptr [ebp-8]
 0042CFAB    mov         ecx,dword ptr [eax]
 0042CFAD    call        dword ptr [ecx+40]
 0042CFB0    mov         edx,8
 0042CFB5    mov         eax,dword ptr [ebp-8]
 0042CFB8    mov         ecx,dword ptr [eax]
 0042CFBA    call        dword ptr [ecx+34]
 0042CFBD    mov         eax,dword ptr [ebp-8]
 0042CFC0    call        TBitmap.GetCanvas
 0042CFC5    mov         edi,eax
 0042CFC7    mov         eax,dword ptr [edi+14]
 0042CFCA    xor         edx,edx
 0042CFCC    call        TBrush.SetStyle
 0042CFD1    mov         eax,dword ptr [edi+14]
 0042CFD4    mov         edx,ebx
 0042CFD6    call        TBrush.SetColor
 0042CFDB    mov         eax,dword ptr [ebp-8]
 0042CFDE    mov         edx,dword ptr [eax]
 0042CFE0    call        dword ptr [edx+20]
 0042CFE3    push        eax
 0042CFE4    lea         eax,[ebp-18]
 0042CFE7    push        eax
 0042CFE8    mov         eax,dword ptr [ebp-8]
 0042CFEB    mov         edx,dword ptr [eax]
 0042CFED    call        dword ptr [edx+2C]
 0042CFF0    mov         ecx,eax
 0042CFF2    xor         edx,edx
 0042CFF4    xor         eax,eax
 0042CFF6    call        Bounds
 0042CFFB    lea         edx,[ebp-18]
 0042CFFE    mov         eax,edi
 0042D000    call        TCanvas.FillRect
 0042D005    xor         esi,esi
 0042D007    xor         ebx,ebx
 0042D009    mov         eax,esi
 0042D00B    and         eax,80000001
>0042D010    jns         0042D017
 0042D012    dec         eax
 0042D013    or          eax,0FFFFFFFE
 0042D016    inc         eax
 0042D017    mov         edx,ebx
 0042D019    and         edx,80000001
>0042D01F    jns         0042D026
 0042D021    dec         edx
 0042D022    or          edx,0FFFFFFFE
 0042D025    inc         edx
 0042D026    cmp         eax,edx
>0042D028    jne         0042D039
 0042D02A    mov         eax,dword ptr [ebp-4]
 0042D02D    push        eax
 0042D02E    mov         ecx,esi
 0042D030    mov         edx,ebx
 0042D032    mov         eax,edi
 0042D034    call        TCanvas.SetPixel
 0042D039    inc         ebx
 0042D03A    cmp         ebx,9
>0042D03D    jne         0042D009
 0042D03F    inc         esi
 0042D040    cmp         esi,9
>0042D043    jne         0042D007
 0042D045    mov         eax,dword ptr [ebp-8]
 0042D048    call        TBitmap.Dormant
 0042D04D    xor         eax,eax
 0042D04F    pop         edx
 0042D050    pop         ecx
 0042D051    pop         ecx
 0042D052    mov         dword ptr fs:[eax],edx
>0042D055    jmp         0042D06E
>0042D057    jmp         @HandleAnyException
 0042D05C    mov         eax,dword ptr [ebp-8]
 0042D05F    call        TObject.Free
 0042D064    call        @RaiseAgain
 0042D069    call        @DoneExcept
 0042D06E    mov         eax,dword ptr [ebp-8]
 0042D071    pop         edi
 0042D072    pop         esi
 0042D073    pop         ebx
 0042D074    mov         esp,ebp
 0042D076    pop         ebp
 0042D077    ret
*}
end;

//0042D078
procedure TPatternManager.FreePatterns;
begin
{*
 0042D078    push        ebp
 0042D079    mov         ebp,esp
 0042D07B    add         esp,0FFFFFFF4
 0042D07E    mov         dword ptr [ebp-4],eax
>0042D081    jmp         0042D0E1
 0042D083    mov         dword ptr [ebp-8],eax
 0042D086    mov         eax,dword ptr [ebp-8]
 0042D089    mov         dword ptr [ebp-0C],eax
 0042D08C    mov         eax,dword ptr [ebp-4]
 0042D08F    call        TPatternManager.Lock
 0042D094    xor         eax,eax
 0042D096    push        ebp
 0042D097    push        42D0C3
 0042D09C    push        dword ptr fs:[eax]
 0042D09F    mov         dword ptr fs:[eax],esp
 0042D0A2    mov         eax,dword ptr [ebp-0C]
 0042D0A5    mov         eax,dword ptr [eax]
 0042D0A7    mov         edx,dword ptr [ebp-4]
 0042D0AA    mov         dword ptr [edx+4],eax
 0042D0AD    xor         eax,eax
 0042D0AF    pop         edx
 0042D0B0    pop         ecx
 0042D0B1    pop         ecx
 0042D0B2    mov         dword ptr fs:[eax],edx
 0042D0B5    push        42D0CA
 0042D0BA    mov         eax,dword ptr [ebp-4]
 0042D0BD    call        TPatternManager.Unlock
 0042D0C2    ret
>0042D0C3    jmp         @HandleFinally
>0042D0C8    jmp         0042D0BA
 0042D0CA    mov         eax,dword ptr [ebp-0C]
 0042D0CD    mov         eax,dword ptr [eax+4]
 0042D0D0    test        eax,eax
>0042D0D2    je          0042D0D9
 0042D0D4    call        TObject.Free
 0042D0D9    mov         eax,dword ptr [ebp-8]
 0042D0DC    call        @FreeMem
 0042D0E1    mov         eax,dword ptr [ebp-4]
 0042D0E4    mov         eax,dword ptr [eax+4]
 0042D0E7    test        eax,eax
>0042D0E9    jne         0042D083
 0042D0EB    mov         esp,ebp
 0042D0ED    pop         ebp
 0042D0EE    ret
*}
end;

//0042D0F0
function AllocPatternBitmap(BkColor:TColor; FgColor:TColor):TBitmap;
begin
{*
 0042D0F0    push        ebx
 0042D0F1    push        esi
 0042D0F2    mov         esi,edx
 0042D0F4    mov         ebx,eax
 0042D0F6    cmp         dword ptr ds:[5E09B8],0;PatternManager:TPatternManager
>0042D0FD    je          0042D121
 0042D0FF    mov         eax,esi
 0042D101    call        ColorToRGB
 0042D106    push        eax
 0042D107    mov         eax,ebx
 0042D109    call        ColorToRGB
 0042D10E    mov         edx,eax
 0042D110    mov         eax,[005E09B8];PatternManager:TPatternManager
 0042D115    pop         ecx
 0042D116    call        TPatternManager.AllocPattern
 0042D11B    mov         eax,dword ptr [eax+4]
 0042D11E    pop         esi
 0042D11F    pop         ebx
 0042D120    ret
 0042D121    xor         eax,eax
 0042D123    pop         esi
 0042D124    pop         ebx
 0042D125    ret
*}
end;

Initialization
//0042D1FC
{*
 0042D1FC    sub         dword ptr ds:[5E0960],1
>0042D203    jae         0042D2F6
 0042D209    call        InitScreenLogPixels
 0042D20E    push        5E0978;BitmapImageLock:TRTLCriticalSection
 0042D213    call        KERNEL32.InitializeCriticalSection
 0042D218    push        5E0990;CounterLock:TRTLCriticalSection
 0042D21D    call        KERNEL32.InitializeCriticalSection
 0042D222    push        7
 0042D224    call        gdi32.GetStockObject
 0042D229    mov         [005E0968],eax;StockPen:HPEN
 0042D22E    push        5
 0042D230    call        gdi32.GetStockObject
 0042D235    mov         [005E096C],eax;StockBrush:HBRUSH
 0042D23A    push        0D
 0042D23C    call        gdi32.GetStockObject
 0042D241    mov         [005E0970],eax;StockFont:HFONT
 0042D246    push        7F00
 0042D24B    push        0
 0042D24D    call        user32.LoadIconA
 0042D252    mov         [005E0974],eax;StockIcon:HICON
 0042D257    call        InitDefFontData
 0042D25C    mov         cx,2C
 0042D260    mov         dl,1
 0042D262    mov         eax,[004250E8];TResourceManager
 0042D267    call        TResourceManager.Create
 0042D26C    mov         [005E09A8],eax;FontManager:TResourceManager
 0042D271    mov         cx,10
 0042D275    mov         dl,1
 0042D277    mov         eax,[004250E8];TResourceManager
 0042D27C    call        TResourceManager.Create
 0042D281    mov         [005E09AC],eax;PenManager:TResourceManager
 0042D286    mov         cx,10
 0042D28A    mov         dl,1
 0042D28C    mov         eax,[004250E8];TResourceManager
 0042D291    call        TResourceManager.Create
 0042D296    mov         [005E09B0],eax;BrushManager:TResourceManager
 0042D29B    mov         dl,1
 0042D29D    mov         eax,[0042CDEC];TPatternManager
 0042D2A2    call        TPatternManager.Create
 0042D2A7    mov         [005E09B8],eax;PatternManager:TPatternManager
 0042D2AC    mov         dl,1
 0042D2AE    mov         eax,[00417D50];TThreadList
 0042D2B3    call        TThreadList.Create
 0042D2B8    mov         [005AC804],eax
 0042D2BD    mov         dl,1
 0042D2BF    mov         eax,[00417D50];TThreadList
 0042D2C4    call        TThreadList.Create
 0042D2C9    mov         [005E09B4],eax;CanvasList:TThreadList
 0042D2CE    mov         ecx,4259B4;ColorToIdent:Boolean
 0042D2D3    mov         edx,4259C4;IdentToColor:Boolean
 0042D2D8    mov         eax,[004240F4];TColor
 0042D2DD    call        RegisterIntegerConsts
 0042D2E2    mov         ecx,425BBC;CharsetToIdent:Boolean
 0042D2E7    mov         edx,425BCC;IdentToCharset:Boolean
 0042D2EC    mov         eax,[00424224];TFontCharset
 0042D2F1    call        RegisterIntegerConsts
 0042D2F6    ret
*}
Finalization
//0042D128
{*
 0042D128    push        ebp
 0042D129    mov         ebp,esp
 0042D12B    xor         eax,eax
 0042D12D    push        ebp
 0042D12E    push        42D1F1
 0042D133    push        dword ptr fs:[eax]
 0042D136    mov         dword ptr fs:[eax],esp
 0042D139    inc         dword ptr ds:[5E0960]
>0042D13F    jne         0042D1E3
 0042D145    mov         eax,[005E09B8];PatternManager:TPatternManager
 0042D14A    call        TObject.Free
 0042D14F    mov         eax,[005AC800];gvar_005AC800
 0042D154    call        TObject.Free
 0042D159    mov         eax,[005AC7FC]
 0042D15E    call        TObject.Free
 0042D163    call        FreeMemoryContexts
 0042D168    mov         eax,[005AC804]
 0042D16D    call        TObject.Free
 0042D172    mov         eax,[005E09B4];CanvasList:TThreadList
 0042D177    call        TObject.Free
 0042D17C    mov         eax,[005E09A8];FontManager:TResourceManager
 0042D181    call        TObject.Free
 0042D186    mov         eax,[005E09AC];PenManager:TResourceManager
 0042D18B    call        TObject.Free
 0042D190    mov         eax,[005E09B0];BrushManager:TResourceManager
 0042D195    call        TObject.Free
 0042D19A    mov         eax,[005E095C];SystemPalette16:HPALETTE
 0042D19F    push        eax
 0042D1A0    call        gdi32.DeleteObject
 0042D1A5    push        5E0978;BitmapImageLock:TRTLCriticalSection
 0042D1AA    call        KERNEL32.DeleteCriticalSection
 0042D1AF    push        5E0990;CounterLock:TRTLCriticalSection
 0042D1B4    call        KERNEL32.DeleteCriticalSection
 0042D1B9    mov         eax,5AC71C
 0042D1BE    mov         ecx,12
 0042D1C3    mov         edx,dword ptr ds:[418F20];TIdentMapEntry
 0042D1C9    call        @FinalizeArray
 0042D1CE    mov         eax,5AC57C
 0042D1D3    mov         ecx,34
 0042D1D8    mov         edx,dword ptr ds:[418F20];TIdentMapEntry
 0042D1DE    call        @FinalizeArray
 0042D1E3    xor         eax,eax
 0042D1E5    pop         edx
 0042D1E6    pop         ecx
 0042D1E7    pop         ecx
 0042D1E8    mov         dword ptr fs:[eax],edx
 0042D1EB    push        42D1F8
 0042D1F0    ret
>0042D1F1    jmp         @HandleFinally
>0042D1F6    jmp         0042D1F0
 0042D1F8    pop         ebp
 0042D1F9    ret
*}
end.