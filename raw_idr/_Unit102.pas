//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit102;

interface

uses
  SysUtils, Classes;

type
  .2 = array of ?;
//elSize = 4
//varType equivalent: varInteger;
  .3 = array of ?;
//elSize = 4
//varType equivalent: varSingle;
  TGLWin32Context = class(TGLContext)
  public
    f40:HGLRC;//f40
    f44:dword;//f44
    f48:dword;//f48
    f4C:.2;//f4C
    f50:.3;//f50
    f54:byte;//f54
    destructor Destroy; virtual;//00489824
    procedure v0; virtual;//v0//0048A7B0
    procedure v4; virtual;//v4//0048A908
    constructor v8; virtual;//v8//004897E0
    function vC:Boolean; virtual;//vC//0048A96C
    procedure v10; virtual;//v10//0048A974
    //function v14:?; virtual;//v14//0048A990
    procedure sub_0048A6FC; dynamic;//0048A6FC
    //procedure sub_0048A67C(?:?); dynamic;//0048A67C
    //procedure sub_0048A314(?:?; ?:?; ?:?); dynamic;//0048A314
    //procedure sub_00489D80(?:?); dynamic;//00489D80
  end;
  .5 = array of ?;
//elSize = 4
//varType equivalent: varInteger;
  .6 = array of ?;
//elSize = 8;
    //procedure sub_00489578(?:?; ?:?; ?:?);//00489578
    //procedure sub_0048960C(?:HWND; ?:?; ?:?);//0048960C
    procedure sub_004896A0(?:HWND);//004896A0
    //function sub_00489774:?;//00489774
    constructor sub_004897E0;//004897E0
    destructor Destroy;//00489824
    //procedure sub_0048984C(?:?; ?:Byte);//0048984C
    procedure sub_00489960(?:TGLWin32Context);//00489960
    //procedure sub_00489984(?:TGLWin32Context; ?:?; ?:?);//00489984
    //procedure sub_004899D0(?:?; ?:?; ?:?);//004899D0
    //procedure sub_00489A10(?:?; ?:?);//00489A10
    procedure sub_00489A7C(?:TGLWin32Context);//00489A7C
    //procedure sub_00489AA8(?:?);//00489AA8
    //procedure sub_00489AF0(?:TGLWin32Context; ?:HDC; ?:?);//00489AF0
    //function sub_00489D3C(?:?):Boolean;//00489D3C
    //procedure sub_00489D80(?:?);//00489D80
    procedure sub_0048A1E0(?:TGLWin32Context);//0048A1E0
    //procedure sub_0048A314(?:?; ?:?; ?:?);//0048A314
    //procedure sub_0048A67C(?:?);//0048A67C
    procedure sub_0048A6FC;//0048A6FC
    procedure sub_0048A7B0;//0048A7B0
    procedure sub_0048A908;//0048A908
    function sub_0048A96C:Boolean;//0048A96C
    procedure sub_0048A974;//0048A974
    //function sub_0048A990:?;//0048A990

implementation

//00489578
{*procedure sub_00489578(?:?; ?:?; ?:?);
begin
 00489578    push        ebp
 00489579    mov         ebp,esp
 0048957B    push        ebx
 0048957C    push        esi
 0048957D    push        edi
 0048957E    cmp         dword ptr [ebp+8],0
>00489582    jne         004895EE
 00489584    mov         esi,dword ptr [ebp+10]
 00489587    cmp         dword ptr [esi+8],2
>0048958B    jne         004895D3
 0048958D    mov         ebx,dword ptr ds:[5E1538];gvar_005E1538
 00489593    dec         ebx
 00489594    test        ebx,ebx
>00489596    jl          004895D3
 00489598    mov         eax,[005E153C];gvar_005E153C:?
 0048959D    mov         eax,dword ptr [eax+ebx*4]
 004895A0    push        eax
 004895A1    mov         eax,dword ptr [esi+0C]
 004895A4    push        eax
 004895A5    call        user32.IsChild
 004895AA    test        eax,eax
>004895AC    je          004895BD
 004895AE    mov         eax,[005E1540];gvar_005E1540:?
 004895B3    lea         edi,[eax+ebx*8]
 004895B6    xor         edx,edx
 004895B8    mov         eax,dword ptr [edi+4]
 004895BB    call        dword ptr [edi]
 004895BD    dec         ebx
 004895BE    cmp         ebx,dword ptr ds:[5E1538];gvar_005E1538
>004895C4    jl          004895CF
 004895C6    dec         ebx
 004895C7    cmp         ebx,dword ptr ds:[5E1538];gvar_005E1538
>004895CD    jge         004895C6
 004895CF    test        ebx,ebx
>004895D1    jge         00489598
 004895D3    mov         eax,dword ptr [ebp+10]
 004895D6    push        eax
 004895D7    mov         eax,dword ptr [ebp+0C]
 004895DA    push        eax
 004895DB    mov         eax,dword ptr [ebp+8]
 004895DE    push        eax
 004895DF    mov         eax,[005E1544];gvar_005E1544:HHOOK
 004895E4    push        eax
 004895E5    call        user32.CallNextHookEx
 004895EA    xor         eax,eax
>004895EC    jmp         00489605
 004895EE    mov         eax,dword ptr [ebp+10]
 004895F1    push        eax
 004895F2    mov         eax,dword ptr [ebp+0C]
 004895F5    push        eax
 004895F6    mov         eax,dword ptr [ebp+8]
 004895F9    push        eax
 004895FA    mov         eax,[005E1544];gvar_005E1544:HHOOK
 004895FF    push        eax
 00489600    call        user32.CallNextHookEx
 00489605    pop         edi
 00489606    pop         esi
 00489607    pop         ebx
 00489608    pop         ebp
 00489609    ret         0C
end;*}

//0048960C
{*procedure sub_0048960C(?:HWND; ?:?; ?:?);
begin
 0048960C    push        ebp
 0048960D    mov         ebp,esp
 0048960F    push        ebx
 00489610    push        esi
 00489611    mov         ebx,eax
 00489613    mov         esi,5E1538;gvar_005E1538
 00489618    push        ebx
 00489619    call        user32.IsWindow
 0048961E    test        eax,eax
>00489620    je          00489699
 00489622    cmp         dword ptr [esi],0
>00489625    jne         00489641
 00489627    call        KERNEL32.GetCurrentThreadId
 0048962C    push        eax
 0048962D    push        0
 0048962F    mov         eax,489578;sub_00489578
 00489634    push        eax
 00489635    push        4
 00489637    call        user32.SetWindowsHookExA
 0048963C    mov         [005E1544],eax;gvar_005E1544:HHOOK
 00489641    inc         dword ptr [esi]
 00489643    mov         eax,dword ptr [esi]
 00489645    push        eax
 00489646    mov         eax,5E153C;gvar_005E153C:?
 0048964B    mov         ecx,1
 00489650    mov         edx,dword ptr ds:[489528];.5
 00489656    call        @DynArraySetLength
 0048965B    add         esp,4
 0048965E    mov         eax,[005E153C];gvar_005E153C:?
 00489663    mov         edx,dword ptr [esi]
 00489665    mov         dword ptr [eax+edx*4-4],ebx
 00489669    mov         eax,dword ptr [esi]
 0048966B    push        eax
 0048966C    mov         eax,5E1540;gvar_005E1540:?
 00489671    mov         ecx,1
 00489676    mov         edx,dword ptr ds:[489550];.6
 0048967C    call        @DynArraySetLength
 00489681    add         esp,4
 00489684    mov         eax,[005E1540];gvar_005E1540:?
 00489689    mov         edx,dword ptr [esi]
 0048968B    mov         ecx,dword ptr [ebp+8]
 0048968E    mov         dword ptr [eax+edx*8-8],ecx
 00489692    mov         ecx,dword ptr [ebp+0C]
 00489695    mov         dword ptr [eax+edx*8-4],ecx
 00489699    pop         esi
 0048969A    pop         ebx
 0048969B    pop         ebp
 0048969C    ret         8
end;*}

//004896A0
procedure sub_004896A0(?:HWND);
begin
{*
 004896A0    push        ebx
 004896A1    push        esi
 004896A2    push        edi
 004896A3    push        ebp
 004896A4    mov         esi,eax
 004896A6    push        esi
 004896A7    call        user32.IsWindow
 004896AC    test        eax,eax
>004896AE    je          0048975C
 004896B4    cmp         dword ptr ds:[5E1538],0;gvar_005E1538
>004896BB    je          0048975C
 004896C1    xor         ebx,ebx
 004896C3    mov         edx,dword ptr ds:[5E1538];gvar_005E1538
 004896C9    dec         edx
 004896CA    test        edx,edx
>004896CC    jl          00489706
 004896CE    inc         edx
 004896CF    xor         eax,eax
 004896D1    mov         ecx,dword ptr ds:[5E153C];gvar_005E153C:?
 004896D7    mov         edi,dword ptr [ecx+eax*4]
 004896DA    cmp         esi,edi
>004896DC    je          00489702
 004896DE    mov         ecx,dword ptr ds:[5E153C];gvar_005E153C:?
 004896E4    mov         dword ptr [ecx+ebx*4],edi
 004896E7    mov         ecx,dword ptr ds:[5E1540];gvar_005E1540:?
 004896ED    mov         edi,dword ptr ds:[5E1540];gvar_005E1540:?
 004896F3    mov         ebp,dword ptr [edi+eax*8]
 004896F6    mov         dword ptr [ecx+ebx*8],ebp
 004896F9    mov         ebp,dword ptr [edi+eax*8+4]
 004896FD    mov         dword ptr [ecx+ebx*8+4],ebp
 00489701    inc         ebx
 00489702    inc         eax
 00489703    dec         edx
>00489704    jne         004896D1
 00489706    dec         dword ptr ds:[5E1538];gvar_005E1538
 0048970C    mov         eax,[005E1538];gvar_005E1538
 00489711    push        eax
 00489712    mov         eax,5E153C;gvar_005E153C:?
 00489717    mov         ecx,1
 0048971C    mov         edx,dword ptr ds:[489528];.5
 00489722    call        @DynArraySetLength
 00489727    add         esp,4
 0048972A    mov         eax,[005E1538];gvar_005E1538
 0048972F    push        eax
 00489730    mov         eax,5E1540;gvar_005E1540:?
 00489735    mov         ecx,1
 0048973A    mov         edx,dword ptr ds:[489550];.6
 00489740    call        @DynArraySetLength
 00489745    add         esp,4
 00489748    cmp         dword ptr ds:[5E1538],0;gvar_005E1538
>0048974F    jne         0048975C
 00489751    mov         eax,[005E1544];gvar_005E1544:HHOOK
 00489756    push        eax
 00489757    call        user32.UnhookWindowsHookEx
 0048975C    pop         ebp
 0048975D    pop         edi
 0048975E    pop         esi
 0048975F    pop         ebx
 00489760    ret
*}
end;

