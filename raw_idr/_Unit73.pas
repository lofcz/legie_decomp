//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit73;

interface

uses
  SysUtils, Classes;

type
  TGLStateCache = class(TObject)
  public
    fB8:byte;//fB8
    fB9:byte;//fB9
    destructor Destroy; virtual;//0046D5D0
    constructor Create; virtual;//v0//0046D58C
  end;
    constructor Create;//0046D58C
    destructor Destroy;//0046D5D0
    //procedure sub_0046D5F8(?:?; ?:?);//0046D5F8
    //procedure sub_0046D634(?:?; ?:?);//0046D634
    //procedure sub_0046D670(?:?; ?:?; ?:?);//0046D670
    //procedure sub_0046D6D8(?:?);//0046D6D8
    //procedure sub_0046D6EC(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//0046D6EC
    //procedure sub_0046D7F0(?:?; ?:?; ?:?);//0046D7F0
    //procedure sub_0046D830(?:?);//0046D830
    //procedure sub_0046D8B8(?:?; ?:?; ?:?);//0046D8B8
    //procedure sub_0046D8E4(?:?);//0046D8E4
    //procedure sub_0046D8F8(?:?; ?:?);//0046D8F8
    //procedure sub_0046D920(?:?);//0046D920
    //procedure sub_0046D950(?:?);//0046D950
    //procedure sub_0046D97C(?:?);//0046D97C
    //procedure sub_0046D994(?:?);//0046D994

implementation

//0046D58C
constructor TGLStateCache.Create;
begin
{*
 0046D58C    push        ebx
 0046D58D    push        esi
 0046D58E    test        dl,dl
>0046D590    je          0046D59A
 0046D592    add         esp,0FFFFFFF0
 0046D595    call        @ClassCreate
 0046D59A    mov         ebx,edx
 0046D59C    mov         esi,eax
 0046D59E    xor         edx,edx
 0046D5A0    mov         eax,esi
 0046D5A2    call        TObject.Create
 0046D5A7    mov         byte ptr [esi+0B9],1;TGLStateCache.?fB9:byte
 0046D5AE    mov         byte ptr [esi+0B8],1;TGLStateCache.?fB8:byte
 0046D5B5    mov         eax,esi
 0046D5B7    test        bl,bl
>0046D5B9    je          0046D5CA
 0046D5BB    call        @AfterConstruction
 0046D5C0    pop         dword ptr fs:[0]
 0046D5C7    add         esp,0C
 0046D5CA    mov         eax,esi
 0046D5CC    pop         esi
 0046D5CD    pop         ebx
 0046D5CE    ret
*}
end;

//0046D5D0
destructor TGLStateCache.Destroy;
begin
{*
 0046D5D0    push        ebx
 0046D5D1    push        esi
 0046D5D2    call        @BeforeDestruction
 0046D5D7    mov         ebx,edx
 0046D5D9    mov         esi,eax
 0046D5DB    mov         edx,ebx
 0046D5DD    and         dl,0FC
 0046D5E0    mov         eax,esi
 0046D5E2    call        TObject.Destroy
 0046D5E7    test        bl,bl
>0046D5E9    jle         0046D5F2
 0046D5EB    mov         eax,esi
 0046D5ED    call        @ClassDestroy
 0046D5F2    pop         esi
 0046D5F3    pop         ebx
 0046D5F4    ret
*}
end;

//0046D5F8
{*procedure sub_0046D5F8(?:?; ?:?);
begin
 0046D5F8    push        ebx
 0046D5F9    push        esi
 0046D5FA    mov         ebx,edx
 0046D5FC    mov         esi,eax
 0046D5FE    mov         eax,ebx
 0046D600    cmp         al,1F
>0046D602    ja          0046D60E
 0046D604    and         eax,7F
 0046D607    bt          dword ptr [esi+8C],eax
>0046D60E    jb          0046D631
 0046D610    mov         eax,ebx
 0046D612    cmp         al,1F
>0046D614    ja          0046D620
 0046D616    and         eax,7F
 0046D619    bts         dword ptr [esi+8C],eax
 0046D620    xor         eax,eax
 0046D622    mov         al,bl
 0046D624    mov         eax,dword ptr [eax*4+5AD1F0]
 0046D62B    push        eax
 0046D62C    call        OpenGL32.glEnable
 0046D631    pop         esi
 0046D632    pop         ebx
 0046D633    ret
end;*}

