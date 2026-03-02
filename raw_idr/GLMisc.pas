//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLMisc;

interface

uses
  SysUtils, Classes, GLTexture;

type
  TMeshMode = (mmTriangleStrip, mmTriangleFan, mmTriangles, mmQuadStrip, mmQuads, mmPolygon);
  TVertexMode = (vmV, vmVN, vmVNC, vmVNCT, vmVNT, vmVT);
  TGLObjectsSorting = (osInherited, osNone, osRenderFarthestFirst, osRenderBlendedLast, osRenderNearestFirst);
  TGLVisibilityCulling = (vcInherited, vcNone, vcObjectBased, vcHierarchical);
  TGLUpdateAbleObject = class(TPersistent)
  public
    f4:dword;//f4
    f8:dword;//f8
    //f10:?;//f10
    f12:word;//f12
    f14:TGLTextureExItem;//f14
    constructor vC; virtual;//vC//0046B394
    procedure v10; virtual;//v10//0046B3D0
    procedure sub_0041ADA4; dynamic;//0046B42C
  end;
  TGLCadenceAbleComponent = class(TComponent)
  public
    procedure v30; virtual;//v30//0046B430
  end;
  TGLUpdateAbleComponent = class(TGLCadenceAbleComponent)
  public
    procedure v34; virtual;//v34//0046B434
  end;
  TGLCoordinates = class(TGLUpdateAbleObject)
  public
    X:Single;//f18
    Y:Single;//f1C
    Z:Single;//f20
    f2C:dword;//f2C
    destructor Destroy; virtual;//0046B4B8
    //procedure v4(?:?); virtual;//v4//0046B560
    procedure Assign(Source:TPersistent); virtual;//v8//0046B52C
    //procedure v10(?:?); virtual;//v10//0046B5E4
    //constructor Create(?:?; ?:?);//0046B468
    //function SetX(Value:Single; ?:?):?;//0046B8B4
  end;
  TGLCoordinates4 = class(TGLCoordinates)
  end;
  TGLCoordinatesUpdateAbleComponent = class(TGLUpdateAbleComponent)
  public
    procedure v38; virtual; abstract;//v38//00402BEC
  end;
  TGLNode = class(TCollectionItem)
  public
    X:Single;//fC
    Y:Single;//f10
    Z:Single;//f14
    destructor Destroy; virtual;//0046B904
    procedure Assign(Source:TPersistent); virtual;//v8//0046B92C
    //procedure GetDisplayName(?:?); virtual;//vC//0046B960
    constructor Create(Collection:TCollection); virtual;//v1C//0046B8CC
    //procedure SetX(Value:Single; ?:?);//0046B9EC
    function IsStoredX(Value:Single):Boolean;//0046BA14
  end;
  TGLNodes = class(TOwnedCollection)
  public
    procedure v1C; virtual;//v1C//0046BA98
    procedure EndUpdate; virtual;//v24//0046BAF4
    procedure v28; virtual;//v28//0046BAAC
  end;
    constructor sub_0046B394;//0046B394
    procedure sub_0046B3D0;//0046B3D0
    procedure sub_0041ADA4;//0046B42C
    procedure sub_0046B430;//0046B430
    procedure sub_0046B434;//0046B434
    destructor Destroy;//0046B4B8
    //procedure sub_0046B4F0(?:TGLCoordinates; ?:?);//0046B4F0
    procedure Assign(Source:TPersistent);//0046B52C
    //procedure sub_0046B560(?:?);//0046B560
    //procedure sub_0046B5E4(?:?);//0046B5E4
    //procedure sub_0046B618(?:?; ?:?);//0046B618
    //procedure sub_0046B640(?:?; ?:?);//0046B640
    procedure sub_0046B660(?:TGLCoordinates);//0046B660
    procedure sub_0046B678(?:TGLCoordinates);//0046B678
    //function sub_0046B68C(?:TGLCoordinates):?;//0046B68C
    //procedure sub_0046B698(?:TGLCoordinates; ?:?; ?:?; ?:?);//0046B698
    //procedure sub_0046B730(?:TGLCoordinates; ?:?; ?:?; ?:?; ?:?);//0046B730
    procedure sub_0046B7C8(?:TGLCoordinates; ?:Single);//0046B7C8
    //procedure sub_0046B7E0(?:TGLCoordinates; ?:?; ?:?; ?:?);//0046B7E0
    //function sub_0046B874(?:?):?;//0046B874
    //procedure sub_0046B878(?:TGLCoordinates; ?:?);//0046B878
    //procedure sub_0046B8A8(?:?; ?:?);//0046B8A8
    constructor Create(Collection:TCollection);//0046B8CC
    destructor Destroy;//0046B904
    procedure Assign(Source:TPersistent);//0046B92C
    //procedure GetDisplayName(?:?);//0046B960
    //procedure sub_0046B9E0(?:?; ?:?);//0046B9E0
    //constructor sub_0046BA2C(?:?);//0046BA2C
    //function sub_0046BA84(?:TGLLinesNodes; ?:Integer):?;//0046BA84
    procedure sub_0046BA98;//0046BA98
    procedure sub_0046BAAC;//0046BAAC
    procedure EndUpdate;//0046BAF4
    //function sub_0046BB10(?:TGLLinesNodes):?;//0046BB10

implementation

