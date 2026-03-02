//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLGraphics;

interface

uses
  SysUtils, Classes;

type
  TGLBitmap32 = class(TPersistent)
  public
    f4:dword;//f4
    f8:dword;//f8
    fC:dword;//fC
    f10:dword;//f10
    f14:byte;//f14
    destructor Destroy; virtual;//0046FCA4
    procedure Assign(Source:TPersistent); virtual;//v8//0046FCD4
    constructor Create;//0046FC6C
  end;
    //procedure sub_0046F980(?:?; ?:?; ?:?);//0046F980
    //procedure sub_0046FAF0(?:?; ?:?; ?:?);//0046FAF0
    //procedure sub_0046FC10(?:?; ?:?; ?:dword);//0046FC10
    //procedure sub_0046FC4C(?:?; ?:?; ?:dword);//0046FC4C
    destructor Destroy;//0046FCA4
    procedure Assign(Source:TPersistent);//0046FCD4
    procedure sub_0046FE98(?:TGLBitmap32; ?:TPersistent);//0046FE98
    procedure sub_00470000(?:TGLBitmap32; ?:TPersistent);//00470000
    //function sub_00470168(?:TPersistent):?;//00470168
    //function sub_00470248(?:?):?;//00470248
    procedure sub_0047025C(?:TGLBitmap32; ?:Integer);//0047025C
    procedure sub_00470304(?:TGLBitmap32; ?:Integer);//00470304
    //function sub_0047039C(?:?; ?:?):?;//0047039C
    procedure sub_004703A8(?:TGLBitmap32);//004703A8
    //procedure sub_004703F0(?:TGLBitmap32; ?:?);//004703F0
    //procedure sub_00470430(?:TGLBitmap32; ?:?);//00470430
    //procedure sub_00470464(?:?; ?:?);//00470464
    //procedure sub_004704B4(?:TGLBitmap32; ?:?);//004704B4
    //procedure sub_004704DC(?:?);//004704DC
    procedure sub_00470508(?:TGLBitmap32);//00470508
    //procedure sub_0047055C(?:?; ?:?);//0047055C
    //procedure sub_00470584(?:?; ?:?);//00470584
    //procedure sub_004705AC(?:?);//004705AC
    //function sub_004705CC(?:?):?;//004705CC
    //procedure sub_004705F0(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//004705F0
    //procedure sub_0047084C(?:?; ?:?; ?:?; ?:?);//0047084C

implementation

//0046F980
{*procedure sub_0046F980(?:?; ?:?; ?:?);
begin
 0046F980    push        ebp
 0046F981    mov         ebp,esp
 0046F983    add         esp,0FFFFFEF0
 0046F989    push        ebx
 0046F98A    push        esi
 0046F98B    mov         dword ptr [ebp-8],edx
 0046F98E    mov         dword ptr [ebp-4],eax
 0046F991    cmp         dword ptr [ebp-8],1
>0046F995    jl          0046FA6B
 0046F99B    fld         dword ptr [ebp+8]
 0046F99E    fcomp       dword ptr ds:[46FA74];0:Single
 0046F9A4    fnstsw      al
 0046F9A6    sahf
>0046F9A7    ja          0046F9BD
 0046F9A9    mov         ecx,10F
 0046F9AE    mov         edx,46FA80;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 0046F9B3    mov         eax,46FABC;'Assertion failure'
 0046F9B8    call        @Assert
 0046F9BD    fld         tbyte ptr ds:[46FAD0];0.1:Extended
 0046F9C3    fcomp       dword ptr [ebp+8]
 0046F9C6    fnstsw      al
 0046F9C8    sahf
>0046F9C9    jbe         0046F9D4
 0046F9CB    mov         dword ptr [ebp-0C],41200000
>0046F9D2    jmp         0046F9E1
 0046F9D4    fld         dword ptr ds:[46FADC];1:Single
 0046F9DA    fdiv        dword ptr [ebp+8]
 0046F9DD    fstp        dword ptr [ebp-0C]
 0046F9E0    wait
 0046F9E1    xor         ebx,ebx
 0046F9E3    lea         esi,[ebp-10C]
 0046F9E9    mov         dword ptr [ebp-110],ebx
 0046F9EF    fild        dword ptr [ebp-110]
 0046F9F5    fld         tbyte ptr ds:[46FAE0];0.00392156862745098:Extended
 0046F9FB    fmulp       st(1),st
 0046F9FD    add         esp,0FFFFFFFC
 0046FA00    fstp        dword ptr [esp]
 0046FA03    wait
 0046FA04    push        dword ptr [ebp-0C]
 0046FA07    call        0045F3CC
 0046FA0C    fmul        dword ptr ds:[46FAEC];255:Single
 0046FA12    add         esp,0FFFFFFFC
 0046FA15    fstp        dword ptr [esp]
 0046FA18    wait
 0046FA19    call        0045F6EC
 0046FA1E    mov         byte ptr [esi],al
 0046FA20    inc         ebx
 0046FA21    inc         esi
 0046FA22    cmp         ebx,100
>0046FA28    jne         0046F9E9
 0046FA2A    mov         esi,dword ptr [ebp-8]
 0046FA2D    shl         esi,2
 0046FA30    mov         eax,dword ptr [ebp-4]
 0046FA33    add         esi,eax
 0046FA35    mov         ebx,eax
 0046FA37    lea         eax,[ebp-10C]
 0046FA3D    cmp         esi,ebx
>0046FA3F    jle         0046FA6B
 0046FA41    mov         edx,ebx
 0046FA43    xor         ecx,ecx
 0046FA45    mov         cl,byte ptr [edx]
 0046FA47    mov         cl,byte ptr [eax+ecx]
 0046FA4A    mov         byte ptr [edx],cl
 0046FA4C    inc         ebx
 0046FA4D    mov         edx,ebx
 0046FA4F    xor         ecx,ecx
 0046FA51    mov         cl,byte ptr [edx]
 0046FA53    mov         cl,byte ptr [eax+ecx]
 0046FA56    mov         byte ptr [edx],cl
 0046FA58    inc         ebx
 0046FA59    mov         edx,ebx
 0046FA5B    xor         ecx,ecx
 0046FA5D    mov         cl,byte ptr [edx]
 0046FA5F    mov         cl,byte ptr [eax+ecx]
 0046FA62    mov         byte ptr [edx],cl
 0046FA64    add         ebx,2
 0046FA67    cmp         esi,ebx
>0046FA69    jg          0046FA41
 0046FA6B    pop         esi
 0046FA6C    pop         ebx
 0046FA6D    mov         esp,ebp
 0046FA6F    pop         ebp
 0046FA70    ret         4
end;*}

//0046FAF0
{*procedure sub_0046FAF0(?:?; ?:?; ?:?);
begin
 0046FAF0    push        ebp
 0046FAF1    mov         ebp,esp
 0046FAF3    add         esp,0FFFFFEF4
 0046FAF9    push        ebx
 0046FAFA    push        esi
 0046FAFB    mov         dword ptr [ebp-8],edx
 0046FAFE    mov         dword ptr [ebp-4],eax
 0046FB01    cmp         dword ptr [ebp-8],1
>0046FB05    jl          0046FBA9
 0046FB0B    fld         dword ptr [ebp+8]
 0046FB0E    fcomp       dword ptr ds:[46FBB4];0:Single
 0046FB14    fnstsw      al
 0046FB16    sahf
>0046FB17    jae         0046FB2D
 0046FB19    mov         ecx,144
 0046FB1E    mov         edx,46FBC0;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 0046FB23    mov         eax,46FBFC;'Assertion failure'
 0046FB28    call        @Assert
 0046FB2D    xor         ebx,ebx
 0046FB2F    lea         esi,[ebp-108]
 0046FB35    mov         dword ptr [ebp-10C],ebx
 0046FB3B    fild        dword ptr [ebp-10C]
 0046FB41    fmul        dword ptr [ebp+8]
 0046FB44    add         esp,0FFFFFFFC
 0046FB47    fstp        dword ptr [esp]
 0046FB4A    wait
 0046FB4B    call        0045F6EC
 0046FB50    cmp         eax,0FF
>0046FB55    jle         0046FB5C
 0046FB57    mov         eax,0FF
 0046FB5C    mov         byte ptr [esi],al
 0046FB5E    inc         ebx
 0046FB5F    inc         esi
 0046FB60    cmp         ebx,100
>0046FB66    jne         0046FB35
 0046FB68    mov         esi,dword ptr [ebp-8]
 0046FB6B    shl         esi,2
 0046FB6E    mov         eax,dword ptr [ebp-4]
 0046FB71    add         esi,eax
 0046FB73    mov         ebx,eax
 0046FB75    lea         eax,[ebp-108]
 0046FB7B    cmp         esi,ebx
>0046FB7D    jle         0046FBA9
 0046FB7F    mov         edx,ebx
 0046FB81    xor         ecx,ecx
 0046FB83    mov         cl,byte ptr [edx]
 0046FB85    mov         cl,byte ptr [eax+ecx]
 0046FB88    mov         byte ptr [edx],cl
 0046FB8A    inc         ebx
 0046FB8B    mov         edx,ebx
 0046FB8D    xor         ecx,ecx
 0046FB8F    mov         cl,byte ptr [edx]
 0046FB91    mov         cl,byte ptr [eax+ecx]
 0046FB94    mov         byte ptr [edx],cl
 0046FB96    inc         ebx
 0046FB97    mov         edx,ebx
 0046FB99    xor         ecx,ecx
 0046FB9B    mov         cl,byte ptr [edx]
 0046FB9D    mov         cl,byte ptr [eax+ecx]
 0046FBA0    mov         byte ptr [edx],cl
 0046FBA2    add         ebx,2
 0046FBA5    cmp         esi,ebx
>0046FBA7    jg          0046FB7F
 0046FBA9    pop         esi
 0046FBAA    pop         ebx
 0046FBAB    mov         esp,ebp
 0046FBAD    pop         ebp
 0046FBAE    ret         4
end;*}

