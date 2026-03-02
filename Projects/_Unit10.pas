//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit10;

interface

uses
  SysUtils, Classes;

    procedure VariantInit; stdcall;//0040F7EC
    function VariantClear:HRESULT; stdcall;//0040F7F4
    function VariantCopy(const Source:TVarData):HRESULT; stdcall;//0040F7FC
    function VariantChangeType(const Source:TVarData; wFlags:Word; VarType:Word):HRESULT; stdcall;//0040F804
    //procedure sub_0040F80C(?:?; ?:?; ?:?; ?:?; ?:?);//0040F80C
    //function sub_0040F83C:?;//0040F83C
    //function sub_0040F848:?;//0040F848
    //function sub_0040F854:?;//0040F854
    function SafeArrayCreate(DimCount:Integer; const Bounds:TVarArrayBoundArray):PVarArray; stdcall;//0040FC50
    function SafeArrayGetLBound(nDim:Integer; var lLbound:Longint):HRESULT; stdcall;//0040FC58
    function SafeArrayGetUBound(Dim:Integer; var UBound:Integer):HRESULT; stdcall;//0040FC60
    function SafeArrayPtrOfIndex(var rgIndices:void ; var pvData:Pointer):HRESULT; stdcall;//0040FC68
    //function sub_0040FC70(?:?; ?:?; ?:?):?;//0040FC70
    procedure sub_0040FC9C;//0040FC9C

implementation

//0040F7EC
procedure oleaut32.VariantInit; stdcall;
begin
{*
 0040F7EC    jmp         dword ptr ds:[6087B0]
*}
end;

//0040F7F4
function oleaut32.VariantClear:HRESULT; stdcall;
begin
{*
 0040F7F4    jmp         dword ptr ds:[6087AC]
*}
end;

//0040F7FC
function oleaut32.VariantCopy(const Source:TVarData):HRESULT; stdcall;
begin
{*
 0040F7FC    jmp         dword ptr ds:[6087A8]
*}
end;

//0040F804
function oleaut32.VariantChangeType(const Source:TVarData; wFlags:Word; VarType:Word):HRESULT; stdcall;
begin
{*
 0040F804    jmp         dword ptr ds:[6087A4]
*}
end;

