//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLObjects;

interface

uses
  SysUtils, Classes, GLTexture, , GLMisc, VectorLists, GLObjects;

type
  TGLVisibilityDeterminationEvent = function(Sender:TObject; var rci:TRenderContextInfo):Boolean of object;;
  TGLDummyCube = class(TGLCameraInvariantObject)
  public
    CubeSize:Single;//fA0
    EdgeColor:TGLColor;//fA4
    VisibleAtRunTime:Boolean;//fA8
    Amalgamate:Boolean;//fA9
    fAC:TGLListHandle;//fAC
    OnVisibilityDetermination:TGLVisibilityDeterminationEvent;//fB0
    fB2:word;//fB2
    fB4:dword;//fB4
    destructor Destroy; virtual;//00484A60
    procedure Assign(Source:TPersistent); virtual;//v8//00484A9C
    constructor Create(AOwner:TComponent); virtual;//v2C//004849C8
    //procedure v48(?:?); virtual;//v48//00484D60
    //procedure v4C(?:?); virtual;//v4C//00484AF8
    procedure v54; virtual;//v54//00484B28
    //procedure v64(?:?); virtual;//v64//00484B34
    //procedure v68(?:?; ?:?; ?:?); virtual;//v68//00484B5C
    procedure sub_0047CEC8; dynamic;//00484D40
    //procedure SetCubeSize(Value:Single; ?:?);//00484E04
    procedure SetEdgeColor(Value:TGLColor);//00484E34
    procedure SetVisibleAtRunTime(Value:Boolean);//00484E58
    procedure SetAmalgamate(Value:Boolean);//00484E74
  end;
  TPlaneStyle = (psSingleQuad, psTileTexture);
  TPlaneStyles = set of TPlaneStyle;
  TGLPlane = class(TGLSceneObject)
  public
    XOffset:Single;//f98
    YOffset:Single;//f9C
    XScope:Single;//fA0
    YScope:Single;//fA4
    Width:Single;//fA8
    Height:Single;//fAC
    XTiles:Cardinal;//fB0
    YTiles:Cardinal;//fB4
    Style:TPlaneStyles;//fB8
    NoZWrite:Boolean;//fB9
    procedure Assign(Source:TPersistent); virtual;//v8//00484F4C
    constructor Create(AOwner:TComponent); virtual;//v2C//00484EBC
    //procedure v4C(?:?); virtual;//v4C//00484F90
    //function v54(?:?; ?:?; ?:?; ?:?):?; virtual;//v54//00484FC8
    //function v58(?:?):?; virtual;//v58//0048517C
    procedure v64; virtual;//v64//00485298
    //procedure SetWidth(Value:Single; ?:?);//004855B0
    //procedure SetHeight(Value:Single; ?:?);//004855E0
    //procedure SetXOffset(Value:Single; ?:?);//00485610
    //procedure SetXScope(Value:Single; ?:?);//00485640
    function IsStoredXScope(Value:Single):Boolean;//0048568C
    procedure SetXTiles(Value:Cardinal);//004856A8
    //procedure SetYOffset(Value:Single; ?:?);//004856C8
    //procedure SetYScope(Value:Single; ?:?);//004856F8
    function IsStoredYScope(Value:Single):Boolean;//00485744
    procedure SetYTiles(Value:Cardinal);//00485760
    procedure SetStyle(Value:TPlaneStyles);//00485780
  end;
  TGLSprite = class(TGLSceneObject)
  public
    Width:Single;//f98
    Height:Single;//f9C
    Rotation:Single;//fA0
    AlphaChannel:Single;//fA4
    NoZWrite:Boolean;//fA8
    MirrorU:Boolean;//fA9
    MirrorV:Boolean;//fAA
    procedure Assign(Source:TPersistent); virtual;//v8//00485810
    constructor Create(AOwner:TComponent); virtual;//v2C//004857AC
    //procedure v4C(?:?); virtual;//v4C//00485874
    //procedure v64(?:?); virtual;//v64//004858B8
    //procedure SetWidth(Value:Single; ?:?);//00485BA4
    //procedure SetHeight(Value:Single; ?:?);//00485BCC
    //procedure SetRotation(Value:Single; ?:?);//00485BF4
    //procedure SetAlphaChannel(Value:Single; ?:?);//00485C1C
    function IsStoredAlphaChannel(Value:Single):Boolean;//00485C80
    procedure SetNoZWrite(Value:Boolean);//00485C9C
    procedure SetMirrorU(Value:Boolean);//00485CB0
    procedure SetMirrorV(Value:Boolean);//00485CC4
  end;
  TGLPointStyle = (psSquare, psRound, psSmooth, psSmoothAdditive, psSquareAdditive);
  TGLPointParameters = class(TGLUpdateAbleObject)
  public
    Enabled:Boolean;//f18
    MinSize:Single;//f1C
    MaxSize:Single;//f20
    FadeTresholdSize:Single;//f24
    DistanceAttenuation:TGLCoordinates;//f28
    destructor Destroy; virtual;//00485D3C
    //procedure v4(?:?); virtual;//v4//00485DA8
    procedure Assign(Source:TPersistent); virtual;//v8//00485D6C
    constructor Create; virtual;//vC//00485CD8
    procedure SetEnabled(Value:Boolean);//00485F54
    //procedure SetMinSize(Value:Single; ?:?);//00485F64
    //procedure SetMaxSize(Value:Single; ?:?);//00485FA0
    //procedure SetFadeTresholdSize(Value:Single; ?:?);//00485FDC
    procedure SetDistanceAttenuation(Value:TGLCoordinates);//00486018
  end;
  TGLPoints = class(TGLImmaterialSceneObject)
  public
    f98:TAffineVectorList;//f98
    f9C:TVectorList;//f9C
    Size:Single;//fA0
    Style:TGLPointStyle;//fA4
    PointParameters:TGLPointParameters;//fA8
    NoZWrite:Boolean;//fAC
    Static:Boolean;//fAD
    destructor Destroy; virtual;//004860B4
    procedure Assign(Source:TPersistent); virtual;//v8//004860FC
    constructor Create(AOwner:TComponent); virtual;//v2C//00486024
    procedure v64; virtual;//v64//00486168
    function IsStoredSize(Value:Single):Boolean;//0048644C
    procedure SetNoZWrite(Value:Boolean);//00486464
    procedure SetStatic(Value:Boolean);//00486484
    //procedure SetSize(Value:Single; ?:?);//004864C4
    procedure SetStyle(Value:TGLPointStyle);//004864F4
    procedure SetPointParameters(Value:TGLPointParameters);//00486514
  end;
  TLineNodesAspect = (lnaInvisible, lnaAxes, lnaCube, lnaDodecahedron);
  TLineSplineMode = (lsmLines, lsmCubicSpline, lsmBezierSpline, lsmNURBSCurve, lsmSegments);
  TGLLinesNode = class(TGLNode)
  public
    Color:TGLColor;//f1C
    destructor Destroy; virtual;//00486864
    procedure Assign(Source:TPersistent); virtual;//v8//00486894
    constructor Create(Collection:TCollection); virtual;//v1C//004867D8
    procedure SetColor(Value:TGLColor);//004868C4
    procedure IsStoredColor(Value:TGLColor);//004868E8
  end;
  TGLLinesNodes = class(TGLNodes)
  public
    procedure v28; virtual;//v28//00486958
    constructor Create;//0048691C
  end;
  TGLLineBase = class(TGLImmaterialSceneObject)
  public
    LineColor:TGLColor;//f98
    LinePattern:word;//f9C
    LineWidth:Single;//fA0
    AntiAliased:Boolean;//fA4
    destructor Destroy; virtual;//0048659C
    procedure Assign(Source:TPersistent); virtual;//v8//00486678
    constructor Create(AOwner:TComponent); virtual;//v2C//00486520
    procedure SetLineColor(Value:TGLColor);//004865CC
    procedure SetLinePattern(Value:Word);//004865EC
    //procedure SetLineWidth(Value:Single; ?:?);//0048660C
    function IsStoredLineWidth(Value:Single):Boolean;//0048663C
    procedure SetAntiAliased(Value:Boolean);//00486658
  end;
  TGLNodedLines = class(TGLLineBase)
  public
    Nodes:TGLLinesNodes;//fA8
    NodesAspect:TLineNodesAspect;//fAC
    NodeColor:TGLColor;//fB0
    NodeSize:Single;//fB4
    //fB8:?;//fB8
    destructor Destroy; virtual;//00486A3C
    procedure Assign(Source:TPersistent); virtual;//v8//00486BA4
    constructor Create(AOwner:TComponent); virtual;//v2C//00486990
    //procedure v4C(?:?); virtual;//v4C//00486D80
    procedure SetNodesAspect(Value:TLineNodesAspect);//00486A78
    procedure SetNodeColor(Value:TGLColor);//00486A98
    procedure SetNodes(Value:TGLLinesNodes);//00486B2C
    //procedure SetNodeSize(Value:Single; ?:?);//00486B48
    function IsStoredNodeSize(Value:Single):Boolean;//00486B88
  end;
  TLinesOption = (loUseNodeColorForLines);
  TLinesOptions = set of TLinesOption;
  TGLLines = class(TGLNodedLines)
  public
    Division:Integer;//fC8
    SplineMode:TLineSplineMode;//fCC
    Options:TLinesOptions;//fCD
    fD0:dword;//fD0
    fD4:dword;//fD4
    fD8:TSingleList;//fD8
    destructor Destroy; virtual;//00486E40
    procedure Assign(Source:TPersistent); virtual;//v8//00486EDC
    constructor Create(AOwner:TComponent); virtual;//v2C//00486DD4
    //procedure v64(?:?); virtual;//v64//00486F70
    procedure SetDivision(Value:Integer);//00486E70
    procedure SetOptions(Value:TLinesOptions);//00486EA0
    procedure SetSplineMode(Value:TLineSplineMode);//00486EBC
  end;
  TCubePart = (cpTop, cpBottom, cpFront, cpBack, cpLeft, cpRight);
  TCubeParts = set of TCubePart;
  TGLCube = class(TGLSceneObject)
  public
    CubeWidth:Single;//f98
    CubeHeight:Single;//f9C
    CubeDepth:Single;//fA0
    Parts:TCubeParts;//fA4
    NormalDirection:TNormalDirection;//fA5
    procedure DefineProperties(Filer:TFiler); virtual;//v4//004883C4
    procedure Assign(Source:TPersistent); virtual;//v8//0048808C
    constructor Create(AOwner:TComponent); virtual;//v2C//004875A0
    //procedure v4C(?:?); virtual;//v4C//004880F4
    //function v54(?:?; ?:?; ?:?; ?:?):?; virtual;//v54//00488130
    //procedure v58(?:?); virtual;//v58//00487B10
    procedure v64; virtual;//v64//0048761C
    //procedure SetCubeWidth(Value:Single; ?:?);//00487FB0
    //procedure SetCubeHeight(Value:Single; ?:?);//00487FE0
    //procedure SetCubeDepth(Value:Single; ?:?);//00488010
    procedure SetParts(Value:TCubeParts);//00488040
    procedure SetNormalDirection(Value:TNormalDirection);//0048806C
  end;
  TNormalSmoothing = (nsFlat, nsSmooth, nsNone);
  TGLQuadricObject = class(TGLSceneObject)
  public
    Normals:TNormalSmoothing;//f98
    NormalDirection:TNormalDirection;//f99
    procedure Assign(Source:TPersistent); virtual;//v8//004884EC
    constructor Create(AOwner:TComponent); virtual;//v2C//00488468
    procedure SetNormals(Value:TNormalSmoothing);//004884AC
    procedure SetNormalDirection(Value:TNormalDirection);//004884CC
  end;
  TCapType = (ctNone, ctCenter, ctFlat);
  TGLSphere = class(TGLQuadricObject)
  public
    Radius:Single;//fA0
    Slices:Integer;//fA4
    Stacks:Integer;//fA8
    Top:TAngleLimit1;//fAC
    Bottom:TAngleLimit1;//fAD
    Start:TAngleLimit2;//fAE
    Stop:TAngleLimit2;//fB0
    TopCap:TCapType;//fB2
    BottomCap:TCapType;//fB3
    procedure Assign(Source:TPersistent); virtual;//v8//004892D8
    constructor Create(AOwner:TComponent); virtual;//v2C//00488530
    //procedure v4C(?:?); virtual;//v4C//0048935C
    //function v54(?:?; ?:?; ?:?; ?:?):?; virtual;//v54//00488E5C
    //procedure v58(?:?); virtual;//v58//00488F18
    //procedure v64(?:?); virtual;//v64//004885A4
    procedure SetBottom(Value:TAngleLimit1);//00489090
    procedure SetBottomCap(Value:TCapType);//004890B0
    //procedure SetRadius(Value:Single; ?:?);//004890D0
    procedure SetSlices(Value:Integer);//00489100
    procedure SetStacks(Value:Integer);//00489130
    procedure SetStart(Value:TAngleLimit2);//00489160
    procedure SetStop(Value:TAngleLimit2);//004891FC
    procedure SetTop(Value:TAngleLimit1);//00489298
    procedure SetTopCap(Value:TCapType);//004892B8
  end;
  .61 = array of ?;
//elSize = C;
  .71 = array of ?;
//elSize = 10;
    //procedure sub_00484790(?:?; ?:?; ?:?; ?:?);//00484790
    procedure sub_00484944;//00484944
    constructor Create(AOwner:TComponent);//004849C8
    destructor Destroy;//00484A60
    procedure Assign(Source:TPersistent);//00484A9C
    //procedure sub_00484AF8(?:?);//00484AF8
    procedure sub_00484B28;//00484B28
    //procedure sub_00484B34(?:?);//00484B34
    //procedure sub_00484B5C(?:?; ?:?; ?:?);//00484B5C
    procedure sub_0047CEC8;//00484D40
    //procedure sub_00484D60(?:?);//00484D60
    constructor Create(AOwner:TComponent);//00484EBC
    procedure Assign(Source:TPersistent);//00484F4C
    //procedure sub_00484F90(?:?);//00484F90
    //function sub_00484FC8(?:?; ?:?; ?:?; ?:?):?;//00484FC8
    //function sub_0048517C(?:?):?;//0048517C
    procedure sub_00485298;//00485298
    constructor Create(AOwner:TComponent);//004857AC
    procedure Assign(Source:TPersistent);//00485810
    //procedure sub_00485874(?:?);//00485874
    //procedure sub_004858B8(?:?);//004858B8
    constructor Create;//00485CD8
    destructor Destroy;//00485D3C
    procedure Assign(Source:TPersistent);//00485D6C
    //procedure sub_00485DA8(?:?);//00485DA8
    procedure sub_00485E98(?:TGLPointParameters);//00485E98
    procedure sub_00485EF8(?:TGLPointParameters);//00485EF8
    constructor Create(AOwner:TComponent);//00486024
    destructor Destroy;//004860B4
    procedure Assign(Source:TPersistent);//004860FC
    procedure sub_00486168;//00486168
    constructor Create(AOwner:TComponent);//00486520
    destructor Destroy;//0048659C
    procedure Assign(Source:TPersistent);//00486678
    procedure sub_004866D8(?:TGLLines);//004866D8
    procedure sub_004867D0;//004867D0
    constructor Create(Collection:TCollection);//004867D8
    destructor Destroy;//00486864
    procedure Assign(Source:TPersistent);//00486894
    //procedure sub_004868D0(?:?);//004868D0
    procedure sub_00486958;//00486958
    constructor Create(AOwner:TComponent);//00486990
    destructor Destroy;//00486A3C
    //procedure sub_00486AB8(?:?);//00486AB8
    procedure Assign(Source:TPersistent);//00486BA4
    //procedure sub_00486C04(?:TGLLines; ?:?; ?:?; ?:?; ?:?; ?:?);//00486C04
    //procedure sub_00486D80(?:?);//00486D80
    constructor Create(AOwner:TComponent);//00486DD4
    destructor Destroy;//00486E40
    procedure Assign(Source:TPersistent);//00486EDC
    //procedure sub_00486F70(?:?);//00486F70
    constructor Create(AOwner:TComponent);//004875A0
    procedure sub_0048761C;//0048761C
    //procedure sub_00487B10(?:?);//00487B10
    procedure Assign(Source:TPersistent);//0048808C
    //procedure sub_004880F4(?:?);//004880F4
    //function sub_00488130(?:?; ?:?; ?:?; ?:?):?;//00488130
    procedure DefineProperties(Filer:TFiler);//004883C4
    constructor Create(AOwner:TComponent);//00488468
    procedure Assign(Source:TPersistent);//004884EC
    constructor Create(AOwner:TComponent);//00488530
    //procedure sub_004885A4(?:?);//004885A4
    //function sub_00488E5C(?:?; ?:?; ?:?; ?:?):?;//00488E5C
    //procedure sub_00488F18(?:?);//00488F18
    procedure Assign(Source:TPersistent);//004892D8
    //procedure sub_0048935C(?:?);//0048935C

implementation

//00484790
{*procedure sub_00484790(?:?; ?:?; ?:?; ?:?);
begin
 00484790    push        ebp
 00484791    mov         ebp,esp
 00484793    add         esp,0FFFFFFF8
 00484796    push        ebx
 00484797    push        esi
 00484798    push        edi
 00484799    mov         esi,ecx
 0048479B    mov         ebx,edx
 0048479D    mov         edi,eax
 0048479F    push        6045
 004847A4    call        OpenGL32.glPushAttrib
 004847A9    push        0B50
 004847AE    call        OpenGL32.glDisable
 004847B3    push        0B20
 004847B8    call        OpenGL32.glEnable
 004847BD    test        bl,bl
>004847BF    je          004847F0
 004847C1    push        0B24
 004847C6    call        OpenGL32.glEnable
 004847CB    push        0BE2
 004847D0    call        OpenGL32.glEnable
 004847D5    push        303
 004847DA    push        302
 004847DF    call        OpenGL32.glBlendFunc
 004847E4    push        0CCCC
 004847E9    push        1
 004847EB    call        OpenGL32.glLineStipple
 004847F0    push        3F800000
 004847F5    call        OpenGL32.glLineWidth
 004847FA    fld         dword ptr ds:[484940];0.5:Single
 00484800    fmul        dword ptr [ebp+8]
 00484803    fstp        dword ptr [ebp-8]
 00484806    wait
 00484807    fld         dword ptr [ebp-8]
 0048480A    fchs
 0048480C    fstp        dword ptr [ebp-4]
 0048480F    wait
 00484810    mov         eax,dword ptr [edi+5C]
 00484813    call        0046D830
 00484818    push        1600
 0048481D    push        404
 00484822    call        OpenGL32.glColorMaterial
 00484827    push        0B57
 0048482C    call        OpenGL32.glEnable
 00484831    push        esi
 00484832    call        OpenGL32.glColor4fv
 00484837    push        3
 00484839    call        OpenGL32.glBegin
 0048483E    push        dword ptr [ebp-4]
 00484841    push        dword ptr [ebp-4]
 00484844    push        dword ptr [ebp-8]
 00484847    call        OpenGL32.glVertex3f
 0048484C    push        dword ptr [ebp-4]
 0048484F    push        dword ptr [ebp-8]
 00484852    push        dword ptr [ebp-8]
 00484855    call        OpenGL32.glVertex3f
 0048485A    push        dword ptr [ebp-8]
 0048485D    push        dword ptr [ebp-8]
 00484860    push        dword ptr [ebp-8]
 00484863    call        OpenGL32.glVertex3f
 00484868    push        dword ptr [ebp-8]
 0048486B    push        dword ptr [ebp-4]
 0048486E    push        dword ptr [ebp-8]
 00484871    call        OpenGL32.glVertex3f
 00484876    push        dword ptr [ebp-4]
 00484879    push        dword ptr [ebp-4]
 0048487C    push        dword ptr [ebp-8]
 0048487F    call        OpenGL32.glVertex3f
 00484884    push        dword ptr [ebp-4]
 00484887    push        dword ptr [ebp-4]
 0048488A    push        dword ptr [ebp-4]
 0048488D    call        OpenGL32.glVertex3f
 00484892    push        dword ptr [ebp-8]
 00484895    push        dword ptr [ebp-4]
 00484898    push        dword ptr [ebp-4]
 0048489B    call        OpenGL32.glVertex3f
 004848A0    push        dword ptr [ebp-8]
 004848A3    push        dword ptr [ebp-8]
 004848A6    push        dword ptr [ebp-4]
 004848A9    call        OpenGL32.glVertex3f
 004848AE    push        dword ptr [ebp-4]
 004848B1    push        dword ptr [ebp-8]
 004848B4    push        dword ptr [ebp-4]
 004848B7    call        OpenGL32.glVertex3f
 004848BC    push        dword ptr [ebp-4]
 004848BF    push        dword ptr [ebp-8]
 004848C2    push        dword ptr [ebp-8]
 004848C5    call        OpenGL32.glVertex3f
 004848CA    call        OpenGL32.glEnd
 004848CF    push        1
 004848D1    call        OpenGL32.glBegin
 004848D6    push        dword ptr [ebp-8]
 004848D9    push        dword ptr [ebp-8]
 004848DC    push        dword ptr [ebp-8]
 004848DF    call        OpenGL32.glVertex3f
 004848E4    push        dword ptr [ebp-8]
 004848E7    push        dword ptr [ebp-8]
 004848EA    push        dword ptr [ebp-4]
 004848ED    call        OpenGL32.glVertex3f
 004848F2    push        dword ptr [ebp-4]
 004848F5    push        dword ptr [ebp-4]
 004848F8    push        dword ptr [ebp-4]
 004848FB    call        OpenGL32.glVertex3f
 00484900    push        dword ptr [ebp-4]
 00484903    push        dword ptr [ebp-8]
 00484906    push        dword ptr [ebp-4]
 00484909    call        OpenGL32.glVertex3f
 0048490E    push        dword ptr [ebp-8]
 00484911    push        dword ptr [ebp-4]
 00484914    push        dword ptr [ebp-8]
 00484917    call        OpenGL32.glVertex3f
 0048491C    push        dword ptr [ebp-8]
 0048491F    push        dword ptr [ebp-4]
 00484922    push        dword ptr [ebp-4]
 00484925    call        OpenGL32.glVertex3f
 0048492A    call        OpenGL32.glEnd
 0048492F    call        OpenGL32.glPopAttrib
 00484934    pop         edi
 00484935    pop         esi
 00484936    pop         ebx
 00484937    pop         ecx
 00484938    pop         ecx
 00484939    pop         ebp
 0048493A    ret         4
end;*}

//00484944
procedure sub_00484944;
begin
{*
 00484944    push        ebx
 00484945    push        esi
 00484946    push        edi
 00484947    push        ebp
 00484948    add         esp,0FFFFFFF4
 0048494B    mov         ebp,0C
 00484950    mov         edi,5AD684
 00484955    mov         esi,edi
 00484957    push        esp
 00484958    xor         eax,eax
 0048495A    mov         al,byte ptr [esi+2]
 0048495D    lea         eax,[eax+eax*2]
 00484960    lea         ecx,[eax*4+5AD594]
 00484967    xor         eax,eax
 00484969    mov         al,byte ptr [esi+1]
 0048496C    lea         eax,[eax+eax*2]
 0048496F    lea         edx,[eax*4+5AD594]
 00484976    xor         eax,eax
 00484978    mov         al,byte ptr [esi]
 0048497A    lea         eax,[eax+eax*2]
 0048497D    lea         eax,[eax*4+5AD594]
 00484984    call        0045EC8C
 00484989    push        esp
 0048498A    call        OpenGL32.glNormal3fv
 0048498F    push        6
 00484991    call        OpenGL32.glBegin
 00484996    xor         ebx,ebx
 00484998    xor         eax,eax
 0048499A    mov         al,byte ptr [esi+ebx]
 0048499D    lea         eax,[eax+eax*2]
 004849A0    lea         eax,[eax*4+5AD594]
 004849A7    push        eax
 004849A8    call        OpenGL32.glVertex3fv
 004849AD    inc         ebx
 004849AE    cmp         ebx,5
>004849B1    jne         00484998
 004849B3    call        OpenGL32.glEnd
 004849B8    add         edi,5
 004849BB    dec         ebp
>004849BC    jne         00484955
 004849BE    add         esp,0C
 004849C1    pop         ebp
 004849C2    pop         edi
 004849C3    pop         esi
 004849C4    pop         ebx
 004849C5    ret
*}
end;

//004849C8
constructor TGLDummyCube.Create(AOwner:TComponent);
begin
{*
 004849C8    push        ebp
 004849C9    mov         ebp,esp
 004849CB    push        ecx
 004849CC    push        ebx
 004849CD    push        esi
 004849CE    test        dl,dl
>004849D0    je          004849DA
 004849D2    add         esp,0FFFFFFF0
 004849D5    call        @ClassCreate
 004849DA    mov         byte ptr [ebp-1],dl
 004849DD    mov         ebx,eax
 004849DF    xor         edx,edx
 004849E1    mov         eax,ebx
 004849E3    call        TGLCameraInvariantObject.Create
 004849E8    mov         al,byte ptr [ebx+3C];TGLDummyCube.?f3C:byte
 004849EB    or          al,byte ptr ds:[484A5C];0x1 gvar_00484A5C
 004849F1    mov         byte ptr [ebx+3C],al;TGLDummyCube.?f3C:byte
 004849F4    mov         dword ptr [ebx+0A0],3F800000;TGLDummyCube.CubeSize:Single
 004849FE    mov         ecx,ebx
 00484A00    mov         dl,1
 00484A02    mov         eax,[00470BF8];TGLColor
 00484A07    call        TGLColor.Create;TGLColor.Create
 00484A0C    mov         esi,eax
 00484A0E    mov         dword ptr [ebx+0A4],esi;TGLDummyCube.EdgeColor:TGLColor
 00484A14    mov         edx,dword ptr ds:[5AE830];^gvar_005AD44C
 00484A1A    mov         eax,esi
 00484A1C    call        00472B10
 00484A21    mov         dl,1
 00484A23    mov         eax,[0046C0B0];TGLListHandle
 00484A28    call        TGLVirtualHandle.Create;TGLListHandle.Create
 00484A2D    mov         dword ptr [ebx+0AC],eax;TGLDummyCube.?fAC:TGLListHandle
 00484A33    xor         edx,edx
 00484A35    mov         eax,ebx
 00484A37    call        TGLDummyCube.SetCamInvarianceMode
 00484A3C    mov         eax,ebx
 00484A3E    cmp         byte ptr [ebp-1],0
>00484A42    je          00484A53
 00484A44    call        @AfterConstruction
 00484A49    pop         dword ptr fs:[0]
 00484A50    add         esp,0C
 00484A53    mov         eax,ebx
 00484A55    pop         esi
 00484A56    pop         ebx
 00484A57    pop         ecx
 00484A58    pop         ebp
 00484A59    ret
*}
end;

//00484A60
destructor TGLDummyCube.Destroy;
begin
{*
 00484A60    push        ebx
 00484A61    push        esi
 00484A62    call        @BeforeDestruction
 00484A67    mov         ebx,edx
 00484A69    mov         esi,eax
 00484A6B    mov         eax,dword ptr [esi+0AC];TGLDummyCube.?fAC:TGLListHandle
 00484A71    call        TObject.Free
 00484A76    mov         eax,dword ptr [esi+0A4];TGLDummyCube.EdgeColor:TGLColor
 00484A7C    call        TObject.Free
 00484A81    mov         edx,ebx
 00484A83    and         dl,0FC
 00484A86    mov         eax,esi
 00484A88    call        TGLCustomSceneObject.Destroy
 00484A8D    test        bl,bl
>00484A8F    jle         00484A98
 00484A91    mov         eax,esi
 00484A93    call        @ClassDestroy
 00484A98    pop         esi
 00484A99    pop         ebx
 00484A9A    ret
*}
end;

//00484A9C
procedure TGLDummyCube.Assign(Source:TPersistent);
begin
{*
 00484A9C    push        ebx
 00484A9D    push        esi
 00484A9E    push        edi
 00484A9F    mov         esi,edx
 00484AA1    mov         ebx,eax
 00484AA3    mov         eax,esi
 00484AA5    mov         edx,dword ptr ds:[483080];TGLDummyCube
 00484AAB    call        @IsClass
 00484AB0    test        al,al
>00484AB2    je          00484AEB
 00484AB4    mov         edi,esi
 00484AB6    mov         eax,dword ptr [edi+0A0]
 00484ABC    mov         dword ptr [ebx+0A0],eax;TGLDummyCube.CubeSize:Single
 00484AC2    mov         eax,dword ptr [edi+0A4]
 00484AC8    lea         edx,[eax+18]
 00484ACB    mov         eax,dword ptr [ebx+0A4];TGLDummyCube.EdgeColor:TGLColor
 00484AD1    call        00472B48
 00484AD6    mov         al,byte ptr [edi+0A8]
 00484ADC    mov         byte ptr [ebx+0A8],al;TGLDummyCube.VisibleAtRunTime:Boolean
 00484AE2    mov         edx,ebx
 00484AE4    mov         eax,ebx
 00484AE6    mov         ecx,dword ptr [eax]
 00484AE8    call        dword ptr [ecx+34];TGLDummyCube.sub_0047DACC
 00484AEB    mov         edx,esi
 00484AED    mov         eax,ebx
 00484AEF    call        TGLCameraInvariantObject.Assign
 00484AF4    pop         edi
 00484AF5    pop         esi
 00484AF6    pop         ebx
 00484AF7    ret
*}
end;

//00484AF8
{*procedure sub_00484AF8(?:?);
begin
 00484AF8    push        ebx
 00484AF9    push        esi
 00484AFA    mov         ebx,edx
 00484AFC    mov         esi,eax
 00484AFE    fld         dword ptr [esi+0A0];TGLDummyCube.CubeSize:Single
 00484B04    fabs
 00484B06    fmul        dword ptr ds:[484B24];0.5:Single
 00484B0C    fstp        dword ptr [ebx]
 00484B0E    wait
 00484B0F    mov         eax,dword ptr [ebx]
 00484B11    mov         dword ptr [ebx+4],eax
 00484B14    mov         eax,dword ptr [ebx]
 00484B16    mov         dword ptr [ebx+8],eax
 00484B19    xor         eax,eax
 00484B1B    mov         dword ptr [ebx+0C],eax
 00484B1E    pop         esi
 00484B1F    pop         ebx
 00484B20    ret
end;*}

//00484B28
procedure sub_00484B28;
begin
{*
 00484B28    push        ebp
 00484B29    mov         ebp,esp
 00484B2B    xor         eax,eax
 00484B2D    pop         ebp
 00484B2E    ret         8
*}
end;

//00484B34
{*procedure sub_00484B34(?:?);
begin
 00484B34    test        byte ptr [eax+1C],10;TGLDummyCube.FComponentState:TComponentState
>00484B38    jne         00484B43
 00484B3A    cmp         byte ptr [eax+0A8],0;TGLDummyCube.VisibleAtRunTime:Boolean
>00484B41    je          00484B5B
 00484B43    push        dword ptr [eax+0A0];TGLDummyCube.CubeSize:Single
 00484B49    mov         eax,dword ptr [eax+0A4];TGLDummyCube.EdgeColor:TGLColor
 00484B4F    lea         ecx,[eax+18];TGLColor.Red:Single
 00484B52    mov         eax,edx
 00484B54    mov         dl,1
 00484B56    call        00484790
 00484B5B    ret
end;*}

//00484B5C
{*procedure sub_00484B5C(?:?; ?:?; ?:?);
begin
 00484B5C    push        ebp
 00484B5D    mov         ebp,esp
 00484B5F    add         esp,0FFFFFEF0
 00484B65    push        ebx
 00484B66    push        esi
 00484B67    xor         ebx,ebx
 00484B69    mov         dword ptr [ebp-0C],ebx
 00484B6C    mov         dword ptr [ebp-10],ebx
 00484B6F    mov         ebx,ecx
 00484B71    mov         dword ptr [ebp-8],edx
 00484B74    mov         dword ptr [ebp-4],eax
 00484B77    xor         eax,eax
 00484B79    push        ebp
 00484B7A    push        484CDA
 00484B7F    push        dword ptr fs:[eax]
 00484B82    mov         dword ptr fs:[eax],esp
 00484B85    mov         eax,dword ptr [ebp-4]
 00484B88    cmp         word ptr [eax+0B2],0;TGLDummyCube.?fB2:word
>00484B90    je          00484BAF
 00484B92    mov         ecx,dword ptr [ebp-8]
 00484B95    mov         esi,dword ptr [ebp-4]
 00484B98    mov         edx,dword ptr [ebp-4]
 00484B9B    mov         eax,dword ptr [esi+0B4];TGLDummyCube.?fB4:dword
 00484BA1    call        dword ptr [esi+0B0];TGLDummyCube.OnVisibilityDetermination
 00484BA7    test        al,al
>00484BA9    je          00484CBF
 00484BAF    mov         eax,dword ptr [ebp-4]
 00484BB2    cmp         byte ptr [eax+0A9],0;TGLDummyCube.Amalgamate:Boolean
>00484BB9    je          00484CAE
 00484BBF    mov         eax,dword ptr [ebp-8]
 00484BC2    cmp         byte ptr [eax+0FC],0
>00484BC9    jne         00484CAE
 00484BCF    mov         eax,dword ptr [ebp-4]
 00484BD2    mov         eax,dword ptr [eax+0AC];TGLDummyCube.?fAC:TGLListHandle
 00484BD8    cmp         dword ptr [eax+8],0;TGLListHandle.?f8:dword
>00484BDC    jne         00484C9A
 00484BE2    call        0046CEE8
 00484BE7    mov         eax,dword ptr [ebp-4]
 00484BEA    mov         eax,dword ptr [eax+0AC];TGLDummyCube.?fAC:TGLListHandle
 00484BF0    cmp         dword ptr [eax+8],0;TGLListHandle.?f8:dword
>00484BF4    jne         00484C36
 00484BF6    lea         edx,[ebp-110]
 00484BFC    mov         eax,dword ptr [ebp-4]
 00484BFF    mov         eax,dword ptr [eax]
 00484C01    call        TObject.ClassName
 00484C06    lea         edx,[ebp-110]
 00484C0C    lea         eax,[ebp-10]
 00484C0F    call        @LStrFromString
 00484C14    mov         ecx,dword ptr [ebp-10]
 00484C17    lea         eax,[ebp-0C]
 00484C1A    mov         edx,484CF4;'Handle=0 for '
 00484C1F    call        @LStrCat3
 00484C24    mov         eax,dword ptr [ebp-0C]
 00484C27    mov         ecx,439
 00484C2C    mov         edx,484D0C;'C:\GLScene\glscene_v_1000714\Source\GLObjects.pas'
 00484C31    call        @Assert
 00484C36    push        1300
 00484C3B    mov         eax,dword ptr [ebp-4]
 00484C3E    mov         eax,dword ptr [eax+0AC];TGLDummyCube.?fAC:TGLListHandle
 00484C44    mov         eax,dword ptr [eax+8];TGLListHandle.?f8:dword
 00484C47    push        eax
 00484C48    call        OpenGL32.glNewList
 00484C4D    mov         eax,dword ptr [ebp-8]
 00484C50    mov         byte ptr [eax+0FC],1
 00484C57    xor         eax,eax
 00484C59    push        ebp
 00484C5A    push        484C93
 00484C5F    push        dword ptr fs:[eax]
 00484C62    mov         dword ptr fs:[eax],esp
 00484C65    mov         al,byte ptr [ebp+8]
 00484C68    push        eax
 00484C69    mov         edx,dword ptr [ebp-8]
 00484C6C    mov         ecx,ebx
 00484C6E    mov         eax,dword ptr [ebp-4]
 00484C71    call        0047F14C
 00484C76    xor         eax,eax
 00484C78    pop         edx
 00484C79    pop         ecx
 00484C7A    pop         ecx
 00484C7B    mov         dword ptr fs:[eax],edx
 00484C7E    push        484C9A
 00484C83    mov         eax,dword ptr [ebp-8]
 00484C86    mov         byte ptr [eax+0FC],0
 00484C8D    call        OpenGL32.glEndList
 00484C92    ret
>00484C93    jmp         @HandleFinally
>00484C98    jmp         00484C83
 00484C9A    mov         eax,dword ptr [ebp-4]
 00484C9D    mov         eax,dword ptr [eax+0AC];TGLDummyCube.?fAC:TGLListHandle
 00484CA3    mov         eax,dword ptr [eax+8];TGLListHandle.?f8:dword
 00484CA6    push        eax
 00484CA7    call        OpenGL32.glCallList
>00484CAC    jmp         00484CBF
 00484CAE    mov         al,byte ptr [ebp+8]
 00484CB1    push        eax
 00484CB2    mov         edx,dword ptr [ebp-8]
 00484CB5    mov         ecx,ebx
 00484CB7    mov         eax,dword ptr [ebp-4]
 00484CBA    call        0047F14C
 00484CBF    xor         eax,eax
 00484CC1    pop         edx
 00484CC2    pop         ecx
 00484CC3    pop         ecx
 00484CC4    mov         dword ptr fs:[eax],edx
 00484CC7    push        484CE1
 00484CCC    lea         eax,[ebp-10]
 00484CCF    mov         edx,2
 00484CD4    call        @LStrArrayClr
 00484CD9    ret
>00484CDA    jmp         @HandleFinally
>00484CDF    jmp         00484CCC
 00484CE1    pop         esi
 00484CE2    pop         ebx
 00484CE3    mov         esp,ebp
 00484CE5    pop         ebp
 00484CE6    ret         4
end;*}

