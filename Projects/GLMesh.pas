//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLMesh;

interface

uses
  SysUtils, Classes, GLMesh;

type
  TVertexList = class(TGLUpdateAbleObject)
  public
    f18:dword;//f18
    f1C:dword;//f1C
    f20:dword;//f20
    f24:dword;//f24
    f28:dword;//f28
    destructor Destroy; virtual;//0048B8FC
    procedure Assign(Source:TPersistent); virtual;//v8//0048BB58
    constructor Create; virtual;//vC//0048B8B0
  end;
  TGLMesh = class(TGLSceneObject)
  public
    f98:TVertexList;//f98
    Mode:TMeshMode;//f9C
    VertexMode:TVertexMode;//f9D
    destructor Destroy; virtual;//0048BC84
    procedure Assign(Source:TPersistent); virtual;//v8//0048BF5C
    constructor Create(AOwner:TComponent); virtual;//v2C//0048BBB4
    //procedure v64(?:?); virtual;//v64//0048BCC0
    procedure SetMode(Value:TMeshMode);//0048BF1C
    procedure SetVertexMode(Value:TVertexMode);//0048BF3C
  end;
    constructor Create;//0048B8B0
    destructor Destroy;//0048B8FC
    //procedure sub_0048B934(?:?);//0048B934
    procedure sub_0048B9D0(?:TVertexList);//0048B9D0
    //function sub_0048B9D8(?:TVertexList):?;//0048B9D8
    procedure sub_0048B9DC(?:TVertexList);//0048B9DC
    procedure sub_0048B9E4(?:TVertexList);//0048B9E4
    function sub_0048B9EC(?:TVertexList):Boolean;//0048B9EC
    //procedure sub_0048B9F4(?:TVertexList; ?:?);//0048B9F4
    procedure sub_0048BA80(?:TVertexList);//0048BA80
    procedure sub_0048BAB4(?:TVertexList);//0048BAB4
    //procedure sub_0048BAD8(?:TVertexList; ?:?; ?:?; ?:?; ?:?);//0048BAD8
    procedure Assign(Source:TPersistent);//0048BB58
    constructor Create(AOwner:TComponent);//0048BBB4
    destructor Destroy;//0048BC84
    procedure sub_0048BCB4;//0048BCB4
    //procedure sub_0048BCC0(?:?);//0048BCC0
    procedure Assign(Source:TPersistent);//0048BF5C

implementation

//0048B8B0
constructor TVertexList.Create;
begin
{*
 0048B8B0    push        ebx
 0048B8B1    push        esi
 0048B8B2    test        dl,dl
>0048B8B4    je          0048B8BE
 0048B8B6    add         esp,0FFFFFFF0
 0048B8B9    call        @ClassCreate
 0048B8BE    mov         ebx,edx
 0048B8C0    mov         esi,eax
 0048B8C2    xor         edx,edx
 0048B8C4    mov         eax,esi
 0048B8C6    call        0046B394
 0048B8CB    xor         eax,eax
 0048B8CD    mov         dword ptr [esi+18],eax;TVertexList.?f18:dword
 0048B8D0    xor         eax,eax
 0048B8D2    mov         dword ptr [esi+1C],eax;TVertexList.?f1C:dword
 0048B8D5    xor         eax,eax
 0048B8D7    mov         dword ptr [esi+20],eax;TVertexList.?f20:dword
 0048B8DA    mov         dword ptr [esi+24],100;TVertexList.?f24:dword
 0048B8E1    mov         eax,esi
 0048B8E3    test        bl,bl
>0048B8E5    je          0048B8F6
 0048B8E7    call        @AfterConstruction
 0048B8EC    pop         dword ptr fs:[0]
 0048B8F3    add         esp,0C
 0048B8F6    mov         eax,esi
 0048B8F8    pop         esi
 0048B8F9    pop         ebx
 0048B8FA    ret
*}
end;

