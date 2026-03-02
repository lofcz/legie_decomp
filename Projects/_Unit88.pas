//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit88;

interface

uses
  SysUtils, Classes;

type
  TFaceGroupConnectivity = class(TConnectivity)
  public
    f24:dword;//f24
    f28:byte;//f28
    destructor Destroy; virtual;//0048C3D0
    constructor vC; virtual;//vC//0048C30C
    procedure v10; virtual;//v10//0048C2C8
    //constructor Create(?:?);//0048C380
  end;
  TGLBaseMeshConnectivity = class(TBaseConnectivity)
  public
    fC:TList;//fC
    destructor Destroy; virtual;//0048C820
    //function v0:?; virtual;//v0//0048C860
    //function v4:?; virtual;//v4//0048C894
    //procedure v8(?:?; ?:?); virtual;//v8//0048C7B0
    constructor vC; virtual;//vC//0048C690
    constructor Create;//0048C6E4
  end;
    procedure sub_0048C2C8;//0048C2C8
    constructor sub_0048C30C;//0048C30C
    //procedure sub_0048C348(?:?; ?:?);//0048C348
    destructor Destroy;//0048C3D0
    //procedure sub_0048C408(?:?);//0048C408
    //procedure sub_0048C630(?:TGLBaseMeshConnectivity; ?:?);//0048C630
    constructor sub_0048C690;//0048C690
    //procedure sub_0048C744(?:?; ?:?);//0048C744
    //procedure sub_0048C7B0(?:?; ?:?);//0048C7B0
    destructor Destroy;//0048C820
    //function sub_0048C858(?:TGLBaseMeshConnectivity):?;//0048C858
    //function sub_0048C860:?;//0048C860
    //function sub_0048C894:?;//0048C894
    //function sub_0048C8C8(?:TGLBaseMeshConnectivity; ?:?):?;//0048C8C8

implementation

//0048C2C8
procedure sub_0048C2C8;
begin
{*
 0048C2C8    push        ebx
 0048C2C9    mov         ebx,eax
 0048C2CB    mov         eax,dword ptr [ebx+20];TFaceGroupConnectivity.?f20:TAffineVectorList
 0048C2CE    test        eax,eax
>0048C2D0    je          0048C302
 0048C2D2    cmp         byte ptr [ebx+28],0;TFaceGroupConnectivity.?f28:byte
>0048C2D6    je          0048C2DF
 0048C2D8    call        00468280
>0048C2DD    jmp         0048C2E4
 0048C2DF    xor         eax,eax
 0048C2E1    mov         dword ptr [ebx+20],eax;TFaceGroupConnectivity.?f20:TAffineVectorList
 0048C2E4    mov         eax,ebx
 0048C2E6    call        0046ED08
 0048C2EB    cmp         byte ptr [ebx+28],0;TFaceGroupConnectivity.?f28:byte
>0048C2EF    jne         0048C309
 0048C2F1    cmp         dword ptr [ebx+24],0;TFaceGroupConnectivity.?f24:dword
>0048C2F5    je          0048C309
 0048C2F7    mov         eax,dword ptr [ebx+24];TFaceGroupConnectivity.?f24:dword
 0048C2FA    mov         eax,dword ptr [eax+0C]
 0048C2FD    mov         dword ptr [ebx+20],eax;TFaceGroupConnectivity.?f20:TAffineVectorList
 0048C300    pop         ebx
 0048C301    ret
 0048C302    mov         eax,ebx
 0048C304    call        0046ED08
 0048C309    pop         ebx
 0048C30A    ret
*}
end;

//0048C30C
constructor sub_0048C30C;
begin
{*
 0048C30C    push        ebx
 0048C30D    push        esi
 0048C30E    test        dl,dl
>0048C310    je          0048C31A
 0048C312    add         esp,0FFFFFFF0
 0048C315    call        @ClassCreate
 0048C31A    mov         ebx,edx
 0048C31C    mov         esi,eax
 0048C31E    xor         edx,edx
 0048C320    mov         eax,esi
 0048C322    call        TConnectivity.Create
 0048C327    mov         byte ptr [esi+28],1;TFaceGroupConnectivity.?f28:byte
 0048C32B    mov         eax,esi
 0048C32D    test        bl,bl
>0048C32F    je          0048C340
 0048C331    call        @AfterConstruction
 0048C336    pop         dword ptr fs:[0]
 0048C33D    add         esp,0C
 0048C340    mov         eax,esi
 0048C342    pop         esi
 0048C343    pop         ebx
 0048C344    ret
*}
end;