//0046FC10
{*procedure sub_0046FC10(?:?; ?:?; ?:dword);
begin
 0046FC10    push        edi
 0046FC11    cmp         ecx,0
>0046FC14    jle         0046FC48
 0046FC16    mov         edi,eax
 0046FC18    dec         ecx
>0046FC19    je          0046FC32
 0046FC1B    mov         eax,dword ptr [edi]
 0046FC1D    shl         eax,8
 0046FC20    or          eax,0FF
 0046FC25    bswap       eax
 0046FC27    mov         dword ptr [edx],eax
 0046FC29    add         edi,3
 0046FC2C    add         edx,4
 0046FC2F    dec         ecx
>0046FC30    jne         0046FC1B
 0046FC32    mov         cx,word ptr [edi+1]
 0046FC36    shl         ecx,10
 0046FC39    mov         ah,byte ptr [edi]
 0046FC3B    mov         al,0FF
 0046FC3D    and         eax,0FFFF
 0046FC42    or          eax,ecx
 0046FC44    bswap       eax
 0046FC46    mov         dword ptr [edx],eax
 0046FC48    pop         edi
 0046FC49    ret
end;*}

//0046FC4C
{*procedure sub_0046FC4C(?:?; ?:?; ?:dword);
begin
 0046FC4C    push        edi
 0046FC4D    cmp         ecx,0
>0046FC50    jle         0046FC69
 0046FC52    mov         edi,eax
 0046FC54    mov         eax,dword ptr [edi]
 0046FC56    shl         eax,8
 0046FC59    mov         al,byte ptr [edi+3]
 0046FC5C    bswap       eax
 0046FC5E    mov         dword ptr [edx],eax
 0046FC60    add         edi,4
 0046FC63    add         edx,4
 0046FC66    dec         ecx
>0046FC67    jne         0046FC54
 0046FC69    pop         edi
 0046FC6A    ret
end;*}

//0046FC6C
constructor TGLBitmap32.Create;
begin
{*
 0046FC6C    push        ebx
 0046FC6D    push        esi
 0046FC6E    test        dl,dl
>0046FC70    je          0046FC7A
 0046FC72    add         esp,0FFFFFFF0
 0046FC75    call        @ClassCreate
 0046FC7A    mov         ebx,edx
 0046FC7C    mov         esi,eax
 0046FC7E    xor         edx,edx
 0046FC80    mov         eax,esi
 0046FC82    call        TObject.Create
 0046FC87    mov         eax,esi
 0046FC89    test        bl,bl
>0046FC8B    je          0046FC9C
 0046FC8D    call        @AfterConstruction
 0046FC92    pop         dword ptr fs:[0]
 0046FC99    add         esp,0C
 0046FC9C    mov         eax,esi
 0046FC9E    pop         esi
 0046FC9F    pop         ebx
 0046FCA0    ret
*}
end;

//0046FCA4
destructor TGLBitmap32.Destroy;
begin
{*
 0046FCA4    push        ebx
 0046FCA5    push        esi
 0046FCA6    call        @BeforeDestruction
 0046FCAB    mov         ebx,edx
 0046FCAD    mov         esi,eax
 0046FCAF    mov         eax,dword ptr [esi+4];TGLBitmap32.?f4:dword
 0046FCB2    call        @FreeMem
 0046FCB7    mov         edx,ebx
 0046FCB9    and         dl,0FC
 0046FCBC    mov         eax,esi
 0046FCBE    call        TMemoryStream.Destroy
 0046FCC3    test        bl,bl
>0046FCC5    jle         0046FCCE
 0046FCC7    mov         eax,esi
 0046FCC9    call        @ClassDestroy
 0046FCCE    pop         esi
 0046FCCF    pop         ebx
 0046FCD0    ret
*}
end;

