//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLVfsPAK;

interface

uses
  SysUtils, Classes, ;

type
  .2 = array of ?;
//elSize = C;
  TGLVfsPAK = class(TComponent)
  public
    f30:TStringList;//f30
    f40:.2;//f40
    f48:TObjectList;//f48
    f50:TObjectList;//f50
    f54:String;//f54
    f58:byte;//f58
    f59:byte;//f59
    destructor Destroy; virtual;//004A3158
    constructor Create(AOwner:TComponent); virtual;//v2C//004A30CC
  end;
    constructor Create(AOwner:TComponent);//004A30CC
    destructor Destroy;//004A3158
    //function sub_004A31C8(?:?):?;//004A31C8
    //procedure sub_004A31D8(?:?);//004A31D8
    //procedure sub_004A3268(?:TGLVfsPAK; ?:AnsiString; ?:?);//004A3268
    //function sub_004A35A8(?:?; ?:?):?;//004A35A8
    //function sub_004A3614(?:?; ?:?):?;//004A3614
    //function sub_004A3668(?:TGLVfsPAK; ?:AnsiString):?;//004A3668

implementation

//004A30CC
constructor TGLVfsPAK.Create(AOwner:TComponent);
begin
{*
 004A30CC    push        ebx
 004A30CD    push        esi
 004A30CE    test        dl,dl
>004A30D0    je          004A30DA
 004A30D2    add         esp,0FFFFFFF0
 004A30D5    call        @ClassCreate
 004A30DA    mov         ebx,edx
 004A30DC    mov         esi,eax
 004A30DE    xor         edx,edx
 004A30E0    mov         eax,esi
 004A30E2    call        TComponent.Create
 004A30E7    mov         dl,1
 004A30E9    mov         eax,[00418350];TStringList
 004A30EE    call        TObject.Create;TStringList.Create
 004A30F3    mov         dword ptr [esi+30],eax;TGLVfsPAK.?f30:TStringList
 004A30F6    mov         cl,1
 004A30F8    mov         dl,1
 004A30FA    mov         eax,[0042D340];TObjectList
 004A30FF    call        TObjectList.Create;TObjectList.Create
 004A3104    mov         dword ptr [esi+48],eax;TGLVfsPAK.?f48:TObjectList
 004A3107    mov         cl,1
 004A3109    mov         dl,1
 004A310B    mov         eax,[0042D340];TObjectList
 004A3110    call        TObjectList.Create;TObjectList.Create
 004A3115    mov         dword ptr [esi+50],eax;TGLVfsPAK.?f50:TObjectList
 004A3118    mov         dword ptr ds:[5E15A8],esi;gvar_005E15A8:TGLVfsPAK
 004A311E    mov         eax,[005AE650];^gvar_005AD088
 004A3123    mov         dword ptr [eax],4A2EF4
 004A3129    mov         eax,[005AE1F0];^gvar_005AD08C
 004A312E    mov         dword ptr [eax],4A3038
 004A3134    mov         byte ptr [esi+58],3;TGLVfsPAK.?f58:byte
 004A3138    mov         byte ptr [esi+59],0;TGLVfsPAK.?f59:byte
 004A313C    mov         eax,esi
 004A313E    test        bl,bl
>004A3140    je          004A3151
 004A3142    call        @AfterConstruction
 004A3147    pop         dword ptr fs:[0]
 004A314E    add         esp,0C
 004A3151    mov         eax,esi
 004A3153    pop         esi
 004A3154    pop         ebx
 004A3155    ret
*}
end;

