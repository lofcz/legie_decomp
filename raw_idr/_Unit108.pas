//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit108;

interface

uses
  SysUtils, Classes;

type
  TTitulkyFronta = TTitulkyFronta = record//size=0x8
f0:String;//f0
end;;
    //procedure sub_005505C0(?:AnsiString; ?:?; ?:?);//005505C0
    //procedure sub_005505F4(?:?);//005505F4
    procedure sub_00550634;//00550634
    procedure sub_00550848;//00550848
    procedure sub_00550868;//00550868

implementation

//005505C0
{*procedure sub_005505C0(?:AnsiString; ?:?; ?:?);
begin
 005505C0    push        ebp
 005505C1    mov         ebp,esp
 005505C3    push        ebx
 005505C4    push        esi
 005505C5    mov         ebx,edx
 005505C7    mov         esi,eax
 005505C9    mov         eax,dword ptr [ebp+8]
 005505CC    mov         eax,dword ptr [eax-4]
 005505CF    lea         eax,[eax*8+5F50E4];gvar_005F50E4:array[53] of ?
 005505D6    mov         edx,esi
 005505D8    call        @LStrAsg
 005505DD    mov         eax,dword ptr [ebp+8]
 005505E0    mov         eax,dword ptr [eax-4]
 005505E3    mov         byte ptr [eax*8+5F50E8],bl;gvar_005F50E8
 005505EA    mov         eax,dword ptr [ebp+8]
 005505ED    inc         dword ptr [eax-4]
 005505F0    pop         esi
 005505F1    pop         ebx
 005505F2    pop         ebp
 005505F3    ret
end;*}

//005505F4
{*procedure sub_005505F4(?:?);
begin
 005505F4    push        ebp
 005505F5    mov         ebp,esp
 005505F7    mov         eax,dword ptr [ebp+8]
 005505FA    push        eax
 005505FB    xor         edx,edx
 005505FD    xor         eax,eax
 005505FF    call        005505C0
 00550604    pop         ecx
 00550605    mov         eax,dword ptr [ebp+8]
 00550608    push        eax
 00550609    xor         edx,edx
 0055060B    xor         eax,eax
 0055060D    call        005505C0
 00550612    pop         ecx
 00550613    mov         eax,dword ptr [ebp+8]
 00550616    push        eax
 00550617    xor         edx,edx
 00550619    xor         eax,eax
 0055061B    call        005505C0
 00550620    pop         ecx
 00550621    mov         eax,dword ptr [ebp+8]
 00550624    push        eax
 00550625    xor         edx,edx
 00550627    xor         eax,eax
 00550629    call        005505C0
 0055062E    pop         ecx
 0055062F    pop         ebp
 00550630    ret
end;*}

