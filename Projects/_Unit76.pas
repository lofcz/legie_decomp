//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit76;

interface

uses
  SysUtils, Classes;

type
  TGLAntiAliasing = (aaDefault, aaNone, aa2x, aa2xHQ, aa4x, aa4xHQ);
  TGLContext = class(TObject)
  public
    f4:byte;//f4
    f8:byte;//f8
    fC:byte;//fC
    f10:byte;//f10
    f14:byte;//f14
    f18:byte;//f18
    f1C:byte;//f1C
    f1D:byte;//f1D
    f30:TList;//f30
    f34:TList;//f34
    f38:byte;//f38
    destructor Destroy; virtual;//0046C484
    procedure v0; virtual; abstract;//v0//00402BEC
    procedure v4; virtual; abstract;//v4//00402BEC
    constructor v8; virtual;//v8//0046C3FC
    procedure vC; virtual; abstract;//vC//00402BEC
    procedure v10; virtual; abstract;//v10//00402BEC
    procedure v14; virtual; abstract;//v14//00402BEC
    procedure @AbstractError; dynamic;//00402BEC
  end;
  TGLContextHandle = class(TObject)
  public
    f4:dword;//f4
    f8:dword;//f8
    destructor Destroy; virtual;//0046CEBC
    //function v0:?; virtual;//v0//0046D0A4
    procedure v4; virtual; abstract;//v4//00402BEC
    procedure v8; virtual; abstract;//v8//00402BEC
    constructor Create; virtual;//vC//0046CE84
  end;
  TGLVirtualHandle = class(TGLContextHandle)
  public
    //f10:?;//f10
    f12:word;//f12
    f14:dword;//f14
    //f18:?;//f18
    f1A:word;//f1A
    f1C:dword;//f1C
    //function v4:?; virtual;//v4//0046D0A8
    procedure v8; virtual;//v8//0046D0C8
  end;
  TGLListHandle = class(TGLContextHandle)
  public
    procedure v4; virtual;//v4//0046D0F4
    procedure v8; virtual;//v8//0046D0FC
  end;
  TGLTextureHandle = class(TGLContextHandle)
  public
    //function v4:?; virtual;//v4//0046D120
    procedure v8; virtual;//v8//0046D130
  end;
  .71 = array of ?;
//elSize = 10;
  TGLContextManager = class(TObject)
  public
    fC:.71;//fC
    constructor Create;//0046D160
  end;
  EGLContext = class(Exception)
  end;
  EOpenGLError = class(Exception)
  end;
    //function sub_0046C2FC:?;//0046C2FC
    procedure sub_0046C304;//0046C304
    procedure sub_0046C3B8;//0046C3B8
    procedure sub_0046C3D0(?:TGLWin32Context);//0046C3D0
    constructor sub_0046C3FC;//0046C3FC
    destructor Destroy;//0046C484
    //procedure sub_0046C4D8(?:?; ?:?);//0046C4D8
    //procedure sub_0046C544(?:?; ?:?);//0046C544
    //procedure sub_0046C5B0(?:?; ?:?);//0046C5B0
    //procedure sub_0046C61C(?:?; ?:?);//0046C61C
    //procedure sub_0046C688(?:?; ?:?);//0046C688
    //procedure sub_0046C6F4(?:?; ?:?);//0046C6F4
    //procedure sub_0046C760(?:?; ?:?);//0046C760
    //procedure sub_0046C7D8(?:?; ?:?);//0046C7D8
    //function sub_0046C844(?:?):Boolean;//0046C844
    //procedure sub_0046C84C(?:?; ?:?);//0046C84C
    //procedure sub_0046C878(?:?; ?:?);//0046C878
    //procedure sub_0046C904(?:?; ?:?; ?:?; ?:?);//0046C904
    //procedure sub_0046C99C(?:?);//0046C99C
    //procedure sub_0046CA18(?:?; ?:?);//0046CA18
    //procedure sub_0046CAB0(?:?);//0046CAB0
    procedure sub_0046CC00(?:dword);//0046CC00
    procedure sub_0046CD1C(?:dword);//0046CD1C
    //function sub_0046CE44(?:?):?;//0046CE44
    constructor Create;//0046CE84
    destructor Destroy;//0046CEBC
    procedure sub_0046CEE8(?:TGLListHandle);//0046CEE8
    procedure sub_0046CFA8(?:TGLContextHandle);//0046CFA8
    procedure sub_0046D088(?:Pointer);//0046D088
    //function sub_0046D0A4:?;//0046D0A4
    //function sub_0046D0A8:?;//0046D0A8
    procedure sub_0046D0C8;//0046D0C8
    procedure sub_0046D0F4;//0046D0F4
    procedure sub_0046D0FC;//0046D0FC
    //function sub_0046D120:?;//0046D120
    procedure sub_0046D130;//0046D130
    //function sub_0046D1D4(?:?):?;//0046D1D4
    //procedure sub_0046D208(?:?);//0046D208
    //procedure sub_0046D214(?:?);//0046D214
    //function sub_0046D220(?:?):?;//0046D220
    //procedure sub_0046D23C(?:?; ?:TGLContext);//0046D23C
    //procedure sub_0046D2F4(?:?; ?:?);//0046D2F4
    //procedure sub_0046D3AC(?:?);//0046D3AC
    //procedure sub_0046D3F0(?:?);//0046D3F0
    //procedure sub_0046D4A0(?:?);//0046D4A0

implementation

//0046C2FC
{*function sub_0046C2FC:?;
begin
 0046C2FC    mov         eax,[005E14AC];gvar_005E14AC
 0046C301    ret
end;*}

//0046C304
procedure sub_0046C304;
begin
{*
 0046C304    push        ebp
 0046C305    mov         ebp,esp
 0046C307    add         esp,0FFFFFFF8
 0046C30A    push        ebx
 0046C30B    push        esi
 0046C30C    push        edi
 0046C30D    xor         eax,eax
 0046C30F    mov         dword ptr [ebp-8],eax
 0046C312    xor         eax,eax
 0046C314    push        ebp
 0046C315    push        46C3AA
 0046C31A    push        dword ptr fs:[eax]
 0046C31D    mov         dword ptr fs:[eax],esp
 0046C320    call        OpenGL32.glGetError
 0046C325    mov         dword ptr [ebp-4],eax
 0046C328    cmp         dword ptr [ebp-4],0
>0046C32C    je          0046C394
 0046C32E    xor         ebx,ebx
 0046C330    xor         eax,eax
 0046C332    push        ebp
 0046C333    push        46C35A
 0046C338    push        dword ptr fs:[eax]
 0046C33B    mov         dword ptr fs:[eax],esp
>0046C33E    jmp         0046C341
 0046C340    inc         ebx
 0046C341    call        OpenGL32.glGetError
 0046C346    test        eax,eax
>0046C348    je          0046C350
 0046C34A    cmp         bx,6
>0046C34E    jb          0046C340
 0046C350    xor         eax,eax
 0046C352    pop         edx
 0046C353    pop         ecx
 0046C354    pop         ecx
 0046C355    mov         dword ptr fs:[eax],edx
>0046C358    jmp         0046C364
>0046C35A    jmp         @HandleAnyException
 0046C35F    call        @DoneExcept
 0046C364    cmp         byte ptr ds:[5AD1E4],0;gvar_005AD1E4
>0046C36B    jne         0046C394
 0046C36D    mov         eax,dword ptr [ebp-4]
 0046C370    push        eax
 0046C371    call        GLU32.gluErrorString
 0046C376    mov         edx,eax
 0046C378    lea         eax,[ebp-8]
 0046C37B    call        @LStrFromPChar
 0046C380    mov         ecx,dword ptr [ebp-8]
 0046C383    mov         dl,1
 0046C385    mov         eax,[0046C278];EOpenGLError
 0046C38A    call        Exception.Create;EOpenGLError.Create
 0046C38F    call        @RaiseExcept
 0046C394    xor         eax,eax
 0046C396    pop         edx
 0046C397    pop         ecx
 0046C398    pop         ecx
 0046C399    mov         dword ptr fs:[eax],edx
 0046C39C    push        46C3B1
 0046C3A1    lea         eax,[ebp-8]
 0046C3A4    call        @LStrClr
 0046C3A9    ret
>0046C3AA    jmp         @HandleFinally
>0046C3AF    jmp         0046C3A1
 0046C3B1    pop         edi
 0046C3B2    pop         esi
 0046C3B3    pop         ebx
 0046C3B4    pop         ecx
 0046C3B5    pop         ecx
 0046C3B6    pop         ebp
 0046C3B7    ret
*}
end;

//0046C3B8
procedure sub_0046C3B8;
begin
{*
 0046C3B8    push        ebx
 0046C3B9    xor         ebx,ebx
>0046C3BB    jmp         0046C3BE
 0046C3BD    inc         ebx
 0046C3BE    call        OpenGL32.glGetError
 0046C3C3    test        eax,eax
>0046C3C5    je          0046C3CC
 0046C3C7    cmp         ebx,6
>0046C3CA    jl          0046C3BD
 0046C3CC    pop         ebx
 0046C3CD    ret
*}
end;

//0046C3D0
procedure sub_0046C3D0(?:TGLWin32Context);
begin
{*
 0046C3D0    push        ebx
 0046C3D1    mov         ebx,eax
 0046C3D3    cmp         dword ptr ds:[5AD1E8],0;gvar_005AD1E8:TList
>0046C3DA    jne         0046C3ED
 0046C3DC    mov         dl,1
 0046C3DE    mov         eax,[00417CEC];TList
 0046C3E3    call        TObject.Create;TList.Create
 0046C3E8    mov         [005AD1E8],eax;gvar_005AD1E8:TList
 0046C3ED    mov         edx,ebx
 0046C3EF    mov         eax,[005AD1E8];0x0 gvar_005AD1E8:TList
 0046C3F4    call        TList.Add
 0046C3F9    pop         ebx
 0046C3FA    ret
*}
end;