//004A3158
destructor TGLVfsPAK.Destroy;
begin
{*
 004A3158    push        ebx
 004A3159    push        esi
 004A315A    call        @BeforeDestruction
 004A315F    mov         ebx,edx
 004A3161    mov         esi,eax
 004A3163    mov         eax,[005AE650];^gvar_005AD088
 004A3168    xor         edx,edx
 004A316A    mov         dword ptr [eax],edx
 004A316C    mov         eax,[005AE1F0];^gvar_005AD08C
 004A3171    xor         edx,edx
 004A3173    mov         dword ptr [eax],edx
 004A3175    push        0
 004A3177    lea         eax,[esi+40];TGLVfsPAK.?f40:.2
 004A317A    mov         ecx,1
 004A317F    mov         edx,dword ptr ds:[4A2D74];.2
 004A3185    call        @DynArraySetLength
 004A318A    add         esp,4
 004A318D    mov         eax,dword ptr [esi+30];TGLVfsPAK.?f30:TStringList
 004A3190    call        TObject.Free
 004A3195    mov         eax,dword ptr [esi+48];TGLVfsPAK.?f48:TObjectList
 004A3198    call        TObject.Free
 004A319D    mov         eax,dword ptr [esi+50];TGLVfsPAK.?f50:TObjectList
 004A31A0    call        TObject.Free
 004A31A5    xor         eax,eax
 004A31A7    mov         [005E15A8],eax;gvar_005E15A8:TGLVfsPAK
 004A31AC    mov         edx,ebx
 004A31AE    and         dl,0FC
 004A31B1    mov         eax,esi
 004A31B3    call        TComponent.Destroy
 004A31B8    test        bl,bl
>004A31BA    jle         004A31C3
 004A31BC    mov         eax,esi
 004A31BE    call        @ClassDestroy
 004A31C3    pop         esi
 004A31C4    pop         ebx
 004A31C5    ret
*}
end;

//004A31C8
{*function sub_004A31C8(?:?):?;
begin
 004A31C8    mov         eax,dword ptr [eax+3C]
 004A31CB    test        eax,eax
>004A31CD    jns         004A31D2
 004A31CF    add         eax,7F
 004A31D2    sar         eax,7
 004A31D5    ret
end;*}

//004A31D8
{*procedure sub_004A31D8(?:?);
begin
 004A31D8    push        ebp
 004A31D9    mov         ebp,esp
 004A31DB    push        0
 004A31DD    push        ebx
 004A31DE    push        esi
 004A31DF    mov         ebx,eax
 004A31E1    xor         eax,eax
 004A31E3    push        ebp
 004A31E4    push        4A325B
 004A31E9    push        dword ptr fs:[eax]
 004A31EC    mov         dword ptr fs:[eax],esp
 004A31EF    xor         ecx,ecx
 004A31F1    mov         edx,dword ptr [ebx+38]
 004A31F4    mov         eax,dword ptr [ebx+44]
 004A31F7    mov         esi,dword ptr [eax]
 004A31F9    call        dword ptr [esi+14]
 004A31FC    mov         eax,dword ptr [ebx+4C]
 004A31FF    mov         edx,dword ptr [eax]
 004A3201    call        dword ptr [edx+44]
 004A3204    mov         eax,ebx
 004A3206    call        004A31C8
 004A320B    mov         esi,eax
 004A320D    dec         esi
 004A320E    test        esi,esi
>004A3210    jl          004A3245
 004A3212    inc         esi
 004A3213    mov         edx,5E15B0;gvar_005E15B0:void 
 004A3218    mov         ecx,80
 004A321D    mov         eax,dword ptr [ebx+44]
 004A3220    call        TStream.ReadBuffer
 004A3225    lea         eax,[ebp-4]
 004A3228    mov         edx,5E15B0;gvar_005E15B0:void 
 004A322D    mov         ecx,78
 004A3232    call        @LStrFromArray
 004A3237    mov         edx,dword ptr [ebp-4]
 004A323A    mov         eax,dword ptr [ebx+4C]
 004A323D    mov         ecx,dword ptr [eax]
 004A323F    call        dword ptr [ecx+38]
 004A3242    dec         esi
>004A3243    jne         004A3213
 004A3245    xor         eax,eax
 004A3247    pop         edx
 004A3248    pop         ecx
 004A3249    pop         ecx
 004A324A    mov         dword ptr fs:[eax],edx
 004A324D    push        4A3262
 004A3252    lea         eax,[ebp-4]
 004A3255    call        @LStrClr
 004A325A    ret
>004A325B    jmp         @HandleFinally
>004A3260    jmp         004A3252
 004A3262    pop         esi
 004A3263    pop         ebx
 004A3264    pop         ecx
 004A3265    pop         ebp
 004A3266    ret
end;*}