//00489774
{*function sub_00489774:?;
begin
 00489774    add         esp,0FFFFFFD8
 00489777    mov         eax,[005AF664];gvar_005AF664
 0048977C    mov         [005AD6D4],eax;gvar_005AD6D4
 00489781    push        esp
 00489782    mov         eax,[005AD6E8];^gvar_00489764
 00489787    push        eax
 00489788    mov         eax,[005AF664];gvar_005AF664
 0048978D    push        eax
 0048978E    call        user32.GetClassInfoA
 00489793    cmp         eax,1
 00489796    sbb         eax,eax
 00489798    inc         eax
 00489799    test        al,al
>0048979B    jne         004897A7
 0048979D    push        5AD6C4
 004897A2    call        user32.RegisterClassA
 004897A7    push        80000000
 004897AC    push        0
 004897AE    push        0
 004897B0    push        0
 004897B2    push        0
 004897B4    push        0
 004897B6    push        0
 004897B8    mov         eax,[005AF664];gvar_005AF664
 004897BD    push        eax
 004897BE    push        0
 004897C0    mov         ecx,4897DC;'
 004897C5    mov         edx,dword ptr ds:[5AD6E8];^gvar_00489764
 004897CB    mov         eax,80
 004897D0    call        CreateWindowEx
 004897D5    add         esp,28
 004897D8    ret
end;*}

//004897E0
constructor sub_004897E0;
begin
{*
 004897E0    push        ebx
 004897E1    push        esi
 004897E2    test        dl,dl
>004897E4    je          004897EE
 004897E6    add         esp,0FFFFFFF0
 004897E9    call        @ClassCreate
 004897EE    mov         ebx,edx
 004897F0    mov         esi,eax
 004897F2    xor         edx,edx
 004897F4    mov         eax,esi
 004897F6    call        0046C3FC
 004897FB    mov         eax,esi
 004897FD    call        00489960
 00489802    mov         eax,esi
 00489804    call        00489A7C
 00489809    mov         eax,esi
 0048980B    test        bl,bl
>0048980D    je          0048981E
 0048980F    call        @AfterConstruction
 00489814    pop         dword ptr fs:[0]
 0048981B    add         esp,0C
 0048981E    mov         eax,esi
 00489820    pop         esi
 00489821    pop         ebx
 00489822    ret
*}
end;

//00489824
destructor TGLWin32Context.Destroy;
begin
{*
 00489824    push        ebx
 00489825    push        esi
 00489826    call        @BeforeDestruction
 0048982B    mov         ebx,edx
 0048982D    mov         esi,eax
 0048982F    mov         edx,ebx
 00489831    and         dl,0FC
 00489834    mov         eax,esi
 00489836    call        TGLContext.Destroy
 0048983B    test        bl,bl
>0048983D    jle         00489846
 0048983F    mov         eax,esi
 00489841    call        @ClassDestroy
 00489846    pop         esi
 00489847    pop         ebx
 00489848    ret
*}
end;

//0048984C
{*procedure sub_0048984C(?:?; ?:Byte);
begin
 0048984C    push        ebx
 0048984D    push        esi
 0048984E    push        edi
 0048984F    push        ebp
 00489850    add         esp,0FFFFFBCC
 00489856    mov         esi,edx
 00489858    lea         edi,[esp+6]
 0048985C    mov         ecx,0A
 00489861    rep movs    dword ptr [edi],dword ptr [esi]
 00489863    mov         dword ptr [esp],eax
 00489866    mov         cl,byte ptr [esp+0F]
 0048986A    mov         eax,1
 0048986F    shl         eax,cl
 00489871    mov         word ptr [esp+2E],300
 00489878    mov         word ptr [esp+30],ax
 0048987D    mov         cl,byte ptr [esp+10]
 00489881    mov         bl,1
 00489883    shl         bl,cl
 00489885    dec         ebx
 00489886    mov         cl,byte ptr [esp+12]
 0048988A    mov         dl,1
 0048988C    shl         dl,cl
 0048988E    dec         edx
 0048988F    mov         byte ptr [esp+4],dl
 00489893    mov         cl,byte ptr [esp+14]
 00489897    mov         dl,1
 00489899    shl         dl,cl
 0048989B    dec         edx
 0048989C    mov         byte ptr [esp+5],dl
 004898A0    mov         edi,eax
 004898A2    dec         edi
 004898A3    test        edi,edi
>004898A5    jl          00489924
 004898A7    inc         edi
 004898A8    xor         esi,esi
 004898AA    lea         ebp,[esp+32]
 004898AE    mov         cl,byte ptr [esp+11]
 004898B2    mov         eax,esi
 004898B4    shr         eax,cl
 004898B6    xor         edx,edx
 004898B8    mov         dl,bl
 004898BA    and         eax,edx
 004898BC    mov         edx,eax
 004898BE    shl         eax,8
 004898C1    sub         eax,edx
 004898C3    xor         edx,edx
 004898C5    mov         dl,bl
 004898C7    mov         ecx,edx
 004898C9    cdq
 004898CA    idiv        eax,ecx
 004898CC    mov         byte ptr [ebp],al
 004898CF    mov         cl,byte ptr [esp+13]
 004898D3    mov         eax,esi
 004898D5    shr         eax,cl
 004898D7    xor         edx,edx
 004898D9    mov         dl,byte ptr [esp+4]
 004898DD    and         eax,edx
 004898DF    mov         edx,eax
 004898E1    shl         eax,8
 004898E4    sub         eax,edx
 004898E6    xor         edx,edx
 004898E8    mov         dl,byte ptr [esp+4]
 004898EC    mov         ecx,edx
 004898EE    cdq
 004898EF    idiv        eax,ecx
 004898F1    mov         byte ptr [ebp+1],al
 004898F4    mov         cl,byte ptr [esp+15]
 004898F8    mov         eax,esi
 004898FA    shr         eax,cl
 004898FC    xor         edx,edx
 004898FE    mov         dl,byte ptr [esp+5]
 00489902    and         eax,edx
 00489904    mov         edx,eax
 00489906    shl         eax,8
 00489909    sub         eax,edx
 0048990B    xor         edx,edx
 0048990D    mov         dl,byte ptr [esp+5]
 00489911    mov         ecx,edx
 00489913    cdq
 00489914    idiv        eax,ecx
 00489916    mov         byte ptr [ebp+2],al
 00489919    mov         byte ptr [ebp+3],0
 0048991D    inc         esi
 0048991E    add         ebp,4
 00489921    dec         edi
>00489922    jne         004898AE
 00489924    lea         eax,[esp+2E]
 00489928    push        eax
 00489929    call        gdi32.CreatePalette
 0048992E    mov         ebx,eax
 00489930    test        ebx,ebx
>00489932    je          0048994C
 00489934    push        0
 00489936    push        ebx
 00489937    mov         eax,dword ptr [esp+8]
 0048993B    push        eax
 0048993C    call        gdi32.SelectPalette
 00489941    mov         eax,dword ptr [esp]
 00489944    push        eax
 00489945    call        gdi32.RealizePalette
>0048994A    jmp         00489951
 0048994C    call        0046F7F0
 00489951    mov         eax,ebx
 00489953    add         esp,434
 00489959    pop         ebp
 0048995A    pop         edi
 0048995B    pop         esi
 0048995C    pop         ebx
 0048995D    ret
end;*}

//00489960
procedure sub_00489960(?:TGLWin32Context);
begin
{*
 00489960    push        ebx
 00489961    mov         ebx,eax
 00489963    push        1
 00489965    lea         eax,[ebx+4C];TGLWin32Context.?f4C:.2
 00489968    mov         ecx,1
 0048996D    mov         edx,dword ptr ds:[489408];.2
 00489973    call        @DynArraySetLength
 00489978    add         esp,4
 0048997B    mov         eax,dword ptr [ebx+4C];TGLWin32Context.?f4C:.2
 0048997E    xor         edx,edx
 00489980    mov         dword ptr [eax],edx
 00489982    pop         ebx
 00489983    ret
*}
end;

//00489984
{*procedure sub_00489984(?:TGLWin32Context; ?:?; ?:?);
begin
 00489984    push        ebx
 00489985    push        esi
 00489986    push        edi
 00489987    push        ebp
 00489988    mov         ebp,ecx
 0048998A    mov         edi,edx
 0048998C    mov         ebx,eax
 0048998E    mov         eax,dword ptr [ebx+4C]
 00489991    call        @DynArrayLength
 00489996    mov         esi,eax
 00489998    lea         eax,[esi+2]
 0048999B    push        eax
 0048999C    lea         eax,[ebx+4C]
 0048999F    mov         ecx,1
 004899A4    mov         edx,dword ptr ds:[489408];.2
 004899AA    call        @DynArraySetLength
 004899AF    add         esp,4
 004899B2    mov         eax,dword ptr [ebx+4C]
 004899B5    mov         dword ptr [eax+esi*4-4],edi
 004899B9    mov         eax,dword ptr [ebx+4C]
 004899BC    mov         dword ptr [eax+esi*4],ebp
 004899BF    mov         eax,dword ptr [ebx+4C]
 004899C2    xor         edx,edx
 004899C4    mov         dword ptr [eax+esi*4+4],edx
 004899C8    pop         ebp
 004899C9    pop         edi
 004899CA    pop         esi
 004899CB    pop         ebx
 004899CC    ret
end;*}

//004899D0
{*procedure sub_004899D0(?:?; ?:?; ?:?);
begin
 004899D0    push        ebx
 004899D1    push        esi
 004899D2    push        edi
 004899D3    push        ebp
 004899D4    mov         ebp,ecx
 004899D6    mov         edi,edx
 004899D8    mov         esi,eax
 004899DA    xor         ebx,ebx
>004899DC    jmp         004899F2
 004899DE    mov         eax,dword ptr [esi+4C]
 004899E1    cmp         edi,dword ptr [eax+ebx*4]
>004899E4    jne         004899EF
 004899E6    mov         eax,dword ptr [esi+4C]
 004899E9    mov         dword ptr [eax+ebx*4+4],ebp
>004899ED    jmp         00489A09
 004899EF    add         ebx,2
 004899F2    mov         eax,dword ptr [esi+4C]
 004899F5    call        @DynArrayLength
 004899FA    cmp         ebx,eax
>004899FC    jl          004899DE
 004899FE    mov         ecx,ebp
 00489A00    mov         edx,edi
 00489A02    mov         eax,esi
 00489A04    call        00489984
 00489A09    pop         ebp
 00489A0A    pop         edi
 00489A0B    pop         esi
 00489A0C    pop         ebx
 00489A0D    ret
end;*}

