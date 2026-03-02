//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit TGA;

interface

uses
  SysUtils, Classes;

type
  TTGAImage = class(TBitmap)
  public
    destructor Destroy; virtual;//004B8034
    constructor Create; virtual;//v48//004B7FFC
    procedure LoadFromStream(Stream:TStream); virtual;//v54//004B805C
    procedure SaveToStream(Stream:TStream); virtual;//v58//004B8390
  end;
  ETGAException = class(Exception)
  end;
    procedure sub_004B7ED4(?:TStream; ?:Pointer; ?:Integer);//004B7ED4
    procedure sub_004B7F6C(?:TStream; ?:Pointer; ?:Integer);//004B7F6C
    constructor Create;//004B7FFC
    destructor Destroy;//004B8034
    procedure LoadFromStream(Stream:TStream);//004B805C
    procedure SaveToStream(Stream:TStream);//004B8390

implementation

//004B7ED4
procedure sub_004B7ED4(?:TStream; ?:Pointer; ?:Integer);
begin
{*
 004B7ED4    push        ebx
 004B7ED5    push        esi
 004B7ED6    push        edi
 004B7ED7    push        ebp
 004B7ED8    add         esp,0FFFFFFF4
 004B7EDB    mov         ebx,edx
 004B7EDD    mov         esi,eax
 004B7EDF    lea         eax,[ebx+ecx]
 004B7EE2    mov         dword ptr [esp+4],eax
 004B7EE6    cmp         ebx,dword ptr [esp+4]
>004B7EEA    jae         004B7F63
 004B7EEC    lea         edx,[esp+8]
 004B7EF0    mov         ecx,1
 004B7EF5    mov         eax,esi
 004B7EF7    mov         edi,dword ptr [eax]
 004B7EF9    call        dword ptr [edi+0C]
 004B7EFC    cmp         byte ptr [esp+8],80
>004B7F01    jb          004B7F41
 004B7F03    mov         edx,esp
 004B7F05    mov         ecx,3
 004B7F0A    mov         eax,esi
 004B7F0C    mov         edi,dword ptr [eax]
 004B7F0E    call        dword ptr [edi+0C]
 004B7F11    mov         al,byte ptr [esp+8]
 004B7F15    and         al,7F
 004B7F17    inc         eax
 004B7F18    mov         byte ptr [esp+8],al
 004B7F1C    cmp         byte ptr [esp+8],0
>004B7F21    jbe         004B7F5D
 004B7F23    mov         ax,word ptr [esp]
 004B7F27    mov         word ptr [ebx],ax
 004B7F2A    mov         al,byte ptr [esp+2]
 004B7F2E    mov         byte ptr [ebx+2],al
 004B7F31    add         ebx,3
 004B7F34    dec         byte ptr [esp+8]
 004B7F38    cmp         byte ptr [esp+8],0
>004B7F3D    ja          004B7F23
>004B7F3F    jmp         004B7F5D
 004B7F41    mov         al,byte ptr [esp+8]
 004B7F45    and         al,7F
 004B7F47    and         eax,0FF
 004B7F4C    inc         eax
 004B7F4D    lea         edi,[eax+eax*2]
 004B7F50    mov         edx,ebx
 004B7F52    mov         ecx,edi
 004B7F54    mov         eax,esi
 004B7F56    mov         ebp,dword ptr [eax]
 004B7F58    call        dword ptr [ebp+0C]
 004B7F5B    add         ebx,edi
 004B7F5D    cmp         ebx,dword ptr [esp+4]
>004B7F61    jb          004B7EEC
 004B7F63    add         esp,0C
 004B7F66    pop         ebp
 004B7F67    pop         edi
 004B7F68    pop         esi
 004B7F69    pop         ebx
 004B7F6A    ret
*}
end;