//00484D40
procedure TGLDummyCube.sub_0047CEC8;
begin
{*
 00484D40    push        ebx
 00484D41    mov         ebx,eax
 00484D43    cmp         byte ptr [ebx+0A9],0;TGLDummyCube.Amalgamate:Boolean
>00484D4A    je          00484D57
 00484D4C    mov         eax,dword ptr [ebx+0AC];TGLDummyCube.?fAC:TGLListHandle
 00484D52    call        0046CFA8
 00484D57    mov         eax,ebx
 00484D59    call        TGLBaseSceneObject.sub_0047CEC8
 00484D5E    pop         ebx
 00484D5F    ret
*}
end;

//00484D60
{*procedure sub_00484D60(?:?);
begin
 00484D60    push        ebx
 00484D61    push        esi
 00484D62    push        edi
 00484D63    push        ebp
 00484D64    add         esp,0FFFFFFDC
 00484D67    mov         esi,edx
 00484D69    mov         ebx,eax
 00484D6B    mov         eax,ebx
 00484D6D    call        0047BA94
 00484D72    test        eax,eax
>00484D74    jle         00484DEF
 00484D76    xor         edx,edx
 00484D78    mov         eax,ebx
 00484D7A    call        0047BA74
 00484D7F    mov         edx,esi
 00484D81    mov         ecx,dword ptr [eax]
 00484D83    call        dword ptr [ecx+48]
 00484D86    mov         eax,ebx
 00484D88    call        0047BA94
 00484D8D    mov         edi,eax
 00484D8F    dec         edi
 00484D90    test        edi,edi
>00484D92    jle         00484DCA
 00484D94    mov         ebp,1
 00484D99    mov         edx,ebp
 00484D9B    mov         eax,ebx
 00484D9D    call        0047BA74
 00484DA2    lea         edx,[esp+10]
 00484DA6    mov         ecx,dword ptr [eax]
 00484DA8    call        dword ptr [ecx+48]
 00484DAB    lea         edx,[esp+10]
 00484DAF    mov         ecx,esp
 00484DB1    mov         eax,esi
 00484DB3    call        0045CA94
 00484DB8    push        esi
 00484DB9    push        edi
 00484DBA    mov         edi,esi
 00484DBC    lea         esi,[esp+8]
 00484DC0    movs        dword ptr [edi],dword ptr [esi]
 00484DC1    movs        dword ptr [edi],dword ptr [esi]
 00484DC2    movs        dword ptr [edi],dword ptr [esi]
 00484DC3    movs        dword ptr [edi],dword ptr [esi]
 00484DC4    pop         edi
 00484DC5    pop         esi
 00484DC6    inc         ebp
 00484DC7    dec         edi
>00484DC8    jne         00484D99
 00484DCA    mov         eax,ebx
 00484DCC    call        0047BA94
 00484DD1    mov         dword ptr [esp+20],eax
 00484DD5    fild        dword ptr [esp+20]
 00484DD9    fdivr       dword ptr ds:[484E00];1:Single
 00484DDF    add         esp,0FFFFFFFC
 00484DE2    fstp        dword ptr [esp]
 00484DE5    wait
 00484DE6    mov         eax,esi
 00484DE8    call        0045D78C
>00484DED    jmp         00484DF8
 00484DEF    mov         edx,esi
 00484DF1    mov         eax,ebx
 00484DF3    call        0047BD64
 00484DF8    add         esp,24
 00484DFB    pop         ebp
 00484DFC    pop         edi
 00484DFD    pop         esi
 00484DFE    pop         ebx
 00484DFF    ret
end;*}

//00484E04
{*procedure TGLDummyCube.SetCubeSize(Value:Single; ?:?);
begin
 00484E04    push        ebp
 00484E05    mov         ebp,esp
 00484E07    push        esi
 00484E08    mov         edx,eax
 00484E0A    fld         dword ptr [ebp+8]
 00484E0D    fcomp       dword ptr [edx+0A0];TGLDummyCube.CubeSize:Single
 00484E13    fnstsw      al
 00484E15    sahf
>00484E16    je          00484E2C
 00484E18    mov         eax,dword ptr [ebp+8]
 00484E1B    mov         dword ptr [edx+0A0],eax;TGLDummyCube.CubeSize:Single
 00484E21    mov         eax,edx
 00484E23    mov         si,0FFE7
 00484E27    call        @CallDynaInst;TGLDummyCube.sub_0047CEC8
 00484E2C    pop         esi
 00484E2D    pop         ebp
 00484E2E    ret         4
end;*}

//00484E34
procedure TGLDummyCube.SetEdgeColor(Value:TGLColor);
begin
{*
 00484E34    push        ebx
 00484E35    push        esi
 00484E36    mov         ebx,eax
 00484E38    mov         esi,dword ptr [ebx+0A4];TGLDummyCube.EdgeColor:TGLColor
 00484E3E    cmp         edx,esi
>00484E40    je          00484E54
 00484E42    mov         eax,esi
 00484E44    mov         ecx,dword ptr [eax]
 00484E46    call        dword ptr [ecx+8];TGLColor.Assign
 00484E49    mov         eax,ebx
 00484E4B    mov         si,0FFE7
 00484E4F    call        @CallDynaInst;TGLDummyCube.sub_0047CEC8
 00484E54    pop         esi
 00484E55    pop         ebx
 00484E56    ret
*}
end;

//00484E58
procedure TGLDummyCube.SetVisibleAtRunTime(Value:Boolean);
begin
{*
 00484E58    push        esi
 00484E59    cmp         dl,byte ptr [eax+0A8];TGLDummyCube.VisibleAtRunTime:Boolean
>00484E5F    je          00484E70
 00484E61    mov         byte ptr [eax+0A8],dl;TGLDummyCube.VisibleAtRunTime:Boolean
 00484E67    mov         si,0FFE7
 00484E6B    call        @CallDynaInst;TGLDummyCube.sub_0047CEC8
 00484E70    pop         esi
 00484E71    ret
*}
end;

//00484E74
procedure TGLDummyCube.SetAmalgamate(Value:Boolean);
begin
{*
 00484E74    push        ebx
 00484E75    mov         ebx,eax
 00484E77    cmp         dl,byte ptr [ebx+0A9];TGLDummyCube.Amalgamate:Boolean
>00484E7D    je          00484EB5
 00484E7F    mov         byte ptr [ebx+0A9],dl;TGLDummyCube.Amalgamate:Boolean
 00484E85    test        dl,dl
>00484E87    je          00484E96
 00484E89    mov         al,[00484EB8];0x2 gvar_00484EB8
 00484E8E    or          al,byte ptr [ebx+3C];TGLDummyCube.?f3C:byte
 00484E91    mov         byte ptr [ebx+3C],al;TGLDummyCube.?f3C:byte
>00484E94    jmp         00484EAE
 00484E96    mov         eax,dword ptr [ebx+0AC];TGLDummyCube.?fAC:TGLListHandle
 00484E9C    call        0046CFA8
 00484EA1    mov         al,[00484EB8];0x2 gvar_00484EB8
 00484EA6    not         eax
 00484EA8    and         al,byte ptr [ebx+3C];TGLDummyCube.?f3C:byte
 00484EAB    mov         byte ptr [ebx+3C],al;TGLDummyCube.?f3C:byte
 00484EAE    mov         eax,ebx
 00484EB0    call        TGLBaseSceneObject.sub_0047CEC8
 00484EB5    pop         ebx
 00484EB6    ret
*}
end;

//00484EBC
constructor TGLPlane.Create(AOwner:TComponent);
begin
{*
 00484EBC    push        ebx
 00484EBD    push        esi
 00484EBE    test        dl,dl
>00484EC0    je          00484ECA
 00484EC2    add         esp,0FFFFFFF0
 00484EC5    call        @ClassCreate
 00484ECA    mov         ebx,edx
 00484ECC    mov         esi,eax
 00484ECE    xor         edx,edx
 00484ED0    mov         eax,esi
 00484ED2    call        TGLCustomSceneObject.Create
 00484ED7    mov         dword ptr [esi+0A8],3F800000;TGLPlane.Width:Single
 00484EE1    mov         dword ptr [esi+0AC],3F800000;TGLPlane.Height:Single
 00484EEB    mov         dword ptr [esi+0B0],1;TGLPlane.XTiles:Cardinal
 00484EF5    mov         dword ptr [esi+0B4],1;TGLPlane.YTiles:Cardinal
 00484EFF    mov         dword ptr [esi+0A0],3F800000;TGLPlane.XScope:Single
 00484F09    mov         dword ptr [esi+0A4],3F800000;TGLPlane.YScope:Single
 00484F13    mov         al,byte ptr [esi+3C];TGLPlane.?f3C:byte
 00484F16    or          al,byte ptr ds:[484F44];0x1 gvar_00484F44
 00484F1C    mov         byte ptr [esi+3C],al;TGLPlane.?f3C:byte
 00484F1F    mov         al,[00484F48];0x3 gvar_00484F48
 00484F24    mov         byte ptr [esi+0B8],al;TGLPlane.Style:TPlaneStyles
 00484F2A    mov         eax,esi
 00484F2C    test        bl,bl
>00484F2E    je          00484F3F
 00484F30    call        @AfterConstruction
 00484F35    pop         dword ptr fs:[0]
 00484F3C    add         esp,0C
 00484F3F    mov         eax,esi
 00484F41    pop         esi
 00484F42    pop         ebx
 00484F43    ret
*}
end;

//00484F4C
procedure TGLPlane.Assign(Source:TPersistent);
begin
{*
 00484F4C    push        ebx
 00484F4D    push        esi
 00484F4E    mov         ebx,edx
 00484F50    mov         esi,eax
 00484F52    test        ebx,ebx
>00484F54    je          00484F81
 00484F56    mov         eax,ebx
 00484F58    mov         edx,dword ptr ds:[4832D0];TGLPlane
 00484F5E    call        @IsClass
 00484F63    test        al,al
>00484F65    je          00484F81
 00484F67    mov         eax,ebx
 00484F69    mov         edx,dword ptr [eax+0A8]
 00484F6F    mov         dword ptr [esi+0A8],edx;TGLPlane.Width:Single
 00484F75    mov         eax,dword ptr [eax+0AC]
 00484F7B    mov         dword ptr [esi+0AC],eax;TGLPlane.Height:Single
 00484F81    mov         edx,ebx
 00484F83    mov         eax,esi
 00484F85    call        TGLCustomSceneObject.Assign
 00484F8A    pop         esi
 00484F8B    pop         ebx
 00484F8C    ret
*}
end;

//00484F90
{*procedure sub_00484F90(?:?);
begin
 00484F90    push        ebx
 00484F91    push        esi
 00484F92    mov         esi,edx
 00484F94    mov         ebx,eax
 00484F96    fld         dword ptr [ebx+0A8];TGLPlane.Width:Single
 00484F9C    fabs
 00484F9E    fmul        dword ptr ds:[484FC4];0.5:Single
 00484FA4    fstp        dword ptr [esi]
 00484FA6    wait
 00484FA7    fld         dword ptr [ebx+0AC];TGLPlane.Height:Single
 00484FAD    fabs
 00484FAF    fmul        dword ptr ds:[484FC4];0.5:Single
 00484FB5    fstp        dword ptr [esi+4]
 00484FB8    wait
 00484FB9    xor         eax,eax
 00484FBB    mov         dword ptr [esi+8],eax
 00484FBE    pop         esi
 00484FBF    pop         ebx
 00484FC0    ret
end;*}

//00484FC8
{*function sub_00484FC8(?:?; ?:?; ?:?; ?:?):?;
begin
 00484FC8    push        ebp
 00484FC9    mov         ebp,esp
 00484FCB    add         esp,0FFFFFFA8
 00484FCE    push        ebx
 00484FCF    push        esi
 00484FD0    push        edi
 00484FD1    mov         dword ptr [ebp-4],ecx
 00484FD4    mov         ebx,edx
 00484FD6    mov         esi,eax
 00484FD8    mov         edi,dword ptr [ebp+0C]
 00484FDB    lea         ecx,[ebp-18]
 00484FDE    mov         edx,ebx
 00484FE0    mov         eax,esi
 00484FE2    call        0047BD80
 00484FE7    lea         ecx,[ebp-28]
 00484FEA    mov         edx,dword ptr [ebp-4]
 00484FED    mov         eax,esi
 00484FEF    call        0047BD80
 00484FF4    fld         dword ptr [ebp-10]
 00484FF7    fcomp       dword ptr ds:[485174];0:Single
 00484FFD    fnstsw      al
 00484FFF    sahf
>00485000    jb          004850A5
 00485006    fld         dword ptr [ebp-20]
 00485009    fcomp       dword ptr ds:[485174];0:Single
 0048500F    fnstsw      al
 00485011    sahf
>00485012    jae         0048509E
 00485018    fld         dword ptr [ebp-10]
 0048501B    fdiv        dword ptr [ebp-20]
 0048501E    fstp        dword ptr [ebp-8]
 00485021    wait
 00485022    fld         dword ptr [ebp-8]
 00485025    fmul        dword ptr [ebp-28]
 00485028    fsubr       dword ptr [ebp-18]
 0048502B    fstp        dword ptr [ebp-38]
 0048502E    wait
 0048502F    fld         dword ptr [ebp-8]
 00485032    fmul        dword ptr [ebp-24]
 00485035    fsubr       dword ptr [ebp-14]
 00485038    fstp        dword ptr [ebp-34]
 0048503B    wait
 0048503C    fld         dword ptr [ebp-38]
 0048503F    fabs
 00485041    fld         dword ptr ds:[485178];0.5:Single
 00485047    fmul        dword ptr [esi+0A8];TGLPlane.Width:Single
 0048504D    fcompp
 0048504F    fnstsw      al
 00485051    sahf
>00485052    jb          00485097
 00485054    fld         dword ptr [ebp-34]
 00485057    fabs
 00485059    fld         dword ptr ds:[485178];0.5:Single
 0048505F    fmul        dword ptr [esi+0AC];TGLPlane.Height:Single
 00485065    fcompp
 00485067    fnstsw      al
 00485069    sahf
>0048506A    jb          00485097
 0048506C    mov         bl,1
 0048506E    cmp         dword ptr [ebp+8],0
>00485072    je          00485140
 00485078    lea         edx,[ebp-48]
 0048507B    mov         eax,esi
 0048507D    call        0047BD48
 00485082    mov         eax,dword ptr [ebp+8]
 00485085    push        esi
 00485086    push        edi
 00485087    lea         esi,[ebp-48]
 0048508A    mov         edi,eax
 0048508C    movs        dword ptr [edi],dword ptr [esi]
 0048508D    movs        dword ptr [edi],dword ptr [esi]
 0048508E    movs        dword ptr [edi],dword ptr [esi]
 0048508F    movs        dword ptr [edi],dword ptr [esi]
 00485090    pop         edi
 00485091    pop         esi
>00485092    jmp         00485140
 00485097    xor         ebx,ebx
>00485099    jmp         00485140
 0048509E    xor         ebx,ebx
>004850A0    jmp         00485140
 004850A5    fld         dword ptr [ebp-20]
 004850A8    fcomp       dword ptr ds:[485174];0:Single
 004850AE    fnstsw      al
 004850B0    sahf
>004850B1    jbe         0048513E
 004850B7    fld         dword ptr [ebp-10]
 004850BA    fdiv        dword ptr [ebp-20]
 004850BD    fstp        dword ptr [ebp-8]
 004850C0    wait
 004850C1    fld         dword ptr [ebp-8]
 004850C4    fmul        dword ptr [ebp-28]
 004850C7    fsubr       dword ptr [ebp-18]
 004850CA    fstp        dword ptr [ebp-38]
 004850CD    wait
 004850CE    fld         dword ptr [ebp-8]
 004850D1    fmul        dword ptr [ebp-24]
 004850D4    fsubr       dword ptr [ebp-14]
 004850D7    fstp        dword ptr [ebp-34]
 004850DA    wait
 004850DB    fld         dword ptr [ebp-38]
 004850DE    fabs
 004850E0    fld         dword ptr ds:[485178];0.5:Single
 004850E6    fmul        dword ptr [esi+0A8];TGLPlane.Width:Single
 004850EC    fcompp
 004850EE    fnstsw      al
 004850F0    sahf
>004850F1    jb          0048513A
 004850F3    fld         dword ptr [ebp-34]
 004850F6    fabs
 004850F8    fld         dword ptr ds:[485178];0.5:Single
 004850FE    fmul        dword ptr [esi+0AC];TGLPlane.Height:Single
 00485104    fcompp
 00485106    fnstsw      al
 00485108    sahf
>00485109    jb          0048513A
 0048510B    mov         bl,1
 0048510D    cmp         dword ptr [ebp+8],0
>00485111    je          00485140
 00485113    lea         edx,[ebp-58]
 00485116    mov         eax,esi
 00485118    call        0047BD48
 0048511D    lea         eax,[ebp-58]
 00485120    lea         edx,[ebp-48]
 00485123    call        0045D714
 00485128    mov         eax,dword ptr [ebp+8]
 0048512B    push        esi
 0048512C    push        edi
 0048512D    lea         esi,[ebp-48]
 00485130    mov         edi,eax
 00485132    movs        dword ptr [edi],dword ptr [esi]
 00485133    movs        dword ptr [edi],dword ptr [esi]
 00485134    movs        dword ptr [edi],dword ptr [esi]
 00485135    movs        dword ptr [edi],dword ptr [esi]
 00485136    pop         edi
 00485137    pop         esi
>00485138    jmp         00485140
 0048513A    xor         ebx,ebx
>0048513C    jmp         00485140
 0048513E    xor         ebx,ebx
 00485140    test        bl,bl
>00485142    je          00485168
 00485144    test        edi,edi
>00485146    je          00485168
 00485148    xor         eax,eax
 0048514A    mov         dword ptr [ebp-30],eax
 0048514D    mov         dword ptr [ebp-2C],3F800000
 00485154    lea         ecx,[ebp-48]
 00485157    lea         edx,[ebp-38]
 0048515A    mov         eax,esi
 0048515C    call        0047BDA0
 00485161    lea         esi,[ebp-48]
 00485164    movs        dword ptr [edi],dword ptr [esi]
 00485165    movs        dword ptr [edi],dword ptr [esi]
 00485166    movs        dword ptr [edi],dword ptr [esi]
 00485167    movs        dword ptr [edi],dword ptr [esi]
 00485168    mov         eax,ebx
 0048516A    pop         edi
 0048516B    pop         esi
 0048516C    pop         ebx
 0048516D    mov         esp,ebp
 0048516F    pop         ebp
 00485170    ret         8
end;*}

//0048517C
{*function sub_0048517C(?:?):?;
begin
 0048517C    push        ebx
 0048517D    push        esi
 0048517E    push        edi
 0048517F    add         esp,0FFFFFFF8
 00485182    mov         edi,edx
 00485184    mov         ebx,eax
 00485186    mov         dl,1
 00485188    mov         eax,[0046E9C4];TGLSilhouette
 0048518D    call        TGLSilhouette.Create;TGLSilhouette.Create
 00485192    mov         esi,eax
 00485194    fld         dword ptr [ebx+0A8];TGLPlane.Width:Single
 0048519A    fmul        dword ptr ds:[485294];0.5:Single
 004851A0    fstp        dword ptr [esp]
 004851A3    wait
 004851A4    fld         dword ptr [ebx+0AC];TGLPlane.Height:Single
 004851AA    fmul        dword ptr ds:[485294];0.5:Single
 004851B0    fstp        dword ptr [esp+4]
 004851B4    wait
 004851B5    mov         ebx,dword ptr [esi+4];TGLSilhouette.?f4:TVectorList
 004851B8    push        dword ptr [esp]
 004851BB    push        dword ptr [esp+8]
 004851BF    push        0
 004851C1    mov         eax,ebx
 004851C3    call        00468F40
 004851C8    push        dword ptr [esp]
 004851CB    fld         dword ptr [esp+8]
 004851CF    fchs
 004851D1    add         esp,0FFFFFFFC
 004851D4    fstp        dword ptr [esp]
 004851D7    wait
 004851D8    push        0
 004851DA    mov         eax,ebx
 004851DC    call        00468F40
 004851E1    fld         dword ptr [esp]
 004851E4    fchs
 004851E6    add         esp,0FFFFFFFC
 004851E9    fstp        dword ptr [esp]
 004851EC    wait
 004851ED    fld         dword ptr [esp+8]
 004851F1    fchs
 004851F3    add         esp,0FFFFFFFC
 004851F6    fstp        dword ptr [esp]
 004851F9    wait
 004851FA    push        0
 004851FC    mov         eax,ebx
 004851FE    call        00468F40
 00485203    fld         dword ptr [esp]
 00485206    fchs
 00485208    add         esp,0FFFFFFFC
 0048520B    fstp        dword ptr [esp]
 0048520E    wait
 0048520F    push        dword ptr [esp+8]
 00485213    push        0
 00485215    mov         eax,ebx
 00485217    call        00468F40
 0048521C    mov         ebx,dword ptr [esi+8];TGLSilhouette.?f8:TIntegerList
 0048521F    mov         ecx,1
 00485224    xor         edx,edx
 00485226    mov         eax,ebx
 00485228    call        004691E0
 0048522D    mov         ecx,2
 00485232    mov         edx,1
 00485237    mov         eax,ebx
 00485239    call        004691E0
 0048523E    mov         ecx,3
 00485243    mov         edx,2
 00485248    mov         eax,ebx
 0048524A    call        004691E0
 0048524F    xor         ecx,ecx
 00485251    mov         edx,3
 00485256    mov         eax,ebx
 00485258    call        004691E0
 0048525D    cmp         byte ptr [edi+19],0
>00485261    je          00485289
 00485263    mov         ebx,dword ptr [esi+0C];TGLSilhouette.?fC:TIntegerList
 00485266    push        2
 00485268    mov         ecx,1
 0048526D    xor         edx,edx
 0048526F    mov         eax,ebx
 00485271    call        00469218
 00485276    push        0
 00485278    mov         ecx,3
 0048527D    mov         edx,2
 00485282    mov         eax,ebx
 00485284    call        00469218
 00485289    mov         eax,esi
 0048528B    pop         ecx
 0048528C    pop         edx
 0048528D    pop         edi
 0048528E    pop         esi
 0048528F    pop         ebx
 00485290    ret
end;*}

//00485298
procedure sub_00485298;
begin
{*
 00485298    push        ebx
 00485299    push        esi
 0048529A    push        edi
 0048529B    push        ebp
 0048529C    add         esp,0FFFFFFAC
 0048529F    mov         edi,eax
 004852A1    mov         ebp,dword ptr ds:[5AE164];^gvar_005E1344
 004852A7    fld         dword ptr [edi+0A8];TGLPlane.Width:Single
 004852AD    fmul        dword ptr ds:[4855AC];0.5:Single
 004852B3    fstp        dword ptr [esp]
 004852B6    wait
 004852B7    fld         dword ptr [edi+0AC];TGLPlane.Height:Single
 004852BD    fmul        dword ptr ds:[4855AC];0.5:Single
 004852C3    fstp        dword ptr [esp+4]
 004852C7    wait
 004852C8    mov         eax,[005AE464];^gvar_005ACF00
 004852CD    push        eax
 004852CE    call        OpenGL32.glNormal3fv
 004852D3    test        byte ptr [edi+0B8],2;TGLPlane.Style:TPlaneStyles
>004852DA    je          0048533C
 004852DC    mov         eax,dword ptr [edi+98];TGLPlane.XOffset:Single
 004852E2    mov         dword ptr [esp+1C],eax
 004852E6    mov         eax,dword ptr [edi+0B0];TGLPlane.XTiles:Cardinal
 004852EC    mov         dword ptr [esp+48],eax
 004852F0    xor         eax,eax
 004852F2    mov         dword ptr [esp+4C],eax
 004852F6    fild        qword ptr [esp+48]
 004852FA    fmul        dword ptr [edi+0A0];TGLPlane.XScope:Single
 00485300    fadd        dword ptr [edi+98];TGLPlane.XOffset:Single
 00485306    fstp        dword ptr [esp+20]
 0048530A    wait
 0048530B    mov         eax,dword ptr [edi+9C];TGLPlane.YOffset:Single
 00485311    mov         dword ptr [esp+24],eax
 00485315    mov         eax,dword ptr [edi+0B4];TGLPlane.YTiles:Cardinal
 0048531B    mov         dword ptr [esp+48],eax
 0048531F    xor         eax,eax
 00485321    mov         dword ptr [esp+4C],eax
 00485325    fild        qword ptr [esp+48]
 00485329    fmul        dword ptr [edi+0A4];TGLPlane.YScope:Single
 0048532F    fadd        dword ptr [edi+9C];TGLPlane.YOffset:Single
 00485335    fstp        dword ptr [esp+28]
 00485339    wait
>0048533A    jmp         0048535E
 0048533C    xor         eax,eax
 0048533E    mov         dword ptr [esp+1C],eax
 00485342    mov         eax,dword ptr [esp+1C]
 00485346    mov         dword ptr [esp+24],eax
 0048534A    mov         eax,dword ptr [edi+0A0];TGLPlane.XScope:Single
 00485350    mov         dword ptr [esp+20],eax
 00485354    mov         eax,dword ptr [edi+0A4];TGLPlane.YScope:Single
 0048535A    mov         dword ptr [esp+28],eax
 0048535E    cmp         byte ptr [edi+0B9],0;TGLPlane.NoZWrite:Boolean
>00485365    je          0048536E
 00485367    push        0
 00485369    call        OpenGL32.glDepthMask
 0048536E    test        byte ptr [edi+0B8],1;TGLPlane.Style:TPlaneStyles
>00485375    je          00485418
 0048537B    push        7
 0048537D    call        OpenGL32.glBegin
 00485382    push        dword ptr [esp+28]
 00485386    push        dword ptr [esp+24]
 0048538A    mov         eax,dword ptr [ebp]
 0048538D    call        eax
 0048538F    push        dword ptr [esp+4]
 00485393    push        dword ptr [esp+4]
 00485397    call        OpenGL32.glVertex2f
 0048539C    push        dword ptr [esp+28]
 004853A0    push        dword ptr [esp+20]
 004853A4    mov         eax,dword ptr [ebp]
 004853A7    call        eax
 004853A9    push        dword ptr [esp+4]
 004853AD    fld         dword ptr [esp+4]
 004853B1    fchs
 004853B3    add         esp,0FFFFFFFC
 004853B6    fstp        dword ptr [esp]
 004853B9    wait
 004853BA    call        OpenGL32.glVertex2f
 004853BF    push        dword ptr [esp+24]
 004853C3    push        dword ptr [esp+20]
 004853C7    mov         eax,dword ptr [ebp]
 004853CA    call        eax
 004853CC    fld         dword ptr [esp+4]
 004853D0    fchs
 004853D2    add         esp,0FFFFFFFC
 004853D5    fstp        dword ptr [esp]
 004853D8    wait
 004853D9    fld         dword ptr [esp+4]
 004853DD    fchs
 004853DF    add         esp,0FFFFFFFC
 004853E2    fstp        dword ptr [esp]
 004853E5    wait
 004853E6    call        OpenGL32.glVertex2f
 004853EB    push        dword ptr [esp+24]
 004853EF    push        dword ptr [esp+24]
 004853F3    mov         eax,dword ptr [ebp]
 004853F6    call        eax
 004853F8    fld         dword ptr [esp+4]
 004853FC    fchs
 004853FE    add         esp,0FFFFFFFC
 00485401    fstp        dword ptr [esp]
 00485404    wait
 00485405    push        dword ptr [esp+4]
 00485409    call        OpenGL32.glVertex2f
 0048540E    call        OpenGL32.glEnd
>00485413    jmp         00485591
 00485418    fld         dword ptr [esp+20]
 0048541C    fsub        dword ptr [esp+1C]
 00485420    mov         eax,dword ptr [edi+0B0];TGLPlane.XTiles:Cardinal
 00485426    mov         dword ptr [esp+48],eax
 0048542A    xor         eax,eax
 0048542C    mov         dword ptr [esp+4C],eax
 00485430    fild        qword ptr [esp+48]
 00485434    fdivp       st(1),st
 00485436    fstp        dword ptr [esp+2C]
 0048543A    wait
 0048543B    fld         dword ptr [esp+28]
 0048543F    fsub        dword ptr [esp+24]
 00485443    mov         eax,dword ptr [edi+0B4];TGLPlane.YTiles:Cardinal
 00485449    mov         dword ptr [esp+48],eax
 0048544D    xor         eax,eax
 0048544F    mov         dword ptr [esp+4C],eax
 00485453    fild        qword ptr [esp+48]
 00485457    fdivp       st(1),st
 00485459    fstp        dword ptr [esp+30]
 0048545D    wait
 0048545E    mov         eax,dword ptr [edi+0B0];TGLPlane.XTiles:Cardinal
 00485464    mov         dword ptr [esp+48],eax
 00485468    xor         eax,eax
 0048546A    mov         dword ptr [esp+4C],eax
 0048546E    fild        qword ptr [esp+48]
 00485472    fdivr       dword ptr [edi+0A8];TGLPlane.Width:Single
 00485478    fstp        dword ptr [esp+8]
 0048547C    wait
 0048547D    mov         eax,dword ptr [edi+0B4];TGLPlane.YTiles:Cardinal
 00485483    mov         dword ptr [esp+48],eax
 00485487    xor         eax,eax
 00485489    mov         dword ptr [esp+4C],eax
 0048548D    fild        qword ptr [esp+48]
 00485491    fdivr       dword ptr [edi+0AC];TGLPlane.Height:Single
 00485497    fstp        dword ptr [esp+0C]
 0048549B    wait
 0048549C    xor         eax,eax
 0048549E    mov         dword ptr [esp+38],eax
 004854A2    fld         dword ptr [esp+4]
 004854A6    fchs
 004854A8    fstp        dword ptr [esp+14]
 004854AC    wait
 004854AD    mov         eax,dword ptr [edi+0B4];TGLPlane.YTiles:Cardinal
 004854B3    dec         eax
 004854B4    test        eax,eax
>004854B6    jl          00485591
 004854BC    inc         eax
 004854BD    mov         dword ptr [esp+44],eax
 004854C1    mov         dword ptr [esp+40],0
 004854C9    mov         eax,dword ptr [esp+40]
 004854CD    inc         eax
 004854CE    mov         dword ptr [esp+50],eax
 004854D2    fild        dword ptr [esp+50]
 004854D6    fmul        dword ptr [esp+30]
 004854DA    fstp        dword ptr [esp+3C]
 004854DE    wait
 004854DF    mov         eax,dword ptr [esp+40]
 004854E3    inc         eax
 004854E4    mov         dword ptr [esp+50],eax
 004854E8    fild        dword ptr [esp+50]
 004854EC    fmul        dword ptr [esp+0C]
 004854F0    fsub        dword ptr [esp+4]
 004854F4    fstp        dword ptr [esp+18]
 004854F8    wait
 004854F9    push        5
 004854FB    call        OpenGL32.glBegin
 00485500    mov         esi,dword ptr [edi+0B0];TGLPlane.XTiles:Cardinal
 00485506    test        esi,esi
>00485508    jl          0048556E
 0048550A    inc         esi
 0048550B    xor         ebx,ebx
 0048550D    mov         dword ptr [esp+50],ebx
 00485511    fild        dword ptr [esp+50]
 00485515    fmul        dword ptr [esp+2C]
 00485519    fadd        dword ptr [esp+1C]
 0048551D    fstp        dword ptr [esp+34]
 00485521    wait
 00485522    mov         dword ptr [esp+50],ebx
 00485526    fild        dword ptr [esp+50]
 0048552A    fmul        dword ptr [esp+8]
 0048552E    fsub        dword ptr [esp]
 00485531    fstp        dword ptr [esp+10]
 00485535    wait
 00485536    push        dword ptr [esp+3C]
 0048553A    push        dword ptr [esp+38]
 0048553E    mov         eax,dword ptr [ebp]
 00485541    call        eax
 00485543    push        dword ptr [esp+18]
 00485547    push        dword ptr [esp+14]
 0048554B    call        OpenGL32.glVertex2f
 00485550    push        dword ptr [esp+38]
 00485554    push        dword ptr [esp+38]
 00485558    mov         eax,dword ptr [ebp]
 0048555B    call        eax
 0048555D    push        dword ptr [esp+14]
 00485561    push        dword ptr [esp+14]
 00485565    call        OpenGL32.glVertex2f
 0048556A    inc         ebx
 0048556B    dec         esi
>0048556C    jne         0048550D
 0048556E    call        OpenGL32.glEnd
 00485573    mov         eax,dword ptr [esp+3C]
 00485577    mov         dword ptr [esp+38],eax
 0048557B    mov         eax,dword ptr [esp+18]
 0048557F    mov         dword ptr [esp+14],eax
 00485583    inc         dword ptr [esp+40]
 00485587    dec         dword ptr [esp+44]
>0048558B    jne         004854C9
 00485591    cmp         byte ptr [edi+0B9],0;TGLPlane.NoZWrite:Boolean
>00485598    je          004855A1
 0048559A    push        0FF
 0048559C    call        OpenGL32.glDepthMask
 004855A1    add         esp,54
 004855A4    pop         ebp
 004855A5    pop         edi
 004855A6    pop         esi
 004855A7    pop         ebx
 004855A8    ret
*}
end;

//004855B0
{*procedure TGLPlane.SetWidth(Value:Single; ?:?);
begin
 004855B0    push        ebp
 004855B1    mov         ebp,esp
 004855B3    push        esi
 004855B4    mov         edx,eax
 004855B6    fld         dword ptr [ebp+8]
 004855B9    fcomp       dword ptr [edx+0A8];TGLPlane.Width:Single
 004855BF    fnstsw      al
 004855C1    sahf
>004855C2    je          004855D8
 004855C4    mov         eax,dword ptr [ebp+8]
 004855C7    mov         dword ptr [edx+0A8],eax;TGLPlane.Width:Single
 004855CD    mov         eax,edx
 004855CF    mov         si,0FFE7
 004855D3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004855D8    pop         esi
 004855D9    pop         ebp
 004855DA    ret         4
end;*}

//004855E0
{*procedure TGLPlane.SetHeight(Value:Single; ?:?);
begin
 004855E0    push        ebp
 004855E1    mov         ebp,esp
 004855E3    push        esi
 004855E4    mov         edx,eax
 004855E6    fld         dword ptr [ebp+8]
 004855E9    fcomp       dword ptr [edx+0AC];TGLPlane.Height:Single
 004855EF    fnstsw      al
 004855F1    sahf
>004855F2    je          00485608
 004855F4    mov         eax,dword ptr [ebp+8]
 004855F7    mov         dword ptr [edx+0AC],eax;TGLPlane.Height:Single
 004855FD    mov         eax,edx
 004855FF    mov         si,0FFE7
 00485603    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00485608    pop         esi
 00485609    pop         ebp
 0048560A    ret         4
end;*}