//00489A10
{*procedure sub_00489A10(?:?; ?:?);
begin
 00489A10    push        ebx
 00489A11    push        esi
 00489A12    push        edi
 00489A13    mov         edi,edx
 00489A15    mov         esi,eax
 00489A17    xor         ebx,ebx
>00489A19    jmp         00489A69
 00489A1B    mov         eax,dword ptr [esi+4C]
 00489A1E    cmp         edi,dword ptr [eax+ebx*4]
>00489A21    jne         00489A66
 00489A23    add         ebx,2
>00489A26    jmp         00489A36
 00489A28    mov         eax,dword ptr [esi+4C]
 00489A2B    mov         eax,dword ptr [eax+ebx*4]
 00489A2E    mov         edx,dword ptr [esi+4C]
 00489A31    mov         dword ptr [edx+ebx*4-8],eax
 00489A35    inc         ebx
 00489A36    mov         eax,dword ptr [esi+4C]
 00489A39    call        @DynArrayLength
 00489A3E    cmp         ebx,eax
>00489A40    jl          00489A28
 00489A42    mov         eax,dword ptr [esi+4C]
 00489A45    call        @DynArrayLength
 00489A4A    sub         eax,2
 00489A4D    push        eax
 00489A4E    lea         eax,[esi+4C]
 00489A51    mov         ecx,1
 00489A56    mov         edx,dword ptr ds:[489408];.2
 00489A5C    call        @DynArraySetLength
 00489A61    add         esp,4
>00489A64    jmp         00489A75
 00489A66    add         ebx,2
 00489A69    mov         eax,dword ptr [esi+4C]
 00489A6C    call        @DynArrayLength
 00489A71    cmp         ebx,eax
>00489A73    jl          00489A1B
 00489A75    pop         edi
 00489A76    pop         esi
 00489A77    pop         ebx
 00489A78    ret
end;*}

//00489A7C
procedure sub_00489A7C(?:TGLWin32Context);
begin
{*
 00489A7C    push        ebx
 00489A7D    mov         ebx,eax
 00489A7F    push        1
 00489A81    lea         eax,[ebx+50];TGLWin32Context.?f50:.3
 00489A84    mov         ecx,1
 00489A89    mov         edx,dword ptr ds:[489430];.3
 00489A8F    call        @DynArraySetLength
 00489A94    add         esp,4
 00489A97    mov         eax,dword ptr [ebx+50];TGLWin32Context.?f50:.3
 00489A9A    xor         edx,edx
 00489A9C    mov         dword ptr [eax],edx
 00489A9E    pop         ebx
 00489A9F    ret
*}
end;

//00489AA8
{*procedure sub_00489AA8(?:?);
begin
 00489AA8    push        ebp
 00489AA9    mov         ebp,esp
 00489AAB    mov         eax,dword ptr [ebp+8]
 00489AAE    mov         eax,dword ptr [eax+8]
 00489AB1    push        eax
 00489AB2    mov         eax,dword ptr [ebp+8]
 00489AB5    mov         eax,dword ptr [eax+0C]
 00489AB8    push        eax
 00489AB9    push        20
 00489ABB    mov         eax,dword ptr [ebp+8]
 00489ABE    mov         eax,dword ptr [eax-8]
 00489AC1    mov         eax,dword ptr [eax+50]
 00489AC4    push        eax
 00489AC5    mov         eax,dword ptr [ebp+8]
 00489AC8    mov         eax,dword ptr [eax-8]
 00489ACB    mov         eax,dword ptr [eax+4C]
 00489ACE    push        eax
 00489ACF    mov         eax,dword ptr [ebp+8]
 00489AD2    mov         eax,dword ptr [eax-4]
 00489AD5    push        eax
 00489AD6    mov         eax,[005AE808];^gvar_005E0DD8
 00489ADB    mov         eax,dword ptr [eax]
 00489ADD    call        eax
 00489ADF    test        eax,eax
>00489AE1    jne         00489AED
 00489AE3    mov         eax,dword ptr [ebp+8]
 00489AE6    mov         eax,dword ptr [eax+8]
 00489AE9    xor         edx,edx
 00489AEB    mov         dword ptr [eax],edx
 00489AED    pop         ebp
 00489AEE    ret
end;*}

//00489AF0
{*procedure sub_00489AF0(?:TGLWin32Context; ?:HDC; ?:?);
begin
 00489AF0    push        ebp
 00489AF1    mov         ebp,esp
 00489AF3    add         esp,0FFFFFFF8
 00489AF6    push        ebx
 00489AF7    push        esi
 00489AF8    mov         dword ptr [ebp-4],edx
 00489AFB    mov         dword ptr [ebp-8],eax
 00489AFE    lea         esi,[ebp-8]
 00489B01    mov         eax,dword ptr [esi]
 00489B03    mov         eax,dword ptr [eax+4]
 00489B06    cmp         eax,40
>00489B09    je          00489B16
 00489B0B    cmp         eax,80
>00489B10    je          00489B16
 00489B12    xor         ebx,ebx
>00489B14    jmp         00489B18
 00489B16    mov         bl,1
 00489B18    mov         ecx,2027
 00489B1D    mov         edx,2003
 00489B22    mov         eax,dword ptr [esi]
 00489B24    call        00489984
 00489B29    test        bl,bl
>00489B2B    je          00489B6C
 00489B2D    mov         eax,[005AE128];^gvar_005E0D25
 00489B32    cmp         byte ptr [eax],0
>00489B35    je          00489B4A
 00489B37    mov         ecx,21A0
 00489B3C    mov         edx,2013
 00489B41    mov         eax,dword ptr [esi]
 00489B43    call        00489984
>00489B48    jmp         00489B6C
 00489B4A    mov         ecx,202B
 00489B4F    mov         edx,2013
 00489B54    mov         eax,dword ptr [esi]
 00489B56    call        00489984
 00489B5B    mov         ecx,1
 00489B60    mov         edx,20B0
 00489B65    mov         eax,dword ptr [esi]
 00489B67    call        00489984
 00489B6C    mov         eax,dword ptr [esi]
 00489B6E    mov         ecx,dword ptr [eax+4]
 00489B71    mov         edx,2014
 00489B76    mov         eax,dword ptr [esi]
 00489B78    call        00489984
 00489B7D    mov         eax,dword ptr [esi]
 00489B7F    mov         eax,dword ptr [eax+8]
 00489B82    test        eax,eax
>00489B84    jle         00489B94
 00489B86    mov         ecx,eax
 00489B88    mov         edx,201B
 00489B8D    mov         eax,dword ptr [esi]
 00489B8F    call        00489984
 00489B94    mov         eax,dword ptr [esi]
 00489B96    mov         ecx,dword ptr [eax+0C]
 00489B99    mov         edx,2022
 00489B9E    mov         eax,dword ptr [esi]
 00489BA0    call        00489984
 00489BA5    mov         eax,dword ptr [esi]
 00489BA7    mov         eax,dword ptr [eax+10]
 00489BAA    test        eax,eax
>00489BAC    jle         00489BBC
 00489BAE    mov         ecx,eax
 00489BB0    mov         edx,2023
 00489BB5    mov         eax,dword ptr [esi]
 00489BB7    call        00489984
 00489BBC    mov         eax,dword ptr [esi]
 00489BBE    mov         eax,dword ptr [eax+14]
 00489BC1    test        eax,eax
>00489BC3    jle         00489BD3
 00489BC5    mov         ecx,eax
 00489BC7    mov         edx,201D
 00489BCC    mov         eax,dword ptr [esi]
 00489BCE    call        00489984
 00489BD3    mov         eax,dword ptr [esi]
 00489BD5    mov         eax,dword ptr [eax+18]
 00489BD8    test        eax,eax
>00489BDA    jle         00489BEA
 00489BDC    mov         ecx,eax
 00489BDE    mov         edx,2024
 00489BE3    mov         eax,dword ptr [esi]
 00489BE5    call        00489984
 00489BEA    mov         eax,dword ptr [esi]
 00489BEC    mov         al,byte ptr [eax+1C]
 00489BEF    test        al,al
>00489BF1    je          00489C47
 00489BF3    mov         edx,dword ptr ds:[5AE344];^gvar_005E0D33:Boolean
 00489BF9    cmp         byte ptr [edx],0
>00489BFC    je          00489C47
 00489BFE    mov         edx,dword ptr ds:[5AE3E4];^gvar_005E0CE1
 00489C04    cmp         byte ptr [edx],0
>00489C07    je          00489C47
 00489C09    cmp         al,1
>00489C0B    jne         00489C1D
 00489C0D    xor         ecx,ecx
 00489C0F    mov         edx,2041
 00489C14    mov         eax,dword ptr [esi]
 00489C16    call        00489984
>00489C1B    jmp         00489C47
 00489C1D    mov         ecx,1
 00489C22    mov         edx,2041
 00489C27    mov         eax,dword ptr [esi]
 00489C29    call        00489984
 00489C2E    mov         eax,dword ptr [esi]
 00489C30    movzx       eax,byte ptr [eax+1C]
 00489C34    mov         ecx,dword ptr [eax*4+5AD6E8];^gvar_00489764
 00489C3B    mov         edx,2042
 00489C40    mov         eax,dword ptr [esi]
 00489C42    call        00489984
 00489C47    mov         eax,dword ptr [esi]
 00489C49    call        00489A7C
 00489C4E    push        ebp
 00489C4F    call        00489AA8
 00489C54    pop         ecx
 00489C55    mov         eax,dword ptr [ebp+8]
 00489C58    cmp         dword ptr [eax],0
>00489C5B    jne         00489C7D
 00489C5D    mov         eax,dword ptr [esi]
 00489C5F    cmp         byte ptr [eax+1C],0
>00489C63    je          00489C7D
 00489C65    mov         edx,2041
 00489C6A    mov         eax,dword ptr [esi]
 00489C6C    call        00489A10
 00489C71    mov         edx,2042
 00489C76    mov         eax,dword ptr [esi]
 00489C78    call        00489A10
 00489C7D    mov         eax,dword ptr [ebp+8]
 00489C80    cmp         dword ptr [eax],0
>00489C83    jne         00489CA5
 00489C85    mov         eax,dword ptr [esi]
 00489C87    cmp         dword ptr [eax+0C],20
>00489C8B    jl          00489CA5
 00489C8D    mov         ecx,18
 00489C92    mov         edx,2022
 00489C97    mov         eax,dword ptr [esi]
 00489C99    call        004899D0
 00489C9E    push        ebp
 00489C9F    call        00489AA8
 00489CA4    pop         ecx
 00489CA5    mov         eax,dword ptr [ebp+8]
 00489CA8    cmp         dword ptr [eax],0
>00489CAB    jne         00489CCD
 00489CAD    mov         eax,dword ptr [esi]
 00489CAF    cmp         dword ptr [eax+0C],18
>00489CB3    jl          00489CCD
 00489CB5    mov         ecx,10
 00489CBA    mov         edx,2022
 00489CBF    mov         eax,dword ptr [esi]
 00489CC1    call        004899D0
 00489CC6    push        ebp
 00489CC7    call        00489AA8
 00489CCC    pop         ecx
 00489CCD    mov         eax,dword ptr [ebp+8]
 00489CD0    cmp         dword ptr [eax],0
>00489CD3    jne         00489CF5
 00489CD5    mov         eax,dword ptr [esi]
 00489CD7    cmp         dword ptr [eax+4],18
>00489CDB    jl          00489CF5
 00489CDD    mov         ecx,10
 00489CE2    mov         edx,2014
 00489CE7    mov         eax,dword ptr [esi]
 00489CE9    call        004899D0
 00489CEE    push        ebp
 00489CEF    call        00489AA8
 00489CF4    pop         ecx
 00489CF5    mov         eax,dword ptr [ebp+8]
 00489CF8    cmp         dword ptr [eax],0
>00489CFB    jne         00489D32
 00489CFD    mov         eax,dword ptr [esi]
 00489CFF    mov         ecx,dword ptr [eax+4]
 00489D02    mov         edx,2014
 00489D07    mov         eax,dword ptr [esi]
 00489D09    call        004899D0
 00489D0E    mov         eax,dword ptr [esi]
 00489D10    mov         ecx,dword ptr [eax+0C]
 00489D13    mov         edx,2022
 00489D18    mov         eax,dword ptr [esi]
 00489D1A    call        004899D0
 00489D1F    mov         edx,2003
 00489D24    mov         eax,dword ptr [esi]
 00489D26    call        00489A10
 00489D2B    push        ebp
 00489D2C    call        00489AA8
 00489D31    pop         ecx
 00489D32    pop         esi
 00489D33    pop         ebx
 00489D34    pop         ecx
 00489D35    pop         ecx
 00489D36    pop         ebp
 00489D37    ret         8
end;*}

