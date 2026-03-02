//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit80;

interface

uses
  SysUtils, Classes, VectorLists;

type
  TGLSilhouette = class(TObject)
  public
    f4:TVectorList;//f4
    f8:TIntegerList;//f8
    fC:TIntegerList;//fC
    destructor Destroy; virtual;//0046EB68
    constructor Create; virtual;//v0//0046EB04
  end;
  TBaseConnectivity = class(TObject)
  public
    f4:byte;//f4
    //function v0:?; virtual;//v0//0046EBF4
    //function v4:?; virtual;//v4//0046EBF8
    procedure v8; virtual;//v8//0046EBEC
    constructor vC; virtual;//vC//0046EBC8
  end;
  TConnectivity = class(TBaseConnectivity)
  public
    f8:TIntegerList;//f8
    fC:TIntegerList;//fC
    f10:TByteList;//f10
    f14:TIntegerList;//f14
    f18:TAffineVectorList;//f18
    f1C:TIntegerList;//f1C
    f20:TAffineVectorList;//f20
    destructor Destroy; virtual;//0046ECA0
    procedure v0; virtual;//v0//0046EFBC
    //function v4:?; virtual;//v4//0046EFCC
    //procedure v8(?:?; ?:?; ?:?); virtual;//v8//0046ED4C
    constructor Create; virtual;//vC//0046EBFC
    procedure v10; virtual;//v10//0046ED08
  end;
    constructor Create;//0046EB04
    destructor Destroy;//0046EB68
    //procedure sub_0046EBA8(?:?);//0046EBA8
    constructor sub_0046EBC8;//0046EBC8
    procedure sub_0046EBEC;//0046EBEC
    //function sub_0046EBF4:?;//0046EBF4
    //function sub_0046EBF8:?;//0046EBF8
    constructor Create;//0046EBFC
    destructor Destroy;//0046ECA0
    procedure sub_0046ED08;//0046ED08
    //procedure sub_0046ED4C(?:?; ?:?; ?:?);//0046ED4C
    procedure sub_0046EFBC;//0046EFBC
    //function sub_0046EFCC:?;//0046EFCC
    //function sub_0046EFD4(?:TConnectivity; ?:?; ?:?; ?:?):?;//0046EFD4
    //procedure sub_0046F054(?:?; ?:?; ?:?; ?:?);//0046F054
    //function sub_0046F0EC(?:?; ?:Integer; ?:?; ?:?):?;//0046F0EC
    //function sub_0046F190(?:TConnectivity; ?:?; ?:?; ?:?; ?:?):?;//0046F190

implementation

//0046EB04
constructor TGLSilhouette.Create;
begin
{*
 0046EB04    push        ebx
 0046EB05    push        esi
 0046EB06    test        dl,dl
>0046EB08    je          0046EB12
 0046EB0A    add         esp,0FFFFFFF0
 0046EB0D    call        @ClassCreate
 0046EB12    mov         ebx,edx
 0046EB14    mov         esi,eax
 0046EB16    xor         edx,edx
 0046EB18    mov         eax,esi
 0046EB1A    call        TObject.Create
 0046EB1F    mov         dl,1
 0046EB21    mov         eax,[00467AC4];TVectorList
 0046EB26    call        TVectorList.Create;TVectorList.Create
 0046EB2B    mov         dword ptr [esi+4],eax;TGLSilhouette.?f4:TVectorList
 0046EB2E    mov         dl,1
 0046EB30    mov         eax,[00467C18];TIntegerList
 0046EB35    call        TIntegerList.Create;TIntegerList.Create
 0046EB3A    mov         dword ptr [esi+8],eax;TGLSilhouette.?f8:TIntegerList
 0046EB3D    mov         dl,1
 0046EB3F    mov         eax,[00467C18];TIntegerList
 0046EB44    call        TIntegerList.Create;TIntegerList.Create
 0046EB49    mov         dword ptr [esi+0C],eax;TGLSilhouette.?fC:TIntegerList
 0046EB4C    mov         eax,esi
 0046EB4E    test        bl,bl
>0046EB50    je          0046EB61
 0046EB52    call        @AfterConstruction
 0046EB57    pop         dword ptr fs:[0]
 0046EB5E    add         esp,0C
 0046EB61    mov         eax,esi
 0046EB63    pop         esi
 0046EB64    pop         ebx
 0046EB65    ret
*}
end;

