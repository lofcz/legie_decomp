//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit97;

interface

uses
  SysUtils, Classes, ;

type
  TMaterialList = class(TObject)
  public
    f4:dword;//f4
    f8:TList;//f8
    destructor Destroy; virtual;//0049A44C
    constructor Create; virtual;//v0//0049A40C
  end;
  TObjectList = class(TObject)
  public
    f4:dword;//f4
    f8:TList;//f8
    fC:TList;//fC
    f10:TList;//f10
    f14:TList;//f14
    destructor Destroy; virtual;//0049A694
    constructor Create; virtual;//v0//0049A628
  end;
  TKeyFramer = class(TObject)
  public
    f4:dword;//f4
    f8:TList;//f8
    fC:TList;//fC
    f10:TList;//f10
    f14:TList;//f14
    destructor Destroy; virtual;//0049A8FC
    constructor Create; virtual;//v0//0049A890
  end;
  TFile3DS = class(TObject)
  public
    //f8:?;//f8
    f1C:dword;//f1C
    f24:TMaterialList;//f24
    f28:TObjectList;//f28
    f2C:TKeyFramer;//f2C
    f30:String;//f30
    //f38:?;//f38
    f3A:word;//f3A
    f3C:dword;//f3C
    destructor Destroy; virtual;//0049AAC8
    constructor Create; virtual;//v0//0049AA08
    constructor v4; virtual;//v4//0049AA68
  end;
    //procedure sub_0049A3F0(?:?; ?:?);//0049A3F0
    constructor Create;//0049A40C
    destructor Destroy;//0049A44C
    //procedure sub_0049A480(?:?);//0049A480
    //function sub_0049A4C4(?:?):?;//0049A4C4
    //function sub_0049A4FC(?:?; ?:?):?;//0049A4FC
    //function sub_0049A5D0(?:?; ?:?):?;//0049A5D0
    constructor Create;//0049A628
    destructor Destroy;//0049A694
    //procedure sub_0049A6E0(?:?);//0049A6E0
    //function sub_0049A790(?:TObjectList):?;//0049A790
    //function sub_0049A7C0(?:TObjectList; ?:?):?;//0049A7C0
    constructor Create;//0049A890
    destructor Destroy;//0049A8FC
    //procedure sub_0049A948(?:?);//0049A948
    constructor Create;//0049AA08
    constructor sub_0049AA68;//0049AA68
    destructor Destroy;//0049AAC8
    //procedure sub_0049AB14(?:?; ?:?);//0049AB14
    procedure sub_0049AC44(?:TFile3DS);//0049AC44
    //procedure sub_0049AE2C(?:?);//0049AE2C
    //function sub_0049AE58(?:?; ?:?):?;//0049AE58
    //function sub_0049AE6C(?:?; ?:?):?;//0049AE6C
    //function sub_0049AEB0(?:?; ?:?):?;//0049AEB0
    //procedure sub_0049AED4(?:?; ?:?; ?:AnsiString);//0049AED4
    //procedure sub_0049AF64(?:?; ?:?);//0049AF64
    procedure sub_0049AF9C(?:TFile3DS);//0049AF9C
    //procedure sub_0049AFE0(?:TFile3DS; ?:?);//0049AFE0
    procedure sub_0049B088(?:TFile3DS);//0049B088
    //procedure sub_0049B0AC(?:?);//0049B0AC
    procedure sub_0049B0CC(?:TFile3DS);//0049B0CC
    procedure sub_0049B144(?:TFile3DS);//0049B144
    //procedure sub_0049B168(?:?);//0049B168
    //procedure sub_0049B18C(?:TFile3DS; ?:?);//0049B18C
    //procedure sub_0049B1BC(?:TFile3DS; ?:?);//0049B1BC
    //procedure sub_0049B274(?:?);//0049B274
    //function sub_0049B2B0(?:?; ?:?):?;//0049B2B0
    //function sub_0049BF84(?:?):?;//0049BF84
    //function sub_0049BF9C(?:TFile3DS):?;//0049BF9C
    //function sub_0049BFB4(?:TFile3DS):?;//0049BFB4
    //function sub_0049BFCC(?:TFile3DS):?;//0049BFCC
    //function sub_0049BFE4(?:?):?;//0049BFE4
    //function sub_0049BFFC(?:TFile3DS):?;//0049BFFC
    //procedure sub_0049C014(?:?; ?:Integer; ?:?);//0049C014
    //function sub_0049C020(?:TFile3DS):?;//0049C020
    //procedure sub_0049C0BC(?:TFile3DS; ?:?; ?:?);//0049C0BC
    //procedure sub_0049C0DC(?:?; ?:?);//0049C0DC
    //procedure sub_0049C104(?:?; ?:?);//0049C104
    //procedure sub_0049C148(?:?; ?:?);//0049C148
    //procedure sub_0049C1DC(?:?; ?:?);//0049C1DC
    //procedure sub_0049E0F8(?:TFile3DS; ?:?);//0049E0F8

implementation

//0049A3F0
{*procedure sub_0049A3F0(?:?; ?:?);
begin
 0049A3F0    push        ebx
 0049A3F1    push        esi
 0049A3F2    mov         esi,edx
 0049A3F4    mov         ebx,eax
 0049A3F6    mov         edx,esi
 0049A3F8    mov         eax,ebx
 0049A3FA    call        StrPas
 0049A3FF    mov         eax,ebx
 0049A401    call        @FreeMem
 0049A406    pop         esi
 0049A407    pop         ebx
 0049A408    ret
end;*}

//0049A40C
constructor TMaterialList.Create;
begin
{*
 0049A40C    push        ebx
 0049A40D    push        esi
 0049A40E    test        dl,dl
>0049A410    je          0049A41A
 0049A412    add         esp,0FFFFFFF0
 0049A415    call        @ClassCreate
 0049A41A    mov         ebx,edx
 0049A41C    mov         esi,eax
 0049A41E    mov         dword ptr [esi+4],ecx;TMaterialList.?f4:dword
 0049A421    mov         dl,1
 0049A423    mov         eax,[00417CEC];TList
 0049A428    call        TObject.Create;TList.Create
 0049A42D    mov         dword ptr [esi+8],eax;TMaterialList.?f8:TList
 0049A430    mov         eax,esi
 0049A432    test        bl,bl
>0049A434    je          0049A445
 0049A436    call        @AfterConstruction
 0049A43B    pop         dword ptr fs:[0]
 0049A442    add         esp,0C
 0049A445    mov         eax,esi
 0049A447    pop         esi
 0049A448    pop         ebx
 0049A449    ret
*}
end;

//0049A44C
destructor TMaterialList.Destroy;
begin
{*
 0049A44C    push        ebx
 0049A44D    push        esi
 0049A44E    call        @BeforeDestruction
 0049A453    mov         ebx,edx
 0049A455    mov         esi,eax
 0049A457    mov         eax,esi
 0049A459    call        0049A480
 0049A45E    mov         eax,dword ptr [esi+8]
 0049A461    call        TObject.Free
 0049A466    mov         edx,ebx
 0049A468    and         dl,0FC
 0049A46B    mov         eax,esi
 0049A46D    call        TObject.Destroy
 0049A472    test        bl,bl
>0049A474    jle         0049A47D
 0049A476    mov         eax,esi
 0049A478    call        @ClassDestroy
 0049A47D    pop         esi
 0049A47E    pop         ebx
 0049A47F    ret
*}
end;

//0049A480
{*procedure sub_0049A480(?:?);
begin
 0049A480    push        ebx
 0049A481    push        esi
 0049A482    push        edi
 0049A483    mov         edi,eax
 0049A485    mov         eax,dword ptr [edi+8]
 0049A488    mov         esi,dword ptr [eax+8]
 0049A48B    dec         esi
 0049A48C    test        esi,esi
>0049A48E    jl          0049A4B4
 0049A490    inc         esi
 0049A491    xor         ebx,ebx
 0049A493    mov         eax,dword ptr [edi+8]
 0049A496    mov         edx,ebx
 0049A498    call        TList.Get
 0049A49D    test        eax,eax
>0049A49F    je          0049A4B0
 0049A4A1    mov         eax,dword ptr [edi+8]
 0049A4A4    mov         edx,ebx
 0049A4A6    call        TList.Get
 0049A4AB    call        00497D44
 0049A4B0    inc         ebx
 0049A4B1    dec         esi
>0049A4B2    jne         0049A493
 0049A4B4    mov         eax,dword ptr [edi+8]
 0049A4B7    xor         edx,edx
 0049A4B9    call        TList.SetCount
 0049A4BE    pop         edi
 0049A4BF    pop         esi
 0049A4C0    pop         ebx
 0049A4C1    ret
end;*}

//0049A4C4
{*function sub_0049A4C4(?:?):?;
begin
 0049A4C4    push        ebx
 0049A4C5    push        esi
 0049A4C6    push        edi
 0049A4C7    mov         ebx,eax
 0049A4C9    mov         esi,dword ptr [ebx+8]
 0049A4CC    cmp         dword ptr [esi+8],0
>0049A4D0    jne         0049A4F1
 0049A4D2    mov         eax,dword ptr [ebx+4]
 0049A4D5    cmp         byte ptr [eax+0D],0
>0049A4D9    je          0049A4F1
 0049A4DB    mov         edi,dword ptr [ebx+4]
 0049A4DE    lea         edx,[edi+8]
 0049A4E1    mov         eax,edi
 0049A4E3    call        00497B3C
 0049A4E8    mov         edx,eax
 0049A4EA    mov         eax,esi
 0049A4EC    call        TList.SetCount
 0049A4F1    mov         eax,dword ptr [ebx+8]
 0049A4F4    mov         eax,dword ptr [eax+8]
 0049A4F7    pop         edi
 0049A4F8    pop         esi
 0049A4F9    pop         ebx
 0049A4FA    ret
end;*}

//0049A4FC
{*function sub_0049A4FC(?:?; ?:?):?;
begin
 0049A4FC    push        ebp
 0049A4FD    mov         ebp,esp
 0049A4FF    mov         ecx,0FC
 0049A504    push        0
 0049A506    push        0
 0049A508    dec         ecx
>0049A509    jne         0049A504
 0049A50B    push        ecx
 0049A50C    push        ebx
 0049A50D    push        esi
 0049A50E    push        edi
 0049A50F    mov         esi,edx
 0049A511    mov         ebx,eax
 0049A513    xor         eax,eax
 0049A515    push        ebp
 0049A516    push        49A5BD
 0049A51B    push        dword ptr fs:[eax]
 0049A51E    mov         dword ptr fs:[eax],esp
 0049A521    xor         edi,edi
 0049A523    mov         eax,ebx
 0049A525    call        0049A4C4
 0049A52A    test        eax,eax
>0049A52C    je          0049A59E
 0049A52E    mov         edx,esi
 0049A530    mov         eax,dword ptr [ebx+8]
 0049A533    call        TList.Get
 0049A538    test        eax,eax
>0049A53A    jne         0049A592
 0049A53C    mov         edx,dword ptr ds:[497068];TMaterial3DS
 0049A542    mov         eax,7E4
 0049A547    call        @New
 0049A54C    mov         edi,eax
 0049A54E    mov         eax,edi
 0049A550    xor         ecx,ecx
 0049A552    mov         edx,7E4
 0049A557    call        @FillChar
 0049A55C    lea         eax,[ebp-7E4]
 0049A562    push        eax
 0049A563    mov         eax,dword ptr [ebx+4]
 0049A566    lea         edx,[eax+8]
 0049A569    mov         ecx,esi
 0049A56B    mov         eax,dword ptr [ebx+4]
 0049A56E    call        00499158
 0049A573    lea         edx,[ebp-7E4]
 0049A579    mov         eax,edi
 0049A57B    mov         ecx,dword ptr ds:[497068];TMaterial3DS
 0049A581    call        @CopyRecord
 0049A586    mov         ecx,edi
 0049A588    mov         edx,esi
 0049A58A    mov         eax,dword ptr [ebx+8]
 0049A58D    call        TList.Put
 0049A592    mov         edx,esi
 0049A594    mov         eax,dword ptr [ebx+8]
 0049A597    call        TList.Get
 0049A59C    mov         edi,eax
 0049A59E    xor         eax,eax
 0049A5A0    pop         edx
 0049A5A1    pop         ecx
 0049A5A2    pop         ecx
 0049A5A3    mov         dword ptr fs:[eax],edx
 0049A5A6    push        49A5C4
 0049A5AB    lea         eax,[ebp-7E4]
 0049A5B1    mov         edx,dword ptr ds:[497068];TMaterial3DS
 0049A5B7    call        @FinalizeRecord
 0049A5BC    ret
>0049A5BD    jmp         @HandleFinally
>0049A5C2    jmp         0049A5AB
 0049A5C4    mov         eax,edi
 0049A5C6    pop         edi
 0049A5C7    pop         esi
 0049A5C8    pop         ebx
 0049A5C9    mov         esp,ebp
 0049A5CB    pop         ebp
 0049A5CC    ret
end;*}

//0049A5D0
{*function sub_0049A5D0(?:?; ?:?):?;
begin
 0049A5D0    push        ebx
 0049A5D1    push        esi
 0049A5D2    push        edi
 0049A5D3    push        ebp
 0049A5D4    add         esp,0FFFFFFF8
 0049A5D7    mov         dword ptr [esp],edx
 0049A5DA    mov         ebp,eax
 0049A5DC    xor         eax,eax
 0049A5DE    mov         dword ptr [esp+4],eax
 0049A5E2    mov         eax,ebp
 0049A5E4    call        0049A4C4
 0049A5E9    mov         esi,eax
 0049A5EB    dec         esi
 0049A5EC    test        esi,esi
>0049A5EE    jl          0049A61A
 0049A5F0    inc         esi
 0049A5F1    xor         edi,edi
 0049A5F3    mov         edx,edi
 0049A5F5    mov         eax,ebp
 0049A5F7    call        0049A4FC
 0049A5FC    mov         ebx,eax
 0049A5FE    test        ebx,ebx
>0049A600    je          0049A616
 0049A602    mov         edx,dword ptr [esp]
 0049A605    mov         eax,dword ptr [ebx]
 0049A607    call        CompareText
 0049A60C    test        eax,eax
>0049A60E    jne         0049A616
 0049A610    mov         dword ptr [esp+4],ebx
>0049A614    jmp         0049A61A
 0049A616    inc         edi
 0049A617    dec         esi
>0049A618    jne         0049A5F3
 0049A61A    mov         eax,dword ptr [esp+4]
 0049A61E    pop         ecx
 0049A61F    pop         edx
 0049A620    pop         ebp
 0049A621    pop         edi
 0049A622    pop         esi
 0049A623    pop         ebx
 0049A624    ret
end;*}

//0049A628
constructor TObjectList.Create;
begin
{*
 0049A628    push        ebx
 0049A629    push        esi
 0049A62A    test        dl,dl
>0049A62C    je          0049A636
 0049A62E    add         esp,0FFFFFFF0
 0049A631    call        @ClassCreate
 0049A636    mov         ebx,edx
 0049A638    mov         esi,eax
 0049A63A    mov         dword ptr [esi+4],ecx;TObjectList.?f4:dword
 0049A63D    mov         dl,1
 0049A63F    mov         eax,[00417CEC];TList
 0049A644    call        TObject.Create;TList.Create
 0049A649    mov         dword ptr [esi+8],eax;TObjectList.?f8:TList
 0049A64C    mov         dl,1
 0049A64E    mov         eax,[00417CEC];TList
 0049A653    call        TObject.Create;TList.Create
 0049A658    mov         dword ptr [esi+0C],eax;TObjectList.?fC:TList
 0049A65B    mov         dl,1
 0049A65D    mov         eax,[00417CEC];TList
 0049A662    call        TObject.Create;TList.Create
 0049A667    mov         dword ptr [esi+10],eax;TObjectList.?f10:TList
 0049A66A    mov         dl,1
 0049A66C    mov         eax,[00417CEC];TList
 0049A671    call        TObject.Create;TList.Create
 0049A676    mov         dword ptr [esi+14],eax;TObjectList.?f14:TList
 0049A679    mov         eax,esi
 0049A67B    test        bl,bl
>0049A67D    je          0049A68E
 0049A67F    call        @AfterConstruction
 0049A684    pop         dword ptr fs:[0]
 0049A68B    add         esp,0C
 0049A68E    mov         eax,esi
 0049A690    pop         esi
 0049A691    pop         ebx
 0049A692    ret
*}
end;

//0049A694
destructor TObjectList.Destroy;
begin
{*
 0049A694    push        ebx
 0049A695    push        esi
 0049A696    call        @BeforeDestruction
 0049A69B    mov         ebx,edx
 0049A69D    mov         esi,eax
 0049A69F    mov         eax,esi
 0049A6A1    call        0049A6E0
 0049A6A6    mov         eax,dword ptr [esi+8]
 0049A6A9    call        TObject.Free
 0049A6AE    mov         eax,dword ptr [esi+0C]
 0049A6B1    call        TObject.Free
 0049A6B6    mov         eax,dword ptr [esi+10]
 0049A6B9    call        TObject.Free
 0049A6BE    mov         eax,dword ptr [esi+14]
 0049A6C1    call        TObject.Free
 0049A6C6    mov         edx,ebx
 0049A6C8    and         dl,0FC
 0049A6CB    mov         eax,esi
 0049A6CD    call        TObject.Destroy
 0049A6D2    test        bl,bl
>0049A6D4    jle         0049A6DD
 0049A6D6    mov         eax,esi
 0049A6D8    call        @ClassDestroy
 0049A6DD    pop         esi
 0049A6DE    pop         ebx
 0049A6DF    ret
*}
end;

//0049A6E0
{*procedure sub_0049A6E0(?:?);
begin
 0049A6E0    push        ebx
 0049A6E1    push        esi
 0049A6E2    push        edi
 0049A6E3    mov         edi,eax
 0049A6E5    mov         eax,dword ptr [edi+8]
 0049A6E8    mov         ebx,dword ptr [eax+8]
 0049A6EB    dec         ebx
 0049A6EC    test        ebx,ebx
>0049A6EE    jl          0049A706
 0049A6F0    inc         ebx
 0049A6F1    xor         esi,esi
 0049A6F3    mov         eax,dword ptr [edi+8]
 0049A6F6    mov         edx,esi
 0049A6F8    call        TList.Get
 0049A6FD    call        004998FC
 0049A702    inc         esi
 0049A703    dec         ebx
>0049A704    jne         0049A6F3
 0049A706    mov         eax,dword ptr [edi+8]
 0049A709    mov         edx,dword ptr [eax]
 0049A70B    call        dword ptr [edx+8]
 0049A70E    mov         eax,dword ptr [edi+0C]
 0049A711    mov         ebx,dword ptr [eax+8]
 0049A714    dec         ebx
 0049A715    test        ebx,ebx
>0049A717    jl          0049A72F
 0049A719    inc         ebx
 0049A71A    xor         esi,esi
 0049A71C    mov         eax,dword ptr [edi+0C]
 0049A71F    mov         edx,esi
 0049A721    call        TList.Get
 0049A726    call        00499FB4
 0049A72B    inc         esi
 0049A72C    dec         ebx
>0049A72D    jne         0049A71C
 0049A72F    mov         eax,dword ptr [edi+0C]
 0049A732    mov         edx,dword ptr [eax]
 0049A734    call        dword ptr [edx+8]
 0049A737    mov         eax,dword ptr [edi+10]
 0049A73A    mov         ebx,dword ptr [eax+8]
 0049A73D    dec         ebx
 0049A73E    test        ebx,ebx
>0049A740    jl          0049A758
 0049A742    inc         ebx
 0049A743    xor         esi,esi
 0049A745    mov         eax,dword ptr [edi+10]
 0049A748    mov         edx,esi
 0049A74A    call        TList.Get
 0049A74F    call        00499FB4
 0049A754    inc         esi
 0049A755    dec         ebx
>0049A756    jne         0049A745
 0049A758    mov         eax,dword ptr [edi+10]
 0049A75B    mov         edx,dword ptr [eax]
 0049A75D    call        dword ptr [edx+8]
 0049A760    mov         eax,dword ptr [edi+14]
 0049A763    mov         ebx,dword ptr [eax+8]
 0049A766    dec         ebx
 0049A767    test        ebx,ebx
>0049A769    jl          0049A781
 0049A76B    inc         ebx
 0049A76C    xor         esi,esi
 0049A76E    mov         eax,dword ptr [edi+14]
 0049A771    mov         edx,esi
 0049A773    call        TList.Get
 0049A778    call        00499FEC
 0049A77D    inc         esi
 0049A77E    dec         ebx
>0049A77F    jne         0049A76E
 0049A781    mov         eax,dword ptr [edi+14]
 0049A784    mov         edx,dword ptr [eax]
 0049A786    call        dword ptr [edx+8]
 0049A789    pop         edi
 0049A78A    pop         esi
 0049A78B    pop         ebx
 0049A78C    ret
end;*}

//0049A790
{*function sub_0049A790(?:TObjectList):?;
begin
 0049A790    push        ebx
 0049A791    push        esi
 0049A792    push        edi
 0049A793    mov         ebx,eax
 0049A795    mov         esi,dword ptr [ebx+8]
 0049A798    cmp         dword ptr [esi+8],0
>0049A79C    jne         0049A7B4
 0049A79E    mov         edi,dword ptr [ebx+4]
 0049A7A1    lea         edx,[edi+8]
 0049A7A4    mov         eax,edi
 0049A7A6    call        004991F0
 0049A7AB    mov         edx,eax
 0049A7AD    mov         eax,esi
 0049A7AF    call        TList.SetCount
 0049A7B4    mov         eax,dword ptr [ebx+8]
 0049A7B7    mov         eax,dword ptr [eax+8]
 0049A7BA    pop         edi
 0049A7BB    pop         esi
 0049A7BC    pop         ebx
 0049A7BD    ret
end;*}

//0049A7C0
{*function sub_0049A7C0(?:TObjectList; ?:?):?;
begin
 0049A7C0    push        ebp
 0049A7C1    mov         ebp,esp
 0049A7C3    mov         ecx,1E
 0049A7C8    push        0
 0049A7CA    push        0
 0049A7CC    dec         ecx
>0049A7CD    jne         0049A7C8
 0049A7CF    push        ebx
 0049A7D0    push        esi
 0049A7D1    push        edi
 0049A7D2    mov         esi,edx
 0049A7D4    mov         ebx,eax
 0049A7D6    xor         eax,eax
 0049A7D8    push        ebp
 0049A7D9    push        49A880
 0049A7DE    push        dword ptr fs:[eax]
 0049A7E1    mov         dword ptr fs:[eax],esp
 0049A7E4    xor         edi,edi
 0049A7E6    mov         eax,ebx
 0049A7E8    call        0049A790
 0049A7ED    test        eax,eax
>0049A7EF    je          0049A861
 0049A7F1    mov         edx,esi
 0049A7F3    mov         eax,dword ptr [ebx+8]
 0049A7F6    call        TList.Get
 0049A7FB    test        eax,eax
>0049A7FD    jne         0049A855
 0049A7FF    mov         edx,dword ptr ds:[497100];TMesh3DS
 0049A805    mov         eax,0F0
 0049A80A    call        @New
 0049A80F    mov         edi,eax
 0049A811    mov         eax,edi
 0049A813    xor         ecx,ecx
 0049A815    mov         edx,0F0
 0049A81A    call        @FillChar
 0049A81F    lea         eax,[ebp-0F0]
 0049A825    push        eax
 0049A826    mov         eax,dword ptr [ebx+4]
 0049A829    lea         edx,[eax+8]
 0049A82C    mov         ecx,esi
 0049A82E    mov         eax,dword ptr [ebx+4]
 0049A831    call        00499EB8
 0049A836    lea         edx,[ebp-0F0]
 0049A83C    mov         eax,edi
 0049A83E    mov         ecx,dword ptr ds:[497100];TMesh3DS
 0049A844    call        @CopyRecord
 0049A849    mov         ecx,edi
 0049A84B    mov         edx,esi
 0049A84D    mov         eax,dword ptr [ebx+8]
 0049A850    call        TList.Put
 0049A855    mov         edx,esi
 0049A857    mov         eax,dword ptr [ebx+8]
 0049A85A    call        TList.Get
 0049A85F    mov         edi,eax
 0049A861    xor         eax,eax
 0049A863    pop         edx
 0049A864    pop         ecx
 0049A865    pop         ecx
 0049A866    mov         dword ptr fs:[eax],edx
 0049A869    push        49A887
 0049A86E    lea         eax,[ebp-0F0]
 0049A874    mov         edx,dword ptr ds:[497100];TMesh3DS
 0049A87A    call        @FinalizeRecord
 0049A87F    ret
>0049A880    jmp         @HandleFinally
>0049A885    jmp         0049A86E
 0049A887    mov         eax,edi
 0049A889    pop         edi
 0049A88A    pop         esi
 0049A88B    pop         ebx
 0049A88C    mov         esp,ebp
 0049A88E    pop         ebp
 0049A88F    ret
end;*}

//0049A890
constructor TKeyFramer.Create;
begin
{*
 0049A890    push        ebx
 0049A891    push        esi
 0049A892    test        dl,dl
>0049A894    je          0049A89E
 0049A896    add         esp,0FFFFFFF0
 0049A899    call        @ClassCreate
 0049A89E    mov         ebx,edx
 0049A8A0    mov         esi,eax
 0049A8A2    mov         dword ptr [esi+4],ecx;TKeyFramer.?f4:dword
 0049A8A5    mov         dl,1
 0049A8A7    mov         eax,[00417CEC];TList
 0049A8AC    call        TObject.Create;TList.Create
 0049A8B1    mov         dword ptr [esi+8],eax;TKeyFramer.?f8:TList
 0049A8B4    mov         dl,1
 0049A8B6    mov         eax,[00417CEC];TList
 0049A8BB    call        TObject.Create;TList.Create
 0049A8C0    mov         dword ptr [esi+0C],eax;TKeyFramer.?fC:TList
 0049A8C3    mov         dl,1
 0049A8C5    mov         eax,[00417CEC];TList
 0049A8CA    call        TObject.Create;TList.Create
 0049A8CF    mov         dword ptr [esi+10],eax;TKeyFramer.?f10:TList
 0049A8D2    mov         dl,1
 0049A8D4    mov         eax,[00417CEC];TList
 0049A8D9    call        TObject.Create;TList.Create
 0049A8DE    mov         dword ptr [esi+14],eax;TKeyFramer.?f14:TList
 0049A8E1    mov         eax,esi
 0049A8E3    test        bl,bl
>0049A8E5    je          0049A8F6
 0049A8E7    call        @AfterConstruction
 0049A8EC    pop         dword ptr fs:[0]
 0049A8F3    add         esp,0C
 0049A8F6    mov         eax,esi
 0049A8F8    pop         esi
 0049A8F9    pop         ebx
 0049A8FA    ret
*}
end;

//0049A8FC
destructor TKeyFramer.Destroy;
begin
{*
 0049A8FC    push        ebx
 0049A8FD    push        esi
 0049A8FE    call        @BeforeDestruction
 0049A903    mov         ebx,edx
 0049A905    mov         esi,eax
 0049A907    mov         eax,esi
 0049A909    call        0049A948
 0049A90E    mov         eax,dword ptr [esi+8]
 0049A911    call        TObject.Free
 0049A916    mov         eax,dword ptr [esi+0C]
 0049A919    call        TObject.Free
 0049A91E    mov         eax,dword ptr [esi+10]
 0049A921    call        TObject.Free
 0049A926    mov         eax,dword ptr [esi+14]
 0049A929    call        TObject.Free
 0049A92E    mov         edx,ebx
 0049A930    and         dl,0FC
 0049A933    mov         eax,esi
 0049A935    call        TObject.Destroy
 0049A93A    test        bl,bl
>0049A93C    jle         0049A945
 0049A93E    mov         eax,esi
 0049A940    call        @ClassDestroy
 0049A945    pop         esi
 0049A946    pop         ebx
 0049A947    ret
*}
end;