//00489D3C
{*function sub_00489D3C(?:?):Boolean;
begin
 00489D3C    push        ebp
 00489D3D    mov         ebp,esp
 00489D3F    add         esp,0FFFFFFD8
 00489D42    xor         eax,eax
 00489D44    mov         edx,dword ptr [ebp+8]
 00489D47    cmp         dword ptr [edx-4],0
>00489D4B    je          00489D79
 00489D4D    mov         word ptr [ebp-28],28
 00489D53    mov         word ptr [ebp-26],1
 00489D59    lea         eax,[ebp-28]
 00489D5C    push        eax
 00489D5D    push        28
 00489D5F    mov         eax,dword ptr [ebp+8]
 00489D62    mov         eax,dword ptr [eax-4]
 00489D65    push        eax
 00489D66    mov         eax,dword ptr [ebp+8]
 00489D69    mov         eax,dword ptr [eax-8]
 00489D6C    push        eax
 00489D6D    call        gdi32.DescribePixelFormat
 00489D72    test        byte ptr [ebp-24],40
 00489D76    sete        al
 00489D79    mov         esp,ebp
 00489D7B    pop         ebp
 00489D7C    ret
end;*}

//00489D80
{*procedure TGLWin32Context.sub_00489D80(?:?);
begin
 00489D80    push        ebp
 00489D81    mov         ebp,esp
 00489D83    add         esp,0FFFFFF2C
 00489D89    push        ebx
 00489D8A    push        esi
 00489D8B    push        edi
 00489D8C    mov         dword ptr [ebp-0C],eax
 00489D8F    mov         dword ptr [ebp-8],edx
 00489D92    cmp         byte ptr ds:[5AD6C0],0;gvar_005AD6C0
>00489D99    je          00489DB2
 00489D9B    mov         eax,dword ptr [ebp-0C]
 00489D9E    push        eax
 00489D9F    push        489AA0
 00489DA4    mov         eax,dword ptr [ebp-8]
 00489DA7    push        eax
 00489DA8    call        user32.WindowFromDC
 00489DAD    call        0048960C
 00489DB2    call        004650D0
 00489DB7    test        al,al
>00489DB9    jne         00489DC0
 00489DBB    call        0046F7F0
 00489DC0    lea         eax,[ebp-54]
 00489DC3    xor         ecx,ecx
 00489DC5    mov         edx,28
 00489DCA    call        @FillChar
 00489DCF    mov         word ptr [ebp-54],28
 00489DD5    mov         word ptr [ebp-52],1
 00489DDB    mov         dword ptr [ebp-50],20
 00489DE2    mov         eax,dword ptr [ebp-8]
 00489DE5    push        eax
 00489DE6    call        gdi32.GetObjectType
 00489DEB    mov         dword ptr [ebp-14],eax
 00489DEE    cmp         dword ptr [ebp-14],0
>00489DF2    jne         00489DF9
 00489DF4    call        0046F7F0
 00489DF9    mov         eax,dword ptr [ebp-14]
 00489DFC    sub         eax,4
>00489DFF    je          00489E0B
 00489E01    sub         eax,6
>00489E04    je          00489E0B
 00489E06    sub         eax,2
>00489E09    jne         00489E11
 00489E0B    or          dword ptr [ebp-50],8
>00489E0F    jmp         00489E15
 00489E11    or          dword ptr [ebp-50],4
 00489E15    mov         eax,dword ptr [ebp-0C]
 00489E18    test        byte ptr [eax+1D],1;TGLWin32Context.?f1D:byte
>00489E1C    je          00489E22
 00489E1E    or          dword ptr [ebp-50],1
 00489E22    mov         eax,dword ptr [ebp-0C]
 00489E25    test        byte ptr [eax+1D],2;TGLWin32Context.?f1D:byte
>00489E29    je          00489E2F
 00489E2B    or          dword ptr [ebp-50],2
 00489E2F    mov         byte ptr [ebp-4C],0
 00489E33    mov         eax,dword ptr [ebp-0C]
 00489E36    mov         al,byte ptr [eax+4];TGLWin32Context.?f4:byte
 00489E39    mov         byte ptr [ebp-4B],al
 00489E3C    mov         eax,dword ptr [ebp-0C]
 00489E3F    mov         al,byte ptr [eax+0C];TGLWin32Context.?fC:byte
 00489E42    mov         byte ptr [ebp-3D],al
 00489E45    mov         eax,dword ptr [ebp-0C]
 00489E48    mov         al,byte ptr [eax+10];TGLWin32Context.?f10:byte
 00489E4B    mov         byte ptr [ebp-3C],al
 00489E4E    mov         eax,dword ptr [ebp-0C]
 00489E51    mov         al,byte ptr [eax+14];TGLWin32Context.?f14:byte
 00489E54    mov         byte ptr [ebp-42],al
 00489E57    mov         eax,dword ptr [ebp-0C]
 00489E5A    mov         al,byte ptr [eax+8];TGLWin32Context.?f8:byte
 00489E5D    mov         byte ptr [ebp-44],al
 00489E60    mov         eax,dword ptr [ebp-0C]
 00489E63    mov         al,byte ptr [eax+18];TGLWin32Context.?f18:byte
 00489E66    mov         byte ptr [ebp-3B],al
 00489E69    mov         byte ptr [ebp-3A],0
 00489E6D    xor         eax,eax
 00489E6F    mov         dword ptr [ebp-4],eax
 00489E72    call        004651C8
 00489E77    test        al,al
>00489E79    jne         0048A0A1
 00489E7F    mov         eax,dword ptr [ebp-0C]
 00489E82    cmp         byte ptr [eax+54],0;TGLWin32Context.?f54:byte
>00489E86    jne         0048A0A1
 00489E8C    mov         eax,dword ptr [ebp-14]
 00489E8F    sub         eax,4
>00489E92    je          0048A0A1
 00489E98    sub         eax,6
>00489E9B    je          0048A0A1
 00489EA1    sub         eax,2
>00489EA4    je          0048A0A1
 00489EAA    call        00489774
 00489EAF    mov         dword ptr [ebp-18],eax
 00489EB2    mov         eax,dword ptr [ebp-18]
 00489EB5    push        eax
 00489EB6    call        user32.GetDC
 00489EBB    mov         dword ptr [ebp-1C],eax
 00489EBE    xor         eax,eax
 00489EC0    mov         dword ptr [ebp-20],eax
 00489EC3    xor         eax,eax
 00489EC5    mov         dword ptr [ebp-24],eax
 00489EC8    xor         eax,eax
 00489ECA    push        ebp
 00489ECB    push        48A09A
 00489ED0    push        dword ptr fs:[eax]
 00489ED3    mov         dword ptr fs:[eax],esp
 00489ED6    mov         edx,dword ptr [ebp-1C]
 00489ED9    mov         eax,dword ptr [ebp-0C]
 00489EDC    call        0048A1E0
 00489EE1    xor         eax,eax
 00489EE3    push        ebp
 00489EE4    push        48A05F
 00489EE9    push        dword ptr fs:[eax]
 00489EEC    mov         dword ptr fs:[eax],esp
 00489EEF    mov         eax,dword ptr [ebp-0C]
 00489EF2    mov         edx,dword ptr [eax]
 00489EF4    call        dword ptr [edx];TGLWin32Context.sub_0048A7B0
 00489EF6    xor         eax,eax
 00489EF8    push        ebp
 00489EF9    push        48A03E
 00489EFE    push        dword ptr fs:[eax]
 00489F01    mov         dword ptr fs:[eax],esp
 00489F04    call        0046C3B8
 00489F09    mov         eax,[005AE11C];^gvar_005E0D35:Boolean
 00489F0E    cmp         byte ptr [eax],0
>00489F11    je          0048A028
 00489F17    mov         eax,dword ptr [ebp-0C]
 00489F1A    call        00489960
 00489F1F    mov         ecx,1
 00489F24    mov         edx,2001
 00489F29    mov         eax,dword ptr [ebp-0C]
 00489F2C    call        00489984
 00489F31    mov         eax,dword ptr [ebp-0C]
 00489F34    test        byte ptr [eax+1D],2;TGLWin32Context.?f1D:byte
 00489F38    setne       al
 00489F3B    and         eax,7F
 00489F3E    mov         ecx,dword ptr [eax*4+5AD700]
 00489F45    mov         edx,2012
 00489F4A    mov         eax,dword ptr [ebp-0C]
 00489F4D    call        00489984
 00489F52    mov         eax,dword ptr [ebp-0C]
 00489F55    test        byte ptr [eax+1D],1;TGLWin32Context.?f1D:byte
 00489F59    setne       al
 00489F5C    and         eax,7F
 00489F5F    mov         ecx,dword ptr [eax*4+5AD700]
 00489F66    mov         edx,2011
 00489F6B    mov         eax,dword ptr [ebp-0C]
 00489F6E    call        00489984
 00489F73    lea         eax,[ebp-0D4]
 00489F79    push        eax
 00489F7A    lea         eax,[ebp-10]
 00489F7D    push        eax
 00489F7E    mov         ecx,20
 00489F83    mov         edx,dword ptr [ebp-8]
 00489F86    mov         eax,dword ptr [ebp-0C]
 00489F89    call        00489AF0
 00489F8E    cmp         dword ptr [ebp-10],0
>00489F92    jle         0048A028
 00489F98    mov         eax,[005AE344];^gvar_005E0D33:Boolean
 00489F9D    cmp         byte ptr [eax],0
>00489FA0    je          00489FF7
 00489FA2    mov         eax,dword ptr [ebp-0C]
 00489FA5    mov         al,byte ptr [eax+1C];TGLWin32Context.?f1C:byte
 00489FA8    sub         al,2
>00489FAA    jae         00489FF7
 00489FAC    mov         dword ptr [ebp-28],2041
 00489FB3    mov         esi,dword ptr [ebp-10]
 00489FB6    dec         esi
 00489FB7    test        esi,esi
>00489FB9    jl          0048A000
 00489FBB    inc         esi
 00489FBC    lea         ebx,[ebp-0D4]
 00489FC2    mov         eax,dword ptr [ebx]
 00489FC4    mov         dword ptr [ebp-4],eax
 00489FC7    xor         eax,eax
 00489FC9    mov         dword ptr [ebp-2C],eax
 00489FCC    lea         eax,[ebp-2C]
 00489FCF    push        eax
 00489FD0    lea         eax,[ebp-28]
 00489FD3    push        eax
 00489FD4    push        1
 00489FD6    push        0
 00489FD8    mov         eax,dword ptr [ebp-4]
 00489FDB    push        eax
 00489FDC    mov         eax,dword ptr [ebp-8]
 00489FDF    push        eax
 00489FE0    mov         eax,[005AE20C];^gvar_005E0DD0
 00489FE5    mov         eax,dword ptr [eax]
 00489FE7    call        eax
 00489FE9    cmp         dword ptr [ebp-2C],0
>00489FED    je          0048A000
 00489FEF    add         ebx,4
 00489FF2    dec         esi
>00489FF3    jne         00489FC2
>00489FF5    jmp         0048A000
 00489FF7    mov         eax,dword ptr [ebp-0D4]
 00489FFD    mov         dword ptr [ebp-4],eax
 0048A000    mov         eax,dword ptr [ebp-8]
 0048A003    push        eax
 0048A004    call        gdi32.GetPixelFormat
 0048A009    cmp         eax,dword ptr [ebp-4]
>0048A00C    je          0048A028
 0048A00E    lea         eax,[ebp-54]
 0048A011    push        eax
 0048A012    mov         eax,dword ptr [ebp-4]
 0048A015    push        eax
 0048A016    mov         eax,dword ptr [ebp-8]
 0048A019    push        eax
 0048A01A    call        gdi32.SetPixelFormat
 0048A01F    test        eax,eax
>0048A021    jne         0048A028
 0048A023    call        0046F7F0
 0048A028    xor         eax,eax
 0048A02A    pop         edx
 0048A02B    pop         ecx
 0048A02C    pop         ecx
 0048A02D    mov         dword ptr fs:[eax],edx
 0048A030    push        48A045
 0048A035    mov         eax,dword ptr [ebp-0C]
 0048A038    mov         edx,dword ptr [eax]
 0048A03A    call        dword ptr [edx+4];TGLWin32Context.sub_0048A908
 0048A03D    ret
>0048A03E    jmp         @HandleFinally
>0048A043    jmp         0048A035
 0048A045    xor         eax,eax
 0048A047    pop         edx
 0048A048    pop         ecx
 0048A049    pop         ecx
 0048A04A    mov         dword ptr fs:[eax],edx
 0048A04D    push        48A066
 0048A052    mov         eax,dword ptr [ebp-0C]
 0048A055    mov         si,0FFFC
 0048A059    call        @CallDynaInst;TGLWin32Context.sub_0048A6FC
 0048A05E    ret
>0048A05F    jmp         @HandleFinally
>0048A064    jmp         0048A052
 0048A066    xor         eax,eax
 0048A068    pop         edx
 0048A069    pop         ecx
 0048A06A    pop         ecx
 0048A06B    mov         dword ptr fs:[eax],edx
 0048A06E    push        48A0A1
 0048A073    mov         eax,dword ptr [ebp-1C]
 0048A076    push        eax
 0048A077    push        0
 0048A079    call        user32.ReleaseDC
 0048A07E    mov         eax,dword ptr [ebp-18]
 0048A081    push        eax
 0048A082    call        user32.DestroyWindow
 0048A087    mov         eax,dword ptr [ebp-0C]
 0048A08A    mov         edx,dword ptr [ebp-20]
 0048A08D    mov         dword ptr [eax+44],edx;TGLWin32Context.?f44:dword
 0048A090    mov         eax,dword ptr [ebp-0C]
 0048A093    mov         edx,dword ptr [ebp-24]
 0048A096    mov         dword ptr [eax+40],edx;TGLWin32Context.?f40:HGLRC
 0048A099    ret
>0048A09A    jmp         @HandleFinally
>0048A09F    jmp         0048A073
 0048A0A1    cmp         dword ptr [ebp-4],0
>0048A0A5    jne         0048A146
 0048A0AB    lea         eax,[ebp-54]
 0048A0AE    push        eax
 0048A0AF    mov         eax,dword ptr [ebp-8]
 0048A0B2    push        eax
 0048A0B3    call        gdi32.ChoosePixelFormat
 0048A0B8    mov         dword ptr [ebp-4],eax
 0048A0BB    mov         eax,dword ptr [ebp-14]
 0048A0BE    sub         eax,4
>0048A0C1    je          0048A0E2
 0048A0C3    sub         eax,6
>0048A0C6    je          0048A0E2
 0048A0C8    sub         eax,2
>0048A0CB    je          0048A0E2
 0048A0CD    push        ebp
 0048A0CE    call        00489D3C
 0048A0D3    pop         ecx
 0048A0D4    test        al,al
>0048A0D6    jne         0048A0E2
 0048A0D8    mov         ebx,dword ptr [ebp-4]
 0048A0DB    xor         eax,eax
 0048A0DD    mov         dword ptr [ebp-4],eax
>0048A0E0    jmp         0048A0E4
 0048A0E2    xor         ebx,ebx
 0048A0E4    cmp         dword ptr [ebp-4],0
>0048A0E8    jne         0048A141
 0048A0EA    mov         byte ptr [ebp-3D],10
 0048A0EE    lea         eax,[ebp-54]
 0048A0F1    push        eax
 0048A0F2    mov         eax,dword ptr [ebp-8]
 0048A0F5    push        eax
 0048A0F6    call        gdi32.ChoosePixelFormat
 0048A0FB    mov         dword ptr [ebp-4],eax
 0048A0FE    push        ebp
 0048A0FF    call        00489D3C
 0048A104    pop         ecx
 0048A105    test        al,al
>0048A107    jne         0048A10E
 0048A109    xor         eax,eax
 0048A10B    mov         dword ptr [ebp-4],eax
 0048A10E    cmp         dword ptr [ebp-4],0
>0048A112    jne         0048A128
 0048A114    mov         byte ptr [ebp-4B],10
 0048A118    lea         eax,[ebp-54]
 0048A11B    push        eax
 0048A11C    mov         eax,dword ptr [ebp-8]
 0048A11F    push        eax
 0048A120    call        gdi32.ChoosePixelFormat
 0048A125    mov         dword ptr [ebp-4],eax
 0048A128    push        ebp
 0048A129    call        00489D3C
 0048A12E    pop         ecx
 0048A12F    test        al,al
>0048A131    jne         0048A136
 0048A133    mov         dword ptr [ebp-4],ebx
 0048A136    cmp         dword ptr [ebp-4],0
>0048A13A    jne         0048A141
 0048A13C    call        0046F7F0
 0048A141    call        0046C3B8
 0048A146    mov         eax,dword ptr [ebp-8]
 0048A149    push        eax
 0048A14A    call        gdi32.GetPixelFormat
 0048A14F    cmp         eax,dword ptr [ebp-4]
>0048A152    je          0048A16E
 0048A154    lea         eax,[ebp-54]
 0048A157    push        eax
 0048A158    mov         eax,dword ptr [ebp-4]
 0048A15B    push        eax
 0048A15C    mov         eax,dword ptr [ebp-8]
 0048A15F    push        eax
 0048A160    call        gdi32.SetPixelFormat
 0048A165    test        eax,eax
>0048A167    jne         0048A16E
 0048A169    call        0046F7F0
 0048A16E    lea         eax,[ebp-54]
 0048A171    push        eax
 0048A172    push        28
 0048A174    mov         eax,dword ptr [ebp-4]
 0048A177    push        eax
 0048A178    mov         eax,dword ptr [ebp-8]
 0048A17B    push        eax
 0048A17C    call        gdi32.DescribePixelFormat
 0048A181    test        byte ptr [ebp-50],80
>0048A185    je          0048A192
 0048A187    lea         edx,[ebp-54]
 0048A18A    mov         eax,dword ptr [ebp-8]
 0048A18D    call        0048984C
 0048A192    test        dword ptr [ebp-50],40
>0048A199    jbe         0048A1A4
 0048A19B    mov         eax,dword ptr [ebp-0C]
 0048A19E    mov         byte ptr [eax+38],2;TGLWin32Context.?f38:byte
>0048A1A2    jmp         0048A1AB
 0048A1A4    mov         eax,dword ptr [ebp-0C]
 0048A1A7    mov         byte ptr [eax+38],1;TGLWin32Context.?f38:byte
 0048A1AB    mov         eax,dword ptr [ebp-8]
 0048A1AE    push        eax
 0048A1AF    call        OpenGL32.wglCreateContext
 0048A1B4    mov         ebx,eax
 0048A1B6    mov         eax,dword ptr [ebp-0C]
 0048A1B9    mov         dword ptr [eax+40],ebx;TGLWin32Context.?f40:HGLRC
 0048A1BC    test        ebx,ebx
>0048A1BE    jne         0048A1C7
 0048A1C0    call        0046F7F0
>0048A1C5    jmp         0048A1CE
 0048A1C7    xor         eax,eax
 0048A1C9    mov         [005E1548],eax;gvar_005E1548:Integer
 0048A1CE    mov         eax,dword ptr [ebp-0C]
 0048A1D1    mov         edx,dword ptr [ebp-8]
 0048A1D4    mov         dword ptr [eax+44],edx;TGLWin32Context.?f44:dword
 0048A1D7    pop         edi
 0048A1D8    pop         esi
 0048A1D9    pop         ebx
 0048A1DA    mov         esp,ebp
 0048A1DC    pop         ebp
 0048A1DD    ret
end;*}