//0046EB68
destructor TGLSilhouette.Destroy;
begin
{*
 0046EB68    push        ebx
 0046EB69    push        esi
 0046EB6A    call        @BeforeDestruction
 0046EB6F    mov         ebx,edx
 0046EB71    mov         esi,eax
 0046EB73    mov         eax,dword ptr [esi+0C]
 0046EB76    call        TObject.Free
 0046EB7B    mov         eax,dword ptr [esi+8]
 0046EB7E    call        TObject.Free
 0046EB83    mov         eax,dword ptr [esi+4]
 0046EB86    call        TObject.Free
 0046EB8B    mov         edx,ebx
 0046EB8D    and         dl,0FC
 0046EB90    mov         eax,esi
 0046EB92    call        TObject.Destroy
 0046EB97    test        bl,bl
>0046EB99    jle         0046EBA2
 0046EB9B    mov         eax,esi
 0046EB9D    call        @ClassDestroy
 0046EBA2    pop         esi
 0046EBA3    pop         ebx
 0046EBA4    ret
*}
end;

//0046EBA8
{*procedure sub_0046EBA8(?:?);
begin
 0046EBA8    push        ebx
 0046EBA9    mov         ebx,eax
 0046EBAB    mov         eax,dword ptr [ebx+4]
 0046EBAE    call        00468274
 0046EBB3    mov         eax,dword ptr [ebx+8]
 0046EBB6    call        00468274
 0046EBBB    mov         eax,dword ptr [ebx+0C]
 0046EBBE    call        00468274
 0046EBC3    pop         ebx
 0046EBC4    ret
end;*}

//0046EBC8
constructor sub_0046EBC8;
begin
{*
 0046EBC8    test        dl,dl
>0046EBCA    je          0046EBD4
 0046EBCC    add         esp,0FFFFFFF0
 0046EBCF    call        @ClassCreate
 0046EBD4    mov         byte ptr [eax+4],cl;TBaseConnectivity.?f4:byte
 0046EBD7    test        dl,dl
>0046EBD9    je          0046EBEA
 0046EBDB    call        @AfterConstruction
 0046EBE0    pop         dword ptr fs:[0]
 0046EBE7    add         esp,0C
 0046EBEA    ret
*}
end;

//0046EBEC
procedure sub_0046EBEC;
begin
{*
 0046EBEC    push        ebp
 0046EBED    mov         ebp,esp
 0046EBEF    pop         ebp
 0046EBF0    ret         4
*}
end;

//0046EBF4
{*function sub_0046EBF4:?;
begin
 0046EBF4    xor         eax,eax
 0046EBF6    ret
end;*}

//0046EBF8
{*function sub_0046EBF8:?;
begin
 0046EBF8    xor         eax,eax
 0046EBFA    ret
end;*}

//0046EBFC
constructor TConnectivity.Create;
begin
{*
 0046EBFC    push        ebp
 0046EBFD    mov         ebp,esp
 0046EBFF    push        ecx
 0046EC00    push        ebx
 0046EC01    push        esi
 0046EC02    test        dl,dl
>0046EC04    je          0046EC0E
 0046EC06    add         esp,0FFFFFFF0
 0046EC09    call        @ClassCreate
 0046EC0E    mov         ebx,ecx
 0046EC10    mov         byte ptr [ebp-1],dl
 0046EC13    mov         esi,eax
 0046EC15    mov         dl,1
 0046EC17    mov         eax,[00467D64];TByteList
 0046EC1C    call        TByteList.Create;TByteList.Create
 0046EC21    mov         dword ptr [esi+10],eax;TConnectivity.?f10:TByteList
 0046EC24    mov         dl,1
 0046EC26    mov         eax,[00467C18];TIntegerList
 0046EC2B    call        TIntegerList.Create;TIntegerList.Create
 0046EC30    mov         dword ptr [esi+14],eax;TConnectivity.?f14:TIntegerList
 0046EC33    mov         dl,1
 0046EC35    mov         eax,[00467A00];TAffineVectorList
 0046EC3A    call        TAffineVectorList.Create;TAffineVectorList.Create
 0046EC3F    mov         dword ptr [esi+18],eax;TConnectivity.?f18:TAffineVectorList
 0046EC42    mov         dl,1
 0046EC44    mov         eax,[00467C18];TIntegerList
 0046EC49    call        TIntegerList.Create;TIntegerList.Create
 0046EC4E    mov         dword ptr [esi+8],eax;TConnectivity.?f8:TIntegerList
 0046EC51    mov         dl,1
 0046EC53    mov         eax,[00467C18];TIntegerList
 0046EC58    call        TIntegerList.Create;TIntegerList.Create
 0046EC5D    mov         dword ptr [esi+0C],eax;TConnectivity.?fC:TIntegerList
 0046EC60    mov         byte ptr [esi+4],bl;TConnectivity.?f4:byte
 0046EC63    mov         dl,1
 0046EC65    mov         eax,[00467C18];TIntegerList
 0046EC6A    call        TIntegerList.Create;TIntegerList.Create
 0046EC6F    mov         dword ptr [esi+1C],eax;TConnectivity.?f1C:TIntegerList
 0046EC72    mov         dl,1
 0046EC74    mov         eax,[00467A00];TAffineVectorList
 0046EC79    call        TAffineVectorList.Create;TAffineVectorList.Create
 0046EC7E    mov         dword ptr [esi+20],eax;TConnectivity.?f20:TAffineVectorList
 0046EC81    mov         eax,esi
 0046EC83    cmp         byte ptr [ebp-1],0
>0046EC87    je          0046EC98
 0046EC89    call        @AfterConstruction
 0046EC8E    pop         dword ptr fs:[0]
 0046EC95    add         esp,0C
 0046EC98    mov         eax,esi
 0046EC9A    pop         esi
 0046EC9B    pop         ebx
 0046EC9C    pop         ecx
 0046EC9D    pop         ebp
 0046EC9E    ret
*}
end;

