//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Registry;

interface

uses
  SysUtils, Classes;

type
  ERegistryException = class(Exception)
  end;
  TRegistry = class(TObject)
  public
    FCurrentKey:HKEY;//f4
    FRootKey:HKEY;//f8
    FLazyWrite:Boolean;//fC
    FCurrentPath:String;//f10
    FCloseRootKey:Boolean;//f14
    FAccess:LongWord;//f18
    constructor Create;//00432910
    constructor Create(AAccess:LongWord);//00432954
    destructor Destroy;//00432990
    procedure CloseKey;//004329BC
    procedure SetRootKey(Value:HKEY);//004329EC
    procedure ChangeKey(Value:HKEY; const Path:AnsiString);//00432A18
    function GetBaseKey(Relative:Boolean):HKEY;//00432A3C
    procedure SetCurrentKey(Value:HKEY);//00432A50
    function CreateKey(const Key:AnsiString):Boolean;//00432A54
    function OpenKey(const Key:AnsiString; CanCreate:Boolean):Boolean;//00432B30
    function GetDataInfo(const ValueName:AnsiString; var Value:TRegDataInfo):Boolean;//00432C54
    function GetDataSize(const ValueName:AnsiString):Integer;//00432CA4
    procedure WriteString(const Name:AnsiString; const Value:AnsiString);//00432CCC
    function ReadString(const Name:AnsiString):AnsiString;//00432CF8
    procedure PutData(const Name:AnsiString; Buffer:Pointer; BufSize:Integer; RegData:TRegDataType);//00432D70
    function GetData(const Name:AnsiString; Buffer:Pointer; BufSize:Integer; var RegData:TRegDataType):Integer;//00432DD8
    function ValueExists(const Name:AnsiString):Boolean;//00432E4C
    function GetKey(const Key:AnsiString):HKEY;//00432E5C
  end;
  TRegIniFile = class(TRegistry)
  public
    FFileName:String;//f1C
    constructor Create(const FileName:AnsiString);//00432EF4
    constructor Create(const FileName:AnsiString; AAccess:LongWord);//00432F30
    function ReadInteger(const Section:AnsiString; const Ident:AnsiString; Default:Longint):Longint;//00432F88
    procedure WriteInteger(const Section:AnsiString; const Ident:AnsiString; Value:Longint);//00433088
    function ReadBool(const Section:AnsiString; const Ident:AnsiString; Default:Boolean):Boolean;//00433178
    procedure WriteBool(const Section:AnsiString; const Ident:AnsiString; Value:Boolean);//004331BC
  end;
    procedure ReadError(const Name:AnsiString);//00432878
    function IsRelative(const Value:AnsiString):Boolean;//004328A4
    function RegDataToDataType(Value:TRegDataType):Integer;//004328B8
    function DataTypeToRegData(Value:Integer):TRegDataType;//004328E8

implementation

//00432878
procedure ReadError(const Name:AnsiString);
begin
{*
 00432878    push        ebx
 00432879    add         esp,0FFFFFFF8
 0043287C    mov         ebx,eax
 0043287E    mov         dword ptr [esp],ebx
 00432881    mov         byte ptr [esp+4],0B
 00432886    push        esp
 00432887    push        0
 00432889    mov         ecx,dword ptr ds:[5AE384];^SInvalidRegType:TResStringRec
 0043288F    mov         dl,1
 00432891    mov         eax,[00432744];ERegistryException
 00432896    call        Exception.CreateResFmt
 0043289B    call        @RaiseExcept
 004328A0    pop         ecx
 004328A1    pop         edx
 004328A2    pop         ebx
 004328A3    ret
*}
end;

//004328A4
function IsRelative(const Value:AnsiString):Boolean;
begin
{*
 004328A4    push        ebx
 004328A5    mov         ebx,eax
 004328A7    test        ebx,ebx
>004328A9    je          004328B4
 004328AB    cmp         byte ptr [ebx],5C
>004328AE    jne         004328B4
 004328B0    xor         eax,eax
 004328B2    pop         ebx
 004328B3    ret
 004328B4    mov         al,1
 004328B6    pop         ebx
 004328B7    ret
*}
end;

//004328B8
function RegDataToDataType(Value:TRegDataType):Integer;
begin
{*
 004328B8    dec         al
>004328BA    je          004328CA
 004328BC    dec         al
>004328BE    je          004328D0
 004328C0    dec         al
>004328C2    je          004328D6
 004328C4    dec         al
>004328C6    je          004328DC
>004328C8    jmp         004328E2
 004328CA    mov         eax,1
 004328CF    ret
 004328D0    mov         eax,2
 004328D5    ret
 004328D6    mov         eax,4
 004328DB    ret
 004328DC    mov         eax,3
 004328E1    ret
 004328E2    xor         eax,eax
 004328E4    ret
*}
end;

//004328E8
function DataTypeToRegData(Value:Integer):TRegDataType;
begin
{*
 004328E8    cmp         eax,1
>004328EB    jne         004328F0
 004328ED    mov         al,1
 004328EF    ret
 004328F0    cmp         eax,2
>004328F3    jne         004328F9
 004328F5    mov         al,2
>004328F7    jmp         0043290D
 004328F9    cmp         eax,4
>004328FC    jne         00432902
 004328FE    mov         al,3
>00432900    jmp         0043290D
 00432902    cmp         eax,3
>00432905    jne         0043290B
 00432907    mov         al,4
>00432909    jmp         0043290D
 0043290B    xor         eax,eax
 0043290D    ret
*}
end;