//0046FCD4
procedure TGLBitmap32.Assign(Source:TPersistent);
begin
{*
 0046FCD4    push        ebp
 0046FCD5    mov         ebp,esp
 0046FCD7    add         esp,0FFFFFFEC
 0046FCDA    push        ebx
 0046FCDB    push        esi
 0046FCDC    push        edi
 0046FCDD    mov         esi,edx
 0046FCDF    mov         ebx,eax
 0046FCE1    test        esi,esi
>0046FCE3    jne         0046FD01
 0046FCE5    xor         eax,eax
 0046FCE7    mov         dword ptr [ebx+10],eax;TGLBitmap32.?f10:dword
 0046FCEA    xor         eax,eax
 0046FCEC    mov         dword ptr [ebx+8],eax;TGLBitmap32.?f8:dword
 0046FCEF    xor         eax,eax
 0046FCF1    mov         dword ptr [ebx+0C],eax;TGLBitmap32.?fC:dword
 0046FCF4    mov         eax,dword ptr [ebx+4];TGLBitmap32.?f4:dword
 0046FCF7    call        @FreeMem
>0046FCFC    jmp         0046FE91
 0046FD01    mov         eax,esi
 0046FD03    mov         edx,dword ptr ds:[46F8F4];TGLBitmap32
 0046FD09    call        @IsClass
 0046FD0E    test        al,al
>0046FD10    je          0046FD44
 0046FD12    mov         edi,esi
 0046FD14    mov         eax,dword ptr [edi+10]
 0046FD17    mov         dword ptr [ebx+10],eax;TGLBitmap32.?f10:dword
 0046FD1A    mov         eax,dword ptr [edi+8]
 0046FD1D    mov         dword ptr [ebx+8],eax;TGLBitmap32.?f8:dword
 0046FD20    mov         eax,dword ptr [edi+0C]
 0046FD23    mov         dword ptr [ebx+0C],eax;TGLBitmap32.?fC:dword
 0046FD26    mov         edx,dword ptr [ebx+10];TGLBitmap32.?f10:dword
 0046FD29    lea         eax,[ebx+4];TGLBitmap32.?f4:dword
 0046FD2C    call        @ReallocMem
 0046FD31    mov         ecx,dword ptr [ebx+10];TGLBitmap32.?f10:dword
 0046FD34    mov         edx,dword ptr [ebx+4];TGLBitmap32.?f4:dword
 0046FD37    mov         eax,dword ptr [edi+4]
 0046FD3A    call        Move
>0046FD3F    jmp         0046FE91
 0046FD44    mov         eax,esi
 0046FD46    mov         edx,dword ptr ds:[424AB8];TGraphic
 0046FD4C    call        @IsClass
 0046FD51    test        al,al
>0046FD53    je          0046FE88
 0046FD59    mov         eax,esi
 0046FD5B    mov         edx,dword ptr ds:[424EB8];TBitmap
 0046FD61    call        @IsClass
 0046FD66    test        al,al
>0046FD68    je          0046FDAB
 0046FD6A    mov         eax,esi
 0046FD6C    call        TBitmap.GetPixelFormat
 0046FD71    add         al,0FA
 0046FD73    sub         al,2
>0046FD75    jae         0046FDAB
 0046FD77    mov         eax,esi
 0046FD79    mov         edx,dword ptr [eax]
 0046FD7B    call        dword ptr [edx+2C]
 0046FD7E    test        al,3
>0046FD80    jne         0046FDAB
 0046FD82    mov         edi,esi
 0046FD84    mov         eax,edi
 0046FD86    call        TBitmap.GetPixelFormat
 0046FD8B    cmp         al,6
>0046FD8D    jne         0046FD9D
 0046FD8F    mov         edx,edi
 0046FD91    mov         eax,ebx
 0046FD93    call        0046FE98
>0046FD98    jmp         0046FE91
 0046FD9D    mov         edx,edi
 0046FD9F    mov         eax,ebx
 0046FDA1    call        00470000
>0046FDA6    jmp         0046FE91
 0046FDAB    mov         dl,1
 0046FDAD    mov         eax,[00424EB8];TBitmap
 0046FDB2    call        TBitmap.Create;TBitmap.Create
 0046FDB7    mov         dword ptr [ebp-4],eax
 0046FDBA    xor         eax,eax
 0046FDBC    push        ebp
 0046FDBD    push        46FE81
 0046FDC2    push        dword ptr fs:[eax]
 0046FDC5    mov         dword ptr fs:[eax],esp
 0046FDC8    mov         dl,6
 0046FDCA    mov         eax,dword ptr [ebp-4]
 0046FDCD    call        TBitmap.SetPixelFormat
 0046FDD2    mov         eax,esi
 0046FDD4    mov         edx,dword ptr [eax]
 0046FDD6    call        dword ptr [edx+20]
 0046FDD9    mov         edx,eax
 0046FDDB    mov         eax,dword ptr [ebp-4]
 0046FDDE    mov         ecx,dword ptr [eax]
 0046FDE0    call        dword ptr [ecx+34];TBitmap.SetHeight
 0046FDE3    mov         eax,esi
 0046FDE5    mov         edx,dword ptr [eax]
 0046FDE7    call        dword ptr [edx+2C]
 0046FDEA    test        al,3
>0046FDEC    jne         0046FE13
 0046FDEE    mov         eax,esi
 0046FDF0    mov         edx,dword ptr [eax]
 0046FDF2    call        dword ptr [edx+2C]
 0046FDF5    mov         edx,eax
 0046FDF7    mov         eax,dword ptr [ebp-4]
 0046FDFA    mov         ecx,dword ptr [eax]
 0046FDFC    call        dword ptr [ecx+40];TBitmap.SetWidth
 0046FDFF    push        esi
 0046FE00    mov         eax,dword ptr [ebp-4]
 0046FE03    call        TBitmap.GetCanvas
 0046FE08    xor         ecx,ecx
 0046FE0A    xor         edx,edx
 0046FE0C    call        TCanvas.Draw
>0046FE11    jmp         0046FE61
 0046FE13    mov         eax,esi
 0046FE15    mov         edx,dword ptr [eax]
 0046FE17    call        dword ptr [edx+2C]
 0046FE1A    mov         edx,eax
 0046FE1C    and         edx,0FFFC
 0046FE22    add         edx,4
 0046FE25    mov         eax,dword ptr [ebp-4]
 0046FE28    mov         ecx,dword ptr [eax]
 0046FE2A    call        dword ptr [ecx+40];TBitmap.SetWidth
 0046FE2D    mov         eax,dword ptr [ebp-4]
 0046FE30    mov         edx,dword ptr [eax]
 0046FE32    call        dword ptr [edx+20];TBitmap.GetHeight
 0046FE35    push        eax
 0046FE36    lea         eax,[ebp-14]
 0046FE39    push        eax
 0046FE3A    mov         eax,dword ptr [ebp-4]
 0046FE3D    mov         edx,dword ptr [eax]
 0046FE3F    call        dword ptr [edx+2C];TBitmap.GetWidth
 0046FE42    mov         ecx,eax
 0046FE44    xor         edx,edx
 0046FE46    xor         eax,eax
 0046FE48    call        Bounds
 0046FE4D    lea         eax,[ebp-14]
 0046FE50    push        eax
 0046FE51    mov         eax,dword ptr [ebp-4]
 0046FE54    call        TBitmap.GetCanvas
 0046FE59    mov         ecx,esi
 0046FE5B    pop         edx
 0046FE5C    call        TCanvas.StretchDraw
 0046FE61    mov         edx,dword ptr [ebp-4]
 0046FE64    mov         eax,ebx
 0046FE66    call        0046FE98
 0046FE6B    xor         eax,eax
 0046FE6D    pop         edx
 0046FE6E    pop         ecx
 0046FE6F    pop         ecx
 0046FE70    mov         dword ptr fs:[eax],edx
 0046FE73    push        46FE91
 0046FE78    mov         eax,dword ptr [ebp-4]
 0046FE7B    call        TObject.Free
 0046FE80    ret
>0046FE81    jmp         @HandleFinally
>0046FE86    jmp         0046FE78
 0046FE88    mov         edx,esi
 0046FE8A    mov         eax,ebx
 0046FE8C    call        TPersistent.Assign
 0046FE91    pop         edi
 0046FE92    pop         esi
 0046FE93    pop         ebx
 0046FE94    mov         esp,ebp
 0046FE96    pop         ebp
 0046FE97    ret
*}
end;

//0046FE98
procedure sub_0046FE98(?:TGLBitmap32; ?:TPersistent);
begin
{*
 0046FE98    push        ebx
 0046FE99    push        esi
 0046FE9A    push        edi
 0046FE9B    push        ebp
 0046FE9C    push        ecx
 0046FE9D    mov         esi,edx
 0046FE9F    mov         ebx,eax
 0046FEA1    mov         eax,esi
 0046FEA3    call        TBitmap.GetPixelFormat
 0046FEA8    cmp         al,6
>0046FEAA    je          0046FEC0
 0046FEAC    mov         ecx,220
 0046FEB1    mov         edx,46FFB0;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 0046FEB6    mov         eax,46FFEC;'Assertion failure'
 0046FEBB    call        @Assert
 0046FEC0    mov         eax,esi
 0046FEC2    mov         edx,dword ptr [eax]
 0046FEC4    call        dword ptr [edx+2C]
 0046FEC7    test        al,3
>0046FEC9    je          0046FEDF
 0046FECB    mov         ecx,221
 0046FED0    mov         edx,46FFB0;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 0046FED5    mov         eax,46FFEC;'Assertion failure'
 0046FEDA    call        @Assert
 0046FEDF    mov         eax,esi
 0046FEE1    mov         edx,dword ptr [eax]
 0046FEE3    call        dword ptr [edx+2C]
 0046FEE6    mov         dword ptr [ebx+8],eax;TGLBitmap32.?f8:dword
 0046FEE9    mov         eax,esi
 0046FEEB    mov         edx,dword ptr [eax]
 0046FEED    call        dword ptr [edx+20]
 0046FEF0    mov         edi,eax
 0046FEF2    mov         dword ptr [ebx+0C],edi;TGLBitmap32.?fC:dword
 0046FEF5    mov         eax,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 0046FEF8    imul        edi
 0046FEFA    shl         eax,2
 0046FEFD    mov         dword ptr [ebx+10],eax;TGLBitmap32.?f10:dword
 0046FF00    lea         edx,[ebx+4];TGLBitmap32.?f4:dword
 0046FF03    xchg        eax,edx
 0046FF04    call        @ReallocMem
 0046FF09    mov         eax,dword ptr [ebx+0C];TGLBitmap32.?fC:dword
 0046FF0C    test        eax,eax
>0046FF0E    jle         0046FF9F
 0046FF14    mov         ecx,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 0046FF17    shl         ecx,2
 0046FF1A    mov         edx,eax
 0046FF1C    dec         edx
 0046FF1D    imul        ecx,edx
 0046FF20    mov         edi,dword ptr [ebx+4];TGLBitmap32.?f4:dword
 0046FF23    add         edi,ecx
 0046FF25    dec         eax
>0046FF26    jne         0046FF3D
 0046FF28    xor         edx,edx
 0046FF2A    mov         eax,esi
 0046FF2C    call        0046F874
 0046FF31    mov         ecx,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 0046FF34    mov         edx,edi
 0046FF36    call        0046FC10
>0046FF3B    jmp         0046FF9F
 0046FF3D    cmp         byte ptr [ebx+14],0;TGLBitmap32.?f14:byte
>0046FF41    je          0046FF60
 0046FF43    mov         eax,esi
 0046FF45    call        0046F874
 0046FF4A    mov         ebp,eax
 0046FF4C    mov         edx,dword ptr [ebx+0C];TGLBitmap32.?fC:dword
 0046FF4F    sub         edx,2
 0046FF52    mov         eax,esi
 0046FF54    call        0046F874
 0046FF59    sub         eax,ebp
 0046FF5B    mov         dword ptr [esp],eax
>0046FF5E    jmp         0046FF7C
 0046FF60    xor         edx,edx
 0046FF62    mov         eax,esi
 0046FF64    call        0046F874
 0046FF69    mov         ebp,eax
 0046FF6B    mov         edx,1
 0046FF70    mov         eax,esi
 0046FF72    call        0046F874
 0046FF77    sub         eax,ebp
 0046FF79    mov         dword ptr [esp],eax
 0046FF7C    mov         esi,dword ptr [ebx+0C];TGLBitmap32.?fC:dword
 0046FF7F    dec         esi
 0046FF80    test        esi,esi
>0046FF82    jl          0046FF9F
 0046FF84    inc         esi
 0046FF85    mov         ecx,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 0046FF88    mov         edx,edi
 0046FF8A    mov         eax,ebp
 0046FF8C    call        0046FC10
 0046FF91    mov         eax,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 0046FF94    shl         eax,2
 0046FF97    sub         edi,eax
 0046FF99    add         ebp,dword ptr [esp]
 0046FF9C    dec         esi
>0046FF9D    jne         0046FF85
 0046FF9F    pop         edx
 0046FFA0    pop         ebp
 0046FFA1    pop         edi
 0046FFA2    pop         esi
 0046FFA3    pop         ebx
 0046FFA4    ret
*}
end;

