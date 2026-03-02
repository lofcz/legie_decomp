//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit variants;

interface

uses
  SysUtils, Classes;

type
  TCustomVariantType = class(TObject)
  public
    FVarType:TVarType;//f4
    destructor Destroy; virtual;//0041629C
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v0//004163A0
    function LeftPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean; virtual;//v4//0041632C
    function RightPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean; virtual;//v8//00416360
    function OlePromotion(const V:TVarData; var RequiredVarType:TVarType):Boolean; virtual;//vC//00416340
    procedure DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer); virtual;//v10//0041637C
    //function v14:?; virtual;//v14//00416328
    procedure Cast(var Dest:TVarData; const Source:TVarData); virtual;//v18//0041619C
    procedure CastTo(var Dest:TVarData; const Source:TVarData; const AVarType:TVarType); virtual;//v1C//004161D4
    procedure CastToOle(var Dest:TVarData; const Source:TVarData); virtual;//v20//00416260
    procedure v24; virtual; abstract;//v24//00402BEC
    procedure v28; virtual; abstract;//v28//00402BEC
    procedure BinaryOp(var Left:TVarData; const Right:TVarData; const Operator:TVarOp); virtual;//v2C//00416190
    procedure v30; virtual;//v30//00416374
    function CompareOp(const Left:TVarData; const Right:TVarData; const Operator:TVarOp):Boolean; virtual;//v34//00416228
    procedure Compare(const Left:TVarData; const Right:TVarData; var Relationship:TVarCompareResult); virtual;//v38//0041621C
    function _AddRef:Integer; stdcall;//00416388
    function _Release:Integer; stdcall;//00416394
  end;
  EVariantInvalidOpError = class(EVariantError)
  end;
  EVariantTypeCastError = class(EVariantError)
  end;
  EVariantOverflowError = class(EVariantError)
  end;
  EVariantInvalidArgError = class(EVariantError)
  end;
  EVariantBadVarTypeError = class(EVariantError)
  end;
  EVariantBadIndexError = class(EVariantError)
  end;
  EVariantArrayLockedError = class(EVariantError)
  end;
  EVariantArrayCreateError = class(EVariantError)
  end;
  EVariantNotImplError = class(EVariantError)
  end;
  EVariantOutOfMemoryError = class(EVariantError)
  end;
  EVariantUnexpectedError = class(EVariantError)
  end;
  EVariantDispatchError = class(EVariantError)
  end;
  EVariantInvalidNullOpError = class(EVariantInvalidOpError)
  end;
  .02 = array of ?;
//elSize = 4;
    procedure VarCastError;//00410628
    procedure VarCastError(const ASourceType:TVarType; const ADestType:TVarType);//0041067C
    procedure VarInvalidOp;//00410718
    procedure VarInvalidNullOp;//0041076C
    procedure VarOverflowError(const ASourceType:TVarType; const ADestType:TVarType);//004107C0
    procedure VarArrayCreateError;//0041085C
    procedure TranslateResult(AResult:HRESULT);//004108B0
    procedure VarResultCheck(AResult:HRESULT);//00410B04
    procedure VarResultCheck(AResult:HRESULT; ASourceType:TVarType; ADestType:TVarType);//00410B10
    procedure HandleConversionException(const ASourceType:TVarType; const ADestType:TVarType);//00410B44
    procedure sub_00410BC8;//00410BC8
    procedure @VarNull(var V:TVarData);//00410C1C
    function InBounds(At:Integer):Boolean;//00410C30
    function Increment(At:Integer):Boolean;//00410C60
    procedure VarArrayClear(var V:TVarData);//00410CBC
    procedure VarClearDeep(var V:TVarData);//00410E38
    procedure @VarClear(var V:TVarData);//00410EB4
    procedure @VarClr(var V:TVarData);//00410EC8
    function InBounds(At:Integer):Boolean;//00410ED0
    function Increment(At:Integer):Boolean;//00410F00
    procedure VarArrayCopyForEach(var Dest:TVarData; const Src:TVarData; AProc:TVarArrayForEach);//00410F5C
    procedure VarCopyCopyProc(var Dest:TVarData; const Src:TVarData);//00411128
    procedure VarCopyDeep(var Dest:TVarData; const Source:TVarData);//00411130
    procedure @VarCopy(var Dest:TVarData; const Source:TVarData);//004111DC
    procedure VarCastAsAny(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);//00411220
    procedure VarCastAsOleStr(var Dest:TVarData; const Source:TVarData);//0041128C
    procedure VarCastAsString(var Dest:TVarData; const Source:TVarData);//004112D8
    procedure VarCastAsDispatch(var Dest:TVarData; const Source:TVarData);//00411324
    procedure VarCastAsInterface(var Dest:TVarData; const Source:TVarData);//00411370
    procedure VarCastViaOS(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);//004113BC
    procedure VarCastRare(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);//0041143C
    procedure @VarCast(var Dest:TVarData; const Source:TVarData; AVarType:Integer);//004114A8
    function VarToIntAsString(const V:TVarData):Integer;//004116D4
    function VarToIntViaOS(const V:TVarData):Integer;//00411788
    function VarToIntAny(const V:TVarData):Integer;//004117C4
    function VarToIntCustom(const V:TVarData; var AValue:Integer):Boolean;//00411828
    function @VarToInteger(const V:TVarData):Integer;//0041186C
    function @VarToShortInt(const V:TVarData):Shortint;//00411CBC
    function @VarToByte(const V:TVarData):Byte;//00411D6C
    function @VarToSmallInt(const V:TVarData):Smallint;//00411E14
    function @VarToWord(const V:TVarData):Word;//00411F0C
    function @VarToLongWord(const V:TVarData):LongWord;//00411FE4
    function VarToInt64ViaOS(const V:TVarData):Int64;//004120CC
    function VarToInt64AsString(const V:TVarData):Int64;//00412178
    function VarToInt64Any(const V:TVarData):Int64;//00412278
    function VarToInt64Custom(const V:TVarData; var AValue:Int64):Boolean;//004122E4
    function @VarToInt64(const V:TVarData):Int64;//00412330
    function VarToBoolAsString(const V:TVarData):Boolean;//00412774
    function VarToBoolViaOS(const V:TVarData):Boolean;//0041283C
    function VarToBoolAny(const V:TVarData):Boolean;//0041287C
    function VarToBoolCustom(const V:TVarData; var AValue:Boolean):Boolean;//004128E0
    function @VarToBoolean(const V:TVarData):Boolean;//0041292C
    function @VarToBool(const V:TVarData):LongBool;//00412C74
    function VarToDoubleAsString(const V:TVarData):Double;//00412C80
    function VarToDoubleViaOS(const V:TVarData):Double;//00412D44
    function VarToDoubleAny(const V:TVarData):Double;//00412D90
    function VarToDoubleCustom(const V:TVarData; var AValue:Double):Boolean;//00412DF4
    function @VarToDouble(const V:TVarData):Double;//00412E40
    function @VarToReal(const V:TVarData):Extended;//004131BC
    function @VarToSingle(const V:TVarData):Single;//004131D8
    function VarToDateAsString(const V:TVarData):TDateTime;//00413368
    function VarToDateAsDouble(const V:TVarData; const Value:Double):TDateTime;//00413454
    function VarToDateViaOS(const V:TVarData):TDateTime;//004134B4
    function VarToDateAny(const V:TVarData):TDateTime;//00413500
    function VarToDateCustom(const V:TVarData; var AValue:TDateTime):Boolean;//00413564
    function @VarToDate(const V:TVarData):TDateTime;//004135B0
    function VarToCurrencyAsString(const V:TVarData):Currency;//00413900
    function VarToCurrencyAsDouble(const V:TVarData; const Value:Double):Currency;//004139BC
    function VarToCurrencyViaOS(const V:TVarData):Currency;//00413A1C
    function VarToCurrencyAny(const V:TVarData):Currency;//00413A68
    function VarToCurrencyCustom(const V:TVarData; var AValue:Currency):Boolean;//00413ACC
    function @VarToCurrency(const V:TVarData):Currency;//00413B18
    function CurrToWStrViaOS(const AValue:Currency):WideString;//00413EE4
    function DateToWStrViaOS(const AValue:TDateTime):WideString;//00413F1C
    function BoolToWStrViaOS(const AValue:WordBool):WideString;//00413F54
    function VarToLStrViaOS(const V:TVarData):AnsiString;//00414018
    function VarToLStrAny(const V:TVarData):AnsiString;//004140E4
    function VarToLStrCustom(const V:TVarData; var AValue:AnsiString):Boolean;//00414148
    procedure @VarToLStr(var S:AnsiString; const V:TVarData);//004141CC
    function VarToWStrViaOS(const V:TVarData):WideString;//00414710
    function VarToWStrAny(const V:TVarData):WideString;//004147C8
    function VarToWStrCustom(const V:TVarData; var AValue:WideString):Boolean;//0041482C
    procedure @VarToWStr(var S:WideString; const V:TVarData);//004148F4
    procedure AnyToIntf(var Intf:IInterface; const V:TVarData);//00414E54
    procedure @VarToIntf(var Intf:IInterface; const V:TVarData);//00414ECC
    procedure @VarToDisp(var Dispatch:IDispatch; const V:TVarData);//00414F98
    procedure @VarFromInt(var V:TVarData; const Value:Integer; const Range:Shortint);//00415044
    procedure @VarFromInteger(var V:TVarData; const Value:Integer);//00415080
    procedure @VarFromByte(var V:TVarData; const Value:Byte);//004150A0
    procedure @VarFromWord(var V:TVarData; const Value:Word);//004150C0
    procedure @VarFromLongWord(var V:TVarData; const Value:LongWord);//004150E0
    procedure @VarFromShortInt(var V:TVarData; const Value:Shortint);//00415100
    procedure @VarFromSmallInt(var V:TVarData; const Value:Smallint);//00415120
    procedure @VarFromInt64(var V:TVarData; const Value:Int64);//00415140
    procedure @VarFromSingle(var Dest:TVarData; const Value:Single);//0041516C
    procedure @VarFromDouble(var Dest:TVarData; const Value:Double);//00415190
    procedure @VarFromCurrency(var Dest:TVarData; const Value:Currency);//004151BC
    procedure @VarFromDate(var Dest:TVarData; const Value:TDateTime);//004151E8
    procedure @VarFromBool(var V:TVarData; const Value:Boolean);//00415214
    procedure @VarFromReal(var v:Variant);//0041523C
    procedure @VarFromTDateTime(var v:Variant);//00415250
    procedure @VarFromCurr(var v:Variant);//00415264
    procedure @VarFromLStr(var V:TVarData; const Value:AnsiString);//00415278
    procedure @VarFromWStr(var V:TVarData; const Value:WideString);//004152A4
    procedure @VarFromIntf(var V:TVarData; const Value:IInterface);//004152DC
    procedure @VarFromDisp(var V:TVarData; const Value:IDispatch);//00415308
    function CheckType(T:TVarType):TVarType;//00415334
    function VarCompareAny(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//00415358
    function EmptyCompare(L:TBaseType; R:TBaseType):TVarCompareResult;//0041542C
    function NullCompare(L:TBaseType; R:TBaseType; OpCode:TVarOp):TVarCompareResult;//00415440
    function IntCompare(A:Integer; B:Integer):TVarCompareResult;//00415528
    function Int64Compare(const A:Int64; const B:Int64):TVarCompareResult;//0041553C
    function RealCompare(const A:Double; const B:Double):TVarCompareResult;//00415578
    function DateCompare(const A:TDateTime; const B:TDateTime):TVarCompareResult;//004155A0
    function CurrCompare(const A:Currency; const B:Currency):TVarCompareResult;//004155C8
    function StringCompare(const L:TVarData; const R:TVarData):TVarCompareResult;//004155F4
    function VarCompareSimple(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//00415660
    function VarCompareRare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//004157EC
    function VarCompare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;//00415C0C
    function VarTypeAsText(const AType:TVarType):AnsiString;//00415DF8
    function VarType(const V:Variant):TVarType;//00415F68
    function FindVarData(const V:Variant):PVarData;//00415F6C
    function VarIsClear(const V:Variant):Boolean;//00415F7C
    function VarSameValue(const A:Variant; const B:Variant):Boolean;//00415FF0
    procedure SetVarAsError(var V:TVarData; AResult:HRESULT);//00416068
    procedure SetClearVarToEmptyParam(var V:TVarData);//00416080
    function GetVarDataArrayInfo(const AVarData:TVarData; var AVarType:TVarType; var AVarArray:PVarArray):Boolean;//0041608C
    function VarIsArray(const A:Variant):Boolean;//004160D0
    function VarIsArray(const A:Variant; AResolveByRef:Boolean):Boolean;//004160D8
    procedure ClearVariantTypeList;//00416124
    procedure BinaryOp(var Left:TVarData; const Right:TVarData; const Operator:TVarOp);//00416190
    procedure Cast(var Dest:TVarData; const Source:TVarData);//0041619C
    procedure CastTo(var Dest:TVarData; const Source:TVarData; const AVarType:TVarType);//004161D4
    procedure Compare(const Left:TVarData; const Right:TVarData; var Relationship:TVarCompareResult);//0041621C
    function CompareOp(const Left:TVarData; const Right:TVarData; const Operator:TVarOp):Boolean;//00416228
    procedure CastToOle(var Dest:TVarData; const Source:TVarData);//00416260
    destructor Destroy;//0041629C
    //function sub_00416328:?;//00416328
    function LeftPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;//0041632C
    function OlePromotion(const V:TVarData; var RequiredVarType:TVarType):Boolean;//00416340
    procedure sub_00416348;//00416348
    procedure sub_00416350;//00416350
    procedure sub_00416358;//00416358
    function RightPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;//00416360
    procedure sub_00416374;//00416374
    procedure DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer);//0041637C
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//004163A0
    function FindCustomVariantType(const AVarType:TVarType; var CustomVariantType:TCustomVariantType):Boolean;//004163C8
    function FindCustomVariantType(const TypeName:AnsiString; var CustomVariantType:TCustomVariantType):Boolean;//00416480
    function Null:Variant;//00416568
    procedure @VarCmpEQ(const Left:TVarData; const Right:TVarData);//00416570

implementation

//00410628
procedure VarCastError;
begin
{*
 00410628    push        ebp
 00410629    mov         ebp,esp
 0041062B    push        0
 0041062D    xor         eax,eax
 0041062F    push        ebp
 00410630    push        410672
 00410635    push        dword ptr fs:[eax]
 00410638    mov         dword ptr fs:[eax],esp
 0041063B    lea         edx,[ebp-4]
 0041063E    mov         eax,[005AE4C4];^SInvalidVarCast:TResStringRec
 00410643    call        LoadStr
 00410648    mov         ecx,dword ptr [ebp-4]
 0041064B    mov         dl,1
 0041064D    mov         eax,[00410168];EVariantTypeCastError
 00410652    call        Exception.Create
 00410657    call        @RaiseExcept
 0041065C    xor         eax,eax
 0041065E    pop         edx
 0041065F    pop         ecx
 00410660    pop         ecx
 00410661    mov         dword ptr fs:[eax],edx
 00410664    push        410679
 00410669    lea         eax,[ebp-4]
 0041066C    call        @LStrClr
 00410671    ret
>00410672    jmp         @HandleFinally
>00410677    jmp         00410669
 00410679    pop         ecx
 0041067A    pop         ebp
 0041067B    ret
*}
end;

//0041067C
procedure VarCastError(const ASourceType:TVarType; const ADestType:TVarType);
begin
{*
 0041067C    push        ebp
 0041067D    mov         ebp,esp
 0041067F    add         esp,0FFFFFFE4
 00410682    push        ebx
 00410683    push        esi
 00410684    xor         ecx,ecx
 00410686    mov         dword ptr [ebp-14],ecx
 00410689    mov         dword ptr [ebp-18],ecx
 0041068C    mov         dword ptr [ebp-1C],ecx
 0041068F    mov         esi,edx
 00410691    mov         ebx,eax
 00410693    xor         eax,eax
 00410695    push        ebp
 00410696    push        41070B
 0041069B    push        dword ptr fs:[eax]
 0041069E    mov         dword ptr fs:[eax],esp
 004106A1    lea         edx,[ebp-14]
 004106A4    mov         eax,ebx
 004106A6    call        VarTypeAsText
 004106AB    mov         eax,dword ptr [ebp-14]
 004106AE    mov         dword ptr [ebp-10],eax
 004106B1    mov         byte ptr [ebp-0C],0B
 004106B5    lea         edx,[ebp-18]
 004106B8    mov         eax,esi
 004106BA    call        VarTypeAsText
 004106BF    mov         eax,dword ptr [ebp-18]
 004106C2    mov         dword ptr [ebp-8],eax
 004106C5    mov         byte ptr [ebp-4],0B
 004106C9    lea         eax,[ebp-10]
 004106CC    push        eax
 004106CD    push        1
 004106CF    lea         edx,[ebp-1C]
 004106D2    mov         eax,[005AE0E8];^SVarTypeCouldNotConvert:TResStringRec
 004106D7    call        LoadStr
 004106DC    mov         ecx,dword ptr [ebp-1C]
 004106DF    mov         dl,1
 004106E1    mov         eax,[00410168];EVariantTypeCastError
 004106E6    call        Exception.CreateFmt
 004106EB    call        @RaiseExcept
 004106F0    xor         eax,eax
 004106F2    pop         edx
 004106F3    pop         ecx
 004106F4    pop         ecx
 004106F5    mov         dword ptr fs:[eax],edx
 004106F8    push        410712
 004106FD    lea         eax,[ebp-1C]
 00410700    mov         edx,3
 00410705    call        @LStrArrayClr
 0041070A    ret
>0041070B    jmp         @HandleFinally
>00410710    jmp         004106FD
 00410712    pop         esi
 00410713    pop         ebx
 00410714    mov         esp,ebp
 00410716    pop         ebp
 00410717    ret
*}
end;

//00410718
procedure VarInvalidOp;
begin
{*
 00410718    push        ebp
 00410719    mov         ebp,esp
 0041071B    push        0
 0041071D    xor         eax,eax
 0041071F    push        ebp
 00410720    push        410762
 00410725    push        dword ptr fs:[eax]
 00410728    mov         dword ptr fs:[eax],esp
 0041072B    lea         edx,[ebp-4]
 0041072E    mov         eax,[005AE42C];^SInvalidVarOp:TResStringRec
 00410733    call        LoadStr
 00410738    mov         ecx,dword ptr [ebp-4]
 0041073B    mov         dl,1
 0041073D    mov         eax,[00410104];EVariantInvalidOpError
 00410742    call        Exception.Create
 00410747    call        @RaiseExcept
 0041074C    xor         eax,eax
 0041074E    pop         edx
 0041074F    pop         ecx
 00410750    pop         ecx
 00410751    mov         dword ptr fs:[eax],edx
 00410754    push        410769
 00410759    lea         eax,[ebp-4]
 0041075C    call        @LStrClr
 00410761    ret
>00410762    jmp         @HandleFinally
>00410767    jmp         00410759
 00410769    pop         ecx
 0041076A    pop         ebp
 0041076B    ret
*}
end;

//0041076C
procedure VarInvalidNullOp;
begin
{*
 0041076C    push        ebp
 0041076D    mov         ebp,esp
 0041076F    push        0
 00410771    xor         eax,eax
 00410773    push        ebp
 00410774    push        4107B6
 00410779    push        dword ptr fs:[eax]
 0041077C    mov         dword ptr fs:[eax],esp
 0041077F    lea         edx,[ebp-4]
 00410782    mov         eax,[005AE4D4];^SInvalidVarNullOp:TResStringRec
 00410787    call        LoadStr
 0041078C    mov         ecx,dword ptr [ebp-4]
 0041078F    mov         dl,1
 00410791    mov         eax,[004105C0];EVariantInvalidNullOpError
 00410796    call        Exception.Create
 0041079B    call        @RaiseExcept
 004107A0    xor         eax,eax
 004107A2    pop         edx
 004107A3    pop         ecx
 004107A4    pop         ecx
 004107A5    mov         dword ptr fs:[eax],edx
 004107A8    push        4107BD
 004107AD    lea         eax,[ebp-4]
 004107B0    call        @LStrClr
 004107B5    ret
>004107B6    jmp         @HandleFinally
>004107BB    jmp         004107AD
 004107BD    pop         ecx
 004107BE    pop         ebp
 004107BF    ret
*}
end;

//004107C0
procedure VarOverflowError(const ASourceType:TVarType; const ADestType:TVarType);
begin
{*
 004107C0    push        ebp
 004107C1    mov         ebp,esp
 004107C3    add         esp,0FFFFFFE4
 004107C6    push        ebx
 004107C7    push        esi
 004107C8    xor         ecx,ecx
 004107CA    mov         dword ptr [ebp-14],ecx
 004107CD    mov         dword ptr [ebp-18],ecx
 004107D0    mov         dword ptr [ebp-1C],ecx
 004107D3    mov         esi,edx
 004107D5    mov         ebx,eax
 004107D7    xor         eax,eax
 004107D9    push        ebp
 004107DA    push        41084F
 004107DF    push        dword ptr fs:[eax]
 004107E2    mov         dword ptr fs:[eax],esp
 004107E5    lea         edx,[ebp-14]
 004107E8    mov         eax,ebx
 004107EA    call        VarTypeAsText
 004107EF    mov         eax,dword ptr [ebp-14]
 004107F2    mov         dword ptr [ebp-10],eax
 004107F5    mov         byte ptr [ebp-0C],0B
 004107F9    lea         edx,[ebp-18]
 004107FC    mov         eax,esi
 004107FE    call        VarTypeAsText
 00410803    mov         eax,dword ptr [ebp-18]
 00410806    mov         dword ptr [ebp-8],eax
 00410809    mov         byte ptr [ebp-4],0B
 0041080D    lea         eax,[ebp-10]
 00410810    push        eax
 00410811    push        1
 00410813    lea         edx,[ebp-1C]
 00410816    mov         eax,[005AE574];^SVarTypeConvertOverflow:TResStringRec
 0041081B    call        LoadStr
 00410820    mov         ecx,dword ptr [ebp-1C]
 00410823    mov         dl,1
 00410825    mov         eax,[004101CC];EVariantOverflowError
 0041082A    call        Exception.CreateFmt
 0041082F    call        @RaiseExcept
 00410834    xor         eax,eax
 00410836    pop         edx
 00410837    pop         ecx
 00410838    pop         ecx
 00410839    mov         dword ptr fs:[eax],edx
 0041083C    push        410856
 00410841    lea         eax,[ebp-1C]
 00410844    mov         edx,3
 00410849    call        @LStrArrayClr
 0041084E    ret
>0041084F    jmp         @HandleFinally
>00410854    jmp         00410841
 00410856    pop         esi
 00410857    pop         ebx
 00410858    mov         esp,ebp
 0041085A    pop         ebp
 0041085B    ret
*}
end;

//0041085C
procedure VarArrayCreateError;
begin
{*
 0041085C    push        ebp
 0041085D    mov         ebp,esp
 0041085F    push        0
 00410861    xor         eax,eax
 00410863    push        ebp
 00410864    push        4108A6
 00410869    push        dword ptr fs:[eax]
 0041086C    mov         dword ptr fs:[eax],esp
 0041086F    lea         edx,[ebp-4]
 00410872    mov         eax,[005AE3B4];^SVarArrayCreate:TResStringRec
 00410877    call        LoadStr
 0041087C    mov         ecx,dword ptr [ebp-4]
 0041087F    mov         dl,1
 00410881    mov         eax,[004103C4];EVariantArrayCreateError
 00410886    call        Exception.Create
 0041088B    call        @RaiseExcept
 00410890    xor         eax,eax
 00410892    pop         edx
 00410893    pop         ecx
 00410894    pop         ecx
 00410895    mov         dword ptr fs:[eax],edx
 00410898    push        4108AD
 0041089D    lea         eax,[ebp-4]
 004108A0    call        @LStrClr
 004108A5    ret
>004108A6    jmp         @HandleFinally
>004108AB    jmp         0041089D
 004108AD    pop         ecx
 004108AE    pop         ebp
 004108AF    ret
*}
end;

//004108B0
procedure TranslateResult(AResult:HRESULT);
begin
{*
 004108B0    push        ebp
 004108B1    mov         ebp,esp
 004108B3    mov         ecx,8
 004108B8    push        0
 004108BA    push        0
 004108BC    dec         ecx
>004108BD    jne         004108B8
 004108BF    push        ebx
 004108C0    mov         ebx,eax
 004108C2    xor         eax,eax
 004108C4    push        ebp
 004108C5    push        410AF5
 004108CA    push        dword ptr fs:[eax]
 004108CD    mov         dword ptr fs:[eax],esp
 004108D0    mov         eax,ebx
 004108D2    cmp         eax,8002000A
>004108D7    jg          00410912
>004108D9    je          00410979
 004108DF    cmp         eax,80020005
>004108E4    jg          00410903
>004108E6    je          0041093F
 004108E8    sub         eax,80004001
>004108ED    je          004109EB
 004108F3    sub         eax,0BFFE
>004108F8    je          00410A5A
>004108FE    jmp         00410A7D
 00410903    sub         eax,80020008
>00410908    je          00410949
 0041090A    dec         eax
>0041090B    je          0041096F
>0041090D    jmp         00410A7D
 00410912    sub         eax,8002000B
>00410917    je          0041099F
 0041091D    sub         eax,2
>00410920    je          004109C5
 00410926    sub         eax,50001
>0041092B    je          00410A11
 00410931    sub         eax,49
>00410934    je          00410A37
>0041093A    jmp         00410A7D
 0041093F    call        VarCastError
>00410944    jmp         00410ACD
 00410949    lea         edx,[ebp-4]
 0041094C    mov         eax,[005AE72C];^SVarBadType:TResStringRec
 00410951    call        LoadStr
 00410956    mov         ecx,dword ptr [ebp-4]
 00410959    mov         dl,1
 0041095B    mov         eax,[00410294];EVariantBadVarTypeError
 00410960    call        Exception.Create
 00410965    call        @RaiseExcept
>0041096A    jmp         00410ACD
 0041096F    call        VarInvalidOp
>00410974    jmp         00410ACD
 00410979    lea         edx,[ebp-8]
 0041097C    mov         eax,[005AE1C4];^SVarOverflow:TResStringRec
 00410981    call        LoadStr
 00410986    mov         ecx,dword ptr [ebp-8]
 00410989    mov         dl,1
 0041098B    mov         eax,[004101CC];EVariantOverflowError
 00410990    call        Exception.Create
 00410995    call        @RaiseExcept
>0041099A    jmp         00410ACD
 0041099F    lea         edx,[ebp-0C]
 004109A2    mov         eax,[005AE648];^SVarArrayBounds:TResStringRec
 004109A7    call        LoadStr
 004109AC    mov         ecx,dword ptr [ebp-0C]
 004109AF    mov         dl,1
 004109B1    mov         eax,[004102F8];EVariantBadIndexError
 004109B6    call        Exception.Create
 004109BB    call        @RaiseExcept
>004109C0    jmp         00410ACD
 004109C5    lea         edx,[ebp-10]
 004109C8    mov         eax,[005AE7E4];^SVarArrayLocked:TResStringRec
 004109CD    call        LoadStr
 004109D2    mov         ecx,dword ptr [ebp-10]
 004109D5    mov         dl,1
 004109D7    mov         eax,[0041035C];EVariantArrayLockedError
 004109DC    call        Exception.Create
 004109E1    call        @RaiseExcept
>004109E6    jmp         00410ACD
 004109EB    lea         edx,[ebp-14]
 004109EE    mov         eax,[005AE504];^SVarNotImplemented:TResStringRec
 004109F3    call        LoadStr
 004109F8    mov         ecx,dword ptr [ebp-14]
 004109FB    mov         dl,1
 004109FD    mov         eax,[0041042C];EVariantNotImplError
 00410A02    call        Exception.Create
 00410A07    call        @RaiseExcept
>00410A0C    jmp         00410ACD
 00410A11    lea         edx,[ebp-18]
 00410A14    mov         eax,[005AE27C];^SOutOfMemory:TResStringRec
 00410A19    call        LoadStr
 00410A1E    mov         ecx,dword ptr [ebp-18]
 00410A21    mov         dl,1
 00410A23    mov         eax,[00410490];EVariantOutOfMemoryError
 00410A28    call        Exception.Create
 00410A2D    call        @RaiseExcept
>00410A32    jmp         00410ACD
 00410A37    lea         edx,[ebp-1C]
 00410A3A    mov         eax,[005AE2A4];^SVarInvalid:TResStringRec
 00410A3F    call        LoadStr
 00410A44    mov         ecx,dword ptr [ebp-1C]
 00410A47    mov         dl,1
 00410A49    mov         eax,[00410230];EVariantInvalidArgError
 00410A4E    call        Exception.Create
 00410A53    call        @RaiseExcept
>00410A58    jmp         00410ACD
 00410A5A    lea         edx,[ebp-20]
 00410A5D    mov         eax,[005AE1C0];^SVarUnexpected:TResStringRec
 00410A62    call        LoadStr
 00410A67    mov         ecx,dword ptr [ebp-20]
 00410A6A    mov         dl,1
 00410A6C    mov         eax,[004104F8];EVariantUnexpectedError
 00410A71    call        Exception.Create
 00410A76    call        @RaiseExcept
>00410A7B    jmp         00410ACD
 00410A7D    mov         eax,[005AE748]
 00410A82    mov         eax,dword ptr [eax]
 00410A84    mov         dword ptr [ebp-38],eax
 00410A87    mov         byte ptr [ebp-34],0B
 00410A8B    mov         dword ptr [ebp-30],ebx
 00410A8E    mov         byte ptr [ebp-2C],0
 00410A92    lea         edx,[ebp-3C]
 00410A95    mov         eax,ebx
 00410A97    call        SysErrorMessage
 00410A9C    mov         eax,dword ptr [ebp-3C]
 00410A9F    mov         dword ptr [ebp-28],eax
 00410AA2    mov         byte ptr [ebp-24],0B
 00410AA6    lea         eax,[ebp-38]
 00410AA9    push        eax
 00410AAA    push        2
 00410AAC    lea         edx,[ebp-40]
 00410AAF    mov         eax,[005AE3BC];^SResString1:TResStringRec
 00410AB4    call        LoadStr
 00410AB9    mov         ecx,dword ptr [ebp-40]
 00410ABC    mov         dl,1
 00410ABE    mov         eax,[00409350];EVariantError
 00410AC3    call        Exception.CreateFmt
 00410AC8    call        @RaiseExcept
 00410ACD    xor         eax,eax
 00410ACF    pop         edx
 00410AD0    pop         ecx
 00410AD1    pop         ecx
 00410AD2    mov         dword ptr fs:[eax],edx
 00410AD5    push        410AFC
 00410ADA    lea         eax,[ebp-40]
 00410ADD    mov         edx,2
 00410AE2    call        @LStrArrayClr
 00410AE7    lea         eax,[ebp-20]
 00410AEA    mov         edx,8
 00410AEF    call        @LStrArrayClr
 00410AF4    ret
>00410AF5    jmp         @HandleFinally
>00410AFA    jmp         00410ADA
 00410AFC    pop         ebx
 00410AFD    mov         esp,ebp
 00410AFF    pop         ebp
 00410B00    ret
*}
end;

//00410B04
procedure VarResultCheck(AResult:HRESULT);
begin
{*
 00410B04    test        eax,eax
>00410B06    je          00410B0D
 00410B08    call        TranslateResult
 00410B0D    ret
*}
end;

//00410B10
procedure VarResultCheck(AResult:HRESULT; ASourceType:TVarType; ADestType:TVarType);
begin
{*
 00410B10    push        ebx
 00410B11    test        eax,eax
>00410B13    je          00410B41
 00410B15    mov         ebx,eax
 00410B17    sub         ebx,80020005
>00410B1D    je          00410B26
 00410B1F    sub         ebx,5
>00410B22    je          00410B31
>00410B24    jmp         00410B3C
 00410B26    mov         eax,edx
 00410B28    mov         edx,ecx
 00410B2A    call        VarCastError
>00410B2F    jmp         00410B41
 00410B31    mov         eax,edx
 00410B33    mov         edx,ecx
 00410B35    call        VarOverflowError
>00410B3A    jmp         00410B41
 00410B3C    call        TranslateResult
 00410B41    pop         ebx
 00410B42    ret
*}
end;

//00410B44
procedure HandleConversionException(const ASourceType:TVarType; const ADestType:TVarType);
begin
{*
 00410B44    push        ebx
 00410B45    push        esi
 00410B46    mov         esi,edx
 00410B48    mov         ebx,eax
 00410B4A    call        ExceptObject
 00410B4F    mov         edx,dword ptr ds:[408E64]
 00410B55    call        @IsClass
 00410B5A    test        al,al
>00410B5C    je          00410B6F
 00410B5E    mov         ecx,esi
 00410B60    mov         edx,ebx
 00410B62    mov         eax,8002000A
 00410B67    call        VarResultCheck
 00410B6C    pop         esi
 00410B6D    pop         ebx
 00410B6E    ret
 00410B6F    call        ExceptObject
 00410B74    mov         edx,dword ptr ds:[409020];EOverflow
 00410B7A    call        @IsClass
 00410B7F    test        al,al
>00410B81    je          00410B93
 00410B83    mov         ecx,esi
 00410B85    mov         edx,ebx
 00410B87    mov         eax,8002000A
 00410B8C    call        VarResultCheck
>00410B91    jmp         00410BC5
 00410B93    call        ExceptObject
 00410B98    mov         edx,dword ptr ds:[409188];EConvertError
 00410B9E    call        @IsClass
 00410BA3    test        al,al
>00410BA5    je          00410BB7
 00410BA7    mov         ecx,esi
 00410BA9    mov         edx,ebx
 00410BAB    mov         eax,80020005
 00410BB0    call        VarResultCheck
>00410BB5    jmp         00410BC5
 00410BB7    call        AcquireExceptionObject
 00410BBC    mov         edx,eax
 00410BBE    mov         eax,edx
 00410BC0    call        @RaiseExcept
 00410BC5    pop         esi
 00410BC6    pop         ebx
 00410BC7    ret
*}
end;

//00410BC8
procedure sub_00410BC8;
begin
{*
 00410BC8    push        ebp
 00410BC9    mov         ebp,esp
 00410BCB    push        0
 00410BCD    xor         eax,eax
 00410BCF    push        ebp
 00410BD0    push        410C12
 00410BD5    push        dword ptr fs:[eax]
 00410BD8    mov         dword ptr fs:[eax],esp
 00410BDB    lea         edx,[ebp-4]
 00410BDE    mov         eax,[005AE0DC];^SDispatchError:TResStringRec
 00410BE3    call        LoadStr
 00410BE8    mov         ecx,dword ptr [ebp-4]
 00410BEB    mov         dl,1
 00410BED    mov         eax,[0041055C];EVariantDispatchError
 00410BF2    call        Exception.Create;EVariantDispatchError.Create
 00410BF7    call        @RaiseExcept
 00410BFC    xor         eax,eax
 00410BFE    pop         edx
 00410BFF    pop         ecx
 00410C00    pop         ecx
 00410C01    mov         dword ptr fs:[eax],edx
 00410C04    push        410C19
 00410C09    lea         eax,[ebp-4]
 00410C0C    call        @LStrClr
 00410C11    ret
>00410C12    jmp         @HandleFinally
>00410C17    jmp         00410C09
 00410C19    pop         ecx
 00410C1A    pop         ebp
 00410C1B    ret
*}
end;

//00410C1C
procedure @VarNull(var V:TVarData);
begin
{*
 00410C1C    push        ebx
 00410C1D    mov         ebx,eax
 00410C1F    mov         eax,ebx
 00410C21    call        @VarClear
 00410C26    mov         word ptr [ebx],1
 00410C2B    pop         ebx
 00410C2C    ret
*}
end;

//00410C30
function InBounds(At:Integer):Boolean;
begin
{*
 00410C30    push        ebp
 00410C31    mov         ebp,esp
 00410C33    push        ebx
 00410C34    mov         ecx,dword ptr [ebp+8]
 00410C37    add         ecx,0FFFFFD00
 00410C3D    mov         edx,dword ptr [ecx+eax*8+4]
 00410C41    add         edx,dword ptr [ecx+eax*8]
 00410C44    mov         ebx,dword ptr [ebp+8]
 00410C47    cmp         edx,dword ptr [ebx+eax*4-100]
 00410C4E    setg        dl
 00410C51    dec         eax
 00410C52    test        dl,dl
>00410C54    je          00410C5A
 00410C56    test        eax,eax
>00410C58    jge         00410C3D
 00410C5A    mov         eax,edx
 00410C5C    pop         ebx
 00410C5D    pop         ebp
 00410C5E    ret
*}
end;

//00410C60
function Increment(At:Integer):Boolean;
begin
{*
 00410C60    push        ebp
 00410C61    mov         ebp,esp
 00410C63    push        ebx
 00410C64    push        esi
 00410C65    mov         dl,1
 00410C67    mov         ecx,dword ptr [ebp+8]
 00410C6A    inc         dword ptr [ecx+eax*4-100]
 00410C71    mov         ecx,dword ptr [ebp+8]
 00410C74    mov         ecx,dword ptr [ecx+eax*8-2FC]
 00410C7B    mov         ebx,ecx
 00410C7D    mov         esi,dword ptr [ebp+8]
 00410C80    add         ebx,dword ptr [esi+eax*8-300]
 00410C87    mov         esi,dword ptr [ebp+8]
 00410C8A    cmp         ebx,dword ptr [esi+eax*4-100]
>00410C91    jg          00410CB5
 00410C93    test        eax,eax
>00410C95    jne         00410C9B
 00410C97    xor         edx,edx
>00410C99    jmp         00410CB5
 00410C9B    mov         edx,dword ptr [ebp+8]
 00410C9E    mov         edx,dword ptr [ebp+8]
 00410CA1    mov         dword ptr [edx+eax*4-100],ecx
 00410CA8    mov         edx,dword ptr [ebp+8]
 00410CAB    push        edx
 00410CAC    dec         eax
 00410CAD    call        Increment
 00410CB2    pop         ecx
 00410CB3    mov         edx,eax
 00410CB5    mov         eax,edx
 00410CB7    pop         esi
 00410CB8    pop         ebx
 00410CB9    pop         ebp
 00410CBA    ret
*}
end;

//00410CBC
procedure VarArrayClear(var V:TVarData);
begin
{*
 00410CBC    push        ebp
 00410CBD    mov         ebp,esp
 00410CBF    add         esp,0FFFFFCE8
 00410CC5    push        ebx
 00410CC6    push        esi
 00410CC7    push        edi
 00410CC8    mov         dword ptr [ebp-304],eax
 00410CCE    mov         eax,dword ptr [ebp-304]
 00410CD4    test        byte ptr [eax+1],20
>00410CD8    jne         00410CE4
 00410CDA    mov         eax,80070057
 00410CDF    call        VarResultCheck
 00410CE4    mov         eax,dword ptr [ebp-304]
 00410CEA    mov         ax,word ptr [eax]
 00410CED    mov         edx,eax
 00410CEF    and         dx,0FFF
 00410CF4    cmp         dx,0C
>00410CF8    jne         00410E20
 00410CFE    mov         edx,dword ptr [ebp-304]
 00410D04    test        ah,40
>00410D07    je          00410D1C
 00410D09    mov         eax,dword ptr [ebp-304]
 00410D0F    mov         eax,dword ptr [eax+8]
 00410D12    mov         eax,dword ptr [eax]
 00410D14    mov         dword ptr [ebp-308],eax
>00410D1A    jmp         00410D2B
 00410D1C    mov         eax,dword ptr [ebp-304]
 00410D22    mov         eax,dword ptr [eax+8]
 00410D25    mov         dword ptr [ebp-308],eax
 00410D2B    mov         eax,dword ptr [ebp-308]
 00410D31    movzx       eax,word ptr [eax]
 00410D34    mov         dword ptr [ebp-310],eax
 00410D3A    mov         ebx,dword ptr [ebp-310]
 00410D40    dec         ebx
 00410D41    test        ebx,ebx
>00410D43    jl          00410DB0
 00410D45    inc         ebx
 00410D46    xor         edi,edi
 00410D48    lea         esi,[ebp-300]
 00410D4E    mov         eax,esi
 00410D50    mov         dword ptr [ebp-318],eax
 00410D56    mov         eax,dword ptr [ebp-318]
 00410D5C    add         eax,4
 00410D5F    push        eax
 00410D60    lea         eax,[edi+1]
 00410D63    push        eax
 00410D64    mov         eax,dword ptr [ebp-308]
 00410D6A    push        eax
 00410D6B    call        oleaut32.SafeArrayGetLBound
 00410D70    call        VarResultCheck
 00410D75    lea         eax,[ebp-30C]
 00410D7B    push        eax
 00410D7C    lea         eax,[edi+1]
 00410D7F    push        eax
 00410D80    mov         eax,dword ptr [ebp-308]
 00410D86    push        eax
 00410D87    call        oleaut32.SafeArrayGetUBound
 00410D8C    call        VarResultCheck
 00410D91    mov         eax,dword ptr [ebp-318]
 00410D97    mov         edx,dword ptr [ebp-30C]
 00410D9D    sub         edx,dword ptr [eax+4]
 00410DA0    inc         edx
 00410DA1    mov         eax,dword ptr [ebp-318]
 00410DA7    mov         dword ptr [eax],edx
 00410DA9    inc         edi
 00410DAA    add         esi,8
 00410DAD    dec         ebx
>00410DAE    jne         00410D4E
 00410DB0    mov         ebx,dword ptr [ebp-310]
 00410DB6    dec         ebx
 00410DB7    test        ebx,ebx
>00410DB9    jl          00410DD5
 00410DBB    inc         ebx
 00410DBC    lea         eax,[ebp-2FC]
 00410DC2    lea         edx,[ebp-100]
 00410DC8    mov         ecx,dword ptr [eax]
 00410DCA    mov         dword ptr [edx],ecx
 00410DCC    add         edx,4
 00410DCF    add         eax,8
 00410DD2    dec         ebx
>00410DD3    jne         00410DC8
 00410DD5    push        ebp
 00410DD6    mov         ebx,dword ptr [ebp-310]
 00410DDC    dec         ebx
 00410DDD    mov         eax,ebx
 00410DDF    call        InBounds
 00410DE4    pop         ecx
 00410DE5    test        al,al
>00410DE7    je          00410E13
 00410DE9    lea         eax,[ebp-314]
 00410DEF    push        eax
 00410DF0    lea         eax,[ebp-100]
 00410DF6    push        eax
 00410DF7    mov         eax,dword ptr [ebp-308]
 00410DFD    push        eax
 00410DFE    call        oleaut32.SafeArrayPtrOfIndex
 00410E03    call        VarResultCheck
 00410E08    mov         eax,dword ptr [ebp-314]
 00410E0E    call        @VarClear
 00410E13    push        ebp
 00410E14    mov         eax,ebx
 00410E16    call        Increment
 00410E1B    pop         ecx
 00410E1C    test        al,al
>00410E1E    jne         00410DD5
 00410E20    mov         eax,dword ptr [ebp-304]
 00410E26    push        eax
 00410E27    call        oleaut32.VariantClear
 00410E2C    call        VarResultCheck
 00410E31    pop         edi
 00410E32    pop         esi
 00410E33    pop         ebx
 00410E34    mov         esp,ebp
 00410E36    pop         ebp
 00410E37    ret
*}
end;

//00410E38
procedure VarClearDeep(var V:TVarData);
begin
{*
 00410E38    push        ebx
 00410E39    push        esi
 00410E3A    push        ecx
 00410E3B    mov         ebx,eax
 00410E3D    mov         si,word ptr [ebx]
 00410E40    cmp         si,14
>00410E44    jae         00410E53
 00410E46    push        ebx
 00410E47    call        oleaut32.VariantClear
 00410E4C    call        VarResultCheck
>00410E51    jmp         00410EAE
 00410E53    cmp         si,100
>00410E58    jne         00410E69
 00410E5A    mov         word ptr [ebx],0
 00410E5F    lea         eax,[ebx+8]
 00410E62    call        @LStrClr
>00410E67    jmp         00410EAE
 00410E69    cmp         si,101
>00410E6E    jne         00410E7A
 00410E70    mov         eax,ebx
 00410E72    call        dword ptr ds:[5E08E0]
>00410E78    jmp         00410EAE
 00410E7A    test        si,2000
>00410E7F    je          00410E8A
 00410E81    mov         eax,ebx
 00410E83    call        VarArrayClear
>00410E88    jmp         00410EAE
 00410E8A    mov         edx,esp
 00410E8C    mov         eax,esi
 00410E8E    call        FindCustomVariantType
 00410E93    test        al,al
>00410E95    je          00410EA3
 00410E97    mov         edx,ebx
 00410E99    mov         eax,dword ptr [esp]
 00410E9C    mov         ecx,dword ptr [eax]
 00410E9E    call        dword ptr [ecx+24]
>00410EA1    jmp         00410EAE
 00410EA3    push        ebx
 00410EA4    call        oleaut32.VariantClear
 00410EA9    call        VarResultCheck
 00410EAE    pop         edx
 00410EAF    pop         esi
 00410EB0    pop         ebx
 00410EB1    ret
*}
end;

//00410EB4
procedure @VarClear(var V:TVarData);
begin
{*
 00410EB4    test        word ptr [eax],0BFE8
>00410EB9    jne         00410EC1
 00410EBB    mov         word ptr [eax],0
 00410EC0    ret
 00410EC1    call        VarClearDeep
 00410EC6    ret
*}
end;

//00410EC8
procedure @VarClr(var V:TVarData);
begin
{*
 00410EC8    push        eax
 00410EC9    call        @VarClear
 00410ECE    pop         eax
 00410ECF    ret
*}
end;

//00410ED0
function InBounds(At:Integer):Boolean;
begin
{*
 00410ED0    push        ebp
 00410ED1    mov         ebp,esp
 00410ED3    push        ebx
 00410ED4    mov         ecx,dword ptr [ebp+8]
 00410ED7    add         ecx,0FFFFFD00
 00410EDD    mov         edx,dword ptr [ecx+eax*8+4]
 00410EE1    add         edx,dword ptr [ecx+eax*8]
 00410EE4    mov         ebx,dword ptr [ebp+8]
 00410EE7    cmp         edx,dword ptr [ebx+eax*4-100]
 00410EEE    setg        dl
 00410EF1    dec         eax
 00410EF2    test        dl,dl
>00410EF4    je          00410EFA
 00410EF6    test        eax,eax
>00410EF8    jge         00410EDD
 00410EFA    mov         eax,edx
 00410EFC    pop         ebx
 00410EFD    pop         ebp
 00410EFE    ret
*}
end;

//00410F00
function Increment(At:Integer):Boolean;
begin
{*
 00410F00    push        ebp
 00410F01    mov         ebp,esp
 00410F03    push        ebx
 00410F04    push        esi
 00410F05    mov         dl,1
 00410F07    mov         ecx,dword ptr [ebp+8]
 00410F0A    inc         dword ptr [ecx+eax*4-100]
 00410F11    mov         ecx,dword ptr [ebp+8]
 00410F14    mov         ecx,dword ptr [ecx+eax*8-2FC]
 00410F1B    mov         ebx,ecx
 00410F1D    mov         esi,dword ptr [ebp+8]
 00410F20    add         ebx,dword ptr [esi+eax*8-300]
 00410F27    mov         esi,dword ptr [ebp+8]
 00410F2A    cmp         ebx,dword ptr [esi+eax*4-100]
>00410F31    jg          00410F55
 00410F33    test        eax,eax
>00410F35    jne         00410F3B
 00410F37    xor         edx,edx
>00410F39    jmp         00410F55
 00410F3B    mov         edx,dword ptr [ebp+8]
 00410F3E    mov         edx,dword ptr [ebp+8]
 00410F41    mov         dword ptr [edx+eax*4-100],ecx
 00410F48    mov         edx,dword ptr [ebp+8]
 00410F4B    push        edx
 00410F4C    dec         eax
 00410F4D    call        Increment
 00410F52    pop         ecx
 00410F53    mov         edx,eax
 00410F55    mov         eax,edx
 00410F57    pop         esi
 00410F58    pop         ebx
 00410F59    pop         ebp
 00410F5A    ret
*}
end;

//00410F5C
procedure VarArrayCopyForEach(var Dest:TVarData; const Src:TVarData; AProc:TVarArrayForEach);
begin
{*
 00410F5C    push        ebp
 00410F5D    mov         ebp,esp
 00410F5F    add         esp,0FFFFFCE0
 00410F65    push        ebx
 00410F66    push        esi
 00410F67    push        edi
 00410F68    mov         dword ptr [ebp-308],ecx
 00410F6E    mov         ebx,edx
 00410F70    mov         dword ptr [ebp-304],eax
 00410F76    test        byte ptr [ebx+1],20
>00410F7A    jne         00410F86
 00410F7C    mov         eax,80070057
 00410F81    call        VarResultCheck
 00410F86    mov         ax,word ptr [ebx]
 00410F89    mov         edx,eax
 00410F8B    and         dx,0FFF
 00410F90    cmp         dx,0C
>00410F94    jne         0041110D
 00410F9A    test        ah,40
>00410F9D    je          00410FAC
 00410F9F    mov         eax,dword ptr [ebx+8]
 00410FA2    mov         eax,dword ptr [eax]
 00410FA4    mov         dword ptr [ebp-314],eax
>00410FAA    jmp         00410FB5
 00410FAC    mov         eax,dword ptr [ebx+8]
 00410FAF    mov         dword ptr [ebp-314],eax
 00410FB5    mov         eax,dword ptr [ebp-314]
 00410FBB    movzx       eax,word ptr [eax]
 00410FBE    mov         dword ptr [ebp-310],eax
 00410FC4    mov         ebx,dword ptr [ebp-310]
 00410FCA    dec         ebx
 00410FCB    test        ebx,ebx
>00410FCD    jl          0041103A
 00410FCF    inc         ebx
 00410FD0    xor         edi,edi
 00410FD2    lea         esi,[ebp-300]
 00410FD8    mov         eax,esi
 00410FDA    mov         dword ptr [ebp-320],eax
 00410FE0    mov         eax,dword ptr [ebp-320]
 00410FE6    add         eax,4
 00410FE9    push        eax
 00410FEA    lea         eax,[edi+1]
 00410FED    push        eax
 00410FEE    mov         eax,dword ptr [ebp-314]
 00410FF4    push        eax
 00410FF5    call        oleaut32.SafeArrayGetLBound
 00410FFA    call        VarResultCheck
 00410FFF    lea         eax,[ebp-30C]
 00411005    push        eax
 00411006    lea         eax,[edi+1]
 00411009    push        eax
 0041100A    mov         eax,dword ptr [ebp-314]
 00411010    push        eax
 00411011    call        oleaut32.SafeArrayGetUBound
 00411016    call        VarResultCheck
 0041101B    mov         eax,dword ptr [ebp-320]
 00411021    mov         edx,dword ptr [ebp-30C]
 00411027    sub         edx,dword ptr [eax+4]
 0041102A    inc         edx
 0041102B    mov         eax,dword ptr [ebp-320]
 00411031    mov         dword ptr [eax],edx
 00411033    inc         edi
 00411034    add         esi,8
 00411037    dec         ebx
>00411038    jne         00410FD8
 0041103A    lea         eax,[ebp-300]
 00411040    push        eax
 00411041    mov         eax,dword ptr [ebp-310]
 00411047    push        eax
 00411048    push        0C
 0041104A    call        oleaut32.SafeArrayCreate
 0041104F    mov         esi,eax
 00411051    test        esi,esi
>00411053    jne         0041105A
 00411055    call        VarArrayCreateError
 0041105A    mov         eax,dword ptr [ebp-304]
 00411060    call        @VarClear
 00411065    mov         eax,dword ptr [ebp-304]
 0041106B    mov         word ptr [eax],200C
 00411070    mov         eax,dword ptr [ebp-304]
 00411076    mov         dword ptr [eax+8],esi
 00411079    mov         ebx,dword ptr [ebp-310]
 0041107F    dec         ebx
 00411080    test        ebx,ebx
>00411082    jl          0041109E
 00411084    inc         ebx
 00411085    lea         eax,[ebp-2FC]
 0041108B    lea         edx,[ebp-100]
 00411091    mov         ecx,dword ptr [eax]
 00411093    mov         dword ptr [edx],ecx
 00411095    add         edx,4
 00411098    add         eax,8
 0041109B    dec         ebx
>0041109C    jne         00411091
 0041109E    push        ebp
 0041109F    mov         ebx,dword ptr [ebp-310]
 004110A5    dec         ebx
 004110A6    mov         eax,ebx
 004110A8    call        InBounds
 004110AD    pop         ecx
 004110AE    test        al,al
>004110B0    je          004110FE
 004110B2    lea         eax,[ebp-318]
 004110B8    push        eax
 004110B9    lea         eax,[ebp-100]
 004110BF    push        eax
 004110C0    mov         eax,dword ptr [ebp-314]
 004110C6    push        eax
 004110C7    call        oleaut32.SafeArrayPtrOfIndex
 004110CC    call        VarResultCheck
 004110D1    lea         eax,[ebp-31C]
 004110D7    push        eax
 004110D8    lea         eax,[ebp-100]
 004110DE    push        eax
 004110DF    push        esi
 004110E0    call        oleaut32.SafeArrayPtrOfIndex
 004110E5    call        VarResultCheck
 004110EA    mov         eax,dword ptr [ebp-318]
 004110F0    mov         edx,eax
 004110F2    mov         eax,dword ptr [ebp-31C]
 004110F8    call        dword ptr [ebp-308]
 004110FE    push        ebp
 004110FF    mov         eax,ebx
 00411101    call        Increment
 00411106    pop         ecx
 00411107    test        al,al
>00411109    jne         0041109E
>0041110B    jmp         0041111F
 0041110D    push        ebx
 0041110E    mov         eax,dword ptr [ebp-304]
 00411114    push        eax
 00411115    call        oleaut32.VariantCopy
 0041111A    call        VarResultCheck
 0041111F    pop         edi
 00411120    pop         esi
 00411121    pop         ebx
 00411122    mov         esp,ebp
 00411124    pop         ebp
 00411125    ret
*}
end;

//00411128
procedure VarCopyCopyProc(var Dest:TVarData; const Src:TVarData);
begin
{*
 00411128    call        @VarCopy
 0041112D    ret
*}
end;

//00411130
procedure VarCopyDeep(var Dest:TVarData; const Source:TVarData);
begin
{*
 00411130    push        ebx
 00411131    push        esi
 00411132    push        edi
 00411133    push        ecx
 00411134    mov         esi,edx
 00411136    mov         ebx,eax
 00411138    test        word ptr [ebx],0BFE8
>0041113D    je          00411146
 0041113F    mov         eax,ebx
 00411141    call        VarClearDeep
 00411146    mov         di,word ptr [esi]
 00411149    cmp         di,14
>0041114D    jae         0041115D
 0041114F    push        esi
 00411150    push        ebx
 00411151    call        oleaut32.VariantCopy
 00411156    call        VarResultCheck
>0041115B    jmp         004111D6
 0041115D    cmp         di,100
>00411162    jne         0041117B
 00411164    mov         word ptr [ebx],100
 00411169    xor         eax,eax
 0041116B    mov         dword ptr [ebx+8],eax
 0041116E    lea         eax,[ebx+8]
 00411171    mov         edx,dword ptr [esi+8]
 00411174    call        @LStrAsg
>00411179    jmp         004111D6
 0041117B    cmp         di,101
>00411180    jne         00411195
 00411182    mov         word ptr [ebx],di
 00411185    mov         eax,dword ptr [esi+8]
 00411188    mov         dword ptr [ebx+8],eax
 0041118B    mov         eax,ebx
 0041118D    call        dword ptr ds:[5E08E8]
>00411193    jmp         004111D6
 00411195    test        di,2000
>0041119A    je          004111AC
 0041119C    mov         ecx,411128;VarCopyCopyProc
 004111A1    mov         edx,esi
 004111A3    mov         eax,ebx
 004111A5    call        VarArrayCopyForEach
>004111AA    jmp         004111D6
 004111AC    mov         edx,esp
 004111AE    mov         eax,edi
 004111B0    call        FindCustomVariantType
 004111B5    test        al,al
>004111B7    je          004111CA
 004111B9    push        0
 004111BB    mov         ecx,esi
 004111BD    mov         edx,ebx
 004111BF    mov         eax,dword ptr [esp+4]
 004111C3    mov         ebx,dword ptr [eax]
 004111C5    call        dword ptr [ebx+28]
>004111C8    jmp         004111D6
 004111CA    push        esi
 004111CB    push        ebx
 004111CC    call        oleaut32.VariantCopy
 004111D1    call        VarResultCheck
 004111D6    pop         edx
 004111D7    pop         edi
 004111D8    pop         esi
 004111D9    pop         ebx
 004111DA    ret
*}
end;

//004111DC
procedure @VarCopy(var Dest:TVarData; const Source:TVarData);
begin
{*
 004111DC    push        ebx
 004111DD    push        esi
 004111DE    mov         ebx,edx
 004111E0    mov         esi,eax
 004111E2    cmp         esi,ebx
>004111E4    je          0041121C
 004111E6    test        word ptr [ebx],0BFE8
>004111EB    jne         00411213
 004111ED    test        word ptr [esi],0BFE8
>004111F2    je          004111FB
 004111F4    mov         eax,esi
 004111F6    call        VarClearDeep
 004111FB    mov         eax,dword ptr [ebx]
 004111FD    mov         dword ptr [esi],eax
 004111FF    mov         eax,dword ptr [ebx+4]
 00411202    mov         dword ptr [esi+4],eax
 00411205    mov         eax,dword ptr [ebx+8]
 00411208    mov         dword ptr [esi+8],eax
 0041120B    mov         eax,dword ptr [ebx+0C]
 0041120E    mov         dword ptr [esi+0C],eax
>00411211    jmp         0041121C
 00411213    mov         edx,ebx
 00411215    mov         eax,esi
 00411217    call        VarCopyDeep
 0041121C    pop         esi
 0041121D    pop         ebx
 0041121E    ret
*}
end;

//00411220
procedure VarCastAsAny(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);
begin
{*
 00411220    push        ebp
 00411221    mov         ebp,esp
 00411223    add         esp,0FFFFFFF0
 00411226    push        ebx
 00411227    push        esi
 00411228    push        edi
 00411229    mov         edi,ecx
 0041122B    mov         esi,edx
 0041122D    mov         ebx,eax
 0041122F    lea         eax,[ebp-10]
 00411232    push        eax
 00411233    call        oleaut32.VariantInit
 00411238    xor         eax,eax
 0041123A    push        ebp
 0041123B    push        41127C
 00411240    push        dword ptr fs:[eax]
 00411243    mov         dword ptr fs:[eax],esp
 00411246    mov         edx,esi
 00411248    lea         eax,[ebp-10]
 0041124B    call        @VarCopy
 00411250    lea         eax,[ebp-10]
 00411253    call        dword ptr ds:[5E08E4]
 00411259    movzx       ecx,di
 0041125C    lea         edx,[ebp-10]
 0041125F    mov         eax,ebx
 00411261    call        @VarCast
 00411266    xor         eax,eax
 00411268    pop         edx
 00411269    pop         ecx
 0041126A    pop         ecx
 0041126B    mov         dword ptr fs:[eax],edx
 0041126E    push        411283
 00411273    lea         eax,[ebp-10]
 00411276    call        @VarClear
 0041127B    ret
>0041127C    jmp         @HandleFinally
>00411281    jmp         00411273
 00411283    pop         edi
 00411284    pop         esi
 00411285    pop         ebx
 00411286    mov         esp,ebp
 00411288    pop         ebp
 00411289    ret
*}
end;

//0041128C
procedure VarCastAsOleStr(var Dest:TVarData; const Source:TVarData);
begin
{*
 0041128C    push        ebp
 0041128D    mov         ebp,esp
 0041128F    push        0
 00411291    push        ebx
 00411292    mov         ebx,eax
 00411294    xor         eax,eax
 00411296    push        ebp
 00411297    push        4112CA
 0041129C    push        dword ptr fs:[eax]
 0041129F    mov         dword ptr fs:[eax],esp
 004112A2    lea         eax,[ebp-4]
 004112A5    call        @VarToWStr
 004112AA    mov         eax,ebx
 004112AC    mov         edx,dword ptr [ebp-4]
 004112AF    call        @VarFromWStr
 004112B4    xor         eax,eax
 004112B6    pop         edx
 004112B7    pop         ecx
 004112B8    pop         ecx
 004112B9    mov         dword ptr fs:[eax],edx
 004112BC    push        4112D1
 004112C1    lea         eax,[ebp-4]
 004112C4    call        @WStrClr
 004112C9    ret
>004112CA    jmp         @HandleFinally
>004112CF    jmp         004112C1
 004112D1    pop         ebx
 004112D2    pop         ecx
 004112D3    pop         ebp
 004112D4    ret
*}
end;

//004112D8
procedure VarCastAsString(var Dest:TVarData; const Source:TVarData);
begin
{*
 004112D8    push        ebp
 004112D9    mov         ebp,esp
 004112DB    push        0
 004112DD    push        ebx
 004112DE    mov         ebx,eax
 004112E0    xor         eax,eax
 004112E2    push        ebp
 004112E3    push        411316
 004112E8    push        dword ptr fs:[eax]
 004112EB    mov         dword ptr fs:[eax],esp
 004112EE    lea         eax,[ebp-4]
 004112F1    call        @VarToLStr
 004112F6    mov         eax,ebx
 004112F8    mov         edx,dword ptr [ebp-4]
 004112FB    call        @VarFromLStr
 00411300    xor         eax,eax
 00411302    pop         edx
 00411303    pop         ecx
 00411304    pop         ecx
 00411305    mov         dword ptr fs:[eax],edx
 00411308    push        41131D
 0041130D    lea         eax,[ebp-4]
 00411310    call        @LStrClr
 00411315    ret
>00411316    jmp         @HandleFinally
>0041131B    jmp         0041130D
 0041131D    pop         ebx
 0041131E    pop         ecx
 0041131F    pop         ebp
 00411320    ret
*}
end;

//00411324
procedure VarCastAsDispatch(var Dest:TVarData; const Source:TVarData);
begin
{*
 00411324    push        ebp
 00411325    mov         ebp,esp
 00411327    push        0
 00411329    push        ebx
 0041132A    mov         ebx,eax
 0041132C    xor         eax,eax
 0041132E    push        ebp
 0041132F    push        411362
 00411334    push        dword ptr fs:[eax]
 00411337    mov         dword ptr fs:[eax],esp
 0041133A    lea         eax,[ebp-4]
 0041133D    call        @VarToDisp
 00411342    mov         eax,ebx
 00411344    mov         edx,dword ptr [ebp-4]
 00411347    call        @VarFromDisp
 0041134C    xor         eax,eax
 0041134E    pop         edx
 0041134F    pop         ecx
 00411350    pop         ecx
 00411351    mov         dword ptr fs:[eax],edx
 00411354    push        411369
 00411359    lea         eax,[ebp-4]
 0041135C    call        @IntfClear
 00411361    ret
>00411362    jmp         @HandleFinally
>00411367    jmp         00411359
 00411369    pop         ebx
 0041136A    pop         ecx
 0041136B    pop         ebp
 0041136C    ret
*}
end;

//00411370
procedure VarCastAsInterface(var Dest:TVarData; const Source:TVarData);
begin
{*
 00411370    push        ebp
 00411371    mov         ebp,esp
 00411373    push        0
 00411375    push        ebx
 00411376    mov         ebx,eax
 00411378    xor         eax,eax
 0041137A    push        ebp
 0041137B    push        4113AE
 00411380    push        dword ptr fs:[eax]
 00411383    mov         dword ptr fs:[eax],esp
 00411386    lea         eax,[ebp-4]
 00411389    call        @VarToIntf
 0041138E    mov         eax,ebx
 00411390    mov         edx,dword ptr [ebp-4]
 00411393    call        @VarFromIntf
 00411398    xor         eax,eax
 0041139A    pop         edx
 0041139B    pop         ecx
 0041139C    pop         ecx
 0041139D    mov         dword ptr fs:[eax],edx
 004113A0    push        4113B5
 004113A5    lea         eax,[ebp-4]
 004113A8    call        @IntfClear
 004113AD    ret
>004113AE    jmp         @HandleFinally
>004113B3    jmp         004113A5
 004113B5    pop         ebx
 004113B6    pop         ecx
 004113B7    pop         ebp
 004113B8    ret
*}
end;

//004113BC
procedure VarCastViaOS(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);
begin
{*
 004113BC    push        ebx
 004113BD    push        esi
 004113BE    push        edi
 004113BF    mov         esi,ecx
 004113C1    mov         ebx,edx
 004113C3    mov         edi,eax
 004113C5    mov         ax,word ptr [ebx]
 004113C8    mov         edx,eax
 004113CA    and         dx,0FFF
 004113CF    cmp         dx,14
>004113D3    jb          00411402
 004113D5    mov         edx,ebx
 004113D7    mov         eax,edi
 004113D9    mov         ecx,8
 004113DE    call        @VarCast
 004113E3    push        esi
 004113E4    push        0
 004113E6    push        400
 004113EB    push        edi
 004113EC    push        edi
 004113ED    mov         eax,[005AE68C];^gvar_005E0870
 004113F2    mov         eax,dword ptr [eax]
 004113F4    call        eax
 004113F6    mov         dx,word ptr [ebx]
 004113F9    mov         ecx,esi
 004113FB    call        VarResultCheck
>00411400    jmp         00411435
 00411402    mov         edx,esi
 00411404    and         dx,0FFF
 00411409    cmp         dx,14
>0041140D    jae         0041142E
 0041140F    push        esi
 00411410    push        0
 00411412    push        400
 00411417    push        ebx
 00411418    push        edi
 00411419    mov         eax,[005AE68C];^gvar_005E0870
 0041141E    mov         eax,dword ptr [eax]
 00411420    call        eax
 00411422    mov         dx,word ptr [ebx]
 00411425    mov         ecx,esi
 00411427    call        VarResultCheck
>0041142C    jmp         00411435
 0041142E    mov         edx,esi
 00411430    call        VarCastError
 00411435    pop         edi
 00411436    pop         esi
 00411437    pop         ebx
 00411438    ret
*}
end;

//0041143C
procedure VarCastRare(var Dest:TVarData; const Source:TVarData; ADestType:TVarType);
begin
{*
 0041143C    push        ebx
 0041143D    push        esi
 0041143E    push        edi
 0041143F    push        ebp
 00411440    push        ecx
 00411441    mov         esi,ecx
 00411443    mov         ebx,edx
 00411445    mov         edi,eax
 00411447    mov         bp,word ptr [ebx]
 0041144A    cmp         bp,101
>0041144F    jne         0041145E
 00411451    mov         edx,ebx
 00411453    mov         eax,edi
 00411455    mov         ecx,esi
 00411457    call        VarCastAsAny
>0041145C    jmp         004114A1
 0041145E    mov         edx,esp
 00411460    mov         eax,ebp
 00411462    call        FindCustomVariantType
 00411467    test        al,al
>00411469    je          0041147B
 0041146B    push        esi
 0041146C    mov         ecx,ebx
 0041146E    mov         edx,edi
 00411470    mov         eax,dword ptr [esp+4]
 00411474    mov         ebx,dword ptr [eax]
 00411476    call        dword ptr [ebx+1C]
>00411479    jmp         004114A1
 0041147B    mov         edx,esp
 0041147D    mov         eax,esi
 0041147F    call        FindCustomVariantType
 00411484    test        al,al
>00411486    je          00411496
 00411488    mov         ecx,ebx
 0041148A    mov         edx,edi
 0041148C    mov         eax,dword ptr [esp]
 0041148F    mov         ebx,dword ptr [eax]
 00411491    call        dword ptr [ebx+18]
>00411494    jmp         004114A1
 00411496    mov         edx,ebx
 00411498    mov         eax,edi
 0041149A    mov         ecx,esi
 0041149C    call        VarCastViaOS
 004114A1    pop         edx
 004114A2    pop         ebp
 004114A3    pop         edi
 004114A4    pop         esi
 004114A5    pop         ebx
 004114A6    ret
*}
end;

//004114A8
procedure @VarCast(var Dest:TVarData; const Source:TVarData; AVarType:Integer);
begin
{*
 004114A8    push        ebx
 004114A9    push        esi
 004114AA    mov         ebx,edx
 004114AC    mov         esi,eax
 004114AE    mov         ax,word ptr [ebx]
 004114B1    movzx       edx,ax
 004114B4    cmp         ecx,edx
>004114B6    jne         004114C4
 004114B8    mov         edx,ebx
 004114BA    mov         eax,esi
 004114BC    call        @VarCopy
 004114C1    pop         esi
 004114C2    pop         ebx
 004114C3    ret
 004114C4    cmp         ax,400C
>004114C8    jne         004114DB
 004114CA    mov         eax,dword ptr [ebx+8]
 004114CD    mov         edx,eax
 004114CF    mov         eax,esi
 004114D1    call        @VarCast
>004114D6    jmp         004116CE
 004114DB    mov         edx,ecx
 004114DD    cmp         edx,14
>004114E0    ja          004116A0
 004114E6    jmp         dword ptr [edx*4+4114ED]
 004114E6    dd          00411541
 004114E6    dd          0041156C
 004114E6    dd          00411578
 004114E6    dd          0041158D
 004114E6    dd          004115A2
 004114E6    dd          004115BC
 004114E6    dd          004115D6
 004114E6    dd          004115F0
 004114E6    dd          0041160A
 004114E6    dd          0041168A
 004114E6    dd          004116A0
 004114E6    dd          00411618
 004114E6    dd          004116A0
 004114E6    dd          00411695
 004114E6    dd          004116A0
 004114E6    dd          004116A0
 004114E6    dd          0041162D
 004114E6    dd          00411642
 004114E6    dd          00411654
 004114E6    dd          00411666
 004114E6    dd          00411678
 00411541    cmp         word ptr [ebx],1
>00411545    jne         00411560
 00411547    cmp         byte ptr ds:[5AC3AC],0
>0041154E    je          00411560
 00411550    xor         edx,edx
 00411552    mov         ax,1
 00411556    call        VarCastError
>0041155B    jmp         004116CE
 00411560    mov         eax,esi
 00411562    call        @VarClear
>00411567    jmp         004116CE
 0041156C    mov         eax,esi
 0041156E    call        @VarNull
>00411573    jmp         004116CE
 00411578    mov         eax,ebx
 0041157A    call        @VarToSmallInt
 0041157F    mov         edx,eax
 00411581    mov         eax,esi
 00411583    call        @VarFromSmallInt
>00411588    jmp         004116CE
 0041158D    mov         eax,ebx
 0041158F    call        @VarToInteger
 00411594    mov         edx,eax
 00411596    mov         eax,esi
 00411598    call        @VarFromInteger
>0041159D    jmp         004116CE
 004115A2    mov         eax,ebx
 004115A4    call        @VarToSingle
 004115A9    add         esp,0FFFFFFFC
 004115AC    fstp        dword ptr [esp]
 004115AF    wait
 004115B0    mov         eax,esi
 004115B2    call        @VarFromSingle
>004115B7    jmp         004116CE
 004115BC    mov         eax,ebx
 004115BE    call        @VarToDouble
 004115C3    add         esp,0FFFFFFF8
 004115C6    fstp        qword ptr [esp]
 004115C9    wait
 004115CA    mov         eax,esi
 004115CC    call        @VarFromDouble
>004115D1    jmp         004116CE
 004115D6    mov         eax,ebx
 004115D8    call        @VarToCurrency
 004115DD    add         esp,0FFFFFFF8
 004115E0    fistp       qword ptr [esp]
 004115E3    wait
 004115E4    mov         eax,esi
 004115E6    call        @VarFromCurrency
>004115EB    jmp         004116CE
 004115F0    mov         eax,ebx
 004115F2    call        @VarToDate
 004115F7    add         esp,0FFFFFFF8
 004115FA    fstp        qword ptr [esp]
 004115FD    wait
 004115FE    mov         eax,esi
 00411600    call        @VarFromDate
>00411605    jmp         004116CE
 0041160A    mov         edx,ebx
 0041160C    mov         eax,esi
 0041160E    call        VarCastAsOleStr
>00411613    jmp         004116CE
 00411618    mov         eax,ebx
 0041161A    call        @VarToBoolean
 0041161F    mov         edx,eax
 00411621    mov         eax,esi
 00411623    call        @VarFromBool
>00411628    jmp         004116CE
 0041162D    mov         eax,ebx
 0041162F    call        @VarToShortInt
 00411634    mov         edx,eax
 00411636    mov         eax,esi
 00411638    call        @VarFromShortInt
>0041163D    jmp         004116CE
 00411642    mov         eax,ebx
 00411644    call        @VarToByte
 00411649    mov         edx,eax
 0041164B    mov         eax,esi
 0041164D    call        @VarFromByte
>00411652    jmp         004116CE
 00411654    mov         eax,ebx
 00411656    call        @VarToWord
 0041165B    mov         edx,eax
 0041165D    mov         eax,esi
 0041165F    call        @VarFromWord
>00411664    jmp         004116CE
 00411666    mov         eax,ebx
 00411668    call        @VarToLongWord
 0041166D    mov         edx,eax
 0041166F    mov         eax,esi
 00411671    call        @VarFromLongWord
>00411676    jmp         004116CE
 00411678    mov         eax,ebx
 0041167A    call        @VarToInt64
 0041167F    push        edx
 00411680    push        eax
 00411681    mov         eax,esi
 00411683    call        @VarFromInt64
>00411688    jmp         004116CE
 0041168A    mov         edx,ebx
 0041168C    mov         eax,esi
 0041168E    call        VarCastAsDispatch
>00411693    jmp         004116CE
 00411695    mov         edx,ebx
 00411697    mov         eax,esi
 00411699    call        VarCastAsInterface
>0041169E    jmp         004116CE
 004116A0    mov         edx,ecx
 004116A2    sub         edx,100
>004116A8    je          004116AF
 004116AA    dec         edx
>004116AB    je          004116BA
>004116AD    jmp         004116C5
 004116AF    mov         edx,ebx
 004116B1    mov         eax,esi
 004116B3    call        VarCastAsString
>004116B8    jmp         004116CE
 004116BA    mov         dx,101
 004116BE    call        VarCastError
>004116C3    jmp         004116CE
 004116C5    mov         edx,ebx
 004116C7    mov         eax,esi
 004116C9    call        VarCastRare
 004116CE    pop         esi
 004116CF    pop         ebx
 004116D0    ret
*}
end;

//004116D4
function VarToIntAsString(const V:TVarData):Integer;
begin
{*
 004116D4    push        ebp
 004116D5    mov         ebp,esp
 004116D7    push        0
 004116D9    push        0
 004116DB    push        0
 004116DD    push        ebx
 004116DE    mov         ebx,eax
 004116E0    xor         eax,eax
 004116E2    push        ebp
 004116E3    push        411777
 004116E8    push        dword ptr fs:[eax]
 004116EB    mov         dword ptr fs:[eax],esp
 004116EE    mov         edx,ebx
 004116F0    lea         eax,[ebp-8]
 004116F3    call        @VarToWStr
 004116F8    lea         eax,[ebp-4]
 004116FB    push        eax
 004116FC    push        0
 004116FE    push        400
 00411703    mov         eax,dword ptr [ebp-8]
 00411706    push        eax
 00411707    mov         eax,[005AE7A8];^gvar_005E08A4
 0041170C    mov         eax,dword ptr [eax]
 0041170E    call        eax
 00411710    mov         edx,eax
 00411712    sub         edx,80020005
>00411718    je          00411724
 0041171A    sub         edx,7FFDFFFB
>00411720    jne         0041174D
>00411722    jmp         00411759
 00411724    lea         eax,[ebp-0C]
 00411727    mov         edx,dword ptr [ebp-8]
 0041172A    call        @LStrFromWStr
 0041172F    mov         eax,dword ptr [ebp-0C]
 00411732    lea         edx,[ebp-4]
 00411735    call        TryStrToInt
 0041173A    test        al,al
>0041173C    jne         00411759
 0041173E    mov         eax,ebx
 00411740    call        @VarToBoolean
 00411745    and         eax,7F
 00411748    mov         dword ptr [ebp-4],eax
>0041174B    jmp         00411759
 0041174D    mov         dx,word ptr [ebx]
 00411750    mov         cx,3
 00411754    call        VarResultCheck
 00411759    xor         eax,eax
 0041175B    pop         edx
 0041175C    pop         ecx
 0041175D    pop         ecx
 0041175E    mov         dword ptr fs:[eax],edx
 00411761    push        41177E
 00411766    lea         eax,[ebp-0C]
 00411769    call        @LStrClr
 0041176E    lea         eax,[ebp-8]
 00411771    call        @WStrClr
 00411776    ret
>00411777    jmp         @HandleFinally
>0041177C    jmp         00411766
 0041177E    mov         eax,dword ptr [ebp-4]
 00411781    pop         ebx
 00411782    mov         esp,ebp
 00411784    pop         ebp
 00411785    ret
*}
end;

//00411788
function VarToIntViaOS(const V:TVarData):Integer;
begin
{*
 00411788    push        ebx
 00411789    add         esp,0FFFFFFF0
 0041178C    mov         ebx,eax
 0041178E    push        esp
 0041178F    call        oleaut32.VariantInit
 00411794    push        3
 00411796    push        0
 00411798    push        400
 0041179D    push        ebx
 0041179E    lea         eax,[esp+10]
 004117A2    push        eax
 004117A3    mov         eax,[005AE68C];^gvar_005E0870
 004117A8    mov         eax,dword ptr [eax]
 004117AA    call        eax
 004117AC    mov         dx,word ptr [ebx]
 004117AF    mov         cx,3
 004117B3    call        VarResultCheck
 004117B8    mov         eax,dword ptr [esp+8]
 004117BC    add         esp,10
 004117BF    pop         ebx
 004117C0    ret
*}
end;

//004117C4
function VarToIntAny(const V:TVarData):Integer;
begin
{*
 004117C4    push        ebp
 004117C5    mov         ebp,esp
 004117C7    add         esp,0FFFFFFEC
 004117CA    push        ebx
 004117CB    mov         ebx,eax
 004117CD    lea         eax,[ebp-14]
 004117D0    push        eax
 004117D1    call        oleaut32.VariantInit
 004117D6    xor         eax,eax
 004117D8    push        ebp
 004117D9    push        411818
 004117DE    push        dword ptr fs:[eax]
 004117E1    mov         dword ptr fs:[eax],esp
 004117E4    mov         edx,ebx
 004117E6    lea         eax,[ebp-14]
 004117E9    call        @VarCopy
 004117EE    lea         eax,[ebp-14]
 004117F1    call        dword ptr ds:[5E08E4]
 004117F7    lea         eax,[ebp-14]
 004117FA    call        @VarToInteger
 004117FF    mov         dword ptr [ebp-4],eax
 00411802    xor         eax,eax
 00411804    pop         edx
 00411805    pop         ecx
 00411806    pop         ecx
 00411807    mov         dword ptr fs:[eax],edx
 0041180A    push        41181F
 0041180F    lea         eax,[ebp-14]
 00411812    call        @VarClear
 00411817    ret
>00411818    jmp         @HandleFinally
>0041181D    jmp         0041180F
 0041181F    mov         eax,dword ptr [ebp-4]
 00411822    pop         ebx
 00411823    mov         esp,ebp
 00411825    pop         ebp
 00411826    ret
*}
end;

//00411828
function VarToIntCustom(const V:TVarData; var AValue:Integer):Boolean;
begin
{*
 00411828    push        ebx
 00411829    push        esi
 0041182A    push        edi
 0041182B    add         esp,0FFFFFFEC
 0041182E    mov         edi,edx
 00411830    mov         esi,eax
 00411832    mov         edx,esp
 00411834    mov         ax,word ptr [esi]
 00411837    call        FindCustomVariantType
 0041183C    mov         ebx,eax
 0041183E    test        bl,bl
>00411840    je          00411863
 00411842    lea         eax,[esp+4]
 00411846    push        eax
 00411847    call        oleaut32.VariantInit
 0041184C    push        3
 0041184E    mov         ecx,esi
 00411850    lea         edx,[esp+8]
 00411854    mov         eax,dword ptr [esp+4]
 00411858    mov         esi,dword ptr [eax]
 0041185A    call        dword ptr [esi+1C]
 0041185D    mov         eax,dword ptr [esp+0C]
 00411861    mov         dword ptr [edi],eax
 00411863    mov         eax,ebx
 00411865    add         esp,14
 00411868    pop         edi
 00411869    pop         esi
 0041186A    pop         ebx
 0041186B    ret
*}
end;

//0041186C
function @VarToInteger(const V:TVarData):Integer;
begin
{*
 0041186C    push        ebp
 0041186D    mov         ebp,esp
 0041186F    add         esp,0FFFFFFF8
 00411872    push        ebx
 00411873    push        esi
 00411874    push        edi
 00411875    mov         dword ptr [ebp-4],eax
 00411878    xor         edx,edx
 0041187A    push        ebp
 0041187B    push        411C8D
 00411880    push        dword ptr fs:[edx]
 00411883    mov         dword ptr fs:[edx],esp
 00411886    mov         eax,dword ptr [ebp-4]
 00411889    mov         ax,word ptr [eax]
 0041188C    movzx       edx,ax
 0041188F    cmp         edx,14
>00411892    ja          00411A69
 00411898    jmp         dword ptr [edx*4+41189F]
 00411898    dd          004118F3
 00411898    dd          004118FD
 00411898    dd          0041191D
 00411898    dd          0041192C
 00411898    dd          0041193A
 00411898    dd          0041195B
 00411898    dd          0041197C
 00411898    dd          004119A3
 00411898    dd          004119C4
 00411898    dd          00411A59
 00411898    dd          00411A69
 00411898    dd          004119D4
 00411898    dd          00411A46
 00411898    dd          00411A59
 00411898    dd          00411A69
 00411898    dd          00411A69
 00411898    dd          004119E3
 00411898    dd          004119F2
 00411898    dd          00411A01
 00411898    dd          00411A10
 00411898    dd          00411A27
 004118F3    xor         eax,eax
 004118F5    mov         dword ptr [ebp-8],eax
>004118F8    jmp         00411C83
 004118FD    cmp         byte ptr ds:[5AC3AC],0
>00411904    je          00411913
 00411906    mov         dx,3
 0041190A    mov         ax,1
 0041190E    call        VarCastError
 00411913    xor         eax,eax
 00411915    mov         dword ptr [ebp-8],eax
>00411918    jmp         00411C83
 0041191D    mov         eax,dword ptr [ebp-4]
 00411920    movsx       eax,word ptr [eax+8]
 00411924    mov         dword ptr [ebp-8],eax
>00411927    jmp         00411C83
 0041192C    mov         eax,dword ptr [ebp-4]
 0041192F    mov         eax,dword ptr [eax+8]
 00411932    mov         dword ptr [ebp-8],eax
>00411935    jmp         00411C83
 0041193A    mov         eax,dword ptr [ebp-4]
 0041193D    fld         dword ptr [eax+8]
 00411940    call        @ROUND
 00411945    push        eax
 00411946    sar         eax,1F
 00411949    cmp         eax,edx
 0041194B    pop         eax
>0041194C    je          00411953
 0041194E    call        @BoundErr
 00411953    mov         dword ptr [ebp-8],eax
>00411956    jmp         00411C83
 0041195B    mov         eax,dword ptr [ebp-4]
 0041195E    fld         qword ptr [eax+8]
 00411961    call        @ROUND
 00411966    push        eax
 00411967    sar         eax,1F
 0041196A    cmp         eax,edx
 0041196C    pop         eax
>0041196D    je          00411974
 0041196F    call        @BoundErr
 00411974    mov         dword ptr [ebp-8],eax
>00411977    jmp         00411C83
 0041197C    mov         eax,dword ptr [ebp-4]
 0041197F    fild        qword ptr [eax+8]
 00411982    fdiv        dword ptr ds:[411CB8]
 00411988    call        @ROUND
 0041198D    push        eax
 0041198E    sar         eax,1F
 00411991    cmp         eax,edx
 00411993    pop         eax
>00411994    je          0041199B
 00411996    call        @BoundErr
 0041199B    mov         dword ptr [ebp-8],eax
>0041199E    jmp         00411C83
 004119A3    mov         eax,dword ptr [ebp-4]
 004119A6    fld         qword ptr [eax+8]
 004119A9    call        @ROUND
 004119AE    push        eax
 004119AF    sar         eax,1F
 004119B2    cmp         eax,edx
 004119B4    pop         eax
>004119B5    je          004119BC
 004119B7    call        @BoundErr
 004119BC    mov         dword ptr [ebp-8],eax
>004119BF    jmp         00411C83
 004119C4    mov         eax,dword ptr [ebp-4]
 004119C7    call        VarToIntAsString
 004119CC    mov         dword ptr [ebp-8],eax
>004119CF    jmp         00411C83
 004119D4    mov         eax,dword ptr [ebp-4]
 004119D7    movsx       eax,word ptr [eax+8]
 004119DB    mov         dword ptr [ebp-8],eax
>004119DE    jmp         00411C83
 004119E3    mov         eax,dword ptr [ebp-4]
 004119E6    movsx       eax,byte ptr [eax+8]
 004119EA    mov         dword ptr [ebp-8],eax
>004119ED    jmp         00411C83
 004119F2    mov         eax,dword ptr [ebp-4]
 004119F5    movzx       eax,byte ptr [eax+8]
 004119F9    mov         dword ptr [ebp-8],eax
>004119FC    jmp         00411C83
 00411A01    mov         eax,dword ptr [ebp-4]
 00411A04    movzx       eax,word ptr [eax+8]
 00411A08    mov         dword ptr [ebp-8],eax
>00411A0B    jmp         00411C83
 00411A10    mov         eax,dword ptr [ebp-4]
 00411A13    mov         eax,dword ptr [eax+8]
 00411A16    test        eax,eax
>00411A18    jns         00411A1F
 00411A1A    call        @BoundErr
 00411A1F    mov         dword ptr [ebp-8],eax
>00411A22    jmp         00411C83
 00411A27    mov         eax,dword ptr [ebp-4]
 00411A2A    mov         edx,dword ptr [eax+0C]
 00411A2D    mov         eax,dword ptr [eax+8]
 00411A30    push        eax
 00411A31    sar         eax,1F
 00411A34    cmp         eax,edx
 00411A36    pop         eax
>00411A37    je          00411A3E
 00411A39    call        @BoundErr
 00411A3E    mov         dword ptr [ebp-8],eax
>00411A41    jmp         00411C83
 00411A46    mov         eax,dword ptr [ebp-4]
 00411A49    mov         eax,dword ptr [eax+8]
 00411A4C    call        @VarToInteger
 00411A51    mov         dword ptr [ebp-8],eax
>00411A54    jmp         00411C83
 00411A59    mov         eax,dword ptr [ebp-4]
 00411A5C    call        VarToIntViaOS
 00411A61    mov         dword ptr [ebp-8],eax
>00411A64    jmp         00411C83
 00411A69    mov         edx,dword ptr [ebp-4]
 00411A6C    mov         edx,eax
 00411A6E    sub         dx,100
>00411A73    je          00411A7C
 00411A75    dec         dx
>00411A78    je          00411A8C
>00411A7A    jmp         00411A9C
 00411A7C    mov         eax,dword ptr [ebp-4]
 00411A7F    call        VarToIntAsString
 00411A84    mov         dword ptr [ebp-8],eax
>00411A87    jmp         00411C83
 00411A8C    mov         eax,dword ptr [ebp-4]
 00411A8F    call        VarToIntAny
 00411A94    mov         dword ptr [ebp-8],eax
>00411A97    jmp         00411C83
 00411A9C    mov         edx,dword ptr [ebp-4]
 00411A9F    test        ah,40
>00411AA2    je          00411C69
 00411AA8    mov         edx,dword ptr [ebp-4]
 00411AAB    movzx       eax,ax
 00411AAE    and         eax,0FFFFBFFF
 00411AB3    cmp         eax,14
>00411AB6    ja          00411C5C
 00411ABC    jmp         dword ptr [eax*4+411AC3]
 00411ABC    dd          00411C5C
 00411ABC    dd          00411C5C
 00411ABC    dd          00411B17
 00411ABC    dd          00411B28
 00411ABC    dd          00411B38
 00411ABC    dd          00411B5B
 00411ABC    dd          00411B7E
 00411ABC    dd          00411BA7
 00411ABC    dd          00411BCA
 00411ABC    dd          00411C5C
 00411ABC    dd          00411C5C
 00411ABC    dd          00411BDA
 00411ABC    dd          00411C4C
 00411ABC    dd          00411C5C
 00411ABC    dd          00411C5C
 00411ABC    dd          00411C5C
 00411ABC    dd          00411BEB
 00411ABC    dd          00411BFC
 00411ABC    dd          00411C0A
 00411ABC    dd          00411C18
 00411ABC    dd          00411C2E
 00411B17    mov         eax,dword ptr [ebp-4]
 00411B1A    mov         eax,dword ptr [eax+8]
 00411B1D    movsx       eax,word ptr [eax]
 00411B20    mov         dword ptr [ebp-8],eax
>00411B23    jmp         00411C83
 00411B28    mov         eax,dword ptr [ebp-4]
 00411B2B    mov         eax,dword ptr [eax+8]
 00411B2E    mov         eax,dword ptr [eax]
 00411B30    mov         dword ptr [ebp-8],eax
>00411B33    jmp         00411C83
 00411B38    mov         eax,dword ptr [ebp-4]
 00411B3B    mov         eax,dword ptr [eax+8]
 00411B3E    fld         dword ptr [eax]
 00411B40    call        @ROUND
 00411B45    push        eax
 00411B46    sar         eax,1F
 00411B49    cmp         eax,edx
 00411B4B    pop         eax
>00411B4C    je          00411B53
 00411B4E    call        @BoundErr
 00411B53    mov         dword ptr [ebp-8],eax
>00411B56    jmp         00411C83
 00411B5B    mov         eax,dword ptr [ebp-4]
 00411B5E    mov         eax,dword ptr [eax+8]
 00411B61    fld         qword ptr [eax]
 00411B63    call        @ROUND
 00411B68    push        eax
 00411B69    sar         eax,1F
 00411B6C    cmp         eax,edx
 00411B6E    pop         eax
>00411B6F    je          00411B76
 00411B71    call        @BoundErr
 00411B76    mov         dword ptr [ebp-8],eax
>00411B79    jmp         00411C83
 00411B7E    mov         eax,dword ptr [ebp-4]
 00411B81    mov         eax,dword ptr [eax+8]
 00411B84    fild        qword ptr [eax]
 00411B86    fdiv        dword ptr ds:[411CB8]
 00411B8C    call        @ROUND
 00411B91    push        eax
 00411B92    sar         eax,1F
 00411B95    cmp         eax,edx
 00411B97    pop         eax
>00411B98    je          00411B9F
 00411B9A    call        @BoundErr
 00411B9F    mov         dword ptr [ebp-8],eax
>00411BA2    jmp         00411C83
 00411BA7    mov         eax,dword ptr [ebp-4]
 00411BAA    mov         eax,dword ptr [eax+8]
 00411BAD    fld         qword ptr [eax]
 00411BAF    call        @ROUND
 00411BB4    push        eax
 00411BB5    sar         eax,1F
 00411BB8    cmp         eax,edx
 00411BBA    pop         eax
>00411BBB    je          00411BC2
 00411BBD    call        @BoundErr
 00411BC2    mov         dword ptr [ebp-8],eax
>00411BC5    jmp         00411C83
 00411BCA    mov         eax,dword ptr [ebp-4]
 00411BCD    call        VarToIntAsString
 00411BD2    mov         dword ptr [ebp-8],eax
>00411BD5    jmp         00411C83
 00411BDA    mov         eax,dword ptr [ebp-4]
 00411BDD    mov         eax,dword ptr [eax+8]
 00411BE0    movsx       eax,word ptr [eax]
 00411BE3    mov         dword ptr [ebp-8],eax
>00411BE6    jmp         00411C83
 00411BEB    mov         eax,dword ptr [ebp-4]
 00411BEE    mov         eax,dword ptr [eax+8]
 00411BF1    movsx       eax,byte ptr [eax]
 00411BF4    mov         dword ptr [ebp-8],eax
>00411BF7    jmp         00411C83
 00411BFC    mov         eax,dword ptr [ebp-4]
 00411BFF    mov         eax,dword ptr [eax+8]
 00411C02    movzx       eax,byte ptr [eax]
 00411C05    mov         dword ptr [ebp-8],eax
>00411C08    jmp         00411C83
 00411C0A    mov         eax,dword ptr [ebp-4]
 00411C0D    mov         eax,dword ptr [eax+8]
 00411C10    movzx       eax,word ptr [eax]
 00411C13    mov         dword ptr [ebp-8],eax
>00411C16    jmp         00411C83
 00411C18    mov         eax,dword ptr [ebp-4]
 00411C1B    mov         eax,dword ptr [eax+8]
 00411C1E    mov         eax,dword ptr [eax]
 00411C20    test        eax,eax
>00411C22    jns         00411C29
 00411C24    call        @BoundErr
 00411C29    mov         dword ptr [ebp-8],eax
>00411C2C    jmp         00411C83
 00411C2E    mov         eax,dword ptr [ebp-4]
 00411C31    mov         eax,dword ptr [eax+8]
 00411C34    mov         edx,dword ptr [eax+4]
 00411C37    mov         eax,dword ptr [eax]
 00411C39    push        eax
 00411C3A    sar         eax,1F
 00411C3D    cmp         eax,edx
 00411C3F    pop         eax
>00411C40    je          00411C47
 00411C42    call        @BoundErr
 00411C47    mov         dword ptr [ebp-8],eax
>00411C4A    jmp         00411C83
 00411C4C    mov         eax,dword ptr [ebp-4]
 00411C4F    mov         eax,dword ptr [eax+8]
 00411C52    call        @VarToInteger
 00411C57    mov         dword ptr [ebp-8],eax
>00411C5A    jmp         00411C83
 00411C5C    mov         eax,dword ptr [ebp-4]
 00411C5F    call        VarToIntViaOS
 00411C64    mov         dword ptr [ebp-8],eax
>00411C67    jmp         00411C83
 00411C69    lea         edx,[ebp-8]
 00411C6C    mov         eax,dword ptr [ebp-4]
 00411C6F    call        VarToIntCustom
 00411C74    test        al,al
>00411C76    jne         00411C83
 00411C78    mov         eax,dword ptr [ebp-4]
 00411C7B    call        VarToIntViaOS
 00411C80    mov         dword ptr [ebp-8],eax
 00411C83    xor         eax,eax
 00411C85    pop         edx
 00411C86    pop         ecx
 00411C87    pop         ecx
 00411C88    mov         dword ptr fs:[eax],edx
>00411C8B    jmp         00411CAB
>00411C8D    jmp         @HandleAnyException
 00411C92    mov         eax,dword ptr [ebp-4]
 00411C95    mov         ax,word ptr [eax]
 00411C98    mov         dx,3
 00411C9C    call        HandleConversionException
 00411CA1    xor         eax,eax
 00411CA3    mov         dword ptr [ebp-8],eax
 00411CA6    call        @DoneExcept
 00411CAB    mov         eax,dword ptr [ebp-8]
 00411CAE    pop         edi
 00411CAF    pop         esi
 00411CB0    pop         ebx
 00411CB1    pop         ecx
 00411CB2    pop         ecx
 00411CB3    pop         ebp
 00411CB4    ret
*}
end;

//00411CBC
function @VarToShortInt(const V:TVarData):Shortint;
begin
{*
 00411CBC    push        ebp
 00411CBD    mov         ebp,esp
 00411CBF    push        ecx
 00411CC0    push        ebx
 00411CC1    push        esi
 00411CC2    push        edi
 00411CC3    mov         dword ptr [ebp-4],eax
 00411CC6    mov         eax,dword ptr [ebp-4]
 00411CC9    mov         ax,word ptr [eax]
 00411CCC    sub         ax,1
>00411CD0    jb          00411CE2
>00411CD2    je          00411CE6
 00411CD4    sub         ax,0A
>00411CD8    je          00411D00
 00411CDA    sub         ax,5
>00411CDE    je          00411D08
>00411CE0    jmp         00411D10
 00411CE2    xor         ebx,ebx
>00411CE4    jmp         00411D63
 00411CE6    cmp         byte ptr ds:[5AC3AC],0
>00411CED    je          00411CFC
 00411CEF    mov         dx,10
 00411CF3    mov         ax,1
 00411CF7    call        VarCastError
 00411CFC    xor         ebx,ebx
>00411CFE    jmp         00411D63
 00411D00    mov         ebx,dword ptr [ebp-4]
 00411D03    mov         bl,byte ptr [ebx+8]
>00411D06    jmp         00411D63
 00411D08    mov         ebx,dword ptr [ebp-4]
 00411D0B    mov         bl,byte ptr [ebx+8]
>00411D0E    jmp         00411D63
 00411D10    xor         eax,eax
 00411D12    push        ebp
 00411D13    push        411D48
 00411D18    push        dword ptr fs:[eax]
 00411D1B    mov         dword ptr fs:[eax],esp
 00411D1E    mov         eax,dword ptr [ebp-4]
 00411D21    call        @VarToInteger
 00411D26    mov         ebx,eax
 00411D28    add         ebx,80
 00411D2E    cmp         ebx,0FF
>00411D34    jbe         00411D3B
 00411D36    call        @BoundErr
 00411D3B    add         ebx,0FFFFFF80
 00411D3E    xor         eax,eax
 00411D40    pop         edx
 00411D41    pop         ecx
 00411D42    pop         ecx
 00411D43    mov         dword ptr fs:[eax],edx
>00411D46    jmp         00411D63
>00411D48    jmp         @HandleAnyException
 00411D4D    mov         eax,dword ptr [ebp-4]
 00411D50    mov         ax,word ptr [eax]
 00411D53    mov         dx,10
 00411D57    call        HandleConversionException
 00411D5C    xor         ebx,ebx
 00411D5E    call        @DoneExcept
 00411D63    mov         eax,ebx
 00411D65    pop         edi
 00411D66    pop         esi
 00411D67    pop         ebx
 00411D68    pop         ecx
 00411D69    pop         ebp
 00411D6A    ret
*}
end;

//00411D6C
function @VarToByte(const V:TVarData):Byte;
begin
{*
 00411D6C    push        ebp
 00411D6D    mov         ebp,esp
 00411D6F    push        ecx
 00411D70    push        ebx
 00411D71    push        esi
 00411D72    push        edi
 00411D73    mov         dword ptr [ebp-4],eax
 00411D76    mov         eax,dword ptr [ebp-4]
 00411D79    mov         ax,word ptr [eax]
 00411D7C    sub         ax,1
>00411D80    jb          00411D92
>00411D82    je          00411D96
 00411D84    sub         ax,0A
>00411D88    je          00411DB0
 00411D8A    sub         ax,6
>00411D8E    je          00411DB8
>00411D90    jmp         00411DC0
 00411D92    xor         ebx,ebx
>00411D94    jmp         00411E0A
 00411D96    cmp         byte ptr ds:[5AC3AC],0
>00411D9D    je          00411DAC
 00411D9F    mov         dx,11
 00411DA3    mov         ax,1
 00411DA7    call        VarCastError
 00411DAC    xor         ebx,ebx
>00411DAE    jmp         00411E0A
 00411DB0    mov         ebx,dword ptr [ebp-4]
 00411DB3    mov         bl,byte ptr [ebx+8]
>00411DB6    jmp         00411E0A
 00411DB8    mov         ebx,dword ptr [ebp-4]
 00411DBB    mov         bl,byte ptr [ebx+8]
>00411DBE    jmp         00411E0A
 00411DC0    xor         eax,eax
 00411DC2    push        ebp
 00411DC3    push        411DEF
 00411DC8    push        dword ptr fs:[eax]
 00411DCB    mov         dword ptr fs:[eax],esp
 00411DCE    mov         eax,dword ptr [ebp-4]
 00411DD1    call        @VarToInteger
 00411DD6    mov         ebx,eax
 00411DD8    cmp         ebx,0FF
>00411DDE    jbe         00411DE5
 00411DE0    call        @BoundErr
 00411DE5    xor         eax,eax
 00411DE7    pop         edx
 00411DE8    pop         ecx
 00411DE9    pop         ecx
 00411DEA    mov         dword ptr fs:[eax],edx
>00411DED    jmp         00411E0A
>00411DEF    jmp         @HandleAnyException
 00411DF4    mov         eax,dword ptr [ebp-4]
 00411DF7    mov         ax,word ptr [eax]
 00411DFA    mov         dx,11
 00411DFE    call        HandleConversionException
 00411E03    xor         ebx,ebx
 00411E05    call        @DoneExcept
 00411E0A    mov         eax,ebx
 00411E0C    pop         edi
 00411E0D    pop         esi
 00411E0E    pop         ebx
 00411E0F    pop         ecx
 00411E10    pop         ebp
 00411E11    ret
*}
end;

//00411E14
function @VarToSmallInt(const V:TVarData):Smallint;
begin
{*
 00411E14    push        ebp
 00411E15    mov         ebp,esp
 00411E17    push        ecx
 00411E18    push        ebx
 00411E19    push        esi
 00411E1A    push        edi
 00411E1B    mov         dword ptr [ebp-4],eax
 00411E1E    mov         eax,dword ptr [ebp-4]
 00411E21    movzx       eax,word ptr [eax]
 00411E24    cmp         eax,11
>00411E27    ja          00411EAD
 00411E2D    mov         al,byte ptr [eax+411E3A]
 00411E33    jmp         dword ptr [eax*4+411E4C]
 00411E33    db          1
 00411E33    db          2
 00411E33    db          3
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          4
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          0
 00411E33    db          5
 00411E33    db          6
 00411E33    dd          00411EAD
 00411E33    dd          00411E68
 00411E33    dd          00411E6F
 00411E33    dd          00411E89
 00411E33    dd          00411E92
 00411E33    dd          00411E9B
 00411E33    dd          00411EA4
 00411E68    xor         ebx,ebx
>00411E6A    jmp         00411F03
 00411E6F    cmp         byte ptr ds:[5AC3AC],0
>00411E76    je          00411E85
 00411E78    mov         dx,2
 00411E7C    mov         ax,1
 00411E80    call        VarCastError
 00411E85    xor         ebx,ebx
>00411E87    jmp         00411F03
 00411E89    mov         ebx,dword ptr [ebp-4]
 00411E8C    mov         bx,word ptr [ebx+8]
>00411E90    jmp         00411F03
 00411E92    mov         ebx,dword ptr [ebp-4]
 00411E95    mov         bx,word ptr [ebx+8]
>00411E99    jmp         00411F03
 00411E9B    mov         ebx,dword ptr [ebp-4]
 00411E9E    movsx       ebx,byte ptr [ebx+8]
>00411EA2    jmp         00411F03
 00411EA4    mov         ebx,dword ptr [ebp-4]
 00411EA7    movzx       ebx,byte ptr [ebx+8]
>00411EAB    jmp         00411F03
 00411EAD    xor         eax,eax
 00411EAF    push        ebp
 00411EB0    push        411EE8
 00411EB5    push        dword ptr fs:[eax]
 00411EB8    mov         dword ptr fs:[eax],esp
 00411EBB    mov         eax,dword ptr [ebp-4]
 00411EBE    call        @VarToInteger
 00411EC3    mov         ebx,eax
 00411EC5    add         ebx,8000
 00411ECB    cmp         ebx,0FFFF
>00411ED1    jbe         00411ED8
 00411ED3    call        @BoundErr
 00411ED8    add         ebx,0FFFF8000
 00411EDE    xor         eax,eax
 00411EE0    pop         edx
 00411EE1    pop         ecx
 00411EE2    pop         ecx
 00411EE3    mov         dword ptr fs:[eax],edx
>00411EE6    jmp         00411F03
>00411EE8    jmp         @HandleAnyException
 00411EED    mov         eax,dword ptr [ebp-4]
 00411EF0    mov         ax,word ptr [eax]
 00411EF3    mov         dx,2
 00411EF7    call        HandleConversionException
 00411EFC    xor         ebx,ebx
 00411EFE    call        @DoneExcept
 00411F03    mov         eax,ebx
 00411F05    pop         edi
 00411F06    pop         esi
 00411F07    pop         ebx
 00411F08    pop         ecx
 00411F09    pop         ebp
 00411F0A    ret
*}
end;

//00411F0C
function @VarToWord(const V:TVarData):Word;
begin
{*
 00411F0C    push        ebp
 00411F0D    mov         ebp,esp
 00411F0F    push        ecx
 00411F10    push        ebx
 00411F11    push        esi
 00411F12    push        edi
 00411F13    mov         dword ptr [ebp-4],eax
 00411F16    mov         eax,dword ptr [ebp-4]
 00411F19    movzx       eax,word ptr [eax]
 00411F1C    cmp         eax,12
>00411F1F    ja          00411F92
 00411F21    mov         al,byte ptr [eax+411F2E]
 00411F27    jmp         dword ptr [eax*4+411F41]
 00411F27    db          1
 00411F27    db          2
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          3
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          0
 00411F27    db          4
 00411F27    db          5
 00411F27    dd          00411F92
 00411F27    dd          00411F59
 00411F27    dd          00411F5D
 00411F27    dd          00411F77
 00411F27    dd          00411F80
 00411F27    dd          00411F89
 00411F59    xor         ebx,ebx
>00411F5B    jmp         00411FDC
 00411F5D    cmp         byte ptr ds:[5AC3AC],0
>00411F64    je          00411F73
 00411F66    mov         dx,12
 00411F6A    mov         ax,1
 00411F6E    call        VarCastError
 00411F73    xor         ebx,ebx
>00411F75    jmp         00411FDC
 00411F77    mov         ebx,dword ptr [ebp-4]
 00411F7A    mov         bx,word ptr [ebx+8]
>00411F7E    jmp         00411FDC
 00411F80    mov         ebx,dword ptr [ebp-4]
 00411F83    movzx       ebx,byte ptr [ebx+8]
>00411F87    jmp         00411FDC
 00411F89    mov         ebx,dword ptr [ebp-4]
 00411F8C    mov         bx,word ptr [ebx+8]
>00411F90    jmp         00411FDC
 00411F92    xor         eax,eax
 00411F94    push        ebp
 00411F95    push        411FC1
 00411F9A    push        dword ptr fs:[eax]
 00411F9D    mov         dword ptr fs:[eax],esp
 00411FA0    mov         eax,dword ptr [ebp-4]
 00411FA3    call        @VarToInteger
 00411FA8    mov         ebx,eax
 00411FAA    cmp         ebx,0FFFF
>00411FB0    jbe         00411FB7
 00411FB2    call        @BoundErr
 00411FB7    xor         eax,eax
 00411FB9    pop         edx
 00411FBA    pop         ecx
 00411FBB    pop         ecx
 00411FBC    mov         dword ptr fs:[eax],edx
>00411FBF    jmp         00411FDC
>00411FC1    jmp         @HandleAnyException
 00411FC6    mov         eax,dword ptr [ebp-4]
 00411FC9    mov         ax,word ptr [eax]
 00411FCC    mov         dx,12
 00411FD0    call        HandleConversionException
 00411FD5    xor         ebx,ebx
 00411FD7    call        @DoneExcept
 00411FDC    mov         eax,ebx
 00411FDE    pop         edi
 00411FDF    pop         esi
 00411FE0    pop         ebx
 00411FE1    pop         ecx
 00411FE2    pop         ebp
 00411FE3    ret
*}
end;

//00411FE4
function @VarToLongWord(const V:TVarData):LongWord;
begin
{*
 00411FE4    push        ebp
 00411FE5    mov         ebp,esp
 00411FE7    push        ecx
 00411FE8    push        ebx
 00411FE9    push        esi
 00411FEA    push        edi
 00411FEB    mov         dword ptr [ebp-4],eax
 00411FEE    mov         eax,dword ptr [ebp-4]
 00411FF1    movzx       eax,word ptr [eax]
 00411FF4    cmp         eax,13
>00411FF7    ja          0041207E
 00411FFD    mov         al,byte ptr [eax+41200A]
 00412003    jmp         dword ptr [eax*4+41201E]
 00412003    db          1
 00412003    db          2
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          3
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          0
 00412003    db          4
 00412003    db          5
 00412003    db          6
 00412003    dd          0041207E
 00412003    dd          0041203A
 00412003    dd          00412041
 00412003    dd          0041205B
 00412003    dd          00412064
 00412003    dd          0041206D
 00412003    dd          00412076
 0041203A    xor         ebx,ebx
>0041203C    jmp         004120C4
 00412041    cmp         byte ptr ds:[5AC3AC],0
>00412048    je          00412057
 0041204A    mov         dx,13
 0041204E    mov         ax,1
 00412052    call        VarCastError
 00412057    xor         ebx,ebx
>00412059    jmp         004120C4
 0041205B    mov         ebx,dword ptr [ebp-4]
 0041205E    movsx       ebx,word ptr [ebx+8]
>00412062    jmp         004120C4
 00412064    mov         ebx,dword ptr [ebp-4]
 00412067    movzx       ebx,byte ptr [ebx+8]
>0041206B    jmp         004120C4
 0041206D    mov         ebx,dword ptr [ebp-4]
 00412070    movzx       ebx,word ptr [ebx+8]
>00412074    jmp         004120C4
 00412076    mov         ebx,dword ptr [ebp-4]
 00412079    mov         ebx,dword ptr [ebx+8]
>0041207C    jmp         004120C4
 0041207E    xor         eax,eax
 00412080    push        ebp
 00412081    push        4120A9
 00412086    push        dword ptr fs:[eax]
 00412089    mov         dword ptr fs:[eax],esp
 0041208C    mov         eax,dword ptr [ebp-4]
 0041208F    call        @VarToInt64
 00412094    test        edx,edx
>00412096    je          0041209D
 00412098    call        @BoundErr
 0041209D    mov         ebx,eax
 0041209F    xor         eax,eax
 004120A1    pop         edx
 004120A2    pop         ecx
 004120A3    pop         ecx
 004120A4    mov         dword ptr fs:[eax],edx
>004120A7    jmp         004120C4
>004120A9    jmp         @HandleAnyException
 004120AE    mov         eax,dword ptr [ebp-4]
 004120B1    mov         ax,word ptr [eax]
 004120B4    mov         dx,13
 004120B8    call        HandleConversionException
 004120BD    xor         ebx,ebx
 004120BF    call        @DoneExcept
 004120C4    mov         eax,ebx
 004120C6    pop         edi
 004120C7    pop         esi
 004120C8    pop         ebx
 004120C9    pop         ecx
 004120CA    pop         ebp
 004120CB    ret
*}
end;

//004120CC
function VarToInt64ViaOS(const V:TVarData):Int64;
begin
{*
 004120CC    push        ebx
 004120CD    add         esp,0FFFFFFE8
 004120D0    mov         ebx,eax
 004120D2    lea         eax,[esp+8]
 004120D6    push        eax
 004120D7    call        oleaut32.VariantInit
 004120DC    push        3
 004120DE    push        0
 004120E0    push        400
 004120E5    push        ebx
 004120E6    lea         eax,[esp+18]
 004120EA    push        eax
 004120EB    mov         eax,[005AE68C];^gvar_005E0870
 004120F0    mov         eax,dword ptr [eax]
 004120F2    call        eax
 004120F4    test        eax,eax
>004120F6    jne         00412106
 004120F8    mov         eax,dword ptr [esp+10]
 004120FC    cdq
 004120FD    mov         dword ptr [esp],eax
 00412100    mov         dword ptr [esp+4],edx
>00412104    jmp         0041216B
 00412106    push        5
 00412108    push        0
 0041210A    push        400
 0041210F    push        ebx
 00412110    lea         eax,[esp+18]
 00412114    push        eax
 00412115    mov         eax,[005AE68C];^gvar_005E0870
 0041211A    mov         eax,dword ptr [eax]
 0041211C    call        eax
 0041211E    test        eax,eax
>00412120    jne         00412134
 00412122    fld         qword ptr [esp+10]
 00412126    call        @ROUND
 0041212B    mov         dword ptr [esp],eax
 0041212E    mov         dword ptr [esp+4],edx
>00412132    jmp         0041216B
 00412134    cmp         eax,80020005
>00412139    jne         00412150
 0041213B    mov         eax,ebx
 0041213D    call        @VarToBoolean
 00412142    and         eax,7F
 00412145    xor         edx,edx
 00412147    mov         dword ptr [esp],eax
 0041214A    mov         dword ptr [esp+4],edx
>0041214E    jmp         0041216B
 00412150    mov         dx,word ptr [ebx]
 00412153    mov         cx,14
 00412157    call        VarResultCheck
 0041215C    mov         dword ptr [esp],0
 00412163    mov         dword ptr [esp+4],0
 0041216B    mov         eax,dword ptr [esp]
 0041216E    mov         edx,dword ptr [esp+4]
 00412172    add         esp,18
 00412175    pop         ebx
 00412176    ret
*}
end;

//00412178
function VarToInt64AsString(const V:TVarData):Int64;
begin
{*
 00412178    push        ebp
 00412179    mov         ebp,esp
 0041217B    add         esp,0FFFFFFE4
 0041217E    push        ebx
 0041217F    xor         edx,edx
 00412181    mov         dword ptr [ebp-1C],edx
 00412184    mov         dword ptr [ebp-0C],edx
 00412187    mov         ebx,eax
 00412189    xor         eax,eax
 0041218B    push        ebp
 0041218C    push        412266
 00412191    push        dword ptr fs:[eax]
 00412194    mov         dword ptr fs:[eax],esp
 00412197    mov         edx,ebx
 00412199    lea         eax,[ebp-0C]
 0041219C    call        @VarToWStr
 004121A1    lea         eax,[ebp-1C]
 004121A4    mov         edx,dword ptr [ebp-0C]
 004121A7    call        @LStrFromWStr
 004121AC    mov         eax,dword ptr [ebp-1C]
 004121AF    lea         edx,[ebp-8]
 004121B2    call        TryStrToInt64
 004121B7    test        al,al
>004121B9    jne         00412248
 004121BF    lea         eax,[ebp-10]
 004121C2    push        eax
 004121C3    push        0
 004121C5    push        400
 004121CA    mov         eax,dword ptr [ebp-0C]
 004121CD    push        eax
 004121CE    mov         eax,[005AE7A8];^gvar_005E08A4
 004121D3    mov         eax,dword ptr [eax]
 004121D5    call        eax
 004121D7    test        eax,eax
>004121D9    jne         004121E7
 004121DB    mov         eax,dword ptr [ebp-10]
 004121DE    cdq
 004121DF    mov         dword ptr [ebp-8],eax
 004121E2    mov         dword ptr [ebp-4],edx
>004121E5    jmp         00412248
 004121E7    lea         eax,[ebp-18]
 004121EA    push        eax
 004121EB    push        0
 004121ED    push        400
 004121F2    mov         eax,dword ptr [ebp-0C]
 004121F5    push        eax
 004121F6    mov         eax,[005AE500];^gvar_005E08AC
 004121FB    mov         eax,dword ptr [eax]
 004121FD    call        eax
 004121FF    test        eax,eax
>00412201    jne         00412213
 00412203    fld         qword ptr [ebp-18]
 00412206    call        @ROUND
 0041220B    mov         dword ptr [ebp-8],eax
 0041220E    mov         dword ptr [ebp-4],edx
>00412211    jmp         00412248
 00412213    cmp         eax,80020005
>00412218    jne         0041222E
 0041221A    mov         eax,ebx
 0041221C    call        @VarToBoolean
 00412221    and         eax,7F
 00412224    xor         edx,edx
 00412226    mov         dword ptr [ebp-8],eax
 00412229    mov         dword ptr [ebp-4],edx
>0041222C    jmp         00412248
 0041222E    mov         dx,word ptr [ebx]
 00412231    mov         cx,14
 00412235    call        VarResultCheck
 0041223A    mov         dword ptr [ebp-8],0
 00412241    mov         dword ptr [ebp-4],0
 00412248    xor         eax,eax
 0041224A    pop         edx
 0041224B    pop         ecx
 0041224C    pop         ecx
 0041224D    mov         dword ptr fs:[eax],edx
 00412250    push        41226D
 00412255    lea         eax,[ebp-1C]
 00412258    call        @LStrClr
 0041225D    lea         eax,[ebp-0C]
 00412260    call        @WStrClr
 00412265    ret
>00412266    jmp         @HandleFinally
>0041226B    jmp         00412255
 0041226D    mov         eax,dword ptr [ebp-8]
 00412270    mov         edx,dword ptr [ebp-4]
 00412273    pop         ebx
 00412274    mov         esp,ebp
 00412276    pop         ebp
 00412277    ret
*}
end;

//00412278
function VarToInt64Any(const V:TVarData):Int64;
begin
{*
 00412278    push        ebp
 00412279    mov         ebp,esp
 0041227B    add         esp,0FFFFFFE8
 0041227E    push        ebx
 0041227F    mov         ebx,eax
 00412281    lea         eax,[ebp-18]
 00412284    push        eax
 00412285    call        oleaut32.VariantInit
 0041228A    xor         eax,eax
 0041228C    push        ebp
 0041228D    push        4122CF
 00412292    push        dword ptr fs:[eax]
 00412295    mov         dword ptr fs:[eax],esp
 00412298    mov         edx,ebx
 0041229A    lea         eax,[ebp-18]
 0041229D    call        @VarCopy
 004122A2    lea         eax,[ebp-18]
 004122A5    call        dword ptr ds:[5E08E4]
 004122AB    lea         eax,[ebp-18]
 004122AE    call        @VarToInt64
 004122B3    mov         dword ptr [ebp-8],eax
 004122B6    mov         dword ptr [ebp-4],edx
 004122B9    xor         eax,eax
 004122BB    pop         edx
 004122BC    pop         ecx
 004122BD    pop         ecx
 004122BE    mov         dword ptr fs:[eax],edx
 004122C1    push        4122D6
 004122C6    lea         eax,[ebp-18]
 004122C9    call        @VarClear
 004122CE    ret
>004122CF    jmp         @HandleFinally
>004122D4    jmp         004122C6
 004122D6    mov         eax,dword ptr [ebp-8]
 004122D9    mov         edx,dword ptr [ebp-4]
 004122DC    pop         ebx
 004122DD    mov         esp,ebp
 004122DF    pop         ebp
 004122E0    ret
*}
end;

//004122E4
function VarToInt64Custom(const V:TVarData; var AValue:Int64):Boolean;
begin
{*
 004122E4    push        ebx
 004122E5    push        esi
 004122E6    push        edi
 004122E7    add         esp,0FFFFFFEC
 004122EA    mov         edi,edx
 004122EC    mov         esi,eax
 004122EE    mov         edx,esp
 004122F0    mov         ax,word ptr [esi]
 004122F3    call        FindCustomVariantType
 004122F8    mov         ebx,eax
 004122FA    test        bl,bl
>004122FC    je          00412326
 004122FE    lea         eax,[esp+4]
 00412302    push        eax
 00412303    call        oleaut32.VariantInit
 00412308    push        14
 0041230A    mov         ecx,esi
 0041230C    lea         edx,[esp+8]
 00412310    mov         eax,dword ptr [esp+4]
 00412314    mov         esi,dword ptr [eax]
 00412316    call        dword ptr [esi+1C]
 00412319    mov         eax,dword ptr [esp+0C]
 0041231D    mov         dword ptr [edi],eax
 0041231F    mov         eax,dword ptr [esp+10]
 00412323    mov         dword ptr [edi+4],eax
 00412326    mov         eax,ebx
 00412328    add         esp,14
 0041232B    pop         edi
 0041232C    pop         esi
 0041232D    pop         ebx
 0041232E    ret
*}
end;

//00412330
function @VarToInt64(const V:TVarData):Int64;
begin
{*
 00412330    push        ebp
 00412331    mov         ebp,esp
 00412333    add         esp,0FFFFFFF0
 00412336    push        ebx
 00412337    push        esi
 00412338    push        edi
 00412339    mov         dword ptr [ebp-4],eax
 0041233C    xor         edx,edx
 0041233E    push        ebp
 0041233F    push        41273C
 00412344    push        dword ptr fs:[edx]
 00412347    mov         dword ptr fs:[edx],esp
 0041234A    mov         eax,dword ptr [ebp-4]
 0041234D    mov         ax,word ptr [eax]
 00412350    movzx       edx,ax
 00412353    cmp         edx,14
>00412356    ja          00412527
 0041235C    jmp         dword ptr [edx*4+412363]
 0041235C    dd          004123B7
 0041235C    dd          004123CA
 0041235C    dd          004123F3
 0041235C    dd          00412406
 0041235C    dd          00412418
 0041235C    dd          0041242E
 0041235C    dd          00412444
 0041235C    dd          00412460
 0041235C    dd          00412476
 0041235C    dd          00412514
 0041235C    dd          00412527
 0041235C    dd          00412489
 0041235C    dd          004124FE
 0041235C    dd          00412514
 0041235C    dd          00412527
 0041235C    dd          00412527
 0041235C    dd          0041249C
 0041235C    dd          004124AF
 0041235C    dd          004124C3
 0041235C    dd          004124D7
 0041235C    dd          004124EA
 004123B7    mov         dword ptr [ebp-10],0
 004123BE    mov         dword ptr [ebp-0C],0
>004123C5    jmp         00412732
 004123CA    cmp         byte ptr ds:[5AC3AC],0
>004123D1    je          004123E0
 004123D3    mov         dx,14
 004123D7    mov         ax,1
 004123DB    call        VarCastError
 004123E0    mov         dword ptr [ebp-10],0
 004123E7    mov         dword ptr [ebp-0C],0
>004123EE    jmp         00412732
 004123F3    mov         eax,dword ptr [ebp-4]
 004123F6    movsx       eax,word ptr [eax+8]
 004123FA    cdq
 004123FB    mov         dword ptr [ebp-10],eax
 004123FE    mov         dword ptr [ebp-0C],edx
>00412401    jmp         00412732
 00412406    mov         eax,dword ptr [ebp-4]
 00412409    mov         eax,dword ptr [eax+8]
 0041240C    cdq
 0041240D    mov         dword ptr [ebp-10],eax
 00412410    mov         dword ptr [ebp-0C],edx
>00412413    jmp         00412732
 00412418    mov         eax,dword ptr [ebp-4]
 0041241B    fld         dword ptr [eax+8]
 0041241E    call        @ROUND
 00412423    mov         dword ptr [ebp-10],eax
 00412426    mov         dword ptr [ebp-0C],edx
>00412429    jmp         00412732
 0041242E    mov         eax,dword ptr [ebp-4]
 00412431    fld         qword ptr [eax+8]
 00412434    call        @ROUND
 00412439    mov         dword ptr [ebp-10],eax
 0041243C    mov         dword ptr [ebp-0C],edx
>0041243F    jmp         00412732
 00412444    mov         eax,dword ptr [ebp-4]
 00412447    fild        qword ptr [eax+8]
 0041244A    fdiv        dword ptr ds:[412770]
 00412450    call        @ROUND
 00412455    mov         dword ptr [ebp-10],eax
 00412458    mov         dword ptr [ebp-0C],edx
>0041245B    jmp         00412732
 00412460    mov         eax,dword ptr [ebp-4]
 00412463    fld         qword ptr [eax+8]
 00412466    call        @ROUND
 0041246B    mov         dword ptr [ebp-10],eax
 0041246E    mov         dword ptr [ebp-0C],edx
>00412471    jmp         00412732
 00412476    mov         eax,dword ptr [ebp-4]
 00412479    call        VarToInt64AsString
 0041247E    mov         dword ptr [ebp-10],eax
 00412481    mov         dword ptr [ebp-0C],edx
>00412484    jmp         00412732
 00412489    mov         eax,dword ptr [ebp-4]
 0041248C    movsx       eax,word ptr [eax+8]
 00412490    cdq
 00412491    mov         dword ptr [ebp-10],eax
 00412494    mov         dword ptr [ebp-0C],edx
>00412497    jmp         00412732
 0041249C    mov         eax,dword ptr [ebp-4]
 0041249F    movsx       eax,byte ptr [eax+8]
 004124A3    cdq
 004124A4    mov         dword ptr [ebp-10],eax
 004124A7    mov         dword ptr [ebp-0C],edx
>004124AA    jmp         00412732
 004124AF    mov         eax,dword ptr [ebp-4]
 004124B2    movzx       eax,byte ptr [eax+8]
 004124B6    xor         edx,edx
 004124B8    mov         dword ptr [ebp-10],eax
 004124BB    mov         dword ptr [ebp-0C],edx
>004124BE    jmp         00412732
 004124C3    mov         eax,dword ptr [ebp-4]
 004124C6    movzx       eax,word ptr [eax+8]
 004124CA    xor         edx,edx
 004124CC    mov         dword ptr [ebp-10],eax
 004124CF    mov         dword ptr [ebp-0C],edx
>004124D2    jmp         00412732
 004124D7    mov         eax,dword ptr [ebp-4]
 004124DA    mov         eax,dword ptr [eax+8]
 004124DD    xor         edx,edx
 004124DF    mov         dword ptr [ebp-10],eax
 004124E2    mov         dword ptr [ebp-0C],edx
>004124E5    jmp         00412732
 004124EA    mov         eax,dword ptr [ebp-4]
 004124ED    mov         edx,dword ptr [eax+8]
 004124F0    mov         dword ptr [ebp-10],edx
 004124F3    mov         edx,dword ptr [eax+0C]
 004124F6    mov         dword ptr [ebp-0C],edx
>004124F9    jmp         00412732
 004124FE    mov         eax,dword ptr [ebp-4]
 00412501    mov         eax,dword ptr [eax+8]
 00412504    call        @VarToInt64
 00412509    mov         dword ptr [ebp-10],eax
 0041250C    mov         dword ptr [ebp-0C],edx
>0041250F    jmp         00412732
 00412514    mov         eax,dword ptr [ebp-4]
 00412517    call        VarToInt64ViaOS
 0041251C    mov         dword ptr [ebp-10],eax
 0041251F    mov         dword ptr [ebp-0C],edx
>00412522    jmp         00412732
 00412527    mov         edx,dword ptr [ebp-4]
 0041252A    mov         edx,eax
 0041252C    sub         dx,100
>00412531    je          0041253A
 00412533    dec         dx
>00412536    je          0041254D
>00412538    jmp         00412560
 0041253A    mov         eax,dword ptr [ebp-4]
 0041253D    call        VarToInt64AsString
 00412542    mov         dword ptr [ebp-10],eax
 00412545    mov         dword ptr [ebp-0C],edx
>00412548    jmp         00412732
 0041254D    mov         eax,dword ptr [ebp-4]
 00412550    call        VarToInt64Any
 00412555    mov         dword ptr [ebp-10],eax
 00412558    mov         dword ptr [ebp-0C],edx
>0041255B    jmp         00412732
 00412560    mov         edx,dword ptr [ebp-4]
 00412563    test        ah,40
>00412566    je          00412715
 0041256C    mov         edx,dword ptr [ebp-4]
 0041256F    movzx       eax,ax
 00412572    and         eax,0FFFFBFFF
 00412577    cmp         eax,14
>0041257A    ja          00412705
 00412580    jmp         dword ptr [eax*4+412587]
 00412580    dd          00412705
 00412580    dd          00412705
 00412580    dd          004125DB
 00412580    dd          004125F0
 00412580    dd          00412604
 00412580    dd          0041261C
 00412580    dd          00412634
 00412580    dd          00412652
 00412580    dd          0041266A
 00412580    dd          00412705
 00412580    dd          00412705
 00412580    dd          0041267D
 00412580    dd          004126F2
 00412580    dd          00412705
 00412580    dd          00412705
 00412580    dd          00412705
 00412580    dd          00412692
 00412580    dd          004126A7
 00412580    dd          004126BA
 00412580    dd          004126CD
 00412580    dd          004126DF
 004125DB    mov         eax,dword ptr [ebp-4]
 004125DE    mov         eax,dword ptr [eax+8]
 004125E1    movsx       eax,word ptr [eax]
 004125E4    cdq
 004125E5    mov         dword ptr [ebp-10],eax
 004125E8    mov         dword ptr [ebp-0C],edx
>004125EB    jmp         00412732
 004125F0    mov         eax,dword ptr [ebp-4]
 004125F3    mov         eax,dword ptr [eax+8]
 004125F6    mov         eax,dword ptr [eax]
 004125F8    cdq
 004125F9    mov         dword ptr [ebp-10],eax
 004125FC    mov         dword ptr [ebp-0C],edx
>004125FF    jmp         00412732
 00412604    mov         eax,dword ptr [ebp-4]
 00412607    mov         eax,dword ptr [eax+8]
 0041260A    fld         dword ptr [eax]
 0041260C    call        @ROUND
 00412611    mov         dword ptr [ebp-10],eax
 00412614    mov         dword ptr [ebp-0C],edx
>00412617    jmp         00412732
 0041261C    mov         eax,dword ptr [ebp-4]
 0041261F    mov         eax,dword ptr [eax+8]
 00412622    fld         qword ptr [eax]
 00412624    call        @ROUND
 00412629    mov         dword ptr [ebp-10],eax
 0041262C    mov         dword ptr [ebp-0C],edx
>0041262F    jmp         00412732
 00412634    mov         eax,dword ptr [ebp-4]
 00412637    mov         eax,dword ptr [eax+8]
 0041263A    fild        qword ptr [eax]
 0041263C    fdiv        dword ptr ds:[412770]
 00412642    call        @ROUND
 00412647    mov         dword ptr [ebp-10],eax
 0041264A    mov         dword ptr [ebp-0C],edx
>0041264D    jmp         00412732
 00412652    mov         eax,dword ptr [ebp-4]
 00412655    mov         eax,dword ptr [eax+8]
 00412658    fld         qword ptr [eax]
 0041265A    call        @ROUND
 0041265F    mov         dword ptr [ebp-10],eax
 00412662    mov         dword ptr [ebp-0C],edx
>00412665    jmp         00412732
 0041266A    mov         eax,dword ptr [ebp-4]
 0041266D    call        VarToInt64AsString
 00412672    mov         dword ptr [ebp-10],eax
 00412675    mov         dword ptr [ebp-0C],edx
>00412678    jmp         00412732
 0041267D    mov         eax,dword ptr [ebp-4]
 00412680    mov         eax,dword ptr [eax+8]
 00412683    movsx       eax,word ptr [eax]
 00412686    cdq
 00412687    mov         dword ptr [ebp-10],eax
 0041268A    mov         dword ptr [ebp-0C],edx
>0041268D    jmp         00412732
 00412692    mov         eax,dword ptr [ebp-4]
 00412695    mov         eax,dword ptr [eax+8]
 00412698    movsx       eax,byte ptr [eax]
 0041269B    cdq
 0041269C    mov         dword ptr [ebp-10],eax
 0041269F    mov         dword ptr [ebp-0C],edx
>004126A2    jmp         00412732
 004126A7    mov         eax,dword ptr [ebp-4]
 004126AA    mov         eax,dword ptr [eax+8]
 004126AD    movzx       eax,byte ptr [eax]
 004126B0    xor         edx,edx
 004126B2    mov         dword ptr [ebp-10],eax
 004126B5    mov         dword ptr [ebp-0C],edx
>004126B8    jmp         00412732
 004126BA    mov         eax,dword ptr [ebp-4]
 004126BD    mov         eax,dword ptr [eax+8]
 004126C0    movzx       eax,word ptr [eax]
 004126C3    xor         edx,edx
 004126C5    mov         dword ptr [ebp-10],eax
 004126C8    mov         dword ptr [ebp-0C],edx
>004126CB    jmp         00412732
 004126CD    mov         eax,dword ptr [ebp-4]
 004126D0    mov         eax,dword ptr [eax+8]
 004126D3    mov         eax,dword ptr [eax]
 004126D5    xor         edx,edx
 004126D7    mov         dword ptr [ebp-10],eax
 004126DA    mov         dword ptr [ebp-0C],edx
>004126DD    jmp         00412732
 004126DF    mov         eax,dword ptr [ebp-4]
 004126E2    mov         eax,dword ptr [eax+8]
 004126E5    mov         edx,dword ptr [eax]
 004126E7    mov         dword ptr [ebp-10],edx
 004126EA    mov         edx,dword ptr [eax+4]
 004126ED    mov         dword ptr [ebp-0C],edx
>004126F0    jmp         00412732
 004126F2    mov         eax,dword ptr [ebp-4]
 004126F5    mov         eax,dword ptr [eax+8]
 004126F8    call        @VarToInt64
 004126FD    mov         dword ptr [ebp-10],eax
 00412700    mov         dword ptr [ebp-0C],edx
>00412703    jmp         00412732
 00412705    mov         eax,dword ptr [ebp-4]
 00412708    call        VarToInt64ViaOS
 0041270D    mov         dword ptr [ebp-10],eax
 00412710    mov         dword ptr [ebp-0C],edx
>00412713    jmp         00412732
 00412715    lea         edx,[ebp-10]
 00412718    mov         eax,dword ptr [ebp-4]
 0041271B    call        VarToInt64Custom
 00412720    test        al,al
>00412722    jne         00412732
 00412724    mov         eax,dword ptr [ebp-4]
 00412727    call        VarToInt64ViaOS
 0041272C    mov         dword ptr [ebp-10],eax
 0041272F    mov         dword ptr [ebp-0C],edx
 00412732    xor         eax,eax
 00412734    pop         edx
 00412735    pop         ecx
 00412736    pop         ecx
 00412737    mov         dword ptr fs:[eax],edx
>0041273A    jmp         00412763
>0041273C    jmp         @HandleAnyException
 00412741    mov         eax,dword ptr [ebp-4]
 00412744    mov         ax,word ptr [eax]
 00412747    mov         dx,14
 0041274B    call        HandleConversionException
 00412750    mov         dword ptr [ebp-10],0
 00412757    mov         dword ptr [ebp-0C],0
 0041275E    call        @DoneExcept
 00412763    mov         eax,dword ptr [ebp-10]
 00412766    mov         edx,dword ptr [ebp-0C]
 00412769    pop         edi
 0041276A    pop         esi
 0041276B    pop         ebx
 0041276C    mov         esp,ebp
 0041276E    pop         ebp
 0041276F    ret
*}
end;

//00412774
function VarToBoolAsString(const V:TVarData):Boolean;
begin
{*
 00412774    push        ebp
 00412775    mov         ebp,esp
 00412777    add         esp,0FFFFFFF0
 0041277A    push        ebx
 0041277B    xor         edx,edx
 0041277D    mov         dword ptr [ebp-10],edx
 00412780    mov         dword ptr [ebp-8],edx
 00412783    mov         ebx,eax
 00412785    xor         eax,eax
 00412787    push        ebp
 00412788    push        41282B
 0041278D    push        dword ptr fs:[eax]
 00412790    mov         dword ptr fs:[eax],esp
 00412793    mov         edx,ebx
 00412795    lea         eax,[ebp-8]
 00412798    call        @VarToWStr
 0041279D    lea         eax,[ebp-0A]
 004127A0    push        eax
 004127A1    push        0
 004127A3    push        400
 004127A8    mov         eax,dword ptr [ebp-8]
 004127AB    push        eax
 004127AC    mov         eax,[005AE480];^gvar_005E08B8
 004127B1    mov         eax,dword ptr [eax]
 004127B3    call        eax
 004127B5    mov         edx,eax
 004127B7    sub         edx,80020005
>004127BD    je          004127D4
 004127BF    sub         edx,7FFDFFFB
>004127C5    jne         00412801
 004127C7    cmp         word ptr [ebp-0A],1
 004127CC    sbb         eax,eax
 004127CE    inc         eax
 004127CF    mov         byte ptr [ebp-1],al
>004127D2    jmp         0041280D
 004127D4    lea         eax,[ebp-10]
 004127D7    mov         edx,dword ptr [ebp-8]
 004127DA    call        @LStrFromWStr
 004127DF    mov         eax,dword ptr [ebp-10]
 004127E2    lea         edx,[ebp-1]
 004127E5    call        TryStrToBool
 004127EA    test        al,al
>004127EC    jne         0041280D
 004127EE    mov         dx,word ptr [ebx]
 004127F1    mov         cx,0B
 004127F5    mov         eax,80020005
 004127FA    call        VarResultCheck
>004127FF    jmp         0041280D
 00412801    mov         dx,word ptr [ebx]
 00412804    mov         cx,0B
 00412808    call        VarResultCheck
 0041280D    xor         eax,eax
 0041280F    pop         edx
 00412810    pop         ecx
 00412811    pop         ecx
 00412812    mov         dword ptr fs:[eax],edx
 00412815    push        412832
 0041281A    lea         eax,[ebp-10]
 0041281D    call        @LStrClr
 00412822    lea         eax,[ebp-8]
 00412825    call        @WStrClr
 0041282A    ret
>0041282B    jmp         @HandleFinally
>00412830    jmp         0041281A
 00412832    mov         al,byte ptr [ebp-1]
 00412835    pop         ebx
 00412836    mov         esp,ebp
 00412838    pop         ebp
 00412839    ret
*}
end;

//0041283C
function VarToBoolViaOS(const V:TVarData):Boolean;
begin
{*
 0041283C    push        ebx
 0041283D    add         esp,0FFFFFFF0
 00412840    mov         ebx,eax
 00412842    push        esp
 00412843    call        oleaut32.VariantInit
 00412848    push        0B
 0041284A    push        0
 0041284C    push        400
 00412851    push        ebx
 00412852    lea         eax,[esp+10]
 00412856    push        eax
 00412857    mov         eax,[005AE68C];^gvar_005E0870
 0041285C    mov         eax,dword ptr [eax]
 0041285E    call        eax
 00412860    mov         dx,word ptr [ebx]
 00412863    mov         cx,0B
 00412867    call        VarResultCheck
 0041286C    cmp         word ptr [esp+8],1
 00412872    sbb         eax,eax
 00412874    inc         eax
 00412875    add         esp,10
 00412878    pop         ebx
 00412879    ret
*}
end;

//0041287C
function VarToBoolAny(const V:TVarData):Boolean;
begin
{*
 0041287C    push        ebp
 0041287D    mov         ebp,esp
 0041287F    add         esp,0FFFFFFEC
 00412882    push        ebx
 00412883    mov         ebx,eax
 00412885    lea         eax,[ebp-11]
 00412888    push        eax
 00412889    call        oleaut32.VariantInit
 0041288E    xor         eax,eax
 00412890    push        ebp
 00412891    push        4128D0
 00412896    push        dword ptr fs:[eax]
 00412899    mov         dword ptr fs:[eax],esp
 0041289C    mov         edx,ebx
 0041289E    lea         eax,[ebp-11]
 004128A1    call        @VarCopy
 004128A6    lea         eax,[ebp-11]
 004128A9    call        dword ptr ds:[5E08E4]
 004128AF    lea         eax,[ebp-11]
 004128B2    call        @VarToBoolean
 004128B7    mov         byte ptr [ebp-1],al
 004128BA    xor         eax,eax
 004128BC    pop         edx
 004128BD    pop         ecx
 004128BE    pop         ecx
 004128BF    mov         dword ptr fs:[eax],edx
 004128C2    push        4128D7
 004128C7    lea         eax,[ebp-11]
 004128CA    call        @VarClear
 004128CF    ret
>004128D0    jmp         @HandleFinally
>004128D5    jmp         004128C7
 004128D7    mov         al,byte ptr [ebp-1]
 004128DA    pop         ebx
 004128DB    mov         esp,ebp
 004128DD    pop         ebp
 004128DE    ret
*}
end;

//004128E0
function VarToBoolCustom(const V:TVarData; var AValue:Boolean):Boolean;
begin
{*
 004128E0    push        ebx
 004128E1    push        esi
 004128E2    push        edi
 004128E3    add         esp,0FFFFFFEC
 004128E6    mov         edi,edx
 004128E8    mov         esi,eax
 004128EA    mov         edx,esp
 004128EC    mov         ax,word ptr [esi]
 004128EF    call        FindCustomVariantType
 004128F4    mov         ebx,eax
 004128F6    test        bl,bl
>004128F8    je          00412920
 004128FA    lea         eax,[esp+4]
 004128FE    push        eax
 004128FF    call        oleaut32.VariantInit
 00412904    push        0B
 00412906    mov         ecx,esi
 00412908    lea         edx,[esp+8]
 0041290C    mov         eax,dword ptr [esp+4]
 00412910    mov         esi,dword ptr [eax]
 00412912    call        dword ptr [esi+1C]
 00412915    cmp         word ptr [esp+0C],1
 0041291B    sbb         eax,eax
 0041291D    inc         eax
 0041291E    mov         byte ptr [edi],al
 00412920    mov         eax,ebx
 00412922    add         esp,14
 00412925    pop         edi
 00412926    pop         esi
 00412927    pop         ebx
 00412928    ret
*}
end;

//0041292C
function @VarToBoolean(const V:TVarData):Boolean;
begin
{*
 0041292C    push        ebx
 0041292D    push        ecx
 0041292E    mov         ebx,eax
 00412930    mov         ax,word ptr [ebx]
 00412933    movzx       edx,ax
 00412936    cmp         edx,14
>00412939    ja          00412AB9
 0041293F    jmp         dword ptr [edx*4+412946]
 0041293F    dd          0041299A
 0041293F    dd          004129A3
 0041293F    dd          004129C2
 0041293F    dd          004129D0
 0041293F    dd          004129DD
 0041293F    dd          004129F2
 0041293F    dd          00412A07
 0041293F    dd          00412A1C
 0041293F    dd          00412A31
 0041293F    dd          00412AAA
 0041293F    dd          00412AB9
 0041293F    dd          00412A40
 0041293F    dd          00412A9A
 0041293F    dd          00412AAA
 0041293F    dd          00412AB9
 0041293F    dd          00412AB9
 0041293F    dd          00412A50
 0041293F    dd          00412A5D
 0041293F    dd          00412A6A
 0041293F    dd          00412A78
 0041293F    dd          00412A85
 0041299A    mov         byte ptr [esp],0
>0041299E    jmp         00412C6A
 004129A3    cmp         byte ptr ds:[5AC3AC],0
>004129AA    je          004129B9
 004129AC    mov         dx,0B
 004129B0    mov         ax,1
 004129B4    call        VarCastError
 004129B9    mov         byte ptr [esp],0
>004129BD    jmp         00412C6A
 004129C2    cmp         word ptr [ebx+8],0
 004129C7    setne       byte ptr [esp]
>004129CB    jmp         00412C6A
 004129D0    cmp         dword ptr [ebx+8],0
 004129D4    setne       byte ptr [esp]
>004129D8    jmp         00412C6A
 004129DD    fld         dword ptr [ebx+8]
 004129E0    fcomp       dword ptr ds:[412C70]
 004129E6    fnstsw      al
 004129E8    sahf
 004129E9    setne       byte ptr [esp]
>004129ED    jmp         00412C6A
 004129F2    fld         qword ptr [ebx+8]
 004129F5    fcomp       dword ptr ds:[412C70]
 004129FB    fnstsw      al
 004129FD    sahf
 004129FE    setne       byte ptr [esp]
>00412A02    jmp         00412C6A
 00412A07    fild        qword ptr [ebx+8]
 00412A0A    fcomp       dword ptr ds:[412C70]
 00412A10    fnstsw      al
 00412A12    sahf
 00412A13    setne       byte ptr [esp]
>00412A17    jmp         00412C6A
 00412A1C    fld         qword ptr [ebx+8]
 00412A1F    fcomp       dword ptr ds:[412C70]
 00412A25    fnstsw      al
 00412A27    sahf
 00412A28    setne       byte ptr [esp]
>00412A2C    jmp         00412C6A
 00412A31    mov         eax,ebx
 00412A33    call        VarToBoolAsString
 00412A38    mov         byte ptr [esp],al
>00412A3B    jmp         00412C6A
 00412A40    cmp         word ptr [ebx+8],1
 00412A45    sbb         eax,eax
 00412A47    inc         eax
 00412A48    mov         byte ptr [esp],al
>00412A4B    jmp         00412C6A
 00412A50    cmp         byte ptr [ebx+8],0
 00412A54    setne       byte ptr [esp]
>00412A58    jmp         00412C6A
 00412A5D    cmp         byte ptr [ebx+8],0
 00412A61    setne       byte ptr [esp]
>00412A65    jmp         00412C6A
 00412A6A    cmp         word ptr [ebx+8],0
 00412A6F    setne       byte ptr [esp]
>00412A73    jmp         00412C6A
 00412A78    cmp         dword ptr [ebx+8],0
 00412A7C    setne       byte ptr [esp]
>00412A80    jmp         00412C6A
 00412A85    cmp         dword ptr [ebx+0C],0
>00412A89    jne         00412A8F
 00412A8B    cmp         dword ptr [ebx+8],0
 00412A8F    setne       al
 00412A92    mov         byte ptr [esp],al
>00412A95    jmp         00412C6A
 00412A9A    mov         eax,dword ptr [ebx+8]
 00412A9D    call        @VarToBoolean
 00412AA2    mov         byte ptr [esp],al
>00412AA5    jmp         00412C6A
 00412AAA    mov         eax,ebx
 00412AAC    call        VarToBoolViaOS
 00412AB1    mov         byte ptr [esp],al
>00412AB4    jmp         00412C6A
 00412AB9    mov         edx,eax
 00412ABB    sub         dx,100
>00412AC0    je          00412AC9
 00412AC2    dec         dx
>00412AC5    je          00412AD8
>00412AC7    jmp         00412AE7
 00412AC9    mov         eax,ebx
 00412ACB    call        VarToBoolAsString
 00412AD0    mov         byte ptr [esp],al
>00412AD3    jmp         00412C6A
 00412AD8    mov         eax,ebx
 00412ADA    call        VarToBoolAny
 00412ADF    mov         byte ptr [esp],al
>00412AE2    jmp         00412C6A
 00412AE7    test        ah,40
>00412AEA    je          00412C53
 00412AF0    movzx       eax,ax
 00412AF3    and         eax,0FFFFBFFF
 00412AF8    cmp         eax,14
>00412AFB    ja          00412C47
 00412B01    jmp         dword ptr [eax*4+412B08]
 00412B01    dd          00412C47
 00412B01    dd          00412C47
 00412B01    dd          00412B5C
 00412B01    dd          00412B6C
 00412B01    dd          00412B7B
 00412B01    dd          00412B92
 00412B01    dd          00412BA9
 00412B01    dd          00412BC0
 00412B01    dd          00412BD7
 00412B01    dd          00412C47
 00412B01    dd          00412C47
 00412B01    dd          00412BE6
 00412B01    dd          00412C3A
 00412B01    dd          00412C47
 00412B01    dd          00412C47
 00412B01    dd          00412C47
 00412B01    dd          00412BF5
 00412B01    dd          00412C01
 00412B01    dd          00412C0D
 00412B01    dd          00412C1A
 00412B01    dd          00412C26
 00412B5C    mov         eax,dword ptr [ebx+8]
 00412B5F    cmp         word ptr [eax],0
 00412B63    setne       byte ptr [esp]
>00412B67    jmp         00412C6A
 00412B6C    mov         eax,dword ptr [ebx+8]
 00412B6F    cmp         dword ptr [eax],0
 00412B72    setne       byte ptr [esp]
>00412B76    jmp         00412C6A
 00412B7B    mov         eax,dword ptr [ebx+8]
 00412B7E    fld         dword ptr [eax]
 00412B80    fcomp       dword ptr ds:[412C70]
 00412B86    fnstsw      al
 00412B88    sahf
 00412B89    setne       byte ptr [esp]
>00412B8D    jmp         00412C6A
 00412B92    mov         eax,dword ptr [ebx+8]
 00412B95    fld         qword ptr [eax]
 00412B97    fcomp       dword ptr ds:[412C70]
 00412B9D    fnstsw      al
 00412B9F    sahf
 00412BA0    setne       byte ptr [esp]
>00412BA4    jmp         00412C6A
 00412BA9    mov         eax,dword ptr [ebx+8]
 00412BAC    fild        qword ptr [eax]
 00412BAE    fcomp       dword ptr ds:[412C70]
 00412BB4    fnstsw      al
 00412BB6    sahf
 00412BB7    setne       byte ptr [esp]
>00412BBB    jmp         00412C6A
 00412BC0    mov         eax,dword ptr [ebx+8]
 00412BC3    fld         qword ptr [eax]
 00412BC5    fcomp       dword ptr ds:[412C70]
 00412BCB    fnstsw      al
 00412BCD    sahf
 00412BCE    setne       byte ptr [esp]
>00412BD2    jmp         00412C6A
 00412BD7    mov         eax,ebx
 00412BD9    call        VarToBoolAsString
 00412BDE    mov         byte ptr [esp],al
>00412BE1    jmp         00412C6A
 00412BE6    mov         eax,dword ptr [ebx+8]
 00412BE9    cmp         word ptr [eax],1
 00412BED    sbb         eax,eax
 00412BEF    inc         eax
 00412BF0    mov         byte ptr [esp],al
>00412BF3    jmp         00412C6A
 00412BF5    mov         eax,dword ptr [ebx+8]
 00412BF8    cmp         byte ptr [eax],0
 00412BFB    setne       byte ptr [esp]
>00412BFF    jmp         00412C6A
 00412C01    mov         eax,dword ptr [ebx+8]
 00412C04    cmp         byte ptr [eax],0
 00412C07    setne       byte ptr [esp]
>00412C0B    jmp         00412C6A
 00412C0D    mov         eax,dword ptr [ebx+8]
 00412C10    cmp         word ptr [eax],0
 00412C14    setne       byte ptr [esp]
>00412C18    jmp         00412C6A
 00412C1A    mov         eax,dword ptr [ebx+8]
 00412C1D    cmp         dword ptr [eax],0
 00412C20    setne       byte ptr [esp]
>00412C24    jmp         00412C6A
 00412C26    mov         eax,dword ptr [ebx+8]
 00412C29    cmp         dword ptr [eax+4],0
>00412C2D    jne         00412C32
 00412C2F    cmp         dword ptr [eax],0
 00412C32    setne       al
 00412C35    mov         byte ptr [esp],al
>00412C38    jmp         00412C6A
 00412C3A    mov         eax,dword ptr [ebx+8]
 00412C3D    call        @VarToBoolean
 00412C42    mov         byte ptr [esp],al
>00412C45    jmp         00412C6A
 00412C47    mov         eax,ebx
 00412C49    call        VarToBoolViaOS
 00412C4E    mov         byte ptr [esp],al
>00412C51    jmp         00412C6A
 00412C53    mov         edx,esp
 00412C55    mov         eax,ebx
 00412C57    call        VarToBoolCustom
 00412C5C    test        al,al
>00412C5E    jne         00412C6A
 00412C60    mov         eax,ebx
 00412C62    call        VarToBoolViaOS
 00412C67    mov         byte ptr [esp],al
 00412C6A    mov         al,byte ptr [esp]
 00412C6D    pop         edx
 00412C6E    pop         ebx
 00412C6F    ret
*}
end;

//00412C74
function @VarToBool(const V:TVarData):LongBool;
begin
{*
 00412C74    call        @VarToBoolean
 00412C79    neg         al
 00412C7B    sbb         eax,eax
 00412C7D    neg         eax
 00412C7F    ret
*}
end;

//00412C80
function VarToDoubleAsString(const V:TVarData):Double;
begin
{*
 00412C80    push        ebp
 00412C81    mov         ebp,esp
 00412C83    add         esp,0FFFFFFE4
 00412C86    push        ebx
 00412C87    xor         edx,edx
 00412C89    mov         dword ptr [ebp-1C],edx
 00412C8C    mov         dword ptr [ebp-0C],edx
 00412C8F    mov         ebx,eax
 00412C91    xor         eax,eax
 00412C93    push        ebp
 00412C94    push        412D35
 00412C99    push        dword ptr fs:[eax]
 00412C9C    mov         dword ptr fs:[eax],esp
 00412C9F    mov         edx,ebx
 00412CA1    lea         eax,[ebp-0C]
 00412CA4    call        @VarToWStr
 00412CA9    lea         eax,[ebp-8]
 00412CAC    push        eax
 00412CAD    push        0
 00412CAF    push        400
 00412CB4    mov         eax,dword ptr [ebp-0C]
 00412CB7    push        eax
 00412CB8    mov         eax,[005AE500];^gvar_005E08AC
 00412CBD    mov         eax,dword ptr [eax]
 00412CBF    call        eax
 00412CC1    mov         edx,eax
 00412CC3    sub         edx,80020005
>00412CC9    je          00412CD5
 00412CCB    sub         edx,7FFDFFFB
>00412CD1    jne         00412D0B
>00412CD3    jmp         00412D17
 00412CD5    lea         eax,[ebp-1C]
 00412CD8    mov         edx,dword ptr [ebp-0C]
 00412CDB    call        @LStrFromWStr
 00412CE0    mov         eax,dword ptr [ebp-1C]
 00412CE3    lea         edx,[ebp-18]
 00412CE6    call        TryStrToFloat
 00412CEB    test        al,al
>00412CED    je          00412CF8
 00412CEF    fld         tbyte ptr [ebp-18]
 00412CF2    fstp        qword ptr [ebp-8]
 00412CF5    wait
>00412CF6    jmp         00412D17
 00412CF8    mov         dx,word ptr [ebx]
 00412CFB    mov         cx,5
 00412CFF    mov         eax,80020005
 00412D04    call        VarResultCheck
>00412D09    jmp         00412D17
 00412D0B    mov         dx,word ptr [ebx]
 00412D0E    mov         cx,5
 00412D12    call        VarResultCheck
 00412D17    xor         eax,eax
 00412D19    pop         edx
 00412D1A    pop         ecx
 00412D1B    pop         ecx
 00412D1C    mov         dword ptr fs:[eax],edx
 00412D1F    push        412D3C
 00412D24    lea         eax,[ebp-1C]
 00412D27    call        @LStrClr
 00412D2C    lea         eax,[ebp-0C]
 00412D2F    call        @WStrClr
 00412D34    ret
>00412D35    jmp         @HandleFinally
>00412D3A    jmp         00412D24
 00412D3C    fld         qword ptr [ebp-8]
 00412D3F    pop         ebx
 00412D40    mov         esp,ebp
 00412D42    pop         ebp
 00412D43    ret
*}
end;

//00412D44
function VarToDoubleViaOS(const V:TVarData):Double;
begin
{*
 00412D44    push        ebx
 00412D45    add         esp,0FFFFFFE8
 00412D48    mov         ebx,eax
 00412D4A    lea         eax,[esp+8]
 00412D4E    push        eax
 00412D4F    call        oleaut32.VariantInit
 00412D54    push        5
 00412D56    push        0
 00412D58    push        400
 00412D5D    push        ebx
 00412D5E    lea         eax,[esp+18]
 00412D62    push        eax
 00412D63    mov         eax,[005AE68C];^gvar_005E0870
 00412D68    mov         eax,dword ptr [eax]
 00412D6A    call        eax
 00412D6C    mov         dx,word ptr [ebx]
 00412D6F    mov         cx,5
 00412D73    call        VarResultCheck
 00412D78    mov         eax,dword ptr [esp+10]
 00412D7C    mov         dword ptr [esp],eax
 00412D7F    mov         eax,dword ptr [esp+14]
 00412D83    mov         dword ptr [esp+4],eax
 00412D87    fld         qword ptr [esp]
 00412D8A    add         esp,18
 00412D8D    pop         ebx
 00412D8E    ret
*}
end;

//00412D90
function VarToDoubleAny(const V:TVarData):Double;
begin
{*
 00412D90    push        ebp
 00412D91    mov         ebp,esp
 00412D93    add         esp,0FFFFFFE8
 00412D96    push        ebx
 00412D97    mov         ebx,eax
 00412D99    lea         eax,[ebp-18]
 00412D9C    push        eax
 00412D9D    call        oleaut32.VariantInit
 00412DA2    xor         eax,eax
 00412DA4    push        ebp
 00412DA5    push        412DE5
 00412DAA    push        dword ptr fs:[eax]
 00412DAD    mov         dword ptr fs:[eax],esp
 00412DB0    mov         edx,ebx
 00412DB2    lea         eax,[ebp-18]
 00412DB5    call        @VarCopy
 00412DBA    lea         eax,[ebp-18]
 00412DBD    call        dword ptr ds:[5E08E4]
 00412DC3    lea         eax,[ebp-18]
 00412DC6    call        @VarToDouble
 00412DCB    fstp        qword ptr [ebp-8]
 00412DCE    wait
 00412DCF    xor         eax,eax
 00412DD1    pop         edx
 00412DD2    pop         ecx
 00412DD3    pop         ecx
 00412DD4    mov         dword ptr fs:[eax],edx
 00412DD7    push        412DEC
 00412DDC    lea         eax,[ebp-18]
 00412DDF    call        @VarClear
 00412DE4    ret
>00412DE5    jmp         @HandleFinally
>00412DEA    jmp         00412DDC
 00412DEC    fld         qword ptr [ebp-8]
 00412DEF    pop         ebx
 00412DF0    mov         esp,ebp
 00412DF2    pop         ebp
 00412DF3    ret
*}
end;

//00412DF4
function VarToDoubleCustom(const V:TVarData; var AValue:Double):Boolean;
begin
{*
 00412DF4    push        ebx
 00412DF5    push        esi
 00412DF6    push        edi
 00412DF7    add         esp,0FFFFFFEC
 00412DFA    mov         edi,edx
 00412DFC    mov         esi,eax
 00412DFE    mov         edx,esp
 00412E00    mov         ax,word ptr [esi]
 00412E03    call        FindCustomVariantType
 00412E08    mov         ebx,eax
 00412E0A    test        bl,bl
>00412E0C    je          00412E36
 00412E0E    lea         eax,[esp+4]
 00412E12    push        eax
 00412E13    call        oleaut32.VariantInit
 00412E18    push        5
 00412E1A    mov         ecx,esi
 00412E1C    lea         edx,[esp+8]
 00412E20    mov         eax,dword ptr [esp+4]
 00412E24    mov         esi,dword ptr [eax]
 00412E26    call        dword ptr [esi+1C]
 00412E29    mov         eax,dword ptr [esp+0C]
 00412E2D    mov         dword ptr [edi],eax
 00412E2F    mov         eax,dword ptr [esp+10]
 00412E33    mov         dword ptr [edi+4],eax
 00412E36    mov         eax,ebx
 00412E38    add         esp,14
 00412E3B    pop         edi
 00412E3C    pop         esi
 00412E3D    pop         ebx
 00412E3E    ret
*}
end;

//00412E40
function @VarToDouble(const V:TVarData):Double;
begin
{*
 00412E40    push        ebx
 00412E41    add         esp,0FFFFFFEC
 00412E44    mov         ebx,eax
 00412E46    mov         ax,word ptr [ebx]
 00412E49    movzx       edx,ax
 00412E4C    cmp         edx,14
>00412E4F    ja          00412FE8
 00412E55    jmp         dword ptr [edx*4+412E5C]
 00412E55    dd          00412EB0
 00412E55    dd          00412EBE
 00412E55    dd          00412EE2
 00412E55    dd          00412EEE
 00412E55    dd          00412EFA
 00412E55    dd          00412F06
 00412E55    dd          00412F18
 00412E55    dd          00412F2A
 00412E55    dd          00412F3C
 00412E55    dd          00412FD8
 00412E55    dd          00412FE8
 00412E55    dd          00412F4C
 00412E55    dd          00412FC7
 00412E55    dd          00412FD8
 00412E55    dd          00412FE8
 00412E55    dd          00412FE8
 00412E55    dd          00412F61
 00412E55    dd          00412F76
 00412E55    dd          00412F8C
 00412E55    dd          00412FA1
 00412E55    dd          00412FBB
 00412EB0    xor         eax,eax
 00412EB2    mov         dword ptr [esp],eax
 00412EB5    mov         dword ptr [esp+4],eax
>00412EB9    jmp         004131AD
 00412EBE    cmp         byte ptr ds:[5AC3AC],0
>00412EC5    je          00412ED4
 00412EC7    mov         dx,5
 00412ECB    mov         ax,1
 00412ECF    call        VarCastError
 00412ED4    xor         eax,eax
 00412ED6    mov         dword ptr [esp],eax
 00412ED9    mov         dword ptr [esp+4],eax
>00412EDD    jmp         004131AD
 00412EE2    fild        word ptr [ebx+8]
 00412EE5    fstp        qword ptr [esp]
 00412EE8    wait
>00412EE9    jmp         004131AD
 00412EEE    fild        dword ptr [ebx+8]
 00412EF1    fstp        qword ptr [esp]
 00412EF4    wait
>00412EF5    jmp         004131AD
 00412EFA    fld         dword ptr [ebx+8]
 00412EFD    fstp        qword ptr [esp]
 00412F00    wait
>00412F01    jmp         004131AD
 00412F06    mov         eax,dword ptr [ebx+8]
 00412F09    mov         dword ptr [esp],eax
 00412F0C    mov         eax,dword ptr [ebx+0C]
 00412F0F    mov         dword ptr [esp+4],eax
>00412F13    jmp         004131AD
 00412F18    fild        qword ptr [ebx+8]
 00412F1B    fdiv        dword ptr ds:[4131B8]
 00412F21    fstp        qword ptr [esp]
 00412F24    wait
>00412F25    jmp         004131AD
 00412F2A    mov         eax,dword ptr [ebx+8]
 00412F2D    mov         dword ptr [esp],eax
 00412F30    mov         eax,dword ptr [ebx+0C]
 00412F33    mov         dword ptr [esp+4],eax
>00412F37    jmp         004131AD
 00412F3C    mov         eax,ebx
 00412F3E    call        VarToDoubleAsString
 00412F43    fstp        qword ptr [esp]
 00412F46    wait
>00412F47    jmp         004131AD
 00412F4C    movsx       eax,word ptr [ebx+8]
 00412F50    mov         dword ptr [esp+8],eax
 00412F54    fild        dword ptr [esp+8]
 00412F58    fstp        qword ptr [esp]
 00412F5B    wait
>00412F5C    jmp         004131AD
 00412F61    movsx       eax,byte ptr [ebx+8]
 00412F65    mov         dword ptr [esp+8],eax
 00412F69    fild        dword ptr [esp+8]
 00412F6D    fstp        qword ptr [esp]
 00412F70    wait
>00412F71    jmp         004131AD
 00412F76    xor         eax,eax
 00412F78    mov         al,byte ptr [ebx+8]
 00412F7B    mov         dword ptr [esp+8],eax
 00412F7F    fild        dword ptr [esp+8]
 00412F83    fstp        qword ptr [esp]
 00412F86    wait
>00412F87    jmp         004131AD
 00412F8C    movzx       eax,word ptr [ebx+8]
 00412F90    mov         dword ptr [esp+8],eax
 00412F94    fild        dword ptr [esp+8]
 00412F98    fstp        qword ptr [esp]
 00412F9B    wait
>00412F9C    jmp         004131AD
 00412FA1    mov         eax,dword ptr [ebx+8]
 00412FA4    mov         dword ptr [esp+0C],eax
 00412FA8    xor         eax,eax
 00412FAA    mov         dword ptr [esp+10],eax
 00412FAE    fild        qword ptr [esp+0C]
 00412FB2    fstp        qword ptr [esp]
 00412FB5    wait
>00412FB6    jmp         004131AD
 00412FBB    fild        qword ptr [ebx+8]
 00412FBE    fstp        qword ptr [esp]
 00412FC1    wait
>00412FC2    jmp         004131AD
 00412FC7    mov         eax,dword ptr [ebx+8]
 00412FCA    call        @VarToDouble
 00412FCF    fstp        qword ptr [esp]
 00412FD2    wait
>00412FD3    jmp         004131AD
 00412FD8    mov         eax,ebx
 00412FDA    call        VarToDoubleViaOS
 00412FDF    fstp        qword ptr [esp]
 00412FE2    wait
>00412FE3    jmp         004131AD
 00412FE8    mov         edx,eax
 00412FEA    sub         dx,100
>00412FEF    je          00412FF8
 00412FF1    dec         dx
>00412FF4    je          00413008
>00412FF6    jmp         00413018
 00412FF8    mov         eax,ebx
 00412FFA    call        VarToDoubleAsString
 00412FFF    fstp        qword ptr [esp]
 00413002    wait
>00413003    jmp         004131AD
 00413008    mov         eax,ebx
 0041300A    call        VarToDoubleAny
 0041300F    fstp        qword ptr [esp]
 00413012    wait
>00413013    jmp         004131AD
 00413018    test        ah,40
>0041301B    je          00413195
 00413021    movzx       eax,ax
 00413024    and         eax,0FFFFBFFF
 00413029    cmp         eax,14
>0041302C    ja          00413188
 00413032    jmp         dword ptr [eax*4+413039]
 00413032    dd          00413188
 00413032    dd          00413188
 00413032    dd          0041308D
 00413032    dd          0041309B
 00413032    dd          004130A9
 00413032    dd          004130B7
 00413032    dd          004130CB
 00413032    dd          004130DF
 00413032    dd          004130F3
 00413032    dd          00413188
 00413032    dd          00413188
 00413032    dd          00413103
 00413032    dd          0041317A
 00413032    dd          00413188
 00413032    dd          00413188
 00413032    dd          00413188
 00413032    dd          0041311A
 00413032    dd          0041312E
 00413032    dd          00413142
 00413032    dd          00413156
 00413032    dd          0041316F
 0041308D    mov         eax,dword ptr [ebx+8]
 00413090    fild        word ptr [eax]
 00413092    fstp        qword ptr [esp]
 00413095    wait
>00413096    jmp         004131AD
 0041309B    mov         eax,dword ptr [ebx+8]
 0041309E    fild        dword ptr [eax]
 004130A0    fstp        qword ptr [esp]
 004130A3    wait
>004130A4    jmp         004131AD
 004130A9    mov         eax,dword ptr [ebx+8]
 004130AC    fld         dword ptr [eax]
 004130AE    fstp        qword ptr [esp]
 004130B1    wait
>004130B2    jmp         004131AD
 004130B7    mov         eax,dword ptr [ebx+8]
 004130BA    mov         edx,dword ptr [eax]
 004130BC    mov         dword ptr [esp],edx
 004130BF    mov         edx,dword ptr [eax+4]
 004130C2    mov         dword ptr [esp+4],edx
>004130C6    jmp         004131AD
 004130CB    mov         eax,dword ptr [ebx+8]
 004130CE    fild        qword ptr [eax]
 004130D0    fdiv        dword ptr ds:[4131B8]
 004130D6    fstp        qword ptr [esp]
 004130D9    wait
>004130DA    jmp         004131AD
 004130DF    mov         eax,dword ptr [ebx+8]
 004130E2    mov         edx,dword ptr [eax]
 004130E4    mov         dword ptr [esp],edx
 004130E7    mov         edx,dword ptr [eax+4]
 004130EA    mov         dword ptr [esp+4],edx
>004130EE    jmp         004131AD
 004130F3    mov         eax,ebx
 004130F5    call        VarToDoubleAsString
 004130FA    fstp        qword ptr [esp]
 004130FD    wait
>004130FE    jmp         004131AD
 00413103    mov         eax,dword ptr [ebx+8]
 00413106    movsx       eax,word ptr [eax]
 00413109    mov         dword ptr [esp+8],eax
 0041310D    fild        dword ptr [esp+8]
 00413111    fstp        qword ptr [esp]
 00413114    wait
>00413115    jmp         004131AD
 0041311A    mov         eax,dword ptr [ebx+8]
 0041311D    movsx       eax,byte ptr [eax]
 00413120    mov         dword ptr [esp+8],eax
 00413124    fild        dword ptr [esp+8]
 00413128    fstp        qword ptr [esp]
 0041312B    wait
>0041312C    jmp         004131AD
 0041312E    mov         eax,dword ptr [ebx+8]
 00413131    movzx       eax,byte ptr [eax]
 00413134    mov         dword ptr [esp+8],eax
 00413138    fild        dword ptr [esp+8]
 0041313C    fstp        qword ptr [esp]
 0041313F    wait
>00413140    jmp         004131AD
 00413142    mov         eax,dword ptr [ebx+8]
 00413145    movzx       eax,word ptr [eax]
 00413148    mov         dword ptr [esp+8],eax
 0041314C    fild        dword ptr [esp+8]
 00413150    fstp        qword ptr [esp]
 00413153    wait
>00413154    jmp         004131AD
 00413156    mov         eax,dword ptr [ebx+8]
 00413159    mov         eax,dword ptr [eax]
 0041315B    mov         dword ptr [esp+0C],eax
 0041315F    xor         eax,eax
 00413161    mov         dword ptr [esp+10],eax
 00413165    fild        qword ptr [esp+0C]
 00413169    fstp        qword ptr [esp]
 0041316C    wait
>0041316D    jmp         004131AD
 0041316F    mov         eax,dword ptr [ebx+8]
 00413172    fild        qword ptr [eax]
 00413174    fstp        qword ptr [esp]
 00413177    wait
>00413178    jmp         004131AD
 0041317A    mov         eax,dword ptr [ebx+8]
 0041317D    call        @VarToDouble
 00413182    fstp        qword ptr [esp]
 00413185    wait
>00413186    jmp         004131AD
 00413188    mov         eax,ebx
 0041318A    call        VarToDoubleViaOS
 0041318F    fstp        qword ptr [esp]
 00413192    wait
>00413193    jmp         004131AD
 00413195    mov         edx,esp
 00413197    mov         eax,ebx
 00413199    call        VarToDoubleCustom
 0041319E    test        al,al
>004131A0    jne         004131AD
 004131A2    mov         eax,ebx
 004131A4    call        VarToDoubleViaOS
 004131A9    fstp        qword ptr [esp]
 004131AC    wait
 004131AD    fld         qword ptr [esp]
 004131B0    add         esp,14
 004131B3    pop         ebx
 004131B4    ret
*}
end;

//004131BC
function @VarToReal(const V:TVarData):Extended;
begin
{*
 004131BC    push        ebx
 004131BD    add         esp,0FFFFFFF4
 004131C0    mov         ebx,eax
 004131C2    mov         eax,ebx
 004131C4    call        @VarToDouble
 004131C9    fstp        tbyte ptr [esp]
 004131CC    wait
 004131CD    fld         tbyte ptr [esp]
 004131D0    add         esp,0C
 004131D3    pop         ebx
 004131D4    ret
*}
end;

//004131D8
function @VarToSingle(const V:TVarData):Single;
begin
{*
 004131D8    push        ebp
 004131D9    mov         ebp,esp
 004131DB    add         esp,0FFFFFFEC
 004131DE    push        ebx
 004131DF    push        esi
 004131E0    push        edi
 004131E1    mov         dword ptr [ebp-4],eax
 004131E4    mov         eax,dword ptr [ebp-4]
 004131E7    movzx       eax,word ptr [eax]
 004131EA    cmp         eax,14
>004131ED    ja          00413319
 004131F3    jmp         dword ptr [eax*4+4131FA]
 004131F3    dd          0041324E
 004131F3    dd          00413258
 004131F3    dd          00413278
 004131F3    dd          00413287
 004131F3    dd          00413296
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          004132A4
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          00413319
 004131F3    dd          004132BA
 004131F3    dd          004132D0
 004131F3    dd          004132E3
 004131F3    dd          004132F6
 004131F3    dd          0041330D
 0041324E    xor         eax,eax
 00413250    mov         dword ptr [ebp-8],eax
>00413253    jmp         0041335B
 00413258    cmp         byte ptr ds:[5AC3AC],0
>0041325F    je          0041326E
 00413261    mov         dx,4
 00413265    mov         ax,1
 00413269    call        VarCastError
 0041326E    xor         eax,eax
 00413270    mov         dword ptr [ebp-8],eax
>00413273    jmp         0041335B
 00413278    mov         eax,dword ptr [ebp-4]
 0041327B    fild        word ptr [eax+8]
 0041327E    fstp        dword ptr [ebp-8]
 00413281    wait
>00413282    jmp         0041335B
 00413287    mov         eax,dword ptr [ebp-4]
 0041328A    fild        dword ptr [eax+8]
 0041328D    fstp        dword ptr [ebp-8]
 00413290    wait
>00413291    jmp         0041335B
 00413296    mov         eax,dword ptr [ebp-4]
 00413299    mov         eax,dword ptr [eax+8]
 0041329C    mov         dword ptr [ebp-8],eax
>0041329F    jmp         0041335B
 004132A4    mov         eax,dword ptr [ebp-4]
 004132A7    movsx       eax,word ptr [eax+8]
 004132AB    mov         dword ptr [ebp-0C],eax
 004132AE    fild        dword ptr [ebp-0C]
 004132B1    fstp        dword ptr [ebp-8]
 004132B4    wait
>004132B5    jmp         0041335B
 004132BA    mov         eax,dword ptr [ebp-4]
 004132BD    movsx       eax,byte ptr [eax+8]
 004132C1    mov         dword ptr [ebp-0C],eax
 004132C4    fild        dword ptr [ebp-0C]
 004132C7    fstp        dword ptr [ebp-8]
 004132CA    wait
>004132CB    jmp         0041335B
 004132D0    mov         eax,dword ptr [ebp-4]
 004132D3    movzx       eax,byte ptr [eax+8]
 004132D7    mov         dword ptr [ebp-0C],eax
 004132DA    fild        dword ptr [ebp-0C]
 004132DD    fstp        dword ptr [ebp-8]
 004132E0    wait
>004132E1    jmp         0041335B
 004132E3    mov         eax,dword ptr [ebp-4]
 004132E6    movzx       eax,word ptr [eax+8]
 004132EA    mov         dword ptr [ebp-0C],eax
 004132ED    fild        dword ptr [ebp-0C]
 004132F0    fstp        dword ptr [ebp-8]
 004132F3    wait
>004132F4    jmp         0041335B
 004132F6    mov         eax,dword ptr [ebp-4]
 004132F9    mov         eax,dword ptr [eax+8]
 004132FC    mov         dword ptr [ebp-14],eax
 004132FF    xor         eax,eax
 00413301    mov         dword ptr [ebp-10],eax
 00413304    fild        qword ptr [ebp-14]
 00413307    fstp        dword ptr [ebp-8]
 0041330A    wait
>0041330B    jmp         0041335B
 0041330D    mov         eax,dword ptr [ebp-4]
 00413310    fild        qword ptr [eax+8]
 00413313    fstp        dword ptr [ebp-8]
 00413316    wait
>00413317    jmp         0041335B
 00413319    xor         eax,eax
 0041331B    push        ebp
 0041331C    push        41333D
 00413321    push        dword ptr fs:[eax]
 00413324    mov         dword ptr fs:[eax],esp
 00413327    mov         eax,dword ptr [ebp-4]
 0041332A    call        @VarToDouble
 0041332F    fstp        dword ptr [ebp-8]
 00413332    wait
 00413333    xor         eax,eax
 00413335    pop         edx
 00413336    pop         ecx
 00413337    pop         ecx
 00413338    mov         dword ptr fs:[eax],edx
>0041333B    jmp         0041335B
>0041333D    jmp         @HandleAnyException
 00413342    mov         eax,dword ptr [ebp-4]
 00413345    mov         ax,word ptr [eax]
 00413348    mov         dx,4
 0041334C    call        HandleConversionException
 00413351    xor         eax,eax
 00413353    mov         dword ptr [ebp-8],eax
 00413356    call        @DoneExcept
 0041335B    fld         dword ptr [ebp-8]
 0041335E    pop         edi
 0041335F    pop         esi
 00413360    pop         ebx
 00413361    mov         esp,ebp
 00413363    pop         ebp
 00413364    ret
*}
end;

//00413368
function VarToDateAsString(const V:TVarData):TDateTime;
begin
{*
 00413368    push        ebp
 00413369    mov         ebp,esp
 0041336B    add         esp,0FFFFFFE0
 0041336E    push        ebx
 0041336F    xor         edx,edx
 00413371    mov         dword ptr [ebp-20],edx
 00413374    mov         dword ptr [ebp-1C],edx
 00413377    mov         dword ptr [ebp-0C],edx
 0041337A    mov         ebx,eax
 0041337C    xor         eax,eax
 0041337E    push        ebp
 0041337F    push        413444
 00413384    push        dword ptr fs:[eax]
 00413387    mov         dword ptr fs:[eax],esp
 0041338A    mov         edx,ebx
 0041338C    lea         eax,[ebp-0C]
 0041338F    call        @VarToWStr
 00413394    lea         eax,[ebp-8]
 00413397    push        eax
 00413398    push        0
 0041339A    push        400
 0041339F    mov         eax,dword ptr [ebp-0C]
 004133A2    push        eax
 004133A3    mov         eax,[005AE298];^gvar_005E08B0
 004133A8    mov         eax,dword ptr [eax]
 004133AA    call        eax
 004133AC    mov         edx,eax
 004133AE    sub         edx,80020005
>004133B4    je          004133C0
 004133B6    sub         edx,7FFDFFFB
>004133BC    jne         00413415
>004133BE    jmp         00413421
 004133C0    lea         eax,[ebp-1C]
 004133C3    mov         edx,dword ptr [ebp-0C]
 004133C6    call        @LStrFromWStr
 004133CB    mov         eax,dword ptr [ebp-1C]
 004133CE    lea         edx,[ebp-8]
 004133D1    call        TryStrToDate
 004133D6    test        al,al
>004133D8    jne         00413421
 004133DA    lea         eax,[ebp-20]
 004133DD    mov         edx,dword ptr [ebp-0C]
 004133E0    call        @LStrFromWStr
 004133E5    mov         eax,dword ptr [ebp-20]
 004133E8    lea         edx,[ebp-18]
 004133EB    call        TryStrToFloat
 004133F0    test        al,al
>004133F2    je          00413402
 004133F4    mov         eax,dword ptr [ebp-18]
 004133F7    mov         dword ptr [ebp-8],eax
 004133FA    mov         eax,dword ptr [ebp-14]
 004133FD    mov         dword ptr [ebp-4],eax
>00413400    jmp         00413421
 00413402    mov         dx,word ptr [ebx]
 00413405    mov         cx,7
 00413409    mov         eax,80020005
 0041340E    call        VarResultCheck
>00413413    jmp         00413421
 00413415    mov         dx,word ptr [ebx]
 00413418    mov         cx,7
 0041341C    call        VarResultCheck
 00413421    xor         eax,eax
 00413423    pop         edx
 00413424    pop         ecx
 00413425    pop         ecx
 00413426    mov         dword ptr fs:[eax],edx
 00413429    push        41344B
 0041342E    lea         eax,[ebp-20]
 00413431    mov         edx,2
 00413436    call        @LStrArrayClr
 0041343B    lea         eax,[ebp-0C]
 0041343E    call        @WStrClr
 00413443    ret
>00413444    jmp         @HandleFinally
>00413449    jmp         0041342E
 0041344B    fld         qword ptr [ebp-8]
 0041344E    pop         ebx
 0041344F    mov         esp,ebp
 00413451    pop         ebp
 00413452    ret
*}
end;

//00413454
function VarToDateAsDouble(const V:TVarData; const Value:Double):TDateTime;
begin
{*
 00413454    push        ebp
 00413455    mov         ebp,esp
 00413457    add         esp,0FFFFFFE8
 0041345A    push        ebx
 0041345B    mov         ebx,eax
 0041345D    lea         eax,[ebp-18]
 00413460    push        eax
 00413461    call        oleaut32.VariantInit
 00413466    mov         word ptr [ebp-18],5
 0041346C    mov         eax,dword ptr [ebp+8]
 0041346F    mov         dword ptr [ebp-10],eax
 00413472    mov         eax,dword ptr [ebp+0C]
 00413475    mov         dword ptr [ebp-0C],eax
 00413478    push        7
 0041347A    push        0
 0041347C    push        400
 00413481    lea         eax,[ebp-18]
 00413484    push        eax
 00413485    lea         eax,[ebp-18]
 00413488    push        eax
 00413489    mov         eax,[005AE68C];^gvar_005E0870
 0041348E    mov         eax,dword ptr [eax]
 00413490    call        eax
 00413492    mov         dx,word ptr [ebx]
 00413495    mov         cx,7
 00413499    call        VarResultCheck
 0041349E    mov         eax,dword ptr [ebp-10]
 004134A1    mov         dword ptr [ebp-8],eax
 004134A4    mov         eax,dword ptr [ebp-0C]
 004134A7    mov         dword ptr [ebp-4],eax
 004134AA    fld         qword ptr [ebp-8]
 004134AD    pop         ebx
 004134AE    mov         esp,ebp
 004134B0    pop         ebp
 004134B1    ret         8
*}
end;

//004134B4
function VarToDateViaOS(const V:TVarData):TDateTime;
begin
{*
 004134B4    push        ebx
 004134B5    add         esp,0FFFFFFE8
 004134B8    mov         ebx,eax
 004134BA    lea         eax,[esp+8]
 004134BE    push        eax
 004134BF    call        oleaut32.VariantInit
 004134C4    push        7
 004134C6    push        0
 004134C8    push        400
 004134CD    push        ebx
 004134CE    lea         eax,[esp+18]
 004134D2    push        eax
 004134D3    mov         eax,[005AE68C];^gvar_005E0870
 004134D8    mov         eax,dword ptr [eax]
 004134DA    call        eax
 004134DC    mov         dx,word ptr [ebx]
 004134DF    mov         cx,7
 004134E3    call        VarResultCheck
 004134E8    mov         eax,dword ptr [esp+10]
 004134EC    mov         dword ptr [esp],eax
 004134EF    mov         eax,dword ptr [esp+14]
 004134F3    mov         dword ptr [esp+4],eax
 004134F7    fld         qword ptr [esp]
 004134FA    add         esp,18
 004134FD    pop         ebx
 004134FE    ret
*}
end;

//00413500
function VarToDateAny(const V:TVarData):TDateTime;
begin
{*
 00413500    push        ebp
 00413501    mov         ebp,esp
 00413503    add         esp,0FFFFFFE8
 00413506    push        ebx
 00413507    mov         ebx,eax
 00413509    lea         eax,[ebp-18]
 0041350C    push        eax
 0041350D    call        oleaut32.VariantInit
 00413512    xor         eax,eax
 00413514    push        ebp
 00413515    push        413555
 0041351A    push        dword ptr fs:[eax]
 0041351D    mov         dword ptr fs:[eax],esp
 00413520    mov         edx,ebx
 00413522    lea         eax,[ebp-18]
 00413525    call        @VarCopy
 0041352A    lea         eax,[ebp-18]
 0041352D    call        dword ptr ds:[5E08E4]
 00413533    lea         eax,[ebp-18]
 00413536    call        @VarToDate
 0041353B    fstp        qword ptr [ebp-8]
 0041353E    wait
 0041353F    xor         eax,eax
 00413541    pop         edx
 00413542    pop         ecx
 00413543    pop         ecx
 00413544    mov         dword ptr fs:[eax],edx
 00413547    push        41355C
 0041354C    lea         eax,[ebp-18]
 0041354F    call        @VarClear
 00413554    ret
>00413555    jmp         @HandleFinally
>0041355A    jmp         0041354C
 0041355C    fld         qword ptr [ebp-8]
 0041355F    pop         ebx
 00413560    mov         esp,ebp
 00413562    pop         ebp
 00413563    ret
*}
end;

//00413564
function VarToDateCustom(const V:TVarData; var AValue:TDateTime):Boolean;
begin
{*
 00413564    push        ebx
 00413565    push        esi
 00413566    push        edi
 00413567    add         esp,0FFFFFFEC
 0041356A    mov         edi,edx
 0041356C    mov         esi,eax
 0041356E    mov         edx,esp
 00413570    mov         ax,word ptr [esi]
 00413573    call        FindCustomVariantType
 00413578    mov         ebx,eax
 0041357A    test        bl,bl
>0041357C    je          004135A6
 0041357E    lea         eax,[esp+4]
 00413582    push        eax
 00413583    call        oleaut32.VariantInit
 00413588    push        7
 0041358A    mov         ecx,esi
 0041358C    lea         edx,[esp+8]
 00413590    mov         eax,dword ptr [esp+4]
 00413594    mov         esi,dword ptr [eax]
 00413596    call        dword ptr [esi+1C]
 00413599    mov         eax,dword ptr [esp+0C]
 0041359D    mov         dword ptr [edi],eax
 0041359F    mov         eax,dword ptr [esp+10]
 004135A3    mov         dword ptr [edi+4],eax
 004135A6    mov         eax,ebx
 004135A8    add         esp,14
 004135AB    pop         edi
 004135AC    pop         esi
 004135AD    pop         ebx
 004135AE    ret
*}
end;

//004135B0
function @VarToDate(const V:TVarData):TDateTime;
begin
{*
 004135B0    push        ebx
 004135B1    add         esp,0FFFFFFEC
 004135B4    mov         ebx,eax
 004135B6    mov         ax,word ptr [ebx]
 004135B9    movzx       edx,ax
 004135BC    cmp         edx,14
>004135BF    ja          00413746
 004135C5    jmp         dword ptr [edx*4+4135CC]
 004135C5    dd          00413620
 004135C5    dd          0041362E
 004135C5    dd          00413652
 004135C5    dd          0041365E
 004135C5    dd          0041366A
 004135C5    dd          0041366A
 004135C5    dd          0041366A
 004135C5    dd          0041367A
 004135C5    dd          0041368C
 004135C5    dd          00413736
 004135C5    dd          00413746
 004135C5    dd          0041369C
 004135C5    dd          00413725
 004135C5    dd          00413736
 004135C5    dd          00413746
 004135C5    dd          00413746
 004135C5    dd          004136B1
 004135C5    dd          004136C6
 004135C5    dd          004136DC
 004135C5    dd          004136F1
 004135C5    dd          0041370B
 00413620    xor         eax,eax
 00413622    mov         dword ptr [esp],eax
 00413625    mov         dword ptr [esp+4],eax
>00413629    jmp         004138F6
 0041362E    cmp         byte ptr ds:[5AC3AC],0
>00413635    je          00413644
 00413637    mov         dx,7
 0041363B    mov         ax,1
 0041363F    call        VarCastError
 00413644    xor         eax,eax
 00413646    mov         dword ptr [esp],eax
 00413649    mov         dword ptr [esp+4],eax
>0041364D    jmp         004138F6
 00413652    fild        word ptr [ebx+8]
 00413655    fstp        qword ptr [esp]
 00413658    wait
>00413659    jmp         004138F6
 0041365E    fild        dword ptr [ebx+8]
 00413661    fstp        qword ptr [esp]
 00413664    wait
>00413665    jmp         004138F6
 0041366A    mov         eax,ebx
 0041366C    call        VarToDateViaOS
 00413671    fstp        qword ptr [esp]
 00413674    wait
>00413675    jmp         004138F6
 0041367A    mov         eax,dword ptr [ebx+8]
 0041367D    mov         dword ptr [esp],eax
 00413680    mov         eax,dword ptr [ebx+0C]
 00413683    mov         dword ptr [esp+4],eax
>00413687    jmp         004138F6
 0041368C    mov         eax,ebx
 0041368E    call        VarToDateAsString
 00413693    fstp        qword ptr [esp]
 00413696    wait
>00413697    jmp         004138F6
 0041369C    movsx       eax,word ptr [ebx+8]
 004136A0    mov         dword ptr [esp+8],eax
 004136A4    fild        dword ptr [esp+8]
 004136A8    fstp        qword ptr [esp]
 004136AB    wait
>004136AC    jmp         004138F6
 004136B1    movsx       eax,byte ptr [ebx+8]
 004136B5    mov         dword ptr [esp+8],eax
 004136B9    fild        dword ptr [esp+8]
 004136BD    fstp        qword ptr [esp]
 004136C0    wait
>004136C1    jmp         004138F6
 004136C6    xor         eax,eax
 004136C8    mov         al,byte ptr [ebx+8]
 004136CB    mov         dword ptr [esp+8],eax
 004136CF    fild        dword ptr [esp+8]
 004136D3    fstp        qword ptr [esp]
 004136D6    wait
>004136D7    jmp         004138F6
 004136DC    movzx       eax,word ptr [ebx+8]
 004136E0    mov         dword ptr [esp+8],eax
 004136E4    fild        dword ptr [esp+8]
 004136E8    fstp        qword ptr [esp]
 004136EB    wait
>004136EC    jmp         004138F6
 004136F1    mov         eax,dword ptr [ebx+8]
 004136F4    mov         dword ptr [esp+0C],eax
 004136F8    xor         eax,eax
 004136FA    mov         dword ptr [esp+10],eax
 004136FE    fild        qword ptr [esp+0C]
 00413702    fstp        qword ptr [esp]
 00413705    wait
>00413706    jmp         004138F6
 0041370B    fild        qword ptr [ebx+8]
 0041370E    add         esp,0FFFFFFF8
 00413711    fstp        qword ptr [esp]
 00413714    wait
 00413715    mov         eax,ebx
 00413717    call        VarToDateAsDouble
 0041371C    fstp        qword ptr [esp]
 0041371F    wait
>00413720    jmp         004138F6
 00413725    mov         eax,dword ptr [ebx+8]
 00413728    call        @VarToDate
 0041372D    fstp        qword ptr [esp]
 00413730    wait
>00413731    jmp         004138F6
 00413736    mov         eax,ebx
 00413738    call        VarToDateViaOS
 0041373D    fstp        qword ptr [esp]
 00413740    wait
>00413741    jmp         004138F6
 00413746    mov         edx,eax
 00413748    sub         dx,100
>0041374D    je          00413756
 0041374F    dec         dx
>00413752    je          00413766
>00413754    jmp         00413776
 00413756    mov         eax,ebx
 00413758    call        VarToDateAsString
 0041375D    fstp        qword ptr [esp]
 00413760    wait
>00413761    jmp         004138F6
 00413766    mov         eax,ebx
 00413768    call        VarToDateAny
 0041376D    fstp        qword ptr [esp]
 00413770    wait
>00413771    jmp         004138F6
 00413776    test        ah,40
>00413779    je          004138DE
 0041377F    movzx       eax,ax
 00413782    and         eax,0FFFFBFFF
 00413787    cmp         eax,14
>0041378A    ja          004138D1
 00413790    jmp         dword ptr [eax*4+413797]
 00413790    dd          004138D1
 00413790    dd          004138D1
 00413790    dd          004137EB
 00413790    dd          004137F9
 00413790    dd          00413807
 00413790    dd          00413807
 00413790    dd          00413807
 00413790    dd          00413817
 00413790    dd          0041382B
 00413790    dd          004138D1
 00413790    dd          004138D1
 00413790    dd          0041383B
 00413790    dd          004138C3
 00413790    dd          004138D1
 00413790    dd          004138D1
 00413790    dd          004138D1
 00413790    dd          00413852
 00413790    dd          00413869
 00413790    dd          0041387D
 00413790    dd          00413891
 00413790    dd          004138AA
 004137EB    mov         eax,dword ptr [ebx+8]
 004137EE    fild        word ptr [eax]
 004137F0    fstp        qword ptr [esp]
 004137F3    wait
>004137F4    jmp         004138F6
 004137F9    mov         eax,dword ptr [ebx+8]
 004137FC    fild        dword ptr [eax]
 004137FE    fstp        qword ptr [esp]
 00413801    wait
>00413802    jmp         004138F6
 00413807    mov         eax,ebx
 00413809    call        VarToDateViaOS
 0041380E    fstp        qword ptr [esp]
 00413811    wait
>00413812    jmp         004138F6
 00413817    mov         eax,dword ptr [ebx+8]
 0041381A    mov         edx,dword ptr [eax]
 0041381C    mov         dword ptr [esp],edx
 0041381F    mov         edx,dword ptr [eax+4]
 00413822    mov         dword ptr [esp+4],edx
>00413826    jmp         004138F6
 0041382B    mov         eax,ebx
 0041382D    call        VarToDateAsString
 00413832    fstp        qword ptr [esp]
 00413835    wait
>00413836    jmp         004138F6
 0041383B    mov         eax,dword ptr [ebx+8]
 0041383E    movsx       eax,word ptr [eax]
 00413841    mov         dword ptr [esp+8],eax
 00413845    fild        dword ptr [esp+8]
 00413849    fstp        qword ptr [esp]
 0041384C    wait
>0041384D    jmp         004138F6
 00413852    mov         eax,dword ptr [ebx+8]
 00413855    movsx       eax,byte ptr [eax]
 00413858    mov         dword ptr [esp+8],eax
 0041385C    fild        dword ptr [esp+8]
 00413860    fstp        qword ptr [esp]
 00413863    wait
>00413864    jmp         004138F6
 00413869    mov         eax,dword ptr [ebx+8]
 0041386C    movzx       eax,byte ptr [eax]
 0041386F    mov         dword ptr [esp+8],eax
 00413873    fild        dword ptr [esp+8]
 00413877    fstp        qword ptr [esp]
 0041387A    wait
>0041387B    jmp         004138F6
 0041387D    mov         eax,dword ptr [ebx+8]
 00413880    movzx       eax,word ptr [eax]
 00413883    mov         dword ptr [esp+8],eax
 00413887    fild        dword ptr [esp+8]
 0041388B    fstp        qword ptr [esp]
 0041388E    wait
>0041388F    jmp         004138F6
 00413891    mov         eax,dword ptr [ebx+8]
 00413894    mov         eax,dword ptr [eax]
 00413896    mov         dword ptr [esp+0C],eax
 0041389A    xor         eax,eax
 0041389C    mov         dword ptr [esp+10],eax
 004138A0    fild        qword ptr [esp+0C]
 004138A4    fstp        qword ptr [esp]
 004138A7    wait
>004138A8    jmp         004138F6
 004138AA    mov         eax,dword ptr [ebx+8]
 004138AD    fild        qword ptr [eax]
 004138AF    add         esp,0FFFFFFF8
 004138B2    fstp        qword ptr [esp]
 004138B5    wait
 004138B6    mov         eax,ebx
 004138B8    call        VarToDateAsDouble
 004138BD    fstp        qword ptr [esp]
 004138C0    wait
>004138C1    jmp         004138F6
 004138C3    mov         eax,dword ptr [ebx+8]
 004138C6    call        @VarToDate
 004138CB    fstp        qword ptr [esp]
 004138CE    wait
>004138CF    jmp         004138F6
 004138D1    mov         eax,ebx
 004138D3    call        VarToDateViaOS
 004138D8    fstp        qword ptr [esp]
 004138DB    wait
>004138DC    jmp         004138F6
 004138DE    mov         edx,esp
 004138E0    mov         eax,ebx
 004138E2    call        VarToDateCustom
 004138E7    test        al,al
>004138E9    jne         004138F6
 004138EB    mov         eax,ebx
 004138ED    call        VarToDateViaOS
 004138F2    fstp        qword ptr [esp]
 004138F5    wait
 004138F6    fld         qword ptr [esp]
 004138F9    add         esp,14
 004138FC    pop         ebx
 004138FD    ret
*}
end;

//00413900
function VarToCurrencyAsString(const V:TVarData):Currency;
begin
{*
 00413900    push        ebp
 00413901    mov         ebp,esp
 00413903    add         esp,0FFFFFFF0
 00413906    push        ebx
 00413907    xor         edx,edx
 00413909    mov         dword ptr [ebp-10],edx
 0041390C    mov         dword ptr [ebp-0C],edx
 0041390F    mov         ebx,eax
 00413911    xor         eax,eax
 00413913    push        ebp
 00413914    push        4139AC
 00413919    push        dword ptr fs:[eax]
 0041391C    mov         dword ptr fs:[eax],esp
 0041391F    mov         edx,ebx
 00413921    lea         eax,[ebp-0C]
 00413924    call        @VarToWStr
 00413929    lea         eax,[ebp-8]
 0041392C    push        eax
 0041392D    push        0
 0041392F    push        400
 00413934    mov         eax,dword ptr [ebp-0C]
 00413937    push        eax
 00413938    mov         eax,[005AE754];^gvar_005E08B4
 0041393D    mov         eax,dword ptr [eax]
 0041393F    call        eax
 00413941    mov         edx,eax
 00413943    sub         edx,80020005
>00413949    je          00413955
 0041394B    sub         edx,7FFDFFFB
>00413951    jne         00413982
>00413953    jmp         0041398E
 00413955    lea         eax,[ebp-10]
 00413958    mov         edx,dword ptr [ebp-0C]
 0041395B    call        @LStrFromWStr
 00413960    mov         eax,dword ptr [ebp-10]
 00413963    lea         edx,[ebp-8]
 00413966    call        TryStrToCurr
 0041396B    test        al,al
>0041396D    jne         0041398E
 0041396F    mov         dx,word ptr [ebx]
 00413972    mov         cx,6
 00413976    mov         eax,80020005
 0041397B    call        VarResultCheck
>00413980    jmp         0041398E
 00413982    mov         dx,word ptr [ebx]
 00413985    mov         cx,6
 00413989    call        VarResultCheck
 0041398E    xor         eax,eax
 00413990    pop         edx
 00413991    pop         ecx
 00413992    pop         ecx
 00413993    mov         dword ptr fs:[eax],edx
 00413996    push        4139B3
 0041399B    lea         eax,[ebp-10]
 0041399E    call        @LStrClr
 004139A3    lea         eax,[ebp-0C]
 004139A6    call        @WStrClr
 004139AB    ret
>004139AC    jmp         @HandleFinally
>004139B1    jmp         0041399B
 004139B3    fild        qword ptr [ebp-8]
 004139B6    pop         ebx
 004139B7    mov         esp,ebp
 004139B9    pop         ebp
 004139BA    ret
*}
end;

//004139BC
function VarToCurrencyAsDouble(const V:TVarData; const Value:Double):Currency;
begin
{*
 004139BC    push        ebp
 004139BD    mov         ebp,esp
 004139BF    add         esp,0FFFFFFE8
 004139C2    push        ebx
 004139C3    mov         ebx,eax
 004139C5    lea         eax,[ebp-18]
 004139C8    push        eax
 004139C9    call        oleaut32.VariantInit
 004139CE    mov         word ptr [ebp-18],5
 004139D4    mov         eax,dword ptr [ebp+8]
 004139D7    mov         dword ptr [ebp-10],eax
 004139DA    mov         eax,dword ptr [ebp+0C]
 004139DD    mov         dword ptr [ebp-0C],eax
 004139E0    push        6
 004139E2    push        0
 004139E4    push        400
 004139E9    lea         eax,[ebp-18]
 004139EC    push        eax
 004139ED    lea         eax,[ebp-18]
 004139F0    push        eax
 004139F1    mov         eax,[005AE68C];^gvar_005E0870
 004139F6    mov         eax,dword ptr [eax]
 004139F8    call        eax
 004139FA    mov         dx,word ptr [ebx]
 004139FD    mov         cx,6
 00413A01    call        VarResultCheck
 00413A06    mov         eax,dword ptr [ebp-10]
 00413A09    mov         dword ptr [ebp-8],eax
 00413A0C    mov         eax,dword ptr [ebp-0C]
 00413A0F    mov         dword ptr [ebp-4],eax
 00413A12    fild        qword ptr [ebp-8]
 00413A15    pop         ebx
 00413A16    mov         esp,ebp
 00413A18    pop         ebp
 00413A19    ret         8
*}
end;

//00413A1C
function VarToCurrencyViaOS(const V:TVarData):Currency;
begin
{*
 00413A1C    push        ebx
 00413A1D    add         esp,0FFFFFFE8
 00413A20    mov         ebx,eax
 00413A22    lea         eax,[esp+8]
 00413A26    push        eax
 00413A27    call        oleaut32.VariantInit
 00413A2C    push        6
 00413A2E    push        0
 00413A30    push        400
 00413A35    push        ebx
 00413A36    lea         eax,[esp+18]
 00413A3A    push        eax
 00413A3B    mov         eax,[005AE68C];^gvar_005E0870
 00413A40    mov         eax,dword ptr [eax]
 00413A42    call        eax
 00413A44    mov         dx,word ptr [ebx]
 00413A47    mov         cx,6
 00413A4B    call        VarResultCheck
 00413A50    mov         eax,dword ptr [esp+10]
 00413A54    mov         dword ptr [esp],eax
 00413A57    mov         eax,dword ptr [esp+14]
 00413A5B    mov         dword ptr [esp+4],eax
 00413A5F    fild        qword ptr [esp]
 00413A62    add         esp,18
 00413A65    pop         ebx
 00413A66    ret
*}
end;

//00413A68
function VarToCurrencyAny(const V:TVarData):Currency;
begin
{*
 00413A68    push        ebp
 00413A69    mov         ebp,esp
 00413A6B    add         esp,0FFFFFFE8
 00413A6E    push        ebx
 00413A6F    mov         ebx,eax
 00413A71    lea         eax,[ebp-18]
 00413A74    push        eax
 00413A75    call        oleaut32.VariantInit
 00413A7A    xor         eax,eax
 00413A7C    push        ebp
 00413A7D    push        413ABD
 00413A82    push        dword ptr fs:[eax]
 00413A85    mov         dword ptr fs:[eax],esp
 00413A88    mov         edx,ebx
 00413A8A    lea         eax,[ebp-18]
 00413A8D    call        @VarCopy
 00413A92    lea         eax,[ebp-18]
 00413A95    call        dword ptr ds:[5E08E4]
 00413A9B    lea         eax,[ebp-18]
 00413A9E    call        @VarToCurrency
 00413AA3    fistp       qword ptr [ebp-8]
 00413AA6    wait
 00413AA7    xor         eax,eax
 00413AA9    pop         edx
 00413AAA    pop         ecx
 00413AAB    pop         ecx
 00413AAC    mov         dword ptr fs:[eax],edx
 00413AAF    push        413AC4
 00413AB4    lea         eax,[ebp-18]
 00413AB7    call        @VarClear
 00413ABC    ret
>00413ABD    jmp         @HandleFinally
>00413AC2    jmp         00413AB4
 00413AC4    fild        qword ptr [ebp-8]
 00413AC7    pop         ebx
 00413AC8    mov         esp,ebp
 00413ACA    pop         ebp
 00413ACB    ret
*}
end;

//00413ACC
function VarToCurrencyCustom(const V:TVarData; var AValue:Currency):Boolean;
begin
{*
 00413ACC    push        ebx
 00413ACD    push        esi
 00413ACE    push        edi
 00413ACF    add         esp,0FFFFFFEC
 00413AD2    mov         edi,edx
 00413AD4    mov         esi,eax
 00413AD6    mov         edx,esp
 00413AD8    mov         ax,word ptr [esi]
 00413ADB    call        FindCustomVariantType
 00413AE0    mov         ebx,eax
 00413AE2    test        bl,bl
>00413AE4    je          00413B0E
 00413AE6    lea         eax,[esp+4]
 00413AEA    push        eax
 00413AEB    call        oleaut32.VariantInit
 00413AF0    push        6
 00413AF2    mov         ecx,esi
 00413AF4    lea         edx,[esp+8]
 00413AF8    mov         eax,dword ptr [esp+4]
 00413AFC    mov         esi,dword ptr [eax]
 00413AFE    call        dword ptr [esi+1C]
 00413B01    mov         eax,dword ptr [esp+0C]
 00413B05    mov         dword ptr [edi],eax
 00413B07    mov         eax,dword ptr [esp+10]
 00413B0B    mov         dword ptr [edi+4],eax
 00413B0E    mov         eax,ebx
 00413B10    add         esp,14
 00413B13    pop         edi
 00413B14    pop         esi
 00413B15    pop         ebx
 00413B16    ret
*}
end;

//00413B18
function @VarToCurrency(const V:TVarData):Currency;
begin
{*
 00413B18    push        ebx
 00413B19    add         esp,0FFFFFFEC
 00413B1C    mov         ebx,eax
 00413B1E    mov         ax,word ptr [ebx]
 00413B21    movzx       edx,ax
 00413B24    cmp         edx,14
>00413B27    ja          00413CE8
 00413B2D    jmp         dword ptr [edx*4+413B34]
 00413B2D    dd          00413B88
 00413B2D    dd          00413B96
 00413B2D    dd          00413BBA
 00413B2D    dd          00413BCC
 00413B2D    dd          00413BDE
 00413B2D    dd          00413BDE
 00413B2D    dd          00413BEE
 00413B2D    dd          00413C00
 00413B2D    dd          00413C10
 00413B2D    dd          00413CD8
 00413B2D    dd          00413CE8
 00413B2D    dd          00413C20
 00413B2D    dd          00413CC7
 00413B2D    dd          00413CD8
 00413B2D    dd          00413CE8
 00413B2D    dd          00413CE8
 00413B2D    dd          00413C3B
 00413B2D    dd          00413C56
 00413B2D    dd          00413C72
 00413B2D    dd          00413C8D
 00413B2D    dd          00413CAD
 00413B88    xor         eax,eax
 00413B8A    mov         dword ptr [esp],eax
 00413B8D    mov         dword ptr [esp+4],eax
>00413B91    jmp         00413ED5
 00413B96    cmp         byte ptr ds:[5AC3AC],0
>00413B9D    je          00413BAC
 00413B9F    mov         dx,6
 00413BA3    mov         ax,1
 00413BA7    call        VarCastError
 00413BAC    xor         eax,eax
 00413BAE    mov         dword ptr [esp],eax
 00413BB1    mov         dword ptr [esp+4],eax
>00413BB5    jmp         00413ED5
 00413BBA    fild        word ptr [ebx+8]
 00413BBD    fmul        dword ptr ds:[413EE0]
 00413BC3    fistp       qword ptr [esp]
 00413BC6    wait
>00413BC7    jmp         00413ED5
 00413BCC    fild        dword ptr [ebx+8]
 00413BCF    fmul        dword ptr ds:[413EE0]
 00413BD5    fistp       qword ptr [esp]
 00413BD8    wait
>00413BD9    jmp         00413ED5
 00413BDE    mov         eax,ebx
 00413BE0    call        VarToCurrencyViaOS
 00413BE5    fistp       qword ptr [esp]
 00413BE8    wait
>00413BE9    jmp         00413ED5
 00413BEE    mov         eax,dword ptr [ebx+8]
 00413BF1    mov         dword ptr [esp],eax
 00413BF4    mov         eax,dword ptr [ebx+0C]
 00413BF7    mov         dword ptr [esp+4],eax
>00413BFB    jmp         00413ED5
 00413C00    mov         eax,ebx
 00413C02    call        VarToCurrencyViaOS
 00413C07    fistp       qword ptr [esp]
 00413C0A    wait
>00413C0B    jmp         00413ED5
 00413C10    mov         eax,ebx
 00413C12    call        VarToCurrencyAsString
 00413C17    fistp       qword ptr [esp]
 00413C1A    wait
>00413C1B    jmp         00413ED5
 00413C20    movsx       eax,word ptr [ebx+8]
 00413C24    mov         dword ptr [esp+8],eax
 00413C28    fild        dword ptr [esp+8]
 00413C2C    fmul        dword ptr ds:[413EE0]
 00413C32    fistp       qword ptr [esp]
 00413C35    wait
>00413C36    jmp         00413ED5
 00413C3B    movsx       eax,byte ptr [ebx+8]
 00413C3F    mov         dword ptr [esp+8],eax
 00413C43    fild        dword ptr [esp+8]
 00413C47    fmul        dword ptr ds:[413EE0]
 00413C4D    fistp       qword ptr [esp]
 00413C50    wait
>00413C51    jmp         00413ED5
 00413C56    xor         eax,eax
 00413C58    mov         al,byte ptr [ebx+8]
 00413C5B    mov         dword ptr [esp+8],eax
 00413C5F    fild        dword ptr [esp+8]
 00413C63    fmul        dword ptr ds:[413EE0]
 00413C69    fistp       qword ptr [esp]
 00413C6C    wait
>00413C6D    jmp         00413ED5
 00413C72    movzx       eax,word ptr [ebx+8]
 00413C76    mov         dword ptr [esp+8],eax
 00413C7A    fild        dword ptr [esp+8]
 00413C7E    fmul        dword ptr ds:[413EE0]
 00413C84    fistp       qword ptr [esp]
 00413C87    wait
>00413C88    jmp         00413ED5
 00413C8D    mov         eax,dword ptr [ebx+8]
 00413C90    mov         dword ptr [esp+0C],eax
 00413C94    xor         eax,eax
 00413C96    mov         dword ptr [esp+10],eax
 00413C9A    fild        qword ptr [esp+0C]
 00413C9E    fmul        dword ptr ds:[413EE0]
 00413CA4    fistp       qword ptr [esp]
 00413CA7    wait
>00413CA8    jmp         00413ED5
 00413CAD    fild        qword ptr [ebx+8]
 00413CB0    add         esp,0FFFFFFF8
 00413CB3    fstp        qword ptr [esp]
 00413CB6    wait
 00413CB7    mov         eax,ebx
 00413CB9    call        VarToCurrencyAsDouble
 00413CBE    fistp       qword ptr [esp]
 00413CC1    wait
>00413CC2    jmp         00413ED5
 00413CC7    mov         eax,dword ptr [ebx+8]
 00413CCA    call        @VarToCurrency
 00413CCF    fistp       qword ptr [esp]
 00413CD2    wait
>00413CD3    jmp         00413ED5
 00413CD8    mov         eax,ebx
 00413CDA    call        VarToCurrencyViaOS
 00413CDF    fistp       qword ptr [esp]
 00413CE2    wait
>00413CE3    jmp         00413ED5
 00413CE8    mov         edx,eax
 00413CEA    sub         dx,100
>00413CEF    je          00413CF8
 00413CF1    dec         dx
>00413CF4    je          00413D08
>00413CF6    jmp         00413D18
 00413CF8    mov         eax,ebx
 00413CFA    call        VarToCurrencyAsString
 00413CFF    fistp       qword ptr [esp]
 00413D02    wait
>00413D03    jmp         00413ED5
 00413D08    mov         eax,ebx
 00413D0A    call        VarToCurrencyAny
 00413D0F    fistp       qword ptr [esp]
 00413D12    wait
>00413D13    jmp         00413ED5
 00413D18    test        ah,40
>00413D1B    je          00413EBD
 00413D21    movzx       eax,ax
 00413D24    and         eax,0FFFFBFFF
 00413D29    cmp         eax,14
>00413D2C    ja          00413EB0
 00413D32    jmp         dword ptr [eax*4+413D39]
 00413D32    dd          00413EB0
 00413D32    dd          00413EB0
 00413D32    dd          00413D8D
 00413D32    dd          00413DA1
 00413D32    dd          00413DB5
 00413D32    dd          00413DB5
 00413D32    dd          00413DC5
 00413D32    dd          00413DD9
 00413D32    dd          00413DE9
 00413D32    dd          00413EB0
 00413D32    dd          00413EB0
 00413D32    dd          00413DF9
 00413D32    dd          00413EA2
 00413D32    dd          00413EB0
 00413D32    dd          00413EB0
 00413D32    dd          00413EB0
 00413D32    dd          00413E16
 00413D32    dd          00413E33
 00413D32    dd          00413E50
 00413D32    dd          00413E6A
 00413D32    dd          00413E89
 00413D8D    mov         eax,dword ptr [ebx+8]
 00413D90    fild        word ptr [eax]
 00413D92    fmul        dword ptr ds:[413EE0]
 00413D98    fistp       qword ptr [esp]
 00413D9B    wait
>00413D9C    jmp         00413ED5
 00413DA1    mov         eax,dword ptr [ebx+8]
 00413DA4    fild        dword ptr [eax]
 00413DA6    fmul        dword ptr ds:[413EE0]
 00413DAC    fistp       qword ptr [esp]
 00413DAF    wait
>00413DB0    jmp         00413ED5
 00413DB5    mov         eax,ebx
 00413DB7    call        VarToCurrencyViaOS
 00413DBC    fistp       qword ptr [esp]
 00413DBF    wait
>00413DC0    jmp         00413ED5
 00413DC5    mov         eax,dword ptr [ebx+8]
 00413DC8    mov         edx,dword ptr [eax]
 00413DCA    mov         dword ptr [esp],edx
 00413DCD    mov         edx,dword ptr [eax+4]
 00413DD0    mov         dword ptr [esp+4],edx
>00413DD4    jmp         00413ED5
 00413DD9    mov         eax,ebx
 00413DDB    call        VarToCurrencyViaOS
 00413DE0    fistp       qword ptr [esp]
 00413DE3    wait
>00413DE4    jmp         00413ED5
 00413DE9    mov         eax,ebx
 00413DEB    call        VarToCurrencyAsString
 00413DF0    fistp       qword ptr [esp]
 00413DF3    wait
>00413DF4    jmp         00413ED5
 00413DF9    mov         eax,dword ptr [ebx+8]
 00413DFC    movsx       eax,word ptr [eax]
 00413DFF    mov         dword ptr [esp+8],eax
 00413E03    fild        dword ptr [esp+8]
 00413E07    fmul        dword ptr ds:[413EE0]
 00413E0D    fistp       qword ptr [esp]
 00413E10    wait
>00413E11    jmp         00413ED5
 00413E16    mov         eax,dword ptr [ebx+8]
 00413E19    movsx       eax,byte ptr [eax]
 00413E1C    mov         dword ptr [esp+8],eax
 00413E20    fild        dword ptr [esp+8]
 00413E24    fmul        dword ptr ds:[413EE0]
 00413E2A    fistp       qword ptr [esp]
 00413E2D    wait
>00413E2E    jmp         00413ED5
 00413E33    mov         eax,dword ptr [ebx+8]
 00413E36    movzx       eax,byte ptr [eax]
 00413E39    mov         dword ptr [esp+8],eax
 00413E3D    fild        dword ptr [esp+8]
 00413E41    fmul        dword ptr ds:[413EE0]
 00413E47    fistp       qword ptr [esp]
 00413E4A    wait
>00413E4B    jmp         00413ED5
 00413E50    mov         eax,dword ptr [ebx+8]
 00413E53    movzx       eax,word ptr [eax]
 00413E56    mov         dword ptr [esp+8],eax
 00413E5A    fild        dword ptr [esp+8]
 00413E5E    fmul        dword ptr ds:[413EE0]
 00413E64    fistp       qword ptr [esp]
 00413E67    wait
>00413E68    jmp         00413ED5
 00413E6A    mov         eax,dword ptr [ebx+8]
 00413E6D    mov         eax,dword ptr [eax]
 00413E6F    mov         dword ptr [esp+0C],eax
 00413E73    xor         eax,eax
 00413E75    mov         dword ptr [esp+10],eax
 00413E79    fild        qword ptr [esp+0C]
 00413E7D    fmul        dword ptr ds:[413EE0]
 00413E83    fistp       qword ptr [esp]
 00413E86    wait
>00413E87    jmp         00413ED5
 00413E89    mov         eax,dword ptr [ebx+8]
 00413E8C    fild        qword ptr [eax]
 00413E8E    add         esp,0FFFFFFF8
 00413E91    fstp        qword ptr [esp]
 00413E94    wait
 00413E95    mov         eax,ebx
 00413E97    call        VarToCurrencyAsDouble
 00413E9C    fistp       qword ptr [esp]
 00413E9F    wait
>00413EA0    jmp         00413ED5
 00413EA2    mov         eax,dword ptr [ebx+8]
 00413EA5    call        @VarToCurrency
 00413EAA    fistp       qword ptr [esp]
 00413EAD    wait
>00413EAE    jmp         00413ED5
 00413EB0    mov         eax,ebx
 00413EB2    call        VarToCurrencyViaOS
 00413EB7    fistp       qword ptr [esp]
 00413EBA    wait
>00413EBB    jmp         00413ED5
 00413EBD    mov         edx,esp
 00413EBF    mov         eax,ebx
 00413EC1    call        VarToCurrencyCustom
 00413EC6    test        al,al
>00413EC8    jne         00413ED5
 00413ECA    mov         eax,ebx
 00413ECC    call        VarToCurrencyViaOS
 00413ED1    fistp       qword ptr [esp]
 00413ED4    wait
 00413ED5    fild        qword ptr [esp]
 00413ED8    add         esp,14
 00413EDB    pop         ebx
 00413EDC    ret
*}
end;

//00413EE4
function CurrToWStrViaOS(const AValue:Currency):WideString;
begin
{*
 00413EE4    push        ebp
 00413EE5    mov         ebp,esp
 00413EE7    push        ebx
 00413EE8    mov         ebx,eax
 00413EEA    mov         eax,ebx
 00413EEC    call        @WStrClr
 00413EF1    push        eax
 00413EF2    push        0
 00413EF4    push        400
 00413EF9    push        dword ptr [ebp+0C]
 00413EFC    push        dword ptr [ebp+8]
 00413EFF    mov         eax,[005AE1D8];^gvar_005E08BC
 00413F04    mov         eax,dword ptr [eax]
 00413F06    call        eax
 00413F08    mov         cx,8
 00413F0C    mov         dx,6
 00413F10    call        VarResultCheck
 00413F15    pop         ebx
 00413F16    pop         ebp
 00413F17    ret         8
*}
end;

//00413F1C
function DateToWStrViaOS(const AValue:TDateTime):WideString;
begin
{*
 00413F1C    push        ebp
 00413F1D    mov         ebp,esp
 00413F1F    push        ebx
 00413F20    mov         ebx,eax
 00413F22    mov         eax,ebx
 00413F24    call        @WStrClr
 00413F29    push        eax
 00413F2A    push        0
 00413F2C    push        400
 00413F31    push        dword ptr [ebp+0C]
 00413F34    push        dword ptr [ebp+8]
 00413F37    mov         eax,[005AE494];^gvar_005E08C0
 00413F3C    mov         eax,dword ptr [eax]
 00413F3E    call        eax
 00413F40    mov         cx,8
 00413F44    mov         dx,7
 00413F48    call        VarResultCheck
 00413F4D    pop         ebx
 00413F4E    pop         ebp
 00413F4F    ret         8
*}
end;

//00413F54
function BoolToWStrViaOS(const AValue:WordBool):WideString;
begin
{*
 00413F54    push        ebp
 00413F55    mov         ebp,esp
 00413F57    xor         ecx,ecx
 00413F59    push        ecx
 00413F5A    push        ecx
 00413F5B    push        ecx
 00413F5C    push        ecx
 00413F5D    push        ebx
 00413F5E    push        esi
 00413F5F    mov         ebx,edx
 00413F61    mov         esi,eax
 00413F63    xor         eax,eax
 00413F65    push        ebp
 00413F66    push        41400A
 00413F6B    push        dword ptr fs:[eax]
 00413F6E    mov         dword ptr fs:[eax],esp
 00413F71    mov         eax,ebx
 00413F73    call        @WStrClr
 00413F78    push        eax
 00413F79    push        0
 00413F7B    push        400
 00413F80    push        esi
 00413F81    mov         eax,[005AE658];^gvar_005E08C4
 00413F86    mov         eax,dword ptr [eax]
 00413F88    call        eax
 00413F8A    mov         cx,8
 00413F8E    mov         dx,0B
 00413F92    call        VarResultCheck
 00413F97    mov         al,[005AC3B8]
 00413F9C    sub         al,1
>00413F9E    jb          00413FEF
>00413FA0    je          00413FA8
 00413FA2    dec         al
>00413FA4    je          00413FC9
>00413FA6    jmp         00413FEA
 00413FA8    lea         eax,[ebp-8]
 00413FAB    mov         edx,dword ptr [ebx]
 00413FAD    call        @LStrFromWStr
 00413FB2    mov         eax,dword ptr [ebp-8]
 00413FB5    lea         edx,[ebp-4]
 00413FB8    call        LowerCase
 00413FBD    mov         edx,dword ptr [ebp-4]
 00413FC0    mov         eax,ebx
 00413FC2    call        @WStrFromLStr
>00413FC7    jmp         00413FEF
 00413FC9    lea         eax,[ebp-10]
 00413FCC    mov         edx,dword ptr [ebx]
 00413FCE    call        @LStrFromWStr
 00413FD3    mov         eax,dword ptr [ebp-10]
 00413FD6    lea         edx,[ebp-0C]
 00413FD9    call        UpperCase
 00413FDE    mov         edx,dword ptr [ebp-0C]
 00413FE1    mov         eax,ebx
 00413FE3    call        @WStrFromLStr
>00413FE8    jmp         00413FEF
 00413FEA    call        VarInvalidOp
 00413FEF    xor         eax,eax
 00413FF1    pop         edx
 00413FF2    pop         ecx
 00413FF3    pop         ecx
 00413FF4    mov         dword ptr fs:[eax],edx
 00413FF7    push        414011
 00413FFC    lea         eax,[ebp-10]
 00413FFF    mov         edx,4
 00414004    call        @LStrArrayClr
 00414009    ret
>0041400A    jmp         @HandleFinally
>0041400F    jmp         00413FFC
 00414011    pop         esi
 00414012    pop         ebx
 00414013    mov         esp,ebp
 00414015    pop         ebp
 00414016    ret
*}
end;

//00414018
function VarToLStrViaOS(const V:TVarData):AnsiString;
begin
{*
 00414018    push        ebp
 00414019    mov         ebp,esp
 0041401B    add         esp,0FFFFFFE8
 0041401E    push        ebx
 0041401F    push        esi
 00414020    xor         ecx,ecx
 00414022    mov         dword ptr [ebp-14],ecx
 00414025    mov         dword ptr [ebp-18],ecx
 00414028    mov         esi,edx
 0041402A    mov         ebx,eax
 0041402C    xor         eax,eax
 0041402E    push        ebp
 0041402F    push        4140D7
 00414034    push        dword ptr fs:[eax]
 00414037    mov         dword ptr fs:[eax],esp
 0041403A    lea         eax,[ebp-10]
 0041403D    push        eax
 0041403E    call        oleaut32.VariantInit
 00414043    xor         eax,eax
 00414045    push        ebp
 00414046    push        4140B5
 0041404B    push        dword ptr fs:[eax]
 0041404E    mov         dword ptr fs:[eax],esp
 00414051    push        8
 00414053    push        0
 00414055    push        400
 0041405A    push        ebx
 0041405B    lea         eax,[ebp-10]
 0041405E    push        eax
 0041405F    mov         eax,[005AE68C];^gvar_005E0870
 00414064    mov         eax,dword ptr [eax]
 00414066    call        eax
 00414068    mov         dx,word ptr [ebx]
 0041406B    mov         cx,100
 0041406F    call        VarResultCheck
 00414074    lea         eax,[ebp-14]
 00414077    push        eax
 00414078    lea         eax,[ebp-18]
 0041407B    mov         edx,dword ptr [ebp-8]
 0041407E    call        @WStrFromPWChar
 00414083    mov         eax,dword ptr [ebp-18]
 00414086    mov         ecx,7FFFFFFF
 0041408B    mov         edx,1
 00414090    call        @WStrCopy
 00414095    mov         edx,dword ptr [ebp-14]
 00414098    mov         eax,esi
 0041409A    call        @LStrFromWStr
 0041409F    xor         eax,eax
 004140A1    pop         edx
 004140A2    pop         ecx
 004140A3    pop         ecx
 004140A4    mov         dword ptr fs:[eax],edx
 004140A7    push        4140BC
 004140AC    lea         eax,[ebp-10]
 004140AF    call        @VarClear
 004140B4    ret
>004140B5    jmp         @HandleFinally
>004140BA    jmp         004140AC
 004140BC    xor         eax,eax
 004140BE    pop         edx
 004140BF    pop         ecx
 004140C0    pop         ecx
 004140C1    mov         dword ptr fs:[eax],edx
 004140C4    push        4140DE
 004140C9    lea         eax,[ebp-18]
 004140CC    mov         edx,2
 004140D1    call        @WStrArrayClr
 004140D6    ret
>004140D7    jmp         @HandleFinally
>004140DC    jmp         004140C9
 004140DE    pop         esi
 004140DF    pop         ebx
 004140E0    mov         esp,ebp
 004140E2    pop         ebp
 004140E3    ret
*}
end;

//004140E4
function VarToLStrAny(const V:TVarData):AnsiString;
begin
{*
 004140E4    push        ebp
 004140E5    mov         ebp,esp
 004140E7    add         esp,0FFFFFFF0
 004140EA    push        ebx
 004140EB    push        esi
 004140EC    mov         esi,edx
 004140EE    mov         ebx,eax
 004140F0    lea         eax,[ebp-10]
 004140F3    push        eax
 004140F4    call        oleaut32.VariantInit
 004140F9    xor         eax,eax
 004140FB    push        ebp
 004140FC    push        41413A
 00414101    push        dword ptr fs:[eax]
 00414104    mov         dword ptr fs:[eax],esp
 00414107    mov         edx,ebx
 00414109    lea         eax,[ebp-10]
 0041410C    call        @VarCopy
 00414111    lea         eax,[ebp-10]
 00414114    call        dword ptr ds:[5E08E4]
 0041411A    lea         edx,[ebp-10]
 0041411D    mov         eax,esi
 0041411F    call        @VarToLStr
 00414124    xor         eax,eax
 00414126    pop         edx
 00414127    pop         ecx
 00414128    pop         ecx
 00414129    mov         dword ptr fs:[eax],edx
 0041412C    push        414141
 00414131    lea         eax,[ebp-10]
 00414134    call        @VarClear
 00414139    ret
>0041413A    jmp         @HandleFinally
>0041413F    jmp         00414131
 00414141    pop         esi
 00414142    pop         ebx
 00414143    mov         esp,ebp
 00414145    pop         ebp
 00414146    ret
*}
end;

//00414148
function VarToLStrCustom(const V:TVarData; var AValue:AnsiString):Boolean;
begin
{*
 00414148    push        ebp
 00414149    mov         ebp,esp
 0041414B    add         esp,0FFFFFFE4
 0041414E    push        ebx
 0041414F    mov         dword ptr [ebp-4],edx
 00414152    mov         ebx,eax
 00414154    mov         eax,dword ptr [ebp-4]
 00414157    test        eax,eax
>00414159    je          0041415F
 0041415B    xor         edx,edx
 0041415D    mov         dword ptr [eax],edx
 0041415F    lea         edx,[ebp-0C]
 00414162    mov         ax,word ptr [ebx]
 00414165    call        FindCustomVariantType
 0041416A    mov         byte ptr [ebp-5],al
 0041416D    cmp         byte ptr [ebp-5],0
>00414171    je          004141C4
 00414173    lea         eax,[ebp-1C]
 00414176    push        eax
 00414177    call        oleaut32.VariantInit
 0041417C    xor         eax,eax
 0041417E    push        ebp
 0041417F    push        4141BD
 00414184    push        dword ptr fs:[eax]
 00414187    mov         dword ptr fs:[eax],esp
 0041418A    push        100
 0041418F    mov         ecx,ebx
 00414191    lea         edx,[ebp-1C]
 00414194    mov         eax,dword ptr [ebp-0C]
 00414197    mov         ebx,dword ptr [eax]
 00414199    call        dword ptr [ebx+1C]
 0041419C    mov         eax,dword ptr [ebp-4]
 0041419F    mov         edx,dword ptr [ebp-14]
 004141A2    call        @LStrAsg
 004141A7    xor         eax,eax
 004141A9    pop         edx
 004141AA    pop         ecx
 004141AB    pop         ecx
 004141AC    mov         dword ptr fs:[eax],edx
 004141AF    push        4141C4
 004141B4    lea         eax,[ebp-1C]
 004141B7    call        @VarClear
 004141BC    ret
>004141BD    jmp         @HandleFinally
>004141C2    jmp         004141B4
 004141C4    mov         al,byte ptr [ebp-5]
 004141C7    pop         ebx
 004141C8    mov         esp,ebp
 004141CA    pop         ebp
 004141CB    ret
*}
end;

//004141CC
procedure @VarToLStr(var S:AnsiString; const V:TVarData);
begin
{*
 004141CC    push        ebp
 004141CD    mov         ebp,esp
 004141CF    mov         ecx,0F
 004141D4    push        0
 004141D6    push        0
 004141D8    dec         ecx
>004141D9    jne         004141D4
 004141DB    push        ebx
 004141DC    push        esi
 004141DD    mov         ebx,edx
 004141DF    mov         esi,eax
 004141E1    xor         eax,eax
 004141E3    push        ebp
 004141E4    push        414703
 004141E9    push        dword ptr fs:[eax]
 004141EC    mov         dword ptr fs:[eax],esp
 004141EF    mov         ax,word ptr [ebx]
 004141F2    movzx       edx,ax
 004141F5    cmp         edx,14
>004141F8    ja          00414440
 004141FE    jmp         dword ptr [edx*4+414205]
 004141FE    dd          00414259
 004141FE    dd          00414265
 004141FE    dd          0041428D
 004141FE    dd          004142A8
 004141FE    dd          004142C2
 004141FE    dd          004142E3
 004141FE    dd          00414304
 004141FE    dd          00414321
 004141FE    dd          0041433E
 004141FE    dd          00414427
 004141FE    dd          00414440
 004141FE    dd          0041436E
 004141FE    dd          00414416
 004141FE    dd          00414427
 004141FE    dd          00414440
 004141FE    dd          00414440
 004141FE    dd          00414389
 004141FE    dd          004143A4
 004141FE    dd          004143C0
 004141FE    dd          004143DB
 004141FE    dd          004143F9
 00414259    mov         eax,esi
 0041425B    call        @LStrClr
>00414260    jmp         004146B4
 00414265    cmp         byte ptr ds:[5AC3AC],0
>0041426C    je          0041427B
 0041426E    mov         dx,100
 00414272    mov         ax,1
 00414276    call        VarCastError
 0041427B    mov         eax,esi
 0041427D    mov         edx,dword ptr ds:[5AC3B0]
 00414283    call        @LStrAsg
>00414288    jmp         004146B4
 0041428D    lea         edx,[ebp-4]
 00414290    movsx       eax,word ptr [ebx+8]
 00414294    call        IntToStr
 00414299    mov         edx,dword ptr [ebp-4]
 0041429C    mov         eax,esi
 0041429E    call        @LStrAsg
>004142A3    jmp         004146B4
 004142A8    lea         edx,[ebp-8]
 004142AB    mov         eax,dword ptr [ebx+8]
 004142AE    call        IntToStr
 004142B3    mov         edx,dword ptr [ebp-8]
 004142B6    mov         eax,esi
 004142B8    call        @LStrAsg
>004142BD    jmp         004146B4
 004142C2    fld         dword ptr [ebx+8]
 004142C5    add         esp,0FFFFFFF4
 004142C8    fstp        tbyte ptr [esp]
 004142CB    wait
 004142CC    lea         eax,[ebp-0C]
 004142CF    call        FloatToStr
 004142D4    mov         edx,dword ptr [ebp-0C]
 004142D7    mov         eax,esi
 004142D9    call        @LStrAsg
>004142DE    jmp         004146B4
 004142E3    fld         qword ptr [ebx+8]
 004142E6    add         esp,0FFFFFFF4
 004142E9    fstp        tbyte ptr [esp]
 004142EC    wait
 004142ED    lea         eax,[ebp-10]
 004142F0    call        FloatToStr
 004142F5    mov         edx,dword ptr [ebp-10]
 004142F8    mov         eax,esi
 004142FA    call        @LStrAsg
>004142FF    jmp         004146B4
 00414304    push        dword ptr [ebx+0C]
 00414307    push        dword ptr [ebx+8]
 0041430A    lea         eax,[ebp-14]
 0041430D    call        CurrToWStrViaOS
 00414312    mov         edx,dword ptr [ebp-14]
 00414315    mov         eax,esi
 00414317    call        @LStrFromWStr
>0041431C    jmp         004146B4
 00414321    push        dword ptr [ebx+0C]
 00414324    push        dword ptr [ebx+8]
 00414327    lea         eax,[ebp-18]
 0041432A    call        DateToWStrViaOS
 0041432F    mov         edx,dword ptr [ebp-18]
 00414332    mov         eax,esi
 00414334    call        @LStrFromWStr
>00414339    jmp         004146B4
 0041433E    lea         eax,[ebp-1C]
 00414341    push        eax
 00414342    lea         eax,[ebp-20]
 00414345    mov         edx,dword ptr [ebx+8]
 00414348    call        @WStrFromPWChar
 0041434D    mov         eax,dword ptr [ebp-20]
 00414350    mov         ecx,7FFFFFFF
 00414355    mov         edx,1
 0041435A    call        @WStrCopy
 0041435F    mov         edx,dword ptr [ebp-1C]
 00414362    mov         eax,esi
 00414364    call        @LStrFromWStr
>00414369    jmp         004146B4
 0041436E    lea         edx,[ebp-24]
 00414371    mov         ax,word ptr [ebx+8]
 00414375    call        BoolToWStrViaOS
 0041437A    mov         edx,dword ptr [ebp-24]
 0041437D    mov         eax,esi
 0041437F    call        @LStrFromWStr
>00414384    jmp         004146B4
 00414389    lea         edx,[ebp-28]
 0041438C    movsx       eax,byte ptr [ebx+8]
 00414390    call        IntToStr
 00414395    mov         edx,dword ptr [ebp-28]
 00414398    mov         eax,esi
 0041439A    call        @LStrAsg
>0041439F    jmp         004146B4
 004143A4    lea         edx,[ebp-2C]
 004143A7    xor         eax,eax
 004143A9    mov         al,byte ptr [ebx+8]
 004143AC    call        IntToStr
 004143B1    mov         edx,dword ptr [ebp-2C]
 004143B4    mov         eax,esi
 004143B6    call        @LStrAsg
>004143BB    jmp         004146B4
 004143C0    lea         edx,[ebp-30]
 004143C3    movzx       eax,word ptr [ebx+8]
 004143C7    call        IntToStr
 004143CC    mov         edx,dword ptr [ebp-30]
 004143CF    mov         eax,esi
 004143D1    call        @LStrAsg
>004143D6    jmp         004146B4
 004143DB    mov         eax,dword ptr [ebx+8]
 004143DE    xor         edx,edx
 004143E0    push        edx
 004143E1    push        eax
 004143E2    lea         eax,[ebp-34]
 004143E5    call        IntToStr
 004143EA    mov         edx,dword ptr [ebp-34]
 004143ED    mov         eax,esi
 004143EF    call        @LStrAsg
>004143F4    jmp         004146B4
 004143F9    push        dword ptr [ebx+0C]
 004143FC    push        dword ptr [ebx+8]
 004143FF    lea         eax,[ebp-38]
 00414402    call        IntToStr
 00414407    mov         edx,dword ptr [ebp-38]
 0041440A    mov         eax,esi
 0041440C    call        @LStrAsg
>00414411    jmp         004146B4
 00414416    mov         eax,dword ptr [ebx+8]
 00414419    mov         edx,eax
 0041441B    mov         eax,esi
 0041441D    call        @VarToLStr
>00414422    jmp         004146B4
 00414427    lea         edx,[ebp-3C]
 0041442A    mov         eax,ebx
 0041442C    call        VarToLStrViaOS
 00414431    mov         edx,dword ptr [ebp-3C]
 00414434    mov         eax,esi
 00414436    call        @LStrAsg
>0041443B    jmp         004146B4
 00414440    mov         edx,eax
 00414442    sub         dx,100
>00414447    je          00414450
 00414449    dec         dx
>0041444C    je          0041445F
>0041444E    jmp         00414478
 00414450    mov         eax,esi
 00414452    mov         edx,dword ptr [ebx+8]
 00414455    call        @LStrAsg
>0041445A    jmp         004146B4
 0041445F    lea         edx,[ebp-40]
 00414462    mov         eax,ebx
 00414464    call        VarToLStrAny
 00414469    mov         edx,dword ptr [ebp-40]
 0041446C    mov         eax,esi
 0041446E    call        @LStrAsg
>00414473    jmp         004146B4
 00414478    test        ah,40
>0041447B    je          0041468C
 00414481    movzx       eax,ax
 00414484    and         eax,0FFFFBFFF
 00414489    cmp         eax,14
>0041448C    ja          00414676
 00414492    jmp         dword ptr [eax*4+414499]
 00414492    dd          00414676
 00414492    dd          00414676
 00414492    dd          004144ED
 00414492    dd          0041450A
 00414492    dd          00414526
 00414492    dd          00414549
 00414492    dd          0041456C
 00414492    dd          0041458B
 00414492    dd          004145AA
 00414492    dd          00414676
 00414492    dd          00414676
 00414492    dd          004145BB
 00414492    dd          00414668
 00414492    dd          00414676
 00414492    dd          00414676
 00414492    dd          00414676
 00414492    dd          004145D8
 00414492    dd          004145F5
 00414492    dd          00414612
 00414492    dd          0041462F
 00414492    dd          0041464C
 004144ED    lea         edx,[ebp-44]
 004144F0    mov         eax,dword ptr [ebx+8]
 004144F3    movsx       eax,word ptr [eax]
 004144F6    call        IntToStr
 004144FB    mov         edx,dword ptr [ebp-44]
 004144FE    mov         eax,esi
 00414500    call        @LStrAsg
>00414505    jmp         004146B4
 0041450A    lea         edx,[ebp-48]
 0041450D    mov         eax,dword ptr [ebx+8]
 00414510    mov         eax,dword ptr [eax]
 00414512    call        IntToStr
 00414517    mov         edx,dword ptr [ebp-48]
 0041451A    mov         eax,esi
 0041451C    call        @LStrAsg
>00414521    jmp         004146B4
 00414526    mov         eax,dword ptr [ebx+8]
 00414529    fld         dword ptr [eax]
 0041452B    add         esp,0FFFFFFF4
 0041452E    fstp        tbyte ptr [esp]
 00414531    wait
 00414532    lea         eax,[ebp-4C]
 00414535    call        FloatToStr
 0041453A    mov         edx,dword ptr [ebp-4C]
 0041453D    mov         eax,esi
 0041453F    call        @LStrAsg
>00414544    jmp         004146B4
 00414549    mov         eax,dword ptr [ebx+8]
 0041454C    fld         qword ptr [eax]
 0041454E    add         esp,0FFFFFFF4
 00414551    fstp        tbyte ptr [esp]
 00414554    wait
 00414555    lea         eax,[ebp-50]
 00414558    call        FloatToStr
 0041455D    mov         edx,dword ptr [ebp-50]
 00414560    mov         eax,esi
 00414562    call        @LStrAsg
>00414567    jmp         004146B4
 0041456C    mov         eax,dword ptr [ebx+8]
 0041456F    push        dword ptr [eax+4]
 00414572    push        dword ptr [eax]
 00414574    lea         eax,[ebp-54]
 00414577    call        CurrToWStrViaOS
 0041457C    mov         edx,dword ptr [ebp-54]
 0041457F    mov         eax,esi
 00414581    call        @LStrFromWStr
>00414586    jmp         004146B4
 0041458B    mov         eax,dword ptr [ebx+8]
 0041458E    push        dword ptr [eax+4]
 00414591    push        dword ptr [eax]
 00414593    lea         eax,[ebp-58]
 00414596    call        DateToWStrViaOS
 0041459B    mov         edx,dword ptr [ebp-58]
 0041459E    mov         eax,esi
 004145A0    call        @LStrFromWStr
>004145A5    jmp         004146B4
 004145AA    mov         eax,esi
 004145AC    mov         edx,dword ptr [ebx+8]
 004145AF    mov         edx,dword ptr [edx]
 004145B1    call        @LStrFromPWChar
>004145B6    jmp         004146B4
 004145BB    lea         edx,[ebp-5C]
 004145BE    mov         eax,dword ptr [ebx+8]
 004145C1    mov         ax,word ptr [eax]
 004145C4    call        BoolToWStrViaOS
 004145C9    mov         edx,dword ptr [ebp-5C]
 004145CC    mov         eax,esi
 004145CE    call        @LStrFromWStr
>004145D3    jmp         004146B4
 004145D8    lea         edx,[ebp-60]
 004145DB    mov         eax,dword ptr [ebx+8]
 004145DE    movsx       eax,byte ptr [eax]
 004145E1    call        IntToStr
 004145E6    mov         edx,dword ptr [ebp-60]
 004145E9    mov         eax,esi
 004145EB    call        @LStrAsg
>004145F0    jmp         004146B4
 004145F5    lea         edx,[ebp-64]
 004145F8    mov         eax,dword ptr [ebx+8]
 004145FB    movzx       eax,byte ptr [eax]
 004145FE    call        IntToStr
 00414603    mov         edx,dword ptr [ebp-64]
 00414606    mov         eax,esi
 00414608    call        @LStrAsg
>0041460D    jmp         004146B4
 00414612    lea         edx,[ebp-68]
 00414615    mov         eax,dword ptr [ebx+8]
 00414618    movzx       eax,word ptr [eax]
 0041461B    call        IntToStr
 00414620    mov         edx,dword ptr [ebp-68]
 00414623    mov         eax,esi
 00414625    call        @LStrAsg
>0041462A    jmp         004146B4
 0041462F    mov         eax,dword ptr [ebx+8]
 00414632    mov         eax,dword ptr [eax]
 00414634    xor         edx,edx
 00414636    push        edx
 00414637    push        eax
 00414638    lea         eax,[ebp-6C]
 0041463B    call        IntToStr
 00414640    mov         edx,dword ptr [ebp-6C]
 00414643    mov         eax,esi
 00414645    call        @LStrAsg
>0041464A    jmp         004146B4
 0041464C    mov         eax,dword ptr [ebx+8]
 0041464F    push        dword ptr [eax+4]
 00414652    push        dword ptr [eax]
 00414654    lea         eax,[ebp-70]
 00414657    call        IntToStr
 0041465C    mov         edx,dword ptr [ebp-70]
 0041465F    mov         eax,esi
 00414661    call        @LStrAsg
>00414666    jmp         004146B4
 00414668    mov         eax,dword ptr [ebx+8]
 0041466B    mov         edx,eax
 0041466D    mov         eax,esi
 0041466F    call        @VarToLStr
>00414674    jmp         004146B4
 00414676    lea         edx,[ebp-74]
 00414679    mov         eax,ebx
 0041467B    call        VarToLStrViaOS
 00414680    mov         edx,dword ptr [ebp-74]
 00414683    mov         eax,esi
 00414685    call        @LStrAsg
>0041468A    jmp         004146B4
 0041468C    mov         eax,esi
 0041468E    call        @LStrClr
 00414693    mov         edx,eax
 00414695    mov         eax,ebx
 00414697    call        VarToLStrCustom
 0041469C    test        al,al
>0041469E    jne         004146B4
 004146A0    lea         edx,[ebp-78]
 004146A3    mov         eax,ebx
 004146A5    call        VarToLStrViaOS
 004146AA    mov         edx,dword ptr [ebp-78]
 004146AD    mov         eax,esi
 004146AF    call        @LStrAsg
 004146B4    xor         eax,eax
 004146B6    pop         edx
 004146B7    pop         ecx
 004146B8    pop         ecx
 004146B9    mov         dword ptr fs:[eax],edx
 004146BC    push        41470A
 004146C1    lea         eax,[ebp-78]
 004146C4    mov         edx,7
 004146C9    call        @LStrArrayClr
 004146CE    lea         eax,[ebp-5C]
 004146D1    mov         edx,3
 004146D6    call        @WStrArrayClr
 004146DB    lea         eax,[ebp-50]
 004146DE    mov         edx,0B
 004146E3    call        @LStrArrayClr
 004146E8    lea         eax,[ebp-24]
 004146EB    mov         edx,5
 004146F0    call        @WStrArrayClr
 004146F5    lea         eax,[ebp-10]
 004146F8    mov         edx,4
 004146FD    call        @LStrArrayClr
 00414702    ret
>00414703    jmp         @HandleFinally
>00414708    jmp         004146C1
 0041470A    pop         esi
 0041470B    pop         ebx
 0041470C    mov         esp,ebp
 0041470E    pop         ebp
 0041470F    ret
*}
end;

//00414710
function VarToWStrViaOS(const V:TVarData):WideString;
begin
{*
 00414710    push        ebp
 00414711    mov         ebp,esp
 00414713    add         esp,0FFFFFFEC
 00414716    push        ebx
 00414717    push        esi
 00414718    xor         ecx,ecx
 0041471A    mov         dword ptr [ebp-14],ecx
 0041471D    mov         esi,edx
 0041471F    mov         ebx,eax
 00414721    xor         eax,eax
 00414723    push        ebp
 00414724    push        4147BA
 00414729    push        dword ptr fs:[eax]
 0041472C    mov         dword ptr fs:[eax],esp
 0041472F    lea         eax,[ebp-10]
 00414732    push        eax
 00414733    call        oleaut32.VariantInit
 00414738    xor         eax,eax
 0041473A    push        ebp
 0041473B    push        41479D
 00414740    push        dword ptr fs:[eax]
 00414743    mov         dword ptr fs:[eax],esp
 00414746    push        8
 00414748    push        0
 0041474A    push        400
 0041474F    push        ebx
 00414750    lea         eax,[ebp-10]
 00414753    push        eax
 00414754    mov         eax,[005AE68C];^gvar_005E0870
 00414759    mov         eax,dword ptr [eax]
 0041475B    call        eax
 0041475D    mov         dx,word ptr [ebx]
 00414760    mov         cx,8
 00414764    call        VarResultCheck
 00414769    push        esi
 0041476A    lea         eax,[ebp-14]
 0041476D    mov         edx,dword ptr [ebp-8]
 00414770    call        @WStrFromPWChar
 00414775    mov         eax,dword ptr [ebp-14]
 00414778    mov         ecx,7FFFFFFF
 0041477D    mov         edx,1
 00414782    call        @WStrCopy
 00414787    xor         eax,eax
 00414789    pop         edx
 0041478A    pop         ecx
 0041478B    pop         ecx
 0041478C    mov         dword ptr fs:[eax],edx
 0041478F    push        4147A4
 00414794    lea         eax,[ebp-10]
 00414797    call        @VarClear
 0041479C    ret
>0041479D    jmp         @HandleFinally
>004147A2    jmp         00414794
 004147A4    xor         eax,eax
 004147A6    pop         edx
 004147A7    pop         ecx
 004147A8    pop         ecx
 004147A9    mov         dword ptr fs:[eax],edx
 004147AC    push        4147C1
 004147B1    lea         eax,[ebp-14]
 004147B4    call        @WStrClr
 004147B9    ret
>004147BA    jmp         @HandleFinally
>004147BF    jmp         004147B1
 004147C1    pop         esi
 004147C2    pop         ebx
 004147C3    mov         esp,ebp
 004147C5    pop         ebp
 004147C6    ret
*}
end;

//004147C8
function VarToWStrAny(const V:TVarData):WideString;
begin
{*
 004147C8    push        ebp
 004147C9    mov         ebp,esp
 004147CB    add         esp,0FFFFFFF0
 004147CE    push        ebx
 004147CF    push        esi
 004147D0    mov         esi,edx
 004147D2    mov         ebx,eax
 004147D4    lea         eax,[ebp-10]
 004147D7    push        eax
 004147D8    call        oleaut32.VariantInit
 004147DD    xor         eax,eax
 004147DF    push        ebp
 004147E0    push        41481E
 004147E5    push        dword ptr fs:[eax]
 004147E8    mov         dword ptr fs:[eax],esp
 004147EB    mov         edx,ebx
 004147ED    lea         eax,[ebp-10]
 004147F0    call        @VarCopy
 004147F5    lea         eax,[ebp-10]
 004147F8    call        dword ptr ds:[5E08E4]
 004147FE    lea         edx,[ebp-10]
 00414801    mov         eax,esi
 00414803    call        @VarToWStr
 00414808    xor         eax,eax
 0041480A    pop         edx
 0041480B    pop         ecx
 0041480C    pop         ecx
 0041480D    mov         dword ptr fs:[eax],edx
 00414810    push        414825
 00414815    lea         eax,[ebp-10]
 00414818    call        @VarClear
 0041481D    ret
>0041481E    jmp         @HandleFinally
>00414823    jmp         00414815
 00414825    pop         esi
 00414826    pop         ebx
 00414827    mov         esp,ebp
 00414829    pop         ebp
 0041482A    ret
*}
end;

//0041482C
function VarToWStrCustom(const V:TVarData; var AValue:WideString):Boolean;
begin
{*
 0041482C    push        ebp
 0041482D    mov         ebp,esp
 0041482F    add         esp,0FFFFFFE0
 00414832    push        ebx
 00414833    xor         ecx,ecx
 00414835    mov         dword ptr [ebp-20],ecx
 00414838    mov         dword ptr [ebp-4],edx
 0041483B    mov         ebx,eax
 0041483D    mov         eax,dword ptr [ebp-4]
 00414840    test        eax,eax
>00414842    je          00414848
 00414844    xor         edx,edx
 00414846    mov         dword ptr [eax],edx
 00414848    xor         eax,eax
 0041484A    push        ebp
 0041484B    push        4148E4
 00414850    push        dword ptr fs:[eax]
 00414853    mov         dword ptr fs:[eax],esp
 00414856    lea         edx,[ebp-0C]
 00414859    mov         ax,word ptr [ebx]
 0041485C    call        FindCustomVariantType
 00414861    mov         byte ptr [ebp-5],al
 00414864    cmp         byte ptr [ebp-5],0
>00414868    je          004148CE
 0041486A    lea         eax,[ebp-1C]
 0041486D    push        eax
 0041486E    call        oleaut32.VariantInit
 00414873    xor         eax,eax
 00414875    push        ebp
 00414876    push        4148C7
 0041487B    push        dword ptr fs:[eax]
 0041487E    mov         dword ptr fs:[eax],esp
 00414881    push        8
 00414883    mov         ecx,ebx
 00414885    lea         edx,[ebp-1C]
 00414888    mov         eax,dword ptr [ebp-0C]
 0041488B    mov         ebx,dword ptr [eax]
 0041488D    call        dword ptr [ebx+1C]
 00414890    mov         eax,dword ptr [ebp-4]
 00414893    push        eax
 00414894    lea         eax,[ebp-20]
 00414897    mov         edx,dword ptr [ebp-14]
 0041489A    call        @WStrFromPWChar
 0041489F    mov         eax,dword ptr [ebp-20]
 004148A2    mov         ecx,7FFFFFFF
 004148A7    mov         edx,1
 004148AC    call        @WStrCopy
 004148B1    xor         eax,eax
 004148B3    pop         edx
 004148B4    pop         ecx
 004148B5    pop         ecx
 004148B6    mov         dword ptr fs:[eax],edx
 004148B9    push        4148CE
 004148BE    lea         eax,[ebp-1C]
 004148C1    call        @VarClear
 004148C6    ret
>004148C7    jmp         @HandleFinally
>004148CC    jmp         004148BE
 004148CE    xor         eax,eax
 004148D0    pop         edx
 004148D1    pop         ecx
 004148D2    pop         ecx
 004148D3    mov         dword ptr fs:[eax],edx
 004148D6    push        4148EB
 004148DB    lea         eax,[ebp-20]
 004148DE    call        @WStrClr
 004148E3    ret
>004148E4    jmp         @HandleFinally
>004148E9    jmp         004148DB
 004148EB    mov         al,byte ptr [ebp-5]
 004148EE    pop         ebx
 004148EF    mov         esp,ebp
 004148F1    pop         ebp
 004148F2    ret
*}
end;

//004148F4
procedure @VarToWStr(var S:WideString; const V:TVarData);
begin
{*
 004148F4    push        ebp
 004148F5    mov         ebp,esp
 004148F7    mov         ecx,0E
 004148FC    push        0
 004148FE    push        0
 00414900    dec         ecx
>00414901    jne         004148FC
 00414903    push        ecx
 00414904    push        ebx
 00414905    push        esi
 00414906    mov         ebx,edx
 00414908    mov         esi,eax
 0041490A    xor         eax,eax
 0041490C    push        ebp
 0041490D    push        414E46
 00414912    push        dword ptr fs:[eax]
 00414915    mov         dword ptr fs:[eax],esp
 00414918    mov         ax,word ptr [ebx]
 0041491B    movzx       edx,ax
 0041491E    cmp         edx,14
>00414921    ja          00414B5C
 00414927    jmp         dword ptr [edx*4+41492E]
 00414927    dd          00414982
 00414927    dd          0041498E
 00414927    dd          004149B6
 00414927    dd          004149D1
 00414927    dd          004149EB
 00414927    dd          00414A0C
 00414927    dd          00414A2D
 00414927    dd          00414A4A
 00414927    dd          00414A67
 00414927    dd          00414B43
 00414927    dd          00414B5C
 00414927    dd          00414A8A
 00414927    dd          00414B32
 00414927    dd          00414B43
 00414927    dd          00414B5C
 00414927    dd          00414B5C
 00414927    dd          00414AA5
 00414927    dd          00414AC0
 00414927    dd          00414ADC
 00414927    dd          00414AF7
 00414927    dd          00414B15
 00414982    mov         eax,esi
 00414984    call        @WStrClr
>00414989    jmp         00414DD0
 0041498E    cmp         byte ptr ds:[5AC3AC],0
>00414995    je          004149A4
 00414997    mov         dx,8
 0041499B    mov         ax,1
 0041499F    call        VarCastError
 004149A4    mov         eax,esi
 004149A6    mov         edx,dword ptr ds:[5AC3B0]
 004149AC    call        @WStrFromLStr
>004149B1    jmp         00414DD0
 004149B6    lea         edx,[ebp-4]
 004149B9    movsx       eax,word ptr [ebx+8]
 004149BD    call        IntToStr
 004149C2    mov         edx,dword ptr [ebp-4]
 004149C5    mov         eax,esi
 004149C7    call        @WStrFromLStr
>004149CC    jmp         00414DD0
 004149D1    lea         edx,[ebp-8]
 004149D4    mov         eax,dword ptr [ebx+8]
 004149D7    call        IntToStr
 004149DC    mov         edx,dword ptr [ebp-8]
 004149DF    mov         eax,esi
 004149E1    call        @WStrFromLStr
>004149E6    jmp         00414DD0
 004149EB    fld         dword ptr [ebx+8]
 004149EE    add         esp,0FFFFFFF4
 004149F1    fstp        tbyte ptr [esp]
 004149F4    wait
 004149F5    lea         eax,[ebp-0C]
 004149F8    call        FloatToStr
 004149FD    mov         edx,dword ptr [ebp-0C]
 00414A00    mov         eax,esi
 00414A02    call        @WStrFromLStr
>00414A07    jmp         00414DD0
 00414A0C    fld         qword ptr [ebx+8]
 00414A0F    add         esp,0FFFFFFF4
 00414A12    fstp        tbyte ptr [esp]
 00414A15    wait
 00414A16    lea         eax,[ebp-10]
 00414A19    call        FloatToStr
 00414A1E    mov         edx,dword ptr [ebp-10]
 00414A21    mov         eax,esi
 00414A23    call        @WStrFromLStr
>00414A28    jmp         00414DD0
 00414A2D    push        dword ptr [ebx+0C]
 00414A30    push        dword ptr [ebx+8]
 00414A33    lea         eax,[ebp-14]
 00414A36    call        CurrToWStrViaOS
 00414A3B    mov         edx,dword ptr [ebp-14]
 00414A3E    mov         eax,esi
 00414A40    call        @WStrAsg
>00414A45    jmp         00414DD0
 00414A4A    push        dword ptr [ebx+0C]
 00414A4D    push        dword ptr [ebx+8]
 00414A50    lea         eax,[ebp-18]
 00414A53    call        DateToWStrViaOS
 00414A58    mov         edx,dword ptr [ebp-18]
 00414A5B    mov         eax,esi
 00414A5D    call        @WStrAsg
>00414A62    jmp         00414DD0
 00414A67    push        esi
 00414A68    lea         eax,[ebp-1C]
 00414A6B    mov         edx,dword ptr [ebx+8]
 00414A6E    call        @WStrFromPWChar
 00414A73    mov         eax,dword ptr [ebp-1C]
 00414A76    mov         ecx,7FFFFFFF
 00414A7B    mov         edx,1
 00414A80    call        @WStrCopy
>00414A85    jmp         00414DD0
 00414A8A    lea         edx,[ebp-20]
 00414A8D    mov         ax,word ptr [ebx+8]
 00414A91    call        BoolToWStrViaOS
 00414A96    mov         edx,dword ptr [ebp-20]
 00414A99    mov         eax,esi
 00414A9B    call        @WStrAsg
>00414AA0    jmp         00414DD0
 00414AA5    lea         edx,[ebp-24]
 00414AA8    movsx       eax,byte ptr [ebx+8]
 00414AAC    call        IntToStr
 00414AB1    mov         edx,dword ptr [ebp-24]
 00414AB4    mov         eax,esi
 00414AB6    call        @WStrFromLStr
>00414ABB    jmp         00414DD0
 00414AC0    lea         edx,[ebp-28]
 00414AC3    xor         eax,eax
 00414AC5    mov         al,byte ptr [ebx+8]
 00414AC8    call        IntToStr
 00414ACD    mov         edx,dword ptr [ebp-28]
 00414AD0    mov         eax,esi
 00414AD2    call        @WStrFromLStr
>00414AD7    jmp         00414DD0
 00414ADC    lea         edx,[ebp-2C]
 00414ADF    movzx       eax,word ptr [ebx+8]
 00414AE3    call        IntToStr
 00414AE8    mov         edx,dword ptr [ebp-2C]
 00414AEB    mov         eax,esi
 00414AED    call        @WStrFromLStr
>00414AF2    jmp         00414DD0
 00414AF7    mov         eax,dword ptr [ebx+8]
 00414AFA    xor         edx,edx
 00414AFC    push        edx
 00414AFD    push        eax
 00414AFE    lea         eax,[ebp-30]
 00414B01    call        IntToStr
 00414B06    mov         edx,dword ptr [ebp-30]
 00414B09    mov         eax,esi
 00414B0B    call        @WStrFromLStr
>00414B10    jmp         00414DD0
 00414B15    push        dword ptr [ebx+0C]
 00414B18    push        dword ptr [ebx+8]
 00414B1B    lea         eax,[ebp-34]
 00414B1E    call        IntToStr
 00414B23    mov         edx,dword ptr [ebp-34]
 00414B26    mov         eax,esi
 00414B28    call        @WStrFromLStr
>00414B2D    jmp         00414DD0
 00414B32    mov         eax,dword ptr [ebx+8]
 00414B35    mov         edx,eax
 00414B37    mov         eax,esi
 00414B39    call        @VarToWStr
>00414B3E    jmp         00414DD0
 00414B43    lea         edx,[ebp-38]
 00414B46    mov         eax,ebx
 00414B48    call        VarToWStrViaOS
 00414B4D    mov         edx,dword ptr [ebp-38]
 00414B50    mov         eax,esi
 00414B52    call        @WStrAsg
>00414B57    jmp         00414DD0
 00414B5C    mov         edx,eax
 00414B5E    sub         dx,100
>00414B63    je          00414B6C
 00414B65    dec         dx
>00414B68    je          00414B7B
>00414B6A    jmp         00414B94
 00414B6C    mov         eax,esi
 00414B6E    mov         edx,dword ptr [ebx+8]
 00414B71    call        @WStrFromLStr
>00414B76    jmp         00414DD0
 00414B7B    lea         edx,[ebp-3C]
 00414B7E    mov         eax,ebx
 00414B80    call        VarToWStrAny
 00414B85    mov         edx,dword ptr [ebp-3C]
 00414B88    mov         eax,esi
 00414B8A    call        @WStrAsg
>00414B8F    jmp         00414DD0
 00414B94    test        ah,40
>00414B97    je          00414DA8
 00414B9D    movzx       eax,ax
 00414BA0    and         eax,0FFFFBFFF
 00414BA5    cmp         eax,14
>00414BA8    ja          00414D92
 00414BAE    jmp         dword ptr [eax*4+414BB5]
 00414BAE    dd          00414D92
 00414BAE    dd          00414D92
 00414BAE    dd          00414C09
 00414BAE    dd          00414C26
 00414BAE    dd          00414C42
 00414BAE    dd          00414C65
 00414BAE    dd          00414C88
 00414BAE    dd          00414CA7
 00414BAE    dd          00414CC6
 00414BAE    dd          00414D92
 00414BAE    dd          00414D92
 00414BAE    dd          00414CD7
 00414BAE    dd          00414D84
 00414BAE    dd          00414D92
 00414BAE    dd          00414D92
 00414BAE    dd          00414D92
 00414BAE    dd          00414CF4
 00414BAE    dd          00414D11
 00414BAE    dd          00414D2E
 00414BAE    dd          00414D4B
 00414BAE    dd          00414D68
 00414C09    lea         edx,[ebp-40]
 00414C0C    mov         eax,dword ptr [ebx+8]
 00414C0F    movsx       eax,word ptr [eax]
 00414C12    call        IntToStr
 00414C17    mov         edx,dword ptr [ebp-40]
 00414C1A    mov         eax,esi
 00414C1C    call        @WStrFromLStr
>00414C21    jmp         00414DD0
 00414C26    lea         edx,[ebp-44]
 00414C29    mov         eax,dword ptr [ebx+8]
 00414C2C    mov         eax,dword ptr [eax]
 00414C2E    call        IntToStr
 00414C33    mov         edx,dword ptr [ebp-44]
 00414C36    mov         eax,esi
 00414C38    call        @WStrFromLStr
>00414C3D    jmp         00414DD0
 00414C42    mov         eax,dword ptr [ebx+8]
 00414C45    fld         dword ptr [eax]
 00414C47    add         esp,0FFFFFFF4
 00414C4A    fstp        tbyte ptr [esp]
 00414C4D    wait
 00414C4E    lea         eax,[ebp-48]
 00414C51    call        FloatToStr
 00414C56    mov         edx,dword ptr [ebp-48]
 00414C59    mov         eax,esi
 00414C5B    call        @WStrFromLStr
>00414C60    jmp         00414DD0
 00414C65    mov         eax,dword ptr [ebx+8]
 00414C68    fld         qword ptr [eax]
 00414C6A    add         esp,0FFFFFFF4
 00414C6D    fstp        tbyte ptr [esp]
 00414C70    wait
 00414C71    lea         eax,[ebp-4C]
 00414C74    call        FloatToStr
 00414C79    mov         edx,dword ptr [ebp-4C]
 00414C7C    mov         eax,esi
 00414C7E    call        @WStrFromLStr
>00414C83    jmp         00414DD0
 00414C88    mov         eax,dword ptr [ebx+8]
 00414C8B    push        dword ptr [eax+4]
 00414C8E    push        dword ptr [eax]
 00414C90    lea         eax,[ebp-50]
 00414C93    call        CurrToWStrViaOS
 00414C98    mov         edx,dword ptr [ebp-50]
 00414C9B    mov         eax,esi
 00414C9D    call        @WStrAsg
>00414CA2    jmp         00414DD0
 00414CA7    mov         eax,dword ptr [ebx+8]
 00414CAA    push        dword ptr [eax+4]
 00414CAD    push        dword ptr [eax]
 00414CAF    lea         eax,[ebp-54]
 00414CB2    call        DateToWStrViaOS
 00414CB7    mov         edx,dword ptr [ebp-54]
 00414CBA    mov         eax,esi
 00414CBC    call        @WStrAsg
>00414CC1    jmp         00414DD0
 00414CC6    mov         eax,esi
 00414CC8    mov         edx,dword ptr [ebx+8]
 00414CCB    mov         edx,dword ptr [edx]
 00414CCD    call        @WStrFromPWChar
>00414CD2    jmp         00414DD0
 00414CD7    lea         edx,[ebp-58]
 00414CDA    mov         eax,dword ptr [ebx+8]
 00414CDD    mov         ax,word ptr [eax]
 00414CE0    call        BoolToWStrViaOS
 00414CE5    mov         edx,dword ptr [ebp-58]
 00414CE8    mov         eax,esi
 00414CEA    call        @WStrAsg
>00414CEF    jmp         00414DD0
 00414CF4    lea         edx,[ebp-5C]
 00414CF7    mov         eax,dword ptr [ebx+8]
 00414CFA    movsx       eax,byte ptr [eax]
 00414CFD    call        IntToStr
 00414D02    mov         edx,dword ptr [ebp-5C]
 00414D05    mov         eax,esi
 00414D07    call        @WStrFromLStr
>00414D0C    jmp         00414DD0
 00414D11    lea         edx,[ebp-60]
 00414D14    mov         eax,dword ptr [ebx+8]
 00414D17    movzx       eax,byte ptr [eax]
 00414D1A    call        IntToStr
 00414D1F    mov         edx,dword ptr [ebp-60]
 00414D22    mov         eax,esi
 00414D24    call        @WStrFromLStr
>00414D29    jmp         00414DD0
 00414D2E    lea         edx,[ebp-64]
 00414D31    mov         eax,dword ptr [ebx+8]
 00414D34    movzx       eax,word ptr [eax]
 00414D37    call        IntToStr
 00414D3C    mov         edx,dword ptr [ebp-64]
 00414D3F    mov         eax,esi
 00414D41    call        @WStrFromLStr
>00414D46    jmp         00414DD0
 00414D4B    mov         eax,dword ptr [ebx+8]
 00414D4E    mov         eax,dword ptr [eax]
 00414D50    xor         edx,edx
 00414D52    push        edx
 00414D53    push        eax
 00414D54    lea         eax,[ebp-68]
 00414D57    call        IntToStr
 00414D5C    mov         edx,dword ptr [ebp-68]
 00414D5F    mov         eax,esi
 00414D61    call        @WStrFromLStr
>00414D66    jmp         00414DD0
 00414D68    mov         eax,dword ptr [ebx+8]
 00414D6B    push        dword ptr [eax+4]
 00414D6E    push        dword ptr [eax]
 00414D70    lea         eax,[ebp-6C]
 00414D73    call        IntToStr
 00414D78    mov         edx,dword ptr [ebp-6C]
 00414D7B    mov         eax,esi
 00414D7D    call        @WStrFromLStr
>00414D82    jmp         00414DD0
 00414D84    mov         eax,dword ptr [ebx+8]
 00414D87    mov         edx,eax
 00414D89    mov         eax,esi
 00414D8B    call        @VarToWStr
>00414D90    jmp         00414DD0
 00414D92    lea         edx,[ebp-70]
 00414D95    mov         eax,ebx
 00414D97    call        VarToWStrViaOS
 00414D9C    mov         edx,dword ptr [ebp-70]
 00414D9F    mov         eax,esi
 00414DA1    call        @WStrAsg
>00414DA6    jmp         00414DD0
 00414DA8    mov         eax,esi
 00414DAA    call        @WStrClr
 00414DAF    mov         edx,eax
 00414DB1    mov         eax,ebx
 00414DB3    call        VarToWStrCustom
 00414DB8    test        al,al
>00414DBA    jne         00414DD0
 00414DBC    lea         edx,[ebp-74]
 00414DBF    mov         eax,ebx
 00414DC1    call        VarToWStrViaOS
 00414DC6    mov         edx,dword ptr [ebp-74]
 00414DC9    mov         eax,esi
 00414DCB    call        @WStrAsg
 00414DD0    xor         eax,eax
 00414DD2    pop         edx
 00414DD3    pop         ecx
 00414DD4    pop         ecx
 00414DD5    mov         dword ptr fs:[eax],edx
 00414DD8    push        414E4D
 00414DDD    lea         eax,[ebp-74]
 00414DE0    mov         edx,2
 00414DE5    call        @WStrArrayClr
 00414DEA    lea         eax,[ebp-6C]
 00414DED    mov         edx,5
 00414DF2    call        @LStrArrayClr
 00414DF7    lea         eax,[ebp-58]
 00414DFA    mov         edx,3
 00414DFF    call        @WStrArrayClr
 00414E04    lea         eax,[ebp-4C]
 00414E07    mov         edx,4
 00414E0C    call        @LStrArrayClr
 00414E11    lea         eax,[ebp-3C]
 00414E14    mov         edx,2
 00414E19    call        @WStrArrayClr
 00414E1E    lea         eax,[ebp-34]
 00414E21    mov         edx,5
 00414E26    call        @LStrArrayClr
 00414E2B    lea         eax,[ebp-20]
 00414E2E    mov         edx,4
 00414E33    call        @WStrArrayClr
 00414E38    lea         eax,[ebp-10]
 00414E3B    mov         edx,4
 00414E40    call        @LStrArrayClr
 00414E45    ret
>00414E46    jmp         @HandleFinally
>00414E4B    jmp         00414DDD
 00414E4D    pop         esi
 00414E4E    pop         ebx
 00414E4F    mov         esp,ebp
 00414E51    pop         ebp
 00414E52    ret
*}
end;

//00414E54
procedure AnyToIntf(var Intf:IInterface; const V:TVarData);
begin
{*
 00414E54    push        ebp
 00414E55    mov         ebp,esp
 00414E57    add         esp,0FFFFFFF0
 00414E5A    push        ebx
 00414E5B    push        esi
 00414E5C    mov         esi,edx
 00414E5E    mov         ebx,eax
 00414E60    lea         eax,[ebp-10]
 00414E63    push        eax
 00414E64    call        oleaut32.VariantInit
 00414E69    xor         eax,eax
 00414E6B    push        ebp
 00414E6C    push        414EBE
 00414E71    push        dword ptr fs:[eax]
 00414E74    mov         dword ptr fs:[eax],esp
 00414E77    mov         edx,esi
 00414E79    lea         eax,[ebp-10]
 00414E7C    call        @VarCopy
 00414E81    lea         eax,[ebp-10]
 00414E84    call        dword ptr ds:[5E08E4]
 00414E8A    cmp         word ptr [ebp-10],0D
>00414E8F    je          00414E9E
 00414E91    mov         dx,0D
 00414E95    mov         ax,101
 00414E99    call        VarCastError
 00414E9E    mov         eax,ebx
 00414EA0    mov         edx,dword ptr [ebp-8]
 00414EA3    call        @IntfCopy
 00414EA8    xor         eax,eax
 00414EAA    pop         edx
 00414EAB    pop         ecx
 00414EAC    pop         ecx
 00414EAD    mov         dword ptr fs:[eax],edx
 00414EB0    push        414EC5
 00414EB5    lea         eax,[ebp-10]
 00414EB8    call        @VarClear
 00414EBD    ret
>00414EBE    jmp         @HandleFinally
>00414EC3    jmp         00414EB5
 00414EC5    pop         esi
 00414EC6    pop         ebx
 00414EC7    mov         esp,ebp
 00414EC9    pop         ebp
 00414ECA    ret
*}
end;

//00414ECC
procedure @VarToIntf(var Intf:IInterface; const V:TVarData);
begin
{*
 00414ECC    push        ebx
 00414ECD    push        esi
 00414ECE    push        ecx
 00414ECF    mov         ebx,edx
 00414ED1    mov         esi,eax
 00414ED3    movzx       eax,word ptr [ebx]
 00414ED6    cmp         eax,0D
>00414ED9    jg          00414EEB
>00414EDB    je          00414F28
 00414EDD    sub         eax,1
>00414EE0    jb          00414F00
>00414EE2    je          00414F09
 00414EE4    sub         eax,8
>00414EE7    je          00414F28
>00414EE9    jmp         00414F4D
 00414EEB    sub         eax,101
>00414EF0    je          00414F42
 00414EF2    sub         eax,3F08
>00414EF7    je          00414F34
 00414EF9    sub         eax,4
>00414EFC    je          00414F34
>00414EFE    jmp         00414F4D
 00414F00    mov         eax,esi
 00414F02    call        @IntfClear
>00414F07    jmp         00414F81
 00414F09    cmp         byte ptr ds:[5AC3AC],0
>00414F10    je          00414F1F
 00414F12    mov         dx,0D
 00414F16    mov         ax,1
 00414F1A    call        VarCastError
 00414F1F    mov         eax,esi
 00414F21    call        @IntfClear
>00414F26    jmp         00414F81
 00414F28    mov         eax,esi
 00414F2A    mov         edx,dword ptr [ebx+8]
 00414F2D    call        @IntfCopy
>00414F32    jmp         00414F81
 00414F34    mov         eax,esi
 00414F36    mov         edx,dword ptr [ebx+8]
 00414F39    mov         edx,dword ptr [edx]
 00414F3B    call        @IntfCopy
>00414F40    jmp         00414F81
 00414F42    mov         edx,ebx
 00414F44    mov         eax,esi
 00414F46    call        AnyToIntf
>00414F4B    jmp         00414F81
 00414F4D    mov         edx,esp
 00414F4F    mov         ax,word ptr [ebx]
 00414F52    call        FindCustomVariantType
 00414F57    test        al,al
>00414F59    je          00414F75
 00414F5B    mov         eax,esi
 00414F5D    call        @IntfClear
 00414F62    mov         ecx,eax
 00414F64    mov         edx,414F88
 00414F69    mov         eax,dword ptr [esp]
 00414F6C    call        TObject.GetInterface
 00414F71    test        al,al
>00414F73    jne         00414F81
 00414F75    mov         ax,word ptr [ebx]
 00414F78    mov         dx,0D
 00414F7C    call        VarCastError
 00414F81    pop         edx
 00414F82    pop         esi
 00414F83    pop         ebx
 00414F84    ret
*}
end;

//00414F98
procedure @VarToDisp(var Dispatch:IDispatch; const V:TVarData);
begin
{*
 00414F98    push        ebx
 00414F99    push        esi
 00414F9A    push        ecx
 00414F9B    mov         ebx,edx
 00414F9D    mov         esi,eax
 00414F9F    mov         ax,word ptr [ebx]
 00414FA2    sub         ax,1
>00414FA6    jb          00414FB8
>00414FA8    je          00414FC1
 00414FAA    sub         ax,8
>00414FAE    je          00414FE0
 00414FB0    sub         ax,4000
>00414FB4    je          00414FEC
>00414FB6    jmp         00414FFA
 00414FB8    mov         eax,esi
 00414FBA    call        @IntfClear
>00414FBF    jmp         0041502E
 00414FC1    cmp         byte ptr ds:[5AC3AC],0
>00414FC8    je          00414FD7
 00414FCA    mov         dx,9
 00414FCE    mov         ax,1
 00414FD2    call        VarCastError
 00414FD7    mov         eax,esi
 00414FD9    call        @IntfClear
>00414FDE    jmp         0041502E
 00414FE0    mov         eax,esi
 00414FE2    mov         edx,dword ptr [ebx+8]
 00414FE5    call        @IntfCopy
>00414FEA    jmp         0041502E
 00414FEC    mov         eax,esi
 00414FEE    mov         edx,dword ptr [ebx+8]
 00414FF1    mov         edx,dword ptr [edx]
 00414FF3    call        @IntfCopy
>00414FF8    jmp         0041502E
 00414FFA    mov         edx,esp
 00414FFC    mov         ax,word ptr [ebx]
 00414FFF    call        FindCustomVariantType
 00415004    test        al,al
>00415006    je          00415022
 00415008    mov         eax,esi
 0041500A    call        @IntfClear
 0041500F    mov         ecx,eax
 00415011    mov         edx,415034
 00415016    mov         eax,dword ptr [esp]
 00415019    call        TObject.GetInterface
 0041501E    test        al,al
>00415020    jne         0041502E
 00415022    mov         ax,word ptr [ebx]
 00415025    mov         dx,9
 00415029    call        VarCastError
 0041502E    pop         edx
 0041502F    pop         esi
 00415030    pop         ebx
 00415031    ret
*}
end;

//00415044
procedure @VarFromInt(var V:TVarData; const Value:Integer; const Range:Shortint);
begin
{*
 00415044    push        ebx
 00415045    push        esi
 00415046    push        edi
 00415047    mov         ebx,ecx
 00415049    mov         esi,edx
 0041504B    mov         edi,eax
 0041504D    test        word ptr [edi],0BFE8
>00415052    je          0041505B
 00415054    mov         eax,edi
 00415056    call        VarClearDeep
 0041505B    cmp         byte ptr ds:[5AC3B4],0
>00415062    je          00415074
 00415064    movsx       eax,bl
 00415067    mov         ax,word ptr [eax*2+5AC3E0]
 0041506F    mov         word ptr [edi],ax
>00415072    jmp         00415079
 00415074    mov         word ptr [edi],3
 00415079    mov         dword ptr [edi+8],esi
 0041507C    pop         edi
 0041507D    pop         esi
 0041507E    pop         ebx
 0041507F    ret
*}
end;

//00415080
procedure @VarFromInteger(var V:TVarData; const Value:Integer);
begin
{*
 00415080    push        ebx
 00415081    push        esi
 00415082    mov         esi,edx
 00415084    mov         ebx,eax
 00415086    test        word ptr [ebx],0BFE8
>0041508B    je          00415094
 0041508D    mov         eax,ebx
 0041508F    call        VarClearDeep
 00415094    mov         word ptr [ebx],3
 00415099    mov         dword ptr [ebx+8],esi
 0041509C    pop         esi
 0041509D    pop         ebx
 0041509E    ret
*}
end;

//004150A0
procedure @VarFromByte(var V:TVarData; const Value:Byte);
begin
{*
 004150A0    push        ebx
 004150A1    push        esi
 004150A2    mov         ebx,edx
 004150A4    mov         esi,eax
 004150A6    test        word ptr [esi],0BFE8
>004150AB    je          004150B4
 004150AD    mov         eax,esi
 004150AF    call        VarClearDeep
 004150B4    mov         word ptr [esi],11
 004150B9    mov         byte ptr [esi+8],bl
 004150BC    pop         esi
 004150BD    pop         ebx
 004150BE    ret
*}
end;

//004150C0
procedure @VarFromWord(var V:TVarData; const Value:Word);
begin
{*
 004150C0    push        ebx
 004150C1    push        esi
 004150C2    mov         esi,edx
 004150C4    mov         ebx,eax
 004150C6    test        word ptr [ebx],0BFE8
>004150CB    je          004150D4
 004150CD    mov         eax,ebx
 004150CF    call        VarClearDeep
 004150D4    mov         word ptr [ebx],12
 004150D9    mov         word ptr [ebx+8],si
 004150DD    pop         esi
 004150DE    pop         ebx
 004150DF    ret
*}
end;

//004150E0
procedure @VarFromLongWord(var V:TVarData; const Value:LongWord);
begin
{*
 004150E0    push        ebx
 004150E1    push        esi
 004150E2    mov         esi,edx
 004150E4    mov         ebx,eax
 004150E6    test        word ptr [ebx],0BFE8
>004150EB    je          004150F4
 004150ED    mov         eax,ebx
 004150EF    call        VarClearDeep
 004150F4    mov         word ptr [ebx],13
 004150F9    mov         dword ptr [ebx+8],esi
 004150FC    pop         esi
 004150FD    pop         ebx
 004150FE    ret
*}
end;

//00415100
procedure @VarFromShortInt(var V:TVarData; const Value:Shortint);
begin
{*
 00415100    push        ebx
 00415101    push        esi
 00415102    mov         ebx,edx
 00415104    mov         esi,eax
 00415106    test        word ptr [esi],0BFE8
>0041510B    je          00415114
 0041510D    mov         eax,esi
 0041510F    call        VarClearDeep
 00415114    mov         word ptr [esi],10
 00415119    mov         byte ptr [esi+8],bl
 0041511C    pop         esi
 0041511D    pop         ebx
 0041511E    ret
*}
end;

//00415120
procedure @VarFromSmallInt(var V:TVarData; const Value:Smallint);
begin
{*
 00415120    push        ebx
 00415121    push        esi
 00415122    mov         esi,edx
 00415124    mov         ebx,eax
 00415126    test        word ptr [ebx],0BFE8
>0041512B    je          00415134
 0041512D    mov         eax,ebx
 0041512F    call        VarClearDeep
 00415134    mov         word ptr [ebx],2
 00415139    mov         word ptr [ebx+8],si
 0041513D    pop         esi
 0041513E    pop         ebx
 0041513F    ret
*}
end;

//00415140
procedure @VarFromInt64(var V:TVarData; const Value:Int64);
begin
{*
 00415140    push        ebp
 00415141    mov         ebp,esp
 00415143    push        ebx
 00415144    mov         ebx,eax
 00415146    test        word ptr [ebx],0BFE8
>0041514B    je          00415154
 0041514D    mov         eax,ebx
 0041514F    call        VarClearDeep
 00415154    mov         word ptr [ebx],14
 00415159    mov         eax,dword ptr [ebp+8]
 0041515C    mov         dword ptr [ebx+8],eax
 0041515F    mov         eax,dword ptr [ebp+0C]
 00415162    mov         dword ptr [ebx+0C],eax
 00415165    pop         ebx
 00415166    pop         ebp
 00415167    ret         8
*}
end;

//0041516C
procedure @VarFromSingle(var Dest:TVarData; const Value:Single);
begin
{*
 0041516C    push        ebp
 0041516D    mov         ebp,esp
 0041516F    push        ebx
 00415170    mov         ebx,eax
 00415172    test        word ptr [ebx],0BFE8
>00415177    je          00415180
 00415179    mov         eax,ebx
 0041517B    call        VarClearDeep
 00415180    mov         eax,dword ptr [ebp+8]
 00415183    mov         dword ptr [ebx+8],eax
 00415186    mov         word ptr [ebx],4
 0041518B    pop         ebx
 0041518C    pop         ebp
 0041518D    ret         4
*}
end;

//00415190
procedure @VarFromDouble(var Dest:TVarData; const Value:Double);
begin
{*
 00415190    push        ebp
 00415191    mov         ebp,esp
 00415193    push        ebx
 00415194    mov         ebx,eax
 00415196    test        word ptr [ebx],0BFE8
>0041519B    je          004151A4
 0041519D    mov         eax,ebx
 0041519F    call        VarClearDeep
 004151A4    mov         eax,dword ptr [ebp+8]
 004151A7    mov         dword ptr [ebx+8],eax
 004151AA    mov         eax,dword ptr [ebp+0C]
 004151AD    mov         dword ptr [ebx+0C],eax
 004151B0    mov         word ptr [ebx],5
 004151B5    pop         ebx
 004151B6    pop         ebp
 004151B7    ret         8
*}
end;

//004151BC
procedure @VarFromCurrency(var Dest:TVarData; const Value:Currency);
begin
{*
 004151BC    push        ebp
 004151BD    mov         ebp,esp
 004151BF    push        ebx
 004151C0    mov         ebx,eax
 004151C2    test        word ptr [ebx],0BFE8
>004151C7    je          004151D0
 004151C9    mov         eax,ebx
 004151CB    call        VarClearDeep
 004151D0    mov         eax,dword ptr [ebp+8]
 004151D3    mov         dword ptr [ebx+8],eax
 004151D6    mov         eax,dword ptr [ebp+0C]
 004151D9    mov         dword ptr [ebx+0C],eax
 004151DC    mov         word ptr [ebx],6
 004151E1    pop         ebx
 004151E2    pop         ebp
 004151E3    ret         8
*}
end;

//004151E8
procedure @VarFromDate(var Dest:TVarData; const Value:TDateTime);
begin
{*
 004151E8    push        ebp
 004151E9    mov         ebp,esp
 004151EB    push        ebx
 004151EC    mov         ebx,eax
 004151EE    test        word ptr [ebx],0BFE8
>004151F3    je          004151FC
 004151F5    mov         eax,ebx
 004151F7    call        VarClearDeep
 004151FC    mov         eax,dword ptr [ebp+8]
 004151FF    mov         dword ptr [ebx+8],eax
 00415202    mov         eax,dword ptr [ebp+0C]
 00415205    mov         dword ptr [ebx+0C],eax
 00415208    mov         word ptr [ebx],7
 0041520D    pop         ebx
 0041520E    pop         ebp
 0041520F    ret         8
*}
end;

//00415214
procedure @VarFromBool(var V:TVarData; const Value:Boolean);
begin
{*
 00415214    push        ebx
 00415215    push        esi
 00415216    mov         ebx,edx
 00415218    mov         esi,eax
 0041521A    test        word ptr [esi],0BFE8
>0041521F    je          00415228
 00415221    mov         eax,esi
 00415223    call        VarClearDeep
 00415228    mov         word ptr [esi],0B
 0041522D    cmp         bl,1
 00415230    cmc
 00415231    sbb         eax,eax
 00415233    mov         word ptr [esi+8],ax
 00415237    pop         esi
 00415238    pop         ebx
 00415239    ret
*}
end;

//0041523C
procedure @VarFromReal(var v:Variant);
begin
{*
 0041523C    push        eax
 0041523D    call        @VarClear
 00415242    pop         eax
 00415243    mov         word ptr [eax],5
 00415248    fstp        qword ptr [eax+8]
 0041524B    wait
 0041524C    ret
*}
end;

//00415250
procedure @VarFromTDateTime(var v:Variant);
begin
{*
 00415250    push        eax
 00415251    call        @VarClear
 00415256    pop         eax
 00415257    mov         word ptr [eax],7
 0041525C    fstp        qword ptr [eax+8]
 0041525F    wait
 00415260    ret
*}
end;

//00415264
procedure @VarFromCurr(var v:Variant);
begin
{*
 00415264    push        eax
 00415265    call        @VarClear
 0041526A    pop         eax
 0041526B    mov         word ptr [eax],6
 00415270    fistp       qword ptr [eax+8]
 00415273    wait
 00415274    ret
*}
end;

//00415278
procedure @VarFromLStr(var V:TVarData; const Value:AnsiString);
begin
{*
 00415278    push        ebx
 00415279    push        esi
 0041527A    mov         esi,edx
 0041527C    mov         ebx,eax
 0041527E    test        word ptr [ebx],0BFE8
>00415283    je          0041528C
 00415285    mov         eax,ebx
 00415287    call        VarClearDeep
 0041528C    xor         eax,eax
 0041528E    mov         dword ptr [ebx+8],eax
 00415291    mov         word ptr [ebx],100
 00415296    lea         eax,[ebx+8]
 00415299    mov         edx,esi
 0041529B    call        @LStrAsg
 004152A0    pop         esi
 004152A1    pop         ebx
 004152A2    ret
*}
end;

//004152A4
procedure @VarFromWStr(var V:TVarData; const Value:WideString);
begin
{*
 004152A4    push        ebx
 004152A5    push        esi
 004152A6    mov         esi,edx
 004152A8    mov         ebx,eax
 004152AA    test        word ptr [ebx],0BFE8
>004152AF    je          004152B8
 004152B1    mov         eax,ebx
 004152B3    call        VarClearDeep
 004152B8    xor         eax,eax
 004152BA    mov         dword ptr [ebx+8],eax
 004152BD    mov         word ptr [ebx],8
 004152C2    lea         eax,[ebx+8]
 004152C5    push        eax
 004152C6    mov         ecx,7FFFFFFF
 004152CB    mov         edx,1
 004152D0    mov         eax,esi
 004152D2    call        @WStrCopy
 004152D7    pop         esi
 004152D8    pop         ebx
 004152D9    ret
*}
end;

//004152DC
procedure @VarFromIntf(var V:TVarData; const Value:IInterface);
begin
{*
 004152DC    push        ebx
 004152DD    push        esi
 004152DE    mov         esi,edx
 004152E0    mov         ebx,eax
 004152E2    test        word ptr [ebx],0BFE8
>004152E7    je          004152F0
 004152E9    mov         eax,ebx
 004152EB    call        VarClearDeep
 004152F0    xor         eax,eax
 004152F2    mov         dword ptr [ebx+8],eax
 004152F5    mov         word ptr [ebx],0D
 004152FA    lea         eax,[ebx+8]
 004152FD    mov         edx,esi
 004152FF    call        @IntfCopy
 00415304    pop         esi
 00415305    pop         ebx
 00415306    ret
*}
end;

//00415308
procedure @VarFromDisp(var V:TVarData; const Value:IDispatch);
begin
{*
 00415308    push        ebx
 00415309    push        esi
 0041530A    mov         esi,edx
 0041530C    mov         ebx,eax
 0041530E    test        word ptr [ebx],0BFE8
>00415313    je          0041531C
 00415315    mov         eax,ebx
 00415317    call        VarClearDeep
 0041531C    xor         eax,eax
 0041531E    mov         dword ptr [ebx+8],eax
 00415321    mov         word ptr [ebx],9
 00415326    lea         eax,[ebx+8]
 00415329    mov         edx,esi
 0041532B    call        @IntfCopy
 00415330    pop         esi
 00415331    pop         ebx
 00415332    ret
*}
end;

//00415334
function CheckType(T:TVarType):TVarType;
begin
{*
 00415334    push        ebx
 00415335    mov         ebx,eax
 00415337    and         bx,0FFF
 0041533C    cmp         bx,14
>00415340    jbe         00415354
 00415342    cmp         bx,100
>00415347    jne         0041534F
 00415349    mov         bx,8
>0041534D    jmp         00415354
 0041534F    call        VarInvalidOp
 00415354    mov         eax,ebx
 00415356    pop         ebx
 00415357    ret
*}
end;

//00415358
function VarCompareAny(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 00415358    push        ebp
 00415359    mov         ebp,esp
 0041535B    add         esp,0FFFFFFDC
 0041535E    push        ebx
 0041535F    push        esi
 00415360    push        edi
 00415361    mov         edi,ecx
 00415363    mov         ebx,edx
 00415365    mov         esi,eax
 00415367    lea         eax,[ebp-11]
 0041536A    push        eax
 0041536B    call        oleaut32.VariantInit
 00415370    xor         eax,eax
 00415372    push        ebp
 00415373    push        41541B
 00415378    push        dword ptr fs:[eax]
 0041537B    mov         dword ptr fs:[eax],esp
 0041537E    mov         edx,esi
 00415380    lea         eax,[ebp-11]
 00415383    call        @VarCopy
 00415388    cmp         word ptr [esi],101
>0041538D    jne         00415398
 0041538F    lea         eax,[ebp-11]
 00415392    call        dword ptr ds:[5E08E4]
 00415398    cmp         word ptr [ebx],101
>0041539D    jne         004153F6
 0041539F    lea         eax,[ebp-21]
 004153A2    push        eax
 004153A3    call        oleaut32.VariantInit
 004153A8    xor         eax,eax
 004153AA    push        ebp
 004153AB    push        4153EF
 004153B0    push        dword ptr fs:[eax]
 004153B3    mov         dword ptr fs:[eax],esp
 004153B6    mov         edx,ebx
 004153B8    lea         eax,[ebp-21]
 004153BB    call        @VarCopy
 004153C0    lea         eax,[ebp-21]
 004153C3    call        dword ptr ds:[5E08E4]
 004153C9    lea         edx,[ebp-21]
 004153CC    lea         eax,[ebp-11]
 004153CF    mov         ecx,edi
 004153D1    call        VarCompare
 004153D6    mov         byte ptr [ebp-1],al
 004153D9    xor         eax,eax
 004153DB    pop         edx
 004153DC    pop         ecx
 004153DD    pop         ecx
 004153DE    mov         dword ptr fs:[eax],edx
 004153E1    push        415405
 004153E6    lea         eax,[ebp-21]
 004153E9    call        @VarClear
 004153EE    ret
>004153EF    jmp         @HandleFinally
>004153F4    jmp         004153E6
 004153F6    mov         edx,ebx
 004153F8    lea         eax,[ebp-11]
 004153FB    mov         ecx,edi
 004153FD    call        VarCompare
 00415402    mov         byte ptr [ebp-1],al
 00415405    xor         eax,eax
 00415407    pop         edx
 00415408    pop         ecx
 00415409    pop         ecx
 0041540A    mov         dword ptr fs:[eax],edx
 0041540D    push        415422
 00415412    lea         eax,[ebp-11]
 00415415    call        @VarClear
 0041541A    ret
>0041541B    jmp         @HandleFinally
>00415420    jmp         00415412
 00415422    mov         al,byte ptr [ebp-1]
 00415425    pop         edi
 00415426    pop         esi
 00415427    pop         ebx
 00415428    mov         esp,ebp
 0041542A    pop         ebp
 0041542B    ret
*}
end;

//0041542C
function EmptyCompare(L:TBaseType; R:TBaseType):TVarCompareResult;
begin
{*
 0041542C    cmp         al,1
>0041542E    jne         0041543C
 00415430    cmp         dl,1
>00415433    jne         00415439
 00415435    mov         al,1
>00415437    jmp         0041543E
 00415439    xor         eax,eax
 0041543B    ret
 0041543C    mov         al,2
 0041543E    ret
*}
end;

//00415440
function NullCompare(L:TBaseType; R:TBaseType; OpCode:TVarOp):TVarCompareResult;
begin
{*
 00415440    push        ebx
 00415441    push        ecx
 00415442    mov         byte ptr [esp],dl
 00415445    mov         bl,1
 00415447    mov         edx,ecx
 00415449    sub         edx,0E
>0041544C    je          00415460
 0041544E    dec         edx
>0041544F    je          004154A6
 00415451    dec         edx
 00415452    sub         edx,4
>00415455    jb          004154E3
>0041545B    jmp         0041551C
 00415460    mov         dl,byte ptr ds:[5AC3A4]
 00415466    sub         dl,1
>00415469    jb          00415476
>0041546B    je          00415480
 0041546D    dec         dl
>0041546F    je          0041548B
>00415471    jmp         00415521
 00415476    call        VarInvalidNullOp
>0041547B    jmp         00415521
 00415480    mov         bl,byte ptr ds:[5AC3EC]
>00415486    jmp         00415521
 0041548B    cmp         al,2
>0041548D    jne         00415495
 0041548F    cmp         byte ptr [esp],2
>00415493    je          00415499
 00415495    xor         eax,eax
>00415497    jmp         0041549B
 00415499    mov         al,1
 0041549B    and         eax,7F
 0041549E    mov         bl,byte ptr [eax+5AC3EC]
>004154A4    jmp         00415521
 004154A6    mov         dl,byte ptr ds:[5AC3A4]
 004154AC    sub         dl,1
>004154AF    jb          004154B9
>004154B1    je          004154C0
 004154B3    dec         dl
>004154B5    je          004154C8
>004154B7    jmp         00415521
 004154B9    call        VarInvalidNullOp
>004154BE    jmp         00415521
 004154C0    mov         bl,byte ptr ds:[5AC3EE]
>004154C6    jmp         00415521
 004154C8    cmp         al,2
>004154CA    jne         004154D6
 004154CC    cmp         byte ptr [esp],2
>004154D0    jne         004154D6
 004154D2    xor         eax,eax
>004154D4    jmp         004154D8
 004154D6    mov         al,1
 004154D8    and         eax,7F
 004154DB    mov         bl,byte ptr [eax+5AC3EE]
>004154E1    jmp         00415521
 004154E3    mov         dl,byte ptr ds:[5AC3A8]
 004154E9    sub         dl,1
>004154EC    jb          004154F6
>004154EE    je          004154FD
 004154F0    dec         dl
>004154F2    je          00415506
>004154F4    jmp         00415521
 004154F6    call        VarInvalidNullOp
>004154FB    jmp         00415521
 004154FD    mov         bl,byte ptr [ecx*2+5AC3D0]
>00415504    jmp         00415521
 00415506    cmp         al,2
>00415508    jne         00415518
 0041550A    cmp         byte ptr [esp],2
>0041550E    jne         00415514
 00415510    mov         bl,1
>00415512    jmp         00415521
 00415514    xor         ebx,ebx
>00415516    jmp         00415521
 00415518    mov         bl,2
>0041551A    jmp         00415521
 0041551C    call        VarInvalidOp
 00415521    mov         eax,ebx
 00415523    pop         edx
 00415524    pop         ebx
 00415525    ret
*}
end;

//00415528
function IntCompare(A:Integer; B:Integer):TVarCompareResult;
begin
{*
 00415528    cmp         edx,eax
>0041552A    jle         0041552F
 0041552C    xor         eax,eax
 0041552E    ret
 0041552F    cmp         edx,eax
>00415531    jge         00415537
 00415533    mov         al,2
>00415535    jmp         00415539
 00415537    mov         al,1
 00415539    ret
*}
end;

//0041553C
function Int64Compare(const A:Int64; const B:Int64):TVarCompareResult;
begin
{*
 0041553C    push        ebp
 0041553D    mov         ebp,esp
 0041553F    mov         eax,dword ptr [ebp+10]
 00415542    mov         edx,dword ptr [ebp+14]
 00415545    cmp         edx,dword ptr [ebp+0C]
>00415548    jne         00415551
 0041554A    cmp         eax,dword ptr [ebp+8]
>0041554D    jae         00415557
>0041554F    jmp         00415553
>00415551    jge         00415557
 00415553    xor         eax,eax
>00415555    jmp         00415571
 00415557    mov         eax,dword ptr [ebp+10]
 0041555A    mov         edx,dword ptr [ebp+14]
 0041555D    cmp         edx,dword ptr [ebp+0C]
>00415560    jne         00415569
 00415562    cmp         eax,dword ptr [ebp+8]
>00415565    jbe         0041556F
>00415567    jmp         0041556B
>00415569    jle         0041556F
 0041556B    mov         al,2
>0041556D    jmp         00415571
 0041556F    mov         al,1
 00415571    pop         ebp
 00415572    ret         10
*}
end;

//00415578
function RealCompare(const A:Double; const B:Double):TVarCompareResult;
begin
{*
 00415578    push        ebp
 00415579    mov         ebp,esp
 0041557B    fld         qword ptr [ebp+10]
 0041557E    fcomp       qword ptr [ebp+8]
 00415581    fnstsw      al
 00415583    sahf
>00415584    jae         0041558A
 00415586    xor         eax,eax
>00415588    jmp         0041559B
 0041558A    fld         qword ptr [ebp+10]
 0041558D    fcomp       qword ptr [ebp+8]
 00415590    fnstsw      al
 00415592    sahf
>00415593    jbe         00415599
 00415595    mov         al,2
>00415597    jmp         0041559B
 00415599    mov         al,1
 0041559B    pop         ebp
 0041559C    ret         10
*}
end;

//004155A0
function DateCompare(const A:TDateTime; const B:TDateTime):TVarCompareResult;
begin
{*
 004155A0    push        ebp
 004155A1    mov         ebp,esp
 004155A3    fld         qword ptr [ebp+10]
 004155A6    fcomp       qword ptr [ebp+8]
 004155A9    fnstsw      al
 004155AB    sahf
>004155AC    jae         004155B2
 004155AE    xor         eax,eax
>004155B0    jmp         004155C3
 004155B2    fld         qword ptr [ebp+10]
 004155B5    fcomp       qword ptr [ebp+8]
 004155B8    fnstsw      al
 004155BA    sahf
>004155BB    jbe         004155C1
 004155BD    mov         al,2
>004155BF    jmp         004155C3
 004155C1    mov         al,1
 004155C3    pop         ebp
 004155C4    ret         10
*}
end;

//004155C8
function CurrCompare(const A:Currency; const B:Currency):TVarCompareResult;
begin
{*
 004155C8    push        ebp
 004155C9    mov         ebp,esp
 004155CB    fild        qword ptr [ebp+10]
 004155CE    fild        qword ptr [ebp+8]
 004155D1    fcompp
 004155D3    fnstsw      al
 004155D5    sahf
>004155D6    jbe         004155DC
 004155D8    xor         eax,eax
>004155DA    jmp         004155EF
 004155DC    fild        qword ptr [ebp+10]
 004155DF    fild        qword ptr [ebp+8]
 004155E2    fcompp
 004155E4    fnstsw      al
 004155E6    sahf
>004155E7    jae         004155ED
 004155E9    mov         al,2
>004155EB    jmp         004155EF
 004155ED    mov         al,1
 004155EF    pop         ebp
 004155F0    ret         10
*}
end;

//004155F4
function StringCompare(const L:TVarData; const R:TVarData):TVarCompareResult;
begin
{*
 004155F4    push        ebp
 004155F5    mov         ebp,esp
 004155F7    push        0
 004155F9    push        0
 004155FB    push        ebx
 004155FC    mov         ebx,edx
 004155FE    xor         edx,edx
 00415600    push        ebp
 00415601    push        41564F
 00415606    push        dword ptr fs:[edx]
 00415609    mov         dword ptr fs:[edx],esp
 0041560C    mov         edx,eax
 0041560E    lea         eax,[ebp-4]
 00415611    call        @VarToLStr
 00415616    mov         edx,ebx
 00415618    lea         eax,[ebp-8]
 0041561B    call        @VarToLStr
 00415620    mov         edx,dword ptr [ebp-8]
 00415623    mov         eax,dword ptr [ebp-4]
 00415626    call        CompareStr
 0041562B    xor         edx,edx
 0041562D    call        IntCompare
 00415632    mov         ebx,eax
 00415634    xor         eax,eax
 00415636    pop         edx
 00415637    pop         ecx
 00415638    pop         ecx
 00415639    mov         dword ptr fs:[eax],edx
 0041563C    push        415656
 00415641    lea         eax,[ebp-8]
 00415644    mov         edx,2
 00415649    call        @LStrArrayClr
 0041564E    ret
>0041564F    jmp         @HandleFinally
>00415654    jmp         00415641
 00415656    mov         eax,ebx
 00415658    pop         ebx
 00415659    pop         ecx
 0041565A    pop         ecx
 0041565B    pop         ebp
 0041565C    ret
*}
end;

//00415660
function VarCompareSimple(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 00415660    push        ebx
 00415661    push        esi
 00415662    push        edi
 00415663    push        ebp
 00415664    mov         ebp,ecx
 00415666    mov         edi,edx
 00415668    mov         esi,eax
 0041566A    mov         ax,word ptr [esi]
 0041566D    call        CheckType
 00415672    movzx       eax,ax
 00415675    mov         bl,byte ptr [eax+5AC3BC]
 0041567B    mov         ax,word ptr [edi]
 0041567E    call        CheckType
 00415683    movzx       eax,ax
 00415686    mov         al,byte ptr [eax+5AC3BC]
 0041568C    xor         edx,edx
 0041568E    mov         dl,al
 00415690    xor         ecx,ecx
 00415692    mov         cl,bl
 00415694    imul        ecx,ecx,0B
 00415697    add         ecx,5AC3F8
 0041569D    movzx       edx,byte ptr [ecx+edx]
 004156A1    cmp         edx,0A
>004156A4    ja          004157DE
 004156AA    jmp         dword ptr [edx*4+4156B1]
 004156AA    dd          004156DD
 004156AA    dd          004156E9
 004156AA    dd          004156F7
 004156AA    dd          00415707
 004156AA    dd          0041573D
 004156AA    dd          00415786
 004156AA    dd          004157A9
 004156AA    dd          004157B4
 004156AA    dd          00415763
 004156AA    dd          00415721
 004156AA    dd          004157D1
 004156DD    call        VarInvalidOp
 004156E2    mov         al,1
>004156E4    jmp         004157E5
 004156E9    mov         edx,eax
 004156EB    mov         eax,ebx
 004156ED    call        EmptyCompare
>004156F2    jmp         004157E5
 004156F7    mov         ecx,ebp
 004156F9    mov         edx,eax
 004156FB    mov         eax,ebx
 004156FD    call        NullCompare
>00415702    jmp         004157E5
 00415707    mov         eax,edi
 00415709    call        @VarToInteger
 0041570E    push        eax
 0041570F    mov         eax,esi
 00415711    call        @VarToInteger
 00415716    pop         edx
 00415717    call        IntCompare
>0041571C    jmp         004157E5
 00415721    mov         eax,esi
 00415723    call        @VarToInt64
 00415728    push        edx
 00415729    push        eax
 0041572A    mov         eax,edi
 0041572C    call        @VarToInt64
 00415731    push        edx
 00415732    push        eax
 00415733    call        Int64Compare
>00415738    jmp         004157E5
 0041573D    mov         eax,esi
 0041573F    call        @VarToDouble
 00415744    add         esp,0FFFFFFF8
 00415747    fstp        qword ptr [esp]
 0041574A    wait
 0041574B    mov         eax,edi
 0041574D    call        @VarToDouble
 00415752    add         esp,0FFFFFFF8
 00415755    fstp        qword ptr [esp]
 00415758    wait
 00415759    call        RealCompare
>0041575E    jmp         004157E5
 00415763    mov         eax,esi
 00415765    call        @VarToDate
 0041576A    add         esp,0FFFFFFF8
 0041576D    fstp        qword ptr [esp]
 00415770    wait
 00415771    mov         eax,edi
 00415773    call        @VarToDate
 00415778    add         esp,0FFFFFFF8
 0041577B    fstp        qword ptr [esp]
 0041577E    wait
 0041577F    call        DateCompare
>00415784    jmp         004157E5
 00415786    mov         eax,esi
 00415788    call        @VarToCurrency
 0041578D    add         esp,0FFFFFFF8
 00415790    fistp       qword ptr [esp]
 00415793    wait
 00415794    mov         eax,edi
 00415796    call        @VarToCurrency
 0041579B    add         esp,0FFFFFFF8
 0041579E    fistp       qword ptr [esp]
 004157A1    wait
 004157A2    call        CurrCompare
>004157A7    jmp         004157E5
 004157A9    mov         edx,edi
 004157AB    mov         eax,esi
 004157AD    call        StringCompare
>004157B2    jmp         004157E5
 004157B4    mov         eax,edi
 004157B6    call        @VarToBoolean
 004157BB    and         eax,7F
 004157BE    push        eax
 004157BF    mov         eax,esi
 004157C1    call        @VarToBoolean
 004157C6    and         eax,7F
 004157C9    pop         edx
 004157CA    call        IntCompare
>004157CF    jmp         004157E5
 004157D1    mov         edx,edi
 004157D3    mov         eax,esi
 004157D5    mov         ecx,ebp
 004157D7    call        VarCompareAny
>004157DC    jmp         004157E5
 004157DE    call        VarInvalidOp
 004157E3    mov         al,1
 004157E5    pop         ebp
 004157E6    pop         edi
 004157E7    pop         esi
 004157E8    pop         ebx
 004157E9    ret
*}
end;

//004157EC
function VarCompareRare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 004157EC    push        ebp
 004157ED    mov         ebp,esp
 004157EF    add         esp,0FFFFFFD8
 004157F2    push        ebx
 004157F3    push        esi
 004157F4    mov         dword ptr [ebp-8],ecx
 004157F7    mov         dword ptr [ebp-4],edx
 004157FA    mov         ebx,eax
 004157FC    mov         byte ptr [ebp-9],1
 00415800    mov         si,word ptr [ebx]
 00415803    mov         eax,esi
 00415805    and         ax,0FFF
 00415809    cmp         ax,10F
>0041580D    jae         0041598C
 00415813    test        si,si
>00415816    jne         00415829
 00415818    xor         edx,edx
 0041581A    mov         al,1
 0041581C    call        EmptyCompare
 00415821    mov         byte ptr [ebp-9],al
>00415824    jmp         00415C00
 00415829    cmp         si,1
>0041582D    jne         00415843
 0041582F    mov         ecx,dword ptr [ebp-8]
 00415832    xor         edx,edx
 00415834    mov         al,2
 00415836    call        NullCompare
 0041583B    mov         byte ptr [ebp-9],al
>0041583E    jmp         00415C00
 00415843    lea         edx,[ebp-18]
 00415846    mov         eax,dword ptr [ebp-4]
 00415849    mov         ax,word ptr [eax]
 0041584C    call        FindCustomVariantType
 00415851    test        al,al
>00415853    jne         0041585F
 00415855    call        VarInvalidOp
>0041585A    jmp         00415C00
 0041585F    lea         eax,[ebp-0C]
 00415862    push        eax
 00415863    mov         edx,ebx
 00415865    mov         ecx,0B
 0041586A    mov         eax,dword ptr [ebp-18]
 0041586D    mov         esi,dword ptr [eax]
 0041586F    call        dword ptr [esi+4]
 00415872    test        al,al
>00415874    je          00415928
 0041587A    mov         ax,word ptr [ebx]
 0041587D    cmp         ax,word ptr [ebp-0C]
>00415881    je          004158FE
 00415883    lea         eax,[ebp-28]
 00415886    push        eax
 00415887    call        oleaut32.VariantInit
 0041588C    xor         eax,eax
 0041588E    push        ebp
 0041588F    push        4158F7
 00415894    push        dword ptr fs:[eax]
 00415897    mov         dword ptr fs:[eax],esp
 0041589A    movzx       ecx,word ptr [ebp-0C]
 0041589E    mov         edx,ebx
 004158A0    lea         eax,[ebp-28]
 004158A3    call        @VarCast
 004158A8    mov         ax,word ptr [ebp-28]
 004158AC    and         ax,0FFF
 004158B0    cmp         ax,word ptr [ebp-0C]
>004158B4    je          004158BB
 004158B6    call        VarCastError
 004158BB    mov         eax,dword ptr [ebp-8]
 004158BE    push        eax
 004158BF    mov         ecx,dword ptr [ebp-4]
 004158C2    lea         edx,[ebp-28]
 004158C5    mov         eax,dword ptr [ebp-18]
 004158C8    mov         ebx,dword ptr [eax]
 004158CA    call        dword ptr [ebx+34]
 004158CD    and         eax,7F
 004158D0    mov         edx,dword ptr [ebp-8]
 004158D3    lea         edx,[edx*2+5AC3EC]
 004158DA    mov         al,byte ptr [edx+eax-1C]
 004158DE    mov         byte ptr [ebp-9],al
 004158E1    xor         eax,eax
 004158E3    pop         edx
 004158E4    pop         ecx
 004158E5    pop         ecx
 004158E6    mov         dword ptr fs:[eax],edx
 004158E9    push        415C00
 004158EE    lea         eax,[ebp-28]
 004158F1    call        @VarClear
 004158F6    ret
>004158F7    jmp         @HandleFinally
>004158FC    jmp         004158EE
 004158FE    mov         eax,dword ptr [ebp-8]
 00415901    push        eax
 00415902    mov         ecx,dword ptr [ebp-4]
 00415905    mov         edx,ebx
 00415907    mov         eax,dword ptr [ebp-18]
 0041590A    mov         ebx,dword ptr [eax]
 0041590C    call        dword ptr [ebx+34]
 0041590F    and         eax,7F
 00415912    mov         edx,dword ptr [ebp-8]
 00415915    lea         edx,[edx*2+5AC3EC]
 0041591C    mov         al,byte ptr [edx+eax-1C]
 00415920    mov         byte ptr [ebp-9],al
>00415923    jmp         00415C00
 00415928    lea         eax,[ebp-28]
 0041592B    push        eax
 0041592C    call        oleaut32.VariantInit
 00415931    xor         eax,eax
 00415933    push        ebp
 00415934    push        415985
 00415939    push        dword ptr fs:[eax]
 0041593C    mov         dword ptr fs:[eax],esp
 0041593F    movzx       ecx,word ptr [ebx]
 00415942    mov         edx,dword ptr [ebp-4]
 00415945    lea         eax,[ebp-28]
 00415948    call        @VarCast
 0041594D    mov         ax,word ptr [ebp-28]
 00415951    and         ax,0FFF
 00415955    cmp         ax,word ptr [ebx]
>00415958    je          0041595F
 0041595A    call        VarCastError
 0041595F    lea         edx,[ebp-28]
 00415962    mov         eax,ebx
 00415964    mov         ecx,dword ptr [ebp-8]
 00415967    call        VarCompareSimple
 0041596C    mov         byte ptr [ebp-9],al
 0041596F    xor         eax,eax
 00415971    pop         edx
 00415972    pop         ecx
 00415973    pop         ecx
 00415974    mov         dword ptr fs:[eax],edx
 00415977    push        415C00
 0041597C    lea         eax,[ebp-28]
 0041597F    call        @VarClear
 00415984    ret
>00415985    jmp         @HandleFinally
>0041598A    jmp         0041597C
 0041598C    mov         eax,dword ptr [ebp-4]
 0041598F    mov         ax,word ptr [eax]
 00415992    test        ax,ax
>00415995    jne         004159A8
 00415997    mov         dl,1
 00415999    xor         eax,eax
 0041599B    call        EmptyCompare
 004159A0    mov         byte ptr [ebp-9],al
>004159A3    jmp         00415C00
 004159A8    mov         edx,dword ptr [ebp-4]
 004159AB    cmp         ax,1
>004159AF    jne         004159C5
 004159B1    mov         ecx,dword ptr [ebp-8]
 004159B4    mov         dl,2
 004159B6    xor         eax,eax
 004159B8    call        NullCompare
 004159BD    mov         byte ptr [ebp-9],al
>004159C0    jmp         00415C00
 004159C5    lea         edx,[ebp-14]
 004159C8    mov         eax,esi
 004159CA    call        FindCustomVariantType
 004159CF    test        al,al
>004159D1    jne         004159DD
 004159D3    call        VarInvalidOp
>004159D8    jmp         00415C00
 004159DD    lea         eax,[ebp-0E]
 004159E0    push        eax
 004159E1    mov         edx,dword ptr [ebp-4]
 004159E4    mov         ecx,0B
 004159E9    mov         eax,dword ptr [ebp-14]
 004159EC    mov         esi,dword ptr [eax]
 004159EE    call        dword ptr [esi+8]
 004159F1    test        al,al
>004159F3    je          00415AA6
 004159F9    mov         eax,dword ptr [ebp-4]
 004159FC    mov         ax,word ptr [eax]
 004159FF    cmp         ax,word ptr [ebp-0E]
>00415A03    je          00415A7C
 00415A05    lea         eax,[ebp-28]
 00415A08    push        eax
 00415A09    call        oleaut32.VariantInit
 00415A0E    xor         eax,eax
 00415A10    push        ebp
 00415A11    push        415A75
 00415A16    push        dword ptr fs:[eax]
 00415A19    mov         dword ptr fs:[eax],esp
 00415A1C    movzx       ecx,word ptr [ebp-0E]
 00415A20    mov         edx,dword ptr [ebp-4]
 00415A23    lea         eax,[ebp-28]
 00415A26    call        @VarCast
 00415A2B    mov         ax,word ptr [ebp-28]
 00415A2F    cmp         ax,word ptr [ebp-0E]
>00415A33    je          00415A3A
 00415A35    call        VarCastError
 00415A3A    mov         eax,dword ptr [ebp-8]
 00415A3D    push        eax
 00415A3E    lea         ecx,[ebp-28]
 00415A41    mov         edx,ebx
 00415A43    mov         eax,dword ptr [ebp-14]
 00415A46    mov         ebx,dword ptr [eax]
 00415A48    call        dword ptr [ebx+34]
 00415A4B    and         eax,7F
 00415A4E    mov         edx,dword ptr [ebp-8]
 00415A51    lea         edx,[edx*2+5AC3EC]
 00415A58    mov         al,byte ptr [edx+eax-1C]
 00415A5C    mov         byte ptr [ebp-9],al
 00415A5F    xor         eax,eax
 00415A61    pop         edx
 00415A62    pop         ecx
 00415A63    pop         ecx
 00415A64    mov         dword ptr fs:[eax],edx
 00415A67    push        415C00
 00415A6C    lea         eax,[ebp-28]
 00415A6F    call        @VarClear
 00415A74    ret
>00415A75    jmp         @HandleFinally
>00415A7A    jmp         00415A6C
 00415A7C    mov         eax,dword ptr [ebp-8]
 00415A7F    push        eax
 00415A80    mov         ecx,dword ptr [ebp-4]
 00415A83    mov         edx,ebx
 00415A85    mov         eax,dword ptr [ebp-14]
 00415A88    mov         ebx,dword ptr [eax]
 00415A8A    call        dword ptr [ebx+34]
 00415A8D    and         eax,7F
 00415A90    mov         edx,dword ptr [ebp-8]
 00415A93    lea         edx,[edx*2+5AC3EC]
 00415A9A    mov         al,byte ptr [edx+eax-1C]
 00415A9E    mov         byte ptr [ebp-9],al
>00415AA1    jmp         00415C00
 00415AA6    mov         esi,dword ptr [ebp-4]
 00415AA9    mov         si,word ptr [esi]
 00415AAC    mov         eax,esi
 00415AAE    and         ax,0FFF
 00415AB2    cmp         ax,10F
>00415AB6    jae         00415B1E
 00415AB8    lea         eax,[ebp-28]
 00415ABB    push        eax
 00415ABC    call        oleaut32.VariantInit
 00415AC1    xor         eax,eax
 00415AC3    push        ebp
 00415AC4    push        415B17
 00415AC9    push        dword ptr fs:[eax]
 00415ACC    mov         dword ptr fs:[eax],esp
 00415ACF    mov         ecx,dword ptr [ebp-4]
 00415AD2    movzx       ecx,word ptr [ecx]
 00415AD5    mov         edx,ebx
 00415AD7    lea         eax,[ebp-28]
 00415ADA    call        @VarCast
 00415ADF    mov         eax,dword ptr [ebp-4]
 00415AE2    mov         ax,word ptr [eax]
 00415AE5    cmp         ax,word ptr [ebp-28]
>00415AE9    je          00415AF0
 00415AEB    call        VarCastError
 00415AF0    mov         edx,dword ptr [ebp-4]
 00415AF3    lea         eax,[ebp-28]
 00415AF6    mov         ecx,dword ptr [ebp-8]
 00415AF9    call        VarCompareSimple
 00415AFE    mov         byte ptr [ebp-9],al
 00415B01    xor         eax,eax
 00415B03    pop         edx
 00415B04    pop         ecx
 00415B05    pop         ecx
 00415B06    mov         dword ptr fs:[eax],edx
 00415B09    push        415C00
 00415B0E    lea         eax,[ebp-28]
 00415B11    call        @VarClear
 00415B16    ret
>00415B17    jmp         @HandleFinally
>00415B1C    jmp         00415B0E
 00415B1E    lea         edx,[ebp-18]
 00415B21    mov         eax,dword ptr [ebp-4]
 00415B24    mov         eax,esi
 00415B26    call        FindCustomVariantType
 00415B2B    test        al,al
>00415B2D    jne         00415B39
 00415B2F    call        VarInvalidOp
>00415B34    jmp         00415C00
 00415B39    lea         eax,[ebp-0C]
 00415B3C    push        eax
 00415B3D    mov         edx,ebx
 00415B3F    mov         ecx,0B
 00415B44    mov         eax,dword ptr [ebp-18]
 00415B47    mov         esi,dword ptr [eax]
 00415B49    call        dword ptr [esi+4]
 00415B4C    test        al,al
>00415B4E    je          00415BFB
 00415B54    mov         ax,word ptr [ebx]
 00415B57    cmp         ax,word ptr [ebp-0C]
>00415B5B    je          00415BD4
 00415B5D    lea         eax,[ebp-28]
 00415B60    push        eax
 00415B61    call        oleaut32.VariantInit
 00415B66    xor         eax,eax
 00415B68    push        ebp
 00415B69    push        415BCD
 00415B6E    push        dword ptr fs:[eax]
 00415B71    mov         dword ptr fs:[eax],esp
 00415B74    movzx       ecx,word ptr [ebp-0C]
 00415B78    mov         edx,ebx
 00415B7A    lea         eax,[ebp-28]
 00415B7D    call        @VarCast
 00415B82    mov         ax,word ptr [ebp-28]
 00415B86    cmp         ax,word ptr [ebp-0C]
>00415B8A    je          00415B91
 00415B8C    call        VarCastError
 00415B91    mov         eax,dword ptr [ebp-8]
 00415B94    push        eax
 00415B95    mov         ecx,dword ptr [ebp-4]
 00415B98    lea         edx,[ebp-28]
 00415B9B    mov         eax,dword ptr [ebp-18]
 00415B9E    mov         ebx,dword ptr [eax]
 00415BA0    call        dword ptr [ebx+34]
 00415BA3    and         eax,7F
 00415BA6    mov         edx,dword ptr [ebp-8]
 00415BA9    lea         edx,[edx*2+5AC3EC]
 00415BB0    mov         al,byte ptr [edx+eax-1C]
 00415BB4    mov         byte ptr [ebp-9],al
 00415BB7    xor         eax,eax
 00415BB9    pop         edx
 00415BBA    pop         ecx
 00415BBB    pop         ecx
 00415BBC    mov         dword ptr fs:[eax],edx
 00415BBF    push        415C00
 00415BC4    lea         eax,[ebp-28]
 00415BC7    call        @VarClear
 00415BCC    ret
>00415BCD    jmp         @HandleFinally
>00415BD2    jmp         00415BC4
 00415BD4    mov         eax,dword ptr [ebp-8]
 00415BD7    push        eax
 00415BD8    mov         ecx,dword ptr [ebp-4]
 00415BDB    mov         edx,ebx
 00415BDD    mov         eax,dword ptr [ebp-18]
 00415BE0    mov         ebx,dword ptr [eax]
 00415BE2    call        dword ptr [ebx+34]
 00415BE5    and         eax,7F
 00415BE8    mov         edx,dword ptr [ebp-8]
 00415BEB    lea         edx,[edx*2+5AC3EC]
 00415BF2    mov         al,byte ptr [edx+eax-1C]
 00415BF6    mov         byte ptr [ebp-9],al
>00415BF9    jmp         00415C00
 00415BFB    call        VarInvalidOp
 00415C00    mov         al,byte ptr [ebp-9]
 00415C03    pop         esi
 00415C04    pop         ebx
 00415C05    mov         esp,ebp
 00415C07    pop         ebp
 00415C08    ret
*}
end;

//00415C0C
function VarCompare(const Left:TVarData; const Right:TVarData; const OpCode:TVarOp):TVarCompareResult;
begin
{*
 00415C0C    push        esi
 00415C0D    push        edi
 00415C0E    mov         si,word ptr [eax]
 00415C11    mov         di,word ptr [edx]
 00415C14    cmp         si,10F
>00415C19    jae         00415C2A
 00415C1B    cmp         di,10F
>00415C20    jae         00415C2A
 00415C22    call        VarCompareSimple
 00415C27    pop         edi
 00415C28    pop         esi
 00415C29    ret
 00415C2A    cmp         si,400C
>00415C2F    jne         00415C3B
 00415C31    mov         eax,dword ptr [eax+8]
 00415C34    call        VarCompare
>00415C39    jmp         00415C70
 00415C3B    cmp         di,400C
>00415C40    jne         00415C4C
 00415C42    mov         edx,dword ptr [edx+8]
 00415C45    call        VarCompare
>00415C4A    jmp         00415C70
 00415C4C    and         si,0FFF
 00415C51    cmp         si,10F
>00415C56    jae         00415C6B
 00415C58    and         di,0FFF
 00415C5D    cmp         di,10F
>00415C62    jae         00415C6B
 00415C64    call        VarCompareSimple
>00415C69    jmp         00415C70
 00415C6B    call        VarCompareRare
 00415C70    pop         edi
 00415C71    pop         esi
 00415C72    ret
*}
end;

//00415DF8
function VarTypeAsText(const AType:TVarType):AnsiString;
begin
{*
 00415DF8    push        ebp
 00415DF9    mov         ebp,esp
 00415DFB    add         esp,0FFFFFDF8
 00415E01    push        ebx
 00415E02    push        esi
 00415E03    push        edi
 00415E04    xor         ecx,ecx
 00415E06    mov         dword ptr [ebp-208],ecx
 00415E0C    mov         esi,edx
 00415E0E    mov         ebx,eax
 00415E10    xor         eax,eax
 00415E12    push        ebp
 00415E13    push        415F1E
 00415E18    push        dword ptr fs:[eax]
 00415E1B    mov         dword ptr fs:[eax],esp
 00415E1E    mov         edi,ebx
 00415E20    and         di,0FFF
 00415E25    cmp         di,14
>00415E29    ja          00415E41
 00415E2B    mov         eax,esi
 00415E2D    movzx       edx,di
 00415E30    mov         edx,dword ptr [edx*4+5AC474];^'Empty'
 00415E37    call        @LStrAsg
>00415E3C    jmp         00415EDF
 00415E41    cmp         bx,100
>00415E46    jne         00415E59
 00415E48    mov         eax,esi
 00415E4A    mov         edx,415F34;'String'
 00415E4F    call        @LStrAsg
>00415E54    jmp         00415EDF
 00415E59    cmp         bx,101
>00415E5E    jne         00415E6E
 00415E60    mov         eax,esi
 00415E62    mov         edx,415F44;'Any'
 00415E67    call        @LStrAsg
>00415E6C    jmp         00415EDF
 00415E6E    lea         edx,[ebp-4]
 00415E71    mov         eax,ebx
 00415E73    call        FindCustomVariantType
 00415E78    test        al,al
>00415E7A    je          00415EB7
 00415E7C    lea         eax,[ebp-104]
 00415E82    push        eax
 00415E83    lea         edx,[ebp-204]
 00415E89    mov         eax,dword ptr [ebp-4]
 00415E8C    mov         eax,dword ptr [eax]
 00415E8E    call        TObject.ClassName
 00415E93    lea         eax,[ebp-204]
 00415E99    mov         ecx,7FFFFFFF
 00415E9E    mov         edx,2
 00415EA3    call        @Copy
 00415EA8    lea         edx,[ebp-104]
 00415EAE    mov         eax,esi
 00415EB0    call        @LStrFromString
>00415EB5    jmp         00415EDF
 00415EB7    lea         ecx,[ebp-208]
 00415EBD    movzx       eax,di
 00415EC0    mov         edx,4
 00415EC5    call        IntToHex
 00415ECA    mov         ecx,dword ptr [ebp-208]
 00415ED0    mov         edx,dword ptr ds:[5AE748]
 00415ED6    mov         edx,dword ptr [edx]
 00415ED8    mov         eax,esi
 00415EDA    call        @LStrCat3
 00415EDF    test        bh,20
>00415EE2    je          00415EF2
 00415EE4    mov         ecx,dword ptr [esi]
 00415EE6    mov         eax,esi
 00415EE8    mov         edx,415F50;'Array '
 00415EED    call        @LStrCat3
 00415EF2    test        bh,40
>00415EF5    je          00415F05
 00415EF7    mov         ecx,dword ptr [esi]
 00415EF9    mov         eax,esi
 00415EFB    mov         edx,415F60;'ByRef '
 00415F00    call        @LStrCat3
 00415F05    xor         eax,eax
 00415F07    pop         edx
 00415F08    pop         ecx
 00415F09    pop         ecx
 00415F0A    mov         dword ptr fs:[eax],edx
 00415F0D    push        415F25
 00415F12    lea         eax,[ebp-208]
 00415F18    call        @LStrClr
 00415F1D    ret
>00415F1E    jmp         @HandleFinally
>00415F23    jmp         00415F12
 00415F25    pop         edi
 00415F26    pop         esi
 00415F27    pop         ebx
 00415F28    mov         esp,ebp
 00415F2A    pop         ebp
 00415F2B    ret
*}
end;

//00415F68
function VarType(const V:Variant):TVarType;
begin
{*
 00415F68    mov         ax,word ptr [eax]
 00415F6B    ret
*}
end;

//00415F6C
function FindVarData(const V:Variant):PVarData;
begin
{*
>00415F6C    jmp         00415F71
 00415F6E    mov         eax,dword ptr [eax+8]
 00415F71    cmp         word ptr [eax],400C
>00415F76    je          00415F6E
 00415F78    ret
*}
end;

//00415F7C
function VarIsClear(const V:Variant):Boolean;
begin
{*
 00415F7C    push        ebx
 00415F7D    push        esi
 00415F7E    push        edi
 00415F7F    add         esp,0FFFFFFEC
 00415F82    mov         ebx,eax
 00415F84    mov         eax,ebx
 00415F86    call        FindVarData
 00415F8B    mov         esi,eax
 00415F8D    lea         edi,[esp+4]
 00415F91    movs        dword ptr [edi],dword ptr [esi]
 00415F92    movs        dword ptr [edi],dword ptr [esi]
 00415F93    movs        dword ptr [edi],dword ptr [esi]
 00415F94    movs        dword ptr [edi],dword ptr [esi]
 00415F95    mov         bx,word ptr [esp+4]
 00415F9A    cmp         bx,10F
>00415F9F    jae         00415FC9
 00415FA1    cmp         word ptr [esp+4],0
>00415FA7    je          00415FC5
 00415FA9    mov         ax,word ptr [esp+4]
 00415FAE    cmp         ax,9
>00415FB2    je          00415FBA
 00415FB4    cmp         ax,0D
>00415FB8    jne         00415FC1
 00415FBA    cmp         dword ptr [esp+0C],0
>00415FBF    je          00415FC5
 00415FC1    xor         eax,eax
>00415FC3    jmp         00415FE6
 00415FC5    mov         al,1
>00415FC7    jmp         00415FE6
 00415FC9    mov         edx,esp
 00415FCB    mov         eax,ebx
 00415FCD    call        FindCustomVariantType
 00415FD2    test        al,al
>00415FD4    je          00415FE4
 00415FD6    lea         edx,[esp+4]
 00415FDA    mov         eax,dword ptr [esp]
 00415FDD    mov         ecx,dword ptr [eax]
 00415FDF    call        dword ptr [ecx+14]
>00415FE2    jmp         00415FE6
 00415FE4    xor         eax,eax
 00415FE6    add         esp,14
 00415FE9    pop         edi
 00415FEA    pop         esi
 00415FEB    pop         ebx
 00415FEC    ret
*}
end;

//00415FF0
function VarSameValue(const A:Variant; const B:Variant):Boolean;
begin
{*
 00415FF0    push        ebx
 00415FF1    push        esi
 00415FF2    push        edi
 00415FF3    add         esp,0FFFFFFE0
 00415FF6    mov         esi,edx
 00415FF8    mov         ebx,eax
 00415FFA    mov         eax,ebx
 00415FFC    call        FindVarData
 00416001    push        esi
 00416002    mov         esi,eax
 00416004    lea         edi,[esp+4]
 00416008    movs        dword ptr [edi],dword ptr [esi]
 00416009    movs        dword ptr [edi],dword ptr [esi]
 0041600A    movs        dword ptr [edi],dword ptr [esi]
 0041600B    movs        dword ptr [edi],dword ptr [esi]
 0041600C    pop         esi
 0041600D    mov         eax,esi
 0041600F    call        FindVarData
 00416014    push        esi
 00416015    mov         esi,eax
 00416017    lea         edi,[esp+14]
 0041601B    movs        dword ptr [edi],dword ptr [esi]
 0041601C    movs        dword ptr [edi],dword ptr [esi]
 0041601D    movs        dword ptr [edi],dword ptr [esi]
 0041601E    movs        dword ptr [edi],dword ptr [esi]
 0041601F    pop         esi
 00416020    mov         ax,word ptr [esp]
 00416024    test        ax,ax
>00416027    jne         00416034
 00416029    cmp         word ptr [esp+10],0
 0041602F    sete        al
>00416032    jmp         00416060
 00416034    cmp         ax,1
>00416038    jne         00416045
 0041603A    cmp         word ptr [esp+10],1
 00416040    sete        al
>00416043    jmp         00416060
 00416045    mov         ax,word ptr [esp+10]
 0041604A    sub         ax,2
>0041604E    jae         00416054
 00416050    xor         eax,eax
>00416052    jmp         00416060
 00416054    mov         eax,ebx
 00416056    mov         edx,esi
 00416058    call        @VarCmpEQ
 0041605D    sete        al
 00416060    add         esp,20
 00416063    pop         edi
 00416064    pop         esi
 00416065    pop         ebx
 00416066    ret
*}
end;

//00416068
procedure SetVarAsError(var V:TVarData; AResult:HRESULT);
begin
{*
 00416068    push        ebx
 00416069    push        esi
 0041606A    mov         esi,edx
 0041606C    mov         ebx,eax
 0041606E    mov         eax,ebx
 00416070    call        @VarClear
 00416075    mov         word ptr [ebx],0A
 0041607A    mov         dword ptr [ebx+8],esi
 0041607D    pop         esi
 0041607E    pop         ebx
 0041607F    ret
*}
end;

//00416080
procedure SetClearVarToEmptyParam(var V:TVarData);
begin
{*
 00416080    mov         edx,80020004
 00416085    call        SetVarAsError
 0041608A    ret
*}
end;

//0041608C
function GetVarDataArrayInfo(const AVarData:TVarData; var AVarType:TVarType; var AVarArray:PVarArray):Boolean;
begin
{*
 0041608C    push        ebx
 0041608D    mov         bx,word ptr [eax]
 00416090    cmp         bx,400C
>00416095    jne         004160A3
 00416097    mov         eax,dword ptr [eax+8]
 0041609A    call        GetVarDataArrayInfo
 0041609F    mov         ebx,eax
>004160A1    jmp         004160CB
 004160A3    mov         word ptr [edx],bx
 004160A6    test        byte ptr [edx+1],20
 004160AA    setne       bl
 004160AD    test        bl,bl
>004160AF    je          004160C7
 004160B1    test        byte ptr [edx+1],40
>004160B5    je          004160C0
 004160B7    mov         eax,dword ptr [eax+8]
 004160BA    mov         eax,dword ptr [eax]
 004160BC    mov         dword ptr [ecx],eax
>004160BE    jmp         004160CB
 004160C0    mov         eax,dword ptr [eax+8]
 004160C3    mov         dword ptr [ecx],eax
>004160C5    jmp         004160CB
 004160C7    xor         eax,eax
 004160C9    mov         dword ptr [ecx],eax
 004160CB    mov         eax,ebx
 004160CD    pop         ebx
 004160CE    ret
*}
end;

//004160D0
function VarIsArray(const A:Variant):Boolean;
begin
{*
 004160D0    mov         dl,1
 004160D2    call        VarIsArray
 004160D7    ret
*}
end;

//004160D8
function VarIsArray(const A:Variant; AResolveByRef:Boolean):Boolean;
begin
{*
 004160D8    add         esp,0FFFFFFF8
 004160DB    test        dl,dl
>004160DD    je          004160ED
 004160DF    lea         ecx,[esp+4]
 004160E3    mov         edx,esp
 004160E5    call        GetVarDataArrayInfo
 004160EA    pop         ecx
 004160EB    pop         edx
 004160EC    ret
 004160ED    mov         ax,word ptr [eax]
 004160F0    and         ax,2000
 004160F4    cmp         ax,2000
 004160F8    sete        al
 004160FB    pop         ecx
 004160FC    pop         edx
 004160FD    ret
*}
end;

//00416124
procedure ClearVariantTypeList;
begin
{*
 00416124    push        ebp
 00416125    mov         ebp,esp
 00416127    push        ebx
 00416128    push        esi
 00416129    mov         esi,5E08F0;LVarTypes:_DT_02
 0041612E    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 00416133    call        KERNEL32.EnterCriticalSection
 00416138    xor         edx,edx
 0041613A    push        ebp
 0041613B    push        416185
 00416140    push        dword ptr fs:[edx]
 00416143    mov         dword ptr fs:[edx],esp
 00416146    mov         eax,dword ptr [esi]
 00416148    call        @DynArrayLength
 0041614D    mov         ebx,eax
 0041614F    dec         ebx
 00416150    cmp         ebx,0
>00416153    jl          0041616D
 00416155    mov         eax,dword ptr [esi]
 00416157    mov         eax,dword ptr [eax+ebx*4]
 0041615A    cmp         eax,dword ptr ds:[5AC3D4]
>00416160    je          00416167
 00416162    call        TObject.Free
 00416167    dec         ebx
 00416168    cmp         ebx,0FFFFFFFF
>0041616B    jne         00416155
 0041616D    xor         eax,eax
 0041616F    pop         edx
 00416170    pop         ecx
 00416171    pop         ecx
 00416172    mov         dword ptr fs:[eax],edx
 00416175    push        41618C
 0041617A    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 0041617F    call        KERNEL32.LeaveCriticalSection
 00416184    ret
>00416185    jmp         @HandleFinally
>0041618A    jmp         0041617A
 0041618C    pop         esi
 0041618D    pop         ebx
 0041618E    pop         ebp
 0041618F    ret
*}
end;

//00416190
procedure TCustomVariantType.BinaryOp(var Left:TVarData; const Right:TVarData; const Operator:TVarOp);
begin
{*
 00416190    push        ebp
 00416191    mov         ebp,esp
 00416193    call        00416350
 00416198    pop         ebp
 00416199    ret         4
*}
end;

//0041619C
procedure TCustomVariantType.Cast(var Dest:TVarData; const Source:TVarData);
begin
{*
 0041619C    push        ebx
 0041619D    push        esi
 0041619E    push        edi
 0041619F    push        ecx
 004161A0    mov         esi,ecx
 004161A2    mov         edi,edx
 004161A4    mov         ebx,eax
 004161A6    mov         edx,esp
 004161A8    mov         ax,word ptr [esi]
 004161AB    call        FindCustomVariantType
 004161B0    test        al,al
>004161B2    je          004161C8
 004161B4    mov         ax,word ptr [ebx+4]
 004161B8    push        eax
 004161B9    mov         ecx,esi
 004161BB    mov         edx,edi
 004161BD    mov         eax,dword ptr [esp+4]
 004161C1    mov         ebx,dword ptr [eax]
 004161C3    call        dword ptr [ebx+1C]
>004161C6    jmp         004161CF
 004161C8    mov         eax,ebx
 004161CA    call        00416348
 004161CF    pop         edx
 004161D0    pop         edi
 004161D1    pop         esi
 004161D2    pop         ebx
 004161D3    ret
*}
end;

//004161D4
procedure TCustomVariantType.CastTo(var Dest:TVarData; const Source:TVarData; const AVarType:TVarType);
begin
{*
 004161D4    push        ebp
 004161D5    mov         ebp,esp
 004161D7    add         esp,0FFFFFFF8
 004161DA    push        ebx
 004161DB    push        esi
 004161DC    push        edi
 004161DD    mov         esi,ecx
 004161DF    mov         dword ptr [ebp-4],edx
 004161E2    mov         ebx,eax
 004161E4    mov         edi,dword ptr [ebp+8]
 004161E7    cmp         di,word ptr [ebx+4]
>004161EB    je          0041620C
 004161ED    lea         edx,[ebp-8]
 004161F0    mov         ax,word ptr [esi]
 004161F3    call        FindCustomVariantType
 004161F8    test        al,al
>004161FA    je          0041620C
 004161FC    push        edi
 004161FD    mov         ecx,esi
 004161FF    mov         edx,dword ptr [ebp-4]
 00416202    mov         eax,dword ptr [ebp-8]
 00416205    mov         ebx,dword ptr [eax]
 00416207    call        dword ptr [ebx+1C]
>0041620A    jmp         00416213
 0041620C    mov         eax,ebx
 0041620E    call        00416348
 00416213    pop         edi
 00416214    pop         esi
 00416215    pop         ebx
 00416216    pop         ecx
 00416217    pop         ecx
 00416218    pop         ebp
 00416219    ret         4
*}
end;

//0041621C
procedure TCustomVariantType.Compare(const Left:TVarData; const Right:TVarData; var Relationship:TVarCompareResult);
begin
{*
 0041621C    push        ebp
 0041621D    mov         ebp,esp
 0041621F    call        00416350
 00416224    pop         ebp
 00416225    ret         4
*}
end;

//00416228
function TCustomVariantType.CompareOp(const Left:TVarData; const Right:TVarData; const Operator:TVarOp):Boolean;
begin
{*
 00416228    push        ebp
 00416229    mov         ebp,esp
 0041622B    push        ecx
 0041622C    push        ebx
 0041622D    push        esi
 0041622E    push        edi
 0041622F    mov         edi,edx
 00416231    mov         esi,eax
 00416233    lea         eax,[ebp-1]
 00416236    push        eax
 00416237    mov         edx,edi
 00416239    mov         eax,esi
 0041623B    mov         ebx,dword ptr [eax]
 0041623D    call        dword ptr [ebx+38]
 00416240    xor         eax,eax
 00416242    mov         al,byte ptr [ebp-1]
 00416245    mov         edx,dword ptr [ebp+8]
 00416248    lea         edx,[edx+edx*2]
 0041624B    add         edx,5AC4C8
 00416251    mov         al,byte ptr [edx+eax-2A]
 00416255    pop         edi
 00416256    pop         esi
 00416257    pop         ebx
 00416258    pop         ecx
 00416259    pop         ebp
 0041625A    ret         4
*}
end;

//00416260
procedure TCustomVariantType.CastToOle(var Dest:TVarData; const Source:TVarData);
begin
{*
 00416260    push        ebx
 00416261    push        esi
 00416262    push        edi
 00416263    push        ebp
 00416264    push        ecx
 00416265    mov         esi,ecx
 00416267    mov         edi,edx
 00416269    mov         ebx,eax
 0041626B    mov         ecx,esp
 0041626D    mov         edx,esi
 0041626F    mov         eax,ebx
 00416271    mov         ebp,dword ptr [eax]
 00416273    call        dword ptr [ebp+0C]
 00416276    test        al,al
>00416278    je          0041628C
 0041627A    mov         ax,word ptr [esp]
 0041627E    push        eax
 0041627F    mov         ecx,esi
 00416281    mov         edx,edi
 00416283    mov         eax,ebx
 00416285    mov         ebx,dword ptr [eax]
 00416287    call        dword ptr [ebx+1C]
>0041628A    jmp         00416293
 0041628C    mov         eax,ebx
 0041628E    call        00416348
 00416293    pop         edx
 00416294    pop         ebp
 00416295    pop         edi
 00416296    pop         esi
 00416297    pop         ebx
 00416298    ret
*}
end;

//0041629C
destructor TCustomVariantType.Destroy;
begin
{*
 0041629C    push        ebp
 0041629D    mov         ebp,esp
 0041629F    add         esp,0FFFFFFF8
 004162A2    call        @BeforeDestruction
 004162A7    mov         byte ptr [ebp-5],dl
 004162AA    mov         dword ptr [ebp-4],eax
 004162AD    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 004162B2    call        KERNEL32.EnterCriticalSection
 004162B7    xor         edx,edx
 004162B9    push        ebp
 004162BA    push        4162FF
 004162BF    push        dword ptr fs:[edx]
 004162C2    mov         dword ptr fs:[edx],esp
 004162C5    mov         eax,dword ptr [ebp-4]
 004162C8    mov         ax,word ptr [eax+4]
 004162CC    test        ax,ax
>004162CF    je          004162E7
 004162D1    movzx       eax,ax
 004162D4    mov         edx,dword ptr ds:[5E08F0];LVarTypes:_DT_02
 004162DA    mov         ecx,dword ptr ds:[5AC3D4]
 004162E0    mov         dword ptr [edx+eax*4-400],ecx
 004162E7    xor         eax,eax
 004162E9    pop         edx
 004162EA    pop         ecx
 004162EB    pop         ecx
 004162EC    mov         dword ptr fs:[eax],edx
 004162EF    push        416306
 004162F4    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 004162F9    call        KERNEL32.LeaveCriticalSection
 004162FE    ret
>004162FF    jmp         @HandleFinally
>00416304    jmp         004162F4
 00416306    mov         dl,byte ptr [ebp-5]
 00416309    and         dl,0FC
 0041630C    mov         eax,dword ptr [ebp-4]
 0041630F    call        TObject.Destroy
 00416314    cmp         byte ptr [ebp-5],0
>00416318    jle         00416322
 0041631A    mov         eax,dword ptr [ebp-4]
 0041631D    call        @ClassDestroy
 00416322    pop         ecx
 00416323    pop         ecx
 00416324    pop         ebp
 00416325    ret
*}
end;

//00416328
{*function sub_00416328:?;
begin
 00416328    xor         eax,eax
 0041632A    ret
end;*}

//0041632C
function TCustomVariantType.LeftPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;
begin
{*
 0041632C    push        ebp
 0041632D    mov         ebp,esp
 0041632F    mov         edx,dword ptr [ebp+8]
 00416332    mov         ax,word ptr [eax+4]
 00416336    mov         word ptr [edx],ax
 00416339    mov         al,1
 0041633B    pop         ebp
 0041633C    ret         4
*}
end;

//00416340
function TCustomVariantType.OlePromotion(const V:TVarData; var RequiredVarType:TVarType):Boolean;
begin
{*
 00416340    mov         word ptr [ecx],8
 00416345    mov         al,1
 00416347    ret
*}
end;

//00416348
procedure sub_00416348;
begin
{*
 00416348    call        VarCastError
 0041634D    ret
*}
end;

//00416350
procedure sub_00416350;
begin
{*
 00416350    call        VarInvalidOp
 00416355    ret
*}
end;

//00416358
procedure sub_00416358;
begin
{*
 00416358    call        00410BC8
 0041635D    ret
*}
end;

//00416360
function TCustomVariantType.RightPromotion(const V:TVarData; const Operator:TVarOp; var RequiredVarType:TVarType):Boolean;
begin
{*
 00416360    push        ebp
 00416361    mov         ebp,esp
 00416363    mov         edx,dword ptr [ebp+8]
 00416366    mov         ax,word ptr [eax+4]
 0041636A    mov         word ptr [edx],ax
 0041636D    mov         al,1
 0041636F    pop         ebp
 00416370    ret         4
*}
end;

//00416374
procedure sub_00416374;
begin
{*
 00416374    call        00416350
 00416379    ret
*}
end;

//0041637C
procedure TCustomVariantType.DispInvoke(Dest:PVarData; const Source:TVarData; CallDesc:PCallDesc; Params:Pointer);
begin
{*
 0041637C    push        ebp
 0041637D    mov         ebp,esp
 0041637F    call        00416358
 00416384    pop         ebp
 00416385    ret         8
*}
end;

//00416388
function TCustomVariantType._AddRef:Integer; stdcall;
begin
{*
 00416388    push        ebp
 00416389    mov         ebp,esp
 0041638B    or          eax,0FFFFFFFF
 0041638E    pop         ebp
 0041638F    ret         4
*}
end;

//00416394
function TCustomVariantType._Release:Integer; stdcall;
begin
{*
 00416394    push        ebp
 00416395    mov         ebp,esp
 00416397    or          eax,0FFFFFFFF
 0041639A    pop         ebp
 0041639B    ret         4
*}
end;

//004163A0
function TCustomVariantType.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 004163A0    push        ebp
 004163A1    mov         ebp,esp
 004163A3    push        ebx
 004163A4    mov         ebx,dword ptr [ebp+8]
 004163A7    mov         ecx,dword ptr [ebp+10]
 004163AA    mov         edx,dword ptr [ebp+0C]
 004163AD    mov         eax,ebx
 004163AF    call        TObject.GetInterface
 004163B4    test        al,al
>004163B6    je          004163BC
 004163B8    xor         eax,eax
>004163BA    jmp         004163C1
 004163BC    mov         eax,80004002
 004163C1    pop         ebx
 004163C2    pop         ebp
 004163C3    ret         0C
*}
end;

//004163C8
function FindCustomVariantType(const AVarType:TVarType; var CustomVariantType:TCustomVariantType):Boolean;
begin
{*
 004163C8    push        ebp
 004163C9    mov         ebp,esp
 004163CB    push        ecx
 004163CC    push        ebx
 004163CD    push        esi
 004163CE    push        edi
 004163CF    mov         esi,edx
 004163D1    mov         ebx,eax
 004163D3    cmp         dword ptr ds:[5E08F0],0;LVarTypes:_DT_02
>004163DA    je          004163EA
 004163DC    cmp         bx,100
>004163E1    jb          004163EA
 004163E3    cmp         bx,7FF
>004163E8    jbe         004163EE
 004163EA    xor         eax,eax
>004163EC    jmp         004163F0
 004163EE    mov         al,1
 004163F0    mov         byte ptr [ebp-1],al
 004163F3    cmp         byte ptr [ebp-1],0
>004163F7    je          00416477
 004163F9    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 004163FE    call        KERNEL32.EnterCriticalSection
 00416403    xor         eax,eax
 00416405    push        ebp
 00416406    push        416470
 0041640B    push        dword ptr fs:[eax]
 0041640E    mov         dword ptr fs:[eax],esp
 00416411    mov         eax,[005E08F0];LVarTypes:_DT_02
 00416416    call        @DynArrayLength
 0041641B    movzx       edi,bx
 0041641E    mov         edx,edi
 00416420    sub         edx,100
 00416426    cmp         eax,edx
 00416428    setg        byte ptr [ebp-1]
 0041642C    cmp         byte ptr [ebp-1],0
>00416430    je          00416458
 00416432    mov         eax,[005E08F0];LVarTypes:_DT_02
 00416437    mov         eax,dword ptr [eax+edi*4-400]
 0041643E    mov         dword ptr [esi],eax
 00416440    cmp         dword ptr [esi],0
>00416443    je          0041644F
 00416445    mov         eax,dword ptr [esi]
 00416447    cmp         eax,dword ptr ds:[5AC3D4]
>0041644D    jne         00416453
 0041644F    xor         eax,eax
>00416451    jmp         00416455
 00416453    mov         al,1
 00416455    mov         byte ptr [ebp-1],al
 00416458    xor         eax,eax
 0041645A    pop         edx
 0041645B    pop         ecx
 0041645C    pop         ecx
 0041645D    mov         dword ptr fs:[eax],edx
 00416460    push        416477
 00416465    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 0041646A    call        KERNEL32.LeaveCriticalSection
 0041646F    ret
>00416470    jmp         @HandleFinally
>00416475    jmp         00416465
 00416477    mov         al,byte ptr [ebp-1]
 0041647A    pop         edi
 0041647B    pop         esi
 0041647C    pop         ebx
 0041647D    pop         ecx
 0041647E    pop         ebp
 0041647F    ret
*}
end;

//00416480
function FindCustomVariantType(const TypeName:AnsiString; var CustomVariantType:TCustomVariantType):Boolean;
begin
{*
 00416480    push        ebp
 00416481    mov         ebp,esp
 00416483    add         esp,0FFFFFEF0
 00416489    push        ebx
 0041648A    push        esi
 0041648B    push        edi
 0041648C    xor         ecx,ecx
 0041648E    mov         dword ptr [ebp-10],ecx
 00416491    mov         dword ptr [ebp-8],edx
 00416494    mov         dword ptr [ebp-4],eax
 00416497    xor         eax,eax
 00416499    push        ebp
 0041649A    push        416556
 0041649F    push        dword ptr fs:[eax]
 004164A2    mov         dword ptr fs:[eax],esp
 004164A5    mov         byte ptr [ebp-9],0
 004164A9    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 004164AE    call        KERNEL32.EnterCriticalSection
 004164B3    xor         eax,eax
 004164B5    push        ebp
 004164B6    push        416539
 004164BB    push        dword ptr fs:[eax]
 004164BE    mov         dword ptr fs:[eax],esp
 004164C1    mov         eax,[005E08F0];LVarTypes:_DT_02
 004164C6    call        @DynArrayHigh
 004164CB    mov         esi,eax
 004164CD    test        esi,esi
>004164CF    jl          00416521
 004164D1    inc         esi
 004164D2    xor         edi,edi
 004164D4    mov         eax,[005E08F0];LVarTypes:_DT_02
 004164D9    mov         ebx,dword ptr [eax+edi*4]
 004164DC    test        ebx,ebx
>004164DE    je          0041651D
 004164E0    cmp         ebx,dword ptr ds:[5AC3D4]
>004164E6    je          0041651D
 004164E8    lea         edx,[ebp-110]
 004164EE    mov         eax,dword ptr [ebx]
 004164F0    call        TObject.ClassName
 004164F5    lea         edx,[ebp-110]
 004164FB    lea         eax,[ebp-10]
 004164FE    call        @LStrFromString
 00416503    mov         eax,dword ptr [ebp-10]
 00416506    mov         edx,dword ptr [ebp-4]
 00416509    call        SameText
 0041650E    test        al,al
>00416510    je          0041651D
 00416512    mov         eax,dword ptr [ebp-8]
 00416515    mov         dword ptr [eax],ebx
 00416517    mov         byte ptr [ebp-9],1
>0041651B    jmp         00416521
 0041651D    inc         edi
 0041651E    dec         esi
>0041651F    jne         004164D4
 00416521    xor         eax,eax
 00416523    pop         edx
 00416524    pop         ecx
 00416525    pop         ecx
 00416526    mov         dword ptr fs:[eax],edx
 00416529    push        416540
 0041652E    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 00416533    call        KERNEL32.LeaveCriticalSection
 00416538    ret
>00416539    jmp         @HandleFinally
>0041653E    jmp         0041652E
 00416540    xor         eax,eax
 00416542    pop         edx
 00416543    pop         ecx
 00416544    pop         ecx
 00416545    mov         dword ptr fs:[eax],edx
 00416548    push        41655D
 0041654D    lea         eax,[ebp-10]
 00416550    call        @LStrClr
 00416555    ret
>00416556    jmp         @HandleFinally
>0041655B    jmp         0041654D
 0041655D    mov         al,byte ptr [ebp-9]
 00416560    pop         edi
 00416561    pop         esi
 00416562    pop         ebx
 00416563    mov         esp,ebp
 00416565    pop         ebp
 00416566    ret
*}
end;

//00416568
function Null:Variant;
begin
{*
 00416568    call        @VarNull
 0041656D    ret
*}
end;

//00416570
procedure @VarCmpEQ(const Left:TVarData; const Right:TVarData);
begin
{*
 00416570    mov         ecx,0E
 00416575    call        VarCompare
 0041657A    cmp         al,1
 0041657C    ret
*}
end;

Initialization
//004165F8
{*
 004165F8    push        ebp
 004165F9    mov         ebp,esp
 004165FB    xor         eax,eax
 004165FD    push        ebp
 004165FE    push        416699
 00416603    push        dword ptr fs:[eax]
 00416606    mov         dword ptr fs:[eax],esp
 00416609    sub         dword ptr ds:[5E08EC],1
>00416610    jae         0041668B
 00416612    mov         eax,5E08CC;gvar_005E08CC:Variant
 00416617    call        SetClearVarToEmptyParam
 0041661C    mov         eax,410BC8;sub_00410BC8
 00416621    mov         [005E08DC],eax;gvar_005E08DC
 00416626    mov         eax,410718;VarInvalidOp
 0041662B    mov         [005E08E0],eax;ClearAnyProc:TAnyProc
 00416630    mov         edx,410628;VarCastError
 00416635    mov         dword ptr ds:[5E08E4],edx;ChangeAnyProc:TAnyProc
 0041663B    mov         [005E08E8],eax;RefAnyProc:TAnyProc
 00416640    mov         eax,410EC8;@VarClr
 00416645    mov         edx,dword ptr ds:[5AE4C0];^gvar_005AC010
 0041664B    mov         dword ptr [edx],eax
 0041664D    mov         eax,415C74
 00416652    mov         edx,dword ptr ds:[5AE14C];^gvar_005AC014
 00416658    mov         dword ptr [edx],eax
 0041665A    mov         eax,4111DC;@VarCopy
 0041665F    mov         edx,dword ptr ds:[5AE590];^gvar_005AC018
 00416665    mov         dword ptr [edx],eax
 00416667    mov         eax,4141CC;@VarToLStr
 0041666C    mov         edx,dword ptr ds:[5AE7B4];^gvar_005AC01C
 00416672    mov         dword ptr [edx],eax
 00416674    mov         eax,4148F4;@VarToWStr
 00416679    mov         edx,dword ptr ds:[5AE5D0];^gvar_005AC020
 0041667F    mov         dword ptr [edx],eax
 00416681    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 00416686    call        KERNEL32.InitializeCriticalSection
 0041668B    xor         eax,eax
 0041668D    pop         edx
 0041668E    pop         ecx
 0041668F    pop         ecx
 00416690    mov         dword ptr fs:[eax],edx
 00416693    push        4166A0
 00416698    ret
>00416699    jmp         @HandleFinally
>0041669E    jmp         00416698
 004166A0    pop         ebp
 004166A1    ret
*}
Finalization
//00416580
{*
 00416580    push        ebp
 00416581    mov         ebp,esp
 00416583    xor         eax,eax
 00416585    push        ebp
 00416586    push        4165EF
 0041658B    push        dword ptr fs:[eax]
 0041658E    mov         dword ptr fs:[eax],esp
 00416591    inc         dword ptr ds:[5E08EC]
>00416597    jne         004165E1
 00416599    call        ClearVariantTypeList
 0041659E    push        5E08F4;LVarTypeSync:TRTLCriticalSection
 004165A3    call        KERNEL32.DeleteCriticalSection
 004165A8    mov         eax,5E08F0;LVarTypes:_DT_02
 004165AD    mov         edx,dword ptr ds:[416100];.02
 004165B3    call        @DynArrayClear
 004165B8    mov         eax,5AC474;^'Empty'
 004165BD    mov         ecx,15
 004165C2    mov         edx,dword ptr ds:[4010B4];String
 004165C8    call        @FinalizeArray
 004165CD    mov         eax,5AC3B0
 004165D2    call        @LStrClr
 004165D7    mov         eax,5E08CC;gvar_005E08CC:Variant
 004165DC    call        @VarClr
 004165E1    xor         eax,eax
 004165E3    pop         edx
 004165E4    pop         ecx
 004165E5    pop         ecx
 004165E6    mov         dword ptr fs:[eax],edx
 004165E9    push        4165F6
 004165EE    ret
>004165EF    jmp         @HandleFinally
>004165F4    jmp         004165EE
 004165F6    pop         ebp
 004165F7    ret
*}
end.