//0049A948
{*procedure sub_0049A948(?:?);
begin
 0049A948    push        ebx
 0049A949    push        esi
 0049A94A    push        edi
 0049A94B    mov         edi,eax
 0049A94D    mov         eax,dword ptr [edi+8]
 0049A950    mov         ebx,dword ptr [eax+8]
 0049A953    dec         ebx
 0049A954    test        ebx,ebx
>0049A956    jl          0049A96E
 0049A958    inc         ebx
 0049A959    xor         esi,esi
 0049A95B    mov         eax,dword ptr [edi+8]
 0049A95E    mov         edx,esi
 0049A960    call        TList.Get
 0049A965    call        0049A0AC
 0049A96A    inc         esi
 0049A96B    dec         ebx
>0049A96C    jne         0049A95B
 0049A96E    mov         eax,dword ptr [edi+8]
 0049A971    mov         edx,dword ptr [eax]
 0049A973    call        dword ptr [edx+8]
 0049A976    mov         eax,dword ptr [edi+0C]
 0049A979    mov         ebx,dword ptr [eax+8]
 0049A97C    dec         ebx
 0049A97D    test        ebx,ebx
>0049A97F    jl          0049A997
 0049A981    inc         ebx
 0049A982    xor         esi,esi
 0049A984    mov         eax,dword ptr [edi+0C]
 0049A987    mov         edx,esi
 0049A989    call        TList.Get
 0049A98E    call        0049A134
 0049A993    inc         esi
 0049A994    dec         ebx
>0049A995    jne         0049A984
 0049A997    mov         eax,dword ptr [edi+0C]
 0049A99A    mov         edx,dword ptr [eax]
 0049A99C    call        dword ptr [edx+8]
 0049A99F    mov         eax,dword ptr [edi+10]
 0049A9A2    mov         ebx,dword ptr [eax+8]
 0049A9A5    dec         ebx
 0049A9A6    test        ebx,ebx
>0049A9A8    jl          0049A9C0
 0049A9AA    inc         ebx
 0049A9AB    xor         esi,esi
 0049A9AD    mov         eax,dword ptr [edi+10]
 0049A9B0    mov         edx,esi
 0049A9B2    call        TList.Get
 0049A9B7    call        0049A180
 0049A9BC    inc         esi
 0049A9BD    dec         ebx
>0049A9BE    jne         0049A9AD
 0049A9C0    mov         eax,dword ptr [edi+10]
 0049A9C3    mov         edx,dword ptr [eax]
 0049A9C5    call        dword ptr [edx+8]
 0049A9C8    mov         eax,dword ptr [edi+14]
 0049A9CB    mov         ebx,dword ptr [eax+8]
 0049A9CE    dec         ebx
 0049A9CF    test        ebx,ebx
>0049A9D1    jl          0049A9E9
 0049A9D3    inc         ebx
 0049A9D4    xor         esi,esi
 0049A9D6    mov         eax,dword ptr [edi+14]
 0049A9D9    mov         edx,esi
 0049A9DB    call        TList.Get
 0049A9E0    call        00499FFC
 0049A9E5    inc         esi
 0049A9E6    dec         ebx
>0049A9E7    jne         0049A9D6
 0049A9E9    mov         eax,dword ptr [edi+14]
 0049A9EC    mov         edx,dword ptr [eax]
 0049A9EE    call        dword ptr [edx+8]
 0049A9F1    mov         eax,dword ptr [edi+18]
 0049A9F4    test        eax,eax
>0049A9F6    je          0049A9FD
 0049A9F8    call        0049A078
 0049A9FD    xor         eax,eax
 0049A9FF    mov         dword ptr [edi+18],eax
 0049AA02    pop         edi
 0049AA03    pop         esi
 0049AA04    pop         ebx
 0049AA05    ret
end;*}

//0049AA08
constructor TFile3DS.Create;
begin
{*
 0049AA08    push        ebx
 0049AA09    push        esi
 0049AA0A    test        dl,dl
>0049AA0C    je          0049AA16
 0049AA0E    add         esp,0FFFFFFF0
 0049AA11    call        @ClassCreate
 0049AA16    mov         ebx,edx
 0049AA18    mov         esi,eax
 0049AA1A    mov         ecx,esi
 0049AA1C    mov         dl,1
 0049AA1E    mov         eax,[0049A268];TMaterialList
 0049AA23    call        TMaterialList.Create;TMaterialList.Create
 0049AA28    mov         dword ptr [esi+24],eax;TFile3DS.?f24:TMaterialList
 0049AA2B    mov         ecx,esi
 0049AA2D    mov         dl,1
 0049AA2F    mov         eax,[0049A2C8];TObjectList
 0049AA34    call        TObjectList.Create;TObjectList.Create
 0049AA39    mov         dword ptr [esi+28],eax;TFile3DS.?f28:TObjectList
 0049AA3C    mov         ecx,esi
 0049AA3E    mov         dl,1
 0049AA40    mov         eax,[0049A324];TKeyFramer
 0049AA45    call        TKeyFramer.Create;TKeyFramer.Create
 0049AA4A    mov         dword ptr [esi+2C],eax;TFile3DS.?f2C:TKeyFramer
 0049AA4D    mov         eax,esi
 0049AA4F    test        bl,bl
>0049AA51    je          0049AA62
 0049AA53    call        @AfterConstruction
 0049AA58    pop         dword ptr fs:[0]
 0049AA5F    add         esp,0C
 0049AA62    mov         eax,esi
 0049AA64    pop         esi
 0049AA65    pop         ebx
 0049AA66    ret
*}
end;

//0049AA68
constructor sub_0049AA68;
begin
{*
 0049AA68    push        ebx
 0049AA69    push        esi
 0049AA6A    push        edi
 0049AA6B    test        dl,dl
>0049AA6D    je          0049AA77
 0049AA6F    add         esp,0FFFFFFF0
 0049AA72    call        @ClassCreate
 0049AA77    mov         esi,ecx
 0049AA79    mov         ebx,edx
 0049AA7B    mov         edi,eax
 0049AA7D    xor         edx,edx
 0049AA7F    mov         eax,edi
 0049AA81    mov         ecx,dword ptr [eax]
 0049AA83    call        dword ptr [ecx];TFile3DS.sub_0049AA08
 0049AA85    lea         eax,[edi+30];TFile3DS.?f30:String
 0049AA88    mov         edx,esi
 0049AA8A    call        @LStrAsg
 0049AA8F    mov         dx,20
 0049AA93    mov         eax,esi
 0049AA95    call        00465A70
 0049AA9A    mov         dword ptr [edi+1C],eax;TFile3DS.?f1C:dword
 0049AA9D    mov         eax,edi
 0049AA9F    call        0049B144
 0049AAA4    mov         eax,edi
 0049AAA6    call        0049B0CC
 0049AAAB    mov         eax,edi
 0049AAAD    test        bl,bl
>0049AAAF    je          0049AAC0
 0049AAB1    call        @AfterConstruction
 0049AAB6    pop         dword ptr fs:[0]
 0049AABD    add         esp,0C
 0049AAC0    mov         eax,edi
 0049AAC2    pop         edi
 0049AAC3    pop         esi
 0049AAC4    pop         ebx
 0049AAC5    ret
*}
end;

//0049AAC8
destructor TFile3DS.Destroy;
begin
{*
 0049AAC8    push        ebx
 0049AAC9    push        esi
 0049AACA    call        @BeforeDestruction
 0049AACF    mov         ebx,edx
 0049AAD1    mov         esi,eax
 0049AAD3    mov         eax,dword ptr [esi+2C]
 0049AAD6    call        TObject.Free
 0049AADB    mov         eax,dword ptr [esi+28]
 0049AADE    call        TObject.Free
 0049AAE3    mov         eax,dword ptr [esi+24]
 0049AAE6    call        TObject.Free
 0049AAEB    mov         eax,esi
 0049AAED    call        0049B274
 0049AAF2    mov         eax,esi
 0049AAF4    call        0049B0AC
 0049AAF9    mov         edx,ebx
 0049AAFB    and         dl,0FC
 0049AAFE    mov         eax,esi
 0049AB00    call        TObject.Destroy
 0049AB05    test        bl,bl
>0049AB07    jle         0049AB10
 0049AB09    mov         eax,esi
 0049AB0B    call        @ClassDestroy
 0049AB10    pop         esi
 0049AB11    pop         ebx
 0049AB12    ret
*}
end;

//0049AB14
{*procedure sub_0049AB14(?:?; ?:?);
begin
 0049AB14    push        ebp
 0049AB15    mov         ebp,esp
 0049AB17    add         esp,0FFFFFFF0
 0049AB1A    push        ebx
 0049AB1B    push        esi
 0049AB1C    xor         ecx,ecx
 0049AB1E    mov         dword ptr [ebp-10],ecx
 0049AB21    mov         ebx,edx
 0049AB23    mov         esi,eax
 0049AB25    xor         eax,eax
 0049AB27    push        ebp
 0049AB28    push        49AC35
 0049AB2D    push        dword ptr fs:[eax]
 0049AB30    mov         dword ptr fs:[eax],esp
 0049AB33    lea         edx,[ebp-4]
 0049AB36    mov         eax,esi
 0049AB38    call        0049AF64
 0049AB3D    cmp         dword ptr [ebp-4],0
>0049AB41    je          0049AC1F
 0049AB47    mov         dx,0B010
 0049AB4B    mov         eax,ebx
 0049AB4D    call        00497474
 0049AB52    mov         dword ptr [ebp-8],eax
 0049AB55    cmp         dword ptr [ebp-8],0
>0049AB59    je          0049AC1F
 0049AB5F    mov         edx,dword ptr [ebp-8]
 0049AB62    mov         eax,esi
 0049AB64    call        0049C1DC
 0049AB69    cmp         dword ptr [ebp-8],0
>0049AB6D    je          0049AC1F
 0049AB73    mov         eax,dword ptr [ebp-4]
 0049AB76    add         eax,4
 0049AB79    mov         edx,dword ptr [ebp-8]
 0049AB7C    mov         edx,dword ptr [edx+0C]
 0049AB7F    mov         edx,dword ptr [edx]
 0049AB81    call        @LStrAsg
 0049AB86    mov         edx,ebx
 0049AB88    mov         eax,esi
 0049AB8A    call        0049AE6C
 0049AB8F    mov         edx,dword ptr [ebp-4]
 0049AB92    mov         word ptr [edx],ax
 0049AB95    mov         eax,dword ptr [ebp-4]
 0049AB98    mov         dx,word ptr [ebx]
 0049AB9B    mov         word ptr [eax+2],dx
 0049AB9F    mov         eax,dword ptr [ebp-8]
 0049ABA2    mov         eax,dword ptr [eax+0C]
 0049ABA5    mov         ax,word ptr [eax+8]
 0049ABA9    mov         edx,dword ptr [ebp-4]
 0049ABAC    mov         word ptr [edx+0C],ax
 0049ABB0    mov         eax,dword ptr [ebp-4]
 0049ABB3    xor         edx,edx
 0049ABB5    mov         dword ptr [eax+10],edx
 0049ABB8    mov         eax,dword ptr [ebp-4]
 0049ABBB    add         eax,8
 0049ABBE    call        @LStrClr
 0049ABC3    cmp         word ptr [ebx],0B002
>0049ABC8    jne         0049AC0C
 0049ABCA    mov         dx,0B011
 0049ABCE    mov         eax,ebx
 0049ABD0    call        00497474
 0049ABD5    mov         dword ptr [ebp-0C],eax
 0049ABD8    cmp         dword ptr [ebp-0C],0
>0049ABDC    je          0049AC0C
 0049ABDE    mov         edx,dword ptr [ebp-0C]
 0049ABE1    mov         eax,esi
 0049ABE3    call        0049C1DC
 0049ABE8    lea         edx,[ebp-10]
 0049ABEB    mov         eax,dword ptr [ebp-0C]
 0049ABEE    mov         eax,dword ptr [eax+0C]
 0049ABF1    call        StrPas
 0049ABF6    mov         edx,dword ptr [ebp-10]
 0049ABF9    mov         eax,dword ptr [ebp-4]
 0049ABFC    add         eax,8
 0049ABFF    call        @LStrAsg
 0049AC04    lea         eax,[ebp-0C]
 0049AC07    call        004974CC
 0049AC0C    mov         eax,dword ptr [ebp-8]
 0049AC0F    mov         eax,dword ptr [eax+0C]
 0049AC12    call        @LStrClr
 0049AC17    lea         eax,[ebp-8]
 0049AC1A    call        004974CC
 0049AC1F    xor         eax,eax
 0049AC21    pop         edx
 0049AC22    pop         ecx
 0049AC23    pop         ecx
 0049AC24    mov         dword ptr fs:[eax],edx
 0049AC27    push        49AC3C
 0049AC2C    lea         eax,[ebp-10]
 0049AC2F    call        @LStrClr
 0049AC34    ret
>0049AC35    jmp         @HandleFinally
>0049AC3A    jmp         0049AC2C
 0049AC3C    pop         esi
 0049AC3D    pop         ebx
 0049AC3E    mov         esp,ebp
 0049AC40    pop         ebp
 0049AC41    ret
end;*}

//0049AC44
procedure sub_0049AC44(?:TFile3DS);
begin
{*
 0049AC44    push        ebp
 0049AC45    mov         ebp,esp
 0049AC47    add         esp,0FFFFFFE0
 0049AC4A    push        ebx
 0049AC4B    push        esi
 0049AC4C    push        edi
 0049AC4D    xor         edx,edx
 0049AC4F    mov         dword ptr [ebp-1C],edx
 0049AC52    mov         dword ptr [ebp-20],edx
 0049AC55    mov         dword ptr [ebp-4],eax
 0049AC58    xor         eax,eax
 0049AC5A    push        ebp
 0049AC5B    push        49AE12
 0049AC60    push        dword ptr fs:[eax]
 0049AC63    mov         dword ptr fs:[eax],esp
 0049AC66    mov         eax,dword ptr [ebp-4]
 0049AC69    mov         eax,dword ptr [eax+8]
 0049AC6C    mov         dx,0B000
 0049AC70    call        00497474
 0049AC75    mov         dword ptr [ebp-8],eax
 0049AC78    cmp         dword ptr [ebp-8],0
>0049AC7C    je          0049ADF7
 0049AC82    mov         dword ptr [ebp-14],6
 0049AC89    mov         ebx,dword ptr ds:[5AE5A4];^gvar_005AD790
 0049AC8F    mov         dx,word ptr [ebx]
 0049AC92    mov         eax,dword ptr [ebp-8]
 0049AC95    call        00497474
 0049AC9A    mov         esi,eax
 0049AC9C    test        esi,esi
>0049AC9E    je          0049ADEB
 0049ACA4    mov         dx,0B010
 0049ACA8    mov         eax,esi
 0049ACAA    call        00497474
 0049ACAF    mov         edi,eax
 0049ACB1    test        edi,edi
>0049ACB3    je          0049ADD6
 0049ACB9    mov         dx,0B030
 0049ACBD    mov         eax,esi
 0049ACBF    call        00497474
 0049ACC4    mov         dword ptr [ebp-10],eax
 0049ACC7    cmp         dword ptr [ebp-10],0
>0049ACCB    je          0049ADD6
 0049ACD1    mov         edx,dword ptr [ebp-10]
 0049ACD4    mov         eax,dword ptr [ebp-4]
 0049ACD7    call        0049C1DC
 0049ACDC    mov         eax,dword ptr [ebp-10]
 0049ACDF    mov         eax,dword ptr [eax+0C]
 0049ACE2    test        eax,eax
>0049ACE4    je          0049ADD6
 0049ACEA    mov         dx,word ptr [eax]
 0049ACED    mov         eax,dword ptr [ebp-4]
 0049ACF0    call        0049AE58
 0049ACF5    test        eax,eax
>0049ACF7    je          0049ADD6
 0049ACFD    cmp         word ptr [eax+0C],0FFFFFFFF
>0049AD02    je          0049ADD6
 0049AD08    mov         dx,word ptr [eax+0C]
 0049AD0C    mov         eax,dword ptr [ebp-4]
 0049AD0F    call        0049AE58
 0049AD14    mov         dword ptr [ebp-18],eax
 0049AD17    cmp         dword ptr [ebp-18],0
>0049AD1B    je          0049AD39
 0049AD1D    lea         eax,[ebp-1C]
 0049AD20    mov         edx,dword ptr [ebp-18]
 0049AD23    mov         edx,dword ptr [edx+4]
 0049AD26    call        @LStrLAsg
 0049AD2B    lea         eax,[ebp-20]
 0049AD2E    mov         edx,dword ptr [ebp-18]
 0049AD31    mov         edx,dword ptr [edx+8]
 0049AD34    call        @LStrLAsg
 0049AD39    mov         eax,dword ptr [ebp-1C]
 0049AD3C    call        @LStrLen
 0049AD41    test        eax,eax
>0049AD43    jle         0049ADD6
 0049AD49    mov         eax,dword ptr [ebp-20]
 0049AD4C    call        @LStrLen
 0049AD51    test        eax,eax
>0049AD53    jle         0049AD6D
 0049AD55    push        dword ptr [ebp-1C]
 0049AD58    push        49AE28;'.'
 0049AD5D    push        dword ptr [ebp-20]
 0049AD60    lea         eax,[ebp-1C]
 0049AD63    mov         edx,3
 0049AD68    call        @LStrCatN
 0049AD6D    mov         dx,80F0
 0049AD71    mov         eax,edi
 0049AD73    call        00497474
 0049AD78    mov         dword ptr [ebp-0C],eax
 0049AD7B    cmp         dword ptr [ebp-0C],0
>0049AD7F    je          0049ADC9
 0049AD81    mov         edx,dword ptr [ebp-0C]
 0049AD84    mov         eax,dword ptr [ebp-4]
 0049AD87    call        0049C1DC
 0049AD8C    mov         eax,dword ptr [ebp-0C]
 0049AD8F    cmp         dword ptr [eax+0C],0
>0049AD93    je          0049ADD6
 0049AD95    mov         eax,dword ptr [ebp-1C]
 0049AD98    call        @LStrLen
 0049AD9D    inc         eax
 0049AD9E    call        AllocMem
 0049ADA3    mov         edx,dword ptr [ebp-0C]
 0049ADA6    mov         dword ptr [edx+0C],eax
 0049ADA9    mov         eax,dword ptr [ebp-1C]
 0049ADAC    call        @LStrLen
 0049ADB1    inc         eax
 0049ADB2    push        eax
 0049ADB3    lea         eax,[ebp-1C]
 0049ADB6    call        @UniqueStringA
 0049ADBB    mov         edx,dword ptr [ebp-0C]
 0049ADBE    mov         edx,dword ptr [edx+0C]
 0049ADC1    pop         ecx
 0049ADC2    call        Move
>0049ADC7    jmp         0049ADD6
 0049ADC9    mov         ecx,dword ptr [ebp-1C]
 0049ADCC    mov         edx,edi
 0049ADCE    mov         eax,dword ptr [ebp-4]
 0049ADD1    call        0049AED4
 0049ADD6    mov         dx,word ptr [ebx]
 0049ADD9    mov         eax,dword ptr [esi+10]
 0049ADDC    call        004974B0
 0049ADE1    mov         esi,eax
 0049ADE3    test        esi,esi
>0049ADE5    jne         0049ACA4
 0049ADEB    add         ebx,2
 0049ADEE    dec         dword ptr [ebp-14]
>0049ADF1    jne         0049AC8F
 0049ADF7    xor         eax,eax
 0049ADF9    pop         edx
 0049ADFA    pop         ecx
 0049ADFB    pop         ecx
 0049ADFC    mov         dword ptr fs:[eax],edx
 0049ADFF    push        49AE19
 0049AE04    lea         eax,[ebp-20]
 0049AE07    mov         edx,2
 0049AE0C    call        @LStrArrayClr
 0049AE11    ret
>0049AE12    jmp         @HandleFinally
>0049AE17    jmp         0049AE04
 0049AE19    pop         edi
 0049AE1A    pop         esi
 0049AE1B    pop         ebx
 0049AE1C    mov         esp,ebp
 0049AE1E    pop         ebp
 0049AE1F    ret
*}
end;

//0049AE2C
{*procedure sub_0049AE2C(?:?);
begin
 0049AE2C    mov         edx,dword ptr [eax+4]
 0049AE2F    test        edx,edx
>0049AE31    je          0049AE55
 0049AE33    cmp         word ptr [edx],0FFFFFFFF
>0049AE37    jne         0049AE4E
 0049AE39    xor         ecx,ecx
 0049AE3B    mov         edx,dword ptr [eax+4]
 0049AE3E    test        edx,edx
>0049AE40    je          0049AE55
 0049AE42    mov         word ptr [edx],cx
 0049AE45    inc         ecx
 0049AE46    mov         edx,dword ptr [edx+10]
 0049AE49    test        edx,edx
>0049AE4B    jne         0049AE42
 0049AE4D    ret
 0049AE4E    mov         edx,dword ptr [edx+10]
 0049AE51    test        edx,edx
>0049AE53    jne         0049AE33
 0049AE55    ret
end;*}

//0049AE58
{*function sub_0049AE58(?:?; ?:?):?;
begin
 0049AE58    mov         eax,dword ptr [eax+4]
 0049AE5B    test        eax,eax
>0049AE5D    je          0049AE6B
 0049AE5F    cmp         dx,word ptr [eax]
>0049AE62    je          0049AE6B
 0049AE64    mov         eax,dword ptr [eax+10]
 0049AE67    test        eax,eax
>0049AE69    jne         0049AE5F
 0049AE6B    ret
end;*}

//0049AE6C
{*function sub_0049AE6C(?:?; ?:?):?;
begin
 0049AE6C    push        ebx
 0049AE6D    push        esi
 0049AE6E    push        edi
 0049AE6F    push        ecx
 0049AE70    mov         edi,edx
 0049AE72    mov         ebx,eax
 0049AE74    or          esi,0FFFFFFFF
 0049AE77    mov         dx,0B030
 0049AE7B    mov         eax,edi
 0049AE7D    call        00497474
 0049AE82    mov         dword ptr [esp],eax
 0049AE85    cmp         dword ptr [esp],0
>0049AE89    je          0049AEA9
 0049AE8B    mov         edx,dword ptr [esp]
 0049AE8E    mov         eax,ebx
 0049AE90    call        0049C1DC
 0049AE95    mov         eax,dword ptr [esp]
 0049AE98    mov         eax,dword ptr [eax+0C]
 0049AE9B    test        eax,eax
>0049AE9D    je          0049AEA2
 0049AE9F    mov         si,word ptr [eax]
 0049AEA2    mov         eax,esp
 0049AEA4    call        004974CC
 0049AEA9    mov         eax,esi
 0049AEAB    pop         edx
 0049AEAC    pop         edi
 0049AEAD    pop         esi
 0049AEAE    pop         ebx
 0049AEAF    ret
end;*}

//0049AEB0
{*function sub_0049AEB0(?:?; ?:?):?;
begin
 0049AEB0    push        esi
 0049AEB1    mov         esi,edx
 0049AEB3    xor         edx,edx
 0049AEB5    mov         ecx,6
 0049AEBA    mov         eax,[005AE5A4];^gvar_005AD790
 0049AEBF    cmp         si,word ptr [eax]
>0049AEC2    jne         0049AEC8
 0049AEC4    mov         dl,1
>0049AEC6    jmp         0049AECE
 0049AEC8    add         eax,2
 0049AECB    dec         ecx
>0049AECC    jne         0049AEBF
 0049AECE    mov         eax,edx
 0049AED0    pop         esi
 0049AED1    ret
end;*}

//0049AED4
{*procedure sub_0049AED4(?:?; ?:?; ?:AnsiString);
begin
 0049AED4    push        ebp
 0049AED5    mov         ebp,esp
 0049AED7    add         esp,0FFFFFFF8
 0049AEDA    push        ebx
 0049AEDB    mov         dword ptr [ebp-4],ecx
 0049AEDE    mov         ebx,edx
 0049AEE0    mov         eax,dword ptr [ebp-4]
 0049AEE3    call        @LStrAddRef
 0049AEE8    xor         eax,eax
 0049AEEA    push        ebp
 0049AEEB    push        49AF58
 0049AEF0    push        dword ptr fs:[eax]
 0049AEF3    mov         dword ptr fs:[eax],esp
 0049AEF6    lea         eax,[ebp-8]
 0049AEF9    call        00497780
 0049AEFE    mov         eax,dword ptr [ebp-8]
 0049AF01    mov         word ptr [eax],80F0
 0049AF06    mov         eax,dword ptr [ebp-4]
 0049AF09    call        @LStrLen
 0049AF0E    inc         eax
 0049AF0F    call        AllocMem
 0049AF14    mov         edx,dword ptr [ebp-8]
 0049AF17    mov         dword ptr [edx+0C],eax
 0049AF1A    mov         eax,dword ptr [ebp-4]
 0049AF1D    call        @LStrLen
 0049AF22    inc         eax
 0049AF23    push        eax
 0049AF24    lea         eax,[ebp-4]
 0049AF27    call        @UniqueStringA
 0049AF2C    mov         edx,dword ptr [ebp-8]
 0049AF2F    mov         edx,dword ptr [edx+0C]
 0049AF32    pop         ecx
 0049AF33    call        Move
 0049AF38    mov         edx,dword ptr [ebp-8]
 0049AF3B    mov         eax,ebx
 0049AF3D    call        00497400
 0049AF42    xor         eax,eax
 0049AF44    pop         edx
 0049AF45    pop         ecx
 0049AF46    pop         ecx
 0049AF47    mov         dword ptr fs:[eax],edx
 0049AF4A    push        49AF5F
 0049AF4F    lea         eax,[ebp-4]
 0049AF52    call        @LStrClr
 0049AF57    ret
>0049AF58    jmp         @HandleFinally
>0049AF5D    jmp         0049AF4F
 0049AF5F    pop         ebx
 0049AF60    pop         ecx
 0049AF61    pop         ecx
 0049AF62    pop         ebp
 0049AF63    ret
end;*}

//0049AF64
{*procedure sub_0049AF64(?:?; ?:?);
begin
 0049AF64    push        ebx
 0049AF65    push        esi
 0049AF66    push        edi
 0049AF67    mov         esi,edx
 0049AF69    mov         edi,eax
 0049AF6B    mov         ebx,dword ptr [edi+4]
 0049AF6E    mov         eax,14
 0049AF73    call        AllocMem
 0049AF78    mov         dword ptr [esi],eax
 0049AF7A    cmp         dword ptr [esi],0
>0049AF7D    je          0049AF98
 0049AF7F    test        ebx,ebx
>0049AF81    jne         0049AF8C
 0049AF83    mov         eax,dword ptr [esi]
 0049AF85    mov         dword ptr [edi+4],eax
>0049AF88    jmp         0049AF98
 0049AF8A    mov         ebx,eax
 0049AF8C    mov         eax,dword ptr [ebx+10]
 0049AF8F    test        eax,eax
>0049AF91    jne         0049AF8A
 0049AF93    mov         eax,dword ptr [esi]
 0049AF95    mov         dword ptr [ebx+10],eax
 0049AF98    pop         edi
 0049AF99    pop         esi
 0049AF9A    pop         ebx
 0049AF9B    ret
end;*}

//0049AF9C
procedure sub_0049AF9C(?:TFile3DS);
begin
{*
 0049AF9C    push        ebx
 0049AF9D    push        esi
 0049AF9E    mov         esi,eax
 0049AFA0    mov         dx,0B000
 0049AFA4    mov         eax,dword ptr [esi+8]
 0049AFA7    call        00497474
 0049AFAC    test        eax,eax
>0049AFAE    je          0049AFDC
 0049AFB0    mov         ebx,dword ptr [eax+14]
 0049AFB3    test        ebx,ebx
>0049AFB5    je          0049AFD5
 0049AFB7    mov         dx,word ptr [ebx]
 0049AFBA    mov         eax,esi
 0049AFBC    call        0049AEB0
 0049AFC1    test        al,al
>0049AFC3    je          0049AFCE
 0049AFC5    mov         edx,ebx
 0049AFC7    mov         eax,esi
 0049AFC9    call        0049AB14
 0049AFCE    mov         ebx,dword ptr [ebx+10]
 0049AFD1    test        ebx,ebx
>0049AFD3    jne         0049AFB7
 0049AFD5    mov         eax,esi
 0049AFD7    call        0049AE2C
 0049AFDC    pop         esi
 0049AFDD    pop         ebx
 0049AFDE    ret
*}
end;