//00470000
procedure sub_00470000(?:TGLBitmap32; ?:TPersistent);
begin
{*
 00470000    push        ebx
 00470001    push        esi
 00470002    push        edi
 00470003    push        ebp
 00470004    push        ecx
 00470005    mov         esi,edx
 00470007    mov         ebx,eax
 00470009    mov         eax,esi
 0047000B    call        TBitmap.GetPixelFormat
 00470010    cmp         al,7
>00470012    je          00470028
 00470014    mov         ecx,264
 00470019    mov         edx,470118;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 0047001E    mov         eax,470154;'Assertion failure'
 00470023    call        @Assert
 00470028    mov         eax,esi
 0047002A    mov         edx,dword ptr [eax]
 0047002C    call        dword ptr [edx+2C]
 0047002F    test        al,3
>00470031    je          00470047
 00470033    mov         ecx,265
 00470038    mov         edx,470118;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 0047003D    mov         eax,470154;'Assertion failure'
 00470042    call        @Assert
 00470047    mov         eax,esi
 00470049    mov         edx,dword ptr [eax]
 0047004B    call        dword ptr [edx+2C]
 0047004E    mov         dword ptr [ebx+8],eax;TGLBitmap32.?f8:dword
 00470051    mov         eax,esi
 00470053    mov         edx,dword ptr [eax]
 00470055    call        dword ptr [edx+20]
 00470058    mov         edi,eax
 0047005A    mov         dword ptr [ebx+0C],edi;TGLBitmap32.?fC:dword
 0047005D    mov         eax,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 00470060    imul        edi
 00470062    shl         eax,2
 00470065    mov         dword ptr [ebx+10],eax;TGLBitmap32.?f10:dword
 00470068    lea         edx,[ebx+4];TGLBitmap32.?f4:dword
 0047006B    xchg        eax,edx
 0047006C    call        @ReallocMem
 00470071    mov         eax,dword ptr [ebx+0C];TGLBitmap32.?fC:dword
 00470074    test        eax,eax
>00470076    jle         0047010A
 0047007C    mov         ecx,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 0047007F    shl         ecx,2
 00470082    mov         edx,eax
 00470084    dec         edx
 00470085    imul        ecx,edx
 00470088    mov         eax,dword ptr [ebx+4];TGLBitmap32.?f4:dword
 0047008B    lea         ebp,[eax+ecx]
 0047008E    cmp         byte ptr [ebx+14],0;TGLBitmap32.?f14:byte
>00470092    je          004700BE
 00470094    mov         eax,esi
 00470096    call        0046F874
 0047009B    mov         edi,eax
 0047009D    cmp         dword ptr [ebx+0C],1;TGLBitmap32.?fC:dword
>004700A1    jle         004700B7
 004700A3    mov         edx,dword ptr [ebx+0C];TGLBitmap32.?fC:dword
 004700A6    sub         edx,2
 004700A9    mov         eax,esi
 004700AB    call        0046F874
 004700B0    sub         eax,edi
 004700B2    mov         dword ptr [esp],eax
>004700B5    jmp         004700E7
 004700B7    xor         eax,eax
 004700B9    mov         dword ptr [esp],eax
>004700BC    jmp         004700E7
 004700BE    xor         edx,edx
 004700C0    mov         eax,esi
 004700C2    call        0046F874
 004700C7    mov         edi,eax
 004700C9    cmp         dword ptr [ebx+0C],1;TGLBitmap32.?fC:dword
>004700CD    jle         004700E2
 004700CF    mov         edx,1
 004700D4    mov         eax,esi
 004700D6    call        0046F874
 004700DB    sub         eax,edi
 004700DD    mov         dword ptr [esp],eax
>004700E0    jmp         004700E7
 004700E2    xor         eax,eax
 004700E4    mov         dword ptr [esp],eax
 004700E7    mov         esi,dword ptr [ebx+0C];TGLBitmap32.?fC:dword
 004700EA    dec         esi
 004700EB    test        esi,esi
>004700ED    jl          0047010A
 004700EF    inc         esi
 004700F0    mov         ecx,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 004700F3    mov         edx,ebp
 004700F5    mov         eax,edi
 004700F7    call        0046FC4C
 004700FC    mov         eax,dword ptr [ebx+8];TGLBitmap32.?f8:dword
 004700FF    shl         eax,2
 00470102    sub         ebp,eax
 00470104    add         edi,dword ptr [esp]
 00470107    dec         esi
>00470108    jne         004700F0
 0047010A    pop         edx
 0047010B    pop         ebp
 0047010C    pop         edi
 0047010D    pop         esi
 0047010E    pop         ebx
 0047010F    ret
*}
end;

//00470168
{*function sub_00470168(?:TPersistent):?;
begin
 00470168    push        ebx
 00470169    push        esi
 0047016A    push        edi
 0047016B    add         esp,0FFFFFFF0
 0047016E    mov         dword ptr [esp],eax
 00470171    mov         dl,1
 00470173    mov         eax,[00424EB8];TBitmap
 00470178    call        TBitmap.Create;TBitmap.Create
 0047017D    mov         dword ptr [esp+4],eax
 00470181    mov         dl,7
 00470183    mov         eax,dword ptr [esp+4]
 00470187    call        TBitmap.SetPixelFormat
 0047018C    mov         eax,dword ptr [esp]
 0047018F    mov         edx,dword ptr [eax+8]
 00470192    mov         eax,dword ptr [esp+4]
 00470196    mov         ecx,dword ptr [eax]
 00470198    call        dword ptr [ecx+40]
 0047019B    mov         eax,dword ptr [esp]
 0047019E    mov         edx,dword ptr [eax+0C]
 004701A1    mov         eax,dword ptr [esp+4]
 004701A5    mov         ecx,dword ptr [eax]
 004701A7    call        dword ptr [ecx+34]
 004701AA    mov         eax,dword ptr [esp]
 004701AD    mov         eax,dword ptr [eax+0C]
 004701B0    test        eax,eax
>004701B2    jle         0047023A
 004701B8    mov         ecx,dword ptr [esp]
 004701BB    mov         ecx,dword ptr [ecx+8]
 004701BE    shl         ecx,2
 004701C1    mov         edx,eax
 004701C3    dec         edx
 004701C4    imul        ecx,edx
 004701C7    mov         eax,dword ptr [esp]
 004701CA    mov         eax,dword ptr [eax+4]
 004701CD    lea         ebx,[eax+ecx]
 004701D0    test        edx,edx
>004701D2    jl          0047023A
 004701D4    inc         edx
 004701D5    mov         dword ptr [esp+0C],edx
 004701D9    mov         dword ptr [esp+8],0
 004701E1    mov         edx,dword ptr [esp+8]
 004701E5    mov         eax,dword ptr [esp+4]
 004701E9    call        0046F874
 004701EE    mov         edx,eax
 004701F0    mov         eax,dword ptr [esp]
 004701F3    mov         edi,dword ptr [eax+8]
 004701F6    dec         edi
 004701F7    test        edi,edi
>004701F9    jl          00470225
 004701FB    inc         edi
 004701FC    xor         esi,esi
 004701FE    mov         eax,esi
 00470200    shl         eax,2
 00470203    mov         cl,byte ptr [ebx+eax+2]
 00470207    mov         byte ptr [edx+eax],cl
 0047020A    mov         cl,byte ptr [ebx+eax+1]
 0047020E    mov         byte ptr [edx+eax+1],cl
 00470212    mov         cl,byte ptr [ebx+eax]
 00470215    mov         byte ptr [edx+eax+2],cl
 00470219    mov         cl,byte ptr [ebx+eax+3]
 0047021D    mov         byte ptr [edx+eax+3],cl
 00470221    inc         esi
 00470222    dec         edi
>00470223    jne         004701FE
 00470225    mov         eax,dword ptr [esp]
 00470228    mov         eax,dword ptr [eax+8]
 0047022B    shl         eax,2
 0047022E    sub         ebx,eax
 00470230    inc         dword ptr [esp+8]
 00470234    dec         dword ptr [esp+0C]
>00470238    jne         004701E1
 0047023A    mov         eax,dword ptr [esp+4]
 0047023E    add         esp,10
 00470241    pop         edi
 00470242    pop         esi
 00470243    pop         ebx
 00470244    ret
end;*}