//0048C348
{*procedure sub_0048C348(?:?; ?:?);
begin
 0048C348    push        ebx
 0048C349    push        esi
 0048C34A    mov         esi,edx
 0048C34C    mov         ebx,eax
 0048C34E    mov         eax,ebx
 0048C350    mov         edx,dword ptr [eax]
 0048C352    call        dword ptr [edx+10]
 0048C355    mov         dword ptr [ebx+24],esi
 0048C358    cmp         byte ptr [ebx+28],0
>0048C35C    je          0048C366
 0048C35E    mov         eax,dword ptr [ebx+20]
 0048C361    call        TObject.Free
 0048C366    mov         eax,dword ptr [ebx+24]
 0048C369    mov         eax,dword ptr [eax+0C]
 0048C36C    mov         dword ptr [ebx+20],eax
 0048C36F    mov         byte ptr [ebx+28],0
 0048C373    mov         eax,ebx
 0048C375    call        0048C408
 0048C37A    pop         esi
 0048C37B    pop         ebx
 0048C37C    ret
end;*}

//0048C380
{*constructor TFaceGroupConnectivity.Create(?:?);
begin
 0048C380    push        ebp
 0048C381    mov         ebp,esp
 0048C383    push        ecx
 0048C384    push        ebx
 0048C385    push        esi
 0048C386    push        edi
 0048C387    test        dl,dl
>0048C389    je          0048C393
 0048C38B    add         esp,0FFFFFFF0
 0048C38E    call        @ClassCreate
 0048C393    mov         esi,ecx
 0048C395    mov         byte ptr [ebp-1],dl
 0048C398    mov         ebx,eax
 0048C39A    mov         cl,byte ptr [ebp+8]
 0048C39D    xor         edx,edx
 0048C39F    mov         eax,ebx
 0048C3A1    mov         edi,dword ptr [eax]
 0048C3A3    call        dword ptr [edi+0C]
 0048C3A6    mov         edx,esi
 0048C3A8    mov         eax,ebx
 0048C3AA    call        0048C348
 0048C3AF    mov         eax,ebx
 0048C3B1    cmp         byte ptr [ebp-1],0
>0048C3B5    je          0048C3C6
 0048C3B7    call        @AfterConstruction
 0048C3BC    pop         dword ptr fs:[0]
 0048C3C3    add         esp,0C
 0048C3C6    mov         eax,ebx
 0048C3C8    pop         edi
 0048C3C9    pop         esi
 0048C3CA    pop         ebx
 0048C3CB    pop         ecx
 0048C3CC    pop         ebp
 0048C3CD    ret         4
end;*}

//0048C3D0
destructor TFaceGroupConnectivity.Destroy;
begin
{*
 0048C3D0    push        ebx
 0048C3D1    push        esi
 0048C3D2    call        @BeforeDestruction
 0048C3D7    mov         ebx,edx
 0048C3D9    mov         esi,eax
 0048C3DB    cmp         byte ptr [esi+28],0;TFaceGroupConnectivity.?f28:byte
>0048C3DF    je          0048C3E9
 0048C3E1    mov         eax,dword ptr [esi+20];TFaceGroupConnectivity.?f20:TAffineVectorList
 0048C3E4    call        TObject.Free
 0048C3E9    xor         eax,eax
 0048C3EB    mov         dword ptr [esi+20],eax;TFaceGroupConnectivity.?f20:TAffineVectorList
 0048C3EE    mov         edx,ebx
 0048C3F0    and         dl,0FC
 0048C3F3    mov         eax,esi
 0048C3F5    call        TConnectivity.Destroy
 0048C3FA    test        bl,bl
>0048C3FC    jle         0048C405
 0048C3FE    mov         eax,esi
 0048C400    call        @ClassDestroy
 0048C405    pop         esi
 0048C406    pop         ebx
 0048C407    ret
*}
end;

