//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit5;

interface

uses
  SysUtils, Classes;

    procedure sub_00407734;//00407734
    procedure sub_0040778C;//0040778C
    //procedure sub_00407798(?:?);//00407798
    procedure sub_004077A0;//004077A0
    //function sub_004077A4(?:?; ?:?; ?:?):?;//004077A4
    //procedure sub_004077AC(?:?);//004077AC
    //function sub_004077E8(?:?):?;//004077E8
    //function sub_004077F0(?:Pointer):?;//004077F0
    //procedure sub_00407820(?:Pointer; ?:?; ?:?);//00407820
    //function sub_00407848(?:?):?;//00407848
    //function sub_00407894(?:?; ?:?; ?:?):?;//00407894
    //procedure sub_004078FC(?:?);//004078FC
    //procedure sub_00407948(?:?);//00407948
    //function sub_00407990:?;//00407990
    //procedure sub_00407AB4(?:?);//00407AB4
    //function sub_00407B68:?;//00407B68
    procedure sub_00407B78;//00407B78
    //function sub_00407B88(?:?):?;//00407B88
    //function sub_00407BA0(?:?; ?:?; ?:?):?;//00407BA0
    //function sub_00407BDC(?:?):?;//00407BDC
    //procedure sub_00407C6C(?:?);//00407C6C
    //function sub_00407CFC(?:?; ?:?):?;//00407CFC
    //procedure sub_00407FB4(?:?; ?:?);//00407FB4
    //procedure sub_00407FD8(?:?; ?:?);//00407FD8
    //function sub_00408004(?:?):?;//00408004
    //procedure sub_00408048(?:?);//00408048
    //procedure sub_00408078(?:?);//00408078
    //function sub_00408098(?:?):?;//00408098
    //function sub_004080C4(?:?):?;//004080C4
    //function sub_00408140(?:?):?;//00408140
    //procedure sub_00408164(?:?; ?:?);//00408164
    //function sub_004081A8(?:?; ?:?):?;//004081A8
    //procedure sub_004081C0(?:?);//004081C0
    //function sub_0040822C(?:?; ?:?; ?:?):?;//0040822C
    //function sub_0040829C(?:?; ?:?; ?:?):?;//0040829C
    //function sub_004082F8(?:?; ?:?):?;//004082F8
    procedure sub_00408380;//00408380
    procedure sub_00408414;//00408414
    procedure sub_00408554;//00408554
    procedure sub_0040859C;//0040859C
    procedure sub_004085DC;//004085DC
    procedure sub_0040863C;//0040863C

implementation

//00407734
procedure sub_00407734;
begin
{*
 00407734    push        ebx
 00407735    push        40776C;'Kernel32.dll'
 0040773A    call        KERNEL32.LoadLibraryA
 0040773F    mov         ebx,eax
 00407741    push        40777C;'SwitchToThread'
 00407746    push        ebx
 00407747    call        KERNEL32.GetProcAddress
 0040774C    mov         [005E0720],eax;gvar_005E0720:Pointer
 00407751    push        ebx
 00407752    call        KERNEL32.FreeLibrary
 00407757    cmp         dword ptr ds:[5E0720],0;gvar_005E0720:Pointer
>0040775E    jne         0040776A
 00407760    mov         eax,40772C
 00407765    mov         [005E0720],eax;gvar_005E0720:Pointer
 0040776A    pop         ebx
 0040776B    ret
*}
end;

//0040778C
procedure sub_0040778C;
begin
{*
 0040778C    mov         eax,0CC
 00407791    call        @RunError
 00407796    ret
*}
end;

//00407798
{*procedure sub_00407798(?:?);
begin
 00407798    xor         edx,edx
 0040779A    mov         dword ptr [eax],edx
 0040779C    ret
end;*}

//004077A0
procedure sub_004077A0;
begin
{*
 004077A0    ret
*}
end;

//004077A4
{*function sub_004077A4(?:?; ?:?; ?:?):?;
begin
 004077A4    lock cmpxchgbyte ptr [ecx],dl
 004077A8    ret
end;*}

//004077AC
{*procedure sub_004077AC(?:?);
begin
 004077AC    push        ebx
 004077AD    mov         ebx,eax
 004077AF    mov         eax,[005AE268];^gvar_005AF049
 004077B4    cmp         byte ptr [eax],0
>004077B7    je          004077E6
>004077B9    jmp         004077D7
 004077BB    call        dword ptr ds:[5E0720]
 004077C1    mov         ecx,ebx
 004077C3    mov         dl,1
 004077C5    xor         eax,eax
 004077C7    call        004077A4
 004077CC    test        al,al
>004077CE    je          004077E6
 004077D0    push        0A
 004077D2    call        KERNEL32.Sleep
 004077D7    mov         ecx,ebx
 004077D9    mov         dl,1
 004077DB    xor         eax,eax
 004077DD    call        004077A4
 004077E2    test        al,al
>004077E4    jne         004077BB
 004077E6    pop         ebx
 004077E7    ret
end;*}

//004077E8
{*function sub_004077E8(?:?):?;
begin
 004077E8    xor         edx,edx
 004077EA    mov         dword ptr [eax],edx
 004077EC    ret
end;*}

//004077F0
{*function sub_004077F0(?:Pointer):?;
begin
 004077F0    imul        eax,dword ptr ds:[5E0724],0F25;gvar_005E0724
 004077FA    add         eax,7385
 004077FF    mov         ecx,222C0
 00407804    xor         edx,edx
 00407806    div         eax,ecx
 00407808    mov         dword ptr ds:[5E0724],edx;gvar_005E0724
 0040780E    mov         eax,[005E0724];gvar_005E0724
 00407813    shr         eax,8
 00407816    xor         eax,dword ptr ds:[5E0724];gvar_005E0724
 0040781C    ret
end;*}

//00407820
{*procedure sub_00407820(?:Pointer; ?:?; ?:?);
begin
 00407820    push        ebx
 00407821    push        esi
 00407822    mov         ebx,eax
 00407824    mov         esi,ebx
 00407826    shr         esi,10
 00407829    add         edx,ebx
 0040782B    dec         edx
 0040782C    shr         edx,10
 0040782F    sub         edx,esi
>00407831    jb          00407845
 00407833    inc         edx
 00407834    mov         eax,esi
 00407836    lea         eax,[eax*4+5AF6A0];gvar_005AF6A0
 0040783D    mov         dword ptr [eax],ecx
 0040783F    add         eax,4
 00407842    dec         edx
>00407843    jne         0040783D
 00407845    pop         esi
 00407846    pop         ebx
 00407847    ret
end;*}

//00407848
{*function sub_00407848(?:?):?;
begin
 00407848    push        ebx
 00407849    add         esp,0FFFFFDFC
 0040784F    mov         ebx,eax
 00407851    push        esp
 00407852    push        0
 00407854    push        407890;'RMM'
 00407859    push        5E051C;gvar_005E051C:PAnsiChar
 0040785E    call        KERNEL32.GetTempFileNameA
 00407863    push        0
 00407865    push        4000100
 0040786A    push        2
 0040786C    push        0
 0040786E    push        0
 00407870    push        0C0000000
 00407875    lea         eax,[esp+18]
 00407879    push        eax
 0040787A    call        KERNEL32.CreateFileA
 0040787F    mov         dword ptr [ebx],eax
 00407881    cmp         dword ptr [ebx],0FFFFFFFF
 00407884    setne       al
 00407887    add         esp,204
 0040788D    pop         ebx
 0040788E    ret
end;*}

