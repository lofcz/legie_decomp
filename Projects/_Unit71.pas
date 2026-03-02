//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit71;

interface

uses
  SysUtils, Classes;

type
  TCubicSplineMatrix = array of ?;
//elSize = 10;
  TCubicSpline = class(TObject)
  public
    f4:TCubicSplineMatrix;//f4
    f8:TCubicSplineMatrix;//f8
    fC:TCubicSplineMatrix;//fC
    f10:TCubicSplineMatrix;//f10
    //constructor Create(?:?; ?:?; ?:?; ?:?);//0046584C
  end;
  .3 = array of ?;
//elSize = 4
//varType equivalent: varSingle;
  .4 = array of ?;
//elSize = 4
//varType equivalent: varSingle;
    //procedure sub_00465314(?:?; ?:Longint; ?:?; ?:?; ?:?);//00465314
    //procedure sub_00465590(?:?; ?:?; ?:?);//00465590
    //function sub_004657C8(?:?; ?:?; ?:?):?;//004657C8
    //procedure sub_004658F4(?:?; ?:?; ?:?; ?:?; ?:?);//004658F4

implementation

//00465314
{*procedure sub_00465314(?:?; ?:Longint; ?:?; ?:?; ?:?);
begin
 00465314    push        ebp
 00465315    mov         ebp,esp
 00465317    add         esp,0FFFFFFE4
 0046531A    push        ebx
 0046531B    push        esi
 0046531C    push        edi
 0046531D    xor         ebx,ebx
 0046531F    mov         dword ptr [ebp-10],ebx
 00465322    mov         dword ptr [ebp-14],ebx
 00465325    mov         dword ptr [ebp-18],ebx
 00465328    mov         dword ptr [ebp-0C],ecx
 0046532B    mov         dword ptr [ebp-8],edx
 0046532E    mov         dword ptr [ebp-4],eax
 00465331    xor         eax,eax
 00465333    push        ebp
 00465334    push        4654FB
 00465339    push        dword ptr fs:[eax]
 0046533C    mov         dword ptr fs:[eax],esp
 0046533F    xor         eax,eax
 00465341    mov         dword ptr [ebp-1C],eax
 00465344    mov         ebx,dword ptr [ebp-0C]
 00465347    dec         ebx
 00465348    mov         esi,ebx
 0046534A    mov         eax,dword ptr [ebp-8]
 0046534D    inc         eax
 0046534E    test        eax,eax
>00465350    jg          00465366
 00465352    mov         ecx,77
 00465357    mov         edx,465514;'C:\GLScene\glscene_v_1000714\Source\base\Spline.pas'
 0046535C    mov         eax,465550;'Assertion failure'
 00465361    call        @Assert
 00465366    mov         eax,dword ptr [ebp-0C]
 00465369    push        eax
 0046536A    lea         eax,[ebp-14]
 0046536D    mov         ecx,1
 00465372    mov         edx,dword ptr ds:[4652F4];.3
 00465378    call        @DynArraySetLength
 0046537D    add         esp,4
 00465380    push        ebx
 00465381    lea         eax,[ebp-18]
 00465384    mov         ecx,1
 00465389    mov         edx,dword ptr ds:[4652F4];.3
 0046538F    call        @DynArraySetLength
 00465394    add         esp,4
 00465397    mov         eax,dword ptr [ebp-14]
 0046539A    mov         edx,dword ptr [ebp-1C]
 0046539D    mov         dword ptr [eax+edx*4],3FB504F3
 004653A4    mov         eax,dword ptr [ebp-18]
 004653A7    mov         edx,dword ptr [ebp-1C]
 004653AA    mov         dword ptr [eax+edx*4],3F3504F4
 004653B1    mov         edi,dword ptr [ebp-1C]
 004653B4    inc         edi
 004653B5    mov         ebx,esi
 004653B7    dec         ebx
 004653B8    sub         ebx,edi
>004653BA    jl          004653F1
 004653BC    inc         ebx
 004653BD    mov         eax,dword ptr [ebp-18]
 004653C0    fld         dword ptr [eax+edi*4-4]
 004653C4    mov         eax,dword ptr [ebp-18]
 004653C7    fmul        dword ptr [eax+edi*4-4]
 004653CB    fsubr       dword ptr ds:[465564];4:Single
 004653D1    fsqrt
 004653D3    mov         eax,dword ptr [ebp-14]
 004653D6    fstp        dword ptr [eax+edi*4]
 004653D9    wait
 004653DA    fld         dword ptr ds:[465568];1:Single
 004653E0    mov         eax,dword ptr [ebp-14]
 004653E3    fdiv        dword ptr [eax+edi*4]
 004653E6    mov         eax,dword ptr [ebp-18]
 004653E9    fstp        dword ptr [eax+edi*4]
 004653EC    wait
 004653ED    inc         edi
 004653EE    dec         ebx
>004653EF    jne         004653BD
 004653F1    mov         eax,dword ptr [ebp-18]
 004653F4    fld         dword ptr [eax+esi*4-4]
 004653F8    mov         eax,dword ptr [ebp-18]
 004653FB    fmul        dword ptr [eax+esi*4-4]
 004653FF    fsubr       dword ptr ds:[46556C];2:Single
 00465405    fsqrt
 00465407    mov         eax,dword ptr [ebp-14]
 0046540A    fstp        dword ptr [eax+esi*4]
 0046540D    wait
 0046540E    mov         eax,dword ptr [ebp-0C]
 00465411    push        eax
 00465412    lea         eax,[ebp-10]
 00465415    mov         ecx,1
 0046541A    mov         edx,dword ptr ds:[4652F4];.3
 00465420    call        @DynArraySetLength
 00465425    add         esp,4
 00465428    mov         eax,dword ptr [ebp-4]
 0046542B    mov         edx,dword ptr [ebp-1C]
 0046542E    fld         dword ptr [eax+edx*4]
 00465431    mov         eax,dword ptr [ebp-14]
 00465434    mov         edx,dword ptr [ebp-1C]
 00465437    fdiv        dword ptr [eax+edx*4]
 0046543A    mov         eax,dword ptr [ebp-10]
 0046543D    mov         edx,dword ptr [ebp-1C]
 00465440    fstp        dword ptr [eax+edx*4]
 00465443    wait
 00465444    mov         eax,dword ptr [ebp-1C]
 00465447    inc         eax
 00465448    mov         ebx,esi
 0046544A    sub         ebx,eax
>0046544C    jl          00465479
 0046544E    inc         ebx
 0046544F    mov         edx,dword ptr [ebp-4]
 00465452    lea         edx,[edx+eax*4]
 00465455    mov         ecx,dword ptr [ebp-10]
 00465458    fld         dword ptr [ecx+eax*4-4]
 0046545C    mov         ecx,dword ptr [ebp-18]
 0046545F    fmul        dword ptr [ecx+eax*4-4]
 00465463    fsubr       dword ptr [edx]
 00465465    mov         ecx,dword ptr [ebp-14]
 00465468    fdiv        dword ptr [ecx+eax*4]
 0046546B    mov         ecx,dword ptr [ebp-10]
 0046546E    fstp        dword ptr [ecx+eax*4]
 00465471    wait
 00465472    inc         eax
 00465473    add         edx,4
 00465476    dec         ebx
>00465477    jne         00465455
 00465479    mov         eax,dword ptr [ebp+8]
 0046547C    inc         eax
 0046547D    cmp         eax,dword ptr [ebp-0C]
>00465480    je          00465496
 00465482    mov         ecx,85
 00465487    mov         edx,465514;'C:\GLScene\glscene_v_1000714\Source\base\Spline.pas'
 0046548C    mov         eax,465550;'Assertion failure'
 00465491    call        @Assert
 00465496    mov         eax,dword ptr [ebp-10]
 00465499    fld         dword ptr [eax+esi*4]
 0046549C    mov         eax,dword ptr [ebp-14]
 0046549F    fdiv        dword ptr [eax+esi*4]
 004654A2    mov         eax,dword ptr [ebp+0C]
 004654A5    fstp        dword ptr [eax+esi*4]
 004654A8    wait
 004654A9    mov         eax,esi
 004654AB    dec         eax
 004654AC    mov         ebx,dword ptr [ebp-1C]
 004654AF    sub         ebx,eax
>004654B1    jg          004654DA
 004654B3    dec         ebx
 004654B4    mov         edx,dword ptr [ebp+0C]
 004654B7    lea         edx,[edx+eax*4+4]
 004654BB    fld         dword ptr [edx]
 004654BD    mov         ecx,dword ptr [ebp-18]
 004654C0    fmul        dword ptr [ecx+eax*4]
 004654C3    mov         ecx,dword ptr [ebp-10]
 004654C6    fsubr       dword ptr [ecx+eax*4]
 004654C9    mov         ecx,dword ptr [ebp-14]
 004654CC    fdiv        dword ptr [ecx+eax*4]
 004654CF    fstp        dword ptr [edx-4]
 004654D2    wait
 004654D3    dec         eax
 004654D4    sub         edx,4
 004654D7    inc         ebx
>004654D8    jne         004654BB
 004654DA    xor         eax,eax
 004654DC    pop         edx
 004654DD    pop         ecx
 004654DE    pop         ecx
 004654DF    mov         dword ptr fs:[eax],edx
 004654E2    push        465502
 004654E7    lea         eax,[ebp-18]
 004654EA    mov         edx,dword ptr ds:[4652F4];.3
 004654F0    mov         ecx,3
 004654F5    call        @FinalizeArray
 004654FA    ret
>004654FB    jmp         @HandleFinally
>00465500    jmp         004654E7
 00465502    pop         edi
 00465503    pop         esi
 00465504    pop         ebx
 00465505    mov         esp,ebp
 00465507    pop         ebp
 00465508    ret         8
end;*}