//0046ECA0
destructor TConnectivity.Destroy;
begin
{*
 0046ECA0    push        ebx
 0046ECA1    push        esi
 0046ECA2    call        @BeforeDestruction
 0046ECA7    mov         ebx,edx
 0046ECA9    mov         esi,eax
 0046ECAB    mov         eax,esi
 0046ECAD    mov         edx,dword ptr [eax]
 0046ECAF    call        dword ptr [edx+10];TConnectivity.sub_0046ED08
 0046ECB2    mov         eax,dword ptr [esi+10];TConnectivity.?f10:TByteList
 0046ECB5    call        TObject.Free
 0046ECBA    mov         eax,dword ptr [esi+14];TConnectivity.?f14:TIntegerList
 0046ECBD    call        TObject.Free
 0046ECC2    mov         eax,dword ptr [esi+18];TConnectivity.?f18:TAffineVectorList
 0046ECC5    call        TObject.Free
 0046ECCA    mov         eax,dword ptr [esi+8];TConnectivity.?f8:TIntegerList
 0046ECCD    call        TObject.Free
 0046ECD2    mov         eax,dword ptr [esi+0C];TConnectivity.?fC:TIntegerList
 0046ECD5    call        TObject.Free
 0046ECDA    mov         eax,dword ptr [esi+1C];TConnectivity.?f1C:TIntegerList
 0046ECDD    call        TObject.Free
 0046ECE2    mov         eax,dword ptr [esi+20];TConnectivity.?f20:TAffineVectorList
 0046ECE5    test        eax,eax
>0046ECE7    je          0046ECEE
 0046ECE9    call        TObject.Free
 0046ECEE    mov         edx,ebx
 0046ECF0    and         dl,0FC
 0046ECF3    mov         eax,esi
 0046ECF5    call        TObject.Destroy
 0046ECFA    test        bl,bl
>0046ECFC    jle         0046ED05
 0046ECFE    mov         eax,esi
 0046ED00    call        @ClassDestroy
 0046ED05    pop         esi
 0046ED06    pop         ebx
 0046ED07    ret
*}
end;

//0046ED08
procedure sub_0046ED08;
begin
{*
 0046ED08    push        ebx
 0046ED09    mov         ebx,eax
 0046ED0B    mov         eax,dword ptr [ebx+8];TConnectivity.?f8:TIntegerList
 0046ED0E    call        00468280
 0046ED13    mov         eax,dword ptr [ebx+0C];TConnectivity.?fC:TIntegerList
 0046ED16    call        00468280
 0046ED1B    mov         eax,dword ptr [ebx+10];TConnectivity.?f10:TByteList
 0046ED1E    call        00468280
 0046ED23    mov         eax,dword ptr [ebx+14];TConnectivity.?f14:TIntegerList
 0046ED26    call        00468280
 0046ED2B    mov         eax,dword ptr [ebx+18];TConnectivity.?f18:TAffineVectorList
 0046ED2E    call        00468280
 0046ED33    mov         eax,dword ptr [ebx+1C];TConnectivity.?f1C:TIntegerList
 0046ED36    call        00468280
 0046ED3B    mov         eax,dword ptr [ebx+20];TConnectivity.?f20:TAffineVectorList
 0046ED3E    test        eax,eax
>0046ED40    je          0046ED47
 0046ED42    call        00468280
 0046ED47    pop         ebx
 0046ED48    ret
*}
end;