//00470248
{*function sub_00470248(?:?):?;
begin
 00470248    cmp         dword ptr [eax+8],0
>0047024C    je          00470257
 0047024E    cmp         dword ptr [eax+0C],0
>00470252    je          00470257
 00470254    xor         eax,eax
 00470256    ret
 00470257    mov         al,1
 00470259    ret
end;*}

//0047025C
procedure sub_0047025C(?:TGLBitmap32; ?:Integer);
begin
{*
 0047025C    push        ebx
 0047025D    push        esi
 0047025E    mov         esi,edx
 00470260    mov         ebx,eax
 00470262    test        esi,3
>00470268    jle         00470273
 0047026A    and         esi,0FFFC
 00470270    add         esi,4
 00470273    cmp         esi,dword ptr [ebx+8]
>00470276    je          004702A8
 00470278    test        esi,esi
>0047027A    jge         00470290
 0047027C    mov         ecx,2F1
 00470281    mov         edx,4702B4;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 00470286    mov         eax,4702F0;'Assertion failure'
 0047028B    call        @Assert
 00470290    mov         eax,esi
 00470292    mov         dword ptr [ebx+8],eax
 00470295    imul        dword ptr [ebx+0C]
 00470298    mov         edx,eax
 0047029A    shl         edx,2
 0047029D    mov         dword ptr [ebx+10],edx
 004702A0    lea         eax,[ebx+4]
 004702A3    call        @ReallocMem
 004702A8    pop         esi
 004702A9    pop         ebx
 004702AA    ret
*}
end;

//00470304
procedure sub_00470304(?:TGLBitmap32; ?:Integer);
begin
{*
 00470304    push        ebx
 00470305    push        esi
 00470306    mov         esi,edx
 00470308    mov         ebx,eax
 0047030A    cmp         esi,dword ptr [ebx+0C]
>0047030D    je          00470340
 0047030F    test        esi,esi
>00470311    jge         00470327
 00470313    mov         ecx,2FD
 00470318    mov         edx,47034C;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 0047031D    mov         eax,470388;'Assertion failure'
 00470322    call        @Assert
 00470327    mov         eax,esi
 00470329    mov         dword ptr [ebx+0C],eax
 0047032C    mov         edx,dword ptr [ebx+8]
 0047032F    imul        edx,eax
 00470332    shl         edx,2
 00470335    mov         dword ptr [ebx+10],edx
 00470338    lea         eax,[ebx+4]
 0047033B    call        @ReallocMem
 00470340    pop         esi
 00470341    pop         ebx
 00470342    ret
*}
end;

//0047039C
{*function sub_0047039C(?:?; ?:?):?;
begin
 0047039C    imul        edx,dword ptr [eax+8]
 004703A0    mov         eax,dword ptr [eax+4]
 004703A3    lea         eax,[eax+edx*4]
 004703A6    ret
end;*}

//004703A8
procedure sub_004703A8(?:TGLBitmap32);
begin
{*
 004703A8    push        ebx
 004703A9    push        esi
 004703AA    push        edi
 004703AB    push        ebp
 004703AC    mov         edi,eax
 004703AE    mov         ebx,dword ptr [edi+10]
 004703B1    test        ebx,ebx
>004703B3    jns         004703B8
 004703B5    add         ebx,3
 004703B8    sar         ebx,2
 004703BB    dec         ebx
 004703BC    test        ebx,ebx
>004703BE    jl          004703EA
 004703C0    inc         ebx
 004703C1    xor         esi,esi
 004703C3    mov         eax,dword ptr [edi+4]
 004703C6    lea         ecx,[eax+esi*4]
 004703C9    xor         eax,eax
 004703CB    mov         al,byte ptr [ecx]
 004703CD    xor         edx,edx
 004703CF    mov         dl,byte ptr [ecx+1]
 004703D2    add         eax,edx
 004703D4    xor         edx,edx
 004703D6    mov         dl,byte ptr [ecx+2]
 004703D9    add         eax,edx
 004703DB    mov         ebp,3
 004703E0    cdq
 004703E1    idiv        eax,ebp
 004703E3    mov         byte ptr [ecx+3],al
 004703E6    inc         esi
 004703E7    dec         ebx
>004703E8    jne         004703C3
 004703EA    pop         ebp
 004703EB    pop         edi
 004703EC    pop         esi
 004703ED    pop         ebx
 004703EE    ret
*}
end;

//004703F0
{*procedure sub_004703F0(?:TGLBitmap32; ?:?);
begin
 004703F0    push        ebx
 004703F1    push        esi
 004703F2    push        ecx
 004703F3    mov         ebx,edx
 004703F5    mov         esi,eax
 004703F7    mov         eax,ebx
 004703F9    call        0046F4B8
 004703FE    mov         byte ptr [esp],al
 00470401    mov         eax,ebx
 00470403    call        0046F4BC
 00470408    mov         byte ptr [esp+1],al
 0047040C    mov         eax,ebx
 0047040E    call        0046F4C0
 00470413    mov         byte ptr [esp+2],al
 00470417    mov         al,byte ptr [esp+2]
 0047041B    shl         eax,10
 0047041E    mov         ax,word ptr [esp]
 00470422    push        eax
 00470423    mov         eax,esi
 00470425    call        00470464
 0047042A    pop         edx
 0047042B    pop         esi
 0047042C    pop         ebx
 0047042D    ret
end;*}

//00470430
{*procedure sub_00470430(?:TGLBitmap32; ?:?);
begin
 00470430    add         esp,0FFFFFFF8
 00470433    mov         dword ptr [esp],edx
 00470436    mov         dl,byte ptr [esp]
 00470439    mov         byte ptr [esp+4],dl
 0047043D    mov         dl,byte ptr [esp+1]
 00470441    mov         byte ptr [esp+5],dl
 00470445    mov         dl,byte ptr [esp+2]
 00470449    mov         byte ptr [esp+6],dl
 0047044D    mov         dl,byte ptr [esp+6]
 00470451    shl         edx,10
 00470454    mov         dx,word ptr [esp+4]
 00470459    push        edx
 0047045A    call        00470464
 0047045F    pop         ecx
 00470460    pop         edx
 00470461    ret
end;*}

//00470464
{*procedure sub_00470464(?:?; ?:?);
begin
 00470464    push        ebp
 00470465    mov         ebp,esp
 00470467    push        ebx
 00470468    push        esi
 00470469    push        edi
 0047046A    lea         edx,[ebp+8]
 0047046D    mov         esi,dword ptr [edx]
 0047046F    and         esi,0FFFFFF
 00470475    mov         ecx,dword ptr [eax+10]
 00470478    test        ecx,ecx
>0047047A    jns         0047047F
 0047047C    add         ecx,3
 0047047F    sar         ecx,2
 00470482    dec         ecx
 00470483    test        ecx,ecx
>00470485    jl          004704AC
 00470487    inc         ecx
 00470488    xor         edx,edx
 0047048A    mov         edi,dword ptr [eax+4]
 0047048D    lea         ebx,[edi+edx*4]
 00470490    mov         ebx,dword ptr [ebx]
 00470492    and         ebx,0FFFFFF
 00470498    cmp         esi,ebx
>0047049A    jne         004704A3
 0047049C    mov         byte ptr [edi+edx*4+3],0
>004704A1    jmp         004704A8
 004704A3    mov         byte ptr [edi+edx*4+3],0FF
 004704A8    inc         edx
 004704A9    dec         ecx
>004704AA    jne         0047048A
 004704AC    pop         edi
 004704AD    pop         esi
 004704AE    pop         ebx
 004704AF    pop         ebp
 004704B0    ret         4
end;*}

