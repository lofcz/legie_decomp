//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLSkyBox;

interface

uses
  SysUtils, Classes, GLTexture;

type
  TGLSkyBoxStyle = (sbsFull, sbsTopHalf, sbsBottomHalf, sbTopTwoThirds, sbsTopHalfClamped);
  TGLSkyBox = class(TGLImmaterialSceneObject)
  public
    MatNameTop:String;//f98
    MatNameRight:String;//f9C
    MatNameFront:String;//fA0
    MatNameLeft:String;//fA4
    MatNameBack:String;//fA8
    MatNameBottom:String;//fAC
    MatNameClouds:String;//fB0
    MaterialLibrary:TGLMaterialLibrary;//fB4
    CloudsPlaneOffset:Single;//fB8
    CloudsPlaneSize:Single;//fBC
    Style:TGLSkyBoxStyle;//fC0
    destructor Destroy; virtual;//004A20EC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004A2114
    constructor Create(AOwner:TComponent); virtual;//v2C//004A2090
    //procedure v68(?:?; ?:?); virtual;//v68//004A2144
    //procedure SetCloudsPlaneOffset(Value:Single; ?:?);//004A2BE4
    //procedure SetCloudsPlaneSize(Value:Single; ?:?);//004A2C00
    procedure SetMaterialLibrary(Value:TGLMaterialLibrary);//004A2C1C
    procedure SetMatNameBack(Value:String);//004A2C34
    procedure SetMatNameBottom(Value:String);//004A2C58
    procedure SetMatNameClouds(Value:String);//004A2C7C
    procedure SetMatNameFront(Value:String);//004A2CA0
    procedure SetMatNameLeft(Value:String);//004A2CC4
    procedure SetMatNameRight(Value:String);//004A2CE8
    procedure SetMatNameTop(Value:String);//004A2D0C
  end;
    constructor Create(AOwner:TComponent);//004A2090
    destructor Destroy;//004A20EC
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004A2114
    //procedure sub_004A2144(?:?; ?:?);//004A2144

implementation

//004A2090
constructor TGLSkyBox.Create(AOwner:TComponent);
begin
{*
 004A2090    push        ebx
 004A2091    push        esi
 004A2092    test        dl,dl
>004A2094    je          004A209E
 004A2096    add         esp,0FFFFFFF0
 004A2099    call        @ClassCreate
 004A209E    mov         ebx,edx
 004A20A0    mov         esi,eax
 004A20A2    xor         edx,edx
 004A20A4    mov         eax,esi
 004A20A6    call        TGLCustomSceneObject.Create
 004A20AB    mov         al,byte ptr [esi+3C];TGLSkyBox.?f3C:byte
 004A20AE    or          al,byte ptr ds:[4A20E8];0x9 gvar_004A20E8
 004A20B4    mov         byte ptr [esi+3C],al;TGLSkyBox.?f3C:byte
 004A20B7    mov         dword ptr [esi+0B8],3E4CCCCD;TGLSkyBox.CloudsPlaneOffset:Single
 004A20C1    mov         dword ptr [esi+0BC],42000000;TGLSkyBox.CloudsPlaneSize:Single
 004A20CB    mov         eax,esi
 004A20CD    test        bl,bl
>004A20CF    je          004A20E0
 004A20D1    call        @AfterConstruction
 004A20D6    pop         dword ptr fs:[0]
 004A20DD    add         esp,0C
 004A20E0    mov         eax,esi
 004A20E2    pop         esi
 004A20E3    pop         ebx
 004A20E4    ret
*}
end;

//004A20EC
destructor TGLSkyBox.Destroy;
begin
{*
 004A20EC    push        ebx
 004A20ED    push        esi
 004A20EE    call        @BeforeDestruction
 004A20F3    mov         ebx,edx
 004A20F5    mov         esi,eax
 004A20F7    mov         edx,ebx
 004A20F9    and         dl,0FC
 004A20FC    mov         eax,esi
 004A20FE    call        TGLCustomSceneObject.Destroy
 004A2103    test        bl,bl
>004A2105    jle         004A210E
 004A2107    mov         eax,esi
 004A2109    call        @ClassDestroy
 004A210E    pop         esi
 004A210F    pop         ebx
 004A2110    ret
*}
end;

//004A2114
procedure TGLSkyBox.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004A2114    push        ebx
 004A2115    push        esi
 004A2116    push        edi
 004A2117    mov         ebx,ecx
 004A2119    mov         esi,edx
 004A211B    mov         edi,eax
 004A211D    cmp         bl,1
>004A2120    jne         004A2133
 004A2122    cmp         esi,dword ptr [edi+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
>004A2128    jne         004A2133
 004A212A    xor         edx,edx
 004A212C    mov         eax,edi
 004A212E    call        TGLSkyBox.SetMaterialLibrary
 004A2133    mov         ecx,ebx
 004A2135    mov         edx,esi
 004A2137    mov         eax,edi
 004A2139    call        TComponent.Notification
 004A213E    pop         edi
 004A213F    pop         esi
 004A2140    pop         ebx
 004A2141    ret
*}
end;