//0046ED4C
{*procedure sub_0046ED4C(?:?; ?:?; ?:?);
begin
 0046ED4C    push        ebp
 0046ED4D    mov         ebp,esp
 0046ED4F    add         esp,0FFFFFFD4
 0046ED52    push        ebx
 0046ED53    push        esi
 0046ED54    push        edi
 0046ED55    mov         dword ptr [ebp-8],ecx
 0046ED58    mov         dword ptr [ebp-4],edx
 0046ED5B    mov         ebx,eax
 0046ED5D    mov         eax,dword ptr [ebp-8]
 0046ED60    cmp         dword ptr [eax],0
>0046ED63    jne         0046ED78
 0046ED65    mov         dl,1
 0046ED67    mov         eax,[0046E9C4];TGLSilhouette
 0046ED6C    call        TGLSilhouette.Create;TGLSilhouette.Create
 0046ED71    mov         edx,dword ptr [ebp-8]
 0046ED74    mov         dword ptr [edx],eax
>0046ED76    jmp         0046ED88
 0046ED78    cmp         byte ptr [ebp+8],0
>0046ED7C    jne         0046ED88
 0046ED7E    mov         eax,dword ptr [ebp-8]
 0046ED81    mov         eax,dword ptr [eax]
 0046ED83    call        0046EBA8
 0046ED88    mov         eax,dword ptr [ebx+1C];TConnectivity.?f1C:TIntegerList
 0046ED8B    call        00468274
 0046ED90    mov         eax,dword ptr [ebx+14];TConnectivity.?f14:TIntegerList
 0046ED93    mov         esi,dword ptr [eax+24];TIntegerList.?f24:dword
 0046ED96    mov         eax,ebx
 0046ED98    mov         edx,dword ptr [eax]
 0046ED9A    call        dword ptr [edx+4];TConnectivity.sub_0046EFCC
 0046ED9D    dec         eax
 0046ED9E    test        eax,eax
>0046EDA0    jl          0046EEB5
 0046EDA6    inc         eax
 0046EDA7    mov         dword ptr [ebp-20],eax
 0046EDAA    xor         edi,edi
 0046EDAC    cmp         byte ptr [ebx+4],0;TConnectivity.?f4:byte
>0046EDB0    je          0046EDE3
 0046EDB2    lea         eax,[edi+edi*2]
 0046EDB5    mov         edx,dword ptr [ebx+18];TConnectivity.?f18:TAffineVectorList
 0046EDB8    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 0046EDBB    lea         ecx,[edx+eax*4]
 0046EDBE    mov         eax,dword ptr [esi]
 0046EDC0    lea         eax,[eax+eax*2]
 0046EDC3    mov         edx,dword ptr [ebx+20];TConnectivity.?f20:TAffineVectorList
 0046EDC6    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 0046EDC9    lea         edx,[edx+eax*4]
 0046EDCC    mov         eax,dword ptr [ebp-4]
 0046EDCF    call        0045CE68
 0046EDD4    fcomp       dword ptr ds:[46EFB8];0:Single
 0046EDDA    fnstsw      al
 0046EDDC    sahf
 0046EDDD    setae       byte ptr [ebp-15]
>0046EDE1    jmp         0046EE40
 0046EDE3    mov         eax,dword ptr [ebx+20];TConnectivity.?f20:TAffineVectorList
 0046EDE6    mov         eax,dword ptr [eax+24];TAffineVectorList.?f24:dword
 0046EDE9    mov         dword ptr [ebp-1C],eax
 0046EDEC    lea         eax,[ebp-2C]
 0046EDEF    push        eax
 0046EDF0    mov         eax,dword ptr [esi+8]
 0046EDF3    lea         eax,[eax+eax*2]
 0046EDF6    mov         edx,dword ptr [ebp-1C]
 0046EDF9    lea         ecx,[edx+eax*4]
 0046EDFC    mov         eax,dword ptr [esi+4]
 0046EDFF    lea         eax,[eax+eax*2]
 0046EE02    mov         edx,dword ptr [ebp-1C]
 0046EE05    lea         eax,[edx+eax*4]
 0046EE08    push        eax
 0046EE09    mov         eax,dword ptr [esi]
 0046EE0B    lea         eax,[eax+eax*2]
 0046EE0E    mov         edx,dword ptr [ebp-1C]
 0046EE11    lea         eax,[edx+eax*4]
 0046EE14    pop         edx
 0046EE15    call        0045EC8C
 0046EE1A    mov         eax,dword ptr [esi]
 0046EE1C    lea         eax,[eax+eax*2]
 0046EE1F    mov         edx,dword ptr [ebx+20];TConnectivity.?f20:TAffineVectorList
 0046EE22    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 0046EE25    lea         edx,[edx+eax*4]
 0046EE28    lea         ecx,[ebp-2C]
 0046EE2B    mov         eax,dword ptr [ebp-4]
 0046EE2E    call        0045CE68
 0046EE33    fcomp       dword ptr ds:[46EFB8];0:Single
 0046EE39    fnstsw      al
 0046EE3B    sahf
 0046EE3C    setae       byte ptr [ebp-15]
 0046EE40    mov         cl,byte ptr [ebp-15]
 0046EE43    mov         edx,edi
 0046EE45    mov         eax,dword ptr [ebx+10];TConnectivity.?f10:TByteList
 0046EE48    call        00469454
 0046EE4D    cmp         byte ptr [ebp-15],0
>0046EE51    jne         0046EEA6
 0046EE53    mov         eax,dword ptr [ebp-4]
 0046EE56    cmp         byte ptr [eax+19],0
>0046EE5A    je          0046EEA6
 0046EE5C    mov         eax,dword ptr [esi+8]
 0046EE5F    push        eax
 0046EE60    mov         ecx,dword ptr [ebp-8]
 0046EE63    mov         ecx,dword ptr [ecx]
 0046EE65    mov         edx,dword ptr [ebp-4]
 0046EE68    mov         eax,ebx
 0046EE6A    call        0046EFD4
 0046EE6F    push        eax
 0046EE70    mov         eax,dword ptr [esi+4]
 0046EE73    push        eax
 0046EE74    mov         ecx,dword ptr [ebp-8]
 0046EE77    mov         ecx,dword ptr [ecx]
 0046EE79    mov         edx,dword ptr [ebp-4]
 0046EE7C    mov         eax,ebx
 0046EE7E    call        0046EFD4
 0046EE83    push        eax
 0046EE84    mov         eax,dword ptr [esi]
 0046EE86    push        eax
 0046EE87    mov         ecx,dword ptr [ebp-8]
 0046EE8A    mov         ecx,dword ptr [ecx]
 0046EE8C    mov         edx,dword ptr [ebp-4]
 0046EE8F    mov         eax,ebx
 0046EE91    call        0046EFD4
 0046EE96    mov         edx,eax
 0046EE98    mov         eax,dword ptr [ebp-8]
 0046EE9B    mov         eax,dword ptr [eax]
 0046EE9D    mov         eax,dword ptr [eax+0C]
 0046EEA0    pop         ecx
 0046EEA1    call        00469218
 0046EEA6    lea         eax,[esi+0C]
 0046EEA9    mov         esi,eax
 0046EEAB    inc         edi
 0046EEAC    dec         dword ptr [ebp-20]
>0046EEAF    jne         0046EDAC
 0046EEB5    mov         eax,ebx
 0046EEB7    mov         edx,dword ptr [eax]
 0046EEB9    call        dword ptr [edx];TConnectivity.sub_0046EFBC
 0046EEBB    dec         eax
 0046EEBC    test        eax,eax
>0046EEBE    jl          0046EFAF
 0046EEC4    inc         eax
 0046EEC5    mov         dword ptr [ebp-20],eax
 0046EEC8    xor         edi,edi
 0046EECA    mov         esi,edi
 0046EECC    add         esi,esi
 0046EECE    mov         edx,esi
 0046EED0    mov         eax,dword ptr [ebx+0C];TConnectivity.?fC:TIntegerList
 0046EED3    call        00469260
 0046EED8    mov         dword ptr [ebp-10],eax
 0046EEDB    mov         edx,esi
 0046EEDD    inc         edx
 0046EEDE    mov         eax,dword ptr [ebx+0C];TConnectivity.?fC:TIntegerList
 0046EEE1    call        00469260
 0046EEE6    mov         dword ptr [ebp-14],eax
 0046EEE9    cmp         dword ptr [ebp-14],0FFFFFFFF
>0046EEED    je          0046EF0D
 0046EEEF    mov         eax,dword ptr [ebx+10];TConnectivity.?f10:TByteList
 0046EEF2    mov         eax,dword ptr [eax+24];TByteList.?f24:dword
 0046EEF5    mov         edx,dword ptr [ebp-10]
 0046EEF8    mov         al,byte ptr [eax+edx]
 0046EEFB    mov         edx,dword ptr [ebx+10];TConnectivity.?f10:TByteList
 0046EEFE    mov         edx,dword ptr [edx+24];TByteList.?f24:dword
 0046EF01    mov         ecx,dword ptr [ebp-14]
 0046EF04    cmp         al,byte ptr [edx+ecx]
>0046EF07    je          0046EFA5
 0046EF0D    mov         eax,edi
 0046EF0F    add         eax,eax
 0046EF11    mov         edx,dword ptr [ebx+8];TConnectivity.?f8:TIntegerList
 0046EF14    mov         edx,dword ptr [edx+24];TIntegerList.?f24:dword
 0046EF17    lea         esi,[edx+eax*4]
 0046EF1A    mov         eax,dword ptr [ebx+10];TConnectivity.?f10:TByteList
 0046EF1D    mov         eax,dword ptr [eax+24];TByteList.?f24:dword
 0046EF20    mov         edx,dword ptr [ebp-10]
 0046EF23    cmp         byte ptr [eax+edx],0
>0046EF27    jne         0046EF66
 0046EF29    mov         eax,dword ptr [esi]
 0046EF2B    push        eax
 0046EF2C    mov         ecx,dword ptr [ebp-8]
 0046EF2F    mov         ecx,dword ptr [ecx]
 0046EF31    mov         edx,dword ptr [ebp-4]
 0046EF34    mov         eax,ebx
 0046EF36    call        0046EFD4
 0046EF3B    mov         dword ptr [ebp-0C],eax
 0046EF3E    mov         eax,dword ptr [esi+4]
 0046EF41    push        eax
 0046EF42    mov         ecx,dword ptr [ebp-8]
 0046EF45    mov         ecx,dword ptr [ecx]
 0046EF47    mov         edx,dword ptr [ebp-4]
 0046EF4A    mov         eax,ebx
 0046EF4C    call        0046EFD4
 0046EF51    mov         edx,dword ptr [ebp-8]
 0046EF54    mov         edx,dword ptr [edx]
 0046EF56    mov         edx,dword ptr [edx+8]
 0046EF59    mov         ecx,eax
 0046EF5B    mov         eax,dword ptr [ebp-0C]
 0046EF5E    xchg        eax,edx
 0046EF5F    call        004691E0
>0046EF64    jmp         0046EFA5
 0046EF66    cmp         dword ptr [ebp-14],0FFFFFFFF
>0046EF6A    jle         0046EFA5
 0046EF6C    mov         eax,dword ptr [esi]
 0046EF6E    push        eax
 0046EF6F    mov         ecx,dword ptr [ebp-8]
 0046EF72    mov         ecx,dword ptr [ecx]
 0046EF74    mov         edx,dword ptr [ebp-4]
 0046EF77    mov         eax,ebx
 0046EF79    call        0046EFD4
 0046EF7E    mov         dword ptr [ebp-0C],eax
 0046EF81    mov         eax,dword ptr [esi+4]
 0046EF84    push        eax
 0046EF85    mov         ecx,dword ptr [ebp-8]
 0046EF88    mov         ecx,dword ptr [ecx]
 0046EF8A    mov         edx,dword ptr [ebp-4]
 0046EF8D    mov         eax,ebx
 0046EF8F    call        0046EFD4
 0046EF94    mov         edx,dword ptr [ebp-8]
 0046EF97    mov         edx,dword ptr [edx]
 0046EF99    mov         edx,dword ptr [edx+8]
 0046EF9C    mov         ecx,dword ptr [ebp-0C]
 0046EF9F    xchg        eax,edx
 0046EFA0    call        004691E0
 0046EFA5    inc         edi
 0046EFA6    dec         dword ptr [ebp-20]
>0046EFA9    jne         0046EECA
 0046EFAF    pop         edi
 0046EFB0    pop         esi
 0046EFB1    pop         ebx
 0046EFB2    mov         esp,ebp
 0046EFB4    pop         ebp
 0046EFB5    ret         4
end;*}