//0048B8FC
destructor TVertexList.Destroy;
begin
{*
 0048B8FC    push        ebx
 0048B8FD    push        esi
 0048B8FE    call        @BeforeDestruction
 0048B903    mov         ebx,edx
 0048B905    mov         esi,eax
 0048B907    xor         edx,edx
 0048B909    mov         eax,esi
 0048B90B    call        0048B9F4
 0048B910    mov         eax,dword ptr [esi+18];TVertexList.?f18:dword
 0048B913    call        @FreeMem
 0048B918    mov         edx,ebx
 0048B91A    and         dl,0FC
 0048B91D    mov         eax,esi
 0048B91F    call        TMemoryStream.Destroy
 0048B924    test        bl,bl
>0048B926    jle         0048B92F
 0048B928    mov         eax,esi
 0048B92A    call        @ClassDestroy
 0048B92F    pop         esi
 0048B930    pop         ebx
 0048B931    ret
*}
end;

//0048B934
{*procedure sub_0048B934(?:?);
begin
 0048B934    push        ebx
 0048B935    mov         ebx,eax
 0048B937    mov         eax,ebx
 0048B939    call        0048B9EC
 0048B93E    test        al,al
>0048B940    je          0048B956
 0048B942    mov         ecx,0FA
 0048B947    mov         edx,48B978;'C:\GLScene\glscene_v_1000714\Source\GLMesh.pas'
 0048B94C    mov         eax,48B9B0;'Cannot add to a locked list !'
 0048B951    call        @Assert
 0048B956    mov         eax,dword ptr [ebx+24]
 0048B959    add         dword ptr [ebx+20],eax
 0048B95C    mov         edx,dword ptr [ebx+20]
 0048B95F    shl         edx,4
 0048B962    lea         edx,[edx+edx*2]
 0048B965    lea         eax,[ebx+18]
 0048B968    call        @ReallocMem
 0048B96D    pop         ebx
 0048B96E    ret
end;*}

//0048B9D0
procedure sub_0048B9D0(?:TVertexList);
begin
{*
 0048B9D0    mov         eax,dword ptr [eax+18]
 0048B9D3    add         eax,8
 0048B9D6    ret
*}
end;

//0048B9D8
{*function sub_0048B9D8(?:TVertexList):?;
begin
 0048B9D8    mov         eax,dword ptr [eax+18]
 0048B9DB    ret
end;*}

//0048B9DC
procedure sub_0048B9DC(?:TVertexList);
begin
{*
 0048B9DC    mov         eax,dword ptr [eax+18]
 0048B9DF    add         eax,18
 0048B9E2    ret
*}
end;

//0048B9E4
procedure sub_0048B9E4(?:TVertexList);
begin
{*
 0048B9E4    mov         eax,dword ptr [eax+18]
 0048B9E7    add         eax,24
 0048B9EA    ret
*}
end;

//0048B9EC
function sub_0048B9EC(?:TVertexList):Boolean;
begin
{*
 0048B9EC    cmp         dword ptr [eax+28],0
 0048B9F0    setne       al
 0048B9F3    ret
*}
end;