//0048A1E0
procedure sub_0048A1E0(?:TGLWin32Context);
begin
{*
 0048A1E0    push        ebp
 0048A1E1    mov         ebp,esp
 0048A1E3    add         esp,0FFFFFEF0
 0048A1E9    push        ebx
 0048A1EA    push        esi
 0048A1EB    push        edi
 0048A1EC    xor         ecx,ecx
 0048A1EE    mov         dword ptr [ebp-8],ecx
 0048A1F1    mov         dword ptr [ebp-0C],ecx
 0048A1F4    mov         dword ptr [ebp-10],ecx
 0048A1F7    mov         dword ptr [ebp-4],eax
 0048A1FA    xor         eax,eax
 0048A1FC    push        ebp
 0048A1FD    push        48A2EC
 0048A202    push        dword ptr fs:[eax]
 0048A205    mov         dword ptr fs:[eax],esp
 0048A208    xor         eax,eax
 0048A20A    push        ebp
 0048A20B    push        48A25D
 0048A210    push        dword ptr fs:[eax]
 0048A213    mov         dword ptr fs:[eax],esp
 0048A216    mov         eax,dword ptr [ebp-4]
 0048A219    mov         byte ptr [eax+54],1;TGLWin32Context.?f54:byte
 0048A21D    xor         eax,eax
 0048A21F    push        ebp
 0048A220    push        48A24C
 0048A225    push        dword ptr fs:[eax]
 0048A228    mov         dword ptr fs:[eax],esp
 0048A22B    mov         eax,dword ptr [ebp-4]
 0048A22E    mov         si,0FFFF
 0048A232    call        @CallDynaInst;TGLWin32Context.sub_00489D80
 0048A237    xor         eax,eax
 0048A239    pop         edx
 0048A23A    pop         ecx
 0048A23B    pop         ecx
 0048A23C    mov         dword ptr fs:[eax],edx
 0048A23F    push        48A253
 0048A244    mov         eax,dword ptr [ebp-4]
 0048A247    mov         byte ptr [eax+54],0;TGLWin32Context.?f54:byte
 0048A24B    ret
>0048A24C    jmp         @HandleFinally
>0048A251    jmp         0048A244
 0048A253    xor         eax,eax
 0048A255    pop         edx
 0048A256    pop         ecx
 0048A257    pop         ecx
 0048A258    mov         dword ptr fs:[eax],edx
>0048A25B    jmp         0048A2D1
>0048A25D    jmp         @HandleOnException
 0048A262    dd          1
 0048A266    dd          00408B30;Exception
 0048A26A    dd          0048A26E
 0048A26E    mov         ebx,eax
 0048A270    lea         edx,[ebp-0C]
 0048A273    mov         eax,489520;^gvar_005AF664
 0048A278    call        LoadStr
 0048A27D    push        dword ptr [ebp-0C]
 0048A280    push        48A304;#13+#10
 0048A285    lea         edx,[ebp-110]
 0048A28B    mov         eax,dword ptr [ebx]
 0048A28D    call        TObject.ClassName
 0048A292    lea         edx,[ebp-110]
 0048A298    lea         eax,[ebp-10]
 0048A29B    call        @LStrFromString
 0048A2A0    push        dword ptr [ebp-10]
 0048A2A3    push        48A310;': '
 0048A2A8    push        dword ptr [ebx+4];Exception.FMessage:String
 0048A2AB    lea         eax,[ebp-8]
 0048A2AE    mov         edx,5
 0048A2B3    call        @LStrCatN
 0048A2B8    mov         ecx,dword ptr [ebp-8]
 0048A2BB    mov         dl,1
 0048A2BD    mov         eax,[00408B30];Exception
 0048A2C2    call        Exception.Create;Exception.Create
 0048A2C7    call        @RaiseExcept
 0048A2CC    call        @DoneExcept
 0048A2D1    xor         eax,eax
 0048A2D3    pop         edx
 0048A2D4    pop         ecx
 0048A2D5    pop         ecx
 0048A2D6    mov         dword ptr fs:[eax],edx
 0048A2D9    push        48A2F3
 0048A2DE    lea         eax,[ebp-10]
 0048A2E1    mov         edx,3
 0048A2E6    call        @LStrArrayClr
 0048A2EB    ret
>0048A2EC    jmp         @HandleFinally
>0048A2F1    jmp         0048A2DE
 0048A2F3    pop         edi
 0048A2F4    pop         esi
 0048A2F5    pop         ebx
 0048A2F6    mov         esp,ebp
 0048A2F8    pop         ebp
 0048A2F9    ret
*}
end;