//004A3268
{*procedure sub_004A3268(?:TGLVfsPAK; ?:AnsiString; ?:?);
begin
 004A3268    push        ebp
 004A3269    mov         ebp,esp
 004A326B    push        0
 004A326D    push        0
 004A326F    push        0
 004A3271    push        0
 004A3273    push        0
 004A3275    push        0
 004A3277    push        0
 004A3279    push        0
 004A327B    push        ebx
 004A327C    push        esi
 004A327D    push        edi
 004A327E    mov         edi,ecx
 004A3280    mov         dword ptr [ebp-4],edx
 004A3283    mov         ebx,eax
 004A3285    mov         eax,dword ptr [ebp-4]
 004A3288    call        @LStrAddRef
 004A328D    xor         eax,eax
 004A328F    push        ebp
 004A3290    push        4A34E4
 004A3295    push        dword ptr fs:[eax]
 004A3298    mov         dword ptr fs:[eax],esp
 004A329B    lea         eax,[ebx+54]
 004A329E    mov         edx,dword ptr [ebp-4]
 004A32A1    call        @LStrAsg
 004A32A6    mov         dl,1
 004A32A8    mov         eax,[00418350];TStringList
 004A32AD    call        TObject.Create;TStringList.Create
 004A32B2    mov         esi,eax
 004A32B4    mov         dword ptr [ebx+30],esi
 004A32B7    mov         edx,dword ptr [ebp-4]
 004A32BA    mov         eax,esi
 004A32BC    mov         ecx,dword ptr [eax]
 004A32BE    call        dword ptr [ecx+38];TStringList.Add
 004A32C1    mov         dl,1
 004A32C3    mov         eax,[00418350];TStringList
 004A32C8    call        TObject.Create;TStringList.Create
 004A32CD    mov         dword ptr [ebx+4C],eax
 004A32D0    push        edi
 004A32D1    mov         ecx,dword ptr [ebp-4]
 004A32D4    mov         dl,1
 004A32D6    mov         eax,[00418550];TFileStream
 004A32DB    call        TFileStream.Create;TFileStream.Create
 004A32E0    mov         esi,eax
 004A32E2    mov         dword ptr [ebx+44],esi
 004A32E5    mov         eax,esi
 004A32E7    mov         edx,dword ptr [eax]
 004A32E9    call        dword ptr [edx];TStream.GetSize
 004A32EB    cmp         edx,0
>004A32EE    jne         004A338D
 004A32F4    cmp         eax,0
>004A32F7    jne         004A338D
 004A32FD    cmp         byte ptr [ebx+59],0
>004A3301    je          004A330D
 004A3303    mov         eax,[004A34F4];0x5A434150 gvar_004A34F4
 004A3308    mov         dword ptr [ebx+34],eax
>004A330B    jmp         004A3315
 004A330D    mov         eax,[004A34F8];0x4B434150 gvar_004A34F8
 004A3312    mov         dword ptr [ebx+34],eax
 004A3315    mov         dword ptr [ebx+38],0C
 004A331C    xor         eax,eax
 004A331E    mov         dword ptr [ebx+3C],eax
 004A3321    lea         eax,[ebp-8]
 004A3324    lea         edx,[ebx+34]
 004A3327    mov         ecx,4
 004A332C    call        @LStrFromArray
 004A3331    mov         eax,dword ptr [ebp-8]
 004A3334    mov         edx,4A3504;'PACZ'
 004A3339    call        @LStrCmp
>004A333E    jne         004A3371
 004A3340    mov         eax,dword ptr [ebx+44]
 004A3343    call        TObject.Free
 004A3348    lea         eax,[ebp-0C]
 004A334B    mov         ecx,4A3514;' - This is a compressed PAK file. This version of software does not support ...
 004A3350    mov         edx,dword ptr [ebp-4]
 004A3353    call        @LStrCat3
 004A3358    mov         ecx,dword ptr [ebp-0C]
 004A335B    mov         dl,1
 004A335D    mov         eax,[00408B30];Exception
 004A3362    call        Exception.Create;Exception.Create
 004A3367    call        @RaiseExcept
>004A336C    jmp         004A34C9
 004A3371    lea         edx,[ebx+34]
 004A3374    mov         ecx,0C
 004A3379    mov         eax,dword ptr [ebx+44]
 004A337C    call        TStream.WriteBuffer
 004A3381    push        0
 004A3383    push        0
 004A3385    mov         eax,dword ptr [ebx+44]
 004A3388    call        TStream.SetPosition
 004A338D    lea         edx,[ebx+34]
 004A3390    mov         ecx,0C
 004A3395    mov         eax,dword ptr [ebx+44]
 004A3398    call        TStream.ReadBuffer
 004A339D    lea         eax,[ebp-10]
 004A33A0    lea         edx,[ebx+34]
 004A33A3    mov         ecx,4
 004A33A8    call        @LStrFromArray
 004A33AD    mov         eax,dword ptr [ebp-10]
 004A33B0    mov         edx,4A3580;'PACK'
 004A33B5    call        @LStrCmp
>004A33BA    je          004A340C
 004A33BC    lea         eax,[ebp-14]
 004A33BF    lea         edx,[ebx+34]
 004A33C2    mov         ecx,4
 004A33C7    call        @LStrFromArray
 004A33CC    mov         eax,dword ptr [ebp-14]
 004A33CF    mov         edx,4A3504;'PACZ'
 004A33D4    call        @LStrCmp
>004A33D9    je          004A340C
 004A33DB    mov         eax,dword ptr [ebx+44]
 004A33DE    call        TObject.Free
 004A33E3    lea         eax,[ebp-18]
 004A33E6    mov         ecx,4A3590;' - This is not PAK file'
 004A33EB    mov         edx,dword ptr [ebp-4]
 004A33EE    call        @LStrCat3
 004A33F3    mov         ecx,dword ptr [ebp-18]
 004A33F6    mov         dl,1
 004A33F8    mov         eax,[00408B30];Exception
 004A33FD    call        Exception.Create;Exception.Create
 004A3402    call        @RaiseExcept
>004A3407    jmp         004A34C9
 004A340C    lea         eax,[ebp-1C]
 004A340F    lea         edx,[ebx+34]
 004A3412    mov         ecx,4
 004A3417    call        @LStrFromArray
 004A341C    mov         eax,dword ptr [ebp-1C]
 004A341F    mov         edx,4A3504;'PACZ'
 004A3424    call        @LStrCmp
 004A3429    sete        al
 004A342C    mov         byte ptr [ebx+59],al
 004A342F    cmp         byte ptr [ebx+59],0
>004A3433    je          004A3463
 004A3435    mov         eax,dword ptr [ebx+44]
 004A3438    call        TObject.Free
 004A343D    lea         eax,[ebp-20]
 004A3440    mov         ecx,4A3514;' - This is a compressed PAK file. This version of software does not support ...
 004A3445    mov         edx,dword ptr [ebp-4]
 004A3448    call        @LStrCat3
 004A344D    mov         ecx,dword ptr [ebp-20]
 004A3450    mov         dl,1
 004A3452    mov         eax,[00408B30];Exception
 004A3457    call        Exception.Create;Exception.Create
 004A345C    call        @RaiseExcept
>004A3461    jmp         004A34C9
 004A3463    mov         eax,ebx
 004A3465    call        004A31C8
 004A346A    test        eax,eax
>004A346C    je          004A3475
 004A346E    mov         eax,ebx
 004A3470    call        004A31D8
 004A3475    mov         eax,dword ptr [ebx+40]
 004A3478    call        @DynArrayLength
 004A347D    mov         esi,eax
 004A347F    lea         eax,[esi+1]
 004A3482    push        eax
 004A3483    lea         eax,[ebx+40]
 004A3486    mov         ecx,1
 004A348B    mov         edx,dword ptr ds:[4A2D74];.2
 004A3491    call        @DynArraySetLength
 004A3496    add         esp,4
 004A3499    lea         eax,[esi+esi*2]
 004A349C    mov         edx,dword ptr [ebx+40]
 004A349F    mov         ecx,dword ptr [ebx+34]
 004A34A2    mov         dword ptr [edx+eax*4],ecx
 004A34A5    mov         ecx,dword ptr [ebx+38]
 004A34A8    mov         dword ptr [edx+eax*4+4],ecx
 004A34AC    mov         ecx,dword ptr [ebx+3C]
 004A34AF    mov         dword ptr [edx+eax*4+8],ecx
 004A34B3    mov         edx,dword ptr [ebx+4C]
 004A34B6    mov         eax,dword ptr [ebx+50]
 004A34B9    call        0042D470
 004A34BE    mov         edx,dword ptr [ebx+44]
 004A34C1    mov         eax,dword ptr [ebx+48]
 004A34C4    call        0042D470
 004A34C9    xor         eax,eax
 004A34CB    pop         edx
 004A34CC    pop         ecx
 004A34CD    pop         ecx
 004A34CE    mov         dword ptr fs:[eax],edx
 004A34D1    push        4A34EB
 004A34D6    lea         eax,[ebp-20]
 004A34D9    mov         edx,8
 004A34DE    call        @LStrArrayClr
 004A34E3    ret
>004A34E4    jmp         @HandleFinally
>004A34E9    jmp         004A34D6
 004A34EB    pop         edi
 004A34EC    pop         esi
 004A34ED    pop         ebx
 004A34EE    mov         esp,ebp
 004A34F0    pop         ebp
 004A34F1    ret
end;*}