//0046B394
constructor sub_0046B394;
begin
{*
 0046B394    push        ebx
 0046B395    push        esi
 0046B396    push        edi
 0046B397    test        dl,dl
>0046B399    je          0046B3A3
 0046B39B    add         esp,0FFFFFFF0
 0046B39E    call        @ClassCreate
 0046B3A3    mov         esi,ecx
 0046B3A5    mov         ebx,edx
 0046B3A7    mov         edi,eax
 0046B3A9    xor         edx,edx
 0046B3AB    mov         eax,edi
 0046B3AD    call        TObject.Create
 0046B3B2    mov         dword ptr [edi+4],esi;TGLUpdateAbleObject.?f4:dword
 0046B3B5    mov         eax,edi
 0046B3B7    test        bl,bl
>0046B3B9    je          0046B3CA
 0046B3BB    call        @AfterConstruction
 0046B3C0    pop         dword ptr fs:[0]
 0046B3C7    add         esp,0C
 0046B3CA    mov         eax,edi
 0046B3CC    pop         edi
 0046B3CD    pop         esi
 0046B3CE    pop         ebx
 0046B3CF    ret
*}
end;

//0046B3D0
procedure sub_0046B3D0;
begin
{*
 0046B3D0    push        ebx
 0046B3D1    push        esi
 0046B3D2    mov         ebx,eax
 0046B3D4    cmp         dword ptr [ebx+8],0;TGLUpdateAbleObject.?f8:dword
>0046B3D8    jne         0046B428
 0046B3DA    cmp         dword ptr [ebx+4],0;TGLUpdateAbleObject.?f4:dword
>0046B3DE    je          0046B428
 0046B3E0    mov         esi,dword ptr [ebx+4];TGLUpdateAbleObject.?f4:dword
 0046B3E3    mov         eax,esi
 0046B3E5    mov         edx,dword ptr ds:[46AD40];TGLUpdateAbleObject
 0046B3EB    call        @IsClass
 0046B3F0    test        al,al
>0046B3F2    je          0046B3FF
 0046B3F4    mov         edx,ebx
 0046B3F6    mov         eax,esi
 0046B3F8    mov         ecx,dword ptr [eax]
 0046B3FA    call        dword ptr [ecx+10]
>0046B3FD    jmp         0046B419
 0046B3FF    mov         eax,esi
 0046B401    mov         edx,dword ptr ds:[46AEB0];TGLUpdateAbleComponent
 0046B407    call        @IsClass
 0046B40C    test        al,al
>0046B40E    je          0046B419
 0046B410    mov         edx,ebx
 0046B412    mov         eax,esi
 0046B414    mov         ecx,dword ptr [eax]
 0046B416    call        dword ptr [ecx+34]
 0046B419    cmp         word ptr [ebx+12],0;TGLUpdateAbleObject.?f12:word
>0046B41E    je          0046B428
 0046B420    mov         edx,ebx
 0046B422    mov         eax,dword ptr [ebx+14];TGLUpdateAbleObject.?f14:TGLTextureExItem
 0046B425    call        dword ptr [ebx+10]
 0046B428    pop         esi
 0046B429    pop         ebx
 0046B42A    ret
*}
end;

//0046B42C
procedure TGLUpdateAbleObject.sub_0041ADA4;
begin
{*
 0046B42C    mov         eax,dword ptr [eax+4];TGLUpdateAbleObject.?f4:dword
 0046B42F    ret
*}
end;

//0046B430
procedure sub_0046B430;
begin
{*
 0046B430    ret
*}
end;

//0046B434
procedure sub_0046B434;
begin
{*
 0046B434    push        ebx
 0046B435    push        esi
 0046B436    mov         ebx,eax
 0046B438    mov         esi,dword ptr [ebx+4];TGLUpdateAbleComponent.FOwner:TComponent
 0046B43B    test        esi,esi
>0046B43D    je          0046B464
 0046B43F    mov         eax,esi
 0046B441    mov         edx,dword ptr ds:[46AEB0];TGLUpdateAbleComponent
 0046B447    call        @IsClass
 0046B44C    test        al,al
>0046B44E    je          0046B464
 0046B450    mov         eax,esi
 0046B452    mov         edx,dword ptr ds:[46AEB0];TGLUpdateAbleComponent
 0046B458    call        @AsClass
 0046B45D    mov         edx,ebx
 0046B45F    mov         ecx,dword ptr [eax]
 0046B461    call        dword ptr [ecx+34];TGLUpdateAbleComponent.sub_0046B434
 0046B464    pop         esi
 0046B465    pop         ebx
 0046B466    ret
*}
end;