//004B7F6C
procedure sub_004B7F6C(?:TStream; ?:Pointer; ?:Integer);
begin
{*
 004B7F6C    push        ebx
 004B7F6D    push        esi
 004B7F6E    push        edi
 004B7F6F    push        ebp
 004B7F70    add         esp,0FFFFFFF4
 004B7F73    mov         ebx,edx
 004B7F75    mov         esi,eax
 004B7F77    lea         eax,[ebx+ecx]
 004B7F7A    mov         dword ptr [esp+4],eax
 004B7F7E    cmp         ebx,dword ptr [esp+4]
>004B7F82    jae         004B7FF4
 004B7F84    lea         edx,[esp+8]
 004B7F88    mov         ecx,1
 004B7F8D    mov         eax,esi
 004B7F8F    mov         edi,dword ptr [eax]
 004B7F91    call        dword ptr [edi+0C]
 004B7F94    cmp         byte ptr [esp+8],80
>004B7F99    jb          004B7FD0
 004B7F9B    mov         edx,esp
 004B7F9D    mov         ecx,4
 004B7FA2    mov         eax,esi
 004B7FA4    mov         edi,dword ptr [eax]
 004B7FA6    call        dword ptr [edi+0C]
 004B7FA9    mov         al,byte ptr [esp+8]
 004B7FAD    and         al,7F
 004B7FAF    inc         eax
 004B7FB0    mov         byte ptr [esp+8],al
 004B7FB4    cmp         byte ptr [esp+8],0
>004B7FB9    jbe         004B7FEE
 004B7FBB    mov         eax,dword ptr [esp]
 004B7FBE    mov         dword ptr [ebx],eax
 004B7FC0    add         ebx,4
 004B7FC3    dec         byte ptr [esp+8]
 004B7FC7    cmp         byte ptr [esp+8],0
>004B7FCC    ja          004B7FBB
>004B7FCE    jmp         004B7FEE
 004B7FD0    mov         al,byte ptr [esp+8]
 004B7FD4    and         al,7F
 004B7FD6    and         eax,0FF
 004B7FDB    inc         eax
 004B7FDC    mov         edi,eax
 004B7FDE    shl         edi,2
 004B7FE1    mov         edx,ebx
 004B7FE3    mov         ecx,edi
 004B7FE5    mov         eax,esi
 004B7FE7    mov         ebp,dword ptr [eax]
 004B7FE9    call        dword ptr [ebp+0C]
 004B7FEC    add         ebx,edi
 004B7FEE    cmp         ebx,dword ptr [esp+4]
>004B7FF2    jb          004B7F84
 004B7FF4    add         esp,0C
 004B7FF7    pop         ebp
 004B7FF8    pop         edi
 004B7FF9    pop         esi
 004B7FFA    pop         ebx
 004B7FFB    ret
*}
end;

//004B7FFC
constructor TTGAImage.Create;
begin
{*
 004B7FFC    push        ebx
 004B7FFD    push        esi
 004B7FFE    test        dl,dl
>004B8000    je          004B800A
 004B8002    add         esp,0FFFFFFF0
 004B8005    call        @ClassCreate
 004B800A    mov         ebx,edx
 004B800C    mov         esi,eax
 004B800E    xor         edx,edx
 004B8010    mov         eax,esi
 004B8012    call        TBitmap.Create
 004B8017    mov         eax,esi
 004B8019    test        bl,bl
>004B801B    je          004B802C
 004B801D    call        @AfterConstruction
 004B8022    pop         dword ptr fs:[0]
 004B8029    add         esp,0C
 004B802C    mov         eax,esi
 004B802E    pop         esi
 004B802F    pop         ebx
 004B8030    ret
*}
end;

//004B8034
destructor TTGAImage.Destroy;
begin
{*
 004B8034    push        ebx
 004B8035    push        esi
 004B8036    call        @BeforeDestruction
 004B803B    mov         ebx,edx
 004B803D    mov         esi,eax
 004B803F    mov         edx,ebx
 004B8041    and         dl,0FC
 004B8044    mov         eax,esi
 004B8046    call        TBitmap.Destroy
 004B804B    test        bl,bl
>004B804D    jle         004B8056
 004B804F    mov         eax,esi
 004B8051    call        @ClassDestroy
 004B8056    pop         esi
 004B8057    pop         ebx
 004B8058    ret
*}
end;