//00485610
{*procedure TGLPlane.SetXOffset(Value:Single; ?:?);
begin
 00485610    push        ebp
 00485611    mov         ebp,esp
 00485613    push        esi
 00485614    mov         edx,eax
 00485616    fld         dword ptr [ebp+8]
 00485619    fcomp       dword ptr [edx+98];TGLPlane.XOffset:Single
 0048561F    fnstsw      al
 00485621    sahf
>00485622    je          00485638
 00485624    mov         eax,dword ptr [ebp+8]
 00485627    mov         dword ptr [edx+98],eax;TGLPlane.XOffset:Single
 0048562D    mov         eax,edx
 0048562F    mov         si,0FFE7
 00485633    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00485638    pop         esi
 00485639    pop         ebp
 0048563A    ret         4
end;*}

//00485640
{*procedure TGLPlane.SetXScope(Value:Single; ?:?);
begin
 00485640    push        ebp
 00485641    mov         ebp,esp
 00485643    push        esi
 00485644    mov         edx,eax
 00485646    fld         dword ptr [ebp+8]
 00485649    fcomp       dword ptr [edx+0A0];TGLPlane.XScope:Single
 0048564F    fnstsw      al
 00485651    sahf
>00485652    je          00485683
 00485654    mov         eax,dword ptr [ebp+8]
 00485657    mov         dword ptr [edx+0A0],eax;TGLPlane.XScope:Single
 0048565D    fld         dword ptr [edx+0A0];TGLPlane.XScope:Single
 00485663    fcomp       dword ptr ds:[485688];1:Single
 00485669    fnstsw      al
 0048566B    sahf
>0048566C    jbe         00485678
 0048566E    mov         dword ptr [edx+0A0],3F800000;TGLPlane.XScope:Single
 00485678    mov         eax,edx
 0048567A    mov         si,0FFE7
 0048567E    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00485683    pop         esi
 00485684    pop         ebp
 00485685    ret         4
end;*}

//0048568C
function TGLPlane.IsStoredXScope(Value:Single):Boolean;
begin
{*
 0048568C    mov         edx,eax
 0048568E    fld         dword ptr [edx+0A0];TGLPlane.XScope:Single
 00485694    fcomp       dword ptr ds:[4856A4];1:Single
 0048569A    fnstsw      al
 0048569C    sahf
 0048569D    setne       al
 004856A0    ret
*}
end;

//004856A8
procedure TGLPlane.SetXTiles(Value:Cardinal);
begin
{*
 004856A8    push        esi
 004856A9    mov         esi,eax
 004856AB    cmp         edx,dword ptr [esi+0B0];TGLPlane.XTiles:Cardinal
>004856B1    je          004856C4
 004856B3    mov         dword ptr [esi+0B0],edx;TGLPlane.XTiles:Cardinal
 004856B9    mov         eax,esi
 004856BB    mov         si,0FFE7
 004856BF    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004856C4    pop         esi
 004856C5    ret
*}
end;

//004856C8
{*procedure TGLPlane.SetYOffset(Value:Single; ?:?);
begin
 004856C8    push        ebp
 004856C9    mov         ebp,esp
 004856CB    push        esi
 004856CC    mov         edx,eax
 004856CE    fld         dword ptr [ebp+8]
 004856D1    fcomp       dword ptr [edx+9C];TGLPlane.YOffset:Single
 004856D7    fnstsw      al
 004856D9    sahf
>004856DA    je          004856F0
 004856DC    mov         eax,dword ptr [ebp+8]
 004856DF    mov         dword ptr [edx+9C],eax;TGLPlane.YOffset:Single
 004856E5    mov         eax,edx
 004856E7    mov         si,0FFE7
 004856EB    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004856F0    pop         esi
 004856F1    pop         ebp
 004856F2    ret         4
end;*}

//004856F8
{*procedure TGLPlane.SetYScope(Value:Single; ?:?);
begin
 004856F8    push        ebp
 004856F9    mov         ebp,esp
 004856FB    push        esi
 004856FC    mov         edx,eax
 004856FE    fld         dword ptr [ebp+8]
 00485701    fcomp       dword ptr [edx+0A4];TGLPlane.YScope:Single
 00485707    fnstsw      al
 00485709    sahf
>0048570A    je          0048573B
 0048570C    mov         eax,dword ptr [ebp+8]
 0048570F    mov         dword ptr [edx+0A4],eax;TGLPlane.YScope:Single
 00485715    fld         dword ptr [edx+0A4];TGLPlane.YScope:Single
 0048571B    fcomp       dword ptr ds:[485740];1:Single
 00485721    fnstsw      al
 00485723    sahf
>00485724    jbe         00485730
 00485726    mov         dword ptr [edx+0A4],3F800000;TGLPlane.YScope:Single
 00485730    mov         eax,edx
 00485732    mov         si,0FFE7
 00485736    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048573B    pop         esi
 0048573C    pop         ebp
 0048573D    ret         4
end;*}

//00485744
function TGLPlane.IsStoredYScope(Value:Single):Boolean;
begin
{*
 00485744    mov         edx,eax
 00485746    fld         dword ptr [edx+0A4];TGLPlane.YScope:Single
 0048574C    fcomp       dword ptr ds:[48575C];1:Single
 00485752    fnstsw      al
 00485754    sahf
 00485755    setne       al
 00485758    ret
*}
end;

//00485760
procedure TGLPlane.SetYTiles(Value:Cardinal);
begin
{*
 00485760    push        esi
 00485761    mov         esi,eax
 00485763    cmp         edx,dword ptr [esi+0B4];TGLPlane.YTiles:Cardinal
>00485769    je          0048577C
 0048576B    mov         dword ptr [esi+0B4],edx;TGLPlane.YTiles:Cardinal
 00485771    mov         eax,esi
 00485773    mov         si,0FFE7
 00485777    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048577C    pop         esi
 0048577D    ret
*}
end;

//00485780
procedure TGLPlane.SetStyle(Value:TPlaneStyles);
begin
{*
 00485780    push        ebx
 00485781    push        esi
 00485782    push        ecx
 00485783    mov         byte ptr [esp],dl
 00485786    mov         ebx,eax
 00485788    mov         al,byte ptr [ebx+0B8];TGLPlane.Style:TPlaneStyles
 0048578E    cmp         al,byte ptr [esp]
>00485791    je          004857A7
 00485793    mov         al,byte ptr [esp]
 00485796    mov         byte ptr [ebx+0B8],al;TGLPlane.Style:TPlaneStyles
 0048579C    mov         eax,ebx
 0048579E    mov         si,0FFE7
 004857A2    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004857A7    pop         edx
 004857A8    pop         esi
 004857A9    pop         ebx
 004857AA    ret
*}
end;

//004857AC
constructor TGLSprite.Create(AOwner:TComponent);
begin
{*
 004857AC    push        ebx
 004857AD    push        esi
 004857AE    test        dl,dl
>004857B0    je          004857BA
 004857B2    add         esp,0FFFFFFF0
 004857B5    call        @ClassCreate
 004857BA    mov         ebx,edx
 004857BC    mov         esi,eax
 004857BE    xor         edx,edx
 004857C0    mov         eax,esi
 004857C2    call        TGLCustomSceneObject.Create
 004857C7    mov         al,byte ptr [esi+3C];TGLSprite.?f3C:byte
 004857CA    or          al,byte ptr ds:[48580C];0x9 gvar_0048580C
 004857D0    mov         byte ptr [esi+3C],al;TGLSprite.?f3C:byte
 004857D3    mov         dword ptr [esi+0A4],3F800000;TGLSprite.AlphaChannel:Single
 004857DD    mov         dword ptr [esi+98],3F800000;TGLSprite.Width:Single
 004857E7    mov         dword ptr [esi+9C],3F800000;TGLSprite.Height:Single
 004857F1    mov         eax,esi
 004857F3    test        bl,bl
>004857F5    je          00485806
 004857F7    call        @AfterConstruction
 004857FC    pop         dword ptr fs:[0]
 00485803    add         esp,0C
 00485806    mov         eax,esi
 00485808    pop         esi
 00485809    pop         ebx
 0048580A    ret
*}
end;

//00485810
procedure TGLSprite.Assign(Source:TPersistent);
begin
{*
 00485810    push        ebx
 00485811    push        esi
 00485812    mov         esi,edx
 00485814    mov         ebx,eax
 00485816    mov         eax,esi
 00485818    mov         edx,dword ptr ds:[483508];TGLSprite
 0048581E    call        @IsClass
 00485823    test        al,al
>00485825    je          00485865
 00485827    mov         eax,esi
 00485829    mov         edx,dword ptr [eax+98]
 0048582F    mov         dword ptr [ebx+98],edx;TGLSprite.Width:Single
 00485835    mov         edx,dword ptr [eax+9C]
 0048583B    mov         dword ptr [ebx+9C],edx;TGLSprite.Height:Single
 00485841    mov         edx,dword ptr [eax+0A0]
 00485847    mov         dword ptr [ebx+0A0],edx;TGLSprite.Rotation:Single
 0048584D    mov         edx,dword ptr [eax+0A4]
 00485853    mov         dword ptr [ebx+0A4],edx;TGLSprite.AlphaChannel:Single
 00485859    mov         al,byte ptr [eax+0A8]
 0048585F    mov         byte ptr [ebx+0A8],al;TGLSprite.NoZWrite:Boolean
 00485865    mov         edx,esi
 00485867    mov         eax,ebx
 00485869    call        TGLCustomSceneObject.Assign
 0048586E    pop         esi
 0048586F    pop         ebx
 00485870    ret
*}
end;

//00485874
{*procedure sub_00485874(?:?);
begin
 00485874    push        ebx
 00485875    push        esi
 00485876    mov         esi,edx
 00485878    mov         ebx,eax
 0048587A    fld         dword ptr [ebx+98];TGLSprite.Width:Single
 00485880    fabs
 00485882    fmul        dword ptr ds:[4858B4];0.5:Single
 00485888    fstp        dword ptr [esi]
 0048588A    wait
 0048588B    fld         dword ptr [ebx+9C];TGLSprite.Height:Single
 00485891    fabs
 00485893    fmul        dword ptr ds:[4858B4];0.5:Single
 00485899    fstp        dword ptr [esi+4]
 0048589C    wait
 0048589D    fld         dword ptr [ebx+98];TGLSprite.Width:Single
 004858A3    fabs
 004858A5    fmul        dword ptr ds:[4858B4];0.5:Single
 004858AB    fstp        dword ptr [esi+8]
 004858AE    wait
 004858AF    pop         esi
 004858B0    pop         ebx
 004858B1    ret
end;*}

//004858B8
{*procedure sub_004858B8(?:?);
begin
 004858B8    push        ebx
 004858B9    push        esi
 004858BA    push        edi
 004858BB    push        ebp
 004858BC    add         esp,0FFFFFF94
 004858BF    mov         ebx,eax
 004858C1    fld         dword ptr [ebx+0A4];TGLSprite.AlphaChannel:Single
 004858C7    fcomp       dword ptr ds:[485B98];1:Single
 004858CD    fnstsw      al
 004858CF    sahf
>004858D0    je          004858E5
 004858D2    push        dword ptr [ebx+0A4];TGLSprite.AlphaChannel:Single
 004858D8    mov         eax,dword ptr [edx+5C]
 004858DB    mov         edx,404
 004858E0    call        0046D7F0
 004858E5    cmp         byte ptr [ebx+0A8],0;TGLSprite.NoZWrite:Boolean
>004858EC    je          004858F5
 004858EE    push        0
 004858F0    call        OpenGL32.glDepthMask
 004858F5    lea         eax,[esp+24]
 004858F9    push        eax
 004858FA    push        0BA6
 004858FF    call        OpenGL32.glGetFloatv
 00485904    fld         dword ptr [ebx+98];TGLSprite.Width:Single
 0048590A    fmul        dword ptr ds:[485B9C];0.5:Single
 00485910    fstp        dword ptr [esp]
 00485913    wait
 00485914    fld         dword ptr [ebx+9C];TGLSprite.Height:Single
 0048591A    fmul        dword ptr ds:[485B9C];0.5:Single
 00485920    fstp        dword ptr [esp+4]
 00485924    wait
 00485925    mov         eax,dword ptr [esp+24]
 00485929    mov         dword ptr [esp+0C],eax
 0048592D    mov         eax,dword ptr [esp+28]
 00485931    mov         dword ptr [esp+18],eax
 00485935    mov         eax,dword ptr [esp+34]
 00485939    mov         dword ptr [esp+10],eax
 0048593D    mov         eax,dword ptr [esp+38]
 00485941    mov         dword ptr [esp+1C],eax
 00485945    mov         eax,dword ptr [esp+44]
 00485949    mov         dword ptr [esp+14],eax
 0048594D    mov         eax,dword ptr [esp+48]
 00485951    mov         dword ptr [esp+20],eax
 00485955    lea         eax,[esp+0C]
 00485959    call        0045D408
 0048595E    fdivr       dword ptr [esp]
 00485961    add         esp,0FFFFFFFC
 00485964    fstp        dword ptr [esp]
 00485967    wait
 00485968    lea         eax,[esp+10]
 0048596C    call        0045D76C
 00485971    lea         eax,[esp+18]
 00485975    call        0045D408
 0048597A    fdivr       dword ptr [esp+4]
 0048597E    add         esp,0FFFFFFFC
 00485981    fstp        dword ptr [esp]
 00485984    wait
 00485985    lea         eax,[esp+1C]
 00485989    call        0045D76C
 0048598E    cmp         byte ptr [ebx+0A9],0;TGLSprite.MirrorU:Boolean
>00485995    je          004859A0
 00485997    mov         esi,1
 0048599C    xor         ebp,ebp
>0048599E    jmp         004859A7
 004859A0    xor         esi,esi
 004859A2    mov         ebp,1
 004859A7    cmp         byte ptr [ebx+0AA],0;TGLSprite.MirrorV:Boolean
>004859AE    je          004859BD
 004859B0    mov         edi,1
 004859B5    xor         eax,eax
 004859B7    mov         dword ptr [esp+8],eax
>004859BB    jmp         004859C7
 004859BD    xor         edi,edi
 004859BF    mov         dword ptr [esp+8],1
 004859C7    fld         dword ptr [ebx+0A0];TGLSprite.Rotation:Single
 004859CD    fcomp       dword ptr ds:[485BA0];0:Single
 004859D3    fnstsw      al
 004859D5    sahf
>004859D6    je          004859F4
 004859D8    call        OpenGL32.glPushMatrix
 004859DD    push        dword ptr [esp+4C]
 004859E1    push        dword ptr [esp+40]
 004859E5    push        dword ptr [esp+34]
 004859E9    push        dword ptr [ebx+0A0];TGLSprite.Rotation:Single
 004859EF    call        OpenGL32.glRotatef
 004859F4    push        7
 004859F6    call        OpenGL32.glBegin
 004859FB    fild        dword ptr [esp+8]
 004859FF    add         esp,0FFFFFFFC
 00485A02    fstp        dword ptr [esp]
 00485A05    wait
 00485A06    mov         dword ptr [esp+68],ebp
 00485A0A    fild        dword ptr [esp+68]
 00485A0E    add         esp,0FFFFFFFC
 00485A11    fstp        dword ptr [esp]
 00485A14    wait
 00485A15    mov         eax,[005AE164];^gvar_005E1344
 00485A1A    mov         eax,dword ptr [eax]
 00485A1C    call        eax
 00485A1E    fld         dword ptr [esp+14]
 00485A22    fadd        dword ptr [esp+20]
 00485A26    add         esp,0FFFFFFFC
 00485A29    fstp        dword ptr [esp]
 00485A2C    wait
 00485A2D    fld         dword ptr [esp+14]
 00485A31    fadd        dword ptr [esp+20]
 00485A35    add         esp,0FFFFFFFC
 00485A38    fstp        dword ptr [esp]
 00485A3B    wait
 00485A3C    fld         dword ptr [esp+14]
 00485A40    fadd        dword ptr [esp+20]
 00485A44    add         esp,0FFFFFFFC
 00485A47    fstp        dword ptr [esp]
 00485A4A    wait
 00485A4B    call        OpenGL32.glVertex3f
 00485A50    fild        dword ptr [esp+8]
 00485A54    add         esp,0FFFFFFFC
 00485A57    fstp        dword ptr [esp]
 00485A5A    wait
 00485A5B    mov         dword ptr [esp+68],esi
 00485A5F    fild        dword ptr [esp+68]
 00485A63    add         esp,0FFFFFFFC
 00485A66    fstp        dword ptr [esp]
 00485A69    wait
 00485A6A    mov         eax,[005AE164];^gvar_005E1344
 00485A6F    mov         eax,dword ptr [eax]
 00485A71    call        eax
 00485A73    fld         dword ptr [esp+14]
 00485A77    fchs
 00485A79    fadd        dword ptr [esp+20]
 00485A7D    add         esp,0FFFFFFFC
 00485A80    fstp        dword ptr [esp]
 00485A83    wait
 00485A84    fld         dword ptr [esp+14]
 00485A88    fchs
 00485A8A    fadd        dword ptr [esp+20]
 00485A8E    add         esp,0FFFFFFFC
 00485A91    fstp        dword ptr [esp]
 00485A94    wait
 00485A95    fld         dword ptr [esp+14]
 00485A99    fchs
 00485A9B    fadd        dword ptr [esp+20]
 00485A9F    add         esp,0FFFFFFFC
 00485AA2    fstp        dword ptr [esp]
 00485AA5    wait
 00485AA6    call        OpenGL32.glVertex3f
 00485AAB    mov         dword ptr [esp+64],edi
 00485AAF    fild        dword ptr [esp+64]
 00485AB3    add         esp,0FFFFFFFC
 00485AB6    fstp        dword ptr [esp]
 00485AB9    wait
 00485ABA    mov         dword ptr [esp+6C],esi
 00485ABE    fild        dword ptr [esp+6C]
 00485AC2    add         esp,0FFFFFFFC
 00485AC5    fstp        dword ptr [esp]
 00485AC8    wait
 00485AC9    mov         eax,[005AE164];^gvar_005E1344
 00485ACE    mov         eax,dword ptr [eax]
 00485AD0    call        eax
 00485AD2    fld         dword ptr [esp+14]
 00485AD6    fchs
 00485AD8    fsub        dword ptr [esp+20]
 00485ADC    add         esp,0FFFFFFFC
 00485ADF    fstp        dword ptr [esp]
 00485AE2    wait
 00485AE3    fld         dword ptr [esp+14]
 00485AE7    fchs
 00485AE9    fsub        dword ptr [esp+20]
 00485AED    add         esp,0FFFFFFFC
 00485AF0    fstp        dword ptr [esp]
 00485AF3    wait
 00485AF4    fld         dword ptr [esp+14]
 00485AF8    fchs
 00485AFA    fsub        dword ptr [esp+20]
 00485AFE    add         esp,0FFFFFFFC
 00485B01    fstp        dword ptr [esp]
 00485B04    wait
 00485B05    call        OpenGL32.glVertex3f
 00485B0A    mov         dword ptr [esp+64],edi
 00485B0E    fild        dword ptr [esp+64]
 00485B12    add         esp,0FFFFFFFC
 00485B15    fstp        dword ptr [esp]
 00485B18    wait
 00485B19    mov         dword ptr [esp+6C],ebp
 00485B1D    fild        dword ptr [esp+6C]
 00485B21    add         esp,0FFFFFFFC
 00485B24    fstp        dword ptr [esp]
 00485B27    wait
 00485B28    mov         eax,[005AE164];^gvar_005E1344
 00485B2D    mov         eax,dword ptr [eax]
 00485B2F    call        eax
 00485B31    fld         dword ptr [esp+14]
 00485B35    fsub        dword ptr [esp+20]
 00485B39    add         esp,0FFFFFFFC
 00485B3C    fstp        dword ptr [esp]
 00485B3F    wait
 00485B40    fld         dword ptr [esp+14]
 00485B44    fsub        dword ptr [esp+20]
 00485B48    add         esp,0FFFFFFFC
 00485B4B    fstp        dword ptr [esp]
 00485B4E    wait
 00485B4F    fld         dword ptr [esp+14]
 00485B53    fsub        dword ptr [esp+20]
 00485B57    add         esp,0FFFFFFFC
 00485B5A    fstp        dword ptr [esp]
 00485B5D    wait
 00485B5E    call        OpenGL32.glVertex3f
 00485B63    call        OpenGL32.glEnd
 00485B68    fld         dword ptr [ebx+0A0];TGLSprite.Rotation:Single
 00485B6E    fcomp       dword ptr ds:[485BA0];0:Single
 00485B74    fnstsw      al
 00485B76    sahf
>00485B77    je          00485B7E
 00485B79    call        OpenGL32.glPopMatrix
 00485B7E    cmp         byte ptr [ebx+0A8],0;TGLSprite.NoZWrite:Boolean
>00485B85    je          00485B8E
 00485B87    push        0FF
 00485B89    call        OpenGL32.glDepthMask
 00485B8E    add         esp,6C
 00485B91    pop         ebp
 00485B92    pop         edi
 00485B93    pop         esi
 00485B94    pop         ebx
 00485B95    ret
end;*}

//00485BA4
{*procedure TGLSprite.SetWidth(Value:Single; ?:?);
begin
 00485BA4    push        ebp
 00485BA5    mov         ebp,esp
 00485BA7    mov         edx,eax
 00485BA9    fld         dword ptr [edx+98];TGLSprite.Width:Single
 00485BAF    fcomp       dword ptr [ebp+8]
 00485BB2    fnstsw      al
 00485BB4    sahf
>00485BB5    je          00485BC7
 00485BB7    mov         eax,dword ptr [ebp+8]
 00485BBA    mov         dword ptr [edx+98],eax;TGLSprite.Width:Single
 00485BC0    mov         eax,edx
 00485BC2    mov         ecx,dword ptr [eax]
 00485BC4    call        dword ptr [ecx+34];TGLSprite.sub_0047DACC
 00485BC7    pop         ebp
 00485BC8    ret         4
end;*}

//00485BCC
{*procedure TGLSprite.SetHeight(Value:Single; ?:?);
begin
 00485BCC    push        ebp
 00485BCD    mov         ebp,esp
 00485BCF    mov         edx,eax
 00485BD1    fld         dword ptr [edx+9C];TGLSprite.Height:Single
 00485BD7    fcomp       dword ptr [ebp+8]
 00485BDA    fnstsw      al
 00485BDC    sahf
>00485BDD    je          00485BEF
 00485BDF    mov         eax,dword ptr [ebp+8]
 00485BE2    mov         dword ptr [edx+9C],eax;TGLSprite.Height:Single
 00485BE8    mov         eax,edx
 00485BEA    mov         ecx,dword ptr [eax]
 00485BEC    call        dword ptr [ecx+34];TGLSprite.sub_0047DACC
 00485BEF    pop         ebp
 00485BF0    ret         4
end;*}

//00485BF4
{*procedure TGLSprite.SetRotation(Value:Single; ?:?);
begin
 00485BF4    push        ebp
 00485BF5    mov         ebp,esp
 00485BF7    mov         edx,eax
 00485BF9    fld         dword ptr [edx+0A0];TGLSprite.Rotation:Single
 00485BFF    fcomp       dword ptr [ebp+8]
 00485C02    fnstsw      al
 00485C04    sahf
>00485C05    je          00485C17
 00485C07    mov         eax,dword ptr [ebp+8]
 00485C0A    mov         dword ptr [edx+0A0],eax;TGLSprite.Rotation:Single
 00485C10    mov         eax,edx
 00485C12    mov         ecx,dword ptr [eax]
 00485C14    call        dword ptr [ecx+34];TGLSprite.sub_0047DACC
 00485C17    pop         ebp
 00485C18    ret         4
end;*}

//00485C1C
{*procedure TGLSprite.SetAlphaChannel(Value:Single; ?:?);
begin
 00485C1C    push        ebp
 00485C1D    mov         ebp,esp
 00485C1F    mov         edx,eax
 00485C21    fld         dword ptr [ebp+8]
 00485C24    fcomp       dword ptr [edx+0A4];TGLSprite.AlphaChannel:Single
 00485C2A    fnstsw      al
 00485C2C    sahf
>00485C2D    je          00485C71
 00485C2F    fld         dword ptr [ebp+8]
 00485C32    fcomp       dword ptr ds:[485C78];0:Single
 00485C38    fnstsw      al
 00485C3A    sahf
>00485C3B    jae         00485C47
 00485C3D    xor         eax,eax
 00485C3F    mov         dword ptr [edx+0A4],eax;TGLSprite.AlphaChannel:Single
>00485C45    jmp         00485C6A
 00485C47    fld         dword ptr [ebp+8]
 00485C4A    fcomp       dword ptr ds:[485C7C];1:Single
 00485C50    fnstsw      al
 00485C52    sahf
>00485C53    jbe         00485C61
 00485C55    mov         dword ptr [edx+0A4],3F800000;TGLSprite.AlphaChannel:Single
>00485C5F    jmp         00485C6A
 00485C61    mov         eax,dword ptr [ebp+8]
 00485C64    mov         dword ptr [edx+0A4],eax;TGLSprite.AlphaChannel:Single
 00485C6A    mov         eax,edx
 00485C6C    mov         ecx,dword ptr [eax]
 00485C6E    call        dword ptr [ecx+34];TGLSprite.sub_0047DACC
 00485C71    pop         ebp
 00485C72    ret         4
end;*}

//00485C80
function TGLSprite.IsStoredAlphaChannel(Value:Single):Boolean;
begin
{*
 00485C80    mov         edx,eax
 00485C82    fld         dword ptr [edx+0A4];TGLSprite.AlphaChannel:Single
 00485C88    fcomp       dword ptr ds:[485C98];1:Single
 00485C8E    fnstsw      al
 00485C90    sahf
 00485C91    setne       al
 00485C94    ret
*}
end;

//00485C9C
procedure TGLSprite.SetNoZWrite(Value:Boolean);
begin
{*
 00485C9C    push        esi
 00485C9D    mov         esi,eax
 00485C9F    mov         byte ptr [esi+0A8],dl;TGLSprite.NoZWrite:Boolean
 00485CA5    mov         edx,esi
 00485CA7    mov         eax,esi
 00485CA9    mov         ecx,dword ptr [eax]
 00485CAB    call        dword ptr [ecx+34];TGLSprite.sub_0047DACC
 00485CAE    pop         esi
 00485CAF    ret
*}
end;

//00485CB0
procedure TGLSprite.SetMirrorU(Value:Boolean);
begin
{*
 00485CB0    push        esi
 00485CB1    mov         esi,eax
 00485CB3    mov         byte ptr [esi+0A9],dl;TGLSprite.MirrorU:Boolean
 00485CB9    mov         edx,esi
 00485CBB    mov         eax,esi
 00485CBD    mov         ecx,dword ptr [eax]
 00485CBF    call        dword ptr [ecx+34];TGLSprite.sub_0047DACC
 00485CC2    pop         esi
 00485CC3    ret
*}
end;

//00485CC4
procedure TGLSprite.SetMirrorV(Value:Boolean);
begin
{*
 00485CC4    push        esi
 00485CC5    mov         esi,eax
 00485CC7    mov         byte ptr [esi+0AA],dl;TGLSprite.MirrorV:Boolean
 00485CCD    mov         edx,esi
 00485CCF    mov         eax,esi
 00485CD1    mov         ecx,dword ptr [eax]
 00485CD3    call        dword ptr [ecx+34];TGLSprite.sub_0047DACC
 00485CD6    pop         esi
 00485CD7    ret
*}
end;

//00485CD8
constructor TGLPointParameters.Create;
begin
{*
 00485CD8    push        ebx
 00485CD9    push        esi
 00485CDA    test        dl,dl
>00485CDC    je          00485CE6
 00485CDE    add         esp,0FFFFFFF0
 00485CE1    call        @ClassCreate
 00485CE6    mov         ebx,edx
 00485CE8    mov         esi,eax
 00485CEA    xor         edx,edx
 00485CEC    mov         eax,esi
 00485CEE    call        0046B394
 00485CF3    xor         eax,eax
 00485CF5    mov         dword ptr [esi+1C],eax;TGLPointParameters.MinSize:Single
 00485CF8    mov         dword ptr [esi+20],43000000;TGLPointParameters.MaxSize:Single
 00485CFF    mov         dword ptr [esi+24],3F800000;TGLPointParameters.FadeTresholdSize:Single
 00485D06    mov         eax,[005AE3CC];^gvar_005ACF24
 00485D0B    push        eax
 00485D0C    push        1
 00485D0E    mov         ecx,esi
 00485D10    mov         dl,1
 00485D12    mov         eax,[0046AF7C];TGLCoordinates
 00485D17    call        TGLCoordinates.Create;TGLCoordinates.Create
 00485D1C    mov         dword ptr [esi+28],eax;TGLPointParameters.DistanceAttenuation:TGLCoordinates
 00485D1F    mov         eax,esi
 00485D21    test        bl,bl
>00485D23    je          00485D34
 00485D25    call        @AfterConstruction
 00485D2A    pop         dword ptr fs:[0]
 00485D31    add         esp,0C
 00485D34    mov         eax,esi
 00485D36    pop         esi
 00485D37    pop         ebx
 00485D38    ret
*}
end;

//00485D3C
destructor TGLPointParameters.Destroy;
begin
{*
 00485D3C    push        ebx
 00485D3D    push        esi
 00485D3E    call        @BeforeDestruction
 00485D43    mov         ebx,edx
 00485D45    mov         esi,eax
 00485D47    mov         eax,dword ptr [esi+28];TGLPointParameters.DistanceAttenuation:TGLCoordinates
 00485D4A    call        TObject.Free
 00485D4F    mov         edx,ebx
 00485D51    and         dl,0FC
 00485D54    mov         eax,esi
 00485D56    call        TMemoryStream.Destroy
 00485D5B    test        bl,bl
>00485D5D    jle         00485D66
 00485D5F    mov         eax,esi
 00485D61    call        @ClassDestroy
 00485D66    pop         esi
 00485D67    pop         ebx
 00485D68    ret
*}
end;

//00485D6C
procedure TGLPointParameters.Assign(Source:TPersistent);
begin
{*
 00485D6C    push        ebx
 00485D6D    push        esi
 00485D6E    mov         esi,edx
 00485D70    mov         ebx,eax
 00485D72    mov         eax,esi
 00485D74    mov         edx,dword ptr ds:[483750];TGLPointParameters
 00485D7A    call        @IsClass
 00485D7F    test        al,al
>00485D81    je          00485DA2
 00485D83    mov         eax,esi
 00485D85    mov         edx,dword ptr [eax+1C]
 00485D88    mov         dword ptr [ebx+1C],edx;TGLPointParameters.MinSize:Single
 00485D8B    mov         edx,dword ptr [eax+20]
 00485D8E    mov         dword ptr [ebx+20],edx;TGLPointParameters.MaxSize:Single
 00485D91    mov         edx,dword ptr [eax+24]
 00485D94    mov         dword ptr [ebx+24],edx;TGLPointParameters.FadeTresholdSize:Single
 00485D97    mov         edx,dword ptr [eax+28]
 00485D9A    mov         eax,dword ptr [ebx+28];TGLPointParameters.DistanceAttenuation:TGLCoordinates
 00485D9D    mov         ecx,dword ptr [eax]
 00485D9F    call        dword ptr [ecx+8];TGLCoordinates.Assign
 00485DA2    pop         esi
 00485DA3    pop         ebx
 00485DA4    ret
*}
end;

//00485DA8
{*procedure sub_00485DA8(?:?);
begin
 00485DA8    push        ebx
 00485DA9    push        esi
 00485DAA    mov         esi,edx
 00485DAC    mov         ebx,eax
 00485DAE    mov         edx,esi
 00485DB0    mov         eax,ebx
 00485DB2    call        0041ACF0
 00485DB7    fld         dword ptr [ebx+20];TGLPointParameters.MaxSize:Single
 00485DBA    fcomp       dword ptr ds:[485E08];128:Single
 00485DC0    fnstsw      al
 00485DC2    sahf
>00485DC3    jne         00485DE1
 00485DC5    fld         dword ptr [ebx+1C];TGLPointParameters.MinSize:Single
 00485DC8    fcomp       dword ptr ds:[485E0C];0:Single
 00485DCE    fnstsw      al
 00485DD0    sahf
>00485DD1    jne         00485DE1
 00485DD3    fld         dword ptr [ebx+24];TGLPointParameters.FadeTresholdSize:Single
 00485DD6    fcomp       dword ptr ds:[485E10];1:Single
 00485DDC    fnstsw      al
 00485DDE    sahf
>00485DDF    je          00485DE5
 00485DE1    xor         eax,eax
>00485DE3    jmp         00485DE7
 00485DE5    mov         al,1
 00485DE7    push        ebx
 00485DE8    push        485E28
 00485DED    push        ebx
 00485DEE    push        485E60
 00485DF3    mov         ecx,eax
 00485DF5    xor         cl,1
 00485DF8    mov         edx,485E1C;'PointParams'
 00485DFD    mov         eax,esi
 00485DFF    mov         ebx,dword ptr [eax]
 00485E01    call        dword ptr [ebx+8]
 00485E04    pop         esi
 00485E05    pop         ebx
 00485E06    ret
end;*}

//00485E98
procedure sub_00485E98(?:TGLPointParameters);
begin
{*
 00485E98    push        ebx
 00485E99    mov         ebx,eax
 00485E9B    cmp         byte ptr [ebx+18],0
>00485E9F    je          00485EF5
 00485EA1    mov         eax,[005AE2F4];^gvar_005E0CEA
 00485EA6    cmp         byte ptr [eax],0
>00485EA9    je          00485EF5
 00485EAB    push        dword ptr [ebx+1C]
 00485EAE    push        8126
 00485EB3    mov         eax,[005AE100];^gvar_005E0F08
 00485EB8    mov         eax,dword ptr [eax]
 00485EBA    call        eax
 00485EBC    push        dword ptr [ebx+20]
 00485EBF    push        8127
 00485EC4    mov         eax,[005AE100];^gvar_005E0F08
 00485EC9    mov         eax,dword ptr [eax]
 00485ECB    call        eax
 00485ECD    push        dword ptr [ebx+24]
 00485ED0    push        8128
 00485ED5    mov         eax,[005AE100];^gvar_005E0F08
 00485EDA    mov         eax,dword ptr [eax]
 00485EDC    call        eax
 00485EDE    mov         eax,dword ptr [ebx+28]
 00485EE1    call        0046B874
 00485EE6    push        eax
 00485EE7    push        8129
 00485EEC    mov         eax,[005AE328];^gvar_005E0F0C
 00485EF1    mov         eax,dword ptr [eax]
 00485EF3    call        eax
 00485EF5    pop         ebx
 00485EF6    ret
*}
end;

//00485EF8
procedure sub_00485EF8(?:TGLPointParameters);
begin
{*
 00485EF8    cmp         byte ptr [eax+18],0
>00485EFC    je          00485F52
 00485EFE    mov         eax,[005AE2F4];^gvar_005E0CEA
 00485F03    cmp         byte ptr [eax],0
>00485F06    je          00485F52
 00485F08    push        0
 00485F0A    push        8126
 00485F0F    mov         eax,[005AE100];^gvar_005E0F08
 00485F14    mov         eax,dword ptr [eax]
 00485F16    call        eax
 00485F18    push        43000000
 00485F1D    push        8127
 00485F22    mov         eax,[005AE100];^gvar_005E0F08
 00485F27    mov         eax,dword ptr [eax]
 00485F29    call        eax
 00485F2B    push        3F800000
 00485F30    push        8128
 00485F35    mov         eax,[005AE100];^gvar_005E0F08
 00485F3A    mov         eax,dword ptr [eax]
 00485F3C    call        eax
 00485F3E    mov         eax,[005AE610];^gvar_005ACEE8
 00485F43    push        eax
 00485F44    push        8129
 00485F49    mov         eax,[005AE328];^gvar_005E0F0C
 00485F4E    mov         eax,dword ptr [eax]
 00485F50    call        eax
 00485F52    ret
*}
end;

//00485F54
procedure TGLPointParameters.SetEnabled(Value:Boolean);
begin
{*
 00485F54    cmp         dl,byte ptr [eax+18];TGLPointParameters.Enabled:Boolean
>00485F57    je          00485F63
 00485F59    mov         byte ptr [eax+18],dl;TGLPointParameters.Enabled:Boolean
 00485F5C    mov         edx,eax
 00485F5E    mov         ecx,dword ptr [eax]
 00485F60    call        dword ptr [ecx+10];TGLPointParameters.sub_0046B3D0
 00485F63    ret
*}
end;