//0046C3FC
constructor sub_0046C3FC;
begin
{*
 0046C3FC    push        ebx
 0046C3FD    push        esi
 0046C3FE    test        dl,dl
>0046C400    je          0046C40A
 0046C402    add         esp,0FFFFFFF0
 0046C405    call        @ClassCreate
 0046C40A    mov         ebx,edx
 0046C40C    mov         esi,eax
 0046C40E    xor         edx,edx
 0046C410    mov         eax,esi
 0046C412    call        TObject.Create
 0046C417    mov         dword ptr [esi+4],20;TGLContext.?f4:byte
 0046C41E    xor         eax,eax
 0046C420    mov         dword ptr [esi+10],eax;TGLContext.?f10:byte
 0046C423    xor         eax,eax
 0046C425    mov         dword ptr [esi+14],eax;TGLContext.?f14:byte
 0046C428    xor         eax,eax
 0046C42A    mov         dword ptr [esi+18],eax;TGLContext.?f18:byte
 0046C42D    mov         al,[0046C480];0x0 gvar_0046C480
 0046C432    mov         byte ptr [esi+1D],al;TGLContext.?f1D:byte
 0046C435    mov         dl,1
 0046C437    mov         eax,[00417CEC];TList
 0046C43C    call        TObject.Create;TList.Create
 0046C441    mov         dword ptr [esi+30],eax;TGLContext.?f30:TList
 0046C444    mov         dl,1
 0046C446    mov         eax,[00417CEC];TList
 0046C44B    call        TObject.Create;TList.Create
 0046C450    mov         dword ptr [esi+34],eax;TGLContext.?f34:TList
 0046C453    mov         byte ptr [esi+38],0;TGLContext.?f38:byte
 0046C457    mov         edx,esi
 0046C459    mov         eax,[005E14A4];gvar_005E14A4:TGLContextManager
 0046C45E    call        0046D23C
 0046C463    mov         eax,esi
 0046C465    test        bl,bl
>0046C467    je          0046C478
 0046C469    call        @AfterConstruction
 0046C46E    pop         dword ptr fs:[0]
 0046C475    add         esp,0C
 0046C478    mov         eax,esi
 0046C47A    pop         esi
 0046C47B    pop         ebx
 0046C47C    ret
*}
end;

//0046C484
destructor TGLContext.Destroy;
begin
{*
 0046C484    push        ebx
 0046C485    push        esi
 0046C486    call        @BeforeDestruction
 0046C48B    mov         ebx,edx
 0046C48D    mov         esi,eax
 0046C48F    mov         eax,esi
 0046C491    mov         edx,dword ptr [eax]
 0046C493    call        dword ptr [edx+0C]
 0046C496    test        al,al
>0046C498    je          0046C4A1
 0046C49A    mov         eax,esi
 0046C49C    call        0046CAB0
 0046C4A1    mov         edx,esi
 0046C4A3    mov         eax,[005E14A4];gvar_005E14A4:TGLContextManager
 0046C4A8    call        0046D2F4
 0046C4AD    mov         eax,dword ptr [esi+34]
 0046C4B0    call        TObject.Free
 0046C4B5    mov         eax,dword ptr [esi+30]
 0046C4B8    call        TObject.Free
 0046C4BD    mov         edx,ebx
 0046C4BF    and         dl,0FC
 0046C4C2    mov         eax,esi
 0046C4C4    call        TObject.Destroy
 0046C4C9    test        bl,bl
>0046C4CB    jle         0046C4D4
 0046C4CD    mov         eax,esi
 0046C4CF    call        @ClassDestroy
 0046C4D4    pop         esi
 0046C4D5    pop         ebx
 0046C4D6    ret
*}
end;

//0046C4D8
{*procedure sub_0046C4D8(?:?; ?:?);
begin
 0046C4D8    push        ebp
 0046C4D9    mov         ebp,esp
 0046C4DB    push        0
 0046C4DD    push        ebx
 0046C4DE    push        esi
 0046C4DF    mov         esi,edx
 0046C4E1    mov         ebx,eax
 0046C4E3    xor         eax,eax
 0046C4E5    push        ebp
 0046C4E6    push        46C538
 0046C4EB    push        dword ptr fs:[eax]
 0046C4EE    mov         dword ptr fs:[eax],esp
 0046C4F1    mov         eax,ebx
 0046C4F3    call        0046C844
 0046C4F8    test        al,al
>0046C4FA    je          0046C51F
 0046C4FC    lea         edx,[ebp-4]
 0046C4FF    mov         eax,46C2D4;^gvar_005AF664
 0046C504    call        LoadStr
 0046C509    mov         ecx,dword ptr [ebp-4]
 0046C50C    mov         dl,1
 0046C50E    mov         eax,[0046C220];EGLContext
 0046C513    call        Exception.Create;EGLContext.Create
 0046C518    call        @RaiseExcept
>0046C51D    jmp         0046C522
 0046C51F    mov         dword ptr [ebx+4],esi
 0046C522    xor         eax,eax
 0046C524    pop         edx
 0046C525    pop         ecx
 0046C526    pop         ecx
 0046C527    mov         dword ptr fs:[eax],edx
 0046C52A    push        46C53F
 0046C52F    lea         eax,[ebp-4]
 0046C532    call        @LStrClr
 0046C537    ret
>0046C538    jmp         @HandleFinally
>0046C53D    jmp         0046C52F
 0046C53F    pop         esi
 0046C540    pop         ebx
 0046C541    pop         ecx
 0046C542    pop         ebp
 0046C543    ret
end;*}

//0046C544
{*procedure sub_0046C544(?:?; ?:?);
begin
 0046C544    push        ebp
 0046C545    mov         ebp,esp
 0046C547    push        0
 0046C549    push        ebx
 0046C54A    push        esi
 0046C54B    mov         esi,edx
 0046C54D    mov         ebx,eax
 0046C54F    xor         eax,eax
 0046C551    push        ebp
 0046C552    push        46C5A4
 0046C557    push        dword ptr fs:[eax]
 0046C55A    mov         dword ptr fs:[eax],esp
 0046C55D    mov         eax,ebx
 0046C55F    call        0046C844
 0046C564    test        al,al
>0046C566    je          0046C58B
 0046C568    lea         edx,[ebp-4]
 0046C56B    mov         eax,46C2D4;^gvar_005AF664
 0046C570    call        LoadStr
 0046C575    mov         ecx,dword ptr [ebp-4]
 0046C578    mov         dl,1
 0046C57A    mov         eax,[0046C220];EGLContext
 0046C57F    call        Exception.Create;EGLContext.Create
 0046C584    call        @RaiseExcept
>0046C589    jmp         0046C58E
 0046C58B    mov         dword ptr [ebx+8],esi
 0046C58E    xor         eax,eax
 0046C590    pop         edx
 0046C591    pop         ecx
 0046C592    pop         ecx
 0046C593    mov         dword ptr fs:[eax],edx
 0046C596    push        46C5AB
 0046C59B    lea         eax,[ebp-4]
 0046C59E    call        @LStrClr
 0046C5A3    ret
>0046C5A4    jmp         @HandleFinally
>0046C5A9    jmp         0046C59B
 0046C5AB    pop         esi
 0046C5AC    pop         ebx
 0046C5AD    pop         ecx
 0046C5AE    pop         ebp
 0046C5AF    ret
end;*}

//0046C5B0
{*procedure sub_0046C5B0(?:?; ?:?);
begin
 0046C5B0    push        ebp
 0046C5B1    mov         ebp,esp
 0046C5B3    push        0
 0046C5B5    push        ebx
 0046C5B6    push        esi
 0046C5B7    mov         esi,edx
 0046C5B9    mov         ebx,eax
 0046C5BB    xor         eax,eax
 0046C5BD    push        ebp
 0046C5BE    push        46C610
 0046C5C3    push        dword ptr fs:[eax]
 0046C5C6    mov         dword ptr fs:[eax],esp
 0046C5C9    mov         eax,ebx
 0046C5CB    call        0046C844
 0046C5D0    test        al,al
>0046C5D2    je          0046C5F7
 0046C5D4    lea         edx,[ebp-4]
 0046C5D7    mov         eax,46C2D4;^gvar_005AF664
 0046C5DC    call        LoadStr
 0046C5E1    mov         ecx,dword ptr [ebp-4]
 0046C5E4    mov         dl,1
 0046C5E6    mov         eax,[0046C220];EGLContext
 0046C5EB    call        Exception.Create;EGLContext.Create
 0046C5F0    call        @RaiseExcept
>0046C5F5    jmp         0046C5FA
 0046C5F7    mov         dword ptr [ebx+0C],esi
 0046C5FA    xor         eax,eax
 0046C5FC    pop         edx
 0046C5FD    pop         ecx
 0046C5FE    pop         ecx
 0046C5FF    mov         dword ptr fs:[eax],edx
 0046C602    push        46C617
 0046C607    lea         eax,[ebp-4]
 0046C60A    call        @LStrClr
 0046C60F    ret
>0046C610    jmp         @HandleFinally
>0046C615    jmp         0046C607
 0046C617    pop         esi
 0046C618    pop         ebx
 0046C619    pop         ecx
 0046C61A    pop         ebp
 0046C61B    ret
end;*}

//0046C61C
{*procedure sub_0046C61C(?:?; ?:?);
begin
 0046C61C    push        ebp
 0046C61D    mov         ebp,esp
 0046C61F    push        0
 0046C621    push        ebx
 0046C622    push        esi
 0046C623    mov         esi,edx
 0046C625    mov         ebx,eax
 0046C627    xor         eax,eax
 0046C629    push        ebp
 0046C62A    push        46C67C
 0046C62F    push        dword ptr fs:[eax]
 0046C632    mov         dword ptr fs:[eax],esp
 0046C635    mov         eax,ebx
 0046C637    call        0046C844
 0046C63C    test        al,al
>0046C63E    je          0046C663
 0046C640    lea         edx,[ebp-4]
 0046C643    mov         eax,46C2D4;^gvar_005AF664
 0046C648    call        LoadStr
 0046C64D    mov         ecx,dword ptr [ebp-4]
 0046C650    mov         dl,1
 0046C652    mov         eax,[0046C220];EGLContext
 0046C657    call        Exception.Create;EGLContext.Create
 0046C65C    call        @RaiseExcept
>0046C661    jmp         0046C666
 0046C663    mov         dword ptr [ebx+10],esi
 0046C666    xor         eax,eax
 0046C668    pop         edx
 0046C669    pop         ecx
 0046C66A    pop         ecx
 0046C66B    mov         dword ptr fs:[eax],edx
 0046C66E    push        46C683
 0046C673    lea         eax,[ebp-4]
 0046C676    call        @LStrClr
 0046C67B    ret
>0046C67C    jmp         @HandleFinally
>0046C681    jmp         0046C673
 0046C683    pop         esi
 0046C684    pop         ebx
 0046C685    pop         ecx
 0046C686    pop         ebp
 0046C687    ret
end;*}