//0048B9F4
{*procedure sub_0048B9F4(?:TVertexList; ?:?);
begin
 0048B9F4    push        ebx
 0048B9F5    push        esi
 0048B9F6    push        edi
 0048B9F7    mov         ebx,edx
 0048B9F9    mov         esi,eax
 0048B9FB    mov         eax,esi
 0048B9FD    call        0048B9EC
 0048BA02    cmp         bl,al
>0048BA04    je          0048BA7B
 0048BA06    mov         eax,[005AE4CC];^gvar_005E0D1F
 0048BA0B    cmp         byte ptr [eax],0
>0048BA0E    je          0048BA7B
 0048BA10    call        0046C2FC
 0048BA15    test        eax,eax
>0048BA17    je          0048BA7B
 0048BA19    mov         edi,dword ptr [esi+1C];TVertexList.?f1C:dword
 0048BA1C    shl         edi,4
 0048BA1F    lea         edi,[edi+edi*2]
 0048BA22    test        bl,bl
>0048BA24    je          0048BA63
 0048BA26    mov         eax,dword ptr [esi+18];TVertexList.?f18:dword
 0048BA29    mov         dword ptr [esi+28],eax;TVertexList.?f28:dword
 0048BA2C    push        3F000000
 0048BA31    push        0
 0048BA33    push        0
 0048BA35    push        edi
 0048BA36    mov         eax,[005AE2D8];^gvar_005E119C
 0048BA3B    mov         eax,dword ptr [eax]
 0048BA3D    call        eax
 0048BA3F    mov         ebx,eax
 0048BA41    mov         dword ptr [esi+18],ebx;TVertexList.?f18:dword
 0048BA44    test        ebx,ebx
>0048BA46    jne         0048BA55
 0048BA48    mov         eax,dword ptr [esi+28];TVertexList.?f28:dword
 0048BA4B    mov         dword ptr [esi+18],eax;TVertexList.?f18:dword
 0048BA4E    xor         eax,eax
 0048BA50    mov         dword ptr [esi+28],eax;TVertexList.?f28:dword
>0048BA53    jmp         0048BA7B
 0048BA55    mov         edx,ebx
 0048BA57    mov         eax,dword ptr [esi+28];TVertexList.?f28:dword
 0048BA5A    mov         ecx,edi
 0048BA5C    call        Move
>0048BA61    jmp         0048BA7B
 0048BA63    mov         eax,dword ptr [esi+18];TVertexList.?f18:dword
 0048BA66    push        eax
 0048BA67    mov         eax,[005AE198];^gvar_005E11A0
 0048BA6C    mov         eax,dword ptr [eax]
 0048BA6E    call        eax
 0048BA70    mov         eax,dword ptr [esi+28];TVertexList.?f28:dword
 0048BA73    mov         dword ptr [esi+18],eax;TVertexList.?f18:dword
 0048BA76    xor         eax,eax
 0048BA78    mov         dword ptr [esi+28],eax;TVertexList.?f28:dword
 0048BA7B    pop         edi
 0048BA7C    pop         esi
 0048BA7D    pop         ebx
 0048BA7E    ret
end;*}

//0048BA80
procedure sub_0048BA80(?:TVertexList);
begin
{*
 0048BA80    push        ebx
 0048BA81    mov         ebx,eax
 0048BA83    mov         eax,ebx
 0048BA85    call        0048B9EC
 0048BA8A    test        al,al
>0048BA8C    je          0048BAAF
 0048BA8E    mov         eax,dword ptr [ebx+18]
 0048BA91    push        eax
 0048BA92    mov         eax,dword ptr [ebx+1C]
 0048BA95    shl         eax,4
 0048BA98    lea         eax,[eax+eax*2]
 0048BA9B    push        eax
 0048BA9C    mov         eax,[005AE744];^gvar_005E1198
 0048BAA1    mov         eax,dword ptr [eax]
 0048BAA3    call        eax
 0048BAA5    push        851D
 0048BAAA    call        OpenGL32.glEnableClientState
 0048BAAF    pop         ebx
 0048BAB0    ret
*}
end;

//0048BAB4
procedure sub_0048BAB4(?:TVertexList);
begin
{*
 0048BAB4    push        ebx
 0048BAB5    mov         ebx,eax
 0048BAB7    mov         eax,ebx
 0048BAB9    call        0048B9EC
 0048BABE    test        al,al
>0048BAC0    je          0048BAD5
 0048BAC2    push        851D
 0048BAC7    call        OpenGL32.glDisableClientState
 0048BACC    mov         eax,[005AE3E0];^gvar_005E1194
 0048BAD1    mov         eax,dword ptr [eax]
 0048BAD3    call        eax
 0048BAD5    pop         ebx
 0048BAD6    ret
*}
end;