//00485F64
{*procedure TGLPointParameters.SetMinSize(Value:Single; ?:?);
begin
 00485F64    push        ebp
 00485F65    mov         ebp,esp
 00485F67    mov         edx,eax
 00485F69    fld         dword ptr [ebp+8]
 00485F6C    fcomp       dword ptr [edx+1C];TGLPointParameters.MinSize:Single
 00485F6F    fnstsw      al
 00485F71    sahf
>00485F72    je          00485F96
 00485F74    fld         dword ptr [ebp+8]
 00485F77    fcomp       dword ptr ds:[485F9C];0:Single
 00485F7D    fnstsw      al
 00485F7F    sahf
>00485F80    jae         00485F89
 00485F82    xor         eax,eax
 00485F84    mov         dword ptr [edx+1C],eax;TGLPointParameters.MinSize:Single
>00485F87    jmp         00485F8F
 00485F89    mov         eax,dword ptr [ebp+8]
 00485F8C    mov         dword ptr [edx+1C],eax;TGLPointParameters.MinSize:Single
 00485F8F    mov         eax,edx
 00485F91    mov         ecx,dword ptr [eax]
 00485F93    call        dword ptr [ecx+10];TGLPointParameters.sub_0046B3D0
 00485F96    pop         ebp
 00485F97    ret         4
end;*}

//00485FA0
{*procedure TGLPointParameters.SetMaxSize(Value:Single; ?:?);
begin
 00485FA0    push        ebp
 00485FA1    mov         ebp,esp
 00485FA3    mov         edx,eax
 00485FA5    fld         dword ptr [ebp+8]
 00485FA8    fcomp       dword ptr [edx+20];TGLPointParameters.MaxSize:Single
 00485FAB    fnstsw      al
 00485FAD    sahf
>00485FAE    je          00485FD2
 00485FB0    fld         dword ptr [ebp+8]
 00485FB3    fcomp       dword ptr ds:[485FD8];0:Single
 00485FB9    fnstsw      al
 00485FBB    sahf
>00485FBC    jae         00485FC5
 00485FBE    xor         eax,eax
 00485FC0    mov         dword ptr [edx+20],eax;TGLPointParameters.MaxSize:Single
>00485FC3    jmp         00485FCB
 00485FC5    mov         eax,dword ptr [ebp+8]
 00485FC8    mov         dword ptr [edx+20],eax;TGLPointParameters.MaxSize:Single
 00485FCB    mov         eax,edx
 00485FCD    mov         ecx,dword ptr [eax]
 00485FCF    call        dword ptr [ecx+10];TGLPointParameters.sub_0046B3D0
 00485FD2    pop         ebp
 00485FD3    ret         4
end;*}

//00485FDC
{*procedure TGLPointParameters.SetFadeTresholdSize(Value:Single; ?:?);
begin
 00485FDC    push        ebp
 00485FDD    mov         ebp,esp
 00485FDF    mov         edx,eax
 00485FE1    fld         dword ptr [ebp+8]
 00485FE4    fcomp       dword ptr [edx+24];TGLPointParameters.FadeTresholdSize:Single
 00485FE7    fnstsw      al
 00485FE9    sahf
>00485FEA    je          0048600E
 00485FEC    fld         dword ptr [ebp+8]
 00485FEF    fcomp       dword ptr ds:[486014];0:Single
 00485FF5    fnstsw      al
 00485FF7    sahf
>00485FF8    jae         00486001
 00485FFA    xor         eax,eax
 00485FFC    mov         dword ptr [edx+24],eax;TGLPointParameters.FadeTresholdSize:Single
>00485FFF    jmp         00486007
 00486001    mov         eax,dword ptr [ebp+8]
 00486004    mov         dword ptr [edx+24],eax;TGLPointParameters.FadeTresholdSize:Single
 00486007    mov         eax,edx
 00486009    mov         ecx,dword ptr [eax]
 0048600B    call        dword ptr [ecx+10];TGLPointParameters.sub_0046B3D0
 0048600E    pop         ebp
 0048600F    ret         4
end;*}

//00486018
procedure TGLPointParameters.SetDistanceAttenuation(Value:TGLCoordinates);
begin
{*
 00486018    mov         eax,dword ptr [eax+28];TGLPointParameters.DistanceAttenuation:TGLCoordinates
 0048601B    mov         ecx,dword ptr [eax]
 0048601D    call        dword ptr [ecx+8];TGLCoordinates.Assign
 00486020    ret
*}
end;

//00486024
constructor TGLPoints.Create(AOwner:TComponent);
begin
{*
 00486024    push        ebx
 00486025    push        esi
 00486026    test        dl,dl
>00486028    je          00486032
 0048602A    add         esp,0FFFFFFF0
 0048602D    call        @ClassCreate
 00486032    mov         ebx,edx
 00486034    mov         esi,eax
 00486036    xor         edx,edx
 00486038    mov         eax,esi
 0048603A    call        TGLCustomSceneObject.Create
 0048603F    mov         al,byte ptr [esi+3C];TGLPoints.?f3C:byte
 00486042    or          al,byte ptr ds:[4860B0];0x9 gvar_004860B0
 00486048    mov         byte ptr [esi+3C],al;TGLPoints.?f3C:byte
 0048604B    mov         byte ptr [esi+0A4],0;TGLPoints.Style:TGLPointStyle
 00486052    mov         eax,[005AD590];0x3F800000 gvar_005AD590:Single
 00486057    mov         dword ptr [esi+0A0],eax;TGLPoints.Size:Single
 0048605D    mov         dl,1
 0048605F    mov         eax,[00467A00];TAffineVectorList
 00486064    call        TAffineVectorList.Create;TAffineVectorList.Create
 00486069    mov         dword ptr [esi+98],eax;TGLPoints.?f98:TAffineVectorList
 0048606F    mov         dl,1
 00486071    mov         eax,[00467AC4];TVectorList
 00486076    call        TVectorList.Create;TVectorList.Create
 0048607B    mov         dword ptr [esi+9C],eax;TGLPoints.?f9C:TVectorList
 00486081    mov         ecx,esi
 00486083    mov         dl,1
 00486085    mov         eax,[00483750];TGLPointParameters
 0048608A    call        TGLPointParameters.Create;TGLPointParameters.Create
 0048608F    mov         dword ptr [esi+0A8],eax;TGLPoints.PointParameters:TGLPointParameters
 00486095    mov         eax,esi
 00486097    test        bl,bl
>00486099    je          004860AA
 0048609B    call        @AfterConstruction
 004860A0    pop         dword ptr fs:[0]
 004860A7    add         esp,0C
 004860AA    mov         eax,esi
 004860AC    pop         esi
 004860AD    pop         ebx
 004860AE    ret
*}
end;

//004860B4
destructor TGLPoints.Destroy;
begin
{*
 004860B4    push        ebx
 004860B5    push        esi
 004860B6    call        @BeforeDestruction
 004860BB    mov         ebx,edx
 004860BD    mov         esi,eax
 004860BF    mov         eax,dword ptr [esi+0A8];TGLPoints.PointParameters:TGLPointParameters
 004860C5    call        TObject.Free
 004860CA    mov         eax,dword ptr [esi+9C];TGLPoints.?f9C:TVectorList
 004860D0    call        TObject.Free
 004860D5    mov         eax,dword ptr [esi+98];TGLPoints.?f98:TAffineVectorList
 004860DB    call        TObject.Free
 004860E0    mov         edx,ebx
 004860E2    and         dl,0FC
 004860E5    mov         eax,esi
 004860E7    call        TGLCustomSceneObject.Destroy
 004860EC    test        bl,bl
>004860EE    jle         004860F7
 004860F0    mov         eax,esi
 004860F2    call        @ClassDestroy
 004860F7    pop         esi
 004860F8    pop         ebx
 004860F9    ret
*}
end;

//004860FC
procedure TGLPoints.Assign(Source:TPersistent);
begin
{*
 004860FC    push        ebx
 004860FD    push        esi
 004860FE    push        edi
 004860FF    mov         edi,edx
 00486101    mov         ebx,eax
 00486103    mov         eax,edi
 00486105    mov         edx,dword ptr ds:[4838B4];TGLPoints
 0048610B    call        @IsClass
 00486110    test        al,al
>00486112    je          0048615B
 00486114    mov         esi,edi
 00486116    mov         eax,dword ptr [esi+0A0]
 0048611C    mov         dword ptr [ebx+0A0],eax;TGLPoints.Size:Single
 00486122    mov         al,byte ptr [esi+0A4]
 00486128    mov         byte ptr [ebx+0A4],al;TGLPoints.Style:TGLPointStyle
 0048612E    mov         edx,dword ptr [esi+98]
 00486134    mov         eax,dword ptr [ebx+98];TGLPoints.?f98:TAffineVectorList
 0048613A    mov         ecx,dword ptr [eax]
 0048613C    call        dword ptr [ecx+8];TAffineVectorList.Assign
 0048613F    mov         edx,dword ptr [esi+9C]
 00486145    mov         eax,dword ptr [ebx+9C];TGLPoints.?f9C:TVectorList
 0048614B    mov         ecx,dword ptr [eax]
 0048614D    call        dword ptr [ecx+8];TVectorList.Assign
 00486150    mov         eax,ebx
 00486152    mov         si,0FFE7
 00486156    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048615B    mov         edx,edi
 0048615D    mov         eax,ebx
 0048615F    call        TGLCustomSceneObject.Assign
 00486164    pop         edi
 00486165    pop         esi
 00486166    pop         ebx
 00486167    ret
*}
end;

//00486168
procedure sub_00486168;
begin
{*
 00486168    push        ebx
 00486169    push        esi
 0048616A    push        edi
 0048616B    add         esp,0FFFFFFF0
 0048616E    mov         ebx,eax
 00486170    mov         eax,dword ptr [ebx+98];TGLPoints.?f98:TAffineVectorList
 00486176    mov         esi,dword ptr [eax+8];TAffineVectorList.?f8:dword
 00486179    mov         eax,dword ptr [ebx+9C];TGLPoints.?f9C:TVectorList
 0048617F    mov         edx,dword ptr [eax+8];TVectorList.?f8:dword
 00486182    mov         ecx,edx
 00486184    sub         ecx,1
>00486187    jb          0048618D
>00486189    je          004861A8
>0048618B    jmp         004861B3
 0048618D    push        3F800000
 00486192    push        3F800000
 00486197    push        3F800000
 0048619C    push        3F800000
 004861A1    call        OpenGL32.glColor4f
>004861A6    jmp         004861D5
 004861A8    mov         eax,dword ptr [eax+24];TVectorList.?f24:dword
 004861AB    push        eax
 004861AC    call        OpenGL32.glColor4fv
>004861B1    jmp         004861D5
 004861B3    cmp         esi,edx
>004861B5    jle         004861B9
 004861B7    mov         esi,edx
 004861B9    mov         eax,dword ptr [eax+24]
 004861BC    push        eax
 004861BD    push        0
 004861BF    push        1406
 004861C4    push        4
 004861C6    call        OpenGL32.glColorPointer
 004861CB    push        8076
 004861D0    call        OpenGL32.glEnableClientState
 004861D5    push        2000
 004861DA    call        OpenGL32.glPushAttrib
 004861DF    push        0B50
 004861E4    call        OpenGL32.glDisable
 004861E9    test        esi,esi
>004861EB    jne         00486210
 004861ED    mov         eax,[005AE680];^gvar_005ACFA4
 004861F2    mov         esi,eax
 004861F4    mov         edi,esp
 004861F6    movs        dword ptr [edi],dword ptr [esi]
 004861F7    movs        dword ptr [edi],dword ptr [esi]
 004861F8    movs        dword ptr [edi],dword ptr [esi]
 004861F9    movs        dword ptr [edi],dword ptr [esi]
 004861FA    push        esp
 004861FB    push        0
 004861FD    push        1406
 00486202    push        3
 00486204    call        OpenGL32.glVertexPointer
 00486209    mov         esi,1
>0048620E    jmp         00486228
 00486210    mov         eax,dword ptr [ebx+98];TGLPoints.?f98:TAffineVectorList
 00486216    mov         eax,dword ptr [eax+24];TAffineVectorList.?f24:dword
 00486219    push        eax
 0048621A    push        0
 0048621C    push        1406
 00486221    push        3
 00486223    call        OpenGL32.glVertexPointer
 00486228    push        8074
 0048622D    call        OpenGL32.glEnableClientState
 00486232    cmp         byte ptr [ebx+0AC],0;TGLPoints.NoZWrite:Boolean
>00486239    je          00486242
 0048623B    push        0
 0048623D    call        OpenGL32.glDepthMask
 00486242    push        dword ptr [ebx+0A0];TGLPoints.Size:Single
 00486248    call        OpenGL32.glPointSize
 0048624D    mov         eax,dword ptr [ebx+0A8];TGLPoints.PointParameters:TGLPointParameters
 00486253    call        00485E98
 00486258    mov         eax,[005AE18C];^gvar_005E0CFC
 0048625D    cmp         byte ptr [eax],0
>00486260    je          00486273
 00486262    cmp         esi,40
>00486265    jle         00486273
 00486267    push        esi
 00486268    push        0
 0048626A    mov         eax,[005AE620];^gvar_005E0EF8
 0048626F    mov         eax,dword ptr [eax]
 00486271    call        eax
 00486273    xor         eax,eax
 00486275    mov         al,byte ptr [ebx+0A4];TGLPoints.Style:TGLPointStyle
 0048627B    cmp         eax,4
>0048627E    ja          0048636B
 00486284    jmp         dword ptr [eax*4+48628B]
 00486284    dd          0048629F
 00486284    dd          004862AE
 00486284    dd          004862E0
 00486284    dd          0048631B
 00486284    dd          00486353
 0048629F    push        0BE2
 004862A4    call        OpenGL32.glDisable
>004862A9    jmp         0048637F
 004862AE    push        0B10
 004862B3    call        OpenGL32.glEnable
 004862B8    push        0BC0
 004862BD    call        OpenGL32.glEnable
 004862C2    push        3F000000
 004862C7    push        204
 004862CC    call        OpenGL32.glAlphaFunc
 004862D1    push        0BE2
 004862D6    call        OpenGL32.glDisable
>004862DB    jmp         0048637F
 004862E0    push        0B10
 004862E5    call        OpenGL32.glEnable
 004862EA    push        0BC0
 004862EF    call        OpenGL32.glEnable
 004862F4    push        0
 004862F6    push        205
 004862FB    call        OpenGL32.glAlphaFunc
 00486300    push        0BE2
 00486305    call        OpenGL32.glEnable
 0048630A    push        303
 0048630F    push        302
 00486314    call        OpenGL32.glBlendFunc
>00486319    jmp         0048637F
 0048631B    push        0B10
 00486320    call        OpenGL32.glEnable
 00486325    push        0BC0
 0048632A    call        OpenGL32.glEnable
 0048632F    push        0
 00486331    push        205
 00486336    call        OpenGL32.glAlphaFunc
 0048633B    push        0BE2
 00486340    call        OpenGL32.glEnable
 00486345    push        1
 00486347    push        302
 0048634C    call        OpenGL32.glBlendFunc
>00486351    jmp         0048637F
 00486353    push        0BE2
 00486358    call        OpenGL32.glEnable
 0048635D    push        1
 0048635F    push        302
 00486364    call        OpenGL32.glBlendFunc
>00486369    jmp         0048637F
 0048636B    mov         ecx,785
 00486370    mov         edx,4863FC;'C:\GLScene\glscene_v_1000714\Source\GLObjects.pas'
 00486375    mov         eax,486438;'Assertion failure'
 0048637A    call        @Assert
 0048637F    push        esi
 00486380    push        0
 00486382    push        0
 00486384    call        OpenGL32.glDrawArrays
 00486389    mov         eax,[005AE18C];^gvar_005E0CFC
 0048638E    cmp         byte ptr [eax],0
>00486391    je          004863A1
 00486393    cmp         esi,40
>00486396    jle         004863A1
 00486398    mov         eax,[005AE3E8];^gvar_005E0EFC
 0048639D    mov         eax,dword ptr [eax]
 0048639F    call        eax
 004863A1    mov         eax,dword ptr [ebx+0A8];TGLPoints.PointParameters:TGLPointParameters
 004863A7    call        00485EF8
 004863AC    cmp         byte ptr [ebx+0AC],0;TGLPoints.NoZWrite:Boolean
>004863B3    je          004863BC
 004863B5    push        0FF
 004863B7    call        OpenGL32.glDepthMask
 004863BC    push        8074
 004863C1    call        OpenGL32.glDisableClientState
 004863C6    mov         eax,dword ptr [ebx+9C];TGLPoints.?f9C:TVectorList
 004863CC    cmp         dword ptr [eax+8],1;TVectorList.?f8:dword
>004863D0    jle         004863DC
 004863D2    push        8076
 004863D7    call        OpenGL32.glDisableClientState
 004863DC    call        OpenGL32.glPopAttrib
 004863E1    push        0
 004863E3    push        204
 004863E8    call        OpenGL32.glAlphaFunc
 004863ED    add         esp,10
 004863F0    pop         edi
 004863F1    pop         esi
 004863F2    pop         ebx
 004863F3    ret
*}
end;

//0048644C
function TGLPoints.IsStoredSize(Value:Single):Boolean;
begin
{*
 0048644C    mov         edx,eax
 0048644E    fld         dword ptr [edx+0A0];TGLPoints.Size:Single
 00486454    fcomp       dword ptr ds:[5AD590];gvar_005AD590:Single
 0048645A    fnstsw      al
 0048645C    sahf
 0048645D    setne       al
 00486460    ret
*}
end;

//00486464
procedure TGLPoints.SetNoZWrite(Value:Boolean);
begin
{*
 00486464    push        esi
 00486465    mov         esi,eax
 00486467    cmp         dl,byte ptr [esi+0AC];TGLPoints.NoZWrite:Boolean
>0048646D    je          00486480
 0048646F    mov         byte ptr [esi+0AC],dl;TGLPoints.NoZWrite:Boolean
 00486475    mov         eax,esi
 00486477    mov         si,0FFE7
 0048647B    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486480    pop         esi
 00486481    ret
*}
end;

//00486484
procedure TGLPoints.SetStatic(Value:Boolean);
begin
{*
 00486484    push        esi
 00486485    mov         esi,eax
 00486487    cmp         dl,byte ptr [esi+0AD];TGLPoints.Static:Boolean
>0048648D    je          004864BE
 0048648F    mov         byte ptr [esi+0AD],dl;TGLPoints.Static:Boolean
 00486495    test        dl,dl
>00486497    je          004864A8
 00486499    mov         al,[004864C0];0x1 gvar_004864C0
 0048649E    not         eax
 004864A0    and         al,byte ptr [esi+3C];TGLPoints.?f3C:byte
 004864A3    mov         byte ptr [esi+3C],al;TGLPoints.?f3C:byte
>004864A6    jmp         004864B3
 004864A8    mov         al,[004864C0];0x1 gvar_004864C0
 004864AD    or          al,byte ptr [esi+3C];TGLPoints.?f3C:byte
 004864B0    mov         byte ptr [esi+3C],al;TGLPoints.?f3C:byte
 004864B3    mov         eax,esi
 004864B5    mov         si,0FFE7
 004864B9    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004864BE    pop         esi
 004864BF    ret
*}
end;

//004864C4
{*procedure TGLPoints.SetSize(Value:Single; ?:?);
begin
 004864C4    push        ebp
 004864C5    mov         ebp,esp
 004864C7    push        esi
 004864C8    mov         edx,eax
 004864CA    fld         dword ptr [edx+0A0];TGLPoints.Size:Single
 004864D0    fcomp       dword ptr [ebp+8]
 004864D3    fnstsw      al
 004864D5    sahf
>004864D6    je          004864EC
 004864D8    mov         eax,dword ptr [ebp+8]
 004864DB    mov         dword ptr [edx+0A0],eax;TGLPoints.Size:Single
 004864E1    mov         eax,edx
 004864E3    mov         si,0FFE7
 004864E7    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004864EC    pop         esi
 004864ED    pop         ebp
 004864EE    ret         4
end;*}

//004864F4
procedure TGLPoints.SetStyle(Value:TGLPointStyle);
begin
{*
 004864F4    push        esi
 004864F5    mov         esi,eax
 004864F7    cmp         dl,byte ptr [esi+0A4];TGLPoints.Style:TGLPointStyle
>004864FD    je          00486510
 004864FF    mov         byte ptr [esi+0A4],dl;TGLPoints.Style:TGLPointStyle
 00486505    mov         eax,esi
 00486507    mov         si,0FFE7
 0048650B    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486510    pop         esi
 00486511    ret
*}
end;

//00486514
procedure TGLPoints.SetPointParameters(Value:TGLPointParameters);
begin
{*
 00486514    mov         eax,dword ptr [eax+0A8];TGLPoints.PointParameters:TGLPointParameters
 0048651A    mov         ecx,dword ptr [eax]
 0048651C    call        dword ptr [ecx+8];TGLPointParameters.Assign
 0048651F    ret
*}
end;

//00486520
constructor TGLLineBase.Create(AOwner:TComponent);
begin
{*
 00486520    push        ebp
 00486521    mov         ebp,esp
 00486523    push        ecx
 00486524    push        ebx
 00486525    push        esi
 00486526    test        dl,dl
>00486528    je          00486532
 0048652A    add         esp,0FFFFFFF0
 0048652D    call        @ClassCreate
 00486532    mov         byte ptr [ebp-1],dl
 00486535    mov         ebx,eax
 00486537    xor         edx,edx
 00486539    mov         eax,ebx
 0048653B    call        TGLCustomSceneObject.Create
 00486540    mov         ecx,ebx
 00486542    mov         dl,1
 00486544    mov         eax,[00470BF8];TGLColor
 00486549    call        TGLColor.Create;TGLColor.Create
 0048654E    mov         esi,eax
 00486550    mov         dword ptr [ebx+98],esi;TGLLineBase.LineColor:TGLColor
 00486556    mov         edx,dword ptr ds:[5AE830];^gvar_005AD44C
 0048655C    mov         eax,esi
 0048655E    call        00472B10
 00486563    mov         word ptr [ebx+9C],0FFFF;TGLLineBase.LinePattern:word
 0048656C    mov         byte ptr [ebx+0A4],0;TGLLineBase.AntiAliased:Boolean
 00486573    mov         dword ptr [ebx+0A0],3F800000;TGLLineBase.LineWidth:Single
 0048657D    mov         eax,ebx
 0048657F    cmp         byte ptr [ebp-1],0
>00486583    je          00486594
 00486585    call        @AfterConstruction
 0048658A    pop         dword ptr fs:[0]
 00486591    add         esp,0C
 00486594    mov         eax,ebx
 00486596    pop         esi
 00486597    pop         ebx
 00486598    pop         ecx
 00486599    pop         ebp
 0048659A    ret
*}
end;

//0048659C
destructor TGLLineBase.Destroy;
begin
{*
 0048659C    push        ebx
 0048659D    push        esi
 0048659E    call        @BeforeDestruction
 004865A3    mov         ebx,edx
 004865A5    mov         esi,eax
 004865A7    mov         eax,dword ptr [esi+98];TGLLineBase.LineColor:TGLColor
 004865AD    call        TObject.Free
 004865B2    mov         edx,ebx
 004865B4    and         dl,0FC
 004865B7    mov         eax,esi
 004865B9    call        TGLCustomSceneObject.Destroy
 004865BE    test        bl,bl
>004865C0    jle         004865C9
 004865C2    mov         eax,esi
 004865C4    call        @ClassDestroy
 004865C9    pop         esi
 004865CA    pop         ebx
 004865CB    ret
*}
end;

//004865CC
procedure TGLLineBase.SetLineColor(Value:TGLColor);
begin
{*
 004865CC    push        esi
 004865CD    mov         esi,eax
 004865CF    lea         eax,[edx+18];TGLColor.Red:Single
 004865D2    mov         edx,eax
 004865D4    mov         eax,dword ptr [esi+98];TGLLineBase.LineColor:TGLColor
 004865DA    call        00472B48
 004865DF    mov         eax,esi
 004865E1    mov         si,0FFE7
 004865E5    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004865EA    pop         esi
 004865EB    ret
*}
end;

//004865EC
procedure TGLLineBase.SetLinePattern(Value:Word);
begin
{*
 004865EC    push        esi
 004865ED    mov         esi,eax
 004865EF    cmp         dx,word ptr [esi+9C];TGLLineBase.LinePattern:word
>004865F6    je          0048660A
 004865F8    mov         word ptr [esi+9C],dx;TGLLineBase.LinePattern:word
 004865FF    mov         eax,esi
 00486601    mov         si,0FFE7
 00486605    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048660A    pop         esi
 0048660B    ret
*}
end;

//0048660C
{*procedure TGLLineBase.SetLineWidth(Value:Single; ?:?);
begin
 0048660C    push        ebp
 0048660D    mov         ebp,esp
 0048660F    push        esi
 00486610    mov         edx,eax
 00486612    fld         dword ptr [edx+0A0];TGLLineBase.LineWidth:Single
 00486618    fcomp       dword ptr [ebp+8]
 0048661B    fnstsw      al
 0048661D    sahf
>0048661E    je          00486634
 00486620    mov         eax,dword ptr [ebp+8]
 00486623    mov         dword ptr [edx+0A0],eax;TGLLineBase.LineWidth:Single
 00486629    mov         eax,edx
 0048662B    mov         si,0FFE7
 0048662F    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486634    pop         esi
 00486635    pop         ebp
 00486636    ret         4
end;*}

//0048663C
function TGLLineBase.IsStoredLineWidth(Value:Single):Boolean;
begin
{*
 0048663C    mov         edx,eax
 0048663E    fld         dword ptr [edx+0A0];TGLLineBase.LineWidth:Single
 00486644    fcomp       dword ptr ds:[486654];1:Single
 0048664A    fnstsw      al
 0048664C    sahf
 0048664D    setne       al
 00486650    ret
*}
end;

//00486658
procedure TGLLineBase.SetAntiAliased(Value:Boolean);
begin
{*
 00486658    push        esi
 00486659    mov         esi,eax
 0048665B    cmp         dl,byte ptr [esi+0A4];TGLLineBase.AntiAliased:Boolean
>00486661    je          00486674
 00486663    mov         byte ptr [esi+0A4],dl;TGLLineBase.AntiAliased:Boolean
 00486669    mov         eax,esi
 0048666B    mov         si,0FFE7
 0048666F    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486674    pop         esi
 00486675    ret
*}
end;

//00486678
procedure TGLLineBase.Assign(Source:TPersistent);
begin
{*
 00486678    push        ebx
 00486679    push        esi
 0048667A    push        edi
 0048667B    mov         esi,edx
 0048667D    mov         ebx,eax
 0048667F    mov         eax,esi
 00486681    mov         edx,dword ptr ds:[483C94];TGLLineBase
 00486687    call        @IsClass
 0048668C    test        al,al
>0048668E    je          004866C9
 00486690    mov         edi,esi
 00486692    mov         edx,dword ptr [edi+98]
 00486698    mov         eax,ebx
 0048669A    call        TGLLineBase.SetLineColor
 0048669F    mov         dx,word ptr [edi+9C]
 004866A6    mov         eax,ebx
 004866A8    call        TGLLineBase.SetLinePattern
 004866AD    push        dword ptr [edi+0A0]
 004866B3    mov         eax,ebx
 004866B5    call        TGLLineBase.SetLineWidth
 004866BA    mov         dl,byte ptr [edi+0A4]
 004866C0    mov         eax,ebx
 004866C2    call        TGLLineBase.SetAntiAliased
>004866C7    jmp         004866D2
 004866C9    mov         edx,esi
 004866CB    mov         eax,ebx
 004866CD    call        TGLCustomSceneObject.Assign
 004866D2    pop         edi
 004866D3    pop         esi
 004866D4    pop         ebx
 004866D5    ret
*}
end;

//004866D8
procedure sub_004866D8(?:TGLLines);
begin
{*
 004866D8    push        ebx
 004866D9    push        esi
 004866DA    mov         ebx,eax
 004866DC    push        6005
 004866E1    call        OpenGL32.glPushAttrib
 004866E6    push        0B50
 004866EB    call        OpenGL32.glDisable
 004866F0    cmp         word ptr [ebx+9C],0FFFF
>004866F9    je          0048672D
 004866FB    push        0B24
 00486700    call        OpenGL32.glEnable
 00486705    push        0BE2
 0048670A    call        OpenGL32.glEnable
 0048670F    push        303
 00486714    push        302
 00486719    call        OpenGL32.glBlendFunc
 0048671E    mov         ax,word ptr [ebx+9C]
 00486725    push        eax
 00486726    push        1
 00486728    call        OpenGL32.glLineStipple
 0048672D    cmp         byte ptr [ebx+0A4],0
>00486734    je          0048675B
 00486736    push        0B20
 0048673B    call        OpenGL32.glEnable
 00486740    push        0BE2
 00486745    call        OpenGL32.glEnable
 0048674A    push        303
 0048674F    push        302
 00486754    call        OpenGL32.glBlendFunc
>00486759    jmp         00486765
 0048675B    push        0B20
 00486760    call        OpenGL32.glDisable
 00486765    push        dword ptr [ebx+0A0]
 0048676B    call        OpenGL32.glLineWidth
 00486770    mov         esi,dword ptr [ebx+98]
 00486776    fld         dword ptr [esi+24]
 00486779    fcomp       dword ptr ds:[4867CC];1:Single
 0048677F    fnstsw      al
 00486781    sahf
>00486782    je          004867BA
 00486784    cmp         byte ptr [ebx+0A4],0
>0048678B    jne         004867A6
 0048678D    push        0BE2
 00486792    call        OpenGL32.glEnable
 00486797    push        303
 0048679C    push        302
 004867A1    call        OpenGL32.glBlendFunc
 004867A6    mov         eax,dword ptr [ebx+98]
 004867AC    call        00472C80
 004867B1    push        eax
 004867B2    call        OpenGL32.glColor4fv
 004867B7    pop         esi
 004867B8    pop         ebx
 004867B9    ret
 004867BA    mov         eax,esi
 004867BC    call        00472C80
 004867C1    push        eax
 004867C2    call        OpenGL32.glColor3fv
 004867C7    pop         esi
 004867C8    pop         ebx
 004867C9    ret
*}
end;

//004867D0
procedure sub_004867D0;
begin
{*
 004867D0    call        OpenGL32.glPopAttrib
 004867D5    ret
*}
end;

//004867D8
constructor TGLLinesNode.Create(Collection:TCollection);
begin
{*
 004867D8    push        ebp
 004867D9    mov         ebp,esp
 004867DB    push        ecx
 004867DC    push        ebx
 004867DD    push        esi
 004867DE    push        edi
 004867DF    test        dl,dl
>004867E1    je          004867EB
 004867E3    add         esp,0FFFFFFF0
 004867E6    call        @ClassCreate
 004867EB    mov         edi,ecx
 004867ED    mov         byte ptr [ebp-1],dl
 004867F0    mov         ebx,eax
 004867F2    mov         ecx,edi
 004867F4    xor         edx,edx
 004867F6    mov         eax,ebx
 004867F8    call        TGLNode.Create
 004867FD    mov         ecx,ebx
 004867FF    mov         dl,1
 00486801    mov         eax,[00470BF8];TGLColor
 00486806    call        TGLColor.Create;TGLColor.Create
 0048680B    mov         dword ptr [ebx+1C],eax;TGLLinesNode.Color:TGLColor
 0048680E    mov         eax,edi
 00486810    mov         si,0FFFF
 00486814    call        @CallDynaInst;TPersistent.sub_0041ADA4
 00486819    mov         edx,dword ptr ds:[484018];TGLLines
 0048681F    call        @AsClass
 00486824    mov         eax,dword ptr [eax+0B0];TGLLines.NodeColor:TGLColor
 0048682A    lea         edx,[eax+18];TGLColor.Red:Single
 0048682D    mov         eax,dword ptr [ebx+1C];TGLLinesNode.Color:TGLColor
 00486830    call        00472B10
 00486835    mov         eax,dword ptr [ebx+1C];TGLLinesNode.Color:TGLColor
 00486838    mov         dword ptr [eax+14],ebx;TGLColor.?f14:TGLTextureExItem
 0048683B    mov         dword ptr [eax+10],4868D0;TGLColor.?f10:? sub_004868D0
 00486842    mov         eax,ebx
 00486844    cmp         byte ptr [ebp-1],0
>00486848    je          00486859
 0048684A    call        @AfterConstruction
 0048684F    pop         dword ptr fs:[0]
 00486856    add         esp,0C
 00486859    mov         eax,ebx
 0048685B    pop         edi
 0048685C    pop         esi
 0048685D    pop         ebx
 0048685E    pop         ecx
 0048685F    pop         ebp
 00486860    ret
*}
end;

//00486864
destructor TGLLinesNode.Destroy;
begin
{*
 00486864    push        ebx
 00486865    push        esi
 00486866    call        @BeforeDestruction
 0048686B    mov         ebx,edx
 0048686D    mov         esi,eax
 0048686F    mov         eax,dword ptr [esi+1C];TGLLinesNode.Color:TGLColor
 00486872    call        TObject.Free
 00486877    mov         edx,ebx
 00486879    and         dl,0FC
 0048687C    mov         eax,esi
 0048687E    call        TGLNode.Destroy
 00486883    test        bl,bl
>00486885    jle         0048688E
 00486887    mov         eax,esi
 00486889    call        @ClassDestroy
 0048688E    pop         esi
 0048688F    pop         ebx
 00486890    ret
*}
end;

//00486894
procedure TGLLinesNode.Assign(Source:TPersistent);
begin
{*
 00486894    push        ebx
 00486895    push        esi
 00486896    mov         esi,edx
 00486898    mov         ebx,eax
 0048689A    mov         eax,esi
 0048689C    mov         edx,dword ptr ds:[483B1C];TGLLinesNode
 004868A2    call        @IsClass
 004868A7    test        al,al
>004868A9    je          004868B6
 004868AB    mov         edx,dword ptr [esi+1C]
 004868AE    mov         eax,dword ptr [ebx+1C];TGLLinesNode.Color:TGLColor
 004868B1    mov         ecx,dword ptr [eax]
 004868B3    call        dword ptr [ecx+8];TGLColor.Assign
 004868B6    mov         edx,esi
 004868B8    mov         eax,ebx
 004868BA    call        TGLNode.Assign
 004868BF    pop         esi
 004868C0    pop         ebx
 004868C1    ret
*}
end;

//004868C4
procedure TGLLinesNode.SetColor(Value:TGLColor);
begin
{*
 004868C4    mov         eax,dword ptr [eax+1C];TGLLinesNode.Color:TGLColor
 004868C7    mov         ecx,dword ptr [eax]
 004868C9    call        dword ptr [ecx+8];TGLColor.Assign
 004868CC    ret
*}
end;

//004868D0
{*procedure sub_004868D0(?:?);
begin
 004868D0    push        ebx
 004868D1    mov         ebx,eax
 004868D3    mov         eax,dword ptr [ebx+4]
 004868D6    mov         edx,dword ptr ds:[46B2EC];TGLNodes
 004868DC    call        @AsClass
 004868E1    mov         edx,dword ptr [eax]
 004868E3    call        dword ptr [edx+28];TGLNodes.sub_0046BAAC
 004868E6    pop         ebx
 004868E7    ret
end;*}

//004868E8
procedure TGLLinesNode.IsStoredColor(Value:TGLColor);
begin
{*
 004868E8    push        ebx
 004868E9    push        esi
 004868EA    mov         ebx,eax
 004868EC    mov         eax,dword ptr [ebx+4];TGLLinesNode.FCollection:TCollection
 004868EF    mov         si,0FFFF
 004868F3    call        @CallDynaInst;TPersistent.sub_0041ADA4
 004868F8    mov         edx,dword ptr ds:[484018];TGLLines
 004868FE    call        @AsClass
 00486903    mov         eax,dword ptr [eax+0B0];TGLLines.NodeColor:TGLColor
 00486909    add         eax,18;TGLColor.Red:Single
 0048690C    mov         edx,dword ptr [ebx+1C];TGLLinesNode.Color:TGLColor
 0048690F    add         edx,18;TGLColor.Red:Single
 00486912    call        0045D870
 00486917    xor         al,1
 00486919    pop         esi
 0048691A    pop         ebx
 0048691B    ret
*}
end;