//00407894
{*function sub_00407894(?:?; ?:?; ?:?):?;
begin
 00407894    push        ebx
 00407895    push        esi
 00407896    push        edi
 00407897    push        ebp
 00407898    mov         esi,ecx
 0040789A    mov         ebp,edx
 0040789C    mov         ebx,eax
 0040789E    xor         edi,edi
 004078A0    push        0
 004078A2    push        0
 004078A4    push        ebp
 004078A5    push        ebx
 004078A6    call        KERNEL32.SetFilePointer
 004078AB    push        ebx
 004078AC    call        KERNEL32.SetEndOfFile
 004078B1    test        eax,eax
>004078B3    je          004078F5
 004078B5    push        0
 004078B7    push        0
 004078B9    push        0
 004078BB    push        4
 004078BD    push        0
 004078BF    push        ebx
 004078C0    call        KERNEL32.CreateFileMappingA
 004078C5    mov         dword ptr [esi],eax
 004078C7    cmp         dword ptr [esi],0
>004078CA    je          004078F5
 004078CC    cmp         dword ptr [esi],0B7
>004078D2    je          004078F5
 004078D4    push        ebp
 004078D5    push        0
 004078D7    push        0
 004078D9    push        2
 004078DB    mov         eax,dword ptr [esi]
 004078DD    push        eax
 004078DE    call        KERNEL32.MapViewOfFile
 004078E3    mov         edi,eax
 004078E5    test        edi,edi
>004078E7    jne         004078F5
 004078E9    mov         eax,dword ptr [esi]
 004078EB    push        eax
 004078EC    call        KERNEL32.CloseHandle
 004078F1    xor         eax,eax
 004078F3    mov         dword ptr [esi],eax
 004078F5    mov         eax,edi
 004078F7    pop         ebp
 004078F8    pop         edi
 004078F9    pop         esi
 004078FA    pop         ebx
 004078FB    ret
end;*}

//004078FC
{*procedure sub_004078FC(?:?);
begin
 004078FC    cmp         dword ptr [eax+0C],0
>00407900    je          00407925
 00407902    mov         edx,dword ptr [eax]
 00407904    test        edx,edx
>00407906    jne         00407913
 00407908    mov         edx,dword ptr [eax+4]
 0040790B    mov         dword ptr ds:[5DF6CC],edx;gvar_005DF6CC
>00407911    jmp         00407919
 00407913    mov         ecx,dword ptr [eax+4]
 00407916    mov         dword ptr [edx+4],ecx
 00407919    mov         edx,dword ptr [eax+4]
 0040791C    test        edx,edx
>0040791E    je          00407947
 00407920    mov         eax,dword ptr [eax]
 00407922    mov         dword ptr [edx],eax
 00407924    ret
 00407925    mov         edx,dword ptr [eax]
 00407927    test        edx,edx
>00407929    jne         00407936
 0040792B    mov         edx,dword ptr [eax+4]
 0040792E    mov         dword ptr ds:[5DF6C8],edx;gvar_005DF6C8
>00407934    jmp         0040793C
 00407936    mov         ecx,dword ptr [eax+4]
 00407939    mov         dword ptr [edx+4],ecx
 0040793C    mov         edx,dword ptr [eax+4]
 0040793F    test        edx,edx
>00407941    je          00407947
 00407943    mov         eax,dword ptr [eax]
 00407945    mov         dword ptr [edx],eax
 00407947    ret
end;*}

//00407948
{*procedure sub_00407948(?:?);
begin
 00407948    push        ebx
 00407949    mov         ebx,eax
 0040794B    cmp         dword ptr [ebx+0C],0
>0040794F    je          0040795B
 00407951    mov         eax,67
 00407956    call        @RunError
 0040795B    cmp         dword ptr [ebx+8],0F
>0040795F    je          0040796B
 00407961    mov         eax,68
 00407966    call        @RunError
 0040796B    and         ebx,0FFFF0000
 00407971    xor         ecx,ecx
 00407973    mov         edx,100000
 00407978    mov         eax,ebx
 0040797A    call        00407820
 0040797F    push        8000
 00407984    push        0
 00407986    push        ebx
 00407987    call        KERNEL32.VirtualFree
 0040798C    pop         ebx
 0040798D    ret
end;*}

//00407990
{*function sub_00407990:?;
begin
 00407990    push        ebx
 00407991    push        esi
 00407992    mov         eax,5DF6C4;gvar_005DF6C4
 00407997    call        004077AC
 0040799C    mov         ebx,dword ptr ds:[5DF6C8];gvar_005DF6C8
 004079A2    test        ebx,ebx
>004079A4    jne         00407A49
 004079AA    push        4
 004079AC    push        1000
 004079B1    push        100000
 004079B6    push        0
 004079B8    call        KERNEL32.VirtualAlloc
 004079BD    mov         ebx,eax
 004079BF    test        ebx,ebx
>004079C1    jne         004079CA
 004079C3    xor         esi,esi
>004079C5    jmp         00407AAF
 004079CA    call        004077F0
 004079CF    and         eax,0FF
 004079D4    mov         esi,eax
 004079D6    shl         esi,4
>004079D9    jmp         004079DE
 004079DB    sub         esi,10
 004079DE    lea         eax,[esi+3D4]
 004079E4    cmp         eax,1000
>004079E9    ja          004079DB
 004079EB    mov         ecx,ebx
 004079ED    add         ecx,esi
 004079EF    mov         edx,100000
 004079F4    mov         eax,ebx
 004079F6    call        00407820
 004079FB    add         ebx,esi
 004079FD    mov         dword ptr [ebx+8],0F
 00407A04    mov         eax,ebx
 00407A06    add         eax,3D4
 00407A0B    add         eax,0F
 00407A0E    and         eax,0FFFFFFF0
 00407A11    mov         dword ptr [ebx+10],eax
 00407A14    xor         eax,eax
 00407A16    mov         edx,eax
 00407A18    shl         edx,3
 00407A1B    xor         ecx,ecx
 00407A1D    mov         dword ptr [ebx+edx*8+30],ecx
 00407A21    inc         eax
 00407A22    cmp         eax,0F
>00407A25    jne         00407A16
 00407A27    xor         eax,eax
 00407A29    mov         dword ptr [ebx],eax
 00407A2B    mov         eax,[005DF6C8];gvar_005DF6C8
 00407A30    mov         dword ptr [ebx+4],eax
 00407A33    cmp         dword ptr ds:[5DF6C8],0;gvar_005DF6C8
>00407A3A    je          00407A43
 00407A3C    mov         eax,[005DF6C8];gvar_005DF6C8
 00407A41    mov         dword ptr [eax],ebx
 00407A43    mov         dword ptr ds:[5DF6C8],ebx;gvar_005DF6C8
 00407A49    xor         eax,eax
>00407A4B    jmp         00407A4E
 00407A4D    inc         eax
 00407A4E    mov         edx,eax
 00407A50    shl         edx,3
 00407A53    cmp         dword ptr [ebx+edx*8+30],0
>00407A58    jne         00407A4D
 00407A5A    mov         edx,eax
 00407A5C    shl         edx,3
 00407A5F    lea         esi,[ebx+edx*8+14]
 00407A63    shl         eax,10
 00407A66    add         eax,dword ptr [ebx+10]
 00407A69    mov         dword ptr [esi+1C],eax
 00407A6C    dec         dword ptr [ebx+8]
 00407A6F    cmp         dword ptr [ebx+8],0
>00407A73    jne         00407AA5
 00407A75    mov         eax,ebx
 00407A77    call        004078FC
 00407A7C    mov         dword ptr [ebx+0C],0FFFFFFFF
 00407A83    mov         eax,[005DF6CC];gvar_005DF6CC
 00407A88    mov         dword ptr [ebx+4],eax
 00407A8B    cmp         dword ptr ds:[5DF6CC],0;gvar_005DF6CC
>00407A92    je          00407A9B
 00407A94    mov         eax,[005DF6CC];gvar_005DF6CC
 00407A99    mov         dword ptr [eax],ebx
 00407A9B    mov         dword ptr ds:[5DF6CC],ebx;gvar_005DF6CC
 00407AA1    xor         eax,eax
 00407AA3    mov         dword ptr [ebx],eax
 00407AA5    mov         eax,5DF6C4;gvar_005DF6C4
 00407AAA    call        004077E8
 00407AAF    mov         eax,esi
 00407AB1    pop         esi
 00407AB2    pop         ebx
 00407AB3    ret
end;*}