//0046C688
{*procedure sub_0046C688(?:?; ?:?);
begin
 0046C688    push        ebp
 0046C689    mov         ebp,esp
 0046C68B    push        0
 0046C68D    push        ebx
 0046C68E    push        esi
 0046C68F    mov         esi,edx
 0046C691    mov         ebx,eax
 0046C693    xor         eax,eax
 0046C695    push        ebp
 0046C696    push        46C6E8
 0046C69B    push        dword ptr fs:[eax]
 0046C69E    mov         dword ptr fs:[eax],esp
 0046C6A1    mov         eax,ebx
 0046C6A3    call        0046C844
 0046C6A8    test        al,al
>0046C6AA    je          0046C6CF
 0046C6AC    lea         edx,[ebp-4]
 0046C6AF    mov         eax,46C2D4;^gvar_005AF664
 0046C6B4    call        LoadStr
 0046C6B9    mov         ecx,dword ptr [ebp-4]
 0046C6BC    mov         dl,1
 0046C6BE    mov         eax,[0046C220];EGLContext
 0046C6C3    call        Exception.Create;EGLContext.Create
 0046C6C8    call        @RaiseExcept
>0046C6CD    jmp         0046C6D2
 0046C6CF    mov         dword ptr [ebx+14],esi
 0046C6D2    xor         eax,eax
 0046C6D4    pop         edx
 0046C6D5    pop         ecx
 0046C6D6    pop         ecx
 0046C6D7    mov         dword ptr fs:[eax],edx
 0046C6DA    push        46C6EF
 0046C6DF    lea         eax,[ebp-4]
 0046C6E2    call        @LStrClr
 0046C6E7    ret
>0046C6E8    jmp         @HandleFinally
>0046C6ED    jmp         0046C6DF
 0046C6EF    pop         esi
 0046C6F0    pop         ebx
 0046C6F1    pop         ecx
 0046C6F2    pop         ebp
 0046C6F3    ret
end;*}

//0046C6F4
{*procedure sub_0046C6F4(?:?; ?:?);
begin
 0046C6F4    push        ebp
 0046C6F5    mov         ebp,esp
 0046C6F7    push        0
 0046C6F9    push        ebx
 0046C6FA    push        esi
 0046C6FB    mov         esi,edx
 0046C6FD    mov         ebx,eax
 0046C6FF    xor         eax,eax
 0046C701    push        ebp
 0046C702    push        46C754
 0046C707    push        dword ptr fs:[eax]
 0046C70A    mov         dword ptr fs:[eax],esp
 0046C70D    mov         eax,ebx
 0046C70F    call        0046C844
 0046C714    test        al,al
>0046C716    je          0046C73B
 0046C718    lea         edx,[ebp-4]
 0046C71B    mov         eax,46C2D4;^gvar_005AF664
 0046C720    call        LoadStr
 0046C725    mov         ecx,dword ptr [ebp-4]
 0046C728    mov         dl,1
 0046C72A    mov         eax,[0046C220];EGLContext
 0046C72F    call        Exception.Create;EGLContext.Create
 0046C734    call        @RaiseExcept
>0046C739    jmp         0046C73E
 0046C73B    mov         dword ptr [ebx+18],esi
 0046C73E    xor         eax,eax
 0046C740    pop         edx
 0046C741    pop         ecx
 0046C742    pop         ecx
 0046C743    mov         dword ptr fs:[eax],edx
 0046C746    push        46C75B
 0046C74B    lea         eax,[ebp-4]
 0046C74E    call        @LStrClr
 0046C753    ret
>0046C754    jmp         @HandleFinally
>0046C759    jmp         0046C74B
 0046C75B    pop         esi
 0046C75C    pop         ebx
 0046C75D    pop         ecx
 0046C75E    pop         ebp
 0046C75F    ret
end;*}

//0046C760
{*procedure sub_0046C760(?:?; ?:?);
begin
 0046C760    push        ebp
 0046C761    mov         ebp,esp
 0046C763    add         esp,0FFFFFFF8
 0046C766    push        ebx
 0046C767    xor         ecx,ecx
 0046C769    mov         dword ptr [ebp-8],ecx
 0046C76C    mov         byte ptr [ebp-1],dl
 0046C76F    mov         ebx,eax
 0046C771    xor         eax,eax
 0046C773    push        ebp
 0046C774    push        46C7C9
 0046C779    push        dword ptr fs:[eax]
 0046C77C    mov         dword ptr fs:[eax],esp
 0046C77F    mov         eax,ebx
 0046C781    call        0046C844
 0046C786    test        al,al
>0046C788    je          0046C7AD
 0046C78A    lea         edx,[ebp-8]
 0046C78D    mov         eax,46C2D4;^gvar_005AF664
 0046C792    call        LoadStr
 0046C797    mov         ecx,dword ptr [ebp-8]
 0046C79A    mov         dl,1
 0046C79C    mov         eax,[0046C220];EGLContext
 0046C7A1    call        Exception.Create;EGLContext.Create
 0046C7A6    call        @RaiseExcept
>0046C7AB    jmp         0046C7B3
 0046C7AD    mov         al,byte ptr [ebp-1]
 0046C7B0    mov         byte ptr [ebx+1D],al
 0046C7B3    xor         eax,eax
 0046C7B5    pop         edx
 0046C7B6    pop         ecx
 0046C7B7    pop         ecx
 0046C7B8    mov         dword ptr fs:[eax],edx
 0046C7BB    push        46C7D0
 0046C7C0    lea         eax,[ebp-8]
 0046C7C3    call        @LStrClr
 0046C7C8    ret
>0046C7C9    jmp         @HandleFinally
>0046C7CE    jmp         0046C7C0
 0046C7D0    pop         ebx
 0046C7D1    pop         ecx
 0046C7D2    pop         ecx
 0046C7D3    pop         ebp
 0046C7D4    ret
end;*}

//0046C7D8
{*procedure sub_0046C7D8(?:?; ?:?);
begin
 0046C7D8    push        ebp
 0046C7D9    mov         ebp,esp
 0046C7DB    push        0
 0046C7DD    push        ebx
 0046C7DE    push        esi
 0046C7DF    mov         ebx,edx
 0046C7E1    mov         esi,eax
 0046C7E3    xor         eax,eax
 0046C7E5    push        ebp
 0046C7E6    push        46C838
 0046C7EB    push        dword ptr fs:[eax]
 0046C7EE    mov         dword ptr fs:[eax],esp
 0046C7F1    mov         eax,esi
 0046C7F3    call        0046C844
 0046C7F8    test        al,al
>0046C7FA    je          0046C81F
 0046C7FC    lea         edx,[ebp-4]
 0046C7FF    mov         eax,46C2D4;^gvar_005AF664
 0046C804    call        LoadStr
 0046C809    mov         ecx,dword ptr [ebp-4]
 0046C80C    mov         dl,1
 0046C80E    mov         eax,[0046C220];EGLContext
 0046C813    call        Exception.Create;EGLContext.Create
 0046C818    call        @RaiseExcept
>0046C81D    jmp         0046C822
 0046C81F    mov         byte ptr [esi+1C],bl
 0046C822    xor         eax,eax
 0046C824    pop         edx
 0046C825    pop         ecx
 0046C826    pop         ecx
 0046C827    mov         dword ptr fs:[eax],edx
 0046C82A    push        46C83F
 0046C82F    lea         eax,[ebp-4]
 0046C832    call        @LStrClr
 0046C837    ret
>0046C838    jmp         @HandleFinally
>0046C83D    jmp         0046C82F
 0046C83F    pop         esi
 0046C840    pop         ebx
 0046C841    pop         ecx
 0046C842    pop         ebp
 0046C843    ret
end;*}

//0046C844
{*function sub_0046C844(?:?):Boolean;
begin
 0046C844    cmp         dword ptr [eax+2C],0
 0046C848    setg        al
 0046C84B    ret
end;*}

//0046C84C
{*procedure sub_0046C84C(?:?; ?:?);
begin
 0046C84C    push        ebx
 0046C84D    push        esi
 0046C84E    mov         ebx,edx
 0046C850    mov         esi,eax
>0046C852    jmp         0046C868
 0046C854    test        bl,bl
>0046C856    je          0046C861
 0046C858    mov         eax,esi
 0046C85A    call        0046CC00
>0046C85F    jmp         0046C868
 0046C861    mov         eax,esi
 0046C863    call        0046CD1C
 0046C868    mov         eax,esi
 0046C86A    call        0046C844
 0046C86F    cmp         bl,al
>0046C871    jne         0046C854
 0046C873    pop         esi
 0046C874    pop         ebx
 0046C875    ret
end;*}

//0046C878
{*procedure sub_0046C878(?:?; ?:?);
begin
 0046C878    push        ebp
 0046C879    mov         ebp,esp
 0046C87B    push        0
 0046C87D    push        ebx
 0046C87E    push        esi
 0046C87F    mov         esi,edx
 0046C881    mov         ebx,eax
 0046C883    xor         eax,eax
 0046C885    push        ebp
 0046C886    push        46C8F8
 0046C88B    push        dword ptr fs:[eax]
 0046C88E    mov         dword ptr fs:[eax],esp
 0046C891    mov         eax,ebx
 0046C893    mov         edx,dword ptr [eax]
 0046C895    call        dword ptr [edx+0C]
 0046C898    test        al,al
>0046C89A    je          0046C8BD
 0046C89C    lea         edx,[ebp-4]
 0046C89F    mov         eax,46C2E4;^gvar_005AF664
 0046C8A4    call        LoadStr
 0046C8A9    mov         ecx,dword ptr [ebp-4]
 0046C8AC    mov         dl,1
 0046C8AE    mov         eax,[0046C220];EGLContext
 0046C8B3    call        Exception.Create;EGLContext.Create
 0046C8B8    call        @RaiseExcept
 0046C8BD    mov         byte ptr [ebx+38],0
 0046C8C1    mov         edx,esi
 0046C8C3    mov         eax,ebx
 0046C8C5    mov         si,0FFFF
 0046C8C9    call        @CallDynaInst
 0046C8CE    mov         edx,ebx
 0046C8D0    mov         eax,dword ptr [ebx+30]
 0046C8D3    call        TList.Add
 0046C8D8    mov         edx,ebx
 0046C8DA    mov         eax,dword ptr [ebx+28]
 0046C8DD    call        0046D3AC
 0046C8E2    xor         eax,eax
 0046C8E4    pop         edx
 0046C8E5    pop         ecx
 0046C8E6    pop         ecx
 0046C8E7    mov         dword ptr fs:[eax],edx
 0046C8EA    push        46C8FF
 0046C8EF    lea         eax,[ebp-4]
 0046C8F2    call        @LStrClr
 0046C8F7    ret
>0046C8F8    jmp         @HandleFinally
>0046C8FD    jmp         0046C8EF
 0046C8FF    pop         esi
 0046C900    pop         ebx
 0046C901    pop         ecx
 0046C902    pop         ebp
 0046C903    ret
end;*}