//00550634
procedure sub_00550634;
begin
{*
 00550634    push        ebp
 00550635    mov         ebp,esp
 00550637    mov         ecx,5
 0055063C    push        0
 0055063E    push        0
 00550640    dec         ecx
>00550641    jne         0055063C
 00550643    push        ecx
 00550644    push        ebx
 00550645    push        esi
 00550646    lea         esi,[ebp-4]
 00550649    xor         eax,eax
 0055064B    push        ebp
 0055064C    push        550812
 00550651    push        dword ptr fs:[eax]
 00550654    mov         dword ptr fs:[eax],esp
 00550657    xor         eax,eax
 00550659    mov         dword ptr [esi],eax
 0055065B    mov         eax,[005AE578];^gvar_005FE498:Pointer
 00550660    cmp         word ptr [eax+2F6],6
>00550668    jne         005506CC
 0055066A    push        ebp
 0055066B    lea         edx,[ebp-8]
 0055066E    mov         ax,2AF
 00550672    call        00550A18
 00550677    mov         eax,dword ptr [ebp-8]
 0055067A    mov         dl,1
 0055067C    call        005505C0
 00550681    pop         ecx
 00550682    push        ebp
 00550683    lea         edx,[ebp-0C]
 00550686    mov         ax,2B0
 0055068A    call        00550A18
 0055068F    mov         eax,dword ptr [ebp-0C]
 00550692    mov         dl,1
 00550694    call        005505C0
 00550699    pop         ecx
 0055069A    push        ebp
 0055069B    lea         edx,[ebp-10]
 0055069E    mov         ax,2B1
 005506A2    call        00550A18
 005506A7    mov         eax,dword ptr [ebp-10]
 005506AA    mov         dl,1
 005506AC    call        005505C0
 005506B1    pop         ecx
 005506B2    push        ebp
 005506B3    lea         edx,[ebp-14]
 005506B6    mov         ax,2B2
 005506BA    call        00550A18
 005506BF    mov         eax,dword ptr [ebp-14]
 005506C2    mov         dl,1
 005506C4    call        005505C0
 005506C9    pop         ecx
>005506CA    jmp         00550744
 005506CC    push        ebp
 005506CD    lea         edx,[ebp-18]
 005506D0    mov         ax,2B3
 005506D4    call        00550A18
 005506D9    mov         eax,dword ptr [ebp-18]
 005506DC    mov         dl,1
 005506DE    call        005505C0
 005506E3    pop         ecx
 005506E4    push        ebp
 005506E5    lea         edx,[ebp-1C]
 005506E8    mov         ax,2B4
 005506EC    call        00550A18
 005506F1    mov         eax,dword ptr [ebp-1C]
 005506F4    mov         dl,1
 005506F6    call        005505C0
 005506FB    pop         ecx
 005506FC    push        ebp
 005506FD    lea         edx,[ebp-20]
 00550700    mov         ax,2B5
 00550704    call        00550A18
 00550709    mov         eax,dword ptr [ebp-20]
 0055070C    mov         dl,1
 0055070E    call        005505C0
 00550713    pop         ecx
 00550714    push        ebp
 00550715    lea         edx,[ebp-24]
 00550718    mov         ax,2B6
 0055071C    call        00550A18
 00550721    mov         eax,dword ptr [ebp-24]
 00550724    mov         dl,1
 00550726    call        005505C0
 0055072B    pop         ecx
 0055072C    push        ebp
 0055072D    lea         edx,[ebp-28]
 00550730    mov         ax,2C6
 00550734    call        00550A18
 00550739    mov         eax,dword ptr [ebp-28]
 0055073C    mov         dl,1
 0055073E    call        005505C0
 00550743    pop         ecx
 00550744    push        ebp
 00550745    call        005505F4
 0055074A    pop         ecx
 0055074B    push        ebp
 0055074C    call        005505F4
 00550751    pop         ecx
 00550752    push        ebp
 00550753    lea         edx,[ebp-2C]
 00550756    mov         ax,2C7
 0055075A    call        00550A18
 0055075F    mov         eax,dword ptr [ebp-2C]
 00550762    xor         edx,edx
 00550764    call        005505C0
 00550769    pop         ecx
 0055076A    push        ebp
 0055076B    call        005505F4
 00550770    pop         ecx
 00550771    push        ebp
 00550772    xor         edx,edx
 00550774    mov         eax,550828;'www.sudokop.com'
 00550779    call        005505C0
 0055077E    pop         ecx
 0055077F    push        ebp
 00550780    xor         edx,edx
 00550782    mov         eax,550840;'2009'
 00550787    call        005505C0
 0055078C    pop         ecx
 0055078D    xor         eax,eax
 0055078F    mov         [005F528C],eax;gvar_005F528C
 00550794    mov         word ptr ds:[5F5290],0;gvar_005F5290
 0055079D    mov         al,1
 0055079F    call        004B93E4
 005507A4    xor         eax,eax
 005507A6    mov         dword ptr [esi],eax
 005507A8    mov         ebx,5F5294;gvar_005F5294
 005507AD    mov         dword ptr [ebx],3F800000
 005507B3    mov         eax,[005AE53C];^gvar_005F5DF4:Single
 005507B8    mov         eax,dword ptr [eax]
 005507BA    sub         eax,0BE
 005507BF    mov         edx,dword ptr [esi]
 005507C1    mov         ecx,edx
 005507C3    shl         edx,4
 005507C6    add         edx,ecx
 005507C8    add         eax,edx
 005507CA    mov         dword ptr [ebx+4],eax
 005507CD    push        0
 005507CF    push        1
 005507D1    push        1
 005507D3    mov         dl,byte ptr [esi]
 005507D5    mov         ecx,dword ptr ds:[5AE5D8];^gvar_005F5DF0:Single
 005507DB    mov         ecx,dword ptr [ecx]
 005507DD    xchg        eax,edx
 005507DE    xchg        ecx,edx
 005507E0    call        004B91A4
 005507E5    inc         dword ptr [esi]
 005507E7    add         ebx,8
 005507EA    cmp         dword ptr [esi],1B
>005507ED    jne         005507AD
 005507EF    mov         eax,[005AE224];^gvar_005F5577
 005507F4    mov         byte ptr [eax],0B
 005507F7    xor         eax,eax
 005507F9    pop         edx
 005507FA    pop         ecx
 005507FB    pop         ecx
 005507FC    mov         dword ptr fs:[eax],edx
 005507FF    push        550819
 00550804    lea         eax,[ebp-2C]
 00550807    mov         edx,0A
 0055080C    call        @LStrArrayClr
 00550811    ret
>00550812    jmp         @HandleFinally
>00550817    jmp         00550804
 00550819    pop         esi
 0055081A    pop         ebx
 0055081B    mov         esp,ebp
 0055081D    pop         ebp
 0055081E    ret
*}
end;

//00550848
procedure sub_00550848;
begin
{*
 00550848    mov         al,1
 0055084A    call        004B93E4
 0055084F    mov         eax,[005AE458];^gvar_005F5DA4:AnsiString
 00550854    call        @LStrClr
 00550859    mov         eax,[005AE734];^gvar_005F5524:TForm1
 0055085E    mov         eax,dword ptr [eax]
 00550860    mov         dl,5
 00550862    call        0057342C
 00550867    ret
*}
end;