//00407AB4
{*procedure sub_00407AB4(?:?);
begin
 00407AB4    push        ebx
 00407AB5    push        esi
 00407AB6    push        edi
 00407AB7    push        ebp
 00407AB8    mov         esi,eax
 00407ABA    mov         eax,5DF6C4;gvar_005DF6C4
 00407ABF    call        004077AC
 00407AC4    mov         ebp,esi
 00407AC6    mov         eax,ebp
 00407AC8    shr         eax,10
 00407ACB    mov         ebx,dword ptr [eax*4+5AF6A0];gvar_005AF6A0
 00407AD2    mov         edi,ebx
 00407AD4    test        edi,1
>00407ADA    je          00407AE1
 00407ADC    call        0040778C
 00407AE1    and         edi,0FFFFFFF0
 00407AE4    mov         ebx,edi
 00407AE6    mov         eax,ebp
 00407AE8    sub         eax,dword ptr [ebx+10]
 00407AEB    shr         eax,10
 00407AEE    shl         eax,3
 00407AF1    xor         edx,edx
 00407AF3    mov         dword ptr [ebx+eax*8+30],edx
 00407AF7    inc         dword ptr [ebx+8]
 00407AFA    cmp         dword ptr [ebx+0C],0
>00407AFE    je          00407B2E
 00407B00    mov         eax,ebx
 00407B02    call        004078FC
 00407B07    xor         eax,eax
 00407B09    mov         dword ptr [ebx+0C],eax
 00407B0C    mov         eax,[005DF6C8];gvar_005DF6C8
 00407B11    mov         dword ptr [ebx+4],eax
 00407B14    cmp         dword ptr ds:[5DF6C8],0;gvar_005DF6C8
>00407B1B    je          00407B24
 00407B1D    mov         eax,[005DF6C8];gvar_005DF6C8
 00407B22    mov         dword ptr [eax],ebx
 00407B24    mov         dword ptr ds:[5DF6C8],ebx;gvar_005DF6C8
 00407B2A    xor         eax,eax
 00407B2C    mov         dword ptr [ebx],eax
 00407B2E    cmp         dword ptr [ebx+8],0F
>00407B32    jne         00407B57
 00407B34    inc         dword ptr ds:[5DF6D0];gvar_005DF6D0
 00407B3A    cmp         dword ptr ds:[5DF6D0],8;gvar_005DF6D0
>00407B41    jle         00407B57
 00407B43    cmp         dword ptr ds:[5AF694],0;gvar_005AF694
>00407B4A    je          00407B57
 00407B4C    mov         eax,[005AF69C];gvar_005AF69C:THandle
 00407B51    push        eax
 00407B52    call        KERNEL32.SetEvent
 00407B57    mov         eax,5DF6C4;gvar_005DF6C4
 00407B5C    call        004077E8
 00407B61    pop         ebp
 00407B62    pop         edi
 00407B63    pop         esi
 00407B64    pop         ebx
 00407B65    ret
end;*}

//00407B68
{*function sub_00407B68:?;
begin
 00407B68    push        4
 00407B6A    push        101000
 00407B6F    push        eax
 00407B70    push        0
 00407B72    call        KERNEL32.VirtualAlloc
 00407B77    ret
end;*}

//00407B78
procedure sub_00407B78;
begin
{*
 00407B78    push        8000
 00407B7D    push        0
 00407B7F    push        eax
 00407B80    call        KERNEL32.VirtualFree
 00407B85    ret
*}
end;

//00407B88
{*function sub_00407B88(?:?):?;
begin
 00407B88    mov         edx,20
 00407B8D    lea         edx,[edx+eax+0FFFF]
 00407B94    and         edx,0FFFF0000
 00407B9A    mov         eax,edx
 00407B9C    ret
end;*}

//00407BA0
{*function sub_00407BA0(?:?; ?:?; ?:?):?;
begin
 00407BA0    push        ebx
 00407BA1    push        esi
 00407BA2    push        edi
 00407BA3    mov         edi,eax
 00407BA5    mov         esi,20
 00407BAA    sub         edx,esi
 00407BAC    sub         edx,ecx
 00407BAE    cmp         edx,2000
>00407BB4    jbe         00407BBB
 00407BB6    mov         edx,2000
 00407BBB    xor         eax,eax
 00407BBD    mov         ebx,eax
 00407BBF    add         eax,eax
 00407BC1    add         eax,10
 00407BC4    cmp         edx,eax
>00407BC6    jae         00407BBD
 00407BC8    call        004077F0
 00407BCD    and         ebx,eax
 00407BCF    mov         eax,edi
 00407BD1    add         eax,esi
 00407BD3    add         eax,ebx
 00407BD5    pop         edi
 00407BD6    pop         esi
 00407BD7    pop         ebx
 00407BD8    ret
end;*}

//00407BDC
{*function sub_00407BDC(?:?):?;
begin
 00407BDC    push        ebx
 00407BDD    push        esi
 00407BDE    push        edi
 00407BDF    mov         edi,eax
 00407BE1    mov         eax,edi
 00407BE3    call        00407B88
 00407BE8    mov         esi,eax
 00407BEA    mov         eax,esi
 00407BEC    call        00407B68
 00407BF1    mov         ebx,eax
 00407BF3    test        ebx,ebx
>00407BF5    jne         00407BFB
 00407BF7    xor         eax,eax
>00407BF9    jmp         00407C66
 00407BFB    xor         eax,eax
 00407BFD    mov         dword ptr [ebx+18],eax
 00407C00    mov         dword ptr [ebx+8],edi
 00407C03    mov         dword ptr [ebx],esi
 00407C05    mov         ecx,edi
 00407C07    mov         edx,esi
 00407C09    mov         eax,ebx
 00407C0B    call        00407BA0
 00407C10    mov         dword ptr [ebx+4],eax
 00407C13    mov         eax,dword ptr [ebx+4]
 00407C16    mov         edi,ebx
 00407C18    sub         eax,edi
 00407C1A    sub         esi,eax
 00407C1C    mov         dword ptr [ebx+0C],esi
 00407C1F    mov         eax,5E0518;gvar_005E0518
 00407C24    call        004077AC
 00407C29    cmp         dword ptr ds:[5E0514],0;gvar_005E0514
>00407C30    je          00407C3A
 00407C32    mov         eax,[005E0514];gvar_005E0514
 00407C37    mov         dword ptr [eax+14],ebx
 00407C3A    mov         eax,[005E0514];gvar_005E0514
 00407C3F    mov         dword ptr [ebx+10],eax
 00407C42    xor         eax,eax
 00407C44    mov         dword ptr [ebx+14],eax
 00407C47    mov         dword ptr ds:[5E0514],ebx;gvar_005E0514
 00407C4D    mov         eax,5E0518;gvar_005E0518
 00407C52    call        004077E8
 00407C57    mov         ecx,edi
 00407C59    inc         ecx
 00407C5A    mov         edx,dword ptr [ebx]
 00407C5C    mov         eax,ebx
 00407C5E    call        00407820
 00407C63    mov         eax,dword ptr [ebx+4]
 00407C66    pop         edi
 00407C67    pop         esi
 00407C68    pop         ebx
 00407C69    ret
end;*}