//0048BAD8
{*procedure sub_0048BAD8(?:TVertexList; ?:?; ?:?; ?:?; ?:?);
begin
 0048BAD8    push        ebp
 0048BAD9    mov         ebp,esp
 0048BADB    push        ecx
 0048BADC    push        ebx
 0048BADD    push        esi
 0048BADE    push        edi
 0048BADF    mov         dword ptr [ebp-4],ecx
 0048BAE2    mov         esi,edx
 0048BAE4    mov         ebx,eax
 0048BAE6    mov         eax,dword ptr [ebx+1C]
 0048BAE9    cmp         eax,dword ptr [ebx+20]
>0048BAEC    jne         0048BAF5
 0048BAEE    mov         eax,ebx
 0048BAF0    call        0048B934
 0048BAF5    mov         eax,dword ptr [ebx+1C]
 0048BAF8    add         eax,eax
 0048BAFA    lea         eax,[eax+eax*2]
 0048BAFD    mov         edx,dword ptr [ebx+18]
 0048BB00    lea         eax,[edx+eax*8]
 0048BB03    mov         edx,dword ptr [ebp+8]
 0048BB06    mov         ecx,dword ptr [edx]
 0048BB08    mov         dword ptr [eax],ecx
 0048BB0A    mov         ecx,dword ptr [edx+4]
 0048BB0D    mov         dword ptr [eax+4],ecx
 0048BB10    mov         edx,dword ptr [ebp+0C]
 0048BB13    push        esi
 0048BB14    mov         esi,edx
 0048BB16    lea         edi,[eax+8]
 0048BB19    movs        dword ptr [edi],dword ptr [esi]
 0048BB1A    movs        dword ptr [edi],dword ptr [esi]
 0048BB1B    movs        dword ptr [edi],dword ptr [esi]
 0048BB1C    movs        dword ptr [edi],dword ptr [esi]
 0048BB1D    pop         esi
 0048BB1E    mov         edx,dword ptr [ebp-4]
 0048BB21    mov         ecx,dword ptr [edx]
 0048BB23    mov         dword ptr [eax+18],ecx
 0048BB26    mov         ecx,dword ptr [edx+4]
 0048BB29    mov         dword ptr [eax+1C],ecx
 0048BB2C    mov         ecx,dword ptr [edx+8]
 0048BB2F    mov         dword ptr [eax+20],ecx
 0048BB32    mov         edx,dword ptr [esi]
 0048BB34    mov         dword ptr [eax+24],edx
 0048BB37    mov         edx,dword ptr [esi+4]
 0048BB3A    mov         dword ptr [eax+28],edx
 0048BB3D    mov         edx,dword ptr [esi+8]
 0048BB40    mov         dword ptr [eax+2C],edx
 0048BB43    inc         dword ptr [ebx+1C]
 0048BB46    mov         edx,ebx
 0048BB48    mov         eax,ebx
 0048BB4A    mov         ecx,dword ptr [eax]
 0048BB4C    call        dword ptr [ecx+10]
 0048BB4F    pop         edi
 0048BB50    pop         esi
 0048BB51    pop         ebx
 0048BB52    pop         ecx
 0048BB53    pop         ebp
 0048BB54    ret         8
end;*}

//0048BB58
procedure TVertexList.Assign(Source:TPersistent);
begin
{*
 0048BB58    push        ebx
 0048BB59    push        esi
 0048BB5A    push        edi
 0048BB5B    mov         esi,edx
 0048BB5D    mov         ebx,eax
 0048BB5F    test        esi,esi
>0048BB61    je          0048BBA6
 0048BB63    mov         eax,esi
 0048BB65    mov         edx,dword ptr ds:[48B6F8];TVertexList
 0048BB6B    call        @IsClass
 0048BB70    test        al,al
>0048BB72    je          0048BBA6
 0048BB74    mov         edi,esi
 0048BB76    mov         eax,dword ptr [edi+1C]
 0048BB79    mov         dword ptr [ebx+1C],eax;TVertexList.?f1C:dword
 0048BB7C    mov         dword ptr [ebx+20],eax;TVertexList.?f20:dword
 0048BB7F    mov         edx,dword ptr [ebx+1C];TVertexList.?f1C:dword
 0048BB82    shl         edx,4
 0048BB85    lea         edx,[edx+edx*2]
 0048BB88    lea         eax,[ebx+18];TVertexList.?f18:dword
 0048BB8B    call        @ReallocMem
 0048BB90    mov         ecx,dword ptr [ebx+1C];TVertexList.?f1C:dword
 0048BB93    shl         ecx,4
 0048BB96    lea         ecx,[ecx+ecx*2]
 0048BB99    mov         edx,dword ptr [ebx+18];TVertexList.?f18:dword
 0048BB9C    mov         eax,dword ptr [edi+18]
 0048BB9F    call        Move
>0048BBA4    jmp         0048BBAF
 0048BBA6    mov         edx,esi
 0048BBA8    mov         eax,ebx
 0048BBAA    call        TPersistent.Assign
 0048BBAF    pop         edi
 0048BBB0    pop         esi
 0048BBB1    pop         ebx
 0048BBB2    ret
*}
end;