//00550868
procedure sub_00550868;
begin
{*
 00550868    push        ebx
 00550869    push        esi
 0055086A    push        edi
 0055086B    push        ebp
 0055086C    mov         ebp,dword ptr ds:[5AE53C];^gvar_005F5DF4:Single
 00550872    inc         word ptr ds:[5F5290];gvar_005F5290
 00550879    cmp         word ptr ds:[5F5290],3;gvar_005F5290
>00550881    jb          00550976
 00550887    mov         word ptr ds:[5F5290],0;gvar_005F5290
 00550890    xor         esi,esi
 00550892    mov         edi,5F5298;gvar_005F5298
 00550897    dec         dword ptr [edi]
 00550899    xor         ebx,ebx
 0055089B    mov         eax,dword ptr [ebp]
 0055089E    add         eax,8C
 005508A3    cmp         eax,dword ptr [edi]
>005508A5    jge         005508C4
 005508A7    fld         dword ptr [edi-4]
 005508AA    fcomp       dword ptr ds:[55097C];1:Single
 005508B0    fnstsw      al
 005508B2    sahf
>005508B3    jae         005508C4
 005508B5    fld         tbyte ptr ds:[550980];0.05:Extended
 005508BB    fadd        dword ptr [edi-4]
 005508BE    fstp        dword ptr [edi-4]
 005508C1    wait
 005508C2    mov         bl,1
 005508C4    mov         eax,dword ptr [ebp]
 005508C7    sub         eax,8C
 005508CC    cmp         eax,dword ptr [edi]
>005508CE    jle         005508ED
 005508D0    fld         dword ptr [edi-4]
 005508D3    fcomp       dword ptr ds:[55098C];0:Single
 005508D9    fnstsw      al
 005508DB    sahf
>005508DC    jbe         005508ED
 005508DE    fld         tbyte ptr ds:[550980];0.05:Extended
 005508E4    fsubr       dword ptr [edi-4]
 005508E7    fstp        dword ptr [edi-4]
 005508EA    wait
 005508EB    mov         bl,1
 005508ED    mov         eax,dword ptr [ebp]
 005508F0    sub         eax,0BE
 005508F5    cmp         eax,dword ptr [edi]
>005508F7    jle         00550948
 005508F9    add         eax,1CB
 005508FE    mov         dword ptr [edi],eax
 00550900    xor         eax,eax
 00550902    mov         dword ptr [edi-4],eax
 00550905    mov         bl,1
 00550907    mov         eax,[005F528C];gvar_005F528C
 0055090C    mov         eax,dword ptr [eax*8+5F50E4];gvar_005F50E4:array[53] of ?
 00550913    push        eax
 00550914    push        1
 00550916    mov         eax,[005F528C];gvar_005F528C
 0055091B    mov         al,byte ptr [eax*8+5F50E8];gvar_005F50E8
 00550922    push        eax
 00550923    mov         eax,esi
 00550925    mov         edx,dword ptr ds:[5AE5D8];^gvar_005F5DF0:Single
 0055092B    mov         edx,dword ptr [edx]
 0055092D    mov         ecx,dword ptr [edi]
 0055092F    call        004B91A4
 00550934    inc         dword ptr ds:[5F528C];gvar_005F528C
 0055093A    cmp         dword ptr ds:[5F528C],34;gvar_005F528C
>00550941    jle         00550948
 00550943    call        00550848
 00550948    push        1
 0055094A    mov         eax,esi
 0055094C    mov         edx,dword ptr ds:[5AE5D8];^gvar_005F5DF0:Single
 00550952    mov         edx,dword ptr [edx]
 00550954    mov         ecx,dword ptr [edi]
 00550956    call        004B9408
 0055095B    test        bl,bl
>0055095D    je          00550969
 0055095F    push        dword ptr [edi-4]
 00550962    mov         eax,esi
 00550964    call        004B9570
 00550969    inc         esi
 0055096A    add         edi,8
 0055096D    cmp         esi,1B
>00550970    jne         00550897
 00550976    pop         ebp
 00550977    pop         edi
 00550978    pop         esi
 00550979    pop         ebx
 0055097A    ret
*}
end;

Initialization
Finalization
//00550990
{*
 00550990    push        ebp
 00550991    mov         ebp,esp
 00550993    xor         eax,eax
 00550995    push        ebp
 00550996    push        5509CC
 0055099B    push        dword ptr fs:[eax]
 0055099E    mov         dword ptr fs:[eax],esp
 005509A1    inc         dword ptr ds:[5F50E0]
>005509A7    jne         005509BE
 005509A9    mov         eax,5F50E4;gvar_005F50E4:array[53] of ?
 005509AE    mov         ecx,35
 005509B3    mov         edx,dword ptr ds:[55059C];TTitulkyFronta
 005509B9    call        @FinalizeArray
 005509BE    xor         eax,eax
 005509C0    pop         edx
 005509C1    pop         ecx
 005509C2    pop         ecx
 005509C3    mov         dword ptr fs:[eax],edx
 005509C6    push        5509D3
 005509CB    ret
>005509CC    jmp         @HandleFinally
>005509D1    jmp         005509CB
 005509D3    pop         ebp
 005509D4    ret
*}
end.