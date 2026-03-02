//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit sysutils;

interface

uses
  SysUtils, Classes;

type
  Exception = class(TObject)
  public
    FMessage:String;//f4
    FHelpContext:Integer;//f8
    constructor Create(const Msg:AnsiString);//0040D6E0
    //constructor CreateFmt(const Msg:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);//0040D71C
    constructor CreateRes(ResStringRec:PResStringRec);//0040D79C
    //constructor CreateResFmt(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);//0040D7D8
  end;
  EAbort = class(Exception)
  end;
  EHeapException = class(Exception)
  public
    AllowFree:Boolean;//fC
    procedure FreeInstance;//0040D86C
  end;
  EOutOfMemory = class(EHeapException)
  end;
  EInOutError = class(Exception)
  public
    ErrorCode:Integer;//fC
  end;
  EIntError = class()
  end;
  EMathError = class()
  end;
  EInvalidOp = class(EMathError)
  end;
  EZeroDivide = class(EMathError)
  end;
  EOverflow = class(EMathError)
  end;
  EUnderflow = class(EMathError)
  end;
  EInvalidPointer = class(EHeapException)
  end;
  EInvalidCast = class(Exception)
  end;
  EConvertError = class(Exception)
  end;
  EAccessViolation = class()
  end;
  EPrivilege = class()
  end;
  EStackOverflow = class()
  end;
  EControlC = class()
  end;
  EVariantError = class(Exception)
  end;
  EAssertionFailed = class(Exception)
  end;
  EAbstractError = class(Exception)
  end;
  EIntfCastError = class(Exception)
  end;
  EOSError = class(Exception)
  public
    ErrorCode:DWORD;//fC
  end;
  ESafecallException = class(Exception)
  end;
  .24 = array [1..12] of String;
  .34 = array [1..12] of String;
  .44 = array [1..7] of String;
  .54 = array [1..7] of String;
  TFormatSettings = TFormatSettings = record//size=0xC0
f8:String;//f8
fC:String;//fC
f10:String;//f10
f14:String;//f14
f18:String;//f18
f1C:String;//f1C
f20:String;//f20
f24:.24;//f24
f54:.34;//f54
f84:.44;//f84
fA0:.54;//fA0
end;;
  .74 = array of String;
//elSize = 4
//varType equivalent: varStrArg;
  .84 = array of String;
//elSize = 4
//varType equivalent: varStrArg;
  TThreadLocalCounter = class(TObject)
  public
    FHashTable:array[$0..$F] of PThreadInfo;//f4
    destructor Destroy;//0040EDDC
    function HashIndex:Byte;//0040EE2C
    procedure Open(var Thread:PThreadInfo);//0040EE44
    procedure Delete(var Thread:PThreadInfo);//0040EEBC
    function Recycle:PThreadInfo;//0040EECC
  end;
  TMultiReadExclusiveWriteSynchronizer = class(TInterfacedObject)
  public
    FSentinel:Integer;//fC
    FReadSignal:THandle;//f10
    FWriteSignal:THandle;//f14
    FWaitRecycle:Cardinal;//f18
    FWriteRecursionCount:Cardinal;//f1C
    tls:TThreadLocalCounter;//f20
    FWriterID:Cardinal;//f24
    FRevisionLevel:Cardinal;//f28
    constructor Create;//0040EF0C
    destructor Destroy;//0040EF80
    procedure BlockReaders;//0040EFC8
    procedure UnblockReaders;//0040EFD4
    procedure UnblockOneWriter;//0040EFE0
    procedure WaitForReadSignal;//0040EFEC
    procedure WaitForWriteSignal;//0040EFFC
    function BeginWrite:Boolean;//0040F00C
    procedure EndWrite;//0040F0A8
    procedure BeginRead;//0040F0F8
    procedure EndRead;//0040F164
  end;
  TErrorRec = TErrorRec = record//size=0x8
f4:String;//f4
end;;
  TExceptRec = TExceptRec = record//size=0x8
f4:String;//f4
end;;
    procedure DivMod(Dividend:Integer; Divisor:Word; var Result:Word; var Remainder:Word);//004097F8
    procedure ConvertError(ResString:PResStringRec);//00409814
    //procedure ConvertErrorFmt(ResString:PResStringRec; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);//0040982C
    function AllocMem(Size:Cardinal):Pointer;//00409850
    procedure DoExitProc;//00409870
    procedure AddExitProc(Proc:TProcedure);//0040989C
    function UpperCase(const S:AnsiString):AnsiString;//004098D4
    function LowerCase(const S:AnsiString):AnsiString;//00409910
    function CompareStr(const S1:AnsiString; const S2:AnsiString):Integer;//0040994C
    function CompareMem(P1:Pointer; P2:Pointer; Length:Integer):Boolean;//0040997C
    function CompareText(const S1:AnsiString; const S2:AnsiString):Integer;//0040999C
    function SameText(const S1:AnsiString; const S2:AnsiString):Boolean;//004099F0
    function AnsiUpperCase(const S:AnsiString):AnsiString;//00409A14
    function AnsiLowerCase(const S:AnsiString):AnsiString;//00409A48
    function AnsiCompareStr(const S1:AnsiString; const S2:AnsiString):Integer;//00409A7C
    function AnsiCompareText(const S1:AnsiString; const S2:AnsiString):Integer;//00409AB4
    function AnsiSameText(const S1:AnsiString; const S2:AnsiString):Boolean;//00409AEC
    function AnsiStrLIComp(S1:PChar; S2:PChar; MaxLen:Cardinal):Integer;//00409B04
    function Trim(const S:AnsiString):AnsiString;//00409B24
    function IsValidIdent(const Ident:AnsiString):Boolean;//00409B74
    procedure CvtInt;//00409BD8
    function IntToStr(Value:Integer):AnsiString;//00409C24
    procedure CvtInt64;//00409C44
    function IntToStr(Value:Int64):AnsiString;//00409D10
    function IntToHex(Value:Integer; Digits:Integer):AnsiString;//00409D38
    function StrToInt(const S:AnsiString):Integer;//00409D60
    function StrToIntDef(const S:AnsiString; Default:Integer):Integer;//00409D9C
    function TryStrToInt(const S:AnsiString; var Value:Integer):Boolean;//00409DB4
    function TryStrToInt64(const S:AnsiString; var Value:Int64):Boolean;//00409DD4
    procedure VerifyBoolStrArray;//00409DF4
    //function CompareWith(const aArray:array[$0..-$1] of System.AnsiString; const _Dv_:?):Boolean;//00409E84
    function TryStrToBool(const S:AnsiString; var Value:Boolean):Boolean;//00409EC0
    function BoolToStr(B:Boolean; UseBoolStrs:Boolean):AnsiString;//00409F5C
    function FileOpen(const FileName:AnsiString; Mode:LongWord):Integer;//00409FA8
    function FileCreate(const FileName:AnsiString):Integer;//0040A000
    function FileCreate(const FileName:AnsiString; Rights:Integer):Integer;//0040A024
    function FileRead(Handle:Integer; var Buffer:void ; Count:LongWord):Integer;//0040A02C
    function FileWrite(Handle:Integer; const Buffer:void ; Count:LongWord):Integer;//0040A058
    function FileSeek(Handle:Integer; Origin:Integer; const Offset:Int64):Int64;//0040A084
    procedure FileClose(Handle:Integer);//0040A0BC
    function FileAge(const FileName:AnsiString):Integer;//0040A0C4
    function FileExists(const FileName:AnsiString):Boolean;//0040A12C
    function DirectoryExists(const Directory:AnsiString):Boolean;//0040A13C
    function AnsiLastChar(const S:AnsiString):PChar;//0040A160
    function LastDelimiter(const Delimiters:AnsiString; const S:AnsiString):Integer;//0040A190
    function ExtractFilePath(const FileName:AnsiString):AnsiString;//0040A1E0
    function ExtractFileName(const FileName:AnsiString):AnsiString;//0040A214
    function ExtractFileExt(const FileName:AnsiString):AnsiString;//0040A24C
    function ExpandFileName(const FileName:AnsiString):AnsiString;//0040A294
    function BackfillGetDiskFreeSpaceEx(Directory:PChar; var FreeAvailable:TLargeInteger; var TotalSpace:TLargeInteger; TotalFree:PLargeInteger):BOOL; stdcall;//0040A2D0
    function CreateDir(const Dir:AnsiString):Boolean;//0040A344
    function StrLen(const Str:PChar):Cardinal;//0040A360
    function StrEnd(const Str:PChar):PChar;//0040A378
    function StrMove(Dest:PChar; const Source:PChar; Count:Cardinal):PChar;//0040A38C
    function StrCopy(Dest:PChar; const Source:PChar):PChar;//0040A39C
    function StrLCopy(Dest:PChar; const Source:PChar; MaxLen:Cardinal):PChar;//0040A3C4
    function StrPCopy(Dest:PChar; const Source:AnsiString):PChar;//0040A3F8
    function StrPLCopy(Dest:PChar; const Source:AnsiString; MaxLen:Cardinal):PChar;//0040A41C
    function StrComp(const Str1:PChar; const Str2:PChar):Integer;//0040A43C
    function StrIComp(const Str1:PChar; const Str2:PChar):Integer;//0040A460
    function StrLIComp(const Str1:PChar; const Str2:PChar; MaxLen:Cardinal):Integer;//0040A4A0
    function StrScan(const Str:PChar; Chr:Char):PChar;//0040A4E4
    function StrPos(const Str1:PChar; const Str2:PChar):PChar;//0040A4F8
    function StrPas(const Str:PChar):AnsiString;//0040A54C
    function StrAlloc(Size:Cardinal):PChar;//0040A560
    function StrBufSize(const Str:PChar):Cardinal;//0040A574
    function StrNew(const Str:PChar):PChar;//0040A580
    procedure StrDispose(Str:PChar);//0040A5AC
    procedure FormatError(ErrorCode:Integer; Format:PChar; FmtLen:Cardinal);//0040A5BC
    procedure FormatVarToStr(var S:AnsiString; const V:TVarData);//0040A614
    procedure FormatClearStr(var S:AnsiString);//0040A638
    //function FormatBuf(var Buffer:void ; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):Cardinal;//0040A644
    //function StrFmt(Buffer:PChar; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):PChar;//0040A9BC
    //function StrLFmt(Buffer:PChar; MaxBufLen:Cardinal; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):PChar;//0040A9FC
    //function Format(const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):AnsiString;//0040AA3C
    //procedure FmtStr(var Result:AnsiString; const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);//0040AA50
    procedure PutExponent;//0040AB10
    function FloatToText(BufferArg:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer):Integer;//0040AB54
    function FloatToText(BufferArg:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer; const FormatSettings:TFormatSettings):Integer;//0040AE28
    procedure FloatToDecimal(var Result:TFloatRec; const Value:void ; ValueType:TFloatValue; Precision:Integer; Decimals:Integer);//0040B100
    function TextToFloat(Buffer:PChar; var Value:void ; ValueType:TFloatValue):Boolean;//0040B32C
    function FloatToStr(Value:Extended):AnsiString;//0040B440
    function FloatToStr(const FormatSettings:TFormatSettings; Value:Extended):AnsiString;//0040B470
    function CurrToStr(Value:Currency):AnsiString;//0040B4A4
    function TryStrToFloat(const S:AnsiString; var Value:Extended):Boolean;//0040B4D4
    function TryStrToFloat(const S:AnsiString; var Value:Double):Boolean;//0040B4F0
    function TryStrToFloat(const S:AnsiString; var Value:Single):Boolean;//0040B51C
    function TryStrToCurr(const S:AnsiString; var Value:Currency):Boolean;//0040B548
    function DateTimeToTimeStamp(DateTime:TDateTime):TTimeStamp;//0040B564
    function TryEncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word; var Time:TDateTime):Boolean;//0040B5A8
    function EncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word):TDateTime;//0040B618
    procedure DecodeTime(var Hour:Word; var Min:Word; var Sec:Word; const DateTime:TDateTime; var MSec:Word);//0040B658
    function IsLeapYear(Year:Word):Boolean;//0040B6B4
    function TryEncodeDate(Year:Word; Month:Word; Day:Word; var Date:TDateTime):Boolean;//0040B6F0
    function EncodeDate(Year:Word; Month:Word; Day:Word):TDateTime;//0040B7B8
    function DecodeDateFully(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime; var DOW:Word):Boolean;//0040B7E8
    procedure DecodeDate(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime);//0040B934
    function DayOfWeek(const DateTime:TDateTime):Word;//0040B954
    function Now:TDateTime;//0040B97C
    function CurrentYear:Word;//0040B9CC
    procedure AppendChars(P:PChar; Count:Integer);//0040B9E0
    procedure AppendString(const S:AnsiString);//0040BA24
    procedure AppendNumber(Number:Integer; Digits:Integer);//0040BA44
    procedure GetCount;//0040BA90
    procedure GetDate;//0040BABC
    procedure GetTime;//0040BAF4
    function ConvertEraString(const Count:Integer):AnsiString;//0040BB34
    function ConvertYearString(const Count:Integer):AnsiString;//0040BC9C
    procedure AppendFormat(Format:PChar);//0040BDA4
    procedure DateTimeToString(var Result:AnsiString; const Format:AnsiString; DateTime:TDateTime);//0040C558
    function DateTimeToStr(const DateTime:TDateTime):AnsiString;//0040C5B4
    procedure ScanBlanks(const S:AnsiString; var Pos:Integer);//0040C5C8
    function ScanNumber(const S:AnsiString; var Pos:Integer; var Number:Word; var CharCount:Byte):Boolean;//0040C5EC
    function ScanString(const S:AnsiString; var Pos:Integer; const Symbol:AnsiString):Boolean;//0040C680
    function ScanChar(const S:AnsiString; var Pos:Integer; Ch:Char):Boolean;//0040C70C
    function GetDateOrder(const DateFormat:AnsiString):TDateOrder;//0040C744
    procedure ScanToNumber(const S:AnsiString; var Pos:Integer);//0040C790
    function GetEraYearOffset(const Name:AnsiString):Integer;//0040C7D8
    function EraToYear(Year:Integer):Integer;//0040C82C
    function ScanDate(const S:AnsiString; var Pos:Integer; var Date:TDateTime):Boolean;//0040C888
    function ScanTime(const S:AnsiString; var Pos:Integer; var Time:TDateTime):Boolean;//0040CBCC
    function TryStrToDate(const S:AnsiString; var Value:TDateTime):Boolean;//0040CDC0
    function TryStrToTime(const S:AnsiString; var Value:TDateTime):Boolean;//0040CDF4
    function TryStrToDateTime(const S:AnsiString; var Value:TDateTime):Boolean;//0040CE28
    function SysErrorMessage(ErrorCode:Integer):AnsiString;//0040CEB4
    function GetLocaleStr(Locale:Integer; LocaleType:Integer; const Default:AnsiString):AnsiString;//0040CF00
    function GetLocaleChar(Locale:Integer; LocaleType:Integer; Default:Char):Char;//0040CF4C
    //function LocalGetLocaleStr(LocaleType:Integer; Index:Integer; const DefValues:array[$0..-$1] of System.Pointer; const _Dv_:?):AnsiString;//0040CF74
    procedure GetMonthDayNames;//0040CFB0
    function EnumEraNames(Names:PChar):Integer; stdcall;//0040D0D4
    function EnumEraYearOffsets(YearOffsets:PChar):Integer; stdcall;//0040D110
    procedure GetEraNamesAndYearOffsets;//0040D188
    function TranslateDateFormat(const FormatStr:AnsiString):AnsiString;//0040D238
    function ConvertAddr(Address:Pointer):Pointer;//0040D460
    function ExceptionErrorMessage(ExceptObject:TObject; ExceptAddr:Pointer; Buffer:PChar; Size:Integer):Integer;//0040D46C
    procedure ShowException(ExceptObject:TObject; ExceptAddr:Pointer);//0040D5F4
    function ReturnAddr:Pointer;//0040D6BC
    procedure Abort;//0040D6C0
    function CreateInOutError:EInOutError;//0040D898
    procedure ErrorHandler(ErrorCode:Byte; ErrorAddr:Pointer);//0040D918
    function CreateAssertException(const Message:AnsiString; const Filename:AnsiString; LineNumber:Integer):Exception;//0040D96C
    procedure RaiseAssertException(const E:Exception; const ErrorAddr:Pointer; const ErrorStack:Pointer);//0040DA18
    procedure AssertErrorHandler(const Message:AnsiString; const Filename:AnsiString; LineNumber:Integer; ErrorAddr:Pointer);//0040DA28
    procedure AbstractErrorHandler;//0040DA44
    function MapException(P:PExceptionRecord):TRuntimeError;//0040DA5C
    function GetExceptionClass(P:PExceptionRecord):ExceptClass;//0040DADC
    function CreateAVObject:Exception;//0040DAF4
    function GetExceptionObject(P:PExceptionRecord):Exception;//0040DCC0
    procedure ExceptHandler(ExceptObject:TObject; ExceptAddr:Pointer);//0040DD8C
    procedure InitExceptions;//0040DD9C
    procedure DoneExceptions;//0040DE20
    procedure InitPlatformId;//0040DEA0
    function CheckWin32Version(AMajor:Integer; AMinor:Integer):Boolean;//0040DF10
    function GetFileVersion(const AFileName:AnsiString):Cardinal;//0040DF30
    procedure Beep;//0040E01C
    function ByteTypeTest(P:PChar; Index:Integer):TMbcsByteType;//0040E024
    function ByteType(const S:AnsiString; Index:Integer):TMbcsByteType;//0040E09C
    function StrByteType(Str:PChar; Index:Cardinal):TMbcsByteType;//0040E0C0
    function ByteToCharLen(const S:AnsiString; MaxLen:Integer):Integer;//0040E0D8
    function ByteToCharIndex(const S:AnsiString; Index:Integer):Integer;//0040E100
    procedure CountChars(const S:AnsiString; MaxChars:Integer; var CharCount:Integer; var ByteCount:Integer);//0040E158
    function CharToByteIndex(const S:AnsiString; Index:Integer):Integer;//0040E1E8
    function CharToByteLen(const S:AnsiString; MaxLen:Integer):Integer;//0040E24C
    function StrCharLength(const Str:PChar):Integer;//0040E2AC
    function StrNextChar(const Str:PChar):PChar;//0040E2CC
    function CharLength(const S:AnsiString; Index:Integer):Integer;//0040E2D4
    function NextCharIndex(const S:AnsiString; Index:Integer):Integer;//0040E310
    function IsDelimiter(const Delimiters:AnsiString; const S:AnsiString; Index:Integer):Boolean;//0040E34C
    function AnsiPos(const Substr:AnsiString; const S:AnsiString):Integer;//0040E390
    function AnsiLowerCaseFileName(const S:AnsiString):AnsiString;//0040E3C8
    function AnsiStrPos(Str:PChar; SubStr:PChar):PChar;//0040E454
    function AnsiStrRScan(Str:PChar; Chr:Char):PChar;//0040E4F4
    function AnsiStrScan(Str:PChar; Chr:Char):PChar;//0040E51C
    function LCIDToCodePage(ALcid:LCID):Integer;//0040E55C
    procedure InitLeadBytes;//0040E5D0
    function IsWesternGroup:Boolean;//0040E630
    procedure InitSysLocale;//0040E648
    procedure GetFormatSettings;//0040E7BC
    function StringReplace(const S:AnsiString; const OldPattern:AnsiString; const NewPattern:AnsiString; Flags:TReplaceFlags):AnsiString;//0040EB34
    procedure Sleep; stdcall;//0040EC68
    procedure RaiseLastOSError;//0040EC70
    function Win32Check(RetVal:BOOL):BOOL;//0040ED0C
    function CallTerminateProcs:Boolean;//0040ED1C
    procedure FreeTerminateProcs;//0040ED38
    procedure InitDriveSpacePtr;//0040ED58
    function InterlockedIncrement(var I:Integer):Integer;//0040EDB4
    function InterlockedDecrement(var I:Integer):Integer;//0040EDC0
    function InterlockedExchange(var A:Integer; B:Integer):Integer;//0040EDCC
    function InterlockedExchangeAdd(var A:Integer; B:Integer):Integer;//0040EDD4
    procedure FreeAndNil(var Obj:void );//0040F1CC
    function Supports(const Instance:IInterface; const IID:TGUID; var Intf:void ):Boolean;//0040F1DC
    function Supports(const Instance:TObject; const IID:TGUID; var Intf:void ):Boolean;//0040F200
    function SafeLoadLibrary(const FileName:AnsiString; ErrorMode:UINT):HMODULE;//0040F298
    procedure _NF__C58;//0040F31C
    procedure _NF__C59;//0040F408

implementation

//004097F8
procedure DivMod(Dividend:Integer; Divisor:Word; var Result:Word; var Remainder:Word);
begin
{*
 004097F8    push        ebp
 004097F9    mov         ebp,esp
 004097FB    push        ebx
 004097FC    mov         ebx,edx
 004097FE    mov         edx,eax
 00409800    shr         edx,10
 00409803    div         ax,bx
 00409806    mov         ebx,dword ptr [ebp+8]
 00409809    mov         word ptr [ecx],ax
 0040980C    mov         word ptr [ebx],dx
 0040980F    pop         ebx
 00409810    pop         ebp
 00409811    ret         4
*}
end;

//00409814
procedure ConvertError(ResString:PResStringRec);
begin
{*
 00409814    push        ebx
 00409815    mov         ebx,eax
 00409817    mov         ecx,ebx
 00409819    mov         dl,1
 0040981B    mov         eax,[00409188];EConvertError
 00409820    call        Exception.CreateRes
 00409825    call        @RaiseExcept
 0040982A    pop         ebx
 0040982B    ret
*}
end;

//0040982C
{*procedure ConvertErrorFmt(ResString:PResStringRec; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);
begin
 0040982C    push        ebx
 0040982D    push        esi
 0040982E    push        edi
 0040982F    mov         edi,ecx
 00409831    mov         esi,edx
 00409833    mov         ebx,eax
 00409835    push        esi
 00409836    push        edi
 00409837    mov         ecx,ebx
 00409839    mov         dl,1
 0040983B    mov         eax,[00409188];EConvertError
 00409840    call        Exception.CreateResFmt
 00409845    call        @RaiseExcept
 0040984A    pop         edi
 0040984B    pop         esi
 0040984C    pop         ebx
 0040984D    ret
end;*}

//00409850
function AllocMem(Size:Cardinal):Pointer;
begin
{*
 00409850    push        ebx
 00409851    push        esi
 00409852    mov         ebx,eax
 00409854    mov         eax,ebx
 00409856    call        @GetMem
 0040985B    mov         esi,eax
 0040985D    mov         eax,esi
 0040985F    xor         ecx,ecx
 00409861    mov         edx,ebx
 00409863    call        @FillChar
 00409868    mov         eax,esi
 0040986A    pop         esi
 0040986B    pop         ebx
 0040986C    ret
*}
end;

//00409870
procedure DoExitProc;
begin
{*
 00409870    push        ebx
 00409871    mov         eax,[005AC1C0]
 00409876    mov         edx,dword ptr [eax]
 00409878    mov         dword ptr ds:[5AC1C0],edx
 0040987E    mov         edx,dword ptr ds:[5AE154];ExitProc:Pointer
 00409884    mov         ecx,dword ptr [eax+4]
 00409887    mov         dword ptr [edx],ecx
 00409889    mov         ebx,dword ptr [eax+8]
 0040988C    mov         edx,0C
 00409891    call        @FreeMem
 00409896    call        ebx
 00409898    pop         ebx
 00409899    ret
*}
end;

//0040989C
procedure AddExitProc(Proc:TProcedure);
begin
{*
 0040989C    push        ebx
 0040989D    mov         ebx,eax
 0040989F    mov         eax,0C
 004098A4    call        @GetMem
 004098A9    mov         edx,dword ptr ds:[5AC1C0]
 004098AF    mov         dword ptr [eax],edx
 004098B1    mov         edx,dword ptr ds:[5AE154];ExitProc:Pointer
 004098B7    mov         edx,dword ptr [edx]
 004098B9    mov         dword ptr [eax+4],edx
 004098BC    mov         dword ptr [eax+8],ebx
 004098BF    mov         [005AC1C0],eax
 004098C4    mov         eax,[005AE154];ExitProc:Pointer
 004098C9    mov         dword ptr [eax],409870;DoExitProc
 004098CF    pop         ebx
 004098D0    ret
*}
end;

//004098D4
function UpperCase(const S:AnsiString):AnsiString;
begin
{*
 004098D4    push        ebx
 004098D5    push        esi
 004098D6    push        edi
 004098D7    mov         edi,edx
 004098D9    mov         esi,eax
 004098DB    mov         eax,esi
 004098DD    call        @LStrLen
 004098E2    mov         ebx,eax
 004098E4    mov         eax,edi
 004098E6    mov         edx,ebx
 004098E8    call        @LStrSetLength
 004098ED    mov         edx,esi
 004098EF    mov         esi,dword ptr [edi]
 004098F1    test        ebx,ebx
>004098F3    je          0040990A
 004098F5    mov         al,byte ptr [edx]
 004098F7    cmp         al,61
>004098F9    jb          00409901
 004098FB    cmp         al,7A
>004098FD    ja          00409901
 004098FF    sub         al,20
 00409901    mov         byte ptr [esi],al
 00409903    inc         edx
 00409904    inc         esi
 00409905    dec         ebx
 00409906    test        ebx,ebx
>00409908    jne         004098F5
 0040990A    pop         edi
 0040990B    pop         esi
 0040990C    pop         ebx
 0040990D    ret
*}
end;

//00409910
function LowerCase(const S:AnsiString):AnsiString;
begin
{*
 00409910    push        ebx
 00409911    push        esi
 00409912    push        edi
 00409913    mov         edi,edx
 00409915    mov         esi,eax
 00409917    mov         eax,esi
 00409919    call        @LStrLen
 0040991E    mov         ebx,eax
 00409920    mov         eax,edi
 00409922    mov         edx,ebx
 00409924    call        @LStrSetLength
 00409929    mov         edx,esi
 0040992B    mov         esi,dword ptr [edi]
 0040992D    test        ebx,ebx
>0040992F    je          00409946
 00409931    mov         al,byte ptr [edx]
 00409933    cmp         al,41
>00409935    jb          0040993D
 00409937    cmp         al,5A
>00409939    ja          0040993D
 0040993B    add         al,20
 0040993D    mov         byte ptr [esi],al
 0040993F    inc         edx
 00409940    inc         esi
 00409941    dec         ebx
 00409942    test        ebx,ebx
>00409944    jne         00409931
 00409946    pop         edi
 00409947    pop         esi
 00409948    pop         ebx
 00409949    ret
*}
end;

//0040994C
function CompareStr(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 0040994C    push        esi
 0040994D    push        edi
 0040994E    mov         esi,eax
 00409950    mov         edi,edx
 00409952    or          eax,eax
>00409954    je          00409959
 00409956    mov         eax,dword ptr [eax-4]
 00409959    or          edx,edx
>0040995B    je          00409960
 0040995D    mov         edx,dword ptr [edx-4]
 00409960    mov         ecx,eax
 00409962    cmp         ecx,edx
>00409964    jbe         00409968
 00409966    mov         ecx,edx
 00409968    cmp         ecx,ecx
 0040996A    repe cmps   byte ptr [esi],byte ptr [edi]
>0040996C    je          00409976
 0040996E    movzx       eax,byte ptr [esi-1]
 00409972    movzx       edx,byte ptr [edi-1]
 00409976    sub         eax,edx
 00409978    pop         edi
 00409979    pop         esi
 0040997A    ret
*}
end;

//0040997C
function CompareMem(P1:Pointer; P2:Pointer; Length:Integer):Boolean;
begin
{*
 0040997C    push        esi
 0040997D    push        edi
 0040997E    mov         esi,eax
 00409980    mov         edi,edx
 00409982    mov         edx,ecx
 00409984    xor         eax,eax
 00409986    and         edx,3
 00409989    sar         ecx,2
>0040998C    js          00409998
 0040998E    repe cmps   dword ptr [esi],dword ptr [edi]
>00409990    jne         00409999
 00409992    mov         ecx,edx
 00409994    repe cmps   byte ptr [esi],byte ptr [edi]
>00409996    jne         00409999
 00409998    inc         eax
 00409999    pop         edi
 0040999A    pop         esi
 0040999B    ret
*}
end;

//0040999C
function CompareText(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 0040999C    push        esi
 0040999D    push        edi
 0040999E    push        ebx
 0040999F    mov         esi,eax
 004099A1    mov         edi,edx
 004099A3    or          eax,eax
>004099A5    je          004099AA
 004099A7    mov         eax,dword ptr [eax-4]
 004099AA    or          edx,edx
>004099AC    je          004099B1
 004099AE    mov         edx,dword ptr [edx-4]
 004099B1    mov         ecx,eax
 004099B3    cmp         ecx,edx
>004099B5    jbe         004099B9
 004099B7    mov         ecx,edx
 004099B9    cmp         ecx,ecx
 004099BB    repe cmps   byte ptr [esi],byte ptr [edi]
>004099BD    je          004099E9
 004099BF    mov         bl,byte ptr [esi-1]
 004099C2    cmp         bl,61
>004099C5    jb          004099CF
 004099C7    cmp         bl,7A
>004099CA    ja          004099CF
 004099CC    sub         bl,20
 004099CF    mov         bh,byte ptr [edi-1]
 004099D2    cmp         bh,61
>004099D5    jb          004099DF
 004099D7    cmp         bh,7A
>004099DA    ja          004099DF
 004099DC    sub         bh,20
 004099DF    cmp         bl,bh
>004099E1    je          004099BB
 004099E3    movzx       eax,bl
 004099E6    movzx       edx,bh
 004099E9    sub         eax,edx
 004099EB    pop         ebx
 004099EC    pop         edi
 004099ED    pop         esi
 004099EE    ret
*}
end;

//004099F0
function SameText(const S1:AnsiString; const S2:AnsiString):Boolean;
begin
{*
 004099F0    cmp         eax,edx
>004099F2    je          00409A0D
 004099F4    or          eax,eax
>004099F6    je          00409A0F
 004099F8    or          edx,edx
>004099FA    je          00409A10
 004099FC    mov         ecx,dword ptr [eax-4]
 004099FF    cmp         ecx,dword ptr [edx-4]
>00409A02    jne         00409A10
 00409A04    call        CompareText
 00409A09    test        eax,eax
>00409A0B    jne         00409A10
 00409A0D    mov         al,1
 00409A0F    ret
 00409A10    xor         eax,eax
 00409A12    ret
*}
end;

//00409A14
function AnsiUpperCase(const S:AnsiString):AnsiString;
begin
{*
 00409A14    push        ebx
 00409A15    push        esi
 00409A16    push        edi
 00409A17    mov         edi,edx
 00409A19    mov         esi,eax
 00409A1B    mov         eax,esi
 00409A1D    call        @LStrLen
 00409A22    mov         ebx,eax
 00409A24    mov         eax,esi
 00409A26    call        @LStrToPChar
 00409A2B    mov         edx,eax
 00409A2D    mov         eax,edi
 00409A2F    mov         ecx,ebx
 00409A31    call        @LStrFromPCharLen
 00409A36    test        ebx,ebx
>00409A38    jle         00409A43
 00409A3A    push        ebx
 00409A3B    mov         eax,dword ptr [edi]
 00409A3D    push        eax
 00409A3E    call        user32.CharUpperBuffA
 00409A43    pop         edi
 00409A44    pop         esi
 00409A45    pop         ebx
 00409A46    ret
*}
end;

//00409A48
function AnsiLowerCase(const S:AnsiString):AnsiString;
begin
{*
 00409A48    push        ebx
 00409A49    push        esi
 00409A4A    push        edi
 00409A4B    mov         edi,edx
 00409A4D    mov         esi,eax
 00409A4F    mov         eax,esi
 00409A51    call        @LStrLen
 00409A56    mov         ebx,eax
 00409A58    mov         eax,esi
 00409A5A    call        @LStrToPChar
 00409A5F    mov         edx,eax
 00409A61    mov         eax,edi
 00409A63    mov         ecx,ebx
 00409A65    call        @LStrFromPCharLen
 00409A6A    test        ebx,ebx
>00409A6C    jle         00409A77
 00409A6E    push        ebx
 00409A6F    mov         eax,dword ptr [edi]
 00409A71    push        eax
 00409A72    call        user32.CharLowerBuffA
 00409A77    pop         edi
 00409A78    pop         esi
 00409A79    pop         ebx
 00409A7A    ret
*}
end;

//00409A7C
function AnsiCompareStr(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 00409A7C    push        ebx
 00409A7D    push        esi
 00409A7E    mov         esi,edx
 00409A80    mov         ebx,eax
 00409A82    mov         eax,esi
 00409A84    call        @LStrLen
 00409A89    push        eax
 00409A8A    mov         eax,esi
 00409A8C    call        @LStrToPChar
 00409A91    push        eax
 00409A92    mov         eax,ebx
 00409A94    call        @LStrLen
 00409A99    push        eax
 00409A9A    mov         eax,ebx
 00409A9C    call        @LStrToPChar
 00409AA1    push        eax
 00409AA2    push        0
 00409AA4    push        400
 00409AA9    call        KERNEL32.CompareStringA
 00409AAE    sub         eax,2
 00409AB1    pop         esi
 00409AB2    pop         ebx
 00409AB3    ret
*}
end;

//00409AB4
function AnsiCompareText(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 00409AB4    push        ebx
 00409AB5    push        esi
 00409AB6    mov         esi,edx
 00409AB8    mov         ebx,eax
 00409ABA    mov         eax,esi
 00409ABC    call        @LStrLen
 00409AC1    push        eax
 00409AC2    mov         eax,esi
 00409AC4    call        @LStrToPChar
 00409AC9    push        eax
 00409ACA    mov         eax,ebx
 00409ACC    call        @LStrLen
 00409AD1    push        eax
 00409AD2    mov         eax,ebx
 00409AD4    call        @LStrToPChar
 00409AD9    push        eax
 00409ADA    push        1
 00409ADC    push        400
 00409AE1    call        KERNEL32.CompareStringA
 00409AE6    sub         eax,2
 00409AE9    pop         esi
 00409AEA    pop         ebx
 00409AEB    ret
*}
end;

//00409AEC
function AnsiSameText(const S1:AnsiString; const S2:AnsiString):Boolean;
begin
{*
 00409AEC    push        ebx
 00409AED    push        esi
 00409AEE    mov         esi,edx
 00409AF0    mov         ebx,eax
 00409AF2    mov         edx,esi
 00409AF4    mov         eax,ebx
 00409AF6    call        AnsiCompareText
 00409AFB    test        eax,eax
 00409AFD    sete        al
 00409B00    pop         esi
 00409B01    pop         ebx
 00409B02    ret
*}
end;

//00409B04
function AnsiStrLIComp(S1:PChar; S2:PChar; MaxLen:Cardinal):Integer;
begin
{*
 00409B04    push        ebx
 00409B05    push        esi
 00409B06    push        edi
 00409B07    mov         ebx,ecx
 00409B09    mov         edi,edx
 00409B0B    mov         esi,eax
 00409B0D    push        ebx
 00409B0E    push        edi
 00409B0F    push        ebx
 00409B10    push        esi
 00409B11    push        1
 00409B13    push        400
 00409B18    call        KERNEL32.CompareStringA
 00409B1D    sub         eax,2
 00409B20    pop         edi
 00409B21    pop         esi
 00409B22    pop         ebx
 00409B23    ret
*}
end;

//00409B24
function Trim(const S:AnsiString):AnsiString;
begin
{*
 00409B24    push        ebx
 00409B25    push        esi
 00409B26    push        edi
 00409B27    push        ebp
 00409B28    mov         ebp,edx
 00409B2A    mov         edi,eax
 00409B2C    mov         eax,edi
 00409B2E    call        @LStrLen
 00409B33    mov         esi,eax
 00409B35    mov         ebx,1
>00409B3A    jmp         00409B3D
 00409B3C    inc         ebx
 00409B3D    cmp         esi,ebx
>00409B3F    jl          00409B48
 00409B41    cmp         byte ptr [edi+ebx-1],20
>00409B46    jbe         00409B3C
 00409B48    cmp         esi,ebx
>00409B4A    jge         00409B56
 00409B4C    mov         eax,ebp
 00409B4E    call        @LStrClr
>00409B53    jmp         00409B6C
 00409B55    dec         esi
 00409B56    cmp         byte ptr [edi+esi-1],20
>00409B5B    jbe         00409B55
 00409B5D    push        ebp
 00409B5E    mov         ecx,esi
 00409B60    sub         ecx,ebx
 00409B62    inc         ecx
 00409B63    mov         edx,ebx
 00409B65    mov         eax,edi
 00409B67    call        @LStrCopy
 00409B6C    pop         ebp
 00409B6D    pop         edi
 00409B6E    pop         esi
 00409B6F    pop         ebx
 00409B70    ret
*}
end;

//00409B74
function IsValidIdent(const Ident:AnsiString):Boolean;
begin
{*
 00409B74    push        ebx
 00409B75    push        esi
 00409B76    push        edi
 00409B77    mov         esi,eax
 00409B79    xor         ebx,ebx
 00409B7B    mov         eax,esi
 00409B7D    call        @LStrLen
 00409B82    test        eax,eax
>00409B84    je          00409BD1
 00409B86    mov         al,byte ptr [esi]
 00409B88    add         al,0BF
 00409B8A    sub         al,1A
>00409B8C    jb          00409B98
 00409B8E    sub         al,4
>00409B90    je          00409B98
 00409B92    add         al,0FE
 00409B94    sub         al,1A
>00409B96    jae         00409BD1
 00409B98    mov         eax,esi
 00409B9A    call        @LStrLen
 00409B9F    sub         eax,2
>00409BA2    jl          00409BCF
 00409BA4    inc         eax
 00409BA5    mov         edi,2
 00409BAA    mov         dl,byte ptr [esi+edi-1]
 00409BAE    add         dl,0D0
 00409BB1    sub         dl,0A
>00409BB4    jb          00409BCB
 00409BB6    add         dl,0F9
 00409BB9    sub         dl,1A
>00409BBC    jb          00409BCB
 00409BBE    sub         dl,4
>00409BC1    je          00409BCB
 00409BC3    add         dl,0FE
 00409BC6    sub         dl,1A
>00409BC9    jae         00409BD1
 00409BCB    inc         edi
 00409BCC    dec         eax
>00409BCD    jne         00409BAA
 00409BCF    mov         bl,1
 00409BD1    mov         eax,ebx
 00409BD3    pop         edi
 00409BD4    pop         esi
 00409BD5    pop         ebx
 00409BD6    ret
*}
end;

//00409BD8
procedure CvtInt;
begin
{*
 00409BD8    or          cl,cl
>00409BDA    jne         00409BF3
 00409BDC    or          eax,eax
>00409BDE    jns         00409BEE
 00409BE0    neg         eax
 00409BE2    call        00409BEE
 00409BE7    mov         al,2D
 00409BE9    inc         ecx
 00409BEA    dec         esi
 00409BEB    mov         byte ptr [esi],al
 00409BED    ret
 00409BEE    mov         ecx,0A
 00409BF3    push        edx
 00409BF4    push        esi
 00409BF5    xor         edx,edx
 00409BF7    div         eax,ecx
 00409BF9    dec         esi
 00409BFA    add         dl,30
 00409BFD    cmp         dl,3A
>00409C00    jb          00409C05
 00409C02    add         dl,7
 00409C05    mov         byte ptr [esi],dl
 00409C07    or          eax,eax
>00409C09    jne         00409BF5
 00409C0B    pop         ecx
 00409C0C    pop         edx
 00409C0D    sub         ecx,esi
 00409C0F    sub         edx,ecx
>00409C11    jbe         00409C23
 00409C13    add         ecx,edx
 00409C15    mov         al,30
 00409C17    sub         esi,edx
>00409C19    jmp         00409C1E
 00409C1B    mov         byte ptr [edx+esi],al
 00409C1E    dec         edx
>00409C1F    jne         00409C1B
 00409C21    mov         byte ptr [esi],al
 00409C23    ret
*}
end;

//00409C24
function IntToStr(Value:Integer):AnsiString;
begin
{*
 00409C24    push        esi
 00409C25    mov         esi,esp
 00409C27    sub         esp,10
 00409C2A    xor         ecx,ecx
 00409C2C    push        edx
 00409C2D    xor         edx,edx
 00409C2F    call        CvtInt
 00409C34    mov         edx,esi
 00409C36    pop         eax
 00409C37    call        @LStrFromPCharLen
 00409C3C    add         esp,10
 00409C3F    pop         esi
 00409C40    ret
*}
end;

//00409C44
procedure CvtInt64;
begin
{*
 00409C44    or          cl,cl
>00409C46    jne         00409C78
 00409C48    mov         ecx,0A
 00409C4D    test        dword ptr [eax+4],80000000
>00409C54    je          00409C78
 00409C56    push        dword ptr [eax+4]
 00409C59    push        dword ptr [eax]
 00409C5B    mov         eax,esp
 00409C5D    neg         dword ptr [esp]
 00409C60    adc         dword ptr [esp+4],0
 00409C65    neg         dword ptr [esp+4]
 00409C69    call        00409C78
 00409C6E    mov         byte ptr [esi-1],2D
 00409C72    dec         esi
 00409C73    inc         ecx
 00409C74    add         esp,8
 00409C77    ret
*}
end;

//00409D10
function IntToStr(Value:Int64):AnsiString;
begin
{*
 00409D10    push        ebp
 00409D11    mov         ebp,esp
 00409D13    push        esi
 00409D14    mov         esi,esp
 00409D16    sub         esp,20
 00409D19    xor         ecx,ecx
 00409D1B    push        eax
 00409D1C    xor         edx,edx
 00409D1E    lea         eax,[ebp+8]
 00409D21    call        CvtInt64
 00409D26    mov         edx,esi
 00409D28    pop         eax
 00409D29    call        @LStrFromPCharLen
 00409D2E    add         esp,20
 00409D31    pop         esi
 00409D32    pop         ebp
 00409D33    ret         8
*}
end;

//00409D38
function IntToHex(Value:Integer; Digits:Integer):AnsiString;
begin
{*
 00409D38    cmp         edx,20
>00409D3B    jbe         00409D3F
 00409D3D    xor         edx,edx
 00409D3F    push        esi
 00409D40    mov         esi,esp
 00409D42    sub         esp,20
 00409D45    push        ecx
 00409D46    mov         ecx,10
 00409D4B    call        CvtInt
 00409D50    mov         edx,esi
 00409D52    pop         eax
 00409D53    call        @LStrFromPCharLen
 00409D58    add         esp,20
 00409D5B    pop         esi
 00409D5C    ret
*}
end;

//00409D60
function StrToInt(const S:AnsiString):Integer;
begin
{*
 00409D60    push        ebx
 00409D61    push        esi
 00409D62    add         esp,0FFFFFFF4
 00409D65    mov         ebx,eax
 00409D67    mov         edx,esp
 00409D69    mov         eax,ebx
 00409D6B    call        @ValLong
 00409D70    mov         esi,eax
 00409D72    cmp         dword ptr [esp],0
>00409D76    je          00409D91
 00409D78    mov         dword ptr [esp+4],ebx
 00409D7C    mov         byte ptr [esp+8],0B
 00409D81    lea         edx,[esp+4]
 00409D85    mov         eax,[005AE354];^SInvalidInteger:TResStringRec
 00409D8A    xor         ecx,ecx
 00409D8C    call        ConvertErrorFmt
 00409D91    mov         eax,esi
 00409D93    add         esp,0C
 00409D96    pop         esi
 00409D97    pop         ebx
 00409D98    ret
*}
end;

//00409D9C
function StrToIntDef(const S:AnsiString; Default:Integer):Integer;
begin
{*
 00409D9C    push        ebx
 00409D9D    push        ecx
 00409D9E    mov         ebx,edx
 00409DA0    mov         edx,esp
 00409DA2    call        @ValLong
 00409DA7    cmp         dword ptr [esp],0
>00409DAB    je          00409DAF
 00409DAD    mov         eax,ebx
 00409DAF    pop         edx
 00409DB0    pop         ebx
 00409DB1    ret
*}
end;

//00409DB4
function TryStrToInt(const S:AnsiString; var Value:Integer):Boolean;
begin
{*
 00409DB4    push        ebx
 00409DB5    push        esi
 00409DB6    push        ecx
 00409DB7    mov         esi,edx
 00409DB9    mov         ebx,eax
 00409DBB    mov         edx,esp
 00409DBD    mov         eax,ebx
 00409DBF    call        @ValLong
 00409DC4    mov         dword ptr [esi],eax
 00409DC6    cmp         dword ptr [esp],0
 00409DCA    sete        al
 00409DCD    pop         edx
 00409DCE    pop         esi
 00409DCF    pop         ebx
 00409DD0    ret
*}
end;

//00409DD4
function TryStrToInt64(const S:AnsiString; var Value:Int64):Boolean;
begin
{*
 00409DD4    push        ebx
 00409DD5    push        esi
 00409DD6    push        ecx
 00409DD7    mov         esi,edx
 00409DD9    mov         ebx,eax
 00409DDB    mov         edx,esp
 00409DDD    mov         eax,ebx
 00409DDF    call        @ValInt64
 00409DE4    mov         dword ptr [esi],eax
 00409DE6    mov         dword ptr [esi+4],edx
 00409DE9    cmp         dword ptr [esp],0
 00409DED    sete        al
 00409DF0    pop         edx
 00409DF1    pop         esi
 00409DF2    pop         ebx
 00409DF3    ret
*}
end;

//00409DF4
procedure VerifyBoolStrArray;
begin
{*
 00409DF4    mov         eax,[005E0858];TrueBoolStrs:_DT_74
 00409DF9    call        @DynArrayLength
 00409DFE    test        eax,eax
>00409E00    jne         00409E2B
 00409E02    push        1
 00409E04    mov         eax,5E0858;TrueBoolStrs:_DT_74
 00409E09    mov         ecx,1
 00409E0E    mov         edx,dword ptr ds:[409654];.74
 00409E14    call        @DynArraySetLength
 00409E19    add         esp,4
 00409E1C    mov         eax,[005E0858];TrueBoolStrs:_DT_74
 00409E21    mov         edx,409E6C;'True'
 00409E26    call        @LStrAsg
 00409E2B    mov         eax,[005E085C];FalseBoolStrs:_DT_84
 00409E30    call        @DynArrayLength
 00409E35    test        eax,eax
>00409E37    jne         00409E62
 00409E39    push        1
 00409E3B    mov         eax,5E085C;FalseBoolStrs:_DT_84
 00409E40    mov         ecx,1
 00409E45    mov         edx,dword ptr ds:[409678];.84
 00409E4B    call        @DynArraySetLength
 00409E50    add         esp,4
 00409E53    mov         eax,[005E085C];FalseBoolStrs:_DT_84
 00409E58    mov         edx,409E7C;'False'
 00409E5D    call        @LStrAsg
 00409E62    ret
*}
end;

//00409E84
{*function CompareWith(const aArray:array[$0..-$1] of System.AnsiString; const _Dv_:?):Boolean;
begin
 00409E84    push        ebp
 00409E85    mov         ebp,esp
 00409E87    push        ecx
 00409E88    push        ebx
 00409E89    push        esi
 00409E8A    push        edi
 00409E8B    mov         byte ptr [ebp-1],0
 00409E8F    mov         esi,edx
 00409E91    test        esi,esi
>00409E93    jl          00409EB5
 00409E95    inc         esi
 00409E96    mov         ebx,eax
 00409E98    mov         eax,dword ptr [ebp+8]
 00409E9B    mov         eax,dword ptr [eax-4]
 00409E9E    mov         edx,dword ptr [ebx]
 00409EA0    call        AnsiSameText
 00409EA5    test        al,al
>00409EA7    je          00409EAF
 00409EA9    mov         byte ptr [ebp-1],1
>00409EAD    jmp         00409EB5
 00409EAF    add         ebx,4
 00409EB2    dec         esi
>00409EB3    jne         00409E98
 00409EB5    mov         al,byte ptr [ebp-1]
 00409EB8    pop         edi
 00409EB9    pop         esi
 00409EBA    pop         ebx
 00409EBB    pop         ecx
 00409EBC    pop         ebp
 00409EBD    ret
end;*}

//00409EC0
function TryStrToBool(const S:AnsiString; var Value:Boolean):Boolean;
begin
{*
 00409EC0    push        ebp
 00409EC1    mov         ebp,esp
 00409EC3    add         esp,0FFFFFFF0
 00409EC6    push        ebx
 00409EC7    mov         ebx,edx
 00409EC9    mov         dword ptr [ebp-4],eax
 00409ECC    lea         edx,[ebp-10]
 00409ECF    mov         eax,dword ptr [ebp-4]
 00409ED2    call        TryStrToFloat
 00409ED7    mov         edx,eax
 00409ED9    test        dl,dl
>00409EDB    je          00409EEE
 00409EDD    fld         tbyte ptr [ebp-10]
 00409EE0    fcomp       dword ptr ds:[409F40]
 00409EE6    fnstsw      al
 00409EE8    sahf
 00409EE9    setne       byte ptr [ebx]
>00409EEC    jmp         00409F37
 00409EEE    call        VerifyBoolStrArray
 00409EF3    push        ebp
 00409EF4    mov         eax,[005E0858];TrueBoolStrs:_DT_74
 00409EF9    call        @DynArrayHigh
 00409EFE    mov         edx,eax
 00409F00    mov         eax,[005E0858];TrueBoolStrs:_DT_74
 00409F05    call        CompareWith
 00409F0A    pop         ecx
 00409F0B    mov         edx,eax
 00409F0D    test        dl,dl
>00409F0F    je          00409F16
 00409F11    mov         byte ptr [ebx],1
>00409F14    jmp         00409F37
 00409F16    push        ebp
 00409F17    mov         eax,[005E085C];FalseBoolStrs:_DT_84
 00409F1C    call        @DynArrayHigh
 00409F21    mov         edx,eax
 00409F23    mov         eax,[005E085C];FalseBoolStrs:_DT_84
 00409F28    call        CompareWith
 00409F2D    pop         ecx
 00409F2E    mov         edx,eax
 00409F30    test        dl,dl
>00409F32    je          00409F37
 00409F34    mov         byte ptr [ebx],0
 00409F37    mov         eax,edx
 00409F39    pop         ebx
 00409F3A    mov         esp,ebp
 00409F3C    pop         ebp
 00409F3D    ret
*}
end;

//00409F5C
function BoolToStr(B:Boolean; UseBoolStrs:Boolean):AnsiString;
begin
{*
 00409F5C    push        ebx
 00409F5D    push        esi
 00409F5E    mov         esi,ecx
 00409F60    mov         ebx,eax
 00409F62    test        dl,dl
>00409F64    je          00409F92
 00409F66    call        VerifyBoolStrArray
 00409F6B    test        bl,bl
>00409F6D    je          00409F80
 00409F6F    mov         eax,esi
 00409F71    mov         edx,dword ptr ds:[5E0858];TrueBoolStrs:_DT_74
 00409F77    mov         edx,dword ptr [edx]
 00409F79    call        @LStrAsg
>00409F7E    jmp         00409FA4
 00409F80    mov         eax,esi
 00409F82    mov         edx,dword ptr ds:[5E085C];FalseBoolStrs:_DT_84
 00409F88    mov         edx,dword ptr [edx]
 00409F8A    call        @LStrAsg
 00409F8F    pop         esi
 00409F90    pop         ebx
 00409F91    ret
 00409F92    mov         eax,esi
 00409F94    xor         edx,edx
 00409F96    mov         dl,bl
 00409F98    mov         edx,dword ptr [edx*4+5AC1C4];gvar_005AC1C4:array[2] of ?
 00409F9F    call        @LStrAsg
 00409FA4    pop         esi
 00409FA5    pop         ebx
 00409FA6    ret
*}
end;

//00409FA8
function FileOpen(const FileName:AnsiString; Mode:LongWord):Integer;
begin
{*
 00409FA8    push        ebx
 00409FA9    push        esi
 00409FAA    push        edi
 00409FAB    mov         ebx,edx
 00409FAD    mov         edi,eax
 00409FAF    or          eax,0FFFFFFFF
 00409FB2    mov         esi,ebx
 00409FB4    and         esi,3
 00409FB7    cmp         esi,2
>00409FBA    ja          00409FFB
 00409FBC    mov         edx,ebx
 00409FBE    and         edx,0F0
 00409FC4    cmp         edx,40
>00409FC7    ja          00409FFB
 00409FC9    push        0
 00409FCB    push        80
 00409FD0    push        3
 00409FD2    push        0
 00409FD4    mov         eax,ebx
 00409FD6    and         eax,0F0
 00409FDB    shr         eax,4
 00409FDE    mov         eax,dword ptr [eax*4+5AC1D8]
 00409FE5    push        eax
 00409FE6    mov         eax,dword ptr [esi*4+5AC1CC]
 00409FED    push        eax
 00409FEE    mov         eax,edi
 00409FF0    call        @LStrToPChar
 00409FF5    push        eax
 00409FF6    call        KERNEL32.CreateFileA
 00409FFB    pop         edi
 00409FFC    pop         esi
 00409FFD    pop         ebx
 00409FFE    ret
*}
end;

//0040A000
function FileCreate(const FileName:AnsiString):Integer;
begin
{*
 0040A000    push        ebx
 0040A001    mov         ebx,eax
 0040A003    push        0
 0040A005    push        80
 0040A00A    push        2
 0040A00C    push        0
 0040A00E    push        0
 0040A010    push        0C0000000
 0040A015    mov         eax,ebx
 0040A017    call        @LStrToPChar
 0040A01C    push        eax
 0040A01D    call        KERNEL32.CreateFileA
 0040A022    pop         ebx
 0040A023    ret
*}
end;

//0040A024
function FileCreate(const FileName:AnsiString; Rights:Integer):Integer;
begin
{*
 0040A024    call        FileCreate
 0040A029    ret
*}
end;

//0040A02C
function FileRead(Handle:Integer; var Buffer:void ; Count:LongWord):Integer;
begin
{*
 0040A02C    push        ebx
 0040A02D    push        esi
 0040A02E    push        edi
 0040A02F    push        ecx
 0040A030    mov         edi,ecx
 0040A032    mov         esi,edx
 0040A034    mov         ebx,eax
 0040A036    push        0
 0040A038    lea         eax,[esp+4]
 0040A03C    push        eax
 0040A03D    push        edi
 0040A03E    push        esi
 0040A03F    push        ebx
 0040A040    call        KERNEL32.ReadFile
 0040A045    test        eax,eax
>0040A047    jne         0040A050
 0040A049    mov         dword ptr [esp],0FFFFFFFF
 0040A050    mov         eax,dword ptr [esp]
 0040A053    pop         edx
 0040A054    pop         edi
 0040A055    pop         esi
 0040A056    pop         ebx
 0040A057    ret
*}
end;

//0040A058
function FileWrite(Handle:Integer; const Buffer:void ; Count:LongWord):Integer;
begin
{*
 0040A058    push        ebx
 0040A059    push        esi
 0040A05A    push        edi
 0040A05B    push        ecx
 0040A05C    mov         edi,ecx
 0040A05E    mov         esi,edx
 0040A060    mov         ebx,eax
 0040A062    push        0
 0040A064    lea         eax,[esp+4]
 0040A068    push        eax
 0040A069    push        edi
 0040A06A    push        esi
 0040A06B    push        ebx
 0040A06C    call        KERNEL32.WriteFile
 0040A071    test        eax,eax
>0040A073    jne         0040A07C
 0040A075    mov         dword ptr [esp],0FFFFFFFF
 0040A07C    mov         eax,dword ptr [esp]
 0040A07F    pop         edx
 0040A080    pop         edi
 0040A081    pop         esi
 0040A082    pop         ebx
 0040A083    ret
*}
end;

//0040A084
function FileSeek(Handle:Integer; Origin:Integer; const Offset:Int64):Int64;
begin
{*
 0040A084    push        ebp
 0040A085    mov         ebp,esp
 0040A087    add         esp,0FFFFFFF8
 0040A08A    push        ebx
 0040A08B    push        esi
 0040A08C    mov         esi,edx
 0040A08E    mov         ebx,eax
 0040A090    mov         eax,dword ptr [ebp+8]
 0040A093    mov         dword ptr [ebp-8],eax
 0040A096    mov         eax,dword ptr [ebp+0C]
 0040A099    mov         dword ptr [ebp-4],eax
 0040A09C    push        esi
 0040A09D    lea         eax,[ebp-4]
 0040A0A0    push        eax
 0040A0A1    mov         eax,dword ptr [ebp-8]
 0040A0A4    push        eax
 0040A0A5    push        ebx
 0040A0A6    call        KERNEL32.SetFilePointer
 0040A0AB    mov         dword ptr [ebp-8],eax
 0040A0AE    mov         eax,dword ptr [ebp-8]
 0040A0B1    mov         edx,dword ptr [ebp-4]
 0040A0B4    pop         esi
 0040A0B5    pop         ebx
 0040A0B6    pop         ecx
 0040A0B7    pop         ecx
 0040A0B8    pop         ebp
 0040A0B9    ret         8
*}
end;

//0040A0BC
procedure FileClose(Handle:Integer);
begin
{*
 0040A0BC    push        eax
 0040A0BD    call        KERNEL32.CloseHandle
 0040A0C2    ret
*}
end;

//0040A0C4
function FileAge(const FileName:AnsiString):Integer;
begin
{*
 0040A0C4    push        ebp
 0040A0C5    mov         ebp,esp
 0040A0C7    add         esp,0FFFFFEB4
 0040A0CD    push        ebx
 0040A0CE    mov         ebx,eax
 0040A0D0    lea         eax,[ebp-14C]
 0040A0D6    push        eax
 0040A0D7    mov         eax,ebx
 0040A0D9    call        @LStrToPChar
 0040A0DE    push        eax
 0040A0DF    call        KERNEL32.FindFirstFileA
 0040A0E4    cmp         eax,0FFFFFFFF
>0040A0E7    je          0040A11D
 0040A0E9    push        eax
 0040A0EA    call        KERNEL32.FindClose
 0040A0EF    test        byte ptr [ebp-14C],10
>0040A0F6    jne         0040A11D
 0040A0F8    lea         eax,[ebp-0C]
 0040A0FB    push        eax
 0040A0FC    lea         eax,[ebp-138]
 0040A102    push        eax
 0040A103    call        KERNEL32.FileTimeToLocalFileTime
 0040A108    lea         eax,[ebp-4]
 0040A10B    push        eax
 0040A10C    lea         eax,[ebp-2]
 0040A10F    push        eax
 0040A110    lea         eax,[ebp-0C]
 0040A113    push        eax
 0040A114    call        KERNEL32.FileTimeToDosDateTime
 0040A119    test        eax,eax
>0040A11B    jne         0040A124
 0040A11D    mov         dword ptr [ebp-4],0FFFFFFFF
 0040A124    mov         eax,dword ptr [ebp-4]
 0040A127    pop         ebx
 0040A128    mov         esp,ebp
 0040A12A    pop         ebp
 0040A12B    ret
*}
end;

//0040A12C
function FileExists(const FileName:AnsiString):Boolean;
begin
{*
 0040A12C    push        ebx
 0040A12D    mov         ebx,eax
 0040A12F    mov         eax,ebx
 0040A131    call        FileAge
 0040A136    inc         eax
 0040A137    setne       al
 0040A13A    pop         ebx
 0040A13B    ret
*}
end;

//0040A13C
function DirectoryExists(const Directory:AnsiString):Boolean;
begin
{*
 0040A13C    push        ebx
 0040A13D    mov         ebx,eax
 0040A13F    mov         eax,ebx
 0040A141    call        @LStrToPChar
 0040A146    push        eax
 0040A147    call        KERNEL32.GetFileAttributesA
 0040A14C    cmp         eax,0FFFFFFFF
>0040A14F    je          0040A155
 0040A151    test        al,10
>0040A153    jne         0040A159
 0040A155    xor         eax,eax
 0040A157    pop         ebx
 0040A158    ret
 0040A159    mov         al,1
 0040A15B    pop         ebx
 0040A15C    ret
*}
end;

//0040A160
function AnsiLastChar(const S:AnsiString):PChar;
begin
{*
 0040A160    push        ebx
 0040A161    push        esi
 0040A162    mov         esi,eax
 0040A164    mov         eax,esi
 0040A166    call        @LStrLen
 0040A16B    mov         ebx,eax
 0040A16D    test        ebx,ebx
>0040A16F    je          0040A188
>0040A171    jmp         0040A174
 0040A173    dec         ebx
 0040A174    mov         edx,ebx
 0040A176    mov         eax,esi
 0040A178    call        ByteType
 0040A17D    cmp         al,2
>0040A17F    je          0040A173
 0040A181    lea         eax,[esi+ebx-1]
 0040A185    pop         esi
 0040A186    pop         ebx
 0040A187    ret
 0040A188    xor         eax,eax
 0040A18A    pop         esi
 0040A18B    pop         ebx
 0040A18C    ret
*}
end;

//0040A190
function LastDelimiter(const Delimiters:AnsiString; const S:AnsiString):Integer;
begin
{*
 0040A190    push        ebx
 0040A191    push        esi
 0040A192    push        edi
 0040A193    push        ebp
 0040A194    mov         esi,edx
 0040A196    mov         ebx,eax
 0040A198    mov         eax,esi
 0040A19A    call        @LStrLen
 0040A19F    mov         edi,eax
 0040A1A1    mov         eax,ebx
 0040A1A3    call        @LStrToPChar
 0040A1A8    mov         ebp,eax
 0040A1AA    test        edi,edi
>0040A1AC    jle         0040A1D6
 0040A1AE    mov         bl,byte ptr [esi+edi-1]
 0040A1B2    test        bl,bl
>0040A1B4    je          0040A1D1
 0040A1B6    mov         edx,ebx
 0040A1B8    mov         eax,ebp
 0040A1BA    call        StrScan
 0040A1BF    test        eax,eax
>0040A1C1    je          0040A1D1
 0040A1C3    mov         edx,edi
 0040A1C5    mov         eax,esi
 0040A1C7    call        ByteType
 0040A1CC    cmp         al,2
>0040A1CE    jne         0040A1D6
 0040A1D0    dec         edi
 0040A1D1    dec         edi
 0040A1D2    test        edi,edi
>0040A1D4    jg          0040A1AE
 0040A1D6    mov         eax,edi
 0040A1D8    pop         ebp
 0040A1D9    pop         edi
 0040A1DA    pop         esi
 0040A1DB    pop         ebx
 0040A1DC    ret
*}
end;

//0040A1E0
function ExtractFilePath(const FileName:AnsiString):AnsiString;
begin
{*
 0040A1E0    push        ebx
 0040A1E1    push        esi
 0040A1E2    push        edi
 0040A1E3    mov         edi,edx
 0040A1E5    mov         ebx,eax
 0040A1E7    mov         edx,ebx
 0040A1E9    mov         eax,40A210;'\:'
 0040A1EE    call        LastDelimiter
 0040A1F3    mov         esi,eax
 0040A1F5    push        edi
 0040A1F6    mov         ecx,esi
 0040A1F8    mov         edx,1
 0040A1FD    mov         eax,ebx
 0040A1FF    call        @LStrCopy
 0040A204    pop         edi
 0040A205    pop         esi
 0040A206    pop         ebx
 0040A207    ret
*}
end;

//0040A214
function ExtractFileName(const FileName:AnsiString):AnsiString;
begin
{*
 0040A214    push        ebx
 0040A215    push        esi
 0040A216    push        edi
 0040A217    mov         edi,edx
 0040A219    mov         ebx,eax
 0040A21B    mov         edx,ebx
 0040A21D    mov         eax,40A248;'\:'
 0040A222    call        LastDelimiter
 0040A227    mov         esi,eax
 0040A229    push        edi
 0040A22A    lea         edx,[esi+1]
 0040A22D    mov         ecx,7FFFFFFF
 0040A232    mov         eax,ebx
 0040A234    call        @LStrCopy
 0040A239    pop         edi
 0040A23A    pop         esi
 0040A23B    pop         ebx
 0040A23C    ret
*}
end;

//0040A24C
function ExtractFileExt(const FileName:AnsiString):AnsiString;
begin
{*
 0040A24C    push        ebx
 0040A24D    push        esi
 0040A24E    push        edi
 0040A24F    mov         edi,edx
 0040A251    mov         esi,eax
 0040A253    mov         edx,esi
 0040A255    mov         eax,40A290;'.\:'
 0040A25A    call        LastDelimiter
 0040A25F    mov         ebx,eax
 0040A261    test        ebx,ebx
>0040A263    jle         0040A27D
 0040A265    cmp         byte ptr [esi+ebx-1],2E
>0040A26A    jne         0040A27D
 0040A26C    push        edi
 0040A26D    mov         ecx,7FFFFFFF
 0040A272    mov         edx,ebx
 0040A274    mov         eax,esi
 0040A276    call        @LStrCopy
>0040A27B    jmp         0040A284
 0040A27D    mov         eax,edi
 0040A27F    call        @LStrClr
 0040A284    pop         edi
 0040A285    pop         esi
 0040A286    pop         ebx
 0040A287    ret
*}
end;

//0040A294
function ExpandFileName(const FileName:AnsiString):AnsiString;
begin
{*
 0040A294    push        ebx
 0040A295    push        esi
 0040A296    add         esp,0FFFFFEF8
 0040A29C    mov         esi,edx
 0040A29E    mov         ebx,eax
 0040A2A0    push        esp
 0040A2A1    lea         eax,[esp+8]
 0040A2A5    push        eax
 0040A2A6    push        104
 0040A2AB    mov         eax,ebx
 0040A2AD    call        @LStrToPChar
 0040A2B2    push        eax
 0040A2B3    call        KERNEL32.GetFullPathNameA
 0040A2B8    mov         ecx,eax
 0040A2BA    lea         edx,[esp+4]
 0040A2BE    mov         eax,esi
 0040A2C0    call        @LStrFromPCharLen
 0040A2C5    add         esp,108
 0040A2CB    pop         esi
 0040A2CC    pop         ebx
 0040A2CD    ret
*}
end;

//0040A2D0
function BackfillGetDiskFreeSpaceEx(Directory:PChar; var FreeAvailable:TLargeInteger; var TotalSpace:TLargeInteger; TotalFree:PLargeInteger):BOOL; stdcall;
begin
{*
 0040A2D0    push        ebp
 0040A2D1    mov         ebp,esp
 0040A2D3    add         esp,0FFFFFFE8
 0040A2D6    push        ebx
 0040A2D7    mov         eax,dword ptr [ebp+8]
 0040A2DA    test        eax,eax
>0040A2DC    jne         0040A2E0
 0040A2DE    xor         eax,eax
 0040A2E0    lea         edx,[ebp-10]
 0040A2E3    push        edx
 0040A2E4    lea         edx,[ebp-0C]
 0040A2E7    push        edx
 0040A2E8    lea         edx,[ebp-8]
 0040A2EB    push        edx
 0040A2EC    lea         edx,[ebp-4]
 0040A2EF    push        edx
 0040A2F0    push        eax
 0040A2F1    call        KERNEL32.GetDiskFreeSpaceA
 0040A2F6    mov         ebx,eax
 0040A2F8    mov         eax,dword ptr [ebp-4]
 0040A2FB    imul        dword ptr [ebp-8]
 0040A2FE    xor         edx,edx
 0040A300    mov         dword ptr [ebp-18],eax
 0040A303    mov         dword ptr [ebp-14],edx
 0040A306    mov         eax,dword ptr [ebp-0C]
 0040A309    xor         edx,edx
 0040A30B    push        edx
 0040A30C    push        eax
 0040A30D    mov         eax,dword ptr [ebp-18]
 0040A310    mov         edx,dword ptr [ebp-14]
 0040A313    call        @_llmul
 0040A318    mov         ecx,dword ptr [ebp+0C]
 0040A31B    mov         dword ptr [ecx],eax
 0040A31D    mov         dword ptr [ecx+4],edx
 0040A320    mov         eax,dword ptr [ebp-10]
 0040A323    xor         edx,edx
 0040A325    push        edx
 0040A326    push        eax
 0040A327    mov         eax,dword ptr [ebp-18]
 0040A32A    mov         edx,dword ptr [ebp-14]
 0040A32D    call        @_llmul
 0040A332    mov         ecx,dword ptr [ebp+10]
 0040A335    mov         dword ptr [ecx],eax
 0040A337    mov         dword ptr [ecx+4],edx
 0040A33A    mov         eax,ebx
 0040A33C    pop         ebx
 0040A33D    mov         esp,ebp
 0040A33F    pop         ebp
 0040A340    ret         10
*}
end;

//0040A344
function CreateDir(const Dir:AnsiString):Boolean;
begin
{*
 0040A344    push        ebx
 0040A345    mov         ebx,eax
 0040A347    push        0
 0040A349    mov         eax,ebx
 0040A34B    call        @LStrToPChar
 0040A350    push        eax
 0040A351    call        KERNEL32.CreateDirectoryA
 0040A356    cmp         eax,1
 0040A359    sbb         eax,eax
 0040A35B    inc         eax
 0040A35C    pop         ebx
 0040A35D    ret
*}
end;

//0040A360
function StrLen(const Str:PChar):Cardinal;
begin
{*
 0040A360    mov         edx,edi
 0040A362    mov         edi,eax
 0040A364    mov         ecx,0FFFFFFFF
 0040A369    xor         al,al
 0040A36B    repne scas  byte ptr [edi]
 0040A36D    mov         eax,0FFFFFFFE
 0040A372    sub         eax,ecx
 0040A374    mov         edi,edx
 0040A376    ret
*}
end;

//0040A378
function StrEnd(const Str:PChar):PChar;
begin
{*
 0040A378    mov         edx,edi
 0040A37A    mov         edi,eax
 0040A37C    mov         ecx,0FFFFFFFF
 0040A381    xor         al,al
 0040A383    repne scas  byte ptr [edi]
 0040A385    lea         eax,[edi-1]
 0040A388    mov         edi,edx
 0040A38A    ret
*}
end;

//0040A38C
function StrMove(Dest:PChar; const Source:PChar; Count:Cardinal):PChar;
begin
{*
 0040A38C    push        esi
 0040A38D    mov         esi,eax
 0040A38F    xchg        eax,edx
 0040A390    call        Move
 0040A395    mov         eax,esi
 0040A397    pop         esi
 0040A398    ret
*}
end;

//0040A39C
function StrCopy(Dest:PChar; const Source:PChar):PChar;
begin
{*
 0040A39C    push        edi
 0040A39D    push        esi
 0040A39E    mov         esi,eax
 0040A3A0    mov         edi,edx
 0040A3A2    mov         ecx,0FFFFFFFF
 0040A3A7    xor         al,al
 0040A3A9    repne scas  byte ptr [edi]
 0040A3AB    not         ecx
 0040A3AD    mov         edi,esi
 0040A3AF    mov         esi,edx
 0040A3B1    mov         edx,ecx
 0040A3B3    mov         eax,edi
 0040A3B5    shr         ecx,2
 0040A3B8    rep movs    dword ptr [edi],dword ptr [esi]
 0040A3BA    mov         ecx,edx
 0040A3BC    and         ecx,3
 0040A3BF    rep movs    byte ptr [edi],byte ptr [esi]
 0040A3C1    pop         esi
 0040A3C2    pop         edi
 0040A3C3    ret
*}
end;

//0040A3C4
function StrLCopy(Dest:PChar; const Source:PChar; MaxLen:Cardinal):PChar;
begin
{*
 0040A3C4    push        edi
 0040A3C5    push        esi
 0040A3C6    push        ebx
 0040A3C7    mov         esi,eax
 0040A3C9    mov         edi,edx
 0040A3CB    mov         ebx,ecx
 0040A3CD    xor         al,al
 0040A3CF    test        ecx,ecx
>0040A3D1    je          0040A3D8
 0040A3D3    repne scas  byte ptr [edi]
>0040A3D5    jne         0040A3D8
 0040A3D7    inc         ecx
 0040A3D8    sub         ebx,ecx
 0040A3DA    mov         edi,esi
 0040A3DC    mov         esi,edx
 0040A3DE    mov         edx,edi
 0040A3E0    mov         ecx,ebx
 0040A3E2    shr         ecx,2
 0040A3E5    rep movs    dword ptr [edi],dword ptr [esi]
 0040A3E7    mov         ecx,ebx
 0040A3E9    and         ecx,3
 0040A3EC    rep movs    byte ptr [edi],byte ptr [esi]
 0040A3EE    stos        byte ptr [edi]
 0040A3EF    mov         eax,edx
 0040A3F1    pop         ebx
 0040A3F2    pop         esi
 0040A3F3    pop         edi
 0040A3F4    ret
*}
end;

//0040A3F8
function StrPCopy(Dest:PChar; const Source:AnsiString):PChar;
begin
{*
 0040A3F8    push        ebx
 0040A3F9    push        esi
 0040A3FA    mov         ebx,edx
 0040A3FC    mov         esi,eax
 0040A3FE    mov         eax,ebx
 0040A400    call        @LStrLen
 0040A405    push        eax
 0040A406    mov         eax,ebx
 0040A408    call        @LStrToPChar
 0040A40D    mov         edx,eax
 0040A40F    mov         eax,esi
 0040A411    pop         ecx
 0040A412    call        StrLCopy
 0040A417    pop         esi
 0040A418    pop         ebx
 0040A419    ret
*}
end;

//0040A41C
function StrPLCopy(Dest:PChar; const Source:AnsiString; MaxLen:Cardinal):PChar;
begin
{*
 0040A41C    push        ebx
 0040A41D    push        esi
 0040A41E    push        edi
 0040A41F    mov         edi,ecx
 0040A421    mov         esi,edx
 0040A423    mov         ebx,eax
 0040A425    mov         eax,esi
 0040A427    call        @LStrToPChar
 0040A42C    mov         edx,eax
 0040A42E    mov         ecx,edi
 0040A430    mov         eax,ebx
 0040A432    call        StrLCopy
 0040A437    pop         edi
 0040A438    pop         esi
 0040A439    pop         ebx
 0040A43A    ret
*}
end;

//0040A43C
function StrComp(const Str1:PChar; const Str2:PChar):Integer;
begin
{*
 0040A43C    push        edi
 0040A43D    push        esi
 0040A43E    mov         edi,edx
 0040A440    mov         esi,eax
 0040A442    mov         ecx,0FFFFFFFF
 0040A447    xor         eax,eax
 0040A449    repne scas  byte ptr [edi]
 0040A44B    not         ecx
 0040A44D    mov         edi,edx
 0040A44F    xor         edx,edx
 0040A451    repe cmps   byte ptr [esi],byte ptr [edi]
 0040A453    mov         al,byte ptr [esi-1]
 0040A456    mov         dl,byte ptr [edi-1]
 0040A459    sub         eax,edx
 0040A45B    pop         esi
 0040A45C    pop         edi
 0040A45D    ret
*}
end;

//0040A460
function StrIComp(const Str1:PChar; const Str2:PChar):Integer;
begin
{*
 0040A460    push        edi
 0040A461    push        esi
 0040A462    mov         edi,edx
 0040A464    mov         esi,eax
 0040A466    mov         ecx,0FFFFFFFF
 0040A46B    xor         eax,eax
 0040A46D    repne scas  byte ptr [edi]
 0040A46F    not         ecx
 0040A471    mov         edi,edx
 0040A473    xor         edx,edx
 0040A475    repe cmps   byte ptr [esi],byte ptr [edi]
>0040A477    je          0040A49A
 0040A479    mov         al,byte ptr [esi-1]
 0040A47C    cmp         al,61
>0040A47E    jb          0040A486
 0040A480    cmp         al,7A
>0040A482    ja          0040A486
 0040A484    sub         al,20
 0040A486    mov         dl,byte ptr [edi-1]
 0040A489    cmp         dl,61
>0040A48C    jb          0040A496
 0040A48E    cmp         dl,7A
>0040A491    ja          0040A496
 0040A493    sub         dl,20
 0040A496    sub         eax,edx
>0040A498    je          0040A475
 0040A49A    pop         esi
 0040A49B    pop         edi
 0040A49C    ret
*}
end;

//0040A4A0
function StrLIComp(const Str1:PChar; const Str2:PChar; MaxLen:Cardinal):Integer;
begin
{*
 0040A4A0    push        edi
 0040A4A1    push        esi
 0040A4A2    push        ebx
 0040A4A3    mov         edi,edx
 0040A4A5    mov         esi,eax
 0040A4A7    mov         ebx,ecx
 0040A4A9    xor         eax,eax
 0040A4AB    or          ecx,ecx
>0040A4AD    je          0040A4DE
 0040A4AF    repne scas  byte ptr [edi]
 0040A4B1    sub         ebx,ecx
 0040A4B3    mov         ecx,ebx
 0040A4B5    mov         edi,edx
 0040A4B7    xor         edx,edx
 0040A4B9    repe cmps   byte ptr [esi],byte ptr [edi]
>0040A4BB    je          0040A4DE
 0040A4BD    mov         al,byte ptr [esi-1]
 0040A4C0    cmp         al,61
>0040A4C2    jb          0040A4CA
 0040A4C4    cmp         al,7A
>0040A4C6    ja          0040A4CA
 0040A4C8    sub         al,20
 0040A4CA    mov         dl,byte ptr [edi-1]
 0040A4CD    cmp         dl,61
>0040A4D0    jb          0040A4DA
 0040A4D2    cmp         dl,7A
>0040A4D5    ja          0040A4DA
 0040A4D7    sub         dl,20
 0040A4DA    sub         eax,edx
>0040A4DC    je          0040A4B9
 0040A4DE    pop         ebx
 0040A4DF    pop         esi
 0040A4E0    pop         edi
 0040A4E1    ret
*}
end;

//0040A4E4
function StrScan(const Str:PChar; Chr:Char):PChar;
begin
{*
>0040A4E4    jmp         0040A4EE
 0040A4E6    test        cl,cl
>0040A4E8    jne         0040A4ED
 0040A4EA    xor         eax,eax
 0040A4EC    ret
 0040A4ED    inc         eax
 0040A4EE    mov         cl,byte ptr [eax]
 0040A4F0    cmp         dl,cl
>0040A4F2    jne         0040A4E6
 0040A4F4    ret
*}
end;

//0040A4F8
function StrPos(const Str1:PChar; const Str2:PChar):PChar;
begin
{*
 0040A4F8    push        edi
 0040A4F9    push        esi
 0040A4FA    push        ebx
 0040A4FB    or          eax,eax
>0040A4FD    je          0040A543
 0040A4FF    or          edx,edx
>0040A501    je          0040A543
 0040A503    mov         ebx,eax
 0040A505    mov         edi,edx
 0040A507    xor         al,al
 0040A509    mov         ecx,0FFFFFFFF
 0040A50E    repne scas  byte ptr [edi]
 0040A510    not         ecx
 0040A512    dec         ecx
>0040A513    je          0040A543
 0040A515    mov         esi,ecx
 0040A517    mov         edi,ebx
 0040A519    mov         ecx,0FFFFFFFF
 0040A51E    repne scas  byte ptr [edi]
 0040A520    not         ecx
 0040A522    sub         ecx,esi
>0040A524    jbe         0040A543
 0040A526    mov         edi,ebx
 0040A528    lea         ebx,[esi-1]
 0040A52B    mov         esi,edx
 0040A52D    lods        byte ptr [esi]
 0040A52E    repne scas  byte ptr [edi]
>0040A530    jne         0040A543
 0040A532    mov         eax,ecx
 0040A534    push        edi
 0040A535    mov         ecx,ebx
 0040A537    repe cmps   byte ptr [esi],byte ptr [edi]
 0040A539    pop         edi
 0040A53A    mov         ecx,eax
>0040A53C    jne         0040A52B
 0040A53E    lea         eax,[edi-1]
>0040A541    jmp         0040A545
 0040A543    xor         eax,eax
 0040A545    pop         ebx
 0040A546    pop         esi
 0040A547    pop         edi
 0040A548    ret
*}
end;

//0040A54C
function StrPas(const Str:PChar):AnsiString;
begin
{*
 0040A54C    push        ebx
 0040A54D    push        esi
 0040A54E    mov         esi,edx
 0040A550    mov         ebx,eax
 0040A552    mov         eax,esi
 0040A554    mov         edx,ebx
 0040A556    call        @LStrFromPChar
 0040A55B    pop         esi
 0040A55C    pop         ebx
 0040A55D    ret
*}
end;

//0040A560
function StrAlloc(Size:Cardinal):PChar;
begin
{*
 0040A560    push        ebx
 0040A561    mov         ebx,eax
 0040A563    add         ebx,4
 0040A566    mov         eax,ebx
 0040A568    call        @GetMem
 0040A56D    mov         dword ptr [eax],ebx
 0040A56F    add         eax,4
 0040A572    pop         ebx
 0040A573    ret
*}
end;

//0040A574
function StrBufSize(const Str:PChar):Cardinal;
begin
{*
 0040A574    sub         eax,4
 0040A577    mov         eax,dword ptr [eax]
 0040A579    sub         eax,4
 0040A57C    ret
*}
end;

//0040A580
function StrNew(const Str:PChar):PChar;
begin
{*
 0040A580    push        ebx
 0040A581    push        esi
 0040A582    mov         ebx,eax
 0040A584    test        ebx,ebx
>0040A586    jne         0040A58D
 0040A588    xor         eax,eax
 0040A58A    pop         esi
 0040A58B    pop         ebx
 0040A58C    ret
 0040A58D    mov         eax,ebx
 0040A58F    call        StrLen
 0040A594    mov         esi,eax
 0040A596    inc         esi
 0040A597    mov         eax,esi
 0040A599    call        StrAlloc
 0040A59E    mov         ecx,esi
 0040A5A0    mov         edx,ebx
 0040A5A2    call        StrMove
 0040A5A7    pop         esi
 0040A5A8    pop         ebx
 0040A5A9    ret
*}
end;

//0040A5AC
procedure StrDispose(Str:PChar);
begin
{*
 0040A5AC    test        eax,eax
>0040A5AE    je          0040A5BA
 0040A5B0    sub         eax,4
 0040A5B3    mov         edx,dword ptr [eax]
 0040A5B5    call        @FreeMem
 0040A5BA    ret
*}
end;

//0040A5BC
procedure FormatError(ErrorCode:Integer; Format:PChar; FmtLen:Cardinal);
begin
{*
 0040A5BC    push        ebx
 0040A5BD    push        esi
 0040A5BE    push        edi
 0040A5BF    add         esp,0FFFFFFD8
 0040A5C2    mov         ebx,ecx
 0040A5C4    mov         esi,edx
 0040A5C6    mov         edi,eax
 0040A5C8    cmp         ebx,1F
>0040A5CB    jbe         0040A5D2
 0040A5CD    mov         ebx,1F
 0040A5D2    mov         edx,ebx
 0040A5D4    dec         edx
 0040A5D5    mov         eax,esi
 0040A5D7    call        StrByteType
 0040A5DC    cmp         al,1
>0040A5DE    jne         0040A5E1
 0040A5E0    dec         ebx
 0040A5E1    mov         eax,esp
 0040A5E3    mov         ecx,ebx
 0040A5E5    mov         edx,esi
 0040A5E7    call        StrMove
 0040A5EC    mov         byte ptr [esp+ebx],0
 0040A5F0    mov         eax,esp
 0040A5F2    mov         dword ptr [esp+20],eax
 0040A5F6    mov         byte ptr [esp+24],6
 0040A5FB    lea         edx,[esp+20]
 0040A5FF    mov         eax,dword ptr [edi*4+5AC1EC];^SInvalidFormat:TResStringRec
 0040A606    xor         ecx,ecx
 0040A608    call        ConvertErrorFmt
 0040A60D    add         esp,28
 0040A610    pop         edi
 0040A611    pop         esi
 0040A612    pop         ebx
 0040A613    ret
*}
end;

//0040A614
procedure FormatVarToStr(var S:AnsiString; const V:TVarData);
begin
{*
 0040A614    push        ebx
 0040A615    mov         ecx,dword ptr ds:[5AE7B4];^gvar_005AC01C
 0040A61B    cmp         dword ptr [ecx],0
>0040A61E    je          0040A62C
 0040A620    mov         ebx,dword ptr ds:[5AE7B4];^gvar_005AC01C
 0040A626    mov         ebx,dword ptr [ebx]
 0040A628    call        ebx
 0040A62A    pop         ebx
 0040A62B    ret
 0040A62C    mov         al,10
 0040A62E    call        Error
 0040A633    pop         ebx
 0040A634    ret
*}
end;

//0040A638
procedure FormatClearStr(var S:AnsiString);
begin
{*
 0040A638    push        ebx
 0040A639    mov         ebx,eax
 0040A63B    mov         eax,ebx
 0040A63D    call        @LStrClr
 0040A642    pop         ebx
 0040A643    ret
*}
end;

//0040A644
{*function FormatBuf(var Buffer:void ; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):Cardinal;
begin
 0040A644    push        ebp
 0040A645    mov         ebp,esp
 0040A647    add         esp,0FFFFFF94
 0040A64A    push        ebx
 0040A64B    xor         ebx,ebx
 0040A64D    mov         dword ptr [ebp-14],ebx
 0040A650    push        ebx
 0040A651    push        esi
 0040A652    push        edi
 0040A653    mov         edi,eax
 0040A655    mov         esi,ecx
 0040A657    xor         eax,eax
 0040A659    mov         dword ptr [ebp-4],eax
 0040A65C    add         ecx,dword ptr [ebp+10]
 0040A65F    mov         dword ptr [ebp-8],edi
 0040A662    xor         eax,eax
 0040A664    mov         dword ptr [ebp-0C],eax
 0040A667    mov         dword ptr [ebp-10],eax
 0040A66A    mov         dword ptr [ebp-14],eax
 0040A66D    or          edx,edx
>0040A66F    je          0040A67E
 0040A671    cmp         esi,ecx
>0040A673    je          0040A67E
 0040A675    lods        byte ptr [esi]
 0040A676    cmp         al,25
>0040A678    je          0040A688
 0040A67A    stos        byte ptr [edi]
 0040A67B    dec         edx
>0040A67C    jne         0040A671
 0040A67E    mov         eax,edi
 0040A680    sub         eax,dword ptr [ebp-8]
>0040A683    jmp         0040A9AB
 0040A688    cmp         esi,ecx
>0040A68A    je          0040A67E
 0040A68C    lods        byte ptr [esi]
 0040A68D    cmp         al,25
>0040A68F    je          0040A67A
 0040A691    lea         ebx,[esi-2]
 0040A694    mov         dword ptr [ebp-18],ebx
 0040A697    mov         byte ptr [ebp-19],al
 0040A69A    cmp         al,2D
>0040A69C    jne         0040A6A3
 0040A69E    cmp         esi,ecx
>0040A6A0    je          0040A67E
 0040A6A2    lods        byte ptr [esi]
 0040A6A3    call        0040A726
 0040A6A8    cmp         al,3A
>0040A6AA    jne         0040A6B6
 0040A6AC    mov         dword ptr [ebp-0C],ebx
 0040A6AF    cmp         esi,ecx
>0040A6B1    je          0040A67E
 0040A6B3    lods        byte ptr [esi]
>0040A6B4    jmp         0040A697
 0040A6B6    mov         dword ptr [ebp-20],ebx
 0040A6B9    mov         ebx,0FFFFFFFF
 0040A6BE    cmp         al,2E
>0040A6C0    jne         0040A6CC
 0040A6C2    cmp         esi,ecx
>0040A6C4    je          0040A67E
 0040A6C6    lods        byte ptr [esi]
 0040A6C7    call        0040A726
 0040A6CC    mov         dword ptr [ebp-24],ebx
 0040A6CF    mov         dword ptr [ebp-28],esi
 0040A6D2    push        ecx
 0040A6D3    push        edx
 0040A6D4    call        0040A76E
 0040A6D9    pop         edx
 0040A6DA    mov         ebx,dword ptr [ebp-20]
 0040A6DD    sub         ebx,ecx
>0040A6DF    jae         0040A6E3
 0040A6E1    xor         ebx,ebx
 0040A6E3    cmp         byte ptr [ebp-19],2D
>0040A6E7    jne         0040A6F3
 0040A6E9    sub         edx,ecx
>0040A6EB    jae         0040A6F1
 0040A6ED    add         ecx,edx
 0040A6EF    xor         edx,edx
 0040A6F1    rep movs    byte ptr [edi],byte ptr [esi]
 0040A6F3    xchg        ebx,ecx
 0040A6F5    sub         edx,ecx
>0040A6F7    jae         0040A6FD
 0040A6F9    add         ecx,edx
 0040A6FB    xor         edx,edx
 0040A6FD    mov         al,20
 0040A6FF    rep stos    byte ptr [edi]
 0040A701    xchg        ebx,ecx
 0040A703    sub         edx,ecx
>0040A705    jae         0040A70B
 0040A707    add         ecx,edx
 0040A709    xor         edx,edx
 0040A70B    rep movs    byte ptr [edi],byte ptr [esi]
 0040A70D    cmp         dword ptr [ebp-10],0
>0040A711    je          0040A71D
 0040A713    push        edx
 0040A714    lea         eax,[ebp-10]
 0040A717    call        FormatClearStr
 0040A71C    pop         edx
 0040A71D    pop         ecx
 0040A71E    mov         esi,dword ptr [ebp-28]
>0040A721    jmp         0040A66D
 0040A726    xor         ebx,ebx
 0040A728    cmp         al,2A
>0040A72A    je          0040A74E
 0040A72C    cmp         al,30
>0040A72E    jb          0040A76D
 0040A730    cmp         al,39
>0040A732    ja          0040A76D
 0040A734    imul        ebx,ebx,0A
 0040A73A    sub         al,30
 0040A73C    movzx       eax,al
 0040A73F    add         ebx,eax
 0040A741    cmp         esi,ecx
>0040A743    je          0040A748
 0040A745    lods        byte ptr [esi]
>0040A746    jmp         0040A72C
 0040A748    pop         eax
>0040A749    jmp         0040A67E
 0040A74E    mov         eax,dword ptr [ebp-0C]
 0040A751    cmp         eax,dword ptr [ebp+8]
>0040A754    jg          0040A768
 0040A756    inc         dword ptr [ebp-0C]
 0040A759    mov         ebx,dword ptr [ebp+0C]
 0040A75C    cmp         byte ptr [ebx+eax*8+4],0
 0040A761    mov         ebx,dword ptr [ebx+eax*8]
>0040A764    je          0040A768
 0040A766    xor         ebx,ebx
 0040A768    cmp         esi,ecx
>0040A76A    je          0040A748
 0040A76C    lods        byte ptr [esi]
 0040A76D    ret
end;*}

//0040A9BC
{*function StrFmt(Buffer:PChar; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):PChar;
begin
 0040A9BC    push        ebp
 0040A9BD    mov         ebp,esp
 0040A9BF    push        ebx
 0040A9C0    push        esi
 0040A9C1    push        edi
 0040A9C2    mov         edi,ecx
 0040A9C4    mov         esi,edx
 0040A9C6    mov         ebx,eax
 0040A9C8    test        ebx,ebx
>0040A9CA    je          0040A9F3
 0040A9CC    test        esi,esi
>0040A9CE    je          0040A9F3
 0040A9D0    mov         eax,esi
 0040A9D2    call        StrLen
 0040A9D7    push        eax
 0040A9D8    push        edi
 0040A9D9    mov         eax,dword ptr [ebp+8]
 0040A9DC    push        eax
 0040A9DD    mov         ecx,esi
 0040A9DF    mov         eax,ebx
 0040A9E1    mov         edx,7FFFFFFF
 0040A9E6    call        FormatBuf
 0040A9EB    mov         byte ptr [ebx+eax],0
 0040A9EF    mov         eax,ebx
>0040A9F1    jmp         0040A9F5
 0040A9F3    xor         eax,eax
 0040A9F5    pop         edi
 0040A9F6    pop         esi
 0040A9F7    pop         ebx
 0040A9F8    pop         ebp
 0040A9F9    ret         4
end;*}

//0040A9FC
{*function StrLFmt(Buffer:PChar; MaxBufLen:Cardinal; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):PChar;
begin
 0040A9FC    push        ebp
 0040A9FD    mov         ebp,esp
 0040A9FF    push        ebx
 0040AA00    push        esi
 0040AA01    push        edi
 0040AA02    mov         esi,ecx
 0040AA04    mov         edi,edx
 0040AA06    mov         ebx,eax
 0040AA08    test        ebx,ebx
>0040AA0A    je          0040AA33
 0040AA0C    test        esi,esi
>0040AA0E    je          0040AA33
 0040AA10    mov         eax,esi
 0040AA12    call        StrLen
 0040AA17    push        eax
 0040AA18    mov         eax,dword ptr [ebp+0C]
 0040AA1B    push        eax
 0040AA1C    mov         eax,dword ptr [ebp+8]
 0040AA1F    push        eax
 0040AA20    mov         ecx,esi
 0040AA22    mov         eax,ebx
 0040AA24    mov         edx,edi
 0040AA26    call        FormatBuf
 0040AA2B    mov         byte ptr [ebx+eax],0
 0040AA2F    mov         eax,ebx
>0040AA31    jmp         0040AA35
 0040AA33    xor         eax,eax
 0040AA35    pop         edi
 0040AA36    pop         esi
 0040AA37    pop         ebx
 0040AA38    pop         ebp
 0040AA39    ret         8
end;*}

//0040AA3C
{*function Format(const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?):AnsiString;
begin
 0040AA3C    push        ebp
 0040AA3D    mov         ebp,esp
 0040AA3F    push        ecx
 0040AA40    mov         ecx,dword ptr [ebp+8]
 0040AA43    xchg        eax,ecx
 0040AA44    xchg        edx,ecx
 0040AA46    call        FmtStr
 0040AA4B    pop         ebp
 0040AA4C    ret         4
end;*}

//0040AA50
{*procedure FmtStr(var Result:AnsiString; const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);
begin
 0040AA50    push        ebp
 0040AA51    mov         ebp,esp
 0040AA53    add         esp,0FFFFF004
 0040AA59    push        eax
 0040AA5A    add         esp,0FFFFFFF8
 0040AA5D    push        ebx
 0040AA5E    push        esi
 0040AA5F    mov         dword ptr [ebp-8],ecx
 0040AA62    mov         dword ptr [ebp-4],edx
 0040AA65    mov         esi,eax
 0040AA67    mov         ebx,1000
 0040AA6C    mov         eax,dword ptr [ebp-4]
 0040AA6F    call        @LStrLen
 0040AA74    cmp         eax,0C00
>0040AA79    jge         0040AAA1
 0040AA7B    mov         eax,dword ptr [ebp-4]
 0040AA7E    call        @LStrLen
 0040AA83    push        eax
 0040AA84    mov         eax,dword ptr [ebp-8]
 0040AA87    push        eax
 0040AA88    mov         eax,dword ptr [ebp+8]
 0040AA8B    push        eax
 0040AA8C    mov         ecx,dword ptr [ebp-4]
 0040AA8F    lea         eax,[ebp-1008]
 0040AA95    mov         edx,0FFF
 0040AA9A    call        FormatBuf
>0040AA9F    jmp         0040AAAD
 0040AAA1    mov         eax,dword ptr [ebp-4]
 0040AAA4    call        @LStrLen
 0040AAA9    mov         ebx,eax
 0040AAAB    mov         eax,ebx
 0040AAAD    mov         edx,ebx
 0040AAAF    dec         edx
 0040AAB0    cmp         eax,edx
>0040AAB2    jl          0040AAF7
>0040AAB4    jmp         0040AAE6
 0040AAB6    add         ebx,ebx
 0040AAB8    mov         eax,esi
 0040AABA    call        @LStrClr
 0040AABF    mov         eax,esi
 0040AAC1    mov         edx,ebx
 0040AAC3    call        @LStrSetLength
 0040AAC8    mov         eax,dword ptr [ebp-4]
 0040AACB    call        @LStrLen
 0040AAD0    push        eax
 0040AAD1    mov         eax,dword ptr [ebp-8]
 0040AAD4    push        eax
 0040AAD5    mov         eax,dword ptr [ebp+8]
 0040AAD8    push        eax
 0040AAD9    mov         ecx,dword ptr [ebp-4]
 0040AADC    mov         edx,ebx
 0040AADE    dec         edx
 0040AADF    mov         eax,dword ptr [esi]
 0040AAE1    call        FormatBuf
 0040AAE6    mov         edx,ebx
 0040AAE8    dec         edx
 0040AAE9    cmp         eax,edx
>0040AAEB    jge         0040AAB6
 0040AAED    mov         edx,esi
 0040AAEF    xchg        eax,edx
 0040AAF0    call        @LStrSetLength
>0040AAF5    jmp         0040AB05
 0040AAF7    lea         edx,[ebp-1008]
 0040AAFD    mov         ecx,esi
 0040AAFF    xchg        eax,ecx
 0040AB00    call        @LStrFromPCharLen
 0040AB05    pop         esi
 0040AB06    pop         ebx
 0040AB07    mov         esp,ebp
 0040AB09    pop         ebp
 0040AB0A    ret         4
end;*}

//0040AB10
procedure PutExponent;
begin
{*
 0040AB10    push        esi
 0040AB11    xor         esi,esi
 0040AB13    stos        byte ptr [edi]
 0040AB14    or          bl,bl
>0040AB16    jne         0040AB1C
 0040AB18    xor         edx,edx
>0040AB1A    jmp         0040AB26
 0040AB1C    or          edx,edx
>0040AB1E    jge         0040AB26
 0040AB20    mov         al,2D
 0040AB22    neg         edx
>0040AB24    jmp         0040AB2C
 0040AB26    or          ah,ah
>0040AB28    je          0040AB2D
 0040AB2A    mov         al,ah
 0040AB2C    stos        byte ptr [edi]
 0040AB2D    xchg        eax,edx
 0040AB2E    push        eax
 0040AB2F    mov         ebx,esp
 0040AB31    xor         edx,edx
 0040AB33    div         eax,dword ptr [esi+5AC200]
 0040AB39    add         dl,30
 0040AB3C    mov         byte ptr [ebx],dl
 0040AB3E    inc         ebx
 0040AB3F    dec         ecx
 0040AB40    or          eax,eax
>0040AB42    jne         0040AB31
 0040AB44    or          ecx,ecx
>0040AB46    jg          0040AB31
 0040AB48    dec         ebx
 0040AB49    mov         al,byte ptr [ebx]
 0040AB4B    stos        byte ptr [edi]
 0040AB4C    cmp         ebx,esp
>0040AB4E    jne         0040AB48
 0040AB50    pop         eax
 0040AB51    pop         esi
 0040AB52    ret
*}
end;

//0040AB54
function FloatToText(BufferArg:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer):Integer;
begin
{*
 0040AB54    push        ebp
 0040AB55    mov         ebp,esp
 0040AB57    add         esp,0FFFFFFD4
 0040AB5A    push        edi
 0040AB5B    push        esi
 0040AB5C    push        ebx
 0040AB5D    mov         dword ptr [ebp-4],eax
 0040AB60    mov         al,[005E0757];DecimalSeparator:Char
 0040AB65    mov         byte ptr [ebp-5],al
 0040AB68    mov         al,[005E0756];ThousandSeparator:Char
 0040AB6D    mov         byte ptr [ebp-6],al
 0040AB70    mov         eax,[005E0750];CurrencyString:AnsiString
 0040AB75    mov         dword ptr [ebp-0C],eax
 0040AB78    mov         al,[005E0754];CurrencyFormat:Byte
 0040AB7D    mov         byte ptr [ebp-0D],al
 0040AB80    mov         al,[005E0755];NegCurrFormat:Byte
 0040AB85    mov         byte ptr [ebp-0E],al
 0040AB88    mov         dword ptr [ebp-14],0
 0040AB8F    mov         eax,13
 0040AB94    cmp         cl,0
>0040AB97    jne         0040ABB0
 0040AB99    mov         eax,dword ptr [ebp+0C]
 0040AB9C    cmp         eax,2
>0040AB9F    jge         0040ABA6
 0040ABA1    mov         eax,2
 0040ABA6    cmp         eax,12
>0040ABA9    jle         0040ABB0
 0040ABAB    mov         eax,12
 0040ABB0    mov         dword ptr [ebp+0C],eax
 0040ABB3    push        eax
 0040ABB4    mov         eax,270F
 0040ABB9    cmp         byte ptr [ebp+10],2
>0040ABBD    jb          0040ABC2
 0040ABBF    mov         eax,dword ptr [ebp+8]
 0040ABC2    push        eax
 0040ABC3    lea         eax,[ebp-2C]
 0040ABC6    call        FloatToDecimal
 0040ABCB    mov         edi,dword ptr [ebp-4]
 0040ABCE    movzx       eax,word ptr [ebp-2C]
 0040ABD2    sub         eax,7FFF
 0040ABD7    cmp         eax,2
>0040ABDA    jae         0040ABF6
 0040ABDC    mov         ecx,eax
 0040ABDE    call        0040AC53
 0040ABE3    lea         esi,[ecx+ecx*2+40AC44]
 0040ABEA    add         esi,dword ptr [ebp-14]
 0040ABED    mov         ecx,3
 0040ABF2    rep movs    byte ptr [edi],byte ptr [esi]
>0040ABF4    jmp         0040AC23
 0040ABF6    lea         esi,[ebp-29]
 0040ABF9    movzx       ebx,byte ptr [ebp+10]
 0040ABFD    cmp         bl,1
>0040AC00    je          0040AC12
 0040AC02    cmp         bl,4
>0040AC05    ja          0040AC10
 0040AC07    movsx       eax,word ptr [ebp-2C]
 0040AC0B    cmp         eax,dword ptr [ebp+0C]
>0040AC0E    jle         0040AC12
 0040AC10    mov         bl,0
 0040AC12    lea         ebx,[ebx*4+40AC30]
 0040AC19    add         ebx,dword ptr [ebp-14]
 0040AC1C    mov         ebx,dword ptr [ebx]
 0040AC1E    add         ebx,dword ptr [ebp-14]
 0040AC21    call        ebx
 0040AC23    mov         eax,edi
 0040AC25    sub         eax,dword ptr [ebp-4]
 0040AC28    pop         ebx
 0040AC29    pop         esi
 0040AC2A    pop         edi
>0040AC2B    jmp         0040AE21
 0040AC30    pop         ebp
 0040AC31    lods        byte ptr [esi]
 0040AC32    inc         eax
 0040AC33    add         byte ptr [ecx-0FFFBF54],bh
 0040AC39    lods        byte ptr [esi]
 0040AC3A    inc         eax
 0040AC3B    add         al,dh
 0040AC3D    lods        byte ptr [esi]
 0040AC3E    inc         eax
 0040AC3F    add         byte ptr [edx-53],bl
 0040AC42    inc         eax
 0040AC43    add         byte ptr [ecx+4E],cl
 0040AC46    inc         esi
 0040AC47    dec         esi
 0040AC48    inc         ecx
 0040AC49    dec         esi
 0040AC4A    lods        byte ptr [esi]
 0040AC4B    or          al,al
>0040AC4D    jne         0040AC52
 0040AC4F    mov         al,30
 0040AC51    dec         esi
 0040AC52    ret
*}
end;

//0040AE28
function FloatToText(BufferArg:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer; const FormatSettings:TFormatSettings):Integer;
begin
{*
 0040AE28    push        ebp
 0040AE29    mov         ebp,esp
 0040AE2B    add         esp,0FFFFFFD4
 0040AE2E    push        edi
 0040AE2F    push        esi
 0040AE30    push        ebx
 0040AE31    mov         dword ptr [ebp-4],eax
 0040AE34    mov         eax,dword ptr [ebp+8]
 0040AE37    mov         al,byte ptr [eax+3]
 0040AE3A    mov         byte ptr [ebp-5],al
 0040AE3D    mov         eax,dword ptr [ebp+8]
 0040AE40    mov         al,byte ptr [eax+2]
 0040AE43    mov         byte ptr [ebp-6],al
 0040AE46    mov         eax,dword ptr [ebp+8]
 0040AE49    mov         eax,dword ptr [eax+8]
 0040AE4C    mov         dword ptr [ebp-0C],eax
 0040AE4F    mov         eax,dword ptr [ebp+8]
 0040AE52    mov         al,byte ptr [eax]
 0040AE54    mov         byte ptr [ebp-0D],al
 0040AE57    mov         eax,dword ptr [ebp+8]
 0040AE5A    mov         al,byte ptr [eax+1]
 0040AE5D    mov         byte ptr [ebp-0E],al
 0040AE60    mov         dword ptr [ebp-14],0
 0040AE67    mov         eax,13
 0040AE6C    cmp         cl,0
>0040AE6F    jne         0040AE88
 0040AE71    mov         eax,dword ptr [ebp+10]
 0040AE74    cmp         eax,2
>0040AE77    jge         0040AE7E
 0040AE79    mov         eax,2
 0040AE7E    cmp         eax,12
>0040AE81    jle         0040AE88
 0040AE83    mov         eax,12
 0040AE88    mov         dword ptr [ebp+10],eax
 0040AE8B    push        eax
 0040AE8C    mov         eax,270F
 0040AE91    cmp         byte ptr [ebp+14],2
>0040AE95    jb          0040AE9A
 0040AE97    mov         eax,dword ptr [ebp+0C]
 0040AE9A    push        eax
 0040AE9B    lea         eax,[ebp-2C]
 0040AE9E    call        FloatToDecimal
 0040AEA3    mov         edi,dword ptr [ebp-4]
 0040AEA6    movzx       eax,word ptr [ebp-2C]
 0040AEAA    sub         eax,7FFF
 0040AEAF    cmp         eax,2
>0040AEB2    jae         0040AECE
 0040AEB4    mov         ecx,eax
 0040AEB6    call        0040AF2B
 0040AEBB    lea         esi,[ecx+ecx*2+40AF1C]
 0040AEC2    add         esi,dword ptr [ebp-14]
 0040AEC5    mov         ecx,3
 0040AECA    rep movs    byte ptr [edi],byte ptr [esi]
>0040AECC    jmp         0040AEFB
 0040AECE    lea         esi,[ebp-29]
 0040AED1    movzx       ebx,byte ptr [ebp+14]
 0040AED5    cmp         bl,1
>0040AED8    je          0040AEEA
 0040AEDA    cmp         bl,4
>0040AEDD    ja          0040AEE8
 0040AEDF    movsx       eax,word ptr [ebp-2C]
 0040AEE3    cmp         eax,dword ptr [ebp+10]
>0040AEE6    jle         0040AEEA
 0040AEE8    mov         bl,0
 0040AEEA    lea         ebx,[ebx*4+40AF08]
 0040AEF1    add         ebx,dword ptr [ebp-14]
 0040AEF4    mov         ebx,dword ptr [ebx]
 0040AEF6    add         ebx,dword ptr [ebp-14]
 0040AEF9    call        ebx
 0040AEFB    mov         eax,edi
 0040AEFD    sub         eax,dword ptr [ebp-4]
 0040AF00    pop         ebx
 0040AF01    pop         esi
 0040AF02    pop         edi
>0040AF03    jmp         0040B0F9
 0040AF08    xor         eax,910040AF
 0040AF0D    scas        dword ptr [edi]
 0040AF0E    inc         eax
 0040AF0F    add         al,cl
 0040AF11    scas        dword ptr [edi]
 0040AF12    inc         eax
 0040AF13    add         al,cl
 0040AF15    scas        dword ptr [edi]
 0040AF16    inc         eax
 0040AF17    add         byte ptr [edx],dh
 0040AF19    mov         al,40
 0040AF1B    add         byte ptr [ecx+4E],cl
 0040AF1E    inc         esi
 0040AF1F    dec         esi
 0040AF20    inc         ecx
 0040AF21    dec         esi
 0040AF22    lods        byte ptr [esi]
 0040AF23    or          al,al
>0040AF25    jne         0040AF2A
 0040AF27    mov         al,30
 0040AF29    dec         esi
 0040AF2A    ret
*}
end;

//0040B100
procedure FloatToDecimal(var Result:TFloatRec; const Value:void ; ValueType:TFloatValue; Precision:Integer; Decimals:Integer);
begin
{*
 0040B100    push        ebp
 0040B101    mov         ebp,esp
 0040B103    add         esp,0FFFFFFE0
 0040B106    push        edi
 0040B107    push        esi
 0040B108    push        ebx
 0040B109    mov         ebx,eax
 0040B10B    mov         esi,edx
 0040B10D    mov         dword ptr [ebp-4],0
 0040B114    cmp         cl,0
>0040B117    je          0040B123
 0040B119    call        0040B24F
>0040B11E    jmp         0040B323
 0040B123    call        0040B12D
>0040B128    jmp         0040B323
 0040B12D    mov         ax,word ptr [esi+8]
 0040B131    mov         edx,eax
 0040B133    and         eax,7FFF
>0040B138    je          0040B158
 0040B13A    cmp         eax,7FFF
>0040B13F    jne         0040B163
 0040B141    test        word ptr [esi+6],8000
>0040B147    je          0040B15A
 0040B149    cmp         dword ptr [esi],0
>0040B14C    jne         0040B157
 0040B14E    cmp         dword ptr [esi+4],80000000
>0040B155    je          0040B15A
 0040B157    inc         eax
 0040B158    xor         edx,edx
 0040B15A    mov         byte ptr [ebx+3],0
>0040B15E    jmp         0040B230
 0040B163    fld         tbyte ptr [esi]
 0040B165    sub         eax,3FFF
 0040B16A    imul        eax,eax,4D10
 0040B170    sar         eax,10
 0040B173    inc         eax
 0040B174    mov         dword ptr [ebp-8],eax
 0040B177    mov         eax,12
 0040B17C    sub         eax,dword ptr [ebp-8]
 0040B17F    fabs
 0040B181    push        ebx
 0040B182    mov         ebx,dword ptr [ebp-4]
 0040B185    call        FPower10
 0040B18A    pop         ebx
 0040B18B    frndint
 0040B18D    mov         edi,dword ptr [ebp-4]
 0040B190    fld         tbyte ptr [edi+5AC1F4]
 0040B196    fcomp       st(1)
 0040B198    wait
 0040B199    fnstsw      word ptr [ebp-0A]
 0040B19C    wait
 0040B19D    test        word ptr [ebp-0A],4100
>0040B1A3    je          0040B1AE
 0040B1A5    fidiv       dword ptr [edi+5AC200]
 0040B1AB    inc         dword ptr [ebp-8]
 0040B1AE    fbstp       tbyte ptr [ebp-18]
 0040B1B1    lea         edi,[ebx+3]
 0040B1B4    mov         edx,9
 0040B1B9    wait
 0040B1BA    mov         al,byte ptr [edx+ebp-19]
 0040B1BE    mov         ah,al
 0040B1C0    shr         al,4
 0040B1C3    and         ah,0F
 0040B1C6    add         ax,3030
 0040B1CA    stos        word ptr [edi]
 0040B1CC    dec         edx
>0040B1CD    jne         0040B1BA
 0040B1CF    xor         al,al
 0040B1D1    stos        byte ptr [edi]
 0040B1D2    mov         edi,dword ptr [ebp-8]
 0040B1D5    add         edi,dword ptr [ebp+8]
>0040B1D8    jns         0040B1E1
 0040B1DA    xor         eax,eax
>0040B1DC    jmp         0040B158
 0040B1E1    cmp         edi,dword ptr [ebp+0C]
>0040B1E4    jb          0040B1E9
 0040B1E6    mov         edi,dword ptr [ebp+0C]
 0040B1E9    cmp         edi,12
>0040B1EC    jae         0040B215
 0040B1EE    cmp         byte ptr [ebx+edi+3],35
>0040B1F3    jb          0040B21A
 0040B1F5    mov         byte ptr [ebx+edi+3],0
 0040B1FA    dec         edi
>0040B1FB    js          0040B20A
 0040B1FD    inc         byte ptr [ebx+edi+3]
 0040B201    cmp         byte ptr [ebx+edi+3],39
>0040B206    ja          0040B1F5
>0040B208    jmp         0040B229
 0040B20A    mov         word ptr [ebx+3],31
 0040B210    inc         dword ptr [ebp-8]
>0040B213    jmp         0040B229
 0040B215    mov         edi,12
 0040B21A    mov         byte ptr [ebx+edi+3],0
 0040B21F    dec         edi
>0040B220    js          0040B23B
 0040B222    cmp         byte ptr [ebx+edi+3],30
>0040B227    je          0040B21A
 0040B229    mov         dx,word ptr [esi+8]
 0040B22D    mov         eax,dword ptr [ebp-8]
 0040B230    shr         dx,0F
 0040B234    mov         word ptr [ebx],ax
 0040B237    mov         byte ptr [ebx+2],dl
 0040B23A    ret
 0040B23B    xor         edx,edx
>0040B23D    jmp         0040B22D
 0040B23F    or          al,byte ptr [eax]
 0040B241    add         byte ptr [eax],al
 0040B243    add         byte ptr fs:[eax],al
 0040B246    add         al,ch
 0040B248    add         eax,dword ptr [eax]
 0040B24A    add         byte ptr [eax],dl
 0040B24C    daa
 0040B24D    add         byte ptr [eax],al
 0040B24F    mov         eax,dword ptr [esi]
 0040B251    mov         edx,dword ptr [esi+4]
 0040B254    mov         ecx,eax
 0040B256    or          ecx,edx
>0040B258    je          0040B315
 0040B25E    or          edx,edx
>0040B260    jns         0040B269
 0040B262    neg         edx
 0040B264    neg         eax
 0040B266    sbb         edx,0
 0040B269    xor         ecx,ecx
 0040B26B    mov         edi,dword ptr [ebp+8]
 0040B26E    or          edi,edi
>0040B270    jge         0040B274
 0040B272    xor         edi,edi
 0040B274    cmp         edi,4
>0040B277    jl          0040B298
 0040B279    mov         edi,4
 0040B27E    inc         ecx
 0040B27F    sub         eax,0A7640000
 0040B284    sbb         edx,0DE0B6B3
>0040B28A    jae         0040B27E
 0040B28C    dec         ecx
 0040B28D    add         eax,0A7640000
 0040B292    adc         edx,0DE0B6B3
 0040B298    mov         dword ptr [ebp-20],eax
 0040B29B    mov         dword ptr [ebp-1C],edx
 0040B29E    fild        qword ptr [ebp-20]
 0040B2A1    mov         edx,edi
 0040B2A3    mov         eax,4
 0040B2A8    sub         eax,edx
>0040B2AA    je          0040B2B6
 0040B2AC    mov         edi,dword ptr [ebp-4]
 0040B2AF    fidiv       dword ptr [edi+eax*4+40B23B]
 0040B2B6    fbstp       tbyte ptr [ebp-18]
 0040B2B9    lea         edi,[ebx+3]
 0040B2BC    wait
 0040B2BD    or          ecx,ecx
>0040B2BF    jne         0040B2DC
 0040B2C1    mov         ecx,9
 0040B2C6    mov         al,byte ptr [ecx+ebp-19]
 0040B2CA    mov         ah,al
 0040B2CC    shr         al,4
>0040B2CF    jne         0040B2EF
 0040B2D1    mov         al,ah
 0040B2D3    and         al,0F
>0040B2D5    jne         0040B2F6
 0040B2D7    dec         ecx
>0040B2D8    jne         0040B2C6
>0040B2DA    jmp         0040B315
 0040B2DC    mov         al,cl
 0040B2DE    add         al,30
 0040B2E0    stos        byte ptr [edi]
 0040B2E1    mov         ecx,9
 0040B2E6    mov         al,byte ptr [ecx+ebp-19]
 0040B2EA    mov         ah,al
 0040B2EC    shr         al,4
 0040B2EF    add         al,30
 0040B2F1    stos        byte ptr [edi]
 0040B2F2    mov         al,ah
 0040B2F4    and         al,0F
 0040B2F6    add         al,30
 0040B2F8    stos        byte ptr [edi]
 0040B2F9    dec         ecx
>0040B2FA    jne         0040B2E6
 0040B2FC    mov         eax,edi
 0040B2FE    lea         ecx,[ebx+edx+3]
 0040B302    sub         eax,ecx
 0040B304    mov         byte ptr [edi],0
 0040B307    dec         edi
 0040B308    cmp         byte ptr [edi],30
>0040B30B    je          0040B304
 0040B30D    mov         edx,dword ptr [esi+4]
 0040B310    shr         edx,1F
>0040B313    jmp         0040B31C
 0040B315    xor         eax,eax
 0040B317    xor         edx,edx
 0040B319    mov         byte ptr [ebx+3],al
 0040B31C    mov         word ptr [ebx],ax
 0040B31F    mov         byte ptr [ebx+2],dl
 0040B322    ret
*}
end;

//0040B32C
function TextToFloat(Buffer:PChar; var Value:void ; ValueType:TFloatValue):Boolean;
begin
{*
 0040B32C    push        ebp
 0040B32D    mov         ebp,esp
 0040B32F    add         esp,0FFFFFFF4
 0040B332    push        edi
 0040B333    push        esi
 0040B334    push        ebx
 0040B335    mov         esi,eax
 0040B337    mov         edi,edx
 0040B339    mov         dword ptr [ebp-4],0
 0040B340    mov         al,[005E0757];DecimalSeparator:Char
 0040B345    mov         byte ptr [ebp-5],al
 0040B348    mov         ebx,ecx
 0040B34A    wait
 0040B34B    fnstcw      word ptr [ebp-8]
 0040B34E    wait
 0040B34F    fnclex
 0040B351    fldcw       word ptr ds:[5AC204]
 0040B357    fldz
 0040B359    call        0040B3E3
 0040B35E    mov         bh,byte ptr [esi]
 0040B360    cmp         bh,2B
>0040B363    je          0040B36A
 0040B365    cmp         bh,2D
>0040B368    jne         0040B36B
 0040B36A    inc         esi
 0040B36B    mov         ecx,esi
 0040B36D    call        0040B3EE
 0040B372    xor         edx,edx
 0040B374    mov         al,byte ptr [esi]
 0040B376    cmp         al,byte ptr [ebp-5]
>0040B379    jne         0040B383
 0040B37B    inc         esi
 0040B37C    call        0040B3EE
 0040B381    neg         edx
 0040B383    cmp         ecx,esi
>0040B385    je          0040B3D6
 0040B387    mov         al,byte ptr [esi]
 0040B389    and         al,0DF
 0040B38B    cmp         al,45
>0040B38D    jne         0040B399
 0040B38F    inc         esi
 0040B390    push        edx
 0040B391    call        0040B40A
 0040B396    pop         eax
 0040B397    add         edx,eax
 0040B399    call        0040B3E3
 0040B39E    cmp         byte ptr [esi],0
>0040B3A1    jne         0040B3D6
 0040B3A3    mov         eax,edx
 0040B3A5    cmp         bl,1
>0040B3A8    jne         0040B3AD
 0040B3AA    add         eax,4
 0040B3AD    push        ebx
 0040B3AE    mov         ebx,dword ptr [ebp-4]
 0040B3B1    call        FPower10
 0040B3B6    pop         ebx
 0040B3B7    cmp         bh,2D
>0040B3BA    jne         0040B3BE
 0040B3BC    fchs
 0040B3BE    cmp         bl,0
>0040B3C1    je          0040B3C7
 0040B3C3    fistp       qword ptr [edi]
>0040B3C5    jmp         0040B3C9
 0040B3C7    fstp        tbyte ptr [edi]
 0040B3C9    wait
 0040B3CA    fnstsw      al
 0040B3CC    test        ax,9
>0040B3D0    jne         0040B3D8
 0040B3D2    mov         al,1
>0040B3D4    jmp         0040B3DA
 0040B3D6    fstp        st(0)
 0040B3D8    xor         eax,eax
 0040B3DA    wait
 0040B3DB    fnclex
 0040B3DD    fldcw       word ptr [ebp-8]
 0040B3E0    wait
>0040B3E1    jmp         0040B439
 0040B3E3    lods        byte ptr [esi]
 0040B3E4    or          al,al
>0040B3E6    je          0040B3EC
 0040B3E8    cmp         al,20
>0040B3EA    je          0040B3E3
 0040B3EC    dec         esi
 0040B3ED    ret
 0040B3EE    xor         eax,eax
 0040B3F0    xor         edx,edx
 0040B3F2    lods        byte ptr [esi]
 0040B3F3    sub         al,3A
 0040B3F5    add         al,0A
>0040B3F7    jae         0040B408
 0040B3F9    fimul       dword ptr ds:[5AC200]
 0040B3FF    mov         dword ptr [ebp-0C],eax
 0040B402    fiadd       dword ptr [ebp-0C]
 0040B405    inc         edx
>0040B406    jmp         0040B3F2
 0040B408    dec         esi
 0040B409    ret
 0040B40A    xor         eax,eax
 0040B40C    xor         edx,edx
 0040B40E    mov         cl,byte ptr [esi]
 0040B410    cmp         cl,2B
>0040B413    je          0040B41A
 0040B415    cmp         cl,2D
>0040B418    jne         0040B41B
 0040B41A    inc         esi
 0040B41B    mov         al,byte ptr [esi]
 0040B41D    sub         al,3A
 0040B41F    add         al,0A
>0040B421    jae         0040B431
 0040B423    inc         esi
 0040B424    imul        edx,edx,0A
 0040B427    add         edx,eax
 0040B429    cmp         edx,1F4
>0040B42F    jb          0040B41B
 0040B431    cmp         cl,2D
>0040B434    jne         0040B438
 0040B436    neg         edx
 0040B438    ret
 0040B439    pop         ebx
 0040B43A    pop         esi
 0040B43B    pop         edi
 0040B43C    mov         esp,ebp
 0040B43E    pop         ebp
 0040B43F    ret
*}
end;

//0040B440
function FloatToStr(Value:Extended):AnsiString;
begin
{*
 0040B440    push        ebp
 0040B441    mov         ebp,esp
 0040B443    add         esp,0FFFFFFC0
 0040B446    push        ebx
 0040B447    mov         ebx,eax
 0040B449    push        0
 0040B44B    push        0F
 0040B44D    push        0
 0040B44F    lea         edx,[ebp+8]
 0040B452    lea         eax,[ebp-40]
 0040B455    xor         ecx,ecx
 0040B457    call        FloatToText
 0040B45C    mov         ecx,eax
 0040B45E    lea         edx,[ebp-40]
 0040B461    mov         eax,ebx
 0040B463    call        @LStrFromPCharLen
 0040B468    pop         ebx
 0040B469    mov         esp,ebp
 0040B46B    pop         ebp
 0040B46C    ret         0C
*}
end;

//0040B470
function FloatToStr(const FormatSettings:TFormatSettings; Value:Extended):AnsiString;
begin
{*
 0040B470    push        ebp
 0040B471    mov         ebp,esp
 0040B473    add         esp,0FFFFFFC0
 0040B476    push        ebx
 0040B477    push        esi
 0040B478    mov         esi,edx
 0040B47A    mov         ebx,eax
 0040B47C    push        0
 0040B47E    push        0F
 0040B480    push        0
 0040B482    push        ebx
 0040B483    lea         edx,[ebp+8]
 0040B486    lea         eax,[ebp-40]
 0040B489    xor         ecx,ecx
 0040B48B    call        FloatToText
 0040B490    mov         ecx,eax
 0040B492    lea         edx,[ebp-40]
 0040B495    mov         eax,esi
 0040B497    call        @LStrFromPCharLen
 0040B49C    pop         esi
 0040B49D    pop         ebx
 0040B49E    mov         esp,ebp
 0040B4A0    pop         ebp
 0040B4A1    ret         0C
*}
end;

//0040B4A4
function CurrToStr(Value:Currency):AnsiString;
begin
{*
 0040B4A4    push        ebp
 0040B4A5    mov         ebp,esp
 0040B4A7    add         esp,0FFFFFFC0
 0040B4AA    push        ebx
 0040B4AB    mov         ebx,eax
 0040B4AD    push        0
 0040B4AF    push        0
 0040B4B1    push        0
 0040B4B3    lea         edx,[ebp+8]
 0040B4B6    lea         eax,[ebp-40]
 0040B4B9    mov         cl,1
 0040B4BB    call        FloatToText
 0040B4C0    mov         ecx,eax
 0040B4C2    lea         edx,[ebp-40]
 0040B4C5    mov         eax,ebx
 0040B4C7    call        @LStrFromPCharLen
 0040B4CC    pop         ebx
 0040B4CD    mov         esp,ebp
 0040B4CF    pop         ebp
 0040B4D0    ret         8
*}
end;

//0040B4D4
function TryStrToFloat(const S:AnsiString; var Value:Extended):Boolean;
begin
{*
 0040B4D4    push        ebx
 0040B4D5    push        esi
 0040B4D6    mov         esi,edx
 0040B4D8    mov         ebx,eax
 0040B4DA    mov         eax,ebx
 0040B4DC    call        @LStrToPChar
 0040B4E1    mov         edx,esi
 0040B4E3    xor         ecx,ecx
 0040B4E5    call        TextToFloat
 0040B4EA    pop         esi
 0040B4EB    pop         ebx
 0040B4EC    ret
*}
end;

//0040B4F0
function TryStrToFloat(const S:AnsiString; var Value:Double):Boolean;
begin
{*
 0040B4F0    push        ebx
 0040B4F1    push        esi
 0040B4F2    add         esp,0FFFFFFF4
 0040B4F5    mov         esi,edx
 0040B4F7    mov         ebx,eax
 0040B4F9    mov         eax,ebx
 0040B4FB    call        @LStrToPChar
 0040B500    mov         edx,esp
 0040B502    xor         ecx,ecx
 0040B504    call        TextToFloat
 0040B509    test        al,al
>0040B50B    je          0040B513
 0040B50D    fld         tbyte ptr [esp]
 0040B510    fstp        qword ptr [esi]
 0040B512    wait
 0040B513    add         esp,0C
 0040B516    pop         esi
 0040B517    pop         ebx
 0040B518    ret
*}
end;

//0040B51C
function TryStrToFloat(const S:AnsiString; var Value:Single):Boolean;
begin
{*
 0040B51C    push        ebx
 0040B51D    push        esi
 0040B51E    add         esp,0FFFFFFF4
 0040B521    mov         esi,edx
 0040B523    mov         ebx,eax
 0040B525    mov         eax,ebx
 0040B527    call        @LStrToPChar
 0040B52C    mov         edx,esp
 0040B52E    xor         ecx,ecx
 0040B530    call        TextToFloat
 0040B535    test        al,al
>0040B537    je          0040B53F
 0040B539    fld         tbyte ptr [esp]
 0040B53C    fstp        dword ptr [esi]
 0040B53E    wait
 0040B53F    add         esp,0C
 0040B542    pop         esi
 0040B543    pop         ebx
 0040B544    ret
*}
end;

//0040B548
function TryStrToCurr(const S:AnsiString; var Value:Currency):Boolean;
begin
{*
 0040B548    push        ebx
 0040B549    push        esi
 0040B54A    mov         esi,edx
 0040B54C    mov         ebx,eax
 0040B54E    mov         eax,ebx
 0040B550    call        @LStrToPChar
 0040B555    mov         edx,esi
 0040B557    mov         cl,1
 0040B559    call        TextToFloat
 0040B55E    pop         esi
 0040B55F    pop         ebx
 0040B560    ret
*}
end;

//0040B564
function DateTimeToTimeStamp(DateTime:TDateTime):TTimeStamp;
begin
{*
 0040B564    push        ebp
 0040B565    mov         ebp,esp
 0040B567    push        ebx
 0040B568    xor         ebx,ebx
 0040B56A    mov         ecx,eax
 0040B56C    fld         qword ptr [ebp+8]
 0040B56F    fmul        dword ptr [ebx+5AC208]
 0040B575    sub         esp,8
 0040B578    fistp       qword ptr [esp]
 0040B57B    wait
 0040B57C    pop         eax
 0040B57D    pop         edx
 0040B57E    or          edx,edx
>0040B580    jns         0040B593
 0040B582    neg         edx
 0040B584    neg         eax
 0040B586    sbb         edx,0
 0040B589    div         eax,dword ptr [ebx+5AC20C]
 0040B58F    neg         eax
>0040B591    jmp         0040B599
 0040B593    div         eax,dword ptr [ebx+5AC20C]
 0040B599    add         eax,0A955A
 0040B59E    mov         dword ptr [ecx],edx
 0040B5A0    mov         dword ptr [ecx+4],eax
 0040B5A3    pop         ebx
 0040B5A4    pop         ebp
 0040B5A5    ret         8
*}
end;

//0040B5A8
function TryEncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word; var Time:TDateTime):Boolean;
begin
{*
 0040B5A8    push        ebp
 0040B5A9    mov         ebp,esp
 0040B5AB    add         esp,0FFFFFFF8
 0040B5AE    push        esi
 0040B5AF    mov         esi,dword ptr [ebp+0C]
 0040B5B2    mov         byte ptr [ebp-1],0
 0040B5B6    cmp         ax,18
>0040B5BA    jae         0040B609
 0040B5BC    cmp         dx,3C
>0040B5C0    jae         0040B609
 0040B5C2    cmp         cx,3C
>0040B5C6    jae         0040B609
 0040B5C8    cmp         si,3E8
>0040B5CD    jae         0040B609
 0040B5CF    movzx       eax,ax
 0040B5D2    imul        eax,eax,36EE80
 0040B5D8    movzx       edx,dx
 0040B5DB    imul        edx,edx,0EA60
 0040B5E1    add         eax,edx
 0040B5E3    movzx       edx,cx
 0040B5E6    imul        edx,edx,3E8
 0040B5EC    add         eax,edx
 0040B5EE    movzx       edx,si
 0040B5F1    add         eax,edx
 0040B5F3    mov         dword ptr [ebp-8],eax
 0040B5F6    fild        dword ptr [ebp-8]
 0040B5F9    fdiv        dword ptr ds:[40B614]
 0040B5FF    mov         eax,dword ptr [ebp+8]
 0040B602    fstp        qword ptr [eax]
 0040B604    wait
 0040B605    mov         byte ptr [ebp-1],1
 0040B609    mov         al,byte ptr [ebp-1]
 0040B60C    pop         esi
 0040B60D    pop         ecx
 0040B60E    pop         ecx
 0040B60F    pop         ebp
 0040B610    ret         8
*}
end;

//0040B618
function EncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word):TDateTime;
begin
{*
 0040B618    push        ebp
 0040B619    mov         ebp,esp
 0040B61B    add         esp,0FFFFFFF8
 0040B61E    push        ebx
 0040B61F    push        esi
 0040B620    push        edi
 0040B621    mov         edi,ecx
 0040B623    mov         esi,edx
 0040B625    mov         ebx,eax
 0040B627    mov         ax,word ptr [ebp+8]
 0040B62B    push        eax
 0040B62C    lea         eax,[ebp-8]
 0040B62F    push        eax
 0040B630    mov         ecx,edi
 0040B632    mov         edx,esi
 0040B634    mov         eax,ebx
 0040B636    call        TryEncodeTime
 0040B63B    test        al,al
>0040B63D    jne         0040B649
 0040B63F    mov         eax,[005AE430];^STimeEncodeError:TResStringRec
 0040B644    call        ConvertError
 0040B649    fld         qword ptr [ebp-8]
 0040B64C    pop         edi
 0040B64D    pop         esi
 0040B64E    pop         ebx
 0040B64F    pop         ecx
 0040B650    pop         ecx
 0040B651    pop         ebp
 0040B652    ret         4
*}
end;

//0040B658
procedure DecodeTime(var Hour:Word; var Min:Word; var Sec:Word; const DateTime:TDateTime; var MSec:Word);
begin
{*
 0040B658    push        ebp
 0040B659    mov         ebp,esp
 0040B65B    add         esp,0FFFFFFF4
 0040B65E    push        ebx
 0040B65F    push        esi
 0040B660    push        edi
 0040B661    mov         edi,ecx
 0040B663    mov         esi,edx
 0040B665    mov         ebx,eax
 0040B667    lea         eax,[ebp-4]
 0040B66A    push        eax
 0040B66B    push        dword ptr [ebp+10]
 0040B66E    push        dword ptr [ebp+0C]
 0040B671    lea         eax,[ebp-0C]
 0040B674    call        DateTimeToTimeStamp
 0040B679    mov         eax,dword ptr [ebp-0C]
 0040B67C    lea         ecx,[ebp-2]
 0040B67F    mov         dx,0EA60
 0040B683    call        DivMod
 0040B688    push        esi
 0040B689    mov         ecx,ebx
 0040B68B    movzx       eax,word ptr [ebp-2]
 0040B68F    mov         dx,3C
 0040B693    call        DivMod
 0040B698    mov         eax,dword ptr [ebp+8]
 0040B69B    push        eax
 0040B69C    mov         ecx,edi
 0040B69E    movzx       eax,word ptr [ebp-4]
 0040B6A2    mov         dx,3E8
 0040B6A6    call        DivMod
 0040B6AB    pop         edi
 0040B6AC    pop         esi
 0040B6AD    pop         ebx
 0040B6AE    mov         esp,ebp
 0040B6B0    pop         ebp
 0040B6B1    ret         0C
*}
end;

//0040B6B4
function IsLeapYear(Year:Word):Boolean;
begin
{*
 0040B6B4    push        ebx
 0040B6B5    push        esi
 0040B6B6    mov         ecx,eax
 0040B6B8    movzx       eax,cx
 0040B6BB    and         eax,3
 0040B6BE    test        eax,eax
>0040B6C0    jne         0040B6E3
 0040B6C2    movzx       ebx,cx
 0040B6C5    mov         eax,ebx
 0040B6C7    mov         esi,64
 0040B6CC    xor         edx,edx
 0040B6CE    div         eax,esi
 0040B6D0    test        edx,edx
>0040B6D2    jne         0040B6E8
 0040B6D4    mov         eax,ebx
 0040B6D6    mov         ecx,190
 0040B6DB    xor         edx,edx
 0040B6DD    div         eax,ecx
 0040B6DF    test        edx,edx
>0040B6E1    je          0040B6E8
 0040B6E3    xor         eax,eax
 0040B6E5    pop         esi
 0040B6E6    pop         ebx
 0040B6E7    ret
 0040B6E8    mov         al,1
 0040B6EA    pop         esi
 0040B6EB    pop         ebx
 0040B6EC    ret
*}
end;

//0040B6F0
function TryEncodeDate(Year:Word; Month:Word; Day:Word; var Date:TDateTime):Boolean;
begin
{*
 0040B6F0    push        ebp
 0040B6F1    mov         ebp,esp
 0040B6F3    add         esp,0FFFFFFF8
 0040B6F6    push        ebx
 0040B6F7    push        esi
 0040B6F8    push        edi
 0040B6F9    mov         ebx,ecx
 0040B6FB    mov         edi,edx
 0040B6FD    mov         word ptr [ebp-2],ax
 0040B701    mov         byte ptr [ebp-3],0
 0040B705    mov         ax,word ptr [ebp-2]
 0040B709    call        IsLeapYear
 0040B70E    and         eax,7F
 0040B711    lea         eax,[eax+eax*2]
 0040B714    lea         esi,[eax*8+5AC168]
 0040B71B    cmp         word ptr [ebp-2],1
>0040B720    jb          0040B7AC
 0040B726    cmp         word ptr [ebp-2],270F
>0040B72C    ja          0040B7AC
 0040B72E    cmp         di,1
>0040B732    jb          0040B7AC
 0040B734    cmp         di,0C
>0040B738    ja          0040B7AC
 0040B73A    cmp         bx,1
>0040B73E    jb          0040B7AC
 0040B740    movzx       eax,di
 0040B743    cmp         bx,word ptr [esi+eax*2-2]
>0040B748    ja          0040B7AC
 0040B74A    movzx       eax,di
 0040B74D    dec         eax
 0040B74E    test        eax,eax
>0040B750    jle         0040B760
 0040B752    mov         ecx,1
 0040B757    add         bx,word ptr [esi+ecx*2-2]
 0040B75C    inc         ecx
 0040B75D    dec         eax
>0040B75E    jne         0040B757
 0040B760    movzx       ecx,word ptr [ebp-2]
 0040B764    dec         ecx
 0040B765    mov         eax,ecx
 0040B767    mov         esi,64
 0040B76C    cdq
 0040B76D    idiv        eax,esi
 0040B76F    imul        esi,ecx,16D
 0040B775    mov         edx,ecx
 0040B777    test        edx,edx
>0040B779    jns         0040B77E
 0040B77B    add         edx,3
 0040B77E    sar         edx,2
 0040B781    add         esi,edx
 0040B783    sub         esi,eax
 0040B785    mov         eax,ecx
 0040B787    mov         ecx,190
 0040B78C    cdq
 0040B78D    idiv        eax,ecx
 0040B78F    add         esi,eax
 0040B791    movzx       eax,bx
 0040B794    add         esi,eax
 0040B796    sub         esi,0A955A
 0040B79C    mov         dword ptr [ebp-8],esi
 0040B79F    fild        dword ptr [ebp-8]
 0040B7A2    mov         eax,dword ptr [ebp+8]
 0040B7A5    fstp        qword ptr [eax]
 0040B7A7    wait
 0040B7A8    mov         byte ptr [ebp-3],1
 0040B7AC    mov         al,byte ptr [ebp-3]
 0040B7AF    pop         edi
 0040B7B0    pop         esi
 0040B7B1    pop         ebx
 0040B7B2    pop         ecx
 0040B7B3    pop         ecx
 0040B7B4    pop         ebp
 0040B7B5    ret         4
*}
end;

//0040B7B8
function EncodeDate(Year:Word; Month:Word; Day:Word):TDateTime;
begin
{*
 0040B7B8    push        ebx
 0040B7B9    push        esi
 0040B7BA    push        edi
 0040B7BB    add         esp,0FFFFFFF8
 0040B7BE    mov         edi,ecx
 0040B7C0    mov         esi,edx
 0040B7C2    mov         ebx,eax
 0040B7C4    push        esp
 0040B7C5    mov         ecx,edi
 0040B7C7    mov         edx,esi
 0040B7C9    mov         eax,ebx
 0040B7CB    call        TryEncodeDate
 0040B7D0    test        al,al
>0040B7D2    jne         0040B7DE
 0040B7D4    mov         eax,[005AE5E0];^SDateEncodeError:TResStringRec
 0040B7D9    call        ConvertError
 0040B7DE    fld         qword ptr [esp]
 0040B7E1    pop         ecx
 0040B7E2    pop         edx
 0040B7E3    pop         edi
 0040B7E4    pop         esi
 0040B7E5    pop         ebx
 0040B7E6    ret
*}
end;

//0040B7E8
function DecodeDateFully(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime; var DOW:Word):Boolean;
begin
{*
 0040B7E8    push        ebp
 0040B7E9    mov         ebp,esp
 0040B7EB    add         esp,0FFFFFFE8
 0040B7EE    push        ebx
 0040B7EF    push        esi
 0040B7F0    mov         dword ptr [ebp-0C],ecx
 0040B7F3    mov         dword ptr [ebp-8],edx
 0040B7F6    mov         dword ptr [ebp-4],eax
 0040B7F9    mov         ebx,dword ptr [ebp+8]
 0040B7FC    push        dword ptr [ebp+10]
 0040B7FF    push        dword ptr [ebp+0C]
 0040B802    lea         eax,[ebp-18]
 0040B805    call        DateTimeToTimeStamp
 0040B80A    mov         ecx,dword ptr [ebp-14]
 0040B80D    test        ecx,ecx
>0040B80F    jg          0040B835
 0040B811    mov         eax,dword ptr [ebp-4]
 0040B814    mov         word ptr [eax],0
 0040B819    mov         eax,dword ptr [ebp-8]
 0040B81C    mov         word ptr [eax],0
 0040B821    mov         eax,dword ptr [ebp-0C]
 0040B824    mov         word ptr [eax],0
 0040B829    mov         word ptr [ebx],0
 0040B82E    xor         edx,edx
>0040B830    jmp         0040B927
 0040B835    mov         eax,ecx
 0040B837    mov         esi,7
 0040B83C    cdq
 0040B83D    idiv        eax,esi
 0040B83F    inc         edx
 0040B840    mov         word ptr [ebx],dx
 0040B843    dec         ecx
 0040B844    mov         bx,1
 0040B848    cmp         ecx,23AB1
>0040B84E    jl          0040B863
 0040B850    sub         ecx,23AB1
 0040B856    add         bx,190
 0040B85B    cmp         ecx,23AB1
>0040B861    jge         0040B850
 0040B863    lea         eax,[ebp-0E]
 0040B866    push        eax
 0040B867    lea         eax,[ebp-10]
 0040B86A    mov         dx,8EAC
 0040B86E    xchg        eax,ecx
 0040B86F    call        DivMod
 0040B874    cmp         word ptr [ebp-10],4
>0040B879    jne         0040B885
 0040B87B    dec         word ptr [ebp-10]
 0040B87F    add         word ptr [ebp-0E],8EAC
 0040B885    imul        ax,word ptr [ebp-10],64
 0040B88A    add         bx,ax
 0040B88D    lea         eax,[ebp-0E]
 0040B890    push        eax
 0040B891    lea         ecx,[ebp-10]
 0040B894    movzx       eax,word ptr [ebp-0E]
 0040B898    mov         dx,5B5
 0040B89C    call        DivMod
 0040B8A1    mov         ax,word ptr [ebp-10]
 0040B8A5    shl         eax,2
 0040B8A8    add         bx,ax
 0040B8AB    lea         eax,[ebp-0E]
 0040B8AE    push        eax
 0040B8AF    lea         ecx,[ebp-10]
 0040B8B2    movzx       eax,word ptr [ebp-0E]
 0040B8B6    mov         dx,16D
 0040B8BA    call        DivMod
 0040B8BF    cmp         word ptr [ebp-10],4
>0040B8C4    jne         0040B8D0
 0040B8C6    dec         word ptr [ebp-10]
 0040B8CA    add         word ptr [ebp-0E],16D
 0040B8D0    add         bx,word ptr [ebp-10]
 0040B8D4    mov         eax,ebx
 0040B8D6    call        IsLeapYear
 0040B8DB    mov         edx,eax
 0040B8DD    xor         eax,eax
 0040B8DF    mov         al,dl
 0040B8E1    lea         eax,[eax+eax*2]
 0040B8E4    lea         esi,[eax*8+5AC168]
 0040B8EB    mov         ax,1
 0040B8EF    movzx       ecx,ax
 0040B8F2    mov         cx,word ptr [esi+ecx*2-2]
 0040B8F7    mov         word ptr [ebp-10],cx
 0040B8FB    mov         cx,word ptr [ebp-0E]
 0040B8FF    cmp         cx,word ptr [ebp-10]
>0040B903    jb          0040B910
 0040B905    mov         cx,word ptr [ebp-10]
 0040B909    sub         word ptr [ebp-0E],cx
 0040B90D    inc         eax
>0040B90E    jmp         0040B8EF
 0040B910    mov         ecx,dword ptr [ebp-4]
 0040B913    mov         word ptr [ecx],bx
 0040B916    mov         ecx,dword ptr [ebp-8]
 0040B919    mov         word ptr [ecx],ax
 0040B91C    mov         ax,word ptr [ebp-0E]
 0040B920    inc         eax
 0040B921    mov         ecx,dword ptr [ebp-0C]
 0040B924    mov         word ptr [ecx],ax
 0040B927    mov         eax,edx
 0040B929    pop         esi
 0040B92A    pop         ebx
 0040B92B    mov         esp,ebp
 0040B92D    pop         ebp
 0040B92E    ret         0C
*}
end;

//0040B934
procedure DecodeDate(var Year:Word; var Month:Word; var Day:Word; const DateTime:TDateTime);
begin
{*
 0040B934    push        ebp
 0040B935    mov         ebp,esp
 0040B937    push        ecx
 0040B938    push        esi
 0040B939    mov         esi,eax
 0040B93B    push        dword ptr [ebp+0C]
 0040B93E    push        dword ptr [ebp+8]
 0040B941    lea         eax,[ebp-2]
 0040B944    push        eax
 0040B945    mov         eax,esi
 0040B947    call        DecodeDateFully
 0040B94C    pop         esi
 0040B94D    pop         ecx
 0040B94E    pop         ebp
 0040B94F    ret         8
*}
end;

//0040B954
function DayOfWeek(const DateTime:TDateTime):Word;
begin
{*
 0040B954    push        ebp
 0040B955    mov         ebp,esp
 0040B957    add         esp,0FFFFFFF8
 0040B95A    push        dword ptr [ebp+0C]
 0040B95D    push        dword ptr [ebp+8]
 0040B960    lea         eax,[ebp-8]
 0040B963    call        DateTimeToTimeStamp
 0040B968    mov         eax,dword ptr [ebp-4]
 0040B96B    mov         ecx,7
 0040B970    cdq
 0040B971    idiv        eax,ecx
 0040B973    mov         eax,edx
 0040B975    inc         eax
 0040B976    pop         ecx
 0040B977    pop         ecx
 0040B978    pop         ebp
 0040B979    ret         8
*}
end;

//0040B97C
function Now:TDateTime;
begin
{*
 0040B97C    add         esp,0FFFFFFE0
 0040B97F    lea         eax,[esp+8]
 0040B983    push        eax
 0040B984    call        KERNEL32.GetLocalTime
 0040B989    mov         cx,word ptr [esp+0E]
 0040B98E    mov         dx,word ptr [esp+0A]
 0040B993    mov         ax,word ptr [esp+8]
 0040B998    call        EncodeDate
 0040B99D    fstp        qword ptr [esp+18]
 0040B9A1    wait
 0040B9A2    mov         ax,word ptr [esp+16]
 0040B9A7    push        eax
 0040B9A8    mov         cx,word ptr [esp+18]
 0040B9AD    mov         dx,word ptr [esp+16]
 0040B9B2    mov         ax,word ptr [esp+14]
 0040B9B7    call        EncodeTime
 0040B9BC    fadd        qword ptr [esp+18]
 0040B9C0    fstp        qword ptr [esp]
 0040B9C3    wait
 0040B9C4    fld         qword ptr [esp]
 0040B9C7    add         esp,20
 0040B9CA    ret
*}
end;

//0040B9CC
function CurrentYear:Word;
begin
{*
 0040B9CC    add         esp,0FFFFFFF0
 0040B9CF    push        esp
 0040B9D0    call        KERNEL32.GetLocalTime
 0040B9D5    mov         ax,word ptr [esp]
 0040B9D9    add         esp,10
 0040B9DC    ret
*}
end;

//0040B9E0
procedure AppendChars(P:PChar; Count:Integer);
begin
{*
 0040B9E0    push        ebp
 0040B9E1    mov         ebp,esp
 0040B9E3    push        ebx
 0040B9E4    mov         ecx,dword ptr [ebp+8]
 0040B9E7    mov         ebx,100
 0040B9EC    sub         ebx,dword ptr [ecx-104]
 0040B9F2    cmp         edx,ebx
>0040B9F4    jge         0040B9F8
 0040B9F6    mov         ebx,edx
 0040B9F8    test        ebx,ebx
>0040B9FA    je          0040BA16
 0040B9FC    mov         edx,dword ptr [ebp+8]
 0040B9FF    mov         edx,dword ptr [edx-104]
 0040BA05    mov         ecx,dword ptr [ebp+8]
 0040BA08    lea         edx,[ecx+edx-100]
 0040BA0F    mov         ecx,ebx
 0040BA11    call        Move
 0040BA16    mov         eax,dword ptr [ebp+8]
 0040BA19    add         dword ptr [eax-104],ebx
 0040BA1F    pop         ebx
 0040BA20    pop         ebp
 0040BA21    ret
*}
end;

//0040BA24
procedure AppendString(const S:AnsiString);
begin
{*
 0040BA24    push        ebp
 0040BA25    mov         ebp,esp
 0040BA27    push        ebx
 0040BA28    mov         ebx,eax
 0040BA2A    mov         eax,dword ptr [ebp+8]
 0040BA2D    push        eax
 0040BA2E    mov         eax,ebx
 0040BA30    call        @LStrLen
 0040BA35    mov         edx,eax
 0040BA37    mov         eax,ebx
 0040BA39    call        AppendChars
 0040BA3E    pop         ecx
 0040BA3F    pop         ebx
 0040BA40    pop         ebp
 0040BA41    ret
*}
end;

//0040BA44
procedure AppendNumber(Number:Integer; Digits:Integer);
begin
{*
 0040BA44    push        ebp
 0040BA45    mov         ebp,esp
 0040BA47    add         esp,0FFFFFFE0
 0040BA4A    push        ebx
 0040BA4B    push        esi
 0040BA4C    mov         esi,edx
 0040BA4E    mov         ebx,eax
 0040BA50    mov         eax,dword ptr [ebp+8]
 0040BA53    push        eax
 0040BA54    push        4
 0040BA56    mov         dword ptr [ebp-20],esi
 0040BA59    mov         byte ptr [ebp-1C],0
 0040BA5D    mov         dword ptr [ebp-18],ebx
 0040BA60    mov         byte ptr [ebp-14],0
 0040BA64    lea         eax,[ebp-20]
 0040BA67    push        eax
 0040BA68    push        1
 0040BA6A    mov         ecx,5AC210
 0040BA6F    lea         eax,[ebp-10]
 0040BA72    mov         edx,10
 0040BA77    call        FormatBuf
 0040BA7C    mov         edx,eax
 0040BA7E    lea         eax,[ebp-10]
 0040BA81    call        AppendChars
 0040BA86    pop         ecx
 0040BA87    pop         esi
 0040BA88    pop         ebx
 0040BA89    mov         esp,ebp
 0040BA8B    pop         ebp
 0040BA8C    ret
*}
end;

//0040BA90
procedure GetCount;
begin
{*
 0040BA90    push        ebp
 0040BA91    mov         ebp,esp
 0040BA93    push        ebx
 0040BA94    mov         eax,dword ptr [ebp+8]
 0040BA97    add         eax,0FFFFFFFC
 0040BA9A    mov         edx,dword ptr [eax]
>0040BA9C    jmp         0040BAA0
 0040BA9E    inc         dword ptr [eax]
 0040BAA0    mov         ecx,dword ptr [eax]
 0040BAA2    mov         cl,byte ptr [ecx]
 0040BAA4    mov         ebx,dword ptr [ebp+8]
 0040BAA7    cmp         cl,byte ptr [ebx-5]
>0040BAAA    je          0040BA9E
 0040BAAC    mov         eax,dword ptr [eax]
 0040BAAE    sub         eax,edx
 0040BAB0    inc         eax
 0040BAB1    mov         edx,dword ptr [ebp+8]
 0040BAB4    mov         dword ptr [edx-0C],eax
 0040BAB7    pop         ebx
 0040BAB8    pop         ebp
 0040BAB9    ret
*}
end;

//0040BABC
procedure GetDate;
begin
{*
 0040BABC    push        ebp
 0040BABD    mov         ebp,esp
 0040BABF    mov         eax,dword ptr [ebp+8]
 0040BAC2    cmp         byte ptr [eax-13],0
>0040BAC6    jne         0040BAF2
 0040BAC8    mov         eax,dword ptr [ebp+8]
 0040BACB    mov         eax,dword ptr [eax+8]
 0040BACE    push        dword ptr [eax+0C]
 0040BAD1    push        dword ptr [eax+8]
 0040BAD4    mov         eax,dword ptr [ebp+8]
 0040BAD7    lea         ecx,[eax-12]
 0040BADA    mov         eax,dword ptr [ebp+8]
 0040BADD    lea         edx,[eax-10]
 0040BAE0    mov         eax,dword ptr [ebp+8]
 0040BAE3    add         eax,0FFFFFFF2
 0040BAE6    call        DecodeDate
 0040BAEB    mov         eax,dword ptr [ebp+8]
 0040BAEE    mov         byte ptr [eax-13],1
 0040BAF2    pop         ebp
 0040BAF3    ret
*}
end;

//0040BAF4
procedure GetTime;
begin
{*
 0040BAF4    push        ebp
 0040BAF5    mov         ebp,esp
 0040BAF7    mov         eax,dword ptr [ebp+8]
 0040BAFA    cmp         byte ptr [eax-1D],0
>0040BAFE    jne         0040BB31
 0040BB00    mov         eax,dword ptr [ebp+8]
 0040BB03    mov         eax,dword ptr [eax+8]
 0040BB06    push        dword ptr [eax+0C]
 0040BB09    push        dword ptr [eax+8]
 0040BB0C    mov         eax,dword ptr [ebp+8]
 0040BB0F    add         eax,0FFFFFFE4
 0040BB12    push        eax
 0040BB13    mov         eax,dword ptr [ebp+8]
 0040BB16    lea         ecx,[eax-1A]
 0040BB19    mov         eax,dword ptr [ebp+8]
 0040BB1C    lea         edx,[eax-18]
 0040BB1F    mov         eax,dword ptr [ebp+8]
 0040BB22    add         eax,0FFFFFFEA
 0040BB25    call        DecodeTime
 0040BB2A    mov         eax,dword ptr [ebp+8]
 0040BB2D    mov         byte ptr [eax-1D],1
 0040BB31    pop         ebp
 0040BB32    ret
*}
end;

//0040BB34
function ConvertEraString(const Count:Integer):AnsiString;
begin
{*
 0040BB34    push        ebp
 0040BB35    mov         ebp,esp
 0040BB37    add         esp,0FFFFFEE8
 0040BB3D    push        ebx
 0040BB3E    push        esi
 0040BB3F    xor         ecx,ecx
 0040BB41    mov         dword ptr [ebp-118],ecx
 0040BB47    mov         dword ptr [ebp-4],ecx
 0040BB4A    mov         ebx,edx
 0040BB4C    mov         esi,eax
 0040BB4E    xor         eax,eax
 0040BB50    push        ebp
 0040BB51    push        40BC82
 0040BB56    push        dword ptr fs:[eax]
 0040BB59    mov         dword ptr fs:[eax],esp
 0040BB5C    mov         eax,ebx
 0040BB5E    call        @LStrClr
 0040BB63    mov         eax,dword ptr [ebp+8]
 0040BB66    mov         ax,word ptr [eax-0E]
 0040BB6A    mov         word ptr [ebp-14],ax
 0040BB6E    mov         eax,dword ptr [ebp+8]
 0040BB71    mov         ax,word ptr [eax-10]
 0040BB75    mov         word ptr [ebp-12],ax
 0040BB79    mov         eax,dword ptr [ebp+8]
 0040BB7C    mov         ax,word ptr [eax-12]
 0040BB80    mov         word ptr [ebp-0E],ax
 0040BB84    lea         eax,[ebp-4]
 0040BB87    mov         edx,40BC98;'gg'
 0040BB8C    call        @LStrLAsg
 0040BB91    push        100
 0040BB96    lea         eax,[ebp-114]
 0040BB9C    push        eax
 0040BB9D    mov         eax,dword ptr [ebp-4]
 0040BBA0    call        @LStrToPChar
 0040BBA5    push        eax
 0040BBA6    lea         eax,[ebp-14]
 0040BBA9    push        eax
 0040BBAA    push        4
 0040BBAC    call        KERNEL32.GetThreadLocale
 0040BBB1    push        eax
 0040BBB2    call        KERNEL32.GetDateFormatA
 0040BBB7    test        eax,eax
>0040BBB9    je          0040BC61
 0040BBBF    mov         eax,ebx
 0040BBC1    lea         edx,[ebp-114]
 0040BBC7    mov         ecx,100
 0040BBCC    call        @LStrFromArray
 0040BBD1    dec         esi
>0040BBD2    jne         0040BC61
 0040BBD8    mov         eax,[005E0814]
 0040BBDD    sub         eax,4
>0040BBE0    je          0040BC04
 0040BBE2    sub         eax,0D
>0040BBE5    jne         0040BC61
 0040BBE7    push        ebx
 0040BBE8    mov         eax,dword ptr [ebx]
 0040BBEA    mov         edx,1
 0040BBEF    call        CharToByteLen
 0040BBF4    mov         ecx,eax
 0040BBF6    mov         eax,dword ptr [ebx]
 0040BBF8    mov         edx,1
 0040BBFD    call        @LStrCopy
>0040BC02    jmp         0040BC61
 0040BC04    cmp         dword ptr ds:[5E0818],1
>0040BC0B    jne         0040BC61
 0040BC0D    mov         eax,dword ptr [ebx]
 0040BC0F    call        @LStrLen
 0040BC14    mov         edx,eax
 0040BC16    mov         eax,dword ptr [ebx]
 0040BC18    call        ByteToCharLen
 0040BC1D    cmp         eax,4
>0040BC20    jne         0040BC61
 0040BC22    mov         eax,dword ptr [ebx]
 0040BC24    mov         edx,3
 0040BC29    call        CharToByteIndex
 0040BC2E    mov         esi,eax
 0040BC30    lea         eax,[ebp-114]
 0040BC36    add         esi,eax
 0040BC38    dec         esi
 0040BC39    lea         eax,[ebp-118]
 0040BC3F    mov         edx,esi
 0040BC41    call        @LStrFromPChar
 0040BC46    mov         eax,dword ptr [ebp-118]
 0040BC4C    mov         edx,2
 0040BC51    call        CharToByteLen
 0040BC56    mov         ecx,eax
 0040BC58    mov         eax,ebx
 0040BC5A    mov         edx,esi
 0040BC5C    call        @LStrFromPCharLen
 0040BC61    xor         eax,eax
 0040BC63    pop         edx
 0040BC64    pop         ecx
 0040BC65    pop         ecx
 0040BC66    mov         dword ptr fs:[eax],edx
 0040BC69    push        40BC89
 0040BC6E    lea         eax,[ebp-118]
 0040BC74    call        @LStrClr
 0040BC79    lea         eax,[ebp-4]
 0040BC7C    call        @LStrClr
 0040BC81    ret
>0040BC82    jmp         @HandleFinally
>0040BC87    jmp         0040BC6E
 0040BC89    pop         esi
 0040BC8A    pop         ebx
 0040BC8B    mov         esp,ebp
 0040BC8D    pop         ebp
 0040BC8E    ret
*}
end;

//0040BC9C
function ConvertYearString(const Count:Integer):AnsiString;
begin
{*
 0040BC9C    push        ebp
 0040BC9D    mov         ebp,esp
 0040BC9F    add         esp,0FFFFFEEC
 0040BCA5    push        ebx
 0040BCA6    push        esi
 0040BCA7    xor         ecx,ecx
 0040BCA9    mov         dword ptr [ebp-4],ecx
 0040BCAC    mov         ebx,edx
 0040BCAE    mov         esi,eax
 0040BCB0    xor         eax,eax
 0040BCB2    push        ebp
 0040BCB3    push        40BD7A
 0040BCB8    push        dword ptr fs:[eax]
 0040BCBB    mov         dword ptr fs:[eax],esp
 0040BCBE    mov         eax,ebx
 0040BCC0    call        @LStrClr
 0040BCC5    mov         eax,dword ptr [ebp+8]
 0040BCC8    mov         ax,word ptr [eax-0E]
 0040BCCC    mov         word ptr [ebp-14],ax
 0040BCD0    mov         eax,dword ptr [ebp+8]
 0040BCD3    mov         ax,word ptr [eax-10]
 0040BCD7    mov         word ptr [ebp-12],ax
 0040BCDB    mov         eax,dword ptr [ebp+8]
 0040BCDE    mov         ax,word ptr [eax-12]
 0040BCE2    mov         word ptr [ebp-0E],ax
 0040BCE6    cmp         esi,2
>0040BCE9    jg          0040BCFA
 0040BCEB    lea         eax,[ebp-4]
 0040BCEE    mov         edx,40BD90;'yy'
 0040BCF3    call        @LStrLAsg
>0040BCF8    jmp         0040BD07
 0040BCFA    lea         eax,[ebp-4]
 0040BCFD    mov         edx,40BD9C;'yyyy'
 0040BD02    call        @LStrLAsg
 0040BD07    push        100
 0040BD0C    lea         eax,[ebp-114]
 0040BD12    push        eax
 0040BD13    mov         eax,dword ptr [ebp-4]
 0040BD16    call        @LStrToPChar
 0040BD1B    push        eax
 0040BD1C    lea         eax,[ebp-14]
 0040BD1F    push        eax
 0040BD20    push        4
 0040BD22    call        KERNEL32.GetThreadLocale
 0040BD27    push        eax
 0040BD28    call        KERNEL32.GetDateFormatA
 0040BD2D    test        eax,eax
>0040BD2F    je          0040BD64
 0040BD31    mov         eax,ebx
 0040BD33    lea         edx,[ebp-114]
 0040BD39    mov         ecx,100
 0040BD3E    call        @LStrFromArray
 0040BD43    dec         esi
>0040BD44    jne         0040BD64
 0040BD46    mov         eax,dword ptr [ebx]
 0040BD48    cmp         byte ptr [eax],30
>0040BD4B    jne         0040BD64
 0040BD4D    push        ebx
 0040BD4E    mov         eax,dword ptr [ebx]
 0040BD50    call        @LStrLen
 0040BD55    mov         ecx,eax
 0040BD57    dec         ecx
 0040BD58    mov         eax,dword ptr [ebx]
 0040BD5A    mov         edx,2
 0040BD5F    call        @LStrCopy
 0040BD64    xor         eax,eax
 0040BD66    pop         edx
 0040BD67    pop         ecx
 0040BD68    pop         ecx
 0040BD69    mov         dword ptr fs:[eax],edx
 0040BD6C    push        40BD81
 0040BD71    lea         eax,[ebp-4]
 0040BD74    call        @LStrClr
 0040BD79    ret
>0040BD7A    jmp         @HandleFinally
>0040BD7F    jmp         0040BD71
 0040BD81    pop         esi
 0040BD82    pop         ebx
 0040BD83    mov         esp,ebp
 0040BD85    pop         ebp
 0040BD86    ret
*}
end;

//0040BDA4
procedure AppendFormat(Format:PChar);
begin
{*
 0040BDA4    push        ebp
 0040BDA5    mov         ebp,esp
 0040BDA7    add         esp,0FFFFFFD8
 0040BDAA    push        ebx
 0040BDAB    push        esi
 0040BDAC    xor         edx,edx
 0040BDAE    mov         dword ptr [ebp-28],edx
 0040BDB1    mov         dword ptr [ebp-24],edx
 0040BDB4    mov         dword ptr [ebp-4],eax
 0040BDB7    xor         eax,eax
 0040BDB9    push        ebp
 0040BDBA    push        40C525
 0040BDBF    push        dword ptr fs:[eax]
 0040BDC2    mov         dword ptr fs:[eax],esp
 0040BDC5    cmp         dword ptr [ebp-4],0
>0040BDC9    je          0040C50A
 0040BDCF    mov         eax,dword ptr [ebp+8]
 0040BDD2    cmp         dword ptr [eax-108],2
>0040BDD9    jge         0040C50A
 0040BDDF    mov         eax,dword ptr [ebp+8]
 0040BDE2    inc         dword ptr [eax-108]
 0040BDE8    mov         bl,20
 0040BDEA    mov         byte ptr [ebp-13],0
 0040BDEE    mov         byte ptr [ebp-1D],0
 0040BDF2    mov         byte ptr [ebp-1E],0
>0040BDF6    jmp         0040C4F4
 0040BDFB    mov         byte ptr [ebp-5],al
 0040BDFE    mov         al,byte ptr [ebp-5]
 0040BE01    and         eax,0FF
 0040BE06    bt          dword ptr ds:[5AC198],eax
>0040BE0D    jae         0040BE38
 0040BE0F    mov         eax,dword ptr [ebp+8]
 0040BE12    push        eax
 0040BE13    mov         eax,dword ptr [ebp-4]
 0040BE16    call        StrCharLength
 0040BE1B    mov         edx,eax
 0040BE1D    mov         eax,dword ptr [ebp-4]
 0040BE20    call        AppendChars
 0040BE25    pop         ecx
 0040BE26    mov         eax,dword ptr [ebp-4]
 0040BE29    call        StrNextChar
 0040BE2E    mov         dword ptr [ebp-4],eax
 0040BE31    mov         bl,20
>0040BE33    jmp         0040C4F4
 0040BE38    mov         eax,dword ptr [ebp-4]
 0040BE3B    call        StrNextChar
 0040BE40    mov         dword ptr [ebp-4],eax
 0040BE43    mov         al,byte ptr [ebp-5]
 0040BE46    mov         edx,eax
 0040BE48    add         dl,9F
 0040BE4B    sub         dl,1A
>0040BE4E    jae         0040BE52
 0040BE50    sub         al,20
 0040BE52    mov         edx,eax
 0040BE54    add         dl,0BF
 0040BE57    sub         dl,1A
>0040BE5A    jae         0040BE69
 0040BE5C    cmp         al,4D
>0040BE5E    jne         0040BE67
 0040BE60    cmp         bl,48
>0040BE63    jne         0040BE67
 0040BE65    mov         al,4E
 0040BE67    mov         ebx,eax
 0040BE69    and         eax,0FF
 0040BE6E    add         eax,0FFFFFFDE
 0040BE71    cmp         eax,38
>0040BE74    ja          0040C4E2
 0040BE7A    mov         al,byte ptr [eax+40BE87]
 0040BE80    jmp         dword ptr [eax*4+40BEC0]
 0040BE80    db          15
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          15
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          13
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          14
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          11
 0040BE80    db          0
 0040BE80    db          12
 0040BE80    db          5
 0040BE80    db          3
 0040BE80    db          0
 0040BE80    db          2
 0040BE80    db          6
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          4
 0040BE80    db          7
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          8
 0040BE80    db          9
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          0
 0040BE80    db          1
 0040BE80    db          10
 0040BE80    dd          0040C4E2
 0040BE80    dd          0040BF00
 0040BE80    dd          0040BF4F
 0040BE80    dd          0040BF7C
 0040BE80    dd          0040BFA9
 0040BE80    dd          0040C00E
 0040BE80    dd          0040C0BB
 0040BE80    dd          0040C1B5
 0040BE80    dd          0040C1E6
 0040BE80    dd          0040C217
 0040BE80    dd          0040C24C
 0040BE80    dd          0040C27D
 0040BE80    dd          0040C3F0
 0040BE80    dd          0040C44E
 0040BE80    dd          0040C474
 0040BE80    dd          0040C493
 0040BF00    push        ebp
 0040BF01    call        GetCount
 0040BF06    pop         ecx
 0040BF07    push        ebp
 0040BF08    call        GetDate
 0040BF0D    pop         ecx
 0040BF0E    cmp         dword ptr [ebp-0C],2
>0040BF12    jg          0040BF37
 0040BF14    mov         eax,dword ptr [ebp+8]
 0040BF17    push        eax
 0040BF18    movzx       eax,word ptr [ebp-0E]
 0040BF1C    mov         ecx,64
 0040BF21    xor         edx,edx
 0040BF23    div         eax,ecx
 0040BF25    mov         eax,edx
 0040BF27    mov         edx,2
 0040BF2C    call        AppendNumber
 0040BF31    pop         ecx
>0040BF32    jmp         0040C4F4
 0040BF37    mov         eax,dword ptr [ebp+8]
 0040BF3A    push        eax
 0040BF3B    movzx       eax,word ptr [ebp-0E]
 0040BF3F    mov         edx,4
 0040BF44    call        AppendNumber
 0040BF49    pop         ecx
>0040BF4A    jmp         0040C4F4
 0040BF4F    push        ebp
 0040BF50    call        GetCount
 0040BF55    pop         ecx
 0040BF56    push        ebp
 0040BF57    call        GetDate
 0040BF5C    pop         ecx
 0040BF5D    mov         eax,dword ptr [ebp+8]
 0040BF60    push        eax
 0040BF61    push        ebp
 0040BF62    lea         edx,[ebp-24]
 0040BF65    mov         eax,dword ptr [ebp-0C]
 0040BF68    call        ConvertEraString
 0040BF6D    pop         ecx
 0040BF6E    mov         eax,dword ptr [ebp-24]
 0040BF71    call        AppendString
 0040BF76    pop         ecx
>0040BF77    jmp         0040C4F4
 0040BF7C    push        ebp
 0040BF7D    call        GetCount
 0040BF82    pop         ecx
 0040BF83    push        ebp
 0040BF84    call        GetDate
 0040BF89    pop         ecx
 0040BF8A    mov         eax,dword ptr [ebp+8]
 0040BF8D    push        eax
 0040BF8E    push        ebp
 0040BF8F    lea         edx,[ebp-28]
 0040BF92    mov         eax,dword ptr [ebp-0C]
 0040BF95    call        ConvertYearString
 0040BF9A    pop         ecx
 0040BF9B    mov         eax,dword ptr [ebp-28]
 0040BF9E    call        AppendString
 0040BFA3    pop         ecx
>0040BFA4    jmp         0040C4F4
 0040BFA9    push        ebp
 0040BFAA    call        GetCount
 0040BFAF    pop         ecx
 0040BFB0    push        ebp
 0040BFB1    call        GetDate
 0040BFB6    pop         ecx
 0040BFB7    mov         eax,dword ptr [ebp-0C]
 0040BFBA    dec         eax
 0040BFBB    sub         eax,2
>0040BFBE    jb          0040BFC4
>0040BFC0    je          0040BFDA
>0040BFC2    jmp         0040BFF4
 0040BFC4    mov         eax,dword ptr [ebp+8]
 0040BFC7    push        eax
 0040BFC8    movzx       eax,word ptr [ebp-10]
 0040BFCC    mov         edx,dword ptr [ebp-0C]
 0040BFCF    call        AppendNumber
 0040BFD4    pop         ecx
>0040BFD5    jmp         0040C4F4
 0040BFDA    mov         eax,dword ptr [ebp+8]
 0040BFDD    push        eax
 0040BFDE    movzx       eax,word ptr [ebp-10]
 0040BFE2    mov         eax,dword ptr [eax*4+5E0774];LongTimeFormat:AnsiString
 0040BFE9    call        AppendString
 0040BFEE    pop         ecx
>0040BFEF    jmp         0040C4F4
 0040BFF4    mov         eax,dword ptr [ebp+8]
 0040BFF7    push        eax
 0040BFF8    movzx       eax,word ptr [ebp-10]
 0040BFFC    mov         eax,dword ptr [eax*4+5E07A4]
 0040C003    call        AppendString
 0040C008    pop         ecx
>0040C009    jmp         0040C4F4
 0040C00E    push        ebp
 0040C00F    call        GetCount
 0040C014    pop         ecx
 0040C015    mov         eax,dword ptr [ebp-0C]
 0040C018    dec         eax
 0040C019    sub         eax,2
>0040C01C    jb          0040C028
>0040C01E    je          0040C045
 0040C020    dec         eax
>0040C021    je          0040C06C
 0040C023    dec         eax
>0040C024    je          0040C093
>0040C026    jmp         0040C0A7
 0040C028    push        ebp
 0040C029    call        GetDate
 0040C02E    pop         ecx
 0040C02F    mov         eax,dword ptr [ebp+8]
 0040C032    push        eax
 0040C033    movzx       eax,word ptr [ebp-12]
 0040C037    mov         edx,dword ptr [ebp-0C]
 0040C03A    call        AppendNumber
 0040C03F    pop         ecx
>0040C040    jmp         0040C4F4
 0040C045    mov         eax,dword ptr [ebp+8]
 0040C048    push        eax
 0040C049    mov         eax,dword ptr [ebp+8]
 0040C04C    push        dword ptr [eax+0C]
 0040C04F    push        dword ptr [eax+8]
 0040C052    call        DayOfWeek
 0040C057    movzx       eax,ax
 0040C05A    mov         eax,dword ptr [eax*4+5E07D4]
 0040C061    call        AppendString
 0040C066    pop         ecx
>0040C067    jmp         0040C4F4
 0040C06C    mov         eax,dword ptr [ebp+8]
 0040C06F    push        eax
 0040C070    mov         eax,dword ptr [ebp+8]
 0040C073    push        dword ptr [eax+0C]
 0040C076    push        dword ptr [eax+8]
 0040C079    call        DayOfWeek
 0040C07E    movzx       eax,ax
 0040C081    mov         eax,dword ptr [eax*4+5E07F0]
 0040C088    call        AppendString
 0040C08D    pop         ecx
>0040C08E    jmp         0040C4F4
 0040C093    mov         eax,dword ptr [ebp+8]
 0040C096    push        eax
 0040C097    mov         eax,[005E075C];ShortDateFormat:AnsiString
 0040C09C    call        AppendFormat
 0040C0A1    pop         ecx
>0040C0A2    jmp         0040C4F4
 0040C0A7    mov         eax,dword ptr [ebp+8]
 0040C0AA    push        eax
 0040C0AB    mov         eax,[005E0760];LongDateFormat:AnsiString
 0040C0B0    call        AppendFormat
 0040C0B5    pop         ecx
>0040C0B6    jmp         0040C4F4
 0040C0BB    push        ebp
 0040C0BC    call        GetCount
 0040C0C1    pop         ecx
 0040C0C2    push        ebp
 0040C0C3    call        GetTime
 0040C0C8    pop         ecx
 0040C0C9    mov         byte ptr [ebp-1F],0
 0040C0CD    mov         esi,dword ptr [ebp-4]
>0040C0D0    jmp         0040C16A
 0040C0D5    and         eax,0FF
 0040C0DA    bt          dword ptr ds:[5AC198],eax
>0040C0E1    jae         0040C0EE
 0040C0E3    mov         eax,esi
 0040C0E5    call        StrNextChar
 0040C0EA    mov         esi,eax
>0040C0EC    jmp         0040C16A
 0040C0EE    xor         eax,eax
 0040C0F0    mov         al,byte ptr [esi]
 0040C0F2    cmp         eax,48
>0040C0F5    jg          0040C10A
>0040C0F7    je          0040C174
 0040C0F9    sub         eax,22
>0040C0FC    je          0040C161
 0040C0FE    sub         eax,5
>0040C101    je          0040C161
 0040C103    sub         eax,1A
>0040C106    je          0040C116
>0040C108    jmp         0040C169
 0040C10A    sub         eax,61
>0040C10D    je          0040C116
 0040C10F    sub         eax,7
>0040C112    je          0040C174
>0040C114    jmp         0040C169
 0040C116    cmp         byte ptr [ebp-1F],0
>0040C11A    jne         0040C169
 0040C11C    mov         edx,40C534
 0040C121    mov         ecx,5
 0040C126    mov         eax,esi
 0040C128    call        StrLIComp
 0040C12D    test        eax,eax
>0040C12F    je          0040C15B
 0040C131    mov         edx,40C53C
 0040C136    mov         ecx,3
 0040C13B    mov         eax,esi
 0040C13D    call        StrLIComp
 0040C142    test        eax,eax
>0040C144    je          0040C15B
 0040C146    mov         edx,40C540
 0040C14B    mov         ecx,4
 0040C150    mov         eax,esi
 0040C152    call        StrLIComp
 0040C157    test        eax,eax
>0040C159    jne         0040C174
 0040C15B    mov         byte ptr [ebp-1E],1
>0040C15F    jmp         0040C174
 0040C161    mov         al,byte ptr [ebp-1F]
 0040C164    xor         al,1
 0040C166    mov         byte ptr [ebp-1F],al
 0040C169    inc         esi
 0040C16A    mov         al,byte ptr [esi]
 0040C16C    test        al,al
>0040C16E    jne         0040C0D5
 0040C174    mov         ax,word ptr [ebp-16]
 0040C178    cmp         byte ptr [ebp-1E],0
>0040C17C    je          0040C193
 0040C17E    test        ax,ax
>0040C181    jne         0040C189
 0040C183    mov         ax,0C
>0040C187    jmp         0040C193
 0040C189    cmp         ax,0C
>0040C18D    jbe         0040C193
 0040C18F    sub         ax,0C
 0040C193    cmp         dword ptr [ebp-0C],2
>0040C197    jle         0040C1A0
 0040C199    mov         dword ptr [ebp-0C],2
 0040C1A0    mov         edx,dword ptr [ebp+8]
 0040C1A3    push        edx
 0040C1A4    movzx       eax,ax
 0040C1A7    mov         edx,dword ptr [ebp-0C]
 0040C1AA    call        AppendNumber
 0040C1AF    pop         ecx
>0040C1B0    jmp         0040C4F4
 0040C1B5    push        ebp
 0040C1B6    call        GetCount
 0040C1BB    pop         ecx
 0040C1BC    push        ebp
 0040C1BD    call        GetTime
 0040C1C2    pop         ecx
 0040C1C3    cmp         dword ptr [ebp-0C],2
>0040C1C7    jle         0040C1D0
 0040C1C9    mov         dword ptr [ebp-0C],2
 0040C1D0    mov         eax,dword ptr [ebp+8]
 0040C1D3    push        eax
 0040C1D4    movzx       eax,word ptr [ebp-18]
 0040C1D8    mov         edx,dword ptr [ebp-0C]
 0040C1DB    call        AppendNumber
 0040C1E0    pop         ecx
>0040C1E1    jmp         0040C4F4
 0040C1E6    push        ebp
 0040C1E7    call        GetCount
 0040C1EC    pop         ecx
 0040C1ED    push        ebp
 0040C1EE    call        GetTime
 0040C1F3    pop         ecx
 0040C1F4    cmp         dword ptr [ebp-0C],2
>0040C1F8    jle         0040C201
 0040C1FA    mov         dword ptr [ebp-0C],2
 0040C201    mov         eax,dword ptr [ebp+8]
 0040C204    push        eax
 0040C205    movzx       eax,word ptr [ebp-1A]
 0040C209    mov         edx,dword ptr [ebp-0C]
 0040C20C    call        AppendNumber
 0040C211    pop         ecx
>0040C212    jmp         0040C4F4
 0040C217    push        ebp
 0040C218    call        GetCount
 0040C21D    pop         ecx
 0040C21E    cmp         dword ptr [ebp-0C],1
>0040C222    jne         0040C238
 0040C224    mov         eax,dword ptr [ebp+8]
 0040C227    push        eax
 0040C228    mov         eax,[005E0770];ShortTimeFormat:AnsiString
 0040C22D    call        AppendFormat
 0040C232    pop         ecx
>0040C233    jmp         0040C4F4
 0040C238    mov         eax,dword ptr [ebp+8]
 0040C23B    push        eax
 0040C23C    mov         eax,[005E0774];LongTimeFormat:AnsiString
 0040C241    call        AppendFormat
 0040C246    pop         ecx
>0040C247    jmp         0040C4F4
 0040C24C    push        ebp
 0040C24D    call        GetCount
 0040C252    pop         ecx
 0040C253    push        ebp
 0040C254    call        GetTime
 0040C259    pop         ecx
 0040C25A    cmp         dword ptr [ebp-0C],3
>0040C25E    jle         0040C267
 0040C260    mov         dword ptr [ebp-0C],3
 0040C267    mov         eax,dword ptr [ebp+8]
 0040C26A    push        eax
 0040C26B    movzx       eax,word ptr [ebp-1C]
 0040C26F    mov         edx,dword ptr [ebp-0C]
 0040C272    call        AppendNumber
 0040C277    pop         ecx
>0040C278    jmp         0040C4F4
 0040C27D    push        ebp
 0040C27E    call        GetTime
 0040C283    pop         ecx
 0040C284    mov         esi,dword ptr [ebp-4]
 0040C287    dec         esi
 0040C288    mov         edx,40C534
 0040C28D    mov         ecx,5
 0040C292    mov         eax,esi
 0040C294    call        StrLIComp
 0040C299    test        eax,eax
>0040C29B    jne         0040C2C5
 0040C29D    cmp         word ptr [ebp-16],0C
>0040C2A2    jb          0040C2A7
 0040C2A4    add         esi,3
 0040C2A7    mov         eax,dword ptr [ebp+8]
 0040C2AA    push        eax
 0040C2AB    mov         edx,2
 0040C2B0    mov         eax,esi
 0040C2B2    call        AppendChars
 0040C2B7    pop         ecx
 0040C2B8    add         dword ptr [ebp-4],4
 0040C2BC    mov         byte ptr [ebp-1E],1
>0040C2C0    jmp         0040C4F4
 0040C2C5    mov         edx,40C53C
 0040C2CA    mov         ecx,3
 0040C2CF    mov         eax,esi
 0040C2D1    call        StrLIComp
 0040C2D6    test        eax,eax
>0040C2D8    jne         0040C302
 0040C2DA    cmp         word ptr [ebp-16],0C
>0040C2DF    jb          0040C2E4
 0040C2E1    add         esi,2
 0040C2E4    mov         eax,dword ptr [ebp+8]
 0040C2E7    push        eax
 0040C2E8    mov         edx,1
 0040C2ED    mov         eax,esi
 0040C2EF    call        AppendChars
 0040C2F4    pop         ecx
 0040C2F5    add         dword ptr [ebp-4],2
 0040C2F9    mov         byte ptr [ebp-1E],1
>0040C2FD    jmp         0040C4F4
 0040C302    mov         edx,40C540
 0040C307    mov         ecx,4
 0040C30C    mov         eax,esi
 0040C30E    call        StrLIComp
 0040C313    test        eax,eax
>0040C315    jne         0040C34B
 0040C317    cmp         word ptr [ebp-16],0C
>0040C31C    jae         0040C32F
 0040C31E    mov         eax,dword ptr [ebp+8]
 0040C321    push        eax
 0040C322    mov         eax,[005E0768];TimeAMString:AnsiString
 0040C327    call        AppendString
 0040C32C    pop         ecx
>0040C32D    jmp         0040C33E
 0040C32F    mov         eax,dword ptr [ebp+8]
 0040C332    push        eax
 0040C333    mov         eax,[005E076C];TimePMString:AnsiString
 0040C338    call        AppendString
 0040C33D    pop         ecx
 0040C33E    add         dword ptr [ebp-4],3
 0040C342    mov         byte ptr [ebp-1E],1
>0040C346    jmp         0040C4F4
 0040C34B    mov         edx,40C548
 0040C350    mov         ecx,4
 0040C355    mov         eax,esi
 0040C357    call        StrLIComp
 0040C35C    test        eax,eax
>0040C35E    jne         0040C392
 0040C360    push        ebp
 0040C361    call        GetDate
 0040C366    pop         ecx
 0040C367    mov         eax,dword ptr [ebp+8]
 0040C36A    push        eax
 0040C36B    mov         eax,dword ptr [ebp+8]
 0040C36E    push        dword ptr [eax+0C]
 0040C371    push        dword ptr [eax+8]
 0040C374    call        DayOfWeek
 0040C379    movzx       eax,ax
 0040C37C    mov         eax,dword ptr [eax*4+5E07F0]
 0040C383    call        AppendString
 0040C388    pop         ecx
 0040C389    add         dword ptr [ebp-4],3
>0040C38D    jmp         0040C4F4
 0040C392    mov         edx,40C550
 0040C397    mov         ecx,3
 0040C39C    mov         eax,esi
 0040C39E    call        StrLIComp
 0040C3A3    test        eax,eax
>0040C3A5    jne         0040C3D9
 0040C3A7    push        ebp
 0040C3A8    call        GetDate
 0040C3AD    pop         ecx
 0040C3AE    mov         eax,dword ptr [ebp+8]
 0040C3B1    push        eax
 0040C3B2    mov         eax,dword ptr [ebp+8]
 0040C3B5    push        dword ptr [eax+0C]
 0040C3B8    push        dword ptr [eax+8]
 0040C3BB    call        DayOfWeek
 0040C3C0    movzx       eax,ax
 0040C3C3    mov         eax,dword ptr [eax*4+5E07D4]
 0040C3CA    call        AppendString
 0040C3CF    pop         ecx
 0040C3D0    add         dword ptr [ebp-4],2
>0040C3D4    jmp         0040C4F4
 0040C3D9    mov         eax,dword ptr [ebp+8]
 0040C3DC    push        eax
 0040C3DD    lea         eax,[ebp-5]
 0040C3E0    mov         edx,1
 0040C3E5    call        AppendChars
 0040C3EA    pop         ecx
>0040C3EB    jmp         0040C4F4
 0040C3F0    push        ebp
 0040C3F1    call        GetCount
 0040C3F6    pop         ecx
 0040C3F7    mov         eax,dword ptr [ebp+8]
 0040C3FA    push        eax
 0040C3FB    mov         eax,[005E075C];ShortDateFormat:AnsiString
 0040C400    call        AppendFormat
 0040C405    pop         ecx
 0040C406    push        ebp
 0040C407    call        GetTime
 0040C40C    pop         ecx
 0040C40D    cmp         word ptr [ebp-16],0
>0040C412    jne         0040C426
 0040C414    cmp         word ptr [ebp-18],0
>0040C419    jne         0040C426
 0040C41B    cmp         word ptr [ebp-1A],0
>0040C420    je          0040C4F4
 0040C426    mov         eax,dword ptr [ebp+8]
 0040C429    push        eax
 0040C42A    mov         eax,40C554
 0040C42F    mov         edx,1
 0040C434    call        AppendChars
 0040C439    pop         ecx
 0040C43A    mov         eax,dword ptr [ebp+8]
 0040C43D    push        eax
 0040C43E    mov         eax,[005E0774];LongTimeFormat:AnsiString
 0040C443    call        AppendFormat
 0040C448    pop         ecx
>0040C449    jmp         0040C4F4
 0040C44E    cmp         byte ptr ds:[5E0759],0;DateSeparator:Char
>0040C455    je          0040C4F4
 0040C45B    mov         eax,dword ptr [ebp+8]
 0040C45E    push        eax
 0040C45F    mov         eax,5E0759;DateSeparator:Char
 0040C464    mov         edx,1
 0040C469    call        AppendChars
 0040C46E    pop         ecx
>0040C46F    jmp         0040C4F4
 0040C474    cmp         byte ptr ds:[5E0764],0;TimeSeparator:Char
>0040C47B    je          0040C4F4
 0040C47D    mov         eax,dword ptr [ebp+8]
 0040C480    push        eax
 0040C481    mov         eax,5E0764;TimeSeparator:Char
 0040C486    mov         edx,1
 0040C48B    call        AppendChars
 0040C490    pop         ecx
>0040C491    jmp         0040C4F4
 0040C493    mov         esi,dword ptr [ebp-4]
>0040C496    jmp         0040C4B6
 0040C498    and         eax,0FF
 0040C49D    bt          dword ptr ds:[5AC198],eax
>0040C4A4    jae         0040C4B3
 0040C4A6    mov         eax,dword ptr [ebp-4]
 0040C4A9    call        StrNextChar
 0040C4AE    mov         dword ptr [ebp-4],eax
>0040C4B1    jmp         0040C4B6
 0040C4B3    inc         dword ptr [ebp-4]
 0040C4B6    mov         eax,dword ptr [ebp-4]
 0040C4B9    mov         al,byte ptr [eax]
 0040C4BB    test        al,al
>0040C4BD    je          0040C4C4
 0040C4BF    cmp         al,byte ptr [ebp-5]
>0040C4C2    jne         0040C498
 0040C4C4    mov         eax,dword ptr [ebp+8]
 0040C4C7    push        eax
 0040C4C8    mov         edx,dword ptr [ebp-4]
 0040C4CB    sub         edx,esi
 0040C4CD    mov         eax,esi
 0040C4CF    call        AppendChars
 0040C4D4    pop         ecx
 0040C4D5    mov         eax,dword ptr [ebp-4]
 0040C4D8    cmp         byte ptr [eax],0
>0040C4DB    je          0040C4F4
 0040C4DD    inc         dword ptr [ebp-4]
>0040C4E0    jmp         0040C4F4
 0040C4E2    mov         eax,dword ptr [ebp+8]
 0040C4E5    push        eax
 0040C4E6    lea         eax,[ebp-5]
 0040C4E9    mov         edx,1
 0040C4EE    call        AppendChars
 0040C4F3    pop         ecx
 0040C4F4    mov         eax,dword ptr [ebp-4]
 0040C4F7    mov         al,byte ptr [eax]
 0040C4F9    test        al,al
>0040C4FB    jne         0040BDFB
 0040C501    mov         eax,dword ptr [ebp+8]
 0040C504    dec         dword ptr [eax-108]
 0040C50A    xor         eax,eax
 0040C50C    pop         edx
 0040C50D    pop         ecx
 0040C50E    pop         ecx
 0040C50F    mov         dword ptr fs:[eax],edx
 0040C512    push        40C52C
 0040C517    lea         eax,[ebp-28]
 0040C51A    mov         edx,2
 0040C51F    call        @LStrArrayClr
 0040C524    ret
>0040C525    jmp         @HandleFinally
>0040C52A    jmp         0040C517
 0040C52C    pop         esi
 0040C52D    pop         ebx
 0040C52E    mov         esp,ebp
 0040C530    pop         ebp
 0040C531    ret
*}
end;

//0040C558
procedure DateTimeToString(var Result:AnsiString; const Format:AnsiString; DateTime:TDateTime);
begin
{*
 0040C558    push        ebp
 0040C559    mov         ebp,esp
 0040C55B    add         esp,0FFFFFEF8
 0040C561    push        ebx
 0040C562    push        esi
 0040C563    mov         ebx,edx
 0040C565    mov         esi,eax
 0040C567    xor         eax,eax
 0040C569    mov         dword ptr [ebp-104],eax
 0040C56F    xor         eax,eax
 0040C571    mov         dword ptr [ebp-108],eax
 0040C577    test        ebx,ebx
>0040C579    je          0040C586
 0040C57B    push        ebp
 0040C57C    mov         eax,ebx
 0040C57E    call        AppendFormat
 0040C583    pop         ecx
>0040C584    jmp         0040C592
 0040C586    push        ebp
 0040C587    mov         eax,40C5B0
 0040C58C    call        AppendFormat
 0040C591    pop         ecx
 0040C592    lea         edx,[ebp-100]
 0040C598    mov         eax,esi
 0040C59A    mov         ecx,dword ptr [ebp-104]
 0040C5A0    call        @LStrFromPCharLen
 0040C5A5    pop         esi
 0040C5A6    pop         ebx
 0040C5A7    mov         esp,ebp
 0040C5A9    pop         ebp
 0040C5AA    ret         8
*}
end;

//0040C5B4
function DateTimeToStr(const DateTime:TDateTime):AnsiString;
begin
{*
 0040C5B4    push        ebp
 0040C5B5    mov         ebp,esp
 0040C5B7    push        dword ptr [ebp+0C]
 0040C5BA    push        dword ptr [ebp+8]
 0040C5BD    xor         edx,edx
 0040C5BF    call        DateTimeToString
 0040C5C4    pop         ebp
 0040C5C5    ret         8
*}
end;

//0040C5C8
procedure ScanBlanks(const S:AnsiString; var Pos:Integer);
begin
{*
 0040C5C8    push        ebx
 0040C5C9    push        esi
 0040C5CA    push        edi
 0040C5CB    mov         edi,edx
 0040C5CD    mov         esi,eax
 0040C5CF    mov         ebx,dword ptr [edi]
>0040C5D1    jmp         0040C5D4
 0040C5D3    inc         ebx
 0040C5D4    mov         eax,esi
 0040C5D6    call        @LStrLen
 0040C5DB    cmp         ebx,eax
>0040C5DD    jg          0040C5E6
 0040C5DF    cmp         byte ptr [esi+ebx-1],20
>0040C5E4    je          0040C5D3
 0040C5E6    mov         dword ptr [edi],ebx
 0040C5E8    pop         edi
 0040C5E9    pop         esi
 0040C5EA    pop         ebx
 0040C5EB    ret
*}
end;

//0040C5EC
function ScanNumber(const S:AnsiString; var Pos:Integer; var Number:Word; var CharCount:Byte):Boolean;
begin
{*
 0040C5EC    push        ebp
 0040C5ED    mov         ebp,esp
 0040C5EF    add         esp,0FFFFFFF4
 0040C5F2    push        ebx
 0040C5F3    push        esi
 0040C5F4    push        edi
 0040C5F5    mov         dword ptr [ebp-8],ecx
 0040C5F8    mov         dword ptr [ebp-4],edx
 0040C5FB    mov         edi,eax
 0040C5FD    mov         byte ptr [ebp-9],0
 0040C601    mov         eax,dword ptr [ebp+8]
 0040C604    mov         byte ptr [eax],0
 0040C607    mov         edx,dword ptr [ebp-4]
 0040C60A    mov         eax,edi
 0040C60C    call        ScanBlanks
 0040C611    mov         ebx,dword ptr [ebp-4]
 0040C614    mov         ebx,dword ptr [ebx]
 0040C616    xor         esi,esi
>0040C618    jmp         0040C631
 0040C61A    mov         eax,esi
 0040C61C    add         eax,eax
 0040C61E    lea         eax,[eax+eax*4]
 0040C621    xor         edx,edx
 0040C623    mov         dl,byte ptr [edi+ebx-1]
 0040C627    sub         dx,30
 0040C62B    add         ax,dx
 0040C62E    mov         esi,eax
 0040C630    inc         ebx
 0040C631    mov         eax,edi
 0040C633    call        @LStrLen
 0040C638    cmp         ebx,eax
>0040C63A    jg          0040C64D
 0040C63C    mov         al,byte ptr [edi+ebx-1]
 0040C640    add         al,0D0
 0040C642    sub         al,0A
>0040C644    jae         0040C64D
 0040C646    cmp         si,3E8
>0040C64B    jb          0040C61A
 0040C64D    mov         eax,dword ptr [ebp-4]
 0040C650    cmp         ebx,dword ptr [eax]
>0040C652    jle         0040C671
 0040C654    mov         eax,ebx
 0040C656    mov         edx,dword ptr [ebp-4]
 0040C659    mov         edx,dword ptr [edx]
 0040C65B    sub         al,dl
 0040C65D    mov         edx,dword ptr [ebp+8]
 0040C660    mov         byte ptr [edx],al
 0040C662    mov         eax,dword ptr [ebp-4]
 0040C665    mov         dword ptr [eax],ebx
 0040C667    mov         eax,dword ptr [ebp-8]
 0040C66A    mov         word ptr [eax],si
 0040C66D    mov         byte ptr [ebp-9],1
 0040C671    mov         al,byte ptr [ebp-9]
 0040C674    pop         edi
 0040C675    pop         esi
 0040C676    pop         ebx
 0040C677    mov         esp,ebp
 0040C679    pop         ebp
 0040C67A    ret         4
*}
end;

//0040C680
function ScanString(const S:AnsiString; var Pos:Integer; const Symbol:AnsiString):Boolean;
begin
{*
 0040C680    push        ebp
 0040C681    mov         ebp,esp
 0040C683    add         esp,0FFFFFFF8
 0040C686    push        ebx
 0040C687    push        esi
 0040C688    push        edi
 0040C689    xor         ebx,ebx
 0040C68B    mov         dword ptr [ebp-8],ebx
 0040C68E    mov         edi,ecx
 0040C690    mov         esi,edx
 0040C692    mov         dword ptr [ebp-4],eax
 0040C695    xor         eax,eax
 0040C697    push        ebp
 0040C698    push        40C6F9
 0040C69D    push        dword ptr fs:[eax]
 0040C6A0    mov         dword ptr fs:[eax],esp
 0040C6A3    xor         ebx,ebx
 0040C6A5    test        edi,edi
>0040C6A7    je          0040C6E3
 0040C6A9    mov         edx,esi
 0040C6AB    mov         eax,dword ptr [ebp-4]
 0040C6AE    call        ScanBlanks
 0040C6B3    lea         eax,[ebp-8]
 0040C6B6    push        eax
 0040C6B7    mov         eax,edi
 0040C6B9    call        @LStrLen
 0040C6BE    mov         ecx,eax
 0040C6C0    mov         edx,dword ptr [esi]
 0040C6C2    mov         eax,dword ptr [ebp-4]
 0040C6C5    call        @LStrCopy
 0040C6CA    mov         edx,dword ptr [ebp-8]
 0040C6CD    mov         eax,edi
 0040C6CF    call        AnsiCompareText
 0040C6D4    test        eax,eax
>0040C6D6    jne         0040C6E3
 0040C6D8    mov         eax,edi
 0040C6DA    call        @LStrLen
 0040C6DF    add         dword ptr [esi],eax
 0040C6E1    mov         bl,1
 0040C6E3    xor         eax,eax
 0040C6E5    pop         edx
 0040C6E6    pop         ecx
 0040C6E7    pop         ecx
 0040C6E8    mov         dword ptr fs:[eax],edx
 0040C6EB    push        40C700
 0040C6F0    lea         eax,[ebp-8]
 0040C6F3    call        @LStrClr
 0040C6F8    ret
>0040C6F9    jmp         @HandleFinally
>0040C6FE    jmp         0040C6F0
 0040C700    mov         eax,ebx
 0040C702    pop         edi
 0040C703    pop         esi
 0040C704    pop         ebx
 0040C705    pop         ecx
 0040C706    pop         ecx
 0040C707    pop         ebp
 0040C708    ret
*}
end;

//0040C70C
function ScanChar(const S:AnsiString; var Pos:Integer; Ch:Char):Boolean;
begin
{*
 0040C70C    push        ebx
 0040C70D    push        esi
 0040C70E    push        edi
 0040C70F    push        ecx
 0040C710    mov         byte ptr [esp],cl
 0040C713    mov         edi,edx
 0040C715    mov         esi,eax
 0040C717    xor         ebx,ebx
 0040C719    mov         edx,edi
 0040C71B    mov         eax,esi
 0040C71D    call        ScanBlanks
 0040C722    mov         eax,esi
 0040C724    call        @LStrLen
 0040C729    cmp         eax,dword ptr [edi]
>0040C72B    jl          0040C73C
 0040C72D    mov         eax,dword ptr [edi]
 0040C72F    mov         al,byte ptr [esi+eax-1]
 0040C733    cmp         al,byte ptr [esp]
>0040C736    jne         0040C73C
 0040C738    inc         dword ptr [edi]
 0040C73A    mov         bl,1
 0040C73C    mov         eax,ebx
 0040C73E    pop         edx
 0040C73F    pop         edi
 0040C740    pop         esi
 0040C741    pop         ebx
 0040C742    ret
*}
end;

//0040C744
function GetDateOrder(const DateFormat:AnsiString):TDateOrder;
begin
{*
 0040C744    push        ebx
 0040C745    push        esi
 0040C746    push        edi
 0040C747    mov         esi,eax
 0040C749    xor         ebx,ebx
 0040C74B    mov         edi,1
>0040C750    jmp         0040C77B
 0040C752    mov         al,byte ptr [esi+edi-1]
 0040C756    and         al,0DF
 0040C758    sub         al,44
>0040C75A    je          0040C776
 0040C75C    dec         al
>0040C75E    je          0040C76A
 0040C760    sub         al,8
>0040C762    je          0040C772
 0040C764    sub         al,0C
>0040C766    je          0040C76E
>0040C768    jmp         0040C77A
 0040C76A    mov         bl,2
>0040C76C    jmp         0040C788
 0040C76E    mov         bl,2
>0040C770    jmp         0040C788
 0040C772    xor         ebx,ebx
>0040C774    jmp         0040C788
 0040C776    mov         bl,1
>0040C778    jmp         0040C788
 0040C77A    inc         edi
 0040C77B    mov         eax,esi
 0040C77D    call        @LStrLen
 0040C782    cmp         edi,eax
>0040C784    jle         0040C752
 0040C786    xor         ebx,ebx
 0040C788    mov         eax,ebx
 0040C78A    pop         edi
 0040C78B    pop         esi
 0040C78C    pop         ebx
 0040C78D    ret
*}
end;

//0040C790
procedure ScanToNumber(const S:AnsiString; var Pos:Integer);
begin
{*
 0040C790    push        ebx
 0040C791    push        esi
 0040C792    mov         ebx,edx
 0040C794    mov         esi,eax
>0040C796    jmp         0040C7BB
 0040C798    mov         eax,dword ptr [ebx]
 0040C79A    mov         al,byte ptr [esi+eax-1]
 0040C79E    and         eax,0FF
 0040C7A3    bt          dword ptr ds:[5AC198],eax
>0040C7AA    jae         0040C7B9
 0040C7AC    mov         edx,dword ptr [ebx]
 0040C7AE    mov         eax,esi
 0040C7B0    call        NextCharIndex
 0040C7B5    mov         dword ptr [ebx],eax
>0040C7B7    jmp         0040C7BB
 0040C7B9    inc         dword ptr [ebx]
 0040C7BB    mov         eax,esi
 0040C7BD    call        @LStrLen
 0040C7C2    cmp         eax,dword ptr [ebx]
>0040C7C4    jl          0040C7D2
 0040C7C6    mov         eax,dword ptr [ebx]
 0040C7C8    mov         al,byte ptr [esi+eax-1]
 0040C7CC    add         al,0D0
 0040C7CE    sub         al,0A
>0040C7D0    jae         0040C798
 0040C7D2    pop         esi
 0040C7D3    pop         ebx
 0040C7D4    ret
*}
end;

//0040C7D8
function GetEraYearOffset(const Name:AnsiString):Integer;
begin
{*
 0040C7D8    push        ebx
 0040C7D9    push        esi
 0040C7DA    push        edi
 0040C7DB    push        ebp
 0040C7DC    push        ecx
 0040C7DD    mov         ebp,eax
 0040C7DF    xor         eax,eax
 0040C7E1    mov         dword ptr [esp],eax
 0040C7E4    mov         edi,7
 0040C7E9    mov         ebx,5E0820;EraNames:_DT_64
 0040C7EE    mov         esi,5E083C;EraYearOffsets:array[$1..$7] of System.Integer
 0040C7F3    cmp         dword ptr [ebx],0
>0040C7F6    je          0040C821
 0040C7F8    mov         eax,ebp
 0040C7FA    call        @LStrToPChar
 0040C7FF    push        eax
 0040C800    mov         eax,dword ptr [ebx]
 0040C802    call        @LStrToPChar
 0040C807    pop         edx
 0040C808    call        AnsiStrPos
 0040C80D    test        eax,eax
>0040C80F    je          0040C818
 0040C811    mov         eax,dword ptr [esi]
 0040C813    mov         dword ptr [esp],eax
>0040C816    jmp         0040C821
 0040C818    add         esi,4
 0040C81B    add         ebx,4
 0040C81E    dec         edi
>0040C81F    jne         0040C7F3
 0040C821    mov         eax,dword ptr [esp]
 0040C824    pop         edx
 0040C825    pop         ebp
 0040C826    pop         edi
 0040C827    pop         esi
 0040C828    pop         ebx
 0040C829    ret
*}
end;

//0040C82C
function EraToYear(Year:Integer):Integer;
begin
{*
 0040C82C    push        ebp
 0040C82D    mov         ebp,esp
 0040C82F    push        ebx
 0040C830    mov         ebx,eax
 0040C832    cmp         dword ptr ds:[5E0814],12
>0040C839    jne         0040C875
 0040C83B    cmp         ebx,63
>0040C83E    jg          0040C864
 0040C840    call        CurrentYear
 0040C845    movzx       ecx,ax
 0040C848    mov         eax,dword ptr [ebp+8]
 0040C84B    mov         eax,dword ptr [eax-4]
 0040C84E    cdq
 0040C84F    xor         eax,edx
 0040C851    sub         eax,edx
 0040C853    add         ecx,eax
 0040C855    mov         eax,ecx
 0040C857    mov         ecx,64
 0040C85C    cdq
 0040C85D    idiv        eax,ecx
 0040C85F    imul        eax,eax,64
 0040C862    add         ebx,eax
 0040C864    mov         eax,dword ptr [ebp+8]
 0040C867    cmp         dword ptr [eax-4],0
>0040C86B    jle         0040C87B
 0040C86D    mov         eax,dword ptr [ebp+8]
 0040C870    neg         dword ptr [eax-4]
>0040C873    jmp         0040C87B
 0040C875    mov         eax,dword ptr [ebp+8]
 0040C878    dec         dword ptr [eax-4]
 0040C87B    mov         eax,dword ptr [ebp+8]
 0040C87E    mov         eax,dword ptr [eax-4]
 0040C881    add         eax,ebx
 0040C883    pop         ebx
 0040C884    pop         ebp
 0040C885    ret
*}
end;

//0040C888
function ScanDate(const S:AnsiString; var Pos:Integer; var Date:TDateTime):Boolean;
begin
{*
 0040C888    push        ebp
 0040C889    mov         ebp,esp
 0040C88B    add         esp,0FFFFFFD8
 0040C88E    push        ebx
 0040C88F    push        esi
 0040C890    push        edi
 0040C891    xor         ebx,ebx
 0040C893    mov         dword ptr [ebp-28],ebx
 0040C896    mov         dword ptr [ebp-24],ebx
 0040C899    mov         dword ptr [ebp-20],ebx
 0040C89C    mov         dword ptr [ebp-1C],ebx
 0040C89F    mov         dword ptr [ebp-8],ecx
 0040C8A2    mov         ebx,edx
 0040C8A4    mov         esi,eax
 0040C8A6    xor         eax,eax
 0040C8A8    push        ebp
 0040C8A9    push        40CBA3
 0040C8AE    push        dword ptr fs:[eax]
 0040C8B1    mov         dword ptr fs:[eax],esp
 0040C8B4    xor         edi,edi
 0040C8B6    mov         word ptr [ebp-12],0
 0040C8BC    mov         word ptr [ebp-14],0
 0040C8C2    mov         byte ptr [ebp-18],0
 0040C8C6    mov         byte ptr [ebp-9],0
 0040C8CA    mov         eax,[005E075C];ShortDateFormat:AnsiString
 0040C8CF    call        GetDateOrder
 0040C8D4    mov         byte ptr [ebp-0A],al
 0040C8D7    xor         eax,eax
 0040C8D9    mov         dword ptr [ebp-4],eax
 0040C8DC    cmp         dword ptr ds:[5E075C],0;ShortDateFormat:AnsiString
>0040C8E3    je          0040C923
 0040C8E5    mov         eax,[005E075C];ShortDateFormat:AnsiString
 0040C8EA    cmp         byte ptr [eax],67
>0040C8ED    jne         0040C923
 0040C8EF    mov         edx,ebx
 0040C8F1    mov         eax,esi
 0040C8F3    call        ScanToNumber
 0040C8F8    lea         eax,[ebp-20]
 0040C8FB    push        eax
 0040C8FC    mov         ecx,dword ptr [ebx]
 0040C8FE    dec         ecx
 0040C8FF    mov         edx,1
 0040C904    mov         eax,esi
 0040C906    call        @LStrCopy
 0040C90B    mov         eax,dword ptr [ebp-20]
 0040C90E    lea         edx,[ebp-1C]
 0040C911    call        Trim
 0040C916    mov         eax,dword ptr [ebp-1C]
 0040C919    call        GetEraYearOffset
 0040C91E    mov         dword ptr [ebp-4],eax
>0040C921    jmp         0040C93F
 0040C923    mov         edx,dword ptr ds:[5E075C];ShortDateFormat:AnsiString
 0040C929    mov         eax,40CBBC;'e'
 0040C92E    call        AnsiPos
 0040C933    test        eax,eax
>0040C935    jle         0040C93F
 0040C937    mov         eax,[005E083C];EraYearOffsets:array[$1..$7] of System.Integer
 0040C93C    mov         dword ptr [ebp-4],eax
 0040C93F    lea         eax,[ebp-15]
 0040C942    push        eax
 0040C943    lea         ecx,[ebp-0C]
 0040C946    mov         edx,ebx
 0040C948    mov         eax,esi
 0040C94A    call        ScanNumber
 0040C94F    test        al,al
>0040C951    je          0040CB88
 0040C957    mov         edx,ebx
 0040C959    mov         cl,byte ptr ds:[5E0759];DateSeparator:Char
 0040C95F    mov         eax,esi
 0040C961    call        ScanChar
 0040C966    test        al,al
>0040C968    je          0040CB88
 0040C96E    lea         eax,[ebp-16]
 0040C971    push        eax
 0040C972    lea         ecx,[ebp-0E]
 0040C975    mov         edx,ebx
 0040C977    mov         eax,esi
 0040C979    call        ScanNumber
 0040C97E    test        al,al
>0040C980    je          0040CB88
 0040C986    mov         edx,ebx
 0040C988    mov         cl,byte ptr ds:[5E0759];DateSeparator:Char
 0040C98E    mov         eax,esi
 0040C990    call        ScanChar
 0040C995    test        al,al
>0040C997    je          0040CA6B
 0040C99D    lea         eax,[ebp-17]
 0040C9A0    push        eax
 0040C9A1    lea         ecx,[ebp-10]
 0040C9A4    mov         edx,ebx
 0040C9A6    mov         eax,esi
 0040C9A8    call        ScanNumber
 0040C9AD    test        al,al
>0040C9AF    je          0040CB88
 0040C9B5    mov         al,byte ptr [ebp-0A]
 0040C9B8    sub         al,1
>0040C9BA    jb          0040C9C4
>0040C9BC    je          0040C9E0
 0040C9BE    dec         al
>0040C9C0    je          0040C9FC
>0040C9C2    jmp         0040CA16
 0040C9C4    mov         di,word ptr [ebp-10]
 0040C9C8    mov         al,byte ptr [ebp-17]
 0040C9CB    mov         byte ptr [ebp-18],al
 0040C9CE    mov         ax,word ptr [ebp-0C]
 0040C9D2    mov         word ptr [ebp-12],ax
 0040C9D6    mov         ax,word ptr [ebp-0E]
 0040C9DA    mov         word ptr [ebp-14],ax
>0040C9DE    jmp         0040CA16
 0040C9E0    mov         di,word ptr [ebp-10]
 0040C9E4    mov         al,byte ptr [ebp-17]
 0040C9E7    mov         byte ptr [ebp-18],al
 0040C9EA    mov         ax,word ptr [ebp-0E]
 0040C9EE    mov         word ptr [ebp-12],ax
 0040C9F2    mov         ax,word ptr [ebp-0C]
 0040C9F6    mov         word ptr [ebp-14],ax
>0040C9FA    jmp         0040CA16
 0040C9FC    mov         di,word ptr [ebp-0C]
 0040CA00    mov         al,byte ptr [ebp-15]
 0040CA03    mov         byte ptr [ebp-18],al
 0040CA06    mov         ax,word ptr [ebp-0E]
 0040CA0A    mov         word ptr [ebp-12],ax
 0040CA0E    mov         ax,word ptr [ebp-10]
 0040CA12    mov         word ptr [ebp-14],ax
 0040CA16    cmp         dword ptr [ebp-4],0
>0040CA1A    jle         0040CA2A
 0040CA1C    push        ebp
 0040CA1D    movzx       eax,di
 0040CA20    call        EraToYear
 0040CA25    pop         ecx
 0040CA26    mov         edi,eax
>0040CA28    jmp         0040CA9A
 0040CA2A    cmp         byte ptr [ebp-18],2
>0040CA2E    ja          0040CA9A
 0040CA30    call        CurrentYear
 0040CA35    movzx       ecx,ax
 0040CA38    movzx       eax,word ptr ds:[5AC164]
 0040CA3F    sub         ecx,eax
 0040CA41    mov         eax,ecx
 0040CA43    push        ecx
 0040CA44    mov         ecx,64
 0040CA49    cdq
 0040CA4A    idiv        eax,ecx
 0040CA4C    pop         ecx
 0040CA4D    imul        ax,ax,64
 0040CA51    add         di,ax
 0040CA54    cmp         word ptr ds:[5AC164],0
>0040CA5C    jbe         0040CA9A
 0040CA5E    movzx       eax,di
 0040CA61    cmp         ecx,eax
>0040CA63    jle         0040CA9A
 0040CA65    add         di,64
>0040CA69    jmp         0040CA9A
 0040CA6B    call        CurrentYear
 0040CA70    mov         edi,eax
 0040CA72    cmp         byte ptr [ebp-0A],1
>0040CA76    jne         0040CA8A
 0040CA78    mov         ax,word ptr [ebp-0C]
 0040CA7C    mov         word ptr [ebp-14],ax
 0040CA80    mov         ax,word ptr [ebp-0E]
 0040CA84    mov         word ptr [ebp-12],ax
>0040CA88    jmp         0040CA9A
 0040CA8A    mov         ax,word ptr [ebp-0C]
 0040CA8E    mov         word ptr [ebp-12],ax
 0040CA92    mov         ax,word ptr [ebp-0E]
 0040CA96    mov         word ptr [ebp-14],ax
 0040CA9A    mov         edx,ebx
 0040CA9C    mov         cl,byte ptr ds:[5E0759];DateSeparator:Char
 0040CAA2    mov         eax,esi
 0040CAA4    call        ScanChar
 0040CAA9    mov         edx,ebx
 0040CAAB    mov         eax,esi
 0040CAAD    call        ScanBlanks
 0040CAB2    cmp         byte ptr ds:[5E081C],0
>0040CAB9    je          0040CB72
 0040CABF    mov         edx,dword ptr ds:[5E075C];ShortDateFormat:AnsiString
 0040CAC5    mov         eax,40CBC8;'ddd'
 0040CACA    call        @LStrPos
 0040CACF    test        eax,eax
>0040CAD1    je          0040CB72
 0040CAD7    mov         eax,[005E0770];ShortTimeFormat:AnsiString
 0040CADC    mov         al,byte ptr [eax]
 0040CADE    add         al,0D0
 0040CAE0    sub         al,0A
>0040CAE2    jae         0040CAF6
 0040CAE4    mov         edx,ebx
 0040CAE6    mov         eax,esi
 0040CAE8    call        ScanToNumber
>0040CAED    jmp         0040CB72
>0040CAF2    jmp         0040CAF6
 0040CAF4    inc         dword ptr [ebx]
 0040CAF6    mov         eax,esi
 0040CAF8    call        @LStrLen
 0040CAFD    cmp         eax,dword ptr [ebx]
>0040CAFF    jl          0040CB0A
 0040CB01    mov         eax,dword ptr [ebx]
 0040CB03    cmp         byte ptr [esi+eax-1],20
>0040CB08    jne         0040CAF4
 0040CB0A    mov         edx,ebx
 0040CB0C    mov         eax,esi
 0040CB0E    call        ScanBlanks
 0040CB13    mov         eax,esi
 0040CB15    call        @LStrLen
 0040CB1A    cmp         eax,dword ptr [ebx]
>0040CB1C    jl          0040CB72
 0040CB1E    lea         eax,[ebp-24]
 0040CB21    push        eax
 0040CB22    mov         eax,[005E0768];TimeAMString:AnsiString
 0040CB27    call        @LStrLen
 0040CB2C    mov         ecx,eax
 0040CB2E    mov         edx,dword ptr [ebx]
 0040CB30    mov         eax,esi
 0040CB32    call        @LStrCopy
 0040CB37    mov         edx,dword ptr [ebp-24]
 0040CB3A    mov         eax,[005E0768];TimeAMString:AnsiString
 0040CB3F    call        AnsiCompareText
 0040CB44    test        eax,eax
>0040CB46    je          0040CB72
 0040CB48    lea         eax,[ebp-28]
 0040CB4B    push        eax
 0040CB4C    mov         eax,[005E076C];TimePMString:AnsiString
 0040CB51    call        @LStrLen
 0040CB56    mov         ecx,eax
 0040CB58    mov         edx,dword ptr [ebx]
 0040CB5A    mov         eax,esi
 0040CB5C    call        @LStrCopy
 0040CB61    mov         edx,dword ptr [ebp-28]
 0040CB64    mov         eax,[005E076C];TimePMString:AnsiString
 0040CB69    call        AnsiCompareText
 0040CB6E    test        eax,eax
>0040CB70    jne         0040CAF6
 0040CB72    mov         eax,dword ptr [ebp-8]
 0040CB75    push        eax
 0040CB76    mov         cx,word ptr [ebp-14]
 0040CB7A    mov         dx,word ptr [ebp-12]
 0040CB7E    mov         eax,edi
 0040CB80    call        TryEncodeDate
 0040CB85    mov         byte ptr [ebp-9],al
 0040CB88    xor         eax,eax
 0040CB8A    pop         edx
 0040CB8B    pop         ecx
 0040CB8C    pop         ecx
 0040CB8D    mov         dword ptr fs:[eax],edx
 0040CB90    push        40CBAA
 0040CB95    lea         eax,[ebp-28]
 0040CB98    mov         edx,4
 0040CB9D    call        @LStrArrayClr
 0040CBA2    ret
>0040CBA3    jmp         @HandleFinally
>0040CBA8    jmp         0040CB95
 0040CBAA    mov         al,byte ptr [ebp-9]
 0040CBAD    pop         edi
 0040CBAE    pop         esi
 0040CBAF    pop         ebx
 0040CBB0    mov         esp,ebp
 0040CBB2    pop         ebp
 0040CBB3    ret
*}
end;

//0040CBCC
function ScanTime(const S:AnsiString; var Pos:Integer; var Time:TDateTime):Boolean;
begin
{*
 0040CBCC    push        ebx
 0040CBCD    push        esi
 0040CBCE    push        edi
 0040CBCF    push        ebp
 0040CBD0    add         esp,0FFFFFFF0
 0040CBD3    mov         dword ptr [esp],ecx
 0040CBD6    mov         esi,edx
 0040CBD8    mov         ebp,eax
 0040CBDA    xor         ebx,ebx
 0040CBDC    or          edi,0FFFFFFFF
 0040CBDF    mov         edx,esi
 0040CBE1    mov         ecx,dword ptr ds:[5E0768];TimeAMString:AnsiString
 0040CBE7    mov         eax,ebp
 0040CBE9    call        ScanString
 0040CBEE    test        al,al
>0040CBF0    jne         0040CC04
 0040CBF2    mov         edx,esi
 0040CBF4    mov         ecx,40CDB0;'AM'
 0040CBF9    mov         eax,ebp
 0040CBFB    call        ScanString
 0040CC00    test        al,al
>0040CC02    je          0040CC08
 0040CC04    xor         edi,edi
>0040CC06    jmp         0040CC32
 0040CC08    mov         edx,esi
 0040CC0A    mov         ecx,dword ptr ds:[5E076C];TimePMString:AnsiString
 0040CC10    mov         eax,ebp
 0040CC12    call        ScanString
 0040CC17    test        al,al
>0040CC19    jne         0040CC2D
 0040CC1B    mov         edx,esi
 0040CC1D    mov         ecx,40CDBC;'PM'
 0040CC22    mov         eax,ebp
 0040CC24    call        ScanString
 0040CC29    test        al,al
>0040CC2B    je          0040CC32
 0040CC2D    mov         edi,0C
 0040CC32    test        edi,edi
>0040CC34    jl          0040CC3F
 0040CC36    mov         edx,esi
 0040CC38    mov         eax,ebp
 0040CC3A    call        ScanBlanks
 0040CC3F    lea         eax,[esp+0C]
 0040CC43    push        eax
 0040CC44    lea         ecx,[esp+8]
 0040CC48    mov         edx,esi
 0040CC4A    mov         eax,ebp
 0040CC4C    call        ScanNumber
 0040CC51    test        al,al
>0040CC53    je          0040CD9E
 0040CC59    mov         word ptr [esp+6],0
 0040CC60    mov         word ptr [esp+8],0
 0040CC67    mov         word ptr [esp+0A],0
 0040CC6E    mov         edx,esi
 0040CC70    mov         cl,byte ptr ds:[5E0764];TimeSeparator:Char
 0040CC76    mov         eax,ebp
 0040CC78    call        ScanChar
 0040CC7D    test        al,al
>0040CC7F    je          0040CCF5
 0040CC81    lea         eax,[esp+0C]
 0040CC85    push        eax
 0040CC86    lea         ecx,[esp+0A]
 0040CC8A    mov         edx,esi
 0040CC8C    mov         eax,ebp
 0040CC8E    call        ScanNumber
 0040CC93    test        al,al
>0040CC95    je          0040CD9E
 0040CC9B    mov         edx,esi
 0040CC9D    mov         cl,byte ptr ds:[5E0764];TimeSeparator:Char
 0040CCA3    mov         eax,ebp
 0040CCA5    call        ScanChar
 0040CCAA    test        al,al
>0040CCAC    je          0040CCF5
 0040CCAE    lea         eax,[esp+0C]
 0040CCB2    push        eax
 0040CCB3    lea         ecx,[esp+0C]
 0040CCB7    mov         edx,esi
 0040CCB9    mov         eax,ebp
 0040CCBB    call        ScanNumber
 0040CCC0    test        al,al
>0040CCC2    je          0040CD9E
 0040CCC8    mov         edx,esi
 0040CCCA    mov         cl,byte ptr ds:[5E0757];DecimalSeparator:Char
 0040CCD0    mov         eax,ebp
 0040CCD2    call        ScanChar
 0040CCD7    test        al,al
>0040CCD9    je          0040CCF5
 0040CCDB    lea         eax,[esp+0C]
 0040CCDF    push        eax
 0040CCE0    lea         ecx,[esp+0E]
 0040CCE4    mov         edx,esi
 0040CCE6    mov         eax,ebp
 0040CCE8    call        ScanNumber
 0040CCED    test        al,al
>0040CCEF    je          0040CD9E
 0040CCF5    test        edi,edi
>0040CCF7    jge         0040CD4C
 0040CCF9    mov         edx,esi
 0040CCFB    mov         ecx,dword ptr ds:[5E0768];TimeAMString:AnsiString
 0040CD01    mov         eax,ebp
 0040CD03    call        ScanString
 0040CD08    test        al,al
>0040CD0A    jne         0040CD1E
 0040CD0C    mov         edx,esi
 0040CD0E    mov         ecx,40CDB0;'AM'
 0040CD13    mov         eax,ebp
 0040CD15    call        ScanString
 0040CD1A    test        al,al
>0040CD1C    je          0040CD22
 0040CD1E    xor         edi,edi
>0040CD20    jmp         0040CD4C
 0040CD22    mov         edx,esi
 0040CD24    mov         ecx,dword ptr ds:[5E076C];TimePMString:AnsiString
 0040CD2A    mov         eax,ebp
 0040CD2C    call        ScanString
 0040CD31    test        al,al
>0040CD33    jne         0040CD47
 0040CD35    mov         edx,esi
 0040CD37    mov         ecx,40CDBC;'PM'
 0040CD3C    mov         eax,ebp
 0040CD3E    call        ScanString
 0040CD43    test        al,al
>0040CD45    je          0040CD4C
 0040CD47    mov         edi,0C
 0040CD4C    test        edi,edi
>0040CD4E    jl          0040CD74
 0040CD50    cmp         word ptr [esp+4],0
>0040CD56    je          0040CD9E
 0040CD58    cmp         word ptr [esp+4],0C
>0040CD5E    ja          0040CD9E
 0040CD60    cmp         word ptr [esp+4],0C
>0040CD66    jne         0040CD6F
 0040CD68    mov         word ptr [esp+4],0
 0040CD6F    add         word ptr [esp+4],di
 0040CD74    mov         edx,esi
 0040CD76    mov         eax,ebp
 0040CD78    call        ScanBlanks
 0040CD7D    mov         ax,word ptr [esp+0A]
 0040CD82    push        eax
 0040CD83    mov         eax,dword ptr [esp+4]
 0040CD87    push        eax
 0040CD88    mov         cx,word ptr [esp+10]
 0040CD8D    mov         dx,word ptr [esp+0E]
 0040CD92    mov         ax,word ptr [esp+0C]
 0040CD97    call        TryEncodeTime
 0040CD9C    mov         ebx,eax
 0040CD9E    mov         eax,ebx
 0040CDA0    add         esp,10
 0040CDA3    pop         ebp
 0040CDA4    pop         edi
 0040CDA5    pop         esi
 0040CDA6    pop         ebx
 0040CDA7    ret
*}
end;

//0040CDC0
function TryStrToDate(const S:AnsiString; var Value:TDateTime):Boolean;
begin
{*
 0040CDC0    push        ebx
 0040CDC1    push        esi
 0040CDC2    push        ecx
 0040CDC3    mov         esi,edx
 0040CDC5    mov         ebx,eax
 0040CDC7    mov         dword ptr [esp],1
 0040CDCE    mov         ecx,esi
 0040CDD0    mov         edx,esp
 0040CDD2    mov         eax,ebx
 0040CDD4    call        ScanDate
 0040CDD9    test        al,al
>0040CDDB    je          0040CDE9
 0040CDDD    mov         eax,ebx
 0040CDDF    call        @LStrLen
 0040CDE4    cmp         eax,dword ptr [esp]
>0040CDE7    jl          0040CDED
 0040CDE9    xor         eax,eax
>0040CDEB    jmp         0040CDEF
 0040CDED    mov         al,1
 0040CDEF    pop         edx
 0040CDF0    pop         esi
 0040CDF1    pop         ebx
 0040CDF2    ret
*}
end;

//0040CDF4
function TryStrToTime(const S:AnsiString; var Value:TDateTime):Boolean;
begin
{*
 0040CDF4    push        ebx
 0040CDF5    push        esi
 0040CDF6    push        ecx
 0040CDF7    mov         esi,edx
 0040CDF9    mov         ebx,eax
 0040CDFB    mov         dword ptr [esp],1
 0040CE02    mov         ecx,esi
 0040CE04    mov         edx,esp
 0040CE06    mov         eax,ebx
 0040CE08    call        ScanTime
 0040CE0D    test        al,al
>0040CE0F    je          0040CE1D
 0040CE11    mov         eax,ebx
 0040CE13    call        @LStrLen
 0040CE18    cmp         eax,dword ptr [esp]
>0040CE1B    jl          0040CE21
 0040CE1D    xor         eax,eax
>0040CE1F    jmp         0040CE23
 0040CE21    mov         al,1
 0040CE23    pop         edx
 0040CE24    pop         esi
 0040CE25    pop         ebx
 0040CE26    ret
*}
end;

//0040CE28
function TryStrToDateTime(const S:AnsiString; var Value:TDateTime):Boolean;
begin
{*
 0040CE28    push        ebx
 0040CE29    push        esi
 0040CE2A    push        edi
 0040CE2B    add         esp,0FFFFFFE8
 0040CE2E    mov         edi,edx
 0040CE30    mov         esi,eax
 0040CE32    mov         bl,1
 0040CE34    mov         dword ptr [esp],1
 0040CE3B    xor         eax,eax
 0040CE3D    mov         dword ptr [esp+10],eax
 0040CE41    mov         dword ptr [esp+14],eax
 0040CE45    lea         ecx,[esp+8]
 0040CE49    mov         edx,esp
 0040CE4B    mov         eax,esi
 0040CE4D    call        ScanDate
 0040CE52    test        al,al
>0040CE54    je          0040CE73
 0040CE56    mov         eax,esi
 0040CE58    call        @LStrLen
 0040CE5D    cmp         eax,dword ptr [esp]
>0040CE60    jl          0040CE80
 0040CE62    lea         ecx,[esp+10]
 0040CE66    mov         edx,esp
 0040CE68    mov         eax,esi
 0040CE6A    call        ScanTime
 0040CE6F    test        al,al
>0040CE71    jne         0040CE80
 0040CE73    mov         edx,edi
 0040CE75    mov         eax,esi
 0040CE77    call        TryStrToTime
 0040CE7C    mov         ebx,eax
>0040CE7E    jmp         0040CEA7
 0040CE80    fld         qword ptr [esp+8]
 0040CE84    fcomp       dword ptr ds:[40CEB0]
 0040CE8A    fnstsw      al
 0040CE8C    sahf
>0040CE8D    jb          0040CE9C
 0040CE8F    fld         qword ptr [esp+8]
 0040CE93    fadd        qword ptr [esp+10]
 0040CE97    fstp        qword ptr [edi]
 0040CE99    wait
>0040CE9A    jmp         0040CEA7
 0040CE9C    fld         qword ptr [esp+8]
 0040CEA0    fsub        qword ptr [esp+10]
 0040CEA4    fstp        qword ptr [edi]
 0040CEA6    wait
 0040CEA7    mov         eax,ebx
 0040CEA9    add         esp,18
 0040CEAC    pop         edi
 0040CEAD    pop         esi
 0040CEAE    pop         ebx
 0040CEAF    ret
*}
end;

//0040CEB4
function SysErrorMessage(ErrorCode:Integer):AnsiString;
begin
{*
 0040CEB4    push        ebx
 0040CEB5    add         esp,0FFFFFF00
 0040CEBB    mov         ebx,edx
 0040CEBD    push        0
 0040CEBF    push        100
 0040CEC4    lea         edx,[esp+8]
 0040CEC8    push        edx
 0040CEC9    push        0
 0040CECB    push        eax
 0040CECC    push        0
 0040CECE    push        3200
 0040CED3    call        KERNEL32.FormatMessageA
>0040CED8    jmp         0040CEDB
 0040CEDA    dec         eax
 0040CEDB    test        eax,eax
>0040CEDD    jle         0040CEED
 0040CEDF    mov         dl,byte ptr [esp+eax-1]
 0040CEE3    sub         dl,21
>0040CEE6    jb          0040CEDA
 0040CEE8    sub         dl,0D
>0040CEEB    je          0040CEDA
 0040CEED    mov         edx,esp
 0040CEEF    mov         ecx,ebx
 0040CEF1    xchg        eax,ecx
 0040CEF2    call        @LStrFromPCharLen
 0040CEF7    add         esp,100
 0040CEFD    pop         ebx
 0040CEFE    ret
*}
end;

//0040CF00
function GetLocaleStr(Locale:Integer; LocaleType:Integer; const Default:AnsiString):AnsiString;
begin
{*
 0040CF00    push        ebp
 0040CF01    mov         ebp,esp
 0040CF03    add         esp,0FFFFFF00
 0040CF09    push        ebx
 0040CF0A    push        esi
 0040CF0B    mov         esi,ecx
 0040CF0D    mov         ebx,dword ptr [ebp+8]
 0040CF10    push        100
 0040CF15    lea         ecx,[ebp-100]
 0040CF1B    push        ecx
 0040CF1C    push        edx
 0040CF1D    push        eax
 0040CF1E    call        KERNEL32.GetLocaleInfoA
 0040CF23    test        eax,eax
>0040CF25    jle         0040CF39
 0040CF27    mov         ecx,eax
 0040CF29    dec         ecx
 0040CF2A    lea         edx,[ebp-100]
 0040CF30    mov         eax,ebx
 0040CF32    call        @LStrFromPCharLen
>0040CF37    jmp         0040CF42
 0040CF39    mov         eax,ebx
 0040CF3B    mov         edx,esi
 0040CF3D    call        @LStrAsg
 0040CF42    pop         esi
 0040CF43    pop         ebx
 0040CF44    mov         esp,ebp
 0040CF46    pop         ebp
 0040CF47    ret         4
*}
end;

//0040CF4C
function GetLocaleChar(Locale:Integer; LocaleType:Integer; Default:Char):Char;
begin
{*
 0040CF4C    push        ebx
 0040CF4D    push        esi
 0040CF4E    push        edi
 0040CF4F    push        ecx
 0040CF50    mov         ebx,ecx
 0040CF52    mov         esi,edx
 0040CF54    mov         edi,eax
 0040CF56    push        2
 0040CF58    lea         eax,[esp+4]
 0040CF5C    push        eax
 0040CF5D    push        esi
 0040CF5E    push        edi
 0040CF5F    call        KERNEL32.GetLocaleInfoA
 0040CF64    test        eax,eax
>0040CF66    jle         0040CF6D
 0040CF68    mov         al,byte ptr [esp]
>0040CF6B    jmp         0040CF6F
 0040CF6D    mov         eax,ebx
 0040CF6F    pop         edx
 0040CF70    pop         edi
 0040CF71    pop         esi
 0040CF72    pop         ebx
 0040CF73    ret
*}
end;

//0040CF74
{*function LocalGetLocaleStr(LocaleType:Integer; Index:Integer; const DefValues:array[$0..-$1] of System.Pointer; const _Dv_:?):AnsiString;
begin
 0040CF74    push        ebp
 0040CF75    mov         ebp,esp
 0040CF77    push        ecx
 0040CF78    push        ebx
 0040CF79    push        esi
 0040CF7A    push        edi
 0040CF7B    mov         dword ptr [ebp-4],ecx
 0040CF7E    mov         edi,edx
 0040CF80    mov         esi,eax
 0040CF82    mov         ebx,dword ptr [ebp+8]
 0040CF85    push        ebx
 0040CF86    mov         eax,dword ptr [ebp+10]
 0040CF89    mov         eax,dword ptr [eax-4]
 0040CF8C    xor         ecx,ecx
 0040CF8E    mov         edx,esi
 0040CF90    call        GetLocaleStr
 0040CF95    cmp         dword ptr [ebx],0
>0040CF98    jne         0040CFA7
 0040CF9A    mov         eax,dword ptr [ebp-4]
 0040CF9D    mov         eax,dword ptr [eax+edi*4]
 0040CFA0    mov         edx,ebx
 0040CFA2    call        LoadStr
 0040CFA7    pop         edi
 0040CFA8    pop         esi
 0040CFA9    pop         ebx
 0040CFAA    pop         ecx
 0040CFAB    pop         ebp
 0040CFAC    ret         8
end;*}

//0040CFB0
procedure GetMonthDayNames;
begin
{*
 0040CFB0    push        ebp
 0040CFB1    mov         ebp,esp
 0040CFB3    xor         ecx,ecx
 0040CFB5    push        ecx
 0040CFB6    push        ecx
 0040CFB7    push        ecx
 0040CFB8    push        ecx
 0040CFB9    push        ecx
 0040CFBA    push        ecx
 0040CFBB    push        ebx
 0040CFBC    push        esi
 0040CFBD    push        edi
 0040CFBE    xor         eax,eax
 0040CFC0    push        ebp
 0040CFC1    push        40D0C3
 0040CFC6    push        dword ptr fs:[eax]
 0040CFC9    mov         dword ptr fs:[eax],esp
 0040CFCC    call        KERNEL32.GetThreadLocale
 0040CFD1    mov         dword ptr [ebp-4],eax
 0040CFD4    mov         ebx,1
 0040CFD9    mov         esi,5E0778;ShortMonthNames:_DT_83
 0040CFDE    mov         edi,5E07A8;LongMonthNames:_DT_93
 0040CFE3    push        ebp
 0040CFE4    push        0B
 0040CFE6    lea         eax,[ebp-0C]
 0040CFE9    push        eax
 0040CFEA    mov         ecx,5AC214;^SShortMonthNameJan:TResStringRec
 0040CFEF    mov         edx,ebx
 0040CFF1    dec         edx
 0040CFF2    lea         eax,[ebx+44]
 0040CFF5    dec         eax
 0040CFF6    call        LocalGetLocaleStr
 0040CFFB    pop         ecx
 0040CFFC    mov         edx,dword ptr [ebp-0C]
 0040CFFF    mov         eax,esi
 0040D001    call        @LStrAsg
 0040D006    push        ebp
 0040D007    push        0B
 0040D009    lea         eax,[ebp-10]
 0040D00C    push        eax
 0040D00D    mov         ecx,5AC244;^SLongMonthNameJan:TResStringRec
 0040D012    mov         edx,ebx
 0040D014    dec         edx
 0040D015    lea         eax,[ebx+38]
 0040D018    dec         eax
 0040D019    call        LocalGetLocaleStr
 0040D01E    pop         ecx
 0040D01F    mov         edx,dword ptr [ebp-10]
 0040D022    mov         eax,edi
 0040D024    call        @LStrAsg
 0040D029    inc         ebx
 0040D02A    add         edi,4
 0040D02D    add         esi,4
 0040D030    cmp         ebx,0D
>0040D033    jne         0040CFE3
 0040D035    mov         ebx,1
 0040D03A    mov         esi,5E07D8;ShortDayNames:_DT_04
 0040D03F    mov         edi,5E07F4;LongDayNames:_DT_14
 0040D044    lea         eax,[ebx+5]
 0040D047    mov         ecx,7
 0040D04C    cdq
 0040D04D    idiv        eax,ecx
 0040D04F    mov         dword ptr [ebp-8],edx
 0040D052    push        ebp
 0040D053    push        6
 0040D055    lea         eax,[ebp-14]
 0040D058    push        eax
 0040D059    mov         ecx,5AC274;^SShortDayNameSun:TResStringRec
 0040D05E    mov         edx,ebx
 0040D060    dec         edx
 0040D061    mov         eax,dword ptr [ebp-8]
 0040D064    add         eax,31
 0040D067    call        LocalGetLocaleStr
 0040D06C    pop         ecx
 0040D06D    mov         edx,dword ptr [ebp-14]
 0040D070    mov         eax,esi
 0040D072    call        @LStrAsg
 0040D077    push        ebp
 0040D078    push        6
 0040D07A    lea         eax,[ebp-18]
 0040D07D    push        eax
 0040D07E    mov         ecx,5AC290;^SLongDayNameSun:TResStringRec
 0040D083    mov         edx,ebx
 0040D085    dec         edx
 0040D086    mov         eax,dword ptr [ebp-8]
 0040D089    add         eax,2A
 0040D08C    call        LocalGetLocaleStr
 0040D091    pop         ecx
 0040D092    mov         edx,dword ptr [ebp-18]
 0040D095    mov         eax,edi
 0040D097    call        @LStrAsg
 0040D09C    inc         ebx
 0040D09D    add         edi,4
 0040D0A0    add         esi,4
 0040D0A3    cmp         ebx,8
>0040D0A6    jne         0040D044
 0040D0A8    xor         eax,eax
 0040D0AA    pop         edx
 0040D0AB    pop         ecx
 0040D0AC    pop         ecx
 0040D0AD    mov         dword ptr fs:[eax],edx
 0040D0B0    push        40D0CA
 0040D0B5    lea         eax,[ebp-18]
 0040D0B8    mov         edx,4
 0040D0BD    call        @LStrArrayClr
 0040D0C2    ret
>0040D0C3    jmp         @HandleFinally
>0040D0C8    jmp         0040D0B5
 0040D0CA    pop         edi
 0040D0CB    pop         esi
 0040D0CC    pop         ebx
 0040D0CD    mov         esp,ebp
 0040D0CF    pop         ebp
 0040D0D0    ret
*}
end;

//0040D0D4
function EnumEraNames(Names:PChar):Integer; stdcall;
begin
{*
 0040D0D4    push        ebp
 0040D0D5    mov         ebp,esp
 0040D0D7    push        ebx
 0040D0D8    push        esi
 0040D0D9    xor         esi,esi
 0040D0DB    mov         ebx,1
>0040D0E0    jmp         0040D0E8
 0040D0E2    cmp         ebx,7
>0040D0E5    je          0040D106
 0040D0E7    inc         ebx
 0040D0E8    cmp         dword ptr [ebx*4+5E081C],0
>0040D0F0    jne         0040D0E2
 0040D0F2    lea         eax,[ebx*4+5E081C]
 0040D0F9    mov         edx,dword ptr [ebp+8]
 0040D0FC    call        @LStrFromPChar
 0040D101    mov         esi,1
 0040D106    mov         eax,esi
 0040D108    pop         esi
 0040D109    pop         ebx
 0040D10A    pop         ebp
 0040D10B    ret         4
*}
end;

//0040D110
function EnumEraYearOffsets(YearOffsets:PChar):Integer; stdcall;
begin
{*
 0040D110    push        ebp
 0040D111    mov         ebp,esp
 0040D113    push        0
 0040D115    push        ebx
 0040D116    push        esi
 0040D117    xor         eax,eax
 0040D119    push        ebp
 0040D11A    push        40D175
 0040D11F    push        dword ptr fs:[eax]
 0040D122    mov         dword ptr fs:[eax],esp
 0040D125    xor         esi,esi
 0040D127    mov         ebx,1
>0040D12C    jmp         0040D134
 0040D12E    cmp         ebx,7
>0040D131    je          0040D15F
 0040D133    inc         ebx
 0040D134    cmp         dword ptr [ebx*4+5E0838],0FFFFFFFF
>0040D13C    jne         0040D12E
 0040D13E    lea         eax,[ebp-4]
 0040D141    mov         edx,dword ptr [ebp+8]
 0040D144    call        @LStrFromPChar
 0040D149    mov         eax,dword ptr [ebp-4]
 0040D14C    xor         edx,edx
 0040D14E    call        StrToIntDef
 0040D153    mov         dword ptr [ebx*4+5E0838],eax
 0040D15A    mov         esi,1
 0040D15F    xor         eax,eax
 0040D161    pop         edx
 0040D162    pop         ecx
 0040D163    pop         ecx
 0040D164    mov         dword ptr fs:[eax],edx
 0040D167    push        40D17C
 0040D16C    lea         eax,[ebp-4]
 0040D16F    call        @LStrClr
 0040D174    ret
>0040D175    jmp         @HandleFinally
>0040D17A    jmp         0040D16C
 0040D17C    mov         eax,esi
 0040D17E    pop         esi
 0040D17F    pop         ebx
 0040D180    pop         ecx
 0040D181    pop         ebp
 0040D182    ret         4
*}
end;

//0040D188
procedure GetEraNamesAndYearOffsets;
begin
{*
 0040D188    push        ebp
 0040D189    mov         ebp,esp
 0040D18B    push        0
 0040D18D    push        esi
 0040D18E    xor         eax,eax
 0040D190    push        ebp
 0040D191    push        40D21F
 0040D196    push        dword ptr fs:[eax]
 0040D199    mov         dword ptr fs:[eax],esp
 0040D19C    lea         eax,[ebp-4]
 0040D19F    push        eax
 0040D1A0    call        KERNEL32.GetThreadLocale
 0040D1A5    mov         ecx,40D234;'1'
 0040D1AA    mov         edx,100B
 0040D1AF    call        GetLocaleStr
 0040D1B4    mov         eax,dword ptr [ebp-4]
 0040D1B7    mov         edx,1
 0040D1BC    call        StrToIntDef
 0040D1C1    mov         esi,eax
 0040D1C3    mov         eax,esi
 0040D1C5    add         eax,0FFFFFFFD
 0040D1C8    sub         eax,3
>0040D1CB    jae         0040D209
 0040D1CD    push        4
 0040D1CF    push        esi
 0040D1D0    call        KERNEL32.GetThreadLocale
 0040D1D5    push        eax
 0040D1D6    push        40D0D4;EnumEraNames:Integer
 0040D1DB    call        KERNEL32.EnumCalendarInfoA
 0040D1E0    mov         edx,7
 0040D1E5    mov         eax,5E083C;EraYearOffsets:array[$1..$7] of System.Integer
 0040D1EA    mov         dword ptr [eax],0FFFFFFFF
 0040D1F0    add         eax,4
 0040D1F3    dec         edx
>0040D1F4    jne         0040D1EA
 0040D1F6    push        3
 0040D1F8    push        esi
 0040D1F9    call        KERNEL32.GetThreadLocale
 0040D1FE    push        eax
 0040D1FF    push        40D110;EnumEraYearOffsets:Integer
 0040D204    call        KERNEL32.EnumCalendarInfoA
 0040D209    xor         eax,eax
 0040D20B    pop         edx
 0040D20C    pop         ecx
 0040D20D    pop         ecx
 0040D20E    mov         dword ptr fs:[eax],edx
 0040D211    push        40D226
 0040D216    lea         eax,[ebp-4]
 0040D219    call        @LStrClr
 0040D21E    ret
>0040D21F    jmp         @HandleFinally
>0040D224    jmp         0040D216
 0040D226    pop         esi
 0040D227    pop         ecx
 0040D228    pop         ebp
 0040D229    ret
*}
end;

//0040D238
function TranslateDateFormat(const FormatStr:AnsiString):AnsiString;
begin
{*
 0040D238    push        ebp
 0040D239    mov         ebp,esp
 0040D23B    xor         ecx,ecx
 0040D23D    push        ecx
 0040D23E    push        ecx
 0040D23F    push        ecx
 0040D240    push        ecx
 0040D241    push        ecx
 0040D242    push        ebx
 0040D243    push        esi
 0040D244    push        edi
 0040D245    mov         edi,edx
 0040D247    mov         esi,eax
 0040D249    xor         eax,eax
 0040D24B    push        ebp
 0040D24C    push        40D402
 0040D251    push        dword ptr fs:[eax]
 0040D254    mov         dword ptr fs:[eax],esp
 0040D257    mov         ebx,1
 0040D25C    mov         eax,edi
 0040D25E    call        @LStrClr
 0040D263    lea         eax,[ebp-8]
 0040D266    push        eax
 0040D267    call        KERNEL32.GetThreadLocale
 0040D26C    mov         ecx,40D418;'1'
 0040D271    mov         edx,1009
 0040D276    call        GetLocaleStr
 0040D27B    mov         eax,dword ptr [ebp-8]
 0040D27E    mov         edx,1
 0040D283    call        StrToIntDef
 0040D288    add         eax,0FFFFFFFD
 0040D28B    sub         eax,3
>0040D28E    jb          0040D3D8
 0040D294    mov         eax,[005E0814]
 0040D299    sub         eax,4
>0040D29C    je          0040D2AA
 0040D29E    add         eax,0FFFFFFF3
 0040D2A1    sub         eax,2
>0040D2A4    jb          0040D2AA
 0040D2A6    xor         eax,eax
>0040D2A8    jmp         0040D2AC
 0040D2AA    mov         al,1
 0040D2AC    test        al,al
>0040D2AE    je          0040D2E5
>0040D2B0    jmp         0040D2D5
 0040D2B2    mov         al,byte ptr [esi+ebx-1]
 0040D2B6    sub         al,47
>0040D2B8    je          0040D2D4
 0040D2BA    sub         al,20
>0040D2BC    je          0040D2D4
 0040D2BE    lea         eax,[ebp-0C]
 0040D2C1    mov         dl,byte ptr [esi+ebx-1]
 0040D2C5    call        @LStrFromChar
 0040D2CA    mov         edx,dword ptr [ebp-0C]
 0040D2CD    mov         eax,edi
 0040D2CF    call        @LStrCat
 0040D2D4    inc         ebx
 0040D2D5    mov         eax,esi
 0040D2D7    call        @LStrLen
 0040D2DC    cmp         ebx,eax
>0040D2DE    jle         0040D2B2
>0040D2E0    jmp         0040D3E7
 0040D2E5    mov         eax,edi
 0040D2E7    mov         edx,esi
 0040D2E9    call        @LStrAsg
>0040D2EE    jmp         0040D3E7
 0040D2F3    mov         al,byte ptr [esi+ebx-1]
 0040D2F7    and         eax,0FF
 0040D2FC    bt          dword ptr ds:[5AC198],eax
>0040D303    jae         0040D333
 0040D305    mov         edx,ebx
 0040D307    mov         eax,esi
 0040D309    call        CharLength
 0040D30E    mov         dword ptr [ebp-4],eax
 0040D311    lea         eax,[ebp-10]
 0040D314    push        eax
 0040D315    mov         ecx,dword ptr [ebp-4]
 0040D318    mov         edx,ebx
 0040D31A    mov         eax,esi
 0040D31C    call        @LStrCopy
 0040D321    mov         edx,dword ptr [ebp-10]
 0040D324    mov         eax,edi
 0040D326    call        @LStrCat
 0040D32B    add         ebx,dword ptr [ebp-4]
>0040D32E    jmp         0040D3D8
 0040D333    mov         edx,40D41C
 0040D338    lea         eax,[esi+ebx-1]
 0040D33C    mov         ecx,2
 0040D341    call        StrLIComp
 0040D346    test        eax,eax
>0040D348    jne         0040D359
 0040D34A    mov         eax,edi
 0040D34C    mov         edx,40D428;'ggg'
 0040D351    call        @LStrCat
 0040D356    inc         ebx
>0040D357    jmp         0040D3D7
 0040D359    mov         edx,40D42C
 0040D35E    lea         eax,[esi+ebx-1]
 0040D362    mov         ecx,4
 0040D367    call        StrLIComp
 0040D36C    test        eax,eax
>0040D36E    jne         0040D381
 0040D370    mov         eax,edi
 0040D372    mov         edx,40D43C;'eeee'
 0040D377    call        @LStrCat
 0040D37C    add         ebx,3
>0040D37F    jmp         0040D3D7
 0040D381    mov         edx,40D444
 0040D386    lea         eax,[esi+ebx-1]
 0040D38A    mov         ecx,2
 0040D38F    call        StrLIComp
 0040D394    test        eax,eax
>0040D396    jne         0040D3A7
 0040D398    mov         eax,edi
 0040D39A    mov         edx,40D450;'ee'
 0040D39F    call        @LStrCat
 0040D3A4    inc         ebx
>0040D3A5    jmp         0040D3D7
 0040D3A7    mov         al,byte ptr [esi+ebx-1]
 0040D3AB    sub         al,59
>0040D3AD    je          0040D3B3
 0040D3AF    sub         al,20
>0040D3B1    jne         0040D3C1
 0040D3B3    mov         eax,edi
 0040D3B5    mov         edx,40D45C;'e'
 0040D3BA    call        @LStrCat
>0040D3BF    jmp         0040D3D7
 0040D3C1    lea         eax,[ebp-14]
 0040D3C4    mov         dl,byte ptr [esi+ebx-1]
 0040D3C8    call        @LStrFromChar
 0040D3CD    mov         edx,dword ptr [ebp-14]
 0040D3D0    mov         eax,edi
 0040D3D2    call        @LStrCat
 0040D3D7    inc         ebx
 0040D3D8    mov         eax,esi
 0040D3DA    call        @LStrLen
 0040D3DF    cmp         ebx,eax
>0040D3E1    jle         0040D2F3
 0040D3E7    xor         eax,eax
 0040D3E9    pop         edx
 0040D3EA    pop         ecx
 0040D3EB    pop         ecx
 0040D3EC    mov         dword ptr fs:[eax],edx
 0040D3EF    push        40D409
 0040D3F4    lea         eax,[ebp-14]
 0040D3F7    mov         edx,4
 0040D3FC    call        @LStrArrayClr
 0040D401    ret
>0040D402    jmp         @HandleFinally
>0040D407    jmp         0040D3F4
 0040D409    pop         edi
 0040D40A    pop         esi
 0040D40B    pop         ebx
 0040D40C    mov         esp,ebp
 0040D40E    pop         ebp
 0040D40F    ret
*}
end;

//0040D460
function ConvertAddr(Address:Pointer):Pointer;
begin
{*
 0040D460    test        eax,eax
>0040D462    je          0040D469
 0040D464    sub         eax,1000
 0040D469    ret
*}
end;

//0040D46C
function ExceptionErrorMessage(ExceptObject:TObject; ExceptAddr:Pointer; Buffer:PChar; Size:Integer):Integer;
begin
{*
 0040D46C    push        ebp
 0040D46D    mov         ebp,esp
 0040D46F    add         esp,0FFFFFBA8
 0040D475    push        ebx
 0040D476    push        esi
 0040D477    push        edi
 0040D478    mov         dword ptr [ebp-4],ecx
 0040D47B    mov         ebx,edx
 0040D47D    mov         esi,eax
 0040D47F    push        1C
 0040D481    lea         eax,[ebp-330]
 0040D487    push        eax
 0040D488    push        ebx
 0040D489    call        KERNEL32.VirtualQuery
 0040D48E    cmp         dword ptr [ebp-320],1000
>0040D498    jne         0040D4B6
 0040D49A    push        105
 0040D49F    lea         eax,[ebp-212]
 0040D4A5    push        eax
 0040D4A6    mov         eax,dword ptr [ebp-32C]
 0040D4AC    push        eax
 0040D4AD    call        KERNEL32.GetModuleFileNameA
 0040D4B2    test        eax,eax
>0040D4B4    jne         0040D4D9
 0040D4B6    push        105
 0040D4BB    lea         eax,[ebp-212]
 0040D4C1    push        eax
 0040D4C2    mov         eax,[005AF664];gvar_005AF664
 0040D4C7    push        eax
 0040D4C8    call        KERNEL32.GetModuleFileNameA
 0040D4CD    mov         eax,ebx
 0040D4CF    call        ConvertAddr
 0040D4D4    mov         dword ptr [ebp-8],eax
>0040D4D7    jmp         0040D4E2
 0040D4D9    sub         ebx,dword ptr [ebp-32C]
 0040D4DF    mov         dword ptr [ebp-8],ebx
 0040D4E2    lea         eax,[ebp-212]
 0040D4E8    mov         dl,5C
 0040D4EA    call        AnsiStrRScan
 0040D4EF    mov         edx,eax
 0040D4F1    inc         edx
 0040D4F2    lea         eax,[ebp-10D]
 0040D4F8    mov         ecx,104
 0040D4FD    call        StrLCopy
 0040D502    mov         ebx,40D5EC
 0040D507    mov         edi,40D5EC
 0040D50C    mov         eax,esi
 0040D50E    mov         edx,dword ptr ds:[408B30];Exception
 0040D514    call        @IsClass
 0040D519    test        al,al
>0040D51B    je          0040D53E
 0040D51D    mov         eax,dword ptr [esi+4]
 0040D520    call        @LStrToPChar
 0040D525    mov         ebx,eax
 0040D527    mov         eax,ebx
 0040D529    call        StrLen
 0040D52E    test        eax,eax
>0040D530    je          0040D53E
 0040D532    cmp         byte ptr [ebx+eax-1],2E
>0040D537    je          0040D53E
 0040D539    mov         edi,40D5F0
 0040D53E    push        100
 0040D543    lea         eax,[ebp-312]
 0040D549    push        eax
 0040D54A    mov         eax,[005AE7C4];^SResString0:TResStringRec
 0040D54F    mov         eax,dword ptr [eax+4]
 0040D552    push        eax
 0040D553    mov         eax,[005AF664];gvar_005AF664
 0040D558    call        FindResourceHInstance
 0040D55D    push        eax
 0040D55E    call        user32.LoadStringA
 0040D563    lea         edx,[ebp-458]
 0040D569    mov         eax,dword ptr [esi]
 0040D56B    call        TObject.ClassName
 0040D570    lea         eax,[ebp-458]
 0040D576    mov         dword ptr [ebp-358],eax
 0040D57C    mov         byte ptr [ebp-354],4
 0040D583    lea         eax,[ebp-10D]
 0040D589    mov         dword ptr [ebp-350],eax
 0040D58F    mov         byte ptr [ebp-34C],6
 0040D596    mov         eax,dword ptr [ebp-8]
 0040D599    mov         dword ptr [ebp-348],eax
 0040D59F    mov         byte ptr [ebp-344],5
 0040D5A6    mov         dword ptr [ebp-340],ebx
 0040D5AC    mov         byte ptr [ebp-33C],6
 0040D5B3    mov         dword ptr [ebp-338],edi
 0040D5B9    mov         byte ptr [ebp-334],6
 0040D5C0    lea         eax,[ebp-358]
 0040D5C6    push        eax
 0040D5C7    push        4
 0040D5C9    lea         ecx,[ebp-312]
 0040D5CF    mov         edx,dword ptr [ebp+8]
 0040D5D2    mov         eax,dword ptr [ebp-4]
 0040D5D5    call        StrLFmt
 0040D5DA    mov         eax,dword ptr [ebp-4]
 0040D5DD    call        StrLen
 0040D5E2    pop         edi
 0040D5E3    pop         esi
 0040D5E4    pop         ebx
 0040D5E5    mov         esp,ebp
 0040D5E7    pop         ebp
 0040D5E8    ret         4
*}
end;

//0040D5F4
procedure ShowException(ExceptObject:TObject; ExceptAddr:Pointer);
begin
{*
 0040D5F4    add         esp,0FFFFFBBC
 0040D5FA    push        400
 0040D5FF    lea         ecx,[esp+48]
 0040D603    call        ExceptionErrorMessage
 0040D608    mov         eax,[005AE640];IsConsole:Boolean
 0040D60D    cmp         byte ptr [eax],0
>0040D610    je          0040D670
 0040D612    mov         eax,[005AE2DC];Output:Text
 0040D617    call        Flush
 0040D61C    call        @_IOTest
 0040D621    lea         eax,[esp+44]
 0040D625    push        eax
 0040D626    lea         eax,[esp+48]
 0040D62A    push        eax
 0040D62B    call        user32.CharToOemA
 0040D630    push        0
 0040D632    lea         eax,[esp+4]
 0040D636    push        eax
 0040D637    lea         eax,[esp+4C]
 0040D63B    call        StrLen
 0040D640    push        eax
 0040D641    lea         eax,[esp+50]
 0040D645    push        eax
 0040D646    push        0F4
 0040D648    call        KERNEL32.GetStdHandle
 0040D64D    push        eax
 0040D64E    call        KERNEL32.WriteFile
 0040D653    push        0
 0040D655    lea         eax,[esp+4]
 0040D659    push        eax
 0040D65A    push        2
 0040D65C    push        40D6B8;#13+#10
 0040D661    push        0F4
 0040D663    call        KERNEL32.GetStdHandle
 0040D668    push        eax
 0040D669    call        KERNEL32.WriteFile
>0040D66E    jmp         0040D6A6
 0040D670    push        40
 0040D672    lea         eax,[esp+8]
 0040D676    push        eax
 0040D677    mov         eax,[005AE270];^SExceptTitle:TResStringRec
 0040D67C    mov         eax,dword ptr [eax+4]
 0040D67F    push        eax
 0040D680    mov         eax,[005AF664];gvar_005AF664
 0040D685    call        FindResourceHInstance
 0040D68A    push        eax
 0040D68B    call        user32.LoadStringA
 0040D690    push        2010
 0040D695    lea         eax,[esp+8]
 0040D699    push        eax
 0040D69A    lea         eax,[esp+4C]
 0040D69E    push        eax
 0040D69F    push        0
 0040D6A1    call        user32.MessageBoxA
 0040D6A6    add         esp,444
 0040D6AC    ret
*}
end;

//0040D6BC
function ReturnAddr:Pointer;
begin
{*
 0040D6BC    mov         eax,dword ptr [ebp+4]
 0040D6BF    ret
*}
end;

//0040D6C0
procedure Abort;
begin
{*
 0040D6C0    call        ReturnAddr
 0040D6C5    push        eax
 0040D6C6    mov         ecx,dword ptr ds:[5AE408];^SOperationAborted:TResStringRec
 0040D6CC    mov         dl,1
 0040D6CE    mov         eax,[00408B98];EAbort
 0040D6D3    call        Exception.CreateRes
>0040D6D8    jmp         @RaiseExcept
 0040D6DD    ret
*}
end;

//0040D6E0
constructor Exception.Create(const Msg:AnsiString);
begin
{*
 0040D6E0    push        ebx
 0040D6E1    push        esi
 0040D6E2    push        edi
 0040D6E3    test        dl,dl
>0040D6E5    je          0040D6EF
 0040D6E7    add         esp,0FFFFFFF0
 0040D6EA    call        @ClassCreate
 0040D6EF    mov         esi,ecx
 0040D6F1    mov         ebx,edx
 0040D6F3    mov         edi,eax
 0040D6F5    lea         eax,[edi+4]
 0040D6F8    mov         edx,esi
 0040D6FA    call        @LStrAsg
 0040D6FF    mov         eax,edi
 0040D701    test        bl,bl
>0040D703    je          0040D714
 0040D705    call        @AfterConstruction
 0040D70A    pop         dword ptr fs:[0]
 0040D711    add         esp,0C
 0040D714    mov         eax,edi
 0040D716    pop         edi
 0040D717    pop         esi
 0040D718    pop         ebx
 0040D719    ret
*}
end;

//0040D71C
{*constructor Exception.CreateFmt(const Msg:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);
begin
 0040D71C    push        ebp
 0040D71D    mov         ebp,esp
 0040D71F    push        0
 0040D721    push        ebx
 0040D722    push        esi
 0040D723    push        edi
 0040D724    test        dl,dl
>0040D726    je          0040D730
 0040D728    add         esp,0FFFFFFF0
 0040D72B    call        @ClassCreate
 0040D730    mov         esi,ecx
 0040D732    mov         ebx,edx
 0040D734    mov         edi,eax
 0040D736    xor         eax,eax
 0040D738    push        ebp
 0040D739    push        40D776
 0040D73E    push        dword ptr fs:[eax]
 0040D741    mov         dword ptr fs:[eax],esp
 0040D744    lea         eax,[ebp-4]
 0040D747    push        eax
 0040D748    mov         edx,dword ptr [ebp+0C]
 0040D74B    mov         ecx,dword ptr [ebp+8]
 0040D74E    mov         eax,esi
 0040D750    call        Format
 0040D755    mov         edx,dword ptr [ebp-4]
 0040D758    lea         eax,[edi+4]
 0040D75B    call        @LStrAsg
 0040D760    xor         eax,eax
 0040D762    pop         edx
 0040D763    pop         ecx
 0040D764    pop         ecx
 0040D765    mov         dword ptr fs:[eax],edx
 0040D768    push        40D77D
 0040D76D    lea         eax,[ebp-4]
 0040D770    call        @LStrClr
 0040D775    ret
>0040D776    jmp         @HandleFinally
>0040D77B    jmp         0040D76D
 0040D77D    mov         eax,edi
 0040D77F    test        bl,bl
>0040D781    je          0040D792
 0040D783    call        @AfterConstruction
 0040D788    pop         dword ptr fs:[0]
 0040D78F    add         esp,0C
 0040D792    mov         eax,edi
 0040D794    pop         edi
 0040D795    pop         esi
 0040D796    pop         ebx
 0040D797    pop         ecx
 0040D798    pop         ebp
 0040D799    ret         8
end;*}

//0040D79C
constructor Exception.CreateRes(ResStringRec:PResStringRec);
begin
{*
 0040D79C    push        ebx
 0040D79D    push        esi
 0040D79E    push        edi
 0040D79F    test        dl,dl
>0040D7A1    je          0040D7AB
 0040D7A3    add         esp,0FFFFFFF0
 0040D7A6    call        @ClassCreate
 0040D7AB    mov         esi,ecx
 0040D7AD    mov         ebx,edx
 0040D7AF    mov         edi,eax
 0040D7B1    lea         edx,[edi+4]
 0040D7B4    mov         eax,esi
 0040D7B6    call        LoadStr
 0040D7BB    mov         eax,edi
 0040D7BD    test        bl,bl
>0040D7BF    je          0040D7D0
 0040D7C1    call        @AfterConstruction
 0040D7C6    pop         dword ptr fs:[0]
 0040D7CD    add         esp,0C
 0040D7D0    mov         eax,edi
 0040D7D2    pop         edi
 0040D7D3    pop         esi
 0040D7D4    pop         ebx
 0040D7D5    ret
*}
end;

//0040D7D8
{*constructor Exception.CreateResFmt(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:?);
begin
 0040D7D8    push        ebp
 0040D7D9    mov         ebp,esp
 0040D7DB    push        0
 0040D7DD    push        0
 0040D7DF    push        ebx
 0040D7E0    push        esi
 0040D7E1    push        edi
 0040D7E2    test        dl,dl
>0040D7E4    je          0040D7EE
 0040D7E6    add         esp,0FFFFFFF0
 0040D7E9    call        @ClassCreate
 0040D7EE    mov         esi,ecx
 0040D7F0    mov         ebx,edx
 0040D7F2    mov         edi,eax
 0040D7F4    xor         eax,eax
 0040D7F6    push        ebp
 0040D7F7    push        40D844
 0040D7FC    push        dword ptr fs:[eax]
 0040D7FF    mov         dword ptr fs:[eax],esp
 0040D802    lea         eax,[ebp-4]
 0040D805    push        eax
 0040D806    lea         edx,[ebp-8]
 0040D809    mov         eax,esi
 0040D80B    call        LoadStr
 0040D810    mov         eax,dword ptr [ebp-8]
 0040D813    mov         edx,dword ptr [ebp+0C]
 0040D816    mov         ecx,dword ptr [ebp+8]
 0040D819    call        Format
 0040D81E    mov         edx,dword ptr [ebp-4]
 0040D821    lea         eax,[edi+4]
 0040D824    call        @LStrAsg
 0040D829    xor         eax,eax
 0040D82B    pop         edx
 0040D82C    pop         ecx
 0040D82D    pop         ecx
 0040D82E    mov         dword ptr fs:[eax],edx
 0040D831    push        40D84B
 0040D836    lea         eax,[ebp-8]
 0040D839    mov         edx,2
 0040D83E    call        @LStrArrayClr
 0040D843    ret
>0040D844    jmp         @HandleFinally
>0040D849    jmp         0040D836
 0040D84B    mov         eax,edi
 0040D84D    test        bl,bl
>0040D84F    je          0040D860
 0040D851    call        @AfterConstruction
 0040D856    pop         dword ptr fs:[0]
 0040D85D    add         esp,0C
 0040D860    mov         eax,edi
 0040D862    pop         edi
 0040D863    pop         esi
 0040D864    pop         ebx
 0040D865    pop         ecx
 0040D866    pop         ecx
 0040D867    pop         ebp
 0040D868    ret         8
end;*}

//0040D86C
procedure EHeapException.FreeInstance;
begin
{*
 0040D86C    cmp         byte ptr [eax+0C],0
>0040D870    je          0040D877
 0040D872    call        TObject.FreeInstance
 0040D877    ret
*}
end;

//0040D898
function CreateInOutError:EInOutError;
begin
{*
 0040D898    push        ebx
 0040D899    push        esi
 0040D89A    add         esp,0FFFFFFF8
 0040D89D    xor         ebx,ebx
 0040D89F    call        IOResult
 0040D8A4    mov         esi,eax
>0040D8A6    jmp         0040D8A9
 0040D8A8    inc         ebx
 0040D8A9    cmp         ebx,6
>0040D8AC    jg          0040D8B7
 0040D8AE    cmp         esi,dword ptr [ebx*8+5AC2AC];gvar_005AC2AC:array[7] of ?
>0040D8B5    jne         0040D8A8
 0040D8B7    cmp         ebx,6
>0040D8BA    jg          0040D8D1
 0040D8BC    mov         ecx,dword ptr [ebx*8+5AC2B0]
 0040D8C3    mov         dl,1
 0040D8C5    mov         eax,[00408CA4];EInOutError
 0040D8CA    call        Exception.Create
>0040D8CF    jmp         0040D8EE
 0040D8D1    mov         dword ptr [esp],esi
 0040D8D4    mov         byte ptr [esp+4],0
 0040D8D9    push        esp
 0040D8DA    push        0
 0040D8DC    mov         ecx,dword ptr ds:[5AE264];^SInOutError:TResStringRec
 0040D8E2    mov         dl,1
 0040D8E4    mov         eax,[00408CA4];EInOutError
 0040D8E9    call        Exception.CreateResFmt
 0040D8EE    mov         dword ptr [eax+0C],esi
 0040D8F1    pop         ecx
 0040D8F2    pop         edx
 0040D8F3    pop         esi
 0040D8F4    pop         ebx
 0040D8F5    ret
*}
end;

//0040D918
procedure ErrorHandler(ErrorCode:Byte; ErrorAddr:Pointer);
begin
{*
 0040D918    push        ebx
 0040D919    mov         ebx,edx
 0040D91B    mov         edx,eax
 0040D91D    dec         dl
>0040D91F    je          0040D92D
 0040D921    dec         dl
>0040D923    je          0040D935
 0040D925    dec         edx
 0040D926    sub         dl,16
>0040D929    jb          0040D93D
>0040D92B    jmp         0040D959
 0040D92D    mov         edx,dword ptr ds:[5E0864];OutOfMemory:EOutOfMemory
>0040D933    jmp         0040D960
 0040D935    mov         edx,dword ptr ds:[5E0868];InvalidPointer:EInvalidPointer
>0040D93B    jmp         0040D960
 0040D93D    and         eax,0FF
 0040D942    lea         eax,[eax*8+5AC2CC]
 0040D949    mov         ecx,dword ptr [eax+4]
 0040D94C    mov         eax,dword ptr [eax]
 0040D94E    mov         dl,1
 0040D950    call        Exception.Create
 0040D955    mov         edx,eax
>0040D957    jmp         0040D960
 0040D959    call        CreateInOutError
 0040D95E    mov         edx,eax
 0040D960    push        ebx
 0040D961    mov         eax,edx
>0040D963    jmp         @RaiseExcept
 0040D968    pop         ebx
 0040D969    ret
*}
end;

//0040D96C
function CreateAssertException(const Message:AnsiString; const Filename:AnsiString; LineNumber:Integer):Exception;
begin
{*
 0040D96C    push        ebp
 0040D96D    mov         ebp,esp
 0040D96F    add         esp,0FFFFFFE0
 0040D972    push        ebx
 0040D973    push        esi
 0040D974    push        edi
 0040D975    xor         ebx,ebx
 0040D977    mov         dword ptr [ebp-20],ebx
 0040D97A    mov         dword ptr [ebp-4],ebx
 0040D97D    mov         edi,ecx
 0040D97F    mov         esi,edx
 0040D981    mov         ebx,eax
 0040D983    xor         eax,eax
 0040D985    push        ebp
 0040D986    push        40DA08
 0040D98B    push        dword ptr fs:[eax]
 0040D98E    mov         dword ptr fs:[eax],esp
 0040D991    test        ebx,ebx
>0040D993    je          0040D9A1
 0040D995    lea         eax,[ebp-4]
 0040D998    mov         edx,ebx
 0040D99A    call        @LStrLAsg
>0040D99F    jmp         0040D9AE
 0040D9A1    lea         edx,[ebp-4]
 0040D9A4    mov         eax,[005AE5F8];^SAssertionFailed:TResStringRec
 0040D9A9    call        LoadStr
 0040D9AE    mov         eax,dword ptr [ebp-4]
 0040D9B1    mov         dword ptr [ebp-1C],eax
 0040D9B4    mov         byte ptr [ebp-18],0B
 0040D9B8    mov         dword ptr [ebp-14],esi
 0040D9BB    mov         byte ptr [ebp-10],0B
 0040D9BF    mov         dword ptr [ebp-0C],edi
 0040D9C2    mov         byte ptr [ebp-8],0
 0040D9C6    lea         eax,[ebp-1C]
 0040D9C9    push        eax
 0040D9CA    push        2
 0040D9CC    lea         edx,[ebp-20]
 0040D9CF    mov         eax,[005AE6B0];^SAssertError:TResStringRec
 0040D9D4    call        LoadStr
 0040D9D9    mov         ecx,dword ptr [ebp-20]
 0040D9DC    mov         dl,1
 0040D9DE    mov         eax,[004093AC];EAssertionFailed
 0040D9E3    call        Exception.CreateFmt
 0040D9E8    mov         ebx,eax
 0040D9EA    xor         eax,eax
 0040D9EC    pop         edx
 0040D9ED    pop         ecx
 0040D9EE    pop         ecx
 0040D9EF    mov         dword ptr fs:[eax],edx
 0040D9F2    push        40DA0F
 0040D9F7    lea         eax,[ebp-20]
 0040D9FA    call        @LStrClr
 0040D9FF    lea         eax,[ebp-4]
 0040DA02    call        @LStrClr
 0040DA07    ret
>0040DA08    jmp         @HandleFinally
>0040DA0D    jmp         0040D9F7
 0040DA0F    mov         eax,ebx
 0040DA11    pop         edi
 0040DA12    pop         esi
 0040DA13    pop         ebx
 0040DA14    mov         esp,ebp
 0040DA16    pop         ebp
 0040DA17    ret
*}
end;

//0040DA18
procedure RaiseAssertException(const E:Exception; const ErrorAddr:Pointer; const ErrorStack:Pointer);
begin
{*
 0040DA18    mov         esp,ecx
 0040DA1A    mov         dword ptr [esp],edx
 0040DA1D    mov         ebp,dword ptr [ebp]
>0040DA20    jmp         @RaiseExcept
 0040DA25    ret
*}
end;

//0040DA28
procedure AssertErrorHandler(const Message:AnsiString; const Filename:AnsiString; LineNumber:Integer; ErrorAddr:Pointer);
begin
{*
 0040DA28    push        ebp
 0040DA29    mov         ebp,esp
 0040DA2B    call        CreateAssertException
 0040DA30    lea         ecx,[ebp+8]
 0040DA33    add         ecx,4
 0040DA36    mov         edx,dword ptr [ebp+8]
 0040DA39    call        RaiseAssertException
 0040DA3E    pop         ebp
 0040DA3F    ret         4
*}
end;

//0040DA44
procedure AbstractErrorHandler;
begin
{*
 0040DA44    mov         ecx,dword ptr ds:[5AE2A0];^SAbstractError:TResStringRec
 0040DA4A    mov         dl,1
 0040DA4C    mov         eax,[0040940C];EAbstractError
 0040DA51    call        Exception.CreateRes
 0040DA56    call        @RaiseExcept
 0040DA5B    ret
*}
end;

//0040DA5C
function MapException(P:PExceptionRecord):TRuntimeError;
begin
{*
 0040DA5C    mov         eax,dword ptr [eax]
 0040DA5E    cmp         eax,0C0000092
>0040DA63    jg          0040DA91
>0040DA65    je          0040DAC0
 0040DA67    cmp         eax,0C000008E
>0040DA6C    jg          0040DA83
>0040DA6E    je          0040DAC3
 0040DA70    sub         eax,0C0000005
>0040DA75    je          0040DACC
 0040DA77    sub         eax,87
>0040DA7C    je          0040DABA
 0040DA7E    dec         eax
>0040DA7F    je          0040DAC9
>0040DA81    jmp         0040DAD8
 0040DA83    add         eax,3FFFFF71
 0040DA88    sub         eax,2
>0040DA8B    jb          0040DAC0
>0040DA8D    je          0040DAC6
>0040DA8F    jmp         0040DAD8
 0040DA91    cmp         eax,0C0000096
>0040DA96    jg          0040DAA9
>0040DA98    je          0040DACF
 0040DA9A    sub         eax,0C0000093
>0040DA9F    je          0040DAC9
 0040DAA1    dec         eax
>0040DAA2    je          0040DAB7
 0040DAA4    dec         eax
>0040DAA5    je          0040DABD
>0040DAA7    jmp         0040DAD8
 0040DAA9    sub         eax,0C00000FD
>0040DAAE    je          0040DAD5
 0040DAB0    sub         eax,3D
>0040DAB3    je          0040DAD2
>0040DAB5    jmp         0040DAD8
 0040DAB7    mov         al,3
 0040DAB9    ret
 0040DABA    mov         al,4
 0040DABC    ret
 0040DABD    mov         al,5
 0040DABF    ret
 0040DAC0    mov         al,6
 0040DAC2    ret
 0040DAC3    mov         al,7
 0040DAC5    ret
 0040DAC6    mov         al,8
 0040DAC8    ret
 0040DAC9    mov         al,9
 0040DACB    ret
 0040DACC    mov         al,0B
 0040DACE    ret
 0040DACF    mov         al,0C
 0040DAD1    ret
 0040DAD2    mov         al,0D
 0040DAD4    ret
 0040DAD5    mov         al,0E
 0040DAD7    ret
 0040DAD8    mov         al,16
 0040DADA    ret
*}
end;

//0040DADC
function GetExceptionClass(P:PExceptionRecord):ExceptClass;
begin
{*
 0040DADC    push        ebx
 0040DADD    mov         ebx,eax
 0040DADF    mov         eax,ebx
 0040DAE1    call        MapException
 0040DAE6    and         eax,0FF
 0040DAEB    mov         eax,dword ptr [eax*8+5AC2CC]
 0040DAF2    pop         ebx
 0040DAF3    ret
*}
end;

//0040DAF4
function CreateAVObject:Exception;
begin
{*
 0040DAF4    push        ebp
 0040DAF5    mov         ebp,esp
 0040DAF7    add         esp,0FFFFFE90
 0040DAFD    push        ebx
 0040DAFE    push        esi
 0040DAFF    xor         eax,eax
 0040DB01    mov         dword ptr [ebp-170],eax
 0040DB07    mov         dword ptr [ebp-14C],eax
 0040DB0D    mov         dword ptr [ebp-154],eax
 0040DB13    mov         dword ptr [ebp-150],eax
 0040DB19    mov         dword ptr [ebp-4],eax
 0040DB1C    xor         eax,eax
 0040DB1E    push        ebp
 0040DB1F    push        40DCAF
 0040DB24    push        dword ptr fs:[eax]
 0040DB27    mov         dword ptr fs:[eax],esp
 0040DB2A    mov         eax,dword ptr [ebp+8]
 0040DB2D    mov         ebx,dword ptr [eax-4]
 0040DB30    cmp         dword ptr [ebx+14],0
>0040DB34    jne         0040DB45
 0040DB36    lea         edx,[ebp-4]
 0040DB39    mov         eax,[005AE814];^SReadAccess:TResStringRec
 0040DB3E    call        LoadStr
>0040DB43    jmp         0040DB52
 0040DB45    lea         edx,[ebp-4]
 0040DB48    mov         eax,[005AE598];^SWriteAccess:TResStringRec
 0040DB4D    call        LoadStr
 0040DB52    mov         esi,dword ptr [ebx+18]
 0040DB55    push        1C
 0040DB57    lea         eax,[ebp-20]
 0040DB5A    push        eax
 0040DB5B    mov         eax,dword ptr [ebx+0C]
 0040DB5E    push        eax
 0040DB5F    call        KERNEL32.VirtualQuery
 0040DB64    cmp         dword ptr [ebp-10],1000
>0040DB6B    jne         0040DC24
 0040DB71    push        105
 0040DB76    lea         eax,[ebp-125]
 0040DB7C    push        eax
 0040DB7D    mov         eax,dword ptr [ebp-1C]
 0040DB80    push        eax
 0040DB81    call        KERNEL32.GetModuleFileNameA
 0040DB86    test        eax,eax
>0040DB88    je          0040DC24
 0040DB8E    mov         eax,dword ptr [ebx+0C]
 0040DB91    mov         dword ptr [ebp-148],eax
 0040DB97    mov         byte ptr [ebp-144],5
 0040DB9E    lea         eax,[ebp-150]
 0040DBA4    lea         edx,[ebp-125]
 0040DBAA    mov         ecx,105
 0040DBAF    call        @LStrFromArray
 0040DBB4    mov         eax,dword ptr [ebp-150]
 0040DBBA    lea         edx,[ebp-14C]
 0040DBC0    call        ExtractFileName
 0040DBC5    mov         eax,dword ptr [ebp-14C]
 0040DBCB    mov         dword ptr [ebp-140],eax
 0040DBD1    mov         byte ptr [ebp-13C],0B
 0040DBD8    mov         eax,dword ptr [ebp-4]
 0040DBDB    mov         dword ptr [ebp-138],eax
 0040DBE1    mov         byte ptr [ebp-134],0B
 0040DBE8    mov         dword ptr [ebp-130],esi
 0040DBEE    mov         byte ptr [ebp-12C],5
 0040DBF5    lea         eax,[ebp-148]
 0040DBFB    push        eax
 0040DBFC    push        3
 0040DBFE    lea         edx,[ebp-154]
 0040DC04    mov         eax,[005AE668];^SModuleAccessViolation:TResStringRec
 0040DC09    call        LoadStr
 0040DC0E    mov         ecx,dword ptr [ebp-154]
 0040DC14    mov         dl,1
 0040DC16    mov         eax,[004091E4];EAccessViolation
 0040DC1B    call        Exception.CreateFmt
 0040DC20    mov         ebx,eax
>0040DC22    jmp         0040DC7E
 0040DC24    mov         eax,dword ptr [ebx+0C]
 0040DC27    mov         dword ptr [ebp-16C],eax
 0040DC2D    mov         byte ptr [ebp-168],5
 0040DC34    mov         eax,dword ptr [ebp-4]
 0040DC37    mov         dword ptr [ebp-164],eax
 0040DC3D    mov         byte ptr [ebp-160],0B
 0040DC44    mov         dword ptr [ebp-15C],esi
 0040DC4A    mov         byte ptr [ebp-158],5
 0040DC51    lea         eax,[ebp-16C]
 0040DC57    push        eax
 0040DC58    push        2
 0040DC5A    lea         edx,[ebp-170]
 0040DC60    mov         eax,[005AE5B0];^SAccessViolationArg3:TResStringRec
 0040DC65    call        LoadStr
 0040DC6A    mov         ecx,dword ptr [ebp-170]
 0040DC70    mov         dl,1
 0040DC72    mov         eax,[004091E4];EAccessViolation
 0040DC77    call        Exception.CreateFmt
 0040DC7C    mov         ebx,eax
 0040DC7E    xor         eax,eax
 0040DC80    pop         edx
 0040DC81    pop         ecx
 0040DC82    pop         ecx
 0040DC83    mov         dword ptr fs:[eax],edx
 0040DC86    push        40DCB6
 0040DC8B    lea         eax,[ebp-170]
 0040DC91    call        @LStrClr
 0040DC96    lea         eax,[ebp-154]
 0040DC9C    mov         edx,3
 0040DCA1    call        @LStrArrayClr
 0040DCA6    lea         eax,[ebp-4]
 0040DCA9    call        @LStrClr
 0040DCAE    ret
>0040DCAF    jmp         @HandleFinally
>0040DCB4    jmp         0040DC8B
 0040DCB6    mov         eax,ebx
 0040DCB8    pop         esi
 0040DCB9    pop         ebx
 0040DCBA    mov         esp,ebp
 0040DCBC    pop         ebp
 0040DCBD    ret
*}
end;

//0040DCC0
function GetExceptionObject(P:PExceptionRecord):Exception;
begin
{*
 0040DCC0    push        ebp
 0040DCC1    mov         ebp,esp
 0040DCC3    add         esp,0FFFFFFF0
 0040DCC6    push        ebx
 0040DCC7    xor         edx,edx
 0040DCC9    mov         dword ptr [ebp-10],edx
 0040DCCC    mov         dword ptr [ebp-4],eax
 0040DCCF    xor         eax,eax
 0040DCD1    push        ebp
 0040DCD2    push        40DD7B
 0040DCD7    push        dword ptr fs:[eax]
 0040DCDA    mov         dword ptr fs:[eax],esp
 0040DCDD    mov         eax,dword ptr [ebp-4]
 0040DCE0    call        MapException
 0040DCE5    and         eax,0FF
 0040DCEA    mov         edx,eax
 0040DCEC    add         edx,0FFFFFFFD
 0040DCEF    sub         edx,8
>0040DCF2    jb          0040DCFC
>0040DCF4    je          0040DD13
 0040DCF6    dec         edx
 0040DCF7    sub         edx,0A
>0040DCFA    jae         0040DD1E
 0040DCFC    lea         eax,[eax*8+5AC2CC]
 0040DD03    mov         ecx,dword ptr [eax+4]
 0040DD06    mov         eax,dword ptr [eax]
 0040DD08    mov         dl,1
 0040DD0A    call        Exception.Create
 0040DD0F    mov         ebx,eax
>0040DD11    jmp         0040DD4E
 0040DD13    push        ebp
 0040DD14    call        CreateAVObject
 0040DD19    pop         ecx
 0040DD1A    mov         ebx,eax
>0040DD1C    jmp         0040DD4E
 0040DD1E    mov         eax,dword ptr [ebp-4]
 0040DD21    mov         eax,dword ptr [eax]
 0040DD23    mov         dword ptr [ebp-0C],eax
 0040DD26    mov         byte ptr [ebp-8],0
 0040DD2A    lea         eax,[ebp-0C]
 0040DD2D    push        eax
 0040DD2E    push        0
 0040DD30    lea         edx,[ebp-10]
 0040DD33    mov         eax,[005AE140];^SExternalException:TResStringRec
 0040DD38    call        LoadStr
 0040DD3D    mov         ecx,dword ptr [ebp-10]
 0040DD40    mov         dl,1
 0040DD42    mov         eax,[00408D54];{_DV_EExternalException}
 0040DD47    call        Exception.CreateFmt
 0040DD4C    mov         ebx,eax
 0040DD4E    mov         eax,ebx
 0040DD50    mov         edx,dword ptr ds:[408CFC]
 0040DD56    call        @IsClass
 0040DD5B    test        al,al
>0040DD5D    je          0040DD65
 0040DD5F    mov         eax,dword ptr [ebp-4]
 0040DD62    mov         dword ptr [ebx+0C],eax
 0040DD65    xor         eax,eax
 0040DD67    pop         edx
 0040DD68    pop         ecx
 0040DD69    pop         ecx
 0040DD6A    mov         dword ptr fs:[eax],edx
 0040DD6D    push        40DD82
 0040DD72    lea         eax,[ebp-10]
 0040DD75    call        @LStrClr
 0040DD7A    ret
>0040DD7B    jmp         @HandleFinally
>0040DD80    jmp         0040DD72
 0040DD82    mov         eax,ebx
 0040DD84    pop         ebx
 0040DD85    mov         esp,ebp
 0040DD87    pop         ebp
 0040DD88    ret
*}
end;

//0040DD8C
procedure ExceptHandler(ExceptObject:TObject; ExceptAddr:Pointer);
begin
{*
 0040DD8C    call        ShowException
 0040DD91    mov         eax,1
 0040DD96    call        @Halt
 0040DD9B    ret
*}
end;

//0040DD9C
procedure InitExceptions;
begin
{*
 0040DD9C    mov         ecx,dword ptr ds:[5AE27C];^SOutOfMemory:TResStringRec
 0040DDA2    mov         dl,1
 0040DDA4    mov         eax,[00408C48];EOutOfMemory
 0040DDA9    call        Exception.CreateRes
 0040DDAE    mov         [005E0864],eax;OutOfMemory:EOutOfMemory
 0040DDB3    mov         ecx,dword ptr ds:[5AE528];^SInvalidPointer:TResStringRec
 0040DDB9    mov         dl,1
 0040DDBB    mov         eax,[004090D0];EInvalidPointer
 0040DDC0    call        Exception.CreateRes
 0040DDC5    mov         [005E0868],eax;InvalidPointer:EInvalidPointer
 0040DDCA    mov         eax,[005AE160];ErrorProc:procedure(val ErrorCode:Byte;val ErrorAddr:Pointer)
 0040DDCF    mov         dword ptr [eax],40D918;ErrorHandler
 0040DDD5    mov         eax,[005AE324];ExceptProc:Pointer
 0040DDDA    mov         dword ptr [eax],40DD8C;ExceptHandler
 0040DDE0    mov         eax,[005AE244];ExceptionClass:TClass
 0040DDE5    mov         edx,dword ptr ds:[408B30];Exception
 0040DDEB    mov         dword ptr [eax],edx
 0040DDED    mov         eax,[005AE304];ExceptClsProc:Pointer
 0040DDF2    mov         dword ptr [eax],40DADC;GetExceptionClass:ExceptClass
 0040DDF8    mov         eax,[005AE334];ExceptObjProc:Pointer
 0040DDFD    mov         dword ptr [eax],40DCC0;GetExceptionObject:Exception
 0040DE03    mov         eax,40DA28;AssertErrorHandler
 0040DE08    mov         edx,dword ptr ds:[5AE560];AssertErrorProc:TAssertErrorProc
 0040DE0E    mov         dword ptr [edx],eax
 0040DE10    mov         eax,40DA44;AbstractErrorHandler
 0040DE15    mov         edx,dword ptr ds:[5AE130];AbstractErrorProc:procedure
 0040DE1B    mov         dword ptr [edx],eax
 0040DE1D    ret
*}
end;

//0040DE20
procedure DoneExceptions;
begin
{*
 0040DE20    cmp         dword ptr ds:[5E0864],0;OutOfMemory:EOutOfMemory
>0040DE27    je          0040DE43
 0040DE29    mov         eax,[005E0864];OutOfMemory:EOutOfMemory
 0040DE2E    mov         byte ptr [eax+0C],1
 0040DE32    mov         eax,[005E0864];OutOfMemory:EOutOfMemory
 0040DE37    mov         edx,dword ptr [eax]
 0040DE39    call        dword ptr [edx-8]
 0040DE3C    xor         eax,eax
 0040DE3E    mov         [005E0864],eax;OutOfMemory:EOutOfMemory
 0040DE43    cmp         dword ptr ds:[5E0868],0;InvalidPointer:EInvalidPointer
>0040DE4A    je          0040DE66
 0040DE4C    mov         eax,[005E0868];InvalidPointer:EInvalidPointer
 0040DE51    mov         byte ptr [eax+0C],1
 0040DE55    mov         eax,[005E0868];InvalidPointer:EInvalidPointer
 0040DE5A    call        TObject.Free
 0040DE5F    xor         eax,eax
 0040DE61    mov         [005E0868],eax;InvalidPointer:EInvalidPointer
 0040DE66    mov         eax,[005AE160];ErrorProc:procedure(val ErrorCode:Byte;val ErrorAddr:Pointer)
 0040DE6B    xor         edx,edx
 0040DE6D    mov         dword ptr [eax],edx
 0040DE6F    mov         eax,[005AE324];ExceptProc:Pointer
 0040DE74    xor         edx,edx
 0040DE76    mov         dword ptr [eax],edx
 0040DE78    mov         eax,[005AE244];ExceptionClass:TClass
 0040DE7D    xor         edx,edx
 0040DE7F    mov         dword ptr [eax],edx
 0040DE81    mov         eax,[005AE304];ExceptClsProc:Pointer
 0040DE86    xor         edx,edx
 0040DE88    mov         dword ptr [eax],edx
 0040DE8A    mov         eax,[005AE334];ExceptObjProc:Pointer
 0040DE8F    xor         edx,edx
 0040DE91    mov         dword ptr [eax],edx
 0040DE93    mov         eax,[005AE560];AssertErrorProc:TAssertErrorProc
 0040DE98    xor         edx,edx
 0040DE9A    mov         dword ptr [eax],edx
 0040DE9C    ret
*}
end;

//0040DEA0
procedure InitPlatformId;
begin
{*
 0040DEA0    add         esp,0FFFFFF6C
 0040DEA6    mov         dword ptr [esp],94
 0040DEAD    push        esp
 0040DEAE    call        KERNEL32.GetVersionExA
 0040DEB3    test        eax,eax
>0040DEB5    je          0040DF07
 0040DEB7    mov         eax,dword ptr [esp+10]
 0040DEBB    mov         [005AC150],eax
 0040DEC0    mov         eax,dword ptr [esp+4]
 0040DEC4    mov         [005AC154],eax
 0040DEC9    mov         eax,dword ptr [esp+8]
 0040DECD    mov         [005AC158],eax
 0040DED2    cmp         dword ptr ds:[5AC150],1
>0040DED9    jne         0040DEEB
 0040DEDB    mov         eax,dword ptr [esp+0C]
 0040DEDF    and         eax,0FFFF
 0040DEE4    mov         [005AC15C],eax
>0040DEE9    jmp         0040DEF4
 0040DEEB    mov         eax,dword ptr [esp+0C]
 0040DEEF    mov         [005AC15C],eax
 0040DEF4    mov         eax,5AC160
 0040DEF9    lea         edx,[esp+14]
 0040DEFD    mov         ecx,80
 0040DF02    call        @LStrFromArray
 0040DF07    add         esp,94
 0040DF0D    ret
*}
end;

//0040DF10
function CheckWin32Version(AMajor:Integer; AMinor:Integer):Boolean;
begin
{*
 0040DF10    cmp         eax,dword ptr ds:[5AC154]
>0040DF16    jl          0040DF2B
 0040DF18    cmp         eax,dword ptr ds:[5AC154]
>0040DF1E    jne         0040DF28
 0040DF20    cmp         edx,dword ptr ds:[5AC158]
>0040DF26    jle         0040DF2B
 0040DF28    xor         eax,eax
 0040DF2A    ret
 0040DF2B    mov         al,1
 0040DF2D    ret
*}
end;

//0040DF30
function GetFileVersion(const AFileName:AnsiString):Cardinal;
begin
{*
 0040DF30    push        ebp
 0040DF31    mov         ebp,esp
 0040DF33    add         esp,0FFFFFFE8
 0040DF36    push        ebx
 0040DF37    xor         edx,edx
 0040DF39    mov         dword ptr [ebp-8],edx
 0040DF3C    mov         ebx,eax
 0040DF3E    xor         eax,eax
 0040DF40    push        ebp
 0040DF41    push        40E006
 0040DF46    push        dword ptr fs:[eax]
 0040DF49    mov         dword ptr fs:[eax],esp
 0040DF4C    mov         dword ptr [ebp-4],0FFFFFFFF
 0040DF53    lea         eax,[ebp-8]
 0040DF56    mov         edx,ebx
 0040DF58    call        @LStrLAsg
 0040DF5D    lea         eax,[ebp-8]
 0040DF60    call        UniqueString
 0040DF65    lea         eax,[ebp-0C]
 0040DF68    push        eax
 0040DF69    mov         eax,dword ptr [ebp-8]
 0040DF6C    call        @LStrToPChar
 0040DF71    push        eax
 0040DF72    call        version.GetFileVersionInfoSizeA
 0040DF77    mov         ebx,eax
 0040DF79    test        ebx,ebx
>0040DF7B    je          0040DFF0
 0040DF7D    mov         eax,ebx
 0040DF7F    call        @GetMem
 0040DF84    mov         dword ptr [ebp-10],eax
 0040DF87    xor         eax,eax
 0040DF89    push        ebp
 0040DF8A    push        40DFE9
 0040DF8F    push        dword ptr fs:[eax]
 0040DF92    mov         dword ptr fs:[eax],esp
 0040DF95    mov         eax,dword ptr [ebp-10]
 0040DF98    push        eax
 0040DF99    push        ebx
 0040DF9A    mov         eax,dword ptr [ebp-0C]
 0040DF9D    push        eax
 0040DF9E    mov         eax,dword ptr [ebp-8]
 0040DFA1    call        @LStrToPChar
 0040DFA6    push        eax
 0040DFA7    call        version.GetFileVersionInfoA
 0040DFAC    test        eax,eax
>0040DFAE    je          0040DFD3
 0040DFB0    lea         eax,[ebp-18]
 0040DFB3    push        eax
 0040DFB4    lea         eax,[ebp-14]
 0040DFB7    push        eax
 0040DFB8    push        40E018
 0040DFBD    mov         eax,dword ptr [ebp-10]
 0040DFC0    push        eax
 0040DFC1    call        version.VerQueryValueA
 0040DFC6    test        eax,eax
>0040DFC8    je          0040DFD3
 0040DFCA    mov         eax,dword ptr [ebp-14]
 0040DFCD    mov         eax,dword ptr [eax+8]
 0040DFD0    mov         dword ptr [ebp-4],eax
 0040DFD3    xor         eax,eax
 0040DFD5    pop         edx
 0040DFD6    pop         ecx
 0040DFD7    pop         ecx
 0040DFD8    mov         dword ptr fs:[eax],edx
 0040DFDB    push        40DFF0
 0040DFE0    mov         eax,dword ptr [ebp-10]
 0040DFE3    call        @FreeMem
 0040DFE8    ret
>0040DFE9    jmp         @HandleFinally
>0040DFEE    jmp         0040DFE0
 0040DFF0    xor         eax,eax
 0040DFF2    pop         edx
 0040DFF3    pop         ecx
 0040DFF4    pop         ecx
 0040DFF5    mov         dword ptr fs:[eax],edx
 0040DFF8    push        40E00D
 0040DFFD    lea         eax,[ebp-8]
 0040E000    call        @LStrClr
 0040E005    ret
>0040E006    jmp         @HandleFinally
>0040E00B    jmp         0040DFFD
 0040E00D    mov         eax,dword ptr [ebp-4]
 0040E010    pop         ebx
 0040E011    mov         esp,ebp
 0040E013    pop         ebp
 0040E014    ret
*}
end;

//0040E01C
procedure Beep;
begin
{*
 0040E01C    push        0
 0040E01E    call        user32.MessageBeep
 0040E023    ret
*}
end;

//0040E024
function ByteTypeTest(P:PChar; Index:Integer):TMbcsByteType;
begin
{*
 0040E024    push        esi
 0040E025    push        edi
 0040E026    mov         edi,edx
 0040E028    xor         edx,edx
 0040E02A    test        eax,eax
>0040E02C    je          0040E094
 0040E02E    cmp         byte ptr [eax+edi],0
>0040E032    je          0040E094
 0040E034    test        edi,edi
>0040E036    jne         0040E04C
 0040E038    mov         al,byte ptr [eax]
 0040E03A    and         eax,0FF
 0040E03F    bt          dword ptr ds:[5AC198],eax
>0040E046    jae         0040E094
 0040E048    mov         dl,1
>0040E04A    jmp         0040E094
 0040E04C    mov         esi,edi
 0040E04E    dec         esi
>0040E04F    jmp         0040E052
 0040E051    dec         esi
 0040E052    test        esi,esi
>0040E054    jl          0040E068
 0040E056    mov         cl,byte ptr [eax+esi]
 0040E059    and         ecx,0FF
 0040E05F    bt          dword ptr ds:[5AC198],ecx
>0040E066    jb          0040E051
 0040E068    mov         ecx,edi
 0040E06A    sub         ecx,esi
 0040E06C    and         ecx,80000001
>0040E072    jns         0040E079
 0040E074    dec         ecx
 0040E075    or          ecx,0FFFFFFFE
 0040E078    inc         ecx
 0040E079    test        ecx,ecx
>0040E07B    jne         0040E081
 0040E07D    mov         dl,2
>0040E07F    jmp         0040E094
 0040E081    mov         al,byte ptr [eax+edi]
 0040E084    and         eax,0FF
 0040E089    bt          dword ptr ds:[5AC198],eax
>0040E090    jae         0040E094
 0040E092    mov         dl,1
 0040E094    mov         eax,edx
 0040E096    pop         edi
 0040E097    pop         esi
 0040E098    ret
*}
end;

//0040E09C
function ByteType(const S:AnsiString; Index:Integer):TMbcsByteType;
begin
{*
 0040E09C    push        ebx
 0040E09D    push        esi
 0040E09E    mov         esi,edx
 0040E0A0    mov         ebx,eax
 0040E0A2    xor         eax,eax
 0040E0A4    cmp         byte ptr ds:[5E081C],0
>0040E0AB    je          0040E0BC
 0040E0AD    mov         eax,ebx
 0040E0AF    call        @LStrToPChar
 0040E0B4    mov         edx,esi
 0040E0B6    dec         edx
 0040E0B7    call        ByteTypeTest
 0040E0BC    pop         esi
 0040E0BD    pop         ebx
 0040E0BE    ret
*}
end;

//0040E0C0
function StrByteType(Str:PChar; Index:Cardinal):TMbcsByteType;
begin
{*
 0040E0C0    xor         ecx,ecx
 0040E0C2    cmp         byte ptr ds:[5E081C],0
>0040E0C9    je          0040E0D2
 0040E0CB    call        ByteTypeTest
 0040E0D0    mov         ecx,eax
 0040E0D2    mov         eax,ecx
 0040E0D4    ret
*}
end;

//0040E0D8
function ByteToCharLen(const S:AnsiString; MaxLen:Integer):Integer;
begin
{*
 0040E0D8    push        ebx
 0040E0D9    push        esi
 0040E0DA    mov         esi,edx
 0040E0DC    mov         ebx,eax
 0040E0DE    mov         eax,ebx
 0040E0E0    call        @LStrLen
 0040E0E5    cmp         esi,eax
>0040E0E7    jle         0040E0F2
 0040E0E9    mov         eax,ebx
 0040E0EB    call        @LStrLen
 0040E0F0    mov         esi,eax
 0040E0F2    mov         edx,esi
 0040E0F4    mov         eax,ebx
 0040E0F6    call        ByteToCharIndex
 0040E0FB    pop         esi
 0040E0FC    pop         ebx
 0040E0FD    ret
*}
end;

//0040E100
function ByteToCharIndex(const S:AnsiString; Index:Integer):Integer;
begin
{*
 0040E100    push        ebx
 0040E101    push        esi
 0040E102    push        edi
 0040E103    mov         esi,edx
 0040E105    mov         ebx,eax
 0040E107    xor         edi,edi
 0040E109    test        esi,esi
>0040E10B    jle         0040E152
 0040E10D    mov         eax,ebx
 0040E10F    call        @LStrLen
 0040E114    cmp         esi,eax
>0040E116    jg          0040E152
 0040E118    mov         edi,esi
 0040E11A    cmp         byte ptr ds:[5E081C],0
>0040E121    je          0040E152
 0040E123    mov         eax,1
 0040E128    xor         edi,edi
 0040E12A    cmp         esi,eax
>0040E12C    jl          0040E152
 0040E12E    mov         dl,byte ptr [ebx+eax-1]
 0040E132    and         edx,0FF
 0040E138    bt          dword ptr ds:[5AC198],edx
>0040E13F    jae         0040E14C
 0040E141    mov         edx,eax
 0040E143    mov         eax,ebx
 0040E145    call        NextCharIndex
>0040E14A    jmp         0040E14D
 0040E14C    inc         eax
 0040E14D    inc         edi
 0040E14E    cmp         esi,eax
>0040E150    jge         0040E12E
 0040E152    mov         eax,edi
 0040E154    pop         edi
 0040E155    pop         esi
 0040E156    pop         ebx
 0040E157    ret
*}
end;

//0040E158
procedure CountChars(const S:AnsiString; MaxChars:Integer; var CharCount:Integer; var ByteCount:Integer);
begin
{*
 0040E158    push        ebp
 0040E159    mov         ebp,esp
 0040E15B    add         esp,0FFFFFFF4
 0040E15E    push        ebx
 0040E15F    push        esi
 0040E160    push        edi
 0040E161    mov         dword ptr [ebp-8],ecx
 0040E164    mov         dword ptr [ebp-4],edx
 0040E167    mov         edi,eax
 0040E169    mov         eax,edi
 0040E16B    call        @LStrLen
 0040E170    mov         dword ptr [ebp-0C],eax
 0040E173    mov         esi,1
 0040E178    mov         ebx,1
>0040E17D    jmp         0040E1A0
 0040E17F    inc         esi
 0040E180    mov         al,byte ptr [edi+ebx-1]
 0040E184    and         eax,0FF
 0040E189    bt          dword ptr ds:[5AC198],eax
>0040E190    jae         0040E19F
 0040E192    mov         edx,ebx
 0040E194    mov         eax,edi
 0040E196    call        NextCharIndex
 0040E19B    mov         ebx,eax
>0040E19D    jmp         0040E1A0
 0040E19F    inc         ebx
 0040E1A0    cmp         ebx,dword ptr [ebp-0C]
>0040E1A3    jge         0040E1AA
 0040E1A5    cmp         esi,dword ptr [ebp-4]
>0040E1A8    jl          0040E17F
 0040E1AA    cmp         esi,dword ptr [ebp-4]
>0040E1AD    jne         0040E1D2
 0040E1AF    cmp         ebx,dword ptr [ebp-0C]
>0040E1B2    jge         0040E1D2
 0040E1B4    mov         al,byte ptr [edi+ebx-1]
 0040E1B8    and         eax,0FF
 0040E1BD    bt          dword ptr ds:[5AC198],eax
>0040E1C4    jae         0040E1D2
 0040E1C6    mov         edx,ebx
 0040E1C8    mov         eax,edi
 0040E1CA    call        NextCharIndex
 0040E1CF    dec         eax
 0040E1D0    mov         ebx,eax
 0040E1D2    mov         eax,dword ptr [ebp-8]
 0040E1D5    mov         dword ptr [eax],esi
 0040E1D7    mov         eax,dword ptr [ebp+8]
 0040E1DA    mov         dword ptr [eax],ebx
 0040E1DC    pop         edi
 0040E1DD    pop         esi
 0040E1DE    pop         ebx
 0040E1DF    mov         esp,ebp
 0040E1E1    pop         ebp
 0040E1E2    ret         4
*}
end;

//0040E1E8
function CharToByteIndex(const S:AnsiString; Index:Integer):Integer;
begin
{*
 0040E1E8    push        ebx
 0040E1E9    push        esi
 0040E1EA    add         esp,0FFFFFFF8
 0040E1ED    mov         ebx,edx
 0040E1EF    mov         esi,eax
 0040E1F1    xor         eax,eax
 0040E1F3    mov         dword ptr [esp],eax
 0040E1F6    test        ebx,ebx
>0040E1F8    jle         0040E244
 0040E1FA    mov         eax,esi
 0040E1FC    call        @LStrLen
 0040E201    cmp         ebx,eax
>0040E203    jg          0040E244
 0040E205    cmp         ebx,1
>0040E208    jle         0040E241
 0040E20A    cmp         byte ptr ds:[5E081C],0
>0040E211    je          0040E241
 0040E213    push        esp
 0040E214    lea         ecx,[esp+8]
 0040E218    mov         edx,ebx
 0040E21A    dec         edx
 0040E21B    mov         eax,esi
 0040E21D    call        CountChars
 0040E222    dec         ebx
 0040E223    cmp         ebx,dword ptr [esp+4]
>0040E227    jg          0040E235
 0040E229    mov         eax,esi
 0040E22B    call        @LStrLen
 0040E230    cmp         eax,dword ptr [esp]
>0040E233    jg          0040E23C
 0040E235    xor         eax,eax
 0040E237    mov         dword ptr [esp],eax
>0040E23A    jmp         0040E244
 0040E23C    inc         dword ptr [esp]
>0040E23F    jmp         0040E244
 0040E241    mov         dword ptr [esp],ebx
 0040E244    mov         eax,dword ptr [esp]
 0040E247    pop         ecx
 0040E248    pop         edx
 0040E249    pop         esi
 0040E24A    pop         ebx
 0040E24B    ret
*}
end;

//0040E24C
function CharToByteLen(const S:AnsiString; MaxLen:Integer):Integer;
begin
{*
 0040E24C    push        ebx
 0040E24D    push        esi
 0040E24E    add         esp,0FFFFFFF8
 0040E251    mov         ebx,edx
 0040E253    mov         esi,eax
 0040E255    xor         eax,eax
 0040E257    mov         dword ptr [esp],eax
 0040E25A    test        ebx,ebx
>0040E25C    jle         0040E2A4
 0040E25E    mov         eax,esi
 0040E260    call        @LStrLen
 0040E265    cmp         ebx,eax
>0040E267    jle         0040E272
 0040E269    mov         eax,esi
 0040E26B    call        @LStrLen
 0040E270    mov         ebx,eax
 0040E272    cmp         byte ptr ds:[5E081C],0
>0040E279    je          0040E2A1
 0040E27B    push        esp
 0040E27C    lea         ecx,[esp+8]
 0040E280    mov         edx,ebx
 0040E282    mov         eax,esi
 0040E284    call        CountChars
 0040E289    mov         eax,esi
 0040E28B    call        @LStrLen
 0040E290    cmp         eax,dword ptr [esp]
>0040E293    jge         0040E2A4
 0040E295    mov         eax,esi
 0040E297    call        @LStrLen
 0040E29C    mov         dword ptr [esp],eax
>0040E29F    jmp         0040E2A4
 0040E2A1    mov         dword ptr [esp],ebx
 0040E2A4    mov         eax,dword ptr [esp]
 0040E2A7    pop         ecx
 0040E2A8    pop         edx
 0040E2A9    pop         esi
 0040E2AA    pop         ebx
 0040E2AB    ret
*}
end;

//0040E2AC
function StrCharLength(const Str:PChar):Integer;
begin
{*
 0040E2AC    push        ebx
 0040E2AD    mov         ebx,eax
 0040E2AF    cmp         byte ptr ds:[5E081C],0
>0040E2B6    je          0040E2C2
 0040E2B8    push        ebx
 0040E2B9    call        user32.CharNextA
 0040E2BE    sub         eax,ebx
 0040E2C0    pop         ebx
 0040E2C1    ret
 0040E2C2    mov         eax,1
 0040E2C7    pop         ebx
 0040E2C8    ret
*}
end;

//0040E2CC
function StrNextChar(const Str:PChar):PChar;
begin
{*
 0040E2CC    push        eax
 0040E2CD    call        user32.CharNextA
 0040E2D2    ret
*}
end;

//0040E2D4
function CharLength(const S:AnsiString; Index:Integer):Integer;
begin
{*
 0040E2D4    push        ebx
 0040E2D5    push        esi
 0040E2D6    mov         esi,edx
 0040E2D8    mov         ebx,eax
 0040E2DA    mov         eax,1
 0040E2DF    cmp         byte ptr ds:[5E081C],0
>0040E2E6    je          0040E30A
 0040E2E8    mov         dl,byte ptr [ebx+esi-1]
 0040E2EC    and         edx,0FF
 0040E2F2    bt          dword ptr ds:[5AC198],edx
>0040E2F9    jae         0040E30A
 0040E2FB    mov         eax,ebx
 0040E2FD    call        @LStrToPChar
 0040E302    add         eax,esi
 0040E304    dec         eax
 0040E305    call        StrCharLength
 0040E30A    pop         esi
 0040E30B    pop         ebx
 0040E30C    ret
*}
end;

//0040E310
function NextCharIndex(const S:AnsiString; Index:Integer):Integer;
begin
{*
 0040E310    push        ebx
 0040E311    push        esi
 0040E312    mov         ebx,edx
 0040E314    mov         esi,eax
 0040E316    lea         eax,[ebx+1]
 0040E319    cmp         byte ptr ds:[5E081C],0
>0040E320    je          0040E346
 0040E322    mov         dl,byte ptr [esi+ebx-1]
 0040E326    and         edx,0FF
 0040E32C    bt          dword ptr ds:[5AC198],edx
>0040E333    jae         0040E346
 0040E335    mov         eax,esi
 0040E337    call        @LStrToPChar
 0040E33C    add         eax,ebx
 0040E33E    dec         eax
 0040E33F    call        StrCharLength
 0040E344    add         eax,ebx
 0040E346    pop         esi
 0040E347    pop         ebx
 0040E348    ret
*}
end;

//0040E34C
function IsDelimiter(const Delimiters:AnsiString; const S:AnsiString; Index:Integer):Boolean;
begin
{*
 0040E34C    push        ebx
 0040E34D    push        esi
 0040E34E    push        edi
 0040E34F    push        ebp
 0040E350    mov         edi,ecx
 0040E352    mov         esi,edx
 0040E354    mov         ebp,eax
 0040E356    xor         ebx,ebx
 0040E358    test        edi,edi
>0040E35A    jle         0040E389
 0040E35C    mov         eax,esi
 0040E35E    call        @LStrLen
 0040E363    cmp         edi,eax
>0040E365    jg          0040E389
 0040E367    mov         edx,edi
 0040E369    mov         eax,esi
 0040E36B    call        ByteType
 0040E370    test        al,al
>0040E372    jne         0040E389
 0040E374    mov         eax,ebp
 0040E376    call        @LStrToPChar
 0040E37B    mov         dl,byte ptr [esi+edi-1]
 0040E37F    call        StrScan
 0040E384    test        eax,eax
 0040E386    setne       bl
 0040E389    mov         eax,ebx
 0040E38B    pop         ebp
 0040E38C    pop         edi
 0040E38D    pop         esi
 0040E38E    pop         ebx
 0040E38F    ret
*}
end;

//0040E390
function AnsiPos(const Substr:AnsiString; const S:AnsiString):Integer;
begin
{*
 0040E390    push        ebx
 0040E391    push        esi
 0040E392    push        edi
 0040E393    push        ebp
 0040E394    mov         esi,edx
 0040E396    mov         ebx,eax
 0040E398    xor         edi,edi
 0040E39A    mov         eax,ebx
 0040E39C    call        @LStrToPChar
 0040E3A1    push        eax
 0040E3A2    mov         eax,esi
 0040E3A4    call        @LStrToPChar
 0040E3A9    mov         ebp,eax
 0040E3AB    mov         eax,ebp
 0040E3AD    pop         edx
 0040E3AE    call        AnsiStrPos
 0040E3B3    mov         ebx,eax
 0040E3B5    test        ebx,ebx
>0040E3B7    je          0040E3BE
 0040E3B9    mov         edi,ebx
 0040E3BB    sub         edi,ebp
 0040E3BD    inc         edi
 0040E3BE    mov         eax,edi
 0040E3C0    pop         ebp
 0040E3C1    pop         edi
 0040E3C2    pop         esi
 0040E3C3    pop         ebx
 0040E3C4    ret
*}
end;

//0040E3C8
function AnsiLowerCaseFileName(const S:AnsiString):AnsiString;
begin
{*
 0040E3C8    push        ebx
 0040E3C9    push        esi
 0040E3CA    push        edi
 0040E3CB    push        ebp
 0040E3CC    mov         edi,edx
 0040E3CE    mov         esi,eax
 0040E3D0    cmp         byte ptr ds:[5E081C],0
>0040E3D7    je          0040E446
 0040E3D9    mov         eax,esi
 0040E3DB    call        @LStrLen
 0040E3E0    mov         ebp,eax
 0040E3E2    mov         eax,edi
 0040E3E4    mov         edx,ebp
 0040E3E6    call        @LStrSetLength
 0040E3EB    mov         ebx,1
 0040E3F0    cmp         ebp,ebx
>0040E3F2    jl          0040E44F
 0040E3F4    mov         eax,edi
 0040E3F6    call        @UniqueStringA
 0040E3FB    mov         dl,byte ptr [esi+ebx-1]
 0040E3FF    mov         byte ptr [eax+ebx-1],dl
 0040E403    mov         al,byte ptr [esi+ebx-1]
 0040E407    and         eax,0FF
 0040E40C    bt          dword ptr ds:[5AC198],eax
>0040E413    jae         0040E427
 0040E415    inc         ebx
 0040E416    mov         eax,edi
 0040E418    call        @UniqueStringA
 0040E41D    mov         dl,byte ptr [esi+ebx-1]
 0040E421    mov         byte ptr [eax+ebx-1],dl
>0040E425    jmp         0040E43F
 0040E427    mov         eax,dword ptr [edi]
 0040E429    mov         al,byte ptr [eax+ebx-1]
 0040E42D    add         al,0BF
 0040E42F    sub         al,1A
>0040E431    jae         0040E43F
 0040E433    mov         eax,edi
 0040E435    call        @UniqueStringA
 0040E43A    add         byte ptr [eax+ebx-1],20
 0040E43F    inc         ebx
 0040E440    cmp         ebp,ebx
>0040E442    jge         0040E3F4
>0040E444    jmp         0040E44F
 0040E446    mov         edx,edi
 0040E448    mov         eax,esi
 0040E44A    call        AnsiLowerCase
 0040E44F    pop         ebp
 0040E450    pop         edi
 0040E451    pop         esi
 0040E452    pop         ebx
 0040E453    ret
*}
end;

//0040E454
function AnsiStrPos(Str:PChar; SubStr:PChar):PChar;
begin
{*
 0040E454    push        ebx
 0040E455    push        esi
 0040E456    push        edi
 0040E457    push        ebp
 0040E458    add         esp,0FFFFFFF8
 0040E45B    mov         ebp,edx
 0040E45D    mov         esi,eax
 0040E45F    xor         ebx,ebx
 0040E461    test        esi,esi
>0040E463    je          0040E4EA
 0040E469    cmp         byte ptr [esi],0
>0040E46C    je          0040E4EA
 0040E46E    test        ebp,ebp
>0040E470    je          0040E4EA
 0040E472    cmp         byte ptr [ebp],0
>0040E476    je          0040E4EA
 0040E478    mov         eax,esi
 0040E47A    call        StrLen
 0040E47F    mov         dword ptr [esp],eax
 0040E482    mov         eax,ebp
 0040E484    call        StrLen
 0040E489    mov         edi,eax
 0040E48B    mov         edx,ebp
 0040E48D    mov         eax,esi
 0040E48F    call        StrPos
 0040E494    mov         ebx,eax
>0040E496    jmp         0040E4D7
 0040E498    mov         edx,ebx
 0040E49A    sub         edx,esi
 0040E49C    mov         eax,esi
 0040E49E    call        StrByteType
 0040E4A3    mov         byte ptr [esp+4],al
 0040E4A7    cmp         byte ptr [esp+4],2
>0040E4AC    je          0040E4C3
 0040E4AE    push        edi
 0040E4AF    push        ebp
 0040E4B0    push        edi
 0040E4B1    push        ebx
 0040E4B2    push        0
 0040E4B4    push        400
 0040E4B9    call        KERNEL32.CompareStringA
 0040E4BE    cmp         eax,2
>0040E4C1    je          0040E4EA
 0040E4C3    cmp         byte ptr [esp+4],1
>0040E4C8    jne         0040E4CB
 0040E4CA    inc         ebx
 0040E4CB    inc         ebx
 0040E4CC    mov         edx,ebp
 0040E4CE    mov         eax,ebx
 0040E4D0    call        StrPos
 0040E4D5    mov         ebx,eax
 0040E4D7    test        ebx,ebx
>0040E4D9    je          0040E4E8
 0040E4DB    mov         eax,ebx
 0040E4DD    sub         eax,esi
 0040E4DF    mov         edx,dword ptr [esp]
 0040E4E2    sub         edx,eax
 0040E4E4    cmp         edi,edx
>0040E4E6    jbe         0040E498
 0040E4E8    xor         ebx,ebx
 0040E4EA    mov         eax,ebx
 0040E4EC    pop         ecx
 0040E4ED    pop         edx
 0040E4EE    pop         ebp
 0040E4EF    pop         edi
 0040E4F0    pop         esi
 0040E4F1    pop         ebx
 0040E4F2    ret
*}
end;

//0040E4F4
function AnsiStrRScan(Str:PChar; Chr:Char):PChar;
begin
{*
 0040E4F4    push        ebx
 0040E4F5    push        esi
 0040E4F6    mov         ebx,edx
 0040E4F8    mov         edx,ebx
 0040E4FA    call        AnsiStrScan
 0040E4FF    mov         esi,eax
 0040E501    test        bl,bl
>0040E503    je          0040E517
 0040E505    test        eax,eax
>0040E507    je          0040E517
 0040E509    mov         esi,eax
 0040E50B    inc         eax
 0040E50C    mov         edx,ebx
 0040E50E    call        AnsiStrScan
 0040E513    test        eax,eax
>0040E515    jne         0040E509
 0040E517    mov         eax,esi
 0040E519    pop         esi
 0040E51A    pop         ebx
 0040E51B    ret
*}
end;

//0040E51C
function AnsiStrScan(Str:PChar; Chr:Char):PChar;
begin
{*
 0040E51C    push        ebx
 0040E51D    push        esi
 0040E51E    push        edi
 0040E51F    mov         ebx,edx
 0040E521    mov         esi,eax
 0040E523    mov         edx,ebx
 0040E525    mov         eax,esi
 0040E527    call        StrScan
 0040E52C    mov         edi,eax
 0040E52E    test        edi,edi
>0040E530    je          0040E556
 0040E532    mov         edx,edi
 0040E534    sub         edx,esi
 0040E536    mov         eax,esi
 0040E538    call        StrByteType
 0040E53D    sub         al,1
>0040E53F    jb          0040E556
>0040E541    je          0040E545
>0040E543    jmp         0040E546
 0040E545    inc         edi
 0040E546    inc         edi
 0040E547    mov         edx,ebx
 0040E549    mov         eax,edi
 0040E54B    call        StrScan
 0040E550    mov         edi,eax
 0040E552    test        edi,edi
>0040E554    jne         0040E532
 0040E556    mov         eax,edi
 0040E558    pop         edi
 0040E559    pop         esi
 0040E55A    pop         ebx
 0040E55B    ret
*}
end;

//0040E55C
function LCIDToCodePage(ALcid:LCID):Integer;
begin
{*
 0040E55C    push        ebp
 0040E55D    mov         ebp,esp
 0040E55F    add         esp,0FFFFFFF4
 0040E562    push        ebx
 0040E563    xor         edx,edx
 0040E565    mov         dword ptr [ebp-0C],edx
 0040E568    xor         edx,edx
 0040E56A    push        ebp
 0040E56B    push        40E5C0
 0040E570    push        dword ptr fs:[edx]
 0040E573    mov         dword ptr fs:[edx],esp
 0040E576    push        7
 0040E578    lea         edx,[ebp-7]
 0040E57B    push        edx
 0040E57C    push        1004
 0040E581    push        eax
 0040E582    call        KERNEL32.GetLocaleInfoA
 0040E587    lea         eax,[ebp-0C]
 0040E58A    lea         edx,[ebp-7]
 0040E58D    mov         ecx,7
 0040E592    call        @LStrFromArray
 0040E597    mov         eax,dword ptr [ebp-0C]
 0040E59A    push        eax
 0040E59B    call        KERNEL32.GetACP
 0040E5A0    mov         edx,eax
 0040E5A2    pop         eax
 0040E5A3    call        StrToIntDef
 0040E5A8    mov         ebx,eax
 0040E5AA    xor         eax,eax
 0040E5AC    pop         edx
 0040E5AD    pop         ecx
 0040E5AE    pop         ecx
 0040E5AF    mov         dword ptr fs:[eax],edx
 0040E5B2    push        40E5C7
 0040E5B7    lea         eax,[ebp-0C]
 0040E5BA    call        @LStrClr
 0040E5BF    ret
>0040E5C0    jmp         @HandleFinally
>0040E5C5    jmp         0040E5B7
 0040E5C7    mov         eax,ebx
 0040E5C9    pop         ebx
 0040E5CA    mov         esp,ebp
 0040E5CC    pop         ebp
 0040E5CD    ret
*}
end;

//0040E5D0
procedure InitLeadBytes;
begin
{*
 0040E5D0    push        ebp
 0040E5D1    mov         ebp,esp
 0040E5D3    push        ecx
 0040E5D4    push        ebx
 0040E5D5    push        esi
 0040E5D6    push        edi
 0040E5D7    mov         edi,dword ptr [ebp+8]
 0040E5DA    add         edi,0FFFFFFEC
 0040E5DD    push        edi
 0040E5DE    mov         eax,[005E0810];SysLocale:TSysLocale
 0040E5E3    call        LCIDToCodePage
 0040E5E8    push        eax
 0040E5E9    call        KERNEL32.GetCPInfo
 0040E5EE    xor         esi,esi
>0040E5F0    jmp         0040E61B
 0040E5F2    mov         al,byte ptr [edi+esi+6]
 0040E5F6    mov         bl,byte ptr [edi+esi+7]
 0040E5FA    sub         bl,al
>0040E5FC    jb          0040E618
 0040E5FE    inc         ebx
 0040E5FF    mov         byte ptr [ebp-1],al
 0040E602    mov         al,byte ptr [ebp-1]
 0040E605    and         eax,0FF
 0040E60A    bts         dword ptr ds:[5AC198],eax
 0040E611    inc         byte ptr [ebp-1]
 0040E614    dec         bl
>0040E616    jne         0040E602
 0040E618    add         esi,2
 0040E61B    cmp         esi,0C
>0040E61E    jge         0040E62A
 0040E620    mov         al,byte ptr [edi+esi+6]
 0040E624    or          al,byte ptr [edi+esi+7]
>0040E628    jne         0040E5F2
 0040E62A    pop         edi
 0040E62B    pop         esi
 0040E62C    pop         ebx
 0040E62D    pop         ecx
 0040E62E    pop         ebp
 0040E62F    ret
*}
end;

//0040E630
function IsWesternGroup:Boolean;
begin
{*
 0040E630    mov         eax,[005E0814]
 0040E635    cmp         eax,1F
>0040E638    ja          0040E641
 0040E63A    bt          dword ptr ds:[5AC394],eax
 0040E641    setb        al
 0040E644    ret
*}
end;

//0040E648
procedure InitSysLocale;
begin
{*
 0040E648    push        ebp
 0040E649    mov         ebp,esp
 0040E64B    add         esp,0FFFFFE68
 0040E651    push        ebx
 0040E652    push        esi
 0040E653    push        edi
 0040E654    mov         dword ptr ds:[5E0810],409;SysLocale:TSysLocale
 0040E65E    mov         dword ptr ds:[5E0814],9
 0040E668    mov         dword ptr ds:[5E0818],1
 0040E672    call        KERNEL32.GetThreadLocale
 0040E677    test        eax,eax
>0040E679    je          0040E680
 0040E67B    mov         [005E0810],eax;SysLocale:TSysLocale
 0040E680    test        ax,ax
>0040E683    je          0040E6A0
 0040E685    mov         edx,eax
 0040E687    and         dx,3FF
 0040E68C    movzx       edx,dx
 0040E68F    mov         dword ptr ds:[5E0814],edx
 0040E695    movzx       eax,ax
 0040E698    shr         eax,0A
 0040E69B    mov         [005E0818],eax
 0040E6A0    mov         esi,40E79C
 0040E6A5    mov         edi,5AC198
 0040E6AA    mov         ecx,8
 0040E6AF    rep movs    dword ptr [edi],dword ptr [esi]
 0040E6B1    cmp         dword ptr ds:[5AC150],2
>0040E6B8    jne         0040E765
 0040E6BE    call        IsWesternGroup
 0040E6C3    test        al,al
>0040E6C5    je          0040E6DA
 0040E6C7    mov         byte ptr ds:[5E081D],0
 0040E6CE    mov         byte ptr ds:[5E081C],0
>0040E6D5    jmp         0040E793
 0040E6DA    push        ebp
 0040E6DB    call        InitLeadBytes
 0040E6E0    pop         ecx
 0040E6E1    mov         eax,5AC198
 0040E6E6    mov         edx,40E79C
 0040E6EB    mov         cl,20
 0040E6ED    call        @SetEq
 0040E6F2    setne       bl
 0040E6F5    mov         byte ptr ds:[5E081C],bl
 0040E6FB    test        bl,bl
>0040E6FD    je          0040E70B
 0040E6FF    mov         byte ptr ds:[5E081D],0
>0040E706    jmp         0040E793
 0040E70B    mov         eax,80
 0040E710    lea         edx,[ebp-94]
 0040E716    mov         byte ptr [edx],al
 0040E718    inc         eax
 0040E719    inc         edx
 0040E71A    cmp         eax,100
>0040E71F    jne         0040E716
 0040E721    lea         eax,[ebp-94]
 0040E727    lea         edx,[ebp-196]
 0040E72D    push        edx
 0040E72E    push        80
 0040E733    push        eax
 0040E734    push        2
 0040E736    mov         eax,[005E0810];SysLocale:TSysLocale
 0040E73B    push        eax
 0040E73C    call        KERNEL32.GetStringTypeExA
 0040E741    mov         eax,80
 0040E746    lea         edx,[ebp-196]
 0040E74C    cmp         word ptr [edx],2
 0040E750    sete        cl
 0040E753    mov         byte ptr ds:[5E081D],cl
 0040E759    test        cl,cl
>0040E75B    jne         0040E793
 0040E75D    add         edx,2
 0040E760    dec         eax
>0040E761    jne         0040E74C
>0040E763    jmp         0040E793
 0040E765    push        4A
 0040E767    call        user32.GetSystemMetrics
 0040E76C    test        eax,eax
 0040E76E    setne       al
 0040E771    mov         [005E081D],al
 0040E776    push        2A
 0040E778    call        user32.GetSystemMetrics
 0040E77D    test        eax,eax
 0040E77F    setne       bl
 0040E782    mov         byte ptr ds:[5E081C],bl
 0040E788    test        bl,bl
>0040E78A    je          0040E793
 0040E78C    push        ebp
 0040E78D    call        InitLeadBytes
 0040E792    pop         ecx
 0040E793    pop         edi
 0040E794    pop         esi
 0040E795    pop         ebx
 0040E796    mov         esp,ebp
 0040E798    pop         ebp
 0040E799    ret
*}
end;

//0040E7BC
procedure GetFormatSettings;
begin
{*
 0040E7BC    push        ebp
 0040E7BD    mov         ebp,esp
 0040E7BF    mov         ecx,8
 0040E7C4    push        0
 0040E7C6    push        0
 0040E7C8    dec         ecx
>0040E7C9    jne         0040E7C4
 0040E7CB    push        ebx
 0040E7CC    xor         eax,eax
 0040E7CE    push        ebp
 0040E7CF    push        40EA87
 0040E7D4    push        dword ptr fs:[eax]
 0040E7D7    mov         dword ptr fs:[eax],esp
 0040E7DA    call        InitSysLocale
 0040E7DF    call        GetMonthDayNames
 0040E7E4    cmp         byte ptr ds:[5E081C],0
>0040E7EB    je          0040E7F2
 0040E7ED    call        GetEraNamesAndYearOffsets
 0040E7F2    call        KERNEL32.GetThreadLocale
 0040E7F7    mov         ebx,eax
 0040E7F9    lea         eax,[ebp-10]
 0040E7FC    push        eax
 0040E7FD    xor         ecx,ecx
 0040E7FF    mov         edx,14
 0040E804    mov         eax,ebx
 0040E806    call        GetLocaleStr
 0040E80B    mov         edx,dword ptr [ebp-10]
 0040E80E    mov         eax,5E0750;CurrencyString:AnsiString
 0040E813    call        @LStrAsg
 0040E818    lea         eax,[ebp-14]
 0040E81B    push        eax
 0040E81C    mov         ecx,40EA9C;'0'
 0040E821    mov         edx,1B
 0040E826    mov         eax,ebx
 0040E828    call        GetLocaleStr
 0040E82D    mov         eax,dword ptr [ebp-14]
 0040E830    xor         edx,edx
 0040E832    call        StrToIntDef
 0040E837    mov         [005E0754],al;CurrencyFormat:Byte
 0040E83C    lea         eax,[ebp-18]
 0040E83F    push        eax
 0040E840    mov         ecx,40EA9C;'0'
 0040E845    mov         edx,1C
 0040E84A    mov         eax,ebx
 0040E84C    call        GetLocaleStr
 0040E851    mov         eax,dword ptr [ebp-18]
 0040E854    xor         edx,edx
 0040E856    call        StrToIntDef
 0040E85B    mov         [005E0755],al;NegCurrFormat:Byte
 0040E860    mov         cl,2C
 0040E862    mov         edx,0F
 0040E867    mov         eax,ebx
 0040E869    call        GetLocaleChar
 0040E86E    mov         [005E0756],al;ThousandSeparator:Char
 0040E873    mov         cl,2E
 0040E875    mov         edx,0E
 0040E87A    mov         eax,ebx
 0040E87C    call        GetLocaleChar
 0040E881    mov         [005E0757],al;DecimalSeparator:Char
 0040E886    lea         eax,[ebp-1C]
 0040E889    push        eax
 0040E88A    mov         ecx,40EA9C;'0'
 0040E88F    mov         edx,19
 0040E894    mov         eax,ebx
 0040E896    call        GetLocaleStr
 0040E89B    mov         eax,dword ptr [ebp-1C]
 0040E89E    xor         edx,edx
 0040E8A0    call        StrToIntDef
 0040E8A5    mov         [005E0758],al;CurrencyDecimals:Byte
 0040E8AA    mov         cl,2F
 0040E8AC    mov         edx,1D
 0040E8B1    mov         eax,ebx
 0040E8B3    call        GetLocaleChar
 0040E8B8    mov         [005E0759],al;DateSeparator:Char
 0040E8BD    lea         eax,[ebp-24]
 0040E8C0    push        eax
 0040E8C1    mov         ecx,40EAA8;'m/d/yy'
 0040E8C6    mov         edx,1F
 0040E8CB    mov         eax,ebx
 0040E8CD    call        GetLocaleStr
 0040E8D2    mov         eax,dword ptr [ebp-24]
 0040E8D5    lea         edx,[ebp-20]
 0040E8D8    call        TranslateDateFormat
 0040E8DD    mov         edx,dword ptr [ebp-20]
 0040E8E0    mov         eax,5E075C;ShortDateFormat:AnsiString
 0040E8E5    call        @LStrAsg
 0040E8EA    lea         eax,[ebp-2C]
 0040E8ED    push        eax
 0040E8EE    mov         ecx,40EAB8;'mmmm d, yyyy'
 0040E8F3    mov         edx,20
 0040E8F8    mov         eax,ebx
 0040E8FA    call        GetLocaleStr
 0040E8FF    mov         eax,dword ptr [ebp-2C]
 0040E902    lea         edx,[ebp-28]
 0040E905    call        TranslateDateFormat
 0040E90A    mov         edx,dword ptr [ebp-28]
 0040E90D    mov         eax,5E0760;LongDateFormat:AnsiString
 0040E912    call        @LStrAsg
 0040E917    mov         cl,3A
 0040E919    mov         edx,1E
 0040E91E    mov         eax,ebx
 0040E920    call        GetLocaleChar
 0040E925    mov         [005E0764],al;TimeSeparator:Char
 0040E92A    lea         eax,[ebp-30]
 0040E92D    push        eax
 0040E92E    mov         ecx,40EAD0;'am'
 0040E933    mov         edx,28
 0040E938    mov         eax,ebx
 0040E93A    call        GetLocaleStr
 0040E93F    mov         edx,dword ptr [ebp-30]
 0040E942    mov         eax,5E0768;TimeAMString:AnsiString
 0040E947    call        @LStrAsg
 0040E94C    lea         eax,[ebp-34]
 0040E94F    push        eax
 0040E950    mov         ecx,40EADC;'pm'
 0040E955    mov         edx,29
 0040E95A    mov         eax,ebx
 0040E95C    call        GetLocaleStr
 0040E961    mov         edx,dword ptr [ebp-34]
 0040E964    mov         eax,5E076C;TimePMString:AnsiString
 0040E969    call        @LStrAsg
 0040E96E    lea         eax,[ebp-8]
 0040E971    call        @LStrClr
 0040E976    lea         eax,[ebp-0C]
 0040E979    call        @LStrClr
 0040E97E    lea         eax,[ebp-38]
 0040E981    push        eax
 0040E982    mov         ecx,40EA9C;'0'
 0040E987    mov         edx,25
 0040E98C    mov         eax,ebx
 0040E98E    call        GetLocaleStr
 0040E993    mov         eax,dword ptr [ebp-38]
 0040E996    xor         edx,edx
 0040E998    call        StrToIntDef
 0040E99D    test        eax,eax
>0040E99F    jne         0040E9B0
 0040E9A1    lea         eax,[ebp-4]
 0040E9A4    mov         edx,40EAE8;'h'
 0040E9A9    call        @LStrLAsg
>0040E9AE    jmp         0040E9BD
 0040E9B0    lea         eax,[ebp-4]
 0040E9B3    mov         edx,40EAF4;'hh'
 0040E9B8    call        @LStrLAsg
 0040E9BD    lea         eax,[ebp-3C]
 0040E9C0    push        eax
 0040E9C1    mov         ecx,40EA9C;'0'
 0040E9C6    mov         edx,23
 0040E9CB    mov         eax,ebx
 0040E9CD    call        GetLocaleStr
 0040E9D2    mov         eax,dword ptr [ebp-3C]
 0040E9D5    xor         edx,edx
 0040E9D7    call        StrToIntDef
 0040E9DC    test        eax,eax
>0040E9DE    jne         0040EA1F
 0040E9E0    lea         eax,[ebp-40]
 0040E9E3    push        eax
 0040E9E4    mov         ecx,40EA9C;'0'
 0040E9E9    mov         edx,1005
 0040E9EE    mov         eax,ebx
 0040E9F0    call        GetLocaleStr
 0040E9F5    mov         eax,dword ptr [ebp-40]
 0040E9F8    xor         edx,edx
 0040E9FA    call        StrToIntDef
 0040E9FF    test        eax,eax
>0040EA01    jne         0040EA12
 0040EA03    lea         eax,[ebp-0C]
 0040EA06    mov         edx,40EB00;' AMPM'
 0040EA0B    call        @LStrLAsg
>0040EA10    jmp         0040EA1F
 0040EA12    lea         eax,[ebp-8]
 0040EA15    mov         edx,40EB10;'AMPM '
 0040EA1A    call        @LStrLAsg
 0040EA1F    push        dword ptr [ebp-8]
 0040EA22    push        dword ptr [ebp-4]
 0040EA25    push        40EB20;':mm'
 0040EA2A    push        dword ptr [ebp-0C]
 0040EA2D    mov         eax,5E0770;ShortTimeFormat:AnsiString
 0040EA32    mov         edx,4
 0040EA37    call        @LStrCatN
 0040EA3C    push        dword ptr [ebp-8]
 0040EA3F    push        dword ptr [ebp-4]
 0040EA42    push        40EB2C;':mm:ss'
 0040EA47    push        dword ptr [ebp-0C]
 0040EA4A    mov         eax,5E0774;LongTimeFormat:AnsiString
 0040EA4F    mov         edx,4
 0040EA54    call        @LStrCatN
 0040EA59    mov         cl,2C
 0040EA5B    mov         edx,0C
 0040EA60    mov         eax,ebx
 0040EA62    call        GetLocaleChar
 0040EA67    mov         [005E081E],al;ListSeparator:Char
 0040EA6C    xor         eax,eax
 0040EA6E    pop         edx
 0040EA6F    pop         ecx
 0040EA70    pop         ecx
 0040EA71    mov         dword ptr fs:[eax],edx
 0040EA74    push        40EA8E
 0040EA79    lea         eax,[ebp-40]
 0040EA7C    mov         edx,10
 0040EA81    call        @LStrArrayClr
 0040EA86    ret
>0040EA87    jmp         @HandleFinally
>0040EA8C    jmp         0040EA79
 0040EA8E    pop         ebx
 0040EA8F    mov         esp,ebp
 0040EA91    pop         ebp
 0040EA92    ret
*}
end;

//0040EB34
function StringReplace(const S:AnsiString; const OldPattern:AnsiString; const NewPattern:AnsiString; Flags:TReplaceFlags):AnsiString;
begin
{*
 0040EB34    push        ebp
 0040EB35    mov         ebp,esp
 0040EB37    push        0
 0040EB39    push        0
 0040EB3B    push        0
 0040EB3D    push        0
 0040EB3F    push        0
 0040EB41    push        ebx
 0040EB42    push        esi
 0040EB43    push        edi
 0040EB44    mov         dword ptr [ebp-4],ecx
 0040EB47    mov         edi,edx
 0040EB49    mov         ebx,eax
 0040EB4B    mov         esi,dword ptr [ebp+8]
 0040EB4E    xor         eax,eax
 0040EB50    push        ebp
 0040EB51    push        40EC57
 0040EB56    push        dword ptr fs:[eax]
 0040EB59    mov         dword ptr fs:[eax],esp
 0040EB5C    test        byte ptr [ebp+0C],2
>0040EB60    je          0040EB78
 0040EB62    lea         edx,[ebp-8]
 0040EB65    mov         eax,ebx
 0040EB67    call        AnsiUpperCase
 0040EB6C    lea         edx,[ebp-0C]
 0040EB6F    mov         eax,edi
 0040EB71    call        AnsiUpperCase
>0040EB76    jmp         0040EB8C
 0040EB78    lea         eax,[ebp-8]
 0040EB7B    mov         edx,ebx
 0040EB7D    call        @LStrLAsg
 0040EB82    lea         eax,[ebp-0C]
 0040EB85    mov         edx,edi
 0040EB87    call        @LStrLAsg
 0040EB8C    lea         eax,[ebp-10]
 0040EB8F    mov         edx,ebx
 0040EB91    call        @LStrLAsg
 0040EB96    mov         eax,esi
 0040EB98    call        @LStrClr
>0040EB9D    jmp         0040EC32
 0040EBA2    mov         edx,dword ptr [ebp-8]
 0040EBA5    mov         eax,dword ptr [ebp-0C]
 0040EBA8    call        AnsiPos
 0040EBAD    mov         ebx,eax
 0040EBAF    test        ebx,ebx
>0040EBB1    jne         0040EBBF
 0040EBB3    mov         eax,esi
 0040EBB5    mov         edx,dword ptr [ebp-10]
 0040EBB8    call        @LStrCat
>0040EBBD    jmp         0040EC3C
 0040EBBF    push        dword ptr [esi]
 0040EBC1    lea         eax,[ebp-14]
 0040EBC4    push        eax
 0040EBC5    mov         ecx,ebx
 0040EBC7    dec         ecx
 0040EBC8    mov         edx,1
 0040EBCD    mov         eax,dword ptr [ebp-10]
 0040EBD0    call        @LStrCopy
 0040EBD5    push        dword ptr [ebp-14]
 0040EBD8    push        dword ptr [ebp-4]
 0040EBDB    mov         eax,esi
 0040EBDD    mov         edx,3
 0040EBE2    call        @LStrCatN
 0040EBE7    lea         eax,[ebp-10]
 0040EBEA    push        eax
 0040EBEB    mov         eax,edi
 0040EBED    call        @LStrLen
 0040EBF2    mov         edx,eax
 0040EBF4    add         edx,ebx
 0040EBF6    mov         ecx,7FFFFFFF
 0040EBFB    mov         eax,dword ptr [ebp-10]
 0040EBFE    call        @LStrCopy
 0040EC03    test        byte ptr [ebp+0C],1
>0040EC07    jne         0040EC15
 0040EC09    mov         eax,esi
 0040EC0B    mov         edx,dword ptr [ebp-10]
 0040EC0E    call        @LStrCat
>0040EC13    jmp         0040EC3C
 0040EC15    lea         eax,[ebp-8]
 0040EC18    push        eax
 0040EC19    mov         eax,dword ptr [ebp-0C]
 0040EC1C    call        @LStrLen
 0040EC21    mov         edx,eax
 0040EC23    add         edx,ebx
 0040EC25    mov         ecx,7FFFFFFF
 0040EC2A    mov         eax,dword ptr [ebp-8]
 0040EC2D    call        @LStrCopy
 0040EC32    cmp         dword ptr [ebp-8],0
>0040EC36    jne         0040EBA2
 0040EC3C    xor         eax,eax
 0040EC3E    pop         edx
 0040EC3F    pop         ecx
 0040EC40    pop         ecx
 0040EC41    mov         dword ptr fs:[eax],edx
 0040EC44    push        40EC5E
 0040EC49    lea         eax,[ebp-14]
 0040EC4C    mov         edx,4
 0040EC51    call        @LStrArrayClr
 0040EC56    ret
>0040EC57    jmp         @HandleFinally
>0040EC5C    jmp         0040EC49
 0040EC5E    pop         edi
 0040EC5F    pop         esi
 0040EC60    pop         ebx
 0040EC61    mov         esp,ebp
 0040EC63    pop         ebp
 0040EC64    ret         8
*}
end;

//0040EC68
procedure KERNEL32.Sleep; stdcall;
begin
{*
 0040EC68    jmp         dword ptr ds:[60878C]
*}
end;

//0040EC70
procedure RaiseLastOSError;
begin
{*
 0040EC70    push        ebp
 0040EC71    mov         ebp,esp
 0040EC73    add         esp,0FFFFFFEC
 0040EC76    push        ebx
 0040EC77    xor         eax,eax
 0040EC79    mov         dword ptr [ebp-14],eax
 0040EC7C    xor         eax,eax
 0040EC7E    push        ebp
 0040EC7F    push        40ED00
 0040EC84    push        dword ptr fs:[eax]
 0040EC87    mov         dword ptr fs:[eax],esp
 0040EC8A    call        KERNEL32.GetLastError
 0040EC8F    mov         ebx,eax
 0040EC91    test        ebx,ebx
>0040EC93    je          0040ECCC
 0040EC95    mov         dword ptr [ebp-10],ebx
 0040EC98    mov         byte ptr [ebp-0C],0
 0040EC9C    lea         edx,[ebp-14]
 0040EC9F    mov         eax,ebx
 0040ECA1    call        SysErrorMessage
 0040ECA6    mov         eax,dword ptr [ebp-14]
 0040ECA9    mov         dword ptr [ebp-8],eax
 0040ECAC    mov         byte ptr [ebp-4],0B
 0040ECB0    lea         eax,[ebp-10]
 0040ECB3    push        eax
 0040ECB4    push        1
 0040ECB6    mov         ecx,dword ptr ds:[5AE5DC];^SResString2:TResStringRec
 0040ECBC    mov         dl,1
 0040ECBE    mov         eax,[004094C4];EOSError
 0040ECC3    call        Exception.CreateResFmt
 0040ECC8    mov         edx,eax
>0040ECCA    jmp         0040ECE0
 0040ECCC    mov         ecx,dword ptr ds:[5AE768];^SUnkOSError:TResStringRec
 0040ECD2    mov         dl,1
 0040ECD4    mov         eax,[004094C4];EOSError
 0040ECD9    call        Exception.CreateRes
 0040ECDE    mov         edx,eax
 0040ECE0    mov         dword ptr [edx+0C],ebx
 0040ECE3    mov         eax,edx
 0040ECE5    call        @RaiseExcept
 0040ECEA    xor         eax,eax
 0040ECEC    pop         edx
 0040ECED    pop         ecx
 0040ECEE    pop         ecx
 0040ECEF    mov         dword ptr fs:[eax],edx
 0040ECF2    push        40ED07
 0040ECF7    lea         eax,[ebp-14]
 0040ECFA    call        @LStrClr
 0040ECFF    ret
>0040ED00    jmp         @HandleFinally
>0040ED05    jmp         0040ECF7
 0040ED07    pop         ebx
 0040ED08    mov         esp,ebp
 0040ED0A    pop         ebp
 0040ED0B    ret
*}
end;

//0040ED0C
function Win32Check(RetVal:BOOL):BOOL;
begin
{*
 0040ED0C    push        ebx
 0040ED0D    mov         ebx,eax
 0040ED0F    test        ebx,ebx
>0040ED11    jne         0040ED18
 0040ED13    call        RaiseLastOSError
 0040ED18    mov         eax,ebx
 0040ED1A    pop         ebx
 0040ED1B    ret
*}
end;

//0040ED1C
function CallTerminateProcs:Boolean;
begin
{*
 0040ED1C    push        ebx
 0040ED1D    mov         al,1
 0040ED1F    mov         ebx,dword ptr ds:[5AC398]
>0040ED25    jmp         0040ED2C
 0040ED27    call        dword ptr [ebx+4]
 0040ED2A    mov         ebx,dword ptr [ebx]
 0040ED2C    test        al,al
>0040ED2E    je          0040ED34
 0040ED30    test        ebx,ebx
>0040ED32    jne         0040ED27
 0040ED34    pop         ebx
 0040ED35    ret
*}
end;

//0040ED38
procedure FreeTerminateProcs;
begin
{*
 0040ED38    push        ebx
 0040ED39    mov         ebx,5AC398
>0040ED3E    jmp         0040ED50
 0040ED40    mov         eax,dword ptr [ebx]
 0040ED42    mov         edx,dword ptr [eax]
 0040ED44    mov         dword ptr [ebx],edx
 0040ED46    mov         edx,8
 0040ED4B    call        @FreeMem
 0040ED50    cmp         dword ptr [ebx],0
>0040ED53    jne         0040ED40
 0040ED55    pop         ebx
 0040ED56    ret
*}
end;

//0040ED58
procedure InitDriveSpacePtr;
begin
{*
 0040ED58    push        ebx
 0040ED59    push        40ED90
 0040ED5E    call        KERNEL32.GetModuleHandleA
 0040ED63    mov         ebx,eax
 0040ED65    test        ebx,ebx
>0040ED67    je          0040ED79
 0040ED69    push        40EDA0
 0040ED6E    push        ebx
 0040ED6F    call        KERNEL32.GetProcAddress
 0040ED74    mov         [005AC1BC],eax
 0040ED79    cmp         dword ptr ds:[5AC1BC],0
>0040ED80    jne         0040ED8C
 0040ED82    mov         eax,40A2D0;BackfillGetDiskFreeSpaceEx:BOOL
 0040ED87    mov         [005AC1BC],eax
 0040ED8C    pop         ebx
 0040ED8D    ret
*}
end;

//0040EDB4
function InterlockedIncrement(var I:Integer):Integer;
begin
{*
 0040EDB4    mov         edx,1
 0040EDB9    xchg        eax,edx
 0040EDBA    lock xadd   dword ptr [edx],eax
 0040EDBE    inc         eax
 0040EDBF    ret
*}
end;

//0040EDC0
function InterlockedDecrement(var I:Integer):Integer;
begin
{*
 0040EDC0    mov         edx,0FFFFFFFF
 0040EDC5    xchg        eax,edx
 0040EDC6    lock xadd   dword ptr [edx],eax
 0040EDCA    dec         eax
 0040EDCB    ret
*}
end;

//0040EDCC
function InterlockedExchange(var A:Integer; B:Integer):Integer;
begin
{*
 0040EDCC    xchg        edx,dword ptr [eax]
 0040EDCE    mov         eax,edx
 0040EDD0    ret
*}
end;

//0040EDD4
function InterlockedExchangeAdd(var A:Integer; B:Integer):Integer;
begin
{*
 0040EDD4    xchg        eax,edx
 0040EDD5    lock xadd   dword ptr [edx],eax
 0040EDD9    ret
*}
end;

//0040EDDC
destructor TThreadLocalCounter.Destroy;
begin
{*
 0040EDDC    push        ebx
 0040EDDD    push        esi
 0040EDDE    push        edi
 0040EDDF    push        ebp
 0040EDE0    call        @BeforeDestruction
 0040EDE5    mov         ebx,edx
 0040EDE7    mov         edi,eax
 0040EDE9    xor         esi,esi
 0040EDEB    mov         ebp,dword ptr [edi+esi*4+4]
 0040EDEF    xor         eax,eax
 0040EDF1    mov         dword ptr [edi+esi*4+4],eax
 0040EDF5    test        ebp,ebp
>0040EDF7    je          0040EE07
 0040EDF9    mov         eax,ebp
 0040EDFB    mov         ebp,dword ptr [ebp]
 0040EDFE    call        @FreeMem
 0040EE03    test        ebp,ebp
>0040EE05    jne         0040EDF9
 0040EE07    inc         esi
 0040EE08    cmp         esi,10
>0040EE0B    jne         0040EDEB
 0040EE0D    mov         edx,ebx
 0040EE0F    and         dl,0FC
 0040EE12    mov         eax,edi
 0040EE14    call        TObject.Destroy
 0040EE19    test        bl,bl
>0040EE1B    jle         0040EE24
 0040EE1D    mov         eax,edi
 0040EE1F    call        @ClassDestroy
 0040EE24    pop         ebp
 0040EE25    pop         edi
 0040EE26    pop         esi
 0040EE27    pop         ebx
 0040EE28    ret
*}
end;

//0040EE2C
function TThreadLocalCounter.HashIndex:Byte;
begin
{*
 0040EE2C    push        ebp
 0040EE2D    mov         ebp,esp
 0040EE2F    push        ecx
 0040EE30    call        KERNEL32.GetCurrentThreadId
 0040EE35    mov         word ptr [ebp-2],ax
 0040EE39    mov         al,byte ptr [ebp-2]
 0040EE3C    xor         al,byte ptr [ebp-1]
 0040EE3F    and         al,0F
 0040EE41    pop         ecx
 0040EE42    pop         ebp
 0040EE43    ret
*}
end;

//0040EE44
procedure TThreadLocalCounter.Open(var Thread:PThreadInfo);
begin
{*
 0040EE44    push        ebx
 0040EE45    push        esi
 0040EE46    push        edi
 0040EE47    push        ebp
 0040EE48    push        ecx
 0040EE49    mov         dword ptr [esp],edx
 0040EE4C    mov         edi,eax
 0040EE4E    mov         eax,edi
 0040EE50    call        TThreadLocalCounter.HashIndex
 0040EE55    mov         ebx,eax
 0040EE57    call        KERNEL32.GetCurrentThreadId
 0040EE5C    mov         esi,eax
 0040EE5E    xor         eax,eax
 0040EE60    mov         al,bl
 0040EE62    mov         ebp,dword ptr [edi+eax*4+4]
>0040EE66    jmp         0040EE6B
 0040EE68    mov         ebp,dword ptr [ebp]
 0040EE6B    test        ebp,ebp
>0040EE6D    je          0040EE74
 0040EE6F    cmp         esi,dword ptr [ebp+4]
>0040EE72    jne         0040EE68
 0040EE74    test        ebp,ebp
>0040EE76    jne         0040EEB0
 0040EE78    mov         eax,edi
 0040EE7A    call        TThreadLocalCounter.Recycle
 0040EE7F    mov         ebp,eax
 0040EE81    test        ebp,ebp
>0040EE83    jne         0040EEB0
 0040EE85    mov         eax,10
 0040EE8A    call        AllocMem
 0040EE8F    mov         ebp,eax
 0040EE91    mov         dword ptr [ebp+4],esi
 0040EE94    mov         dword ptr [ebp+8],7FFFFFFF
 0040EE9B    mov         dword ptr [ebp],ebp
 0040EE9E    xor         eax,eax
 0040EEA0    mov         al,bl
 0040EEA2    lea         eax,[edi+eax*4+4]
 0040EEA6    mov         edx,ebp
 0040EEA8    call        InterlockedExchange
 0040EEAD    mov         dword ptr [ebp],eax
 0040EEB0    mov         eax,dword ptr [esp]
 0040EEB3    mov         dword ptr [eax],ebp
 0040EEB5    pop         edx
 0040EEB6    pop         ebp
 0040EEB7    pop         edi
 0040EEB8    pop         esi
 0040EEB9    pop         ebx
 0040EEBA    ret
*}
end;

//0040EEBC
procedure TThreadLocalCounter.Delete(var Thread:PThreadInfo);
begin
{*
 0040EEBC    mov         eax,dword ptr [edx]
 0040EEBE    xor         ecx,ecx
 0040EEC0    mov         dword ptr [eax+4],ecx
 0040EEC3    mov         eax,dword ptr [edx]
 0040EEC5    xor         edx,edx
 0040EEC7    mov         dword ptr [eax+8],edx
 0040EECA    ret
*}
end;

//0040EECC
function TThreadLocalCounter.Recycle:PThreadInfo;
begin
{*
 0040EECC    push        ebx
 0040EECD    mov         ebx,eax
 0040EECF    mov         eax,ebx
 0040EED1    call        TThreadLocalCounter.HashIndex
 0040EED6    and         eax,0FF
 0040EEDB    mov         ebx,dword ptr [ebx+eax*4+4]
 0040EEDF    test        ebx,ebx
>0040EEE1    je          0040EF07
 0040EEE3    lea         eax,[ebx+8]
 0040EEE6    mov         edx,7FFFFFFF
 0040EEEB    call        InterlockedExchange
 0040EEF0    cmp         eax,7FFFFFFF
>0040EEF5    je          0040EF01
 0040EEF7    call        KERNEL32.GetCurrentThreadId
 0040EEFC    mov         dword ptr [ebx+4],eax
>0040EEFF    jmp         0040EF07
 0040EF01    mov         ebx,dword ptr [ebx]
 0040EF03    test        ebx,ebx
>0040EF05    jne         0040EEE3
 0040EF07    mov         eax,ebx
 0040EF09    pop         ebx
 0040EF0A    ret
*}
end;

//0040EF0C
constructor TMultiReadExclusiveWriteSynchronizer.Create;
begin
{*
 0040EF0C    push        ebx
 0040EF0D    push        esi
 0040EF0E    test        dl,dl
>0040EF10    je          0040EF1A
 0040EF12    add         esp,0FFFFFFF0
 0040EF15    call        @ClassCreate
 0040EF1A    mov         ebx,edx
 0040EF1C    mov         esi,eax
 0040EF1E    xor         edx,edx
 0040EF20    mov         eax,esi
 0040EF22    call        TObject.Create
 0040EF27    mov         dword ptr [esi+0C],0FFFF
 0040EF2E    push        0
 0040EF30    push        0FF
 0040EF32    push        0FF
 0040EF34    push        0
 0040EF36    call        KERNEL32.CreateEventA
 0040EF3B    mov         dword ptr [esi+10],eax
 0040EF3E    push        0
 0040EF40    push        0
 0040EF42    push        0
 0040EF44    push        0
 0040EF46    call        KERNEL32.CreateEventA
 0040EF4B    mov         dword ptr [esi+14],eax
 0040EF4E    mov         dword ptr [esi+18],0FFFFFFFF
 0040EF55    mov         dl,1
 0040EF57    mov         eax,[004096A8];TThreadLocalCounter
 0040EF5C    call        TObject.Create
 0040EF61    mov         dword ptr [esi+20],eax
 0040EF64    mov         eax,esi
 0040EF66    test        bl,bl
>0040EF68    je          0040EF79
 0040EF6A    call        @AfterConstruction
 0040EF6F    pop         dword ptr fs:[0]
 0040EF76    add         esp,0C
 0040EF79    mov         eax,esi
 0040EF7B    pop         esi
 0040EF7C    pop         ebx
 0040EF7D    ret
*}
end;

//0040EF80
destructor TMultiReadExclusiveWriteSynchronizer.Destroy;
begin
{*
 0040EF80    push        ebx
 0040EF81    push        esi
 0040EF82    call        @BeforeDestruction
 0040EF87    mov         ebx,edx
 0040EF89    mov         esi,eax
 0040EF8B    mov         eax,esi
 0040EF8D    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 0040EF92    mov         edx,ebx
 0040EF94    and         dl,0FC
 0040EF97    mov         eax,esi
 0040EF99    call        TObject.Destroy
 0040EF9E    mov         eax,dword ptr [esi+10]
 0040EFA1    push        eax
 0040EFA2    call        KERNEL32.CloseHandle
 0040EFA7    mov         eax,dword ptr [esi+14]
 0040EFAA    push        eax
 0040EFAB    call        KERNEL32.CloseHandle
 0040EFB0    mov         eax,dword ptr [esi+20]
 0040EFB3    call        TObject.Free
 0040EFB8    test        bl,bl
>0040EFBA    jle         0040EFC3
 0040EFBC    mov         eax,esi
 0040EFBE    call        @ClassDestroy
 0040EFC3    pop         esi
 0040EFC4    pop         ebx
 0040EFC5    ret
*}
end;

//0040EFC8
procedure TMultiReadExclusiveWriteSynchronizer.BlockReaders;
begin
{*
 0040EFC8    mov         eax,dword ptr [eax+10]
 0040EFCB    push        eax
 0040EFCC    call        KERNEL32.ResetEvent
 0040EFD1    ret
*}
end;

//0040EFD4
procedure TMultiReadExclusiveWriteSynchronizer.UnblockReaders;
begin
{*
 0040EFD4    mov         eax,dword ptr [eax+10]
 0040EFD7    push        eax
 0040EFD8    call        KERNEL32.SetEvent
 0040EFDD    ret
*}
end;

//0040EFE0
procedure TMultiReadExclusiveWriteSynchronizer.UnblockOneWriter;
begin
{*
 0040EFE0    mov         eax,dword ptr [eax+14]
 0040EFE3    push        eax
 0040EFE4    call        KERNEL32.SetEvent
 0040EFE9    ret
*}
end;

//0040EFEC
procedure TMultiReadExclusiveWriteSynchronizer.WaitForReadSignal;
begin
{*
 0040EFEC    mov         edx,dword ptr [eax+18]
 0040EFEF    push        edx
 0040EFF0    mov         eax,dword ptr [eax+10]
 0040EFF3    push        eax
 0040EFF4    call        KERNEL32.WaitForSingleObject
 0040EFF9    ret
*}
end;

//0040EFFC
procedure TMultiReadExclusiveWriteSynchronizer.WaitForWriteSignal;
begin
{*
 0040EFFC    mov         edx,dword ptr [eax+18]
 0040EFFF    push        edx
 0040F000    mov         eax,dword ptr [eax+14]
 0040F003    push        eax
 0040F004    call        KERNEL32.WaitForSingleObject
 0040F009    ret
*}
end;

//0040F00C
function TMultiReadExclusiveWriteSynchronizer.BeginWrite:Boolean;
begin
{*
 0040F00C    push        ebx
 0040F00D    push        esi
 0040F00E    push        edi
 0040F00F    push        ebp
 0040F010    push        ecx
 0040F011    mov         edi,eax
 0040F013    mov         bl,1
 0040F015    call        KERNEL32.GetCurrentThreadId
 0040F01A    mov         esi,eax
 0040F01C    cmp         esi,dword ptr [edi+24]
>0040F01F    je          0040F09D
 0040F021    mov         eax,edi
 0040F023    call        TMultiReadExclusiveWriteSynchronizer.BlockReaders
 0040F028    mov         ebp,dword ptr [edi+28]
 0040F02B    mov         edx,esp
 0040F02D    mov         eax,dword ptr [edi+20]
 0040F030    call        TThreadLocalCounter.Open
 0040F035    mov         eax,dword ptr [esp]
 0040F038    cmp         dword ptr [eax+0C],0
 0040F03C    seta        bl
 0040F03F    test        bl,bl
>0040F041    je          0040F065
 0040F043    lea         eax,[edi+0C]
 0040F046    call        InterlockedIncrement
>0040F04B    jmp         0040F065
 0040F04D    lea         eax,[edi+0C]
 0040F050    mov         edx,0FFFF
 0040F055    call        InterlockedExchangeAdd
 0040F05A    test        eax,eax
>0040F05C    je          0040F065
 0040F05E    mov         eax,edi
 0040F060    call        TMultiReadExclusiveWriteSynchronizer.WaitForWriteSignal
 0040F065    lea         eax,[edi+0C]
 0040F068    mov         edx,0FFFF0001
 0040F06D    call        InterlockedExchangeAdd
 0040F072    cmp         eax,0FFFF
>0040F077    jne         0040F04D
 0040F079    mov         eax,edi
 0040F07B    call        TMultiReadExclusiveWriteSynchronizer.BlockReaders
 0040F080    test        bl,bl
>0040F082    je          0040F08C
 0040F084    lea         eax,[edi+0C]
 0040F087    call        InterlockedDecrement
 0040F08C    mov         dword ptr [edi+24],esi
 0040F08F    lea         eax,[edi+28]
 0040F092    call        InterlockedIncrement
 0040F097    dec         eax
 0040F098    cmp         eax,ebp
 0040F09A    sete        bl
 0040F09D    inc         dword ptr [edi+1C]
 0040F0A0    mov         eax,ebx
 0040F0A2    pop         edx
 0040F0A3    pop         ebp
 0040F0A4    pop         edi
 0040F0A5    pop         esi
 0040F0A6    pop         ebx
 0040F0A7    ret
*}
end;

//0040F0A8
procedure TMultiReadExclusiveWriteSynchronizer.EndWrite;
begin
{*
 0040F0A8    push        ebx
 0040F0A9    push        ecx
 0040F0AA    mov         ebx,eax
 0040F0AC    mov         edx,esp
 0040F0AE    mov         eax,dword ptr [ebx+20]
 0040F0B1    call        TThreadLocalCounter.Open
 0040F0B6    dec         dword ptr [ebx+1C]
 0040F0B9    cmp         dword ptr [ebx+1C],0
>0040F0BD    jne         0040F0DF
 0040F0BF    xor         eax,eax
 0040F0C1    mov         dword ptr [ebx+24],eax
 0040F0C4    lea         eax,[ebx+0C]
 0040F0C7    mov         edx,0FFFF
 0040F0CC    call        InterlockedExchangeAdd
 0040F0D1    mov         eax,ebx
 0040F0D3    call        TMultiReadExclusiveWriteSynchronizer.UnblockOneWriter
 0040F0D8    mov         eax,ebx
 0040F0DA    call        TMultiReadExclusiveWriteSynchronizer.UnblockReaders
 0040F0DF    mov         eax,dword ptr [esp]
 0040F0E2    cmp         dword ptr [eax+0C],0
>0040F0E6    jne         0040F0F2
 0040F0E8    mov         edx,esp
 0040F0EA    mov         eax,dword ptr [ebx+20]
 0040F0ED    call        TThreadLocalCounter.Delete
 0040F0F2    pop         edx
 0040F0F3    pop         ebx
 0040F0F4    ret
*}
end;

//0040F0F8
procedure TMultiReadExclusiveWriteSynchronizer.BeginRead;
begin
{*
 0040F0F8    push        ebx
 0040F0F9    push        esi
 0040F0FA    push        ecx
 0040F0FB    mov         esi,eax
 0040F0FD    mov         edx,esp
 0040F0FF    mov         eax,dword ptr [esi+20]
 0040F102    call        TThreadLocalCounter.Open
 0040F107    mov         eax,dword ptr [esp]
 0040F10A    inc         dword ptr [eax+0C]
 0040F10D    mov         eax,dword ptr [esp]
 0040F110    cmp         dword ptr [eax+0C],1
 0040F114    seta        bl
 0040F117    call        KERNEL32.GetCurrentThreadId
 0040F11C    cmp         eax,dword ptr [esi+24]
>0040F11F    je          0040F15E
 0040F121    test        bl,bl
>0040F123    jne         0040F15E
 0040F125    mov         eax,esi
 0040F127    call        TMultiReadExclusiveWriteSynchronizer.WaitForReadSignal
>0040F12C    jmp         0040F152
 0040F12E    lea         eax,[esi+0C]
 0040F131    call        InterlockedIncrement
 0040F136    cmp         eax,0FFFF
>0040F13B    jne         0040F144
 0040F13D    mov         eax,esi
 0040F13F    call        TMultiReadExclusiveWriteSynchronizer.UnblockOneWriter
 0040F144    push        0
 0040F146    call        KERNEL32.Sleep
 0040F14B    mov         eax,esi
 0040F14D    call        TMultiReadExclusiveWriteSynchronizer.WaitForReadSignal
 0040F152    lea         eax,[esi+0C]
 0040F155    call        InterlockedDecrement
 0040F15A    test        eax,eax
>0040F15C    jle         0040F12E
 0040F15E    pop         edx
 0040F15F    pop         esi
 0040F160    pop         ebx
 0040F161    ret
*}
end;

//0040F164
procedure TMultiReadExclusiveWriteSynchronizer.EndRead;
begin
{*
 0040F164    push        ebx
 0040F165    push        ecx
 0040F166    mov         ebx,eax
 0040F168    mov         edx,esp
 0040F16A    mov         eax,dword ptr [ebx+20]
 0040F16D    call        TThreadLocalCounter.Open
 0040F172    mov         eax,dword ptr [esp]
 0040F175    dec         dword ptr [eax+0C]
 0040F178    mov         eax,dword ptr [esp]
 0040F17B    cmp         dword ptr [eax+0C],0
>0040F17F    jne         0040F1C9
 0040F181    mov         edx,esp
 0040F183    mov         eax,dword ptr [ebx+20]
 0040F186    call        TThreadLocalCounter.Delete
 0040F18B    call        KERNEL32.GetCurrentThreadId
 0040F190    cmp         eax,dword ptr [ebx+24]
>0040F193    je          0040F1C9
 0040F195    lea         eax,[ebx+0C]
 0040F198    call        InterlockedIncrement
 0040F19D    mov         ecx,eax
 0040F19F    cmp         ecx,0FFFF
>0040F1A5    jne         0040F1B0
 0040F1A7    mov         eax,ebx
 0040F1A9    call        TMultiReadExclusiveWriteSynchronizer.UnblockOneWriter
>0040F1AE    jmp         0040F1C9
 0040F1B0    test        ecx,ecx
>0040F1B2    jg          0040F1C9
 0040F1B4    mov         eax,ecx
 0040F1B6    mov         ecx,0FFFF
 0040F1BB    cdq
 0040F1BC    idiv        eax,ecx
 0040F1BE    test        edx,edx
>0040F1C0    jne         0040F1C9
 0040F1C2    mov         eax,ebx
 0040F1C4    call        TMultiReadExclusiveWriteSynchronizer.UnblockOneWriter
 0040F1C9    pop         edx
 0040F1CA    pop         ebx
 0040F1CB    ret
*}
end;

//0040F1CC
procedure FreeAndNil(var Obj:void );
begin
{*
 0040F1CC    mov         edx,dword ptr [eax]
 0040F1CE    xor         ecx,ecx
 0040F1D0    mov         dword ptr [eax],ecx
 0040F1D2    mov         eax,edx
 0040F1D4    call        TObject.Free
 0040F1D9    ret
*}
end;

//0040F1DC
function Supports(const Instance:IInterface; const IID:TGUID; var Intf:void ):Boolean;
begin
{*
 0040F1DC    push        ebx
 0040F1DD    push        esi
 0040F1DE    push        edi
 0040F1DF    mov         edi,ecx
 0040F1E1    mov         esi,edx
 0040F1E3    mov         ebx,eax
 0040F1E5    test        ebx,ebx
>0040F1E7    je          0040F1F4
 0040F1E9    push        edi
 0040F1EA    push        esi
 0040F1EB    push        ebx
 0040F1EC    mov         eax,dword ptr [ebx]
 0040F1EE    call        dword ptr [eax]
 0040F1F0    test        eax,eax
>0040F1F2    je          0040F1F8
 0040F1F4    xor         eax,eax
>0040F1F6    jmp         0040F1FA
 0040F1F8    mov         al,1
 0040F1FA    pop         edi
 0040F1FB    pop         esi
 0040F1FC    pop         ebx
 0040F1FD    ret
*}
end;

//0040F200
function Supports(const Instance:TObject; const IID:TGUID; var Intf:void ):Boolean;
begin
{*
 0040F200    push        ebp
 0040F201    mov         ebp,esp
 0040F203    push        0
 0040F205    push        ebx
 0040F206    push        esi
 0040F207    push        edi
 0040F208    mov         edi,ecx
 0040F20A    mov         esi,edx
 0040F20C    mov         ebx,eax
 0040F20E    xor         eax,eax
 0040F210    push        ebp
 0040F211    push        40F277
 0040F216    push        dword ptr fs:[eax]
 0040F219    mov         dword ptr fs:[eax],esp
 0040F21C    test        ebx,ebx
>0040F21E    je          0040F259
 0040F220    lea         eax,[ebp-4]
 0040F223    call        @IntfClear
 0040F228    mov         ecx,eax
 0040F22A    mov         edx,40F288
 0040F22F    mov         eax,ebx
 0040F231    call        TObject.GetInterface
 0040F236    test        al,al
>0040F238    je          0040F24A
 0040F23A    mov         ecx,edi
 0040F23C    mov         edx,esi
 0040F23E    mov         eax,dword ptr [ebp-4]
 0040F241    call        Supports
 0040F246    test        al,al
>0040F248    jne         0040F25D
 0040F24A    mov         ecx,edi
 0040F24C    mov         edx,esi
 0040F24E    mov         eax,ebx
 0040F250    call        TObject.GetInterface
 0040F255    test        al,al
>0040F257    jne         0040F25D
 0040F259    xor         eax,eax
>0040F25B    jmp         0040F25F
 0040F25D    mov         al,1
 0040F25F    mov         ebx,eax
 0040F261    xor         eax,eax
 0040F263    pop         edx
 0040F264    pop         ecx
 0040F265    pop         ecx
 0040F266    mov         dword ptr fs:[eax],edx
 0040F269    push        40F27E
 0040F26E    lea         eax,[ebp-4]
 0040F271    call        @IntfClear
 0040F276    ret
>0040F277    jmp         @HandleFinally
>0040F27C    jmp         0040F26E
 0040F27E    mov         eax,ebx
 0040F280    pop         edi
 0040F281    pop         esi
 0040F282    pop         ebx
 0040F283    pop         ecx
 0040F284    pop         ebp
 0040F285    ret
*}
end;

//0040F298
function SafeLoadLibrary(const FileName:AnsiString; ErrorMode:UINT):HMODULE;
begin
{*
 0040F298    push        ebp
 0040F299    mov         ebp,esp
 0040F29B    add         esp,0FFFFFFF4
 0040F29E    push        ebx
 0040F29F    mov         ebx,eax
 0040F2A1    push        edx
 0040F2A2    call        KERNEL32.SetErrorMode
 0040F2A7    mov         dword ptr [ebp-0C],eax
 0040F2AA    xor         eax,eax
 0040F2AC    push        ebp
 0040F2AD    push        40F30A
 0040F2B2    push        dword ptr fs:[eax]
 0040F2B5    mov         dword ptr fs:[eax],esp
 0040F2B8    fnstcw      word ptr [ebp-2]
 0040F2BB    xor         eax,eax
 0040F2BD    push        ebp
 0040F2BE    push        40F2EC
 0040F2C3    push        dword ptr fs:[eax]
 0040F2C6    mov         dword ptr fs:[eax],esp
 0040F2C9    mov         eax,ebx
 0040F2CB    call        @LStrToPChar
 0040F2D0    push        eax
 0040F2D1    call        KERNEL32.LoadLibraryA
 0040F2D6    mov         dword ptr [ebp-8],eax
 0040F2D9    xor         eax,eax
 0040F2DB    pop         edx
 0040F2DC    pop         ecx
 0040F2DD    pop         ecx
 0040F2DE    mov         dword ptr fs:[eax],edx
 0040F2E1    push        40F2F3
 0040F2E6    fnclex
 0040F2E8    fldcw       word ptr [ebp-2]
 0040F2EB    ret
>0040F2EC    jmp         @HandleFinally
>0040F2F1    jmp         0040F2E6
 0040F2F3    xor         eax,eax
 0040F2F5    pop         edx
 0040F2F6    pop         ecx
 0040F2F7    pop         ecx
 0040F2F8    mov         dword ptr fs:[eax],edx
 0040F2FB    push        40F311
 0040F300    mov         eax,dword ptr [ebp-0C]
 0040F303    push        eax
 0040F304    call        KERNEL32.SetErrorMode
 0040F309    ret
>0040F30A    jmp         @HandleFinally
>0040F30F    jmp         0040F300
 0040F311    mov         eax,dword ptr [ebp-8]
 0040F314    pop         ebx
 0040F315    mov         esp,ebp
 0040F317    pop         ebp
 0040F318    ret
*}
end;

//0040F31C
procedure _NF__C58;
begin
{*
 0040F31C    sbb         eax,90000000
 0040F321    ret
*}
end;

//0040F408
procedure _NF__C59;
begin
{*
 0040F408    sub         byte ptr [eax],al
 0040F40A    add         byte ptr [eax],al
 0040F40C    test        al,0C2
 0040F40E    pop         edx
 0040F40F    add         al,ch
 0040F411    out         5A,al
 0040F413    add         byte ptr [eax],al
 0040F415    add         byte ptr [eax],al
 0040F417    add         byte ptr [edx+eax*8-1EAFFFA6],ah
 0040F41E    pop         edx
 0040F41F    add         byte ptr [eax],al
 0040F421    add         byte ptr [eax],al
 0040F423    add         byte ptr [eax-2BFFA53E],ah
 0040F429    in          eax,5A
 0040F42B    add         byte ptr [eax],al
 0040F42D    add         byte ptr [eax],al
 0040F42F    add         byte ptr [edx+eax*8-1F07FFA6],bl
 0040F436    pop         edx
 0040F437    add         byte ptr [eax],al
 0040F439    add         byte ptr [eax],al
 0040F43B    add         byte ptr [eax+38005AC2],bl
 0040F441    loop        0040F49D
 0040F443    add         byte ptr [eax],al
 0040F445    add         byte ptr [eax],al
 0040F447    add         byte ptr [edx+eax*8-1DCFFFA6],dl
 0040F44E    pop         edx
 0040F44F    add         byte ptr [eax],al
 0040F451    add         byte ptr [eax],al
 0040F453    add         byte ptr [eax+74005AC2],dl
 0040F459    loope       0040F4B5
 0040F45B    add         byte ptr [eax],al
 0040F45D    add         byte ptr [eax],al
 0040F45F    add         byte ptr [edx+eax*8-1C6FFFA6],cl
 0040F466    pop         edx
 0040F467    add         byte ptr [eax],al
 0040F469    add         byte ptr [eax],al
 0040F46B    add         byte ptr [eax+2C005AC2],cl
 0040F471    in          eax,5A
 0040F473    add         byte ptr [eax],al
 0040F475    add         byte ptr [eax],al
 0040F477    add         byte ptr [edx+eax*8-1DCBFFA6],al
 0040F47E    pop         edx
 0040F47F    add         byte ptr [eax],al
 0040F481    add         byte ptr [eax],al
 0040F483    add         byte ptr [eax-1FFFA53E],al
 0040F489    in          al,5A
 0040F48B    add         byte ptr [eax],al
 0040F48D    add         byte ptr [eax],al
 0040F48F    add         byte ptr [edx+eax*8+5A],bh
 0040F493    add         byte ptr [esi+5A],al
 0040F497    add         byte ptr [eax],al
 0040F499    add         byte ptr [eax],al
 0040F49B    add         byte ptr [eax-3E],bh
 0040F49E    pop         edx
 0040F49F    add         byte ptr [eax],ch
 0040F4A1    out         5A,al
 0040F4A3    add         byte ptr [eax],al
 0040F4A5    add         byte ptr [eax],al
 0040F4A7    add         byte ptr [edx+eax*8+5A],dh
 0040F4AB    add         byte ptr [ebp+5A],cl
 0040F4AF    add         byte ptr [eax],al
 0040F4B1    add         byte ptr [eax],al
 0040F4B3    add         byte ptr [eax-3E],dh
 0040F4B6    pop         edx
 0040F4B7    add         byte ptr [ebx+5A],ah
 0040F4BB    add         byte ptr [eax],al
 0040F4BD    add         byte ptr [eax],al
 0040F4BF    add         byte ptr [edx+eax*8+5A],ch
 0040F4C3    add         ah,ah
 0040F4C5    loop        0040F521
 0040F4C7    add         byte ptr [eax],al
 0040F4C9    add         byte ptr [eax],al
 0040F4CB    add         byte ptr [eax-3E],ch
 0040F4CE    pop         edx
 0040F4CF    add         ah,dh
 0040F4D1    loopne      0040F52D
 0040F4D3    add         byte ptr [eax],al
 0040F4D5    add         byte ptr [eax],al
 0040F4D7    add         byte ptr [edx+eax*8+5A],ah
 0040F4DB    add         byte ptr [esi],bl
 0040F4DE    pop         edx
 0040F4DF    add         byte ptr [eax],al
 0040F4E1    add         byte ptr [eax],al
 0040F4E3    add         byte ptr [eax-3E],ah
 0040F4E6    pop         edx
 0040F4E7    add         byte ptr [eax+5AE4],cl
 0040F4ED    add         byte ptr [eax],al
 0040F4EF    add         byte ptr [edx+eax*8+5A],bl
 0040F4F3    add         al,cl
 0040F4F5    loop        0040F551
 0040F4F7    add         byte ptr [eax],al
 0040F4F9    add         byte ptr [eax],al
 0040F4FB    add         byte ptr [eax-3E],bl
 0040F4FE    pop         edx
 0040F4FF    add         byte ptr [eax],ch
 0040F501    in          al,5A
 0040F503    add         byte ptr [eax],al
 0040F505    add         byte ptr [eax],al
 0040F507    add         byte ptr [edx+eax*8+5A],dl
 0040F50B    add         byte ptr [eax],cl
 0040F50D    in          eax,5A
 0040F50F    add         byte ptr [eax],al
 0040F511    add         byte ptr [eax],al
 0040F513    add         byte ptr [eax-3E],dl
 0040F516    pop         edx
 0040F517    add         byte ptr [eax-1C],cl
 0040F51A    pop         edx
 0040F51B    add         byte ptr [eax],al
 0040F51D    add         byte ptr [eax],al
 0040F51F    add         byte ptr [edx+eax*8+5A],cl
 0040F523    add         byte ptr [ebx],bl
 0040F526    pop         edx
 0040F527    add         byte ptr [eax],al
 0040F529    add         byte ptr [eax],al
 0040F52B    add         byte ptr [eax-3E],cl
 0040F52E    pop         edx
 0040F52F    add         al,dh
 0040F531    loopne      0040F58D
 0040F533    add         byte ptr [eax],al
 0040F535    add         byte ptr [eax],al
 0040F537    add         byte ptr [edx+eax*8+5A],al
 0040F53B    add         ah,al
 0040F53D    jecxz       0040F599
 0040F53F    add         byte ptr [eax],al
 0040F541    add         byte ptr [eax],al
 0040F543    add         byte ptr [eax-3E],al
 0040F546    pop         edx
 0040F547    add         byte ptr [edi],bh
 0040F54A    pop         edx
 0040F54B    add         byte ptr [eax],al
 0040F54D    add         byte ptr [eax],al
 0040F54F    add         byte ptr [edx+eax*8],bh
 0040F552    pop         edx
 0040F553    add         byte ptr [esi+5A],dh
 0040F55A    add         byte ptr [eax],al
 0040F55C    cmp         dl,al
 0040F55E    pop         edx
 0040F55F    add         ah,bl
 0040F561    in          al,5A
 0040F563    add         byte ptr [eax],al
 0040F565    add         byte ptr [eax],al
 0040F567    add         byte ptr [edx+eax*8],dh
 0040F56A    pop         edx
 0040F56B    add         byte ptr [edx+5A],al
 0040F572    add         byte ptr [eax],al
 0040F574    xor         dl,al
 0040F576    pop         edx
 0040F577    add         byte ptr [ecx],cl
 0040F57A    pop         edx
 0040F57B    add         byte ptr [eax],al
 0040F57D    add         byte ptr [eax],al
 0040F57F    add         byte ptr [edx+eax*8],ch
 0040F582    pop         edx
 0040F583    add         byte ptr [eax+5AE6],ah
 0040F589    add         byte ptr [eax],al
 0040F58B    add         byte ptr [eax],ch
 0040F58D    ret         5A
*}
end;

Initialization
//0040F76C
{*
 0040F76C    push        ebp
 0040F76D    mov         ebp,esp
 0040F76F    xor         eax,eax
 0040F771    push        ebp
 0040F772    push        40F7D4
 0040F777    push        dword ptr fs:[eax]
 0040F77A    mov         dword ptr fs:[eax],esp
 0040F77D    sub         dword ptr ds:[5E0860],1
>0040F784    jae         0040F7C6
 0040F786    mov         eax,40F31C;_NF__C58
 0040F78B    call        @InitResStringImports
 0040F790    mov         eax,40F408;_NF__C59
 0040F795    call        @InitImports
 0040F79A    cmp         byte ptr ds:[5AF661],0;gvar_005AF661
>0040F7A1    je          0040F7B2
 0040F7A3    mov         eax,5AC1B8
 0040F7A8    mov         edx,40F7E8;'0x'
 0040F7AD    call        @LStrAsg
 0040F7B2    call        InitExceptions
 0040F7B7    call        InitPlatformId
 0040F7BC    call        InitDriveSpacePtr
 0040F7C1    call        GetFormatSettings
 0040F7C6    xor         eax,eax
 0040F7C8    pop         edx
 0040F7C9    pop         ecx
 0040F7CA    pop         ecx
 0040F7CB    mov         dword ptr fs:[eax],edx
 0040F7CE    push        40F7DB
 0040F7D3    ret
>0040F7D4    jmp         @HandleFinally
>0040F7D9    jmp         0040F7D3
 0040F7DB    pop         ebp
 0040F7DC    ret
*}
Finalization
//0040F5EC
{*
 0040F5EC    push        ebp
 0040F5ED    mov         ebp,esp
 0040F5EF    xor         eax,eax
 0040F5F1    push        ebp
 0040F5F2    push        40F761
 0040F5F7    push        dword ptr fs:[eax]
 0040F5FA    mov         dword ptr fs:[eax],esp
 0040F5FD    inc         dword ptr ds:[5E0860]
>0040F603    jne         0040F753
 0040F609    mov         eax,5E086C;gvar_005E086C:void 
 0040F60E    call        FreeAndNil
 0040F613    call        FreeTerminateProcs
 0040F618    call        DoneExceptions
 0040F61D    mov         eax,5AC2E4;gvar_005AC2E4:array[22] of ?
 0040F622    mov         ecx,16
 0040F627    mov         edx,dword ptr ds:[40D8F8];TExceptRec
 0040F62D    call        @FinalizeArray
 0040F632    mov         eax,5AC2AC;gvar_005AC2AC:array[7] of ?
 0040F637    mov         ecx,7
 0040F63C    mov         edx,dword ptr ds:[40D878];TErrorRec
 0040F642    call        @FinalizeArray
 0040F647    mov         eax,5AC1C4;gvar_005AC1C4:array[2] of ?
 0040F64C    mov         ecx,2
 0040F651    mov         edx,dword ptr ds:[4010B4];String
 0040F657    call        @FinalizeArray
 0040F65C    mov         eax,5AC1B8
 0040F661    call        @LStrClr
 0040F666    mov         eax,5E085C;FalseBoolStrs:_DT_84
 0040F66B    mov         edx,dword ptr ds:[409678];.84
 0040F671    call        @DynArrayClear
 0040F676    mov         eax,5E0858;TrueBoolStrs:_DT_74
 0040F67B    mov         edx,dword ptr ds:[409654];.74
 0040F681    call        @DynArrayClear
 0040F686    mov         eax,5E0820;EraNames:_DT_64
 0040F68B    mov         ecx,7
 0040F690    mov         edx,dword ptr ds:[4010B4];String
 0040F696    call        @FinalizeArray
 0040F69B    mov         eax,5E07F4;LongDayNames:_DT_14
 0040F6A0    mov         ecx,7
 0040F6A5    mov         edx,dword ptr ds:[4010B4];String
 0040F6AB    call        @FinalizeArray
 0040F6B0    mov         eax,5E07D8;ShortDayNames:_DT_04
 0040F6B5    mov         ecx,7
 0040F6BA    mov         edx,dword ptr ds:[4010B4];String
 0040F6C0    call        @FinalizeArray
 0040F6C5    mov         eax,5E07A8;LongMonthNames:_DT_93
 0040F6CA    mov         ecx,0C
 0040F6CF    mov         edx,dword ptr ds:[4010B4];String
 0040F6D5    call        @FinalizeArray
 0040F6DA    mov         eax,5E0778;ShortMonthNames:_DT_83
 0040F6DF    mov         ecx,0C
 0040F6E4    mov         edx,dword ptr ds:[4010B4];String
 0040F6EA    call        @FinalizeArray
 0040F6EF    mov         eax,5E0774;LongTimeFormat:AnsiString
 0040F6F4    call        @LStrClr
 0040F6F9    mov         eax,5E0770;ShortTimeFormat:AnsiString
 0040F6FE    call        @LStrClr
 0040F703    mov         eax,5E076C;TimePMString:AnsiString
 0040F708    call        @LStrClr
 0040F70D    mov         eax,5E0768;TimeAMString:AnsiString
 0040F712    call        @LStrClr
 0040F717    mov         eax,5E0760;LongDateFormat:AnsiString
 0040F71C    call        @LStrClr
 0040F721    mov         eax,5E075C;ShortDateFormat:AnsiString
 0040F726    call        @LStrClr
 0040F72B    mov         eax,5E0750;CurrencyString:AnsiString
 0040F730    call        @LStrClr
 0040F735    mov         eax,5AC160
 0040F73A    call        @LStrClr
 0040F73F    mov         eax,5AC14C
 0040F744    call        @WStrClr
 0040F749    mov         eax,5AC148
 0040F74E    call        @LStrClr
 0040F753    xor         eax,eax
 0040F755    pop         edx
 0040F756    pop         ecx
 0040F757    pop         ecx
 0040F758    mov         dword ptr fs:[eax],edx
 0040F75B    push        40F768
 0040F760    ret
>0040F761    jmp         @HandleFinally
>0040F766    jmp         0040F760
 0040F768    pop         ebp
 0040F769    ret
*}
end.