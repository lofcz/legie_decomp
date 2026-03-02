//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ComCtrls;

interface

uses
  SysUtils, Classes;

type
  TConversion = class(TObject)
  public
    function ConvertReadStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer; virtual;//v0//0043349C
    function ConvertWriteStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer; virtual;//v4//004334B0
  end;
  TConversionFormat = TConversionFormat = record//size=0xC
f4:String;//f4
end;;
    function GetComCtlVersion:Integer;//00433464
    function ConvertReadStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;//0043349C
    function ConvertWriteStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;//004334B0

implementation

//00433464
function GetComCtlVersion:Integer;
begin
{*
 00433464    cmp         dword ptr ds:[5E0BE4],0;ComCtlVersion:Integer
>0043346B    jne         0043347C
 0043346D    mov         eax,43348C;'comctl32.dll'
 00433472    call        GetFileVersion
 00433477    mov         [005E0BE4],eax;ComCtlVersion:Integer
 0043347C    mov         eax,[005E0BE4];ComCtlVersion:Integer
 00433481    ret
*}
end;

//0043349C
function TConversion.ConvertReadStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 0043349C    push        ebp
 0043349D    mov         ebp,esp
 0043349F    push        ebx
 004334A0    mov         eax,ecx
 004334A2    mov         ecx,dword ptr [ebp+8]
 004334A5    xchg        eax,edx
 004334A6    mov         ebx,dword ptr [eax]
 004334A8    call        dword ptr [ebx+0C]
 004334AB    pop         ebx
 004334AC    pop         ebp
 004334AD    ret         4
*}
end;

//004334B0
function TConversion.ConvertWriteStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 004334B0    push        ebp
 004334B1    mov         ebp,esp
 004334B3    push        ebx
 004334B4    mov         eax,ecx
 004334B6    mov         ecx,dword ptr [ebp+8]
 004334B9    xchg        eax,edx
 004334BA    mov         ebx,dword ptr [eax]
 004334BC    call        dword ptr [ebx+10]
 004334BF    pop         ebx
 004334C0    pop         ebp
 004334C1    ret         4
*}
end;

Initialization
Finalization
//004334C4
{*
 004334C4    push        ebp
 004334C5    mov         ebp,esp
 004334C7    xor         eax,eax
 004334C9    push        ebp
 004334CA    push        433533
 004334CF    push        dword ptr fs:[eax]
 004334D2    mov         dword ptr fs:[eax],esp
 004334D5    inc         dword ptr ds:[5E0BD8]
>004334DB    jne         00433525
 004334DD    cmp         dword ptr ds:[5E0BDC],0;ShellModule:THandle
>004334E4    je          004334F1
 004334E6    mov         eax,[005E0BDC];ShellModule:THandle
 004334EB    push        eax
 004334EC    call        KERNEL32.FreeLibrary
 004334F1    cmp         dword ptr ds:[5E0BE0],0;FRichEditModule:THandle
>004334F8    je          00433505
 004334FA    mov         eax,[005E0BE0];FRichEditModule:THandle
 004334FF    push        eax
 00433500    call        KERNEL32.FreeLibrary
 00433505    mov         eax,5ACAD8
 0043350A    mov         edx,dword ptr ds:[433424];TConversionFormat
 00433510    call        @FinalizeRecord
 00433515    mov         eax,5ACACC
 0043351A    mov         edx,dword ptr ds:[433424];TConversionFormat
 00433520    call        @FinalizeRecord
 00433525    xor         eax,eax
 00433527    pop         edx
 00433528    pop         ecx
 00433529    pop         ecx
 0043352A    mov         dword ptr fs:[eax],edx
 0043352D    push        43353A
 00433532    ret
>00433533    jmp         @HandleFinally
>00433538    jmp         00433532
 0043353A    pop         ebp
 0043353B    ret
*}
end.