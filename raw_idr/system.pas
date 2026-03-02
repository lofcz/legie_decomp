//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit system;

interface

uses
  SysUtils, Classes;

type
  Boolean = (False, True);
  TObject = class()
    function ClassType:TClass;//00403964
    function ClassName:ShortString;//0040396C
    function ClassNameIs(const Name:AnsiString):Boolean;//00403980
    function ClassParent:TClass;//004039A8
    function InstanceSize:Integer;//004039E4
    constructor Create;//004039EC
    procedure Free;//00403A1C
    function InitInstance(Instance:Pointer):TObject;//00403A28
    procedure CleanupInstance;//00403A80
    function GetInterface(const IID:TGUID; var Obj:void ):Boolean;//00403AD0
    function GetInterfaceEntry(const IID:TGUID):PInterfaceEntry;//00403B64
    function InheritsFrom(AClass:TClass):Boolean;//00403C48
    function ClassInfo:Pointer;//00403C5C
    function MethodAddress(const Name:ShortString):Pointer;//00403CA0
    function MethodName(Address:Pointer):ShortString;//00403CF0
    function FieldAddress(const Name:ShortString):Pointer;//00403D30
  end;
  TInterfacedObject = class(TObject)
  public
    FRefCount:Integer;//f4
    function _AddRef:Integer; stdcall;//00406190
    function _Release:Integer; stdcall;//004061A4
  end;
    function CloseHandle:Integer; stdcall;//00401224
    function CreateFileA(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;//0040122C
    function GetFileType:DWORD; stdcall;//00401234
    function GetFileSize(x:Integer):Integer; stdcall;//0040123C
    function GetStdHandle:Integer; stdcall;//00401244
    procedure RaiseException(dwExceptionFlags:DWORD; nNumberOfArguments:DWORD; lpArguments:PDWORD); stdcall;//0040124C
    function ReadFile(var Buffer:void ; nNumberOfBytesToRead:Cardinal; var lpNumberOfBytesRead:Cardinal; lpOverlapped:Pointer):Integer; stdcall;//00401254
    procedure RtlUnwind;//0040125C
    function SetEndOfFile:LongBool; stdcall;//00401264
    function SetFilePointer(Distance:Integer; DistanceHigh:Pointer; MoveMethod:Integer):Integer; stdcall;//0040126C
    function UnhandledExceptionFilter:Longint; stdcall;//00401274
    function WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;//0040127C
    function CharNextA:PAnsiChar; stdcall;//00401284
    procedure ExitProcess; stdcall;//0040128C
    function MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:LongWord):Integer; stdcall;//00401294
    procedure FindClose;//0040129C
    function FindFirstFileA(var lpFindFileData:_WIN32_FIND_DATAA):THandle; stdcall;//004012A4
    function FreeLibrary:LongBool; stdcall;//004012AC
    function GetCommandLineA:PAnsiChar;//004012B4
    function GetLastError:Integer;//004012BC
    function GetLocaleInfoA(LCType:DWORD; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;//004012C4
    function GetModuleFileNameA(lpFilename:PAnsiChar; nSize:DWORD):DWORD; stdcall;//004012CC
    function GetModuleHandleA:HMODULE; stdcall;//004012D4
    function GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;//004012DC
    procedure GetStartupInfoA; stdcall;//004012E4
    function GetThreadLocale:Integer;//004012EC
    function LoadLibraryExA(hFile:THandle; dwFlags:DWORD):HMODULE; stdcall;//004012F4
    function LoadStringA(uID:LongWord; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;//004012FC
    function lstrcpynA(lpString2:PAnsiChar; iMaxLength:Integer):PAnsiChar; stdcall;//00401304
    function lstrlenA:Integer; stdcall;//0040130C
    function MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;//00401314
    function RegCloseKey:Integer; stdcall;//0040131C
    function RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:DWORD; samDesired:DWORD; var phkResult:HKEY):Longint; stdcall;//00401324
    function RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;//0040132C
    function WideCharToMultiByte(dwFlags:DWORD; lpWideCharStr:PWideChar; cchWideChar:Integer; lpMultiByteStr:PAnsiChar; cchMultiByte:Integer; lpDefaultChar:PAnsiChar; lpUsedDefaultChar:PBOOL):Integer; stdcall;//00401334
    function VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;//0040133C
    function SysAllocStringLen(Len:Integer):PWideChar; stdcall;//00401344
    function SysReAllocStringLen(psz:PWideChar; len:Integer):Integer; stdcall;//0040134C
    procedure SysFreeString; stdcall;//00401354
    function InterlockedIncrement:Integer; stdcall;//0040135C
    function InterlockedDecrement:Integer;//00401364
    function GetCurrentThreadId:Cardinal;//0040136C
    function GetVersion:DWORD;//00401374
    function QueryPerformanceCounter:LongBool; stdcall;//0040137C
    function GetTickCount:Cardinal;//00401384
    function GetCmdShow:Integer;//0040138C
    function LocalAlloc(size:Integer):Pointer; stdcall;//004013B0
    function LocalFree:Pointer; stdcall;//004013B8
    function VirtualAlloc(dwSize:DWORD; flAllocationType:DWORD; flProtect:DWORD):Pointer; stdcall;//004013C0
    function VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;//004013C8
    procedure InitializeCriticalSection; stdcall;//004013D0
    procedure EnterCriticalSection; stdcall;//004013D8
    procedure LeaveCriticalSection; stdcall;//004013E0
    procedure DeleteCriticalSection; stdcall;//004013E8
    function GetBlockDesc:PBlockDesc;//004013F0
    procedure MakeEmpty(bd:PBlockDesc);//00401440
    function AddBlockAfter(prev:PBlockDesc; const b:TBlock):Boolean;//00401448
    procedure DeleteBlock(bd:PBlockDesc);//00401478
    function MergeBlockAfter(prev:PBlockDesc; const b:TBlock):TBlock;//00401490
    function RemoveBlock(bd:PBlockDesc; const b:TBlock):Boolean;//00401500
    function GetSpace(minSize:Integer):TBlock;//00401594
    function GetSpaceAt(addr:PAnsiChar; minSize:Integer):TBlock;//004015F8
    function FreeSpace(addr:Pointer; maxSize:Integer):TBlock;//00401670
    function Commit(addr:Pointer; minSize:Integer):TBlock;//00401728
    function Decommit(addr:Pointer; maxSize:Integer):TBlock;//004017BC
    function GetCommitted(minSize:Integer):TBlock;//0040183C
    function GetCommittedAt(addr:PAnsiChar; minSize:Integer):TBlock;//004018CC
    function FreeCommitted(addr:PAnsiChar; maxSize:Integer):TBlock;//004019F0
    function InitAllocator:Boolean;//00401A7C
    procedure UninitAllocator;//00401B40
    procedure DeleteFree(f:PFree);//00401C20
    function FindCommitted(addr:PAnsiChar):PBlockDesc;//00401C84
    procedure FillBeforeGap(a:PAnsiChar; size:Integer);//00401CB4
    procedure InternalFreeMem(a:PAnsiChar);//00401CE4
    procedure FillAfterGap(a:PAnsiChar; size:Integer);//00401D08
    function FillerSizeBeforeGap(a:PAnsiChar):Integer;//00401D30
    function FillerSizeAfterGap(a:PAnsiChar):Integer;//00401DA0
    function DecommitFree(a:PAnsiChar; size:Integer):Boolean;//00401DD8
    procedure InsertFree(a:Pointer; size:Integer);//00401E88
    procedure FreeCurAlloc;//00401F10
    function MergeCommit(b:TBlock):Boolean;//00401F5C
    function NewCommit(minSize:Integer):Boolean;//00401FE8
    function NewCommitAt(addr:Pointer; minSize:Integer):Boolean;//00402014
    function SearchSmallBlocks(size:Integer):PFree;//00402048
    function TryHarder(size:Integer):Pointer;//00402074
    function SysGetMem(Size:Integer):Pointer;//00402168
    function SysFreeMem(P:Pointer):Integer;//004022F8
    function ResizeInPlace(p:Pointer; newSize:Integer):Boolean;//0040249C
    function SysReallocMem(P:Pointer; Size:Integer):Pointer;//00402678
    function @GetMem(size:Integer):Pointer;//0040273C
    function @FreeMem(p:Pointer):Integer;//0040275C
    function @ReallocMem(var P:Pointer; NewSize:Integer):Pointer;//0040277C
    procedure GetMemoryManager(var MemMgr:TMemoryManager);//004027CC
    procedure SetMemoryManager(const MemMgr:TMemoryManager);//004027E8
    function IsMemoryManagerSet:Boolean;//00402804
    function ExceptObject:TObject;//00402834
    function ExceptAddr:Pointer;//00402854
    function AcquireExceptionObject:Pointer;//00402874
    procedure RunErrorAt(ErrCode:Integer; ErrorAtAddr:Pointer);//004028A8
    procedure ErrorAt(ErrorCode:Byte; ErrorAddr:Pointer);//004028B4
    procedure Error(errorCode:TRuntimeError);//00402900
    procedure @_IOTest;//0040290C
    procedure SetInOutRes(NewValue:Integer);//0040292C
    procedure InOutError;//0040293C
    procedure @Copy(S:ShortString; Index:Integer; Count:Integer; Result:ShortString);//00402948
    function IOResult:Integer;//0040298C
    procedure Move(const Source:void ; var Dest:void ; Count:Integer);//004029AC
    function GetParamStr(P:PAnsiChar; var Param:AnsiString):PAnsiChar;//004029EC
    function ParamStr(Index:Integer):String;//00402AD8
    procedure Randomize;//00402B38
    function UpCase(Ch:Char):Char;//00402B60
    procedure Set8087CW(NewCW:Word);//00402B6C
    function Get8087CW:Word;//00402B7C
    procedure @COS;//00402B84
    procedure @EXP;//00402B94
    procedure @SIN;//00402BAC
    procedure @ROUND;//00402BBC
    function @TRUNC(X:Extended):Int64;//00402BC8
    procedure @AbstractError;//00402BEC
    function OpenText(var t:TTextRec; Mode:Word):Integer;//00402C08
    function @RewritText(var T:TTextRec):Integer;//00402C60
    function TextIn(var t:TTextRec):Integer;//00402C6C
    function FileNOPProc(var t:void ):Integer;//00402CA8
    function TextOut(var t:TTextRec):Integer;//00402CAC
    function InternalClose(Handle:Integer):Boolean;//00402CE8
    function TextClose(var t:TTextRec):Integer;//00402CF8
    function TextOpen(var t:TTextRec):Integer;//00402D18
    function @Assign(var F:TFileRec; S:AnsiString):Integer;//00402EC4
    function InternalFlush(var t:TTextRec; Func:TTextIOFunc):Integer;//00402F2C
    function Flush(var t:Text):Integer;//00402F74
    procedure @Flush(var F:TFileRec);//00402F80
    procedure @Close(var F:TFileRec);//00402F8C
    procedure @PStrNCpy(Dest:PShortString; Source:PShortString; MaxLen:Byte);//00402FE4
    procedure @PStrCmp(S1:PShortString; S2:PShortString);//00403000
    procedure @AStrCmp(S1:PShortString; S2:PShortString; Bytes:Integer);//00403084
    procedure @FillChar(var dst:Pointer; cnt:Integer; val:Char);//004030F4
    function @RandInt(Range:Integer):Integer;//00403114
    function @ReadRec(var F:TFileRec; Buffer:Pointer):Integer;//00403130
    function @CloseFile(var f:TFileRec):Integer;//0040317C
    function OpenFile(var f:TFileRec; recSiz:Integer; mode:Integer):Integer;//004031A4
    function @ResetFile(var F:TFileRec; RecSize:Longint):Integer;//00403284
    function @RewritFile(var F:TFileRec; RecSize:Longint):Integer;//004032A0
    function @ValLong(s:AnsiString; var code:Integer):Longint;//004032AC
    procedure @WriteRec(var F:TFileRec; Buffer:Pointer);//00403380
    function TryOpenForOutput(var t:TTextRec):Boolean;//004033C8
    function @WriteBytes(var t:TTextRec; const b:void ; cnt:Integer):Pointer;//0040340C
    function @WriteSpaces(var t:TTextRec; cnt:Integer):Pointer;//00403460
    procedure @WriteLn(var T:TTextRec);//004034DC
    procedure @_CToPasStr(Dest:PShortString; const Source:PAnsiChar);//00403524
    procedure @_CLenToPasStr(Dest:PShortString; const Source:PAnsiChar; MaxLen:Integer);//00403530
    procedure @SetEq;//00403554
    procedure FPower10;//00403568
    procedure @Pow10;//00403570
    function GetKeyboardType:Integer; stdcall;//00403854
    function @isNECWindows:Boolean;//0040385C
    procedure @FpuMaskInit;//0040388C
    procedure @FpuInit;//00403950
    procedure @BoundErr;//0040395C
    function NewInstance:TObject;//004039B4
    procedure FreeInstance;//004039D0
    destructor Destroy;//00403A0C
    function InvokeImplGetter(Self:TObject; ImplGetter:Cardinal):IInterface;//00403AA0
    function @IsClass(Child:TObject; Parent:TClass):Boolean;//00403BA8
    function @AsClass(child:TObject; parent:TClass):TObject;//00403BCC
    procedure GetDynaMethod;//00403BE8
    procedure @CallDynaInst;//00403C18
    procedure @FindDynaInst;//00403C30
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;//00403C64
    procedure DefaultHandler(var Message:void );//00403C6C
    procedure AfterConstruction;//00403C70
    procedure BeforeDestruction;//00403C74
    procedure Dispatch(var Message:void );//00403C78
    function @ClassCreate(AClass:TClass; Alloc:Boolean):TObject;//00403D80
    procedure @ClassDestroy(Instance:TObject);//00403DD0
    function @AfterConstruction(Instance:TObject):TObject;//00403DD8
    function @BeforeDestruction(Instance:TObject; OuterMost:Shortint):TObject;//00403DE8
    procedure NotifyReRaise;//00403DF8
    procedure NotifyNonDelphiException;//00403E14
    procedure NotifyExcept;//00403E38
    procedure NotifyOnExcept;//00403E50
    procedure NotifyAnyExcept;//00403E64
    procedure CheckJmp;//00403E78
    procedure NotifyExceptFinally;//00403E98
    procedure NotifyTerminate;//00403EC0
    procedure NotifyUnhandled;//00403EDC
    procedure @HandleAnyException;//00403EFC
    procedure @HandleOnException;//00404028
    procedure @HandleFinally;//004041B0
    procedure @RaiseExcept;//004041E8
    procedure @RaiseAgain;//00404210
    procedure @DoneExcept;//00404264
    procedure @TryFinallyExit;//00404294
    procedure MapToRunError(P:PExceptionRecord); stdcall;//004042AC
    procedure @ExceptionHandler;//0040434C
    procedure SetExceptionHandler;//004043EC
    procedure UnsetExceptionHandler;//0040440C
    procedure FinalizeUnits;//00404434
    procedure InitUnits;//00404494
    procedure @StartExe(InitTable:PackageInfo; Module:PLibModule);//004044F4
    procedure @InitResStrings;//00404534
    procedure @InitResStringImports;//00404558
    procedure @InitImports;//00404580
    procedure MakeErrorMessage;//004045A4
    procedure ExitDll;//00404600
    procedure WriteErrorMessage;//00404630
    procedure @Halt0;//004046BC
    procedure @Halt(Code:Integer);//00404794
    procedure @RunError(errorCode:Byte);//004047A0
    procedure @Assert(Message:AnsiString; Filename:AnsiString; LineNumber:Integer);//004047AC
    procedure @LStrClr(var S:AnsiString);//004047CC
    procedure @LStrArrayClr(var StrArray:Pointer; Count:Integer);//004047F0
    procedure @LStrAsg(var Dest:AnsiString; Source:AnsiString);//00404820
    procedure @LStrLAsg(var Dest:AnsiString; const Source:AnsiString);//00404864
    function @NewAnsiString(length:Integer):Pointer;//00404890
    procedure @LStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);//004048BC
    function CharFromWChar(CharDest:PAnsiChar; DestBytes:Integer; const WCharSource:PWideChar; SrcChars:Integer):Integer;//004048EC
    function WCharFromChar(WCharDest:PWideChar; DestChars:Integer; const CharSource:PAnsiChar; SrcBytes:Integer):Integer;//0040490C
    procedure @LStrFromPWCharLen(var Dest:AnsiString; Source:PWideChar; Length:Integer);//00404928
    procedure @LStrFromChar(var Dest:AnsiString; Source:AnsiChar);//004049B4
    procedure @LStrFromPChar(var Dest:AnsiString; Source:PAnsiChar);//004049C4
    procedure @LStrFromPWChar(var Dest:AnsiString; Source:PWideChar);//004049F4
    procedure @LStrFromString(var Dest:AnsiString; const Source:ShortString);//00404A30
    procedure @LStrFromArray(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);//00404A3C
    procedure @LStrFromWStr(var Dest:AnsiString; const Source:WideString);//00404A54
    procedure @LStrToString(var Dest:ShortString; const Source:AnsiString; MaxLen:Integer);//00404A68
    function @LStrLen(S:AnsiString):Integer;//00404A8C
    procedure @LStrCat(var Dest:AnsiString; Source:AnsiString);//00404A94
    procedure @LStrCat3(var Dest:AnsiString; Source1:AnsiString; Source2:AnsiString);//00404AD8
    procedure @LStrCatN(var Dest:AnsiString; ArgCnt:Integer);//00404B4C
    //function @LStrCmp(Left:AnsiString; Right:AnsiString):?;//00404BD8
    function @LStrAddRef(var S:AnsiString):Pointer;//00404C7C
    function @LStrToPChar(S:AnsiString):PChar;//00404C8C
    function InternalUniqueString(var str:void ):Pointer;//00404C98
    procedure UniqueString(var str:AnsiString);//00404CDC
    procedure @UniqueStringA(var str:AnsiString);//00404CE4
    function @LStrCopy(const S:AnsiString; Index:Integer; Count:Integer):AnsiString;//00404CEC
    procedure @LStrDelete(var S:AnsiString; Index:Integer; Count:Integer);//00404D2C
    procedure @LStrInsert(const Source:AnsiString; var S:AnsiString; Index:Integer);//00404D74
    function @LStrPos(const Substr:AnsiString; const S:AnsiString):Integer;//00404DD0
    procedure @LStrSetLength(var S:AnsiString; NewLen:Integer);//00404E18
    procedure @LStrOfChar(C:Char; Count:Integer; var Result:AnsiString);//00404E7C
    procedure @Write0Bool(var T:TTextRec; Val:Boolean);//00404EA8
    procedure @WriteBool(var T:TTextRec; Val:Boolean; Width:Longint);//00404EB0
    procedure WStrError;//00404ED0
    function @NewWideString(CharLength:Integer):Pointer;//00404ED8
    procedure WStrSet(var S:WideString; P:PWideChar);//00404EF0
    procedure @WStrClr(var S:WideString);//00404F00
    procedure @WStrArrayClr(var StrArray:Pointer; Count:Integer);//00404F18
    procedure @WStrAsg(var Dest:WideString; Source:WideString);//00404F3C
    procedure @WStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer);//00404F60
    procedure @WStrFromPWCharLen(var Dest:WideString; Source:PWideChar; Length:Integer);//00404FEC
    procedure @WStrFromPWChar(var Dest:WideString; Source:PWideChar);//00405010
    procedure @WStrFromLStr(var Dest:WideString; const Source:AnsiString);//0040504C
    function @WStrToPWChar(S:WideString):PWideChar;//0040505C
    function @WStrLen(S:WideString):Integer;//0040506C
    //function @WStrCmp(Left:WideString; Right:WideString):?;//00405078
    function @WStrCopy(const S:WideString; Index:Integer; Count:Integer):WideString;//004050FC
    procedure @WStrSetLength(var S:WideString; NewLen:Integer);//00405148
    procedure @AddRefRecord;//0040518C
    procedure @AddRefArray;//004051BC
    procedure @AddRef;//00405250
    procedure @FinalizeRecord(P:Pointer; typeInfo:Pointer);//0040525C
    procedure @VarClr(var v:TVarData);//00405290
    procedure @FinalizeArray(p:Pointer; typeInfo:Pointer; elemCount:Cardinal);//004052A8
    procedure @Finalize(p:Pointer; typeInfo:Pointer);//00405394
    procedure @VarAddRef(var v:TVarData);//004053A0
    procedure @CopyRecord(Dest:Pointer; Source:Pointer; TypeInfo:Pointer);//004053B8
    procedure @CopyArray(Dest:Pointer; Source:Pointer; TypeInfo:Pointer; Cnt:Integer);//004054D4
    function @New(size:Integer; typeInfo:Pointer):Pointer;//004055C8
    procedure @Dispose(p:Pointer; typeInfo:Pointer);//004055DC
    procedure @DispCallByIDError;//004055EC
    procedure @_llmul;//004055F4
    function @ValInt64(const s:AnsiString; var code:Integer):Int64;//00405618
    function @DynArrayLength(Arr:Pointer):Longint;//00405848
    function @DynArrayHigh(Arr:Pointer):Longint;//00405850
    procedure CopyArray(dest:Pointer; source:Pointer; typeInfo:Pointer; cnt:Integer);//00405858
    procedure FinalizeArray(p:Pointer; typeInfo:Pointer; cnt:Integer);//00405868
    procedure DynArrayClear(var arr:Pointer; typeInfo:PDynArrayTypeInfo);//00405870
    procedure DynArraySetLength(var arr:Pointer; typeInfo:PDynArrayTypeInfo; dimCnt:Longint; lenVec:PLongint);//00405878
    procedure @DynArraySetLength(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo; DimCnt:Longint; LengthVec:Longint);//00405A04
    procedure @DynArrayClear(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo);//00405A10
    procedure @DynArrayAsg(var Dest:Pointer; Source:Pointer; TypeInfo:PDynArrayTypeInfo);//00405A4C
    function FindHInstance(Address:Pointer):Cardinal;//00405A74
    function FindClassHInstance(ClassType:TClass):Cardinal;//00405A9C
    function DelayLoadResourceModule(Module:PLibModule):Cardinal;//00405AA4
    function FindResourceHInstance(Instance:Cardinal):Cardinal;//00405AEC
    function FindBS(Current:PAnsiChar):PAnsiChar;//00405B14
    function ToLongPath(AFileName:PAnsiChar; BufSize:Integer):PAnsiChar;//00405B28
    function LoadResourceModule(ModuleName:PAnsiChar; CheckOwner:Boolean):Cardinal;//00405CE0
    procedure AddModuleUnloadProc(Proc:TModuleUnloadProc);//00405F50
    procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProc);//00405F58
    procedure AddModuleUnloadProc(Proc:TModuleUnloadProcLW);//00405F60
    procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProcLW);//00405F80
    procedure NotifyModuleUnload(HInstance:Cardinal);//00405FE0
    procedure RegisterModule(LibModule:PLibModule);//0040603C
    procedure UnregisterModule(LibModule:PLibModule);//0040604C
    function @IntfClear(var Dest:IInterface):Pointer;//004060BC
    procedure @IntfCopy(var Dest:IInterface; const Source:IInterface);//004060D4
    procedure @IntfCast(var Dest:IInterface; const Source:IInterface; const IID:TGUID);//00406100
    procedure @IntfAddRef(const Dest:IInterface);//00406130
    procedure AfterConstruction;//0040613C
    procedure BeforeDestruction;//00406148
    function NewInstance:TObject;//00406158
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//00406168
    function GetMemory(Size:Integer):Pointer; cdecl;//004061CC
    function FreeMemory(P:Pointer):Integer; cdecl;//004061DC
    function UnicodeToUtf8(Dest:PAnsiChar; MaxDestBytes:Cardinal; Source:PWideChar; SourceChars:Cardinal):Cardinal;//004061F4
    function Utf8ToUnicode(Dest:PWideChar; MaxDestChars:Cardinal; Source:PAnsiChar; SourceBytes:Cardinal):Cardinal;//004062D0
    function UTF8Encode(const WS:WideString):UTF8String;//00406408
    function UTF8Decode(const S:UTF8String):WideString;//004064B4
    function AnsiToUtf8(const S:AnsiString):UTF8String;//00406558
    function LoadStr(Ident:Integer):AnsiString;//004065A8
    function LCIDToCodePage(ALcid:Cardinal):Integer;//00406600

implementation

//00401224
function KERNEL32.CloseHandle:Integer; stdcall;
begin
{*
 00401224    jmp         dword ptr ds:[608214]
*}
end;

//0040122C
function KERNEL32.CreateFileA(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;
begin
{*
 0040122C    jmp         dword ptr ds:[608210]
*}
end;

//00401234
function KERNEL32.GetFileType:DWORD; stdcall;
begin
{*
 00401234    jmp         dword ptr ds:[60820C]
*}
end;

//0040123C
function KERNEL32.GetFileSize(x:Integer):Integer; stdcall;
begin
{*
 0040123C    jmp         dword ptr ds:[608208]
*}
end;

//00401244
function KERNEL32.GetStdHandle:Integer; stdcall;
begin
{*
 00401244    jmp         dword ptr ds:[608204]
*}
end;

//0040124C
procedure KERNEL32.RaiseException(dwExceptionFlags:DWORD; nNumberOfArguments:DWORD; lpArguments:PDWORD); stdcall;
begin
{*
 0040124C    jmp         dword ptr ds:[608200]
*}
end;

//00401254
function KERNEL32.ReadFile(var Buffer:void ; nNumberOfBytesToRead:Cardinal; var lpNumberOfBytesRead:Cardinal; lpOverlapped:Pointer):Integer; stdcall;
begin
{*
 00401254    jmp         dword ptr ds:[6081FC]
*}
end;

//0040125C
procedure KERNEL32.RtlUnwind;
begin
{*
 0040125C    jmp         dword ptr ds:[6081F8]
*}
end;

//00401264
function KERNEL32.SetEndOfFile:LongBool; stdcall;
begin
{*
 00401264    jmp         dword ptr ds:[6081F4]
*}
end;

//0040126C
function KERNEL32.SetFilePointer(Distance:Integer; DistanceHigh:Pointer; MoveMethod:Integer):Integer; stdcall;
begin
{*
 0040126C    jmp         dword ptr ds:[6081F0]
*}
end;

//00401274
function KERNEL32.UnhandledExceptionFilter:Longint; stdcall;
begin
{*
 00401274    jmp         dword ptr ds:[6081EC]
*}
end;

//0040127C
function KERNEL32.WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;
begin
{*
 0040127C    jmp         dword ptr ds:[6081E8]
*}
end;

//00401284
function user32.CharNextA:PAnsiChar; stdcall;
begin
{*
 00401284    jmp         dword ptr ds:[608228]
*}
end;

//0040128C
procedure KERNEL32.ExitProcess; stdcall;
begin
{*
 0040128C    jmp         dword ptr ds:[6081E4]
*}
end;

//00401294
function user32.MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:LongWord):Integer; stdcall;
begin
{*
 00401294    jmp         dword ptr ds:[608224]
*}
end;

//0040129C
procedure KERNEL32.FindClose;
begin
{*
 0040129C    jmp         dword ptr ds:[6081E0]
*}
end;

//004012A4
function KERNEL32.FindFirstFileA(var lpFindFileData:_WIN32_FIND_DATAA):THandle; stdcall;
begin
{*
 004012A4    jmp         dword ptr ds:[6081DC]
*}
end;

//004012AC
function KERNEL32.FreeLibrary:LongBool; stdcall;
begin
{*
 004012AC    jmp         dword ptr ds:[6081D8]
*}
end;

//004012B4
function KERNEL32.GetCommandLineA:PAnsiChar;
begin
{*
 004012B4    jmp         dword ptr ds:[6081D4]
*}
end;

//004012BC
function KERNEL32.GetLastError:Integer;
begin
{*
 004012BC    jmp         dword ptr ds:[6081D0]
*}
end;

//004012C4
function KERNEL32.GetLocaleInfoA(LCType:DWORD; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;
begin
{*
 004012C4    jmp         dword ptr ds:[6081CC]
*}
end;

//004012CC
function KERNEL32.GetModuleFileNameA(lpFilename:PAnsiChar; nSize:DWORD):DWORD; stdcall;
begin
{*
 004012CC    jmp         dword ptr ds:[6081C8]
*}
end;

//004012D4
function KERNEL32.GetModuleHandleA:HMODULE; stdcall;
begin
{*
 004012D4    jmp         dword ptr ds:[6081C4]
*}
end;

//004012DC
function KERNEL32.GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;
begin
{*
 004012DC    jmp         dword ptr ds:[6081C0]
*}
end;

//004012E4
procedure KERNEL32.GetStartupInfoA; stdcall;
begin
{*
 004012E4    jmp         dword ptr ds:[6081BC]
*}
end;

//004012EC
function KERNEL32.GetThreadLocale:Integer;
begin
{*
 004012EC    jmp         dword ptr ds:[6081B8]
*}
end;

//004012F4
function KERNEL32.LoadLibraryExA(hFile:THandle; dwFlags:DWORD):HMODULE; stdcall;
begin
{*
 004012F4    jmp         dword ptr ds:[6081B4]
*}
end;

//004012FC
function user32.LoadStringA(uID:LongWord; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;
begin
{*
 004012FC    jmp         dword ptr ds:[608220]
*}
end;

//00401304
function KERNEL32.lstrcpynA(lpString2:PAnsiChar; iMaxLength:Integer):PAnsiChar; stdcall;
begin
{*
 00401304    jmp         dword ptr ds:[6081B0]
*}
end;

//0040130C
function KERNEL32.lstrlenA:Integer; stdcall;
begin
{*
 0040130C    jmp         dword ptr ds:[6081AC]
*}
end;

//00401314
function KERNEL32.MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;
begin
{*
 00401314    jmp         dword ptr ds:[6081A8]
*}
end;

//0040131C
function advapi32.RegCloseKey:Integer; stdcall;
begin
{*
 0040131C    jmp         dword ptr ds:[608238]
*}
end;

//00401324
function advapi32.RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:DWORD; samDesired:DWORD; var phkResult:HKEY):Longint; stdcall;
begin
{*
 00401324    jmp         dword ptr ds:[608234]
*}
end;

//0040132C
function advapi32.RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;
begin
{*
 0040132C    jmp         dword ptr ds:[608230]
*}
end;

//00401334
function KERNEL32.WideCharToMultiByte(dwFlags:DWORD; lpWideCharStr:PWideChar; cchWideChar:Integer; lpMultiByteStr:PAnsiChar; cchMultiByte:Integer; lpDefaultChar:PAnsiChar; lpUsedDefaultChar:PBOOL):Integer; stdcall;
begin
{*
 00401334    jmp         dword ptr ds:[6081A4]
*}
end;

//0040133C
function KERNEL32.VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;
begin
{*
 0040133C    jmp         dword ptr ds:[6081A0]
*}
end;

//00401344
function oleaut32.SysAllocStringLen(Len:Integer):PWideChar; stdcall;
begin
{*
 00401344    jmp         dword ptr ds:[608248]
*}
end;

//0040134C
function oleaut32.SysReAllocStringLen(psz:PWideChar; len:Integer):Integer; stdcall;
begin
{*
 0040134C    jmp         dword ptr ds:[608244]
*}
end;

//00401354
procedure oleaut32.SysFreeString; stdcall;
begin
{*
 00401354    jmp         dword ptr ds:[608240]
*}
end;

//0040135C
function KERNEL32.InterlockedIncrement:Integer; stdcall;
begin
{*
 0040135C    jmp         dword ptr ds:[60819C]
*}
end;

//00401364
function KERNEL32.InterlockedDecrement:Integer;
begin
{*
 00401364    jmp         dword ptr ds:[608198]
*}
end;

//0040136C
function KERNEL32.GetCurrentThreadId:Cardinal;
begin
{*
 0040136C    jmp         dword ptr ds:[608194]
*}
end;

//00401374
function KERNEL32.GetVersion:DWORD;
begin
{*
 00401374    jmp         dword ptr ds:[608190]
*}
end;

//0040137C
function KERNEL32.QueryPerformanceCounter:LongBool; stdcall;
begin
{*
 0040137C    jmp         dword ptr ds:[60818C]
*}
end;

//00401384
function KERNEL32.GetTickCount:Cardinal;
begin
{*
 00401384    jmp         dword ptr ds:[608188]
*}
end;

//0040138C
function GetCmdShow:Integer;
begin
{*
 0040138C    push        ebx
 0040138D    add         esp,0FFFFFFBC
 00401390    mov         ebx,0A
 00401395    push        esp
 00401396    call        KERNEL32.GetStartupInfoA
 0040139B    test        byte ptr [esp+2C],1
>004013A0    je          004013A7
 004013A2    movzx       ebx,word ptr [esp+30]
 004013A7    mov         eax,ebx
 004013A9    add         esp,44
 004013AC    pop         ebx
 004013AD    ret
*}
end;

//004013B0
function KERNEL32.LocalAlloc(size:Integer):Pointer; stdcall;
begin
{*
 004013B0    jmp         dword ptr ds:[608184]
*}
end;

//004013B8
function KERNEL32.LocalFree:Pointer; stdcall;
begin
{*
 004013B8    jmp         dword ptr ds:[608180]
*}
end;

//004013C0
function KERNEL32.VirtualAlloc(dwSize:DWORD; flAllocationType:DWORD; flProtect:DWORD):Pointer; stdcall;
begin
{*
 004013C0    jmp         dword ptr ds:[60817C]
*}
end;

//004013C8
function KERNEL32.VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;
begin
{*
 004013C8    jmp         dword ptr ds:[608178]
*}
end;

//004013D0
procedure KERNEL32.InitializeCriticalSection; stdcall;
begin
{*
 004013D0    jmp         dword ptr ds:[608174]
*}
end;

//004013D8
procedure KERNEL32.EnterCriticalSection; stdcall;
begin
{*
 004013D8    jmp         dword ptr ds:[608170]
*}
end;

//004013E0
procedure KERNEL32.LeaveCriticalSection; stdcall;
begin
{*
 004013E0    jmp         dword ptr ds:[60816C]
*}
end;

//004013E8
procedure KERNEL32.DeleteCriticalSection; stdcall;
begin
{*
 004013E8    jmp         dword ptr ds:[608168]
*}
end;

//004013F0
function GetBlockDesc:PBlockDesc;
begin
{*
 004013F0    push        ebx
 004013F1    push        esi
 004013F2    mov         esi,5AF5E4
 004013F7    cmp         dword ptr [esi],0
>004013FA    jne         00401436
 004013FC    push        644
 00401401    push        0
 00401403    call        KERNEL32.LocalAlloc
 00401408    mov         ecx,eax
 0040140A    test        ecx,ecx
>0040140C    jne         00401413
 0040140E    xor         eax,eax
 00401410    pop         esi
 00401411    pop         ebx
 00401412    ret
 00401413    mov         eax,[005AF5E0]
 00401418    mov         dword ptr [ecx],eax
 0040141A    mov         dword ptr ds:[5AF5E0],ecx
 00401420    xor         edx,edx
 00401422    mov         eax,edx
 00401424    add         eax,eax
 00401426    lea         eax,[ecx+eax*8+4]
 0040142A    mov         ebx,dword ptr [esi]
 0040142C    mov         dword ptr [eax],ebx
 0040142E    mov         dword ptr [esi],eax
 00401430    inc         edx
 00401431    cmp         edx,64
>00401434    jne         00401422
 00401436    mov         eax,dword ptr [esi]
 00401438    mov         edx,dword ptr [eax]
 0040143A    mov         dword ptr [esi],edx
 0040143C    pop         esi
 0040143D    pop         ebx
 0040143E    ret
*}
end;

//00401440
procedure MakeEmpty(bd:PBlockDesc);
begin
{*
 00401440    mov         dword ptr [eax],eax
 00401442    mov         dword ptr [eax+4],eax
 00401445    ret
*}
end;

//00401448
function AddBlockAfter(prev:PBlockDesc; const b:TBlock):Boolean;
begin
{*
 00401448    push        ebx
 00401449    push        esi
 0040144A    mov         esi,edx
 0040144C    mov         ebx,eax
 0040144E    call        GetBlockDesc
 00401453    test        eax,eax
>00401455    jne         0040145C
 00401457    xor         eax,eax
 00401459    pop         esi
 0040145A    pop         ebx
 0040145B    ret
 0040145C    mov         edx,dword ptr [esi]
 0040145E    mov         dword ptr [eax+8],edx
 00401461    mov         edx,dword ptr [esi+4]
 00401464    mov         dword ptr [eax+0C],edx
 00401467    mov         edx,dword ptr [ebx]
 00401469    mov         dword ptr [eax],edx
 0040146B    mov         dword ptr [eax+4],ebx
 0040146E    mov         dword ptr [edx+4],eax
 00401471    mov         dword ptr [ebx],eax
 00401473    mov         al,1
 00401475    pop         esi
 00401476    pop         ebx
 00401477    ret
*}
end;

//00401478
procedure DeleteBlock(bd:PBlockDesc);
begin
{*
 00401478    mov         edx,dword ptr [eax+4]
 0040147B    mov         ecx,dword ptr [eax]
 0040147D    mov         dword ptr [edx],ecx
 0040147F    mov         dword ptr [ecx+4],edx
 00401482    mov         edx,dword ptr ds:[5AF5E4]
 00401488    mov         dword ptr [eax],edx
 0040148A    mov         [005AF5E4],eax
 0040148F    ret
*}
end;

//00401490
function MergeBlockAfter(prev:PBlockDesc; const b:TBlock):TBlock;
begin
{*
 00401490    push        ebx
 00401491    push        esi
 00401492    push        edi
 00401493    push        ebp
 00401494    push        ecx
 00401495    mov         esi,ecx
 00401497    mov         dword ptr [esp],edx
 0040149A    mov         ebp,eax
 0040149C    mov         ebx,dword ptr [ebp]
 0040149F    mov         eax,dword ptr [esp]
 004014A2    mov         edx,dword ptr [eax]
 004014A4    mov         dword ptr [esi],edx
 004014A6    mov         edx,dword ptr [eax+4]
 004014A9    mov         dword ptr [esi+4],edx
 004014AC    mov         edi,dword ptr [ebx]
 004014AE    mov         eax,dword ptr [esi]
 004014B0    mov         edx,dword ptr [ebx+8]
 004014B3    add         edx,dword ptr [ebx+0C]
 004014B6    cmp         eax,edx
>004014B8    jne         004014CE
 004014BA    mov         eax,ebx
 004014BC    call        DeleteBlock
 004014C1    mov         eax,dword ptr [ebx+8]
 004014C4    mov         dword ptr [esi],eax
 004014C6    mov         eax,dword ptr [ebx+0C]
 004014C9    add         dword ptr [esi+4],eax
>004014CC    jmp         004014E3
 004014CE    add         eax,dword ptr [esi+4]
 004014D1    cmp         eax,dword ptr [ebx+8]
>004014D4    jne         004014E3
 004014D6    mov         eax,ebx
 004014D8    call        DeleteBlock
 004014DD    mov         eax,dword ptr [ebx+0C]
 004014E0    add         dword ptr [esi+4],eax
 004014E3    mov         ebx,edi
 004014E5    cmp         ebp,ebx
>004014E7    jne         004014AC
 004014E9    mov         edx,esi
 004014EB    mov         eax,ebp
 004014ED    call        AddBlockAfter
 004014F2    test        al,al
>004014F4    jne         004014FA
 004014F6    xor         eax,eax
 004014F8    mov         dword ptr [esi],eax
 004014FA    pop         edx
 004014FB    pop         ebp
 004014FC    pop         edi
 004014FD    pop         esi
 004014FE    pop         ebx
 004014FF    ret
*}
end;

//00401500
function RemoveBlock(bd:PBlockDesc; const b:TBlock):Boolean;
begin
{*
 00401500    push        ebx
 00401501    push        esi
 00401502    push        edi
 00401503    push        ebp
 00401504    add         esp,0FFFFFFF8
 00401507    mov         ebx,eax
 00401509    mov         edi,ebx
 0040150B    mov         esi,dword ptr [edx]
 0040150D    mov         eax,dword ptr [ebx+8]
 00401510    cmp         esi,eax
>00401512    jb          00401584
 00401514    mov         ecx,esi
 00401516    add         ecx,dword ptr [edx+4]
 00401519    mov         ebp,eax
 0040151B    add         ebp,dword ptr [ebx+0C]
 0040151E    cmp         ecx,ebp
>00401520    ja          00401584
 00401522    cmp         esi,eax
>00401524    jne         00401541
 00401526    mov         eax,dword ptr [edx+4]
 00401529    add         dword ptr [ebx+8],eax
 0040152C    mov         eax,dword ptr [edx+4]
 0040152F    sub         dword ptr [ebx+0C],eax
 00401532    cmp         dword ptr [ebx+0C],0
>00401536    jne         00401580
 00401538    mov         eax,ebx
 0040153A    call        DeleteBlock
>0040153F    jmp         00401580
 00401541    mov         ecx,esi
 00401543    mov         edi,dword ptr [edx+4]
 00401546    add         ecx,edi
 00401548    mov         ebp,eax
 0040154A    add         ebp,dword ptr [ebx+0C]
 0040154D    cmp         ecx,ebp
>0040154F    jne         00401556
 00401551    sub         dword ptr [ebx+0C],edi
>00401554    jmp         00401580
 00401556    mov         ecx,dword ptr [edx]
 00401558    add         ecx,dword ptr [edx+4]
 0040155B    mov         dword ptr [esp],ecx
 0040155E    mov         edi,dword ptr [ebx+8]
 00401561    add         edi,dword ptr [ebx+0C]
 00401564    sub         edi,ecx
 00401566    mov         dword ptr [esp+4],edi
 0040156A    sub         esi,eax
 0040156C    mov         dword ptr [ebx+0C],esi
 0040156F    mov         edx,esp
 00401571    mov         eax,ebx
 00401573    call        AddBlockAfter
 00401578    test        al,al
>0040157A    jne         00401580
 0040157C    xor         eax,eax
>0040157E    jmp         0040158C
 00401580    mov         al,1
>00401582    jmp         0040158C
 00401584    mov         ebx,dword ptr [ebx]
 00401586    cmp         edi,ebx
>00401588    jne         0040150B
 0040158A    xor         eax,eax
 0040158C    pop         ecx
 0040158D    pop         edx
 0040158E    pop         ebp
 0040158F    pop         edi
 00401590    pop         esi
 00401591    pop         ebx
 00401592    ret
*}
end;

//00401594
function GetSpace(minSize:Integer):TBlock;
begin
{*
 00401594    push        ebx
 00401595    push        esi
 00401596    push        edi
 00401597    mov         ebx,edx
 00401599    mov         esi,eax
 0040159B    cmp         esi,100000
>004015A1    jge         004015AA
 004015A3    mov         esi,100000
>004015A8    jmp         004015B6
 004015AA    add         esi,0FFFF
 004015B0    and         esi,0FFFF0000
 004015B6    mov         dword ptr [ebx+4],esi
 004015B9    push        1
 004015BB    push        2000
 004015C0    push        esi
 004015C1    push        0
 004015C3    call        KERNEL32.VirtualAlloc
 004015C8    mov         edi,eax
 004015CA    mov         dword ptr [ebx],edi
 004015CC    test        edi,edi
>004015CE    je          004015F3
 004015D0    mov         edx,ebx
 004015D2    mov         eax,5AF5E8
 004015D7    call        AddBlockAfter
 004015DC    test        al,al
>004015DE    jne         004015F3
 004015E0    push        8000
 004015E5    push        0
 004015E7    mov         eax,dword ptr [ebx]
 004015E9    push        eax
 004015EA    call        KERNEL32.VirtualFree
 004015EF    xor         eax,eax
 004015F1    mov         dword ptr [ebx],eax
 004015F3    pop         edi
 004015F4    pop         esi
 004015F5    pop         ebx
 004015F6    ret
*}
end;

//004015F8
function GetSpaceAt(addr:PAnsiChar; minSize:Integer):TBlock;
begin
{*
 004015F8    push        ebx
 004015F9    push        esi
 004015FA    push        edi
 004015FB    push        ebp
 004015FC    mov         ebx,ecx
 004015FE    mov         esi,edx
 00401600    mov         ebp,eax
 00401602    mov         dword ptr [ebx+4],100000
 00401609    push        4
 0040160B    push        2000
 00401610    push        100000
 00401615    push        ebp
 00401616    call        KERNEL32.VirtualAlloc
 0040161B    mov         edi,eax
 0040161D    mov         dword ptr [ebx],edi
 0040161F    test        edi,edi
>00401621    jne         00401642
 00401623    add         esi,0FFFF
 00401629    and         esi,0FFFF0000
 0040162F    mov         dword ptr [ebx+4],esi
 00401632    push        4
 00401634    push        2000
 00401639    push        esi
 0040163A    push        ebp
 0040163B    call        KERNEL32.VirtualAlloc
 00401640    mov         dword ptr [ebx],eax
 00401642    cmp         dword ptr [ebx],0
>00401645    je          0040166A
 00401647    mov         edx,ebx
 00401649    mov         eax,5AF5E8
 0040164E    call        AddBlockAfter
 00401653    test        al,al
>00401655    jne         0040166A
 00401657    push        8000
 0040165C    push        0
 0040165E    mov         eax,dword ptr [ebx]
 00401660    push        eax
 00401661    call        KERNEL32.VirtualFree
 00401666    xor         eax,eax
 00401668    mov         dword ptr [ebx],eax
 0040166A    pop         ebp
 0040166B    pop         edi
 0040166C    pop         esi
 0040166D    pop         ebx
 0040166E    ret
*}
end;

//00401670
function FreeSpace(addr:Pointer; maxSize:Integer):TBlock;
begin
{*
 00401670    push        ebx
 00401671    push        esi
 00401672    push        edi
 00401673    push        ebp
 00401674    add         esp,0FFFFFFEC
 00401677    mov         dword ptr [esp+4],ecx
 0040167B    mov         dword ptr [esp],edx
 0040167E    mov         dword ptr [esp+8],0FFFFFFFF
 00401686    xor         edx,edx
 00401688    mov         dword ptr [esp+0C],edx
 0040168C    mov         ebp,eax
 0040168E    mov         eax,dword ptr [esp]
 00401691    add         eax,ebp
 00401693    mov         dword ptr [esp+10],eax
 00401697    mov         ebx,dword ptr ds:[5AF5E8]
>0040169D    jmp         004016F0
 0040169F    mov         edi,dword ptr [ebx]
 004016A1    mov         esi,dword ptr [ebx+8]
 004016A4    cmp         ebp,esi
>004016A6    ja          004016EE
 004016A8    mov         eax,esi
 004016AA    add         eax,dword ptr [ebx+0C]
 004016AD    cmp         eax,dword ptr [esp+10]
>004016B1    ja          004016EE
 004016B3    cmp         esi,dword ptr [esp+8]
>004016B7    jae         004016BD
 004016B9    mov         dword ptr [esp+8],esi
 004016BD    mov         eax,esi
 004016BF    add         eax,dword ptr [ebx+0C]
 004016C2    cmp         eax,dword ptr [esp+0C]
>004016C6    jbe         004016CC
 004016C8    mov         dword ptr [esp+0C],eax
 004016CC    push        8000
 004016D1    push        0
 004016D3    push        esi
 004016D4    call        KERNEL32.VirtualFree
 004016D9    test        eax,eax
>004016DB    jne         004016E7
 004016DD    mov         dword ptr ds:[5AF5C4],1
 004016E7    mov         eax,ebx
 004016E9    call        DeleteBlock
 004016EE    mov         ebx,edi
 004016F0    cmp         ebx,5AF5E8
>004016F6    jne         0040169F
 004016F8    mov         eax,dword ptr [esp+4]
 004016FC    xor         edx,edx
 004016FE    mov         dword ptr [eax],edx
 00401700    cmp         dword ptr [esp+0C],0
>00401705    je          00401720
 00401707    mov         eax,dword ptr [esp+4]
 0040170B    mov         edx,dword ptr [esp+8]
 0040170F    mov         dword ptr [eax],edx
 00401711    mov         eax,dword ptr [esp+0C]
 00401715    sub         eax,dword ptr [esp+8]
 00401719    mov         edx,dword ptr [esp+4]
 0040171D    mov         dword ptr [edx+4],eax
 00401720    add         esp,14
 00401723    pop         ebp
 00401724    pop         edi
 00401725    pop         esi
 00401726    pop         ebx
 00401727    ret
*}
end;

//00401728
function Commit(addr:Pointer; minSize:Integer):TBlock;
begin
{*
 00401728    push        ebx
 00401729    push        esi
 0040172A    push        edi
 0040172B    push        ebp
 0040172C    add         esp,0FFFFFFF4
 0040172F    mov         dword ptr [esp+4],ecx
 00401733    mov         dword ptr [esp],edx
 00401736    mov         edx,eax
 00401738    mov         ebp,edx
 0040173A    and         ebp,0FFFFF000
 00401740    add         edx,dword ptr [esp]
 00401743    add         edx,0FFF
 00401749    and         edx,0FFFFF000
 0040174F    mov         dword ptr [esp+8],edx
 00401753    mov         eax,dword ptr [esp+4]
 00401757    mov         dword ptr [eax],ebp
 00401759    mov         eax,dword ptr [esp+8]
 0040175D    sub         eax,ebp
 0040175F    mov         edx,dword ptr [esp+4]
 00401763    mov         dword ptr [edx+4],eax
 00401766    mov         esi,dword ptr ds:[5AF5E8]
>0040176C    jmp         004017AA
 0040176E    mov         ebx,dword ptr [esi+8]
 00401771    mov         edi,dword ptr [esi+0C]
 00401774    add         edi,ebx
 00401776    cmp         ebp,ebx
>00401778    jbe         0040177C
 0040177A    mov         ebx,ebp
 0040177C    cmp         edi,dword ptr [esp+8]
>00401780    jbe         00401786
 00401782    mov         edi,dword ptr [esp+8]
 00401786    cmp         edi,ebx
>00401788    jbe         004017A8
 0040178A    push        4
 0040178C    push        1000
 00401791    sub         edi,ebx
 00401793    push        edi
 00401794    push        ebx
 00401795    call        KERNEL32.VirtualAlloc
 0040179A    test        eax,eax
>0040179C    jne         004017A8
 0040179E    mov         eax,dword ptr [esp+4]
 004017A2    xor         edx,edx
 004017A4    mov         dword ptr [eax],edx
>004017A6    jmp         004017B2
 004017A8    mov         esi,dword ptr [esi]
 004017AA    cmp         esi,5AF5E8
>004017B0    jne         0040176E
 004017B2    add         esp,0C
 004017B5    pop         ebp
 004017B6    pop         edi
 004017B7    pop         esi
 004017B8    pop         ebx
 004017B9    ret
*}
end;

//004017BC
function Decommit(addr:Pointer; maxSize:Integer):TBlock;
begin
{*
 004017BC    push        ebx
 004017BD    push        esi
 004017BE    push        edi
 004017BF    push        ebp
 004017C0    push        ecx
 004017C1    mov         ebx,eax
 004017C3    mov         esi,ebx
 004017C5    add         esi,0FFF
 004017CB    and         esi,0FFFFF000
 004017D1    mov         dword ptr [esp],esi
 004017D4    mov         ebp,ebx
 004017D6    add         ebp,edx
 004017D8    and         ebp,0FFFFF000
 004017DE    mov         eax,dword ptr [esp]
 004017E1    mov         dword ptr [ecx],eax
 004017E3    mov         eax,ebp
 004017E5    sub         eax,dword ptr [esp]
 004017E8    mov         dword ptr [ecx+4],eax
 004017EB    mov         esi,dword ptr ds:[5AF5E8]
>004017F1    jmp         0040182B
 004017F3    mov         ebx,dword ptr [esi+8]
 004017F6    mov         edi,dword ptr [esi+0C]
 004017F9    add         edi,ebx
 004017FB    cmp         ebx,dword ptr [esp]
>004017FE    jae         00401803
 00401800    mov         ebx,dword ptr [esp]
 00401803    cmp         ebp,edi
>00401805    jae         00401809
 00401807    mov         edi,ebp
 00401809    cmp         edi,ebx
>0040180B    jbe         00401829
 0040180D    push        4000
 00401812    sub         edi,ebx
 00401814    push        edi
 00401815    push        ebx
 00401816    call        KERNEL32.VirtualFree
 0040181B    test        eax,eax
>0040181D    jne         00401829
 0040181F    mov         dword ptr ds:[5AF5C4],2
 00401829    mov         esi,dword ptr [esi]
 0040182B    cmp         esi,5AF5E8
>00401831    jne         004017F3
 00401833    pop         edx
 00401834    pop         ebp
 00401835    pop         edi
 00401836    pop         esi
 00401837    pop         ebx
 00401838    ret
*}
end;

//0040183C
function GetCommitted(minSize:Integer):TBlock;
begin
{*
 0040183C    push        ebx
 0040183D    push        esi
 0040183E    push        edi
 0040183F    push        ebp
 00401840    add         esp,0FFFFFFF8
 00401843    mov         esi,edx
 00401845    mov         edi,eax
 00401847    mov         ebp,5AF5F8
 0040184C    add         edi,3FFF
 00401852    and         edi,0FFFFC000
 00401858    mov         ebx,dword ptr [ebp]
>0040185B    jmp         00401890
 0040185D    cmp         edi,dword ptr [ebx+0C]
>00401860    jg          0040188E
 00401862    mov         ecx,esi
 00401864    mov         edx,edi
 00401866    mov         eax,dword ptr [ebx+8]
 00401869    call        Commit
 0040186E    cmp         dword ptr [esi],0
>00401871    je          004018C3
 00401873    mov         eax,dword ptr [esi+4]
 00401876    add         dword ptr [ebx+8],eax
 00401879    mov         eax,dword ptr [esi+4]
 0040187C    sub         dword ptr [ebx+0C],eax
 0040187F    cmp         dword ptr [ebx+0C],0
>00401883    jne         004018C3
 00401885    mov         eax,ebx
 00401887    call        DeleteBlock
>0040188C    jmp         004018C3
 0040188E    mov         ebx,dword ptr [ebx]
 00401890    cmp         ebx,ebp
>00401892    jne         0040185D
 00401894    mov         edx,esi
 00401896    mov         eax,edi
 00401898    call        GetSpace
 0040189D    cmp         dword ptr [esi],0
>004018A0    je          004018C3
 004018A2    mov         ecx,esp
 004018A4    mov         edx,esi
 004018A6    mov         eax,ebp
 004018A8    call        MergeBlockAfter
 004018AD    cmp         dword ptr [esp],0
>004018B1    jne         00401858
 004018B3    mov         ecx,esp
 004018B5    mov         edx,dword ptr [esi+4]
 004018B8    mov         eax,dword ptr [esi]
 004018BA    call        FreeSpace
 004018BF    xor         eax,eax
 004018C1    mov         dword ptr [esi],eax
 004018C3    pop         ecx
 004018C4    pop         edx
 004018C5    pop         ebp
 004018C6    pop         edi
 004018C7    pop         esi
 004018C8    pop         ebx
 004018C9    ret
*}
end;

//004018CC
function GetCommittedAt(addr:PAnsiChar; minSize:Integer):TBlock;
begin
{*
 004018CC    push        ebx
 004018CD    push        esi
 004018CE    push        edi
 004018CF    push        ebp
 004018D0    add         esp,0FFFFFFEC
 004018D3    mov         dword ptr [esp],ecx
 004018D6    mov         edi,edx
 004018D8    mov         esi,eax
 004018DA    mov         ebp,5AF5F8
 004018DF    add         edi,3FFF
 004018E5    and         edi,0FFFFC000
 004018EB    mov         ebx,dword ptr [ebp]
>004018EE    jmp         004018F2
 004018F0    mov         ebx,dword ptr [ebx]
 004018F2    cmp         ebx,ebp
>004018F4    je          004018FB
 004018F6    cmp         esi,dword ptr [ebx+8]
>004018F9    jne         004018F0
 004018FB    cmp         esi,dword ptr [ebx+8]
>004018FE    jne         00401957
 00401900    cmp         edi,dword ptr [ebx+0C]
>00401903    jle         0040199F
 00401909    lea         ecx,[esp+4]
 0040190D    mov         edx,edi
 0040190F    sub         edx,dword ptr [ebx+0C]
 00401912    mov         eax,dword ptr [ebx+8]
 00401915    add         eax,dword ptr [ebx+0C]
 00401918    call        GetSpaceAt
 0040191D    cmp         dword ptr [esp+4],0
>00401922    je          00401957
 00401924    lea         ecx,[esp+0C]
 00401928    lea         edx,[esp+4]
 0040192C    mov         eax,ebp
 0040192E    call        MergeBlockAfter
 00401933    cmp         dword ptr [esp+0C],0
>00401938    jne         004018EB
 0040193A    lea         ecx,[esp+0C]
 0040193E    mov         edx,dword ptr [esp+8]
 00401942    mov         eax,dword ptr [esp+4]
 00401946    call        FreeSpace
 0040194B    mov         eax,dword ptr [esp]
 0040194E    xor         edx,edx
 00401950    mov         dword ptr [eax],edx
>00401952    jmp         004019E7
 00401957    lea         ecx,[esp+4]
 0040195B    mov         edx,edi
 0040195D    mov         eax,esi
 0040195F    call        GetSpaceAt
 00401964    cmp         dword ptr [esp+4],0
>00401969    je          0040199F
 0040196B    lea         ecx,[esp+0C]
 0040196F    lea         edx,[esp+4]
 00401973    mov         eax,ebp
 00401975    call        MergeBlockAfter
 0040197A    cmp         dword ptr [esp+0C],0
>0040197F    jne         004018EB
 00401985    lea         ecx,[esp+0C]
 00401989    mov         edx,dword ptr [esp+8]
 0040198D    mov         eax,dword ptr [esp+4]
 00401991    call        FreeSpace
 00401996    mov         eax,dword ptr [esp]
 00401999    xor         edx,edx
 0040199B    mov         dword ptr [eax],edx
>0040199D    jmp         004019E7
 0040199F    mov         ebp,dword ptr [ebx+8]
 004019A2    cmp         esi,ebp
>004019A4    jne         004019E0
 004019A6    cmp         edi,dword ptr [ebx+0C]
>004019A9    jg          004019E0
 004019AB    mov         ecx,dword ptr [esp]
 004019AE    mov         edx,edi
 004019B0    mov         eax,ebp
 004019B2    call        Commit
 004019B7    mov         eax,dword ptr [esp]
 004019BA    cmp         dword ptr [eax],0
>004019BD    je          004019E7
 004019BF    mov         eax,dword ptr [esp]
 004019C2    mov         eax,dword ptr [eax+4]
 004019C5    add         dword ptr [ebx+8],eax
 004019C8    mov         eax,dword ptr [esp]
 004019CB    mov         eax,dword ptr [eax+4]
 004019CE    sub         dword ptr [ebx+0C],eax
 004019D1    cmp         dword ptr [ebx+0C],0
>004019D5    jne         004019E7
 004019D7    mov         eax,ebx
 004019D9    call        DeleteBlock
>004019DE    jmp         004019E7
 004019E0    mov         eax,dword ptr [esp]
 004019E3    xor         edx,edx
 004019E5    mov         dword ptr [eax],edx
 004019E7    add         esp,14
 004019EA    pop         ebp
 004019EB    pop         edi
 004019EC    pop         esi
 004019ED    pop         ebx
 004019EE    ret
*}
end;

//004019F0
function FreeCommitted(addr:PAnsiChar; maxSize:Integer):TBlock;
begin
{*
 004019F0    push        ebx
 004019F1    push        esi
 004019F2    push        edi
 004019F3    add         esp,0FFFFFFEC
 004019F6    mov         edi,ecx
 004019F8    mov         dword ptr [esp],edx
 004019FB    lea         ebx,[eax+3FFF]
 00401A01    and         ebx,0FFFFC000
 00401A07    mov         esi,dword ptr [esp]
 00401A0A    add         esi,eax
 00401A0C    and         esi,0FFFFC000
 00401A12    cmp         ebx,esi
>00401A14    jae         00401A71
 00401A16    mov         ecx,edi
 00401A18    mov         edx,esi
 00401A1A    sub         edx,ebx
 00401A1C    mov         eax,ebx
 00401A1E    call        Decommit
 00401A23    lea         ecx,[esp+4]
 00401A27    mov         edx,edi
 00401A29    mov         eax,5AF5F8
 00401A2E    call        MergeBlockAfter
 00401A33    mov         ebx,dword ptr [esp+4]
 00401A37    test        ebx,ebx
>00401A39    je          00401A5A
 00401A3B    lea         ecx,[esp+0C]
 00401A3F    mov         edx,dword ptr [esp+8]
 00401A43    mov         eax,ebx
 00401A45    call        FreeSpace
 00401A4A    mov         eax,dword ptr [esp+0C]
 00401A4E    mov         dword ptr [esp+4],eax
 00401A52    mov         eax,dword ptr [esp+10]
 00401A56    mov         dword ptr [esp+8],eax
 00401A5A    cmp         dword ptr [esp+4],0
>00401A5F    je          00401A75
 00401A61    lea         edx,[esp+4]
 00401A65    mov         eax,5AF5F8
 00401A6A    call        RemoveBlock
>00401A6F    jmp         00401A75
 00401A71    xor         eax,eax
 00401A73    mov         dword ptr [edi],eax
 00401A75    add         esp,14
 00401A78    pop         edi
 00401A79    pop         esi
 00401A7A    pop         ebx
 00401A7B    ret
*}
end;

//00401A7C
function InitAllocator:Boolean;
begin
{*
 00401A7C    push        ebp
 00401A7D    mov         ebp,esp
 00401A7F    xor         edx,edx
 00401A81    push        ebp
 00401A82    push        401B32
 00401A87    push        dword ptr fs:[edx]
 00401A8A    mov         dword ptr fs:[edx],esp
 00401A8D    push        5AF5C8
 00401A92    call        KERNEL32.InitializeCriticalSection
 00401A97    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>00401A9E    je          00401AAA
 00401AA0    push        5AF5C8
 00401AA5    call        KERNEL32.EnterCriticalSection
 00401AAA    mov         eax,5AF5E8
 00401AAF    call        MakeEmpty
 00401AB4    mov         eax,5AF5F8
 00401AB9    call        MakeEmpty
 00401ABE    mov         eax,5AF624
 00401AC3    call        MakeEmpty
 00401AC8    push        0FF8
 00401ACD    push        0
 00401ACF    call        KERNEL32.LocalAlloc
 00401AD4    mov         [005AF620],eax
 00401AD9    cmp         dword ptr ds:[5AF620],0
>00401AE0    je          00401B11
 00401AE2    mov         eax,3
 00401AE7    mov         edx,dword ptr ds:[5AF620]
 00401AED    xor         ecx,ecx
 00401AEF    mov         dword ptr [edx+eax*4-0C],ecx
 00401AF3    inc         eax
 00401AF4    cmp         eax,401
>00401AF9    jne         00401AE7
 00401AFB    mov         eax,5AF608
 00401B00    mov         dword ptr [eax+4],eax
 00401B03    mov         dword ptr [eax],eax
 00401B05    mov         [005AF614],eax
 00401B0A    mov         byte ptr ds:[5AF5C0],1
 00401B11    xor         eax,eax
 00401B13    pop         edx
 00401B14    pop         ecx
 00401B15    pop         ecx
 00401B16    mov         dword ptr fs:[eax],edx
 00401B19    push        401B39
 00401B1E    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>00401B25    je          00401B31
 00401B27    push        5AF5C8
 00401B2C    call        KERNEL32.LeaveCriticalSection
 00401B31    ret
>00401B32    jmp         @HandleFinally
>00401B37    jmp         00401B1E
 00401B39    mov         al,[005AF5C0]
 00401B3E    pop         ebp
 00401B3F    ret
*}
end;

//00401B40
procedure UninitAllocator;
begin
{*
 00401B40    push        ebp
 00401B41    mov         ebp,esp
 00401B43    push        ebx
 00401B44    cmp         byte ptr ds:[5AF5C0],0
>00401B4B    je          00401C1D
 00401B51    xor         edx,edx
 00401B53    push        ebp
 00401B54    push        401C16
 00401B59    push        dword ptr fs:[edx]
 00401B5C    mov         dword ptr fs:[edx],esp
 00401B5F    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>00401B66    je          00401B72
 00401B68    push        5AF5C8
 00401B6D    call        KERNEL32.EnterCriticalSection
 00401B72    mov         byte ptr ds:[5AF5C0],0
 00401B79    mov         eax,[005AF620]
 00401B7E    push        eax
 00401B7F    call        KERNEL32.LocalFree
 00401B84    xor         eax,eax
 00401B86    mov         [005AF620],eax
 00401B8B    mov         ebx,dword ptr ds:[5AF5E8]
>00401B91    jmp         00401BA5
 00401B93    push        8000
 00401B98    push        0
 00401B9A    mov         eax,dword ptr [ebx+8]
 00401B9D    push        eax
 00401B9E    call        KERNEL32.VirtualFree
 00401BA3    mov         ebx,dword ptr [ebx]
 00401BA5    cmp         ebx,5AF5E8
>00401BAB    jne         00401B93
 00401BAD    mov         eax,5AF5E8
 00401BB2    call        MakeEmpty
 00401BB7    mov         eax,5AF5F8
 00401BBC    call        MakeEmpty
 00401BC1    mov         eax,5AF624
 00401BC6    call        MakeEmpty
 00401BCB    mov         eax,[005AF5E0]
 00401BD0    test        eax,eax
>00401BD2    je          00401BEB
 00401BD4    mov         edx,dword ptr [eax]
 00401BD6    mov         dword ptr ds:[5AF5E0],edx
 00401BDC    push        eax
 00401BDD    call        KERNEL32.LocalFree
 00401BE2    mov         eax,[005AF5E0]
 00401BE7    test        eax,eax
>00401BE9    jne         00401BD4
 00401BEB    xor         eax,eax
 00401BED    pop         edx
 00401BEE    pop         ecx
 00401BEF    pop         ecx
 00401BF0    mov         dword ptr fs:[eax],edx
 00401BF3    push        401C1D
 00401BF8    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>00401BFF    je          00401C0B
 00401C01    push        5AF5C8
 00401C06    call        KERNEL32.LeaveCriticalSection
 00401C0B    push        5AF5C8
 00401C10    call        KERNEL32.DeleteCriticalSection
 00401C15    ret
>00401C16    jmp         @HandleFinally
>00401C1B    jmp         00401BF8
 00401C1D    pop         ebx
 00401C1E    pop         ebp
 00401C1F    ret
*}
end;

//00401C20
procedure DeleteFree(f:PFree);
begin
{*
 00401C20    push        ebx
 00401C21    cmp         eax,dword ptr ds:[5AF614]
>00401C27    jne         00401C32
 00401C29    mov         edx,dword ptr [eax+4]
 00401C2C    mov         dword ptr ds:[5AF614],edx
 00401C32    mov         edx,dword ptr [eax+4]
 00401C35    mov         ecx,dword ptr [eax+8]
 00401C38    cmp         ecx,1000
>00401C3E    jg          00401C78
 00401C40    cmp         eax,edx
>00401C42    jne         00401C5B
 00401C44    test        ecx,ecx
>00401C46    jns         00401C4B
 00401C48    add         ecx,3
 00401C4B    sar         ecx,2
 00401C4E    mov         eax,[005AF620]
 00401C53    xor         edx,edx
 00401C55    mov         dword ptr [eax+ecx*4-0C],edx
>00401C59    jmp         00401C7F
 00401C5B    test        ecx,ecx
>00401C5D    jns         00401C62
 00401C5F    add         ecx,3
 00401C62    sar         ecx,2
 00401C65    mov         ebx,dword ptr ds:[5AF620]
 00401C6B    mov         dword ptr [ebx+ecx*4-0C],edx
 00401C6F    mov         eax,dword ptr [eax]
 00401C71    mov         dword ptr [edx],eax
 00401C73    mov         dword ptr [eax+4],edx
 00401C76    pop         ebx
 00401C77    ret
 00401C78    mov         eax,dword ptr [eax]
 00401C7A    mov         dword ptr [edx],eax
 00401C7C    mov         dword ptr [eax+4],edx
 00401C7F    pop         ebx
 00401C80    ret
*}
end;

//00401C84
function FindCommitted(addr:PAnsiChar):PBlockDesc;
begin
{*
 00401C84    mov         edx,dword ptr ds:[5AF624]
>00401C8A    jmp         00401C9C
 00401C8C    mov         ecx,dword ptr [edx+8]
 00401C8F    cmp         eax,ecx
>00401C91    jb          00401C9A
 00401C93    add         ecx,dword ptr [edx+0C]
 00401C96    cmp         eax,ecx
>00401C98    jb          00401CB0
 00401C9A    mov         edx,dword ptr [edx]
 00401C9C    cmp         edx,5AF624
>00401CA2    jne         00401C8C
 00401CA4    mov         dword ptr ds:[5AF5C4],3
 00401CAE    xor         edx,edx
 00401CB0    mov         eax,edx
 00401CB2    ret
*}
end;

//00401CB4
procedure FillBeforeGap(a:PAnsiChar; size:Integer);
begin
{*
 00401CB4    push        ebx
 00401CB5    mov         ecx,edx
 00401CB7    sub         ecx,4
 00401CBA    lea         ebx,[ecx+eax]
 00401CBD    cmp         edx,10
>00401CC0    jl          00401CD1
 00401CC2    mov         dword ptr [ebx],80000007
 00401CC8    mov         edx,ecx
 00401CCA    call        InsertFree
 00401CCF    pop         ebx
 00401CD0    ret
 00401CD1    cmp         edx,4
>00401CD4    jl          00401CE2
 00401CD6    mov         ecx,edx
 00401CD8    or          ecx,80000002
 00401CDE    mov         dword ptr [eax],ecx
 00401CE0    mov         dword ptr [ebx],ecx
 00401CE2    pop         ebx
 00401CE3    ret
*}
end;

//00401CE4
procedure InternalFreeMem(a:PAnsiChar);
begin
{*
 00401CE4    inc         dword ptr ds:[5AF5B0]
 00401CEA    mov         edx,eax
 00401CEC    sub         edx,4
 00401CEF    mov         edx,dword ptr [edx]
 00401CF1    and         edx,7FFFFFFC
 00401CF7    sub         edx,4
 00401CFA    add         dword ptr ds:[5AF5B4],edx
 00401D00    call        SysFreeMem
 00401D05    ret
*}
end;

//00401D08
procedure FillAfterGap(a:PAnsiChar; size:Integer);
begin
{*
 00401D08    cmp         edx,0C
>00401D0B    jl          00401D1B
 00401D0D    or          edx,2
 00401D10    mov         dword ptr [eax],edx
 00401D12    add         eax,4
 00401D15    call        InternalFreeMem
 00401D1A    ret
 00401D1B    cmp         edx,4
>00401D1E    jl          00401D2A
 00401D20    mov         ecx,edx
 00401D22    or          ecx,80000002
 00401D28    mov         dword ptr [eax],ecx
 00401D2A    add         eax,edx
 00401D2C    and         dword ptr [eax],0FFFFFFFE
 00401D2F    ret
*}
end;

//00401D30
function FillerSizeBeforeGap(a:PAnsiChar):Integer;
begin
{*
 00401D30    push        ebx
 00401D31    push        esi
 00401D32    mov         edx,eax
 00401D34    sub         edx,4
 00401D37    mov         edx,dword ptr [edx]
 00401D39    mov         ecx,edx
 00401D3B    and         ecx,80000002
 00401D41    cmp         ecx,80000002
>00401D47    je          00401D53
 00401D49    mov         dword ptr ds:[5AF5C4],4
 00401D53    mov         ebx,edx
 00401D55    and         ebx,7FFFFFFC
 00401D5B    sub         eax,ebx
 00401D5D    mov         ecx,eax
 00401D5F    xor         edx,dword ptr [ecx]
 00401D61    test        edx,0FFFFFFFE
>00401D67    je          00401D73
 00401D69    mov         dword ptr ds:[5AF5C4],5
 00401D73    test        byte ptr [ecx],1
>00401D76    je          00401D98
 00401D78    mov         edx,eax
 00401D7A    sub         edx,0C
 00401D7D    mov         esi,dword ptr [edx+8]
 00401D80    sub         eax,esi
 00401D82    cmp         esi,dword ptr [eax+8]
>00401D85    je          00401D91
 00401D87    mov         dword ptr ds:[5AF5C4],6
 00401D91    call        DeleteFree
 00401D96    add         ebx,esi
 00401D98    mov         eax,ebx
 00401D9A    pop         esi
 00401D9B    pop         ebx
 00401D9C    ret
*}
end;

//00401DA0
function FillerSizeAfterGap(a:PAnsiChar):Integer;
begin
{*
 00401DA0    push        ebx
 00401DA1    push        esi
 00401DA2    push        edi
 00401DA3    mov         ebx,eax
 00401DA5    xor         edi,edi
 00401DA7    mov         eax,dword ptr [ebx]
 00401DA9    test        eax,80000000
>00401DAE    je          00401DBB
 00401DB0    and         eax,7FFFFFFC
 00401DB5    add         edi,eax
 00401DB7    add         ebx,eax
 00401DB9    mov         eax,dword ptr [ebx]
 00401DBB    test        al,2
>00401DBD    jne         00401DD2
 00401DBF    mov         esi,ebx
 00401DC1    mov         eax,esi
 00401DC3    call        DeleteFree
 00401DC8    mov         eax,dword ptr [esi+8]
 00401DCB    add         edi,eax
 00401DCD    add         ebx,eax
 00401DCF    and         dword ptr [ebx],0FFFFFFFE
 00401DD2    mov         eax,edi
 00401DD4    pop         edi
 00401DD5    pop         esi
 00401DD6    pop         ebx
 00401DD7    ret
*}
end;

//00401DD8
function DecommitFree(a:PAnsiChar; size:Integer):Boolean;
begin
{*
 00401DD8    push        ebx
 00401DD9    push        esi
 00401DDA    push        edi
 00401DDB    push        ebp
 00401DDC    add         esp,0FFFFFFF4
 00401DDF    mov         edi,edx
 00401DE1    mov         esi,eax
 00401DE3    mov         byte ptr [esp],0
 00401DE7    mov         eax,esi
 00401DE9    call        FindCommitted
 00401DEE    mov         ebx,eax
 00401DF0    test        ebx,ebx
>00401DF2    je          00401E7A
 00401DF8    mov         ebp,dword ptr [ebx+8]
 00401DFB    mov         eax,ebp
 00401DFD    add         eax,dword ptr [ebx+0C]
 00401E00    mov         edx,eax
 00401E02    lea         ecx,[edi+esi]
 00401E05    sub         edx,ecx
 00401E07    cmp         edx,0C
>00401E0A    jg          00401E10
 00401E0C    mov         edi,eax
 00401E0E    sub         edi,esi
 00401E10    mov         eax,esi
 00401E12    sub         eax,ebp
 00401E14    cmp         eax,0C
>00401E17    jge         00401E2D
 00401E19    lea         ecx,[esp+1]
 00401E1D    mov         edx,esi
 00401E1F    sub         edx,dword ptr [ebx+8]
 00401E22    add         edx,edi
 00401E24    mov         eax,ebp
 00401E26    call        FreeCommitted
>00401E2B    jmp         00401E3E
 00401E2D    lea         ecx,[esp+1]
 00401E31    mov         edx,edi
 00401E33    sub         edx,4
 00401E36    lea         eax,[esi+4]
 00401E39    call        FreeCommitted
 00401E3E    mov         ebp,dword ptr [esp+1]
 00401E42    test        ebp,ebp
>00401E44    je          00401E7A
 00401E46    mov         edx,ebp
 00401E48    sub         edx,esi
 00401E4A    mov         eax,esi
 00401E4C    call        FillBeforeGap
 00401E51    mov         eax,ebp
 00401E53    add         eax,dword ptr [esp+5]
 00401E57    mov         edx,dword ptr [ebx+8]
 00401E5A    add         edx,dword ptr [ebx+0C]
 00401E5D    cmp         eax,edx
>00401E5F    jae         00401E6B
 00401E61    lea         edx,[edi+esi]
 00401E64    sub         edx,eax
 00401E66    call        FillAfterGap
 00401E6B    lea         edx,[esp+1]
 00401E6F    mov         eax,ebx
 00401E71    call        RemoveBlock
 00401E76    mov         byte ptr [esp],1
 00401E7A    mov         al,byte ptr [esp]
 00401E7D    add         esp,0C
 00401E80    pop         ebp
 00401E81    pop         edi
 00401E82    pop         esi
 00401E83    pop         ebx
 00401E84    ret
*}
end;

//00401E88
procedure InsertFree(a:Pointer; size:Integer);
begin
{*
 00401E88    push        ebx
 00401E89    push        esi
 00401E8A    push        edi
 00401E8B    mov         esi,edx
 00401E8D    mov         edi,eax
 00401E8F    mov         ebx,edi
 00401E91    mov         dword ptr [ebx+8],esi
 00401E94    mov         eax,ebx
 00401E96    add         eax,esi
 00401E98    sub         eax,0C
 00401E9B    mov         dword ptr [eax+8],esi
 00401E9E    cmp         esi,1000
>00401EA4    jg          00401EDD
 00401EA6    mov         edx,esi
 00401EA8    test        edx,edx
>00401EAA    jns         00401EAF
 00401EAC    add         edx,3
 00401EAF    sar         edx,2
 00401EB2    mov         eax,[005AF620]
 00401EB7    mov         eax,dword ptr [eax+edx*4-0C]
 00401EBB    test        eax,eax
>00401EBD    jne         00401ECF
 00401EBF    mov         eax,[005AF620]
 00401EC4    mov         dword ptr [eax+edx*4-0C],ebx
 00401EC8    mov         dword ptr [ebx+4],ebx
 00401ECB    mov         dword ptr [ebx],ebx
>00401ECD    jmp         00401F09
 00401ECF    mov         edx,dword ptr [eax]
 00401ED1    mov         dword ptr [ebx+4],eax
 00401ED4    mov         dword ptr [ebx],edx
 00401ED6    mov         dword ptr [eax],ebx
 00401ED8    mov         dword ptr [edx+4],ebx
>00401EDB    jmp         00401F09
 00401EDD    cmp         esi,3C00
>00401EE3    jl          00401EF2
 00401EE5    mov         edx,esi
 00401EE7    mov         eax,edi
 00401EE9    call        DecommitFree
 00401EEE    test        al,al
>00401EF0    jne         00401F09
 00401EF2    mov         eax,[005AF614]
 00401EF7    mov         dword ptr ds:[5AF614],ebx
 00401EFD    mov         edx,dword ptr [eax]
 00401EFF    mov         dword ptr [ebx+4],eax
 00401F02    mov         dword ptr [ebx],edx
 00401F04    mov         dword ptr [eax],ebx
 00401F06    mov         dword ptr [edx+4],ebx
 00401F09    pop         edi
 00401F0A    pop         esi
 00401F0B    pop         ebx
 00401F0C    ret
*}
end;

//00401F10
procedure FreeCurAlloc;
begin
{*
 00401F10    cmp         dword ptr ds:[5AF618],0
>00401F17    jle         00401F59
 00401F19    cmp         dword ptr ds:[5AF618],0C
>00401F20    jge         00401F2E
 00401F22    mov         dword ptr ds:[5AF5C4],7
>00401F2C    jmp         00401F59
 00401F2E    mov         eax,[005AF618]
 00401F33    or          eax,2
 00401F36    mov         edx,dword ptr ds:[5AF61C]
 00401F3C    mov         dword ptr [edx],eax
 00401F3E    mov         eax,[005AF61C]
 00401F43    add         eax,4
 00401F46    call        InternalFreeMem
 00401F4B    xor         eax,eax
 00401F4D    mov         [005AF61C],eax
 00401F52    xor         eax,eax
 00401F54    mov         [005AF618],eax
 00401F59    ret
*}
end;

//00401F5C
function MergeCommit(b:TBlock):Boolean;
begin
{*
 00401F5C    push        ebx
 00401F5D    push        esi
 00401F5E    push        edi
 00401F5F    add         esp,0FFFFFFF0
 00401F62    mov         esi,eax
 00401F64    lea         edi,[esp]
 00401F67    movs        dword ptr [edi],dword ptr [esi]
 00401F68    movs        dword ptr [edi],dword ptr [esi]
 00401F69    mov         edi,esp
 00401F6B    call        FreeCurAlloc
 00401F70    lea         ecx,[esp+8]
 00401F74    mov         edx,edi
 00401F76    mov         eax,5AF624
 00401F7B    call        MergeBlockAfter
 00401F80    mov         ebx,dword ptr [esp+8]
 00401F84    test        ebx,ebx
>00401F86    jne         00401F8C
 00401F88    xor         eax,eax
>00401F8A    jmp         00401FDE
 00401F8C    mov         eax,dword ptr [edi]
 00401F8E    cmp         ebx,eax
>00401F90    jae         00401F9C
 00401F92    call        FillerSizeBeforeGap
 00401F97    sub         dword ptr [edi],eax
 00401F99    add         dword ptr [edi+4],eax
 00401F9C    mov         eax,dword ptr [edi]
 00401F9E    add         eax,dword ptr [edi+4]
 00401FA1    mov         esi,ebx
 00401FA3    add         esi,dword ptr [esp+0C]
 00401FA7    cmp         eax,esi
>00401FA9    jae         00401FB3
 00401FAB    call        FillerSizeAfterGap
 00401FB0    add         dword ptr [edi+4],eax
 00401FB3    mov         eax,dword ptr [edi]
 00401FB5    add         eax,dword ptr [edi+4]
 00401FB8    cmp         esi,eax
>00401FBA    jne         00401FCD
 00401FBC    sub         eax,4
 00401FBF    mov         edx,4
 00401FC4    call        FillBeforeGap
 00401FC9    sub         dword ptr [edi+4],4
 00401FCD    mov         eax,dword ptr [edi]
 00401FCF    mov         [005AF61C],eax
 00401FD4    mov         eax,dword ptr [edi+4]
 00401FD7    mov         [005AF618],eax
 00401FDC    mov         al,1
 00401FDE    add         esp,10
 00401FE1    pop         edi
 00401FE2    pop         esi
 00401FE3    pop         ebx
 00401FE4    ret
*}
end;

//00401FE8
function NewCommit(minSize:Integer):Boolean;
begin
{*
 00401FE8    push        ebx
 00401FE9    add         esp,0FFFFFFF8
 00401FEC    mov         ebx,eax
 00401FEE    mov         edx,esp
 00401FF0    lea         eax,[ebx+4]
 00401FF3    call        GetCommitted
 00401FF8    cmp         dword ptr [esp],0
>00401FFC    je          00402009
 00401FFE    mov         eax,esp
 00402000    call        MergeCommit
 00402005    test        al,al
>00402007    jne         0040200D
 00402009    xor         eax,eax
>0040200B    jmp         0040200F
 0040200D    mov         al,1
 0040200F    pop         ecx
 00402010    pop         edx
 00402011    pop         ebx
 00402012    ret
*}
end;

//00402014
function NewCommitAt(addr:Pointer; minSize:Integer):Boolean;
begin
{*
 00402014    push        ebx
 00402015    push        esi
 00402016    add         esp,0FFFFFFF8
 00402019    mov         esi,edx
 0040201B    mov         ebx,eax
 0040201D    mov         ecx,esp
 0040201F    lea         edx,[esi+4]
 00402022    mov         eax,ebx
 00402024    call        GetCommittedAt
 00402029    cmp         dword ptr [esp],0
>0040202D    je          0040203A
 0040202F    mov         eax,esp
 00402031    call        MergeCommit
 00402036    test        al,al
>00402038    jne         0040203E
 0040203A    xor         eax,eax
>0040203C    jmp         00402040
 0040203E    mov         al,1
 00402040    pop         ecx
 00402041    pop         edx
 00402042    pop         esi
 00402043    pop         ebx
 00402044    ret
*}
end;

//00402048
function SearchSmallBlocks(size:Integer):PFree;
begin
{*
 00402048    xor         edx,edx
 0040204A    test        eax,eax
>0040204C    jns         00402051
 0040204E    add         eax,3
 00402051    sar         eax,2
 00402054    cmp         eax,400
>00402059    jg          00402071
 0040205B    mov         edx,dword ptr ds:[5AF620]
 00402061    mov         edx,dword ptr [edx+eax*4-0C]
 00402065    test        edx,edx
>00402067    jne         00402071
 00402069    inc         eax
 0040206A    cmp         eax,401
>0040206F    jne         0040205B
 00402071    mov         eax,edx
 00402073    ret
*}
end;

//00402074
function TryHarder(size:Integer):Pointer;
begin
{*
 00402074    push        ebx
 00402075    push        esi
 00402076    push        edi
 00402077    push        ebp
 00402078    mov         esi,eax
 0040207A    mov         edi,5AF614
 0040207F    mov         ebp,5AF618
 00402084    mov         ebx,dword ptr ds:[5AF60C]
 0040208A    cmp         esi,dword ptr [ebx+8]
>0040208D    jle         00402117
 00402093    mov         ebx,dword ptr [edi]
 00402095    mov         eax,dword ptr [ebx+8]
 00402098    cmp         esi,eax
>0040209A    jle         00402117
 0040209C    mov         dword ptr [ebx+8],esi
 0040209F    mov         ebx,dword ptr [ebx+4]
 004020A2    cmp         esi,dword ptr [ebx+8]
>004020A5    jg          0040209F
 004020A7    mov         edx,dword ptr [edi]
 004020A9    mov         dword ptr [edx+8],eax
 004020AC    cmp         ebx,dword ptr [edi]
>004020AE    je          004020B4
 004020B0    mov         dword ptr [edi],ebx
>004020B2    jmp         00402117
 004020B4    cmp         esi,1000
>004020BA    jg          004020C9
 004020BC    mov         eax,esi
 004020BE    call        SearchSmallBlocks
 004020C3    mov         ebx,eax
 004020C5    test        ebx,ebx
>004020C7    jne         00402117
 004020C9    mov         eax,esi
 004020CB    call        NewCommit
 004020D0    test        al,al
>004020D2    jne         004020DB
 004020D4    xor         eax,eax
>004020D6    jmp         00402163
 004020DB    cmp         esi,dword ptr [ebp]
>004020DE    jg          00402084
 004020E0    sub         dword ptr [ebp],esi
 004020E3    cmp         dword ptr [ebp],0C
>004020E7    jge         004020F1
 004020E9    add         esi,dword ptr [ebp]
 004020EC    xor         eax,eax
 004020EE    mov         dword ptr [ebp],eax
 004020F1    mov         eax,[005AF61C]
 004020F6    add         dword ptr ds:[5AF61C],esi
 004020FC    mov         edx,esi
 004020FE    or          edx,2
 00402101    mov         dword ptr [eax],edx
 00402103    add         eax,4
 00402106    inc         dword ptr ds:[5AF5B0]
 0040210C    sub         esi,4
 0040210F    add         dword ptr ds:[5AF5B4],esi
>00402115    jmp         00402163
 00402117    mov         eax,ebx
 00402119    call        DeleteFree
 0040211E    mov         edx,dword ptr [ebx+8]
 00402121    mov         eax,edx
 00402123    sub         eax,esi
 00402125    cmp         eax,0C
>00402128    jl          00402136
 0040212A    mov         edx,ebx
 0040212C    add         edx,esi
 0040212E    xchg        eax,edx
 0040212F    call        InsertFree
>00402134    jmp         00402148
 00402136    mov         esi,edx
 00402138    cmp         ebx,dword ptr [edi]
>0040213A    jne         00402141
 0040213C    mov         eax,dword ptr [ebx+4]
 0040213F    mov         dword ptr [edi],eax
 00402141    mov         eax,ebx
 00402143    add         eax,esi
 00402145    and         dword ptr [eax],0FFFFFFFE
 00402148    mov         eax,ebx
 0040214A    mov         edx,esi
 0040214C    or          edx,2
 0040214F    mov         dword ptr [eax],edx
 00402151    add         eax,4
 00402154    inc         dword ptr ds:[5AF5B0]
 0040215A    sub         esi,4
 0040215D    add         dword ptr ds:[5AF5B4],esi
 00402163    pop         ebp
 00402164    pop         edi
 00402165    pop         esi
 00402166    pop         ebx
 00402167    ret
*}
end;

//00402168
function SysGetMem(Size:Integer):Pointer;
begin
{*
 00402168    push        ebp
 00402169    mov         ebp,esp
 0040216B    add         esp,0FFFFFFF8
 0040216E    push        ebx
 0040216F    push        esi
 00402170    push        edi
 00402171    mov         ebx,eax
 00402173    cmp         byte ptr ds:[5AF5C0],0
>0040217A    jne         00402185
 0040217C    call        InitAllocator
 00402181    test        al,al
>00402183    je          0040218D
 00402185    cmp         ebx,7FFFFFF8
>0040218B    jle         00402197
 0040218D    xor         eax,eax
 0040218F    mov         dword ptr [ebp-4],eax
>00402192    jmp         004022EB
 00402197    xor         ecx,ecx
 00402199    push        ebp
 0040219A    push        4022E4
 0040219F    push        dword ptr fs:[ecx]
 004021A2    mov         dword ptr fs:[ecx],esp
 004021A5    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>004021AC    je          004021B8
 004021AE    push        5AF5C8
 004021B3    call        KERNEL32.EnterCriticalSection
 004021B8    add         ebx,7
 004021BB    and         ebx,0FFFFFFFC
 004021BE    cmp         ebx,0C
>004021C1    jge         004021C8
 004021C3    mov         ebx,0C
 004021C8    cmp         ebx,1000
>004021CE    jg          00402267
 004021D4    mov         eax,ebx
 004021D6    test        eax,eax
>004021D8    jns         004021DD
 004021DA    add         eax,3
 004021DD    sar         eax,2
 004021E0    mov         edx,dword ptr ds:[5AF620]
 004021E6    mov         edx,dword ptr [edx+eax*4-0C]
 004021EA    test        edx,edx
>004021EC    je          00402267
 004021EE    mov         esi,edx
 004021F0    mov         eax,esi
 004021F2    add         eax,ebx
 004021F4    and         dword ptr [eax],0FFFFFFFE
 004021F7    mov         eax,dword ptr [edx+4]
 004021FA    cmp         edx,eax
>004021FC    jne         00402218
 004021FE    mov         eax,ebx
 00402200    test        eax,eax
>00402202    jns         00402207
 00402204    add         eax,3
 00402207    sar         eax,2
 0040220A    mov         ecx,dword ptr ds:[5AF620]
 00402210    xor         edi,edi
 00402212    mov         dword ptr [ecx+eax*4-0C],edi
>00402216    jmp         0040223E
 00402218    mov         ecx,ebx
 0040221A    test        ecx,ecx
>0040221C    jns         00402221
 0040221E    add         ecx,3
 00402221    sar         ecx,2
 00402224    mov         edi,dword ptr ds:[5AF620]
 0040222A    mov         dword ptr [edi+ecx*4-0C],eax
 0040222E    mov         ecx,dword ptr [edx]
 00402230    mov         dword ptr [ebp-8],ecx
 00402233    mov         ecx,dword ptr [ebp-8]
 00402236    mov         dword ptr [ecx+4],eax
 00402239    mov         ecx,dword ptr [ebp-8]
 0040223C    mov         dword ptr [eax],ecx
 0040223E    mov         eax,esi
 00402240    mov         edx,dword ptr [edx+8]
 00402243    or          edx,2
 00402246    mov         dword ptr [eax],edx
 00402248    add         eax,4
 0040224B    mov         dword ptr [ebp-4],eax
 0040224E    inc         dword ptr ds:[5AF5B0]
 00402254    sub         ebx,4
 00402257    add         dword ptr ds:[5AF5B4],ebx
 0040225D    call        @TryFinallyExit
>00402262    jmp         004022EB
 00402267    cmp         ebx,dword ptr ds:[5AF618]
>0040226D    jg          004022B9
 0040226F    sub         dword ptr ds:[5AF618],ebx
 00402275    cmp         dword ptr ds:[5AF618],0C
>0040227C    jge         0040228B
 0040227E    add         ebx,dword ptr ds:[5AF618]
 00402284    xor         eax,eax
 00402286    mov         [005AF618],eax
 0040228B    mov         eax,[005AF61C]
 00402290    add         dword ptr ds:[5AF61C],ebx
 00402296    mov         edx,ebx
 00402298    or          edx,2
 0040229B    mov         dword ptr [eax],edx
 0040229D    add         eax,4
 004022A0    mov         dword ptr [ebp-4],eax
 004022A3    inc         dword ptr ds:[5AF5B0]
 004022A9    sub         ebx,4
 004022AC    add         dword ptr ds:[5AF5B4],ebx
 004022B2    call        @TryFinallyExit
>004022B7    jmp         004022EB
 004022B9    mov         eax,ebx
 004022BB    call        TryHarder
 004022C0    mov         dword ptr [ebp-4],eax
 004022C3    xor         eax,eax
 004022C5    pop         edx
 004022C6    pop         ecx
 004022C7    pop         ecx
 004022C8    mov         dword ptr fs:[eax],edx
 004022CB    push        4022EB
 004022D0    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>004022D7    je          004022E3
 004022D9    push        5AF5C8
 004022DE    call        KERNEL32.LeaveCriticalSection
 004022E3    ret
>004022E4    jmp         @HandleFinally
>004022E9    jmp         004022D0
 004022EB    mov         eax,dword ptr [ebp-4]
 004022EE    pop         edi
 004022EF    pop         esi
 004022F0    pop         ebx
 004022F1    pop         ecx
 004022F2    pop         ecx
 004022F3    pop         ebp
 004022F4    ret
*}
end;

//004022F8
function SysFreeMem(P:Pointer):Integer;
begin
{*
 004022F8    push        ebp
 004022F9    mov         ebp,esp
 004022FB    push        ecx
 004022FC    push        ebx
 004022FD    push        esi
 004022FE    push        edi
 004022FF    mov         ebx,eax
 00402301    xor         eax,eax
 00402303    mov         [005AF5C4],eax
 00402308    cmp         byte ptr ds:[5AF5C0],0
>0040230F    jne         00402330
 00402311    call        InitAllocator
 00402316    test        al,al
>00402318    jne         00402330
 0040231A    mov         dword ptr ds:[5AF5C4],8
 00402324    mov         dword ptr [ebp-4],8
>0040232B    jmp         00402491
 00402330    xor         ecx,ecx
 00402332    push        ebp
 00402333    push        40248A
 00402338    push        dword ptr fs:[ecx]
 0040233B    mov         dword ptr fs:[ecx],esp
 0040233E    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>00402345    je          00402351
 00402347    push        5AF5C8
 0040234C    call        KERNEL32.EnterCriticalSection
 00402351    mov         esi,ebx
 00402353    sub         esi,4
 00402356    mov         ebx,dword ptr [esi]
 00402358    test        bl,2
>0040235B    jne         0040236C
 0040235D    mov         dword ptr ds:[5AF5C4],9
>00402367    jmp         00402461
 0040236C    dec         dword ptr ds:[5AF5B0]
 00402372    mov         eax,ebx
 00402374    and         eax,7FFFFFFC
 00402379    sub         eax,4
 0040237C    sub         dword ptr ds:[5AF5B4],eax
 00402382    test        bl,1
>00402385    je          004023CC
 00402387    mov         eax,esi
 00402389    sub         eax,0C
 0040238C    mov         edx,dword ptr [eax+8]
 0040238F    cmp         edx,0C
>00402392    jl          0040239C
 00402394    test        edx,80000003
>0040239A    je          004023AB
 0040239C    mov         dword ptr ds:[5AF5C4],0A
>004023A6    jmp         00402461
 004023AB    mov         eax,esi
 004023AD    sub         eax,edx
 004023AF    cmp         edx,dword ptr [eax+8]
>004023B2    je          004023C3
 004023B4    mov         dword ptr ds:[5AF5C4],0A
>004023BE    jmp         00402461
 004023C3    add         ebx,edx
 004023C5    mov         esi,eax
 004023C7    call        DeleteFree
 004023CC    and         ebx,7FFFFFFC
 004023D2    mov         eax,esi
 004023D4    add         eax,ebx
 004023D6    mov         edi,eax
 004023D8    cmp         edi,dword ptr ds:[5AF61C]
>004023DE    jne         0040240C
 004023E0    sub         dword ptr ds:[5AF61C],ebx
 004023E6    add         dword ptr ds:[5AF618],ebx
 004023EC    cmp         dword ptr ds:[5AF618],3C00
>004023F6    jle         004023FD
 004023F8    call        FreeCurAlloc
 004023FD    xor         eax,eax
 004023FF    mov         dword ptr [ebp-4],eax
 00402402    call        @TryFinallyExit
>00402407    jmp         00402491
 0040240C    mov         edx,dword ptr [eax]
 0040240E    test        dl,2
>00402411    je          0040242F
 00402413    and         edx,7FFFFFFC
 00402419    cmp         edx,4
>0040241C    jge         0040242A
 0040241E    mov         dword ptr ds:[5AF5C4],0B
>00402428    jmp         00402461
 0040242A    or          dword ptr [eax],1
>0040242D    jmp         00402458
 0040242F    mov         eax,edi
 00402431    cmp         dword ptr [eax+4],0
>00402435    je          00402442
 00402437    cmp         dword ptr [eax],0
>0040243A    je          00402442
 0040243C    cmp         dword ptr [eax+8],0C
>00402440    jge         0040244E
 00402442    mov         dword ptr ds:[5AF5C4],0B
>0040244C    jmp         00402461
 0040244E    mov         edx,dword ptr [eax+8]
 00402451    add         ebx,edx
 00402453    call        DeleteFree
 00402458    mov         edx,ebx
 0040245A    mov         eax,esi
 0040245C    call        InsertFree
 00402461    mov         eax,[005AF5C4]
 00402466    mov         dword ptr [ebp-4],eax
 00402469    xor         eax,eax
 0040246B    pop         edx
 0040246C    pop         ecx
 0040246D    pop         ecx
 0040246E    mov         dword ptr fs:[eax],edx
 00402471    push        402491
 00402476    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>0040247D    je          00402489
 0040247F    push        5AF5C8
 00402484    call        KERNEL32.LeaveCriticalSection
 00402489    ret
>0040248A    jmp         @HandleFinally
>0040248F    jmp         00402476
 00402491    mov         eax,dword ptr [ebp-4]
 00402494    pop         edi
 00402495    pop         esi
 00402496    pop         ebx
 00402497    pop         ecx
 00402498    pop         ebp
 00402499    ret
*}
end;

//0040249C
function ResizeInPlace(p:Pointer; newSize:Integer):Boolean;
begin
{*
 0040249C    push        ebx
 0040249D    push        esi
 0040249E    push        edi
 0040249F    push        ebp
 004024A0    add         esp,0FFFFFFF8
 004024A3    mov         esi,edx
 004024A5    add         esi,7
 004024A8    and         esi,0FFFFFFFC
 004024AB    cmp         esi,0C
>004024AE    jge         004024B5
 004024B0    mov         esi,0C
 004024B5    mov         ebp,eax
 004024B7    sub         ebp,4
 004024BA    mov         edi,dword ptr [ebp]
 004024BD    and         edi,7FFFFFFC
 004024C3    mov         eax,ebp
 004024C5    add         eax,edi
 004024C7    mov         ebx,eax
 004024C9    cmp         edi,esi
>004024CB    jne         004024D4
 004024CD    mov         al,1
>004024CF    jmp         0040266F
 004024D4    cmp         edi,esi
>004024D6    jle         0040255F
 004024DC    mov         edx,edi
 004024DE    sub         edx,esi
 004024E0    mov         dword ptr [esp],edx
 004024E3    cmp         ebx,dword ptr ds:[5AF61C]
>004024E9    jne         00402523
 004024EB    mov         eax,dword ptr [esp]
 004024EE    sub         dword ptr ds:[5AF61C],eax
 004024F4    mov         eax,dword ptr [esp]
 004024F7    add         dword ptr ds:[5AF618],eax
 004024FD    cmp         dword ptr ds:[5AF618],0C
>00402504    jge         00402656
 0040250A    mov         eax,dword ptr [esp]
 0040250D    add         dword ptr ds:[5AF61C],eax
 00402513    mov         eax,dword ptr [esp]
 00402516    sub         dword ptr ds:[5AF618],eax
 0040251C    mov         esi,edi
>0040251E    jmp         00402656
 00402523    mov         ebx,eax
 00402525    test        byte ptr [ebx],2
>00402528    jne         00402537
 0040252A    mov         eax,ebx
 0040252C    mov         edx,dword ptr [eax+8]
 0040252F    add         dword ptr [esp],edx
 00402532    call        DeleteFree
 00402537    cmp         dword ptr [esp],0C
>0040253B    jl          00402558
 0040253D    mov         ebx,ebp
 0040253F    add         ebx,esi
 00402541    mov         eax,dword ptr [esp]
 00402544    or          eax,2
 00402547    mov         dword ptr [ebx],eax
 00402549    mov         eax,ebx
 0040254B    add         eax,4
 0040254E    call        InternalFreeMem
>00402553    jmp         00402656
 00402558    mov         esi,edi
>0040255A    jmp         00402656
 0040255F    mov         eax,esi
 00402561    sub         eax,edi
 00402563    mov         dword ptr [esp+4],eax
 00402567    cmp         ebx,dword ptr ds:[5AF61C]
>0040256D    jne         004025D6
 0040256F    mov         eax,[005AF618]
 00402574    cmp         eax,dword ptr [esp+4]
>00402578    jl          004025CD
 0040257A    mov         eax,dword ptr [esp+4]
 0040257E    sub         dword ptr ds:[5AF618],eax
 00402584    mov         eax,dword ptr [esp+4]
 00402588    add         dword ptr ds:[5AF61C],eax
 0040258E    cmp         dword ptr ds:[5AF618],0C
>00402595    jge         004025AF
 00402597    mov         eax,[005AF618]
 0040259C    add         dword ptr ds:[5AF61C],eax
 004025A2    add         esi,dword ptr ds:[5AF618]
 004025A8    xor         eax,eax
 004025AA    mov         [005AF618],eax
 004025AF    mov         eax,esi
 004025B1    sub         eax,edi
 004025B3    add         dword ptr ds:[5AF5B4],eax
 004025B9    mov         eax,dword ptr [ebp]
 004025BC    and         eax,80000003
 004025C1    or          esi,eax
 004025C3    mov         dword ptr [ebp],esi
 004025C6    mov         al,1
>004025C8    jmp         0040266F
 004025CD    call        FreeCurAlloc
 004025D2    mov         ebx,ebp
 004025D4    add         ebx,edi
 004025D6    test        byte ptr [ebx],2
>004025D9    jne         00402628
 004025DB    mov         edx,ebx
 004025DD    mov         eax,edx
 004025DF    mov         ecx,dword ptr [eax+8]
 004025E2    mov         dword ptr [esp],ecx
 004025E5    mov         ecx,dword ptr [esp]
 004025E8    cmp         ecx,dword ptr [esp+4]
>004025EC    jge         004025FC
 004025EE    add         edx,dword ptr [esp]
 004025F1    mov         ebx,edx
 004025F3    mov         eax,dword ptr [esp]
 004025F6    sub         dword ptr [esp+4],eax
>004025FA    jmp         00402628
 004025FC    call        DeleteFree
 00402601    mov         eax,dword ptr [esp+4]
 00402605    sub         dword ptr [esp],eax
 00402608    cmp         dword ptr [esp],0C
>0040260C    jl          0040261C
 0040260E    mov         eax,ebp
 00402610    add         eax,esi
 00402612    mov         edx,dword ptr [esp]
 00402615    call        InsertFree
>0040261A    jmp         00402656
 0040261C    add         esi,dword ptr [esp]
 0040261F    mov         ebx,ebp
 00402621    add         ebx,esi
 00402623    and         dword ptr [ebx],0FFFFFFFE
>00402626    jmp         00402656
 00402628    mov         eax,dword ptr [ebx]
 0040262A    test        eax,80000000
>0040262F    je          00402652
 00402631    and         eax,7FFFFFFC
 00402636    add         eax,ebx
 00402638    mov         ebx,eax
 0040263A    mov         edx,dword ptr [esp+4]
 0040263E    mov         eax,ebx
 00402640    call        NewCommitAt
 00402645    test        al,al
>00402647    je          00402652
 00402649    mov         ebx,ebp
 0040264B    add         ebx,edi
>0040264D    jmp         0040255F
 00402652    xor         eax,eax
>00402654    jmp         0040266F
 00402656    mov         eax,esi
 00402658    sub         eax,edi
 0040265A    add         dword ptr ds:[5AF5B4],eax
 00402660    mov         eax,dword ptr [ebp]
 00402663    and         eax,80000003
 00402668    or          esi,eax
 0040266A    mov         dword ptr [ebp],esi
 0040266D    mov         al,1
 0040266F    pop         ecx
 00402670    pop         edx
 00402671    pop         ebp
 00402672    pop         edi
 00402673    pop         esi
 00402674    pop         ebx
 00402675    ret
*}
end;

//00402678
function SysReallocMem(P:Pointer; Size:Integer):Pointer;
begin
{*
 00402678    push        ebp
 00402679    mov         ebp,esp
 0040267B    push        ecx
 0040267C    push        ebx
 0040267D    push        esi
 0040267E    push        edi
 0040267F    mov         esi,edx
 00402681    mov         ebx,eax
 00402683    cmp         byte ptr ds:[5AF5C0],0
>0040268A    jne         0040269F
 0040268C    call        InitAllocator
 00402691    test        al,al
>00402693    jne         0040269F
 00402695    xor         eax,eax
 00402697    mov         dword ptr [ebp-4],eax
>0040269A    jmp         00402730
 0040269F    xor         edx,edx
 004026A1    push        ebp
 004026A2    push        402729
 004026A7    push        dword ptr fs:[edx]
 004026AA    mov         dword ptr fs:[edx],esp
 004026AD    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>004026B4    je          004026C0
 004026B6    push        5AF5C8
 004026BB    call        KERNEL32.EnterCriticalSection
 004026C0    mov         edx,esi
 004026C2    mov         eax,ebx
 004026C4    call        ResizeInPlace
 004026C9    test        al,al
>004026CB    je          004026D2
 004026CD    mov         dword ptr [ebp-4],ebx
>004026D0    jmp         00402708
 004026D2    mov         eax,esi
 004026D4    call        SysGetMem
 004026D9    mov         edi,eax
 004026DB    mov         eax,ebx
 004026DD    sub         eax,4
 004026E0    mov         eax,dword ptr [eax]
 004026E2    and         eax,7FFFFFFC
 004026E7    sub         eax,4
 004026EA    cmp         esi,eax
>004026EC    jge         004026F0
 004026EE    mov         eax,esi
 004026F0    test        edi,edi
>004026F2    je          00402705
 004026F4    mov         edx,edi
 004026F6    mov         ecx,ebx
 004026F8    xchg        eax,ecx
 004026F9    call        Move
 004026FE    mov         eax,ebx
 00402700    call        SysFreeMem
 00402705    mov         dword ptr [ebp-4],edi
 00402708    xor         eax,eax
 0040270A    pop         edx
 0040270B    pop         ecx
 0040270C    pop         ecx
 0040270D    mov         dword ptr fs:[eax],edx
 00402710    push        402730
 00402715    cmp         byte ptr ds:[5AF049],0;gvar_005AF049
>0040271C    je          00402728
 0040271E    push        5AF5C8
 00402723    call        KERNEL32.LeaveCriticalSection
 00402728    ret
>00402729    jmp         @HandleFinally
>0040272E    jmp         00402715
 00402730    mov         eax,dword ptr [ebp-4]
 00402733    pop         edi
 00402734    pop         esi
 00402735    pop         ebx
 00402736    pop         ecx
 00402737    pop         ebp
 00402738    ret
*}
end;

//0040273C
function @GetMem(size:Integer):Pointer;
begin
{*
 0040273C    push        ebx
 0040273D    test        eax,eax
>0040273F    jle         00402756
 00402741    call        dword ptr ds:[5AC044]
 00402747    mov         ebx,eax
 00402749    test        ebx,ebx
>0040274B    jne         00402758
 0040274D    mov         al,1
 0040274F    call        Error
>00402754    jmp         00402758
 00402756    xor         ebx,ebx
 00402758    mov         eax,ebx
 0040275A    pop         ebx
 0040275B    ret
*}
end;

//0040275C
function @FreeMem(p:Pointer):Integer;
begin
{*
 0040275C    push        ebx
 0040275D    test        eax,eax
>0040275F    je          00402776
 00402761    call        dword ptr ds:[5AC048]
 00402767    mov         ebx,eax
 00402769    test        ebx,ebx
>0040276B    je          00402778
 0040276D    mov         al,2
 0040276F    call        Error
>00402774    jmp         00402778
 00402776    xor         ebx,ebx
 00402778    mov         eax,ebx
 0040277A    pop         ebx
 0040277B    ret
*}
end;

//0040277C
function @ReallocMem(var P:Pointer; NewSize:Integer):Pointer;
begin
{*
 0040277C    mov         ecx,dword ptr [eax]
 0040277E    test        ecx,ecx
>00402780    je          004027B4
 00402782    test        edx,edx
>00402784    je          0040279E
 00402786    push        eax
 00402787    mov         eax,ecx
 00402789    call        dword ptr ds:[5AC04C]
 0040278F    pop         ecx
 00402790    or          eax,eax
>00402792    je          004027AD
 00402794    mov         dword ptr [ecx],eax
 00402796    ret
 00402797    mov         al,2
>00402799    jmp         Error
 0040279E    mov         dword ptr [eax],edx
 004027A0    mov         eax,ecx
 004027A2    call        dword ptr ds:[5AC048]
 004027A8    or          eax,eax
>004027AA    jne         00402797
 004027AC    ret
 004027AD    mov         al,1
>004027AF    jmp         Error
 004027B4    test        edx,edx
>004027B6    je          004027C8
 004027B8    push        eax
 004027B9    mov         eax,edx
 004027BB    call        dword ptr ds:[5AC044]
 004027C1    pop         ecx
 004027C2    or          eax,eax
>004027C4    je          004027AD
 004027C6    mov         dword ptr [ecx],eax
 004027C8    ret
*}
end;

//004027CC
procedure GetMemoryManager(var MemMgr:TMemoryManager);
begin
{*
 004027CC    mov         edx,dword ptr ds:[5AC044];^SysGetMem:Pointer
 004027D2    mov         dword ptr [eax],edx
 004027D4    mov         edx,dword ptr ds:[5AC048];^SysFreeMem:Integer
 004027DA    mov         dword ptr [eax+4],edx
 004027DD    mov         edx,dword ptr ds:[5AC04C];^SysReallocMem:Pointer
 004027E3    mov         dword ptr [eax+8],edx
 004027E6    ret
*}
end;

//004027E8
procedure SetMemoryManager(const MemMgr:TMemoryManager);
begin
{*
 004027E8    mov         edx,dword ptr [eax]
 004027EA    mov         dword ptr ds:[5AC044],edx;^SysGetMem:Pointer
 004027F0    mov         edx,dword ptr [eax+4]
 004027F3    mov         dword ptr ds:[5AC048],edx;^SysFreeMem:Integer
 004027F9    mov         edx,dword ptr [eax+8]
 004027FC    mov         dword ptr ds:[5AC04C],edx;^SysReallocMem:Pointer
 00402802    ret
*}
end;

//00402804
function IsMemoryManagerSet:Boolean;
begin
{*
 00402804    mov         eax,402168;SysGetMem:Pointer
 00402809    cmp         eax,dword ptr ds:[5AC044];^SysGetMem:Pointer
>0040280F    jne         0040282E
 00402811    mov         eax,4022F8;SysFreeMem:Integer
 00402816    cmp         eax,dword ptr ds:[5AC048];^SysFreeMem:Integer
>0040281C    jne         0040282E
 0040281E    mov         eax,402678;SysReallocMem:Pointer
 00402823    cmp         eax,dword ptr ds:[5AC04C];^SysReallocMem:Pointer
>00402829    jne         0040282E
 0040282B    xor         eax,eax
 0040282D    ret
 0040282E    mov         al,1
 00402830    ret
*}
end;

//00402834
function ExceptObject:TObject;
begin
{*
 00402834    call        @GetTls
 00402839    cmp         dword ptr [eax+0],0;{RaiseListPtr:Pointer}
>00402840    je          00402851
 00402842    call        @GetTls
 00402847    mov         eax,dword ptr [eax+0];{RaiseListPtr:Pointer}
 0040284D    mov         eax,dword ptr [eax+8]
 00402850    ret
 00402851    xor         eax,eax
 00402853    ret
*}
end;

//00402854
function ExceptAddr:Pointer;
begin
{*
 00402854    call        @GetTls
 00402859    cmp         dword ptr [eax+0],0;{RaiseListPtr:Pointer}
>00402860    je          00402871
 00402862    call        @GetTls
 00402867    mov         eax,dword ptr [eax+0];{RaiseListPtr:Pointer}
 0040286D    mov         eax,dword ptr [eax+4]
 00402870    ret
 00402871    xor         eax,eax
 00402873    ret
*}
end;

//00402874
function AcquireExceptionObject:Pointer;
begin
{*
 00402874    push        ebx
 00402875    push        esi
 00402876    call        @GetTls
 0040287B    cmp         dword ptr [eax+0],0;{RaiseListPtr:Pointer}
>00402882    je          0040289E
 00402884    call        @GetTls
 00402889    mov         esi,dword ptr [eax+0];{RaiseListPtr:Pointer}
 0040288F    mov         ebx,dword ptr [esi+8]
 00402892    call        @GetTls
 00402897    xor         eax,eax
 00402899    mov         dword ptr [esi+8],eax
>0040289C    jmp         004028A0
 0040289E    xor         ebx,ebx
 004028A0    mov         eax,ebx
 004028A2    pop         esi
 004028A3    pop         ebx
 004028A4    ret
*}
end;

//004028A8
procedure RunErrorAt(ErrCode:Integer; ErrorAtAddr:Pointer);
begin
{*
 004028A8    mov         dword ptr ds:[5AC004],edx
 004028AE    call        @Halt
 004028B3    ret
*}
end;

//004028B4
procedure ErrorAt(ErrorCode:Byte; ErrorAddr:Pointer);
begin
{*
 004028B4    push        ebx
 004028B5    push        esi
 004028B6    mov         esi,edx
 004028B8    mov         ebx,eax
 004028BA    and         bl,7F
 004028BD    cmp         dword ptr ds:[5AF008],0
>004028C4    je          004028D0
 004028C6    mov         edx,esi
 004028C8    mov         eax,ebx
 004028CA    call        dword ptr ds:[5AF008]
 004028D0    test        bl,bl
>004028D2    jne         004028E1
 004028D4    call        @GetTls
 004028D9    mov         ebx,dword ptr [eax+4];{InOutRes:Integer}
>004028DF    jmp         004028F0
 004028E1    cmp         bl,18
>004028E4    ja          004028F0
 004028E6    xor         eax,eax
 004028E8    mov         al,bl
 004028EA    mov         bl,byte ptr [eax+5AC050]
 004028F0    xor         eax,eax
 004028F2    mov         al,bl
 004028F4    mov         edx,esi
 004028F6    call        RunErrorAt
 004028FB    pop         esi
 004028FC    pop         ebx
 004028FD    ret
*}
end;

//00402900
procedure Error(errorCode:TRuntimeError);
begin
{*
 00402900    and         eax,7F
 00402903    mov         edx,dword ptr [esp]
>00402906    jmp         ErrorAt
 0040290B    ret
*}
end;

//0040290C
procedure @_IOTest;
begin
{*
 0040290C    push        eax
 0040290D    push        edx
 0040290E    push        ecx
 0040290F    call        @GetTls
 00402914    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
 0040291B    pop         ecx
 0040291C    pop         edx
 0040291D    pop         eax
>0040291E    jne         00402921
 00402920    ret
 00402921    xor         eax,eax
>00402923    jmp         Error
 00402928    ret
*}
end;

//0040292C
procedure SetInOutRes(NewValue:Integer);
begin
{*
 0040292C    push        ebx
 0040292D    mov         ebx,eax
 0040292F    call        @GetTls
 00402934    mov         dword ptr [eax+4],ebx;{InOutRes:Integer}
 0040293A    pop         ebx
 0040293B    ret
*}
end;

//0040293C
procedure InOutError;
begin
{*
 0040293C    call        KERNEL32.GetLastError
 00402941    call        SetInOutRes
 00402946    ret
*}
end;

//00402948
procedure @Copy(S:ShortString; Index:Integer; Count:Integer; Result:ShortString);
begin
{*
 00402948    push        esi
 00402949    push        edi
 0040294A    mov         esi,eax
 0040294C    mov         edi,dword ptr [esp+0C]
 00402950    xor         eax,eax
 00402952    or          al,byte ptr [esi]
>00402954    je          00402981
 00402956    test        edx,edx
>00402958    jle         00402972
 0040295A    cmp         edx,eax
>0040295C    jg          00402979
 0040295E    sub         eax,edx
 00402960    inc         eax
 00402961    test        ecx,ecx
>00402963    jl          00402979
 00402965    cmp         ecx,eax
>00402967    jg          0040297D
 00402969    add         esi,edx
 0040296B    mov         byte ptr [edi],cl
 0040296D    inc         edi
 0040296E    rep movs    byte ptr [edi],byte ptr [esi]
>00402970    jmp         00402983
 00402972    mov         edx,1
>00402977    jmp         0040295E
 00402979    xor         ecx,ecx
>0040297B    jmp         00402969
 0040297D    mov         ecx,eax
>0040297F    jmp         00402969
 00402981    mov         byte ptr [edi],al
 00402983    pop         edi
 00402984    pop         esi
 00402985    ret         4
*}
end;

//0040298C
function IOResult:Integer;
begin
{*
 0040298C    push        ebx
 0040298D    call        @GetTls
 00402992    mov         ebx,dword ptr [eax+4];{InOutRes:Integer}
 00402998    call        @GetTls
 0040299D    xor         edx,edx
 0040299F    mov         dword ptr [eax+4],edx;{InOutRes:Integer}
 004029A5    mov         eax,ebx
 004029A7    pop         ebx
 004029A8    ret
*}
end;

//004029AC
procedure Move(const Source:void ; var Dest:void ; Count:Integer);
begin
{*
 004029AC    push        esi
 004029AD    push        edi
 004029AE    mov         esi,eax
 004029B0    mov         edi,edx
 004029B2    mov         eax,ecx
 004029B4    cmp         edi,esi
>004029B6    ja          004029CB
>004029B8    je          004029E9
 004029BA    sar         ecx,2
>004029BD    js          004029E9
 004029BF    rep movs    dword ptr [edi],dword ptr [esi]
 004029C1    mov         ecx,eax
 004029C3    and         ecx,3
 004029C6    rep movs    byte ptr [edi],byte ptr [esi]
 004029C8    pop         edi
 004029C9    pop         esi
 004029CA    ret
 004029CB    lea         esi,[ecx+esi-4]
 004029CF    lea         edi,[ecx+edi-4]
 004029D3    sar         ecx,2
>004029D6    js          004029E9
 004029D8    std
 004029D9    rep movs    dword ptr [edi],dword ptr [esi]
 004029DB    mov         ecx,eax
 004029DD    and         ecx,3
 004029E0    add         esi,3
 004029E3    add         edi,3
 004029E6    rep movs    byte ptr [edi],byte ptr [esi]
 004029E8    cld
 004029E9    pop         edi
 004029EA    pop         esi
 004029EB    ret
*}
end;

//004029EC
function GetParamStr(P:PAnsiChar; var Param:AnsiString):PAnsiChar;
begin
{*
 004029EC    push        ebx
 004029ED    push        esi
 004029EE    push        edi
 004029EF    push        ebp
 004029F0    mov         esi,edx
 004029F2    mov         ebx,eax
>004029F4    jmp         004029FE
 004029F6    push        ebx
 004029F7    call        user32.CharNextA
 004029FC    mov         ebx,eax
 004029FE    mov         al,byte ptr [ebx]
 00402A00    test        al,al
>00402A02    je          00402A08
 00402A04    cmp         al,20
>00402A06    jbe         004029F6
 00402A08    cmp         byte ptr [ebx],22
>00402A0B    jne         00402A18
 00402A0D    cmp         byte ptr [ebx+1],22
>00402A11    jne         00402A18
 00402A13    add         ebx,2
>00402A16    jmp         004029FE
 00402A18    xor         ebp,ebp
 00402A1A    mov         edi,ebx
>00402A1C    jmp         00402A61
 00402A1E    cmp         al,22
>00402A20    jne         00402A53
 00402A22    push        ebx
 00402A23    call        user32.CharNextA
 00402A28    mov         ebx,eax
>00402A2A    jmp         00402A3A
 00402A2C    push        ebx
 00402A2D    call        user32.CharNextA
 00402A32    mov         edx,eax
 00402A34    sub         edx,ebx
 00402A36    add         ebp,edx
 00402A38    mov         ebx,eax
 00402A3A    mov         al,byte ptr [ebx]
 00402A3C    test        al,al
>00402A3E    je          00402A44
 00402A40    cmp         al,22
>00402A42    jne         00402A2C
 00402A44    cmp         byte ptr [ebx],0
>00402A47    je          00402A61
 00402A49    push        ebx
 00402A4A    call        user32.CharNextA
 00402A4F    mov         ebx,eax
>00402A51    jmp         00402A61
 00402A53    push        ebx
 00402A54    call        user32.CharNextA
 00402A59    mov         edx,eax
 00402A5B    sub         edx,ebx
 00402A5D    add         ebp,edx
 00402A5F    mov         ebx,eax
 00402A61    mov         al,byte ptr [ebx]
 00402A63    cmp         al,20
>00402A65    ja          00402A1E
 00402A67    mov         eax,esi
 00402A69    mov         edx,ebp
 00402A6B    call        @LStrSetLength
 00402A70    mov         ebx,edi
 00402A72    mov         edi,dword ptr [esi]
 00402A74    xor         esi,esi
>00402A76    jmp         00402AC9
 00402A78    cmp         al,22
>00402A7A    jne         00402AB4
 00402A7C    push        ebx
 00402A7D    call        user32.CharNextA
 00402A82    mov         ebx,eax
>00402A84    jmp         00402A9B
 00402A86    push        ebx
 00402A87    call        user32.CharNextA
 00402A8C    cmp         eax,ebx
>00402A8E    jbe         00402A9B
 00402A90    mov         dl,byte ptr [ebx]
 00402A92    mov         byte ptr [edi+esi],dl
 00402A95    inc         ebx
 00402A96    inc         esi
 00402A97    cmp         eax,ebx
>00402A99    ja          00402A90
 00402A9B    mov         al,byte ptr [ebx]
 00402A9D    test        al,al
>00402A9F    je          00402AA5
 00402AA1    cmp         al,22
>00402AA3    jne         00402A86
 00402AA5    cmp         byte ptr [ebx],0
>00402AA8    je          00402AC9
 00402AAA    push        ebx
 00402AAB    call        user32.CharNextA
 00402AB0    mov         ebx,eax
>00402AB2    jmp         00402AC9
 00402AB4    push        ebx
 00402AB5    call        user32.CharNextA
 00402ABA    cmp         eax,ebx
>00402ABC    jbe         00402AC9
 00402ABE    mov         dl,byte ptr [ebx]
 00402AC0    mov         byte ptr [edi+esi],dl
 00402AC3    inc         ebx
 00402AC4    inc         esi
 00402AC5    cmp         eax,ebx
>00402AC7    ja          00402ABE
 00402AC9    mov         al,byte ptr [ebx]
 00402ACB    cmp         al,20
>00402ACD    ja          00402A78
 00402ACF    mov         eax,ebx
 00402AD1    pop         ebp
 00402AD2    pop         edi
 00402AD3    pop         esi
 00402AD4    pop         ebx
 00402AD5    ret
*}
end;

//00402AD8
function ParamStr(Index:Integer):String;
begin
{*
 00402AD8    push        ebx
 00402AD9    push        esi
 00402ADA    push        edi
 00402ADB    add         esp,0FFFFFEF8
 00402AE1    mov         ebx,edx
 00402AE3    mov         esi,eax
 00402AE5    mov         eax,ebx
 00402AE7    call        @LStrClr
 00402AEC    test        esi,esi
>00402AEE    jne         00402B0E
 00402AF0    push        105
 00402AF5    lea         eax,[esp+4]
 00402AF9    push        eax
 00402AFA    push        0
 00402AFC    call        KERNEL32.GetModuleFileNameA
 00402B01    mov         ecx,eax
 00402B03    mov         edx,esp
 00402B05    mov         eax,ebx
 00402B07    call        @LStrFromPCharLen
>00402B0C    jmp         00402B2C
 00402B0E    call        KERNEL32.GetCommandLineA
 00402B13    mov         edi,eax
 00402B15    mov         edx,ebx
 00402B17    mov         eax,edi
 00402B19    call        GetParamStr
 00402B1E    mov         edi,eax
 00402B20    test        esi,esi
>00402B22    je          00402B2C
 00402B24    cmp         dword ptr [ebx],0
>00402B27    je          00402B2C
 00402B29    dec         esi
>00402B2A    jmp         00402B15
 00402B2C    add         esp,108
 00402B32    pop         edi
 00402B33    pop         esi
 00402B34    pop         ebx
 00402B35    ret
*}
end;

//00402B38
procedure Randomize;
begin
{*
 00402B38    add         esp,0FFFFFFF8
 00402B3B    push        esp
 00402B3C    call        KERNEL32.QueryPerformanceCounter
 00402B41    test        eax,eax
>00402B43    je          00402B50
 00402B45    mov         eax,dword ptr [esp]
 00402B48    mov         [005AC008],eax
 00402B4D    pop         ecx
 00402B4E    pop         edx
 00402B4F    ret
 00402B50    call        KERNEL32.GetTickCount
 00402B55    mov         [005AC008],eax
 00402B5A    pop         ecx
 00402B5B    pop         edx
 00402B5C    ret
*}
end;

//00402B60
function UpCase(Ch:Char):Char;
begin
{*
 00402B60    cmp         al,61
>00402B62    jb          00402B6A
 00402B64    cmp         al,7A
>00402B66    ja          00402B6A
 00402B68    sub         al,20
 00402B6A    ret
*}
end;

//00402B6C
procedure Set8087CW(NewCW:Word);
begin
{*
 00402B6C    mov         [005AC024],ax;gvar_005AC024
 00402B72    fnclex
 00402B74    fldcw       word ptr ds:[5AC024];gvar_005AC024
 00402B7A    ret
*}
end;

//00402B7C
function Get8087CW:Word;
begin
{*
 00402B7C    push        0
 00402B7E    fnstcw      word ptr [esp]
 00402B81    pop         eax
 00402B82    ret
*}
end;

//00402B84
procedure @COS;
begin
{*
 00402B84    fcos
 00402B86    fnstsw      al
 00402B88    sahf
>00402B89    jp          00402B8C
 00402B8B    ret
 00402B8C    fstp        st(0)
 00402B8E    fldz
 00402B90    ret
*}
end;

//00402B94
procedure @EXP;
begin
{*
 00402B94    fldl2e
 00402B96    fmulp       st(1),st
 00402B98    fld         st(0)
 00402B9A    frndint
 00402B9C    fsub        st(1),st
 00402B9E    fxch        st(1)
 00402BA0    f2xm1
 00402BA2    fld1
 00402BA4    faddp       st(1),st
 00402BA6    fscale
 00402BA8    fstp        st(1)
 00402BAA    ret
*}
end;

//00402BAC
procedure @SIN;
begin
{*
 00402BAC    fsin
 00402BAE    fnstsw      al
 00402BB0    sahf
>00402BB1    jp          00402BB4
 00402BB3    ret
 00402BB4    fstp        st(0)
 00402BB6    fldz
 00402BB8    ret
*}
end;

//00402BBC
procedure @ROUND;
begin
{*
 00402BBC    sub         esp,8
 00402BBF    fistp       qword ptr [esp]
 00402BC2    wait
 00402BC3    pop         eax
 00402BC4    pop         edx
 00402BC5    ret
*}
end;

//00402BC8
function @TRUNC(X:Extended):Int64;
begin
{*
 00402BC8    sub         esp,0C
 00402BCB    fnstcw      word ptr [esp]
 00402BCE    fnstcw      word ptr [esp+2]
 00402BD2    wait
 00402BD3    or          word ptr [esp+2],0F00
 00402BDA    fldcw       word ptr [esp+2]
 00402BDE    fistp       qword ptr [esp+4]
 00402BE2    wait
 00402BE3    fldcw       word ptr [esp]
 00402BE6    pop         ecx
 00402BE7    pop         eax
 00402BE8    pop         edx
 00402BE9    ret
*}
end;

//00402BEC
procedure @AbstractError;
begin
{*
 00402BEC    cmp         dword ptr ds:[5AF028],0
>00402BF3    je          00402BFB
 00402BF5    call        dword ptr ds:[5AF028]
 00402BFB    mov         eax,0D2
>00402C00    jmp         @RunError
 00402C05    ret
*}
end;

//00402C08
function OpenText(var t:TTextRec; Mode:Word):Integer;
begin
{*
 00402C08    push        ebx
 00402C09    push        esi
 00402C0A    mov         esi,edx
 00402C0C    mov         ebx,eax
 00402C0E    mov         ax,word ptr [ebx+4]
 00402C12    cmp         ax,0D7B0
>00402C16    jb          00402C1E
 00402C18    cmp         ax,0D7B3
>00402C1C    jbe         00402C25
 00402C1E    mov         ebx,66
>00402C23    jmp         00402C50
 00402C25    cmp         ax,0D7B0
>00402C29    je          00402C32
 00402C2B    mov         eax,ebx
 00402C2D    call        @Close
 00402C32    mov         word ptr [ebx+4],si
 00402C36    cmp         byte ptr [ebx+48],0
>00402C3A    jne         00402C49
 00402C3C    cmp         dword ptr [ebx+18],0
>00402C40    jne         00402C49
 00402C42    mov         dword ptr [ebx+18],402D18;TextOpen:Integer
 00402C49    mov         eax,ebx
 00402C4B    call        dword ptr [ebx+18]
 00402C4E    mov         ebx,eax
 00402C50    test        ebx,ebx
>00402C52    je          00402C5B
 00402C54    mov         eax,ebx
 00402C56    call        SetInOutRes
 00402C5B    mov         eax,ebx
 00402C5D    pop         esi
 00402C5E    pop         ebx
 00402C5F    ret
*}
end;

//00402C60
function @RewritText(var T:TTextRec):Integer;
begin
{*
 00402C60    mov         dx,0D7B2
 00402C64    call        OpenText
 00402C69    ret
*}
end;

//00402C6C
function TextIn(var t:TTextRec):Integer;
begin
{*
 00402C6C    push        ebx
 00402C6D    mov         ebx,eax
 00402C6F    xor         eax,eax
 00402C71    mov         dword ptr [ebx+10],eax
 00402C74    xor         eax,eax
 00402C76    mov         dword ptr [ebx+0C],eax
 00402C79    push        0
 00402C7B    lea         eax,[ebx+10]
 00402C7E    push        eax
 00402C7F    mov         eax,dword ptr [ebx+8]
 00402C82    push        eax
 00402C83    mov         eax,dword ptr [ebx+14]
 00402C86    push        eax
 00402C87    mov         eax,dword ptr [ebx]
 00402C89    push        eax
 00402C8A    call        KERNEL32.ReadFile
 00402C8F    test        eax,eax
>00402C91    jne         00402CA1
 00402C93    call        KERNEL32.GetLastError
 00402C98    cmp         eax,6D
>00402C9B    jne         00402CA3
 00402C9D    xor         eax,eax
 00402C9F    pop         ebx
 00402CA0    ret
 00402CA1    xor         eax,eax
 00402CA3    pop         ebx
 00402CA4    ret
*}
end;

//00402CA8
function FileNOPProc(var t:void ):Integer;
begin
{*
 00402CA8    xor         eax,eax
 00402CAA    ret
*}
end;

//00402CAC
function TextOut(var t:TTextRec):Integer;
begin
{*
 00402CAC    push        ebx
 00402CAD    push        esi
 00402CAE    push        ecx
 00402CAF    mov         ebx,eax
 00402CB1    mov         esi,dword ptr [ebx+0C]
 00402CB4    test        esi,esi
>00402CB6    jne         00402CBC
 00402CB8    xor         eax,eax
>00402CBA    jmp         00402CE2
 00402CBC    push        0
 00402CBE    lea         eax,[esp+4]
 00402CC2    push        eax
 00402CC3    push        esi
 00402CC4    mov         eax,dword ptr [ebx+14]
 00402CC7    push        eax
 00402CC8    mov         eax,dword ptr [ebx]
 00402CCA    push        eax
 00402CCB    call        KERNEL32.WriteFile
 00402CD0    test        eax,eax
>00402CD2    jne         00402CDB
 00402CD4    call        KERNEL32.GetLastError
>00402CD9    jmp         00402CDD
 00402CDB    xor         eax,eax
 00402CDD    xor         edx,edx
 00402CDF    mov         dword ptr [ebx+0C],edx
 00402CE2    pop         edx
 00402CE3    pop         esi
 00402CE4    pop         ebx
 00402CE5    ret
*}
end;

//00402CE8
function InternalClose(Handle:Integer):Boolean;
begin
{*
 00402CE8    push        ebx
 00402CE9    mov         ebx,eax
 00402CEB    push        ebx
 00402CEC    call        KERNEL32.CloseHandle
 00402CF1    dec         eax
 00402CF2    sete        al
 00402CF5    pop         ebx
 00402CF6    ret
*}
end;

//00402CF8
function TextClose(var t:TTextRec):Integer;
begin
{*
 00402CF8    push        ebx
 00402CF9    mov         ebx,eax
 00402CFB    mov         word ptr [ebx+4],0D7B0
 00402D01    mov         eax,dword ptr [ebx]
 00402D03    call        InternalClose
 00402D08    test        al,al
>00402D0A    jne         00402D13
 00402D0C    call        KERNEL32.GetLastError
 00402D11    pop         ebx
 00402D12    ret
 00402D13    xor         eax,eax
 00402D15    pop         ebx
 00402D16    ret
*}
end;

//00402D18
function TextOpen(var t:TTextRec):Integer;
begin
{*
 00402D18    push        esi
 00402D19    mov         esi,eax
 00402D1B    xor         eax,eax
 00402D1D    mov         dword ptr [esi+0C],eax
 00402D20    mov         dword ptr [esi+10],eax
 00402D23    mov         ax,word ptr [esi+4]
 00402D27    sub         eax,0D7B1
>00402D2C    je          00402D39
 00402D2E    dec         eax
>00402D2F    je          00402D51
 00402D31    dec         eax
>00402D32    je          00402D62
>00402D34    jmp         00402EA0
 00402D39    mov         eax,80000000
 00402D3E    mov         edx,1
 00402D43    mov         ecx,3
 00402D48    mov         dword ptr [esi+1C],402C6C;TextIn:Integer
>00402D4F    jmp         00402D78
 00402D51    mov         eax,40000000
 00402D56    mov         edx,1
 00402D5B    mov         ecx,2
>00402D60    jmp         00402D71
 00402D62    mov         eax,0C0000000
 00402D67    mov         edx,1
 00402D6C    mov         ecx,3
 00402D71    mov         dword ptr [esi+1C],402CAC;TextOut:Integer
 00402D78    mov         dword ptr [esi+24],402CF8;TextClose:Integer
 00402D7F    mov         dword ptr [esi+20],402CA8;FileNOPProc:Integer
 00402D86    cmp         byte ptr [esi+48],0
>00402D8A    je          00402E42
 00402D90    push        0
 00402D92    push        80
 00402D97    push        ecx
 00402D98    push        0
 00402D9A    push        edx
 00402D9B    push        eax
 00402D9C    lea         eax,[esi+48]
 00402D9F    push        eax
 00402DA0    call        KERNEL32.CreateFileA
 00402DA5    cmp         eax,0FFFFFFFF
>00402DA8    je          00402EB6
 00402DAE    mov         dword ptr [esi],eax
 00402DB0    cmp         word ptr [esi+4],0D7B3
>00402DB6    jne         00402E7F
 00402DBC    dec         word ptr [esi+4]
 00402DC0    push        0
 00402DC2    push        dword ptr [esi]
 00402DC4    call        KERNEL32.GetFileSize
 00402DC9    inc         eax
>00402DCA    je          00402EB6
 00402DD0    sub         eax,81
>00402DD5    jae         00402DD9
 00402DD7    xor         eax,eax
 00402DD9    push        0
 00402DDB    push        0
 00402DDD    push        eax
 00402DDE    push        dword ptr [esi]
 00402DE0    call        KERNEL32.SetFilePointer
 00402DE5    inc         eax
>00402DE6    je          00402EB6
 00402DEC    push        0
 00402DEE    mov         edx,esp
 00402DF0    push        0
 00402DF2    push        edx
 00402DF3    push        80
 00402DF8    lea         edx,[esi+14C]
 00402DFE    push        edx
 00402DFF    push        dword ptr [esi]
 00402E01    call        KERNEL32.ReadFile
 00402E06    pop         edx
 00402E07    dec         eax
>00402E08    jne         00402EB6
 00402E0E    xor         eax,eax
 00402E10    cmp         eax,edx
>00402E12    jae         00402E7F
 00402E14    cmp         byte ptr [esi+eax+14C],0E
>00402E1C    je          00402E21
 00402E1E    inc         eax
>00402E1F    jmp         00402E10
 00402E21    push        2
 00402E23    push        0
 00402E25    sub         eax,edx
 00402E27    push        eax
 00402E28    push        dword ptr [esi]
 00402E2A    call        KERNEL32.SetFilePointer
 00402E2F    inc         eax
>00402E30    je          00402EB6
 00402E36    push        dword ptr [esi]
 00402E38    call        KERNEL32.SetEndOfFile
 00402E3D    dec         eax
>00402E3E    jne         00402EB6
>00402E40    jmp         00402E7F
 00402E42    lea         eax,[esi+14C]
 00402E48    mov         dword ptr [esi+8],80
 00402E4F    mov         dword ptr [esi+24],402CA8;FileNOPProc:Integer
 00402E56    mov         dword ptr [esi+14],eax
 00402E59    cmp         word ptr [esi+4],0D7B2
>00402E5F    je          00402E65
 00402E61    push        0F6
>00402E63    jmp         00402E73
 00402E65    cmp         esi,5AF3E4
>00402E6B    jne         00402E71
 00402E6D    push        0F4
>00402E6F    jmp         00402E73
 00402E71    push        0F5
 00402E73    call        KERNEL32.GetStdHandle
 00402E78    cmp         eax,0FFFFFFFF
>00402E7B    je          00402EB6
 00402E7D    mov         dword ptr [esi],eax
 00402E7F    cmp         word ptr [esi+4],0D7B1
>00402E85    je          00402E9E
 00402E87    push        dword ptr [esi]
 00402E89    call        KERNEL32.GetFileType
 00402E8E    test        eax,eax
>00402E90    je          00402EA2
 00402E92    cmp         eax,2
>00402E95    jne         00402E9E
 00402E97    mov         dword ptr [esi+20],402CAC;TextOut:Integer
 00402E9E    xor         eax,eax
 00402EA0    pop         esi
 00402EA1    ret
 00402EA2    push        dword ptr [esi]
 00402EA4    call        KERNEL32.CloseHandle
 00402EA9    mov         word ptr [esi+4],0D7B0
 00402EAF    mov         eax,69
>00402EB4    jmp         00402EA0
 00402EB6    mov         word ptr [esi+4],0D7B0
 00402EBC    call        KERNEL32.GetLastError
>00402EC1    jmp         00402EA0
 00402EC3    ret
*}
end;

//00402EC4
function @Assign(var F:TFileRec; S:AnsiString):Integer;
begin
{*
 00402EC4    push        ebx
 00402EC5    push        esi
 00402EC6    mov         esi,edx
 00402EC8    mov         ebx,eax
 00402ECA    mov         eax,ebx
 00402ECC    xor         ecx,ecx
 00402ECE    mov         edx,14C
 00402ED3    call        @FillChar
 00402ED8    lea         eax,[ebx+14C]
 00402EDE    mov         dword ptr [ebx+14],eax
 00402EE1    mov         word ptr [ebx+4],0D7B0
 00402EE7    xor         eax,eax
 00402EE9    mov         al,[005AC038]
 00402EEE    mov         word ptr [ebx+6],ax
 00402EF2    mov         dword ptr [ebx+8],80
 00402EF9    mov         dword ptr [ebx+18],402D18;TextOpen:Integer
 00402F00    mov         eax,esi
 00402F02    call        @LStrLen
 00402F07    push        eax
 00402F08    mov         eax,esi
 00402F0A    call        @LStrToPChar
 00402F0F    lea         edx,[ebx+48]
 00402F12    pop         ecx
 00402F13    call        Move
 00402F18    mov         eax,esi
 00402F1A    call        @LStrLen
 00402F1F    mov         byte ptr [ebx+eax+48],0
 00402F24    xor         eax,eax
 00402F26    pop         esi
 00402F27    pop         ebx
 00402F28    ret
*}
end;

//00402F2C
function InternalFlush(var t:TTextRec; Func:TTextIOFunc):Integer;
begin
{*
 00402F2C    push        ebx
 00402F2D    mov         cx,word ptr [eax+4]
 00402F31    sub         cx,0D7B1
>00402F36    je          00402F47
 00402F38    dec         ecx
 00402F39    sub         cx,2
>00402F3D    jae         00402F4B
 00402F3F    mov         ebx,edx
 00402F41    call        ebx
 00402F43    mov         ebx,eax
>00402F45    jmp         00402F62
 00402F47    xor         ebx,ebx
>00402F49    jmp         00402F62
 00402F4B    cmp         eax,5AF218
>00402F50    je          00402F59
 00402F52    cmp         eax,5AF3E4
>00402F57    jne         00402F5D
 00402F59    xor         ebx,ebx
>00402F5B    jmp         00402F62
 00402F5D    mov         ebx,67
 00402F62    test        ebx,ebx
>00402F64    je          00402F6D
 00402F66    mov         eax,ebx
 00402F68    call        SetInOutRes
 00402F6D    mov         eax,ebx
 00402F6F    pop         ebx
 00402F70    ret
*}
end;

//00402F74
function Flush(var t:Text):Integer;
begin
{*
 00402F74    mov         edx,dword ptr [eax+1C]
 00402F77    call        InternalFlush
 00402F7C    ret
*}
end;

//00402F80
procedure @Flush(var F:TFileRec);
begin
{*
 00402F80    mov         edx,dword ptr [eax+20]
 00402F83    call        InternalFlush
 00402F88    ret
*}
end;

//00402F8C
procedure @Close(var F:TFileRec);
begin
{*
 00402F8C    push        ebx
 00402F8D    push        esi
 00402F8E    mov         ebx,eax
 00402F90    xor         esi,esi
 00402F92    mov         ax,word ptr [ebx+4]
 00402F96    cmp         ax,0D7B1
>00402F9A    jb          00402FCB
 00402F9C    cmp         ax,0D7B3
>00402FA0    ja          00402FCB
 00402FA2    and         ax,0D7B2
 00402FA6    cmp         ax,0D7B2
>00402FAA    jne         00402FB3
 00402FAC    mov         eax,ebx
 00402FAE    call        dword ptr [ebx+1C]
 00402FB1    mov         esi,eax
 00402FB3    test        esi,esi
>00402FB5    jne         00402FBE
 00402FB7    mov         eax,ebx
 00402FB9    call        dword ptr [ebx+24]
 00402FBC    mov         esi,eax
 00402FBE    test        esi,esi
>00402FC0    je          00402FDD
 00402FC2    mov         eax,esi
 00402FC4    call        SetInOutRes
>00402FC9    jmp         00402FDD
 00402FCB    cmp         ebx,5AF04C
>00402FD1    je          00402FDD
 00402FD3    mov         eax,67
 00402FD8    call        SetInOutRes
 00402FDD    mov         eax,esi
 00402FDF    pop         esi
 00402FE0    pop         ebx
 00402FE1    ret
*}
end;

//00402FE4
procedure @PStrNCpy(Dest:PShortString; Source:PShortString; MaxLen:Byte);
begin
{*
 00402FE4    push        ebx
 00402FE5    mov         bl,byte ptr [edx]
 00402FE7    cmp         cl,bl
>00402FE9    jbe         00402FED
 00402FEB    mov         ecx,ebx
 00402FED    mov         byte ptr [eax],cl
 00402FEF    inc         edx
 00402FF0    inc         eax
 00402FF1    and         ecx,0FF
 00402FF7    xchg        eax,edx
 00402FF8    call        Move
 00402FFD    pop         ebx
 00402FFE    ret
*}
end;

//00403000
procedure @PStrCmp(S1:PShortString; S2:PShortString);
begin
{*
 00403000    push        ebx
 00403001    push        esi
 00403002    push        edi
 00403003    mov         esi,eax
 00403005    mov         edi,edx
 00403007    xor         eax,eax
 00403009    xor         edx,edx
 0040300B    mov         al,byte ptr [esi]
 0040300D    mov         dl,byte ptr [edi]
 0040300F    inc         esi
 00403010    inc         edi
 00403011    sub         eax,edx
>00403013    ja          00403017
 00403015    add         edx,eax
 00403017    push        edx
 00403018    shr         edx,2
>0040301B    je          00403043
 0040301D    mov         ecx,dword ptr [esi]
 0040301F    mov         ebx,dword ptr [edi]
 00403021    cmp         ecx,ebx
>00403023    jne         00403069
 00403025    dec         edx
>00403026    je          0040303D
 00403028    mov         ecx,dword ptr [esi+4]
 0040302B    mov         ebx,dword ptr [edi+4]
 0040302E    cmp         ecx,ebx
>00403030    jne         00403069
 00403032    add         esi,8
 00403035    add         edi,8
 00403038    dec         edx
>00403039    jne         0040301D
>0040303B    jmp         00403043
 0040303D    add         esi,4
 00403040    add         edi,4
 00403043    pop         edx
 00403044    and         edx,3
>00403047    je          00403065
 00403049    mov         cl,byte ptr [esi]
 0040304B    cmp         cl,byte ptr [edi]
>0040304D    jne         0040307E
 0040304F    dec         edx
>00403050    je          00403065
 00403052    mov         cl,byte ptr [esi+1]
 00403055    cmp         cl,byte ptr [edi+1]
>00403058    jne         0040307E
 0040305A    dec         edx
>0040305B    je          00403065
 0040305D    mov         cl,byte ptr [esi+2]
 00403060    cmp         cl,byte ptr [edi+2]
>00403063    jne         0040307E
 00403065    add         eax,eax
>00403067    jmp         0040307E
 00403069    pop         edx
 0040306A    cmp         cl,bl
>0040306C    jne         0040307E
 0040306E    cmp         ch,bh
>00403070    jne         0040307E
 00403072    shr         ecx,10
 00403075    shr         ebx,10
 00403078    cmp         cl,bl
>0040307A    jne         0040307E
 0040307C    cmp         ch,bh
 0040307E    pop         edi
 0040307F    pop         esi
 00403080    pop         ebx
 00403081    ret
*}
end;

//00403084
procedure @AStrCmp(S1:PShortString; S2:PShortString; Bytes:Integer);
begin
{*
 00403084    push        ebx
 00403085    push        esi
 00403086    push        ecx
 00403087    mov         esi,ecx
 00403089    shr         esi,2
>0040308C    je          004030B4
 0040308E    mov         ecx,dword ptr [eax]
 00403090    mov         ebx,dword ptr [edx]
 00403092    cmp         ecx,ebx
>00403094    jne         004030DB
 00403096    dec         esi
>00403097    je          004030AE
 00403099    mov         ecx,dword ptr [eax+4]
 0040309C    mov         ebx,dword ptr [edx+4]
 0040309F    cmp         ecx,ebx
>004030A1    jne         004030DB
 004030A3    add         eax,8
 004030A6    add         edx,8
 004030A9    dec         esi
>004030AA    jne         0040308E
>004030AC    jmp         004030B4
 004030AE    add         eax,4
 004030B1    add         edx,4
 004030B4    pop         esi
 004030B5    and         esi,3
>004030B8    je          004030F0
 004030BA    mov         cl,byte ptr [eax]
 004030BC    cmp         cl,byte ptr [edx]
>004030BE    jne         004030F0
 004030C0    dec         esi
>004030C1    je          004030D6
 004030C3    mov         cl,byte ptr [eax+1]
 004030C6    cmp         cl,byte ptr [edx+1]
>004030C9    jne         004030F0
 004030CB    dec         esi
>004030CC    je          004030D6
 004030CE    mov         cl,byte ptr [eax+2]
 004030D1    cmp         cl,byte ptr [edx+2]
>004030D4    jne         004030F0
 004030D6    xor         eax,eax
 004030D8    pop         esi
 004030D9    pop         ebx
 004030DA    ret
 004030DB    pop         esi
 004030DC    cmp         cl,bl
>004030DE    jne         004030F0
 004030E0    cmp         ch,bh
>004030E2    jne         004030F0
 004030E4    shr         ecx,10
 004030E7    shr         ebx,10
 004030EA    cmp         cl,bl
>004030EC    jne         004030F0
 004030EE    cmp         ch,bh
 004030F0    pop         esi
 004030F1    pop         ebx
 004030F2    ret
*}
end;

//004030F4
procedure @FillChar(var dst:Pointer; cnt:Integer; val:Char);
begin
{*
 004030F4    push        edi
 004030F5    mov         edi,eax
 004030F7    mov         ch,cl
 004030F9    mov         eax,ecx
 004030FB    shl         eax,10
 004030FE    mov         ax,cx
 00403101    mov         ecx,edx
 00403103    sar         ecx,2
>00403106    js          00403111
 00403108    rep stos    dword ptr [edi]
 0040310A    mov         ecx,edx
 0040310C    and         ecx,3
 0040310F    rep stos    byte ptr [edi]
 00403111    pop         edi
 00403112    ret
*}
end;

//00403114
function @RandInt(Range:Integer):Integer;
begin
{*
 00403114    push        ebx
 00403115    xor         ebx,ebx
 00403117    imul        edx,dword ptr [ebx+5AC008],8088405
 00403121    inc         edx
 00403122    mov         dword ptr [ebx+5AC008],edx
 00403128    mul         eax,edx
 0040312A    mov         eax,edx
 0040312C    pop         ebx
 0040312D    ret
*}
end;

//00403130
function @ReadRec(var F:TFileRec; Buffer:Pointer):Integer;
begin
{*
 00403130    push        ebx
 00403131    xor         ecx,ecx
 00403133    mov         ebx,eax
 00403135    mov         cx,word ptr [eax+4]
 00403139    sub         ecx,0D7B1
>0040313F    je          00403146
 00403141    sub         ecx,2
>00403144    jne         00403168
 00403146    push        0
 00403148    mov         eax,esp
 0040314A    push        0
 0040314C    push        eax
 0040314D    push        dword ptr [ebx+8]
 00403150    push        edx
 00403151    push        dword ptr [ebx]
 00403153    call        KERNEL32.ReadFile
 00403158    pop         edx
 00403159    dec         eax
>0040315A    jne         0040316F
 0040315C    cmp         edx,dword ptr [ebx+8]
>0040315F    je          00403179
 00403161    mov         eax,64
>00403166    jmp         00403174
 00403168    mov         eax,67
>0040316D    jmp         00403174
 0040316F    call        KERNEL32.GetLastError
 00403174    call        SetInOutRes
 00403179    pop         ebx
 0040317A    ret
*}
end;

//0040317C
function @CloseFile(var f:TFileRec):Integer;
begin
{*
 0040317C    push        ebx
 0040317D    push        esi
 0040317E    mov         ebx,eax
 00403180    mov         word ptr [ebx+4],0D7B0
 00403186    xor         esi,esi
 00403188    mov         eax,dword ptr [ebx]
 0040318A    call        InternalClose
 0040318F    test        al,al
>00403191    jne         0040319D
 00403193    call        InOutError
 00403198    mov         esi,1
 0040319D    mov         eax,esi
 0040319F    pop         esi
 004031A0    pop         ebx
 004031A1    ret
*}
end;

//004031A4
function OpenFile(var f:TFileRec; recSiz:Integer; mode:Integer):Integer;
begin
{*
 004031A4    push        ebx
 004031A5    push        esi
 004031A6    push        edi
 004031A7    mov         esi,edx
 004031A9    mov         edi,ecx
 004031AB    xor         edx,edx
 004031AD    mov         ebx,eax
 004031AF    mov         dx,word ptr [eax+4]
 004031B3    sub         edx,0D7B0
>004031B9    je          004031D0
 004031BB    cmp         edx,3
>004031BE    ja          00403266
 004031C4    call        dword ptr [ebx+24]
 004031C7    test        eax,eax
>004031C9    je          004031D0
 004031CB    call        SetInOutRes
 004031D0    mov         word ptr [ebx+4],0D7B3
 004031D6    mov         dword ptr [ebx+8],esi
 004031D9    mov         dword ptr [ebx+24],40317C;@CloseFile:Integer
 004031E0    mov         dword ptr [ebx+1C],402CA8;FileNOPProc:Integer
 004031E7    cmp         byte ptr [ebx+48],0
>004031EB    je          0040324D
 004031ED    mov         eax,0C0000000
 004031F2    mov         dl,byte ptr ds:[5AC00C]
 004031F8    and         edx,70
 004031FB    shr         edx,2
 004031FE    mov         edx,dword ptr [edx+5AC06C]
 00403204    mov         ecx,2
 00403209    sub         edi,3
>0040320C    je          0040322F
 0040320E    mov         ecx,3
 00403213    inc         edi
>00403214    je          0040322F
 00403216    mov         eax,40000000
 0040321B    inc         edi
 0040321C    mov         word ptr [ebx+4],0D7B2
>00403222    je          0040322F
 00403224    mov         eax,80000000
 00403229    mov         word ptr [ebx+4],0D7B1
 0040322F    push        0
 00403231    push        80
 00403236    push        ecx
 00403237    push        0
 00403239    push        edx
 0040323A    push        eax
 0040323B    lea         eax,[ebx+48]
 0040323E    push        eax
 0040323F    call        KERNEL32.CreateFileA
 00403244    cmp         eax,0FFFFFFFF
>00403247    je          0040326D
 00403249    mov         dword ptr [ebx],eax
>0040324B    jmp         0040327D
 0040324D    mov         dword ptr [ebx+24],402CA8;FileNOPProc:Integer
 00403254    cmp         edi,3
>00403257    je          0040325D
 00403259    push        0F6
>0040325B    jmp         0040325F
 0040325D    push        0F5
 0040325F    call        KERNEL32.GetStdHandle
>00403264    jmp         00403244
 00403266    mov         eax,66
>0040326B    jmp         00403278
 0040326D    mov         word ptr [ebx+4],0D7B0
 00403273    call        KERNEL32.GetLastError
 00403278    call        SetInOutRes
 0040327D    pop         edi
 0040327E    pop         esi
 0040327F    pop         ebx
 00403280    ret
*}
end;

//00403284
function @ResetFile(var F:TFileRec; RecSize:Longint):Integer;
begin
{*
 00403284    mov         cl,byte ptr ds:[5AC00C]
 0040328A    and         cl,3
 0040328D    cmp         cl,2
>00403290    jbe         00403294
 00403292    mov         cl,2
 00403294    and         ecx,0FF
 0040329A    call        OpenFile
 0040329F    ret
*}
end;

//004032A0
function @RewritFile(var F:TFileRec; RecSize:Longint):Integer;
begin
{*
 004032A0    mov         ecx,3
 004032A5    call        OpenFile
 004032AA    ret
*}
end;

//004032AC
function @ValLong(s:AnsiString; var code:Integer):Longint;
begin
{*
 004032AC    push        ebx
 004032AD    push        esi
 004032AE    push        edi
 004032AF    mov         esi,eax
 004032B1    push        eax
 004032B2    test        eax,eax
>004032B4    je          00403322
 004032B6    xor         eax,eax
 004032B8    xor         ebx,ebx
 004032BA    mov         edi,0CCCCCCC
 004032BF    mov         bl,byte ptr [esi]
 004032C1    inc         esi
 004032C2    cmp         bl,20
>004032C5    je          004032BF
 004032C7    mov         ch,0
 004032C9    cmp         bl,2D
>004032CC    je          00403330
 004032CE    cmp         bl,2B
>004032D1    je          00403332
 004032D3    cmp         bl,24
>004032D6    je          00403337
 004032D8    cmp         bl,78
>004032DB    je          00403337
 004032DD    cmp         bl,58
>004032E0    je          00403337
 004032E2    cmp         bl,30
>004032E5    jne         004032FA
 004032E7    mov         bl,byte ptr [esi]
 004032E9    inc         esi
 004032EA    cmp         bl,78
>004032ED    je          00403337
 004032EF    cmp         bl,58
>004032F2    je          00403337
 004032F4    test        bl,bl
>004032F6    je          00403318
>004032F8    jmp         004032FE
 004032FA    test        bl,bl
>004032FC    je          0040332B
 004032FE    sub         bl,30
 00403301    cmp         bl,9
>00403304    ja          0040332B
 00403306    cmp         eax,edi
>00403308    ja          0040332B
 0040330A    lea         eax,[eax+eax*4]
 0040330D    add         eax,eax
 0040330F    add         eax,ebx
 00403311    mov         bl,byte ptr [esi]
 00403313    inc         esi
 00403314    test        bl,bl
>00403316    jne         004032FE
 00403318    dec         ch
>0040331A    je          00403325
 0040331C    test        eax,eax
>0040331E    jge         00403374
>00403320    jmp         0040332B
 00403322    inc         esi
>00403323    jmp         0040332B
 00403325    neg         eax
>00403327    jle         00403374
>00403329    js          00403374
 0040332B    pop         ebx
 0040332C    sub         esi,ebx
>0040332E    jmp         00403377
 00403330    inc         ch
 00403332    mov         bl,byte ptr [esi]
 00403334    inc         esi
>00403335    jmp         004032D3
 00403337    mov         edi,0FFFFFFF
 0040333C    mov         bl,byte ptr [esi]
 0040333E    inc         esi
 0040333F    test        bl,bl
>00403341    je          00403322
 00403343    cmp         bl,61
>00403346    jb          0040334B
 00403348    sub         bl,20
 0040334B    sub         bl,30
 0040334E    cmp         bl,9
>00403351    jbe         0040335E
 00403353    sub         bl,11
 00403356    cmp         bl,5
>00403359    ja          0040332B
 0040335B    add         bl,0A
 0040335E    cmp         eax,edi
>00403360    ja          0040332B
 00403362    shl         eax,4
 00403365    add         eax,ebx
 00403367    mov         bl,byte ptr [esi]
 00403369    inc         esi
 0040336A    test        bl,bl
>0040336C    jne         00403343
 0040336E    dec         ch
>00403370    jne         00403374
 00403372    neg         eax
 00403374    pop         ecx
 00403375    xor         esi,esi
 00403377    mov         dword ptr [edx],esi
 00403379    pop         edi
 0040337A    pop         esi
 0040337B    pop         ebx
 0040337C    ret
*}
end;

//00403380
procedure @WriteRec(var F:TFileRec; Buffer:Pointer);
begin
{*
 00403380    push        ebx
 00403381    mov         ebx,eax
 00403383    movzx       eax,word ptr [eax+4]
 00403387    sub         eax,0D7B2
 0040338C    cmp         eax,1
>0040338F    ja          004033B3
 00403391    push        0
 00403393    mov         eax,esp
 00403395    push        0
 00403397    push        eax
 00403398    push        dword ptr [ebx+8]
 0040339B    push        edx
 0040339C    push        dword ptr [ebx]
 0040339E    call        KERNEL32.WriteFile
 004033A3    pop         edx
 004033A4    dec         eax
>004033A5    jne         004033BA
 004033A7    cmp         edx,dword ptr [ebx+8]
>004033AA    je          004033C4
 004033AC    mov         eax,65
>004033B1    jmp         004033BF
 004033B3    mov         eax,5
>004033B8    jmp         004033BF
 004033BA    call        KERNEL32.GetLastError
 004033BF    call        SetInOutRes
 004033C4    mov         eax,ebx
 004033C6    pop         ebx
 004033C7    ret
*}
end;

//004033C8
function TryOpenForOutput(var t:TTextRec):Boolean;
begin
{*
 004033C8    push        ebx
 004033C9    mov         ebx,eax
 004033CB    cmp         ebx,5AF218
>004033D1    je          004033DB
 004033D3    cmp         ebx,5AF3E4
>004033D9    jne         004033ED
 004033DB    xor         eax,eax
 004033DD    mov         al,[005AC038]
 004033E2    mov         word ptr [ebx+6],ax
 004033E6    mov         eax,ebx
 004033E8    call        @RewritText
 004033ED    cmp         word ptr [ebx+4],0D7B2
 004033F3    sete        al
 004033F6    mov         ebx,eax
 004033F8    test        bl,bl
>004033FA    jne         00403406
 004033FC    mov         eax,69
 00403401    call        SetInOutRes
 00403406    mov         eax,ebx
 00403408    pop         ebx
 00403409    ret
*}
end;

//0040340C
function @WriteBytes(var t:TTextRec; const b:void ; cnt:Integer):Pointer;
begin
{*
 0040340C    push        esi
 0040340D    push        edi
 0040340E    mov         esi,edx
 00403410    cmp         word ptr [eax+4],0D7B2
>00403416    je          00403427
 00403418    push        eax
 00403419    push        edx
 0040341A    push        ecx
 0040341B    call        TryOpenForOutput
 00403420    test        al,al
 00403422    pop         ecx
 00403423    pop         edx
 00403424    pop         eax
>00403425    je          0040345C
 00403427    mov         edi,dword ptr [eax+14]
 0040342A    add         edi,dword ptr [eax+0C]
 0040342D    mov         edx,dword ptr [eax+8]
 00403430    sub         edx,dword ptr [eax+0C]
 00403433    cmp         edx,ecx
>00403435    jg          00403457
 00403437    add         dword ptr [eax+0C],edx
 0040343A    sub         ecx,edx
 0040343C    push        eax
 0040343D    push        ecx
 0040343E    mov         ecx,edx
 00403440    rep movs    byte ptr [edi],byte ptr [esi]
 00403442    call        dword ptr [eax+1C]
 00403445    test        eax,eax
>00403447    jne         0040344D
 00403449    pop         ecx
 0040344A    pop         eax
>0040344B    jmp         00403427
 0040344D    call        SetInOutRes
 00403452    pop         ecx
 00403453    pop         eax
 00403454    pop         edi
 00403455    pop         esi
 00403456    ret
 00403457    add         dword ptr [eax+0C],ecx
 0040345A    rep movs    byte ptr [edi],byte ptr [esi]
 0040345C    pop         edi
 0040345D    pop         esi
 0040345E    ret
*}
end;

//00403460
function @WriteSpaces(var t:TTextRec; cnt:Integer):Pointer;
begin
{*
 00403460    mov         ecx,edx
 00403462    mov         edx,403490
 00403467    cmp         ecx,40
>0040346A    jle         004034D0
 0040346C    sub         ecx,40
 0040346F    push        eax
 00403470    push        ecx
 00403471    mov         ecx,40
 00403476    call        @WriteBytes
 0040347B    call        @GetTls
 00403480    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
>00403487    jne         0040348D
 00403489    pop         ecx
 0040348A    pop         eax
>0040348B    jmp         00403462
 0040348D    pop         ecx
 0040348E    pop         eax
 0040348F    ret
 00403490    and         byte ptr [eax],ah
 00403492    and         byte ptr [eax],ah
 00403494    and         byte ptr [eax],ah
 00403496    and         byte ptr [eax],ah
 00403498    and         byte ptr [eax],ah
 0040349A    and         byte ptr [eax],ah
 0040349C    and         byte ptr [eax],ah
 0040349E    and         byte ptr [eax],ah
 004034A0    and         byte ptr [eax],ah
 004034A2    and         byte ptr [eax],ah
 004034A4    and         byte ptr [eax],ah
 004034A6    and         byte ptr [eax],ah
 004034A8    and         byte ptr [eax],ah
 004034AA    and         byte ptr [eax],ah
 004034AC    and         byte ptr [eax],ah
 004034AE    and         byte ptr [eax],ah
 004034B0    and         byte ptr [eax],ah
 004034B2    and         byte ptr [eax],ah
 004034B4    and         byte ptr [eax],ah
 004034B6    and         byte ptr [eax],ah
 004034B8    and         byte ptr [eax],ah
 004034BA    and         byte ptr [eax],ah
 004034BC    and         byte ptr [eax],ah
 004034BE    and         byte ptr [eax],ah
 004034C0    and         byte ptr [eax],ah
 004034C2    and         byte ptr [eax],ah
 004034C4    and         byte ptr [eax],ah
 004034C6    and         byte ptr [eax],ah
 004034C8    and         byte ptr [eax],ah
 004034CA    and         byte ptr [eax],ah
 004034CC    and         byte ptr [eax],ah
 004034CE    and         byte ptr [eax],ah
 004034D0    test        ecx,ecx
>004034D2    jg          0040340C
 004034D8    ret
*}
end;

//004034DC
procedure @WriteLn(var T:TTextRec);
begin
{*
 004034DC    push        ebx
 004034DD    push        esi
 004034DE    push        ecx
 004034DF    mov         ebx,eax
 004034E1    test        byte ptr [ebx+6],1
>004034E5    je          00403502
 004034E7    mov         byte ptr [esp],0D
 004034EB    mov         byte ptr [esp+1],0A
 004034F0    mov         edx,esp
 004034F2    mov         eax,ebx
 004034F4    mov         ecx,2
 004034F9    call        @WriteBytes
 004034FE    mov         esi,eax
>00403500    jmp         00403516
 00403502    mov         byte ptr [esp],0A
 00403506    mov         edx,esp
 00403508    mov         eax,ebx
 0040350A    mov         ecx,1
 0040350F    call        @WriteBytes
 00403514    mov         esi,eax
 00403516    mov         eax,ebx
 00403518    call        @Flush
 0040351D    mov         eax,esi
 0040351F    pop         edx
 00403520    pop         esi
 00403521    pop         ebx
 00403522    ret
*}
end;

//00403524
procedure @_CToPasStr(Dest:PShortString; const Source:PAnsiChar);
begin
{*
 00403524    mov         ecx,0FF
 00403529    call        @_CLenToPasStr
 0040352E    ret
*}
end;

//00403530
procedure @_CLenToPasStr(Dest:PShortString; const Source:PAnsiChar; MaxLen:Integer);
begin
{*
 00403530    push        ebx
 00403531    push        eax
 00403532    cmp         ecx,0FF
>00403538    jbe         0040353F
 0040353A    mov         ecx,0FF
 0040353F    mov         bl,byte ptr [edx]
 00403541    inc         edx
 00403542    test        bl,bl
>00403544    je          0040354C
 00403546    inc         eax
 00403547    mov         byte ptr [eax],bl
 00403549    dec         ecx
>0040354A    jne         0040353F
 0040354C    pop         edx
 0040354D    sub         eax,edx
 0040354F    mov         byte ptr [edx],al
 00403551    pop         ebx
 00403552    ret
*}
end;

//00403554
procedure @SetEq;
begin
{*
 00403554    push        esi
 00403555    push        edi
 00403556    mov         esi,eax
 00403558    mov         edi,edx
 0040355A    and         ecx,0FF
 00403560    repe cmps   byte ptr [esi],byte ptr [edi]
 00403562    pop         edi
 00403563    pop         esi
 00403564    ret
*}
end;

//00403568
procedure FPower10;
begin
{*
>00403568    jmp         @Pow10
 0040356D    ret
*}
end;

//00403570
procedure @Pow10;
begin
{*
 00403570    push        ebx
 00403571    xor         ebx,ebx
 00403573    test        eax,eax
>00403575    jl          004035C4
>00403577    je          00403617
 0040357D    cmp         eax,1400
>00403582    jge         00403609
 00403588    mov         edx,eax
 0040358A    and         edx,1F
 0040358D    lea         edx,[edx+edx*4]
 00403590    fld         tbyte ptr [ebx+edx*2+403623]
 00403597    fmulp       st(1),st
 00403599    shr         eax,5
>0040359C    je          00403617
 0040359E    mov         edx,eax
 004035A0    and         edx,0F
>004035A3    je          004035B1
 004035A5    lea         edx,[edx+edx*4]
 004035A8    fld         tbyte ptr [ebx+edx*2+403759]
 004035AF    fmulp       st(1),st
 004035B1    shr         eax,4
>004035B4    je          00403617
 004035B6    lea         eax,[eax+eax*4]
 004035B9    fld         tbyte ptr [ebx+eax*2+4037EF]
 004035C0    fmulp       st(1),st
>004035C2    jmp         00403617
 004035C4    neg         eax
 004035C6    cmp         eax,1400
>004035CB    jge         00403613
 004035CD    mov         edx,eax
 004035CF    and         edx,1F
 004035D2    lea         edx,[edx+edx*4]
 004035D5    fld         tbyte ptr [ebx+edx*2+403623]
 004035DC    fdivp       st(1),st
 004035DE    shr         eax,5
>004035E1    je          00403617
 004035E3    mov         edx,eax
 004035E5    and         edx,0F
>004035E8    je          004035F6
 004035EA    lea         edx,[edx+edx*4]
 004035ED    fld         tbyte ptr [ebx+edx*2+403759]
 004035F4    fdivp       st(1),st
 004035F6    shr         eax,4
>004035F9    je          00403617
 004035FB    lea         eax,[eax+eax*4]
 004035FE    fld         tbyte ptr [ebx+eax*2+4037EF]
 00403605    fdivp       st(1),st
>00403607    jmp         00403617
 00403609    fstp        st(0)
 0040360B    fld         tbyte ptr [ebx+403619]
>00403611    jmp         00403617
 00403613    fstp        st(0)
 00403615    fldz
 00403617    pop         ebx
 00403618    ret
*}
end;

//00403854
function user32.GetKeyboardType:Integer; stdcall;
begin
{*
 00403854    jmp         dword ptr ds:[60821C]
*}
end;

//0040385C
function @isNECWindows:Boolean;
begin
{*
 0040385C    push        ebx
 0040385D    xor         ebx,ebx
 0040385F    push        0
 00403861    call        user32.GetKeyboardType
 00403866    cmp         eax,7
>00403869    jne         00403887
 0040386B    push        1
 0040386D    call        user32.GetKeyboardType
 00403872    and         eax,0FF00
 00403877    cmp         eax,0D00
>0040387C    je          00403885
 0040387E    cmp         eax,400
>00403883    jne         00403887
 00403885    mov         bl,1
 00403887    mov         eax,ebx
 00403889    pop         ebx
 0040388A    ret
*}
end;

//0040388C
procedure @FpuMaskInit;
begin
{*
 0040388C    push        ebp
 0040388D    mov         ebp,esp
 0040388F    add         esp,0FFFFFFF4
 00403892    movzx       eax,word ptr ds:[5AC024];gvar_005AC024
 00403899    mov         dword ptr [ebp-8],eax
 0040389C    lea         eax,[ebp-4]
 0040389F    push        eax
 004038A0    push        1
 004038A2    push        0
 004038A4    push        403924
 004038A9    push        80000002
 004038AE    call        advapi32.RegOpenKeyExA
 004038B3    test        eax,eax
>004038B5    jne         00403904
 004038B7    xor         eax,eax
 004038B9    push        ebp
 004038BA    push        4038FD
 004038BF    push        dword ptr fs:[eax]
 004038C2    mov         dword ptr fs:[eax],esp
 004038C5    mov         dword ptr [ebp-0C],4
 004038CC    lea         eax,[ebp-0C]
 004038CF    push        eax
 004038D0    lea         eax,[ebp-8]
 004038D3    push        eax
 004038D4    push        0
 004038D6    push        0
 004038D8    push        403940
 004038DD    mov         eax,dword ptr [ebp-4]
 004038E0    push        eax
 004038E1    call        advapi32.RegQueryValueExA
 004038E6    xor         eax,eax
 004038E8    pop         edx
 004038E9    pop         ecx
 004038EA    pop         ecx
 004038EB    mov         dword ptr fs:[eax],edx
 004038EE    push        403904
 004038F3    mov         eax,dword ptr [ebp-4]
 004038F6    push        eax
 004038F7    call        advapi32.RegCloseKey
 004038FC    ret
>004038FD    jmp         @HandleFinally
>00403902    jmp         004038F3
 00403904    mov         ax,[005AC024];gvar_005AC024
 0040390A    and         ax,0FFC0
 0040390E    mov         dx,word ptr [ebp-8]
 00403912    and         dx,3F
 00403916    or          ax,dx
 00403919    mov         [005AC024],ax;gvar_005AC024
 0040391F    mov         esp,ebp
 00403921    pop         ebp
 00403922    ret
*}
end;

//00403950
procedure @FpuInit;
begin
{*
 00403950    fninit
 00403952    wait
 00403953    fldcw       word ptr ds:[5AC024];gvar_005AC024
 00403959    ret
*}
end;

//0040395C
procedure @BoundErr;
begin
{*
 0040395C    mov         al,4
>0040395E    jmp         Error
 00403963    ret
*}
end;

//00403964
function TObject.ClassType:TClass;
begin
{*
 00403964    mov         eax,dword ptr [eax]
 00403966    mov         edx,eax
 00403968    mov         eax,edx
 0040396A    ret
*}
end;

//0040396C
function TObject.ClassName:ShortString;
begin
{*
 0040396C    push        esi
 0040396D    push        edi
 0040396E    mov         edi,edx
 00403970    mov         esi,dword ptr [eax-2C]
 00403973    xor         ecx,ecx
 00403975    mov         cl,byte ptr [esi]
 00403977    inc         ecx
 00403978    rep movs    byte ptr [edi],byte ptr [esi]
 0040397A    pop         edi
 0040397B    pop         esi
 0040397C    ret
*}
end;

//00403980
function TObject.ClassNameIs(const Name:AnsiString):Boolean;
begin
{*
 00403980    push        ebx
 00403981    xor         ebx,ebx
 00403983    or          edx,edx
>00403985    je          004039A3
 00403987    mov         eax,dword ptr [eax-2C]
 0040398A    xor         ecx,ecx
 0040398C    mov         cl,byte ptr [eax]
 0040398E    cmp         ecx,dword ptr [edx-4]
>00403991    jne         004039A3
 00403993    dec         edx
 00403994    mov         bh,byte ptr [ecx+eax]
 00403997    xor         bh,byte ptr [ecx+edx]
 0040399A    and         bh,0DF
>0040399D    jne         004039A3
 0040399F    dec         ecx
>004039A0    jne         00403994
 004039A2    inc         ebx
 004039A3    mov         al,bl
 004039A5    pop         ebx
 004039A6    ret
*}
end;

//004039A8
function TObject.ClassParent:TClass;
begin
{*
 004039A8    mov         eax,dword ptr [eax-24]
 004039AB    test        eax,eax
>004039AD    je          004039B1
 004039AF    mov         eax,dword ptr [eax]
 004039B1    ret
*}
end;

//004039B4
function TObject.NewInstance:TObject;
begin
{*
 004039B4    push        ebx
 004039B5    mov         ebx,eax
 004039B7    mov         eax,ebx
 004039B9    call        TObject.InstanceSize
 004039BE    call        @GetMem
 004039C3    mov         edx,eax
 004039C5    mov         eax,ebx
 004039C7    call        TObject.InitInstance
 004039CC    pop         ebx
 004039CD    ret
*}
end;

//004039D0
procedure TObject.FreeInstance;
begin
{*
 004039D0    push        ebx
 004039D1    mov         ebx,eax
 004039D3    mov         eax,ebx
 004039D5    call        TObject.CleanupInstance
 004039DA    mov         eax,ebx
 004039DC    call        @FreeMem
 004039E1    pop         ebx
 004039E2    ret
*}
end;

//004039E4
function TObject.InstanceSize:Integer;
begin
{*
 004039E4    add         eax,0FFFFFFD8
 004039E7    mov         eax,dword ptr [eax]
 004039E9    ret
*}
end;

//004039EC
constructor TObject.Create;
begin
{*
 004039EC    test        dl,dl
>004039EE    je          004039F8
 004039F0    add         esp,0FFFFFFF0
 004039F3    call        @ClassCreate
 004039F8    test        dl,dl
>004039FA    je          00403A0B
 004039FC    call        @AfterConstruction
 00403A01    pop         dword ptr fs:[0]
 00403A08    add         esp,0C
 00403A0B    ret
*}
end;

//00403A0C
destructor TObject.Destroy;
begin
{*
 00403A0C    call        @BeforeDestruction
 00403A11    test        dl,dl
>00403A13    jle         00403A1A
 00403A15    call        @ClassDestroy
 00403A1A    ret
*}
end;

//00403A1C
procedure TObject.Free;
begin
{*
 00403A1C    test        eax,eax
>00403A1E    je          00403A27
 00403A20    mov         dl,1
 00403A22    mov         ecx,dword ptr [eax]
 00403A24    call        dword ptr [ecx-4]
 00403A27    ret
*}
end;

//00403A28
function TObject.InitInstance(Instance:Pointer):TObject;
begin
{*
 00403A28    push        ebx
 00403A29    push        esi
 00403A2A    push        edi
 00403A2B    mov         ebx,eax
 00403A2D    mov         edi,edx
 00403A2F    stos        dword ptr [edi]
 00403A30    mov         ecx,dword ptr [ebx-28]
 00403A33    xor         eax,eax
 00403A35    push        ecx
 00403A36    shr         ecx,2
 00403A39    dec         ecx
 00403A3A    rep stos    dword ptr [edi]
 00403A3C    pop         ecx
 00403A3D    and         ecx,3
 00403A40    rep stos    byte ptr [edi]
 00403A42    mov         eax,edx
 00403A44    mov         edx,esp
 00403A46    mov         ecx,dword ptr [ebx-48]
 00403A49    test        ecx,ecx
>00403A4B    je          00403A4E
 00403A4D    push        ecx
 00403A4E    mov         ebx,dword ptr [ebx-24]
 00403A51    test        ebx,ebx
>00403A53    je          00403A59
 00403A55    mov         ebx,dword ptr [ebx]
>00403A57    jmp         00403A46
 00403A59    cmp         esp,edx
>00403A5B    je          00403A7A
 00403A5D    pop         ebx
 00403A5E    mov         ecx,dword ptr [ebx]
 00403A60    add         ebx,4
 00403A63    mov         esi,dword ptr [ebx+10]
 00403A66    test        esi,esi
>00403A68    je          00403A70
 00403A6A    mov         edi,dword ptr [ebx+14]
 00403A6D    mov         dword ptr [edi+eax],esi
 00403A70    add         ebx,1C
 00403A73    dec         ecx
>00403A74    jne         00403A63
 00403A76    cmp         esp,edx
>00403A78    jne         00403A5D
 00403A7A    pop         edi
 00403A7B    pop         esi
 00403A7C    pop         ebx
 00403A7D    ret
*}
end;

//00403A80
procedure TObject.CleanupInstance;
begin
{*
 00403A80    push        ebx
 00403A81    push        esi
 00403A82    mov         ebx,eax
 00403A84    mov         esi,eax
 00403A86    mov         esi,dword ptr [esi]
 00403A88    mov         edx,dword ptr [esi-40]
 00403A8B    mov         esi,dword ptr [esi-24]
 00403A8E    test        edx,edx
>00403A90    je          00403A99
 00403A92    call        @FinalizeRecord
 00403A97    mov         eax,ebx
 00403A99    test        esi,esi
>00403A9B    jne         00403A86
 00403A9D    pop         esi
 00403A9E    pop         ebx
 00403A9F    ret
*}
end;

//00403AA0
function InvokeImplGetter(Self:TObject; ImplGetter:Cardinal):IInterface;
begin
{*
 00403AA0    xchg        edx,ecx
 00403AA2    cmp         ecx,0FF000000
>00403AA8    jae         00403ABB
 00403AAA    cmp         ecx,0FE000000
>00403AB0    jb          00403AB9
 00403AB2    movsx       ecx,cx
 00403AB5    add         ecx,dword ptr [eax]
 00403AB7    jmp         dword ptr [ecx]
 00403AB9    jmp         ecx
 00403ABB    and         ecx,0FFFFFF
 00403AC1    add         ecx,eax
 00403AC3    mov         eax,edx
 00403AC5    mov         edx,dword ptr [ecx]
>00403AC7    jmp         @IntfCopy
 00403ACC    ret
*}
end;

//00403AD0
function TObject.GetInterface(const IID:TGUID; var Obj:void ):Boolean;
begin
{*
 00403AD0    push        ebp
 00403AD1    mov         ebp,esp
 00403AD3    add         esp,0FFFFFFF8
 00403AD6    push        ebx
 00403AD7    push        esi
 00403AD8    push        edi
 00403AD9    xor         ebx,ebx
 00403ADB    mov         dword ptr [ebp-8],ebx
 00403ADE    mov         esi,ecx
 00403AE0    mov         dword ptr [ebp-4],edx
 00403AE3    mov         edi,eax
 00403AE5    xor         eax,eax
 00403AE7    push        ebp
 00403AE8    push        403B54
 00403AED    push        dword ptr fs:[eax]
 00403AF0    mov         dword ptr fs:[eax],esp
 00403AF3    xor         eax,eax
 00403AF5    mov         dword ptr [esi],eax
 00403AF7    mov         edx,dword ptr [ebp-4]
 00403AFA    mov         eax,dword ptr [edi]
 00403AFC    call        TObject.GetInterfaceEntry
 00403B01    mov         ebx,eax
 00403B03    test        ebx,ebx
>00403B05    je          00403B38
 00403B07    mov         eax,dword ptr [ebx+14]
 00403B0A    test        eax,eax
>00403B0C    je          00403B21
 00403B0E    add         edi,eax
 00403B10    mov         dword ptr [esi],edi
 00403B12    cmp         dword ptr [esi],0
>00403B15    je          00403B38
 00403B17    mov         eax,dword ptr [esi]
 00403B19    push        eax
 00403B1A    mov         eax,dword ptr [eax]
 00403B1C    call        dword ptr [eax+4]
>00403B1F    jmp         00403B38
 00403B21    lea         ecx,[ebp-8]
 00403B24    mov         edx,dword ptr [ebx+18]
 00403B27    mov         eax,edi
 00403B29    call        InvokeImplGetter
 00403B2E    mov         edx,dword ptr [ebp-8]
 00403B31    mov         eax,esi
 00403B33    call        @IntfCopy
 00403B38    cmp         dword ptr [esi],0
 00403B3B    setne       bl
 00403B3E    xor         eax,eax
 00403B40    pop         edx
 00403B41    pop         ecx
 00403B42    pop         ecx
 00403B43    mov         dword ptr fs:[eax],edx
 00403B46    push        403B5B
 00403B4B    lea         eax,[ebp-8]
 00403B4E    call        @IntfClear
 00403B53    ret
>00403B54    jmp         @HandleFinally
>00403B59    jmp         00403B4B
 00403B5B    mov         eax,ebx
 00403B5D    pop         edi
 00403B5E    pop         esi
 00403B5F    pop         ebx
 00403B60    pop         ecx
 00403B61    pop         ecx
 00403B62    pop         ebp
 00403B63    ret
*}
end;

//00403B64
function TObject.GetInterfaceEntry(const IID:TGUID):PInterfaceEntry;
begin
{*
 00403B64    push        ebx
 00403B65    push        esi
 00403B66    mov         ebx,eax
 00403B68    mov         eax,dword ptr [ebx-48]
 00403B6B    test        eax,eax
>00403B6D    je          00403B98
 00403B6F    mov         ecx,dword ptr [eax]
 00403B71    add         eax,4
 00403B74    mov         esi,dword ptr [edx]
 00403B76    cmp         esi,dword ptr [eax]
>00403B78    jne         00403B92
 00403B7A    mov         esi,dword ptr [edx+4]
 00403B7D    cmp         esi,dword ptr [eax+4]
>00403B80    jne         00403B92
 00403B82    mov         esi,dword ptr [edx+8]
 00403B85    cmp         esi,dword ptr [eax+8]
>00403B88    jne         00403B92
 00403B8A    mov         esi,dword ptr [edx+0C]
 00403B8D    cmp         esi,dword ptr [eax+0C]
>00403B90    je          00403BA5
 00403B92    add         eax,1C
 00403B95    dec         ecx
>00403B96    jne         00403B74
 00403B98    mov         ebx,dword ptr [ebx-24]
 00403B9B    test        ebx,ebx
>00403B9D    je          00403BA3
 00403B9F    mov         ebx,dword ptr [ebx]
>00403BA1    jmp         00403B68
 00403BA3    xor         eax,eax
 00403BA5    pop         esi
 00403BA6    pop         ebx
 00403BA7    ret
*}
end;

//00403BA8
function @IsClass(Child:TObject; Parent:TClass):Boolean;
begin
{*
 00403BA8    push        ebx
 00403BA9    push        esi
 00403BAA    mov         esi,edx
 00403BAC    mov         ebx,eax
 00403BAE    test        ebx,ebx
>00403BB0    je          00403BBF
 00403BB2    mov         edx,esi
 00403BB4    mov         eax,dword ptr [ebx]
 00403BB6    call        TObject.InheritsFrom
 00403BBB    test        al,al
>00403BBD    jne         00403BC4
 00403BBF    xor         eax,eax
 00403BC1    pop         esi
 00403BC2    pop         ebx
 00403BC3    ret
 00403BC4    mov         al,1
 00403BC6    pop         esi
 00403BC7    pop         ebx
 00403BC8    ret
*}
end;

//00403BCC
function @AsClass(child:TObject; parent:TClass):TObject;
begin
{*
 00403BCC    test        eax,eax
>00403BCE    je          00403BE6
 00403BD0    mov         ecx,eax
 00403BD2    mov         ecx,dword ptr [ecx]
 00403BD4    cmp         ecx,edx
>00403BD6    je          00403BE6
 00403BD8    mov         ecx,dword ptr [ecx-24]
 00403BDB    test        ecx,ecx
>00403BDD    jne         00403BD2
 00403BDF    mov         al,0A
>00403BE1    jmp         Error
 00403BE6    ret
*}
end;

//00403BE8
procedure GetDynaMethod;
begin
{*
 00403BE8    push        edi
 00403BE9    xchg        eax,esi
>00403BEA    jmp         00403BEE
 00403BEC    mov         esi,dword ptr [esi]
 00403BEE    mov         edi,dword ptr [esi-30]
 00403BF1    test        edi,edi
>00403BF3    je          00403C02
 00403BF5    movzx       ecx,word ptr [edi]
 00403BF8    push        ecx
 00403BF9    add         edi,2
 00403BFC    repne scas  word ptr [edi]
>00403BFF    je          00403C0B
 00403C01    pop         ecx
 00403C02    mov         esi,dword ptr [esi-24]
 00403C05    test        esi,esi
>00403C07    jne         00403BEC
 00403C09    pop         edi
 00403C0A    ret
 00403C0B    pop         eax
 00403C0C    add         eax,eax
 00403C0E    sub         eax,ecx
 00403C10    mov         esi,dword ptr [edi+eax*2-4]
 00403C14    pop         edi
 00403C15    ret
*}
end;

//00403C18
procedure @CallDynaInst;
begin
{*
 00403C18    push        eax
 00403C19    push        ecx
 00403C1A    mov         eax,dword ptr [eax]
 00403C1C    call        GetDynaMethod
 00403C21    pop         ecx
 00403C22    pop         eax
>00403C23    je          00403C27
 00403C25    jmp         esi
 00403C27    pop         ecx
>00403C28    jmp         @AbstractError
 00403C2D    ret
*}
end;

//00403C30
procedure @FindDynaInst;
begin
{*
 00403C30    push        esi
 00403C31    mov         esi,edx
 00403C33    mov         eax,dword ptr [eax]
 00403C35    call        GetDynaMethod
 00403C3A    mov         eax,esi
 00403C3C    pop         esi
>00403C3D    jne         00403C45
 00403C3F    pop         ecx
>00403C40    jmp         @AbstractError
 00403C45    ret
*}
end;

//00403C48
function TObject.InheritsFrom(AClass:TClass):Boolean;
begin
{*
>00403C48    jmp         00403C4C
 00403C4A    mov         eax,dword ptr [eax]
 00403C4C    cmp         eax,edx
>00403C4E    je          00403C58
 00403C50    mov         eax,dword ptr [eax-24]
 00403C53    test        eax,eax
>00403C55    jne         00403C4A
 00403C57    ret
 00403C58    mov         al,1
 00403C5A    ret
*}
end;

//00403C5C
function TObject.ClassInfo:Pointer;
begin
{*
 00403C5C    add         eax,0FFFFFFC4
 00403C5F    mov         eax,dword ptr [eax]
 00403C61    ret
*}
end;

//00403C64
function TObject.SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;
begin
{*
 00403C64    mov         eax,8000FFFF
 00403C69    ret
*}
end;

//00403C6C
procedure TObject.DefaultHandler(var Message:void );
begin
{*
 00403C6C    ret
*}
end;

//00403C70
procedure TObject.AfterConstruction;
begin
{*
 00403C70    ret
*}
end;

//00403C74
procedure TCustomVariantType.BeforeDestruction;
begin
{*
 00403C74    ret
*}
end;

//00403C78
procedure TObject.Dispatch(var Message:void );
begin
{*
 00403C78    push        esi
 00403C79    mov         si,word ptr [edx]
 00403C7C    or          si,si
>00403C7F    je          00403C98
 00403C81    cmp         si,0C000
>00403C86    jae         00403C98
 00403C88    push        eax
 00403C89    mov         eax,dword ptr [eax]
 00403C8B    call        GetDynaMethod
 00403C90    pop         eax
>00403C91    je          00403C98
 00403C93    mov         ecx,esi
 00403C95    pop         esi
 00403C96    jmp         ecx
 00403C98    pop         esi
 00403C99    mov         ecx,dword ptr [eax]
 00403C9B    jmp         dword ptr [ecx-10]
 00403C9E    ret
*}
end;

//00403CA0
function TObject.MethodAddress(const Name:ShortString):Pointer;
begin
{*
 00403CA0    push        ebx
 00403CA1    push        esi
 00403CA2    push        edi
 00403CA3    xor         ecx,ecx
 00403CA5    xor         edi,edi
 00403CA7    mov         bl,byte ptr [edx]
>00403CA9    jmp         00403CAD
 00403CAB    mov         eax,dword ptr [eax]
 00403CAD    mov         esi,dword ptr [eax-34]
 00403CB0    test        esi,esi
>00403CB2    je          00403CC9
 00403CB4    mov         di,word ptr [esi]
 00403CB7    add         esi,2
 00403CBA    mov         cl,byte ptr [esi+6]
 00403CBD    cmp         cl,bl
>00403CBF    je          00403CD6
 00403CC1    mov         cx,word ptr [esi]
 00403CC4    add         esi,ecx
 00403CC6    dec         edi
>00403CC7    jne         00403CBA
 00403CC9    mov         eax,dword ptr [eax-24]
 00403CCC    test        eax,eax
>00403CCE    jne         00403CAB
>00403CD0    jmp         00403CEA
 00403CD2    mov         bl,byte ptr [edx]
>00403CD4    jmp         00403CC1
 00403CD6    mov         ch,0
 00403CD8    mov         bl,byte ptr [ecx+esi+6]
 00403CDC    xor         bl,byte ptr [ecx+edx]
 00403CDF    and         bl,0DF
>00403CE2    jne         00403CD2
 00403CE4    dec         ecx
>00403CE5    jne         00403CD8
 00403CE7    mov         eax,dword ptr [esi+2]
 00403CEA    pop         edi
 00403CEB    pop         esi
 00403CEC    pop         ebx
 00403CED    ret
*}
end;

//00403CF0
function TObject.MethodName(Address:Pointer):ShortString;
begin
{*
 00403CF0    push        ebx
 00403CF1    push        esi
 00403CF2    push        edi
 00403CF3    mov         edi,ecx
 00403CF5    xor         ebx,ebx
 00403CF7    xor         ecx,ecx
>00403CF9    jmp         00403CFD
 00403CFB    mov         eax,dword ptr [eax]
 00403CFD    mov         esi,dword ptr [eax-34]
 00403D00    test        esi,esi
>00403D02    je          00403D17
 00403D04    mov         cx,word ptr [esi]
 00403D07    add         esi,2
 00403D0A    cmp         edx,dword ptr [esi+2]
>00403D0D    je          00403D22
 00403D0F    mov         bx,word ptr [esi]
 00403D12    add         esi,ebx
 00403D14    dec         ecx
>00403D15    jne         00403D0A
 00403D17    mov         eax,dword ptr [eax-24]
 00403D1A    test        eax,eax
>00403D1C    jne         00403CFB
 00403D1E    mov         byte ptr [edi],al
>00403D20    jmp         00403D2C
 00403D22    add         esi,6
 00403D25    xor         ecx,ecx
 00403D27    mov         cl,byte ptr [esi]
 00403D29    inc         ecx
 00403D2A    rep movs    byte ptr [edi],byte ptr [esi]
 00403D2C    pop         edi
 00403D2D    pop         esi
 00403D2E    pop         ebx
 00403D2F    ret
*}
end;

//00403D30
function TObject.FieldAddress(const Name:ShortString):Pointer;
begin
{*
 00403D30    push        ebx
 00403D31    push        esi
 00403D32    push        edi
 00403D33    xor         ecx,ecx
 00403D35    xor         edi,edi
 00403D37    mov         bl,byte ptr [edx]
 00403D39    push        eax
 00403D3A    mov         eax,dword ptr [eax]
 00403D3C    mov         esi,dword ptr [eax-38]
 00403D3F    test        esi,esi
>00403D41    je          00403D57
 00403D43    mov         di,word ptr [esi]
 00403D46    add         esi,6
 00403D49    mov         cl,byte ptr [esi+6]
 00403D4C    cmp         cl,bl
>00403D4E    je          00403D68
 00403D50    lea         esi,[ecx+esi+7]
 00403D54    dec         edi
>00403D55    jne         00403D49
 00403D57    mov         eax,dword ptr [eax-24]
 00403D5A    test        eax,eax
>00403D5C    jne         00403D3A
 00403D5E    pop         edx
>00403D5F    jmp         00403D7C
 00403D61    mov         bl,byte ptr [edx]
 00403D63    mov         cl,byte ptr [esi+6]
>00403D66    jmp         00403D50
 00403D68    mov         bl,byte ptr [ecx+esi+6]
 00403D6C    xor         bl,byte ptr [ecx+edx]
 00403D6F    and         bl,0DF
>00403D72    jne         00403D61
 00403D74    dec         ecx
>00403D75    jne         00403D68
 00403D77    mov         eax,dword ptr [esi]
 00403D79    pop         edx
 00403D7A    add         eax,edx
 00403D7C    pop         edi
 00403D7D    pop         esi
 00403D7E    pop         ebx
 00403D7F    ret
*}
end;

//00403D80
function @ClassCreate(AClass:TClass; Alloc:Boolean):TObject;
begin
{*
 00403D80    push        edx
 00403D81    push        ecx
 00403D82    push        ebx
 00403D83    test        dl,dl
>00403D85    jl          00403D8A
 00403D87    call        dword ptr [eax-0C]
 00403D8A    xor         edx,edx
 00403D8C    lea         ecx,[esp+10]
 00403D90    mov         ebx,dword ptr fs:[edx]
 00403D93    mov         dword ptr [ecx],ebx
 00403D95    mov         dword ptr [ecx+8],ebp
 00403D98    mov         dword ptr [ecx+4],403DA9
 00403D9F    mov         dword ptr [ecx+0C],eax
 00403DA2    mov         dword ptr fs:[edx],ecx
 00403DA5    pop         ebx
 00403DA6    pop         ecx
 00403DA7    pop         edx
 00403DA8    ret
*}
end;

//00403DD0
procedure @ClassDestroy(Instance:TObject);
begin
{*
 00403DD0    mov         edx,dword ptr [eax]
 00403DD2    call        dword ptr [edx-8]
 00403DD5    ret
*}
end;

//00403DD8
function @AfterConstruction(Instance:TObject):TObject;
begin
{*
 00403DD8    push        ebx
 00403DD9    mov         ebx,eax
 00403DDB    mov         eax,ebx
 00403DDD    mov         edx,dword ptr [eax]
 00403DDF    call        dword ptr [edx-1C]
 00403DE2    mov         eax,ebx
 00403DE4    pop         ebx
 00403DE5    ret
*}
end;

//00403DE8
function @BeforeDestruction(Instance:TObject; OuterMost:Shortint):TObject;
begin
{*
 00403DE8    test        dl,dl
>00403DEA    jg          00403DED
 00403DEC    ret
 00403DED    push        eax
 00403DEE    push        edx
 00403DEF    mov         edx,dword ptr [eax]
 00403DF1    call        dword ptr [edx-18]
 00403DF4    pop         edx
 00403DF5    pop         eax
 00403DF6    ret
*}
end;

//00403DF8
procedure NotifyReRaise;
begin
{*
 00403DF8    cmp         byte ptr ds:[5AC02C],1
>00403DFF    jbe         00403E12
 00403E01    push        0
 00403E03    push        0
 00403E05    push        0
 00403E07    push        0EEDFADF
 00403E0C    call        dword ptr ds:[5AF014]
 00403E12    ret
*}
end;

//00403E14
procedure NotifyNonDelphiException;
begin
{*
 00403E14    cmp         byte ptr ds:[5AC02C],0
>00403E1B    je          00403E34
 00403E1D    push        eax
 00403E1E    push        eax
 00403E1F    push        edx
 00403E20    push        esp
 00403E21    push        2
 00403E23    push        0
 00403E25    push        0EEDFAE4
 00403E2A    call        dword ptr ds:[5AF014]
 00403E30    add         esp,8
 00403E33    pop         eax
 00403E34    ret
*}
end;

//00403E38
procedure NotifyExcept;
begin
{*
 00403E38    push        esp
 00403E39    push        1
 00403E3B    push        0
 00403E3D    push        0EEDFAE0
 00403E42    call        dword ptr ds:[5AF014]
 00403E48    add         esp,4
 00403E4B    pop         eax
 00403E4C    ret
*}
end;

//00403E50
procedure NotifyOnExcept;
begin
{*
 00403E50    cmp         byte ptr ds:[5AC02C],1
>00403E57    jbe         00403E62
 00403E59    push        eax
 00403E5A    push        dword ptr [ebx+4]
>00403E5D    jmp         NotifyExcept
 00403E62    ret
*}
end;

//00403E64
procedure NotifyAnyExcept;
begin
{*
 00403E64    cmp         byte ptr ds:[5AC02C],1
>00403E6B    jbe         00403E74
 00403E6D    push        eax
 00403E6E    push        ebx
>00403E6F    jmp         NotifyExcept
 00403E74    ret
*}
end;

//00403E78
procedure CheckJmp;
begin
{*
 00403E78    test        ecx,ecx
>00403E7A    je          00403E95
 00403E7C    mov         eax,dword ptr [ecx+1]
 00403E7F    cmp         byte ptr [ecx],0E9
>00403E82    je          00403E90
 00403E84    cmp         byte ptr [ecx],0EB
>00403E87    jne         00403E95
 00403E89    movsx       eax,al
 00403E8C    inc         ecx
 00403E8D    inc         ecx
>00403E8E    jmp         00403E93
 00403E90    add         ecx,5
 00403E93    add         ecx,eax
 00403E95    ret
*}
end;

//00403E98
procedure NotifyExceptFinally;
begin
{*
 00403E98    cmp         byte ptr ds:[5AC02C],1
>00403E9F    jbe         00403EBE
 00403EA1    push        eax
 00403EA2    push        edx
 00403EA3    push        ecx
 00403EA4    call        CheckJmp
 00403EA9    push        ecx
 00403EAA    push        esp
 00403EAB    push        1
 00403EAD    push        0
 00403EAF    push        0EEDFAE1
 00403EB4    call        dword ptr ds:[5AF014]
 00403EBA    pop         ecx
 00403EBB    pop         ecx
 00403EBC    pop         edx
 00403EBD    pop         eax
 00403EBE    ret
*}
end;

//00403EC0
procedure NotifyTerminate;
begin
{*
 00403EC0    cmp         byte ptr ds:[5AC02C],1
>00403EC7    jbe         00403EDB
 00403EC9    push        edx
 00403ECA    push        esp
 00403ECB    push        1
 00403ECD    push        0
 00403ECF    push        0EEDFAE2
 00403ED4    call        dword ptr ds:[5AF014]
 00403EDA    pop         edx
 00403EDB    ret
*}
end;

//00403EDC
procedure NotifyUnhandled;
begin
{*
 00403EDC    push        eax
 00403EDD    push        edx
 00403EDE    cmp         byte ptr ds:[5AC02C],1
>00403EE5    jbe         00403EF7
 00403EE7    push        esp
 00403EE8    push        2
 00403EEA    push        0
 00403EEC    push        0EEDFAE3
 00403EF1    call        dword ptr ds:[5AF014]
 00403EF7    pop         edx
 00403EF8    pop         eax
 00403EF9    ret
*}
end;

//00403EFC
procedure @HandleAnyException;
begin
{*
 00403EFC    mov         eax,dword ptr [esp+4]
 00403F00    test        dword ptr [eax+4],6
>00403F07    jne         00404020
 00403F0D    cmp         dword ptr [eax],0EEDFADE
 00403F13    mov         edx,dword ptr [eax+18]
 00403F16    mov         ecx,dword ptr [eax+14]
>00403F19    je          00403F89
 00403F1B    cld
 00403F1C    call        @FpuInit
 00403F21    mov         edx,dword ptr ds:[5AF010]
 00403F27    test        edx,edx
>00403F29    je          00404020
 00403F2F    call        edx
 00403F31    test        eax,eax
>00403F33    je          00404020
 00403F39    mov         edx,dword ptr [esp+0C]
 00403F3D    mov         ecx,dword ptr [esp+4]
 00403F41    cmp         dword ptr [ecx],0EEFFACE
>00403F47    je          00403F80
 00403F49    call        NotifyNonDelphiException
 00403F4E    cmp         byte ptr ds:[5AC030],0
>00403F55    jbe         00403F80
 00403F57    cmp         byte ptr ds:[5AC02C],0
>00403F5E    ja          00403F80
 00403F60    lea         ecx,[esp+4]
 00403F64    push        eax
 00403F65    push        ecx
 00403F66    call        KERNEL32.UnhandledExceptionFilter
 00403F6B    cmp         eax,0
 00403F6E    pop         eax
>00403F6F    je          00404020
 00403F75    mov         edx,eax
 00403F77    mov         eax,dword ptr [esp+4]
 00403F7B    mov         ecx,dword ptr [eax+0C]
>00403F7E    jmp         00403FB0
 00403F80    mov         edx,eax
 00403F82    mov         eax,dword ptr [esp+4]
 00403F86    mov         ecx,dword ptr [eax+0C]
 00403F89    cmp         byte ptr ds:[5AC030],1
>00403F90    jbe         00403FB0
 00403F92    cmp         byte ptr ds:[5AC02C],0
>00403F99    ja          00403FB0
 00403F9B    push        eax
 00403F9C    lea         eax,[esp+8]
 00403FA0    push        edx
 00403FA1    push        ecx
 00403FA2    push        eax
 00403FA3    call        KERNEL32.UnhandledExceptionFilter
 00403FA8    cmp         eax,0
 00403FAB    pop         ecx
 00403FAC    pop         edx
 00403FAD    pop         eax
>00403FAE    je          00404020
 00403FB0    or          dword ptr [eax+4],2
 00403FB4    push        ebx
 00403FB5    xor         ebx,ebx
 00403FB7    push        esi
 00403FB8    push        edi
 00403FB9    push        ebp
 00403FBA    mov         ebx,dword ptr fs:[ebx]
 00403FBD    push        ebx
 00403FBE    push        eax
 00403FBF    push        edx
 00403FC0    push        ecx
 00403FC1    mov         edx,dword ptr [esp+28]
 00403FC5    push        0
 00403FC7    push        eax
 00403FC8    push        403FD4
 00403FCD    push        edx
 00403FCE    call        dword ptr ds:[5AF018]
 00403FD4    mov         edi,dword ptr [esp+28]
 00403FD8    call        @GetTls
 00403FDD    push        dword ptr [eax+0];{RaiseListPtr:Pointer}
 00403FE3    mov         dword ptr [eax+0],esp;{RaiseListPtr:Pointer}
 00403FE9    mov         ebp,dword ptr [edi+8]
 00403FEC    mov         ebx,dword ptr [edi+4]
 00403FEF    mov         dword ptr [edi+4],404000
 00403FF6    add         ebx,5
 00403FF9    call        NotifyAnyExcept
 00403FFE    jmp         ebx
>00404000    jmp         @HandleFinally
 00404005    call        @GetTls
 0040400A    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00404010    mov         edx,dword ptr [ecx]
 00404012    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 00404018    mov         eax,dword ptr [ecx+8]
>0040401B    jmp         TObject.Free
 00404020    mov         eax,1
 00404025    ret
*}
end;

//00404028
procedure @HandleOnException;
begin
{*
 00404028    mov         eax,dword ptr [esp+4]
 0040402C    test        dword ptr [eax+4],6
>00404033    jne         004041A8
 00404039    cmp         dword ptr [eax],0EEDFADE
>0040403F    je          00404060
 00404041    cld
 00404042    call        @FpuInit
 00404047    mov         edx,dword ptr ds:[5AF00C]
 0040404D    test        edx,edx
>0040404F    je          004041A8
 00404055    call        edx
 00404057    test        eax,eax
>00404059    jne         00404065
>0040405B    jmp         004041A8
 00404060    mov         eax,dword ptr [eax+18]
 00404063    mov         eax,dword ptr [eax]
 00404065    mov         edx,dword ptr [esp+8]
 00404069    push        ebx
 0040406A    push        esi
 0040406B    push        edi
 0040406C    push        ebp
 0040406D    mov         ecx,dword ptr [edx+4]
 00404070    mov         ebx,dword ptr [ecx+5]
 00404073    lea         esi,[ecx+9]
 00404076    mov         ebp,eax
 00404078    mov         eax,dword ptr [esi]
 0040407A    test        eax,eax
>0040407C    je          004040C1
 0040407E    mov         edi,ebp
>00404080    jmp         00404084
 00404082    mov         edi,dword ptr [edi]
 00404084    mov         eax,dword ptr [eax]
 00404086    cmp         eax,edi
>00404088    je          004040C1
 0040408A    mov         ecx,dword ptr [eax-28]
 0040408D    cmp         ecx,dword ptr [edi-28]
>00404090    jne         004040A9
 00404092    mov         eax,dword ptr [eax-2C]
 00404095    mov         edx,dword ptr [edi-2C]
 00404098    xor         ecx,ecx
 0040409A    mov         cl,byte ptr [eax]
 0040409C    cmp         cl,byte ptr [edx]
>0040409E    jne         004040A9
 004040A0    inc         eax
 004040A1    inc         edx
 004040A2    call        @AStrCmp
>004040A7    je          004040C1
 004040A9    mov         edi,dword ptr [edi-24]
 004040AC    mov         eax,dword ptr [esi]
 004040AE    test        edi,edi
>004040B0    jne         00404082
 004040B2    add         esi,8
 004040B5    dec         ebx
>004040B6    jne         00404078
 004040B8    pop         ebp
 004040B9    pop         edi
 004040BA    pop         esi
 004040BB    pop         ebx
>004040BC    jmp         004041A8
 004040C1    mov         eax,dword ptr [esp+14]
 004040C5    cmp         dword ptr [eax],0EEDFADE
 004040CB    mov         edx,dword ptr [eax+18]
 004040CE    mov         ecx,dword ptr [eax+14]
>004040D1    je          00404114
 004040D3    call        dword ptr ds:[5AF010]
 004040D9    mov         edx,dword ptr [esp+1C]
 004040DD    call        NotifyNonDelphiException
 004040E2    cmp         byte ptr ds:[5AC030],0
>004040E9    jbe         00404109
 004040EB    cmp         byte ptr ds:[5AC02C],0
>004040F2    ja          00404109
 004040F4    lea         ecx,[esp+4]
 004040F8    push        eax
 004040F9    push        ecx
 004040FA    call        KERNEL32.UnhandledExceptionFilter
 004040FF    cmp         eax,0
 00404102    pop         eax
>00404103    je          004041A8
 00404109    mov         edx,eax
 0040410B    mov         eax,dword ptr [esp+14]
 0040410F    mov         ecx,dword ptr [eax+0C]
>00404112    jmp         0040413B
 00404114    cmp         byte ptr ds:[5AC030],1
>0040411B    jbe         0040413B
 0040411D    cmp         byte ptr ds:[5AC02C],0
>00404124    ja          0040413B
 00404126    push        eax
 00404127    lea         eax,[esp+8]
 0040412B    push        edx
 0040412C    push        ecx
 0040412D    push        eax
 0040412E    call        KERNEL32.UnhandledExceptionFilter
 00404133    cmp         eax,0
 00404136    pop         ecx
 00404137    pop         edx
 00404138    pop         eax
>00404139    je          004041A8
 0040413B    xor         ebx,ebx
 0040413D    mov         ebx,dword ptr fs:[ebx]
 00404140    push        ebx
 00404141    push        eax
 00404142    push        edx
 00404143    push        ecx
 00404144    mov         edx,dword ptr [esp+28]
 00404148    or          dword ptr [eax+4],2
 0040414C    push        esi
 0040414D    push        0
 0040414F    push        eax
 00404150    push        40415C
 00404155    push        edx
 00404156    call        dword ptr ds:[5AF018]
 0040415C    pop         ebx
 0040415D    mov         edi,dword ptr [esp+28]
 00404161    call        @GetTls
 00404166    push        dword ptr [eax+0];{RaiseListPtr:Pointer}
 0040416C    mov         dword ptr [eax+0],esp;{RaiseListPtr:Pointer}
 00404172    mov         ebp,dword ptr [edi+8]
 00404175    mov         dword ptr [edi+4],404188
 0040417C    mov         eax,dword ptr [esp+8]
 00404180    call        NotifyOnExcept
 00404185    jmp         dword ptr [ebx+4]
>00404188    jmp         @HandleFinally
 0040418D    call        @GetTls
 00404192    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00404198    mov         edx,dword ptr [ecx]
 0040419A    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 004041A0    mov         eax,dword ptr [ecx+8]
>004041A3    jmp         TObject.Free
 004041A8    mov         eax,1
 004041AD    ret
*}
end;

//004041B0
procedure @HandleFinally;
begin
{*
 004041B0    mov         eax,dword ptr [esp+4]
 004041B4    mov         edx,dword ptr [esp+8]
 004041B8    test        dword ptr [eax+4],6
>004041BF    je          004041E0
 004041C1    mov         ecx,dword ptr [edx+4]
 004041C4    mov         dword ptr [edx+4],4041E0
 004041CB    push        ebx
 004041CC    push        esi
 004041CD    push        edi
 004041CE    push        ebp
 004041CF    mov         ebp,dword ptr [edx+8]
 004041D2    add         ecx,5
 004041D5    call        NotifyExceptFinally
 004041DA    call        ecx
 004041DC    pop         ebp
 004041DD    pop         edi
 004041DE    pop         esi
 004041DF    pop         ebx
 004041E0    mov         eax,1
 004041E5    ret
*}
end;

//004041E8
procedure @RaiseExcept;
begin
{*
 004041E8    or          eax,eax
>004041EA    jne         004041F6
 004041EC    mov         eax,0D8
 004041F1    call        @RunError
 004041F6    pop         edx
 004041F7    push        esp
 004041F8    push        ebp
 004041F9    push        edi
 004041FA    push        esi
 004041FB    push        ebx
 004041FC    push        eax
 004041FD    push        edx
 004041FE    push        esp
 004041FF    push        7
 00404201    push        1
 00404203    push        0EEDFADE
 00404208    push        edx
 00404209    jmp         dword ptr ds:[5AF014]
 0040420F    ret
*}
end;

//00404210
procedure @RaiseAgain;
begin
{*
 00404210    mov         eax,dword ptr [esp+30]
 00404214    mov         dword ptr [eax+4],40425B
 0040421B    call        @GetTls
 00404220    mov         edx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00404226    mov         ecx,dword ptr [edx]
 00404228    mov         dword ptr [eax+0],ecx;{RaiseListPtr:Pointer}
 0040422E    mov         eax,dword ptr [edx+0C]
 00404231    and         dword ptr [eax+4],0FFFFFFFD
 00404235    cmp         dword ptr [eax],0EEDFADE
>0040423B    je          0040424A
 0040423D    mov         eax,dword ptr [edx+8]
 00404240    call        TObject.Free
 00404245    call        NotifyReRaise
 0040424A    xor         eax,eax
 0040424C    add         esp,14
 0040424F    mov         edx,dword ptr fs:[eax]
 00404252    pop         ecx
 00404253    mov         edx,dword ptr [edx]
 00404255    mov         dword ptr [ecx],edx
 00404257    pop         ebp
 00404258    pop         edi
 00404259    pop         esi
 0040425A    pop         ebx
 0040425B    mov         eax,1
 00404260    ret
*}
end;

//00404264
procedure @DoneExcept;
begin
{*
 00404264    call        @GetTls
 00404269    mov         edx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 0040426F    mov         ecx,dword ptr [edx]
 00404271    mov         dword ptr [eax+0],ecx;{RaiseListPtr:Pointer}
 00404277    mov         eax,dword ptr [edx+8]
 0040427A    call        TObject.Free
 0040427F    pop         edx
 00404280    mov         esp,dword ptr [esp+2C]
 00404284    xor         eax,eax
 00404286    pop         ecx
 00404287    mov         dword ptr fs:[eax],ecx
 0040428A    pop         eax
 0040428B    pop         ebp
 0040428C    call        NotifyTerminate
 00404291    jmp         edx
 00404293    ret
*}
end;

//00404294
procedure @TryFinallyExit;
begin
{*
 00404294    xor         edx,edx
 00404296    mov         ecx,dword ptr [esp+8]
 0040429A    mov         eax,dword ptr [esp+4]
 0040429E    add         ecx,5
 004042A1    mov         dword ptr fs:[edx],eax
 004042A4    call        ecx
 004042A6    ret         0C
*}
end;

//004042AC
procedure MapToRunError(P:PExceptionRecord); stdcall;
begin
{*
 004042AC    push        ebp
 004042AD    mov         ebp,esp
 004042AF    mov         edx,dword ptr [ebp+8]
 004042B2    mov         eax,dword ptr [edx]
 004042B4    cmp         eax,0C0000092
>004042B9    jg          004042E7
>004042BB    je          00404319
 004042BD    cmp         eax,0C000008E
>004042C2    jg          004042D9
>004042C4    je          0040431D
 004042C6    sub         eax,0C0000005
>004042CB    je          00404329
 004042CD    sub         eax,87
>004042D2    je          00404311
 004042D4    dec         eax
>004042D5    je          00404325
>004042D7    jmp         00404339
 004042D9    add         eax,3FFFFF71
 004042DE    sub         eax,2
>004042E1    jb          00404319
>004042E3    je          00404315
>004042E5    jmp         00404339
 004042E7    cmp         eax,0C0000096
>004042EC    jg          004042FF
>004042EE    je          0040432D
 004042F0    sub         eax,0C0000093
>004042F5    je          00404325
 004042F7    dec         eax
>004042F8    je          0040430D
 004042FA    dec         eax
>004042FB    je          00404321
>004042FD    jmp         00404339
 004042FF    sub         eax,0C00000FD
>00404304    je          00404335
 00404306    sub         eax,3D
>00404309    je          00404331
>0040430B    jmp         00404339
 0040430D    mov         al,0C8
>0040430F    jmp         0040433B
 00404311    mov         al,0C9
>00404313    jmp         0040433B
 00404315    mov         al,0CD
>00404317    jmp         0040433B
 00404319    mov         al,0CF
>0040431B    jmp         0040433B
 0040431D    mov         al,0C8
>0040431F    jmp         0040433B
 00404321    mov         al,0D7
>00404323    jmp         0040433B
 00404325    mov         al,0CE
>00404327    jmp         0040433B
 00404329    mov         al,0D8
>0040432B    jmp         0040433B
 0040432D    mov         al,0DA
>0040432F    jmp         0040433B
 00404331    mov         al,0D9
>00404333    jmp         0040433B
 00404335    mov         al,0CA
>00404337    jmp         0040433B
 00404339    mov         al,0FF
 0040433B    and         eax,0FF
 00404340    mov         edx,dword ptr [edx+0C]
 00404343    call        RunErrorAt
 00404348    pop         ebp
 00404349    ret         4
*}
end;

//0040434C
procedure @ExceptionHandler;
begin
{*
 0040434C    mov         eax,dword ptr [esp+4]
 00404350    test        dword ptr [eax+4],6
>00404357    jne         004043E6
 0040435D    cmp         byte ptr ds:[5AC02C],0
>00404364    ja          00404375
 00404366    lea         eax,[esp+4]
 0040436A    push        eax
 0040436B    call        KERNEL32.UnhandledExceptionFilter
 00404370    cmp         eax,0
>00404373    je          004043E6
 00404375    mov         eax,dword ptr [esp+4]
 00404379    cld
 0040437A    call        @FpuInit
 0040437F    mov         edx,dword ptr [esp+8]
 00404383    push        0
 00404385    push        eax
 00404386    push        404392
 0040438B    push        edx
 0040438C    call        dword ptr ds:[5AF018]
 00404392    mov         ebx,dword ptr [esp+4]
 00404396    cmp         dword ptr [ebx],0EEDFADE
 0040439C    mov         edx,dword ptr [ebx+14]
 0040439F    mov         eax,dword ptr [ebx+18]
>004043A2    je          004043C1
 004043A4    mov         edx,dword ptr ds:[5AF010]
 004043AA    test        edx,edx
>004043AC    je          004042AC
 004043B2    mov         eax,ebx
 004043B4    call        edx
 004043B6    test        eax,eax
>004043B8    je          004042AC
 004043BE    mov         edx,dword ptr [ebx+0C]
 004043C1    call        NotifyUnhandled
 004043C6    mov         ecx,dword ptr ds:[5AF004]
 004043CC    test        ecx,ecx
>004043CE    je          004043D2
 004043D0    call        ecx
 004043D2    mov         ecx,dword ptr [esp+4]
 004043D6    mov         eax,0D9
 004043DB    mov         edx,dword ptr [ecx+14]
 004043DE    mov         dword ptr [esp],edx
>004043E1    jmp         @RunError
 004043E6    xor         eax,eax
 004043E8    ret
*}
end;

//004043EC
procedure SetExceptionHandler;
begin
{*
 004043EC    xor         edx,edx
 004043EE    lea         eax,[ebp-0C]
 004043F1    mov         ecx,dword ptr fs:[edx]
 004043F4    mov         dword ptr fs:[edx],eax
 004043F7    mov         dword ptr [eax],ecx
 004043F9    mov         dword ptr [eax+4],40434C;@ExceptionHandler
 00404400    mov         dword ptr [eax+8],ebp
 00404403    mov         [005AF638],eax
 00404408    ret
*}
end;

//0040440C
procedure UnsetExceptionHandler;
begin
{*
 0040440C    xor         edx,edx
 0040440E    mov         eax,[005AF638]
 00404413    test        eax,eax
>00404415    je          00404433
 00404417    mov         ecx,dword ptr fs:[edx]
 0040441A    cmp         eax,ecx
>0040441C    jne         00404426
 0040441E    mov         eax,dword ptr [eax]
 00404420    mov         dword ptr fs:[edx],eax
 00404423    ret
 00404424    mov         ecx,dword ptr [ecx]
 00404426    cmp         ecx,0FFFFFFFF
>00404429    je          00404433
 0040442B    cmp         dword ptr [ecx],eax
>0040442D    jne         00404424
 0040442F    mov         eax,dword ptr [eax]
 00404431    mov         dword ptr [ecx],eax
 00404433    ret
*}
end;

//00404434
procedure FinalizeUnits;
begin
{*
 00404434    push        ebp
 00404435    mov         ebp,esp
 00404437    push        ebx
 00404438    push        esi
 00404439    push        edi
 0040443A    mov         edi,5AF634
 0040443F    mov         eax,dword ptr [edi+8]
 00404442    test        eax,eax
>00404444    je          0040448E
 00404446    mov         ebx,dword ptr [edi+0C]
 00404449    mov         esi,dword ptr [eax+4]
 0040444C    xor         edx,edx
 0040444E    push        ebp
 0040444F    push        40447A
 00404454    push        dword ptr fs:[edx]
 00404457    mov         dword ptr fs:[edx],esp
 0040445A    test        ebx,ebx
>0040445C    jle         00404470
 0040445E    dec         ebx
 0040445F    mov         dword ptr [edi+0C],ebx
 00404462    mov         eax,dword ptr [esi+ebx*8+4]
 00404466    test        eax,eax
>00404468    je          0040446C
 0040446A    call        eax
 0040446C    test        ebx,ebx
>0040446E    jg          0040445E
 00404470    xor         eax,eax
 00404472    pop         edx
 00404473    pop         ecx
 00404474    pop         ecx
 00404475    mov         dword ptr fs:[eax],edx
>00404478    jmp         0040448E
>0040447A    jmp         @HandleAnyException
 0040447F    call        FinalizeUnits
 00404484    call        @RaiseAgain
 00404489    call        @DoneExcept
 0040448E    pop         edi
 0040448F    pop         esi
 00404490    pop         ebx
 00404491    pop         ebp
 00404492    ret
*}
end;

//00404494
procedure InitUnits;
begin
{*
 00404494    push        ebp
 00404495    mov         ebp,esp
 00404497    push        ebx
 00404498    push        esi
 00404499    push        edi
 0040449A    mov         eax,[005AF63C]
 0040449F    test        eax,eax
>004044A1    je          004044EE
 004044A3    mov         esi,dword ptr [eax]
 004044A5    xor         ebx,ebx
 004044A7    mov         edi,dword ptr [eax+4]
 004044AA    xor         edx,edx
 004044AC    push        ebp
 004044AD    push        4044DA
 004044B2    push        dword ptr fs:[edx]
 004044B5    mov         dword ptr fs:[edx],esp
 004044B8    cmp         esi,ebx
>004044BA    jle         004044D0
 004044BC    mov         eax,dword ptr [edi+ebx*8]
 004044BF    inc         ebx
 004044C0    mov         dword ptr ds:[5AF640],ebx
 004044C6    test        eax,eax
>004044C8    je          004044CC
 004044CA    call        eax
 004044CC    cmp         esi,ebx
>004044CE    jg          004044BC
 004044D0    xor         eax,eax
 004044D2    pop         edx
 004044D3    pop         ecx
 004044D4    pop         ecx
 004044D5    mov         dword ptr fs:[eax],edx
>004044D8    jmp         004044EE
>004044DA    jmp         @HandleAnyException
 004044DF    call        FinalizeUnits
 004044E4    call        @RaiseAgain
 004044E9    call        @DoneExcept
 004044EE    pop         edi
 004044EF    pop         esi
 004044F0    pop         ebx
 004044F1    pop         ebp
 004044F2    ret
*}
end;

//004044F4
procedure @StartExe(InitTable:PackageInfo; Module:PLibModule);
begin
{*
 004044F4    mov         dword ptr ds:[5AF014],40124C
 004044FE    mov         dword ptr ds:[5AF018],40125C
 00404508    mov         [005AF63C],eax
 0040450D    xor         eax,eax
 0040450F    mov         [005AF640],eax
 00404514    mov         dword ptr ds:[5AF644],edx
 0040451A    mov         eax,dword ptr [edx+4]
 0040451D    mov         [005AF02C],eax
 00404522    call        SetExceptionHandler
 00404527    mov         byte ptr ds:[5AF034],0;IsLibrary:Boolean
 0040452E    call        InitUnits
 00404533    ret
*}
end;

//00404534
procedure @InitResStrings;
begin
{*
 00404534    push        ebx
 00404535    xor         ebx,ebx
 00404537    push        edi
 00404538    push        esi
 00404539    mov         edi,dword ptr [eax+ebx]
 0040453C    lea         esi,[eax+ebx+4]
 00404540    mov         eax,dword ptr [esi+4]
 00404543    mov         edx,dword ptr [esi]
 00404545    add         eax,ebx
 00404547    add         edx,ebx
 00404549    call        LoadStr
 0040454E    add         esi,8
 00404551    dec         edi
>00404552    jne         00404540
 00404554    pop         esi
 00404555    pop         edi
 00404556    pop         ebx
 00404557    ret
*}
end;

//00404558
procedure @InitResStringImports;
begin
{*
 00404558    push        ebx
 00404559    xor         ebx,ebx
 0040455B    push        edi
 0040455C    push        esi
 0040455D    mov         edi,dword ptr [eax+ebx]
 00404560    lea         esi,[eax+ebx+4]
 00404564    mov         eax,dword ptr [esi+4]
 00404567    mov         edx,dword ptr [esi]
 00404569    mov         eax,dword ptr [eax+ebx]
 0040456C    add         edx,ebx
 0040456E    call        LoadStr
 00404573    add         esi,8
 00404576    dec         edi
>00404577    jne         00404564
 00404579    pop         esi
 0040457A    pop         edi
 0040457B    pop         ebx
 0040457C    ret
*}
end;

//00404580
procedure @InitImports;
begin
{*
 00404580    push        ebx
 00404581    xor         ebx,ebx
 00404583    push        edi
 00404584    push        esi
 00404585    mov         edi,dword ptr [eax+ebx]
 00404588    lea         esi,[eax+ebx+4]
 0040458C    mov         eax,dword ptr [esi+4]
 0040458F    mov         edx,dword ptr [esi]
 00404591    mov         eax,dword ptr [eax+ebx]
 00404594    add         eax,dword ptr [esi+8]
 00404597    mov         dword ptr [edx+ebx],eax
 0040459A    add         esi,0C
 0040459D    dec         edi
>0040459E    jne         0040458C
 004045A0    pop         esi
 004045A1    pop         edi
 004045A2    pop         ebx
 004045A3    ret
*}
end;

//004045A4
procedure MakeErrorMessage;
begin
{*
 004045A4    push        ebx
 004045A5    push        esi
 004045A6    push        edi
 004045A7    mov         esi,5AC094
 004045AC    mov         cl,10
 004045AE    mov         ebx,dword ptr ds:[5AC000]
 004045B4    mov         eax,ebx
 004045B6    mov         edi,0A
 004045BB    cdq
 004045BC    idiv        eax,edi
 004045BE    add         dl,30
 004045C1    xor         eax,eax
 004045C3    mov         al,cl
 004045C5    mov         byte ptr [esi+eax],dl
 004045C8    mov         eax,ebx
 004045CA    mov         ebx,0A
 004045CF    cdq
 004045D0    idiv        eax,ebx
 004045D2    mov         ebx,eax
 004045D4    dec         ecx
 004045D5    test        ebx,ebx
>004045D7    jne         004045B4
 004045D9    mov         cl,1C
 004045DB    mov         eax,[005AC004]
 004045E0    mov         edx,eax
 004045E2    and         edx,0F
 004045E5    mov         dl,byte ptr [edx+5AC0B4]
 004045EB    xor         ebx,ebx
 004045ED    mov         bl,cl
 004045EF    mov         byte ptr [esi+ebx],dl
 004045F2    shr         eax,4
 004045F5    dec         ecx
 004045F6    test        eax,eax
>004045F8    jne         004045E0
 004045FA    pop         edi
 004045FB    pop         esi
 004045FC    pop         ebx
 004045FD    ret
*}
end;

//00404600
procedure ExitDll;
begin
{*
 00404600    xor         eax,eax
 00404602    xchg        eax,dword ptr ds:[5AC000]
 00404608    neg         eax
 0040460A    sbb         eax,eax
 0040460C    inc         eax
 0040460D    mov         edi,5AF634
 00404612    mov         ebx,dword ptr [edi+18]
 00404615    mov         ebp,dword ptr [edi+14]
 00404618    push        dword ptr [edi+1C]
 0040461B    push        dword ptr [edi+20]
 0040461E    mov         esi,dword ptr [edi]
 00404620    mov         ecx,0B
 00404625    rep movs    dword ptr [edi],dword ptr [esi]
 00404627    pop         edi
 00404628    pop         esi
 00404629    leave
 0040462A    ret         0C
*}
end;

//00404630
procedure WriteErrorMessage;
begin
{*
 00404630    push        ecx
 00404631    cmp         byte ptr ds:[5AF048],0
>00404638    je          00404691
 0040463A    cmp         word ptr ds:[5AF21C],0D7B2
>00404643    jne         00404659
 00404645    cmp         dword ptr ds:[5AF224],0
>0040464C    jbe         00404659
 0040464E    mov         eax,5AF218
 00404653    call        dword ptr ds:[5AF234]
 00404659    push        0
 0040465B    lea         eax,[esp+4]
 0040465F    push        eax
 00404660    push        1E
 00404662    push        5AC094
 00404667    push        0F5
 00404669    call        KERNEL32.GetStdHandle
 0040466E    push        eax
 0040466F    call        KERNEL32.WriteFile
 00404674    push        0
 00404676    lea         eax,[esp+4]
 0040467A    push        eax
 0040467B    push        2
 0040467D    push        4046B8;#13+#10
 00404682    push        0F5
 00404684    call        KERNEL32.GetStdHandle
 00404689    push        eax
 0040468A    call        KERNEL32.WriteFile
 0040468F    pop         edx
 00404690    ret
 00404691    cmp         byte ptr ds:[5AC034],0
>00404698    jne         004046AD
 0040469A    push        0
 0040469C    push        5AC08C
 004046A1    push        5AC094
 004046A6    push        0
 004046A8    call        user32.MessageBoxA
 004046AD    pop         edx
 004046AE    ret
*}
end;

//004046BC
procedure @Halt0;
begin
{*
 004046BC    push        ebx
 004046BD    push        esi
 004046BE    push        edi
 004046BF    push        ebp
 004046C0    mov         ebx,5AF634
 004046C5    mov         esi,5AC000
 004046CA    mov         edi,5AF044
 004046CF    cmp         byte ptr [ebx+28],0
>004046D3    jne         004046EB
 004046D5    cmp         dword ptr [edi],0
>004046D8    je          004046EB
 004046DA    mov         edx,dword ptr [edi]
 004046DC    mov         eax,edx
 004046DE    xor         edx,edx
 004046E0    mov         dword ptr [edi],edx
 004046E2    mov         ebp,eax
 004046E4    call        ebp
 004046E6    cmp         dword ptr [edi],0
>004046E9    jne         004046DA
 004046EB    cmp         dword ptr ds:[5AC004],0
>004046F2    je          00404705
 004046F4    call        MakeErrorMessage
 004046F9    call        WriteErrorMessage
 004046FE    xor         eax,eax
 00404700    mov         [005AC004],eax
 00404705    cmp         byte ptr [ebx+28],2
>00404709    jne         00404715
 0040470B    cmp         dword ptr [esi],0
>0040470E    jne         00404715
 00404710    xor         eax,eax
 00404712    mov         dword ptr [ebx+0C],eax
 00404715    call        FinalizeUnits
 0040471A    cmp         byte ptr [ebx+28],1
>0040471E    jbe         00404725
 00404720    cmp         dword ptr [esi],0
>00404723    je          00404746
 00404725    mov         eax,dword ptr [ebx+10]
 00404728    test        eax,eax
>0040472A    je          00404746
 0040472C    call        UnregisterModule
 00404731    mov         edx,dword ptr [ebx+10]
 00404734    mov         eax,dword ptr [edx+10]
 00404737    cmp         eax,dword ptr [edx+4]
>0040473A    je          00404746
 0040473C    test        eax,eax
>0040473E    je          00404746
 00404740    push        eax
 00404741    call        KERNEL32.FreeLibrary
 00404746    call        UnsetExceptionHandler
 0040474B    cmp         byte ptr [ebx+28],1
>0040474F    jne         00404754
 00404751    call        dword ptr [ebx+24]
 00404754    cmp         byte ptr [ebx+28],0
>00404758    je          0040475F
 0040475A    call        ExitDll
 0040475F    cmp         dword ptr [ebx],0
>00404762    jne         0040477B
 00404764    cmp         dword ptr ds:[5AF024],0
>0040476B    je          00404773
 0040476D    call        dword ptr ds:[5AF024]
 00404773    mov         eax,dword ptr [esi]
 00404775    push        eax
 00404776    call        KERNEL32.ExitProcess
 0040477B    mov         eax,dword ptr [ebx]
 0040477D    push        esi
 0040477E    mov         esi,eax
 00404780    mov         edi,ebx
 00404782    mov         ecx,0B
 00404787    rep movs    dword ptr [edi],dword ptr [esi]
 00404789    pop         esi
>0040478A    jmp         00404705
 0040478F    pop         ebp
 00404790    pop         edi
 00404791    pop         esi
 00404792    pop         ebx
 00404793    ret
*}
end;

//00404794
procedure @Halt(Code:Integer);
begin
{*
 00404794    mov         [005AC000],eax
 00404799    call        @Halt0
 0040479E    ret
*}
end;

//004047A0
procedure @RunError(errorCode:Byte);
begin
{*
 004047A0    pop         dword ptr ds:[5AC004]
>004047A6    jmp         @Halt
 004047AB    ret
*}
end;

//004047AC
procedure @Assert(Message:AnsiString; Filename:AnsiString; LineNumber:Integer);
begin
{*
 004047AC    push        ebx
 004047AD    cmp         dword ptr ds:[5AF020],0
>004047B4    jne         004047BF
 004047B6    mov         al,15
 004047B8    call        Error
 004047BD    pop         ebx
 004047BE    ret
 004047BF    push        dword ptr [esp+4]
 004047C3    call        dword ptr ds:[5AF020]
 004047C9    pop         ebx
 004047CA    ret
*}
end;

//004047CC
procedure @LStrClr(var S:AnsiString);
begin
{*
 004047CC    mov         edx,dword ptr [eax]
 004047CE    test        edx,edx
>004047D0    je          004047EE
 004047D2    mov         dword ptr [eax],0
 004047D8    mov         ecx,dword ptr [edx-8]
 004047DB    dec         ecx
>004047DC    jl          004047EE
 004047DE    lock dec    dword ptr [edx-8]
>004047E2    jne         004047EE
 004047E4    push        eax
 004047E5    lea         eax,[edx-8]
 004047E8    call        @FreeMem
 004047ED    pop         eax
 004047EE    ret
*}
end;

//004047F0
procedure @LStrArrayClr(var StrArray:Pointer; Count:Integer);
begin
{*
 004047F0    push        ebx
 004047F1    push        esi
 004047F2    mov         ebx,eax
 004047F4    mov         esi,edx
 004047F6    mov         edx,dword ptr [ebx]
 004047F8    test        edx,edx
>004047FA    je          00404816
 004047FC    mov         dword ptr [ebx],0
 00404802    mov         ecx,dword ptr [edx-8]
 00404805    dec         ecx
>00404806    jl          00404816
 00404808    lock dec    dword ptr [edx-8]
>0040480C    jne         00404816
 0040480E    lea         eax,[edx-8]
 00404811    call        @FreeMem
 00404816    add         ebx,4
 00404819    dec         esi
>0040481A    jne         004047F6
 0040481C    pop         esi
 0040481D    pop         ebx
 0040481E    ret
*}
end;

//00404820
procedure @LStrAsg(var Dest:AnsiString; Source:AnsiString);
begin
{*
 00404820    test        edx,edx
>00404822    je          00404848
 00404824    mov         ecx,dword ptr [edx-8]
 00404827    inc         ecx
>00404828    jg          00404844
 0040482A    push        eax
 0040482B    push        edx
 0040482C    mov         eax,dword ptr [edx-4]
 0040482F    call        @NewAnsiString
 00404834    mov         edx,eax
 00404836    pop         eax
 00404837    push        edx
 00404838    mov         ecx,dword ptr [eax-4]
 0040483B    call        Move
 00404840    pop         edx
 00404841    pop         eax
>00404842    jmp         00404848
 00404844    lock inc    dword ptr [edx-8]
 00404848    xchg        edx,dword ptr [eax]
 0040484A    test        edx,edx
>0040484C    je          00404862
 0040484E    mov         ecx,dword ptr [edx-8]
 00404851    dec         ecx
>00404852    jl          00404862
 00404854    lock dec    dword ptr [edx-8]
>00404858    jne         00404862
 0040485A    lea         eax,[edx-8]
 0040485D    call        @FreeMem
 00404862    ret
*}
end;

//00404864
procedure @LStrLAsg(var Dest:AnsiString; const Source:AnsiString);
begin
{*
 00404864    test        edx,edx
>00404866    je          00404872
 00404868    mov         ecx,dword ptr [edx-8]
 0040486B    inc         ecx
>0040486C    jle         00404872
 0040486E    lock inc    dword ptr [edx-8]
 00404872    xchg        edx,dword ptr [eax]
 00404874    test        edx,edx
>00404876    je          0040488C
 00404878    mov         ecx,dword ptr [edx-8]
 0040487B    dec         ecx
>0040487C    jl          0040488C
 0040487E    lock dec    dword ptr [edx-8]
>00404882    jne         0040488C
 00404884    lea         eax,[edx-8]
 00404887    call        @FreeMem
 0040488C    ret
*}
end;

//00404890
function @NewAnsiString(length:Integer):Pointer;
begin
{*
 00404890    test        eax,eax
>00404892    jle         004048B8
 00404894    push        eax
 00404895    add         eax,0A
 00404898    and         eax,0FFFFFFFE
 0040489B    push        eax
 0040489C    call        @GetMem
 004048A1    pop         edx
 004048A2    mov         word ptr [edx+eax-2],0
 004048A9    add         eax,8
 004048AC    pop         edx
 004048AD    mov         dword ptr [eax-4],edx
 004048B0    mov         dword ptr [eax-8],1
 004048B7    ret
 004048B8    xor         eax,eax
 004048BA    ret
*}
end;

//004048BC
procedure @LStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);
begin
{*
 004048BC    push        ebx
 004048BD    push        esi
 004048BE    push        edi
 004048BF    mov         ebx,eax
 004048C1    mov         esi,edx
 004048C3    mov         edi,ecx
 004048C5    mov         eax,edi
 004048C7    call        @NewAnsiString
 004048CC    mov         ecx,edi
 004048CE    mov         edi,eax
 004048D0    test        esi,esi
>004048D2    je          004048DD
 004048D4    mov         edx,eax
 004048D6    mov         eax,esi
 004048D8    call        Move
 004048DD    mov         eax,ebx
 004048DF    call        @LStrClr
 004048E4    mov         dword ptr [ebx],edi
 004048E6    pop         edi
 004048E7    pop         esi
 004048E8    pop         ebx
 004048E9    ret
*}
end;

//004048EC
function CharFromWChar(CharDest:PAnsiChar; DestBytes:Integer; const WCharSource:PWideChar; SrcChars:Integer):Integer;
begin
{*
 004048EC    push        ebp
 004048ED    mov         ebp,esp
 004048EF    push        0
 004048F1    push        0
 004048F3    push        edx
 004048F4    push        eax
 004048F5    mov         eax,dword ptr [ebp+8]
 004048F8    push        eax
 004048F9    push        ecx
 004048FA    push        0
 004048FC    mov         eax,[005AF5BC]
 00404901    push        eax
 00404902    call        KERNEL32.WideCharToMultiByte
 00404907    pop         ebp
 00404908    ret         4
*}
end;

//0040490C
function WCharFromChar(WCharDest:PWideChar; DestChars:Integer; const CharSource:PAnsiChar; SrcBytes:Integer):Integer;
begin
{*
 0040490C    push        ebp
 0040490D    mov         ebp,esp
 0040490F    push        edx
 00404910    push        eax
 00404911    mov         eax,dword ptr [ebp+8]
 00404914    push        eax
 00404915    push        ecx
 00404916    push        0
 00404918    mov         eax,[005AF5BC]
 0040491D    push        eax
 0040491E    call        KERNEL32.MultiByteToWideChar
 00404923    pop         ebp
 00404924    ret         4
*}
end;

//00404928
procedure @LStrFromPWCharLen(var Dest:AnsiString; Source:PWideChar; Length:Integer);
begin
{*
 00404928    push        ebx
 00404929    push        esi
 0040492A    push        edi
 0040492B    push        ebp
 0040492C    add         esp,0FFFFF004
 00404932    push        eax
 00404933    add         esp,0FFFFFFFC
 00404936    mov         esi,ecx
 00404938    mov         dword ptr [esp],edx
 0040493B    mov         edi,eax
 0040493D    test        esi,esi
>0040493F    jg          0040494A
 00404941    mov         eax,edi
 00404943    call        @LStrClr
>00404948    jmp         004049A9
 0040494A    lea         ebp,[esi+1]
 0040494D    cmp         ebp,7FF
>00404953    jge         0040497D
 00404955    push        esi
 00404956    lea         eax,[esp+8]
 0040495A    mov         ecx,dword ptr [esp+4]
 0040495E    mov         edx,0FFF
 00404963    call        CharFromWChar
 00404968    mov         ebx,eax
 0040496A    test        ebx,ebx
>0040496C    jl          0040497D
 0040496E    lea         edx,[esp+4]
 00404972    mov         eax,edi
 00404974    mov         ecx,ebx
 00404976    call        @LStrFromPCharLen
>0040497B    jmp         004049A9
 0040497D    mov         ebx,ebp
 0040497F    add         ebx,ebx
 00404981    mov         eax,edi
 00404983    mov         edx,ebx
 00404985    call        @LStrSetLength
 0040498A    push        esi
 0040498B    mov         eax,dword ptr [edi]
 0040498D    mov         ecx,dword ptr [esp+4]
 00404991    mov         edx,ebx
 00404993    call        CharFromWChar
 00404998    mov         ebx,eax
 0040499A    test        ebx,ebx
>0040499C    jge         004049A0
 0040499E    xor         ebx,ebx
 004049A0    mov         eax,edi
 004049A2    mov         edx,ebx
 004049A4    call        @LStrSetLength
 004049A9    add         esp,1004
 004049AF    pop         ebp
 004049B0    pop         edi
 004049B1    pop         esi
 004049B2    pop         ebx
 004049B3    ret
*}
end;

//004049B4
procedure @LStrFromChar(var Dest:AnsiString; Source:AnsiChar);
begin
{*
 004049B4    push        edx
 004049B5    mov         edx,esp
 004049B7    mov         ecx,1
 004049BC    call        @LStrFromPCharLen
 004049C1    pop         edx
 004049C2    ret
*}
end;

//004049C4
procedure @LStrFromPChar(var Dest:AnsiString; Source:PAnsiChar);
begin
{*
 004049C4    xor         ecx,ecx
 004049C6    test        edx,edx
>004049C8    je          004049EB
 004049CA    push        edx
 004049CB    cmp         cl,byte ptr [edx]
>004049CD    je          004049E6
 004049CF    cmp         cl,byte ptr [edx+1]
>004049D2    je          004049E5
 004049D4    cmp         cl,byte ptr [edx+2]
>004049D7    je          004049E4
 004049D9    cmp         cl,byte ptr [edx+3]
>004049DC    je          004049E3
 004049DE    add         edx,4
>004049E1    jmp         004049CB
 004049E3    inc         edx
 004049E4    inc         edx
 004049E5    inc         edx
 004049E6    mov         ecx,edx
 004049E8    pop         edx
 004049E9    sub         ecx,edx
>004049EB    jmp         @LStrFromPCharLen
 004049F0    ret
*}
end;

//004049F4
procedure @LStrFromPWChar(var Dest:AnsiString; Source:PWideChar);
begin
{*
 004049F4    xor         ecx,ecx
 004049F6    test        edx,edx
>004049F8    je          00404A27
 004049FA    push        edx
 004049FB    cmp         cx,word ptr [edx]
>004049FE    je          00404A20
 00404A00    cmp         cx,word ptr [edx+2]
>00404A04    je          00404A1D
 00404A06    cmp         cx,word ptr [edx+4]
>00404A0A    je          00404A1A
 00404A0C    cmp         cx,word ptr [edx+6]
>00404A10    je          00404A17
 00404A12    add         edx,8
>00404A15    jmp         004049FB
 00404A17    add         edx,2
 00404A1A    add         edx,2
 00404A1D    add         edx,2
 00404A20    mov         ecx,edx
 00404A22    pop         edx
 00404A23    sub         ecx,edx
 00404A25    shr         ecx,1
>00404A27    jmp         @LStrFromPWCharLen
 00404A2C    ret
*}
end;

//00404A30
procedure @LStrFromString(var Dest:AnsiString; const Source:ShortString);
begin
{*
 00404A30    xor         ecx,ecx
 00404A32    mov         cl,byte ptr [edx]
 00404A34    inc         edx
>00404A35    jmp         @LStrFromPCharLen
 00404A3A    ret
*}
end;

//00404A3C
procedure @LStrFromArray(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);
begin
{*
 00404A3C    push        edi
 00404A3D    push        eax
 00404A3E    push        ecx
 00404A3F    mov         edi,edx
 00404A41    xor         eax,eax
 00404A43    repne scas  byte ptr [edi]
>00404A45    jne         00404A49
 00404A47    not         ecx
 00404A49    pop         eax
 00404A4A    add         ecx,eax
 00404A4C    pop         eax
 00404A4D    pop         edi
>00404A4E    jmp         @LStrFromPCharLen
 00404A53    ret
*}
end;

//00404A54
procedure @LStrFromWStr(var Dest:AnsiString; const Source:WideString);
begin
{*
 00404A54    xor         ecx,ecx
 00404A56    test        edx,edx
>00404A58    je          00404A5F
 00404A5A    mov         ecx,dword ptr [edx-4]
 00404A5D    shr         ecx,1
>00404A5F    jmp         @LStrFromPWCharLen
 00404A64    ret
*}
end;

//00404A68
procedure @LStrToString(var Dest:ShortString; const Source:AnsiString; MaxLen:Integer);
begin
{*
 00404A68    push        ebx
 00404A69    test        edx,edx
>00404A6B    je          00404A85
 00404A6D    mov         ebx,dword ptr [edx-4]
 00404A70    test        ebx,ebx
>00404A72    je          00404A85
 00404A74    cmp         ecx,ebx
>00404A76    jl          00404A7A
 00404A78    mov         ecx,ebx
 00404A7A    mov         byte ptr [eax],cl
 00404A7C    inc         eax
 00404A7D    xchg        eax,edx
 00404A7E    call        Move
 00404A83    pop         ebx
 00404A84    ret
 00404A85    mov         byte ptr [eax],0
 00404A88    pop         ebx
 00404A89    ret
*}
end;

//00404A8C
function @LStrLen(S:AnsiString):Integer;
begin
{*
 00404A8C    test        eax,eax
>00404A8E    je          00404A93
 00404A90    mov         eax,dword ptr [eax-4]
 00404A93    ret
*}
end;

//00404A94
procedure @LStrCat(var Dest:AnsiString; Source:AnsiString);
begin
{*
 00404A94    test        edx,edx
>00404A96    je          00404AD7
 00404A98    mov         ecx,dword ptr [eax]
 00404A9A    test        ecx,ecx
>00404A9C    je          00404820
 00404AA2    push        ebx
 00404AA3    push        esi
 00404AA4    push        edi
 00404AA5    mov         ebx,eax
 00404AA7    mov         esi,edx
 00404AA9    mov         edi,dword ptr [ecx-4]
 00404AAC    mov         edx,dword ptr [esi-4]
 00404AAF    add         edx,edi
 00404AB1    cmp         esi,ecx
>00404AB3    je          00404ACC
 00404AB5    call        @LStrSetLength
 00404ABA    mov         eax,esi
 00404ABC    mov         ecx,dword ptr [esi-4]
 00404ABF    mov         edx,dword ptr [ebx]
 00404AC1    add         edx,edi
 00404AC3    call        Move
 00404AC8    pop         edi
 00404AC9    pop         esi
 00404ACA    pop         ebx
 00404ACB    ret
 00404ACC    call        @LStrSetLength
 00404AD1    mov         eax,dword ptr [ebx]
 00404AD3    mov         ecx,edi
>00404AD5    jmp         00404ABF
 00404AD7    ret
*}
end;

//00404AD8
procedure @LStrCat3(var Dest:AnsiString; Source1:AnsiString; Source2:AnsiString);
begin
{*
 00404AD8    test        edx,edx
>00404ADA    je          00404B3D
 00404ADC    test        ecx,ecx
>00404ADE    je          00404820
 00404AE4    cmp         edx,dword ptr [eax]
>00404AE6    je          00404B44
 00404AE8    cmp         ecx,dword ptr [eax]
>00404AEA    je          00404AFA
 00404AEC    push        eax
 00404AED    push        ecx
 00404AEE    call        @LStrAsg
 00404AF3    pop         edx
 00404AF4    pop         eax
>00404AF5    jmp         @LStrCat
 00404AFA    push        ebx
 00404AFB    push        esi
 00404AFC    push        edi
 00404AFD    mov         ebx,edx
 00404AFF    mov         esi,ecx
 00404B01    push        eax
 00404B02    mov         eax,dword ptr [ebx-4]
 00404B05    add         eax,dword ptr [esi-4]
 00404B08    call        @NewAnsiString
 00404B0D    mov         edi,eax
 00404B0F    mov         edx,eax
 00404B11    mov         eax,ebx
 00404B13    mov         ecx,dword ptr [ebx-4]
 00404B16    call        Move
 00404B1B    mov         edx,edi
 00404B1D    mov         eax,esi
 00404B1F    mov         ecx,dword ptr [esi-4]
 00404B22    add         edx,dword ptr [ebx-4]
 00404B25    call        Move
 00404B2A    pop         eax
 00404B2B    mov         edx,edi
 00404B2D    test        edi,edi
>00404B2F    je          00404B34
 00404B31    dec         dword ptr [edi-8]
 00404B34    call        @LStrAsg
 00404B39    pop         edi
 00404B3A    pop         esi
 00404B3B    pop         ebx
 00404B3C    ret
 00404B3D    mov         edx,ecx
>00404B3F    jmp         @LStrAsg
 00404B44    mov         edx,ecx
>00404B46    jmp         @LStrCat
 00404B4B    ret
*}
end;

//00404B4C
procedure @LStrCatN(var Dest:AnsiString; ArgCnt:Integer);
begin
{*
 00404B4C    push        ebx
 00404B4D    push        esi
 00404B4E    push        edi
 00404B4F    push        edx
 00404B50    push        eax
 00404B51    mov         ebx,edx
 00404B53    xor         edi,edi
 00404B55    mov         ecx,dword ptr [esp+edx*4+14]
 00404B59    test        ecx,ecx
>00404B5B    je          00404B69
 00404B5D    cmp         dword ptr [eax],ecx
>00404B5F    jne         00404B69
 00404B61    mov         edi,ecx
 00404B63    mov         eax,dword ptr [ecx-4]
 00404B66    dec         edx
>00404B67    jmp         00404B6B
 00404B69    xor         eax,eax
 00404B6B    mov         ecx,dword ptr [esp+edx*4+14]
 00404B6F    test        ecx,ecx
>00404B71    je          00404B7C
 00404B73    add         eax,dword ptr [ecx-4]
 00404B76    cmp         edi,ecx
>00404B78    jne         00404B7C
 00404B7A    xor         edi,edi
 00404B7C    dec         edx
>00404B7D    jne         00404B6B
 00404B7F    test        edi,edi
>00404B81    je          00404B9A
 00404B83    mov         edx,eax
 00404B85    mov         eax,dword ptr [esp]
 00404B88    mov         esi,dword ptr [edi-4]
 00404B8B    call        @LStrSetLength
 00404B90    mov         edi,dword ptr [esp]
 00404B93    push        dword ptr [edi]
 00404B95    add         esi,dword ptr [edi]
 00404B97    dec         ebx
>00404B98    jmp         00404BA2
 00404B9A    call        @NewAnsiString
 00404B9F    push        eax
 00404BA0    mov         esi,eax
 00404BA2    mov         eax,dword ptr [esp+ebx*4+18]
 00404BA6    mov         edx,esi
 00404BA8    test        eax,eax
>00404BAA    je          00404BB6
 00404BAC    mov         ecx,dword ptr [eax-4]
 00404BAF    add         esi,ecx
 00404BB1    call        Move
 00404BB6    dec         ebx
>00404BB7    jne         00404BA2
 00404BB9    pop         edx
 00404BBA    pop         eax
 00404BBB    test        edi,edi
>00404BBD    jne         00404BCB
 00404BBF    test        edx,edx
>00404BC1    je          00404BC6
 00404BC3    dec         dword ptr [edx-8]
 00404BC6    call        @LStrAsg
 00404BCB    pop         edx
 00404BCC    pop         edi
 00404BCD    pop         esi
 00404BCE    pop         ebx
 00404BCF    pop         eax
 00404BD0    lea         esp,[esp+edx*4]
 00404BD3    jmp         eax
 00404BD5    ret
*}
end;

//00404BD8
{*function @LStrCmp(Left:AnsiString; Right:AnsiString):?;
begin
 00404BD8    push        ebx
 00404BD9    push        esi
 00404BDA    push        edi
 00404BDB    mov         esi,eax
 00404BDD    mov         edi,edx
 00404BDF    cmp         eax,edx
>00404BE1    je          00404C76
 00404BE7    test        esi,esi
>00404BE9    je          00404C53
 00404BEB    test        edi,edi
>00404BED    je          00404C5A
 00404BEF    mov         eax,dword ptr [esi-4]
 00404BF2    mov         edx,dword ptr [edi-4]
 00404BF5    sub         eax,edx
>00404BF7    ja          00404BFB
 00404BF9    add         edx,eax
 00404BFB    push        edx
 00404BFC    shr         edx,2
>00404BFF    je          00404C27
 00404C01    mov         ecx,dword ptr [esi]
 00404C03    mov         ebx,dword ptr [edi]
 00404C05    cmp         ecx,ebx
>00404C07    jne         00404C61
 00404C09    dec         edx
>00404C0A    je          00404C21
 00404C0C    mov         ecx,dword ptr [esi+4]
 00404C0F    mov         ebx,dword ptr [edi+4]
 00404C12    cmp         ecx,ebx
>00404C14    jne         00404C61
 00404C16    add         esi,8
 00404C19    add         edi,8
 00404C1C    dec         edx
>00404C1D    jne         00404C01
>00404C1F    jmp         00404C27
 00404C21    add         esi,4
 00404C24    add         edi,4
 00404C27    pop         edx
 00404C28    and         edx,3
>00404C2B    je          00404C4F
 00404C2D    mov         ecx,dword ptr [esi]
 00404C2F    mov         ebx,dword ptr [edi]
 00404C31    cmp         cl,bl
>00404C33    jne         00404C76
 00404C35    dec         edx
>00404C36    je          00404C4F
 00404C38    cmp         ch,bh
>00404C3A    jne         00404C76
 00404C3C    dec         edx
>00404C3D    je          00404C4F
 00404C3F    and         ebx,0FF0000
 00404C45    and         ecx,0FF0000
 00404C4B    cmp         ecx,ebx
>00404C4D    jne         00404C76
 00404C4F    add         eax,eax
>00404C51    jmp         00404C76
 00404C53    mov         edx,dword ptr [edi-4]
 00404C56    sub         eax,edx
>00404C58    jmp         00404C76
 00404C5A    mov         eax,dword ptr [esi-4]
 00404C5D    sub         eax,edx
>00404C5F    jmp         00404C76
 00404C61    pop         edx
 00404C62    cmp         cl,bl
>00404C64    jne         00404C76
 00404C66    cmp         ch,bh
>00404C68    jne         00404C76
 00404C6A    shr         ecx,10
 00404C6D    shr         ebx,10
 00404C70    cmp         cl,bl
>00404C72    jne         00404C76
 00404C74    cmp         ch,bh
 00404C76    pop         edi
 00404C77    pop         esi
 00404C78    pop         ebx
 00404C79    ret
end;*}

//00404C7C
function @LStrAddRef(var S:AnsiString):Pointer;
begin
{*
 00404C7C    test        eax,eax
>00404C7E    je          00404C8A
 00404C80    mov         edx,dword ptr [eax-8]
 00404C83    inc         edx
>00404C84    jle         00404C8A
 00404C86    lock inc    dword ptr [eax-8]
 00404C8A    ret
*}
end;

//00404C8C
function @LStrToPChar(S:AnsiString):PChar;
begin
{*
 00404C8C    test        eax,eax
>00404C8E    je          00404C92
 00404C90    ret
 00404C91    add         byte ptr [eax+404C91],bh
 00404C97    ret
*}
end;

//00404C98
function InternalUniqueString(var str:void ):Pointer;
begin
{*
 00404C98    mov         edx,dword ptr [eax]
 00404C9A    test        edx,edx
>00404C9C    je          00404CD6
 00404C9E    mov         ecx,dword ptr [edx-8]
 00404CA1    dec         ecx
>00404CA2    je          00404CD6
 00404CA4    push        ebx
 00404CA5    mov         ebx,eax
 00404CA7    mov         eax,dword ptr [edx-4]
 00404CAA    call        @NewAnsiString
 00404CAF    mov         edx,eax
 00404CB1    mov         eax,dword ptr [ebx]
 00404CB3    mov         dword ptr [ebx],edx
 00404CB5    push        eax
 00404CB6    mov         ecx,dword ptr [eax-4]
 00404CB9    call        Move
 00404CBE    pop         eax
 00404CBF    mov         ecx,dword ptr [eax-8]
 00404CC2    dec         ecx
>00404CC3    jl          00404CD3
 00404CC5    lock dec    dword ptr [eax-8]
>00404CC9    jne         00404CD3
 00404CCB    lea         eax,[eax-8]
 00404CCE    call        @FreeMem
 00404CD3    mov         edx,dword ptr [ebx]
 00404CD5    pop         ebx
 00404CD6    mov         eax,edx
 00404CD8    ret
*}
end;

//00404CDC
procedure UniqueString(var str:AnsiString);
begin
{*
>00404CDC    jmp         InternalUniqueString
 00404CE1    ret
*}
end;

//00404CE4
procedure @UniqueStringA(var str:AnsiString);
begin
{*
>00404CE4    jmp         InternalUniqueString
 00404CE9    ret
*}
end;

//00404CEC
function @LStrCopy(const S:AnsiString; Index:Integer; Count:Integer):AnsiString;
begin
{*
 00404CEC    push        ebx
 00404CED    test        eax,eax
>00404CEF    je          00404D1E
 00404CF1    mov         ebx,dword ptr [eax-4]
 00404CF4    test        ebx,ebx
>00404CF6    je          00404D1E
 00404CF8    dec         edx
>00404CF9    jl          00404D16
 00404CFB    cmp         edx,ebx
>00404CFD    jge         00404D1E
 00404CFF    sub         ebx,edx
 00404D01    test        ecx,ecx
>00404D03    jl          00404D1E
 00404D05    cmp         ecx,ebx
>00404D07    jg          00404D1A
 00404D09    add         edx,eax
 00404D0B    mov         eax,dword ptr [esp+8]
 00404D0F    call        @LStrFromPCharLen
>00404D14    jmp         00404D27
 00404D16    xor         edx,edx
>00404D18    jmp         00404CFF
 00404D1A    mov         ecx,ebx
>00404D1C    jmp         00404D09
 00404D1E    mov         eax,dword ptr [esp+8]
 00404D22    call        @LStrClr
 00404D27    pop         ebx
 00404D28    ret         4
*}
end;

//00404D2C
procedure @LStrDelete(var S:AnsiString; Index:Integer; Count:Integer);
begin
{*
 00404D2C    push        ebx
 00404D2D    push        esi
 00404D2E    push        edi
 00404D2F    mov         ebx,eax
 00404D31    mov         esi,edx
 00404D33    mov         edi,ecx
 00404D35    call        UniqueString
 00404D3A    mov         edx,dword ptr [ebx]
 00404D3C    test        edx,edx
>00404D3E    je          00404D70
 00404D40    mov         ecx,dword ptr [edx-4]
 00404D43    dec         esi
>00404D44    jl          00404D70
 00404D46    cmp         esi,ecx
>00404D48    jge         00404D70
 00404D4A    test        edi,edi
>00404D4C    jle         00404D70
 00404D4E    sub         ecx,esi
 00404D50    cmp         edi,ecx
>00404D52    jle         00404D56
 00404D54    mov         edi,ecx
 00404D56    sub         ecx,edi
 00404D58    add         edx,esi
 00404D5A    lea         eax,[edi+edx]
 00404D5D    call        Move
 00404D62    mov         edx,dword ptr [ebx]
 00404D64    mov         eax,ebx
 00404D66    mov         edx,dword ptr [edx-4]
 00404D69    sub         edx,edi
 00404D6B    call        @LStrSetLength
 00404D70    pop         edi
 00404D71    pop         esi
 00404D72    pop         ebx
 00404D73    ret
*}
end;

//00404D74
procedure @LStrInsert(const Source:AnsiString; var S:AnsiString; Index:Integer);
begin
{*
 00404D74    test        eax,eax
>00404D76    je          00404DCE
 00404D78    push        ebx
 00404D79    push        esi
 00404D7A    push        edi
 00404D7B    push        ebp
 00404D7C    mov         ebx,eax
 00404D7E    mov         esi,edx
 00404D80    mov         edi,ecx
 00404D82    mov         edx,dword ptr [edx]
 00404D84    push        edx
 00404D85    test        edx,edx
>00404D87    je          00404D8C
 00404D89    mov         edx,dword ptr [edx-4]
 00404D8C    dec         edi
>00404D8D    jge         00404D91
 00404D8F    xor         edi,edi
 00404D91    cmp         edi,edx
>00404D93    jle         00404D97
 00404D95    mov         edi,edx
 00404D97    mov         ebp,dword ptr [ebx-4]
 00404D9A    mov         eax,esi
 00404D9C    add         edx,ebp
 00404D9E    call        @LStrSetLength
 00404DA3    pop         eax
 00404DA4    cmp         eax,ebx
>00404DA6    jne         00404DAA
 00404DA8    mov         ebx,dword ptr [esi]
 00404DAA    mov         eax,dword ptr [esi]
 00404DAC    lea         edx,[edi+ebp]
 00404DAF    mov         ecx,dword ptr [eax-4]
 00404DB2    sub         ecx,edx
 00404DB4    add         edx,eax
 00404DB6    add         eax,edi
 00404DB8    call        Move
 00404DBD    mov         eax,ebx
 00404DBF    mov         edx,dword ptr [esi]
 00404DC1    mov         ecx,ebp
 00404DC3    add         edx,edi
 00404DC5    call        Move
 00404DCA    pop         ebp
 00404DCB    pop         edi
 00404DCC    pop         esi
 00404DCD    pop         ebx
 00404DCE    ret
*}
end;

//00404DD0
function @LStrPos(const Substr:AnsiString; const S:AnsiString):Integer;
begin
{*
 00404DD0    test        eax,eax
>00404DD2    je          00404E14
 00404DD4    test        edx,edx
>00404DD6    je          00404E09
 00404DD8    push        ebx
 00404DD9    push        esi
 00404DDA    push        edi
 00404DDB    mov         esi,eax
 00404DDD    mov         edi,edx
 00404DDF    mov         ecx,dword ptr [edi-4]
 00404DE2    push        edi
 00404DE3    mov         edx,dword ptr [esi-4]
 00404DE6    dec         edx
>00404DE7    js          00404E04
 00404DE9    mov         al,byte ptr [esi]
 00404DEB    inc         esi
 00404DEC    sub         ecx,edx
>00404DEE    jle         00404E04
 00404DF0    repne scas  byte ptr [edi]
>00404DF2    jne         00404E04
 00404DF4    mov         ebx,ecx
 00404DF6    push        esi
 00404DF7    push        edi
 00404DF8    mov         ecx,edx
 00404DFA    repe cmps   byte ptr [esi],byte ptr [edi]
 00404DFC    pop         edi
 00404DFD    pop         esi
>00404DFE    je          00404E0C
 00404E00    mov         ecx,ebx
>00404E02    jmp         00404DF0
 00404E04    pop         edx
 00404E05    xor         eax,eax
>00404E07    jmp         00404E11
 00404E09    xor         eax,eax
 00404E0B    ret
 00404E0C    pop         edx
 00404E0D    mov         eax,edi
 00404E0F    sub         eax,edx
 00404E11    pop         edi
 00404E12    pop         esi
 00404E13    pop         ebx
 00404E14    ret
*}
end;

//00404E18
procedure @LStrSetLength(var S:AnsiString; NewLen:Integer);
begin
{*
 00404E18    push        ebx
 00404E19    push        esi
 00404E1A    push        edi
 00404E1B    mov         ebx,eax
 00404E1D    mov         esi,edx
 00404E1F    xor         edi,edi
 00404E21    test        edx,edx
>00404E23    jle         00404E6D
 00404E25    mov         eax,dword ptr [ebx]
 00404E27    test        eax,eax
>00404E29    je          00404E4E
 00404E2B    cmp         dword ptr [eax-8],1
>00404E2F    jne         00404E4E
 00404E31    sub         eax,8
 00404E34    add         edx,9
 00404E37    push        eax
 00404E38    mov         eax,esp
 00404E3A    call        @ReallocMem
 00404E3F    pop         eax
 00404E40    add         eax,8
 00404E43    mov         dword ptr [ebx],eax
 00404E45    mov         dword ptr [eax-4],esi
 00404E48    mov         byte ptr [esi+eax],0
>00404E4C    jmp         00404E76
 00404E4E    mov         eax,edx
 00404E50    call        @NewAnsiString
 00404E55    mov         edi,eax
 00404E57    mov         eax,dword ptr [ebx]
 00404E59    test        eax,eax
>00404E5B    je          00404E6D
 00404E5D    mov         edx,edi
 00404E5F    mov         ecx,dword ptr [eax-4]
 00404E62    cmp         ecx,esi
>00404E64    jl          00404E68
 00404E66    mov         ecx,esi
 00404E68    call        Move
 00404E6D    mov         eax,ebx
 00404E6F    call        @LStrClr
 00404E74    mov         dword ptr [ebx],edi
 00404E76    pop         edi
 00404E77    pop         esi
 00404E78    pop         ebx
 00404E79    ret
*}
end;

//00404E7C
procedure @LStrOfChar(C:Char; Count:Integer; var Result:AnsiString);
begin
{*
 00404E7C    push        ebx
 00404E7D    push        esi
 00404E7E    push        edi
 00404E7F    mov         ebx,eax
 00404E81    mov         esi,edx
 00404E83    mov         edi,ecx
 00404E85    mov         eax,ecx
 00404E87    call        @LStrClr
 00404E8C    test        esi,esi
>00404E8E    jle         00404EA2
 00404E90    mov         eax,esi
 00404E92    call        @NewAnsiString
 00404E97    mov         dword ptr [edi],eax
 00404E99    mov         edx,esi
 00404E9B    mov         cl,bl
 00404E9D    call        @FillChar
 00404EA2    pop         edi
 00404EA3    pop         esi
 00404EA4    pop         ebx
 00404EA5    ret
*}
end;

//00404EA8
procedure @Write0Bool(var T:TTextRec; Val:Boolean);
begin
{*
 00404EA8    xor         ecx,ecx
 00404EAA    call        @WriteBool
 00404EAF    ret
*}
end;

//00404EB0
procedure @WriteBool(var T:TTextRec; Val:Boolean; Width:Longint);
begin
{*
 00404EB0    push        ebx
 00404EB1    mov         ebx,edx
 00404EB3    mov         edx,ecx
 00404EB5    xor         ecx,ecx
 00404EB7    test        ebx,ebx
>00404EB9    je          00404EC0
 00404EBB    mov         ecx,dword ptr [ebx-4]
 00404EBE    sub         edx,ecx
 00404EC0    push        ecx
 00404EC1    call        @WriteSpaces
 00404EC6    pop         ecx
 00404EC7    mov         edx,ebx
 00404EC9    pop         ebx
>00404ECA    jmp         @WriteBytes
*}
end;

//00404ED0
procedure WStrError;
begin
{*
 00404ED0    mov         al,1
>00404ED2    jmp         Error
 00404ED7    ret
*}
end;

//00404ED8
function @NewWideString(CharLength:Integer):Pointer;
begin
{*
 00404ED8    test        eax,eax
>00404EDA    je          00404EEC
 00404EDC    push        eax
 00404EDD    push        0
 00404EDF    call        oleaut32.SysAllocStringLen
 00404EE4    test        eax,eax
>00404EE6    je          00404ED0
 00404EEC    ret
*}
end;

//00404EF0
procedure WStrSet(var S:WideString; P:PWideChar);
begin
{*
 00404EF0    xchg        edx,dword ptr [eax]
 00404EF2    test        edx,edx
>00404EF4    je          00404EFC
 00404EF6    push        edx
 00404EF7    call        oleaut32.SysFreeString
 00404EFC    ret
*}
end;

//00404F00
procedure @WStrClr(var S:WideString);
begin
{*
 00404F00    mov         edx,dword ptr [eax]
 00404F02    test        edx,edx
>00404F04    je          00404F14
 00404F06    mov         dword ptr [eax],0
 00404F0C    push        eax
 00404F0D    push        edx
 00404F0E    call        oleaut32.SysFreeString
 00404F13    pop         eax
 00404F14    ret
*}
end;

//00404F18
procedure @WStrArrayClr(var StrArray:Pointer; Count:Integer);
begin
{*
 00404F18    push        ebx
 00404F19    push        esi
 00404F1A    mov         ebx,eax
 00404F1C    mov         esi,edx
 00404F1E    mov         eax,dword ptr [ebx]
 00404F20    test        eax,eax
>00404F22    je          00404F30
 00404F24    mov         dword ptr [ebx],0
 00404F2A    push        eax
 00404F2B    call        oleaut32.SysFreeString
 00404F30    add         ebx,4
 00404F33    dec         esi
>00404F34    jne         00404F1E
 00404F36    pop         esi
 00404F37    pop         ebx
 00404F38    ret
*}
end;

//00404F3C
procedure @WStrAsg(var Dest:WideString; Source:WideString);
begin
{*
 00404F3C    test        edx,edx
>00404F3E    je          00404F00
 00404F44    mov         ecx,dword ptr [edx-4]
 00404F47    shr         ecx,1
>00404F49    je          00404F00
 00404F4F    push        ecx
 00404F50    push        edx
 00404F51    push        eax
 00404F52    call        oleaut32.SysReAllocStringLen
 00404F57    test        eax,eax
>00404F59    je          00404ED0
 00404F5F    ret
*}
end;

//00404F60
procedure @WStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer);
begin
{*
 00404F60    push        ebx
 00404F61    push        esi
 00404F62    push        edi
 00404F63    push        ebp
 00404F64    add         esp,0FFFFF004
 00404F6A    push        eax
 00404F6B    add         esp,0FFFFFFFC
 00404F6E    mov         esi,ecx
 00404F70    mov         dword ptr [esp],edx
 00404F73    mov         edi,eax
 00404F75    test        esi,esi
>00404F77    jg          00404F82
 00404F79    mov         eax,edi
 00404F7B    call        @WStrClr
>00404F80    jmp         00404FDF
 00404F82    lea         ebp,[esi+1]
 00404F85    cmp         ebp,7FF
>00404F8B    jge         00404FB5
 00404F8D    push        esi
 00404F8E    lea         eax,[esp+8]
 00404F92    mov         ecx,dword ptr [esp+4]
 00404F96    mov         edx,7FF
 00404F9B    call        WCharFromChar
 00404FA0    mov         ebx,eax
 00404FA2    test        ebx,ebx
>00404FA4    jle         00404FB5
 00404FA6    lea         edx,[esp+4]
 00404FAA    mov         eax,edi
 00404FAC    mov         ecx,ebx
 00404FAE    call        @WStrFromPWCharLen
>00404FB3    jmp         00404FDF
 00404FB5    mov         ebx,ebp
 00404FB7    mov         eax,edi
 00404FB9    mov         edx,ebx
 00404FBB    call        @WStrSetLength
 00404FC0    push        esi
 00404FC1    mov         eax,dword ptr [edi]
 00404FC3    mov         ecx,dword ptr [esp+4]
 00404FC7    mov         edx,ebx
 00404FC9    call        WCharFromChar
 00404FCE    mov         ebx,eax
 00404FD0    test        ebx,ebx
>00404FD2    jge         00404FD6
 00404FD4    xor         ebx,ebx
 00404FD6    mov         eax,edi
 00404FD8    mov         edx,ebx
 00404FDA    call        @WStrSetLength
 00404FDF    add         esp,1004
 00404FE5    pop         ebp
 00404FE6    pop         edi
 00404FE7    pop         esi
 00404FE8    pop         ebx
 00404FE9    ret
*}
end;

//00404FEC
procedure @WStrFromPWCharLen(var Dest:WideString; Source:PWideChar; Length:Integer);
begin
{*
 00404FEC    test        ecx,ecx
>00404FEE    je          00404F00
 00404FF4    push        eax
 00404FF5    push        ecx
 00404FF6    push        edx
 00404FF7    call        oleaut32.SysAllocStringLen
 00404FFC    test        eax,eax
>00404FFE    je          00404ED0
 00405004    pop         edx
 00405005    push        dword ptr [edx]
 00405007    mov         dword ptr [edx],eax
 00405009    call        oleaut32.SysFreeString
 0040500E    ret
*}
end;

//00405010
procedure @WStrFromPWChar(var Dest:WideString; Source:PWideChar);
begin
{*
 00405010    xor         ecx,ecx
 00405012    test        edx,edx
>00405014    je          00405043
 00405016    push        edx
 00405017    cmp         cx,word ptr [edx]
>0040501A    je          0040503C
 0040501C    cmp         cx,word ptr [edx+2]
>00405020    je          00405039
 00405022    cmp         cx,word ptr [edx+4]
>00405026    je          00405036
 00405028    cmp         cx,word ptr [edx+6]
>0040502C    je          00405033
 0040502E    add         edx,8
>00405031    jmp         00405017
 00405033    add         edx,2
 00405036    add         edx,2
 00405039    add         edx,2
 0040503C    mov         ecx,edx
 0040503E    pop         edx
 0040503F    sub         ecx,edx
 00405041    shr         ecx,1
>00405043    jmp         @WStrFromPWCharLen
 00405048    ret
*}
end;

//0040504C
procedure @WStrFromLStr(var Dest:WideString; const Source:AnsiString);
begin
{*
 0040504C    xor         ecx,ecx
 0040504E    test        edx,edx
>00405050    je          00405055
 00405052    mov         ecx,dword ptr [edx-4]
>00405055    jmp         @WStrFromPCharLen
 0040505A    ret
*}
end;

//0040505C
function @WStrToPWChar(S:WideString):PWideChar;
begin
{*
 0040505C    test        eax,eax
>0040505E    je          00405064
 00405060    ret
 00405061    nop
 00405062    add         byte ptr [eax],al
 00405064    mov         eax,405062
 00405069    ret
*}
end;

//0040506C
function @WStrLen(S:WideString):Integer;
begin
{*
 0040506C    test        eax,eax
>0040506E    je          00405075
 00405070    mov         eax,dword ptr [eax-4]
 00405073    shr         eax,1
 00405075    ret
*}
end;

//00405078
{*function @WStrCmp(Left:WideString; Right:WideString):?;
begin
 00405078    push        ebx
 00405079    push        esi
 0040507A    push        edi
 0040507B    mov         esi,eax
 0040507D    mov         edi,edx
 0040507F    cmp         eax,edx
>00405081    je          004050F5
 00405083    test        esi,esi
>00405085    je          004050D8
 00405087    test        edi,edi
>00405089    je          004050DF
 0040508B    mov         eax,dword ptr [esi-4]
 0040508E    mov         edx,dword ptr [edi-4]
 00405091    sub         eax,edx
>00405093    ja          00405097
 00405095    add         edx,eax
 00405097    push        edx
 00405098    shr         edx,2
>0040509B    je          004050C3
 0040509D    mov         ecx,dword ptr [esi]
 0040509F    mov         ebx,dword ptr [edi]
 004050A1    cmp         ecx,ebx
>004050A3    jne         004050E6
 004050A5    dec         edx
>004050A6    je          004050BD
 004050A8    mov         ecx,dword ptr [esi+4]
 004050AB    mov         ebx,dword ptr [edi+4]
 004050AE    cmp         ecx,ebx
>004050B0    jne         004050E6
 004050B2    add         esi,8
 004050B5    add         edi,8
 004050B8    dec         edx
>004050B9    jne         0040509D
>004050BB    jmp         004050C3
 004050BD    add         esi,4
 004050C0    add         edi,4
 004050C3    pop         edx
 004050C4    and         edx,2
>004050C7    je          004050D4
 004050C9    mov         cx,word ptr [esi]
 004050CC    mov         bx,word ptr [edi]
 004050CF    cmp         cx,bx
>004050D2    jne         004050F5
 004050D4    add         eax,eax
>004050D6    jmp         004050F5
 004050D8    mov         edx,dword ptr [edi-4]
 004050DB    sub         eax,edx
>004050DD    jmp         004050F5
 004050DF    mov         eax,dword ptr [esi-4]
 004050E2    sub         eax,edx
>004050E4    jmp         004050F5
 004050E6    pop         edx
 004050E7    cmp         cx,bx
>004050EA    jne         004050F5
 004050EC    shr         ecx,10
 004050EF    shr         ebx,10
 004050F2    cmp         cx,bx
 004050F5    pop         edi
 004050F6    pop         esi
 004050F7    pop         ebx
 004050F8    ret
end;*}

//004050FC
function @WStrCopy(const S:WideString; Index:Integer; Count:Integer):WideString;
begin
{*
 004050FC    push        ebp
 004050FD    mov         ebp,esp
 004050FF    push        ebx
 00405100    push        esi
 00405101    push        edi
 00405102    mov         edi,ecx
 00405104    mov         ebx,edx
 00405106    mov         esi,eax
 00405108    mov         eax,esi
 0040510A    call        @WStrLen
 0040510F    cmp         ebx,1
>00405112    jge         00405118
 00405114    xor         ebx,ebx
>00405116    jmp         0040511F
 00405118    dec         ebx
 00405119    cmp         eax,ebx
>0040511B    jge         0040511F
 0040511D    mov         ebx,eax
 0040511F    test        edi,edi
>00405121    jge         00405127
 00405123    xor         eax,eax
>00405125    jmp         0040512F
 00405127    sub         eax,ebx
 00405129    cmp         edi,eax
>0040512B    jge         0040512F
 0040512D    mov         eax,edi
 0040512F    mov         edx,ebx
 00405131    add         edx,edx
 00405133    add         edx,esi
 00405135    mov         ecx,dword ptr [ebp+8]
 00405138    xchg        eax,ecx
 00405139    call        @WStrFromPWCharLen
 0040513E    pop         edi
 0040513F    pop         esi
 00405140    pop         ebx
 00405141    pop         ebp
 00405142    ret         4
*}
end;

//00405148
procedure @WStrSetLength(var S:WideString; NewLen:Integer);
begin
{*
 00405148    push        ebx
 00405149    push        esi
 0040514A    push        edi
 0040514B    mov         esi,edx
 0040514D    mov         edi,eax
 0040514F    xor         ebx,ebx
 00405151    test        esi,esi
>00405153    jle         0040517C
 00405155    mov         eax,esi
 00405157    call        @NewWideString
 0040515C    mov         ebx,eax
 0040515E    mov         eax,dword ptr [edi]
 00405160    call        @WStrLen
 00405165    test        eax,eax
>00405167    jle         0040517C
 00405169    cmp         esi,eax
>0040516B    jge         0040516F
 0040516D    mov         eax,esi
 0040516F    mov         ecx,eax
 00405171    add         ecx,ecx
 00405173    mov         edx,ebx
 00405175    mov         eax,dword ptr [edi]
 00405177    call        Move
 0040517C    mov         eax,edi
 0040517E    mov         edx,ebx
 00405180    call        WStrSet
 00405185    pop         edi
 00405186    pop         esi
 00405187    pop         ebx
 00405188    ret
*}
end;

//0040518C
procedure @AddRefRecord;
begin
{*
 0040518C    xor         ecx,ecx
 0040518E    push        ebx
 0040518F    mov         cl,byte ptr [edx+1]
 00405192    push        esi
 00405193    push        edi
 00405194    mov         ebx,eax
 00405196    lea         esi,[ecx+edx+0A]
 0040519A    mov         edi,dword ptr [ecx+edx+6]
 0040519E    mov         edx,dword ptr [esi]
 004051A0    mov         eax,dword ptr [esi+4]
 004051A3    add         eax,ebx
 004051A5    mov         edx,dword ptr [edx]
 004051A7    mov         ecx,1
 004051AC    call        @AddRefArray
 004051B1    add         esi,8
 004051B4    dec         edi
>004051B5    jg          0040519E
 004051B7    pop         edi
 004051B8    pop         esi
 004051B9    pop         ebx
 004051BA    ret
*}
end;

//004051BC
procedure @AddRefArray;
begin
{*
 004051BC    test        ecx,ecx
>004051BE    je          0040524E
 004051C4    push        ebx
 004051C5    push        esi
 004051C6    push        edi
 004051C7    mov         ebx,eax
 004051C9    mov         esi,edx
 004051CB    mov         edi,ecx
 004051CD    xor         edx,edx
 004051CF    mov         al,byte ptr [esi]
 004051D1    mov         dl,byte ptr [esi+1]
 004051D4    xor         ecx,ecx
 004051D6    cmp         al,0A
>004051D8    je          004051FC
 004051DA    cmp         al,0B
>004051DC    je          004051FC
 004051DE    cmp         al,0C
>004051E0    je          00405206
 004051E2    cmp         al,0D
>004051E4    je          00405219
 004051E6    cmp         al,0E
>004051E8    je          00405237
 004051EA    cmp         al,0F
>004051EC    je          004051FC
 004051EE    cmp         al,11
>004051F0    je          004051FC
 004051F2    mov         al,2
 004051F4    pop         edi
 004051F5    pop         esi
 004051F6    pop         ebx
>004051F7    jmp         Error
 004051FC    mov         dword ptr [ebx],ecx
 004051FE    add         ebx,4
 00405201    dec         edi
>00405202    jg          004051FC
>00405204    jmp         0040524B
 00405206    mov         dword ptr [ebx],ecx
 00405208    mov         dword ptr [ebx+4],ecx
 0040520B    mov         dword ptr [ebx+8],ecx
 0040520E    mov         dword ptr [ebx+0C],ecx
 00405211    add         ebx,10
 00405214    dec         edi
>00405215    jg          00405206
>00405217    jmp         0040524B
 00405219    push        ebp
 0040521A    mov         ebp,edx
 0040521C    mov         edx,dword ptr [esi+ebp+0A]
 00405220    mov         eax,ebx
 00405222    add         ebx,dword ptr [esi+ebp+2]
 00405226    mov         ecx,dword ptr [esi+ebp+6]
 0040522A    mov         edx,dword ptr [edx]
 0040522C    call        @AddRefArray
 00405231    dec         edi
>00405232    jg          0040521C
 00405234    pop         ebp
>00405235    jmp         0040524B
 00405237    push        ebp
 00405238    mov         ebp,edx
 0040523A    mov         eax,ebx
 0040523C    add         ebx,dword ptr [esi+ebp+2]
 00405240    mov         edx,esi
 00405242    call        @AddRefRecord
 00405247    dec         edi
>00405248    jg          0040523A
 0040524A    pop         ebp
 0040524B    pop         edi
 0040524C    pop         esi
 0040524D    pop         ebx
 0040524E    ret
*}
end;

//00405250
procedure @AddRef;
begin
{*
 00405250    mov         ecx,1
>00405255    jmp         @AddRefArray
 0040525A    ret
*}
end;

//0040525C
procedure @FinalizeRecord(P:Pointer; typeInfo:Pointer);
begin
{*
 0040525C    xor         ecx,ecx
 0040525E    push        ebx
 0040525F    mov         cl,byte ptr [edx+1]
 00405262    push        esi
 00405263    push        edi
 00405264    mov         ebx,eax
 00405266    lea         esi,[ecx+edx+0A]
 0040526A    mov         edi,dword ptr [ecx+edx+6]
 0040526E    mov         edx,dword ptr [esi]
 00405270    mov         eax,dword ptr [esi+4]
 00405273    add         eax,ebx
 00405275    mov         edx,dword ptr [edx]
 00405277    mov         ecx,1
 0040527C    call        @FinalizeArray
 00405281    add         esi,8
 00405284    dec         edi
>00405285    jg          0040526E
 00405287    mov         eax,ebx
 00405289    pop         edi
 0040528A    pop         esi
 0040528B    pop         ebx
 0040528C    ret
*}
end;

//00405290
procedure @VarClr(var v:TVarData);
begin
{*
 00405290    cmp         dword ptr ds:[5AC010],0;gvar_005AC010
>00405297    je          004052A0
 00405299    call        dword ptr ds:[5AC010]
 0040529F    ret
 004052A0    mov         al,10
 004052A2    call        Error
 004052A7    ret
*}
end;

//004052A8
procedure @FinalizeArray(p:Pointer; typeInfo:Pointer; elemCount:Cardinal);
begin
{*
 004052A8    cmp         ecx,0
>004052AB    je          00405391
 004052B1    push        eax
 004052B2    push        ebx
 004052B3    push        esi
 004052B4    push        edi
 004052B5    mov         ebx,eax
 004052B7    mov         esi,edx
 004052B9    mov         edi,ecx
 004052BB    xor         edx,edx
 004052BD    mov         al,byte ptr [esi]
 004052BF    mov         dl,byte ptr [esi+1]
 004052C2    cmp         al,0A
>004052C4    je          004052EB
 004052C6    cmp         al,0B
>004052C8    je          00405308
 004052CA    cmp         al,0C
>004052CC    je          0040531F
 004052CE    cmp         al,0D
>004052D0    je          0040532E
 004052D2    cmp         al,0E
>004052D4    je          0040534C
 004052D6    cmp         al,0F
>004052D8    je          00405362
 004052DE    cmp         al,11
>004052E0    je          00405371
>004052E6    jmp         00405382
 004052EB    cmp         ecx,1
 004052EE    mov         eax,ebx
>004052F0    jg          004052FC
 004052F2    call        @LStrClr
>004052F7    jmp         0040538D
 004052FC    mov         edx,ecx
 004052FE    call        @LStrArrayClr
>00405303    jmp         0040538D
 00405308    cmp         ecx,1
 0040530B    mov         eax,ebx
>0040530D    jg          00405316
 0040530F    call        @WStrClr
>00405314    jmp         0040538D
 00405316    mov         edx,ecx
 00405318    call        @WStrArrayClr
>0040531D    jmp         0040538D
 0040531F    mov         eax,ebx
 00405321    add         ebx,10
 00405324    call        @VarClr
 00405329    dec         edi
>0040532A    jg          0040531F
>0040532C    jmp         0040538D
 0040532E    push        ebp
 0040532F    mov         ebp,edx
 00405331    mov         edx,dword ptr [esi+ebp+0A]
 00405335    mov         eax,ebx
 00405337    add         ebx,dword ptr [esi+ebp+2]
 0040533B    mov         ecx,dword ptr [esi+ebp+6]
 0040533F    mov         edx,dword ptr [edx]
 00405341    call        @FinalizeArray
 00405346    dec         edi
>00405347    jg          00405331
 00405349    pop         ebp
>0040534A    jmp         0040538D
 0040534C    push        ebp
 0040534D    mov         ebp,edx
 0040534F    mov         eax,ebx
 00405351    add         ebx,dword ptr [esi+ebp+2]
 00405355    mov         edx,esi
 00405357    call        @FinalizeRecord
 0040535C    dec         edi
>0040535D    jg          0040534F
 0040535F    pop         ebp
>00405360    jmp         0040538D
 00405362    mov         eax,ebx
 00405364    add         ebx,4
 00405367    call        @IntfClear
 0040536C    dec         edi
>0040536D    jg          00405362
>0040536F    jmp         0040538D
 00405371    mov         eax,ebx
 00405373    mov         edx,esi
 00405375    add         ebx,4
 00405378    call        @DynArrayClear
 0040537D    dec         edi
>0040537E    jg          00405371
>00405380    jmp         0040538D
 00405382    pop         edi
 00405383    pop         esi
 00405384    pop         ebx
 00405385    pop         eax
 00405386    mov         al,2
>00405388    jmp         Error
 0040538D    pop         edi
 0040538E    pop         esi
 0040538F    pop         ebx
 00405390    pop         eax
 00405391    ret
*}
end;

//00405394
procedure @Finalize(p:Pointer; typeInfo:Pointer);
begin
{*
 00405394    mov         ecx,1
>00405399    jmp         @FinalizeArray
 0040539E    ret
*}
end;

//004053A0
procedure @VarAddRef(var v:TVarData);
begin
{*
 004053A0    cmp         dword ptr ds:[5AC018],0;gvar_005AC018
>004053A7    je          004053B0
 004053A9    call        dword ptr ds:[5AC018]
 004053AF    ret
 004053B0    mov         al,10
 004053B2    call        Error
 004053B7    ret
*}
end;

//004053B8
procedure @CopyRecord(Dest:Pointer; Source:Pointer; TypeInfo:Pointer);
begin
{*
 004053B8    push        ebx
 004053B9    push        esi
 004053BA    push        edi
 004053BB    push        ebp
 004053BC    mov         ebx,eax
 004053BE    mov         esi,edx
 004053C0    xor         eax,eax
 004053C2    mov         al,byte ptr [ecx+1]
 004053C5    lea         edi,[eax+ecx+0A]
 004053C9    mov         ebp,dword ptr [edi-4]
 004053CC    xor         eax,eax
 004053CE    mov         ecx,dword ptr [edi-8]
 004053D1    push        ecx
 004053D2    mov         ecx,dword ptr [edi+4]
 004053D5    sub         ecx,eax
>004053D7    jle         004053E4
 004053D9    mov         edx,eax
 004053DB    add         eax,esi
 004053DD    add         edx,ebx
 004053DF    call        Move
 004053E4    mov         eax,dword ptr [edi+4]
 004053E7    mov         edx,dword ptr [edi]
 004053E9    mov         edx,dword ptr [edx]
 004053EB    mov         cl,byte ptr [edx]
 004053ED    cmp         cl,0A
>004053F0    je          00405423
 004053F2    cmp         cl,0B
>004053F5    je          00405434
 004053F7    cmp         cl,0C
>004053FA    je          00405445
 004053FC    cmp         cl,0D
>004053FF    je          00405456
 00405401    cmp         cl,0E
>00405404    je          00405476
 00405406    cmp         cl,0F
>00405409    je          0040548F
 0040540F    cmp         cl,11
>00405412    je          004054A0
 00405418    mov         al,2
 0040541A    pop         ebp
 0040541B    pop         edi
 0040541C    pop         esi
 0040541D    pop         ebx
>0040541E    jmp         Error
 00405423    mov         edx,dword ptr [eax+esi]
 00405426    add         eax,ebx
 00405428    call        @LStrAsg
 0040542D    mov         eax,4
>00405432    jmp         004054B1
 00405434    mov         edx,dword ptr [eax+esi]
 00405437    add         eax,ebx
 00405439    call        @WStrAsg
 0040543E    mov         eax,4
>00405443    jmp         004054B1
 00405445    lea         edx,[eax+esi]
 00405448    add         eax,ebx
 0040544A    call        @VarAddRef
 0040544F    mov         eax,10
>00405454    jmp         004054B1
 00405456    xor         ecx,ecx
 00405458    mov         cl,byte ptr [edx+1]
 0040545B    push        dword ptr [ecx+edx+2]
 0040545F    push        dword ptr [ecx+edx+6]
 00405463    mov         ecx,dword ptr [ecx+edx+0A]
 00405467    mov         ecx,dword ptr [ecx]
 00405469    lea         edx,[eax+esi]
 0040546C    add         eax,ebx
 0040546E    call        @CopyArray
 00405473    pop         eax
>00405474    jmp         004054B1
 00405476    xor         ecx,ecx
 00405478    mov         cl,byte ptr [edx+1]
 0040547B    mov         ecx,dword ptr [ecx+edx+2]
 0040547F    push        ecx
 00405480    mov         ecx,edx
 00405482    lea         edx,[eax+esi]
 00405485    add         eax,ebx
 00405487    call        @CopyRecord
 0040548C    pop         eax
>0040548D    jmp         004054B1
 0040548F    mov         edx,dword ptr [eax+esi]
 00405492    add         eax,ebx
 00405494    call        @IntfCopy
 00405499    mov         eax,4
>0040549E    jmp         004054B1
 004054A0    mov         ecx,edx
 004054A2    mov         edx,dword ptr [eax+esi]
 004054A5    add         eax,ebx
 004054A7    call        @DynArrayAsg
 004054AC    mov         eax,4
 004054B1    add         eax,dword ptr [edi+4]
 004054B4    add         edi,8
 004054B7    dec         ebp
>004054B8    jne         004053D2
 004054BE    pop         ecx
 004054BF    sub         ecx,eax
>004054C1    jle         004054CD
 004054C3    lea         edx,[eax+ebx]
 004054C6    add         eax,esi
 004054C8    call        Move
 004054CD    pop         ebp
 004054CE    pop         edi
 004054CF    pop         esi
 004054D0    pop         ebx
 004054D1    ret
*}
end;

//004054D4
procedure @CopyArray(Dest:Pointer; Source:Pointer; TypeInfo:Pointer; Cnt:Integer);
begin
{*
 004054D4    push        ebx
 004054D5    push        esi
 004054D6    push        edi
 004054D7    push        ebp
 004054D8    mov         ebx,eax
 004054DA    mov         esi,edx
 004054DC    mov         edi,ecx
 004054DE    mov         ebp,dword ptr [esp+14]
 004054E2    mov         cl,byte ptr [edi]
 004054E4    cmp         cl,0A
>004054E7    je          0040551A
 004054E9    cmp         cl,0B
>004054EC    je          00405531
 004054EE    cmp         cl,0C
>004054F1    je          00405545
 004054F3    cmp         cl,0D
>004054F6    je          00405559
 004054F8    cmp         cl,0E
>004054FB    je          0040557A
 004054FD    cmp         cl,0F
>00405500    je          00405597
 00405506    cmp         cl,11
>00405509    je          004055AB
 0040550F    mov         al,2
 00405511    pop         ebp
 00405512    pop         edi
 00405513    pop         esi
 00405514    pop         ebx
>00405515    jmp         Error
 0040551A    mov         eax,ebx
 0040551C    mov         edx,dword ptr [esi]
 0040551E    call        @LStrAsg
 00405523    add         ebx,4
 00405526    add         esi,4
 00405529    dec         ebp
>0040552A    jne         0040551A
>0040552C    jmp         004055BF
 00405531    mov         eax,ebx
 00405533    mov         edx,dword ptr [esi]
 00405535    call        @WStrAsg
 0040553A    add         ebx,4
 0040553D    add         esi,4
 00405540    dec         ebp
>00405541    jne         00405531
>00405543    jmp         004055BF
 00405545    mov         eax,ebx
 00405547    mov         edx,esi
 00405549    call        @VarAddRef
 0040554E    add         ebx,10
 00405551    add         esi,10
 00405554    dec         ebp
>00405555    jne         00405545
>00405557    jmp         004055BF
 00405559    xor         ecx,ecx
 0040555B    mov         cl,byte ptr [edi+1]
 0040555E    lea         edi,[ecx+edi+2]
 00405562    mov         eax,ebx
 00405564    mov         edx,esi
 00405566    mov         ecx,dword ptr [edi+8]
 00405569    push        dword ptr [edi+4]
 0040556C    call        @CopyArray
 00405571    add         ebx,dword ptr [edi]
 00405573    add         esi,dword ptr [edi]
 00405575    dec         ebp
>00405576    jne         00405562
>00405578    jmp         004055BF
 0040557A    mov         eax,ebx
 0040557C    mov         edx,esi
 0040557E    mov         ecx,edi
 00405580    call        @CopyRecord
 00405585    xor         eax,eax
 00405587    mov         al,byte ptr [edi+1]
 0040558A    add         ebx,dword ptr [eax+edi+2]
 0040558E    add         esi,dword ptr [eax+edi+2]
 00405592    dec         ebp
>00405593    jne         0040557A
>00405595    jmp         004055BF
 00405597    mov         eax,ebx
 00405599    mov         edx,dword ptr [esi]
 0040559B    call        @IntfCopy
 004055A0    add         ebx,4
 004055A3    add         esi,4
 004055A6    dec         ebp
>004055A7    jne         00405597
>004055A9    jmp         004055BF
 004055AB    mov         eax,ebx
 004055AD    mov         edx,dword ptr [esi]
 004055AF    mov         ecx,edi
 004055B1    call        @DynArrayAsg
 004055B6    add         ebx,4
 004055B9    add         esi,4
 004055BC    dec         ebp
>004055BD    jne         004055AB
 004055BF    pop         ebp
 004055C0    pop         edi
 004055C1    pop         esi
 004055C2    pop         ebx
 004055C3    ret         4
*}
end;

//004055C8
function @New(size:Integer; typeInfo:Pointer):Pointer;
begin
{*
 004055C8    push        edx
 004055C9    call        @GetMem
 004055CE    pop         edx
 004055CF    test        eax,eax
>004055D1    je          004055DA
 004055D3    push        eax
 004055D4    call        @AddRef
 004055D9    pop         eax
 004055DA    ret
*}
end;

//004055DC
procedure @Dispose(p:Pointer; typeInfo:Pointer);
begin
{*
 004055DC    push        eax
 004055DD    call        @Finalize
 004055E2    pop         eax
 004055E3    call        @FreeMem
 004055E8    ret
*}
end;

//004055EC
procedure @DispCallByIDError;
begin
{*
 004055EC    mov         al,11
>004055EE    jmp         Error
 004055F3    ret
*}
end;

//004055F4
procedure @_llmul;
begin
{*
 004055F4    push        edx
 004055F5    push        eax
 004055F6    mov         eax,dword ptr [esp+10]
 004055FA    mul         eax,dword ptr [esp]
 004055FD    mov         ecx,eax
 004055FF    mov         eax,dword ptr [esp+4]
 00405603    mul         eax,dword ptr [esp+0C]
 00405607    add         ecx,eax
 00405609    mov         eax,dword ptr [esp]
 0040560C    mul         eax,dword ptr [esp+0C]
 00405610    add         edx,ecx
 00405612    pop         ecx
 00405613    pop         ecx
 00405614    ret         8
*}
end;

//00405618
function @ValInt64(const s:AnsiString; var code:Integer):Int64;
begin
{*
 00405618    push        ebx
 00405619    push        esi
 0040561A    push        edi
 0040561B    push        ebp
 0040561C    add         esp,0FFFFFFEC
 0040561F    mov         dword ptr [esp],edx
 00405622    mov         esi,eax
 00405624    mov         ebp,1
 00405629    xor         edi,edi
 0040562B    mov         dword ptr [esp+8],0
 00405633    mov         dword ptr [esp+0C],0
 0040563B    test        esi,esi
>0040563D    jne         0040564A
 0040563F    mov         eax,dword ptr [esp]
 00405642    mov         dword ptr [eax],ebp
>00405644    jmp         00405837
 00405649    inc         ebp
 0040564A    cmp         byte ptr [esi+ebp-1],20
>0040564F    je          00405649
 00405651    mov         byte ptr [esp+10],0
 00405656    mov         al,byte ptr [esi+ebp-1]
 0040565A    cmp         al,2D
>0040565C    jne         00405666
 0040565E    mov         byte ptr [esp+10],1
 00405663    inc         ebp
>00405664    jmp         0040566B
 00405666    cmp         al,2B
>00405668    jne         0040566B
 0040566A    inc         ebp
 0040566B    mov         bl,1
 0040566D    cmp         byte ptr [esi+ebp-1],24
>00405672    je          0040569C
 00405674    mov         al,byte ptr [esi+ebp-1]
 00405678    call        UpCase
 0040567D    cmp         al,58
>0040567F    je          0040569C
 00405681    cmp         byte ptr [esi+ebp-1],30
>00405686    jne         00405766
 0040568C    mov         al,byte ptr [esi+ebp]
 0040568F    call        UpCase
 00405694    cmp         al,58
>00405696    jne         00405766
 0040569C    cmp         byte ptr [esi+ebp-1],30
>004056A1    jne         004056A4
 004056A3    inc         ebp
 004056A4    inc         ebp
 004056A5    mov         al,byte ptr [esi+ebp-1]
 004056A9    mov         edx,eax
 004056AB    add         dl,0D0
 004056AE    sub         dl,0A
>004056B1    jb          004056C5
 004056B3    add         dl,0F9
 004056B6    sub         dl,6
>004056B9    jb          004056D2
 004056BB    add         dl,0E6
 004056BE    sub         dl,6
>004056C1    jb          004056DF
>004056C3    jmp         0040573F
 004056C5    mov         edi,eax
 004056C7    and         edi,0FF
 004056CD    sub         edi,30
>004056D0    jmp         004056EA
 004056D2    mov         edi,eax
 004056D4    and         edi,0FF
 004056DA    sub         edi,37
>004056DD    jmp         004056EA
 004056DF    mov         edi,eax
 004056E1    and         edi,0FF
 004056E7    sub         edi,57
 004056EA    cmp         dword ptr [esp+0C],0
>004056EF    jne         004056FA
 004056F1    cmp         dword ptr [esp+8],0
>004056F6    jb          0040573F
>004056F8    jmp         004056FC
>004056FA    jl          0040573F
 004056FC    cmp         dword ptr [esp+0C],0FFFFFFF
>00405704    jne         0040570F
 00405706    cmp         dword ptr [esp+8],0FFFFFFFF
>0040570B    jbe         00405711
>0040570D    jmp         0040573F
>0040570F    jg          0040573F
 00405711    mov         eax,edi
 00405713    cdq
 00405714    push        edx
 00405715    push        eax
 00405716    mov         eax,dword ptr [esp+10]
 0040571A    mov         edx,dword ptr [esp+14]
 0040571E    shld        edx,eax,4
 00405722    shl         eax,4
 00405725    add         eax,dword ptr [esp]
 00405728    adc         edx,dword ptr [esp+4]
 0040572C    add         esp,8
 0040572F    mov         dword ptr [esp+8],eax
 00405733    mov         dword ptr [esp+0C],edx
 00405737    inc         ebp
 00405738    xor         ebx,ebx
>0040573A    jmp         004056A5
 0040573F    cmp         byte ptr [esp+10],0
>00405744    je          0040581D
 0040574A    mov         eax,dword ptr [esp+8]
 0040574E    mov         edx,dword ptr [esp+0C]
 00405752    neg         eax
 00405754    adc         edx,0
 00405757    neg         edx
 00405759    mov         dword ptr [esp+8],eax
 0040575D    mov         dword ptr [esp+0C],edx
>00405761    jmp         0040581D
 00405766    mov         al,byte ptr [esi+ebp-1]
 0040576A    mov         edx,eax
 0040576C    add         dl,0D0
 0040576F    sub         dl,0A
>00405772    jae         004057D6
 00405774    mov         edi,eax
 00405776    and         edi,0FF
 0040577C    sub         edi,30
 0040577F    cmp         dword ptr [esp+0C],0
>00405784    jne         0040578F
 00405786    cmp         dword ptr [esp+8],0
>0040578B    jb          004057D6
>0040578D    jmp         00405791
>0040578F    jl          004057D6
 00405791    cmp         dword ptr [esp+0C],0CCCCCCC
>00405799    jne         004057A7
 0040579B    cmp         dword ptr [esp+8],0CCCCCCCC
>004057A3    jbe         004057A9
>004057A5    jmp         004057D6
>004057A7    jg          004057D6
 004057A9    push        0
 004057AB    push        0A
 004057AD    mov         eax,dword ptr [esp+10]
 004057B1    mov         edx,dword ptr [esp+14]
 004057B5    call        @_llmul
 004057BA    push        edx
 004057BB    push        eax
 004057BC    mov         eax,edi
 004057BE    cdq
 004057BF    add         eax,dword ptr [esp]
 004057C2    adc         edx,dword ptr [esp+4]
 004057C6    add         esp,8
 004057C9    mov         dword ptr [esp+8],eax
 004057CD    mov         dword ptr [esp+0C],edx
 004057D1    inc         ebp
 004057D2    xor         ebx,ebx
>004057D4    jmp         00405766
 004057D6    cmp         byte ptr [esp+10],0
>004057DB    je          004057F4
 004057DD    mov         eax,dword ptr [esp+8]
 004057E1    mov         edx,dword ptr [esp+0C]
 004057E5    neg         eax
 004057E7    adc         edx,0
 004057EA    neg         edx
 004057EC    mov         dword ptr [esp+8],eax
 004057F0    mov         dword ptr [esp+0C],edx
 004057F4    cmp         dword ptr [esp+0C],0
>004057F9    jne         00405800
 004057FB    cmp         dword ptr [esp+8],0
>00405800    je          0040581D
 00405802    cmp         dword ptr [esp+0C],0
>00405807    jne         00405813
 00405809    cmp         dword ptr [esp+8],0
 0040580E    setb        al
>00405811    jmp         00405816
 00405813    setl        al
 00405816    cmp         al,byte ptr [esp+10]
>0040581A    je          0040581D
 0040581C    dec         ebp
 0040581D    cmp         byte ptr [esi+ebp-1],0
 00405822    setne       al
 00405825    or          bl,al
>00405827    je          00405830
 00405829    mov         eax,dword ptr [esp]
 0040582C    mov         dword ptr [eax],ebp
>0040582E    jmp         00405837
 00405830    mov         eax,dword ptr [esp]
 00405833    xor         edx,edx
 00405835    mov         dword ptr [eax],edx
 00405837    mov         eax,dword ptr [esp+8]
 0040583B    mov         edx,dword ptr [esp+0C]
 0040583F    add         esp,14
 00405842    pop         ebp
 00405843    pop         edi
 00405844    pop         esi
 00405845    pop         ebx
 00405846    ret
*}
end;

//00405848
function @DynArrayLength(Arr:Pointer):Longint;
begin
{*
 00405848    test        eax,eax
>0040584A    je          0040584F
 0040584C    mov         eax,dword ptr [eax-4]
 0040584F    ret
*}
end;

//00405850
function @DynArrayHigh(Arr:Pointer):Longint;
begin
{*
 00405850    call        @DynArrayLength
 00405855    dec         eax
 00405856    ret
*}
end;

//00405858
procedure CopyArray(dest:Pointer; source:Pointer; typeInfo:Pointer; cnt:Integer);
begin
{*
 00405858    push        ebp
 00405859    mov         ebp,esp
 0040585B    push        dword ptr [ebp+8]
 0040585E    call        @CopyArray
 00405863    pop         ebp
 00405864    ret         4
*}
end;

//00405868
procedure FinalizeArray(p:Pointer; typeInfo:Pointer; cnt:Integer);
begin
{*
>00405868    jmp         @FinalizeArray
 0040586D    ret
*}
end;

//00405870
procedure DynArrayClear(var arr:Pointer; typeInfo:PDynArrayTypeInfo);
begin
{*
 00405870    call        @DynArrayClear
 00405875    ret
*}
end;

//00405878
procedure DynArraySetLength(var arr:Pointer; typeInfo:PDynArrayTypeInfo; dimCnt:Longint; lenVec:PLongint);
begin
{*
 00405878    push        ebp
 00405879    mov         ebp,esp
 0040587B    add         esp,0FFFFFFE0
 0040587E    push        ebx
 0040587F    push        esi
 00405880    push        edi
 00405881    mov         dword ptr [ebp-8],ecx
 00405884    mov         esi,edx
 00405886    mov         dword ptr [ebp-4],eax
 00405889    mov         ebx,dword ptr [ebp-4]
 0040588C    mov         ebx,dword ptr [ebx]
 0040588E    mov         eax,dword ptr [ebp+8]
 00405891    mov         edi,dword ptr [eax]
 00405893    test        edi,edi
>00405895    jg          004058B1
 00405897    test        edi,edi
>00405899    jge         004058A2
 0040589B    mov         al,4
 0040589D    call        Error
 004058A2    mov         eax,dword ptr [ebp-4]
 004058A5    mov         edx,esi
 004058A7    call        DynArrayClear
>004058AC    jmp         004059FB
 004058B1    xor         eax,eax
 004058B3    mov         dword ptr [ebp-10],eax
 004058B6    test        ebx,ebx
>004058B8    je          004058C5
 004058BA    sub         ebx,4
 004058BD    mov         eax,dword ptr [ebx]
 004058BF    mov         dword ptr [ebp-10],eax
 004058C2    sub         ebx,4
 004058C5    xor         eax,eax
 004058C7    mov         al,byte ptr [esi+1]
 004058CA    add         esi,eax
 004058CC    mov         eax,esi
 004058CE    mov         edx,dword ptr [eax+2]
 004058D1    mov         dword ptr [ebp-18],edx
 004058D4    mov         edx,dword ptr [eax+6]
 004058D7    test        edx,edx
>004058D9    je          004058DF
 004058DB    mov         esi,dword ptr [edx]
>004058DD    jmp         004058E1
 004058DF    xor         esi,esi
 004058E1    mov         eax,edi
 004058E3    imul        dword ptr [ebp-18]
 004058E6    mov         dword ptr [ebp-1C],eax
 004058E9    mov         eax,dword ptr [ebp-1C]
 004058EC    cdq
 004058ED    idiv        eax,edi
 004058EF    cmp         eax,dword ptr [ebp-18]
>004058F2    je          004058FB
 004058F4    mov         al,4
 004058F6    call        Error
 004058FB    add         dword ptr [ebp-1C],8
 004058FF    test        ebx,ebx
>00405901    je          00405908
 00405903    cmp         dword ptr [ebx],1
>00405906    jne         0040593D
 00405908    mov         dword ptr [ebp-20],ebx
 0040590B    cmp         edi,dword ptr [ebp-10]
>0040590E    jge         0040592D
 00405910    test        esi,esi
>00405912    je          0040592D
 00405914    mov         eax,ebx
 00405916    add         eax,8
 00405919    mov         edx,edi
 0040591B    imul        edx,dword ptr [ebp-18]
 0040591F    add         eax,edx
 00405921    mov         ecx,dword ptr [ebp-10]
 00405924    sub         ecx,edi
 00405926    mov         edx,esi
 00405928    call        FinalizeArray
 0040592D    lea         eax,[ebp-20]
 00405930    mov         edx,dword ptr [ebp-1C]
 00405933    call        @ReallocMem
 00405938    mov         ebx,dword ptr [ebp-20]
>0040593B    jmp         0040599B
 0040593D    dec         dword ptr [ebx]
 0040593F    mov         eax,dword ptr [ebp-1C]
 00405942    call        @GetMem
 00405947    mov         ebx,eax
 00405949    mov         eax,dword ptr [ebp-10]
 0040594C    mov         dword ptr [ebp-14],eax
 0040594F    cmp         edi,dword ptr [ebp-14]
>00405952    jge         00405957
 00405954    mov         dword ptr [ebp-14],edi
 00405957    test        esi,esi
>00405959    je          00405985
 0040595B    mov         edx,dword ptr [ebp-14]
 0040595E    imul        edx,dword ptr [ebp-18]
 00405962    mov         eax,ebx
 00405964    add         eax,8
 00405967    xor         ecx,ecx
 00405969    call        @FillChar
 0040596E    mov         eax,dword ptr [ebp-14]
 00405971    push        eax
 00405972    mov         edx,dword ptr [ebp-4]
 00405975    mov         edx,dword ptr [edx]
 00405977    mov         eax,ebx
 00405979    add         eax,8
 0040597C    mov         ecx,esi
 0040597E    call        CopyArray
>00405983    jmp         0040599B
 00405985    mov         ecx,dword ptr [ebp-14]
 00405988    imul        ecx,dword ptr [ebp-18]
 0040598C    mov         edx,ebx
 0040598E    add         edx,8
 00405991    mov         eax,dword ptr [ebp-4]
 00405994    mov         eax,dword ptr [eax]
 00405996    call        Move
 0040599B    mov         dword ptr [ebx],1
 004059A1    add         ebx,4
 004059A4    mov         dword ptr [ebx],edi
 004059A6    add         ebx,4
 004059A9    mov         edx,edi
 004059AB    sub         edx,dword ptr [ebp-10]
 004059AE    imul        edx,dword ptr [ebp-18]
 004059B2    mov         eax,dword ptr [ebp-18]
 004059B5    imul        eax,dword ptr [ebp-10]
 004059B9    add         eax,ebx
 004059BB    xor         ecx,ecx
 004059BD    call        @FillChar
 004059C2    cmp         dword ptr [ebp-8],1
>004059C6    jle         004059F6
 004059C8    add         dword ptr [ebp+8],4
 004059CC    dec         dword ptr [ebp-8]
 004059CF    dec         edi
 004059D0    test        edi,edi
>004059D2    jl          004059F6
 004059D4    inc         edi
 004059D5    mov         dword ptr [ebp-0C],0
 004059DC    mov         eax,dword ptr [ebp+8]
 004059DF    push        eax
 004059E0    mov         eax,dword ptr [ebp-0C]
 004059E3    lea         eax,[ebx+eax*4]
 004059E6    mov         ecx,dword ptr [ebp-8]
 004059E9    mov         edx,esi
 004059EB    call        DynArraySetLength
 004059F0    inc         dword ptr [ebp-0C]
 004059F3    dec         edi
>004059F4    jne         004059DC
 004059F6    mov         eax,dword ptr [ebp-4]
 004059F9    mov         dword ptr [eax],ebx
 004059FB    pop         edi
 004059FC    pop         esi
 004059FD    pop         ebx
 004059FE    mov         esp,ebp
 00405A00    pop         ebp
 00405A01    ret         4
*}
end;

//00405A04
procedure @DynArraySetLength(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo; DimCnt:Longint; LengthVec:Longint);
begin
{*
 00405A04    push        esp
 00405A05    add         dword ptr [esp],4
 00405A09    call        DynArraySetLength
 00405A0E    ret
*}
end;

//00405A10
procedure @DynArrayClear(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo);
begin
{*
 00405A10    mov         ecx,dword ptr [eax]
 00405A12    test        ecx,ecx
>00405A14    je          00405A49
 00405A16    mov         dword ptr [eax],0
 00405A1C    lock dec    dword ptr [ecx-8]
>00405A20    jne         00405A49
 00405A22    push        eax
 00405A23    mov         eax,ecx
 00405A25    xor         ecx,ecx
 00405A27    mov         cl,byte ptr [edx+1]
 00405A2A    mov         edx,dword ptr [ecx+edx+6]
 00405A2E    test        edx,edx
>00405A30    je          00405A40
 00405A32    mov         ecx,dword ptr [eax-4]
 00405A35    test        ecx,ecx
>00405A37    je          00405A40
 00405A39    mov         edx,dword ptr [edx]
 00405A3B    call        @FinalizeArray
 00405A40    sub         eax,8
 00405A43    call        @FreeMem
 00405A48    pop         eax
 00405A49    ret
*}
end;

//00405A4C
procedure @DynArrayAsg(var Dest:Pointer; Source:Pointer; TypeInfo:PDynArrayTypeInfo);
begin
{*
 00405A4C    push        ebx
 00405A4D    mov         ebx,dword ptr [eax]
 00405A4F    test        edx,edx
>00405A51    je          00405A57
 00405A53    lock inc    dword ptr [edx-8]
 00405A57    test        ebx,ebx
>00405A59    je          00405A6F
 00405A5B    lock dec    dword ptr [ebx-8]
>00405A5F    jne         00405A6F
 00405A61    push        eax
 00405A62    push        edx
 00405A63    mov         edx,ecx
 00405A65    inc         dword ptr [ebx-8]
 00405A68    call        @DynArrayClear
 00405A6D    pop         edx
 00405A6E    pop         eax
 00405A6F    mov         dword ptr [eax],edx
 00405A71    pop         ebx
 00405A72    ret
*}
end;

//00405A74
function FindHInstance(Address:Pointer):Cardinal;
begin
{*
 00405A74    add         esp,0FFFFFFE4
 00405A77    push        1C
 00405A79    lea         edx,[esp+4]
 00405A7D    push        edx
 00405A7E    push        eax
 00405A7F    call        KERNEL32.VirtualQuery
 00405A84    cmp         dword ptr [esp+10],1000
>00405A8C    jne         00405A94
 00405A8E    mov         eax,dword ptr [esp+4]
>00405A92    jmp         00405A96
 00405A94    xor         eax,eax
 00405A96    add         esp,1C
 00405A99    ret
*}
end;

//00405A9C
function FindClassHInstance(ClassType:TClass):Cardinal;
begin
{*
 00405A9C    call        FindHInstance
 00405AA1    ret
*}
end;

//00405AA4
function DelayLoadResourceModule(Module:PLibModule):Cardinal;
begin
{*
 00405AA4    push        ebx
 00405AA5    push        esi
 00405AA6    add         esp,0FFFFFEF8
 00405AAC    mov         ebx,eax
 00405AAE    cmp         dword ptr [ebx+10],0
>00405AB2    jne         00405ADF
 00405AB4    push        105
 00405AB9    lea         eax,[esp+4]
 00405ABD    push        eax
 00405ABE    mov         eax,dword ptr [ebx+4]
 00405AC1    push        eax
 00405AC2    call        KERNEL32.GetModuleFileNameA
 00405AC7    mov         eax,esp
 00405AC9    mov         dl,1
 00405ACB    call        LoadResourceModule
 00405AD0    mov         esi,eax
 00405AD2    mov         dword ptr [ebx+10],esi
 00405AD5    test        esi,esi
>00405AD7    jne         00405ADF
 00405AD9    mov         eax,dword ptr [ebx+4]
 00405ADC    mov         dword ptr [ebx+10],eax
 00405ADF    mov         eax,dword ptr [ebx+10]
 00405AE2    add         esp,108
 00405AE8    pop         esi
 00405AE9    pop         ebx
 00405AEA    ret
*}
end;

//00405AEC
function FindResourceHInstance(Instance:Cardinal):Cardinal;
begin
{*
 00405AEC    mov         edx,dword ptr ds:[5AC03C]
 00405AF2    test        edx,edx
>00405AF4    je          00405B13
 00405AF6    cmp         eax,dword ptr [edx+4]
>00405AF9    je          00405B05
 00405AFB    cmp         eax,dword ptr [edx+8]
>00405AFE    je          00405B05
 00405B00    cmp         eax,dword ptr [edx+0C]
>00405B03    jne         00405B0D
 00405B05    mov         eax,edx
 00405B07    call        DelayLoadResourceModule
 00405B0C    ret
 00405B0D    mov         edx,dword ptr [edx]
 00405B0F    test        edx,edx
>00405B11    jne         00405AF6
 00405B13    ret
*}
end;

//00405B14
function FindBS(Current:PAnsiChar):PAnsiChar;
begin
{*
>00405B14    jmp         00405B1C
 00405B16    push        eax
 00405B17    call        user32.CharNextA
 00405B1C    mov         dl,byte ptr [eax]
 00405B1E    test        dl,dl
>00405B20    je          00405B27
 00405B22    cmp         dl,5C
>00405B25    jne         00405B16
 00405B27    ret
*}
end;

//00405B28
function ToLongPath(AFileName:PAnsiChar; BufSize:Integer):PAnsiChar;
begin
{*
 00405B28    push        ebp
 00405B29    mov         ebp,esp
 00405B2B    add         esp,0FFFFFDB0
 00405B31    push        ebx
 00405B32    push        esi
 00405B33    push        edi
 00405B34    mov         dword ptr [ebp-8],edx
 00405B37    mov         dword ptr [ebp-4],eax
 00405B3A    mov         eax,dword ptr [ebp-4]
 00405B3D    mov         dword ptr [ebp-0C],eax
 00405B40    push        405CBC
 00405B45    call        KERNEL32.GetModuleHandleA
 00405B4A    mov         esi,eax
 00405B4C    test        esi,esi
>00405B4E    je          00405B90
 00405B50    push        405CCC
 00405B55    push        esi
 00405B56    call        KERNEL32.GetProcAddress
 00405B5B    mov         ebx,eax
 00405B5D    test        ebx,ebx
>00405B5F    je          00405B90
 00405B61    push        105
 00405B66    lea         eax,[ebp-24F]
 00405B6C    push        eax
 00405B6D    mov         eax,dword ptr [ebp-4]
 00405B70    push        eax
 00405B71    call        ebx
 00405B73    test        eax,eax
>00405B75    je          00405B90
 00405B77    mov         eax,dword ptr [ebp-8]
 00405B7A    push        eax
 00405B7B    lea         eax,[ebp-24F]
 00405B81    push        eax
 00405B82    mov         eax,dword ptr [ebp-4]
 00405B85    push        eax
 00405B86    call        KERNEL32.lstrcpynA
>00405B8B    jmp         00405CB2
 00405B90    mov         eax,dword ptr [ebp-4]
 00405B93    cmp         byte ptr [eax],5C
>00405B96    jne         00405BD0
 00405B98    mov         eax,dword ptr [ebp-4]
 00405B9B    cmp         byte ptr [eax+1],5C
>00405B9F    jne         00405CB2
 00405BA5    mov         eax,dword ptr [ebp-4]
 00405BA8    add         eax,2
 00405BAB    call        FindBS
 00405BB0    mov         esi,eax
 00405BB2    cmp         byte ptr [esi],0
>00405BB5    je          00405CB2
 00405BBB    lea         eax,[esi+1]
 00405BBE    call        FindBS
 00405BC3    mov         esi,eax
 00405BC5    cmp         byte ptr [esi],0
>00405BC8    je          00405CB2
>00405BCE    jmp         00405BD6
 00405BD0    mov         esi,dword ptr [ebp-4]
 00405BD3    add         esi,2
 00405BD6    mov         ebx,esi
 00405BD8    sub         ebx,dword ptr [ebp-4]
 00405BDB    lea         eax,[ebx+1]
 00405BDE    push        eax
 00405BDF    mov         eax,dword ptr [ebp-4]
 00405BE2    push        eax
 00405BE3    lea         eax,[ebp-24F]
 00405BE9    push        eax
 00405BEA    call        KERNEL32.lstrcpynA
>00405BEF    jmp         00405C95
 00405BF4    lea         eax,[esi+1]
 00405BF7    call        FindBS
 00405BFC    mov         edi,eax
 00405BFE    mov         eax,edi
 00405C00    sub         eax,esi
 00405C02    mov         edx,eax
 00405C04    add         edx,ebx
 00405C06    inc         edx
 00405C07    cmp         edx,105
>00405C0D    jg          00405CB2
 00405C13    inc         eax
 00405C14    push        eax
 00405C15    push        esi
 00405C16    lea         eax,[ebp-24F]
 00405C1C    add         eax,ebx
 00405C1E    push        eax
 00405C1F    call        KERNEL32.lstrcpynA
 00405C24    lea         eax,[ebp-14A]
 00405C2A    push        eax
 00405C2B    lea         eax,[ebp-24F]
 00405C31    push        eax
 00405C32    call        KERNEL32.FindFirstFileA
 00405C37    mov         esi,eax
 00405C39    cmp         esi,0FFFFFFFF
>00405C3C    je          00405CB2
 00405C3E    push        esi
 00405C3F    call        KERNEL32.FindClose
 00405C44    lea         eax,[ebp-11E]
 00405C4A    push        eax
 00405C4B    call        KERNEL32.lstrlenA
 00405C50    lea         edx,[ebx+1]
 00405C53    add         eax,edx
 00405C55    inc         eax
 00405C56    cmp         eax,105
>00405C5B    jg          00405CB2
 00405C5D    mov         byte ptr [ebp+ebx-24F],5C
 00405C65    mov         eax,105
 00405C6A    sub         eax,ebx
 00405C6C    dec         eax
 00405C6D    push        eax
 00405C6E    lea         eax,[ebp-11E]
 00405C74    push        eax
 00405C75    lea         eax,[ebp-24F]
 00405C7B    add         eax,ebx
 00405C7D    inc         eax
 00405C7E    push        eax
 00405C7F    call        KERNEL32.lstrcpynA
 00405C84    lea         eax,[ebp-11E]
 00405C8A    push        eax
 00405C8B    call        KERNEL32.lstrlenA
 00405C90    inc         eax
 00405C91    add         ebx,eax
 00405C93    mov         esi,edi
 00405C95    cmp         byte ptr [esi],0
>00405C98    jne         00405BF4
 00405C9E    mov         eax,dword ptr [ebp-8]
 00405CA1    push        eax
 00405CA2    lea         eax,[ebp-24F]
 00405CA8    push        eax
 00405CA9    mov         eax,dword ptr [ebp-4]
 00405CAC    push        eax
 00405CAD    call        KERNEL32.lstrcpynA
 00405CB2    mov         eax,dword ptr [ebp-0C]
 00405CB5    pop         edi
 00405CB6    pop         esi
 00405CB7    pop         ebx
 00405CB8    mov         esp,ebp
 00405CBA    pop         ebp
 00405CBB    ret
*}
end;

//00405CE0
function LoadResourceModule(ModuleName:PAnsiChar; CheckOwner:Boolean):Cardinal;
begin
{*
 00405CE0    push        ebp
 00405CE1    mov         ebp,esp
 00405CE3    add         esp,0FFFFFEE0
 00405CE9    push        ebx
 00405CEA    push        esi
 00405CEB    mov         dword ptr [ebp-4],eax
 00405CEE    push        105
 00405CF3    lea         eax,[ebp-11D]
 00405CF9    push        eax
 00405CFA    push        0
 00405CFC    call        KERNEL32.GetModuleFileNameA
 00405D01    mov         byte ptr [ebp-12],0
 00405D05    lea         eax,[ebp-8]
 00405D08    push        eax
 00405D09    push        0F0019
 00405D0E    push        0
 00405D10    push        405F10
 00405D15    push        80000001
 00405D1A    call        advapi32.RegOpenKeyExA
 00405D1F    test        eax,eax
>00405D21    je          00405D63
 00405D23    lea         eax,[ebp-8]
 00405D26    push        eax
 00405D27    push        0F0019
 00405D2C    push        0
 00405D2E    push        405F10
 00405D33    push        80000002
 00405D38    call        advapi32.RegOpenKeyExA
 00405D3D    test        eax,eax
>00405D3F    je          00405D63
 00405D41    lea         eax,[ebp-8]
 00405D44    push        eax
 00405D45    push        0F0019
 00405D4A    push        0
 00405D4C    push        405F2C
 00405D51    push        80000001
 00405D56    call        advapi32.RegOpenKeyExA
 00405D5B    test        eax,eax
>00405D5D    jne         00405DEC
 00405D63    xor         eax,eax
 00405D65    push        ebp
 00405D66    push        405DE5
 00405D6B    push        dword ptr fs:[eax]
 00405D6E    mov         dword ptr fs:[eax],esp
 00405D71    mov         dword ptr [ebp-18],5
 00405D78    lea         eax,[ebp-11D]
 00405D7E    mov         edx,105
 00405D83    call        ToLongPath
 00405D88    lea         eax,[ebp-18]
 00405D8B    push        eax
 00405D8C    lea         eax,[ebp-12]
 00405D8F    push        eax
 00405D90    push        0
 00405D92    push        0
 00405D94    lea         eax,[ebp-11D]
 00405D9A    push        eax
 00405D9B    mov         eax,dword ptr [ebp-8]
 00405D9E    push        eax
 00405D9F    call        advapi32.RegQueryValueExA
 00405DA4    test        eax,eax
>00405DA6    je          00405DCA
 00405DA8    lea         eax,[ebp-18]
 00405DAB    push        eax
 00405DAC    lea         eax,[ebp-12]
 00405DAF    push        eax
 00405DB0    push        0
 00405DB2    push        0
 00405DB4    push        405F4C
 00405DB9    mov         eax,dword ptr [ebp-8]
 00405DBC    push        eax
 00405DBD    call        advapi32.RegQueryValueExA
 00405DC2    test        eax,eax
>00405DC4    je          00405DCA
 00405DC6    mov         byte ptr [ebp-12],0
 00405DCA    mov         byte ptr [ebp-0E],0
 00405DCE    xor         eax,eax
 00405DD0    pop         edx
 00405DD1    pop         ecx
 00405DD2    pop         ecx
 00405DD3    mov         dword ptr fs:[eax],edx
 00405DD6    push        405DEC
 00405DDB    mov         eax,dword ptr [ebp-8]
 00405DDE    push        eax
 00405DDF    call        advapi32.RegCloseKey
 00405DE4    ret
>00405DE5    jmp         @HandleFinally
>00405DEA    jmp         00405DDB
 00405DEC    push        105
 00405DF1    mov         eax,dword ptr [ebp-4]
 00405DF4    push        eax
 00405DF5    lea         eax,[ebp-11D]
 00405DFB    push        eax
 00405DFC    call        KERNEL32.lstrcpynA
 00405E01    push        5
 00405E03    lea         eax,[ebp-0D]
 00405E06    push        eax
 00405E07    push        3
 00405E09    call        KERNEL32.GetThreadLocale
 00405E0E    push        eax
 00405E0F    call        KERNEL32.GetLocaleInfoA
 00405E14    xor         esi,esi
 00405E16    cmp         byte ptr [ebp-11D],0
>00405E1D    je          00405F06
 00405E23    cmp         byte ptr [ebp-0D],0
>00405E27    jne         00405E33
 00405E29    cmp         byte ptr [ebp-12],0
>00405E2D    je          00405F06
 00405E33    lea         eax,[ebp-11D]
 00405E39    push        eax
 00405E3A    call        KERNEL32.lstrlenA
 00405E3F    mov         ebx,eax
 00405E41    lea         eax,[ebp-11D]
 00405E47    add         ebx,eax
>00405E49    jmp         00405E4C
 00405E4B    dec         ebx
 00405E4C    cmp         byte ptr [ebx],2E
>00405E4F    je          00405E5B
 00405E51    lea         eax,[ebp-11D]
 00405E57    cmp         ebx,eax
>00405E59    jne         00405E4B
 00405E5B    lea         eax,[ebp-11D]
 00405E61    cmp         ebx,eax
>00405E63    je          00405F06
 00405E69    inc         ebx
 00405E6A    cmp         byte ptr [ebp-12],0
>00405E6E    je          00405E98
 00405E70    mov         edx,ebx
 00405E72    sub         edx,eax
 00405E74    mov         eax,105
 00405E79    sub         eax,edx
 00405E7B    push        eax
 00405E7C    lea         eax,[ebp-12]
 00405E7F    push        eax
 00405E80    push        ebx
 00405E81    call        KERNEL32.lstrcpynA
 00405E86    push        2
 00405E88    push        0
 00405E8A    lea         eax,[ebp-11D]
 00405E90    push        eax
 00405E91    call        KERNEL32.LoadLibraryExA
 00405E96    mov         esi,eax
 00405E98    test        esi,esi
>00405E9A    jne         00405F06
 00405E9C    cmp         byte ptr [ebp-0D],0
>00405EA0    je          00405F06
 00405EA2    lea         eax,[ebp-11D]
 00405EA8    mov         edx,ebx
 00405EAA    sub         edx,eax
 00405EAC    mov         eax,105
 00405EB1    sub         eax,edx
 00405EB3    push        eax
 00405EB4    lea         eax,[ebp-0D]
 00405EB7    push        eax
 00405EB8    push        ebx
 00405EB9    call        KERNEL32.lstrcpynA
 00405EBE    push        2
 00405EC0    push        0
 00405EC2    lea         eax,[ebp-11D]
 00405EC8    push        eax
 00405EC9    call        KERNEL32.LoadLibraryExA
 00405ECE    mov         esi,eax
 00405ED0    test        esi,esi
>00405ED2    jne         00405F06
 00405ED4    mov         byte ptr [ebp-0B],0
 00405ED8    lea         eax,[ebp-11D]
 00405EDE    mov         edx,ebx
 00405EE0    sub         edx,eax
 00405EE2    mov         eax,105
 00405EE7    sub         eax,edx
 00405EE9    push        eax
 00405EEA    lea         eax,[ebp-0D]
 00405EED    push        eax
 00405EEE    push        ebx
 00405EEF    call        KERNEL32.lstrcpynA
 00405EF4    push        2
 00405EF6    push        0
 00405EF8    lea         eax,[ebp-11D]
 00405EFE    push        eax
 00405EFF    call        KERNEL32.LoadLibraryExA
 00405F04    mov         esi,eax
 00405F06    mov         eax,esi
 00405F08    pop         esi
 00405F09    pop         ebx
 00405F0A    mov         esp,ebp
 00405F0C    pop         ebp
 00405F0D    ret
*}
end;

//00405F50
procedure AddModuleUnloadProc(Proc:TModuleUnloadProc);
begin
{*
 00405F50    call        AddModuleUnloadProc
 00405F55    ret
*}
end;

//00405F58
procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProc);
begin
{*
 00405F58    call        RemoveModuleUnloadProc
 00405F5D    ret
*}
end;

//00405F60
procedure AddModuleUnloadProc(Proc:TModuleUnloadProcLW);
begin
{*
 00405F60    push        ebx
 00405F61    mov         ebx,eax
 00405F63    mov         eax,8
 00405F68    call        @GetMem
 00405F6D    mov         edx,dword ptr ds:[5AC040]
 00405F73    mov         dword ptr [eax],edx
 00405F75    mov         dword ptr [eax+4],ebx
 00405F78    mov         [005AC040],eax
 00405F7D    pop         ebx
 00405F7E    ret
*}
end;

//00405F80
procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProcLW);
begin
{*
 00405F80    push        ebx
 00405F81    push        esi
 00405F82    mov         esi,dword ptr ds:[5AC040]
 00405F88    test        esi,esi
>00405F8A    je          00405FAE
 00405F8C    mov         edx,dword ptr [esi+4]
 00405F8F    cmp         edx,eax
>00405F91    jne         00405FAE
 00405F93    mov         eax,[005AC040]
 00405F98    mov         eax,dword ptr [eax]
 00405F9A    mov         [005AC040],eax
 00405F9F    mov         edx,8
 00405FA4    mov         eax,esi
 00405FA6    call        @FreeMem
 00405FAB    pop         esi
 00405FAC    pop         ebx
 00405FAD    ret
 00405FAE    mov         edx,esi
 00405FB0    test        edx,edx
>00405FB2    je          00405FDB
 00405FB4    mov         ecx,dword ptr [edx]
 00405FB6    test        ecx,ecx
>00405FB8    je          00405FD5
 00405FBA    mov         ebx,dword ptr [ecx+4]
 00405FBD    cmp         ebx,eax
>00405FBF    jne         00405FD5
 00405FC1    mov         esi,ecx
 00405FC3    mov         eax,dword ptr [ecx]
 00405FC5    mov         dword ptr [edx],eax
 00405FC7    mov         edx,8
 00405FCC    mov         eax,esi
 00405FCE    call        @FreeMem
>00405FD3    jmp         00405FDB
 00405FD5    mov         edx,dword ptr [edx]
 00405FD7    test        edx,edx
>00405FD9    jne         00405FB4
 00405FDB    pop         esi
 00405FDC    pop         ebx
 00405FDD    ret
*}
end;

//00405FE0
procedure NotifyModuleUnload(HInstance:Cardinal);
begin
{*
 00405FE0    push        ebp
 00405FE1    mov         ebp,esp
 00405FE3    add         esp,0FFFFFFF8
 00405FE6    push        ebx
 00405FE7    push        esi
 00405FE8    push        edi
 00405FE9    mov         dword ptr [ebp-4],eax
 00405FEC    mov         eax,[005AC040]
 00405FF1    mov         dword ptr [ebp-8],eax
 00405FF4    cmp         dword ptr [ebp-8],0
>00405FF8    je          00406033
 00405FFA    xor         eax,eax
 00405FFC    push        ebp
 00405FFD    push        40601B
 00406002    push        dword ptr fs:[eax]
 00406005    mov         dword ptr fs:[eax],esp
 00406008    mov         ebx,dword ptr [ebp-8]
 0040600B    mov         eax,dword ptr [ebp-4]
 0040600E    call        dword ptr [ebx+4]
 00406011    xor         eax,eax
 00406013    pop         edx
 00406014    pop         ecx
 00406015    pop         ecx
 00406016    mov         dword ptr fs:[eax],edx
>00406019    jmp         00406025
>0040601B    jmp         @HandleAnyException
 00406020    call        @DoneExcept
 00406025    mov         eax,dword ptr [ebp-8]
 00406028    mov         eax,dword ptr [eax]
 0040602A    mov         dword ptr [ebp-8],eax
 0040602D    cmp         dword ptr [ebp-8],0
>00406031    jne         00405FFA
 00406033    pop         edi
 00406034    pop         esi
 00406035    pop         ebx
 00406036    pop         ecx
 00406037    pop         ecx
 00406038    pop         ebp
 00406039    ret
*}
end;

//0040603C
procedure RegisterModule(LibModule:PLibModule);
begin
{*
 0040603C    mov         edx,dword ptr ds:[5AC03C]
 00406042    mov         dword ptr [eax],edx
 00406044    mov         [005AC03C],eax
 00406049    ret
*}
end;

//0040604C
procedure UnregisterModule(LibModule:PLibModule);
begin
{*
 0040604C    push        ebp
 0040604D    mov         ebp,esp
 0040604F    push        ecx
 00406050    mov         dword ptr [ebp-4],eax
 00406053    xor         edx,edx
 00406055    push        ebp
 00406056    push        4060B0
 0040605B    push        dword ptr fs:[edx]
 0040605E    mov         dword ptr fs:[edx],esp
 00406061    mov         eax,dword ptr [ebp-4]
 00406064    mov         eax,dword ptr [eax+4]
 00406067    call        NotifyModuleUnload
 0040606C    xor         eax,eax
 0040606E    pop         edx
 0040606F    pop         ecx
 00406070    pop         ecx
 00406071    mov         dword ptr fs:[eax],edx
 00406074    push        4060B7
 00406079    mov         eax,dword ptr [ebp-4]
 0040607C    cmp         eax,dword ptr ds:[5AC03C]
>00406082    jne         00406090
 00406084    mov         eax,dword ptr [ebp-4]
 00406087    mov         eax,dword ptr [eax]
 00406089    mov         [005AC03C],eax
>0040608E    jmp         004060AF
 00406090    mov         eax,[005AC03C]
 00406095    test        eax,eax
>00406097    je          004060AF
 00406099    mov         edx,dword ptr [eax]
 0040609B    cmp         edx,dword ptr [ebp-4]
>0040609E    jne         004060A9
 004060A0    mov         edx,dword ptr [ebp-4]
 004060A3    mov         edx,dword ptr [edx]
 004060A5    mov         dword ptr [eax],edx
>004060A7    jmp         004060AF
 004060A9    mov         eax,dword ptr [eax]
 004060AB    test        eax,eax
>004060AD    jne         00406099
 004060AF    ret
>004060B0    jmp         @HandleFinally
>004060B5    jmp         00406079
 004060B7    pop         ecx
 004060B8    pop         ebp
 004060B9    ret
*}
end;

//004060BC
function @IntfClear(var Dest:IInterface):Pointer;
begin
{*
 004060BC    mov         edx,dword ptr [eax]
 004060BE    test        edx,edx
>004060C0    je          004060D0
 004060C2    mov         dword ptr [eax],0
 004060C8    push        eax
 004060C9    push        edx
 004060CA    mov         eax,dword ptr [edx]
 004060CC    call        dword ptr [eax+8]
 004060CF    pop         eax
 004060D0    ret
*}
end;

//004060D4
procedure @IntfCopy(var Dest:IInterface; const Source:IInterface);
begin
{*
 004060D4    test        edx,edx
>004060D6    je          004060F1
 004060D8    push        edx
 004060D9    push        eax
 004060DA    mov         eax,dword ptr [edx]
 004060DC    push        edx
 004060DD    call        dword ptr [eax+4]
 004060E0    pop         eax
 004060E1    mov         ecx,dword ptr [eax]
 004060E3    pop         dword ptr [eax]
 004060E5    test        ecx,ecx
>004060E7    jne         004060EA
 004060E9    ret
 004060EA    mov         eax,dword ptr [ecx]
 004060EC    push        ecx
 004060ED    call        dword ptr [eax+8]
 004060F0    ret
 004060F1    mov         ecx,dword ptr [eax]
 004060F3    test        ecx,ecx
 004060F5    mov         dword ptr [eax],edx
>004060F7    je          004060FF
 004060F9    mov         eax,dword ptr [ecx]
 004060FB    push        ecx
 004060FC    call        dword ptr [eax+8]
 004060FF    ret
*}
end;

//00406100
procedure @IntfCast(var Dest:IInterface; const Source:IInterface; const IID:TGUID);
begin
{*
 00406100    test        edx,edx
>00406102    je          004060BC
 00406108    push        edi
 00406109    mov         edi,eax
 0040610B    push        0
 0040610D    push        esp
 0040610E    push        ecx
 0040610F    push        edx
 00406110    mov         eax,dword ptr [edx]
 00406112    call        dword ptr [eax]
 00406114    test        eax,eax
>00406116    je          0040611F
 00406118    mov         al,17
>0040611A    jmp         Error
 0040611F    mov         eax,dword ptr [edi]
 00406121    test        eax,eax
>00406123    je          0040612B
 00406125    push        eax
 00406126    mov         eax,dword ptr [eax]
 00406128    call        dword ptr [eax+8]
 0040612B    pop         eax
 0040612C    mov         dword ptr [edi],eax
 0040612E    pop         edi
 0040612F    ret
*}
end;

//00406130
procedure @IntfAddRef(const Dest:IInterface);
begin
{*
 00406130    test        eax,eax
>00406132    je          0040613A
 00406134    push        eax
 00406135    mov         eax,dword ptr [eax]
 00406137    call        dword ptr [eax+4]
 0040613A    ret
*}
end;

//0040613C
procedure TInterfacedObject.AfterConstruction;
begin
{*
 0040613C    add         eax,4
 0040613F    push        eax
 00406140    call        KERNEL32.InterlockedDecrement
 00406145    ret
*}
end;

//00406148
procedure TInterfacedObject.BeforeDestruction;
begin
{*
 00406148    cmp         dword ptr [eax+4],0
>0040614C    je          00406155
 0040614E    mov         al,2
 00406150    call        Error
 00406155    ret
*}
end;

//00406158
function TInterfacedObject.NewInstance:TObject;
begin
{*
 00406158    call        TObject.NewInstance
 0040615D    mov         dword ptr [eax+4],1
 00406164    ret
*}
end;

//00406168
function TContainedObject.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 00406168    push        ebp
 00406169    mov         ebp,esp
 0040616B    push        ebx
 0040616C    mov         ebx,dword ptr [ebp+8]
 0040616F    mov         ecx,dword ptr [ebp+10]
 00406172    mov         edx,dword ptr [ebp+0C]
 00406175    mov         eax,ebx
 00406177    call        TObject.GetInterface
 0040617C    test        al,al
>0040617E    je          00406184
 00406180    xor         eax,eax
>00406182    jmp         00406189
 00406184    mov         eax,80004002
 00406189    pop         ebx
 0040618A    pop         ebp
 0040618B    ret         0C
*}
end;

//00406190
function TInterfacedObject._AddRef:Integer; stdcall;
begin
{*
 00406190    push        ebp
 00406191    mov         ebp,esp
 00406193    mov         eax,dword ptr [ebp+8]
 00406196    add         eax,4
 00406199    push        eax
 0040619A    call        KERNEL32.InterlockedIncrement
 0040619F    pop         ebp
 004061A0    ret         4
*}
end;

//004061A4
function TInterfacedObject._Release:Integer; stdcall;
begin
{*
 004061A4    push        ebp
 004061A5    mov         ebp,esp
 004061A7    push        ebx
 004061A8    push        esi
 004061A9    mov         ebx,dword ptr [ebp+8]
 004061AC    lea         eax,[ebx+4]
 004061AF    push        eax
 004061B0    call        KERNEL32.InterlockedDecrement
 004061B5    mov         esi,eax
 004061B7    test        esi,esi
>004061B9    jne         004061C4
 004061BB    mov         dl,1
 004061BD    mov         eax,ebx
 004061BF    mov         ecx,dword ptr [eax]
 004061C1    call        dword ptr [ecx-4]
 004061C4    mov         eax,esi
 004061C6    pop         esi
 004061C7    pop         ebx
 004061C8    pop         ebp
 004061C9    ret         4
*}
end;

//004061CC
function GetMemory(Size:Integer):Pointer; cdecl;
begin
{*
 004061CC    push        ebp
 004061CD    mov         ebp,esp
 004061CF    mov         eax,dword ptr [ebp+8]
 004061D2    call        dword ptr ds:[5AC044]
 004061D8    pop         ebp
 004061D9    ret
*}
end;

//004061DC
function FreeMemory(P:Pointer):Integer; cdecl;
begin
{*
 004061DC    push        ebp
 004061DD    mov         ebp,esp
 004061DF    mov         eax,dword ptr [ebp+8]
 004061E2    test        eax,eax
>004061E4    jne         004061EA
 004061E6    xor         eax,eax
 004061E8    pop         ebp
 004061E9    ret
 004061EA    call        dword ptr ds:[5AC048]
 004061F0    pop         ebp
 004061F1    ret
*}
end;

//004061F4
function UnicodeToUtf8(Dest:PAnsiChar; MaxDestBytes:Cardinal; Source:PWideChar; SourceChars:Cardinal):Cardinal;
begin
{*
 004061F4    push        ebp
 004061F5    mov         ebp,esp
 004061F7    add         esp,0FFFFFFF8
 004061FA    push        ebx
 004061FB    push        esi
 004061FC    mov         dword ptr [ebp-8],ecx
 004061FF    mov         dword ptr [ebp-4],edx
 00406202    xor         edx,edx
 00406204    cmp         dword ptr [ebp-8],0
>00406208    je          004062C6
 0040620E    xor         esi,esi
 00406210    xor         ecx,ecx
 00406212    test        eax,eax
>00406214    je          004062A1
>0040621A    jmp         00406288
 0040621C    mov         edx,dword ptr [ebp-8]
 0040621F    movzx       edx,word ptr [edx+ecx*2]
 00406223    inc         ecx
 00406224    cmp         edx,7F
>00406227    ja          0040622F
 00406229    mov         byte ptr [eax+esi],dl
 0040622C    inc         esi
>0040622D    jmp         00406288
 0040622F    cmp         edx,7FF
>00406235    jbe         00406268
 00406237    lea         ebx,[esi+3]
 0040623A    cmp         ebx,dword ptr [ebp-4]
>0040623D    ja          00406292
 0040623F    mov         ebx,edx
 00406241    shr         ebx,0C
 00406244    or          bl,0E0
 00406247    mov         byte ptr [eax+esi],bl
 0040624A    mov         ebx,edx
 0040624C    shr         ebx,6
 0040624F    and         bl,3F
 00406252    or          bl,80
 00406255    mov         byte ptr [eax+esi+1],bl
 00406259    and         dl,3F
 0040625C    or          dl,80
 0040625F    mov         byte ptr [eax+esi+2],dl
 00406263    add         esi,3
>00406266    jmp         00406288
 00406268    lea         ebx,[esi+2]
 0040626B    cmp         ebx,dword ptr [ebp-4]
>0040626E    ja          00406292
 00406270    mov         ebx,edx
 00406272    shr         ebx,6
 00406275    or          bl,0C0
 00406278    mov         byte ptr [eax+esi],bl
 0040627B    and         dl,3F
 0040627E    or          dl,80
 00406281    mov         byte ptr [eax+esi+1],dl
 00406285    add         esi,2
 00406288    cmp         ecx,dword ptr [ebp+8]
>0040628B    jae         00406292
 0040628D    cmp         esi,dword ptr [ebp-4]
>00406290    jb          0040621C
 00406292    cmp         esi,dword ptr [ebp-4]
>00406295    jb          0040629B
 00406297    mov         esi,dword ptr [ebp-4]
 0040629A    dec         esi
 0040629B    mov         byte ptr [eax+esi],0
>0040629F    jmp         004062C3
 004062A1    cmp         ecx,dword ptr [ebp+8]
>004062A4    jae         004062C3
 004062A6    mov         eax,dword ptr [ebp-8]
 004062A9    movzx       edx,word ptr [eax+ecx*2]
 004062AD    inc         ecx
 004062AE    cmp         edx,7F
>004062B1    jbe         004062BD
 004062B3    cmp         edx,7FF
>004062B9    jbe         004062BC
 004062BB    inc         esi
 004062BC    inc         esi
 004062BD    inc         esi
 004062BE    cmp         ecx,dword ptr [ebp+8]
>004062C1    jb          004062A6
 004062C3    lea         edx,[esi+1]
 004062C6    mov         eax,edx
 004062C8    pop         esi
 004062C9    pop         ebx
 004062CA    pop         ecx
 004062CB    pop         ecx
 004062CC    pop         ebp
 004062CD    ret         4
*}
end;

//004062D0
function Utf8ToUnicode(Dest:PWideChar; MaxDestChars:Cardinal; Source:PAnsiChar; SourceBytes:Cardinal):Cardinal;
begin
{*
 004062D0    push        ebp
 004062D1    mov         ebp,esp
 004062D3    add         esp,0FFFFFFF0
 004062D6    push        ebx
 004062D7    push        esi
 004062D8    mov         dword ptr [ebp-0C],ecx
 004062DB    mov         dword ptr [ebp-8],edx
 004062DE    mov         dword ptr [ebp-4],eax
 004062E1    cmp         dword ptr [ebp-0C],0
>004062E5    jne         004062F1
 004062E7    xor         eax,eax
 004062E9    mov         dword ptr [ebp-10],eax
>004062EC    jmp         004063FA
 004062F1    mov         dword ptr [ebp-10],0FFFFFFFF
 004062F8    xor         eax,eax
 004062FA    xor         esi,esi
 004062FC    cmp         dword ptr [ebp-4],0
>00406300    je          004063AF
>00406306    jmp         0040638D
 0040630B    mov         edx,dword ptr [ebp-0C]
 0040630E    xor         ecx,ecx
 00406310    mov         cl,byte ptr [edx+esi]
 00406313    inc         esi
 00406314    test        cl,80
>00406317    je          00406385
 00406319    cmp         esi,dword ptr [ebp+8]
>0040631C    jae         004063FA
 00406322    and         ecx,3F
 00406325    test        cl,20
>00406328    je          00406358
 0040632A    mov         edx,dword ptr [ebp-0C]
 0040632D    mov         dl,byte ptr [edx+esi]
 00406330    inc         esi
 00406331    mov         ebx,edx
 00406333    and         bl,0C0
 00406336    cmp         bl,80
>00406339    jne         004063FA
 0040633F    cmp         esi,dword ptr [ebp+8]
>00406342    jae         004063FA
 00406348    and         dl,3F
 0040634B    and         edx,0FF
 00406351    shl         ecx,6
 00406354    or          edx,ecx
 00406356    mov         ecx,edx
 00406358    mov         edx,dword ptr [ebp-0C]
 0040635B    mov         dl,byte ptr [edx+esi]
 0040635E    inc         esi
 0040635F    mov         ebx,edx
 00406361    and         bl,0C0
 00406364    cmp         bl,80
>00406367    jne         004063FA
 0040636D    and         dl,3F
 00406370    and         edx,0FF
 00406376    shl         ecx,6
 00406379    or          dx,cx
 0040637C    mov         ecx,dword ptr [ebp-4]
 0040637F    mov         word ptr [ecx+eax*2],dx
>00406383    jmp         0040638C
 00406385    mov         edx,dword ptr [ebp-4]
 00406388    mov         word ptr [edx+eax*2],cx
 0040638C    inc         eax
 0040638D    cmp         esi,dword ptr [ebp+8]
>00406390    jae         0040639B
 00406392    cmp         eax,dword ptr [ebp-8]
>00406395    jb          0040630B
 0040639B    cmp         eax,dword ptr [ebp-8]
>0040639E    jb          004063A4
 004063A0    mov         eax,dword ptr [ebp-8]
 004063A3    dec         eax
 004063A4    mov         edx,dword ptr [ebp-4]
 004063A7    mov         word ptr [edx+eax*2],0
>004063AD    jmp         004063F6
 004063AF    cmp         esi,dword ptr [ebp+8]
>004063B2    jae         004063F6
 004063B4    mov         edx,dword ptr [ebp-0C]
 004063B7    mov         dl,byte ptr [edx+esi]
 004063BA    inc         esi
 004063BB    test        dl,80
>004063BE    je          004063F0
 004063C0    cmp         esi,dword ptr [ebp+8]
>004063C3    jae         004063FA
 004063C5    and         dl,3F
 004063C8    test        dl,20
>004063CB    je          004063E1
 004063CD    mov         edx,dword ptr [ebp-0C]
 004063D0    mov         dl,byte ptr [edx+esi]
 004063D3    inc         esi
 004063D4    and         dl,0C0
 004063D7    cmp         dl,80
>004063DA    jne         004063FA
 004063DC    cmp         esi,dword ptr [ebp+8]
>004063DF    jae         004063FA
 004063E1    mov         edx,dword ptr [ebp-0C]
 004063E4    mov         dl,byte ptr [edx+esi]
 004063E7    inc         esi
 004063E8    and         dl,0C0
 004063EB    cmp         dl,80
>004063EE    jne         004063FA
 004063F0    inc         eax
 004063F1    cmp         esi,dword ptr [ebp+8]
>004063F4    jb          004063B4
 004063F6    inc         eax
 004063F7    mov         dword ptr [ebp-10],eax
 004063FA    mov         eax,dword ptr [ebp-10]
 004063FD    pop         esi
 004063FE    pop         ebx
 004063FF    mov         esp,ebp
 00406401    pop         ebp
 00406402    ret         4
*}
end;

//00406408
function UTF8Encode(const WS:WideString):UTF8String;
begin
{*
 00406408    push        ebp
 00406409    mov         ebp,esp
 0040640B    push        0
 0040640D    push        ebx
 0040640E    push        esi
 0040640F    mov         esi,edx
 00406411    mov         ebx,eax
 00406413    xor         eax,eax
 00406415    push        ebp
 00406416    push        4064A7
 0040641B    push        dword ptr fs:[eax]
 0040641E    mov         dword ptr fs:[eax],esp
 00406421    mov         eax,esi
 00406423    call        @LStrClr
 00406428    mov         eax,ebx
 0040642A    xor         edx,edx
 0040642C    call        @WStrCmp
>00406431    je          00406491
 00406433    mov         eax,ebx
 00406435    call        @WStrLen
 0040643A    lea         edx,[eax+eax*2]
 0040643D    lea         eax,[ebp-4]
 00406440    call        @LStrSetLength
 00406445    mov         eax,ebx
 00406447    call        @WStrLen
 0040644C    push        eax
 0040644D    mov         eax,dword ptr [ebp-4]
 00406450    call        @LStrLen
 00406455    inc         eax
 00406456    push        eax
 00406457    mov         eax,ebx
 00406459    call        @WStrToPWChar
 0040645E    push        eax
 0040645F    mov         eax,dword ptr [ebp-4]
 00406462    call        @LStrToPChar
 00406467    pop         ecx
 00406468    pop         edx
 00406469    call        UnicodeToUtf8
 0040646E    test        eax,eax
>00406470    jle         0040647F
 00406472    mov         edx,eax
 00406474    dec         edx
 00406475    lea         eax,[ebp-4]
 00406478    call        @LStrSetLength
>0040647D    jmp         00406487
 0040647F    lea         eax,[ebp-4]
 00406482    call        @LStrClr
 00406487    mov         eax,esi
 00406489    mov         edx,dword ptr [ebp-4]
 0040648C    call        @LStrAsg
 00406491    xor         eax,eax
 00406493    pop         edx
 00406494    pop         ecx
 00406495    pop         ecx
 00406496    mov         dword ptr fs:[eax],edx
 00406499    push        4064AE
 0040649E    lea         eax,[ebp-4]
 004064A1    call        @LStrClr
 004064A6    ret
>004064A7    jmp         @HandleFinally
>004064AC    jmp         0040649E
 004064AE    pop         esi
 004064AF    pop         ebx
 004064B0    pop         ecx
 004064B1    pop         ebp
 004064B2    ret
*}
end;

//004064B4
function UTF8Decode(const S:UTF8String):WideString;
begin
{*
 004064B4    push        ebp
 004064B5    mov         ebp,esp
 004064B7    push        0
 004064B9    push        ebx
 004064BA    push        esi
 004064BB    mov         esi,edx
 004064BD    mov         ebx,eax
 004064BF    xor         eax,eax
 004064C1    push        ebp
 004064C2    push        40654B
 004064C7    push        dword ptr fs:[eax]
 004064CA    mov         dword ptr fs:[eax],esp
 004064CD    mov         eax,esi
 004064CF    call        @WStrClr
 004064D4    test        ebx,ebx
>004064D6    je          00406535
 004064D8    mov         eax,ebx
 004064DA    call        @LStrLen
 004064DF    mov         edx,eax
 004064E1    lea         eax,[ebp-4]
 004064E4    call        @WStrSetLength
 004064E9    mov         eax,ebx
 004064EB    call        @LStrLen
 004064F0    push        eax
 004064F1    mov         eax,dword ptr [ebp-4]
 004064F4    call        @WStrLen
 004064F9    inc         eax
 004064FA    push        eax
 004064FB    mov         eax,ebx
 004064FD    call        @LStrToPChar
 00406502    push        eax
 00406503    mov         eax,dword ptr [ebp-4]
 00406506    call        @WStrToPWChar
 0040650B    pop         ecx
 0040650C    pop         edx
 0040650D    call        Utf8ToUnicode
 00406512    test        eax,eax
>00406514    jle         00406523
 00406516    mov         edx,eax
 00406518    dec         edx
 00406519    lea         eax,[ebp-4]
 0040651C    call        @WStrSetLength
>00406521    jmp         0040652B
 00406523    lea         eax,[ebp-4]
 00406526    call        @WStrClr
 0040652B    mov         eax,esi
 0040652D    mov         edx,dword ptr [ebp-4]
 00406530    call        @WStrAsg
 00406535    xor         eax,eax
 00406537    pop         edx
 00406538    pop         ecx
 00406539    pop         ecx
 0040653A    mov         dword ptr fs:[eax],edx
 0040653D    push        406552
 00406542    lea         eax,[ebp-4]
 00406545    call        @WStrClr
 0040654A    ret
>0040654B    jmp         @HandleFinally
>00406550    jmp         00406542
 00406552    pop         esi
 00406553    pop         ebx
 00406554    pop         ecx
 00406555    pop         ebp
 00406556    ret
*}
end;

//00406558
function AnsiToUtf8(const S:AnsiString):UTF8String;
begin
{*
 00406558    push        ebp
 00406559    mov         ebp,esp
 0040655B    push        0
 0040655D    push        ebx
 0040655E    push        esi
 0040655F    mov         esi,edx
 00406561    mov         ebx,eax
 00406563    xor         eax,eax
 00406565    push        ebp
 00406566    push        40659B
 0040656B    push        dword ptr fs:[eax]
 0040656E    mov         dword ptr fs:[eax],esp
 00406571    lea         eax,[ebp-4]
 00406574    mov         edx,ebx
 00406576    call        @WStrFromLStr
 0040657B    mov         eax,dword ptr [ebp-4]
 0040657E    mov         edx,esi
 00406580    call        UTF8Encode
 00406585    xor         eax,eax
 00406587    pop         edx
 00406588    pop         ecx
 00406589    pop         ecx
 0040658A    mov         dword ptr fs:[eax],edx
 0040658D    push        4065A2
 00406592    lea         eax,[ebp-4]
 00406595    call        @WStrClr
 0040659A    ret
>0040659B    jmp         @HandleFinally
>004065A0    jmp         00406592
 004065A2    pop         esi
 004065A3    pop         ebx
 004065A4    pop         ecx
 004065A5    pop         ebp
 004065A6    ret
*}
end;

//004065A8
function LoadStr(Ident:Integer):AnsiString;
begin
{*
 004065A8    push        ebx
 004065A9    push        esi
 004065AA    add         esp,0FFFFFC00
 004065B0    mov         esi,edx
 004065B2    mov         ebx,eax
 004065B4    test        ebx,ebx
>004065B6    je          004065F5
 004065B8    cmp         dword ptr [ebx+4],10000
>004065BF    jge         004065EB
 004065C1    push        400
 004065C6    lea         eax,[esp+4]
 004065CA    push        eax
 004065CB    mov         eax,dword ptr [ebx+4]
 004065CE    push        eax
 004065CF    mov         eax,dword ptr [ebx]
 004065D1    mov         eax,dword ptr [eax]
 004065D3    call        FindResourceHInstance
 004065D8    push        eax
 004065D9    call        user32.LoadStringA
 004065DE    mov         ecx,eax
 004065E0    mov         edx,esp
 004065E2    mov         eax,esi
 004065E4    call        @LStrFromPCharLen
>004065E9    jmp         004065F5
 004065EB    mov         eax,esi
 004065ED    mov         edx,dword ptr [ebx+4]
 004065F0    call        @LStrFromPChar
 004065F5    add         esp,400
 004065FB    pop         esi
 004065FC    pop         ebx
 004065FD    ret
*}
end;

//00406600
function LCIDToCodePage(ALcid:Cardinal):Integer;
begin
{*
 00406600    push        ebp
 00406601    mov         ebp,esp
 00406603    add         esp,0FFFFFFF0
 00406606    push        ebx
 00406607    xor         edx,edx
 00406609    mov         dword ptr [ebp-10],edx
 0040660C    xor         edx,edx
 0040660E    push        ebp
 0040660F    push        406666
 00406614    push        dword ptr fs:[edx]
 00406617    mov         dword ptr fs:[edx],esp
 0040661A    push        7
 0040661C    lea         edx,[ebp-0B]
 0040661F    push        edx
 00406620    push        1004
 00406625    push        eax
 00406626    call        KERNEL32.GetLocaleInfoA
 0040662B    lea         eax,[ebp-10]
 0040662E    lea         edx,[ebp-0B]
 00406631    mov         ecx,7
 00406636    call        @LStrFromArray
 0040663B    mov         eax,dword ptr [ebp-10]
 0040663E    lea         edx,[ebp-4]
 00406641    call        @ValLong
 00406646    mov         ebx,eax
 00406648    cmp         dword ptr [ebp-4],0
>0040664C    je          00406650
 0040664E    xor         ebx,ebx
 00406650    xor         eax,eax
 00406652    pop         edx
 00406653    pop         ecx
 00406654    pop         ecx
 00406655    mov         dword ptr fs:[eax],edx
 00406658    push        40666D
 0040665D    lea         eax,[ebp-10]
 00406660    call        @LStrClr
 00406665    ret
>00406666    jmp         @HandleFinally
>0040666B    jmp         0040665D
 0040666D    mov         eax,ebx
 0040666F    pop         ebx
 00406670    mov         esp,ebp
 00406672    pop         ebp
 00406673    ret
*}
end;

Initialization
//004066C8
{*
 004066C8    sub         dword ptr ds:[5AF5B8],1
>004066CF    jae         0040679A
 004066D5    mov         byte ptr ds:[5AC00C],2
 004066DC    mov         dword ptr ds:[5AF014],40124C
 004066E6    mov         dword ptr ds:[5AF018],40125C
 004066F0    mov         byte ptr ds:[5AF04A],2
 004066F7    mov         dword ptr ds:[5AF000],4055EC
 00406701    call        @isNECWindows
 00406706    test        al,al
>00406708    je          0040670F
 0040670A    call        @FpuMaskInit
 0040670F    call        @FpuInit
 00406714    mov         word ptr ds:[5AF050],0D7B0
 0040671D    mov         word ptr ds:[5AF21C],0D7B0
 00406726    mov         word ptr ds:[5AF3E8],0D7B0
 0040672F    call        KERNEL32.GetCommandLineA
 00406734    mov         [005AF03C],eax
 00406739    call        GetCmdShow
 0040673E    mov         [005AF038],eax
 00406743    call        KERNEL32.GetVersion
 00406748    and         eax,80000000
 0040674D    cmp         eax,80000000
>00406752    je          00406781
 00406754    call        KERNEL32.GetVersion
 00406759    and         eax,0FF
 0040675E    cmp         ax,4
>00406762    jbe         00406770
 00406764    mov         dword ptr ds:[5AF5BC],3
>0040676E    jmp         00406790
 00406770    call        KERNEL32.GetThreadLocale
 00406775    call        LCIDToCodePage
 0040677A    mov         [005AF5BC],eax
>0040677F    jmp         00406790
 00406781    call        KERNEL32.GetThreadLocale
 00406786    call        LCIDToCodePage
 0040678B    mov         [005AF5BC],eax
 00406790    call        KERNEL32.GetCurrentThreadId
 00406795    mov         [005AF030],eax
 0040679A    ret
*}
Finalization
//00406674
{*
 00406674    push        ebp
 00406675    mov         ebp,esp
 00406677    xor         eax,eax
 00406679    push        ebp
 0040667A    push        4066BE
 0040667F    push        dword ptr fs:[eax]
 00406682    mov         dword ptr fs:[eax],esp
 00406685    inc         dword ptr ds:[5AF5B8]
>0040668B    jne         004066B0
 0040668D    mov         eax,5AF04C
 00406692    call        @Close
 00406697    mov         eax,5AF218
 0040669C    call        @Close
 004066A1    mov         eax,5AF3E4
 004066A6    call        @Close
 004066AB    call        UninitAllocator
 004066B0    xor         eax,eax
 004066B2    pop         edx
 004066B3    pop         ecx
 004066B4    pop         ecx
 004066B5    mov         dword ptr fs:[eax],edx
 004066B8    push        4066C5
 004066BD    ret
>004066BE    jmp         @HandleFinally
>004066C3    jmp         004066BD
 004066C5    pop         ebp
 004066C6    ret
*}
end.