//0048C408
{*procedure sub_0048C408(?:?);
begin
 0048C408    push        ebx
 0048C409    push        esi
 0048C40A    push        edi
 0048C40B    push        ebp
 0048C40C    add         esp,0FFFFFFF4
 0048C40F    mov         edi,eax
 0048C411    mov         eax,edi
 0048C413    mov         edx,dword ptr [eax]
 0048C415    call        dword ptr [edx+10]
 0048C418    mov         eax,dword ptr [edi+24]
 0048C41B    mov         eax,dword ptr [eax+28]
 0048C41E    mov         eax,dword ptr [eax+0C]
 0048C421    dec         eax
 0048C422    test        eax,eax
>0048C424    jl          0048C582
 0048C42A    inc         eax
 0048C42B    mov         dword ptr [esp+8],eax
 0048C42F    mov         dword ptr [esp],0
 0048C436    mov         eax,dword ptr [edi+24]
 0048C439    mov         eax,dword ptr [eax+28]
 0048C43C    mov         edx,dword ptr [esp]
 0048C43F    call        004941BC
 0048C444    mov         edx,dword ptr ds:[48D6E4];TFGVertexIndexList
 0048C44A    call        @IsClass
 0048C44F    test        al,al
>0048C451    jne         0048C467
 0048C453    mov         ecx,94
 0048C458    mov         edx,48C594;'C:\GLScene\glscene_v_1000714\Source\GLBaseMeshSilhouette.pas'
 0048C45D    mov         eax,48C5DC;'Method only works for descendants of TFGVertexIndexList.'
 0048C462    call        @Assert
 0048C467    mov         eax,dword ptr [edi+24]
 0048C46A    mov         eax,dword ptr [eax+28]
 0048C46D    mov         edx,dword ptr [esp]
 0048C470    call        004941BC
 0048C475    mov         dword ptr [esp+4],eax
 0048C479    mov         eax,dword ptr [esp+4]
 0048C47D    mov         al,byte ptr [eax+20]
 0048C480    sub         al,1
>0048C482    jb          0048C497
>0048C484    je          0048C4DC
 0048C486    dec         al
>0048C488    je          0048C497
 0048C48A    dec         al
>0048C48C    je          0048C531
>0048C492    jmp         0048C561
 0048C497    mov         eax,dword ptr [esp+4]
 0048C49B    mov         si,0FFF3
 0048C49F    call        @CallDynaInst
 0048C4A4    mov         esi,eax
 0048C4A6    dec         esi
 0048C4A7    test        esi,esi
>0048C4A9    jl          0048C575
 0048C4AF    inc         esi
 0048C4B0    xor         ebp,ebp
 0048C4B2    lea         eax,[ebp+ebp*2]
 0048C4B6    mov         edx,dword ptr [esp+4]
 0048C4BA    mov         edx,dword ptr [edx+1C]
 0048C4BD    mov         edx,dword ptr [edx+24]
 0048C4C0    lea         ebx,[edx+eax*4]
 0048C4C3    mov         eax,dword ptr [ebx+8]
 0048C4C6    push        eax
 0048C4C7    mov         ecx,dword ptr [ebx+4]
 0048C4CA    mov         edx,dword ptr [ebx]
 0048C4CC    mov         eax,edi
 0048C4CE    call        0046F0EC
 0048C4D3    inc         ebp
 0048C4D4    dec         esi
>0048C4D5    jne         0048C4B2
>0048C4D7    jmp         0048C575
 0048C4DC    mov         eax,dword ptr [esp+4]
 0048C4E0    mov         eax,dword ptr [eax+1C]
 0048C4E3    mov         esi,dword ptr [eax+8]
 0048C4E6    sub         esi,3
 0048C4E9    test        esi,esi
>0048C4EB    jl          0048C575
 0048C4F1    inc         esi
 0048C4F2    xor         ebp,ebp
 0048C4F4    mov         eax,dword ptr [esp+4]
 0048C4F8    mov         eax,dword ptr [eax+1C]
 0048C4FB    mov         eax,dword ptr [eax+24]
 0048C4FE    lea         ebx,[eax+ebp*4]
 0048C501    test        ebp,1
>0048C507    jne         0048C51B
 0048C509    mov         eax,dword ptr [ebx+8]
 0048C50C    push        eax
 0048C50D    mov         ecx,dword ptr [ebx+4]
 0048C510    mov         edx,dword ptr [ebx]
 0048C512    mov         eax,edi
 0048C514    call        0046F0EC
>0048C519    jmp         0048C52B
 0048C51B    mov         eax,dword ptr [ebx]
 0048C51D    push        eax
 0048C51E    mov         ecx,dword ptr [ebx+4]
 0048C521    mov         edx,dword ptr [ebx+8]
 0048C524    mov         eax,edi
 0048C526    call        0046F0EC
 0048C52B    inc         ebp
 0048C52C    dec         esi
>0048C52D    jne         0048C4F4
>0048C52F    jmp         0048C575
 0048C531    mov         eax,dword ptr [esp+4]
 0048C535    mov         eax,dword ptr [eax+1C]
 0048C538    mov         ebx,dword ptr [eax+24]
 0048C53B    mov         esi,dword ptr [eax+8]
 0048C53E    dec         esi
 0048C53F    sub         esi,2
>0048C542    jl          0048C575
 0048C544    inc         esi
 0048C545    mov         ebp,2
 0048C54A    mov         eax,dword ptr [ebx+ebp*4]
 0048C54D    push        eax
 0048C54E    mov         ecx,dword ptr [ebx+ebp*4-4]
 0048C552    mov         edx,dword ptr [ebx]
 0048C554    mov         eax,edi
 0048C556    call        0046F0EC
 0048C55B    inc         ebp
 0048C55C    dec         esi
>0048C55D    jne         0048C54A
>0048C55F    jmp         0048C575
 0048C561    mov         ecx,0B3
 0048C566    mov         edx,48C594;'C:\GLScene\glscene_v_1000714\Source\GLBaseMeshSilhouette.pas'
 0048C56B    mov         eax,48C620;'Not supported'
 0048C570    call        @Assert
 0048C575    inc         dword ptr [esp]
 0048C578    dec         dword ptr [esp+8]
>0048C57C    jne         0048C436
 0048C582    add         esp,0C
 0048C585    pop         ebp
 0048C586    pop         edi
 0048C587    pop         esi
 0048C588    pop         ebx
 0048C589    ret
end;*}