//0049AFE0
{*procedure sub_0049AFE0(?:TFile3DS; ?:?);
begin
 0049AFE0    push        ebx
 0049AFE1    push        esi
 0049AFE2    push        edi
 0049AFE3    push        ebp
 0049AFE4    push        ecx
 0049AFE5    mov         ebp,edx
 0049AFE7    mov         ebx,eax
 0049AFE9    mov         edi,esp
 0049AFEB    mov         edx,ebp
 0049AFED    mov         eax,ebx
 0049AFEF    call        0049E0F8
 0049AFF4    mov         esi,dword ptr [ebp+8]
 0049AFF7    add         esi,dword ptr [ebp+4]
>0049AFFA    jmp         0049B072
 0049AFFC    xor         eax,eax
 0049AFFE    mov         dword ptr [edi],eax
 0049B000    mov         eax,edi
 0049B002    call        00497780
 0049B007    mov         eax,dword ptr [ebx+1C]
 0049B00A    call        TStream.GetPosition
 0049B00F    mov         edx,dword ptr [edi]
 0049B011    mov         dword ptr [edx+8],eax
 0049B014    mov         eax,dword ptr [edi]
 0049B016    lea         ecx,[eax+4]
 0049B019    mov         edx,dword ptr [edi]
 0049B01B    mov         eax,ebx
 0049B01D    call        0049C0BC
 0049B022    mov         eax,dword ptr [edi]
 0049B024    mov         ax,word ptr [eax]
 0049B027    add         eax,0FFFF7FFE
 0049B02C    sub         ax,0E
>0049B030    jae         0049B05D
 0049B032    mov         eax,dword ptr [edi]
 0049B034    mov         eax,dword ptr [eax+8]
 0049B037    mov         edx,dword ptr [edi]
 0049B039    add         eax,dword ptr [edx+4]
 0049B03C    cmp         esi,eax
>0049B03E    jb          0049B054
 0049B040    mov         edx,dword ptr [edi]
 0049B042    mov         eax,ebp
 0049B044    call        004973E4
 0049B049    mov         edx,dword ptr [edi]
 0049B04B    mov         eax,ebx
 0049B04D    call        0049AFE0
>0049B052    jmp         0049B072
 0049B054    mov         eax,edi
 0049B056    call        004978A4
>0049B05B    jmp         0049B072
 0049B05D    mov         eax,edi
 0049B05F    call        004978A4
 0049B064    mov         eax,esi
 0049B066    xor         edx,edx
 0049B068    push        edx
 0049B069    push        eax
 0049B06A    mov         eax,dword ptr [ebx+1C]
 0049B06D    call        TStream.SetPosition
 0049B072    mov         eax,dword ptr [ebx+1C]
 0049B075    call        TStream.GetPosition
 0049B07A    cmp         esi,eax
>0049B07C    ja          0049AFFC
 0049B082    pop         edx
 0049B083    pop         ebp
 0049B084    pop         edi
 0049B085    pop         esi
 0049B086    pop         ebx
 0049B087    ret
end;*}

//0049B088
procedure sub_0049B088(?:TFile3DS);
begin
{*
 0049B088    push        ebx
 0049B089    push        esi
 0049B08A    mov         ebx,eax
>0049B08C    jmp         0049B09F
 0049B08E    mov         esi,dword ptr [eax+10]
 0049B091    mov         edx,dword ptr ds:[496FCC];TNodeList
 0049B097    call        @Dispose
 0049B09C    mov         dword ptr [ebx+4],esi
 0049B09F    mov         eax,dword ptr [ebx+4]
 0049B0A2    test        eax,eax
>0049B0A4    jne         0049B08E
 0049B0A6    pop         esi
 0049B0A7    pop         ebx
 0049B0A8    ret
*}
end;

//0049B0AC
{*procedure sub_0049B0AC(?:?);
begin
 0049B0AC    push        ebx
 0049B0AD    mov         ebx,eax
 0049B0AF    cmp         byte ptr [ebx+20],0
>0049B0B3    je          0049B0BF
 0049B0B5    lea         eax,[ebx+1C]
 0049B0B8    call        FreeAndNil
>0049B0BD    jmp         0049B0C4
 0049B0BF    xor         eax,eax
 0049B0C1    mov         dword ptr [ebx+1C],eax
 0049B0C4    mov         byte ptr [ebx+20],0
 0049B0C8    pop         ebx
 0049B0C9    ret
end;*}

//0049B0CC
procedure sub_0049B0CC(?:TFile3DS);
begin
{*
 0049B0CC    push        ebx
 0049B0CD    push        esi
 0049B0CE    mov         esi,eax
 0049B0D0    lea         ebx,[esi+8];TFile3DS.?f8:?
 0049B0D3    mov         eax,ebx
 0049B0D5    call        00497780
 0049B0DA    push        0
 0049B0DC    push        0
 0049B0DE    mov         eax,dword ptr [esi+1C];TFile3DS.?f1C:dword
 0049B0E1    call        TStream.SetPosition
 0049B0E6    mov         eax,dword ptr [ebx]
 0049B0E8    lea         ecx,[eax+4]
 0049B0EB    mov         edx,eax
 0049B0ED    mov         eax,esi
 0049B0EF    call        0049C0BC
 0049B0F4    mov         eax,dword ptr [ebx]
 0049B0F6    mov         ax,word ptr [eax]
 0049B0F9    cmp         ax,4D4D
>0049B0FD    je          0049B10B
 0049B0FF    cmp         ax,0C23D
>0049B103    je          0049B10B
 0049B105    cmp         ax,3DAA
>0049B109    jne         0049B141
 0049B10B    cmp         word ptr [esi+3A],0;TFile3DS.?f3A:word
>0049B110    je          0049B123
 0049B112    mov         eax,dword ptr [esi+1C];TFile3DS.?f1C:dword
 0049B115    mov         edx,dword ptr [eax]
 0049B117    call        dword ptr [edx]
 0049B119    mov         ecx,eax
 0049B11B    xor         edx,edx
 0049B11D    mov         eax,dword ptr [esi+3C];TFile3DS.?f3C:dword
 0049B120    call        dword ptr [esi+38]
 0049B123    mov         edx,dword ptr [ebx]
 0049B125    mov         eax,esi
 0049B127    call        0049B1BC
 0049B12C    mov         eax,esi
 0049B12E    call        0049AF9C
 0049B133    mov         eax,esi
 0049B135    call        0049AC44
 0049B13A    mov         eax,esi
 0049B13C    call        0049B088
 0049B141    pop         esi
 0049B142    pop         ebx
 0049B143    ret
*}
end;

//0049B144
procedure sub_0049B144(?:TFile3DS);
begin
{*
 0049B144    add         eax,8;TFile3DS.?f8:?
 0049B147    xor         edx,edx
 0049B149    mov         dword ptr [eax],edx
 0049B14B    mov         byte ptr [eax+4],1
 0049B14F    mov         byte ptr [eax+5],1
 0049B153    mov         byte ptr [eax+6],1
 0049B157    xor         edx,edx
 0049B159    mov         dword ptr [eax+8],edx
 0049B15C    xor         edx,edx
 0049B15E    mov         dword ptr [eax+0C],edx
 0049B161    xor         edx,edx
 0049B163    mov         dword ptr [eax+10],edx
 0049B166    ret
*}
end;

//0049B168
{*procedure sub_0049B168(?:?);
begin
 0049B168    push        ebx
 0049B169    mov         ebx,eax
 0049B16B    mov         eax,dword ptr [ebx+24]
 0049B16E    call        0049A480
 0049B173    mov         eax,dword ptr [ebx+28]
 0049B176    call        0049A6E0
 0049B17B    mov         eax,dword ptr [ebx+2C]
 0049B17E    call        0049A948
 0049B183    mov         eax,ebx
 0049B185    call        0049B274
 0049B18A    pop         ebx
 0049B18B    ret
end;*}

//0049B18C
{*procedure sub_0049B18C(?:TFile3DS; ?:?);
begin
 0049B18C    push        ebx
 0049B18D    push        esi
 0049B18E    mov         esi,edx
 0049B190    mov         ebx,eax
 0049B192    mov         eax,ebx
 0049B194    call        0049B0AC
 0049B199    mov         eax,ebx
 0049B19B    call        0049B168
 0049B1A0    lea         eax,[ebx+30]
 0049B1A3    call        @LStrClr
 0049B1A8    mov         dword ptr [ebx+1C],esi
 0049B1AB    mov         eax,ebx
 0049B1AD    call        0049B144
 0049B1B2    mov         eax,ebx
 0049B1B4    call        0049B0CC
 0049B1B9    pop         esi
 0049B1BA    pop         ebx
 0049B1BB    ret
end;*}

//0049B1BC
{*procedure sub_0049B1BC(?:TFile3DS; ?:?);
begin
 0049B1BC    push        ebx
 0049B1BD    push        esi
 0049B1BE    push        edi
 0049B1BF    add         esp,0FFFFFFF8
 0049B1C2    mov         esi,edx
 0049B1C4    mov         ebx,eax
 0049B1C6    lea         edi,[esp+4]
 0049B1CA    mov         edx,esi
 0049B1CC    mov         eax,ebx
 0049B1CE    call        0049E0F8
 0049B1D3    mov         eax,dword ptr [esi+8]
 0049B1D6    add         eax,dword ptr [esi+4]
 0049B1D9    mov         dword ptr [esp],eax
>0049B1DC    jmp         0049B243
 0049B1DE    xor         eax,eax
 0049B1E0    mov         dword ptr [edi],eax
 0049B1E2    mov         eax,edi
 0049B1E4    call        00497780
 0049B1E9    cmp         word ptr [ebx+3A],0;TFile3DS.?f3A:word
>0049B1EE    je          0049B202
 0049B1F0    mov         eax,dword ptr [ebx+1C];TFile3DS.?f1C:dword
 0049B1F3    call        TStream.GetPosition
 0049B1F8    mov         edx,eax
 0049B1FA    xor         ecx,ecx
 0049B1FC    mov         eax,dword ptr [ebx+3C];TFile3DS.?f3C:dword
 0049B1FF    call        dword ptr [ebx+38]
 0049B202    mov         eax,dword ptr [ebx+1C];TFile3DS.?f1C:dword
 0049B205    call        TStream.GetPosition
 0049B20A    mov         edx,dword ptr [edi]
 0049B20C    mov         dword ptr [edx+8],eax
 0049B20F    mov         eax,dword ptr [edi]
 0049B211    lea         ecx,[eax+4]
 0049B214    mov         edx,dword ptr [edi]
 0049B216    mov         eax,ebx
 0049B218    call        0049C0BC
 0049B21D    mov         edx,dword ptr [edi]
 0049B21F    mov         eax,esi
 0049B221    call        004973E4
 0049B226    mov         eax,dword ptr [edi]
 0049B228    cmp         word ptr [eax],8001
>0049B22D    jne         0049B23A
 0049B22F    mov         edx,dword ptr [edi]
 0049B231    mov         eax,ebx
 0049B233    call        0049AFE0
>0049B238    jmp         0049B243
 0049B23A    mov         edx,dword ptr [edi]
 0049B23C    mov         eax,ebx
 0049B23E    call        0049B1BC
 0049B243    mov         eax,dword ptr [ebx+1C];TFile3DS.?f1C:dword
 0049B246    call        TStream.GetPosition
 0049B24B    push        edx
 0049B24C    push        eax
 0049B24D    mov         eax,dword ptr [esp+8]
 0049B251    cdq
 0049B252    cmp         edx,dword ptr [esp+4]
>0049B256    jne         0049B265
 0049B258    cmp         eax,dword ptr [esp]
 0049B25B    pop         edx
 0049B25C    pop         eax
>0049B25D    ja          0049B1DE
>0049B263    jmp         0049B26D
 0049B265    pop         edx
 0049B266    pop         eax
>0049B267    jg          0049B1DE
 0049B26D    pop         ecx
 0049B26E    pop         edx
 0049B26F    pop         edi
 0049B270    pop         esi
 0049B271    pop         ebx
 0049B272    ret
end;*}

//0049B274
{*procedure sub_0049B274(?:?);
begin
 0049B274    push        ebx
 0049B275    lea         ebx,[eax+8]
 0049B278    cmp         dword ptr [ebx],0
>0049B27B    je          0049B284
 0049B27D    mov         eax,ebx
 0049B27F    call        004978A4
 0049B284    cmp         dword ptr [ebx+8],0
>0049B288    je          0049B292
 0049B28A    lea         eax,[ebx+8]
 0049B28D    call        004978D4
 0049B292    cmp         dword ptr [ebx+0C],0
>0049B296    je          0049B2A0
 0049B298    lea         eax,[ebx+0C]
 0049B29B    call        004978D4
 0049B2A0    cmp         dword ptr [ebx+10],0
>0049B2A4    je          0049B2AE
 0049B2A6    lea         eax,[ebx+10]
 0049B2A9    call        004978D4
 0049B2AE    pop         ebx
 0049B2AF    ret
end;*}

//0049B2B0
{*function sub_0049B2B0(?:?; ?:?):?;
begin
 0049B2B0    push        ebx
 0049B2B1    push        esi
 0049B2B2    mov         ebx,edx
 0049B2B4    movzx       eax,word ptr [ebx]
 0049B2B7    cmp         eax,80F0
>0049B2BC    jg          0049B5F8
>0049B2C2    je          0049BE8E
 0049B2C8    cmp         eax,4000
>0049B2CD    jg          0049B46A
>0049B2D3    je          0049BC24
 0049B2D9    cmp         eax,1460
>0049B2DE    jg          0049B3A5
>0049B2E4    je          0049BA20
 0049B2EA    cmp         eax,1100
>0049B2EF    jg          0049B347
>0049B2F1    je          0049BA68
 0049B2F7    cmp         eax,13
>0049B2FA    jg          0049B327
>0049B2FC    je          0049B93E
 0049B302    sub         eax,2
>0049B305    je          0049B9A2
 0049B30B    sub         eax,0E
>0049B30E    je          0049B92C
 0049B314    dec         eax
>0049B315    je          0049B950
 0049B31B    dec         eax
>0049B31C    je          0049B962
>0049B322    jmp         0049BF62
 0049B327    sub         eax,30
>0049B32A    je          0049B974
 0049B330    dec         eax
>0049B331    je          0049B986
 0049B337    sub         eax,0CF
>0049B33C    je          0049B9C6
>0049B342    jmp         0049BF62
 0049B347    cmp         eax,1420
>0049B34C    jg          0049B383
>0049B34E    je          0049BA32
 0049B354    sub         eax,1200
>0049B359    je          0049BF5B
 0049B35F    sub         eax,100
>0049B364    je          0049BA72
 0049B36A    sub         eax,100
>0049B36F    je          0049B9D8
 0049B375    sub         eax,10
>0049B378    je          0049BA0E
>0049B37E    jmp         0049BF62
 0049B383    sub         eax,1430
>0049B388    je          0049BA44
 0049B38E    sub         eax,10
>0049B391    je          0049B9FC
 0049B397    sub         eax,10
>0049B39A    je          0049B9EA
>0049B3A0    jmp         0049BF62
 0049B3A5    cmp         eax,3030
>0049B3AA    jg          0049B412
>0049B3AC    je          0049BABA
 0049B3B2    cmp         eax,2302
>0049B3B7    jg          0049B3F0
>0049B3B9    je          0049BA96
 0049B3BF    sub         eax,1500
>0049B3C4    je          0049BA56
 0049B3CA    sub         eax,0C00
>0049B3CF    je          0049BF5B
 0049B3D5    sub         eax,100
>0049B3DA    je          0049BA84
 0049B3E0    sub         eax,100
>0049B3E5    je          0049BAA8
>0049B3EB    jmp         0049BF62
 0049B3F0    sub         eax,3000
>0049B3F5    je          0049BF5B
 0049B3FB    sub         eax,10
>0049B3FE    je          0049BABA
 0049B404    sub         eax,10
>0049B407    je          0049BABA
>0049B40D    jmp         0049BF62
 0049B412    cmp         eax,3080
>0049B417    jg          0049B44A
>0049B419    je          0049BADE
 0049B41F    sub         eax,3040
>0049B424    je          0049BABA
 0049B42A    sub         eax,10
>0049B42D    je          0049BABA
 0049B433    sub         eax,10
>0049B436    je          0049BABA
 0049B43C    sub         eax,10
>0049B43F    je          0049BACC
>0049B445    jmp         0049BF62
 0049B44A    sub         eax,3D3D
>0049B44F    je          0049BF5B
 0049B455    dec         eax
>0049B456    je          0049B9B4
 0049B45C    sub         eax,6C
>0049B45F    je          0049BF5B
>0049B465    jmp         0049BF62
 0049B46A    cmp         eax,4654
>0049B46F    jg          0049B538
>0049B475    je          0049BCFE
 0049B47B    cmp         eax,4165
>0049B480    jg          0049B4E0
>0049B482    je          0049BCBE
 0049B488    cmp         eax,4130
>0049B48D    jg          0049B4BE
>0049B48F    je          0049BC64
 0049B495    sub         eax,4100
>0049B49A    je          0049BF5B
 0049B4A0    sub         eax,10
>0049B4A3    je          0049BC2E
 0049B4A9    dec         eax
>0049B4AA    je          0049BC40
 0049B4B0    sub         eax,0F
>0049B4B3    je          0049BC52
>0049B4B9    jmp         0049BF62
 0049B4BE    sub         eax,4140
>0049B4C3    je          0049BC9A
 0049B4C9    sub         eax,10
>0049B4CC    je          0049BC88
 0049B4D2    sub         eax,10
>0049B4D5    je          0049BCAC
>0049B4DB    jmp         0049BF62
 0049B4E0    cmp         eax,4600
>0049B4E5    jg          0049B516
>0049B4E7    je          0049BCEC
 0049B4ED    sub         eax,4170
>0049B4F2    je          0049BCD0
 0049B4F8    sub         eax,11
>0049B4FB    je          0049BCE2
 0049B501    dec         eax
>0049B502    je          0049BB16
 0049B508    sub         eax,0E
>0049B50B    je          0049BC76
>0049B511    jmp         0049BF62
 0049B516    sub         eax,4610
>0049B51B    je          0049BD3E
 0049B521    sub         eax,31
>0049B524    je          0049BD50
 0049B52A    sub         eax,12
>0049B52D    je          0049BD86
>0049B533    jmp         0049BF62
 0049B538    cmp         eax,4D4D
>0049B53D    jg          0049B59B
>0049B53F    je          0049BF5B
 0049B545    cmp         eax,465A
>0049B54A    jg          0049B577
>0049B54C    je          0049BD1A
 0049B552    sub         eax,4656
>0049B557    je          0049BD62
 0049B55D    dec         eax
>0049B55E    je          0049BD74
 0049B564    dec         eax
>0049B565    je          0049BD90
 0049B56B    dec         eax
>0049B56C    je          0049BD08
>0049B572    jmp         0049BF62
 0049B577    sub         eax,465B
>0049B57C    je          0049BD2C
 0049B582    sub         eax,0A5
>0049B587    je          0049BDA2
 0049B58D    sub         eax,20
>0049B590    je          0049BDB4
>0049B596    jmp         0049BF62
 0049B59B    cmp         eax,8001
>0049B5A0    jg          0049B5D8
>0049B5A2    je          0049BDFC
 0049B5A8    sub         eax,7001
>0049B5AD    je          0049BDC6
 0049B5B3    add         eax,0FFFFFFF0
 0049B5B6    sub         eax,2
>0049B5B9    jb          0049BDEA
 0049B5BF    sub         eax,0D
>0049B5C2    je          0049BDD8
 0049B5C8    sub         eax,0FE0
>0049B5CD    je          0049BF5B
>0049B5D3    jmp         0049BF62
 0049B5D8    sub         eax,8002
>0049B5DD    je          0049BE0E
 0049B5E3    dec         eax
>0049B5E4    je          0049BE18
 0049B5EA    sub         eax,6
>0049B5ED    je          0049BF5B
>0049B5F3    jmp         0049BF62
 0049B5F8    cmp         eax,0A348
>0049B5FD    jg          0049B799
>0049B603    je          0049BF5B
 0049B609    cmp         eax,0A310
>0049B60E    jg          0049B6E8
>0049B614    je          0049BB04
 0049B61A    cmp         eax,0A087
>0049B61F    jg          0049B68A
>0049B621    je          0049BB28
 0049B627    cmp         eax,0A040
>0049B62C    jge         0049B659
 0049B62E    sub         eax,0A000
>0049B633    je          0049BAE8
 0049B639    sub         eax,10
>0049B63C    je          0049BF5B
 0049B642    sub         eax,10
>0049B645    je          0049BF5B
 0049B64B    sub         eax,10
>0049B64E    je          0049BF5B
>0049B654    jmp         0049BF62
 0049B659    add         eax,0FFFF5FC0
 0049B65E    sub         eax,3
>0049B661    jb          0049BF5B
 0049B667    sub         eax,0D
>0049B66A    je          0049BF5B
 0049B670    add         eax,0FFFFFFFE
 0049B673    sub         eax,2
>0049B676    jb          0049BF5B
 0049B67C    sub         eax,30
>0049B67F    je          0049BF5B
>0049B685    jmp         0049BF62
 0049B68A    cmp         eax,0A220
>0049B68F    jg          0049B6C4
>0049B691    je          0049BF5B
 0049B697    sub         eax,0A100
>0049B69C    je          0049BAF2
 0049B6A2    sub         eax,100
>0049B6A7    je          0049BF5B
 0049B6AD    sub         eax,4
>0049B6B0    je          0049BF5B
 0049B6B6    sub         eax,0C
>0049B6B9    je          0049BF5B
>0049B6BF    jmp         0049BF62
 0049B6C4    sub         eax,0A230
>0049B6C9    je          0049BF5B
 0049B6CF    sub         eax,22
>0049B6D2    je          0049BC12
 0049B6D8    sub         eax,0AE
>0049B6DD    je          0049B998
>0049B6E3    jmp         0049BF62
 0049B6E8    add         eax,0FFFF5CE0
 0049B6ED    cmp         eax,26
>0049B6F0    ja          0049BF62
 0049B6F6    jmp         dword ptr [eax*4+49B6FD]
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BB16
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BF5B
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BF5B
 0049B6F6    dd          0049BF5B
 0049B6F6    dd          0049BF5B
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BF5B
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BF5B
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BF5B
 0049B6F6    dd          0049BF62
 0049B6F6    dd          0049BF5B
 0049B799    cmp         eax,0B00A
>0049B79E    jg          0049B868
>0049B7A4    je          0049BE22
 0049B7AA    cmp         eax,0A35C
>0049B7AF    jg          0049B810
>0049B7B1    je          0049BBA6
 0049B7B7    add         eax,0FFFF5CB6
 0049B7BC    cmp         eax,10
>0049B7BF    ja          0049BF62
 0049B7C5    jmp         dword ptr [eax*4+49B7CC]
 0049B7C5    dd          0049BF5B
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BF5B
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BB3A
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BB4C
 0049B7C5    dd          0049BB5E
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BB70
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BB82
 0049B7C5    dd          0049BF62
 0049B7C5    dd          0049BB94
 0049B810    cmp         eax,0A368
>0049B815    jg          0049B848
>0049B817    je          0049BC00
 0049B81D    sub         eax,0A360
>0049B822    je          0049BBB8
 0049B828    sub         eax,2
>0049B82B    je          0049BBCA
 0049B831    sub         eax,2
>0049B834    je          0049BBDC
 0049B83A    sub         eax,2
>0049B83D    je          0049BBEE
>0049B843    jmp         0049BF62
 0049B848    add         eax,0FFFF5001
 0049B84D    sub         eax,9
>0049B850    jb          0049BF5B
>0049B856    je          0049BE34
 0049B85C    dec         eax
>0049B85D    je          0049BE46
>0049B863    jmp         0049BF62
 0049B868    cmp         eax,0B023
>0049B86D    jg          0049B8D6
>0049B86F    je          0049BF10
 0049B875    add         eax,0FFFF4FF0
 0049B87A    cmp         eax,12
>0049B87D    ja          0049BF62
 0049B883    jmp         dword ptr [eax*4+49B88A]
 0049B883    dd          0049BE6A
 0049B883    dd          0049BE8E
 0049B883    dd          0049BF62
 0049B883    dd          0049BE7C
 0049B883    dd          0049BEAA
 0049B883    dd          0049BE98
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BF62
 0049B883    dd          0049BEBC
 0049B883    dd          0049BEE0
 0049B883    dd          0049BEF2
 0049B8D6    cmp         eax,0B028
>0049B8DB    jg          0049B908
>0049B8DD    je          0049BF3D
 0049B8E3    sub         eax,0B024
>0049B8E8    je          0049BF1F
 0049B8EE    dec         eax
>0049B8EF    je          0049BECE
 0049B8F5    dec         eax
>0049B8F6    je          0049BF01
 0049B8FC    dec         eax
>0049B8FD    je          0049BF2E
>0049B903    jmp         0049BF62
 0049B908    sub         eax,0B029
>0049B90D    je          0049BF4C
 0049B913    sub         eax,7
>0049B916    je          0049BE58
 0049B91C    sub         eax,120D
>0049B921    je          0049BF5B
>0049B927    jmp         0049BF62
 0049B92C    mov         eax,0C
 0049B931    call        AllocMem
 0049B936    mov         dword ptr [ebx+0C],eax
>0049B939    jmp         0049BF7E
 0049B93E    mov         eax,0C
 0049B943    call        AllocMem
 0049B948    mov         dword ptr [ebx+0C],eax
>0049B94B    jmp         0049BF7E
 0049B950    mov         eax,3
 0049B955    call        AllocMem
 0049B95A    mov         dword ptr [ebx+0C],eax
>0049B95D    jmp         0049BF7E
 0049B962    mov         eax,3
 0049B967    call        AllocMem
 0049B96C    mov         dword ptr [ebx+0C],eax
>0049B96F    jmp         0049BF7E
 0049B974    mov         eax,2
 0049B979    call        AllocMem
 0049B97E    mov         dword ptr [ebx+0C],eax
>0049B981    jmp         0049BF7E
 0049B986    mov         eax,4
 0049B98B    call        AllocMem
 0049B990    mov         dword ptr [ebx+0C],eax
>0049B993    jmp         0049BF7E
 0049B998    xor         eax,eax
 0049B99A    mov         dword ptr [ebx+0C],eax
>0049B99D    jmp         0049BF7E
 0049B9A2    mov         eax,4
 0049B9A7    call        AllocMem
 0049B9AC    mov         dword ptr [ebx+0C],eax
>0049B9AF    jmp         0049BF7E
 0049B9B4    mov         eax,4
 0049B9B9    call        AllocMem
 0049B9BE    mov         dword ptr [ebx+0C],eax
>0049B9C1    jmp         0049BF7E
 0049B9C6    mov         eax,4
 0049B9CB    call        AllocMem
 0049B9D0    mov         dword ptr [ebx+0C],eax
>0049B9D3    jmp         0049BF7E
 0049B9D8    mov         eax,4
 0049B9DD    call        AllocMem
 0049B9E2    mov         dword ptr [ebx+0C],eax
>0049B9E5    jmp         0049BF7E
 0049B9EA    mov         eax,4
 0049B9EF    call        AllocMem
 0049B9F4    mov         dword ptr [ebx+0C],eax
>0049B9F7    jmp         0049BF7E
 0049B9FC    mov         eax,4
 0049BA01    call        AllocMem
 0049BA06    mov         dword ptr [ebx+0C],eax
>0049BA09    jmp         0049BF7E
 0049BA0E    mov         eax,4
 0049BA13    call        AllocMem
 0049BA18    mov         dword ptr [ebx+0C],eax
>0049BA1B    jmp         0049BF7E
 0049BA20    mov         eax,4
 0049BA25    call        AllocMem
 0049BA2A    mov         dword ptr [ebx+0C],eax
>0049BA2D    jmp         0049BF7E
 0049BA32    mov         eax,2
 0049BA37    call        AllocMem
 0049BA3C    mov         dword ptr [ebx+0C],eax
>0049BA3F    jmp         0049BF7E
 0049BA44    mov         eax,2
 0049BA49    call        AllocMem
 0049BA4E    mov         dword ptr [ebx+0C],eax
>0049BA51    jmp         0049BF7E
 0049BA56    mov         eax,0C
 0049BA5B    call        AllocMem
 0049BA60    mov         dword ptr [ebx+0C],eax
>0049BA63    jmp         0049BF7E
 0049BA68    xor         eax,eax
 0049BA6A    mov         dword ptr [ebx+0C],eax
>0049BA6D    jmp         0049BF7E
 0049BA72    mov         eax,4
 0049BA77    call        AllocMem
 0049BA7C    mov         dword ptr [ebx+0C],eax
>0049BA7F    jmp         0049BF7E
 0049BA84    mov         eax,10
 0049BA89    call        AllocMem
 0049BA8E    mov         dword ptr [ebx+0C],eax
>0049BA91    jmp         0049BF7E
 0049BA96    mov         eax,10
 0049BA9B    call        AllocMem
 0049BAA0    mov         dword ptr [ebx+0C],eax
>0049BAA3    jmp         0049BF7E
 0049BAA8    mov         eax,10
 0049BAAD    call        AllocMem
 0049BAB2    mov         dword ptr [ebx+0C],eax
>0049BAB5    jmp         0049BF7E
 0049BABA    mov         eax,10
 0049BABF    call        AllocMem
 0049BAC4    mov         dword ptr [ebx+0C],eax
>0049BAC7    jmp         0049BF7E
 0049BACC    mov         eax,1C
 0049BAD1    call        AllocMem
 0049BAD6    mov         dword ptr [ebx+0C],eax
>0049BAD9    jmp         0049BF7E
 0049BADE    xor         eax,eax
 0049BAE0    mov         dword ptr [ebx+0C],eax
>0049BAE3    jmp         0049BF7E
 0049BAE8    xor         eax,eax
 0049BAEA    mov         dword ptr [ebx+0C],eax
>0049BAED    jmp         0049BF7E
 0049BAF2    mov         eax,2
 0049BAF7    call        AllocMem
 0049BAFC    mov         dword ptr [ebx+0C],eax
>0049BAFF    jmp         0049BF7E
 0049BB04    mov         eax,0C
 0049BB09    call        AllocMem
 0049BB0E    mov         dword ptr [ebx+0C],eax
>0049BB11    jmp         0049BF7E
 0049BB16    mov         eax,8
 0049BB1B    call        AllocMem
 0049BB20    mov         dword ptr [ebx+0C],eax
>0049BB23    jmp         0049BF7E
 0049BB28    mov         eax,4
 0049BB2D    call        AllocMem
 0049BB32    mov         dword ptr [ebx+0C],eax
>0049BB35    jmp         0049BF7E
 0049BB3A    mov         eax,2
 0049BB3F    call        AllocMem
 0049BB44    mov         dword ptr [ebx+0C],eax
>0049BB47    jmp         0049BF7E
 0049BB4C    mov         eax,4
 0049BB51    call        AllocMem
 0049BB56    mov         dword ptr [ebx+0C],eax
>0049BB59    jmp         0049BF7E
 0049BB5E    mov         eax,4
 0049BB63    call        AllocMem
 0049BB68    mov         dword ptr [ebx+0C],eax
>0049BB6B    jmp         0049BF7E
 0049BB70    mov         eax,4
 0049BB75    call        AllocMem
 0049BB7A    mov         dword ptr [ebx+0C],eax
>0049BB7D    jmp         0049BF7E
 0049BB82    mov         eax,4
 0049BB87    call        AllocMem
 0049BB8C    mov         dword ptr [ebx+0C],eax
>0049BB8F    jmp         0049BF7E
 0049BB94    mov         eax,4
 0049BB99    call        AllocMem
 0049BB9E    mov         dword ptr [ebx+0C],eax
>0049BBA1    jmp         0049BF7E
 0049BBA6    mov         eax,4
 0049BBAB    call        AllocMem
 0049BBB0    mov         dword ptr [ebx+0C],eax
>0049BBB3    jmp         0049BF7E
 0049BBB8    mov         eax,3
 0049BBBD    call        AllocMem
 0049BBC2    mov         dword ptr [ebx+0C],eax
>0049BBC5    jmp         0049BF7E
 0049BBCA    mov         eax,3
 0049BBCF    call        AllocMem
 0049BBD4    mov         dword ptr [ebx+0C],eax
>0049BBD7    jmp         0049BF7E
 0049BBDC    mov         eax,3
 0049BBE1    call        AllocMem
 0049BBE6    mov         dword ptr [ebx+0C],eax
>0049BBE9    jmp         0049BF7E
 0049BBEE    mov         eax,3
 0049BBF3    call        AllocMem
 0049BBF8    mov         dword ptr [ebx+0C],eax
>0049BBFB    jmp         0049BF7E
 0049BC00    mov         eax,3
 0049BC05    call        AllocMem
 0049BC0A    mov         dword ptr [ebx+0C],eax
>0049BC0D    jmp         0049BF7E
 0049BC12    mov         eax,2
 0049BC17    call        AllocMem
 0049BC1C    mov         dword ptr [ebx+0C],eax
>0049BC1F    jmp         0049BF7E
 0049BC24    xor         eax,eax
 0049BC26    mov         dword ptr [ebx+0C],eax
>0049BC29    jmp         0049BF7E
 0049BC2E    mov         eax,8
 0049BC33    call        AllocMem
 0049BC38    mov         dword ptr [ebx+0C],eax
>0049BC3B    jmp         0049BF7E
 0049BC40    mov         eax,8
 0049BC45    call        AllocMem
 0049BC4A    mov         dword ptr [ebx+0C],eax
>0049BC4D    jmp         0049BF7E
 0049BC52    mov         eax,8
 0049BC57    call        AllocMem
 0049BC5C    mov         dword ptr [ebx+0C],eax
>0049BC5F    jmp         0049BF7E
 0049BC64    mov         eax,0C
 0049BC69    call        AllocMem
 0049BC6E    mov         dword ptr [ebx+0C],eax
>0049BC71    jmp         0049BF7E
 0049BC76    mov         eax,18
 0049BC7B    call        AllocMem
 0049BC80    mov         dword ptr [ebx+0C],eax
>0049BC83    jmp         0049BF7E
 0049BC88    mov         eax,8
 0049BC8D    call        AllocMem
 0049BC92    mov         dword ptr [ebx+0C],eax
>0049BC95    jmp         0049BF7E
 0049BC9A    mov         eax,8
 0049BC9F    call        AllocMem
 0049BCA4    mov         dword ptr [ebx+0C],eax
>0049BCA7    jmp         0049BF7E
 0049BCAC    mov         eax,30
 0049BCB1    call        AllocMem
 0049BCB6    mov         dword ptr [ebx+0C],eax
>0049BCB9    jmp         0049BF7E
 0049BCBE    mov         eax,1
 0049BCC3    call        AllocMem
 0049BCC8    mov         dword ptr [ebx+0C],eax
>0049BCCB    jmp         0049BF7E
 0049BCD0    mov         eax,58
 0049BCD5    call        AllocMem
 0049BCDA    mov         dword ptr [ebx+0C],eax
>0049BCDD    jmp         0049BF7E
 0049BCE2    xor         eax,eax
 0049BCE4    mov         dword ptr [ebx+0C],eax
>0049BCE7    jmp         0049BF7E
 0049BCEC    mov         eax,0C
 0049BCF1    call        AllocMem
 0049BCF6    mov         dword ptr [ebx+0C],eax
>0049BCF9    jmp         0049BF7E
 0049BCFE    xor         eax,eax
 0049BD00    mov         dword ptr [ebx+0C],eax
>0049BD03    jmp         0049BF7E
 0049BD08    mov         eax,4
 0049BD0D    call        AllocMem
 0049BD12    mov         dword ptr [ebx+0C],eax
>0049BD15    jmp         0049BF7E
 0049BD1A    mov         eax,4
 0049BD1F    call        AllocMem
 0049BD24    mov         dword ptr [ebx+0C],eax
>0049BD27    jmp         0049BF7E
 0049BD2C    mov         eax,4
 0049BD31    call        AllocMem
 0049BD36    mov         dword ptr [ebx+0C],eax
>0049BD39    jmp         0049BF7E
 0049BD3E    mov         eax,14
 0049BD43    call        AllocMem
 0049BD48    mov         dword ptr [ebx+0C],eax
>0049BD4B    jmp         0049BF7E
 0049BD50    mov         eax,0C
 0049BD55    call        AllocMem
 0049BD5A    mov         dword ptr [ebx+0C],eax
>0049BD5D    jmp         0049BF7E
 0049BD62    mov         eax,4
 0049BD67    call        AllocMem
 0049BD6C    mov         dword ptr [ebx+0C],eax
>0049BD6F    jmp         0049BF7E
 0049BD74    mov         eax,4
 0049BD79    call        AllocMem
 0049BD7E    mov         dword ptr [ebx+0C],eax
>0049BD81    jmp         0049BF7E
 0049BD86    xor         eax,eax
 0049BD88    mov         dword ptr [ebx+0C],eax
>0049BD8B    jmp         0049BF7E
 0049BD90    mov         eax,4
 0049BD95    call        AllocMem
 0049BD9A    mov         dword ptr [ebx+0C],eax
>0049BD9D    jmp         0049BF7E
 0049BDA2    mov         eax,20
 0049BDA7    call        AllocMem
 0049BDAC    mov         dword ptr [ebx+0C],eax
>0049BDAF    jmp         0049BF7E
 0049BDB4    mov         eax,8
 0049BDB9    call        AllocMem
 0049BDBE    mov         dword ptr [ebx+0C],eax
>0049BDC1    jmp         0049BF7E
 0049BDC6    mov         eax,0E
 0049BDCB    call        AllocMem
 0049BDD0    mov         dword ptr [ebx+0C],eax
>0049BDD3    jmp         0049BF7E
 0049BDD8    mov         eax,8
 0049BDDD    call        AllocMem
 0049BDE2    mov         dword ptr [ebx+0C],eax
>0049BDE5    jmp         0049BF7E
 0049BDEA    mov         eax,2C
 0049BDEF    call        AllocMem
 0049BDF4    mov         dword ptr [ebx+0C],eax
>0049BDF7    jmp         0049BF7E
 0049BDFC    mov         eax,8
 0049BE01    call        AllocMem
 0049BE06    mov         dword ptr [ebx+0C],eax
>0049BE09    jmp         0049BF7E
 0049BE0E    xor         eax,eax
 0049BE10    mov         dword ptr [ebx+0C],eax
>0049BE13    jmp         0049BF7E
 0049BE18    xor         eax,eax
 0049BE1A    mov         dword ptr [ebx+0C],eax
>0049BE1D    jmp         0049BF7E
 0049BE22    mov         eax,0C
 0049BE27    call        AllocMem
 0049BE2C    mov         dword ptr [ebx+0C],eax
>0049BE2F    jmp         0049BF7E
 0049BE34    mov         eax,8
 0049BE39    call        AllocMem
 0049BE3E    mov         dword ptr [ebx+0C],eax
>0049BE41    jmp         0049BF7E
 0049BE46    mov         eax,4
 0049BE4B    call        AllocMem
 0049BE50    mov         dword ptr [ebx+0C],eax
>0049BE53    jmp         0049BF7E
 0049BE58    mov         eax,2
 0049BE5D    call        AllocMem
 0049BE62    mov         dword ptr [ebx+0C],eax
>0049BE65    jmp         0049BF7E
 0049BE6A    mov         eax,0C
 0049BE6F    call        AllocMem
 0049BE74    mov         dword ptr [ebx+0C],eax
>0049BE77    jmp         0049BF7E
 0049BE7C    mov         eax,0C
 0049BE81    call        AllocMem
 0049BE86    mov         dword ptr [ebx+0C],eax
>0049BE89    jmp         0049BF7E
 0049BE8E    xor         eax,eax
 0049BE90    mov         dword ptr [ebx+0C],eax
>0049BE93    jmp         0049BF7E
 0049BE98    mov         eax,4
 0049BE9D    call        AllocMem
 0049BEA2    mov         dword ptr [ebx+0C],eax
>0049BEA5    jmp         0049BF7E
 0049BEAA    mov         eax,18
 0049BEAF    call        AllocMem
 0049BEB4    mov         dword ptr [ebx+0C],eax
>0049BEB7    jmp         0049BF7E
 0049BEBC    mov         eax,18
 0049BEC1    call        AllocMem
 0049BEC6    mov         dword ptr [ebx+0C],eax
>0049BEC9    jmp         0049BF7E
 0049BECE    mov         eax,18
 0049BED3    call        AllocMem
 0049BED8    mov         dword ptr [ebx+0C],eax
>0049BEDB    jmp         0049BF7E
 0049BEE0    mov         eax,18
 0049BEE5    call        AllocMem
 0049BEEA    mov         dword ptr [ebx+0C],eax
>0049BEED    jmp         0049BF7E
 0049BEF2    mov         eax,18
 0049BEF7    call        AllocMem
 0049BEFC    mov         dword ptr [ebx+0C],eax
>0049BEFF    jmp         0049BF7E
 0049BF01    mov         eax,18
 0049BF06    call        AllocMem
 0049BF0B    mov         dword ptr [ebx+0C],eax
>0049BF0E    jmp         0049BF7E
 0049BF10    mov         eax,18
 0049BF15    call        AllocMem
 0049BF1A    mov         dword ptr [ebx+0C],eax
>0049BF1D    jmp         0049BF7E
 0049BF1F    mov         eax,18
 0049BF24    call        AllocMem
 0049BF29    mov         dword ptr [ebx+0C],eax
>0049BF2C    jmp         0049BF7E
 0049BF2E    mov         eax,18
 0049BF33    call        AllocMem
 0049BF38    mov         dword ptr [ebx+0C],eax
>0049BF3B    jmp         0049BF7E
 0049BF3D    mov         eax,18
 0049BF42    call        AllocMem
 0049BF47    mov         dword ptr [ebx+0C],eax
>0049BF4A    jmp         0049BF7E
 0049BF4C    mov         eax,14
 0049BF51    call        AllocMem
 0049BF56    mov         dword ptr [ebx+0C],eax
>0049BF59    jmp         0049BF7E
 0049BF5B    xor         eax,eax
 0049BF5D    mov         dword ptr [ebx+0C],eax
>0049BF60    jmp         0049BF7E
 0049BF62    mov         esi,dword ptr [ebx+4]
 0049BF65    cmp         esi,6
>0049BF68    jbe         0049BF79
 0049BF6A    mov         eax,esi
 0049BF6C    sub         eax,6
 0049BF6F    call        AllocMem
 0049BF74    mov         dword ptr [ebx+0C],eax
>0049BF77    jmp         0049BF7E
 0049BF79    xor         eax,eax
 0049BF7B    mov         dword ptr [ebx+0C],eax
 0049BF7E    mov         eax,dword ptr [ebx+0C]
 0049BF81    pop         esi
 0049BF82    pop         ebx
 0049BF83    ret
end;*}

