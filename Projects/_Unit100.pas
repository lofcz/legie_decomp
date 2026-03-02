//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit100;

interface

uses
  SysUtils, Classes;

type
  TFileMD2 = class(TObject)
  public
    f4:dword;//f4
    f8:dword;//f8
    fC:dword;//fC
    f10:dword;//f10
    f14:dword;//f14
    f18:TStringList;//f18
    destructor Destroy; virtual;//00496738
    constructor Create; virtual;//v0//004966D8
  end;
    constructor Create;//004966D8
    destructor Destroy;//00496738
    //procedure sub_0049676C(?:?);//0049676C
    procedure sub_004967B8;//004967B8

implementation

//004966D8
constructor TFileMD2.Create;
begin
{*
 004966D8    push        ebx
 004966D9    push        esi
 004966DA    test        dl,dl
>004966DC    je          004966E6
 004966DE    add         esp,0FFFFFFF0
 004966E1    call        @ClassCreate
 004966E6    mov         ebx,edx
 004966E8    mov         esi,eax
 004966EA    xor         edx,edx
 004966EC    mov         eax,esi
 004966EE    call        TObject.Create
 004966F3    xor         eax,eax
 004966F5    mov         dword ptr [esi+10],eax;TFileMD2.?f10:dword
 004966F8    xor         eax,eax
 004966FA    mov         dword ptr [esi+14],eax;TFileMD2.?f14:dword
 004966FD    xor         eax,eax
 004966FF    mov         dword ptr [esi+4],eax;TFileMD2.?f4:dword
 00496702    xor         eax,eax
 00496704    mov         dword ptr [esi+8],eax;TFileMD2.?f8:dword
 00496707    xor         eax,eax
 00496709    mov         dword ptr [esi+0C],eax;TFileMD2.?fC:dword
 0049670C    mov         dl,1
 0049670E    mov         eax,[00418350];TStringList
 00496713    call        TObject.Create;TStringList.Create
 00496718    mov         dword ptr [esi+18],eax;TFileMD2.?f18:TStringList
 0049671B    mov         eax,esi
 0049671D    test        bl,bl
>0049671F    je          00496730
 00496721    call        @AfterConstruction
 00496726    pop         dword ptr fs:[0]
 0049672D    add         esp,0C
 00496730    mov         eax,esi
 00496732    pop         esi
 00496733    pop         ebx
 00496734    ret
*}
end;

//00496738
destructor TFileMD2.Destroy;
begin
{*
 00496738    push        ebx
 00496739    push        esi
 0049673A    call        @BeforeDestruction
 0049673F    mov         ebx,edx
 00496741    mov         esi,eax
 00496743    mov         eax,esi
 00496745    call        0049676C
 0049674A    mov         eax,dword ptr [esi+18]
 0049674D    call        TObject.Free
 00496752    mov         edx,ebx
 00496754    and         dl,0FC
 00496757    mov         eax,esi
 00496759    call        TObject.Destroy
 0049675E    test        bl,bl
>00496760    jle         00496769
 00496762    mov         eax,esi
 00496764    call        @ClassDestroy
 00496769    pop         esi
 0049676A    pop         ebx
 0049676B    ret
*}
end;

//0049676C
{*procedure sub_0049676C(?:?);
begin
 0049676C    push        ebx
 0049676D    push        esi
 0049676E    push        edi
 0049676F    mov         ebx,eax
 00496771    cmp         dword ptr [ebx+14],0
>00496775    je          004967B4
 00496777    mov         esi,dword ptr [ebx+4]
 0049677A    dec         esi
 0049677B    test        esi,esi
>0049677D    jl          00496796
 0049677F    inc         esi
 00496780    xor         edi,edi
 00496782    mov         eax,dword ptr [ebx+14]
 00496785    mov         eax,dword ptr [eax+edi*4]
 00496788    mov         edx,0C
 0049678D    call        @FreeMem
 00496792    inc         edi
 00496793    dec         esi
>00496794    jne         00496782
 00496796    mov         edx,4
 0049679B    mov         eax,dword ptr [ebx+14]
 0049679E    call        @FreeMem
 004967A3    mov         eax,dword ptr [ebx+10]
 004967A6    test        eax,eax
>004967A8    je          004967B4
 004967AA    mov         edx,24
 004967AF    call        @FreeMem
 004967B4    pop         edi
 004967B5    pop         esi
 004967B6    pop         ebx
 004967B7    ret
end;*}