//00432910
constructor TRegistry.Create;
begin
{*
 00432910    push        ebx
 00432911    push        esi
 00432912    test        dl,dl
>00432914    je          0043291E
 00432916    add         esp,0FFFFFFF0
 00432919    call        @ClassCreate
 0043291E    mov         ebx,edx
 00432920    mov         esi,eax
 00432922    mov         edx,80000001
 00432927    mov         eax,esi
 00432929    call        TRegistry.SetRootKey
 0043292E    mov         dword ptr [esi+18],0F003F
 00432935    mov         byte ptr [esi+0C],1
 00432939    mov         eax,esi
 0043293B    test        bl,bl
>0043293D    je          0043294E
 0043293F    call        @AfterConstruction
 00432944    pop         dword ptr fs:[0]
 0043294B    add         esp,0C
 0043294E    mov         eax,esi
 00432950    pop         esi
 00432951    pop         ebx
 00432952    ret
*}
end;

//00432954
constructor TRegistry.Create(AAccess:LongWord);
begin
{*
 00432954    push        ebx
 00432955    push        esi
 00432956    push        edi
 00432957    test        dl,dl
>00432959    je          00432963
 0043295B    add         esp,0FFFFFFF0
 0043295E    call        @ClassCreate
 00432963    mov         esi,ecx
 00432965    mov         ebx,edx
 00432967    mov         edi,eax
 00432969    xor         edx,edx
 0043296B    mov         eax,edi
 0043296D    call        TRegistry.Create
 00432972    mov         dword ptr [edi+18],esi
 00432975    mov         eax,edi
 00432977    test        bl,bl
>00432979    je          0043298A
 0043297B    call        @AfterConstruction
 00432980    pop         dword ptr fs:[0]
 00432987    add         esp,0C
 0043298A    mov         eax,edi
 0043298C    pop         edi
 0043298D    pop         esi
 0043298E    pop         ebx
 0043298F    ret
*}
end;

//00432990
destructor TRegistry.Destroy;
begin
{*
 00432990    push        ebx
 00432991    push        esi
 00432992    call        @BeforeDestruction
 00432997    mov         ebx,edx
 00432999    mov         esi,eax
 0043299B    mov         eax,esi
 0043299D    call        TRegistry.CloseKey
 004329A2    mov         edx,ebx
 004329A4    and         dl,0FC
 004329A7    mov         eax,esi
 004329A9    call        TObject.Destroy
 004329AE    test        bl,bl
>004329B0    jle         004329B9
 004329B2    mov         eax,esi
 004329B4    call        @ClassDestroy
 004329B9    pop         esi
 004329BA    pop         ebx
 004329BB    ret
*}
end;

//004329BC
procedure TRegistry.CloseKey;
begin
{*
 004329BC    push        ebx
 004329BD    mov         ebx,eax
 004329BF    mov         eax,dword ptr [ebx+4]
 004329C2    test        eax,eax
>004329C4    je          004329E7
 004329C6    cmp         byte ptr [ebx+0C],0
>004329CA    je          004329D4
 004329CC    push        eax
 004329CD    call        advapi32.RegCloseKey
>004329D2    jmp         004329DA
 004329D4    push        eax
 004329D5    call        advapi32.RegFlushKey
 004329DA    xor         eax,eax
 004329DC    mov         dword ptr [ebx+4],eax
 004329DF    lea         eax,[ebx+10]
 004329E2    call        @LStrClr
 004329E7    pop         ebx
 004329E8    ret
*}
end;

//004329EC
procedure TRegistry.SetRootKey(Value:HKEY);
begin
{*
 004329EC    push        ebx
 004329ED    push        esi
 004329EE    mov         esi,edx
 004329F0    mov         ebx,eax
 004329F2    mov         eax,dword ptr [ebx+8]
 004329F5    cmp         esi,eax
>004329F7    je          00432A13
 004329F9    cmp         byte ptr [ebx+14],0
>004329FD    je          00432A09
 004329FF    push        eax
 00432A00    call        advapi32.RegCloseKey
 00432A05    mov         byte ptr [ebx+14],0
 00432A09    mov         dword ptr [ebx+8],esi
 00432A0C    mov         eax,ebx
 00432A0E    call        TRegistry.CloseKey
 00432A13    pop         esi
 00432A14    pop         ebx
 00432A15    ret
*}
end;

//00432A18
procedure TRegistry.ChangeKey(Value:HKEY; const Path:AnsiString);
begin
{*
 00432A18    push        ebx
 00432A19    push        esi
 00432A1A    push        edi
 00432A1B    mov         edi,ecx
 00432A1D    mov         esi,edx
 00432A1F    mov         ebx,eax
 00432A21    mov         eax,ebx
 00432A23    call        TRegistry.CloseKey
 00432A28    mov         dword ptr [ebx+4],esi
 00432A2B    lea         eax,[ebx+10]
 00432A2E    mov         edx,edi
 00432A30    call        @LStrAsg
 00432A35    pop         edi
 00432A36    pop         esi
 00432A37    pop         ebx
 00432A38    ret
*}
end;

//00432A3C
function TRegistry.GetBaseKey(Relative:Boolean):HKEY;
begin
{*
 00432A3C    mov         ecx,dword ptr [eax+4]
 00432A3F    test        ecx,ecx
>00432A41    je          00432A47
 00432A43    test        dl,dl
>00432A45    jne         00432A4B
 00432A47    mov         eax,dword ptr [eax+8]
 00432A4A    ret
 00432A4B    mov         eax,ecx
 00432A4D    ret
*}
end;

//00432A50
procedure TRegistry.SetCurrentKey(Value:HKEY);
begin
{*
 00432A50    mov         dword ptr [eax+4],edx
 00432A53    ret
*}
end;