//004B805C
procedure TTGAImage.LoadFromStream(Stream:TStream);
begin
{*
 004B805C    push        ebp
 004B805D    mov         ebp,esp
 004B805F    add         esp,0FFFFFFD0
 004B8062    push        ebx
 004B8063    push        esi
 004B8064    push        edi
 004B8065    xor         ecx,ecx
 004B8067    mov         dword ptr [ebp-2C],ecx
 004B806A    mov         dword ptr [ebp-30],ecx
 004B806D    mov         dword ptr [ebp-4],edx
 004B8070    mov         ebx,eax
 004B8072    xor         eax,eax
 004B8074    push        ebp
 004B8075    push        4B8314
 004B807A    push        dword ptr fs:[eax]
 004B807D    mov         dword ptr fs:[eax],esp
 004B8080    lea         edx,[ebp-26]
 004B8083    mov         ecx,12
 004B8088    mov         eax,dword ptr [ebp-4]
 004B808B    mov         esi,dword ptr [eax]
 004B808D    call        dword ptr [esi+0C];TStream.Read
 004B8090    cmp         byte ptr [ebp-25],0
>004B8094    je          004B80AC
 004B8096    mov         ecx,4B832C;'ColorMapped TGA unsupported'
 004B809B    mov         dl,1
 004B809D    mov         eax,[004B7E78];ETGAException
 004B80A2    call        Exception.Create;ETGAException.Create
 004B80A7    call        @RaiseExcept
 004B80AC    mov         al,byte ptr [ebp-16]
 004B80AF    sub         al,18
>004B80B1    je          004B80B9
 004B80B3    sub         al,8
>004B80B5    je          004B80C4
>004B80B7    jmp         004B80CF
 004B80B9    mov         dl,6
 004B80BB    mov         eax,ebx
 004B80BD    call        TBitmap.SetPixelFormat
>004B80C2    jmp         004B80E5
 004B80C4    mov         dl,7
 004B80C6    mov         eax,ebx
 004B80C8    call        TBitmap.SetPixelFormat
>004B80CD    jmp         004B80E5
 004B80CF    mov         ecx,4B8350;'Unsupported TGA ImageType'
 004B80D4    mov         dl,1
 004B80D6    mov         eax,[004B7E78];ETGAException
 004B80DB    call        Exception.Create;ETGAException.Create
 004B80E0    call        @RaiseExcept
 004B80E5    movzx       edx,word ptr [ebp-1A]
 004B80E9    mov         eax,ebx
 004B80EB    mov         ecx,dword ptr [eax]
 004B80ED    call        dword ptr [ecx+40];TBitmap.SetWidth
 004B80F0    movzx       edx,word ptr [ebp-18]
 004B80F4    mov         eax,ebx
 004B80F6    mov         ecx,dword ptr [eax]
 004B80F8    call        dword ptr [ecx+34];TBitmap.SetHeight
 004B80FB    mov         eax,ebx
 004B80FD    mov         edx,dword ptr [eax]
 004B80FF    call        dword ptr [edx+2C];TBitmap.GetWidth
 004B8102    xor         edx,edx
 004B8104    mov         dl,byte ptr [ebp-16]
 004B8107    imul        edx
 004B8109    test        eax,eax
>004B810B    jns         004B8110
 004B810D    add         eax,7
 004B8110    sar         eax,3
 004B8113    mov         dword ptr [ebp-8],eax
 004B8116    test        byte ptr [ebp-15],20
 004B811A    sete        byte ptr [ebp-9]
 004B811E    mov         al,byte ptr [ebp-26]
 004B8121    test        al,al
>004B8123    jbe         004B8135
 004B8125    xor         edx,edx
 004B8127    mov         dl,al
 004B8129    mov         cx,1
 004B812D    mov         eax,dword ptr [ebp-4]
 004B8130    mov         esi,dword ptr [eax]
 004B8132    call        dword ptr [esi+14];TStream.Seek
 004B8135    mov         al,byte ptr [ebp-24]
 004B8138    sub         al,1
>004B813A    jb          004B814D
 004B813C    dec         al
>004B813E    je          004B8164
 004B8140    sub         al,8
>004B8142    je          004B81E2
>004B8148    jmp         004B82C8
 004B814D    xor         edx,edx
 004B814F    mov         eax,ebx
 004B8151    mov         ecx,dword ptr [eax]
 004B8153    call        dword ptr [ecx+40];TBitmap.SetWidth
 004B8156    xor         edx,edx
 004B8158    mov         eax,ebx
 004B815A    mov         ecx,dword ptr [eax]
 004B815C    call        dword ptr [ecx+34];TBitmap.SetHeight
>004B815F    jmp         004B82F9
 004B8164    cmp         byte ptr [ebp-9],0
>004B8168    je          004B81AB
 004B816A    mov         eax,ebx
 004B816C    mov         edx,dword ptr [eax]
 004B816E    call        dword ptr [edx+20];TBitmap.GetHeight
 004B8171    dec         eax
 004B8172    test        eax,eax
>004B8174    jl          004B82F9
 004B817A    inc         eax
 004B817B    mov         dword ptr [ebp-14],eax
 004B817E    xor         esi,esi
 004B8180    mov         eax,ebx
 004B8182    mov         edx,dword ptr [eax]
 004B8184    call        dword ptr [edx+20];TBitmap.GetHeight
 004B8187    mov         edx,eax
 004B8189    sub         edx,esi
 004B818B    dec         edx
 004B818C    mov         eax,ebx
 004B818E    call        TBitmap.GetScanline
 004B8193    mov         edx,eax
 004B8195    mov         ecx,dword ptr [ebp-8]
 004B8198    mov         eax,dword ptr [ebp-4]
 004B819B    mov         edi,dword ptr [eax]
 004B819D    call        dword ptr [edi+0C];TStream.Read
 004B81A0    inc         esi
 004B81A1    dec         dword ptr [ebp-14]
>004B81A4    jne         004B8180
>004B81A6    jmp         004B82F9
 004B81AB    mov         eax,ebx
 004B81AD    mov         edx,dword ptr [eax]
 004B81AF    call        dword ptr [edx+20];TBitmap.GetHeight
 004B81B2    dec         eax
 004B81B3    test        eax,eax
>004B81B5    jl          004B82F9
 004B81BB    inc         eax
 004B81BC    mov         dword ptr [ebp-14],eax
 004B81BF    xor         esi,esi
 004B81C1    mov         edx,esi
 004B81C3    mov         eax,ebx
 004B81C5    call        TBitmap.GetScanline
 004B81CA    mov         edx,eax
 004B81CC    mov         ecx,dword ptr [ebp-8]
 004B81CF    mov         eax,dword ptr [ebp-4]
 004B81D2    mov         edi,dword ptr [eax]
 004B81D4    call        dword ptr [edi+0C];TStream.Read
 004B81D7    inc         esi
 004B81D8    dec         dword ptr [ebp-14]
>004B81DB    jne         004B81C1
>004B81DD    jmp         004B82F9
 004B81E2    mov         eax,ebx
 004B81E4    mov         edx,dword ptr [eax]
 004B81E6    call        dword ptr [edx+20];TBitmap.GetHeight
 004B81E9    mov         esi,eax
 004B81EB    imul        esi,dword ptr [ebp-8]
 004B81EF    push        esi
 004B81F0    call        GetMemory
 004B81F5    pop         ecx
 004B81F6    mov         dword ptr [ebp-10],eax
 004B81F9    xor         eax,eax
 004B81FB    push        ebp
 004B81FC    push        4B82C1
 004B8201    push        dword ptr fs:[eax]
 004B8204    mov         dword ptr fs:[eax],esp
 004B8207    cmp         byte ptr [ebp-16],18
>004B820B    jne         004B821C
 004B820D    mov         ecx,esi
 004B820F    mov         edx,dword ptr [ebp-10]
 004B8212    mov         eax,dword ptr [ebp-4]
 004B8215    call        004B7ED4
>004B821A    jmp         004B8229
 004B821C    mov         ecx,esi
 004B821E    mov         edx,dword ptr [ebp-10]
 004B8221    mov         eax,dword ptr [ebp-4]
 004B8224    call        004B7F6C
 004B8229    cmp         byte ptr [ebp-9],0
>004B822D    je          004B8272
 004B822F    mov         eax,ebx
 004B8231    mov         edx,dword ptr [eax]
 004B8233    call        dword ptr [edx+20];TBitmap.GetHeight
 004B8236    dec         eax
 004B8237    test        eax,eax
>004B8239    jl          004B82A9
 004B823B    inc         eax
 004B823C    mov         dword ptr [ebp-14],eax
 004B823F    xor         esi,esi
 004B8241    mov         eax,ebx
 004B8243    mov         edx,dword ptr [eax]
 004B8245    call        dword ptr [edx+20];TBitmap.GetHeight
 004B8248    mov         edx,eax
 004B824A    sub         edx,esi
 004B824C    dec         edx
 004B824D    mov         eax,ebx
 004B824F    call        TBitmap.GetScanline
 004B8254    mov         edx,eax
 004B8256    mov         eax,esi
 004B8258    imul        eax,dword ptr [ebp-8]
 004B825C    mov         ecx,dword ptr [ebp-10]
 004B825F    lea         eax,[ecx+eax]
 004B8262    mov         ecx,dword ptr [ebp-8]
 004B8265    call        Move
 004B826A    inc         esi
 004B826B    dec         dword ptr [ebp-14]
>004B826E    jne         004B8241
>004B8270    jmp         004B82A9
 004B8272    mov         eax,ebx
 004B8274    mov         edx,dword ptr [eax]
 004B8276    call        dword ptr [edx+20];TBitmap.GetHeight
 004B8279    dec         eax
 004B827A    test        eax,eax
>004B827C    jl          004B82A9
 004B827E    inc         eax
 004B827F    mov         dword ptr [ebp-14],eax
 004B8282    xor         esi,esi
 004B8284    mov         edx,esi
 004B8286    mov         eax,ebx
 004B8288    call        TBitmap.GetScanline
 004B828D    mov         edx,eax
 004B828F    mov         eax,esi
 004B8291    imul        eax,dword ptr [ebp-8]
 004B8295    mov         ecx,dword ptr [ebp-10]
 004B8298    lea         eax,[ecx+eax]
 004B829B    mov         ecx,dword ptr [ebp-8]
 004B829E    call        Move
 004B82A3    inc         esi
 004B82A4    dec         dword ptr [ebp-14]
>004B82A7    jne         004B8284
 004B82A9    xor         eax,eax
 004B82AB    pop         edx
 004B82AC    pop         ecx
 004B82AD    pop         ecx
 004B82AE    mov         dword ptr fs:[eax],edx
 004B82B1    push        4B82F9
 004B82B6    mov         eax,dword ptr [ebp-10]
 004B82B9    push        eax
 004B82BA    call        FreeMemory
 004B82BF    pop         ecx
 004B82C0    ret
>004B82C1    jmp         @HandleFinally
>004B82C6    jmp         004B82B6
 004B82C8    lea         edx,[ebp-30]
 004B82CB    xor         eax,eax
 004B82CD    mov         al,byte ptr [ebp-24]
 004B82D0    call        IntToStr
 004B82D5    mov         ecx,dword ptr [ebp-30]
 004B82D8    lea         eax,[ebp-2C]
 004B82DB    mov         edx,4B8374;'Unsupported TGA ImageType '
 004B82E0    call        @LStrCat3
 004B82E5    mov         ecx,dword ptr [ebp-2C]
 004B82E8    mov         dl,1
 004B82EA    mov         eax,[004B7E78];ETGAException
 004B82EF    call        Exception.Create;ETGAException.Create
 004B82F4    call        @RaiseExcept
 004B82F9    xor         eax,eax
 004B82FB    pop         edx
 004B82FC    pop         ecx
 004B82FD    pop         ecx
 004B82FE    mov         dword ptr fs:[eax],edx
 004B8301    push        4B831B
 004B8306    lea         eax,[ebp-30]
 004B8309    mov         edx,2
 004B830E    call        @LStrArrayClr
 004B8313    ret
>004B8314    jmp         @HandleFinally
>004B8319    jmp         004B8306
 004B831B    pop         edi
 004B831C    pop         esi
 004B831D    pop         ebx
 004B831E    mov         esp,ebp
 004B8320    pop         ebp
 004B8321    ret
*}
end;