//0046C904
{*procedure sub_0046C904(?:?; ?:?; ?:?; ?:?);
begin
 0046C904    push        ebp
 0046C905    mov         ebp,esp
 0046C907    push        0
 0046C909    push        ebx
 0046C90A    push        esi
 0046C90B    push        edi
 0046C90C    mov         edi,ecx
 0046C90E    mov         esi,edx
 0046C910    mov         ebx,eax
 0046C912    xor         eax,eax
 0046C914    push        ebp
 0046C915    push        46C98D
 0046C91A    push        dword ptr fs:[eax]
 0046C91D    mov         dword ptr fs:[eax],esp
 0046C920    mov         eax,ebx
 0046C922    mov         edx,dword ptr [eax]
 0046C924    call        dword ptr [edx+0C]
 0046C927    test        al,al
>0046C929    je          0046C94C
 0046C92B    lea         edx,[ebp-4]
 0046C92E    mov         eax,46C2E4;^gvar_005AF664
 0046C933    call        LoadStr
 0046C938    mov         ecx,dword ptr [ebp-4]
 0046C93B    mov         dl,1
 0046C93D    mov         eax,[0046C220];EGLContext
 0046C942    call        Exception.Create;EGLContext.Create
 0046C947    call        @RaiseExcept
 0046C94C    mov         byte ptr [ebx+38],0
 0046C950    mov         eax,dword ptr [ebp+8]
 0046C953    push        eax
 0046C954    mov         ecx,edi
 0046C956    mov         edx,esi
 0046C958    mov         eax,ebx
 0046C95A    mov         si,0FFFE
 0046C95E    call        @CallDynaInst
 0046C963    mov         edx,ebx
 0046C965    mov         eax,dword ptr [ebx+30]
 0046C968    call        TList.Add
 0046C96D    mov         edx,ebx
 0046C96F    mov         eax,dword ptr [ebx+28]
 0046C972    call        0046D3AC
 0046C977    xor         eax,eax
 0046C979    pop         edx
 0046C97A    pop         ecx
 0046C97B    pop         ecx
 0046C97C    mov         dword ptr fs:[eax],edx
 0046C97F    push        46C994
 0046C984    lea         eax,[ebp-4]
 0046C987    call        @LStrClr
 0046C98C    ret
>0046C98D    jmp         @HandleFinally
>0046C992    jmp         0046C984
 0046C994    pop         edi
 0046C995    pop         esi
 0046C996    pop         ebx
 0046C997    pop         ecx
 0046C998    pop         ebp
 0046C999    ret         4
end;*}

//0046C99C
{*procedure sub_0046C99C(?:?);
begin
 0046C99C    push        ebx
 0046C99D    push        esi
 0046C99E    push        edi
 0046C99F    push        ebp
 0046C9A0    add         esp,0FFFFFFF8
 0046C9A3    mov         ebx,eax
 0046C9A5    mov         eax,dword ptr [ebx+30]
 0046C9A8    mov         eax,dword ptr [eax+8]
 0046C9AB    dec         eax
 0046C9AC    test        eax,eax
>0046C9AE    jl          0046CA0F
 0046C9B0    inc         eax
 0046C9B1    mov         dword ptr [esp+4],eax
 0046C9B5    mov         dword ptr [esp],0
 0046C9BC    mov         edx,dword ptr [esp]
 0046C9BF    mov         eax,dword ptr [ebx+30]
 0046C9C2    call        TList.Get
 0046C9C7    cmp         ebx,eax
>0046C9C9    je          0046CA06
 0046C9CB    mov         edx,dword ptr [esp]
 0046C9CE    mov         eax,dword ptr [ebx+30]
 0046C9D1    call        TList.Get
 0046C9D6    mov         ebp,eax
 0046C9D8    mov         eax,dword ptr [ebp+30]
 0046C9DB    mov         edx,dword ptr [eax]
 0046C9DD    call        dword ptr [edx+8]
 0046C9E0    mov         eax,dword ptr [ebx+30]
 0046C9E3    mov         esi,dword ptr [eax+8]
 0046C9E6    dec         esi
 0046C9E7    test        esi,esi
>0046C9E9    jl          0046CA06
 0046C9EB    inc         esi
 0046C9EC    xor         edi,edi
 0046C9EE    mov         edx,edi
 0046C9F0    mov         eax,dword ptr [ebx+30]
 0046C9F3    call        TList.Get
 0046C9F8    mov         edx,eax
 0046C9FA    mov         eax,dword ptr [ebp+30]
 0046C9FD    call        TList.Add
 0046CA02    inc         edi
 0046CA03    dec         esi
>0046CA04    jne         0046C9EE
 0046CA06    inc         dword ptr [esp]
 0046CA09    dec         dword ptr [esp+4]
>0046CA0D    jne         0046C9BC
 0046CA0F    pop         ecx
 0046CA10    pop         edx
 0046CA11    pop         ebp
 0046CA12    pop         edi
 0046CA13    pop         esi
 0046CA14    pop         ebx
 0046CA15    ret
end;*}

//0046CA18
{*procedure sub_0046CA18(?:?; ?:?);
begin
 0046CA18    push        ebp
 0046CA19    mov         ebp,esp
 0046CA1B    push        0
 0046CA1D    push        ebx
 0046CA1E    push        esi
 0046CA1F    push        edi
 0046CA20    mov         edi,edx
 0046CA22    mov         ebx,eax
 0046CA24    xor         eax,eax
 0046CA26    push        ebp
 0046CA27    push        46CAA2
 0046CA2C    push        dword ptr fs:[eax]
 0046CA2F    mov         dword ptr fs:[eax],esp
 0046CA32    mov         eax,ebx
 0046CA34    mov         edx,dword ptr [eax]
 0046CA36    call        dword ptr [edx+0C]
 0046CA39    test        al,al
>0046CA3B    je          0046CA6B
 0046CA3D    mov         edx,edi
 0046CA3F    mov         eax,dword ptr [ebx+30]
 0046CA42    call        TList.IndexOf
 0046CA47    test        eax,eax
>0046CA49    jge         0046CA8C
 0046CA4B    mov         edx,edi
 0046CA4D    mov         eax,ebx
 0046CA4F    mov         si,0FFFD
 0046CA53    call        @CallDynaInst
 0046CA58    mov         edx,edi
 0046CA5A    mov         eax,dword ptr [ebx+30]
 0046CA5D    call        TList.Add
 0046CA62    mov         eax,ebx
 0046CA64    call        0046C99C
>0046CA69    jmp         0046CA8C
 0046CA6B    lea         edx,[ebp-4]
 0046CA6E    mov         eax,46C2EC;^gvar_005AF664
 0046CA73    call        LoadStr
 0046CA78    mov         ecx,dword ptr [ebp-4]
 0046CA7B    mov         dl,1
 0046CA7D    mov         eax,[0046C220];EGLContext
 0046CA82    call        Exception.Create;EGLContext.Create
 0046CA87    call        @RaiseExcept
 0046CA8C    xor         eax,eax
 0046CA8E    pop         edx
 0046CA8F    pop         ecx
 0046CA90    pop         ecx
 0046CA91    mov         dword ptr fs:[eax],edx
 0046CA94    push        46CAA9
 0046CA99    lea         eax,[ebp-4]
 0046CA9C    call        @LStrClr
 0046CAA1    ret
>0046CAA2    jmp         @HandleFinally
>0046CAA7    jmp         0046CA99
 0046CAA9    pop         edi
 0046CAAA    pop         esi
 0046CAAB    pop         ebx
 0046CAAC    pop         ecx
 0046CAAD    pop         ebp
 0046CAAE    ret
end;*}