//00432A54
function TRegistry.CreateKey(const Key:AnsiString):Boolean;
begin
{*
 00432A54    push        ebp
 00432A55    mov         ebp,esp
 00432A57    add         esp,0FFFFFFEC
 00432A5A    push        ebx
 00432A5B    push        esi
 00432A5C    push        edi
 00432A5D    xor         ecx,ecx
 00432A5F    mov         dword ptr [ebp-8],ecx
 00432A62    mov         edi,edx
 00432A64    mov         esi,eax
 00432A66    xor         eax,eax
 00432A68    push        ebp
 00432A69    push        432B20
 00432A6E    push        dword ptr fs:[eax]
 00432A71    mov         dword ptr fs:[eax],esp
 00432A74    xor         eax,eax
 00432A76    mov         dword ptr [ebp-4],eax
 00432A79    lea         eax,[ebp-8]
 00432A7C    mov         edx,edi
 00432A7E    call        @LStrLAsg
 00432A83    mov         eax,dword ptr [ebp-8]
 00432A86    call        IsRelative
 00432A8B    mov         ebx,eax
 00432A8D    test        bl,bl
>00432A8F    jne         00432AA3
 00432A91    lea         eax,[ebp-8]
 00432A94    mov         ecx,1
 00432A99    mov         edx,1
 00432A9E    call        @LStrDelete
 00432AA3    lea         eax,[ebp-0C]
 00432AA6    push        eax
 00432AA7    lea         eax,[ebp-4]
 00432AAA    push        eax
 00432AAB    push        0
 00432AAD    push        0F003F
 00432AB2    push        0
 00432AB4    push        0
 00432AB6    push        0
 00432AB8    mov         eax,dword ptr [ebp-8]
 00432ABB    call        @LStrToPChar
 00432AC0    push        eax
 00432AC1    mov         edx,ebx
 00432AC3    mov         eax,esi
 00432AC5    call        TRegistry.GetBaseKey
 00432ACA    push        eax
 00432ACB    call        advapi32.RegCreateKeyExA
 00432AD0    test        eax,eax
 00432AD2    sete        al
 00432AD5    mov         ebx,eax
 00432AD7    test        bl,bl
>00432AD9    je          00432AE6
 00432ADB    mov         eax,dword ptr [ebp-4]
 00432ADE    push        eax
 00432ADF    call        advapi32.RegCloseKey
>00432AE4    jmp         00432B0A
 00432AE6    mov         dword ptr [ebp-14],edi
 00432AE9    mov         byte ptr [ebp-10],0B
 00432AED    lea         eax,[ebp-14]
 00432AF0    push        eax
 00432AF1    push        0
 00432AF3    mov         ecx,dword ptr ds:[5AE1A0];^SRegCreateFailed:TResStringRec
 00432AF9    mov         dl,1
 00432AFB    mov         eax,[00432744];ERegistryException
 00432B00    call        Exception.CreateResFmt
 00432B05    call        @RaiseExcept
 00432B0A    xor         eax,eax
 00432B0C    pop         edx
 00432B0D    pop         ecx
 00432B0E    pop         ecx
 00432B0F    mov         dword ptr fs:[eax],edx
 00432B12    push        432B27
 00432B17    lea         eax,[ebp-8]
 00432B1A    call        @LStrClr
 00432B1F    ret
>00432B20    jmp         @HandleFinally
>00432B25    jmp         00432B17
 00432B27    mov         eax,ebx
 00432B29    pop         edi
 00432B2A    pop         esi
 00432B2B    pop         ebx
 00432B2C    mov         esp,ebp
 00432B2E    pop         ebp
 00432B2F    ret
*}
end;

//00432B30
function TRegistry.OpenKey(const Key:AnsiString; CanCreate:Boolean):Boolean;
begin
{*
 00432B30    push        ebp
 00432B31    mov         ebp,esp
 00432B33    add         esp,0FFFFFFF0
 00432B36    push        ebx
 00432B37    push        esi
 00432B38    xor         ebx,ebx
 00432B3A    mov         dword ptr [ebp-0C],ebx
 00432B3D    mov         byte ptr [ebp-1],cl
 00432B40    mov         ebx,edx
 00432B42    mov         esi,eax
 00432B44    xor         eax,eax
 00432B46    push        ebp
 00432B47    push        432C35
 00432B4C    push        dword ptr fs:[eax]
 00432B4F    mov         dword ptr fs:[eax],esp
 00432B52    lea         eax,[ebp-0C]
 00432B55    mov         edx,ebx
 00432B57    call        @LStrLAsg
 00432B5C    mov         eax,dword ptr [ebp-0C]
 00432B5F    call        IsRelative
 00432B64    mov         ebx,eax
 00432B66    test        bl,bl
>00432B68    jne         00432B7C
 00432B6A    lea         eax,[ebp-0C]
 00432B6D    mov         ecx,1
 00432B72    mov         edx,1
 00432B77    call        @LStrDelete
 00432B7C    xor         eax,eax
 00432B7E    mov         dword ptr [ebp-8],eax
 00432B81    cmp         byte ptr [ebp-1],0
>00432B85    je          00432B8D
 00432B87    cmp         dword ptr [ebp-0C],0
>00432B8B    jne         00432BB7
 00432B8D    lea         eax,[ebp-8]
 00432B90    push        eax
 00432B91    mov         eax,dword ptr [esi+18]
 00432B94    push        eax
 00432B95    push        0
 00432B97    mov         eax,dword ptr [ebp-0C]
 00432B9A    call        @LStrToPChar
 00432B9F    push        eax
 00432BA0    mov         edx,ebx
 00432BA2    mov         eax,esi
 00432BA4    call        TRegistry.GetBaseKey
 00432BA9    push        eax
 00432BAA    call        advapi32.RegOpenKeyExA
 00432BAF    test        eax,eax
 00432BB1    sete        byte ptr [ebp-2]
>00432BB5    jmp         00432BE9
 00432BB7    lea         eax,[ebp-10]
 00432BBA    push        eax
 00432BBB    lea         eax,[ebp-8]
 00432BBE    push        eax
 00432BBF    push        0
 00432BC1    mov         eax,dword ptr [esi+18]
 00432BC4    push        eax
 00432BC5    push        0
 00432BC7    push        0
 00432BC9    push        0
 00432BCB    mov         eax,dword ptr [ebp-0C]
 00432BCE    call        @LStrToPChar
 00432BD3    push        eax
 00432BD4    mov         edx,ebx
 00432BD6    mov         eax,esi
 00432BD8    call        TRegistry.GetBaseKey
 00432BDD    push        eax
 00432BDE    call        advapi32.RegCreateKeyExA
 00432BE3    test        eax,eax
 00432BE5    sete        byte ptr [ebp-2]
 00432BE9    cmp         byte ptr [ebp-2],0
>00432BED    je          00432C1F
 00432BEF    cmp         dword ptr [esi+4],0
 00432BF3    setne       al
 00432BF6    test        al,bl
>00432BF8    je          00432C12
 00432BFA    push        dword ptr [esi+10]
 00432BFD    push        432C50;'\'
 00432C02    push        dword ptr [ebp-0C]
 00432C05    lea         eax,[ebp-0C]
 00432C08    mov         edx,3
 00432C0D    call        @LStrCatN
 00432C12    mov         ecx,dword ptr [ebp-0C]
 00432C15    mov         edx,dword ptr [ebp-8]
 00432C18    mov         eax,esi
 00432C1A    call        TRegistry.ChangeKey
 00432C1F    xor         eax,eax
 00432C21    pop         edx
 00432C22    pop         ecx
 00432C23    pop         ecx
 00432C24    mov         dword ptr fs:[eax],edx
 00432C27    push        432C3C
 00432C2C    lea         eax,[ebp-0C]
 00432C2F    call        @LStrClr
 00432C34    ret
>00432C35    jmp         @HandleFinally
>00432C3A    jmp         00432C2C
 00432C3C    mov         al,byte ptr [ebp-2]
 00432C3F    pop         esi
 00432C40    pop         ebx
 00432C41    mov         esp,ebp
 00432C43    pop         ebp
 00432C44    ret
*}
end;