//00465590
{*procedure sub_00465590(?:?; ?:?; ?:?);
begin
 00465590    push        ebp
 00465591    mov         ebp,esp
 00465593    add         esp,0FFFFFFD4
 00465596    push        ebx
 00465597    push        esi
 00465598    push        edi
 00465599    xor         ebx,ebx
 0046559B    mov         dword ptr [ebp-1C],ebx
 0046559E    mov         dword ptr [ebp-20],ebx
 004655A1    mov         esi,ecx
 004655A3    mov         dword ptr [ebp-4],edx
 004655A6    mov         ebx,eax
 004655A8    xor         eax,eax
 004655AA    push        ebp
 004655AB    push        4657AC
 004655B0    push        dword ptr fs:[eax]
 004655B3    mov         dword ptr fs:[eax],esp
 004655B6    mov         eax,esi
 004655B8    mov         edx,dword ptr ds:[465240];TCubicSplineMatrix
 004655BE    call        @DynArrayClear
 004655C3    test        ebx,ebx
>004655C5    je          0046578B
 004655CB    cmp         dword ptr [ebp-4],0
>004655CF    jle         0046578B
 004655D5    mov         eax,dword ptr [ebp-4]
 004655D8    dec         eax
 004655D9    mov         dword ptr [ebp-18],eax
 004655DC    mov         eax,dword ptr [ebp-4]
 004655DF    push        eax
 004655E0    lea         eax,[ebp-1C]
 004655E3    mov         ecx,1
 004655E8    mov         edx,dword ptr ds:[465570];.4
 004655EE    call        @DynArraySetLength
 004655F3    add         esp,4
 004655F6    fld         dword ptr [ebx+4]
 004655F9    fsub        dword ptr [ebx]
 004655FB    fmul        dword ptr ds:[4657BC];3:Single
 00465601    mov         eax,dword ptr [ebp-1C]
 00465604    fstp        dword ptr [eax]
 00465606    wait
 00465607    mov         eax,dword ptr [ebp-18]
 0046560A    fld         dword ptr [ebx+eax*4]
 0046560D    mov         eax,dword ptr [ebp-18]
 00465610    fsub        dword ptr [ebx+eax*4-4]
 00465614    fmul        dword ptr ds:[4657BC];3:Single
 0046561A    mov         eax,dword ptr [ebp-1C]
 0046561D    mov         edx,dword ptr [ebp-18]
 00465620    fstp        dword ptr [eax+edx*4]
 00465623    wait
 00465624    mov         edx,dword ptr [ebp-18]
 00465627    dec         edx
 00465628    test        edx,edx
>0046562A    jle         0046564A
 0046562C    mov         eax,1
 00465631    fld         dword ptr [ebx+eax*4+4]
 00465635    fsub        dword ptr [ebx+eax*4-4]
 00465639    fmul        dword ptr ds:[4657BC];3:Single
 0046563F    mov         ecx,dword ptr [ebp-1C]
 00465642    fstp        dword ptr [ecx+eax*4]
 00465645    wait
 00465646    inc         eax
 00465647    dec         edx
>00465648    jne         00465631
 0046564A    mov         eax,dword ptr [ebp-4]
 0046564D    push        eax
 0046564E    lea         eax,[ebp-20]
 00465651    mov         ecx,1
 00465656    mov         edx,dword ptr ds:[465570];.4
 0046565C    call        @DynArraySetLength
 00465661    add         esp,4
 00465664    mov         eax,dword ptr [ebp-20]
 00465667    push        eax
 00465668    mov         eax,dword ptr [ebp-20]
 0046566B    call        @DynArrayHigh
 00465670    push        eax
 00465671    mov         eax,dword ptr [ebp-1C]
 00465674    call        @DynArrayHigh
 00465679    mov         edx,eax
 0046567B    mov         ecx,dword ptr [ebp-4]
 0046567E    mov         eax,dword ptr [ebp-1C]
 00465681    call        00465314
 00465686    mov         eax,dword ptr [ebp-18]
 00465689    push        eax
 0046568A    mov         eax,esi
 0046568C    mov         ecx,1
 00465691    mov         edx,dword ptr ds:[465240];TCubicSplineMatrix
 00465697    call        @DynArraySetLength
 0046569C    add         esp,4
 0046569F    mov         edx,dword ptr [ebp-18]
 004656A2    dec         edx
 004656A3    test        edx,edx
>004656A5    jl          0046578B
 004656AB    inc         edx
 004656AC    xor         eax,eax
 004656AE    mov         ecx,dword ptr [ebx+eax*4]
 004656B1    mov         dword ptr [ebp-8],ecx
 004656B4    mov         ecx,dword ptr [ebp-20]
 004656B7    mov         ecx,dword ptr [ecx+eax*4]
 004656BA    mov         dword ptr [ebp-0C],ecx
 004656BD    fld         dword ptr [ebx+eax*4+4]
 004656C1    fsub        dword ptr [ebx+eax*4]
 004656C4    fmul        dword ptr ds:[4657BC];3:Single
 004656CA    fld         dword ptr ds:[4657C0];2:Single
 004656D0    mov         ecx,dword ptr [ebp-20]
 004656D3    fmul        dword ptr [ecx+eax*4]
 004656D6    fsubp       st(1),st
 004656D8    mov         ecx,dword ptr [ebp-20]
 004656DB    fsub        dword ptr [ecx+eax*4+4]
 004656DF    fstp        dword ptr [ebp-10]
 004656E2    wait
 004656E3    fld         dword ptr [ebx+eax*4+4]
 004656E7    fsub        dword ptr [ebx+eax*4]
 004656EA    fmul        dword ptr ds:[4657C4];-2:Single
 004656F0    mov         ecx,dword ptr [ebp-20]
 004656F3    fadd        dword ptr [ecx+eax*4]
 004656F6    mov         ecx,dword ptr [ebp-20]
 004656F9    fadd        dword ptr [ecx+eax*4+4]
 004656FD    fstp        dword ptr [ebp-14]
 00465700    wait
 00465701    mov         dword ptr [ebp-24],eax
 00465704    fild        dword ptr [ebp-24]
 00465707    fmul        dword ptr [ebp-14]
 0046570A    fsubr       dword ptr [ebp-10]
 0046570D    mov         dword ptr [ebp-28],eax
 00465710    fild        dword ptr [ebp-28]
 00465713    fmulp       st(1),st
 00465715    fsub        dword ptr [ebp-0C]
 00465718    mov         dword ptr [ebp-2C],eax
 0046571B    fild        dword ptr [ebp-2C]
 0046571E    fmulp       st(1),st
 00465720    fadd        dword ptr [ebp-8]
 00465723    mov         ecx,eax
 00465725    add         ecx,ecx
 00465727    mov         edi,dword ptr [esi]
 00465729    fstp        dword ptr [edi+ecx*8+0C]
 0046572D    wait
 0046572E    lea         ecx,[eax+eax*2]
 00465731    mov         dword ptr [ebp-24],ecx
 00465734    fild        dword ptr [ebp-24]
 00465737    fmul        dword ptr [ebp-14]
 0046573A    fld         dword ptr ds:[4657C0];2:Single
 00465740    fmul        dword ptr [ebp-10]
 00465743    fsubp       st(1),st
 00465745    mov         dword ptr [ebp-28],eax
 00465748    fild        dword ptr [ebp-28]
 0046574B    fmulp       st(1),st
 0046574D    fadd        dword ptr [ebp-0C]
 00465750    mov         ecx,eax
 00465752    add         ecx,ecx
 00465754    mov         edi,dword ptr [esi]
 00465756    fstp        dword ptr [edi+ecx*8+8]
 0046575A    wait
 0046575B    lea         ecx,[eax+eax*2]
 0046575E    mov         dword ptr [ebp-24],ecx
 00465761    fild        dword ptr [ebp-24]
 00465764    fmul        dword ptr [ebp-14]
 00465767    fsubr       dword ptr [ebp-10]
 0046576A    mov         ecx,eax
 0046576C    add         ecx,ecx
 0046576E    mov         edi,dword ptr [esi]
 00465770    fstp        dword ptr [edi+ecx*8+4]
 00465774    wait
 00465775    mov         ecx,eax
 00465777    add         ecx,ecx
 00465779    mov         edi,dword ptr [esi]
 0046577B    lea         edi,[edi+ecx*8]
 0046577E    mov         ecx,dword ptr [ebp-14]
 00465781    mov         dword ptr [edi],ecx
 00465783    inc         eax
 00465784    dec         edx
>00465785    jne         004656AE
 0046578B    xor         eax,eax
 0046578D    pop         edx
 0046578E    pop         ecx
 0046578F    pop         ecx
 00465790    mov         dword ptr fs:[eax],edx
 00465793    push        4657B3
 00465798    lea         eax,[ebp-20]
 0046579B    mov         edx,dword ptr ds:[465570];.4
 004657A1    mov         ecx,2
 004657A6    call        @FinalizeArray
 004657AB    ret
>004657AC    jmp         @HandleFinally
>004657B1    jmp         00465798
 004657B3    pop         edi
 004657B4    pop         esi
 004657B5    pop         ebx
 004657B6    mov         esp,ebp
 004657B8    pop         ebp
 004657B9    ret
end;*}

