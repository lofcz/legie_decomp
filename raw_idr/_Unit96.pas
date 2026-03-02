//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit96;

interface

uses
  SysUtils, Classes;

type
  E3DSError = class(Exception)
  end;
    //procedure sub_00497334(?:?);//00497334
    //procedure sub_00497388(?:?; ?:?; ?:?);//00497388
    //procedure sub_004973E4(?:?; ?:?);//004973E4
    //procedure sub_00497400(?:?; ?:?);//00497400
    //function sub_00497474(?:?; ?:?):?;//00497474
    //function sub_004974B0(?:?; ?:?):?;//004974B0
    //procedure sub_004974CC(?:?);//004974CC
    //procedure sub_00497780(?:?);//00497780
    //procedure sub_00497800(?:?; ?:?);//00497800
    //procedure sub_004978A4(?:?);//004978A4
    //procedure sub_004978D4(?:?);//004978D4
    //procedure sub_00497918(?:?; ?:?);//00497918
    //procedure sub_00497A3C(?:?; ?:?);//00497A3C
    //function sub_00497B3C(?:?; ?:?):?;//00497B3C
    //function sub_00497B58(?:?; ?:?; ?:?):?;//00497B58
    //procedure sub_00497C14(?:?);//00497C14
    //procedure sub_00497C60(?:?);//00497C60
    procedure sub_00497D44(?:Pointer);//00497D44
    //function sub_00497E04(?:?; ?:?):?;//00497E04
    //procedure sub_00497E98(?:?; ?:?; ?:?);//00497E98
    //procedure sub_00498378(?:?; ?:?; ?:?);//00498378
    //function sub_00498EA4(?:?):?;//00498EA4
    //procedure sub_00499158(?:?; ?:?; ?:?; ?:?);//00499158
    //function sub_004991F0(?:?; ?:?):?;//004991F0
    //function sub_00499234:?;//00499234
    //procedure sub_0049925C(?:?; ?:?);//0049925C
    //procedure sub_00499394(?:?; ?:?);//00499394
    //procedure sub_00499840(?:?; ?:?; ?:?; ?:?);//00499840
    procedure sub_004998FC(?:Pointer);//004998FC
    //procedure sub_00499920(?:?; ?:?; ?:?);//00499920
    //procedure sub_00499EB8(?:?; ?:?; ?:?; ?:?);//00499EB8
    procedure sub_00499FB4(?:Pointer);//00499FB4
    procedure sub_00499FEC(?:Pointer);//00499FEC
    procedure sub_00499FFC(?:Pointer);//00499FFC
    //procedure sub_0049A078(?:?);//0049A078
    procedure sub_0049A0AC(?:Pointer);//0049A0AC
    procedure sub_0049A134(?:Pointer);//0049A134
    procedure sub_0049A180(?:Pointer);//0049A180

implementation

//00497334
{*procedure sub_00497334(?:?);
begin
 00497334    push        ebp
 00497335    mov         ebp,esp
 00497337    push        ecx
 00497338    mov         dword ptr [ebp-4],eax
 0049733B    mov         eax,dword ptr [ebp-4]
 0049733E    call        @LStrAddRef
 00497343    xor         eax,eax
 00497345    push        ebp
 00497346    push        49737B
 0049734B    push        dword ptr fs:[eax]
 0049734E    mov         dword ptr fs:[eax],esp
 00497351    mov         ecx,dword ptr [ebp-4]
 00497354    mov         dl,1
 00497356    mov         eax,[004972DC];E3DSError
 0049735B    call        Exception.Create;E3DSError.Create
 00497360    call        @RaiseExcept
 00497365    xor         eax,eax
 00497367    pop         edx
 00497368    pop         ecx
 00497369    pop         ecx
 0049736A    mov         dword ptr fs:[eax],edx
 0049736D    push        497382
 00497372    lea         eax,[ebp-4]
 00497375    call        @LStrClr
 0049737A    ret
>0049737B    jmp         @HandleFinally
>00497380    jmp         00497372
 00497382    pop         ecx
 00497383    pop         ebp
 00497384    ret
end;*}

//00497388
{*procedure sub_00497388(?:?; ?:?; ?:?);
begin
 00497388    push        ebp
 00497389    mov         ebp,esp
 0049738B    push        ecx
 0049738C    push        ebx
 0049738D    push        esi
 0049738E    mov         esi,ecx
 00497390    mov         ebx,edx
 00497392    mov         dword ptr [ebp-4],eax
 00497395    mov         eax,dword ptr [ebp-4]
 00497398    call        @LStrAddRef
 0049739D    xor         eax,eax
 0049739F    push        ebp
 004973A0    push        4973D7
 004973A5    push        dword ptr fs:[eax]
 004973A8    mov         dword ptr fs:[eax],esp
 004973AB    push        ebx
 004973AC    push        esi
 004973AD    mov         ecx,dword ptr [ebp-4]
 004973B0    mov         dl,1
 004973B2    mov         eax,[004972DC];E3DSError
 004973B7    call        Exception.CreateFmt;E3DSError.Create
 004973BC    call        @RaiseExcept
 004973C1    xor         eax,eax
 004973C3    pop         edx
 004973C4    pop         ecx
 004973C5    pop         ecx
 004973C6    mov         dword ptr fs:[eax],edx
 004973C9    push        4973DE
 004973CE    lea         eax,[ebp-4]
 004973D1    call        @LStrClr
 004973D6    ret
>004973D7    jmp         @HandleFinally
>004973DC    jmp         004973CE
 004973DE    pop         esi
 004973DF    pop         ebx
 004973E0    pop         ecx
 004973E1    pop         ebp
 004973E2    ret
end;*}

//004973E4
{*procedure sub_004973E4(?:?; ?:?);
begin
 004973E4    mov         ecx,dword ptr [eax+14]
 004973E7    test        ecx,ecx
>004973E9    jne         004973EF
 004973EB    mov         dword ptr [eax+14],edx
 004973EE    ret
 004973EF    mov         eax,ecx
>004973F1    jmp         004973F5
 004973F3    mov         eax,ecx
 004973F5    mov         ecx,dword ptr [eax+10]
 004973F8    test        ecx,ecx
>004973FA    jne         004973F3
 004973FC    mov         dword ptr [eax+10],edx
 004973FF    ret
end;*}

//00497400
{*procedure sub_00497400(?:?; ?:?);
begin
 00497400    push        ebx
 00497401    push        esi
 00497402    push        edi
 00497403    push        ebp
 00497404    push        ecx
 00497405    mov         ebp,edx
 00497407    mov         dword ptr [esp],eax
 0049740A    mov         ax,word ptr [ebp]
 0049740E    call        00498EA4
 00497413    mov         esi,eax
 00497415    mov         eax,dword ptr [esp]
 00497418    mov         eax,dword ptr [eax+14]
 0049741B    test        eax,eax
>0049741D    jne         00497427
 0049741F    mov         eax,dword ptr [esp]
 00497422    mov         dword ptr [eax+14],ebp
>00497425    jmp         0049746D
 00497427    mov         ebx,eax
 00497429    xor         edi,edi
>0049742B    jmp         0049743E
 0049742D    mov         ax,word ptr [ebx]
 00497430    call        00498EA4
 00497435    cmp         esi,eax
>00497437    jg          00497444
 00497439    mov         edi,ebx
 0049743B    mov         ebx,dword ptr [ebx+10]
 0049743E    cmp         dword ptr [ebx+10],0
>00497442    jne         0049742D
 00497444    mov         ax,word ptr [ebx]
 00497447    call        00498EA4
 0049744C    cmp         esi,eax
>0049744E    jle         00497464
 00497450    mov         dword ptr [ebp+10],ebx
 00497453    test        edi,edi
>00497455    je          0049745C
 00497457    mov         dword ptr [edi+10],ebp
>0049745A    jmp         0049746D
 0049745C    mov         eax,dword ptr [esp]
 0049745F    mov         dword ptr [eax+14],ebp
>00497462    jmp         0049746D
 00497464    mov         eax,dword ptr [ebx+10]
 00497467    mov         dword ptr [ebp+10],eax
 0049746A    mov         dword ptr [ebx+10],ebp
 0049746D    pop         edx
 0049746E    pop         ebp
 0049746F    pop         edi
 00497470    pop         esi
 00497471    pop         ebx
 00497472    ret
end;*}

//00497474
{*function sub_00497474(?:?; ?:?):?;
begin
 00497474    push        ebx
 00497475    push        esi
 00497476    push        edi
 00497477    mov         edi,edx
 00497479    xor         esi,esi
 0049747B    test        eax,eax
>0049747D    je          004974A7
 0049747F    cmp         di,word ptr [eax]
>00497482    jne         00497488
 00497484    mov         esi,eax
>00497486    jmp         004974A7
 00497488    mov         ebx,dword ptr [eax+14]
 0049748B    test        ebx,ebx
>0049748D    je          004974A7
 0049748F    mov         edx,edi
 00497491    mov         eax,ebx
 00497493    call        00497474
 00497498    test        eax,eax
>0049749A    je          004974A0
 0049749C    mov         esi,eax
>0049749E    jmp         004974A7
 004974A0    mov         ebx,dword ptr [ebx+10]
 004974A3    test        ebx,ebx
>004974A5    jne         0049748F
 004974A7    mov         eax,esi
 004974A9    pop         edi
 004974AA    pop         esi
 004974AB    pop         ebx
 004974AC    ret
end;*}

//004974B0
{*function sub_004974B0(?:?; ?:?):?;
begin
 004974B0    xor         ecx,ecx
>004974B2    jmp         004974BE
 004974B4    cmp         dx,word ptr [eax]
>004974B7    jne         004974BB
 004974B9    mov         ecx,eax
 004974BB    mov         eax,dword ptr [eax+10]
 004974BE    test        eax,eax
>004974C0    je          004974C6
 004974C2    test        ecx,ecx
>004974C4    je          004974B4
 004974C6    mov         eax,ecx
 004974C8    ret
end;*}

//004974CC
{*procedure sub_004974CC(?:?);
begin
 004974CC    push        ebx
 004974CD    push        esi
 004974CE    mov         ebx,eax
 004974D0    mov         eax,dword ptr [ebx]
 004974D2    mov         esi,dword ptr [eax+0C]
 004974D5    test        esi,esi
>004974D7    je          0049777C
 004974DD    mov         eax,dword ptr [ebx]
 004974DF    movzx       eax,word ptr [eax]
 004974E2    cmp         eax,0A330
>004974E7    jg          004975A0
>004974ED    je          00497617
 004974F3    cmp         eax,8001
>004974F8    jg          0049754F
>004974FA    je          0049767E
 00497500    cmp         eax,4130
>00497505    jg          0049752D
>00497507    je          0049764B
 0049750D    sub         eax,4110
>00497512    je          00497624
 00497518    dec         eax
>00497519    je          00497631
 0049751F    sub         eax,0F
>00497522    je          0049763E
>00497528    jmp         0049776B
 0049752D    sub         eax,4140
>00497532    je          00497671
 00497538    sub         eax,10
>0049753B    je          00497664
 00497541    sub         eax,32
>00497544    je          00497617
>0049754A    jmp         0049776B
 0049754F    add         eax,0FFFF5CE0
 00497554    cmp         eax,0E
>00497557    ja          0049776B
 0049755D    jmp         dword ptr [eax*4+497564]
 0049755D    dd          00497617
 0049755D    dd          00497617
 0049755D    dd          00497617
 0049755D    dd          0049776B
 0049755D    dd          00497617
 0049755D    dd          00497617
 0049755D    dd          00497617
 0049755D    dd          0049776B
 0049755D    dd          00497617
 0049755D    dd          0049776B
 0049755D    dd          00497617
 0049755D    dd          0049776B
 0049755D    dd          00497617
 0049755D    dd          0049776B
 0049755D    dd          00497617
 004975A0    cmp         eax,0B023
>004975A5    jg          004975EA
>004975A7    je          00497707
 004975AD    cmp         eax,0A338
>004975B2    jg          004975CC
>004975B4    je          00497617
 004975B6    sub         eax,0A332
>004975BB    je          00497617
 004975BD    sub         eax,2
>004975C0    je          00497617
 004975C2    sub         eax,2
>004975C5    je          00497617
>004975C7    jmp         0049776B
 004975CC    sub         eax,0B020
>004975D1    je          0049768B
 004975D7    dec         eax
>004975D8    je          004976BF
 004975DE    dec         eax
>004975DF    je          004976D9
>004975E5    jmp         0049776B
 004975EA    add         eax,0FFFF4FDC
 004975EF    cmp         eax,5
>004975F2    ja          0049776B
 004975F8    jmp         dword ptr [eax*4+4975FF]
 004975F8    dd          0049771E
 004975F8    dd          004976A5
 004975F8    dd          004976F0
 004975F8    dd          00497735
 004975F8    dd          0049774C
 004975F8    dd          00497763
 00497617    mov         eax,dword ptr [esi+4]
 0049761A    call        @FreeMem
>0049761F    jmp         0049776B
 00497624    mov         eax,dword ptr [esi+4]
 00497627    call        @FreeMem
>0049762C    jmp         0049776B
 00497631    mov         eax,dword ptr [esi+4]
 00497634    call        @FreeMem
>00497639    jmp         0049776B
 0049763E    mov         eax,dword ptr [esi+4]
 00497641    call        @FreeMem
>00497646    jmp         0049776B
 0049764B    mov         eax,esi
 0049764D    call        @LStrClr
 00497652    mov         eax,dword ptr [ebx]
 00497654    mov         eax,dword ptr [eax+0C]
 00497657    mov         eax,dword ptr [eax+8]
 0049765A    call        @FreeMem
>0049765F    jmp         0049776B
 00497664    mov         eax,dword ptr [esi+4]
 00497667    call        @FreeMem
>0049766C    jmp         0049776B
 00497671    mov         eax,dword ptr [esi+4]
 00497674    call        @FreeMem
>00497679    jmp         0049776B
 0049767E    mov         eax,dword ptr [esi+4]
 00497681    call        @FreeMem
>00497686    jmp         0049776B
 0049768B    mov         eax,dword ptr [esi+10]
 0049768E    call        @FreeMem
 00497693    mov         eax,dword ptr [ebx]
 00497695    mov         eax,dword ptr [eax+0C]
 00497698    mov         eax,dword ptr [eax+14]
 0049769B    call        @FreeMem
>004976A0    jmp         0049776B
 004976A5    mov         eax,dword ptr [esi+10]
 004976A8    call        @FreeMem
 004976AD    mov         eax,dword ptr [ebx]
 004976AF    mov         eax,dword ptr [eax+0C]
 004976B2    mov         eax,dword ptr [eax+14]
 004976B5    call        @FreeMem
>004976BA    jmp         0049776B
 004976BF    mov         eax,dword ptr [esi+10]
 004976C2    call        @FreeMem
 004976C7    mov         eax,dword ptr [ebx]
 004976C9    mov         eax,dword ptr [eax+0C]
 004976CC    mov         eax,dword ptr [eax+14]
 004976CF    call        @FreeMem
>004976D4    jmp         0049776B
 004976D9    mov         eax,dword ptr [esi+10]
 004976DC    call        @FreeMem
 004976E1    mov         eax,dword ptr [ebx]
 004976E3    mov         eax,dword ptr [eax+0C]
 004976E6    mov         eax,dword ptr [eax+14]
 004976E9    call        @FreeMem
>004976EE    jmp         0049776B
 004976F0    mov         eax,dword ptr [esi+10]
 004976F3    call        @FreeMem
 004976F8    mov         eax,dword ptr [ebx]
 004976FA    mov         eax,dword ptr [eax+0C]
 004976FD    mov         eax,dword ptr [eax+14]
 00497700    call        @FreeMem
>00497705    jmp         0049776B
 00497707    mov         eax,dword ptr [esi+10]
 0049770A    call        @FreeMem
 0049770F    mov         eax,dword ptr [ebx]
 00497711    mov         eax,dword ptr [eax+0C]
 00497714    mov         eax,dword ptr [eax+14]
 00497717    call        @FreeMem
>0049771C    jmp         0049776B
 0049771E    mov         eax,dword ptr [esi+10]
 00497721    call        @FreeMem
 00497726    mov         eax,dword ptr [ebx]
 00497728    mov         eax,dword ptr [eax+0C]
 0049772B    mov         eax,dword ptr [eax+14]
 0049772E    call        @FreeMem
>00497733    jmp         0049776B
 00497735    mov         eax,dword ptr [esi+10]
 00497738    call        @FreeMem
 0049773D    mov         eax,dword ptr [ebx]
 0049773F    mov         eax,dword ptr [eax+0C]
 00497742    mov         eax,dword ptr [eax+14]
 00497745    call        @FreeMem
>0049774A    jmp         0049776B
 0049774C    mov         eax,dword ptr [esi+10]
 0049774F    call        @FreeMem
 00497754    mov         eax,dword ptr [ebx]
 00497756    mov         eax,dword ptr [eax+0C]
 00497759    mov         eax,dword ptr [eax+14]
 0049775C    call        @FreeMem
>00497761    jmp         0049776B
 00497763    mov         eax,dword ptr [esi+10]
 00497766    call        @FreeMem
 0049776B    mov         eax,dword ptr [ebx]
 0049776D    mov         eax,dword ptr [eax+0C]
 00497770    call        @FreeMem
 00497775    mov         eax,dword ptr [ebx]
 00497777    xor         edx,edx
 00497779    mov         dword ptr [eax+0C],edx
 0049777C    pop         esi
 0049777D    pop         ebx
 0049777E    ret
end;*}

//00497780
{*procedure sub_00497780(?:?);
begin
 00497780    push        ebp
 00497781    mov         ebp,esp
 00497783    push        0
 00497785    push        ebx
 00497786    mov         ebx,eax
 00497788    xor         eax,eax
 0049778A    push        ebp
 0049778B    push        4977F2
 00497790    push        dword ptr fs:[eax]
 00497793    mov         dword ptr fs:[eax],esp
 00497796    mov         eax,18
 0049779B    call        @GetMem
 004977A0    mov         dword ptr [ebx],eax
 004977A2    cmp         dword ptr [ebx],0
>004977A5    jne         004977BC
 004977A7    lea         edx,[ebp-4]
 004977AA    mov         eax,[005AE50C];^SResString24:TResStringRec
 004977AF    call        LoadStr
 004977B4    mov         eax,dword ptr [ebp-4]
 004977B7    call        00497334
 004977BC    mov         eax,dword ptr [ebx]
 004977BE    mov         word ptr [eax],0
 004977C3    xor         edx,edx
 004977C5    mov         dword ptr [eax+4],edx
 004977C8    xor         edx,edx
 004977CA    mov         dword ptr [eax+8],edx
 004977CD    xor         edx,edx
 004977CF    mov         dword ptr [eax+0C],edx
 004977D2    xor         edx,edx
 004977D4    mov         dword ptr [eax+10],edx
 004977D7    xor         edx,edx
 004977D9    mov         dword ptr [eax+14],edx
 004977DC    xor         eax,eax
 004977DE    pop         edx
 004977DF    pop         ecx
 004977E0    pop         ecx
 004977E1    mov         dword ptr fs:[eax],edx
 004977E4    push        4977F9
 004977E9    lea         eax,[ebp-4]
 004977EC    call        @LStrClr
 004977F1    ret
>004977F2    jmp         @HandleFinally
>004977F7    jmp         004977E9
 004977F9    pop         ebx
 004977FA    pop         ecx
 004977FB    pop         ebp
 004977FC    ret
end;*}

//00497800
{*procedure sub_00497800(?:?; ?:?);
begin
 00497800    push        ebp
 00497801    mov         ebp,esp
 00497803    push        0
 00497805    push        0
 00497807    push        ebx
 00497808    push        esi
 00497809    push        edi
 0049780A    mov         esi,edx
 0049780C    mov         ebx,eax
 0049780E    xor         eax,eax
 00497810    push        ebp
 00497811    push        497894
 00497816    push        dword ptr fs:[eax]
 00497819    mov         dword ptr fs:[eax],esp
 0049781C    cmp         dword ptr [ebx],0
>0049781F    jne         00497847
 00497821    mov         eax,8
 00497826    call        AllocMem
 0049782B    mov         dword ptr [ebx],eax
 0049782D    cmp         dword ptr [ebx],0
>00497830    jne         00497847
 00497832    lea         edx,[ebp-4]
 00497835    mov         eax,[005AE50C];^SResString24:TResStringRec
 0049783A    call        LoadStr
 0049783F    mov         eax,dword ptr [ebp-4]
 00497842    call        00497334
 00497847    mov         eax,dword ptr [ebx]
 00497849    mov         dword ptr [eax],esi
 0049784B    test        esi,esi
>0049784D    jle         00497879
 0049784F    mov         eax,esi
 00497851    shl         eax,3
 00497854    call        AllocMem
 00497859    mov         edi,eax
 0049785B    mov         eax,dword ptr [ebx]
 0049785D    mov         dword ptr [eax+4],edi
 00497860    test        edi,edi
>00497862    jne         00497879
 00497864    lea         edx,[ebp-8]
 00497867    mov         eax,[005AE50C];^SResString24:TResStringRec
 0049786C    call        LoadStr
 00497871    mov         eax,dword ptr [ebp-8]
 00497874    call        00497334
 00497879    xor         eax,eax
 0049787B    pop         edx
 0049787C    pop         ecx
 0049787D    pop         ecx
 0049787E    mov         dword ptr fs:[eax],edx
 00497881    push        49789B
 00497886    lea         eax,[ebp-8]
 00497889    mov         edx,2
 0049788E    call        @LStrArrayClr
 00497893    ret
>00497894    jmp         @HandleFinally
>00497899    jmp         00497886
 0049789B    pop         edi
 0049789C    pop         esi
 0049789D    pop         ebx
 0049789E    pop         ecx
 0049789F    pop         ecx
 004978A0    pop         ebp
 004978A1    ret
end;*}