//004A35A8
{*function sub_004A35A8(?:?; ?:?):?;
begin
 004A35A8    push        ebx
 004A35A9    push        esi
 004A35AA    mov         ebx,eax
 004A35AC    mov         eax,edx
 004A35AE    shl         eax,7
 004A35B1    add         eax,dword ptr [ebx+38]
 004A35B4    mov         edx,eax
 004A35B6    xor         ecx,ecx
 004A35B8    mov         eax,dword ptr [ebx+44]
 004A35BB    mov         esi,dword ptr [eax]
 004A35BD    call        dword ptr [esi+14]
 004A35C0    mov         edx,5E15B0;gvar_005E15B0:void 
 004A35C5    mov         ecx,80
 004A35CA    mov         eax,dword ptr [ebx+44]
 004A35CD    mov         esi,dword ptr [eax]
 004A35CF    call        dword ptr [esi+0C]
 004A35D2    xor         ecx,ecx
 004A35D4    mov         edx,dword ptr ds:[5E1628];gvar_005E1628
 004A35DA    mov         eax,dword ptr [ebx+44]
 004A35DD    mov         esi,dword ptr [eax]
 004A35DF    call        dword ptr [esi+14]
 004A35E2    mov         dl,1
 004A35E4    mov         eax,[00418640];TMemoryStream
 004A35E9    call        TObject.Create;TMemoryStream.Create
 004A35EE    mov         esi,eax
 004A35F0    mov         eax,[005E162C];gvar_005E162C
 004A35F5    cdq
 004A35F6    push        edx
 004A35F7    push        eax
 004A35F8    mov         edx,dword ptr [ebx+44]
 004A35FB    mov         eax,esi
 004A35FD    call        TStream.CopyFrom
 004A3602    push        0
 004A3604    push        0
 004A3606    mov         eax,esi
 004A3608    call        TStream.SetPosition
 004A360D    mov         eax,esi
 004A360F    pop         esi
 004A3610    pop         ebx
 004A3611    ret
end;*}