//0048A314
{*procedure TGLWin32Context.sub_0048A314(?:?; ?:?; ?:?);
begin
 0048A314    push        ebp
 0048A315    mov         ebp,esp
 0048A317    add         esp,0FFFFFF60
 0048A31D    push        ebx
 0048A31E    push        esi
 0048A31F    push        edi
 0048A320    mov         ebx,ecx
 0048A322    mov         dword ptr [ebp-4],eax
 0048A325    xor         eax,eax
 0048A327    mov         dword ptr [ebp-10],eax
 0048A32A    xor         eax,eax
 0048A32C    mov         dword ptr [ebp-14],eax
 0048A32F    xor         eax,eax
 0048A331    mov         dword ptr [ebp-18],eax
 0048A334    call        00489774
 0048A339    mov         dword ptr [ebp-20],eax
 0048A33C    mov         eax,dword ptr [ebp-20]
 0048A33F    push        eax
 0048A340    call        user32.GetDC
 0048A345    mov         dword ptr [ebp-1C],eax
 0048A348    xor         eax,eax
 0048A34A    push        ebp
 0048A34B    push        48A58F
 0048A350    push        dword ptr fs:[eax]
 0048A353    mov         dword ptr fs:[eax],esp
 0048A356    mov         edx,dword ptr [ebp-1C]
 0048A359    mov         eax,dword ptr [ebp-4]
 0048A35C    call        0048A1E0
 0048A361    xor         eax,eax
 0048A363    push        ebp
 0048A364    push        48A54B
 0048A369    push        dword ptr fs:[eax]
 0048A36C    mov         dword ptr fs:[eax],esp
 0048A36F    mov         eax,dword ptr [ebp-4]
 0048A372    mov         edx,dword ptr [eax]
 0048A374    call        dword ptr [edx];TGLWin32Context.sub_0048A7B0
 0048A376    xor         eax,eax
 0048A378    push        ebp
 0048A379    push        48A52A
 0048A37E    push        dword ptr fs:[eax]
 0048A381    mov         dword ptr fs:[eax],esp
 0048A384    call        0046C3B8
 0048A389    mov         eax,[005AE11C];^gvar_005E0D35:Boolean
 0048A38E    cmp         byte ptr [eax],0
>0048A391    je          0048A4F9
 0048A397    mov         eax,[005AE498];^gvar_005E0D36:Boolean
 0048A39C    cmp         byte ptr [eax],0
>0048A39F    je          0048A4F9
 0048A3A5    mov         eax,dword ptr [ebp-4]
 0048A3A8    call        00489960
 0048A3AD    mov         ecx,1
 0048A3B2    mov         edx,202D
 0048A3B7    mov         eax,dword ptr [ebp-4]
 0048A3BA    call        00489984
 0048A3BF    lea         eax,[ebp-0A0]
 0048A3C5    push        eax
 0048A3C6    lea         eax,[ebp-8]
 0048A3C9    push        eax
 0048A3CA    mov         ecx,20
 0048A3CF    mov         edx,dword ptr [ebp-1C]
 0048A3D2    mov         eax,dword ptr [ebp-4]
 0048A3D5    call        00489AF0
 0048A3DA    cmp         dword ptr [ebp-8],0
>0048A3DE    jne         0048A3F6
 0048A3E0    mov         ecx,48A5B0;'Format not supported for pbuffer operation.'
 0048A3E5    mov         dl,1
 0048A3E7    mov         eax,[00408B30];Exception
 0048A3EC    call        Exception.Create;Exception.Create
 0048A3F1    call        @RaiseExcept
 0048A3F6    xor         eax,eax
 0048A3F8    mov         dword ptr [ebp-0C],eax
 0048A3FB    lea         eax,[ebp-0C]
 0048A3FE    push        eax
 0048A3FF    mov         eax,dword ptr [ebp+8]
 0048A402    push        eax
 0048A403    push        ebx
 0048A404    mov         eax,dword ptr [ebp-0A0]
 0048A40A    push        eax
 0048A40B    mov         eax,dword ptr [ebp-1C]
 0048A40E    push        eax
 0048A40F    mov         eax,[005AE1C8];^gvar_005E0DDC
 0048A414    mov         eax,dword ptr [eax]
 0048A416    call        eax
 0048A418    mov         dword ptr [ebp-10],eax
 0048A41B    cmp         dword ptr [ebp-10],0
>0048A41F    jne         0048A437
 0048A421    mov         ecx,48A5E4;'Unabled to create pbuffer.'
 0048A426    mov         dl,1
 0048A428    mov         eax,[00408B30];Exception
 0048A42D    call        Exception.Create;Exception.Create
 0048A432    call        @RaiseExcept
 0048A437    xor         eax,eax
 0048A439    push        ebp
 0048A43A    push        48A4DB
 0048A43F    push        dword ptr fs:[eax]
 0048A442    mov         dword ptr fs:[eax],esp
 0048A445    mov         eax,dword ptr [ebp-10]
 0048A448    push        eax
 0048A449    mov         eax,[005AE44C];^gvar_005E0DE0
 0048A44E    mov         eax,dword ptr [eax]
 0048A450    call        eax
 0048A452    mov         dword ptr [ebp-14],eax
 0048A455    cmp         dword ptr [ebp-14],0
>0048A459    jne         0048A471
 0048A45B    mov         ecx,48A608;'Unabled to create pbuffer's DC.'
 0048A460    mov         dl,1
 0048A462    mov         eax,[00408B30];Exception
 0048A467    call        Exception.Create;Exception.Create
 0048A46C    call        @RaiseExcept
 0048A471    xor         eax,eax
 0048A473    push        ebp
 0048A474    push        48A4B1
 0048A479    push        dword ptr fs:[eax]
 0048A47C    mov         dword ptr fs:[eax],esp
 0048A47F    mov         eax,dword ptr [ebp-14]
 0048A482    push        eax
 0048A483    call        OpenGL32.wglCreateContext
 0048A488    mov         dword ptr [ebp-18],eax
 0048A48B    cmp         dword ptr [ebp-18],0
>0048A48F    jne         0048A4A7
 0048A491    mov         ecx,48A630;'Unabled to create pbuffer's RC.'
 0048A496    mov         dl,1
 0048A498    mov         eax,[00408B30];Exception
 0048A49D    call        Exception.Create;Exception.Create
 0048A4A2    call        @RaiseExcept
 0048A4A7    xor         eax,eax
 0048A4A9    pop         edx
 0048A4AA    pop         ecx
 0048A4AB    pop         ecx
 0048A4AC    mov         dword ptr fs:[eax],edx
>0048A4AF    jmp         0048A4D1
>0048A4B1    jmp         @HandleAnyException
 0048A4B6    mov         eax,dword ptr [ebp-14]
 0048A4B9    push        eax
 0048A4BA    mov         eax,dword ptr [ebp-10]
 0048A4BD    push        eax
 0048A4BE    mov         eax,[005AE13C];^gvar_005E0DE4
 0048A4C3    mov         eax,dword ptr [eax]
 0048A4C5    call        eax
 0048A4C7    call        @RaiseAgain
 0048A4CC    call        @DoneExcept
 0048A4D1    xor         eax,eax
 0048A4D3    pop         edx
 0048A4D4    pop         ecx
 0048A4D5    pop         ecx
 0048A4D6    mov         dword ptr fs:[eax],edx
>0048A4D9    jmp         0048A50F
>0048A4DB    jmp         @HandleAnyException
 0048A4E0    mov         eax,dword ptr [ebp-10]
 0048A4E3    push        eax
 0048A4E4    mov         eax,[005AE6CC];^gvar_005E0DE8
 0048A4E9    mov         eax,dword ptr [eax]
 0048A4EB    call        eax
 0048A4ED    call        @RaiseAgain
 0048A4F2    call        @DoneExcept
>0048A4F7    jmp         0048A50F
 0048A4F9    mov         ecx,48A658;'WGL_ARB_pbuffer support required.'
 0048A4FE    mov         dl,1
 0048A500    mov         eax,[00408B30];Exception
 0048A505    call        Exception.Create;Exception.Create
 0048A50A    call        @RaiseExcept
 0048A50F    call        0046C304
 0048A514    xor         eax,eax
 0048A516    pop         edx
 0048A517    pop         ecx
 0048A518    pop         ecx
 0048A519    mov         dword ptr fs:[eax],edx
 0048A51C    push        48A531
 0048A521    mov         eax,dword ptr [ebp-4]
 0048A524    mov         edx,dword ptr [eax]
 0048A526    call        dword ptr [edx+4];TGLWin32Context.sub_0048A908
 0048A529    ret
>0048A52A    jmp         @HandleFinally
>0048A52F    jmp         0048A521
 0048A531    xor         eax,eax
 0048A533    pop         edx
 0048A534    pop         ecx
 0048A535    pop         ecx
 0048A536    mov         dword ptr fs:[eax],edx
 0048A539    push        48A552
 0048A53E    mov         eax,dword ptr [ebp-4]
 0048A541    mov         si,0FFFC
 0048A545    call        @CallDynaInst;TGLWin32Context.sub_0048A6FC
 0048A54A    ret
>0048A54B    jmp         @HandleFinally
>0048A550    jmp         0048A53E
 0048A552    xor         eax,eax
 0048A554    pop         edx
 0048A555    pop         ecx
 0048A556    pop         ecx
 0048A557    mov         dword ptr fs:[eax],edx
 0048A55A    push        48A596
 0048A55F    mov         eax,dword ptr [ebp-1C]
 0048A562    push        eax
 0048A563    push        0
 0048A565    call        user32.ReleaseDC
 0048A56A    mov         eax,dword ptr [ebp-20]
 0048A56D    push        eax
 0048A56E    call        user32.DestroyWindow
 0048A573    mov         eax,dword ptr [ebp-4]
 0048A576    mov         edx,dword ptr [ebp-10]
 0048A579    mov         dword ptr [eax+48],edx;TGLWin32Context.?f48:dword
 0048A57C    mov         eax,dword ptr [ebp-4]
 0048A57F    mov         edx,dword ptr [ebp-14]
 0048A582    mov         dword ptr [eax+44],edx;TGLWin32Context.?f44:dword
 0048A585    mov         eax,dword ptr [ebp-4]
 0048A588    mov         edx,dword ptr [ebp-18]
 0048A58B    mov         dword ptr [eax+40],edx;TGLWin32Context.?f40:HGLRC
 0048A58E    ret
>0048A58F    jmp         @HandleFinally
>0048A594    jmp         0048A55F
 0048A596    mov         eax,dword ptr [ebp-4]
 0048A599    mov         byte ptr [eax+38],1;TGLWin32Context.?f38:byte
 0048A59D    pop         edi
 0048A59E    pop         esi
 0048A59F    pop         ebx
 0048A5A0    mov         esp,ebp
 0048A5A2    pop         ebp
 0048A5A3    ret         4
end;*}