//0046CAB0
{*procedure sub_0046CAB0(?:?);
begin
 0046CAB0    push        ebp
 0046CAB1    mov         ebp,esp
 0046CAB3    add         esp,0FFFFFFF8
 0046CAB6    push        ebx
 0046CAB7    push        esi
 0046CAB8    push        edi
 0046CAB9    mov         dword ptr [ebp-4],eax
 0046CABC    mov         eax,[005E14AC];gvar_005E14AC
 0046CAC1    cmp         eax,dword ptr [ebp-4]
>0046CAC4    je          0046CADE
 0046CAC6    mov         eax,[005E14AC];gvar_005E14AC
 0046CACB    mov         dword ptr [ebp-8],eax
 0046CACE    cmp         dword ptr [ebp-8],0
>0046CAD2    je          0046CAE3
 0046CAD4    mov         eax,dword ptr [ebp-8]
 0046CAD7    call        0046CD1C
>0046CADC    jmp         0046CAE3
 0046CADE    xor         eax,eax
 0046CAE0    mov         dword ptr [ebp-8],eax
 0046CAE3    mov         eax,dword ptr [ebp-4]
 0046CAE6    call        0046CC00
 0046CAEB    xor         eax,eax
 0046CAED    push        ebp
 0046CAEE    push        46CBE2
 0046CAF3    push        dword ptr fs:[eax]
 0046CAF6    mov         dword ptr fs:[eax],esp
 0046CAF9    mov         eax,dword ptr [ebp-4]
 0046CAFC    call        0046CE44
 0046CB01    mov         edi,eax
 0046CB03    test        edi,edi
>0046CB05    je          0046CB4B
 0046CB07    mov         eax,dword ptr [ebp-4]
 0046CB0A    mov         eax,dword ptr [eax+34]
 0046CB0D    mov         ebx,dword ptr [eax+8]
 0046CB10    dec         ebx
 0046CB11    cmp         ebx,0
>0046CB14    jl          0046CB76
 0046CB16    mov         eax,dword ptr [ebp-4]
 0046CB19    mov         eax,dword ptr [eax+34]
 0046CB1C    mov         edx,ebx
 0046CB1E    call        TList.Get
 0046CB23    mov         esi,eax
 0046CB25    mov         eax,dword ptr [esi]
 0046CB27    call        dword ptr [eax]
 0046CB29    test        al,al
>0046CB2B    je          0046CB3C
 0046CB2D    mov         eax,dword ptr [edi+34]
 0046CB30    mov         edx,esi
 0046CB32    call        TList.Add
 0046CB37    mov         dword ptr [esi+4],edi
>0046CB3A    jmp         0046CB43
 0046CB3C    mov         eax,esi
 0046CB3E    call        0046D088
 0046CB43    dec         ebx
 0046CB44    cmp         ebx,0FFFFFFFF
>0046CB47    jne         0046CB16
>0046CB49    jmp         0046CB76
 0046CB4B    mov         eax,dword ptr [ebp-4]
 0046CB4E    mov         eax,dword ptr [eax+34]
 0046CB51    mov         ebx,dword ptr [eax+8]
 0046CB54    dec         ebx
 0046CB55    cmp         ebx,0
>0046CB58    jl          0046CB76
 0046CB5A    mov         eax,dword ptr [ebp-4]
 0046CB5D    mov         eax,dword ptr [eax+34]
 0046CB60    mov         edx,ebx
 0046CB62    call        TList.Get
 0046CB67    mov         esi,eax
 0046CB69    mov         eax,esi
 0046CB6B    call        0046D088
 0046CB70    dec         ebx
 0046CB71    cmp         ebx,0FFFFFFFF
>0046CB74    jne         0046CB5A
 0046CB76    mov         eax,dword ptr [ebp-4]
 0046CB79    mov         eax,dword ptr [eax+34]
 0046CB7C    mov         edx,dword ptr [eax]
 0046CB7E    call        dword ptr [edx+8]
 0046CB81    mov         eax,dword ptr [ebp-4]
 0046CB84    mov         eax,dword ptr [eax+28]
 0046CB87    mov         edx,dword ptr [ebp-4]
 0046CB8A    call        0046D3F0
 0046CB8F    mov         eax,dword ptr [ebp-4]
 0046CB92    mov         eax,dword ptr [eax+30]
 0046CB95    mov         edx,dword ptr [ebp-4]
 0046CB98    call        TList.Remove
 0046CB9D    mov         eax,dword ptr [ebp-4]
 0046CBA0    call        0046C99C
 0046CBA5    mov         eax,dword ptr [ebp-4]
 0046CBA8    mov         eax,dword ptr [eax+30]
 0046CBAB    mov         edx,dword ptr [eax]
 0046CBAD    call        dword ptr [edx+8]
 0046CBB0    xor         edx,edx
 0046CBB2    mov         eax,dword ptr [ebp-4]
 0046CBB5    call        0046C84C
 0046CBBA    mov         eax,dword ptr [ebp-4]
 0046CBBD    mov         si,0FFFC
 0046CBC1    call        @CallDynaInst
 0046CBC6    xor         eax,eax
 0046CBC8    pop         edx
 0046CBC9    pop         ecx
 0046CBCA    pop         ecx
 0046CBCB    mov         dword ptr fs:[eax],edx
 0046CBCE    push        46CBE9
 0046CBD3    cmp         dword ptr [ebp-8],0
>0046CBD7    je          0046CBE1
 0046CBD9    mov         eax,dword ptr [ebp-8]
 0046CBDC    call        0046CC00
 0046CBE1    ret
>0046CBE2    jmp         @HandleFinally
>0046CBE7    jmp         0046CBD3
 0046CBE9    mov         byte ptr ds:[5AD1EC],0;gvar_005AD1EC
 0046CBF0    mov         eax,dword ptr [ebp-4]
 0046CBF3    mov         byte ptr [eax+38],0
 0046CBF7    pop         edi
 0046CBF8    pop         esi
 0046CBF9    pop         ebx
 0046CBFA    pop         ecx
 0046CBFB    pop         ecx
 0046CBFC    pop         ebp
 0046CBFD    ret
end;*}

//0046CC00
procedure sub_0046CC00(?:dword);
begin
{*
 0046CC00    push        ebp
 0046CC01    mov         ebp,esp
 0046CC03    push        0
 0046CC05    push        ebx
 0046CC06    push        esi
 0046CC07    push        edi
 0046CC08    mov         ebx,eax
 0046CC0A    xor         eax,eax
 0046CC0C    push        ebp
 0046CC0D    push        46CCB4
 0046CC12    push        dword ptr fs:[eax]
 0046CC15    mov         dword ptr fs:[eax],esp
 0046CC18    cmp         dword ptr [ebx+2C],0
>0046CC1C    jne         0046CC7F
 0046CC1E    mov         eax,ebx
 0046CC20    mov         edx,dword ptr [eax]
 0046CC22    call        dword ptr [edx+0C]
 0046CC25    test        al,al
>0046CC27    jne         0046CC4A
 0046CC29    lea         edx,[ebp-4]
 0046CC2C    mov         eax,46C2EC;^gvar_005AF664
 0046CC31    call        LoadStr
 0046CC36    mov         ecx,dword ptr [ebp-4]
 0046CC39    mov         dl,1
 0046CC3B    mov         eax,[0046C220];EGLContext
 0046CC40    call        Exception.Create;EGLContext.Create
 0046CC45    call        @RaiseExcept
 0046CC4A    xor         eax,eax
 0046CC4C    push        ebp
 0046CC4D    push        46CC68
 0046CC52    push        dword ptr fs:[eax]
 0046CC55    mov         dword ptr fs:[eax],esp
 0046CC58    mov         eax,ebx
 0046CC5A    mov         edx,dword ptr [eax]
 0046CC5C    call        dword ptr [edx]
 0046CC5E    xor         eax,eax
 0046CC60    pop         edx
 0046CC61    pop         ecx
 0046CC62    pop         ecx
 0046CC63    mov         dword ptr fs:[eax],edx
>0046CC66    jmp         0046CC77
>0046CC68    jmp         @HandleAnyException
 0046CC6D    call        @RaiseAgain
 0046CC72    call        @DoneExcept
 0046CC77    mov         dword ptr ds:[5E14AC],ebx;gvar_005E14AC
>0046CC7D    jmp         0046CC9B
 0046CC7F    cmp         ebx,dword ptr ds:[5E14AC];gvar_005E14AC
>0046CC85    je          0046CC9B
 0046CC87    mov         ecx,393
 0046CC8C    mov         edx,46CCCC;'C:\GLScene\glscene_v_1000714\Source\GLContext.pas'
 0046CC91    mov         eax,46CD08;'Assertion failure'
 0046CC96    call        @Assert
 0046CC9B    inc         dword ptr [ebx+2C]
 0046CC9E    xor         eax,eax
 0046CCA0    pop         edx
 0046CCA1    pop         ecx
 0046CCA2    pop         ecx
 0046CCA3    mov         dword ptr fs:[eax],edx
 0046CCA6    push        46CCBB
 0046CCAB    lea         eax,[ebp-4]
 0046CCAE    call        @LStrClr
 0046CCB3    ret
>0046CCB4    jmp         @HandleFinally
>0046CCB9    jmp         0046CCAB
 0046CCBB    pop         edi
 0046CCBC    pop         esi
 0046CCBD    pop         ebx
 0046CCBE    pop         ecx
 0046CCBF    pop         ebp
 0046CCC0    ret
*}
end;

//0046CD1C
procedure sub_0046CD1C(?:dword);
begin
{*
 0046CD1C    push        ebp
 0046CD1D    mov         ebp,esp
 0046CD1F    push        0
 0046CD21    push        0
 0046CD23    push        ebx
 0046CD24    mov         ebx,eax
 0046CD26    xor         eax,eax
 0046CD28    push        ebp
 0046CD29    push        46CDDF
 0046CD2E    push        dword ptr fs:[eax]
 0046CD31    mov         dword ptr fs:[eax],esp
 0046CD34    cmp         ebx,dword ptr ds:[5E14AC];gvar_005E14AC
>0046CD3A    je          0046CD50
 0046CD3C    mov         ecx,39B
 0046CD41    mov         edx,46CDF4;'C:\GLScene\glscene_v_1000714\Source\GLContext.pas'
 0046CD46    mov         eax,46CE30;'Assertion failure'
 0046CD4B    call        @Assert
 0046CD50    dec         dword ptr [ebx+2C]
 0046CD53    mov         eax,dword ptr [ebx+2C]
 0046CD56    test        eax,eax
>0046CD58    jne         0046CD9F
 0046CD5A    mov         eax,ebx
 0046CD5C    mov         edx,dword ptr [eax]
 0046CD5E    call        dword ptr [edx+0C]
 0046CD61    test        al,al
>0046CD63    jne         0046CD86
 0046CD65    lea         edx,[ebp-4]
 0046CD68    mov         eax,46C2EC;^gvar_005AF664
 0046CD6D    call        LoadStr
 0046CD72    mov         ecx,dword ptr [ebp-4]
 0046CD75    mov         dl,1
 0046CD77    mov         eax,[0046C220];EGLContext
 0046CD7C    call        Exception.Create;EGLContext.Create
 0046CD81    call        @RaiseExcept
 0046CD86    cmp         byte ptr ds:[5AD1EC],0;gvar_005AD1EC
>0046CD8D    jne         0046CD96
 0046CD8F    mov         eax,ebx
 0046CD91    mov         edx,dword ptr [eax]
 0046CD93    call        dword ptr [edx+4]
 0046CD96    xor         eax,eax
 0046CD98    mov         [005E14AC],eax;gvar_005E14AC
>0046CD9D    jmp         0046CDC4
 0046CD9F    test        eax,eax
>0046CDA1    jge         0046CDC4
 0046CDA3    lea         edx,[ebp-8]
 0046CDA6    mov         eax,46C2F4;^gvar_005AF664
 0046CDAB    call        LoadStr
 0046CDB0    mov         ecx,dword ptr [ebp-8]
 0046CDB3    mov         dl,1
 0046CDB5    mov         eax,[0046C220];EGLContext
 0046CDBA    call        Exception.Create;EGLContext.Create
 0046CDBF    call        @RaiseExcept
 0046CDC4    xor         eax,eax
 0046CDC6    pop         edx
 0046CDC7    pop         ecx
 0046CDC8    pop         ecx
 0046CDC9    mov         dword ptr fs:[eax],edx
 0046CDCC    push        46CDE6
 0046CDD1    lea         eax,[ebp-8]
 0046CDD4    mov         edx,2
 0046CDD9    call        @LStrArrayClr
 0046CDDE    ret
>0046CDDF    jmp         @HandleFinally
>0046CDE4    jmp         0046CDD1
 0046CDE6    pop         ebx
 0046CDE7    pop         ecx
 0046CDE8    pop         ecx
 0046CDE9    pop         ebp
 0046CDEA    ret
*}
end;