//0049BF84
{*function sub_0049BF84(?:?):?;
begin
 0049BF84    push        ecx
 0049BF85    mov         edx,esp
 0049BF87    mov         ecx,1
 0049BF8C    mov         eax,dword ptr [eax+1C]
 0049BF8F    call        TStream.ReadBuffer
 0049BF94    mov         al,byte ptr [esp]
 0049BF97    pop         edx
 0049BF98    ret
end;*}

//0049BF9C
{*function sub_0049BF9C(?:TFile3DS):?;
begin
 0049BF9C    push        ecx
 0049BF9D    mov         edx,esp
 0049BF9F    mov         ecx,2
 0049BFA4    mov         eax,dword ptr [eax+1C]
 0049BFA7    call        TStream.ReadBuffer
 0049BFAC    mov         ax,word ptr [esp]
 0049BFB0    pop         edx
 0049BFB1    ret
end;*}

//0049BFB4
{*function sub_0049BFB4(?:TFile3DS):?;
begin
 0049BFB4    push        ecx
 0049BFB5    mov         edx,esp
 0049BFB7    mov         ecx,4
 0049BFBC    mov         eax,dword ptr [eax+1C]
 0049BFBF    call        TStream.ReadBuffer
 0049BFC4    mov         eax,dword ptr [esp]
 0049BFC7    pop         edx
 0049BFC8    ret
end;*}

//0049BFCC
{*function sub_0049BFCC(?:TFile3DS):?;
begin
 0049BFCC    push        ecx
 0049BFCD    mov         edx,esp
 0049BFCF    mov         ecx,4
 0049BFD4    mov         eax,dword ptr [eax+1C]
 0049BFD7    call        TStream.ReadBuffer
 0049BFDC    mov         eax,dword ptr [esp]
 0049BFDF    pop         edx
 0049BFE0    ret
end;*}

//0049BFE4
{*function sub_0049BFE4(?:?):?;
begin
 0049BFE4    push        ecx
 0049BFE5    mov         edx,esp
 0049BFE7    mov         ecx,4
 0049BFEC    mov         eax,dword ptr [eax+1C]
 0049BFEF    call        TStream.ReadBuffer
 0049BFF4    fld         dword ptr [esp]
 0049BFF7    pop         edx
 0049BFF8    ret
end;*}

//0049BFFC
{*function sub_0049BFFC(?:TFile3DS):?;
begin
 0049BFFC    push        ecx
 0049BFFD    mov         edx,esp
 0049BFFF    mov         ecx,2
 0049C004    mov         eax,dword ptr [eax+1C]
 0049C007    call        TStream.ReadBuffer
 0049C00C    mov         ax,word ptr [esp]
 0049C010    pop         edx
 0049C011    ret
end;*}

//0049C014
{*procedure sub_0049C014(?:?; ?:Integer; ?:?);
begin
 0049C014    mov         eax,dword ptr [eax+1C]
 0049C017    xchg        ecx,edx
 0049C019    call        TStream.ReadBuffer
 0049C01E    ret
end;*}

//0049C020
{*function sub_0049C020(?:TFile3DS):?;
begin
 0049C020    push        ebp
 0049C021    mov         ebp,esp
 0049C023    add         esp,0FFFFFFF8
 0049C026    push        ebx
 0049C027    push        esi
 0049C028    push        edi
 0049C029    xor         edx,edx
 0049C02B    mov         dword ptr [ebp-8],edx
 0049C02E    mov         dword ptr [ebp-4],eax
 0049C031    xor         eax,eax
 0049C033    push        ebp
 0049C034    push        49C0AB
 0049C039    push        dword ptr fs:[eax]
 0049C03C    mov         dword ptr fs:[eax],esp
 0049C03F    xor         ebx,ebx
 0049C041    xor         esi,esi
 0049C043    cmp         esi,ebx
>0049C045    jg          0049C054
 0049C047    add         esi,32
 0049C04A    lea         eax,[ebp-8]
 0049C04D    mov         edx,esi
 0049C04F    call        @LStrSetLength
 0049C054    inc         ebx
 0049C055    lea         eax,[ebp-8]
 0049C058    call        @UniqueStringA
 0049C05D    lea         edx,[eax+ebx-1]
 0049C061    mov         eax,dword ptr [ebp-4]
 0049C064    mov         eax,dword ptr [eax+1C]
 0049C067    mov         ecx,1
 0049C06C    mov         edi,dword ptr [eax]
 0049C06E    call        dword ptr [edi+0C]
 0049C071    mov         eax,dword ptr [ebp-8]
 0049C074    cmp         byte ptr [eax+ebx-1],0
>0049C079    jne         0049C043
 0049C07B    mov         eax,ebx
 0049C07D    call        AllocMem
 0049C082    mov         esi,eax
 0049C084    lea         eax,[ebp-8]
 0049C087    call        @UniqueStringA
 0049C08C    mov         edx,esi
 0049C08E    mov         ecx,ebx
 0049C090    call        Move
 0049C095    xor         eax,eax
 0049C097    pop         edx
 0049C098    pop         ecx
 0049C099    pop         ecx
 0049C09A    mov         dword ptr fs:[eax],edx
 0049C09D    push        49C0B2
 0049C0A2    lea         eax,[ebp-8]
 0049C0A5    call        @LStrClr
 0049C0AA    ret
>0049C0AB    jmp         @HandleFinally
>0049C0B0    jmp         0049C0A2
 0049C0B2    mov         eax,esi
 0049C0B4    pop         edi
 0049C0B5    pop         esi
 0049C0B6    pop         ebx
 0049C0B7    pop         ecx
 0049C0B8    pop         ecx
 0049C0B9    pop         ebp
 0049C0BA    ret
end;*}

//0049C0BC
{*procedure sub_0049C0BC(?:TFile3DS; ?:?; ?:?);
begin
 0049C0BC    push        ebx
 0049C0BD    push        esi
 0049C0BE    push        edi
 0049C0BF    mov         edi,ecx
 0049C0C1    mov         esi,edx
 0049C0C3    mov         ebx,eax
 0049C0C5    mov         eax,ebx
 0049C0C7    call        0049BFFC
 0049C0CC    mov         word ptr [esi],ax
 0049C0CF    mov         eax,ebx
 0049C0D1    call        0049BFB4
 0049C0D6    mov         dword ptr [edi],eax
 0049C0D8    pop         edi
 0049C0D9    pop         esi
 0049C0DA    pop         ebx
 0049C0DB    ret
end;*}

//0049C0DC
{*procedure sub_0049C0DC(?:?; ?:?);
begin
 0049C0DC    push        ebx
 0049C0DD    mov         ecx,dword ptr ds:[5AE7A0];^gvar_005AD73C
 0049C0E3    mov         ebx,dword ptr [ecx]
 0049C0E5    mov         dword ptr [edx],ebx
 0049C0E7    mov         ebx,dword ptr [ecx+4]
 0049C0EA    mov         dword ptr [edx+4],ebx
 0049C0ED    mov         ebx,dword ptr [ecx+8]
 0049C0F0    mov         dword ptr [edx+8],ebx
 0049C0F3    mov         ecx,0C
 0049C0F8    mov         eax,dword ptr [eax+1C]
 0049C0FB    call        TStream.ReadBuffer
 0049C100    pop         ebx
 0049C101    ret
end;*}

//0049C104
{*procedure sub_0049C104(?:?; ?:?);
begin
 0049C104    push        ebx
 0049C105    push        esi
 0049C106    push        edi
 0049C107    mov         esi,edx
 0049C109    mov         ebx,eax
 0049C10B    mov         eax,[005AE79C];^gvar_005AD758
 0049C110    push        esi
 0049C111    mov         edi,esi
 0049C113    mov         esi,eax
 0049C115    movs        dword ptr [edi],dword ptr [esi]
 0049C116    movs        dword ptr [edi],dword ptr [esi]
 0049C117    movs        dword ptr [edi],dword ptr [esi]
 0049C118    movs        dword ptr [edi],dword ptr [esi]
 0049C119    pop         esi
 0049C11A    mov         eax,ebx
 0049C11C    call        0049BFFC
 0049C121    mov         word ptr [esi],ax
 0049C124    mov         eax,ebx
 0049C126    call        0049BFB4
 0049C12B    mov         dword ptr [esi+4],eax
 0049C12E    mov         eax,ebx
 0049C130    call        0049BFB4
 0049C135    mov         dword ptr [esi+8],eax
 0049C138    mov         eax,ebx
 0049C13A    call        0049BFB4
 0049C13F    mov         dword ptr [esi+0C],eax
 0049C142    pop         edi
 0049C143    pop         esi
 0049C144    pop         ebx
 0049C145    ret
end;*}

//0049C148
{*procedure sub_0049C148(?:?; ?:?);
begin
 0049C148    push        ebx
 0049C149    push        esi
 0049C14A    push        edi
 0049C14B    mov         ebx,edx
 0049C14D    mov         esi,eax
 0049C14F    mov         eax,[005AE3C8];^gvar_005AD768
 0049C154    push        esi
 0049C155    mov         esi,eax
 0049C157    mov         edi,ebx
 0049C159    mov         ecx,7
 0049C15E    rep movs    dword ptr [edi],dword ptr [esi]
 0049C160    pop         esi
 0049C161    mov         eax,esi
 0049C163    call        0049BFB4
 0049C168    mov         dword ptr [ebx],eax
 0049C16A    mov         eax,esi
 0049C16C    call        0049BFFC
 0049C171    mov         edi,eax
 0049C173    mov         word ptr [ebx+4],di
 0049C177    test        di,1
>0049C17C    jbe         0049C189
 0049C17E    mov         eax,esi
 0049C180    call        0049BFE4
 0049C185    fstp        dword ptr [ebx+8]
 0049C188    wait
 0049C189    test        word ptr [ebx+4],2
>0049C18F    jbe         0049C19C
 0049C191    mov         eax,esi
 0049C193    call        0049BFE4
 0049C198    fstp        dword ptr [ebx+0C]
 0049C19B    wait
 0049C19C    test        word ptr [ebx+4],4
>0049C1A2    jbe         0049C1AF
 0049C1A4    mov         eax,esi
 0049C1A6    call        0049BFE4
 0049C1AB    fstp        dword ptr [ebx+10]
 0049C1AE    wait
 0049C1AF    test        word ptr [ebx+4],8
>0049C1B5    jbe         0049C1C2
 0049C1B7    mov         eax,esi
 0049C1B9    call        0049BFE4
 0049C1BE    fstp        dword ptr [ebx+14]
 0049C1C1    wait
 0049C1C2    test        word ptr [ebx+4],10
>0049C1C8    jbe         0049C1D5
 0049C1CA    mov         eax,esi
 0049C1CC    call        0049BFE4
 0049C1D1    fstp        dword ptr [ebx+18]
 0049C1D4    wait
 0049C1D5    pop         edi
 0049C1D6    pop         esi
 0049C1D7    pop         ebx
 0049C1D8    ret
end;*}