//004657C8
{*function sub_004657C8(?:?; ?:?; ?:?):?;
begin
 004657C8    push        ebp
 004657C9    mov         ebp,esp
 004657CB    add         esp,0FFFFFFF8
 004657CE    push        ebx
 004657CF    push        esi
 004657D0    mov         esi,edx
 004657D2    mov         ebx,eax
 004657D4    mov         eax,ebx
 004657D6    call        @DynArrayLength
 004657DB    test        eax,eax
>004657DD    jle         00465836
 004657DF    fld         dword ptr [ebp+8]
 004657E2    fcomp       dword ptr ds:[465848];0:Single
 004657E8    fnstsw      al
 004657EA    sahf
>004657EB    ja          004657F1
 004657ED    xor         eax,eax
>004657EF    jmp         0046580E
 004657F1    mov         edx,esi
 004657F3    dec         edx
 004657F4    mov         dword ptr [ebp-8],edx
 004657F7    fild        dword ptr [ebp-8]
 004657FA    fcomp       dword ptr [ebp+8]
 004657FD    fnstsw      al
 004657FF    sahf
>00465800    jae         00465806
 00465802    mov         eax,edx
>00465804    jmp         0046580E
 00465806    push        dword ptr [ebp+8]
 00465809    call        0045F688
 0046580E    dec         esi
 0046580F    cmp         eax,esi
>00465811    jne         00465814
 00465813    dec         eax
 00465814    mov         edx,eax
 00465816    add         edx,edx
 00465818    fld         dword ptr [ebx+edx*8]
 0046581B    fmul        dword ptr [ebp+8]
 0046581E    fadd        dword ptr [ebx+edx*8+4]
 00465822    fmul        dword ptr [ebp+8]
 00465825    fadd        dword ptr [ebx+edx*8+8]
 00465829    fmul        dword ptr [ebp+8]
 0046582C    fadd        dword ptr [ebx+edx*8+0C]
 00465830    fstp        dword ptr [ebp-4]
 00465833    wait
>00465834    jmp         0046583B
 00465836    xor         eax,eax
 00465838    mov         dword ptr [ebp-4],eax
 0046583B    fld         dword ptr [ebp-4]
 0046583E    pop         esi
 0046583F    pop         ebx
 00465840    pop         ecx
 00465841    pop         ecx
 00465842    pop         ebp
 00465843    ret         4
end;*}