//0046CE44
{*function sub_0046CE44(?:?):?;
begin
 0046CE44    push        ebx
 0046CE45    push        esi
 0046CE46    push        edi
 0046CE47    push        ebp
 0046CE48    mov         ebx,eax
 0046CE4A    xor         ebp,ebp
 0046CE4C    mov         eax,dword ptr [ebx+30]
 0046CE4F    mov         edi,dword ptr [eax+8]
 0046CE52    dec         edi
 0046CE53    test        edi,edi
>0046CE55    jl          0046CE7A
 0046CE57    inc         edi
 0046CE58    xor         esi,esi
 0046CE5A    mov         edx,esi
 0046CE5C    mov         eax,dword ptr [ebx+30]
 0046CE5F    call        TList.Get
 0046CE64    cmp         ebx,eax
>0046CE66    je          0046CE76
 0046CE68    mov         edx,esi
 0046CE6A    mov         eax,dword ptr [ebx+30]
 0046CE6D    call        TList.Get
 0046CE72    mov         ebp,eax
>0046CE74    jmp         0046CE7A
 0046CE76    inc         esi
 0046CE77    dec         edi
>0046CE78    jne         0046CE5A
 0046CE7A    mov         eax,ebp
 0046CE7C    pop         ebp
 0046CE7D    pop         edi
 0046CE7E    pop         esi
 0046CE7F    pop         ebx
 0046CE80    ret
end;*}

//0046CE84
constructor TGLVirtualHandle.Create;
begin
{*
 0046CE84    push        ebx
 0046CE85    push        esi
 0046CE86    test        dl,dl
>0046CE88    je          0046CE92
 0046CE8A    add         esp,0FFFFFFF0
 0046CE8D    call        @ClassCreate
 0046CE92    mov         ebx,edx
 0046CE94    mov         esi,eax
 0046CE96    xor         edx,edx
 0046CE98    mov         eax,esi
 0046CE9A    call        TObject.Create
 0046CE9F    mov         eax,esi
 0046CEA1    test        bl,bl
>0046CEA3    je          0046CEB4
 0046CEA5    call        @AfterConstruction
 0046CEAA    pop         dword ptr fs:[0]
 0046CEB1    add         esp,0C
 0046CEB4    mov         eax,esi
 0046CEB6    pop         esi
 0046CEB7    pop         ebx
 0046CEB8    ret
*}
end;

//0046CEBC
destructor TGLContextHandle.Destroy;
begin
{*
 0046CEBC    push        ebx
 0046CEBD    push        esi
 0046CEBE    call        @BeforeDestruction
 0046CEC3    mov         ebx,edx
 0046CEC5    mov         esi,eax
 0046CEC7    mov         eax,esi
 0046CEC9    call        0046CFA8
 0046CECE    mov         edx,ebx
 0046CED0    and         dl,0FC
 0046CED3    mov         eax,esi
 0046CED5    call        TObject.Destroy
 0046CEDA    test        bl,bl
>0046CEDC    jle         0046CEE5
 0046CEDE    mov         eax,esi
 0046CEE0    call        @ClassDestroy
 0046CEE5    pop         esi
 0046CEE6    pop         ebx
 0046CEE7    ret
*}
end;

//0046CEE8
procedure sub_0046CEE8(?:TGLListHandle);
begin
{*
 0046CEE8    push        ebx
 0046CEE9    push        esi
 0046CEEA    mov         ebx,eax
 0046CEEC    cmp         dword ptr [ebx+8],0
>0046CEF0    je          0046CF06
 0046CEF2    mov         ecx,3D6
 0046CEF7    mov         edx,46CF58;'C:\GLScene\glscene_v_1000714\Source\GLContext.pas'
 0046CEFC    mov         eax,46CF94;'Assertion failure'
 0046CF01    call        @Assert
 0046CF06    cmp         dword ptr ds:[5E14AC],0;gvar_005E14AC
>0046CF0D    jne         0046CF23
 0046CF0F    mov         ecx,3D7
 0046CF14    mov         edx,46CF58;'C:\GLScene\glscene_v_1000714\Source\GLContext.pas'
 0046CF19    mov         eax,46CF94;'Assertion failure'
 0046CF1E    call        @Assert
 0046CF23    mov         eax,ebx
 0046CF25    mov         edx,dword ptr [eax]
 0046CF27    call        dword ptr [edx+4]
 0046CF2A    mov         esi,eax
 0046CF2C    mov         dword ptr [ebx+8],esi
 0046CF2F    test        esi,esi
>0046CF31    je          0046CF4A
 0046CF33    mov         eax,[005E14AC];gvar_005E14AC
 0046CF38    mov         dword ptr [ebx+4],eax
 0046CF3B    mov         eax,[005E14AC];gvar_005E14AC
 0046CF40    mov         eax,dword ptr [eax+34]
 0046CF43    mov         edx,ebx
 0046CF45    call        TList.Add
 0046CF4A    pop         esi
 0046CF4B    pop         ebx
 0046CF4C    ret
*}
end;

//0046CFA8
procedure sub_0046CFA8(?:TGLContextHandle);
begin
{*
 0046CFA8    push        ebp
 0046CFA9    mov         ebp,esp
 0046CFAB    add         esp,0FFFFFFF4
 0046CFAE    mov         dword ptr [ebp-4],eax
 0046CFB1    mov         eax,dword ptr [ebp-4]
 0046CFB4    cmp         dword ptr [eax+8],0
>0046CFB8    je          0046D082
 0046CFBE    mov         eax,dword ptr [ebp-4]
 0046CFC1    mov         eax,dword ptr [eax+4]
 0046CFC4    mov         eax,dword ptr [eax+34]
 0046CFC7    mov         edx,dword ptr [ebp-4]
 0046CFCA    call        TList.Remove
 0046CFCF    mov         eax,dword ptr [ebp-4]
 0046CFD2    mov         eax,dword ptr [eax+4]
 0046CFD5    cmp         eax,dword ptr ds:[5E14AC];gvar_005E14AC
>0046CFDB    je          0046CFFD
 0046CFDD    cmp         dword ptr ds:[5E14AC],0;gvar_005E14AC
>0046CFE4    je          0046D007
 0046CFE6    mov         eax,dword ptr [ebp-4]
 0046CFE9    mov         edx,dword ptr [eax+4]
 0046CFEC    mov         eax,[005E14AC];gvar_005E14AC
 0046CFF1    mov         eax,dword ptr [eax+30]
 0046CFF4    call        TList.IndexOf
 0046CFF9    test        eax,eax
>0046CFFB    jl          0046D007
 0046CFFD    mov         eax,dword ptr [ebp-4]
 0046D000    mov         edx,dword ptr [eax]
 0046D002    call        dword ptr [edx+8]
>0046D005    jmp         0046D072
 0046D007    mov         eax,[005E14AC];gvar_005E14AC
 0046D00C    mov         dword ptr [ebp-8],eax
 0046D00F    cmp         dword ptr [ebp-8],0
>0046D013    je          0046D01D
 0046D015    mov         eax,dword ptr [ebp-8]
 0046D018    call        0046CD1C
 0046D01D    mov         eax,dword ptr [ebp-4]
 0046D020    mov         eax,dword ptr [eax+4]
 0046D023    call        0046CC00
 0046D028    mov         eax,dword ptr [ebp-4]
 0046D02B    mov         eax,dword ptr [eax+4]
 0046D02E    mov         dword ptr [ebp-0C],eax
 0046D031    xor         eax,eax
 0046D033    push        ebp
 0046D034    push        46D06B
 0046D039    push        dword ptr fs:[eax]
 0046D03C    mov         dword ptr fs:[eax],esp
 0046D03F    mov         eax,dword ptr [ebp-4]
 0046D042    mov         edx,dword ptr [eax]
 0046D044    call        dword ptr [edx+8]
 0046D047    xor         eax,eax
 0046D049    pop         edx
 0046D04A    pop         ecx
 0046D04B    pop         ecx
 0046D04C    mov         dword ptr fs:[eax],edx
 0046D04F    push        46D072
 0046D054    mov         eax,dword ptr [ebp-0C]
 0046D057    call        0046CD1C
 0046D05C    cmp         dword ptr [ebp-8],0
>0046D060    je          0046D06A
 0046D062    mov         eax,dword ptr [ebp-8]
 0046D065    call        0046CC00
 0046D06A    ret
>0046D06B    jmp         @HandleFinally
>0046D070    jmp         0046D054
 0046D072    mov         eax,dword ptr [ebp-4]
 0046D075    xor         edx,edx
 0046D077    mov         dword ptr [eax+8],edx
 0046D07A    mov         eax,dword ptr [ebp-4]
 0046D07D    xor         edx,edx
 0046D07F    mov         dword ptr [eax+4],edx
 0046D082    mov         esp,ebp
 0046D084    pop         ebp
 0046D085    ret
*}
end;

//0046D088
procedure sub_0046D088(?:Pointer);
begin
{*
 0046D088    push        ebx
 0046D089    mov         ebx,eax
 0046D08B    cmp         dword ptr [ebx+8],0
>0046D08F    je          0046D0A2
 0046D091    mov         eax,ebx
 0046D093    mov         edx,dword ptr [eax]
 0046D095    call        dword ptr [edx+8]
 0046D098    xor         eax,eax
 0046D09A    mov         dword ptr [ebx+8],eax
 0046D09D    xor         eax,eax
 0046D09F    mov         dword ptr [ebx+4],eax
 0046D0A2    pop         ebx
 0046D0A3    ret
*}
end;