//004978A4
{*procedure sub_004978A4(?:?);
begin
 004978A4    push        ebx
 004978A5    push        esi
 004978A6    mov         ebx,eax
>004978A8    jmp         004978C9
 004978AA    mov         eax,dword ptr [ebx]
 004978AC    mov         esi,dword ptr [eax+10]
 004978AF    mov         eax,dword ptr [ebx]
 004978B1    add         eax,14
 004978B4    call        004978A4
 004978B9    mov         eax,ebx
 004978BB    call        004974CC
 004978C0    mov         eax,dword ptr [ebx]
 004978C2    call        @FreeMem
 004978C7    mov         dword ptr [ebx],esi
 004978C9    cmp         dword ptr [ebx],0
>004978CC    jne         004978AA
 004978CE    pop         esi
 004978CF    pop         ebx
 004978D0    ret
end;*}

//004978D4
{*procedure sub_004978D4(?:?);
begin
 004978D4    push        ebx
 004978D5    push        esi
 004978D6    push        edi
 004978D7    mov         ebx,eax
 004978D9    cmp         dword ptr [ebx],0
>004978DC    je          00497914
 004978DE    mov         eax,dword ptr [ebx]
 004978E0    mov         esi,dword ptr [eax]
 004978E2    dec         esi
 004978E3    test        esi,esi
>004978E5    jl          004978FB
 004978E7    inc         esi
 004978E8    xor         edi,edi
 004978EA    mov         eax,dword ptr [ebx]
 004978EC    mov         eax,dword ptr [eax+4]
 004978EF    lea         eax,[eax+edi*8]
 004978F2    call        @LStrClr
 004978F7    inc         edi
 004978F8    dec         esi
>004978F9    jne         004978EA
 004978FB    mov         eax,dword ptr [ebx]
 004978FD    mov         eax,dword ptr [eax+4]
 00497900    test        eax,eax
>00497902    je          00497909
 00497904    call        @FreeMem
 00497909    mov         eax,dword ptr [ebx]
 0049790B    call        @FreeMem
 00497910    xor         eax,eax
 00497912    mov         dword ptr [ebx],eax
 00497914    pop         edi
 00497915    pop         esi
 00497916    pop         ebx
 00497917    ret
end;*}

//00497918
{*procedure sub_00497918(?:?; ?:?);
begin
 00497918    push        ebp
 00497919    mov         ebp,esp
 0049791B    add         esp,0FFFFFFF0
 0049791E    push        ebx
 0049791F    push        esi
 00497920    push        edi
 00497921    xor         ecx,ecx
 00497923    mov         dword ptr [ebp-10],ecx
 00497926    mov         esi,edx
 00497928    mov         dword ptr [ebp-4],eax
 0049792B    xor         eax,eax
 0049792D    push        ebp
 0049792E    push        497A2D
 00497933    push        dword ptr fs:[eax]
 00497936    mov         dword ptr fs:[eax],esp
 00497939    cmp         byte ptr [esi+5],0
>0049793D    je          00497A17
 00497943    lea         eax,[esi+0C]
 00497946    call        004978D4
 0049794B    mov         eax,dword ptr [esi]
 0049794D    mov         dx,3D3D
 00497951    call        00497474
 00497956    mov         dword ptr [ebp-8],eax
 00497959    cmp         dword ptr [ebp-8],0
>0049795D    jne         0049796D
 0049795F    mov         eax,dword ptr [esi]
 00497961    mov         dx,3DAA
 00497965    call        00497474
 0049796A    mov         dword ptr [ebp-8],eax
 0049796D    xor         edi,edi
 0049796F    cmp         dword ptr [ebp-8],0
>00497973    je          0049799A
 00497975    mov         dx,0AFFF
 00497979    mov         eax,dword ptr [ebp-8]
 0049797C    call        00497474
 00497981    mov         ebx,eax
 00497983    test        ebx,ebx
>00497985    je          0049799A
 00497987    mov         dx,0AFFF
 0049798B    mov         eax,dword ptr [ebx+10]
 0049798E    call        004974B0
 00497993    mov         ebx,eax
 00497995    inc         edi
 00497996    test        ebx,ebx
>00497998    jne         00497987
 0049799A    lea         eax,[esi+0C]
 0049799D    mov         edx,edi
 0049799F    call        00497800
 004979A4    cmp         dword ptr [ebp-8],0
>004979A8    je          00497A17
 004979AA    xor         edi,edi
 004979AC    mov         dx,0AFFF
 004979B0    mov         eax,dword ptr [ebp-8]
 004979B3    call        00497474
 004979B8    mov         ebx,eax
 004979BA    test        ebx,ebx
>004979BC    je          00497A13
 004979BE    mov         dx,0A000
 004979C2    mov         eax,ebx
 004979C4    call        00497474
 004979C9    mov         dword ptr [ebp-0C],eax
 004979CC    mov         edx,dword ptr [ebp-0C]
 004979CF    mov         eax,dword ptr [ebp-4]
 004979D2    call        0049C1DC
 004979D7    mov         eax,dword ptr [esi+0C]
 004979DA    mov         eax,dword ptr [eax+4]
 004979DD    mov         dword ptr [eax+edi*8+4],ebx
 004979E1    lea         edx,[ebp-10]
 004979E4    mov         eax,dword ptr [ebp-0C]
 004979E7    mov         eax,dword ptr [eax+0C]
 004979EA    call        StrPas
 004979EF    mov         edx,dword ptr [ebp-10]
 004979F2    mov         eax,dword ptr [esi+0C]
 004979F5    mov         eax,dword ptr [eax+4]
 004979F8    lea         eax,[eax+edi*8]
 004979FB    call        @LStrAsg
 00497A00    mov         dx,0AFFF
 00497A04    mov         eax,dword ptr [ebx+10]
 00497A07    call        004974B0
 00497A0C    mov         ebx,eax
 00497A0E    inc         edi
 00497A0F    test        ebx,ebx
>00497A11    jne         004979BE
 00497A13    mov         byte ptr [esi+5],0
 00497A17    xor         eax,eax
 00497A19    pop         edx
 00497A1A    pop         ecx
 00497A1B    pop         ecx
 00497A1C    mov         dword ptr fs:[eax],edx
 00497A1F    push        497A34
 00497A24    lea         eax,[ebp-10]
 00497A27    call        @LStrClr
 00497A2C    ret
>00497A2D    jmp         @HandleFinally
>00497A32    jmp         00497A24
 00497A34    pop         edi
 00497A35    pop         esi
 00497A36    pop         ebx
 00497A37    mov         esp,ebp
 00497A39    pop         ebp
 00497A3A    ret
end;*}

//00497A3C
{*procedure sub_00497A3C(?:?; ?:?);
begin
 00497A3C    push        ebp
 00497A3D    mov         ebp,esp
 00497A3F    add         esp,0FFFFFFF4
 00497A42    push        ebx
 00497A43    push        esi
 00497A44    push        edi
 00497A45    xor         ecx,ecx
 00497A47    mov         dword ptr [ebp-0C],ecx
 00497A4A    mov         edi,edx
 00497A4C    mov         dword ptr [ebp-4],eax
 00497A4F    xor         eax,eax
 00497A51    push        ebp
 00497A52    push        497B2B
 00497A57    push        dword ptr fs:[eax]
 00497A5A    mov         dword ptr fs:[eax],esp
 00497A5D    cmp         byte ptr [edi+4],0
>00497A61    je          00497B15
 00497A67    lea         eax,[edi+8]
 00497A6A    call        004978D4
 00497A6F    mov         eax,dword ptr [edi]
 00497A71    mov         dx,3D3D
 00497A75    call        00497474
 00497A7A    mov         dword ptr [ebp-8],eax
 00497A7D    xor         esi,esi
 00497A7F    cmp         dword ptr [ebp-8],0
>00497A83    je          00497AAA
 00497A85    mov         dx,4000
 00497A89    mov         eax,dword ptr [ebp-8]
 00497A8C    call        00497474
 00497A91    mov         ebx,eax
 00497A93    test        ebx,ebx
>00497A95    je          00497AAA
 00497A97    inc         esi
 00497A98    mov         dx,4000
 00497A9C    mov         eax,dword ptr [ebx+10]
 00497A9F    call        004974B0
 00497AA4    mov         ebx,eax
 00497AA6    test        ebx,ebx
>00497AA8    jne         00497A97
 00497AAA    lea         eax,[edi+8]
 00497AAD    mov         edx,esi
 00497AAF    call        00497800
 00497AB4    cmp         dword ptr [ebp-8],0
>00497AB8    je          00497B15
 00497ABA    xor         esi,esi
 00497ABC    mov         dx,4000
 00497AC0    mov         eax,dword ptr [ebp-8]
 00497AC3    call        00497474
 00497AC8    mov         ebx,eax
 00497ACA    test        ebx,ebx
>00497ACC    je          00497B11
 00497ACE    mov         edx,ebx
 00497AD0    mov         eax,dword ptr [ebp-4]
 00497AD3    call        0049C1DC
 00497AD8    mov         eax,dword ptr [edi+8]
 00497ADB    mov         eax,dword ptr [eax+4]
 00497ADE    mov         dword ptr [eax+esi*8+4],ebx
 00497AE2    lea         edx,[ebp-0C]
 00497AE5    mov         eax,dword ptr [ebx+0C]
 00497AE8    call        StrPas
 00497AED    mov         edx,dword ptr [ebp-0C]
 00497AF0    mov         eax,dword ptr [edi+8]
 00497AF3    mov         eax,dword ptr [eax+4]
 00497AF6    lea         eax,[eax+esi*8]
 00497AF9    call        @LStrAsg
 00497AFE    mov         dx,4000
 00497B02    mov         eax,dword ptr [ebx+10]
 00497B05    call        004974B0
 00497B0A    mov         ebx,eax
 00497B0C    inc         esi
 00497B0D    test        ebx,ebx
>00497B0F    jne         00497ACE
 00497B11    mov         byte ptr [edi+4],0
 00497B15    xor         eax,eax
 00497B17    pop         edx
 00497B18    pop         ecx
 00497B19    pop         ecx
 00497B1A    mov         dword ptr fs:[eax],edx
 00497B1D    push        497B32
 00497B22    lea         eax,[ebp-0C]
 00497B25    call        @LStrClr
 00497B2A    ret
>00497B2B    jmp         @HandleFinally
>00497B30    jmp         00497B22
 00497B32    pop         edi
 00497B33    pop         esi
 00497B34    pop         ebx
 00497B35    mov         esp,ebp
 00497B37    pop         ebp
 00497B38    ret
end;*}

//00497B3C
{*function sub_00497B3C(?:?; ?:?):?;
begin
 00497B3C    push        ebx
 00497B3D    mov         ebx,edx
 00497B3F    mov         edx,ebx
 00497B41    call        00497918
 00497B46    mov         eax,dword ptr [ebx+0C]
 00497B49    test        eax,eax
>00497B4B    jne         00497B51
 00497B4D    xor         eax,eax
 00497B4F    pop         ebx
 00497B50    ret
 00497B51    mov         eax,dword ptr [eax]
 00497B53    pop         ebx
 00497B54    ret
end;*}

//00497B58
{*function sub_00497B58(?:?; ?:?; ?:?):?;
begin
 00497B58    push        ebp
 00497B59    mov         ebp,esp
 00497B5B    add         esp,0FFFFFFE4
 00497B5E    push        ebx
 00497B5F    push        esi
 00497B60    push        edi
 00497B61    xor         ebx,ebx
 00497B63    mov         dword ptr [ebp-1C],ebx
 00497B66    mov         dword ptr [ebp-18],ebx
 00497B69    mov         esi,edx
 00497B6B    lea         edi,[ebp-14]
 00497B6E    movs        dword ptr [edi],dword ptr [esi]
 00497B6F    movs        dword ptr [edi],dword ptr [esi]
 00497B70    movs        dword ptr [edi],dword ptr [esi]
 00497B71    movs        dword ptr [edi],dword ptr [esi]
 00497B72    movs        dword ptr [edi],dword ptr [esi]
 00497B73    mov         ebx,ecx
 00497B75    mov         esi,eax
 00497B77    xor         eax,eax
 00497B79    push        ebp
 00497B7A    push        497C04
 00497B7F    push        dword ptr fs:[eax]
 00497B82    mov         dword ptr fs:[eax],esp
 00497B85    cmp         dword ptr [ebp-14],0
>00497B89    jne         00497BA0
 00497B8B    lea         edx,[ebp-18]
 00497B8E    mov         eax,[005AE2D4];^SResString26:TResStringRec
 00497B93    call        LoadStr
 00497B98    mov         eax,dword ptr [ebp-18]
 00497B9B    call        00497334
 00497BA0    mov         eax,dword ptr [ebp-14]
 00497BA3    mov         ax,word ptr [eax]
 00497BA6    cmp         ax,3DAA
>00497BAA    je          00497BCD
 00497BAC    cmp         ax,4D4D
>00497BB0    je          00497BCD
 00497BB2    cmp         ax,0C23D
>00497BB6    je          00497BCD
 00497BB8    lea         edx,[ebp-1C]
 00497BBB    mov         eax,[005AE37C];^SResString27:TResStringRec
 00497BC0    call        LoadStr
 00497BC5    mov         eax,dword ptr [ebp-1C]
 00497BC8    call        00497334
 00497BCD    lea         edx,[ebp-14]
 00497BD0    mov         eax,esi
 00497BD2    call        00497918
 00497BD7    mov         eax,dword ptr [ebp-8]
 00497BDA    cmp         ebx,dword ptr [eax]
>00497BDC    jge         00497BE7
 00497BDE    mov         eax,dword ptr [eax+4]
 00497BE1    mov         ebx,dword ptr [eax+ebx*8+4]
>00497BE5    jmp         00497BE9
 00497BE7    xor         ebx,ebx
 00497BE9    xor         eax,eax
 00497BEB    pop         edx
 00497BEC    pop         ecx
 00497BED    pop         ecx
 00497BEE    mov         dword ptr fs:[eax],edx
 00497BF1    push        497C0B
 00497BF6    lea         eax,[ebp-1C]
 00497BF9    mov         edx,2
 00497BFE    call        @LStrArrayClr
 00497C03    ret
>00497C04    jmp         @HandleFinally
>00497C09    jmp         00497BF6
 00497C0B    mov         eax,ebx
 00497C0D    pop         edi
 00497C0E    pop         esi
 00497C0F    pop         ebx
 00497C10    mov         esp,ebp
 00497C12    pop         ebp
 00497C13    ret
end;*}

//00497C14
{*procedure sub_00497C14(?:?);
begin
 00497C14    push        ebx
 00497C15    mov         ebx,eax
 00497C17    mov         eax,ebx
 00497C19    xor         ecx,ecx
 00497C1B    mov         edx,78
 00497C20    call        @FillChar
 00497C25    mov         dword ptr [ebx+1C],3F800000
 00497C2C    mov         dword ptr [ebx+20],3F800000
 00497C33    mov         dword ptr [ebx+40],3F800000
 00497C3A    mov         dword ptr [ebx+44],3F800000
 00497C41    mov         dword ptr [ebx+48],3F800000
 00497C48    mov         dword ptr [ebx+4C],3F800000
 00497C4F    mov         dword ptr [ebx+5C],3F800000
 00497C56    mov         dword ptr [ebx+6C],3F800000
 00497C5D    pop         ebx
 00497C5E    ret
end;*}

//00497C60
{*procedure sub_00497C60(?:?);
begin
 00497C60    push        ebx
 00497C61    mov         ebx,eax
 00497C63    mov         eax,ebx
 00497C65    xor         ecx,ecx
 00497C67    mov         edx,7E4
 00497C6C    call        @FillChar
 00497C71    mov         dword ptr [ebx+40],3F800000
 00497C78    mov         dword ptr [ebx+44],3
 00497C7F    mov         dword ptr [ebx+764],64
 00497C89    mov         dword ptr [ebx+768],1
 00497C93    lea         eax,[ebx+54]
 00497C96    call        00497C14
 00497C9B    lea         eax,[ebx+0CC]
 00497CA1    call        00497C14
 00497CA6    lea         eax,[ebx+144]
 00497CAC    call        00497C14
 00497CB1    lea         eax,[ebx+1BC]
 00497CB7    call        00497C14
 00497CBC    lea         eax,[ebx+234]
 00497CC2    call        00497C14
 00497CC7    lea         eax,[ebx+2AC]
 00497CCD    call        00497C14
 00497CD2    lea         eax,[ebx+6E4]
 00497CD8    call        00497C14
 00497CDD    lea         eax,[ebx+76C]
 00497CE3    call        00497C14
 00497CE8    lea         eax,[ebx+324]
 00497CEE    call        00497C14
 00497CF3    lea         eax,[ebx+39C]
 00497CF9    call        00497C14
 00497CFE    lea         eax,[ebx+414]
 00497D04    call        00497C14
 00497D09    lea         eax,[ebx+48C]
 00497D0F    call        00497C14
 00497D14    lea         eax,[ebx+504]
 00497D1A    call        00497C14
 00497D1F    lea         eax,[ebx+57C]
 00497D25    call        00497C14
 00497D2A    lea         eax,[ebx+5F4]
 00497D30    call        00497C14
 00497D35    lea         eax,[ebx+66C]
 00497D3B    call        00497C14
 00497D40    pop         ebx
 00497D41    ret
end;*}

//00497D44
procedure sub_00497D44(?:Pointer);
begin
{*
 00497D44    push        ebx
 00497D45    mov         ebx,eax
 00497D47    test        ebx,ebx
>00497D49    je          00497E01
 00497D4F    mov         eax,dword ptr [ebx+0C8]
 00497D55    call        @FreeMem
 00497D5A    mov         eax,dword ptr [ebx+140]
 00497D60    call        @FreeMem
 00497D65    mov         eax,dword ptr [ebx+1B8]
 00497D6B    call        @FreeMem
 00497D70    mov         eax,dword ptr [ebx+230]
 00497D76    call        @FreeMem
 00497D7B    mov         eax,dword ptr [ebx+2A8]
 00497D81    call        @FreeMem
 00497D86    mov         eax,dword ptr [ebx+320]
 00497D8C    call        @FreeMem
 00497D91    mov         eax,dword ptr [ebx+7E0]
 00497D97    call        @FreeMem
 00497D9C    mov         eax,dword ptr [ebx+398]
 00497DA2    call        @FreeMem
 00497DA7    mov         eax,dword ptr [ebx+410]
 00497DAD    call        @FreeMem
 00497DB2    mov         eax,dword ptr [ebx+488]
 00497DB8    call        @FreeMem
 00497DBD    mov         eax,dword ptr [ebx+500]
 00497DC3    call        @FreeMem
 00497DC8    mov         eax,dword ptr [ebx+578]
 00497DCE    call        @FreeMem
 00497DD3    mov         eax,dword ptr [ebx+5F0]
 00497DD9    call        @FreeMem
 00497DDE    mov         eax,dword ptr [ebx+668]
 00497DE4    call        @FreeMem
 00497DE9    mov         eax,dword ptr [ebx+6E0]
 00497DEF    call        @FreeMem
 00497DF4    mov         edx,dword ptr ds:[497068];TMaterial3DS
 00497DFA    mov         eax,ebx
 00497DFC    call        @Dispose
 00497E01    pop         ebx
 00497E02    ret
*}
end;