//0046EFBC
procedure sub_0046EFBC;
begin
{*
 0046EFBC    mov         eax,dword ptr [eax+8];TConnectivity.?f8:TIntegerList
 0046EFBF    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 0046EFC2    sar         eax,1
>0046EFC4    jns         0046EFC9
 0046EFC6    adc         eax,0
 0046EFC9    ret
*}
end;

//0046EFCC
{*function sub_0046EFCC:?;
begin
 0046EFCC    mov         eax,dword ptr [eax+10];TConnectivity.?f10:TByteList
 0046EFCF    mov         eax,dword ptr [eax+8];TByteList.?f8:dword
 0046EFD2    ret
end;*}

//0046EFD4
{*function sub_0046EFD4(?:TConnectivity; ?:?; ?:?; ?:?):?;
begin
 0046EFD4    push        ebp
 0046EFD5    mov         ebp,esp
 0046EFD7    add         esp,0FFFFFFF8
 0046EFDA    push        ebx
 0046EFDB    push        esi
 0046EFDC    push        edi
 0046EFDD    mov         dword ptr [ebp-4],ecx
 0046EFE0    mov         ebx,eax
 0046EFE2    mov         esi,dword ptr [ebp+8]
 0046EFE5    mov         edx,dword ptr [ebx+1C];TConnectivity.?f1C:TIntegerList
 0046EFE8    mov         eax,dword ptr [edx+8];TIntegerList.?f8:dword
 0046EFEB    cmp         esi,eax
>0046EFED    jl          0046F01C
 0046EFEF    mov         edi,eax
 0046EFF1    lea         eax,[esi+1]
 0046EFF4    xchg        eax,edx
 0046EFF5    call        00468118
 0046EFFA    mov         eax,dword ptr [ebx+1C];TConnectivity.?f1C:TIntegerList
 0046EFFD    mov         edx,dword ptr [eax+24];TIntegerList.?f24:dword
 0046F000    mov         dword ptr [ebp-8],edx
 0046F003    mov         edx,edi
 0046F005    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 0046F008    dec         eax
 0046F009    sub         eax,edx
>0046F00B    jl          0046F01C
 0046F00D    inc         eax
 0046F00E    mov         ecx,dword ptr [ebp-8]
 0046F011    mov         dword ptr [ecx+edx*4],0FFFFFFFF
 0046F018    inc         edx
 0046F019    dec         eax
>0046F01A    jne         0046F00E
 0046F01C    mov         eax,dword ptr [ebx+1C];TConnectivity.?f1C:TIntegerList
 0046F01F    mov         eax,dword ptr [eax+24];TIntegerList.?f24:dword
 0046F022    lea         edi,[eax+esi*4]
 0046F025    mov         eax,dword ptr [edi]
 0046F027    cmp         eax,0FFFFFFFF
>0046F02A    jne         0046F04A
 0046F02C    push        3F800000
 0046F031    lea         eax,[esi+esi*2]
 0046F034    mov         edx,dword ptr [ebx+20];TConnectivity.?f20:TAffineVectorList
 0046F037    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 0046F03A    lea         edx,[edx+eax*4]
 0046F03D    mov         eax,dword ptr [ebp-4]
 0046F040    mov         eax,dword ptr [eax+4]
 0046F043    call        00468EF0
 0046F048    mov         dword ptr [edi],eax
 0046F04A    pop         edi
 0046F04B    pop         esi
 0046F04C    pop         ebx
 0046F04D    pop         ecx
 0046F04E    pop         ecx
 0046F04F    pop         ebp
 0046F050    ret         4
end;*}