//0046B468
{*constructor TGLCoordinates.Create(?:?; ?:?);
begin
 0046B468    push        ebp
 0046B469    mov         ebp,esp
 0046B46B    push        ecx
 0046B46C    push        ebx
 0046B46D    push        esi
 0046B46E    test        dl,dl
>0046B470    je          0046B47A
 0046B472    add         esp,0FFFFFFF0
 0046B475    call        @ClassCreate
 0046B47A    mov         byte ptr [ebp-1],dl
 0046B47D    mov         ebx,eax
 0046B47F    xor         edx,edx
 0046B481    mov         eax,ebx
 0046B483    mov         esi,dword ptr [eax]
 0046B485    call        dword ptr [esi+0C]
 0046B488    mov         edx,dword ptr [ebp+0C]
 0046B48B    mov         eax,ebx
 0046B48D    call        0046B4F0
 0046B492    mov         al,byte ptr [ebp+8]
 0046B495    mov         byte ptr [ebx+28],al
 0046B498    mov         eax,ebx
 0046B49A    cmp         byte ptr [ebp-1],0
>0046B49E    je          0046B4AF
 0046B4A0    call        @AfterConstruction
 0046B4A5    pop         dword ptr fs:[0]
 0046B4AC    add         esp,0C
 0046B4AF    mov         eax,ebx
 0046B4B1    pop         esi
 0046B4B2    pop         ebx
 0046B4B3    pop         ecx
 0046B4B4    pop         ebp
 0046B4B5    ret         8
end;*}

//0046B4B8
destructor TGLCoordinates.Destroy;
begin
{*
 0046B4B8    push        ebx
 0046B4B9    push        esi
 0046B4BA    call        @BeforeDestruction
 0046B4BF    mov         ebx,edx
 0046B4C1    mov         esi,eax
 0046B4C3    mov         eax,dword ptr [esi+2C];TGLCoordinates.?f2C:dword
 0046B4C6    test        eax,eax
>0046B4C8    je          0046B4D4
 0046B4CA    mov         edx,10
 0046B4CF    call        @FreeMem
 0046B4D4    mov         edx,ebx
 0046B4D6    and         dl,0FC
 0046B4D9    mov         eax,esi
 0046B4DB    call        TMemoryStream.Destroy
 0046B4E0    test        bl,bl
>0046B4E2    jle         0046B4EB
 0046B4E4    mov         eax,esi
 0046B4E6    call        @ClassDestroy
 0046B4EB    pop         esi
 0046B4EC    pop         ebx
 0046B4ED    ret
*}
end;

//0046B4F0
{*procedure sub_0046B4F0(?:TGLCoordinates; ?:?);
begin
 0046B4F0    push        ebx
 0046B4F1    push        esi
 0046B4F2    push        edi
 0046B4F3    mov         esi,edx
 0046B4F5    mov         ebx,eax
 0046B4F7    push        esi
 0046B4F8    lea         edi,[ebx+18]
 0046B4FB    movs        dword ptr [edi],dword ptr [esi]
 0046B4FC    movs        dword ptr [edi],dword ptr [esi]
 0046B4FD    movs        dword ptr [edi],dword ptr [esi]
 0046B4FE    movs        dword ptr [edi],dword ptr [esi]
 0046B4FF    pop         esi
 0046B500    cmp         byte ptr ds:[5AD1E0],0;gvar_005AD1E0
>0046B507    je          0046B525
 0046B509    cmp         dword ptr [ebx+2C],0
>0046B50D    jne         0046B51C
 0046B50F    mov         eax,10
 0046B514    call        @GetMem
 0046B519    mov         dword ptr [ebx+2C],eax
 0046B51C    mov         eax,dword ptr [ebx+2C]
 0046B51F    mov         edi,eax
 0046B521    movs        dword ptr [edi],dword ptr [esi]
 0046B522    movs        dword ptr [edi],dword ptr [esi]
 0046B523    movs        dword ptr [edi],dword ptr [esi]
 0046B524    movs        dword ptr [edi],dword ptr [esi]
 0046B525    pop         edi
 0046B526    pop         esi
 0046B527    pop         ebx
 0046B528    ret
end;*}

//0046B52C
procedure TGLCoordinates.Assign(Source:TPersistent);
begin
{*
 0046B52C    push        ebx
 0046B52D    push        esi
 0046B52E    push        edi
 0046B52F    mov         esi,edx
 0046B531    mov         ebx,eax
 0046B533    mov         eax,esi
 0046B535    mov         edx,dword ptr ds:[46AF7C];TGLCoordinates
 0046B53B    call        @IsClass
 0046B540    test        al,al
>0046B542    je          0046B550
 0046B544    add         esi,18
 0046B547    lea         edi,[ebx+18];TGLCoordinates.X:Single
 0046B54A    movs        dword ptr [edi],dword ptr [esi]
 0046B54B    movs        dword ptr [edi],dword ptr [esi]
 0046B54C    movs        dword ptr [edi],dword ptr [esi]
 0046B54D    movs        dword ptr [edi],dword ptr [esi]
>0046B54E    jmp         0046B559
 0046B550    mov         edx,esi
 0046B552    mov         eax,ebx
 0046B554    call        TPersistent.Assign
 0046B559    pop         edi
 0046B55A    pop         esi
 0046B55B    pop         ebx
 0046B55C    ret
*}
end;