//0046D634
{*procedure sub_0046D634(?:?; ?:?);
begin
 0046D634    push        ebx
 0046D635    push        esi
 0046D636    mov         ebx,edx
 0046D638    mov         esi,eax
 0046D63A    mov         eax,ebx
 0046D63C    cmp         al,1F
>0046D63E    ja          0046D64A
 0046D640    and         eax,7F
 0046D643    bt          dword ptr [esi+8C],eax
>0046D64A    jae         0046D66D
 0046D64C    mov         eax,ebx
 0046D64E    cmp         al,1F
>0046D650    ja          0046D65C
 0046D652    and         eax,7F
 0046D655    btr         dword ptr [esi+8C],eax
 0046D65C    xor         eax,eax
 0046D65E    mov         al,bl
 0046D660    mov         eax,dword ptr [eax*4+5AD1F0]
 0046D667    push        eax
 0046D668    call        OpenGL32.glDisable
 0046D66D    pop         esi
 0046D66E    pop         ebx
 0046D66F    ret
end;*}

//0046D670
{*procedure sub_0046D670(?:?; ?:?; ?:?);
begin
 0046D670    push        ebx
 0046D671    mov         ebx,edx
 0046D673    sub         ebx,404
>0046D679    je          0046D685
 0046D67B    dec         ebx
>0046D67C    je          0046D69C
 0046D67E    sub         ebx,3
>0046D681    je          0046D6B3
>0046D683    jmp         0046D6D6
 0046D685    cmp         ecx,dword ptr [eax+0B0]
>0046D68B    je          0046D6D6
 0046D68D    mov         dword ptr [eax+0B0],ecx
 0046D693    push        ecx
 0046D694    push        edx
 0046D695    call        OpenGL32.glPolygonMode
 0046D69A    pop         ebx
 0046D69B    ret
 0046D69C    cmp         ecx,dword ptr [eax+0B4]
>0046D6A2    je          0046D6D6
 0046D6A4    mov         dword ptr [eax+0B4],ecx
 0046D6AA    push        ecx
 0046D6AB    push        edx
 0046D6AC    call        OpenGL32.glPolygonMode
 0046D6B1    pop         ebx
 0046D6B2    ret
 0046D6B3    cmp         ecx,dword ptr [eax+0B0]
>0046D6B9    jne         0046D6C3
 0046D6BB    cmp         ecx,dword ptr [eax+0B4]
>0046D6C1    je          0046D6D6
 0046D6C3    mov         dword ptr [eax+0B0],ecx
 0046D6C9    mov         dword ptr [eax+0B4],ecx
 0046D6CF    push        ecx
 0046D6D0    push        edx
 0046D6D1    call        OpenGL32.glPolygonMode
 0046D6D6    pop         ebx
 0046D6D7    ret
end;*}

//0046D6D8
{*procedure sub_0046D6D8(?:?);
begin
 0046D6D8    xor         edx,edx
 0046D6DA    mov         dword ptr [eax+0B0],edx
 0046D6E0    xor         edx,edx
 0046D6E2    mov         dword ptr [eax+0B4],edx
 0046D6E8    ret
end;*}