//0046F054
{*procedure sub_0046F054(?:?; ?:?; ?:?; ?:?);
begin
 0046F054    push        ebp
 0046F055    mov         ebp,esp
 0046F057    add         esp,0FFFFFFF8
 0046F05A    push        ebx
 0046F05B    push        esi
 0046F05C    push        edi
 0046F05D    mov         edi,ecx
 0046F05F    mov         esi,edx
 0046F061    mov         dword ptr [ebp-4],eax
 0046F064    mov         eax,dword ptr [ebp-4]
 0046F067    mov         eax,dword ptr [eax+8]
 0046F06A    mov         ebx,dword ptr [eax+24]
 0046F06D    mov         eax,dword ptr [ebp-4]
 0046F070    mov         edx,dword ptr [eax]
 0046F072    call        dword ptr [edx]
 0046F074    dec         eax
 0046F075    test        eax,eax
>0046F077    jl          0046F0B8
 0046F079    inc         eax
 0046F07A    mov         dword ptr [ebp-8],0
 0046F081    cmp         esi,dword ptr [ebx]
>0046F083    jne         0046F08A
 0046F085    cmp         edi,dword ptr [ebx+4]
>0046F088    je          0046F093
 0046F08A    cmp         edi,dword ptr [ebx]
>0046F08C    jne         0046F0AD
 0046F08E    cmp         esi,dword ptr [ebx+4]
>0046F091    jne         0046F0AD
 0046F093    mov         ebx,dword ptr [ebp-8]
 0046F096    add         ebx,ebx
 0046F098    inc         ebx
 0046F099    mov         edx,ebx
 0046F09B    mov         eax,dword ptr [ebp-4]
 0046F09E    mov         eax,dword ptr [eax+0C]
 0046F0A1    mov         ecx,dword ptr [ebp+8]
 0046F0A4    call        00469268
 0046F0A9    mov         eax,ebx
>0046F0AB    jmp         0046F0E0
 0046F0AD    lea         edx,[ebx+8]
 0046F0B0    mov         ebx,edx
 0046F0B2    inc         dword ptr [ebp-8]
 0046F0B5    dec         eax
>0046F0B6    jne         0046F081
 0046F0B8    mov         eax,dword ptr [ebp-4]
 0046F0BB    mov         eax,dword ptr [eax+8]
 0046F0BE    mov         ecx,edi
 0046F0C0    mov         edx,esi
 0046F0C2    call        004691E0
 0046F0C7    mov         eax,dword ptr [ebp-4]
 0046F0CA    mov         eax,dword ptr [eax+0C]
 0046F0CD    or          ecx,0FFFFFFFF
 0046F0D0    mov         edx,dword ptr [ebp+8]
 0046F0D3    call        004691E0
 0046F0D8    mov         eax,dword ptr [ebp-4]
 0046F0DB    mov         edx,dword ptr [eax]
 0046F0DD    call        dword ptr [edx]
 0046F0DF    dec         eax
 0046F0E0    pop         edi
 0046F0E1    pop         esi
 0046F0E2    pop         ebx
 0046F0E3    pop         ecx
 0046F0E4    pop         ecx
 0046F0E5    pop         ebp
 0046F0E6    ret         4
end;*}