//004A3614
{*function sub_004A3614(?:?; ?:?):?;
begin
 004A3614    push        ebp
 004A3615    mov         ebp,esp
 004A3617    push        ecx
 004A3618    push        ebx
 004A3619    mov         dword ptr [ebp-4],edx
 004A361C    mov         ebx,eax
 004A361E    mov         eax,dword ptr [ebp-4]
 004A3621    call        @LStrAddRef
 004A3626    xor         eax,eax
 004A3628    push        ebp
 004A3629    push        4A365B
 004A362E    push        dword ptr fs:[eax]
 004A3631    mov         dword ptr fs:[eax],esp
 004A3634    mov         edx,dword ptr [ebp-4]
 004A3637    mov         eax,dword ptr [ebx+4C]
 004A363A    mov         ecx,dword ptr [eax]
 004A363C    call        dword ptr [ecx+54]
 004A363F    inc         eax
 004A3640    setg        al
 004A3643    mov         ebx,eax
 004A3645    xor         eax,eax
 004A3647    pop         edx
 004A3648    pop         ecx
 004A3649    pop         ecx
 004A364A    mov         dword ptr fs:[eax],edx
 004A364D    push        4A3662
 004A3652    lea         eax,[ebp-4]
 004A3655    call        @LStrClr
 004A365A    ret
>004A365B    jmp         @HandleFinally
>004A3660    jmp         004A3652
 004A3662    mov         eax,ebx
 004A3664    pop         ebx
 004A3665    pop         ecx
 004A3666    pop         ebp
 004A3667    ret
end;*}