//00407C6C
{*procedure sub_00407C6C(?:?);
begin
 00407C6C    push        ebx
 00407C6D    push        esi
 00407C6E    push        edi
 00407C6F    add         esp,0FFFFFFE0
 00407C72    mov         ebx,eax
 00407C74    xor         ecx,ecx
 00407C76    mov         edx,dword ptr [ebx]
 00407C78    mov         eax,ebx
 00407C7A    call        00407820
 00407C7F    mov         esi,ebx
 00407C81    mov         edi,esp
 00407C83    mov         ecx,8
 00407C88    rep movs    dword ptr [edi],dword ptr [esi]
 00407C8A    mov         eax,5E0518;gvar_005E0518
 00407C8F    call        004077AC
 00407C94    mov         eax,dword ptr [esp+14]
 00407C98    test        eax,eax
>00407C9A    jne         00407CA7
 00407C9C    mov         eax,dword ptr [esp+10]
 00407CA0    mov         [005E0514],eax;gvar_005E0514
>00407CA5    jmp         00407CAE
 00407CA7    mov         edx,dword ptr [esp+10]
 00407CAB    mov         dword ptr [eax+10],edx
 00407CAE    mov         eax,dword ptr [esp+10]
 00407CB2    test        eax,eax
>00407CB4    je          00407CBD
 00407CB6    mov         edx,dword ptr [esp+14]
 00407CBA    mov         dword ptr [eax+14],edx
 00407CBD    mov         eax,5E0518;gvar_005E0518
 00407CC2    call        004077E8
 00407CC7    cmp         dword ptr [ebx+18],0
>00407CCB    je          00407CE9
 00407CCD    push        ebx
 00407CCE    call        KERNEL32.UnmapViewOfFile
 00407CD3    mov         eax,dword ptr [esp+1C]
 00407CD7    push        eax
 00407CD8    call        KERNEL32.CloseHandle
 00407CDD    mov         eax,dword ptr [esp+18]
 00407CE1    push        eax
 00407CE2    call        KERNEL32.CloseHandle
>00407CE7    jmp         00407CF3
 00407CE9    mov         edx,dword ptr [esp]
 00407CEC    mov         eax,ebx
 00407CEE    call        00407B78
 00407CF3    add         esp,20
 00407CF6    pop         edi
 00407CF7    pop         esi
 00407CF8    pop         ebx
 00407CF9    ret
end;*}

//00407CFC
{*function sub_00407CFC(?:?; ?:?):?;
begin
 00407CFC    push        ebx
 00407CFD    push        esi
 00407CFE    push        edi
 00407CFF    push        ebp
 00407D00    add         esp,0FFFFFFE8
 00407D03    mov         edi,edx
 00407D05    mov         esi,eax
 00407D07    cmp         edi,dword ptr [esi+8]
>00407D0A    jbe         00407D3D
 00407D0C    mov         eax,edi
 00407D0E    xor         edx,edx
 00407D10    cmp         edx,0
>00407D13    jne         00407D1E
 00407D15    cmp         eax,3A2E8BA3
>00407D1A    jae         00407D3D
>00407D1C    jmp         00407D20
>00407D1E    jge         00407D3D
 00407D20    mov         dword ptr [esp+10],edi
 00407D24    xor         eax,eax
 00407D26    mov         dword ptr [esp+14],eax
 00407D2A    fild        qword ptr [esp+10]
 00407D2E    fld         tbyte ptr ds:[407EC0];1.1:Extended
 00407D34    fmulp       st(1),st
 00407D36    call        @ROUND
 00407D3B    mov         edi,eax
 00407D3D    mov         eax,edi
 00407D3F    call        00407B88
 00407D44    mov         dword ptr [esp],eax
 00407D47    mov         eax,dword ptr [esi+18]
 00407D4A    mov         dword ptr [esp+4],eax
 00407D4E    mov         eax,dword ptr [esi+1C]
 00407D51    mov         dword ptr [esp+8],eax
 00407D55    xor         ebx,ebx
 00407D57    mov         byte ptr [esp+0C],1
 00407D5C    mov         eax,5E0518;gvar_005E0518
 00407D61    call        004077AC
 00407D66    cmp         dword ptr [esp+4],0
>00407D6B    je          00407DAD
 00407D6D    mov         ebp,dword ptr [esi+4]
 00407D70    sub         ebp,esi
 00407D72    xor         ecx,ecx
 00407D74    mov         edx,dword ptr [esi]
 00407D76    mov         eax,esi
 00407D78    call        00407820
 00407D7D    push        esi
 00407D7E    call        KERNEL32.UnmapViewOfFile
 00407D83    mov         eax,dword ptr [esp+8]
 00407D87    push        eax
 00407D88    call        KERNEL32.CloseHandle
 00407D8D    lea         ecx,[esp+8]
 00407D91    mov         edx,dword ptr [esp]
 00407D94    mov         eax,dword ptr [esp+4]
 00407D98    call        00407894
 00407D9D    mov         ebx,eax
 00407D9F    test        ebx,ebx
>00407DA1    je          00407DAD
 00407DA3    add         ebp,ebx
 00407DA5    mov         dword ptr [ebx+4],ebp
 00407DA8    mov         byte ptr [esp+0C],0
 00407DAD    cmp         dword ptr [esp+4],0
>00407DB2    jne         00407E11
 00407DB4    cmp         edi,100000
>00407DBA    jbe         00407DF7
 00407DBC    lea         eax,[esp+4]
 00407DC0    call        00407848
 00407DC5    test        al,al
>00407DC7    je          00407DF1
 00407DC9    lea         ecx,[esp+8]
 00407DCD    mov         edx,dword ptr [esp]
 00407DD0    mov         eax,dword ptr [esp+4]
 00407DD4    call        00407894
 00407DD9    mov         ebx,eax
 00407DDB    test        ebx,ebx
>00407DDD    jne         00407DF7
 00407DDF    mov         eax,dword ptr [esp+4]
 00407DE3    push        eax
 00407DE4    call        KERNEL32.CloseHandle
 00407DE9    xor         eax,eax
 00407DEB    mov         dword ptr [esp+4],eax
>00407DEF    jmp         00407DF7
 00407DF1    xor         eax,eax
 00407DF3    mov         dword ptr [esp+4],eax
 00407DF7    test        ebx,ebx
>00407DF9    jne         00407E05
 00407DFB    mov         eax,dword ptr [esp]
 00407DFE    call        00407B68
 00407E03    mov         ebx,eax
 00407E05    mov         eax,dword ptr [esi+10]
 00407E08    mov         dword ptr [ebx+10],eax
 00407E0B    mov         eax,dword ptr [esi+14]
 00407E0E    mov         dword ptr [ebx+14],eax
 00407E11    test        ebx,ebx
>00407E13    je          00407E31
 00407E15    mov         eax,dword ptr [ebx+14]
 00407E18    test        eax,eax
>00407E1A    je          00407E21
 00407E1C    mov         dword ptr [eax+10],ebx
>00407E1F    jmp         00407E27
 00407E21    mov         dword ptr ds:[5E0514],ebx;gvar_005E0514
 00407E27    mov         eax,dword ptr [ebx+10]
 00407E2A    test        eax,eax
>00407E2C    je          00407E31
 00407E2E    mov         dword ptr [eax+14],ebx
 00407E31    mov         eax,5E0518;gvar_005E0518
 00407E36    call        004077E8
 00407E3B    test        ebx,ebx
>00407E3D    je          00407EB6
 00407E3F    cmp         byte ptr [esp+0C],0
>00407E44    je          00407E80
 00407E46    mov         ecx,edi
 00407E48    mov         edx,dword ptr [esp]
 00407E4B    mov         eax,ebx
 00407E4D    call        00407BA0
 00407E52    mov         ebp,eax
 00407E54    mov         dword ptr [ebx+4],ebp
 00407E57    mov         eax,dword ptr [esi+8]
 00407E5A    cmp         edi,eax
>00407E5C    jae         00407E60
 00407E5E    mov         eax,edi
 00407E60    mov         edx,ebp
 00407E62    mov         ecx,dword ptr [esi+4]
 00407E65    xchg        eax,ecx
 00407E66    call        dword ptr ds:[5AF678]
 00407E6C    xor         ecx,ecx
 00407E6E    mov         edx,dword ptr [esi]
 00407E70    mov         eax,esi
 00407E72    call        00407820
 00407E77    mov         edx,dword ptr [esi]
 00407E79    mov         eax,esi
 00407E7B    call        00407B78
 00407E80    mov         eax,dword ptr [esp+4]
 00407E84    mov         dword ptr [ebx+18],eax
 00407E87    mov         eax,dword ptr [esp+8]
 00407E8B    mov         dword ptr [ebx+1C],eax
 00407E8E    mov         eax,dword ptr [esp]
 00407E91    mov         dword ptr [ebx],eax
 00407E93    mov         dword ptr [ebx+8],edi
 00407E96    mov         edx,dword ptr [ebx+4]
 00407E99    mov         eax,ebx
 00407E9B    sub         edx,eax
 00407E9D    mov         ecx,dword ptr [esp]
 00407EA0    sub         ecx,edx
 00407EA2    mov         dword ptr [ebx+0C],ecx
 00407EA5    mov         ecx,eax
 00407EA7    inc         ecx
 00407EA8    mov         edx,dword ptr [esp]
 00407EAB    mov         eax,ebx
 00407EAD    call        00407820
 00407EB2    mov         eax,ebx
>00407EB4    jmp         00407EB8
 00407EB6    xor         eax,eax
 00407EB8    add         esp,18
 00407EBB    pop         ebp
 00407EBC    pop         edi
 00407EBD    pop         esi
 00407EBE    pop         ebx
 00407EBF    ret
end;*}