//0048C630
{*procedure sub_0048C630(?:TGLBaseMeshConnectivity; ?:?);
begin
 0048C630    push        ebx
 0048C631    push        esi
 0048C632    push        edi
 0048C633    mov         edi,eax
 0048C635    test        dl,dl
>0048C637    je          0048C65E
 0048C639    mov         eax,edi
 0048C63B    call        0048C858
 0048C640    mov         ebx,eax
 0048C642    dec         ebx
 0048C643    test        ebx,ebx
>0048C645    jl          0048C689
 0048C647    inc         ebx
 0048C648    xor         esi,esi
 0048C64A    mov         edx,esi
 0048C64C    mov         eax,edi
 0048C64E    call        0048C8C8
 0048C653    mov         edx,dword ptr [eax]
 0048C655    call        dword ptr [edx+10]
 0048C658    inc         esi
 0048C659    dec         ebx
>0048C65A    jne         0048C64A
>0048C65C    jmp         0048C689
 0048C65E    mov         eax,edi
 0048C660    call        0048C858
 0048C665    mov         ebx,eax
 0048C667    dec         ebx
 0048C668    test        ebx,ebx
>0048C66A    jl          0048C681
 0048C66C    inc         ebx
 0048C66D    xor         esi,esi
 0048C66F    mov         edx,esi
 0048C671    mov         eax,edi
 0048C673    call        0048C8C8
 0048C678    call        TObject.Free
 0048C67D    inc         esi
 0048C67E    dec         ebx
>0048C67F    jne         0048C66F
 0048C681    mov         eax,dword ptr [edi+0C]
 0048C684    mov         edx,dword ptr [eax]
 0048C686    call        dword ptr [edx+8]
 0048C689    pop         edi
 0048C68A    pop         esi
 0048C68B    pop         ebx
 0048C68C    ret
end;*}