//00432C54
function TRegistry.GetDataInfo(const ValueName:AnsiString; var Value:TRegDataInfo):Boolean;
begin
{*
 00432C54    push        ebx
 00432C55    push        esi
 00432C56    push        edi
 00432C57    push        ebp
 00432C58    push        ecx
 00432C59    mov         ebp,ecx
 00432C5B    mov         edi,edx
 00432C5D    mov         esi,eax
 00432C5F    mov         eax,ebp
 00432C61    xor         ecx,ecx
 00432C63    mov         edx,8
 00432C68    call        @FillChar
 00432C6D    lea         eax,[ebp+4]
 00432C70    push        eax
 00432C71    push        0
 00432C73    lea         eax,[esp+8]
 00432C77    push        eax
 00432C78    push        0
 00432C7A    mov         eax,edi
 00432C7C    call        @LStrToPChar
 00432C81    push        eax
 00432C82    mov         eax,dword ptr [esi+4]
 00432C85    push        eax
 00432C86    call        advapi32.RegQueryValueExA
 00432C8B    test        eax,eax
 00432C8D    sete        bl
 00432C90    mov         eax,dword ptr [esp]
 00432C93    call        DataTypeToRegData
 00432C98    mov         byte ptr [ebp],al
 00432C9B    mov         eax,ebx
 00432C9D    pop         edx
 00432C9E    pop         ebp
 00432C9F    pop         edi
 00432CA0    pop         esi
 00432CA1    pop         ebx
 00432CA2    ret
*}
end;

//00432CA4
function TRegistry.GetDataSize(const ValueName:AnsiString):Integer;
begin
{*
 00432CA4    push        ebx
 00432CA5    push        esi
 00432CA6    add         esp,0FFFFFFF8
 00432CA9    mov         esi,edx
 00432CAB    mov         ebx,eax
 00432CAD    mov         ecx,esp
 00432CAF    mov         edx,esi
 00432CB1    mov         eax,ebx
 00432CB3    call        TRegistry.GetDataInfo
 00432CB8    test        al,al
>00432CBA    je          00432CC2
 00432CBC    mov         eax,dword ptr [esp+4]
>00432CC0    jmp         00432CC5
 00432CC2    or          eax,0FFFFFFFF
 00432CC5    pop         ecx
 00432CC6    pop         edx
 00432CC7    pop         esi
 00432CC8    pop         ebx
 00432CC9    ret
*}
end;

//00432CCC
procedure TRegistry.WriteString(const Name:AnsiString; const Value:AnsiString);
begin
{*
 00432CCC    push        ebx
 00432CCD    push        esi
 00432CCE    push        edi
 00432CCF    mov         esi,ecx
 00432CD1    mov         edi,edx
 00432CD3    mov         ebx,eax
 00432CD5    mov         eax,esi
 00432CD7    call        @LStrLen
 00432CDC    inc         eax
 00432CDD    push        eax
 00432CDE    push        1
 00432CE0    mov         eax,esi
 00432CE2    call        @LStrToPChar
 00432CE7    mov         ecx,eax
 00432CE9    mov         edx,edi
 00432CEB    mov         eax,ebx
 00432CED    call        TRegistry.PutData
 00432CF2    pop         edi
 00432CF3    pop         esi
 00432CF4    pop         ebx
 00432CF5    ret
*}
end;

//00432CF8
function TRegistry.ReadString(const Name:AnsiString):AnsiString;
begin
{*
 00432CF8    push        ebx
 00432CF9    push        esi
 00432CFA    push        edi
 00432CFB    push        ebp
 00432CFC    push        ecx
 00432CFD    mov         edi,ecx
 00432CFF    mov         ebp,edx
 00432D01    mov         esi,eax
 00432D03    mov         edx,ebp
 00432D05    mov         eax,esi
 00432D07    call        TRegistry.GetDataSize
 00432D0C    mov         ebx,eax
 00432D0E    test        ebx,ebx
>00432D10    jle         00432D61
 00432D12    mov         eax,edi
 00432D14    mov         ecx,ebx
 00432D16    xor         edx,edx
 00432D18    call        @LStrFromPCharLen
 00432D1D    push        ebx
 00432D1E    lea         eax,[esp+4]
 00432D22    push        eax
 00432D23    mov         eax,dword ptr [edi]
 00432D25    call        @LStrToPChar
 00432D2A    mov         ecx,eax
 00432D2C    mov         edx,ebp
 00432D2E    mov         eax,esi
 00432D30    call        TRegistry.GetData
 00432D35    cmp         byte ptr [esp],1
>00432D39    je          00432D41
 00432D3B    cmp         byte ptr [esp],2
>00432D3F    jne         00432D58
 00432D41    mov         eax,dword ptr [edi]
 00432D43    call        @LStrToPChar
 00432D48    call        StrLen
 00432D4D    mov         edx,eax
 00432D4F    mov         eax,edi
 00432D51    call        @LStrSetLength
>00432D56    jmp         00432D68
 00432D58    mov         eax,ebp
 00432D5A    call        ReadError
>00432D5F    jmp         00432D68
 00432D61    mov         eax,edi
 00432D63    call        @LStrClr
 00432D68    pop         edx
 00432D69    pop         ebp
 00432D6A    pop         edi
 00432D6B    pop         esi
 00432D6C    pop         ebx
 00432D6D    ret
*}
end;