//00407FB4
{*procedure sub_00407FB4(?:?; ?:?);
begin
 00407FB4    mov         ecx,dword ptr [eax]
 00407FB6    test        ecx,ecx
>00407FB8    jne         00407FC6
 00407FBA    mov         dword ptr [eax],edx
 00407FBC    mov         dword ptr [eax+4],edx
 00407FBF    xor         eax,eax
 00407FC1    mov         dword ptr [edx+0C],eax
>00407FC4    jmp         00407FD0
 00407FC6    mov         dword ptr [edx+0C],ecx
 00407FC9    mov         ecx,dword ptr [eax]
 00407FCB    mov         dword ptr [ecx+10],edx
 00407FCE    mov         dword ptr [eax],edx
 00407FD0    xor         eax,eax
 00407FD2    mov         dword ptr [edx+10],eax
 00407FD5    ret
end;*}

//00407FD8
{*procedure sub_00407FD8(?:?; ?:?);
begin
 00407FD8    push        ebx
 00407FD9    mov         ecx,dword ptr [edx+10]
 00407FDC    test        ecx,ecx
>00407FDE    jne         00407FE7
 00407FE0    mov         ecx,dword ptr [edx+0C]
 00407FE3    mov         dword ptr [eax],ecx
>00407FE5    jmp         00407FED
 00407FE7    mov         ebx,dword ptr [edx+0C]
 00407FEA    mov         dword ptr [ecx+0C],ebx
 00407FED    mov         ecx,dword ptr [edx+0C]
 00407FF0    test        ecx,ecx
>00407FF2    jne         00407FFC
 00407FF4    mov         edx,dword ptr [edx+10]
 00407FF7    mov         dword ptr [eax+4],edx
 00407FFA    pop         ebx
 00407FFB    ret
 00407FFC    mov         eax,dword ptr [edx+10]
 00407FFF    mov         dword ptr [ecx+10],eax
 00408002    pop         ebx
 00408003    ret
end;*}

//00408004
{*function sub_00408004(?:?):?;
begin
 00408004    push        ebx
 00408005    push        esi
 00408006    push        edi
 00408007    mov         esi,eax
 00408009    mov         edi,dword ptr [esi+18]
 0040800C    call        00407990
 00408011    mov         ebx,eax
 00408013    test        ebx,ebx
>00408015    je          00408040
 00408017    mov         dword ptr [ebx+14],edi
 0040801A    mov         dword ptr [ebx+4],edi
 0040801D    mov         dword ptr [ebx],esi
 0040801F    mov         eax,dword ptr [esi+14]
 00408022    mov         dword ptr [ebx+18],eax
 00408025    mov         eax,dword ptr [esi+1C]
 00408028    mov         dword ptr [ebx+20],eax
 0040802B    mov         eax,dword ptr [ebx+1C]
 0040802E    mov         dword ptr [ebx+24],eax
 00408031    xor         eax,eax
 00408033    mov         dword ptr [ebx+8],eax
 00408036    lea         eax,[esi+4]
 00408039    mov         edx,ebx
 0040803B    call        00407FB4
 00408040    mov         eax,ebx
 00408042    pop         edi
 00408043    pop         esi
 00408044    pop         ebx
 00408045    ret
end;*}

//00408048
{*procedure sub_00408048(?:?);
begin
 00408048    push        ebx
 00408049    mov         ebx,eax
 0040804B    cmp         dword ptr [ebx+4],0
>0040804F    jbe         0040805F
 00408051    mov         eax,dword ptr [ebx]
 00408053    add         eax,4
 00408056    mov         edx,ebx
 00408058    call        00407FD8
>0040805D    jmp         0040806B
 0040805F    mov         eax,dword ptr [ebx]
 00408061    add         eax,0C
 00408064    mov         edx,ebx
 00408066    call        00407FD8
 0040806B    mov         eax,dword ptr [ebx+1C]
 0040806E    call        00407AB4
 00408073    pop         ebx
 00408074    ret
end;*}

//00408078
{*procedure sub_00408078(?:?);
begin
 00408078    push        ebx
 00408079    mov         ebx,eax
 0040807B    mov         eax,dword ptr [ebx]
 0040807D    add         eax,4
 00408080    mov         edx,ebx
 00408082    call        00407FD8
 00408087    mov         eax,dword ptr [ebx]
 00408089    add         eax,0C
 0040808C    mov         edx,ebx
 0040808E    call        00407FB4
 00408093    pop         ebx
 00408094    ret
end;*}

//00408098
{*function sub_00408098(?:?):?;
begin
 00408098    push        ebx
 00408099    push        esi
 0040809A    mov         ebx,eax
 0040809C    mov         eax,ebx
 0040809E    call        00408004
 004080A3    test        eax,eax
>004080A5    jne         004080AB
 004080A7    xor         esi,esi
>004080A9    jmp         004080B7
 004080AB    dec         dword ptr [eax+4]
 004080AE    mov         esi,dword ptr [eax+24]
 004080B1    mov         edx,dword ptr [eax+18]
 004080B4    add         dword ptr [eax+24],edx
 004080B7    mov         eax,ebx
 004080B9    call        004077E8
 004080BE    mov         eax,esi
 004080C0    pop         esi
 004080C1    pop         ebx
 004080C2    ret
end;*}