//0048C690
constructor sub_0048C690;
begin
{*
 0048C690    push        ebp
 0048C691    mov         ebp,esp
 0048C693    push        ecx
 0048C694    push        ebx
 0048C695    push        esi
 0048C696    test        dl,dl
>0048C698    je          0048C6A2
 0048C69A    add         esp,0FFFFFFF0
 0048C69D    call        @ClassCreate
 0048C6A2    mov         ebx,ecx
 0048C6A4    mov         byte ptr [ebp-1],dl
 0048C6A7    mov         esi,eax
 0048C6A9    mov         dl,1
 0048C6AB    mov         eax,[00417CEC];TList
 0048C6B0    call        TObject.Create;TList.Create
 0048C6B5    mov         dword ptr [esi+0C],eax;TGLBaseMeshConnectivity.?fC:TList
 0048C6B8    mov         ecx,ebx
 0048C6BA    xor         edx,edx
 0048C6BC    mov         eax,esi
 0048C6BE    call        0046EBC8
 0048C6C3    mov         eax,esi
 0048C6C5    cmp         byte ptr [ebp-1],0
>0048C6C9    je          0048C6DA
 0048C6CB    call        @AfterConstruction
 0048C6D0    pop         dword ptr fs:[0]
 0048C6D7    add         esp,0C
 0048C6DA    mov         eax,esi
 0048C6DC    pop         esi
 0048C6DD    pop         ebx
 0048C6DE    pop         ecx
 0048C6DF    pop         ebp
 0048C6E0    ret
*}
end;

//0048C6E4
constructor TGLBaseMeshConnectivity.Create;
begin
{*
 0048C6E4    push        ebp
 0048C6E5    mov         ebp,esp
 0048C6E7    push        ecx
 0048C6E8    push        ebx
 0048C6E9    push        esi
 0048C6EA    push        edi
 0048C6EB    test        dl,dl
>0048C6ED    je          0048C6F7
 0048C6EF    add         esp,0FFFFFFF0
 0048C6F2    call        @ClassCreate
 0048C6F7    mov         esi,ecx
 0048C6F9    mov         byte ptr [ebp-1],dl
 0048C6FC    mov         ebx,eax
 0048C6FE    mov         eax,esi
 0048C700    mov         edx,dword ptr ds:[48E564];TGLActor
 0048C706    call        @IsClass
 0048C70B    mov         ecx,eax
 0048C70D    xor         cl,1
 0048C710    xor         edx,edx
 0048C712    mov         eax,ebx
 0048C714    mov         edi,dword ptr [eax]
 0048C716    call        dword ptr [edi+0C]
 0048C719    mov         edx,esi
 0048C71B    mov         eax,ebx
 0048C71D    call        0048C744
 0048C722    mov         eax,ebx
 0048C724    cmp         byte ptr [ebp-1],0
>0048C728    je          0048C739
 0048C72A    call        @AfterConstruction
 0048C72F    pop         dword ptr fs:[0]
 0048C736    add         esp,0C
 0048C739    mov         eax,ebx
 0048C73B    pop         edi
 0048C73C    pop         esi
 0048C73D    pop         ebx
 0048C73E    pop         ecx
 0048C73F    pop         ebp
 0048C740    ret
*}
end;