//0048A67C
{*procedure TGLWin32Context.sub_0048A67C(?:?);
begin
 0048A67C    push        ebp
 0048A67D    mov         ebp,esp
 0048A67F    push        0
 0048A681    push        ebx
 0048A682    push        esi
 0048A683    mov         esi,edx
 0048A685    mov         ebx,eax
 0048A687    xor         eax,eax
 0048A689    push        ebp
 0048A68A    push        48A6F0
 0048A68F    push        dword ptr fs:[eax]
 0048A692    mov         dword ptr fs:[eax],esp
 0048A695    mov         eax,esi
 0048A697    mov         edx,dword ptr ds:[489458];TGLWin32Context
 0048A69D    call        @IsClass
 0048A6A2    test        al,al
>0048A6A4    je          0048A6B9
 0048A6A6    mov         eax,dword ptr [esi+40]
 0048A6A9    mov         edx,dword ptr [ebx+40];TGLWin32Context.?f40:HGLRC
 0048A6AC    cmp         eax,edx
>0048A6AE    je          0048A6DA
 0048A6B0    push        eax
 0048A6B1    push        edx
 0048A6B2    call        OpenGL32.wglShareLists
>0048A6B7    jmp         0048A6DA
 0048A6B9    lea         edx,[ebp-4]
 0048A6BC    mov         eax,489500;^gvar_005AF664
 0048A6C1    call        LoadStr
 0048A6C6    mov         ecx,dword ptr [ebp-4]
 0048A6C9    mov         dl,1
 0048A6CB    mov         eax,[00408B30];Exception
 0048A6D0    call        Exception.Create;Exception.Create
 0048A6D5    call        @RaiseExcept
 0048A6DA    xor         eax,eax
 0048A6DC    pop         edx
 0048A6DD    pop         ecx
 0048A6DE    pop         ecx
 0048A6DF    mov         dword ptr fs:[eax],edx
 0048A6E2    push        48A6F7
 0048A6E7    lea         eax,[ebp-4]
 0048A6EA    call        @LStrClr
 0048A6EF    ret
>0048A6F0    jmp         @HandleFinally
>0048A6F5    jmp         0048A6E7
 0048A6F7    pop         esi
 0048A6F8    pop         ebx
 0048A6F9    pop         ecx
 0048A6FA    pop         ebp
 0048A6FB    ret
end;*}

//0048A6FC
procedure TGLWin32Context.sub_0048A6FC;
begin
{*
 0048A6FC    push        ebp
 0048A6FD    mov         ebp,esp
 0048A6FF    push        0
 0048A701    push        ebx
 0048A702    push        esi
 0048A703    mov         ebx,eax
 0048A705    xor         eax,eax
 0048A707    push        ebp
 0048A708    push        48A7A3
 0048A70D    push        dword ptr fs:[eax]
 0048A710    mov         dword ptr fs:[eax],esp
 0048A713    cmp         byte ptr ds:[5AD6C0],0;gvar_005AD6C0
>0048A71A    je          0048A72A
 0048A71C    mov         eax,dword ptr [ebx+44];TGLWin32Context.?f44:dword
 0048A71F    push        eax
 0048A720    call        user32.WindowFromDC
 0048A725    call        004896A0
 0048A72A    mov         esi,dword ptr [ebx+40];TGLWin32Context.?f40:HGLRC
 0048A72D    test        esi,esi
>0048A72F    je          0048A75C
 0048A731    push        esi
 0048A732    call        OpenGL32.wglDeleteContext
 0048A737    test        eax,eax
>0048A739    jne         0048A75C
 0048A73B    lea         edx,[ebp-4]
 0048A73E    mov         eax,489508;^gvar_005AF664
 0048A743    call        LoadStr
 0048A748    mov         ecx,dword ptr [ebp-4]
 0048A74B    mov         dl,1
 0048A74D    mov         eax,[0046C220];EGLContext
 0048A752    call        Exception.Create;EGLContext.Create
 0048A757    call        @RaiseExcept
 0048A75C    mov         eax,dword ptr [ebx+48];TGLWin32Context.?f48:dword
 0048A75F    test        eax,eax
>0048A761    je          0048A783
 0048A763    mov         edx,dword ptr [ebx+44];TGLWin32Context.?f44:dword
 0048A766    push        edx
 0048A767    push        eax
 0048A768    mov         eax,[005AE13C];^gvar_005E0DE4
 0048A76D    mov         eax,dword ptr [eax]
 0048A76F    call        eax
 0048A771    mov         eax,dword ptr [ebx+48];TGLWin32Context.?f48:dword
 0048A774    push        eax
 0048A775    mov         eax,[005AE6CC];^gvar_005E0DE8
 0048A77A    mov         eax,dword ptr [eax]
 0048A77C    call        eax
 0048A77E    xor         eax,eax
 0048A780    mov         dword ptr [ebx+48],eax;TGLWin32Context.?f48:dword
 0048A783    xor         eax,eax
 0048A785    mov         dword ptr [ebx+40],eax;TGLWin32Context.?f40:HGLRC
 0048A788    xor         eax,eax
 0048A78A    mov         dword ptr [ebx+44],eax;TGLWin32Context.?f44:dword
 0048A78D    xor         eax,eax
 0048A78F    pop         edx
 0048A790    pop         ecx
 0048A791    pop         ecx
 0048A792    mov         dword ptr fs:[eax],edx
 0048A795    push        48A7AA
 0048A79A    lea         eax,[ebp-4]
 0048A79D    call        @LStrClr
 0048A7A2    ret
>0048A7A3    jmp         @HandleFinally
>0048A7A8    jmp         0048A79A
 0048A7AA    pop         esi
 0048A7AB    pop         ebx
 0048A7AC    pop         ecx
 0048A7AD    pop         ebp
 0048A7AE    ret
*}
end;