//0048BBB4
constructor TGLMesh.Create(AOwner:TComponent);
begin
{*
 0048BBB4    push        ebp
 0048BBB5    mov         ebp,esp
 0048BBB7    push        ecx
 0048BBB8    push        ebx
 0048BBB9    push        esi
 0048BBBA    test        dl,dl
>0048BBBC    je          0048BBC6
 0048BBBE    add         esp,0FFFFFFF0
 0048BBC1    call        @ClassCreate
 0048BBC6    mov         byte ptr [ebp-1],dl
 0048BBC9    mov         ebx,eax
 0048BBCB    xor         edx,edx
 0048BBCD    mov         eax,ebx
 0048BBCF    call        TGLCustomSceneObject.Create
 0048BBD4    mov         ecx,ebx
 0048BBD6    mov         dl,1
 0048BBD8    mov         eax,[0048B6F8];TVertexList
 0048BBDD    call        TVertexList.Create;TVertexList.Create
 0048BBE2    mov         esi,eax
 0048BBE4    mov         dword ptr [ebx+98],esi;TGLMesh.?f98:TVertexList
 0048BBEA    mov         eax,[005AE1F8];^gvar_005ACF84
 0048BBEF    push        eax
 0048BBF0    mov         eax,[005AE48C];^gvar_005ACEE0
 0048BBF5    push        eax
 0048BBF6    mov         ecx,dword ptr ds:[5AE464];^gvar_005ACF00
 0048BBFC    mov         edx,dword ptr ds:[5AE610];^gvar_005ACEE8
 0048BC02    mov         eax,esi
 0048BC04    call        0048BAD8
 0048BC09    mov         eax,[005AE1F8];^gvar_005ACF84
 0048BC0E    push        eax
 0048BC0F    mov         eax,[005AE48C];^gvar_005ACEE0
 0048BC14    push        eax
 0048BC15    mov         ecx,dword ptr ds:[5AE464];^gvar_005ACF00
 0048BC1B    mov         edx,dword ptr ds:[5AE58C];^gvar_005ACEF4
 0048BC21    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BC27    call        0048BAD8
 0048BC2C    mov         eax,[005AE1F8];^gvar_005ACF84
 0048BC31    push        eax
 0048BC32    mov         eax,[005AE48C];^gvar_005ACEE0
 0048BC37    push        eax
 0048BC38    mov         ecx,dword ptr ds:[5AE464];^gvar_005ACF00
 0048BC3E    mov         edx,dword ptr ds:[5AE464];^gvar_005ACF00
 0048BC44    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BC4A    call        0048BAD8
 0048BC4F    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BC55    mov         dword ptr [eax+14],ebx;TVertexList.?f14:TGLTextureExItem
 0048BC58    mov         dword ptr [eax+10],48BCB4;TVertexList.?f10:? sub_0048BCB4
 0048BC5F    mov         byte ptr [ebx+9D],3;TGLMesh.VertexMode:TVertexMode
 0048BC66    mov         eax,ebx
 0048BC68    cmp         byte ptr [ebp-1],0
>0048BC6C    je          0048BC7D
 0048BC6E    call        @AfterConstruction
 0048BC73    pop         dword ptr fs:[0]
 0048BC7A    add         esp,0C
 0048BC7D    mov         eax,ebx
 0048BC7F    pop         esi
 0048BC80    pop         ebx
 0048BC81    pop         ecx
 0048BC82    pop         ebp
 0048BC83    ret
*}
end;