//0049C1DC
{*procedure sub_0049C1DC(?:?; ?:?);
begin
 0049C1DC    push        ebp
 0049C1DD    mov         ebp,esp
 0049C1DF    add         esp,0FFFFFF40
 0049C1E5    push        ebx
 0049C1E6    push        esi
 0049C1E7    push        edi
 0049C1E8    xor         ecx,ecx
 0049C1EA    mov         dword ptr [ebp-94],ecx
 0049C1F0    mov         dword ptr [ebp-90],ecx
 0049C1F6    mov         dword ptr [ebp-8C],ecx
 0049C1FC    mov         esi,edx
 0049C1FE    mov         ebx,eax
 0049C200    xor         eax,eax
 0049C202    push        ebp
 0049C203    push        49E0E8
 0049C208    push        dword ptr fs:[eax]
 0049C20B    mov         dword ptr fs:[eax],esp
 0049C20E    cmp         dword ptr [esi+0C],0
>0049C212    jne         0049E0CA
 0049C218    mov         eax,dword ptr [esi+8]
 0049C21B    add         eax,6
 0049C21E    xor         edx,edx
 0049C220    push        edx
 0049C221    push        eax
 0049C222    mov         eax,dword ptr [ebx+1C]
 0049C225    call        TStream.SetPosition
 0049C22A    movzx       eax,word ptr [esi]
 0049C22D    cmp         eax,80F0
>0049C232    jg          0049C56E
>0049C238    je          0049E0CA
 0049C23E    cmp         eax,4000
>0049C243    jg          0049C3E0
>0049C249    je          0049D032
 0049C24F    cmp         eax,1460
>0049C254    jg          0049C31B
>0049C25A    je          0049CAC3
 0049C260    cmp         eax,1100
>0049C265    jg          0049C2BD
>0049C267    je          0049CB59
 0049C26D    cmp         eax,13
>0049C270    jg          0049C29D
>0049C272    je          0049C8E3
 0049C278    sub         eax,2
>0049C27B    je          0049C9ED
 0049C281    sub         eax,0E
>0049C284    je          0049C8A2
 0049C28A    dec         eax
>0049C28B    je          0049C924
 0049C291    dec         eax
>0049C292    je          0049C962
>0049C298    jmp         0049E0A6
 0049C29D    sub         eax,30
>0049C2A0    je          0049C9A0
 0049C2A6    dec         eax
>0049C2A7    je          0049C9BF
 0049C2AD    sub         eax,0CF
>0049C2B2    je          0049CA29
>0049C2B8    jmp         0049E0A6
 0049C2BD    cmp         eax,1420
>0049C2C2    jg          0049C2F9
>0049C2C4    je          0049CAE2
 0049C2CA    sub         eax,1200
>0049C2CF    je          0049E0CA
 0049C2D5    sub         eax,100
>0049C2DA    je          0049CB68
 0049C2E0    sub         eax,100
>0049C2E5    je          0049CA48
 0049C2EB    sub         eax,10
>0049C2EE    je          0049CAA4
>0049C2F4    jmp         0049E0A6
 0049C2F9    sub         eax,1430
>0049C2FE    je          0049CB01
 0049C304    sub         eax,10
>0049C307    je          0049CA86
 0049C30D    sub         eax,10
>0049C310    je          0049CA67
>0049C316    jmp         0049E0A6
 0049C31B    cmp         eax,3030
>0049C320    jg          0049C388
>0049C322    je          0049CC66
 0049C328    cmp         eax,2302
>0049C32D    jg          0049C366
>0049C32F    je          0049CBC9
 0049C335    sub         eax,1500
>0049C33A    je          0049CB20
 0049C340    sub         eax,0C00
>0049C345    je          0049E0CA
 0049C34B    sub         eax,100
>0049C350    je          0049CB87
 0049C356    sub         eax,100
>0049C35B    je          0049CC17
>0049C361    jmp         0049E0A6
 0049C366    sub         eax,3000
>0049C36B    je          0049E0CA
 0049C371    sub         eax,10
>0049C374    je          0049CC66
 0049C37A    sub         eax,10
>0049C37D    je          0049CC66
>0049C383    jmp         0049E0A6
 0049C388    cmp         eax,3080
>0049C38D    jg          0049C3C0
>0049C38F    je          0049CD1A
 0049C395    sub         eax,3040
>0049C39A    je          0049CC66
 0049C3A0    sub         eax,10
>0049C3A3    je          0049CC66
 0049C3A9    sub         eax,10
>0049C3AC    je          0049CC66
 0049C3B2    sub         eax,10
>0049C3B5    je          0049CCB3
>0049C3BB    jmp         0049E0A6
 0049C3C0    sub         eax,3D3D
>0049C3C5    je          0049E0CA
 0049C3CB    dec         eax
>0049C3CC    je          0049CA0B
 0049C3D2    sub         eax,6C
>0049C3D5    je          0049E0CA
>0049C3DB    jmp         0049E0A6
 0049C3E0    cmp         eax,4654
>0049C3E5    jg          0049C4AE
>0049C3EB    je          0049D354
 0049C3F1    cmp         eax,4165
>0049C3F6    jg          0049C456
>0049C3F8    je          0049D252
 0049C3FE    cmp         eax,4130
>0049C403    jg          0049C434
>0049C405    je          0049D108
 0049C40B    sub         eax,4100
>0049C410    je          0049E0CA
 0049C416    sub         eax,10
>0049C419    je          0049D041
 0049C41F    dec         eax
>0049C420    je          0049D088
 0049C426    sub         eax,0F
>0049C429    je          0049D0C7
>0049C42F    jmp         0049E0A6
 0049C434    sub         eax,4140
>0049C439    je          0049D1E9
 0049C43F    sub         eax,10
>0049C442    je          0049D1A8
 0049C448    sub         eax,10
>0049C44B    je          0049D22A
>0049C451    jmp         0049E0A6
 0049C456    cmp         eax,4600
>0049C45B    jg          0049C48C
>0049C45D    je          0049D31B
 0049C463    sub         eax,4170
>0049C468    je          0049D270
 0049C46E    sub         eax,11
>0049C471    je          0049D30C
 0049C477    dec         eax
>0049C478    je          0049CDB2
 0049C47E    sub         eax,0E
>0049C481    je          0049D17A
>0049C487    jmp         0049E0A6
 0049C48C    sub         eax,4610
>0049C491    je          0049D3C0
 0049C497    sub         eax,31
>0049C49A    je          0049D41B
 0049C4A0    sub         eax,12
>0049C4A3    je          0049D49A
>0049C4A9    jmp         0049E0A6
 0049C4AE    cmp         eax,4D4D
>0049C4B3    jg          0049C511
>0049C4B5    je          0049E0CA
 0049C4BB    cmp         eax,465A
>0049C4C0    jg          0049C4ED
>0049C4C2    je          0049D382
 0049C4C8    sub         eax,4656
>0049C4CD    je          0049D45C
 0049C4D3    dec         eax
>0049C4D4    je          0049D47B
 0049C4DA    dec         eax
>0049C4DB    je          0049D4A9
 0049C4E1    dec         eax
>0049C4E2    je          0049D363
>0049C4E8    jmp         0049E0A6
 0049C4ED    sub         eax,465B
>0049C4F2    je          0049D3A1
 0049C4F8    sub         eax,0A5
>0049C4FD    je          0049D4C8
 0049C503    sub         eax,20
>0049C506    je          0049D54B
>0049C50C    jmp         0049E0A6
 0049C511    cmp         eax,8001
>0049C516    jg          0049C54E
>0049C518    je          0049D6F9
 0049C51E    sub         eax,7001
>0049C523    je          0049D57E
 0049C529    add         eax,0FFFFFFF0
 0049C52C    sub         eax,2
>0049C52F    jb          0049D630
 0049C535    sub         eax,0D
>0049C538    je          0049D5E1
 0049C53E    sub         eax,0FE0
>0049C543    je          0049E0CA
>0049C549    jmp         0049E0A6
 0049C54E    sub         eax,8002
>0049C553    je          0049D728
 0049C559    dec         eax
>0049C55A    je          0049D737
 0049C560    sub         eax,6
>0049C563    je          0049E0CA
>0049C569    jmp         0049E0A6
 0049C56E    cmp         eax,0A348
>0049C573    jg          0049C70F
>0049C579    je          0049E0CA
 0049C57F    cmp         eax,0A310
>0049C584    jg          0049C65E
>0049C58A    je          0049CD69
 0049C590    cmp         eax,0A087
>0049C595    jg          0049C600
>0049C597    je          0049CDE5
 0049C59D    cmp         eax,0A040
>0049C5A2    jge         0049C5CF
 0049C5A4    sub         eax,0A000
>0049C5A9    je          0049CD29
 0049C5AF    sub         eax,10
>0049C5B2    je          0049E0CA
 0049C5B8    sub         eax,10
>0049C5BB    je          0049E0CA
 0049C5C1    sub         eax,10
>0049C5C4    je          0049E0CA
>0049C5CA    jmp         0049E0A6
 0049C5CF    add         eax,0FFFF5FC0
 0049C5D4    sub         eax,3
>0049C5D7    jb          0049E0CA
 0049C5DD    sub         eax,0D
>0049C5E0    je          0049E0CA
 0049C5E6    add         eax,0FFFFFFFE
 0049C5E9    sub         eax,2
>0049C5EC    jb          0049E0CA
 0049C5F2    sub         eax,30
>0049C5F5    je          0049E0CA
>0049C5FB    jmp         0049E0A6
 0049C600    cmp         eax,0A220
>0049C605    jg          0049C63A
>0049C607    je          0049E0CA
 0049C60D    sub         eax,0A100
>0049C612    je          0049CD38
 0049C618    sub         eax,100
>0049C61D    je          0049E0CA
 0049C623    sub         eax,4
>0049C626    je          0049E0CA
 0049C62C    sub         eax,0C
>0049C62F    je          0049E0CA
>0049C635    jmp         0049E0A6
 0049C63A    sub         eax,0A230
>0049C63F    je          0049E0CA
 0049C645    sub         eax,22
>0049C648    je          0049D013
 0049C64E    sub         eax,0AE
>0049C653    je          0049C9DE
>0049C659    jmp         0049E0A6
 0049C65E    add         eax,0FFFF5CE0
 0049C663    cmp         eax,26
>0049C666    ja          0049E0A6
 0049C66C    jmp         dword ptr [eax*4+49C673]
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049CDB2
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049E0CA
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049E0CA
 0049C66C    dd          0049E0CA
 0049C66C    dd          0049E0CA
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049E0CA
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049E0CA
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049E0CA
 0049C66C    dd          0049E0A6
 0049C66C    dd          0049E0CA
 0049C70F    cmp         eax,0B00A
>0049C714    jg          0049C7DE
>0049C71A    je          0049D746
 0049C720    cmp         eax,0A35C
>0049C725    jg          0049C786
>0049C727    je          0049CEBE
 0049C72D    add         eax,0FFFF5CB6
 0049C732    cmp         eax,10
>0049C735    ja          0049E0A6
 0049C73B    jmp         dword ptr [eax*4+49C742]
 0049C73B    dd          0049E0CA
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049E0CA
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049CE04
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049CE23
 0049C73B    dd          0049CE42
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049CE61
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049CE80
 0049C73B    dd          0049E0A6
 0049C73B    dd          0049CE9F
 0049C786    cmp         eax,0A368
>0049C78B    jg          0049C7BE
>0049C78D    je          0049CFD5
 0049C793    sub         eax,0A360
>0049C798    je          0049CEDD
 0049C79E    sub         eax,2
>0049C7A1    je          0049CF1B
 0049C7A7    sub         eax,2
>0049C7AA    je          0049CF59
 0049C7B0    sub         eax,2
>0049C7B3    je          0049CF97
>0049C7B9    jmp         0049E0A6
 0049C7BE    add         eax,0FFFF5001
 0049C7C3    sub         eax,9
>0049C7C6    jb          0049E0CA
>0049C7CC    je          0049D78C
 0049C7D2    dec         eax
>0049C7D3    je          0049D7BD
>0049C7D9    jmp         0049E0A6
 0049C7DE    cmp         eax,0B023
>0049C7E3    jg          0049C84C
>0049C7E5    je          0049DD67
 0049C7EB    add         eax,0FFFF4FF0
 0049C7F0    cmp         eax,12
>0049C7F3    ja          0049E0A6
 0049C7F9    jmp         dword ptr [eax*4+49C800]
 0049C7F9    dd          0049D7FA
 0049C7F9    dd          0049D895
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049D85C
 0049C7F9    dd          0049D8C3
 0049C7F9    dd          0049D8A4
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049E0A6
 0049C7F9    dd          0049D92A
 0049C7F9    dd          0049DADA
 0049C7F9    dd          0049DBD3
 0049C84C    cmp         eax,0B028
>0049C851    jg          0049C87E
>0049C853    je          0049DF74
 0049C859    sub         eax,0B024
>0049C85E    je          0049DE16
 0049C864    dec         eax
>0049C865    je          0049D9FB
 0049C86B    dec         eax
>0049C86C    je          0049DCB2
 0049C872    dec         eax
>0049C873    je          0049DEC5
>0049C879    jmp         0049E0A6
 0049C87E    sub         eax,0B029
>0049C883    je          0049E023
 0049C889    sub         eax,7
>0049C88C    je          0049D7DB
 0049C892    sub         eax,120D
>0049C897    je          0049E0CA
>0049C89D    jmp         0049E0A6
 0049C8A2    mov         eax,0C
 0049C8A7    call        AllocMem
 0049C8AC    mov         dword ptr [esi+0C],eax
 0049C8AF    mov         eax,dword ptr [esi+0C]
 0049C8B2    mov         dword ptr [ebp-4],eax
 0049C8B5    mov         eax,ebx
 0049C8B7    call        0049BFE4
 0049C8BC    mov         eax,dword ptr [ebp-4]
 0049C8BF    fstp        dword ptr [eax]
 0049C8C1    wait
 0049C8C2    mov         eax,ebx
 0049C8C4    call        0049BFE4
 0049C8C9    mov         eax,dword ptr [ebp-4]
 0049C8CC    fstp        dword ptr [eax+4]
 0049C8CF    wait
 0049C8D0    mov         eax,ebx
 0049C8D2    call        0049BFE4
 0049C8D7    mov         eax,dword ptr [ebp-4]
 0049C8DA    fstp        dword ptr [eax+8]
 0049C8DD    wait
>0049C8DE    jmp         0049E0CA
 0049C8E3    mov         eax,0C
 0049C8E8    call        AllocMem
 0049C8ED    mov         dword ptr [esi+0C],eax
 0049C8F0    mov         eax,dword ptr [esi+0C]
 0049C8F3    mov         dword ptr [ebp-8],eax
 0049C8F6    mov         eax,ebx
 0049C8F8    call        0049BFE4
 0049C8FD    mov         eax,dword ptr [ebp-8]
 0049C900    fstp        dword ptr [eax]
 0049C902    wait
 0049C903    mov         eax,ebx
 0049C905    call        0049BFE4
 0049C90A    mov         eax,dword ptr [ebp-8]
 0049C90D    fstp        dword ptr [eax+4]
 0049C910    wait
 0049C911    mov         eax,ebx
 0049C913    call        0049BFE4
 0049C918    mov         eax,dword ptr [ebp-8]
 0049C91B    fstp        dword ptr [eax+8]
 0049C91E    wait
>0049C91F    jmp         0049E0CA
 0049C924    mov         eax,3
 0049C929    call        AllocMem
 0049C92E    mov         dword ptr [esi+0C],eax
 0049C931    mov         eax,dword ptr [esi+0C]
 0049C934    mov         dword ptr [ebp-0C],eax
 0049C937    mov         eax,ebx
 0049C939    call        0049BF84
 0049C93E    mov         edx,dword ptr [ebp-0C]
 0049C941    mov         byte ptr [edx],al
 0049C943    mov         eax,ebx
 0049C945    call        0049BF84
 0049C94A    mov         edx,dword ptr [ebp-0C]
 0049C94D    mov         byte ptr [edx+1],al
 0049C950    mov         eax,ebx
 0049C952    call        0049BF84
 0049C957    mov         edx,dword ptr [ebp-0C]
 0049C95A    mov         byte ptr [edx+2],al
>0049C95D    jmp         0049E0CA
 0049C962    mov         eax,3
 0049C967    call        AllocMem
 0049C96C    mov         dword ptr [esi+0C],eax
 0049C96F    mov         eax,dword ptr [esi+0C]
 0049C972    mov         dword ptr [ebp-10],eax
 0049C975    mov         eax,ebx
 0049C977    call        0049BF84
 0049C97C    mov         edx,dword ptr [ebp-10]
 0049C97F    mov         byte ptr [edx],al
 0049C981    mov         eax,ebx
 0049C983    call        0049BF84
 0049C988    mov         edx,dword ptr [ebp-10]
 0049C98B    mov         byte ptr [edx+1],al
 0049C98E    mov         eax,ebx
 0049C990    call        0049BF84
 0049C995    mov         edx,dword ptr [ebp-10]
 0049C998    mov         byte ptr [edx+2],al
>0049C99B    jmp         0049E0CA
 0049C9A0    mov         eax,2
 0049C9A5    call        AllocMem
 0049C9AA    mov         dword ptr [esi+0C],eax
 0049C9AD    mov         eax,ebx
 0049C9AF    call        0049BF9C
 0049C9B4    mov         edx,dword ptr [esi+0C]
 0049C9B7    mov         word ptr [edx],ax
>0049C9BA    jmp         0049E0CA
 0049C9BF    mov         eax,4
 0049C9C4    call        AllocMem
 0049C9C9    mov         dword ptr [esi+0C],eax
 0049C9CC    mov         eax,ebx
 0049C9CE    call        0049BFE4
 0049C9D3    mov         eax,dword ptr [esi+0C]
 0049C9D6    fstp        dword ptr [eax]
 0049C9D8    wait
>0049C9D9    jmp         0049E0CA
 0049C9DE    mov         eax,ebx
 0049C9E0    call        0049C020
 0049C9E5    mov         dword ptr [esi+0C],eax
>0049C9E8    jmp         0049E0CA
 0049C9ED    mov         eax,4
 0049C9F2    call        AllocMem
 0049C9F7    mov         dword ptr [esi+0C],eax
 0049C9FA    mov         eax,ebx
 0049C9FC    call        0049BFCC
 0049CA01    mov         edx,dword ptr [esi+0C]
 0049CA04    mov         dword ptr [edx],eax
>0049CA06    jmp         0049E0CA
 0049CA0B    mov         eax,4
 0049CA10    call        AllocMem
 0049CA15    mov         dword ptr [esi+0C],eax
 0049CA18    mov         eax,ebx
 0049CA1A    call        0049BFCC
 0049CA1F    mov         edx,dword ptr [esi+0C]
 0049CA22    mov         dword ptr [edx],eax
>0049CA24    jmp         0049E0CA
 0049CA29    mov         eax,4
 0049CA2E    call        AllocMem
 0049CA33    mov         dword ptr [esi+0C],eax
 0049CA36    mov         eax,ebx
 0049CA38    call        0049BFE4
 0049CA3D    mov         eax,dword ptr [esi+0C]
 0049CA40    fstp        dword ptr [eax]
 0049CA42    wait
>0049CA43    jmp         0049E0CA
 0049CA48    mov         eax,4
 0049CA4D    call        AllocMem
 0049CA52    mov         dword ptr [esi+0C],eax
 0049CA55    mov         eax,ebx
 0049CA57    call        0049BFE4
 0049CA5C    mov         eax,dword ptr [esi+0C]
 0049CA5F    fstp        dword ptr [eax]
 0049CA61    wait
>0049CA62    jmp         0049E0CA
 0049CA67    mov         eax,4
 0049CA6C    call        AllocMem
 0049CA71    mov         dword ptr [esi+0C],eax
 0049CA74    mov         eax,ebx
 0049CA76    call        0049BFE4
 0049CA7B    mov         eax,dword ptr [esi+0C]
 0049CA7E    fstp        dword ptr [eax]
 0049CA80    wait
>0049CA81    jmp         0049E0CA
 0049CA86    mov         eax,4
 0049CA8B    call        AllocMem
 0049CA90    mov         dword ptr [esi+0C],eax
 0049CA93    mov         eax,ebx
 0049CA95    call        0049BFCC
 0049CA9A    mov         edx,dword ptr [esi+0C]
 0049CA9D    mov         dword ptr [edx],eax
>0049CA9F    jmp         0049E0CA
 0049CAA4    mov         eax,4
 0049CAA9    call        AllocMem
 0049CAAE    mov         dword ptr [esi+0C],eax
 0049CAB1    mov         eax,ebx
 0049CAB3    call        0049BFE4
 0049CAB8    mov         eax,dword ptr [esi+0C]
 0049CABB    fstp        dword ptr [eax]
 0049CABD    wait
>0049CABE    jmp         0049E0CA
 0049CAC3    mov         eax,4
 0049CAC8    call        AllocMem
 0049CACD    mov         dword ptr [esi+0C],eax
 0049CAD0    mov         eax,ebx
 0049CAD2    call        0049BFE4
 0049CAD7    mov         eax,dword ptr [esi+0C]
 0049CADA    fstp        dword ptr [eax]
 0049CADC    wait
>0049CADD    jmp         0049E0CA
 0049CAE2    mov         eax,2
 0049CAE7    call        AllocMem
 0049CAEC    mov         dword ptr [esi+0C],eax
 0049CAEF    mov         eax,ebx
 0049CAF1    call        0049BF9C
 0049CAF6    mov         edx,dword ptr [esi+0C]
 0049CAF9    mov         word ptr [edx],ax
>0049CAFC    jmp         0049E0CA
 0049CB01    mov         eax,2
 0049CB06    call        AllocMem
 0049CB0B    mov         dword ptr [esi+0C],eax
 0049CB0E    mov         eax,ebx
 0049CB10    call        0049BF9C
 0049CB15    mov         edx,dword ptr [esi+0C]
 0049CB18    mov         word ptr [edx],ax
>0049CB1B    jmp         0049E0CA
 0049CB20    mov         eax,0C
 0049CB25    call        AllocMem
 0049CB2A    mov         dword ptr [esi+0C],eax
 0049CB2D    lea         edx,[ebp-88]
 0049CB33    mov         eax,ebx
 0049CB35    call        0049C0DC
 0049CB3A    mov         eax,dword ptr [esi+0C]
 0049CB3D    mov         edx,dword ptr [ebp-88]
 0049CB43    mov         dword ptr [eax],edx
 0049CB45    mov         edx,dword ptr [ebp-84]
 0049CB4B    mov         dword ptr [eax+4],edx
 0049CB4E    mov         edx,dword ptr [ebp-80]
 0049CB51    mov         dword ptr [eax+8],edx
>0049CB54    jmp         0049E0CA
 0049CB59    mov         eax,ebx
 0049CB5B    call        0049C020
 0049CB60    mov         dword ptr [esi+0C],eax
>0049CB63    jmp         0049E0CA
 0049CB68    mov         eax,4
 0049CB6D    call        AllocMem
 0049CB72    mov         dword ptr [esi+0C],eax
 0049CB75    mov         eax,ebx
 0049CB77    call        0049BFE4
 0049CB7C    mov         eax,dword ptr [esi+0C]
 0049CB7F    fstp        dword ptr [eax]
 0049CB81    wait
>0049CB82    jmp         0049E0CA
 0049CB87    mov         eax,10
 0049CB8C    call        AllocMem
 0049CB91    mov         dword ptr [esi+0C],eax
 0049CB94    mov         eax,dword ptr [esi+0C]
 0049CB97    mov         esi,eax
 0049CB99    mov         eax,ebx
 0049CB9B    call        0049BFE4
 0049CBA0    fstp        dword ptr [esi]
 0049CBA2    wait
 0049CBA3    mov         eax,ebx
 0049CBA5    call        0049BFE4
 0049CBAA    fstp        dword ptr [esi+4]
 0049CBAD    wait
 0049CBAE    mov         eax,ebx
 0049CBB0    call        0049BFE4
 0049CBB5    fstp        dword ptr [esi+8]
 0049CBB8    wait
 0049CBB9    mov         eax,ebx
 0049CBBB    call        0049BFE4
 0049CBC0    fstp        dword ptr [esi+0C]
 0049CBC3    wait
>0049CBC4    jmp         0049E0CA
 0049CBC9    mov         eax,10
 0049CBCE    call        AllocMem
 0049CBD3    mov         dword ptr [esi+0C],eax
 0049CBD6    mov         eax,dword ptr [esi+0C]
 0049CBD9    mov         dword ptr [ebp-14],eax
 0049CBDC    mov         eax,ebx
 0049CBDE    call        0049BFE4
 0049CBE3    mov         eax,dword ptr [ebp-14]
 0049CBE6    fstp        dword ptr [eax]
 0049CBE8    wait
 0049CBE9    mov         eax,ebx
 0049CBEB    call        0049BFE4
 0049CBF0    mov         eax,dword ptr [ebp-14]
 0049CBF3    fstp        dword ptr [eax+4]
 0049CBF6    wait
 0049CBF7    mov         eax,ebx
 0049CBF9    call        0049BFE4
 0049CBFE    mov         eax,dword ptr [ebp-14]
 0049CC01    fstp        dword ptr [eax+8]
 0049CC04    wait
 0049CC05    mov         eax,ebx
 0049CC07    call        0049BFB4
 0049CC0C    mov         edx,dword ptr [ebp-14]
 0049CC0F    mov         dword ptr [edx+0C],eax
>0049CC12    jmp         0049E0CA
 0049CC17    mov         eax,10
 0049CC1C    call        AllocMem
 0049CC21    mov         dword ptr [esi+0C],eax
 0049CC24    mov         eax,dword ptr [esi+0C]
 0049CC27    mov         dword ptr [ebp-18],eax
 0049CC2A    mov         eax,ebx
 0049CC2C    call        0049BFE4
 0049CC31    mov         eax,dword ptr [ebp-18]
 0049CC34    fstp        dword ptr [eax]
 0049CC36    wait
 0049CC37    mov         eax,ebx
 0049CC39    call        0049BFE4
 0049CC3E    mov         eax,dword ptr [ebp-18]
 0049CC41    fstp        dword ptr [eax+4]
 0049CC44    wait
 0049CC45    mov         eax,ebx
 0049CC47    call        0049BFE4
 0049CC4C    mov         eax,dword ptr [ebp-18]
 0049CC4F    fstp        dword ptr [eax+8]
 0049CC52    wait
 0049CC53    mov         eax,ebx
 0049CC55    call        0049BFE4
 0049CC5A    mov         eax,dword ptr [ebp-18]
 0049CC5D    fstp        dword ptr [eax+0C]
 0049CC60    wait
>0049CC61    jmp         0049E0CA
 0049CC66    mov         eax,10
 0049CC6B    call        AllocMem
 0049CC70    mov         dword ptr [esi+0C],eax
 0049CC73    mov         eax,dword ptr [esi+0C]
 0049CC76    mov         dword ptr [ebp-1C],eax
 0049CC79    mov         eax,ebx
 0049CC7B    call        0049BFE4
 0049CC80    mov         eax,dword ptr [ebp-1C]
 0049CC83    fstp        dword ptr [eax+0C]
 0049CC86    wait
 0049CC87    lea         edx,[ebp-88]
 0049CC8D    mov         eax,ebx
 0049CC8F    call        0049C0DC
 0049CC94    mov         eax,dword ptr [ebp-1C]
 0049CC97    mov         edx,dword ptr [ebp-88]
 0049CC9D    mov         dword ptr [eax],edx
 0049CC9F    mov         edx,dword ptr [ebp-84]
 0049CCA5    mov         dword ptr [eax+4],edx
 0049CCA8    mov         edx,dword ptr [ebp-80]
 0049CCAB    mov         dword ptr [eax+8],edx
>0049CCAE    jmp         0049E0CA
 0049CCB3    mov         eax,1C
 0049CCB8    call        AllocMem
 0049CCBD    mov         dword ptr [esi+0C],eax
 0049CCC0    mov         eax,dword ptr [esi+0C]
 0049CCC3    mov         esi,eax
 0049CCC5    mov         eax,ebx
 0049CCC7    call        0049BFE4
 0049CCCC    fstp        dword ptr [esi+0C]
 0049CCCF    wait
 0049CCD0    mov         eax,ebx
 0049CCD2    call        0049BFE4
 0049CCD7    fstp        dword ptr [esi+10]
 0049CCDA    wait
 0049CCDB    mov         eax,ebx
 0049CCDD    call        0049BFE4
 0049CCE2    fstp        dword ptr [esi+14]
 0049CCE5    wait
 0049CCE6    mov         eax,ebx
 0049CCE8    call        0049BFE4
 0049CCED    fstp        dword ptr [esi+18]
 0049CCF0    wait
 0049CCF1    lea         edx,[ebp-88]
 0049CCF7    mov         eax,ebx
 0049CCF9    call        0049C0DC
 0049CCFE    mov         eax,dword ptr [ebp-88]
 0049CD04    mov         dword ptr [esi],eax
 0049CD06    mov         eax,dword ptr [ebp-84]
 0049CD0C    mov         dword ptr [esi+4],eax
 0049CD0F    mov         eax,dword ptr [ebp-80]
 0049CD12    mov         dword ptr [esi+8],eax
>0049CD15    jmp         0049E0CA
 0049CD1A    mov         eax,ebx
 0049CD1C    call        0049C020
 0049CD21    mov         dword ptr [esi+0C],eax
>0049CD24    jmp         0049E0CA
 0049CD29    mov         eax,ebx
 0049CD2B    call        0049C020
 0049CD30    mov         dword ptr [esi+0C],eax
>0049CD33    jmp         0049E0CA
 0049CD38    mov         eax,2
 0049CD3D    call        AllocMem
 0049CD42    mov         dword ptr [esi+0C],eax
 0049CD45    mov         eax,dword ptr [esi+8]
 0049CD48    add         eax,6
 0049CD4B    xor         edx,edx
 0049CD4D    push        edx
 0049CD4E    push        eax
 0049CD4F    mov         eax,dword ptr [ebx+1C]
 0049CD52    call        TStream.SetPosition
 0049CD57    mov         eax,ebx
 0049CD59    call        0049BF9C
 0049CD5E    mov         edx,dword ptr [esi+0C]
 0049CD61    mov         word ptr [edx],ax
>0049CD64    jmp         0049E0CA
 0049CD69    mov         eax,0C
 0049CD6E    call        AllocMem
 0049CD73    mov         dword ptr [esi+0C],eax
 0049CD76    mov         eax,dword ptr [esi+0C]
 0049CD79    mov         esi,eax
 0049CD7B    mov         eax,ebx
 0049CD7D    call        0049BF84
 0049CD82    mov         byte ptr [esi],al
 0049CD84    mov         eax,ebx
 0049CD86    call        0049BF84
 0049CD8B    mov         byte ptr [esi+1],al
 0049CD8E    mov         eax,ebx
 0049CD90    call        0049BF9C
 0049CD95    mov         word ptr [esi+2],ax
 0049CD99    mov         eax,ebx
 0049CD9B    call        0049BFB4
 0049CDA0    mov         dword ptr [esi+4],eax
 0049CDA3    mov         eax,ebx
 0049CDA5    call        0049BFB4
 0049CDAA    mov         dword ptr [esi+8],eax
>0049CDAD    jmp         0049E0CA
 0049CDB2    mov         eax,8
 0049CDB7    call        AllocMem
 0049CDBC    mov         dword ptr [esi+0C],eax
 0049CDBF    mov         edi,dword ptr [esi+0C]
 0049CDC2    mov         eax,dword ptr [esi+4]
 0049CDC5    sub         eax,6
 0049CDC8    mov         dword ptr [edi],eax
 0049CDCA    mov         eax,dword ptr [edi]
 0049CDCC    call        AllocMem
 0049CDD1    mov         dword ptr [edi+4],eax
 0049CDD4    mov         ecx,dword ptr [edi+4]
 0049CDD7    mov         edx,dword ptr [edi]
 0049CDD9    mov         eax,ebx
 0049CDDB    call        0049C014
>0049CDE0    jmp         0049E0CA
 0049CDE5    mov         eax,4
 0049CDEA    call        AllocMem
 0049CDEF    mov         dword ptr [esi+0C],eax
 0049CDF2    mov         eax,ebx
 0049CDF4    call        0049BFE4
 0049CDF9    mov         eax,dword ptr [esi+0C]
 0049CDFC    fstp        dword ptr [eax]
 0049CDFE    wait
>0049CDFF    jmp         0049E0CA
 0049CE04    mov         eax,2
 0049CE09    call        AllocMem
 0049CE0E    mov         dword ptr [esi+0C],eax
 0049CE11    mov         eax,ebx
 0049CE13    call        0049BFFC
 0049CE18    mov         edx,dword ptr [esi+0C]
 0049CE1B    mov         word ptr [edx],ax
>0049CE1E    jmp         0049E0CA
 0049CE23    mov         eax,4
 0049CE28    call        AllocMem
 0049CE2D    mov         dword ptr [esi+0C],eax
 0049CE30    mov         eax,ebx
 0049CE32    call        0049BFE4
 0049CE37    mov         eax,dword ptr [esi+0C]
 0049CE3A    fstp        dword ptr [eax]
 0049CE3C    wait
>0049CE3D    jmp         0049E0CA
 0049CE42    mov         eax,4
 0049CE47    call        AllocMem
 0049CE4C    mov         dword ptr [esi+0C],eax
 0049CE4F    mov         eax,ebx
 0049CE51    call        0049BFE4
 0049CE56    mov         eax,dword ptr [esi+0C]
 0049CE59    fstp        dword ptr [eax]
 0049CE5B    wait
>0049CE5C    jmp         0049E0CA
 0049CE61    mov         eax,4
 0049CE66    call        AllocMem
 0049CE6B    mov         dword ptr [esi+0C],eax
 0049CE6E    mov         eax,ebx
 0049CE70    call        0049BFE4
 0049CE75    mov         eax,dword ptr [esi+0C]
 0049CE78    fstp        dword ptr [eax]
 0049CE7A    wait
>0049CE7B    jmp         0049E0CA
 0049CE80    mov         eax,4
 0049CE85    call        AllocMem
 0049CE8A    mov         dword ptr [esi+0C],eax
 0049CE8D    mov         eax,ebx
 0049CE8F    call        0049BFE4
 0049CE94    mov         eax,dword ptr [esi+0C]
 0049CE97    fstp        dword ptr [eax]
 0049CE99    wait
>0049CE9A    jmp         0049E0CA
 0049CE9F    mov         eax,4
 0049CEA4    call        AllocMem
 0049CEA9    mov         dword ptr [esi+0C],eax
 0049CEAC    mov         eax,ebx
 0049CEAE    call        0049BFE4
 0049CEB3    mov         eax,dword ptr [esi+0C]
 0049CEB6    fstp        dword ptr [eax]
 0049CEB8    wait
>0049CEB9    jmp         0049E0CA
 0049CEBE    mov         eax,4
 0049CEC3    call        AllocMem
 0049CEC8    mov         dword ptr [esi+0C],eax
 0049CECB    mov         eax,ebx
 0049CECD    call        0049BFE4
 0049CED2    mov         eax,dword ptr [esi+0C]
 0049CED5    fstp        dword ptr [eax]
 0049CED7    wait
>0049CED8    jmp         0049E0CA
 0049CEDD    mov         eax,3
 0049CEE2    call        AllocMem
 0049CEE7    mov         dword ptr [esi+0C],eax
 0049CEEA    mov         eax,dword ptr [esi+0C]
 0049CEED    mov         dword ptr [ebp-20],eax
 0049CEF0    mov         eax,ebx
 0049CEF2    call        0049BF84
 0049CEF7    mov         edx,dword ptr [ebp-20]
 0049CEFA    mov         byte ptr [edx],al
 0049CEFC    mov         eax,ebx
 0049CEFE    call        0049BF84
 0049CF03    mov         edx,dword ptr [ebp-20]
 0049CF06    mov         byte ptr [edx+1],al
 0049CF09    mov         eax,ebx
 0049CF0B    call        0049BF84
 0049CF10    mov         edx,dword ptr [ebp-20]
 0049CF13    mov         byte ptr [edx+2],al
>0049CF16    jmp         0049E0CA
 0049CF1B    mov         eax,3
 0049CF20    call        AllocMem
 0049CF25    mov         dword ptr [esi+0C],eax
 0049CF28    mov         eax,dword ptr [esi+0C]
 0049CF2B    mov         dword ptr [ebp-24],eax
 0049CF2E    mov         eax,ebx
 0049CF30    call        0049BF84
 0049CF35    mov         edx,dword ptr [ebp-24]
 0049CF38    mov         byte ptr [edx],al
 0049CF3A    mov         eax,ebx
 0049CF3C    call        0049BF84
 0049CF41    mov         edx,dword ptr [ebp-24]
 0049CF44    mov         byte ptr [edx+1],al
 0049CF47    mov         eax,ebx
 0049CF49    call        0049BF84
 0049CF4E    mov         edx,dword ptr [ebp-24]
 0049CF51    mov         byte ptr [edx+2],al
>0049CF54    jmp         0049E0CA
 0049CF59    mov         eax,3
 0049CF5E    call        AllocMem
 0049CF63    mov         dword ptr [esi+0C],eax
 0049CF66    mov         eax,dword ptr [esi+0C]
 0049CF69    mov         dword ptr [ebp-28],eax
 0049CF6C    mov         eax,ebx
 0049CF6E    call        0049BF84
 0049CF73    mov         edx,dword ptr [ebp-28]
 0049CF76    mov         byte ptr [edx],al
 0049CF78    mov         eax,ebx
 0049CF7A    call        0049BF84
 0049CF7F    mov         edx,dword ptr [ebp-28]
 0049CF82    mov         byte ptr [edx+1],al
 0049CF85    mov         eax,ebx
 0049CF87    call        0049BF84
 0049CF8C    mov         edx,dword ptr [ebp-28]
 0049CF8F    mov         byte ptr [edx+2],al
>0049CF92    jmp         0049E0CA
 0049CF97    mov         eax,3
 0049CF9C    call        AllocMem
 0049CFA1    mov         dword ptr [esi+0C],eax
 0049CFA4    mov         eax,dword ptr [esi+0C]
 0049CFA7    mov         dword ptr [ebp-2C],eax
 0049CFAA    mov         eax,ebx
 0049CFAC    call        0049BF84
 0049CFB1    mov         edx,dword ptr [ebp-2C]
 0049CFB4    mov         byte ptr [edx],al
 0049CFB6    mov         eax,ebx
 0049CFB8    call        0049BF84
 0049CFBD    mov         edx,dword ptr [ebp-2C]
 0049CFC0    mov         byte ptr [edx+1],al
 0049CFC3    mov         eax,ebx
 0049CFC5    call        0049BF84
 0049CFCA    mov         edx,dword ptr [ebp-2C]
 0049CFCD    mov         byte ptr [edx+2],al
>0049CFD0    jmp         0049E0CA
 0049CFD5    mov         eax,3
 0049CFDA    call        AllocMem
 0049CFDF    mov         dword ptr [esi+0C],eax
 0049CFE2    mov         eax,dword ptr [esi+0C]
 0049CFE5    mov         dword ptr [ebp-30],eax
 0049CFE8    mov         eax,ebx
 0049CFEA    call        0049BF84
 0049CFEF    mov         edx,dword ptr [ebp-30]
 0049CFF2    mov         byte ptr [edx],al
 0049CFF4    mov         eax,ebx
 0049CFF6    call        0049BF84
 0049CFFB    mov         edx,dword ptr [ebp-30]
 0049CFFE    mov         byte ptr [edx+1],al
 0049D001    mov         eax,ebx
 0049D003    call        0049BF84
 0049D008    mov         edx,dword ptr [ebp-30]
 0049D00B    mov         byte ptr [edx+2],al
>0049D00E    jmp         0049E0CA
 0049D013    mov         eax,2
 0049D018    call        AllocMem
 0049D01D    mov         dword ptr [esi+0C],eax
 0049D020    mov         eax,ebx
 0049D022    call        0049BF9C
 0049D027    mov         edx,dword ptr [esi+0C]
 0049D02A    mov         word ptr [edx],ax
>0049D02D    jmp         0049E0CA
 0049D032    mov         eax,ebx
 0049D034    call        0049C020
 0049D039    mov         dword ptr [esi+0C],eax
>0049D03C    jmp         0049E0CA
 0049D041    mov         eax,8
 0049D046    call        AllocMem
 0049D04B    mov         dword ptr [esi+0C],eax
 0049D04E    mov         eax,dword ptr [esi+0C]
 0049D051    mov         esi,eax
 0049D053    mov         eax,ebx
 0049D055    call        0049BFFC
 0049D05A    mov         word ptr [esi],ax
 0049D05D    movzx       eax,word ptr [esi]
 0049D060    shl         eax,2
 0049D063    lea         eax,[eax+eax*2]
 0049D066    call        AllocMem
 0049D06B    mov         dword ptr [esi+4],eax
 0049D06E    mov         ecx,dword ptr [esi+4]
 0049D071    movzx       eax,word ptr [esi]
 0049D074    mov         edx,eax
 0049D076    shl         edx,2
 0049D079    lea         edx,[edx+edx*2]
 0049D07C    mov         eax,ebx
 0049D07E    call        0049C014
>0049D083    jmp         0049E0CA
 0049D088    mov         eax,8
 0049D08D    call        AllocMem
 0049D092    mov         dword ptr [esi+0C],eax
 0049D095    mov         eax,dword ptr [esi+0C]
 0049D098    mov         esi,eax
 0049D09A    mov         eax,ebx
 0049D09C    call        0049BFFC
 0049D0A1    mov         word ptr [esi],ax
 0049D0A4    movzx       eax,word ptr [esi]
 0049D0A7    add         eax,eax
 0049D0A9    call        AllocMem
 0049D0AE    mov         dword ptr [esi+4],eax
 0049D0B1    mov         ecx,dword ptr [esi+4]
 0049D0B4    movzx       eax,word ptr [esi]
 0049D0B7    mov         edx,eax
 0049D0B9    add         edx,edx
 0049D0BB    mov         eax,ebx
 0049D0BD    call        0049C014
>0049D0C2    jmp         0049E0CA
 0049D0C7    mov         eax,8
 0049D0CC    call        AllocMem
 0049D0D1    mov         dword ptr [esi+0C],eax
 0049D0D4    mov         eax,dword ptr [esi+0C]
 0049D0D7    mov         esi,eax
 0049D0D9    mov         eax,ebx
 0049D0DB    call        0049BFFC
 0049D0E0    mov         word ptr [esi],ax
 0049D0E3    movzx       eax,word ptr [esi]
 0049D0E6    shl         eax,3
 0049D0E9    call        AllocMem
 0049D0EE    mov         dword ptr [esi+4],eax
 0049D0F1    mov         ecx,dword ptr [esi+4]
 0049D0F4    movzx       eax,word ptr [esi]
 0049D0F7    mov         edx,eax
 0049D0F9    shl         edx,3
 0049D0FC    mov         eax,ebx
 0049D0FE    call        0049C014
>0049D103    jmp         0049E0CA
 0049D108    mov         eax,0C
 0049D10D    call        AllocMem
 0049D112    mov         dword ptr [esi+0C],eax
 0049D115    mov         eax,dword ptr [esi+0C]
 0049D118    mov         esi,eax
 0049D11A    mov         eax,ebx
 0049D11C    call        0049C020
 0049D121    lea         edx,[ebp-8C]
 0049D127    call        0049A3F0
 0049D12C    mov         edx,dword ptr [ebp-8C]
 0049D132    mov         eax,esi
 0049D134    call        @LStrAsg
 0049D139    mov         eax,ebx
 0049D13B    call        0049BFFC
 0049D140    mov         word ptr [esi+4],ax
 0049D144    cmp         word ptr [esi+4],0
>0049D149    jbe         0049D170
 0049D14B    movzx       eax,word ptr [esi+4]
 0049D14F    add         eax,eax
 0049D151    call        AllocMem
 0049D156    mov         dword ptr [esi+8],eax
 0049D159    mov         ecx,dword ptr [esi+8]
 0049D15C    movzx       eax,word ptr [esi+4]
 0049D160    mov         edx,eax
 0049D162    add         edx,edx
 0049D164    mov         eax,ebx
 0049D166    call        0049C014
>0049D16B    jmp         0049E0CA
 0049D170    xor         eax,eax
 0049D172    mov         dword ptr [esi+8],eax
>0049D175    jmp         0049E0CA
 0049D17A    mov         eax,18
 0049D17F    call        AllocMem
 0049D184    mov         dword ptr [esi+0C],eax
 0049D187    xor         edi,edi
 0049D189    mov         eax,ebx
 0049D18B    call        0049C020
 0049D190    mov         edx,eax
 0049D192    mov         eax,dword ptr [esi+0C]
 0049D195    lea         eax,[eax+edi*4]
 0049D198    call        @LStrFromPChar
 0049D19D    inc         edi
 0049D19E    cmp         edi,6
>0049D1A1    jne         0049D189
>0049D1A3    jmp         0049E0CA
 0049D1A8    mov         eax,8
 0049D1AD    call        AllocMem
 0049D1B2    mov         dword ptr [esi+0C],eax
 0049D1B5    mov         edi,dword ptr [esi+0C]
 0049D1B8    mov         eax,dword ptr [esi+4]
 0049D1BB    sub         eax,6
 0049D1BE    shr         eax,2
 0049D1C1    mov         word ptr [edi],ax
 0049D1C4    movzx       eax,word ptr [edi]
 0049D1C7    shl         eax,2
 0049D1CA    call        AllocMem
 0049D1CF    mov         dword ptr [edi+4],eax
 0049D1D2    mov         ecx,dword ptr [edi+4]
 0049D1D5    movzx       eax,word ptr [edi]
 0049D1D8    mov         edx,eax
 0049D1DA    shl         edx,2
 0049D1DD    mov         eax,ebx
 0049D1DF    call        0049C014
>0049D1E4    jmp         0049E0CA
 0049D1E9    mov         eax,8
 0049D1EE    call        AllocMem
 0049D1F3    mov         dword ptr [esi+0C],eax
 0049D1F6    mov         eax,dword ptr [esi+0C]
 0049D1F9    mov         esi,eax
 0049D1FB    mov         eax,ebx
 0049D1FD    call        0049BFFC
 0049D202    mov         word ptr [esi],ax
 0049D205    movzx       eax,word ptr [esi]
 0049D208    shl         eax,3
 0049D20B    call        AllocMem
 0049D210    mov         dword ptr [esi+4],eax
 0049D213    mov         ecx,dword ptr [esi+4]
 0049D216    movzx       eax,word ptr [esi]
 0049D219    mov         edx,eax
 0049D21B    shl         edx,3
 0049D21E    mov         eax,ebx
 0049D220    call        0049C014
>0049D225    jmp         0049E0CA
 0049D22A    mov         eax,30
 0049D22F    call        AllocMem
 0049D234    mov         dword ptr [esi+0C],eax
 0049D237    xor         edi,edi
 0049D239    mov         eax,ebx
 0049D23B    call        0049BFE4
 0049D240    mov         eax,dword ptr [esi+0C]
 0049D243    fstp        dword ptr [eax+edi*4]
 0049D246    wait
 0049D247    inc         edi
 0049D248    cmp         edi,0C
>0049D24B    jne         0049D239
>0049D24D    jmp         0049E0CA
 0049D252    mov         eax,1
 0049D257    call        AllocMem
 0049D25C    mov         dword ptr [esi+0C],eax
 0049D25F    mov         eax,ebx
 0049D261    call        0049BF84
 0049D266    mov         edx,dword ptr [esi+0C]
 0049D269    mov         byte ptr [edx],al
>0049D26B    jmp         0049E0CA
 0049D270    mov         eax,58
 0049D275    call        AllocMem
 0049D27A    mov         dword ptr [esi+0C],eax
 0049D27D    mov         eax,dword ptr [esi+0C]
 0049D280    mov         esi,eax
 0049D282    mov         eax,ebx
 0049D284    call        0049BFFC
 0049D289    mov         word ptr [esi],ax
 0049D28C    mov         eax,ebx
 0049D28E    call        0049BFE4
 0049D293    fstp        dword ptr [esi+4]
 0049D296    wait
 0049D297    mov         eax,ebx
 0049D299    call        0049BFE4
 0049D29E    fstp        dword ptr [esi+8]
 0049D2A1    wait
 0049D2A2    lea         edx,[ebp-88]
 0049D2A8    mov         eax,ebx
 0049D2AA    call        0049C0DC
 0049D2AF    mov         eax,dword ptr [ebp-88]
 0049D2B5    mov         dword ptr [esi+0C],eax
 0049D2B8    mov         eax,dword ptr [ebp-84]
 0049D2BE    mov         dword ptr [esi+10],eax
 0049D2C1    mov         eax,dword ptr [ebp-80]
 0049D2C4    mov         dword ptr [esi+14],eax
 0049D2C7    mov         eax,ebx
 0049D2C9    call        0049BFE4
 0049D2CE    fstp        dword ptr [esi+18]
 0049D2D1    wait
 0049D2D2    xor         edi,edi
 0049D2D4    mov         eax,ebx
 0049D2D6    call        0049BFE4
 0049D2DB    fstp        dword ptr [esi+edi*4+1C]
 0049D2DF    wait
 0049D2E0    inc         edi
 0049D2E1    cmp         edi,0C
>0049D2E4    jne         0049D2D4
 0049D2E6    mov         eax,ebx
 0049D2E8    call        0049BFE4
 0049D2ED    fstp        dword ptr [esi+4C]
 0049D2F0    wait
 0049D2F1    mov         eax,ebx
 0049D2F3    call        0049BFE4
 0049D2F8    fstp        dword ptr [esi+50]
 0049D2FB    wait
 0049D2FC    mov         eax,ebx
 0049D2FE    call        0049BFE4
 0049D303    fstp        dword ptr [esi+54]
 0049D306    wait
>0049D307    jmp         0049E0CA
 0049D30C    mov         eax,ebx
 0049D30E    call        0049C020
 0049D313    mov         dword ptr [esi+0C],eax
>0049D316    jmp         0049E0CA
 0049D31B    mov         eax,0C
 0049D320    call        AllocMem
 0049D325    mov         dword ptr [esi+0C],eax
 0049D328    lea         edx,[ebp-88]
 0049D32E    mov         eax,ebx
 0049D330    call        0049C0DC
 0049D335    mov         eax,dword ptr [esi+0C]
 0049D338    mov         edx,dword ptr [ebp-88]
 0049D33E    mov         dword ptr [eax],edx
 0049D340    mov         edx,dword ptr [ebp-84]
 0049D346    mov         dword ptr [eax+4],edx
 0049D349    mov         edx,dword ptr [ebp-80]
 0049D34C    mov         dword ptr [eax+8],edx
>0049D34F    jmp         0049E0CA
 0049D354    mov         eax,ebx
 0049D356    call        0049C020
 0049D35B    mov         dword ptr [esi+0C],eax
>0049D35E    jmp         0049E0CA
 0049D363    mov         eax,4
 0049D368    call        AllocMem
 0049D36D    mov         dword ptr [esi+0C],eax
 0049D370    mov         eax,ebx
 0049D372    call        0049BFE4
 0049D377    mov         eax,dword ptr [esi+0C]
 0049D37A    fstp        dword ptr [eax]
 0049D37C    wait
>0049D37D    jmp         0049E0CA
 0049D382    mov         eax,4
 0049D387    call        AllocMem
 0049D38C    mov         dword ptr [esi+0C],eax
 0049D38F    mov         eax,ebx
 0049D391    call        0049BFE4
 0049D396    mov         eax,dword ptr [esi+0C]
 0049D399    fstp        dword ptr [eax]
 0049D39B    wait
>0049D39C    jmp         0049E0CA
 0049D3A1    mov         eax,4
 0049D3A6    call        AllocMem
 0049D3AB    mov         dword ptr [esi+0C],eax
 0049D3AE    mov         eax,ebx
 0049D3B0    call        0049BFE4
 0049D3B5    mov         eax,dword ptr [esi+0C]
 0049D3B8    fstp        dword ptr [eax]
 0049D3BA    wait
>0049D3BB    jmp         0049E0CA
 0049D3C0    mov         eax,14
 0049D3C5    call        AllocMem
 0049D3CA    mov         dword ptr [esi+0C],eax
 0049D3CD    mov         eax,dword ptr [esi+0C]
 0049D3D0    mov         dword ptr [ebp-34],eax
 0049D3D3    lea         edx,[ebp-88]
 0049D3D9    mov         eax,ebx
 0049D3DB    call        0049C0DC
 0049D3E0    mov         eax,dword ptr [ebp-34]
 0049D3E3    mov         edx,dword ptr [ebp-88]
 0049D3E9    mov         dword ptr [eax],edx
 0049D3EB    mov         edx,dword ptr [ebp-84]
 0049D3F1    mov         dword ptr [eax+4],edx
 0049D3F4    mov         edx,dword ptr [ebp-80]
 0049D3F7    mov         dword ptr [eax+8],edx
 0049D3FA    mov         eax,ebx
 0049D3FC    call        0049BFE4
 0049D401    mov         eax,dword ptr [ebp-34]
 0049D404    fstp        dword ptr [eax+0C]
 0049D407    wait
 0049D408    mov         eax,ebx
 0049D40A    call        0049BFE4
 0049D40F    mov         eax,dword ptr [ebp-34]
 0049D412    fstp        dword ptr [eax+10]
 0049D415    wait
>0049D416    jmp         0049E0CA
 0049D41B    mov         eax,0C
 0049D420    call        AllocMem
 0049D425    mov         dword ptr [esi+0C],eax
 0049D428    mov         eax,dword ptr [esi+0C]
 0049D42B    mov         dword ptr [ebp-38],eax
 0049D42E    mov         eax,ebx
 0049D430    call        0049BFE4
 0049D435    mov         eax,dword ptr [ebp-38]
 0049D438    fstp        dword ptr [eax]
 0049D43A    wait
 0049D43B    mov         eax,ebx
 0049D43D    call        0049BFE4
 0049D442    mov         eax,dword ptr [ebp-38]
 0049D445    fstp        dword ptr [eax+4]
 0049D448    wait
 0049D449    mov         eax,ebx
 0049D44B    call        0049BF9C
 0049D450    mov         edx,dword ptr [ebp-38]
 0049D453    mov         word ptr [edx+8],ax
>0049D457    jmp         0049E0CA
 0049D45C    mov         eax,4
 0049D461    call        AllocMem
 0049D466    mov         dword ptr [esi+0C],eax
 0049D469    mov         eax,ebx
 0049D46B    call        0049BFE4
 0049D470    mov         eax,dword ptr [esi+0C]
 0049D473    fstp        dword ptr [eax]
 0049D475    wait
>0049D476    jmp         0049E0CA
 0049D47B    mov         eax,4
 0049D480    call        AllocMem
 0049D485    mov         dword ptr [esi+0C],eax
 0049D488    mov         eax,ebx
 0049D48A    call        0049BFE4
 0049D48F    mov         eax,dword ptr [esi+0C]
 0049D492    fstp        dword ptr [eax]
 0049D494    wait
>0049D495    jmp         0049E0CA
 0049D49A    mov         eax,ebx
 0049D49C    call        0049C020
 0049D4A1    mov         dword ptr [esi+0C],eax
>0049D4A4    jmp         0049E0CA
 0049D4A9    mov         eax,4
 0049D4AE    call        AllocMem
 0049D4B3    mov         dword ptr [esi+0C],eax
 0049D4B6    mov         eax,ebx
 0049D4B8    call        0049BFE4
 0049D4BD    mov         eax,dword ptr [esi+0C]
 0049D4C0    fstp        dword ptr [eax]
 0049D4C2    wait
>0049D4C3    jmp         0049E0CA
 0049D4C8    mov         eax,20
 0049D4CD    call        AllocMem
 0049D4D2    mov         dword ptr [esi+0C],eax
 0049D4D5    mov         eax,dword ptr [esi+0C]
 0049D4D8    mov         dword ptr [ebp-3C],eax
 0049D4DB    lea         edx,[ebp-88]
 0049D4E1    mov         eax,ebx
 0049D4E3    call        0049C0DC
 0049D4E8    mov         eax,dword ptr [ebp-3C]
 0049D4EB    mov         edx,dword ptr [ebp-88]
 0049D4F1    mov         dword ptr [eax],edx
 0049D4F3    mov         edx,dword ptr [ebp-84]
 0049D4F9    mov         dword ptr [eax+4],edx
 0049D4FC    mov         edx,dword ptr [ebp-80]
 0049D4FF    mov         dword ptr [eax+8],edx
 0049D502    lea         edx,[ebp-88]
 0049D508    mov         eax,ebx
 0049D50A    call        0049C0DC
 0049D50F    mov         eax,dword ptr [ebp-3C]
 0049D512    mov         edx,dword ptr [ebp-88]
 0049D518    mov         dword ptr [eax+0C],edx
 0049D51B    mov         edx,dword ptr [ebp-84]
 0049D521    mov         dword ptr [eax+10],edx
 0049D524    mov         edx,dword ptr [ebp-80]
 0049D527    mov         dword ptr [eax+14],edx
 0049D52A    mov         eax,ebx
 0049D52C    call        0049BFE4
 0049D531    mov         eax,dword ptr [ebp-3C]
 0049D534    fstp        dword ptr [eax+18]
 0049D537    wait
 0049D538    mov         eax,ebx
 0049D53A    call        0049BFE4
 0049D53F    mov         eax,dword ptr [ebp-3C]
 0049D542    fstp        dword ptr [eax+1C]
 0049D545    wait
>0049D546    jmp         0049E0CA
 0049D54B    mov         eax,8
 0049D550    call        AllocMem
 0049D555    mov         dword ptr [esi+0C],eax
 0049D558    mov         eax,dword ptr [esi+0C]
 0049D55B    mov         dword ptr [ebp-40],eax
 0049D55E    mov         eax,ebx
 0049D560    call        0049BFE4
 0049D565    mov         eax,dword ptr [ebp-40]
 0049D568    fstp        dword ptr [eax]
 0049D56A    wait
 0049D56B    mov         eax,ebx
 0049D56D    call        0049BFE4
 0049D572    mov         eax,dword ptr [ebp-40]
 0049D575    fstp        dword ptr [eax+4]
 0049D578    wait
>0049D579    jmp         0049E0CA
 0049D57E    mov         eax,0E
 0049D583    call        AllocMem
 0049D588    mov         dword ptr [esi+0C],eax
 0049D58B    mov         eax,dword ptr [esi+0C]
 0049D58E    mov         esi,eax
 0049D590    mov         eax,ebx
 0049D592    call        0049BF9C
 0049D597    mov         word ptr [esi],ax
 0049D59A    mov         eax,ebx
 0049D59C    call        0049BF9C
 0049D5A1    mov         word ptr [esi+2],ax
 0049D5A5    mov         eax,ebx
 0049D5A7    call        0049BF9C
 0049D5AC    mov         word ptr [esi+4],ax
 0049D5B0    mov         eax,ebx
 0049D5B2    call        0049BF9C
 0049D5B7    mov         word ptr [esi+6],ax
 0049D5BB    mov         eax,ebx
 0049D5BD    call        0049BF9C
 0049D5C2    mov         word ptr [esi+8],ax
 0049D5C6    mov         eax,ebx
 0049D5C8    call        0049BF9C
 0049D5CD    mov         word ptr [esi+0A],ax
 0049D5D1    mov         eax,ebx
 0049D5D3    call        0049BF9C
 0049D5D8    mov         word ptr [esi+0C],ax
>0049D5DC    jmp         0049E0CA
 0049D5E1    mov         eax,8
 0049D5E6    call        AllocMem
 0049D5EB    mov         dword ptr [esi+0C],eax
 0049D5EE    mov         eax,dword ptr [esi+0C]
 0049D5F1    mov         dword ptr [ebp-44],eax
 0049D5F4    mov         eax,ebx
 0049D5F6    call        0049BFFC
 0049D5FB    mov         edx,dword ptr [ebp-44]
 0049D5FE    mov         word ptr [edx],ax
 0049D601    mov         eax,ebx
 0049D603    call        0049BFFC
 0049D608    mov         edx,dword ptr [ebp-44]
 0049D60B    mov         word ptr [edx+2],ax
 0049D60F    mov         eax,ebx
 0049D611    call        0049BFFC
 0049D616    mov         edx,dword ptr [ebp-44]
 0049D619    mov         word ptr [edx+4],ax
 0049D61D    mov         eax,ebx
 0049D61F    call        0049BFFC
 0049D624    mov         edx,dword ptr [ebp-44]
 0049D627    mov         word ptr [edx+6],ax
>0049D62B    jmp         0049E0CA
 0049D630    mov         eax,2C
 0049D635    call        AllocMem
 0049D63A    mov         dword ptr [esi+0C],eax
 0049D63D    mov         eax,dword ptr [esi+0C]
 0049D640    mov         esi,eax
 0049D642    mov         eax,ebx
 0049D644    call        0049BF9C
 0049D649    mov         word ptr [esi],ax
 0049D64C    mov         eax,ebx
 0049D64E    call        0049BF9C
 0049D653    mov         word ptr [esi+2],ax
 0049D657    mov         eax,ebx
 0049D659    call        0049BF9C
 0049D65E    mov         word ptr [esi+4],ax
 0049D662    mov         eax,ebx
 0049D664    call        0049BF9C
 0049D669    mov         word ptr [esi+6],ax
 0049D66D    mov         eax,ebx
 0049D66F    call        0049BF9C
 0049D674    mov         word ptr [esi+8],ax
 0049D678    mov         eax,ebx
 0049D67A    call        0049BF9C
 0049D67F    mov         word ptr [esi+0A],ax
 0049D683    mov         eax,ebx
 0049D685    call        0049BF9C
 0049D68A    mov         word ptr [esi+0C],ax
 0049D68E    mov         eax,ebx
 0049D690    call        0049BFE4
 0049D695    fstp        dword ptr [esi+10]
 0049D698    wait
 0049D699    lea         edx,[ebp-88]
 0049D69F    mov         eax,ebx
 0049D6A1    call        0049C0DC
 0049D6A6    mov         eax,dword ptr [ebp-88]
 0049D6AC    mov         dword ptr [esi+14],eax
 0049D6AF    mov         eax,dword ptr [ebp-84]
 0049D6B5    mov         dword ptr [esi+18],eax
 0049D6B8    mov         eax,dword ptr [ebp-80]
 0049D6BB    mov         dword ptr [esi+1C],eax
 0049D6BE    mov         eax,ebx
 0049D6C0    call        0049BFE4
 0049D6C5    fstp        dword ptr [esi+20]
 0049D6C8    wait
 0049D6C9    mov         eax,ebx
 0049D6CB    call        0049BFE4
 0049D6D0    fstp        dword ptr [esi+24]
 0049D6D3    wait
 0049D6D4    mov         eax,ebx
 0049D6D6    call        0049C020
 0049D6DB    lea         edx,[ebp-90]
 0049D6E1    call        0049A3F0
 0049D6E6    mov         edx,dword ptr [ebp-90]
 0049D6EC    lea         eax,[esi+28]
 0049D6EF    call        @LStrAsg
>0049D6F4    jmp         0049E0CA
 0049D6F9    mov         edx,esi
 0049D6FB    mov         eax,ebx
 0049D6FD    call        0049B2B0
 0049D702    mov         edi,dword ptr [esi+0C]
 0049D705    mov         eax,dword ptr [esi+4]
 0049D708    sub         eax,6
 0049D70B    mov         dword ptr [edi],eax
 0049D70D    mov         eax,dword ptr [edi]
 0049D70F    call        AllocMem
 0049D714    mov         dword ptr [edi+4],eax
 0049D717    mov         ecx,dword ptr [edi+4]
 0049D71A    mov         edx,dword ptr [edi]
 0049D71C    mov         eax,ebx
 0049D71E    call        0049C014
>0049D723    jmp         0049E0CA
 0049D728    mov         eax,ebx
 0049D72A    call        0049C020
 0049D72F    mov         dword ptr [esi+0C],eax
>0049D732    jmp         0049E0CA
 0049D737    mov         eax,ebx
 0049D739    call        0049C020
 0049D73E    mov         dword ptr [esi+0C],eax
>0049D741    jmp         0049E0CA
 0049D746    mov         eax,0C
 0049D74B    call        AllocMem
 0049D750    mov         dword ptr [esi+0C],eax
 0049D753    mov         eax,dword ptr [esi+0C]
 0049D756    mov         dword ptr [ebp-48],eax
 0049D759    mov         eax,ebx
 0049D75B    call        0049BF9C
 0049D760    mov         edx,dword ptr [ebp-48]
 0049D763    mov         word ptr [edx],ax
 0049D766    mov         eax,ebx
 0049D768    call        0049C020
 0049D76D    mov         edx,eax
 0049D76F    mov         eax,dword ptr [ebp-48]
 0049D772    add         eax,4
 0049D775    call        @LStrFromPChar
 0049D77A    mov         eax,ebx
 0049D77C    call        0049BFCC
 0049D781    mov         edx,dword ptr [ebp-48]
 0049D784    mov         dword ptr [edx+8],eax
>0049D787    jmp         0049E0CA
 0049D78C    mov         eax,8
 0049D791    call        AllocMem
 0049D796    mov         dword ptr [esi+0C],eax
 0049D799    mov         eax,dword ptr [esi+0C]
 0049D79C    mov         dword ptr [ebp-4C],eax
 0049D79F    mov         eax,ebx
 0049D7A1    call        0049BFCC
 0049D7A6    mov         edx,dword ptr [ebp-4C]
 0049D7A9    mov         dword ptr [edx],eax
 0049D7AB    mov         eax,ebx
 0049D7AD    call        0049BFCC
 0049D7B2    mov         edx,dword ptr [ebp-4C]
 0049D7B5    mov         dword ptr [edx+4],eax
>0049D7B8    jmp         0049E0CA
 0049D7BD    mov         eax,4
 0049D7C2    call        AllocMem
 0049D7C7    mov         dword ptr [esi+0C],eax
 0049D7CA    mov         eax,ebx
 0049D7CC    call        0049BFCC
 0049D7D1    mov         edx,dword ptr [esi+0C]
 0049D7D4    mov         dword ptr [edx],eax
>0049D7D6    jmp         0049E0CA
 0049D7DB    mov         eax,2
 0049D7E0    call        AllocMem
 0049D7E5    mov         dword ptr [esi+0C],eax
 0049D7E8    mov         eax,ebx
 0049D7EA    call        0049BF9C
 0049D7EF    mov         edx,dword ptr [esi+0C]
 0049D7F2    mov         word ptr [edx],ax
>0049D7F5    jmp         0049E0CA
 0049D7FA    mov         eax,0C
 0049D7FF    call        AllocMem
 0049D804    mov         dword ptr [esi+0C],eax
 0049D807    mov         eax,dword ptr [esi+0C]
 0049D80A    mov         dword ptr [ebp-50],eax
 0049D80D    mov         eax,ebx
 0049D80F    call        0049C020
 0049D814    lea         edx,[ebp-94]
 0049D81A    call        0049A3F0
 0049D81F    mov         edx,dword ptr [ebp-94]
 0049D825    mov         eax,dword ptr [ebp-50]
 0049D828    call        @LStrAsg
 0049D82D    mov         eax,ebx
 0049D82F    call        0049BFFC
 0049D834    mov         edx,dword ptr [ebp-50]
 0049D837    mov         word ptr [edx+4],ax
 0049D83B    mov         eax,ebx
 0049D83D    call        0049BFFC
 0049D842    mov         edx,dword ptr [ebp-50]
 0049D845    mov         word ptr [edx+6],ax
 0049D849    mov         eax,ebx
 0049D84B    call        0049BF9C
 0049D850    mov         edx,dword ptr [ebp-50]
 0049D853    mov         word ptr [edx+8],ax
>0049D857    jmp         0049E0CA
 0049D85C    mov         eax,0C
 0049D861    call        AllocMem
 0049D866    mov         dword ptr [esi+0C],eax
 0049D869    lea         edx,[ebp-88]
 0049D86F    mov         eax,ebx
 0049D871    call        0049C0DC
 0049D876    mov         eax,dword ptr [esi+0C]
 0049D879    mov         edx,dword ptr [ebp-88]
 0049D87F    mov         dword ptr [eax],edx
 0049D881    mov         edx,dword ptr [ebp-84]
 0049D887    mov         dword ptr [eax+4],edx
 0049D88A    mov         edx,dword ptr [ebp-80]
 0049D88D    mov         dword ptr [eax+8],edx
>0049D890    jmp         0049E0CA
 0049D895    mov         eax,ebx
 0049D897    call        0049C020
 0049D89C    mov         dword ptr [esi+0C],eax
>0049D89F    jmp         0049E0CA
 0049D8A4    mov         eax,4
 0049D8A9    call        AllocMem
 0049D8AE    mov         dword ptr [esi+0C],eax
 0049D8B1    mov         eax,ebx
 0049D8B3    call        0049BFE4
 0049D8B8    mov         eax,dword ptr [esi+0C]
 0049D8BB    fstp        dword ptr [eax]
 0049D8BD    wait
>0049D8BE    jmp         0049E0CA
 0049D8C3    mov         eax,18
 0049D8C8    call        AllocMem
 0049D8CD    mov         dword ptr [esi+0C],eax
 0049D8D0    mov         eax,dword ptr [esi+0C]
 0049D8D3    mov         dword ptr [ebp-54],eax
 0049D8D6    lea         edx,[ebp-88]
 0049D8DC    mov         eax,ebx
 0049D8DE    call        0049C0DC
 0049D8E3    mov         eax,dword ptr [ebp-54]
 0049D8E6    mov         edx,dword ptr [ebp-88]
 0049D8EC    mov         dword ptr [eax],edx
 0049D8EE    mov         edx,dword ptr [ebp-84]
 0049D8F4    mov         dword ptr [eax+4],edx
 0049D8F7    mov         edx,dword ptr [ebp-80]
 0049D8FA    mov         dword ptr [eax+8],edx
 0049D8FD    lea         edx,[ebp-88]
 0049D903    mov         eax,ebx
 0049D905    call        0049C0DC
 0049D90A    mov         eax,dword ptr [ebp-54]
 0049D90D    mov         edx,dword ptr [ebp-88]
 0049D913    mov         dword ptr [eax+0C],edx
 0049D916    mov         edx,dword ptr [ebp-84]
 0049D91C    mov         dword ptr [eax+10],edx
 0049D91F    mov         edx,dword ptr [ebp-80]
 0049D922    mov         dword ptr [eax+14],edx
>0049D925    jmp         0049E0CA
 0049D92A    mov         eax,18
 0049D92F    call        AllocMem
 0049D934    mov         dword ptr [esi+0C],eax
 0049D937    mov         eax,dword ptr [esi+0C]
 0049D93A    mov         dword ptr [ebp-58],eax
 0049D93D    lea         edx,[ebp-0A4]
 0049D943    mov         eax,ebx
 0049D945    call        0049C104
 0049D94A    mov         eax,dword ptr [ebp-58]
 0049D94D    lea         esi,[ebp-0A4]
 0049D953    mov         edi,eax
 0049D955    movs        dword ptr [edi],dword ptr [esi]
 0049D956    movs        dword ptr [edi],dword ptr [esi]
 0049D957    movs        dword ptr [edi],dword ptr [esi]
 0049D958    movs        dword ptr [edi],dword ptr [esi]
 0049D959    mov         eax,dword ptr [ebp-58]
 0049D95C    imul        eax,dword ptr [eax+0C],1C
 0049D960    call        AllocMem
 0049D965    mov         edx,dword ptr [ebp-58]
 0049D968    mov         dword ptr [edx+10],eax
 0049D96B    mov         eax,dword ptr [ebp-58]
 0049D96E    mov         eax,dword ptr [eax+0C]
 0049D971    shl         eax,2
 0049D974    lea         eax,[eax+eax*2]
 0049D977    call        AllocMem
 0049D97C    mov         edx,dword ptr [ebp-58]
 0049D97F    mov         dword ptr [edx+14],eax
 0049D982    mov         eax,dword ptr [ebp-58]
 0049D985    mov         esi,dword ptr [eax+0C]
 0049D988    dec         esi
 0049D989    test        esi,esi
>0049D98B    jl          0049E0CA
 0049D991    inc         esi
 0049D992    xor         edi,edi
 0049D994    lea         edx,[ebp-0C0]
 0049D99A    mov         eax,ebx
 0049D99C    call        0049C148
 0049D9A1    mov         eax,edi
 0049D9A3    shl         eax,3
 0049D9A6    sub         eax,edi
 0049D9A8    mov         edx,dword ptr [ebp-58]
 0049D9AB    mov         edx,dword ptr [edx+10]
 0049D9AE    push        esi
 0049D9AF    push        edi
 0049D9B0    lea         esi,[ebp-0C0]
 0049D9B6    lea         edi,[edx+eax*4]
 0049D9B9    mov         ecx,7
 0049D9BE    rep movs    dword ptr [edi],dword ptr [esi]
 0049D9C0    pop         edi
 0049D9C1    pop         esi
 0049D9C2    lea         edx,[ebp-88]
 0049D9C8    mov         eax,ebx
 0049D9CA    call        0049C0DC
 0049D9CF    lea         eax,[edi+edi*2]
 0049D9D2    mov         edx,dword ptr [ebp-58]
 0049D9D5    mov         edx,dword ptr [edx+14]
 0049D9D8    mov         ecx,dword ptr [ebp-88]
 0049D9DE    mov         dword ptr [edx+eax*4],ecx
 0049D9E1    mov         ecx,dword ptr [ebp-84]
 0049D9E7    mov         dword ptr [edx+eax*4+4],ecx
 0049D9EB    mov         ecx,dword ptr [ebp-80]
 0049D9EE    mov         dword ptr [edx+eax*4+8],ecx
 0049D9F2    inc         edi
 0049D9F3    dec         esi
>0049D9F4    jne         0049D994
>0049D9F6    jmp         0049E0CA
 0049D9FB    mov         eax,18
 0049DA00    call        AllocMem
 0049DA05    mov         dword ptr [esi+0C],eax
 0049DA08    mov         eax,dword ptr [esi+0C]
 0049DA0B    mov         dword ptr [ebp-5C],eax
 0049DA0E    lea         edx,[ebp-0A4]
 0049DA14    mov         eax,ebx
 0049DA16    call        0049C104
 0049DA1B    mov         eax,dword ptr [ebp-5C]
 0049DA1E    lea         esi,[ebp-0A4]
 0049DA24    mov         edi,eax
 0049DA26    movs        dword ptr [edi],dword ptr [esi]
 0049DA27    movs        dword ptr [edi],dword ptr [esi]
 0049DA28    movs        dword ptr [edi],dword ptr [esi]
 0049DA29    movs        dword ptr [edi],dword ptr [esi]
 0049DA2A    mov         eax,dword ptr [ebp-5C]
 0049DA2D    mov         eax,dword ptr [eax+0C]
 0049DA30    shl         eax,2
 0049DA33    lea         eax,[eax+eax*2]
 0049DA36    call        AllocMem
 0049DA3B    mov         edx,dword ptr [ebp-5C]
 0049DA3E    mov         dword ptr [edx+14],eax
 0049DA41    mov         eax,dword ptr [ebp-5C]
 0049DA44    imul        eax,dword ptr [eax+0C],1C
 0049DA48    call        AllocMem
 0049DA4D    mov         edx,dword ptr [ebp-5C]
 0049DA50    mov         dword ptr [edx+10],eax
 0049DA53    mov         eax,dword ptr [ebp-5C]
 0049DA56    mov         esi,dword ptr [eax+0C]
 0049DA59    dec         esi
 0049DA5A    test        esi,esi
>0049DA5C    jl          0049E0CA
 0049DA62    inc         esi
 0049DA63    xor         edi,edi
 0049DA65    lea         edx,[ebp-0C0]
 0049DA6B    mov         eax,ebx
 0049DA6D    call        0049C148
 0049DA72    mov         eax,edi
 0049DA74    shl         eax,3
 0049DA77    sub         eax,edi
 0049DA79    mov         edx,dword ptr [ebp-5C]
 0049DA7C    mov         edx,dword ptr [edx+10]
 0049DA7F    push        esi
 0049DA80    push        edi
 0049DA81    lea         esi,[ebp-0C0]
 0049DA87    lea         edi,[edx+eax*4]
 0049DA8A    mov         ecx,7
 0049DA8F    rep movs    dword ptr [edi],dword ptr [esi]
 0049DA91    pop         edi
 0049DA92    pop         esi
 0049DA93    mov         eax,ebx
 0049DA95    call        0049BFE4
 0049DA9A    lea         eax,[edi+edi*2]
 0049DA9D    mov         edx,dword ptr [ebp-5C]
 0049DAA0    mov         edx,dword ptr [edx+14]
 0049DAA3    fstp        dword ptr [edx+eax*4]
 0049DAA6    wait
 0049DAA7    mov         eax,ebx
 0049DAA9    call        0049BFE4
 0049DAAE    lea         eax,[edi+edi*2]
 0049DAB1    mov         edx,dword ptr [ebp-5C]
 0049DAB4    mov         edx,dword ptr [edx+14]
 0049DAB7    fstp        dword ptr [edx+eax*4+4]
 0049DABB    wait
 0049DABC    mov         eax,ebx
 0049DABE    call        0049BFE4
 0049DAC3    lea         eax,[edi+edi*2]
 0049DAC6    mov         edx,dword ptr [ebp-5C]
 0049DAC9    mov         edx,dword ptr [edx+14]
 0049DACC    fstp        dword ptr [edx+eax*4+8]
 0049DAD0    wait
 0049DAD1    inc         edi
 0049DAD2    dec         esi
>0049DAD3    jne         0049DA65
>0049DAD5    jmp         0049E0CA
 0049DADA    mov         eax,18
 0049DADF    call        AllocMem
 0049DAE4    mov         dword ptr [esi+0C],eax
 0049DAE7    mov         eax,dword ptr [esi+0C]
 0049DAEA    mov         dword ptr [ebp-60],eax
 0049DAED    lea         edx,[ebp-0A4]
 0049DAF3    mov         eax,ebx
 0049DAF5    call        0049C104
 0049DAFA    mov         eax,dword ptr [ebp-60]
 0049DAFD    lea         esi,[ebp-0A4]
 0049DB03    mov         edi,eax
 0049DB05    movs        dword ptr [edi],dword ptr [esi]
 0049DB06    movs        dword ptr [edi],dword ptr [esi]
 0049DB07    movs        dword ptr [edi],dword ptr [esi]
 0049DB08    movs        dword ptr [edi],dword ptr [esi]
 0049DB09    mov         eax,dword ptr [ebp-60]
 0049DB0C    imul        eax,dword ptr [eax+0C],1C
 0049DB10    call        AllocMem
 0049DB15    mov         edx,dword ptr [ebp-60]
 0049DB18    mov         dword ptr [edx+10],eax
 0049DB1B    mov         eax,dword ptr [ebp-60]
 0049DB1E    mov         eax,dword ptr [eax+0C]
 0049DB21    shl         eax,4
 0049DB24    call        AllocMem
 0049DB29    mov         edx,dword ptr [ebp-60]
 0049DB2C    mov         dword ptr [edx+14],eax
 0049DB2F    mov         eax,dword ptr [ebp-60]
 0049DB32    mov         esi,dword ptr [eax+0C]
 0049DB35    dec         esi
 0049DB36    test        esi,esi
>0049DB38    jl          0049E0CA
 0049DB3E    inc         esi
 0049DB3F    xor         edi,edi
 0049DB41    lea         edx,[ebp-0C0]
 0049DB47    mov         eax,ebx
 0049DB49    call        0049C148
 0049DB4E    mov         eax,edi
 0049DB50    shl         eax,3
 0049DB53    sub         eax,edi
 0049DB55    mov         edx,dword ptr [ebp-60]
 0049DB58    mov         edx,dword ptr [edx+10]
 0049DB5B    push        esi
 0049DB5C    push        edi
 0049DB5D    lea         esi,[ebp-0C0]
 0049DB63    lea         edi,[edx+eax*4]
 0049DB66    mov         ecx,7
 0049DB6B    rep movs    dword ptr [edi],dword ptr [esi]
 0049DB6D    pop         edi
 0049DB6E    pop         esi
 0049DB6F    mov         eax,ebx
 0049DB71    call        0049BFE4
 0049DB76    mov         eax,edi
 0049DB78    add         eax,eax
 0049DB7A    mov         edx,dword ptr [ebp-60]
 0049DB7D    mov         edx,dword ptr [edx+14]
 0049DB80    fstp        dword ptr [edx+eax*8]
 0049DB83    wait
 0049DB84    mov         eax,ebx
 0049DB86    call        0049BFE4
 0049DB8B    mov         eax,edi
 0049DB8D    add         eax,eax
 0049DB8F    mov         edx,dword ptr [ebp-60]
 0049DB92    mov         edx,dword ptr [edx+14]
 0049DB95    fstp        dword ptr [edx+eax*8+4]
 0049DB99    wait
 0049DB9A    mov         eax,ebx
 0049DB9C    call        0049BFE4
 0049DBA1    mov         eax,edi
 0049DBA3    add         eax,eax
 0049DBA5    mov         edx,dword ptr [ebp-60]
 0049DBA8    mov         edx,dword ptr [edx+14]
 0049DBAB    fstp        dword ptr [edx+eax*8+8]
 0049DBAF    wait
 0049DBB0    mov         eax,ebx
 0049DBB2    call        0049BFE4
 0049DBB7    mov         eax,edi
 0049DBB9    add         eax,eax
 0049DBBB    mov         edx,dword ptr [ebp-60]
 0049DBBE    mov         edx,dword ptr [edx+14]
 0049DBC1    fstp        dword ptr [edx+eax*8+0C]
 0049DBC5    wait
 0049DBC6    inc         edi
 0049DBC7    dec         esi
>0049DBC8    jne         0049DB41
>0049DBCE    jmp         0049E0CA
 0049DBD3    mov         eax,18
 0049DBD8    call        AllocMem
 0049DBDD    mov         dword ptr [esi+0C],eax
 0049DBE0    mov         eax,dword ptr [esi+0C]
 0049DBE3    mov         dword ptr [ebp-64],eax
 0049DBE6    lea         edx,[ebp-0A4]
 0049DBEC    mov         eax,ebx
 0049DBEE    call        0049C104
 0049DBF3    mov         eax,dword ptr [ebp-64]
 0049DBF6    lea         esi,[ebp-0A4]
 0049DBFC    mov         edi,eax
 0049DBFE    movs        dword ptr [edi],dword ptr [esi]
 0049DBFF    movs        dword ptr [edi],dword ptr [esi]
 0049DC00    movs        dword ptr [edi],dword ptr [esi]
 0049DC01    movs        dword ptr [edi],dword ptr [esi]
 0049DC02    mov         eax,dword ptr [ebp-64]
 0049DC05    imul        eax,dword ptr [eax+0C],1C
 0049DC09    call        AllocMem
 0049DC0E    mov         edx,dword ptr [ebp-64]
 0049DC11    mov         dword ptr [edx+10],eax
 0049DC14    mov         eax,dword ptr [ebp-64]
 0049DC17    mov         eax,dword ptr [eax+0C]
 0049DC1A    shl         eax,2
 0049DC1D    lea         eax,[eax+eax*2]
 0049DC20    call        AllocMem
 0049DC25    mov         edx,dword ptr [ebp-64]
 0049DC28    mov         dword ptr [edx+14],eax
 0049DC2B    mov         eax,dword ptr [ebp-64]
 0049DC2E    mov         esi,dword ptr [eax+0C]
 0049DC31    dec         esi
 0049DC32    test        esi,esi
>0049DC34    jl          0049E0CA
 0049DC3A    inc         esi
 0049DC3B    xor         edi,edi
 0049DC3D    lea         edx,[ebp-0C0]
 0049DC43    mov         eax,ebx
 0049DC45    call        0049C148
 0049DC4A    mov         eax,edi
 0049DC4C    shl         eax,3
 0049DC4F    sub         eax,edi
 0049DC51    mov         edx,dword ptr [ebp-64]
 0049DC54    mov         edx,dword ptr [edx+10]
 0049DC57    push        esi
 0049DC58    push        edi
 0049DC59    lea         esi,[ebp-0C0]
 0049DC5F    lea         edi,[edx+eax*4]
 0049DC62    mov         ecx,7
 0049DC67    rep movs    dword ptr [edi],dword ptr [esi]
 0049DC69    pop         edi
 0049DC6A    pop         esi
 0049DC6B    mov         eax,ebx
 0049DC6D    call        0049BFE4
 0049DC72    lea         eax,[edi+edi*2]
 0049DC75    mov         edx,dword ptr [ebp-64]
 0049DC78    mov         edx,dword ptr [edx+14]
 0049DC7B    fstp        dword ptr [edx+eax*4]
 0049DC7E    wait
 0049DC7F    mov         eax,ebx
 0049DC81    call        0049BFE4
 0049DC86    lea         eax,[edi+edi*2]
 0049DC89    mov         edx,dword ptr [ebp-64]
 0049DC8C    mov         edx,dword ptr [edx+14]
 0049DC8F    fstp        dword ptr [edx+eax*4+4]
 0049DC93    wait
 0049DC94    mov         eax,ebx
 0049DC96    call        0049BFE4
 0049DC9B    lea         eax,[edi+edi*2]
 0049DC9E    mov         edx,dword ptr [ebp-64]
 0049DCA1    mov         edx,dword ptr [edx+14]
 0049DCA4    fstp        dword ptr [edx+eax*4+8]
 0049DCA8    wait
 0049DCA9    inc         edi
 0049DCAA    dec         esi
>0049DCAB    jne         0049DC3D
>0049DCAD    jmp         0049E0CA
 0049DCB2    mov         eax,18
 0049DCB7    call        AllocMem
 0049DCBC    mov         dword ptr [esi+0C],eax
 0049DCBF    mov         eax,dword ptr [esi+0C]
 0049DCC2    mov         dword ptr [ebp-68],eax
 0049DCC5    lea         edx,[ebp-0A4]
 0049DCCB    mov         eax,ebx
 0049DCCD    call        0049C104
 0049DCD2    mov         eax,dword ptr [ebp-68]
 0049DCD5    lea         esi,[ebp-0A4]
 0049DCDB    mov         edi,eax
 0049DCDD    movs        dword ptr [edi],dword ptr [esi]
 0049DCDE    movs        dword ptr [edi],dword ptr [esi]
 0049DCDF    movs        dword ptr [edi],dword ptr [esi]
 0049DCE0    movs        dword ptr [edi],dword ptr [esi]
 0049DCE1    mov         eax,dword ptr [ebp-68]
 0049DCE4    imul        eax,dword ptr [eax+0C],1C
 0049DCE8    call        AllocMem
 0049DCED    mov         edx,dword ptr [ebp-68]
 0049DCF0    mov         dword ptr [edx+10],eax
 0049DCF3    mov         eax,dword ptr [ebp-68]
 0049DCF6    mov         eax,dword ptr [eax+0C]
 0049DCF9    shl         eax,2
 0049DCFC    call        AllocMem
 0049DD01    mov         edx,dword ptr [ebp-68]
 0049DD04    mov         dword ptr [edx+14],eax
 0049DD07    mov         eax,dword ptr [ebp-68]
 0049DD0A    mov         esi,dword ptr [eax+0C]
 0049DD0D    dec         esi
 0049DD0E    test        esi,esi
>0049DD10    jl          0049E0CA
 0049DD16    inc         esi
 0049DD17    xor         edi,edi
 0049DD19    lea         edx,[ebp-0C0]
 0049DD1F    mov         eax,ebx
 0049DD21    call        0049C148
 0049DD26    mov         eax,edi
 0049DD28    shl         eax,3
 0049DD2B    sub         eax,edi
 0049DD2D    mov         edx,dword ptr [ebp-68]
 0049DD30    mov         edx,dword ptr [edx+10]
 0049DD33    push        esi
 0049DD34    push        edi
 0049DD35    lea         esi,[ebp-0C0]
 0049DD3B    lea         edi,[edx+eax*4]
 0049DD3E    mov         ecx,7
 0049DD43    rep movs    dword ptr [edi],dword ptr [esi]
 0049DD45    pop         edi
 0049DD46    pop         esi
 0049DD47    mov         eax,ebx
 0049DD49    call        0049C020
 0049DD4E    mov         edx,eax
 0049DD50    mov         eax,dword ptr [ebp-68]
 0049DD53    mov         eax,dword ptr [eax+14]
 0049DD56    lea         eax,[eax+edi*4]
 0049DD59    call        @LStrFromPChar
 0049DD5E    inc         edi
 0049DD5F    dec         esi
>0049DD60    jne         0049DD19
>0049DD62    jmp         0049E0CA
 0049DD67    mov         eax,18
 0049DD6C    call        AllocMem
 0049DD71    mov         dword ptr [esi+0C],eax
 0049DD74    mov         eax,dword ptr [esi+0C]
 0049DD77    mov         dword ptr [ebp-6C],eax
 0049DD7A    lea         edx,[ebp-0A4]
 0049DD80    mov         eax,ebx
 0049DD82    call        0049C104
 0049DD87    mov         eax,dword ptr [ebp-6C]
 0049DD8A    lea         esi,[ebp-0A4]
 0049DD90    mov         edi,eax
 0049DD92    movs        dword ptr [edi],dword ptr [esi]
 0049DD93    movs        dword ptr [edi],dword ptr [esi]
 0049DD94    movs        dword ptr [edi],dword ptr [esi]
 0049DD95    movs        dword ptr [edi],dword ptr [esi]
 0049DD96    mov         eax,dword ptr [ebp-6C]
 0049DD99    imul        eax,dword ptr [eax+0C],1C
 0049DD9D    call        AllocMem
 0049DDA2    mov         edx,dword ptr [ebp-6C]
 0049DDA5    mov         dword ptr [edx+10],eax
 0049DDA8    mov         eax,dword ptr [ebp-6C]
 0049DDAB    mov         eax,dword ptr [eax+0C]
 0049DDAE    shl         eax,2
 0049DDB1    call        AllocMem
 0049DDB6    mov         edx,dword ptr [ebp-6C]
 0049DDB9    mov         dword ptr [edx+14],eax
 0049DDBC    mov         eax,dword ptr [ebp-6C]
 0049DDBF    mov         esi,dword ptr [eax+0C]
 0049DDC2    dec         esi
 0049DDC3    test        esi,esi
>0049DDC5    jl          0049E0CA
 0049DDCB    inc         esi
 0049DDCC    xor         edi,edi
 0049DDCE    lea         edx,[ebp-0C0]
 0049DDD4    mov         eax,ebx
 0049DDD6    call        0049C148
 0049DDDB    mov         eax,edi
 0049DDDD    shl         eax,3
 0049DDE0    sub         eax,edi
 0049DDE2    mov         edx,dword ptr [ebp-6C]
 0049DDE5    mov         edx,dword ptr [edx+10]
 0049DDE8    push        esi
 0049DDE9    push        edi
 0049DDEA    lea         esi,[ebp-0C0]
 0049DDF0    lea         edi,[edx+eax*4]
 0049DDF3    mov         ecx,7
 0049DDF8    rep movs    dword ptr [edi],dword ptr [esi]
 0049DDFA    pop         edi
 0049DDFB    pop         esi
 0049DDFC    mov         eax,ebx
 0049DDFE    call        0049BFE4
 0049DE03    mov         eax,dword ptr [ebp-6C]
 0049DE06    mov         eax,dword ptr [eax+14]
 0049DE09    fstp        dword ptr [eax+edi*4]
 0049DE0C    wait
 0049DE0D    inc         edi
 0049DE0E    dec         esi
>0049DE0F    jne         0049DDCE
>0049DE11    jmp         0049E0CA
 0049DE16    mov         eax,18
 0049DE1B    call        AllocMem
 0049DE20    mov         dword ptr [esi+0C],eax
 0049DE23    mov         eax,dword ptr [esi+0C]
 0049DE26    mov         dword ptr [ebp-70],eax
 0049DE29    lea         edx,[ebp-0A4]
 0049DE2F    mov         eax,ebx
 0049DE31    call        0049C104
 0049DE36    mov         eax,dword ptr [ebp-70]
 0049DE39    lea         esi,[ebp-0A4]
 0049DE3F    mov         edi,eax
 0049DE41    movs        dword ptr [edi],dword ptr [esi]
 0049DE42    movs        dword ptr [edi],dword ptr [esi]
 0049DE43    movs        dword ptr [edi],dword ptr [esi]
 0049DE44    movs        dword ptr [edi],dword ptr [esi]
 0049DE45    mov         eax,dword ptr [ebp-70]
 0049DE48    imul        eax,dword ptr [eax+0C],1C
 0049DE4C    call        AllocMem
 0049DE51    mov         edx,dword ptr [ebp-70]
 0049DE54    mov         dword ptr [edx+10],eax
 0049DE57    mov         eax,dword ptr [ebp-70]
 0049DE5A    mov         eax,dword ptr [eax+0C]
 0049DE5D    shl         eax,2
 0049DE60    call        AllocMem
 0049DE65    mov         edx,dword ptr [ebp-70]
 0049DE68    mov         dword ptr [edx+14],eax
 0049DE6B    mov         eax,dword ptr [ebp-70]
 0049DE6E    mov         esi,dword ptr [eax+0C]
 0049DE71    dec         esi
 0049DE72    test        esi,esi
>0049DE74    jl          0049E0CA
 0049DE7A    inc         esi
 0049DE7B    xor         edi,edi
 0049DE7D    lea         edx,[ebp-0C0]
 0049DE83    mov         eax,ebx
 0049DE85    call        0049C148
 0049DE8A    mov         eax,edi
 0049DE8C    shl         eax,3
 0049DE8F    sub         eax,edi
 0049DE91    mov         edx,dword ptr [ebp-70]
 0049DE94    mov         edx,dword ptr [edx+10]
 0049DE97    push        esi
 0049DE98    push        edi
 0049DE99    lea         esi,[ebp-0C0]
 0049DE9F    lea         edi,[edx+eax*4]
 0049DEA2    mov         ecx,7
 0049DEA7    rep movs    dword ptr [edi],dword ptr [esi]
 0049DEA9    pop         edi
 0049DEAA    pop         esi
 0049DEAB    mov         eax,ebx
 0049DEAD    call        0049BFE4
 0049DEB2    mov         eax,dword ptr [ebp-70]
 0049DEB5    mov         eax,dword ptr [eax+14]
 0049DEB8    fstp        dword ptr [eax+edi*4]
 0049DEBB    wait
 0049DEBC    inc         edi
 0049DEBD    dec         esi
>0049DEBE    jne         0049DE7D
>0049DEC0    jmp         0049E0CA
 0049DEC5    mov         eax,18
 0049DECA    call        AllocMem
 0049DECF    mov         dword ptr [esi+0C],eax
 0049DED2    mov         eax,dword ptr [esi+0C]
 0049DED5    mov         dword ptr [ebp-74],eax
 0049DED8    lea         edx,[ebp-0A4]
 0049DEDE    mov         eax,ebx
 0049DEE0    call        0049C104
 0049DEE5    mov         eax,dword ptr [ebp-74]
 0049DEE8    lea         esi,[ebp-0A4]
 0049DEEE    mov         edi,eax
 0049DEF0    movs        dword ptr [edi],dword ptr [esi]
 0049DEF1    movs        dword ptr [edi],dword ptr [esi]
 0049DEF2    movs        dword ptr [edi],dword ptr [esi]
 0049DEF3    movs        dword ptr [edi],dword ptr [esi]
 0049DEF4    mov         eax,dword ptr [ebp-74]
 0049DEF7    imul        eax,dword ptr [eax+0C],1C
 0049DEFB    call        AllocMem
 0049DF00    mov         edx,dword ptr [ebp-74]
 0049DF03    mov         dword ptr [edx+10],eax
 0049DF06    mov         eax,dword ptr [ebp-74]
 0049DF09    mov         eax,dword ptr [eax+0C]
 0049DF0C    shl         eax,2
 0049DF0F    call        AllocMem
 0049DF14    mov         edx,dword ptr [ebp-74]
 0049DF17    mov         dword ptr [edx+14],eax
 0049DF1A    mov         eax,dword ptr [ebp-74]
 0049DF1D    mov         esi,dword ptr [eax+0C]
 0049DF20    dec         esi
 0049DF21    test        esi,esi
>0049DF23    jl          0049E0CA
 0049DF29    inc         esi
 0049DF2A    xor         edi,edi
 0049DF2C    lea         edx,[ebp-0C0]
 0049DF32    mov         eax,ebx
 0049DF34    call        0049C148
 0049DF39    mov         eax,edi
 0049DF3B    shl         eax,3
 0049DF3E    sub         eax,edi
 0049DF40    mov         edx,dword ptr [ebp-74]
 0049DF43    mov         edx,dword ptr [edx+10]
 0049DF46    push        esi
 0049DF47    push        edi
 0049DF48    lea         esi,[ebp-0C0]
 0049DF4E    lea         edi,[edx+eax*4]
 0049DF51    mov         ecx,7
 0049DF56    rep movs    dword ptr [edi],dword ptr [esi]
 0049DF58    pop         edi
 0049DF59    pop         esi
 0049DF5A    mov         eax,ebx
 0049DF5C    call        0049BFE4
 0049DF61    mov         eax,dword ptr [ebp-74]
 0049DF64    mov         eax,dword ptr [eax+14]
 0049DF67    fstp        dword ptr [eax+edi*4]
 0049DF6A    wait
 0049DF6B    inc         edi
 0049DF6C    dec         esi
>0049DF6D    jne         0049DF2C
>0049DF6F    jmp         0049E0CA
 0049DF74    mov         eax,18
 0049DF79    call        AllocMem
 0049DF7E    mov         dword ptr [esi+0C],eax
 0049DF81    mov         eax,dword ptr [esi+0C]
 0049DF84    mov         dword ptr [ebp-78],eax
 0049DF87    lea         edx,[ebp-0A4]
 0049DF8D    mov         eax,ebx
 0049DF8F    call        0049C104
 0049DF94    mov         eax,dword ptr [ebp-78]
 0049DF97    lea         esi,[ebp-0A4]
 0049DF9D    mov         edi,eax
 0049DF9F    movs        dword ptr [edi],dword ptr [esi]
 0049DFA0    movs        dword ptr [edi],dword ptr [esi]
 0049DFA1    movs        dword ptr [edi],dword ptr [esi]
 0049DFA2    movs        dword ptr [edi],dword ptr [esi]
 0049DFA3    mov         eax,dword ptr [ebp-78]
 0049DFA6    imul        eax,dword ptr [eax+0C],1C
 0049DFAA    call        AllocMem
 0049DFAF    mov         edx,dword ptr [ebp-78]
 0049DFB2    mov         dword ptr [edx+10],eax
 0049DFB5    mov         eax,dword ptr [ebp-78]
 0049DFB8    mov         eax,dword ptr [eax+0C]
 0049DFBB    shl         eax,2
 0049DFBE    call        AllocMem
 0049DFC3    mov         edx,dword ptr [ebp-78]
 0049DFC6    mov         dword ptr [edx+14],eax
 0049DFC9    mov         eax,dword ptr [ebp-78]
 0049DFCC    mov         esi,dword ptr [eax+0C]
 0049DFCF    dec         esi
 0049DFD0    test        esi,esi
>0049DFD2    jl          0049E0CA
 0049DFD8    inc         esi
 0049DFD9    xor         edi,edi
 0049DFDB    lea         edx,[ebp-0C0]
 0049DFE1    mov         eax,ebx
 0049DFE3    call        0049C148
 0049DFE8    mov         eax,edi
 0049DFEA    shl         eax,3
 0049DFED    sub         eax,edi
 0049DFEF    mov         edx,dword ptr [ebp-78]
 0049DFF2    mov         edx,dword ptr [edx+10]
 0049DFF5    push        esi
 0049DFF6    push        edi
 0049DFF7    lea         esi,[ebp-0C0]
 0049DFFD    lea         edi,[edx+eax*4]
 0049E000    mov         ecx,7
 0049E005    rep movs    dword ptr [edi],dword ptr [esi]
 0049E007    pop         edi
 0049E008    pop         esi
 0049E009    mov         eax,ebx
 0049E00B    call        0049BFE4
 0049E010    mov         eax,dword ptr [ebp-78]
 0049E013    mov         eax,dword ptr [eax+14]
 0049E016    fstp        dword ptr [eax+edi*4]
 0049E019    wait
 0049E01A    inc         edi
 0049E01B    dec         esi
>0049E01C    jne         0049DFDB
>0049E01E    jmp         0049E0CA
 0049E023    mov         eax,14
 0049E028    call        AllocMem
 0049E02D    mov         dword ptr [esi+0C],eax
 0049E030    mov         eax,dword ptr [esi+0C]
 0049E033    mov         dword ptr [ebp-7C],eax
 0049E036    lea         edx,[ebp-0A4]
 0049E03C    mov         eax,ebx
 0049E03E    call        0049C104
 0049E043    mov         eax,dword ptr [ebp-7C]
 0049E046    lea         esi,[ebp-0A4]
 0049E04C    mov         edi,eax
 0049E04E    movs        dword ptr [edi],dword ptr [esi]
 0049E04F    movs        dword ptr [edi],dword ptr [esi]
 0049E050    movs        dword ptr [edi],dword ptr [esi]
 0049E051    movs        dword ptr [edi],dword ptr [esi]
 0049E052    mov         eax,dword ptr [ebp-7C]
 0049E055    imul        eax,dword ptr [eax+0C],1C
 0049E059    call        AllocMem
 0049E05E    mov         edx,dword ptr [ebp-7C]
 0049E061    mov         dword ptr [edx+10],eax
 0049E064    mov         eax,dword ptr [ebp-7C]
 0049E067    mov         esi,dword ptr [eax+0C]
 0049E06A    dec         esi
 0049E06B    test        esi,esi
>0049E06D    jl          0049E0CA
 0049E06F    inc         esi
 0049E070    xor         edi,edi
 0049E072    lea         edx,[ebp-0C0]
 0049E078    mov         eax,ebx
 0049E07A    call        0049C148
 0049E07F    mov         eax,edi
 0049E081    shl         eax,3
 0049E084    sub         eax,edi
 0049E086    mov         edx,dword ptr [ebp-7C]
 0049E089    mov         edx,dword ptr [edx+10]
 0049E08C    push        esi
 0049E08D    push        edi
 0049E08E    lea         esi,[ebp-0C0]
 0049E094    lea         edi,[edx+eax*4]
 0049E097    mov         ecx,7
 0049E09C    rep movs    dword ptr [edi],dword ptr [esi]
 0049E09E    pop         edi
 0049E09F    pop         esi
 0049E0A0    inc         edi
 0049E0A1    dec         esi
>0049E0A2    jne         0049E072
>0049E0A4    jmp         0049E0CA
 0049E0A6    cmp         dword ptr [esi+4],6
>0049E0AA    jbe         0049E0CA
 0049E0AC    mov         eax,dword ptr [esi+4]
 0049E0AF    sub         eax,6
 0049E0B2    call        AllocMem
 0049E0B7    mov         dword ptr [esi+0C],eax
 0049E0BA    mov         edx,dword ptr [esi+4]
 0049E0BD    sub         edx,6
 0049E0C0    mov         ecx,dword ptr [esi+0C]
 0049E0C3    mov         eax,ebx
 0049E0C5    call        0049C014
 0049E0CA    xor         eax,eax
 0049E0CC    pop         edx
 0049E0CD    pop         ecx
 0049E0CE    pop         ecx
 0049E0CF    mov         dword ptr fs:[eax],edx
 0049E0D2    push        49E0EF
 0049E0D7    lea         eax,[ebp-94]
 0049E0DD    mov         edx,3
 0049E0E2    call        @LStrArrayClr
 0049E0E7    ret
>0049E0E8    jmp         @HandleFinally
>0049E0ED    jmp         0049E0D7
 0049E0EF    pop         edi
 0049E0F0    pop         esi
 0049E0F1    pop         ebx
 0049E0F2    mov         esp,ebp
 0049E0F4    pop         ebp
 0049E0F5    ret
end;*}