//0046D0A4
{*function sub_0046D0A4:?;
begin
 0046D0A4    mov         al,1
 0046D0A6    ret
end;*}

//0046D0A8
{*function sub_0046D0A8:?;
begin
 0046D0A8    push        ebx
 0046D0A9    push        ecx
 0046D0AA    xor         edx,edx
 0046D0AC    mov         dword ptr [esp],edx
 0046D0AF    cmp         word ptr [eax+12],0;TGLVirtualHandle.?f12:word
>0046D0B4    je          0046D0C2
 0046D0B6    mov         ecx,esp
 0046D0B8    mov         ebx,eax
 0046D0BA    mov         edx,eax
 0046D0BC    mov         eax,dword ptr [ebx+14];TGLVirtualHandle.?f14:dword
 0046D0BF    call        dword ptr [ebx+10]
 0046D0C2    mov         eax,dword ptr [esp]
 0046D0C5    pop         edx
 0046D0C6    pop         ebx
 0046D0C7    ret
end;*}

//0046D0C8
procedure sub_0046D0C8;
begin
{*
 0046D0C8    push        ebx
 0046D0C9    mov         ebx,eax
 0046D0CB    cmp         byte ptr ds:[5AD1EC],0;gvar_005AD1EC
>0046D0D2    jne         0046D0F0
 0046D0D4    call        0046C3B8
 0046D0D9    cmp         word ptr [ebx+1A],0;TGLVirtualHandle.?f1A:word
>0046D0DE    je          0046D0EB
 0046D0E0    lea         ecx,[ebx+8];TGLVirtualHandle.?f8:dword
 0046D0E3    mov         edx,ebx
 0046D0E5    mov         eax,dword ptr [ebx+1C];TGLVirtualHandle.?f1C:dword
 0046D0E8    call        dword ptr [ebx+18]
 0046D0EB    call        0046C304
 0046D0F0    pop         ebx
 0046D0F1    ret
*}
end;

//0046D0F4
procedure sub_0046D0F4;
begin
{*
 0046D0F4    push        1
 0046D0F6    call        OpenGL32.glGenLists
 0046D0FB    ret
*}
end;

//0046D0FC
procedure sub_0046D0FC;
begin
{*
 0046D0FC    push        ebx
 0046D0FD    mov         ebx,eax
 0046D0FF    cmp         byte ptr ds:[5AD1EC],0;gvar_005AD1EC
>0046D106    jne         0046D11D
 0046D108    call        0046C3B8
 0046D10D    push        1
 0046D10F    mov         eax,dword ptr [ebx+8];TGLListHandle.?f8:dword
 0046D112    push        eax
 0046D113    call        OpenGL32.glDeleteLists
 0046D118    call        0046C304
 0046D11D    pop         ebx
 0046D11E    ret
*}
end;

//0046D120
{*function sub_0046D120:?;
begin
 0046D120    push        ecx
 0046D121    push        esp
 0046D122    push        1
 0046D124    call        OpenGL32.glGenTextures
 0046D129    mov         eax,dword ptr [esp]
 0046D12C    pop         edx
 0046D12D    ret
end;*}

//0046D130
procedure sub_0046D130;
begin
{*
 0046D130    push        ebx
 0046D131    mov         ebx,eax
 0046D133    cmp         byte ptr ds:[5AD1EC],0;gvar_005AD1EC
>0046D13A    jne         0046D15E
 0046D13C    call        OpenGL32.glGetError
 0046D141    mov         eax,dword ptr [ebx+8];TGLTextureHandle.?f8:dword
 0046D144    push        eax
 0046D145    call        OpenGL32.glIsTexture
 0046D14A    test        al,al
>0046D14C    je          0046D159
 0046D14E    lea         eax,[ebx+8];TGLTextureHandle.?f8:dword
 0046D151    push        eax
 0046D152    push        1
 0046D154    call        OpenGL32.glDeleteTextures
 0046D159    call        0046C304
 0046D15E    pop         ebx
 0046D15F    ret
*}
end;

//0046D160
constructor TGLContextManager.Create;
begin
{*
 0046D160    push        ebx
 0046D161    push        esi
 0046D162    test        dl,dl
>0046D164    je          0046D16E
 0046D166    add         esp,0FFFFFFF0
 0046D169    call        @ClassCreate
 0046D16E    mov         ebx,edx
 0046D170    mov         esi,eax
 0046D172    xor         edx,edx
 0046D174    mov         eax,esi
 0046D176    call        TObject.Create
 0046D17B    mov         dl,1
 0046D17D    mov         eax,[00417D50];TThreadList
 0046D182    call        TThreadList.Create;TThreadList.Create
 0046D187    mov         dword ptr [esi+4],eax
 0046D18A    mov         eax,esi
 0046D18C    test        bl,bl
>0046D18E    je          0046D19F
 0046D190    call        @AfterConstruction
 0046D195    pop         dword ptr fs:[0]
 0046D19C    add         esp,0C
 0046D19F    mov         eax,esi
 0046D1A1    pop         esi
 0046D1A2    pop         ebx
 0046D1A3    ret
*}
end;

//0046D1D4
{*function sub_0046D1D4(?:?):?;
begin
 0046D1D4    push        ebx
 0046D1D5    mov         ebx,eax
 0046D1D7    cmp         dword ptr ds:[5AD1E8],0;gvar_005AD1E8:TList
>0046D1DE    je          0046D201
 0046D1E0    mov         eax,[005AD1E8];0x0 gvar_005AD1E8:TList
 0046D1E5    cmp         dword ptr [eax+8],0;TList.FCount:Integer
>0046D1E9    jle         0046D201
 0046D1EB    xor         edx,edx
 0046D1ED    mov         eax,[005AD1E8];0x0 gvar_005AD1E8:TList
 0046D1F2    call        TList.Get
 0046D1F7    mov         dl,1
 0046D1F9    call        dword ptr [eax+8]
 0046D1FC    mov         dword ptr [eax+28],ebx
 0046D1FF    pop         ebx
 0046D200    ret
 0046D201    xor         eax,eax
 0046D203    pop         ebx
 0046D204    ret
end;*}

//0046D208
{*procedure sub_0046D208(?:?);
begin
 0046D208    mov         eax,dword ptr [eax+4]
 0046D20B    call        TThreadList.LockList
 0046D210    ret
end;*}

//0046D214
{*procedure sub_0046D214(?:?);
begin
 0046D214    mov         eax,dword ptr [eax+4]
 0046D217    call        TThreadList.UnlockList
 0046D21C    ret
end;*}

//0046D220
{*function sub_0046D220(?:?):?;
begin
 0046D220    push        ebx
 0046D221    push        esi
 0046D222    mov         ebx,eax
 0046D224    mov         eax,dword ptr [ebx+4]
 0046D227    call        TThreadList.LockList
 0046D22C    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 0046D22F    mov         eax,dword ptr [ebx+4]
 0046D232    call        TThreadList.UnlockList
 0046D237    mov         eax,esi
 0046D239    pop         esi
 0046D23A    pop         ebx
 0046D23B    ret
end;*}

//0046D23C
{*procedure sub_0046D23C(?:?; ?:TGLContext);
begin
 0046D23C    push        ebp
 0046D23D    mov         ebp,esp
 0046D23F    add         esp,0FFFFFFF8
 0046D242    push        ebx
 0046D243    push        esi
 0046D244    xor         ecx,ecx
 0046D246    mov         dword ptr [ebp-8],ecx
 0046D249    mov         esi,edx
 0046D24B    mov         dword ptr [ebp-4],eax
 0046D24E    xor         eax,eax
 0046D250    push        ebp
 0046D251    push        46D2E6
 0046D256    push        dword ptr fs:[eax]
 0046D259    mov         dword ptr fs:[eax],esp
 0046D25C    mov         eax,dword ptr [ebp-4]
 0046D25F    mov         eax,dword ptr [eax+4]
 0046D262    call        TThreadList.LockList
 0046D267    mov         ebx,eax
 0046D269    xor         eax,eax
 0046D26B    push        ebp
 0046D26C    push        46D2C9
 0046D271    push        dword ptr fs:[eax]
 0046D274    mov         dword ptr fs:[eax],esp
 0046D277    mov         edx,esi
 0046D279    mov         eax,ebx
 0046D27B    call        TList.IndexOf
 0046D280    test        eax,eax
>0046D282    jl          0046D2A7
 0046D284    lea         edx,[ebp-8]
 0046D287    mov         eax,46C2DC;^gvar_005AF664
 0046D28C    call        LoadStr
 0046D291    mov         ecx,dword ptr [ebp-8]
 0046D294    mov         dl,1
 0046D296    mov         eax,[0046C220];EGLContext
 0046D29B    call        Exception.Create;EGLContext.Create
 0046D2A0    call        @RaiseExcept
>0046D2A5    jmp         0046D2B0
 0046D2A7    mov         edx,esi
 0046D2A9    mov         eax,ebx
 0046D2AB    call        TList.Add
 0046D2B0    xor         eax,eax
 0046D2B2    pop         edx
 0046D2B3    pop         ecx
 0046D2B4    pop         ecx
 0046D2B5    mov         dword ptr fs:[eax],edx
 0046D2B8    push        46D2D0
 0046D2BD    mov         eax,dword ptr [ebp-4]
 0046D2C0    mov         eax,dword ptr [eax+4]
 0046D2C3    call        TThreadList.UnlockList
 0046D2C8    ret
>0046D2C9    jmp         @HandleFinally
>0046D2CE    jmp         0046D2BD
 0046D2D0    xor         eax,eax
 0046D2D2    pop         edx
 0046D2D3    pop         ecx
 0046D2D4    pop         ecx
 0046D2D5    mov         dword ptr fs:[eax],edx
 0046D2D8    push        46D2ED
 0046D2DD    lea         eax,[ebp-8]
 0046D2E0    call        @LStrClr
 0046D2E5    ret
>0046D2E6    jmp         @HandleFinally
>0046D2EB    jmp         0046D2DD
 0046D2ED    pop         esi
 0046D2EE    pop         ebx
 0046D2EF    pop         ecx
 0046D2F0    pop         ecx
 0046D2F1    pop         ebp
 0046D2F2    ret
end;*}

