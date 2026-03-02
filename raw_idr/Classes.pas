//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Classes;

interface

uses
  SysUtils, Classes;

type
  TAlignment = (taLeftJustify, taRightJustify, taCenter);
  TBiDiMode = (bdLeftToRight, bdRightToLeft, bdRightToLeftNoAlign, bdRightToLeftReadingOnly);
  .1 = (ssShift, ssAlt, ssCtrl, ssLeft, ssRight, ssMiddle, ssDouble);
  TShiftState = set of .1;
  THelpType = (htKeyword, htContext);
  TNotifyEvent = procedure(Sender:TObject) of object;;
  EStreamError = class(Exception)
  end;
  EFileStreamError = class(EStreamError)
  end;
  EFCreateError = class(EFileStreamError)
  end;
  EFOpenError = class(EFileStreamError)
  end;
  EFilerError = class(EStreamError)
  end;
  EReadError = class(EFilerError)
  end;
  EWriteError = class(EFilerError)
  end;
  EClassNotFound = class(EFilerError)
  end;
  EResNotFound = class(Exception)
  end;
  EListError = class(Exception)
  end;
  EBitsError = class(Exception)
  end;
  EStringListError = class(Exception)
  end;
  EComponentError = class(Exception)
  end;
  EOutOfResources = class(EOutOfMemory)
  end;
  EInvalidOperation = class(Exception)
  end;
  TList = class(TObject)
  public
    FList:PPointerList;//f4
    FCount:Integer;//f8
    FCapacity:Integer;//fC
    destructor Destroy; virtual;//0041A460
    procedure Grow; virtual;//v0//0041A604
    procedure Notify(Ptr:Pointer; Action:TListNotification); virtual;//v4//0041A870
    procedure Clear; virtual;//v8//0041A4B4
    procedure Error(const Msg:AnsiString; Data:Integer); virtual;//vC//0041A530
    function Add(Item:Pointer):Integer;//0041A480
    procedure Delete(Index:Integer);//0041A4CC
    procedure Error(Msg:PResStringRec; Data:Integer);//0041A568
    function Expand:TList;//0041A5BC
    function First:Pointer;//0041A5D4
    function Get(Index:Integer):Pointer;//0041A5DC
    function IndexOf(Item:Pointer):Integer;//0041A638
    procedure Insert(Index:Integer; Item:Pointer);//0041A658
    function Last:Pointer;//0041A6C4
    procedure Move(CurIndex:Integer; NewIndex:Integer);//0041A6D0
    procedure Put(Index:Integer; Item:Pointer);//0041A728
    function Remove(Item:Pointer):Integer;//0041A778
    procedure Pack;//0041A798
    procedure SetCapacity(NewCapacity:Integer);//0041A7C4
    procedure SetCount(NewCount:Integer);//0041A800
  end;
  TThreadList = class(TObject)
  public
    FList:TList;//f4
    FLock:TRTLCriticalSection;//f8
    FDuplicates:TDuplicates;//f20
    constructor Create;//0041A874
    destructor Destroy;//0041A8C8
    procedure Add(Item:Pointer);//0041A944
    function LockList:TList;//0041A9CC
    procedure Remove(Item:Pointer);//0041A9E0
    procedure UnlockList;//0041AA30
  end;
  TBits = class(TObject)
  public
    FSize:Integer;//f4
    FBits:Pointer;//f8
    destructor Destroy;//0041AA3C
    procedure Error;//0041AA6C
    procedure SetSize(Value:Integer);//0041AA90
    procedure SetBit(Index:Integer; Value:Boolean);//0041AB34
    function OpenBit:Integer;//0041AB60
  end;
  TPersistent = class(TObject)
  public
    destructor Destroy; virtual;//0041ABD8
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0041ACE8
    procedure v4; virtual;//v4//0041ACF0
    procedure Assign(Source:TPersistent); virtual;//v8//0041AC04
    procedure GetNamePath; dynamic;//0041ACF4
    procedure sub_0041ADA4; dynamic;//0041ADA4
    procedure AssignError(Source:TPersistent);//0041AC18
  end;
  TInterfacedPersistent = class(TPersistent)
  public
    FOwnerInterface:IInterface;//f4
    procedure AfterConstruction; virtual;//0041ADA8
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//vC//0041AE38
    function _AddRef:Integer; stdcall;//0041ADF8
    function _Release:Integer; stdcall;//0041AE18
  end;
  TCollectionItem = class(TPersistent)
  public
    FCollection:TCollection;//f4
    FID:Integer;//f8
    destructor Destroy; virtual;//0041AF94
    function GetDisplayName:AnsiString; virtual;//vC//0041B000
    procedure SetCollection(Value:TCollection); virtual;//v10//0041B0E0
    procedure SetIndex(Value:Integer); virtual;//v14//0041B110
    procedure SetDisplayName(const Value:AnsiString); virtual;//v18//0041B108
    constructor Create(Collection:TCollection); virtual;//v1C//0041AF5C
    procedure GetNamePath; dynamic;//0041B028
    procedure sub_0041ADA4; dynamic;//0041B0DC
    procedure Changed(AllItems:Boolean);//0041AFC4
    function GetIndex:Integer;//0041AFE8
  end;
  TCollection = class(TPersistent)
  public
    FItemClass:TCollectionItemClass;//f4
    FItems:TList;//f8
    FUpdateCount:Integer;//fC
    FNextID:Integer;//f10
    FPropName:String;//f14
    destructor Destroy; virtual;//0041B18C
    procedure Assign(Source:TPersistent); virtual;//v8//0041B1F8
    procedure vC; virtual;//vC//0041B60C
    procedure v10; virtual;//v10//0041B610
    procedure Notify(Item:TCollectionItem; Action:TCollectionNotification); virtual;//v14//0041B614
    procedure v18; virtual;//v18//0041B604
    procedure v1C; virtual;//v1C//0041B608
    procedure v20; virtual;//v20//0041B290
    procedure EndUpdate; virtual;//v24//0041B30C
    procedure GetItemAttr(Index:Integer; ItemIndex:Integer); dynamic;//0041B328
    procedure GetAttr(Index:Integer); dynamic;//0041B31C
    procedure sub_0041B318; dynamic;//0041B318
    procedure GetNamePath; dynamic;//0041B364
    constructor Create(ItemClass:TCollectionItemClass);//0041B140
    function Add:TCollectionItem;//0041B1D8
    procedure Changed;//0041B294
    procedure Clear;//0041B2A4
    function GetCount:Integer;//0041B348
    function GetItem(Index:Integer):TCollectionItem;//0041B350
    function GetPropName:AnsiString;//0041B42C
    procedure InsertItem(Item:TCollectionItem);//0041B548
    procedure RemoveItem(Item:TCollectionItem);//0041B5B0
  end;
  TOwnedCollection = class(TCollection)
  public
    FOwner:TPersistent;//f18
    procedure sub_0041ADA4; dynamic;//0041B67C
    constructor Create(AOwner:TPersistent; ItemClass:TCollectionItemClass);//0041B638
  end;
  TStrings = class(TPersistent)
  public
    FDefined:TStringsDefined;//f4
    FDelimiter:Char;//f5
    FQuoteChar:Char;//f6
    FNameValueSeparator:Char;//f7
    FUpdateCount:Integer;//f8
    FAdapter:IStringsAdapter;//fC
    destructor Destroy; virtual;//0041B680
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0041B8B8
    procedure Assign(Source:TPersistent); virtual;//v8//0041B7B0
    procedure Get; virtual; abstract;//vC//00402BEC
    procedure v10; virtual;//v10//0041BB3C
    procedure v14; virtual; abstract;//v14//00402BEC
    //function v18:?; virtual;//v18//0041BB44
    function GetTextStr:AnsiString; virtual;//v1C//0041BB9C
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//0041C0C4
    procedure v24; virtual;//v24//0041C0F8
    procedure v28; virtual;//v28//0041C260
    procedure SetTextStr(const Value:AnsiString); virtual;//v2C//0041C2E8
    procedure v30; virtual;//v30//0041C3A8
    function CompareStrings(const S1:AnsiString; const S2:AnsiString):Integer; virtual;//v34//0041C430
    function Add(const S:AnsiString):Integer; virtual;//v38//0041B6B0
    function AddObject(const S:AnsiString; AObject:TObject):Integer; virtual;//v3C//0041B6D4
    procedure AddStrings(Strings:TStrings); virtual;//v40//0041B6F8
    procedure Clear; virtual; abstract;//v44//00402BEC
    procedure Delete; virtual; abstract;//v48//00402BEC
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v4C//0041BA54
    function GetText:PChar; virtual;//v50//0041BB48
    function IndexOf(const S:AnsiString):Integer; virtual;//v54//0041BD50
    function IndexOfName(const Name:AnsiString):Integer; virtual;//v58//0041BDDC
    function IndexOfObject(AObject:TObject):Integer; virtual;//v5C//0041BEB0
    procedure Insert; virtual; abstract;//v60//00402BEC
    procedure InsertObject(Index:Integer; const S:AnsiString; AObject:TObject); virtual;//v64//0041BEE4
    procedure LoadFromFile(const FileName:AnsiString); virtual;//v68//0041BF14
    procedure LoadFromStream(Stream:TStream); virtual;//v6C//0041BF68
    procedure Move(CurIndex:Integer; NewIndex:Integer); virtual;//v70//0041C014
    procedure SaveToFile(const FileName:AnsiString); virtual;//v74//0041C1AC
    procedure SaveToStream(Stream:TStream); virtual;//v78//0041C204
    procedure SetText(Text:PChar); virtual;//v7C//0041C298
    procedure BeginUpdate;//0041B848
    procedure EndUpdate;//0041B904
    function Equals(Strings:TStrings):Boolean;//0041B918
    procedure Error(const Msg:AnsiString; Data:Integer);//0041B9C4
    procedure Error(Msg:PResStringRec; Data:Integer);//0041B9FC
    function GetValue(const Name:AnsiString):AnsiString;//0041BCC4
    procedure ReadData(Reader:TReader);//0041C0FC
    procedure SetStringsAdapter(const Value:IStringsAdapter);//0041C264
    procedure WriteData(Writer:TWriter);//0041C3AC
    function GetNameValueSeparator:Char;//0041C43C
    procedure SetNameValueSeparator(const Value:Char);//0041C454
  end;
  TStringItem = TStringItem = record//size=0x8
f0:String;//f0
end;;
  TStringList = class(TStrings)
  public
    FList:PStringItemList;//f10
    FCount:Integer;//f14
    FCapacity:Integer;//f18
    FSorted:Boolean;//f1C
    FDuplicates:TDuplicates;//f1D
    FCaseSensitive:Boolean;//f1E
    FOnChange:TNotifyEvent;//f20
    FOnChanging:TNotifyEvent;//f28
    destructor Destroy; virtual;//0041C470
    function Get(Index:Integer):AnsiString; virtual;//vC//0041C718
    //function v10:?; virtual;//v10//0041C74C
    //function v14:?; virtual;//v14//0041C750
    function GetObject(Index:Integer):TObject; virtual;//v18//0041C754
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//0041C8C8
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//0041C924
    procedure SetCapacity(NewCapacity:Integer); virtual;//v28//0041C9F8
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//0041CA34
    function CompareStrings(const S1:AnsiString; const S2:AnsiString):Integer; virtual;//v34//0041CAA8
    function Add(const S:AnsiString):Integer; virtual;//v38//0041C4CC
    function AddObject(const S:AnsiString; AObject:TObject):Integer; virtual;//v3C//0041C4D8
    procedure Clear; virtual;//v44//0041C574
    procedure Delete(Index:Integer); virtual;//v48//0041C5B4
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v4C//0041C620
    function IndexOf(const S:AnsiString):Integer; virtual;//v54//0041C7B0
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v60//0041C7EC
    procedure InsertObject(Index:Integer; const S:AnsiString; AObject:TObject); virtual;//v64//0041C7FC
    procedure Changed; virtual;//v80//0041C53C
    procedure Changing; virtual;//v84//0041C558
    procedure InsertItem(Index:Integer; const S:AnsiString; AObject:TObject); virtual;//v88//0041C850
    function Find(const S:AnsiString; var Index:Integer):Boolean; virtual;//v8C//0041C6A0
    procedure Sort; virtual;//v90//0041CA60
    procedure CustomSort(Compare:TStringListSortCompare); virtual;//v94//0041CA70
    procedure ExchangeItems(Index1:Integer; Index2:Integer);//0041C67C
    procedure Grow;//0041C77C
    procedure QuickSort(L:Integer; R:Integer; SCompare:TStringListSortCompare);//0041C964
    procedure SetSorted(Value:Boolean);//0041CA14
  end;
  TStream = class(TObject)
  public
    function GetSize:Int64; virtual;//v0//0041CAF8
    procedure v4; virtual;//v4//0041CB44
    procedure SetSize(const NewSize:Int64); virtual;//v8//0041CB5C
    procedure Read; virtual; abstract;//vC//00402BEC
    procedure Write; virtual; abstract;//v10//00402BEC
    function Seek(Offset:Longint; Origin:Word):Longint; virtual;//v14//0041CBFC
    function Seek(Origin:TSeekOrigin; const Offset:Int64):Int64; virtual;//v18//0041CC80
    function GetPosition:Int64;//0041CAC4
    procedure SetPosition(const Pos:Int64);//0041CAE4
    procedure SetSize64(const NewSize:Int64);//0041CB48
    procedure ReadBuffer(var Buffer:void ; Count:Longint);//0041CCF0
    procedure WriteBuffer(const Buffer:void ; Count:Longint);//0041CD28
    function CopyFrom(Source:TStream; Count:Int64):Int64;//0041CD60
    function ReadComponent(Instance:TComponent):TComponent;//0041CE54
  end;
  THandleStream = class(TStream)
  public
    FHandle:Integer;//f4
    procedure SetSize(NewSize:Longint); virtual;//v4//0041CF3C
    procedure SetSize(const NewSize:Int64); virtual;//v8//0041CF50
    function Read(var Buffer:void ; Count:Longint):Longint; virtual;//vC//0041CEF0
    function Write(const Buffer:void ; Count:Longint):Longint; virtual;//v10//0041CF00
    function Seek(Origin:TSeekOrigin; const Offset:Int64):Int64; virtual;//v18//0041CF10
    constructor Create(AHandle:Integer);//0041CEB4
  end;
  TFileStream = class(THandleStream)
  public
    destructor Destroy; virtual;//0041D110
    constructor Create(const FileName:AnsiString; Mode:Word);//0041CF78
    constructor Create(const FileName:AnsiString; Mode:Word; Rights:Cardinal);//0041CFBC
  end;
  TCustomMemoryStream = class(TStream)
  public
    FMemory:Pointer;//f4
    FSize:Longint;//f8
    FPosition:Longint;//fC
    function Read(var Buffer:void ; Count:Longint):Longint; virtual;//vC//0041D14C
    function Seek(Offset:Longint; Origin:Word):Longint; virtual;//v14//0041D184
    procedure SetPointer(Ptr:Pointer; Size:Longint);//0041D144
  end;
  TMemoryStream = class(TCustomMemoryStream)
  public
    FCapacity:Longint;//f10
    destructor Destroy; virtual;//0041D1A8
    procedure SetSize(NewSize:Longint); virtual;//v4//0041D24C
    function Write(const Buffer:void ; Count:Longint):Longint; virtual;//v10//0041D304
    function Realloc(var NewCapacity:Longint):Pointer; virtual;//v1C//0041D278
    procedure LoadFromStream(Stream:TStream);//0041D1EC
    procedure SetCapacity(NewCapacity:Longint);//0041D224
    procedure Clear;//0041DC24
  end;
  TStringStream = class(TStream)
  public
    FDataString:String;//f4
    FPosition:Integer;//f8
    procedure SetSize(NewSize:Longint); virtual;//v4//0041D468
    function Read(var Buffer:void ; Count:Longint):Longint; virtual;//vC//0041D398
    function Write(const Buffer:void ; Count:Longint):Longint; virtual;//v10//0041D3D8
    function Seek(Offset:Longint; Origin:Word):Longint; virtual;//v14//0041D410
    constructor Create(const AString:AnsiString);//0041D354
  end;
  TResourceStream = class(TCustomMemoryStream)
  public
    HResInfo:THandle;//f10
    HGlobal:THandle;//f14
    destructor Destroy; virtual;//0041D5B8
    function Write(const Buffer:void ; Count:Longint):Longint; virtual;//v10//0041D5F0
    constructor Create(Instance:THandle; const ResName:AnsiString; ResType:PChar);//0041D484
    procedure Initialize(Instance:THandle; Name:PChar; ResType:PChar);//0041D54C
  end;
  TStreamAdapter = class(TInterfacedObject)
  public
    FStream:TStream;//fC
    FOwnership:TStreamOwnership;//f10
    destructor Destroy; virtual;//004235E8
    function Read(pv:Pointer; cb:Longint; pcbRead:PLongint):HRESULT; virtual; stdcall;//v0//00423620
    function Write(pv:Pointer; cb:Longint; pcbWritten:PLongint):HRESULT; virtual; stdcall;//v4//00423688
    function Seek(dlibMove:Largeint; dwOrigin:Longint; var libNewPosition:Largeint):HRESULT; virtual; stdcall;//v8//004236F0
    function SetSize(libNewSize:Largeint):HRESULT; virtual; stdcall;//vC//00423774
    function CopyTo(stm:IStream; cb:Largeint; var cbRead:Largeint; var cbWritten:Largeint):HRESULT; virtual; stdcall;//v10//004237D8
    function Commit(grfCommitFlags:Longint):HRESULT; virtual; stdcall;//v14//004239D8
    function Revert:HRESULT; virtual;//v18//004239E4
    function LockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; virtual; stdcall;//v1C//004239F0
    function UnlockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; virtual; stdcall;//v20//004239FC
    function Stat(var statstg:TStatStg; grfStatFlag:Longint):HRESULT; virtual; stdcall;//v24//00423A08
    function Clone(var stm:IStream):HRESULT; virtual; stdcall;//v28//00423A84
    constructor Create(Stream:TStream; Ownership:TStreamOwnership);//004235A0
  end;
  TClassFinder = class(TObject)
  public
    FGroups:TList;//f4
    constructor Create(AClass:TPersistentClass; AIncludeActiveGroups:Boolean);//00419850
    destructor Destroy;//0041997C
    function GetClass(const AClassName:AnsiString):TPersistentClass;//004199AC
  end;
  TFiler = class(TObject)
  public
    FStream:TStream;//f4
    FBuffer:Pointer;//f8
    FBufSize:Integer;//fC
    FBufPos:Integer;//f10
    FBufEnd:Integer;//f14
    FRoot:TComponent;//f18
    FLookupRoot:TComponent;//f1C
    FAncestor:TPersistent;//f20
    FIgnoreChildren:Boolean;//f24
    destructor Destroy; virtual;//0041D650
    procedure SetRoot(Value:TComponent); virtual;//v0//0041D678
    procedure DefineProperty; virtual; abstract;//v4//00402BEC
    procedure DefineBinaryProperty; virtual; abstract;//v8//00402BEC
    procedure FlushBuffer; virtual; abstract;//vC//00402BEC
    constructor Create(Stream:TStream; BufSize:Integer);//0041D608
  end;
  TReader = class(TFiler)
  public
    FOwner:TComponent;//f28
    FParent:TComponent;//f2C
    FFixups:TList;//f30
    FLoaded:TList;//f34
    FOnFindMethod:TFindMethodEvent;//f38
    FOnSetName:TSetNameEvent;//f40
    FOnReferenceName:TReferenceNameEvent;//f48
    FOnAncestorNotFound:TAncestorNotFoundEvent;//f50
    FOnError:TReaderError;//f58
    FOnFindComponentClass:TFindComponentClassEvent;//f60
    FOnCreateComponent:TCreateComponentEvent;//f68
    FPropName:String;//f70
    FFinder:TClassFinder;//f74
    FCanHandleExcepts:Boolean;//f78
    destructor Destroy; virtual;//0041DD10
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean); virtual;//v4//0041DD70
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean); virtual;//v8//0041DDA4
    procedure FlushBuffer; virtual;//vC//0041E0B8
    function Error(const Message:AnsiString):Boolean; virtual;//v10//0041DE94
    function FindAncestorComponent(const Name:AnsiString; ComponentClass:TPersistentClass):TComponent; virtual;//v14//0041FFC0
    function FindMethod(Root:TComponent; const MethodName:AnsiString):Pointer; virtual;//v18//0041DEB4
    procedure SetName(Component:TComponent; var Name:AnsiString); virtual;//v1C//00420090
    procedure ReferenceName(var Name:AnsiString); virtual;//v20//00420078
    procedure ReadPrefix(var Flags:TFilerFlags; var AChildPos:Integer); virtual;//v24//0041EDF4
    procedure CheckValue(Value:TValueType);//0041DD4C
    function EndOfList:Boolean;//0041DE80
    procedure DoFixupReferences;//0041DF98
    procedure FreeFixups;//0041E0DC
    function GetFieldClass(Instance:TObject; const ClassName:AnsiString):TPersistentClass;//0041E118
    function GetPosition:Longint;//0041E1AC
    function NextValue:TValueType;//0041E1C4
    procedure PropertyError(const Name:AnsiString);//0041E1D4
    procedure Read(var Buf:void ; Count:Longint);//0041E1E8
    procedure ReadBuffer;//0041E234
    function ReadBoolean:Boolean;//0041E270
    function ReadChar:Char;//0041E284
    procedure ReadCollection(Collection:TCollection);//0041E2DC
    function ReadComponent(Component:TComponent):TComponent;//0041E79C
    procedure ReadData(Instance:TComponent);//0041E9D8
    procedure ReadDataInner(Instance:TComponent);//0041EA48
    function ReadFloat:Extended;//0041EB18
    function ReadSingle:Single;//0041EB5C
    function ReadCurrency:Currency;//0041EBA0
    function ReadDate:TDateTime;//0041EBF0
    function ReadIdent:AnsiString;//0041EC34
    function ReadInteger:Longint;//0041ED34
    function ReadInt64:Int64;//0041EDA0
    procedure ReadListBegin;//0041EDE4
    procedure ReadListEnd;//0041EDEC
    procedure ReadProperty(AInstance:TPersistent);//0041EF50
    procedure ReadPropValue(Instance:TPersistent; PropInfo:Pointer);//0041F2D4
    function ReadRootComponent(Root:TComponent):TComponent;//0041F63C
    function ReadSet(SetType:Pointer):Integer;//0041F968
    procedure ReadSignature;//0041FA24
    function ReadStr:AnsiString;//0041FA48
    function ReadString:AnsiString;//0041FA84
    function ReadWideString:WideString;//0041FB40
    function ReadValue:TValueType;//0041FC24
    procedure SkipSetBody;//0041FC38
    procedure SkipValue;//0041FD34
    procedure SkipProperty;//0041FED0
    procedure SkipComponent(SkipHeader:Boolean);//0041FF18
    function FindComponentClass(const ClassName:AnsiString):TComponentClass;//004200B8
    procedure SkipBytes(Count:Integer);//0042012C
    function ReadVariant:Variant;//0042033C
  end;
  TWriter = class(TFiler)
  public
    FRootAncestor:TComponent;//f28
    FPropPath:String;//f2C
    FAncestorList:TList;//f30
    FAncestorPos:Integer;//f34
    FChildPos:Integer;//f38
    FOnFindAncestor:TFindAncestorEvent;//f40
    FUseQualifiedNames:Boolean;//f48
    destructor Destroy; virtual;//00420544
    procedure SetRoot(Value:TComponent); virtual;//v0//00420624
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean); virtual;//v4//0042057C
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean); virtual;//v8//004205A4
    procedure FlushBuffer; virtual;//vC//004205E0
    procedure WriteData(Instance:TComponent); virtual;//v10//004209D0
    procedure AddAncestor(Component:TComponent);//00420570
    function GetPosition:Longint;//004205D0
    procedure SetPosition(Value:Longint);//004205E8
    procedure Write(const Buf:void ; Count:Longint);//0042063C
    procedure WriteBinary(WriteData:TStreamProc);//00420688
    procedure WriteBuffer;//00420710
    procedure WriteBoolean(Value:Boolean);//00420728
    procedure WriteChar(Value:Char);//0042073C
    procedure WriteCollection(Value:TCollection);//0042078C
    procedure WriteComponent(Component:TComponent);//0042087C
    procedure WriteFloat(const Value:Extended);//00420DD0
    procedure WriteSingle(const Value:Single);//00420DF4
    procedure WriteCurrency(const Value:Currency);//00420E18
    procedure WriteDate(const Value:TDateTime);//00420E3C
    procedure WriteIdent(const Ident:AnsiString);//00420E60
    procedure WriteInteger(Value:Longint);//00420F24
    procedure WriteInteger(Value:Int64);//00420F98
    procedure WriteListBegin;//00420FF0
    procedure WriteListEnd;//00420FF8
    procedure WritePrefix(Flags:TFilerFlags; AChildPos:Integer);//00421000
    procedure WriteProperties(Instance:TPersistent);//00421044
    procedure WriteProperty(Instance:TPersistent; PropInfo:PPropInfo);//004220D8
    procedure WriteVariant(const Value:Variant);//00422224
    procedure WritePropName(const PropName:AnsiString);//00422620
    procedure WriteStr(const Value:AnsiString);//00422674
    procedure WriteMinStr(const LocaleStr:AnsiString; const UTF8Str:UTF8String);//004226BC
    procedure WriteString(const Value:AnsiString);//00422754
    procedure WriteWideString(const Value:WideString);//004227A8
    procedure WriteValue(Value:TValueType);//0042285C
    procedure GetLookupInfo(var Ancestor:TPersistent; var Root:TComponent; var LookupRoot:TComponent; var RootAncestor:TComponent);//00422870
  end;
  EThread = class(Exception)
  end;
  TComponent = class(TPersistent)
  public
    FOwner:TComponent;//f4
    Name:TComponentName;//f8
    Tag:Integer;//fC
    FComponents:TList;//f10
    FFreeNotifies:TList;//f14
    FDesignInfo:Longint;//f18
    FComponentState:TComponentState;//f1C
    FVCLComObject:Pointer;//f20
    FComponentStyle:TComponentStyle;//f24
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT; virtual;//00423218
    procedure BeforeDestruction; virtual;//00422B6C
    destructor Destroy; virtual;//00422AF4
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00422E20
    procedure Loaded; virtual;//vC//00422EF8
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00422DC4
    procedure ReadState(Reader:TReader); virtual;//v14//00422F08
    procedure SetName(const NewName:TComponentName); virtual;//v18//00423000
    procedure v1C; virtual;//v1C//00423230
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString); virtual;//v20//00422F18
    //procedure v24(?:?); virtual;//v24//00422F10
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v28//00423238
    constructor Create(AOwner:TComponent); virtual;//v2C//00422AA8
    procedure UpdateAction(Action:TBasicAction); dynamic;//004231F0
    procedure HasParent; dynamic;//00422EA8
    procedure GetParentComponent; dynamic;//00422ED8
    procedure ExecuteAction(Action:TBasicAction); dynamic;//004231C8
    procedure sub_00422FAC; dynamic;//00422FAC
    procedure ValidateContainer(AComponent:TComponent); dynamic;//00422F98
    procedure Updated; dynamic;//00422EEC
    procedure Updating; dynamic;//00422EE0
    procedure sub_00422EDC; dynamic;//00422EDC
    procedure sub_00422ED4; dynamic;//00422ED4
    procedure sub_00422F04; dynamic;//00422F04
    procedure sub_00422EB8; dynamic;//00422EB8
    procedure sub_00422EB4; dynamic;//00422EB4
    procedure sub_00422EAC; dynamic;//00422EAC
    procedure GetNamePath; dynamic;//00422EBC
    procedure sub_0041ADA4; dynamic;//00422ED0
    procedure FreeNotification(AComponent:TComponent);//00422B78
    procedure ReadLeft(Reader:TReader);//00422BCC
    procedure ReadTop(Reader:TReader);//00422BE0
    procedure WriteLeft(Writer:TWriter);//00422BF4
    procedure WriteTop(Writer:TWriter);//00422C00
    procedure Insert(AComponent:TComponent);//00422C0C
    procedure Remove(AComponent:TComponent);//00422C38
    procedure InsertComponent(AComponent:TComponent);//00422C60
    procedure RemoveComponent(AComponent:TComponent);//00422CB8
    procedure DestroyComponents;//00422CF0
    procedure Destroying;//00422D48
    procedure RemoveNotification(AComponent:TComponent);//00422D84
    procedure RemoveFreeNotification(AComponent:TComponent);//00422DA8
    function FindComponent(const AName:AnsiString):TComponent;//00422FB0
    procedure ChangeName(const NewName:TComponentName);//0042308C
    function GetComponent(AIndex:Integer):TComponent;//004230A0
    function GetComponentCount:Integer;//004230CC
    procedure SetComponentIndex(Value:Integer);//004230DC
    procedure SetDesigning(Value:Boolean; SetChildren:Boolean);//00423130
    procedure SetReference(Enable:Boolean);//00423180
    function _AddRef:Integer; stdcall;//00423278
    function _Release:Integer; stdcall;//00423298
  end;
  TBasicActionLink = class(TObject)
  public
    FOnChange:TNotifyEvent;//f8
    FAction:TBasicAction;//f10
    destructor Destroy; virtual;//00423304
    procedure v0; virtual;//v0//00423300
    procedure Change; virtual;//v4//00423338
    function IsOnExecuteLinked:Boolean; virtual;//v8//00423398
    procedure SetAction(Value:TBasicAction); virtual;//vC//0042336C
    procedure v10; virtual;//v10//0042339C
    constructor Create(AClient:TObject); virtual;//v14//004232BC
    function Execute(AComponent:TComponent):Boolean; virtual;//v18//00423350
    function Update:Boolean; virtual;//v1C//004233A4
  end;
  TBasicAction = class(TComponent)
  public
    FActionComponent:TComponent;//f30
    FOnChange:TNotifyEvent;//f38
    FOnExecute:TNotifyEvent;//f40
    FOnUpdate:TNotifyEvent;//f48
    FClients:TList;//f50
    destructor Destroy; virtual;//004233F4
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00423454
    constructor Create(AOwner:TComponent); virtual;//v2C//004233B0
    procedure Change; virtual;//v30//00423514
    procedure SetOnExecute(Value:TNotifyEvent); virtual;//v34//004234B8
    //function v38:?; virtual;//v38//0042344C
    procedure v3C; virtual;//v3C//0042347C
    procedure v40; virtual;//v40//00423450
    function Update:Boolean; virtual;//v44//0042349C
    procedure Execute; dynamic;//00423480
    procedure RegisterChanges(Value:TBasicActionLink);//00423528
    procedure UnRegisterChanges(Value:TBasicActionLink);//00423534
    procedure SetActionComponent(const Value:TComponent);//00423574
  end;
  TIdentMapEntry = TIdentMapEntry = record//size=0x8
f4:String;//f4
end;;
  TRegGroup = class(TObject)
  public
    FClassList:TList;//f4
    FAliasList:TStringList;//f8
    FGroupClasses:TList;//fC
    FActive:Boolean;//f10
    procedure AddClass(AClass:TPersistentClass);//00419080
    function BestClass(AClass:TPersistentClass):TPersistentClass;//0041908C
    function BestGroup(Group1:TRegGroup; Group2:TRegGroup; AClass:TPersistentClass):TRegGroup;//004190EC
    constructor Create(AClass:TPersistentClass);//0041915C
    destructor Destroy;//004191D8
    function GetClass(const AClassName:AnsiString):TPersistentClass;//00419218
    function InGroup(AClass:TPersistentClass):Boolean;//00419278
    procedure RegisterClass(AClass:TPersistentClass);//004192BC
    function Registered(AClass:TPersistentClass):Boolean;//00419364
    procedure UnregisterModuleClasses(Module:HMODULE);//0041939C
  end;
  TRegGroups = class(TObject)
  public
    FGroups:TList;//f4
    FLock:TRTLCriticalSection;//f8
    FActiveClass:TPersistentClass;//f20
    procedure Activate(AClass:TPersistentClass);//00419440
    constructor Create;//0041948C
    destructor Destroy;//00419500
    function FindGroup(AClass:TPersistentClass):TRegGroup;//0041955C
    function GetClass(const AClassName:AnsiString):TPersistentClass;//004195A0
    procedure GroupWith(AClass:TPersistentClass; AGroupClass:TPersistentClass);//00419674
    procedure Lock;//0041973C
    procedure RegisterClass(AClass:TPersistentClass);//00419748
    function Registered(AClass:TPersistentClass):Boolean;//00419760
    procedure StartGroup(AClass:TPersistentClass);//004197A4
    procedure Unlock;//004197F4
    procedure UnregisterModuleClasses(Module:HMODULE);//00419800
  end;
  TIntConst = class(TObject)
  public
    IntegerType:PTypeInfo;//f4
    IdentToInt:TIdentToInt;//f8
    IntToIdent:TIntToIdent;//fC
    constructor Create(AIntegerType:PTypeInfo; AIdentToInt:TIdentToInt; AIntToIdent:TIntToIdent);//00419D64
  end;
  TPropFixup = class(TObject)
  public
    FInstance:TPersistent;//f4
    FInstanceRoot:TComponent;//f8
    FPropInfo:PPropInfo;//fC
    FRootName:String;//f10
    FName:String;//f14
    procedure ResolveReference(Reference:Pointer); virtual;//v0//0041D7F4
    constructor Create(Instance:TPersistent; InstanceRoot:TComponent; PropInfo:PPropInfo; const RootName:AnsiString; const Name:AnsiString);//0041D754
    function MakeGlobalReference:Boolean;//0041D7AC
  end;
  TPropIntfFixup = class(TPropFixup)
  public
    procedure ResolveReference(Reference:Pointer); virtual;//v0//0041D804
  end;
  .06 = array of ?;
//elSize = 4;
    function Point(AX:Integer; AY:Integer):TPoint;//00418F44
    function SmallPoint(AX:Smallint; AY:Smallint):TSmallPoint;//00418F5C
    function Bounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer):TRect;//00418F6C
    function Rect(ALeft:Integer; ATop:Integer; ARight:Integer; ABottom:Integer):TRect;//00418F94
    function InvalidPoint(const At:TPoint):Boolean;//00418FBC
    function PointerInModule(Ptr:Pointer; Module:HMODULE):Boolean;//0041937C
    //procedure sub_004195E4(?:?);//004195E4
    function GetFieldClassTable(AClass:TClass):PFieldClassTable;//00419A34
    procedure ClassNotFound(const ClassName:AnsiString);//00419A40
    function GetClass(const AClassName:AnsiString):TPersistentClass;//00419AAC
    function FindClass(const ClassName:AnsiString):TPersistentClass;//00419B00
    procedure RegisterClass(AClass:TPersistentClass);//00419B20
    //procedure RegisterClasses(AClasses:array[$0..-$1] of TPersistentClass; const _Dv_:?);//00419B90
    procedure UnRegisterModuleClasses(Module:HMODULE);//00419BC4
    procedure StartClassGroup(AClass:TPersistentClass);//00419C10
    procedure GroupDescendentsWith(AClass:TPersistentClass; AClassGroup:TPersistentClass);//00419C5C
    function ActivateClassGroup(AClass:TPersistentClass):TPersistentClass;//00419CB0
    procedure RegisterIntegerConsts(AIntegerType:Pointer; AIdentToInt:TIdentToInt; AIntToIdent:TIntToIdent);//00419D9C
    function FindIntToIdent(AIntegerType:Pointer):TIntToIdent;//00419DC8
    function FindIdentToInt(AIntegerType:Pointer):TIdentToInt;//00419E44
    //function IdentToInt(const Ident:AnsiString; var Int:Longint; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:?):Boolean;//00419EC0
    //function IntToIdent(Int:Longint; var Ident:AnsiString; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:?):Boolean;//00419F00
    procedure RegisterFindGlobalComponentProc(AFindGlobalComponent:TFindGlobalComponent);//00419F44
    procedure UnregisterFindGlobalComponentProc(AFindGlobalComponent:TFindGlobalComponent);//00419F84
    function FindGlobalComponent(const Name:AnsiString):TComponent;//00419F9C
    function IsUniqueGlobalComponentName(const Name:AnsiString):Boolean;//00419FDC
    function InternalReadComponentRes(const ResName:AnsiString; HInst:THandle; var Instance:TComponent):Boolean;//0041A000
    procedure BeginGlobalLoading;//0041A084
    procedure NotifyGlobalLoading;//0041A0DC
    procedure EndGlobalLoading;//0041A10C
    function InitComponent(ClassType:TClass):Boolean;//0041A168
    function InitInheritedComponent(Instance:TComponent; RootAncestor:TClass):Boolean;//0041A210
    procedure WriteCollection(Stream:TStream; Collection:TCollection; CollectionOwner:TComponent);//0041A2D4
    function CollectionsEqual(C1:TCollection; C2:TCollection; Owner1:TComponent; Owner2:TComponent):Boolean;//0041A340
    destructor Destroy;//0041A460
    procedure Clear;//0041A4B4
    function ReturnAddr:Pointer;//0041A52C
    procedure Error(const Msg:AnsiString; Data:Integer);//0041A530
    procedure Grow;//0041A604
    procedure Notify(Ptr:Pointer; Action:TListNotification);//0041A870
    function Min(X:Integer; Y:Integer):Integer;//0041AA84
    destructor Destroy;//0041ABD8
    procedure Assign(Source:TPersistent);//0041AC04
    procedure AssignTo(Dest:TPersistent);//0041ACE8
    procedure sub_0041ACF0;//0041ACF0
    procedure GetNamePath;//0041ACF4
    procedure sub_0041ADA4;//0041ADA4
    procedure AfterConstruction;//0041ADA8
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//0041AE38
    procedure GetDesigner(Obj:TPersistent; var Result:IDesignerNotify);//0041AE60
    procedure NotifyDesigner(Self:TPersistent; Item:TPersistent; Operation:TOperation);//0041AEF8
    constructor Create(Collection:TCollection);//0041AF5C
    destructor Destroy;//0041AF94
    function GetDisplayName:AnsiString;//0041B000
    procedure GetNamePath;//0041B028
    procedure sub_0041ADA4;//0041B0DC
    procedure SetCollection(Value:TCollection);//0041B0E0
    procedure SetDisplayName(const Value:AnsiString);//0041B108
    procedure SetIndex(Value:Integer);//0041B110
    destructor Destroy;//0041B18C
    procedure Assign(Source:TPersistent);//0041B1F8
    procedure sub_0041B290;//0041B290
    procedure EndUpdate;//0041B30C
    procedure sub_0041B318;//0041B318
    procedure GetAttr(Index:Integer);//0041B31C
    procedure GetItemAttr(Index:Integer; ItemIndex:Integer);//0041B328
    procedure GetNamePath;//0041B364
    procedure sub_0041B604;//0041B604
    procedure sub_0041B608;//0041B608
    procedure sub_0041B60C;//0041B60C
    procedure sub_0041B610;//0041B610
    procedure Notify(Item:TCollectionItem; Action:TCollectionNotification);//0041B614
    procedure sub_0041ADA4;//0041B67C
    destructor Destroy;//0041B680
    function Add(const S:AnsiString):Integer;//0041B6B0
    function AddObject(const S:AnsiString; AObject:TObject):Integer;//0041B6D4
    procedure AddStrings(Strings:TStrings);//0041B6F8
    procedure Assign(Source:TPersistent);//0041B7B0
    function DoWrite:Boolean;//0041B860
    procedure DefineProperties(Filer:TFiler);//0041B8B8
    //function sub_0041B9C0:?;//0041B9C0
    procedure Exchange(Index1:Integer; Index2:Integer);//0041BA54
    procedure sub_0041BB3C;//0041BB3C
    //function sub_0041BB44:?;//0041BB44
    function GetText:PChar;//0041BB48
    function GetTextStr:AnsiString;//0041BB9C
    function IndexOf(const S:AnsiString):Integer;//0041BD50
    function IndexOfName(const Name:AnsiString):Integer;//0041BDDC
    function IndexOfObject(AObject:TObject):Integer;//0041BEB0
    procedure InsertObject(Index:Integer; const S:AnsiString; AObject:TObject);//0041BEE4
    procedure LoadFromFile(const FileName:AnsiString);//0041BF14
    procedure LoadFromStream(Stream:TStream);//0041BF68
    procedure Move(CurIndex:Integer; NewIndex:Integer);//0041C014
    procedure Put(Index:Integer; const S:AnsiString);//0041C0C4
    procedure sub_0041C0F8;//0041C0F8
    procedure SaveToFile(const FileName:AnsiString);//0041C1AC
    procedure SaveToStream(Stream:TStream);//0041C204
    procedure sub_0041C260;//0041C260
    procedure SetText(Text:PChar);//0041C298
    procedure SetTextStr(const Value:AnsiString);//0041C2E8
    procedure sub_0041C3A8;//0041C3A8
    function CompareStrings(const S1:AnsiString; const S2:AnsiString):Integer;//0041C430
    destructor Destroy;//0041C470
    function Add(const S:AnsiString):Integer;//0041C4CC
    function AddObject(const S:AnsiString; AObject:TObject):Integer;//0041C4D8
    procedure Changed;//0041C53C
    procedure Changing;//0041C558
    procedure Clear;//0041C574
    procedure Delete(Index:Integer);//0041C5B4
    procedure Exchange(Index1:Integer; Index2:Integer);//0041C620
    function Find(const S:AnsiString; var Index:Integer):Boolean;//0041C6A0
    function Get(Index:Integer):AnsiString;//0041C718
    //function sub_0041C74C:?;//0041C74C
    //function sub_0041C750:?;//0041C750
    function GetObject(Index:Integer):TObject;//0041C754
    function IndexOf(const S:AnsiString):Integer;//0041C7B0
    procedure Insert(Index:Integer; const S:AnsiString);//0041C7EC
    procedure InsertObject(Index:Integer; const S:AnsiString; AObject:TObject);//0041C7FC
    procedure InsertItem(Index:Integer; const S:AnsiString; AObject:TObject);//0041C850
    procedure Put(Index:Integer; const S:AnsiString);//0041C8C8
    procedure PutObject(Index:Integer; AObject:TObject);//0041C924
    procedure SetCapacity(NewCapacity:Integer);//0041C9F8
    procedure SetUpdateState(Updating:Boolean);//0041CA34
    function StringListCompareStrings(List:TStringList; Index1:Integer; Index2:Integer):Integer;//0041CA4C
    procedure Sort;//0041CA60
    procedure CustomSort(Compare:TStringListSortCompare);//0041CA70
    function CompareStrings(const S1:AnsiString; const S2:AnsiString):Integer;//0041CAA8
    function GetSize:Int64;//0041CAF8
    procedure sub_0041CB44;//0041CB44
    procedure SetSize(const NewSize:Int64);//0041CB5C
    procedure RaiseException;//0041CBB0
    function Seek(Offset:Longint; Origin:Word):Longint;//0041CBFC
    function Seek(Origin:TSeekOrigin; const Offset:Int64):Int64;//0041CC80
    function Read(var Buffer:void ; Count:Longint):Longint;//0041CEF0
    function Write(const Buffer:void ; Count:Longint):Longint;//0041CF00
    function Seek(Origin:TSeekOrigin; const Offset:Int64):Int64;//0041CF10
    procedure SetSize(NewSize:Longint);//0041CF3C
    procedure SetSize(const NewSize:Int64);//0041CF50
    destructor Destroy;//0041D110
    function Read(var Buffer:void ; Count:Longint):Longint;//0041D14C
    function Seek(Offset:Longint; Origin:Word):Longint;//0041D184
    destructor Destroy;//0041D1A8
    procedure RemoveFixups(Instance:TPersistent);//0041D1D4
    procedure SetSize(NewSize:Longint);//0041D24C
    function Realloc(var NewCapacity:Longint):Pointer;//0041D278
    function Write(const Buffer:void ; Count:Longint):Longint;//0041D304
    function Read(var Buffer:void ; Count:Longint):Longint;//0041D398
    function Write(const Buffer:void ; Count:Longint):Longint;//0041D3D8
    function Seek(Offset:Longint; Origin:Word):Longint;//0041D410
    procedure SetSize(NewSize:Longint);//0041D468
    //procedure sub_0041D4DC(?:?);//0041D4DC
    destructor Destroy;//0041D5B8
    function Write(const Buffer:void ; Count:Longint):Longint;//0041D5F0
    destructor Destroy;//0041D650
    procedure SetRoot(Value:TComponent);//0041D678
    procedure ResolveReference(Reference:Pointer);//0041D7F4
    procedure ResolveReference(Reference:Pointer);//0041D804
    function FindNestedComponent(Root:TComponent; const NamePath:AnsiString):TComponent;//0041D888
    procedure AddFinished(Instance:TPersistent);//0041D950
    procedure AddNotFinished(Instance:TPersistent);//0041D988
    procedure GlobalFixupReferences;//0041D9D0
    procedure RemoveFixupReferences(Root:TComponent; const RootName:AnsiString);//0041DB78
    procedure ReadError(Ident:PResStringRec);//0041DCA8
    procedure PropValueError;//0041DCC0
    procedure PropertyNotFound(const Name:AnsiString);//0041DCCC
    function EnumValue(EnumType:PTypeInfo; const EnumName:AnsiString):Integer;//0041DCF8
    destructor Destroy;//0041DD10
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);//0041DD70
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);//0041DDA4
    function Error(const Message:AnsiString):Boolean;//0041DE94
    function FindMethod(Root:TComponent; const MethodName:AnsiString):Pointer;//0041DEB4
    procedure RemoveGlobalFixup(Fixup:TPropFixup);//0041DF1C
    procedure FlushBuffer;//0041E0B8
    procedure AddSubComponentsToLoaded(Component:TComponent);//0041E3AC
    procedure CheckSubComponents(Component:TComponent);//0041E3E8
    procedure SetSubComponentState(State:TComponentState; Add:Boolean);//0041E460
    function ComponentCreated:Boolean;//0041E4C8
    function Recover(var Component:TComponent):Boolean;//0041E4E8
    procedure CreateComponent;//0041E548
    procedure SetCompName;//0041E658
    procedure FindExistingComponent;//0041E6F8
    procedure ReadPrefix(var Flags:TFilerFlags; var AChildPos:Integer);//0041EDF4
    procedure HandleException(E:Exception);//0041EE34
    procedure PropPathError;//0041EF34
    procedure SetIntIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);//0041F130
    procedure SetObjectIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);//0041F178
    procedure SetVariantReference;//0041F1B8
    procedure SetInterfaceReference;//0041F214
    function FindUniqueName(const Name:AnsiString):AnsiString;//0041F5DC
    procedure SkipList;//0041FC80
    procedure SkipBinary(BytesPerUnit:Integer);//0041FCA8
    procedure SkipCollection;//0041FCD8
    function FindAncestorComponent(const Name:AnsiString; ComponentClass:TPersistentClass):TComponent;//0041FFC0
    procedure ReferenceName(var Name:AnsiString);//00420078
    procedure SetName(Component:TComponent; var Name:AnsiString);//00420090
    function ReadCustomVariant:Variant;//00420174
    destructor Destroy;//00420544
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);//0042057C
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);//004205A4
    procedure FlushBuffer;//004205E0
    procedure SetRoot(Value:TComponent);//00420624
    function FindAncestor(const Name:AnsiString):TComponent;//0042082C
    procedure WriteData(Instance:TComponent);//004209D0
    function AncestorIsValid(Ancestor:TPersistent; Root:TComponent; RootAncestor:TComponent):Boolean;//0042110C
    function IsDefaultOrdProp:Boolean;//0042113C
    function IsDefaultFloatProp:Boolean;//00421194
    function IsDefaultInt64Prop:Boolean;//004211F0
    function IsDefaultStrProp:Boolean;//00421248
    function ObjectAncestorMatch(AncestorValue:TComponent; Value:TComponent):Boolean;//004212D8
    function IsDefault:Boolean;//00421318
    function IsDefaultObjectProp:Boolean;//00421370
    function IsDefaultValue:Boolean;//004213F0
    function IsDefaultInterfaceProp:Boolean;//004214BC
    function IsDefaultMethodProp:Boolean;//00421598
    function IsDefaultVariantProp:Boolean;//00421610
    function IsDefaultPropertyValue(Instance:TObject; PropInfo:PPropInfo; OnGetLookupInfo:TGetLookupInfoEvent):Boolean;//004216A8
    procedure WritePropPath;//00421810
    procedure WriteSet(Value:Longint);//00421864
    procedure WriteIntProp(IntType:PTypeInfo; Value:Longint);//004218F8
    procedure WriteCollectionProp(Collection:TCollection);//00421964
    procedure WriteOrdProp;//00421A08
    procedure WriteFloatProp;//00421AC8
    procedure WriteInt64Prop;//00421B08
    procedure WriteStrProp;//00421B44
    function OwnedBy(Component:TComponent; Owner:TComponent):Boolean;//00421BA4
    function GetComponentValue(Component:TComponent):AnsiString;//00421BBC
    procedure WriteObjectProp;//00421CE4
    procedure WriteInterfaceProp;//00421EF0
    procedure WriteMethodProp;//00421FCC
    procedure WriteVariantProp;//00422074
    procedure InitThreadSynchronization;//00422894
    procedure DoneThreadSynchronization;//004228C8
    procedure ResetSyncEvent;//004228E0
    procedure WaitForSyncEvent(Timeout:Integer);//004228EC
    function CheckSynchronize(Timeout:Integer):Boolean;//00422908
    constructor Create(AOwner:TComponent);//00422AA8
    destructor Destroy;//00422AF4
    procedure BeforeDestruction;//00422B6C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00422DC4
    procedure DefineProperties(Filer:TFiler);//00422E20
    procedure HasParent;//00422EA8
    procedure sub_00422EAC;//00422EAC
    procedure sub_00422EB4;//00422EB4
    procedure sub_00422EB8;//00422EB8
    procedure GetNamePath;//00422EBC
    procedure sub_0041ADA4;//00422ED0
    procedure sub_00422ED4;//00422ED4
    procedure GetParentComponent;//00422ED8
    procedure sub_00422EDC;//00422EDC
    procedure Updating;//00422EE0
    procedure Updated;//00422EEC
    procedure Loaded;//00422EF8
    procedure sub_00422F04;//00422F04
    procedure ReadState(Reader:TReader);//00422F08
    //procedure sub_00422F10(?:?);//00422F10
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);//00422F18
    procedure ValidateContainer(AComponent:TComponent);//00422F98
    procedure sub_00422FAC;//00422FAC
    procedure SetName(const NewName:TComponentName);//00423000
    procedure ExecuteAction(Action:TBasicAction);//004231C8
    procedure UpdateAction(Action:TBasicAction);//004231F0
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;//00423218
    procedure sub_00423230;//00423230
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//00423238
    procedure sub_004232B8;//004232B8
    constructor Create(AClient:TObject);//004232BC
    procedure sub_00423300;//00423300
    destructor Destroy;//00423304
    procedure Change;//00423338
    function Execute(AComponent:TComponent):Boolean;//00423350
    procedure SetAction(Value:TBasicAction);//0042336C
    function IsOnExecuteLinked:Boolean;//00423398
    procedure sub_0042339C;//0042339C
    function Update:Boolean;//004233A4
    constructor Create(AOwner:TComponent);//004233B0
    destructor Destroy;//004233F4
    //function sub_0042344C:?;//0042344C
    procedure sub_00423450;//00423450
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00423454
    procedure sub_0042347C;//0042347C
    procedure Execute;//00423480
    function Update:Boolean;//0042349C
    procedure SetOnExecute(Value:TNotifyEvent);//004234B8
    procedure Change;//00423514
    destructor Destroy;//004235E8
    function Read(pv:Pointer; cb:Longint; pcbRead:PLongint):HRESULT; stdcall;//00423620
    function Write(pv:Pointer; cb:Longint; pcbWritten:PLongint):HRESULT; stdcall;//00423688
    function Seek(dlibMove:Largeint; dwOrigin:Longint; var libNewPosition:Largeint):HRESULT; stdcall;//004236F0
    function SetSize(libNewSize:Largeint):HRESULT; stdcall;//00423774
    function CopyTo(stm:IStream; cb:Largeint; var cbRead:Largeint; var cbWritten:Largeint):HRESULT; stdcall;//004237D8
    function Commit(grfCommitFlags:Longint):HRESULT; stdcall;//004239D8
    function Revert:HRESULT; stdcall;//004239E4
    function LockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;//004239F0
    function UnlockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;//004239FC
    function Stat(var statstg:TStatStg; grfStatFlag:Longint):HRESULT; stdcall;//00423A08
    function Clone(var stm:IStream):HRESULT; stdcall;//00423A84
    procedure FreeIntConstList;//00423A9C
    procedure ModuleUnload(Instance:Longint);//00423B08
    function StdWndProc(Window:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;//00423B10
    function CalcJmpOffset(Src:Pointer; Dest:Pointer):Longint;//00423B30
    function MakeObjectInstance(Method:TWndMethod):Pointer;//00423B38
    procedure FreeObjectInstance(ObjectInstance:Pointer);//00423BD0
    procedure _NF__E7C;//00423BE4
    function AllocateHWnd(Method:TWndMethod):HWND;//00423BF4
    procedure DeallocateHWnd(Wnd:HWND);//00423CA8

implementation

//00418F44
function Point(AX:Integer; AY:Integer):TPoint;
begin
{*
 00418F44    push        ebx
 00418F45    push        esi
 00418F46    push        edi
 00418F47    mov         edi,ecx
 00418F49    mov         esi,edx
 00418F4B    mov         ebx,eax
 00418F4D    mov         ecx,edi
 00418F4F    mov         edx,esi
 00418F51    mov         eax,ebx
 00418F53    call        004068F8
 00418F58    pop         edi
 00418F59    pop         esi
 00418F5A    pop         ebx
 00418F5B    ret
*}
end;

//00418F5C
function SmallPoint(AX:Smallint; AY:Smallint):TSmallPoint;
begin
{*
 00418F5C    push        ecx
 00418F5D    mov         word ptr [esp],ax
 00418F61    mov         word ptr [esp+2],dx
 00418F66    mov         eax,dword ptr [esp]
 00418F69    pop         edx
 00418F6A    ret
*}
end;

//00418F6C
function Bounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer):TRect;
begin
{*
 00418F6C    push        ebp
 00418F6D    mov         ebp,esp
 00418F6F    push        ebx
 00418F70    push        esi
 00418F71    push        edi
 00418F72    mov         edi,ecx
 00418F74    mov         esi,edx
 00418F76    mov         ebx,eax
 00418F78    mov         eax,dword ptr [ebp+0C]
 00418F7B    push        eax
 00418F7C    mov         eax,dword ptr [ebp+8]
 00418F7F    push        eax
 00418F80    mov         ecx,edi
 00418F82    mov         edx,esi
 00418F84    mov         eax,ebx
 00418F86    call        004068DC
 00418F8B    pop         edi
 00418F8C    pop         esi
 00418F8D    pop         ebx
 00418F8E    pop         ebp
 00418F8F    ret         8
*}
end;

//00418F94
function Rect(ALeft:Integer; ATop:Integer; ARight:Integer; ABottom:Integer):TRect;
begin
{*
 00418F94    push        ebp
 00418F95    mov         ebp,esp
 00418F97    push        ebx
 00418F98    push        esi
 00418F99    push        edi
 00418F9A    mov         edi,ecx
 00418F9C    mov         esi,edx
 00418F9E    mov         ebx,eax
 00418FA0    mov         eax,dword ptr [ebp+0C]
 00418FA3    push        eax
 00418FA4    mov         eax,dword ptr [ebp+8]
 00418FA7    push        eax
 00418FA8    mov         ecx,edi
 00418FAA    mov         edx,esi
 00418FAC    mov         eax,ebx
 00418FAE    call        00406900
 00418FB3    pop         edi
 00418FB4    pop         esi
 00418FB5    pop         ebx
 00418FB6    pop         ebp
 00418FB7    ret         8
*}
end;

//00418FBC
function InvalidPoint(const At:TPoint):Boolean;
begin
{*
 00418FBC    cmp         dword ptr [eax],0FFFFFFFF
>00418FBF    jne         00418FC7
 00418FC1    cmp         dword ptr [eax+4],0FFFFFFFF
>00418FC5    je          00418FCA
 00418FC7    xor         eax,eax
 00418FC9    ret
 00418FCA    mov         al,1
 00418FCC    ret
*}
end;

//00419080
procedure TRegGroup.AddClass(AClass:TPersistentClass);
begin
{*
 00419080    mov         eax,dword ptr [eax+0C]
 00419083    call        TList.Add
 00419088    ret
*}
end;

//0041908C
function TRegGroup.BestClass(AClass:TPersistentClass):TPersistentClass;
begin
{*
 0041908C    push        ebx
 0041908D    push        esi
 0041908E    push        edi
 0041908F    push        ebp
 00419090    add         esp,0FFFFFFF8
 00419093    mov         dword ptr [esp+4],edx
 00419097    mov         dword ptr [esp],eax
 0041909A    xor         ebp,ebp
 0041909C    mov         eax,dword ptr [esp]
 0041909F    mov         eax,dword ptr [eax+0C]
 004190A2    mov         esi,dword ptr [eax+8]
 004190A5    dec         esi
 004190A6    test        esi,esi
>004190A8    jl          004190E2
 004190AA    inc         esi
 004190AB    xor         edi,edi
 004190AD    mov         eax,dword ptr [esp]
 004190B0    mov         eax,dword ptr [eax+0C]
 004190B3    mov         edx,edi
 004190B5    call        TList.Get
 004190BA    mov         ebx,eax
 004190BC    mov         edx,ebx
 004190BE    mov         eax,dword ptr [esp+4]
 004190C2    call        TObject.InheritsFrom
 004190C7    test        al,al
>004190C9    je          004190DE
 004190CB    test        ebp,ebp
>004190CD    je          004190DC
 004190CF    mov         edx,ebp
 004190D1    mov         eax,ebx
 004190D3    call        TObject.InheritsFrom
 004190D8    test        al,al
>004190DA    je          004190DE
 004190DC    mov         ebp,ebx
 004190DE    inc         edi
 004190DF    dec         esi
>004190E0    jne         004190AD
 004190E2    mov         eax,ebp
 004190E4    pop         ecx
 004190E5    pop         edx
 004190E6    pop         ebp
 004190E7    pop         edi
 004190E8    pop         esi
 004190E9    pop         ebx
 004190EA    ret
*}
end;

//004190EC
function TRegGroup.BestGroup(Group1:TRegGroup; Group2:TRegGroup; AClass:TPersistentClass):TRegGroup;
begin
{*
 004190EC    push        ebp
 004190ED    mov         ebp,esp
 004190EF    push        ecx
 004190F0    push        ebx
 004190F1    push        esi
 004190F2    push        edi
 004190F3    mov         dword ptr [ebp-4],ecx
 004190F6    mov         edi,edx
 004190F8    mov         ebx,dword ptr [ebp+8]
 004190FB    test        edi,edi
>004190FD    je          0041910C
 004190FF    mov         edx,ebx
 00419101    mov         eax,edi
 00419103    call        TRegGroup.BestClass
 00419108    mov         esi,eax
>0041910A    jmp         0041910E
 0041910C    xor         esi,esi
 0041910E    cmp         dword ptr [ebp-4],0
>00419112    je          00419122
 00419114    mov         edx,ebx
 00419116    mov         eax,dword ptr [ebp-4]
 00419119    call        TRegGroup.BestClass
 0041911E    mov         ebx,eax
>00419120    jmp         00419124
 00419122    xor         ebx,ebx
 00419124    test        esi,esi
>00419126    jne         00419135
 00419128    test        ebx,ebx
>0041912A    jne         00419130
 0041912C    xor         eax,eax
>0041912E    jmp         00419151
 00419130    mov         eax,dword ptr [ebp-4]
>00419133    jmp         00419151
 00419135    test        ebx,ebx
>00419137    jne         0041913D
 00419139    mov         eax,edi
>0041913B    jmp         00419151
 0041913D    mov         edx,ebx
 0041913F    mov         eax,esi
 00419141    call        TObject.InheritsFrom
 00419146    test        al,al
>00419148    je          0041914E
 0041914A    mov         eax,edi
>0041914C    jmp         00419151
 0041914E    mov         eax,dword ptr [ebp-4]
 00419151    pop         edi
 00419152    pop         esi
 00419153    pop         ebx
 00419154    pop         ecx
 00419155    pop         ebp
 00419156    ret         4
*}
end;

//0041915C
constructor TRegGroup.Create(AClass:TPersistentClass);
begin
{*
 0041915C    push        ebp
 0041915D    mov         ebp,esp
 0041915F    push        ecx
 00419160    push        ebx
 00419161    push        esi
 00419162    push        edi
 00419163    test        dl,dl
>00419165    je          0041916F
 00419167    add         esp,0FFFFFFF0
 0041916A    call        @ClassCreate
 0041916F    mov         edi,ecx
 00419171    mov         byte ptr [ebp-1],dl
 00419174    mov         ebx,eax
 00419176    xor         edx,edx
 00419178    mov         eax,ebx
 0041917A    call        TObject.Create
 0041917F    mov         dl,1
 00419181    mov         eax,[00417CEC];TList
 00419186    call        TObject.Create
 0041918B    mov         dword ptr [ebx+4],eax
 0041918E    mov         dl,1
 00419190    mov         eax,[00418350];TStringList
 00419195    call        TObject.Create
 0041919A    mov         dword ptr [ebx+8],eax
 0041919D    mov         dl,1
 0041919F    mov         eax,[00417CEC];TList
 004191A4    call        TObject.Create
 004191A9    mov         esi,eax
 004191AB    mov         dword ptr [ebx+0C],esi
 004191AE    mov         eax,esi
 004191B0    mov         edx,edi
 004191B2    call        TList.Add
 004191B7    mov         eax,ebx
 004191B9    cmp         byte ptr [ebp-1],0
>004191BD    je          004191CE
 004191BF    call        @AfterConstruction
 004191C4    pop         dword ptr fs:[0]
 004191CB    add         esp,0C
 004191CE    mov         eax,ebx
 004191D0    pop         edi
 004191D1    pop         esi
 004191D2    pop         ebx
 004191D3    pop         ecx
 004191D4    pop         ebp
 004191D5    ret
*}
end;

//004191D8
destructor TRegGroup.Destroy;
begin
{*
 004191D8    push        ebx
 004191D9    push        esi
 004191DA    call        @BeforeDestruction
 004191DF    mov         ebx,edx
 004191E1    mov         esi,eax
 004191E3    mov         edx,ebx
 004191E5    and         dl,0FC
 004191E8    mov         eax,esi
 004191EA    call        TObject.Destroy
 004191EF    mov         eax,dword ptr [esi+4]
 004191F2    call        TObject.Free
 004191F7    mov         eax,dword ptr [esi+8]
 004191FA    call        TObject.Free
 004191FF    mov         eax,dword ptr [esi+0C]
 00419202    call        TObject.Free
 00419207    test        bl,bl
>00419209    jle         00419212
 0041920B    mov         eax,esi
 0041920D    call        @ClassDestroy
 00419212    pop         esi
 00419213    pop         ebx
 00419214    ret
*}
end;

//00419218
function TRegGroup.GetClass(const AClassName:AnsiString):TPersistentClass;
begin
{*
 00419218    push        ebx
 00419219    push        esi
 0041921A    push        edi
 0041921B    push        ebp
 0041921C    push        ecx
 0041921D    mov         dword ptr [esp],edx
 00419220    mov         ebp,eax
 00419222    mov         eax,dword ptr [ebp+4]
 00419225    mov         esi,dword ptr [eax+8]
 00419228    dec         esi
 00419229    test        esi,esi
>0041922B    jl          0041924E
 0041922D    inc         esi
 0041922E    xor         ebx,ebx
 00419230    mov         eax,dword ptr [ebp+4]
 00419233    mov         edx,ebx
 00419235    call        TList.Get
 0041923A    mov         edi,eax
 0041923C    mov         edx,dword ptr [esp]
 0041923F    mov         eax,edi
 00419241    call        TObject.ClassNameIs
 00419246    test        al,al
>00419248    jne         0041926F
 0041924A    inc         ebx
 0041924B    dec         esi
>0041924C    jne         00419230
 0041924E    mov         eax,dword ptr [ebp+8]
 00419251    mov         edx,dword ptr [esp]
 00419254    mov         ecx,dword ptr [eax]
 00419256    call        dword ptr [ecx+54]
 00419259    mov         ebx,eax
 0041925B    test        ebx,ebx
>0041925D    jl          0041926D
 0041925F    mov         eax,dword ptr [ebp+8]
 00419262    mov         edx,ebx
 00419264    mov         ecx,dword ptr [eax]
 00419266    call        dword ptr [ecx+18]
 00419269    mov         edi,eax
>0041926B    jmp         0041926F
 0041926D    xor         edi,edi
 0041926F    mov         eax,edi
 00419271    pop         edx
 00419272    pop         ebp
 00419273    pop         edi
 00419274    pop         esi
 00419275    pop         ebx
 00419276    ret
*}
end;

//00419278
function TRegGroup.InGroup(AClass:TPersistentClass):Boolean;
begin
{*
 00419278    push        ebx
 00419279    push        esi
 0041927A    push        edi
 0041927B    push        ebp
 0041927C    push        ecx
 0041927D    mov         ebp,edx
 0041927F    mov         edi,eax
 00419281    mov         byte ptr [esp],1
 00419285    mov         eax,dword ptr [edi+0C]
 00419288    mov         ebx,dword ptr [eax+8]
 0041928B    dec         ebx
 0041928C    test        ebx,ebx
>0041928E    jl          004192AE
 00419290    inc         ebx
 00419291    xor         esi,esi
 00419293    mov         eax,dword ptr [edi+0C]
 00419296    mov         edx,esi
 00419298    call        TList.Get
 0041929D    mov         edx,eax
 0041929F    mov         eax,ebp
 004192A1    call        TObject.InheritsFrom
 004192A6    test        al,al
>004192A8    jne         004192B2
 004192AA    inc         esi
 004192AB    dec         ebx
>004192AC    jne         00419293
 004192AE    mov         byte ptr [esp],0
 004192B2    mov         al,byte ptr [esp]
 004192B5    pop         edx
 004192B6    pop         ebp
 004192B7    pop         edi
 004192B8    pop         esi
 004192B9    pop         ebx
 004192BA    ret
*}
end;

//004192BC
procedure TRegGroup.RegisterClass(AClass:TPersistentClass);
begin
{*
 004192BC    push        ebp
 004192BD    mov         ebp,esp
 004192BF    add         esp,0FFFFFEF4
 004192C5    push        ebx
 004192C6    push        esi
 004192C7    xor         ecx,ecx
 004192C9    mov         dword ptr [ebp-4],ecx
 004192CC    mov         esi,edx
 004192CE    mov         ebx,eax
 004192D0    xor         eax,eax
 004192D2    push        ebp
 004192D3    push        419357
 004192D8    push        dword ptr fs:[eax]
 004192DB    mov         dword ptr fs:[eax],esp
 004192DE    lea         edx,[ebp-104]
 004192E4    mov         eax,esi
 004192E6    call        TObject.ClassName
 004192EB    lea         edx,[ebp-104]
 004192F1    lea         eax,[ebp-4]
 004192F4    call        @LStrFromString
 004192F9    mov         edx,dword ptr [ebp-4]
 004192FC    mov         eax,ebx
 004192FE    call        TRegGroup.GetClass
 00419303    test        eax,eax
>00419305    je          00419337
 00419307    mov         eax,dword ptr [ebp-4]
 0041930A    mov         dword ptr [ebp-10C],eax
 00419310    mov         byte ptr [ebp-108],0B
 00419317    lea         eax,[ebp-10C]
 0041931D    push        eax
 0041931E    push        0
 00419320    mov         ecx,dword ptr ds:[5AE5BC];^SDuplicateClass:TResStringRec
 00419326    mov         dl,1
 00419328    mov         eax,[00417904];EFilerError
 0041932D    call        Exception.CreateResFmt
 00419332    call        @RaiseExcept
 00419337    mov         edx,esi
 00419339    mov         eax,dword ptr [ebx+4]
 0041933C    call        TList.Add
 00419341    xor         eax,eax
 00419343    pop         edx
 00419344    pop         ecx
 00419345    pop         ecx
 00419346    mov         dword ptr fs:[eax],edx
 00419349    push        41935E
 0041934E    lea         eax,[ebp-4]
 00419351    call        @LStrClr
 00419356    ret
>00419357    jmp         @HandleFinally
>0041935C    jmp         0041934E
 0041935E    pop         esi
 0041935F    pop         ebx
 00419360    mov         esp,ebp
 00419362    pop         ebp
 00419363    ret
*}
end;

//00419364
function TRegGroup.Registered(AClass:TPersistentClass):Boolean;
begin
{*
 00419364    push        ebx
 00419365    push        esi
 00419366    mov         esi,edx
 00419368    mov         ebx,eax
 0041936A    mov         edx,esi
 0041936C    mov         eax,dword ptr [ebx+4]
 0041936F    call        TList.IndexOf
 00419374    test        eax,eax
 00419376    setge       al
 00419379    pop         esi
 0041937A    pop         ebx
 0041937B    ret
*}
end;

//0041937C
function PointerInModule(Ptr:Pointer; Module:HMODULE):Boolean;
begin
{*
 0041937C    push        ebx
 0041937D    push        esi
 0041937E    mov         ebx,edx
 00419380    mov         esi,eax
 00419382    test        ebx,ebx
>00419384    je          00419396
 00419386    mov         eax,esi
 00419388    call        FindHInstance
 0041938D    cmp         ebx,eax
>0041938F    je          00419396
 00419391    xor         eax,eax
 00419393    pop         esi
 00419394    pop         ebx
 00419395    ret
 00419396    mov         al,1
 00419398    pop         esi
 00419399    pop         ebx
 0041939A    ret
*}
end;

//0041939C
procedure TRegGroup.UnregisterModuleClasses(Module:HMODULE);
begin
{*
 0041939C    push        ebx
 0041939D    push        esi
 0041939E    push        edi
 0041939F    mov         edi,edx
 004193A1    mov         esi,eax
 004193A3    mov         eax,dword ptr [esi+0C]
 004193A6    mov         ebx,dword ptr [eax+8]
 004193A9    dec         ebx
 004193AA    cmp         ebx,0
>004193AD    jl          004193D4
 004193AF    mov         edx,ebx
 004193B1    mov         eax,dword ptr [esi+0C]
 004193B4    call        TList.Get
 004193B9    mov         edx,edi
 004193BB    call        PointerInModule
 004193C0    test        al,al
>004193C2    je          004193CE
 004193C4    mov         edx,ebx
 004193C6    mov         eax,dword ptr [esi+0C]
 004193C9    call        TList.Delete
 004193CE    dec         ebx
 004193CF    cmp         ebx,0FFFFFFFF
>004193D2    jne         004193AF
 004193D4    mov         eax,dword ptr [esi+4]
 004193D7    mov         ebx,dword ptr [eax+8]
 004193DA    dec         ebx
 004193DB    cmp         ebx,0
>004193DE    jl          00419405
 004193E0    mov         edx,ebx
 004193E2    mov         eax,dword ptr [esi+4]
 004193E5    call        TList.Get
 004193EA    mov         edx,edi
 004193EC    call        PointerInModule
 004193F1    test        al,al
>004193F3    je          004193FF
 004193F5    mov         edx,ebx
 004193F7    mov         eax,dword ptr [esi+4]
 004193FA    call        TList.Delete
 004193FF    dec         ebx
 00419400    cmp         ebx,0FFFFFFFF
>00419403    jne         004193E0
 00419405    mov         eax,dword ptr [esi+8]
 00419408    mov         edx,dword ptr [eax]
 0041940A    call        dword ptr [edx+14]
 0041940D    mov         ebx,eax
 0041940F    dec         ebx
 00419410    cmp         ebx,0
>00419413    jl          0041943A
 00419415    mov         edx,ebx
 00419417    mov         eax,dword ptr [esi+8]
 0041941A    mov         ecx,dword ptr [eax]
 0041941C    call        dword ptr [ecx+18]
 0041941F    mov         edx,edi
 00419421    call        PointerInModule
 00419426    test        al,al
>00419428    je          00419434
 0041942A    mov         edx,ebx
 0041942C    mov         eax,dword ptr [esi+8]
 0041942F    mov         ecx,dword ptr [eax]
 00419431    call        dword ptr [ecx+48]
 00419434    dec         ebx
 00419435    cmp         ebx,0FFFFFFFF
>00419438    jne         00419415
 0041943A    pop         edi
 0041943B    pop         esi
 0041943C    pop         ebx
 0041943D    ret
*}
end;

//00419440
procedure TRegGroups.Activate(AClass:TPersistentClass);
begin
{*
 00419440    push        ebx
 00419441    push        esi
 00419442    push        edi
 00419443    push        ebp
 00419444    push        ecx
 00419445    mov         dword ptr [esp],edx
 00419448    mov         edi,eax
 0041944A    mov         eax,dword ptr [edi+20]
 0041944D    cmp         eax,dword ptr [esp]
>00419450    je          00419483
 00419452    mov         eax,dword ptr [esp]
 00419455    mov         dword ptr [edi+20],eax
 00419458    mov         eax,dword ptr [edi+4]
 0041945B    mov         esi,dword ptr [eax+8]
 0041945E    dec         esi
 0041945F    test        esi,esi
>00419461    jl          00419483
 00419463    inc         esi
 00419464    xor         ebp,ebp
 00419466    mov         eax,dword ptr [edi+4]
 00419469    mov         edx,ebp
 0041946B    call        TList.Get
 00419470    mov         ebx,eax
 00419472    mov         edx,dword ptr [esp]
 00419475    mov         eax,ebx
 00419477    call        TRegGroup.InGroup
 0041947C    mov         byte ptr [ebx+10],al
 0041947F    inc         ebp
 00419480    dec         esi
>00419481    jne         00419466
 00419483    pop         edx
 00419484    pop         ebp
 00419485    pop         edi
 00419486    pop         esi
 00419487    pop         ebx
 00419488    ret
*}
end;

//0041948C
constructor TRegGroups.Create;
begin
{*
 0041948C    push        ebx
 0041948D    push        esi
 0041948E    push        edi
 0041948F    test        dl,dl
>00419491    je          0041949B
 00419493    add         esp,0FFFFFFF0
 00419496    call        @ClassCreate
 0041949B    mov         ebx,edx
 0041949D    mov         edi,eax
 0041949F    xor         edx,edx
 004194A1    mov         eax,edi
 004194A3    call        TObject.Create
 004194A8    mov         dl,1
 004194AA    mov         eax,[00417CEC];TList
 004194AF    call        TObject.Create
 004194B4    mov         dword ptr [edi+4],eax
 004194B7    lea         eax,[edi+8]
 004194BA    push        eax
 004194BB    call        KERNEL32.InitializeCriticalSection
 004194C0    mov         ecx,dword ptr ds:[417DFC];TPersistent
 004194C6    mov         dl,1
 004194C8    mov         eax,[00418FD0];TRegGroup
 004194CD    call        TRegGroup.Create
 004194D2    mov         esi,eax
 004194D4    mov         eax,dword ptr [edi+4]
 004194D7    mov         edx,esi
 004194D9    call        TList.Add
 004194DE    mov         byte ptr [esi+10],1
 004194E2    mov         eax,edi
 004194E4    test        bl,bl
>004194E6    je          004194F7
 004194E8    call        @AfterConstruction
 004194ED    pop         dword ptr fs:[0]
 004194F4    add         esp,0C
 004194F7    mov         eax,edi
 004194F9    pop         edi
 004194FA    pop         esi
 004194FB    pop         ebx
 004194FC    ret
*}
end;

//00419500
destructor TRegGroups.Destroy;
begin
{*
 00419500    push        ebx
 00419501    push        esi
 00419502    push        edi
 00419503    push        ebp
 00419504    call        @BeforeDestruction
 00419509    mov         ebx,edx
 0041950B    mov         esi,eax
 0041950D    lea         eax,[esi+8]
 00419510    push        eax
 00419511    call        KERNEL32.DeleteCriticalSection
 00419516    mov         eax,dword ptr [esi+4]
 00419519    mov         ebp,dword ptr [eax+8]
 0041951C    dec         ebp
 0041951D    test        ebp,ebp
>0041951F    jl          00419537
 00419521    inc         ebp
 00419522    xor         edi,edi
 00419524    mov         eax,dword ptr [esi+4]
 00419527    mov         edx,edi
 00419529    call        TList.Get
 0041952E    call        TObject.Free
 00419533    inc         edi
 00419534    dec         ebp
>00419535    jne         00419524
 00419537    mov         eax,dword ptr [esi+4]
 0041953A    call        TObject.Free
 0041953F    mov         edx,ebx
 00419541    and         dl,0FC
 00419544    mov         eax,esi
 00419546    call        TObject.Destroy
 0041954B    test        bl,bl
>0041954D    jle         00419556
 0041954F    mov         eax,esi
 00419551    call        @ClassDestroy
 00419556    pop         ebp
 00419557    pop         edi
 00419558    pop         esi
 00419559    pop         ebx
 0041955A    ret
*}
end;

//0041955C
function TRegGroups.FindGroup(AClass:TPersistentClass):TRegGroup;
begin
{*
 0041955C    push        ebx
 0041955D    push        esi
 0041955E    push        edi
 0041955F    push        ebp
 00419560    push        ecx
 00419561    mov         dword ptr [esp],edx
 00419564    mov         ebp,eax
 00419566    xor         esi,esi
 00419568    mov         eax,dword ptr [ebp+4]
 0041956B    mov         ebx,dword ptr [eax+8]
 0041956E    dec         ebx
 0041956F    test        ebx,ebx
>00419571    jl          00419598
 00419573    inc         ebx
 00419574    xor         edi,edi
 00419576    mov         eax,dword ptr [ebp+4]
 00419579    mov         edx,edi
 0041957B    call        TList.Get
 00419580    mov         edx,dword ptr [esp]
 00419583    push        edx
 00419584    mov         ecx,esi
 00419586    mov         edx,eax
 00419588    mov         eax,[00418FD0];TRegGroup
 0041958D    call        TRegGroup.BestGroup
 00419592    mov         esi,eax
 00419594    inc         edi
 00419595    dec         ebx
>00419596    jne         00419576
 00419598    mov         eax,esi
 0041959A    pop         edx
 0041959B    pop         ebp
 0041959C    pop         edi
 0041959D    pop         esi
 0041959E    pop         ebx
 0041959F    ret
*}
end;

//004195A0
function TRegGroups.GetClass(const AClassName:AnsiString):TPersistentClass;
begin
{*
 004195A0    push        ebx
 004195A1    push        esi
 004195A2    push        edi
 004195A3    push        ebp
 004195A4    push        ecx
 004195A5    mov         dword ptr [esp],edx
 004195A8    mov         ebp,eax
 004195AA    xor         edi,edi
 004195AC    mov         eax,dword ptr [ebp+4]
 004195AF    mov         ebx,dword ptr [eax+8]
 004195B2    dec         ebx
 004195B3    test        ebx,ebx
>004195B5    jl          004195DC
 004195B7    inc         ebx
 004195B8    xor         esi,esi
 004195BA    mov         eax,dword ptr [ebp+4]
 004195BD    mov         edx,esi
 004195BF    call        TList.Get
 004195C4    cmp         byte ptr [eax+10],0
>004195C8    je          004195D4
 004195CA    mov         edx,dword ptr [esp]
 004195CD    call        TRegGroup.GetClass
 004195D2    mov         edi,eax
 004195D4    test        edi,edi
>004195D6    jne         004195DC
 004195D8    inc         esi
 004195D9    dec         ebx
>004195DA    jne         004195BA
 004195DC    mov         eax,edi
 004195DE    pop         edx
 004195DF    pop         ebp
 004195E0    pop         edi
 004195E1    pop         esi
 004195E2    pop         ebx
 004195E3    ret
*}
end;

//004195E4
{*procedure sub_004195E4(?:?);
begin
 004195E4    push        ebp
 004195E5    mov         ebp,esp
 004195E7    add         esp,0FFFFFEF4
 004195ED    xor         eax,eax
 004195EF    mov         dword ptr [ebp-10C],eax
 004195F5    xor         eax,eax
 004195F7    push        ebp
 004195F8    push        419667
 004195FD    push        dword ptr fs:[eax]
 00419600    mov         dword ptr fs:[eax],esp
 00419603    lea         edx,[ebp-108]
 00419609    mov         eax,dword ptr [ebp+8]
 0041960C    mov         eax,dword ptr [eax-4]
 0041960F    call        TObject.ClassName
 00419614    lea         eax,[ebp-108]
 0041961A    mov         dword ptr [ebp-8],eax
 0041961D    mov         byte ptr [ebp-4],4
 00419621    lea         eax,[ebp-8]
 00419624    push        eax
 00419625    push        0
 00419627    lea         edx,[ebp-10C]
 0041962D    mov         eax,[005AE758];^SUnknownGroup:TResStringRec
 00419632    call        LoadStr
 00419637    mov         ecx,dword ptr [ebp-10C]
 0041963D    mov         dl,1
 0041963F    mov         eax,[00417904];EFilerError
 00419644    call        Exception.CreateFmt;EFilerError.Create
 00419649    call        @RaiseExcept
 0041964E    xor         eax,eax
 00419650    pop         edx
 00419651    pop         ecx
 00419652    pop         ecx
 00419653    mov         dword ptr fs:[eax],edx
 00419656    push        41966E
 0041965B    lea         eax,[ebp-10C]
 00419661    call        @LStrClr
 00419666    ret
>00419667    jmp         @HandleFinally
>0041966C    jmp         0041965B
 0041966E    mov         esp,ebp
 00419670    pop         ebp
 00419671    ret
end;*}

//00419674
procedure TRegGroups.GroupWith(AClass:TPersistentClass; AGroupClass:TPersistentClass);
begin
{*
 00419674    push        ebp
 00419675    mov         ebp,esp
 00419677    add         esp,0FFFFFFE8
 0041967A    push        ebx
 0041967B    push        esi
 0041967C    push        edi
 0041967D    mov         dword ptr [ebp-4],ecx
 00419680    mov         dword ptr [ebp-0C],edx
 00419683    mov         dword ptr [ebp-8],eax
 00419686    mov         edx,dword ptr [ebp-4]
 00419689    mov         eax,dword ptr [ebp-8]
 0041968C    call        TRegGroups.FindGroup
 00419691    mov         dword ptr [ebp-10],eax
 00419694    cmp         dword ptr [ebp-10],0
>00419698    jne         004196A1
 0041969A    push        ebp
 0041969B    call        004195E4
 004196A0    pop         ecx
 004196A1    mov         edx,dword ptr [ebp-0C]
 004196A4    mov         eax,dword ptr [ebp-10]
 004196A7    call        TRegGroup.AddClass
 004196AC    mov         eax,dword ptr [ebp-8]
 004196AF    mov         eax,dword ptr [eax+4]
 004196B2    mov         eax,dword ptr [eax+8]
 004196B5    dec         eax
 004196B6    test        eax,eax
>004196B8    jl          00419734
 004196BA    inc         eax
 004196BB    mov         dword ptr [ebp-18],eax
 004196BE    mov         dword ptr [ebp-14],0
 004196C5    mov         eax,dword ptr [ebp-8]
 004196C8    mov         eax,dword ptr [eax+4]
 004196CB    mov         edx,dword ptr [ebp-14]
 004196CE    call        TList.Get
 004196D3    mov         edi,eax
 004196D5    cmp         edi,dword ptr [ebp-10]
>004196D8    je          0041972C
 004196DA    mov         eax,dword ptr [edi+4]
 004196DD    mov         ebx,dword ptr [eax+8]
 004196E0    dec         ebx
 004196E1    cmp         ebx,0
>004196E4    jl          0041972C
 004196E6    mov         eax,dword ptr [edi+4]
 004196E9    mov         edx,ebx
 004196EB    call        TList.Get
 004196F0    mov         esi,eax
 004196F2    mov         edx,dword ptr [ebp-0C]
 004196F5    mov         eax,esi
 004196F7    call        TObject.InheritsFrom
 004196FC    test        al,al
>004196FE    je          00419726
 00419700    mov         edx,esi
 00419702    mov         eax,dword ptr [ebp-8]
 00419705    call        TRegGroups.FindGroup
 0041970A    cmp         eax,dword ptr [ebp-10]
>0041970D    jne         00419726
 0041970F    mov         eax,dword ptr [edi+4]
 00419712    mov         edx,ebx
 00419714    call        TList.Delete
 00419719    mov         eax,dword ptr [ebp-10]
 0041971C    mov         eax,dword ptr [eax+4]
 0041971F    mov         edx,esi
 00419721    call        TList.Add
 00419726    dec         ebx
 00419727    cmp         ebx,0FFFFFFFF
>0041972A    jne         004196E6
 0041972C    inc         dword ptr [ebp-14]
 0041972F    dec         dword ptr [ebp-18]
>00419732    jne         004196C5
 00419734    pop         edi
 00419735    pop         esi
 00419736    pop         ebx
 00419737    mov         esp,ebp
 00419739    pop         ebp
 0041973A    ret
*}
end;

//0041973C
procedure TRegGroups.Lock;
begin
{*
 0041973C    add         eax,8
 0041973F    push        eax
 00419740    call        KERNEL32.EnterCriticalSection
 00419745    ret
*}
end;

//00419748
procedure TRegGroups.RegisterClass(AClass:TPersistentClass);
begin
{*
 00419748    push        ebx
 00419749    mov         ebx,edx
 0041974B    mov         edx,ebx
 0041974D    call        TRegGroups.FindGroup
 00419752    test        eax,eax
>00419754    je          0041975D
 00419756    mov         edx,ebx
 00419758    call        TRegGroup.RegisterClass
 0041975D    pop         ebx
 0041975E    ret
*}
end;

//00419760
function TRegGroups.Registered(AClass:TPersistentClass):Boolean;
begin
{*
 00419760    push        ebx
 00419761    push        esi
 00419762    push        edi
 00419763    push        ebp
 00419764    push        ecx
 00419765    mov         ebp,edx
 00419767    mov         edi,eax
 00419769    mov         byte ptr [esp],1
 0041976D    mov         eax,dword ptr [edi+4]
 00419770    mov         ebx,dword ptr [eax+8]
 00419773    dec         ebx
 00419774    test        ebx,ebx
>00419776    jl          00419794
 00419778    inc         ebx
 00419779    xor         esi,esi
 0041977B    mov         eax,dword ptr [edi+4]
 0041977E    mov         edx,esi
 00419780    call        TList.Get
 00419785    mov         edx,ebp
 00419787    call        TRegGroup.Registered
 0041978C    test        al,al
>0041978E    jne         00419798
 00419790    inc         esi
 00419791    dec         ebx
>00419792    jne         0041977B
 00419794    mov         byte ptr [esp],0
 00419798    mov         al,byte ptr [esp]
 0041979B    pop         edx
 0041979C    pop         ebp
 0041979D    pop         edi
 0041979E    pop         esi
 0041979F    pop         ebx
 004197A0    ret
*}
end;

//004197A4
procedure TRegGroups.StartGroup(AClass:TPersistentClass);
begin
{*
 004197A4    push        ebx
 004197A5    push        esi
 004197A6    push        edi
 004197A7    push        ebp
 004197A8    mov         ebp,edx
 004197AA    mov         edi,eax
 004197AC    mov         eax,dword ptr [edi+4]
 004197AF    mov         ebx,dword ptr [eax+8]
 004197B2    dec         ebx
 004197B3    test        ebx,ebx
>004197B5    jl          004197D6
 004197B7    inc         ebx
 004197B8    xor         esi,esi
 004197BA    mov         eax,dword ptr [edi+4]
 004197BD    mov         edx,esi
 004197BF    call        TList.Get
 004197C4    mov         eax,dword ptr [eax+0C]
 004197C7    mov         edx,ebp
 004197C9    call        TList.IndexOf
 004197CE    test        eax,eax
>004197D0    jge         004197EE
 004197D2    inc         esi
 004197D3    dec         ebx
>004197D4    jne         004197BA
 004197D6    mov         ecx,ebp
 004197D8    mov         dl,1
 004197DA    mov         eax,[00418FD0];TRegGroup
 004197DF    call        TRegGroup.Create
 004197E4    mov         edx,eax
 004197E6    mov         eax,dword ptr [edi+4]
 004197E9    call        TList.Add
 004197EE    pop         ebp
 004197EF    pop         edi
 004197F0    pop         esi
 004197F1    pop         ebx
 004197F2    ret
*}
end;

//004197F4
procedure TRegGroups.Unlock;
begin
{*
 004197F4    add         eax,8
 004197F7    push        eax
 004197F8    call        KERNEL32.LeaveCriticalSection
 004197FD    ret
*}
end;

//00419800
procedure TRegGroups.UnregisterModuleClasses(Module:HMODULE);
begin
{*
 00419800    push        ebx
 00419801    push        esi
 00419802    push        edi
 00419803    push        ebp
 00419804    mov         ebp,edx
 00419806    mov         edi,eax
 00419808    mov         eax,dword ptr [edi+4]
 0041980B    mov         ebx,dword ptr [eax+8]
 0041980E    dec         ebx
 0041980F    cmp         ebx,0
>00419812    jl          00419849
 00419814    mov         eax,dword ptr [edi+4]
 00419817    mov         edx,ebx
 00419819    call        TList.Get
 0041981E    mov         esi,eax
 00419820    mov         edx,ebp
 00419822    mov         eax,esi
 00419824    call        TRegGroup.UnregisterModuleClasses
 00419829    mov         eax,dword ptr [esi+0C]
 0041982C    cmp         dword ptr [eax+8],0
>00419830    jne         00419843
 00419832    mov         eax,esi
 00419834    call        TObject.Free
 00419839    mov         eax,dword ptr [edi+4]
 0041983C    mov         edx,ebx
 0041983E    call        TList.Delete
 00419843    dec         ebx
 00419844    cmp         ebx,0FFFFFFFF
>00419847    jne         00419814
 00419849    pop         ebp
 0041984A    pop         edi
 0041984B    pop         esi
 0041984C    pop         ebx
 0041984D    ret
*}
end;

//00419850
constructor TClassFinder.Create(AClass:TPersistentClass; AIncludeActiveGroups:Boolean);
begin
{*
 00419850    push        ebp
 00419851    mov         ebp,esp
 00419853    add         esp,0FFFFFFF4
 00419856    push        ebx
 00419857    push        esi
 00419858    push        edi
 00419859    test        dl,dl
>0041985B    je          00419865
 0041985D    add         esp,0FFFFFFF0
 00419860    call        @ClassCreate
 00419865    mov         dword ptr [ebp-0C],ecx
 00419868    mov         byte ptr [ebp-5],dl
 0041986B    mov         dword ptr [ebp-4],eax
 0041986E    xor         edx,edx
 00419870    mov         eax,dword ptr [ebp-4]
 00419873    call        TObject.Create
 00419878    mov         dl,1
 0041987A    mov         eax,[00417CEC];TList
 0041987F    call        TObject.Create
 00419884    mov         edx,dword ptr [ebp-4]
 00419887    mov         dword ptr [edx+4],eax
 0041988A    mov         eax,[005E092C];RegGroups:TRegGroups
 0041988F    call        TRegGroups.Lock
 00419894    xor         eax,eax
 00419896    push        ebp
 00419897    push        41994F
 0041989C    push        dword ptr fs:[eax]
 0041989F    mov         dword ptr fs:[eax],esp
 004198A2    cmp         dword ptr [ebp-0C],0
>004198A6    jne         004198B3
 004198A8    mov         eax,[005E092C];RegGroups:TRegGroups
 004198AD    mov         eax,dword ptr [eax+20]
 004198B0    mov         dword ptr [ebp-0C],eax
 004198B3    mov         eax,[005E092C];RegGroups:TRegGroups
 004198B8    mov         eax,dword ptr [eax+4]
 004198BB    mov         esi,dword ptr [eax+8]
 004198BE    dec         esi
 004198BF    test        esi,esi
>004198C1    jl          004198F6
 004198C3    inc         esi
 004198C4    xor         edi,edi
 004198C6    mov         eax,[005E092C];RegGroups:TRegGroups
 004198CB    mov         eax,dword ptr [eax+4]
 004198CE    mov         edx,edi
 004198D0    call        TList.Get
 004198D5    mov         ebx,eax
 004198D7    mov         edx,dword ptr [ebp-0C]
 004198DA    mov         eax,ebx
 004198DC    call        TRegGroup.InGroup
 004198E1    test        al,al
>004198E3    je          004198F2
 004198E5    mov         eax,dword ptr [ebp-4]
 004198E8    mov         eax,dword ptr [eax+4]
 004198EB    mov         edx,ebx
 004198ED    call        TList.Add
 004198F2    inc         edi
 004198F3    dec         esi
>004198F4    jne         004198C6
 004198F6    cmp         byte ptr [ebp+8],0
>004198FA    je          00419937
 004198FC    mov         eax,[005E092C];RegGroups:TRegGroups
 00419901    mov         eax,dword ptr [eax+4]
 00419904    mov         esi,dword ptr [eax+8]
 00419907    dec         esi
 00419908    test        esi,esi
>0041990A    jl          00419937
 0041990C    inc         esi
 0041990D    xor         edi,edi
 0041990F    mov         eax,[005E092C];RegGroups:TRegGroups
 00419914    mov         eax,dword ptr [eax+4]
 00419917    mov         edx,edi
 00419919    call        TList.Get
 0041991E    mov         ebx,eax
 00419920    cmp         byte ptr [ebx+10],0
>00419924    je          00419933
 00419926    mov         eax,dword ptr [ebp-4]
 00419929    mov         eax,dword ptr [eax+4]
 0041992C    mov         edx,ebx
 0041992E    call        TList.Add
 00419933    inc         edi
 00419934    dec         esi
>00419935    jne         0041990F
 00419937    xor         eax,eax
 00419939    pop         edx
 0041993A    pop         ecx
 0041993B    pop         ecx
 0041993C    mov         dword ptr fs:[eax],edx
 0041993F    push        419956
 00419944    mov         eax,[005E092C];RegGroups:TRegGroups
 00419949    call        TRegGroups.Unlock
 0041994E    ret
>0041994F    jmp         @HandleFinally
>00419954    jmp         00419944
 00419956    mov         eax,dword ptr [ebp-4]
 00419959    cmp         byte ptr [ebp-5],0
>0041995D    je          0041996E
 0041995F    call        @AfterConstruction
 00419964    pop         dword ptr fs:[0]
 0041996B    add         esp,0C
 0041996E    mov         eax,dword ptr [ebp-4]
 00419971    pop         edi
 00419972    pop         esi
 00419973    pop         ebx
 00419974    mov         esp,ebp
 00419976    pop         ebp
 00419977    ret         4
*}
end;

//0041997C
destructor TClassFinder.Destroy;
begin
{*
 0041997C    push        ebx
 0041997D    push        esi
 0041997E    call        @BeforeDestruction
 00419983    mov         ebx,edx
 00419985    mov         esi,eax
 00419987    mov         eax,dword ptr [esi+4]
 0041998A    call        TObject.Free
 0041998F    mov         edx,ebx
 00419991    and         dl,0FC
 00419994    mov         eax,esi
 00419996    call        TObject.Destroy
 0041999B    test        bl,bl
>0041999D    jle         004199A6
 0041999F    mov         eax,esi
 004199A1    call        @ClassDestroy
 004199A6    pop         esi
 004199A7    pop         ebx
 004199A8    ret
*}
end;

//004199AC
function TClassFinder.GetClass(const AClassName:AnsiString):TPersistentClass;
begin
{*
 004199AC    push        ebp
 004199AD    mov         ebp,esp
 004199AF    add         esp,0FFFFFFF8
 004199B2    push        ebx
 004199B3    push        esi
 004199B4    push        edi
 004199B5    mov         dword ptr [ebp-4],edx
 004199B8    mov         edi,eax
 004199BA    xor         eax,eax
 004199BC    mov         dword ptr [ebp-8],eax
 004199BF    mov         eax,[005E092C];RegGroups:TRegGroups
 004199C4    call        TRegGroups.Lock
 004199C9    xor         edx,edx
 004199CB    push        ebp
 004199CC    push        419A23
 004199D1    push        dword ptr fs:[edx]
 004199D4    mov         dword ptr fs:[edx],esp
 004199D7    mov         eax,dword ptr [edi+4]
 004199DA    mov         ebx,dword ptr [eax+8]
 004199DD    dec         ebx
 004199DE    test        ebx,ebx
>004199E0    jl          00419A0B
 004199E2    inc         ebx
 004199E3    xor         esi,esi
 004199E5    mov         eax,dword ptr [edi+4]
 004199E8    mov         edx,esi
 004199EA    call        TList.Get
 004199EF    mov         edx,dword ptr [ebp-4]
 004199F2    call        TRegGroup.GetClass
 004199F7    mov         dword ptr [ebp-8],eax
 004199FA    cmp         dword ptr [ebp-8],0
>004199FE    je          00419A07
 00419A00    call        @TryFinallyExit
>00419A05    jmp         00419A2A
 00419A07    inc         esi
 00419A08    dec         ebx
>00419A09    jne         004199E5
 00419A0B    xor         eax,eax
 00419A0D    pop         edx
 00419A0E    pop         ecx
 00419A0F    pop         ecx
 00419A10    mov         dword ptr fs:[eax],edx
 00419A13    push        419A2A
 00419A18    mov         eax,[005E092C];RegGroups:TRegGroups
 00419A1D    call        TRegGroups.Unlock
 00419A22    ret
>00419A23    jmp         @HandleFinally
>00419A28    jmp         00419A18
 00419A2A    mov         eax,dword ptr [ebp-8]
 00419A2D    pop         edi
 00419A2E    pop         esi
 00419A2F    pop         ebx
 00419A30    pop         ecx
 00419A31    pop         ecx
 00419A32    pop         ebp
 00419A33    ret
*}
end;

//00419A34
function GetFieldClassTable(AClass:TClass):PFieldClassTable;
begin
{*
 00419A34    mov         eax,dword ptr [eax-38]
 00419A37    or          eax,eax
>00419A39    je          00419A3E
 00419A3B    mov         eax,dword ptr [eax+2]
 00419A3E    ret
*}
end;

//00419A40
procedure ClassNotFound(const ClassName:AnsiString);
begin
{*
 00419A40    push        ebp
 00419A41    mov         ebp,esp
 00419A43    add         esp,0FFFFFFF4
 00419A46    push        ebx
 00419A47    xor         edx,edx
 00419A49    mov         dword ptr [ebp-0C],edx
 00419A4C    mov         ebx,eax
 00419A4E    xor         eax,eax
 00419A50    push        ebp
 00419A51    push        419AA0
 00419A56    push        dword ptr fs:[eax]
 00419A59    mov         dword ptr fs:[eax],esp
 00419A5C    mov         dword ptr [ebp-8],ebx
 00419A5F    mov         byte ptr [ebp-4],0B
 00419A63    lea         eax,[ebp-8]
 00419A66    push        eax
 00419A67    push        0
 00419A69    lea         edx,[ebp-0C]
 00419A6C    mov         eax,[005AE6F4];^SClassNotFound:TResStringRec
 00419A71    call        LoadStr
 00419A76    mov         ecx,dword ptr [ebp-0C]
 00419A79    mov         dl,1
 00419A7B    mov         eax,[00417A0C];EClassNotFound
 00419A80    call        Exception.CreateFmt
 00419A85    call        @RaiseExcept
 00419A8A    xor         eax,eax
 00419A8C    pop         edx
 00419A8D    pop         ecx
 00419A8E    pop         ecx
 00419A8F    mov         dword ptr fs:[eax],edx
 00419A92    push        419AA7
 00419A97    lea         eax,[ebp-0C]
 00419A9A    call        @LStrClr
 00419A9F    ret
>00419AA0    jmp         @HandleFinally
>00419AA5    jmp         00419A97
 00419AA7    pop         ebx
 00419AA8    mov         esp,ebp
 00419AAA    pop         ebp
 00419AAB    ret
*}
end;

//00419AAC
function GetClass(const AClassName:AnsiString):TPersistentClass;
begin
{*
 00419AAC    push        ebp
 00419AAD    mov         ebp,esp
 00419AAF    push        ecx
 00419AB0    push        ebx
 00419AB1    mov         ebx,eax
 00419AB3    mov         eax,[005E092C];RegGroups:TRegGroups
 00419AB8    call        TRegGroups.Lock
 00419ABD    xor         eax,eax
 00419ABF    push        ebp
 00419AC0    push        419AF2
 00419AC5    push        dword ptr fs:[eax]
 00419AC8    mov         dword ptr fs:[eax],esp
 00419ACB    mov         edx,ebx
 00419ACD    mov         eax,[005E092C];RegGroups:TRegGroups
 00419AD2    call        TRegGroups.GetClass
 00419AD7    mov         dword ptr [ebp-4],eax
 00419ADA    xor         eax,eax
 00419ADC    pop         edx
 00419ADD    pop         ecx
 00419ADE    pop         ecx
 00419ADF    mov         dword ptr fs:[eax],edx
 00419AE2    push        419AF9
 00419AE7    mov         eax,[005E092C];RegGroups:TRegGroups
 00419AEC    call        TRegGroups.Unlock
 00419AF1    ret
>00419AF2    jmp         @HandleFinally
>00419AF7    jmp         00419AE7
 00419AF9    mov         eax,dword ptr [ebp-4]
 00419AFC    pop         ebx
 00419AFD    pop         ecx
 00419AFE    pop         ebp
 00419AFF    ret
*}
end;

//00419B00
function FindClass(const ClassName:AnsiString):TPersistentClass;
begin
{*
 00419B00    push        ebx
 00419B01    push        esi
 00419B02    mov         esi,eax
 00419B04    mov         eax,esi
 00419B06    call        GetClass
 00419B0B    mov         ebx,eax
 00419B0D    test        ebx,ebx
>00419B0F    jne         00419B18
 00419B11    mov         eax,esi
 00419B13    call        ClassNotFound
 00419B18    mov         eax,ebx
 00419B1A    pop         esi
 00419B1B    pop         ebx
 00419B1C    ret
*}
end;

//00419B20
procedure RegisterClass(AClass:TPersistentClass);
begin
{*
 00419B20    push        ebp
 00419B21    mov         ebp,esp
 00419B23    push        ebx
 00419B24    mov         ebx,eax
 00419B26    mov         eax,[005E092C];RegGroups:TRegGroups
 00419B2B    call        TRegGroups.Lock
 00419B30    xor         eax,eax
 00419B32    push        ebp
 00419B33    push        419B85
 00419B38    push        dword ptr fs:[eax]
 00419B3B    mov         dword ptr fs:[eax],esp
>00419B3E    jmp         00419B5D
 00419B40    mov         edx,ebx
 00419B42    mov         eax,[005E092C];RegGroups:TRegGroups
 00419B47    call        TRegGroups.RegisterClass
 00419B4C    cmp         ebx,dword ptr ds:[417DFC];TPersistent
>00419B52    je          00419B6D
 00419B54    mov         eax,ebx
 00419B56    call        TObject.ClassParent
 00419B5B    mov         ebx,eax
 00419B5D    mov         edx,ebx
 00419B5F    mov         eax,[005E092C];RegGroups:TRegGroups
 00419B64    call        TRegGroups.Registered
 00419B69    test        al,al
>00419B6B    je          00419B40
 00419B6D    xor         eax,eax
 00419B6F    pop         edx
 00419B70    pop         ecx
 00419B71    pop         ecx
 00419B72    mov         dword ptr fs:[eax],edx
 00419B75    push        419B8C
 00419B7A    mov         eax,[005E092C];RegGroups:TRegGroups
 00419B7F    call        TRegGroups.Unlock
 00419B84    ret
>00419B85    jmp         @HandleFinally
>00419B8A    jmp         00419B7A
 00419B8C    pop         ebx
 00419B8D    pop         ebp
 00419B8E    ret
*}
end;

//00419B90
{*procedure RegisterClasses(AClasses:array[$0..-$1] of TPersistentClass; const _Dv_:?);
begin
 00419B90    push        ebp
 00419B91    mov         ebp,esp
 00419B93    push        ebx
 00419B94    push        esi
 00419B95    mov         ecx,edx
 00419B97    test        ecx,ecx
>00419B99    js          00419BA2
 00419B9B    mov         ebx,dword ptr [eax+ecx*4]
 00419B9E    dec         ecx
 00419B9F    push        ebx
>00419BA0    jns         00419B9B
 00419BA2    mov         eax,esp
 00419BA4    mov         esi,edx
 00419BA6    test        esi,esi
>00419BA8    jl          00419BBA
 00419BAA    inc         esi
 00419BAB    mov         ebx,eax
 00419BAD    mov         eax,dword ptr [ebx]
 00419BAF    call        RegisterClass
 00419BB4    add         ebx,4
 00419BB7    dec         esi
>00419BB8    jne         00419BAD
 00419BBA    mov         esi,dword ptr [ebp-8]
 00419BBD    mov         ebx,dword ptr [ebp-4]
 00419BC0    mov         esp,ebp
 00419BC2    pop         ebp
 00419BC3    ret
end;*}

//00419BC4
procedure UnRegisterModuleClasses(Module:HMODULE);
begin
{*
 00419BC4    push        ebp
 00419BC5    mov         ebp,esp
 00419BC7    push        ebx
 00419BC8    mov         ebx,eax
 00419BCA    mov         eax,[005E092C];RegGroups:TRegGroups
 00419BCF    call        TRegGroups.Lock
 00419BD4    xor         eax,eax
 00419BD6    push        ebp
 00419BD7    push        419C06
 00419BDC    push        dword ptr fs:[eax]
 00419BDF    mov         dword ptr fs:[eax],esp
 00419BE2    mov         edx,ebx
 00419BE4    mov         eax,[005E092C];RegGroups:TRegGroups
 00419BE9    call        TRegGroups.UnregisterModuleClasses
 00419BEE    xor         eax,eax
 00419BF0    pop         edx
 00419BF1    pop         ecx
 00419BF2    pop         ecx
 00419BF3    mov         dword ptr fs:[eax],edx
 00419BF6    push        419C0D
 00419BFB    mov         eax,[005E092C];RegGroups:TRegGroups
 00419C00    call        TRegGroups.Unlock
 00419C05    ret
>00419C06    jmp         @HandleFinally
>00419C0B    jmp         00419BFB
 00419C0D    pop         ebx
 00419C0E    pop         ebp
 00419C0F    ret
*}
end;

//00419C10
procedure StartClassGroup(AClass:TPersistentClass);
begin
{*
 00419C10    push        ebp
 00419C11    mov         ebp,esp
 00419C13    push        ebx
 00419C14    mov         ebx,eax
 00419C16    mov         eax,[005E092C];RegGroups:TRegGroups
 00419C1B    call        TRegGroups.Lock
 00419C20    xor         eax,eax
 00419C22    push        ebp
 00419C23    push        419C52
 00419C28    push        dword ptr fs:[eax]
 00419C2B    mov         dword ptr fs:[eax],esp
 00419C2E    mov         edx,ebx
 00419C30    mov         eax,[005E092C];RegGroups:TRegGroups
 00419C35    call        TRegGroups.StartGroup
 00419C3A    xor         eax,eax
 00419C3C    pop         edx
 00419C3D    pop         ecx
 00419C3E    pop         ecx
 00419C3F    mov         dword ptr fs:[eax],edx
 00419C42    push        419C59
 00419C47    mov         eax,[005E092C];RegGroups:TRegGroups
 00419C4C    call        TRegGroups.Unlock
 00419C51    ret
>00419C52    jmp         @HandleFinally
>00419C57    jmp         00419C47
 00419C59    pop         ebx
 00419C5A    pop         ebp
 00419C5B    ret
*}
end;

//00419C5C
procedure GroupDescendentsWith(AClass:TPersistentClass; AClassGroup:TPersistentClass);
begin
{*
 00419C5C    push        ebp
 00419C5D    mov         ebp,esp
 00419C5F    push        ebx
 00419C60    push        esi
 00419C61    mov         esi,edx
 00419C63    mov         ebx,eax
 00419C65    mov         eax,[005E092C];RegGroups:TRegGroups
 00419C6A    call        TRegGroups.Lock
 00419C6F    xor         eax,eax
 00419C71    push        ebp
 00419C72    push        419CA3
 00419C77    push        dword ptr fs:[eax]
 00419C7A    mov         dword ptr fs:[eax],esp
 00419C7D    mov         ecx,esi
 00419C7F    mov         edx,ebx
 00419C81    mov         eax,[005E092C];RegGroups:TRegGroups
 00419C86    call        TRegGroups.GroupWith
 00419C8B    xor         eax,eax
 00419C8D    pop         edx
 00419C8E    pop         ecx
 00419C8F    pop         ecx
 00419C90    mov         dword ptr fs:[eax],edx
 00419C93    push        419CAA
 00419C98    mov         eax,[005E092C];RegGroups:TRegGroups
 00419C9D    call        TRegGroups.Unlock
 00419CA2    ret
>00419CA3    jmp         @HandleFinally
>00419CA8    jmp         00419C98
 00419CAA    pop         esi
 00419CAB    pop         ebx
 00419CAC    pop         ebp
 00419CAD    ret
*}
end;

//00419CB0
function ActivateClassGroup(AClass:TPersistentClass):TPersistentClass;
begin
{*
 00419CB0    push        ebp
 00419CB1    mov         ebp,esp
 00419CB3    push        ecx
 00419CB4    push        ebx
 00419CB5    mov         ebx,eax
 00419CB7    mov         eax,[005E092C];RegGroups:TRegGroups
 00419CBC    call        TRegGroups.Lock
 00419CC1    xor         eax,eax
 00419CC3    push        ebp
 00419CC4    push        419CFE
 00419CC9    push        dword ptr fs:[eax]
 00419CCC    mov         dword ptr fs:[eax],esp
 00419CCF    mov         eax,[005E092C];RegGroups:TRegGroups
 00419CD4    mov         eax,dword ptr [eax+20]
 00419CD7    mov         dword ptr [ebp-4],eax
 00419CDA    mov         edx,ebx
 00419CDC    mov         eax,[005E092C];RegGroups:TRegGroups
 00419CE1    call        TRegGroups.Activate
 00419CE6    xor         eax,eax
 00419CE8    pop         edx
 00419CE9    pop         ecx
 00419CEA    pop         ecx
 00419CEB    mov         dword ptr fs:[eax],edx
 00419CEE    push        419D05
 00419CF3    mov         eax,[005E092C];RegGroups:TRegGroups
 00419CF8    call        TRegGroups.Unlock
 00419CFD    ret
>00419CFE    jmp         @HandleFinally
>00419D03    jmp         00419CF3
 00419D05    mov         eax,dword ptr [ebp-4]
 00419D08    pop         ebx
 00419D09    pop         ecx
 00419D0A    pop         ebp
 00419D0B    ret
*}
end;

//00419D64
constructor TIntConst.Create(AIntegerType:PTypeInfo; AIdentToInt:TIdentToInt; AIntToIdent:TIntToIdent);
begin
{*
 00419D64    push        ebp
 00419D65    mov         ebp,esp
 00419D67    test        dl,dl
>00419D69    je          00419D73
 00419D6B    add         esp,0FFFFFFF0
 00419D6E    call        @ClassCreate
 00419D73    mov         dword ptr [eax+4],ecx
 00419D76    mov         ecx,dword ptr [ebp+0C]
 00419D79    mov         dword ptr [eax+8],ecx
 00419D7C    mov         ecx,dword ptr [ebp+8]
 00419D7F    mov         dword ptr [eax+0C],ecx
 00419D82    test        dl,dl
>00419D84    je          00419D95
 00419D86    call        @AfterConstruction
 00419D8B    pop         dword ptr fs:[0]
 00419D92    add         esp,0C
 00419D95    pop         ebp
 00419D96    ret         8
*}
end;

//00419D9C
procedure RegisterIntegerConsts(AIntegerType:Pointer; AIdentToInt:TIdentToInt; AIntToIdent:TIntToIdent);
begin
{*
 00419D9C    push        ebx
 00419D9D    push        esi
 00419D9E    push        edi
 00419D9F    mov         edi,ecx
 00419DA1    mov         esi,edx
 00419DA3    mov         ebx,eax
 00419DA5    push        esi
 00419DA6    push        edi
 00419DA7    mov         ecx,ebx
 00419DA9    mov         dl,1
 00419DAB    mov         eax,[00419D0C];TIntConst
 00419DB0    call        TIntConst.Create
 00419DB5    mov         edx,eax
 00419DB7    mov         eax,[005E0928];IntConstList:TThreadList
 00419DBC    call        TThreadList.Add
 00419DC1    pop         edi
 00419DC2    pop         esi
 00419DC3    pop         ebx
 00419DC4    ret
*}
end;

//00419DC8
function FindIntToIdent(AIntegerType:Pointer):TIntToIdent;
begin
{*
 00419DC8    push        ebp
 00419DC9    mov         ebp,esp
 00419DCB    push        ecx
 00419DCC    push        ebx
 00419DCD    push        esi
 00419DCE    push        edi
 00419DCF    mov         edi,eax
 00419DD1    xor         eax,eax
 00419DD3    mov         dword ptr [ebp-4],eax
 00419DD6    mov         eax,[005E0928];IntConstList:TThreadList
 00419DDB    call        TThreadList.LockList
 00419DE0    mov         esi,eax
 00419DE2    xor         edx,edx
 00419DE4    push        ebp
 00419DE5    push        419E32
 00419DEA    push        dword ptr fs:[edx]
 00419DED    mov         dword ptr fs:[edx],esp
 00419DF0    mov         ebx,dword ptr [esi+8]
 00419DF3    dec         ebx
 00419DF4    cmp         ebx,0
>00419DF7    jl          00419E1A
 00419DF9    mov         edx,ebx
 00419DFB    mov         eax,esi
 00419DFD    call        TList.Get
 00419E02    cmp         edi,dword ptr [eax+4]
>00419E05    jne         00419E14
 00419E07    mov         eax,dword ptr [eax+0C]
 00419E0A    mov         dword ptr [ebp-4],eax
 00419E0D    call        @TryFinallyExit
>00419E12    jmp         00419E39
 00419E14    dec         ebx
 00419E15    cmp         ebx,0FFFFFFFF
>00419E18    jne         00419DF9
 00419E1A    xor         eax,eax
 00419E1C    pop         edx
 00419E1D    pop         ecx
 00419E1E    pop         ecx
 00419E1F    mov         dword ptr fs:[eax],edx
 00419E22    push        419E39
 00419E27    mov         eax,[005E0928];IntConstList:TThreadList
 00419E2C    call        TThreadList.UnlockList
 00419E31    ret
>00419E32    jmp         @HandleFinally
>00419E37    jmp         00419E27
 00419E39    mov         eax,dword ptr [ebp-4]
 00419E3C    pop         edi
 00419E3D    pop         esi
 00419E3E    pop         ebx
 00419E3F    pop         ecx
 00419E40    pop         ebp
 00419E41    ret
*}
end;

//00419E44
function FindIdentToInt(AIntegerType:Pointer):TIdentToInt;
begin
{*
 00419E44    push        ebp
 00419E45    mov         ebp,esp
 00419E47    push        ecx
 00419E48    push        ebx
 00419E49    push        esi
 00419E4A    push        edi
 00419E4B    mov         edi,eax
 00419E4D    xor         eax,eax
 00419E4F    mov         dword ptr [ebp-4],eax
 00419E52    mov         eax,[005E0928];IntConstList:TThreadList
 00419E57    call        TThreadList.LockList
 00419E5C    mov         esi,eax
 00419E5E    xor         edx,edx
 00419E60    push        ebp
 00419E61    push        419EAE
 00419E66    push        dword ptr fs:[edx]
 00419E69    mov         dword ptr fs:[edx],esp
 00419E6C    mov         ebx,dword ptr [esi+8]
 00419E6F    dec         ebx
 00419E70    cmp         ebx,0
>00419E73    jl          00419E96
 00419E75    mov         edx,ebx
 00419E77    mov         eax,esi
 00419E79    call        TList.Get
 00419E7E    cmp         edi,dword ptr [eax+4]
>00419E81    jne         00419E90
 00419E83    mov         eax,dword ptr [eax+8]
 00419E86    mov         dword ptr [ebp-4],eax
 00419E89    call        @TryFinallyExit
>00419E8E    jmp         00419EB5
 00419E90    dec         ebx
 00419E91    cmp         ebx,0FFFFFFFF
>00419E94    jne         00419E75
 00419E96    xor         eax,eax
 00419E98    pop         edx
 00419E99    pop         ecx
 00419E9A    pop         ecx
 00419E9B    mov         dword ptr fs:[eax],edx
 00419E9E    push        419EB5
 00419EA3    mov         eax,[005E0928];IntConstList:TThreadList
 00419EA8    call        TThreadList.UnlockList
 00419EAD    ret
>00419EAE    jmp         @HandleFinally
>00419EB3    jmp         00419EA3
 00419EB5    mov         eax,dword ptr [ebp-4]
 00419EB8    pop         edi
 00419EB9    pop         esi
 00419EBA    pop         ebx
 00419EBB    pop         ecx
 00419EBC    pop         ebp
 00419EBD    ret
*}
end;

//00419EC0
{*function IdentToInt(const Ident:AnsiString; var Int:Longint; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:?):Boolean;
begin
 00419EC0    push        ebp
 00419EC1    mov         ebp,esp
 00419EC3    push        ecx
 00419EC4    push        ebx
 00419EC5    push        esi
 00419EC6    push        edi
 00419EC7    mov         dword ptr [ebp-4],edx
 00419ECA    mov         edi,eax
 00419ECC    mov         esi,dword ptr [ebp+8]
 00419ECF    test        esi,esi
>00419ED1    jl          00419EF6
 00419ED3    inc         esi
 00419ED4    lea         ebx,[ecx+4]
 00419ED7    mov         edx,edi
 00419ED9    mov         eax,dword ptr [ebx]
 00419EDB    call        SameText
 00419EE0    test        al,al
>00419EE2    je          00419EF0
 00419EE4    mov         al,1
 00419EE6    mov         edx,dword ptr [ebp-4]
 00419EE9    mov         ecx,dword ptr [ebx-4]
 00419EEC    mov         dword ptr [edx],ecx
>00419EEE    jmp         00419EF8
 00419EF0    add         ebx,8
 00419EF3    dec         esi
>00419EF4    jne         00419ED7
 00419EF6    xor         eax,eax
 00419EF8    pop         edi
 00419EF9    pop         esi
 00419EFA    pop         ebx
 00419EFB    pop         ecx
 00419EFC    pop         ebp
 00419EFD    ret         4
end;*}

//00419F00
{*function IntToIdent(Int:Longint; var Ident:AnsiString; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:?):Boolean;
begin
 00419F00    push        ebp
 00419F01    mov         ebp,esp
 00419F03    add         esp,0FFFFFFF8
 00419F06    push        ebx
 00419F07    push        esi
 00419F08    push        edi
 00419F09    mov         dword ptr [ebp-4],ecx
 00419F0C    mov         edi,edx
 00419F0E    mov         esi,dword ptr [ebp+8]
 00419F11    test        esi,esi
>00419F13    jl          00419F33
 00419F15    inc         esi
 00419F16    mov         ebx,dword ptr [ebp-4]
 00419F19    cmp         eax,dword ptr [ebx]
>00419F1B    jne         00419F2D
 00419F1D    mov         byte ptr [ebp-5],1
 00419F21    mov         eax,edi
 00419F23    mov         edx,dword ptr [ebx+4]
 00419F26    call        @LStrAsg
>00419F2B    jmp         00419F37
 00419F2D    add         ebx,8
 00419F30    dec         esi
>00419F31    jne         00419F19
 00419F33    mov         byte ptr [ebp-5],0
 00419F37    mov         al,byte ptr [ebp-5]
 00419F3A    pop         edi
 00419F3B    pop         esi
 00419F3C    pop         ebx
 00419F3D    pop         ecx
 00419F3E    pop         ecx
 00419F3F    pop         ebp
 00419F40    ret         4
end;*}

//00419F44
procedure RegisterFindGlobalComponentProc(AFindGlobalComponent:TFindGlobalComponent);
begin
{*
 00419F44    push        ebx
 00419F45    push        esi
 00419F46    mov         ebx,eax
 00419F48    cmp         dword ptr ds:[5E0930],0;FindGlobalComponentProcs:TList
>00419F4F    jne         00419F62
 00419F51    mov         dl,1
 00419F53    mov         eax,[00417CEC];TList
 00419F58    call        TObject.Create
 00419F5D    mov         [005E0930],eax;FindGlobalComponentProcs:TList
 00419F62    mov         esi,ebx
 00419F64    mov         edx,esi
 00419F66    mov         eax,[005E0930];FindGlobalComponentProcs:TList
 00419F6B    call        TList.IndexOf
 00419F70    test        eax,eax
>00419F72    jge         00419F80
 00419F74    mov         edx,esi
 00419F76    mov         eax,[005E0930];FindGlobalComponentProcs:TList
 00419F7B    call        TList.Add
 00419F80    pop         esi
 00419F81    pop         ebx
 00419F82    ret
*}
end;

//00419F84
procedure UnregisterFindGlobalComponentProc(AFindGlobalComponent:TFindGlobalComponent);
begin
{*
 00419F84    cmp         dword ptr ds:[5E0930],0;FindGlobalComponentProcs:TList
>00419F8B    je          00419F99
 00419F8D    mov         edx,eax
 00419F8F    mov         eax,[005E0930];FindGlobalComponentProcs:TList
 00419F94    call        TList.Remove
 00419F99    ret
*}
end;

//00419F9C
function FindGlobalComponent(const Name:AnsiString):TComponent;
begin
{*
 00419F9C    push        ebx
 00419F9D    push        esi
 00419F9E    push        edi
 00419F9F    mov         esi,eax
 00419FA1    xor         eax,eax
 00419FA3    cmp         dword ptr ds:[5E0930],0;FindGlobalComponentProcs:TList
>00419FAA    je          00419FD7
 00419FAC    mov         edx,dword ptr ds:[5E0930];FindGlobalComponentProcs:TList
 00419FB2    mov         ebx,dword ptr [edx+8]
 00419FB5    dec         ebx
 00419FB6    cmp         ebx,0
>00419FB9    jl          00419FD7
 00419FBB    mov         edx,ebx
 00419FBD    mov         eax,[005E0930];FindGlobalComponentProcs:TList
 00419FC2    call        TList.Get
 00419FC7    mov         edi,eax
 00419FC9    mov         eax,esi
 00419FCB    call        edi
 00419FCD    test        eax,eax
>00419FCF    jne         00419FD7
 00419FD1    dec         ebx
 00419FD2    cmp         ebx,0FFFFFFFF
>00419FD5    jne         00419FBB
 00419FD7    pop         edi
 00419FD8    pop         esi
 00419FD9    pop         ebx
 00419FDA    ret
*}
end;

//00419FDC
function IsUniqueGlobalComponentName(const Name:AnsiString):Boolean;
begin
{*
 00419FDC    push        ebx
 00419FDD    mov         ebx,eax
 00419FDF    cmp         dword ptr ds:[5E091C],0;IsUniqueGlobalComponentNameProc:TIsUniqueGlobalComponentName
>00419FE6    je          00419FF2
 00419FE8    mov         eax,ebx
 00419FEA    call        dword ptr ds:[5E091C]
 00419FF0    pop         ebx
 00419FF1    ret
 00419FF2    mov         eax,ebx
 00419FF4    call        FindGlobalComponent
 00419FF9    test        eax,eax
 00419FFB    sete        al
 00419FFE    pop         ebx
 00419FFF    ret
*}
end;

//0041A000
function InternalReadComponentRes(const ResName:AnsiString; HInst:THandle; var Instance:TComponent):Boolean;
begin
{*
 0041A000    push        ebp
 0041A001    mov         ebp,esp
 0041A003    push        ecx
 0041A004    push        ebx
 0041A005    push        esi
 0041A006    push        edi
 0041A007    mov         esi,ecx
 0041A009    mov         ebx,edx
 0041A00B    mov         edi,eax
 0041A00D    test        ebx,ebx
>0041A00F    jne         0041A017
 0041A011    mov         ebx,dword ptr ds:[5AF664];gvar_005AF664
 0041A017    push        0A
 0041A019    mov         eax,edi
 0041A01B    call        @LStrToPChar
 0041A020    push        eax
 0041A021    push        ebx
 0041A022    call        KERNEL32.FindResourceA
 0041A027    test        eax,eax
 0041A029    setne       al
 0041A02C    test        al,al
>0041A02E    je          0041A07D
 0041A030    push        edi
 0041A031    push        0A
 0041A033    mov         ecx,ebx
 0041A035    mov         dl,1
 0041A037    mov         eax,[00418744];TResourceStream
 0041A03C    call        TResourceStream.Create
 0041A041    mov         dword ptr [ebp-4],eax
 0041A044    xor         eax,eax
 0041A046    push        ebp
 0041A047    push        41A074
 0041A04C    push        dword ptr fs:[eax]
 0041A04F    mov         dword ptr fs:[eax],esp
 0041A052    mov         edx,dword ptr [esi]
 0041A054    mov         eax,dword ptr [ebp-4]
 0041A057    call        TStream.ReadComponent
 0041A05C    mov         dword ptr [esi],eax
 0041A05E    xor         eax,eax
 0041A060    pop         edx
 0041A061    pop         ecx
 0041A062    pop         ecx
 0041A063    mov         dword ptr fs:[eax],edx
 0041A066    push        41A07B
 0041A06B    mov         eax,dword ptr [ebp-4]
 0041A06E    call        TObject.Free
 0041A073    ret
>0041A074    jmp         @HandleFinally
>0041A079    jmp         0041A06B
 0041A07B    mov         al,1
 0041A07D    pop         edi
 0041A07E    pop         esi
 0041A07F    pop         ebx
 0041A080    pop         ecx
 0041A081    pop         ebp
 0041A082    ret
*}
end;

//0041A084
procedure BeginGlobalLoading;
begin
{*
 0041A084    push        ebx
 0041A085    call        @GetTls
 0041A08A    mov         ebx,dword ptr [eax+0C];{GlobalLists:TList}
 0041A090    test        ebx,ebx
>0041A092    jne         0041A0AD
 0041A094    mov         dl,1
 0041A096    mov         eax,[00417CEC];TList
 0041A09B    call        TObject.Create
 0041A0A0    mov         ebx,eax
 0041A0A2    call        @GetTls
 0041A0A7    mov         dword ptr [eax+0C],ebx;{GlobalLists:TList}
 0041A0AD    call        @GetTls
 0041A0B2    mov         edx,dword ptr [eax+8];{GlobalLoaded:TList}
 0041A0B8    mov         eax,ebx
 0041A0BA    call        TList.Add
 0041A0BF    mov         dl,1
 0041A0C1    mov         eax,[00417CEC];TList
 0041A0C6    call        TObject.Create
 0041A0CB    mov         ebx,eax
 0041A0CD    call        @GetTls
 0041A0D2    mov         dword ptr [eax+8],ebx;{GlobalLoaded:TList}
 0041A0D8    pop         ebx
 0041A0D9    ret
*}
end;

//0041A0DC
procedure NotifyGlobalLoading;
begin
{*
 0041A0DC    push        ebx
 0041A0DD    push        esi
 0041A0DE    push        edi
 0041A0DF    call        @GetTls
 0041A0E4    mov         edi,dword ptr [eax+8];{GlobalLoaded:TList}
 0041A0EA    mov         ebx,dword ptr [edi+8]
 0041A0ED    dec         ebx
 0041A0EE    test        ebx,ebx
>0041A0F0    jl          0041A107
 0041A0F2    inc         ebx
 0041A0F3    xor         esi,esi
 0041A0F5    mov         edx,esi
 0041A0F7    mov         eax,edi
 0041A0F9    call        TList.Get
 0041A0FE    mov         edx,dword ptr [eax]
 0041A100    call        dword ptr [edx+0C]
 0041A103    inc         esi
 0041A104    dec         ebx
>0041A105    jne         0041A0F5
 0041A107    pop         edi
 0041A108    pop         esi
 0041A109    pop         ebx
 0041A10A    ret
*}
end;

//0041A10C
procedure EndGlobalLoading;
begin
{*
 0041A10C    push        ebx
 0041A10D    push        esi
 0041A10E    call        @GetTls
 0041A113    mov         eax,dword ptr [eax+8];{GlobalLoaded:TList}
 0041A119    call        TObject.Free
 0041A11E    call        @GetTls
 0041A123    mov         ebx,dword ptr [eax+0C];{GlobalLists:TList}
 0041A129    mov         eax,ebx
 0041A12B    call        TList.Last
 0041A130    mov         esi,eax
 0041A132    call        @GetTls
 0041A137    mov         dword ptr [eax+8],esi;{GlobalLoaded:TList}
 0041A13D    mov         edx,dword ptr [ebx+8]
 0041A140    dec         edx
 0041A141    mov         eax,ebx
 0041A143    call        TList.Delete
 0041A148    cmp         dword ptr [ebx+8],0
>0041A14C    jne         0041A162
 0041A14E    call        @GetTls
 0041A153    xor         edx,edx
 0041A155    mov         dword ptr [eax+0C],edx;{GlobalLists:TList}
 0041A15B    mov         eax,ebx
 0041A15D    call        TObject.Free
 0041A162    pop         esi
 0041A163    pop         ebx
 0041A164    ret
*}
end;

//0041A168
function InitComponent(ClassType:TClass):Boolean;
begin
{*
 0041A168    push        ebp
 0041A169    mov         ebp,esp
 0041A16B    add         esp,0FFFFFEFC
 0041A171    push        ebx
 0041A172    push        esi
 0041A173    xor         edx,edx
 0041A175    mov         dword ptr [ebp-4],edx
 0041A178    mov         esi,eax
 0041A17A    xor         eax,eax
 0041A17C    push        ebp
 0041A17D    push        41A1FE
 0041A182    push        dword ptr fs:[eax]
 0041A185    mov         dword ptr fs:[eax],esp
 0041A188    xor         ebx,ebx
 0041A18A    cmp         esi,dword ptr ds:[418C6C];TComponent
>0041A190    je          0041A1E8
 0041A192    mov         eax,dword ptr [ebp+8]
 0041A195    cmp         esi,dword ptr [eax-8]
>0041A198    je          0041A1E8
 0041A19A    mov         eax,dword ptr [ebp+8]
 0041A19D    push        eax
 0041A19E    mov         eax,esi
 0041A1A0    call        TObject.ClassParent
 0041A1A5    call        InitComponent
 0041A1AA    pop         ecx
 0041A1AB    mov         ebx,eax
 0041A1AD    lea         edx,[ebp-104]
 0041A1B3    mov         eax,esi
 0041A1B5    call        TObject.ClassName
 0041A1BA    lea         edx,[ebp-104]
 0041A1C0    lea         eax,[ebp-4]
 0041A1C3    call        @LStrFromString
 0041A1C8    mov         eax,dword ptr [ebp-4]
 0041A1CB    push        eax
 0041A1CC    mov         eax,esi
 0041A1CE    call        FindClassHInstance
 0041A1D3    call        FindResourceHInstance
 0041A1D8    mov         edx,eax
 0041A1DA    mov         eax,dword ptr [ebp+8]
 0041A1DD    lea         ecx,[eax-4]
 0041A1E0    pop         eax
 0041A1E1    call        InternalReadComponentRes
 0041A1E6    or          bl,al
 0041A1E8    xor         eax,eax
 0041A1EA    pop         edx
 0041A1EB    pop         ecx
 0041A1EC    pop         ecx
 0041A1ED    mov         dword ptr fs:[eax],edx
 0041A1F0    push        41A205
 0041A1F5    lea         eax,[ebp-4]
 0041A1F8    call        @LStrClr
 0041A1FD    ret
>0041A1FE    jmp         @HandleFinally
>0041A203    jmp         0041A1F5
 0041A205    mov         eax,ebx
 0041A207    pop         esi
 0041A208    pop         ebx
 0041A209    mov         esp,ebp
 0041A20B    pop         ebp
 0041A20C    ret
*}
end;

//0041A210
function InitInheritedComponent(Instance:TComponent; RootAncestor:TClass):Boolean;
begin
{*
 0041A210    push        ebp
 0041A211    mov         ebp,esp
 0041A213    add         esp,0FFFFFFF4
 0041A216    mov         dword ptr [ebp-8],edx
 0041A219    mov         dword ptr [ebp-4],eax
 0041A21C    mov         eax,[005E0918];GlobalNameSpace:IReadWriteSync
 0041A221    mov         edx,dword ptr [eax]
 0041A223    call        dword ptr [edx+14]
 0041A226    xor         eax,eax
 0041A228    push        ebp
 0041A229    push        41A2BE
 0041A22E    push        dword ptr fs:[eax]
 0041A231    mov         dword ptr fs:[eax],esp
 0041A234    mov         eax,dword ptr [ebp-4]
 0041A237    mov         ax,word ptr [eax+1C]
 0041A23B    and         ax,word ptr ds:[41A2CC]
 0041A242    mov         dx,word ptr ds:[41A2D0]
 0041A249    cmp         dx,ax
 0041A24C    sete        byte ptr [ebp-0A]
 0041A250    cmp         byte ptr [ebp-0A],0
>0041A254    je          0041A25B
 0041A256    call        BeginGlobalLoading
 0041A25B    xor         eax,eax
 0041A25D    push        ebp
 0041A25E    push        41A29F
 0041A263    push        dword ptr fs:[eax]
 0041A266    mov         dword ptr fs:[eax],esp
 0041A269    push        ebp
 0041A26A    mov         eax,dword ptr [ebp-4]
 0041A26D    call        TObject.ClassType
 0041A272    call        InitComponent
 0041A277    pop         ecx
 0041A278    mov         byte ptr [ebp-9],al
 0041A27B    cmp         byte ptr [ebp-0A],0
>0041A27F    je          0041A286
 0041A281    call        NotifyGlobalLoading
 0041A286    xor         eax,eax
 0041A288    pop         edx
 0041A289    pop         ecx
 0041A28A    pop         ecx
 0041A28B    mov         dword ptr fs:[eax],edx
 0041A28E    push        41A2A6
 0041A293    cmp         byte ptr [ebp-0A],0
>0041A297    je          0041A29E
 0041A299    call        EndGlobalLoading
 0041A29E    ret
>0041A29F    jmp         @HandleFinally
>0041A2A4    jmp         0041A293
 0041A2A6    xor         eax,eax
 0041A2A8    pop         edx
 0041A2A9    pop         ecx
 0041A2AA    pop         ecx
 0041A2AB    mov         dword ptr fs:[eax],edx
 0041A2AE    push        41A2C5
 0041A2B3    mov         eax,[005E0918];GlobalNameSpace:IReadWriteSync
 0041A2B8    mov         edx,dword ptr [eax]
 0041A2BA    call        dword ptr [edx+18]
 0041A2BD    ret
>0041A2BE    jmp         @HandleFinally
>0041A2C3    jmp         0041A2B3
 0041A2C5    mov         al,byte ptr [ebp-9]
 0041A2C8    mov         esp,ebp
 0041A2CA    pop         ebp
 0041A2CB    ret
*}
end;

//0041A2D4
procedure WriteCollection(Stream:TStream; Collection:TCollection; CollectionOwner:TComponent);
begin
{*
 0041A2D4    push        ebp
 0041A2D5    mov         ebp,esp
 0041A2D7    push        ecx
 0041A2D8    push        ebx
 0041A2D9    push        esi
 0041A2DA    mov         ebx,ecx
 0041A2DC    mov         esi,edx
 0041A2DE    push        400
 0041A2E3    mov         ecx,eax
 0041A2E5    mov         dl,1
 0041A2E7    mov         eax,[00418AA8];TWriter
 0041A2EC    call        TFiler.Create
 0041A2F1    mov         dword ptr [ebp-4],eax
 0041A2F4    mov         edx,ebx
 0041A2F6    mov         eax,dword ptr [ebp-4]
 0041A2F9    mov         ecx,dword ptr [eax]
 0041A2FB    call        dword ptr [ecx]
 0041A2FD    mov         eax,dword ptr [ebp-4]
 0041A300    mov         dword ptr [eax+1C],ebx
 0041A303    xor         eax,eax
 0041A305    push        ebp
 0041A306    push        41A331
 0041A30B    push        dword ptr fs:[eax]
 0041A30E    mov         dword ptr fs:[eax],esp
 0041A311    mov         edx,esi
 0041A313    mov         eax,dword ptr [ebp-4]
 0041A316    call        TWriter.WriteCollection
 0041A31B    xor         eax,eax
 0041A31D    pop         edx
 0041A31E    pop         ecx
 0041A31F    pop         ecx
 0041A320    mov         dword ptr fs:[eax],edx
 0041A323    push        41A338
 0041A328    mov         eax,dword ptr [ebp-4]
 0041A32B    call        TObject.Free
 0041A330    ret
>0041A331    jmp         @HandleFinally
>0041A336    jmp         0041A328
 0041A338    pop         esi
 0041A339    pop         ebx
 0041A33A    pop         ecx
 0041A33B    pop         ebp
 0041A33C    ret
*}
end;

//0041A340
function CollectionsEqual(C1:TCollection; C2:TCollection; Owner1:TComponent; Owner2:TComponent):Boolean;
begin
{*
 0041A340    push        ebp
 0041A341    mov         ebp,esp
 0041A343    add         esp,0FFFFFFF4
 0041A346    push        ebx
 0041A347    push        esi
 0041A348    push        edi
 0041A349    mov         edi,ecx
 0041A34B    mov         esi,edx
 0041A34D    mov         ebx,eax
 0041A34F    mov         byte ptr [ebp-1],0
 0041A353    mov         eax,ebx
 0041A355    call        TObject.ClassType
 0041A35A    push        eax
 0041A35B    mov         eax,esi
 0041A35D    call        TObject.ClassType
 0041A362    pop         edx
 0041A363    cmp         edx,eax
>0041A365    jne         0041A454
 0041A36B    mov         eax,ebx
 0041A36D    call        TCollection.GetCount
 0041A372    push        eax
 0041A373    mov         eax,esi
 0041A375    call        TCollection.GetCount
 0041A37A    pop         edx
 0041A37B    cmp         edx,eax
>0041A37D    jne         0041A454
 0041A383    mov         dl,1
 0041A385    mov         eax,[00418640];TMemoryStream
 0041A38A    call        TObject.Create
 0041A38F    mov         dword ptr [ebp-8],eax
 0041A392    xor         eax,eax
 0041A394    push        ebp
 0041A395    push        41A44D
 0041A39A    push        dword ptr fs:[eax]
 0041A39D    mov         dword ptr fs:[eax],esp
 0041A3A0    mov         ecx,edi
 0041A3A2    mov         edx,ebx
 0041A3A4    mov         eax,dword ptr [ebp-8]
 0041A3A7    call        WriteCollection
 0041A3AC    mov         dl,1
 0041A3AE    mov         eax,[00418640];TMemoryStream
 0041A3B3    call        TObject.Create
 0041A3B8    mov         dword ptr [ebp-0C],eax
 0041A3BB    xor         eax,eax
 0041A3BD    push        ebp
 0041A3BE    push        41A430
 0041A3C3    push        dword ptr fs:[eax]
 0041A3C6    mov         dword ptr fs:[eax],esp
 0041A3C9    mov         ecx,dword ptr [ebp+8]
 0041A3CC    mov         edx,esi
 0041A3CE    mov         eax,dword ptr [ebp-0C]
 0041A3D1    call        WriteCollection
 0041A3D6    mov         eax,dword ptr [ebp-8]
 0041A3D9    mov         edx,dword ptr [eax]
 0041A3DB    call        dword ptr [edx]
 0041A3DD    push        edx
 0041A3DE    push        eax
 0041A3DF    mov         eax,dword ptr [ebp-0C]
 0041A3E2    mov         edx,dword ptr [eax]
 0041A3E4    call        dword ptr [edx]
 0041A3E6    cmp         edx,dword ptr [esp+4]
>0041A3EA    jne         0041A3EF
 0041A3EC    cmp         eax,dword ptr [esp]
 0041A3EF    pop         edx
 0041A3F0    pop         eax
>0041A3F1    jne         0041A411
 0041A3F3    mov         eax,dword ptr [ebp-8]
 0041A3F6    mov         edx,dword ptr [eax]
 0041A3F8    call        dword ptr [edx]
 0041A3FA    mov         ecx,eax
 0041A3FC    mov         eax,dword ptr [ebp-0C]
 0041A3FF    mov         edx,dword ptr [eax+4]
 0041A402    mov         eax,dword ptr [ebp-8]
 0041A405    mov         eax,dword ptr [eax+4]
 0041A408    call        CompareMem
 0041A40D    test        al,al
>0041A40F    jne         0041A415
 0041A411    xor         eax,eax
>0041A413    jmp         0041A417
 0041A415    mov         al,1
 0041A417    mov         byte ptr [ebp-1],al
 0041A41A    xor         eax,eax
 0041A41C    pop         edx
 0041A41D    pop         ecx
 0041A41E    pop         ecx
 0041A41F    mov         dword ptr fs:[eax],edx
 0041A422    push        41A437
 0041A427    mov         eax,dword ptr [ebp-0C]
 0041A42A    call        TObject.Free
 0041A42F    ret
>0041A430    jmp         @HandleFinally
>0041A435    jmp         0041A427
 0041A437    xor         eax,eax
 0041A439    pop         edx
 0041A43A    pop         ecx
 0041A43B    pop         ecx
 0041A43C    mov         dword ptr fs:[eax],edx
 0041A43F    push        41A454
 0041A444    mov         eax,dword ptr [ebp-8]
 0041A447    call        TObject.Free
 0041A44C    ret
>0041A44D    jmp         @HandleFinally
>0041A452    jmp         0041A444
 0041A454    mov         al,byte ptr [ebp-1]
 0041A457    pop         edi
 0041A458    pop         esi
 0041A459    pop         ebx
 0041A45A    mov         esp,ebp
 0041A45C    pop         ebp
 0041A45D    ret         4
*}
end;

//0041A460
destructor TList.Destroy;
begin
{*
 0041A460    push        ebx
 0041A461    push        esi
 0041A462    call        @BeforeDestruction
 0041A467    mov         ebx,edx
 0041A469    mov         esi,eax
 0041A46B    mov         eax,esi
 0041A46D    mov         edx,dword ptr [eax]
 0041A46F    call        dword ptr [edx+8]
 0041A472    test        bl,bl
>0041A474    jle         0041A47D
 0041A476    mov         eax,esi
 0041A478    call        @ClassDestroy
 0041A47D    pop         esi
 0041A47E    pop         ebx
 0041A47F    ret
*}
end;

//0041A480
function TList.Add(Item:Pointer):Integer;
begin
{*
 0041A480    push        ebx
 0041A481    push        esi
 0041A482    push        edi
 0041A483    mov         edi,edx
 0041A485    mov         ebx,eax
 0041A487    mov         esi,dword ptr [ebx+8]
 0041A48A    cmp         esi,dword ptr [ebx+0C]
>0041A48D    jne         0041A495
 0041A48F    mov         eax,ebx
 0041A491    mov         edx,dword ptr [eax]
 0041A493    call        dword ptr [edx]
 0041A495    mov         eax,dword ptr [ebx+4]
 0041A498    mov         dword ptr [eax+esi*4],edi
 0041A49B    inc         dword ptr [ebx+8]
 0041A49E    test        edi,edi
>0041A4A0    je          0041A4AD
 0041A4A2    xor         ecx,ecx
 0041A4A4    mov         edx,edi
 0041A4A6    mov         eax,ebx
 0041A4A8    mov         ebx,dword ptr [eax]
 0041A4AA    call        dword ptr [ebx+4]
 0041A4AD    mov         eax,esi
 0041A4AF    pop         edi
 0041A4B0    pop         esi
 0041A4B1    pop         ebx
 0041A4B2    ret
*}
end;

//0041A4B4
procedure TList.Clear;
begin
{*
 0041A4B4    push        ebx
 0041A4B5    mov         ebx,eax
 0041A4B7    xor         edx,edx
 0041A4B9    mov         eax,ebx
 0041A4BB    call        TList.SetCount
 0041A4C0    xor         edx,edx
 0041A4C2    mov         eax,ebx
 0041A4C4    call        TList.SetCapacity
 0041A4C9    pop         ebx
 0041A4CA    ret
*}
end;

//0041A4CC
procedure TList.Delete(Index:Integer);
begin
{*
 0041A4CC    push        ebx
 0041A4CD    push        esi
 0041A4CE    push        edi
 0041A4CF    mov         esi,edx
 0041A4D1    mov         ebx,eax
 0041A4D3    test        esi,esi
>0041A4D5    jl          0041A4DC
 0041A4D7    cmp         esi,dword ptr [ebx+8]
>0041A4DA    jl          0041A4EB
 0041A4DC    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041A4E2    mov         ecx,esi
 0041A4E4    mov         eax,dword ptr [ebx]
 0041A4E6    call        TList.Error
 0041A4EB    mov         edx,esi
 0041A4ED    mov         eax,ebx
 0041A4EF    call        TList.Get
 0041A4F4    mov         edi,eax
 0041A4F6    dec         dword ptr [ebx+8]
 0041A4F9    mov         eax,dword ptr [ebx+8]
 0041A4FC    cmp         esi,eax
>0041A4FE    jge         0041A519
 0041A500    sub         eax,esi
 0041A502    mov         ecx,eax
 0041A504    shl         ecx,2
 0041A507    mov         eax,dword ptr [ebx+4]
 0041A50A    lea         edx,[eax+esi*4]
 0041A50D    mov         eax,dword ptr [ebx+4]
 0041A510    lea         eax,[eax+esi*4+4]
 0041A514    call        Move
 0041A519    test        edi,edi
>0041A51B    je          0041A528
 0041A51D    mov         cl,2
 0041A51F    mov         edx,edi
 0041A521    mov         eax,ebx
 0041A523    mov         ebx,dword ptr [eax]
 0041A525    call        dword ptr [ebx+4]
 0041A528    pop         edi
 0041A529    pop         esi
 0041A52A    pop         ebx
 0041A52B    ret
*}
end;

//0041A52C
function ReturnAddr:Pointer;
begin
{*
 0041A52C    mov         eax,dword ptr [ebp+4]
 0041A52F    ret
*}
end;

//0041A530
procedure TList.Error(const Msg:AnsiString; Data:Integer);
begin
{*
 0041A530    push        ebx
 0041A531    push        esi
 0041A532    add         esp,0FFFFFFF8
 0041A535    mov         esi,ecx
 0041A537    mov         ebx,edx
 0041A539    call        ReturnAddr
 0041A53E    push        eax
 0041A53F    mov         dword ptr [esp+4],esi
 0041A543    mov         byte ptr [esp+8],0
 0041A548    lea         eax,[esp+4]
 0041A54C    push        eax
 0041A54D    push        0
 0041A54F    mov         ecx,ebx
 0041A551    mov         dl,1
 0041A553    mov         eax,[00417AC4];EListError
 0041A558    call        Exception.CreateFmt
>0041A55D    jmp         @RaiseExcept
 0041A562    pop         ecx
 0041A563    pop         edx
 0041A564    pop         esi
 0041A565    pop         ebx
 0041A566    ret
*}
end;

//0041A568
procedure TList.Error(Msg:PResStringRec; Data:Integer);
begin
{*
 0041A568    push        ebp
 0041A569    mov         ebp,esp
 0041A56B    push        0
 0041A56D    push        ebx
 0041A56E    push        esi
 0041A56F    mov         esi,ecx
 0041A571    mov         ebx,edx
 0041A573    xor         eax,eax
 0041A575    push        ebp
 0041A576    push        41A5B0
 0041A57B    push        dword ptr fs:[eax]
 0041A57E    mov         dword ptr fs:[eax],esp
 0041A581    lea         edx,[ebp-4]
 0041A584    mov         eax,ebx
 0041A586    call        LoadStr
 0041A58B    mov         edx,dword ptr [ebp-4]
 0041A58E    mov         ecx,esi
 0041A590    mov         eax,[00417CEC];TList
 0041A595    call        TList.Error
 0041A59A    xor         eax,eax
 0041A59C    pop         edx
 0041A59D    pop         ecx
 0041A59E    pop         ecx
 0041A59F    mov         dword ptr fs:[eax],edx
 0041A5A2    push        41A5B7
 0041A5A7    lea         eax,[ebp-4]
 0041A5AA    call        @LStrClr
 0041A5AF    ret
>0041A5B0    jmp         @HandleFinally
>0041A5B5    jmp         0041A5A7
 0041A5B7    pop         esi
 0041A5B8    pop         ebx
 0041A5B9    pop         ecx
 0041A5BA    pop         ebp
 0041A5BB    ret
*}
end;

//0041A5BC
function TList.Expand:TList;
begin
{*
 0041A5BC    push        ebx
 0041A5BD    mov         ebx,eax
 0041A5BF    mov         eax,dword ptr [ebx+8]
 0041A5C2    cmp         eax,dword ptr [ebx+0C]
>0041A5C5    jne         0041A5CD
 0041A5C7    mov         eax,ebx
 0041A5C9    mov         edx,dword ptr [eax]
 0041A5CB    call        dword ptr [edx]
 0041A5CD    mov         eax,ebx
 0041A5CF    pop         ebx
 0041A5D0    ret
*}
end;

//0041A5D4
function TList.First:Pointer;
begin
{*
 0041A5D4    xor         edx,edx
 0041A5D6    call        TList.Get
 0041A5DB    ret
*}
end;

//0041A5DC
function TList.Get(Index:Integer):Pointer;
begin
{*
 0041A5DC    push        ebx
 0041A5DD    push        esi
 0041A5DE    mov         esi,edx
 0041A5E0    mov         ebx,eax
 0041A5E2    test        esi,esi
>0041A5E4    jl          0041A5EB
 0041A5E6    cmp         esi,dword ptr [ebx+8]
>0041A5E9    jl          0041A5FA
 0041A5EB    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041A5F1    mov         ecx,esi
 0041A5F3    mov         eax,dword ptr [ebx]
 0041A5F5    call        TList.Error
 0041A5FA    mov         eax,dword ptr [ebx+4]
 0041A5FD    mov         eax,dword ptr [eax+esi*4]
 0041A600    pop         esi
 0041A601    pop         ebx
 0041A602    ret
*}
end;

//0041A604
procedure TList.Grow;
begin
{*
 0041A604    mov         edx,dword ptr [eax+0C]
 0041A607    cmp         edx,40
>0041A60A    jle         0041A61A
 0041A60C    mov         ecx,edx
 0041A60E    test        ecx,ecx
>0041A610    jns         0041A615
 0041A612    add         ecx,3
 0041A615    sar         ecx,2
>0041A618    jmp         0041A62B
 0041A61A    cmp         edx,8
>0041A61D    jle         0041A626
 0041A61F    mov         ecx,10
>0041A624    jmp         0041A62B
 0041A626    mov         ecx,4
 0041A62B    add         ecx,edx
 0041A62D    mov         edx,ecx
 0041A62F    call        TList.SetCapacity
 0041A634    ret
*}
end;

//0041A638
function TList.IndexOf(Item:Pointer):Integer;
begin
{*
 0041A638    push        ebx
 0041A639    xor         ecx,ecx
>0041A63B    jmp         0041A63E
 0041A63D    inc         ecx
 0041A63E    cmp         ecx,dword ptr [eax+8]
>0041A641    jge         0041A64B
 0041A643    mov         ebx,dword ptr [eax+4]
 0041A646    cmp         edx,dword ptr [ebx+ecx*4]
>0041A649    jne         0041A63D
 0041A64B    cmp         ecx,dword ptr [eax+8]
>0041A64E    jne         0041A653
 0041A650    or          ecx,0FFFFFFFF
 0041A653    mov         eax,ecx
 0041A655    pop         ebx
 0041A656    ret
*}
end;

//0041A658
procedure TList.Insert(Index:Integer; Item:Pointer);
begin
{*
 0041A658    push        ebx
 0041A659    push        esi
 0041A65A    push        edi
 0041A65B    mov         edi,ecx
 0041A65D    mov         esi,edx
 0041A65F    mov         ebx,eax
 0041A661    test        esi,esi
>0041A663    jl          0041A66A
 0041A665    cmp         esi,dword ptr [ebx+8]
>0041A668    jle         0041A679
 0041A66A    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041A670    mov         ecx,esi
 0041A672    mov         eax,dword ptr [ebx]
 0041A674    call        TList.Error
 0041A679    mov         eax,dword ptr [ebx+8]
 0041A67C    cmp         eax,dword ptr [ebx+0C]
>0041A67F    jne         0041A687
 0041A681    mov         eax,ebx
 0041A683    mov         edx,dword ptr [eax]
 0041A685    call        dword ptr [edx]
 0041A687    mov         eax,dword ptr [ebx+8]
 0041A68A    cmp         esi,eax
>0041A68C    jge         0041A6A7
 0041A68E    sub         eax,esi
 0041A690    mov         ecx,eax
 0041A692    shl         ecx,2
 0041A695    mov         eax,dword ptr [ebx+4]
 0041A698    lea         edx,[eax+esi*4+4]
 0041A69C    mov         eax,dword ptr [ebx+4]
 0041A69F    lea         eax,[eax+esi*4]
 0041A6A2    call        Move
 0041A6A7    mov         eax,dword ptr [ebx+4]
 0041A6AA    mov         dword ptr [eax+esi*4],edi
 0041A6AD    inc         dword ptr [ebx+8]
 0041A6B0    test        edi,edi
>0041A6B2    je          0041A6BF
 0041A6B4    xor         ecx,ecx
 0041A6B6    mov         edx,edi
 0041A6B8    mov         eax,ebx
 0041A6BA    mov         ebx,dword ptr [eax]
 0041A6BC    call        dword ptr [ebx+4]
 0041A6BF    pop         edi
 0041A6C0    pop         esi
 0041A6C1    pop         ebx
 0041A6C2    ret
*}
end;

//0041A6C4
function TList.Last:Pointer;
begin
{*
 0041A6C4    mov         edx,dword ptr [eax+8]
 0041A6C7    dec         edx
 0041A6C8    call        TList.Get
 0041A6CD    ret
*}
end;

//0041A6D0
procedure TList.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 0041A6D0    push        ebx
 0041A6D1    push        esi
 0041A6D2    push        edi
 0041A6D3    push        ebp
 0041A6D4    mov         esi,ecx
 0041A6D6    mov         edi,edx
 0041A6D8    mov         ebx,eax
 0041A6DA    cmp         esi,edi
>0041A6DC    je          0041A723
 0041A6DE    test        esi,esi
>0041A6E0    jl          0041A6E7
 0041A6E2    cmp         esi,dword ptr [ebx+8]
>0041A6E5    jl          0041A6F6
 0041A6E7    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041A6ED    mov         ecx,esi
 0041A6EF    mov         eax,dword ptr [ebx]
 0041A6F1    call        TList.Error
 0041A6F6    mov         edx,edi
 0041A6F8    mov         eax,ebx
 0041A6FA    call        TList.Get
 0041A6FF    mov         ebp,eax
 0041A701    mov         eax,dword ptr [ebx+4]
 0041A704    xor         edx,edx
 0041A706    mov         dword ptr [eax+edi*4],edx
 0041A709    mov         edx,edi
 0041A70B    mov         eax,ebx
 0041A70D    call        TList.Delete
 0041A712    xor         ecx,ecx
 0041A714    mov         edx,esi
 0041A716    mov         eax,ebx
 0041A718    call        TList.Insert
 0041A71D    mov         eax,dword ptr [ebx+4]
 0041A720    mov         dword ptr [eax+esi*4],ebp
 0041A723    pop         ebp
 0041A724    pop         edi
 0041A725    pop         esi
 0041A726    pop         ebx
 0041A727    ret
*}
end;

//0041A728
procedure TList.Put(Index:Integer; Item:Pointer);
begin
{*
 0041A728    push        ebx
 0041A729    push        esi
 0041A72A    push        edi
 0041A72B    mov         edi,ecx
 0041A72D    mov         esi,edx
 0041A72F    mov         ebx,eax
 0041A731    test        esi,esi
>0041A733    jl          0041A73A
 0041A735    cmp         esi,dword ptr [ebx+8]
>0041A738    jl          0041A749
 0041A73A    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041A740    mov         ecx,esi
 0041A742    mov         eax,dword ptr [ebx]
 0041A744    call        TList.Error
 0041A749    mov         edx,dword ptr [ebx+4]
 0041A74C    mov         eax,dword ptr [edx+esi*4]
 0041A74F    cmp         edi,eax
>0041A751    je          0041A774
 0041A753    mov         dword ptr [edx+esi*4],edi
 0041A756    test        eax,eax
>0041A758    je          0041A765
 0041A75A    mov         cl,2
 0041A75C    mov         edx,eax
 0041A75E    mov         eax,ebx
 0041A760    mov         esi,dword ptr [eax]
 0041A762    call        dword ptr [esi+4]
 0041A765    test        edi,edi
>0041A767    je          0041A774
 0041A769    xor         ecx,ecx
 0041A76B    mov         edx,edi
 0041A76D    mov         eax,ebx
 0041A76F    mov         ebx,dword ptr [eax]
 0041A771    call        dword ptr [ebx+4]
 0041A774    pop         edi
 0041A775    pop         esi
 0041A776    pop         ebx
 0041A777    ret
*}
end;

//0041A778
function TList.Remove(Item:Pointer):Integer;
begin
{*
 0041A778    push        ebx
 0041A779    push        esi
 0041A77A    mov         ebx,eax
 0041A77C    mov         eax,ebx
 0041A77E    call        TList.IndexOf
 0041A783    mov         esi,eax
 0041A785    test        esi,esi
>0041A787    jl          0041A792
 0041A789    mov         edx,esi
 0041A78B    mov         eax,ebx
 0041A78D    call        TList.Delete
 0041A792    mov         eax,esi
 0041A794    pop         esi
 0041A795    pop         ebx
 0041A796    ret
*}
end;

//0041A798
procedure TList.Pack;
begin
{*
 0041A798    push        ebx
 0041A799    push        esi
 0041A79A    mov         esi,eax
 0041A79C    mov         ebx,dword ptr [esi+8]
 0041A79F    dec         ebx
 0041A7A0    cmp         ebx,0
>0041A7A3    jl          0041A7C1
 0041A7A5    mov         edx,ebx
 0041A7A7    mov         eax,esi
 0041A7A9    call        TList.Get
 0041A7AE    test        eax,eax
>0041A7B0    jne         0041A7BB
 0041A7B2    mov         edx,ebx
 0041A7B4    mov         eax,esi
 0041A7B6    call        TList.Delete
 0041A7BB    dec         ebx
 0041A7BC    cmp         ebx,0FFFFFFFF
>0041A7BF    jne         0041A7A5
 0041A7C1    pop         esi
 0041A7C2    pop         ebx
 0041A7C3    ret
*}
end;

//0041A7C4
procedure TList.SetCapacity(NewCapacity:Integer);
begin
{*
 0041A7C4    push        ebx
 0041A7C5    push        esi
 0041A7C6    mov         esi,edx
 0041A7C8    mov         ebx,eax
 0041A7CA    cmp         esi,dword ptr [ebx+8]
>0041A7CD    jl          0041A7D7
 0041A7CF    cmp         esi,7FFFFFF
>0041A7D5    jle         0041A7E6
 0041A7D7    mov         edx,dword ptr ds:[5AE4E4];^SListCapacityError:TResStringRec
 0041A7DD    mov         ecx,esi
 0041A7DF    mov         eax,dword ptr [ebx]
 0041A7E1    call        TList.Error
 0041A7E6    cmp         esi,dword ptr [ebx+0C]
>0041A7E9    je          0041A7FB
 0041A7EB    mov         edx,esi
 0041A7ED    shl         edx,2
 0041A7F0    lea         eax,[ebx+4]
 0041A7F3    call        @ReallocMem
 0041A7F8    mov         dword ptr [ebx+0C],esi
 0041A7FB    pop         esi
 0041A7FC    pop         ebx
 0041A7FD    ret
*}
end;

//0041A800
procedure TList.SetCount(NewCount:Integer);
begin
{*
 0041A800    push        ebx
 0041A801    push        esi
 0041A802    push        edi
 0041A803    push        ebp
 0041A804    mov         esi,edx
 0041A806    mov         ebx,eax
 0041A808    test        esi,esi
>0041A80A    jl          0041A814
 0041A80C    cmp         esi,7FFFFFF
>0041A812    jle         0041A823
 0041A814    mov         edx,dword ptr ds:[5AE3D4];^SListCountError:TResStringRec
 0041A81A    mov         ecx,esi
 0041A81C    mov         eax,dword ptr [ebx]
 0041A81E    call        TList.Error
 0041A823    cmp         esi,dword ptr [ebx+0C]
>0041A826    jle         0041A831
 0041A828    mov         edx,esi
 0041A82A    mov         eax,ebx
 0041A82C    call        TList.SetCapacity
 0041A831    mov         eax,dword ptr [ebx+8]
 0041A834    cmp         esi,eax
>0041A836    jle         0041A851
 0041A838    mov         edx,dword ptr [ebx+4]
 0041A83B    lea         edx,[edx+eax*4]
 0041A83E    mov         ecx,esi
 0041A840    sub         ecx,eax
 0041A842    mov         eax,ecx
 0041A844    shl         eax,2
 0041A847    xor         ecx,ecx
 0041A849    xchg        eax,edx
 0041A84A    call        @FillChar
>0041A84F    jmp         0041A868
 0041A851    mov         ebp,eax
 0041A853    dec         ebp
 0041A854    mov         edi,esi
 0041A856    sub         edi,ebp
>0041A858    jg          0041A868
 0041A85A    dec         edi
 0041A85B    mov         edx,ebp
 0041A85D    mov         eax,ebx
 0041A85F    call        TList.Delete
 0041A864    dec         ebp
 0041A865    inc         edi
>0041A866    jne         0041A85B
 0041A868    mov         dword ptr [ebx+8],esi
 0041A86B    pop         ebp
 0041A86C    pop         edi
 0041A86D    pop         esi
 0041A86E    pop         ebx
 0041A86F    ret
*}
end;

//0041A870
procedure TList.Notify(Ptr:Pointer; Action:TListNotification);
begin
{*
 0041A870    ret
*}
end;

//0041A874
constructor TThreadList.Create;
begin
{*
 0041A874    push        ebx
 0041A875    push        esi
 0041A876    test        dl,dl
>0041A878    je          0041A882
 0041A87A    add         esp,0FFFFFFF0
 0041A87D    call        @ClassCreate
 0041A882    mov         ebx,edx
 0041A884    mov         esi,eax
 0041A886    xor         edx,edx
 0041A888    mov         eax,esi
 0041A88A    call        TObject.Create
 0041A88F    lea         eax,[esi+8]
 0041A892    push        eax
 0041A893    call        KERNEL32.InitializeCriticalSection
 0041A898    mov         dl,1
 0041A89A    mov         eax,[00417CEC];TList
 0041A89F    call        TObject.Create
 0041A8A4    mov         dword ptr [esi+4],eax
 0041A8A7    mov         byte ptr [esi+20],0
 0041A8AB    mov         eax,esi
 0041A8AD    test        bl,bl
>0041A8AF    je          0041A8C0
 0041A8B1    call        @AfterConstruction
 0041A8B6    pop         dword ptr fs:[0]
 0041A8BD    add         esp,0C
 0041A8C0    mov         eax,esi
 0041A8C2    pop         esi
 0041A8C3    pop         ebx
 0041A8C4    ret
*}
end;

//0041A8C8
destructor TThreadList.Destroy;
begin
{*
 0041A8C8    push        ebp
 0041A8C9    mov         ebp,esp
 0041A8CB    add         esp,0FFFFFFF8
 0041A8CE    call        @BeforeDestruction
 0041A8D3    mov         byte ptr [ebp-5],dl
 0041A8D6    mov         dword ptr [ebp-4],eax
 0041A8D9    mov         eax,dword ptr [ebp-4]
 0041A8DC    call        TThreadList.LockList
 0041A8E1    xor         eax,eax
 0041A8E3    push        ebp
 0041A8E4    push        41A92A
 0041A8E9    push        dword ptr fs:[eax]
 0041A8EC    mov         dword ptr fs:[eax],esp
 0041A8EF    mov         eax,dword ptr [ebp-4]
 0041A8F2    mov         eax,dword ptr [eax+4]
 0041A8F5    call        TObject.Free
 0041A8FA    mov         dl,byte ptr [ebp-5]
 0041A8FD    and         dl,0FC
 0041A900    mov         eax,dword ptr [ebp-4]
 0041A903    call        TObject.Destroy
 0041A908    xor         eax,eax
 0041A90A    pop         edx
 0041A90B    pop         ecx
 0041A90C    pop         ecx
 0041A90D    mov         dword ptr fs:[eax],edx
 0041A910    push        41A931
 0041A915    mov         eax,dword ptr [ebp-4]
 0041A918    call        TThreadList.UnlockList
 0041A91D    mov         eax,dword ptr [ebp-4]
 0041A920    add         eax,8
 0041A923    push        eax
 0041A924    call        KERNEL32.DeleteCriticalSection
 0041A929    ret
>0041A92A    jmp         @HandleFinally
>0041A92F    jmp         0041A915
 0041A931    cmp         byte ptr [ebp-5],0
>0041A935    jle         0041A93F
 0041A937    mov         eax,dword ptr [ebp-4]
 0041A93A    call        @ClassDestroy
 0041A93F    pop         ecx
 0041A940    pop         ecx
 0041A941    pop         ebp
 0041A942    ret
*}
end;

//0041A944
procedure TThreadList.Add(Item:Pointer);
begin
{*
 0041A944    push        ebp
 0041A945    mov         ebp,esp
 0041A947    push        ecx
 0041A948    push        ebx
 0041A949    mov         ebx,edx
 0041A94B    mov         dword ptr [ebp-4],eax
 0041A94E    mov         eax,dword ptr [ebp-4]
 0041A951    call        TThreadList.LockList
 0041A956    xor         eax,eax
 0041A958    push        ebp
 0041A959    push        41A9C0
 0041A95E    push        dword ptr fs:[eax]
 0041A961    mov         dword ptr fs:[eax],esp
 0041A964    mov         eax,dword ptr [ebp-4]
 0041A967    cmp         byte ptr [eax+20],1
>0041A96B    je          0041A97D
 0041A96D    mov         eax,dword ptr [ebp-4]
 0041A970    mov         eax,dword ptr [eax+4]
 0041A973    mov         edx,ebx
 0041A975    call        TList.IndexOf
 0041A97A    inc         eax
>0041A97B    jne         0041A98C
 0041A97D    mov         eax,dword ptr [ebp-4]
 0041A980    mov         eax,dword ptr [eax+4]
 0041A983    mov         edx,ebx
 0041A985    call        TList.Add
>0041A98A    jmp         0041A9AA
 0041A98C    mov         eax,dword ptr [ebp-4]
 0041A98F    cmp         byte ptr [eax+20],2
>0041A993    jne         0041A9AA
 0041A995    mov         edx,dword ptr ds:[5AE3B0];^SDuplicateItem:TResStringRec
 0041A99B    mov         eax,dword ptr [ebp-4]
 0041A99E    mov         eax,dword ptr [eax+4]
 0041A9A1    mov         eax,dword ptr [eax]
 0041A9A3    mov         ecx,ebx
 0041A9A5    call        TList.Error
 0041A9AA    xor         eax,eax
 0041A9AC    pop         edx
 0041A9AD    pop         ecx
 0041A9AE    pop         ecx
 0041A9AF    mov         dword ptr fs:[eax],edx
 0041A9B2    push        41A9C7
 0041A9B7    mov         eax,dword ptr [ebp-4]
 0041A9BA    call        TThreadList.UnlockList
 0041A9BF    ret
>0041A9C0    jmp         @HandleFinally
>0041A9C5    jmp         0041A9B7
 0041A9C7    pop         ebx
 0041A9C8    pop         ecx
 0041A9C9    pop         ebp
 0041A9CA    ret
*}
end;

//0041A9CC
function TThreadList.LockList:TList;
begin
{*
 0041A9CC    push        ebx
 0041A9CD    mov         ebx,eax
 0041A9CF    lea         eax,[ebx+8]
 0041A9D2    push        eax
 0041A9D3    call        KERNEL32.EnterCriticalSection
 0041A9D8    mov         eax,dword ptr [ebx+4]
 0041A9DB    pop         ebx
 0041A9DC    ret
*}
end;

//0041A9E0
procedure TThreadList.Remove(Item:Pointer);
begin
{*
 0041A9E0    push        ebp
 0041A9E1    mov         ebp,esp
 0041A9E3    push        ecx
 0041A9E4    push        ebx
 0041A9E5    mov         ebx,edx
 0041A9E7    mov         dword ptr [ebp-4],eax
 0041A9EA    mov         eax,dword ptr [ebp-4]
 0041A9ED    call        TThreadList.LockList
 0041A9F2    xor         eax,eax
 0041A9F4    push        ebp
 0041A9F5    push        41AA23
 0041A9FA    push        dword ptr fs:[eax]
 0041A9FD    mov         dword ptr fs:[eax],esp
 0041AA00    mov         eax,dword ptr [ebp-4]
 0041AA03    mov         eax,dword ptr [eax+4]
 0041AA06    mov         edx,ebx
 0041AA08    call        TList.Remove
 0041AA0D    xor         eax,eax
 0041AA0F    pop         edx
 0041AA10    pop         ecx
 0041AA11    pop         ecx
 0041AA12    mov         dword ptr fs:[eax],edx
 0041AA15    push        41AA2A
 0041AA1A    mov         eax,dword ptr [ebp-4]
 0041AA1D    call        TThreadList.UnlockList
 0041AA22    ret
>0041AA23    jmp         @HandleFinally
>0041AA28    jmp         0041AA1A
 0041AA2A    pop         ebx
 0041AA2B    pop         ecx
 0041AA2C    pop         ebp
 0041AA2D    ret
*}
end;

//0041AA30
procedure TThreadList.UnlockList;
begin
{*
 0041AA30    add         eax,8
 0041AA33    push        eax
 0041AA34    call        KERNEL32.LeaveCriticalSection
 0041AA39    ret
*}
end;

//0041AA3C
destructor TBits.Destroy;
begin
{*
 0041AA3C    push        ebx
 0041AA3D    push        esi
 0041AA3E    call        @BeforeDestruction
 0041AA43    mov         ebx,edx
 0041AA45    mov         esi,eax
 0041AA47    xor         edx,edx
 0041AA49    mov         eax,esi
 0041AA4B    call        TBits.SetSize
 0041AA50    mov         edx,ebx
 0041AA52    and         dl,0FC
 0041AA55    mov         eax,esi
 0041AA57    call        TObject.Destroy
 0041AA5C    test        bl,bl
>0041AA5E    jle         0041AA67
 0041AA60    mov         eax,esi
 0041AA62    call        @ClassDestroy
 0041AA67    pop         esi
 0041AA68    pop         ebx
 0041AA69    ret
*}
end;

//0041AA6C
procedure TBits.Error;
begin
{*
 0041AA6C    mov         ecx,dword ptr ds:[5AE6D0];^SBitsIndexError:TResStringRec
 0041AA72    mov         dl,1
 0041AA74    mov         eax,[00417B1C];EBitsError
 0041AA79    call        Exception.CreateRes
 0041AA7E    call        @RaiseExcept
 0041AA83    ret
*}
end;

//0041AA84
function Min(X:Integer; Y:Integer):Integer;
begin
{*
 0041AA84    mov         ecx,eax
 0041AA86    cmp         edx,eax
>0041AA88    jge         0041AA8C
 0041AA8A    mov         ecx,edx
 0041AA8C    mov         eax,ecx
 0041AA8E    ret
*}
end;

//0041AA90
procedure TBits.SetSize(Value:Integer);
begin
{*
 0041AA90    push        ebx
 0041AA91    push        esi
 0041AA92    push        edi
 0041AA93    push        ebp
 0041AA94    push        ecx
 0041AA95    mov         esi,edx
 0041AA97    mov         ebx,eax
 0041AA99    cmp         esi,dword ptr [ebx+4]
>0041AA9C    je          0041AB2C
 0041AAA2    test        esi,esi
>0041AAA4    jge         0041AAAD
 0041AAA6    mov         eax,ebx
 0041AAA8    call        TBits.Error
 0041AAAD    lea         eax,[esi+20]
 0041AAB0    dec         eax
 0041AAB1    test        eax,eax
>0041AAB3    jns         0041AAB8
 0041AAB5    add         eax,1F
 0041AAB8    sar         eax,5
 0041AABB    mov         edi,eax
 0041AABD    shl         edi,2
 0041AAC0    mov         eax,dword ptr [ebx+4]
 0041AAC3    add         eax,20
 0041AAC6    dec         eax
 0041AAC7    test        eax,eax
>0041AAC9    jns         0041AACE
 0041AACB    add         eax,1F
 0041AACE    sar         eax,5
 0041AAD1    mov         ebp,eax
 0041AAD3    shl         ebp,2
 0041AAD6    cmp         ebp,edi
>0041AAD8    je          0041AB29
 0041AADA    xor         eax,eax
 0041AADC    mov         dword ptr [esp],eax
 0041AADF    test        edi,edi
>0041AAE1    je          0041AAF9
 0041AAE3    mov         eax,edi
 0041AAE5    call        @GetMem
 0041AAEA    mov         dword ptr [esp],eax
 0041AAED    mov         eax,dword ptr [esp]
 0041AAF0    xor         ecx,ecx
 0041AAF2    mov         edx,edi
 0041AAF4    call        @FillChar
 0041AAF9    test        ebp,ebp
>0041AAFB    je          0041AB23
 0041AAFD    cmp         dword ptr [esp],0
>0041AB01    je          0041AB19
 0041AB03    mov         edx,edi
 0041AB05    mov         eax,ebp
 0041AB07    call        Min
 0041AB0C    mov         ecx,eax
 0041AB0E    mov         edx,dword ptr [esp]
 0041AB11    mov         eax,dword ptr [ebx+8]
 0041AB14    call        Move
 0041AB19    mov         edx,ebp
 0041AB1B    mov         eax,dword ptr [ebx+8]
 0041AB1E    call        @FreeMem
 0041AB23    mov         eax,dword ptr [esp]
 0041AB26    mov         dword ptr [ebx+8],eax
 0041AB29    mov         dword ptr [ebx+4],esi
 0041AB2C    pop         edx
 0041AB2D    pop         ebp
 0041AB2E    pop         edi
 0041AB2F    pop         esi
 0041AB30    pop         ebx
 0041AB31    ret
*}
end;

//0041AB34
procedure TBits.SetBit(Index:Integer; Value:Boolean);
begin
{*
 0041AB34    cmp         edx,dword ptr [eax+4]
>0041AB37    jae         0041AB48
 0041AB39    mov         eax,dword ptr [eax+8]
 0041AB3C    or          cl,cl
>0041AB3E    je          0041AB44
 0041AB40    bts         dword ptr [eax],edx
 0041AB43    ret
 0041AB44    btr         dword ptr [eax],edx
 0041AB47    ret
 0041AB48    cmp         edx,0
>0041AB4B    jl          0041AA6C
 0041AB51    push        eax
 0041AB52    push        edx
 0041AB53    push        ecx
 0041AB54    inc         edx
 0041AB55    call        TBits.SetSize
 0041AB5A    pop         ecx
 0041AB5B    pop         edx
 0041AB5C    pop         eax
>0041AB5D    jmp         0041AB39
 0041AB5F    ret
*}
end;

//0041AB60
function TBits.OpenBit:Integer;
begin
{*
 0041AB60    push        ebx
 0041AB61    push        esi
 0041AB62    push        edi
 0041AB63    push        ecx
 0041AB64    mov         ebx,eax
 0041AB66    mov         eax,dword ptr [ebx+4]
 0041AB69    add         eax,20
 0041AB6C    dec         eax
 0041AB6D    test        eax,eax
>0041AB6F    jns         0041AB74
 0041AB71    add         eax,1F
 0041AB74    sar         eax,5
 0041AB77    dec         eax
 0041AB78    test        eax,eax
>0041AB7A    jl          0041ABC9
 0041AB7C    inc         eax
 0041AB7D    mov         dword ptr [esp],eax
 0041AB80    xor         esi,esi
 0041AB82    mov         eax,dword ptr [ebx+8]
 0041AB85    mov         edx,dword ptr ds:[41ABD4]
 0041AB8B    cmp         edx,dword ptr [eax+esi*4]
>0041AB8E    je          0041ABC3
 0041AB90    mov         eax,dword ptr [ebx+8]
 0041AB93    mov         edi,dword ptr [eax+esi*4]
 0041AB96    xor         eax,eax
 0041AB98    mov         edx,eax
 0041AB9A    cmp         dl,1F
>0041AB9D    ja          0041ABA5
 0041AB9F    and         edx,7F
 0041ABA2    bt          edi,edx
>0041ABA5    jb          0041ABBE
 0041ABA7    mov         edx,esi
 0041ABA9    shl         edx,5
 0041ABAC    and         eax,7F
 0041ABAF    add         edx,eax
 0041ABB1    mov         eax,edx
 0041ABB3    mov         edx,dword ptr [ebx+4]
 0041ABB6    cmp         eax,edx
>0041ABB8    jl          0041ABCC
 0041ABBA    mov         eax,edx
>0041ABBC    jmp         0041ABCC
 0041ABBE    inc         eax
 0041ABBF    cmp         al,20
>0041ABC1    jne         0041AB98
 0041ABC3    inc         esi
 0041ABC4    dec         dword ptr [esp]
>0041ABC7    jne         0041AB82
 0041ABC9    mov         eax,dword ptr [ebx+4]
 0041ABCC    pop         edx
 0041ABCD    pop         edi
 0041ABCE    pop         esi
 0041ABCF    pop         ebx
 0041ABD0    ret
*}
end;

//0041ABD8
destructor TMemoryStream.Destroy;
begin
{*
 0041ABD8    push        ebx
 0041ABD9    push        esi
 0041ABDA    call        @BeforeDestruction
 0041ABDF    mov         ebx,edx
 0041ABE1    mov         esi,eax
 0041ABE3    mov         eax,esi
 0041ABE5    call        TMemoryStream.Clear
 0041ABEA    mov         edx,ebx
 0041ABEC    and         dl,0FC
 0041ABEF    mov         eax,esi
 0041ABF1    call        TObject.Destroy
 0041ABF6    test        bl,bl
>0041ABF8    jle         0041AC01
 0041ABFA    mov         eax,esi
 0041ABFC    call        @ClassDestroy
 0041AC01    pop         esi
 0041AC02    pop         ebx
 0041AC03    ret
*}
end;

//0041AC04
procedure TPersistent.Assign(Source:TPersistent);
begin
{*
 0041AC04    test        edx,edx
>0041AC06    je          0041AC0E
 0041AC08    xchg        eax,edx
 0041AC09    mov         ecx,dword ptr [eax]
 0041AC0B    call        dword ptr [ecx]
 0041AC0D    ret
 0041AC0E    xor         edx,edx
 0041AC10    call        TPersistent.AssignError
 0041AC15    ret
*}
end;

//0041AC18
procedure TPersistent.AssignError(Source:TPersistent);
begin
{*
 0041AC18    push        ebp
 0041AC19    mov         ebp,esp
 0041AC1B    add         esp,0FFFFFEEC
 0041AC21    push        ebx
 0041AC22    push        esi
 0041AC23    xor         ecx,ecx
 0041AC25    mov         dword ptr [ebp-4],ecx
 0041AC28    mov         esi,edx
 0041AC2A    mov         ebx,eax
 0041AC2C    xor         eax,eax
 0041AC2E    push        ebp
 0041AC2F    push        41ACCE
 0041AC34    push        dword ptr fs:[eax]
 0041AC37    mov         dword ptr fs:[eax],esp
 0041AC3A    test        esi,esi
>0041AC3C    je          0041AC5B
 0041AC3E    lea         edx,[ebp-104]
 0041AC44    mov         eax,dword ptr [esi]
 0041AC46    call        TObject.ClassName
 0041AC4B    lea         edx,[ebp-104]
 0041AC51    lea         eax,[ebp-4]
 0041AC54    call        @LStrFromString
>0041AC59    jmp         0041AC68
 0041AC5B    lea         eax,[ebp-4]
 0041AC5E    mov         edx,41ACE4;'nil'
 0041AC63    call        @LStrLAsg
 0041AC68    mov         eax,dword ptr [ebp-4]
 0041AC6B    mov         dword ptr [ebp-114],eax
 0041AC71    mov         byte ptr [ebp-110],0B
 0041AC78    lea         edx,[ebp-104]
 0041AC7E    mov         eax,dword ptr [ebx]
 0041AC80    call        TObject.ClassName
 0041AC85    lea         eax,[ebp-104]
 0041AC8B    mov         dword ptr [ebp-10C],eax
 0041AC91    mov         byte ptr [ebp-108],4
 0041AC98    lea         eax,[ebp-114]
 0041AC9E    push        eax
 0041AC9F    push        1
 0041ACA1    mov         ecx,dword ptr ds:[5AE3F8];^SAssignError:TResStringRec
 0041ACA7    mov         dl,1
 0041ACA9    mov         eax,[00409188];EConvertError
 0041ACAE    call        Exception.CreateResFmt
 0041ACB3    call        @RaiseExcept
 0041ACB8    xor         eax,eax
 0041ACBA    pop         edx
 0041ACBB    pop         ecx
 0041ACBC    pop         ecx
 0041ACBD    mov         dword ptr fs:[eax],edx
 0041ACC0    push        41ACD5
 0041ACC5    lea         eax,[ebp-4]
 0041ACC8    call        @LStrClr
 0041ACCD    ret
>0041ACCE    jmp         @HandleFinally
>0041ACD3    jmp         0041ACC5
 0041ACD5    pop         esi
 0041ACD6    pop         ebx
 0041ACD7    mov         esp,ebp
 0041ACD9    pop         ebp
 0041ACDA    ret
*}
end;

//0041ACE8
procedure TPersistent.AssignTo(Dest:TPersistent);
begin
{*
 0041ACE8    xchg        eax,edx
 0041ACE9    call        TPersistent.AssignError
 0041ACEE    ret
*}
end;

//0041ACF0
procedure sub_0041ACF0;
begin
{*
 0041ACF0    ret
*}
end;

//0041ACF4
procedure TPersistent.GetNamePath;
begin
{*
 0041ACF4    push        ebp
 0041ACF5    mov         ebp,esp
 0041ACF7    add         esp,0FFFFFEFC
 0041ACFD    push        ebx
 0041ACFE    push        esi
 0041ACFF    push        edi
 0041AD00    xor         ecx,ecx
 0041AD02    mov         dword ptr [ebp-4],ecx
 0041AD05    mov         edi,edx
 0041AD07    mov         ebx,eax
 0041AD09    xor         eax,eax
 0041AD0B    push        ebp
 0041AD0C    push        41AD89
 0041AD11    push        dword ptr fs:[eax]
 0041AD14    mov         dword ptr fs:[eax],esp
 0041AD17    lea         edx,[ebp-104]
 0041AD1D    mov         eax,dword ptr [ebx]
 0041AD1F    call        TObject.ClassName
 0041AD24    lea         edx,[ebp-104]
 0041AD2A    mov         eax,edi
 0041AD2C    call        @LStrFromString
 0041AD31    mov         eax,ebx
 0041AD33    mov         si,0FFFF
 0041AD37    call        @CallDynaInst
 0041AD3C    test        eax,eax
>0041AD3E    je          0041AD73
 0041AD40    mov         eax,ebx
 0041AD42    mov         si,0FFFF
 0041AD46    call        @CallDynaInst
 0041AD4B    lea         edx,[ebp-4]
 0041AD4E    mov         si,0FFFE
 0041AD52    call        @CallDynaInst
 0041AD57    cmp         dword ptr [ebp-4],0
>0041AD5B    je          0041AD73
 0041AD5D    push        dword ptr [ebp-4]
 0041AD60    push        41ADA0;'.'
 0041AD65    push        dword ptr [edi]
 0041AD67    mov         eax,edi
 0041AD69    mov         edx,3
 0041AD6E    call        @LStrCatN
 0041AD73    xor         eax,eax
 0041AD75    pop         edx
 0041AD76    pop         ecx
 0041AD77    pop         ecx
 0041AD78    mov         dword ptr fs:[eax],edx
 0041AD7B    push        41AD90
 0041AD80    lea         eax,[ebp-4]
 0041AD83    call        @LStrClr
 0041AD88    ret
>0041AD89    jmp         @HandleFinally
>0041AD8E    jmp         0041AD80
 0041AD90    pop         edi
 0041AD91    pop         esi
 0041AD92    pop         ebx
 0041AD93    mov         esp,ebp
 0041AD95    pop         ebp
 0041AD96    ret
*}
end;

//0041ADA4
procedure TPersistent.sub_0041ADA4;
begin
{*
 0041ADA4    xor         eax,eax
 0041ADA6    ret
*}
end;

//0041ADA8
procedure TInterfacedPersistent.AfterConstruction;
begin
{*
 0041ADA8    push        ebx
 0041ADA9    push        esi
 0041ADAA    mov         ebx,eax
 0041ADAC    mov         eax,ebx
 0041ADAE    call        TObject.AfterConstruction
 0041ADB3    mov         eax,ebx
 0041ADB5    mov         si,0FFFF
 0041ADB9    call        @CallDynaInst
 0041ADBE    test        eax,eax
>0041ADC0    je          0041ADE3
 0041ADC2    mov         eax,ebx
 0041ADC4    mov         si,0FFFF
 0041ADC8    call        @CallDynaInst
 0041ADCD    push        eax
 0041ADCE    lea         eax,[ebx+4]
 0041ADD1    call        @IntfClear
 0041ADD6    mov         ecx,eax
 0041ADD8    mov         edx,41ADE8
 0041ADDD    pop         eax
 0041ADDE    call        TObject.GetInterface
 0041ADE3    pop         esi
 0041ADE4    pop         ebx
 0041ADE5    ret
*}
end;

//0041ADF8
function TInterfacedPersistent._AddRef:Integer; stdcall;
begin
{*
 0041ADF8    push        ebp
 0041ADF9    mov         ebp,esp
 0041ADFB    mov         eax,dword ptr [ebp+8]
 0041ADFE    cmp         dword ptr [eax+4],0
>0041AE02    je          0041AE0F
 0041AE04    mov         eax,dword ptr [eax+4]
 0041AE07    push        eax
 0041AE08    mov         eax,dword ptr [eax]
 0041AE0A    call        dword ptr [eax+4]
>0041AE0D    jmp         0041AE12
 0041AE0F    or          eax,0FFFFFFFF
 0041AE12    pop         ebp
 0041AE13    ret         4
*}
end;

//0041AE18
function TInterfacedPersistent._Release:Integer; stdcall;
begin
{*
 0041AE18    push        ebp
 0041AE19    mov         ebp,esp
 0041AE1B    mov         eax,dword ptr [ebp+8]
 0041AE1E    cmp         dword ptr [eax+4],0
>0041AE22    je          0041AE2F
 0041AE24    mov         eax,dword ptr [eax+4]
 0041AE27    push        eax
 0041AE28    mov         eax,dword ptr [eax]
 0041AE2A    call        dword ptr [eax+8]
>0041AE2D    jmp         0041AE32
 0041AE2F    or          eax,0FFFFFFFF
 0041AE32    pop         ebp
 0041AE33    ret         4
*}
end;

//0041AE38
function TInterfacedPersistent.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 0041AE38    push        ebp
 0041AE39    mov         ebp,esp
 0041AE3B    push        ebx
 0041AE3C    mov         ebx,dword ptr [ebp+8]
 0041AE3F    mov         ecx,dword ptr [ebp+10]
 0041AE42    mov         edx,dword ptr [ebp+0C]
 0041AE45    mov         eax,ebx
 0041AE47    call        TObject.GetInterface
 0041AE4C    test        al,al
>0041AE4E    je          0041AE54
 0041AE50    xor         eax,eax
>0041AE52    jmp         0041AE59
 0041AE54    mov         eax,80004002
 0041AE59    pop         ebx
 0041AE5A    pop         ebp
 0041AE5B    ret         0C
*}
end;

//0041AE60
procedure GetDesigner(Obj:TPersistent; var Result:IDesignerNotify);
begin
{*
 0041AE60    push        ebp
 0041AE61    mov         ebp,esp
 0041AE63    push        ebx
 0041AE64    push        esi
 0041AE65    push        edi
 0041AE66    mov         edi,edx
 0041AE68    mov         ebx,eax
 0041AE6A    test        edi,edi
>0041AE6C    je          0041AE72
 0041AE6E    xor         eax,eax
 0041AE70    mov         dword ptr [edi],eax
 0041AE72    mov         eax,edi
 0041AE74    call        @IntfClear
 0041AE79    test        ebx,ebx
>0041AE7B    je          0041AEE1
 0041AE7D    mov         eax,ebx
 0041AE7F    mov         si,0FFFF
 0041AE83    call        @CallDynaInst
 0041AE88    mov         esi,eax
 0041AE8A    test        esi,esi
>0041AE8C    jne         0041AEBA
 0041AE8E    mov         eax,ebx
 0041AE90    mov         edx,dword ptr ds:[418C6C];TComponent
 0041AE96    call        @IsClass
 0041AE9B    test        al,al
>0041AE9D    je          0041AEE1
 0041AE9F    test        byte ptr [ebx+1C],10
>0041AEA3    je          0041AEE1
 0041AEA5    mov         eax,edi
 0041AEA7    call        @IntfClear
 0041AEAC    push        eax
 0041AEAD    push        41AEE8
 0041AEB2    push        ebx
 0041AEB3    mov         eax,dword ptr [ebx]
 0041AEB5    call        dword ptr [eax+28]
>0041AEB8    jmp         0041AEE1
 0041AEBA    mov         eax,ebx
 0041AEBC    mov         edx,dword ptr ds:[418C6C];TComponent
 0041AEC2    call        @IsClass
 0041AEC7    test        al,al
>0041AEC9    je          0041AED1
 0041AECB    test        byte ptr [ebx+1C],10
>0041AECF    je          0041AEE1
 0041AED1    mov         eax,edi
 0041AED3    call        @IntfClear
 0041AED8    mov         edx,eax
 0041AEDA    mov         eax,esi
 0041AEDC    call        GetDesigner
 0041AEE1    pop         edi
 0041AEE2    pop         esi
 0041AEE3    pop         ebx
 0041AEE4    pop         ebp
 0041AEE5    ret
*}
end;

//0041AEF8
procedure NotifyDesigner(Self:TPersistent; Item:TPersistent; Operation:TOperation);
begin
{*
 0041AEF8    push        ebp
 0041AEF9    mov         ebp,esp
 0041AEFB    push        0
 0041AEFD    push        ebx
 0041AEFE    push        esi
 0041AEFF    push        edi
 0041AF00    mov         ebx,ecx
 0041AF02    mov         esi,edx
 0041AF04    mov         edi,eax
 0041AF06    xor         eax,eax
 0041AF08    push        ebp
 0041AF09    push        41AF4D
 0041AF0E    push        dword ptr fs:[eax]
 0041AF11    mov         dword ptr fs:[eax],esp
 0041AF14    lea         eax,[ebp-4]
 0041AF17    call        @IntfClear
 0041AF1C    mov         edx,eax
 0041AF1E    mov         eax,edi
 0041AF20    call        GetDesigner
 0041AF25    cmp         dword ptr [ebp-4],0
>0041AF29    je          0041AF37
 0041AF2B    mov         ecx,ebx
 0041AF2D    mov         edx,esi
 0041AF2F    mov         eax,dword ptr [ebp-4]
 0041AF32    mov         ebx,dword ptr [eax]
 0041AF34    call        dword ptr [ebx+10]
 0041AF37    xor         eax,eax
 0041AF39    pop         edx
 0041AF3A    pop         ecx
 0041AF3B    pop         ecx
 0041AF3C    mov         dword ptr fs:[eax],edx
 0041AF3F    push        41AF54
 0041AF44    lea         eax,[ebp-4]
 0041AF47    call        @IntfClear
 0041AF4C    ret
>0041AF4D    jmp         @HandleFinally
>0041AF52    jmp         0041AF44
 0041AF54    pop         edi
 0041AF55    pop         esi
 0041AF56    pop         ebx
 0041AF57    pop         ecx
 0041AF58    pop         ebp
 0041AF59    ret
*}
end;

//0041AF5C
constructor TCollectionItem.Create(Collection:TCollection);
begin
{*
 0041AF5C    push        ebx
 0041AF5D    push        esi
 0041AF5E    test        dl,dl
>0041AF60    je          0041AF6A
 0041AF62    add         esp,0FFFFFFF0
 0041AF65    call        @ClassCreate
 0041AF6A    mov         ebx,edx
 0041AF6C    mov         esi,eax
 0041AF6E    mov         edx,ecx
 0041AF70    mov         eax,esi
 0041AF72    mov         ecx,dword ptr [eax]
 0041AF74    call        dword ptr [ecx+10]
 0041AF77    mov         eax,esi
 0041AF79    test        bl,bl
>0041AF7B    je          0041AF8C
 0041AF7D    call        @AfterConstruction
 0041AF82    pop         dword ptr fs:[0]
 0041AF89    add         esp,0C
 0041AF8C    mov         eax,esi
 0041AF8E    pop         esi
 0041AF8F    pop         ebx
 0041AF90    ret
*}
end;

//0041AF94
destructor TCollectionItem.Destroy;
begin
{*
 0041AF94    push        ebx
 0041AF95    push        esi
 0041AF96    call        @BeforeDestruction
 0041AF9B    mov         ebx,edx
 0041AF9D    mov         esi,eax
 0041AF9F    xor         edx,edx
 0041AFA1    mov         eax,esi
 0041AFA3    mov         ecx,dword ptr [eax]
 0041AFA5    call        dword ptr [ecx+10];TCollectionItem.SetCollection
 0041AFA8    mov         edx,ebx
 0041AFAA    and         dl,0FC
 0041AFAD    mov         eax,esi
 0041AFAF    call        TMemoryStream.Destroy
 0041AFB4    test        bl,bl
>0041AFB6    jle         0041AFBF
 0041AFB8    mov         eax,esi
 0041AFBA    call        @ClassDestroy
 0041AFBF    pop         esi
 0041AFC0    pop         ebx
 0041AFC1    ret
*}
end;

//0041AFC4
procedure TCollectionItem.Changed(AllItems:Boolean);
begin
{*
 0041AFC4    push        esi
 0041AFC5    mov         esi,dword ptr [eax+4]
 0041AFC8    test        esi,esi
>0041AFCA    je          0041AFE3
 0041AFCC    cmp         dword ptr [esi+0C],0
>0041AFD0    jne         0041AFE3
 0041AFD2    test        dl,dl
>0041AFD4    je          0041AFDA
 0041AFD6    xor         edx,edx
>0041AFD8    jmp         0041AFDC
 0041AFDA    mov         edx,eax
 0041AFDC    mov         eax,esi
 0041AFDE    mov         ecx,dword ptr [eax]
 0041AFE0    call        dword ptr [ecx+1C]
 0041AFE3    pop         esi
 0041AFE4    ret
*}
end;

//0041AFE8
function TCollectionItem.GetIndex:Integer;
begin
{*
 0041AFE8    mov         edx,dword ptr [eax+4]
 0041AFEB    test        edx,edx
>0041AFED    je          0041AFF9
 0041AFEF    mov         edx,dword ptr [edx+8]
 0041AFF2    xchg        eax,edx
 0041AFF3    call        TList.IndexOf
 0041AFF8    ret
 0041AFF9    or          eax,0FFFFFFFF
 0041AFFC    ret
*}
end;

//0041B000
function TCollectionItem.GetDisplayName:AnsiString;
begin
{*
 0041B000    push        ebx
 0041B001    push        esi
 0041B002    add         esp,0FFFFFF00
 0041B008    mov         esi,edx
 0041B00A    mov         ebx,eax
 0041B00C    mov         edx,esp
 0041B00E    mov         eax,dword ptr [ebx]
 0041B010    call        TObject.ClassName
 0041B015    mov         edx,esp
 0041B017    mov         eax,esi
 0041B019    call        @LStrFromString
 0041B01E    add         esp,100
 0041B024    pop         esi
 0041B025    pop         ebx
 0041B026    ret
*}
end;

//0041B028
procedure TCollectionItem.GetNamePath;
begin
{*
 0041B028    push        ebp
 0041B029    mov         ebp,esp
 0041B02B    add         esp,0FFFFFEEC
 0041B031    push        ebx
 0041B032    push        esi
 0041B033    push        edi
 0041B034    xor         ecx,ecx
 0041B036    mov         dword ptr [ebp-14],ecx
 0041B039    mov         edi,edx
 0041B03B    mov         ebx,eax
 0041B03D    xor         eax,eax
 0041B03F    push        ebp
 0041B040    push        41B0BD
 0041B045    push        dword ptr fs:[eax]
 0041B048    mov         dword ptr fs:[eax],esp
 0041B04B    cmp         dword ptr [ebx+4],0
>0041B04F    je          0041B08D
 0041B051    push        edi
 0041B052    lea         edx,[ebp-14]
 0041B055    mov         eax,dword ptr [ebx+4]
 0041B058    mov         si,0FFFE
 0041B05C    call        @CallDynaInst
 0041B061    mov         eax,dword ptr [ebp-14]
 0041B064    mov         dword ptr [ebp-10],eax
 0041B067    mov         byte ptr [ebp-0C],0B
 0041B06B    mov         eax,ebx
 0041B06D    call        TCollectionItem.GetIndex
 0041B072    mov         dword ptr [ebp-8],eax
 0041B075    mov         byte ptr [ebp-4],0
 0041B079    lea         edx,[ebp-10]
 0041B07C    mov         ecx,1
 0041B081    mov         eax,41B0D4;'%s[%d]'
 0041B086    call        Format
>0041B08B    jmp         0041B0A7
 0041B08D    lea         edx,[ebp-114]
 0041B093    mov         eax,dword ptr [ebx]
 0041B095    call        TObject.ClassName
 0041B09A    lea         edx,[ebp-114]
 0041B0A0    mov         eax,edi
 0041B0A2    call        @LStrFromString
 0041B0A7    xor         eax,eax
 0041B0A9    pop         edx
 0041B0AA    pop         ecx
 0041B0AB    pop         ecx
 0041B0AC    mov         dword ptr fs:[eax],edx
 0041B0AF    push        41B0C4
 0041B0B4    lea         eax,[ebp-14]
 0041B0B7    call        @LStrClr
 0041B0BC    ret
>0041B0BD    jmp         @HandleFinally
>0041B0C2    jmp         0041B0B4
 0041B0C4    pop         edi
 0041B0C5    pop         esi
 0041B0C6    pop         ebx
 0041B0C7    mov         esp,ebp
 0041B0C9    pop         ebp
 0041B0CA    ret
*}
end;

//0041B0DC
procedure TCollectionItem.sub_0041ADA4;
begin
{*
 0041B0DC    mov         eax,dword ptr [eax+4];TCollectionItem.FCollection:TCollection
 0041B0DF    ret
*}
end;

//0041B0E0
procedure TCollectionItem.SetCollection(Value:TCollection);
begin
{*
 0041B0E0    push        ebx
 0041B0E1    push        esi
 0041B0E2    mov         esi,edx
 0041B0E4    mov         ebx,eax
 0041B0E6    mov         eax,dword ptr [ebx+4]
 0041B0E9    cmp         esi,eax
>0041B0EB    je          0041B105
 0041B0ED    test        eax,eax
>0041B0EF    je          0041B0F8
 0041B0F1    mov         edx,ebx
 0041B0F3    call        TCollection.RemoveItem
 0041B0F8    test        esi,esi
>0041B0FA    je          0041B105
 0041B0FC    mov         edx,ebx
 0041B0FE    mov         eax,esi
 0041B100    call        TCollection.InsertItem
 0041B105    pop         esi
 0041B106    pop         ebx
 0041B107    ret
*}
end;

//0041B108
procedure TCollectionItem.SetDisplayName(const Value:AnsiString);
begin
{*
 0041B108    xor         edx,edx
 0041B10A    call        TCollectionItem.Changed
 0041B10F    ret
*}
end;

//0041B110
procedure TCollectionItem.SetIndex(Value:Integer);
begin
{*
 0041B110    push        ebx
 0041B111    push        esi
 0041B112    mov         esi,edx
 0041B114    mov         ebx,eax
 0041B116    mov         eax,ebx
 0041B118    call        TCollectionItem.GetIndex
 0041B11D    test        eax,eax
>0041B11F    jl          0041B13C
 0041B121    cmp         esi,eax
>0041B123    je          0041B13C
 0041B125    mov         edx,dword ptr [ebx+4]
 0041B128    mov         edx,dword ptr [edx+8]
 0041B12B    mov         ecx,esi
 0041B12D    xchg        eax,edx
 0041B12E    call        TList.Move
 0041B133    mov         dl,1
 0041B135    mov         eax,ebx
 0041B137    call        TCollectionItem.Changed
 0041B13C    pop         esi
 0041B13D    pop         ebx
 0041B13E    ret
*}
end;

//0041B140
constructor TCollection.Create(ItemClass:TCollectionItemClass);
begin
{*
 0041B140    push        ebx
 0041B141    push        esi
 0041B142    test        dl,dl
>0041B144    je          0041B14E
 0041B146    add         esp,0FFFFFFF0
 0041B149    call        @ClassCreate
 0041B14E    mov         ebx,edx
 0041B150    mov         esi,eax
 0041B152    mov         dword ptr [esi+4],ecx
 0041B155    mov         dl,1
 0041B157    mov         eax,[00417CEC];TList
 0041B15C    call        TObject.Create
 0041B161    mov         dword ptr [esi+8],eax
 0041B164    xor         ecx,ecx
 0041B166    mov         edx,esi
 0041B168    mov         eax,esi
 0041B16A    call        NotifyDesigner
 0041B16F    mov         eax,esi
 0041B171    test        bl,bl
>0041B173    je          0041B184
 0041B175    call        @AfterConstruction
 0041B17A    pop         dword ptr fs:[0]
 0041B181    add         esp,0C
 0041B184    mov         eax,esi
 0041B186    pop         esi
 0041B187    pop         ebx
 0041B188    ret
*}
end;

//0041B18C
destructor TCollection.Destroy;
begin
{*
 0041B18C    push        ebx
 0041B18D    push        esi
 0041B18E    call        @BeforeDestruction
 0041B193    mov         ebx,edx
 0041B195    mov         esi,eax
 0041B197    mov         dword ptr [esi+0C],1;TCollection.FUpdateCount:Integer
 0041B19E    cmp         dword ptr [esi+8],0;TCollection.FItems:TList
>0041B1A2    je          0041B1AB
 0041B1A4    mov         eax,esi
 0041B1A6    call        TCollection.Clear
 0041B1AB    mov         cl,1
 0041B1AD    mov         edx,esi
 0041B1AF    mov         eax,esi
 0041B1B1    call        NotifyDesigner
 0041B1B6    mov         eax,dword ptr [esi+8];TCollection.FItems:TList
 0041B1B9    call        TObject.Free
 0041B1BE    mov         edx,ebx
 0041B1C0    and         dl,0FC
 0041B1C3    mov         eax,esi
 0041B1C5    call        TMemoryStream.Destroy
 0041B1CA    test        bl,bl
>0041B1CC    jle         0041B1D5
 0041B1CE    mov         eax,esi
 0041B1D0    call        @ClassDestroy
 0041B1D5    pop         esi
 0041B1D6    pop         ebx
 0041B1D7    ret
*}
end;

//0041B1D8
function TCollection.Add:TCollectionItem;
begin
{*
 0041B1D8    push        ebx
 0041B1D9    push        ecx
 0041B1DA    mov         ebx,eax
 0041B1DC    mov         ecx,ebx
 0041B1DE    mov         dl,1
 0041B1E0    mov         eax,dword ptr [ebx+4]
 0041B1E3    call        dword ptr [eax+1C]
 0041B1E6    mov         dword ptr [esp],eax
 0041B1E9    mov         edx,esp
 0041B1EB    mov         eax,ebx
 0041B1ED    mov         ecx,dword ptr [eax]
 0041B1EF    call        dword ptr [ecx+0C]
 0041B1F2    mov         eax,dword ptr [esp]
 0041B1F5    pop         edx
 0041B1F6    pop         ebx
 0041B1F7    ret
*}
end;

//0041B1F8
procedure TCollection.Assign(Source:TPersistent);
begin
{*
 0041B1F8    push        ebp
 0041B1F9    mov         ebp,esp
 0041B1FB    push        ecx
 0041B1FC    push        ebx
 0041B1FD    push        esi
 0041B1FE    push        edi
 0041B1FF    mov         esi,edx
 0041B201    mov         dword ptr [ebp-4],eax
 0041B204    mov         eax,esi
 0041B206    mov         edx,dword ptr ds:[418058];TCollection
 0041B20C    call        @IsClass
 0041B211    test        al,al
>0041B213    je          0041B27D
 0041B215    mov         eax,dword ptr [ebp-4]
 0041B218    mov         edx,dword ptr [eax]
 0041B21A    call        dword ptr [edx+20]
 0041B21D    xor         eax,eax
 0041B21F    push        ebp
 0041B220    push        41B276
 0041B225    push        dword ptr fs:[eax]
 0041B228    mov         dword ptr fs:[eax],esp
 0041B22B    mov         eax,dword ptr [ebp-4]
 0041B22E    call        TCollection.Clear
 0041B233    mov         eax,esi
 0041B235    call        TCollection.GetCount
 0041B23A    mov         ebx,eax
 0041B23C    dec         ebx
 0041B23D    test        ebx,ebx
>0041B23F    jl          0041B260
 0041B241    inc         ebx
 0041B242    xor         edi,edi
 0041B244    mov         edx,edi
 0041B246    mov         eax,esi
 0041B248    call        TCollection.GetItem
 0041B24D    push        eax
 0041B24E    mov         eax,dword ptr [ebp-4]
 0041B251    call        TCollection.Add
 0041B256    pop         edx
 0041B257    mov         ecx,dword ptr [eax]
 0041B259    call        dword ptr [ecx+8]
 0041B25C    inc         edi
 0041B25D    dec         ebx
>0041B25E    jne         0041B244
 0041B260    xor         eax,eax
 0041B262    pop         edx
 0041B263    pop         ecx
 0041B264    pop         ecx
 0041B265    mov         dword ptr fs:[eax],edx
 0041B268    push        41B287
 0041B26D    mov         eax,dword ptr [ebp-4]
 0041B270    mov         edx,dword ptr [eax]
 0041B272    call        dword ptr [edx+24]
 0041B275    ret
>0041B276    jmp         @HandleFinally
>0041B27B    jmp         0041B26D
 0041B27D    mov         edx,esi
 0041B27F    mov         eax,dword ptr [ebp-4]
 0041B282    call        TPersistent.Assign
 0041B287    pop         edi
 0041B288    pop         esi
 0041B289    pop         ebx
 0041B28A    pop         ecx
 0041B28B    pop         ebp
 0041B28C    ret
*}
end;

//0041B290
procedure sub_0041B290;
begin
{*
 0041B290    inc         dword ptr [eax+0C];TCollection.FUpdateCount:Integer
 0041B293    ret
*}
end;

//0041B294
procedure TCollection.Changed;
begin
{*
 0041B294    cmp         dword ptr [eax+0C],0
>0041B298    jne         0041B2A1
 0041B29A    xor         edx,edx
 0041B29C    mov         ecx,dword ptr [eax]
 0041B29E    call        dword ptr [ecx+1C]
 0041B2A1    ret
*}
end;

//0041B2A4
procedure TCollection.Clear;
begin
{*
 0041B2A4    push        ebp
 0041B2A5    mov         ebp,esp
 0041B2A7    push        ecx
 0041B2A8    push        ebx
 0041B2A9    mov         dword ptr [ebp-4],eax
 0041B2AC    mov         eax,dword ptr [ebp-4]
 0041B2AF    mov         eax,dword ptr [eax+8]
 0041B2B2    cmp         dword ptr [eax+8],0
>0041B2B6    jle         0041B305
 0041B2B8    mov         eax,dword ptr [ebp-4]
 0041B2BB    mov         edx,dword ptr [eax]
 0041B2BD    call        dword ptr [edx+20]
 0041B2C0    xor         eax,eax
 0041B2C2    push        ebp
 0041B2C3    push        41B2FE
 0041B2C8    push        dword ptr fs:[eax]
 0041B2CB    mov         dword ptr fs:[eax],esp
>0041B2CE    jmp         0041B2DC
 0041B2D0    mov         eax,ebx
 0041B2D2    call        TList.Last
 0041B2D7    call        TObject.Free
 0041B2DC    mov         eax,dword ptr [ebp-4]
 0041B2DF    mov         ebx,dword ptr [eax+8]
 0041B2E2    cmp         dword ptr [ebx+8],0
>0041B2E6    jg          0041B2D0
 0041B2E8    xor         eax,eax
 0041B2EA    pop         edx
 0041B2EB    pop         ecx
 0041B2EC    pop         ecx
 0041B2ED    mov         dword ptr fs:[eax],edx
 0041B2F0    push        41B305
 0041B2F5    mov         eax,dword ptr [ebp-4]
 0041B2F8    mov         edx,dword ptr [eax]
 0041B2FA    call        dword ptr [edx+24]
 0041B2FD    ret
>0041B2FE    jmp         @HandleFinally
>0041B303    jmp         0041B2F5
 0041B305    pop         ebx
 0041B306    pop         ecx
 0041B307    pop         ebp
 0041B308    ret
*}
end;

//0041B30C
procedure TCollection.EndUpdate;
begin
{*
 0041B30C    dec         dword ptr [eax+0C]
 0041B30F    call        TCollection.Changed
 0041B314    ret
*}
end;

//0041B318
procedure TCollection.sub_0041B318;
begin
{*
 0041B318    xor         eax,eax
 0041B31A    ret
*}
end;

//0041B31C
procedure TCollection.GetAttr(Index:Integer);
begin
{*
 0041B31C    push        ebx
 0041B31D    mov         ebx,ecx
 0041B31F    mov         eax,ebx
 0041B321    call        @LStrClr
 0041B326    pop         ebx
 0041B327    ret
*}
end;

//0041B328
procedure TCollection.GetItemAttr(Index:Integer; ItemIndex:Integer);
begin
{*
 0041B328    push        ebp
 0041B329    mov         ebp,esp
 0041B32B    push        ebx
 0041B32C    push        esi
 0041B32D    mov         esi,ecx
 0041B32F    mov         ebx,eax
 0041B331    mov         edx,esi
 0041B333    mov         eax,ebx
 0041B335    call        TCollection.GetItem
 0041B33A    mov         edx,dword ptr [ebp+8]
 0041B33D    mov         ecx,dword ptr [eax]
 0041B33F    call        dword ptr [ecx+0C]
 0041B342    pop         esi
 0041B343    pop         ebx
 0041B344    pop         ebp
 0041B345    ret         4
*}
end;

//0041B348
function TCollection.GetCount:Integer;
begin
{*
 0041B348    mov         eax,dword ptr [eax+8]
 0041B34B    mov         eax,dword ptr [eax+8]
 0041B34E    ret
*}
end;

//0041B350
function TCollection.GetItem(Index:Integer):TCollectionItem;
begin
{*
 0041B350    push        ebx
 0041B351    push        esi
 0041B352    mov         esi,edx
 0041B354    mov         ebx,eax
 0041B356    mov         edx,esi
 0041B358    mov         eax,dword ptr [ebx+8]
 0041B35B    call        TList.Get
 0041B360    pop         esi
 0041B361    pop         ebx
 0041B362    ret
*}
end;

//0041B364
procedure TCollection.GetNamePath;
begin
{*
 0041B364    push        ebp
 0041B365    mov         ebp,esp
 0041B367    add         esp,0FFFFFEF8
 0041B36D    push        ebx
 0041B36E    push        esi
 0041B36F    push        edi
 0041B370    xor         ecx,ecx
 0041B372    mov         dword ptr [ebp-4],ecx
 0041B375    mov         dword ptr [ebp-8],ecx
 0041B378    mov         edi,edx
 0041B37A    mov         ebx,eax
 0041B37C    xor         eax,eax
 0041B37E    push        ebp
 0041B37F    push        41B412
 0041B384    push        dword ptr fs:[eax]
 0041B387    mov         dword ptr fs:[eax],esp
 0041B38A    lea         edx,[ebp-108]
 0041B390    mov         eax,dword ptr [ebx]
 0041B392    call        TObject.ClassName
 0041B397    lea         edx,[ebp-108]
 0041B39D    mov         eax,edi
 0041B39F    call        @LStrFromString
 0041B3A4    mov         eax,ebx
 0041B3A6    mov         si,0FFFF
 0041B3AA    call        @CallDynaInst
 0041B3AF    test        eax,eax
>0041B3B1    je          0041B3F7
 0041B3B3    mov         eax,ebx
 0041B3B5    mov         si,0FFFF
 0041B3B9    call        @CallDynaInst
 0041B3BE    lea         edx,[ebp-4]
 0041B3C1    mov         si,0FFFE
 0041B3C5    call        @CallDynaInst
 0041B3CA    cmp         dword ptr [ebp-4],0
>0041B3CE    je          0041B3F7
 0041B3D0    lea         edx,[ebp-8]
 0041B3D3    mov         eax,ebx
 0041B3D5    call        TCollection.GetPropName
 0041B3DA    cmp         dword ptr [ebp-8],0
>0041B3DE    je          0041B3F7
 0041B3E0    push        dword ptr [ebp-4]
 0041B3E3    push        41B428;'.'
 0041B3E8    push        dword ptr [ebp-8]
 0041B3EB    mov         eax,edi
 0041B3ED    mov         edx,3
 0041B3F2    call        @LStrCatN
 0041B3F7    xor         eax,eax
 0041B3F9    pop         edx
 0041B3FA    pop         ecx
 0041B3FB    pop         ecx
 0041B3FC    mov         dword ptr fs:[eax],edx
 0041B3FF    push        41B419
 0041B404    lea         eax,[ebp-8]
 0041B407    mov         edx,2
 0041B40C    call        @LStrArrayClr
 0041B411    ret
>0041B412    jmp         @HandleFinally
>0041B417    jmp         0041B404
 0041B419    pop         edi
 0041B41A    pop         esi
 0041B41B    pop         ebx
 0041B41C    mov         esp,ebp
 0041B41E    pop         ebp
 0041B41F    ret
*}
end;

//0041B42C
function TCollection.GetPropName:AnsiString;
begin
{*
 0041B42C    push        ebp
 0041B42D    mov         ebp,esp
 0041B42F    add         esp,0FFFFFFF0
 0041B432    push        ebx
 0041B433    push        esi
 0041B434    push        edi
 0041B435    mov         dword ptr [ebp-8],edx
 0041B438    mov         dword ptr [ebp-4],eax
 0041B43B    mov         eax,dword ptr [ebp-8]
 0041B43E    mov         edx,dword ptr [ebp-4]
 0041B441    mov         edx,dword ptr [edx+14]
 0041B444    call        @LStrAsg
 0041B449    mov         eax,dword ptr [ebp-4]
 0041B44C    mov         si,0FFFF
 0041B450    call        @CallDynaInst
 0041B455    mov         dword ptr [ebp-10],eax
 0041B458    mov         eax,dword ptr [ebp-8]
 0041B45B    cmp         dword ptr [eax],0
>0041B45E    jne         0041B53E
 0041B464    cmp         dword ptr [ebp-10],0
>0041B468    je          0041B53E
 0041B46E    mov         eax,dword ptr [ebp-10]
 0041B471    mov         eax,dword ptr [eax]
 0041B473    call        TObject.ClassInfo
 0041B478    test        eax,eax
>0041B47A    je          0041B53E
 0041B480    mov         eax,dword ptr [ebp-10]
 0041B483    mov         eax,dword ptr [eax]
 0041B485    call        TObject.ClassInfo
 0041B48A    call        GetTypeData
 0041B48F    mov         ebx,eax
 0041B491    test        ebx,ebx
>0041B493    je          0041B53E
 0041B499    cmp         word ptr [ebx+8],0
>0041B49E    je          0041B53E
 0041B4A4    movsx       eax,word ptr [ebx+8]
 0041B4A8    shl         eax,2
 0041B4AB    call        @GetMem
 0041B4B0    mov         dword ptr [ebp-0C],eax
 0041B4B3    xor         eax,eax
 0041B4B5    push        ebp
 0041B4B6    push        41B529
 0041B4BB    push        dword ptr fs:[eax]
 0041B4BE    mov         dword ptr fs:[eax],esp
 0041B4C1    mov         eax,dword ptr [ebp-10]
 0041B4C4    mov         eax,dword ptr [eax]
 0041B4C6    call        TObject.ClassInfo
 0041B4CB    mov         edx,dword ptr [ebp-0C]
 0041B4CE    call        GetPropInfos
 0041B4D3    movsx       edi,word ptr [ebx+8]
 0041B4D7    dec         edi
 0041B4D8    test        edi,edi
>0041B4DA    jl          0041B513
 0041B4DC    inc         edi
 0041B4DD    xor         ebx,ebx
 0041B4DF    mov         eax,dword ptr [ebp-0C]
 0041B4E2    mov         esi,dword ptr [eax+ebx*4]
 0041B4E5    mov         eax,dword ptr [esi]
 0041B4E7    mov         eax,dword ptr [eax]
 0041B4E9    cmp         byte ptr [eax],7
>0041B4EC    jne         0041B50F
 0041B4EE    mov         eax,dword ptr [ebp-0C]
 0041B4F1    mov         edx,dword ptr [eax+ebx*4]
 0041B4F4    mov         eax,dword ptr [ebp-10]
 0041B4F7    call        GetOrdProp
 0041B4FC    cmp         eax,dword ptr [ebp-4]
>0041B4FF    jne         0041B50F
 0041B501    mov         eax,dword ptr [ebp-4]
 0041B504    add         eax,14
 0041B507    lea         edx,[esi+1A]
 0041B50A    call        @LStrFromString
 0041B50F    inc         ebx
 0041B510    dec         edi
>0041B511    jne         0041B4DF
 0041B513    xor         eax,eax
 0041B515    pop         edx
 0041B516    pop         ecx
 0041B517    pop         ecx
 0041B518    mov         dword ptr fs:[eax],edx
 0041B51B    push        41B530
 0041B520    mov         eax,dword ptr [ebp-0C]
 0041B523    call        @FreeMem
 0041B528    ret
>0041B529    jmp         @HandleFinally
>0041B52E    jmp         0041B520
 0041B530    mov         eax,dword ptr [ebp-8]
 0041B533    mov         edx,dword ptr [ebp-4]
 0041B536    mov         edx,dword ptr [edx+14]
 0041B539    call        @LStrAsg
 0041B53E    pop         edi
 0041B53F    pop         esi
 0041B540    pop         ebx
 0041B541    mov         esp,ebp
 0041B543    pop         ebp
 0041B544    ret
*}
end;

//0041B548
procedure TCollection.InsertItem(Item:TCollectionItem);
begin
{*
 0041B548    push        ebx
 0041B549    push        esi
 0041B54A    push        edi
 0041B54B    mov         esi,edx
 0041B54D    mov         ebx,eax
 0041B54F    mov         eax,esi
 0041B551    mov         edx,dword ptr [ebx+4]
 0041B554    call        @IsClass
 0041B559    test        al,al
>0041B55B    jne         0041B56F
 0041B55D    mov         edx,dword ptr ds:[5AE534];^SInvalidProperty:TResStringRec
 0041B563    xor         ecx,ecx
 0041B565    mov         eax,[00417CEC];TList
 0041B56A    call        TList.Error
 0041B56F    mov         edx,esi
 0041B571    mov         eax,dword ptr [ebx+8]
 0041B574    call        TList.Add
 0041B579    mov         dword ptr [esi+4],ebx
 0041B57C    mov         eax,dword ptr [ebx+10]
 0041B57F    mov         dword ptr [esi+8],eax
 0041B582    inc         dword ptr [ebx+10]
 0041B585    mov         edx,esi
 0041B587    mov         eax,ebx
 0041B589    mov         ecx,dword ptr [eax]
 0041B58B    call        dword ptr [ecx+18]
 0041B58E    xor         ecx,ecx
 0041B590    mov         edx,esi
 0041B592    mov         eax,ebx
 0041B594    mov         edi,dword ptr [eax]
 0041B596    call        dword ptr [edi+14]
 0041B599    mov         eax,ebx
 0041B59B    call        TCollection.Changed
 0041B5A0    xor         ecx,ecx
 0041B5A2    mov         edx,esi
 0041B5A4    mov         eax,ebx
 0041B5A6    call        NotifyDesigner
 0041B5AB    pop         edi
 0041B5AC    pop         esi
 0041B5AD    pop         ebx
 0041B5AE    ret
*}
end;

//0041B5B0
procedure TCollection.RemoveItem(Item:TCollectionItem);
begin
{*
 0041B5B0    push        ebx
 0041B5B1    push        esi
 0041B5B2    push        edi
 0041B5B3    mov         esi,edx
 0041B5B5    mov         ebx,eax
 0041B5B7    mov         cl,1
 0041B5B9    mov         edx,esi
 0041B5BB    mov         eax,ebx
 0041B5BD    mov         edi,dword ptr [eax]
 0041B5BF    call        dword ptr [edi+14]
 0041B5C2    mov         eax,dword ptr [ebx+8]
 0041B5C5    call        TList.Last
 0041B5CA    cmp         esi,eax
>0041B5CC    jne         0041B5DC
 0041B5CE    mov         eax,dword ptr [ebx+8]
 0041B5D1    mov         edx,dword ptr [eax+8]
 0041B5D4    dec         edx
 0041B5D5    call        TList.Delete
>0041B5DA    jmp         0041B5E6
 0041B5DC    mov         edx,esi
 0041B5DE    mov         eax,dword ptr [ebx+8]
 0041B5E1    call        TList.Remove
 0041B5E6    xor         eax,eax
 0041B5E8    mov         dword ptr [esi+4],eax
 0041B5EB    mov         cl,1
 0041B5ED    mov         edx,esi
 0041B5EF    mov         eax,ebx
 0041B5F1    call        NotifyDesigner
 0041B5F6    mov         eax,ebx
 0041B5F8    call        TCollection.Changed
 0041B5FD    pop         edi
 0041B5FE    pop         esi
 0041B5FF    pop         ebx
 0041B600    ret
*}
end;

//0041B604
procedure sub_0041B604;
begin
{*
 0041B604    ret
*}
end;

//0041B608
procedure sub_0041B608;
begin
{*
 0041B608    ret
*}
end;

//0041B60C
procedure sub_0041B60C;
begin
{*
 0041B60C    ret
*}
end;

//0041B610
procedure sub_0041B610;
begin
{*
 0041B610    ret
*}
end;

//0041B614
procedure TCollection.Notify(Item:TCollectionItem; Action:TCollectionNotification);
begin
{*
 0041B614    push        ecx
 0041B615    mov         dword ptr [esp],edx
 0041B618    sub         cl,1
>0041B61B    jb          0041B623
 0041B61D    dec         cl
>0041B61F    je          0041B62C
>0041B621    jmp         0041B634
 0041B623    mov         edx,esp
 0041B625    mov         ecx,dword ptr [eax]
 0041B627    call        dword ptr [ecx+0C]
 0041B62A    pop         edx
 0041B62B    ret
 0041B62C    mov         edx,dword ptr [esp]
 0041B62F    mov         ecx,dword ptr [eax]
 0041B631    call        dword ptr [ecx+10]
 0041B634    pop         edx
 0041B635    ret
*}
end;

//0041B638
constructor TOwnedCollection.Create(AOwner:TPersistent; ItemClass:TCollectionItemClass);
begin
{*
 0041B638    push        ebp
 0041B639    mov         ebp,esp
 0041B63B    push        ebx
 0041B63C    push        esi
 0041B63D    test        dl,dl
>0041B63F    je          0041B649
 0041B641    add         esp,0FFFFFFF0
 0041B644    call        @ClassCreate
 0041B649    mov         ebx,edx
 0041B64B    mov         esi,eax
 0041B64D    mov         dword ptr [esi+18],ecx
 0041B650    mov         ecx,dword ptr [ebp+8]
 0041B653    xor         edx,edx
 0041B655    mov         eax,esi
 0041B657    call        TCollection.Create
 0041B65C    mov         eax,esi
 0041B65E    test        bl,bl
>0041B660    je          0041B671
 0041B662    call        @AfterConstruction
 0041B667    pop         dword ptr fs:[0]
 0041B66E    add         esp,0C
 0041B671    mov         eax,esi
 0041B673    pop         esi
 0041B674    pop         ebx
 0041B675    pop         ebp
 0041B676    ret         4
*}
end;

//0041B67C
procedure TOwnedCollection.sub_0041ADA4;
begin
{*
 0041B67C    mov         eax,dword ptr [eax+18];TOwnedCollection.FOwner:TPersistent
 0041B67F    ret
*}
end;

//0041B680
destructor TStrings.Destroy;
begin
{*
 0041B680    push        ebx
 0041B681    push        esi
 0041B682    call        @BeforeDestruction
 0041B687    mov         ebx,edx
 0041B689    mov         esi,eax
 0041B68B    xor         edx,edx
 0041B68D    mov         eax,esi
 0041B68F    call        TStrings.SetStringsAdapter
 0041B694    mov         edx,ebx
 0041B696    and         dl,0FC
 0041B699    mov         eax,esi
 0041B69B    call        TMemoryStream.Destroy
 0041B6A0    test        bl,bl
>0041B6A2    jle         0041B6AB
 0041B6A4    mov         eax,esi
 0041B6A6    call        @ClassDestroy
 0041B6AB    pop         esi
 0041B6AC    pop         ebx
 0041B6AD    ret
*}
end;

//0041B6B0
function TStrings.Add(const S:AnsiString):Integer;
begin
{*
 0041B6B0    push        ebx
 0041B6B1    push        esi
 0041B6B2    push        edi
 0041B6B3    push        ebp
 0041B6B4    mov         ebp,edx
 0041B6B6    mov         esi,eax
 0041B6B8    mov         eax,esi
 0041B6BA    mov         edx,dword ptr [eax]
 0041B6BC    call        dword ptr [edx+14]
 0041B6BF    mov         edi,eax
 0041B6C1    mov         ecx,ebp
 0041B6C3    mov         edx,edi
 0041B6C5    mov         eax,esi
 0041B6C7    mov         ebx,dword ptr [eax]
 0041B6C9    call        dword ptr [ebx+60]
 0041B6CC    mov         eax,edi
 0041B6CE    pop         ebp
 0041B6CF    pop         edi
 0041B6D0    pop         esi
 0041B6D1    pop         ebx
 0041B6D2    ret
*}
end;

//0041B6D4
function TStrings.AddObject(const S:AnsiString; AObject:TObject):Integer;
begin
{*
 0041B6D4    push        ebx
 0041B6D5    push        esi
 0041B6D6    push        edi
 0041B6D7    mov         edi,ecx
 0041B6D9    mov         ebx,eax
 0041B6DB    mov         eax,ebx
 0041B6DD    mov         ecx,dword ptr [eax]
 0041B6DF    call        dword ptr [ecx+38]
 0041B6E2    mov         esi,eax
 0041B6E4    mov         ecx,edi
 0041B6E6    mov         edx,esi
 0041B6E8    mov         eax,ebx
 0041B6EA    mov         ebx,dword ptr [eax]
 0041B6EC    call        dword ptr [ebx+24]
 0041B6EF    mov         eax,esi
 0041B6F1    pop         edi
 0041B6F2    pop         esi
 0041B6F3    pop         ebx
 0041B6F4    ret
*}
end;

//0041B6F8
procedure TStrings.AddStrings(Strings:TStrings);
begin
{*
 0041B6F8    push        ebp
 0041B6F9    mov         ebp,esp
 0041B6FB    add         esp,0FFFFFFF4
 0041B6FE    push        ebx
 0041B6FF    push        esi
 0041B700    push        edi
 0041B701    xor         ecx,ecx
 0041B703    mov         dword ptr [ebp-0C],ecx
 0041B706    mov         dword ptr [ebp-8],edx
 0041B709    mov         dword ptr [ebp-4],eax
 0041B70C    xor         eax,eax
 0041B70E    push        ebp
 0041B70F    push        41B79F
 0041B714    push        dword ptr fs:[eax]
 0041B717    mov         dword ptr fs:[eax],esp
 0041B71A    mov         eax,dword ptr [ebp-4]
 0041B71D    call        TStrings.BeginUpdate
 0041B722    xor         eax,eax
 0041B724    push        ebp
 0041B725    push        41B782
 0041B72A    push        dword ptr fs:[eax]
 0041B72D    mov         dword ptr fs:[eax],esp
 0041B730    mov         eax,dword ptr [ebp-8]
 0041B733    mov         edx,dword ptr [eax]
 0041B735    call        dword ptr [edx+14]
 0041B738    mov         esi,eax
 0041B73A    dec         esi
 0041B73B    test        esi,esi
>0041B73D    jl          0041B76C
 0041B73F    inc         esi
 0041B740    xor         ebx,ebx
 0041B742    lea         ecx,[ebp-0C]
 0041B745    mov         edx,ebx
 0041B747    mov         eax,dword ptr [ebp-8]
 0041B74A    mov         edi,dword ptr [eax]
 0041B74C    call        dword ptr [edi+0C]
 0041B74F    mov         eax,dword ptr [ebp-0C]
 0041B752    push        eax
 0041B753    mov         edx,ebx
 0041B755    mov         eax,dword ptr [ebp-8]
 0041B758    mov         ecx,dword ptr [eax]
 0041B75A    call        dword ptr [ecx+18]
 0041B75D    mov         ecx,eax
 0041B75F    mov         eax,dword ptr [ebp-4]
 0041B762    pop         edx
 0041B763    mov         edi,dword ptr [eax]
 0041B765    call        dword ptr [edi+3C]
 0041B768    inc         ebx
 0041B769    dec         esi
>0041B76A    jne         0041B742
 0041B76C    xor         eax,eax
 0041B76E    pop         edx
 0041B76F    pop         ecx
 0041B770    pop         ecx
 0041B771    mov         dword ptr fs:[eax],edx
 0041B774    push        41B789
 0041B779    mov         eax,dword ptr [ebp-4]
 0041B77C    call        TStrings.EndUpdate
 0041B781    ret
>0041B782    jmp         @HandleFinally
>0041B787    jmp         0041B779
 0041B789    xor         eax,eax
 0041B78B    pop         edx
 0041B78C    pop         ecx
 0041B78D    pop         ecx
 0041B78E    mov         dword ptr fs:[eax],edx
 0041B791    push        41B7A6
 0041B796    lea         eax,[ebp-0C]
 0041B799    call        @LStrClr
 0041B79E    ret
>0041B79F    jmp         @HandleFinally
>0041B7A4    jmp         0041B796
 0041B7A6    pop         edi
 0041B7A7    pop         esi
 0041B7A8    pop         ebx
 0041B7A9    mov         esp,ebp
 0041B7AB    pop         ebp
 0041B7AC    ret
*}
end;

//0041B7B0
procedure TStrings.Assign(Source:TPersistent);
begin
{*
 0041B7B0    push        ebp
 0041B7B1    mov         ebp,esp
 0041B7B3    push        ecx
 0041B7B4    push        ebx
 0041B7B5    push        esi
 0041B7B6    mov         ebx,edx
 0041B7B8    mov         dword ptr [ebp-4],eax
 0041B7BB    mov         eax,ebx
 0041B7BD    mov         edx,dword ptr ds:[418220];TStrings
 0041B7C3    call        @IsClass
 0041B7C8    test        al,al
>0041B7CA    je          0041B837
 0041B7CC    mov         eax,dword ptr [ebp-4]
 0041B7CF    call        TStrings.BeginUpdate
 0041B7D4    xor         eax,eax
 0041B7D6    push        ebp
 0041B7D7    push        41B830
 0041B7DC    push        dword ptr fs:[eax]
 0041B7DF    mov         dword ptr fs:[eax],esp
 0041B7E2    mov         eax,dword ptr [ebp-4]
 0041B7E5    mov         edx,dword ptr [eax]
 0041B7E7    call        dword ptr [edx+44]
 0041B7EA    mov         esi,ebx
 0041B7EC    mov         al,byte ptr [esi+4]
 0041B7EF    mov         edx,dword ptr [ebp-4]
 0041B7F2    mov         byte ptr [edx+4],al
 0041B7F5    mov         al,byte ptr [esi+7]
 0041B7F8    mov         edx,dword ptr [ebp-4]
 0041B7FB    mov         byte ptr [edx+7],al
 0041B7FE    mov         al,byte ptr [esi+6]
 0041B801    mov         edx,dword ptr [ebp-4]
 0041B804    mov         byte ptr [edx+6],al
 0041B807    mov         al,byte ptr [esi+5]
 0041B80A    mov         edx,dword ptr [ebp-4]
 0041B80D    mov         byte ptr [edx+5],al
 0041B810    mov         edx,esi
 0041B812    mov         eax,dword ptr [ebp-4]
 0041B815    mov         ecx,dword ptr [eax]
 0041B817    call        dword ptr [ecx+40]
 0041B81A    xor         eax,eax
 0041B81C    pop         edx
 0041B81D    pop         ecx
 0041B81E    pop         ecx
 0041B81F    mov         dword ptr fs:[eax],edx
 0041B822    push        41B841
 0041B827    mov         eax,dword ptr [ebp-4]
 0041B82A    call        TStrings.EndUpdate
 0041B82F    ret
>0041B830    jmp         @HandleFinally
>0041B835    jmp         0041B827
 0041B837    mov         edx,ebx
 0041B839    mov         eax,dword ptr [ebp-4]
 0041B83C    call        TPersistent.Assign
 0041B841    pop         esi
 0041B842    pop         ebx
 0041B843    pop         ecx
 0041B844    pop         ebp
 0041B845    ret
*}
end;

//0041B848
procedure TStrings.BeginUpdate;
begin
{*
 0041B848    push        ebx
 0041B849    mov         ebx,eax
 0041B84B    cmp         dword ptr [ebx+8],0
>0041B84F    jne         0041B85A
 0041B851    mov         dl,1
 0041B853    mov         eax,ebx
 0041B855    mov         ecx,dword ptr [eax]
 0041B857    call        dword ptr [ecx+30]
 0041B85A    inc         dword ptr [ebx+8]
 0041B85D    pop         ebx
 0041B85E    ret
*}
end;

//0041B860
function DoWrite:Boolean;
begin
{*
 0041B860    push        ebp
 0041B861    mov         ebp,esp
 0041B863    push        ebx
 0041B864    push        esi
 0041B865    mov         eax,dword ptr [ebp+8]
 0041B868    mov         eax,dword ptr [eax-4]
 0041B86B    mov         esi,dword ptr [eax+20]
 0041B86E    test        esi,esi
>0041B870    je          0041B89F
 0041B872    mov         bl,1
 0041B874    mov         eax,dword ptr [ebp+8]
 0041B877    mov         eax,esi
 0041B879    mov         edx,dword ptr ds:[418220];TStrings
 0041B87F    call        @IsClass
 0041B884    test        al,al
>0041B886    je          0041B8AF
 0041B888    mov         eax,dword ptr [ebp+8]
 0041B88B    mov         edx,esi
 0041B88D    mov         eax,dword ptr [ebp+8]
 0041B890    mov         eax,dword ptr [eax-8]
 0041B893    call        TStrings.Equals
 0041B898    mov         ebx,eax
 0041B89A    xor         bl,1
>0041B89D    jmp         0041B8AF
 0041B89F    mov         eax,dword ptr [ebp+8]
 0041B8A2    mov         eax,dword ptr [eax-8]
 0041B8A5    mov         edx,dword ptr [eax]
 0041B8A7    call        dword ptr [edx+14]
 0041B8AA    test        eax,eax
 0041B8AC    setg        bl
 0041B8AF    mov         eax,ebx
 0041B8B1    pop         esi
 0041B8B2    pop         ebx
 0041B8B3    pop         ebp
 0041B8B4    ret
*}
end;

//0041B8B8
procedure TStrings.DefineProperties(Filer:TFiler);
begin
{*
 0041B8B8    push        ebp
 0041B8B9    mov         ebp,esp
 0041B8BB    add         esp,0FFFFFFF8
 0041B8BE    push        ebx
 0041B8BF    mov         dword ptr [ebp-4],edx
 0041B8C2    mov         dword ptr [ebp-8],eax
 0041B8C5    mov         eax,dword ptr [ebp-8]
 0041B8C8    push        eax
 0041B8C9    push        41C0FC;TStrings.ReadData
 0041B8CE    mov         eax,dword ptr [ebp-8]
 0041B8D1    push        eax
 0041B8D2    push        41C3AC;TStrings.WriteData
 0041B8D7    push        ebp
 0041B8D8    call        DoWrite
 0041B8DD    pop         ecx
 0041B8DE    mov         ecx,eax
 0041B8E0    mov         edx,41B8FC;'Strings'
 0041B8E5    mov         eax,dword ptr [ebp-4]
 0041B8E8    mov         ebx,dword ptr [eax]
 0041B8EA    call        dword ptr [ebx+4]
 0041B8ED    pop         ebx
 0041B8EE    pop         ecx
 0041B8EF    pop         ecx
 0041B8F0    pop         ebp
 0041B8F1    ret
*}
end;

//0041B904
procedure TStrings.EndUpdate;
begin
{*
 0041B904    dec         dword ptr [eax+8]
 0041B907    cmp         dword ptr [eax+8],0
>0041B90B    jne         0041B914
 0041B90D    xor         edx,edx
 0041B90F    mov         ecx,dword ptr [eax]
 0041B911    call        dword ptr [ecx+30]
 0041B914    ret
*}
end;

//0041B918
function TStrings.Equals(Strings:TStrings):Boolean;
begin
{*
 0041B918    push        ebp
 0041B919    mov         ebp,esp
 0041B91B    add         esp,0FFFFFFEC
 0041B91E    push        ebx
 0041B91F    push        esi
 0041B920    push        edi
 0041B921    xor         ecx,ecx
 0041B923    mov         dword ptr [ebp-10],ecx
 0041B926    mov         dword ptr [ebp-14],ecx
 0041B929    mov         dword ptr [ebp-8],edx
 0041B92C    mov         dword ptr [ebp-4],eax
 0041B92F    xor         eax,eax
 0041B931    push        ebp
 0041B932    push        41B9AD
 0041B937    push        dword ptr fs:[eax]
 0041B93A    mov         dword ptr fs:[eax],esp
 0041B93D    mov         byte ptr [ebp-9],0
 0041B941    mov         eax,dword ptr [ebp-4]
 0041B944    mov         edx,dword ptr [eax]
 0041B946    call        dword ptr [edx+14]
 0041B949    mov         ebx,eax
 0041B94B    mov         eax,dword ptr [ebp-8]
 0041B94E    mov         edx,dword ptr [eax]
 0041B950    call        dword ptr [edx+14]
 0041B953    cmp         ebx,eax
>0041B955    jne         0041B992
 0041B957    mov         esi,ebx
 0041B959    dec         esi
 0041B95A    test        esi,esi
>0041B95C    jl          0041B98E
 0041B95E    inc         esi
 0041B95F    xor         ebx,ebx
 0041B961    lea         ecx,[ebp-10]
 0041B964    mov         edx,ebx
 0041B966    mov         eax,dword ptr [ebp-4]
 0041B969    mov         edi,dword ptr [eax]
 0041B96B    call        dword ptr [edi+0C]
 0041B96E    mov         eax,dword ptr [ebp-10]
 0041B971    push        eax
 0041B972    lea         ecx,[ebp-14]
 0041B975    mov         edx,ebx
 0041B977    mov         eax,dword ptr [ebp-8]
 0041B97A    mov         edi,dword ptr [eax]
 0041B97C    call        dword ptr [edi+0C]
 0041B97F    mov         edx,dword ptr [ebp-14]
 0041B982    pop         eax
 0041B983    call        @LStrCmp
>0041B988    jne         0041B992
 0041B98A    inc         ebx
 0041B98B    dec         esi
>0041B98C    jne         0041B961
 0041B98E    mov         byte ptr [ebp-9],1
 0041B992    xor         eax,eax
 0041B994    pop         edx
 0041B995    pop         ecx
 0041B996    pop         ecx
 0041B997    mov         dword ptr fs:[eax],edx
 0041B99A    push        41B9B4
 0041B99F    lea         eax,[ebp-14]
 0041B9A2    mov         edx,2
 0041B9A7    call        @LStrArrayClr
 0041B9AC    ret
>0041B9AD    jmp         @HandleFinally
>0041B9B2    jmp         0041B99F
 0041B9B4    mov         al,byte ptr [ebp-9]
 0041B9B7    pop         edi
 0041B9B8    pop         esi
 0041B9B9    pop         ebx
 0041B9BA    mov         esp,ebp
 0041B9BC    pop         ebp
 0041B9BD    ret
*}
end;

//0041B9C0
{*function sub_0041B9C0:?;
begin
 0041B9C0    mov         eax,dword ptr [ebp+4]
 0041B9C3    ret
end;*}

//0041B9C4
procedure TStrings.Error(const Msg:AnsiString; Data:Integer);
begin
{*
 0041B9C4    push        ebx
 0041B9C5    push        esi
 0041B9C6    add         esp,0FFFFFFF8
 0041B9C9    mov         esi,ecx
 0041B9CB    mov         ebx,edx
 0041B9CD    call        0041B9C0
 0041B9D2    push        eax
 0041B9D3    mov         dword ptr [esp+4],esi
 0041B9D7    mov         byte ptr [esp+8],0
 0041B9DC    lea         eax,[esp+4]
 0041B9E0    push        eax
 0041B9E1    push        0
 0041B9E3    mov         ecx,ebx
 0041B9E5    mov         dl,1
 0041B9E7    mov         eax,[00417B74];EStringListError
 0041B9EC    call        Exception.CreateFmt
>0041B9F1    jmp         @RaiseExcept
 0041B9F6    pop         ecx
 0041B9F7    pop         edx
 0041B9F8    pop         esi
 0041B9F9    pop         ebx
 0041B9FA    ret
*}
end;

//0041B9FC
procedure TStrings.Error(Msg:PResStringRec; Data:Integer);
begin
{*
 0041B9FC    push        ebp
 0041B9FD    mov         ebp,esp
 0041B9FF    push        0
 0041BA01    push        ebx
 0041BA02    push        esi
 0041BA03    push        edi
 0041BA04    mov         edi,ecx
 0041BA06    mov         esi,edx
 0041BA08    mov         ebx,eax
 0041BA0A    xor         eax,eax
 0041BA0C    push        ebp
 0041BA0D    push        41BA44
 0041BA12    push        dword ptr fs:[eax]
 0041BA15    mov         dword ptr fs:[eax],esp
 0041BA18    lea         edx,[ebp-4]
 0041BA1B    mov         eax,esi
 0041BA1D    call        LoadStr
 0041BA22    mov         edx,dword ptr [ebp-4]
 0041BA25    mov         ecx,edi
 0041BA27    mov         eax,ebx
 0041BA29    call        TStrings.Error
 0041BA2E    xor         eax,eax
 0041BA30    pop         edx
 0041BA31    pop         ecx
 0041BA32    pop         ecx
 0041BA33    mov         dword ptr fs:[eax],edx
 0041BA36    push        41BA4B
 0041BA3B    lea         eax,[ebp-4]
 0041BA3E    call        @LStrClr
 0041BA43    ret
>0041BA44    jmp         @HandleFinally
>0041BA49    jmp         0041BA3B
 0041BA4B    pop         edi
 0041BA4C    pop         esi
 0041BA4D    pop         ebx
 0041BA4E    pop         ecx
 0041BA4F    pop         ebp
 0041BA50    ret
*}
end;

//0041BA54
procedure TStrings.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 0041BA54    push        ebp
 0041BA55    mov         ebp,esp
 0041BA57    add         esp,0FFFFFFF0
 0041BA5A    push        ebx
 0041BA5B    push        esi
 0041BA5C    push        edi
 0041BA5D    xor         ebx,ebx
 0041BA5F    mov         dword ptr [ebp-10],ebx
 0041BA62    mov         dword ptr [ebp-0C],ebx
 0041BA65    mov         esi,ecx
 0041BA67    mov         ebx,edx
 0041BA69    mov         dword ptr [ebp-4],eax
 0041BA6C    xor         eax,eax
 0041BA6E    push        ebp
 0041BA6F    push        41BB2C
 0041BA74    push        dword ptr fs:[eax]
 0041BA77    mov         dword ptr fs:[eax],esp
 0041BA7A    mov         eax,dword ptr [ebp-4]
 0041BA7D    call        TStrings.BeginUpdate
 0041BA82    xor         eax,eax
 0041BA84    push        ebp
 0041BA85    push        41BB0A
 0041BA8A    push        dword ptr fs:[eax]
 0041BA8D    mov         dword ptr fs:[eax],esp
 0041BA90    lea         ecx,[ebp-0C]
 0041BA93    mov         edx,ebx
 0041BA95    mov         eax,dword ptr [ebp-4]
 0041BA98    mov         edi,dword ptr [eax]
 0041BA9A    call        dword ptr [edi+0C]
 0041BA9D    mov         edx,ebx
 0041BA9F    mov         eax,dword ptr [ebp-4]
 0041BAA2    mov         ecx,dword ptr [eax]
 0041BAA4    call        dword ptr [ecx+18]
 0041BAA7    mov         dword ptr [ebp-8],eax
 0041BAAA    lea         ecx,[ebp-10]
 0041BAAD    mov         edx,esi
 0041BAAF    mov         eax,dword ptr [ebp-4]
 0041BAB2    mov         edi,dword ptr [eax]
 0041BAB4    call        dword ptr [edi+0C]
 0041BAB7    mov         ecx,dword ptr [ebp-10]
 0041BABA    mov         edx,ebx
 0041BABC    mov         eax,dword ptr [ebp-4]
 0041BABF    mov         edi,dword ptr [eax]
 0041BAC1    call        dword ptr [edi+20]
 0041BAC4    mov         edx,esi
 0041BAC6    mov         eax,dword ptr [ebp-4]
 0041BAC9    mov         ecx,dword ptr [eax]
 0041BACB    call        dword ptr [ecx+18]
 0041BACE    mov         ecx,eax
 0041BAD0    mov         edx,ebx
 0041BAD2    mov         eax,dword ptr [ebp-4]
 0041BAD5    mov         ebx,dword ptr [eax]
 0041BAD7    call        dword ptr [ebx+24]
 0041BADA    mov         ecx,dword ptr [ebp-0C]
 0041BADD    mov         edx,esi
 0041BADF    mov         eax,dword ptr [ebp-4]
 0041BAE2    mov         ebx,dword ptr [eax]
 0041BAE4    call        dword ptr [ebx+20]
 0041BAE7    mov         ecx,dword ptr [ebp-8]
 0041BAEA    mov         edx,esi
 0041BAEC    mov         eax,dword ptr [ebp-4]
 0041BAEF    mov         ebx,dword ptr [eax]
 0041BAF1    call        dword ptr [ebx+24]
 0041BAF4    xor         eax,eax
 0041BAF6    pop         edx
 0041BAF7    pop         ecx
 0041BAF8    pop         ecx
 0041BAF9    mov         dword ptr fs:[eax],edx
 0041BAFC    push        41BB11
 0041BB01    mov         eax,dword ptr [ebp-4]
 0041BB04    call        TStrings.EndUpdate
 0041BB09    ret
>0041BB0A    jmp         @HandleFinally
>0041BB0F    jmp         0041BB01
 0041BB11    xor         eax,eax
 0041BB13    pop         edx
 0041BB14    pop         ecx
 0041BB15    pop         ecx
 0041BB16    mov         dword ptr fs:[eax],edx
 0041BB19    push        41BB33
 0041BB1E    lea         eax,[ebp-10]
 0041BB21    mov         edx,2
 0041BB26    call        @LStrArrayClr
 0041BB2B    ret
>0041BB2C    jmp         @HandleFinally
>0041BB31    jmp         0041BB1E
 0041BB33    pop         edi
 0041BB34    pop         esi
 0041BB35    pop         ebx
 0041BB36    mov         esp,ebp
 0041BB38    pop         ebp
 0041BB39    ret
*}
end;

//0041BB3C
procedure sub_0041BB3C;
begin
{*
 0041BB3C    mov         edx,dword ptr [eax]
 0041BB3E    call        dword ptr [edx+14];@AbstractError
 0041BB41    ret
*}
end;

//0041BB44
{*function sub_0041BB44:?;
begin
 0041BB44    xor         eax,eax
 0041BB46    ret
end;*}

//0041BB48
function TStrings.GetText:PChar;
begin
{*
 0041BB48    push        ebp
 0041BB49    mov         ebp,esp
 0041BB4B    push        0
 0041BB4D    push        ebx
 0041BB4E    mov         ebx,eax
 0041BB50    xor         eax,eax
 0041BB52    push        ebp
 0041BB53    push        41BB8D
 0041BB58    push        dword ptr fs:[eax]
 0041BB5B    mov         dword ptr fs:[eax],esp
 0041BB5E    lea         edx,[ebp-4]
 0041BB61    mov         eax,ebx
 0041BB63    mov         ecx,dword ptr [eax]
 0041BB65    call        dword ptr [ecx+1C]
 0041BB68    mov         eax,dword ptr [ebp-4]
 0041BB6B    call        @LStrToPChar
 0041BB70    call        StrNew
 0041BB75    mov         ebx,eax
 0041BB77    xor         eax,eax
 0041BB79    pop         edx
 0041BB7A    pop         ecx
 0041BB7B    pop         ecx
 0041BB7C    mov         dword ptr fs:[eax],edx
 0041BB7F    push        41BB94
 0041BB84    lea         eax,[ebp-4]
 0041BB87    call        @LStrClr
 0041BB8C    ret
>0041BB8D    jmp         @HandleFinally
>0041BB92    jmp         0041BB84
 0041BB94    mov         eax,ebx
 0041BB96    pop         ebx
 0041BB97    pop         ecx
 0041BB98    pop         ebp
 0041BB99    ret
*}
end;

//0041BB9C
function TStrings.GetTextStr:AnsiString;
begin
{*
 0041BB9C    push        ebp
 0041BB9D    mov         ebp,esp
 0041BB9F    add         esp,0FFFFFFE0
 0041BBA2    push        ebx
 0041BBA3    push        esi
 0041BBA4    push        edi
 0041BBA5    xor         ecx,ecx
 0041BBA7    mov         dword ptr [ebp-20],ecx
 0041BBAA    mov         dword ptr [ebp-18],ecx
 0041BBAD    mov         dword ptr [ebp-1C],ecx
 0041BBB0    mov         dword ptr [ebp-8],edx
 0041BBB3    mov         dword ptr [ebp-4],eax
 0041BBB6    xor         eax,eax
 0041BBB8    push        ebp
 0041BBB9    push        41BCA7
 0041BBBE    push        dword ptr fs:[eax]
 0041BBC1    mov         dword ptr fs:[eax],esp
 0041BBC4    mov         eax,dword ptr [ebp-4]
 0041BBC7    mov         edx,dword ptr [eax]
 0041BBC9    call        dword ptr [edx+14]
 0041BBCC    mov         dword ptr [ebp-10],eax
 0041BBCF    xor         ebx,ebx
 0041BBD1    lea         eax,[ebp-1C]
 0041BBD4    mov         edx,41BCC0;#13+#10
 0041BBD9    call        @LStrLAsg
 0041BBDE    mov         esi,dword ptr [ebp-10]
 0041BBE1    dec         esi
 0041BBE2    test        esi,esi
>0041BBE4    jl          0041BC18
 0041BBE6    inc         esi
 0041BBE7    mov         dword ptr [ebp-0C],0
 0041BBEE    lea         ecx,[ebp-20]
 0041BBF1    mov         edx,dword ptr [ebp-0C]
 0041BBF4    mov         eax,dword ptr [ebp-4]
 0041BBF7    mov         edi,dword ptr [eax]
 0041BBF9    call        dword ptr [edi+0C]
 0041BBFC    mov         eax,dword ptr [ebp-20]
 0041BBFF    call        @LStrLen
 0041BC04    mov         edi,eax
 0041BC06    mov         eax,dword ptr [ebp-1C]
 0041BC09    call        @LStrLen
 0041BC0E    add         edi,eax
 0041BC10    add         ebx,edi
 0041BC12    inc         dword ptr [ebp-0C]
 0041BC15    dec         esi
>0041BC16    jne         0041BBEE
 0041BC18    mov         eax,dword ptr [ebp-8]
 0041BC1B    mov         ecx,ebx
 0041BC1D    xor         edx,edx
 0041BC1F    call        @LStrFromPCharLen
 0041BC24    mov         eax,dword ptr [ebp-8]
 0041BC27    mov         eax,dword ptr [eax]
 0041BC29    mov         dword ptr [ebp-14],eax
 0041BC2C    mov         esi,dword ptr [ebp-10]
 0041BC2F    dec         esi
 0041BC30    test        esi,esi
>0041BC32    jl          0041BC8C
 0041BC34    inc         esi
 0041BC35    mov         dword ptr [ebp-0C],0
 0041BC3C    lea         ecx,[ebp-18]
 0041BC3F    mov         edx,dword ptr [ebp-0C]
 0041BC42    mov         eax,dword ptr [ebp-4]
 0041BC45    mov         ebx,dword ptr [eax]
 0041BC47    call        dword ptr [ebx+0C]
 0041BC4A    mov         eax,dword ptr [ebp-18]
 0041BC4D    call        @LStrLen
 0041BC52    mov         ebx,eax
 0041BC54    test        ebx,ebx
>0041BC56    je          0041BC68
 0041BC58    mov         edx,dword ptr [ebp-14]
 0041BC5B    mov         eax,dword ptr [ebp-18]
 0041BC5E    mov         ecx,ebx
 0041BC60    call        Move
 0041BC65    add         dword ptr [ebp-14],ebx
 0041BC68    mov         eax,dword ptr [ebp-1C]
 0041BC6B    call        @LStrLen
 0041BC70    mov         ebx,eax
 0041BC72    test        ebx,ebx
>0041BC74    je          0041BC86
 0041BC76    mov         edx,dword ptr [ebp-14]
 0041BC79    mov         eax,dword ptr [ebp-1C]
 0041BC7C    mov         ecx,ebx
 0041BC7E    call        Move
 0041BC83    add         dword ptr [ebp-14],ebx
 0041BC86    inc         dword ptr [ebp-0C]
 0041BC89    dec         esi
>0041BC8A    jne         0041BC3C
 0041BC8C    xor         eax,eax
 0041BC8E    pop         edx
 0041BC8F    pop         ecx
 0041BC90    pop         ecx
 0041BC91    mov         dword ptr fs:[eax],edx
 0041BC94    push        41BCAE
 0041BC99    lea         eax,[ebp-20]
 0041BC9C    mov         edx,3
 0041BCA1    call        @LStrArrayClr
 0041BCA6    ret
>0041BCA7    jmp         @HandleFinally
>0041BCAC    jmp         0041BC99
 0041BCAE    pop         edi
 0041BCAF    pop         esi
 0041BCB0    pop         ebx
 0041BCB1    mov         esp,ebp
 0041BCB3    pop         ebp
 0041BCB4    ret
*}
end;

//0041BCC4
function TStrings.GetValue(const Name:AnsiString):AnsiString;
begin
{*
 0041BCC4    push        ebp
 0041BCC5    mov         ebp,esp
 0041BCC7    add         esp,0FFFFFFF4
 0041BCCA    push        ebx
 0041BCCB    push        esi
 0041BCCC    xor         ebx,ebx
 0041BCCE    mov         dword ptr [ebp-0C],ebx
 0041BCD1    mov         dword ptr [ebp-8],ecx
 0041BCD4    mov         dword ptr [ebp-4],edx
 0041BCD7    mov         ebx,eax
 0041BCD9    xor         eax,eax
 0041BCDB    push        ebp
 0041BCDC    push        41BD43
 0041BCE1    push        dword ptr fs:[eax]
 0041BCE4    mov         dword ptr fs:[eax],esp
 0041BCE7    mov         edx,dword ptr [ebp-4]
 0041BCEA    mov         eax,ebx
 0041BCEC    mov         ecx,dword ptr [eax]
 0041BCEE    call        dword ptr [ecx+58]
 0041BCF1    mov         esi,eax
 0041BCF3    test        esi,esi
>0041BCF5    jl          0041BD25
 0041BCF7    mov         eax,dword ptr [ebp-8]
 0041BCFA    push        eax
 0041BCFB    lea         ecx,[ebp-0C]
 0041BCFE    mov         edx,esi
 0041BD00    mov         eax,ebx
 0041BD02    mov         ebx,dword ptr [eax]
 0041BD04    call        dword ptr [ebx+0C]
 0041BD07    mov         eax,dword ptr [ebp-0C]
 0041BD0A    push        eax
 0041BD0B    mov         eax,dword ptr [ebp-4]
 0041BD0E    call        @LStrLen
 0041BD13    mov         edx,eax
 0041BD15    add         edx,2
 0041BD18    mov         ecx,7FFFFFFF
 0041BD1D    pop         eax
 0041BD1E    call        @LStrCopy
>0041BD23    jmp         0041BD2D
 0041BD25    mov         eax,dword ptr [ebp-8]
 0041BD28    call        @LStrClr
 0041BD2D    xor         eax,eax
 0041BD2F    pop         edx
 0041BD30    pop         ecx
 0041BD31    pop         ecx
 0041BD32    mov         dword ptr fs:[eax],edx
 0041BD35    push        41BD4A
 0041BD3A    lea         eax,[ebp-0C]
 0041BD3D    call        @LStrClr
 0041BD42    ret
>0041BD43    jmp         @HandleFinally
>0041BD48    jmp         0041BD3A
 0041BD4A    pop         esi
 0041BD4B    pop         ebx
 0041BD4C    mov         esp,ebp
 0041BD4E    pop         ebp
 0041BD4F    ret
*}
end;

//0041BD50
function TStrings.IndexOf(const S:AnsiString):Integer;
begin
{*
 0041BD50    push        ebp
 0041BD51    mov         ebp,esp
 0041BD53    add         esp,0FFFFFFF4
 0041BD56    push        ebx
 0041BD57    push        esi
 0041BD58    push        edi
 0041BD59    xor         ecx,ecx
 0041BD5B    mov         dword ptr [ebp-0C],ecx
 0041BD5E    mov         dword ptr [ebp-4],edx
 0041BD61    mov         ebx,eax
 0041BD63    xor         eax,eax
 0041BD65    push        ebp
 0041BD66    push        41BDC8
 0041BD6B    push        dword ptr fs:[eax]
 0041BD6E    mov         dword ptr fs:[eax],esp
 0041BD71    mov         eax,ebx
 0041BD73    mov         edx,dword ptr [eax]
 0041BD75    call        dword ptr [edx+14]
 0041BD78    mov         esi,eax
 0041BD7A    dec         esi
 0041BD7B    test        esi,esi
>0041BD7D    jl          0041BDAB
 0041BD7F    inc         esi
 0041BD80    mov         dword ptr [ebp-8],0
 0041BD87    lea         ecx,[ebp-0C]
 0041BD8A    mov         edx,dword ptr [ebp-8]
 0041BD8D    mov         eax,ebx
 0041BD8F    mov         edi,dword ptr [eax]
 0041BD91    call        dword ptr [edi+0C]
 0041BD94    mov         edx,dword ptr [ebp-0C]
 0041BD97    mov         ecx,dword ptr [ebp-4]
 0041BD9A    mov         eax,ebx
 0041BD9C    mov         edi,dword ptr [eax]
 0041BD9E    call        dword ptr [edi+34]
 0041BDA1    test        eax,eax
>0041BDA3    je          0041BDB2
 0041BDA5    inc         dword ptr [ebp-8]
 0041BDA8    dec         esi
>0041BDA9    jne         0041BD87
 0041BDAB    mov         dword ptr [ebp-8],0FFFFFFFF
 0041BDB2    xor         eax,eax
 0041BDB4    pop         edx
 0041BDB5    pop         ecx
 0041BDB6    pop         ecx
 0041BDB7    mov         dword ptr fs:[eax],edx
 0041BDBA    push        41BDCF
 0041BDBF    lea         eax,[ebp-0C]
 0041BDC2    call        @LStrClr
 0041BDC7    ret
>0041BDC8    jmp         @HandleFinally
>0041BDCD    jmp         0041BDBF
 0041BDCF    mov         eax,dword ptr [ebp-8]
 0041BDD2    pop         edi
 0041BDD3    pop         esi
 0041BDD4    pop         ebx
 0041BDD5    mov         esp,ebp
 0041BDD7    pop         ebp
 0041BDD8    ret
*}
end;

//0041BDDC
function TStrings.IndexOfName(const Name:AnsiString):Integer;
begin
{*
 0041BDDC    push        ebp
 0041BDDD    mov         ebp,esp
 0041BDDF    add         esp,0FFFFFFE8
 0041BDE2    push        ebx
 0041BDE3    push        esi
 0041BDE4    xor         ecx,ecx
 0041BDE6    mov         dword ptr [ebp-18],ecx
 0041BDE9    mov         dword ptr [ebp-14],ecx
 0041BDEC    mov         dword ptr [ebp-0C],ecx
 0041BDEF    mov         dword ptr [ebp-4],edx
 0041BDF2    mov         ebx,eax
 0041BDF4    xor         eax,eax
 0041BDF6    push        ebp
 0041BDF7    push        41BE9F
 0041BDFC    push        dword ptr fs:[eax]
 0041BDFF    mov         dword ptr fs:[eax],esp
 0041BE02    mov         eax,ebx
 0041BE04    mov         edx,dword ptr [eax]
 0041BE06    call        dword ptr [edx+14]
 0041BE09    dec         eax
 0041BE0A    test        eax,eax
>0041BE0C    jl          0041BE75
 0041BE0E    inc         eax
 0041BE0F    mov         dword ptr [ebp-10],eax
 0041BE12    mov         dword ptr [ebp-8],0
 0041BE19    lea         ecx,[ebp-0C]
 0041BE1C    mov         edx,dword ptr [ebp-8]
 0041BE1F    mov         eax,ebx
 0041BE21    mov         esi,dword ptr [eax]
 0041BE23    call        dword ptr [esi+0C]
 0041BE26    mov         eax,ebx
 0041BE28    call        TStrings.GetNameValueSeparator
 0041BE2D    mov         edx,eax
 0041BE2F    lea         eax,[ebp-14]
 0041BE32    call        @LStrFromChar
 0041BE37    mov         eax,dword ptr [ebp-14]
 0041BE3A    mov         edx,dword ptr [ebp-0C]
 0041BE3D    call        AnsiPos
 0041BE42    mov         esi,eax
 0041BE44    test        esi,esi
>0041BE46    je          0041BE6D
 0041BE48    lea         eax,[ebp-18]
 0041BE4B    push        eax
 0041BE4C    mov         ecx,esi
 0041BE4E    dec         ecx
 0041BE4F    mov         edx,1
 0041BE54    mov         eax,dword ptr [ebp-0C]
 0041BE57    call        @LStrCopy
 0041BE5C    mov         edx,dword ptr [ebp-18]
 0041BE5F    mov         ecx,dword ptr [ebp-4]
 0041BE62    mov         eax,ebx
 0041BE64    mov         esi,dword ptr [eax]
 0041BE66    call        dword ptr [esi+34]
 0041BE69    test        eax,eax
>0041BE6B    je          0041BE7C
 0041BE6D    inc         dword ptr [ebp-8]
 0041BE70    dec         dword ptr [ebp-10]
>0041BE73    jne         0041BE19
 0041BE75    mov         dword ptr [ebp-8],0FFFFFFFF
 0041BE7C    xor         eax,eax
 0041BE7E    pop         edx
 0041BE7F    pop         ecx
 0041BE80    pop         ecx
 0041BE81    mov         dword ptr fs:[eax],edx
 0041BE84    push        41BEA6
 0041BE89    lea         eax,[ebp-18]
 0041BE8C    mov         edx,2
 0041BE91    call        @LStrArrayClr
 0041BE96    lea         eax,[ebp-0C]
 0041BE99    call        @LStrClr
 0041BE9E    ret
>0041BE9F    jmp         @HandleFinally
>0041BEA4    jmp         0041BE89
 0041BEA6    mov         eax,dword ptr [ebp-8]
 0041BEA9    pop         esi
 0041BEAA    pop         ebx
 0041BEAB    mov         esp,ebp
 0041BEAD    pop         ebp
 0041BEAE    ret
*}
end;

//0041BEB0
function TStrings.IndexOfObject(AObject:TObject):Integer;
begin
{*
 0041BEB0    push        ebx
 0041BEB1    push        esi
 0041BEB2    push        edi
 0041BEB3    push        ebp
 0041BEB4    mov         ebp,edx
 0041BEB6    mov         edi,eax
 0041BEB8    mov         eax,edi
 0041BEBA    mov         edx,dword ptr [eax]
 0041BEBC    call        dword ptr [edx+14]
 0041BEBF    mov         ebx,eax
 0041BEC1    dec         ebx
 0041BEC2    test        ebx,ebx
>0041BEC4    jl          0041BEDA
 0041BEC6    inc         ebx
 0041BEC7    xor         esi,esi
 0041BEC9    mov         edx,esi
 0041BECB    mov         eax,edi
 0041BECD    mov         ecx,dword ptr [eax]
 0041BECF    call        dword ptr [ecx+18]
 0041BED2    cmp         ebp,eax
>0041BED4    je          0041BEDD
 0041BED6    inc         esi
 0041BED7    dec         ebx
>0041BED8    jne         0041BEC9
 0041BEDA    or          esi,0FFFFFFFF
 0041BEDD    mov         eax,esi
 0041BEDF    pop         ebp
 0041BEE0    pop         edi
 0041BEE1    pop         esi
 0041BEE2    pop         ebx
 0041BEE3    ret
*}
end;

//0041BEE4
procedure TStrings.InsertObject(Index:Integer; const S:AnsiString; AObject:TObject);
begin
{*
 0041BEE4    push        ebp
 0041BEE5    mov         ebp,esp
 0041BEE7    push        ecx
 0041BEE8    push        ebx
 0041BEE9    push        esi
 0041BEEA    push        edi
 0041BEEB    mov         dword ptr [ebp-4],ecx
 0041BEEE    mov         edi,edx
 0041BEF0    mov         esi,eax
 0041BEF2    mov         ecx,dword ptr [ebp-4]
 0041BEF5    mov         edx,edi
 0041BEF7    mov         eax,esi
 0041BEF9    mov         ebx,dword ptr [eax]
 0041BEFB    call        dword ptr [ebx+60]
 0041BEFE    mov         ecx,dword ptr [ebp+8]
 0041BF01    mov         edx,edi
 0041BF03    mov         eax,esi
 0041BF05    mov         ebx,dword ptr [eax]
 0041BF07    call        dword ptr [ebx+24]
 0041BF0A    pop         edi
 0041BF0B    pop         esi
 0041BF0C    pop         ebx
 0041BF0D    pop         ecx
 0041BF0E    pop         ebp
 0041BF0F    ret         4
*}
end;

//0041BF14
procedure TStrings.LoadFromFile(const FileName:AnsiString);
begin
{*
 0041BF14    push        ebp
 0041BF15    mov         ebp,esp
 0041BF17    push        ecx
 0041BF18    push        esi
 0041BF19    mov         esi,eax
 0041BF1B    push        20
 0041BF1D    mov         ecx,edx
 0041BF1F    mov         eax,[00418550];TFileStream
 0041BF24    mov         dl,1
 0041BF26    call        TFileStream.Create
 0041BF2B    mov         dword ptr [ebp-4],eax
 0041BF2E    xor         eax,eax
 0041BF30    push        ebp
 0041BF31    push        41BF5C
 0041BF36    push        dword ptr fs:[eax]
 0041BF39    mov         dword ptr fs:[eax],esp
 0041BF3C    mov         edx,dword ptr [ebp-4]
 0041BF3F    mov         eax,esi
 0041BF41    mov         ecx,dword ptr [eax]
 0041BF43    call        dword ptr [ecx+6C]
 0041BF46    xor         eax,eax
 0041BF48    pop         edx
 0041BF49    pop         ecx
 0041BF4A    pop         ecx
 0041BF4B    mov         dword ptr fs:[eax],edx
 0041BF4E    push        41BF63
 0041BF53    mov         eax,dword ptr [ebp-4]
 0041BF56    call        TObject.Free
 0041BF5B    ret
>0041BF5C    jmp         @HandleFinally
>0041BF61    jmp         0041BF53
 0041BF63    pop         esi
 0041BF64    pop         ecx
 0041BF65    pop         ebp
 0041BF66    ret
*}
end;

//0041BF68
procedure TStrings.LoadFromStream(Stream:TStream);
begin
{*
 0041BF68    push        ebp
 0041BF69    mov         ebp,esp
 0041BF6B    add         esp,0FFFFFFF8
 0041BF6E    push        ebx
 0041BF6F    push        esi
 0041BF70    xor         ecx,ecx
 0041BF72    mov         dword ptr [ebp-8],ecx
 0041BF75    mov         ebx,edx
 0041BF77    mov         dword ptr [ebp-4],eax
 0041BF7A    xor         eax,eax
 0041BF7C    push        ebp
 0041BF7D    push        41C005
 0041BF82    push        dword ptr fs:[eax]
 0041BF85    mov         dword ptr fs:[eax],esp
 0041BF88    mov         eax,dword ptr [ebp-4]
 0041BF8B    call        TStrings.BeginUpdate
 0041BF90    xor         eax,eax
 0041BF92    push        ebp
 0041BF93    push        41BFE8
 0041BF98    push        dword ptr fs:[eax]
 0041BF9B    mov         dword ptr fs:[eax],esp
 0041BF9E    mov         eax,ebx
 0041BFA0    mov         edx,dword ptr [eax]
 0041BFA2    call        dword ptr [edx]
 0041BFA4    mov         esi,eax
 0041BFA6    mov         eax,ebx
 0041BFA8    call        TStream.GetPosition
 0041BFAD    sub         esi,eax
 0041BFAF    lea         eax,[ebp-8]
 0041BFB2    mov         ecx,esi
 0041BFB4    xor         edx,edx
 0041BFB6    call        @LStrFromPCharLen
 0041BFBB    mov         edx,dword ptr [ebp-8]
 0041BFBE    mov         ecx,esi
 0041BFC0    mov         eax,ebx
 0041BFC2    mov         ebx,dword ptr [eax]
 0041BFC4    call        dword ptr [ebx+0C]
 0041BFC7    mov         edx,dword ptr [ebp-8]
 0041BFCA    mov         eax,dword ptr [ebp-4]
 0041BFCD    mov         ecx,dword ptr [eax]
 0041BFCF    call        dword ptr [ecx+2C]
 0041BFD2    xor         eax,eax
 0041BFD4    pop         edx
 0041BFD5    pop         ecx
 0041BFD6    pop         ecx
 0041BFD7    mov         dword ptr fs:[eax],edx
 0041BFDA    push        41BFEF
 0041BFDF    mov         eax,dword ptr [ebp-4]
 0041BFE2    call        TStrings.EndUpdate
 0041BFE7    ret
>0041BFE8    jmp         @HandleFinally
>0041BFED    jmp         0041BFDF
 0041BFEF    xor         eax,eax
 0041BFF1    pop         edx
 0041BFF2    pop         ecx
 0041BFF3    pop         ecx
 0041BFF4    mov         dword ptr fs:[eax],edx
 0041BFF7    push        41C00C
 0041BFFC    lea         eax,[ebp-8]
 0041BFFF    call        @LStrClr
 0041C004    ret
>0041C005    jmp         @HandleFinally
>0041C00A    jmp         0041BFFC
 0041C00C    pop         esi
 0041C00D    pop         ebx
 0041C00E    pop         ecx
 0041C00F    pop         ecx
 0041C010    pop         ebp
 0041C011    ret
*}
end;

//0041C014
procedure TStrings.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 0041C014    push        ebp
 0041C015    mov         ebp,esp
 0041C017    add         esp,0FFFFFFF8
 0041C01A    push        ebx
 0041C01B    push        esi
 0041C01C    push        edi
 0041C01D    xor         ebx,ebx
 0041C01F    mov         dword ptr [ebp-8],ebx
 0041C022    mov         esi,ecx
 0041C024    mov         ebx,edx
 0041C026    mov         dword ptr [ebp-4],eax
 0041C029    xor         eax,eax
 0041C02B    push        ebp
 0041C02C    push        41C0B5
 0041C031    push        dword ptr fs:[eax]
 0041C034    mov         dword ptr fs:[eax],esp
 0041C037    cmp         esi,ebx
>0041C039    je          0041C09F
 0041C03B    mov         eax,dword ptr [ebp-4]
 0041C03E    call        TStrings.BeginUpdate
 0041C043    xor         eax,eax
 0041C045    push        ebp
 0041C046    push        41C098
 0041C04B    push        dword ptr fs:[eax]
 0041C04E    mov         dword ptr fs:[eax],esp
 0041C051    lea         ecx,[ebp-8]
 0041C054    mov         edx,ebx
 0041C056    mov         eax,dword ptr [ebp-4]
 0041C059    mov         edi,dword ptr [eax]
 0041C05B    call        dword ptr [edi+0C]
 0041C05E    mov         edx,ebx
 0041C060    mov         eax,dword ptr [ebp-4]
 0041C063    mov         ecx,dword ptr [eax]
 0041C065    call        dword ptr [ecx+18]
 0041C068    mov         edi,eax
 0041C06A    mov         edx,ebx
 0041C06C    mov         eax,dword ptr [ebp-4]
 0041C06F    mov         ecx,dword ptr [eax]
 0041C071    call        dword ptr [ecx+48]
 0041C074    push        edi
 0041C075    mov         ecx,dword ptr [ebp-8]
 0041C078    mov         edx,esi
 0041C07A    mov         eax,dword ptr [ebp-4]
 0041C07D    mov         ebx,dword ptr [eax]
 0041C07F    call        dword ptr [ebx+64]
 0041C082    xor         eax,eax
 0041C084    pop         edx
 0041C085    pop         ecx
 0041C086    pop         ecx
 0041C087    mov         dword ptr fs:[eax],edx
 0041C08A    push        41C09F
 0041C08F    mov         eax,dword ptr [ebp-4]
 0041C092    call        TStrings.EndUpdate
 0041C097    ret
>0041C098    jmp         @HandleFinally
>0041C09D    jmp         0041C08F
 0041C09F    xor         eax,eax
 0041C0A1    pop         edx
 0041C0A2    pop         ecx
 0041C0A3    pop         ecx
 0041C0A4    mov         dword ptr fs:[eax],edx
 0041C0A7    push        41C0BC
 0041C0AC    lea         eax,[ebp-8]
 0041C0AF    call        @LStrClr
 0041C0B4    ret
>0041C0B5    jmp         @HandleFinally
>0041C0BA    jmp         0041C0AC
 0041C0BC    pop         edi
 0041C0BD    pop         esi
 0041C0BE    pop         ebx
 0041C0BF    pop         ecx
 0041C0C0    pop         ecx
 0041C0C1    pop         ebp
 0041C0C2    ret
*}
end;

//0041C0C4
procedure TStrings.Put(Index:Integer; const S:AnsiString);
begin
{*
 0041C0C4    push        ebx
 0041C0C5    push        esi
 0041C0C6    push        edi
 0041C0C7    push        ebp
 0041C0C8    push        ecx
 0041C0C9    mov         dword ptr [esp],ecx
 0041C0CC    mov         edi,edx
 0041C0CE    mov         esi,eax
 0041C0D0    mov         edx,edi
 0041C0D2    mov         eax,esi
 0041C0D4    mov         ecx,dword ptr [eax]
 0041C0D6    call        dword ptr [ecx+18]
 0041C0D9    mov         ebp,eax
 0041C0DB    mov         edx,edi
 0041C0DD    mov         eax,esi
 0041C0DF    mov         ecx,dword ptr [eax]
 0041C0E1    call        dword ptr [ecx+48]
 0041C0E4    push        ebp
 0041C0E5    mov         ecx,dword ptr [esp+4]
 0041C0E9    mov         edx,edi
 0041C0EB    mov         eax,esi
 0041C0ED    mov         ebx,dword ptr [eax]
 0041C0EF    call        dword ptr [ebx+64]
 0041C0F2    pop         edx
 0041C0F3    pop         ebp
 0041C0F4    pop         edi
 0041C0F5    pop         esi
 0041C0F6    pop         ebx
 0041C0F7    ret
*}
end;

//0041C0F8
procedure sub_0041C0F8;
begin
{*
 0041C0F8    ret
*}
end;

//0041C0FC
procedure TStrings.ReadData(Reader:TReader);
begin
{*
 0041C0FC    push        ebp
 0041C0FD    mov         ebp,esp
 0041C0FF    add         esp,0FFFFFFF4
 0041C102    xor         ecx,ecx
 0041C104    mov         dword ptr [ebp-0C],ecx
 0041C107    mov         dword ptr [ebp-8],edx
 0041C10A    mov         dword ptr [ebp-4],eax
 0041C10D    xor         eax,eax
 0041C10F    push        ebp
 0041C110    push        41C1A0
 0041C115    push        dword ptr fs:[eax]
 0041C118    mov         dword ptr fs:[eax],esp
 0041C11B    mov         eax,dword ptr [ebp-8]
 0041C11E    call        TReader.ReadListBegin
 0041C123    mov         eax,dword ptr [ebp-4]
 0041C126    call        TStrings.BeginUpdate
 0041C12B    xor         eax,eax
 0041C12D    push        ebp
 0041C12E    push        41C17B
 0041C133    push        dword ptr fs:[eax]
 0041C136    mov         dword ptr fs:[eax],esp
 0041C139    mov         eax,dword ptr [ebp-4]
 0041C13C    mov         edx,dword ptr [eax]
 0041C13E    call        dword ptr [edx+44]
>0041C141    jmp         0041C159
 0041C143    lea         edx,[ebp-0C]
 0041C146    mov         eax,dword ptr [ebp-8]
 0041C149    call        TReader.ReadString
 0041C14E    mov         edx,dword ptr [ebp-0C]
 0041C151    mov         eax,dword ptr [ebp-4]
 0041C154    mov         ecx,dword ptr [eax]
 0041C156    call        dword ptr [ecx+38]
 0041C159    mov         eax,dword ptr [ebp-8]
 0041C15C    call        TReader.EndOfList
 0041C161    test        al,al
>0041C163    je          0041C143
 0041C165    xor         eax,eax
 0041C167    pop         edx
 0041C168    pop         ecx
 0041C169    pop         ecx
 0041C16A    mov         dword ptr fs:[eax],edx
 0041C16D    push        41C182
 0041C172    mov         eax,dword ptr [ebp-4]
 0041C175    call        TStrings.EndUpdate
 0041C17A    ret
>0041C17B    jmp         @HandleFinally
>0041C180    jmp         0041C172
 0041C182    mov         eax,dword ptr [ebp-8]
 0041C185    call        TReader.ReadListEnd
 0041C18A    xor         eax,eax
 0041C18C    pop         edx
 0041C18D    pop         ecx
 0041C18E    pop         ecx
 0041C18F    mov         dword ptr fs:[eax],edx
 0041C192    push        41C1A7
 0041C197    lea         eax,[ebp-0C]
 0041C19A    call        @LStrClr
 0041C19F    ret
>0041C1A0    jmp         @HandleFinally
>0041C1A5    jmp         0041C197
 0041C1A7    mov         esp,ebp
 0041C1A9    pop         ebp
 0041C1AA    ret
*}
end;

//0041C1AC
procedure TStrings.SaveToFile(const FileName:AnsiString);
begin
{*
 0041C1AC    push        ebp
 0041C1AD    mov         ebp,esp
 0041C1AF    push        ecx
 0041C1B0    push        esi
 0041C1B1    mov         esi,eax
 0041C1B3    push        0FFFF
 0041C1B8    mov         ecx,edx
 0041C1BA    mov         eax,[00418550];TFileStream
 0041C1BF    mov         dl,1
 0041C1C1    call        TFileStream.Create
 0041C1C6    mov         dword ptr [ebp-4],eax
 0041C1C9    xor         eax,eax
 0041C1CB    push        ebp
 0041C1CC    push        41C1F7
 0041C1D1    push        dword ptr fs:[eax]
 0041C1D4    mov         dword ptr fs:[eax],esp
 0041C1D7    mov         edx,dword ptr [ebp-4]
 0041C1DA    mov         eax,esi
 0041C1DC    mov         ecx,dword ptr [eax]
 0041C1DE    call        dword ptr [ecx+78]
 0041C1E1    xor         eax,eax
 0041C1E3    pop         edx
 0041C1E4    pop         ecx
 0041C1E5    pop         ecx
 0041C1E6    mov         dword ptr fs:[eax],edx
 0041C1E9    push        41C1FE
 0041C1EE    mov         eax,dword ptr [ebp-4]
 0041C1F1    call        TObject.Free
 0041C1F6    ret
>0041C1F7    jmp         @HandleFinally
>0041C1FC    jmp         0041C1EE
 0041C1FE    pop         esi
 0041C1FF    pop         ecx
 0041C200    pop         ebp
 0041C201    ret
*}
end;

//0041C204
procedure TStrings.SaveToStream(Stream:TStream);
begin
{*
 0041C204    push        ebp
 0041C205    mov         ebp,esp
 0041C207    push        0
 0041C209    push        ebx
 0041C20A    push        esi
 0041C20B    mov         esi,edx
 0041C20D    mov         ebx,eax
 0041C20F    xor         eax,eax
 0041C211    push        ebp
 0041C212    push        41C251
 0041C217    push        dword ptr fs:[eax]
 0041C21A    mov         dword ptr fs:[eax],esp
 0041C21D    lea         edx,[ebp-4]
 0041C220    mov         eax,ebx
 0041C222    mov         ecx,dword ptr [eax]
 0041C224    call        dword ptr [ecx+1C]
 0041C227    mov         eax,dword ptr [ebp-4]
 0041C22A    call        @LStrLen
 0041C22F    mov         ecx,eax
 0041C231    mov         edx,dword ptr [ebp-4]
 0041C234    mov         eax,esi
 0041C236    call        TStream.WriteBuffer
 0041C23B    xor         eax,eax
 0041C23D    pop         edx
 0041C23E    pop         ecx
 0041C23F    pop         ecx
 0041C240    mov         dword ptr fs:[eax],edx
 0041C243    push        41C258
 0041C248    lea         eax,[ebp-4]
 0041C24B    call        @LStrClr
 0041C250    ret
>0041C251    jmp         @HandleFinally
>0041C256    jmp         0041C248
 0041C258    pop         esi
 0041C259    pop         ebx
 0041C25A    pop         ecx
 0041C25B    pop         ebp
 0041C25C    ret
*}
end;

//0041C260
procedure sub_0041C260;
begin
{*
 0041C260    ret
*}
end;

//0041C264
procedure TStrings.SetStringsAdapter(const Value:IStringsAdapter);
begin
{*
 0041C264    push        ebx
 0041C265    push        esi
 0041C266    mov         esi,edx
 0041C268    mov         ebx,eax
 0041C26A    cmp         dword ptr [ebx+0C],0
>0041C26E    je          0041C278
 0041C270    mov         eax,dword ptr [ebx+0C]
 0041C273    mov         edx,dword ptr [eax]
 0041C275    call        dword ptr [edx+10]
 0041C278    lea         eax,[ebx+0C]
 0041C27B    mov         edx,esi
 0041C27D    call        @IntfCopy
 0041C282    cmp         dword ptr [ebx+0C],0
>0041C286    je          0041C292
 0041C288    mov         edx,ebx
 0041C28A    mov         eax,dword ptr [ebx+0C]
 0041C28D    mov         ecx,dword ptr [eax]
 0041C28F    call        dword ptr [ecx+0C]
 0041C292    pop         esi
 0041C293    pop         ebx
 0041C294    ret
*}
end;

//0041C298
procedure TStrings.SetText(Text:PChar);
begin
{*
 0041C298    push        ebp
 0041C299    mov         ebp,esp
 0041C29B    push        0
 0041C29D    push        ebx
 0041C29E    push        esi
 0041C29F    mov         esi,edx
 0041C2A1    mov         ebx,eax
 0041C2A3    xor         eax,eax
 0041C2A5    push        ebp
 0041C2A6    push        41C2DB
 0041C2AB    push        dword ptr fs:[eax]
 0041C2AE    mov         dword ptr fs:[eax],esp
 0041C2B1    lea         eax,[ebp-4]
 0041C2B4    mov         edx,esi
 0041C2B6    call        @LStrFromPChar
 0041C2BB    mov         edx,dword ptr [ebp-4]
 0041C2BE    mov         eax,ebx
 0041C2C0    mov         ecx,dword ptr [eax]
 0041C2C2    call        dword ptr [ecx+2C]
 0041C2C5    xor         eax,eax
 0041C2C7    pop         edx
 0041C2C8    pop         ecx
 0041C2C9    pop         ecx
 0041C2CA    mov         dword ptr fs:[eax],edx
 0041C2CD    push        41C2E2
 0041C2D2    lea         eax,[ebp-4]
 0041C2D5    call        @LStrClr
 0041C2DA    ret
>0041C2DB    jmp         @HandleFinally
>0041C2E0    jmp         0041C2D2
 0041C2E2    pop         esi
 0041C2E3    pop         ebx
 0041C2E4    pop         ecx
 0041C2E5    pop         ebp
 0041C2E6    ret
*}
end;

//0041C2E8
procedure TStrings.SetTextStr(const Value:AnsiString);
begin
{*
 0041C2E8    push        ebp
 0041C2E9    mov         ebp,esp
 0041C2EB    add         esp,0FFFFFFF8
 0041C2EE    push        ebx
 0041C2EF    xor         ecx,ecx
 0041C2F1    mov         dword ptr [ebp-8],ecx
 0041C2F4    mov         ebx,edx
 0041C2F6    mov         dword ptr [ebp-4],eax
 0041C2F9    xor         eax,eax
 0041C2FB    push        ebp
 0041C2FC    push        41C39C
 0041C301    push        dword ptr fs:[eax]
 0041C304    mov         dword ptr fs:[eax],esp
 0041C307    mov         eax,dword ptr [ebp-4]
 0041C30A    call        TStrings.BeginUpdate
 0041C30F    xor         edx,edx
 0041C311    push        ebp
 0041C312    push        41C37F
 0041C317    push        dword ptr fs:[edx]
 0041C31A    mov         dword ptr fs:[edx],esp
 0041C31D    mov         eax,dword ptr [ebp-4]
 0041C320    mov         edx,dword ptr [eax]
 0041C322    call        dword ptr [edx+44]
 0041C325    test        ebx,ebx
>0041C327    je          0041C369
>0041C329    jmp         0041C364
 0041C32B    mov         eax,ebx
>0041C32D    jmp         0041C330
 0041C32F    inc         ebx
 0041C330    mov         dl,byte ptr [ebx]
 0041C332    test        dl,dl
>0041C334    je          0041C340
 0041C336    sub         dl,0A
>0041C339    je          0041C340
 0041C33B    sub         dl,3
>0041C33E    jne         0041C32F
 0041C340    mov         ecx,ebx
 0041C342    sub         ecx,eax
 0041C344    lea         edx,[ebp-8]
 0041C347    xchg        eax,edx
 0041C348    call        @LStrFromPCharLen
 0041C34D    mov         edx,dword ptr [ebp-8]
 0041C350    mov         eax,dword ptr [ebp-4]
 0041C353    mov         ecx,dword ptr [eax]
 0041C355    call        dword ptr [ecx+38]
 0041C358    cmp         byte ptr [ebx],0D
>0041C35B    jne         0041C35E
 0041C35D    inc         ebx
 0041C35E    cmp         byte ptr [ebx],0A
>0041C361    jne         0041C364
 0041C363    inc         ebx
 0041C364    cmp         byte ptr [ebx],0
>0041C367    jne         0041C32B
 0041C369    xor         eax,eax
 0041C36B    pop         edx
 0041C36C    pop         ecx
 0041C36D    pop         ecx
 0041C36E    mov         dword ptr fs:[eax],edx
 0041C371    push        41C386
 0041C376    mov         eax,dword ptr [ebp-4]
 0041C379    call        TStrings.EndUpdate
 0041C37E    ret
>0041C37F    jmp         @HandleFinally
>0041C384    jmp         0041C376
 0041C386    xor         eax,eax
 0041C388    pop         edx
 0041C389    pop         ecx
 0041C38A    pop         ecx
 0041C38B    mov         dword ptr fs:[eax],edx
 0041C38E    push        41C3A3
 0041C393    lea         eax,[ebp-8]
 0041C396    call        @LStrClr
 0041C39B    ret
>0041C39C    jmp         @HandleFinally
>0041C3A1    jmp         0041C393
 0041C3A3    pop         ebx
 0041C3A4    pop         ecx
 0041C3A5    pop         ecx
 0041C3A6    pop         ebp
 0041C3A7    ret
*}
end;

//0041C3A8
procedure sub_0041C3A8;
begin
{*
 0041C3A8    ret
*}
end;

//0041C3AC
procedure TStrings.WriteData(Writer:TWriter);
begin
{*
 0041C3AC    push        ebp
 0041C3AD    mov         ebp,esp
 0041C3AF    add         esp,0FFFFFFF4
 0041C3B2    push        ebx
 0041C3B3    push        esi
 0041C3B4    push        edi
 0041C3B5    xor         ecx,ecx
 0041C3B7    mov         dword ptr [ebp-0C],ecx
 0041C3BA    mov         dword ptr [ebp-8],edx
 0041C3BD    mov         dword ptr [ebp-4],eax
 0041C3C0    xor         eax,eax
 0041C3C2    push        ebp
 0041C3C3    push        41C422
 0041C3C8    push        dword ptr fs:[eax]
 0041C3CB    mov         dword ptr fs:[eax],esp
 0041C3CE    mov         eax,dword ptr [ebp-8]
 0041C3D1    call        TWriter.WriteListBegin
 0041C3D6    mov         eax,dword ptr [ebp-4]
 0041C3D9    mov         edx,dword ptr [eax]
 0041C3DB    call        dword ptr [edx+14]
 0041C3DE    mov         ebx,eax
 0041C3E0    dec         ebx
 0041C3E1    test        ebx,ebx
>0041C3E3    jl          0041C404
 0041C3E5    inc         ebx
 0041C3E6    xor         esi,esi
 0041C3E8    lea         ecx,[ebp-0C]
 0041C3EB    mov         edx,esi
 0041C3ED    mov         eax,dword ptr [ebp-4]
 0041C3F0    mov         edi,dword ptr [eax]
 0041C3F2    call        dword ptr [edi+0C]
 0041C3F5    mov         edx,dword ptr [ebp-0C]
 0041C3F8    mov         eax,dword ptr [ebp-8]
 0041C3FB    call        TWriter.WriteString
 0041C400    inc         esi
 0041C401    dec         ebx
>0041C402    jne         0041C3E8
 0041C404    mov         eax,dword ptr [ebp-8]
 0041C407    call        TWriter.WriteListEnd
 0041C40C    xor         eax,eax
 0041C40E    pop         edx
 0041C40F    pop         ecx
 0041C410    pop         ecx
 0041C411    mov         dword ptr fs:[eax],edx
 0041C414    push        41C429
 0041C419    lea         eax,[ebp-0C]
 0041C41C    call        @LStrClr
 0041C421    ret
>0041C422    jmp         @HandleFinally
>0041C427    jmp         0041C419
 0041C429    pop         edi
 0041C42A    pop         esi
 0041C42B    pop         ebx
 0041C42C    mov         esp,ebp
 0041C42E    pop         ebp
 0041C42F    ret
*}
end;

//0041C430
function TStrings.CompareStrings(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 0041C430    mov         eax,edx
 0041C432    mov         edx,ecx
 0041C434    call        AnsiCompareText
 0041C439    ret
*}
end;

//0041C43C
function TStrings.GetNameValueSeparator:Char;
begin
{*
 0041C43C    push        ebx
 0041C43D    mov         ebx,eax
 0041C43F    test        byte ptr [ebx+4],4
>0041C443    jne         0041C44E
 0041C445    mov         dl,3D
 0041C447    mov         eax,ebx
 0041C449    call        TStrings.SetNameValueSeparator
 0041C44E    mov         al,byte ptr [ebx+7]
 0041C451    pop         ebx
 0041C452    ret
*}
end;

//0041C454
procedure TStrings.SetNameValueSeparator(const Value:Char);
begin
{*
 0041C454    push        ebx
 0041C455    push        esi
 0041C456    mov         ebx,edx
 0041C458    mov         esi,eax
 0041C45A    cmp         bl,byte ptr [esi+7]
>0041C45D    jne         0041C465
 0041C45F    test        byte ptr [esi+4],4
>0041C463    jne         0041C46C
 0041C465    or          byte ptr [esi+4],4
 0041C469    mov         byte ptr [esi+7],bl
 0041C46C    pop         esi
 0041C46D    pop         ebx
 0041C46E    ret
*}
end;

//0041C470
destructor TStringList.Destroy;
begin
{*
 0041C470    push        ebx
 0041C471    push        esi
 0041C472    call        @BeforeDestruction
 0041C477    mov         ebx,edx
 0041C479    mov         esi,eax
 0041C47B    xor         eax,eax
 0041C47D    mov         dword ptr [esi+20],eax
 0041C480    mov         dword ptr [esi+24],eax
 0041C483    xor         eax,eax
 0041C485    mov         dword ptr [esi+28],eax
 0041C488    mov         dword ptr [esi+2C],eax
 0041C48B    mov         edx,ebx
 0041C48D    and         dl,0FC
 0041C490    mov         eax,esi
 0041C492    call        TStrings.Destroy
 0041C497    mov         eax,dword ptr [esi+14]
 0041C49A    test        eax,eax
>0041C49C    je          0041C4AE
 0041C49E    mov         ecx,eax
 0041C4A0    mov         eax,dword ptr [esi+10]
 0041C4A3    mov         edx,dword ptr ds:[41832C];TStringItem
 0041C4A9    call        @FinalizeArray
 0041C4AE    xor         eax,eax
 0041C4B0    mov         dword ptr [esi+14],eax
 0041C4B3    xor         edx,edx
 0041C4B5    mov         eax,esi
 0041C4B7    mov         ecx,dword ptr [eax]
 0041C4B9    call        dword ptr [ecx+28]
 0041C4BC    test        bl,bl
>0041C4BE    jle         0041C4C7
 0041C4C0    mov         eax,esi
 0041C4C2    call        @ClassDestroy
 0041C4C7    pop         esi
 0041C4C8    pop         ebx
 0041C4C9    ret
*}
end;

//0041C4CC
function TStringList.Add(const S:AnsiString):Integer;
begin
{*
 0041C4CC    push        ebx
 0041C4CD    xor         ecx,ecx
 0041C4CF    mov         ebx,dword ptr [eax]
 0041C4D1    call        dword ptr [ebx+3C]
 0041C4D4    pop         ebx
 0041C4D5    ret
*}
end;

//0041C4D8
function TStringList.AddObject(const S:AnsiString; AObject:TObject):Integer;
begin
{*
 0041C4D8    push        ebx
 0041C4D9    push        esi
 0041C4DA    push        edi
 0041C4DB    push        ebp
 0041C4DC    push        ecx
 0041C4DD    mov         edi,ecx
 0041C4DF    mov         esi,edx
 0041C4E1    mov         ebx,eax
 0041C4E3    cmp         byte ptr [ebx+1C],0
>0041C4E7    jne         0041C4F1
 0041C4E9    mov         eax,dword ptr [ebx+14]
 0041C4EC    mov         dword ptr [esp],eax
>0041C4EF    jmp         0041C51F
 0041C4F1    mov         ecx,esp
 0041C4F3    mov         edx,esi
 0041C4F5    mov         eax,ebx
 0041C4F7    mov         ebp,dword ptr [eax]
 0041C4F9    call        dword ptr [ebp+8C]
 0041C4FF    test        al,al
>0041C501    je          0041C51F
 0041C503    mov         al,byte ptr [ebx+1D]
 0041C506    sub         al,1
>0041C508    jb          0041C530
 0041C50A    dec         al
>0041C50C    je          0041C510
>0041C50E    jmp         0041C51F
 0041C510    mov         edx,dword ptr ds:[5AE2AC];^SDuplicateString:TResStringRec
 0041C516    xor         ecx,ecx
 0041C518    mov         eax,ebx
 0041C51A    call        TStrings.Error
 0041C51F    push        edi
 0041C520    mov         ecx,esi
 0041C522    mov         edx,dword ptr [esp+4]
 0041C526    mov         eax,ebx
 0041C528    mov         ebx,dword ptr [eax]
 0041C52A    call        dword ptr [ebx+88]
 0041C530    mov         eax,dword ptr [esp]
 0041C533    pop         edx
 0041C534    pop         ebp
 0041C535    pop         edi
 0041C536    pop         esi
 0041C537    pop         ebx
 0041C538    ret
*}
end;

//0041C53C
procedure TStringList.Changed;
begin
{*
 0041C53C    push        ebx
 0041C53D    cmp         dword ptr [eax+8],0
>0041C541    jne         0041C554
 0041C543    cmp         word ptr [eax+22],0
>0041C548    je          0041C554
 0041C54A    mov         ebx,eax
 0041C54C    mov         edx,eax
 0041C54E    mov         eax,dword ptr [ebx+24]
 0041C551    call        dword ptr [ebx+20]
 0041C554    pop         ebx
 0041C555    ret
*}
end;

//0041C558
procedure TStringList.Changing;
begin
{*
 0041C558    push        ebx
 0041C559    cmp         dword ptr [eax+8],0
>0041C55D    jne         0041C570
 0041C55F    cmp         word ptr [eax+2A],0
>0041C564    je          0041C570
 0041C566    mov         ebx,eax
 0041C568    mov         edx,eax
 0041C56A    mov         eax,dword ptr [ebx+2C]
 0041C56D    call        dword ptr [ebx+28]
 0041C570    pop         ebx
 0041C571    ret
*}
end;

//0041C574
procedure TStringList.Clear;
begin
{*
 0041C574    push        ebx
 0041C575    mov         ebx,eax
 0041C577    cmp         dword ptr [ebx+14],0
>0041C57B    je          0041C5B0
 0041C57D    mov         eax,ebx
 0041C57F    mov         edx,dword ptr [eax]
 0041C581    call        dword ptr [edx+84]
 0041C587    mov         eax,dword ptr [ebx+10]
 0041C58A    mov         ecx,dword ptr [ebx+14]
 0041C58D    mov         edx,dword ptr ds:[41832C];TStringItem
 0041C593    call        @FinalizeArray
 0041C598    xor         eax,eax
 0041C59A    mov         dword ptr [ebx+14],eax
 0041C59D    xor         edx,edx
 0041C59F    mov         eax,ebx
 0041C5A1    mov         ecx,dword ptr [eax]
 0041C5A3    call        dword ptr [ecx+28]
 0041C5A6    mov         eax,ebx
 0041C5A8    mov         edx,dword ptr [eax]
 0041C5AA    call        dword ptr [edx+80]
 0041C5B0    pop         ebx
 0041C5B1    ret
*}
end;

//0041C5B4
procedure TStringList.Delete(Index:Integer);
begin
{*
 0041C5B4    push        ebx
 0041C5B5    push        esi
 0041C5B6    mov         esi,edx
 0041C5B8    mov         ebx,eax
 0041C5BA    test        esi,esi
>0041C5BC    jl          0041C5C3
 0041C5BE    cmp         esi,dword ptr [ebx+14]
>0041C5C1    jl          0041C5D2
 0041C5C3    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C5C9    mov         ecx,esi
 0041C5CB    mov         eax,ebx
 0041C5CD    call        TStrings.Error
 0041C5D2    mov         eax,ebx
 0041C5D4    mov         edx,dword ptr [eax]
 0041C5D6    call        dword ptr [edx+84]
 0041C5DC    mov         eax,dword ptr [ebx+10]
 0041C5DF    lea         eax,[eax+esi*8]
 0041C5E2    mov         edx,dword ptr ds:[41832C];TStringItem
 0041C5E8    call        @Finalize
 0041C5ED    dec         dword ptr [ebx+14]
 0041C5F0    mov         eax,dword ptr [ebx+14]
 0041C5F3    cmp         esi,eax
>0041C5F5    jge         0041C610
 0041C5F7    sub         eax,esi
 0041C5F9    mov         ecx,eax
 0041C5FB    shl         ecx,3
 0041C5FE    mov         eax,dword ptr [ebx+10]
 0041C601    lea         edx,[eax+esi*8]
 0041C604    mov         eax,dword ptr [ebx+10]
 0041C607    lea         eax,[eax+esi*8+8]
 0041C60B    call        Move
 0041C610    mov         eax,ebx
 0041C612    mov         edx,dword ptr [eax]
 0041C614    call        dword ptr [edx+80]
 0041C61A    pop         esi
 0041C61B    pop         ebx
 0041C61C    ret
*}
end;

//0041C620
procedure TStringList.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 0041C620    push        ebx
 0041C621    push        esi
 0041C622    push        edi
 0041C623    mov         edi,ecx
 0041C625    mov         esi,edx
 0041C627    mov         ebx,eax
 0041C629    test        esi,esi
>0041C62B    jl          0041C632
 0041C62D    cmp         esi,dword ptr [ebx+14]
>0041C630    jl          0041C641
 0041C632    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C638    mov         ecx,esi
 0041C63A    mov         eax,ebx
 0041C63C    call        TStrings.Error
 0041C641    test        edi,edi
>0041C643    jl          0041C64A
 0041C645    cmp         edi,dword ptr [ebx+14]
>0041C648    jl          0041C659
 0041C64A    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C650    mov         ecx,edi
 0041C652    mov         eax,ebx
 0041C654    call        TStrings.Error
 0041C659    mov         eax,ebx
 0041C65B    mov         edx,dword ptr [eax]
 0041C65D    call        dword ptr [edx+84]
 0041C663    mov         ecx,edi
 0041C665    mov         edx,esi
 0041C667    mov         eax,ebx
 0041C669    call        TStringList.ExchangeItems
 0041C66E    mov         eax,ebx
 0041C670    mov         edx,dword ptr [eax]
 0041C672    call        dword ptr [edx+80]
 0041C678    pop         edi
 0041C679    pop         esi
 0041C67A    pop         ebx
 0041C67B    ret
*}
end;

//0041C67C
procedure TStringList.ExchangeItems(Index1:Integer; Index2:Integer);
begin
{*
 0041C67C    push        ebx
 0041C67D    mov         ebx,dword ptr [eax+10]
 0041C680    lea         edx,[ebx+edx*8]
 0041C683    mov         eax,dword ptr [eax+10]
 0041C686    lea         eax,[eax+ecx*8]
 0041C689    mov         ecx,dword ptr [edx]
 0041C68B    mov         ebx,dword ptr [eax]
 0041C68D    mov         dword ptr [edx],ebx
 0041C68F    mov         dword ptr [eax],ecx
 0041C691    mov         ecx,dword ptr [edx+4]
 0041C694    mov         ebx,dword ptr [eax+4]
 0041C697    mov         dword ptr [edx+4],ebx
 0041C69A    mov         dword ptr [eax+4],ecx
 0041C69D    pop         ebx
 0041C69E    ret
*}
end;

//0041C6A0
function TStringList.Find(const S:AnsiString; var Index:Integer):Boolean;
begin
{*
 0041C6A0    push        ebx
 0041C6A1    push        esi
 0041C6A2    push        edi
 0041C6A3    push        ebp
 0041C6A4    add         esp,0FFFFFFF0
 0041C6A7    mov         dword ptr [esp+4],ecx
 0041C6AB    mov         dword ptr [esp],edx
 0041C6AE    mov         edi,eax
 0041C6B0    mov         byte ptr [esp+8],0
 0041C6B5    xor         esi,esi
 0041C6B7    mov         eax,dword ptr [edi+14]
 0041C6BA    dec         eax
 0041C6BB    mov         dword ptr [esp+0C],eax
 0041C6BF    cmp         esi,dword ptr [esp+0C]
>0041C6C3    jg          0041C704
 0041C6C5    mov         ebx,dword ptr [esp+0C]
 0041C6C9    add         ebx,esi
 0041C6CB    shr         ebx,1
 0041C6CD    mov         eax,dword ptr [edi+10]
 0041C6D0    mov         edx,dword ptr [eax+ebx*8]
 0041C6D3    mov         ecx,dword ptr [esp]
 0041C6D6    mov         eax,edi
 0041C6D8    mov         ebp,dword ptr [eax]
 0041C6DA    call        dword ptr [ebp+34]
 0041C6DD    test        eax,eax
>0041C6DF    jge         0041C6E6
 0041C6E1    lea         esi,[ebx+1]
>0041C6E4    jmp         0041C6FE
 0041C6E6    mov         edx,ebx
 0041C6E8    dec         edx
 0041C6E9    mov         dword ptr [esp+0C],edx
 0041C6ED    test        eax,eax
>0041C6EF    jne         0041C6FE
 0041C6F1    mov         byte ptr [esp+8],1
 0041C6F6    cmp         byte ptr [edi+1D],1
>0041C6FA    je          0041C6FE
 0041C6FC    mov         esi,ebx
 0041C6FE    cmp         esi,dword ptr [esp+0C]
>0041C702    jle         0041C6C5
 0041C704    mov         eax,dword ptr [esp+4]
 0041C708    mov         dword ptr [eax],esi
 0041C70A    mov         al,byte ptr [esp+8]
 0041C70E    add         esp,10
 0041C711    pop         ebp
 0041C712    pop         edi
 0041C713    pop         esi
 0041C714    pop         ebx
 0041C715    ret
*}
end;

//0041C718
function TStringList.Get(Index:Integer):AnsiString;
begin
{*
 0041C718    push        ebx
 0041C719    push        esi
 0041C71A    push        edi
 0041C71B    mov         edi,ecx
 0041C71D    mov         esi,edx
 0041C71F    mov         ebx,eax
 0041C721    test        esi,esi
>0041C723    jl          0041C72A
 0041C725    cmp         esi,dword ptr [ebx+14]
>0041C728    jl          0041C739
 0041C72A    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C730    mov         ecx,esi
 0041C732    mov         eax,ebx
 0041C734    call        TStrings.Error
 0041C739    mov         eax,edi
 0041C73B    mov         edx,dword ptr [ebx+10]
 0041C73E    mov         edx,dword ptr [edx+esi*8]
 0041C741    call        @LStrAsg
 0041C746    pop         edi
 0041C747    pop         esi
 0041C748    pop         ebx
 0041C749    ret
*}
end;

//0041C74C
{*function sub_0041C74C:?;
begin
 0041C74C    mov         eax,dword ptr [eax+18];TStringList.FCapacity:Integer
 0041C74F    ret
end;*}

//0041C750
{*function sub_0041C750:?;
begin
 0041C750    mov         eax,dword ptr [eax+14];TStringList.FCount:Integer
 0041C753    ret
end;*}

//0041C754
function TStringList.GetObject(Index:Integer):TObject;
begin
{*
 0041C754    push        ebx
 0041C755    push        esi
 0041C756    mov         esi,edx
 0041C758    mov         ebx,eax
 0041C75A    test        esi,esi
>0041C75C    jl          0041C763
 0041C75E    cmp         esi,dword ptr [ebx+14]
>0041C761    jl          0041C772
 0041C763    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C769    mov         ecx,esi
 0041C76B    mov         eax,ebx
 0041C76D    call        TStrings.Error
 0041C772    mov         eax,dword ptr [ebx+10]
 0041C775    mov         eax,dword ptr [eax+esi*8+4]
 0041C779    pop         esi
 0041C77A    pop         ebx
 0041C77B    ret
*}
end;

//0041C77C
procedure TStringList.Grow;
begin
{*
 0041C77C    push        esi
 0041C77D    mov         edx,dword ptr [eax+18]
 0041C780    cmp         edx,40
>0041C783    jle         0041C793
 0041C785    mov         esi,edx
 0041C787    test        esi,esi
>0041C789    jns         0041C78E
 0041C78B    add         esi,3
 0041C78E    sar         esi,2
>0041C791    jmp         0041C7A4
 0041C793    cmp         edx,8
>0041C796    jle         0041C79F
 0041C798    mov         esi,10
>0041C79D    jmp         0041C7A4
 0041C79F    mov         esi,4
 0041C7A4    add         esi,edx
 0041C7A6    mov         edx,esi
 0041C7A8    mov         ecx,dword ptr [eax]
 0041C7AA    call        dword ptr [ecx+28]
 0041C7AD    pop         esi
 0041C7AE    ret
*}
end;

//0041C7B0
function TStringList.IndexOf(const S:AnsiString):Integer;
begin
{*
 0041C7B0    push        ebx
 0041C7B1    push        esi
 0041C7B2    push        ecx
 0041C7B3    mov         esi,edx
 0041C7B5    mov         ebx,eax
 0041C7B7    cmp         byte ptr [ebx+1C],0
>0041C7BB    jne         0041C7CB
 0041C7BD    mov         edx,esi
 0041C7BF    mov         eax,ebx
 0041C7C1    call        TStrings.IndexOf
 0041C7C6    mov         dword ptr [esp],eax
>0041C7C9    jmp         0041C7E4
 0041C7CB    mov         ecx,esp
 0041C7CD    mov         edx,esi
 0041C7CF    mov         eax,ebx
 0041C7D1    mov         ebx,dword ptr [eax]
 0041C7D3    call        dword ptr [ebx+8C]
 0041C7D9    test        al,al
>0041C7DB    jne         0041C7E4
 0041C7DD    mov         dword ptr [esp],0FFFFFFFF
 0041C7E4    mov         eax,dword ptr [esp]
 0041C7E7    pop         edx
 0041C7E8    pop         esi
 0041C7E9    pop         ebx
 0041C7EA    ret
*}
end;

//0041C7EC
procedure TStringList.Insert(Index:Integer; const S:AnsiString);
begin
{*
 0041C7EC    push        ebx
 0041C7ED    push        esi
 0041C7EE    mov         esi,eax
 0041C7F0    push        0
 0041C7F2    mov         eax,esi
 0041C7F4    mov         ebx,dword ptr [eax]
 0041C7F6    call        dword ptr [ebx+64]
 0041C7F9    pop         esi
 0041C7FA    pop         ebx
 0041C7FB    ret
*}
end;

//0041C7FC
procedure TStringList.InsertObject(Index:Integer; const S:AnsiString; AObject:TObject);
begin
{*
 0041C7FC    push        ebp
 0041C7FD    mov         ebp,esp
 0041C7FF    push        ebx
 0041C800    push        esi
 0041C801    push        edi
 0041C802    mov         edi,ecx
 0041C804    mov         esi,edx
 0041C806    mov         ebx,eax
 0041C808    cmp         byte ptr [ebx+1C],0
>0041C80C    je          0041C81D
 0041C80E    mov         edx,dword ptr ds:[5AE3D0];^SSortedListError:TResStringRec
 0041C814    xor         ecx,ecx
 0041C816    mov         eax,ebx
 0041C818    call        TStrings.Error
 0041C81D    test        esi,esi
>0041C81F    jl          0041C826
 0041C821    cmp         esi,dword ptr [ebx+14]
>0041C824    jle         0041C835
 0041C826    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C82C    mov         ecx,esi
 0041C82E    mov         eax,ebx
 0041C830    call        TStrings.Error
 0041C835    mov         eax,dword ptr [ebp+8]
 0041C838    push        eax
 0041C839    mov         ecx,edi
 0041C83B    mov         edx,esi
 0041C83D    mov         eax,ebx
 0041C83F    mov         ebx,dword ptr [eax]
 0041C841    call        dword ptr [ebx+88]
 0041C847    pop         edi
 0041C848    pop         esi
 0041C849    pop         ebx
 0041C84A    pop         ebp
 0041C84B    ret         4
*}
end;

//0041C850
procedure TStringList.InsertItem(Index:Integer; const S:AnsiString; AObject:TObject);
begin
{*
 0041C850    push        ebp
 0041C851    mov         ebp,esp
 0041C853    push        ebx
 0041C854    push        esi
 0041C855    push        edi
 0041C856    mov         edi,ecx
 0041C858    mov         esi,edx
 0041C85A    mov         ebx,eax
 0041C85C    mov         eax,ebx
 0041C85E    mov         edx,dword ptr [eax]
 0041C860    call        dword ptr [edx+84]
 0041C866    mov         eax,dword ptr [ebx+14]
 0041C869    cmp         eax,dword ptr [ebx+18]
>0041C86C    jne         0041C875
 0041C86E    mov         eax,ebx
 0041C870    call        TStringList.Grow
 0041C875    mov         eax,dword ptr [ebx+14]
 0041C878    cmp         esi,eax
>0041C87A    jge         0041C899
 0041C87C    mov         edx,dword ptr [ebx+10]
 0041C87F    lea         edx,[edx+esi*8+8]
 0041C883    push        edx
 0041C884    mov         edx,dword ptr [ebx+10]
 0041C887    lea         edx,[edx+esi*8]
 0041C88A    sub         eax,esi
 0041C88C    mov         ecx,eax
 0041C88E    shl         ecx,3
 0041C891    mov         eax,edx
 0041C893    pop         edx
 0041C894    call        Move
 0041C899    mov         eax,dword ptr [ebx+10]
 0041C89C    lea         eax,[eax+esi*8]
 0041C89F    mov         esi,eax
 0041C8A1    xor         eax,eax
 0041C8A3    mov         dword ptr [esi],eax
 0041C8A5    mov         eax,dword ptr [ebp+8]
 0041C8A8    mov         dword ptr [esi+4],eax
 0041C8AB    mov         eax,esi
 0041C8AD    mov         edx,edi
 0041C8AF    call        @LStrAsg
 0041C8B4    inc         dword ptr [ebx+14]
 0041C8B7    mov         eax,ebx
 0041C8B9    mov         edx,dword ptr [eax]
 0041C8BB    call        dword ptr [edx+80]
 0041C8C1    pop         edi
 0041C8C2    pop         esi
 0041C8C3    pop         ebx
 0041C8C4    pop         ebp
 0041C8C5    ret         4
*}
end;

//0041C8C8
procedure TStringList.Put(Index:Integer; const S:AnsiString);
begin
{*
 0041C8C8    push        ebx
 0041C8C9    push        esi
 0041C8CA    push        edi
 0041C8CB    mov         edi,ecx
 0041C8CD    mov         esi,edx
 0041C8CF    mov         ebx,eax
 0041C8D1    cmp         byte ptr [ebx+1C],0
>0041C8D5    je          0041C8E6
 0041C8D7    mov         edx,dword ptr ds:[5AE3D0];^SSortedListError:TResStringRec
 0041C8DD    xor         ecx,ecx
 0041C8DF    mov         eax,ebx
 0041C8E1    call        TStrings.Error
 0041C8E6    test        esi,esi
>0041C8E8    jl          0041C8EF
 0041C8EA    cmp         esi,dword ptr [ebx+14]
>0041C8ED    jl          0041C8FE
 0041C8EF    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C8F5    mov         ecx,esi
 0041C8F7    mov         eax,ebx
 0041C8F9    call        TStrings.Error
 0041C8FE    mov         eax,ebx
 0041C900    mov         edx,dword ptr [eax]
 0041C902    call        dword ptr [edx+84]
 0041C908    mov         eax,dword ptr [ebx+10]
 0041C90B    lea         eax,[eax+esi*8]
 0041C90E    mov         edx,edi
 0041C910    call        @LStrAsg
 0041C915    mov         eax,ebx
 0041C917    mov         edx,dword ptr [eax]
 0041C919    call        dword ptr [edx+80]
 0041C91F    pop         edi
 0041C920    pop         esi
 0041C921    pop         ebx
 0041C922    ret
*}
end;

//0041C924
procedure TStringList.PutObject(Index:Integer; AObject:TObject);
begin
{*
 0041C924    push        ebx
 0041C925    push        esi
 0041C926    push        edi
 0041C927    mov         edi,ecx
 0041C929    mov         esi,edx
 0041C92B    mov         ebx,eax
 0041C92D    test        esi,esi
>0041C92F    jl          0041C936
 0041C931    cmp         esi,dword ptr [ebx+14]
>0041C934    jl          0041C945
 0041C936    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 0041C93C    mov         ecx,esi
 0041C93E    mov         eax,ebx
 0041C940    call        TStrings.Error
 0041C945    mov         eax,ebx
 0041C947    mov         edx,dword ptr [eax]
 0041C949    call        dword ptr [edx+84]
 0041C94F    mov         eax,dword ptr [ebx+10]
 0041C952    mov         dword ptr [eax+esi*8+4],edi
 0041C956    mov         eax,ebx
 0041C958    mov         edx,dword ptr [eax]
 0041C95A    call        dword ptr [edx+80]
 0041C960    pop         edi
 0041C961    pop         esi
 0041C962    pop         ebx
 0041C963    ret
*}
end;

//0041C964
procedure TStringList.QuickSort(L:Integer; R:Integer; SCompare:TStringListSortCompare);
begin
{*
 0041C964    push        ebp
 0041C965    mov         ebp,esp
 0041C967    add         esp,0FFFFFFF0
 0041C96A    push        ebx
 0041C96B    push        esi
 0041C96C    mov         dword ptr [ebp-0C],ecx
 0041C96F    mov         dword ptr [ebp-8],edx
 0041C972    mov         dword ptr [ebp-4],eax
 0041C975    mov         ebx,dword ptr [ebp-8]
 0041C978    mov         esi,dword ptr [ebp-0C]
 0041C97B    mov         eax,dword ptr [ebp-8]
 0041C97E    add         eax,dword ptr [ebp-0C]
 0041C981    shr         eax,1
 0041C983    mov         dword ptr [ebp-10],eax
>0041C986    jmp         0041C989
 0041C988    inc         ebx
 0041C989    mov         ecx,dword ptr [ebp-10]
 0041C98C    mov         edx,ebx
 0041C98E    mov         eax,dword ptr [ebp-4]
 0041C991    call        dword ptr [ebp+8]
 0041C994    test        eax,eax
>0041C996    jl          0041C988
>0041C998    jmp         0041C99B
 0041C99A    dec         esi
 0041C99B    mov         ecx,dword ptr [ebp-10]
 0041C99E    mov         edx,esi
 0041C9A0    mov         eax,dword ptr [ebp-4]
 0041C9A3    call        dword ptr [ebp+8]
 0041C9A6    test        eax,eax
>0041C9A8    jg          0041C99A
 0041C9AA    cmp         esi,ebx
>0041C9AC    jl          0041C9CE
 0041C9AE    mov         ecx,esi
 0041C9B0    mov         edx,ebx
 0041C9B2    mov         eax,dword ptr [ebp-4]
 0041C9B5    call        TStringList.ExchangeItems
 0041C9BA    cmp         ebx,dword ptr [ebp-10]
>0041C9BD    jne         0041C9C4
 0041C9BF    mov         dword ptr [ebp-10],esi
>0041C9C2    jmp         0041C9CC
 0041C9C4    cmp         esi,dword ptr [ebp-10]
>0041C9C7    jne         0041C9CC
 0041C9C9    mov         dword ptr [ebp-10],ebx
 0041C9CC    inc         ebx
 0041C9CD    dec         esi
 0041C9CE    cmp         esi,ebx
>0041C9D0    jge         0041C989
 0041C9D2    cmp         esi,dword ptr [ebp-8]
>0041C9D5    jle         0041C9E8
 0041C9D7    mov         eax,dword ptr [ebp+8]
 0041C9DA    push        eax
 0041C9DB    mov         ecx,esi
 0041C9DD    mov         edx,dword ptr [ebp-8]
 0041C9E0    mov         eax,dword ptr [ebp-4]
 0041C9E3    call        TStringList.QuickSort
 0041C9E8    mov         dword ptr [ebp-8],ebx
 0041C9EB    cmp         ebx,dword ptr [ebp-0C]
>0041C9EE    jl          0041C975
 0041C9F0    pop         esi
 0041C9F1    pop         ebx
 0041C9F2    mov         esp,ebp
 0041C9F4    pop         ebp
 0041C9F5    ret         4
*}
end;

//0041C9F8
procedure TStringList.SetCapacity(NewCapacity:Integer);
begin
{*
 0041C9F8    push        ebx
 0041C9F9    push        esi
 0041C9FA    mov         esi,edx
 0041C9FC    mov         ebx,eax
 0041C9FE    mov         edx,esi
 0041CA00    shl         edx,3
 0041CA03    lea         eax,[ebx+10]
 0041CA06    call        @ReallocMem
 0041CA0B    mov         dword ptr [ebx+18],esi
 0041CA0E    pop         esi
 0041CA0F    pop         ebx
 0041CA10    ret
*}
end;

//0041CA14
procedure TStringList.SetSorted(Value:Boolean);
begin
{*
 0041CA14    push        ebx
 0041CA15    push        esi
 0041CA16    mov         ebx,edx
 0041CA18    mov         esi,eax
 0041CA1A    cmp         bl,byte ptr [esi+1C]
>0041CA1D    je          0041CA30
 0041CA1F    test        bl,bl
>0041CA21    je          0041CA2D
 0041CA23    mov         eax,esi
 0041CA25    mov         edx,dword ptr [eax]
 0041CA27    call        dword ptr [edx+90]
 0041CA2D    mov         byte ptr [esi+1C],bl
 0041CA30    pop         esi
 0041CA31    pop         ebx
 0041CA32    ret
*}
end;

//0041CA34
procedure TStringList.SetUpdateState(Updating:Boolean);
begin
{*
 0041CA34    test        dl,dl
>0041CA36    je          0041CA41
 0041CA38    mov         edx,dword ptr [eax]
 0041CA3A    call        dword ptr [edx+84]
 0041CA40    ret
 0041CA41    mov         edx,dword ptr [eax]
 0041CA43    call        dword ptr [edx+80]
 0041CA49    ret
*}
end;

//0041CA4C
function StringListCompareStrings(List:TStringList; Index1:Integer; Index2:Integer):Integer;
begin
{*
 0041CA4C    push        ebx
 0041CA4D    mov         ebx,dword ptr [eax+10]
 0041CA50    mov         ecx,dword ptr [ebx+ecx*8]
 0041CA53    mov         ebx,dword ptr [eax+10]
 0041CA56    mov         edx,dword ptr [ebx+edx*8]
 0041CA59    mov         ebx,dword ptr [eax]
 0041CA5B    call        dword ptr [ebx+34]
 0041CA5E    pop         ebx
 0041CA5F    ret
*}
end;

//0041CA60
procedure TStringList.Sort;
begin
{*
 0041CA60    mov         edx,41CA4C;StringListCompareStrings:Integer
 0041CA65    mov         ecx,dword ptr [eax]
 0041CA67    call        dword ptr [ecx+94]
 0041CA6D    ret
*}
end;

//0041CA70
procedure TStringList.CustomSort(Compare:TStringListSortCompare);
begin
{*
 0041CA70    push        ebx
 0041CA71    push        esi
 0041CA72    mov         esi,edx
 0041CA74    mov         ebx,eax
 0041CA76    cmp         byte ptr [ebx+1C],0
>0041CA7A    jne         0041CAA4
 0041CA7C    cmp         dword ptr [ebx+14],1
>0041CA80    jle         0041CAA4
 0041CA82    mov         eax,ebx
 0041CA84    mov         edx,dword ptr [eax]
 0041CA86    call        dword ptr [edx+84]
 0041CA8C    push        esi
 0041CA8D    mov         ecx,dword ptr [ebx+14]
 0041CA90    dec         ecx
 0041CA91    xor         edx,edx
 0041CA93    mov         eax,ebx
 0041CA95    call        TStringList.QuickSort
 0041CA9A    mov         eax,ebx
 0041CA9C    mov         edx,dword ptr [eax]
 0041CA9E    call        dword ptr [edx+80]
 0041CAA4    pop         esi
 0041CAA5    pop         ebx
 0041CAA6    ret
*}
end;

//0041CAA8
function TStringList.CompareStrings(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 0041CAA8    cmp         byte ptr [eax+1E],0
>0041CAAC    je          0041CAB8
 0041CAAE    mov         eax,edx
 0041CAB0    mov         edx,ecx
 0041CAB2    call        AnsiCompareStr
 0041CAB7    ret
 0041CAB8    mov         eax,edx
 0041CABA    mov         edx,ecx
 0041CABC    call        AnsiCompareText
 0041CAC1    ret
*}
end;

//0041CAC4
function TStream.GetPosition:Int64;
begin
{*
 0041CAC4    add         esp,0FFFFFFF8
 0041CAC7    push        0
 0041CAC9    push        0
 0041CACB    mov         dl,1
 0041CACD    mov         ecx,dword ptr [eax]
 0041CACF    call        dword ptr [ecx+18]
 0041CAD2    mov         dword ptr [esp],eax
 0041CAD5    mov         dword ptr [esp+4],edx
 0041CAD9    mov         eax,dword ptr [esp]
 0041CADC    mov         edx,dword ptr [esp+4]
 0041CAE0    pop         ecx
 0041CAE1    pop         edx
 0041CAE2    ret
*}
end;

//0041CAE4
procedure TStream.SetPosition(const Pos:Int64);
begin
{*
 0041CAE4    push        ebp
 0041CAE5    mov         ebp,esp
 0041CAE7    push        dword ptr [ebp+0C]
 0041CAEA    push        dword ptr [ebp+8]
 0041CAED    xor         edx,edx
 0041CAEF    mov         ecx,dword ptr [eax]
 0041CAF1    call        dword ptr [ecx+18]
 0041CAF4    pop         ebp
 0041CAF5    ret         8
*}
end;

//0041CAF8
function TStream.GetSize:Int64;
begin
{*
 0041CAF8    push        ebx
 0041CAF9    add         esp,0FFFFFFF0
 0041CAFC    mov         ebx,eax
 0041CAFE    push        0
 0041CB00    push        0
 0041CB02    mov         dl,1
 0041CB04    mov         eax,ebx
 0041CB06    mov         ecx,dword ptr [eax]
 0041CB08    call        dword ptr [ecx+18]
 0041CB0B    mov         dword ptr [esp+8],eax
 0041CB0F    mov         dword ptr [esp+0C],edx
 0041CB13    push        0
 0041CB15    push        0
 0041CB17    mov         dl,2
 0041CB19    mov         eax,ebx
 0041CB1B    mov         ecx,dword ptr [eax]
 0041CB1D    call        dword ptr [ecx+18]
 0041CB20    mov         dword ptr [esp],eax
 0041CB23    mov         dword ptr [esp+4],edx
 0041CB27    push        dword ptr [esp+0C]
 0041CB2B    push        dword ptr [esp+0C]
 0041CB2F    xor         edx,edx
 0041CB31    mov         eax,ebx
 0041CB33    mov         ecx,dword ptr [eax]
 0041CB35    call        dword ptr [ecx+18]
 0041CB38    mov         eax,dword ptr [esp]
 0041CB3B    mov         edx,dword ptr [esp+4]
 0041CB3F    add         esp,10
 0041CB42    pop         ebx
 0041CB43    ret
*}
end;

//0041CB44
procedure sub_0041CB44;
begin
{*
 0041CB44    ret
*}
end;

//0041CB48
procedure TStream.SetSize64(const NewSize:Int64);
begin
{*
 0041CB48    push        ebp
 0041CB49    mov         ebp,esp
 0041CB4B    push        dword ptr [ebp+0C]
 0041CB4E    push        dword ptr [ebp+8]
 0041CB51    mov         edx,dword ptr [eax]
 0041CB53    call        dword ptr [edx+8]
 0041CB56    pop         ebp
 0041CB57    ret         8
*}
end;

//0041CB5C
procedure TStream.SetSize(const NewSize:Int64);
begin
{*
 0041CB5C    push        ebp
 0041CB5D    mov         ebp,esp
 0041CB5F    mov         ecx,eax
 0041CB61    cmp         dword ptr [ebp+0C],0FFFFFFFF
>0041CB65    jne         0041CB72
 0041CB67    cmp         dword ptr [ebp+8],80000000
>0041CB6E    jb          0041CB87
>0041CB70    jmp         0041CB74
>0041CB72    jl          0041CB87
 0041CB74    cmp         dword ptr [ebp+0C],0
>0041CB78    jne         0041CB85
 0041CB7A    cmp         dword ptr [ebp+8],7FFFFFFF
>0041CB81    jbe         0041CB9E
>0041CB83    jmp         0041CB87
>0041CB85    jle         0041CB9E
 0041CB87    mov         ecx,dword ptr ds:[5AE718];^SRangeError:TResStringRec
 0041CB8D    mov         dl,1
 0041CB8F    mov         eax,[00408E64]
 0041CB94    call        Exception.CreateRes
 0041CB99    call        @RaiseExcept
 0041CB9E    mov         eax,dword ptr [ebp+8]
 0041CBA1    mov         edx,eax
 0041CBA3    mov         eax,ecx
 0041CBA5    mov         ecx,dword ptr [eax]
 0041CBA7    call        dword ptr [ecx+4]
 0041CBAA    pop         ebp
 0041CBAB    ret         8
*}
end;

//0041CBB0
procedure RaiseException;
begin
{*
 0041CBB0    push        ebp
 0041CBB1    mov         ebp,esp
 0041CBB3    add         esp,0FFFFFEF8
 0041CBB9    lea         edx,[ebp-108]
 0041CBBF    mov         eax,dword ptr [ebp+8]
 0041CBC2    mov         eax,dword ptr [eax-4]
 0041CBC5    mov         eax,dword ptr [eax]
 0041CBC7    call        TObject.ClassName
 0041CBCC    lea         eax,[ebp-108]
 0041CBD2    mov         dword ptr [ebp-8],eax
 0041CBD5    mov         byte ptr [ebp-4],4
 0041CBD9    lea         eax,[ebp-8]
 0041CBDC    push        eax
 0041CBDD    push        0
 0041CBDF    mov         ecx,dword ptr ds:[5AE77C];^SSeekNotImplemented:TResStringRec
 0041CBE5    mov         dl,1
 0041CBE7    mov         eax,[00417794];EStreamError
 0041CBEC    call        Exception.CreateResFmt
 0041CBF1    call        @RaiseExcept
 0041CBF6    mov         esp,ebp
 0041CBF8    pop         ebp
 0041CBF9    ret
*}
end;

//0041CBFC
function TStream.Seek(Offset:Longint; Origin:Word):Longint;
begin
{*
 0041CBFC    push        ebp
 0041CBFD    mov         ebp,esp
 0041CBFF    add         esp,0FFFFFFE0
 0041CC02    push        ebx
 0041CC03    push        esi
 0041CC04    mov         word ptr [ebp-1A],cx
 0041CC08    mov         esi,edx
 0041CC0A    mov         dword ptr [ebp-4],eax
 0041CC0D    lea         ebx,[ebp-20]
 0041CC10    mov         eax,dword ptr [ebp-4]
 0041CC13    mov         dword ptr [ebp-0C],eax
 0041CC16    mov         eax,dword ptr [eax]
 0041CC18    mov         eax,dword ptr [eax+18]
 0041CC1B    mov         dword ptr [ebp-10],eax
 0041CC1E    mov         eax,dword ptr [ebp-4]
 0041CC21    call        TObject.ClassType
 0041CC26    mov         dword ptr [ebx],eax
>0041CC28    jmp         0041CC33
 0041CC2A    mov         eax,dword ptr [ebx]
 0041CC2C    call        TObject.ClassParent
 0041CC31    mov         dword ptr [ebx],eax
 0041CC33    cmp         dword ptr [ebx],0
>0041CC36    je          0041CC42
 0041CC38    mov         eax,dword ptr [ebx]
 0041CC3A    cmp         eax,dword ptr ds:[418468];TStream
>0041CC40    jne         0041CC2A
 0041CC42    cmp         dword ptr [ebx],0
>0041CC45    jne         0041CC4E
 0041CC47    push        ebp
 0041CC48    call        RaiseException
 0041CC4D    pop         ecx
 0041CC4E    mov         dword ptr [ebp-14],ebx
 0041CC51    mov         eax,dword ptr [ebx]
 0041CC53    mov         eax,dword ptr [eax+18]
 0041CC56    mov         dword ptr [ebp-18],eax
 0041CC59    mov         eax,dword ptr [ebp-10]
 0041CC5C    cmp         eax,dword ptr [ebp-18]
>0041CC5F    jne         0041CC68
 0041CC61    push        ebp
 0041CC62    call        RaiseException
 0041CC67    pop         ecx
 0041CC68    mov         eax,esi
 0041CC6A    cdq
 0041CC6B    push        edx
 0041CC6C    push        eax
 0041CC6D    mov         dl,byte ptr [ebp-1A]
 0041CC70    mov         eax,dword ptr [ebp-4]
 0041CC73    mov         ecx,dword ptr [eax]
 0041CC75    call        dword ptr [ecx+18]
 0041CC78    pop         esi
 0041CC79    pop         ebx
 0041CC7A    mov         esp,ebp
 0041CC7C    pop         ebp
 0041CC7D    ret
*}
end;

//0041CC80
function TStream.Seek(Origin:TSeekOrigin; const Offset:Int64):Int64;
begin
{*
 0041CC80    push        ebp
 0041CC81    mov         ebp,esp
 0041CC83    add         esp,0FFFFFFF8
 0041CC86    push        ebx
 0041CC87    push        esi
 0041CC88    mov         ebx,edx
 0041CC8A    mov         esi,eax
 0041CC8C    cmp         dword ptr [ebp+0C],0FFFFFFFF
>0041CC90    jne         0041CC9D
 0041CC92    cmp         dword ptr [ebp+8],80000000
>0041CC99    jb          0041CCB2
>0041CC9B    jmp         0041CC9F
>0041CC9D    jl          0041CCB2
 0041CC9F    cmp         dword ptr [ebp+0C],0
>0041CCA3    jne         0041CCB0
 0041CCA5    cmp         dword ptr [ebp+8],7FFFFFFF
>0041CCAC    jbe         0041CCC9
>0041CCAE    jmp         0041CCB2
>0041CCB0    jle         0041CCC9
 0041CCB2    mov         ecx,dword ptr ds:[5AE718];^SRangeError:TResStringRec
 0041CCB8    mov         dl,1
 0041CCBA    mov         eax,[00408E64]
 0041CCBF    call        Exception.CreateRes
 0041CCC4    call        @RaiseExcept
 0041CCC9    mov         eax,dword ptr [ebp+8]
 0041CCCC    mov         edx,eax
 0041CCCE    xor         ecx,ecx
 0041CCD0    mov         cl,bl
 0041CCD2    mov         eax,esi
 0041CCD4    mov         ebx,dword ptr [eax]
 0041CCD6    call        dword ptr [ebx+14]
 0041CCD9    cdq
 0041CCDA    mov         dword ptr [ebp-8],eax
 0041CCDD    mov         dword ptr [ebp-4],edx
 0041CCE0    mov         eax,dword ptr [ebp-8]
 0041CCE3    mov         edx,dword ptr [ebp-4]
 0041CCE6    pop         esi
 0041CCE7    pop         ebx
 0041CCE8    pop         ecx
 0041CCE9    pop         ecx
 0041CCEA    pop         ebp
 0041CCEB    ret         8
*}
end;

//0041CCF0
procedure TStream.ReadBuffer(var Buffer:void ; Count:Longint);
begin
{*
 0041CCF0    push        ebx
 0041CCF1    push        esi
 0041CCF2    push        edi
 0041CCF3    mov         ebx,ecx
 0041CCF5    mov         edi,edx
 0041CCF7    mov         esi,eax
 0041CCF9    test        ebx,ebx
>0041CCFB    je          0041CD23
 0041CCFD    mov         edx,edi
 0041CCFF    mov         ecx,ebx
 0041CD01    mov         eax,esi
 0041CD03    mov         esi,dword ptr [eax]
 0041CD05    call        dword ptr [esi+0C]
 0041CD08    cmp         ebx,eax
>0041CD0A    je          0041CD23
 0041CD0C    mov         ecx,dword ptr ds:[5AE708];^SReadError:TResStringRec
 0041CD12    mov         dl,1
 0041CD14    mov         eax,[0041795C];EReadError
 0041CD19    call        Exception.CreateRes
 0041CD1E    call        @RaiseExcept
 0041CD23    pop         edi
 0041CD24    pop         esi
 0041CD25    pop         ebx
 0041CD26    ret
*}
end;

//0041CD28
procedure TStream.WriteBuffer(const Buffer:void ; Count:Longint);
begin
{*
 0041CD28    push        ebx
 0041CD29    push        esi
 0041CD2A    push        edi
 0041CD2B    mov         ebx,ecx
 0041CD2D    mov         edi,edx
 0041CD2F    mov         esi,eax
 0041CD31    test        ebx,ebx
>0041CD33    je          0041CD5B
 0041CD35    mov         edx,edi
 0041CD37    mov         ecx,ebx
 0041CD39    mov         eax,esi
 0041CD3B    mov         esi,dword ptr [eax]
 0041CD3D    call        dword ptr [esi+10]
 0041CD40    cmp         ebx,eax
>0041CD42    je          0041CD5B
 0041CD44    mov         ecx,dword ptr ds:[5AE49C];^SWriteError:TResStringRec
 0041CD4A    mov         dl,1
 0041CD4C    mov         eax,[004179B4];EWriteError
 0041CD51    call        Exception.CreateRes
 0041CD56    call        @RaiseExcept
 0041CD5B    pop         edi
 0041CD5C    pop         esi
 0041CD5D    pop         ebx
 0041CD5E    ret
*}
end;

//0041CD60
function TStream.CopyFrom(Source:TStream; Count:Int64):Int64;
begin
{*
 0041CD60    push        ebp
 0041CD61    mov         ebp,esp
 0041CD63    add         esp,0FFFFFFE8
 0041CD66    push        ebx
 0041CD67    push        esi
 0041CD68    push        edi
 0041CD69    mov         edi,edx
 0041CD6B    mov         dword ptr [ebp-4],eax
 0041CD6E    cmp         dword ptr [ebp+0C],0
>0041CD72    jne         0041CD91
 0041CD74    cmp         dword ptr [ebp+8],0
>0041CD78    jne         0041CD91
 0041CD7A    push        0
 0041CD7C    push        0
 0041CD7E    mov         eax,edi
 0041CD80    call        TStream.SetPosition
 0041CD85    mov         eax,edi
 0041CD87    mov         edx,dword ptr [eax]
 0041CD89    call        dword ptr [edx]
 0041CD8B    mov         dword ptr [ebp+8],eax
 0041CD8E    mov         dword ptr [ebp+0C],edx
 0041CD91    mov         eax,dword ptr [ebp+8]
 0041CD94    mov         dword ptr [ebp-10],eax
 0041CD97    mov         eax,dword ptr [ebp+0C]
 0041CD9A    mov         dword ptr [ebp-0C],eax
 0041CD9D    cmp         dword ptr [ebp+0C],0
>0041CDA1    jne         0041CDAE
 0041CDA3    cmp         dword ptr [ebp+8],0F000
>0041CDAA    jbe         0041CDB9
>0041CDAC    jmp         0041CDB0
>0041CDAE    jle         0041CDB9
 0041CDB0    mov         dword ptr [ebp-14],0F000
>0041CDB7    jmp         0041CDBF
 0041CDB9    mov         eax,dword ptr [ebp+8]
 0041CDBC    mov         dword ptr [ebp-14],eax
 0041CDBF    mov         eax,dword ptr [ebp-14]
 0041CDC2    call        @GetMem
 0041CDC7    mov         dword ptr [ebp-18],eax
 0041CDCA    xor         eax,eax
 0041CDCC    push        ebp
 0041CDCD    push        41CE3C
 0041CDD2    push        dword ptr fs:[eax]
 0041CDD5    mov         dword ptr fs:[eax],esp
>0041CDD8    jmp         0041CE17
 0041CDDA    mov         eax,dword ptr [ebp-14]
 0041CDDD    cdq
 0041CDDE    cmp         edx,dword ptr [ebp+0C]
>0041CDE1    jne         0041CDEA
 0041CDE3    cmp         eax,dword ptr [ebp+8]
>0041CDE6    jae         0041CDF1
>0041CDE8    jmp         0041CDEC
>0041CDEA    jge         0041CDF1
 0041CDEC    mov         ebx,dword ptr [ebp-14]
>0041CDEF    jmp         0041CDF4
 0041CDF1    mov         ebx,dword ptr [ebp+8]
 0041CDF4    mov         esi,dword ptr [ebp-18]
 0041CDF7    mov         edx,esi
 0041CDF9    mov         ecx,ebx
 0041CDFB    mov         eax,edi
 0041CDFD    call        TStream.ReadBuffer
 0041CE02    mov         edx,esi
 0041CE04    mov         ecx,ebx
 0041CE06    mov         eax,dword ptr [ebp-4]
 0041CE09    call        TStream.WriteBuffer
 0041CE0E    mov         eax,ebx
 0041CE10    cdq
 0041CE11    sub         dword ptr [ebp+8],eax
 0041CE14    sbb         dword ptr [ebp+0C],edx
 0041CE17    cmp         dword ptr [ebp+0C],0
>0041CE1B    jne         0041CDDA
 0041CE1D    cmp         dword ptr [ebp+8],0
>0041CE21    jne         0041CDDA
 0041CE23    xor         eax,eax
 0041CE25    pop         edx
 0041CE26    pop         ecx
 0041CE27    pop         ecx
 0041CE28    mov         dword ptr fs:[eax],edx
 0041CE2B    push        41CE43
 0041CE30    mov         edx,dword ptr [ebp-14]
 0041CE33    mov         eax,dword ptr [ebp-18]
 0041CE36    call        @FreeMem
 0041CE3B    ret
>0041CE3C    jmp         @HandleFinally
>0041CE41    jmp         0041CE30
 0041CE43    mov         eax,dword ptr [ebp-10]
 0041CE46    mov         edx,dword ptr [ebp-0C]
 0041CE49    pop         edi
 0041CE4A    pop         esi
 0041CE4B    pop         ebx
 0041CE4C    mov         esp,ebp
 0041CE4E    pop         ebp
 0041CE4F    ret         8
*}
end;

//0041CE54
function TStream.ReadComponent(Instance:TComponent):TComponent;
begin
{*
 0041CE54    push        ebp
 0041CE55    mov         ebp,esp
 0041CE57    add         esp,0FFFFFFF8
 0041CE5A    push        ebx
 0041CE5B    mov         ebx,edx
 0041CE5D    push        1000
 0041CE62    mov         ecx,eax
 0041CE64    mov         dl,1
 0041CE66    mov         eax,[00418A18];TReader
 0041CE6B    call        TFiler.Create
 0041CE70    mov         dword ptr [ebp-8],eax
 0041CE73    xor         eax,eax
 0041CE75    push        ebp
 0041CE76    push        41CEA4
 0041CE7B    push        dword ptr fs:[eax]
 0041CE7E    mov         dword ptr fs:[eax],esp
 0041CE81    mov         edx,ebx
 0041CE83    mov         eax,dword ptr [ebp-8]
 0041CE86    call        TReader.ReadRootComponent
 0041CE8B    mov         dword ptr [ebp-4],eax
 0041CE8E    xor         eax,eax
 0041CE90    pop         edx
 0041CE91    pop         ecx
 0041CE92    pop         ecx
 0041CE93    mov         dword ptr fs:[eax],edx
 0041CE96    push        41CEAB
 0041CE9B    mov         eax,dword ptr [ebp-8]
 0041CE9E    call        TObject.Free
 0041CEA3    ret
>0041CEA4    jmp         @HandleFinally
>0041CEA9    jmp         0041CE9B
 0041CEAB    mov         eax,dword ptr [ebp-4]
 0041CEAE    pop         ebx
 0041CEAF    pop         ecx
 0041CEB0    pop         ecx
 0041CEB1    pop         ebp
 0041CEB2    ret
*}
end;

//0041CEB4
constructor THandleStream.Create(AHandle:Integer);
begin
{*
 0041CEB4    push        ebx
 0041CEB5    push        esi
 0041CEB6    push        edi
 0041CEB7    test        dl,dl
>0041CEB9    je          0041CEC3
 0041CEBB    add         esp,0FFFFFFF0
 0041CEBE    call        @ClassCreate
 0041CEC3    mov         esi,ecx
 0041CEC5    mov         ebx,edx
 0041CEC7    mov         edi,eax
 0041CEC9    xor         edx,edx
 0041CECB    mov         eax,edi
 0041CECD    call        TObject.Create
 0041CED2    mov         dword ptr [edi+4],esi
 0041CED5    mov         eax,edi
 0041CED7    test        bl,bl
>0041CED9    je          0041CEEA
 0041CEDB    call        @AfterConstruction
 0041CEE0    pop         dword ptr fs:[0]
 0041CEE7    add         esp,0C
 0041CEEA    mov         eax,edi
 0041CEEC    pop         edi
 0041CEED    pop         esi
 0041CEEE    pop         ebx
 0041CEEF    ret
*}
end;

//0041CEF0
function THandleStream.Read(var Buffer:void ; Count:Longint):Longint;
begin
{*
 0041CEF0    mov         eax,dword ptr [eax+4]
 0041CEF3    call        FileRead
 0041CEF8    cmp         eax,0FFFFFFFF
>0041CEFB    jne         0041CEFF
 0041CEFD    xor         eax,eax
 0041CEFF    ret
*}
end;

//0041CF00
function THandleStream.Write(const Buffer:void ; Count:Longint):Longint;
begin
{*
 0041CF00    mov         eax,dword ptr [eax+4]
 0041CF03    call        FileWrite
 0041CF08    cmp         eax,0FFFFFFFF
>0041CF0B    jne         0041CF0F
 0041CF0D    xor         eax,eax
 0041CF0F    ret
*}
end;

//0041CF10
function THandleStream.Seek(Origin:TSeekOrigin; const Offset:Int64):Int64;
begin
{*
 0041CF10    push        ebp
 0041CF11    mov         ebp,esp
 0041CF13    add         esp,0FFFFFFF8
 0041CF16    push        dword ptr [ebp+0C]
 0041CF19    push        dword ptr [ebp+8]
 0041CF1C    and         edx,7F
 0041CF1F    mov         eax,dword ptr [eax+4]
 0041CF22    call        FileSeek
 0041CF27    mov         dword ptr [ebp-8],eax
 0041CF2A    mov         dword ptr [ebp-4],edx
 0041CF2D    mov         eax,dword ptr [ebp-8]
 0041CF30    mov         edx,dword ptr [ebp-4]
 0041CF33    pop         ecx
 0041CF34    pop         ecx
 0041CF35    pop         ebp
 0041CF36    ret         8
*}
end;

//0041CF3C
procedure THandleStream.SetSize(NewSize:Longint);
begin
{*
 0041CF3C    push        ebx
 0041CF3D    mov         ebx,edx
 0041CF3F    mov         ecx,eax
 0041CF41    mov         eax,ebx
 0041CF43    cdq
 0041CF44    push        edx
 0041CF45    push        eax
 0041CF46    mov         eax,ecx
 0041CF48    mov         edx,dword ptr [eax]
 0041CF4A    call        dword ptr [edx+8]
 0041CF4D    pop         ebx
 0041CF4E    ret
*}
end;

//0041CF50
procedure THandleStream.SetSize(const NewSize:Int64);
begin
{*
 0041CF50    push        ebp
 0041CF51    mov         ebp,esp
 0041CF53    push        ebx
 0041CF54    mov         ebx,eax
 0041CF56    push        dword ptr [ebp+0C]
 0041CF59    push        dword ptr [ebp+8]
 0041CF5C    xor         edx,edx
 0041CF5E    mov         eax,ebx
 0041CF60    mov         ecx,dword ptr [eax]
 0041CF62    call        dword ptr [ecx+18]
 0041CF65    mov         eax,dword ptr [ebx+4]
 0041CF68    push        eax
 0041CF69    call        KERNEL32.SetEndOfFile
 0041CF6E    call        Win32Check
 0041CF73    pop         ebx
 0041CF74    pop         ebp
 0041CF75    ret         8
*}
end;

//0041CF78
constructor TFileStream.Create(const FileName:AnsiString; Mode:Word);
begin
{*
 0041CF78    push        ebp
 0041CF79    mov         ebp,esp
 0041CF7B    push        ebx
 0041CF7C    push        esi
 0041CF7D    test        dl,dl
>0041CF7F    je          0041CF89
 0041CF81    add         esp,0FFFFFFF0
 0041CF84    call        @ClassCreate
 0041CF89    mov         ebx,edx
 0041CF8B    mov         esi,eax
 0041CF8D    mov         ax,word ptr [ebp+8]
 0041CF91    push        eax
 0041CF92    push        0
 0041CF94    xor         edx,edx
 0041CF96    mov         eax,esi
 0041CF98    call        TFileStream.Create
 0041CF9D    mov         eax,esi
 0041CF9F    test        bl,bl
>0041CFA1    je          0041CFB2
 0041CFA3    call        @AfterConstruction
 0041CFA8    pop         dword ptr fs:[0]
 0041CFAF    add         esp,0C
 0041CFB2    mov         eax,esi
 0041CFB4    pop         esi
 0041CFB5    pop         ebx
 0041CFB6    pop         ebp
 0041CFB7    ret         4
*}
end;

//0041CFBC
constructor TFileStream.Create(const FileName:AnsiString; Mode:Word; Rights:Cardinal);
begin
{*
 0041CFBC    push        ebp
 0041CFBD    mov         ebp,esp
 0041CFBF    add         esp,0FFFFFFDC
 0041CFC2    push        ebx
 0041CFC3    push        esi
 0041CFC4    push        edi
 0041CFC5    xor         ebx,ebx
 0041CFC7    mov         dword ptr [ebp-20],ebx
 0041CFCA    mov         dword ptr [ebp-24],ebx
 0041CFCD    mov         dword ptr [ebp-18],ebx
 0041CFD0    mov         dword ptr [ebp-1C],ebx
 0041CFD3    test        dl,dl
>0041CFD5    je          0041CFDF
 0041CFD7    add         esp,0FFFFFFF0
 0041CFDA    call        @ClassCreate
 0041CFDF    mov         esi,ecx
 0041CFE1    mov         byte ptr [ebp-1],dl
 0041CFE4    mov         ebx,eax
 0041CFE6    mov         edi,dword ptr [ebp+0C]
 0041CFE9    xor         eax,eax
 0041CFEB    push        ebp
 0041CFEC    push        41D0E5
 0041CFF1    push        dword ptr fs:[eax]
 0041CFF4    mov         dword ptr fs:[eax],esp
 0041CFF7    cmp         di,0FFFF
>0041CFFC    jne         0041D067
 0041CFFE    mov         edx,dword ptr [ebp+8]
 0041D001    mov         eax,esi
 0041D003    call        FileCreate
 0041D008    mov         ecx,eax
 0041D00A    xor         edx,edx
 0041D00C    mov         eax,ebx
 0041D00E    call        THandleStream.Create
 0041D013    cmp         dword ptr [ebx+4],0
>0041D017    jge         0041D0CA
 0041D01D    lea         edx,[ebp-18]
 0041D020    mov         eax,esi
 0041D022    call        ExpandFileName
 0041D027    mov         eax,dword ptr [ebp-18]
 0041D02A    mov         dword ptr [ebp-14],eax
 0041D02D    mov         byte ptr [ebp-10],0B
 0041D031    call        KERNEL32.GetLastError
 0041D036    lea         edx,[ebp-1C]
 0041D039    call        SysErrorMessage
 0041D03E    mov         eax,dword ptr [ebp-1C]
 0041D041    mov         dword ptr [ebp-0C],eax
 0041D044    mov         byte ptr [ebp-8],0B
 0041D048    lea         eax,[ebp-14]
 0041D04B    push        eax
 0041D04C    push        1
 0041D04E    mov         ecx,dword ptr ds:[5AE804];^SFCreateErrorEx:TResStringRec
 0041D054    mov         dl,1
 0041D056    mov         eax,[00417850];EFCreateError
 0041D05B    call        Exception.CreateResFmt
 0041D060    call        @RaiseExcept
>0041D065    jmp         0041D0CA
 0041D067    movzx       edx,di
 0041D06A    mov         eax,esi
 0041D06C    call        FileOpen
 0041D071    mov         ecx,eax
 0041D073    xor         edx,edx
 0041D075    mov         eax,ebx
 0041D077    call        THandleStream.Create
 0041D07C    cmp         dword ptr [ebx+4],0
>0041D080    jge         0041D0CA
 0041D082    lea         edx,[ebp-20]
 0041D085    mov         eax,esi
 0041D087    call        ExpandFileName
 0041D08C    mov         eax,dword ptr [ebp-20]
 0041D08F    mov         dword ptr [ebp-14],eax
 0041D092    mov         byte ptr [ebp-10],0B
 0041D096    call        KERNEL32.GetLastError
 0041D09B    lea         edx,[ebp-24]
 0041D09E    call        SysErrorMessage
 0041D0A3    mov         eax,dword ptr [ebp-24]
 0041D0A6    mov         dword ptr [ebp-0C],eax
 0041D0A9    mov         byte ptr [ebp-8],0B
 0041D0AD    lea         eax,[ebp-14]
 0041D0B0    push        eax
 0041D0B1    push        1
 0041D0B3    mov         ecx,dword ptr ds:[5AE0E4];^SFOpenErrorEx:TResStringRec
 0041D0B9    mov         dl,1
 0041D0BB    mov         eax,[004178AC];EFOpenError
 0041D0C0    call        Exception.CreateResFmt
 0041D0C5    call        @RaiseExcept
 0041D0CA    xor         eax,eax
 0041D0CC    pop         edx
 0041D0CD    pop         ecx
 0041D0CE    pop         ecx
 0041D0CF    mov         dword ptr fs:[eax],edx
 0041D0D2    push        41D0EC
 0041D0D7    lea         eax,[ebp-24]
 0041D0DA    mov         edx,4
 0041D0DF    call        @LStrArrayClr
 0041D0E4    ret
>0041D0E5    jmp         @HandleFinally
>0041D0EA    jmp         0041D0D7
 0041D0EC    mov         eax,ebx
 0041D0EE    cmp         byte ptr [ebp-1],0
>0041D0F2    je          0041D103
 0041D0F4    call        @AfterConstruction
 0041D0F9    pop         dword ptr fs:[0]
 0041D100    add         esp,0C
 0041D103    mov         eax,ebx
 0041D105    pop         edi
 0041D106    pop         esi
 0041D107    pop         ebx
 0041D108    mov         esp,ebp
 0041D10A    pop         ebp
 0041D10B    ret         8
*}
end;

//0041D110
destructor TFileStream.Destroy;
begin
{*
 0041D110    push        ebx
 0041D111    push        esi
 0041D112    call        @BeforeDestruction
 0041D117    mov         ebx,edx
 0041D119    mov         esi,eax
 0041D11B    mov         eax,dword ptr [esi+4]
 0041D11E    test        eax,eax
>0041D120    jl          0041D127
 0041D122    call        FileClose
 0041D127    mov         edx,ebx
 0041D129    and         dl,0FC
 0041D12C    mov         eax,esi
 0041D12E    call        TObject.Destroy
 0041D133    test        bl,bl
>0041D135    jle         0041D13E
 0041D137    mov         eax,esi
 0041D139    call        @ClassDestroy
 0041D13E    pop         esi
 0041D13F    pop         ebx
 0041D140    ret
*}
end;

//0041D144
procedure TCustomMemoryStream.SetPointer(Ptr:Pointer; Size:Longint);
begin
{*
 0041D144    mov         dword ptr [eax+4],edx
 0041D147    mov         dword ptr [eax+8],ecx
 0041D14A    ret
*}
end;

//0041D14C
function TCustomMemoryStream.Read(var Buffer:void ; Count:Longint):Longint;
begin
{*
 0041D14C    push        ebx
 0041D14D    push        esi
 0041D14E    push        edi
 0041D14F    mov         ebx,eax
 0041D151    mov         edi,dword ptr [ebx+0C]
 0041D154    test        edi,edi
>0041D156    jl          0041D17C
 0041D158    test        ecx,ecx
>0041D15A    jl          0041D17C
 0041D15C    mov         esi,dword ptr [ebx+8]
 0041D15F    sub         esi,edi
 0041D161    test        esi,esi
>0041D163    jle         0041D17C
 0041D165    cmp         ecx,esi
>0041D167    jge         0041D16B
 0041D169    mov         esi,ecx
 0041D16B    mov         eax,dword ptr [ebx+4]
 0041D16E    add         eax,edi
 0041D170    mov         ecx,esi
 0041D172    call        Move
 0041D177    add         dword ptr [ebx+0C],esi
>0041D17A    jmp         0041D17E
 0041D17C    xor         esi,esi
 0041D17E    mov         eax,esi
 0041D180    pop         edi
 0041D181    pop         esi
 0041D182    pop         ebx
 0041D183    ret
*}
end;

//0041D184
function TCustomMemoryStream.Seek(Offset:Longint; Origin:Word):Longint;
begin
{*
 0041D184    sub         cx,1
>0041D188    jb          0041D193
>0041D18A    je          0041D198
 0041D18C    dec         cx
>0041D18F    je          0041D19D
>0041D191    jmp         0041D1A3
 0041D193    mov         dword ptr [eax+0C],edx
>0041D196    jmp         0041D1A3
 0041D198    add         dword ptr [eax+0C],edx
>0041D19B    jmp         0041D1A3
 0041D19D    add         edx,dword ptr [eax+8]
 0041D1A0    mov         dword ptr [eax+0C],edx
 0041D1A3    mov         eax,dword ptr [eax+0C]
 0041D1A6    ret
*}
end;

//0041D1A8
destructor TPersistent.Destroy;
begin
{*
 0041D1A8    push        ebx
 0041D1A9    push        esi
 0041D1AA    call        @BeforeDestruction
 0041D1AF    mov         ebx,edx
 0041D1B1    mov         esi,eax
 0041D1B3    mov         eax,esi
 0041D1B5    call        RemoveFixups
 0041D1BA    mov         edx,ebx
 0041D1BC    and         dl,0FC
 0041D1BF    mov         eax,esi
 0041D1C1    call        TObject.Destroy
 0041D1C6    test        bl,bl
>0041D1C8    jle         0041D1D1
 0041D1CA    mov         eax,esi
 0041D1CC    call        @ClassDestroy
 0041D1D1    pop         esi
 0041D1D2    pop         ebx
 0041D1D3    ret
*}
end;

//0041D1D4
procedure RemoveFixups(Instance:TPersistent);
begin
{*
 0041D1D4    push        ebx
 0041D1D5    mov         ebx,eax
 0041D1D7    xor         edx,edx
 0041D1D9    mov         eax,ebx
 0041D1DB    call        TMemoryStream.SetCapacity
 0041D1E0    xor         eax,eax
 0041D1E2    mov         dword ptr [ebx+8],eax
 0041D1E5    xor         eax,eax
 0041D1E7    mov         dword ptr [ebx+0C],eax
 0041D1EA    pop         ebx
 0041D1EB    ret
*}
end;

//0041D1EC
procedure TMemoryStream.LoadFromStream(Stream:TStream);
begin
{*
 0041D1EC    push        ebx
 0041D1ED    push        esi
 0041D1EE    push        edi
 0041D1EF    mov         edi,edx
 0041D1F1    mov         esi,eax
 0041D1F3    push        0
 0041D1F5    push        0
 0041D1F7    mov         eax,edi
 0041D1F9    call        TStream.SetPosition
 0041D1FE    mov         eax,edi
 0041D200    mov         edx,dword ptr [eax]
 0041D202    call        dword ptr [edx]
 0041D204    mov         ebx,eax
 0041D206    mov         edx,ebx
 0041D208    mov         eax,esi
 0041D20A    mov         ecx,dword ptr [eax]
 0041D20C    call        dword ptr [ecx+4]
 0041D20F    test        ebx,ebx
>0041D211    je          0041D21F
 0041D213    mov         edx,dword ptr [esi+4]
 0041D216    mov         ecx,ebx
 0041D218    mov         eax,edi
 0041D21A    call        TStream.ReadBuffer
 0041D21F    pop         edi
 0041D220    pop         esi
 0041D221    pop         ebx
 0041D222    ret
*}
end;

//0041D224
procedure TMemoryStream.SetCapacity(NewCapacity:Longint);
begin
{*
 0041D224    push        ebx
 0041D225    push        ecx
 0041D226    mov         dword ptr [esp],edx
 0041D229    mov         ebx,eax
 0041D22B    mov         edx,esp
 0041D22D    mov         eax,ebx
 0041D22F    mov         ecx,dword ptr [eax]
 0041D231    call        dword ptr [ecx+1C]
 0041D234    mov         edx,eax
 0041D236    mov         ecx,dword ptr [ebx+8]
 0041D239    mov         eax,ebx
 0041D23B    call        TCustomMemoryStream.SetPointer
 0041D240    mov         eax,dword ptr [esp]
 0041D243    mov         dword ptr [ebx+10],eax
 0041D246    pop         edx
 0041D247    pop         ebx
 0041D248    ret
*}
end;

//0041D24C
procedure TMemoryStream.SetSize(NewSize:Longint);
begin
{*
 0041D24C    push        ebx
 0041D24D    push        esi
 0041D24E    push        edi
 0041D24F    mov         esi,edx
 0041D251    mov         ebx,eax
 0041D253    mov         edi,dword ptr [ebx+0C]
 0041D256    mov         edx,esi
 0041D258    mov         eax,ebx
 0041D25A    call        TMemoryStream.SetCapacity
 0041D25F    mov         dword ptr [ebx+8],esi
 0041D262    cmp         esi,edi
>0041D264    jge         0041D273
 0041D266    mov         cx,2
 0041D26A    xor         edx,edx
 0041D26C    mov         eax,ebx
 0041D26E    mov         ebx,dword ptr [eax]
 0041D270    call        dword ptr [ebx+14]
 0041D273    pop         edi
 0041D274    pop         esi
 0041D275    pop         ebx
 0041D276    ret
*}
end;

//0041D278
function TMemoryStream.Realloc(var NewCapacity:Longint):Pointer;
begin
{*
 0041D278    push        ebx
 0041D279    push        esi
 0041D27A    push        edi
 0041D27B    cmp         dword ptr [edx],0
>0041D27E    jle         0041D297
 0041D280    mov         ecx,dword ptr [edx]
 0041D282    cmp         ecx,dword ptr [eax+8]
>0041D285    je          0041D297
 0041D287    mov         ecx,dword ptr [edx]
 0041D289    add         ecx,1FFF
 0041D28F    and         ecx,0FFFFE000
 0041D295    mov         dword ptr [edx],ecx
 0041D297    mov         esi,dword ptr [eax+4]
 0041D29A    mov         ecx,esi
 0041D29C    mov         edi,dword ptr [edx]
 0041D29E    mov         ebx,dword ptr [eax+10]
 0041D2A1    cmp         edi,ebx
>0041D2A3    je          0041D2FB
 0041D2A5    cmp         dword ptr [edx],0
>0041D2A8    jne         0041D2B5
 0041D2AA    mov         eax,esi
 0041D2AC    call        GlobalFreePtr
 0041D2B1    xor         ecx,ecx
>0041D2B3    jmp         0041D2FB
 0041D2B5    test        ebx,ebx
>0041D2B7    jne         0041D2CC
 0041D2B9    mov         eax,[005AE684]
 0041D2BE    movzx       eax,word ptr [eax]
 0041D2C1    mov         edx,dword ptr [edx]
 0041D2C3    call        GlobalAllocPtr
 0041D2C8    mov         ecx,eax
>0041D2CA    jmp         0041D2E0
 0041D2CC    mov         ecx,dword ptr ds:[5AE684]
 0041D2D2    movzx       ecx,word ptr [ecx]
 0041D2D5    mov         edx,dword ptr [edx]
 0041D2D7    mov         eax,esi
 0041D2D9    call        GlobalReAllocPtr
 0041D2DE    mov         ecx,eax
 0041D2E0    test        ecx,ecx
>0041D2E2    jne         0041D2FB
 0041D2E4    mov         ecx,dword ptr ds:[5AE75C];^SMemoryStreamError:TResStringRec
 0041D2EA    mov         dl,1
 0041D2EC    mov         eax,[00417794];EStreamError
 0041D2F1    call        Exception.CreateRes
 0041D2F6    call        @RaiseExcept
 0041D2FB    mov         eax,ecx
 0041D2FD    pop         edi
 0041D2FE    pop         esi
 0041D2FF    pop         ebx
 0041D300    ret
*}
end;

//0041D304
function TMemoryStream.Write(const Buffer:void ; Count:Longint):Longint;
begin
{*
 0041D304    push        ebx
 0041D305    push        esi
 0041D306    push        edi
 0041D307    push        ebp
 0041D308    mov         esi,ecx
 0041D30A    mov         ebp,edx
 0041D30C    mov         ebx,eax
 0041D30E    mov         eax,dword ptr [ebx+0C]
 0041D311    test        eax,eax
>0041D313    jl          0041D34D
 0041D315    test        esi,esi
>0041D317    jl          0041D34D
 0041D319    mov         edi,eax
 0041D31B    add         edi,esi
 0041D31D    test        edi,edi
>0041D31F    jle         0041D34D
 0041D321    cmp         edi,dword ptr [ebx+8]
>0041D324    jle         0041D337
 0041D326    cmp         edi,dword ptr [ebx+10]
>0041D329    jle         0041D334
 0041D32B    mov         edx,edi
 0041D32D    mov         eax,ebx
 0041D32F    call        TMemoryStream.SetCapacity
 0041D334    mov         dword ptr [ebx+8],edi
 0041D337    mov         edx,dword ptr [ebx+4]
 0041D33A    add         edx,dword ptr [ebx+0C]
 0041D33D    mov         eax,ebp
 0041D33F    mov         ecx,esi
 0041D341    call        Move
 0041D346    mov         dword ptr [ebx+0C],edi
 0041D349    mov         eax,esi
>0041D34B    jmp         0041D34F
 0041D34D    xor         eax,eax
 0041D34F    pop         ebp
 0041D350    pop         edi
 0041D351    pop         esi
 0041D352    pop         ebx
 0041D353    ret
*}
end;

//0041D354
constructor TStringStream.Create(const AString:AnsiString);
begin
{*
 0041D354    push        ebx
 0041D355    push        esi
 0041D356    push        edi
 0041D357    test        dl,dl
>0041D359    je          0041D363
 0041D35B    add         esp,0FFFFFFF0
 0041D35E    call        @ClassCreate
 0041D363    mov         esi,ecx
 0041D365    mov         ebx,edx
 0041D367    mov         edi,eax
 0041D369    xor         edx,edx
 0041D36B    mov         eax,edi
 0041D36D    call        TObject.Create
 0041D372    lea         eax,[edi+4]
 0041D375    mov         edx,esi
 0041D377    call        @LStrAsg
 0041D37C    mov         eax,edi
 0041D37E    test        bl,bl
>0041D380    je          0041D391
 0041D382    call        @AfterConstruction
 0041D387    pop         dword ptr fs:[0]
 0041D38E    add         esp,0C
 0041D391    mov         eax,edi
 0041D393    pop         edi
 0041D394    pop         esi
 0041D395    pop         ebx
 0041D396    ret
*}
end;

//0041D398
function TStringStream.Read(var Buffer:void ; Count:Longint):Longint;
begin
{*
 0041D398    push        ebx
 0041D399    push        esi
 0041D39A    push        edi
 0041D39B    push        ebp
 0041D39C    mov         edi,ecx
 0041D39E    mov         ebp,edx
 0041D3A0    mov         ebx,eax
 0041D3A2    mov         eax,dword ptr [ebx+4]
 0041D3A5    call        @LStrLen
 0041D3AA    mov         esi,eax
 0041D3AC    sub         esi,dword ptr [ebx+8]
 0041D3AF    cmp         edi,esi
>0041D3B1    jge         0041D3B5
 0041D3B3    mov         esi,edi
 0041D3B5    lea         eax,[ebx+4]
 0041D3B8    call        @UniqueStringA
 0041D3BD    mov         edx,dword ptr [ebx+8]
 0041D3C0    add         eax,edx
 0041D3C2    mov         edx,ebp
 0041D3C4    mov         ecx,esi
 0041D3C6    call        Move
 0041D3CB    add         dword ptr [ebx+8],esi
 0041D3CE    mov         eax,esi
 0041D3D0    pop         ebp
 0041D3D1    pop         edi
 0041D3D2    pop         esi
 0041D3D3    pop         ebx
 0041D3D4    ret
*}
end;

//0041D3D8
function TStringStream.Write(const Buffer:void ; Count:Longint):Longint;
begin
{*
 0041D3D8    push        ebx
 0041D3D9    push        esi
 0041D3DA    push        edi
 0041D3DB    mov         edi,edx
 0041D3DD    mov         ebx,eax
 0041D3DF    mov         esi,ecx
 0041D3E1    mov         edx,dword ptr [ebx+8]
 0041D3E4    add         edx,esi
 0041D3E6    lea         eax,[ebx+4]
 0041D3E9    call        @LStrSetLength
 0041D3EE    lea         eax,[ebx+4]
 0041D3F1    call        @UniqueStringA
 0041D3F6    mov         edx,dword ptr [ebx+8]
 0041D3F9    lea         edx,[eax+edx]
 0041D3FC    mov         eax,edi
 0041D3FE    mov         ecx,esi
 0041D400    call        Move
 0041D405    add         dword ptr [ebx+8],esi
 0041D408    mov         eax,esi
 0041D40A    pop         edi
 0041D40B    pop         esi
 0041D40C    pop         ebx
 0041D40D    ret
*}
end;

//0041D410
function TStringStream.Seek(Offset:Longint; Origin:Word):Longint;
begin
{*
 0041D410    push        ebx
 0041D411    push        esi
 0041D412    mov         esi,edx
 0041D414    mov         ebx,eax
 0041D416    sub         cx,1
>0041D41A    jb          0041D425
>0041D41C    je          0041D42A
 0041D41E    dec         cx
>0041D421    je          0041D42F
>0041D423    jmp         0041D43C
 0041D425    mov         dword ptr [ebx+8],esi
>0041D428    jmp         0041D43C
 0041D42A    add         dword ptr [ebx+8],esi
>0041D42D    jmp         0041D43C
 0041D42F    mov         eax,dword ptr [ebx+4]
 0041D432    call        @LStrLen
 0041D437    sub         eax,esi
 0041D439    mov         dword ptr [ebx+8],eax
 0041D43C    mov         eax,dword ptr [ebx+4]
 0041D43F    call        @LStrLen
 0041D444    cmp         eax,dword ptr [ebx+8]
>0041D447    jge         0041D456
 0041D449    mov         eax,dword ptr [ebx+4]
 0041D44C    call        @LStrLen
 0041D451    mov         dword ptr [ebx+8],eax
>0041D454    jmp         0041D461
 0041D456    cmp         dword ptr [ebx+8],0
>0041D45A    jge         0041D461
 0041D45C    xor         eax,eax
 0041D45E    mov         dword ptr [ebx+8],eax
 0041D461    mov         eax,dword ptr [ebx+8]
 0041D464    pop         esi
 0041D465    pop         ebx
 0041D466    ret
*}
end;

//0041D468
procedure TStringStream.SetSize(NewSize:Longint);
begin
{*
 0041D468    push        ebx
 0041D469    push        esi
 0041D46A    mov         esi,edx
 0041D46C    mov         ebx,eax
 0041D46E    lea         eax,[ebx+4]
 0041D471    mov         edx,esi
 0041D473    call        @LStrSetLength
 0041D478    cmp         esi,dword ptr [ebx+8]
>0041D47B    jge         0041D480
 0041D47D    mov         dword ptr [ebx+8],esi
 0041D480    pop         esi
 0041D481    pop         ebx
 0041D482    ret
*}
end;

//0041D484
constructor TResourceStream.Create(Instance:THandle; const ResName:AnsiString; ResType:PChar);
begin
{*
 0041D484    push        ebp
 0041D485    mov         ebp,esp
 0041D487    push        ebx
 0041D488    push        esi
 0041D489    push        edi
 0041D48A    test        dl,dl
>0041D48C    je          0041D496
 0041D48E    add         esp,0FFFFFFF0
 0041D491    call        @ClassCreate
 0041D496    mov         esi,ecx
 0041D498    mov         ebx,edx
 0041D49A    mov         edi,eax
 0041D49C    xor         edx,edx
 0041D49E    mov         eax,edi
 0041D4A0    call        TObject.Create
 0041D4A5    mov         eax,dword ptr [ebp+8]
 0041D4A8    push        eax
 0041D4A9    mov         eax,dword ptr [ebp+0C]
 0041D4AC    call        @LStrToPChar
 0041D4B1    mov         ecx,eax
 0041D4B3    mov         edx,esi
 0041D4B5    mov         eax,edi
 0041D4B7    call        TResourceStream.Initialize
 0041D4BC    mov         eax,edi
 0041D4BE    test        bl,bl
>0041D4C0    je          0041D4D1
 0041D4C2    call        @AfterConstruction
 0041D4C7    pop         dword ptr fs:[0]
 0041D4CE    add         esp,0C
 0041D4D1    mov         eax,edi
 0041D4D3    pop         edi
 0041D4D4    pop         esi
 0041D4D5    pop         ebx
 0041D4D6    pop         ebp
 0041D4D7    ret         8
*}
end;

//0041D4DC
{*procedure sub_0041D4DC(?:?);
begin
 0041D4DC    push        ebp
 0041D4DD    mov         ebp,esp
 0041D4DF    add         esp,0FFFFFFF4
 0041D4E2    xor         eax,eax
 0041D4E4    mov         dword ptr [ebp-0C],eax
 0041D4E7    xor         eax,eax
 0041D4E9    push        ebp
 0041D4EA    push        41D53F
 0041D4EF    push        dword ptr fs:[eax]
 0041D4F2    mov         dword ptr fs:[eax],esp
 0041D4F5    mov         eax,dword ptr [ebp+8]
 0041D4F8    mov         eax,dword ptr [eax-4]
 0041D4FB    mov         dword ptr [ebp-8],eax
 0041D4FE    mov         byte ptr [ebp-4],6
 0041D502    lea         eax,[ebp-8]
 0041D505    push        eax
 0041D506    push        0
 0041D508    lea         edx,[ebp-0C]
 0041D50B    mov         eax,[005AE41C];^SResNotFound:TResStringRec
 0041D510    call        LoadStr
 0041D515    mov         ecx,dword ptr [ebp-0C]
 0041D518    mov         dl,1
 0041D51A    mov         eax,[00417A68];EResNotFound
 0041D51F    call        Exception.CreateFmt;EResNotFound.Create
 0041D524    call        @RaiseExcept
 0041D529    xor         eax,eax
 0041D52B    pop         edx
 0041D52C    pop         ecx
 0041D52D    pop         ecx
 0041D52E    mov         dword ptr fs:[eax],edx
 0041D531    push        41D546
 0041D536    lea         eax,[ebp-0C]
 0041D539    call        @LStrClr
 0041D53E    ret
>0041D53F    jmp         @HandleFinally
>0041D544    jmp         0041D536
 0041D546    mov         esp,ebp
 0041D548    pop         ebp
 0041D549    ret
end;*}

//0041D54C
procedure TResourceStream.Initialize(Instance:THandle; Name:PChar; ResType:PChar);
begin
{*
 0041D54C    push        ebp
 0041D54D    mov         ebp,esp
 0041D54F    push        ecx
 0041D550    push        ebx
 0041D551    push        esi
 0041D552    push        edi
 0041D553    mov         dword ptr [ebp-4],ecx
 0041D556    mov         esi,edx
 0041D558    mov         ebx,eax
 0041D55A    mov         eax,dword ptr [ebp+8]
 0041D55D    push        eax
 0041D55E    mov         eax,dword ptr [ebp-4]
 0041D561    push        eax
 0041D562    push        esi
 0041D563    call        KERNEL32.FindResourceA
 0041D568    mov         edi,eax
 0041D56A    mov         dword ptr [ebx+10],edi
 0041D56D    test        edi,edi
>0041D56F    jne         0041D578
 0041D571    push        ebp
 0041D572    call        0041D4DC
 0041D577    pop         ecx
 0041D578    mov         eax,dword ptr [ebx+10]
 0041D57B    push        eax
 0041D57C    push        esi
 0041D57D    call        KERNEL32.LoadResource
 0041D582    mov         edi,eax
 0041D584    mov         dword ptr [ebx+14],edi
 0041D587    test        edi,edi
>0041D589    jne         0041D592
 0041D58B    push        ebp
 0041D58C    call        0041D4DC
 0041D591    pop         ecx
 0041D592    mov         eax,dword ptr [ebx+10]
 0041D595    push        eax
 0041D596    push        esi
 0041D597    call        KERNEL32.SizeofResource
 0041D59C    push        eax
 0041D59D    mov         eax,dword ptr [ebx+14]
 0041D5A0    push        eax
 0041D5A1    call        KERNEL32.LockResource
 0041D5A6    mov         edx,eax
 0041D5A8    mov         eax,ebx
 0041D5AA    pop         ecx
 0041D5AB    call        TCustomMemoryStream.SetPointer
 0041D5B0    pop         edi
 0041D5B1    pop         esi
 0041D5B2    pop         ebx
 0041D5B3    pop         ecx
 0041D5B4    pop         ebp
 0041D5B5    ret         4
*}
end;

//0041D5B8
destructor TResourceStream.Destroy;
begin
{*
 0041D5B8    push        ebx
 0041D5B9    push        esi
 0041D5BA    call        @BeforeDestruction
 0041D5BF    mov         ebx,edx
 0041D5C1    mov         esi,eax
 0041D5C3    mov         eax,dword ptr [esi+14]
 0041D5C6    call        UnlockResource
 0041D5CB    mov         eax,dword ptr [esi+14]
 0041D5CE    push        eax
 0041D5CF    call        KERNEL32.FreeResource
 0041D5D4    mov         edx,ebx
 0041D5D6    and         dl,0FC
 0041D5D9    mov         eax,esi
 0041D5DB    call        TObject.Destroy
 0041D5E0    test        bl,bl
>0041D5E2    jle         0041D5EB
 0041D5E4    mov         eax,esi
 0041D5E6    call        @ClassDestroy
 0041D5EB    pop         esi
 0041D5EC    pop         ebx
 0041D5ED    ret
*}
end;

//0041D5F0
function TResourceStream.Write(const Buffer:void ; Count:Longint):Longint;
begin
{*
 0041D5F0    mov         ecx,dword ptr ds:[5AE454];^SCantWriteResourceStreamError:TResStringRec
 0041D5F6    mov         dl,1
 0041D5F8    mov         eax,[00417794];EStreamError
 0041D5FD    call        Exception.CreateRes
 0041D602    call        @RaiseExcept
 0041D607    ret
*}
end;

//0041D608
constructor TFiler.Create(Stream:TStream; BufSize:Integer);
begin
{*
 0041D608    push        ebp
 0041D609    mov         ebp,esp
 0041D60B    push        ebx
 0041D60C    push        esi
 0041D60D    push        edi
 0041D60E    test        dl,dl
>0041D610    je          0041D61A
 0041D612    add         esp,0FFFFFFF0
 0041D615    call        @ClassCreate
 0041D61A    mov         ebx,edx
 0041D61C    mov         edi,eax
 0041D61E    mov         esi,dword ptr [ebp+8]
 0041D621    mov         dword ptr [edi+4],ecx
 0041D624    mov         eax,esi
 0041D626    call        @GetMem
 0041D62B    mov         dword ptr [edi+8],eax
 0041D62E    mov         dword ptr [edi+0C],esi
 0041D631    mov         eax,edi
 0041D633    test        bl,bl
>0041D635    je          0041D646
 0041D637    call        @AfterConstruction
 0041D63C    pop         dword ptr fs:[0]
 0041D643    add         esp,0C
 0041D646    mov         eax,edi
 0041D648    pop         edi
 0041D649    pop         esi
 0041D64A    pop         ebx
 0041D64B    pop         ebp
 0041D64C    ret         4
*}
end;

//0041D650
destructor TFiler.Destroy;
begin
{*
 0041D650    push        ebx
 0041D651    push        esi
 0041D652    call        @BeforeDestruction
 0041D657    mov         ebx,edx
 0041D659    mov         esi,eax
 0041D65B    mov         eax,dword ptr [esi+8]
 0041D65E    test        eax,eax
>0041D660    je          0041D66A
 0041D662    mov         edx,dword ptr [esi+0C]
 0041D665    call        @FreeMem
 0041D66A    test        bl,bl
>0041D66C    jle         0041D675
 0041D66E    mov         eax,esi
 0041D670    call        @ClassDestroy
 0041D675    pop         esi
 0041D676    pop         ebx
 0041D677    ret
*}
end;

//0041D678
procedure TFiler.SetRoot(Value:TComponent);
begin
{*
 0041D678    mov         dword ptr [eax+18],edx
 0041D67B    ret
*}
end;

//0041D754
constructor TPropFixup.Create(Instance:TPersistent; InstanceRoot:TComponent; PropInfo:PPropInfo; const RootName:AnsiString; const Name:AnsiString);
begin
{*
 0041D754    push        ebp
 0041D755    mov         ebp,esp
 0041D757    push        ebx
 0041D758    push        esi
 0041D759    test        dl,dl
>0041D75B    je          0041D765
 0041D75D    add         esp,0FFFFFFF0
 0041D760    call        @ClassCreate
 0041D765    mov         ebx,edx
 0041D767    mov         esi,eax
 0041D769    mov         dword ptr [esi+4],ecx
 0041D76C    mov         eax,dword ptr [ebp+14]
 0041D76F    mov         dword ptr [esi+8],eax
 0041D772    mov         eax,dword ptr [ebp+10]
 0041D775    mov         dword ptr [esi+0C],eax
 0041D778    lea         eax,[esi+10]
 0041D77B    mov         edx,dword ptr [ebp+0C]
 0041D77E    call        @LStrAsg
 0041D783    lea         eax,[esi+14]
 0041D786    mov         edx,dword ptr [ebp+8]
 0041D789    call        @LStrAsg
 0041D78E    mov         eax,esi
 0041D790    test        bl,bl
>0041D792    je          0041D7A3
 0041D794    call        @AfterConstruction
 0041D799    pop         dword ptr fs:[0]
 0041D7A0    add         esp,0C
 0041D7A3    mov         eax,esi
 0041D7A5    pop         esi
 0041D7A6    pop         ebx
 0041D7A7    pop         ebp
 0041D7A8    ret         10
*}
end;

//0041D7AC
function TPropFixup.MakeGlobalReference:Boolean;
begin
{*
 0041D7AC    push        ebx
 0041D7AD    push        esi
 0041D7AE    push        edi
 0041D7AF    push        ebp
 0041D7B0    mov         edi,eax
 0041D7B2    xor         eax,eax
 0041D7B4    mov         esi,dword ptr [edi+14]
 0041D7B7    mov         ebx,esi
>0041D7B9    jmp         0041D7BC
 0041D7BB    inc         ebx
 0041D7BC    mov         dl,byte ptr [ebx]
 0041D7BE    test        dl,dl
>0041D7C0    je          0041D7C7
 0041D7C2    sub         dl,2E
>0041D7C5    jne         0041D7BB
 0041D7C7    cmp         byte ptr [ebx],0
>0041D7CA    je          0041D7EE
 0041D7CC    mov         ebp,ebx
 0041D7CE    sub         ebp,esi
 0041D7D0    mov         ecx,ebp
 0041D7D2    lea         eax,[edi+10]
 0041D7D5    mov         edx,esi
 0041D7D7    call        @LStrFromPCharLen
 0041D7DC    mov         ecx,ebp
 0041D7DE    inc         ecx
 0041D7DF    lea         eax,[edi+14]
 0041D7E2    mov         edx,1
 0041D7E7    call        @LStrDelete
 0041D7EC    mov         al,1
 0041D7EE    pop         ebp
 0041D7EF    pop         edi
 0041D7F0    pop         esi
 0041D7F1    pop         ebx
 0041D7F2    ret
*}
end;

//0041D7F4
procedure TPropFixup.ResolveReference(Reference:Pointer);
begin
{*
 0041D7F4    mov         ecx,edx
 0041D7F6    mov         edx,dword ptr [eax+4]
 0041D7F9    mov         eax,dword ptr [eax+0C]
 0041D7FC    xchg        eax,edx
 0041D7FD    call        SetOrdProp
 0041D802    ret
*}
end;

//0041D804
procedure TPropIntfFixup.ResolveReference(Reference:Pointer);
begin
{*
 0041D804    push        ebp
 0041D805    mov         ebp,esp
 0041D807    push        0
 0041D809    push        ebx
 0041D80A    push        esi
 0041D80B    mov         esi,edx
 0041D80D    mov         ebx,eax
 0041D80F    xor         eax,eax
 0041D811    push        ebp
 0041D812    push        41D87B
 0041D817    push        dword ptr fs:[eax]
 0041D81A    mov         dword ptr fs:[eax],esp
 0041D81D    lea         eax,[ebp-4]
 0041D820    call        @IntfClear
 0041D825    test        esi,esi
>0041D827    je          0041D857
 0041D829    mov         eax,dword ptr [ebx+0C]
 0041D82C    mov         eax,dword ptr [eax]
 0041D82E    mov         eax,dword ptr [eax]
 0041D830    call        GetTypeData
 0041D835    add         eax,5
 0041D838    push        eax
 0041D839    lea         eax,[ebp-4]
 0041D83C    call        @IntfClear
 0041D841    mov         ecx,eax
 0041D843    mov         eax,esi
 0041D845    pop         edx
 0041D846    call        Supports
 0041D84B    test        al,al
>0041D84D    jne         0041D857
 0041D84F    lea         eax,[ebp-4]
 0041D852    call        @IntfClear
 0041D857    mov         ecx,dword ptr [ebp-4]
 0041D85A    mov         edx,dword ptr [ebx+0C]
 0041D85D    mov         eax,dword ptr [ebx+4]
 0041D860    call        SetInterfaceProp
 0041D865    xor         eax,eax
 0041D867    pop         edx
 0041D868    pop         ecx
 0041D869    pop         ecx
 0041D86A    mov         dword ptr fs:[eax],edx
 0041D86D    push        41D882
 0041D872    lea         eax,[ebp-4]
 0041D875    call        @IntfClear
 0041D87A    ret
>0041D87B    jmp         @HandleFinally
>0041D880    jmp         0041D872
 0041D882    pop         esi
 0041D883    pop         ebx
 0041D884    pop         ecx
 0041D885    pop         ebp
 0041D886    ret
*}
end;

//0041D888
function FindNestedComponent(Root:TComponent; const NamePath:AnsiString):TComponent;
begin
{*
 0041D888    push        ebp
 0041D889    mov         ebp,esp
 0041D88B    add         esp,0FFFFFFF8
 0041D88E    push        ebx
 0041D88F    push        esi
 0041D890    push        edi
 0041D891    xor         ecx,ecx
 0041D893    mov         dword ptr [ebp-8],ecx
 0041D896    mov         ebx,edx
 0041D898    mov         esi,eax
 0041D89A    xor         eax,eax
 0041D89C    push        ebp
 0041D89D    push        41D92E
 0041D8A2    push        dword ptr fs:[eax]
 0041D8A5    mov         dword ptr fs:[eax],esp
 0041D8A8    xor         eax,eax
 0041D8AA    mov         dword ptr [ebp-4],eax
 0041D8AD    test        ebx,ebx
>0041D8AF    je          0041D918
 0041D8B1    mov         edi,esi
>0041D8B3    jmp         0041D910
 0041D8B5    mov         eax,ebx
>0041D8B7    jmp         0041D8BA
 0041D8B9    inc         ebx
 0041D8BA    mov         dl,byte ptr [ebx]
 0041D8BC    test        dl,dl
>0041D8BE    je          0041D8C8
 0041D8C0    add         dl,0D3
 0041D8C3    sub         dl,2
>0041D8C6    jae         0041D8B9
 0041D8C8    mov         ecx,ebx
 0041D8CA    sub         ecx,eax
 0041D8CC    lea         edx,[ebp-8]
 0041D8CF    xchg        eax,edx
 0041D8D0    call        @LStrFromPCharLen
 0041D8D5    mov         edx,dword ptr [ebp-8]
 0041D8D8    mov         eax,edi
 0041D8DA    call        TComponent.FindComponent
 0041D8DF    mov         esi,eax
 0041D8E1    test        esi,esi
>0041D8E3    jne         0041D8F8
 0041D8E5    mov         edx,41D948;'Owner'
 0041D8EA    mov         eax,dword ptr [ebp-8]
 0041D8ED    call        SameText
 0041D8F2    test        al,al
>0041D8F4    je          0041D8F8
 0041D8F6    mov         esi,edi
 0041D8F8    test        esi,esi
>0041D8FA    je          0041D918
 0041D8FC    cmp         byte ptr [ebx],2E
>0041D8FF    jne         0041D902
 0041D901    inc         ebx
 0041D902    cmp         byte ptr [ebx],2D
>0041D905    jne         0041D908
 0041D907    inc         ebx
 0041D908    cmp         byte ptr [ebx],3E
>0041D90B    jne         0041D90E
 0041D90D    inc         ebx
 0041D90E    mov         edi,esi
 0041D910    cmp         byte ptr [ebx],0
>0041D913    jne         0041D8B5
 0041D915    mov         dword ptr [ebp-4],edi
 0041D918    xor         eax,eax
 0041D91A    pop         edx
 0041D91B    pop         ecx
 0041D91C    pop         ecx
 0041D91D    mov         dword ptr fs:[eax],edx
 0041D920    push        41D935
 0041D925    lea         eax,[ebp-8]
 0041D928    call        @LStrClr
 0041D92D    ret
>0041D92E    jmp         @HandleFinally
>0041D933    jmp         0041D925
 0041D935    mov         eax,dword ptr [ebp-4]
 0041D938    pop         edi
 0041D939    pop         esi
 0041D93A    pop         ebx
 0041D93B    pop         ecx
 0041D93C    pop         ecx
 0041D93D    pop         ebp
 0041D93E    ret
*}
end;

//0041D950
procedure AddFinished(Instance:TPersistent);
begin
{*
 0041D950    push        ebp
 0041D951    mov         ebp,esp
 0041D953    push        ebx
 0041D954    mov         ebx,eax
 0041D956    mov         eax,dword ptr [ebp+8]
 0041D959    mov         eax,dword ptr [eax-4]
 0041D95C    mov         edx,ebx
 0041D95E    call        TList.IndexOf
 0041D963    test        eax,eax
>0041D965    jge         0041D985
 0041D967    mov         eax,dword ptr [ebp+8]
 0041D96A    mov         eax,dword ptr [eax-8]
 0041D96D    mov         edx,ebx
 0041D96F    call        TList.IndexOf
 0041D974    test        eax,eax
>0041D976    jl          0041D985
 0041D978    mov         eax,dword ptr [ebp+8]
 0041D97B    mov         eax,dword ptr [eax-4]
 0041D97E    mov         edx,ebx
 0041D980    call        TList.Add
 0041D985    pop         ebx
 0041D986    pop         ebp
 0041D987    ret
*}
end;

//0041D988
procedure AddNotFinished(Instance:TPersistent);
begin
{*
 0041D988    push        ebp
 0041D989    mov         ebp,esp
 0041D98B    push        ebx
 0041D98C    mov         ebx,eax
 0041D98E    mov         eax,dword ptr [ebp+8]
 0041D991    mov         eax,dword ptr [eax-4]
 0041D994    mov         edx,ebx
 0041D996    call        TList.IndexOf
 0041D99B    cmp         eax,0FFFFFFFF
>0041D99E    je          0041D9AC
 0041D9A0    mov         edx,dword ptr [ebp+8]
 0041D9A3    mov         edx,dword ptr [edx-4]
 0041D9A6    xchg        eax,edx
 0041D9A7    call        TList.Delete
 0041D9AC    mov         eax,dword ptr [ebp+8]
 0041D9AF    mov         eax,dword ptr [eax-8]
 0041D9B2    mov         edx,ebx
 0041D9B4    call        TList.IndexOf
 0041D9B9    test        eax,eax
>0041D9BB    jge         0041D9CA
 0041D9BD    mov         eax,dword ptr [ebp+8]
 0041D9C0    mov         eax,dword ptr [eax-8]
 0041D9C3    mov         edx,ebx
 0041D9C5    call        TList.Add
 0041D9CA    pop         ebx
 0041D9CB    pop         ebp
 0041D9CC    ret
*}
end;

//0041D9D0
procedure GlobalFixupReferences;
begin
{*
 0041D9D0    push        ebp
 0041D9D1    mov         ebp,esp
 0041D9D3    add         esp,0FFFFFFF4
 0041D9D6    push        ebx
 0041D9D7    push        esi
 0041D9D8    push        edi
 0041D9D9    mov         eax,[005E0918];GlobalNameSpace:IReadWriteSync
 0041D9DE    mov         edx,dword ptr [eax]
 0041D9E0    call        dword ptr [edx+14]
 0041D9E3    xor         edx,edx
 0041D9E5    push        ebp
 0041D9E6    push        41DB69
 0041D9EB    push        dword ptr fs:[edx]
 0041D9EE    mov         dword ptr fs:[edx],esp
 0041D9F1    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041D9F6    call        TThreadList.LockList
 0041D9FB    mov         edi,eax
 0041D9FD    xor         edx,edx
 0041D9FF    push        ebp
 0041DA00    push        41DB4A
 0041DA05    push        dword ptr fs:[edx]
 0041DA08    mov         dword ptr fs:[edx],esp
 0041DA0B    cmp         dword ptr [edi+8],0
>0041DA0F    jle         0041DB32
 0041DA15    mov         dl,1
 0041DA17    mov         eax,[00417CEC];TList
 0041DA1C    call        TObject.Create
 0041DA21    mov         dword ptr [ebp-4],eax
 0041DA24    xor         edx,edx
 0041DA26    push        ebp
 0041DA27    push        41DB2B
 0041DA2C    push        dword ptr fs:[edx]
 0041DA2F    mov         dword ptr fs:[edx],esp
 0041DA32    mov         dl,1
 0041DA34    mov         eax,[00417CEC];TList
 0041DA39    call        TObject.Create
 0041DA3E    mov         dword ptr [ebp-8],eax
 0041DA41    xor         edx,edx
 0041DA43    push        ebp
 0041DA44    push        41DAD9
 0041DA49    push        dword ptr fs:[edx]
 0041DA4C    mov         dword ptr fs:[edx],esp
 0041DA4F    xor         esi,esi
>0041DA51    jmp         0041DABE
 0041DA53    mov         edx,esi
 0041DA55    mov         eax,edi
 0041DA57    call        TList.Get
 0041DA5C    mov         ebx,eax
 0041DA5E    mov         eax,dword ptr [ebx+10]
 0041DA61    call        FindGlobalComponent
 0041DA66    mov         dword ptr [ebp-0C],eax
 0041DA69    cmp         dword ptr [ebp-0C],0
>0041DA6D    jne         0041DA7E
 0041DA6F    mov         edx,dword ptr [ebx+0C]
 0041DA72    mov         eax,dword ptr [ebx+4]
 0041DA75    call        GetOrdProp
 0041DA7A    test        eax,eax
>0041DA7C    je          0041DAB3
 0041DA7E    cmp         dword ptr [ebp-0C],0
>0041DA82    je          0041DA97
 0041DA84    mov         edx,dword ptr [ebx+14]
 0041DA87    mov         eax,dword ptr [ebp-0C]
 0041DA8A    call        FindNestedComponent
 0041DA8F    mov         edx,eax
 0041DA91    mov         eax,ebx
 0041DA93    mov         ecx,dword ptr [eax]
 0041DA95    call        dword ptr [ecx]
 0041DA97    push        ebp
 0041DA98    mov         eax,dword ptr [ebx+4]
 0041DA9B    call        AddFinished
 0041DAA0    pop         ecx
 0041DAA1    mov         edx,esi
 0041DAA3    mov         eax,edi
 0041DAA5    call        TList.Delete
 0041DAAA    mov         eax,ebx
 0041DAAC    call        TObject.Free
>0041DAB1    jmp         0041DABE
 0041DAB3    push        ebp
 0041DAB4    mov         eax,dword ptr [ebx+4]
 0041DAB7    call        AddNotFinished
 0041DABC    pop         ecx
 0041DABD    inc         esi
 0041DABE    cmp         esi,dword ptr [edi+8]
>0041DAC1    jl          0041DA53
 0041DAC3    xor         eax,eax
 0041DAC5    pop         edx
 0041DAC6    pop         ecx
 0041DAC7    pop         ecx
 0041DAC8    mov         dword ptr fs:[eax],edx
 0041DACB    push        41DAE0
 0041DAD0    mov         eax,dword ptr [ebp-8]
 0041DAD3    call        TObject.Free
 0041DAD8    ret
>0041DAD9    jmp         @HandleFinally
>0041DADE    jmp         0041DAD0
 0041DAE0    mov         eax,dword ptr [ebp-4]
 0041DAE3    mov         ebx,dword ptr [eax+8]
 0041DAE6    dec         ebx
 0041DAE7    test        ebx,ebx
>0041DAE9    jl          0041DB15
 0041DAEB    inc         ebx
 0041DAEC    xor         esi,esi
 0041DAEE    mov         edx,esi
 0041DAF0    mov         eax,dword ptr [ebp-4]
 0041DAF3    call        TList.Get
 0041DAF8    mov         edi,eax
 0041DAFA    mov         eax,edi
 0041DAFC    mov         edx,dword ptr ds:[418C6C];TComponent
 0041DB02    call        @IsClass
 0041DB07    test        al,al
>0041DB09    je          0041DB11
 0041DB0B    and         word ptr [edi+1C],0FF7F
 0041DB11    inc         esi
 0041DB12    dec         ebx
>0041DB13    jne         0041DAEE
 0041DB15    xor         eax,eax
 0041DB17    pop         edx
 0041DB18    pop         ecx
 0041DB19    pop         ecx
 0041DB1A    mov         dword ptr fs:[eax],edx
 0041DB1D    push        41DB32
 0041DB22    mov         eax,dword ptr [ebp-4]
 0041DB25    call        TObject.Free
 0041DB2A    ret
>0041DB2B    jmp         @HandleFinally
>0041DB30    jmp         0041DB22
 0041DB32    xor         eax,eax
 0041DB34    pop         edx
 0041DB35    pop         ecx
 0041DB36    pop         ecx
 0041DB37    mov         dword ptr fs:[eax],edx
 0041DB3A    push        41DB51
 0041DB3F    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041DB44    call        TThreadList.UnlockList
 0041DB49    ret
>0041DB4A    jmp         @HandleFinally
>0041DB4F    jmp         0041DB3F
 0041DB51    xor         eax,eax
 0041DB53    pop         edx
 0041DB54    pop         ecx
 0041DB55    pop         ecx
 0041DB56    mov         dword ptr fs:[eax],edx
 0041DB59    push        41DB70
 0041DB5E    mov         eax,[005E0918];GlobalNameSpace:IReadWriteSync
 0041DB63    mov         edx,dword ptr [eax]
 0041DB65    call        dword ptr [edx+18]
 0041DB68    ret
>0041DB69    jmp         @HandleFinally
>0041DB6E    jmp         0041DB5E
 0041DB70    pop         edi
 0041DB71    pop         esi
 0041DB72    pop         ebx
 0041DB73    mov         esp,ebp
 0041DB75    pop         ebp
 0041DB76    ret
*}
end;

//0041DB78
procedure RemoveFixupReferences(Root:TComponent; const RootName:AnsiString);
begin
{*
 0041DB78    push        ebp
 0041DB79    mov         ebp,esp
 0041DB7B    add         esp,0FFFFFFF8
 0041DB7E    push        ebx
 0041DB7F    push        esi
 0041DB80    push        edi
 0041DB81    mov         dword ptr [ebp-8],edx
 0041DB84    mov         dword ptr [ebp-4],eax
 0041DB87    cmp         dword ptr ds:[5E0934],0;GlobalFixupList:TThreadList
>0041DB8E    je          0041DC1A
 0041DB94    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041DB99    call        TThreadList.LockList
 0041DB9E    mov         edi,eax
 0041DBA0    xor         eax,eax
 0041DBA2    push        ebp
 0041DBA3    push        41DC13
 0041DBA8    push        dword ptr fs:[eax]
 0041DBAB    mov         dword ptr fs:[eax],esp
 0041DBAE    mov         ebx,dword ptr [edi+8]
 0041DBB1    dec         ebx
 0041DBB2    cmp         ebx,0
>0041DBB5    jl          0041DBFB
 0041DBB7    mov         edx,ebx
 0041DBB9    mov         eax,edi
 0041DBBB    call        TList.Get
 0041DBC0    mov         esi,eax
 0041DBC2    cmp         dword ptr [ebp-4],0
>0041DBC6    je          0041DBD0
 0041DBC8    mov         eax,dword ptr [esi+8]
 0041DBCB    cmp         eax,dword ptr [ebp-4]
>0041DBCE    jne         0041DBF5
 0041DBD0    cmp         dword ptr [ebp-8],0
>0041DBD4    je          0041DBE5
 0041DBD6    mov         edx,dword ptr [esi+10]
 0041DBD9    mov         eax,dword ptr [ebp-8]
 0041DBDC    call        SameText
 0041DBE1    test        al,al
>0041DBE3    je          0041DBF5
 0041DBE5    mov         edx,ebx
 0041DBE7    mov         eax,edi
 0041DBE9    call        TList.Delete
 0041DBEE    mov         eax,esi
 0041DBF0    call        TObject.Free
 0041DBF5    dec         ebx
 0041DBF6    cmp         ebx,0FFFFFFFF
>0041DBF9    jne         0041DBB7
 0041DBFB    xor         eax,eax
 0041DBFD    pop         edx
 0041DBFE    pop         ecx
 0041DBFF    pop         ecx
 0041DC00    mov         dword ptr fs:[eax],edx
 0041DC03    push        41DC1A
 0041DC08    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041DC0D    call        TThreadList.UnlockList
 0041DC12    ret
>0041DC13    jmp         @HandleFinally
>0041DC18    jmp         0041DC08
 0041DC1A    pop         edi
 0041DC1B    pop         esi
 0041DC1C    pop         ebx
 0041DC1D    pop         ecx
 0041DC1E    pop         ecx
 0041DC1F    pop         ebp
 0041DC20    ret
*}
end;

//0041DC24
procedure TMemoryStream.Clear;
begin
{*
 0041DC24    push        ebp
 0041DC25    mov         ebp,esp
 0041DC27    push        ecx
 0041DC28    push        ebx
 0041DC29    push        esi
 0041DC2A    push        edi
 0041DC2B    mov         dword ptr [ebp-4],eax
 0041DC2E    cmp         dword ptr ds:[5E0934],0;GlobalFixupList:TThreadList
>0041DC35    je          0041DCA2
 0041DC37    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041DC3C    call        TThreadList.LockList
 0041DC41    mov         edi,eax
 0041DC43    xor         eax,eax
 0041DC45    push        ebp
 0041DC46    push        41DC9B
 0041DC4B    push        dword ptr fs:[eax]
 0041DC4E    mov         dword ptr fs:[eax],esp
 0041DC51    mov         ebx,dword ptr [edi+8]
 0041DC54    dec         ebx
 0041DC55    cmp         ebx,0
>0041DC58    jl          0041DC83
 0041DC5A    mov         edx,ebx
 0041DC5C    mov         eax,edi
 0041DC5E    call        TList.Get
 0041DC63    mov         esi,eax
 0041DC65    mov         eax,dword ptr [esi+4]
 0041DC68    cmp         eax,dword ptr [ebp-4]
>0041DC6B    jne         0041DC7D
 0041DC6D    mov         edx,ebx
 0041DC6F    mov         eax,edi
 0041DC71    call        TList.Delete
 0041DC76    mov         eax,esi
 0041DC78    call        TObject.Free
 0041DC7D    dec         ebx
 0041DC7E    cmp         ebx,0FFFFFFFF
>0041DC81    jne         0041DC5A
 0041DC83    xor         eax,eax
 0041DC85    pop         edx
 0041DC86    pop         ecx
 0041DC87    pop         ecx
 0041DC88    mov         dword ptr fs:[eax],edx
 0041DC8B    push        41DCA2
 0041DC90    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041DC95    call        TThreadList.UnlockList
 0041DC9A    ret
>0041DC9B    jmp         @HandleFinally
>0041DCA0    jmp         0041DC90
 0041DCA2    pop         edi
 0041DCA3    pop         esi
 0041DCA4    pop         ebx
 0041DCA5    pop         ecx
 0041DCA6    pop         ebp
 0041DCA7    ret
*}
end;

//0041DCA8
procedure ReadError(Ident:PResStringRec);
begin
{*
 0041DCA8    push        ebx
 0041DCA9    mov         ebx,eax
 0041DCAB    mov         ecx,ebx
 0041DCAD    mov         dl,1
 0041DCAF    mov         eax,[0041795C];EReadError
 0041DCB4    call        Exception.CreateRes
 0041DCB9    call        @RaiseExcept
 0041DCBE    pop         ebx
 0041DCBF    ret
*}
end;

//0041DCC0
procedure PropValueError;
begin
{*
 0041DCC0    mov         eax,[005AE548];^SInvalidProperty:TResStringRec
 0041DCC5    call        ReadError
 0041DCCA    ret
*}
end;

//0041DCCC
procedure PropertyNotFound(const Name:AnsiString);
begin
{*
 0041DCCC    push        ebx
 0041DCCD    add         esp,0FFFFFFF8
 0041DCD0    mov         ebx,eax
 0041DCD2    mov         dword ptr [esp],ebx
 0041DCD5    mov         byte ptr [esp+4],0B
 0041DCDA    push        esp
 0041DCDB    push        0
 0041DCDD    mov         ecx,dword ptr ds:[5AE22C];^SUnknownProperty:TResStringRec
 0041DCE3    mov         dl,1
 0041DCE5    mov         eax,[0041795C];EReadError
 0041DCEA    call        Exception.CreateResFmt
 0041DCEF    call        @RaiseExcept
 0041DCF4    pop         ecx
 0041DCF5    pop         edx
 0041DCF6    pop         ebx
 0041DCF7    ret
*}
end;

//0041DCF8
function EnumValue(EnumType:PTypeInfo; const EnumName:AnsiString):Integer;
begin
{*
 0041DCF8    push        ebx
 0041DCF9    call        GetEnumValue
 0041DCFE    mov         ebx,eax
 0041DD00    cmp         ebx,0FFFFFFFF
>0041DD03    jne         0041DD0A
 0041DD05    call        PropValueError
 0041DD0A    mov         eax,ebx
 0041DD0C    pop         ebx
 0041DD0D    ret
*}
end;

//0041DD10
destructor TReader.Destroy;
begin
{*
 0041DD10    push        ebx
 0041DD11    push        esi
 0041DD12    push        edi
 0041DD13    call        @BeforeDestruction
 0041DD18    mov         ebx,edx
 0041DD1A    mov         esi,eax
 0041DD1C    mov         edx,dword ptr [esi+10]
 0041DD1F    sub         edx,dword ptr [esi+14]
 0041DD22    mov         eax,dword ptr [esi+4]
 0041DD25    mov         cx,1
 0041DD29    mov         edi,dword ptr [eax]
 0041DD2B    call        dword ptr [edi+14]
 0041DD2E    mov         edx,ebx
 0041DD30    and         dl,0FC
 0041DD33    mov         eax,esi
 0041DD35    call        TFiler.Destroy
 0041DD3A    test        bl,bl
>0041DD3C    jle         0041DD45
 0041DD3E    mov         eax,esi
 0041DD40    call        @ClassDestroy
 0041DD45    pop         edi
 0041DD46    pop         esi
 0041DD47    pop         ebx
 0041DD48    ret
*}
end;

//0041DD4C
procedure TReader.CheckValue(Value:TValueType);
begin
{*
 0041DD4C    push        ebx
 0041DD4D    push        esi
 0041DD4E    mov         ebx,edx
 0041DD50    mov         esi,eax
 0041DD52    mov         eax,esi
 0041DD54    call        TReader.ReadValue
 0041DD59    cmp         bl,al
>0041DD5B    je          0041DD6C
 0041DD5D    dec         dword ptr [esi+10]
 0041DD60    mov         eax,esi
 0041DD62    call        TReader.SkipValue
 0041DD67    call        PropValueError
 0041DD6C    pop         esi
 0041DD6D    pop         ebx
 0041DD6E    ret
*}
end;

//0041DD70
procedure TReader.DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);
begin
{*
 0041DD70    push        ebp
 0041DD71    mov         ebp,esp
 0041DD73    push        ebx
 0041DD74    push        esi
 0041DD75    mov         esi,edx
 0041DD77    mov         ebx,eax
 0041DD79    mov         edx,dword ptr [ebx+70]
 0041DD7C    mov         eax,esi
 0041DD7E    call        SameText
 0041DD83    test        al,al
>0041DD85    je          0041DD9E
 0041DD87    cmp         word ptr [ebp+12],0
>0041DD8C    je          0041DD9E
 0041DD8E    mov         edx,ebx
 0041DD90    mov         eax,dword ptr [ebp+14]
 0041DD93    call        dword ptr [ebp+10]
 0041DD96    lea         eax,[ebx+70]
 0041DD99    call        @LStrClr
 0041DD9E    pop         esi
 0041DD9F    pop         ebx
 0041DDA0    pop         ebp
 0041DDA1    ret         10
*}
end;

//0041DDA4
procedure TReader.DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);
begin
{*
 0041DDA4    push        ebp
 0041DDA5    mov         ebp,esp
 0041DDA7    add         esp,0FFFFFFF4
 0041DDAA    push        ebx
 0041DDAB    mov         ebx,edx
 0041DDAD    mov         dword ptr [ebp-4],eax
 0041DDB0    mov         eax,dword ptr [ebp-4]
 0041DDB3    mov         edx,dword ptr [eax+70]
 0041DDB6    mov         eax,ebx
 0041DDB8    call        SameText
 0041DDBD    test        al,al
>0041DDBF    je          0041DE77
 0041DDC5    cmp         word ptr [ebp+12],0
>0041DDCA    je          0041DE77
 0041DDD0    mov         eax,dword ptr [ebp-4]
 0041DDD3    call        TReader.ReadValue
 0041DDD8    cmp         al,0A
>0041DDDA    je          0041DDF6
 0041DDDC    mov         eax,dword ptr [ebp-4]
 0041DDDF    dec         dword ptr [eax+10]
 0041DDE2    mov         eax,dword ptr [ebp-4]
 0041DDE5    call        TReader.SkipValue
 0041DDEA    mov         eax,dword ptr [ebp-4]
 0041DDED    mov         byte ptr [eax+78],1
 0041DDF1    call        PropValueError
 0041DDF6    mov         dl,1
 0041DDF8    mov         eax,[00418640];TMemoryStream
 0041DDFD    call        TObject.Create
 0041DE02    mov         dword ptr [ebp-8],eax
 0041DE05    xor         eax,eax
 0041DE07    push        ebp
 0041DE08    push        41DE65
 0041DE0D    push        dword ptr fs:[eax]
 0041DE10    mov         dword ptr fs:[eax],esp
 0041DE13    lea         edx,[ebp-0C]
 0041DE16    mov         ecx,4
 0041DE1B    mov         eax,dword ptr [ebp-4]
 0041DE1E    call        TReader.Read
 0041DE23    mov         edx,dword ptr [ebp-0C]
 0041DE26    mov         eax,dword ptr [ebp-8]
 0041DE29    mov         ecx,dword ptr [eax]
 0041DE2B    call        dword ptr [ecx+4]
 0041DE2E    mov         eax,dword ptr [ebp-8]
 0041DE31    mov         edx,dword ptr [eax+4]
 0041DE34    mov         ecx,dword ptr [ebp-0C]
 0041DE37    mov         eax,dword ptr [ebp-4]
 0041DE3A    call        TReader.Read
 0041DE3F    mov         eax,dword ptr [ebp-4]
 0041DE42    mov         byte ptr [eax+78],1
 0041DE46    mov         edx,dword ptr [ebp-8]
 0041DE49    mov         eax,dword ptr [ebp+14]
 0041DE4C    call        dword ptr [ebp+10]
 0041DE4F    xor         eax,eax
 0041DE51    pop         edx
 0041DE52    pop         ecx
 0041DE53    pop         ecx
 0041DE54    mov         dword ptr fs:[eax],edx
 0041DE57    push        41DE6C
 0041DE5C    mov         eax,dword ptr [ebp-8]
 0041DE5F    call        TObject.Free
 0041DE64    ret
>0041DE65    jmp         @HandleFinally
>0041DE6A    jmp         0041DE5C
 0041DE6C    mov         eax,dword ptr [ebp-4]
 0041DE6F    add         eax,70
 0041DE72    call        @LStrClr
 0041DE77    pop         ebx
 0041DE78    mov         esp,ebp
 0041DE7A    pop         ebp
 0041DE7B    ret         10
*}
end;

//0041DE80
function TReader.EndOfList:Boolean;
begin
{*
 0041DE80    push        ebx
 0041DE81    mov         ebx,eax
 0041DE83    mov         eax,ebx
 0041DE85    call        TReader.ReadValue
 0041DE8A    test        al,al
 0041DE8C    sete        al
 0041DE8F    dec         dword ptr [ebx+10]
 0041DE92    pop         ebx
 0041DE93    ret
*}
end;

//0041DE94
function TReader.Error(const Message:AnsiString):Boolean;
begin
{*
 0041DE94    push        ebx
 0041DE95    push        ecx
 0041DE96    mov         byte ptr [esp],0
 0041DE9A    cmp         word ptr [eax+5A],0
>0041DE9F    je          0041DEAE
 0041DEA1    push        esp
 0041DEA2    mov         ebx,eax
 0041DEA4    mov         ecx,edx
 0041DEA6    mov         edx,eax
 0041DEA8    mov         eax,dword ptr [ebx+5C]
 0041DEAB    call        dword ptr [ebx+58]
 0041DEAE    mov         al,byte ptr [esp]
 0041DEB1    pop         edx
 0041DEB2    pop         ebx
 0041DEB3    ret
*}
end;

//0041DEB4
function TReader.FindMethod(Root:TComponent; const MethodName:AnsiString):Pointer;
begin
{*
 0041DEB4    push        ebx
 0041DEB5    push        esi
 0041DEB6    push        edi
 0041DEB7    add         esp,0FFFFFEF8
 0041DEBD    mov         esi,ecx
 0041DEBF    mov         edi,edx
 0041DEC1    mov         ebx,eax
 0041DEC3    lea         eax,[esp+8]
 0041DEC7    mov         edx,esi
 0041DEC9    mov         ecx,0FF
 0041DECE    call        @LStrToString
 0041DED3    lea         edx,[esp+8]
 0041DED7    mov         eax,dword ptr [edi]
 0041DED9    call        TObject.MethodAddress
 0041DEDE    mov         dword ptr [esp],eax
 0041DEE1    cmp         dword ptr [esp],0
 0041DEE5    sete        byte ptr [esp+4]
 0041DEEA    cmp         word ptr [ebx+3A],0
>0041DEEF    je          0041DF01
 0041DEF1    push        esp
 0041DEF2    lea         eax,[esp+8]
 0041DEF6    push        eax
 0041DEF7    mov         ecx,esi
 0041DEF9    mov         edx,ebx
 0041DEFB    mov         eax,dword ptr [ebx+3C]
 0041DEFE    call        dword ptr [ebx+38]
 0041DF01    cmp         byte ptr [esp+4],0
>0041DF06    je          0041DF0D
 0041DF08    call        PropValueError
 0041DF0D    mov         eax,dword ptr [esp]
 0041DF10    add         esp,108
 0041DF16    pop         edi
 0041DF17    pop         esi
 0041DF18    pop         ebx
 0041DF19    ret
*}
end;

//0041DF1C
procedure RemoveGlobalFixup(Fixup:TPropFixup);
begin
{*
 0041DF1C    push        ebp
 0041DF1D    mov         ebp,esp
 0041DF1F    push        ebx
 0041DF20    push        esi
 0041DF21    push        edi
 0041DF22    mov         edi,eax
 0041DF24    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041DF29    call        TThreadList.LockList
 0041DF2E    mov         esi,eax
 0041DF30    xor         edx,edx
 0041DF32    push        ebp
 0041DF33    push        41DF8C
 0041DF38    push        dword ptr fs:[edx]
 0041DF3B    mov         dword ptr fs:[edx],esp
 0041DF3E    mov         ebx,dword ptr [esi+8]
 0041DF41    dec         ebx
 0041DF42    cmp         ebx,0
>0041DF45    jl          0041DF74
 0041DF47    mov         edx,ebx
 0041DF49    mov         eax,esi
 0041DF4B    call        TList.Get
 0041DF50    mov         edx,dword ptr [eax+4]
 0041DF53    cmp         edx,dword ptr [edi+4]
>0041DF56    jne         0041DF6E
 0041DF58    mov         edx,dword ptr [eax+0C]
 0041DF5B    cmp         edx,dword ptr [edi+0C]
>0041DF5E    jne         0041DF6E
 0041DF60    call        TObject.Free
 0041DF65    mov         edx,ebx
 0041DF67    mov         eax,esi
 0041DF69    call        TList.Delete
 0041DF6E    dec         ebx
 0041DF6F    cmp         ebx,0FFFFFFFF
>0041DF72    jne         0041DF47
 0041DF74    xor         eax,eax
 0041DF76    pop         edx
 0041DF77    pop         ecx
 0041DF78    pop         ecx
 0041DF79    mov         dword ptr fs:[eax],edx
 0041DF7C    push        41DF93
 0041DF81    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041DF86    call        TThreadList.UnlockList
 0041DF8B    ret
>0041DF8C    jmp         @HandleFinally
>0041DF91    jmp         0041DF81
 0041DF93    pop         edi
 0041DF94    pop         esi
 0041DF95    pop         ebx
 0041DF96    pop         ebp
 0041DF97    ret
*}
end;

//0041DF98
procedure TReader.DoFixupReferences;
begin
{*
 0041DF98    push        ebp
 0041DF99    mov         ebp,esp
 0041DF9B    add         esp,0FFFFFFF4
 0041DF9E    push        ebx
 0041DF9F    push        esi
 0041DFA0    push        edi
 0041DFA1    xor         edx,edx
 0041DFA3    mov         dword ptr [ebp-8],edx
 0041DFA6    mov         dword ptr [ebp-4],eax
 0041DFA9    xor         eax,eax
 0041DFAB    push        ebp
 0041DFAC    push        41E0A7
 0041DFB1    push        dword ptr fs:[eax]
 0041DFB4    mov         dword ptr fs:[eax],esp
 0041DFB7    mov         eax,dword ptr [ebp-4]
 0041DFBA    mov         eax,dword ptr [eax+30]
 0041DFBD    test        eax,eax
>0041DFBF    je          0041E091
 0041DFC5    xor         edx,edx
 0041DFC7    push        ebp
 0041DFC8    push        41E08A
 0041DFCD    push        dword ptr fs:[edx]
 0041DFD0    mov         dword ptr fs:[edx],esp
 0041DFD3    mov         eax,dword ptr [eax+8]
 0041DFD6    dec         eax
 0041DFD7    test        eax,eax
>0041DFD9    jl          0041E074
 0041DFDF    inc         eax
 0041DFE0    mov         dword ptr [ebp-0C],eax
 0041DFE3    xor         esi,esi
 0041DFE5    mov         eax,dword ptr [ebp-4]
 0041DFE8    mov         eax,dword ptr [eax+30]
 0041DFEB    mov         edx,esi
 0041DFED    call        TList.Get
 0041DFF2    mov         ebx,eax
 0041DFF4    lea         eax,[ebp-8]
 0041DFF7    mov         edx,dword ptr [ebx+14]
 0041DFFA    call        @LStrLAsg
 0041DFFF    lea         edx,[ebp-8]
 0041E002    mov         eax,dword ptr [ebp-4]
 0041E005    mov         ecx,dword ptr [eax]
 0041E007    call        dword ptr [ecx+20]
 0041E00A    mov         eax,dword ptr [ebx+8]
 0041E00D    mov         edx,dword ptr [ebp-8]
 0041E010    call        FindNestedComponent
 0041E015    mov         edi,eax
 0041E017    mov         eax,dword ptr [ebp-4]
 0041E01A    mov         eax,dword ptr [eax+30]
 0041E01D    mov         edx,esi
 0041E01F    call        TList.Get
 0041E024    call        RemoveGlobalFixup
 0041E029    test        edi,edi
>0041E02B    jne         0041E062
 0041E02D    mov         eax,ebx
 0041E02F    call        TPropFixup.MakeGlobalReference
 0041E034    test        al,al
>0041E036    je          0041E062
 0041E038    mov         eax,dword ptr [ebp-4]
 0041E03B    mov         eax,dword ptr [eax+30]
 0041E03E    mov         edx,esi
 0041E040    call        TList.Get
 0041E045    mov         edx,eax
 0041E047    mov         eax,[005E0934];GlobalFixupList:TThreadList
 0041E04C    call        TThreadList.Add
 0041E051    mov         eax,dword ptr [ebp-4]
 0041E054    mov         eax,dword ptr [eax+30]
 0041E057    xor         ecx,ecx
 0041E059    mov         edx,esi
 0041E05B    call        TList.Put
>0041E060    jmp         0041E06A
 0041E062    mov         edx,edi
 0041E064    mov         eax,ebx
 0041E066    mov         ecx,dword ptr [eax]
 0041E068    call        dword ptr [ecx]
 0041E06A    inc         esi
 0041E06B    dec         dword ptr [ebp-0C]
>0041E06E    jne         0041DFE5
 0041E074    xor         eax,eax
 0041E076    pop         edx
 0041E077    pop         ecx
 0041E078    pop         ecx
 0041E079    mov         dword ptr fs:[eax],edx
 0041E07C    push        41E091
 0041E081    mov         eax,dword ptr [ebp-4]
 0041E084    call        TReader.FreeFixups
 0041E089    ret
>0041E08A    jmp         @HandleFinally
>0041E08F    jmp         0041E081
 0041E091    xor         eax,eax
 0041E093    pop         edx
 0041E094    pop         ecx
 0041E095    pop         ecx
 0041E096    mov         dword ptr fs:[eax],edx
 0041E099    push        41E0AE
 0041E09E    lea         eax,[ebp-8]
 0041E0A1    call        @LStrClr
 0041E0A6    ret
>0041E0A7    jmp         @HandleFinally
>0041E0AC    jmp         0041E09E
 0041E0AE    pop         edi
 0041E0AF    pop         esi
 0041E0B0    pop         ebx
 0041E0B1    mov         esp,ebp
 0041E0B3    pop         ebp
 0041E0B4    ret
*}
end;

//0041E0B8
procedure TReader.FlushBuffer;
begin
{*
 0041E0B8    push        ebx
 0041E0B9    mov         ebx,eax
 0041E0BB    mov         eax,ebx
 0041E0BD    call        TReader.GetPosition
 0041E0C2    cdq
 0041E0C3    push        edx
 0041E0C4    push        eax
 0041E0C5    mov         eax,dword ptr [ebx+4]
 0041E0C8    call        TStream.SetPosition
 0041E0CD    xor         eax,eax
 0041E0CF    mov         dword ptr [ebx+10],eax
 0041E0D2    xor         eax,eax
 0041E0D4    mov         dword ptr [ebx+14],eax
 0041E0D7    pop         ebx
 0041E0D8    ret
*}
end;

//0041E0DC
procedure TReader.FreeFixups;
begin
{*
 0041E0DC    push        ebx
 0041E0DD    push        esi
 0041E0DE    push        edi
 0041E0DF    mov         ebx,eax
 0041E0E1    mov         eax,dword ptr [ebx+30]
 0041E0E4    test        eax,eax
>0041E0E6    je          0041E113
 0041E0E8    mov         esi,dword ptr [eax+8]
 0041E0EB    dec         esi
 0041E0EC    test        esi,esi
>0041E0EE    jl          0041E106
 0041E0F0    inc         esi
 0041E0F1    xor         edi,edi
 0041E0F3    mov         edx,edi
 0041E0F5    mov         eax,dword ptr [ebx+30]
 0041E0F8    call        TList.Get
 0041E0FD    call        TObject.Free
 0041E102    inc         edi
 0041E103    dec         esi
>0041E104    jne         0041E0F3
 0041E106    mov         eax,dword ptr [ebx+30]
 0041E109    call        TObject.Free
 0041E10E    xor         eax,eax
 0041E110    mov         dword ptr [ebx+30],eax
 0041E113    pop         edi
 0041E114    pop         esi
 0041E115    pop         ebx
 0041E116    ret
*}
end;

//0041E118
function TReader.GetFieldClass(Instance:TObject; const ClassName:AnsiString):TPersistentClass;
begin
{*
 0041E118    push        ebx
 0041E119    push        esi
 0041E11A    push        edi
 0041E11B    push        ebp
 0041E11C    add         esp,0FFFFFFF4
 0041E11F    mov         dword ptr [esp+4],ecx
 0041E123    mov         dword ptr [esp],eax
 0041E126    mov         eax,edx
 0041E128    call        TObject.ClassType
 0041E12D    mov         ebp,eax
>0041E12F    jmp         0041E178
 0041E131    mov         eax,ebp
 0041E133    call        GetFieldClassTable
 0041E138    mov         esi,eax
 0041E13A    test        esi,esi
>0041E13C    je          0041E16F
 0041E13E    movsx       ebx,word ptr [esi]
 0041E141    dec         ebx
 0041E142    test        ebx,ebx
>0041E144    jl          0041E16F
 0041E146    inc         ebx
 0041E147    mov         dword ptr [esp+8],0
 0041E14F    mov         eax,dword ptr [esp+8]
 0041E153    mov         eax,dword ptr [esi+eax*4+2]
 0041E157    mov         edi,dword ptr [eax]
 0041E159    mov         edx,dword ptr [esp+4]
 0041E15D    mov         eax,edi
 0041E15F    call        TObject.ClassNameIs
 0041E164    test        al,al
>0041E166    jne         0041E1A2
 0041E168    inc         dword ptr [esp+8]
 0041E16C    dec         ebx
>0041E16D    jne         0041E14F
 0041E16F    mov         eax,ebp
 0041E171    call        TObject.ClassParent
 0041E176    mov         ebp,eax
 0041E178    cmp         ebp,dword ptr ds:[417DFC];TPersistent
>0041E17E    jne         0041E131
 0041E180    mov         eax,dword ptr [esp]
 0041E183    mov         eax,dword ptr [eax+74]
 0041E186    test        eax,eax
>0041E188    je          0041E197
 0041E18A    mov         edx,dword ptr [esp+4]
 0041E18E    call        TClassFinder.GetClass
 0041E193    mov         edi,eax
>0041E195    jmp         0041E1A2
 0041E197    mov         eax,dword ptr [esp+4]
 0041E19B    call        GetClass
 0041E1A0    mov         edi,eax
 0041E1A2    mov         eax,edi
 0041E1A4    add         esp,0C
 0041E1A7    pop         ebp
 0041E1A8    pop         edi
 0041E1A9    pop         esi
 0041E1AA    pop         ebx
 0041E1AB    ret
*}
end;

//0041E1AC
function TReader.GetPosition:Longint;
begin
{*
 0041E1AC    push        ebx
 0041E1AD    mov         ebx,eax
 0041E1AF    mov         eax,dword ptr [ebx+4]
 0041E1B2    call        TStream.GetPosition
 0041E1B7    mov         edx,dword ptr [ebx+14]
 0041E1BA    sub         edx,dword ptr [ebx+10]
 0041E1BD    sub         eax,edx
 0041E1BF    pop         ebx
 0041E1C0    ret
*}
end;

//0041E1C4
function TReader.NextValue:TValueType;
begin
{*
 0041E1C4    push        ebx
 0041E1C5    mov         ebx,eax
 0041E1C7    mov         eax,ebx
 0041E1C9    call        TReader.ReadValue
 0041E1CE    dec         dword ptr [ebx+10]
 0041E1D1    pop         ebx
 0041E1D2    ret
*}
end;

//0041E1D4
procedure TReader.PropertyError(const Name:AnsiString);
begin
{*
 0041E1D4    push        ebx
 0041E1D5    mov         ebx,edx
 0041E1D7    call        TReader.SkipValue
 0041E1DC    mov         eax,ebx
 0041E1DE    call        PropertyNotFound
 0041E1E3    pop         ebx
 0041E1E4    ret
*}
end;

//0041E1E8
procedure TReader.Read(var Buf:void ; Count:Longint);
begin
{*
 0041E1E8    push        esi
 0041E1E9    push        edi
 0041E1EA    push        ebx
 0041E1EB    mov         edi,edx
 0041E1ED    mov         ebx,ecx
 0041E1EF    mov         esi,eax
>0041E1F1    jmp         0041E229
 0041E1F3    mov         ecx,dword ptr [esi+14]
 0041E1F6    sub         ecx,dword ptr [esi+10]
>0041E1F9    ja          0041E205
 0041E1FB    mov         eax,esi
 0041E1FD    call        TReader.ReadBuffer
 0041E202    mov         ecx,dword ptr [esi+14]
 0041E205    cmp         ecx,ebx
>0041E207    jb          0041E20B
 0041E209    mov         ecx,ebx
 0041E20B    push        esi
 0041E20C    sub         ebx,ecx
 0041E20E    mov         eax,dword ptr [esi+8]
 0041E211    add         eax,dword ptr [esi+10]
 0041E214    add         dword ptr [esi+10],ecx
 0041E217    mov         esi,eax
 0041E219    mov         edx,ecx
 0041E21B    shr         ecx,2
 0041E21E    cld
 0041E21F    rep movs    dword ptr [edi],dword ptr [esi]
 0041E221    mov         ecx,edx
 0041E223    and         ecx,3
 0041E226    rep movs    byte ptr [edi],byte ptr [esi]
 0041E228    pop         esi
 0041E229    or          ebx,ebx
>0041E22B    jne         0041E1F3
 0041E22D    pop         ebx
 0041E22E    pop         edi
 0041E22F    pop         esi
 0041E230    ret
*}
end;

//0041E234
procedure TReader.ReadBuffer;
begin
{*
 0041E234    push        ebx
 0041E235    push        esi
 0041E236    mov         ebx,eax
 0041E238    mov         edx,dword ptr [ebx+8]
 0041E23B    mov         ecx,dword ptr [ebx+0C]
 0041E23E    mov         eax,dword ptr [ebx+4]
 0041E241    mov         esi,dword ptr [eax]
 0041E243    call        dword ptr [esi+0C]
 0041E246    mov         esi,eax
 0041E248    mov         dword ptr [ebx+14],esi
 0041E24B    test        esi,esi
>0041E24D    jne         0041E266
 0041E24F    mov         ecx,dword ptr ds:[5AE708];^SReadError:TResStringRec
 0041E255    mov         dl,1
 0041E257    mov         eax,[0041795C];EReadError
 0041E25C    call        Exception.CreateRes
 0041E261    call        @RaiseExcept
 0041E266    xor         eax,eax
 0041E268    mov         dword ptr [ebx+10],eax
 0041E26B    pop         esi
 0041E26C    pop         ebx
 0041E26D    ret
*}
end;

//0041E270
function TReader.ReadBoolean:Boolean;
begin
{*
 0041E270    push        ebx
 0041E271    mov         ebx,eax
 0041E273    mov         eax,ebx
 0041E275    call        TReader.ReadValue
 0041E27A    cmp         al,9
 0041E27C    sete        al
 0041E27F    pop         ebx
 0041E280    ret
*}
end;

//0041E284
function TReader.ReadChar:Char;
begin
{*
 0041E284    push        ebp
 0041E285    mov         ebp,esp
 0041E287    push        0
 0041E289    push        ebx
 0041E28A    mov         ebx,eax
 0041E28C    xor         eax,eax
 0041E28E    push        ebp
 0041E28F    push        41E2CF
 0041E294    push        dword ptr fs:[eax]
 0041E297    mov         dword ptr fs:[eax],esp
 0041E29A    lea         edx,[ebp-4]
 0041E29D    mov         eax,ebx
 0041E29F    call        TReader.ReadString
 0041E2A4    mov         eax,dword ptr [ebp-4]
 0041E2A7    call        @LStrLen
 0041E2AC    dec         eax
>0041E2AD    jle         0041E2B4
 0041E2AF    call        PropValueError
 0041E2B4    mov         eax,dword ptr [ebp-4]
 0041E2B7    mov         bl,byte ptr [eax]
 0041E2B9    xor         eax,eax
 0041E2BB    pop         edx
 0041E2BC    pop         ecx
 0041E2BD    pop         ecx
 0041E2BE    mov         dword ptr fs:[eax],edx
 0041E2C1    push        41E2D6
 0041E2C6    lea         eax,[ebp-4]
 0041E2C9    call        @LStrClr
 0041E2CE    ret
>0041E2CF    jmp         @HandleFinally
>0041E2D4    jmp         0041E2C6
 0041E2D6    mov         eax,ebx
 0041E2D8    pop         ebx
 0041E2D9    pop         ecx
 0041E2DA    pop         ebp
 0041E2DB    ret
*}
end;

//0041E2DC
procedure TReader.ReadCollection(Collection:TCollection);
begin
{*
 0041E2DC    push        ebp
 0041E2DD    mov         ebp,esp
 0041E2DF    push        ecx
 0041E2E0    push        ebx
 0041E2E1    push        esi
 0041E2E2    mov         dword ptr [ebp-4],edx
 0041E2E5    mov         ebx,eax
 0041E2E7    mov         eax,dword ptr [ebp-4]
 0041E2EA    mov         edx,dword ptr [eax]
 0041E2EC    call        dword ptr [edx+20]
 0041E2EF    xor         eax,eax
 0041E2F1    push        ebp
 0041E2F2    push        41E37C
 0041E2F7    push        dword ptr fs:[eax]
 0041E2FA    mov         dword ptr fs:[eax],esp
 0041E2FD    mov         eax,ebx
 0041E2FF    call        TReader.EndOfList
 0041E304    test        al,al
>0041E306    jne         0041E354
 0041E308    mov         eax,dword ptr [ebp-4]
 0041E30B    call        TCollection.Clear
>0041E310    jmp         0041E354
 0041E312    mov         eax,ebx
 0041E314    call        TReader.NextValue
 0041E319    add         al,0FE
 0041E31B    sub         al,3
>0041E31D    jae         0041E326
 0041E31F    mov         eax,ebx
 0041E321    call        TReader.ReadInteger
 0041E326    mov         eax,dword ptr [ebp-4]
 0041E329    call        TCollection.Add
 0041E32E    mov         esi,eax
 0041E330    mov         eax,ebx
 0041E332    call        TReader.ReadListBegin
>0041E337    jmp         0041E342
 0041E339    mov         edx,esi
 0041E33B    mov         eax,ebx
 0041E33D    call        TReader.ReadProperty
 0041E342    mov         eax,ebx
 0041E344    call        TReader.EndOfList
 0041E349    test        al,al
>0041E34B    je          0041E339
 0041E34D    mov         eax,ebx
 0041E34F    call        TReader.ReadListEnd
 0041E354    mov         eax,ebx
 0041E356    call        TReader.EndOfList
 0041E35B    test        al,al
>0041E35D    je          0041E312
 0041E35F    mov         eax,ebx
 0041E361    call        TReader.ReadListEnd
 0041E366    xor         eax,eax
 0041E368    pop         edx
 0041E369    pop         ecx
 0041E36A    pop         ecx
 0041E36B    mov         dword ptr fs:[eax],edx
 0041E36E    push        41E383
 0041E373    mov         eax,dword ptr [ebp-4]
 0041E376    mov         edx,dword ptr [eax]
 0041E378    call        dword ptr [edx+24]
 0041E37B    ret
>0041E37C    jmp         @HandleFinally
>0041E381    jmp         0041E373
 0041E383    pop         esi
 0041E384    pop         ebx
 0041E385    pop         ecx
 0041E386    pop         ebp
 0041E387    ret
*}
end;

//0041E3AC
procedure AddSubComponentsToLoaded(Component:TComponent);
begin
{*
 0041E3AC    push        ebp
 0041E3AD    mov         ebp,esp
 0041E3AF    push        ebx
 0041E3B0    push        esi
 0041E3B1    mov         eax,dword ptr [ebp+8]
 0041E3B4    mov         eax,dword ptr [eax-4]
 0041E3B7    call        @DynArrayLength
 0041E3BC    mov         ebx,eax
 0041E3BE    dec         ebx
 0041E3BF    test        ebx,ebx
>0041E3C1    jl          0041E3E1
 0041E3C3    inc         ebx
 0041E3C4    xor         esi,esi
 0041E3C6    mov         eax,dword ptr [ebp+8]
 0041E3C9    mov         eax,dword ptr [eax-4]
 0041E3CC    mov         edx,dword ptr [eax+esi*4]
 0041E3CF    mov         eax,dword ptr [ebp+8]
 0041E3D2    mov         eax,dword ptr [eax-8]
 0041E3D5    mov         eax,dword ptr [eax+34]
 0041E3D8    call        TList.Add
 0041E3DD    inc         esi
 0041E3DE    dec         ebx
>0041E3DF    jne         0041E3C6
 0041E3E1    pop         esi
 0041E3E2    pop         ebx
 0041E3E3    pop         ebp
 0041E3E4    ret
*}
end;

//0041E3E8
procedure CheckSubComponents(Component:TComponent);
begin
{*
 0041E3E8    push        ebp
 0041E3E9    mov         ebp,esp
 0041E3EB    push        ebx
 0041E3EC    push        esi
 0041E3ED    push        edi
 0041E3EE    mov         edi,eax
 0041E3F0    mov         eax,edi
 0041E3F2    call        TComponent.GetComponentCount
 0041E3F7    mov         esi,eax
 0041E3F9    dec         esi
 0041E3FA    test        esi,esi
>0041E3FC    jl          0041E45A
 0041E3FE    inc         esi
 0041E3FF    xor         ebx,ebx
 0041E401    mov         edx,ebx
 0041E403    mov         eax,edi
 0041E405    call        TComponent.GetComponent
 0041E40A    test        byte ptr [eax+24],4
>0041E40E    je          0041E456
 0041E410    mov         eax,dword ptr [ebp+8]
 0041E413    mov         eax,dword ptr [eax-4]
 0041E416    call        @DynArrayLength
 0041E41B    inc         eax
 0041E41C    push        eax
 0041E41D    mov         eax,dword ptr [ebp+8]
 0041E420    add         eax,0FFFFFFFC
 0041E423    mov         ecx,1
 0041E428    mov         edx,dword ptr ds:[41E388];.06
 0041E42E    call        @DynArraySetLength
 0041E433    add         esp,4
 0041E436    mov         edx,ebx
 0041E438    mov         eax,edi
 0041E43A    call        TComponent.GetComponent
 0041E43F    push        eax
 0041E440    mov         eax,dword ptr [ebp+8]
 0041E443    mov         eax,dword ptr [eax-4]
 0041E446    call        @DynArrayLength
 0041E44B    mov         edx,dword ptr [ebp+8]
 0041E44E    mov         edx,dword ptr [edx-4]
 0041E451    pop         ecx
 0041E452    mov         dword ptr [edx+eax*4-4],ecx
 0041E456    inc         ebx
 0041E457    dec         esi
>0041E458    jne         0041E401
 0041E45A    pop         edi
 0041E45B    pop         esi
 0041E45C    pop         ebx
 0041E45D    pop         ebp
 0041E45E    ret
*}
end;

//0041E460
procedure SetSubComponentState(State:TComponentState; Add:Boolean);
begin
{*
 0041E460    push        ebp
 0041E461    mov         ebp,esp
 0041E463    push        ecx
 0041E464    push        ebx
 0041E465    push        esi
 0041E466    push        edi
 0041E467    mov         byte ptr [ebp-3],dl
 0041E46A    mov         word ptr [ebp-2],ax
 0041E46E    mov         eax,dword ptr [ebp+8]
 0041E471    mov         eax,dword ptr [eax-4]
 0041E474    call        @DynArrayLength
 0041E479    mov         esi,eax
 0041E47B    dec         esi
 0041E47C    test        esi,esi
>0041E47E    jl          0041E4C1
 0041E480    inc         esi
 0041E481    xor         ebx,ebx
 0041E483    cmp         byte ptr [ebp-3],0
>0041E487    je          0041E4A3
 0041E489    mov         eax,dword ptr [ebp+8]
 0041E48C    mov         eax,dword ptr [eax-4]
 0041E48F    mov         edi,dword ptr [eax+ebx*4]
 0041E492    mov         ax,word ptr [edi+1C]
 0041E496    or          ax,word ptr [ebp-2]
 0041E49A    mov         edx,dword ptr [ebp+8]
 0041E49D    mov         word ptr [edi+1C],ax
>0041E4A1    jmp         0041E4BD
 0041E4A3    mov         eax,dword ptr [ebp+8]
 0041E4A6    mov         eax,dword ptr [eax-4]
 0041E4A9    mov         edi,dword ptr [eax+ebx*4]
 0041E4AC    mov         ax,word ptr [ebp-2]
 0041E4B0    not         eax
 0041E4B2    and         ax,word ptr [edi+1C]
 0041E4B6    mov         edx,dword ptr [ebp+8]
 0041E4B9    mov         word ptr [edi+1C],ax
 0041E4BD    inc         ebx
 0041E4BE    dec         esi
>0041E4BF    jne         0041E483
 0041E4C1    pop         edi
 0041E4C2    pop         esi
 0041E4C3    pop         ebx
 0041E4C4    pop         ecx
 0041E4C5    pop         ebp
 0041E4C6    ret
*}
end;

//0041E4C8
function ComponentCreated:Boolean;
begin
{*
 0041E4C8    push        ebp
 0041E4C9    mov         ebp,esp
 0041E4CB    mov         eax,dword ptr [ebp+8]
 0041E4CE    test        byte ptr [eax-9],1
>0041E4D2    jne         0041E4DD
 0041E4D4    mov         eax,dword ptr [ebp+8]
 0041E4D7    cmp         dword ptr [eax-10],0
>0041E4DB    je          0041E4E1
 0041E4DD    xor         eax,eax
 0041E4DF    pop         ebp
 0041E4E0    ret
 0041E4E1    mov         al,1
 0041E4E3    pop         ebp
 0041E4E4    ret
*}
end;

//0041E4E8
function Recover(var Component:TComponent):Boolean;
begin
{*
 0041E4E8    push        ebp
 0041E4E9    mov         ebp,esp
 0041E4EB    push        ebx
 0041E4EC    push        esi
 0041E4ED    mov         esi,eax
 0041E4EF    xor         ebx,ebx
 0041E4F1    call        ExceptObject
 0041E4F6    mov         edx,dword ptr ds:[408B30];Exception
 0041E4FC    call        @IsClass
 0041E501    test        al,al
>0041E503    je          0041E540
 0041E505    mov         eax,dword ptr [ebp+8]
 0041E508    push        eax
 0041E509    call        ComponentCreated
 0041E50E    pop         ecx
 0041E50F    test        al,al
>0041E511    je          0041E51A
 0041E513    mov         eax,dword ptr [esi]
 0041E515    call        TObject.Free
 0041E51A    xor         eax,eax
 0041E51C    mov         dword ptr [esi],eax
 0041E51E    mov         eax,dword ptr [ebp+8]
 0041E521    mov         eax,dword ptr [eax-8]
 0041E524    xor         edx,edx
 0041E526    call        TReader.SkipComponent
 0041E52B    call        ExceptObject
 0041E530    mov         edx,dword ptr [eax+4]
 0041E533    mov         eax,dword ptr [ebp+8]
 0041E536    mov         eax,dword ptr [eax-8]
 0041E539    mov         ecx,dword ptr [eax]
 0041E53B    call        dword ptr [ecx+10]
 0041E53E    mov         ebx,eax
 0041E540    mov         eax,ebx
 0041E542    pop         esi
 0041E543    pop         ebx
 0041E544    pop         ebp
 0041E545    ret
*}
end;

//0041E548
procedure CreateComponent;
begin
{*
 0041E548    push        ebp
 0041E549    mov         ebp,esp
 0041E54B    push        ebx
 0041E54C    push        esi
 0041E54D    push        edi
 0041E54E    xor         eax,eax
 0041E550    push        ebp
 0041E551    push        41E62E
 0041E556    push        dword ptr fs:[eax]
 0041E559    mov         dword ptr fs:[eax],esp
 0041E55C    mov         eax,dword ptr [ebp+8]
 0041E55F    mov         edx,dword ptr [eax-18]
 0041E562    mov         eax,dword ptr [ebp+8]
 0041E565    mov         eax,dword ptr [eax-8]
 0041E568    call        TReader.FindComponentClass
 0041E56D    mov         ebx,eax
 0041E56F    mov         eax,dword ptr [ebp+8]
 0041E572    xor         edx,edx
 0041E574    mov         dword ptr [eax-14],edx
 0041E577    mov         eax,dword ptr [ebp+8]
 0041E57A    mov         eax,dword ptr [eax-8]
 0041E57D    cmp         word ptr [eax+6A],0
>0041E582    je          0041E59F
 0041E584    mov         eax,dword ptr [ebp+8]
 0041E587    add         eax,0FFFFFFEC
 0041E58A    push        eax
 0041E58B    mov         eax,dword ptr [ebp+8]
 0041E58E    mov         esi,dword ptr [eax-8]
 0041E591    mov         eax,dword ptr [ebp+8]
 0041E594    mov         edx,dword ptr [eax-8]
 0041E597    mov         ecx,ebx
 0041E599    mov         eax,dword ptr [esi+6C]
 0041E59C    call        dword ptr [esi+68]
 0041E59F    mov         eax,dword ptr [ebp+8]
 0041E5A2    cmp         dword ptr [eax-14],0
>0041E5A6    jne         0041E619
 0041E5A8    mov         eax,ebx
 0041E5AA    call        dword ptr [eax-0C]
 0041E5AD    mov         edx,dword ptr [ebp+8]
 0041E5B0    mov         dword ptr [edx-14],eax
 0041E5B3    mov         eax,dword ptr [ebp+8]
 0041E5B6    test        byte ptr [eax-9],4
>0041E5BA    je          0041E5D3
 0041E5BC    mov         eax,dword ptr [ebp+8]
 0041E5BF    mov         eax,dword ptr [eax-14]
 0041E5C2    or          word ptr [eax+1C],1
 0041E5C7    mov         eax,dword ptr [ebp+8]
 0041E5CA    mov         eax,dword ptr [eax-14]
 0041E5CD    or          word ptr [eax+1C],200
 0041E5D3    xor         eax,eax
 0041E5D5    push        ebp
 0041E5D6    push        41E602
 0041E5DB    push        dword ptr fs:[eax]
 0041E5DE    mov         dword ptr fs:[eax],esp
 0041E5E1    mov         eax,dword ptr [ebp+8]
 0041E5E4    mov         eax,dword ptr [eax-8]
 0041E5E7    mov         ecx,dword ptr [eax+28]
 0041E5EA    mov         eax,dword ptr [ebp+8]
 0041E5ED    mov         eax,dword ptr [eax-14]
 0041E5F0    or          edx,0FFFFFFFF
 0041E5F3    mov         ebx,dword ptr [eax]
 0041E5F5    call        dword ptr [ebx+2C]
 0041E5F8    xor         eax,eax
 0041E5FA    pop         edx
 0041E5FB    pop         ecx
 0041E5FC    pop         ecx
 0041E5FD    mov         dword ptr fs:[eax],edx
>0041E600    jmp         0041E619
>0041E602    jmp         @HandleAnyException
 0041E607    mov         eax,dword ptr [ebp+8]
 0041E60A    xor         edx,edx
 0041E60C    mov         dword ptr [eax-14],edx
 0041E60F    call        @RaiseAgain
 0041E614    call        @DoneExcept
 0041E619    mov         eax,dword ptr [ebp+8]
 0041E61C    mov         eax,dword ptr [eax-14]
 0041E61F    or          word ptr [eax+1C],1
 0041E624    xor         eax,eax
 0041E626    pop         edx
 0041E627    pop         ecx
 0041E628    pop         ecx
 0041E629    mov         dword ptr fs:[eax],edx
>0041E62C    jmp         0041E651
>0041E62E    jmp         @HandleAnyException
 0041E633    mov         eax,dword ptr [ebp+8]
 0041E636    push        eax
 0041E637    mov         eax,dword ptr [ebp+8]
 0041E63A    add         eax,0FFFFFFEC
 0041E63D    call        Recover
 0041E642    pop         ecx
 0041E643    test        al,al
>0041E645    jne         0041E64C
 0041E647    call        @RaiseAgain
 0041E64C    call        @DoneExcept
 0041E651    pop         edi
 0041E652    pop         esi
 0041E653    pop         ebx
 0041E654    pop         ebp
 0041E655    ret
*}
end;

//0041E658
procedure SetCompName;
begin
{*
 0041E658    push        ebp
 0041E659    mov         ebp,esp
 0041E65B    push        ebx
 0041E65C    push        esi
 0041E65D    push        edi
 0041E65E    xor         eax,eax
 0041E660    push        ebp
 0041E661    push        41E6D0
 0041E666    push        dword ptr fs:[eax]
 0041E669    mov         dword ptr fs:[eax],esp
 0041E66C    mov         eax,dword ptr [ebp+8]
 0041E66F    mov         eax,dword ptr [eax-8]
 0041E672    mov         edx,dword ptr [eax+2C]
 0041E675    mov         eax,dword ptr [ebp+8]
 0041E678    mov         eax,dword ptr [eax-14]
 0041E67B    mov         si,0FFF8
 0041E67F    call        @CallDynaInst
 0041E684    mov         eax,dword ptr [ebp+8]
 0041E687    lea         ecx,[eax-1C]
 0041E68A    mov         eax,dword ptr [ebp+8]
 0041E68D    mov         edx,dword ptr [eax-14]
 0041E690    mov         eax,dword ptr [ebp+8]
 0041E693    mov         eax,dword ptr [eax-8]
 0041E696    mov         ebx,dword ptr [eax]
 0041E698    call        dword ptr [ebx+1C]
 0041E69B    mov         eax,dword ptr [ebp+8]
 0041E69E    mov         eax,dword ptr [eax-14]
 0041E6A1    test        byte ptr [eax+1C],10
>0041E6A5    je          0041E6C6
 0041E6A7    mov         eax,dword ptr [ebp+8]
 0041E6AA    mov         eax,dword ptr [eax-1C]
 0041E6AD    call        FindGlobalComponent
 0041E6B2    mov         edx,dword ptr [ebp+8]
 0041E6B5    cmp         eax,dword ptr [edx-14]
>0041E6B8    jne         0041E6C6
 0041E6BA    mov         eax,dword ptr [ebp+8]
 0041E6BD    mov         eax,dword ptr [eax-14]
 0041E6C0    or          word ptr [eax+1C],200
 0041E6C6    xor         eax,eax
 0041E6C8    pop         edx
 0041E6C9    pop         ecx
 0041E6CA    pop         ecx
 0041E6CB    mov         dword ptr fs:[eax],edx
>0041E6CE    jmp         0041E6F3
>0041E6D0    jmp         @HandleAnyException
 0041E6D5    mov         eax,dword ptr [ebp+8]
 0041E6D8    push        eax
 0041E6D9    mov         eax,dword ptr [ebp+8]
 0041E6DC    add         eax,0FFFFFFEC
 0041E6DF    call        Recover
 0041E6E4    pop         ecx
 0041E6E5    test        al,al
>0041E6E7    jne         0041E6EE
 0041E6E9    call        @RaiseAgain
 0041E6EE    call        @DoneExcept
 0041E6F3    pop         edi
 0041E6F4    pop         esi
 0041E6F5    pop         ebx
 0041E6F6    pop         ebp
 0041E6F7    ret
*}
end;

//0041E6F8
procedure FindExistingComponent;
begin
{*
 0041E6F8    push        ebp
 0041E6F9    mov         ebp,esp
 0041E6FB    push        ebx
 0041E6FC    push        esi
 0041E6FD    push        edi
 0041E6FE    xor         eax,eax
 0041E700    push        ebp
 0041E701    push        41E773
 0041E706    push        dword ptr fs:[eax]
 0041E709    mov         dword ptr fs:[eax],esp
 0041E70C    mov         eax,dword ptr [ebp+8]
 0041E70F    mov         edx,dword ptr [eax-18]
 0041E712    mov         eax,dword ptr [ebp+8]
 0041E715    mov         eax,dword ptr [eax-8]
 0041E718    call        TReader.FindComponentClass
 0041E71D    mov         ecx,eax
 0041E71F    mov         eax,dword ptr [ebp+8]
 0041E722    mov         edx,dword ptr [eax-1C]
 0041E725    mov         eax,dword ptr [ebp+8]
 0041E728    mov         eax,dword ptr [eax-8]
 0041E72B    mov         ebx,dword ptr [eax]
 0041E72D    call        dword ptr [ebx+14]
 0041E730    mov         edx,dword ptr [ebp+8]
 0041E733    mov         dword ptr [edx-14],eax
 0041E736    mov         eax,dword ptr [ebp+8]
 0041E739    mov         eax,dword ptr [eax-14]
 0041E73C    mov         si,0FFF2
 0041E740    call        @CallDynaInst
 0041E745    mov         ebx,eax
 0041E747    mov         eax,dword ptr [ebp+8]
 0041E74A    mov         eax,dword ptr [eax-8]
 0041E74D    mov         dword ptr [eax+2C],ebx
 0041E750    mov         eax,dword ptr [ebp+8]
 0041E753    test        ebx,ebx
>0041E755    jne         0041E769
 0041E757    mov         eax,dword ptr [ebp+8]
 0041E75A    mov         eax,dword ptr [eax-8]
 0041E75D    mov         eax,dword ptr [eax+18]
 0041E760    mov         edx,dword ptr [ebp+8]
 0041E763    mov         edx,dword ptr [edx-8]
 0041E766    mov         dword ptr [edx+2C],eax
 0041E769    xor         eax,eax
 0041E76B    pop         edx
 0041E76C    pop         ecx
 0041E76D    pop         ecx
 0041E76E    mov         dword ptr fs:[eax],edx
>0041E771    jmp         0041E796
>0041E773    jmp         @HandleAnyException
 0041E778    mov         eax,dword ptr [ebp+8]
 0041E77B    push        eax
 0041E77C    mov         eax,dword ptr [ebp+8]
 0041E77F    add         eax,0FFFFFFEC
 0041E782    call        Recover
 0041E787    pop         ecx
 0041E788    test        al,al
>0041E78A    jne         0041E791
 0041E78C    call        @RaiseAgain
 0041E791    call        @DoneExcept
 0041E796    pop         edi
 0041E797    pop         esi
 0041E798    pop         ebx
 0041E799    pop         ebp
 0041E79A    ret
*}
end;

//0041E79C
function TReader.ReadComponent(Component:TComponent):TComponent;
begin
{*
 0041E79C    push        ebp
 0041E79D    mov         ebp,esp
 0041E79F    add         esp,0FFFFFFD8
 0041E7A2    push        ebx
 0041E7A3    push        esi
 0041E7A4    push        edi
 0041E7A5    xor         ecx,ecx
 0041E7A7    mov         dword ptr [ebp-18],ecx
 0041E7AA    mov         dword ptr [ebp-1C],ecx
 0041E7AD    mov         dword ptr [ebp-4],ecx
 0041E7B0    mov         dword ptr [ebp-10],edx
 0041E7B3    mov         dword ptr [ebp-8],eax
 0041E7B6    xor         eax,eax
 0041E7B8    push        ebp
 0041E7B9    push        41E9BD
 0041E7BE    push        dword ptr fs:[eax]
 0041E7C1    mov         dword ptr fs:[eax],esp
 0041E7C4    lea         ecx,[ebp-20]
 0041E7C7    lea         edx,[ebp-9]
 0041E7CA    mov         eax,dword ptr [ebp-8]
 0041E7CD    mov         ebx,dword ptr [eax]
 0041E7CF    call        dword ptr [ebx+24]
 0041E7D2    lea         edx,[ebp-18]
 0041E7D5    mov         eax,dword ptr [ebp-8]
 0041E7D8    call        TReader.ReadStr
 0041E7DD    lea         edx,[ebp-1C]
 0041E7E0    mov         eax,dword ptr [ebp-8]
 0041E7E3    call        TReader.ReadStr
 0041E7E8    mov         eax,dword ptr [ebp-8]
 0041E7EB    mov         eax,dword ptr [eax+2C]
 0041E7EE    mov         dword ptr [ebp-24],eax
 0041E7F1    mov         eax,dword ptr [ebp-8]
 0041E7F4    mov         eax,dword ptr [eax+1C]
 0041E7F7    mov         dword ptr [ebp-28],eax
 0041E7FA    xor         eax,eax
 0041E7FC    push        ebp
 0041E7FD    push        41E98D
 0041E802    push        dword ptr fs:[eax]
 0041E805    mov         dword ptr fs:[eax],esp
 0041E808    mov         eax,dword ptr [ebp-10]
 0041E80B    mov         dword ptr [ebp-14],eax
 0041E80E    cmp         dword ptr [ebp-14],0
>0041E812    jne         0041E82A
 0041E814    test        byte ptr [ebp-9],1
>0041E818    je          0041E823
 0041E81A    push        ebp
 0041E81B    call        FindExistingComponent
 0041E820    pop         ecx
>0041E821    jmp         0041E82A
 0041E823    push        ebp
 0041E824    call        CreateComponent
 0041E829    pop         ecx
 0041E82A    cmp         dword ptr [ebp-14],0
>0041E82E    je          0041E96D
 0041E834    xor         eax,eax
 0041E836    push        ebp
 0041E837    push        41E94B
 0041E83C    push        dword ptr fs:[eax]
 0041E83F    mov         dword ptr fs:[eax],esp
 0041E842    push        ebp
 0041E843    mov         eax,dword ptr [ebp-14]
 0041E846    call        CheckSubComponents
 0041E84B    pop         ecx
 0041E84C    mov         eax,dword ptr [ebp-14]
 0041E84F    or          word ptr [eax+1C],1
 0041E854    push        ebp
 0041E855    mov         dl,1
 0041E857    mov         ax,[0041E9D0]
 0041E85D    call        SetSubComponentState
 0041E862    pop         ecx
 0041E863    test        byte ptr [ebp-9],1
>0041E867    jne         0041E870
 0041E869    push        ebp
 0041E86A    call        SetCompName
 0041E86F    pop         ecx
 0041E870    cmp         dword ptr [ebp-14],0
>0041E874    jne         0041E888
 0041E876    xor         eax,eax
 0041E878    pop         edx
 0041E879    pop         ecx
 0041E87A    pop         ecx
 0041E87B    mov         dword ptr fs:[eax],edx
 0041E87E    call        @TryFinallyExit
>0041E883    jmp         0041E994
 0041E888    mov         eax,dword ptr [ebp-14]
 0041E88B    test        byte ptr [eax+1D],2
>0041E88F    je          0041E89A
 0041E891    mov         eax,dword ptr [ebp-8]
 0041E894    mov         edx,dword ptr [ebp-14]
 0041E897    mov         dword ptr [eax+1C],edx
 0041E89A    mov         eax,dword ptr [ebp-14]
 0041E89D    or          word ptr [eax+1C],2
 0041E8A2    push        ebp
 0041E8A3    mov         dl,1
 0041E8A5    mov         ax,[0041E9D4]
 0041E8AB    call        SetSubComponentState
 0041E8B0    pop         ecx
 0041E8B1    mov         edx,dword ptr [ebp-8]
 0041E8B4    mov         eax,dword ptr [ebp-14]
 0041E8B7    mov         ecx,dword ptr [eax]
 0041E8B9    call        dword ptr [ecx+14]
 0041E8BC    mov         eax,dword ptr [ebp-14]
 0041E8BF    and         word ptr [eax+1C],0FFFFFFFD
 0041E8C4    push        ebp
 0041E8C5    xor         edx,edx
 0041E8C7    mov         ax,[0041E9D4]
 0041E8CD    call        SetSubComponentState
 0041E8D2    pop         ecx
 0041E8D3    test        byte ptr [ebp-9],2
>0041E8D7    je          0041E8EE
 0041E8D9    mov         eax,dword ptr [ebp-8]
 0041E8DC    mov         eax,dword ptr [eax+2C]
 0041E8DF    mov         ecx,dword ptr [ebp-20]
 0041E8E2    mov         edx,dword ptr [ebp-14]
 0041E8E5    mov         si,0FFF9
 0041E8E9    call        @CallDynaInst
 0041E8EE    test        byte ptr [ebp-9],1
>0041E8F2    jne         0041E8FD
 0041E8F4    mov         eax,dword ptr [ebp-14]
 0041E8F7    test        byte ptr [eax+1D],2
>0041E8FB    je          0041E929
 0041E8FD    mov         eax,dword ptr [ebp-8]
 0041E900    mov         eax,dword ptr [eax+34]
 0041E903    mov         edx,dword ptr [ebp-14]
 0041E906    call        TList.IndexOf
 0041E90B    test        eax,eax
>0041E90D    jge         0041E941
 0041E90F    push        ebp
 0041E910    mov         eax,dword ptr [ebp-14]
 0041E913    call        AddSubComponentsToLoaded
 0041E918    pop         ecx
 0041E919    mov         eax,dword ptr [ebp-8]
 0041E91C    mov         eax,dword ptr [eax+34]
 0041E91F    mov         edx,dword ptr [ebp-14]
 0041E922    call        TList.Add
>0041E927    jmp         0041E941
 0041E929    push        ebp
 0041E92A    mov         eax,dword ptr [ebp-14]
 0041E92D    call        AddSubComponentsToLoaded
 0041E932    pop         ecx
 0041E933    mov         eax,dword ptr [ebp-8]
 0041E936    mov         eax,dword ptr [eax+34]
 0041E939    mov         edx,dword ptr [ebp-14]
 0041E93C    call        TList.Add
 0041E941    xor         eax,eax
 0041E943    pop         edx
 0041E944    pop         ecx
 0041E945    pop         ecx
 0041E946    mov         dword ptr fs:[eax],edx
>0041E949    jmp         0041E96D
>0041E94B    jmp         @HandleAnyException
 0041E950    push        ebp
 0041E951    call        ComponentCreated
 0041E956    pop         ecx
 0041E957    test        al,al
>0041E959    je          0041E963
 0041E95B    mov         eax,dword ptr [ebp-14]
 0041E95E    call        TObject.Free
 0041E963    call        @RaiseAgain
 0041E968    call        @DoneExcept
 0041E96D    xor         eax,eax
 0041E96F    pop         edx
 0041E970    pop         ecx
 0041E971    pop         ecx
 0041E972    mov         dword ptr fs:[eax],edx
 0041E975    push        41E994
 0041E97A    mov         eax,dword ptr [ebp-8]
 0041E97D    mov         edx,dword ptr [ebp-24]
 0041E980    mov         dword ptr [eax+2C],edx
 0041E983    mov         eax,dword ptr [ebp-8]
 0041E986    mov         edx,dword ptr [ebp-28]
 0041E989    mov         dword ptr [eax+1C],edx
 0041E98C    ret
>0041E98D    jmp         @HandleFinally
>0041E992    jmp         0041E97A
 0041E994    xor         eax,eax
 0041E996    pop         edx
 0041E997    pop         ecx
 0041E998    pop         ecx
 0041E999    mov         dword ptr fs:[eax],edx
 0041E99C    push        41E9C4
 0041E9A1    lea         eax,[ebp-1C]
 0041E9A4    mov         edx,2
 0041E9A9    call        @LStrArrayClr
 0041E9AE    lea         eax,[ebp-4]
 0041E9B1    mov         edx,dword ptr ds:[41E388];.06
 0041E9B7    call        @DynArrayClear
 0041E9BC    ret
>0041E9BD    jmp         @HandleFinally
>0041E9C2    jmp         0041E9A1
 0041E9C4    mov         eax,dword ptr [ebp-14]
 0041E9C7    pop         edi
 0041E9C8    pop         esi
 0041E9C9    pop         ebx
 0041E9CA    mov         esp,ebp
 0041E9CC    pop         ebp
 0041E9CD    ret
*}
end;

//0041E9D8
procedure TReader.ReadData(Instance:TComponent);
begin
{*
 0041E9D8    push        ebp
 0041E9D9    mov         ebp,esp
 0041E9DB    push        ecx
 0041E9DC    push        ebx
 0041E9DD    mov         ebx,edx
 0041E9DF    mov         dword ptr [ebp-4],eax
 0041E9E2    mov         eax,dword ptr [ebp-4]
 0041E9E5    cmp         dword ptr [eax+30],0
>0041E9E9    jne         0041EA3A
 0041E9EB    mov         dl,1
 0041E9ED    mov         eax,[00417CEC];TList
 0041E9F2    call        TObject.Create
 0041E9F7    mov         edx,dword ptr [ebp-4]
 0041E9FA    mov         dword ptr [edx+30],eax
 0041E9FD    xor         eax,eax
 0041E9FF    push        ebp
 0041EA00    push        41EA33
 0041EA05    push        dword ptr fs:[eax]
 0041EA08    mov         dword ptr fs:[eax],esp
 0041EA0B    mov         edx,ebx
 0041EA0D    mov         eax,dword ptr [ebp-4]
 0041EA10    call        TReader.ReadDataInner
 0041EA15    mov         eax,dword ptr [ebp-4]
 0041EA18    call        TReader.DoFixupReferences
 0041EA1D    xor         eax,eax
 0041EA1F    pop         edx
 0041EA20    pop         ecx
 0041EA21    pop         ecx
 0041EA22    mov         dword ptr fs:[eax],edx
 0041EA25    push        41EA44
 0041EA2A    mov         eax,dword ptr [ebp-4]
 0041EA2D    call        TReader.FreeFixups
 0041EA32    ret
>0041EA33    jmp         @HandleFinally
>0041EA38    jmp         0041EA2A
 0041EA3A    mov         edx,ebx
 0041EA3C    mov         eax,dword ptr [ebp-4]
 0041EA3F    call        TReader.ReadDataInner
 0041EA44    pop         ebx
 0041EA45    pop         ecx
 0041EA46    pop         ebp
 0041EA47    ret
*}
end;

//0041EA48
procedure TReader.ReadDataInner(Instance:TComponent);
begin
{*
 0041EA48    push        ebp
 0041EA49    mov         ebp,esp
 0041EA4B    add         esp,0FFFFFFF4
 0041EA4E    push        ebx
 0041EA4F    push        esi
 0041EA50    push        edi
 0041EA51    mov         ebx,edx
 0041EA53    mov         dword ptr [ebp-4],eax
>0041EA56    jmp         0041EA62
 0041EA58    mov         edx,ebx
 0041EA5A    mov         eax,dword ptr [ebp-4]
 0041EA5D    call        TReader.ReadProperty
 0041EA62    mov         eax,dword ptr [ebp-4]
 0041EA65    call        TReader.EndOfList
 0041EA6A    test        al,al
>0041EA6C    je          0041EA58
 0041EA6E    mov         eax,dword ptr [ebp-4]
 0041EA71    call        TReader.ReadListEnd
 0041EA76    mov         eax,dword ptr [ebp-4]
 0041EA79    mov         eax,dword ptr [eax+2C]
 0041EA7C    mov         dword ptr [ebp-8],eax
 0041EA7F    mov         eax,dword ptr [ebp-4]
 0041EA82    mov         eax,dword ptr [eax+28]
 0041EA85    mov         dword ptr [ebp-0C],eax
 0041EA88    mov         eax,ebx
 0041EA8A    mov         si,0FFFB
 0041EA8E    call        @CallDynaInst
 0041EA93    mov         edx,dword ptr [ebp-4]
 0041EA96    mov         dword ptr [edx+2C],eax
 0041EA99    xor         eax,eax
 0041EA9B    push        ebp
 0041EA9C    push        41EB0A
 0041EAA1    push        dword ptr fs:[eax]
 0041EAA4    mov         dword ptr fs:[eax],esp
 0041EAA7    mov         eax,ebx
 0041EAA9    mov         si,0FFFC
 0041EAAD    call        @CallDynaInst
 0041EAB2    mov         edi,eax
 0041EAB4    mov         eax,dword ptr [ebp-4]
 0041EAB7    mov         dword ptr [eax+28],edi
 0041EABA    test        edi,edi
>0041EABC    jne         0041EAD6
 0041EABE    mov         eax,dword ptr [ebp-4]
 0041EAC1    mov         eax,dword ptr [eax+18]
 0041EAC4    mov         edx,dword ptr [ebp-4]
 0041EAC7    mov         dword ptr [edx+28],eax
>0041EACA    jmp         0041EAD6
 0041EACC    xor         edx,edx
 0041EACE    mov         eax,dword ptr [ebp-4]
 0041EAD1    call        TReader.ReadComponent
 0041EAD6    mov         eax,dword ptr [ebp-4]
 0041EAD9    call        TReader.EndOfList
 0041EADE    test        al,al
>0041EAE0    je          0041EACC
 0041EAE2    mov         eax,dword ptr [ebp-4]
 0041EAE5    call        TReader.ReadListEnd
 0041EAEA    xor         eax,eax
 0041EAEC    pop         edx
 0041EAED    pop         ecx
 0041EAEE    pop         ecx
 0041EAEF    mov         dword ptr fs:[eax],edx
 0041EAF2    push        41EB11
 0041EAF7    mov         eax,dword ptr [ebp-4]
 0041EAFA    mov         edx,dword ptr [ebp-8]
 0041EAFD    mov         dword ptr [eax+2C],edx
 0041EB00    mov         eax,dword ptr [ebp-4]
 0041EB03    mov         edx,dword ptr [ebp-0C]
 0041EB06    mov         dword ptr [eax+28],edx
 0041EB09    ret
>0041EB0A    jmp         @HandleFinally
>0041EB0F    jmp         0041EAF7
 0041EB11    pop         edi
 0041EB12    pop         esi
 0041EB13    pop         ebx
 0041EB14    mov         esp,ebp
 0041EB16    pop         ebp
 0041EB17    ret
*}
end;

//0041EB18
function TReader.ReadFloat:Extended;
begin
{*
 0041EB18    push        ebx
 0041EB19    add         esp,0FFFFFFEC
 0041EB1C    mov         ebx,eax
 0041EB1E    mov         eax,ebx
 0041EB20    call        TReader.ReadValue
 0041EB25    cmp         al,5
>0041EB27    jne         0041EB39
 0041EB29    mov         edx,esp
 0041EB2B    mov         ecx,0A
 0041EB30    mov         eax,ebx
 0041EB32    call        TReader.Read
>0041EB37    jmp         0041EB53
 0041EB39    dec         dword ptr [ebx+10]
 0041EB3C    mov         eax,ebx
 0041EB3E    call        TReader.ReadInt64
 0041EB43    mov         dword ptr [esp+0C],eax
 0041EB47    mov         dword ptr [esp+10],edx
 0041EB4B    fild        qword ptr [esp+0C]
 0041EB4F    fstp        tbyte ptr [esp]
 0041EB52    wait
 0041EB53    fld         tbyte ptr [esp]
 0041EB56    add         esp,14
 0041EB59    pop         ebx
 0041EB5A    ret
*}
end;

//0041EB5C
function TReader.ReadSingle:Single;
begin
{*
 0041EB5C    push        ebx
 0041EB5D    add         esp,0FFFFFFF4
 0041EB60    mov         ebx,eax
 0041EB62    mov         eax,ebx
 0041EB64    call        TReader.ReadValue
 0041EB69    cmp         al,0F
>0041EB6B    jne         0041EB7D
 0041EB6D    mov         edx,esp
 0041EB6F    mov         ecx,4
 0041EB74    mov         eax,ebx
 0041EB76    call        TReader.Read
>0041EB7B    jmp         0041EB97
 0041EB7D    dec         dword ptr [ebx+10]
 0041EB80    mov         eax,ebx
 0041EB82    call        TReader.ReadInt64
 0041EB87    mov         dword ptr [esp+4],eax
 0041EB8B    mov         dword ptr [esp+8],edx
 0041EB8F    fild        qword ptr [esp+4]
 0041EB93    fstp        dword ptr [esp]
 0041EB96    wait
 0041EB97    fld         dword ptr [esp]
 0041EB9A    add         esp,0C
 0041EB9D    pop         ebx
 0041EB9E    ret
*}
end;

//0041EBA0
function TReader.ReadCurrency:Currency;
begin
{*
 0041EBA0    push        ebx
 0041EBA1    add         esp,0FFFFFFF0
 0041EBA4    mov         ebx,eax
 0041EBA6    mov         eax,ebx
 0041EBA8    call        TReader.ReadValue
 0041EBAD    cmp         al,10
>0041EBAF    jne         0041EBC1
 0041EBB1    mov         edx,esp
 0041EBB3    mov         ecx,8
 0041EBB8    mov         eax,ebx
 0041EBBA    call        TReader.Read
>0041EBBF    jmp         0041EBE1
 0041EBC1    dec         dword ptr [ebx+10]
 0041EBC4    mov         eax,ebx
 0041EBC6    call        TReader.ReadInt64
 0041EBCB    mov         dword ptr [esp+8],eax
 0041EBCF    mov         dword ptr [esp+0C],edx
 0041EBD3    fild        qword ptr [esp+8]
 0041EBD7    fmul        dword ptr ds:[41EBEC]
 0041EBDD    fistp       qword ptr [esp]
 0041EBE0    wait
 0041EBE1    fild        qword ptr [esp]
 0041EBE4    add         esp,10
 0041EBE7    pop         ebx
 0041EBE8    ret
*}
end;

//0041EBF0
function TReader.ReadDate:TDateTime;
begin
{*
 0041EBF0    push        ebx
 0041EBF1    add         esp,0FFFFFFF0
 0041EBF4    mov         ebx,eax
 0041EBF6    mov         eax,ebx
 0041EBF8    call        TReader.ReadValue
 0041EBFD    cmp         al,11
>0041EBFF    jne         0041EC11
 0041EC01    mov         edx,esp
 0041EC03    mov         ecx,8
 0041EC08    mov         eax,ebx
 0041EC0A    call        TReader.Read
>0041EC0F    jmp         0041EC2B
 0041EC11    dec         dword ptr [ebx+10]
 0041EC14    mov         eax,ebx
 0041EC16    call        TReader.ReadInt64
 0041EC1B    mov         dword ptr [esp+8],eax
 0041EC1F    mov         dword ptr [esp+0C],edx
 0041EC23    fild        qword ptr [esp+8]
 0041EC27    fstp        qword ptr [esp]
 0041EC2A    wait
 0041EC2B    fld         qword ptr [esp]
 0041EC2E    add         esp,10
 0041EC31    pop         ebx
 0041EC32    ret
*}
end;

//0041EC34
function TReader.ReadIdent:AnsiString;
begin
{*
 0041EC34    push        ebx
 0041EC35    push        esi
 0041EC36    push        ecx
 0041EC37    mov         esi,edx
 0041EC39    mov         ebx,eax
 0041EC3B    mov         eax,ebx
 0041EC3D    call        TReader.ReadValue
 0041EC42    and         eax,7F
 0041EC45    cmp         eax,0D
>0041EC48    ja          0041ECEC
 0041EC4E    mov         al,byte ptr [eax+41EC5B]
 0041EC54    jmp         dword ptr [eax*4+41EC69]
 0041EC54    db          5
 0041EC54    db          0
 0041EC54    db          0
 0041EC54    db          0
 0041EC54    db          0
 0041EC54    db          0
 0041EC54    db          0
 0041EC54    db          1
 0041EC54    db          2
 0041EC54    db          3
 0041EC54    db          0
 0041EC54    db          0
 0041EC54    db          0
 0041EC54    db          4
 0041EC54    dd          0041ECEC
 0041EC54    dd          0041EC81
 0041EC54    dd          0041ECB4
 0041EC54    dd          0041ECC2
 0041EC54    dd          0041ECD0
 0041EC54    dd          0041ECDE
 0041EC81    mov         edx,esp
 0041EC83    mov         ecx,1
 0041EC88    mov         eax,ebx
 0041EC8A    call        TReader.Read
 0041EC8F    xor         ecx,ecx
 0041EC91    mov         cl,byte ptr [esp]
 0041EC94    mov         eax,esi
 0041EC96    xor         edx,edx
 0041EC98    call        @LStrFromPCharLen
 0041EC9D    mov         eax,esi
 0041EC9F    call        @UniqueStringA
 0041ECA4    mov         edx,eax
 0041ECA6    xor         ecx,ecx
 0041ECA8    mov         cl,byte ptr [esp]
 0041ECAB    mov         eax,ebx
 0041ECAD    call        TReader.Read
>0041ECB2    jmp         0041ECF1
 0041ECB4    mov         eax,esi
 0041ECB6    mov         edx,41ED00;'False'
 0041ECBB    call        @LStrAsg
>0041ECC0    jmp         0041ECF1
 0041ECC2    mov         eax,esi
 0041ECC4    mov         edx,41ED10;'True'
 0041ECC9    call        @LStrAsg
>0041ECCE    jmp         0041ECF1
 0041ECD0    mov         eax,esi
 0041ECD2    mov         edx,41ED20;'nil'
 0041ECD7    call        @LStrAsg
>0041ECDC    jmp         0041ECF1
 0041ECDE    mov         eax,esi
 0041ECE0    mov         edx,41ED2C;'Null'
 0041ECE5    call        @LStrAsg
>0041ECEA    jmp         0041ECF1
 0041ECEC    call        PropValueError
 0041ECF1    pop         edx
 0041ECF2    pop         esi
 0041ECF3    pop         ebx
 0041ECF4    ret
*}
end;

//0041ED34
function TReader.ReadInteger:Longint;
begin
{*
 0041ED34    push        ebx
 0041ED35    add         esp,0FFFFFFF8
 0041ED38    mov         ebx,eax
 0041ED3A    mov         eax,ebx
 0041ED3C    call        TReader.ReadValue
 0041ED41    sub         al,2
>0041ED43    je          0041ED4F
 0041ED45    dec         al
>0041ED47    je          0041ED69
 0041ED49    dec         al
>0041ED4B    je          0041ED83
>0041ED4D    jmp         0041ED93
 0041ED4F    lea         edx,[esp+4]
 0041ED53    mov         ecx,1
 0041ED58    mov         eax,ebx
 0041ED5A    call        TReader.Read
 0041ED5F    movsx       eax,byte ptr [esp+4]
 0041ED64    mov         dword ptr [esp],eax
>0041ED67    jmp         0041ED98
 0041ED69    lea         edx,[esp+6]
 0041ED6D    mov         ecx,2
 0041ED72    mov         eax,ebx
 0041ED74    call        TReader.Read
 0041ED79    movsx       eax,word ptr [esp+6]
 0041ED7E    mov         dword ptr [esp],eax
>0041ED81    jmp         0041ED98
 0041ED83    mov         edx,esp
 0041ED85    mov         ecx,4
 0041ED8A    mov         eax,ebx
 0041ED8C    call        TReader.Read
>0041ED91    jmp         0041ED98
 0041ED93    call        PropValueError
 0041ED98    mov         eax,dword ptr [esp]
 0041ED9B    pop         ecx
 0041ED9C    pop         edx
 0041ED9D    pop         ebx
 0041ED9E    ret
*}
end;

//0041EDA0
function TReader.ReadInt64:Int64;
begin
{*
 0041EDA0    push        ebx
 0041EDA1    add         esp,0FFFFFFF8
 0041EDA4    mov         ebx,eax
 0041EDA6    mov         eax,ebx
 0041EDA8    call        TReader.NextValue
 0041EDAD    cmp         al,13
>0041EDAF    jne         0041EDC8
 0041EDB1    mov         eax,ebx
 0041EDB3    call        TReader.ReadValue
 0041EDB8    mov         edx,esp
 0041EDBA    mov         ecx,8
 0041EDBF    mov         eax,ebx
 0041EDC1    call        TReader.Read
>0041EDC6    jmp         0041EDD7
 0041EDC8    mov         eax,ebx
 0041EDCA    call        TReader.ReadInteger
 0041EDCF    cdq
 0041EDD0    mov         dword ptr [esp],eax
 0041EDD3    mov         dword ptr [esp+4],edx
 0041EDD7    mov         eax,dword ptr [esp]
 0041EDDA    mov         edx,dword ptr [esp+4]
 0041EDDE    pop         ecx
 0041EDDF    pop         edx
 0041EDE0    pop         ebx
 0041EDE1    ret
*}
end;

//0041EDE4
procedure TReader.ReadListBegin;
begin
{*
 0041EDE4    mov         dl,1
 0041EDE6    call        TReader.CheckValue
 0041EDEB    ret
*}
end;

//0041EDEC
procedure TReader.ReadListEnd;
begin
{*
 0041EDEC    xor         edx,edx
 0041EDEE    call        TReader.CheckValue
 0041EDF3    ret
*}
end;

//0041EDF4
procedure TReader.ReadPrefix(var Flags:TFilerFlags; var AChildPos:Integer);
begin
{*
 0041EDF4    push        ebx
 0041EDF5    push        esi
 0041EDF6    push        edi
 0041EDF7    mov         edi,ecx
 0041EDF9    mov         esi,edx
 0041EDFB    mov         ebx,eax
 0041EDFD    mov         al,[0041EE30]
 0041EE02    mov         byte ptr [esi],al
 0041EE04    mov         eax,ebx
 0041EE06    call        TReader.NextValue
 0041EE0B    and         al,0F0
 0041EE0D    cmp         al,0F0
>0041EE0F    jne         0041EE2A
 0041EE11    mov         eax,ebx
 0041EE13    call        TReader.ReadValue
 0041EE18    and         al,0F
 0041EE1A    mov         byte ptr [esi],al
 0041EE1C    test        byte ptr [esi],2
>0041EE1F    je          0041EE2A
 0041EE21    mov         eax,ebx
 0041EE23    call        TReader.ReadInteger
 0041EE28    mov         dword ptr [edi],eax
 0041EE2A    pop         edi
 0041EE2B    pop         esi
 0041EE2C    pop         ebx
 0041EE2D    ret
*}
end;

//0041EE34
procedure HandleException(E:Exception);
begin
{*
 0041EE34    push        ebp
 0041EE35    mov         ebp,esp
 0041EE37    add         esp,0FFFFFEDC
 0041EE3D    push        ebx
 0041EE3E    xor         edx,edx
 0041EE40    mov         dword ptr [ebp-4],edx
 0041EE43    mov         ebx,eax
 0041EE45    xor         eax,eax
 0041EE47    push        ebp
 0041EE48    push        41EF25
 0041EE4D    push        dword ptr fs:[eax]
 0041EE50    mov         dword ptr fs:[eax],esp
 0041EE53    lea         eax,[ebp-4]
 0041EE56    call        @LStrClr
 0041EE5B    mov         eax,dword ptr [ebp+8]
 0041EE5E    mov         eax,dword ptr [eax-4]
 0041EE61    mov         edx,dword ptr ds:[418C6C];TComponent
 0041EE67    call        @IsClass
 0041EE6C    test        al,al
>0041EE6E    je          0041EE81
 0041EE70    lea         eax,[ebp-4]
 0041EE73    mov         edx,dword ptr [ebp+8]
 0041EE76    mov         edx,dword ptr [edx-4]
 0041EE79    mov         edx,dword ptr [edx+8]
 0041EE7C    call        @LStrLAsg
 0041EE81    cmp         dword ptr [ebp-4],0
>0041EE85    jne         0041EEA8
 0041EE87    lea         edx,[ebp-104]
 0041EE8D    mov         eax,dword ptr [ebp+8]
 0041EE90    mov         eax,dword ptr [eax-4]
 0041EE93    mov         eax,dword ptr [eax]
 0041EE95    call        TObject.ClassName
 0041EE9A    lea         edx,[ebp-104]
 0041EEA0    lea         eax,[ebp-4]
 0041EEA3    call        @LStrFromString
 0041EEA8    mov         eax,dword ptr [ebp-4]
 0041EEAB    mov         dword ptr [ebp-124],eax
 0041EEB1    mov         byte ptr [ebp-120],0B
 0041EEB8    mov         eax,[005AE350]
 0041EEBD    mov         eax,dword ptr [eax]
 0041EEBF    mov         dword ptr [ebp-11C],eax
 0041EEC5    mov         byte ptr [ebp-118],0B
 0041EECC    mov         eax,dword ptr [ebp+8]
 0041EECF    mov         eax,dword ptr [eax-8]
 0041EED2    mov         dword ptr [ebp-114],eax
 0041EED8    mov         byte ptr [ebp-110],0B
 0041EEDF    mov         eax,dword ptr [ebx+4]
 0041EEE2    mov         dword ptr [ebp-10C],eax
 0041EEE8    mov         byte ptr [ebp-108],0B
 0041EEEF    lea         eax,[ebp-124]
 0041EEF5    push        eax
 0041EEF6    push        3
 0041EEF8    mov         ecx,dword ptr ds:[5AE714];^SPropertyException:TResStringRec
 0041EEFE    mov         dl,1
 0041EF00    mov         eax,[0041795C];EReadError
 0041EF05    call        Exception.CreateResFmt
 0041EF0A    call        @RaiseExcept
 0041EF0F    xor         eax,eax
 0041EF11    pop         edx
 0041EF12    pop         ecx
 0041EF13    pop         ecx
 0041EF14    mov         dword ptr fs:[eax],edx
 0041EF17    push        41EF2C
 0041EF1C    lea         eax,[ebp-4]
 0041EF1F    call        @LStrClr
 0041EF24    ret
>0041EF25    jmp         @HandleFinally
>0041EF2A    jmp         0041EF1C
 0041EF2C    pop         ebx
 0041EF2D    mov         esp,ebp
 0041EF2F    pop         ebp
 0041EF30    ret
*}
end;

//0041EF34
procedure PropPathError;
begin
{*
 0041EF34    push        ebp
 0041EF35    mov         ebp,esp
 0041EF37    mov         eax,dword ptr [ebp+8]
 0041EF3A    mov         eax,dword ptr [eax-0C]
 0041EF3D    call        TReader.SkipValue
 0041EF42    mov         eax,[005AE6D8];^SInvalidPropertyPath:TResStringRec
 0041EF47    call        ReadError
 0041EF4C    pop         ebp
 0041EF4D    ret
*}
end;

//0041EF50
procedure TReader.ReadProperty(AInstance:TPersistent);
begin
{*
 0041EF50    push        ebp
 0041EF51    mov         ebp,esp
 0041EF53    add         esp,0FFFFFFEC
 0041EF56    push        ebx
 0041EF57    push        esi
 0041EF58    push        edi
 0041EF59    xor         ecx,ecx
 0041EF5B    mov         dword ptr [ebp-8],ecx
 0041EF5E    mov         dword ptr [ebp-4],edx
 0041EF61    mov         dword ptr [ebp-0C],eax
 0041EF64    xor         eax,eax
 0041EF66    push        ebp
 0041EF67    push        41F120
 0041EF6C    push        dword ptr fs:[eax]
 0041EF6F    mov         dword ptr fs:[eax],esp
 0041EF72    xor         edx,edx
 0041EF74    push        ebp
 0041EF75    push        41F0D5
 0041EF7A    push        dword ptr fs:[edx]
 0041EF7D    mov         dword ptr fs:[edx],esp
 0041EF80    lea         edx,[ebp-8]
 0041EF83    mov         eax,dword ptr [ebp-0C]
 0041EF86    call        TReader.ReadStr
 0041EF8B    xor         edx,edx
 0041EF8D    push        ebp
 0041EF8E    push        41F0AE
 0041EF93    push        dword ptr fs:[edx]
 0041EF96    mov         dword ptr fs:[edx],esp
 0041EF99    mov         ebx,1
 0041EF9E    mov         eax,dword ptr [ebp-8]
 0041EFA1    call        @LStrLen
 0041EFA6    mov         esi,eax
 0041EFA8    mov         eax,dword ptr [ebp-4]
 0041EFAB    mov         dword ptr [ebp-10],eax
 0041EFAE    mov         eax,dword ptr [ebp-0C]
 0041EFB1    mov         byte ptr [eax+78],1
 0041EFB5    mov         edi,ebx
>0041EFB7    jmp         0041EFBA
 0041EFB9    inc         ebx
 0041EFBA    cmp         esi,ebx
>0041EFBC    jl          0041EFC8
 0041EFBE    mov         eax,dword ptr [ebp-8]
 0041EFC1    cmp         byte ptr [eax+ebx-1],2E
>0041EFC6    jne         0041EFB9
 0041EFC8    mov         eax,dword ptr [ebp-0C]
 0041EFCB    add         eax,70
 0041EFCE    push        eax
 0041EFCF    mov         ecx,ebx
 0041EFD1    sub         ecx,edi
 0041EFD3    mov         edx,edi
 0041EFD5    mov         eax,dword ptr [ebp-8]
 0041EFD8    call        @LStrCopy
 0041EFDD    cmp         esi,ebx
>0041EFDF    jl          0041F04A
 0041EFE1    mov         eax,dword ptr [ebp-10]
 0041EFE4    mov         eax,dword ptr [eax]
 0041EFE6    call        TObject.ClassInfo
 0041EFEB    mov         edx,dword ptr [ebp-0C]
 0041EFEE    mov         edx,dword ptr [edx+70]
 0041EFF1    call        GetPropInfo
 0041EFF6    mov         edi,eax
 0041EFF8    test        edi,edi
>0041EFFA    jne         0041F00A
 0041EFFC    mov         eax,dword ptr [ebp-0C]
 0041EFFF    mov         edx,dword ptr [eax+70]
 0041F002    mov         eax,dword ptr [ebp-0C]
 0041F005    call        TReader.PropertyError
 0041F00A    xor         eax,eax
 0041F00C    mov         dword ptr [ebp-14],eax
 0041F00F    mov         eax,dword ptr [edi]
 0041F011    mov         eax,dword ptr [eax]
 0041F013    cmp         byte ptr [eax],7
>0041F016    jne         0041F025
 0041F018    mov         edx,edi
 0041F01A    mov         eax,dword ptr [ebp-10]
 0041F01D    call        GetOrdProp
 0041F022    mov         dword ptr [ebp-14],eax
 0041F025    mov         eax,dword ptr [ebp-14]
 0041F028    mov         edx,dword ptr ds:[417DFC];TPersistent
 0041F02E    call        @IsClass
 0041F033    test        al,al
>0041F035    jne         0041F03E
 0041F037    push        ebp
 0041F038    call        PropPathError
 0041F03D    pop         ecx
 0041F03E    mov         eax,dword ptr [ebp-14]
 0041F041    mov         dword ptr [ebp-10],eax
 0041F044    inc         ebx
>0041F045    jmp         0041EFB5
 0041F04A    mov         eax,dword ptr [ebp-10]
 0041F04D    mov         eax,dword ptr [eax]
 0041F04F    call        TObject.ClassInfo
 0041F054    mov         edx,dword ptr [ebp-0C]
 0041F057    mov         edx,dword ptr [edx+70]
 0041F05A    call        GetPropInfo
 0041F05F    mov         edi,eax
 0041F061    test        edi,edi
>0041F063    je          0041F074
 0041F065    mov         ecx,edi
 0041F067    mov         edx,dword ptr [ebp-10]
 0041F06A    mov         eax,dword ptr [ebp-0C]
 0041F06D    call        TReader.ReadPropValue
>0041F072    jmp         0041F0A4
 0041F074    mov         eax,dword ptr [ebp-0C]
 0041F077    mov         byte ptr [eax+78],0
 0041F07B    mov         edx,dword ptr [ebp-0C]
 0041F07E    mov         eax,dword ptr [ebp-10]
 0041F081    mov         ecx,dword ptr [eax]
 0041F083    call        dword ptr [ecx+4]
 0041F086    mov         eax,dword ptr [ebp-0C]
 0041F089    mov         byte ptr [eax+78],1
 0041F08D    mov         eax,dword ptr [ebp-0C]
 0041F090    cmp         dword ptr [eax+70],0
>0041F094    je          0041F0A4
 0041F096    mov         eax,dword ptr [ebp-0C]
 0041F099    mov         edx,dword ptr [eax+70]
 0041F09C    mov         eax,dword ptr [ebp-0C]
 0041F09F    call        TReader.PropertyError
 0041F0A4    xor         eax,eax
 0041F0A6    pop         edx
 0041F0A7    pop         ecx
 0041F0A8    pop         ecx
 0041F0A9    mov         dword ptr fs:[eax],edx
>0041F0AC    jmp         0041F0CB
>0041F0AE    jmp         @HandleOnException
 0041F0B3    dd          1
 0041F0B7    dd          00408B30;Exception
 0041F0BB    dd          0041F0BF
 0041F0BF    push        ebp
 0041F0C0    call        HandleException
 0041F0C5    pop         ecx
 0041F0C6    call        @DoneExcept
 0041F0CB    xor         eax,eax
 0041F0CD    pop         edx
 0041F0CE    pop         ecx
 0041F0CF    pop         ecx
 0041F0D0    mov         dword ptr fs:[eax],edx
>0041F0D3    jmp         0041F10A
>0041F0D5    jmp         @HandleOnException
 0041F0DA    dd          1
 0041F0DE    dd          00408B30;Exception
 0041F0E2    dd          0041F0E6
 0041F0E6    mov         ebx,eax
 0041F0E8    mov         eax,dword ptr [ebp-0C]
 0041F0EB    cmp         byte ptr [eax+78],0
>0041F0EF    je          0041F100
 0041F0F1    mov         edx,dword ptr [ebx+4]
 0041F0F4    mov         eax,dword ptr [ebp-0C]
 0041F0F7    mov         ecx,dword ptr [eax]
 0041F0F9    call        dword ptr [ecx+10]
 0041F0FC    test        al,al
>0041F0FE    jne         0041F105
 0041F100    call        @RaiseAgain
 0041F105    call        @DoneExcept
 0041F10A    xor         eax,eax
 0041F10C    pop         edx
 0041F10D    pop         ecx
 0041F10E    pop         ecx
 0041F10F    mov         dword ptr fs:[eax],edx
 0041F112    push        41F127
 0041F117    lea         eax,[ebp-8]
 0041F11A    call        @LStrClr
 0041F11F    ret
>0041F120    jmp         @HandleFinally
>0041F125    jmp         0041F117
 0041F127    pop         edi
 0041F128    pop         esi
 0041F129    pop         ebx
 0041F12A    mov         esp,ebp
 0041F12C    pop         ebp
 0041F12D    ret
*}
end;

//0041F130
procedure SetIntIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);
begin
{*
 0041F130    push        ebp
 0041F131    mov         ebp,esp
 0041F133    add         esp,0FFFFFFF8
 0041F136    push        ebx
 0041F137    push        esi
 0041F138    push        edi
 0041F139    mov         edi,ecx
 0041F13B    mov         esi,edx
 0041F13D    mov         dword ptr [ebp-4],eax
 0041F140    mov         eax,dword ptr [esi]
 0041F142    mov         eax,dword ptr [eax]
 0041F144    call        FindIdentToInt
 0041F149    mov         ebx,eax
 0041F14B    test        ebx,ebx
>0041F14D    je          0041F169
 0041F14F    lea         edx,[ebp-8]
 0041F152    mov         eax,edi
 0041F154    call        ebx
 0041F156    test        al,al
>0041F158    je          0041F169
 0041F15A    mov         ecx,dword ptr [ebp-8]
 0041F15D    mov         edx,esi
 0041F15F    mov         eax,dword ptr [ebp-4]
 0041F162    call        SetOrdProp
>0041F167    jmp         0041F16E
 0041F169    call        PropValueError
 0041F16E    pop         edi
 0041F16F    pop         esi
 0041F170    pop         ebx
 0041F171    pop         ecx
 0041F172    pop         ecx
 0041F173    pop         ebp
 0041F174    ret
*}
end;

//0041F178
procedure SetObjectIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);
begin
{*
 0041F178    push        ebp
 0041F179    mov         ebp,esp
 0041F17B    push        ebx
 0041F17C    push        esi
 0041F17D    push        edi
 0041F17E    mov         edi,ecx
 0041F180    mov         esi,edx
 0041F182    mov         ebx,eax
 0041F184    mov         eax,dword ptr [ebp+8]
 0041F187    mov         eax,dword ptr [eax-4]
 0041F18A    mov         eax,dword ptr [eax+18]
 0041F18D    push        eax
 0041F18E    push        esi
 0041F18F    push        0
 0041F191    push        edi
 0041F192    mov         ecx,ebx
 0041F194    mov         dl,1
 0041F196    mov         eax,[0041D67C];TPropFixup
 0041F19B    call        TPropFixup.Create
 0041F1A0    mov         edx,eax
 0041F1A2    mov         eax,dword ptr [ebp+8]
 0041F1A5    mov         eax,dword ptr [eax-4]
 0041F1A8    mov         eax,dword ptr [eax+30]
 0041F1AB    call        TList.Add
 0041F1B0    pop         edi
 0041F1B1    pop         esi
 0041F1B2    pop         ebx
 0041F1B3    pop         ebp
 0041F1B4    ret
*}
end;

//0041F1B8
procedure SetVariantReference;
begin
{*
 0041F1B8    push        ebp
 0041F1B9    mov         ebp,esp
 0041F1BB    xor         ecx,ecx
 0041F1BD    push        ecx
 0041F1BE    push        ecx
 0041F1BF    push        ecx
 0041F1C0    push        ecx
 0041F1C1    xor         eax,eax
 0041F1C3    push        ebp
 0041F1C4    push        41F207
 0041F1C9    push        dword ptr fs:[eax]
 0041F1CC    mov         dword ptr fs:[eax],esp
 0041F1CF    lea         edx,[ebp-10]
 0041F1D2    mov         eax,dword ptr [ebp+8]
 0041F1D5    mov         eax,dword ptr [eax-4]
 0041F1D8    call        TReader.ReadVariant
 0041F1DD    lea         ecx,[ebp-10]
 0041F1E0    mov         eax,dword ptr [ebp+8]
 0041F1E3    mov         edx,dword ptr [eax-0C]
 0041F1E6    mov         eax,dword ptr [ebp+8]
 0041F1E9    mov         eax,dword ptr [eax-8]
 0041F1EC    call        SetVariantProp
 0041F1F1    xor         eax,eax
 0041F1F3    pop         edx
 0041F1F4    pop         ecx
 0041F1F5    pop         ecx
 0041F1F6    mov         dword ptr fs:[eax],edx
 0041F1F9    push        41F20E
 0041F1FE    lea         eax,[ebp-10]
 0041F201    call        @VarClr
 0041F206    ret
>0041F207    jmp         @HandleFinally
>0041F20C    jmp         0041F1FE
 0041F20E    mov         esp,ebp
 0041F210    pop         ebp
 0041F211    ret
*}
end;

//0041F214
procedure SetInterfaceReference;
begin
{*
 0041F214    push        ebp
 0041F215    mov         ebp,esp
 0041F217    push        0
 0041F219    push        0
 0041F21B    xor         eax,eax
 0041F21D    push        ebp
 0041F21E    push        41F2C6
 0041F223    push        dword ptr fs:[eax]
 0041F226    mov         dword ptr fs:[eax],esp
 0041F229    mov         eax,dword ptr [ebp+8]
 0041F22C    mov         eax,dword ptr [eax-4]
 0041F22F    call        TReader.NextValue
 0041F234    cmp         al,0D
>0041F236    jne         0041F261
 0041F238    mov         eax,dword ptr [ebp+8]
 0041F23B    mov         eax,dword ptr [eax-4]
 0041F23E    call        TReader.ReadValue
 0041F243    lea         eax,[ebp-4]
 0041F246    call        @IntfClear
 0041F24B    mov         eax,dword ptr [ebp+8]
 0041F24E    mov         edx,dword ptr [eax-0C]
 0041F251    mov         eax,dword ptr [ebp+8]
 0041F254    mov         eax,dword ptr [eax-8]
 0041F257    mov         ecx,dword ptr [ebp-4]
 0041F25A    call        SetInterfaceProp
>0041F25F    jmp         0041F2A8
 0041F261    mov         eax,dword ptr [ebp+8]
 0041F264    mov         eax,dword ptr [eax-4]
 0041F267    mov         eax,dword ptr [eax+18]
 0041F26A    push        eax
 0041F26B    mov         eax,dword ptr [ebp+8]
 0041F26E    mov         eax,dword ptr [eax-0C]
 0041F271    push        eax
 0041F272    push        0
 0041F274    lea         edx,[ebp-8]
 0041F277    mov         eax,dword ptr [ebp+8]
 0041F27A    mov         eax,dword ptr [eax-4]
 0041F27D    call        TReader.ReadIdent
 0041F282    mov         eax,dword ptr [ebp-8]
 0041F285    push        eax
 0041F286    mov         eax,dword ptr [ebp+8]
 0041F289    mov         ecx,dword ptr [eax-8]
 0041F28C    mov         dl,1
 0041F28E    mov         eax,[0041D6F4];TPropIntfFixup
 0041F293    call        TPropFixup.Create
 0041F298    mov         edx,eax
 0041F29A    mov         eax,dword ptr [ebp+8]
 0041F29D    mov         eax,dword ptr [eax-4]
 0041F2A0    mov         eax,dword ptr [eax+30]
 0041F2A3    call        TList.Add
 0041F2A8    xor         eax,eax
 0041F2AA    pop         edx
 0041F2AB    pop         ecx
 0041F2AC    pop         ecx
 0041F2AD    mov         dword ptr fs:[eax],edx
 0041F2B0    push        41F2CD
 0041F2B5    lea         eax,[ebp-8]
 0041F2B8    call        @LStrClr
 0041F2BD    lea         eax,[ebp-4]
 0041F2C0    call        @IntfClear
 0041F2C5    ret
>0041F2C6    jmp         @HandleFinally
>0041F2CB    jmp         0041F2B5
 0041F2CD    pop         ecx
 0041F2CE    pop         ecx
 0041F2CF    pop         ebp
 0041F2D0    ret
*}
end;

//0041F2D4
procedure TReader.ReadPropValue(Instance:TPersistent; PropInfo:Pointer);
begin
{*
 0041F2D4    push        ebp
 0041F2D5    mov         ebp,esp
 0041F2D7    push        ecx
 0041F2D8    mov         ecx,5
 0041F2DD    push        0
 0041F2DF    push        0
 0041F2E1    dec         ecx
>0041F2E2    jne         0041F2DD
 0041F2E4    xchg        ecx,dword ptr [ebp-4]
 0041F2E7    push        ebx
 0041F2E8    mov         dword ptr [ebp-0C],ecx
 0041F2EB    mov         dword ptr [ebp-8],edx
 0041F2EE    mov         dword ptr [ebp-4],eax
 0041F2F1    xor         eax,eax
 0041F2F3    push        ebp
 0041F2F4    push        41F5CF
 0041F2F9    push        dword ptr fs:[eax]
 0041F2FC    mov         dword ptr fs:[eax],esp
 0041F2FF    mov         eax,dword ptr [ebp-0C]
 0041F302    cmp         dword ptr [eax+8],0
>0041F306    jne         0041F349
 0041F308    mov         eax,dword ptr [ebp-0C]
 0041F30B    mov         eax,dword ptr [eax]
 0041F30D    mov         eax,dword ptr [eax]
 0041F30F    cmp         byte ptr [eax],7
>0041F312    jne         0041F33F
 0041F314    mov         edx,dword ptr [ebp-0C]
 0041F317    mov         eax,dword ptr [ebp-8]
 0041F31A    call        GetOrdProp
 0041F31F    mov         edx,dword ptr ds:[418C6C];TComponent
 0041F325    call        @IsClass
 0041F32A    test        al,al
>0041F32C    je          0041F33F
 0041F32E    mov         edx,dword ptr [ebp-0C]
 0041F331    mov         eax,dword ptr [ebp-8]
 0041F334    call        GetOrdProp
 0041F339    test        byte ptr [eax+24],4
>0041F33D    jne         0041F349
 0041F33F    mov         eax,[005AE60C];^SReadOnlyProperty:TResStringRec
 0041F344    call        ReadError
 0041F349    mov         eax,dword ptr [ebp-0C]
 0041F34C    mov         eax,dword ptr [eax]
 0041F34E    mov         ebx,dword ptr [eax]
 0041F350    xor         eax,eax
 0041F352    mov         al,byte ptr [ebx]
 0041F354    cmp         eax,10
>0041F357    ja          0041F59F
 0041F35D    jmp         dword ptr [eax*4+41F364]
 0041F35D    dd          0041F59F
 0041F35D    dd          0041F3A8
 0041F35D    dd          0041F3EC
 0041F35D    dd          0041F408
 0041F35D    dd          0041F42F
 0041F35D    dd          0041F44E
 0041F35D    dd          0041F48A
 0041F35D    dd          0041F4A6
 0041F35D    dd          0041F514
 0041F35D    dd          0041F59F
 0041F35D    dd          0041F44E
 0041F35D    dd          0041F46C
 0041F35D    dd          0041F578
 0041F35D    dd          0041F59F
 0041F35D    dd          0041F59F
 0041F35D    dd          0041F598
 0041F35D    dd          0041F581
 0041F3A8    mov         eax,dword ptr [ebp-4]
 0041F3AB    call        TReader.NextValue
 0041F3B0    cmp         al,7
>0041F3B2    jne         0041F3D2
 0041F3B4    lea         edx,[ebp-18]
 0041F3B7    mov         eax,dword ptr [ebp-4]
 0041F3BA    call        TReader.ReadIdent
 0041F3BF    mov         ecx,dword ptr [ebp-18]
 0041F3C2    mov         edx,dword ptr [ebp-0C]
 0041F3C5    mov         eax,dword ptr [ebp-8]
 0041F3C8    call        SetIntIdent
>0041F3CD    jmp         0041F59F
 0041F3D2    mov         eax,dword ptr [ebp-4]
 0041F3D5    call        TReader.ReadInteger
 0041F3DA    mov         ecx,eax
 0041F3DC    mov         edx,dword ptr [ebp-0C]
 0041F3DF    mov         eax,dword ptr [ebp-8]
 0041F3E2    call        SetOrdProp
>0041F3E7    jmp         0041F59F
 0041F3EC    mov         eax,dword ptr [ebp-4]
 0041F3EF    call        TReader.ReadChar
 0041F3F4    xor         ecx,ecx
 0041F3F6    mov         cl,al
 0041F3F8    mov         edx,dword ptr [ebp-0C]
 0041F3FB    mov         eax,dword ptr [ebp-8]
 0041F3FE    call        SetOrdProp
>0041F403    jmp         0041F59F
 0041F408    lea         edx,[ebp-1C]
 0041F40B    mov         eax,dword ptr [ebp-4]
 0041F40E    call        TReader.ReadIdent
 0041F413    mov         edx,dword ptr [ebp-1C]
 0041F416    mov         eax,ebx
 0041F418    call        GetEnumValue
 0041F41D    mov         ecx,eax
 0041F41F    mov         edx,dword ptr [ebp-0C]
 0041F422    mov         eax,dword ptr [ebp-8]
 0041F425    call        SetOrdProp
>0041F42A    jmp         0041F59F
 0041F42F    mov         eax,dword ptr [ebp-4]
 0041F432    call        TReader.ReadFloat
 0041F437    add         esp,0FFFFFFF4
 0041F43A    fstp        tbyte ptr [esp]
 0041F43D    wait
 0041F43E    mov         edx,dword ptr [ebp-0C]
 0041F441    mov         eax,dword ptr [ebp-8]
 0041F444    call        SetFloatProp
>0041F449    jmp         0041F59F
 0041F44E    lea         edx,[ebp-20]
 0041F451    mov         eax,dword ptr [ebp-4]
 0041F454    call        TReader.ReadString
 0041F459    mov         ecx,dword ptr [ebp-20]
 0041F45C    mov         edx,dword ptr [ebp-0C]
 0041F45F    mov         eax,dword ptr [ebp-8]
 0041F462    call        SetStrProp
>0041F467    jmp         0041F59F
 0041F46C    lea         edx,[ebp-24]
 0041F46F    mov         eax,dword ptr [ebp-4]
 0041F472    call        TReader.ReadWideString
 0041F477    mov         ecx,dword ptr [ebp-24]
 0041F47A    mov         edx,dword ptr [ebp-0C]
 0041F47D    mov         eax,dword ptr [ebp-8]
 0041F480    call        SetWideStrProp
>0041F485    jmp         0041F59F
 0041F48A    mov         edx,ebx
 0041F48C    mov         eax,dword ptr [ebp-4]
 0041F48F    call        TReader.ReadSet
 0041F494    mov         ecx,eax
 0041F496    mov         edx,dword ptr [ebp-0C]
 0041F499    mov         eax,dword ptr [ebp-8]
 0041F49C    call        SetOrdProp
>0041F4A1    jmp         0041F59F
 0041F4A6    mov         eax,dword ptr [ebp-4]
 0041F4A9    call        TReader.NextValue
 0041F4AE    sub         al,0D
>0041F4B0    je          0041F4B8
 0041F4B2    dec         al
>0041F4B4    je          0041F4D2
>0041F4B6    jmp         0041F4F4
 0041F4B8    mov         eax,dword ptr [ebp-4]
 0041F4BB    call        TReader.ReadValue
 0041F4C0    xor         ecx,ecx
 0041F4C2    mov         edx,dword ptr [ebp-0C]
 0041F4C5    mov         eax,dword ptr [ebp-8]
 0041F4C8    call        SetOrdProp
>0041F4CD    jmp         0041F59F
 0041F4D2    mov         eax,dword ptr [ebp-4]
 0041F4D5    call        TReader.ReadValue
 0041F4DA    mov         edx,dword ptr [ebp-0C]
 0041F4DD    mov         eax,dword ptr [ebp-8]
 0041F4E0    call        GetOrdProp
 0041F4E5    mov         edx,eax
 0041F4E7    mov         eax,dword ptr [ebp-4]
 0041F4EA    call        TReader.ReadCollection
>0041F4EF    jmp         0041F59F
 0041F4F4    push        ebp
 0041F4F5    lea         edx,[ebp-28]
 0041F4F8    mov         eax,dword ptr [ebp-4]
 0041F4FB    call        TReader.ReadIdent
 0041F500    mov         ecx,dword ptr [ebp-28]
 0041F503    mov         edx,dword ptr [ebp-0C]
 0041F506    mov         eax,dword ptr [ebp-8]
 0041F509    call        SetObjectIdent
 0041F50E    pop         ecx
>0041F50F    jmp         0041F59F
 0041F514    mov         eax,dword ptr [ebp-4]
 0041F517    call        TReader.NextValue
 0041F51C    cmp         al,0D
>0041F51E    jne         0041F53A
 0041F520    mov         eax,dword ptr [ebp-4]
 0041F523    call        TReader.ReadValue
 0041F528    mov         ecx,5AC514
 0041F52D    mov         edx,dword ptr [ebp-0C]
 0041F530    mov         eax,dword ptr [ebp-8]
 0041F533    call        SetMethodProp
>0041F538    jmp         0041F59F
 0041F53A    lea         edx,[ebp-2C]
 0041F53D    mov         eax,dword ptr [ebp-4]
 0041F540    call        TReader.ReadIdent
 0041F545    mov         ecx,dword ptr [ebp-2C]
 0041F548    mov         eax,dword ptr [ebp-4]
 0041F54B    mov         edx,dword ptr [eax+18]
 0041F54E    mov         eax,dword ptr [ebp-4]
 0041F551    mov         ebx,dword ptr [eax]
 0041F553    call        dword ptr [ebx+18]
 0041F556    mov         dword ptr [ebp-14],eax
 0041F559    mov         eax,dword ptr [ebp-4]
 0041F55C    mov         eax,dword ptr [eax+18]
 0041F55F    mov         dword ptr [ebp-10],eax
 0041F562    cmp         dword ptr [ebp-14],0
>0041F566    je          0041F59F
 0041F568    lea         ecx,[ebp-14]
 0041F56B    mov         edx,dword ptr [ebp-0C]
 0041F56E    mov         eax,dword ptr [ebp-8]
 0041F571    call        SetMethodProp
>0041F576    jmp         0041F59F
 0041F578    push        ebp
 0041F579    call        SetVariantReference
 0041F57E    pop         ecx
>0041F57F    jmp         0041F59F
 0041F581    mov         eax,dword ptr [ebp-4]
 0041F584    call        TReader.ReadInt64
 0041F589    push        edx
 0041F58A    push        eax
 0041F58B    mov         edx,dword ptr [ebp-0C]
 0041F58E    mov         eax,dword ptr [ebp-8]
 0041F591    call        SetInt64Prop
>0041F596    jmp         0041F59F
 0041F598    push        ebp
 0041F599    call        SetInterfaceReference
 0041F59E    pop         ecx
 0041F59F    xor         eax,eax
 0041F5A1    pop         edx
 0041F5A2    pop         ecx
 0041F5A3    pop         ecx
 0041F5A4    mov         dword ptr fs:[eax],edx
 0041F5A7    push        41F5D6
 0041F5AC    lea         eax,[ebp-2C]
 0041F5AF    mov         edx,2
 0041F5B4    call        @LStrArrayClr
 0041F5B9    lea         eax,[ebp-24]
 0041F5BC    call        @WStrClr
 0041F5C1    lea         eax,[ebp-20]
 0041F5C4    mov         edx,3
 0041F5C9    call        @LStrArrayClr
 0041F5CE    ret
>0041F5CF    jmp         @HandleFinally
>0041F5D4    jmp         0041F5AC
 0041F5D6    pop         ebx
 0041F5D7    mov         esp,ebp
 0041F5D9    pop         ebp
 0041F5DA    ret
*}
end;

//0041F5DC
function FindUniqueName(const Name:AnsiString):AnsiString;
begin
{*
 0041F5DC    push        ebp
 0041F5DD    mov         ebp,esp
 0041F5DF    add         esp,0FFFFFFF0
 0041F5E2    push        ebx
 0041F5E3    push        esi
 0041F5E4    push        edi
 0041F5E5    mov         ebx,edx
 0041F5E7    mov         edi,eax
 0041F5E9    xor         esi,esi
 0041F5EB    mov         eax,ebx
 0041F5ED    mov         edx,edi
 0041F5EF    call        @LStrAsg
>0041F5F4    jmp         0041F618
 0041F5F6    inc         esi
 0041F5F7    push        ebx
 0041F5F8    mov         dword ptr [ebp-10],edi
 0041F5FB    mov         byte ptr [ebp-0C],0B
 0041F5FF    mov         dword ptr [ebp-8],esi
 0041F602    mov         byte ptr [ebp-4],0
 0041F606    lea         edx,[ebp-10]
 0041F609    mov         ecx,1
 0041F60E    mov         eax,41F634;'%s_%d'
 0041F613    call        Format
 0041F618    mov         eax,dword ptr [ebx]
 0041F61A    call        IsUniqueGlobalComponentName
 0041F61F    test        al,al
>0041F621    je          0041F5F6
 0041F623    pop         edi
 0041F624    pop         esi
 0041F625    pop         ebx
 0041F626    mov         esp,ebp
 0041F628    pop         ebp
 0041F629    ret
*}
end;

//0041F63C
function TReader.ReadRootComponent(Root:TComponent):TComponent;
begin
{*
 0041F63C    push        ebp
 0041F63D    mov         ebp,esp
 0041F63F    add         esp,0FFFFFFD0
 0041F642    push        ebx
 0041F643    push        esi
 0041F644    push        edi
 0041F645    xor         ecx,ecx
 0041F647    mov         dword ptr [ebp-2C],ecx
 0041F64A    mov         dword ptr [ebp-30],ecx
 0041F64D    mov         dword ptr [ebp-28],ecx
 0041F650    mov         dword ptr [ebp-24],ecx
 0041F653    mov         dword ptr [ebp-20],ecx
 0041F656    mov         dword ptr [ebp-1C],ecx
 0041F659    mov         dword ptr [ebp-8],edx
 0041F65C    mov         dword ptr [ebp-4],eax
 0041F65F    xor         eax,eax
 0041F661    push        ebp
 0041F662    push        41F957
 0041F667    push        dword ptr fs:[eax]
 0041F66A    mov         dword ptr fs:[eax],esp
 0041F66D    mov         eax,dword ptr [ebp-4]
 0041F670    call        TReader.ReadSignature
 0041F675    xor         eax,eax
 0041F677    mov         dword ptr [ebp-0C],eax
 0041F67A    mov         eax,[005E0918];GlobalNameSpace:IReadWriteSync
 0041F67F    mov         edx,dword ptr [eax]
 0041F681    call        dword ptr [edx+14]
 0041F684    xor         eax,eax
 0041F686    push        ebp
 0041F687    push        41F935
 0041F68C    push        dword ptr fs:[eax]
 0041F68F    mov         dword ptr fs:[eax],esp
 0041F692    xor         eax,eax
 0041F694    push        ebp
 0041F695    push        41F8F6
 0041F69A    push        dword ptr fs:[eax]
 0041F69D    mov         dword ptr fs:[eax],esp
 0041F6A0    lea         ecx,[ebp-10]
 0041F6A3    lea         edx,[ebp-11]
 0041F6A6    mov         eax,dword ptr [ebp-4]
 0041F6A9    mov         ebx,dword ptr [eax]
 0041F6AB    call        dword ptr [ebx+24]
 0041F6AE    cmp         dword ptr [ebp-8],0
>0041F6B2    jne         0041F6E9
 0041F6B4    lea         edx,[ebp-1C]
 0041F6B7    mov         eax,dword ptr [ebp-4]
 0041F6BA    call        TReader.ReadStr
 0041F6BF    mov         eax,dword ptr [ebp-1C]
 0041F6C2    call        FindClass
 0041F6C7    xor         ecx,ecx
 0041F6C9    mov         dl,1
 0041F6CB    call        dword ptr [eax+2C]
 0041F6CE    mov         dword ptr [ebp-0C],eax
 0041F6D1    lea         edx,[ebp-20]
 0041F6D4    mov         eax,dword ptr [ebp-4]
 0041F6D7    call        TReader.ReadStr
 0041F6DC    mov         edx,dword ptr [ebp-20]
 0041F6DF    mov         eax,dword ptr [ebp-0C]
 0041F6E2    mov         ecx,dword ptr [eax]
 0041F6E4    call        dword ptr [ecx+18]
>0041F6E7    jmp         0041F741
 0041F6E9    mov         eax,dword ptr [ebp-8]
 0041F6EC    mov         dword ptr [ebp-0C],eax
 0041F6EF    lea         edx,[ebp-24]
 0041F6F2    mov         eax,dword ptr [ebp-4]
 0041F6F5    call        TReader.ReadStr
 0041F6FA    mov         eax,dword ptr [ebp-0C]
 0041F6FD    test        byte ptr [eax+1C],10
>0041F701    je          0041F710
 0041F703    lea         edx,[ebp-28]
 0041F706    mov         eax,dword ptr [ebp-4]
 0041F709    call        TReader.ReadStr
>0041F70E    jmp         0041F741
 0041F710    mov         eax,dword ptr [ebp-0C]
 0041F713    or          word ptr [eax+1C],1
 0041F718    mov         eax,dword ptr [ebp-0C]
 0041F71B    or          word ptr [eax+1C],2
 0041F720    lea         edx,[ebp-30]
 0041F723    mov         eax,dword ptr [ebp-4]
 0041F726    call        TReader.ReadStr
 0041F72B    mov         eax,dword ptr [ebp-30]
 0041F72E    lea         edx,[ebp-2C]
 0041F731    call        FindUniqueName
 0041F736    mov         edx,dword ptr [ebp-2C]
 0041F739    mov         eax,dword ptr [ebp-0C]
 0041F73C    mov         ecx,dword ptr [eax]
 0041F73E    call        dword ptr [ecx+18]
 0041F741    mov         eax,dword ptr [ebp-4]
 0041F744    mov         edx,dword ptr [ebp-0C]
 0041F747    mov         dword ptr [eax+18],edx
 0041F74A    push        1
 0041F74C    mov         eax,dword ptr [ebp-0C]
 0041F74F    call        TObject.ClassType
 0041F754    mov         ecx,eax
 0041F756    mov         dl,1
 0041F758    mov         eax,[00418958];TClassFinder
 0041F75D    call        TClassFinder.Create
 0041F762    mov         edx,dword ptr [ebp-4]
 0041F765    mov         dword ptr [edx+74],eax
 0041F768    xor         eax,eax
 0041F76A    push        ebp
 0041F76B    push        41F89B
 0041F770    push        dword ptr fs:[eax]
 0041F773    mov         dword ptr fs:[eax],esp
 0041F776    mov         eax,dword ptr [ebp-4]
 0041F779    mov         edx,dword ptr [ebp-0C]
 0041F77C    mov         dword ptr [eax+1C],edx
 0041F77F    call        @GetTls
 0041F784    mov         eax,dword ptr [eax+8];{GlobalLoaded:TList}
 0041F78A    mov         dword ptr [ebp-18],eax
 0041F78D    cmp         dword ptr [ebp-18],0
>0041F791    je          0041F79E
 0041F793    mov         eax,dword ptr [ebp-4]
 0041F796    mov         edx,dword ptr [ebp-18]
 0041F799    mov         dword ptr [eax+34],edx
>0041F79C    jmp         0041F7B0
 0041F79E    mov         dl,1
 0041F7A0    mov         eax,[00417CEC];TList
 0041F7A5    call        TObject.Create
 0041F7AA    mov         edx,dword ptr [ebp-4]
 0041F7AD    mov         dword ptr [edx+34],eax
 0041F7B0    xor         eax,eax
 0041F7B2    push        ebp
 0041F7B3    push        41F87B
 0041F7B8    push        dword ptr fs:[eax]
 0041F7BB    mov         dword ptr fs:[eax],esp
 0041F7BE    mov         eax,dword ptr [ebp-4]
 0041F7C1    mov         edx,dword ptr [eax+18]
 0041F7C4    mov         eax,dword ptr [ebp-4]
 0041F7C7    mov         eax,dword ptr [eax+34]
 0041F7CA    call        TList.IndexOf
 0041F7CF    test        eax,eax
>0041F7D1    jge         0041F7E4
 0041F7D3    mov         eax,dword ptr [ebp-4]
 0041F7D6    mov         edx,dword ptr [eax+18]
 0041F7D9    mov         eax,dword ptr [ebp-4]
 0041F7DC    mov         eax,dword ptr [eax+34]
 0041F7DF    call        TList.Add
 0041F7E4    mov         eax,dword ptr [ebp-4]
 0041F7E7    mov         eax,dword ptr [eax+18]
 0041F7EA    mov         edx,dword ptr [ebp-4]
 0041F7ED    mov         dword ptr [edx+28],eax
 0041F7F0    mov         eax,dword ptr [ebp-4]
 0041F7F3    mov         eax,dword ptr [eax+18]
 0041F7F6    or          word ptr [eax+1C],1
 0041F7FB    mov         eax,dword ptr [ebp-4]
 0041F7FE    mov         eax,dword ptr [eax+18]
 0041F801    or          word ptr [eax+1C],2
 0041F806    mov         eax,dword ptr [ebp-4]
 0041F809    mov         eax,dword ptr [eax+18]
 0041F80C    mov         edx,dword ptr [ebp-4]
 0041F80F    mov         ecx,dword ptr [eax]
 0041F811    call        dword ptr [ecx+14]
 0041F814    mov         eax,dword ptr [ebp-4]
 0041F817    mov         eax,dword ptr [eax+18]
 0041F81A    and         word ptr [eax+1C],0FFFFFFFD
 0041F81F    cmp         dword ptr [ebp-18],0
>0041F823    jne         0041F854
 0041F825    mov         eax,dword ptr [ebp-4]
 0041F828    mov         eax,dword ptr [eax+34]
 0041F82B    mov         ebx,dword ptr [eax+8]
 0041F82E    dec         ebx
 0041F82F    test        ebx,ebx
>0041F831    jl          0041F854
 0041F833    inc         ebx
 0041F834    mov         dword ptr [ebp-10],0
 0041F83B    mov         eax,dword ptr [ebp-4]
 0041F83E    mov         eax,dword ptr [eax+34]
 0041F841    mov         edx,dword ptr [ebp-10]
 0041F844    call        TList.Get
 0041F849    mov         edx,dword ptr [eax]
 0041F84B    call        dword ptr [edx+0C]
 0041F84E    inc         dword ptr [ebp-10]
 0041F851    dec         ebx
>0041F852    jne         0041F83B
 0041F854    xor         eax,eax
 0041F856    pop         edx
 0041F857    pop         ecx
 0041F858    pop         ecx
 0041F859    mov         dword ptr fs:[eax],edx
 0041F85C    push        41F882
 0041F861    cmp         dword ptr [ebp-18],0
>0041F865    jne         0041F872
 0041F867    mov         eax,dword ptr [ebp-4]
 0041F86A    mov         eax,dword ptr [eax+34]
 0041F86D    call        TObject.Free
 0041F872    mov         eax,dword ptr [ebp-4]
 0041F875    xor         edx,edx
 0041F877    mov         dword ptr [eax+34],edx
 0041F87A    ret
>0041F87B    jmp         @HandleFinally
>0041F880    jmp         0041F861
 0041F882    xor         eax,eax
 0041F884    pop         edx
 0041F885    pop         ecx
 0041F886    pop         ecx
 0041F887    mov         dword ptr fs:[eax],edx
 0041F88A    push        41F8A2
 0041F88F    mov         eax,dword ptr [ebp-4]
 0041F892    mov         eax,dword ptr [eax+74]
 0041F895    call        TObject.Free
 0041F89A    ret
>0041F89B    jmp         @HandleFinally
>0041F8A0    jmp         0041F88F
 0041F8A2    xor         eax,eax
 0041F8A4    push        ebp
 0041F8A5    push        41F8C7
 0041F8AA    push        dword ptr fs:[eax]
 0041F8AD    mov         dword ptr fs:[eax],esp
 0041F8B0    call        GlobalFixupReferences
 0041F8B5    xor         eax,eax
 0041F8B7    pop         edx
 0041F8B8    pop         ecx
 0041F8B9    pop         ecx
 0041F8BA    mov         dword ptr fs:[eax],edx
>0041F8BD    jmp         0041F8EC
 0041F8BF    xor         eax,eax
 0041F8C1    pop         edx
 0041F8C2    pop         ecx
 0041F8C3    pop         ecx
 0041F8C4    mov         dword ptr fs:[eax],edx
>0041F8C7    jmp         @HandleAnyException
 0041F8CC    call        ExceptObject
 0041F8D1    mov         edx,dword ptr [eax+4]
 0041F8D4    mov         eax,dword ptr [ebp-4]
 0041F8D7    mov         ecx,dword ptr [eax]
 0041F8D9    call        dword ptr [ecx+10]
 0041F8DC    test        al,al
>0041F8DE    jne         0041F8E5
 0041F8E0    call        @RaiseAgain
 0041F8E5    call        @DoneExcept
>0041F8EA    jmp         0041F8A2
 0041F8EC    xor         eax,eax
 0041F8EE    pop         edx
 0041F8EF    pop         ecx
 0041F8F0    pop         ecx
 0041F8F1    mov         dword ptr fs:[eax],edx
>0041F8F4    jmp         0041F91D
>0041F8F6    jmp         @HandleAnyException
 0041F8FB    xor         edx,edx
 0041F8FD    mov         eax,dword ptr [ebp-8]
 0041F900    call        RemoveFixupReferences
 0041F905    cmp         dword ptr [ebp-8],0
>0041F909    jne         0041F913
 0041F90B    mov         eax,dword ptr [ebp-0C]
 0041F90E    call        TObject.Free
 0041F913    call        @RaiseAgain
 0041F918    call        @DoneExcept
 0041F91D    xor         eax,eax
 0041F91F    pop         edx
 0041F920    pop         ecx
 0041F921    pop         ecx
 0041F922    mov         dword ptr fs:[eax],edx
 0041F925    push        41F93C
 0041F92A    mov         eax,[005E0918];GlobalNameSpace:IReadWriteSync
 0041F92F    mov         edx,dword ptr [eax]
 0041F931    call        dword ptr [edx+18]
 0041F934    ret
>0041F935    jmp         @HandleFinally
>0041F93A    jmp         0041F92A
 0041F93C    xor         eax,eax
 0041F93E    pop         edx
 0041F93F    pop         ecx
 0041F940    pop         ecx
 0041F941    mov         dword ptr fs:[eax],edx
 0041F944    push        41F95E
 0041F949    lea         eax,[ebp-30]
 0041F94C    mov         edx,6
 0041F951    call        @LStrArrayClr
 0041F956    ret
>0041F957    jmp         @HandleFinally
>0041F95C    jmp         0041F949
 0041F95E    mov         eax,dword ptr [ebp-0C]
 0041F961    pop         edi
 0041F962    pop         esi
 0041F963    pop         ebx
 0041F964    mov         esp,ebp
 0041F966    pop         ebp
 0041F967    ret
*}
end;

//0041F968
function TReader.ReadSet(SetType:Pointer):Integer;
begin
{*
 0041F968    push        ebp
 0041F969    mov         ebp,esp
 0041F96B    add         esp,0FFFFFFF8
 0041F96E    push        ebx
 0041F96F    push        esi
 0041F970    push        edi
 0041F971    xor         ecx,ecx
 0041F973    mov         dword ptr [ebp-8],ecx
 0041F976    mov         ebx,edx
 0041F978    mov         dword ptr [ebp-4],eax
 0041F97B    xor         eax,eax
 0041F97D    push        ebp
 0041F97E    push        41FA12
 0041F983    push        dword ptr fs:[eax]
 0041F986    mov         dword ptr fs:[eax],esp
 0041F989    xor         eax,eax
 0041F98B    push        ebp
 0041F98C    push        41F9E5
 0041F991    push        dword ptr fs:[eax]
 0041F994    mov         dword ptr fs:[eax],esp
 0041F997    mov         eax,dword ptr [ebp-4]
 0041F99A    call        TReader.ReadValue
 0041F99F    cmp         al,0B
>0041F9A1    je          0041F9A8
 0041F9A3    call        PropValueError
 0041F9A8    mov         eax,ebx
 0041F9AA    call        GetTypeData
 0041F9AF    mov         eax,dword ptr [eax+1]
 0041F9B2    mov         esi,dword ptr [eax]
 0041F9B4    xor         ebx,ebx
 0041F9B6    lea         edx,[ebp-8]
 0041F9B9    mov         eax,dword ptr [ebp-4]
 0041F9BC    call        TReader.ReadStr
 0041F9C1    cmp         dword ptr [ebp-8],0
>0041F9C5    je          0041F9DB
 0041F9C7    mov         edx,dword ptr [ebp-8]
 0041F9CA    mov         eax,esi
 0041F9CC    call        EnumValue
 0041F9D1    cmp         eax,1F
>0041F9D4    ja          0041F9B6
 0041F9D6    bts         ebx,eax
>0041F9D9    jmp         0041F9B6
 0041F9DB    xor         eax,eax
 0041F9DD    pop         edx
 0041F9DE    pop         ecx
 0041F9DF    pop         ecx
 0041F9E0    mov         dword ptr fs:[eax],edx
>0041F9E3    jmp         0041F9FC
>0041F9E5    jmp         @HandleAnyException
 0041F9EA    mov         eax,dword ptr [ebp-4]
 0041F9ED    call        TReader.SkipSetBody
 0041F9F2    call        @RaiseAgain
 0041F9F7    call        @DoneExcept
 0041F9FC    xor         eax,eax
 0041F9FE    pop         edx
 0041F9FF    pop         ecx
 0041FA00    pop         ecx
 0041FA01    mov         dword ptr fs:[eax],edx
 0041FA04    push        41FA19
 0041FA09    lea         eax,[ebp-8]
 0041FA0C    call        @LStrClr
 0041FA11    ret
>0041FA12    jmp         @HandleFinally
>0041FA17    jmp         0041FA09
 0041FA19    mov         eax,ebx
 0041FA1B    pop         edi
 0041FA1C    pop         esi
 0041FA1D    pop         ebx
 0041FA1E    pop         ecx
 0041FA1F    pop         ecx
 0041FA20    pop         ebp
 0041FA21    ret
*}
end;

//0041FA24
procedure TReader.ReadSignature;
begin
{*
 0041FA24    push        ecx
 0041FA25    mov         edx,esp
 0041FA27    mov         ecx,4
 0041FA2C    call        TReader.Read
 0041FA31    mov         eax,dword ptr [esp]
 0041FA34    cmp         eax,dword ptr ds:[5AC510]
>0041FA3A    je          0041FA46
 0041FA3C    mov         eax,[005AE3EC];^SInvalidImage:TResStringRec
 0041FA41    call        ReadError
 0041FA46    pop         edx
 0041FA47    ret
*}
end;

//0041FA48
function TReader.ReadStr:AnsiString;
begin
{*
 0041FA48    push        ebx
 0041FA49    push        esi
 0041FA4A    push        ecx
 0041FA4B    mov         esi,edx
 0041FA4D    mov         ebx,eax
 0041FA4F    mov         edx,esp
 0041FA51    mov         ecx,1
 0041FA56    mov         eax,ebx
 0041FA58    call        TReader.Read
 0041FA5D    xor         ecx,ecx
 0041FA5F    mov         cl,byte ptr [esp]
 0041FA62    mov         eax,esi
 0041FA64    xor         edx,edx
 0041FA66    call        @LStrFromPCharLen
 0041FA6B    mov         eax,esi
 0041FA6D    call        @UniqueStringA
 0041FA72    mov         edx,eax
 0041FA74    xor         ecx,ecx
 0041FA76    mov         cl,byte ptr [esp]
 0041FA79    mov         eax,ebx
 0041FA7B    call        TReader.Read
 0041FA80    pop         edx
 0041FA81    pop         esi
 0041FA82    pop         ebx
 0041FA83    ret
*}
end;

//0041FA84
function TReader.ReadString:AnsiString;
begin
{*
 0041FA84    push        ebp
 0041FA85    mov         ebp,esp
 0041FA87    add         esp,0FFFFFFF8
 0041FA8A    push        ebx
 0041FA8B    push        esi
 0041FA8C    xor         ecx,ecx
 0041FA8E    mov         dword ptr [ebp-8],ecx
 0041FA91    mov         esi,edx
 0041FA93    mov         ebx,eax
 0041FA95    xor         eax,eax
 0041FA97    push        ebp
 0041FA98    push        41FB31
 0041FA9D    push        dword ptr fs:[eax]
 0041FAA0    mov         dword ptr fs:[eax],esp
 0041FAA3    mov         eax,ebx
 0041FAA5    call        TReader.NextValue
 0041FAAA    sub         al,12
>0041FAAC    je          0041FAB2
 0041FAAE    sub         al,2
>0041FAB0    jne         0041FAC8
 0041FAB2    lea         edx,[ebp-8]
 0041FAB5    mov         eax,ebx
 0041FAB7    call        TReader.ReadWideString
 0041FABC    mov         edx,dword ptr [ebp-8]
 0041FABF    mov         eax,esi
 0041FAC1    call        @LStrFromWStr
>0041FAC6    jmp         0041FB1B
 0041FAC8    xor         eax,eax
 0041FACA    mov         dword ptr [ebp-4],eax
 0041FACD    mov         eax,ebx
 0041FACF    call        TReader.ReadValue
 0041FAD4    sub         al,6
>0041FAD6    je          0041FADE
 0041FAD8    sub         al,6
>0041FADA    je          0041FAEF
>0041FADC    jmp         0041FB00
 0041FADE    lea         edx,[ebp-4]
 0041FAE1    mov         ecx,1
 0041FAE6    mov         eax,ebx
 0041FAE8    call        TReader.Read
>0041FAED    jmp         0041FB05
 0041FAEF    lea         edx,[ebp-4]
 0041FAF2    mov         ecx,4
 0041FAF7    mov         eax,ebx
 0041FAF9    call        TReader.Read
>0041FAFE    jmp         0041FB05
 0041FB00    call        PropValueError
 0041FB05    mov         eax,esi
 0041FB07    mov         edx,dword ptr [ebp-4]
 0041FB0A    call        @LStrSetLength
 0041FB0F    mov         edx,dword ptr [esi]
 0041FB11    mov         ecx,dword ptr [ebp-4]
 0041FB14    mov         eax,ebx
 0041FB16    call        TReader.Read
 0041FB1B    xor         eax,eax
 0041FB1D    pop         edx
 0041FB1E    pop         ecx
 0041FB1F    pop         ecx
 0041FB20    mov         dword ptr fs:[eax],edx
 0041FB23    push        41FB38
 0041FB28    lea         eax,[ebp-8]
 0041FB2B    call        @WStrClr
 0041FB30    ret
>0041FB31    jmp         @HandleFinally
>0041FB36    jmp         0041FB28
 0041FB38    pop         esi
 0041FB39    pop         ebx
 0041FB3A    pop         ecx
 0041FB3B    pop         ecx
 0041FB3C    pop         ebp
 0041FB3D    ret
*}
end;

//0041FB40
function TReader.ReadWideString:WideString;
begin
{*
 0041FB40    push        ebp
 0041FB41    mov         ebp,esp
 0041FB43    push        0
 0041FB45    push        0
 0041FB47    push        0
 0041FB49    push        ebx
 0041FB4A    push        esi
 0041FB4B    mov         esi,edx
 0041FB4D    mov         ebx,eax
 0041FB4F    xor         eax,eax
 0041FB51    push        ebp
 0041FB52    push        41FC17
 0041FB57    push        dword ptr fs:[eax]
 0041FB5A    mov         dword ptr fs:[eax],esp
 0041FB5D    mov         eax,ebx
 0041FB5F    call        TReader.NextValue
 0041FB64    sub         al,6
>0041FB66    je          0041FB6C
 0041FB68    sub         al,6
>0041FB6A    jne         0041FB82
 0041FB6C    lea         edx,[ebp-0C]
 0041FB6F    mov         eax,ebx
 0041FB71    call        TReader.ReadString
 0041FB76    mov         edx,dword ptr [ebp-0C]
 0041FB79    mov         eax,esi
 0041FB7B    call        @WStrFromLStr
>0041FB80    jmp         0041FBF9
 0041FB82    xor         eax,eax
 0041FB84    mov         dword ptr [ebp-4],eax
 0041FB87    mov         eax,ebx
 0041FB89    call        TReader.ReadValue
 0041FB8E    sub         al,12
>0041FB90    je          0041FB98
 0041FB92    sub         al,2
>0041FB94    je          0041FBC1
>0041FB96    jmp         0041FBF4
 0041FB98    lea         edx,[ebp-4]
 0041FB9B    mov         ecx,4
 0041FBA0    mov         eax,ebx
 0041FBA2    call        TReader.Read
 0041FBA7    mov         eax,esi
 0041FBA9    mov         edx,dword ptr [ebp-4]
 0041FBAC    call        @WStrSetLength
 0041FBB1    mov         ecx,dword ptr [ebp-4]
 0041FBB4    add         ecx,ecx
 0041FBB6    mov         edx,dword ptr [esi]
 0041FBB8    mov         eax,ebx
 0041FBBA    call        TReader.Read
>0041FBBF    jmp         0041FBF9
 0041FBC1    lea         edx,[ebp-4]
 0041FBC4    mov         ecx,4
 0041FBC9    mov         eax,ebx
 0041FBCB    call        TReader.Read
 0041FBD0    lea         eax,[ebp-8]
 0041FBD3    mov         edx,dword ptr [ebp-4]
 0041FBD6    call        @LStrSetLength
 0041FBDB    mov         edx,dword ptr [ebp-8]
 0041FBDE    mov         ecx,dword ptr [ebp-4]
 0041FBE1    mov         eax,ebx
 0041FBE3    call        TReader.Read
 0041FBE8    mov         edx,esi
 0041FBEA    mov         eax,dword ptr [ebp-8]
 0041FBED    call        UTF8Decode
>0041FBF2    jmp         0041FBF9
 0041FBF4    call        PropValueError
 0041FBF9    xor         eax,eax
 0041FBFB    pop         edx
 0041FBFC    pop         ecx
 0041FBFD    pop         ecx
 0041FBFE    mov         dword ptr fs:[eax],edx
 0041FC01    push        41FC1E
 0041FC06    lea         eax,[ebp-0C]
 0041FC09    call        @LStrClr
 0041FC0E    lea         eax,[ebp-8]
 0041FC11    call        @LStrClr
 0041FC16    ret
>0041FC17    jmp         @HandleFinally
>0041FC1C    jmp         0041FC06
 0041FC1E    pop         esi
 0041FC1F    pop         ebx
 0041FC20    mov         esp,ebp
 0041FC22    pop         ebp
 0041FC23    ret
*}
end;

//0041FC24
function TReader.ReadValue:TValueType;
begin
{*
 0041FC24    push        ecx
 0041FC25    mov         edx,esp
 0041FC27    mov         ecx,1
 0041FC2C    call        TReader.Read
 0041FC31    mov         al,byte ptr [esp]
 0041FC34    pop         edx
 0041FC35    ret
*}
end;

//0041FC38
procedure TReader.SkipSetBody;
begin
{*
 0041FC38    push        ebp
 0041FC39    mov         ebp,esp
 0041FC3B    push        0
 0041FC3D    push        ebx
 0041FC3E    mov         ebx,eax
 0041FC40    xor         eax,eax
 0041FC42    push        ebp
 0041FC43    push        41FC74
 0041FC48    push        dword ptr fs:[eax]
 0041FC4B    mov         dword ptr fs:[eax],esp
 0041FC4E    lea         edx,[ebp-4]
 0041FC51    mov         eax,ebx
 0041FC53    call        TReader.ReadStr
 0041FC58    cmp         dword ptr [ebp-4],0
>0041FC5C    jne         0041FC4E
 0041FC5E    xor         eax,eax
 0041FC60    pop         edx
 0041FC61    pop         ecx
 0041FC62    pop         ecx
 0041FC63    mov         dword ptr fs:[eax],edx
 0041FC66    push        41FC7B
 0041FC6B    lea         eax,[ebp-4]
 0041FC6E    call        @LStrClr
 0041FC73    ret
>0041FC74    jmp         @HandleFinally
>0041FC79    jmp         0041FC6B
 0041FC7B    pop         ebx
 0041FC7C    pop         ecx
 0041FC7D    pop         ebp
 0041FC7E    ret
*}
end;

//0041FC80
procedure SkipList;
begin
{*
 0041FC80    push        ebp
 0041FC81    mov         ebp,esp
 0041FC83    push        ebx
 0041FC84    mov         ebx,dword ptr [ebp+8]
 0041FC87    add         ebx,0FFFFFFFC
>0041FC8A    jmp         0041FC93
 0041FC8C    mov         eax,dword ptr [ebx]
 0041FC8E    call        TReader.SkipValue
 0041FC93    mov         eax,dword ptr [ebx]
 0041FC95    call        TReader.EndOfList
 0041FC9A    test        al,al
>0041FC9C    je          0041FC8C
 0041FC9E    mov         eax,dword ptr [ebx]
 0041FCA0    call        TReader.ReadListEnd
 0041FCA5    pop         ebx
 0041FCA6    pop         ebp
 0041FCA7    ret
*}
end;

//0041FCA8
procedure SkipBinary(BytesPerUnit:Integer);
begin
{*
 0041FCA8    push        ebp
 0041FCA9    mov         ebp,esp
 0041FCAB    push        ecx
 0041FCAC    push        ebx
 0041FCAD    mov         ebx,eax
 0041FCAF    lea         edx,[ebp-4]
 0041FCB2    mov         eax,dword ptr [ebp+8]
 0041FCB5    mov         eax,dword ptr [eax-4]
 0041FCB8    mov         ecx,4
 0041FCBD    call        TReader.Read
 0041FCC2    mov         edx,dword ptr [ebp-4]
 0041FCC5    imul        edx,ebx
 0041FCC8    mov         eax,dword ptr [ebp+8]
 0041FCCB    mov         eax,dword ptr [eax-4]
 0041FCCE    call        TReader.SkipBytes
 0041FCD3    pop         ebx
 0041FCD4    pop         ecx
 0041FCD5    pop         ebp
 0041FCD6    ret
*}
end;

//0041FCD8
procedure SkipCollection;
begin
{*
 0041FCD8    push        ebp
 0041FCD9    mov         ebp,esp
 0041FCDB    push        ebx
 0041FCDC    mov         ebx,dword ptr [ebp+8]
 0041FCDF    add         ebx,0FFFFFFFC
>0041FCE2    jmp         0041FD1F
 0041FCE4    mov         eax,dword ptr [ebx]
 0041FCE6    call        TReader.NextValue
 0041FCEB    add         al,0FE
 0041FCED    sub         al,3
>0041FCEF    jae         0041FCF8
 0041FCF1    mov         eax,dword ptr [ebx]
 0041FCF3    call        TReader.SkipValue
 0041FCF8    mov         eax,dword ptr [ebx]
 0041FCFA    mov         edx,1
 0041FCFF    call        TReader.SkipBytes
>0041FD04    jmp         0041FD0D
 0041FD06    mov         eax,dword ptr [ebx]
 0041FD08    call        TReader.SkipProperty
 0041FD0D    mov         eax,dword ptr [ebx]
 0041FD0F    call        TReader.EndOfList
 0041FD14    test        al,al
>0041FD16    je          0041FD06
 0041FD18    mov         eax,dword ptr [ebx]
 0041FD1A    call        TReader.ReadListEnd
 0041FD1F    mov         eax,dword ptr [ebx]
 0041FD21    call        TReader.EndOfList
 0041FD26    test        al,al
>0041FD28    je          0041FCE4
 0041FD2A    mov         eax,dword ptr [ebx]
 0041FD2C    call        TReader.ReadListEnd
 0041FD31    pop         ebx
 0041FD32    pop         ebp
 0041FD33    ret
*}
end;

//0041FD34
procedure TReader.SkipValue;
begin
{*
 0041FD34    push        ebp
 0041FD35    mov         ebp,esp
 0041FD37    add         esp,0FFFFFFF8
 0041FD3A    xor         edx,edx
 0041FD3C    mov         dword ptr [ebp-8],edx
 0041FD3F    mov         dword ptr [ebp-4],eax
 0041FD42    xor         eax,eax
 0041FD44    push        ebp
 0041FD45    push        41FEC3
 0041FD4A    push        dword ptr fs:[eax]
 0041FD4D    mov         dword ptr fs:[eax],esp
 0041FD50    mov         eax,dword ptr [ebp-4]
 0041FD53    call        TReader.ReadValue
 0041FD58    and         eax,7F
 0041FD5B    cmp         eax,14
>0041FD5E    ja          0041FEAD
 0041FD64    jmp         dword ptr [eax*4+41FD6B]
 0041FD64    dd          0041FEAD
 0041FD64    dd          0041FDC4
 0041FD64    dd          0041FDD0
 0041FD64    dd          0041FDE2
 0041FD64    dd          0041FDF4
 0041FD64    dd          0041FE06
 0041FD64    dd          0041FE18
 0041FD64    dd          0041FE18
 0041FD64    dd          0041FEAD
 0041FD64    dd          0041FEAD
 0041FD64    dd          0041FE28
 0041FD64    dd          0041FE36
 0041FD64    dd          0041FE40
 0041FD64    dd          0041FEAD
 0041FD64    dd          0041FE4E
 0041FD64    dd          0041FE57
 0041FD64    dd          0041FE66
 0041FD64    dd          0041FE75
 0041FD64    dd          0041FE84
 0041FD64    dd          0041FE92
 0041FD64    dd          0041FEA1
>0041FDBF    jmp         0041FEAD
 0041FDC4    push        ebp
 0041FDC5    call        SkipList
 0041FDCA    pop         ecx
>0041FDCB    jmp         0041FEAD
 0041FDD0    mov         edx,1
 0041FDD5    mov         eax,dword ptr [ebp-4]
 0041FDD8    call        TReader.SkipBytes
>0041FDDD    jmp         0041FEAD
 0041FDE2    mov         edx,2
 0041FDE7    mov         eax,dword ptr [ebp-4]
 0041FDEA    call        TReader.SkipBytes
>0041FDEF    jmp         0041FEAD
 0041FDF4    mov         edx,4
 0041FDF9    mov         eax,dword ptr [ebp-4]
 0041FDFC    call        TReader.SkipBytes
>0041FE01    jmp         0041FEAD
 0041FE06    mov         edx,0A
 0041FE0B    mov         eax,dword ptr [ebp-4]
 0041FE0E    call        TReader.SkipBytes
>0041FE13    jmp         0041FEAD
 0041FE18    lea         edx,[ebp-8]
 0041FE1B    mov         eax,dword ptr [ebp-4]
 0041FE1E    call        TReader.ReadStr
>0041FE23    jmp         0041FEAD
 0041FE28    push        ebp
 0041FE29    mov         eax,1
 0041FE2E    call        SkipBinary
 0041FE33    pop         ecx
>0041FE34    jmp         0041FEAD
 0041FE36    mov         eax,dword ptr [ebp-4]
 0041FE39    call        TReader.SkipSetBody
>0041FE3E    jmp         0041FEAD
 0041FE40    push        ebp
 0041FE41    mov         eax,1
 0041FE46    call        SkipBinary
 0041FE4B    pop         ecx
>0041FE4C    jmp         0041FEAD
 0041FE4E    push        ebp
 0041FE4F    call        SkipCollection
 0041FE54    pop         ecx
>0041FE55    jmp         0041FEAD
 0041FE57    mov         edx,4
 0041FE5C    mov         eax,dword ptr [ebp-4]
 0041FE5F    call        TReader.SkipBytes
>0041FE64    jmp         0041FEAD
 0041FE66    mov         edx,8
 0041FE6B    mov         eax,dword ptr [ebp-4]
 0041FE6E    call        TReader.SkipBytes
>0041FE73    jmp         0041FEAD
 0041FE75    mov         edx,8
 0041FE7A    mov         eax,dword ptr [ebp-4]
 0041FE7D    call        TReader.SkipBytes
>0041FE82    jmp         0041FEAD
 0041FE84    push        ebp
 0041FE85    mov         eax,2
 0041FE8A    call        SkipBinary
 0041FE8F    pop         ecx
>0041FE90    jmp         0041FEAD
 0041FE92    mov         edx,8
 0041FE97    mov         eax,dword ptr [ebp-4]
 0041FE9A    call        TReader.SkipBytes
>0041FE9F    jmp         0041FEAD
 0041FEA1    push        ebp
 0041FEA2    mov         eax,1
 0041FEA7    call        SkipBinary
 0041FEAC    pop         ecx
 0041FEAD    xor         eax,eax
 0041FEAF    pop         edx
 0041FEB0    pop         ecx
 0041FEB1    pop         ecx
 0041FEB2    mov         dword ptr fs:[eax],edx
 0041FEB5    push        41FECA
 0041FEBA    lea         eax,[ebp-8]
 0041FEBD    call        @LStrClr
 0041FEC2    ret
>0041FEC3    jmp         @HandleFinally
>0041FEC8    jmp         0041FEBA
 0041FECA    pop         ecx
 0041FECB    pop         ecx
 0041FECC    pop         ebp
 0041FECD    ret
*}
end;

//0041FED0
procedure TReader.SkipProperty;
begin
{*
 0041FED0    push        ebp
 0041FED1    mov         ebp,esp
 0041FED3    push        0
 0041FED5    push        ebx
 0041FED6    mov         ebx,eax
 0041FED8    xor         eax,eax
 0041FEDA    push        ebp
 0041FEDB    push        41FF0D
 0041FEE0    push        dword ptr fs:[eax]
 0041FEE3    mov         dword ptr fs:[eax],esp
 0041FEE6    lea         edx,[ebp-4]
 0041FEE9    mov         eax,ebx
 0041FEEB    call        TReader.ReadStr
 0041FEF0    mov         eax,ebx
 0041FEF2    call        TReader.SkipValue
 0041FEF7    xor         eax,eax
 0041FEF9    pop         edx
 0041FEFA    pop         ecx
 0041FEFB    pop         ecx
 0041FEFC    mov         dword ptr fs:[eax],edx
 0041FEFF    push        41FF14
 0041FF04    lea         eax,[ebp-4]
 0041FF07    call        @LStrClr
 0041FF0C    ret
>0041FF0D    jmp         @HandleFinally
>0041FF12    jmp         0041FF04
 0041FF14    pop         ebx
 0041FF15    pop         ecx
 0041FF16    pop         ebp
 0041FF17    ret
*}
end;

//0041FF18
procedure TReader.SkipComponent(SkipHeader:Boolean);
begin
{*
 0041FF18    push        ebp
 0041FF19    mov         ebp,esp
 0041FF1B    add         esp,0FFFFFFF0
 0041FF1E    push        ebx
 0041FF1F    push        esi
 0041FF20    xor         ecx,ecx
 0041FF22    mov         dword ptr [ebp-10],ecx
 0041FF25    mov         dword ptr [ebp-0C],ecx
 0041FF28    mov         ebx,eax
 0041FF2A    xor         eax,eax
 0041FF2C    push        ebp
 0041FF2D    push        41FFB0
 0041FF32    push        dword ptr fs:[eax]
 0041FF35    mov         dword ptr fs:[eax],esp
 0041FF38    test        dl,dl
>0041FF3A    je          0041FF66
 0041FF3C    lea         ecx,[ebp-8]
 0041FF3F    lea         edx,[ebp-1]
 0041FF42    mov         eax,ebx
 0041FF44    mov         esi,dword ptr [eax]
 0041FF46    call        dword ptr [esi+24]
 0041FF49    lea         edx,[ebp-0C]
 0041FF4C    mov         eax,ebx
 0041FF4E    call        TReader.ReadStr
 0041FF53    lea         edx,[ebp-10]
 0041FF56    mov         eax,ebx
 0041FF58    call        TReader.ReadStr
>0041FF5D    jmp         0041FF66
 0041FF5F    mov         eax,ebx
 0041FF61    call        TReader.SkipProperty
 0041FF66    mov         eax,ebx
 0041FF68    call        TReader.EndOfList
 0041FF6D    test        al,al
>0041FF6F    je          0041FF5F
 0041FF71    mov         eax,ebx
 0041FF73    call        TReader.ReadListEnd
>0041FF78    jmp         0041FF83
 0041FF7A    mov         dl,1
 0041FF7C    mov         eax,ebx
 0041FF7E    call        TReader.SkipComponent
 0041FF83    mov         eax,ebx
 0041FF85    call        TReader.EndOfList
 0041FF8A    test        al,al
>0041FF8C    je          0041FF7A
 0041FF8E    mov         eax,ebx
 0041FF90    call        TReader.ReadListEnd
 0041FF95    xor         eax,eax
 0041FF97    pop         edx
 0041FF98    pop         ecx
 0041FF99    pop         ecx
 0041FF9A    mov         dword ptr fs:[eax],edx
 0041FF9D    push        41FFB7
 0041FFA2    lea         eax,[ebp-10]
 0041FFA5    mov         edx,2
 0041FFAA    call        @LStrArrayClr
 0041FFAF    ret
>0041FFB0    jmp         @HandleFinally
>0041FFB5    jmp         0041FFA2
 0041FFB7    pop         esi
 0041FFB8    pop         ebx
 0041FFB9    mov         esp,ebp
 0041FFBB    pop         ebp
 0041FFBC    ret
*}
end;

//0041FFC0
function TReader.FindAncestorComponent(const Name:AnsiString; ComponentClass:TPersistentClass):TComponent;
begin
{*
 0041FFC0    push        ebp
 0041FFC1    mov         ebp,esp
 0041FFC3    add         esp,0FFFFFFF0
 0041FFC6    push        ebx
 0041FFC7    push        esi
 0041FFC8    push        edi
 0041FFC9    xor         ebx,ebx
 0041FFCB    mov         dword ptr [ebp-8],ebx
 0041FFCE    mov         edi,ecx
 0041FFD0    mov         esi,edx
 0041FFD2    mov         ebx,eax
 0041FFD4    xor         eax,eax
 0041FFD6    push        ebp
 0041FFD7    push        420065
 0041FFDC    push        dword ptr fs:[eax]
 0041FFDF    mov         dword ptr fs:[eax],esp
 0041FFE2    lea         eax,[ebp-8]
 0041FFE5    mov         edx,esi
 0041FFE7    call        @LStrLAsg
 0041FFEC    xor         eax,eax
 0041FFEE    mov         dword ptr [ebp-4],eax
 0041FFF1    mov         esi,dword ptr [ebx+1C]
 0041FFF4    test        esi,esi
>0041FFF6    je          00420005
 0041FFF8    mov         edx,dword ptr [ebp-8]
 0041FFFB    mov         eax,esi
 0041FFFD    call        TComponent.FindComponent
 00420002    mov         dword ptr [ebp-4],eax
 00420005    cmp         dword ptr [ebp-4],0
>00420009    jne         0042004F
 0042000B    cmp         word ptr [ebx+52],0
>00420010    je          00420022
 00420012    push        edi
 00420013    lea         eax,[ebp-4]
 00420016    push        eax
 00420017    mov         ecx,dword ptr [ebp-8]
 0042001A    mov         edx,ebx
 0042001C    mov         eax,dword ptr [ebx+54]
 0042001F    call        dword ptr [ebx+50]
 00420022    cmp         dword ptr [ebp-4],0
>00420026    jne         0042004F
 00420028    mov         eax,dword ptr [ebp-8]
 0042002B    mov         dword ptr [ebp-10],eax
 0042002E    mov         byte ptr [ebp-0C],0B
 00420032    lea         eax,[ebp-10]
 00420035    push        eax
 00420036    push        0
 00420038    mov         ecx,dword ptr ds:[5AE314];^SAncestorNotFound:TResStringRec
 0042003E    mov         dl,1
 00420040    mov         eax,[0041795C];EReadError
 00420045    call        Exception.CreateResFmt
 0042004A    call        @RaiseExcept
 0042004F    xor         eax,eax
 00420051    pop         edx
 00420052    pop         ecx
 00420053    pop         ecx
 00420054    mov         dword ptr fs:[eax],edx
 00420057    push        42006C
 0042005C    lea         eax,[ebp-8]
 0042005F    call        @LStrClr
 00420064    ret
>00420065    jmp         @HandleFinally
>0042006A    jmp         0042005C
 0042006C    mov         eax,dword ptr [ebp-4]
 0042006F    pop         edi
 00420070    pop         esi
 00420071    pop         ebx
 00420072    mov         esp,ebp
 00420074    pop         ebp
 00420075    ret
*}
end;

//00420078
procedure TReader.ReferenceName(var Name:AnsiString);
begin
{*
 00420078    push        ebx
 00420079    cmp         word ptr [eax+4A],0
>0042007E    je          0042008C
 00420080    mov         ecx,edx
 00420082    mov         ebx,eax
 00420084    mov         edx,eax
 00420086    mov         eax,dword ptr [ebx+4C]
 00420089    call        dword ptr [ebx+48]
 0042008C    pop         ebx
 0042008D    ret
*}
end;

//00420090
procedure TReader.SetName(Component:TComponent; var Name:AnsiString);
begin
{*
 00420090    push        ebx
 00420091    push        esi
 00420092    push        edi
 00420093    mov         esi,ecx
 00420095    mov         ebx,edx
 00420097    cmp         word ptr [eax+42],0
>0042009C    je          004200AB
 0042009E    push        esi
 0042009F    mov         edi,eax
 004200A1    mov         ecx,ebx
 004200A3    mov         edx,eax
 004200A5    mov         eax,dword ptr [edi+44]
 004200A8    call        dword ptr [edi+40]
 004200AB    mov         edx,dword ptr [esi]
 004200AD    mov         eax,ebx
 004200AF    mov         ecx,dword ptr [eax]
 004200B1    call        dword ptr [ecx+18]
 004200B4    pop         edi
 004200B5    pop         esi
 004200B6    pop         ebx
 004200B7    ret
*}
end;

//004200B8
function TReader.FindComponentClass(const ClassName:AnsiString):TComponentClass;
begin
{*
 004200B8    push        ebx
 004200B9    push        esi
 004200BA    push        ecx
 004200BB    mov         esi,edx
 004200BD    mov         ebx,eax
 004200BF    mov         ecx,esi
 004200C1    mov         edx,dword ptr [ebx+18]
 004200C4    mov         eax,ebx
 004200C6    call        TReader.GetFieldClass
 004200CB    mov         dword ptr [esp],eax
 004200CE    cmp         dword ptr [esp],0
>004200D2    jne         004200F1
 004200D4    cmp         dword ptr [ebx+1C],0
>004200D8    je          004200F1
 004200DA    mov         eax,dword ptr [ebx+1C]
 004200DD    cmp         eax,dword ptr [ebx+18]
>004200E0    je          004200F1
 004200E2    mov         ecx,esi
 004200E4    mov         edx,dword ptr [ebx+1C]
 004200E7    mov         eax,ebx
 004200E9    call        TReader.GetFieldClass
 004200EE    mov         dword ptr [esp],eax
 004200F1    cmp         word ptr [ebx+62],0
>004200F6    je          00420103
 004200F8    push        esp
 004200F9    mov         ecx,esi
 004200FB    mov         edx,ebx
 004200FD    mov         eax,dword ptr [ebx+64]
 00420100    call        dword ptr [ebx+60]
 00420103    cmp         dword ptr [esp],0
>00420107    je          0042011B
 00420109    mov         edx,dword ptr ds:[418C6C];TComponent
 0042010F    mov         eax,dword ptr [esp]
 00420112    call        TObject.InheritsFrom
 00420117    test        al,al
>00420119    jne         00420122
 0042011B    mov         eax,esi
 0042011D    call        ClassNotFound
 00420122    mov         eax,dword ptr [esp]
 00420125    pop         edx
 00420126    pop         esi
 00420127    pop         ebx
 00420128    ret
*}
end;

//0042012C
procedure TReader.SkipBytes(Count:Integer);
begin
{*
 0042012C    push        ebx
 0042012D    push        esi
 0042012E    add         esp,0FFFFFF00
 00420134    mov         ebx,edx
 00420136    mov         esi,eax
 00420138    test        ebx,ebx
>0042013A    jle         0042016B
 0042013C    cmp         ebx,100
>00420142    jle         0042015A
 00420144    mov         edx,esp
 00420146    mov         ecx,100
 0042014B    mov         eax,esi
 0042014D    call        TReader.Read
 00420152    sub         ebx,100
>00420158    jmp         00420167
 0042015A    mov         edx,esp
 0042015C    mov         ecx,ebx
 0042015E    mov         eax,esi
 00420160    call        TReader.Read
 00420165    xor         ebx,ebx
 00420167    test        ebx,ebx
>00420169    jg          0042013C
 0042016B    add         esp,100
 00420171    pop         esi
 00420172    pop         ebx
 00420173    ret
*}
end;

//00420174
function ReadCustomVariant:Variant;
begin
{*
 00420174    push        ebp
 00420175    mov         ebp,esp
 00420177    add         esp,0FFFFFFE4
 0042017A    push        ebx
 0042017B    xor         edx,edx
 0042017D    mov         dword ptr [ebp-18],edx
 00420180    mov         dword ptr [ebp-1C],edx
 00420183    mov         ebx,eax
 00420185    xor         eax,eax
 00420187    push        ebp
 00420188    push        42031D
 0042018D    push        dword ptr fs:[eax]
 00420190    mov         dword ptr fs:[eax],esp
 00420193    mov         eax,dword ptr [ebp+8]
 00420196    mov         eax,dword ptr [eax-4]
 00420199    mov         dl,0A
 0042019B    call        TReader.CheckValue
 004201A0    xor         eax,eax
 004201A2    mov         dword ptr [ebp-8],eax
 004201A5    mov         dl,1
 004201A7    mov         eax,[00418640];TMemoryStream
 004201AC    call        TObject.Create
 004201B1    mov         dword ptr [ebp-4],eax
 004201B4    xor         eax,eax
 004201B6    push        ebp
 004201B7    push        4202F8
 004201BC    push        dword ptr fs:[eax]
 004201BF    mov         dword ptr fs:[eax],esp
 004201C2    mov         dl,1
 004201C4    mov         eax,[00418640];TMemoryStream
 004201C9    call        TObject.Create
 004201CE    mov         dword ptr [ebp-8],eax
 004201D1    lea         edx,[ebp-10]
 004201D4    mov         eax,dword ptr [ebp+8]
 004201D7    mov         eax,dword ptr [eax-4]
 004201DA    mov         ecx,4
 004201DF    call        TReader.Read
 004201E4    mov         eax,dword ptr [ebp-10]
 004201E7    cdq
 004201E8    push        edx
 004201E9    push        eax
 004201EA    mov         eax,dword ptr [ebp-4]
 004201ED    call        TStream.SetSize64
 004201F2    mov         eax,dword ptr [ebp-4]
 004201F5    mov         edx,dword ptr [eax+4]
 004201F8    mov         eax,dword ptr [ebp+8]
 004201FB    mov         eax,dword ptr [eax-4]
 004201FE    mov         ecx,dword ptr [ebp-10]
 00420201    call        TReader.Read
 00420206    push        400
 0042020B    mov         ecx,dword ptr [ebp-4]
 0042020E    mov         dl,1
 00420210    mov         eax,[00418A18];TReader
 00420215    call        TFiler.Create
 0042021A    mov         dword ptr [ebp-0C],eax
 0042021D    xor         eax,eax
 0042021F    push        ebp
 00420220    push        4202D3
 00420225    push        dword ptr fs:[eax]
 00420228    mov         dword ptr fs:[eax],esp
 0042022B    lea         edx,[ebp-18]
 0042022E    mov         eax,dword ptr [ebp-0C]
 00420231    call        TReader.ReadString
 00420236    lea         edx,[ebp-10]
 00420239    mov         ecx,4
 0042023E    mov         eax,dword ptr [ebp-0C]
 00420241    call        TReader.Read
 00420246    mov         eax,dword ptr [ebp-10]
 00420249    cdq
 0042024A    push        edx
 0042024B    push        eax
 0042024C    mov         eax,dword ptr [ebp-8]
 0042024F    call        TStream.SetSize64
 00420254    mov         eax,dword ptr [ebp-8]
 00420257    mov         edx,dword ptr [eax+4]
 0042025A    mov         ecx,dword ptr [ebp-10]
 0042025D    mov         eax,dword ptr [ebp-0C]
 00420260    call        TReader.Read
 00420265    lea         edx,[ebp-14]
 00420268    mov         eax,dword ptr [ebp-18]
 0042026B    call        FindCustomVariantType
 00420270    test        al,al
>00420272    je          0042028F
 00420274    lea         eax,[ebp-1C]
 00420277    call        @IntfClear
 0042027C    mov         ecx,eax
 0042027E    mov         edx,42032C
 00420283    mov         eax,dword ptr [ebp-14]
 00420286    call        Supports
 0042028B    test        al,al
>0042028D    jne         004202A6
 0042028F    mov         ecx,dword ptr ds:[5AE708];^SReadError:TResStringRec
 00420295    mov         dl,1
 00420297    mov         eax,[0041795C];EReadError
 0042029C    call        Exception.CreateRes
 004202A1    call        @RaiseExcept
 004202A6    mov         eax,dword ptr [ebp-14]
 004202A9    mov         ax,word ptr [eax+4]
 004202AD    mov         word ptr [ebx],ax
 004202B0    mov         edx,ebx
 004202B2    mov         ecx,dword ptr [ebp-8]
 004202B5    mov         eax,dword ptr [ebp-1C]
 004202B8    mov         ebx,dword ptr [eax]
 004202BA    call        dword ptr [ebx+0C]
 004202BD    xor         eax,eax
 004202BF    pop         edx
 004202C0    pop         ecx
 004202C1    pop         ecx
 004202C2    mov         dword ptr fs:[eax],edx
 004202C5    push        4202DA
 004202CA    mov         eax,dword ptr [ebp-0C]
 004202CD    call        TObject.Free
 004202D2    ret
>004202D3    jmp         @HandleFinally
>004202D8    jmp         004202CA
 004202DA    xor         eax,eax
 004202DC    pop         edx
 004202DD    pop         ecx
 004202DE    pop         ecx
 004202DF    mov         dword ptr fs:[eax],edx
 004202E2    push        4202FF
 004202E7    mov         eax,dword ptr [ebp-8]
 004202EA    call        TObject.Free
 004202EF    mov         eax,dword ptr [ebp-4]
 004202F2    call        TObject.Free
 004202F7    ret
>004202F8    jmp         @HandleFinally
>004202FD    jmp         004202E7
 004202FF    xor         eax,eax
 00420301    pop         edx
 00420302    pop         ecx
 00420303    pop         ecx
 00420304    mov         dword ptr fs:[eax],edx
 00420307    push        420324
 0042030C    lea         eax,[ebp-1C]
 0042030F    call        @IntfClear
 00420314    lea         eax,[ebp-18]
 00420317    call        @LStrClr
 0042031C    ret
>0042031D    jmp         @HandleFinally
>00420322    jmp         0042030C
 00420324    pop         ebx
 00420325    mov         esp,ebp
 00420327    pop         ebp
 00420328    ret
*}
end;

//0042033C
function TReader.ReadVariant:Variant;
begin
{*
 0042033C    push        ebp
 0042033D    mov         ebp,esp
 0042033F    xor         ecx,ecx
 00420341    push        ecx
 00420342    push        ecx
 00420343    push        ecx
 00420344    push        ecx
 00420345    push        ecx
 00420346    push        ecx
 00420347    push        ecx
 00420348    push        ebx
 00420349    mov         ebx,edx
 0042034B    mov         dword ptr [ebp-4],eax
 0042034E    xor         eax,eax
 00420350    push        ebp
 00420351    push        420536
 00420356    push        dword ptr fs:[eax]
 00420359    mov         dword ptr fs:[eax],esp
 0042035C    mov         eax,ebx
 0042035E    call        @VarClear
 00420363    mov         eax,dword ptr [ebp-4]
 00420366    call        TReader.NextValue
 0042036B    and         eax,7F
 0042036E    cmp         eax,14
>00420371    ja          004204F9
 00420377    jmp         dword ptr [eax*4+42037E]
 00420377    dd          004203D2
 00420377    dd          004204F9
 00420377    dd          004203EE
 00420377    dd          00420409
 00420377    dd          00420424
 00420377    dd          0042043C
 00420377    dd          0042048C
 00420377    dd          004204F9
 00420377    dd          004204BA
 00420377    dd          004204BA
 00420377    dd          004204D0
 00420377    dd          004204F9
 00420377    dd          0042048C
 00420377    dd          004203D2
 00420377    dd          004204F9
 00420377    dd          00420450
 00420377    dd          00420464
 00420377    dd          00420478
 00420377    dd          004204A3
 00420377    dd          004204E6
 00420377    dd          004204A3
 004203D2    mov         eax,dword ptr [ebp-4]
 004203D5    call        TReader.ReadValue
 004203DA    cmp         al,0D
>004203DC    je          00420510
 004203E2    mov         eax,ebx
 004203E4    call        Null
>004203E9    jmp         00420510
 004203EE    mov         eax,dword ptr [ebp-4]
 004203F1    call        TReader.ReadInteger
 004203F6    mov         edx,eax
 004203F8    movsx       edx,dl
 004203FB    mov         eax,ebx
 004203FD    mov         cl,0FF
 004203FF    call        @VarFromInt
>00420404    jmp         00420510
 00420409    mov         eax,dword ptr [ebp-4]
 0042040C    call        TReader.ReadInteger
 00420411    mov         edx,eax
 00420413    movsx       edx,dx
 00420416    mov         eax,ebx
 00420418    mov         cl,0FE
 0042041A    call        @VarFromInt
>0042041F    jmp         00420510
 00420424    mov         eax,dword ptr [ebp-4]
 00420427    call        TReader.ReadInteger
 0042042C    mov         edx,eax
 0042042E    mov         eax,ebx
 00420430    mov         cl,0FC
 00420432    call        @VarFromInt
>00420437    jmp         00420510
 0042043C    mov         eax,dword ptr [ebp-4]
 0042043F    call        TReader.ReadFloat
 00420444    mov         eax,ebx
 00420446    call        @VarFromReal
>0042044B    jmp         00420510
 00420450    mov         eax,dword ptr [ebp-4]
 00420453    call        TReader.ReadSingle
 00420458    mov         eax,ebx
 0042045A    call        @VarFromReal
>0042045F    jmp         00420510
 00420464    mov         eax,dword ptr [ebp-4]
 00420467    call        TReader.ReadCurrency
 0042046C    mov         eax,ebx
 0042046E    call        @VarFromCurr
>00420473    jmp         00420510
 00420478    mov         eax,dword ptr [ebp-4]
 0042047B    call        TReader.ReadDate
 00420480    mov         eax,ebx
 00420482    call        @VarFromTDateTime
>00420487    jmp         00420510
 0042048C    lea         edx,[ebp-8]
 0042048F    mov         eax,dword ptr [ebp-4]
 00420492    call        TReader.ReadString
 00420497    mov         edx,dword ptr [ebp-8]
 0042049A    mov         eax,ebx
 0042049C    call        @VarFromLStr
>004204A1    jmp         00420510
 004204A3    lea         edx,[ebp-0C]
 004204A6    mov         eax,dword ptr [ebp-4]
 004204A9    call        TReader.ReadWideString
 004204AE    mov         edx,dword ptr [ebp-0C]
 004204B1    mov         eax,ebx
 004204B3    call        @VarFromWStr
>004204B8    jmp         00420510
 004204BA    mov         eax,dword ptr [ebp-4]
 004204BD    call        TReader.ReadValue
 004204C2    cmp         al,9
 004204C4    sete        dl
 004204C7    mov         eax,ebx
 004204C9    call        @VarFromBool
>004204CE    jmp         00420510
 004204D0    push        ebp
 004204D1    lea         eax,[ebp-1C]
 004204D4    call        ReadCustomVariant
 004204D9    pop         ecx
 004204DA    lea         edx,[ebp-1C]
 004204DD    mov         eax,ebx
 004204DF    call        @VarCopy
>004204E4    jmp         00420510
 004204E6    mov         eax,dword ptr [ebp-4]
 004204E9    call        TReader.ReadInt64
 004204EE    push        edx
 004204EF    push        eax
 004204F0    mov         eax,ebx
 004204F2    call        @VarFromInt64
>004204F7    jmp         00420510
 004204F9    mov         ecx,dword ptr ds:[5AE708];^SReadError:TResStringRec
 004204FF    mov         dl,1
 00420501    mov         eax,[0041795C];EReadError
 00420506    call        Exception.CreateRes
 0042050B    call        @RaiseExcept
 00420510    xor         eax,eax
 00420512    pop         edx
 00420513    pop         ecx
 00420514    pop         ecx
 00420515    mov         dword ptr fs:[eax],edx
 00420518    push        42053D
 0042051D    lea         eax,[ebp-1C]
 00420520    call        @VarClr
 00420525    lea         eax,[ebp-0C]
 00420528    call        @WStrClr
 0042052D    lea         eax,[ebp-8]
 00420530    call        @LStrClr
 00420535    ret
>00420536    jmp         @HandleFinally
>0042053B    jmp         0042051D
 0042053D    pop         ebx
 0042053E    mov         esp,ebp
 00420540    pop         ebp
 00420541    ret
*}
end;

//00420544
destructor TWriter.Destroy;
begin
{*
 00420544    push        ebx
 00420545    push        esi
 00420546    call        @BeforeDestruction
 0042054B    mov         ebx,edx
 0042054D    mov         esi,eax
 0042054F    mov         eax,esi
 00420551    call        TWriter.WriteBuffer
 00420556    mov         edx,ebx
 00420558    and         dl,0FC
 0042055B    mov         eax,esi
 0042055D    call        TFiler.Destroy
 00420562    test        bl,bl
>00420564    jle         0042056D
 00420566    mov         eax,esi
 00420568    call        @ClassDestroy
 0042056D    pop         esi
 0042056E    pop         ebx
 0042056F    ret
*}
end;

//00420570
procedure TWriter.AddAncestor(Component:TComponent);
begin
{*
 00420570    mov         eax,dword ptr [eax+30]
 00420573    call        TList.Add
 00420578    ret
*}
end;

//0042057C
procedure TWriter.DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);
begin
{*
 0042057C    push        ebp
 0042057D    mov         ebp,esp
 0042057F    push        ebx
 00420580    mov         ebx,eax
 00420582    test        cl,cl
>00420584    je          0042059C
 00420586    cmp         word ptr [ebp+0A],0
>0042058B    je          0042059C
 0042058D    mov         eax,ebx
 0042058F    call        TWriter.WritePropName
 00420594    mov         edx,ebx
 00420596    mov         eax,dword ptr [ebp+0C]
 00420599    call        dword ptr [ebp+8]
 0042059C    pop         ebx
 0042059D    pop         ebp
 0042059E    ret         10
*}
end;

//004205A4
procedure TWriter.DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);
begin
{*
 004205A4    push        ebp
 004205A5    mov         ebp,esp
 004205A7    push        ebx
 004205A8    mov         ebx,eax
 004205AA    test        cl,cl
>004205AC    je          004205C9
 004205AE    cmp         word ptr [ebp+0A],0
>004205B3    je          004205C9
 004205B5    mov         eax,ebx
 004205B7    call        TWriter.WritePropName
 004205BC    push        dword ptr [ebp+0C]
 004205BF    push        dword ptr [ebp+8]
 004205C2    mov         eax,ebx
 004205C4    call        TWriter.WriteBinary
 004205C9    pop         ebx
 004205CA    pop         ebp
 004205CB    ret         10
*}
end;

//004205D0
function TWriter.GetPosition:Longint;
begin
{*
 004205D0    push        ebx
 004205D1    mov         ebx,eax
 004205D3    mov         eax,dword ptr [ebx+4]
 004205D6    call        TStream.GetPosition
 004205DB    add         eax,dword ptr [ebx+10]
 004205DE    pop         ebx
 004205DF    ret
*}
end;

//004205E0
procedure TWriter.FlushBuffer;
begin
{*
 004205E0    call        TWriter.WriteBuffer
 004205E5    ret
*}
end;

//004205E8
procedure TWriter.SetPosition(Value:Longint);
begin
{*
 004205E8    push        ebx
 004205E9    push        esi
 004205EA    mov         esi,edx
 004205EC    mov         ebx,eax
 004205EE    mov         eax,dword ptr [ebx+4]
 004205F1    call        TStream.GetPosition
 004205F6    cmp         eax,esi
>004205F8    jg          00420603
 004205FA    mov         edx,dword ptr [ebx+10]
 004205FD    add         edx,eax
 004205FF    cmp         esi,edx
>00420601    jle         0042061A
 00420603    mov         eax,ebx
 00420605    call        TWriter.WriteBuffer
 0042060A    mov         eax,esi
 0042060C    cdq
 0042060D    push        edx
 0042060E    push        eax
 0042060F    mov         eax,dword ptr [ebx+4]
 00420612    call        TStream.SetPosition
 00420617    pop         esi
 00420618    pop         ebx
 00420619    ret
 0042061A    sub         esi,eax
 0042061C    mov         dword ptr [ebx+10],esi
 0042061F    pop         esi
 00420620    pop         ebx
 00420621    ret
*}
end;

//00420624
procedure TWriter.SetRoot(Value:TComponent);
begin
{*
 00420624    push        ebx
 00420625    push        esi
 00420626    mov         esi,edx
 00420628    mov         ebx,eax
 0042062A    mov         edx,esi
 0042062C    mov         eax,ebx
 0042062E    call        TFiler.SetRoot
 00420633    mov         dword ptr [ebx+1C],esi
 00420636    pop         esi
 00420637    pop         ebx
 00420638    ret
*}
end;

//0042063C
procedure TWriter.Write(const Buf:void ; Count:Longint);
begin
{*
 0042063C    push        esi
 0042063D    push        edi
 0042063E    push        ebx
 0042063F    mov         esi,edx
 00420641    mov         ebx,ecx
 00420643    mov         edi,eax
>00420645    jmp         0042067D
 00420647    mov         ecx,dword ptr [edi+0C]
 0042064A    sub         ecx,dword ptr [edi+10]
>0042064D    ja          00420659
 0042064F    mov         eax,edi
 00420651    call        TWriter.WriteBuffer
 00420656    mov         ecx,dword ptr [edi+0C]
 00420659    cmp         ecx,ebx
>0042065B    jb          0042065F
 0042065D    mov         ecx,ebx
 0042065F    sub         ebx,ecx
 00420661    push        edi
 00420662    mov         eax,dword ptr [edi+8]
 00420665    add         eax,dword ptr [edi+10]
 00420668    add         dword ptr [edi+10],ecx
 0042066B    mov         edi,eax
 0042066D    mov         edx,ecx
 0042066F    shr         ecx,2
 00420672    cld
 00420673    rep movs    dword ptr [edi],dword ptr [esi]
 00420675    mov         ecx,edx
 00420677    and         ecx,3
 0042067A    rep movs    byte ptr [edi],byte ptr [esi]
 0042067C    pop         edi
 0042067D    or          ebx,ebx
>0042067F    jne         00420647
 00420681    pop         ebx
 00420682    pop         edi
 00420683    pop         esi
 00420684    ret
*}
end;

//00420688
procedure TWriter.WriteBinary(WriteData:TStreamProc);
begin
{*
 00420688    push        ebp
 00420689    mov         ebp,esp
 0042068B    add         esp,0FFFFFFF8
 0042068E    push        ebx
 0042068F    mov         ebx,eax
 00420691    mov         dl,1
 00420693    mov         eax,[00418640];TMemoryStream
 00420698    call        TObject.Create
 0042069D    mov         dword ptr [ebp-4],eax
 004206A0    xor         eax,eax
 004206A2    push        ebp
 004206A3    push        4206FF
 004206A8    push        dword ptr fs:[eax]
 004206AB    mov         dword ptr fs:[eax],esp
 004206AE    mov         edx,dword ptr [ebp-4]
 004206B1    mov         eax,dword ptr [ebp+0C]
 004206B4    call        dword ptr [ebp+8]
 004206B7    mov         dl,0A
 004206B9    mov         eax,ebx
 004206BB    call        TWriter.WriteValue
 004206C0    mov         eax,dword ptr [ebp-4]
 004206C3    mov         edx,dword ptr [eax]
 004206C5    call        dword ptr [edx]
 004206C7    mov         dword ptr [ebp-8],eax
 004206CA    lea         edx,[ebp-8]
 004206CD    mov         ecx,4
 004206D2    mov         eax,ebx
 004206D4    call        TWriter.Write
 004206D9    mov         eax,dword ptr [ebp-4]
 004206DC    mov         edx,dword ptr [eax+4]
 004206DF    mov         ecx,dword ptr [ebp-8]
 004206E2    mov         eax,ebx
 004206E4    call        TWriter.Write
 004206E9    xor         eax,eax
 004206EB    pop         edx
 004206EC    pop         ecx
 004206ED    pop         ecx
 004206EE    mov         dword ptr fs:[eax],edx
 004206F1    push        420706
 004206F6    mov         eax,dword ptr [ebp-4]
 004206F9    call        TObject.Free
 004206FE    ret
>004206FF    jmp         @HandleFinally
>00420704    jmp         004206F6
 00420706    pop         ebx
 00420707    pop         ecx
 00420708    pop         ecx
 00420709    pop         ebp
 0042070A    ret         8
*}
end;

//00420710
procedure TWriter.WriteBuffer;
begin
{*
 00420710    push        ebx
 00420711    mov         ebx,eax
 00420713    mov         edx,dword ptr [ebx+8]
 00420716    mov         ecx,dword ptr [ebx+10]
 00420719    mov         eax,dword ptr [ebx+4]
 0042071C    call        TStream.WriteBuffer
 00420721    xor         eax,eax
 00420723    mov         dword ptr [ebx+10],eax
 00420726    pop         ebx
 00420727    ret
*}
end;

//00420728
procedure TWriter.WriteBoolean(Value:Boolean);
begin
{*
 00420728    test        dl,dl
>0042072A    je          00420734
 0042072C    mov         dl,9
 0042072E    call        TWriter.WriteValue
 00420733    ret
 00420734    mov         dl,8
 00420736    call        TWriter.WriteValue
 0042073B    ret
*}
end;

//0042073C
procedure TWriter.WriteChar(Value:Char);
begin
{*
 0042073C    push        ebp
 0042073D    mov         ebp,esp
 0042073F    push        0
 00420741    push        ebx
 00420742    push        esi
 00420743    mov         ebx,edx
 00420745    mov         esi,eax
 00420747    xor         eax,eax
 00420749    push        ebp
 0042074A    push        42077F
 0042074F    push        dword ptr fs:[eax]
 00420752    mov         dword ptr fs:[eax],esp
 00420755    lea         eax,[ebp-4]
 00420758    mov         edx,ebx
 0042075A    call        @LStrFromChar
 0042075F    mov         edx,dword ptr [ebp-4]
 00420762    mov         eax,esi
 00420764    call        TWriter.WriteString
 00420769    xor         eax,eax
 0042076B    pop         edx
 0042076C    pop         ecx
 0042076D    pop         ecx
 0042076E    mov         dword ptr fs:[eax],edx
 00420771    push        420786
 00420776    lea         eax,[ebp-4]
 00420779    call        @LStrClr
 0042077E    ret
>0042077F    jmp         @HandleFinally
>00420784    jmp         00420776
 00420786    pop         esi
 00420787    pop         ebx
 00420788    pop         ecx
 00420789    pop         ebp
 0042078A    ret
*}
end;

//0042078C
procedure TWriter.WriteCollection(Value:TCollection);
begin
{*
 0042078C    push        ebp
 0042078D    mov         ebp,esp
 0042078F    add         esp,0FFFFFFF8
 00420792    push        ebx
 00420793    push        esi
 00420794    push        edi
 00420795    mov         edi,edx
 00420797    mov         dword ptr [ebp-4],eax
 0042079A    mov         eax,dword ptr [ebp-4]
 0042079D    mov         eax,dword ptr [eax+20]
 004207A0    mov         dword ptr [ebp-8],eax
 004207A3    mov         eax,dword ptr [ebp-4]
 004207A6    xor         edx,edx
 004207A8    mov         dword ptr [eax+20],edx
 004207AB    xor         eax,eax
 004207AD    push        ebp
 004207AE    push        42081E
 004207B3    push        dword ptr fs:[eax]
 004207B6    mov         dword ptr fs:[eax],esp
 004207B9    mov         dl,0E
 004207BB    mov         eax,dword ptr [ebp-4]
 004207BE    call        TWriter.WriteValue
 004207C3    test        edi,edi
>004207C5    je          004207FF
 004207C7    mov         eax,edi
 004207C9    call        TCollection.GetCount
 004207CE    mov         ebx,eax
 004207D0    dec         ebx
 004207D1    test        ebx,ebx
>004207D3    jl          004207FF
 004207D5    inc         ebx
 004207D6    xor         esi,esi
 004207D8    mov         eax,dword ptr [ebp-4]
 004207DB    call        TWriter.WriteListBegin
 004207E0    mov         edx,esi
 004207E2    mov         eax,edi
 004207E4    call        TCollection.GetItem
 004207E9    mov         edx,eax
 004207EB    mov         eax,dword ptr [ebp-4]
 004207EE    call        TWriter.WriteProperties
 004207F3    mov         eax,dword ptr [ebp-4]
 004207F6    call        TWriter.WriteListEnd
 004207FB    inc         esi
 004207FC    dec         ebx
>004207FD    jne         004207D8
 004207FF    mov         eax,dword ptr [ebp-4]
 00420802    call        TWriter.WriteListEnd
 00420807    xor         eax,eax
 00420809    pop         edx
 0042080A    pop         ecx
 0042080B    pop         ecx
 0042080C    mov         dword ptr fs:[eax],edx
 0042080F    push        420825
 00420814    mov         eax,dword ptr [ebp-4]
 00420817    mov         edx,dword ptr [ebp-8]
 0042081A    mov         dword ptr [eax+20],edx
 0042081D    ret
>0042081E    jmp         @HandleFinally
>00420823    jmp         00420814
 00420825    pop         edi
 00420826    pop         esi
 00420827    pop         ebx
 00420828    pop         ecx
 00420829    pop         ecx
 0042082A    pop         ebp
 0042082B    ret
*}
end;

//0042082C
function FindAncestor(const Name:AnsiString):TComponent;
begin
{*
 0042082C    push        ebp
 0042082D    mov         ebp,esp
 0042082F    push        ecx
 00420830    push        ebx
 00420831    push        esi
 00420832    push        edi
 00420833    mov         dword ptr [ebp-4],eax
 00420836    mov         eax,dword ptr [ebp+8]
 00420839    mov         eax,dword ptr [eax-4]
 0042083C    mov         eax,dword ptr [eax+30]
 0042083F    mov         ebx,dword ptr [eax+8]
 00420842    dec         ebx
 00420843    test        ebx,ebx
>00420845    jl          0042086F
 00420847    inc         ebx
 00420848    xor         edi,edi
 0042084A    mov         eax,dword ptr [ebp+8]
 0042084D    mov         eax,dword ptr [eax-4]
 00420850    mov         eax,dword ptr [eax+30]
 00420853    mov         edx,edi
 00420855    call        TList.Get
 0042085A    mov         esi,eax
 0042085C    mov         eax,dword ptr [esi+8]
 0042085F    mov         edx,dword ptr [ebp-4]
 00420862    call        SameText
 00420867    test        al,al
>00420869    jne         00420871
 0042086B    inc         edi
 0042086C    dec         ebx
>0042086D    jne         0042084A
 0042086F    xor         esi,esi
 00420871    mov         eax,esi
 00420873    pop         edi
 00420874    pop         esi
 00420875    pop         ebx
 00420876    pop         ecx
 00420877    pop         ebp
 00420878    ret
*}
end;

//0042087C
procedure TWriter.WriteComponent(Component:TComponent);
begin
{*
 0042087C    push        ebp
 0042087D    mov         ebp,esp
 0042087F    add         esp,0FFFFFFEC
 00420882    push        ebx
 00420883    push        esi
 00420884    mov         dword ptr [ebp-8],edx
 00420887    mov         dword ptr [ebp-4],eax
 0042088A    mov         eax,dword ptr [ebp-4]
 0042088D    mov         eax,dword ptr [eax+20]
 00420890    mov         dword ptr [ebp-0C],eax
 00420893    mov         eax,dword ptr [ebp-4]
 00420896    mov         eax,dword ptr [eax+28]
 00420899    mov         dword ptr [ebp-10],eax
 0042089C    xor         eax,eax
 0042089E    push        ebp
 0042089F    push        4209C3
 004208A4    push        dword ptr fs:[eax]
 004208A7    mov         dword ptr fs:[eax],esp
 004208AA    mov         eax,dword ptr [ebp-8]
 004208AD    or          word ptr [eax+1C],4
 004208B2    mov         eax,dword ptr [ebp-8]
 004208B5    call        TComponent.GetComponentCount
 004208BA    mov         esi,eax
 004208BC    dec         esi
 004208BD    test        esi,esi
>004208BF    jl          004208E7
 004208C1    inc         esi
 004208C2    xor         ebx,ebx
 004208C4    mov         edx,ebx
 004208C6    mov         eax,dword ptr [ebp-8]
 004208C9    call        TComponent.GetComponent
 004208CE    test        byte ptr [eax+24],4
>004208D2    je          004208E3
 004208D4    mov         edx,ebx
 004208D6    mov         eax,dword ptr [ebp-8]
 004208D9    call        TComponent.GetComponent
 004208DE    or          word ptr [eax+1C],4
 004208E3    inc         ebx
 004208E4    dec         esi
>004208E5    jne         004208C4
 004208E7    mov         eax,dword ptr [ebp-4]
 004208EA    cmp         dword ptr [eax+30],0
>004208EE    je          00420903
 004208F0    push        ebp
 004208F1    mov         eax,dword ptr [ebp-8]
 004208F4    mov         eax,dword ptr [eax+8]
 004208F7    call        FindAncestor
 004208FC    pop         ecx
 004208FD    mov         edx,dword ptr [ebp-4]
 00420900    mov         dword ptr [edx+20],eax
 00420903    mov         eax,dword ptr [ebp-4]
 00420906    cmp         word ptr [eax+42],0
>0042090B    je          0042095B
 0042090D    mov         eax,dword ptr [ebp-4]
 00420910    mov         ebx,dword ptr [eax+20]
 00420913    test        ebx,ebx
>00420915    je          00420928
 00420917    mov         eax,ebx
 00420919    mov         edx,dword ptr ds:[418C6C];TComponent
 0042091F    call        @IsClass
 00420924    test        al,al
>00420926    je          0042095B
 00420928    mov         eax,dword ptr [ebp-4]
 0042092B    mov         eax,dword ptr [eax+20]
 0042092E    mov         dword ptr [ebp-14],eax
 00420931    mov         eax,dword ptr [ebp-8]
 00420934    mov         eax,dword ptr [eax+8]
 00420937    push        eax
 00420938    lea         eax,[ebp-14]
 0042093B    push        eax
 0042093C    mov         eax,dword ptr [ebp-4]
 0042093F    add         eax,28
 00420942    push        eax
 00420943    mov         ebx,dword ptr [ebp-4]
 00420946    mov         ecx,dword ptr [ebp-8]
 00420949    mov         edx,dword ptr [ebp-4]
 0042094C    mov         eax,dword ptr [ebx+44]
 0042094F    call        dword ptr [ebx+40]
 00420952    mov         eax,dword ptr [ebp-4]
 00420955    mov         edx,dword ptr [ebp-14]
 00420958    mov         dword ptr [eax+20],edx
 0042095B    mov         edx,dword ptr [ebp-4]
 0042095E    mov         eax,dword ptr [ebp-8]
 00420961    mov         ecx,dword ptr [eax]
 00420963    call        dword ptr [ecx+24]
 00420966    mov         eax,dword ptr [ebp-8]
 00420969    and         word ptr [eax+1C],0FFFFFFFB
 0042096E    mov         eax,dword ptr [ebp-8]
 00420971    call        TComponent.GetComponentCount
 00420976    mov         esi,eax
 00420978    dec         esi
 00420979    test        esi,esi
>0042097B    jl          004209A3
 0042097D    inc         esi
 0042097E    xor         ebx,ebx
 00420980    mov         edx,ebx
 00420982    mov         eax,dword ptr [ebp-8]
 00420985    call        TComponent.GetComponent
 0042098A    test        byte ptr [eax+24],4
>0042098E    je          0042099F
 00420990    mov         edx,ebx
 00420992    mov         eax,dword ptr [ebp-8]
 00420995    call        TComponent.GetComponent
 0042099A    and         word ptr [eax+1C],0FFFFFFFB
 0042099F    inc         ebx
 004209A0    dec         esi
>004209A1    jne         00420980
 004209A3    xor         eax,eax
 004209A5    pop         edx
 004209A6    pop         ecx
 004209A7    pop         ecx
 004209A8    mov         dword ptr fs:[eax],edx
 004209AB    push        4209CA
 004209B0    mov         eax,dword ptr [ebp-4]
 004209B3    mov         edx,dword ptr [ebp-0C]
 004209B6    mov         dword ptr [eax+20],edx
 004209B9    mov         eax,dword ptr [ebp-4]
 004209BC    mov         edx,dword ptr [ebp-10]
 004209BF    mov         dword ptr [eax+28],edx
 004209C2    ret
>004209C3    jmp         @HandleFinally
>004209C8    jmp         004209B0
 004209CA    pop         esi
 004209CB    pop         ebx
 004209CC    mov         esp,ebp
 004209CE    pop         ebp
 004209CF    ret
*}
end;

//004209D0
procedure TWriter.WriteData(Instance:TComponent);
begin
{*
 004209D0    push        ebp
 004209D1    mov         ebp,esp
 004209D3    add         esp,0FFFFFEC8
 004209D9    push        ebx
 004209DA    push        esi
 004209DB    xor         ecx,ecx
 004209DD    mov         dword ptr [ebp-138],ecx
 004209E3    mov         dword ptr [ebp-12C],ecx
 004209E9    mov         dword ptr [ebp-130],ecx
 004209EF    mov         dword ptr [ebp-134],ecx
 004209F5    mov         dword ptr [ebp-8],edx
 004209F8    mov         dword ptr [ebp-4],eax
 004209FB    xor         eax,eax
 004209FD    push        ebp
 004209FE    push        420DAC
 00420A03    push        dword ptr fs:[eax]
 00420A06    mov         dword ptr fs:[eax],esp
 00420A09    lea         edx,[ebp-128]
 00420A0F    mov         eax,dword ptr [ebp-8]
 00420A12    mov         eax,dword ptr [eax]
 00420A14    call        TObject.ClassName
 00420A19    xor         ebx,ebx
 00420A1B    mov         bl,byte ptr [ebp-128]
 00420A21    mov         eax,dword ptr [ebp-8]
 00420A24    mov         eax,dword ptr [eax+8]
 00420A27    call        @LStrLen
 00420A2C    add         ebx,eax
 00420A2E    inc         ebx
 00420A2F    add         ebx,5
 00420A32    add         ebx,3
 00420A35    mov         eax,dword ptr [ebp-4]
 00420A38    mov         eax,dword ptr [eax+0C]
 00420A3B    mov         edx,dword ptr [ebp-4]
 00420A3E    sub         eax,dword ptr [edx+10]
 00420A41    cmp         ebx,eax
>00420A43    jle         00420A4D
 00420A45    mov         eax,dword ptr [ebp-4]
 00420A48    call        TWriter.WriteBuffer
 00420A4D    mov         eax,dword ptr [ebp-4]
 00420A50    call        TWriter.GetPosition
 00420A55    mov         dword ptr [ebp-0C],eax
 00420A58    mov         al,[00420DBC]
 00420A5D    mov         byte ptr [ebp-25],al
 00420A60    mov         eax,dword ptr [ebp-8]
 00420A63    test        byte ptr [eax+1D],2
>00420A67    je          00420A90
 00420A69    mov         eax,dword ptr [ebp-4]
 00420A6C    cmp         dword ptr [eax+20],0
>00420A70    je          00420A8A
 00420A72    mov         eax,dword ptr [ebp-8]
 00420A75    test        byte ptr [eax+1C],20
>00420A79    je          00420A8A
 00420A7B    mov         eax,dword ptr [ebp-4]
 00420A7E    cmp         dword ptr [eax+30],0
>00420A82    je          00420A8A
 00420A84    or          byte ptr [ebp-25],1
>00420A88    jmp         00420A9D
 00420A8A    or          byte ptr [ebp-25],4
>00420A8E    jmp         00420A9D
 00420A90    mov         eax,dword ptr [ebp-4]
 00420A93    cmp         dword ptr [eax+20],0
>00420A97    je          00420A9D
 00420A99    or          byte ptr [ebp-25],1
 00420A9D    mov         eax,dword ptr [ebp-4]
 00420AA0    mov         ebx,dword ptr [eax+30]
 00420AA3    test        ebx,ebx
>00420AA5    je          00420AD8
 00420AA7    mov         eax,dword ptr [ebp-4]
 00420AAA    mov         eax,dword ptr [eax+34]
 00420AAD    cmp         eax,dword ptr [ebx+8]
>00420AB0    jge         00420AD8
 00420AB2    mov         eax,dword ptr [ebp-4]
 00420AB5    cmp         dword ptr [eax+20],0
>00420AB9    je          00420AD4
 00420ABB    mov         eax,dword ptr [ebp-4]
 00420ABE    mov         edx,dword ptr [eax+34]
 00420AC1    mov         eax,dword ptr [ebp-4]
 00420AC4    mov         eax,dword ptr [eax+30]
 00420AC7    call        TList.Get
 00420ACC    mov         edx,dword ptr [ebp-4]
 00420ACF    cmp         eax,dword ptr [edx+20]
>00420AD2    je          00420AD8
 00420AD4    or          byte ptr [ebp-25],2
 00420AD8    mov         eax,dword ptr [ebp-4]
 00420ADB    mov         ecx,dword ptr [eax+38]
 00420ADE    mov         dl,byte ptr [ebp-25]
 00420AE1    mov         eax,dword ptr [ebp-4]
 00420AE4    call        TWriter.WritePrefix
 00420AE9    mov         eax,dword ptr [ebp-4]
 00420AEC    cmp         byte ptr [eax+48],0
>00420AF0    je          00420B64
 00420AF2    mov         eax,dword ptr [ebp-8]
 00420AF5    call        TObject.ClassType
 00420AFA    call        TObject.ClassInfo
 00420AFF    call        GetTypeData
 00420B04    lea         edx,[eax+0A]
 00420B07    lea         eax,[ebp-130]
 00420B0D    call        @LStrFromString
 00420B12    push        dword ptr [ebp-130]
 00420B18    push        420DC8;'.'
 00420B1D    lea         edx,[ebp-128]
 00420B23    mov         eax,dword ptr [ebp-8]
 00420B26    mov         eax,dword ptr [eax]
 00420B28    call        TObject.ClassName
 00420B2D    lea         edx,[ebp-128]
 00420B33    lea         eax,[ebp-134]
 00420B39    call        @LStrFromString
 00420B3E    push        dword ptr [ebp-134]
 00420B44    lea         eax,[ebp-12C]
 00420B4A    mov         edx,3
 00420B4F    call        @LStrCatN
 00420B54    mov         edx,dword ptr [ebp-12C]
 00420B5A    mov         eax,dword ptr [ebp-4]
 00420B5D    call        TWriter.WriteStr
>00420B62    jmp         00420B93
 00420B64    lea         edx,[ebp-128]
 00420B6A    mov         eax,dword ptr [ebp-8]
 00420B6D    mov         eax,dword ptr [eax]
 00420B6F    call        TObject.ClassName
 00420B74    lea         edx,[ebp-128]
 00420B7A    lea         eax,[ebp-138]
 00420B80    call        @LStrFromString
 00420B85    mov         edx,dword ptr [ebp-138]
 00420B8B    mov         eax,dword ptr [ebp-4]
 00420B8E    call        TWriter.WriteStr
 00420B93    mov         eax,dword ptr [ebp-8]
 00420B96    mov         edx,dword ptr [eax+8]
 00420B99    mov         eax,dword ptr [ebp-4]
 00420B9C    call        TWriter.WriteStr
 00420BA1    mov         eax,dword ptr [ebp-4]
 00420BA4    call        TWriter.GetPosition
 00420BA9    mov         dword ptr [ebp-10],eax
 00420BAC    mov         eax,dword ptr [ebp-4]
 00420BAF    mov         eax,dword ptr [eax+30]
 00420BB2    test        eax,eax
>00420BB4    je          00420BD6
 00420BB6    mov         edx,dword ptr [ebp-4]
 00420BB9    mov         edx,dword ptr [edx+34]
 00420BBC    cmp         edx,dword ptr [eax+8]
>00420BBF    jge         00420BD6
 00420BC1    mov         eax,dword ptr [ebp-4]
 00420BC4    cmp         dword ptr [eax+20],0
>00420BC8    je          00420BD0
 00420BCA    mov         eax,dword ptr [ebp-4]
 00420BCD    inc         dword ptr [eax+34]
 00420BD0    mov         eax,dword ptr [ebp-4]
 00420BD3    inc         dword ptr [eax+38]
 00420BD6    mov         edx,dword ptr [ebp-8]
 00420BD9    mov         eax,dword ptr [ebp-4]
 00420BDC    call        TWriter.WriteProperties
 00420BE1    mov         eax,dword ptr [ebp-4]
 00420BE4    call        TWriter.WriteListEnd
 00420BE9    mov         eax,dword ptr [ebp-4]
 00420BEC    mov         eax,dword ptr [eax+30]
 00420BEF    mov         dword ptr [ebp-14],eax
 00420BF2    mov         eax,dword ptr [ebp-4]
 00420BF5    mov         eax,dword ptr [eax+34]
 00420BF8    mov         dword ptr [ebp-18],eax
 00420BFB    mov         eax,dword ptr [ebp-4]
 00420BFE    mov         eax,dword ptr [eax+38]
 00420C01    mov         dword ptr [ebp-1C],eax
 00420C04    mov         eax,dword ptr [ebp-4]
 00420C07    mov         eax,dword ptr [eax+18]
 00420C0A    mov         dword ptr [ebp-20],eax
 00420C0D    mov         eax,dword ptr [ebp-4]
 00420C10    mov         eax,dword ptr [eax+28]
 00420C13    mov         dword ptr [ebp-24],eax
 00420C16    xor         eax,eax
 00420C18    push        ebp
 00420C19    push        420D4D
 00420C1E    push        dword ptr fs:[eax]
 00420C21    mov         dword ptr fs:[eax],esp
 00420C24    mov         eax,dword ptr [ebp-4]
 00420C27    xor         edx,edx
 00420C29    mov         dword ptr [eax+30],edx
 00420C2C    mov         eax,dword ptr [ebp-4]
 00420C2F    xor         edx,edx
 00420C31    mov         dword ptr [eax+34],edx
 00420C34    mov         eax,dword ptr [ebp-4]
 00420C37    xor         edx,edx
 00420C39    mov         dword ptr [eax+38],edx
 00420C3C    mov         eax,dword ptr [ebp-4]
 00420C3F    cmp         byte ptr [eax+24],0
>00420C43    jne         00420D12
 00420C49    xor         eax,eax
 00420C4B    push        ebp
 00420C4C    push        420D0B
 00420C51    push        dword ptr fs:[eax]
 00420C54    mov         dword ptr fs:[eax],esp
 00420C57    mov         eax,dword ptr [ebp-4]
 00420C5A    mov         ebx,dword ptr [eax+20]
 00420C5D    test        ebx,ebx
>00420C5F    je          00420CC5
 00420C61    mov         eax,ebx
 00420C63    mov         edx,dword ptr ds:[418C6C];TComponent
 00420C69    call        @IsClass
 00420C6E    test        al,al
>00420C70    je          00420CC5
 00420C72    mov         eax,dword ptr [ebp-4]
 00420C75    mov         ebx,dword ptr [eax+20]
 00420C78    mov         eax,ebx
 00420C7A    mov         edx,dword ptr ds:[418C6C];TComponent
 00420C80    call        @IsClass
 00420C85    test        al,al
>00420C87    je          00420C95
 00420C89    test        byte ptr [ebx+1D],2
>00420C8D    je          00420C95
 00420C8F    mov         eax,dword ptr [ebp-4]
 00420C92    mov         dword ptr [eax+28],ebx
 00420C95    mov         dl,1
 00420C97    mov         eax,[00417CEC];TList
 00420C9C    call        TObject.Create
 00420CA1    mov         edx,dword ptr [ebp-4]
 00420CA4    mov         dword ptr [edx+30],eax
 00420CA7    mov         eax,dword ptr [ebp-4]
 00420CAA    push        eax
 00420CAB    push        420570;TWriter.AddAncestor
 00420CB0    mov         eax,dword ptr [ebp-4]
 00420CB3    mov         edx,dword ptr [eax+28]
 00420CB6    mov         eax,dword ptr [ebp-4]
 00420CB9    mov         eax,dword ptr [eax+20]
 00420CBC    mov         si,0FFFD
 00420CC0    call        @CallDynaInst
 00420CC5    mov         eax,dword ptr [ebp-8]
 00420CC8    test        byte ptr [eax+1D],2
>00420CCC    je          00420CD7
 00420CCE    mov         eax,dword ptr [ebp-4]
 00420CD1    mov         edx,dword ptr [ebp-8]
 00420CD4    mov         dword ptr [eax+18],edx
 00420CD7    mov         eax,dword ptr [ebp-4]
 00420CDA    push        eax
 00420CDB    push        42087C;TWriter.WriteComponent
 00420CE0    mov         eax,dword ptr [ebp-4]
 00420CE3    mov         edx,dword ptr [eax+18]
 00420CE6    mov         eax,dword ptr [ebp-8]
 00420CE9    mov         si,0FFFD
 00420CED    call        @CallDynaInst
 00420CF2    xor         eax,eax
 00420CF4    pop         edx
 00420CF5    pop         ecx
 00420CF6    pop         ecx
 00420CF7    mov         dword ptr fs:[eax],edx
 00420CFA    push        420D12
 00420CFF    mov         eax,dword ptr [ebp-4]
 00420D02    mov         eax,dword ptr [eax+30]
 00420D05    call        TObject.Free
 00420D0A    ret
>00420D0B    jmp         @HandleFinally
>00420D10    jmp         00420CFF
 00420D12    xor         eax,eax
 00420D14    pop         edx
 00420D15    pop         ecx
 00420D16    pop         ecx
 00420D17    mov         dword ptr fs:[eax],edx
 00420D1A    push        420D54
 00420D1F    mov         eax,dword ptr [ebp-4]
 00420D22    mov         edx,dword ptr [ebp-14]
 00420D25    mov         dword ptr [eax+30],edx
 00420D28    mov         eax,dword ptr [ebp-4]
 00420D2B    mov         edx,dword ptr [ebp-18]
 00420D2E    mov         dword ptr [eax+34],edx
 00420D31    mov         eax,dword ptr [ebp-4]
 00420D34    mov         edx,dword ptr [ebp-1C]
 00420D37    mov         dword ptr [eax+38],edx
 00420D3A    mov         eax,dword ptr [ebp-4]
 00420D3D    mov         edx,dword ptr [ebp-20]
 00420D40    mov         dword ptr [eax+18],edx
 00420D43    mov         eax,dword ptr [ebp-4]
 00420D46    mov         edx,dword ptr [ebp-24]
 00420D49    mov         dword ptr [eax+28],edx
 00420D4C    ret
>00420D4D    jmp         @HandleFinally
>00420D52    jmp         00420D1F
 00420D54    mov         eax,dword ptr [ebp-4]
 00420D57    call        TWriter.WriteListEnd
 00420D5C    mov         eax,dword ptr [ebp-4]
 00420D5F    mov         eax,dword ptr [eax+18]
 00420D62    cmp         eax,dword ptr [ebp-8]
>00420D65    je          00420D8E
 00420D67    mov         al,[00420DCC]
 00420D6C    cmp         al,byte ptr [ebp-25]
>00420D6F    jne         00420D8E
 00420D71    mov         eax,dword ptr [ebp-4]
 00420D74    call        TWriter.GetPosition
 00420D79    mov         edx,dword ptr [ebp-10]
 00420D7C    add         edx,2
 00420D7F    cmp         eax,edx
>00420D81    jne         00420D8E
 00420D83    mov         edx,dword ptr [ebp-0C]
 00420D86    mov         eax,dword ptr [ebp-4]
 00420D89    call        TWriter.SetPosition
 00420D8E    xor         eax,eax
 00420D90    pop         edx
 00420D91    pop         ecx
 00420D92    pop         ecx
 00420D93    mov         dword ptr fs:[eax],edx
 00420D96    push        420DB3
 00420D9B    lea         eax,[ebp-138]
 00420DA1    mov         edx,4
 00420DA6    call        @LStrArrayClr
 00420DAB    ret
>00420DAC    jmp         @HandleFinally
>00420DB1    jmp         00420D9B
 00420DB3    pop         esi
 00420DB4    pop         ebx
 00420DB5    mov         esp,ebp
 00420DB7    pop         ebp
 00420DB8    ret
*}
end;

//00420DD0
procedure TWriter.WriteFloat(const Value:Extended);
begin
{*
 00420DD0    push        ebp
 00420DD1    mov         ebp,esp
 00420DD3    push        ebx
 00420DD4    mov         ebx,eax
 00420DD6    mov         dl,5
 00420DD8    mov         eax,ebx
 00420DDA    call        TWriter.WriteValue
 00420DDF    lea         edx,[ebp+8]
 00420DE2    mov         ecx,0A
 00420DE7    mov         eax,ebx
 00420DE9    call        TWriter.Write
 00420DEE    pop         ebx
 00420DEF    pop         ebp
 00420DF0    ret         0C
*}
end;

//00420DF4
procedure TWriter.WriteSingle(const Value:Single);
begin
{*
 00420DF4    push        ebp
 00420DF5    mov         ebp,esp
 00420DF7    push        ebx
 00420DF8    mov         ebx,eax
 00420DFA    mov         dl,0F
 00420DFC    mov         eax,ebx
 00420DFE    call        TWriter.WriteValue
 00420E03    lea         edx,[ebp+8]
 00420E06    mov         ecx,4
 00420E0B    mov         eax,ebx
 00420E0D    call        TWriter.Write
 00420E12    pop         ebx
 00420E13    pop         ebp
 00420E14    ret         4
*}
end;

//00420E18
procedure TWriter.WriteCurrency(const Value:Currency);
begin
{*
 00420E18    push        ebp
 00420E19    mov         ebp,esp
 00420E1B    push        ebx
 00420E1C    mov         ebx,eax
 00420E1E    mov         dl,10
 00420E20    mov         eax,ebx
 00420E22    call        TWriter.WriteValue
 00420E27    lea         edx,[ebp+8]
 00420E2A    mov         ecx,8
 00420E2F    mov         eax,ebx
 00420E31    call        TWriter.Write
 00420E36    pop         ebx
 00420E37    pop         ebp
 00420E38    ret         8
*}
end;

//00420E3C
procedure TWriter.WriteDate(const Value:TDateTime);
begin
{*
 00420E3C    push        ebp
 00420E3D    mov         ebp,esp
 00420E3F    push        ebx
 00420E40    mov         ebx,eax
 00420E42    mov         dl,11
 00420E44    mov         eax,ebx
 00420E46    call        TWriter.WriteValue
 00420E4B    lea         edx,[ebp+8]
 00420E4E    mov         ecx,8
 00420E53    mov         eax,ebx
 00420E55    call        TWriter.Write
 00420E5A    pop         ebx
 00420E5B    pop         ebp
 00420E5C    ret         8
*}
end;

//00420E60
procedure TWriter.WriteIdent(const Ident:AnsiString);
begin
{*
 00420E60    push        ebx
 00420E61    push        esi
 00420E62    mov         esi,edx
 00420E64    mov         ebx,eax
 00420E66    mov         edx,420EF0;'False'
 00420E6B    mov         eax,esi
 00420E6D    call        SameText
 00420E72    test        al,al
>00420E74    je          00420E82
 00420E76    mov         dl,8
 00420E78    mov         eax,ebx
 00420E7A    call        TWriter.WriteValue
 00420E7F    pop         esi
 00420E80    pop         ebx
 00420E81    ret
 00420E82    mov         edx,420F00;'True'
 00420E87    mov         eax,esi
 00420E89    call        SameText
 00420E8E    test        al,al
>00420E90    je          00420E9D
 00420E92    mov         dl,9
 00420E94    mov         eax,ebx
 00420E96    call        TWriter.WriteValue
>00420E9B    jmp         00420EE5
 00420E9D    mov         edx,420F10;'Null'
 00420EA2    mov         eax,esi
 00420EA4    call        SameText
 00420EA9    test        al,al
>00420EAB    je          00420EB8
 00420EAD    xor         edx,edx
 00420EAF    mov         eax,ebx
 00420EB1    call        TWriter.WriteValue
>00420EB6    jmp         00420EE5
 00420EB8    mov         edx,420F20;'nil'
 00420EBD    mov         eax,esi
 00420EBF    call        SameText
 00420EC4    test        al,al
>00420EC6    je          00420ED3
 00420EC8    mov         dl,0D
 00420ECA    mov         eax,ebx
 00420ECC    call        TWriter.WriteValue
>00420ED1    jmp         00420EE5
 00420ED3    mov         dl,7
 00420ED5    mov         eax,ebx
 00420ED7    call        TWriter.WriteValue
 00420EDC    mov         edx,esi
 00420EDE    mov         eax,ebx
 00420EE0    call        TWriter.WriteStr
 00420EE5    pop         esi
 00420EE6    pop         ebx
 00420EE7    ret
*}
end;

//00420F24
procedure TWriter.WriteInteger(Value:Longint);
begin
{*
 00420F24    push        ebx
 00420F25    push        ecx
 00420F26    mov         dword ptr [esp],edx
 00420F29    mov         ebx,eax
 00420F2B    cmp         dword ptr [esp],0FFFFFF80
>00420F2F    jl          00420F51
 00420F31    cmp         dword ptr [esp],7F
>00420F35    jg          00420F51
 00420F37    mov         dl,2
 00420F39    mov         eax,ebx
 00420F3B    call        TWriter.WriteValue
 00420F40    mov         edx,esp
 00420F42    mov         ecx,1
 00420F47    mov         eax,ebx
 00420F49    call        TWriter.Write
 00420F4E    pop         edx
 00420F4F    pop         ebx
 00420F50    ret
 00420F51    cmp         dword ptr [esp],0FFFF8000
>00420F58    jl          00420F7C
 00420F5A    cmp         dword ptr [esp],7FFF
>00420F61    jg          00420F7C
 00420F63    mov         dl,3
 00420F65    mov         eax,ebx
 00420F67    call        TWriter.WriteValue
 00420F6C    mov         edx,esp
 00420F6E    mov         ecx,2
 00420F73    mov         eax,ebx
 00420F75    call        TWriter.Write
>00420F7A    jmp         00420F93
 00420F7C    mov         dl,4
 00420F7E    mov         eax,ebx
 00420F80    call        TWriter.WriteValue
 00420F85    mov         edx,esp
 00420F87    mov         ecx,4
 00420F8C    mov         eax,ebx
 00420F8E    call        TWriter.Write
 00420F93    pop         edx
 00420F94    pop         ebx
 00420F95    ret
*}
end;

//00420F98
procedure TWriter.WriteInteger(Value:Int64);
begin
{*
 00420F98    push        ebp
 00420F99    mov         ebp,esp
 00420F9B    push        ebx
 00420F9C    mov         ebx,eax
 00420F9E    cmp         dword ptr [ebp+0C],0FFFFFFFF
>00420FA2    jne         00420FAF
 00420FA4    cmp         dword ptr [ebp+8],80000000
>00420FAB    jb          00420FD2
>00420FAD    jmp         00420FB1
>00420FAF    jl          00420FD2
 00420FB1    cmp         dword ptr [ebp+0C],0
>00420FB5    jne         00420FC2
 00420FB7    cmp         dword ptr [ebp+8],7FFFFFFF
>00420FBE    ja          00420FD2
>00420FC0    jmp         00420FC4
>00420FC2    jg          00420FD2
 00420FC4    mov         eax,dword ptr [ebp+8]
 00420FC7    mov         edx,eax
 00420FC9    mov         eax,ebx
 00420FCB    call        TWriter.WriteInteger
>00420FD0    jmp         00420FEA
 00420FD2    mov         dl,13
 00420FD4    mov         eax,ebx
 00420FD6    call        TWriter.WriteValue
 00420FDB    lea         edx,[ebp+8]
 00420FDE    mov         ecx,8
 00420FE3    mov         eax,ebx
 00420FE5    call        TWriter.Write
 00420FEA    pop         ebx
 00420FEB    pop         ebp
 00420FEC    ret         8
*}
end;

//00420FF0
procedure TWriter.WriteListBegin;
begin
{*
 00420FF0    mov         dl,1
 00420FF2    call        TWriter.WriteValue
 00420FF7    ret
*}
end;

//00420FF8
procedure TWriter.WriteListEnd;
begin
{*
 00420FF8    xor         edx,edx
 00420FFA    call        TWriter.WriteValue
 00420FFF    ret
*}
end;

//00421000
procedure TWriter.WritePrefix(Flags:TFilerFlags; AChildPos:Integer);
begin
{*
 00421000    push        ebx
 00421001    push        esi
 00421002    push        ecx
 00421003    mov         esi,ecx
 00421005    mov         byte ptr [esp],dl
 00421008    mov         ebx,eax
 0042100A    mov         al,[00421040]
 0042100F    cmp         al,byte ptr [esp]
>00421012    je          0042103C
 00421014    mov         al,byte ptr [esp]
 00421017    or          al,0F0
 00421019    mov         byte ptr [esp+1],al
 0042101D    lea         edx,[esp+1]
 00421021    mov         ecx,1
 00421026    mov         eax,ebx
 00421028    call        TWriter.Write
 0042102D    test        byte ptr [esp],2
>00421031    je          0042103C
 00421033    mov         edx,esi
 00421035    mov         eax,ebx
 00421037    call        TWriter.WriteInteger
 0042103C    pop         edx
 0042103D    pop         esi
 0042103E    pop         ebx
 0042103F    ret
*}
end;

//00421044
procedure TWriter.WriteProperties(Instance:TPersistent);
begin
{*
 00421044    push        ebp
 00421045    mov         ebp,esp
 00421047    add         esp,0FFFFFFF0
 0042104A    push        ebx
 0042104B    push        esi
 0042104C    push        edi
 0042104D    mov         dword ptr [ebp-8],edx
 00421050    mov         dword ptr [ebp-4],eax
 00421053    mov         eax,dword ptr [ebp-8]
 00421056    mov         eax,dword ptr [eax]
 00421058    call        TObject.ClassInfo
 0042105D    call        GetTypeData
 00421062    movsx       eax,word ptr [eax+8]
 00421066    mov         dword ptr [ebp-0C],eax
 00421069    cmp         dword ptr [ebp-0C],0
>0042106D    jle         004210F8
 00421073    mov         eax,dword ptr [ebp-0C]
 00421076    shl         eax,2
 00421079    call        @GetMem
 0042107E    mov         dword ptr [ebp-10],eax
 00421081    xor         eax,eax
 00421083    push        ebp
 00421084    push        4210F1
 00421089    push        dword ptr fs:[eax]
 0042108C    mov         dword ptr fs:[eax],esp
 0042108F    mov         eax,dword ptr [ebp-8]
 00421092    mov         eax,dword ptr [eax]
 00421094    call        TObject.ClassInfo
 00421099    mov         edx,dword ptr [ebp-10]
 0042109C    call        GetPropInfos
 004210A1    mov         esi,dword ptr [ebp-0C]
 004210A4    dec         esi
 004210A5    test        esi,esi
>004210A7    jl          004210D5
 004210A9    inc         esi
 004210AA    xor         edi,edi
 004210AC    mov         eax,dword ptr [ebp-10]
 004210AF    mov         ebx,dword ptr [eax+edi*4]
 004210B2    test        ebx,ebx
>004210B4    je          004210D5
 004210B6    mov         edx,ebx
 004210B8    mov         eax,dword ptr [ebp-8]
 004210BB    call        IsStoredProp
 004210C0    test        al,al
>004210C2    je          004210D1
 004210C4    mov         ecx,ebx
 004210C6    mov         edx,dword ptr [ebp-8]
 004210C9    mov         eax,dword ptr [ebp-4]
 004210CC    call        TWriter.WriteProperty
 004210D1    inc         edi
 004210D2    dec         esi
>004210D3    jne         004210AC
 004210D5    xor         eax,eax
 004210D7    pop         edx
 004210D8    pop         ecx
 004210D9    pop         ecx
 004210DA    mov         dword ptr fs:[eax],edx
 004210DD    push        4210F8
 004210E2    mov         edx,dword ptr [ebp-0C]
 004210E5    shl         edx,2
 004210E8    mov         eax,dword ptr [ebp-10]
 004210EB    call        @FreeMem
 004210F0    ret
>004210F1    jmp         @HandleFinally
>004210F6    jmp         004210E2
 004210F8    mov         edx,dword ptr [ebp-4]
 004210FB    mov         eax,dword ptr [ebp-8]
 004210FE    mov         ecx,dword ptr [eax]
 00421100    call        dword ptr [ecx+4]
 00421103    pop         edi
 00421104    pop         esi
 00421105    pop         ebx
 00421106    mov         esp,ebp
 00421108    pop         ebp
 00421109    ret
*}
end;

//0042110C
function AncestorIsValid(Ancestor:TPersistent; Root:TComponent; RootAncestor:TComponent):Boolean;
begin
{*
 0042110C    push        ebx
 0042110D    push        esi
 0042110E    push        edi
 0042110F    mov         ebx,ecx
 00421111    mov         edi,edx
 00421113    mov         esi,eax
 00421115    test        esi,esi
>00421117    je          00421131
 00421119    test        ebx,ebx
>0042111B    je          00421131
 0042111D    mov         eax,ebx
 0042111F    call        TObject.ClassType
 00421124    mov         edx,eax
 00421126    mov         eax,dword ptr [edi]
 00421128    call        TObject.InheritsFrom
 0042112D    test        al,al
>0042112F    jne         00421135
 00421131    xor         eax,eax
>00421133    jmp         00421137
 00421135    mov         al,1
 00421137    pop         edi
 00421138    pop         esi
 00421139    pop         ebx
 0042113A    ret
*}
end;

//0042113C
function IsDefaultOrdProp:Boolean;
begin
{*
 0042113C    push        ebp
 0042113D    mov         ebp,esp
 0042113F    push        ebx
 00421140    mov         eax,dword ptr [ebp+8]
 00421143    mov         edx,dword ptr [eax-8]
 00421146    mov         eax,dword ptr [ebp+8]
 00421149    mov         eax,dword ptr [eax-4]
 0042114C    call        GetOrdProp
 00421151    mov         ebx,eax
 00421153    mov         eax,dword ptr [ebp+8]
 00421156    cmp         byte ptr [eax-9],0
>0042115A    je          00421175
 0042115C    mov         eax,dword ptr [ebp+8]
 0042115F    mov         edx,dword ptr [eax-8]
 00421162    mov         eax,dword ptr [ebp+8]
 00421165    mov         eax,dword ptr [eax-10]
 00421168    call        GetOrdProp
 0042116D    cmp         ebx,eax
 0042116F    sete        al
 00421172    pop         ebx
 00421173    pop         ebp
 00421174    ret
 00421175    mov         eax,dword ptr [ebp+8]
 00421178    mov         eax,dword ptr [eax-8]
 0042117B    mov         eax,dword ptr [eax+14]
 0042117E    cmp         eax,80000000
>00421183    je          00421189
 00421185    cmp         eax,ebx
>00421187    je          0042118D
 00421189    xor         eax,eax
>0042118B    jmp         0042118F
 0042118D    mov         al,1
 0042118F    pop         ebx
 00421190    pop         ebp
 00421191    ret
*}
end;

//00421194
function IsDefaultFloatProp:Boolean;
begin
{*
 00421194    push        ebp
 00421195    mov         ebp,esp
 00421197    add         esp,0FFFFFFF0
 0042119A    mov         eax,dword ptr [ebp+8]
 0042119D    mov         edx,dword ptr [eax-8]
 004211A0    mov         eax,dword ptr [ebp+8]
 004211A3    mov         eax,dword ptr [eax-4]
 004211A6    call        GetFloatProp
 004211AB    fstp        tbyte ptr [ebp-10]
 004211AE    wait
 004211AF    mov         eax,dword ptr [ebp+8]
 004211B2    cmp         byte ptr [eax-9],0
>004211B6    je          004211D6
 004211B8    mov         eax,dword ptr [ebp+8]
 004211BB    mov         edx,dword ptr [eax-8]
 004211BE    mov         eax,dword ptr [ebp+8]
 004211C1    mov         eax,dword ptr [eax-10]
 004211C4    call        GetFloatProp
 004211C9    fld         tbyte ptr [ebp-10]
 004211CC    fcompp
 004211CE    fnstsw      al
 004211D0    sahf
 004211D1    sete        al
>004211D4    jmp         004211E5
 004211D6    fld         tbyte ptr [ebp-10]
 004211D9    fcomp       dword ptr ds:[4211EC]
 004211DF    fnstsw      al
 004211E1    sahf
 004211E2    sete        al
 004211E5    mov         esp,ebp
 004211E7    pop         ebp
 004211E8    ret
*}
end;

//004211F0
function IsDefaultInt64Prop:Boolean;
begin
{*
 004211F0    push        ebp
 004211F1    mov         ebp,esp
 004211F3    add         esp,0FFFFFFF8
 004211F6    mov         eax,dword ptr [ebp+8]
 004211F9    mov         edx,dword ptr [eax-8]
 004211FC    mov         eax,dword ptr [ebp+8]
 004211FF    mov         eax,dword ptr [eax-4]
 00421202    call        GetInt64Prop
 00421207    mov         dword ptr [ebp-8],eax
 0042120A    mov         dword ptr [ebp-4],edx
 0042120D    mov         eax,dword ptr [ebp+8]
 00421210    cmp         byte ptr [eax-9],0
>00421214    je          00421234
 00421216    mov         eax,dword ptr [ebp+8]
 00421219    mov         edx,dword ptr [eax-8]
 0042121C    mov         eax,dword ptr [ebp+8]
 0042121F    mov         eax,dword ptr [eax-10]
 00421222    call        GetInt64Prop
 00421227    cmp         edx,dword ptr [ebp-4]
>0042122A    jne         0042122F
 0042122C    cmp         eax,dword ptr [ebp-8]
 0042122F    sete        al
>00421232    jmp         00421241
 00421234    cmp         dword ptr [ebp-4],0
>00421238    jne         0042123E
 0042123A    cmp         dword ptr [ebp-8],0
 0042123E    sete        al
 00421241    pop         ecx
 00421242    pop         ecx
 00421243    pop         ebp
 00421244    ret
*}
end;

//00421248
function IsDefaultStrProp:Boolean;
begin
{*
 00421248    push        ebp
 00421249    mov         ebp,esp
 0042124B    push        0
 0042124D    push        0
 0042124F    push        ebx
 00421250    xor         eax,eax
 00421252    push        ebp
 00421253    push        4212C7
 00421258    push        dword ptr fs:[eax]
 0042125B    mov         dword ptr fs:[eax],esp
 0042125E    lea         ecx,[ebp-4]
 00421261    mov         eax,dword ptr [ebp+8]
 00421264    mov         edx,dword ptr [eax-8]
 00421267    mov         eax,dword ptr [ebp+8]
 0042126A    mov         eax,dword ptr [eax-4]
 0042126D    call        GetWideStrProp
 00421272    mov         eax,dword ptr [ebp+8]
 00421275    cmp         byte ptr [eax-9],0
>00421279    je          0042129F
 0042127B    lea         ecx,[ebp-8]
 0042127E    mov         eax,dword ptr [ebp+8]
 00421281    mov         edx,dword ptr [eax-8]
 00421284    mov         eax,dword ptr [ebp+8]
 00421287    mov         eax,dword ptr [eax-10]
 0042128A    call        GetWideStrProp
 0042128F    mov         edx,dword ptr [ebp-8]
 00421292    mov         eax,dword ptr [ebp-4]
 00421295    call        @WStrCmp
 0042129A    sete        bl
>0042129D    jmp         004212AC
 0042129F    mov         eax,dword ptr [ebp-4]
 004212A2    xor         edx,edx
 004212A4    call        @WStrCmp
 004212A9    sete        bl
 004212AC    xor         eax,eax
 004212AE    pop         edx
 004212AF    pop         ecx
 004212B0    pop         ecx
 004212B1    mov         dword ptr fs:[eax],edx
 004212B4    push        4212CE
 004212B9    lea         eax,[ebp-8]
 004212BC    mov         edx,2
 004212C1    call        @WStrArrayClr
 004212C6    ret
>004212C7    jmp         @HandleFinally
>004212CC    jmp         004212B9
 004212CE    mov         eax,ebx
 004212D0    pop         ebx
 004212D1    pop         ecx
 004212D2    pop         ecx
 004212D3    pop         ebp
 004212D4    ret
*}
end;

//004212D8
function ObjectAncestorMatch(AncestorValue:TComponent; Value:TComponent):Boolean;
begin
{*
 004212D8    push        ebp
 004212D9    mov         ebp,esp
 004212DB    push        ebx
 004212DC    push        esi
 004212DD    mov         esi,edx
 004212DF    mov         ebx,eax
 004212E1    test        ebx,ebx
>004212E3    je          0042130E
 004212E5    mov         eax,dword ptr [ebp+8]
 004212E8    mov         eax,dword ptr [eax-14]
 004212EB    cmp         eax,dword ptr [ebx+4]
>004212EE    jne         0042130E
 004212F0    test        esi,esi
>004212F2    je          0042130E
 004212F4    mov         eax,dword ptr [ebp+8]
 004212F7    mov         eax,dword ptr [eax-18]
 004212FA    cmp         eax,dword ptr [esi+4]
>004212FD    jne         0042130E
 004212FF    mov         edx,dword ptr [esi+8]
 00421302    mov         eax,dword ptr [ebx+8]
 00421305    call        SameText
 0042130A    test        al,al
>0042130C    jne         00421312
 0042130E    xor         eax,eax
>00421310    jmp         00421314
 00421312    mov         al,1
 00421314    pop         esi
 00421315    pop         ebx
 00421316    pop         ebp
 00421317    ret
*}
end;

//00421318
function IsDefault:Boolean;
begin
{*
 00421318    push        ebp
 00421319    mov         ebp,esp
 0042131B    push        ebx
 0042131C    xor         ebx,ebx
 0042131E    mov         eax,dword ptr [ebp+8]
 00421321    mov         eax,dword ptr [eax+8]
 00421324    cmp         byte ptr [eax-9],0
>00421328    je          00421362
 0042132A    mov         eax,dword ptr [ebp+8]
 0042132D    mov         eax,dword ptr [eax+8]
 00421330    mov         edx,dword ptr [eax-8]
 00421333    mov         eax,dword ptr [ebp+8]
 00421336    mov         eax,dword ptr [eax+8]
 00421339    mov         eax,dword ptr [eax-10]
 0042133C    call        GetOrdProp
 00421341    mov         ebx,eax
 00421343    mov         eax,dword ptr [ebp+8]
 00421346    mov         eax,dword ptr [eax+8]
 00421349    push        eax
 0042134A    mov         eax,dword ptr [ebp+8]
 0042134D    mov         edx,dword ptr [eax-4]
 00421350    mov         eax,ebx
 00421352    call        ObjectAncestorMatch
 00421357    pop         ecx
 00421358    test        al,al
>0042135A    je          00421362
 0042135C    mov         eax,dword ptr [ebp+8]
 0042135F    mov         ebx,dword ptr [eax-4]
 00421362    mov         eax,dword ptr [ebp+8]
 00421365    cmp         ebx,dword ptr [eax-4]
 00421368    sete        al
 0042136B    pop         ebx
 0042136C    pop         ebp
 0042136D    ret
*}
end;

//00421370
function IsDefaultObjectProp:Boolean;
begin
{*
 00421370    push        ebp
 00421371    mov         ebp,esp
 00421373    push        ecx
 00421374    push        ebx
 00421375    mov         bl,1
 00421377    mov         eax,dword ptr [ebp+8]
 0042137A    mov         edx,dword ptr [eax-8]
 0042137D    mov         eax,dword ptr [ebp+8]
 00421380    mov         eax,dword ptr [eax-4]
 00421383    call        GetOrdProp
 00421388    mov         dword ptr [ebp-4],eax
 0042138B    cmp         dword ptr [ebp-4],0
>0042138F    jne         004213A0
 00421391    push        ebp
 00421392    call        IsDefault
 00421397    pop         ecx
 00421398    test        al,al
>0042139A    jne         004213A0
 0042139C    xor         ebx,ebx
>0042139E    jmp         004213E7
 004213A0    mov         eax,dword ptr [ebp-4]
 004213A3    mov         edx,dword ptr ds:[417DFC];TPersistent
 004213A9    call        @IsClass
 004213AE    test        al,al
>004213B0    je          004213E7
 004213B2    mov         eax,dword ptr [ebp-4]
 004213B5    mov         edx,dword ptr ds:[418C6C];TComponent
 004213BB    call        @IsClass
 004213C0    test        al,al
>004213C2    je          004213E5
 004213C4    mov         eax,dword ptr [ebp-4]
 004213C7    test        byte ptr [eax+24],4
>004213CB    jne         004213E5
 004213CD    push        ebp
 004213CE    call        IsDefault
 004213D3    pop         ecx
 004213D4    test        al,al
>004213D6    jne         004213E7
 004213D8    mov         eax,dword ptr [ebp-4]
 004213DB    cmp         dword ptr [eax+8],0
>004213DF    je          004213E7
 004213E1    xor         ebx,ebx
>004213E3    jmp         004213E7
 004213E5    xor         ebx,ebx
 004213E7    mov         eax,ebx
 004213E9    pop         ebx
 004213EA    pop         ecx
 004213EB    pop         ebp
 004213EC    ret
*}
end;

//004213F0
function IsDefaultValue:Boolean;
begin
{*
 004213F0    push        ebp
 004213F1    mov         ebp,esp
 004213F3    push        0
 004213F5    push        0
 004213F7    push        ebx
 004213F8    xor         eax,eax
 004213FA    push        ebp
 004213FB    push        42149C
 00421400    push        dword ptr fs:[eax]
 00421403    mov         dword ptr fs:[eax],esp
 00421406    mov         eax,dword ptr [ebp+8]
 00421409    cmp         dword ptr [eax-4],0
 0042140D    sete        bl
 00421410    mov         eax,dword ptr [ebp+8]
 00421413    mov         eax,dword ptr [eax+8]
 00421416    cmp         byte ptr [eax-9],0
>0042141A    je          0042147E
 0042141C    lea         ecx,[ebp-4]
 0042141F    mov         eax,dword ptr [ebp+8]
 00421422    mov         eax,dword ptr [eax+8]
 00421425    mov         edx,dword ptr [eax-8]
 00421428    mov         eax,dword ptr [ebp+8]
 0042142B    mov         eax,dword ptr [eax+8]
 0042142E    mov         eax,dword ptr [eax-10]
 00421431    call        GetInterfaceProp
 00421436    mov         eax,dword ptr [ebp+8]
 00421439    mov         eax,dword ptr [eax-4]
 0042143C    cmp         eax,dword ptr [ebp-4]
 0042143F    sete        bl
 00421442    test        bl,bl
>00421444    jne         0042147E
 00421446    lea         eax,[ebp-8]
 00421449    call        @IntfClear
 0042144E    mov         ecx,eax
 00421450    mov         edx,4214AC
 00421455    mov         eax,dword ptr [ebp-4]
 00421458    call        Supports
 0042145D    test        al,al
>0042145F    je          0042147E
 00421461    mov         eax,dword ptr [ebp+8]
 00421464    mov         eax,dword ptr [eax+8]
 00421467    push        eax
 00421468    mov         eax,dword ptr [ebp-8]
 0042146B    mov         edx,dword ptr [eax]
 0042146D    call        dword ptr [edx+0C]
 00421470    mov         edx,dword ptr [ebp+8]
 00421473    mov         edx,dword ptr [edx-8]
 00421476    call        ObjectAncestorMatch
 0042147B    pop         ecx
 0042147C    mov         ebx,eax
 0042147E    xor         eax,eax
 00421480    pop         edx
 00421481    pop         ecx
 00421482    pop         ecx
 00421483    mov         dword ptr fs:[eax],edx
 00421486    push        4214A3
 0042148B    lea         eax,[ebp-8]
 0042148E    call        @IntfClear
 00421493    lea         eax,[ebp-4]
 00421496    call        @IntfClear
 0042149B    ret
>0042149C    jmp         @HandleFinally
>004214A1    jmp         0042148B
 004214A3    mov         eax,ebx
 004214A5    pop         ebx
 004214A6    pop         ecx
 004214A7    pop         ecx
 004214A8    pop         ebp
 004214A9    ret
*}
end;

//004214BC
function IsDefaultInterfaceProp:Boolean;
begin
{*
 004214BC    push        ebp
 004214BD    mov         ebp,esp
 004214BF    xor         ecx,ecx
 004214C1    push        ecx
 004214C2    push        ecx
 004214C3    push        ecx
 004214C4    push        ecx
 004214C5    push        ebx
 004214C6    xor         eax,eax
 004214C8    push        ebp
 004214C9    push        421579
 004214CE    push        dword ptr fs:[eax]
 004214D1    mov         dword ptr fs:[eax],esp
 004214D4    mov         bl,1
 004214D6    lea         ecx,[ebp-4]
 004214D9    mov         eax,dword ptr [ebp+8]
 004214DC    mov         edx,dword ptr [eax-8]
 004214DF    mov         eax,dword ptr [ebp+8]
 004214E2    mov         eax,dword ptr [eax-4]
 004214E5    call        GetInterfaceProp
 004214EA    cmp         dword ptr [ebp-4],0
>004214EE    je          0042150B
 004214F0    lea         eax,[ebp-0C]
 004214F3    call        @IntfClear
 004214F8    mov         ecx,eax
 004214FA    mov         edx,421588
 004214FF    mov         eax,dword ptr [ebp-4]
 00421502    call        Supports
 00421507    test        al,al
>00421509    jne         00421532
 0042150B    mov         eax,dword ptr [ebp+8]
 0042150E    cmp         byte ptr [eax-9],0
>00421512    je          00421553
 00421514    lea         ecx,[ebp-10]
 00421517    mov         eax,dword ptr [ebp+8]
 0042151A    mov         edx,dword ptr [eax-8]
 0042151D    mov         eax,dword ptr [ebp+8]
 00421520    mov         eax,dword ptr [eax-10]
 00421523    call        GetInterfaceProp
 00421528    cmp         dword ptr [ebp-10],0
>0042152C    je          00421553
 0042152E    xor         ebx,ebx
>00421530    jmp         00421553
 00421532    mov         eax,dword ptr [ebp-0C]
 00421535    mov         edx,dword ptr [eax]
 00421537    call        dword ptr [edx+0C]
 0042153A    mov         dword ptr [ebp-8],eax
 0042153D    push        ebp
 0042153E    call        IsDefaultValue
 00421543    pop         ecx
 00421544    test        al,al
>00421546    jne         00421553
 00421548    mov         eax,dword ptr [ebp-8]
 0042154B    cmp         dword ptr [eax+8],0
>0042154F    je          00421553
 00421551    xor         ebx,ebx
 00421553    xor         eax,eax
 00421555    pop         edx
 00421556    pop         ecx
 00421557    pop         ecx
 00421558    mov         dword ptr fs:[eax],edx
 0042155B    push        421580
 00421560    lea         eax,[ebp-10]
 00421563    call        @IntfClear
 00421568    lea         eax,[ebp-0C]
 0042156B    call        @IntfClear
 00421570    lea         eax,[ebp-4]
 00421573    call        @IntfClear
 00421578    ret
>00421579    jmp         @HandleFinally
>0042157E    jmp         00421560
 00421580    mov         eax,ebx
 00421582    pop         ebx
 00421583    mov         esp,ebp
 00421585    pop         ebp
 00421586    ret
*}
end;

//00421598
function IsDefaultMethodProp:Boolean;
begin
{*
 00421598    push        ebp
 00421599    mov         ebp,esp
 0042159B    add         esp,0FFFFFEF0
 004215A1    push        ebx
 004215A2    push        esi
 004215A3    lea         ecx,[ebp-8]
 004215A6    mov         eax,dword ptr [ebp+8]
 004215A9    mov         edx,dword ptr [eax-8]
 004215AC    mov         eax,dword ptr [ebp+8]
 004215AF    mov         eax,dword ptr [eax-4]
 004215B2    call        GetMethodProp
 004215B7    xor         ebx,ebx
 004215B9    mov         eax,dword ptr [ebp+8]
 004215BC    cmp         byte ptr [eax-9],0
>004215C0    je          004215D9
 004215C2    lea         ecx,[ebp-10]
 004215C5    mov         eax,dword ptr [ebp+8]
 004215C8    mov         edx,dword ptr [eax-8]
 004215CB    mov         eax,dword ptr [ebp+8]
 004215CE    mov         eax,dword ptr [eax-10]
 004215D1    call        GetMethodProp
 004215D6    mov         ebx,dword ptr [ebp-10]
 004215D9    cmp         ebx,dword ptr [ebp-8]
>004215DC    je          00421607
 004215DE    mov         esi,dword ptr [ebp-8]
 004215E1    test        esi,esi
>004215E3    je          00421603
 004215E5    lea         ecx,[ebp-110]
 004215EB    mov         eax,dword ptr [ebp+8]
 004215EE    mov         eax,dword ptr [eax-1C]
 004215F1    mov         eax,dword ptr [eax]
 004215F3    mov         edx,esi
 004215F5    call        TObject.MethodName
 004215FA    cmp         byte ptr [ebp-110],0
>00421601    je          00421607
 00421603    xor         eax,eax
>00421605    jmp         00421609
 00421607    mov         al,1
 00421609    pop         esi
 0042160A    pop         ebx
 0042160B    mov         esp,ebp
 0042160D    pop         ebp
 0042160E    ret
*}
end;

//00421610
function IsDefaultVariantProp:Boolean;
begin
{*
 00421610    push        ebp
 00421611    mov         ebp,esp
 00421613    xor         ecx,ecx
 00421615    push        ecx
 00421616    push        ecx
 00421617    push        ecx
 00421618    push        ecx
 00421619    push        ecx
 0042161A    push        ecx
 0042161B    push        ecx
 0042161C    push        ecx
 0042161D    push        ebx
 0042161E    xor         eax,eax
 00421620    push        ebp
 00421621    push        421697
 00421626    push        dword ptr fs:[eax]
 00421629    mov         dword ptr fs:[eax],esp
 0042162C    lea         ecx,[ebp-10]
 0042162F    mov         eax,dword ptr [ebp+8]
 00421632    mov         edx,dword ptr [eax-8]
 00421635    mov         eax,dword ptr [ebp+8]
 00421638    mov         eax,dword ptr [eax-4]
 0042163B    call        GetVariantProp
 00421640    mov         eax,dword ptr [ebp+8]
 00421643    cmp         byte ptr [eax-9],0
>00421647    je          0042166C
 00421649    lea         ecx,[ebp-20]
 0042164C    mov         eax,dword ptr [ebp+8]
 0042164F    mov         edx,dword ptr [eax-8]
 00421652    mov         eax,dword ptr [ebp+8]
 00421655    mov         eax,dword ptr [eax-10]
 00421658    call        GetVariantProp
 0042165D    lea         edx,[ebp-20]
 00421660    lea         eax,[ebp-10]
 00421663    call        VarSameValue
 00421668    mov         ebx,eax
>0042166A    jmp         00421676
 0042166C    lea         eax,[ebp-10]
 0042166F    call        VarIsClear
 00421674    mov         ebx,eax
 00421676    xor         eax,eax
 00421678    pop         edx
 00421679    pop         ecx
 0042167A    pop         ecx
 0042167B    mov         dword ptr fs:[eax],edx
 0042167E    push        42169E
 00421683    lea         eax,[ebp-20]
 00421686    mov         edx,dword ptr ds:[4010C0];Variant
 0042168C    mov         ecx,2
 00421691    call        @FinalizeArray
 00421696    ret
>00421697    jmp         @HandleFinally
>0042169C    jmp         00421683
 0042169E    mov         eax,ebx
 004216A0    pop         ebx
 004216A1    mov         esp,ebp
 004216A3    pop         ebp
 004216A4    ret
*}
end;

//004216A8
function IsDefaultPropertyValue(Instance:TObject; PropInfo:PPropInfo; OnGetLookupInfo:TGetLookupInfoEvent):Boolean;
begin
{*
 004216A8    push        ebp
 004216A9    mov         ebp,esp
 004216AB    add         esp,0FFFFFFE4
 004216AE    push        ebx
 004216AF    mov         dword ptr [ebp-8],edx
 004216B2    mov         dword ptr [ebp-4],eax
 004216B5    xor         eax,eax
 004216B7    mov         dword ptr [ebp-10],eax
 004216BA    xor         eax,eax
 004216BC    mov         dword ptr [ebp-18],eax
 004216BF    xor         eax,eax
 004216C1    mov         dword ptr [ebp-1C],eax
 004216C4    xor         eax,eax
 004216C6    mov         dword ptr [ebp-14],eax
 004216C9    cmp         word ptr [ebp+0A],0
>004216CE    je          004216E4
 004216D0    lea         eax,[ebp-1C]
 004216D3    push        eax
 004216D4    lea         eax,[ebp-14]
 004216D7    push        eax
 004216D8    lea         ecx,[ebp-18]
 004216DB    lea         edx,[ebp-10]
 004216DE    mov         eax,dword ptr [ebp+0C]
 004216E1    call        dword ptr [ebp+8]
 004216E4    mov         ecx,dword ptr [ebp-14]
 004216E7    mov         edx,dword ptr [ebp-18]
 004216EA    mov         eax,dword ptr [ebp-10]
 004216ED    call        AncestorIsValid
 004216F2    mov         byte ptr [ebp-9],al
 004216F5    mov         bl,1
 004216F7    mov         eax,dword ptr [ebp-8]
 004216FA    cmp         dword ptr [eax+4],0
>004216FE    je          00421804
 00421704    mov         eax,dword ptr [ebp-8]
 00421707    cmp         dword ptr [eax+8],0
>0042170B    jne         00421750
 0042170D    mov         eax,dword ptr [ebp-8]
 00421710    mov         eax,dword ptr [eax]
 00421712    mov         eax,dword ptr [eax]
 00421714    cmp         byte ptr [eax],7
>00421717    jne         00421804
 0042171D    mov         edx,dword ptr [ebp-8]
 00421720    mov         eax,dword ptr [ebp-4]
 00421723    call        GetOrdProp
 00421728    mov         edx,dword ptr ds:[418C6C];TComponent
 0042172E    call        @IsClass
 00421733    test        al,al
>00421735    je          00421804
 0042173B    mov         edx,dword ptr [ebp-8]
 0042173E    mov         eax,dword ptr [ebp-4]
 00421741    call        GetOrdProp
 00421746    test        byte ptr [eax+24],4
>0042174A    je          00421804
 00421750    mov         eax,dword ptr [ebp-8]
 00421753    mov         eax,dword ptr [eax]
 00421755    mov         eax,dword ptr [eax]
 00421757    movzx       eax,byte ptr [eax]
 0042175A    cmp         eax,10
>0042175D    ja          00421804
 00421763    jmp         dword ptr [eax*4+42176A]
 00421763    dd          00421804
 00421763    dd          004217AE
 00421763    dd          004217AE
 00421763    dd          004217AE
 00421763    dd          004217B9
 00421763    dd          004217C4
 00421763    dd          004217AE
 00421763    dd          004217CF
 00421763    dd          004217DA
 00421763    dd          00421804
 00421763    dd          004217C4
 00421763    dd          004217C4
 00421763    dd          004217E5
 00421763    dd          00421804
 00421763    dd          00421804
 00421763    dd          004217FB
 00421763    dd          004217F0
 004217AE    push        ebp
 004217AF    call        IsDefaultOrdProp
 004217B4    pop         ecx
 004217B5    mov         ebx,eax
>004217B7    jmp         00421804
 004217B9    push        ebp
 004217BA    call        IsDefaultFloatProp
 004217BF    pop         ecx
 004217C0    mov         ebx,eax
>004217C2    jmp         00421804
 004217C4    push        ebp
 004217C5    call        IsDefaultStrProp
 004217CA    pop         ecx
 004217CB    mov         ebx,eax
>004217CD    jmp         00421804
 004217CF    push        ebp
 004217D0    call        IsDefaultObjectProp
 004217D5    pop         ecx
 004217D6    mov         ebx,eax
>004217D8    jmp         00421804
 004217DA    push        ebp
 004217DB    call        IsDefaultMethodProp
 004217E0    pop         ecx
 004217E1    mov         ebx,eax
>004217E3    jmp         00421804
 004217E5    push        ebp
 004217E6    call        IsDefaultVariantProp
 004217EB    pop         ecx
 004217EC    mov         ebx,eax
>004217EE    jmp         00421804
 004217F0    push        ebp
 004217F1    call        IsDefaultInt64Prop
 004217F6    pop         ecx
 004217F7    mov         ebx,eax
>004217F9    jmp         00421804
 004217FB    push        ebp
 004217FC    call        IsDefaultInterfaceProp
 00421801    pop         ecx
 00421802    mov         ebx,eax
 00421804    mov         eax,ebx
 00421806    pop         ebx
 00421807    mov         esp,ebp
 00421809    pop         ebp
 0042180A    ret         8
*}
end;

//00421810
procedure WritePropPath;
begin
{*
 00421810    push        ebp
 00421811    mov         ebp,esp
 00421813    push        0
 00421815    xor         eax,eax
 00421817    push        ebp
 00421818    push        421858
 0042181D    push        dword ptr fs:[eax]
 00421820    mov         dword ptr fs:[eax],esp
 00421823    lea         eax,[ebp-4]
 00421826    mov         edx,dword ptr [ebp+8]
 00421829    mov         edx,dword ptr [edx-8]
 0042182C    add         edx,1A
 0042182F    call        @LStrFromString
 00421834    mov         edx,dword ptr [ebp-4]
 00421837    mov         eax,dword ptr [ebp+8]
 0042183A    mov         eax,dword ptr [eax-4]
 0042183D    call        TWriter.WritePropName
 00421842    xor         eax,eax
 00421844    pop         edx
 00421845    pop         ecx
 00421846    pop         ecx
 00421847    mov         dword ptr fs:[eax],edx
 0042184A    push        42185F
 0042184F    lea         eax,[ebp-4]
 00421852    call        @LStrClr
 00421857    ret
>00421858    jmp         @HandleFinally
>0042185D    jmp         0042184F
 0042185F    pop         ecx
 00421860    pop         ebp
 00421861    ret
*}
end;

//00421864
procedure WriteSet(Value:Longint);
begin
{*
 00421864    push        ebp
 00421865    mov         ebp,esp
 00421867    push        0
 00421869    push        ebx
 0042186A    push        esi
 0042186B    push        edi
 0042186C    mov         esi,eax
 0042186E    xor         eax,eax
 00421870    push        ebp
 00421871    push        4218EA
 00421876    push        dword ptr fs:[eax]
 00421879    mov         dword ptr fs:[eax],esp
 0042187C    mov         eax,dword ptr [ebp+8]
 0042187F    mov         eax,dword ptr [eax-0C]
 00421882    call        GetTypeData
 00421887    mov         eax,dword ptr [eax+1]
 0042188A    mov         edi,dword ptr [eax]
 0042188C    mov         eax,dword ptr [ebp+8]
 0042188F    mov         eax,dword ptr [eax-4]
 00421892    mov         dl,0B
 00421894    call        TWriter.WriteValue
 00421899    xor         ebx,ebx
 0042189B    mov         eax,ebx
 0042189D    cmp         eax,1F
>004218A0    ja          004218A5
 004218A2    bt          esi,eax
>004218A5    jae         004218C1
 004218A7    lea         ecx,[ebp-4]
 004218AA    mov         edx,ebx
 004218AC    mov         eax,edi
 004218AE    call        GetEnumName
 004218B3    mov         edx,dword ptr [ebp-4]
 004218B6    mov         eax,dword ptr [ebp+8]
 004218B9    mov         eax,dword ptr [eax-4]
 004218BC    call        TWriter.WriteStr
 004218C1    inc         ebx
 004218C2    cmp         ebx,20
>004218C5    jne         0042189B
 004218C7    mov         eax,dword ptr [ebp+8]
 004218CA    mov         eax,dword ptr [eax-4]
 004218CD    xor         edx,edx
 004218CF    call        TWriter.WriteStr
 004218D4    xor         eax,eax
 004218D6    pop         edx
 004218D7    pop         ecx
 004218D8    pop         ecx
 004218D9    mov         dword ptr fs:[eax],edx
 004218DC    push        4218F1
 004218E1    lea         eax,[ebp-4]
 004218E4    call        @LStrClr
 004218E9    ret
>004218EA    jmp         @HandleFinally
>004218EF    jmp         004218E1
 004218F1    pop         edi
 004218F2    pop         esi
 004218F3    pop         ebx
 004218F4    pop         ecx
 004218F5    pop         ebp
 004218F6    ret
*}
end;

//004218F8
procedure WriteIntProp(IntType:PTypeInfo; Value:Longint);
begin
{*
 004218F8    push        ebp
 004218F9    mov         ebp,esp
 004218FB    push        0
 004218FD    push        ebx
 004218FE    push        esi
 004218FF    mov         esi,edx
 00421901    xor         edx,edx
 00421903    push        ebp
 00421904    push        421958
 00421909    push        dword ptr fs:[edx]
 0042190C    mov         dword ptr fs:[edx],esp
 0042190F    call        FindIntToIdent
 00421914    mov         ebx,eax
 00421916    test        ebx,ebx
>00421918    je          00421935
 0042191A    lea         edx,[ebp-4]
 0042191D    mov         eax,esi
 0042191F    call        ebx
 00421921    test        al,al
>00421923    je          00421935
 00421925    mov         eax,dword ptr [ebp+8]
 00421928    mov         eax,dword ptr [eax-4]
 0042192B    mov         edx,dword ptr [ebp-4]
 0042192E    call        TWriter.WriteIdent
>00421933    jmp         00421942
 00421935    mov         eax,dword ptr [ebp+8]
 00421938    mov         eax,dword ptr [eax-4]
 0042193B    mov         edx,esi
 0042193D    call        TWriter.WriteInteger
 00421942    xor         eax,eax
 00421944    pop         edx
 00421945    pop         ecx
 00421946    pop         ecx
 00421947    mov         dword ptr fs:[eax],edx
 0042194A    push        42195F
 0042194F    lea         eax,[ebp-4]
 00421952    call        @LStrClr
 00421957    ret
>00421958    jmp         @HandleFinally
>0042195D    jmp         0042194F
 0042195F    pop         esi
 00421960    pop         ebx
 00421961    pop         ecx
 00421962    pop         ebp
 00421963    ret
*}
end;

//00421964
procedure WriteCollectionProp(Collection:TCollection);
begin
{*
 00421964    push        ebp
 00421965    mov         ebp,esp
 00421967    push        0
 00421969    push        ebx
 0042196A    mov         ebx,eax
 0042196C    xor         eax,eax
 0042196E    push        ebp
 0042196F    push        4219FA
 00421974    push        dword ptr fs:[eax]
 00421977    mov         dword ptr fs:[eax],esp
 0042197A    mov         eax,dword ptr [ebp+8]
 0042197D    push        eax
 0042197E    call        WritePropPath
 00421983    pop         ecx
 00421984    lea         eax,[ebp-4]
 00421987    mov         edx,dword ptr [ebp+8]
 0042198A    mov         edx,dword ptr [edx-4]
 0042198D    mov         edx,dword ptr [edx+2C]
 00421990    call        @LStrLAsg
 00421995    xor         eax,eax
 00421997    push        ebp
 00421998    push        4219DD
 0042199D    push        dword ptr fs:[eax]
 004219A0    mov         dword ptr fs:[eax],esp
 004219A3    mov         eax,dword ptr [ebp+8]
 004219A6    mov         eax,dword ptr [eax-4]
 004219A9    add         eax,2C
 004219AC    call        @LStrClr
 004219B1    mov         eax,dword ptr [ebp+8]
 004219B4    mov         eax,dword ptr [eax-4]
 004219B7    mov         edx,ebx
 004219B9    call        TWriter.WriteCollection
 004219BE    xor         eax,eax
 004219C0    pop         edx
 004219C1    pop         ecx
 004219C2    pop         ecx
 004219C3    mov         dword ptr fs:[eax],edx
 004219C6    push        4219E4
 004219CB    mov         eax,dword ptr [ebp+8]
 004219CE    mov         eax,dword ptr [eax-4]
 004219D1    add         eax,2C
 004219D4    mov         edx,dword ptr [ebp-4]
 004219D7    call        @LStrAsg
 004219DC    ret
>004219DD    jmp         @HandleFinally
>004219E2    jmp         004219CB
 004219E4    xor         eax,eax
 004219E6    pop         edx
 004219E7    pop         ecx
 004219E8    pop         ecx
 004219E9    mov         dword ptr fs:[eax],edx
 004219EC    push        421A01
 004219F1    lea         eax,[ebp-4]
 004219F4    call        @LStrClr
 004219F9    ret
>004219FA    jmp         @HandleFinally
>004219FF    jmp         004219F1
 00421A01    pop         ebx
 00421A02    pop         ecx
 00421A03    pop         ebp
 00421A04    ret
*}
end;

//00421A08
procedure WriteOrdProp;
begin
{*
 00421A08    push        ebp
 00421A09    mov         ebp,esp
 00421A0B    push        0
 00421A0D    push        ebx
 00421A0E    xor         eax,eax
 00421A10    push        ebp
 00421A11    push        421ABC
 00421A16    push        dword ptr fs:[eax]
 00421A19    mov         dword ptr fs:[eax],esp
 00421A1C    mov         eax,dword ptr [ebp+8]
 00421A1F    mov         edx,dword ptr [eax-8]
 00421A22    mov         eax,dword ptr [ebp+8]
 00421A25    mov         eax,dword ptr [eax-10]
 00421A28    call        GetOrdProp
 00421A2D    mov         ebx,eax
 00421A2F    mov         eax,dword ptr [ebp+8]
 00421A32    push        eax
 00421A33    call        WritePropPath
 00421A38    pop         ecx
 00421A39    mov         eax,dword ptr [ebp+8]
 00421A3C    mov         eax,dword ptr [eax-0C]
 00421A3F    mov         al,byte ptr [eax]
 00421A41    dec         al
>00421A43    je          00421A53
 00421A45    dec         al
>00421A47    je          00421A6B
 00421A49    dec         al
>00421A4B    je          00421A88
 00421A4D    sub         al,3
>00421A4F    je          00421A7A
>00421A51    jmp         00421AA6
 00421A53    mov         eax,dword ptr [ebp+8]
 00421A56    push        eax
 00421A57    mov         eax,dword ptr [ebp+8]
 00421A5A    mov         eax,dword ptr [eax-8]
 00421A5D    mov         eax,dword ptr [eax]
 00421A5F    mov         eax,dword ptr [eax]
 00421A61    mov         edx,ebx
 00421A63    call        WriteIntProp
 00421A68    pop         ecx
>00421A69    jmp         00421AA6
 00421A6B    mov         edx,ebx
 00421A6D    mov         eax,dword ptr [ebp+8]
 00421A70    mov         eax,dword ptr [eax-4]
 00421A73    call        TWriter.WriteChar
>00421A78    jmp         00421AA6
 00421A7A    mov         eax,dword ptr [ebp+8]
 00421A7D    push        eax
 00421A7E    mov         eax,ebx
 00421A80    call        WriteSet
 00421A85    pop         ecx
>00421A86    jmp         00421AA6
 00421A88    lea         ecx,[ebp-4]
 00421A8B    mov         eax,dword ptr [ebp+8]
 00421A8E    mov         eax,dword ptr [eax-0C]
 00421A91    mov         edx,ebx
 00421A93    call        GetEnumName
 00421A98    mov         edx,dword ptr [ebp-4]
 00421A9B    mov         eax,dword ptr [ebp+8]
 00421A9E    mov         eax,dword ptr [eax-4]
 00421AA1    call        TWriter.WriteIdent
 00421AA6    xor         eax,eax
 00421AA8    pop         edx
 00421AA9    pop         ecx
 00421AAA    pop         ecx
 00421AAB    mov         dword ptr fs:[eax],edx
 00421AAE    push        421AC3
 00421AB3    lea         eax,[ebp-4]
 00421AB6    call        @LStrClr
 00421ABB    ret
>00421ABC    jmp         @HandleFinally
>00421AC1    jmp         00421AB3
 00421AC3    pop         ebx
 00421AC4    pop         ecx
 00421AC5    pop         ebp
 00421AC6    ret
*}
end;

//00421AC8
procedure WriteFloatProp;
begin
{*
 00421AC8    push        ebp
 00421AC9    mov         ebp,esp
 00421ACB    add         esp,0FFFFFFF0
 00421ACE    mov         eax,dword ptr [ebp+8]
 00421AD1    mov         edx,dword ptr [eax-8]
 00421AD4    mov         eax,dword ptr [ebp+8]
 00421AD7    mov         eax,dword ptr [eax-10]
 00421ADA    call        GetFloatProp
 00421ADF    fstp        tbyte ptr [ebp-10]
 00421AE2    wait
 00421AE3    mov         eax,dword ptr [ebp+8]
 00421AE6    push        eax
 00421AE7    call        WritePropPath
 00421AEC    pop         ecx
 00421AED    mov         ax,word ptr [ebp-8]
 00421AF1    push        eax
 00421AF2    push        dword ptr [ebp-0C]
 00421AF5    push        dword ptr [ebp-10]
 00421AF8    mov         eax,dword ptr [ebp+8]
 00421AFB    mov         eax,dword ptr [eax-4]
 00421AFE    call        TWriter.WriteFloat
 00421B03    mov         esp,ebp
 00421B05    pop         ebp
 00421B06    ret
*}
end;

//00421B08
procedure WriteInt64Prop;
begin
{*
 00421B08    push        ebp
 00421B09    mov         ebp,esp
 00421B0B    add         esp,0FFFFFFF8
 00421B0E    mov         eax,dword ptr [ebp+8]
 00421B11    mov         edx,dword ptr [eax-8]
 00421B14    mov         eax,dword ptr [ebp+8]
 00421B17    mov         eax,dword ptr [eax-10]
 00421B1A    call        GetInt64Prop
 00421B1F    mov         dword ptr [ebp-8],eax
 00421B22    mov         dword ptr [ebp-4],edx
 00421B25    mov         eax,dword ptr [ebp+8]
 00421B28    push        eax
 00421B29    call        WritePropPath
 00421B2E    pop         ecx
 00421B2F    push        dword ptr [ebp-4]
 00421B32    push        dword ptr [ebp-8]
 00421B35    mov         eax,dword ptr [ebp+8]
 00421B38    mov         eax,dword ptr [eax-4]
 00421B3B    call        TWriter.WriteInteger
 00421B40    pop         ecx
 00421B41    pop         ecx
 00421B42    pop         ebp
 00421B43    ret
*}
end;

//00421B44
procedure WriteStrProp;
begin
{*
 00421B44    push        ebp
 00421B45    mov         ebp,esp
 00421B47    push        0
 00421B49    xor         eax,eax
 00421B4B    push        ebp
 00421B4C    push        421B99
 00421B51    push        dword ptr fs:[eax]
 00421B54    mov         dword ptr fs:[eax],esp
 00421B57    lea         ecx,[ebp-4]
 00421B5A    mov         eax,dword ptr [ebp+8]
 00421B5D    mov         edx,dword ptr [eax-8]
 00421B60    mov         eax,dword ptr [ebp+8]
 00421B63    mov         eax,dword ptr [eax-10]
 00421B66    call        GetWideStrProp
 00421B6B    mov         eax,dword ptr [ebp+8]
 00421B6E    push        eax
 00421B6F    call        WritePropPath
 00421B74    pop         ecx
 00421B75    mov         eax,dword ptr [ebp+8]
 00421B78    mov         eax,dword ptr [eax-4]
 00421B7B    mov         edx,dword ptr [ebp-4]
 00421B7E    call        TWriter.WriteWideString
 00421B83    xor         eax,eax
 00421B85    pop         edx
 00421B86    pop         ecx
 00421B87    pop         ecx
 00421B88    mov         dword ptr fs:[eax],edx
 00421B8B    push        421BA0
 00421B90    lea         eax,[ebp-4]
 00421B93    call        @WStrClr
 00421B98    ret
>00421B99    jmp         @HandleFinally
>00421B9E    jmp         00421B90
 00421BA0    pop         ecx
 00421BA1    pop         ebp
 00421BA2    ret
*}
end;

//00421BA4
function OwnedBy(Component:TComponent; Owner:TComponent):Boolean;
begin
{*
 00421BA4    mov         cl,1
 00421BA6    test        eax,eax
>00421BA8    je          00421BB5
 00421BAA    cmp         edx,eax
>00421BAC    je          00421BB7
 00421BAE    mov         eax,dword ptr [eax+4]
 00421BB1    test        eax,eax
>00421BB3    jne         00421BAA
 00421BB5    xor         ecx,ecx
 00421BB7    mov         eax,ecx
 00421BB9    ret
*}
end;

//00421BBC
function GetComponentValue(Component:TComponent):AnsiString;
begin
{*
 00421BBC    push        ebp
 00421BBD    mov         ebp,esp
 00421BBF    push        0
 00421BC1    push        ebx
 00421BC2    push        esi
 00421BC3    push        edi
 00421BC4    mov         esi,edx
 00421BC6    mov         ebx,eax
 00421BC8    xor         eax,eax
 00421BCA    push        ebp
 00421BCB    push        421CAB
 00421BD0    push        dword ptr fs:[eax]
 00421BD3    mov         dword ptr fs:[eax],esp
 00421BD6    mov         eax,dword ptr [ebp+8]
 00421BD9    mov         eax,dword ptr [eax-4]
 00421BDC    mov         eax,dword ptr [eax+1C]
 00421BDF    cmp         eax,dword ptr [ebx+4]
>00421BE2    jne         00421BF3
 00421BE4    mov         eax,esi
 00421BE6    mov         edx,dword ptr [ebx+8]
 00421BE9    call        @LStrAsg
>00421BEE    jmp         00421C95
 00421BF3    mov         edx,dword ptr [ebp+8]
 00421BF6    cmp         eax,ebx
>00421BF8    jne         00421C0B
 00421BFA    mov         eax,esi
 00421BFC    mov         edx,421CC0;'Owner'
 00421C01    call        @LStrAsg
>00421C06    jmp         00421C95
 00421C0B    mov         edi,dword ptr [ebx+4]
 00421C0E    test        edi,edi
>00421C10    je          00421C77
 00421C12    cmp         dword ptr [edi+8],0
>00421C16    je          00421C77
 00421C18    cmp         dword ptr [ebx+8],0
>00421C1C    je          00421C77
 00421C1E    mov         eax,dword ptr [ebp+8]
 00421C21    mov         eax,dword ptr [eax-4]
 00421C24    mov         edx,dword ptr [eax+1C]
 00421C27    mov         eax,edi
 00421C29    call        OwnedBy
 00421C2E    test        al,al
>00421C30    je          00421C5B
 00421C32    mov         eax,dword ptr [ebp+8]
 00421C35    push        eax
 00421C36    lea         edx,[ebp-4]
 00421C39    mov         eax,dword ptr [ebx+4]
 00421C3C    call        GetComponentValue
 00421C41    pop         ecx
 00421C42    push        dword ptr [ebp-4]
 00421C45    push        421CD0;'.'
 00421C4A    push        dword ptr [ebx+8]
 00421C4D    mov         eax,esi
 00421C4F    mov         edx,3
 00421C54    call        @LStrCatN
>00421C59    jmp         00421C95
 00421C5B    mov         eax,dword ptr [ebx+4]
 00421C5E    push        dword ptr [eax+8]
 00421C61    push        421CD0;'.'
 00421C66    push        dword ptr [ebx+8]
 00421C69    mov         eax,esi
 00421C6B    mov         edx,3
 00421C70    call        @LStrCatN
>00421C75    jmp         00421C95
 00421C77    cmp         dword ptr [ebx+8],0
>00421C7B    je          00421C8E
 00421C7D    mov         eax,esi
 00421C7F    mov         ecx,421CDC;'.Owner'
 00421C84    mov         edx,dword ptr [ebx+8]
 00421C87    call        @LStrCat3
>00421C8C    jmp         00421C95
 00421C8E    mov         eax,esi
 00421C90    call        @LStrClr
 00421C95    xor         eax,eax
 00421C97    pop         edx
 00421C98    pop         ecx
 00421C99    pop         ecx
 00421C9A    mov         dword ptr fs:[eax],edx
 00421C9D    push        421CB2
 00421CA2    lea         eax,[ebp-4]
 00421CA5    call        @LStrClr
 00421CAA    ret
>00421CAB    jmp         @HandleFinally
>00421CB0    jmp         00421CA2
 00421CB2    pop         edi
 00421CB3    pop         esi
 00421CB4    pop         ebx
 00421CB5    pop         ecx
 00421CB6    pop         ebp
 00421CB7    ret
*}
end;

//00421CE4
procedure WriteObjectProp;
begin
{*
 00421CE4    push        ebp
 00421CE5    mov         ebp,esp
 00421CE7    xor         ecx,ecx
 00421CE9    push        ecx
 00421CEA    push        ecx
 00421CEB    push        ecx
 00421CEC    push        ecx
 00421CED    push        ecx
 00421CEE    xor         eax,eax
 00421CF0    push        ebp
 00421CF1    push        421ED8
 00421CF6    push        dword ptr fs:[eax]
 00421CF9    mov         dword ptr fs:[eax],esp
 00421CFC    mov         eax,dword ptr [ebp+8]
 00421CFF    mov         edx,dword ptr [eax-8]
 00421D02    mov         eax,dword ptr [ebp+8]
 00421D05    mov         eax,dword ptr [eax-10]
 00421D08    call        GetOrdProp
 00421D0D    mov         dword ptr [ebp-4],eax
 00421D10    cmp         dword ptr [ebp-4],0
>00421D14    jne         00421D32
 00421D16    mov         eax,dword ptr [ebp+8]
 00421D19    push        eax
 00421D1A    call        WritePropPath
 00421D1F    pop         ecx
 00421D20    mov         eax,dword ptr [ebp+8]
 00421D23    mov         eax,dword ptr [eax-4]
 00421D26    mov         dl,0D
 00421D28    call        TWriter.WriteValue
>00421D2D    jmp         00421EBD
 00421D32    mov         eax,dword ptr [ebp-4]
 00421D35    mov         edx,dword ptr ds:[417DFC];TPersistent
 00421D3B    call        @IsClass
 00421D40    test        al,al
>00421D42    je          00421EBD
 00421D48    mov         eax,dword ptr [ebp-4]
 00421D4B    mov         edx,dword ptr ds:[418C6C];TComponent
 00421D51    call        @IsClass
 00421D56    test        al,al
>00421D58    je          00421D9A
 00421D5A    mov         eax,dword ptr [ebp-4]
 00421D5D    test        byte ptr [eax+24],4
>00421D61    jne         00421D9A
 00421D63    mov         eax,dword ptr [ebp+8]
 00421D66    push        eax
 00421D67    lea         edx,[ebp-10]
 00421D6A    mov         eax,dword ptr [ebp-4]
 00421D6D    call        GetComponentValue
 00421D72    pop         ecx
 00421D73    cmp         dword ptr [ebp-10],0
>00421D77    je          00421EBD
 00421D7D    mov         eax,dword ptr [ebp+8]
 00421D80    push        eax
 00421D81    call        WritePropPath
 00421D86    pop         ecx
 00421D87    mov         eax,dword ptr [ebp+8]
 00421D8A    mov         eax,dword ptr [eax-4]
 00421D8D    mov         edx,dword ptr [ebp-10]
 00421D90    call        TWriter.WriteIdent
>00421D95    jmp         00421EBD
 00421D9A    mov         eax,dword ptr [ebp+8]
 00421D9D    mov         eax,dword ptr [eax-4]
 00421DA0    mov         eax,dword ptr [eax+20]
 00421DA3    mov         dword ptr [ebp-8],eax
 00421DA6    lea         eax,[ebp-0C]
 00421DA9    mov         edx,dword ptr [ebp+8]
 00421DAC    mov         edx,dword ptr [edx-4]
 00421DAF    mov         edx,dword ptr [edx+2C]
 00421DB2    call        @LStrLAsg
 00421DB7    xor         eax,eax
 00421DB9    push        ebp
 00421DBA    push        421E59
 00421DBF    push        dword ptr fs:[eax]
 00421DC2    mov         dword ptr fs:[eax],esp
 00421DC5    mov         eax,dword ptr [ebp+8]
 00421DC8    mov         eax,dword ptr [eax-4]
 00421DCB    push        dword ptr [eax+2C]
 00421DCE    lea         eax,[ebp-14]
 00421DD1    mov         edx,dword ptr [ebp+8]
 00421DD4    mov         edx,dword ptr [edx-8]
 00421DD7    add         edx,1A
 00421DDA    call        @LStrFromString
 00421DDF    push        dword ptr [ebp-14]
 00421DE2    push        421EEC;'.'
 00421DE7    mov         eax,dword ptr [ebp+8]
 00421DEA    mov         eax,dword ptr [eax-4]
 00421DED    add         eax,2C
 00421DF0    mov         edx,3
 00421DF5    call        @LStrCatN
 00421DFA    mov         eax,dword ptr [ebp+8]
 00421DFD    cmp         byte ptr [eax-11],0
>00421E01    je          00421E20
 00421E03    mov         eax,dword ptr [ebp+8]
 00421E06    mov         edx,dword ptr [eax-8]
 00421E09    mov         eax,dword ptr [ebp+8]
 00421E0C    mov         eax,dword ptr [eax-4]
 00421E0F    mov         eax,dword ptr [eax+20]
 00421E12    call        GetOrdProp
 00421E17    mov         edx,dword ptr [ebp+8]
 00421E1A    mov         edx,dword ptr [edx-4]
 00421E1D    mov         dword ptr [edx+20],eax
 00421E20    mov         eax,dword ptr [ebp+8]
 00421E23    mov         eax,dword ptr [eax-4]
 00421E26    mov         edx,dword ptr [ebp-4]
 00421E29    call        TWriter.WriteProperties
 00421E2E    xor         eax,eax
 00421E30    pop         edx
 00421E31    pop         ecx
 00421E32    pop         ecx
 00421E33    mov         dword ptr fs:[eax],edx
 00421E36    push        421E60
 00421E3B    mov         eax,dword ptr [ebp+8]
 00421E3E    mov         eax,dword ptr [eax-4]
 00421E41    mov         edx,dword ptr [ebp-8]
 00421E44    mov         dword ptr [eax+20],edx
 00421E47    mov         eax,dword ptr [ebp+8]
 00421E4A    mov         eax,dword ptr [eax-4]
 00421E4D    add         eax,2C
 00421E50    mov         edx,dword ptr [ebp-0C]
 00421E53    call        @LStrAsg
 00421E58    ret
>00421E59    jmp         @HandleFinally
>00421E5E    jmp         00421E3B
 00421E60    mov         eax,dword ptr [ebp-4]
 00421E63    mov         edx,dword ptr ds:[418058];TCollection
 00421E69    call        @IsClass
 00421E6E    test        al,al
>00421E70    je          00421EBD
 00421E72    mov         eax,dword ptr [ebp+8]
 00421E75    cmp         byte ptr [eax-11],0
>00421E79    je          00421EB0
 00421E7B    mov         eax,dword ptr [ebp+8]
 00421E7E    mov         eax,dword ptr [eax-4]
 00421E81    mov         eax,dword ptr [eax+28]
 00421E84    push        eax
 00421E85    mov         eax,dword ptr [ebp+8]
 00421E88    mov         edx,dword ptr [eax-8]
 00421E8B    mov         eax,dword ptr [ebp+8]
 00421E8E    mov         eax,dword ptr [eax-4]
 00421E91    mov         eax,dword ptr [eax+20]
 00421E94    call        GetOrdProp
 00421E99    mov         edx,eax
 00421E9B    mov         eax,dword ptr [ebp+8]
 00421E9E    mov         eax,dword ptr [eax-4]
 00421EA1    mov         ecx,dword ptr [eax+1C]
 00421EA4    mov         eax,dword ptr [ebp-4]
 00421EA7    call        CollectionsEqual
 00421EAC    test        al,al
>00421EAE    jne         00421EBD
 00421EB0    mov         eax,dword ptr [ebp+8]
 00421EB3    push        eax
 00421EB4    mov         eax,dword ptr [ebp-4]
 00421EB7    call        WriteCollectionProp
 00421EBC    pop         ecx
 00421EBD    xor         eax,eax
 00421EBF    pop         edx
 00421EC0    pop         ecx
 00421EC1    pop         ecx
 00421EC2    mov         dword ptr fs:[eax],edx
 00421EC5    push        421EDF
 00421ECA    lea         eax,[ebp-14]
 00421ECD    mov         edx,3
 00421ED2    call        @LStrArrayClr
 00421ED7    ret
>00421ED8    jmp         @HandleFinally
>00421EDD    jmp         00421ECA
 00421EDF    mov         esp,ebp
 00421EE1    pop         ebp
 00421EE2    ret
*}
end;

//00421EF0
procedure WriteInterfaceProp;
begin
{*
 00421EF0    push        ebp
 00421EF1    mov         ebp,esp
 00421EF3    push        0
 00421EF5    push        0
 00421EF7    push        0
 00421EF9    push        ebx
 00421EFA    xor         eax,eax
 00421EFC    push        ebp
 00421EFD    push        421FAD
 00421F02    push        dword ptr fs:[eax]
 00421F05    mov         dword ptr fs:[eax],esp
 00421F08    lea         ecx,[ebp-4]
 00421F0B    mov         eax,dword ptr [ebp+8]
 00421F0E    mov         edx,dword ptr [eax-8]
 00421F11    mov         eax,dword ptr [ebp+8]
 00421F14    mov         eax,dword ptr [eax-10]
 00421F17    call        GetInterfaceProp
 00421F1C    cmp         dword ptr [ebp-4],0
>00421F20    jne         00421F3B
 00421F22    mov         eax,dword ptr [ebp+8]
 00421F25    push        eax
 00421F26    call        WritePropPath
 00421F2B    pop         ecx
 00421F2C    mov         eax,dword ptr [ebp+8]
 00421F2F    mov         eax,dword ptr [eax-4]
 00421F32    mov         dl,0D
 00421F34    call        TWriter.WriteValue
>00421F39    jmp         00421F87
 00421F3B    lea         eax,[ebp-8]
 00421F3E    call        @IntfClear
 00421F43    mov         ecx,eax
 00421F45    mov         edx,421FBC
 00421F4A    mov         eax,dword ptr [ebp-4]
 00421F4D    call        Supports
 00421F52    test        al,al
>00421F54    je          00421F87
 00421F56    mov         eax,dword ptr [ebp-8]
 00421F59    mov         edx,dword ptr [eax]
 00421F5B    call        dword ptr [edx+0C]
 00421F5E    mov         ebx,eax
 00421F60    mov         eax,dword ptr [ebp+8]
 00421F63    push        eax
 00421F64    lea         edx,[ebp-0C]
 00421F67    mov         eax,ebx
 00421F69    call        GetComponentValue
 00421F6E    pop         ecx
 00421F6F    mov         eax,dword ptr [ebp+8]
 00421F72    push        eax
 00421F73    call        WritePropPath
 00421F78    pop         ecx
 00421F79    mov         eax,dword ptr [ebp+8]
 00421F7C    mov         eax,dword ptr [eax-4]
 00421F7F    mov         edx,dword ptr [ebp-0C]
 00421F82    call        TWriter.WriteIdent
 00421F87    xor         eax,eax
 00421F89    pop         edx
 00421F8A    pop         ecx
 00421F8B    pop         ecx
 00421F8C    mov         dword ptr fs:[eax],edx
 00421F8F    push        421FB4
 00421F94    lea         eax,[ebp-0C]
 00421F97    call        @LStrClr
 00421F9C    lea         eax,[ebp-8]
 00421F9F    call        @IntfClear
 00421FA4    lea         eax,[ebp-4]
 00421FA7    call        @IntfClear
 00421FAC    ret
>00421FAD    jmp         @HandleFinally
>00421FB2    jmp         00421F94
 00421FB4    pop         ebx
 00421FB5    mov         esp,ebp
 00421FB7    pop         ebp
 00421FB8    ret
*}
end;

//00421FCC
procedure WriteMethodProp;
begin
{*
 00421FCC    push        ebp
 00421FCD    mov         ebp,esp
 00421FCF    add         esp,0FFFFFEF4
 00421FD5    push        ebx
 00421FD6    xor         eax,eax
 00421FD8    mov         dword ptr [ebp-0C],eax
 00421FDB    xor         eax,eax
 00421FDD    push        ebp
 00421FDE    push        422067
 00421FE3    push        dword ptr fs:[eax]
 00421FE6    mov         dword ptr fs:[eax],esp
 00421FE9    lea         ecx,[ebp-8]
 00421FEC    mov         eax,dword ptr [ebp+8]
 00421FEF    mov         edx,dword ptr [eax-8]
 00421FF2    mov         eax,dword ptr [ebp+8]
 00421FF5    mov         eax,dword ptr [eax-10]
 00421FF8    call        GetMethodProp
 00421FFD    mov         eax,dword ptr [ebp+8]
 00422000    push        eax
 00422001    call        WritePropPath
 00422006    pop         ecx
 00422007    mov         ebx,dword ptr [ebp-8]
 0042200A    test        ebx,ebx
>0042200C    jne         0042201D
 0042200E    mov         eax,dword ptr [ebp+8]
 00422011    mov         eax,dword ptr [eax-4]
 00422014    mov         dl,0D
 00422016    call        TWriter.WriteValue
>0042201B    jmp         00422051
 0042201D    lea         ecx,[ebp-10C]
 00422023    mov         eax,dword ptr [ebp+8]
 00422026    mov         eax,dword ptr [eax-4]
 00422029    mov         eax,dword ptr [eax+1C]
 0042202C    mov         eax,dword ptr [eax]
 0042202E    mov         edx,ebx
 00422030    call        TObject.MethodName
 00422035    lea         edx,[ebp-10C]
 0042203B    lea         eax,[ebp-0C]
 0042203E    call        @LStrFromString
 00422043    mov         edx,dword ptr [ebp-0C]
 00422046    mov         eax,dword ptr [ebp+8]
 00422049    mov         eax,dword ptr [eax-4]
 0042204C    call        TWriter.WriteIdent
 00422051    xor         eax,eax
 00422053    pop         edx
 00422054    pop         ecx
 00422055    pop         ecx
 00422056    mov         dword ptr fs:[eax],edx
 00422059    push        42206E
 0042205E    lea         eax,[ebp-0C]
 00422061    call        @LStrClr
 00422066    ret
>00422067    jmp         @HandleFinally
>0042206C    jmp         0042205E
 0042206E    pop         ebx
 0042206F    mov         esp,ebp
 00422071    pop         ebp
 00422072    ret
*}
end;

//00422074
procedure WriteVariantProp;
begin
{*
 00422074    push        ebp
 00422075    mov         ebp,esp
 00422077    xor         ecx,ecx
 00422079    push        ecx
 0042207A    push        ecx
 0042207B    push        ecx
 0042207C    push        ecx
 0042207D    xor         eax,eax
 0042207F    push        ebp
 00422080    push        4220CD
 00422085    push        dword ptr fs:[eax]
 00422088    mov         dword ptr fs:[eax],esp
 0042208B    lea         ecx,[ebp-10]
 0042208E    mov         eax,dword ptr [ebp+8]
 00422091    mov         edx,dword ptr [eax-8]
 00422094    mov         eax,dword ptr [ebp+8]
 00422097    mov         eax,dword ptr [eax-10]
 0042209A    call        GetVariantProp
 0042209F    mov         eax,dword ptr [ebp+8]
 004220A2    push        eax
 004220A3    call        WritePropPath
 004220A8    pop         ecx
 004220A9    lea         edx,[ebp-10]
 004220AC    mov         eax,dword ptr [ebp+8]
 004220AF    mov         eax,dword ptr [eax-4]
 004220B2    call        TWriter.WriteVariant
 004220B7    xor         eax,eax
 004220B9    pop         edx
 004220BA    pop         ecx
 004220BB    pop         ecx
 004220BC    mov         dword ptr fs:[eax],edx
 004220BF    push        4220D4
 004220C4    lea         eax,[ebp-10]
 004220C7    call        @VarClr
 004220CC    ret
>004220CD    jmp         @HandleFinally
>004220D2    jmp         004220C4
 004220D4    mov         esp,ebp
 004220D6    pop         ebp
 004220D7    ret
*}
end;

//004220D8
procedure TWriter.WriteProperty(Instance:TPersistent; PropInfo:PPropInfo);
begin
{*
 004220D8    push        ebp
 004220D9    mov         ebp,esp
 004220DB    add         esp,0FFFFFFEC
 004220DE    mov         dword ptr [ebp-8],ecx
 004220E1    mov         dword ptr [ebp-10],edx
 004220E4    mov         dword ptr [ebp-4],eax
 004220E7    mov         eax,dword ptr [ebp-8]
 004220EA    cmp         dword ptr [eax+4],0
>004220EE    je          00422220
 004220F4    mov         eax,dword ptr [ebp-8]
 004220F7    cmp         dword ptr [eax+8],0
>004220FB    jne         00422140
 004220FD    mov         eax,dword ptr [ebp-8]
 00422100    mov         eax,dword ptr [eax]
 00422102    mov         eax,dword ptr [eax]
 00422104    cmp         byte ptr [eax],7
>00422107    jne         00422220
 0042210D    mov         edx,dword ptr [ebp-8]
 00422110    mov         eax,dword ptr [ebp-10]
 00422113    call        GetOrdProp
 00422118    mov         edx,dword ptr ds:[418C6C];TComponent
 0042211E    call        @IsClass
 00422123    test        al,al
>00422125    je          00422220
 0042212B    mov         edx,dword ptr [ebp-8]
 0042212E    mov         eax,dword ptr [ebp-10]
 00422131    call        GetOrdProp
 00422136    test        byte ptr [eax+24],4
>0042213A    je          00422220
 00422140    mov         eax,dword ptr [ebp-4]
 00422143    push        eax
 00422144    push        422870;TWriter.GetLookupInfo
 00422149    mov         edx,dword ptr [ebp-8]
 0042214C    mov         eax,dword ptr [ebp-10]
 0042214F    call        IsDefaultPropertyValue
 00422154    test        al,al
>00422156    jne         00422220
 0042215C    mov         eax,dword ptr [ebp-4]
 0042215F    mov         ecx,dword ptr [eax+28]
 00422162    mov         eax,dword ptr [ebp-4]
 00422165    mov         edx,dword ptr [eax+18]
 00422168    mov         eax,dword ptr [ebp-4]
 0042216B    mov         eax,dword ptr [eax+20]
 0042216E    call        AncestorIsValid
 00422173    mov         byte ptr [ebp-11],al
 00422176    mov         eax,dword ptr [ebp-8]
 00422179    mov         eax,dword ptr [eax]
 0042217B    mov         eax,dword ptr [eax]
 0042217D    mov         dword ptr [ebp-0C],eax
 00422180    mov         eax,dword ptr [ebp-0C]
 00422183    movzx       eax,byte ptr [eax]
 00422186    cmp         eax,10
>00422189    ja          00422220
 0042218F    jmp         dword ptr [eax*4+422196]
 0042218F    dd          00422220
 0042218F    dd          004221DA
 0042218F    dd          004221DA
 0042218F    dd          004221DA
 0042218F    dd          004221E3
 0042218F    dd          004221EC
 0042218F    dd          004221DA
 0042218F    dd          004221F5
 0042218F    dd          004221FE
 0042218F    dd          00422220
 0042218F    dd          004221EC
 0042218F    dd          004221EC
 0042218F    dd          00422207
 0042218F    dd          00422220
 0042218F    dd          00422220
 0042218F    dd          00422219
 0042218F    dd          00422210
 004221DA    push        ebp
 004221DB    call        WriteOrdProp
 004221E0    pop         ecx
>004221E1    jmp         00422220
 004221E3    push        ebp
 004221E4    call        WriteFloatProp
 004221E9    pop         ecx
>004221EA    jmp         00422220
 004221EC    push        ebp
 004221ED    call        WriteStrProp
 004221F2    pop         ecx
>004221F3    jmp         00422220
 004221F5    push        ebp
 004221F6    call        WriteObjectProp
 004221FB    pop         ecx
>004221FC    jmp         00422220
 004221FE    push        ebp
 004221FF    call        WriteMethodProp
 00422204    pop         ecx
>00422205    jmp         00422220
 00422207    push        ebp
 00422208    call        WriteVariantProp
 0042220D    pop         ecx
>0042220E    jmp         00422220
 00422210    push        ebp
 00422211    call        WriteInt64Prop
 00422216    pop         ecx
>00422217    jmp         00422220
 00422219    push        ebp
 0042221A    call        WriteInterfaceProp
 0042221F    pop         ecx
 00422220    mov         esp,ebp
 00422222    pop         ebp
 00422223    ret
*}
end;

//00422224
procedure TWriter.WriteVariant(const Value:Variant);
begin
{*
 00422224    push        ebp
 00422225    mov         ebp,esp
 00422227    add         esp,0FFFFFEC4
 0042222D    push        ebx
 0042222E    push        esi
 0042222F    push        edi
 00422230    xor         ecx,ecx
 00422232    mov         dword ptr [ebp-3C],ecx
 00422235    mov         dword ptr [ebp-38],ecx
 00422238    mov         dword ptr [ebp-34],ecx
 0042223B    mov         dword ptr [ebp-30],ecx
 0042223E    mov         dword ptr [ebp-2C],ecx
 00422241    mov         dword ptr [ebp-1C],ecx
 00422244    mov         ebx,edx
 00422246    mov         dword ptr [ebp-4],eax
 00422249    xor         eax,eax
 0042224B    push        ebp
 0042224C    push        422600
 00422251    push        dword ptr fs:[eax]
 00422254    mov         dword ptr fs:[eax],esp
 00422257    mov         eax,ebx
 00422259    call        VarIsArray
 0042225E    test        al,al
>00422260    je          00422279
 00422262    mov         ecx,dword ptr ds:[5AE49C];^SWriteError:TResStringRec
 00422268    mov         dl,1
 0042226A    mov         eax,[004179B4];EWriteError
 0042226F    call        Exception.CreateRes
 00422274    call        @RaiseExcept
 00422279    mov         eax,ebx
 0042227B    call        VarType
 00422280    and         ax,0FFF
 00422284    movzx       eax,ax
 00422287    cmp         eax,7
>0042228A    jg          004222BE
>0042228C    je          004223AC
 00422292    cmp         eax,6
>00422295    ja          00422410
 0042229B    jmp         dword ptr [eax*4+4222A2]
 0042229B    dd          004222F3
 0042229B    dd          00422302
 0042229B    dd          00422345
 0042229B    dd          00422345
 0042229B    dd          0042235B
 0042229B    dd          00422376
 0042229B    dd          00422391
 004222BE    cmp         eax,10
>004222C1    jge         004222D6
 004222C3    sub         eax,8
>004222C6    je          00422311
 004222C8    sub         eax,3
>004222CB    je          004223C7
>004222D1    jmp         00422410
 004222D6    add         eax,0FFFFFFF0
 004222D9    sub         eax,3
>004222DC    jb          00422345
 004222DE    sub         eax,2
>004222E1    jb          004223F0
 004222E7    sub         eax,0EB
>004222EC    je          0042232B
>004222EE    jmp         00422410
 004222F3    mov         dl,0D
 004222F5    mov         eax,dword ptr [ebp-4]
 004222F8    call        TWriter.WriteValue
>004222FD    jmp         004225C5
 00422302    xor         edx,edx
 00422304    mov         eax,dword ptr [ebp-4]
 00422307    call        TWriter.WriteValue
>0042230C    jmp         004225C5
 00422311    lea         eax,[ebp-2C]
 00422314    mov         edx,ebx
 00422316    call        @VarToWStr
 0042231B    mov         edx,dword ptr [ebp-2C]
 0042231E    mov         eax,dword ptr [ebp-4]
 00422321    call        TWriter.WriteWideString
>00422326    jmp         004225C5
 0042232B    lea         eax,[ebp-30]
 0042232E    mov         edx,ebx
 00422330    call        @VarToLStr
 00422335    mov         edx,dword ptr [ebp-30]
 00422338    mov         eax,dword ptr [ebp-4]
 0042233B    call        TWriter.WriteString
>00422340    jmp         004225C5
 00422345    mov         eax,ebx
 00422347    call        @VarToInteger
 0042234C    mov         edx,eax
 0042234E    mov         eax,dword ptr [ebp-4]
 00422351    call        TWriter.WriteInteger
>00422356    jmp         004225C5
 0042235B    mov         eax,ebx
 0042235D    call        @VarToReal
 00422362    add         esp,0FFFFFFFC
 00422365    fstp        dword ptr [esp]
 00422368    wait
 00422369    mov         eax,dword ptr [ebp-4]
 0042236C    call        TWriter.WriteSingle
>00422371    jmp         004225C5
 00422376    mov         eax,ebx
 00422378    call        @VarToReal
 0042237D    add         esp,0FFFFFFF4
 00422380    fstp        tbyte ptr [esp]
 00422383    wait
 00422384    mov         eax,dword ptr [ebp-4]
 00422387    call        TWriter.WriteFloat
>0042238C    jmp         004225C5
 00422391    mov         eax,ebx
 00422393    call        @VarToCurrency
 00422398    add         esp,0FFFFFFF8
 0042239B    fistp       qword ptr [esp]
 0042239E    wait
 0042239F    mov         eax,dword ptr [ebp-4]
 004223A2    call        TWriter.WriteCurrency
>004223A7    jmp         004225C5
 004223AC    mov         eax,ebx
 004223AE    call        @VarToReal
 004223B3    add         esp,0FFFFFFF8
 004223B6    fstp        qword ptr [esp]
 004223B9    wait
 004223BA    mov         eax,dword ptr [ebp-4]
 004223BD    call        TWriter.WriteDate
>004223C2    jmp         004225C5
 004223C7    mov         eax,ebx
 004223C9    call        @VarToBool
 004223CE    test        al,al
>004223D0    je          004223E1
 004223D2    mov         dl,9
 004223D4    mov         eax,dword ptr [ebp-4]
 004223D7    call        TWriter.WriteValue
>004223DC    jmp         004225C5
 004223E1    mov         dl,8
 004223E3    mov         eax,dword ptr [ebp-4]
 004223E6    call        TWriter.WriteValue
>004223EB    jmp         004225C5
 004223F0    mov         eax,ebx
 004223F2    call        @VarToInt64
 004223F7    mov         dword ptr [ebp-28],eax
 004223FA    mov         dword ptr [ebp-24],edx
 004223FD    push        dword ptr [ebp-24]
 00422400    push        dword ptr [ebp-28]
 00422403    mov         eax,dword ptr [ebp-4]
 00422406    call        TWriter.WriteInteger
>0042240B    jmp         004225C5
 00422410    xor         eax,eax
 00422412    push        ebp
 00422413    push        4225A4
 00422418    push        dword ptr fs:[eax]
 0042241B    mov         dword ptr fs:[eax],esp
 0042241E    lea         edx,[ebp-8]
 00422421    mov         ax,word ptr [ebx]
 00422424    call        FindCustomVariantType
 00422429    test        al,al
>0042242B    je          00422452
 0042242D    lea         eax,[ebp-1C]
 00422430    call        @IntfClear
 00422435    push        eax
 00422436    lea         eax,[ebp-34]
 00422439    mov         edx,ebx
 0042243B    call        @VarToIntf
 00422440    mov         eax,dword ptr [ebp-34]
 00422443    mov         edx,422610
 00422448    pop         ecx
 00422449    call        Supports
 0042244E    test        al,al
>00422450    jne         0042246C
 00422452    lea         eax,[ebp-38]
 00422455    mov         edx,ebx
 00422457    call        @VarToLStr
 0042245C    mov         edx,dword ptr [ebp-38]
 0042245F    mov         eax,dword ptr [ebp-4]
 00422462    call        TWriter.WriteString
>00422467    jmp         0042259A
 0042246C    xor         eax,eax
 0042246E    mov         dword ptr [ebp-10],eax
 00422471    mov         dl,1
 00422473    mov         eax,[00418640];TMemoryStream
 00422478    call        TObject.Create
 0042247D    mov         dword ptr [ebp-0C],eax
 00422480    xor         eax,eax
 00422482    push        ebp
 00422483    push        422593
 00422488    push        dword ptr fs:[eax]
 0042248B    mov         dword ptr fs:[eax],esp
 0042248E    mov         dl,1
 00422490    mov         eax,[00418640];TMemoryStream
 00422495    call        TObject.Create
 0042249A    mov         dword ptr [ebp-10],eax
 0042249D    push        400
 004224A2    mov         ecx,dword ptr [ebp-0C]
 004224A5    mov         dl,1
 004224A7    mov         eax,[00418AA8];TWriter
 004224AC    call        TFiler.Create
 004224B1    mov         dword ptr [ebp-14],eax
 004224B4    xor         eax,eax
 004224B6    push        ebp
 004224B7    push        422539
 004224BC    push        dword ptr fs:[eax]
 004224BF    mov         dword ptr fs:[eax],esp
 004224C2    mov         edx,ebx
 004224C4    mov         ecx,dword ptr [ebp-10]
 004224C7    mov         eax,dword ptr [ebp-1C]
 004224CA    mov         ebx,dword ptr [eax]
 004224CC    call        dword ptr [ebx+10]
 004224CF    mov         eax,dword ptr [ebp-10]
 004224D2    mov         edx,dword ptr [eax]
 004224D4    call        dword ptr [edx]
 004224D6    mov         dword ptr [ebp-18],eax
 004224D9    lea         edx,[ebp-13C]
 004224DF    mov         eax,dword ptr [ebp-8]
 004224E2    mov         eax,dword ptr [eax]
 004224E4    call        TObject.ClassName
 004224E9    lea         edx,[ebp-13C]
 004224EF    lea         eax,[ebp-3C]
 004224F2    call        @LStrFromString
 004224F7    mov         edx,dword ptr [ebp-3C]
 004224FA    mov         eax,dword ptr [ebp-14]
 004224FD    call        TWriter.WriteString
 00422502    lea         edx,[ebp-18]
 00422505    mov         ecx,4
 0042250A    mov         eax,dword ptr [ebp-14]
 0042250D    call        TWriter.Write
 00422512    mov         eax,dword ptr [ebp-10]
 00422515    mov         edx,dword ptr [eax+4]
 00422518    mov         ecx,dword ptr [ebp-18]
 0042251B    mov         eax,dword ptr [ebp-14]
 0042251E    call        TWriter.Write
 00422523    xor         eax,eax
 00422525    pop         edx
 00422526    pop         ecx
 00422527    pop         ecx
 00422528    mov         dword ptr fs:[eax],edx
 0042252B    push        422540
 00422530    mov         eax,dword ptr [ebp-14]
 00422533    call        TObject.Free
 00422538    ret
>00422539    jmp         @HandleFinally
>0042253E    jmp         00422530
 00422540    mov         eax,dword ptr [ebp-0C]
 00422543    mov         edx,dword ptr [eax]
 00422545    call        dword ptr [edx]
 00422547    mov         dword ptr [ebp-18],eax
 0042254A    mov         dl,0A
 0042254C    mov         eax,dword ptr [ebp-4]
 0042254F    call        TWriter.WriteValue
 00422554    lea         edx,[ebp-18]
 00422557    mov         ecx,4
 0042255C    mov         eax,dword ptr [ebp-4]
 0042255F    call        TWriter.Write
 00422564    mov         eax,dword ptr [ebp-0C]
 00422567    mov         edx,dword ptr [eax+4]
 0042256A    mov         ecx,dword ptr [ebp-18]
 0042256D    mov         eax,dword ptr [ebp-4]
 00422570    call        TWriter.Write
 00422575    xor         eax,eax
 00422577    pop         edx
 00422578    pop         ecx
 00422579    pop         ecx
 0042257A    mov         dword ptr fs:[eax],edx
 0042257D    push        42259A
 00422582    mov         eax,dword ptr [ebp-10]
 00422585    call        TObject.Free
 0042258A    mov         eax,dword ptr [ebp-0C]
 0042258D    call        TObject.Free
 00422592    ret
>00422593    jmp         @HandleFinally
>00422598    jmp         00422582
 0042259A    xor         eax,eax
 0042259C    pop         edx
 0042259D    pop         ecx
 0042259E    pop         ecx
 0042259F    mov         dword ptr fs:[eax],edx
>004225A2    jmp         004225C5
>004225A4    jmp         @HandleAnyException
 004225A9    mov         ecx,dword ptr ds:[5AE49C];^SWriteError:TResStringRec
 004225AF    mov         dl,1
 004225B1    mov         eax,[004179B4];EWriteError
 004225B6    call        Exception.CreateRes
 004225BB    call        @RaiseExcept
 004225C0    call        @DoneExcept
 004225C5    xor         eax,eax
 004225C7    pop         edx
 004225C8    pop         ecx
 004225C9    pop         ecx
 004225CA    mov         dword ptr fs:[eax],edx
 004225CD    push        422607
 004225D2    lea         eax,[ebp-3C]
 004225D5    mov         edx,2
 004225DA    call        @LStrArrayClr
 004225DF    lea         eax,[ebp-34]
 004225E2    call        @IntfClear
 004225E7    lea         eax,[ebp-30]
 004225EA    call        @LStrClr
 004225EF    lea         eax,[ebp-2C]
 004225F2    call        @WStrClr
 004225F7    lea         eax,[ebp-1C]
 004225FA    call        @IntfClear
 004225FF    ret
>00422600    jmp         @HandleFinally
>00422605    jmp         004225D2
 00422607    pop         edi
 00422608    pop         esi
 00422609    pop         ebx
 0042260A    mov         esp,ebp
 0042260C    pop         ebp
 0042260D    ret
*}
end;

//00422620
procedure TWriter.WritePropName(const PropName:AnsiString);
begin
{*
 00422620    push        ebp
 00422621    mov         ebp,esp
 00422623    push        0
 00422625    push        ebx
 00422626    push        esi
 00422627    mov         esi,edx
 00422629    mov         ebx,eax
 0042262B    xor         eax,eax
 0042262D    push        ebp
 0042262E    push        422666
 00422633    push        dword ptr fs:[eax]
 00422636    mov         dword ptr fs:[eax],esp
 00422639    lea         eax,[ebp-4]
 0042263C    mov         ecx,esi
 0042263E    mov         edx,dword ptr [ebx+2C]
 00422641    call        @LStrCat3
 00422646    mov         edx,dword ptr [ebp-4]
 00422649    mov         eax,ebx
 0042264B    call        TWriter.WriteStr
 00422650    xor         eax,eax
 00422652    pop         edx
 00422653    pop         ecx
 00422654    pop         ecx
 00422655    mov         dword ptr fs:[eax],edx
 00422658    push        42266D
 0042265D    lea         eax,[ebp-4]
 00422660    call        @LStrClr
 00422665    ret
>00422666    jmp         @HandleFinally
>0042266B    jmp         0042265D
 0042266D    pop         esi
 0042266E    pop         ebx
 0042266F    pop         ecx
 00422670    pop         ebp
 00422671    ret
*}
end;

//00422674
procedure TWriter.WriteStr(const Value:AnsiString);
begin
{*
 00422674    push        ebx
 00422675    push        esi
 00422676    push        ecx
 00422677    mov         esi,edx
 00422679    mov         ebx,eax
 0042267B    mov         eax,esi
 0042267D    call        @LStrLen
 00422682    mov         dword ptr [esp],eax
 00422685    cmp         dword ptr [esp],0FF
>0042268C    jle         00422695
 0042268E    mov         dword ptr [esp],0FF
 00422695    mov         edx,esp
 00422697    mov         ecx,1
 0042269C    mov         eax,ebx
 0042269E    call        TWriter.Write
 004226A3    mov         eax,esi
 004226A5    call        @LStrToPChar
 004226AA    mov         edx,eax
 004226AC    mov         ecx,dword ptr [esp]
 004226AF    mov         eax,ebx
 004226B1    call        TWriter.Write
 004226B6    pop         edx
 004226B7    pop         esi
 004226B8    pop         ebx
 004226B9    ret
*}
end;

//004226BC
procedure TWriter.WriteMinStr(const LocaleStr:AnsiString; const UTF8Str:UTF8String);
begin
{*
 004226BC    push        ebx
 004226BD    push        esi
 004226BE    push        edi
 004226BF    push        ecx
 004226C0    mov         edi,ecx
 004226C2    mov         esi,edx
 004226C4    mov         ebx,eax
 004226C6    mov         eax,esi
 004226C8    mov         edx,edi
 004226CA    call        @LStrCmp
>004226CF    je          00422700
 004226D1    mov         eax,edi
 004226D3    call        @LStrLen
 004226D8    mov         dword ptr [esp],eax
 004226DB    mov         dl,14
 004226DD    mov         eax,ebx
 004226DF    call        TWriter.WriteValue
 004226E4    mov         edx,esp
 004226E6    mov         ecx,4
 004226EB    mov         eax,ebx
 004226ED    call        TWriter.Write
 004226F2    mov         edx,edi
 004226F4    mov         ecx,dword ptr [esp]
 004226F7    mov         eax,ebx
 004226F9    call        TWriter.Write
>004226FE    jmp         0042274F
 00422700    mov         eax,esi
 00422702    call        @LStrLen
 00422707    mov         dword ptr [esp],eax
 0042270A    cmp         dword ptr [esp],0FF
>00422711    jg          0042272C
 00422713    mov         dl,6
 00422715    mov         eax,ebx
 00422717    call        TWriter.WriteValue
 0042271C    mov         edx,esp
 0042271E    mov         ecx,1
 00422723    mov         eax,ebx
 00422725    call        TWriter.Write
>0042272A    jmp         00422743
 0042272C    mov         dl,0C
 0042272E    mov         eax,ebx
 00422730    call        TWriter.WriteValue
 00422735    mov         edx,esp
 00422737    mov         ecx,4
 0042273C    mov         eax,ebx
 0042273E    call        TWriter.Write
 00422743    mov         edx,esi
 00422745    mov         ecx,dword ptr [esp]
 00422748    mov         eax,ebx
 0042274A    call        TWriter.Write
 0042274F    pop         edx
 00422750    pop         edi
 00422751    pop         esi
 00422752    pop         ebx
 00422753    ret
*}
end;

//00422754
procedure TWriter.WriteString(const Value:AnsiString);
begin
{*
 00422754    push        ebp
 00422755    mov         ebp,esp
 00422757    push        0
 00422759    push        ebx
 0042275A    push        esi
 0042275B    mov         esi,edx
 0042275D    mov         ebx,eax
 0042275F    xor         eax,eax
 00422761    push        ebp
 00422762    push        422799
 00422767    push        dword ptr fs:[eax]
 0042276A    mov         dword ptr fs:[eax],esp
 0042276D    lea         edx,[ebp-4]
 00422770    mov         eax,esi
 00422772    call        AnsiToUtf8
 00422777    mov         ecx,dword ptr [ebp-4]
 0042277A    mov         edx,esi
 0042277C    mov         eax,ebx
 0042277E    call        TWriter.WriteMinStr
 00422783    xor         eax,eax
 00422785    pop         edx
 00422786    pop         ecx
 00422787    pop         ecx
 00422788    mov         dword ptr fs:[eax],edx
 0042278B    push        4227A0
 00422790    lea         eax,[ebp-4]
 00422793    call        @LStrClr
 00422798    ret
>00422799    jmp         @HandleFinally
>0042279E    jmp         00422790
 004227A0    pop         esi
 004227A1    pop         ebx
 004227A2    pop         ecx
 004227A3    pop         ebp
 004227A4    ret
*}
end;

//004227A8
procedure TWriter.WriteWideString(const Value:WideString);
begin
{*
 004227A8    push        ebp
 004227A9    mov         ebp,esp
 004227AB    push        0
 004227AD    push        0
 004227AF    push        0
 004227B1    push        ebx
 004227B2    push        esi
 004227B3    push        edi
 004227B4    mov         ebx,edx
 004227B6    mov         esi,eax
 004227B8    xor         eax,eax
 004227BA    push        ebp
 004227BB    push        42284E
 004227C0    push        dword ptr fs:[eax]
 004227C3    mov         dword ptr fs:[eax],esp
 004227C6    lea         edx,[ebp-8]
 004227C9    mov         eax,ebx
 004227CB    call        UTF8Encode
 004227D0    mov         eax,dword ptr [ebp-8]
 004227D3    call        @LStrLen
 004227D8    mov         edi,eax
 004227DA    mov         eax,ebx
 004227DC    call        @WStrLen
 004227E1    add         eax,eax
 004227E3    cmp         edi,eax
>004227E5    jge         00422800
 004227E7    lea         eax,[ebp-0C]
 004227EA    mov         edx,ebx
 004227EC    call        @LStrFromWStr
 004227F1    mov         edx,dword ptr [ebp-0C]
 004227F4    mov         ecx,dword ptr [ebp-8]
 004227F7    mov         eax,esi
 004227F9    call        TWriter.WriteMinStr
>004227FE    jmp         00422830
 00422800    mov         dl,12
 00422802    mov         eax,esi
 00422804    call        TWriter.WriteValue
 00422809    mov         eax,ebx
 0042280B    call        @WStrLen
 00422810    mov         dword ptr [ebp-4],eax
 00422813    lea         edx,[ebp-4]
 00422816    mov         ecx,4
 0042281B    mov         eax,esi
 0042281D    call        TWriter.Write
 00422822    mov         ecx,dword ptr [ebp-4]
 00422825    add         ecx,ecx
 00422827    mov         edx,ebx
 00422829    mov         eax,esi
 0042282B    call        TWriter.Write
 00422830    xor         eax,eax
 00422832    pop         edx
 00422833    pop         ecx
 00422834    pop         ecx
 00422835    mov         dword ptr fs:[eax],edx
 00422838    push        422855
 0042283D    lea         eax,[ebp-0C]
 00422840    call        @LStrClr
 00422845    lea         eax,[ebp-8]
 00422848    call        @LStrClr
 0042284D    ret
>0042284E    jmp         @HandleFinally
>00422853    jmp         0042283D
 00422855    pop         edi
 00422856    pop         esi
 00422857    pop         ebx
 00422858    mov         esp,ebp
 0042285A    pop         ebp
 0042285B    ret
*}
end;

//0042285C
procedure TWriter.WriteValue(Value:TValueType);
begin
{*
 0042285C    push        ecx
 0042285D    mov         byte ptr [esp],dl
 00422860    mov         edx,esp
 00422862    mov         ecx,1
 00422867    call        TWriter.Write
 0042286C    pop         edx
 0042286D    ret
*}
end;

//00422870
procedure TWriter.GetLookupInfo(var Ancestor:TPersistent; var Root:TComponent; var LookupRoot:TComponent; var RootAncestor:TComponent);
begin
{*
 00422870    push        ebp
 00422871    mov         ebp,esp
 00422873    push        ebx
 00422874    mov         ebx,dword ptr [eax+20]
 00422877    mov         dword ptr [edx],ebx
 00422879    mov         edx,dword ptr [eax+18]
 0042287C    mov         dword ptr [ecx],edx
 0042287E    mov         edx,dword ptr [ebp+0C]
 00422881    mov         ecx,dword ptr [eax+1C]
 00422884    mov         dword ptr [edx],ecx
 00422886    mov         edx,dword ptr [ebp+8]
 00422889    mov         eax,dword ptr [eax+28]
 0042288C    mov         dword ptr [edx],eax
 0042288E    pop         ebx
 0042288F    pop         ebp
 00422890    ret         8
*}
end;

//00422894
procedure InitThreadSynchronization;
begin
{*
 00422894    push        5E0938;ThreadLock:TRTLCriticalSection
 00422899    call        KERNEL32.InitializeCriticalSection
 0042289E    push        4228C4
 004228A3    push        0
 004228A5    push        0FF
 004228A7    push        0
 004228A9    call        KERNEL32.CreateEventA
 004228AE    mov         [005E0920],eax;SyncEvent:THandle
 004228B3    cmp         dword ptr ds:[5E0920],0;SyncEvent:THandle
>004228BA    jne         004228C1
 004228BC    call        RaiseLastOSError
 004228C1    ret
*}
end;

//004228C8
procedure DoneThreadSynchronization;
begin
{*
 004228C8    push        5E0938;ThreadLock:TRTLCriticalSection
 004228CD    call        KERNEL32.DeleteCriticalSection
 004228D2    mov         eax,[005E0920];SyncEvent:THandle
 004228D7    push        eax
 004228D8    call        KERNEL32.CloseHandle
 004228DD    ret
*}
end;

//004228E0
procedure ResetSyncEvent;
begin
{*
 004228E0    mov         eax,[005E0920];SyncEvent:THandle
 004228E5    push        eax
 004228E6    call        KERNEL32.ResetEvent
 004228EB    ret
*}
end;

//004228EC
procedure WaitForSyncEvent(Timeout:Integer);
begin
{*
 004228EC    push        ebx
 004228ED    mov         ebx,eax
 004228EF    push        ebx
 004228F0    mov         eax,[005E0920];SyncEvent:THandle
 004228F5    push        eax
 004228F6    call        KERNEL32.WaitForSingleObject
 004228FB    test        eax,eax
>004228FD    jne         00422904
 004228FF    call        ResetSyncEvent
 00422904    pop         ebx
 00422905    ret
*}
end;

//00422908
function CheckSynchronize(Timeout:Integer):Boolean;
begin
{*
 00422908    push        ebp
 00422909    mov         ebp,esp
 0042290B    add         esp,0FFFFFFEC
 0042290E    push        ebx
 0042290F    push        esi
 00422910    push        edi
 00422911    mov         ebx,eax
 00422913    call        KERNEL32.GetCurrentThreadId
 00422918    mov         edx,dword ptr ds:[5AE80C];MainThreadID:Cardinal
 0042291E    cmp         eax,dword ptr [edx]
>00422920    je          0042294B
 00422922    call        KERNEL32.GetCurrentThreadId
 00422927    mov         dword ptr [ebp-14],eax
 0042292A    mov         byte ptr [ebp-10],0
 0042292E    lea         eax,[ebp-14]
 00422931    push        eax
 00422932    push        0
 00422934    mov         ecx,dword ptr ds:[5AE580];^SCheckSynchronizeError:TResStringRec
 0042293A    mov         dl,1
 0042293C    mov         eax,[00418B24];EThread
 00422941    call        Exception.CreateResFmt
 00422946    call        @RaiseExcept
 0042294B    test        ebx,ebx
>0042294D    jle         00422958
 0042294F    mov         eax,ebx
 00422951    call        WaitForSyncEvent
>00422956    jmp         0042295D
 00422958    call        ResetSyncEvent
 0042295D    xor         eax,eax
 0042295F    mov         dword ptr [ebp-0C],eax
 00422962    push        5E0938;ThreadLock:TRTLCriticalSection
 00422967    call        KERNEL32.EnterCriticalSection
 0042296C    xor         eax,eax
 0042296E    push        ebp
 0042296F    push        422A96
 00422974    push        dword ptr fs:[eax]
 00422977    mov         dword ptr fs:[eax],esp
 0042297A    mov         eax,dword ptr [ebp-0C]
 0042297D    push        eax
 0042297E    push        5AC51C
 00422983    call        KERNEL32.InterlockedExchange
 00422988    mov         dword ptr [ebp-0C],eax
 0042298B    xor         eax,eax
 0042298D    push        ebp
 0042298E    push        422A77
 00422993    push        dword ptr fs:[eax]
 00422996    mov         dword ptr fs:[eax],esp
 00422999    cmp         dword ptr [ebp-0C],0
>0042299D    je          004229A8
 0042299F    mov         eax,dword ptr [ebp-0C]
 004229A2    cmp         dword ptr [eax+8],0
>004229A6    jg          004229AC
 004229A8    xor         eax,eax
>004229AA    jmp         004229AE
 004229AC    mov         al,1
 004229AE    mov         byte ptr [ebp-1],al
 004229B1    cmp         byte ptr [ebp-1],0
>004229B5    je          00422A61
>004229BB    jmp         00422A54
 004229C0    xor         edx,edx
 004229C2    mov         eax,dword ptr [ebp-0C]
 004229C5    call        TList.Get
 004229CA    mov         dword ptr [ebp-8],eax
 004229CD    xor         edx,edx
 004229CF    mov         eax,dword ptr [ebp-0C]
 004229D2    call        TList.Delete
 004229D7    push        5E0938;ThreadLock:TRTLCriticalSection
 004229DC    call        KERNEL32.LeaveCriticalSection
 004229E1    xor         eax,eax
 004229E3    push        ebp
 004229E4    push        422A41
 004229E9    push        dword ptr fs:[eax]
 004229EC    mov         dword ptr fs:[eax],esp
 004229EF    xor         eax,eax
 004229F1    push        ebp
 004229F2    push        422A12
 004229F7    push        dword ptr fs:[eax]
 004229FA    mov         dword ptr fs:[eax],esp
 004229FD    mov         eax,dword ptr [ebp-8]
 00422A00    mov         ebx,dword ptr [eax]
 00422A02    mov         eax,dword ptr [ebx+0C]
 00422A05    call        dword ptr [ebx+8]
 00422A08    xor         eax,eax
 00422A0A    pop         edx
 00422A0B    pop         ecx
 00422A0C    pop         ecx
 00422A0D    mov         dword ptr fs:[eax],edx
>00422A10    jmp         00422A29
>00422A12    jmp         @HandleAnyException
 00422A17    call        AcquireExceptionObject
 00422A1C    mov         edx,dword ptr [ebp-8]
 00422A1F    mov         edx,dword ptr [edx]
 00422A21    mov         dword ptr [edx+10],eax
 00422A24    call        @DoneExcept
 00422A29    xor         eax,eax
 00422A2B    pop         edx
 00422A2C    pop         ecx
 00422A2D    pop         ecx
 00422A2E    mov         dword ptr fs:[eax],edx
 00422A31    push        422A48
 00422A36    push        5E0938;ThreadLock:TRTLCriticalSection
 00422A3B    call        KERNEL32.EnterCriticalSection
 00422A40    ret
>00422A41    jmp         @HandleFinally
>00422A46    jmp         00422A36
 00422A48    mov         eax,dword ptr [ebp-8]
 00422A4B    mov         eax,dword ptr [eax+4]
 00422A4E    push        eax
 00422A4F    call        KERNEL32.SetEvent
 00422A54    mov         eax,dword ptr [ebp-0C]
 00422A57    cmp         dword ptr [eax+8],0
>00422A5B    jg          004229C0
 00422A61    xor         eax,eax
 00422A63    pop         edx
 00422A64    pop         ecx
 00422A65    pop         ecx
 00422A66    mov         dword ptr fs:[eax],edx
 00422A69    push        422A7E
 00422A6E    mov         eax,dword ptr [ebp-0C]
 00422A71    call        TObject.Free
 00422A76    ret
>00422A77    jmp         @HandleFinally
>00422A7C    jmp         00422A6E
 00422A7E    xor         eax,eax
 00422A80    pop         edx
 00422A81    pop         ecx
 00422A82    pop         ecx
 00422A83    mov         dword ptr fs:[eax],edx
 00422A86    push        422A9D
 00422A8B    push        5E0938;ThreadLock:TRTLCriticalSection
 00422A90    call        KERNEL32.LeaveCriticalSection
 00422A95    ret
>00422A96    jmp         @HandleFinally
>00422A9B    jmp         00422A8B
 00422A9D    mov         al,byte ptr [ebp-1]
 00422AA0    pop         edi
 00422AA1    pop         esi
 00422AA2    pop         ebx
 00422AA3    mov         esp,ebp
 00422AA5    pop         ebp
 00422AA6    ret
*}
end;

//00422AA8
constructor TComponent.Create(AOwner:TComponent);
begin
{*
 00422AA8    push        ebx
 00422AA9    push        esi
 00422AAA    push        edi
 00422AAB    test        dl,dl
>00422AAD    je          00422AB7
 00422AAF    add         esp,0FFFFFFF0
 00422AB2    call        @ClassCreate
 00422AB7    mov         esi,ecx
 00422AB9    mov         ebx,edx
 00422ABB    mov         edi,eax
 00422ABD    mov         al,[00422AF0]
 00422AC2    mov         byte ptr [edi+24],al
 00422AC5    test        esi,esi
>00422AC7    je          00422AD2
 00422AC9    mov         edx,edi
 00422ACB    mov         eax,esi
 00422ACD    call        TComponent.InsertComponent
 00422AD2    mov         eax,edi
 00422AD4    test        bl,bl
>00422AD6    je          00422AE7
 00422AD8    call        @AfterConstruction
 00422ADD    pop         dword ptr fs:[0]
 00422AE4    add         esp,0C
 00422AE7    mov         eax,edi
 00422AE9    pop         edi
 00422AEA    pop         esi
 00422AEB    pop         ebx
 00422AEC    ret
*}
end;

//00422AF4
destructor TComponent.Destroy;
begin
{*
 00422AF4    push        ebx
 00422AF5    push        esi
 00422AF6    push        ecx
 00422AF7    call        @BeforeDestruction
 00422AFC    mov         byte ptr [esp],dl
 00422AFF    mov         ebx,eax
 00422B01    mov         eax,ebx
 00422B03    call        TComponent.Destroying
 00422B08    cmp         dword ptr [ebx+14],0
>00422B0C    je          00422B39
>00422B0E    jmp         00422B24
 00422B10    mov         edx,dword ptr [esi+8]
 00422B13    dec         edx
 00422B14    mov         eax,esi
 00422B16    call        TList.Get
 00422B1B    mov         cl,1
 00422B1D    mov         edx,ebx
 00422B1F    mov         esi,dword ptr [eax]
 00422B21    call        dword ptr [esi+10]
 00422B24    mov         esi,dword ptr [ebx+14]
 00422B27    test        esi,esi
>00422B29    je          00422B31
 00422B2B    cmp         dword ptr [esi+8],0
>00422B2F    jg          00422B10
 00422B31    lea         eax,[ebx+14]
 00422B34    call        FreeAndNil
 00422B39    mov         eax,ebx
 00422B3B    call        TComponent.DestroyComponents
 00422B40    mov         eax,dword ptr [ebx+4]
 00422B43    test        eax,eax
>00422B45    je          00422B4E
 00422B47    mov         edx,ebx
 00422B49    call        TComponent.RemoveComponent
 00422B4E    mov         dl,byte ptr [esp]
 00422B51    and         dl,0FC
 00422B54    mov         eax,ebx
 00422B56    call        TMemoryStream.Destroy
 00422B5B    cmp         byte ptr [esp],0
>00422B5F    jle         00422B68
 00422B61    mov         eax,ebx
 00422B63    call        @ClassDestroy
 00422B68    pop         edx
 00422B69    pop         esi
 00422B6A    pop         ebx
 00422B6B    ret
*}
end;

//00422B6C
procedure TComponent.BeforeDestruction;
begin
{*
 00422B6C    test        byte ptr [eax+1C],8
>00422B70    jne         00422B77
 00422B72    call        TComponent.Destroying
 00422B77    ret
*}
end;

//00422B78
procedure TComponent.FreeNotification(AComponent:TComponent);
begin
{*
 00422B78    push        ebx
 00422B79    push        esi
 00422B7A    mov         esi,edx
 00422B7C    mov         ebx,eax
 00422B7E    mov         eax,dword ptr [ebx+4]
 00422B81    test        eax,eax
>00422B83    je          00422B8A
 00422B85    cmp         eax,dword ptr [esi+4]
>00422B88    je          00422BC0
 00422B8A    cmp         dword ptr [ebx+14],0
>00422B8E    jne         00422B9F
 00422B90    mov         dl,1
 00422B92    mov         eax,[00417CEC];TList
 00422B97    call        TObject.Create
 00422B9C    mov         dword ptr [ebx+14],eax
 00422B9F    mov         edx,esi
 00422BA1    mov         eax,dword ptr [ebx+14]
 00422BA4    call        TList.IndexOf
 00422BA9    test        eax,eax
>00422BAB    jge         00422BC0
 00422BAD    mov         edx,esi
 00422BAF    mov         eax,dword ptr [ebx+14]
 00422BB2    call        TList.Add
 00422BB7    mov         edx,ebx
 00422BB9    mov         eax,esi
 00422BBB    call        TComponent.FreeNotification
 00422BC0    or          word ptr [ebx+1C],100
 00422BC6    pop         esi
 00422BC7    pop         ebx
 00422BC8    ret
*}
end;

//00422BCC
procedure TComponent.ReadLeft(Reader:TReader);
begin
{*
 00422BCC    push        ebx
 00422BCD    push        esi
 00422BCE    mov         esi,edx
 00422BD0    mov         ebx,eax
 00422BD2    mov         eax,esi
 00422BD4    call        TReader.ReadInteger
 00422BD9    mov         word ptr [ebx+18],ax
 00422BDD    pop         esi
 00422BDE    pop         ebx
 00422BDF    ret
*}
end;

//00422BE0
procedure TComponent.ReadTop(Reader:TReader);
begin
{*
 00422BE0    push        ebx
 00422BE1    push        esi
 00422BE2    mov         esi,edx
 00422BE4    mov         ebx,eax
 00422BE6    mov         eax,esi
 00422BE8    call        TReader.ReadInteger
 00422BED    mov         word ptr [ebx+1A],ax
 00422BF1    pop         esi
 00422BF2    pop         ebx
 00422BF3    ret
*}
end;

//00422BF4
procedure TComponent.WriteLeft(Writer:TWriter);
begin
{*
 00422BF4    movzx       eax,word ptr [eax+18]
 00422BF8    xchg        eax,edx
 00422BF9    call        TWriter.WriteInteger
 00422BFE    ret
*}
end;

//00422C00
procedure TComponent.WriteTop(Writer:TWriter);
begin
{*
 00422C00    movzx       eax,word ptr [eax+1A]
 00422C04    xchg        eax,edx
 00422C05    call        TWriter.WriteInteger
 00422C0A    ret
*}
end;

//00422C0C
procedure TComponent.Insert(AComponent:TComponent);
begin
{*
 00422C0C    push        ebx
 00422C0D    push        esi
 00422C0E    mov         esi,edx
 00422C10    mov         ebx,eax
 00422C12    cmp         dword ptr [ebx+10],0
>00422C16    jne         00422C27
 00422C18    mov         dl,1
 00422C1A    mov         eax,[00417CEC];TList
 00422C1F    call        TObject.Create
 00422C24    mov         dword ptr [ebx+10],eax
 00422C27    mov         edx,esi
 00422C29    mov         eax,dword ptr [ebx+10]
 00422C2C    call        TList.Add
 00422C31    mov         dword ptr [esi+4],ebx
 00422C34    pop         esi
 00422C35    pop         ebx
 00422C36    ret
*}
end;

//00422C38
procedure TComponent.Remove(AComponent:TComponent);
begin
{*
 00422C38    push        ebx
 00422C39    mov         ebx,eax
 00422C3B    xor         eax,eax
 00422C3D    mov         dword ptr [edx+4],eax
 00422C40    mov         eax,dword ptr [ebx+10]
 00422C43    call        TList.Remove
 00422C48    mov         eax,dword ptr [ebx+10]
 00422C4B    cmp         dword ptr [eax+8],0
>00422C4F    jne         00422C5B
 00422C51    call        TObject.Free
 00422C56    xor         eax,eax
 00422C58    mov         dword ptr [ebx+10],eax
 00422C5B    pop         ebx
 00422C5C    ret
*}
end;

//00422C60
procedure TComponent.InsertComponent(AComponent:TComponent);
begin
{*
 00422C60    push        ebx
 00422C61    push        esi
 00422C62    push        edi
 00422C63    mov         ebx,edx
 00422C65    mov         edi,eax
 00422C67    mov         edx,edi
 00422C69    mov         eax,ebx
 00422C6B    mov         si,0FFF5
 00422C6F    call        @CallDynaInst
 00422C74    mov         eax,dword ptr [ebx+8]
 00422C77    push        eax
 00422C78    xor         ecx,ecx
 00422C7A    mov         edx,ebx
 00422C7C    mov         eax,edi
 00422C7E    mov         esi,dword ptr [eax]
 00422C80    call        dword ptr [esi+20]
 00422C83    mov         edx,ebx
 00422C85    mov         eax,edi
 00422C87    call        TComponent.Insert
 00422C8C    mov         dl,1
 00422C8E    mov         eax,ebx
 00422C90    call        TComponent.SetReference
 00422C95    test        byte ptr [edi+1C],10
>00422C99    je          00422CA6
 00422C9B    mov         cl,1
 00422C9D    mov         dl,1
 00422C9F    mov         eax,ebx
 00422CA1    call        TComponent.SetDesigning
 00422CA6    xor         ecx,ecx
 00422CA8    mov         edx,ebx
 00422CAA    mov         eax,edi
 00422CAC    mov         ebx,dword ptr [eax]
 00422CAE    call        dword ptr [ebx+10]
 00422CB1    pop         edi
 00422CB2    pop         esi
 00422CB3    pop         ebx
 00422CB4    ret
*}
end;

//00422CB8
procedure TComponent.RemoveComponent(AComponent:TComponent);
begin
{*
 00422CB8    push        ebx
 00422CB9    push        esi
 00422CBA    push        edi
 00422CBB    mov         ebx,edx
 00422CBD    mov         esi,eax
 00422CBF    push        0
 00422CC1    mov         ecx,dword ptr [ebx+8]
 00422CC4    mov         edx,ebx
 00422CC6    mov         eax,esi
 00422CC8    mov         edi,dword ptr [eax]
 00422CCA    call        dword ptr [edi+20]
 00422CCD    mov         cl,1
 00422CCF    mov         edx,ebx
 00422CD1    mov         eax,esi
 00422CD3    mov         edi,dword ptr [eax]
 00422CD5    call        dword ptr [edi+10]
 00422CD8    xor         edx,edx
 00422CDA    mov         eax,ebx
 00422CDC    call        TComponent.SetReference
 00422CE1    mov         edx,ebx
 00422CE3    mov         eax,esi
 00422CE5    call        TComponent.Remove
 00422CEA    pop         edi
 00422CEB    pop         esi
 00422CEC    pop         ebx
 00422CED    ret
*}
end;

//00422CF0
procedure TComponent.DestroyComponents;
begin
{*
 00422CF0    push        ebx
 00422CF1    push        esi
 00422CF2    push        edi
 00422CF3    mov         esi,eax
>00422CF5    jmp         00422D39
 00422CF7    mov         eax,ebx
 00422CF9    call        TList.Last
 00422CFE    mov         edi,eax
 00422D00    test        byte ptr [edi+1D],1
>00422D04    jne         00422D1C
 00422D06    mov         ax,[00422D44]
 00422D0C    and         ax,word ptr [esi+1C]
 00422D10    mov         dx,word ptr ds:[422D44]
 00422D17    cmp         dx,ax
>00422D1A    jne         00422D27
 00422D1C    mov         edx,edi
 00422D1E    mov         eax,esi
 00422D20    call        TComponent.RemoveComponent
>00422D25    jmp         00422D30
 00422D27    mov         edx,edi
 00422D29    mov         eax,esi
 00422D2B    call        TComponent.Remove
 00422D30    mov         dl,1
 00422D32    mov         eax,edi
 00422D34    mov         ecx,dword ptr [eax]
 00422D36    call        dword ptr [ecx-4]
 00422D39    mov         ebx,dword ptr [esi+10]
 00422D3C    test        ebx,ebx
>00422D3E    jne         00422CF7
 00422D40    pop         edi
 00422D41    pop         esi
 00422D42    pop         ebx
 00422D43    ret
*}
end;

//00422D48
procedure TComponent.Destroying;
begin
{*
 00422D48    push        ebx
 00422D49    push        esi
 00422D4A    push        edi
 00422D4B    mov         ebx,eax
 00422D4D    test        byte ptr [ebx+1C],8
>00422D51    jne         00422D7D
 00422D53    or          word ptr [ebx+1C],8
 00422D58    mov         eax,dword ptr [ebx+10]
 00422D5B    test        eax,eax
>00422D5D    je          00422D7D
 00422D5F    mov         esi,dword ptr [eax+8]
 00422D62    dec         esi
 00422D63    test        esi,esi
>00422D65    jl          00422D7D
 00422D67    inc         esi
 00422D68    xor         edi,edi
 00422D6A    mov         edx,edi
 00422D6C    mov         eax,dword ptr [ebx+10]
 00422D6F    call        TList.Get
 00422D74    call        TComponent.Destroying
 00422D79    inc         edi
 00422D7A    dec         esi
>00422D7B    jne         00422D6A
 00422D7D    pop         edi
 00422D7E    pop         esi
 00422D7F    pop         ebx
 00422D80    ret
*}
end;

//00422D84
procedure TComponent.RemoveNotification(AComponent:TComponent);
begin
{*
 00422D84    push        ebx
 00422D85    mov         ebx,eax
 00422D87    mov         eax,dword ptr [ebx+14]
 00422D8A    test        eax,eax
>00422D8C    je          00422DA6
 00422D8E    call        TList.Remove
 00422D93    mov         eax,dword ptr [ebx+14]
 00422D96    cmp         dword ptr [eax+8],0
>00422D9A    jne         00422DA6
 00422D9C    call        TObject.Free
 00422DA1    xor         eax,eax
 00422DA3    mov         dword ptr [ebx+14],eax
 00422DA6    pop         ebx
 00422DA7    ret
*}
end;

//00422DA8
procedure TComponent.RemoveFreeNotification(AComponent:TComponent);
begin
{*
 00422DA8    push        ebx
 00422DA9    push        esi
 00422DAA    mov         esi,edx
 00422DAC    mov         ebx,eax
 00422DAE    mov         edx,esi
 00422DB0    mov         eax,ebx
 00422DB2    call        TComponent.RemoveNotification
 00422DB7    mov         edx,ebx
 00422DB9    mov         eax,esi
 00422DBB    call        TComponent.RemoveNotification
 00422DC0    pop         esi
 00422DC1    pop         ebx
 00422DC2    ret
*}
end;

//00422DC4
procedure TComponent.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00422DC4    push        ebx
 00422DC5    push        esi
 00422DC6    push        edi
 00422DC7    push        ebp
 00422DC8    push        ecx
 00422DC9    mov         byte ptr [esp],cl
 00422DCC    mov         edi,edx
 00422DCE    mov         esi,eax
 00422DD0    cmp         byte ptr [esp],1
>00422DD4    jne         00422DE3
 00422DD6    test        edi,edi
>00422DD8    je          00422DE3
 00422DDA    mov         edx,edi
 00422DDC    mov         eax,esi
 00422DDE    call        TComponent.RemoveFreeNotification
 00422DE3    mov         eax,dword ptr [esi+10]
 00422DE6    test        eax,eax
>00422DE8    je          00422E18
 00422DEA    mov         ebx,dword ptr [eax+8]
 00422DED    dec         ebx
 00422DEE    test        ebx,ebx
>00422DF0    jl          00422E18
 00422DF2    mov         edx,ebx
 00422DF4    mov         eax,dword ptr [esi+10]
 00422DF7    call        TList.Get
 00422DFC    mov         cl,byte ptr [esp]
 00422DFF    mov         edx,edi
 00422E01    mov         ebp,dword ptr [eax]
 00422E03    call        dword ptr [ebp+10]
 00422E06    dec         ebx
 00422E07    mov         eax,dword ptr [esi+10]
 00422E0A    mov         eax,dword ptr [eax+8]
 00422E0D    cmp         ebx,eax
>00422E0F    jl          00422E14
 00422E11    mov         ebx,eax
 00422E13    dec         ebx
 00422E14    test        ebx,ebx
>00422E16    jge         00422DF2
 00422E18    pop         edx
 00422E19    pop         ebp
 00422E1A    pop         edi
 00422E1B    pop         esi
 00422E1C    pop         ebx
 00422E1D    ret
*}
end;

//00422E20
procedure TComponent.DefineProperties(Filer:TFiler);
begin
{*
 00422E20    push        ebp
 00422E21    mov         ebp,esp
 00422E23    push        ecx
 00422E24    push        ebx
 00422E25    push        esi
 00422E26    push        edi
 00422E27    mov         esi,edx
 00422E29    mov         ebx,eax
 00422E2B    xor         eax,eax
 00422E2D    mov         dword ptr [ebp-4],eax
 00422E30    mov         eax,dword ptr [esi+20]
 00422E33    test        eax,eax
>00422E35    je          00422E3D
 00422E37    mov         eax,dword ptr [eax+18]
 00422E3A    mov         dword ptr [ebp-4],eax
 00422E3D    push        ebx
 00422E3E    push        422BCC;TComponent.ReadLeft
 00422E43    push        ebx
 00422E44    push        422BF4;TComponent.WriteLeft
 00422E49    mov         ax,word ptr [ebx+18]
 00422E4D    cmp         ax,word ptr [ebp-4]
 00422E51    setne       cl
 00422E54    mov         edx,422E94;'Left'
 00422E59    mov         eax,esi
 00422E5B    mov         edi,dword ptr [eax]
 00422E5D    call        dword ptr [edi+4]
 00422E60    push        ebx
 00422E61    push        422BE0;TComponent.ReadTop
 00422E66    push        ebx
 00422E67    push        422C00;TComponent.WriteTop
 00422E6C    mov         ax,word ptr [ebp-2]
 00422E70    cmp         ax,word ptr [ebx+1A]
 00422E74    setne       cl
 00422E77    mov         edx,422EA4;'Top'
 00422E7C    mov         eax,esi
 00422E7E    mov         ebx,dword ptr [eax]
 00422E80    call        dword ptr [ebx+4]
 00422E83    pop         edi
 00422E84    pop         esi
 00422E85    pop         ebx
 00422E86    pop         ecx
 00422E87    pop         ebp
 00422E88    ret
*}
end;

//00422EA8
procedure TComponent.HasParent;
begin
{*
 00422EA8    xor         eax,eax
 00422EAA    ret
*}
end;

//00422EAC
procedure TComponent.sub_00422EAC;
begin
{*
 00422EAC    push        ebp
 00422EAD    mov         ebp,esp
 00422EAF    pop         ebp
 00422EB0    ret         8
*}
end;

//00422EB4
procedure TComponent.sub_00422EB4;
begin
{*
 00422EB4    xor         eax,eax
 00422EB6    ret
*}
end;

//00422EB8
procedure TComponent.sub_00422EB8;
begin
{*
 00422EB8    ret
*}
end;

//00422EBC
procedure TComponent.GetNamePath;
begin
{*
 00422EBC    push        ebx
 00422EBD    push        esi
 00422EBE    mov         esi,edx
 00422EC0    mov         ebx,eax
 00422EC2    mov         eax,esi
 00422EC4    mov         edx,dword ptr [ebx+8]
 00422EC7    call        @LStrAsg
 00422ECC    pop         esi
 00422ECD    pop         ebx
 00422ECE    ret
*}
end;

//00422ED0
procedure TComponent.sub_0041ADA4;
begin
{*
 00422ED0    mov         eax,dword ptr [eax+4];TComponent.FOwner:TComponent
 00422ED3    ret
*}
end;

//00422ED4
procedure TComponent.sub_00422ED4;
begin
{*
 00422ED4    ret
*}
end;

//00422ED8
procedure TComponent.GetParentComponent;
begin
{*
 00422ED8    xor         eax,eax
 00422EDA    ret
*}
end;

//00422EDC
procedure TComponent.sub_00422EDC;
begin
{*
 00422EDC    ret
*}
end;

//00422EE0
procedure TComponent.Updating;
begin
{*
 00422EE0    push        ebx
 00422EE1    mov         ebx,eax
 00422EE3    or          word ptr [ebx+1C],40
 00422EE8    pop         ebx
 00422EE9    ret
*}
end;

//00422EEC
procedure TComponent.Updated;
begin
{*
 00422EEC    push        ebx
 00422EED    mov         ebx,eax
 00422EEF    and         word ptr [ebx+1C],0FFFFFFBF
 00422EF4    pop         ebx
 00422EF5    ret
*}
end;

//00422EF8
procedure TComponent.Loaded;
begin
{*
 00422EF8    push        ebx
 00422EF9    mov         ebx,eax
 00422EFB    and         word ptr [ebx+1C],0FFFFFFFE
 00422F00    pop         ebx
 00422F01    ret
*}
end;

//00422F04
procedure TComponent.sub_00422F04;
begin
{*
 00422F04    ret
*}
end;

//00422F08
procedure TComponent.ReadState(Reader:TReader);
begin
{*
 00422F08    xchg        eax,edx
 00422F09    call        TReader.ReadData
 00422F0E    ret
*}
end;

//00422F10
{*procedure sub_00422F10(?:?);
begin
 00422F10    xchg        eax,edx
 00422F11    mov         ecx,dword ptr [eax]
 00422F13    call        dword ptr [ecx+10]
 00422F16    ret
end;*}

//00422F18
procedure TComponent.ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);
begin
{*
 00422F18    push        ebp
 00422F19    mov         ebp,esp
 00422F1B    add         esp,0FFFFFFF4
 00422F1E    push        ebx
 00422F1F    push        esi
 00422F20    push        edi
 00422F21    mov         dword ptr [ebp-4],ecx
 00422F24    mov         edi,edx
 00422F26    mov         ebx,eax
 00422F28    mov         esi,dword ptr [ebp+8]
 00422F2B    test        edi,edi
>00422F2D    je          00422F73
 00422F2F    mov         edx,esi
 00422F31    mov         eax,dword ptr [ebp-4]
 00422F34    call        SameText
 00422F39    test        al,al
>00422F3B    jne         00422F73
 00422F3D    cmp         ebx,dword ptr [edi+4]
>00422F40    jne         00422F73
 00422F42    mov         edx,esi
 00422F44    mov         eax,ebx
 00422F46    call        TComponent.FindComponent
 00422F4B    test        eax,eax
>00422F4D    je          00422F73
 00422F4F    mov         dword ptr [ebp-0C],esi
 00422F52    mov         byte ptr [ebp-8],0B
 00422F56    lea         eax,[ebp-0C]
 00422F59    push        eax
 00422F5A    push        0
 00422F5C    mov         ecx,dword ptr ds:[5AE524];^SDuplicateName:TResStringRec
 00422F62    mov         dl,1
 00422F64    mov         eax,[00417BD4];EComponentError
 00422F69    call        Exception.CreateResFmt
 00422F6E    call        @RaiseExcept
 00422F73    test        byte ptr [ebx+1C],10
>00422F77    je          00422F8D
 00422F79    cmp         dword ptr [ebx+4],0
>00422F7D    je          00422F8D
 00422F7F    push        esi
 00422F80    mov         ecx,dword ptr [ebp-4]
 00422F83    mov         edx,edi
 00422F85    mov         eax,dword ptr [ebx+4]
 00422F88    mov         ebx,dword ptr [eax]
 00422F8A    call        dword ptr [ebx+20]
 00422F8D    pop         edi
 00422F8E    pop         esi
 00422F8F    pop         ebx
 00422F90    mov         esp,ebp
 00422F92    pop         ebp
 00422F93    ret         4
*}
end;

//00422F98
procedure TComponent.ValidateContainer(AComponent:TComponent);
begin
{*
 00422F98    push        esi
 00422F99    mov         esi,eax
 00422F9B    mov         eax,edx
 00422F9D    mov         edx,esi
 00422F9F    mov         si,0FFF4
 00422FA3    call        @CallDynaInst
 00422FA8    pop         esi
 00422FA9    ret
*}
end;

//00422FAC
procedure TComponent.sub_00422FAC;
begin
{*
 00422FAC    ret
*}
end;

//00422FB0
function TComponent.FindComponent(const AName:AnsiString):TComponent;
begin
{*
 00422FB0    push        ebx
 00422FB1    push        esi
 00422FB2    push        edi
 00422FB3    push        ebp
 00422FB4    push        ecx
 00422FB5    mov         dword ptr [esp],edx
 00422FB8    mov         edi,eax
 00422FBA    cmp         dword ptr [esp],0
>00422FBE    je          00422FF3
 00422FC0    cmp         dword ptr [edi+10],0
>00422FC4    je          00422FF3
 00422FC6    mov         eax,dword ptr [edi+10]
 00422FC9    mov         ebx,dword ptr [eax+8]
 00422FCC    dec         ebx
 00422FCD    test        ebx,ebx
>00422FCF    jl          00422FF3
 00422FD1    inc         ebx
 00422FD2    xor         ebp,ebp
 00422FD4    mov         eax,dword ptr [edi+10]
 00422FD7    mov         edx,ebp
 00422FD9    call        TList.Get
 00422FDE    mov         esi,eax
 00422FE0    mov         eax,dword ptr [esi+8]
 00422FE3    mov         edx,dword ptr [esp]
 00422FE6    call        SameText
 00422FEB    test        al,al
>00422FED    jne         00422FF5
 00422FEF    inc         ebp
 00422FF0    dec         ebx
>00422FF1    jne         00422FD4
 00422FF3    xor         esi,esi
 00422FF5    mov         eax,esi
 00422FF7    pop         edx
 00422FF8    pop         ebp
 00422FF9    pop         edi
 00422FFA    pop         esi
 00422FFB    pop         ebx
 00422FFC    ret
*}
end;

//00423000
procedure TComponent.SetName(const NewName:TComponentName);
begin
{*
 00423000    push        ebx
 00423001    push        esi
 00423002    push        edi
 00423003    add         esp,0FFFFFFF8
 00423006    mov         esi,edx
 00423008    mov         ebx,eax
 0042300A    mov         eax,dword ptr [ebx+8]
 0042300D    mov         edx,esi
 0042300F    call        @LStrCmp
>00423014    je          00423085
 00423016    test        esi,esi
>00423018    je          00423047
 0042301A    mov         eax,esi
 0042301C    call        IsValidIdent
 00423021    test        al,al
>00423023    jne         00423047
 00423025    mov         dword ptr [esp],esi
 00423028    mov         byte ptr [esp+4],0B
 0042302D    push        esp
 0042302E    push        0
 00423030    mov         ecx,dword ptr ds:[5AE440];^SInvalidName:TResStringRec
 00423036    mov         dl,1
 00423038    mov         eax,[00417BD4];EComponentError
 0042303D    call        Exception.CreateResFmt
 00423042    call        @RaiseExcept
 00423047    mov         edi,dword ptr [ebx+4]
 0042304A    test        edi,edi
>0042304C    je          0042305D
 0042304E    push        esi
 0042304F    mov         ecx,dword ptr [ebx+8]
 00423052    mov         edx,ebx
 00423054    mov         eax,edi
 00423056    mov         edi,dword ptr [eax]
 00423058    call        dword ptr [edi+20]
>0042305B    jmp         0042306A
 0042305D    push        esi
 0042305E    mov         ecx,dword ptr [ebx+8]
 00423061    xor         edx,edx
 00423063    mov         eax,ebx
 00423065    mov         edi,dword ptr [eax]
 00423067    call        dword ptr [edi+20]
 0042306A    xor         edx,edx
 0042306C    mov         eax,ebx
 0042306E    call        TComponent.SetReference
 00423073    mov         edx,esi
 00423075    mov         eax,ebx
 00423077    call        TComponent.ChangeName
 0042307C    mov         dl,1
 0042307E    mov         eax,ebx
 00423080    call        TComponent.SetReference
 00423085    pop         ecx
 00423086    pop         edx
 00423087    pop         edi
 00423088    pop         esi
 00423089    pop         ebx
 0042308A    ret
*}
end;

//0042308C
procedure TComponent.ChangeName(const NewName:TComponentName);
begin
{*
 0042308C    push        ebx
 0042308D    push        esi
 0042308E    mov         esi,edx
 00423090    mov         ebx,eax
 00423092    lea         eax,[ebx+8]
 00423095    mov         edx,esi
 00423097    call        @LStrAsg
 0042309C    pop         esi
 0042309D    pop         ebx
 0042309E    ret
*}
end;

//004230A0
function TComponent.GetComponent(AIndex:Integer):TComponent;
begin
{*
 004230A0    push        ebx
 004230A1    push        esi
 004230A2    mov         esi,edx
 004230A4    mov         ebx,eax
 004230A6    cmp         dword ptr [ebx+10],0
>004230AA    jne         004230BE
 004230AC    mov         edx,dword ptr ds:[5AE664];^SListIndexError:TResStringRec
 004230B2    mov         ecx,esi
 004230B4    mov         eax,[00417CEC];TList
 004230B9    call        TList.Error
 004230BE    mov         edx,esi
 004230C0    mov         eax,dword ptr [ebx+10]
 004230C3    call        TList.Get
 004230C8    pop         esi
 004230C9    pop         ebx
 004230CA    ret
*}
end;

//004230CC
function TComponent.GetComponentCount:Integer;
begin
{*
 004230CC    mov         edx,dword ptr [eax+10]
 004230CF    test        edx,edx
>004230D1    je          004230D7
 004230D3    mov         eax,dword ptr [edx+8]
 004230D6    ret
 004230D7    xor         eax,eax
 004230D9    ret
*}
end;

//004230DC
procedure TComponent.SetComponentIndex(Value:Integer);
begin
{*
 004230DC    push        ebx
 004230DD    push        esi
 004230DE    push        edi
 004230DF    mov         esi,edx
 004230E1    mov         ebx,eax
 004230E3    mov         eax,dword ptr [ebx+4]
 004230E6    test        eax,eax
>004230E8    je          00423129
 004230EA    mov         eax,dword ptr [eax+10]
 004230ED    mov         edx,ebx
 004230EF    call        TList.IndexOf
 004230F4    test        eax,eax
>004230F6    jl          00423129
 004230F8    mov         edx,dword ptr [ebx+4]
 004230FB    mov         edi,dword ptr [edx+10]
 004230FE    mov         edx,dword ptr [edi+8]
 00423101    test        esi,esi
>00423103    jge         00423107
 00423105    xor         esi,esi
 00423107    cmp         edx,esi
>00423109    jg          0042310E
 0042310B    mov         esi,edx
 0042310D    dec         esi
 0042310E    cmp         eax,esi
>00423110    je          00423129
 00423112    mov         edx,edi
 00423114    xchg        eax,edx
 00423115    call        TList.Delete
 0042311A    mov         eax,dword ptr [ebx+4]
 0042311D    mov         eax,dword ptr [eax+10]
 00423120    mov         ecx,ebx
 00423122    mov         edx,esi
 00423124    call        TList.Insert
 00423129    pop         edi
 0042312A    pop         esi
 0042312B    pop         ebx
 0042312C    ret
*}
end;

//00423130
procedure TComponent.SetDesigning(Value:Boolean; SetChildren:Boolean);
begin
{*
 00423130    push        ebx
 00423131    push        esi
 00423132    push        edi
 00423133    push        ebp
 00423134    push        ecx
 00423135    mov         byte ptr [esp],cl
 00423138    mov         ebx,edx
 0042313A    mov         esi,eax
 0042313C    test        bl,bl
>0042313E    je          00423147
 00423140    or          word ptr [esi+1C],10
>00423145    jmp         0042314C
 00423147    and         word ptr [esi+1C],0FFFFFFEF
 0042314C    cmp         byte ptr [esp],0
>00423150    je          00423179
 00423152    mov         eax,esi
 00423154    call        TComponent.GetComponentCount
 00423159    mov         ebp,eax
 0042315B    dec         ebp
 0042315C    test        ebp,ebp
>0042315E    jl          00423179
 00423160    inc         ebp
 00423161    xor         edi,edi
 00423163    mov         edx,edi
 00423165    mov         eax,esi
 00423167    call        TComponent.GetComponent
 0042316C    mov         cl,1
 0042316E    mov         edx,ebx
 00423170    call        TComponent.SetDesigning
 00423175    inc         edi
 00423176    dec         ebp
>00423177    jne         00423163
 00423179    pop         edx
 0042317A    pop         ebp
 0042317B    pop         edi
 0042317C    pop         esi
 0042317D    pop         ebx
 0042317E    ret
*}
end;

//00423180
procedure TComponent.SetReference(Enable:Boolean);
begin
{*
 00423180    push        ebx
 00423181    push        esi
 00423182    push        edi
 00423183    add         esp,0FFFFFF00
 00423189    mov         ebx,edx
 0042318B    mov         edi,eax
 0042318D    mov         esi,dword ptr [edi+4]
 00423190    test        esi,esi
>00423192    je          004231BC
 00423194    mov         eax,esp
 00423196    mov         edx,dword ptr [edi+8]
 00423199    mov         ecx,0FF
 0042319E    call        @LStrToString
 004231A3    mov         edx,esp
 004231A5    mov         eax,esi
 004231A7    call        TObject.FieldAddress
 004231AC    test        eax,eax
>004231AE    je          004231BC
 004231B0    test        bl,bl
>004231B2    je          004231B8
 004231B4    mov         dword ptr [eax],edi
>004231B6    jmp         004231BC
 004231B8    xor         edx,edx
 004231BA    mov         dword ptr [eax],edx
 004231BC    add         esp,100
 004231C2    pop         edi
 004231C3    pop         esi
 004231C4    pop         ebx
 004231C5    ret
*}
end;

//004231C8
procedure TComponent.ExecuteAction(Action:TBasicAction);
begin
{*
 004231C8    push        ebx
 004231C9    push        esi
 004231CA    push        edi
 004231CB    mov         edi,edx
 004231CD    mov         esi,eax
 004231CF    mov         edx,esi
 004231D1    mov         eax,edi
 004231D3    mov         ecx,dword ptr [eax]
 004231D5    call        dword ptr [ecx+38]
 004231D8    mov         ebx,eax
 004231DA    test        bl,bl
>004231DC    je          004231E7
 004231DE    mov         edx,esi
 004231E0    mov         eax,edi
 004231E2    mov         ecx,dword ptr [eax]
 004231E4    call        dword ptr [ecx+40]
 004231E7    mov         eax,ebx
 004231E9    pop         edi
 004231EA    pop         esi
 004231EB    pop         ebx
 004231EC    ret
*}
end;

//004231F0
procedure TComponent.UpdateAction(Action:TBasicAction);
begin
{*
 004231F0    push        ebx
 004231F1    push        esi
 004231F2    push        edi
 004231F3    mov         edi,edx
 004231F5    mov         esi,eax
 004231F7    mov         edx,esi
 004231F9    mov         eax,edi
 004231FB    mov         ecx,dword ptr [eax]
 004231FD    call        dword ptr [ecx+38]
 00423200    mov         ebx,eax
 00423202    test        bl,bl
>00423204    je          0042320F
 00423206    mov         edx,esi
 00423208    mov         eax,edi
 0042320A    mov         ecx,dword ptr [eax]
 0042320C    call        dword ptr [ecx+3C]
 0042320F    mov         eax,ebx
 00423211    pop         edi
 00423212    pop         esi
 00423213    pop         ebx
 00423214    ret
*}
end;

//00423218
function TComponent.SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;
begin
{*
 00423218    push        ebx
 00423219    cmp         dword ptr [eax+20],0
>0042321D    je          00423229
 0042321F    mov         eax,dword ptr [eax+20]
 00423222    mov         ebx,dword ptr [eax]
 00423224    call        dword ptr [ebx+1C]
 00423227    pop         ebx
 00423228    ret
 00423229    call        TObject.SafeCallException
 0042322E    pop         ebx
 0042322F    ret
*}
end;

//00423230
procedure sub_00423230;
begin
{*
 00423230    push        ebp
 00423231    mov         ebp,esp
 00423233    pop         ebp
 00423234    ret         4
*}
end;

//00423238
function TComponent.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 00423238    push        ebp
 00423239    mov         ebp,esp
 0042323B    push        ebx
 0042323C    push        esi
 0042323D    push        edi
 0042323E    mov         edi,dword ptr [ebp+10]
 00423241    mov         esi,dword ptr [ebp+0C]
 00423244    mov         ebx,dword ptr [ebp+8]
 00423247    cmp         dword ptr [ebx+20],0
>0042324B    jne         00423267
 0042324D    mov         ecx,edi
 0042324F    mov         edx,esi
 00423251    mov         eax,ebx
 00423253    call        TObject.GetInterface
 00423258    test        al,al
>0042325A    je          00423260
 0042325C    xor         eax,eax
>0042325E    jmp         00423271
 00423260    mov         eax,80004002
>00423265    jmp         00423271
 00423267    push        edi
 00423268    push        esi
 00423269    mov         eax,dword ptr [ebx+20]
 0042326C    push        eax
 0042326D    mov         eax,dword ptr [eax]
 0042326F    call        dword ptr [eax]
 00423271    pop         edi
 00423272    pop         esi
 00423273    pop         ebx
 00423274    pop         ebp
 00423275    ret         0C
*}
end;

//00423278
function TComponent._AddRef:Integer; stdcall;
begin
{*
 00423278    push        ebp
 00423279    mov         ebp,esp
 0042327B    mov         eax,dword ptr [ebp+8]
 0042327E    cmp         dword ptr [eax+20],0
>00423282    jne         00423289
 00423284    or          eax,0FFFFFFFF
>00423287    jmp         00423292
 00423289    mov         eax,dword ptr [eax+20]
 0042328C    push        eax
 0042328D    mov         eax,dword ptr [eax]
 0042328F    call        dword ptr [eax+4]
 00423292    pop         ebp
 00423293    ret         4
*}
end;

//00423298
function TComponent._Release:Integer; stdcall;
begin
{*
 00423298    push        ebp
 00423299    mov         ebp,esp
 0042329B    mov         eax,dword ptr [ebp+8]
 0042329E    cmp         dword ptr [eax+20],0
>004232A2    jne         004232A9
 004232A4    or          eax,0FFFFFFFF
>004232A7    jmp         004232B2
 004232A9    mov         eax,dword ptr [eax+20]
 004232AC    push        eax
 004232AD    mov         eax,dword ptr [eax]
 004232AF    call        dword ptr [eax+8]
 004232B2    pop         ebp
 004232B3    ret         4
*}
end;

//004232B8
procedure sub_004232B8;
begin
{*
 004232B8    ret
*}
end;

//004232BC
constructor TBasicActionLink.Create(AClient:TObject);
begin
{*
 004232BC    push        ebx
 004232BD    push        esi
 004232BE    push        edi
 004232BF    test        dl,dl
>004232C1    je          004232CB
 004232C3    add         esp,0FFFFFFF0
 004232C6    call        @ClassCreate
 004232CB    mov         esi,ecx
 004232CD    mov         ebx,edx
 004232CF    mov         edi,eax
 004232D1    xor         edx,edx
 004232D3    mov         eax,edi
 004232D5    call        TObject.Create
 004232DA    mov         edx,esi
 004232DC    mov         eax,edi
 004232DE    mov         ecx,dword ptr [eax]
 004232E0    call        dword ptr [ecx]
 004232E2    mov         eax,edi
 004232E4    test        bl,bl
>004232E6    je          004232F7
 004232E8    call        @AfterConstruction
 004232ED    pop         dword ptr fs:[0]
 004232F4    add         esp,0C
 004232F7    mov         eax,edi
 004232F9    pop         edi
 004232FA    pop         esi
 004232FB    pop         ebx
 004232FC    ret
*}
end;

//00423300
procedure sub_00423300;
begin
{*
 00423300    ret
*}
end;

//00423304
destructor TBasicActionLink.Destroy;
begin
{*
 00423304    push        ebx
 00423305    push        esi
 00423306    call        @BeforeDestruction
 0042330B    mov         ebx,edx
 0042330D    mov         esi,eax
 0042330F    mov         eax,dword ptr [esi+10]
 00423312    test        eax,eax
>00423314    je          0042331D
 00423316    mov         edx,esi
 00423318    call        TBasicAction.UnRegisterChanges
 0042331D    mov         edx,ebx
 0042331F    and         dl,0FC
 00423322    mov         eax,esi
 00423324    call        TObject.Destroy
 00423329    test        bl,bl
>0042332B    jle         00423334
 0042332D    mov         eax,esi
 0042332F    call        @ClassDestroy
 00423334    pop         esi
 00423335    pop         ebx
 00423336    ret
*}
end;

//00423338
procedure TBasicActionLink.Change;
begin
{*
 00423338    push        ebx
 00423339    cmp         word ptr [eax+0A],0
>0042333E    je          0042334B
 00423340    mov         ebx,eax
 00423342    mov         edx,dword ptr [eax+10]
 00423345    mov         eax,dword ptr [ebx+0C]
 00423348    call        dword ptr [ebx+8]
 0042334B    pop         ebx
 0042334C    ret
*}
end;

//00423350
function TBasicActionLink.Execute(AComponent:TComponent):Boolean;
begin
{*
 00423350    push        ebx
 00423351    push        esi
 00423352    mov         ebx,eax
 00423354    mov         eax,dword ptr [ebx+10]
 00423357    call        TBasicAction.SetActionComponent
 0042335C    mov         eax,dword ptr [ebx+10]
 0042335F    mov         si,0FFEF
 00423363    call        @CallDynaInst
 00423368    pop         esi
 00423369    pop         ebx
 0042336A    ret
*}
end;

//0042336C
procedure TBasicActionLink.SetAction(Value:TBasicAction);
begin
{*
 0042336C    push        ebx
 0042336D    push        esi
 0042336E    mov         esi,edx
 00423370    mov         ebx,eax
 00423372    mov         eax,dword ptr [ebx+10]
 00423375    cmp         esi,eax
>00423377    je          00423394
 00423379    test        eax,eax
>0042337B    je          00423384
 0042337D    mov         edx,ebx
 0042337F    call        TBasicAction.UnRegisterChanges
 00423384    mov         dword ptr [ebx+10],esi
 00423387    test        esi,esi
>00423389    je          00423394
 0042338B    mov         edx,ebx
 0042338D    mov         eax,esi
 0042338F    call        TBasicAction.RegisterChanges
 00423394    pop         esi
 00423395    pop         ebx
 00423396    ret
*}
end;

//00423398
function TBasicActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 00423398    mov         al,1
 0042339A    ret
*}
end;

//0042339C
procedure sub_0042339C;
begin
{*
 0042339C    push        ebp
 0042339D    mov         ebp,esp
 0042339F    pop         ebp
 004233A0    ret         8
*}
end;

//004233A4
function TBasicActionLink.Update:Boolean;
begin
{*
 004233A4    mov         eax,dword ptr [eax+10]
 004233A7    mov         edx,dword ptr [eax]
 004233A9    call        dword ptr [edx+44]
 004233AC    ret
*}
end;

//004233B0
constructor TBasicAction.Create(AOwner:TComponent);
begin
{*
 004233B0    push        ebx
 004233B1    push        esi
 004233B2    test        dl,dl
>004233B4    je          004233BE
 004233B6    add         esp,0FFFFFFF0
 004233B9    call        @ClassCreate
 004233BE    mov         ebx,edx
 004233C0    mov         esi,eax
 004233C2    xor         edx,edx
 004233C4    mov         eax,esi
 004233C6    call        TComponent.Create
 004233CB    mov         dl,1
 004233CD    mov         eax,[00417CEC];TList
 004233D2    call        TObject.Create
 004233D7    mov         dword ptr [esi+50],eax
 004233DA    mov         eax,esi
 004233DC    test        bl,bl
>004233DE    je          004233EF
 004233E0    call        @AfterConstruction
 004233E5    pop         dword ptr fs:[0]
 004233EC    add         esp,0C
 004233EF    mov         eax,esi
 004233F1    pop         esi
 004233F2    pop         ebx
 004233F3    ret
*}
end;

//004233F4
destructor TBasicAction.Destroy;
begin
{*
 004233F4    push        ebx
 004233F5    push        esi
 004233F6    push        edi
 004233F7    call        @BeforeDestruction
 004233FC    mov         ebx,edx
 004233FE    mov         edi,eax
 00423400    mov         edx,ebx
 00423402    and         dl,0FC
 00423405    mov         eax,edi
 00423407    call        TComponent.Destroy
 0042340C    mov         eax,dword ptr [edi+30]
 0042340F    test        eax,eax
>00423411    je          0042342C
 00423413    mov         edx,edi
 00423415    call        TComponent.RemoveFreeNotification
>0042341A    jmp         0042342C
 0042341C    mov         eax,esi
 0042341E    call        TList.Last
 00423423    mov         edx,eax
 00423425    mov         eax,edi
 00423427    call        TBasicAction.UnRegisterChanges
 0042342C    mov         esi,dword ptr [edi+50]
 0042342F    cmp         dword ptr [esi+8],0
>00423433    jg          0042341C
 00423435    lea         eax,[edi+50]
 00423438    call        FreeAndNil
 0042343D    test        bl,bl
>0042343F    jle         00423448
 00423441    mov         eax,edi
 00423443    call        @ClassDestroy
 00423448    pop         edi
 00423449    pop         esi
 0042344A    pop         ebx
 0042344B    ret
*}
end;

//0042344C
{*function sub_0042344C:?;
begin
 0042344C    xor         eax,eax
 0042344E    ret
end;*}

//00423450
procedure sub_00423450;
begin
{*
 00423450    ret
*}
end;

//00423454
procedure TBasicAction.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00423454    push        ebx
 00423455    push        esi
 00423456    push        edi
 00423457    mov         ebx,ecx
 00423459    mov         esi,edx
 0042345B    mov         edi,eax
 0042345D    mov         ecx,ebx
 0042345F    mov         edx,esi
 00423461    mov         eax,edi
 00423463    call        TComponent.Notification
 00423468    cmp         bl,1
>0042346B    jne         00423477
 0042346D    cmp         esi,dword ptr [edi+30]
>00423470    jne         00423477
 00423472    xor         eax,eax
 00423474    mov         dword ptr [edi+30],eax
 00423477    pop         edi
 00423478    pop         esi
 00423479    pop         ebx
 0042347A    ret
*}
end;

//0042347C
procedure sub_0042347C;
begin
{*
 0042347C    ret
*}
end;

//00423480
procedure TBasicAction.Execute;
begin
{*
 00423480    push        ebx
 00423481    cmp         word ptr [eax+42],0
>00423486    je          00423496
 00423488    mov         ebx,eax
 0042348A    mov         edx,eax
 0042348C    mov         eax,dword ptr [ebx+44]
 0042348F    call        dword ptr [ebx+40]
 00423492    mov         al,1
 00423494    pop         ebx
 00423495    ret
 00423496    xor         eax,eax
 00423498    pop         ebx
 00423499    ret
*}
end;

//0042349C
function TBasicAction.Update:Boolean;
begin
{*
 0042349C    push        ebx
 0042349D    cmp         word ptr [eax+4A],0
>004234A2    je          004234B2
 004234A4    mov         ebx,eax
 004234A6    mov         edx,eax
 004234A8    mov         eax,dword ptr [ebx+4C]
 004234AB    call        dword ptr [ebx+48]
 004234AE    mov         al,1
 004234B0    pop         ebx
 004234B1    ret
 004234B2    xor         eax,eax
 004234B4    pop         ebx
 004234B5    ret
*}
end;

//004234B8
procedure TBasicAction.SetOnExecute(Value:TNotifyEvent);
begin
{*
 004234B8    push        ebp
 004234B9    mov         ebp,esp
 004234BB    push        ebx
 004234BC    push        esi
 004234BD    push        edi
 004234BE    mov         ebx,eax
 004234C0    mov         eax,dword ptr [ebp+8]
 004234C3    cmp         eax,dword ptr [ebx+40]
>004234C6    jne         004234D0
 004234C8    mov         eax,dword ptr [ebp+0C]
 004234CB    cmp         eax,dword ptr [ebx+44]
>004234CE    je          0042350A
 004234D0    mov         eax,dword ptr [ebx+50]
 004234D3    mov         esi,dword ptr [eax+8]
 004234D6    dec         esi
 004234D7    test        esi,esi
>004234D9    jl          004234F7
 004234DB    inc         esi
 004234DC    xor         edi,edi
 004234DE    push        dword ptr [ebp+0C]
 004234E1    push        dword ptr [ebp+8]
 004234E4    mov         edx,edi
 004234E6    mov         eax,dword ptr [ebx+50]
 004234E9    call        TList.Get
 004234EE    mov         edx,dword ptr [eax]
 004234F0    call        dword ptr [edx+10]
 004234F3    inc         edi
 004234F4    dec         esi
>004234F5    jne         004234DE
 004234F7    mov         eax,dword ptr [ebp+8]
 004234FA    mov         dword ptr [ebx+40],eax
 004234FD    mov         eax,dword ptr [ebp+0C]
 00423500    mov         dword ptr [ebx+44],eax
 00423503    mov         eax,ebx
 00423505    mov         edx,dword ptr [eax]
 00423507    call        dword ptr [edx+30]
 0042350A    pop         edi
 0042350B    pop         esi
 0042350C    pop         ebx
 0042350D    pop         ebp
 0042350E    ret         8
*}
end;

//00423514
procedure TBasicAction.Change;
begin
{*
 00423514    push        ebx
 00423515    cmp         word ptr [eax+3A],0
>0042351A    je          00423526
 0042351C    mov         ebx,eax
 0042351E    mov         edx,eax
 00423520    mov         eax,dword ptr [ebx+3C]
 00423523    call        dword ptr [ebx+38]
 00423526    pop         ebx
 00423527    ret
*}
end;

//00423528
procedure TBasicAction.RegisterChanges(Value:TBasicActionLink);
begin
{*
 00423528    mov         dword ptr [edx+10],eax
 0042352B    mov         eax,dword ptr [eax+50]
 0042352E    call        TList.Add
 00423533    ret
*}
end;

//00423534
procedure TBasicAction.UnRegisterChanges(Value:TBasicActionLink);
begin
{*
 00423534    push        ebx
 00423535    push        esi
 00423536    push        edi
 00423537    push        ebp
 00423538    mov         ebp,edx
 0042353A    mov         edi,eax
 0042353C    mov         eax,dword ptr [edi+50]
 0042353F    mov         esi,dword ptr [eax+8]
 00423542    dec         esi
 00423543    test        esi,esi
>00423545    jl          0042356D
 00423547    inc         esi
 00423548    xor         ebx,ebx
 0042354A    mov         eax,dword ptr [edi+50]
 0042354D    mov         edx,ebx
 0042354F    call        TList.Get
 00423554    cmp         ebp,eax
>00423556    jne         00423569
 00423558    xor         eax,eax
 0042355A    mov         dword ptr [ebp+10],eax
 0042355D    mov         eax,dword ptr [edi+50]
 00423560    mov         edx,ebx
 00423562    call        TList.Delete
>00423567    jmp         0042356D
 00423569    inc         ebx
 0042356A    dec         esi
>0042356B    jne         0042354A
 0042356D    pop         ebp
 0042356E    pop         edi
 0042356F    pop         esi
 00423570    pop         ebx
 00423571    ret
*}
end;

//00423574
procedure TBasicAction.SetActionComponent(const Value:TComponent);
begin
{*
 00423574    push        ebx
 00423575    push        esi
 00423576    mov         esi,edx
 00423578    mov         ebx,eax
 0042357A    mov         eax,dword ptr [ebx+30]
 0042357D    cmp         esi,eax
>0042357F    je          0042359C
 00423581    test        eax,eax
>00423583    je          0042358C
 00423585    mov         edx,ebx
 00423587    call        TComponent.RemoveFreeNotification
 0042358C    mov         eax,esi
 0042358E    mov         dword ptr [ebx+30],eax
 00423591    test        eax,eax
>00423593    je          0042359C
 00423595    mov         edx,ebx
 00423597    call        TComponent.FreeNotification
 0042359C    pop         esi
 0042359D    pop         ebx
 0042359E    ret
*}
end;

//004235A0
constructor TStreamAdapter.Create(Stream:TStream; Ownership:TStreamOwnership);
begin
{*
 004235A0    push        ebp
 004235A1    mov         ebp,esp
 004235A3    push        ebx
 004235A4    push        esi
 004235A5    push        edi
 004235A6    test        dl,dl
>004235A8    je          004235B2
 004235AA    add         esp,0FFFFFFF0
 004235AD    call        @ClassCreate
 004235B2    mov         esi,ecx
 004235B4    mov         ebx,edx
 004235B6    mov         edi,eax
 004235B8    xor         edx,edx
 004235BA    mov         eax,edi
 004235BC    call        TObject.Create
 004235C1    mov         dword ptr [edi+0C],esi
 004235C4    mov         al,byte ptr [ebp+8]
 004235C7    mov         byte ptr [edi+10],al
 004235CA    mov         eax,edi
 004235CC    test        bl,bl
>004235CE    je          004235DF
 004235D0    call        @AfterConstruction
 004235D5    pop         dword ptr fs:[0]
 004235DC    add         esp,0C
 004235DF    mov         eax,edi
 004235E1    pop         edi
 004235E2    pop         esi
 004235E3    pop         ebx
 004235E4    pop         ebp
 004235E5    ret         4
*}
end;

//004235E8
destructor TStreamAdapter.Destroy;
begin
{*
 004235E8    push        ebx
 004235E9    push        esi
 004235EA    call        @BeforeDestruction
 004235EF    mov         ebx,edx
 004235F1    mov         esi,eax
 004235F3    cmp         byte ptr [esi+10],1
>004235F7    jne         00423606
 004235F9    mov         eax,dword ptr [esi+0C]
 004235FC    call        TObject.Free
 00423601    xor         eax,eax
 00423603    mov         dword ptr [esi+0C],eax
 00423606    mov         edx,ebx
 00423608    and         dl,0FC
 0042360B    mov         eax,esi
 0042360D    call        TObject.Destroy
 00423612    test        bl,bl
>00423614    jle         0042361D
 00423616    mov         eax,esi
 00423618    call        @ClassDestroy
 0042361D    pop         esi
 0042361E    pop         ebx
 0042361F    ret
*}
end;

//00423620
function TStreamAdapter.Read(pv:Pointer; cb:Longint; pcbRead:PLongint):HRESULT; stdcall;
begin
{*
 00423620    push        ebp
 00423621    mov         ebp,esp
 00423623    push        ebx
 00423624    push        esi
 00423625    push        edi
 00423626    mov         edx,dword ptr [ebp+0C]
 00423629    mov         eax,dword ptr [ebp+8]
 0042362C    xor         ecx,ecx
 0042362E    push        ebp
 0042362F    push        42366F
 00423634    push        dword ptr fs:[ecx]
 00423637    mov         dword ptr fs:[ecx],esp
 0042363A    test        edx,edx
>0042363C    jne         0042364D
 0042363E    mov         ebx,80030009
 00423643    xor         eax,eax
 00423645    pop         edx
 00423646    pop         ecx
 00423647    pop         ecx
 00423648    mov         dword ptr fs:[eax],edx
>0042364B    jmp         0042367E
 0042364D    mov         eax,dword ptr [eax+0C]
 00423650    mov         ecx,dword ptr [ebp+10]
 00423653    mov         ebx,dword ptr [eax]
 00423655    call        dword ptr [ebx+0C]
 00423658    cmp         dword ptr [ebp+14],0
>0042365C    je          00423663
 0042365E    mov         edx,dword ptr [ebp+14]
 00423661    mov         dword ptr [edx],eax
 00423663    xor         ebx,ebx
 00423665    xor         eax,eax
 00423667    pop         edx
 00423668    pop         ecx
 00423669    pop         ecx
 0042366A    mov         dword ptr fs:[eax],edx
>0042366D    jmp         0042367E
>0042366F    jmp         @HandleAnyException
 00423674    mov         ebx,1
 00423679    call        @DoneExcept
 0042367E    mov         eax,ebx
 00423680    pop         edi
 00423681    pop         esi
 00423682    pop         ebx
 00423683    pop         ebp
 00423684    ret         10
*}
end;

//00423688
function TStreamAdapter.Write(pv:Pointer; cb:Longint; pcbWritten:PLongint):HRESULT; stdcall;
begin
{*
 00423688    push        ebp
 00423689    mov         ebp,esp
 0042368B    push        ebx
 0042368C    push        esi
 0042368D    push        edi
 0042368E    mov         edx,dword ptr [ebp+0C]
 00423691    mov         eax,dword ptr [ebp+8]
 00423694    xor         ecx,ecx
 00423696    push        ebp
 00423697    push        4236D7
 0042369C    push        dword ptr fs:[ecx]
 0042369F    mov         dword ptr fs:[ecx],esp
 004236A2    test        edx,edx
>004236A4    jne         004236B5
 004236A6    mov         ebx,80030009
 004236AB    xor         eax,eax
 004236AD    pop         edx
 004236AE    pop         ecx
 004236AF    pop         ecx
 004236B0    mov         dword ptr fs:[eax],edx
>004236B3    jmp         004236E6
 004236B5    mov         eax,dword ptr [eax+0C]
 004236B8    mov         ecx,dword ptr [ebp+10]
 004236BB    mov         ebx,dword ptr [eax]
 004236BD    call        dword ptr [ebx+10]
 004236C0    cmp         dword ptr [ebp+14],0
>004236C4    je          004236CB
 004236C6    mov         edx,dword ptr [ebp+14]
 004236C9    mov         dword ptr [edx],eax
 004236CB    xor         ebx,ebx
 004236CD    xor         eax,eax
 004236CF    pop         edx
 004236D0    pop         ecx
 004236D1    pop         ecx
 004236D2    mov         dword ptr fs:[eax],edx
>004236D5    jmp         004236E6
>004236D7    jmp         @HandleAnyException
 004236DC    mov         ebx,80030103
 004236E1    call        @DoneExcept
 004236E6    mov         eax,ebx
 004236E8    pop         edi
 004236E9    pop         esi
 004236EA    pop         ebx
 004236EB    pop         ebp
 004236EC    ret         10
*}
end;

//004236F0
function TStreamAdapter.Seek(dlibMove:Largeint; dwOrigin:Longint; var libNewPosition:Largeint):HRESULT; stdcall;
begin
{*
 004236F0    push        ebp
 004236F1    mov         ebp,esp
 004236F3    add         esp,0FFFFFFF8
 004236F6    push        ebx
 004236F7    push        esi
 004236F8    push        edi
 004236F9    mov         ebx,dword ptr [ebp+14]
 004236FC    mov         esi,dword ptr [ebp+8]
 004236FF    xor         eax,eax
 00423701    push        ebp
 00423702    push        42375A
 00423707    push        dword ptr fs:[eax]
 0042370A    mov         dword ptr fs:[eax],esp
 0042370D    test        ebx,ebx
>0042370F    jl          00423716
 00423711    cmp         ebx,2
>00423714    jle         00423725
 00423716    mov         ebx,80030001
 0042371B    xor         eax,eax
 0042371D    pop         edx
 0042371E    pop         ecx
 0042371F    pop         ecx
 00423720    mov         dword ptr fs:[eax],edx
>00423723    jmp         00423769
 00423725    mov         eax,dword ptr [esi+0C]
 00423728    mov         ecx,ebx
 0042372A    mov         edx,dword ptr [ebp+0C]
 0042372D    mov         ebx,dword ptr [eax]
 0042372F    call        dword ptr [ebx+14]
 00423732    cdq
 00423733    mov         dword ptr [ebp-8],eax
 00423736    mov         dword ptr [ebp-4],edx
 00423739    mov         eax,dword ptr [ebp+18]
 0042373C    test        eax,eax
>0042373E    je          0042374E
 00423740    mov         eax,dword ptr [ebp+18]
 00423743    mov         edx,dword ptr [ebp-8]
 00423746    mov         dword ptr [eax],edx
 00423748    mov         edx,dword ptr [ebp-4]
 0042374B    mov         dword ptr [eax+4],edx
 0042374E    xor         ebx,ebx
 00423750    xor         eax,eax
 00423752    pop         edx
 00423753    pop         ecx
 00423754    pop         ecx
 00423755    mov         dword ptr fs:[eax],edx
>00423758    jmp         00423769
>0042375A    jmp         @HandleAnyException
 0042375F    mov         ebx,80030009
 00423764    call        @DoneExcept
 00423769    mov         eax,ebx
 0042376B    pop         edi
 0042376C    pop         esi
 0042376D    pop         ebx
 0042376E    pop         ecx
 0042376F    pop         ecx
 00423770    pop         ebp
 00423771    ret         14
*}
end;

//00423774
function TStreamAdapter.SetSize(libNewSize:Largeint):HRESULT; stdcall;
begin
{*
 00423774    push        ebp
 00423775    mov         ebp,esp
 00423777    push        ebx
 00423778    push        esi
 00423779    push        edi
 0042377A    mov         ebx,dword ptr [ebp+8]
 0042377D    xor         eax,eax
 0042377F    push        ebp
 00423780    push        4237BD
 00423785    push        dword ptr fs:[eax]
 00423788    mov         dword ptr fs:[eax],esp
 0042378B    push        dword ptr [ebp+10]
 0042378E    push        dword ptr [ebp+0C]
 00423791    mov         eax,dword ptr [ebx+0C]
 00423794    call        TStream.SetSize64
 00423799    mov         eax,dword ptr [ebx+0C]
 0042379C    mov         edx,dword ptr [eax]
 0042379E    call        dword ptr [edx]
 004237A0    cmp         edx,dword ptr [ebp+10]
>004237A3    jne         004237A8
 004237A5    cmp         eax,dword ptr [ebp+0C]
>004237A8    je          004237B1
 004237AA    mov         ebx,80004005
>004237AF    jmp         004237B3
 004237B1    xor         ebx,ebx
 004237B3    xor         eax,eax
 004237B5    pop         edx
 004237B6    pop         ecx
 004237B7    pop         ecx
 004237B8    mov         dword ptr fs:[eax],edx
>004237BB    jmp         004237CC
>004237BD    jmp         @HandleAnyException
 004237C2    mov         ebx,8000FFFF
 004237C7    call        @DoneExcept
 004237CC    mov         eax,ebx
 004237CE    pop         edi
 004237CF    pop         esi
 004237D0    pop         ebx
 004237D1    pop         ebp
 004237D2    ret         0C
*}
end;

//004237D8
function TStreamAdapter.CopyTo(stm:IStream; cb:Largeint; var cbRead:Largeint; var cbWritten:Largeint):HRESULT; stdcall;
begin
{*
 004237D8    push        ebp
 004237D9    mov         ebp,esp
 004237DB    add         esp,0FFFFFFD8
 004237DE    push        ebx
 004237DF    push        esi
 004237E0    push        edi
 004237E1    mov         eax,dword ptr [ebp+0C]
 004237E4    call        @IntfAddRef
 004237E9    xor         eax,eax
 004237EB    push        ebp
 004237EC    push        4239C5
 004237F1    push        dword ptr fs:[eax]
 004237F4    mov         dword ptr fs:[eax],esp
 004237F7    xor         eax,eax
 004237F9    mov         dword ptr [ebp-4],eax
 004237FC    mov         dword ptr [ebp-18],0
 00423803    mov         dword ptr [ebp-14],0
 0042380A    mov         dword ptr [ebp-20],0
 00423811    mov         dword ptr [ebp-1C],0
 00423818    xor         edx,edx
 0042381A    push        ebp
 0042381B    push        42399E
 00423820    push        dword ptr fs:[edx]
 00423823    mov         dword ptr fs:[edx],esp
 00423826    cmp         dword ptr [ebp+14],0
>0042382A    jne         00423837
 0042382C    cmp         dword ptr [ebp+10],100000
>00423833    jbe         00423842
>00423835    jmp         00423839
>00423837    jle         00423842
 00423839    mov         dword ptr [ebp-0C],100000
>00423840    jmp         00423848
 00423842    mov         eax,dword ptr [ebp+10]
 00423845    mov         dword ptr [ebp-0C],eax
 00423848    mov         eax,dword ptr [ebp-0C]
 0042384B    call        @GetMem
 00423850    mov         dword ptr [ebp-8],eax
 00423853    xor         edx,edx
 00423855    push        ebp
 00423856    push        42398D
 0042385B    push        dword ptr fs:[edx]
 0042385E    mov         dword ptr fs:[edx],esp
>00423861    jmp         00423935
 00423866    cmp         dword ptr [ebp+14],0
>0042386A    jne         00423877
 0042386C    cmp         dword ptr [ebp+10],7FFFFFFF
>00423873    jbe         00423880
>00423875    jmp         00423879
>00423877    jle         00423880
 00423879    mov         esi,7FFFFFFF
>0042387E    jmp         00423883
 00423880    mov         esi,dword ptr [ebp+10]
 00423883    test        esi,esi
>00423885    jle         00423935
 0042388B    cmp         esi,dword ptr [ebp-0C]
>0042388E    jle         00423895
 00423890    mov         eax,dword ptr [ebp-0C]
>00423893    jmp         00423897
 00423895    mov         eax,esi
 00423897    mov         edx,dword ptr [ebp-8]
 0042389A    mov         ecx,dword ptr [ebp+8]
 0042389D    mov         ecx,dword ptr [ecx+0C]
 004238A0    xchg        eax,ecx
 004238A1    mov         ebx,dword ptr [eax]
 004238A3    call        dword ptr [ebx+0C]
 004238A6    mov         ebx,eax
 004238A8    test        ebx,ebx
>004238AA    jne         004238BE
 004238AC    call        @TryFinallyExit
 004238B1    xor         eax,eax
 004238B3    pop         edx
 004238B4    pop         ecx
 004238B5    pop         ecx
 004238B6    mov         dword ptr fs:[eax],edx
>004238B9    jmp         004239AF
 004238BE    mov         eax,ebx
 004238C0    cdq
 004238C1    add         dword ptr [ebp-18],eax
 004238C4    adc         dword ptr [ebp-14],edx
 004238C7    mov         dword ptr [ebp-28],0
 004238CE    mov         dword ptr [ebp-24],0
 004238D5    lea         eax,[ebp-28]
 004238D8    push        eax
 004238D9    push        ebx
 004238DA    mov         eax,dword ptr [ebp-8]
 004238DD    push        eax
 004238DE    mov         eax,dword ptr [ebp+0C]
 004238E1    push        eax
 004238E2    mov         eax,dword ptr [eax]
 004238E4    call        dword ptr [eax+10]
 004238E7    mov         dword ptr [ebp-4],eax
 004238EA    mov         eax,dword ptr [ebp-28]
 004238ED    mov         edx,dword ptr [ebp-24]
 004238F0    add         dword ptr [ebp-20],eax
 004238F3    adc         dword ptr [ebp-1C],edx
 004238F6    cmp         dword ptr [ebp-4],0
>004238FA    jne         0042390A
 004238FC    mov         eax,dword ptr [ebp-28]
 004238FF    cmp         ebx,eax
>00423901    je          0042390A
 00423903    mov         dword ptr [ebp-4],80004005
 0042390A    cmp         dword ptr [ebp-4],0
>0042390E    je          00423922
 00423910    call        @TryFinallyExit
 00423915    xor         eax,eax
 00423917    pop         edx
 00423918    pop         ecx
 00423919    pop         ecx
 0042391A    mov         dword ptr fs:[eax],edx
>0042391D    jmp         004239AF
 00423922    sub         esi,ebx
 00423924    mov         eax,ebx
 00423926    cdq
 00423927    sub         dword ptr [ebp+10],eax
 0042392A    sbb         dword ptr [ebp+14],edx
 0042392D    test        esi,esi
>0042392F    jg          0042388B
 00423935    cmp         dword ptr [ebp+14],0
>00423939    jne         00423947
 0042393B    cmp         dword ptr [ebp+10],0
>0042393F    ja          00423866
>00423945    jmp         0042394D
>00423947    jg          00423866
 0042394D    xor         eax,eax
 0042394F    pop         edx
 00423950    pop         ecx
 00423951    pop         ecx
 00423952    mov         dword ptr fs:[eax],edx
 00423955    push        423994
 0042395A    mov         eax,dword ptr [ebp-8]
 0042395D    call        @FreeMem
 00423962    mov         eax,dword ptr [ebp+1C]
 00423965    test        eax,eax
>00423967    je          00423977
 00423969    mov         eax,dword ptr [ebp+1C]
 0042396C    mov         edx,dword ptr [ebp-20]
 0042396F    mov         dword ptr [eax],edx
 00423971    mov         edx,dword ptr [ebp-1C]
 00423974    mov         dword ptr [eax+4],edx
 00423977    mov         eax,dword ptr [ebp+18]
 0042397A    test        eax,eax
>0042397C    je          0042398C
 0042397E    mov         eax,dword ptr [ebp+18]
 00423981    mov         edx,dword ptr [ebp-18]
 00423984    mov         dword ptr [eax],edx
 00423986    mov         edx,dword ptr [ebp-14]
 00423989    mov         dword ptr [eax+4],edx
 0042398C    ret
>0042398D    jmp         @HandleFinally
>00423992    jmp         0042395A
 00423994    xor         eax,eax
 00423996    pop         edx
 00423997    pop         ecx
 00423998    pop         ecx
 00423999    mov         dword ptr fs:[eax],edx
>0042399C    jmp         004239AF
>0042399E    jmp         @HandleAnyException
 004239A3    mov         dword ptr [ebp-4],8000FFFF
 004239AA    call        @DoneExcept
 004239AF    xor         eax,eax
 004239B1    pop         edx
 004239B2    pop         ecx
 004239B3    pop         ecx
 004239B4    mov         dword ptr fs:[eax],edx
 004239B7    push        4239CC
 004239BC    lea         eax,[ebp+0C]
 004239BF    call        @IntfClear
 004239C4    ret
>004239C5    jmp         @HandleFinally
>004239CA    jmp         004239BC
 004239CC    mov         eax,dword ptr [ebp-4]
 004239CF    pop         edi
 004239D0    pop         esi
 004239D1    pop         ebx
 004239D2    mov         esp,ebp
 004239D4    pop         ebp
 004239D5    ret         18
*}
end;

//004239D8
function TStreamAdapter.Commit(grfCommitFlags:Longint):HRESULT; stdcall;
begin
{*
 004239D8    push        ebp
 004239D9    mov         ebp,esp
 004239DB    xor         eax,eax
 004239DD    pop         ebp
 004239DE    ret         8
*}
end;

//004239E4
function TStreamAdapter.Revert:HRESULT; stdcall;
begin
{*
 004239E4    push        ebp
 004239E5    mov         ebp,esp
 004239E7    mov         eax,80030102
 004239EC    pop         ebp
 004239ED    ret         4
*}
end;

//004239F0
function TStreamAdapter.LockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;
begin
{*
 004239F0    push        ebp
 004239F1    mov         ebp,esp
 004239F3    mov         eax,80030001
 004239F8    pop         ebp
 004239F9    ret         18
*}
end;

//004239FC
function TStreamAdapter.UnlockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;
begin
{*
 004239FC    push        ebp
 004239FD    mov         ebp,esp
 004239FF    mov         eax,80030001
 00423A04    pop         ebp
 00423A05    ret         18
*}
end;

//00423A08
function TStreamAdapter.Stat(var statstg:TStatStg; grfStatFlag:Longint):HRESULT; stdcall;
begin
{*
 00423A08    push        ebp
 00423A09    mov         ebp,esp
 00423A0B    push        ebx
 00423A0C    push        esi
 00423A0D    push        edi
 00423A0E    mov         ebx,dword ptr [ebp+0C]
 00423A11    mov         edi,dword ptr [ebp+8]
 00423A14    xor         esi,esi
 00423A16    xor         eax,eax
 00423A18    push        ebp
 00423A19    push        423A6B
 00423A1E    push        dword ptr fs:[eax]
 00423A21    mov         dword ptr fs:[eax],esp
 00423A24    test        ebx,ebx
>00423A26    je          00423A61
 00423A28    mov         dword ptr [ebx+4],2
 00423A2F    mov         eax,dword ptr [edi+0C]
 00423A32    mov         edx,dword ptr [eax]
 00423A34    call        dword ptr [edx]
 00423A36    mov         dword ptr [ebx+8],eax
 00423A39    mov         dword ptr [ebx+0C],edx
 00423A3C    xor         eax,eax
 00423A3E    mov         dword ptr [ebx+10],eax
 00423A41    xor         eax,eax
 00423A43    mov         dword ptr [ebx+14],eax
 00423A46    xor         eax,eax
 00423A48    mov         dword ptr [ebx+18],eax
 00423A4B    xor         eax,eax
 00423A4D    mov         dword ptr [ebx+1C],eax
 00423A50    xor         eax,eax
 00423A52    mov         dword ptr [ebx+20],eax
 00423A55    xor         eax,eax
 00423A57    mov         dword ptr [ebx+24],eax
 00423A5A    mov         dword ptr [ebx+2C],1
 00423A61    xor         eax,eax
 00423A63    pop         edx
 00423A64    pop         ecx
 00423A65    pop         ecx
 00423A66    mov         dword ptr fs:[eax],edx
>00423A69    jmp         00423A7A
>00423A6B    jmp         @HandleAnyException
 00423A70    mov         esi,8000FFFF
 00423A75    call        @DoneExcept
 00423A7A    mov         eax,esi
 00423A7C    pop         edi
 00423A7D    pop         esi
 00423A7E    pop         ebx
 00423A7F    pop         ebp
 00423A80    ret         0C
*}
end;

//00423A84
function TStreamAdapter.Clone(var stm:IStream):HRESULT; stdcall;
begin
{*
 00423A84    push        ebp
 00423A85    mov         ebp,esp
 00423A87    mov         eax,dword ptr [ebp+0C]
 00423A8A    test        eax,eax
>00423A8C    je          00423A92
 00423A8E    xor         edx,edx
 00423A90    mov         dword ptr [eax],edx
 00423A92    mov         eax,80004001
 00423A97    pop         ebp
 00423A98    ret         8
*}
end;

//00423A9C
procedure FreeIntConstList;
begin
{*
 00423A9C    push        ebp
 00423A9D    mov         ebp,esp
 00423A9F    push        ebx
 00423AA0    push        esi
 00423AA1    push        edi
 00423AA2    mov         eax,[005E0928];IntConstList:TThreadList
 00423AA7    call        TThreadList.LockList
 00423AAC    mov         edi,eax
 00423AAE    xor         eax,eax
 00423AB0    push        ebp
 00423AB1    push        423AF1
 00423AB6    push        dword ptr fs:[eax]
 00423AB9    mov         dword ptr fs:[eax],esp
 00423ABC    mov         ebx,dword ptr [edi+8]
 00423ABF    dec         ebx
 00423AC0    test        ebx,ebx
>00423AC2    jl          00423AD9
 00423AC4    inc         ebx
 00423AC5    xor         esi,esi
 00423AC7    mov         edx,esi
 00423AC9    mov         eax,edi
 00423ACB    call        TList.Get
 00423AD0    call        TObject.Free
 00423AD5    inc         esi
 00423AD6    dec         ebx
>00423AD7    jne         00423AC7
 00423AD9    xor         eax,eax
 00423ADB    pop         edx
 00423ADC    pop         ecx
 00423ADD    pop         ecx
 00423ADE    mov         dword ptr fs:[eax],edx
 00423AE1    push        423AF8
 00423AE6    mov         eax,[005E0928];IntConstList:TThreadList
 00423AEB    call        TThreadList.UnlockList
 00423AF0    ret
>00423AF1    jmp         @HandleFinally
>00423AF6    jmp         00423AE6
 00423AF8    mov         eax,[005E0928];IntConstList:TThreadList
 00423AFD    call        TObject.Free
 00423B02    pop         edi
 00423B03    pop         esi
 00423B04    pop         ebx
 00423B05    pop         ebp
 00423B06    ret
*}
end;

//00423B08
procedure ModuleUnload(Instance:Longint);
begin
{*
 00423B08    call        UnRegisterModuleClasses
 00423B0D    ret
*}
end;

//00423B10
function StdWndProc(Window:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;
begin
{*
 00423B10    push        ebp
 00423B11    mov         ebp,esp
 00423B13    xor         eax,eax
 00423B15    push        eax
 00423B16    push        dword ptr [ebp+14]
 00423B19    push        dword ptr [ebp+10]
 00423B1C    push        dword ptr [ebp+0C]
 00423B1F    mov         edx,esp
 00423B21    mov         eax,dword ptr [ecx+4]
 00423B24    call        dword ptr [ecx]
 00423B26    add         esp,0C
 00423B29    pop         eax
 00423B2A    pop         ebp
 00423B2B    ret         10
*}
end;

//00423B30
function CalcJmpOffset(Src:Pointer; Dest:Pointer):Longint;
begin
{*
 00423B30    add         eax,5
 00423B33    sub         edx,eax
 00423B35    mov         eax,edx
 00423B37    ret
*}
end;

//00423B38
function MakeObjectInstance(Method:TWndMethod):Pointer;
begin
{*
 00423B38    push        ebp
 00423B39    mov         ebp,esp
 00423B3B    push        ebx
 00423B3C    push        esi
 00423B3D    push        edi
 00423B3E    mov         edi,5E0954;InstFreeList:PObjectInstance
 00423B43    cmp         dword ptr [edi],0
>00423B46    jne         00423BB4
 00423B48    push        40
 00423B4A    push        1000
 00423B4F    push        1000
 00423B54    push        0
 00423B56    call        KERNEL32.VirtualAlloc
 00423B5B    mov         esi,eax
 00423B5D    mov         eax,[005E0950];InstBlockList:PInstanceBlock
 00423B62    mov         dword ptr [esi],eax
 00423B64    lea         edx,[esi+4]
 00423B67    mov         eax,5AC520
 00423B6C    mov         ecx,2
 00423B71    call        Move
 00423B76    mov         edx,423B10;StdWndProc:Longint
 00423B7B    lea         eax,[esi+5]
 00423B7E    call        CalcJmpOffset
 00423B83    mov         dword ptr [esi+6],eax
 00423B86    lea         ebx,[esi+0A]
 00423B89    mov         byte ptr [ebx],0E8
 00423B8C    lea         edx,[esi+4]
 00423B8F    mov         eax,ebx
 00423B91    call        CalcJmpOffset
 00423B96    mov         dword ptr [ebx+1],eax
 00423B99    mov         eax,dword ptr [edi]
 00423B9B    mov         dword ptr [ebx+5],eax
 00423B9E    mov         dword ptr [edi],ebx
 00423BA0    add         ebx,0D
 00423BA3    mov         eax,ebx
 00423BA5    sub         eax,esi
 00423BA7    cmp         eax,0FFC
>00423BAC    jl          00423B89
 00423BAE    mov         dword ptr ds:[5E0950],esi;InstBlockList:PInstanceBlock
 00423BB4    mov         eax,dword ptr [edi]
 00423BB6    mov         ebx,dword ptr [edi]
 00423BB8    mov         edx,dword ptr [ebx+5]
 00423BBB    mov         dword ptr [edi],edx
 00423BBD    mov         edx,dword ptr [ebp+8]
 00423BC0    mov         dword ptr [ebx+5],edx
 00423BC3    mov         edx,dword ptr [ebp+0C]
 00423BC6    mov         dword ptr [ebx+9],edx
 00423BC9    pop         edi
 00423BCA    pop         esi
 00423BCB    pop         ebx
 00423BCC    pop         ebp
 00423BCD    ret         8
*}
end;

//00423BD0
procedure FreeObjectInstance(ObjectInstance:Pointer);
begin
{*
 00423BD0    test        eax,eax
>00423BD2    je          00423BE2
 00423BD4    mov         edx,dword ptr ds:[5E0954];InstFreeList:PObjectInstance
 00423BDA    mov         dword ptr [eax+5],edx
 00423BDD    mov         [005E0954],eax;InstFreeList:PObjectInstance
 00423BE2    ret
*}
end;

//00423BE4
procedure _NF__E7C;
begin
{*
 00423BE4    push        esp
 00423BE5    push        eax
 00423BE6    push        ebp
>00423BE7    je          00423C52
 00423BE9    ins         byte ptr [edi],dl
 00423BEA    push        edi
 00423BEB    imul        ebp,dword ptr [esi+64],776F
 00423BF2    add         byte ptr [eax],al
 00423BF4    push        ebp
 00423BF5    mov         ebp,esp
 00423BF7    add         esp,0FFFFFFD8
 00423BFA    push        ebx
 00423BFB    mov         eax,[005AF664];gvar_005AF664
 00423C00    mov         [005AC534],eax
 00423C05    lea         eax,[ebp-28]
 00423C08    push        eax
 00423C09    mov         eax,[005AC548];^_NF__E7C
 00423C0E    push        eax
 00423C0F    mov         eax,[005AF664];gvar_005AF664
 00423C14    push        eax
 00423C15    call        user32.GetClassInfoA
 00423C1A    cmp         eax,1
 00423C1D    sbb         eax,eax
 00423C1F    inc         eax
 00423C20    test        al,al
>00423C22    je          00423C2E
 00423C24    mov         edx,406FDC;user32.DefWindowProcA:Longint
 00423C29    cmp         edx,dword ptr [ebp-24]
>00423C2C    je          00423C4D
 00423C2E    test        al,al
>00423C30    je          00423C43
 00423C32    mov         eax,[005AF664];gvar_005AF664
 00423C37    push        eax
 00423C38    mov         eax,[005AC548];^_NF__E7C
 00423C3D    push        eax
 00423C3E    call        user32.UnregisterClassA
 00423C43    push        5AC524
 00423C48    call        user32.RegisterClassA
 00423C4D    push        80000000
 00423C52    push        0
 00423C54    push        0
 00423C56    push        0
 00423C58    push        0
 00423C5A    push        0
 00423C5C    push        0
 00423C5E    mov         eax,[005AF664];gvar_005AF664
 00423C63    push        eax
 00423C64    push        0
 00423C66    mov         ecx,423CA4
 00423C6B    mov         edx,dword ptr ds:[5AC548];^_NF__E7C
 00423C71    mov         eax,80
 00423C76    call        CreateWindowEx
 00423C7B    mov         ebx,eax
 00423C7D    cmp         word ptr [ebp+0A],0
>00423C82    je          00423C98
 00423C84    push        dword ptr [ebp+0C]
 00423C87    push        dword ptr [ebp+8]
 00423C8A    call        MakeObjectInstance
 00423C8F    push        eax
 00423C90    push        0FC
 00423C92    push        ebx
 00423C93    call        user32.SetWindowLongA
 00423C98    mov         eax,ebx
 00423C9A    pop         ebx
 00423C9B    mov         esp,ebp
 00423C9D    pop         ebp
 00423C9E    ret         8
*}
end;

//00423BF4
function AllocateHWnd(Method:TWndMethod):HWND;
begin
{*
 00423BF4    push        ebp
 00423BF5    mov         ebp,esp
 00423BF7    add         esp,0FFFFFFD8
 00423BFA    push        ebx
 00423BFB    mov         eax,[005AF664];gvar_005AF664
 00423C00    mov         [005AC534],eax
 00423C05    lea         eax,[ebp-28]
 00423C08    push        eax
 00423C09    mov         eax,[005AC548];^_NF__E7C
 00423C0E    push        eax
 00423C0F    mov         eax,[005AF664];gvar_005AF664
 00423C14    push        eax
 00423C15    call        user32.GetClassInfoA
 00423C1A    cmp         eax,1
 00423C1D    sbb         eax,eax
 00423C1F    inc         eax
 00423C20    test        al,al
>00423C22    je          00423C2E
 00423C24    mov         edx,406FDC;user32.DefWindowProcA:Longint
 00423C29    cmp         edx,dword ptr [ebp-24]
>00423C2C    je          00423C4D
 00423C2E    test        al,al
>00423C30    je          00423C43
 00423C32    mov         eax,[005AF664];gvar_005AF664
 00423C37    push        eax
 00423C38    mov         eax,[005AC548];^_NF__E7C
 00423C3D    push        eax
 00423C3E    call        user32.UnregisterClassA
 00423C43    push        5AC524
 00423C48    call        user32.RegisterClassA
 00423C4D    push        80000000
 00423C52    push        0
 00423C54    push        0
 00423C56    push        0
 00423C58    push        0
 00423C5A    push        0
 00423C5C    push        0
 00423C5E    mov         eax,[005AF664];gvar_005AF664
 00423C63    push        eax
 00423C64    push        0
 00423C66    mov         ecx,423CA4
 00423C6B    mov         edx,dword ptr ds:[5AC548];^_NF__E7C
 00423C71    mov         eax,80
 00423C76    call        CreateWindowEx
 00423C7B    mov         ebx,eax
 00423C7D    cmp         word ptr [ebp+0A],0
>00423C82    je          00423C98
 00423C84    push        dword ptr [ebp+0C]
 00423C87    push        dword ptr [ebp+8]
 00423C8A    call        MakeObjectInstance
 00423C8F    push        eax
 00423C90    push        0FC
 00423C92    push        ebx
 00423C93    call        user32.SetWindowLongA
 00423C98    mov         eax,ebx
 00423C9A    pop         ebx
 00423C9B    mov         esp,ebp
 00423C9D    pop         ebp
 00423C9E    ret         8
*}
end;

//00423CA8
procedure DeallocateHWnd(Wnd:HWND);
begin
{*
 00423CA8    push        ebx
 00423CA9    push        esi
 00423CAA    mov         esi,eax
 00423CAC    push        0FC
 00423CAE    push        esi
 00423CAF    call        user32.GetWindowLongA
 00423CB4    mov         ebx,eax
 00423CB6    push        esi
 00423CB7    call        user32.DestroyWindow
 00423CBC    cmp         ebx,406FDC;user32.DefWindowProcA:Longint
>00423CC2    je          00423CCB
 00423CC4    mov         eax,ebx
 00423CC6    call        FreeObjectInstance
 00423CCB    pop         esi
 00423CCC    pop         ebx
 00423CCD    ret
*}
end;

Initialization
//00423D80
{*
 00423D80    push        ebp
 00423D81    mov         ebp,esp
 00423D83    xor         eax,eax
 00423D85    push        ebp
 00423D86    push        423E09
 00423D8B    push        dword ptr fs:[eax]
 00423D8E    mov         dword ptr fs:[eax],esp
 00423D91    sub         dword ptr ds:[5E0924],1
>00423D98    jae         00423DFB
 00423D9A    call        InitThreadSynchronization
 00423D9F    mov         eax,423B08;ModuleUnload
 00423DA4    call        AddModuleUnloadProc
 00423DA9    mov         dl,1
 00423DAB    mov         eax,[00409784];TMultiReadExclusiveWriteSynchronizer
 00423DB0    call        TMultiReadExclusiveWriteSynchronizer.Create
 00423DB5    mov         edx,eax
 00423DB7    test        edx,edx
>00423DB9    je          00423DBE
 00423DBB    sub         edx,0FFFFFFD4
 00423DBE    mov         eax,5E0918;GlobalNameSpace:IReadWriteSync
 00423DC3    call        @IntfCopy
 00423DC8    mov         dl,1
 00423DCA    mov         eax,[00419028];TRegGroups
 00423DCF    call        TRegGroups.Create
 00423DD4    mov         [005E092C],eax;RegGroups:TRegGroups
 00423DD9    mov         dl,1
 00423DDB    mov         eax,[00417D50];TThreadList
 00423DE0    call        TThreadList.Create
 00423DE5    mov         [005E0928],eax;IntConstList:TThreadList
 00423DEA    mov         dl,1
 00423DEC    mov         eax,[00417D50];TThreadList
 00423DF1    call        TThreadList.Create
 00423DF6    mov         [005E0934],eax;GlobalFixupList:TThreadList
 00423DFB    xor         eax,eax
 00423DFD    pop         edx
 00423DFE    pop         ecx
 00423DFF    pop         ecx
 00423E00    mov         dword ptr fs:[eax],edx
 00423E03    push        423E10
 00423E08    ret
>00423E09    jmp         @HandleFinally
>00423E0E    jmp         00423E08
 00423E10    pop         ebp
 00423E11    ret
*}
Finalization
//00423CD0
{*
 00423CD0    push        ebp
 00423CD1    mov         ebp,esp
 00423CD3    xor         eax,eax
 00423CD5    push        ebp
 00423CD6    push        423D74
 00423CDB    push        dword ptr fs:[eax]
 00423CDE    mov         dword ptr fs:[eax],esp
 00423CE1    inc         dword ptr ds:[5E0924]
>00423CE7    jne         00423D66
 00423CE9    mov         eax,[005AF664];gvar_005AF664
 00423CEE    call        UnRegisterModuleClasses
 00423CF3    mov         eax,[005E0918];GlobalNameSpace:IReadWriteSync
 00423CF8    mov         edx,dword ptr [eax]
 00423CFA    call        dword ptr [edx+14]
 00423CFD    call        FreeIntConstList
 00423D02    xor         edx,edx
 00423D04    xor         eax,eax
 00423D06    call        RemoveFixupReferences
 00423D0B    mov         eax,5E0934;GlobalFixupList:TThreadList
 00423D10    call        FreeAndNil
 00423D15    call        @GetTls
 00423D1A    lea         eax,[eax+0C];{GlobalLists:TList}
 00423D20    call        FreeAndNil
 00423D25    mov         eax,5E092C;RegGroups:TRegGroups
 00423D2A    call        FreeAndNil
 00423D2F    mov         eax,5E0918;GlobalNameSpace:IReadWriteSync
 00423D34    call        @IntfClear
 00423D39    mov         eax,423B08;ModuleUnload
 00423D3E    call        RemoveModuleUnloadProc
 00423D43    mov         eax,5AC51C
 00423D48    call        FreeAndNil
 00423D4D    call        DoneThreadSynchronization
 00423D52    mov         eax,5E0930;FindGlobalComponentProcs:TList
 00423D57    call        FreeAndNil
 00423D5C    mov         eax,5E0918;GlobalNameSpace:IReadWriteSync
 00423D61    call        @IntfClear
 00423D66    xor         eax,eax
 00423D68    pop         edx
 00423D69    pop         ecx
 00423D6A    pop         ecx
 00423D6B    mov         dword ptr fs:[eax],edx
 00423D6E    push        423D7B
 00423D73    ret
>00423D74    jmp         @HandleFinally
>00423D79    jmp         00423D73
 00423D7B    pop         ebp
 00423D7C    ret
*}
end.