//0046B560
{*procedure sub_0046B560(?:?);
begin
 0046B560    push        ebx
 0046B561    push        esi
 0046B562    push        edi
 0046B563    mov         esi,edx
 0046B565    mov         ebx,eax
 0046B567    mov         edx,esi
 0046B569    mov         eax,ebx
 0046B56B    call        0041ACF0
 0046B570    push        ebx
 0046B571    push        46B5BC
 0046B576    push        ebx
 0046B577    push        46B5D0
 0046B57C    mov         edi,dword ptr [ebx+2C];TGLCoordinates.?f2C:dword
 0046B57F    test        edi,edi
>0046B581    je          0046B595
 0046B583    lea         edx,[ebx+18];TGLCoordinates.X:Single
 0046B586    mov         eax,edi
 0046B588    call        0045D870
 0046B58D    test        al,al
>0046B58F    je          0046B595
 0046B591    xor         ecx,ecx
>0046B593    jmp         0046B597
 0046B595    mov         cl,1
 0046B597    mov         edx,46B5B0;'Coordinates'
 0046B59C    mov         eax,esi
 0046B59E    mov         ebx,dword ptr [eax]
 0046B5A0    call        dword ptr [ebx+8]
 0046B5A3    pop         edi
 0046B5A4    pop         esi
 0046B5A5    pop         ebx
 0046B5A6    ret
end;*}

//0046B5E4
{*procedure sub_0046B5E4(?:?);
begin
 0046B5E4    push        ebx
 0046B5E5    push        esi
 0046B5E6    push        edi
 0046B5E7    mov         edi,edx
 0046B5E9    mov         ebx,eax
 0046B5EB    mov         esi,dword ptr [ebx+4];TGLCoordinates.?f4:dword
 0046B5EE    mov         eax,esi
 0046B5F0    mov         edx,dword ptr ds:[46B11C];TGLCoordinatesUpdateAbleComponent
 0046B5F6    call        @IsClass
 0046B5FB    test        al,al
>0046B5FD    je          0046B60A
 0046B5FF    mov         edx,ebx
 0046B601    mov         eax,esi
 0046B603    mov         ecx,dword ptr [eax]
 0046B605    call        dword ptr [ecx+38]
>0046B608    jmp         0046B613
 0046B60A    mov         edx,edi
 0046B60C    mov         eax,ebx
 0046B60E    call        0046B3D0
 0046B613    pop         edi
 0046B614    pop         esi
 0046B615    pop         ebx
 0046B616    ret
end;*}

//0046B618
{*procedure sub_0046B618(?:?; ?:?);
begin
 0046B618    push        ebp
 0046B619    mov         ebp,esp
 0046B61B    push        ecx
 0046B61C    push        ebx
 0046B61D    mov         ebx,eax
 0046B61F    mov         eax,dword ptr [ebp+8]
 0046B622    mov         dword ptr [ebp-4],eax
 0046B625    lea         ecx,[ebp-4]
 0046B628    lea         eax,[ebx+18]
 0046B62B    call        0045CD54
 0046B630    mov         edx,ebx
 0046B632    mov         eax,ebx
 0046B634    mov         ecx,dword ptr [eax]
 0046B636    call        dword ptr [ecx+10]
 0046B639    pop         ebx
 0046B63A    pop         ecx
 0046B63B    pop         ebp
 0046B63C    ret         4
end;*}

//0046B640
{*procedure sub_0046B640(?:?; ?:?);
begin
 0046B640    push        ebp
 0046B641    mov         ebp,esp
 0046B643    push        esi
 0046B644    mov         esi,eax
 0046B646    push        dword ptr [ebp+8]
 0046B649    lea         eax,[esi+18]
 0046B64C    call        0045D9A4
 0046B651    mov         edx,esi
 0046B653    mov         eax,esi
 0046B655    mov         ecx,dword ptr [eax]
 0046B657    call        dword ptr [ecx+10]
 0046B65A    pop         esi
 0046B65B    pop         ebp
 0046B65C    ret         4
end;*}

//0046B660
procedure sub_0046B660(?:TGLCoordinates);
begin
{*
 0046B660    push        ebx
 0046B661    mov         ebx,eax
 0046B663    lea         eax,[ebx+18]
 0046B666    call        0045D5EC
 0046B66B    mov         edx,ebx
 0046B66D    mov         eax,ebx
 0046B66F    mov         ecx,dword ptr [eax]
 0046B671    call        dword ptr [ecx+10]
 0046B674    pop         ebx
 0046B675    ret
*}
end;

//0046B678
procedure sub_0046B678(?:TGLCoordinates);
begin
{*
 0046B678    push        ecx
 0046B679    add         eax,18
 0046B67C    call        0045D420
 0046B681    fstp        dword ptr [esp]
 0046B684    wait
 0046B685    fld         dword ptr [esp]
 0046B688    pop         edx
 0046B689    ret
*}
end;

//0046B68C
{*function sub_0046B68C(?:TGLCoordinates):?;
begin
 0046B68C    add         eax,18
 0046B68F    call        0045D870
 0046B694    ret
end;*}

//0046B698
{*procedure sub_0046B698(?:TGLCoordinates; ?:?; ?:?; ?:?);
begin
 0046B698    push        ebp
 0046B699    mov         ebp,esp
 0046B69B    push        ebx
 0046B69C    mov         ebx,eax
 0046B69E    cmp         byte ptr [ebx+28],0
>0046B6A2    jne         0046B6B8
 0046B6A4    mov         ecx,33D
 0046B6A9    mov         edx,46B6E4;'C:\GLScene\glscene_v_1000714\Source\GLMisc.pas'
 0046B6AE    mov         eax,46B71C;'Assertion failure'
 0046B6B3    call        @Assert
 0046B6B8    push        dword ptr [ebp+10]
 0046B6BB    push        dword ptr [ebp+0C]
 0046B6BE    push        dword ptr [ebp+8]
 0046B6C1    push        0
 0046B6C3    lea         eax,[ebx+18]
 0046B6C6    call        0045C980
 0046B6CB    mov         edx,ebx
 0046B6CD    mov         eax,ebx
 0046B6CF    mov         ecx,dword ptr [eax]
 0046B6D1    call        dword ptr [ecx+10]
 0046B6D4    pop         ebx
 0046B6D5    pop         ebp
 0046B6D6    ret         0C
end;*}