//0046D2F4
{*procedure sub_0046D2F4(?:?; ?:?);
begin
 0046D2F4    push        ebp
 0046D2F5    mov         ebp,esp
 0046D2F7    add         esp,0FFFFFFF8
 0046D2FA    push        ebx
 0046D2FB    push        esi
 0046D2FC    xor         ecx,ecx
 0046D2FE    mov         dword ptr [ebp-8],ecx
 0046D301    mov         esi,edx
 0046D303    mov         dword ptr [ebp-4],eax
 0046D306    xor         eax,eax
 0046D308    push        ebp
 0046D309    push        46D39E
 0046D30E    push        dword ptr fs:[eax]
 0046D311    mov         dword ptr fs:[eax],esp
 0046D314    mov         eax,dword ptr [ebp-4]
 0046D317    mov         eax,dword ptr [eax+4]
 0046D31A    call        TThreadList.LockList
 0046D31F    mov         ebx,eax
 0046D321    xor         eax,eax
 0046D323    push        ebp
 0046D324    push        46D381
 0046D329    push        dword ptr fs:[eax]
 0046D32C    mov         dword ptr fs:[eax],esp
 0046D32F    mov         edx,esi
 0046D331    mov         eax,ebx
 0046D333    call        TList.IndexOf
 0046D338    test        eax,eax
>0046D33A    jge         0046D35F
 0046D33C    lea         edx,[ebp-8]
 0046D33F    mov         eax,46C2DC;^gvar_005AF664
 0046D344    call        LoadStr
 0046D349    mov         ecx,dword ptr [ebp-8]
 0046D34C    mov         dl,1
 0046D34E    mov         eax,[0046C220];EGLContext
 0046D353    call        Exception.Create;EGLContext.Create
 0046D358    call        @RaiseExcept
>0046D35D    jmp         0046D368
 0046D35F    mov         edx,esi
 0046D361    mov         eax,ebx
 0046D363    call        TList.Remove
 0046D368    xor         eax,eax
 0046D36A    pop         edx
 0046D36B    pop         ecx
 0046D36C    pop         ecx
 0046D36D    mov         dword ptr fs:[eax],edx
 0046D370    push        46D388
 0046D375    mov         eax,dword ptr [ebp-4]
 0046D378    mov         eax,dword ptr [eax+4]
 0046D37B    call        TThreadList.UnlockList
 0046D380    ret
>0046D381    jmp         @HandleFinally
>0046D386    jmp         0046D375
 0046D388    xor         eax,eax
 0046D38A    pop         edx
 0046D38B    pop         ecx
 0046D38C    pop         ecx
 0046D38D    mov         dword ptr fs:[eax],edx
 0046D390    push        46D3A5
 0046D395    lea         eax,[ebp-8]
 0046D398    call        @LStrClr
 0046D39D    ret
>0046D39E    jmp         @HandleFinally
>0046D3A3    jmp         0046D395
 0046D3A5    pop         esi
 0046D3A6    pop         ebx
 0046D3A7    pop         ecx
 0046D3A8    pop         ecx
 0046D3A9    pop         ebp
 0046D3AA    ret
end;*}

//0046D3AC
{*procedure sub_0046D3AC(?:?);
begin
 0046D3AC    push        ebp
 0046D3AD    mov         ebp,esp
 0046D3AF    push        ecx
 0046D3B0    mov         dword ptr [ebp-4],eax
 0046D3B3    mov         eax,dword ptr [ebp-4]
 0046D3B6    call        0046D208
 0046D3BB    xor         eax,eax
 0046D3BD    push        ebp
 0046D3BE    push        46D3E5
 0046D3C3    push        dword ptr fs:[eax]
 0046D3C6    mov         dword ptr fs:[eax],esp
 0046D3C9    mov         eax,dword ptr [ebp-4]
 0046D3CC    inc         dword ptr [eax+10]
 0046D3CF    xor         eax,eax
 0046D3D1    pop         edx
 0046D3D2    pop         ecx
 0046D3D3    pop         ecx
 0046D3D4    mov         dword ptr fs:[eax],edx
 0046D3D7    push        46D3EC
 0046D3DC    mov         eax,dword ptr [ebp-4]
 0046D3DF    call        0046D214
 0046D3E4    ret
>0046D3E5    jmp         @HandleFinally
>0046D3EA    jmp         0046D3DC
 0046D3EC    pop         ecx
 0046D3ED    pop         ebp
 0046D3EE    ret
end;*}

//0046D3F0
{*procedure sub_0046D3F0(?:?);
begin
 0046D3F0    push        ebp
 0046D3F1    mov         ebp,esp
 0046D3F3    add         esp,0FFFFFFE8
 0046D3F6    push        esi
 0046D3F7    push        edi
 0046D3F8    mov         dword ptr [ebp-4],eax
 0046D3FB    mov         eax,dword ptr [ebp-4]
 0046D3FE    call        0046D208
 0046D403    xor         eax,eax
 0046D405    push        ebp
 0046D406    push        46D493
 0046D40B    push        dword ptr fs:[eax]
 0046D40E    mov         dword ptr fs:[eax],esp
 0046D411    mov         eax,dword ptr [ebp-4]
 0046D414    dec         dword ptr [eax+10]
 0046D417    mov         eax,dword ptr [ebp-4]
 0046D41A    cmp         dword ptr [eax+10],0
>0046D41E    jne         0046D47D
>0046D420    jmp         0046D46E
 0046D422    mov         eax,dword ptr [ebp-4]
 0046D425    mov         eax,dword ptr [eax+0C]
 0046D428    call        @DynArrayHigh
 0046D42D    add         eax,eax
 0046D42F    mov         edx,dword ptr [ebp-4]
 0046D432    mov         edx,dword ptr [edx+0C]
 0046D435    lea         esi,[edx+eax*8]
 0046D438    lea         edi,[ebp-18]
 0046D43B    movs        dword ptr [edi],dword ptr [esi]
 0046D43C    movs        dword ptr [edi],dword ptr [esi]
 0046D43D    movs        dword ptr [edi],dword ptr [esi]
 0046D43E    movs        dword ptr [edi],dword ptr [esi]
 0046D43F    mov         eax,dword ptr [ebp-4]
 0046D442    mov         eax,dword ptr [eax+0C]
 0046D445    call        @DynArrayLength
 0046D44A    dec         eax
 0046D44B    push        eax
 0046D44C    mov         eax,dword ptr [ebp-4]
 0046D44F    add         eax,0C
 0046D452    mov         ecx,1
 0046D457    mov         edx,dword ptr ds:[46C18C];.71
 0046D45D    call        @DynArraySetLength
 0046D462    add         esp,4
 0046D465    mov         edx,dword ptr [ebp-18]
 0046D468    mov         eax,dword ptr [ebp-0C]
 0046D46B    call        dword ptr [ebp-10]
 0046D46E    mov         eax,dword ptr [ebp-4]
 0046D471    mov         eax,dword ptr [eax+0C]
 0046D474    call        @DynArrayLength
 0046D479    test        eax,eax
>0046D47B    jg          0046D422
 0046D47D    xor         eax,eax
 0046D47F    pop         edx
 0046D480    pop         ecx
 0046D481    pop         ecx
 0046D482    mov         dword ptr fs:[eax],edx
 0046D485    push        46D49A
 0046D48A    mov         eax,dword ptr [ebp-4]
 0046D48D    call        0046D214
 0046D492    ret
>0046D493    jmp         @HandleFinally
>0046D498    jmp         0046D48A
 0046D49A    pop         edi
 0046D49B    pop         esi
 0046D49C    mov         esp,ebp
 0046D49E    pop         ebp
 0046D49F    ret
end;*}

//0046D4A0
{*procedure sub_0046D4A0(?:?);
begin
 0046D4A0    push        ebx
 0046D4A1    mov         ebx,eax
 0046D4A3    mov         byte ptr [ebx+8],1
 0046D4A7    mov         eax,ebx
 0046D4A9    call        0046D220
 0046D4AE    test        eax,eax
>0046D4B0    jne         0046D4C0
 0046D4B2    xor         eax,eax
 0046D4B4    mov         [005E14A4],eax;gvar_005E14A4:TGLContextManager
 0046D4B9    mov         eax,ebx
 0046D4BB    call        TObject.Free
 0046D4C0    pop         ebx
 0046D4C1    ret
end;*}

Initialization
//0046D510
{*
 0046D510    sub         dword ptr ds:[5E14A8],1
>0046D517    jae         0046D52A
 0046D519    mov         dl,1
 0046D51B    mov         eax,[0046C1B0];TGLContextManager
 0046D520    call        TGLContextManager.Create;TGLContextManager.Create
 0046D525    mov         [005E14A4],eax;gvar_005E14A4:TGLContextManager
 0046D52A    ret
*}
Finalization
//0046D4C4
{*
 0046D4C4    push        ebp
 0046D4C5    mov         ebp,esp
 0046D4C7    xor         eax,eax
 0046D4C9    push        ebp
 0046D4CA    push        46D506
 0046D4CF    push        dword ptr fs:[eax]
 0046D4D2    mov         dword ptr fs:[eax],esp
 0046D4D5    inc         dword ptr ds:[5E14A8]
>0046D4DB    jne         0046D4F8
 0046D4DD    mov         eax,[005E14A4];gvar_005E14A4:TGLContextManager
 0046D4E2    call        0046D4A0
 0046D4E7    mov         eax,[005AD1E8];0x0 gvar_005AD1E8:TList
 0046D4EC    call        TObject.Free
 0046D4F1    xor         eax,eax
 0046D4F3    mov         [005AD1E8],eax;gvar_005AD1E8:TList
 0046D4F8    xor         eax,eax
 0046D4FA    pop         edx
 0046D4FB    pop         ecx
 0046D4FC    pop         ecx
 0046D4FD    mov         dword ptr fs:[eax],edx
 0046D500    push        46D50D
 0046D505    ret
>0046D506    jmp         @HandleFinally
>0046D50B    jmp         0046D505
 0046D50D    pop         ebp
 0046D50E    ret
*}
end.