//0049E0F8
{*procedure sub_0049E0F8(?:TFile3DS; ?:?);
begin
 0049E0F8    push        ebx
 0049E0F9    push        esi
 0049E0FA    mov         esi,eax
 0049E0FC    xor         ebx,ebx
 0049E0FE    movzx       eax,word ptr [edx]
 0049E101    cmp         eax,4600
>0049E106    jg          0049E325
>0049E10C    je          0049E627
 0049E112    cmp         eax,3010
>0049E117    jg          0049E222
>0049E11D    je          0049E64F
 0049E123    cmp         eax,1410
>0049E128    jg          0049E1A5
>0049E12A    je          0049E5B5
 0049E130    cmp         eax,100
>0049E135    jg          0049E174
>0049E137    je          0049E5A1
 0049E13D    cmp         eax,11
>0049E140    jg          0049E15F
>0049E142    je          0049E568
 0049E148    sub         eax,2
>0049E14B    je          0049E554
 0049E151    sub         eax,0E
>0049E154    je          0049E55E
>0049E15A    jmp         0049E769
 0049E15F    sub         eax,30
>0049E162    je          0049E572
 0049E168    dec         eax
>0049E169    je          0049E57C
>0049E16F    jmp         0049E769
 0049E174    sub         eax,1100
>0049E179    je          0049E5F8
 0049E17F    sub         eax,100
>0049E184    je          0049E76F
 0049E18A    sub         eax,100
>0049E18F    je          0049E5DD
 0049E195    sub         eax,100
>0049E19A    je          0049E5AB
>0049E1A0    jmp         0049E769
 0049E1A5    cmp         eax,2300
>0049E1AA    jg          0049E1F3
>0049E1AC    je          0049E61D
 0049E1B2    cmp         eax,1500
>0049E1B7    jg          0049E1D8
>0049E1B9    je          0049E5D3
 0049E1BF    sub         eax,1420
>0049E1C4    je          0049E5BF
 0049E1CA    sub         eax,10
>0049E1CD    je          0049E5C9
>0049E1D3    jmp         0049E769
 0049E1D8    sub         eax,2100
>0049E1DD    je          0049E76F
 0049E1E3    sub         eax,100
>0049E1E8    je          0049E609
>0049E1EE    jmp         0049E769
 0049E1F3    sub         eax,2302
>0049E1F8    je          0049E613
 0049E1FE    sub         eax,0A2B
>0049E203    je          0049E76F
 0049E209    sub         eax,10
>0049E20C    je          0049E76F
 0049E212    sub         eax,2C3
>0049E217    je          0049E76F
>0049E21D    jmp         0049E769
 0049E222    cmp         eax,3DFF
>0049E227    jg          0049E2A6
>0049E229    je          0049E76F
 0049E22F    cmp         eax,3070
>0049E234    jg          0049E27B
>0049E236    je          0049E659
 0049E23C    cmp         eax,3040
>0049E241    jg          0049E262
>0049E243    je          0049E64F
 0049E249    sub         eax,3020
>0049E24E    je          0049E64F
 0049E254    sub         eax,10
>0049E257    je          0049E64F
>0049E25D    jmp         0049E769
 0049E262    sub         eax,3050
>0049E267    je          0049E64F
 0049E26D    sub         eax,10
>0049E270    je          0049E64F
>0049E276    jmp         0049E769
 0049E27B    sub         eax,3080
>0049E280    je          0049E663
 0049E286    sub         eax,0CBD
>0049E28B    je          0049E76F
 0049E291    dec         eax
>0049E292    je          0049E597
 0049E298    sub         eax,6C
>0049E29B    je          0049E76F
>0049E2A1    jmp         0049E769
 0049E2A6    cmp         eax,4140
>0049E2AB    jg          0049E2FA
>0049E2AD    je          0049E6C6
 0049E2B3    cmp         eax,4110
>0049E2B8    jge         0049E2D5
 0049E2BA    sub         eax,4000
>0049E2BF    je          0049E5E7
 0049E2C5    sub         eax,100
>0049E2CA    je          0049E76F
>0049E2D0    jmp         0049E769
 0049E2D5    add         eax,0FFFFBEF0
 0049E2DA    sub         eax,2
>0049E2DD    jb          0049E68F
 0049E2E3    sub         eax,0E
>0049E2E6    je          0049E69A
 0049E2EC    sub         eax,10
>0049E2EF    je          0049E6B0
>0049E2F5    jmp         0049E769
 0049E2FA    sub         eax,4150
>0049E2FF    je          0049E6BB
 0049E305    sub         eax,10
>0049E308    je          0049E6D1
 0049E30E    sub         eax,10
>0049E311    je          0049E6DB
 0049E317    sub         eax,11
>0049E31A    je          0049E6E6
>0049E320    jmp         0049E769
 0049E325    cmp         eax,0A33A
>0049E32A    jg          0049E463
>0049E330    je          0049E76F
 0049E336    cmp         eax,0A040
>0049E33B    jge         0049E3CD
 0049E341    cmp         eax,8000
>0049E346    jge         0049E389
 0049E348    cmp         eax,4700
>0049E34D    jg          0049E36E
>0049E34F    je          0049E63B
 0049E355    sub         eax,4610
>0049E35A    je          0049E631
 0049E360    sub         eax,31
>0049E363    je          0049E6F4
>0049E369    jmp         0049E769
 0049E36E    sub         eax,4D4D
>0049E373    je          0049E76F
 0049E379    sub         eax,22B4
>0049E37E    je          0049E645
>0049E384    jmp         0049E769
 0049E389    cmp         eax,0A010
>0049E38E    jg          0049E3B4
>0049E390    je          0049E76F
 0049E396    add         eax,0FFFF8000
 0049E39B    sub         eax,2
>0049E39E    jb          0049E76F
 0049E3A4    sub         eax,1FFE
>0049E3A9    je          0049E674
>0049E3AF    jmp         0049E769
 0049E3B4    sub         eax,0A020
>0049E3B9    je          0049E76F
 0049E3BF    sub         eax,10
>0049E3C2    je          0049E76F
>0049E3C8    jmp         0049E769
 0049E3CD    cmp         eax,0A204
>0049E3D2    jg          0049E424
>0049E3D4    je          0049E76F
 0049E3DA    cmp         eax,0A052
>0049E3DF    jge         0049E3FD
 0049E3E1    add         eax,0FFFF5FC0
 0049E3E6    sub         eax,3
>0049E3E9    jb          0049E76F
 0049E3EF    sub         eax,0D
>0049E3F2    je          0049E76F
>0049E3F8    jmp         0049E769
 0049E3FD    add         eax,0FFFF5FAE
 0049E402    sub         eax,2
>0049E405    jb          0049E76F
 0049E40B    sub         eax,30
>0049E40E    je          0049E76F
 0049E414    sub         eax,17C
>0049E419    je          0049E76F
>0049E41F    jmp         0049E769
 0049E424    cmp         eax,0A230
>0049E429    jg          0049E44A
>0049E42B    je          0049E76F
 0049E431    sub         eax,0A210
>0049E436    je          0049E76F
 0049E43C    sub         eax,10
>0049E43F    je          0049E76F
>0049E445    jmp         0049E769
 0049E44A    sub         eax,0A300
>0049E44F    je          0049E586
 0049E455    sub         eax,10
>0049E458    je          0049E685
>0049E45E    jmp         0049E769
 0049E463    cmp         eax,0B009
>0049E468    jg          0049E4EF
>0049E46E    je          0049E71E
 0049E474    cmp         eax,0A348
>0049E479    jg          0049E4C2
>0049E47B    je          0049E76F
 0049E481    add         eax,0FFFF5CC4
 0049E486    cmp         eax,0A
>0049E489    ja          0049E769
 0049E48F    jmp         dword ptr [eax*4+49E496]
 0049E48F    dd          0049E76F
 0049E48F    dd          0049E76F
 0049E48F    dd          0049E76F
 0049E48F    dd          0049E769
 0049E48F    dd          0049E76F
 0049E48F    dd          0049E769
 0049E48F    dd          0049E76F
 0049E48F    dd          0049E769
 0049E48F    dd          0049E76F
 0049E48F    dd          0049E769
 0049E48F    dd          0049E76F
 0049E4C2    sub         eax,0A34A
>0049E4C7    je          0049E76F
 0049E4CD    sub         eax,2
>0049E4D0    je          0049E76F
 0049E4D6    add         eax,0FFFFF34D
 0049E4DB    sub         eax,9
>0049E4DE    jb          0049E76F
>0049E4E4    je          0049E717
>0049E4EA    jmp         0049E769
 0049E4EF    cmp         eax,0B014
>0049E4F4    jg          0049E525
>0049E4F6    je          0049E75B
 0049E4FC    sub         eax,0B00A
>0049E501    je          0049E6FB
 0049E507    sub         eax,6
>0049E50A    je          0049E725
 0049E510    dec         eax
>0049E511    je          0049E746
 0049E517    sub         eax,2
>0049E51A    je          0049E73F
>0049E520    jmp         0049E769
 0049E525    sub         eax,0B015
>0049E52A    je          0049E754
 0049E530    sub         eax,1B
>0049E533    je          0049E738
 0049E539    sub         eax,120D
>0049E53E    je          0049E76F
 0049E544    sub         eax,0DC3
>0049E549    je          0049E762
>0049E54F    jmp         0049E769
 0049E554    mov         ebx,4
>0049E559    jmp         0049E76F
 0049E55E    mov         ebx,0C
>0049E563    jmp         0049E76F
 0049E568    mov         ebx,3
>0049E56D    jmp         0049E76F
 0049E572    mov         ebx,2
>0049E577    jmp         0049E76F
 0049E57C    mov         ebx,4
>0049E581    jmp         0049E76F
 0049E586    mov         eax,esi
 0049E588    call        0049C020
 0049E58D    call        @FreeMem
>0049E592    jmp         0049E76F
 0049E597    mov         ebx,4
>0049E59C    jmp         0049E76F
 0049E5A1    mov         ebx,4
>0049E5A6    jmp         0049E76F
 0049E5AB    mov         ebx,4
>0049E5B0    jmp         0049E76F
 0049E5B5    mov         ebx,4
>0049E5BA    jmp         0049E76F
 0049E5BF    mov         ebx,2
>0049E5C4    jmp         0049E76F
 0049E5C9    mov         ebx,2
>0049E5CE    jmp         0049E76F
 0049E5D3    mov         ebx,0C
>0049E5D8    jmp         0049E76F
 0049E5DD    mov         ebx,4
>0049E5E2    jmp         0049E76F
 0049E5E7    mov         eax,esi
 0049E5E9    call        0049C020
 0049E5EE    call        @FreeMem
>0049E5F3    jmp         0049E76F
 0049E5F8    mov         eax,esi
 0049E5FA    call        0049C020
 0049E5FF    call        @FreeMem
>0049E604    jmp         0049E76F
 0049E609    mov         ebx,10
>0049E60E    jmp         0049E76F
 0049E613    mov         ebx,10
>0049E618    jmp         0049E76F
 0049E61D    mov         ebx,10
>0049E622    jmp         0049E76F
 0049E627    mov         ebx,0C
>0049E62C    jmp         0049E76F
 0049E631    mov         ebx,14
>0049E636    jmp         0049E76F
 0049E63B    mov         ebx,20
>0049E640    jmp         0049E76F
 0049E645    mov         ebx,0E
>0049E64A    jmp         0049E76F
 0049E64F    mov         ebx,10
>0049E654    jmp         0049E76F
 0049E659    mov         ebx,1C
>0049E65E    jmp         0049E76F
 0049E663    mov         eax,esi
 0049E665    call        0049C020
 0049E66A    call        @FreeMem
>0049E66F    jmp         0049E76F
 0049E674    mov         eax,esi
 0049E676    call        0049C020
 0049E67B    call        @FreeMem
>0049E680    jmp         0049E76F
 0049E685    mov         ebx,0C
>0049E68A    jmp         0049E76F
 0049E68F    mov         ebx,dword ptr [edx+4]
 0049E692    sub         ebx,6
>0049E695    jmp         0049E76F
 0049E69A    mov         eax,esi
 0049E69C    call        0049BFFC
 0049E6A1    movzx       eax,ax
 0049E6A4    add         eax,eax
 0049E6A6    mov         ebx,eax
 0049E6A8    shl         ebx,2
>0049E6AB    jmp         0049E76F
 0049E6B0    mov         ebx,dword ptr [edx+4]
 0049E6B3    sub         ebx,6
>0049E6B6    jmp         0049E76F
 0049E6BB    mov         ebx,dword ptr [edx+4]
 0049E6BE    sub         ebx,6
>0049E6C1    jmp         0049E76F
 0049E6C6    mov         ebx,dword ptr [edx+4]
 0049E6C9    sub         ebx,6
>0049E6CC    jmp         0049E76F
 0049E6D1    mov         ebx,30
>0049E6D6    jmp         0049E76F
 0049E6DB    mov         ebx,dword ptr [edx+4]
 0049E6DE    sub         ebx,6
>0049E6E1    jmp         0049E76F
 0049E6E6    mov         eax,esi
 0049E6E8    call        0049C020
 0049E6ED    call        @FreeMem
>0049E6F2    jmp         0049E76F
 0049E6F4    mov         ebx,0A
>0049E6F9    jmp         0049E76F
 0049E6FB    mov         eax,esi
 0049E6FD    call        0049BF9C
 0049E702    mov         eax,esi
 0049E704    call        0049C020
 0049E709    call        @FreeMem
 0049E70E    mov         eax,esi
 0049E710    call        0049BFCC
>0049E715    jmp         0049E76F
 0049E717    mov         ebx,8
>0049E71C    jmp         0049E76F
 0049E71E    mov         ebx,4
>0049E723    jmp         0049E76F
 0049E725    mov         eax,esi
 0049E727    call        0049C020
 0049E72C    call        @FreeMem
 0049E731    mov         ebx,6
>0049E736    jmp         0049E76F
 0049E738    mov         ebx,2
>0049E73D    jmp         0049E76F
 0049E73F    mov         ebx,0C
>0049E744    jmp         0049E76F
 0049E746    mov         eax,esi
 0049E748    call        0049C020
 0049E74D    call        @FreeMem
>0049E752    jmp         0049E76F
 0049E754    mov         ebx,4
>0049E759    jmp         0049E76F
 0049E75B    mov         ebx,18
>0049E760    jmp         0049E76F
 0049E762    mov         ebx,4
>0049E767    jmp         0049E76F
 0049E769    mov         ebx,dword ptr [edx+4]
 0049E76C    sub         ebx,6
 0049E76F    mov         cx,1
 0049E773    mov         edx,ebx
 0049E775    mov         eax,dword ptr [esi+1C];TFile3DS.?f1C:dword
 0049E778    mov         ebx,dword ptr [eax]
 0049E77A    call        dword ptr [ebx+14]
 0049E77D    pop         esi
 0049E77E    pop         ebx
 0049E77F    ret
end;*}

end.