//0048A7B0
procedure sub_0048A7B0;
begin
{*
 0048A7B0    push        ebp
 0048A7B1    mov         ebp,esp
 0048A7B3    add         esp,0FFFFFFE0
 0048A7B6    push        ebx
 0048A7B7    push        esi
 0048A7B8    xor         edx,edx
 0048A7BA    mov         dword ptr [ebp-20],edx
 0048A7BD    mov         dword ptr [ebp-4],edx
 0048A7C0    mov         dword ptr [ebp-18],edx
 0048A7C3    mov         dword ptr [ebp-1C],edx
 0048A7C6    mov         ebx,eax
 0048A7C8    xor         eax,eax
 0048A7CA    push        ebp
 0048A7CB    push        48A8FB
 0048A7D0    push        dword ptr fs:[eax]
 0048A7D3    mov         dword ptr fs:[eax],esp
 0048A7D6    mov         eax,dword ptr [ebx+40];TGLWin32Context.?f40:HGLRC
 0048A7D9    push        eax
 0048A7DA    mov         eax,dword ptr [ebx+44];TGLWin32Context.?f44:dword
 0048A7DD    push        eax
 0048A7DE    call        OpenGL32.wglMakeCurrent
 0048A7E3    test        eax,eax
>0048A7E5    jne         0048A841
 0048A7E7    lea         eax,[ebp-4]
 0048A7EA    push        eax
 0048A7EB    call        KERNEL32.GetLastError
 0048A7F0    mov         dword ptr [ebp-14],eax
 0048A7F3    mov         byte ptr [ebp-10],0
 0048A7F7    call        KERNEL32.GetLastError
 0048A7FC    lea         edx,[ebp-18]
 0048A7FF    call        SysErrorMessage
 0048A804    mov         eax,dword ptr [ebp-18]
 0048A807    mov         dword ptr [ebp-0C],eax
 0048A80A    mov         byte ptr [ebp-8],0B
 0048A80E    lea         eax,[ebp-14]
 0048A811    push        eax
 0048A812    lea         edx,[ebp-1C]
 0048A815    mov         eax,489510;^gvar_005AF664
 0048A81A    call        LoadStr
 0048A81F    mov         eax,dword ptr [ebp-1C]
 0048A822    mov         ecx,1
 0048A827    pop         edx
 0048A828    call        Format
 0048A82D    mov         ecx,dword ptr [ebp-4]
 0048A830    mov         dl,1
 0048A832    mov         eax,[0046C220];EGLContext
 0048A837    call        Exception.Create;EGLContext.Create
 0048A83C    call        @RaiseExcept
 0048A841    mov         eax,dword ptr [ebx+44];TGLWin32Context.?f44:dword
 0048A844    push        eax
 0048A845    call        gdi32.GetPixelFormat
 0048A84A    mov         esi,eax
 0048A84C    cmp         esi,dword ptr ds:[5E1548];gvar_005E1548:Integer
>0048A852    je          0048A8AA
 0048A854    push        1F00
 0048A859    call        OpenGL32.glGetString
 0048A85E    mov         edx,eax
 0048A860    lea         eax,[ebp-20]
 0048A863    call        @LStrFromPChar
 0048A868    mov         eax,dword ptr [ebp-20]
 0048A86B    mov         edx,dword ptr ds:[5E154C];gvar_005E154C:AnsiString
 0048A871    call        @LStrCmp
>0048A876    je          0048A89A
 0048A878    call        00460294
 0048A87D    call        00463C68
 0048A882    push        1F00
 0048A887    call        OpenGL32.glGetString
 0048A88C    mov         edx,eax
 0048A88E    mov         eax,5E154C;gvar_005E154C:AnsiString
 0048A893    call        @LStrFromPChar
>0048A898    jmp         0048A8A4
 0048A89A    call        00463810
 0048A89F    call        00464EE4
 0048A8A4    mov         dword ptr ds:[5E1548],esi;gvar_005E1548:Integer
 0048A8AA    mov         al,byte ptr [ebx+1C];TGLWin32Context.?f1C:byte
 0048A8AD    sub         al,3
>0048A8AF    je          0048A8B5
 0048A8B1    sub         al,2
>0048A8B3    jne         0048A8D8
 0048A8B5    mov         eax,[005AE3E4];^gvar_005E0CE1
 0048A8BA    cmp         byte ptr [eax],0
>0048A8BD    je          0048A8D8
 0048A8BF    mov         eax,[005AE1F4];^gvar_005E0D21
 0048A8C4    cmp         byte ptr [eax],0
>0048A8C7    je          0048A8D8
 0048A8C9    push        1102
 0048A8CE    push        8534
 0048A8D3    call        OpenGL32.glHint
 0048A8D8    xor         eax,eax
 0048A8DA    pop         edx
 0048A8DB    pop         ecx
 0048A8DC    pop         ecx
 0048A8DD    mov         dword ptr fs:[eax],edx
 0048A8E0    push        48A902
 0048A8E5    lea         eax,[ebp-20]
 0048A8E8    mov         edx,3
 0048A8ED    call        @LStrArrayClr
 0048A8F2    lea         eax,[ebp-4]
 0048A8F5    call        @LStrClr
 0048A8FA    ret
>0048A8FB    jmp         @HandleFinally
>0048A900    jmp         0048A8E5
 0048A902    pop         esi
 0048A903    pop         ebx
 0048A904    mov         esp,ebp
 0048A906    pop         ebp
 0048A907    ret
*}
end;

//0048A908
procedure sub_0048A908;
begin
{*
 0048A908    push        ebp
 0048A909    mov         ebp,esp
 0048A90B    push        0
 0048A90D    xor         eax,eax
 0048A90F    push        ebp
 0048A910    push        48A95F
 0048A915    push        dword ptr fs:[eax]
 0048A918    mov         dword ptr fs:[eax],esp
 0048A91B    push        0
 0048A91D    push        0
 0048A91F    call        OpenGL32.wglMakeCurrent
 0048A924    test        eax,eax
>0048A926    jne         0048A949
 0048A928    lea         edx,[ebp-4]
 0048A92B    mov         eax,489518;^gvar_005AF664
 0048A930    call        LoadStr
 0048A935    mov         ecx,dword ptr [ebp-4]
 0048A938    mov         dl,1
 0048A93A    mov         eax,[00408B30];Exception
 0048A93F    call        Exception.Create;Exception.Create
 0048A944    call        @RaiseExcept
 0048A949    xor         eax,eax
 0048A94B    pop         edx
 0048A94C    pop         ecx
 0048A94D    pop         ecx
 0048A94E    mov         dword ptr fs:[eax],edx
 0048A951    push        48A966
 0048A956    lea         eax,[ebp-4]
 0048A959    call        @LStrClr
 0048A95E    ret
>0048A95F    jmp         @HandleFinally
>0048A964    jmp         0048A956
 0048A966    pop         ecx
 0048A967    pop         ebp
 0048A968    ret
*}
end;

//0048A96C
function sub_0048A96C:Boolean;
begin
{*
 0048A96C    cmp         dword ptr [eax+40],0;TGLWin32Context.?f40:HGLRC
 0048A970    setne       al
 0048A973    ret
*}
end;

//0048A974
procedure sub_0048A974;
begin
{*
 0048A974    cmp         dword ptr [eax+48],0;TGLWin32Context.?f48:dword
>0048A978    jne         0048A98F
 0048A97A    cmp         dword ptr [eax+44],0;TGLWin32Context.?f44:dword
>0048A97E    je          0048A98F
 0048A980    test        byte ptr [eax+1D],1;TGLWin32Context.?f1D:byte
>0048A984    je          0048A98F
 0048A986    mov         eax,dword ptr [eax+44];TGLWin32Context.?f44:dword
 0048A989    push        eax
 0048A98A    call        gdi32.SwapBuffers
 0048A98F    ret
*}
end;

//0048A990
{*function sub_0048A990:?;
begin
 0048A990    mov         eax,dword ptr [eax+44];TGLWin32Context.?f44:dword
 0048A993    ret
end;*}

Initialization
//0048A9F0
{*
 0048A9F0    push        ebp
 0048A9F1    mov         ebp,esp
 0048A9F3    xor         eax,eax
 0048A9F5    push        ebp
 0048A9F6    push        48AA22
 0048A9FB    push        dword ptr fs:[eax]
 0048A9FE    mov         dword ptr fs:[eax],esp
 0048AA01    sub         dword ptr ds:[5E1534],1
>0048AA08    jae         0048AA14
 0048AA0A    mov         eax,[00489458];TGLWin32Context
 0048AA0F    call        0046C3D0
 0048AA14    xor         eax,eax
 0048AA16    pop         edx
 0048AA17    pop         ecx
 0048AA18    pop         ecx
 0048AA19    mov         dword ptr fs:[eax],edx
 0048AA1C    push        48AA29
 0048AA21    ret
>0048AA22    jmp         @HandleFinally
>0048AA27    jmp         0048AA21
 0048AA29    pop         ebp
 0048AA2A    ret
*}
Finalization
//0048A994
{*
 0048A994    push        ebp
 0048A995    mov         ebp,esp
 0048A997    xor         eax,eax
 0048A999    push        ebp
 0048A99A    push        48A9E5
 0048A99F    push        dword ptr fs:[eax]
 0048A9A2    mov         dword ptr fs:[eax],esp
 0048A9A5    inc         dword ptr ds:[5E1534]
>0048A9AB    jne         0048A9D7
 0048A9AD    mov         eax,5E154C;gvar_005E154C:AnsiString
 0048A9B2    call        @LStrClr
 0048A9B7    mov         eax,5E1540;gvar_005E1540:?
 0048A9BC    mov         edx,dword ptr ds:[489550];.6
 0048A9C2    call        @DynArrayClear
 0048A9C7    mov         eax,5E153C;gvar_005E153C:?
 0048A9CC    mov         edx,dword ptr ds:[489528];.5
 0048A9D2    call        @DynArrayClear
 0048A9D7    xor         eax,eax
 0048A9D9    pop         edx
 0048A9DA    pop         ecx
 0048A9DB    pop         ecx
 0048A9DC    mov         dword ptr fs:[eax],edx
 0048A9DF    push        48A9EC
 0048A9E4    ret
>0048A9E5    jmp         @HandleFinally
>0048A9EA    jmp         0048A9E4
 0048A9EC    pop         ebp
 0048A9ED    ret
*}
end.