//004A3668
{*function sub_004A3668(?:TGLVfsPAK; ?:AnsiString):?;
begin
 004A3668    push        ebp
 004A3669    mov         ebp,esp
 004A366B    push        ecx
 004A366C    push        ebx
 004A366D    push        esi
 004A366E    mov         dword ptr [ebp-4],edx
 004A3671    mov         ebx,eax
 004A3673    mov         eax,dword ptr [ebp-4]
 004A3676    call        @LStrAddRef
 004A367B    xor         eax,eax
 004A367D    push        ebp
 004A367E    push        4A36C5
 004A3683    push        dword ptr fs:[eax]
 004A3686    mov         dword ptr fs:[eax],esp
 004A3689    xor         esi,esi
 004A368B    mov         edx,dword ptr [ebp-4]
 004A368E    mov         eax,ebx
 004A3690    call        004A3614
 004A3695    test        al,al
>004A3697    je          004A36AF
 004A3699    mov         edx,dword ptr [ebp-4]
 004A369C    mov         eax,dword ptr [ebx+4C]
 004A369F    mov         ecx,dword ptr [eax]
 004A36A1    call        dword ptr [ecx+54]
 004A36A4    mov         edx,eax
 004A36A6    mov         eax,ebx
 004A36A8    call        004A35A8
 004A36AD    mov         esi,eax
 004A36AF    xor         eax,eax
 004A36B1    pop         edx
 004A36B2    pop         ecx
 004A36B3    pop         ecx
 004A36B4    mov         dword ptr fs:[eax],edx
 004A36B7    push        4A36CC
 004A36BC    lea         eax,[ebp-4]
 004A36BF    call        @LStrClr
 004A36C4    ret
>004A36C5    jmp         @HandleFinally
>004A36CA    jmp         004A36BC
 004A36CC    mov         eax,esi
 004A36CE    pop         esi
 004A36CF    pop         ebx
 004A36D0    pop         ecx
 004A36D1    pop         ebp
 004A36D2    ret
end;*}

end.