//0046F0EC
{*function sub_0046F0EC(?:?; ?:Integer; ?:?; ?:?):?;
begin
 0046F0EC    push        ebp
 0046F0ED    mov         ebp,esp
 0046F0EF    add         esp,0FFFFFFF0
 0046F0F2    push        ebx
 0046F0F3    push        esi
 0046F0F4    push        edi
 0046F0F5    mov         dword ptr [ebp-4],ecx
 0046F0F8    mov         edi,edx
 0046F0FA    mov         ebx,eax
 0046F0FC    mov         eax,dword ptr [ebp+8]
 0046F0FF    push        eax
 0046F100    mov         ecx,dword ptr [ebp-4]
 0046F103    mov         edx,edi
 0046F105    mov         eax,dword ptr [ebx+14]
 0046F108    call        00469218
 0046F10D    cmp         byte ptr [ebx+4],0
>0046F111    je          0046F151
 0046F113    lea         eax,[ebp-10]
 0046F116    push        eax
 0046F117    mov         eax,dword ptr [ebp+8]
 0046F11A    lea         eax,[eax+eax*2]
 0046F11D    mov         edx,dword ptr [ebx+20]
 0046F120    mov         edx,dword ptr [edx+24]
 0046F123    lea         ecx,[edx+eax*4]
 0046F126    mov         eax,dword ptr [ebp-4]
 0046F129    lea         eax,[eax+eax*2]
 0046F12C    mov         edx,dword ptr [ebx+20]
 0046F12F    mov         edx,dword ptr [edx+24]
 0046F132    lea         edx,[edx+eax*4]
 0046F135    lea         eax,[edi+edi*2]
 0046F138    mov         esi,dword ptr [ebx+20]
 0046F13B    mov         esi,dword ptr [esi+24]
 0046F13E    lea         eax,[esi+eax*4]
 0046F141    call        0045EC8C
 0046F146    lea         edx,[ebp-10]
 0046F149    mov         eax,dword ptr [ebx+18]
 0046F14C    call        00468A90
 0046F151    xor         edx,edx
 0046F153    mov         eax,dword ptr [ebx+10]
 0046F156    call        00469428
 0046F15B    mov         esi,eax
 0046F15D    push        esi
 0046F15E    mov         ecx,dword ptr [ebp-4]
 0046F161    mov         edx,edi
 0046F163    mov         eax,ebx
 0046F165    call        0046F054
 0046F16A    push        esi
 0046F16B    mov         ecx,dword ptr [ebp+8]
 0046F16E    mov         edx,dword ptr [ebp-4]
 0046F171    mov         eax,ebx
 0046F173    call        0046F054
 0046F178    push        esi
 0046F179    mov         ecx,edi
 0046F17B    mov         edx,dword ptr [ebp+8]
 0046F17E    mov         eax,ebx
 0046F180    call        0046F054
 0046F185    mov         eax,esi
 0046F187    pop         edi
 0046F188    pop         esi
 0046F189    pop         ebx
 0046F18A    mov         esp,ebp
 0046F18C    pop         ebp
 0046F18D    ret         4
end;*}