//004B8390
procedure TTGAImage.SaveToStream(Stream:TStream);
begin
{*
 004B8390    push        ebx
 004B8391    push        esi
 004B8392    push        edi
 004B8393    push        ebp
 004B8394    add         esp,0FFFFFFE4
 004B8397    mov         dword ptr [esp],edx
 004B839A    mov         ebx,eax
 004B839C    lea         eax,[esp+8]
 004B83A0    xor         ecx,ecx
 004B83A2    mov         edx,12
 004B83A7    call        @FillChar
 004B83AC    mov         byte ptr [esp+0A],2
 004B83B1    mov         eax,ebx
 004B83B3    mov         edx,dword ptr [eax]
 004B83B5    call        dword ptr [edx+2C];TBitmap.GetWidth
 004B83B8    mov         word ptr [esp+14],ax
 004B83BD    mov         eax,ebx
 004B83BF    mov         edx,dword ptr [eax]
 004B83C1    call        dword ptr [edx+20];TBitmap.GetHeight
 004B83C4    mov         word ptr [esp+16],ax
 004B83C9    mov         eax,ebx
 004B83CB    call        TBitmap.GetPixelFormat
 004B83D0    sub         al,6
>004B83D2    je          004B83DA
 004B83D4    dec         al
>004B83D6    je          004B83E1
>004B83D8    jmp         004B83E8
 004B83DA    mov         byte ptr [esp+18],18
>004B83DF    jmp         004B83FE
 004B83E1    mov         byte ptr [esp+18],20
>004B83E6    jmp         004B83FE
 004B83E8    mov         ecx,4B8474;'Unsupported Bitmap format'
 004B83ED    mov         dl,1
 004B83EF    mov         eax,[004B7E78];ETGAException
 004B83F4    call        Exception.Create;ETGAException.Create
 004B83F9    call        @RaiseExcept
 004B83FE    lea         edx,[esp+8]
 004B8402    mov         ecx,12
 004B8407    mov         eax,dword ptr [esp]
 004B840A    mov         esi,dword ptr [eax]
 004B840C    call        dword ptr [esi+10]
 004B840F    mov         eax,ebx
 004B8411    mov         edx,dword ptr [eax]
 004B8413    call        dword ptr [edx+2C];TBitmap.GetWidth
 004B8416    xor         edx,edx
 004B8418    mov         dl,byte ptr [esp+18]
 004B841C    imul        edx
 004B841E    test        eax,eax
>004B8420    jns         004B8425
 004B8422    add         eax,7
 004B8425    sar         eax,3
 004B8428    mov         dword ptr [esp+4],eax
 004B842C    mov         eax,ebx
 004B842E    mov         edx,dword ptr [eax]
 004B8430    call        dword ptr [edx+20];TBitmap.GetHeight
 004B8433    mov         esi,eax
 004B8435    dec         esi
 004B8436    test        esi,esi
>004B8438    jl          004B8462
 004B843A    inc         esi
 004B843B    xor         edi,edi
 004B843D    mov         eax,ebx
 004B843F    mov         edx,dword ptr [eax]
 004B8441    call        dword ptr [edx+20];TBitmap.GetHeight
 004B8444    mov         edx,eax
 004B8446    sub         edx,edi
 004B8448    dec         edx
 004B8449    mov         eax,ebx
 004B844B    call        TBitmap.GetScanline
 004B8450    mov         edx,eax
 004B8452    mov         ecx,dword ptr [esp+4]
 004B8456    mov         eax,dword ptr [esp]
 004B8459    mov         ebp,dword ptr [eax]
 004B845B    call        dword ptr [ebp+10]
 004B845E    inc         edi
 004B845F    dec         esi
>004B8460    jne         004B843D
 004B8462    add         esp,1C
 004B8465    pop         ebp
 004B8466    pop         edi
 004B8467    pop         esi
 004B8468    pop         ebx
 004B8469    ret
*}
end;