//0046584C
{*constructor TCubicSpline.Create(?:?; ?:?; ?:?; ?:?);
begin
 0046584C    push        ebp
 0046584D    mov         ebp,esp
 0046584F    push        ecx
 00465850    push        ebx
 00465851    push        esi
 00465852    push        edi
 00465853    test        dl,dl
>00465855    je          0046585F
 00465857    add         esp,0FFFFFFF0
 0046585A    call        @ClassCreate
 0046585F    mov         edi,ecx
 00465861    mov         byte ptr [ebp-1],dl
 00465864    mov         ebx,eax
 00465866    mov         esi,dword ptr [ebp+8]
 00465869    xor         edx,edx
 0046586B    mov         eax,ebx
 0046586D    call        TObject.Create
 00465872    lea         ecx,[ebx+4]
 00465875    mov         edx,esi
 00465877    mov         eax,edi
 00465879    call        00465590
 0046587E    lea         ecx,[ebx+8]
 00465881    mov         edx,esi
 00465883    mov         eax,dword ptr [ebp+14]
 00465886    call        00465590
 0046588B    lea         ecx,[ebx+0C]
 0046588E    mov         edx,esi
 00465890    mov         eax,dword ptr [ebp+10]
 00465893    call        00465590
 00465898    lea         ecx,[ebx+10]
 0046589B    mov         edx,esi
 0046589D    mov         eax,dword ptr [ebp+0C]
 004658A0    call        00465590
 004658A5    mov         dword ptr [ebx+14],esi
 004658A8    mov         eax,ebx
 004658AA    cmp         byte ptr [ebp-1],0
>004658AE    je          004658BF
 004658B0    call        @AfterConstruction
 004658B5    pop         dword ptr fs:[0]
 004658BC    add         esp,0C
 004658BF    mov         eax,ebx
 004658C1    pop         edi
 004658C2    pop         esi
 004658C3    pop         ebx
 004658C4    pop         ecx
 004658C5    pop         ebp
 004658C6    ret         10
end;*}