//0048C744
{*procedure sub_0048C744(?:?; ?:?);
begin
 0048C744    push        ebx
 0048C745    push        esi
 0048C746    push        edi
 0048C747    push        ebp
 0048C748    mov         edi,edx
 0048C74A    mov         ebx,eax
 0048C74C    xor         edx,edx
 0048C74E    mov         eax,ebx
 0048C750    call        0048C630
 0048C755    mov         dword ptr [ebx+8],edi
 0048C758    mov         eax,edi
 0048C75A    mov         edx,dword ptr ds:[48E564];TGLActor
 0048C760    call        @IsClass
 0048C765    xor         al,1
 0048C767    mov         byte ptr [ebx+4],al
 0048C76A    mov         dword ptr [ebx+8],edi
 0048C76D    mov         eax,dword ptr [edi+0C8]
 0048C773    mov         esi,dword ptr [eax+0C]
 0048C776    dec         esi
 0048C777    test        esi,esi
>0048C779    jl          0048C7AB
 0048C77B    inc         esi
 0048C77C    xor         ebp,ebp
 0048C77E    mov         eax,dword ptr [edi+0C8]
 0048C784    mov         edx,ebp
 0048C786    call        00492124
 0048C78B    mov         dl,byte ptr [ebx+4]
 0048C78E    push        edx
 0048C78F    mov         ecx,eax
 0048C791    mov         dl,1
 0048C793    mov         eax,[0048C1DC];TFaceGroupConnectivity
 0048C798    call        TFaceGroupConnectivity.Create;TFaceGroupConnectivity.Create
 0048C79D    mov         edx,eax
 0048C79F    mov         eax,dword ptr [ebx+0C]
 0048C7A2    call        TList.Add
 0048C7A7    inc         ebp
 0048C7A8    dec         esi
>0048C7A9    jne         0048C77E
 0048C7AB    pop         ebp
 0048C7AC    pop         edi
 0048C7AD    pop         esi
 0048C7AE    pop         ebx
 0048C7AF    ret
end;*}

//0048C7B0
{*procedure sub_0048C7B0(?:?; ?:?);
begin
 0048C7B0    push        ebp
 0048C7B1    mov         ebp,esp
 0048C7B3    add         esp,0FFFFFFF4
 0048C7B6    push        ebx
 0048C7B7    push        esi
 0048C7B8    push        edi
 0048C7B9    mov         dword ptr [ebp-0C],ecx
 0048C7BC    mov         dword ptr [ebp-8],edx
 0048C7BF    mov         dword ptr [ebp-4],eax
 0048C7C2    mov         eax,dword ptr [ebp-0C]
 0048C7C5    cmp         dword ptr [eax],0
>0048C7C8    jne         0048C7DD
 0048C7CA    mov         dl,1
 0048C7CC    mov         eax,[0046E9C4];TGLSilhouette
 0048C7D1    call        TGLSilhouette.Create;TGLSilhouette.Create
 0048C7D6    mov         edx,dword ptr [ebp-0C]
 0048C7D9    mov         dword ptr [edx],eax
>0048C7DB    jmp         0048C7E7
 0048C7DD    mov         eax,dword ptr [ebp-0C]
 0048C7E0    mov         eax,dword ptr [eax]
 0048C7E2    call        0046EBA8
 0048C7E7    mov         eax,dword ptr [ebp-4]
 0048C7EA    call        0048C858
 0048C7EF    mov         ebx,eax
 0048C7F1    dec         ebx
 0048C7F2    test        ebx,ebx
>0048C7F4    jl          0048C814
 0048C7F6    inc         ebx
 0048C7F7    xor         esi,esi
 0048C7F9    push        1
 0048C7FB    mov         edx,esi
 0048C7FD    mov         eax,dword ptr [ebp-4]
 0048C800    call        0048C8C8
 0048C805    mov         ecx,dword ptr [ebp-0C]
 0048C808    mov         edx,dword ptr [ebp-8]
 0048C80B    mov         edi,dword ptr [eax]
 0048C80D    call        dword ptr [edi+8]
 0048C810    inc         esi
 0048C811    dec         ebx
>0048C812    jne         0048C7F9
 0048C814    pop         edi
 0048C815    pop         esi
 0048C816    pop         ebx
 0048C817    mov         esp,ebp
 0048C819    pop         ebp
 0048C81A    ret         4
end;*}