//0046B730
{*procedure sub_0046B730(?:TGLCoordinates; ?:?; ?:?; ?:?; ?:?);
begin
 0046B730    push        ebp
 0046B731    mov         ebp,esp
 0046B733    push        ebx
 0046B734    mov         ebx,eax
 0046B736    cmp         byte ptr [ebx+28],0
>0046B73A    jne         0046B750
 0046B73C    mov         ecx,358
 0046B741    mov         edx,46B77C;'C:\GLScene\glscene_v_1000714\Source\GLMisc.pas'
 0046B746    mov         eax,46B7B4;'Assertion failure'
 0046B74B    call        @Assert
 0046B750    push        dword ptr [ebp+14]
 0046B753    push        dword ptr [ebp+10]
 0046B756    push        dword ptr [ebp+0C]
 0046B759    push        dword ptr [ebp+8]
 0046B75C    lea         eax,[ebx+18]
 0046B75F    call        0045C980
 0046B764    mov         edx,ebx
 0046B766    mov         eax,ebx
 0046B768    mov         ecx,dword ptr [eax]
 0046B76A    call        dword ptr [ecx+10]
 0046B76D    pop         ebx
 0046B76E    pop         ebp
 0046B76F    ret         10
end;*}

//0046B7C8
procedure sub_0046B7C8(?:TGLCoordinates; ?:Single);
begin
{*
 0046B7C8    mov         ecx,dword ptr [edx]
 0046B7CA    mov         dword ptr [eax+18],ecx
 0046B7CD    mov         ecx,dword ptr [edx+4]
 0046B7D0    mov         dword ptr [eax+1C],ecx
 0046B7D3    mov         ecx,dword ptr [edx+8]
 0046B7D6    mov         dword ptr [eax+20],ecx
 0046B7D9    mov         edx,dword ptr [edx+0C]
 0046B7DC    mov         dword ptr [eax+24],edx
 0046B7DF    ret
*}
end;

//0046B7E0
{*procedure sub_0046B7E0(?:TGLCoordinates; ?:?; ?:?; ?:?);
begin
 0046B7E0    push        ebp
 0046B7E1    mov         ebp,esp
 0046B7E3    push        ebx
 0046B7E4    mov         ebx,eax
 0046B7E6    cmp         byte ptr [ebx+28],1
>0046B7EA    jne         0046B800
 0046B7EC    mov         ecx,378
 0046B7F1    mov         edx,46B828;'C:\GLScene\glscene_v_1000714\Source\GLMisc.pas'
 0046B7F6    mov         eax,46B860;'Assertion failure'
 0046B7FB    call        @Assert
 0046B800    push        dword ptr [ebp+10]
 0046B803    push        dword ptr [ebp+0C]
 0046B806    push        dword ptr [ebp+8]
 0046B809    lea         eax,[ebx+18]
 0046B80C    call        0045C9D8
 0046B811    mov         edx,ebx
 0046B813    mov         eax,ebx
 0046B815    mov         ecx,dword ptr [eax]
 0046B817    call        dword ptr [ecx+10]
 0046B81A    pop         ebx
 0046B81B    pop         ebp
 0046B81C    ret         0C
end;*}

//0046B874
{*function sub_0046B874(?:?):?;
begin
 0046B874    add         eax,18
 0046B877    ret
end;*}

//0046B878
{*procedure sub_0046B878(?:TGLCoordinates; ?:?);
begin
 0046B878    push        esi
 0046B879    push        edi
 0046B87A    mov         esi,edx
 0046B87C    lea         edi,[eax+18]
 0046B87F    movs        dword ptr [edi],dword ptr [esi]
 0046B880    movs        dword ptr [edi],dword ptr [esi]
 0046B881    movs        dword ptr [edi],dword ptr [esi]
 0046B882    movs        dword ptr [edi],dword ptr [esi]
 0046B883    mov         dl,byte ptr [eax+28]
 0046B886    sub         dl,1
>0046B889    jb          0046B88F
>0046B88B    je          0046B898
>0046B88D    jmp         0046B89D
 0046B88F    mov         dword ptr [eax+24],3F800000
>0046B896    jmp         0046B89D
 0046B898    xor         edx,edx
 0046B89A    mov         dword ptr [eax+24],edx
 0046B89D    mov         edx,eax
 0046B89F    mov         ecx,dword ptr [eax]
 0046B8A1    call        dword ptr [ecx+10]
 0046B8A4    pop         edi
 0046B8A5    pop         esi
 0046B8A6    ret
end;*}

//0046B8A8
{*procedure sub_0046B8A8(?:?; ?:?);
begin
 0046B8A8    add         eax,18
 0046B8AB    xchg        eax,edx
 0046B8AC    call        0045C8F4
 0046B8B1    ret
end;*}