//00497E04
{*function sub_00497E04(?:?; ?:?):?;
begin
 00497E04    push        ebx
 00497E05    push        esi
 00497E06    add         esp,0FFFFFFF8
 00497E09    mov         ebx,edx
 00497E0B    mov         esi,eax
 00497E0D    mov         dx,30
 00497E11    mov         eax,ebx
 00497E13    call        00497474
 00497E18    mov         dword ptr [esp+4],eax
 00497E1C    cmp         dword ptr [esp+4],0
>00497E21    je          00497E4C
 00497E23    mov         edx,dword ptr [esp+4]
 00497E27    mov         eax,esi
 00497E29    call        0049C1DC
 00497E2E    mov         eax,dword ptr [esp+4]
 00497E32    mov         eax,dword ptr [eax+0C]
 00497E35    fild        word ptr [eax]
 00497E37    fdiv        dword ptr ds:[497E94];100:Single
 00497E3D    fstp        dword ptr [esp]
 00497E40    wait
 00497E41    lea         eax,[esp+4]
 00497E45    call        004974CC
>00497E4A    jmp         00497E89
 00497E4C    mov         dx,31
 00497E50    mov         eax,ebx
 00497E52    call        00497474
 00497E57    mov         dword ptr [esp+4],eax
 00497E5B    cmp         dword ptr [esp+4],0
>00497E60    je          00497E84
 00497E62    mov         edx,dword ptr [esp+4]
 00497E66    mov         eax,esi
 00497E68    call        0049C1DC
 00497E6D    mov         eax,dword ptr [esp+4]
 00497E71    mov         eax,dword ptr [eax+0C]
 00497E74    mov         eax,dword ptr [eax]
 00497E76    mov         dword ptr [esp],eax
 00497E79    lea         eax,[esp+4]
 00497E7D    call        004974CC
>00497E82    jmp         00497E89
 00497E84    xor         eax,eax
 00497E86    mov         dword ptr [esp],eax
 00497E89    fld         dword ptr [esp]
 00497E8C    pop         ecx
 00497E8D    pop         edx
 00497E8E    pop         esi
 00497E8F    pop         ebx
 00497E90    ret
end;*}

//00497E98
{*procedure sub_00497E98(?:?; ?:?; ?:?);
begin
 00497E98    push        ebp
 00497E99    mov         ebp,esp
 00497E9B    add         esp,0FFFFFFF0
 00497E9E    push        ebx
 00497E9F    push        esi
 00497EA0    push        edi
 00497EA1    xor         ebx,ebx
 00497EA3    mov         dword ptr [ebp-0C],ebx
 00497EA6    mov         ebx,ecx
 00497EA8    mov         dword ptr [ebp-4],edx
 00497EAB    mov         edi,eax
 00497EAD    lea         esi,[ebp-8]
 00497EB0    xor         eax,eax
 00497EB2    push        ebp
 00497EB3    push        498361
 00497EB8    push        dword ptr fs:[eax]
 00497EBB    mov         dword ptr fs:[eax],esp
 00497EBE    mov         eax,dword ptr [ebp-4]
 00497EC1    mov         eax,dword ptr [eax+14]
 00497EC4    mov         dword ptr [esi],eax
 00497EC6    cmp         dword ptr [esi],0
>00497EC9    je          0049834B
 00497ECF    mov         eax,dword ptr [esi]
 00497ED1    movzx       eax,word ptr [eax]
 00497ED4    cmp         eax,0A358
>00497ED9    jg          00497F2E
>00497EDB    je          004980EF
 00497EE1    cmp         eax,0A351
>00497EE6    jg          00497F0E
>00497EE8    je          00497FF0
 00497EEE    sub         eax,30
>00497EF1    je          00497F7F
 00497EF7    dec         eax
>00497EF8    je          00497FA5
 00497EFE    sub         eax,0A2CF
>00497F03    je          00497FC4
>00497F09    jmp         0049833B
 00497F0E    sub         eax,0A353
>00497F13    je          00498321
 00497F19    dec         eax
>00497F1A    je          004980B1
 00497F20    sub         eax,2
>00497F23    je          004980D0
>00497F29    jmp         0049833B
 00497F2E    add         eax,0FFFF5CA6
 00497F33    cmp         eax,0E
>00497F36    ja          0049833B
 00497F3C    jmp         dword ptr [eax*4+497F43]
 00497F3C    dd          0049810E
 00497F3C    dd          0049833B
 00497F3C    dd          0049812D
 00497F3C    dd          0049833B
 00497F3C    dd          0049833B
 00497F3C    dd          0049833B
 00497F3C    dd          0049814C
 00497F3C    dd          0049833B
 00497F3C    dd          004981AB
 00497F3C    dd          0049833B
 00497F3C    dd          0049820A
 00497F3C    dd          0049833B
 00497F3C    dd          00498269
 00497F3C    dd          0049833B
 00497F3C    dd          004982C5
 00497F7F    mov         edx,dword ptr [esi]
 00497F81    mov         eax,edi
 00497F83    call        0049C1DC
 00497F88    mov         eax,dword ptr [esi]
 00497F8A    mov         eax,dword ptr [eax+0C]
 00497F8D    fild        word ptr [eax]
 00497F8F    fdiv        dword ptr ds:[498370];100:Single
 00497F95    fstp        dword ptr [ebx+4]
 00497F98    wait
 00497F99    mov         eax,esi
 00497F9B    call        004974CC
>00497FA0    jmp         0049833B
 00497FA5    mov         edx,dword ptr [esi]
 00497FA7    mov         eax,edi
 00497FA9    call        0049C1DC
 00497FAE    mov         eax,dword ptr [esi]
 00497FB0    mov         eax,dword ptr [eax+0C]
 00497FB3    mov         eax,dword ptr [eax]
 00497FB5    mov         dword ptr [ebx+4],eax
 00497FB8    mov         eax,esi
 00497FBA    call        004974CC
>00497FBF    jmp         0049833B
 00497FC4    mov         edx,dword ptr [esi]
 00497FC6    mov         eax,edi
 00497FC8    call        0049C1DC
 00497FCD    lea         edx,[ebp-0C]
 00497FD0    mov         eax,dword ptr [esi]
 00497FD2    mov         eax,dword ptr [eax+0C]
 00497FD5    call        StrPas
 00497FDA    mov         edx,dword ptr [ebp-0C]
 00497FDD    mov         eax,ebx
 00497FDF    call        @LStrAsg
 00497FE4    mov         eax,esi
 00497FE6    call        004974CC
>00497FEB    jmp         0049833B
 00497FF0    mov         edx,dword ptr [esi]
 00497FF2    mov         eax,edi
 00497FF4    call        0049C1DC
 00497FF9    mov         eax,dword ptr [esi]
 00497FFB    mov         eax,dword ptr [eax+0C]
 00497FFE    mov         ax,word ptr [eax]
 00498001    test        al,1
>00498003    je          0049801B
 00498005    test        al,10
>00498007    je          00498012
 00498009    mov         dword ptr [ebx+8],1
>00498010    jmp         00498020
 00498012    mov         dword ptr [ebx+8],2
>00498019    jmp         00498020
 0049801B    xor         eax,eax
 0049801D    mov         dword ptr [ebx+8],eax
 00498020    mov         eax,dword ptr [esi]
 00498022    mov         eax,dword ptr [eax+0C]
 00498025    test        byte ptr [eax+1],1
 00498029    setne       al
 0049802C    mov         byte ptr [ebx+0C],al
 0049802F    mov         eax,dword ptr [esi]
 00498031    mov         eax,dword ptr [eax+0C]
 00498034    test        byte ptr [eax],20
>00498037    je          00498042
 00498039    mov         dword ptr [ebx+10],1
>00498040    jmp         00498047
 00498042    xor         eax,eax
 00498044    mov         dword ptr [ebx+10],eax
 00498047    mov         eax,dword ptr [esi]
 00498049    mov         eax,dword ptr [eax+0C]
 0049804C    test        byte ptr [eax],2
 0049804F    setne       al
 00498052    mov         byte ptr [ebx+18],al
 00498055    mov         eax,dword ptr [esi]
 00498057    mov         eax,dword ptr [eax+0C]
 0049805A    test        byte ptr [eax],8
 0049805D    setne       al
 00498060    mov         byte ptr [ebx+19],al
 00498063    mov         eax,dword ptr [esi]
 00498065    mov         eax,dword ptr [eax+0C]
 00498068    mov         ax,word ptr [eax]
 0049806B    test        al,80
>0049806D    je          00498085
 0049806F    test        al,40
>00498071    je          0049807C
 00498073    mov         dword ptr [ebx+30],3
>0049807A    jmp         004980A5
 0049807C    mov         dword ptr [ebx+30],2
>00498083    jmp         004980A5
 00498085    test        ah,2
>00498088    je          00498093
 0049808A    mov         dword ptr [ebx+30],4
>00498091    jmp         004980A5
 00498093    test        al,40
>00498095    je          004980A0
 00498097    mov         dword ptr [ebx+30],1
>0049809E    jmp         004980A5
 004980A0    xor         eax,eax
 004980A2    mov         dword ptr [ebx+30],eax
 004980A5    mov         eax,esi
 004980A7    call        004974CC
>004980AC    jmp         0049833B
 004980B1    mov         edx,dword ptr [esi]
 004980B3    mov         eax,edi
 004980B5    call        0049C1DC
 004980BA    mov         eax,dword ptr [esi]
 004980BC    mov         eax,dword ptr [eax+0C]
 004980BF    mov         eax,dword ptr [eax]
 004980C1    mov         dword ptr [ebx+1C],eax
 004980C4    mov         eax,esi
 004980C6    call        004974CC
>004980CB    jmp         0049833B
 004980D0    mov         edx,dword ptr [esi]
 004980D2    mov         eax,edi
 004980D4    call        0049C1DC
 004980D9    mov         eax,dword ptr [esi]
 004980DB    mov         eax,dword ptr [eax+0C]
 004980DE    mov         eax,dword ptr [eax]
 004980E0    mov         dword ptr [ebx+20],eax
 004980E3    mov         eax,esi
 004980E5    call        004974CC
>004980EA    jmp         0049833B
 004980EF    mov         edx,dword ptr [esi]
 004980F1    mov         eax,edi
 004980F3    call        0049C1DC
 004980F8    mov         eax,dword ptr [esi]
 004980FA    mov         eax,dword ptr [eax+0C]
 004980FD    mov         eax,dword ptr [eax]
 004980FF    mov         dword ptr [ebx+24],eax
 00498102    mov         eax,esi
 00498104    call        004974CC
>00498109    jmp         0049833B
 0049810E    mov         edx,dword ptr [esi]
 00498110    mov         eax,edi
 00498112    call        0049C1DC
 00498117    mov         eax,dword ptr [esi]
 00498119    mov         eax,dword ptr [eax+0C]
 0049811C    mov         eax,dword ptr [eax]
 0049811E    mov         dword ptr [ebx+28],eax
 00498121    mov         eax,esi
 00498123    call        004974CC
>00498128    jmp         0049833B
 0049812D    mov         edx,dword ptr [esi]
 0049812F    mov         eax,edi
 00498131    call        0049C1DC
 00498136    mov         eax,dword ptr [esi]
 00498138    mov         eax,dword ptr [eax+0C]
 0049813B    mov         eax,dword ptr [eax]
 0049813D    mov         dword ptr [ebx+2C],eax
 00498140    mov         eax,esi
 00498142    call        004974CC
>00498147    jmp         0049833B
 0049814C    mov         edx,dword ptr [esi]
 0049814E    mov         eax,edi
 00498150    call        0049C1DC
 00498155    mov         eax,dword ptr [esi]
 00498157    mov         eax,dword ptr [eax+0C]
 0049815A    movzx       eax,byte ptr [eax]
 0049815D    mov         dword ptr [ebp-10],eax
 00498160    fild        dword ptr [ebp-10]
 00498163    fdiv        dword ptr ds:[498374];255:Single
 00498169    fstp        dword ptr [ebx+34]
 0049816C    wait
 0049816D    mov         eax,dword ptr [esi]
 0049816F    mov         eax,dword ptr [eax+0C]
 00498172    movzx       eax,byte ptr [eax+1]
 00498176    mov         dword ptr [ebp-10],eax
 00498179    fild        dword ptr [ebp-10]
 0049817C    fdiv        dword ptr ds:[498374];255:Single
 00498182    fstp        dword ptr [ebx+38]
 00498185    wait
 00498186    mov         eax,dword ptr [esi]
 00498188    mov         eax,dword ptr [eax+0C]
 0049818B    movzx       eax,byte ptr [eax+2]
 0049818F    mov         dword ptr [ebp-10],eax
 00498192    fild        dword ptr [ebp-10]
 00498195    fdiv        dword ptr ds:[498374];255:Single
 0049819B    fstp        dword ptr [ebx+3C]
 0049819E    wait
 0049819F    mov         eax,esi
 004981A1    call        004974CC
>004981A6    jmp         0049833B
 004981AB    mov         edx,dword ptr [esi]
 004981AD    mov         eax,edi
 004981AF    call        0049C1DC
 004981B4    mov         eax,dword ptr [esi]
 004981B6    mov         eax,dword ptr [eax+0C]
 004981B9    movzx       eax,byte ptr [eax]
 004981BC    mov         dword ptr [ebp-10],eax
 004981BF    fild        dword ptr [ebp-10]
 004981C2    fdiv        dword ptr ds:[498374];255:Single
 004981C8    fstp        dword ptr [ebx+40]
 004981CB    wait
 004981CC    mov         eax,dword ptr [esi]
 004981CE    mov         eax,dword ptr [eax+0C]
 004981D1    movzx       eax,byte ptr [eax+1]
 004981D5    mov         dword ptr [ebp-10],eax
 004981D8    fild        dword ptr [ebp-10]
 004981DB    fdiv        dword ptr ds:[498374];255:Single
 004981E1    fstp        dword ptr [ebx+44]
 004981E4    wait
 004981E5    mov         eax,dword ptr [esi]
 004981E7    mov         eax,dword ptr [eax+0C]
 004981EA    movzx       eax,byte ptr [eax+2]
 004981EE    mov         dword ptr [ebp-10],eax
 004981F1    fild        dword ptr [ebp-10]
 004981F4    fdiv        dword ptr ds:[498374];255:Single
 004981FA    fstp        dword ptr [ebx+48]
 004981FD    wait
 004981FE    mov         eax,esi
 00498200    call        004974CC
>00498205    jmp         0049833B
 0049820A    mov         edx,dword ptr [esi]
 0049820C    mov         eax,edi
 0049820E    call        0049C1DC
 00498213    mov         eax,dword ptr [esi]
 00498215    mov         eax,dword ptr [eax+0C]
 00498218    movzx       eax,byte ptr [eax]
 0049821B    mov         dword ptr [ebp-10],eax
 0049821E    fild        dword ptr [ebp-10]
 00498221    fdiv        dword ptr ds:[498374];255:Single
 00498227    fstp        dword ptr [ebx+4C]
 0049822A    wait
 0049822B    mov         eax,dword ptr [esi]
 0049822D    mov         eax,dword ptr [eax+0C]
 00498230    movzx       eax,byte ptr [eax+1]
 00498234    mov         dword ptr [ebp-10],eax
 00498237    fild        dword ptr [ebp-10]
 0049823A    fdiv        dword ptr ds:[498374];255:Single
 00498240    fstp        dword ptr [ebx+50]
 00498243    wait
 00498244    mov         eax,dword ptr [esi]
 00498246    mov         eax,dword ptr [eax+0C]
 00498249    movzx       eax,byte ptr [eax+2]
 0049824D    mov         dword ptr [ebp-10],eax
 00498250    fild        dword ptr [ebp-10]
 00498253    fdiv        dword ptr ds:[498374];255:Single
 00498259    fstp        dword ptr [ebx+54]
 0049825C    wait
 0049825D    mov         eax,esi
 0049825F    call        004974CC
>00498264    jmp         0049833B
 00498269    mov         edx,dword ptr [esi]
 0049826B    mov         eax,edi
 0049826D    call        0049C1DC
 00498272    mov         eax,dword ptr [esi]
 00498274    mov         eax,dword ptr [eax+0C]
 00498277    movzx       eax,byte ptr [eax]
 0049827A    mov         dword ptr [ebp-10],eax
 0049827D    fild        dword ptr [ebp-10]
 00498280    fdiv        dword ptr ds:[498374];255:Single
 00498286    fstp        dword ptr [ebx+58]
 00498289    wait
 0049828A    mov         eax,dword ptr [esi]
 0049828C    mov         eax,dword ptr [eax+0C]
 0049828F    movzx       eax,byte ptr [eax+1]
 00498293    mov         dword ptr [ebp-10],eax
 00498296    fild        dword ptr [ebp-10]
 00498299    fdiv        dword ptr ds:[498374];255:Single
 0049829F    fstp        dword ptr [ebx+5C]
 004982A2    wait
 004982A3    mov         eax,dword ptr [esi]
 004982A5    mov         eax,dword ptr [eax+0C]
 004982A8    movzx       eax,byte ptr [eax+2]
 004982AC    mov         dword ptr [ebp-10],eax
 004982AF    fild        dword ptr [ebp-10]
 004982B2    fdiv        dword ptr ds:[498374];255:Single
 004982B8    fstp        dword ptr [ebx+60]
 004982BB    wait
 004982BC    mov         eax,esi
 004982BE    call        004974CC
>004982C3    jmp         0049833B
 004982C5    mov         edx,dword ptr [esi]
 004982C7    mov         eax,edi
 004982C9    call        0049C1DC
 004982CE    mov         eax,dword ptr [esi]
 004982D0    mov         eax,dword ptr [eax+0C]
 004982D3    movzx       eax,byte ptr [eax]
 004982D6    mov         dword ptr [ebp-10],eax
 004982D9    fild        dword ptr [ebp-10]
 004982DC    fdiv        dword ptr ds:[498374];255:Single
 004982E2    fstp        dword ptr [ebx+64]
 004982E5    wait
 004982E6    mov         eax,dword ptr [esi]
 004982E8    mov         eax,dword ptr [eax+0C]
 004982EB    movzx       eax,byte ptr [eax+1]
 004982EF    mov         dword ptr [ebp-10],eax
 004982F2    fild        dword ptr [ebp-10]
 004982F5    fdiv        dword ptr ds:[498374];255:Single
 004982FB    fstp        dword ptr [ebx+68]
 004982FE    wait
 004982FF    mov         eax,dword ptr [esi]
 00498301    mov         eax,dword ptr [eax+0C]
 00498304    movzx       eax,byte ptr [eax+2]
 00498308    mov         dword ptr [ebp-10],eax
 0049830B    fild        dword ptr [ebp-10]
 0049830E    fdiv        dword ptr ds:[498374];255:Single
 00498314    fstp        dword ptr [ebx+6C]
 00498317    wait
 00498318    mov         eax,esi
 0049831A    call        004974CC
>0049831F    jmp         0049833B
 00498321    mov         edx,dword ptr [esi]
 00498323    mov         eax,edi
 00498325    call        0049C1DC
 0049832A    mov         eax,dword ptr [esi]
 0049832C    mov         eax,dword ptr [eax+0C]
 0049832F    mov         eax,dword ptr [eax]
 00498331    mov         dword ptr [ebx+14],eax
 00498334    mov         eax,esi
 00498336    call        004974CC
 0049833B    mov         eax,dword ptr [esi]
 0049833D    mov         eax,dword ptr [eax+10]
 00498340    mov         dword ptr [esi],eax
 00498342    cmp         dword ptr [esi],0
>00498345    jne         00497ECF
 0049834B    xor         eax,eax
 0049834D    pop         edx
 0049834E    pop         ecx
 0049834F    pop         ecx
 00498350    mov         dword ptr fs:[eax],edx
 00498353    push        498368
 00498358    lea         eax,[ebp-0C]
 0049835B    call        @LStrClr
 00498360    ret
>00498361    jmp         @HandleFinally
>00498366    jmp         00498358
 00498368    pop         edi
 00498369    pop         esi
 0049836A    pop         ebx
 0049836B    mov         esp,ebp
 0049836D    pop         ebp
 0049836E    ret
end;*}