//004080C4
{*function sub_004080C4(?:?):?;
begin
 004080C4    push        ebx
 004080C5    push        esi
 004080C6    cmp         eax,7FF0
>004080CB    jle         004080D6
 004080CD    call        00407BDC
 004080D2    mov         esi,eax
>004080D4    jmp         00408139
 004080D6    dec         eax
 004080D7    shr         eax,4
 004080DA    movzx       eax,byte ptr [eax+5DFD14]
 004080E1    shl         eax,2
 004080E4    lea         esi,[eax*8+5DF6D4];gvar_005DF6D4
 004080EB    mov         eax,esi
 004080ED    call        004077AC
 004080F2    mov         ebx,dword ptr [esi+4]
 004080F5    test        ebx,ebx
>004080F7    jne         00408104
 004080F9    mov         eax,esi
 004080FB    call        00408098
 00408100    mov         esi,eax
>00408102    jmp         00408132
 00408104    cmp         dword ptr [ebx+4],1
>00408108    jne         00408111
 0040810A    mov         eax,ebx
 0040810C    call        00408078
 00408111    dec         dword ptr [ebx+4]
 00408114    mov         esi,dword ptr [ebx+8]
 00408117    test        esi,esi
>00408119    je          00408122
 0040811B    mov         eax,dword ptr [esi]
 0040811D    mov         dword ptr [ebx+8],eax
>00408120    jmp         0040812B
 00408122    mov         esi,dword ptr [ebx+24]
 00408125    mov         eax,dword ptr [ebx+18]
 00408128    add         dword ptr [ebx+24],eax
 0040812B    mov         eax,dword ptr [ebx]
 0040812D    call        004077E8
 00408132    xor         eax,eax
 00408134    mov         dword ptr [esi],eax
 00408136    mov         dword ptr [esi+4],eax
 00408139    mov         eax,esi
 0040813B    pop         esi
 0040813C    pop         ebx
 0040813D    ret
end;*}

//00408140
{*function sub_00408140(?:?):?;
begin
 00408140    push        ebx
 00408141    push        esi
 00408142    mov         esi,eax
 00408144    mov         ebx,dword ptr [esi]
 00408146    lea         eax,[ebx+0C]
 00408149    mov         edx,esi
 0040814B    call        00407FD8
 00408150    lea         eax,[ebx+4]
 00408153    mov         edx,esi
 00408155    call        00407FB4
 0040815A    mov         eax,ebx
 0040815C    call        004077E8
 00408161    pop         esi
 00408162    pop         ebx
 00408163    ret
end;*}

//00408164
{*procedure sub_00408164(?:?; ?:?);
begin
 00408164    push        ebx
 00408165    mov         ecx,edx
 00408167    mov         ebx,dword ptr [eax+8]
 0040816A    mov         dword ptr [ecx],ebx
 0040816C    mov         dword ptr [eax+8],edx
 0040816F    mov         dword ptr [ecx+4],0BAADF00D
 00408176    mov         edx,dword ptr [eax+4]
 00408179    inc         dword ptr [eax+4]
 0040817C    test        edx,edx
>0040817E    jne         00408187
 00408180    call        00408140
 00408185    pop         ebx
 00408186    ret
 00408187    inc         edx
 00408188    cmp         edx,dword ptr [eax+14]
>0040818B    jne         0040819D
 0040818D    mov         ebx,dword ptr [eax]
 0040818F    call        00408048
 00408194    mov         eax,ebx
 00408196    call        004077E8
>0040819B    jmp         004081A4
 0040819D    mov         eax,dword ptr [eax]
 0040819F    call        004077E8
 004081A4    pop         ebx
 004081A5    ret
end;*}

//004081A8
{*function sub_004081A8(?:?; ?:?):?;
begin
 004081A8    sub         edx,dword ptr [eax+10]
 004081AB    shr         edx,10
 004081AE    shl         edx,3
 004081B1    lea         eax,[eax+edx*8+14]
 004081B5    cmp         dword ptr [eax+1C],0
>004081B9    jne         004081BD
 004081BB    xor         eax,eax
 004081BD    ret
end;*}

//004081C0
{*procedure sub_004081C0(?:?);
begin
 004081C0    push        ebx
 004081C1    push        esi
 004081C2    mov         ebx,eax
 004081C4    mov         edx,ebx
 004081C6    mov         eax,edx
 004081C8    shr         eax,10
 004081CB    mov         eax,dword ptr [eax*4+5AF6A0];gvar_005AF6A0
 004081D2    mov         ecx,eax
 004081D4    test        cl,1
>004081D7    jne         0040820B
 004081D9    call        004081A8
 004081DE    mov         esi,eax
 004081E0    test        esi,esi
>004081E2    je          00408205
 004081E4    cmp         dword ptr [ebx+4],0BAADF00D
>004081EB    jne         004081F3
 004081ED    or          eax,0FFFFFFFF
 004081F0    pop         esi
 004081F1    pop         ebx
 004081F2    ret
 004081F3    mov         eax,dword ptr [esi]
 004081F5    call        004077AC
 004081FA    mov         edx,ebx
 004081FC    mov         eax,esi
 004081FE    call        00408164
>00408203    jmp         00408226
 00408205    or          eax,0FFFFFFFF
 00408208    pop         esi
 00408209    pop         ebx
 0040820A    ret
 0040820B    and         ecx,0FFFFFFF0
 0040820E    mov         eax,ecx
 00408210    test        eax,eax
>00408212    je          00408220
 00408214    cmp         ebx,dword ptr [eax+4]
>00408217    jne         00408220
 00408219    call        00407C6C
>0040821E    jmp         00408226
 00408220    or          eax,0FFFFFFFF
 00408223    pop         esi
 00408224    pop         ebx
 00408225    ret
 00408226    xor         eax,eax
 00408228    pop         esi
 00408229    pop         ebx
 0040822A    ret
end;*}

//0040822C
{*function sub_0040822C(?:?; ?:?; ?:?):?;
begin
 0040822C    push        ebx
 0040822D    push        esi
 0040822E    add         esp,0FFFFFFF8
 00408231    mov         dword ptr [esp+4],ecx
 00408235    mov         ebx,edx
 00408237    mov         dword ptr [esp],eax
 0040823A    cmp         ebx,7432D6
>00408240    jae         00408257
 00408242    imul        eax,ebx,11A
 00408248    shr         eax,8
 0040824B    add         eax,30
 0040824E    call        004080C4
 00408253    mov         esi,eax
>00408255    jmp         00408260
 00408257    mov         eax,ebx
 00408259    call        004080C4
 0040825E    mov         esi,eax
 00408260    test        esi,esi
>00408262    je          00408294
 00408264    mov         eax,dword ptr [esp+4]
 00408268    mov         eax,dword ptr [eax+18]
 0040826B    cmp         ebx,eax
>0040826D    jae         00408271
 0040826F    mov         eax,ebx
 00408271    mov         edx,esi
 00408273    mov         ecx,dword ptr [esp]
 00408276    xchg        eax,ecx
 00408277    call        dword ptr ds:[5AF678]
 0040827D    mov         eax,dword ptr [esp+4]
 00408281    mov         eax,dword ptr [eax]
 00408283    call        004077AC
 00408288    mov         edx,dword ptr [esp]
 0040828B    mov         eax,dword ptr [esp+4]
 0040828F    call        00408164
 00408294    mov         eax,esi
 00408296    pop         ecx
 00408297    pop         edx
 00408298    pop         esi
 00408299    pop         ebx
 0040829A    ret
end;*}

//0040829C
{*function sub_0040829C(?:?; ?:?; ?:?):?;
begin
 0040829C    push        ebx
 0040829D    push        esi
 0040829E    push        edi
 0040829F    push        ebp
 004082A0    mov         esi,ecx
 004082A2    mov         ebx,edx
 004082A4    mov         ebp,eax
 004082A6    cmp         ebx,7FF0
>004082AC    jbe         004082C6
 004082AE    mov         edx,ebx
 004082B0    mov         eax,esi
 004082B2    call        00407CFC
 004082B7    mov         esi,eax
 004082B9    test        esi,esi
>004082BB    je          004082C2
 004082BD    mov         edi,dword ptr [esi+4]
>004082C0    jmp         004082EF
 004082C2    xor         edi,edi
>004082C4    jmp         004082EF
 004082C6    mov         eax,ebx
 004082C8    call        004080C4
 004082CD    mov         edi,eax
 004082CF    test        edi,edi
>004082D1    je          004082EF
 004082D3    mov         eax,dword ptr [esi+8]
 004082D6    cmp         ebx,eax
>004082D8    jbe         004082DC
 004082DA    mov         ebx,eax
 004082DC    mov         edx,edi
 004082DE    mov         eax,ebp
 004082E0    mov         ecx,ebx
 004082E2    call        dword ptr ds:[5AF678]
 004082E8    mov         eax,esi
 004082EA    call        00407C6C
 004082EF    mov         eax,edi
 004082F1    pop         ebp
 004082F2    pop         edi
 004082F3    pop         esi
 004082F4    pop         ebx
 004082F5    ret
end;*}