//0046B8B4
{*function TGLCoordinates.SetX(Value:Single; ?:?):?;
begin
 0046B8B4    push        ebp
 0046B8B5    mov         ebp,esp
 0046B8B7    mov         ecx,dword ptr [ebp+8]
 0046B8BA    mov         dword ptr [eax+edx*4+18],ecx
 0046B8BE    mov         edx,eax
 0046B8C0    mov         ecx,dword ptr [eax]
 0046B8C2    call        dword ptr [ecx+10];TGLCoordinates.sub_0046B5E4
 0046B8C5    pop         ebp
 0046B8C6    ret         4
end;*}

//0046B8CC
constructor TGLNode.Create(Collection:TCollection);
begin
{*
 0046B8CC    push        ebx
 0046B8CD    push        esi
 0046B8CE    test        dl,dl
>0046B8D0    je          0046B8DA
 0046B8D2    add         esp,0FFFFFFF0
 0046B8D5    call        @ClassCreate
 0046B8DA    mov         ebx,edx
 0046B8DC    mov         esi,eax
 0046B8DE    xor         edx,edx
 0046B8E0    mov         eax,esi
 0046B8E2    call        TCollectionItem.Create
 0046B8E7    mov         eax,esi
 0046B8E9    test        bl,bl
>0046B8EB    je          0046B8FC
 0046B8ED    call        @AfterConstruction
 0046B8F2    pop         dword ptr fs:[0]
 0046B8F9    add         esp,0C
 0046B8FC    mov         eax,esi
 0046B8FE    pop         esi
 0046B8FF    pop         ebx
 0046B900    ret
*}
end;

//0046B904
destructor TGLNode.Destroy;
begin
{*
 0046B904    push        ebx
 0046B905    push        esi
 0046B906    call        @BeforeDestruction
 0046B90B    mov         ebx,edx
 0046B90D    mov         esi,eax
 0046B90F    mov         edx,ebx
 0046B911    and         dl,0FC
 0046B914    mov         eax,esi
 0046B916    call        TCollectionItem.Destroy
 0046B91B    test        bl,bl
>0046B91D    jle         0046B926
 0046B91F    mov         eax,esi
 0046B921    call        @ClassDestroy
 0046B926    pop         esi
 0046B927    pop         ebx
 0046B928    ret
*}
end;

//0046B92C
procedure TGLNode.Assign(Source:TPersistent);
begin
{*
 0046B92C    push        ebx
 0046B92D    push        esi
 0046B92E    push        edi
 0046B92F    mov         esi,edx
 0046B931    mov         ebx,eax
 0046B933    mov         eax,esi
 0046B935    mov         edx,dword ptr ds:[46B204];TGLNode
 0046B93B    call        @IsClass
 0046B940    test        al,al
>0046B942    je          0046B950
 0046B944    add         esi,0C
 0046B947    lea         edi,[ebx+0C];TGLNode.X:Single
 0046B94A    movs        dword ptr [edi],dword ptr [esi]
 0046B94B    movs        dword ptr [edi],dword ptr [esi]
 0046B94C    movs        dword ptr [edi],dword ptr [esi]
 0046B94D    movs        dword ptr [edi],dword ptr [esi]
>0046B94E    jmp         0046B959
 0046B950    mov         edx,esi
 0046B952    mov         eax,ebx
 0046B954    call        TPersistent.Assign
 0046B959    pop         edi
 0046B95A    pop         esi
 0046B95B    pop         ebx
 0046B95C    ret
*}
end;

//0046B960
{*procedure TGLNode.GetDisplayName(?:?);
begin
 0046B960    push        ebx
 0046B961    push        esi
 0046B962    add         esp,0FFFFFFC4
 0046B965    mov         esi,edx
 0046B967    mov         ebx,eax
 0046B969    push        esi
 0046B96A    fld         dword ptr [ebx+0C];TGLNode.X:Single
 0046B96D    fstp        tbyte ptr [esp+1C]
 0046B971    wait
 0046B972    lea         eax,[esp+1C]
 0046B976    mov         dword ptr [esp+4],eax
 0046B97A    mov         byte ptr [esp+8],3
 0046B97F    fld         dword ptr [ebx+10];TGLNode.Y:Single
 0046B982    fstp        tbyte ptr [esp+28]
 0046B986    wait
 0046B987    lea         eax,[esp+28]
 0046B98B    mov         dword ptr [esp+0C],eax
 0046B98F    mov         byte ptr [esp+10],3
 0046B994    fld         dword ptr [ebx+14];TGLNode.Z:Single
 0046B997    fstp        tbyte ptr [esp+34]
 0046B99B    wait
 0046B99C    lea         eax,[esp+34]
 0046B9A0    mov         dword ptr [esp+14],eax
 0046B9A4    mov         byte ptr [esp+18],3
 0046B9A9    lea         edx,[esp+4]
 0046B9AD    mov         ecx,2
 0046B9B2    mov         eax,46B9CC;'%.4f; %.4f; %.4f'
 0046B9B7    call        Format
 0046B9BC    add         esp,3C
 0046B9BF    pop         esi
 0046B9C0    pop         ebx
 0046B9C1    ret
end;*}

//0046B9E0
{*procedure sub_0046B9E0(?:?; ?:?);
begin
 0046B9E0    add         eax,0C
 0046B9E3    xchg        eax,edx
 0046B9E4    call        0045C8F4
 0046B9E9    ret
end;*}