//0048BC84
destructor TGLMesh.Destroy;
begin
{*
 0048BC84    push        ebx
 0048BC85    push        esi
 0048BC86    call        @BeforeDestruction
 0048BC8B    mov         ebx,edx
 0048BC8D    mov         esi,eax
 0048BC8F    mov         eax,dword ptr [esi+98];TGLMesh.?f98:TVertexList
 0048BC95    call        TObject.Free
 0048BC9A    mov         edx,ebx
 0048BC9C    and         dl,0FC
 0048BC9F    mov         eax,esi
 0048BCA1    call        TGLCustomSceneObject.Destroy
 0048BCA6    test        bl,bl
>0048BCA8    jle         0048BCB1
 0048BCAA    mov         eax,esi
 0048BCAC    call        @ClassDestroy
 0048BCB1    pop         esi
 0048BCB2    pop         ebx
 0048BCB3    ret
*}
end;

//0048BCB4
procedure sub_0048BCB4;
begin
{*
 0048BCB4    push        esi
 0048BCB5    mov         si,0FFE7
 0048BCB9    call        @CallDynaInst
 0048BCBE    pop         esi
 0048BCBF    ret
*}
end;

//0048BCC0
{*procedure sub_0048BCC0(?:?);
begin
 0048BCC0    push        ebp
 0048BCC1    mov         ebp,esp
 0048BCC3    push        0
 0048BCC5    push        ebx
 0048BCC6    push        esi
 0048BCC7    mov         esi,edx
 0048BCC9    mov         ebx,eax
 0048BCCB    xor         eax,eax
 0048BCCD    push        ebp
 0048BCCE    push        48BEBB
 0048BCD3    push        dword ptr fs:[eax]
 0048BCD6    mov         dword ptr fs:[eax],esp
 0048BCD9    mov         edx,esi
 0048BCDB    mov         eax,ebx
 0048BCDD    call        0047B730
 0048BCE2    test        byte ptr [ebx+3C],1;TGLMesh.?f3C:byte
>0048BCE6    je          0048BCF3
 0048BCE8    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BCEE    call        0048BA80
 0048BCF3    push        2009
 0048BCF8    call        OpenGL32.glPushAttrib
 0048BCFD    xor         eax,eax
 0048BCFF    mov         al,byte ptr [ebx+9D];TGLMesh.VertexMode:TVertexMode
 0048BD05    cmp         eax,5
>0048BD08    ja          0048BDB2
 0048BD0E    jmp         dword ptr [eax*4+48BD15]
 0048BD0E    dd          0048BD2D
 0048BD0E    dd          0048BD4A
 0048BD0E    dd          0048BD64
 0048BD0E    dd          0048BD7E
 0048BD0E    dd          0048BD7E
 0048BD0E    dd          0048BD98
 0048BD2D    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BD33    call        0048B9E4
 0048BD38    push        eax
 0048BD39    push        30
 0048BD3B    push        2A21
 0048BD40    call        OpenGL32.glInterleavedArrays
>0048BD45    jmp         0048BDD1
 0048BD4A    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BD50    call        0048B9DC
 0048BD55    push        eax
 0048BD56    push        30
 0048BD58    push        2A25
 0048BD5D    call        OpenGL32.glInterleavedArrays
>0048BD62    jmp         0048BDD1
 0048BD64    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BD6A    call        0048B9D0
 0048BD6F    push        eax
 0048BD70    push        30
 0048BD72    push        2A26
 0048BD77    call        OpenGL32.glInterleavedArrays
>0048BD7C    jmp         0048BDD1
 0048BD7E    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BD84    call        0048B9D8
 0048BD89    push        eax
 0048BD8A    push        0
 0048BD8C    push        2A2C
 0048BD91    call        OpenGL32.glInterleavedArrays
>0048BD96    jmp         0048BDD1
 0048BD98    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BD9E    call        0048B9D8
 0048BDA3    push        eax
 0048BDA4    push        0
 0048BDA6    push        2A27
 0048BDAB    call        OpenGL32.glInterleavedArrays
>0048BDB0    jmp         0048BDD1
 0048BDB2    lea         edx,[ebp-4]
 0048BDB5    mov         eax,[005AE4E8];^SResString15:TResStringRec
 0048BDBA    call        LoadStr
 0048BDBF    mov         eax,dword ptr [ebp-4]
 0048BDC2    mov         ecx,262
 0048BDC7    mov         edx,48BED0;'C:\GLScene\glscene_v_1000714\Source\GLMesh.pas'
 0048BDCC    call        @Assert
 0048BDD1    mov         al,byte ptr [ebx+9D];TGLMesh.VertexMode:TVertexMode
 0048BDD7    add         al,0FE
 0048BDD9    sub         al,2
>0048BDDB    jae         0048BDFE
 0048BDDD    push        0B57
 0048BDE2    call        OpenGL32.glEnable
 0048BDE7    push        1602
 0048BDEC    push        408
 0048BDF1    call        OpenGL32.glColorMaterial
 0048BDF6    mov         eax,dword ptr [esi+5C]
 0048BDF9    call        0046D830
 0048BDFE    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BE04    mov         eax,dword ptr [eax+1C];TVertexList.?f1C:dword
 0048BE07    xor         edx,edx
 0048BE09    mov         dl,byte ptr [ebx+9C];TGLMesh.Mode:TMeshMode
 0048BE0F    cmp         edx,5
>0048BE12    ja          0048BE7B
 0048BE14    jmp         dword ptr [edx*4+48BE1B]
 0048BE14    dd          0048BE33
 0048BE14    dd          0048BE3F
 0048BE14    dd          0048BE4B
 0048BE14    dd          0048BE57
 0048BE14    dd          0048BE63
 0048BE14    dd          0048BE6F
 0048BE33    push        eax
 0048BE34    push        0
 0048BE36    push        5
 0048BE38    call        OpenGL32.glDrawArrays
>0048BE3D    jmp         0048BE8F
 0048BE3F    push        eax
 0048BE40    push        0
 0048BE42    push        6
 0048BE44    call        OpenGL32.glDrawArrays
>0048BE49    jmp         0048BE8F
 0048BE4B    push        eax
 0048BE4C    push        0
 0048BE4E    push        4
 0048BE50    call        OpenGL32.glDrawArrays
>0048BE55    jmp         0048BE8F
 0048BE57    push        eax
 0048BE58    push        0
 0048BE5A    push        8
 0048BE5C    call        OpenGL32.glDrawArrays
>0048BE61    jmp         0048BE8F
 0048BE63    push        eax
 0048BE64    push        0
 0048BE66    push        7
 0048BE68    call        OpenGL32.glDrawArrays
>0048BE6D    jmp         0048BE8F
 0048BE6F    push        eax
 0048BE70    push        0
 0048BE72    push        9
 0048BE74    call        OpenGL32.glDrawArrays
>0048BE79    jmp         0048BE8F
 0048BE7B    mov         ecx,272
 0048BE80    mov         edx,48BED0;'C:\GLScene\glscene_v_1000714\Source\GLMesh.pas'
 0048BE85    mov         eax,48BF08;'Assertion failure'
 0048BE8A    call        @Assert
 0048BE8F    call        OpenGL32.glPopAttrib
 0048BE94    test        byte ptr [ebx+3C],1;TGLMesh.?f3C:byte
>0048BE98    je          0048BEA5
 0048BE9A    mov         eax,dword ptr [ebx+98];TGLMesh.?f98:TVertexList
 0048BEA0    call        0048BAB4
 0048BEA5    xor         eax,eax
 0048BEA7    pop         edx
 0048BEA8    pop         ecx
 0048BEA9    pop         ecx
 0048BEAA    mov         dword ptr fs:[eax],edx
 0048BEAD    push        48BEC2
 0048BEB2    lea         eax,[ebp-4]
 0048BEB5    call        @LStrClr
 0048BEBA    ret
>0048BEBB    jmp         @HandleFinally
>0048BEC0    jmp         0048BEB2
 0048BEC2    pop         esi
 0048BEC3    pop         ebx
 0048BEC4    pop         ecx
 0048BEC5    pop         ebp
 0048BEC6    ret
end;*}