//00432D70
procedure TRegistry.PutData(const Name:AnsiString; Buffer:Pointer; BufSize:Integer; RegData:TRegDataType);
begin
{*
 00432D70    push        ebp
 00432D71    mov         ebp,esp
 00432D73    add         esp,0FFFFFFF4
 00432D76    push        ebx
 00432D77    push        esi
 00432D78    push        edi
 00432D79    mov         dword ptr [ebp-4],ecx
 00432D7C    mov         edi,edx
 00432D7E    mov         ebx,eax
 00432D80    mov         al,byte ptr [ebp+8]
 00432D83    call        RegDataToDataType
 00432D88    mov         esi,eax
 00432D8A    mov         eax,dword ptr [ebp+0C]
 00432D8D    push        eax
 00432D8E    mov         eax,dword ptr [ebp-4]
 00432D91    push        eax
 00432D92    push        esi
 00432D93    push        0
 00432D95    mov         eax,edi
 00432D97    call        @LStrToPChar
 00432D9C    push        eax
 00432D9D    mov         eax,dword ptr [ebx+4]
 00432DA0    push        eax
 00432DA1    call        advapi32.RegSetValueExA
 00432DA6    test        eax,eax
>00432DA8    je          00432DCE
 00432DAA    mov         dword ptr [ebp-0C],edi
 00432DAD    mov         byte ptr [ebp-8],0B
 00432DB1    lea         eax,[ebp-0C]
 00432DB4    push        eax
 00432DB5    push        0
 00432DB7    mov         ecx,dword ptr ds:[5AE4B4];^SRegSetDataFailed:TResStringRec
 00432DBD    mov         dl,1
 00432DBF    mov         eax,[00432744];ERegistryException
 00432DC4    call        Exception.CreateResFmt
 00432DC9    call        @RaiseExcept
 00432DCE    pop         edi
 00432DCF    pop         esi
 00432DD0    pop         ebx
 00432DD1    mov         esp,ebp
 00432DD3    pop         ebp
 00432DD4    ret         8
*}
end;

//00432DD8
function TRegistry.GetData(const Name:AnsiString; Buffer:Pointer; BufSize:Integer; var RegData:TRegDataType):Integer;
begin
{*
 00432DD8    push        ebp
 00432DD9    mov         ebp,esp
 00432DDB    add         esp,0FFFFFFF4
 00432DDE    push        ebx
 00432DDF    push        esi
 00432DE0    push        edi
 00432DE1    mov         edi,ecx
 00432DE3    mov         esi,edx
 00432DE5    mov         ebx,eax
 00432DE7    xor         eax,eax
 00432DE9    mov         dword ptr [ebp-4],eax
 00432DEC    lea         eax,[ebp+0C]
 00432DEF    push        eax
 00432DF0    push        edi
 00432DF1    lea         eax,[ebp-4]
 00432DF4    push        eax
 00432DF5    push        0
 00432DF7    mov         eax,esi
 00432DF9    call        @LStrToPChar
 00432DFE    push        eax
 00432DFF    mov         eax,dword ptr [ebx+4]
 00432E02    push        eax
 00432E03    call        advapi32.RegQueryValueExA
 00432E08    test        eax,eax
>00432E0A    je          00432E30
 00432E0C    mov         dword ptr [ebp-0C],esi
 00432E0F    mov         byte ptr [ebp-8],0B
 00432E13    lea         eax,[ebp-0C]
 00432E16    push        eax
 00432E17    push        0
 00432E19    mov         ecx,dword ptr ds:[5AE824];^SRegGetDataFailed:TResStringRec
 00432E1F    mov         dl,1
 00432E21    mov         eax,[00432744];ERegistryException
 00432E26    call        Exception.CreateResFmt
 00432E2B    call        @RaiseExcept
 00432E30    mov         ebx,dword ptr [ebp+0C]
 00432E33    mov         eax,dword ptr [ebp-4]
 00432E36    call        DataTypeToRegData
 00432E3B    mov         edx,dword ptr [ebp+8]
 00432E3E    mov         byte ptr [edx],al
 00432E40    mov         eax,ebx
 00432E42    pop         edi
 00432E43    pop         esi
 00432E44    pop         ebx
 00432E45    mov         esp,ebp
 00432E47    pop         ebp
 00432E48    ret         8
*}
end;

//00432E4C
function TRegistry.ValueExists(const Name:AnsiString):Boolean;
begin
{*
 00432E4C    add         esp,0FFFFFFF8
 00432E4F    mov         ecx,esp
 00432E51    call        TRegistry.GetDataInfo
 00432E56    pop         ecx
 00432E57    pop         edx
 00432E58    ret
*}
end;