//00498378
{*procedure sub_00498378(?:?; ?:?; ?:?);
begin
 00498378    push        ebp
 00498379    mov         ebp,esp
 0049837B    add         esp,0FFFFFFE0
 0049837E    push        ebx
 0049837F    push        esi
 00498380    push        edi
 00498381    xor         ebx,ebx
 00498383    mov         dword ptr [ebp-20],ebx
 00498386    mov         dword ptr [ebp-18],ebx
 00498389    mov         dword ptr [ebp-14],ebx
 0049838C    mov         ebx,ecx
 0049838E    mov         edi,edx
 00498390    mov         dword ptr [ebp-4],eax
 00498393    lea         esi,[ebp-8]
 00498396    xor         eax,eax
 00498398    push        ebp
 00498399    push        498E8D
 0049839E    push        dword ptr fs:[eax]
 004983A1    mov         dword ptr fs:[eax],esp
 004983A4    cmp         word ptr [edi],0AFFF
>004983A9    je          004983C0
 004983AB    lea         edx,[ebp-14]
 004983AE    mov         eax,[005AE724];^SResString25:TResStringRec
 004983B3    call        LoadStr
 004983B8    mov         eax,dword ptr [ebp-14]
 004983BB    call        00497334
 004983C0    mov         eax,ebx
 004983C2    call        00497C60
 004983C7    mov         eax,dword ptr [edi+14]
 004983CA    mov         dword ptr [esi],eax
 004983CC    cmp         dword ptr [esi],0
>004983CF    je          00498E6A
 004983D5    mov         eax,dword ptr [esi]
 004983D7    mov         ax,word ptr [eax]
 004983DA    mov         edx,eax
 004983DC    and         dx,0FF00
 004983E1    cmp         dx,8000
>004983E6    je          00498E5A
 004983EC    movzx       edx,ax
 004983EF    cmp         edx,0A250
>004983F5    jg          0049854F
>004983FB    je          00498895
 00498401    cmp         edx,0A084
>00498407    jg          004984B8
>0049840D    je          00498838
 00498413    cmp         edx,0A050
>00498419    jg          00498471
>0049841B    je          00498812
 00498421    cmp         edx,0A030
>00498427    jg          00498452
>00498429    je          00498686
 0049842F    sub         edx,0A000
>00498435    je          00498659
 0049843B    sub         edx,10
>0049843E    je          00498686
 00498444    sub         edx,10
>00498447    je          00498686
>0049844D    jmp         00498E45
 00498452    sub         edx,0A040
>00498458    je          004987D9
 0049845E    dec         edx
>0049845F    je          004987EC
 00498465    dec         edx
>00498466    je          00498E5A
>0049846C    jmp         00498E45
 00498471    cmp         edx,0A081
>00498477    jg          004984A0
>00498479    je          004988A7
 0049847F    sub         edx,0A052
>00498485    je          00498825
 0049848B    dec         edx
>0049848C    je          004987FF
 00498492    sub         edx,2D
>00498495    je          0049889E
>0049849B    jmp         00498E45
 004984A0    sub         edx,0A082
>004984A6    je          00498E5A
 004984AC    dec         edx
>004984AD    je          004988B0
>004984B3    jmp         00498E45
 004984B8    cmp         edx,0A100
>004984BE    jg          00498504
>004984C0    je          004988B9
 004984C6    add         edx,0FFFF5F7B
 004984CC    cmp         edx,9
>004984CF    ja          00498E45
 004984D5    jmp         dword ptr [edx*4+4984DC]
 004984D5    dd          0049884B
 004984D5    dd          00498E45
 004984D5    dd          0049886C
 004984D5    dd          004988DA
 004984D5    dd          00498E45
 004984D5    dd          0049885E
 004984D5    dd          00498E45
 004984D5    dd          004988E3
 004984D5    dd          00498E45
 004984D5    dd          00498855
 00498504    cmp         edx,0A220
>0049850A    jg          00498535
>0049850C    je          00498967
 00498512    sub         edx,0A200
>00498518    je          004988EC
 0049851E    sub         edx,4
>00498521    je          00498A58
 00498527    sub         edx,0C
>0049852A    je          0049893D
>00498530    jmp         00498E45
 00498535    sub         edx,0A230
>0049853B    je          004989EE
 00498541    sub         edx,10
>00498544    je          0049888C
>0049854A    jmp         00498E45
 0049854F    add         edx,0FFFF5CF0
 00498555    cmp         edx,3C
>00498558    ja          00498E45
 0049855E    jmp         dword ptr [edx*4+498565]
 0049855E    dd          0049897C
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498E45
 0049855E    dd          00498AD6
 0049855E    dd          00498B4C
 0049855E    dd          00498BC2
 0049855E    dd          00498E45
 0049855E    dd          00498C73
 0049855E    dd          00498CE9
 0049855E    dd          00498D5F
 0049855E    dd          00498E45
 0049855E    dd          00498DD5
 0049855E    dd          00498E45
 0049855E    dd          00498B11
 0049855E    dd          00498E45
 0049855E    dd          00498B87
 0049855E    dd          00498E45
 0049855E    dd          00498BFD
 0049855E    dd          00498E45
 0049855E    dd          00498CAE
 0049855E    dd          00498E45
 0049855E    dd          00498D24
 0049855E    dd          00498E45
 0049855E    dd          00498D9A
 0049855E    dd          00498E45
 0049855E    dd          00498E0D
 0049855E    dd          00498E45
 0049855E    dd          00498C38
 0049855E    dd          00498E45
 0049855E    dd          00498913
 0049855E    dd          00498E45
 0049855E    dd          00498A82
 0049855E    dd          00498AAC
 0049855E    dd          004988FE
 0049855E    dd          00498E45
 0049855E    dd          00498928
 0049855E    dd          00498E45
 0049855E    dd          00498952
 0049855E    dd          00498E45
 0049855E    dd          00498A43
 0049855E    dd          00498E45
 0049855E    dd          00498A97
 0049855E    dd          00498E45
 0049855E    dd          00498A6D
 0049855E    dd          00498E45
 0049855E    dd          00498AC1
 0049855E    dd          00498E45
 0049855E    dd          004989D9
 00498659    mov         edx,dword ptr [esi]
 0049865B    mov         eax,dword ptr [ebp-4]
 0049865E    call        0049C1DC
 00498663    lea         edx,[ebp-18]
 00498666    mov         eax,dword ptr [esi]
 00498668    mov         eax,dword ptr [eax+0C]
 0049866B    call        StrPas
 00498670    mov         edx,dword ptr [ebp-18]
 00498673    mov         eax,ebx
 00498675    call        @LStrAsg
 0049867A    mov         eax,esi
 0049867C    call        004974CC
>00498681    jmp         00498E5A
 00498686    sub         ax,0A020
>0049868A    je          00498694
 0049868C    sub         ax,10
>00498690    je          00498699
>00498692    jmp         0049869E
 00498694    lea         edi,[ebx+10]
>00498697    jmp         004986A1
 00498699    lea         edi,[ebx+1C]
>0049869C    jmp         004986A1
 0049869E    lea         edi,[ebx+4]
 004986A1    mov         dx,11
 004986A5    mov         eax,dword ptr [esi]
 004986A7    call        00497474
 004986AC    mov         dword ptr [ebp-10],eax
 004986AF    cmp         dword ptr [ebp-10],0
>004986B3    je          00498714
 004986B5    mov         edx,dword ptr [ebp-10]
 004986B8    mov         eax,dword ptr [ebp-4]
 004986BB    call        0049C1DC
 004986C0    mov         eax,dword ptr [ebp-10]
 004986C3    mov         eax,dword ptr [eax+0C]
 004986C6    movzx       eax,byte ptr [eax]
 004986C9    mov         dword ptr [ebp-1C],eax
 004986CC    fild        dword ptr [ebp-1C]
 004986CF    fdiv        dword ptr ds:[498E9C];255:Single
 004986D5    fstp        dword ptr [edi]
 004986D7    wait
 004986D8    mov         eax,dword ptr [ebp-10]
 004986DB    mov         eax,dword ptr [eax+0C]
 004986DE    movzx       eax,byte ptr [eax+1]
 004986E2    mov         dword ptr [ebp-1C],eax
 004986E5    fild        dword ptr [ebp-1C]
 004986E8    fdiv        dword ptr ds:[498E9C];255:Single
 004986EE    fstp        dword ptr [edi+4]
 004986F1    wait
 004986F2    mov         eax,dword ptr [ebp-10]
 004986F5    mov         eax,dword ptr [eax+0C]
 004986F8    movzx       eax,byte ptr [eax+2]
 004986FC    mov         dword ptr [ebp-1C],eax
 004986FF    fild        dword ptr [ebp-1C]
 00498702    fdiv        dword ptr ds:[498E9C];255:Single
 00498708    fstp        dword ptr [edi+8]
 0049870B    wait
 0049870C    lea         eax,[ebp-10]
 0049870F    call        004974CC
 00498714    mov         dx,10
 00498718    mov         eax,dword ptr [esi]
 0049871A    call        00497474
 0049871F    mov         dword ptr [ebp-10],eax
 00498722    cmp         dword ptr [ebp-10],0
>00498726    je          0049875D
 00498728    mov         edx,dword ptr [ebp-10]
 0049872B    mov         eax,dword ptr [ebp-4]
 0049872E    call        0049C1DC
 00498733    mov         eax,dword ptr [ebp-10]
 00498736    mov         eax,dword ptr [eax+0C]
 00498739    mov         eax,dword ptr [eax]
 0049873B    mov         dword ptr [edi],eax
 0049873D    mov         eax,dword ptr [ebp-10]
 00498740    mov         eax,dword ptr [eax+0C]
 00498743    mov         eax,dword ptr [eax+4]
 00498746    mov         dword ptr [edi+4],eax
 00498749    mov         eax,dword ptr [ebp-10]
 0049874C    mov         eax,dword ptr [eax+0C]
 0049874F    mov         eax,dword ptr [eax+8]
 00498752    mov         dword ptr [edi+8],eax
 00498755    lea         eax,[ebp-10]
 00498758    call        004974CC
 0049875D    mov         dx,12
 00498761    mov         eax,dword ptr [esi]
 00498763    call        00497474
 00498768    mov         dword ptr [ebp-10],eax
 0049876B    cmp         dword ptr [ebp-10],0
>0049876F    je          00498E5A
 00498775    mov         edx,dword ptr [ebp-10]
 00498778    mov         eax,dword ptr [ebp-4]
 0049877B    call        0049C1DC
 00498780    mov         eax,dword ptr [ebp-10]
 00498783    mov         eax,dword ptr [eax+0C]
 00498786    movzx       eax,byte ptr [eax]
 00498789    mov         dword ptr [ebp-1C],eax
 0049878C    fild        dword ptr [ebp-1C]
 0049878F    fdiv        dword ptr ds:[498E9C];255:Single
 00498795    fstp        dword ptr [edi]
 00498797    wait
 00498798    mov         eax,dword ptr [ebp-10]
 0049879B    mov         eax,dword ptr [eax+0C]
 0049879E    movzx       eax,byte ptr [eax+1]
 004987A2    mov         dword ptr [ebp-1C],eax
 004987A5    fild        dword ptr [ebp-1C]
 004987A8    fdiv        dword ptr ds:[498E9C];255:Single
 004987AE    fstp        dword ptr [edi+4]
 004987B1    wait
 004987B2    mov         eax,dword ptr [ebp-10]
 004987B5    mov         eax,dword ptr [eax+0C]
 004987B8    movzx       eax,byte ptr [eax+2]
 004987BC    mov         dword ptr [ebp-1C],eax
 004987BF    fild        dword ptr [ebp-1C]
 004987C2    fdiv        dword ptr ds:[498E9C];255:Single
 004987C8    fstp        dword ptr [edi+8]
 004987CB    wait
 004987CC    lea         eax,[ebp-10]
 004987CF    call        004974CC
>004987D4    jmp         00498E5A
 004987D9    mov         edx,dword ptr [esi]
 004987DB    mov         eax,dword ptr [ebp-4]
 004987DE    call        00497E04
 004987E3    fstp        dword ptr [ebx+28]
 004987E6    wait
>004987E7    jmp         00498E5A
 004987EC    mov         edx,dword ptr [esi]
 004987EE    mov         eax,dword ptr [ebp-4]
 004987F1    call        00497E04
 004987F6    fstp        dword ptr [ebx+2C]
 004987F9    wait
>004987FA    jmp         00498E5A
 004987FF    mov         edx,dword ptr [esi]
 00498801    mov         eax,dword ptr [ebp-4]
 00498804    call        00497E04
 00498809    fstp        dword ptr [ebx+30]
 0049880C    wait
>0049880D    jmp         00498E5A
 00498812    mov         edx,dword ptr [esi]
 00498814    mov         eax,dword ptr [ebp-4]
 00498817    call        00497E04
 0049881C    fstp        dword ptr [ebx+34]
 0049881F    wait
>00498820    jmp         00498E5A
 00498825    mov         edx,dword ptr [esi]
 00498827    mov         eax,dword ptr [ebp-4]
 0049882A    call        00497E04
 0049882F    fstp        dword ptr [ebx+38]
 00498832    wait
>00498833    jmp         00498E5A
 00498838    mov         edx,dword ptr [esi]
 0049883A    mov         eax,dword ptr [ebp-4]
 0049883D    call        00497E04
 00498842    fstp        dword ptr [ebx+3C]
 00498845    wait
>00498846    jmp         00498E5A
 0049884B    xor         eax,eax
 0049884D    mov         dword ptr [ebx+44],eax
>00498850    jmp         00498E5A
 00498855    mov         byte ptr [ebx+4E],1
>00498859    jmp         00498E5A
 0049885E    fld         dword ptr [ebx+34]
 00498861    fchs
 00498863    fstp        dword ptr [ebx+34]
 00498866    wait
>00498867    jmp         00498E5A
 0049886C    mov         edx,dword ptr [esi]
 0049886E    mov         eax,dword ptr [ebp-4]
 00498871    call        0049C1DC
 00498876    mov         eax,dword ptr [esi]
 00498878    mov         eax,dword ptr [eax+0C]
 0049887B    mov         eax,dword ptr [eax]
 0049887D    mov         dword ptr [ebx+40],eax
 00498880    mov         eax,esi
 00498882    call        004974CC
>00498887    jmp         00498E5A
 0049888C    mov         byte ptr [ebx+49],1
>00498890    jmp         00498E5A
 00498895    mov         byte ptr [ebx+48],1
>00498899    jmp         00498E5A
 0049889E    mov         byte ptr [ebx+4B],1
>004988A2    jmp         00498E5A
 004988A7    mov         byte ptr [ebx+4A],1
>004988AB    jmp         00498E5A
 004988B0    mov         byte ptr [ebx+4C],1
>004988B4    jmp         00498E5A
 004988B9    mov         edx,dword ptr [esi]
 004988BB    mov         eax,dword ptr [ebp-4]
 004988BE    call        0049C1DC
 004988C3    mov         eax,dword ptr [esi]
 004988C5    mov         eax,dword ptr [eax+0C]
 004988C8    movsx       eax,word ptr [eax]
 004988CB    mov         dword ptr [ebx+44],eax
 004988CE    mov         eax,esi
 004988D0    call        004974CC
>004988D5    jmp         00498E5A
 004988DA    mov         byte ptr [ebx+4F],1
>004988DE    jmp         00498E5A
 004988E3    mov         byte ptr [ebx+50],1
>004988E7    jmp         00498E5A
 004988EC    lea         ecx,[ebx+54]
 004988EF    mov         edx,dword ptr [esi]
 004988F1    mov         eax,dword ptr [ebp-4]
 004988F4    call        00497E98
>004988F9    jmp         00498E5A
 004988FE    lea         ecx,[ebx+0CC]
 00498904    mov         edx,dword ptr [esi]
 00498906    mov         eax,dword ptr [ebp-4]
 00498909    call        00497E98
>0049890E    jmp         00498E5A
 00498913    lea         ecx,[ebx+144]
 00498919    mov         edx,dword ptr [esi]
 0049891B    mov         eax,dword ptr [ebp-4]
 0049891E    call        00497E98
>00498923    jmp         00498E5A
 00498928    lea         ecx,[ebx+1BC]
 0049892E    mov         edx,dword ptr [esi]
 00498930    mov         eax,dword ptr [ebp-4]
 00498933    call        00497E98
>00498938    jmp         00498E5A
 0049893D    lea         ecx,[ebx+234]
 00498943    mov         edx,dword ptr [esi]
 00498945    mov         eax,dword ptr [ebp-4]
 00498948    call        00497E98
>0049894D    jmp         00498E5A
 00498952    lea         ecx,[ebx+2AC]
 00498958    mov         edx,dword ptr [esi]
 0049895A    mov         eax,dword ptr [ebp-4]
 0049895D    call        00497E98
>00498962    jmp         00498E5A
 00498967    lea         ecx,[ebx+6E4]
 0049896D    mov         edx,dword ptr [esi]
 0049896F    mov         eax,dword ptr [ebp-4]
 00498972    call        00497E98
>00498977    jmp         00498E5A
 0049897C    mov         edx,dword ptr [esi]
 0049897E    mov         eax,dword ptr [ebp-4]
 00498981    call        0049C1DC
 00498986    mov         byte ptr [ebx+75C],1
 0049898D    mov         eax,dword ptr [esi]
 0049898F    mov         eax,dword ptr [eax+0C]
 00498992    test        byte ptr [eax+2],9
 00498996    setne       al
 00498999    mov         byte ptr [ebx+760],al
 0049899F    mov         eax,dword ptr [esi]
 004989A1    mov         eax,dword ptr [eax+0C]
 004989A4    test        byte ptr [eax+2],11
 004989A8    setne       al
 004989AB    mov         byte ptr [ebx+761],al
 004989B1    mov         eax,dword ptr [esi]
 004989B3    mov         eax,dword ptr [eax+0C]
 004989B6    mov         eax,dword ptr [eax+4]
 004989B9    mov         dword ptr [ebx+764],eax
 004989BF    mov         eax,dword ptr [esi]
 004989C1    mov         eax,dword ptr [eax+0C]
 004989C4    mov         eax,dword ptr [eax+8]
 004989C7    mov         dword ptr [ebx+768],eax
 004989CD    mov         eax,esi
 004989CF    call        004974CC
>004989D4    jmp         00498E5A
 004989D9    lea         ecx,[ebx+76C]
 004989DF    mov         edx,dword ptr [esi]
 004989E1    mov         eax,dword ptr [ebp-4]
 004989E4    call        00497E98
>004989E9    jmp         00498E5A
 004989EE    lea         ecx,[ebx+324]
 004989F4    mov         edx,dword ptr [esi]
 004989F6    mov         eax,dword ptr [ebp-4]
 004989F9    call        00497E98
 004989FE    mov         dx,0A252
 00498A02    mov         eax,dword ptr [esi]
 00498A04    call        00497474
 00498A09    mov         dword ptr [ebp-0C],eax
 00498A0C    cmp         dword ptr [ebp-0C],0
>00498A10    je          00498E5A
 00498A16    mov         edx,dword ptr [ebp-0C]
 00498A19    mov         eax,dword ptr [ebp-4]
 00498A1C    call        0049C1DC
 00498A21    mov         eax,dword ptr [ebp-0C]
 00498A24    mov         eax,dword ptr [eax+0C]
 00498A27    fild        word ptr [eax]
 00498A29    fdiv        dword ptr ds:[498EA0];100:Single
 00498A2F    fstp        dword ptr [ebx+328]
 00498A35    wait
 00498A36    lea         eax,[ebp-0C]
 00498A39    call        004974CC
>00498A3E    jmp         00498E5A
 00498A43    lea         ecx,[ebx+39C]
 00498A49    mov         edx,dword ptr [esi]
 00498A4B    mov         eax,dword ptr [ebp-4]
 00498A4E    call        00497E98
>00498A53    jmp         00498E5A
 00498A58    lea         ecx,[ebx+414]
 00498A5E    mov         edx,dword ptr [esi]
 00498A60    mov         eax,dword ptr [ebp-4]
 00498A63    call        00497E98
>00498A68    jmp         00498E5A
 00498A6D    lea         ecx,[ebx+48C]
 00498A73    mov         edx,dword ptr [esi]
 00498A75    mov         eax,dword ptr [ebp-4]
 00498A78    call        00497E98
>00498A7D    jmp         00498E5A
 00498A82    lea         ecx,[ebx+504]
 00498A88    mov         edx,dword ptr [esi]
 00498A8A    mov         eax,dword ptr [ebp-4]
 00498A8D    call        00497E98
>00498A92    jmp         00498E5A
 00498A97    lea         ecx,[ebx+57C]
 00498A9D    mov         edx,dword ptr [esi]
 00498A9F    mov         eax,dword ptr [ebp-4]
 00498AA2    call        00497E98
>00498AA7    jmp         00498E5A
 00498AAC    lea         ecx,[ebx+5F4]
 00498AB2    mov         edx,dword ptr [esi]
 00498AB4    mov         eax,dword ptr [ebp-4]
 00498AB7    call        00497E98
>00498ABC    jmp         00498E5A
 00498AC1    lea         ecx,[ebx+66C]
 00498AC7    mov         edx,dword ptr [esi]
 00498AC9    mov         eax,dword ptr [ebp-4]
 00498ACC    call        00497E98
>00498AD1    jmp         00498E5A
 00498AD6    mov         edx,dword ptr [esi]
 00498AD8    mov         eax,dword ptr [ebp-4]
 00498ADB    call        0049C1DC
 00498AE0    mov         eax,dword ptr [esi]
 00498AE2    mov         eax,dword ptr [eax+0C]
 00498AE5    mov         eax,dword ptr [eax]
 00498AE7    mov         dword ptr [ebx+0C4],eax
 00498AED    mov         eax,dword ptr [esi]
 00498AEF    mov         eax,dword ptr [eax+0C]
 00498AF2    mov         eax,dword ptr [eax+4]
 00498AF5    mov         dword ptr [ebx+0C8],eax
 00498AFB    mov         eax,dword ptr [esi]
 00498AFD    mov         eax,dword ptr [eax+0C]
 00498B00    xor         edx,edx
 00498B02    mov         dword ptr [eax+4],edx
 00498B05    mov         eax,esi
 00498B07    call        004974CC
>00498B0C    jmp         00498E5A
 00498B11    mov         edx,dword ptr [esi]
 00498B13    mov         eax,dword ptr [ebp-4]
 00498B16    call        0049C1DC
 00498B1B    mov         eax,dword ptr [esi]
 00498B1D    mov         eax,dword ptr [eax+0C]
 00498B20    mov         eax,dword ptr [eax]
 00498B22    mov         dword ptr [ebx+13C],eax
 00498B28    mov         eax,dword ptr [esi]
 00498B2A    mov         eax,dword ptr [eax+0C]
 00498B2D    mov         eax,dword ptr [eax+4]
 00498B30    mov         dword ptr [ebx+140],eax
 00498B36    mov         eax,dword ptr [esi]
 00498B38    mov         eax,dword ptr [eax+0C]
 00498B3B    xor         edx,edx
 00498B3D    mov         dword ptr [eax+4],edx
 00498B40    mov         eax,esi
 00498B42    call        004974CC
>00498B47    jmp         00498E5A
 00498B4C    mov         edx,dword ptr [esi]
 00498B4E    mov         eax,dword ptr [ebp-4]
 00498B51    call        0049C1DC
 00498B56    mov         eax,dword ptr [esi]
 00498B58    mov         eax,dword ptr [eax+0C]
 00498B5B    mov         eax,dword ptr [eax]
 00498B5D    mov         dword ptr [ebx+1B4],eax
 00498B63    mov         eax,dword ptr [esi]
 00498B65    mov         eax,dword ptr [eax+0C]
 00498B68    mov         eax,dword ptr [eax+4]
 00498B6B    mov         dword ptr [ebx+1B8],eax
 00498B71    mov         eax,dword ptr [esi]
 00498B73    mov         eax,dword ptr [eax+0C]
 00498B76    xor         edx,edx
 00498B78    mov         dword ptr [eax+4],edx
 00498B7B    mov         eax,esi
 00498B7D    call        004974CC
>00498B82    jmp         00498E5A
 00498B87    mov         edx,dword ptr [esi]
 00498B89    mov         eax,dword ptr [ebp-4]
 00498B8C    call        0049C1DC
 00498B91    mov         eax,dword ptr [esi]
 00498B93    mov         eax,dword ptr [eax+0C]
 00498B96    mov         eax,dword ptr [eax]
 00498B98    mov         dword ptr [ebx+22C],eax
 00498B9E    mov         eax,dword ptr [esi]
 00498BA0    mov         eax,dword ptr [eax+0C]
 00498BA3    mov         eax,dword ptr [eax+4]
 00498BA6    mov         dword ptr [ebx+230],eax
 00498BAC    mov         eax,dword ptr [esi]
 00498BAE    mov         eax,dword ptr [eax+0C]
 00498BB1    xor         edx,edx
 00498BB3    mov         dword ptr [eax+4],edx
 00498BB6    mov         eax,esi
 00498BB8    call        004974CC
>00498BBD    jmp         00498E5A
 00498BC2    mov         edx,dword ptr [esi]
 00498BC4    mov         eax,dword ptr [ebp-4]
 00498BC7    call        0049C1DC
 00498BCC    mov         eax,dword ptr [esi]
 00498BCE    mov         eax,dword ptr [eax+0C]
 00498BD1    mov         eax,dword ptr [eax]
 00498BD3    mov         dword ptr [ebx+2A4],eax
 00498BD9    mov         eax,dword ptr [esi]
 00498BDB    mov         eax,dword ptr [eax+0C]
 00498BDE    mov         eax,dword ptr [eax+4]
 00498BE1    mov         dword ptr [ebx+2A8],eax
 00498BE7    mov         eax,dword ptr [esi]
 00498BE9    mov         eax,dword ptr [eax+0C]
 00498BEC    xor         edx,edx
 00498BEE    mov         dword ptr [eax+4],edx
 00498BF1    mov         eax,esi
 00498BF3    call        004974CC
>00498BF8    jmp         00498E5A
 00498BFD    mov         edx,dword ptr [esi]
 00498BFF    mov         eax,dword ptr [ebp-4]
 00498C02    call        0049C1DC
 00498C07    mov         eax,dword ptr [esi]
 00498C09    mov         eax,dword ptr [eax+0C]
 00498C0C    mov         eax,dword ptr [eax]
 00498C0E    mov         dword ptr [ebx+31C],eax
 00498C14    mov         eax,dword ptr [esi]
 00498C16    mov         eax,dword ptr [eax+0C]
 00498C19    mov         eax,dword ptr [eax+4]
 00498C1C    mov         dword ptr [ebx+320],eax
 00498C22    mov         eax,dword ptr [esi]
 00498C24    mov         eax,dword ptr [eax+0C]
 00498C27    xor         edx,edx
 00498C29    mov         dword ptr [eax+4],edx
 00498C2C    mov         eax,esi
 00498C2E    call        004974CC
>00498C33    jmp         00498E5A
 00498C38    mov         edx,dword ptr [esi]
 00498C3A    mov         eax,dword ptr [ebp-4]
 00498C3D    call        0049C1DC
 00498C42    mov         eax,dword ptr [esi]
 00498C44    mov         eax,dword ptr [eax+0C]
 00498C47    mov         eax,dword ptr [eax]
 00498C49    mov         dword ptr [ebx+7DC],eax
 00498C4F    mov         eax,dword ptr [esi]
 00498C51    mov         eax,dword ptr [eax+0C]
 00498C54    mov         eax,dword ptr [eax+4]
 00498C57    mov         dword ptr [ebx+7E0],eax
 00498C5D    mov         eax,dword ptr [esi]
 00498C5F    mov         eax,dword ptr [eax+0C]
 00498C62    xor         edx,edx
 00498C64    mov         dword ptr [eax+4],edx
 00498C67    mov         eax,esi
 00498C69    call        004974CC
>00498C6E    jmp         00498E5A
 00498C73    mov         edx,dword ptr [esi]
 00498C75    mov         eax,dword ptr [ebp-4]
 00498C78    call        0049C1DC
 00498C7D    mov         eax,dword ptr [esi]
 00498C7F    mov         eax,dword ptr [eax+0C]
 00498C82    mov         eax,dword ptr [eax]
 00498C84    mov         dword ptr [ebx+394],eax
 00498C8A    mov         eax,dword ptr [esi]
 00498C8C    mov         eax,dword ptr [eax+0C]
 00498C8F    mov         eax,dword ptr [eax+4]
 00498C92    mov         dword ptr [ebx+398],eax
 00498C98    mov         eax,dword ptr [esi]
 00498C9A    mov         eax,dword ptr [eax+0C]
 00498C9D    xor         edx,edx
 00498C9F    mov         dword ptr [eax+4],edx
 00498CA2    mov         eax,esi
 00498CA4    call        004974CC
>00498CA9    jmp         00498E5A
 00498CAE    mov         edx,dword ptr [esi]
 00498CB0    mov         eax,dword ptr [ebp-4]
 00498CB3    call        0049C1DC
 00498CB8    mov         eax,dword ptr [esi]
 00498CBA    mov         eax,dword ptr [eax+0C]
 00498CBD    mov         eax,dword ptr [eax]
 00498CBF    mov         dword ptr [ebx+40C],eax
 00498CC5    mov         eax,dword ptr [esi]
 00498CC7    mov         eax,dword ptr [eax+0C]
 00498CCA    mov         eax,dword ptr [eax+4]
 00498CCD    mov         dword ptr [ebx+410],eax
 00498CD3    mov         eax,dword ptr [esi]
 00498CD5    mov         eax,dword ptr [eax+0C]
 00498CD8    xor         edx,edx
 00498CDA    mov         dword ptr [eax+4],edx
 00498CDD    mov         eax,esi
 00498CDF    call        004974CC
>00498CE4    jmp         00498E5A
 00498CE9    mov         edx,dword ptr [esi]
 00498CEB    mov         eax,dword ptr [ebp-4]
 00498CEE    call        0049C1DC
 00498CF3    mov         eax,dword ptr [esi]
 00498CF5    mov         eax,dword ptr [eax+0C]
 00498CF8    mov         eax,dword ptr [eax]
 00498CFA    mov         dword ptr [ebx+484],eax
 00498D00    mov         eax,dword ptr [esi]
 00498D02    mov         eax,dword ptr [eax+0C]
 00498D05    mov         eax,dword ptr [eax+4]
 00498D08    mov         dword ptr [ebx+488],eax
 00498D0E    mov         eax,dword ptr [esi]
 00498D10    mov         eax,dword ptr [eax+0C]
 00498D13    xor         edx,edx
 00498D15    mov         dword ptr [eax+4],edx
 00498D18    mov         eax,esi
 00498D1A    call        004974CC
>00498D1F    jmp         00498E5A
 00498D24    mov         edx,dword ptr [esi]
 00498D26    mov         eax,dword ptr [ebp-4]
 00498D29    call        0049C1DC
 00498D2E    mov         eax,dword ptr [esi]
 00498D30    mov         eax,dword ptr [eax+0C]
 00498D33    mov         eax,dword ptr [eax]
 00498D35    mov         dword ptr [ebx+4FC],eax
 00498D3B    mov         eax,dword ptr [esi]
 00498D3D    mov         eax,dword ptr [eax+0C]
 00498D40    mov         eax,dword ptr [eax+4]
 00498D43    mov         dword ptr [ebx+500],eax
 00498D49    mov         eax,dword ptr [esi]
 00498D4B    mov         eax,dword ptr [eax+0C]
 00498D4E    xor         edx,edx
 00498D50    mov         dword ptr [eax+4],edx
 00498D53    mov         eax,esi
 00498D55    call        004974CC
>00498D5A    jmp         00498E5A
 00498D5F    mov         edx,dword ptr [esi]
 00498D61    mov         eax,dword ptr [ebp-4]
 00498D64    call        0049C1DC
 00498D69    mov         eax,dword ptr [esi]
 00498D6B    mov         eax,dword ptr [eax+0C]
 00498D6E    mov         eax,dword ptr [eax]
 00498D70    mov         dword ptr [ebx+574],eax
 00498D76    mov         eax,dword ptr [esi]
 00498D78    mov         eax,dword ptr [eax+0C]
 00498D7B    mov         eax,dword ptr [eax+4]
 00498D7E    mov         dword ptr [ebx+578],eax
 00498D84    mov         eax,dword ptr [esi]
 00498D86    mov         eax,dword ptr [eax+0C]
 00498D89    xor         edx,edx
 00498D8B    mov         dword ptr [eax+4],edx
 00498D8E    mov         eax,esi
 00498D90    call        004974CC
>00498D95    jmp         00498E5A
 00498D9A    mov         edx,dword ptr [esi]
 00498D9C    mov         eax,dword ptr [ebp-4]
 00498D9F    call        0049C1DC
 00498DA4    mov         eax,dword ptr [esi]
 00498DA6    mov         eax,dword ptr [eax+0C]
 00498DA9    mov         eax,dword ptr [eax]
 00498DAB    mov         dword ptr [ebx+5EC],eax
 00498DB1    mov         eax,dword ptr [esi]
 00498DB3    mov         eax,dword ptr [eax+0C]
 00498DB6    mov         eax,dword ptr [eax+4]
 00498DB9    mov         dword ptr [ebx+5F0],eax
 00498DBF    mov         eax,dword ptr [esi]
 00498DC1    mov         eax,dword ptr [eax+0C]
 00498DC4    xor         edx,edx
 00498DC6    mov         dword ptr [eax+4],edx
 00498DC9    mov         eax,esi
 00498DCB    call        004974CC
>00498DD0    jmp         00498E5A
 00498DD5    mov         edx,dword ptr [esi]
 00498DD7    mov         eax,dword ptr [ebp-4]
 00498DDA    call        0049C1DC
 00498DDF    mov         eax,dword ptr [esi]
 00498DE1    mov         eax,dword ptr [eax+0C]
 00498DE4    mov         eax,dword ptr [eax]
 00498DE6    mov         dword ptr [ebx+664],eax
 00498DEC    mov         eax,dword ptr [esi]
 00498DEE    mov         eax,dword ptr [eax+0C]
 00498DF1    mov         eax,dword ptr [eax+4]
 00498DF4    mov         dword ptr [ebx+668],eax
 00498DFA    mov         eax,dword ptr [esi]
 00498DFC    mov         eax,dword ptr [eax+0C]
 00498DFF    xor         edx,edx
 00498E01    mov         dword ptr [eax+4],edx
 00498E04    mov         eax,esi
 00498E06    call        004974CC
>00498E0B    jmp         00498E5A
 00498E0D    mov         edx,dword ptr [esi]
 00498E0F    mov         eax,dword ptr [ebp-4]
 00498E12    call        0049C1DC
 00498E17    mov         eax,dword ptr [esi]
 00498E19    mov         eax,dword ptr [eax+0C]
 00498E1C    mov         eax,dword ptr [eax]
 00498E1E    mov         dword ptr [ebx+6DC],eax
 00498E24    mov         eax,dword ptr [esi]
 00498E26    mov         eax,dword ptr [eax+0C]
 00498E29    mov         eax,dword ptr [eax+4]
 00498E2C    mov         dword ptr [ebx+6E0],eax
 00498E32    mov         eax,dword ptr [esi]
 00498E34    mov         eax,dword ptr [eax+0C]
 00498E37    xor         edx,edx
 00498E39    mov         dword ptr [eax+4],edx
 00498E3C    mov         eax,esi
 00498E3E    call        004974CC
>00498E43    jmp         00498E5A
 00498E45    lea         edx,[ebp-20]
 00498E48    mov         eax,[005AE724];^SResString25:TResStringRec
 00498E4D    call        LoadStr
 00498E52    mov         eax,dword ptr [ebp-20]
 00498E55    call        00497334
 00498E5A    mov         eax,dword ptr [esi]
 00498E5C    mov         eax,dword ptr [eax+10]
 00498E5F    mov         dword ptr [esi],eax
 00498E61    cmp         dword ptr [esi],0
>00498E64    jne         004983D5
 00498E6A    xor         eax,eax
 00498E6C    pop         edx
 00498E6D    pop         ecx
 00498E6E    pop         ecx
 00498E6F    mov         dword ptr fs:[eax],edx
 00498E72    push        498E94
 00498E77    lea         eax,[ebp-20]
 00498E7A    call        @LStrClr
 00498E7F    lea         eax,[ebp-18]
 00498E82    mov         edx,2
 00498E87    call        @LStrArrayClr
 00498E8C    ret
>00498E8D    jmp         @HandleFinally
>00498E92    jmp         00498E77
 00498E94    pop         edi
 00498E95    pop         esi
 00498E96    pop         ebx
 00498E97    mov         esp,ebp
 00498E99    pop         ebp
 00498E9A    ret
end;*}