//0040F80C
{*procedure sub_0040F80C(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0040F80C    push        ebp
 0040F80D    mov         ebp,esp
 0040F80F    cmp         dword ptr [ebp+10],400
>0040F816    je          0040F81F
 0040F818    mov         eax,80004001
>0040F81D    jmp         0040F836
 0040F81F    mov         ax,word ptr [ebp+18]
 0040F823    push        eax
 0040F824    mov         ax,word ptr [ebp+14]
 0040F828    push        eax
 0040F829    mov         eax,dword ptr [ebp+0C]
 0040F82C    push        eax
 0040F82D    mov         eax,dword ptr [ebp+8]
 0040F830    push        eax
 0040F831    call        oleaut32.VariantChangeType
 0040F836    pop         ebp
 0040F837    ret         14
end;*}

//0040F83C
{*function sub_0040F83C:?;
begin
 0040F83C    push        ebp
 0040F83D    mov         ebp,esp
 0040F83F    mov         eax,80004001
 0040F844    pop         ebp
 0040F845    ret         8
end;*}

//0040F848
{*function sub_0040F848:?;
begin
 0040F848    push        ebp
 0040F849    mov         ebp,esp
 0040F84B    mov         eax,80004001
 0040F850    pop         ebp
 0040F851    ret         0C
end;*}

//0040F854
{*function sub_0040F854:?;
begin
 0040F854    push        ebp
 0040F855    mov         ebp,esp
 0040F857    mov         eax,80004001
 0040F85C    pop         ebp
 0040F85D    ret         10
end;*}

//0040FC50
function oleaut32.SafeArrayCreate(DimCount:Integer; const Bounds:TVarArrayBoundArray):PVarArray; stdcall;
begin
{*
 0040FC50    jmp         dword ptr ds:[6087A0]
*}
end;

//0040FC58
function oleaut32.SafeArrayGetLBound(nDim:Integer; var lLbound:Longint):HRESULT; stdcall;
begin
{*
 0040FC58    jmp         dword ptr ds:[60879C]
*}
end;

//0040FC60
function oleaut32.SafeArrayGetUBound(Dim:Integer; var UBound:Integer):HRESULT; stdcall;
begin
{*
 0040FC60    jmp         dword ptr ds:[608798]
*}
end;

//0040FC68
function oleaut32.SafeArrayPtrOfIndex(var rgIndices:void ; var pvData:Pointer):HRESULT; stdcall;
begin
{*
 0040FC68    jmp         dword ptr ds:[608794]
*}
end;

//0040FC70
{*function sub_0040FC70(?:?; ?:?; ?:?):?;
begin
 0040FC70    push        ebp
 0040FC71    mov         ebp,esp
 0040FC73    push        ebx
 0040FC74    mov         ebx,edx
 0040FC76    mov         edx,ebx
 0040FC78    mov         ecx,dword ptr [ebp+8]
 0040FC7B    cmp         dword ptr [ecx-4],0
>0040FC7F    je          0040FC96
 0040FC81    push        eax
 0040FC82    mov         eax,dword ptr [ebp+8]
 0040FC85    mov         eax,dword ptr [eax-4]
 0040FC88    push        eax
 0040FC89    call        KERNEL32.GetProcAddress
 0040FC8E    mov         edx,eax
 0040FC90    test        edx,edx
>0040FC92    jne         0040FC96
 0040FC94    mov         edx,ebx
 0040FC96    mov         eax,edx
 0040FC98    pop         ebx
 0040FC99    pop         ebp
 0040FC9A    ret
end;*}

//0040FC9C
procedure sub_0040FC9C;
begin
{*
 0040FC9C    push        ebp
 0040FC9D    mov         ebp,esp
 0040FC9F    push        ecx
 0040FCA0    push        40FE94;'oleaut32.dll'
 0040FCA5    call        KERNEL32.GetModuleHandleA
 0040FCAA    mov         dword ptr [ebp-4],eax
 0040FCAD    push        ebp
 0040FCAE    mov         edx,40F80C;sub_0040F80C
 0040FCB3    mov         eax,40FEA4
 0040FCB8    call        0040FC70
 0040FCBD    pop         ecx
 0040FCBE    mov         [005E0870],eax;gvar_005E0870
 0040FCC3    push        ebp
 0040FCC4    mov         edx,40F83C;sub_0040F83C
 0040FCC9    mov         eax,40FEB8
 0040FCCE    call        0040FC70
 0040FCD3    pop         ecx
 0040FCD4    mov         [005E0874],eax;gvar_005E0874
 0040FCD9    push        ebp
 0040FCDA    mov         edx,40F83C;sub_0040F83C
 0040FCDF    mov         eax,40FEC0
 0040FCE4    call        0040FC70
 0040FCE9    pop         ecx
 0040FCEA    mov         [005E0878],eax;gvar_005E0878
 0040FCEF    push        ebp
 0040FCF0    mov         edx,40F848;sub_0040F848
 0040FCF5    mov         eax,40FEC8
 0040FCFA    call        0040FC70
 0040FCFF    pop         ecx
 0040FD00    mov         [005E087C],eax;gvar_005E087C
 0040FD05    push        ebp
 0040FD06    mov         edx,40F848;sub_0040F848
 0040FD0B    mov         eax,40FED0
 0040FD10    call        0040FC70
 0040FD15    pop         ecx
 0040FD16    mov         [005E0880],eax;gvar_005E0880
 0040FD1B    push        ebp
 0040FD1C    mov         edx,40F848;sub_0040F848
 0040FD21    mov         eax,40FED8
 0040FD26    call        0040FC70
 0040FD2B    pop         ecx
 0040FD2C    mov         [005E0884],eax;gvar_005E0884
 0040FD31    push        ebp
 0040FD32    mov         edx,40F848;sub_0040F848
 0040FD37    mov         eax,40FEE0
 0040FD3C    call        0040FC70
 0040FD41    pop         ecx
 0040FD42    mov         [005E0888],eax;gvar_005E0888
 0040FD47    push        ebp
 0040FD48    mov         edx,40F848;sub_0040F848
 0040FD4D    mov         eax,40FEE8
 0040FD52    call        0040FC70
 0040FD57    pop         ecx
 0040FD58    mov         [005E088C],eax;gvar_005E088C
 0040FD5D    push        ebp
 0040FD5E    mov         edx,40F848;sub_0040F848
 0040FD63    mov         eax,40FEF0
 0040FD68    call        0040FC70
 0040FD6D    pop         ecx
 0040FD6E    mov         [005E0890],eax;gvar_005E0890
 0040FD73    push        ebp
 0040FD74    mov         edx,40F848;sub_0040F848
 0040FD79    mov         eax,40FEF8
 0040FD7E    call        0040FC70
 0040FD83    pop         ecx
 0040FD84    mov         [005E0894],eax;gvar_005E0894
 0040FD89    push        ebp
 0040FD8A    mov         edx,40F848;sub_0040F848
 0040FD8F    mov         eax,40FF00
 0040FD94    call        0040FC70
 0040FD99    pop         ecx
 0040FD9A    mov         [005E0898],eax;gvar_005E0898
 0040FD9F    push        ebp
 0040FDA0    mov         edx,40F848;sub_0040F848
 0040FDA5    mov         eax,40FF08
 0040FDAA    call        0040FC70
 0040FDAF    pop         ecx
 0040FDB0    mov         [005E089C],eax;gvar_005E089C
 0040FDB5    push        ebp
 0040FDB6    mov         edx,40F854;sub_0040F854
 0040FDBB    mov         eax,40FF10
 0040FDC0    call        0040FC70
 0040FDC5    pop         ecx
 0040FDC6    mov         [005E08A0],eax;gvar_005E08A0
 0040FDCB    push        ebp
 0040FDCC    mov         edx,40F860
 0040FDD1    mov         eax,40FF18
 0040FDD6    call        0040FC70
 0040FDDB    pop         ecx
 0040FDDC    mov         [005E08A4],eax;gvar_005E08A4
 0040FDE1    push        ebp
 0040FDE2    mov         edx,40F8CC
 0040FDE7    mov         eax,40FF28
 0040FDEC    call        0040FC70
 0040FDF1    pop         ecx
 0040FDF2    mov         [005E08A8],eax;gvar_005E08A8
 0040FDF7    push        ebp
 0040FDF8    mov         edx,40F938
 0040FDFD    mov         eax,40FF38
 0040FE02    call        0040FC70
 0040FE07    pop         ecx
 0040FE08    mov         [005E08AC],eax;gvar_005E08AC
 0040FE0D    push        ebp
 0040FE0E    mov         edx,40F9A4
 0040FE13    mov         eax,40FF48
 0040FE18    call        0040FC70
 0040FE1D    pop         ecx
 0040FE1E    mov         [005E08B0],eax;gvar_005E08B0
 0040FE23    push        ebp
 0040FE24    mov         edx,40FA10
 0040FE29    mov         eax,40FF58
 0040FE2E    call        0040FC70
 0040FE33    pop         ecx
 0040FE34    mov         [005E08B4],eax;gvar_005E08B4
 0040FE39    push        ebp
 0040FE3A    mov         edx,40FA7C
 0040FE3F    mov         eax,40FF68
 0040FE44    call        0040FC70
 0040FE49    pop         ecx
 0040FE4A    mov         [005E08B8],eax;gvar_005E08B8
 0040FE4F    push        ebp
 0040FE50    mov         edx,40FAFC
 0040FE55    mov         eax,40FF78
 0040FE5A    call        0040FC70
 0040FE5F    pop         ecx
 0040FE60    mov         [005E08BC],eax;gvar_005E08BC
 0040FE65    push        ebp
 0040FE66    mov         edx,40FB6C
 0040FE6B    mov         eax,40FF88
 0040FE70    call        0040FC70
 0040FE75    pop         ecx
 0040FE76    mov         [005E08C0],eax;gvar_005E08C0
 0040FE7B    push        ebp
 0040FE7C    mov         edx,40FBDC
 0040FE81    mov         eax,40FF98
 0040FE86    call        0040FC70
 0040FE8B    pop         ecx
 0040FE8C    mov         [005E08C4],eax;gvar_005E08C4
 0040FE91    pop         ecx
 0040FE92    pop         ebp
 0040FE93    ret
*}
end;

Initialization
//0040FFD8
{*
 0040FFD8    sub         dword ptr ds:[5E08C8],1
>0040FFDF    jae         0040FFE6
 0040FFE1    call        0040FC9C
 0040FFE6    ret
*}
Finalization
end.