//0048691C
constructor TGLLinesNodes.Create;
begin
{*
 0048691C    push        ebx
 0048691D    push        esi
 0048691E    test        dl,dl
>00486920    je          0048692A
 00486922    add         esp,0FFFFFFF0
 00486925    call        @ClassCreate
 0048692A    mov         ebx,edx
 0048692C    mov         esi,eax
 0048692E    mov         eax,[00483B1C];TGLLinesNode
 00486933    push        eax
 00486934    xor         edx,edx
 00486936    mov         eax,esi
 00486938    call        0046BA2C
 0048693D    mov         eax,esi
 0048693F    test        bl,bl
>00486941    je          00486952
 00486943    call        @AfterConstruction
 00486948    pop         dword ptr fs:[0]
 0048694F    add         esp,0C
 00486952    mov         eax,esi
 00486954    pop         esi
 00486955    pop         ebx
 00486956    ret
*}
end;

//00486958
procedure sub_00486958;
begin
{*
 00486958    push        ebx
 00486959    push        esi
 0048695A    mov         ebx,eax
 0048695C    mov         eax,ebx
 0048695E    mov         si,0FFFF
 00486962    call        @CallDynaInst;TOwnedCollection.sub_0041ADA4
 00486967    test        eax,eax
>00486969    je          0048698A
 0048696B    mov         eax,ebx
 0048696D    mov         si,0FFFF
 00486971    call        @CallDynaInst;TOwnedCollection.sub_0041ADA4
 00486976    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 0048697C    call        @AsClass
 00486981    mov         si,0FFE7
 00486985    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048698A    pop         esi
 0048698B    pop         ebx
 0048698C    ret
*}
end;

//00486990
constructor TGLNodedLines.Create(AOwner:TComponent);
begin
{*
 00486990    push        ebp
 00486991    mov         ebp,esp
 00486993    push        ecx
 00486994    push        ebx
 00486995    push        esi
 00486996    push        edi
 00486997    test        dl,dl
>00486999    je          004869A3
 0048699B    add         esp,0FFFFFFF0
 0048699E    call        @ClassCreate
 004869A3    mov         byte ptr [ebp-1],dl
 004869A6    mov         ebx,eax
 004869A8    xor         edx,edx
 004869AA    mov         eax,ebx
 004869AC    call        TGLLineBase.Create
 004869B1    mov         ecx,ebx
 004869B3    mov         dl,1
 004869B5    mov         eax,[00483BE0];TGLLinesNodes
 004869BA    call        TGLLinesNodes.Create;TGLLinesNodes.Create
 004869BF    mov         dword ptr [ebx+0A8],eax;TGLNodedLines.Nodes:TGLLinesNodes
 004869C5    mov         ecx,ebx
 004869C7    mov         dl,1
 004869C9    mov         eax,[00470BF8];TGLColor
 004869CE    call        TGLColor.Create;TGLColor.Create
 004869D3    mov         esi,eax
 004869D5    mov         dword ptr [ebx+0B0],esi;TGLNodedLines.NodeColor:TGLColor
 004869DB    mov         edx,dword ptr ds:[5AE124];^gvar_005AD45C
 004869E1    mov         eax,esi
 004869E3    call        00472B10
 004869E8    mov         eax,dword ptr [ebx+0B0];TGLNodedLines.NodeColor:TGLColor
 004869EE    mov         dword ptr [eax+14],ebx;TGLColor.?f14:TGLTextureExItem
 004869F1    mov         dword ptr [eax+10],486AB8;TGLColor.?f10:? sub_00486AB8
 004869F8    mov         eax,[005AE124];^gvar_005AD45C
 004869FD    mov         esi,eax
 004869FF    lea         edi,[ebx+0B8];TGLNodedLines.?fB8:?
 00486A05    movs        dword ptr [edi],dword ptr [esi]
 00486A06    movs        dword ptr [edi],dword ptr [esi]
 00486A07    movs        dword ptr [edi],dword ptr [esi]
 00486A08    movs        dword ptr [edi],dword ptr [esi]
 00486A09    mov         byte ptr [ebx+0AC],1;TGLNodedLines.NodesAspect:TLineNodesAspect
 00486A10    mov         dword ptr [ebx+0B4],3F800000;TGLNodedLines.NodeSize:Single
 00486A1A    mov         eax,ebx
 00486A1C    cmp         byte ptr [ebp-1],0
>00486A20    je          00486A31
 00486A22    call        @AfterConstruction
 00486A27    pop         dword ptr fs:[0]
 00486A2E    add         esp,0C
 00486A31    mov         eax,ebx
 00486A33    pop         edi
 00486A34    pop         esi
 00486A35    pop         ebx
 00486A36    pop         ecx
 00486A37    pop         ebp
 00486A38    ret
*}
end;

//00486A3C
destructor TGLNodedLines.Destroy;
begin
{*
 00486A3C    push        ebx
 00486A3D    push        esi
 00486A3E    call        @BeforeDestruction
 00486A43    mov         ebx,edx
 00486A45    mov         esi,eax
 00486A47    mov         eax,dword ptr [esi+0A8];TGLNodedLines.Nodes:TGLLinesNodes
 00486A4D    call        TObject.Free
 00486A52    mov         eax,dword ptr [esi+0B0];TGLNodedLines.NodeColor:TGLColor
 00486A58    call        TObject.Free
 00486A5D    mov         edx,ebx
 00486A5F    and         dl,0FC
 00486A62    mov         eax,esi
 00486A64    call        TGLLineBase.Destroy
 00486A69    test        bl,bl
>00486A6B    jle         00486A74
 00486A6D    mov         eax,esi
 00486A6F    call        @ClassDestroy
 00486A74    pop         esi
 00486A75    pop         ebx
 00486A76    ret
*}
end;

//00486A78
procedure TGLNodedLines.SetNodesAspect(Value:TLineNodesAspect);
begin
{*
 00486A78    push        esi
 00486A79    mov         esi,eax
 00486A7B    cmp         dl,byte ptr [esi+0AC];TGLNodedLines.NodesAspect:TLineNodesAspect
>00486A81    je          00486A94
 00486A83    mov         byte ptr [esi+0AC],dl;TGLNodedLines.NodesAspect:TLineNodesAspect
 00486A89    mov         eax,esi
 00486A8B    mov         si,0FFE7
 00486A8F    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486A94    pop         esi
 00486A95    ret
*}
end;

//00486A98
procedure TGLNodedLines.SetNodeColor(Value:TGLColor);
begin
{*
 00486A98    push        esi
 00486A99    mov         esi,eax
 00486A9B    lea         eax,[edx+18];TGLColor.Red:Single
 00486A9E    mov         edx,eax
 00486AA0    mov         eax,dword ptr [esi+0B0];TGLNodedLines.NodeColor:TGLColor
 00486AA6    call        00472B48
 00486AAB    mov         eax,esi
 00486AAD    mov         si,0FFE7
 00486AB1    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486AB6    pop         esi
 00486AB7    ret
*}
end;

//00486AB8
{*procedure sub_00486AB8(?:?);
begin
 00486AB8    push        ebx
 00486AB9    push        esi
 00486ABA    push        edi
 00486ABB    mov         ebx,eax
 00486ABD    mov         eax,dword ptr [ebx+0A8]
 00486AC3    call        TCollection.GetCount
 00486AC8    mov         edi,eax
 00486ACA    dec         edi
 00486ACB    test        edi,edi
>00486ACD    jl          00486B13
 00486ACF    inc         edi
 00486AD0    xor         esi,esi
 00486AD2    mov         edx,esi
 00486AD4    mov         eax,dword ptr [ebx+0A8]
 00486ADA    call        0046BA84
 00486ADF    mov         eax,dword ptr [eax+1C]
 00486AE2    add         eax,18
 00486AE5    lea         edx,[ebx+0B8]
 00486AEB    call        0045D870
 00486AF0    test        al,al
>00486AF2    je          00486B0F
 00486AF4    mov         edx,esi
 00486AF6    mov         eax,dword ptr [ebx+0A8]
 00486AFC    call        0046BA84
 00486B01    mov         eax,dword ptr [eax+1C]
 00486B04    mov         edx,dword ptr [ebx+0B0]
 00486B0A    mov         ecx,dword ptr [eax]
 00486B0C    call        dword ptr [ecx+8]
 00486B0F    inc         esi
 00486B10    dec         edi
>00486B11    jne         00486AD2
 00486B13    mov         eax,dword ptr [ebx+0B0]
 00486B19    lea         edx,[eax+18]
 00486B1C    lea         eax,[ebx+0B8]
 00486B22    call        0045C9C0
 00486B27    pop         edi
 00486B28    pop         esi
 00486B29    pop         ebx
 00486B2A    ret
end;*}

//00486B2C
procedure TGLNodedLines.SetNodes(Value:TGLLinesNodes);
begin
{*
 00486B2C    push        esi
 00486B2D    mov         esi,eax
 00486B2F    mov         eax,dword ptr [esi+0A8];TGLNodedLines.Nodes:TGLLinesNodes
 00486B35    mov         ecx,dword ptr [eax]
 00486B37    call        dword ptr [ecx+8];TCollection.Assign
 00486B3A    mov         eax,esi
 00486B3C    mov         si,0FFE7
 00486B40    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486B45    pop         esi
 00486B46    ret
*}
end;

//00486B48
{*procedure TGLNodedLines.SetNodeSize(Value:Single; ?:?);
begin
 00486B48    push        ebp
 00486B49    mov         ebp,esp
 00486B4B    push        esi
 00486B4C    mov         edx,eax
 00486B4E    fld         dword ptr [ebp+8]
 00486B51    fcomp       dword ptr ds:[486B84];0:Single
 00486B57    fnstsw      al
 00486B59    sahf
>00486B5A    ja          00486B68
 00486B5C    mov         dword ptr [edx+0B4],3F800000;TGLNodedLines.NodeSize:Single
>00486B66    jmp         00486B71
 00486B68    mov         eax,dword ptr [ebp+8]
 00486B6B    mov         dword ptr [edx+0B4],eax;TGLNodedLines.NodeSize:Single
 00486B71    mov         eax,edx
 00486B73    mov         si,0FFE7
 00486B77    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486B7C    pop         esi
 00486B7D    pop         ebp
 00486B7E    ret         4
end;*}

//00486B88
function TGLNodedLines.IsStoredNodeSize(Value:Single):Boolean;
begin
{*
 00486B88    mov         edx,eax
 00486B8A    fld         dword ptr [edx+0B4];TGLNodedLines.NodeSize:Single
 00486B90    fcomp       dword ptr ds:[486BA0];1:Single
 00486B96    fnstsw      al
 00486B98    sahf
 00486B99    setne       al
 00486B9C    ret
*}
end;

//00486BA4
procedure TGLNodedLines.Assign(Source:TPersistent);
begin
{*
 00486BA4    push        ebx
 00486BA5    push        esi
 00486BA6    push        edi
 00486BA7    mov         esi,edx
 00486BA9    mov         ebx,eax
 00486BAB    mov         eax,esi
 00486BAD    mov         edx,dword ptr ds:[483E3C];TGLNodedLines
 00486BB3    call        @IsClass
 00486BB8    test        al,al
>00486BBA    je          00486BF7
 00486BBC    mov         edi,esi
 00486BBE    mov         edx,dword ptr [edi+0A8]
 00486BC4    mov         eax,ebx
 00486BC6    call        TGLNodedLines.SetNodes
 00486BCB    mov         al,byte ptr [edi+0AC]
 00486BD1    mov         byte ptr [ebx+0AC],al;TGLNodedLines.NodesAspect:TLineNodesAspect
 00486BD7    mov         eax,dword ptr [edi+0B0]
 00486BDD    lea         edx,[eax+18]
 00486BE0    mov         eax,dword ptr [ebx+0B0];TGLNodedLines.NodeColor:TGLColor
 00486BE6    call        00472B48
 00486BEB    mov         eax,dword ptr [edi+0B4]
 00486BF1    mov         dword ptr [ebx+0B4],eax;TGLNodedLines.NodeSize:Single
 00486BF7    mov         edx,esi
 00486BF9    mov         eax,ebx
 00486BFB    call        TGLLineBase.Assign
 00486C00    pop         edi
 00486C01    pop         esi
 00486C02    pop         ebx
 00486C03    ret
*}
end;