//00498EA4
{*function sub_00498EA4(?:?):?;
begin
 00498EA4    xor         edx,edx
 00498EA6    movzx       eax,ax
 00498EA9    cmp         eax,2D2D
>00498EAE    jg          00498FA1
>00498EB4    je          00499082
 00498EBA    cmp         eax,1301
>00498EBF    jg          00498F3A
>00498EC1    je          00499112
 00498EC7    cmp         eax,1100
>00498ECC    jg          00498F0D
>00498ECE    je          004990FA
 00498ED4    cmp         eax,11
>00498ED7    jg          00498EF4
>00498ED9    je          004990A6
 00498EDF    sub         eax,1
>00498EE2    jb          0049907E
 00498EE8    dec         eax
>00498EE9    je          00499094
>00498EEF    jmp         00499153
 00498EF4    sub         eax,12
>00498EF7    je          004990AC
 00498EFD    sub         eax,0EE
>00498F02    je          004990C4
>00498F08    jmp         00499153
 00498F0D    sub         eax,1101
>00498F12    je          00499106
 00498F18    sub         eax,0FF
>00498F1D    je          004990F4
 00498F23    dec         eax
>00498F24    je          0049910C
 00498F2A    sub         eax,0FF
>00498F2F    je          00499100
>00498F35    jmp         00499153
 00498F3A    cmp         eax,1500
>00498F3F    jg          00498F72
>00498F41    je          004990E8
 00498F47    sub         eax,1400
>00498F4C    je          004990D0
 00498F52    sub         eax,20
>00498F55    je          004990D6
 00498F5B    sub         eax,30
>00498F5E    je          004990DC
 00498F64    sub         eax,10
>00498F67    je          004990E2
>00498F6D    jmp         00499153
 00498F72    sub         eax,2100
>00498F77    je          004990EE
 00498F7D    sub         eax,100
>00498F82    je          00499118
 00498F88    sub         eax,100
>00498F8D    je          00499124
 00498F93    sub         eax,2
>00498F96    je          0049911E
>00498F9C    jmp         00499153
 00498FA1    cmp         eax,4D4D
>00498FA6    jg          00499019
>00498FA8    je          0049908E
 00498FAE    cmp         eax,4000
>00498FB3    jg          00498FE8
>00498FB5    je          00499130
 00498FBB    sub         eax,2D3D
>00498FC0    je          00499088
 00498FC6    sub         eax,2C3
>00498FCB    je          0049912A
 00498FD1    sub         eax,0D3D
>00498FD6    je          0049909A
 00498FDC    dec         eax
>00498FDD    je          004990B2
>00498FE3    jmp         00499153
 00498FE8    sub         eax,4010
>00498FED    je          00499152
 00498FF3    sub         eax,0F0
>00498FF8    je          0049914E
 00498FFE    sub         eax,500
>00499003    je          0049914E
 00499009    sub         eax,100
>0049900E    je          0049914E
>00499014    jmp         00499153
 00499019    cmp         eax,0B002
>0049901E    jge         00499045
 00499020    sub         eax,7001
>00499025    je          004990CA
 0049902B    sub         eax,3FFE
>00499030    je          004990B8
 00499036    dec         eax
>00499037    je          004990A0
 00499039    dec         eax
>0049903A    je          00499148
>00499040    jmp         00499153
 00499045    add         eax,0FFFF4FFE
 0049904A    cmp         eax,8
>0049904D    ja          00499153
 00499053    jmp         dword ptr [eax*4+49905A]
 00499053    dd          00499142
 00499053    dd          00499142
 00499053    dd          00499142
 00499053    dd          00499153
 00499053    dd          00499142
 00499053    dd          00499142
 00499053    dd          00499136
 00499053    dd          0049913C
 00499053    dd          004990BE
 0049907E    inc         edx
 0049907F    mov         eax,edx
 00499081    ret
 00499082    add         edx,2
 00499085    mov         eax,edx
 00499087    ret
 00499088    add         edx,3
 0049908B    mov         eax,edx
 0049908D    ret
 0049908E    add         edx,4
 00499091    mov         eax,edx
 00499093    ret
 00499094    add         edx,5
 00499097    mov         eax,edx
 00499099    ret
 0049909A    add         edx,6
 0049909D    mov         eax,edx
 0049909F    ret
 004990A0    add         edx,7
 004990A3    mov         eax,edx
 004990A5    ret
 004990A6    add         edx,8
 004990A9    mov         eax,edx
 004990AB    ret
 004990AC    add         edx,9
 004990AF    mov         eax,edx
 004990B1    ret
 004990B2    add         edx,0A
 004990B5    mov         eax,edx
 004990B7    ret
 004990B8    add         edx,0B
 004990BB    mov         eax,edx
 004990BD    ret
 004990BE    add         edx,0C
 004990C1    mov         eax,edx
 004990C3    ret
 004990C4    add         edx,0D
 004990C7    mov         eax,edx
 004990C9    ret
 004990CA    add         edx,0E
 004990CD    mov         eax,edx
 004990CF    ret
 004990D0    add         edx,0F
 004990D3    mov         eax,edx
 004990D5    ret
 004990D6    add         edx,10
 004990D9    mov         eax,edx
 004990DB    ret
 004990DC    add         edx,11
 004990DF    mov         eax,edx
 004990E1    ret
 004990E2    add         edx,12
 004990E5    mov         eax,edx
 004990E7    ret
 004990E8    add         edx,13
 004990EB    mov         eax,edx
 004990ED    ret
 004990EE    add         edx,14
 004990F1    mov         eax,edx
 004990F3    ret
 004990F4    add         edx,15
 004990F7    mov         eax,edx
 004990F9    ret
 004990FA    add         edx,16
 004990FD    mov         eax,edx
 004990FF    ret
 00499100    add         edx,17
 00499103    mov         eax,edx
 00499105    ret
 00499106    add         edx,18
 00499109    mov         eax,edx
 0049910B    ret
 0049910C    add         edx,19
 0049910F    mov         eax,edx
 00499111    ret
 00499112    add         edx,1A
 00499115    mov         eax,edx
 00499117    ret
 00499118    add         edx,1B
 0049911B    mov         eax,edx
 0049911D    ret
 0049911E    add         edx,1C
 00499121    mov         eax,edx
 00499123    ret
 00499124    add         edx,1D
 00499127    mov         eax,edx
 00499129    ret
 0049912A    add         edx,1E
 0049912D    mov         eax,edx
 0049912F    ret
 00499130    add         edx,1F
 00499133    mov         eax,edx
 00499135    ret
 00499136    add         edx,20
 00499139    mov         eax,edx
 0049913B    ret
 0049913C    add         edx,21
 0049913F    mov         eax,edx
 00499141    ret
 00499142    add         edx,22
 00499145    mov         eax,edx
 00499147    ret
 00499148    add         edx,23
 0049914B    mov         eax,edx
 0049914D    ret
 0049914E    inc         edx
 0049914F    mov         eax,edx
 00499151    ret
 00499152    inc         edx
 00499153    mov         eax,edx
 00499155    ret
end;*}