Initialization
//004B84D0
{*
 004B84D0    sub         dword ptr ds:[5E163C],1
>004B84D7    jae         004B84F3
 004B84D9    mov         eax,[004B7D90];TTGAImage
 004B84DE    push        eax
 004B84DF    mov         ecx,4B84FC;'Targa'
 004B84E4    mov         edx,4B850C;'tga'
 004B84E9    mov         eax,[00424C0C];TPicture
 004B84EE    call        TPicture.RegisterFileFormat
 004B84F3    ret
*}
Finalization
//004B8490
{*
 004B8490    push        ebp
 004B8491    mov         ebp,esp
 004B8493    xor         eax,eax
 004B8495    push        ebp
 004B8496    push        4B84C7
 004B849B    push        dword ptr fs:[eax]
 004B849E    mov         dword ptr fs:[eax],esp
 004B84A1    inc         dword ptr ds:[5E163C]
>004B84A7    jne         004B84B9
 004B84A9    mov         edx,dword ptr ds:[4B7D90];TTGAImage
 004B84AF    mov         eax,[00424C0C];TPicture
 004B84B4    call        TPicture.UnregisterGraphicClass
 004B84B9    xor         eax,eax
 004B84BB    pop         edx
 004B84BC    pop         ecx
 004B84BD    pop         ecx
 004B84BE    mov         dword ptr fs:[eax],edx
 004B84C1    push        4B84CE
 004B84C6    ret
>004B84C7    jmp         @HandleFinally
>004B84CC    jmp         004B84C6
 004B84CE    pop         ebp
 004B84CF    ret
*}
end.