//0046B9EC
{*procedure TGLNode.SetX(Value:Single; ?:?);
begin
 0046B9EC    push        ebp
 0046B9ED    mov         ebp,esp
 0046B9EF    push        ebx
 0046B9F0    mov         ebx,eax
 0046B9F2    mov         eax,dword ptr [ebp+8]
 0046B9F5    mov         dword ptr [ebx+edx*4+0C],eax
 0046B9F9    mov         eax,dword ptr [ebx+4];TGLNode.FCollection:TCollection
 0046B9FC    mov         edx,dword ptr ds:[46B2EC];TGLNodes
 0046BA02    call        @AsClass
 0046BA07    mov         edx,dword ptr [eax]
 0046BA09    call        dword ptr [edx+28];TGLNodes.sub_0046BAAC
 0046BA0C    pop         ebx
 0046BA0D    pop         ebp
 0046BA0E    ret         4
end;*}

//0046BA14
function TGLNode.IsStoredX(Value:Single):Boolean;
begin
{*
 0046BA14    mov         ecx,eax
 0046BA16    fld         dword ptr [ecx+edx*4+0C]
 0046BA1A    fcomp       dword ptr ds:[46BA28];0:Single
 0046BA20    fnstsw      al
 0046BA22    sahf
 0046BA23    setne       al
 0046BA26    ret
*}
end;

//0046BA2C
{*constructor sub_0046BA2C(?:?);
begin
 0046BA2C    push        ebp
 0046BA2D    mov         ebp,esp
 0046BA2F    push        ecx
 0046BA30    push        ebx
 0046BA31    test        dl,dl
>0046BA33    je          0046BA3D
 0046BA35    add         esp,0FFFFFFF0
 0046BA38    call        @ClassCreate
 0046BA3D    mov         byte ptr [ebp-1],dl
 0046BA40    mov         ebx,eax
 0046BA42    mov         eax,dword ptr [ebp+8]
 0046BA45    test        eax,eax
>0046BA47    jne         0046BA5A
 0046BA49    mov         eax,[0046B204];TGLNode
 0046BA4E    push        eax
 0046BA4F    xor         edx,edx
 0046BA51    mov         eax,ebx
 0046BA53    call        TOwnedCollection.Create
>0046BA58    jmp         0046BA64
 0046BA5A    push        eax
 0046BA5B    xor         edx,edx
 0046BA5D    mov         eax,ebx
 0046BA5F    call        TOwnedCollection.Create
 0046BA64    mov         eax,ebx
 0046BA66    cmp         byte ptr [ebp-1],0
>0046BA6A    je          0046BA7B
 0046BA6C    call        @AfterConstruction
 0046BA71    pop         dword ptr fs:[0]
 0046BA78    add         esp,0C
 0046BA7B    mov         eax,ebx
 0046BA7D    pop         ebx
 0046BA7E    pop         ecx
 0046BA7F    pop         ebp
 0046BA80    ret         4
end;*}

//0046BA84
{*function sub_0046BA84(?:TGLLinesNodes; ?:Integer):?;
begin
 0046BA84    push        ebx
 0046BA85    push        esi
 0046BA86    mov         esi,edx
 0046BA88    mov         ebx,eax
 0046BA8A    mov         edx,esi
 0046BA8C    mov         eax,ebx
 0046BA8E    call        TCollection.GetItem
 0046BA93    pop         esi
 0046BA94    pop         ebx
 0046BA95    ret
end;*}

//0046BA98
procedure sub_0046BA98;
begin
{*
 0046BA98    push        ebx
 0046BA99    mov         ebx,eax
 0046BA9B    mov         eax,ebx
 0046BA9D    call        0041B608
 0046BAA2    mov         eax,ebx
 0046BAA4    mov         edx,dword ptr [eax]
 0046BAA6    call        dword ptr [edx+28];TGLNodes.sub_0046BAAC
 0046BAA9    pop         ebx
 0046BAAA    ret
*}
end;

//0046BAAC
procedure sub_0046BAAC;
begin
{*
 0046BAAC    push        ebx
 0046BAAD    push        esi
 0046BAAE    mov         ebx,eax
 0046BAB0    cmp         dword ptr [ebx+0C],0;TGLNodes.FUpdateCount:Integer
>0046BAB4    jne         0046BAF1
 0046BAB6    mov         eax,ebx
 0046BAB8    mov         si,0FFFF
 0046BABC    call        @CallDynaInst;TOwnedCollection.sub_0041ADA4
 0046BAC1    test        eax,eax
>0046BAC3    je          0046BAF1
 0046BAC5    mov         eax,ebx
 0046BAC7    mov         si,0FFFF
 0046BACB    call        @CallDynaInst;TOwnedCollection.sub_0041ADA4
 0046BAD0    mov         edx,dword ptr ds:[46AEB0];TGLUpdateAbleComponent
 0046BAD6    call        @IsClass
 0046BADB    test        al,al
>0046BADD    je          0046BAF1
 0046BADF    mov         eax,ebx
 0046BAE1    mov         si,0FFFF
 0046BAE5    call        @CallDynaInst;TOwnedCollection.sub_0041ADA4
 0046BAEA    mov         edx,ebx
 0046BAEC    mov         ecx,dword ptr [eax]
 0046BAEE    call        dword ptr [ecx+34]
 0046BAF1    pop         esi
 0046BAF2    pop         ebx
 0046BAF3    ret
*}
end;