//00499158
{*procedure sub_00499158(?:?; ?:?; ?:?; ?:?);
begin
 00499158    push        ebp
 00499159    mov         ebp,esp
 0049915B    add         esp,0FFFFFFF4
 0049915E    push        ebx
 0049915F    push        esi
 00499160    push        edi
 00499161    xor         ebx,ebx
 00499163    mov         dword ptr [ebp-4],ebx
 00499166    mov         edi,ecx
 00499168    mov         ebx,edx
 0049916A    mov         esi,eax
 0049916C    xor         eax,eax
 0049916E    push        ebp
 0049916F    push        4991DF
 00499174    push        dword ptr fs:[eax]
 00499177    mov         dword ptr fs:[eax],esp
 0049917A    mov         eax,dword ptr [ebp+8]
 0049917D    xor         ecx,ecx
 0049917F    mov         edx,7E4
 00499184    call        @FillChar
 00499189    mov         edx,ebx
 0049918B    mov         ecx,edi
 0049918D    mov         eax,esi
 0049918F    call        00497B58
 00499194    mov         ebx,eax
 00499196    test        ebx,ebx
>00499198    je          004991A8
 0049919A    mov         ecx,dword ptr [ebp+8]
 0049919D    mov         edx,ebx
 0049919F    mov         eax,esi
 004991A1    call        00498378
>004991A6    jmp         004991C9
 004991A8    lea         edx,[ebp-4]
 004991AB    mov         eax,[005AE348];^SResString29:TResStringRec
 004991B0    call        LoadStr
 004991B5    mov         eax,dword ptr [ebp-4]
 004991B8    mov         dword ptr [ebp-0C],edi
 004991BB    mov         byte ptr [ebp-8],0
 004991BF    lea         edx,[ebp-0C]
 004991C2    xor         ecx,ecx
 004991C4    call        00497388
 004991C9    xor         eax,eax
 004991CB    pop         edx
 004991CC    pop         ecx
 004991CD    pop         ecx
 004991CE    mov         dword ptr fs:[eax],edx
 004991D1    push        4991E6
 004991D6    lea         eax,[ebp-4]
 004991D9    call        @LStrClr
 004991DE    ret
>004991DF    jmp         @HandleFinally
>004991E4    jmp         004991D6
 004991E6    pop         edi
 004991E7    pop         esi
 004991E8    pop         ebx
 004991E9    mov         esp,ebp
 004991EB    pop         ebp
 004991EC    ret         4
end;*}

//004991F0
{*function sub_004991F0(?:?; ?:?):?;
begin
 004991F0    push        ebx
 004991F1    push        esi
 004991F2    push        edi
 004991F3    push        ebp
 004991F4    mov         edi,edx
 004991F6    mov         edx,edi
 004991F8    call        00497A3C
 004991FD    xor         ebp,ebp
 004991FF    mov         eax,dword ptr [edi+8]
 00499202    test        eax,eax
>00499204    je          0049922C
 00499206    mov         ebx,dword ptr [eax]
 00499208    dec         ebx
 00499209    test        ebx,ebx
>0049920B    jl          0049922C
 0049920D    inc         ebx
 0049920E    xor         esi,esi
 00499210    mov         eax,dword ptr [edi+8]
 00499213    mov         eax,dword ptr [eax+4]
 00499216    mov         eax,dword ptr [eax+esi*8+4]
 0049921A    mov         dx,4100
 0049921E    call        00497474
 00499223    test        eax,eax
>00499225    je          00499228
 00499227    inc         ebp
 00499228    inc         esi
 00499229    dec         ebx
>0049922A    jne         00499210
 0049922C    mov         eax,ebp
 0049922E    pop         ebp
 0049922F    pop         edi
 00499230    pop         esi
 00499231    pop         ebx
 00499232    ret
end;*}

//00499234
{*function sub_00499234:?;
begin
 00499234    push        ebx
 00499235    xor         ebx,ebx
 00499237    mov         dx,4130
 0049923B    call        00497474
 00499240    test        eax,eax
>00499242    je          00499255
 00499244    mov         dx,4130
 00499248    mov         eax,dword ptr [eax+10]
 0049924B    call        004974B0
 00499250    inc         ebx
 00499251    test        eax,eax
>00499253    jne         00499244
 00499255    mov         eax,ebx
 00499257    pop         ebx
 00499258    ret
end;*}

//0049925C
{*procedure sub_0049925C(?:?; ?:?);
begin
 0049925C    push        ebx
 0049925D    push        esi
 0049925E    push        edi
 0049925F    push        ebp
 00499260    mov         edi,edx
 00499262    mov         ebx,eax
 00499264    test        edi,1
>0049926A    je          0049927F
 0049926C    cmp         dword ptr [ebx+10],0
>00499270    je          0049927F
 00499272    mov         eax,dword ptr [ebx+10]
 00499275    call        @FreeMem
 0049927A    xor         eax,eax
 0049927C    mov         dword ptr [ebx+10],eax
 0049927F    test        edi,2
>00499285    je          0049929A
 00499287    cmp         dword ptr [ebx+20],0
>0049928B    je          0049929A
 0049928D    mov         eax,dword ptr [ebx+20]
 00499290    call        @FreeMem
 00499295    xor         eax,eax
 00499297    mov         dword ptr [ebx+20],eax
 0049929A    test        edi,4
>004992A0    je          004992BE
 004992A2    cmp         dword ptr [ebx+0B4],0
>004992A9    je          004992BE
 004992AB    mov         eax,dword ptr [ebx+0B4]
 004992B1    call        @FreeMem
 004992B6    xor         eax,eax
 004992B8    mov         dword ptr [ebx+0B4],eax
 004992BE    test        edi,8
>004992C4    je          0049932B
 004992C6    cmp         dword ptr [ebx+0DC],0
>004992CD    je          0049932B
 004992CF    movzx       ebp,word ptr [ebx+0DA]
 004992D6    dec         ebp
 004992D7    test        ebp,ebp
>004992D9    jl          00499318
 004992DB    inc         ebp
 004992DC    xor         esi,esi
 004992DE    lea         eax,[esi+esi*2]
 004992E1    mov         edx,dword ptr [ebx+0DC]
 004992E7    mov         eax,dword ptr [edx+eax*4+8]
 004992EB    test        eax,eax
>004992ED    je          00499314
 004992EF    call        @FreeMem
 004992F4    lea         eax,[esi+esi*2]
 004992F7    mov         edx,dword ptr [ebx+0DC]
 004992FD    xor         ecx,ecx
 004992FF    mov         dword ptr [edx+eax*4+8],ecx
 00499303    lea         eax,[esi+esi*2]
 00499306    mov         edx,dword ptr [ebx+0DC]
 0049930C    lea         eax,[edx+eax*4]
 0049930F    call        @LStrClr
 00499314    inc         esi
 00499315    dec         ebp
>00499316    jne         004992DE
 00499318    mov         eax,dword ptr [ebx+0DC]
 0049931E    call        @FreeMem
 00499323    xor         eax,eax
 00499325    mov         dword ptr [ebx+0DC],eax
 0049932B    test        edi,10
>00499331    je          0049934F
 00499333    cmp         dword ptr [ebx+0B8],0
>0049933A    je          0049934F
 0049933C    mov         eax,dword ptr [ebx+0B8]
 00499342    call        @FreeMem
 00499347    xor         eax,eax
 00499349    mov         dword ptr [ebx+0B8],eax
 0049934F    test        edi,20
>00499355    je          00499373
 00499357    cmp         dword ptr [ebx+0EC],0
>0049935E    je          00499373
 00499360    mov         eax,dword ptr [ebx+0EC]
 00499366    call        @FreeMem
 0049936B    xor         eax,eax
 0049936D    mov         dword ptr [ebx+0EC],eax
 00499373    test        edi,40
>00499379    je          0049938E
 0049937B    cmp         dword ptr [ebx+18],0
>0049937F    je          0049938E
 00499381    mov         eax,dword ptr [ebx+18]
 00499384    call        @FreeMem
 00499389    xor         eax,eax
 0049938B    mov         dword ptr [ebx+18],eax
 0049938E    pop         ebp
 0049938F    pop         edi
 00499390    pop         esi
 00499391    pop         ebx
 00499392    ret
end;*}

//00499394
{*procedure sub_00499394(?:?; ?:?);
begin
 00499394    push        ebp
 00499395    mov         ebp,esp
 00499397    mov         ecx,7
 0049939C    push        0
 0049939E    push        0
 004993A0    dec         ecx
>004993A1    jne         0049939C
 004993A3    push        ecx
 004993A4    push        ebx
 004993A5    push        esi
 004993A6    push        edi
 004993A7    mov         ebx,edx
 004993A9    mov         esi,eax
 004993AB    xor         eax,eax
 004993AD    push        ebp
 004993AE    push        499830
 004993B3    push        dword ptr fs:[eax]
 004993B6    mov         dword ptr fs:[eax],esp
 004993B9    test        esi,1
>004993BF    je          0049943A
 004993C1    mov         di,word ptr [ebx+0C]
 004993C5    test        di,di
>004993C8    jne         004993D8
 004993CA    mov         eax,ebx
 004993CC    mov         edx,1
 004993D1    call        0049925C
>004993D6    jmp         0049943A
 004993D8    cmp         dword ptr [ebx+10],0
>004993DC    jne         0049940C
 004993DE    movzx       eax,di
 004993E1    shl         eax,2
 004993E4    lea         eax,[eax+eax*2]
 004993E7    call        AllocMem
 004993EC    mov         dword ptr [ebx+10],eax
 004993EF    cmp         dword ptr [ebx+10],0
>004993F3    jne         0049943A
 004993F5    lea         edx,[ebp-8]
 004993F8    mov         eax,[005AE50C];^SResString24:TResStringRec
 004993FD    call        LoadStr
 00499402    mov         eax,dword ptr [ebp-8]
 00499405    call        00497334
>0049940A    jmp         0049943A
 0049940C    movzx       eax,di
 0049940F    mov         edx,eax
 00499411    shl         edx,2
 00499414    lea         edx,[edx+edx*2]
 00499417    lea         eax,[ebx+10]
 0049941A    call        @ReallocMem
 0049941F    cmp         dword ptr [ebx+10],0
>00499423    jne         0049943A
 00499425    lea         edx,[ebp-0C]
 00499428    mov         eax,[005AE50C];^SResString24:TResStringRec
 0049942D    call        LoadStr
 00499432    mov         eax,dword ptr [ebp-0C]
 00499435    call        00497334
 0049943A    test        esi,2
>00499440    je          004994EC
 00499446    mov         di,word ptr [ebx+1C]
 0049944A    test        di,di
>0049944D    jne         00499460
 0049944F    mov         eax,ebx
 00499451    mov         edx,2
 00499456    call        0049925C
>0049945B    jmp         004994EC
 00499460    cmp         dword ptr [ebx+20],0
>00499464    jne         004994C1
 00499466    movzx       eax,di
 00499469    shl         eax,3
 0049946C    call        AllocMem
 00499471    mov         dword ptr [ebx+20],eax
 00499474    cmp         dword ptr [ebx+20],0
>00499478    jne         0049948F
 0049947A    lea         edx,[ebp-10]
 0049947D    mov         eax,[005AE50C];^SResString24:TResStringRec
 00499482    call        LoadStr
 00499487    mov         eax,dword ptr [ebp-10]
 0049948A    call        00497334
 0049948F    movzx       edi,word ptr [ebx+1C]
 00499493    dec         edi
 00499494    test        edi,edi
>00499496    jl          004994EC
 00499498    inc         edi
 00499499    mov         dword ptr [ebp-4],0
 004994A0    mov         eax,dword ptr [ebx+20]
 004994A3    mov         edx,dword ptr [ebp-4]
 004994A6    mov         ecx,dword ptr ds:[5AE740];^gvar_005AD748
 004994AC    lea         edx,[eax+edx*8]
 004994AF    mov         eax,dword ptr [ecx]
 004994B1    mov         dword ptr [edx],eax
 004994B3    mov         eax,dword ptr [ecx+4]
 004994B6    mov         dword ptr [edx+4],eax
 004994B9    inc         dword ptr [ebp-4]
 004994BC    dec         edi
>004994BD    jne         004994A0
>004994BF    jmp         004994EC
 004994C1    movzx       eax,di
 004994C4    mov         edx,eax
 004994C6    shl         edx,3
 004994C9    lea         eax,[ebx+20]
 004994CC    call        @ReallocMem
 004994D1    cmp         dword ptr [ebx+20],0
>004994D5    jne         004994EC
 004994D7    lea         edx,[ebp-14]
 004994DA    mov         eax,[005AE50C];^SResString24:TResStringRec
 004994DF    call        LoadStr
 004994E4    mov         eax,dword ptr [ebp-14]
 004994E7    call        00497334
 004994EC    test        esi,4
>004994F2    je          004995B6
 004994F8    mov         di,word ptr [ebx+0B0]
 004994FF    test        di,di
>00499502    jne         00499515
 00499504    mov         eax,ebx
 00499506    mov         edx,4
 0049950B    call        0049925C
>00499510    jmp         004995B6
 00499515    cmp         dword ptr [ebx+0B4],0
>0049951C    jne         00499585
 0049951E    movzx       eax,di
 00499521    shl         eax,3
 00499524    call        AllocMem
 00499529    mov         dword ptr [ebx+0B4],eax
 0049952F    cmp         dword ptr [ebx+0B4],0
>00499536    jne         0049954D
 00499538    lea         edx,[ebp-18]
 0049953B    mov         eax,[005AE50C];^SResString24:TResStringRec
 00499540    call        LoadStr
 00499545    mov         eax,dword ptr [ebp-18]
 00499548    call        00497334
 0049954D    movzx       edi,word ptr [ebx+0B0]
 00499554    dec         edi
 00499555    test        edi,edi
>00499557    jl          004995B6
 00499559    inc         edi
 0049955A    mov         dword ptr [ebp-4],0
 00499561    mov         eax,dword ptr [ebx+0B4]
 00499567    mov         edx,dword ptr [ebp-4]
 0049956A    mov         ecx,dword ptr ds:[5AE338];^gvar_005AD750
 00499570    lea         edx,[eax+edx*8]
 00499573    mov         eax,dword ptr [ecx]
 00499575    mov         dword ptr [edx],eax
 00499577    mov         eax,dword ptr [ecx+4]
 0049957A    mov         dword ptr [edx+4],eax
 0049957D    inc         dword ptr [ebp-4]
 00499580    dec         edi
>00499581    jne         00499561
>00499583    jmp         004995B6
 00499585    movzx       eax,di
 00499588    mov         edx,eax
 0049958A    shl         edx,3
 0049958D    lea         eax,[ebx+0B4]
 00499593    call        @ReallocMem
 00499598    cmp         dword ptr [ebx+0B4],0
>0049959F    jne         004995B6
 004995A1    lea         edx,[ebp-1C]
 004995A4    mov         eax,[005AE50C];^SResString24:TResStringRec
 004995A9    call        LoadStr
 004995AE    mov         eax,dword ptr [ebp-1C]
 004995B1    call        00497334
 004995B6    test        esi,8
>004995BC    je          0049968A
 004995C2    mov         di,word ptr [ebx+0DA]
 004995C9    test        di,di
>004995CC    jne         004995DF
 004995CE    mov         eax,ebx
 004995D0    mov         edx,8
 004995D5    call        0049925C
>004995DA    jmp         0049968A
 004995DF    cmp         dword ptr [ebx+0DC],0
>004995E6    jne         00499656
 004995E8    movzx       eax,di
 004995EB    shl         eax,2
 004995EE    lea         eax,[eax+eax*2]
 004995F1    call        AllocMem
 004995F6    mov         dword ptr [ebx+0DC],eax
 004995FC    cmp         dword ptr [ebx+0DC],0
>00499603    jne         0049961A
 00499605    lea         edx,[ebp-20]
 00499608    mov         eax,[005AE50C];^SResString24:TResStringRec
 0049960D    call        LoadStr
 00499612    mov         eax,dword ptr [ebp-20]
 00499615    call        00497334
 0049961A    movzx       edi,word ptr [ebx+0DA]
 00499621    dec         edi
 00499622    test        edi,edi
>00499624    jl          0049968A
 00499626    inc         edi
 00499627    mov         dword ptr [ebp-4],0
 0049962E    mov         eax,dword ptr [ebp-4]
 00499631    lea         eax,[eax+eax*2]
 00499634    mov         edx,dword ptr [ebx+0DC]
 0049963A    lea         eax,[edx+eax*4]
 0049963D    mov         edx,dword ptr ds:[5AE568];^gvar_005AD784:?
 00499643    mov         ecx,dword ptr ds:[4970CC];TObjMat3DS
 00499649    call        @CopyRecord
 0049964E    inc         dword ptr [ebp-4]
 00499651    dec         edi
>00499652    jne         0049962E
>00499654    jmp         0049968A
 00499656    movzx       eax,di
 00499659    mov         edx,eax
 0049965B    shl         edx,2
 0049965E    lea         edx,[edx+edx*2]
 00499661    lea         eax,[ebx+0DC]
 00499667    call        @ReallocMem
 0049966C    cmp         dword ptr [ebx+0DC],0
>00499673    jne         0049968A
 00499675    lea         edx,[ebp-24]
 00499678    mov         eax,[005AE50C];^SResString24:TResStringRec
 0049967D    call        LoadStr
 00499682    mov         eax,dword ptr [ebp-24]
 00499685    call        00497334
 0049968A    test        esi,10
>00499690    je          0049971B
 00499696    mov         di,word ptr [ebx+0B0]
 0049969D    test        di,di
>004996A0    jne         004996B0
 004996A2    mov         eax,ebx
 004996A4    mov         edx,10
 004996A9    call        0049925C
>004996AE    jmp         0049971B
 004996B0    cmp         dword ptr [ebx+0B8],0
>004996B7    jne         004996EA
 004996B9    movzx       eax,di
 004996BC    shl         eax,2
 004996BF    call        AllocMem
 004996C4    mov         dword ptr [ebx+0B8],eax
 004996CA    cmp         dword ptr [ebx+0B8],0
>004996D1    jne         0049971B
 004996D3    lea         edx,[ebp-28]
 004996D6    mov         eax,[005AE50C];^SResString24:TResStringRec
 004996DB    call        LoadStr
 004996E0    mov         eax,dword ptr [ebp-28]
 004996E3    call        00497334
>004996E8    jmp         0049971B
 004996EA    movzx       eax,di
 004996ED    mov         edx,eax
 004996EF    shl         edx,2
 004996F2    lea         eax,[ebx+0B8]
 004996F8    call        @ReallocMem
 004996FD    cmp         dword ptr [ebx+0B8],0
>00499704    jne         0049971B
 00499706    lea         edx,[ebp-2C]
 00499709    mov         eax,[005AE50C];^SResString24:TResStringRec
 0049970E    call        LoadStr
 00499713    mov         eax,dword ptr [ebp-2C]
 00499716    call        00497334
 0049971B    test        esi,20
>00499721    je          0049979C
 00499723    mov         edi,dword ptr [ebx+0E4]
 00499729    test        edi,edi
>0049972B    jne         0049973B
 0049972D    mov         eax,ebx
 0049972F    mov         edx,20
 00499734    call        0049925C
>00499739    jmp         0049979C
 0049973B    cmp         dword ptr [ebx+0EC],0
>00499742    jne         00499771
 00499744    mov         eax,edi
 00499746    call        AllocMem
 0049974B    mov         dword ptr [ebx+0EC],eax
 00499751    cmp         dword ptr [ebx+0EC],0
>00499758    jne         0049979C
 0049975A    lea         edx,[ebp-30]
 0049975D    mov         eax,[005AE50C];^SResString24:TResStringRec
 00499762    call        LoadStr
 00499767    mov         eax,dword ptr [ebp-30]
 0049976A    call        00497334
>0049976F    jmp         0049979C
 00499771    mov         edx,edi
 00499773    lea         eax,[ebx+0EC]
 00499779    call        @ReallocMem
 0049977E    cmp         dword ptr [ebx+0EC],0
>00499785    jne         0049979C
 00499787    lea         edx,[ebp-34]
 0049978A    mov         eax,[005AE50C];^SResString24:TResStringRec
 0049978F    call        LoadStr
 00499794    mov         eax,dword ptr [ebp-34]
 00499797    call        00497334
 0049979C    test        esi,40
>004997A2    je          00499815
 004997A4    mov         si,word ptr [ebx+0C]
 004997A8    test        si,si
>004997AB    jne         004997BB
 004997AD    mov         eax,ebx
 004997AF    mov         edx,40
 004997B4    call        0049925C
>004997B9    jmp         00499815
 004997BB    cmp         dword ptr [ebx+18],0
>004997BF    jne         004997EB
 004997C1    movzx       eax,si
 004997C4    add         eax,eax
 004997C6    call        AllocMem
 004997CB    mov         edi,eax
 004997CD    mov         dword ptr [ebx+18],edi
 004997D0    test        edi,edi
>004997D2    jne         00499815
 004997D4    lea         edx,[ebp-38]
 004997D7    mov         eax,[005AE50C];^SResString24:TResStringRec
 004997DC    call        LoadStr
 004997E1    mov         eax,dword ptr [ebp-38]
 004997E4    call        00497334
>004997E9    jmp         00499815
 004997EB    movzx       eax,si
 004997EE    mov         edx,eax
 004997F0    add         edx,edx
 004997F2    lea         eax,[ebx+18]
 004997F5    call        @ReallocMem
 004997FA    cmp         dword ptr [ebx+18],0
>004997FE    jne         00499815
 00499800    lea         edx,[ebp-3C]
 00499803    mov         eax,[005AE50C];^SResString24:TResStringRec
 00499808    call        LoadStr
 0049980D    mov         eax,dword ptr [ebp-3C]
 00499810    call        00497334
 00499815    xor         eax,eax
 00499817    pop         edx
 00499818    pop         ecx
 00499819    pop         ecx
 0049981A    mov         dword ptr fs:[eax],edx
 0049981D    push        499837
 00499822    lea         eax,[ebp-3C]
 00499825    mov         edx,0E
 0049982A    call        @LStrArrayClr
 0049982F    ret
>00499830    jmp         @HandleFinally
>00499835    jmp         00499822
 00499837    pop         edi
 00499838    pop         esi
 00499839    pop         ebx
 0049983A    mov         esp,ebp
 0049983C    pop         ebp
 0049983D    ret
end;*}