//0046F190
{*function sub_0046F190(?:TConnectivity; ?:?; ?:?; ?:?; ?:?):?;
begin
 0046F190    push        ebp
 0046F191    mov         ebp,esp
 0046F193    add         esp,0FFFFFFF4
 0046F196    push        ebx
 0046F197    push        esi
 0046F198    push        edi
 0046F199    mov         edi,ecx
 0046F19B    mov         ebx,eax
 0046F19D    mov         eax,dword ptr [ebx+20]
 0046F1A0    call        00468C7C
 0046F1A5    mov         esi,eax
 0046F1A7    mov         edx,edi
 0046F1A9    mov         eax,dword ptr [ebx+20]
 0046F1AC    call        00468C7C
 0046F1B1    mov         dword ptr [ebp-8],eax
 0046F1B4    mov         edx,dword ptr [ebp+0C]
 0046F1B7    mov         eax,dword ptr [ebx+20]
 0046F1BA    call        00468C7C
 0046F1BF    mov         edi,eax
 0046F1C1    mov         edx,dword ptr [ebp+8]
 0046F1C4    mov         eax,dword ptr [ebx+20]
 0046F1C7    call        00468C7C
 0046F1CC    mov         dword ptr [ebp-0C],eax
 0046F1CF    push        edi
 0046F1D0    mov         ecx,dword ptr [ebp-8]
 0046F1D3    mov         edx,esi
 0046F1D5    mov         eax,ebx
 0046F1D7    call        0046F0EC
 0046F1DC    mov         dword ptr [ebp-4],eax
 0046F1DF    push        esi
 0046F1E0    mov         ecx,dword ptr [ebp-0C]
 0046F1E3    mov         edx,edi
 0046F1E5    mov         eax,ebx
 0046F1E7    call        0046F0EC
 0046F1EC    mov         eax,dword ptr [ebp-4]
 0046F1EF    pop         edi
 0046F1F0    pop         esi
 0046F1F1    pop         ebx
 0046F1F2    mov         esp,ebp
 0046F1F4    pop         ebp
 0046F1F5    ret         8
end;*}

end.