//0048C820
destructor TGLBaseMeshConnectivity.Destroy;
begin
{*
 0048C820    push        ebx
 0048C821    push        esi
 0048C822    call        @BeforeDestruction
 0048C827    mov         ebx,edx
 0048C829    mov         esi,eax
 0048C82B    xor         edx,edx
 0048C82D    mov         eax,esi
 0048C82F    call        0048C630
 0048C834    mov         eax,dword ptr [esi+0C];TGLBaseMeshConnectivity.?fC:TList
 0048C837    call        TObject.Free
 0048C83C    mov         edx,ebx
 0048C83E    and         dl,0FC
 0048C841    mov         eax,esi
 0048C843    call        TObject.Destroy
 0048C848    test        bl,bl
>0048C84A    jle         0048C853
 0048C84C    mov         eax,esi
 0048C84E    call        @ClassDestroy
 0048C853    pop         esi
 0048C854    pop         ebx
 0048C855    ret
*}
end;

//0048C858
{*function sub_0048C858(?:TGLBaseMeshConnectivity):?;
begin
 0048C858    mov         eax,dword ptr [eax+0C];TGLBaseMeshConnectivity.?fC:TList
 0048C85B    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 0048C85E    ret
end;*}

//0048C860
{*function sub_0048C860:?;
begin
 0048C860    push        ebx
 0048C861    push        esi
 0048C862    push        edi
 0048C863    push        ebp
 0048C864    mov         edi,eax
 0048C866    xor         ebp,ebp
 0048C868    mov         eax,edi
 0048C86A    call        0048C858
 0048C86F    mov         ebx,eax
 0048C871    dec         ebx
 0048C872    test        ebx,ebx
>0048C874    jl          0048C88C
 0048C876    inc         ebx
 0048C877    xor         esi,esi
 0048C879    mov         edx,esi
 0048C87B    mov         eax,edi
 0048C87D    call        0048C8C8
 0048C882    mov         edx,dword ptr [eax]
 0048C884    call        dword ptr [edx]
 0048C886    add         ebp,eax
 0048C888    inc         esi
 0048C889    dec         ebx
>0048C88A    jne         0048C879
 0048C88C    mov         eax,ebp
 0048C88E    pop         ebp
 0048C88F    pop         edi
 0048C890    pop         esi
 0048C891    pop         ebx
 0048C892    ret
end;*}

//0048C894
{*function sub_0048C894:?;
begin
 0048C894    push        ebx
 0048C895    push        esi
 0048C896    push        edi
 0048C897    push        ebp
 0048C898    mov         edi,eax
 0048C89A    xor         ebp,ebp
 0048C89C    mov         eax,edi
 0048C89E    call        0048C858
 0048C8A3    mov         ebx,eax
 0048C8A5    dec         ebx
 0048C8A6    test        ebx,ebx
>0048C8A8    jl          0048C8C1
 0048C8AA    inc         ebx
 0048C8AB    xor         esi,esi
 0048C8AD    mov         edx,esi
 0048C8AF    mov         eax,edi
 0048C8B1    call        0048C8C8
 0048C8B6    mov         edx,dword ptr [eax]
 0048C8B8    call        dword ptr [edx+4]
 0048C8BB    add         ebp,eax
 0048C8BD    inc         esi
 0048C8BE    dec         ebx
>0048C8BF    jne         0048C8AD
 0048C8C1    mov         eax,ebp
 0048C8C3    pop         ebp
 0048C8C4    pop         edi
 0048C8C5    pop         esi
 0048C8C6    pop         ebx
 0048C8C7    ret
end;*}

//0048C8C8
{*function sub_0048C8C8(?:TGLBaseMeshConnectivity; ?:?):?;
begin
 0048C8C8    push        ebx
 0048C8C9    push        esi
 0048C8CA    mov         esi,edx
 0048C8CC    mov         ebx,eax
 0048C8CE    mov         edx,esi
 0048C8D0    mov         eax,dword ptr [ebx+0C];TGLBaseMeshConnectivity.?fC:TList
 0048C8D3    call        TList.Get
 0048C8D8    pop         esi
 0048C8D9    pop         ebx
 0048C8DA    ret
end;*}

end.