//004082F8
{*function sub_004082F8(?:?; ?:?):?;
begin
 004082F8    push        ebx
 004082F9    push        esi
 004082FA    mov         esi,edx
 004082FC    mov         ebx,eax
 004082FE    mov         edx,ebx
 00408300    mov         eax,edx
 00408302    shr         eax,10
 00408305    mov         eax,dword ptr [eax*4+5AF6A0];gvar_005AF6A0
 0040830C    mov         ecx,eax
 0040830E    test        cl,1
>00408311    jne         00408349
 00408313    cmp         dword ptr [ebx+4],0BAADF00D
>0040831A    jne         00408321
 0040831C    xor         eax,eax
 0040831E    pop         esi
 0040831F    pop         ebx
 00408320    ret
 00408321    call        004081A8
 00408326    test        eax,eax
>00408328    je          00408345
 0040832A    cmp         esi,dword ptr [eax+18]
>0040832D    ja          00408338
 0040832F    cmp         esi,dword ptr [eax+20]
>00408332    jb          00408338
 00408334    mov         eax,ebx
>00408336    jmp         0040837B
 00408338    mov         ecx,eax
 0040833A    mov         edx,esi
 0040833C    mov         eax,ebx
 0040833E    call        0040822C
>00408343    jmp         0040837B
 00408345    xor         eax,eax
>00408347    jmp         0040837B
 00408349    and         ecx,0FFFFFFF0
 0040834C    mov         eax,ecx
 0040834E    test        eax,eax
>00408350    je          00408379
 00408352    cmp         ebx,dword ptr [eax+4]
>00408355    jne         00408379
 00408357    mov         edx,dword ptr [eax+0C]
 0040835A    cmp         esi,edx
>0040835C    ja          0040836C
 0040835E    shr         edx,2
 00408361    cmp         esi,edx
>00408363    jb          0040836C
 00408365    mov         dword ptr [eax+8],esi
 00408368    mov         eax,ebx
>0040836A    jmp         0040837B
 0040836C    mov         ecx,eax
 0040836E    mov         edx,esi
 00408370    mov         eax,ebx
 00408372    call        0040829C
>00408377    jmp         0040837B
 00408379    xor         eax,eax
 0040837B    pop         esi
 0040837C    pop         ebx
 0040837D    ret
end;*}

//00408380
procedure sub_00408380;
begin
{*
 00408380    push        ebx
 00408381    push        esi
 00408382    push        edi
 00408383    push        ebp
 00408384    mov         eax,5E0518;gvar_005E0518
 00408389    call        00407798
 0040838E    mov         ebx,32
 00408393    mov         edi,5DF6D4;gvar_005DF6D4
 00408398    mov         ebp,5AC0E4
 0040839D    mov         esi,edi
 0040839F    mov         eax,esi
 004083A1    call        00407798
 004083A6    movzx       ecx,word ptr [ebp]
 004083AA    mov         dword ptr [esi+14],ecx
 004083AD    mov         eax,10000
 004083B2    xor         edx,edx
 004083B4    div         eax,ecx
 004083B6    mov         dword ptr [esi+18],eax
 004083B9    mov         eax,dword ptr [esi+14]
 004083BC    cmp         eax,40
>004083BF    jbe         004083C9
 004083C1    shr         eax,2
 004083C4    mov         dword ptr [esi+1C],eax
>004083C7    jmp         004083CE
 004083C9    xor         eax,eax
 004083CB    mov         dword ptr [esi+1C],eax
 004083CE    add         ebp,2
 004083D1    add         edi,20
 004083D4    dec         ebx
>004083D5    jne         0040839D
 004083D7    xor         eax,eax
 004083D9    xor         ebx,ebx
 004083DB    mov         esi,5AC0E4
 004083E0    movzx       edx,word ptr [esi]
 004083E3    cmp         edx,eax
>004083E5    jle         004083F9
 004083E7    mov         ecx,eax
 004083E9    shr         ecx,4
 004083EC    mov         byte ptr [ecx+5DFD14],bl
 004083F2    add         eax,10
 004083F5    cmp         edx,eax
>004083F7    jg          004083E7
 004083F9    inc         ebx
 004083FA    add         esi,2
 004083FD    cmp         ebx,32
>00408400    jne         004083E0
 00408402    mov         eax,5DF6C4;gvar_005DF6C4
 00408407    call        00407798
 0040840C    pop         ebp
 0040840D    pop         edi
 0040840E    pop         esi
 0040840F    pop         ebx
 00408410    ret
*}
end;

//00408414
procedure sub_00408414;
begin
{*
 00408414    push        ebx
 00408415    push        esi
 00408416    mov         ebx,5E0514;gvar_005E0514
 0040841B    mov         eax,5E0518;gvar_005E0518
 00408420    call        004077A0
 00408425    cmp         dword ptr [ebx],0
>00408428    je          00408436
 0040842A    mov         eax,dword ptr [ebx]
 0040842C    call        00407C6C
 00408431    cmp         dword ptr [ebx],0
>00408434    jne         0040842A
 00408436    mov         esi,32
 0040843B    mov         ebx,5DF6D8;gvar_005DF6D8
>00408440    jmp         00408447
 00408442    call        00408048
 00408447    mov         eax,dword ptr [ebx]
 00408449    test        eax,eax
>0040844B    jne         00408442
>0040844D    jmp         00408454
 0040844F    call        00408048
 00408454    mov         eax,dword ptr [ebx+8]
 00408457    test        eax,eax
>00408459    jne         0040844F
 0040845B    lea         eax,[ebx-4]
 0040845E    call        004077A0
 00408463    add         ebx,20
 00408466    dec         esi
>00408467    jne         00408447
 00408469    cmp         dword ptr ds:[5DF6CC],0;gvar_005DF6CC
>00408470    je          0040847C
 00408472    mov         eax,99
 00408477    call        @RunError
 0040847C    cmp         dword ptr ds:[5DF6C8],0;gvar_005DF6C8
>00408483    je          004084AB
 00408485    cmp         dword ptr ds:[5DF6C8],0;gvar_005DF6C8
>0040848C    je          004084AB
 0040848E    mov         ebx,dword ptr ds:[5DF6C8];gvar_005DF6C8
 00408494    mov         eax,ebx
 00408496    call        004078FC
 0040849B    mov         eax,ebx
 0040849D    call        00407948
 004084A2    cmp         dword ptr ds:[5DF6C8],0;gvar_005DF6C8
>004084A9    jne         0040848E
 004084AB    mov         eax,5DF6C4;gvar_005DF6C4
 004084B0    call        004077A0
 004084B5    pop         esi
 004084B6    pop         ebx
 004084B7    ret
*}
end;

//00408554
procedure sub_00408554;
begin
{*
 00408554    cmp         dword ptr ds:[5AF694],0;gvar_005AF694
>0040855B    jne         00408598
 0040855D    mov         eax,[005AE110];^IsLibrary:Boolean
 00408562    cmp         byte ptr [eax],0
>00408565    jne         00408598
 00408567    push        0
 00408569    push        0
 0040856B    push        0
 0040856D    push        0
 0040856F    call        KERNEL32.CreateEventA
 00408574    mov         [005AF69C],eax;gvar_005AF69C:THandle
 00408579    push        5AF694;gvar_005AF694
 0040857E    push        0
 00408580    push        0
 00408582    push        4084B8
 00408587    push        4000
 0040858C    push        0
 0040858E    call        KERNEL32.CreateThread
 00408593    mov         [005AF698],eax;gvar_005AF698:THandle
 00408598    ret
*}
end;