//004704B4
{*procedure sub_004704B4(?:TGLBitmap32; ?:?);
begin
 004704B4    push        ebx
 004704B5    push        esi
 004704B6    mov         ecx,dword ptr [eax+10]
 004704B9    test        ecx,ecx
>004704BB    jns         004704C0
 004704BD    add         ecx,3
 004704C0    sar         ecx,2
 004704C3    dec         ecx
 004704C4    test        ecx,ecx
>004704C6    jl          004704D6
 004704C8    inc         ecx
 004704C9    xor         esi,esi
 004704CB    mov         ebx,dword ptr [eax+4]
 004704CE    mov         byte ptr [ebx+esi*4+3],dl
 004704D2    inc         esi
 004704D3    dec         ecx
>004704D4    jne         004704CB
 004704D6    pop         esi
 004704D7    pop         ebx
 004704D8    ret
end;*}

//004704DC
{*procedure sub_004704DC(?:?);
begin
 004704DC    push        esi
 004704DD    push        edi
 004704DE    mov         esi,dword ptr [eax+10]
 004704E1    test        esi,esi
>004704E3    jns         004704E8
 004704E5    add         esi,3
 004704E8    sar         esi,2
 004704EB    dec         esi
 004704EC    test        esi,esi
>004704EE    jl          00470504
 004704F0    inc         esi
 004704F1    xor         edx,edx
 004704F3    mov         edi,dword ptr [eax+4]
 004704F6    mov         cl,0FF
 004704F8    sub         cl,byte ptr [edi+edx*4+3]
 004704FC    mov         byte ptr [edi+edx*4+3],cl
 00470500    inc         edx
 00470501    dec         esi
>00470502    jne         004704F3
 00470504    pop         edi
 00470505    pop         esi
 00470506    ret
end;*}

//00470508
procedure sub_00470508(?:TGLBitmap32);
begin
{*
 00470508    push        ebx
 00470509    push        esi
 0047050A    push        edi
 0047050B    push        ebp
 0047050C    mov         edi,eax
 0047050E    call        0046BE58
 00470513    mov         ebp,eax
 00470515    mov         ebx,dword ptr [edi+10]
 00470518    test        ebx,ebx
>0047051A    jns         0047051F
 0047051C    add         ebx,3
 0047051F    sar         ebx,2
 00470522    dec         ebx
 00470523    test        ebx,ebx
>00470525    jl          00470557
 00470527    inc         ebx
 00470528    xor         esi,esi
 0047052A    mov         eax,dword ptr [edi+4]
 0047052D    lea         ecx,[eax+esi*4]
 00470530    xor         eax,eax
 00470532    mov         al,byte ptr [ecx]
 00470534    xor         edx,edx
 00470536    mov         dl,byte ptr [ecx+1]
 00470539    add         eax,edx
 0047053B    xor         edx,edx
 0047053D    mov         dl,byte ptr [ecx+2]
 00470540    add         eax,edx
 00470542    push        ecx
 00470543    mov         ecx,3
 00470548    cdq
 00470549    idiv        eax,ecx
 0047054B    pop         ecx
 0047054C    mov         al,byte ptr [ebp+eax]
 00470550    mov         byte ptr [ecx+3],al
 00470553    inc         esi
 00470554    dec         ebx
>00470555    jne         0047052A
 00470557    pop         ebp
 00470558    pop         edi
 00470559    pop         esi
 0047055A    pop         ebx
 0047055B    ret
*}
end;

//0047055C
{*procedure sub_0047055C(?:?; ?:?);
begin
 0047055C    push        ebp
 0047055D    mov         ebp,esp
 0047055F    mov         edx,dword ptr [eax+4]
 00470562    test        edx,edx
>00470564    je          0047057F
 00470566    push        dword ptr [ebp+8]
 00470569    mov         ecx,dword ptr [eax+10]
 0047056C    test        ecx,ecx
>0047056E    jns         00470573
 00470570    add         ecx,3
 00470573    sar         ecx,2
 00470576    mov         eax,edx
 00470578    mov         edx,ecx
 0047057A    call        0046FAF0
 0047057F    pop         ebp
 00470580    ret         4
end;*}

//00470584
{*procedure sub_00470584(?:?; ?:?);
begin
 00470584    push        ebp
 00470585    mov         ebp,esp
 00470587    mov         edx,dword ptr [eax+4]
 0047058A    test        edx,edx
>0047058C    je          004705A7
 0047058E    push        dword ptr [ebp+8]
 00470591    mov         ecx,dword ptr [eax+10]
 00470594    test        ecx,ecx
>00470596    jns         0047059B
 00470598    add         ecx,3
 0047059B    sar         ecx,2
 0047059E    mov         eax,edx
 004705A0    mov         edx,ecx
 004705A2    call        0046F980
 004705A7    pop         ebp
 004705A8    ret         4
end;*}

//004705AC
{*procedure sub_004705AC(?:?);
begin
 004705AC    push        ebp
 004705AD    mov         ebp,esp
 004705AF    add         esp,0FFFFFFF8
 004705B2    push        ebx
 004705B3    mov         ebx,dword ptr [ebp+8]
 004705B6    push        ebx
 004705B7    lea         ebx,[ebp-4]
 004705BA    push        ebx
 004705BB    lea         ebx,[ebp-8]
 004705BE    push        ebx
 004705BF    call        004705F0
 004705C4    pop         ebx
 004705C5    pop         ecx
 004705C6    pop         ecx
 004705C7    pop         ebp
 004705C8    ret         4
end;*}

//004705CC
{*function sub_004705CC(?:?):?;
begin
 004705CC    cmp         eax,888A
>004705D1    je          004705EB
 004705D3    cmp         eax,888B
>004705D8    je          004705EB
 004705DA    cmp         eax,881A
>004705DF    je          004705EB
 004705E1    cmp         eax,8814
>004705E6    je          004705EB
 004705E8    xor         eax,eax
 004705EA    ret
 004705EB    mov         al,1
 004705ED    ret
end;*}