//00432E5C
function TRegistry.GetKey(const Key:AnsiString):HKEY;
begin
{*
 00432E5C    push        ebp
 00432E5D    mov         ebp,esp
 00432E5F    add         esp,0FFFFFFF8
 00432E62    push        ebx
 00432E63    push        esi
 00432E64    xor         ecx,ecx
 00432E66    mov         dword ptr [ebp-8],ecx
 00432E69    mov         ebx,edx
 00432E6B    mov         esi,eax
 00432E6D    xor         eax,eax
 00432E6F    push        ebp
 00432E70    push        432EE2
 00432E75    push        dword ptr fs:[eax]
 00432E78    mov         dword ptr fs:[eax],esp
 00432E7B    lea         eax,[ebp-8]
 00432E7E    mov         edx,ebx
 00432E80    call        @LStrLAsg
 00432E85    mov         eax,dword ptr [ebp-8]
 00432E88    call        IsRelative
 00432E8D    mov         ebx,eax
 00432E8F    test        bl,bl
>00432E91    jne         00432EA5
 00432E93    lea         eax,[ebp-8]
 00432E96    mov         ecx,1
 00432E9B    mov         edx,1
 00432EA0    call        @LStrDelete
 00432EA5    xor         eax,eax
 00432EA7    mov         dword ptr [ebp-4],eax
 00432EAA    lea         eax,[ebp-4]
 00432EAD    push        eax
 00432EAE    mov         eax,dword ptr [esi+18]
 00432EB1    push        eax
 00432EB2    push        0
 00432EB4    mov         eax,dword ptr [ebp-8]
 00432EB7    call        @LStrToPChar
 00432EBC    push        eax
 00432EBD    mov         edx,ebx
 00432EBF    mov         eax,esi
 00432EC1    call        TRegistry.GetBaseKey
 00432EC6    push        eax
 00432EC7    call        advapi32.RegOpenKeyExA
 00432ECC    xor         eax,eax
 00432ECE    pop         edx
 00432ECF    pop         ecx
 00432ED0    pop         ecx
 00432ED1    mov         dword ptr fs:[eax],edx
 00432ED4    push        432EE9
 00432ED9    lea         eax,[ebp-8]
 00432EDC    call        @LStrClr
 00432EE1    ret
>00432EE2    jmp         @HandleFinally
>00432EE7    jmp         00432ED9
 00432EE9    mov         eax,dword ptr [ebp-4]
 00432EEC    pop         esi
 00432EED    pop         ebx
 00432EEE    pop         ecx
 00432EEF    pop         ecx
 00432EF0    pop         ebp
 00432EF1    ret
*}
end;

//00432EF4
constructor TRegIniFile.Create(const FileName:AnsiString);
begin
{*
 00432EF4    push        ebx
 00432EF5    push        esi
 00432EF6    test        dl,dl
>00432EF8    je          00432F02
 00432EFA    add         esp,0FFFFFFF0
 00432EFD    call        @ClassCreate
 00432F02    mov         ebx,edx
 00432F04    mov         esi,eax
 00432F06    push        0F003F
 00432F0B    xor         edx,edx
 00432F0D    mov         eax,esi
 00432F0F    call        TRegIniFile.Create
 00432F14    mov         eax,esi
 00432F16    test        bl,bl
>00432F18    je          00432F29
 00432F1A    call        @AfterConstruction
 00432F1F    pop         dword ptr fs:[0]
 00432F26    add         esp,0C
 00432F29    mov         eax,esi
 00432F2B    pop         esi
 00432F2C    pop         ebx
 00432F2D    ret
*}
end;

//00432F30
constructor TRegIniFile.Create(const FileName:AnsiString; AAccess:LongWord);
begin
{*
 00432F30    push        ebp
 00432F31    mov         ebp,esp
 00432F33    push        ebx
 00432F34    push        esi
 00432F35    push        edi
 00432F36    test        dl,dl
>00432F38    je          00432F42
 00432F3A    add         esp,0FFFFFFF0
 00432F3D    call        @ClassCreate
 00432F42    mov         esi,ecx
 00432F44    mov         ebx,edx
 00432F46    mov         edi,eax
 00432F48    mov         ecx,dword ptr [ebp+8]
 00432F4B    xor         edx,edx
 00432F4D    mov         eax,edi
 00432F4F    call        TRegistry.Create
 00432F54    lea         eax,[edi+1C]
 00432F57    mov         edx,esi
 00432F59    call        @LStrAsg
 00432F5E    mov         cl,1
 00432F60    mov         edx,esi
 00432F62    mov         eax,edi
 00432F64    call        TRegistry.OpenKey
 00432F69    mov         eax,edi
 00432F6B    test        bl,bl
>00432F6D    je          00432F7E
 00432F6F    call        @AfterConstruction
 00432F74    pop         dword ptr fs:[0]
 00432F7B    add         esp,0C
 00432F7E    mov         eax,edi
 00432F80    pop         edi
 00432F81    pop         esi
 00432F82    pop         ebx
 00432F83    pop         ebp
 00432F84    ret         4
*}
end;