//00499840
{*procedure sub_00499840(?:?; ?:?; ?:?; ?:?);
begin
 00499840    push        ebp
 00499841    mov         ebp,esp
 00499843    push        ecx
 00499844    push        ebx
 00499845    push        esi
 00499846    push        edi
 00499847    mov         esi,ecx
 00499849    mov         word ptr [ebp-2],dx
 0049984D    mov         edi,eax
 0049984F    mov         ebx,dword ptr [ebp+8]
 00499852    mov         eax,ebx
 00499854    xor         ecx,ecx
 00499856    mov         edx,0F0
 0049985B    call        @FillChar
 00499860    mov         word ptr [ebx+0C],di
 00499864    mov         dword ptr [ebx+2C],3F800000
 0049986B    mov         dword ptr [ebx+30],3F800000
 00499872    mov         dword ptr [ebx+40],3F800000
 00499879    mov         dword ptr [ebx+44],3F800000
 00499880    mov         dword ptr [ebx+54],3F800000
 00499887    mov         dword ptr [ebx+74],3F800000
 0049988E    mov         dword ptr [ebx+78],3F800000
 00499895    mov         dword ptr [ebx+7C],3F800000
 0049989C    mov         ax,word ptr [ebp-2]
 004998A0    mov         word ptr [ebx+0B0],ax
 004998A7    mov         edx,ebx
 004998A9    mov         eax,5
 004998AE    call        00499394
 004998B3    test        si,2
>004998B8    je          004998CA
 004998BA    mov         word ptr [ebx+1C],di
 004998BE    mov         edx,ebx
 004998C0    mov         eax,2
 004998C5    call        00499394
 004998CA    test        si,40
>004998CF    je          004998E1
 004998D1    mov         word ptr [ebx+14],di
 004998D5    mov         edx,ebx
 004998D7    mov         eax,40
 004998DC    call        00499394
 004998E1    test        si,10
>004998E6    je          004998F4
 004998E8    mov         edx,ebx
 004998EA    mov         eax,10
 004998EF    call        00499394
 004998F4    pop         edi
 004998F5    pop         esi
 004998F6    pop         ebx
 004998F7    pop         ecx
 004998F8    pop         ebp
 004998F9    ret         4
end;*}

//004998FC
procedure sub_004998FC(?:Pointer);
begin
{*
 004998FC    push        ebx
 004998FD    mov         ebx,eax
 004998FF    test        ebx,ebx
>00499901    je          0049991C
 00499903    mov         eax,ebx
 00499905    mov         edx,0FFFF
 0049990A    call        0049925C
 0049990F    mov         edx,dword ptr ds:[497100];TMesh3DS
 00499915    mov         eax,ebx
 00499917    call        @Dispose
 0049991C    pop         ebx
 0049991D    ret
*}
end;

//00499920
{*procedure sub_00499920(?:?; ?:?; ?:?);
begin
 00499920    push        ebp
 00499921    mov         ebp,esp
 00499923    add         esp,0FFFFFFD4
 00499926    push        ebx
 00499927    push        esi
 00499928    push        edi
 00499929    xor         ebx,ebx
 0049992B    mov         dword ptr [ebp-2C],ebx
 0049992E    mov         dword ptr [ebp-28],ebx
 00499931    mov         dword ptr [ebp-24],ebx
 00499934    mov         ebx,ecx
 00499936    mov         esi,edx
 00499938    mov         dword ptr [ebp-4],eax
 0049993B    lea         edi,[ebp-14]
 0049993E    xor         eax,eax
 00499940    push        ebp
 00499941    push        499EA7
 00499946    push        dword ptr fs:[eax]
 00499949    mov         dword ptr fs:[eax],esp
 0049994C    mov         dx,4100
 00499950    mov         eax,dword ptr [esi+14]
 00499953    call        004974B0
 00499958    mov         dword ptr [ebp-8],eax
 0049995B    cmp         dword ptr [ebp-8],0
>0049995F    jne         00499976
 00499961    lea         edx,[ebp-24]
 00499964    mov         eax,[005AE40C];^SResString28:TResStringRec
 00499969    call        LoadStr
 0049996E    mov         eax,dword ptr [ebp-24]
 00499971    call        00497334
 00499976    push        ebx
 00499977    xor         ecx,ecx
 00499979    xor         edx,edx
 0049997B    xor         eax,eax
 0049997D    call        00499840
 00499982    mov         edx,esi
 00499984    mov         eax,dword ptr [ebp-4]
 00499987    call        0049C1DC
 0049998C    lea         edx,[ebp-28]
 0049998F    mov         eax,dword ptr [esi+0C]
 00499992    call        StrPas
 00499997    mov         edx,dword ptr [ebp-28]
 0049999A    mov         eax,ebx
 0049999C    call        @LStrAsg
 004999A1    mov         eax,dword ptr [ebp-8]
 004999A4    mov         eax,dword ptr [eax+14]
 004999A7    mov         dword ptr [edi],eax
 004999A9    cmp         dword ptr [edi],0
>004999AC    je          00499DE9
 004999B2    mov         eax,dword ptr [edi]
 004999B4    movzx       eax,word ptr [eax]
 004999B7    cmp         eax,4160
>004999BC    jg          004999E5
>004999BE    je          00499C88
 004999C4    sub         eax,4110
>004999C9    je          00499A0E
 004999CB    dec         eax
>004999CC    je          00499A45
 004999CE    sub         eax,0F
>004999D1    je          00499A7C
 004999D7    sub         eax,20
>004999DA    je          00499C51
>004999E0    jmp         00499DD9
 004999E5    sub         eax,4165
>004999EA    je          00499DBB
 004999F0    sub         eax,0B
>004999F3    je          00499CB6
 004999F9    sub         eax,11
>004999FC    je          00499D55
 00499A02    dec         eax
>00499A03    je          00499D83
>00499A09    jmp         00499DD9
 00499A0E    mov         edx,dword ptr [edi]
 00499A10    mov         eax,dword ptr [ebp-4]
 00499A13    call        0049C1DC
 00499A18    mov         eax,dword ptr [edi]
 00499A1A    mov         eax,dword ptr [eax+0C]
 00499A1D    mov         ax,word ptr [eax]
 00499A20    mov         word ptr [ebx+0C],ax
 00499A24    mov         eax,dword ptr [edi]
 00499A26    mov         eax,dword ptr [eax+0C]
 00499A29    mov         eax,dword ptr [eax+4]
 00499A2C    mov         dword ptr [ebx+10],eax
 00499A2F    mov         eax,dword ptr [edi]
 00499A31    mov         eax,dword ptr [eax+0C]
 00499A34    xor         edx,edx
 00499A36    mov         dword ptr [eax+4],edx
 00499A39    mov         eax,edi
 00499A3B    call        004974CC
>00499A40    jmp         00499DD9
 00499A45    mov         edx,dword ptr [edi]
 00499A47    mov         eax,dword ptr [ebp-4]
 00499A4A    call        0049C1DC
 00499A4F    mov         eax,dword ptr [edi]
 00499A51    mov         eax,dword ptr [eax+0C]
 00499A54    mov         ax,word ptr [eax]
 00499A57    mov         word ptr [ebx+14],ax
 00499A5B    mov         eax,dword ptr [edi]
 00499A5D    mov         eax,dword ptr [eax+0C]
 00499A60    mov         eax,dword ptr [eax+4]
 00499A63    mov         dword ptr [ebx+18],eax
 00499A66    mov         eax,dword ptr [edi]
 00499A68    mov         eax,dword ptr [eax+0C]
 00499A6B    xor         edx,edx
 00499A6D    mov         dword ptr [eax+4],edx
 00499A70    mov         eax,edi
 00499A72    call        004974CC
>00499A77    jmp         00499DD9
 00499A7C    mov         edx,dword ptr [edi]
 00499A7E    mov         eax,dword ptr [ebp-4]
 00499A81    call        0049C1DC
 00499A86    mov         eax,dword ptr [edi]
 00499A88    mov         eax,dword ptr [eax+0C]
 00499A8B    mov         ax,word ptr [eax]
 00499A8E    mov         word ptr [ebx+0B0],ax
 00499A95    mov         eax,dword ptr [edi]
 00499A97    mov         eax,dword ptr [eax+0C]
 00499A9A    mov         eax,dword ptr [eax+4]
 00499A9D    mov         dword ptr [ebx+0B4],eax
 00499AA3    mov         eax,dword ptr [edi]
 00499AA5    mov         eax,dword ptr [eax+0C]
 00499AA8    xor         edx,edx
 00499AAA    mov         dword ptr [eax+4],edx
 00499AAD    mov         eax,dword ptr [edi]
 00499AAF    cmp         dword ptr [eax+14],0
>00499AB3    je          00499C45
 00499AB9    mov         eax,dword ptr [edi]
 00499ABB    mov         dword ptr [ebp-0C],eax
 00499ABE    mov         dx,4130
 00499AC2    mov         eax,dword ptr [ebp-0C]
 00499AC5    call        00497474
 00499ACA    mov         dword ptr [ebp-10],eax
 00499ACD    cmp         dword ptr [ebp-10],0
>00499AD1    je          00499B9F
 00499AD7    mov         eax,dword ptr [ebp-10]
 00499ADA    call        00499234
 00499ADF    mov         word ptr [ebx+0DA],ax
 00499AE6    movzx       eax,word ptr [ebx+0DA]
 00499AED    shl         eax,2
 00499AF0    lea         eax,[eax+eax*2]
 00499AF3    call        AllocMem
 00499AF8    mov         dword ptr [ebx+0DC],eax
 00499AFE    movzx       eax,word ptr [ebx+0DA]
 00499B05    dec         eax
 00499B06    test        eax,eax
>00499B08    jl          00499B9F
 00499B0E    inc         eax
 00499B0F    mov         dword ptr [ebp-1C],eax
 00499B12    mov         dword ptr [ebp-18],0
 00499B19    mov         edx,dword ptr [ebp-10]
 00499B1C    mov         eax,dword ptr [ebp-4]
 00499B1F    call        0049C1DC
 00499B24    mov         eax,dword ptr [ebp-18]
 00499B27    lea         eax,[eax+eax*2]
 00499B2A    mov         edx,dword ptr [ebx+0DC]
 00499B30    lea         eax,[edx+eax*4]
 00499B33    mov         edx,dword ptr [ebp-10]
 00499B36    mov         edx,dword ptr [edx+0C]
 00499B39    mov         edx,dword ptr [edx]
 00499B3B    call        @LStrAsg
 00499B40    mov         edx,dword ptr [ebp-18]
 00499B43    lea         edx,[edx+edx*2]
 00499B46    mov         eax,dword ptr [ebx+0DC]
 00499B4C    mov         ecx,dword ptr [ebp-10]
 00499B4F    mov         ecx,dword ptr [ecx+0C]
 00499B52    mov         cx,word ptr [ecx+4]
 00499B56    mov         word ptr [eax+edx*4+4],cx
 00499B5B    mov         edx,dword ptr [ebp-18]
 00499B5E    lea         edx,[edx+edx*2]
 00499B61    mov         ecx,dword ptr [ebp-10]
 00499B64    mov         ecx,dword ptr [ecx+0C]
 00499B67    mov         ecx,dword ptr [ecx+8]
 00499B6A    mov         dword ptr [eax+edx*4+8],ecx
 00499B6E    mov         eax,dword ptr [ebp-10]
 00499B71    mov         eax,dword ptr [eax+0C]
 00499B74    xor         edx,edx
 00499B76    mov         dword ptr [eax+8],edx
 00499B79    lea         eax,[ebp-10]
 00499B7C    call        004974CC
 00499B81    mov         eax,dword ptr [ebp-10]
 00499B84    mov         eax,dword ptr [eax+10]
 00499B87    mov         dx,4130
 00499B8B    call        004974B0
 00499B90    mov         dword ptr [ebp-10],eax
 00499B93    inc         dword ptr [ebp-18]
 00499B96    dec         dword ptr [ebp-1C]
>00499B99    jne         00499B19
 00499B9F    mov         eax,dword ptr [ebp-0C]
 00499BA2    mov         eax,dword ptr [eax+14]
 00499BA5    mov         dx,4150
 00499BA9    call        004974B0
 00499BAE    mov         dword ptr [ebp-10],eax
 00499BB1    cmp         dword ptr [ebp-10],0
>00499BB5    je          00499BE4
 00499BB7    mov         edx,dword ptr [ebp-10]
 00499BBA    mov         eax,dword ptr [ebp-4]
 00499BBD    call        0049C1DC
 00499BC2    mov         eax,dword ptr [ebp-10]
 00499BC5    mov         eax,dword ptr [eax+0C]
 00499BC8    mov         eax,dword ptr [eax+4]
 00499BCB    mov         dword ptr [ebx+0B8],eax
 00499BD1    mov         eax,dword ptr [ebp-10]
 00499BD4    mov         eax,dword ptr [eax+0C]
 00499BD7    xor         edx,edx
 00499BD9    mov         dword ptr [eax+4],edx
 00499BDC    lea         eax,[ebp-10]
 00499BDF    call        004974CC
 00499BE4    mov         eax,dword ptr [ebp-0C]
 00499BE7    mov         eax,dword ptr [eax+14]
 00499BEA    mov         dx,4190
 00499BEE    call        004974B0
 00499BF3    mov         dword ptr [ebp-10],eax
 00499BF6    cmp         dword ptr [ebp-10],0
>00499BFA    je          00499C45
 00499BFC    mov         edx,dword ptr [ebp-10]
 00499BFF    mov         eax,dword ptr [ebp-4]
 00499C02    call        0049C1DC
 00499C07    xor         eax,eax
 00499C09    mov         dword ptr [ebp-18],eax
 00499C0C    lea         eax,[ebx+0C0]
 00499C12    mov         dword ptr [ebp-20],eax
 00499C15    mov         eax,dword ptr [ebp-20]
 00499C18    mov         edx,dword ptr [ebp-10]
 00499C1B    mov         edx,dword ptr [edx+0C]
 00499C1E    mov         ecx,dword ptr [ebp-18]
 00499C21    mov         edx,dword ptr [edx+ecx*4]
 00499C24    call        @LStrAsg
 00499C29    inc         dword ptr [ebp-18]
 00499C2C    add         dword ptr [ebp-20],4
 00499C30    cmp         dword ptr [ebp-18],6
>00499C34    jne         00499C15
 00499C36    mov         byte ptr [ebx+0BC],1
 00499C3D    lea         eax,[ebp-10]
 00499C40    call        004974CC
 00499C45    mov         eax,edi
 00499C47    call        004974CC
>00499C4C    jmp         00499DD9
 00499C51    mov         edx,dword ptr [edi]
 00499C53    mov         eax,dword ptr [ebp-4]
 00499C56    call        0049C1DC
 00499C5B    mov         eax,dword ptr [edi]
 00499C5D    mov         eax,dword ptr [eax+0C]
 00499C60    mov         ax,word ptr [eax]
 00499C63    mov         word ptr [ebx+1C],ax
 00499C67    mov         eax,dword ptr [edi]
 00499C69    mov         eax,dword ptr [eax+0C]
 00499C6C    mov         eax,dword ptr [eax+4]
 00499C6F    mov         dword ptr [ebx+20],eax
 00499C72    mov         eax,dword ptr [edi]
 00499C74    mov         eax,dword ptr [eax+0C]
 00499C77    xor         edx,edx
 00499C79    mov         dword ptr [eax+4],edx
 00499C7C    mov         eax,edi
 00499C7E    call        004974CC
>00499C83    jmp         00499DD9
 00499C88    mov         edx,dword ptr [edi]
 00499C8A    mov         eax,dword ptr [ebp-4]
 00499C8D    call        0049C1DC
 00499C92    mov         eax,dword ptr [edi]
 00499C94    mov         eax,dword ptr [eax+0C]
 00499C97    push        esi
 00499C98    push        edi
 00499C99    mov         esi,eax
 00499C9B    lea         edi,[ebx+80]
 00499CA1    mov         ecx,0C
 00499CA6    rep movs    dword ptr [edi],dword ptr [esi]
 00499CA8    pop         edi
 00499CA9    pop         esi
 00499CAA    mov         eax,edi
 00499CAC    call        004974CC
>00499CB1    jmp         00499DD9
 00499CB6    mov         byte ptr [ebx+24],1
 00499CBA    mov         edx,dword ptr [edi]
 00499CBC    mov         eax,dword ptr [ebp-4]
 00499CBF    call        0049C1DC
 00499CC4    mov         eax,dword ptr [edi]
 00499CC6    mov         eax,dword ptr [eax+0C]
 00499CC9    mov         ax,word ptr [eax]
 00499CCC    mov         word ptr [ebx+28],ax
 00499CD0    mov         eax,dword ptr [edi]
 00499CD2    mov         eax,dword ptr [eax+0C]
 00499CD5    mov         eax,dword ptr [eax+4]
 00499CD8    mov         dword ptr [ebx+2C],eax
 00499CDB    mov         eax,dword ptr [edi]
 00499CDD    mov         eax,dword ptr [eax+0C]
 00499CE0    mov         eax,dword ptr [eax+8]
 00499CE3    mov         dword ptr [ebx+30],eax
 00499CE6    mov         eax,dword ptr [edi]
 00499CE8    mov         eax,dword ptr [eax+0C]
 00499CEB    mov         eax,dword ptr [eax+0C]
 00499CEE    mov         dword ptr [ebx+34],eax
 00499CF1    mov         eax,dword ptr [edi]
 00499CF3    mov         eax,dword ptr [eax+0C]
 00499CF6    mov         eax,dword ptr [eax+10]
 00499CF9    mov         dword ptr [ebx+38],eax
 00499CFC    mov         eax,dword ptr [edi]
 00499CFE    mov         eax,dword ptr [eax+0C]
 00499D01    mov         eax,dword ptr [eax+14]
 00499D04    mov         dword ptr [ebx+3C],eax
 00499D07    mov         eax,dword ptr [edi]
 00499D09    mov         eax,dword ptr [eax+0C]
 00499D0C    mov         eax,dword ptr [eax+18]
 00499D0F    mov         dword ptr [ebx+40],eax
 00499D12    mov         eax,dword ptr [edi]
 00499D14    mov         eax,dword ptr [eax+0C]
 00499D17    push        esi
 00499D18    push        edi
 00499D19    lea         esi,[eax+1C]
 00499D1C    lea         edi,[ebx+44]
 00499D1F    mov         ecx,0C
 00499D24    rep movs    dword ptr [edi],dword ptr [esi]
 00499D26    pop         edi
 00499D27    pop         esi
 00499D28    mov         eax,dword ptr [edi]
 00499D2A    mov         eax,dword ptr [eax+0C]
 00499D2D    mov         eax,dword ptr [eax+4C]
 00499D30    mov         dword ptr [ebx+74],eax
 00499D33    mov         eax,dword ptr [edi]
 00499D35    mov         eax,dword ptr [eax+0C]
 00499D38    mov         eax,dword ptr [eax+50]
 00499D3B    mov         dword ptr [ebx+78],eax
 00499D3E    mov         eax,dword ptr [edi]
 00499D40    mov         eax,dword ptr [eax+0C]
 00499D43    mov         eax,dword ptr [eax+54]
 00499D46    mov         dword ptr [ebx+7C],eax
 00499D49    mov         eax,edi
 00499D4B    call        004974CC
>00499D50    jmp         00499DD9
 00499D55    mov         edx,dword ptr [edi]
 00499D57    mov         eax,dword ptr [ebp-4]
 00499D5A    call        0049C1DC
 00499D5F    lea         edx,[ebp-2C]
 00499D62    mov         eax,dword ptr [edi]
 00499D64    mov         eax,dword ptr [eax+0C]
 00499D67    call        StrPas
 00499D6C    mov         edx,dword ptr [ebp-2C]
 00499D6F    lea         eax,[ebx+0E8]
 00499D75    call        @LStrAsg
 00499D7A    mov         eax,edi
 00499D7C    call        004974CC
>00499D81    jmp         00499DD9
 00499D83    mov         edx,dword ptr [edi]
 00499D85    mov         eax,dword ptr [ebp-4]
 00499D88    call        0049C1DC
 00499D8D    mov         eax,dword ptr [edi]
 00499D8F    mov         eax,dword ptr [eax+0C]
 00499D92    mov         eax,dword ptr [eax]
 00499D94    mov         dword ptr [ebx+0E4],eax
 00499D9A    mov         eax,dword ptr [edi]
 00499D9C    mov         eax,dword ptr [eax+0C]
 00499D9F    mov         eax,dword ptr [eax+4]
 00499DA2    mov         dword ptr [ebx+0EC],eax
 00499DA8    mov         eax,dword ptr [edi]
 00499DAA    mov         eax,dword ptr [eax+0C]
 00499DAD    xor         edx,edx
 00499DAF    mov         dword ptr [eax+4],edx
 00499DB2    mov         eax,edi
 00499DB4    call        004974CC
>00499DB9    jmp         00499DD9
 00499DBB    mov         edx,dword ptr [edi]
 00499DBD    mov         eax,dword ptr [ebp-4]
 00499DC0    call        0049C1DC
 00499DC5    mov         eax,dword ptr [edi]
 00499DC7    mov         eax,dword ptr [eax+0C]
 00499DCA    mov         al,byte ptr [eax]
 00499DCC    mov         byte ptr [ebx+0D8],al
 00499DD2    mov         eax,edi
 00499DD4    call        004974CC
 00499DD9    mov         eax,dword ptr [edi]
 00499DDB    mov         eax,dword ptr [eax+10]
 00499DDE    mov         dword ptr [edi],eax
 00499DE0    cmp         dword ptr [edi],0
>00499DE3    jne         004999B2
 00499DE9    mov         dx,4010
 00499DED    mov         eax,dword ptr [esi+14]
 00499DF0    call        004974B0
 00499DF5    test        eax,eax
 00499DF7    setne       al
 00499DFA    mov         byte ptr [ebx+4],al
 00499DFD    mov         dx,4011
 00499E01    mov         eax,dword ptr [esi+14]
 00499E04    call        004974B0
 00499E09    test        eax,eax
 00499E0B    setne       al
 00499E0E    mov         byte ptr [ebx+5],al
 00499E11    mov         dx,4012
 00499E15    mov         eax,dword ptr [esi+14]
 00499E18    call        004974B0
 00499E1D    test        eax,eax
 00499E1F    setne       al
 00499E22    mov         byte ptr [ebx+7],al
 00499E25    mov         dx,4013
 00499E29    mov         eax,dword ptr [esi+14]
 00499E2C    call        004974B0
 00499E31    test        eax,eax
 00499E33    setne       al
 00499E36    mov         byte ptr [ebx+6],al
 00499E39    mov         dx,4014
 00499E3D    mov         eax,dword ptr [esi+14]
 00499E40    call        004974B0
 00499E45    test        eax,eax
 00499E47    setne       al
 00499E4A    mov         byte ptr [ebx+8],al
 00499E4D    mov         dx,4016
 00499E51    mov         eax,dword ptr [esi+14]
 00499E54    call        004974B0
 00499E59    test        eax,eax
 00499E5B    setne       al
 00499E5E    mov         byte ptr [ebx+0A],al
 00499E61    mov         dx,4017
 00499E65    mov         eax,dword ptr [esi+14]
 00499E68    call        004974B0
 00499E6D    test        eax,eax
 00499E6F    setne       al
 00499E72    mov         byte ptr [ebx+9],al
 00499E75    mov         dx,4015
 00499E79    mov         eax,dword ptr [esi+14]
 00499E7C    call        004974B0
 00499E81    test        eax,eax
 00499E83    setne       al
 00499E86    mov         byte ptr [ebx+0E0],al
 00499E8C    xor         eax,eax
 00499E8E    pop         edx
 00499E8F    pop         ecx
 00499E90    pop         ecx
 00499E91    mov         dword ptr fs:[eax],edx
 00499E94    push        499EAE
 00499E99    lea         eax,[ebp-2C]
 00499E9C    mov         edx,3
 00499EA1    call        @LStrArrayClr
 00499EA6    ret
>00499EA7    jmp         @HandleFinally
>00499EAC    jmp         00499E99
 00499EAE    pop         edi
 00499EAF    pop         esi
 00499EB0    pop         ebx
 00499EB1    mov         esp,ebp
 00499EB3    pop         ebp
 00499EB4    ret
end;*}