//004705F0
{*procedure sub_004705F0(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004705F0    push        ebp
 004705F1    mov         ebp,esp
 004705F3    add         esp,0FFFFFFEC
 004705F6    push        ebx
 004705F7    push        esi
 004705F8    push        edi
 004705F9    mov         byte ptr [ebp-9],cl
 004705FC    mov         dword ptr [ebp-8],edx
 004705FF    mov         dword ptr [ebp-4],eax
 00470602    mov         edi,dword ptr [ebp+10]
 00470605    mov         eax,dword ptr [ebp-4]
 00470608    cmp         dword ptr [eax+10],0
>0047060C    jle         004707C6
 00470612    mov         eax,dword ptr [ebp-4]
 00470615    mov         eax,dword ptr [eax+8]
 00470618    call        0046BCE8
 0047061D    mov         ebx,eax
 0047061F    mov         eax,dword ptr [ebp-4]
 00470622    mov         eax,dword ptr [eax+0C]
 00470625    call        0046BCE8
 0047062A    mov         esi,eax
 0047062C    lea         eax,[ebp-10]
 0047062F    push        eax
 00470630    push        0D33
 00470635    call        OpenGL32.glGetIntegerv
 0047063A    cmp         ebx,dword ptr [ebp-10]
>0047063D    jle         00470642
 0047063F    mov         ebx,dword ptr [ebp-10]
 00470642    cmp         esi,dword ptr [ebp-10]
>00470645    jle         0047064A
 00470647    mov         esi,dword ptr [ebp-10]
 0047064A    mov         eax,dword ptr [ebp+0C]
 0047064D    mov         dword ptr [eax],ebx
 0047064F    mov         eax,dword ptr [ebp+8]
 00470652    mov         dword ptr [eax],esi
 00470654    mov         eax,edi
 00470656    call        004705CC
 0047065B    test        al,al
>0047065D    jne         004706BA
 0047065F    mov         eax,dword ptr [ebp-4]
 00470662    cmp         ebx,dword ptr [eax+8]
>00470665    jne         0047066F
 00470667    mov         eax,dword ptr [ebp-4]
 0047066A    cmp         esi,dword ptr [eax+0C]
>0047066D    je          004706AF
 0047066F    mov         eax,ebx
 00470671    imul        esi
 00470673    shl         eax,2
 00470676    call        @GetMem
 0047067B    mov         dword ptr [ebp-14],eax
 0047067E    mov         eax,dword ptr [ebp-14]
 00470681    push        eax
 00470682    push        1401
 00470687    push        esi
 00470688    push        ebx
 00470689    mov         eax,dword ptr [ebp-4]
 0047068C    mov         eax,dword ptr [eax+4]
 0047068F    push        eax
 00470690    push        1401
 00470695    mov         eax,dword ptr [ebp-4]
 00470698    mov         eax,dword ptr [eax+0C]
 0047069B    push        eax
 0047069C    mov         eax,dword ptr [ebp-4]
 0047069F    mov         eax,dword ptr [eax+8]
 004706A2    push        eax
 004706A3    push        1908
 004706A8    call        GLU32.gluScaleImage
>004706AD    jmp         004706C3
 004706AF    mov         eax,dword ptr [ebp-4]
 004706B2    mov         eax,dword ptr [eax+4]
 004706B5    mov         dword ptr [ebp-14],eax
>004706B8    jmp         004706C3
 004706BA    mov         eax,dword ptr [ebp-4]
 004706BD    mov         eax,dword ptr [eax+4]
 004706C0    mov         dword ptr [ebp-14],eax
 004706C3    xor         eax,eax
 004706C5    push        ebp
 004706C6    push        4707BF
 004706CB    push        dword ptr fs:[eax]
 004706CE    mov         dword ptr fs:[eax],esp
 004706D1    mov         eax,edi
 004706D3    call        004705CC
 004706D8    test        al,al
>004706DA    je          0047071A
 004706DC    cmp         dword ptr [ebp-8],84F5
>004706E3    je          004706F9
 004706E5    mov         ecx,401
 004706EA    mov         edx,4707D8;'C:\GLScene\glscene_v_1000714\Source\GLGraphics.pas'
 004706EF    mov         eax,470814;'NV Float-type texture must use GL_TEXTURE_RECTANGLE_NV'
 004706F4    call        @Assert
 004706F9    push        0
 004706FB    push        1406
 00470700    push        1908
 00470705    push        0
 00470707    push        esi
 00470708    push        ebx
 00470709    push        edi
 0047070A    push        0
 0047070C    mov         eax,dword ptr [ebp-8]
 0047070F    push        eax
 00470710    call        OpenGL32.glTexImage2D
>00470715    jmp         0047079E
 0047071A    mov         al,byte ptr [ebp-9]
 0047071D    sub         al,2
>0047071F    jae         00470741
 00470721    mov         eax,dword ptr [ebp-14]
 00470724    push        eax
 00470725    push        1401
 0047072A    push        1908
 0047072F    push        0
 00470731    push        esi
 00470732    push        ebx
 00470733    push        edi
 00470734    push        0
 00470736    mov         eax,dword ptr [ebp-8]
 00470739    push        eax
 0047073A    call        OpenGL32.glTexImage2D
>0047073F    jmp         0047079E
 00470741    mov         eax,[005AE7C8];^gvar_005E0D28
 00470746    cmp         byte ptr [eax],0
>00470749    je          00470784
 0047074B    cmp         dword ptr [ebp-8],0DE1
>00470752    jne         00470784
 00470754    push        1
 00470756    push        8191
 0047075B    mov         eax,dword ptr [ebp-8]
 0047075E    push        eax
 0047075F    call        OpenGL32.glTexParameteri
 00470764    mov         eax,dword ptr [ebp-14]
 00470767    push        eax
 00470768    push        1401
 0047076D    push        1908
 00470772    push        0
 00470774    push        esi
 00470775    push        ebx
 00470776    push        edi
 00470777    push        0
 00470779    mov         eax,dword ptr [ebp-8]
 0047077C    push        eax
 0047077D    call        OpenGL32.glTexImage2D
>00470782    jmp         0047079E
 00470784    mov         eax,dword ptr [ebp-14]
 00470787    push        eax
 00470788    push        1401
 0047078D    push        1908
 00470792    push        esi
 00470793    push        ebx
 00470794    push        edi
 00470795    mov         eax,dword ptr [ebp-8]
 00470798    push        eax
 00470799    call        GLU32.gluBuild2DMipmaps
 0047079E    xor         eax,eax
 004707A0    pop         edx
 004707A1    pop         ecx
 004707A2    pop         ecx
 004707A3    mov         dword ptr fs:[eax],edx
 004707A6    push        4707C6
 004707AB    mov         eax,dword ptr [ebp-4]
 004707AE    mov         eax,dword ptr [eax+4]
 004707B1    cmp         eax,dword ptr [ebp-14]
>004707B4    je          004707BE
 004707B6    mov         eax,dword ptr [ebp-14]
 004707B9    call        @FreeMem
 004707BE    ret
>004707BF    jmp         @HandleFinally
>004707C4    jmp         004707AB
 004707C6    pop         edi
 004707C7    pop         esi
 004707C8    pop         ebx
 004707C9    mov         esp,ebp
 004707CB    pop         ebp
 004707CC    ret         0C
end;*}

//0047084C
{*procedure sub_0047084C(?:?; ?:?; ?:?; ?:?);
begin
 0047084C    push        ebp
 0047084D    mov         ebp,esp
 0047084F    add         esp,0FFFFFFC4
 00470852    push        ebx
 00470853    push        esi
 00470854    push        edi
 00470855    mov         byte ptr [ebp-6],cl
 00470858    mov         byte ptr [ebp-5],dl
 0047085B    mov         dword ptr [ebp-4],eax
 0047085E    mov         eax,dword ptr [ebp-4]
 00470861    cmp         dword ptr [eax+4],0
>00470865    je          00470B04
 0047086B    mov         eax,dword ptr [ebp-4]
 0047086E    mov         eax,dword ptr [eax+10]
 00470871    call        AllocMem
 00470876    mov         dword ptr [ebp-30],eax
 00470879    xor         edx,edx
 0047087B    push        ebp
 0047087C    push        470AFD
 00470881    push        dword ptr fs:[edx]
 00470884    mov         dword ptr fs:[edx],esp
 00470887    mov         eax,dword ptr [ebp-4]
 0047088A    mov         eax,dword ptr [eax+8]
 0047088D    dec         eax
 0047088E    mov         dword ptr [ebp-1C],eax
 00470891    mov         eax,dword ptr [ebp-4]
 00470894    mov         eax,dword ptr [eax+0C]
 00470897    dec         eax
 00470898    mov         dword ptr [ebp-20],eax
 0047089B    mov         edx,dword ptr [ebp-30]
 0047089E    mov         dword ptr [ebp-34],edx
 004708A1    test        eax,eax
>004708A3    jl          00470AD3
 004708A9    inc         eax
 004708AA    mov         dword ptr [ebp-38],eax
 004708AD    mov         dword ptr [ebp-0C],0
 004708B4    mov         edx,dword ptr [ebp-0C]
 004708B7    mov         eax,dword ptr [ebp-4]
 004708BA    call        0047039C
 004708BF    mov         dword ptr [ebp-24],eax
 004708C2    cmp         byte ptr [ebp-6],0
>004708C6    je          004708EE
 004708C8    mov         edx,dword ptr [ebp-0C]
 004708CB    dec         edx
 004708CC    and         edx,dword ptr [ebp-20]
 004708CF    mov         eax,dword ptr [ebp-4]
 004708D2    call        0047039C
 004708D7    mov         dword ptr [ebp-2C],eax
 004708DA    mov         edx,dword ptr [ebp-0C]
 004708DD    inc         edx
 004708DE    and         edx,dword ptr [ebp-20]
 004708E1    mov         eax,dword ptr [ebp-4]
 004708E4    call        0047039C
 004708E9    mov         dword ptr [ebp-28],eax
>004708EC    jmp         0047092E
 004708EE    cmp         dword ptr [ebp-0C],0
>004708F2    jle         00470905
 004708F4    mov         edx,dword ptr [ebp-0C]
 004708F7    dec         edx
 004708F8    mov         eax,dword ptr [ebp-4]
 004708FB    call        0047039C
 00470900    mov         dword ptr [ebp-2C],eax
>00470903    jmp         0047090B
 00470905    mov         eax,dword ptr [ebp-24]
 00470908    mov         dword ptr [ebp-2C],eax
 0047090B    mov         eax,dword ptr [ebp-4]
 0047090E    mov         eax,dword ptr [eax+0C]
 00470911    dec         eax
 00470912    cmp         eax,dword ptr [ebp-0C]
>00470915    jle         00470928
 00470917    mov         edx,dword ptr [ebp-0C]
 0047091A    inc         edx
 0047091B    mov         eax,dword ptr [ebp-4]
 0047091E    call        0047039C
 00470923    mov         dword ptr [ebp-28],eax
>00470926    jmp         0047092E
 00470928    mov         eax,dword ptr [ebp-24]
 0047092B    mov         dword ptr [ebp-28],eax
 0047092E    mov         eax,dword ptr [ebp-4]
 00470931    mov         edi,dword ptr [eax+8]
 00470934    dec         edi
 00470935    test        edi,edi
>00470937    jl          00470AC7
 0047093D    inc         edi
 0047093E    xor         ebx,ebx
 00470940    cmp         byte ptr [ebp-5],0
>00470944    je          00470973
 00470946    mov         eax,ebx
 00470948    dec         eax
 00470949    and         eax,dword ptr [ebp-1C]
 0047094C    mov         edx,dword ptr [ebp-24]
 0047094F    movzx       eax,byte ptr [edx+eax*4+1]
 00470954    lea         edx,[ebx+1]
 00470957    and         edx,dword ptr [ebp-1C]
 0047095A    mov         ecx,dword ptr [ebp-24]
 0047095D    movzx       edx,byte ptr [ecx+edx*4+1]
 00470962    sub         eax,edx
 00470964    mov         dword ptr [ebp-3C],eax
 00470967    fild        dword ptr [ebp-3C]
 0047096A    fmul        dword ptr [ebp+8]
 0047096D    fstp        dword ptr [ebp-10]
 00470970    wait
>00470971    jmp         004709E3
 00470973    test        ebx,ebx
>00470975    jne         00470998
 00470977    mov         eax,dword ptr [ebp-24]
 0047097A    movzx       eax,byte ptr [eax+ebx*4+1]
 0047097F    mov         edx,dword ptr [ebp-24]
 00470982    movzx       edx,byte ptr [edx+ebx*4+5]
 00470987    sub         eax,edx
 00470989    mov         dword ptr [ebp-3C],eax
 0047098C    fild        dword ptr [ebp-3C]
 0047098F    fmul        dword ptr [ebp+8]
 00470992    fstp        dword ptr [ebp-10]
 00470995    wait
>00470996    jmp         004709E3
 00470998    mov         eax,dword ptr [ebp-4]
 0047099B    mov         eax,dword ptr [eax+8]
 0047099E    dec         eax
 0047099F    cmp         ebx,eax
>004709A1    jge         004709C4
 004709A3    mov         eax,dword ptr [ebp-24]
 004709A6    movzx       eax,byte ptr [eax+ebx*4-3]
 004709AB    mov         edx,dword ptr [ebp-24]
 004709AE    movzx       edx,byte ptr [edx+ebx*4+1]
 004709B3    sub         eax,edx
 004709B5    mov         dword ptr [ebp-3C],eax
 004709B8    fild        dword ptr [ebp-3C]
 004709BB    fmul        dword ptr [ebp+8]
 004709BE    fstp        dword ptr [ebp-10]
 004709C1    wait
>004709C2    jmp         004709E3
 004709C4    mov         eax,dword ptr [ebp-24]
 004709C7    movzx       eax,byte ptr [eax+ebx*4-3]
 004709CC    mov         edx,dword ptr [ebp-24]
 004709CF    movzx       edx,byte ptr [edx+ebx*4+5]
 004709D4    sub         eax,edx
 004709D6    mov         dword ptr [ebp-3C],eax
 004709D9    fild        dword ptr [ebp-3C]
 004709DC    fmul        dword ptr [ebp+8]
 004709DF    fstp        dword ptr [ebp-10]
 004709E2    wait
 004709E3    mov         eax,dword ptr [ebp-2C]
 004709E6    movzx       eax,byte ptr [eax+ebx*4+1]
 004709EB    mov         edx,dword ptr [ebp-28]
 004709EE    movzx       edx,byte ptr [edx+ebx*4+1]
 004709F3    sub         eax,edx
 004709F5    mov         dword ptr [ebp-3C],eax
 004709F8    fild        dword ptr [ebp-3C]
 004709FB    fmul        dword ptr [ebp+8]
 004709FE    fstp        dword ptr [ebp-14]
 00470A01    wait
 00470A02    fld         dword ptr [ebp-10]
 00470A05    fmul        dword ptr [ebp-10]
 00470A08    fld         dword ptr [ebp-14]
 00470A0B    fmul        dword ptr [ebp-14]
 00470A0E    faddp       st(1),st
 00470A10    fadd        dword ptr ds:[470B10];1:Single
 00470A16    add         esp,0FFFFFFFC
 00470A19    fstp        dword ptr [esp]
 00470A1C    wait
 00470A1D    call        0045F640
 00470A22    fmul        dword ptr ds:[470B14];127:Single
 00470A28    fstp        dword ptr [ebp-18]
 00470A2B    wait
 00470A2C    mov         esi,dword ptr [ebp-34]
 00470A2F    fld         dword ptr [ebp-10]
 00470A32    fmul        dword ptr [ebp-18]
 00470A35    add         esp,0FFFFFFFC
 00470A38    fstp        dword ptr [esp]
 00470A3B    wait
 00470A3C    push        0C3000000
 00470A41    push        42FE0000
 00470A46    call        0045F7C4
 00470A4B    fadd        dword ptr ds:[470B18];128:Single
 00470A51    add         esp,0FFFFFFFC
 00470A54    fstp        dword ptr [esp]
 00470A57    wait
 00470A58    call        0045F6EC
 00470A5D    mov         byte ptr [esi],al
 00470A5F    fld         dword ptr [ebp-14]
 00470A62    fmul        dword ptr [ebp-18]
 00470A65    add         esp,0FFFFFFFC
 00470A68    fstp        dword ptr [esp]
 00470A6B    wait
 00470A6C    push        0C3000000
 00470A71    push        42FE0000
 00470A76    call        0045F7C4
 00470A7B    fadd        dword ptr ds:[470B18];128:Single
 00470A81    add         esp,0FFFFFFFC
 00470A84    fstp        dword ptr [esp]
 00470A87    wait
 00470A88    call        0045F6EC
 00470A8D    mov         byte ptr [esi+1],al
 00470A90    push        dword ptr [ebp-18]
 00470A93    push        0C3000000
 00470A98    push        42FE0000
 00470A9D    call        0045F7C4
 00470AA2    fadd        dword ptr ds:[470B18];128:Single
 00470AA8    add         esp,0FFFFFFFC
 00470AAB    fstp        dword ptr [esp]
 00470AAE    wait
 00470AAF    call        0045F6EC
 00470AB4    mov         byte ptr [esi+2],al
 00470AB7    mov         byte ptr [esi+3],0FF
 00470ABB    add         dword ptr [ebp-34],4
 00470ABF    inc         ebx
 00470AC0    dec         edi
>00470AC1    jne         00470940
 00470AC7    inc         dword ptr [ebp-0C]
 00470ACA    dec         dword ptr [ebp-38]
>00470ACD    jne         004708B4
 00470AD3    mov         eax,dword ptr [ebp-4]
 00470AD6    mov         ecx,dword ptr [eax+10]
 00470AD9    mov         eax,dword ptr [ebp-4]
 00470ADC    mov         edx,dword ptr [eax+4]
 00470ADF    mov         eax,dword ptr [ebp-30]
 00470AE2    call        Move
 00470AE7    xor         eax,eax
 00470AE9    pop         edx
 00470AEA    pop         ecx
 00470AEB    pop         ecx
 00470AEC    mov         dword ptr fs:[eax],edx
 00470AEF    push        470B04
 00470AF4    mov         eax,dword ptr [ebp-30]
 00470AF7    call        @FreeMem
 00470AFC    ret
>00470AFD    jmp         @HandleFinally
>00470B02    jmp         00470AF4
 00470B04    pop         edi
 00470B05    pop         esi
 00470B06    pop         ebx
 00470B07    mov         esp,ebp
 00470B09    pop         ebp
 00470B0A    ret         4
end;*}

end.