//00432F88
function TRegIniFile.ReadInteger(const Section:AnsiString; const Ident:AnsiString; Default:Longint):Longint;
begin
{*
 00432F88    push        ebp
 00432F89    mov         ebp,esp
 00432F8B    add         esp,0FFFFFFEC
 00432F8E    push        ebx
 00432F8F    push        esi
 00432F90    xor         ebx,ebx
 00432F92    mov         dword ptr [ebp-14],ebx
 00432F95    mov         esi,ecx
 00432F97    mov         dword ptr [ebp-4],eax
 00432F9A    mov         ebx,dword ptr [ebp+8]
 00432F9D    xor         eax,eax
 00432F9F    push        ebp
 00432FA0    push        433074
 00432FA5    push        dword ptr fs:[eax]
 00432FA8    mov         dword ptr fs:[eax],esp
 00432FAB    mov         eax,dword ptr [ebp-4]
 00432FAE    call        TRegistry.GetKey
 00432FB3    mov         dword ptr [ebp-0C],eax
 00432FB6    cmp         dword ptr [ebp-0C],0
>00432FBA    je          0043305B
 00432FC0    xor         eax,eax
 00432FC2    push        ebp
 00432FC3    push        433054
 00432FC8    push        dword ptr fs:[eax]
 00432FCB    mov         dword ptr fs:[eax],esp
 00432FCE    mov         eax,dword ptr [ebp-4]
 00432FD1    mov         eax,dword ptr [eax+4]
 00432FD4    mov         dword ptr [ebp-10],eax
 00432FD7    mov         edx,dword ptr [ebp-0C]
 00432FDA    mov         eax,dword ptr [ebp-4]
 00432FDD    call        TRegistry.SetCurrentKey
 00432FE2    xor         eax,eax
 00432FE4    push        ebp
 00432FE5    push        433036
 00432FEA    push        dword ptr fs:[eax]
 00432FED    mov         dword ptr fs:[eax],esp
 00432FF0    mov         edx,esi
 00432FF2    mov         eax,dword ptr [ebp-4]
 00432FF5    call        TRegistry.ValueExists
 00432FFA    test        al,al
>00432FFC    je          0043301A
 00432FFE    lea         ecx,[ebp-14]
 00433001    mov         edx,esi
 00433003    mov         eax,dword ptr [ebp-4]
 00433006    call        TRegistry.ReadString
 0043300B    mov         edx,ebx
 0043300D    mov         eax,dword ptr [ebp-14]
 00433010    call        StrToIntDef
 00433015    mov         dword ptr [ebp-8],eax
>00433018    jmp         0043301D
 0043301A    mov         dword ptr [ebp-8],ebx
 0043301D    xor         eax,eax
 0043301F    pop         edx
 00433020    pop         ecx
 00433021    pop         ecx
 00433022    mov         dword ptr fs:[eax],edx
 00433025    push        43303D
 0043302A    mov         edx,dword ptr [ebp-10]
 0043302D    mov         eax,dword ptr [ebp-4]
 00433030    call        TRegistry.SetCurrentKey
 00433035    ret
>00433036    jmp         @HandleFinally
>0043303B    jmp         0043302A
 0043303D    xor         eax,eax
 0043303F    pop         edx
 00433040    pop         ecx
 00433041    pop         ecx
 00433042    mov         dword ptr fs:[eax],edx
 00433045    push        43305E
 0043304A    mov         eax,dword ptr [ebp-0C]
 0043304D    push        eax
 0043304E    call        advapi32.RegCloseKey
 00433053    ret
>00433054    jmp         @HandleFinally
>00433059    jmp         0043304A
 0043305B    mov         dword ptr [ebp-8],ebx
 0043305E    xor         eax,eax
 00433060    pop         edx
 00433061    pop         ecx
 00433062    pop         ecx
 00433063    mov         dword ptr fs:[eax],edx
 00433066    push        43307B
 0043306B    lea         eax,[ebp-14]
 0043306E    call        @LStrClr
 00433073    ret
>00433074    jmp         @HandleFinally
>00433079    jmp         0043306B
 0043307B    mov         eax,dword ptr [ebp-8]
 0043307E    pop         esi
 0043307F    pop         ebx
 00433080    mov         esp,ebp
 00433082    pop         ebp
 00433083    ret         4
*}
end;

//00433088
procedure TRegIniFile.WriteInteger(const Section:AnsiString; const Ident:AnsiString; Value:Longint);
begin
{*
 00433088    push        ebp
 00433089    mov         ebp,esp
 0043308B    add         esp,0FFFFFFF0
 0043308E    push        ebx
 0043308F    push        esi
 00433090    xor         ebx,ebx
 00433092    mov         dword ptr [ebp-10],ebx
 00433095    mov         esi,ecx
 00433097    mov         ebx,edx
 00433099    mov         dword ptr [ebp-4],eax
 0043309C    xor         eax,eax
 0043309E    push        ebp
 0043309F    push        433167
 004330A4    push        dword ptr fs:[eax]
 004330A7    mov         dword ptr fs:[eax],esp
 004330AA    mov         edx,ebx
 004330AC    mov         eax,dword ptr [ebp-4]
 004330AF    call        TRegistry.CreateKey
 004330B4    mov         edx,ebx
 004330B6    mov         eax,dword ptr [ebp-4]
 004330B9    call        TRegistry.GetKey
 004330BE    mov         dword ptr [ebp-8],eax
 004330C1    cmp         dword ptr [ebp-8],0
>004330C5    je          00433151
 004330CB    xor         eax,eax
 004330CD    push        ebp
 004330CE    push        43314A
 004330D3    push        dword ptr fs:[eax]
 004330D6    mov         dword ptr fs:[eax],esp
 004330D9    mov         eax,dword ptr [ebp-4]
 004330DC    mov         eax,dword ptr [eax+4]
 004330DF    mov         dword ptr [ebp-0C],eax
 004330E2    mov         edx,dword ptr [ebp-8]
 004330E5    mov         eax,dword ptr [ebp-4]
 004330E8    call        TRegistry.SetCurrentKey
 004330ED    xor         eax,eax
 004330EF    push        ebp
 004330F0    push        43312C
 004330F5    push        dword ptr fs:[eax]
 004330F8    mov         dword ptr fs:[eax],esp
 004330FB    lea         edx,[ebp-10]
 004330FE    mov         eax,dword ptr [ebp+8]
 00433101    call        IntToStr
 00433106    mov         ecx,dword ptr [ebp-10]
 00433109    mov         edx,esi
 0043310B    mov         eax,dword ptr [ebp-4]
 0043310E    call        TRegistry.WriteString
 00433113    xor         eax,eax
 00433115    pop         edx
 00433116    pop         ecx
 00433117    pop         ecx
 00433118    mov         dword ptr fs:[eax],edx
 0043311B    push        433133
 00433120    mov         edx,dword ptr [ebp-0C]
 00433123    mov         eax,dword ptr [ebp-4]
 00433126    call        TRegistry.SetCurrentKey
 0043312B    ret
>0043312C    jmp         @HandleFinally
>00433131    jmp         00433120
 00433133    xor         eax,eax
 00433135    pop         edx
 00433136    pop         ecx
 00433137    pop         ecx
 00433138    mov         dword ptr fs:[eax],edx
 0043313B    push        433151
 00433140    mov         eax,dword ptr [ebp-8]
 00433143    push        eax
 00433144    call        advapi32.RegCloseKey
 00433149    ret
>0043314A    jmp         @HandleFinally
>0043314F    jmp         00433140
 00433151    xor         eax,eax
 00433153    pop         edx
 00433154    pop         ecx
 00433155    pop         ecx
 00433156    mov         dword ptr fs:[eax],edx
 00433159    push        43316E
 0043315E    lea         eax,[ebp-10]
 00433161    call        @LStrClr
 00433166    ret
>00433167    jmp         @HandleFinally
>0043316C    jmp         0043315E
 0043316E    pop         esi
 0043316F    pop         ebx
 00433170    mov         esp,ebp
 00433172    pop         ebp
 00433173    ret         4
*}
end;