//0046BAF4
procedure TGLNodes.EndUpdate;
begin
{*
 0046BAF4    push        ebx
 0046BAF5    mov         ebx,eax
 0046BAF7    mov         eax,ebx
 0046BAF9    call        TCollection.EndUpdate
 0046BAFE    cmp         dword ptr [ebx+0C],0;TGLNodes.FUpdateCount:Integer
>0046BB02    jne         0046BB0B
 0046BB04    mov         eax,ebx
 0046BB06    mov         edx,dword ptr [eax]
 0046BB08    call        dword ptr [edx+28];TGLNodes.sub_0046BAAC
 0046BB0B    pop         ebx
 0046BB0C    ret
*}
end;

//0046BB10
{*function sub_0046BB10(?:TGLLinesNodes):?;
begin
 0046BB10    push        ebx
 0046BB11    push        esi
 0046BB12    push        edi
 0046BB13    push        ebp
 0046BB14    add         esp,0FFFFFFF8
 0046BB17    mov         esi,eax
 0046BB19    mov         eax,esi
 0046BB1B    call        TCollection.GetCount
 0046BB20    shl         eax,2
 0046BB23    call        @GetMem
 0046BB28    mov         edi,eax
 0046BB2A    mov         eax,esi
 0046BB2C    call        TCollection.GetCount
 0046BB31    shl         eax,2
 0046BB34    call        @GetMem
 0046BB39    mov         dword ptr [esp],eax
 0046BB3C    mov         eax,esi
 0046BB3E    call        TCollection.GetCount
 0046BB43    shl         eax,2
 0046BB46    call        @GetMem
 0046BB4B    mov         dword ptr [esp+4],eax
 0046BB4F    mov         eax,esi
 0046BB51    call        TCollection.GetCount
 0046BB56    mov         ebp,eax
 0046BB58    dec         ebp
 0046BB59    test        ebp,ebp
>0046BB5B    jl          0046BB86
 0046BB5D    inc         ebp
 0046BB5E    xor         ebx,ebx
 0046BB60    mov         edx,ebx
 0046BB62    mov         eax,esi
 0046BB64    call        0046BA84
 0046BB69    mov         edx,dword ptr [eax+0C]
 0046BB6C    mov         dword ptr [edi+ebx*4],edx
 0046BB6F    mov         edx,dword ptr [esp]
 0046BB72    mov         ecx,dword ptr [eax+10]
 0046BB75    mov         dword ptr [edx+ebx*4],ecx
 0046BB78    mov         edx,dword ptr [esp+4]
 0046BB7C    mov         eax,dword ptr [eax+14]
 0046BB7F    mov         dword ptr [edx+ebx*4],eax
 0046BB82    inc         ebx
 0046BB83    dec         ebp
>0046BB84    jne         0046BB60
 0046BB86    mov         eax,dword ptr [esp]
 0046BB89    push        eax
 0046BB8A    mov         eax,dword ptr [esp+8]
 0046BB8E    push        eax
 0046BB8F    push        0
 0046BB91    mov         eax,esi
 0046BB93    call        TCollection.GetCount
 0046BB98    push        eax
 0046BB99    mov         ecx,edi
 0046BB9B    mov         dl,1
 0046BB9D    mov         eax,[00465270];TCubicSpline
 0046BBA2    call        TCubicSpline.Create;TCubicSpline.Create
 0046BBA7    mov         ebx,eax
 0046BBA9    mov         eax,edi
 0046BBAB    call        @FreeMem
 0046BBB0    mov         eax,dword ptr [esp]
 0046BBB3    call        @FreeMem
 0046BBB8    mov         eax,dword ptr [esp+4]
 0046BBBC    call        @FreeMem
 0046BBC1    mov         eax,ebx
 0046BBC3    pop         ecx
 0046BBC4    pop         edx
 0046BBC5    pop         ebp
 0046BBC6    pop         edi
 0046BBC7    pop         esi
 0046BBC8    pop         ebx
 0046BBC9    ret
end;*}

Initialization
Finalization
//0046BBCC
{*
 0046BBCC    push        ebp
 0046BBCD    mov         ebp,esp
 0046BBCF    xor         eax,eax
 0046BBD1    push        ebp
 0046BBD2    push        46BC04
 0046BBD7    push        dword ptr fs:[eax]
 0046BBDA    mov         dword ptr fs:[eax],esp
 0046BBDD    inc         dword ptr ds:[5E1398]
>0046BBE3    jne         0046BBF6
 0046BBE5    mov         eax,[005E139C];gvar_005E139C
 0046BBEA    call        TObject.Free
 0046BBEF    xor         eax,eax
 0046BBF1    mov         [005E139C],eax;gvar_005E139C
 0046BBF6    xor         eax,eax
 0046BBF8    pop         edx
 0046BBF9    pop         ecx
 0046BBFA    pop         ecx
 0046BBFB    mov         dword ptr fs:[eax],edx
 0046BBFE    push        46BC0B
 0046BC03    ret
>0046BC04    jmp         @HandleFinally
>0046BC09    jmp         0046BC03
 0046BC0B    pop         ebp
 0046BC0C    ret
*}
end.