//0046D6EC
{*procedure sub_0046D6EC(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0046D6EC    push        ebp
 0046D6ED    mov         ebp,esp
 0046D6EF    add         esp,0FFFFFFF8
 0046D6F2    push        ebx
 0046D6F3    push        esi
 0046D6F4    push        edi
 0046D6F5    mov         dword ptr [ebp-8],ecx
 0046D6F8    mov         dword ptr [ebp-4],edx
 0046D6FB    mov         ebx,eax
 0046D6FD    mov         edi,dword ptr [ebp+8]
 0046D700    mov         esi,dword ptr [ebp-4]
 0046D703    sub         esi,404
 0046D709    cmp         edi,dword ptr [ebx+esi*4+84]
>0046D710    je          0046D728
 0046D712    push        edi
 0046D713    push        1601
 0046D718    mov         eax,dword ptr [ebp-4]
 0046D71B    push        eax
 0046D71C    call        OpenGL32.glMateriali
 0046D721    mov         dword ptr [ebx+esi*4+84],edi
 0046D728    mov         edx,dword ptr [ebp-8]
 0046D72B    mov         edi,esi
 0046D72D    shl         edi,3
 0046D730    lea         eax,[ebx+edi*8+4]
 0046D734    call        0045D8B4
 0046D739    test        al,al
>0046D73B    jne         0046D75B
 0046D73D    mov         eax,dword ptr [ebp-8]
 0046D740    push        eax
 0046D741    push        1600
 0046D746    mov         eax,dword ptr [ebp-4]
 0046D749    push        eax
 0046D74A    call        OpenGL32.glMaterialfv
 0046D74F    mov         edx,dword ptr [ebp-8]
 0046D752    lea         eax,[ebx+edi*8+4]
 0046D756    call        0045C9C0
 0046D75B    mov         edx,dword ptr [ebp+14]
 0046D75E    lea         eax,[ebx+edi*8+14]
 0046D762    call        0045D8B4
 0046D767    test        al,al
>0046D769    jne         0046D789
 0046D76B    mov         eax,dword ptr [ebp+14]
 0046D76E    push        eax
 0046D76F    push        1200
 0046D774    mov         eax,dword ptr [ebp-4]
 0046D777    push        eax
 0046D778    call        OpenGL32.glMaterialfv
 0046D77D    mov         edx,dword ptr [ebp+14]
 0046D780    lea         eax,[ebx+edi*8+14]
 0046D784    call        0045C9C0
 0046D789    mov         edx,dword ptr [ebp+10]
 0046D78C    lea         eax,[ebx+edi*8+24]
 0046D790    call        0045D870
 0046D795    test        al,al
>0046D797    jne         0046D7B7
 0046D799    mov         eax,dword ptr [ebp+10]
 0046D79C    push        eax
 0046D79D    push        1201
 0046D7A2    mov         eax,dword ptr [ebp-4]
 0046D7A5    push        eax
 0046D7A6    call        OpenGL32.glMaterialfv
 0046D7AB    mov         edx,dword ptr [ebp+10]
 0046D7AE    lea         eax,[ebx+edi*8+24]
 0046D7B2    call        0045C9C0
 0046D7B7    mov         edx,dword ptr [ebp+0C]
 0046D7BA    lea         eax,[ebx+edi*8+34]
 0046D7BE    call        0045D8B4
 0046D7C3    test        al,al
>0046D7C5    jne         0046D7E5
 0046D7C7    mov         eax,dword ptr [ebp+0C]
 0046D7CA    push        eax
 0046D7CB    push        1202
 0046D7D0    mov         eax,dword ptr [ebp-4]
 0046D7D3    push        eax
 0046D7D4    call        OpenGL32.glMaterialfv
 0046D7D9    mov         edx,dword ptr [ebp+0C]
 0046D7DC    lea         eax,[ebx+edi*8+34]
 0046D7E0    call        0045C9C0
 0046D7E5    pop         edi
 0046D7E6    pop         esi
 0046D7E7    pop         ebx
 0046D7E8    pop         ecx
 0046D7E9    pop         ecx
 0046D7EA    pop         ebp
 0046D7EB    ret         10
end;*}

//0046D7F0
{*procedure sub_0046D7F0(?:?; ?:?; ?:?);
begin
 0046D7F0    push        ebp
 0046D7F1    mov         ebp,esp
 0046D7F3    push        ebx
 0046D7F4    push        esi
 0046D7F5    mov         ecx,eax
 0046D7F7    mov         ebx,edx
 0046D7F9    sub         ebx,404
 0046D7FF    mov         esi,ebx
 0046D801    shl         esi,3
 0046D804    fld         dword ptr [ecx+esi*8+30]
 0046D808    fcomp       dword ptr [ebp+8]
 0046D80B    fnstsw      al
 0046D80D    sahf
>0046D80E    je          0046D827
 0046D810    mov         eax,dword ptr [ebp+8]
 0046D813    mov         dword ptr [ecx+esi*8+30],eax
 0046D817    lea         eax,[ecx+esi*8+24]
 0046D81B    push        eax
 0046D81C    push        1201
 0046D821    push        edx
 0046D822    call        OpenGL32.glMaterialfv
 0046D827    pop         esi
 0046D828    pop         ebx
 0046D829    pop         ebp
 0046D82A    ret         4
end;*}

//0046D830
{*procedure sub_0046D830(?:?);
begin
 0046D830    push        ebx
 0046D831    mov         ebx,eax
 0046D833    push        5AD258
 0046D838    push        1200
 0046D83D    push        408
 0046D842    call        OpenGL32.glMaterialfv
 0046D847    push        5AD268
 0046D84C    push        1201
 0046D851    push        408
 0046D856    call        OpenGL32.glMaterialfv
 0046D85B    push        5AD248
 0046D860    push        1202
 0046D865    push        408
 0046D86A    call        OpenGL32.glMaterialfv
 0046D86F    push        5AD248
 0046D874    push        1600
 0046D879    push        408
 0046D87E    call        OpenGL32.glMaterialfv
 0046D883    push        0
 0046D885    push        1601
 0046D88A    push        408
 0046D88F    call        OpenGL32.glMateriali
 0046D894    lea         eax,[ebx+4]
 0046D897    mov         ecx,7F
 0046D89C    mov         edx,80
 0046D8A1    call        @FillChar
 0046D8A6    xor         eax,eax
 0046D8A8    mov         dword ptr [ebx+84],eax
 0046D8AE    xor         eax,eax
 0046D8B0    mov         dword ptr [ebx+88],eax
 0046D8B6    pop         ebx
 0046D8B7    ret
end;*}

//0046D8B8
{*procedure sub_0046D8B8(?:?; ?:?; ?:?);
begin
 0046D8B8    push        ebp
 0046D8B9    mov         ebp,esp
 0046D8BB    push        ebx
 0046D8BC    push        esi
 0046D8BD    push        edi
 0046D8BE    mov         edi,edx
 0046D8C0    mov         ebx,eax
 0046D8C2    mov         esi,dword ptr [ebp+8]
 0046D8C5    cmp         esi,dword ptr [ebx+edi*4+90]
>0046D8CC    je          0046D8DC
 0046D8CE    push        esi
 0046D8CF    push        ecx
 0046D8D0    call        OpenGL32.glBindTexture
 0046D8D5    mov         dword ptr [ebx+edi*4+90],esi
 0046D8DC    pop         edi
 0046D8DD    pop         esi
 0046D8DE    pop         ebx
 0046D8DF    pop         ebp
 0046D8E0    ret         4
end;*}

//0046D8E4
{*procedure sub_0046D8E4(?:?);
begin
 0046D8E4    xor         edx,edx
 0046D8E6    mov         dword ptr [eax+edx*4+90],0FFFFFFFF
 0046D8F1    inc         edx
 0046D8F2    cmp         edx,8
>0046D8F5    jne         0046D8E6
 0046D8F7    ret
end;*}

//0046D8F8
{*procedure sub_0046D8F8(?:?; ?:?);
begin
 0046D8F8    push        ebx
 0046D8F9    mov         ebx,edx
 0046D8FB    mov         byte ptr [eax+0B9],0
 0046D902    push        1702
 0046D907    call        OpenGL32.glMatrixMode
 0046D90C    push        ebx
 0046D90D    call        OpenGL32.glLoadMatrixf
 0046D912    push        1700
 0046D917    call        OpenGL32.glMatrixMode
 0046D91C    pop         ebx
 0046D91D    ret
end;*}

//0046D920
{*procedure sub_0046D920(?:?);
begin
 0046D920    push        ebx
 0046D921    mov         ebx,eax
 0046D923    cmp         byte ptr [ebx+0B9],0
>0046D92A    jne         0046D94C
 0046D92C    push        1702
 0046D931    call        OpenGL32.glMatrixMode
 0046D936    call        OpenGL32.glLoadIdentity
 0046D93B    push        1700
 0046D940    call        OpenGL32.glMatrixMode
 0046D945    mov         byte ptr [ebx+0B9],1
 0046D94C    pop         ebx
 0046D94D    ret
end;*}

//0046D950
{*procedure sub_0046D950(?:?);
begin
 0046D950    mov         dl,byte ptr [eax+0B8]
 0046D956    xor         dl,1
 0046D959    mov         byte ptr [eax+0B8],dl
 0046D95F    test        dl,dl
>0046D961    je          0046D96E
 0046D963    push        901
 0046D968    call        OpenGL32.glFrontFace
 0046D96D    ret
 0046D96E    push        900
 0046D973    call        OpenGL32.glFrontFace
 0046D978    ret
end;*}

//0046D97C
{*procedure sub_0046D97C(?:?);
begin
 0046D97C    push        ebx
 0046D97D    mov         ebx,eax
 0046D97F    push        901
 0046D984    call        OpenGL32.glFrontFace
 0046D989    mov         byte ptr [ebx+0B8],1
 0046D990    pop         ebx
 0046D991    ret
end;*}

//0046D994
{*procedure sub_0046D994(?:?);
begin
 0046D994    push        ebx
 0046D995    mov         ebx,eax
 0046D997    mov         eax,ebx
 0046D999    call        0046D6D8
 0046D99E    mov         eax,ebx
 0046D9A0    call        0046D830
 0046D9A5    mov         eax,ebx
 0046D9A7    call        0046D8E4
 0046D9AC    mov         eax,ebx
 0046D9AE    call        0046D97C
 0046D9B3    pop         ebx
 0046D9B4    ret
end;*}

end.