//004A2144
{*procedure sub_004A2144(?:?; ?:?);
begin
 004A2144    push        ebp
 004A2145    mov         ebp,esp
 004A2147    add         esp,0FFFFFF58
 004A214D    push        ebx
 004A214E    push        esi
 004A214F    mov         dword ptr [ebp-8],edx
 004A2152    mov         dword ptr [ebp-4],eax
 004A2155    mov         ebx,dword ptr ds:[5AE164];^gvar_005E1344
 004A215B    mov         eax,dword ptr [ebp-4]
 004A215E    cmp         dword ptr [eax+0B4],0;TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
>004A2165    je          004A2BD1
 004A216B    mov         eax,dword ptr [ebp-8]
 004A216E    mov         eax,dword ptr [eax+5C]
 004A2171    mov         edx,dword ptr [eax+8C]
 004A2177    mov         dword ptr [ebp-18],edx
 004A217A    mov         edx,dword ptr [ebp-8]
 004A217D    mov         dl,5
 004A217F    call        0046D634
 004A2184    mov         eax,dword ptr [ebp-8]
 004A2187    mov         eax,dword ptr [eax+5C]
 004A218A    mov         dl,8
 004A218C    call        0046D634
 004A2191    mov         eax,dword ptr [ebp-8]
 004A2194    mov         eax,dword ptr [eax+5C]
 004A2197    mov         dl,7
 004A2199    call        0046D634
 004A219E    push        0
 004A21A0    call        OpenGL32.glDepthMask
 004A21A5    mov         eax,dword ptr [ebp-4]
 004A21A8    mov         eax,dword ptr [eax+5C];TGLSkyBox.?f5C:TComponent
 004A21AB    mov         eax,dword ptr [eax+4C]
 004A21AE    add         eax,68
 004A21B1    push        eax
 004A21B2    call        OpenGL32.glLoadMatrixf
 004A21B7    lea         edx,[ebp-0A8]
 004A21BD    mov         eax,dword ptr [ebp-4]
 004A21C0    call        0047BDDC
 004A21C5    lea         edx,[ebp-0A8]
 004A21CB    lea         eax,[ebp-98]
 004A21D1    call        0045C9C0
 004A21D6    mov         eax,dword ptr [ebp-4]
 004A21D9    mov         eax,dword ptr [eax+4C];TGLSkyBox.?f4C:TGLCoordinates
 004A21DC    lea         edx,[eax+18];TGLCoordinates.X:Single
 004A21DF    lea         eax,[ebp-88]
 004A21E5    call        0045C9C0
 004A21EA    mov         eax,dword ptr [ebp-4]
 004A21ED    mov         eax,dword ptr [eax+48];TGLSkyBox.?f48:TGLCoordinates
 004A21F0    lea         edx,[eax+18];TGLCoordinates.X:Single
 004A21F3    lea         eax,[ebp-78]
 004A21F6    call        0045C9C0
 004A21FB    mov         edx,dword ptr [ebp-8]
 004A21FE    add         edx,8
 004A2201    lea         eax,[ebp-68]
 004A2204    call        0045C9C0
 004A2209    lea         eax,[ebp-98]
 004A220F    push        eax
 004A2210    call        OpenGL32.glMultMatrixf
 004A2215    mov         eax,dword ptr [ebp-4]
 004A2218    mov         eax,dword ptr [eax+5C];TGLSkyBox.?f5C:TComponent
 004A221B    mov         eax,dword ptr [eax+48]
 004A221E    fld         dword ptr [eax+98]
 004A2224    fadd        dword ptr [eax+94]
 004A222A    fmul        dword ptr ds:[4A2BDC];0.5:Single
 004A2230    fstp        dword ptr [ebp-0C]
 004A2233    wait
 004A2234    push        dword ptr [ebp-0C]
 004A2237    push        dword ptr [ebp-0C]
 004A223A    push        dword ptr [ebp-0C]
 004A223D    call        OpenGL32.glScalef
 004A2242    lea         eax,[ebp-58]
 004A2245    push        eax
 004A2246    push        0BA6
 004A224B    call        OpenGL32.glGetFloatv
 004A2250    lea         edx,[ebp-58]
 004A2253    mov         eax,dword ptr [ebp-4]
 004A2256    mov         eax,dword ptr [eax+5C];TGLSkyBox.?f5C:TComponent
 004A2259    mov         eax,dword ptr [eax+4C]
 004A225C    call        00481558
 004A2261    xor         eax,eax
 004A2263    push        ebp
 004A2264    push        4A2BCA
 004A2269    push        dword ptr fs:[eax]
 004A226C    mov         dword ptr fs:[eax],esp
 004A226F    call        OpenGL32.glPushMatrix
 004A2274    mov         eax,dword ptr [ebp-4]
 004A2277    mov         al,byte ptr [eax+0C0];TGLSkyBox.Style:TGLSkyBoxStyle
 004A227D    dec         al
>004A227F    je          004A228F
 004A2281    dec         al
>004A2283    je          004A22B3
 004A2285    dec         al
>004A2287    je          004A22D7
 004A2289    dec         al
>004A228B    je          004A228F
>004A228D    jmp         004A22F9
 004A228F    push        0
 004A2291    push        3F000000
 004A2296    push        0
 004A2298    call        OpenGL32.glTranslatef
 004A229D    push        3F800000
 004A22A2    push        3F000000
 004A22A7    push        3F800000
 004A22AC    call        OpenGL32.glScalef
>004A22B1    jmp         004A22F9
 004A22B3    push        0
 004A22B5    push        0BF000000
 004A22BA    push        0
 004A22BC    call        OpenGL32.glTranslatef
 004A22C1    push        3F800000
 004A22C6    push        3F000000
 004A22CB    push        3F800000
 004A22D0    call        OpenGL32.glScalef
>004A22D5    jmp         004A22F9
 004A22D7    push        0
 004A22D9    push        3EAAAAAB
 004A22DE    push        0
 004A22E0    call        OpenGL32.glTranslatef
 004A22E5    push        3F800000
 004A22EA    push        3F2AAAAB
 004A22EF    push        3F800000
 004A22F4    call        OpenGL32.glScalef
 004A22F9    mov         eax,dword ptr [ebp-4]
 004A22FC    mov         edx,dword ptr [eax+0A0];TGLSkyBox.MatNameFront:String
 004A2302    mov         eax,dword ptr [ebp-4]
 004A2305    mov         eax,dword ptr [eax+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A230B    call        00478428
 004A2310    mov         esi,eax
 004A2312    test        esi,esi
>004A2314    je          004A2462
 004A231A    mov         edx,dword ptr [ebp-8]
 004A231D    mov         eax,esi
 004A231F    call        00476C34
 004A2324    push        7
 004A2326    call        OpenGL32.glBegin
 004A232B    push        3F7F7CEE
 004A2330    push        3B03126F
 004A2335    mov         eax,dword ptr [ebx]
 004A2337    call        eax
 004A2339    push        0BF800000
 004A233E    push        3F800000
 004A2343    push        0BF800000
 004A2348    call        OpenGL32.glVertex3f
 004A234D    push        3B03126F
 004A2352    push        3B03126F
 004A2357    mov         eax,dword ptr [ebx]
 004A2359    call        eax
 004A235B    push        0BF800000
 004A2360    push        0BF800000
 004A2365    push        0BF800000
 004A236A    call        OpenGL32.glVertex3f
 004A236F    push        3B03126F
 004A2374    push        3F7F7CEE
 004A2379    mov         eax,dword ptr [ebx]
 004A237B    call        eax
 004A237D    push        0BF800000
 004A2382    push        0BF800000
 004A2387    push        3F800000
 004A238C    call        OpenGL32.glVertex3f
 004A2391    push        3F7F7CEE
 004A2396    push        3F7F7CEE
 004A239B    mov         eax,dword ptr [ebx]
 004A239D    call        eax
 004A239F    push        0BF800000
 004A23A4    push        3F800000
 004A23A9    push        3F800000
 004A23AE    call        OpenGL32.glVertex3f
 004A23B3    mov         eax,dword ptr [ebp-4]
 004A23B6    cmp         byte ptr [eax+0C0],4;TGLSkyBox.Style:TGLSkyBoxStyle
>004A23BD    jne         004A244B
 004A23C3    push        3B03126F
 004A23C8    push        3B03126F
 004A23CD    mov         eax,dword ptr [ebx]
 004A23CF    call        eax
 004A23D1    push        0BF800000
 004A23D6    push        0BF800000
 004A23DB    push        0BF800000
 004A23E0    call        OpenGL32.glVertex3f
 004A23E5    push        3B03126F
 004A23EA    push        3B03126F
 004A23EF    mov         eax,dword ptr [ebx]
 004A23F1    call        eax
 004A23F3    push        0BF800000
 004A23F8    push        0C0400000
 004A23FD    push        0BF800000
 004A2402    call        OpenGL32.glVertex3f
 004A2407    push        3B03126F
 004A240C    push        3F7F7CEE
 004A2411    mov         eax,dword ptr [ebx]
 004A2413    call        eax
 004A2415    push        0BF800000
 004A241A    push        0C0400000
 004A241F    push        3F800000
 004A2424    call        OpenGL32.glVertex3f
 004A2429    push        3B03126F
 004A242E    push        3F7F7CEE
 004A2433    mov         eax,dword ptr [ebx]
 004A2435    call        eax
 004A2437    push        0BF800000
 004A243C    push        0BF800000
 004A2441    push        3F800000
 004A2446    call        OpenGL32.glVertex3f
 004A244B    call        OpenGL32.glEnd
 004A2450    mov         edx,dword ptr [ebp-8]
 004A2453    mov         eax,esi
 004A2455    call        00476DB0
 004A245A    test        al,al
>004A245C    jne         004A2324
 004A2462    mov         eax,dword ptr [ebp-4]
 004A2465    mov         edx,dword ptr [eax+0A8];TGLSkyBox.MatNameBack:String
 004A246B    mov         eax,dword ptr [ebp-4]
 004A246E    mov         eax,dword ptr [eax+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A2474    call        00478428
 004A2479    mov         esi,eax
 004A247B    test        esi,esi
>004A247D    je          004A25CB
 004A2483    mov         edx,dword ptr [ebp-8]
 004A2486    mov         eax,esi
 004A2488    call        00476C34
 004A248D    push        7
 004A248F    call        OpenGL32.glBegin
 004A2494    push        3F7F7CEE
 004A2499    push        3B03126F
 004A249E    mov         eax,dword ptr [ebx]
 004A24A0    call        eax
 004A24A2    push        3F800000
 004A24A7    push        3F800000
 004A24AC    push        3F800000
 004A24B1    call        OpenGL32.glVertex3f
 004A24B6    push        3B03126F
 004A24BB    push        3B03126F
 004A24C0    mov         eax,dword ptr [ebx]
 004A24C2    call        eax
 004A24C4    push        3F800000
 004A24C9    push        0BF800000
 004A24CE    push        3F800000
 004A24D3    call        OpenGL32.glVertex3f
 004A24D8    push        3B03126F
 004A24DD    push        3F7F7CEE
 004A24E2    mov         eax,dword ptr [ebx]
 004A24E4    call        eax
 004A24E6    push        3F800000
 004A24EB    push        0BF800000
 004A24F0    push        0BF800000
 004A24F5    call        OpenGL32.glVertex3f
 004A24FA    push        3F7F7CEE
 004A24FF    push        3F7F7CEE
 004A2504    mov         eax,dword ptr [ebx]
 004A2506    call        eax
 004A2508    push        3F800000
 004A250D    push        3F800000
 004A2512    push        0BF800000
 004A2517    call        OpenGL32.glVertex3f
 004A251C    mov         eax,dword ptr [ebp-4]
 004A251F    cmp         byte ptr [eax+0C0],4;TGLSkyBox.Style:TGLSkyBoxStyle
>004A2526    jne         004A25B4
 004A252C    push        3B03126F
 004A2531    push        3B03126F
 004A2536    mov         eax,dword ptr [ebx]
 004A2538    call        eax
 004A253A    push        3F800000
 004A253F    push        0BF800000
 004A2544    push        3F800000
 004A2549    call        OpenGL32.glVertex3f
 004A254E    push        3B03126F
 004A2553    push        3B03126F
 004A2558    mov         eax,dword ptr [ebx]
 004A255A    call        eax
 004A255C    push        3F800000
 004A2561    push        0C0400000
 004A2566    push        3F800000
 004A256B    call        OpenGL32.glVertex3f
 004A2570    push        3B03126F
 004A2575    push        3F7F7CEE
 004A257A    mov         eax,dword ptr [ebx]
 004A257C    call        eax
 004A257E    push        3F800000
 004A2583    push        0C0400000
 004A2588    push        0BF800000
 004A258D    call        OpenGL32.glVertex3f
 004A2592    push        3B03126F
 004A2597    push        3F7F7CEE
 004A259C    mov         eax,dword ptr [ebx]
 004A259E    call        eax
 004A25A0    push        3F800000
 004A25A5    push        0BF800000
 004A25AA    push        0BF800000
 004A25AF    call        OpenGL32.glVertex3f
 004A25B4    call        OpenGL32.glEnd
 004A25B9    mov         edx,dword ptr [ebp-8]
 004A25BC    mov         eax,esi
 004A25BE    call        00476DB0
 004A25C3    test        al,al
>004A25C5    jne         004A248D
 004A25CB    mov         eax,dword ptr [ebp-4]
 004A25CE    mov         edx,dword ptr [eax+98];TGLSkyBox.MatNameTop:String
 004A25D4    mov         eax,dword ptr [ebp-4]
 004A25D7    mov         eax,dword ptr [eax+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A25DD    call        00478428
 004A25E2    mov         esi,eax
 004A25E4    test        esi,esi
>004A25E6    je          004A269C
 004A25EC    mov         edx,dword ptr [ebp-8]
 004A25EF    mov         eax,esi
 004A25F1    call        00476C34
 004A25F6    push        7
 004A25F8    call        OpenGL32.glBegin
 004A25FD    push        3F7F7CEE
 004A2602    push        3B03126F
 004A2607    mov         eax,dword ptr [ebx]
 004A2609    call        eax
 004A260B    push        3F800000
 004A2610    push        3F800000
 004A2615    push        0BF800000
 004A261A    call        OpenGL32.glVertex3f
 004A261F    push        3B03126F
 004A2624    push        3B03126F
 004A2629    mov         eax,dword ptr [ebx]
 004A262B    call        eax
 004A262D    push        0BF800000
 004A2632    push        3F800000
 004A2637    push        0BF800000
 004A263C    call        OpenGL32.glVertex3f
 004A2641    push        3B03126F
 004A2646    push        3F7F7CEE
 004A264B    mov         eax,dword ptr [ebx]
 004A264D    call        eax
 004A264F    push        0BF800000
 004A2654    push        3F800000
 004A2659    push        3F800000
 004A265E    call        OpenGL32.glVertex3f
 004A2663    push        3F7F7CEE
 004A2668    push        3F7F7CEE
 004A266D    mov         eax,dword ptr [ebx]
 004A266F    call        eax
 004A2671    push        3F800000
 004A2676    push        3F800000
 004A267B    push        3F800000
 004A2680    call        OpenGL32.glVertex3f
 004A2685    call        OpenGL32.glEnd
 004A268A    mov         edx,dword ptr [ebp-8]
 004A268D    mov         eax,esi
 004A268F    call        00476DB0
 004A2694    test        al,al
>004A2696    jne         004A25F6
 004A269C    mov         eax,dword ptr [ebp-4]
 004A269F    mov         edx,dword ptr [eax+0AC];TGLSkyBox.MatNameBottom:String
 004A26A5    mov         eax,dword ptr [ebp-4]
 004A26A8    mov         eax,dword ptr [eax+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A26AE    call        00478428
 004A26B3    mov         esi,eax
 004A26B5    test        esi,esi
>004A26B7    je          004A276D
 004A26BD    mov         edx,dword ptr [ebp-8]
 004A26C0    mov         eax,esi
 004A26C2    call        00476C34
 004A26C7    push        7
 004A26C9    call        OpenGL32.glBegin
 004A26CE    push        3F7F7CEE
 004A26D3    push        3B03126F
 004A26D8    mov         eax,dword ptr [ebx]
 004A26DA    call        eax
 004A26DC    push        0BF800000
 004A26E1    push        0BF800000
 004A26E6    push        0BF800000
 004A26EB    call        OpenGL32.glVertex3f
 004A26F0    push        3B03126F
 004A26F5    push        3B03126F
 004A26FA    mov         eax,dword ptr [ebx]
 004A26FC    call        eax
 004A26FE    push        3F800000
 004A2703    push        0BF800000
 004A2708    push        0BF800000
 004A270D    call        OpenGL32.glVertex3f
 004A2712    push        3B03126F
 004A2717    push        3F7F7CEE
 004A271C    mov         eax,dword ptr [ebx]
 004A271E    call        eax
 004A2720    push        3F800000
 004A2725    push        0BF800000
 004A272A    push        3F800000
 004A272F    call        OpenGL32.glVertex3f
 004A2734    push        3F7F7CEE
 004A2739    push        3F7F7CEE
 004A273E    mov         eax,dword ptr [ebx]
 004A2740    call        eax
 004A2742    push        0BF800000
 004A2747    push        0BF800000
 004A274C    push        3F800000
 004A2751    call        OpenGL32.glVertex3f
 004A2756    call        OpenGL32.glEnd
 004A275B    mov         edx,dword ptr [ebp-8]
 004A275E    mov         eax,esi
 004A2760    call        00476DB0
 004A2765    test        al,al
>004A2767    jne         004A26C7
 004A276D    mov         eax,dword ptr [ebp-4]
 004A2770    mov         edx,dword ptr [eax+0A4];TGLSkyBox.MatNameLeft:String
 004A2776    mov         eax,dword ptr [ebp-4]
 004A2779    mov         eax,dword ptr [eax+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A277F    call        00478428
 004A2784    mov         esi,eax
 004A2786    test        esi,esi
>004A2788    je          004A28D6
 004A278E    mov         edx,dword ptr [ebp-8]
 004A2791    mov         eax,esi
 004A2793    call        00476C34
 004A2798    push        7
 004A279A    call        OpenGL32.glBegin
 004A279F    push        3F7F7CEE
 004A27A4    push        3B03126F
 004A27A9    mov         eax,dword ptr [ebx]
 004A27AB    call        eax
 004A27AD    push        3F800000
 004A27B2    push        3F800000
 004A27B7    push        0BF800000
 004A27BC    call        OpenGL32.glVertex3f
 004A27C1    push        3B03126F
 004A27C6    push        3B03126F
 004A27CB    mov         eax,dword ptr [ebx]
 004A27CD    call        eax
 004A27CF    push        3F800000
 004A27D4    push        0BF800000
 004A27D9    push        0BF800000
 004A27DE    call        OpenGL32.glVertex3f
 004A27E3    push        3B03126F
 004A27E8    push        3F7F7CEE
 004A27ED    mov         eax,dword ptr [ebx]
 004A27EF    call        eax
 004A27F1    push        0BF800000
 004A27F6    push        0BF800000
 004A27FB    push        0BF800000
 004A2800    call        OpenGL32.glVertex3f
 004A2805    push        3F7F7CEE
 004A280A    push        3F7F7CEE
 004A280F    mov         eax,dword ptr [ebx]
 004A2811    call        eax
 004A2813    push        0BF800000
 004A2818    push        3F800000
 004A281D    push        0BF800000
 004A2822    call        OpenGL32.glVertex3f
 004A2827    mov         eax,dword ptr [ebp-4]
 004A282A    cmp         byte ptr [eax+0C0],4;TGLSkyBox.Style:TGLSkyBoxStyle
>004A2831    jne         004A28BF
 004A2837    push        3B03126F
 004A283C    push        3B03126F
 004A2841    mov         eax,dword ptr [ebx]
 004A2843    call        eax
 004A2845    push        3F800000
 004A284A    push        0BF800000
 004A284F    push        0BF800000
 004A2854    call        OpenGL32.glVertex3f
 004A2859    push        3B03126F
 004A285E    push        3B03126F
 004A2863    mov         eax,dword ptr [ebx]
 004A2865    call        eax
 004A2867    push        3F800000
 004A286C    push        0C0400000
 004A2871    push        0BF800000
 004A2876    call        OpenGL32.glVertex3f
 004A287B    push        3B03126F
 004A2880    push        3F7F7CEE
 004A2885    mov         eax,dword ptr [ebx]
 004A2887    call        eax
 004A2889    push        0BF800000
 004A288E    push        0C0400000
 004A2893    push        0BF800000
 004A2898    call        OpenGL32.glVertex3f
 004A289D    push        3B03126F
 004A28A2    push        3F7F7CEE
 004A28A7    mov         eax,dword ptr [ebx]
 004A28A9    call        eax
 004A28AB    push        0BF800000
 004A28B0    push        0BF800000
 004A28B5    push        0BF800000
 004A28BA    call        OpenGL32.glVertex3f
 004A28BF    call        OpenGL32.glEnd
 004A28C4    mov         edx,dword ptr [ebp-8]
 004A28C7    mov         eax,esi
 004A28C9    call        00476DB0
 004A28CE    test        al,al
>004A28D0    jne         004A2798
 004A28D6    mov         eax,dword ptr [ebp-4]
 004A28D9    mov         edx,dword ptr [eax+9C];TGLSkyBox.MatNameRight:String
 004A28DF    mov         eax,dword ptr [ebp-4]
 004A28E2    mov         eax,dword ptr [eax+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A28E8    call        00478428
 004A28ED    mov         esi,eax
 004A28EF    test        esi,esi
>004A28F1    je          004A2A3F
 004A28F7    mov         edx,dword ptr [ebp-8]
 004A28FA    mov         eax,esi
 004A28FC    call        00476C34
 004A2901    push        7
 004A2903    call        OpenGL32.glBegin
 004A2908    push        3F7F7CEE
 004A290D    push        3B03126F
 004A2912    mov         eax,dword ptr [ebx]
 004A2914    call        eax
 004A2916    push        0BF800000
 004A291B    push        3F800000
 004A2920    push        3F800000
 004A2925    call        OpenGL32.glVertex3f
 004A292A    push        3B03126F
 004A292F    push        3B03126F
 004A2934    mov         eax,dword ptr [ebx]
 004A2936    call        eax
 004A2938    push        0BF800000
 004A293D    push        0BF800000
 004A2942    push        3F800000
 004A2947    call        OpenGL32.glVertex3f
 004A294C    push        3B03126F
 004A2951    push        3F7F7CEE
 004A2956    mov         eax,dword ptr [ebx]
 004A2958    call        eax
 004A295A    push        3F800000
 004A295F    push        0BF800000
 004A2964    push        3F800000
 004A2969    call        OpenGL32.glVertex3f
 004A296E    push        3F7F7CEE
 004A2973    push        3F7F7CEE
 004A2978    mov         eax,dword ptr [ebx]
 004A297A    call        eax
 004A297C    push        3F800000
 004A2981    push        3F800000
 004A2986    push        3F800000
 004A298B    call        OpenGL32.glVertex3f
 004A2990    mov         eax,dword ptr [ebp-4]
 004A2993    cmp         byte ptr [eax+0C0],4;TGLSkyBox.Style:TGLSkyBoxStyle
>004A299A    jne         004A2A28
 004A29A0    push        3B03126F
 004A29A5    push        3B03126F
 004A29AA    mov         eax,dword ptr [ebx]
 004A29AC    call        eax
 004A29AE    push        0BF800000
 004A29B3    push        0BF800000
 004A29B8    push        3F800000
 004A29BD    call        OpenGL32.glVertex3f
 004A29C2    push        3B03126F
 004A29C7    push        3B03126F
 004A29CC    mov         eax,dword ptr [ebx]
 004A29CE    call        eax
 004A29D0    push        0BF800000
 004A29D5    push        0C0400000
 004A29DA    push        3F800000
 004A29DF    call        OpenGL32.glVertex3f
 004A29E4    push        3B03126F
 004A29E9    push        3F7F7CEE
 004A29EE    mov         eax,dword ptr [ebx]
 004A29F0    call        eax
 004A29F2    push        3F800000
 004A29F7    push        0C0400000
 004A29FC    push        3F800000
 004A2A01    call        OpenGL32.glVertex3f
 004A2A06    push        3B03126F
 004A2A0B    push        3F7F7CEE
 004A2A10    mov         eax,dword ptr [ebx]
 004A2A12    call        eax
 004A2A14    push        3F800000
 004A2A19    push        0BF800000
 004A2A1E    push        3F800000
 004A2A23    call        OpenGL32.glVertex3f
 004A2A28    call        OpenGL32.glEnd
 004A2A2D    mov         edx,dword ptr [ebp-8]
 004A2A30    mov         eax,esi
 004A2A32    call        00476DB0
 004A2A37    test        al,al
>004A2A39    jne         004A2901
 004A2A3F    mov         eax,dword ptr [ebp-4]
 004A2A42    mov         edx,dword ptr [eax+0B0];TGLSkyBox.MatNameClouds:String
 004A2A48    mov         eax,dword ptr [ebp-4]
 004A2A4B    mov         eax,dword ptr [eax+0B4];TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A2A51    call        00478428
 004A2A56    mov         esi,eax
 004A2A58    test        esi,esi
>004A2A5A    je          004A2B2F
 004A2A60    mov         eax,dword ptr [ebp-4]
 004A2A63    fld         dword ptr [eax+0BC];TGLSkyBox.CloudsPlaneSize:Single
 004A2A69    fmul        dword ptr ds:[4A2BDC];0.5:Single
 004A2A6F    fstp        dword ptr [ebp-10]
 004A2A72    wait
 004A2A73    mov         eax,dword ptr [ebp-4]
 004A2A76    mov         eax,dword ptr [eax+0B8];TGLSkyBox.CloudsPlaneOffset:Single
 004A2A7C    mov         dword ptr [ebp-14],eax
 004A2A7F    mov         edx,dword ptr [ebp-8]
 004A2A82    mov         eax,esi
 004A2A84    call        00476C34
 004A2A89    push        7
 004A2A8B    call        OpenGL32.glBegin
 004A2A90    push        3F800000
 004A2A95    push        0
 004A2A97    mov         eax,dword ptr [ebx]
 004A2A99    call        eax
 004A2A9B    push        dword ptr [ebp-10]
 004A2A9E    push        dword ptr [ebp-14]
 004A2AA1    fld         dword ptr [ebp-10]
 004A2AA4    fchs
 004A2AA6    add         esp,0FFFFFFFC
 004A2AA9    fstp        dword ptr [esp]
 004A2AAC    wait
 004A2AAD    call        OpenGL32.glVertex3f
 004A2AB2    push        0
 004A2AB4    push        0
 004A2AB6    mov         eax,dword ptr [ebx]
 004A2AB8    call        eax
 004A2ABA    fld         dword ptr [ebp-10]
 004A2ABD    fchs
 004A2ABF    add         esp,0FFFFFFFC
 004A2AC2    fstp        dword ptr [esp]
 004A2AC5    wait
 004A2AC6    push        dword ptr [ebp-14]
 004A2AC9    fld         dword ptr [ebp-10]
 004A2ACC    fchs
 004A2ACE    add         esp,0FFFFFFFC
 004A2AD1    fstp        dword ptr [esp]
 004A2AD4    wait
 004A2AD5    call        OpenGL32.glVertex3f
 004A2ADA    push        0
 004A2ADC    push        3F800000
 004A2AE1    mov         eax,dword ptr [ebx]
 004A2AE3    call        eax
 004A2AE5    fld         dword ptr [ebp-10]
 004A2AE8    fchs
 004A2AEA    add         esp,0FFFFFFFC
 004A2AED    fstp        dword ptr [esp]
 004A2AF0    wait
 004A2AF1    push        dword ptr [ebp-14]
 004A2AF4    push        dword ptr [ebp-10]
 004A2AF7    call        OpenGL32.glVertex3f
 004A2AFC    push        3F800000
 004A2B01    push        3F800000
 004A2B06    mov         eax,dword ptr [ebx]
 004A2B08    call        eax
 004A2B0A    push        dword ptr [ebp-10]
 004A2B0D    push        dword ptr [ebp-14]
 004A2B10    push        dword ptr [ebp-10]
 004A2B13    call        OpenGL32.glVertex3f
 004A2B18    call        OpenGL32.glEnd
 004A2B1D    mov         edx,dword ptr [ebp-8]
 004A2B20    mov         eax,esi
 004A2B22    call        00476DB0
 004A2B27    test        al,al
>004A2B29    jne         004A2A89
 004A2B2F    call        OpenGL32.glPopMatrix
 004A2B34    push        0FF
 004A2B36    call        OpenGL32.glDepthMask
 004A2B3B    test        byte ptr [ebp-17],1
>004A2B3F    je          004A2B4E
 004A2B41    mov         eax,dword ptr [ebp-8]
 004A2B44    mov         eax,dword ptr [eax+5C]
 004A2B47    mov         dl,8
 004A2B49    call        0046D5F8
 004A2B4E    test        byte ptr [ebp-18],80
>004A2B52    je          004A2B61
 004A2B54    mov         eax,dword ptr [ebp-8]
 004A2B57    mov         eax,dword ptr [eax+5C]
 004A2B5A    mov         dl,7
 004A2B5C    call        0046D5F8
 004A2B61    cmp         byte ptr [ebp+8],0
>004A2B65    je          004A2B9B
 004A2B67    fld         dword ptr ds:[4A2BE0];1:Single
 004A2B6D    fdiv        dword ptr [ebp-0C]
 004A2B70    fstp        dword ptr [ebp-0C]
 004A2B73    wait
 004A2B74    push        dword ptr [ebp-0C]
 004A2B77    push        dword ptr [ebp-0C]
 004A2B7A    push        dword ptr [ebp-0C]
 004A2B7D    call        OpenGL32.glScalef
 004A2B82    mov         eax,dword ptr [ebp-8]
 004A2B85    push        eax
 004A2B86    mov         eax,dword ptr [ebp-4]
 004A2B89    call        0047BA94
 004A2B8E    mov         ecx,eax
 004A2B90    dec         ecx
 004A2B91    xor         edx,edx
 004A2B93    mov         eax,dword ptr [ebp-4]
 004A2B96    mov         ebx,dword ptr [eax]
 004A2B98    call        dword ptr [ebx+6C];TGLSkyBox.sub_0047D7AC
 004A2B9B    test        byte ptr [ebp-18],20
>004A2B9F    je          004A2BAE
 004A2BA1    mov         eax,dword ptr [ebp-8]
 004A2BA4    mov         eax,dword ptr [eax+5C]
 004A2BA7    mov         dl,5
 004A2BA9    call        0046D5F8
 004A2BAE    xor         eax,eax
 004A2BB0    pop         edx
 004A2BB1    pop         ecx
 004A2BB2    pop         ecx
 004A2BB3    mov         dword ptr fs:[eax],edx
 004A2BB6    push        4A2BD1
 004A2BBB    mov         eax,dword ptr [ebp-4]
 004A2BBE    mov         eax,dword ptr [eax+5C];TGLSkyBox.?f5C:TComponent
 004A2BC1    mov         eax,dword ptr [eax+4C]
 004A2BC4    call        004815B4
 004A2BC9    ret
>004A2BCA    jmp         @HandleFinally
>004A2BCF    jmp         004A2BBB
 004A2BD1    pop         esi
 004A2BD2    pop         ebx
 004A2BD3    mov         esp,ebp
 004A2BD5    pop         ebp
 004A2BD6    ret         4
end;*}

//004A2BE4
{*procedure TGLSkyBox.SetCloudsPlaneOffset(Value:Single; ?:?);
begin
 004A2BE4    push        ebp
 004A2BE5    mov         ebp,esp
 004A2BE7    push        esi
 004A2BE8    mov         edx,dword ptr [ebp+8]
 004A2BEB    mov         dword ptr [eax+0B8],edx;TGLSkyBox.CloudsPlaneOffset:Single
 004A2BF1    mov         si,0FFE7
 004A2BF5    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2BFA    pop         esi
 004A2BFB    pop         ebp
 004A2BFC    ret         4
end;*}

//004A2C00
{*procedure TGLSkyBox.SetCloudsPlaneSize(Value:Single; ?:?);
begin
 004A2C00    push        ebp
 004A2C01    mov         ebp,esp
 004A2C03    push        esi
 004A2C04    mov         edx,dword ptr [ebp+8]
 004A2C07    mov         dword ptr [eax+0BC],edx;TGLSkyBox.CloudsPlaneSize:Single
 004A2C0D    mov         si,0FFE7
 004A2C11    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2C16    pop         esi
 004A2C17    pop         ebp
 004A2C18    ret         4
end;*}

//004A2C1C
procedure TGLSkyBox.SetMaterialLibrary(Value:TGLMaterialLibrary);
begin
{*
 004A2C1C    push        esi
 004A2C1D    mov         esi,eax
 004A2C1F    mov         dword ptr [esi+0B4],edx;TGLSkyBox.MaterialLibrary:TGLMaterialLibrary
 004A2C25    mov         eax,esi
 004A2C27    mov         si,0FFE7
 004A2C2B    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2C30    pop         esi
 004A2C31    ret
*}
end;

//004A2C34
procedure TGLSkyBox.SetMatNameBack(Value:String);
begin
{*
 004A2C34    push        ebx
 004A2C35    push        esi
 004A2C36    mov         esi,edx
 004A2C38    mov         ebx,eax
 004A2C3A    lea         eax,[ebx+0A8];TGLSkyBox.MatNameBack:String
 004A2C40    mov         edx,esi
 004A2C42    call        @LStrAsg
 004A2C47    mov         eax,ebx
 004A2C49    mov         si,0FFE7
 004A2C4D    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2C52    pop         esi
 004A2C53    pop         ebx
 004A2C54    ret
*}
end;

//004A2C58
procedure TGLSkyBox.SetMatNameBottom(Value:String);
begin
{*
 004A2C58    push        ebx
 004A2C59    push        esi
 004A2C5A    mov         esi,edx
 004A2C5C    mov         ebx,eax
 004A2C5E    lea         eax,[ebx+0AC];TGLSkyBox.MatNameBottom:String
 004A2C64    mov         edx,esi
 004A2C66    call        @LStrAsg
 004A2C6B    mov         eax,ebx
 004A2C6D    mov         si,0FFE7
 004A2C71    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2C76    pop         esi
 004A2C77    pop         ebx
 004A2C78    ret
*}
end;

//004A2C7C
procedure TGLSkyBox.SetMatNameClouds(Value:String);
begin
{*
 004A2C7C    push        ebx
 004A2C7D    push        esi
 004A2C7E    mov         esi,edx
 004A2C80    mov         ebx,eax
 004A2C82    lea         eax,[ebx+0B0];TGLSkyBox.MatNameClouds:String
 004A2C88    mov         edx,esi
 004A2C8A    call        @LStrAsg
 004A2C8F    mov         eax,ebx
 004A2C91    mov         si,0FFE7
 004A2C95    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2C9A    pop         esi
 004A2C9B    pop         ebx
 004A2C9C    ret
*}
end;

//004A2CA0
procedure TGLSkyBox.SetMatNameFront(Value:String);
begin
{*
 004A2CA0    push        ebx
 004A2CA1    push        esi
 004A2CA2    mov         esi,edx
 004A2CA4    mov         ebx,eax
 004A2CA6    lea         eax,[ebx+0A0];TGLSkyBox.MatNameFront:String
 004A2CAC    mov         edx,esi
 004A2CAE    call        @LStrAsg
 004A2CB3    mov         eax,ebx
 004A2CB5    mov         si,0FFE7
 004A2CB9    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2CBE    pop         esi
 004A2CBF    pop         ebx
 004A2CC0    ret
*}
end;

//004A2CC4
procedure TGLSkyBox.SetMatNameLeft(Value:String);
begin
{*
 004A2CC4    push        ebx
 004A2CC5    push        esi
 004A2CC6    mov         esi,edx
 004A2CC8    mov         ebx,eax
 004A2CCA    lea         eax,[ebx+0A4];TGLSkyBox.MatNameLeft:String
 004A2CD0    mov         edx,esi
 004A2CD2    call        @LStrAsg
 004A2CD7    mov         eax,ebx
 004A2CD9    mov         si,0FFE7
 004A2CDD    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2CE2    pop         esi
 004A2CE3    pop         ebx
 004A2CE4    ret
*}
end;

//004A2CE8
procedure TGLSkyBox.SetMatNameRight(Value:String);
begin
{*
 004A2CE8    push        ebx
 004A2CE9    push        esi
 004A2CEA    mov         esi,edx
 004A2CEC    mov         ebx,eax
 004A2CEE    lea         eax,[ebx+9C];TGLSkyBox.MatNameRight:String
 004A2CF4    mov         edx,esi
 004A2CF6    call        @LStrAsg
 004A2CFB    mov         eax,ebx
 004A2CFD    mov         si,0FFE7
 004A2D01    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2D06    pop         esi
 004A2D07    pop         ebx
 004A2D08    ret
*}
end;

//004A2D0C
procedure TGLSkyBox.SetMatNameTop(Value:String);
begin
{*
 004A2D0C    push        ebx
 004A2D0D    push        esi
 004A2D0E    mov         esi,edx
 004A2D10    mov         ebx,eax
 004A2D12    lea         eax,[ebx+98];TGLSkyBox.MatNameTop:String
 004A2D18    mov         edx,esi
 004A2D1A    call        @LStrAsg
 004A2D1F    mov         eax,ebx
 004A2D21    mov         si,0FFE7
 004A2D25    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A2D2A    pop         esi
 004A2D2B    pop         ebx
 004A2D2C    ret
*}
end;

Initialization
//004A2D60
{*
 004A2D60    sub         dword ptr ds:[5E15A4],1
>004A2D67    jae         004A2D73
 004A2D69    mov         eax,[004A1DB4];TGLSkyBox
 004A2D6E    call        RegisterClass
 004A2D73    ret
*}
Finalization
end.