//0048BF1C
procedure TGLMesh.SetMode(Value:TMeshMode);
begin
{*
 0048BF1C    push        esi
 0048BF1D    mov         esi,eax
 0048BF1F    cmp         dl,byte ptr [esi+9C];TGLMesh.Mode:TMeshMode
>0048BF25    je          0048BF38
 0048BF27    mov         byte ptr [esi+9C],dl;TGLMesh.Mode:TMeshMode
 0048BF2D    mov         eax,esi
 0048BF2F    mov         si,0FFE7
 0048BF33    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048BF38    pop         esi
 0048BF39    ret
*}
end;

//0048BF3C
procedure TGLMesh.SetVertexMode(Value:TVertexMode);
begin
{*
 0048BF3C    push        esi
 0048BF3D    mov         esi,eax
 0048BF3F    cmp         dl,byte ptr [esi+9D];TGLMesh.VertexMode:TVertexMode
>0048BF45    je          0048BF58
 0048BF47    mov         byte ptr [esi+9D],dl;TGLMesh.VertexMode:TVertexMode
 0048BF4D    mov         eax,esi
 0048BF4F    mov         si,0FFE7
 0048BF53    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048BF58    pop         esi
 0048BF59    ret
*}
end;

//0048BF5C
procedure TGLMesh.Assign(Source:TPersistent);
begin
{*
 0048BF5C    push        ebx
 0048BF5D    push        esi
 0048BF5E    push        edi
 0048BF5F    mov         ebx,edx
 0048BF61    mov         esi,eax
 0048BF63    test        ebx,ebx
>0048BF65    je          0048BFA5
 0048BF67    mov         eax,ebx
 0048BF69    mov         edx,dword ptr ds:[48B788];TGLMesh
 0048BF6F    call        @IsClass
 0048BF74    test        al,al
>0048BF76    je          0048BFA5
 0048BF78    mov         edi,ebx
 0048BF7A    mov         edx,dword ptr [edi+98]
 0048BF80    mov         eax,dword ptr [esi+98];TGLMesh.?f98:TVertexList
 0048BF86    mov         ecx,dword ptr [eax]
 0048BF88    call        dword ptr [ecx+8];TVertexList.Assign
 0048BF8B    mov         al,byte ptr [edi+9C]
 0048BF91    mov         byte ptr [esi+9C],al;TGLMesh.Mode:TMeshMode
 0048BF97    mov         al,byte ptr [edi+9D]
 0048BF9D    mov         byte ptr [esi+9D],al;TGLMesh.VertexMode:TVertexMode
>0048BFA3    jmp         0048BFAE
 0048BFA5    mov         edx,ebx
 0048BFA7    mov         eax,esi
 0048BFA9    call        TGLCustomSceneObject.Assign
 0048BFAE    pop         edi
 0048BFAF    pop         esi
 0048BFB0    pop         ebx
 0048BFB1    ret
*}
end;

Initialization
//0048BFE4
{*
 0048BFE4    push        ebp
 0048BFE5    mov         ebp,esp
 0048BFE7    push        ecx
 0048BFE8    sub         dword ptr ds:[5E1554],1
>0048BFEF    jae         0048C003
 0048BFF1    mov         eax,[0048B788];TGLMesh
 0048BFF6    mov         dword ptr [ebp-4],eax
 0048BFF9    lea         eax,[ebp-4]
 0048BFFC    xor         edx,edx
 0048BFFE    call        RegisterClasses
 0048C003    pop         ecx
 0048C004    pop         ebp
 0048C005    ret
*}
Finalization
end.