//00499EB8
{*procedure sub_00499EB8(?:?; ?:?; ?:?; ?:?);
begin
 00499EB8    push        ebp
 00499EB9    mov         ebp,esp
 00499EBB    add         esp,0FFFFFFEC
 00499EBE    push        ebx
 00499EBF    push        esi
 00499EC0    push        edi
 00499EC1    xor         ebx,ebx
 00499EC3    mov         dword ptr [ebp-14],ebx
 00499EC6    mov         dword ptr [ebp-10],ebx
 00499EC9    mov         dword ptr [ebp-8],ecx
 00499ECC    mov         ebx,edx
 00499ECE    mov         dword ptr [ebp-4],eax
 00499ED1    xor         eax,eax
 00499ED3    push        ebp
 00499ED4    push        499FA3
 00499ED9    push        dword ptr fs:[eax]
 00499EDC    mov         dword ptr fs:[eax],esp
 00499EDF    mov         eax,dword ptr [ebp+8]
 00499EE2    xor         ecx,ecx
 00499EE4    mov         edx,0F0
 00499EE9    call        @FillChar
 00499EEE    cmp         dword ptr [ebx],0
>00499EF1    jne         00499F08
 00499EF3    lea         edx,[ebp-10]
 00499EF6    mov         eax,[005AE2D4];^SResString26:TResStringRec
 00499EFB    call        LoadStr
 00499F00    mov         eax,dword ptr [ebp-10]
 00499F03    call        00497334
 00499F08    mov         eax,dword ptr [ebx]
 00499F0A    mov         ax,word ptr [eax]
 00499F0D    cmp         ax,4D4D
>00499F11    je          00499F2E
 00499F13    cmp         ax,0C23D
>00499F17    je          00499F2E
 00499F19    lea         edx,[ebp-14]
 00499F1C    mov         eax,[005AE37C];^SResString27:TResStringRec
 00499F21    call        LoadStr
 00499F26    mov         eax,dword ptr [ebp-14]
 00499F29    call        00497334
 00499F2E    mov         edx,ebx
 00499F30    mov         eax,dword ptr [ebp-4]
 00499F33    call        00497A3C
 00499F38    xor         eax,eax
 00499F3A    mov         dword ptr [ebp-0C],eax
 00499F3D    mov         eax,dword ptr [ebx+8]
 00499F40    mov         esi,dword ptr [eax]
 00499F42    dec         esi
 00499F43    test        esi,esi
>00499F45    jl          00499F88
 00499F47    inc         esi
 00499F48    xor         edi,edi
 00499F4A    mov         eax,dword ptr [ebx+8]
 00499F4D    mov         eax,dword ptr [eax+4]
 00499F50    mov         eax,dword ptr [eax+edi*8+4]
 00499F54    mov         dx,4100
 00499F58    call        00497474
 00499F5D    test        eax,eax
>00499F5F    je          00499F84
 00499F61    inc         dword ptr [ebp-0C]
 00499F64    mov         eax,dword ptr [ebp-0C]
 00499F67    dec         eax
 00499F68    cmp         eax,dword ptr [ebp-8]
>00499F6B    jne         00499F84
 00499F6D    mov         eax,dword ptr [ebx+8]
 00499F70    mov         eax,dword ptr [eax+4]
 00499F73    mov         edx,dword ptr [eax+edi*8+4]
 00499F77    mov         ecx,dword ptr [ebp+8]
 00499F7A    mov         eax,dword ptr [ebp-4]
 00499F7D    call        00499920
>00499F82    jmp         00499F88
 00499F84    inc         edi
 00499F85    dec         esi
>00499F86    jne         00499F4A
 00499F88    xor         eax,eax
 00499F8A    pop         edx
 00499F8B    pop         ecx
 00499F8C    pop         ecx
 00499F8D    mov         dword ptr fs:[eax],edx
 00499F90    push        499FAA
 00499F95    lea         eax,[ebp-14]
 00499F98    mov         edx,2
 00499F9D    call        @LStrArrayClr
 00499FA2    ret
>00499FA3    jmp         @HandleFinally
>00499FA8    jmp         00499F95
 00499FAA    pop         edi
 00499FAB    pop         esi
 00499FAC    pop         ebx
 00499FAD    mov         esp,ebp
 00499FAF    pop         ebp
 00499FB0    ret         4
end;*}

//00499FB4
procedure sub_00499FB4(?:Pointer);
begin
{*
 00499FB4    push        ebx
 00499FB5    push        esi
 00499FB6    mov         ebx,eax
 00499FB8    mov         eax,dword ptr [ebx+30]
 00499FBB    call        TObject.Free
 00499FC0    xor         eax,eax
 00499FC2    mov         dword ptr [ebx+30],eax
 00499FC5    mov         esi,dword ptr [ebx+34]
 00499FC8    test        esi,esi
>00499FCA    je          00499FDC
 00499FCC    lea         eax,[esi+44]
 00499FCF    call        @LStrClr
 00499FD4    mov         eax,dword ptr [ebx+34]
 00499FD7    call        @FreeMem
 00499FDC    mov         edx,dword ptr ds:[497130];TLight3DS
 00499FE2    mov         eax,ebx
 00499FE4    call        @Dispose
 00499FE9    pop         esi
 00499FEA    pop         ebx
 00499FEB    ret
*}
end;

//00499FEC
procedure sub_00499FEC(?:Pointer);
begin
{*
 00499FEC    test        eax,eax
>00499FEE    je          00499FFB
 00499FF0    mov         edx,dword ptr ds:[497150];TCamera3DS
 00499FF6    call        @Dispose
 00499FFB    ret
*}
end;

//00499FFC
procedure sub_00499FFC(?:Pointer);
begin
{*
 00499FFC    push        ebx
 00499FFD    push        esi
 00499FFE    mov         esi,eax
 0049A000    test        esi,esi
>0049A002    je          0049A073
 0049A004    mov         ebx,esi
 0049A006    mov         eax,dword ptr [ebx+14]
 0049A009    test        eax,eax
>0049A00B    je          0049A012
 0049A00D    call        @FreeMem
 0049A012    mov         eax,dword ptr [ebx+18]
 0049A015    test        eax,eax
>0049A017    je          0049A01E
 0049A019    call        @FreeMem
 0049A01E    mov         eax,dword ptr [ebx+24]
 0049A021    test        eax,eax
>0049A023    je          0049A02A
 0049A025    call        @FreeMem
 0049A02A    mov         eax,dword ptr [ebx+28]
 0049A02D    test        eax,eax
>0049A02F    je          0049A036
 0049A031    call        @FreeMem
 0049A036    mov         eax,dword ptr [ebx+34]
 0049A039    test        eax,eax
>0049A03B    je          0049A042
 0049A03D    call        @FreeMem
 0049A042    mov         eax,dword ptr [ebx+38]
 0049A045    test        eax,eax
>0049A047    je          0049A04E
 0049A049    call        @FreeMem
 0049A04E    mov         eax,dword ptr [ebx+48]
 0049A051    test        eax,eax
>0049A053    je          0049A05A
 0049A055    call        @FreeMem
 0049A05A    mov         eax,dword ptr [ebx+4C]
 0049A05D    test        eax,eax
>0049A05F    je          0049A066
 0049A061    call        @FreeMem
 0049A066    mov         edx,dword ptr ds:[497170];TKFCamera3DS
 0049A06C    mov         eax,esi
 0049A06E    call        @Dispose
 0049A073    pop         esi
 0049A074    pop         ebx
 0049A075    ret
*}
end;

//0049A078
{*procedure sub_0049A078(?:?);
begin
 0049A078    push        ebx
 0049A079    push        esi
 0049A07A    mov         esi,eax
 0049A07C    test        esi,esi
>0049A07E    je          0049A0A6
 0049A080    mov         ebx,esi
 0049A082    mov         eax,dword ptr [ebx+0C]
 0049A085    test        eax,eax
>0049A087    je          0049A08E
 0049A089    call        @FreeMem
 0049A08E    mov         eax,dword ptr [ebx+10]
 0049A091    test        eax,eax
>0049A093    je          0049A09A
 0049A095    call        @FreeMem
 0049A09A    mov         edx,14
 0049A09F    mov         eax,esi
 0049A0A1    call        @FreeMem
 0049A0A6    pop         esi
 0049A0A7    pop         ebx
 0049A0A8    ret
end;*}

//0049A0AC
procedure sub_0049A0AC(?:Pointer);
begin
{*
 0049A0AC    push        ebx
 0049A0AD    push        esi
 0049A0AE    mov         esi,eax
 0049A0B0    test        esi,esi
>0049A0B2    je          0049A12F
 0049A0B4    mov         ebx,esi
 0049A0B6    mov         eax,dword ptr [ebx+3C]
 0049A0B9    test        eax,eax
>0049A0BB    je          0049A0C2
 0049A0BD    call        @FreeMem
 0049A0C2    mov         eax,dword ptr [ebx+40]
 0049A0C5    test        eax,eax
>0049A0C7    je          0049A0CE
 0049A0C9    call        @FreeMem
 0049A0CE    mov         eax,dword ptr [ebx+4C]
 0049A0D1    test        eax,eax
>0049A0D3    je          0049A0DA
 0049A0D5    call        @FreeMem
 0049A0DA    mov         eax,dword ptr [ebx+50]
 0049A0DD    test        eax,eax
>0049A0DF    je          0049A0E6
 0049A0E1    call        @FreeMem
 0049A0E6    mov         eax,dword ptr [ebx+5C]
 0049A0E9    test        eax,eax
>0049A0EB    je          0049A0F2
 0049A0ED    call        @FreeMem
 0049A0F2    mov         eax,dword ptr [ebx+60]
 0049A0F5    test        eax,eax
>0049A0F7    je          0049A0FE
 0049A0F9    call        @FreeMem
 0049A0FE    mov         eax,dword ptr [ebx+6C]
 0049A101    test        eax,eax
>0049A103    je          0049A10A
 0049A105    call        @FreeMem
 0049A10A    mov         eax,dword ptr [ebx+70]
 0049A10D    test        eax,eax
>0049A10F    je          0049A116
 0049A111    call        @FreeMem
 0049A116    mov         eax,dword ptr [ebx+7C]
 0049A119    test        eax,eax
>0049A11B    je          0049A122
 0049A11D    call        @FreeMem
 0049A122    mov         edx,dword ptr ds:[4971A4];TKFMesh3DS
 0049A128    mov         eax,esi
 0049A12A    call        @Dispose
 0049A12F    pop         esi
 0049A130    pop         ebx
 0049A131    ret
*}
end;

//0049A134
procedure sub_0049A134(?:Pointer);
begin
{*
 0049A134    push        ebx
 0049A135    push        esi
 0049A136    mov         esi,eax
 0049A138    test        esi,esi
>0049A13A    je          0049A17B
 0049A13C    mov         ebx,esi
 0049A13E    mov         eax,dword ptr [ebx+14]
 0049A141    test        eax,eax
>0049A143    je          0049A14A
 0049A145    call        @FreeMem
 0049A14A    mov         eax,dword ptr [ebx+18]
 0049A14D    test        eax,eax
>0049A14F    je          0049A156
 0049A151    call        @FreeMem
 0049A156    mov         eax,dword ptr [ebx+24]
 0049A159    test        eax,eax
>0049A15B    je          0049A162
 0049A15D    call        @FreeMem
 0049A162    mov         eax,dword ptr [ebx+28]
 0049A165    test        eax,eax
>0049A167    je          0049A16E
 0049A169    call        @FreeMem
 0049A16E    mov         edx,dword ptr ds:[4971D4];TKFOmni3DS
 0049A174    mov         eax,esi
 0049A176    call        @Dispose
 0049A17B    pop         esi
 0049A17C    pop         ebx
 0049A17D    ret
*}
end;

//0049A180
procedure sub_0049A180(?:Pointer);
begin
{*
 0049A180    push        ebx
 0049A181    push        esi
 0049A182    mov         esi,eax
 0049A184    test        esi,esi
>0049A186    je          0049A22B
 0049A18C    mov         ebx,esi
 0049A18E    mov         eax,dword ptr [ebx+14]
 0049A191    test        eax,eax
>0049A193    je          0049A19A
 0049A195    call        @FreeMem
 0049A19A    mov         eax,dword ptr [ebx+18]
 0049A19D    test        eax,eax
>0049A19F    je          0049A1A6
 0049A1A1    call        @FreeMem
 0049A1A6    mov         eax,dword ptr [ebx+24]
 0049A1A9    test        eax,eax
>0049A1AB    je          0049A1B2
 0049A1AD    call        @FreeMem
 0049A1B2    mov         eax,dword ptr [ebx+28]
 0049A1B5    test        eax,eax
>0049A1B7    je          0049A1BE
 0049A1B9    call        @FreeMem
 0049A1BE    mov         eax,dword ptr [ebx+34]
 0049A1C1    test        eax,eax
>0049A1C3    je          0049A1CA
 0049A1C5    call        @FreeMem
 0049A1CA    mov         eax,dword ptr [ebx+38]
 0049A1CD    test        eax,eax
>0049A1CF    je          0049A1D6
 0049A1D1    call        @FreeMem
 0049A1D6    mov         eax,dword ptr [ebx+44]
 0049A1D9    test        eax,eax
>0049A1DB    je          0049A1E2
 0049A1DD    call        @FreeMem
 0049A1E2    mov         eax,dword ptr [ebx+48]
 0049A1E5    test        eax,eax
>0049A1E7    je          0049A1EE
 0049A1E9    call        @FreeMem
 0049A1EE    mov         eax,dword ptr [ebx+54]
 0049A1F1    test        eax,eax
>0049A1F3    je          0049A1FA
 0049A1F5    call        @FreeMem
 0049A1FA    mov         eax,dword ptr [ebx+58]
 0049A1FD    test        eax,eax
>0049A1FF    je          0049A206
 0049A201    call        @FreeMem
 0049A206    mov         eax,dword ptr [ebx+68]
 0049A209    test        eax,eax
>0049A20B    je          0049A212
 0049A20D    call        @FreeMem
 0049A212    mov         eax,dword ptr [ebx+6C]
 0049A215    test        eax,eax
>0049A217    je          0049A21E
 0049A219    call        @FreeMem
 0049A21E    mov         edx,dword ptr ds:[4971FC];TKFSpot3DS
 0049A224    mov         eax,esi
 0049A226    call        @Dispose
 0049A22B    pop         esi
 0049A22C    pop         ebx
 0049A22D    ret
*}
end;

end.