//00433178
function TRegIniFile.ReadBool(const Section:AnsiString; const Ident:AnsiString; Default:Boolean):Boolean;
begin
{*
 00433178    push        ebp
 00433179    mov         ebp,esp
 0043317B    push        ebx
 0043317C    push        esi
 0043317D    push        edi
 0043317E    mov         edi,ecx
 00433180    mov         esi,edx
 00433182    mov         ebx,eax
 00433184    xor         eax,eax
 00433186    mov         al,byte ptr [ebp+8]
 00433189    push        eax
 0043318A    mov         ecx,edi
 0043318C    mov         edx,esi
 0043318E    mov         eax,ebx
 00433190    call        TRegIniFile.ReadInteger
 00433195    test        eax,eax
 00433197    setne       al
 0043319A    pop         edi
 0043319B    pop         esi
 0043319C    pop         ebx
 0043319D    pop         ebp
 0043319E    ret         4
*}
end;

//004331BC
procedure TRegIniFile.WriteBool(const Section:AnsiString; const Ident:AnsiString; Value:Boolean);
begin
{*
 004331BC    push        ebp
 004331BD    mov         ebp,esp
 004331BF    add         esp,0FFFFFFF4
 004331C2    push        ebx
 004331C3    push        esi
 004331C4    mov         esi,ecx
 004331C6    mov         ebx,edx
 004331C8    mov         dword ptr [ebp-4],eax
 004331CB    mov         edx,ebx
 004331CD    mov         eax,dword ptr [ebp-4]
 004331D0    call        TRegistry.CreateKey
 004331D5    mov         edx,ebx
 004331D7    mov         eax,dword ptr [ebp-4]
 004331DA    call        TRegistry.GetKey
 004331DF    mov         dword ptr [ebp-8],eax
 004331E2    cmp         dword ptr [ebp-8],0
>004331E6    je          00433270
 004331EC    xor         eax,eax
 004331EE    push        ebp
 004331EF    push        433269
 004331F4    push        dword ptr fs:[eax]
 004331F7    mov         dword ptr fs:[eax],esp
 004331FA    mov         eax,dword ptr [ebp-4]
 004331FD    mov         eax,dword ptr [eax+4]
 00433200    mov         dword ptr [ebp-0C],eax
 00433203    mov         edx,dword ptr [ebp-8]
 00433206    mov         eax,dword ptr [ebp-4]
 00433209    call        TRegistry.SetCurrentKey
 0043320E    xor         eax,eax
 00433210    push        ebp
 00433211    push        43324B
 00433216    push        dword ptr fs:[eax]
 00433219    mov         dword ptr fs:[eax],esp
 0043321C    xor         eax,eax
 0043321E    mov         al,byte ptr [ebp+8]
 00433221    mov         ecx,dword ptr [eax*4+5ACABC]
 00433228    mov         edx,esi
 0043322A    mov         eax,dword ptr [ebp-4]
 0043322D    call        TRegistry.WriteString
 00433232    xor         eax,eax
 00433234    pop         edx
 00433235    pop         ecx
 00433236    pop         ecx
 00433237    mov         dword ptr fs:[eax],edx
 0043323A    push        433252
 0043323F    mov         edx,dword ptr [ebp-0C]
 00433242    mov         eax,dword ptr [ebp-4]
 00433245    call        TRegistry.SetCurrentKey
 0043324A    ret
>0043324B    jmp         @HandleFinally
>00433250    jmp         0043323F
 00433252    xor         eax,eax
 00433254    pop         edx
 00433255    pop         ecx
 00433256    pop         ecx
 00433257    mov         dword ptr fs:[eax],edx
 0043325A    push        433270
 0043325F    mov         eax,dword ptr [ebp-8]
 00433262    push        eax
 00433263    call        advapi32.RegCloseKey
 00433268    ret
>00433269    jmp         @HandleFinally
>0043326E    jmp         0043325F
 00433270    pop         esi
 00433271    pop         ebx
 00433272    mov         esp,ebp
 00433274    pop         ebp
 00433275    ret         4
*}
end;

Initialization
Finalization
//00433278
{*
 00433278    push        ebp
 00433279    mov         ebp,esp
 0043327B    xor         eax,eax
 0043327D    push        ebp
 0043327E    push        4332B4
 00433283    push        dword ptr fs:[eax]
 00433286    mov         dword ptr fs:[eax],esp
 00433289    inc         dword ptr ds:[5E0BC0]
>0043328F    jne         004332A6
 00433291    mov         eax,5ACABC
 00433296    mov         ecx,2
 0043329B    mov         edx,dword ptr ds:[4010B4];String
 004332A1    call        @FinalizeArray
 004332A6    xor         eax,eax
 004332A8    pop         edx
 004332A9    pop         ecx
 004332AA    pop         ecx
 004332AB    mov         dword ptr fs:[eax],edx
 004332AE    push        4332BB
 004332B3    ret
>004332B4    jmp         @HandleFinally
>004332B9    jmp         004332B3
 004332BB    pop         ebp
 004332BC    ret
*}
end.