//0040859C
procedure sub_0040859C;
begin
{*
 0040859C    cmp         dword ptr ds:[5AF694],0;gvar_005AF694
>004085A3    je          004085DA
 004085A5    xor         eax,eax
 004085A7    mov         [005AF694],eax;gvar_005AF694
 004085AC    mov         eax,[005AF69C];gvar_005AF69C:THandle
 004085B1    push        eax
 004085B2    call        KERNEL32.SetEvent
 004085B7    push        0FF
 004085B9    mov         eax,[005AF698];gvar_005AF698:THandle
 004085BE    push        eax
 004085BF    call        KERNEL32.WaitForSingleObject
 004085C4    mov         eax,[005AF698];gvar_005AF698:THandle
 004085C9    push        eax
 004085CA    call        KERNEL32.CloseHandle
 004085CF    mov         eax,[005AF69C];gvar_005AF69C:THandle
 004085D4    push        eax
 004085D5    call        KERNEL32.CloseHandle
 004085DA    ret
*}
end;

//004085DC
procedure sub_004085DC;
begin
{*
 004085DC    push        ebx
 004085DD    inc         dword ptr ds:[5DF6AC];gvar_005DF6AC
 004085E3    cmp         dword ptr ds:[5DF6AC],1;gvar_005DF6AC
>004085EA    jne         00408639
 004085EC    xor         eax,eax
 004085EE    mov         ebx,5DF6B4;gvar_005DF6B4:TMemoryManager
 004085F3    test        eax,eax
>004085F5    jne         00408620
 004085F7    mov         eax,4080C4;sub_004080C4
 004085FC    mov         dword ptr [ebx],eax
 004085FE    mov         eax,4081C0;sub_004081C0
 00408603    mov         dword ptr [ebx+4],eax
 00408606    mov         eax,4082F8;sub_004082F8
 0040860B    mov         dword ptr [ebx+8],eax
 0040860E    mov         eax,[005AF680];gvar_005AF680
 00408613    mov         dword ptr [ebx+0C],eax
 00408616    call        00408380
 0040861B    call        00408554
 00408620    mov         eax,5DF6A0;gvar_005DF6A0:TMemoryManager
 00408625    call        GetMemoryManager
 0040862A    mov         eax,ebx
 0040862C    call        SetMemoryManager
 00408631    mov         eax,dword ptr [ebx+0C]
 00408634    mov         [005AF680],eax;gvar_005AF680
 00408639    pop         ebx
 0040863A    ret
*}
end;

//0040863C
procedure sub_0040863C;
begin
{*
 0040863C    dec         dword ptr ds:[5DF6AC];gvar_005DF6AC
 00408642    cmp         dword ptr ds:[5DF6AC],0;gvar_005DF6AC
>00408649    jne         0040865B
 0040864B    mov         eax,5DF6A0;gvar_005DF6A0:TMemoryManager
 00408650    call        SetMemoryManager
 00408655    call        00408414
 0040865A    ret
 0040865B    cmp         dword ptr ds:[5DF6AC],0;gvar_005DF6AC
>00408662    jge         0040866E
 00408664    mov         eax,0D2
 00408669    call        @RunError
 0040866E    ret
*}
end;

Initialization
//004086AC
{*
 004086AC    push        ebp
 004086AD    mov         ebp,esp
 004086AF    push        ebx
 004086B0    push        esi
 004086B1    push        edi
 004086B2    sub         dword ptr ds:[5AF68C],1
>004086B9    jae         004087C3
 004086BF    call        IsMemoryManagerSet
 004086C4    test        al,al
>004086C6    je          004086D2
 004086C8    mov         eax,0D0
 004086CD    call        @RunError
 004086D2    mov         dword ptr ds:[5E0728],20;gvar_005E0728
 004086DC    push        5E0728;gvar_005E0728
 004086E1    call        KERNEL32.GlobalMemoryStatus
 004086E6    mov         eax,[005E0740];gvar_005E0740
 004086EB    cmp         eax,80000000
 004086F0    seta        byte ptr ds:[5AF690];gvar_005AF690
 004086F7    cmp         byte ptr ds:[5AF690],0;gvar_005AF690
>004086FE    je          0040870C
 00408700    mov         dword ptr ds:[5AF684],0BFFF;gvar_005AF684
>0040870A    jmp         00408716
 0040870C    mov         dword ptr ds:[5AF684],7FFF;gvar_005AF684
 00408716    mov         [005AF688],eax;gvar_005AF688
 0040871B    call        00407734
 00408720    xor         eax,eax
 00408722    push        ebp
 00408723    push        40876B
 00408728    push        dword ptr fs:[eax]
 0040872B    mov         dword ptr fs:[eax],esp
 0040872E    push        ebx
 0040872F    pushfd
 00408730    pop         eax
 00408731    mov         edx,eax
 00408733    xor         edx,200000
 00408739    push        eax
 0040873A    popfd
 0040873B    pushfd
 0040873C    pop         eax
 0040873D    cmp         eax,edx
>0040873F    je          00408760
 00408741    mov         eax,0
 00408746    cpuid
>00408748    je          00408760
 0040874A    mov         eax,1
 0040874F    cpuid
 00408751    test        edx,2000000
 00408757    setne       al
 0040875A    mov         byte ptr ds:[5DF6B0],al;gvar_005DF6B0
 00408760    pop         ebx
 00408761    xor         eax,eax
 00408763    pop         edx
 00408764    pop         ecx
 00408765    pop         ecx
 00408766    mov         dword ptr fs:[eax],edx
>00408769    jmp         0040877C
>0040876B    jmp         @HandleAnyException
 00408770    xor         eax,eax
 00408772    mov         [005DF6B0],eax;gvar_005DF6B0
 00408777    call        @DoneExcept
 0040877C    cmp         dword ptr ds:[5DF6B0],0;gvar_005DF6B0
>00408783    je          0040879B
 00408785    mov         eax,407F68
 0040878A    mov         [005AF67C],eax;gvar_005AF67C
 0040878F    mov         eax,407ECC
 00408794    mov         [005AF678],eax;gvar_005AF678
>00408799    jmp         004087AF
 0040879B    mov         eax,407FAC
 004087A0    mov         [005AF67C],eax;gvar_005AF67C
 004087A5    mov         eax,4029AC;Move
 004087AA    mov         [005AF678],eax;gvar_005AF678
 004087AF    push        5E051C;gvar_005E051C:PAnsiChar
 004087B4    push        200
 004087B9    call        KERNEL32.GetTempPathA
 004087BE    call        004085DC
 004087C3    pop         edi
 004087C4    pop         esi
 004087C5    pop         ebx
 004087C6    pop         ebp
 004087C7    ret
*}
Finalization
//00408670
{*
 00408670    push        ebp
 00408671    mov         ebp,esp
 00408673    xor         eax,eax
 00408675    push        ebp
 00408676    push        4086A1
 0040867B    push        dword ptr fs:[eax]
 0040867E    mov         dword ptr fs:[eax],esp
 00408681    inc         dword ptr ds:[5AF68C]
>00408687    jne         00408693
 00408689    call        0040859C
 0040868E    call        0040863C
 00408693    xor         eax,eax
 00408695    pop         edx
 00408696    pop         ecx
 00408697    pop         ecx
 00408698    mov         dword ptr fs:[eax],edx
 0040869B    push        4086A8
 004086A0    ret
>004086A1    jmp         @HandleFinally
>004086A6    jmp         004086A0
 004086A8    pop         ebp
 004086A9    ret
*}
end.