//004967B8
procedure sub_004967B8;
begin
{*
 004967B8    push        ebp
 004967B9    mov         ebp,esp
 004967BB    push        eax
 004967BC    mov         eax,4
 004967C1    add         esp,0FFFFF004
 004967C7    push        eax
 004967C8    dec         eax
>004967C9    jne         004967C1
 004967CB    mov         eax,dword ptr [ebp-4]
 004967CE    add         esp,0FFFFF714
 004967D4    push        ebx
 004967D5    push        esi
 004967D6    push        edi
 004967D7    xor         ecx,ecx
 004967D9    mov         dword ptr [ebp-48EC],ecx
 004967DF    mov         dword ptr [ebp-48E8],ecx
 004967E5    mov         dword ptr [ebp-10],ecx
 004967E8    mov         dword ptr [ebp-8],edx
 004967EB    mov         dword ptr [ebp-4],eax
 004967EE    lea         ebx,[ebp-48E4]
 004967F4    lea         esi,[ebp-2814]
 004967FA    xor         eax,eax
 004967FC    push        ebp
 004967FD    push        496B41
 00496802    push        dword ptr fs:[eax]
 00496805    mov         dword ptr fs:[eax],esp
 00496808    mov         eax,dword ptr [ebp-4]
 0049680B    call        0049676C
 00496810    lea         edx,[ebp-48D8]
 00496816    mov         ecx,44
 0049681B    mov         eax,dword ptr [ebp-8]
 0049681E    mov         edi,dword ptr [eax]
 00496820    call        dword ptr [edi+0C]
 00496823    mov         eax,dword ptr [ebp-4]
 00496826    mov         edx,dword ptr [ebp-48B0]
 0049682C    mov         dword ptr [eax+4],edx
 0049682F    mov         eax,dword ptr [ebp-4]
 00496832    mov         edx,dword ptr [ebp-48C0]
 00496838    mov         dword ptr [eax+8],edx
 0049683B    mov         eax,dword ptr [ebp-4]
 0049683E    mov         edx,dword ptr [ebp-48B8]
 00496844    mov         dword ptr [eax+0C],edx
 00496847    mov         eax,dword ptr [ebp-48B8]
 0049684D    shl         eax,2
 00496850    lea         eax,[eax+eax*8]
 00496853    call        AllocMem
 00496858    mov         edx,dword ptr [ebp-4]
 0049685B    mov         dword ptr [edx+10],eax
 0049685E    mov         eax,dword ptr [ebp-48B0]
 00496864    shl         eax,2
 00496867    call        AllocMem
 0049686C    mov         edx,dword ptr [ebp-4]
 0049686F    mov         dword ptr [edx+14],eax
 00496872    mov         eax,dword ptr [ebp-48B0]
 00496878    dec         eax
 00496879    test        eax,eax
>0049687B    jl          004968AD
 0049687D    inc         eax
 0049687E    mov         dword ptr [ebp-14],eax
 00496881    mov         dword ptr [ebp-0C],0
 00496888    mov         eax,dword ptr [ebp-48C0]
 0049688E    shl         eax,2
 00496891    lea         eax,[eax+eax*2]
 00496894    call        AllocMem
 00496899    mov         edx,dword ptr [ebp-4]
 0049689C    mov         edx,dword ptr [edx+14]
 0049689F    mov         ecx,dword ptr [ebp-0C]
 004968A2    mov         dword ptr [edx+ecx*4],eax
 004968A5    inc         dword ptr [ebp-0C]
 004968A8    dec         dword ptr [ebp-14]
>004968AB    jne         00496888
 004968AD    mov         ecx,dword ptr [ebp-48C4]
 004968B3    shl         ecx,6
 004968B6    lea         edx,[ebp-814]
 004968BC    mov         eax,dword ptr [ebp-8]
 004968BF    mov         edi,dword ptr [eax]
 004968C1    call        dword ptr [edi+0C]
 004968C4    mov         ecx,dword ptr [ebp-48BC]
 004968CA    shl         ecx,2
 004968CD    mov         edx,esi
 004968CF    mov         eax,dword ptr [ebp-8]
 004968D2    mov         edi,dword ptr [eax]
 004968D4    call        dword ptr [edi+0C]
 004968D7    mov         eax,dword ptr [ebp-48B8]
 004968DD    dec         eax
 004968DE    test        eax,eax
>004968E0    jl          004969A3
 004968E6    inc         eax
 004968E7    mov         dword ptr [ebp-14],eax
 004968EA    mov         dword ptr [ebp-0C],0
 004968F1    mov         edx,ebx
 004968F3    mov         ecx,0C
 004968F8    mov         eax,dword ptr [ebp-8]
 004968FB    mov         edi,dword ptr [eax]
 004968FD    call        dword ptr [edi+0C]
 00496900    mov         eax,dword ptr [ebp-0C]
 00496903    lea         eax,[eax+eax*8]
 00496906    mov         edx,dword ptr [ebp-4]
 00496909    mov         edx,dword ptr [edx+10]
 0049690C    lea         eax,[edx+eax*4]
 0049690F    movsx       edx,word ptr [ebx+4]
 00496913    mov         dword ptr [eax],edx
 00496915    movsx       edx,word ptr [ebx+2]
 00496919    mov         dword ptr [eax+4],edx
 0049691C    movsx       edx,word ptr [ebx]
 0049691F    mov         dword ptr [eax+8],edx
 00496922    movsx       edx,word ptr [ebx+0A]
 00496926    fild        word ptr [esi+edx*4]
 00496929    fild        dword ptr [ebp-48D0]
 0049692F    fdivp       st(1),st
 00496931    fstp        dword ptr [eax+0C]
 00496934    wait
 00496935    movsx       edx,word ptr [ebx+0A]
 00496939    fild        word ptr [esi+edx*4+2]
 0049693D    fild        dword ptr [ebp-48CC]
 00496943    fdivp       st(1),st
 00496945    fstp        dword ptr [eax+10]
 00496948    wait
 00496949    movsx       edx,word ptr [ebx+8]
 0049694D    fild        word ptr [esi+edx*4]
 00496950    fild        dword ptr [ebp-48D0]
 00496956    fdivp       st(1),st
 00496958    fstp        dword ptr [eax+14]
 0049695B    wait
 0049695C    movsx       edx,word ptr [ebx+8]
 00496960    fild        word ptr [esi+edx*4+2]
 00496964    fild        dword ptr [ebp-48CC]
 0049696A    fdivp       st(1),st
 0049696C    fstp        dword ptr [eax+18]
 0049696F    wait
 00496970    movsx       edx,word ptr [ebx+6]
 00496974    fild        word ptr [esi+edx*4]
 00496977    fild        dword ptr [ebp-48D0]
 0049697D    fdivp       st(1),st
 0049697F    fstp        dword ptr [eax+1C]
 00496982    wait
 00496983    movsx       edx,word ptr [ebx+6]
 00496987    fild        word ptr [esi+edx*4+2]
 0049698B    fild        dword ptr [ebp-48CC]
 00496991    fdivp       st(1),st
 00496993    fstp        dword ptr [eax+20]
 00496996    wait
 00496997    inc         dword ptr [ebp-0C]
 0049699A    dec         dword ptr [ebp-14]
>0049699D    jne         004968F1
 004969A3    mov         eax,dword ptr [ebp-48B0]
 004969A9    dec         eax
 004969AA    test        eax,eax
>004969AC    jl          00496B1B
 004969B2    inc         eax
 004969B3    mov         dword ptr [ebp-14],eax
 004969B6    mov         dword ptr [ebp-0C],0
 004969BD    lea         ebx,[ebp-4894]
 004969C3    mov         edx,ebx
 004969C5    mov         ecx,dword ptr [ebp-48C8]
 004969CB    mov         eax,dword ptr [ebp-8]
 004969CE    mov         esi,dword ptr [eax]
 004969D0    call        dword ptr [esi+0C]
 004969D3    lea         eax,[ebp-48E8]
 004969D9    lea         edx,[ebx+18]
 004969DC    mov         ecx,10
 004969E1    call        @LStrFromArray
 004969E6    mov         eax,dword ptr [ebp-48E8]
 004969EC    lea         edx,[ebp-10]
 004969EF    call        Trim
 004969F4    lea         eax,[ebp-48EC]
 004969FA    push        eax
 004969FB    mov         eax,dword ptr [ebp-10]
 004969FE    call        @LStrLen
 00496A03    mov         edx,eax
 00496A05    dec         edx
 00496A06    mov         ecx,1
 00496A0B    mov         eax,dword ptr [ebp-10]
 00496A0E    call        @LStrCopy
 00496A13    mov         eax,dword ptr [ebp-48EC]
 00496A19    mov         al,byte ptr [eax]
 00496A1B    add         al,0D0
 00496A1D    sub         al,0A
>00496A1F    jae         00496A41
 00496A21    lea         eax,[ebp-10]
 00496A24    push        eax
 00496A25    mov         eax,dword ptr [ebp-10]
 00496A28    call        @LStrLen
 00496A2D    mov         ecx,eax
 00496A2F    sub         ecx,2
 00496A32    mov         edx,1
 00496A37    mov         eax,dword ptr [ebp-10]
 00496A3A    call        @LStrCopy
>00496A3F    jmp         00496A5D
 00496A41    lea         eax,[ebp-10]
 00496A44    push        eax
 00496A45    mov         eax,dword ptr [ebp-10]
 00496A48    call        @LStrLen
 00496A4D    mov         ecx,eax
 00496A4F    dec         ecx
 00496A50    mov         edx,1
 00496A55    mov         eax,dword ptr [ebp-10]
 00496A58    call        @LStrCopy
 00496A5D    mov         eax,dword ptr [ebp-4]
 00496A60    mov         eax,dword ptr [eax+18]
 00496A63    mov         edx,dword ptr [ebp-10]
 00496A66    mov         ecx,dword ptr [eax]
 00496A68    call        dword ptr [ecx+54]
 00496A6B    test        eax,eax
>00496A6D    jge         00496A80
 00496A6F    mov         ecx,dword ptr [ebp-0C]
 00496A72    mov         eax,dword ptr [ebp-4]
 00496A75    mov         eax,dword ptr [eax+18]
 00496A78    mov         edx,dword ptr [ebp-10]
 00496A7B    mov         esi,dword ptr [eax]
 00496A7D    call        dword ptr [esi+3C]
 00496A80    mov         ecx,dword ptr [ebp-48C0]
 00496A86    dec         ecx
 00496A87    test        ecx,ecx
>00496A89    jl          00496B0F
 00496A8F    inc         ecx
 00496A90    xor         eax,eax
 00496A92    movzx       esi,byte ptr [ebx+eax*4+28]
 00496A97    mov         dword ptr [ebp-48F0],esi
 00496A9D    fild        dword ptr [ebp-48F0]
 00496AA3    fmul        dword ptr [ebx]
 00496AA5    fadd        dword ptr [ebx+0C]
 00496AA8    mov         esi,dword ptr [ebp-4]
 00496AAB    mov         esi,dword ptr [esi+14]
 00496AAE    mov         edi,dword ptr [ebp-0C]
 00496AB1    mov         esi,dword ptr [esi+edi*4]
 00496AB4    lea         edx,[eax+eax*2]
 00496AB7    fstp        dword ptr [esi+edx*4]
 00496ABA    wait
 00496ABB    movzx       esi,byte ptr [ebx+eax*4+29]
 00496AC0    mov         dword ptr [ebp-48F0],esi
 00496AC6    fild        dword ptr [ebp-48F0]
 00496ACC    fmul        dword ptr [ebx+4]
 00496ACF    fadd        dword ptr [ebx+10]
 00496AD2    mov         esi,dword ptr [ebp-4]
 00496AD5    mov         esi,dword ptr [esi+14]
 00496AD8    mov         edi,dword ptr [ebp-0C]
 00496ADB    mov         esi,dword ptr [esi+edi*4]
 00496ADE    fstp        dword ptr [esi+edx*4+4]
 00496AE2    wait
 00496AE3    movzx       esi,byte ptr [ebx+eax*4+2A]
 00496AE8    mov         dword ptr [ebp-48F0],esi
 00496AEE    fild        dword ptr [ebp-48F0]
 00496AF4    fmul        dword ptr [ebx+8]
 00496AF7    fadd        dword ptr [ebx+14]
 00496AFA    mov         esi,dword ptr [ebp-4]
 00496AFD    mov         esi,dword ptr [esi+14]
 00496B00    mov         edi,dword ptr [ebp-0C]
 00496B03    mov         esi,dword ptr [esi+edi*4]
 00496B06    fstp        dword ptr [esi+edx*4+8]
 00496B0A    wait
 00496B0B    inc         eax
 00496B0C    dec         ecx
>00496B0D    jne         00496A92
 00496B0F    inc         dword ptr [ebp-0C]
 00496B12    dec         dword ptr [ebp-14]
>00496B15    jne         004969BD
 00496B1B    xor         eax,eax
 00496B1D    pop         edx
 00496B1E    pop         ecx
 00496B1F    pop         ecx
 00496B20    mov         dword ptr fs:[eax],edx
 00496B23    push        496B48
 00496B28    lea         eax,[ebp-48EC]
 00496B2E    mov         edx,2
 00496B33    call        @LStrArrayClr
 00496B38    lea         eax,[ebp-10]
 00496B3B    call        @LStrClr
 00496B40    ret
>00496B41    jmp         @HandleFinally
>00496B46    jmp         00496B28
 00496B48    pop         edi
 00496B49    pop         esi
 00496B4A    pop         ebx
 00496B4B    mov         esp,ebp
 00496B4D    pop         ebp
 00496B4E    ret
*}
end;

end.