//004658F4
{*procedure sub_004658F4(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004658F4    push        ebp
 004658F5    mov         ebp,esp
 004658F7    push        ebx
 004658F8    push        esi
 004658F9    push        edi
 004658FA    mov         edi,ecx
 004658FC    mov         esi,edx
 004658FE    mov         ebx,eax
 00465900    push        dword ptr [ebp+0C]
 00465903    mov         edx,dword ptr [ebx+14]
 00465906    mov         eax,dword ptr [ebx+4]
 00465909    call        004657C8
 0046590E    fstp        dword ptr [esi]
 00465910    wait
 00465911    push        dword ptr [ebp+0C]
 00465914    mov         edx,dword ptr [ebx+14]
 00465917    mov         eax,dword ptr [ebx+8]
 0046591A    call        004657C8
 0046591F    fstp        dword ptr [edi]
 00465921    wait
 00465922    push        dword ptr [ebp+0C]
 00465925    mov         edx,dword ptr [ebx+14]
 00465928    mov         eax,dword ptr [ebx+0C]
 0046592B    call        004657C8
 00465930    mov         eax,dword ptr [ebp+8]
 00465933    fstp        dword ptr [eax]
 00465935    wait
 00465936    pop         edi
 00465937    pop         esi
 00465938    pop         ebx
 00465939    pop         ebp
 0046593A    ret         8
end;*}

end.