//00486C04
{*procedure sub_00486C04(?:TGLLines; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00486C04    push        ebp
 00486C05    mov         ebp,esp
 00486C07    push        ebx
 00486C08    push        esi
 00486C09    push        edi
 00486C0A    mov         edi,ecx
 00486C0C    mov         esi,edx
 00486C0E    mov         ebx,eax
 00486C10    call        OpenGL32.glPushMatrix
 00486C15    push        dword ptr [ebp+8]
 00486C18    push        dword ptr [ebp+0C]
 00486C1B    push        dword ptr [ebp+10]
 00486C1E    call        OpenGL32.glTranslatef
 00486C23    mov         al,byte ptr [ebx+0AC]
 00486C29    dec         al
>00486C2B    je          00486C3A
 00486C2D    dec         al
>00486C2F    je          00486C5D
 00486C31    dec         al
>00486C33    je          00486C74
>00486C35    jmp         00486CFE
 00486C3A    fld         dword ptr [ebx+0B4]
 00486C40    fmul        dword ptr ds:[486D20];0.5:Single
 00486C46    add         esp,0FFFFFFFC
 00486C49    fstp        dword ptr [esp]
 00486C4C    wait
 00486C4D    mov         eax,esi
 00486C4F    mov         dx,0CCCC
 00486C53    call        0047B1B4
>00486C58    jmp         00486D12
 00486C5D    push        dword ptr [ebx+0B4]
 00486C63    lea         ecx,[edi+18]
 00486C66    mov         eax,esi
 00486C68    xor         edx,edx
 00486C6A    call        00484790
>00486C6F    jmp         00486D12
 00486C74    fld         dword ptr [ebx+0B4]
 00486C7A    fcomp       dword ptr ds:[486D24];1:Single
 00486C80    fnstsw      al
 00486C82    sahf
>00486C83    je          00486CD2
 00486C85    call        OpenGL32.glPushMatrix
 00486C8A    push        dword ptr [ebx+0B4]
 00486C90    push        dword ptr [ebx+0B4]
 00486C96    push        dword ptr [ebx+0B4]
 00486C9C    call        OpenGL32.glScalef
 00486CA1    mov         eax,[005AE6EC];^gvar_005AD42C
 00486CA6    push        eax
 00486CA7    lea         eax,[edi+18]
 00486CAA    push        eax
 00486CAB    mov         eax,[005AE694];^gvar_005AD41C
 00486CB0    push        eax
 00486CB1    push        0
 00486CB3    mov         ecx,dword ptr ds:[5AE694];^gvar_005AD41C
 00486CB9    mov         eax,dword ptr [esi+5C]
 00486CBC    mov         edx,404
 00486CC1    call        0046D6EC
 00486CC6    call        00484944
 00486CCB    call        OpenGL32.glPopMatrix
>00486CD0    jmp         00486D12
 00486CD2    mov         eax,[005AE6EC];^gvar_005AD42C
 00486CD7    push        eax
 00486CD8    lea         eax,[edi+18]
 00486CDB    push        eax
 00486CDC    mov         eax,[005AE694];^gvar_005AD41C
 00486CE1    push        eax
 00486CE2    push        0
 00486CE4    mov         ecx,dword ptr ds:[5AE694];^gvar_005AD41C
 00486CEA    mov         eax,dword ptr [esi+5C]
 00486CED    mov         edx,404
 00486CF2    call        0046D6EC
 00486CF7    call        00484944
>00486CFC    jmp         00486D12
 00486CFE    mov         ecx,912
 00486D03    mov         edx,486D30;'C:\GLScene\glscene_v_1000714\Source\GLObjects.pas'
 00486D08    mov         eax,486D6C;'Assertion failure'
 00486D0D    call        @Assert
 00486D12    call        OpenGL32.glPopMatrix
 00486D17    pop         edi
 00486D18    pop         esi
 00486D19    pop         ebx
 00486D1A    pop         ebp
 00486D1B    ret         0C
end;*}

//00486D80
{*procedure sub_00486D80(?:?);
begin
 00486D80    push        ebx
 00486D81    push        esi
 00486D82    push        edi
 00486D83    push        ebp
 00486D84    add         esp,0FFFFFFF0
 00486D87    mov         ebp,edx
 00486D89    mov         edi,eax
 00486D8B    mov         eax,ebp
 00486D8D    call        0045CA68
 00486D92    mov         eax,dword ptr [edi+0A8];TGLNodedLines.Nodes:TGLLinesNodes
 00486D98    call        TCollection.GetCount
 00486D9D    mov         ebx,eax
 00486D9F    dec         ebx
 00486DA0    test        ebx,ebx
>00486DA2    jl          00486DCB
 00486DA4    inc         ebx
 00486DA5    xor         esi,esi
 00486DA7    mov         eax,dword ptr [edi+0A8];TGLNodedLines.Nodes:TGLLinesNodes
 00486DAD    mov         edx,esi
 00486DAF    call        0046BA84
 00486DB4    add         eax,0C
 00486DB7    mov         edx,esp
 00486DB9    call        0045D9E0
 00486DBE    mov         edx,esp
 00486DC0    mov         eax,ebp
 00486DC2    call        0045F780
 00486DC7    inc         esi
 00486DC8    dec         ebx
>00486DC9    jne         00486DA7
 00486DCB    add         esp,10
 00486DCE    pop         ebp
 00486DCF    pop         edi
 00486DD0    pop         esi
 00486DD1    pop         ebx
 00486DD2    ret
end;*}

//00486DD4
constructor TGLLines.Create(AOwner:TComponent);
begin
{*
 00486DD4    push        ebx
 00486DD5    push        esi
 00486DD6    test        dl,dl
>00486DD8    je          00486DE2
 00486DDA    add         esp,0FFFFFFF0
 00486DDD    call        @ClassCreate
 00486DE2    mov         ebx,edx
 00486DE4    mov         esi,eax
 00486DE6    xor         edx,edx
 00486DE8    mov         eax,esi
 00486DEA    call        TGLNodedLines.Create
 00486DEF    mov         dword ptr [esi+0C8],0A;TGLLines.Division:Integer
 00486DF9    mov         byte ptr [esi+0CC],0;TGLLines.SplineMode:TLineSplineMode
 00486E00    mov         dl,1
 00486E02    mov         eax,[00467CC0];TSingleList
 00486E07    call        TSingleList.Create;TSingleList.Create
 00486E0C    mov         dword ptr [esi+0D8],eax;TGLLines.?fD8:TSingleList
 00486E12    xor         eax,eax
 00486E14    mov         dword ptr [esi+0D0],eax;TGLLines.?fD0:dword
 00486E1A    mov         dword ptr [esi+0D4],42480000;TGLLines.?fD4:dword
 00486E24    mov         eax,esi
 00486E26    test        bl,bl
>00486E28    je          00486E39
 00486E2A    call        @AfterConstruction
 00486E2F    pop         dword ptr fs:[0]
 00486E36    add         esp,0C
 00486E39    mov         eax,esi
 00486E3B    pop         esi
 00486E3C    pop         ebx
 00486E3D    ret
*}
end;

//00486E40
destructor TGLLines.Destroy;
begin
{*
 00486E40    push        ebx
 00486E41    push        esi
 00486E42    call        @BeforeDestruction
 00486E47    mov         ebx,edx
 00486E49    mov         esi,eax
 00486E4B    mov         eax,dword ptr [esi+0D8];TGLLines.?fD8:TSingleList
 00486E51    call        TObject.Free
 00486E56    mov         edx,ebx
 00486E58    and         dl,0FC
 00486E5B    mov         eax,esi
 00486E5D    call        TGLNodedLines.Destroy
 00486E62    test        bl,bl
>00486E64    jle         00486E6D
 00486E66    mov         eax,esi
 00486E68    call        @ClassDestroy
 00486E6D    pop         esi
 00486E6E    pop         ebx
 00486E6F    ret
*}
end;

//00486E70
procedure TGLLines.SetDivision(Value:Integer);
begin
{*
 00486E70    push        esi
 00486E71    mov         esi,eax
 00486E73    cmp         edx,dword ptr [esi+0C8];TGLLines.Division:Integer
>00486E79    je          00486E9D
 00486E7B    cmp         edx,1
>00486E7E    jge         00486E8C
 00486E80    mov         dword ptr [esi+0C8],1;TGLLines.Division:Integer
>00486E8A    jmp         00486E92
 00486E8C    mov         dword ptr [esi+0C8],edx;TGLLines.Division:Integer
 00486E92    mov         eax,esi
 00486E94    mov         si,0FFE7
 00486E98    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486E9D    pop         esi
 00486E9E    ret
*}
end;

//00486EA0
procedure TGLLines.SetOptions(Value:TLinesOptions);
begin
{*
 00486EA0    push        esi
 00486EA1    push        ecx
 00486EA2    mov         byte ptr [esp],dl
 00486EA5    mov         dl,byte ptr [esp]
 00486EA8    mov         byte ptr [eax+0CD],dl;TGLLines.Options:TLinesOptions
 00486EAE    mov         si,0FFE7
 00486EB2    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486EB7    pop         edx
 00486EB8    pop         esi
 00486EB9    ret
*}
end;

//00486EBC
procedure TGLLines.SetSplineMode(Value:TLineSplineMode);
begin
{*
 00486EBC    push        esi
 00486EBD    mov         esi,eax
 00486EBF    cmp         dl,byte ptr [esi+0CC];TGLLines.SplineMode:TLineSplineMode
>00486EC5    je          00486ED8
 00486EC7    mov         byte ptr [esi+0CC],dl;TGLLines.SplineMode:TLineSplineMode
 00486ECD    mov         eax,esi
 00486ECF    mov         si,0FFE7
 00486ED3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00486ED8    pop         esi
 00486ED9    ret
*}
end;

//00486EDC
procedure TGLLines.Assign(Source:TPersistent);
begin
{*
 00486EDC    push        ebx
 00486EDD    push        esi
 00486EDE    mov         esi,edx
 00486EE0    mov         ebx,eax
 00486EE2    mov         eax,esi
 00486EE4    mov         edx,dword ptr ds:[484018];TGLLines
 00486EEA    call        @IsClass
 00486EEF    test        al,al
>00486EF1    je          00486F19
 00486EF3    mov         eax,esi
 00486EF5    mov         edx,dword ptr [eax+0C8]
 00486EFB    mov         dword ptr [ebx+0C8],edx;TGLLines.Division:Integer
 00486F01    mov         dl,byte ptr [eax+0CC]
 00486F07    mov         byte ptr [ebx+0CC],dl;TGLLines.SplineMode:TLineSplineMode
 00486F0D    mov         al,byte ptr [eax+0CD]
 00486F13    mov         byte ptr [ebx+0CD],al;TGLLines.Options:TLinesOptions
 00486F19    mov         edx,esi
 00486F1B    mov         eax,ebx
 00486F1D    call        TGLNodedLines.Assign
 00486F22    pop         esi
 00486F23    pop         ebx
 00486F24    ret
*}
end;

//00486F70
{*procedure sub_00486F70(?:?);
begin
 00486F70    push        ebp
 00486F71    mov         ebp,esp
 00486F73    add         esp,0FFFFFFB8
 00486F76    push        ebx
 00486F77    push        esi
 00486F78    push        edi
 00486F79    xor         ecx,ecx
 00486F7B    mov         dword ptr [ebp-20],ecx
 00486F7E    mov         dword ptr [ebp-24],ecx
 00486F81    mov         dword ptr [ebp-8],edx
 00486F84    mov         dword ptr [ebp-4],eax
 00486F87    xor         eax,eax
 00486F89    push        ebp
 00486F8A    push        48758C
 00486F8F    push        dword ptr fs:[eax]
 00486F92    mov         dword ptr fs:[eax],esp
 00486F95    mov         eax,dword ptr [ebp-4]
 00486F98    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 00486F9E    call        TCollection.GetCount
 00486FA3    dec         eax
>00486FA4    jle         00487562
 00486FAA    mov         eax,dword ptr [ebp-4]
 00486FAD    call        004866D8
 00486FB2    mov         eax,dword ptr [ebp-4]
 00486FB5    mov         al,byte ptr [eax+0CC];TGLLines.SplineMode:TLineSplineMode
 00486FBB    cmp         al,2
>00486FBD    je          00486FC7
 00486FBF    cmp         al,3
>00486FC1    jne         00487079
 00486FC7    mov         eax,dword ptr [ebp-4]
 00486FCA    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 00486FD0    call        TCollection.GetCount
 00486FD5    push        eax
 00486FD6    lea         eax,[ebp-20]
 00486FD9    mov         ecx,1
 00486FDE    mov         edx,dword ptr ds:[486F28];.61
 00486FE4    call        @DynArraySetLength
 00486FE9    add         esp,4
 00486FEC    mov         eax,dword ptr [ebp-4]
 00486FEF    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 00486FF5    call        TCollection.GetCount
 00486FFA    push        eax
 00486FFB    lea         eax,[ebp-24]
 00486FFE    mov         ecx,1
 00487003    mov         edx,dword ptr ds:[486F4C];.71
 00487009    call        @DynArraySetLength
 0048700E    add         esp,4
 00487011    mov         eax,dword ptr [ebp-4]
 00487014    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 0048701A    call        TCollection.GetCount
 0048701F    mov         esi,eax
 00487021    dec         esi
 00487022    test        esi,esi
>00487024    jl          00487079
 00487026    inc         esi
 00487027    xor         ebx,ebx
 00487029    mov         eax,dword ptr [ebp-4]
 0048702C    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 00487032    mov         edx,ebx
 00487034    call        0046BA84
 00487039    mov         edi,eax
 0048703B    lea         edx,[ebp-44]
 0048703E    mov         eax,edi
 00487040    call        0046B9E0
 00487045    lea         eax,[ebx+ebx*2]
 00487048    mov         edx,dword ptr [ebp-20]
 0048704B    mov         ecx,dword ptr [ebp-44]
 0048704E    mov         dword ptr [edx+eax*4],ecx
 00487051    mov         ecx,dword ptr [ebp-40]
 00487054    mov         dword ptr [edx+eax*4+4],ecx
 00487058    mov         ecx,dword ptr [ebp-3C]
 0048705B    mov         dword ptr [edx+eax*4+8],ecx
 0048705F    mov         eax,ebx
 00487061    add         eax,eax
 00487063    mov         edx,dword ptr [ebp-24]
 00487066    mov         ecx,dword ptr [edi+1C]
 00487069    push        esi
 0048706A    lea         edi,[edx+eax*8]
 0048706D    lea         esi,[ecx+18]
 00487070    movs        dword ptr [edi],dword ptr [esi]
 00487071    movs        dword ptr [edi],dword ptr [esi]
 00487072    movs        dword ptr [edi],dword ptr [esi]
 00487073    movs        dword ptr [edi],dword ptr [esi]
 00487074    pop         esi
 00487075    inc         ebx
 00487076    dec         esi
>00487077    jne         00487029
 00487079    mov         eax,dword ptr [ebp-4]
 0048707C    cmp         byte ptr [eax+0CC],2;TGLLines.SplineMode:TLineSplineMode
>00487083    jne         004870EF
 00487085    push        10000
 0048708A    call        OpenGL32.glPushAttrib
 0048708F    push        0D97
 00487094    call        OpenGL32.glEnable
 00487099    push        0D90
 0048709E    call        OpenGL32.glEnable
 004870A3    mov         eax,dword ptr [ebp-20]
 004870A6    push        eax
 004870A7    mov         eax,dword ptr [ebp-4]
 004870AA    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 004870B0    call        TCollection.GetCount
 004870B5    push        eax
 004870B6    push        3
 004870B8    push        3F800000
 004870BD    push        0
 004870BF    push        0D97
 004870C4    call        OpenGL32.glMap1f
 004870C9    mov         eax,dword ptr [ebp-24]
 004870CC    push        eax
 004870CD    mov         eax,dword ptr [ebp-4]
 004870D0    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 004870D6    call        TCollection.GetCount
 004870DB    push        eax
 004870DC    push        4
 004870DE    push        3F800000
 004870E3    push        0
 004870E5    push        0D90
 004870EA    call        OpenGL32.glMap1f
 004870EF    mov         eax,dword ptr [ebp-4]
 004870F2    mov         al,byte ptr [eax+0CC];TGLLines.SplineMode:TLineSplineMode
 004870F8    cmp         al,3
>004870FA    jne         004871D2
 00487100    mov         edx,dword ptr [ebp-4]
 00487103    cmp         dword ptr [edx+0C8],2;TGLLines.Division:Integer
>0048710A    jl          004871D2
 00487110    mov         eax,dword ptr [ebp-4]
 00487113    cmp         dword ptr [eax+0D0],0;TGLLines.?fD0:dword
>0048711A    jle         00487468
 00487120    mov         eax,dword ptr [ebp-4]
 00487123    mov         eax,dword ptr [eax+0D8];TGLLines.?fD8:TSingleList
 00487129    cmp         dword ptr [eax+8],0;TSingleList.?f8:dword
>0048712D    jle         00487468
 00487133    call        GLU32.gluNewNurbsRenderer
 00487138    mov         dword ptr [ebp-28],eax
 0048713B    xor         edx,edx
 0048713D    push        ebp
 0048713E    push        4871CB
 00487143    push        dword ptr fs:[edx]
 00487146    mov         dword ptr fs:[edx],esp
 00487149    mov         eax,dword ptr [ebp-4]
 0048714C    push        dword ptr [eax+0D4];TGLLines.?fD4:dword
 00487152    push        1876B
 00487157    mov         eax,dword ptr [ebp-28]
 0048715A    push        eax
 0048715B    call        GLU32.gluNurbsProperty
 00487160    push        47C35600
 00487165    push        1876C
 0048716A    mov         eax,dword ptr [ebp-28]
 0048716D    push        eax
 0048716E    call        GLU32.gluNurbsProperty
 00487173    mov         eax,dword ptr [ebp-28]
 00487176    push        eax
 00487177    call        GLU32.gluBeginCurve
 0048717C    push        0D97
 00487181    mov         edx,dword ptr [ebp-4]
 00487184    mov         edx,dword ptr [edx+0D0];TGLLines.?fD0:dword
 0048718A    push        edx
 0048718B    mov         edx,dword ptr [ebp-20]
 0048718E    push        edx
 0048718F    push        3
 00487191    mov         eax,dword ptr [ebp-4]
 00487194    mov         eax,dword ptr [eax+0D8];TGLLines.?fD8:TSingleList
 0048719A    mov         edx,dword ptr [eax+24];TSingleList.?f24:dword
 0048719D    push        edx
 0048719E    mov         eax,dword ptr [eax+8];TSingleList.?f8:dword
 004871A1    push        eax
 004871A2    mov         eax,dword ptr [ebp-28]
 004871A5    push        eax
 004871A6    call        GLU32.gluNurbsCurve
 004871AB    mov         eax,dword ptr [ebp-28]
 004871AE    push        eax
 004871AF    call        GLU32.gluEndCurve
 004871B4    xor         eax,eax
 004871B6    pop         edx
 004871B7    pop         ecx
 004871B8    pop         ecx
 004871B9    mov         dword ptr fs:[eax],edx
 004871BC    push        487468
 004871C1    mov         eax,dword ptr [ebp-28]
 004871C4    push        eax
 004871C5    call        GLU32.gluDeleteNurbsRenderer
 004871CA    ret
>004871CB    jmp         @HandleFinally
>004871D0    jmp         004871C1
 004871D2    cmp         al,4
>004871D4    jne         004871DF
 004871D6    push        1
 004871D8    call        OpenGL32.glBegin
>004871DD    jmp         004871E6
 004871DF    push        3
 004871E1    call        OpenGL32.glBegin
 004871E6    mov         eax,dword ptr [ebp-4]
 004871E9    mov         eax,dword ptr [eax+0C8];TGLLines.Division:Integer
 004871EF    cmp         eax,2
>004871F2    jl          0048720A
 004871F4    mov         edx,dword ptr [ebp-4]
 004871F7    mov         dl,byte ptr [edx+0CC];TGLLines.SplineMode:TLineSplineMode
 004871FD    test        dl,dl
>004871FF    je          0048720A
 00487201    sub         dl,4
>00487204    jne         004872AC
 0048720A    mov         eax,dword ptr [ebp-4]
 0048720D    test        byte ptr [eax+0CD],1;TGLLines.Options:TLinesOptions
>00487214    je          00487269
 00487216    mov         eax,dword ptr [ebp-4]
 00487219    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 0048721F    call        TCollection.GetCount
 00487224    mov         esi,eax
 00487226    dec         esi
 00487227    test        esi,esi
>00487229    jl          00487463
 0048722F    inc         esi
 00487230    xor         ebx,ebx
 00487232    mov         eax,dword ptr [ebp-4]
 00487235    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 0048723B    mov         edx,ebx
 0048723D    call        0046BA84
 00487242    mov         edi,eax
 00487244    mov         eax,dword ptr [edi+1C]
 00487247    call        00472C80
 0048724C    push        eax
 0048724D    call        OpenGL32.glColor4fv
 00487252    push        dword ptr [edi+14]
 00487255    push        dword ptr [edi+10]
 00487258    push        dword ptr [edi+0C]
 0048725B    call        OpenGL32.glVertex3f
 00487260    inc         ebx
 00487261    dec         esi
>00487262    jne         00487232
>00487264    jmp         00487463
 00487269    mov         eax,dword ptr [ebp-4]
 0048726C    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 00487272    call        TCollection.GetCount
 00487277    mov         esi,eax
 00487279    dec         esi
 0048727A    test        esi,esi
>0048727C    jl          00487463
 00487282    inc         esi
 00487283    xor         ebx,ebx
 00487285    mov         eax,dword ptr [ebp-4]
 00487288    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 0048728E    mov         edx,ebx
 00487290    call        0046BA84
 00487295    push        dword ptr [eax+14]
 00487298    push        dword ptr [eax+10]
 0048729B    push        dword ptr [eax+0C]
 0048729E    call        OpenGL32.glVertex3f
 004872A3    inc         ebx
 004872A4    dec         esi
>004872A5    jne         00487285
>004872A7    jmp         00487463
 004872AC    mov         edx,dword ptr [ebp-4]
 004872AF    mov         dl,byte ptr [edx+0CC];TGLLines.SplineMode:TLineSplineMode
 004872B5    cmp         dl,1
>004872B8    jne         0048742C
 004872BE    mov         eax,dword ptr [ebp-4]
 004872C1    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 004872C7    call        0046BB10
 004872CC    mov         dword ptr [ebp-1C],eax
 004872CF    xor         eax,eax
 004872D1    push        ebp
 004872D2    push        487425
 004872D7    push        dword ptr fs:[eax]
 004872DA    mov         dword ptr fs:[eax],esp
 004872DD    mov         eax,dword ptr [ebp-4]
 004872E0    fild        dword ptr [eax+0C8];TGLLines.Division:Integer
 004872E6    fdivr       dword ptr ds:[48759C];1:Single
 004872EC    fstp        dword ptr [ebp-18]
 004872EF    wait
 004872F0    mov         eax,dword ptr [ebp-4]
 004872F3    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 004872F9    call        TCollection.GetCount
 004872FE    mov         esi,eax
 00487300    dec         esi
 00487301    mov         eax,dword ptr [ebp-4]
 00487304    imul        esi,dword ptr [eax+0C8];TGLLines.Division:Integer
 0048730B    test        esi,esi
>0048730D    jl          0048740F
 00487313    inc         esi
 00487314    xor         ebx,ebx
 00487316    mov         dword ptr [ebp-48],ebx
 00487319    fild        dword ptr [ebp-48]
 0048731C    fmul        dword ptr [ebp-18]
 0048731F    add         esp,0FFFFFFFC
 00487322    fstp        dword ptr [esp]
 00487325    wait
 00487326    lea         eax,[ebp-14]
 00487329    push        eax
 0048732A    lea         ecx,[ebp-10]
 0048732D    lea         edx,[ebp-0C]
 00487330    mov         eax,dword ptr [ebp-1C]
 00487333    call        004658F4
 00487338    mov         eax,dword ptr [ebp-4]
 0048733B    test        byte ptr [eax+0CD],1;TGLLines.Options:TLinesOptions
>00487342    je          004873F9
 00487348    mov         eax,dword ptr [ebp-4]
 0048734B    push        dword ptr [eax+0C8]
 00487351    mov         eax,ebx
 00487353    pop         edx
 00487354    mov         ecx,edx
 00487356    cdq
 00487357    idiv        eax,ecx
 00487359    mov         edi,eax
 0048735B    mov         eax,dword ptr [ebp-4]
 0048735E    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 00487364    call        TCollection.GetCount
 00487369    dec         eax
 0048736A    cmp         edi,eax
>0048736C    jge         004873C8
 0048736E    mov         eax,dword ptr [ebp-4]
 00487371    push        dword ptr [eax+0C8]
 00487377    mov         eax,ebx
 00487379    pop         edx
 0048737A    mov         ecx,edx
 0048737C    cdq
 0048737D    idiv        eax,ecx
 0048737F    mov         dword ptr [ebp-48],edx
 00487382    fild        dword ptr [ebp-48]
 00487385    fmul        dword ptr [ebp-18]
 00487388    add         esp,0FFFFFFFC
 0048738B    fstp        dword ptr [esp]
 0048738E    wait
 0048738F    lea         edx,[edi+1]
 00487392    mov         eax,dword ptr [ebp-4]
 00487395    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 0048739B    call        0046BA84
 004873A0    mov         eax,dword ptr [eax+1C]
 004873A3    add         eax,18
 004873A6    push        eax
 004873A7    mov         eax,dword ptr [ebp-4]
 004873AA    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 004873B0    mov         edx,edi
 004873B2    call        0046BA84
 004873B7    mov         eax,dword ptr [eax+1C]
 004873BA    add         eax,18
 004873BD    lea         ecx,[ebp-38]
 004873C0    pop         edx
 004873C1    call        0045D030
>004873C6    jmp         004873F0
 004873C8    mov         eax,dword ptr [ebp-4]
 004873CB    mov         edi,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 004873D1    mov         eax,edi
 004873D3    call        TCollection.GetCount
 004873D8    mov         edx,eax
 004873DA    dec         edx
 004873DB    mov         eax,edi
 004873DD    call        0046BA84
 004873E2    mov         eax,dword ptr [eax+1C]
 004873E5    lea         edx,[eax+18]
 004873E8    lea         eax,[ebp-38]
 004873EB    call        0045C9C0
 004873F0    lea         eax,[ebp-38]
 004873F3    push        eax
 004873F4    call        OpenGL32.glColor4fv
 004873F9    push        dword ptr [ebp-14]
 004873FC    push        dword ptr [ebp-10]
 004873FF    push        dword ptr [ebp-0C]
 00487402    call        OpenGL32.glVertex3f
 00487407    inc         ebx
 00487408    dec         esi
>00487409    jne         00487316
 0048740F    xor         eax,eax
 00487411    pop         edx
 00487412    pop         ecx
 00487413    pop         ecx
 00487414    mov         dword ptr fs:[eax],edx
 00487417    push        487463
 0048741C    mov         eax,dword ptr [ebp-1C]
 0048741F    call        TObject.Free
 00487424    ret
>00487425    jmp         @HandleFinally
>0048742A    jmp         0048741C
 0048742C    cmp         dl,2
>0048742F    jne         00487463
 00487431    mov         dword ptr [ebp-48],eax
 00487434    fild        dword ptr [ebp-48]
 00487437    fdivr       dword ptr ds:[48759C];1:Single
 0048743D    fstp        dword ptr [ebp-18]
 00487440    wait
 00487441    mov         esi,eax
 00487443    test        esi,esi
>00487445    jl          00487463
 00487447    inc         esi
 00487448    xor         ebx,ebx
 0048744A    mov         dword ptr [ebp-48],ebx
 0048744D    fild        dword ptr [ebp-48]
 00487450    fmul        dword ptr [ebp-18]
 00487453    add         esp,0FFFFFFFC
 00487456    fstp        dword ptr [esp]
 00487459    wait
 0048745A    call        OpenGL32.glEvalCoord1f
 0048745F    inc         ebx
 00487460    dec         esi
>00487461    jne         0048744A
 00487463    call        OpenGL32.glEnd
 00487468    mov         eax,dword ptr [ebp-4]
 0048746B    cmp         byte ptr [eax+0CC],2;TGLLines.SplineMode:TLineSplineMode
>00487472    jne         00487479
 00487474    call        OpenGL32.glPopAttrib
 00487479    mov         eax,dword ptr [ebp-20]
 0048747C    call        @DynArrayLength
 00487481    test        eax,eax
>00487483    jle         004874B5
 00487485    push        0
 00487487    lea         eax,[ebp-20]
 0048748A    mov         ecx,1
 0048748F    mov         edx,dword ptr ds:[486F28];.61
 00487495    call        @DynArraySetLength
 0048749A    add         esp,4
 0048749D    push        0
 0048749F    lea         eax,[ebp-24]
 004874A2    mov         ecx,1
 004874A7    mov         edx,dword ptr ds:[486F4C];.71
 004874AD    call        @DynArraySetLength
 004874B2    add         esp,4
 004874B5    mov         eax,dword ptr [ebp-4]
 004874B8    call        004867D0
 004874BD    mov         eax,dword ptr [ebp-4]
 004874C0    cmp         byte ptr [eax+0AC],0;TGLLines.NodesAspect:TLineNodesAspect
>004874C7    je          00487562
 004874CD    push        2000
 004874D2    call        OpenGL32.glPushAttrib
 004874D7    mov         eax,dword ptr [ebp-8]
 004874DA    cmp         byte ptr [eax+0FB],0
>004874E1    jne         004874FC
 004874E3    push        0BE2
 004874E8    call        OpenGL32.glEnable
 004874ED    push        303
 004874F2    push        302
 004874F7    call        OpenGL32.glBlendFunc
 004874FC    push        0DE1
 00487501    call        OpenGL32.glDisable
 00487506    mov         eax,[005AE74C];^gvar_005E0CE7
 0048750B    cmp         byte ptr [eax],0
>0048750E    je          0048751A
 00487510    push        8513
 00487515    call        OpenGL32.glDisable
 0048751A    mov         eax,dword ptr [ebp-4]
 0048751D    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 00487523    call        TCollection.GetCount
 00487528    mov         esi,eax
 0048752A    dec         esi
 0048752B    test        esi,esi
>0048752D    jl          0048755D
 0048752F    inc         esi
 00487530    xor         ebx,ebx
 00487532    mov         eax,dword ptr [ebp-4]
 00487535    mov         eax,dword ptr [eax+0A8];TGLLines.Nodes:TGLLinesNodes
 0048753B    mov         edx,ebx
 0048753D    call        0046BA84
 00487542    push        dword ptr [eax+0C]
 00487545    push        dword ptr [eax+10]
 00487548    push        dword ptr [eax+14]
 0048754B    mov         ecx,dword ptr [eax+1C]
 0048754E    mov         edx,dword ptr [ebp-8]
 00487551    mov         eax,dword ptr [ebp-4]
 00487554    call        00486C04
 00487559    inc         ebx
 0048755A    dec         esi
>0048755B    jne         00487532
 0048755D    call        OpenGL32.glPopAttrib
 00487562    xor         eax,eax
 00487564    pop         edx
 00487565    pop         ecx
 00487566    pop         ecx
 00487567    mov         dword ptr fs:[eax],edx
 0048756A    push        487593
 0048756F    lea         eax,[ebp-24]
 00487572    mov         edx,dword ptr ds:[486F4C];.71
 00487578    call        @DynArrayClear
 0048757D    lea         eax,[ebp-20]
 00487580    mov         edx,dword ptr ds:[486F28];.61
 00487586    call        @DynArrayClear
 0048758B    ret
>0048758C    jmp         @HandleFinally
>00487591    jmp         0048756F
 00487593    pop         edi
 00487594    pop         esi
 00487595    pop         ebx
 00487596    mov         esp,ebp
 00487598    pop         ebp
 00487599    ret
end;*}

//004875A0
constructor TGLCube.Create(AOwner:TComponent);
begin
{*
 004875A0    push        ebx
 004875A1    push        esi
 004875A2    test        dl,dl
>004875A4    je          004875AE
 004875A6    add         esp,0FFFFFFF0
 004875A9    call        @ClassCreate
 004875AE    mov         ebx,edx
 004875B0    mov         esi,eax
 004875B2    xor         edx,edx
 004875B4    mov         eax,esi
 004875B6    call        TGLCustomSceneObject.Create
 004875BB    mov         eax,[005AE114];^gvar_005ACF0C
 004875C0    mov         edx,dword ptr [eax]
 004875C2    mov         dword ptr [esi+98],edx;TGLCube.CubeWidth:Single
 004875C8    mov         edx,dword ptr [eax+4]
 004875CB    mov         dword ptr [esi+9C],edx;TGLCube.CubeHeight:Single
 004875D1    mov         edx,dword ptr [eax+8]
 004875D4    mov         dword ptr [esi+0A0],edx;TGLCube.CubeDepth:Single
 004875DA    mov         al,[00487614];0x3F gvar_00487614
 004875DF    mov         byte ptr [esi+0A4],al;TGLCube.Parts:TCubeParts
 004875E5    mov         byte ptr [esi+0A5],1;TGLCube.NormalDirection:TNormalDirection
 004875EC    mov         al,byte ptr [esi+3C];TGLCube.?f3C:byte
 004875EF    or          al,byte ptr ds:[487618];0x1 gvar_00487618
 004875F5    mov         byte ptr [esi+3C],al;TGLCube.?f3C:byte
 004875F8    mov         eax,esi
 004875FA    test        bl,bl
>004875FC    je          0048760D
 004875FE    call        @AfterConstruction
 00487603    pop         dword ptr fs:[0]
 0048760A    add         esp,0C
 0048760D    mov         eax,esi
 0048760F    pop         esi
 00487610    pop         ebx
 00487611    ret
*}
end;

//0048761C
procedure sub_0048761C;
begin
{*
 0048761C    push        ebx
 0048761D    push        esi
 0048761E    add         esp,0FFFFFFF0
 00487621    mov         ebx,eax
 00487623    mov         esi,dword ptr ds:[5AE39C];^gvar_005E1348
 00487629    cmp         byte ptr [ebx+0A5],0;TGLCube.NormalDirection:TNormalDirection
>00487630    jne         0048763C
 00487632    mov         dword ptr [esp+0C],0BF800000
>0048763A    jmp         00487644
 0048763C    mov         dword ptr [esp+0C],3F800000
 00487644    fld         dword ptr [ebx+98];TGLCube.CubeWidth:Single
 0048764A    fmul        dword ptr ds:[487B0C];0.5:Single
 00487650    fstp        dword ptr [esp]
 00487653    wait
 00487654    fld         dword ptr [ebx+9C];TGLCube.CubeHeight:Single
 0048765A    fmul        dword ptr ds:[487B0C];0.5:Single
 00487660    fstp        dword ptr [esp+4]
 00487664    wait
 00487665    fld         dword ptr [ebx+0A0];TGLCube.CubeDepth:Single
 0048766B    fmul        dword ptr ds:[487B0C];0.5:Single
 00487671    fstp        dword ptr [esp+8]
 00487675    wait
 00487676    push        7
 00487678    call        OpenGL32.glBegin
 0048767D    test        byte ptr [ebx+0A4],4;TGLCube.Parts:TCubeParts
>00487684    je          00487727
 0048768A    push        dword ptr [esp+0C]
 0048768E    push        0
 00487690    push        0
 00487692    call        OpenGL32.glNormal3f
 00487697    mov         eax,[005AE7F8];^gvar_005ACED8
 0048769C    push        eax
 0048769D    mov         eax,dword ptr [esi]
 0048769F    call        eax
 004876A1    push        dword ptr [esp+8]
 004876A5    push        dword ptr [esp+8]
 004876A9    push        dword ptr [esp+8]
 004876AD    call        OpenGL32.glVertex3f
 004876B2    mov         eax,[005AE5C8];^gvar_005ACED0
 004876B7    push        eax
 004876B8    mov         eax,dword ptr [esi]
 004876BA    call        eax
 004876BC    push        dword ptr [esp+8]
 004876C0    push        dword ptr [esp+8]
 004876C4    fld         dword ptr [esp+8]
 004876C8    fchs
 004876CA    add         esp,0FFFFFFFC
 004876CD    fstp        dword ptr [esp]
 004876D0    wait
 004876D1    call        OpenGL32.glVertex3f
 004876D6    mov         eax,[005AE48C];^gvar_005ACEE0
 004876DB    push        eax
 004876DC    mov         eax,dword ptr [esi]
 004876DE    call        eax
 004876E0    push        dword ptr [esp+8]
 004876E4    fld         dword ptr [esp+8]
 004876E8    fchs
 004876EA    add         esp,0FFFFFFFC
 004876ED    fstp        dword ptr [esp]
 004876F0    wait
 004876F1    fld         dword ptr [esp+8]
 004876F5    fchs
 004876F7    add         esp,0FFFFFFFC
 004876FA    fstp        dword ptr [esp]
 004876FD    wait
 004876FE    call        OpenGL32.glVertex3f
 00487703    mov         eax,[005AE64C];^gvar_005ACEC8
 00487708    push        eax
 00487709    mov         eax,dword ptr [esi]
 0048770B    call        eax
 0048770D    push        dword ptr [esp+8]
 00487711    fld         dword ptr [esp+8]
 00487715    fchs
 00487717    add         esp,0FFFFFFFC
 0048771A    fstp        dword ptr [esp]
 0048771D    wait
 0048771E    push        dword ptr [esp+8]
 00487722    call        OpenGL32.glVertex3f
 00487727    test        byte ptr [ebx+0A4],8;TGLCube.Parts:TCubeParts
>0048772E    je          004877FE
 00487734    fld         dword ptr [esp+0C]
 00487738    fchs
 0048773A    add         esp,0FFFFFFFC
 0048773D    fstp        dword ptr [esp]
 00487740    wait
 00487741    push        0
 00487743    push        0
 00487745    call        OpenGL32.glNormal3f
 0048774A    mov         eax,[005AE5C8];^gvar_005ACED0
 0048774F    push        eax
 00487750    mov         eax,dword ptr [esi]
 00487752    call        eax
 00487754    fld         dword ptr [esp+8]
 00487758    fchs
 0048775A    add         esp,0FFFFFFFC
 0048775D    fstp        dword ptr [esp]
 00487760    wait
 00487761    push        dword ptr [esp+8]
 00487765    push        dword ptr [esp+8]
 00487769    call        OpenGL32.glVertex3f
 0048776E    mov         eax,[005AE48C];^gvar_005ACEE0
 00487773    push        eax
 00487774    mov         eax,dword ptr [esi]
 00487776    call        eax
 00487778    fld         dword ptr [esp+8]
 0048777C    fchs
 0048777E    add         esp,0FFFFFFFC
 00487781    fstp        dword ptr [esp]
 00487784    wait
 00487785    fld         dword ptr [esp+8]
 00487789    fchs
 0048778B    add         esp,0FFFFFFFC
 0048778E    fstp        dword ptr [esp]
 00487791    wait
 00487792    push        dword ptr [esp+8]
 00487796    call        OpenGL32.glVertex3f
 0048779B    mov         eax,[005AE64C];^gvar_005ACEC8
 004877A0    push        eax
 004877A1    mov         eax,dword ptr [esi]
 004877A3    call        eax
 004877A5    fld         dword ptr [esp+8]
 004877A9    fchs
 004877AB    add         esp,0FFFFFFFC
 004877AE    fstp        dword ptr [esp]
 004877B1    wait
 004877B2    fld         dword ptr [esp+8]
 004877B6    fchs
 004877B8    add         esp,0FFFFFFFC
 004877BB    fstp        dword ptr [esp]
 004877BE    wait
 004877BF    fld         dword ptr [esp+8]
 004877C3    fchs
 004877C5    add         esp,0FFFFFFFC
 004877C8    fstp        dword ptr [esp]
 004877CB    wait
 004877CC    call        OpenGL32.glVertex3f
 004877D1    mov         eax,[005AE7F8];^gvar_005ACED8
 004877D6    push        eax
 004877D7    mov         eax,dword ptr [esi]
 004877D9    call        eax
 004877DB    fld         dword ptr [esp+8]
 004877DF    fchs
 004877E1    add         esp,0FFFFFFFC
 004877E4    fstp        dword ptr [esp]
 004877E7    wait
 004877E8    push        dword ptr [esp+8]
 004877EC    fld         dword ptr [esp+8]
 004877F0    fchs
 004877F2    add         esp,0FFFFFFFC
 004877F5    fstp        dword ptr [esp]
 004877F8    wait
 004877F9    call        OpenGL32.glVertex3f
 004877FE    test        byte ptr [ebx+0A4],10;TGLCube.Parts:TCubeParts
>00487805    je          004878D5
 0048780B    push        0
 0048780D    push        0
 0048780F    fld         dword ptr [esp+14]
 00487813    fchs
 00487815    add         esp,0FFFFFFFC
 00487818    fstp        dword ptr [esp]
 0048781B    wait
 0048781C    call        OpenGL32.glNormal3f
 00487821    mov         eax,[005AE7F8];^gvar_005ACED8
 00487826    push        eax
 00487827    mov         eax,dword ptr [esi]
 00487829    call        eax
 0048782B    push        dword ptr [esp+8]
 0048782F    push        dword ptr [esp+8]
 00487833    fld         dword ptr [esp+8]
 00487837    fchs
 00487839    add         esp,0FFFFFFFC
 0048783C    fstp        dword ptr [esp]
 0048783F    wait
 00487840    call        OpenGL32.glVertex3f
 00487845    mov         eax,[005AE5C8];^gvar_005ACED0
 0048784A    push        eax
 0048784B    mov         eax,dword ptr [esi]
 0048784D    call        eax
 0048784F    fld         dword ptr [esp+8]
 00487853    fchs
 00487855    add         esp,0FFFFFFFC
 00487858    fstp        dword ptr [esp]
 0048785B    wait
 0048785C    push        dword ptr [esp+8]
 00487860    fld         dword ptr [esp+8]
 00487864    fchs
 00487866    add         esp,0FFFFFFFC
 00487869    fstp        dword ptr [esp]
 0048786C    wait
 0048786D    call        OpenGL32.glVertex3f
 00487872    mov         eax,[005AE48C];^gvar_005ACEE0
 00487877    push        eax
 00487878    mov         eax,dword ptr [esi]
 0048787A    call        eax
 0048787C    fld         dword ptr [esp+8]
 00487880    fchs
 00487882    add         esp,0FFFFFFFC
 00487885    fstp        dword ptr [esp]
 00487888    wait
 00487889    fld         dword ptr [esp+8]
 0048788D    fchs
 0048788F    add         esp,0FFFFFFFC
 00487892    fstp        dword ptr [esp]
 00487895    wait
 00487896    fld         dword ptr [esp+8]
 0048789A    fchs
 0048789C    add         esp,0FFFFFFFC
 0048789F    fstp        dword ptr [esp]
 004878A2    wait
 004878A3    call        OpenGL32.glVertex3f
 004878A8    mov         eax,[005AE64C];^gvar_005ACEC8
 004878AD    push        eax
 004878AE    mov         eax,dword ptr [esi]
 004878B0    call        eax
 004878B2    push        dword ptr [esp+8]
 004878B6    fld         dword ptr [esp+8]
 004878BA    fchs
 004878BC    add         esp,0FFFFFFFC
 004878BF    fstp        dword ptr [esp]
 004878C2    wait
 004878C3    fld         dword ptr [esp+8]
 004878C7    fchs
 004878C9    add         esp,0FFFFFFFC
 004878CC    fstp        dword ptr [esp]
 004878CF    wait
 004878D0    call        OpenGL32.glVertex3f
 004878D5    test        byte ptr [ebx+0A4],20;TGLCube.Parts:TCubeParts
>004878DC    je          0048797F
 004878E2    push        0
 004878E4    push        0
 004878E6    push        dword ptr [esp+14]
 004878EA    call        OpenGL32.glNormal3f
 004878EF    mov         eax,[005AE5C8];^gvar_005ACED0
 004878F4    push        eax
 004878F5    mov         eax,dword ptr [esi]
 004878F7    call        eax
 004878F9    push        dword ptr [esp+8]
 004878FD    push        dword ptr [esp+8]
 00487901    push        dword ptr [esp+8]
 00487905    call        OpenGL32.glVertex3f
 0048790A    mov         eax,[005AE48C];^gvar_005ACEE0
 0048790F    push        eax
 00487910    mov         eax,dword ptr [esi]
 00487912    call        eax
 00487914    push        dword ptr [esp+8]
 00487918    fld         dword ptr [esp+8]
 0048791C    fchs
 0048791E    add         esp,0FFFFFFFC
 00487921    fstp        dword ptr [esp]
 00487924    wait
 00487925    push        dword ptr [esp+8]
 00487929    call        OpenGL32.glVertex3f
 0048792E    mov         eax,[005AE64C];^gvar_005ACEC8
 00487933    push        eax
 00487934    mov         eax,dword ptr [esi]
 00487936    call        eax
 00487938    fld         dword ptr [esp+8]
 0048793C    fchs
 0048793E    add         esp,0FFFFFFFC
 00487941    fstp        dword ptr [esp]
 00487944    wait
 00487945    fld         dword ptr [esp+8]
 00487949    fchs
 0048794B    add         esp,0FFFFFFFC
 0048794E    fstp        dword ptr [esp]
 00487951    wait
 00487952    push        dword ptr [esp+8]
 00487956    call        OpenGL32.glVertex3f
 0048795B    mov         eax,[005AE7F8];^gvar_005ACED8
 00487960    push        eax
 00487961    mov         eax,dword ptr [esi]
 00487963    call        eax
 00487965    fld         dword ptr [esp+8]
 00487969    fchs
 0048796B    add         esp,0FFFFFFFC
 0048796E    fstp        dword ptr [esp]
 00487971    wait
 00487972    push        dword ptr [esp+8]
 00487976    push        dword ptr [esp+8]
 0048797A    call        OpenGL32.glVertex3f
 0048797F    test        byte ptr [ebx+0A4],1;TGLCube.Parts:TCubeParts
>00487986    je          00487A29
 0048798C    push        0
 0048798E    push        dword ptr [esp+10]
 00487992    push        0
 00487994    call        OpenGL32.glNormal3f
 00487999    mov         eax,[005AE5C8];^gvar_005ACED0
 0048799E    push        eax
 0048799F    mov         eax,dword ptr [esi]
 004879A1    call        eax
 004879A3    fld         dword ptr [esp+8]
 004879A7    fchs
 004879A9    add         esp,0FFFFFFFC
 004879AC    fstp        dword ptr [esp]
 004879AF    wait
 004879B0    push        dword ptr [esp+8]
 004879B4    fld         dword ptr [esp+8]
 004879B8    fchs
 004879BA    add         esp,0FFFFFFFC
 004879BD    fstp        dword ptr [esp]
 004879C0    wait
 004879C1    call        OpenGL32.glVertex3f
 004879C6    mov         eax,[005AE48C];^gvar_005ACEE0
 004879CB    push        eax
 004879CC    mov         eax,dword ptr [esi]
 004879CE    call        eax
 004879D0    push        dword ptr [esp+8]
 004879D4    push        dword ptr [esp+8]
 004879D8    fld         dword ptr [esp+8]
 004879DC    fchs
 004879DE    add         esp,0FFFFFFFC
 004879E1    fstp        dword ptr [esp]
 004879E4    wait
 004879E5    call        OpenGL32.glVertex3f
 004879EA    mov         eax,[005AE64C];^gvar_005ACEC8
 004879EF    push        eax
 004879F0    mov         eax,dword ptr [esi]
 004879F2    call        eax
 004879F4    push        dword ptr [esp+8]
 004879F8    push        dword ptr [esp+8]
 004879FC    push        dword ptr [esp+8]
 00487A00    call        OpenGL32.glVertex3f
 00487A05    mov         eax,[005AE7F8];^gvar_005ACED8
 00487A0A    push        eax
 00487A0B    mov         eax,dword ptr [esi]
 00487A0D    call        eax
 00487A0F    fld         dword ptr [esp+8]
 00487A13    fchs
 00487A15    add         esp,0FFFFFFFC
 00487A18    fstp        dword ptr [esp]
 00487A1B    wait
 00487A1C    push        dword ptr [esp+8]
 00487A20    push        dword ptr [esp+8]
 00487A24    call        OpenGL32.glVertex3f
 00487A29    test        byte ptr [ebx+0A4],2;TGLCube.Parts:TCubeParts
>00487A30    je          00487B00
 00487A36    push        0
 00487A38    fld         dword ptr [esp+10]
 00487A3C    fchs
 00487A3E    add         esp,0FFFFFFFC
 00487A41    fstp        dword ptr [esp]
 00487A44    wait
 00487A45    push        0
 00487A47    call        OpenGL32.glNormal3f
 00487A4C    mov         eax,[005AE48C];^gvar_005ACEE0
 00487A51    push        eax
 00487A52    mov         eax,dword ptr [esi]
 00487A54    call        eax
 00487A56    fld         dword ptr [esp+8]
 00487A5A    fchs
 00487A5C    add         esp,0FFFFFFFC
 00487A5F    fstp        dword ptr [esp]
 00487A62    wait
 00487A63    fld         dword ptr [esp+8]
 00487A67    fchs
 00487A69    add         esp,0FFFFFFFC
 00487A6C    fstp        dword ptr [esp]
 00487A6F    wait
 00487A70    fld         dword ptr [esp+8]
 00487A74    fchs
 00487A76    add         esp,0FFFFFFFC
 00487A79    fstp        dword ptr [esp]
 00487A7C    wait
 00487A7D    call        OpenGL32.glVertex3f
 00487A82    mov         eax,[005AE64C];^gvar_005ACEC8
 00487A87    push        eax
 00487A88    mov         eax,dword ptr [esi]
 00487A8A    call        eax
 00487A8C    fld         dword ptr [esp+8]
 00487A90    fchs
 00487A92    add         esp,0FFFFFFFC
 00487A95    fstp        dword ptr [esp]
 00487A98    wait
 00487A99    fld         dword ptr [esp+8]
 00487A9D    fchs
 00487A9F    add         esp,0FFFFFFFC
 00487AA2    fstp        dword ptr [esp]
 00487AA5    wait
 00487AA6    push        dword ptr [esp+8]
 00487AAA    call        OpenGL32.glVertex3f
 00487AAF    mov         eax,[005AE7F8];^gvar_005ACED8
 00487AB4    push        eax
 00487AB5    mov         eax,dword ptr [esi]
 00487AB7    call        eax
 00487AB9    push        dword ptr [esp+8]
 00487ABD    fld         dword ptr [esp+8]
 00487AC1    fchs
 00487AC3    add         esp,0FFFFFFFC
 00487AC6    fstp        dword ptr [esp]
 00487AC9    wait
 00487ACA    push        dword ptr [esp+8]
 00487ACE    call        OpenGL32.glVertex3f
 00487AD3    mov         eax,[005AE5C8];^gvar_005ACED0
 00487AD8    push        eax
 00487AD9    mov         eax,dword ptr [esi]
 00487ADB    call        eax
 00487ADD    push        dword ptr [esp+8]
 00487AE1    fld         dword ptr [esp+8]
 00487AE5    fchs
 00487AE7    add         esp,0FFFFFFFC
 00487AEA    fstp        dword ptr [esp]
 00487AED    wait
 00487AEE    fld         dword ptr [esp+8]
 00487AF2    fchs
 00487AF4    add         esp,0FFFFFFFC
 00487AF7    fstp        dword ptr [esp]
 00487AFA    wait
 00487AFB    call        OpenGL32.glVertex3f
 00487B00    call        OpenGL32.glEnd
 00487B05    add         esp,10
 00487B08    pop         esi
 00487B09    pop         ebx
 00487B0A    ret
*}
end;

//00487B10
{*procedure sub_00487B10(?:?);
begin
 00487B10    push        ebx
 00487B11    push        esi
 00487B12    push        edi
 00487B13    add         esp,0FFFFFFC0
 00487B16    mov         edi,edx
 00487B18    mov         esi,eax
 00487B1A    mov         cl,1
 00487B1C    mov         dl,1
 00487B1E    mov         eax,[0046EA94];TConnectivity
 00487B23    call        TConnectivity.Create;TConnectivity.Create
 00487B28    mov         ebx,eax
 00487B2A    fld         dword ptr [esi+98];TGLCube.CubeWidth:Single
 00487B30    fmul        dword ptr ds:[487FAC];0.5:Single
 00487B36    fstp        dword ptr [esp]
 00487B39    wait
 00487B3A    fld         dword ptr [esi+9C];TGLCube.CubeHeight:Single
 00487B40    fmul        dword ptr ds:[487FAC];0.5:Single
 00487B46    fstp        dword ptr [esp+4]
 00487B4A    wait
 00487B4B    fld         dword ptr [esi+0A0];TGLCube.CubeDepth:Single
 00487B51    fmul        dword ptr ds:[487FAC];0.5:Single
 00487B57    fstp        dword ptr [esp+8]
 00487B5B    wait
 00487B5C    test        byte ptr [esi+0A4],4;TGLCube.Parts:TCubeParts
>00487B63    je          00487BFB
 00487B69    fld         dword ptr [esp]
 00487B6C    fchs
 00487B6E    add         esp,0FFFFFFFC
 00487B71    fstp        dword ptr [esp]
 00487B74    wait
 00487B75    fld         dword ptr [esp+8]
 00487B79    fchs
 00487B7B    add         esp,0FFFFFFFC
 00487B7E    fstp        dword ptr [esp]
 00487B81    wait
 00487B82    push        dword ptr [esp+10]
 00487B86    lea         eax,[esp+1C]
 00487B8A    call        0045C8C4
 00487B8F    lea         eax,[esp+10]
 00487B93    push        eax
 00487B94    push        dword ptr [esp+4]
 00487B98    fld         dword ptr [esp+0C]
 00487B9C    fchs
 00487B9E    add         esp,0FFFFFFFC
 00487BA1    fstp        dword ptr [esp]
 00487BA4    wait
 00487BA5    push        dword ptr [esp+14]
 00487BA9    lea         eax,[esp+2C]
 00487BAD    call        0045C8C4
 00487BB2    lea         eax,[esp+20]
 00487BB6    push        eax
 00487BB7    fld         dword ptr [esp+8]
 00487BBB    fchs
 00487BBD    add         esp,0FFFFFFFC
 00487BC0    fstp        dword ptr [esp]
 00487BC3    wait
 00487BC4    push        dword ptr [esp+10]
 00487BC8    push        dword ptr [esp+18]
 00487BCC    lea         eax,[esp+3C]
 00487BD0    call        0045C8C4
 00487BD5    lea         eax,[esp+30]
 00487BD9    push        eax
 00487BDA    push        dword ptr [esp+0C]
 00487BDE    push        dword ptr [esp+14]
 00487BE2    push        dword ptr [esp+1C]
 00487BE6    lea         eax,[esp+4C]
 00487BEA    call        0045C8C4
 00487BEF    lea         edx,[esp+40]
 00487BF3    mov         eax,ebx
 00487BF5    pop         ecx
 00487BF6    call        0046F190
 00487BFB    test        byte ptr [esi+0A4],8;TGLCube.Parts:TCubeParts
>00487C02    je          00487CBE
 00487C08    fld         dword ptr [esp]
 00487C0B    fchs
 00487C0D    add         esp,0FFFFFFFC
 00487C10    fstp        dword ptr [esp]
 00487C13    wait
 00487C14    fld         dword ptr [esp+8]
 00487C18    fchs
 00487C1A    add         esp,0FFFFFFFC
 00487C1D    fstp        dword ptr [esp]
 00487C20    wait
 00487C21    fld         dword ptr [esp+10]
 00487C25    fchs
 00487C27    add         esp,0FFFFFFFC
 00487C2A    fstp        dword ptr [esp]
 00487C2D    wait
 00487C2E    lea         eax,[esp+1C]
 00487C32    call        0045C8C4
 00487C37    lea         eax,[esp+10]
 00487C3B    push        eax
 00487C3C    fld         dword ptr [esp+4]
 00487C40    fchs
 00487C42    add         esp,0FFFFFFFC
 00487C45    fstp        dword ptr [esp]
 00487C48    wait
 00487C49    push        dword ptr [esp+0C]
 00487C4D    fld         dword ptr [esp+14]
 00487C51    fchs
 00487C53    add         esp,0FFFFFFFC
 00487C56    fstp        dword ptr [esp]
 00487C59    wait
 00487C5A    lea         eax,[esp+2C]
 00487C5E    call        0045C8C4
 00487C63    lea         eax,[esp+20]
 00487C67    push        eax
 00487C68    push        dword ptr [esp+8]
 00487C6C    fld         dword ptr [esp+10]
 00487C70    fchs
 00487C72    add         esp,0FFFFFFFC
 00487C75    fstp        dword ptr [esp]
 00487C78    wait
 00487C79    fld         dword ptr [esp+18]
 00487C7D    fchs
 00487C7F    add         esp,0FFFFFFFC
 00487C82    fstp        dword ptr [esp]
 00487C85    wait
 00487C86    lea         eax,[esp+3C]
 00487C8A    call        0045C8C4
 00487C8F    lea         eax,[esp+30]
 00487C93    push        eax
 00487C94    push        dword ptr [esp+0C]
 00487C98    push        dword ptr [esp+14]
 00487C9C    fld         dword ptr [esp+1C]
 00487CA0    fchs
 00487CA2    add         esp,0FFFFFFFC
 00487CA5    fstp        dword ptr [esp]
 00487CA8    wait
 00487CA9    lea         eax,[esp+4C]
 00487CAD    call        0045C8C4
 00487CB2    lea         edx,[esp+40]
 00487CB6    mov         eax,ebx
 00487CB8    pop         ecx
 00487CB9    call        0046F190
 00487CBE    test        byte ptr [esi+0A4],10;TGLCube.Parts:TCubeParts
>00487CC5    je          00487D81
 00487CCB    fld         dword ptr [esp]
 00487CCE    fchs
 00487CD0    add         esp,0FFFFFFFC
 00487CD3    fstp        dword ptr [esp]
 00487CD6    wait
 00487CD7    fld         dword ptr [esp+8]
 00487CDB    fchs
 00487CDD    add         esp,0FFFFFFFC
 00487CE0    fstp        dword ptr [esp]
 00487CE3    wait
 00487CE4    fld         dword ptr [esp+10]
 00487CE8    fchs
 00487CEA    add         esp,0FFFFFFFC
 00487CED    fstp        dword ptr [esp]
 00487CF0    wait
 00487CF1    lea         eax,[esp+1C]
 00487CF5    call        0045C8C4
 00487CFA    lea         eax,[esp+10]
 00487CFE    push        eax
 00487CFF    fld         dword ptr [esp+4]
 00487D03    fchs
 00487D05    add         esp,0FFFFFFFC
 00487D08    fstp        dword ptr [esp]
 00487D0B    wait
 00487D0C    fld         dword ptr [esp+0C]
 00487D10    fchs
 00487D12    add         esp,0FFFFFFFC
 00487D15    fstp        dword ptr [esp]
 00487D18    wait
 00487D19    push        dword ptr [esp+14]
 00487D1D    lea         eax,[esp+2C]
 00487D21    call        0045C8C4
 00487D26    lea         eax,[esp+20]
 00487D2A    push        eax
 00487D2B    fld         dword ptr [esp+8]
 00487D2F    fchs
 00487D31    add         esp,0FFFFFFFC
 00487D34    fstp        dword ptr [esp]
 00487D37    wait
 00487D38    push        dword ptr [esp+10]
 00487D3C    fld         dword ptr [esp+18]
 00487D40    fchs
 00487D42    add         esp,0FFFFFFFC
 00487D45    fstp        dword ptr [esp]
 00487D48    wait
 00487D49    lea         eax,[esp+3C]
 00487D4D    call        0045C8C4
 00487D52    lea         eax,[esp+30]
 00487D56    push        eax
 00487D57    fld         dword ptr [esp+0C]
 00487D5B    fchs
 00487D5D    add         esp,0FFFFFFFC
 00487D60    fstp        dword ptr [esp]
 00487D63    wait
 00487D64    push        dword ptr [esp+14]
 00487D68    push        dword ptr [esp+1C]
 00487D6C    lea         eax,[esp+4C]
 00487D70    call        0045C8C4
 00487D75    lea         edx,[esp+40]
 00487D79    mov         eax,ebx
 00487D7B    pop         ecx
 00487D7C    call        0046F190
 00487D81    test        byte ptr [esi+0A4],20;TGLCube.Parts:TCubeParts
>00487D88    je          00487E20
 00487D8E    push        dword ptr [esp]
 00487D91    fld         dword ptr [esp+8]
 00487D95    fchs
 00487D97    add         esp,0FFFFFFFC
 00487D9A    fstp        dword ptr [esp]
 00487D9D    wait
 00487D9E    fld         dword ptr [esp+10]
 00487DA2    fchs
 00487DA4    add         esp,0FFFFFFFC
 00487DA7    fstp        dword ptr [esp]
 00487DAA    wait
 00487DAB    lea         eax,[esp+1C]
 00487DAF    call        0045C8C4
 00487DB4    lea         eax,[esp+10]
 00487DB8    push        eax
 00487DB9    push        dword ptr [esp+4]
 00487DBD    push        dword ptr [esp+0C]
 00487DC1    fld         dword ptr [esp+14]
 00487DC5    fchs
 00487DC7    add         esp,0FFFFFFFC
 00487DCA    fstp        dword ptr [esp]
 00487DCD    wait
 00487DCE    lea         eax,[esp+2C]
 00487DD2    call        0045C8C4
 00487DD7    lea         eax,[esp+20]
 00487DDB    push        eax
 00487DDC    push        dword ptr [esp+8]
 00487DE0    fld         dword ptr [esp+10]
 00487DE4    fchs
 00487DE6    add         esp,0FFFFFFFC
 00487DE9    fstp        dword ptr [esp]
 00487DEC    wait
 00487DED    push        dword ptr [esp+18]
 00487DF1    lea         eax,[esp+3C]
 00487DF5    call        0045C8C4
 00487DFA    lea         eax,[esp+30]
 00487DFE    push        eax
 00487DFF    push        dword ptr [esp+0C]
 00487E03    push        dword ptr [esp+14]
 00487E07    push        dword ptr [esp+1C]
 00487E0B    lea         eax,[esp+4C]
 00487E0F    call        0045C8C4
 00487E14    lea         edx,[esp+40]
 00487E18    mov         eax,ebx
 00487E1A    pop         ecx
 00487E1B    call        0046F190
 00487E20    test        byte ptr [esi+0A4],1;TGLCube.Parts:TCubeParts
>00487E27    je          00487EBF
 00487E2D    push        dword ptr [esp]
 00487E30    push        dword ptr [esp+8]
 00487E34    push        dword ptr [esp+10]
 00487E38    lea         eax,[esp+1C]
 00487E3C    call        0045C8C4
 00487E41    lea         eax,[esp+10]
 00487E45    push        eax
 00487E46    push        dword ptr [esp+4]
 00487E4A    push        dword ptr [esp+0C]
 00487E4E    fld         dword ptr [esp+14]
 00487E52    fchs
 00487E54    add         esp,0FFFFFFFC
 00487E57    fstp        dword ptr [esp]
 00487E5A    wait
 00487E5B    lea         eax,[esp+2C]
 00487E5F    call        0045C8C4
 00487E64    lea         eax,[esp+20]
 00487E68    push        eax
 00487E69    fld         dword ptr [esp+8]
 00487E6D    fchs
 00487E6F    add         esp,0FFFFFFFC
 00487E72    fstp        dword ptr [esp]
 00487E75    wait
 00487E76    push        dword ptr [esp+10]
 00487E7A    push        dword ptr [esp+18]
 00487E7E    lea         eax,[esp+3C]
 00487E82    call        0045C8C4
 00487E87    lea         eax,[esp+30]
 00487E8B    push        eax
 00487E8C    fld         dword ptr [esp+0C]
 00487E90    fchs
 00487E92    add         esp,0FFFFFFFC
 00487E95    fstp        dword ptr [esp]
 00487E98    wait
 00487E99    push        dword ptr [esp+14]
 00487E9D    fld         dword ptr [esp+1C]
 00487EA1    fchs
 00487EA3    add         esp,0FFFFFFFC
 00487EA6    fstp        dword ptr [esp]
 00487EA9    wait
 00487EAA    lea         eax,[esp+4C]
 00487EAE    call        0045C8C4
 00487EB3    lea         edx,[esp+40]
 00487EB7    mov         eax,ebx
 00487EB9    pop         ecx
 00487EBA    call        0046F190
 00487EBF    test        byte ptr [esi+0A4],2;TGLCube.Parts:TCubeParts
>00487EC6    je          00487F82
 00487ECC    push        dword ptr [esp]
 00487ECF    fld         dword ptr [esp+8]
 00487ED3    fchs
 00487ED5    add         esp,0FFFFFFFC
 00487ED8    fstp        dword ptr [esp]
 00487EDB    wait
 00487EDC    push        dword ptr [esp+10]
 00487EE0    lea         eax,[esp+1C]
 00487EE4    call        0045C8C4
 00487EE9    lea         eax,[esp+10]
 00487EED    push        eax
 00487EEE    fld         dword ptr [esp+4]
 00487EF2    fchs
 00487EF4    add         esp,0FFFFFFFC
 00487EF7    fstp        dword ptr [esp]
 00487EFA    wait
 00487EFB    fld         dword ptr [esp+0C]
 00487EFF    fchs
 00487F01    add         esp,0FFFFFFFC
 00487F04    fstp        dword ptr [esp]
 00487F07    wait
 00487F08    push        dword ptr [esp+14]
 00487F0C    lea         eax,[esp+2C]
 00487F10    call        0045C8C4
 00487F15    lea         eax,[esp+20]
 00487F19    push        eax
 00487F1A    push        dword ptr [esp+8]
 00487F1E    fld         dword ptr [esp+10]
 00487F22    fchs
 00487F24    add         esp,0FFFFFFFC
 00487F27    fstp        dword ptr [esp]
 00487F2A    wait
 00487F2B    fld         dword ptr [esp+18]
 00487F2F    fchs
 00487F31    add         esp,0FFFFFFFC
 00487F34    fstp        dword ptr [esp]
 00487F37    wait
 00487F38    lea         eax,[esp+3C]
 00487F3C    call        0045C8C4
 00487F41    lea         eax,[esp+30]
 00487F45    push        eax
 00487F46    fld         dword ptr [esp+0C]
 00487F4A    fchs
 00487F4C    add         esp,0FFFFFFFC
 00487F4F    fstp        dword ptr [esp]
 00487F52    wait
 00487F53    fld         dword ptr [esp+14]
 00487F57    fchs
 00487F59    add         esp,0FFFFFFFC
 00487F5C    fstp        dword ptr [esp]
 00487F5F    wait
 00487F60    fld         dword ptr [esp+1C]
 00487F64    fchs
 00487F66    add         esp,0FFFFFFFC
 00487F69    fstp        dword ptr [esp]
 00487F6C    wait
 00487F6D    lea         eax,[esp+4C]
 00487F71    call        0045C8C4
 00487F76    lea         edx,[esp+40]
 00487F7A    mov         eax,ebx
 00487F7C    pop         ecx
 00487F7D    call        0046F190
 00487F82    xor         eax,eax
 00487F84    mov         dword ptr [esp+0C],eax
 00487F88    push        0
 00487F8A    lea         ecx,[esp+10]
 00487F8E    mov         edx,edi
 00487F90    mov         eax,ebx
 00487F92    mov         esi,dword ptr [eax]
 00487F94    call        dword ptr [esi+8];TConnectivity.sub_0046ED4C
 00487F97    mov         esi,dword ptr [esp+0C]
 00487F9B    mov         eax,ebx
 00487F9D    call        TObject.Free
 00487FA2    mov         eax,esi
 00487FA4    add         esp,40
 00487FA7    pop         edi
 00487FA8    pop         esi
 00487FA9    pop         ebx
 00487FAA    ret
end;*}

//00487FB0
{*procedure TGLCube.SetCubeWidth(Value:Single; ?:?);
begin
 00487FB0    push        ebp
 00487FB1    mov         ebp,esp
 00487FB3    push        esi
 00487FB4    mov         edx,eax
 00487FB6    fld         dword ptr [ebp+8]
 00487FB9    fcomp       dword ptr [edx+98];TGLCube.CubeWidth:Single
 00487FBF    fnstsw      al
 00487FC1    sahf
>00487FC2    je          00487FD8
 00487FC4    mov         eax,dword ptr [ebp+8]
 00487FC7    mov         dword ptr [edx+98],eax;TGLCube.CubeWidth:Single
 00487FCD    mov         eax,edx
 00487FCF    mov         si,0FFE7
 00487FD3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00487FD8    pop         esi
 00487FD9    pop         ebp
 00487FDA    ret         4
end;*}

//00487FE0
{*procedure TGLCube.SetCubeHeight(Value:Single; ?:?);
begin
 00487FE0    push        ebp
 00487FE1    mov         ebp,esp
 00487FE3    push        esi
 00487FE4    mov         edx,eax
 00487FE6    fld         dword ptr [ebp+8]
 00487FE9    fcomp       dword ptr [edx+9C];TGLCube.CubeHeight:Single
 00487FEF    fnstsw      al
 00487FF1    sahf
>00487FF2    je          00488008
 00487FF4    mov         eax,dword ptr [ebp+8]
 00487FF7    mov         dword ptr [edx+9C],eax;TGLCube.CubeHeight:Single
 00487FFD    mov         eax,edx
 00487FFF    mov         si,0FFE7
 00488003    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00488008    pop         esi
 00488009    pop         ebp
 0048800A    ret         4
end;*}

//00488010
{*procedure TGLCube.SetCubeDepth(Value:Single; ?:?);
begin
 00488010    push        ebp
 00488011    mov         ebp,esp
 00488013    push        esi
 00488014    mov         edx,eax
 00488016    fld         dword ptr [ebp+8]
 00488019    fcomp       dword ptr [edx+0A0];TGLCube.CubeDepth:Single
 0048801F    fnstsw      al
 00488021    sahf
>00488022    je          00488038
 00488024    mov         eax,dword ptr [ebp+8]
 00488027    mov         dword ptr [edx+0A0],eax;TGLCube.CubeDepth:Single
 0048802D    mov         eax,edx
 0048802F    mov         si,0FFE7
 00488033    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00488038    pop         esi
 00488039    pop         ebp
 0048803A    ret         4
end;*}

//00488040
procedure TGLCube.SetParts(Value:TCubeParts);
begin
{*
 00488040    push        ebx
 00488041    push        esi
 00488042    push        ecx
 00488043    mov         byte ptr [esp],dl
 00488046    mov         ebx,eax
 00488048    mov         al,byte ptr [ebx+0A4];TGLCube.Parts:TCubeParts
 0048804E    cmp         al,byte ptr [esp]
>00488051    je          00488067
 00488053    mov         al,byte ptr [esp]
 00488056    mov         byte ptr [ebx+0A4],al;TGLCube.Parts:TCubeParts
 0048805C    mov         eax,ebx
 0048805E    mov         si,0FFE7
 00488062    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00488067    pop         edx
 00488068    pop         esi
 00488069    pop         ebx
 0048806A    ret
*}
end;

//0048806C
procedure TGLCube.SetNormalDirection(Value:TNormalDirection);
begin
{*
 0048806C    push        esi
 0048806D    mov         esi,eax
 0048806F    cmp         dl,byte ptr [esi+0A5];TGLCube.NormalDirection:TNormalDirection
>00488075    je          00488088
 00488077    mov         byte ptr [esi+0A5],dl;TGLCube.NormalDirection:TNormalDirection
 0048807D    mov         eax,esi
 0048807F    mov         si,0FFE7
 00488083    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 00488088    pop         esi
 00488089    ret
*}
end;

//0048808C
procedure TGLCube.Assign(Source:TPersistent);
begin
{*
 0048808C    push        ebx
 0048808D    push        esi
 0048808E    mov         ebx,edx
 00488090    mov         esi,eax
 00488092    test        ebx,ebx
>00488094    je          004880E5
 00488096    mov         eax,ebx
 00488098    mov         edx,dword ptr ds:[4841DC];TGLCube
 0048809E    call        @IsClass
 004880A3    test        al,al
>004880A5    je          004880E5
 004880A7    mov         eax,ebx
 004880A9    mov         edx,dword ptr [eax+98]
 004880AF    mov         dword ptr [esi+98],edx;TGLCube.CubeWidth:Single
 004880B5    mov         edx,dword ptr [eax+9C]
 004880BB    mov         dword ptr [esi+9C],edx;TGLCube.CubeHeight:Single
 004880C1    mov         edx,dword ptr [eax+0A0]
 004880C7    mov         dword ptr [esi+0A0],edx;TGLCube.CubeDepth:Single
 004880CD    mov         dl,byte ptr [eax+0A4]
 004880D3    mov         byte ptr [esi+0A4],dl;TGLCube.Parts:TCubeParts
 004880D9    mov         al,byte ptr [eax+0A5]
 004880DF    mov         byte ptr [esi+0A5],al;TGLCube.NormalDirection:TNormalDirection
 004880E5    mov         edx,ebx
 004880E7    mov         eax,esi
 004880E9    call        TGLCustomSceneObject.Assign
 004880EE    pop         esi
 004880EF    pop         ebx
 004880F0    ret
*}
end;

//004880F4
{*procedure sub_004880F4(?:?);
begin
 004880F4    fld         dword ptr [eax+98];TGLCube.CubeWidth:Single
 004880FA    fmul        dword ptr ds:[48812C];0.5:Single
 00488100    fstp        dword ptr [edx]
 00488102    wait
 00488103    fld         dword ptr [eax+9C];TGLCube.CubeHeight:Single
 00488109    fmul        dword ptr ds:[48812C];0.5:Single
 0048810F    fstp        dword ptr [edx+4]
 00488112    wait
 00488113    fld         dword ptr [eax+0A0];TGLCube.CubeDepth:Single
 00488119    fmul        dword ptr ds:[48812C];0.5:Single
 0048811F    fstp        dword ptr [edx+8]
 00488122    wait
 00488123    xor         eax,eax
 00488125    mov         dword ptr [edx+0C],eax
 00488128    ret
end;*}

//00488130
{*function sub_00488130(?:?; ?:?; ?:?; ?:?):?;
begin
 00488130    push        ebp
 00488131    mov         ebp,esp
 00488133    add         esp,0FFFFFF3C
 00488139    push        ebx
 0048813A    push        esi
 0048813B    push        edi
 0048813C    mov         esi,ecx
 0048813E    mov         ebx,edx
 00488140    mov         edi,eax
 00488142    lea         ecx,[ebp-88]
 00488148    mov         edx,ebx
 0048814A    mov         eax,edi
 0048814C    call        0047BD80
 00488151    lea         ecx,[ebp-0C4]
 00488157    mov         edx,esi
 00488159    mov         eax,edi
 0048815B    call        0047BD80
 00488160    lea         eax,[ebp-0C4]
 00488166    lea         edx,[ebp-0B4]
 0048816C    call        0045D674
 00488171    lea         edx,[ebp-0B4]
 00488177    lea         eax,[ebp-78]
 0048817A    call        0045C9C0
 0048817F    mov         dword ptr [ebp-8],3F00068E
 00488186    fld         dword ptr [edi+98];TGLCube.CubeWidth:Single
 0048818C    fmul        dword ptr [ebp-8]
 0048818F    fstp        dword ptr [ebp-0A4]
 00488195    wait
 00488196    fld         dword ptr [edi+9C];TGLCube.CubeHeight:Single
 0048819C    fmul        dword ptr [ebp-8]
 0048819F    fstp        dword ptr [ebp-0A0]
 004881A5    wait
 004881A6    fld         dword ptr [edi+0A0];TGLCube.CubeDepth:Single
 004881AC    fmul        dword ptr [ebp-8]
 004881AF    fstp        dword ptr [ebp-9C]
 004881B5    wait
 004881B6    mov         eax,[005AE3CC];^gvar_005ACF24
 004881BB    push        edi
 004881BC    mov         esi,eax
 004881BE    lea         edi,[ebp-68]
 004881C1    movs        dword ptr [edi],dword ptr [esi]
 004881C2    movs        dword ptr [edi],dword ptr [esi]
 004881C3    movs        dword ptr [edi],dword ptr [esi]
 004881C4    movs        dword ptr [edi],dword ptr [esi]
 004881C5    pop         edi
 004881C6    mov         eax,[005AE320];^gvar_005ACF34
 004881CB    push        edi
 004881CC    mov         esi,eax
 004881CE    lea         edi,[ebp-58]
 004881D1    movs        dword ptr [edi],dword ptr [esi]
 004881D2    movs        dword ptr [edi],dword ptr [esi]
 004881D3    movs        dword ptr [edi],dword ptr [esi]
 004881D4    movs        dword ptr [edi],dword ptr [esi]
 004881D5    pop         edi
 004881D6    mov         eax,[005AE214];^gvar_005ACF44
 004881DB    push        edi
 004881DC    mov         esi,eax
 004881DE    lea         edi,[ebp-48]
 004881E1    movs        dword ptr [edi],dword ptr [esi]
 004881E2    movs        dword ptr [edi],dword ptr [esi]
 004881E3    movs        dword ptr [edi],dword ptr [esi]
 004881E4    movs        dword ptr [edi],dword ptr [esi]
 004881E5    pop         edi
 004881E6    push        0BF800000
 004881EB    push        0
 004881ED    push        0
 004881EF    push        0
 004881F1    lea         eax,[ebp-38]
 004881F4    call        0045C980
 004881F9    push        0
 004881FB    push        0BF800000
 00488200    push        0
 00488202    push        0
 00488204    lea         eax,[ebp-28]
 00488207    call        0045C980
 0048820C    push        0
 0048820E    push        0
 00488210    push        0BF800000
 00488215    push        0
 00488217    lea         eax,[ebp-18]
 0048821A    call        0045C980
 0048821F    xor         esi,esi
 00488221    lea         ebx,[ebp-68]
 00488224    lea         edx,[ebp-78]
 00488227    mov         eax,ebx
 00488229    call        0045CE30
 0048822E    fcomp       dword ptr ds:[4883BC];0:Single
 00488234    fnstsw      al
 00488236    sahf
>00488237    jbe         004883A3
 0048823D    fld         dword ptr [ebx]
 0048823F    fmul        dword ptr [ebp-88]
 00488245    fld         dword ptr [ebx+4]
 00488248    fmul        dword ptr [ebp-84]
 0048824E    faddp       st(1),st
 00488250    fld         dword ptr [ebx+8]
 00488253    fmul        dword ptr [ebp-80]
 00488256    faddp       st(1),st
 00488258    fld         dword ptr ds:[4883C0];0.5:Single
 0048825E    mov         eax,esi
 00488260    mov         ecx,3
 00488265    cdq
 00488266    idiv        eax,ecx
 00488268    fmul        dword ptr [edi+edx*4+98]
 0048826F    faddp       st(1),st
 00488271    fchs
 00488273    fld         dword ptr [ebx]
 00488275    fmul        dword ptr [ebp-78]
 00488278    fld         dword ptr [ebx+4]
 0048827B    fmul        dword ptr [ebp-74]
 0048827E    faddp       st(1),st
 00488280    fld         dword ptr [ebx+8]
 00488283    fmul        dword ptr [ebp-70]
 00488286    faddp       st(1),st
 00488288    fdivp       st(1),st
 0048828A    fstp        dword ptr [ebp-4]
 0048828D    wait
 0048828E    fld         dword ptr [ebp-4]
 00488291    fmul        dword ptr [ebp-78]
 00488294    fadd        dword ptr [ebp-88]
 0048829A    add         esp,0FFFFFFFC
 0048829D    fstp        dword ptr [esp]
 004882A0    wait
 004882A1    fld         dword ptr [ebp-4]
 004882A4    fmul        dword ptr [ebp-74]
 004882A7    fadd        dword ptr [ebp-84]
 004882AD    add         esp,0FFFFFFFC
 004882B0    fstp        dword ptr [esp]
 004882B3    wait
 004882B4    fld         dword ptr [ebp-4]
 004882B7    fmul        dword ptr [ebp-70]
 004882BA    fadd        dword ptr [ebp-80]
 004882BD    add         esp,0FFFFFFFC
 004882C0    fstp        dword ptr [esp]
 004882C3    wait
 004882C4    lea         eax,[ebp-98]
 004882CA    call        0045C9D8
 004882CF    fld         dword ptr [ebp-98]
 004882D5    fabs
 004882D7    fcomp       dword ptr [ebp-0A4]
 004882DD    fnstsw      al
 004882DF    sahf
>004882E0    ja          004883A3
 004882E6    fld         dword ptr [ebp-94]
 004882EC    fabs
 004882EE    fcomp       dword ptr [ebp-0A0]
 004882F4    fnstsw      al
 004882F6    sahf
>004882F7    ja          004883A3
 004882FD    fld         dword ptr [ebp-90]
 00488303    fabs
 00488305    fcomp       dword ptr [ebp-9C]
 0048830B    fnstsw      al
 0048830D    sahf
>0048830E    ja          004883A3
 00488314    lea         ecx,[ebp-0B4]
 0048831A    lea         edx,[ebp-88]
 00488320    lea         eax,[ebp-98]
 00488326    call        0045CC04
 0048832B    lea         eax,[ebp-0B4]
 00488331    lea         edx,[ebp-78]
 00488334    call        0045CE30
 00488339    fcomp       dword ptr ds:[4883BC];0:Single
 0048833F    fnstsw      al
 00488341    sahf
>00488342    jbe         004883A3
 00488344    cmp         dword ptr [ebp+0C],0
>00488348    je          0048836B
 0048834A    lea         ecx,[ebp-0B4]
 00488350    lea         edx,[ebp-98]
 00488356    mov         eax,edi
 00488358    call        0047BDA0
 0048835D    lea         edx,[ebp-0B4]
 00488363    mov         eax,dword ptr [ebp+0C]
 00488366    call        0045CA18
 0048836B    cmp         dword ptr [ebp+8],0
>0048836F    je          0048839F
 00488371    lea         edx,[ebp-0C4]
 00488377    mov         eax,ebx
 00488379    call        0045D714
 0048837E    lea         edx,[ebp-0C4]
 00488384    lea         ecx,[ebp-0B4]
 0048838A    mov         eax,edi
 0048838C    call        0047BDA0
 00488391    lea         edx,[ebp-0B4]
 00488397    mov         eax,dword ptr [ebp+8]
 0048839A    call        0045CA4C
 0048839F    mov         al,1
>004883A1    jmp         004883B2
 004883A3    inc         esi
 004883A4    add         ebx,10
 004883A7    cmp         esi,6
>004883AA    jne         00488224
 004883B0    xor         eax,eax
 004883B2    pop         edi
 004883B3    pop         esi
 004883B4    pop         ebx
 004883B5    mov         esp,ebp
 004883B7    pop         ebp
 004883B8    ret         8
end;*}

//004883C4
procedure TGLCube.DefineProperties(Filer:TFiler);
begin
{*
 004883C4    push        ebx
 004883C5    push        esi
 004883C6    mov         esi,edx
 004883C8    mov         ebx,eax
 004883CA    mov         edx,esi
 004883CC    mov         eax,ebx
 004883CE    call        TGLBaseSceneObject.DefineProperties
 004883D3    push        ebx
 004883D4    push        488440
 004883D9    push        ebx
 004883DA    push        488454
 004883DF    fld         dword ptr [ebx+98];TGLCube.CubeWidth:Single
 004883E5    fcomp       dword ptr ds:[488428];1:Single
 004883EB    fnstsw      al
 004883ED    sahf
>004883EE    jne         00488416
 004883F0    fld         dword ptr [ebx+9C];TGLCube.CubeHeight:Single
 004883F6    fcomp       dword ptr ds:[488428];1:Single
 004883FC    fnstsw      al
 004883FE    sahf
>004883FF    jne         00488416
 00488401    fld         dword ptr [ebx+0A0];TGLCube.CubeDepth:Single
 00488407    fcomp       dword ptr ds:[488428];1:Single
 0048840D    fnstsw      al
 0048840F    sahf
>00488410    jne         00488416
 00488412    xor         ecx,ecx
>00488414    jmp         00488418
 00488416    mov         cl,1
 00488418    mov         edx,488434;'CubeSize'
 0048841D    mov         eax,esi
 0048841F    mov         ebx,dword ptr [eax]
 00488421    call        dword ptr [ebx+8];TFiler.DefineBinaryProperty
 00488424    pop         esi
 00488425    pop         ebx
 00488426    ret
*}
end;

//00488468
constructor TGLQuadricObject.Create(AOwner:TComponent);
begin
{*
 00488468    push        ebx
 00488469    push        esi
 0048846A    test        dl,dl
>0048846C    je          00488476
 0048846E    add         esp,0FFFFFFF0
 00488471    call        @ClassCreate
 00488476    mov         ebx,edx
 00488478    mov         esi,eax
 0048847A    xor         edx,edx
 0048847C    mov         eax,esi
 0048847E    call        TGLCustomSceneObject.Create
 00488483    mov         byte ptr [esi+98],1;TGLQuadricObject.Normals:TNormalSmoothing
 0048848A    mov         byte ptr [esi+99],1;TGLQuadricObject.NormalDirection:TNormalDirection
 00488491    mov         eax,esi
 00488493    test        bl,bl
>00488495    je          004884A6
 00488497    call        @AfterConstruction
 0048849C    pop         dword ptr fs:[0]
 004884A3    add         esp,0C
 004884A6    mov         eax,esi
 004884A8    pop         esi
 004884A9    pop         ebx
 004884AA    ret
*}
end;

//004884AC
procedure TGLQuadricObject.SetNormals(Value:TNormalSmoothing);
begin
{*
 004884AC    push        esi
 004884AD    mov         esi,eax
 004884AF    cmp         dl,byte ptr [esi+98];TGLQuadricObject.Normals:TNormalSmoothing
>004884B5    je          004884C8
 004884B7    mov         byte ptr [esi+98],dl;TGLQuadricObject.Normals:TNormalSmoothing
 004884BD    mov         eax,esi
 004884BF    mov         si,0FFE7
 004884C3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004884C8    pop         esi
 004884C9    ret
*}
end;

//004884CC
procedure TGLQuadricObject.SetNormalDirection(Value:TNormalDirection);
begin
{*
 004884CC    push        esi
 004884CD    mov         esi,eax
 004884CF    cmp         dl,byte ptr [esi+99];TGLQuadricObject.NormalDirection:TNormalDirection
>004884D5    je          004884E8
 004884D7    mov         byte ptr [esi+99],dl;TGLQuadricObject.NormalDirection:TNormalDirection
 004884DD    mov         eax,esi
 004884DF    mov         si,0FFE7
 004884E3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004884E8    pop         esi
 004884E9    ret
*}
end;

//004884EC
procedure TGLQuadricObject.Assign(Source:TPersistent);
begin
{*
 004884EC    push        ebx
 004884ED    push        esi
 004884EE    mov         ebx,edx
 004884F0    mov         esi,eax
 004884F2    test        ebx,ebx
>004884F4    je          00488521
 004884F6    mov         eax,ebx
 004884F8    mov         edx,dword ptr ds:[4843C0];TGLQuadricObject
 004884FE    call        @IsClass
 00488503    test        al,al
>00488505    je          00488521
 00488507    mov         eax,ebx
 00488509    mov         dl,byte ptr [eax+98]
 0048850F    mov         byte ptr [esi+98],dl;TGLQuadricObject.Normals:TNormalSmoothing
 00488515    mov         al,byte ptr [eax+99]
 0048851B    mov         byte ptr [esi+99],al;TGLQuadricObject.NormalDirection:TNormalDirection
 00488521    mov         edx,ebx
 00488523    mov         eax,esi
 00488525    call        TGLCustomSceneObject.Assign
 0048852A    pop         esi
 0048852B    pop         ebx
 0048852C    ret
*}
end;

//00488530
constructor TGLSphere.Create(AOwner:TComponent);
begin
{*
 00488530    push        ebx
 00488531    push        esi
 00488532    test        dl,dl
>00488534    je          0048853E
 00488536    add         esp,0FFFFFFF0
 00488539    call        @ClassCreate
 0048853E    mov         ebx,edx
 00488540    mov         esi,eax
 00488542    xor         edx,edx
 00488544    mov         eax,esi
 00488546    call        TGLQuadricObject.Create
 0048854B    mov         dword ptr [esi+0A0],3F000000;TGLSphere.Radius:Single
 00488555    mov         dword ptr [esi+0A4],10;TGLSphere.Slices:Integer
 0048855F    mov         dword ptr [esi+0A8],10;TGLSphere.Stacks:Integer
 00488569    mov         byte ptr [esi+0AC],5A;TGLSphere.Top:TAngleLimit1
 00488570    mov         byte ptr [esi+0AD],0A6;TGLSphere.Bottom:TAngleLimit1
 00488577    mov         word ptr [esi+0AE],0;TGLSphere.Start:TAngleLimit2
 00488580    mov         word ptr [esi+0B0],168;TGLSphere.Stop:TAngleLimit2
 00488589    mov         eax,esi
 0048858B    test        bl,bl
>0048858D    je          0048859E
 0048858F    call        @AfterConstruction
 00488594    pop         dword ptr fs:[0]
 0048859B    add         esp,0C
 0048859E    mov         eax,esi
 004885A0    pop         esi
 004885A1    pop         ebx
 004885A2    ret
*}
end;

//004885A4
{*procedure sub_004885A4(?:?);
begin
 004885A4    push        ebx
 004885A5    push        esi
 004885A6    push        edi
 004885A7    push        ebp
 004885A8    add         esp,0FFFFFEBC
 004885AE    mov         dword ptr [esp],edx
 004885B1    mov         ebp,eax
 004885B3    cmp         byte ptr [ebp+99],0;TGLSphere.NormalDirection:TNormalDirection
 004885BA    sete        bl
 004885BD    push        8
 004885BF    call        OpenGL32.glPushAttrib
 004885C4    test        bl,bl
>004885C6    je          004885D3
 004885C8    mov         eax,dword ptr [esp]
 004885CB    mov         eax,dword ptr [eax+5C]
 004885CE    call        0046D950
 004885D3    movsx       eax,byte ptr [ebp+0AC];TGLSphere.Top:TAngleLimit1
 004885DA    mov         dword ptr [esp+134],eax
 004885E1    fild        dword ptr [esp+134]
 004885E8    add         esp,0FFFFFFFC
 004885EB    fstp        dword ptr [esp]
 004885EE    wait
 004885EF    call        0045F4AC
 004885F4    fstp        tbyte ptr [esp+8]
 004885F8    wait
 004885F9    movsx       eax,byte ptr [ebp+0AD];TGLSphere.Bottom:TAngleLimit1
 00488600    mov         dword ptr [esp+134],eax
 00488607    fild        dword ptr [esp+134]
 0048860E    add         esp,0FFFFFFFC
 00488611    fstp        dword ptr [esp]
 00488614    wait
 00488615    call        0045F4AC
 0048861A    fstp        tbyte ptr [esp+18]
 0048861E    wait
 0048861F    fild        word ptr [ebp+0AE];TGLSphere.Start:TAngleLimit2
 00488625    add         esp,0FFFFFFFC
 00488628    fstp        dword ptr [esp]
 0048862B    wait
 0048862C    call        0045F4AC
 00488631    fstp        tbyte ptr [esp+28]
 00488635    wait
 00488636    fild        word ptr [ebp+0B0];TGLSphere.Stop:TAngleLimit2
 0048863C    add         esp,0FFFFFFFC
 0048863F    fstp        dword ptr [esp]
 00488642    wait
 00488643    call        0045F4AC
 00488648    fstp        tbyte ptr [esp+38]
 0048864C    wait
 0048864D    fld         tbyte ptr [esp+38]
 00488651    fld         tbyte ptr [esp+28]
 00488655    fsubp       st(1),st
 00488657    fild        dword ptr [ebp+0A4];TGLSphere.Slices:Integer
 0048865D    fdivp       st(1),st
 0048865F    fstp        tbyte ptr [esp+58]
 00488663    wait
 00488664    fld         tbyte ptr [esp+8]
 00488668    fld         tbyte ptr [esp+18]
 0048866C    fsubp       st(1),st
 0048866E    fild        dword ptr [ebp+0A8];TGLSphere.Stacks:Integer
 00488674    fdivp       st(1),st
 00488676    fstp        tbyte ptr [esp+48]
 0048867A    wait
 0048867B    call        OpenGL32.glPushMatrix
 00488680    push        dword ptr [ebp+0A0];TGLSphere.Radius:Single
 00488686    push        dword ptr [ebp+0A0];TGLSphere.Radius:Single
 0048868C    push        dword ptr [ebp+0A0];TGLSphere.Radius:Single
 00488692    call        OpenGL32.glScalef
 00488697    cmp         byte ptr [ebp+0AC],5A;TGLSphere.Top:TAngleLimit1
>0048869E    jge         004888B6
 004886A4    mov         al,byte ptr [ebp+0B2];TGLSphere.TopCap:TCapType
 004886AA    dec         eax
 004886AB    sub         al,2
>004886AD    jae         004888B6
 004886B3    push        6
 004886B5    call        OpenGL32.glBegin
 004886BA    mov         ax,word ptr [esp+10]
 004886BF    push        eax
 004886C0    push        dword ptr [esp+10]
 004886C4    push        dword ptr [esp+10]
 004886C8    lea         edx,[esp+84]
 004886CF    lea         eax,[esp+74]
 004886D3    call        0045F560
 004886D8    push        3F000000
 004886DD    push        3F000000
 004886E2    mov         eax,[005AE164];^gvar_005E1344
 004886E7    mov         eax,dword ptr [eax]
 004886E9    call        eax
 004886EB    test        bl,bl
>004886ED    je          004886FF
 004886EF    push        0
 004886F1    push        0BF800000
 004886F6    push        0
 004886F8    call        OpenGL32.glNormal3f
>004886FD    jmp         0048870D
 004886FF    push        0
 00488701    push        3F800000
 00488706    push        0
 00488708    call        OpenGL32.glNormal3f
 0048870D    cmp         byte ptr [ebp+0B2],1;TGLSphere.TopCap:TCapType
>00488714    jne         00488723
 00488716    push        0
 00488718    push        0
 0048871A    push        0
 0048871C    call        OpenGL32.glVertex3f
>00488721    jmp         0048876E
 00488723    push        0
 00488725    fld         tbyte ptr [esp+6C]
 00488729    add         esp,0FFFFFFFC
 0048872C    fstp        dword ptr [esp]
 0048872F    wait
 00488730    push        0
 00488732    call        OpenGL32.glVertex3f
 00488737    mov         eax,[005AE58C];^gvar_005ACEF4
 0048873C    mov         edx,dword ptr [eax]
 0048873E    mov         dword ptr [esp+128],edx
 00488745    mov         edx,dword ptr [eax+4]
 00488748    mov         dword ptr [esp+12C],edx
 0048874F    mov         edx,dword ptr [eax+8]
 00488752    mov         dword ptr [esp+130],edx
 00488759    test        bl,bl
>0048875B    je          0048876E
 0048875D    fld         dword ptr [esp+12C]
 00488764    fchs
 00488766    fstp        dword ptr [esp+12C]
 0048876D    wait
 0048876E    fld         tbyte ptr [esp+68]
 00488772    fstp        dword ptr [esp+114]
 00488779    wait
 0048877A    mov         eax,dword ptr [esp+28]
 0048877E    mov         dword ptr [esp+0E8],eax
 00488785    mov         eax,dword ptr [esp+2C]
 00488789    mov         dword ptr [esp+0EC],eax
 00488790    mov         ax,word ptr [esp+30]
 00488795    mov         word ptr [esp+0F0],ax
 0048879D    mov         eax,dword ptr [ebp+0A4];TGLSphere.Slices:Integer
 004887A3    test        eax,eax
>004887A5    jl          004888B1
 004887AB    inc         eax
 004887AC    mov         dword ptr [esp+10C],eax
 004887B3    mov         ax,word ptr [esp+0F0]
 004887BB    push        eax
 004887BC    push        dword ptr [esp+0F0]
 004887C3    push        dword ptr [esp+0F0]
 004887CA    lea         edx,[esp+0C4]
 004887D1    lea         eax,[esp+0B4]
 004887D8    call        0045F560
 004887DD    fld         tbyte ptr [esp+78]
 004887E1    fld         tbyte ptr [esp+0A8]
 004887E8    fmulp       st(1),st
 004887EA    fstp        dword ptr [esp+110]
 004887F1    wait
 004887F2    fld         tbyte ptr [esp+78]
 004887F6    fld         tbyte ptr [esp+0B8]
 004887FD    fmulp       st(1),st
 004887FF    fstp        dword ptr [esp+118]
 00488806    wait
 00488807    cmp         byte ptr [ebp+0B2],1;TGLSphere.TopCap:TCapType
>0048880E    jne         00488838
 00488810    lea         ecx,[esp+128]
 00488817    lea         edx,[esp+110]
 0048881E    mov         eax,[005AE58C];^gvar_005ACEF4
 00488823    call        0045D964
 00488828    test        bl,bl
>0048882A    je          00488838
 0048882C    lea         eax,[esp+128]
 00488833    call        0045D734
 00488838    fld         tbyte ptr [esp+0B8]
 0048883F    fmul        dword ptr ds:[488E54];0.5:Single
 00488845    fadd        dword ptr ds:[488E54];0.5:Single
 0048884B    add         esp,0FFFFFFFC
 0048884E    fstp        dword ptr [esp]
 00488851    wait
 00488852    fld         tbyte ptr [esp+0AC]
 00488859    fmul        dword ptr ds:[488E54];0.5:Single
 0048885F    fadd        dword ptr ds:[488E54];0.5:Single
 00488865    add         esp,0FFFFFFFC
 00488868    fstp        dword ptr [esp]
 0048886B    wait
 0048886C    mov         eax,[005AE164];^gvar_005E1344
 00488871    mov         eax,dword ptr [eax]
 00488873    call        eax
 00488875    lea         eax,[esp+128]
 0048887C    push        eax
 0048887D    call        OpenGL32.glNormal3fv
 00488882    lea         eax,[esp+110]
 00488889    push        eax
 0048888A    call        OpenGL32.glVertex3fv
 0048888F    fld         tbyte ptr [esp+0E8]
 00488896    fld         tbyte ptr [esp+58]
 0048889A    faddp       st(1),st
 0048889C    fstp        tbyte ptr [esp+0E8]
 004888A3    wait
 004888A4    dec         dword ptr [esp+10C]
>004888AB    jne         004887B3
 004888B1    call        OpenGL32.glEnd
 004888B6    mov         eax,dword ptr [esp+8]
 004888BA    mov         dword ptr [esp+0C8],eax
 004888C1    mov         eax,dword ptr [esp+0C]
 004888C5    mov         dword ptr [esp+0CC],eax
 004888CC    mov         ax,word ptr [esp+10]
 004888D1    mov         word ptr [esp+0D0],ax
 004888D9    fld         tbyte ptr [esp+0C8]
 004888E0    fld         tbyte ptr [esp+48]
 004888E4    fsubp       st(1),st
 004888E6    fstp        tbyte ptr [esp+0D8]
 004888ED    wait
 004888EE    fild        dword ptr [ebp+0A4];TGLSphere.Slices:Integer
 004888F4    fdivr       dword ptr ds:[488E58];1:Single
 004888FA    fstp        dword ptr [esp+0F8]
 00488901    wait
 00488902    mov         eax,dword ptr [ebp+0A8];TGLSphere.Stacks:Integer
 00488908    mov         dword ptr [esp+134],eax
 0048890F    fild        dword ptr [esp+134]
 00488916    fdivr       dword ptr ds:[488E58];1:Single
 0048891C    fstp        dword ptr [esp+0FC]
 00488923    wait
 00488924    dec         eax
 00488925    test        eax,eax
>00488927    jl          00488BF4
 0048892D    inc         eax
 0048892E    mov         dword ptr [esp+10C],eax
 00488935    mov         dword ptr [esp+108],0
 00488940    mov         eax,dword ptr [esp+28]
 00488944    mov         dword ptr [esp+0E8],eax
 0048894B    mov         eax,dword ptr [esp+2C]
 0048894F    mov         dword ptr [esp+0EC],eax
 00488956    mov         ax,word ptr [esp+30]
 0048895B    mov         word ptr [esp+0F0],ax
 00488963    mov         ax,word ptr [esp+0D0]
 0048896B    push        eax
 0048896C    push        dword ptr [esp+0D0]
 00488973    push        dword ptr [esp+0D0]
 0048897A    lea         edx,[esp+84]
 00488981    lea         eax,[esp+74]
 00488985    call        0045F560
 0048898A    mov         ax,word ptr [esp+0E0]
 00488992    push        eax
 00488993    push        dword ptr [esp+0E0]
 0048899A    push        dword ptr [esp+0E0]
 004889A1    lea         edx,[esp+0A4]
 004889A8    lea         eax,[esp+94]
 004889AF    call        0045F560
 004889B4    fld         tbyte ptr [esp+68]
 004889B8    fstp        dword ptr [esp+114]
 004889BF    wait
 004889C0    fld         tbyte ptr [esp+88]
 004889C7    fstp        dword ptr [esp+120]
 004889CE    wait
 004889CF    fild        dword ptr [esp+108]
 004889D6    fmul        dword ptr [esp+0FC]
 004889DD    fsubr       dword ptr ds:[488E58];1:Single
 004889E3    fstp        dword ptr [esp+100]
 004889EA    wait
 004889EB    mov         eax,dword ptr [esp+108]
 004889F2    inc         eax
 004889F3    mov         dword ptr [esp+134],eax
 004889FA    fild        dword ptr [esp+134]
 00488A01    fmul        dword ptr [esp+0FC]
 00488A08    fsubr       dword ptr ds:[488E58];1:Single
 00488A0E    fstp        dword ptr [esp+104]
 00488A15    wait
 00488A16    push        5
 00488A18    call        OpenGL32.glBegin
 00488A1D    mov         esi,dword ptr [ebp+0A4];TGLSphere.Slices:Integer
 00488A23    test        esi,esi
>00488A25    jl          00488B9A
 00488A2B    inc         esi
 00488A2C    xor         edi,edi
 00488A2E    mov         ax,word ptr [esp+0F0]
 00488A36    push        eax
 00488A37    push        dword ptr [esp+0F0]
 00488A3E    push        dword ptr [esp+0F0]
 00488A45    lea         edx,[esp+0C4]
 00488A4C    lea         eax,[esp+0B4]
 00488A53    call        0045F560
 00488A58    fld         tbyte ptr [esp+78]
 00488A5C    fld         tbyte ptr [esp+0A8]
 00488A63    fmulp       st(1),st
 00488A65    fstp        dword ptr [esp+110]
 00488A6C    wait
 00488A6D    fld         tbyte ptr [esp+98]
 00488A74    fld         tbyte ptr [esp+0A8]
 00488A7B    fmulp       st(1),st
 00488A7D    fstp        dword ptr [esp+11C]
 00488A84    wait
 00488A85    fld         tbyte ptr [esp+78]
 00488A89    fld         tbyte ptr [esp+0B8]
 00488A90    fmulp       st(1),st
 00488A92    fstp        dword ptr [esp+118]
 00488A99    wait
 00488A9A    fld         tbyte ptr [esp+98]
 00488AA1    fld         tbyte ptr [esp+0B8]
 00488AA8    fmulp       st(1),st
 00488AAA    fstp        dword ptr [esp+124]
 00488AB1    wait
 00488AB2    mov         dword ptr [esp+134],edi
 00488AB9    fild        dword ptr [esp+134]
 00488AC0    fmul        dword ptr [esp+0F8]
 00488AC7    fstp        dword ptr [esp+0F4]
 00488ACE    wait
 00488ACF    push        dword ptr [esp+100]
 00488AD6    push        dword ptr [esp+0F8]
 00488ADD    mov         eax,[005AE164];^gvar_005E1344
 00488AE2    mov         eax,dword ptr [eax]
 00488AE4    call        eax
 00488AE6    test        bl,bl
>00488AE8    je          00488B0C
 00488AEA    lea         edx,[esp+128]
 00488AF1    lea         eax,[esp+110]
 00488AF8    call        0045D6FC
 00488AFD    lea         eax,[esp+128]
 00488B04    push        eax
 00488B05    call        OpenGL32.glNormal3fv
>00488B0A    jmp         00488B19
 00488B0C    lea         eax,[esp+110]
 00488B13    push        eax
 00488B14    call        OpenGL32.glNormal3fv
 00488B19    lea         eax,[esp+110]
 00488B20    push        eax
 00488B21    call        OpenGL32.glVertex3fv
 00488B26    push        dword ptr [esp+104]
 00488B2D    push        dword ptr [esp+0F8]
 00488B34    mov         eax,[005AE164];^gvar_005E1344
 00488B39    mov         eax,dword ptr [eax]
 00488B3B    call        eax
 00488B3D    test        bl,bl
>00488B3F    je          00488B63
 00488B41    lea         edx,[esp+128]
 00488B48    lea         eax,[esp+11C]
 00488B4F    call        0045D6FC
 00488B54    lea         eax,[esp+128]
 00488B5B    push        eax
 00488B5C    call        OpenGL32.glNormal3fv
>00488B61    jmp         00488B70
 00488B63    lea         eax,[esp+11C]
 00488B6A    push        eax
 00488B6B    call        OpenGL32.glNormal3fv
 00488B70    lea         eax,[esp+11C]
 00488B77    push        eax
 00488B78    call        OpenGL32.glVertex3fv
 00488B7D    fld         tbyte ptr [esp+0E8]
 00488B84    fld         tbyte ptr [esp+58]
 00488B88    faddp       st(1),st
 00488B8A    fstp        tbyte ptr [esp+0E8]
 00488B91    wait
 00488B92    inc         edi
 00488B93    dec         esi
>00488B94    jne         00488A2E
 00488B9A    call        OpenGL32.glEnd
 00488B9F    mov         eax,dword ptr [esp+0D8]
 00488BA6    mov         dword ptr [esp+0C8],eax
 00488BAD    mov         eax,dword ptr [esp+0DC]
 00488BB4    mov         dword ptr [esp+0CC],eax
 00488BBB    mov         ax,word ptr [esp+0E0]
 00488BC3    mov         word ptr [esp+0D0],ax
 00488BCB    fld         tbyte ptr [esp+0D8]
 00488BD2    fld         tbyte ptr [esp+48]
 00488BD6    fsubp       st(1),st
 00488BD8    fstp        tbyte ptr [esp+0D8]
 00488BDF    wait
 00488BE0    inc         dword ptr [esp+108]
 00488BE7    dec         dword ptr [esp+10C]
>00488BEE    jne         00488940
 00488BF4    cmp         byte ptr [ebp+0AD],0A6;TGLSphere.Bottom:TAngleLimit1
>00488BFB    jle         00488E30
 00488C01    mov         al,byte ptr [ebp+0B3];TGLSphere.BottomCap:TCapType
 00488C07    dec         eax
 00488C08    sub         al,2
>00488C0A    jae         00488E30
 00488C10    push        6
 00488C12    call        OpenGL32.glBegin
 00488C17    mov         ax,word ptr [esp+20]
 00488C1C    push        eax
 00488C1D    push        dword ptr [esp+20]
 00488C21    push        dword ptr [esp+20]
 00488C25    lea         edx,[esp+84]
 00488C2C    lea         eax,[esp+74]
 00488C30    call        0045F560
 00488C35    push        3F000000
 00488C3A    push        3F000000
 00488C3F    mov         eax,[005AE164];^gvar_005E1344
 00488C44    mov         eax,dword ptr [eax]
 00488C46    call        eax
 00488C48    test        bl,bl
>00488C4A    je          00488C5C
 00488C4C    push        0
 00488C4E    push        3F800000
 00488C53    push        0
 00488C55    call        OpenGL32.glNormal3f
>00488C5A    jmp         00488C6A
 00488C5C    push        0
 00488C5E    push        0BF800000
 00488C63    push        0
 00488C65    call        OpenGL32.glNormal3f
 00488C6A    cmp         byte ptr [ebp+0B3],1;TGLSphere.BottomCap:TCapType
>00488C71    jne         00488C80
 00488C73    push        0
 00488C75    push        0
 00488C77    push        0
 00488C79    call        OpenGL32.glVertex3f
>00488C7E    jmp         00488CD1
 00488C80    push        0
 00488C82    fld         tbyte ptr [esp+6C]
 00488C86    add         esp,0FFFFFFFC
 00488C89    fstp        dword ptr [esp]
 00488C8C    wait
 00488C8D    push        0
 00488C8F    call        OpenGL32.glVertex3f
 00488C94    test        bl,bl
>00488C96    je          00488CAF
 00488C98    push        0
 00488C9A    push        0BF800000
 00488C9F    push        0
 00488CA1    lea         eax,[esp+134]
 00488CA8    call        0045CA34
>00488CAD    jmp         00488CD1
 00488CAF    mov         eax,[005AE58C];^gvar_005ACEF4
 00488CB4    mov         edx,dword ptr [eax]
 00488CB6    mov         dword ptr [esp+128],edx
 00488CBD    mov         edx,dword ptr [eax+4]
 00488CC0    mov         dword ptr [esp+12C],edx
 00488CC7    mov         edx,dword ptr [eax+8]
 00488CCA    mov         dword ptr [esp+130],edx
 00488CD1    fld         tbyte ptr [esp+68]
 00488CD5    fstp        dword ptr [esp+114]
 00488CDC    wait
 00488CDD    mov         eax,dword ptr [esp+38]
 00488CE1    mov         dword ptr [esp+0E8],eax
 00488CE8    mov         eax,dword ptr [esp+3C]
 00488CEC    mov         dword ptr [esp+0EC],eax
 00488CF3    mov         ax,word ptr [esp+40]
 00488CF8    mov         word ptr [esp+0F0],ax
 00488D00    mov         eax,dword ptr [ebp+0A4];TGLSphere.Slices:Integer
 00488D06    test        eax,eax
>00488D08    jl          00488E2B
 00488D0E    inc         eax
 00488D0F    mov         dword ptr [esp+10C],eax
 00488D16    mov         ax,word ptr [esp+0F0]
 00488D1E    push        eax
 00488D1F    push        dword ptr [esp+0F0]
 00488D26    push        dword ptr [esp+0F0]
 00488D2D    lea         edx,[esp+0C4]
 00488D34    lea         eax,[esp+0B4]
 00488D3B    call        0045F560
 00488D40    fld         tbyte ptr [esp+78]
 00488D44    fld         tbyte ptr [esp+0A8]
 00488D4B    fmulp       st(1),st
 00488D4D    fstp        dword ptr [esp+110]
 00488D54    wait
 00488D55    fld         tbyte ptr [esp+78]
 00488D59    fld         tbyte ptr [esp+0B8]
 00488D60    fmulp       st(1),st
 00488D62    fstp        dword ptr [esp+118]
 00488D69    wait
 00488D6A    cmp         byte ptr [ebp+0B2],1;TGLSphere.TopCap:TCapType
>00488D71    jne         00488DB2
 00488D73    push        0
 00488D75    push        0BF800000
 00488D7A    push        0
 00488D7C    lea         eax,[esp+144]
 00488D83    call        0045C8C4
 00488D88    lea         eax,[esp+138]
 00488D8F    lea         ecx,[esp+128]
 00488D96    lea         edx,[esp+110]
 00488D9D    call        0045D964
 00488DA2    test        bl,bl
>00488DA4    je          00488DB2
 00488DA6    lea         eax,[esp+128]
 00488DAD    call        0045D734
 00488DB2    fld         tbyte ptr [esp+0B8]
 00488DB9    fmul        dword ptr ds:[488E54];0.5:Single
 00488DBF    fadd        dword ptr ds:[488E54];0.5:Single
 00488DC5    add         esp,0FFFFFFFC
 00488DC8    fstp        dword ptr [esp]
 00488DCB    wait
 00488DCC    fld         tbyte ptr [esp+0AC]
 00488DD3    fmul        dword ptr ds:[488E54];0.5:Single
 00488DD9    fadd        dword ptr ds:[488E54];0.5:Single
 00488DDF    add         esp,0FFFFFFFC
 00488DE2    fstp        dword ptr [esp]
 00488DE5    wait
 00488DE6    mov         eax,[005AE164];^gvar_005E1344
 00488DEB    mov         eax,dword ptr [eax]
 00488DED    call        eax
 00488DEF    lea         eax,[esp+128]
 00488DF6    push        eax
 00488DF7    call        OpenGL32.glNormal3fv
 00488DFC    lea         eax,[esp+110]
 00488E03    push        eax
 00488E04    call        OpenGL32.glVertex3fv
 00488E09    fld         tbyte ptr [esp+0E8]
 00488E10    fld         tbyte ptr [esp+58]
 00488E14    fsubp       st(1),st
 00488E16    fstp        tbyte ptr [esp+0E8]
 00488E1D    wait
 00488E1E    dec         dword ptr [esp+10C]
>00488E25    jne         00488D16
 00488E2B    call        OpenGL32.glEnd
 00488E30    test        bl,bl
>00488E32    je          00488E3F
 00488E34    mov         eax,dword ptr [esp]
 00488E37    mov         eax,dword ptr [eax+5C]
 00488E3A    call        0046D950
 00488E3F    call        OpenGL32.glPopMatrix
 00488E44    call        OpenGL32.glPopAttrib
 00488E49    add         esp,144
 00488E4F    pop         ebp
 00488E50    pop         edi
 00488E51    pop         esi
 00488E52    pop         ebx
 00488E53    ret
end;*}

//00488E5C
{*function sub_00488E5C(?:?; ?:?; ?:?; ?:?):?;
begin
 00488E5C    push        ebp
 00488E5D    mov         ebp,esp
 00488E5F    add         esp,0FFFFFFB0
 00488E62    push        ebx
 00488E63    push        esi
 00488E64    push        edi
 00488E65    mov         edi,ecx
 00488E67    mov         ebx,edx
 00488E69    mov         esi,eax
 00488E6B    lea         ecx,[ebp-50]
 00488E6E    mov         edx,ebx
 00488E70    mov         eax,esi
 00488E72    call        0047BD80
 00488E77    lea         edx,[ebp-50]
 00488E7A    lea         eax,[ebp-30]
 00488E7D    call        0045C9C0
 00488E82    lea         ecx,[ebp-50]
 00488E85    mov         edx,edi
 00488E87    mov         eax,esi
 00488E89    call        0047BD80
 00488E8E    lea         edx,[ebp-50]
 00488E91    lea         eax,[ebp-40]
 00488E94    call        0045C9C0
 00488E99    lea         eax,[ebp-40]
 00488E9C    call        0045D5EC
 00488EA1    push        dword ptr [esi+0A0];TGLSphere.Radius:Single
 00488EA7    lea         eax,[ebp-10]
 00488EAA    push        eax
 00488EAB    lea         eax,[ebp-20]
 00488EAE    push        eax
 00488EAF    mov         ecx,dword ptr ds:[5AE1F8];^gvar_005ACF84
 00488EB5    lea         edx,[ebp-40]
 00488EB8    lea         eax,[ebp-30]
 00488EBB    call        0045FAAC
 00488EC0    test        eax,eax
>00488EC2    jle         00488F09
 00488EC4    mov         bl,1
 00488EC6    cmp         dword ptr [ebp+0C],0
>00488ECA    je          00488EE4
 00488ECC    lea         ecx,[ebp-50]
 00488ECF    lea         edx,[ebp-10]
 00488ED2    mov         eax,esi
 00488ED4    call        0047BDA0
 00488ED9    lea         edx,[ebp-50]
 00488EDC    mov         eax,dword ptr [ebp+0C]
 00488EDF    call        0045C9C0
 00488EE4    cmp         dword ptr [ebp+8],0
>00488EE8    je          00488F0B
 00488EEA    xor         eax,eax
 00488EEC    mov         dword ptr [ebp-4],eax
 00488EEF    lea         ecx,[ebp-50]
 00488EF2    lea         edx,[ebp-10]
 00488EF5    mov         eax,esi
 00488EF7    call        0047BDA0
 00488EFC    lea         edx,[ebp-50]
 00488EFF    mov         eax,dword ptr [ebp+8]
 00488F02    call        0045C9C0
>00488F07    jmp         00488F0B
 00488F09    xor         ebx,ebx
 00488F0B    mov         eax,ebx
 00488F0D    pop         edi
 00488F0E    pop         esi
 00488F0F    pop         ebx
 00488F10    mov         esp,ebp
 00488F12    pop         ebp
 00488F13    ret         8
end;*}

//00488F18
{*procedure sub_00488F18(?:?);
begin
 00488F18    push        ebx
 00488F19    push        esi
 00488F1A    push        edi
 00488F1B    push        ebp
 00488F1C    add         esp,0FFFFFFC0
 00488F1F    mov         dword ptr [esp+4],edx
 00488F23    mov         dword ptr [esp],eax
 00488F26    mov         eax,dword ptr [esp]
 00488F29    mov         edx,dword ptr [eax+0A4]
 00488F2F    mov         eax,dword ptr [esp]
 00488F32    mov         eax,dword ptr [eax+0A8]
 00488F38    call        0045F710
 00488F3D    mov         dword ptr [esp+14],eax
 00488F41    lea         ecx,[esp+18]
 00488F45    mov         edx,dword ptr ds:[5AE610];^gvar_005ACEE8
 00488F4B    mov         eax,dword ptr [esp+4]
 00488F4F    call        0045CEA8
 00488F54    lea         eax,[esp+18]
 00488F58    call        0045D408
 00488F5D    fld         tbyte ptr ds:[489078];0.001:Extended
 00488F63    fcompp
 00488F65    fnstsw      al
 00488F67    sahf
>00488F68    jbe         00488F7D
 00488F6A    lea         ecx,[esp+18]
 00488F6E    mov         edx,dword ptr ds:[5AE58C];^gvar_005ACEF4
 00488F74    mov         eax,dword ptr [esp+4]
 00488F78    call        0045CEA8
 00488F7D    lea         ecx,[esp+24]
 00488F81    lea         edx,[esp+18]
 00488F85    mov         eax,dword ptr [esp+4]
 00488F89    call        0045CEA8
 00488F8E    lea         eax,[esp+18]
 00488F92    call        0045D460
 00488F97    lea         eax,[esp+24]
 00488F9B    call        0045D460
 00488FA0    mov         dl,1
 00488FA2    mov         eax,[0046E9C4];TGLSilhouette
 00488FA7    call        TGLSilhouette.Create;TGLSilhouette.Create
 00488FAC    mov         esi,eax
 00488FAE    fild        dword ptr [esp+14]
 00488FB2    fld         tbyte ptr ds:[489084];6.28318530717959:Extended
 00488FB8    fdivrp      st(1),st
 00488FBA    fstp        dword ptr [esp+10]
 00488FBE    wait
 00488FBF    mov         ebp,dword ptr [esp+14]
 00488FC3    dec         ebp
 00488FC4    test        ebp,ebp
>00488FC6    jl          00489055
 00488FCC    inc         ebp
 00488FCD    xor         ebx,ebx
 00488FCF    mov         dword ptr [esp+30],ebx
 00488FD3    fild        dword ptr [esp+30]
 00488FD7    fmul        dword ptr [esp+10]
 00488FDB    add         esp,0FFFFFFFC
 00488FDE    fstp        dword ptr [esp]
 00488FE1    wait
 00488FE2    mov         eax,dword ptr [esp+4]
 00488FE6    push        dword ptr [eax+0A0]
 00488FEC    lea         edx,[esp+14]
 00488FF0    lea         eax,[esp+10]
 00488FF4    call        0045F580
 00488FF9    push        dword ptr [esp+8]
 00488FFD    push        dword ptr [esp+10]
 00489001    lea         ecx,[esp+3C]
 00489005    lea         edx,[esp+2C]
 00489009    lea         eax,[esp+20]
 0048900D    call        0045CD18
 00489012    lea         edx,[esp+34]
 00489016    mov         eax,dword ptr [esi+4];TGLSilhouette.?f4:TVectorList
 00489019    call        00468F1C
 0048901E    lea         eax,[ebx+1]
 00489021    cdq
 00489022    idiv        eax,dword ptr [esp+14]
 00489026    mov         edi,edx
 00489028    mov         eax,dword ptr [esi+8];TGLSilhouette.?f8:TIntegerList
 0048902B    mov         ecx,edi
 0048902D    mov         edx,ebx
 0048902F    call        004691E0
 00489034    mov         eax,dword ptr [esp+4]
 00489038    cmp         byte ptr [eax+19],0
>0048903C    je          0048904D
 0048903E    push        edi
 0048903F    mov         eax,dword ptr [esi+0C];TGLSilhouette.?fC:TIntegerList
 00489042    mov         ecx,ebx
 00489044    mov         edx,dword ptr [esp+18]
 00489048    call        00469218
 0048904D    inc         ebx
 0048904E    dec         ebp
>0048904F    jne         00488FCF
 00489055    mov         eax,dword ptr [esp+4]
 00489059    cmp         byte ptr [eax+19],0
>0048905D    je          0048906D
 0048905F    mov         edx,dword ptr ds:[5AE680];^gvar_005ACFA4
 00489065    mov         eax,dword ptr [esi+4];TGLSilhouette.?f4:TVectorList
 00489068    call        00468EB8
 0048906D    mov         eax,esi
 0048906F    add         esp,40
 00489072    pop         ebp
 00489073    pop         edi
 00489074    pop         esi
 00489075    pop         ebx
 00489076    ret
end;*}

//00489090
procedure TGLSphere.SetBottom(Value:TAngleLimit1);
begin
{*
 00489090    push        esi
 00489091    mov         esi,eax
 00489093    cmp         dl,byte ptr [esi+0AD];TGLSphere.Bottom:TAngleLimit1
>00489099    je          004890AC
 0048909B    mov         byte ptr [esi+0AD],dl;TGLSphere.Bottom:TAngleLimit1
 004890A1    mov         eax,esi
 004890A3    mov         si,0FFE7
 004890A7    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004890AC    pop         esi
 004890AD    ret
*}
end;

//004890B0
procedure TGLSphere.SetBottomCap(Value:TCapType);
begin
{*
 004890B0    push        esi
 004890B1    mov         esi,eax
 004890B3    cmp         dl,byte ptr [esi+0B3];TGLSphere.BottomCap:TCapType
>004890B9    je          004890CC
 004890BB    mov         byte ptr [esi+0B3],dl;TGLSphere.BottomCap:TCapType
 004890C1    mov         eax,esi
 004890C3    mov         si,0FFE7
 004890C7    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004890CC    pop         esi
 004890CD    ret
*}
end;

//004890D0
{*procedure TGLSphere.SetRadius(Value:Single; ?:?);
begin
 004890D0    push        ebp
 004890D1    mov         ebp,esp
 004890D3    push        esi
 004890D4    mov         edx,eax
 004890D6    fld         dword ptr [ebp+8]
 004890D9    fcomp       dword ptr [edx+0A0];TGLSphere.Radius:Single
 004890DF    fnstsw      al
 004890E1    sahf
>004890E2    je          004890F8
 004890E4    mov         eax,dword ptr [ebp+8]
 004890E7    mov         dword ptr [edx+0A0],eax;TGLSphere.Radius:Single
 004890ED    mov         eax,edx
 004890EF    mov         si,0FFE7
 004890F3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004890F8    pop         esi
 004890F9    pop         ebp
 004890FA    ret         4
end;*}

//00489100
procedure TGLSphere.SetSlices(Value:Integer);
begin
{*
 00489100    push        esi
 00489101    mov         esi,eax
 00489103    cmp         edx,dword ptr [esi+0A4];TGLSphere.Slices:Integer
>00489109    je          0048912C
 0048910B    test        edx,edx
>0048910D    jg          0048911B
 0048910F    mov         dword ptr [esi+0A4],1;TGLSphere.Slices:Integer
>00489119    jmp         00489121
 0048911B    mov         dword ptr [esi+0A4],edx;TGLSphere.Slices:Integer
 00489121    mov         eax,esi
 00489123    mov         si,0FFE7
 00489127    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048912C    pop         esi
 0048912D    ret
*}
end;

//00489130
procedure TGLSphere.SetStacks(Value:Integer);
begin
{*
 00489130    push        esi
 00489131    mov         esi,eax
 00489133    cmp         edx,dword ptr [esi+0A8];TGLSphere.Stacks:Integer
>00489139    je          0048915C
 0048913B    test        edx,edx
>0048913D    jg          0048914B
 0048913F    mov         dword ptr [esi+0A8],1;TGLSphere.Stacks:Integer
>00489149    jmp         00489151
 0048914B    mov         dword ptr [esi+0A8],edx;TGLSphere.Stacks:Integer
 00489151    mov         eax,esi
 00489153    mov         si,0FFE7
 00489157    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048915C    pop         esi
 0048915D    ret
*}
end;

//00489160
procedure TGLSphere.SetStart(Value:TAngleLimit2);
begin
{*
 00489160    push        ebx
 00489161    push        esi
 00489162    mov         esi,edx
 00489164    mov         ebx,eax
 00489166    cmp         si,word ptr [ebx+0AE];TGLSphere.Start:TAngleLimit2
>0048916D    je          0048919E
 0048916F    cmp         si,word ptr [ebx+0B0];TGLSphere.Stop:TAngleLimit2
>00489176    jbe         0048918C
 00489178    mov         ecx,0CA9
 0048917D    mov         edx,4891AC;'C:\GLScene\glscene_v_1000714\Source\GLObjects.pas'
 00489182    mov         eax,4891E8;'Assertion failure'
 00489187    call        @Assert
 0048918C    mov         word ptr [ebx+0AE],si;TGLSphere.Start:TAngleLimit2
 00489193    mov         eax,ebx
 00489195    mov         si,0FFE7
 00489199    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048919E    pop         esi
 0048919F    pop         ebx
 004891A0    ret
*}
end;

//004891FC
procedure TGLSphere.SetStop(Value:TAngleLimit2);
begin
{*
 004891FC    push        ebx
 004891FD    push        esi
 004891FE    mov         esi,edx
 00489200    mov         ebx,eax
 00489202    cmp         si,word ptr [ebx+0B0];TGLSphere.Stop:TAngleLimit2
>00489209    je          0048923A
 0048920B    cmp         si,word ptr [ebx+0AE];TGLSphere.Start:TAngleLimit2
>00489212    jae         00489228
 00489214    mov         ecx,0CB4
 00489219    mov         edx,489248;'C:\GLScene\glscene_v_1000714\Source\GLObjects.pas'
 0048921E    mov         eax,489284;'Assertion failure'
 00489223    call        @Assert
 00489228    mov         word ptr [ebx+0B0],si;TGLSphere.Stop:TAngleLimit2
 0048922F    mov         eax,ebx
 00489231    mov         si,0FFE7
 00489235    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0048923A    pop         esi
 0048923B    pop         ebx
 0048923C    ret
*}
end;

//00489298
procedure TGLSphere.SetTop(Value:TAngleLimit1);
begin
{*
 00489298    push        esi
 00489299    mov         esi,eax
 0048929B    cmp         dl,byte ptr [esi+0AC];TGLSphere.Top:TAngleLimit1
>004892A1    je          004892B4
 004892A3    mov         byte ptr [esi+0AC],dl;TGLSphere.Top:TAngleLimit1
 004892A9    mov         eax,esi
 004892AB    mov         si,0FFE7
 004892AF    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004892B4    pop         esi
 004892B5    ret
*}
end;

//004892B8
procedure TGLSphere.SetTopCap(Value:TCapType);
begin
{*
 004892B8    push        esi
 004892B9    mov         esi,eax
 004892BB    cmp         dl,byte ptr [esi+0B2];TGLSphere.TopCap:TCapType
>004892C1    je          004892D4
 004892C3    mov         byte ptr [esi+0B2],dl;TGLSphere.TopCap:TCapType
 004892C9    mov         eax,esi
 004892CB    mov         si,0FFE7
 004892CF    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004892D4    pop         esi
 004892D5    ret
*}
end;

//004892D8
procedure TGLSphere.Assign(Source:TPersistent);
begin
{*
 004892D8    push        ebx
 004892D9    push        esi
 004892DA    mov         ebx,edx
 004892DC    mov         esi,eax
 004892DE    test        ebx,ebx
>004892E0    je          0048934D
 004892E2    mov         eax,ebx
 004892E4    mov         edx,dword ptr ds:[48457C];TGLSphere
 004892EA    call        @IsClass
 004892EF    test        al,al
>004892F1    je          0048934D
 004892F3    mov         eax,ebx
 004892F5    mov         edx,dword ptr [eax+0A0]
 004892FB    mov         dword ptr [esi+0A0],edx;TGLSphere.Radius:Single
 00489301    mov         edx,dword ptr [eax+0A4]
 00489307    mov         dword ptr [esi+0A4],edx;TGLSphere.Slices:Integer
 0048930D    mov         edx,dword ptr [eax+0A8]
 00489313    mov         dword ptr [esi+0A8],edx;TGLSphere.Stacks:Integer
 00489319    mov         dl,byte ptr [eax+0AD]
 0048931F    mov         byte ptr [esi+0AD],dl;TGLSphere.Bottom:TAngleLimit1
 00489325    mov         dl,byte ptr [eax+0AC]
 0048932B    mov         byte ptr [esi+0AC],dl;TGLSphere.Top:TAngleLimit1
 00489331    mov         dx,word ptr [eax+0AE]
 00489338    mov         word ptr [esi+0AE],dx;TGLSphere.Start:TAngleLimit2
 0048933F    mov         ax,word ptr [eax+0B0]
 00489346    mov         word ptr [esi+0B0],ax;TGLSphere.Stop:TAngleLimit2
 0048934D    mov         edx,ebx
 0048934F    mov         eax,esi
 00489351    call        TGLQuadricObject.Assign
 00489356    pop         esi
 00489357    pop         ebx
 00489358    ret
*}
end;

//0048935C
{*procedure sub_0048935C(?:?);
begin
 0048935C    push        ebx
 0048935D    push        esi
 0048935E    mov         ebx,edx
 00489360    mov         esi,eax
 00489362    fld         dword ptr [esi+0A0];TGLSphere.Radius:Single
 00489368    fabs
 0048936A    fstp        dword ptr [ebx]
 0048936C    wait
 0048936D    mov         eax,dword ptr [ebx]
 0048936F    mov         dword ptr [ebx+4],eax
 00489372    mov         eax,dword ptr [ebx]
 00489374    mov         dword ptr [ebx+8],eax
 00489377    xor         eax,eax
 00489379    mov         dword ptr [ebx+0C],eax
 0048937C    pop         esi
 0048937D    pop         ebx
 0048937E    ret
end;*}

Initialization
//004893B0
{*
 004893B0    push        ebp
 004893B1    mov         ebp,esp
 004893B3    add         esp,0FFFFFFE4
 004893B6    sub         dword ptr ds:[5E1530],1
>004893BD    jae         00489404
 004893BF    mov         eax,[0048457C];TGLSphere
 004893C4    mov         dword ptr [ebp-1C],eax
 004893C7    mov         eax,[004841DC];TGLCube
 004893CC    mov         dword ptr [ebp-18],eax
 004893CF    mov         eax,[004832D0];TGLPlane
 004893D4    mov         dword ptr [ebp-14],eax
 004893D7    mov         eax,[00483508];TGLSprite
 004893DC    mov         dword ptr [ebp-10],eax
 004893DF    mov         eax,[004838B4];TGLPoints
 004893E4    mov         dword ptr [ebp-0C],eax
 004893E7    mov         eax,[00483080];TGLDummyCube
 004893EC    mov         dword ptr [ebp-8],eax
 004893EF    mov         eax,[00484018];TGLLines
 004893F4    mov         dword ptr [ebp-4],eax
 004893F7    lea         eax,[ebp-1C]
 004893FA    mov         edx,6
 004893FF    call        RegisterClasses
 00489404    mov         esp,ebp
 00489406    pop         ebp
 00489407    ret
*}
Finalization
end.