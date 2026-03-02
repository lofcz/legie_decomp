//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLScene;

interface

uses
  SysUtils, Classes, , GLMisc, PersistentClasses, GLScene, GLTexture, GLWin32Viewer;

type
  TGLProxyObjectOption = (pooEffects, pooObjects, pooTransformation);
  TGLProxyObjectOptions = set of TGLProxyObjectOption;
  TGLCameraInvarianceMode = (cimNone, cimPosition, cimOrientation);
  TNormalDirection = (ndInside, ndOutside);
  TContextOption = (roDoubleBuffer, roStencilBuffer, roRenderToWindow, roTwoSideLighting, roStereo, roDestinationAlpha, roNoColorBuffer, roNoColorBufferClear, roNoSwapBuffers);
  TContextOptions = set of TContextOption;
  TGLProgressEvent = procedure(Sender:TObject; const deltaTime:Double; const newTime:Double) of object;;
  TGLBaseSceneObject = class(TGLCoordinatesUpdateAbleComponent)
  public
    f30:dword;//f30
    f38:Pointer;//f38
    f3C:byte;//f3C
    f40:TGLListHandle;//f40
    f44:TGLCoordinates;//f44
    f48:TGLCoordinates;//f48
    f4C:TGLCoordinates;//f4C
    f50:TGLCoordinates;//f50
    f54:byte;//f54
    f58:dword;//f58
    f5C:TComponent;//f5C
    f60:TPersistentObjectList;//f60
    f64:byte;//f64
    f68:dword;//f68
    f6C:byte;//f6C
    f70:TGLCoordinates;//f70
    f74:byte;//f74
    f75:byte;//f75
    f76:byte;//f76
    f78:dword;//f78
    f7A:word;//f7A
    f7C:dword;//f7C
    f80:TGLBehaviours;//f80
    f84:TGLObjectEffects;//f84
    TagFloat:Single;//f8C
    destructor Destroy; virtual;//0047B424
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0047B804
    procedure Assign(Source:TPersistent); virtual;//v8//0047C2C4
    procedure Loaded; virtual;//vC//0047B7C8
    procedure SetName(const NewName:TComponentName); virtual;//v18//0047CD50
    constructor Create(AOwner:TComponent); virtual;//v2C//0047B324
    //procedure v30(?:?); virtual;//v30//0047D1EC
    procedure v34; virtual;//v34//0047DACC
    //procedure v38(?:?); virtual;//v38//0047CFB0
    procedure SetVisible(Value:Boolean); virtual;//v3C//0047DC1C
    //function v40:?; virtual;//v40//0047B684
    //function v44(?:?):?; virtual;//v44//0047B5BC
    //procedure v48(?:?); virtual;//v48//0047BDF8
    //procedure v4C(?:?); virtual;//v4C//0047BE58
    //procedure v50(?:?); virtual;//v50//0047BFD0
    //function v54(?:?; ?:?; ?:?; ?:?):?; virtual;//v54//0047C040
    //procedure v58(?:?); virtual;//v58//0047C0D0
    procedure v5C; virtual;//v5C//0047B688
    procedure v60; virtual;//v60//0047B68C
    procedure v64; virtual;//v64//0047B730
    //procedure v68(?:?; ?:?; ?:?); virtual;//v68//0047D754
    //procedure v6C(?:?; ?:?; ?:?); virtual;//v6C//0047D7AC
    procedure sub_0047CEC8; dynamic;//0047CEC8
    //procedure sub_0047CF70(?:?); dynamic;//0047CF70
    //procedure sub_0047D2D8(?:?; ?:?); dynamic;//0047D2D8
    //procedure sub_0047D25C(?:?; ?:?); dynamic;//0047D25C
    procedure sub_0047B788; dynamic;//0047B788
    //procedure sub_0047BAA4(?:?); dynamic;//0047BAA4
    //procedure sub_0047BB1C(?:?); dynamic;//0047BB1C
    //procedure sub_0047BAF8(?:?); dynamic;//0047BAF8
    procedure sub_0047B63C; dynamic;//0047B63C
    procedure HasParent; dynamic;//0047C43C
    procedure GetParentComponent; dynamic;//0047C438
    //procedure sub_00422EDC(?:?); dynamic;//0047CE0C
    //procedure sub_00422EAC(?:?); dynamic;//0047BA34
  end;
  TGLBaseBehaviour = class(TXCollectionItem)
  public
    destructor Destroy; virtual;//0047DD64
    procedure vC; virtual;//vC//0047DD8C
    //procedure v10(?:?); virtual;//v10//0047DDB0
    //procedure v14(?:?); virtual;//v14//0047DDBC
    constructor v18; virtual;//v18//0047DD2C
    procedure v30; virtual;//v30//0047DE34
  end;
  TGLBehaviour = class(TGLBaseBehaviour)
  end;
  TGLBehaviours = class(TXCollection)
  public
    constructor Create; virtual;//vC//0047DE38
    constructor Create; virtual;//v10//0047DF9C
    //function v14(?:?):?; virtual;//v14//0047DFA4
    //procedure GetNamePath(?:?); dynamic;//0047DEEC
  end;
  TGLObjectEffect = class(TGLBaseBehaviour)
  public
    //procedure v10(?:?); virtual;//v10//0047E000
    //procedure v14(?:?); virtual;//v14//0047E00C
    procedure v34; virtual;//v34//0047E084
  end;
  TGLObjectEffects = class(TXCollection)
  public
    constructor Create; virtual;//vC//0047E088
    constructor Create; virtual;//v10//0047E1EC
    //function v14(?:?):?; virtual;//v14//0047E1F4
    //procedure GetNamePath(?:?); dynamic;//0047E13C
  end;
  TGLCustomSceneObject = class(TGLBaseSceneObject)
  public
    f90:TGLMaterial;//f90
    f94:String;//f94
    destructor Destroy; virtual;//0047E374
    procedure Assign(Source:TPersistent); virtual;//v8//0047E3A4
    procedure Loaded; virtual;//vC//0047E3FC
    constructor Create(AOwner:TComponent); virtual;//v2C//0047E328
    procedure v40; virtual;//v40//0047E3F0
    //procedure v68(?:?; ?:?; ?:?); virtual;//v68//0047E448
    procedure sub_0047B63C; dynamic;//0047E430
  end;
  TGLSceneRootObject = class(TGLBaseSceneObject)
  public
    constructor Create(AOwner:TComponent); virtual;//v2C//0047E500
  end;
  TGLImmaterialSceneObject = class(TGLCustomSceneObject)
  public
    //procedure v68(?:?; ?:?; ?:?); virtual;//v68//0047F088
    //procedure SetPitchAngle(Value:Single; ?:?);//0047C790
    //procedure SetRollAngle(Value:Single; ?:?);//0047C9C8
    //procedure SetTurnAngle(Value:Single; ?:?);//0047CBF4
    procedure GetPitchAngle;//0047CCF4
    procedure GetTurnAngle;//0047CD04
    procedure GetRollAngle;//0047CD14
    procedure SetShowAxes(Value:Boolean);//0047CD24
    procedure SetScale(Value:TGLCoordinates);//0047CD3C
    procedure SetPosition(Value:TGLCoordinates);//0047DBB8
    procedure SetDirection(Value:TGLCoordinates);//0047DBCC
    procedure SetUp(Value:TGLCoordinates);//0047DBF4
    procedure SetObjectsSorting(Value:TGLObjectsSorting);//0047DC34
    procedure SetVisibilityCulling(Value:TGLVisibilityCulling);//0047DC4C
    procedure SetBehaviours(Value:TGLBehaviours);//0047DC64
    //function GetBehaviours:?;//0047DC7C
    procedure SetEffects(Value:TGLObjectEffects);//0047DCA4
    //function GetEffects:?;//0047DCBC
  end;
  TGLCameraInvariantObject = class(TGLImmaterialSceneObject)
  public
    f98:byte;//f98
    procedure Assign(Source:TPersistent); virtual;//v8//0047F11C
    constructor Create(AOwner:TComponent); virtual;//v2C//0047F0E0
    //procedure v68(?:?; ?:?; ?:?); virtual;//v68//0047F14C
  end;
  TGLSceneObject = class(TGLCustomSceneObject)
    procedure SetMaterial(Value:TGLMaterial);//0047E414
  end;
  TDirectRenderEvent = procedure(Sender:TObject; var rci:TRenderContextInfo) of object;;
  TGLDirectOpenGL = class(TGLImmaterialSceneObject)
  public
    UseBuildList:Boolean;//f98
    OnRender:TDirectRenderEvent;//fA0
    fA2:word;//fA2
    fA4:dword;//fA4
    Blend:Boolean;//fA8
    procedure Assign(Source:TPersistent); virtual;//v8//0047F35C
    constructor Create(AOwner:TComponent); virtual;//v2C//0047F310
    //function v40:?; virtual;//v40//0047F420
    //procedure v64(?:?); virtual;//v64//0047F3C0
    procedure SetUseBuildList(Value:Boolean);//0047F3E8
    procedure SetBlend(Value:Boolean);//0047F428
  end;
  .71 = array of ?;
//elSize = 8;
  .81 = array of ?;
//elSize = 8;
  TGLRenderPoint = class(TGLImmaterialSceneObject)
  public
    f98:.71;//f98
    f9C:.81;//f9C
    destructor Destroy; virtual;//0047F490
    constructor Create(AOwner:TComponent); virtual;//v2C//0047F448
    //procedure v64(?:?); virtual;//v64//0047F4BC
  end;
  TGLProxyObject = class(TGLBaseSceneObject)
  public
    MasterObject:TGLBaseSceneObject;//f90
    ProxyOptions:TGLProxyObjectOptions;//f94
    f95:byte;//f95
    destructor Destroy; virtual;//0047F5A8
    procedure Assign(Source:TPersistent); virtual;//v8//0047F5D8
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0047F788
    constructor Create(AOwner:TComponent); virtual;//v2C//0047F554
    //procedure v4C(?:?); virtual;//v4C//0047F75C
    //function v54(?:?; ?:?; ?:?; ?:?):?; virtual;//v54//0047F820
    //function v58:?; virtual;//v58//0047F95C
    //procedure v68(?:?; ?:?; ?:?); virtual;//v68//0047F608
    procedure SetMasterObject(Value:TGLBaseSceneObject); virtual;//v70//0047F7B8
    procedure SetProxyOptions(Value:TGLProxyObjectOptions);//0047F7F4
  end;
  TLightStyle = (lsSpot, lsOmni, lsParallel);
  TGLLightSource = class(TGLBaseSceneObject)
  public
    SpotDirection:TGLCoordinates;//f94
    SpotExponent:Single;//f98
    SpotCutOff:Single;//f9C
    ConstAttenuation:Single;//fA0
    LinearAttenuation:Single;//fA4
    QuadraticAttenuation:Single;//fA8
    Shining:Boolean;//fAC
    Ambient:TGLColor;//fB0
    Diffuse:TGLColor;//fB4
    Specular:TGLColor;//fB8
    LightStyle:TLightStyle;//fBC
    destructor Destroy; virtual;//0047FA68
    constructor Create(AOwner:TComponent); virtual;//v2C//0047F974
    //procedure v38(?:?); virtual;//v38//0047FAF8
    //function v44:?; virtual;//v44//0047FB20
    procedure v54; virtual;//v54//0047FAEC
    //function v58:?; virtual;//v58//0047FB1C
    //procedure v68(?:?; ?:?); virtual;//v68//0047FABC
    procedure SetShining(Value:Boolean);//0047FB24
    procedure SetSpotDirection(Value:TGLCoordinates);//0047FB40
    //procedure SetSpotExponent(Value:Single; ?:?);//0047FB70
    //procedure SetSpotCutOff(Value:Single; ?:?);//0047FB98
    procedure SetLightStyle(Value:TLightStyle);//0047FBF8
    procedure SetAmbient(Value:TGLColor);//0047FC14
    procedure SetDiffuse(Value:TGLColor);//0047FC34
    procedure SetSpecular(Value:TGLColor);//0047FC54
    //procedure SetConstAttenuation(Value:Single; ?:?);//0047FC74
    //procedure SetLinearAttenuation(Value:Single; ?:?);//0047FC9C
    //procedure SetQuadraticAttenuation(Value:Single; ?:?);//0047FCC4
  end;
  TGLCameraStyle = (csPerspective, csOrthogonal, csOrtho2D, csCustom, csInfinitePerspective);
  TOnCustomPerspective = procedure(const viewport:TRectangle; width:Integer; height:Integer; DPI:Integer; var viewPortRadius:Single) of object;;
  TGLCamera = class(TGLBaseSceneObject)
  public
    FocalLength:Single;//f90
    DepthOfView:Single;//f94
    NearPlaneBias:Single;//f9C
    TargetObject:TGLBaseSceneObject;//fA4
    CameraStyle:TGLCameraStyle;//fB8
    SceneScale:Single;//fBC
    OnCustomPerspective:TOnCustomPerspective;//fC8
    destructor Destroy; virtual;//0047E654
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0047ED30
    constructor Create(AOwner:TComponent); virtual;//v2C//0047E5C8
    procedure v54; virtual;//v54//0047F07C
    //procedure v68(?:?; ?:?); virtual;//v68//0047F048
    procedure SetTargetObject(Value:TGLBaseSceneObject);//0047ED60
    //procedure SetDepthOfView(Value:Single; ?:?);//0047EE48
    //procedure SetFocalLength(Value:Single; ?:?);//0047EE78
    procedure SetCameraStyle(Value:TGLCameraStyle);//0047EF74
    //procedure SetSceneScale(Value:Single; ?:?);//0047EF90
    function IsStoredSceneScale(Value:Single):Boolean;//0047EFD0
    //procedure SetNearPlaneBias(Value:Single; ?:?);//0047EFEC
    function IsStoredNearPlaneBias(Value:Single):Boolean;//0047F02C
  end;
  TGLScene = class(TGLUpdateAbleComponent)
  public
    f34:TGLSceneRootObject;//f34
    f38:TGLSceneRootObject;//f38
    f40:TPersistentObjectList;//f40
    f44:dword;//f44
    ObjectsSorting:TGLObjectsSorting;//f50
    VisibilityCulling:TGLVisibilityCulling;//f51
    OnProgress:TGLProgressEvent;//f58
    destructor Destroy; virtual;//0047FDB4
    procedure ReadState(Reader:TReader); virtual;//v14//004800D8
    constructor Create(AOwner:TComponent); virtual;//v2C//0047FCEC
    procedure v34; virtual;//v34//004805FC
    //function v38(?:?; ?:?; ?:?):?; virtual;//v38//004805BC
    //procedure sub_00422ED4(?:?; ?:?); dynamic;//0047FFDC
    //procedure sub_00422EAC(?:?; ?:?; ?:?); dynamic;//0047FFA0
    procedure SetObjectsSorting(Value:TGLObjectsSorting);//004800A0
    procedure SetVisibilityCulling(Value:TGLVisibilityCulling);//004800BC
  end;
  TFogMode = (fmLinear, fmExp, fmExp2);
  TFogDistance = (fdDefault, fdEyeRadial, fdEyePlane);
  TGLFogEnvironment = class(TGLUpdateAbleObject)
  public
    f18:TGLSceneBuffer;//f18
    FogColor:TGLColor;//f1C
    FogStart:Single;//f20
    FogEnd:Single;//f24
    FogMode:TFogMode;//f28
    FogDistance:TFogDistance;//f29
    destructor Destroy; virtual;//00480900
    procedure Assign(Source:TPersistent); virtual;//v8//00480994
    constructor Create; virtual;//vC//00480884
    procedure SetFogColor(Value:TGLColor);//00480930
    //procedure SetFogStart(Value:Single; ?:?);//0048094C
    //procedure SetFogEnd(Value:Single; ?:?);//00480970
    procedure SetFogMode(Value:TFogMode);//00480A38
    procedure SetFogDistance(Value:TFogDistance);//00480A48
  end;
  TGLDepthPrecision = (dpDefault, dp16bits, dp24bits, dp32bits);
  TGLColorDepth = (cdDefault, cd8bits, cd16bits, cd24bits, cdFloat64bits, cdFloat128bits);
  TGLShadeModel = (smDefault, smSmooth, smFlat);
  .72 = array of ?;
//elSize = 40;
  TGLSceneBuffer = class(TGLUpdateAbleObject)
  public
    f18:TGLStateCache;//f18
    f1C:byte;//f1C
    f20:dword;//f20
    f24:TPersistentObjectList;//f24
    fA8:.72;//fA8
    FaceCulling:Boolean;//f10C
    FogEnable:Boolean;//f10D
    Lighting:Boolean;//f10E
    DepthTest:Boolean;//f10F
    BackgroundColor:TColor;//f110
    f114:dword;//f114
    AmbientColor:TGLColor;//f118
    AntiAliasing:TGLAntiAliasing;//f11C
    DepthPrecision:TGLDepthPrecision;//f11D
    ColorDepth:TGLColorDepth;//f11E
    ContextOptions:TContextOptions;//f11F
    ShadeModel:TGLShadeModel;//f121
    FogEnvironment:TGLFogEnvironment;//f128
    AccumBufferBits:Integer;//f12C
    f130:dword;//f130
    f134:dword;//f134
    f138:byte;//f138
    f14C:dword;//f14C
    f150:dword;//f150
    f158:dword;//f158
    f15C:dword;//f15C
    OnChange:TNotifyEvent;//f168
    f16C:TGLNonVisualViewer;//f16C
    OnStructuralChange:TNotifyEvent;//f170
    f172:word;//f172
    f174:TGLNonVisualViewer;//f174
    f178:dword;//f178
    f17C:TGLNonVisualViewer;//f17C
    BeforeRender:TNotifyEvent;//f180
    f184:dword;//f184
    f188:dword;//f188
    f18C:TGLSceneViewer;//f18C
    PostRender:TNotifyEvent;//f190
    f194:dword;//f194
    AfterRender:TNotifyEvent;//f198
    f19C:dword;//f19C
    InitiateRendering:TDirectRenderEvent;//f1A0
    WrapUpRendering:TDirectRenderEvent;//f1A8
    destructor Destroy; virtual;//00480CE0
    constructor Create; virtual;//vC//00480BF4
    procedure v10; virtual;//v10//004816C0
    procedure SetBackgroundColor(Value:TColor);//00481CD4
    procedure SetAmbientColor(Value:TGLColor);//00481CEC
    procedure SetContextOptions(Value:TContextOptions);//00481D48
    procedure SetDepthTest(Value:Boolean);//00481D74
    procedure SetFaceCulling(Value:Boolean);//00481D8C
    procedure SetLighting(Value:Boolean);//00481DA4
    procedure SetAntiAliasing(Value:TGLAntiAliasing);//00481DBC
    procedure SetDepthPrecision(Value:TGLDepthPrecision);//00481DD0
    procedure SetColorDepth(Value:TGLColorDepth);//00481DE4
    procedure SetShadeModel(Value:TGLShadeModel);//00481DF8
    procedure SetFogEnable(Value:Boolean);//00481E10
    procedure SetFogEnvironment(Value:TGLFogEnvironment);//00481E28
    procedure IsStoredFogEnvironment(Value:TGLFogEnvironment);//00481E44
    procedure SetAccumBufferBits(Value:Integer);//00481E58
  end;
  TGLNonVisualViewer = class(TComponent)
  public
    Buffer:TGLSceneBuffer;//f30
    Width:Integer;//f34
    Height:Integer;//f38
    destructor Destroy; virtual;//00481F44
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00481F74
    constructor Create(AOwner:TComponent); virtual;//v2C//00481EB0
    procedure v30; virtual;//v30//004820BC
    procedure v34; virtual;//v34//004820C0
    procedure v38; virtual; abstract;//v38//00402BEC
    procedure v3C; virtual;//v3C//00481FA8
    procedure sub_004820B8; dynamic;//004820B8
    //procedure SetBeforeRender(Value:TNotifyEvent; ?:?; ?:?);//00481FEC
    //procedure GetBeforeRender(?:?);//00482008
    //procedure SetPostRender(Value:TNotifyEvent; ?:?; ?:?);//00482020
    //procedure GetPostRender(?:?);//0048203C
    //procedure SetAfterRender(Value:TNotifyEvent; ?:?; ?:?);//00482054
    //procedure GetAfterRender(?:?);//00482070
    procedure SetCamera(Value:TGLCamera);//00482088
    //function GetCamera:?;//00482094
    procedure SetBuffer(Value:TGLSceneBuffer);//004820A0
    procedure SetWidth(Value:Integer);//004820CC
    procedure SetHeight(Value:Integer);//004820E8
  end;
  TGLMemoryViewer = class(TGLNonVisualViewer)
  public
    constructor Create(AOwner:TComponent); virtual;//v2C//00482104
    //procedure v38(?:?); virtual;//v38//00482180
  end;
    //procedure sub_0047B1B4(?:?; ?:?; ?:?);//0047B1B4
    constructor Create(AOwner:TComponent);//0047B324
    destructor Destroy;//0047B424
    //procedure sub_0047B4D8(?:?; ?:?);//0047B4D8
    //function sub_0047B5BC(?:?):?;//0047B5BC
    //function sub_0047B620(?:TGLBaseMesh):?;//0047B620
    procedure sub_0047B63C;//0047B63C
    procedure sub_0047B64C(?:TGLBaseSceneObject);//0047B64C
    //function sub_0047B684:?;//0047B684
    procedure sub_0047B688;//0047B688
    procedure sub_0047B68C;//0047B68C
    procedure sub_0047B730;//0047B730
    procedure sub_0047B734(?:TGLBaseSceneObject);//0047B734
    procedure sub_0047B788;//0047B788
    procedure Loaded;//0047B7C8
    procedure DefineProperties(Filer:TFiler);//0047B804
    //procedure sub_0047BA10(?:?; ?:?; ?:?);//0047BA10
    //procedure sub_00422EAC(?:?);//0047BA34
    //function sub_0047BA74(?:TGLBaseSceneObject; ?:?):?;//0047BA74
    //function sub_0047BA94(?:TGLBaseSceneObject):?;//0047BA94
    //procedure sub_0047BAA4(?:?);//0047BAA4
    //procedure sub_0047BAF8(?:?);//0047BAF8
    //procedure sub_0047BB1C(?:?);//0047BB1C
    procedure sub_0047BB44(?:TPersistent);//0047BB44
    //procedure sub_0047BBC0(?:?; ?:?);//0047BBC0
    //function sub_0047BBE0(?:?):?;//0047BBE0
    //procedure sub_0047BC5C(?:TGLBaseSceneObject; ?:?);//0047BC5C
    //function sub_0047BC7C(?:?):?;//0047BC7C
    //procedure sub_0047BD48(?:TGLPlane; ?:?);//0047BD48
    //procedure sub_0047BD64(?:TGLBaseSceneObject; ?:?);//0047BD64
    //procedure sub_0047BD80(?:TGLBaseSceneObject; ?:?; ?:?);//0047BD80
    //procedure sub_0047BDA0(?:TGLBaseSceneObject; ?:Integer; ?:?);//0047BDA0
    //procedure sub_0047BDC0(?:TGLImmaterialSceneObject; ?:?);//0047BDC0
    //procedure sub_0047BDDC(?:TGLSkyBox; ?:?);//0047BDDC
    //procedure sub_0047BDF8(?:?);//0047BDF8
    //procedure sub_0047BE0C(?:?; ?:?);//0047BE0C
    //procedure sub_0047BE38(?:TGLBaseSceneObject; ?:?);//0047BE38
    //procedure sub_0047BE58(?:?);//0047BE58
    //procedure sub_0047BE74(?:?; ?:?);//0047BE74
    //procedure sub_0047BF08(?:?; ?:?);//0047BF08
    procedure sub_0047BF80(?:TGLBaseSceneObject);//0047BF80
    //function sub_0047BFA8(?:?):?;//0047BFA8
    //procedure sub_0047BFD0(?:?);//0047BFD0
    //function sub_0047C040(?:?; ?:?; ?:?; ?:?):?;//0047C040
    //procedure sub_0047C0D0(?:?);//0047C0D0
    procedure Assign(Source:TPersistent);//0047C2C4
    //function sub_0047C424(?:TGLBaseSceneObject):?;//0047C424
    procedure GetParentComponent;//0047C438
    procedure HasParent;//0047C43C
    //procedure sub_0047C444(?:?; ?:?);//0047C444
    //procedure sub_0047C468(?:?);//0047C468
    //procedure sub_0047C4DC(?:TGLBaseSceneObject; ?:?; ?:?; ?:?);//0047C4DC
    //procedure sub_0047C668(?:?; ?:?);//0047C668
    //procedure sub_0047C898(?:?; ?:?);//0047C898
    //procedure sub_0047CAC8(?:TGLDummyCube; ?:?);//0047CAC8
    procedure SetName(const NewName:TComponentName);//0047CD50
    //function sub_0047CD88(?:?):?;//0047CD88
    //procedure sub_0047CDA0(?:TGLBaseSceneObject; ?:?);//0047CDA0
    //procedure sub_00422EDC(?:?);//0047CE0C
    procedure sub_0047CEC8;//0047CEC8
    procedure sub_0047CEF4(?:TGLBaseSceneObject);//0047CEF4
    procedure sub_0047CF00(?:TGLBaseSceneObject);//0047CF00
    procedure sub_0047CF48(?:TGLBaseSceneObject);//0047CF48
    //procedure sub_0047CF70(?:?);//0047CF70
    //procedure sub_0047CFB0(?:?);//0047CFB0
    //procedure sub_0047D1EC(?:?);//0047D1EC
    //procedure sub_0047D25C(?:?; ?:?);//0047D25C
    //procedure sub_0047D2D8(?:?; ?:?);//0047D2D8
    //function sub_0047D35C(?:?; ?:AnsiString; ?:?):?;//0047D35C
    //procedure sub_0047D3FC(?:?; ?:Byte);//0047D3FC
    //procedure sub_0047D754(?:?; ?:?; ?:?);//0047D754
    //procedure sub_0047D7AC(?:?; ?:?; ?:?);//0047D7AC
    procedure sub_0047DACC;//0047DACC
    //procedure sub_0047DAEC(?:?; ?:?);//0047DAEC
    //function sub_0047DB0C(?:TGLBaseSceneObject):?;//0047DB0C
    //procedure sub_0047DB1C(?:TGLBaseSceneObject; ?:?);//0047DB1C
    procedure SetVisible(Value:Boolean);//0047DC1C
    procedure sub_0047DCE4(?:TGLBaseSceneObject; ?:dword);//0047DCE4
    constructor sub_0047DD2C;//0047DD2C
    destructor Destroy;//0047DD64
    procedure sub_0047DD8C;//0047DD8C
    //procedure sub_0047DDB0(?:?);//0047DDB0
    //procedure sub_0047DDBC(?:?);//0047DDBC
    procedure sub_0047DE34;//0047DE34
    constructor Create;//0047DE38
    //procedure GetNamePath(?:?);//0047DEEC
    constructor Create;//0047DF9C
    //function sub_0047DFA4(?:?):?;//0047DFA4
    //procedure sub_0047DFD4(?:dword; ?:?);//0047DFD4
    //procedure sub_0047E000(?:?);//0047E000
    //procedure sub_0047E00C(?:?);//0047E00C
    procedure sub_0047E084;//0047E084
    constructor Create;//0047E088
    //procedure GetNamePath(?:?);//0047E13C
    constructor Create;//0047E1EC
    //function sub_0047E1F4(?:?):?;//0047E1F4
    //procedure sub_0047E224(?:dword; ?:?);//0047E224
    //procedure sub_0047E250(?:?; ?:?; ?:?);//0047E250
    //procedure sub_0047E2A8(?:?; ?:?; ?:?);//0047E2A8
    constructor Create(AOwner:TComponent);//0047E328
    destructor Destroy;//0047E374
    procedure Assign(Source:TPersistent);//0047E3A4
    procedure sub_0047E3F0;//0047E3F0
    procedure Loaded;//0047E3FC
    procedure sub_0047B63C;//0047E430
    //procedure sub_0047E448(?:?; ?:?; ?:?);//0047E448
    constructor Create(AOwner:TComponent);//0047E500
    constructor Create(AOwner:TComponent);//0047E5C8
    destructor Destroy;//0047E654
    //procedure sub_0047E684(?:?);//0047E684
    //procedure sub_0047E828(?:?; ?:?; ?:?; ?:?; ?:?);//0047E828
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0047ED30
    //procedure sub_0047EDA0(?:?; ?:?);//0047EDA0
    //function sub_0047EEC0(?:?; ?:?):?;//0047EEC0
    //procedure sub_0047EF2C(?:?; ?:?; ?:?);//0047EF2C
    //procedure sub_0047F048(?:?; ?:?);//0047F048
    procedure sub_0047F07C;//0047F07C
    //procedure sub_0047F088(?:?; ?:?; ?:?);//0047F088
    constructor Create(AOwner:TComponent);//0047F0E0
    procedure Assign(Source:TPersistent);//0047F11C
    //procedure sub_0047F14C(?:?; ?:?; ?:?);//0047F14C
    procedure SetCamInvarianceMode(Value:TGLCameraInvarianceMode);//0047F2F4
    constructor Create(AOwner:TComponent);//0047F310
    procedure Assign(Source:TPersistent);//0047F35C
    //procedure sub_0047F3C0(?:?);//0047F3C0
    //function sub_0047F420:?;//0047F420
    constructor Create(AOwner:TComponent);//0047F448
    destructor Destroy;//0047F490
    //procedure sub_0047F4BC(?:?);//0047F4BC
    procedure sub_0047F4F8(?:TGLRenderPoint);//0047F4F8
    constructor Create(AOwner:TComponent);//0047F554
    destructor Destroy;//0047F5A8
    procedure Assign(Source:TPersistent);//0047F5D8
    //procedure sub_0047F608(?:?; ?:?; ?:?);//0047F608
    //procedure sub_0047F75C(?:?);//0047F75C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0047F788
    procedure SetMasterObject(Value:TGLBaseSceneObject);//0047F7B8
    //function sub_0047F820(?:?; ?:?; ?:?; ?:?):?;//0047F820
    //function sub_0047F95C:?;//0047F95C
    constructor Create(AOwner:TComponent);//0047F974
    destructor Destroy;//0047FA68
    //procedure sub_0047FABC(?:?; ?:?);//0047FABC
    procedure sub_0047FAEC;//0047FAEC
    //procedure sub_0047FAF8(?:?);//0047FAF8
    //function sub_0047FB1C:?;//0047FB1C
    //function sub_0047FB20:?;//0047FB20
    constructor Create(AOwner:TComponent);//0047FCEC
    destructor Destroy;//0047FDB4
    //procedure sub_0047FDFC(?:dword; ?:?);//0047FDFC
    procedure sub_0047FE34(?:dword);//0047FE34
    //procedure sub_0047FE54(?:dword; ?:?);//0047FE54
    procedure sub_0047FEA4(?:dword; ?:TGLBaseSceneObject);//0047FEA4
    //procedure sub_0047FEF4(?:?; ?:?);//0047FEF4
    //procedure sub_0047FF5C(?:?);//0047FF5C
    //procedure sub_00422EAC(?:?; ?:?; ?:?);//0047FFA0
    //procedure sub_00422ED4(?:?; ?:?);//0047FFDC
    //function sub_0047FFFC(?:TGLScene):?;//0047FFFC
    procedure sub_00480014(?:TComponent);//00480014
    procedure sub_00480018(?:TComponent);//00480018
    procedure ReadState(Reader:TReader);//004800D8
    //procedure sub_0048013C(?:?);//0048013C
    //procedure sub_00480174(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00480174
    //procedure sub_00480460(?:?; ?:?; ?:?; ?:?; ?:?);//00480460
    //function sub_004804A0(?:TGLScene; ?:AnsiString):?;//004804A0
    //function sub_004804C8(?:TGLSceneRootObject; ?:?):?;//004804C8
    //function sub_004805BC(?:?; ?:?; ?:?):?;//004805BC
    procedure sub_004805FC;//004805FC
    //procedure sub_0048063C(?:?; ?:?);//0048063C
    constructor Create;//00480884
    destructor Destroy;//00480900
    procedure Assign(Source:TPersistent);//00480994
    //function sub_004809E8(?:TGLFogEnvironment):?;//004809E8
    //procedure sub_00480A58(?:?);//00480A58
    constructor Create;//00480BF4
    destructor Destroy;//00480CE0
    //procedure sub_00480D5C(?:?);//00480D5C
    //procedure sub_00480D7C(?:?; ?:?);//00480D7C
    //procedure sub_00480E78(?:TGLSceneBuffer; ?:HDC; ?:?);//00480E78
    procedure sub_00481070(?:TGLSceneBuffer);//00481070
    function sub_004810A4(?:TGLSceneBuffer):Boolean;//004810A4
    procedure sub_004810AC(?:TGLSceneBuffer; ?:Integer; ?:Integer);//004810AC
    //procedure sub_00481138(?:?; ?:?; ?:?; ?:?);//00481138
    //procedure sub_00481170(?:?);//00481170
    //procedure sub_004812F8(?:TGLSceneBuffer; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//004812F8
    //procedure sub_004814E0(?:?; ?:?; ?:?; ?:?; ?:?);//004814E0
    procedure sub_00481508(?:TGLSceneBuffer);//00481508
    procedure sub_00481530(?:TGLSceneBuffer);//00481530
    //procedure sub_00481558(?:?; ?:?);//00481558
    //procedure sub_004815B4(?:?);//004815B4
    //procedure sub_00481678(?:?);//00481678
    procedure sub_004816C0;//004816C0
    //procedure sub_004816C8(?:?; ?:?; ?:?; ?:?);//004816C8
    //procedure sub_00481800(?:?; ?:?; ?:?; ?:?; ?:?);//00481800
    procedure sub_004819A4;//004819A4
    //procedure sub_004819AC(?:TGLSceneBuffer; ?:?);//004819AC
    procedure sub_00481CF8(?:TGLSceneBuffer; ?:TGLCamera);//00481CF8
    //procedure sub_00481E6C(?:?);//00481E6C
    procedure sub_00481E90(?:TGLSceneBuffer);//00481E90
    constructor Create(AOwner:TComponent);//00481EB0
    destructor Destroy;//00481F44
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00481F74
    procedure sub_00481FA8;//00481FA8
    //procedure sub_00481FC0(?:TGLNonVisualViewer; ?:?; ?:?; ?:?; ?:?; ?:?);//00481FC0
    procedure sub_004820AC;//004820AC
    procedure sub_004820B8;//004820B8
    procedure sub_004820BC;//004820BC
    procedure sub_004820C0;//004820C0
    constructor Create(AOwner:TComponent);//00482104
    procedure sub_00482154(?:TGLMemoryViewer);//00482154
    //procedure sub_00482180(?:?);//00482180

implementation

//0047B1B4
{*procedure sub_0047B1B4(?:?; ?:?; ?:?);
begin
 0047B1B4    push        ebp
 0047B1B5    mov         ebp,esp
 0047B1B7    push        ebx
 0047B1B8    push        esi
 0047B1B9    mov         esi,edx
 0047B1BB    mov         ebx,eax
 0047B1BD    push        2044
 0047B1C2    call        OpenGL32.glPushAttrib
 0047B1C7    push        0B50
 0047B1CC    call        OpenGL32.glDisable
 0047B1D1    push        0B24
 0047B1D6    call        OpenGL32.glEnable
 0047B1DB    cmp         byte ptr [ebx+0FB],0
>0047B1E2    jne         0047B1FD
 0047B1E4    push        0BE2
 0047B1E9    call        OpenGL32.glEnable
 0047B1EE    push        303
 0047B1F3    push        302
 0047B1F8    call        OpenGL32.glBlendFunc
 0047B1FD    push        3F800000
 0047B202    call        OpenGL32.glLineWidth
 0047B207    push        esi
 0047B208    push        1
 0047B20A    call        OpenGL32.glLineStipple
 0047B20F    push        1
 0047B211    call        OpenGL32.glBegin
 0047B216    push        0
 0047B218    push        0
 0047B21A    push        3F000000
 0047B21F    call        OpenGL32.glColor3f
 0047B224    push        0
 0047B226    push        0
 0047B228    push        0
 0047B22A    call        OpenGL32.glVertex3f
 0047B22F    push        0
 0047B231    push        0
 0047B233    fld         dword ptr [ebp+8]
 0047B236    fchs
 0047B238    add         esp,0FFFFFFFC
 0047B23B    fstp        dword ptr [esp]
 0047B23E    wait
 0047B23F    call        OpenGL32.glVertex3f
 0047B244    push        0
 0047B246    push        0
 0047B248    push        3F800000
 0047B24D    call        OpenGL32.glColor3f
 0047B252    push        0
 0047B254    push        0
 0047B256    push        0
 0047B258    call        OpenGL32.glVertex3f
 0047B25D    push        0
 0047B25F    push        0
 0047B261    push        dword ptr [ebp+8]
 0047B264    call        OpenGL32.glVertex3f
 0047B269    push        0
 0047B26B    push        3F000000
 0047B270    push        0
 0047B272    call        OpenGL32.glColor3f
 0047B277    push        0
 0047B279    push        0
 0047B27B    push        0
 0047B27D    call        OpenGL32.glVertex3f
 0047B282    push        0
 0047B284    fld         dword ptr [ebp+8]
 0047B287    fchs
 0047B289    add         esp,0FFFFFFFC
 0047B28C    fstp        dword ptr [esp]
 0047B28F    wait
 0047B290    push        0
 0047B292    call        OpenGL32.glVertex3f
 0047B297    push        0
 0047B299    push        3F800000
 0047B29E    push        0
 0047B2A0    call        OpenGL32.glColor3f
 0047B2A5    push        0
 0047B2A7    push        0
 0047B2A9    push        0
 0047B2AB    call        OpenGL32.glVertex3f
 0047B2B0    push        0
 0047B2B2    push        dword ptr [ebp+8]
 0047B2B5    push        0
 0047B2B7    call        OpenGL32.glVertex3f
 0047B2BC    push        3F000000
 0047B2C1    push        0
 0047B2C3    push        0
 0047B2C5    call        OpenGL32.glColor3f
 0047B2CA    push        0
 0047B2CC    push        0
 0047B2CE    push        0
 0047B2D0    call        OpenGL32.glVertex3f
 0047B2D5    fld         dword ptr [ebp+8]
 0047B2D8    fchs
 0047B2DA    add         esp,0FFFFFFFC
 0047B2DD    fstp        dword ptr [esp]
 0047B2E0    wait
 0047B2E1    push        0
 0047B2E3    push        0
 0047B2E5    call        OpenGL32.glVertex3f
 0047B2EA    push        3F800000
 0047B2EF    push        0
 0047B2F1    push        0
 0047B2F3    call        OpenGL32.glColor3f
 0047B2F8    push        0
 0047B2FA    push        0
 0047B2FC    push        0
 0047B2FE    call        OpenGL32.glVertex3f
 0047B303    push        dword ptr [ebp+8]
 0047B306    push        0
 0047B308    push        0
 0047B30A    call        OpenGL32.glVertex3f
 0047B30F    call        OpenGL32.glEnd
 0047B314    call        OpenGL32.glPopAttrib
 0047B319    wait
 0047B31A    fnclex
 0047B31C    pop         esi
 0047B31D    pop         ebx
 0047B31E    pop         ebp
 0047B31F    ret         4
end;*}

//0047B324
constructor TGLBaseSceneObject.Create(AOwner:TComponent);
begin
{*
 0047B324    push        ebp
 0047B325    mov         ebp,esp
 0047B327    push        ecx
 0047B328    push        ebx
 0047B329    push        esi
 0047B32A    push        edi
 0047B32B    test        dl,dl
>0047B32D    je          0047B337
 0047B32F    add         esp,0FFFFFFF0
 0047B332    call        @ClassCreate
 0047B337    mov         byte ptr [ebp-1],dl
 0047B33A    mov         ebx,eax
 0047B33C    xor         edx,edx
 0047B33E    mov         eax,ebx
 0047B340    call        TComponent.Create
 0047B345    mov         al,[0047B41C];0x0 gvar_0047B41C
 0047B34A    mov         byte ptr [ebx+3C],al;TGLBaseSceneObject.?f3C:byte
 0047B34D    mov         al,[0047B420];0xF gvar_0047B420
 0047B352    mov         byte ptr [ebx+54],al;TGLBaseSceneObject.?f54:byte
 0047B355    mov         eax,[005AE680];^gvar_005ACFA4
 0047B35A    push        eax
 0047B35B    push        0
 0047B35D    mov         ecx,ebx
 0047B35F    mov         dl,1
 0047B361    mov         eax,[0046AF7C];TGLCoordinates
 0047B366    call        TGLCoordinates.Create;TGLCoordinates.Create
 0047B36B    mov         dword ptr [ebx+44],eax;TGLBaseSceneObject.?f44:TGLCoordinates
 0047B36E    mov         eax,[005AE1F8];^gvar_005ACF84
 0047B373    push        eax
 0047B374    push        1
 0047B376    mov         ecx,ebx
 0047B378    mov         dl,1
 0047B37A    mov         eax,[0046AF7C];TGLCoordinates
 0047B37F    call        TGLCoordinates.Create;TGLCoordinates.Create
 0047B384    mov         dword ptr [ebx+70],eax;TGLBaseSceneObject.?f70:TGLCoordinates
 0047B387    mov         eax,[005AE214];^gvar_005ACF44
 0047B38C    push        eax
 0047B38D    push        1
 0047B38F    mov         ecx,ebx
 0047B391    mov         dl,1
 0047B393    mov         eax,[0046AF7C];TGLCoordinates
 0047B398    call        TGLCoordinates.Create;TGLCoordinates.Create
 0047B39D    mov         dword ptr [ebx+48],eax;TGLBaseSceneObject.?f48:TGLCoordinates
 0047B3A0    mov         eax,[005AE320];^gvar_005ACF34
 0047B3A5    push        eax
 0047B3A6    push        1
 0047B3A8    mov         ecx,ebx
 0047B3AA    mov         dl,1
 0047B3AC    mov         eax,[0046AF7C];TGLCoordinates
 0047B3B1    call        TGLCoordinates.Create;TGLCoordinates.Create
 0047B3B6    mov         dword ptr [ebx+4C],eax;TGLBaseSceneObject.?f4C:TGLCoordinates
 0047B3B9    mov         eax,[005AE630];^gvar_005ACF64
 0047B3BE    push        eax
 0047B3BF    push        1
 0047B3C1    mov         ecx,ebx
 0047B3C3    mov         dl,1
 0047B3C5    mov         eax,[0046AF7C];TGLCoordinates
 0047B3CA    call        TGLCoordinates.Create;TGLCoordinates.Create
 0047B3CF    mov         dword ptr [ebx+50],eax;TGLBaseSceneObject.?f50:TGLCoordinates
 0047B3D2    mov         eax,40
 0047B3D7    call        @GetMem
 0047B3DC    mov         esi,eax
 0047B3DE    mov         dword ptr [ebx+38],esi;TGLBaseSceneObject.?f38:Pointer
 0047B3E1    mov         eax,[005AE67C];^gvar_005ACFB4
 0047B3E6    mov         edi,esi
 0047B3E8    mov         esi,eax
 0047B3EA    mov         ecx,10
 0047B3EF    rep movs    dword ptr [edi],dword ptr [esi]
 0047B3F1    mov         byte ptr [ebx+64],1;TGLBaseSceneObject.?f64:byte
 0047B3F5    mov         byte ptr [ebx+75],0;TGLBaseSceneObject.?f75:byte
 0047B3F9    mov         byte ptr [ebx+76],0;TGLBaseSceneObject.?f76:byte
 0047B3FD    mov         eax,ebx
 0047B3FF    cmp         byte ptr [ebp-1],0
>0047B403    je          0047B414
 0047B405    call        @AfterConstruction
 0047B40A    pop         dword ptr fs:[0]
 0047B411    add         esp,0C
 0047B414    mov         eax,ebx
 0047B416    pop         edi
 0047B417    pop         esi
 0047B418    pop         ebx
 0047B419    pop         ecx
 0047B41A    pop         ebp
 0047B41B    ret
*}
end;

//0047B424
destructor TGLBaseSceneObject.Destroy;
begin
{*
 0047B424    push        ebx
 0047B425    push        esi
 0047B426    push        edi
 0047B427    call        @BeforeDestruction
 0047B42C    mov         ebx,edx
 0047B42E    mov         edi,eax
 0047B430    mov         eax,edi
 0047B432    call        0047B734
 0047B437    mov         eax,dword ptr [edi+38];TGLBaseSceneObject.?f38:Pointer
 0047B43A    call        @FreeMem
 0047B43F    mov         eax,dword ptr [edi+30];TGLBaseSceneObject.?f30:dword
 0047B442    call        @FreeMem
 0047B447    mov         eax,dword ptr [edi+84];TGLBaseSceneObject.?f84:TGLObjectEffects
 0047B44D    call        TObject.Free
 0047B452    mov         eax,dword ptr [edi+80];TGLBaseSceneObject.?f80:TGLBehaviours
 0047B458    call        TObject.Free
 0047B45D    mov         eax,dword ptr [edi+40];TGLBaseSceneObject.?f40:TGLListHandle
 0047B460    call        TObject.Free
 0047B465    mov         eax,dword ptr [edi+44];TGLBaseSceneObject.?f44:TGLCoordinates
 0047B468    call        TObject.Free
 0047B46D    mov         eax,dword ptr [edi+70];TGLBaseSceneObject.?f70:TGLCoordinates
 0047B470    call        TObject.Free
 0047B475    mov         eax,dword ptr [edi+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047B478    call        TObject.Free
 0047B47D    mov         eax,dword ptr [edi+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047B480    call        TObject.Free
 0047B485    mov         eax,dword ptr [edi+50];TGLBaseSceneObject.?f50:TGLCoordinates
 0047B488    call        TObject.Free
 0047B48D    mov         eax,dword ptr [edi+58];TGLBaseSceneObject.?f58:dword
 0047B490    test        eax,eax
>0047B492    je          0047B4A1
 0047B494    xor         ecx,ecx
 0047B496    mov         edx,edi
 0047B498    mov         si,0FFE9
 0047B49C    call        @CallDynaInst
 0047B4A1    cmp         dword ptr [edi+60],0;TGLBaseSceneObject.?f60:TPersistentObjectList
>0047B4A5    je          0047B4BA
 0047B4A7    mov         eax,edi
 0047B4A9    mov         si,0FFEB
 0047B4AD    call        @CallDynaInst;TGLBaseSceneObject.sub_0047B788
 0047B4B2    mov         eax,dword ptr [edi+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047B4B5    call        TObject.Free
 0047B4BA    mov         edx,ebx
 0047B4BC    and         dl,0FC
 0047B4BF    mov         eax,edi
 0047B4C1    call        TComponent.Destroy
 0047B4C6    test        bl,bl
>0047B4C8    jle         0047B4D1
 0047B4CA    mov         eax,edi
 0047B4CC    call        @ClassDestroy
 0047B4D1    pop         edi
 0047B4D2    pop         esi
 0047B4D3    pop         ebx
 0047B4D4    ret
*}
end;

//0047B4D8
{*procedure sub_0047B4D8(?:?; ?:?);
begin
 0047B4D8    push        ebp
 0047B4D9    mov         ebp,esp
 0047B4DB    push        ebx
 0047B4DC    mov         ebx,eax
 0047B4DE    mov         eax,dword ptr [ebp+8]
 0047B4E1    mov         eax,dword ptr [eax-4]
 0047B4E4    mov         eax,dword ptr [eax+40]
 0047B4E7    cmp         dword ptr [eax+8],0
>0047B4EB    jne         0047B518
 0047B4ED    mov         edx,dword ptr [ebp+8]
 0047B4F0    call        0046CEE8
 0047B4F5    mov         eax,dword ptr [ebp+8]
 0047B4F8    mov         eax,dword ptr [eax-4]
 0047B4FB    mov         eax,dword ptr [eax+40]
 0047B4FE    cmp         dword ptr [eax+8],0
>0047B502    jne         0047B518
 0047B504    mov         ecx,99A
 0047B509    mov         edx,47B570;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047B50E    mov         eax,47B5A8;'Assertion failure'
 0047B513    call        @Assert
 0047B518    push        1300
 0047B51D    mov         eax,dword ptr [ebp+8]
 0047B520    mov         eax,dword ptr [eax-4]
 0047B523    mov         eax,dword ptr [eax+40]
 0047B526    mov         eax,dword ptr [eax+8]
 0047B529    push        eax
 0047B52A    call        OpenGL32.glNewList
 0047B52F    xor         eax,eax
 0047B531    push        ebp
 0047B532    push        47B55D
 0047B537    push        dword ptr fs:[eax]
 0047B53A    mov         dword ptr fs:[eax],esp
 0047B53D    mov         edx,ebx
 0047B53F    mov         eax,dword ptr [ebp+8]
 0047B542    mov         eax,dword ptr [eax-4]
 0047B545    mov         ecx,dword ptr [eax]
 0047B547    call        dword ptr [ecx+64]
 0047B54A    xor         eax,eax
 0047B54C    pop         edx
 0047B54D    pop         ecx
 0047B54E    pop         ecx
 0047B54F    mov         dword ptr fs:[eax],edx
 0047B552    push        47B564
 0047B557    call        OpenGL32.glEndList
 0047B55C    ret
>0047B55D    jmp         @HandleFinally
>0047B562    jmp         0047B557
 0047B564    pop         ebx
 0047B565    pop         ebp
 0047B566    ret
end;*}

//0047B5BC
{*function sub_0047B5BC(?:?):?;
begin
 0047B5BC    push        ebp
 0047B5BD    mov         ebp,esp
 0047B5BF    push        ecx
 0047B5C0    push        ebx
 0047B5C1    mov         ebx,edx
 0047B5C3    mov         dword ptr [ebp-4],eax
 0047B5C6    mov         eax,dword ptr [ebp-4]
 0047B5C9    mov         eax,dword ptr [eax+40];TGLBaseSceneObject.?f40:TGLListHandle
 0047B5CC    test        eax,eax
>0047B5CE    je          0047B5D5
 0047B5D0    mov         eax,dword ptr [eax+8]
>0047B5D3    jmp         0047B5D7
 0047B5D5    xor         eax,eax
 0047B5D7    test        eax,eax
>0047B5D9    je          0047B5E4
 0047B5DB    mov         edx,dword ptr [ebp-4]
 0047B5DE    test        byte ptr [edx+54],8;TGLBaseSceneObject.?f54:byte
>0047B5E2    je          0047B619
 0047B5E4    mov         eax,dword ptr [ebp-4]
 0047B5E7    call        0047CEF4
 0047B5EC    mov         eax,dword ptr [ebp-4]
 0047B5EF    cmp         dword ptr [eax+40],0;TGLBaseSceneObject.?f40:TGLListHandle
>0047B5F3    jne         0047B607
 0047B5F5    mov         dl,1
 0047B5F7    mov         eax,[0046C0B0];TGLListHandle
 0047B5FC    call        TGLVirtualHandle.Create;TGLListHandle.Create
 0047B601    mov         edx,dword ptr [ebp-4]
 0047B604    mov         dword ptr [edx+40],eax;TGLBaseSceneObject.?f40:TGLListHandle
 0047B607    push        ebp
 0047B608    mov         eax,ebx
 0047B60A    call        0047B4D8
 0047B60F    pop         ecx
 0047B610    mov         eax,dword ptr [ebp-4]
 0047B613    mov         eax,dword ptr [eax+40];TGLBaseSceneObject.?f40:TGLListHandle
 0047B616    mov         eax,dword ptr [eax+8];TGLListHandle.?f8:dword
 0047B619    pop         ebx
 0047B61A    pop         ecx
 0047B61B    pop         ebp
 0047B61C    ret
end;*}

//0047B620
{*function sub_0047B620(?:TGLBaseMesh):?;
begin
 0047B620    mov         edx,dword ptr [eax+40]
 0047B623    test        edx,edx
>0047B625    je          0047B633
 0047B627    cmp         dword ptr [edx+8],0
>0047B62B    je          0047B633
 0047B62D    test        byte ptr [eax+54],8
>0047B631    je          0047B636
 0047B633    xor         eax,eax
 0047B635    ret
 0047B636    mov         al,1
 0047B638    ret
end;*}

//0047B63C
procedure TGLBaseSceneObject.sub_0047B63C;
begin
{*
 0047B63C    mov         edx,dword ptr [eax+40];TGLBaseSceneObject.?f40:TGLListHandle
 0047B63F    test        edx,edx
>0047B641    je          0047B64A
 0047B643    mov         eax,edx
 0047B645    call        0046CFA8
 0047B64A    ret
*}
end;

//0047B64C
procedure sub_0047B64C(?:TGLBaseSceneObject);
begin
{*
 0047B64C    push        ebx
 0047B64D    push        esi
 0047B64E    push        edi
 0047B64F    mov         edi,eax
 0047B651    mov         eax,edi
 0047B653    call        0047BA94
 0047B658    mov         ebx,eax
 0047B65A    dec         ebx
 0047B65B    test        ebx,ebx
>0047B65D    jl          0047B674
 0047B65F    inc         ebx
 0047B660    xor         esi,esi
 0047B662    mov         edx,esi
 0047B664    mov         eax,edi
 0047B666    call        0047BA74
 0047B66B    call        0047B64C
 0047B670    inc         esi
 0047B671    dec         ebx
>0047B672    jne         0047B662
 0047B674    mov         eax,edi
 0047B676    mov         si,0FFEF
 0047B67A    call        @CallDynaInst
 0047B67F    pop         edi
 0047B680    pop         esi
 0047B681    pop         ebx
 0047B682    ret
*}
end;

//0047B684
{*function sub_0047B684:?;
begin
 0047B684    xor         eax,eax
 0047B686    ret
end;*}

//0047B688
procedure sub_0047B688;
begin
{*
 0047B688    inc         dword ptr [eax+68];TGLBaseSceneObject.?f68:dword
 0047B68B    ret
*}
end;

//0047B68C
procedure sub_0047B68C;
begin
{*
 0047B68C    push        ebp
 0047B68D    mov         ebp,esp
 0047B68F    push        0
 0047B691    xor         edx,edx
 0047B693    push        ebp
 0047B694    push        47B6EC
 0047B699    push        dword ptr fs:[edx]
 0047B69C    mov         dword ptr fs:[edx],esp
 0047B69F    cmp         dword ptr [eax+68],0;TGLBaseSceneObject.?f68:dword
>0047B6A3    jle         0047B6B7
 0047B6A5    dec         dword ptr [eax+68];TGLBaseSceneObject.?f68:dword
 0047B6A8    cmp         dword ptr [eax+68],0;TGLBaseSceneObject.?f68:dword
>0047B6AC    jne         0047B6D6
 0047B6AE    mov         edx,eax
 0047B6B0    mov         ecx,dword ptr [eax]
 0047B6B2    call        dword ptr [ecx+34];TGLBaseSceneObject.sub_0047DACC
>0047B6B5    jmp         0047B6D6
 0047B6B7    lea         edx,[ebp-4]
 0047B6BA    mov         eax,[005AE4EC];^SResString17:TResStringRec
 0047B6BF    call        LoadStr
 0047B6C4    mov         eax,dword ptr [ebp-4]
 0047B6C7    mov         ecx,9E2
 0047B6CC    mov         edx,47B700;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047B6D1    call        @Assert
 0047B6D6    xor         eax,eax
 0047B6D8    pop         edx
 0047B6D9    pop         ecx
 0047B6DA    pop         ecx
 0047B6DB    mov         dword ptr fs:[eax],edx
 0047B6DE    push        47B6F3
 0047B6E3    lea         eax,[ebp-4]
 0047B6E6    call        @LStrClr
 0047B6EB    ret
>0047B6EC    jmp         @HandleFinally
>0047B6F1    jmp         0047B6E3
 0047B6F3    pop         ecx
 0047B6F4    pop         ebp
 0047B6F5    ret
*}
end;

//0047B730
procedure sub_0047B730;
begin
{*
 0047B730    ret
*}
end;

//0047B734
procedure sub_0047B734(?:TGLBaseSceneObject);
begin
{*
 0047B734    push        ebx
 0047B735    push        esi
 0047B736    push        edi
 0047B737    push        ebp
 0047B738    mov         edi,eax
 0047B73A    xor         ebp,ebp
 0047B73C    cmp         dword ptr [edi+60],0;TGLBaseSceneObject.?f60:TPersistentObjectList
>0047B740    je          0047B783
>0047B742    jmp         0047B77B
 0047B744    mov         eax,dword ptr [eax+8];TGLBaseSceneObject.Name:TComponentName
 0047B747    mov         ebx,dword ptr [eax+ebp*4]
 0047B74A    mov         eax,ebx
 0047B74C    call        0047B734
 0047B751    mov         eax,ebx
 0047B753    mov         edx,dword ptr ds:[47A4A4];TGLCamera
 0047B759    call        @IsClass
 0047B75E    test        al,al
>0047B760    je          0047B77A
 0047B762    mov         cl,1
 0047B764    mov         edx,ebx
 0047B766    mov         eax,edi
 0047B768    mov         si,0FFE9
 0047B76C    call        @CallDynaInst;TGLBaseSceneObject.sub_0047D2D8
 0047B771    mov         eax,ebx
 0047B773    call        TObject.Free
>0047B778    jmp         0047B77B
 0047B77A    inc         ebp
 0047B77B    mov         eax,dword ptr [edi+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047B77E    cmp         ebp,dword ptr [eax+0C]
>0047B781    jl          0047B744
 0047B783    pop         ebp
 0047B784    pop         edi
 0047B785    pop         esi
 0047B786    pop         ebx
 0047B787    ret
*}
end;

//0047B788
procedure TGLBaseSceneObject.sub_0047B788;
begin
{*
 0047B788    push        ebx
 0047B789    push        esi
 0047B78A    mov         ebx,eax
 0047B78C    mov         eax,ebx
 0047B78E    call        0047B734
 0047B793    mov         eax,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047B796    test        eax,eax
>0047B798    je          0047B7A1
 0047B79A    mov         edx,ebx
 0047B79C    call        0047FEA4
 0047B7A1    cmp         dword ptr [ebx+60],0;TGLBaseSceneObject.?f60:TPersistentObjectList
>0047B7A5    je          0047B7C3
>0047B7A7    jmp         0047B7BA
 0047B7A9    mov         eax,esi
 0047B7AB    call        004673A4
 0047B7B0    xor         edx,edx
 0047B7B2    mov         dword ptr [eax+58],edx
 0047B7B5    call        TObject.Free
 0047B7BA    mov         esi,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047B7BD    cmp         dword ptr [esi+0C],0
>0047B7C1    jg          0047B7A9
 0047B7C3    pop         esi
 0047B7C4    pop         ebx
 0047B7C5    ret
*}
end;

//0047B7C8
procedure TGLBaseSceneObject.Loaded;
begin
{*
 0047B7C8    push        ebx
 0047B7C9    mov         ebx,eax
 0047B7CB    mov         eax,ebx
 0047B7CD    call        TComponent.Loaded
 0047B7D2    push        3F800000
 0047B7D7    mov         edx,3
 0047B7DC    mov         eax,dword ptr [ebx+44];TGLBaseSceneObject.?f44:TGLCoordinates
 0047B7DF    call        TGLCoordinates.SetX
 0047B7E4    mov         eax,dword ptr [ebx+80];TGLBaseSceneObject.?f80:TGLBehaviours
 0047B7EA    test        eax,eax
>0047B7EC    je          0047B7F3
 0047B7EE    call        0046E1B0
 0047B7F3    mov         eax,dword ptr [ebx+84];TGLBaseSceneObject.?f84:TGLObjectEffects
 0047B7F9    test        eax,eax
>0047B7FB    je          0047B802
 0047B7FD    call        0046E1B0
 0047B802    pop         ebx
 0047B803    ret
*}
end;

//0047B804
procedure TGLBaseSceneObject.DefineProperties(Filer:TFiler);
begin
{*
 0047B804    push        ebx
 0047B805    push        esi
 0047B806    push        edi
 0047B807    mov         esi,edx
 0047B809    mov         ebx,eax
 0047B80B    mov         edx,esi
 0047B80D    mov         eax,ebx
 0047B80F    call        TComponent.DefineProperties
 0047B814    push        ebx
 0047B815    push        47B8FC
 0047B81A    push        ebx
 0047B81B    push        47B8A0
 0047B820    mov         eax,dword ptr [ebx+80];TGLBaseSceneObject.?f80:TGLBehaviours
 0047B826    test        eax,eax
>0047B828    je          0047B830
 0047B82A    cmp         dword ptr [eax+0C],0
>0047B82E    jg          0047B834
 0047B830    xor         ecx,ecx
>0047B832    jmp         0047B836
 0047B834    mov         cl,1
 0047B836    mov         edx,47B87C;'BehavioursData'
 0047B83B    mov         eax,esi
 0047B83D    mov         edi,dword ptr [eax]
 0047B83F    call        dword ptr [edi+8];TFiler.DefineBinaryProperty
 0047B842    push        ebx
 0047B843    push        47B9B4
 0047B848    push        ebx
 0047B849    push        47B958
 0047B84E    mov         eax,dword ptr [ebx+84];TGLBaseSceneObject.?f84:TGLObjectEffects
 0047B854    test        eax,eax
>0047B856    je          0047B85E
 0047B858    cmp         dword ptr [eax+0C],0
>0047B85C    jg          0047B862
 0047B85E    xor         ecx,ecx
>0047B860    jmp         0047B864
 0047B862    mov         cl,1
 0047B864    mov         edx,47B894;'EffectsData'
 0047B869    mov         eax,esi
 0047B86B    mov         ebx,dword ptr [eax]
 0047B86D    call        dword ptr [ebx+8];TFiler.DefineBinaryProperty
 0047B870    pop         edi
 0047B871    pop         esi
 0047B872    pop         ebx
 0047B873    ret
*}
end;

//0047BA10
{*procedure sub_0047BA10(?:?; ?:?; ?:?);
begin
 0047BA10    push        ebx
 0047BA11    push        esi
 0047BA12    mov         esi,eax
 0047BA14    mov         eax,dword ptr [esi+5C]
 0047BA17    mov         eax,dword ptr [eax+4C]
 0047BA1A    mov         eax,dword ptr [eax+130]
 0047BA20    push        dword ptr [eax+94]
 0047BA26    mov         eax,edx
 0047BA28    mov         edx,ecx
 0047BA2A    call        0047B1B4
 0047BA2F    pop         esi
 0047BA30    pop         ebx
 0047BA31    ret
end;*}

//0047BA34
{*procedure TGLBaseSceneObject.sub_00422EAC(?:?);
begin
 0047BA34    push        ebp
 0047BA35    mov         ebp,esp
 0047BA37    push        ecx
 0047BA38    push        ebx
 0047BA39    push        esi
 0047BA3A    mov         esi,eax
 0047BA3C    mov         eax,dword ptr [esi+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047BA3F    test        eax,eax
>0047BA41    je          0047BA6B
 0047BA43    mov         ebx,dword ptr [eax+0C]
 0047BA46    dec         ebx
 0047BA47    test        ebx,ebx
>0047BA49    jl          0047BA6B
 0047BA4B    inc         ebx
 0047BA4C    mov         dword ptr [ebp-4],0
 0047BA53    mov         eax,dword ptr [esi+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047BA56    mov         eax,dword ptr [eax+8]
 0047BA59    mov         edx,dword ptr [ebp-4]
 0047BA5C    mov         edx,dword ptr [eax+edx*4]
 0047BA5F    mov         eax,dword ptr [ebp+0C]
 0047BA62    call        dword ptr [ebp+8]
 0047BA65    inc         dword ptr [ebp-4]
 0047BA68    dec         ebx
>0047BA69    jne         0047BA53
 0047BA6B    pop         esi
 0047BA6C    pop         ebx
 0047BA6D    pop         ecx
 0047BA6E    pop         ebp
 0047BA6F    ret         8
end;*}

//0047BA74
{*function sub_0047BA74(?:TGLBaseSceneObject; ?:?):?;
begin
 0047BA74    push        ebx
 0047BA75    push        esi
 0047BA76    push        edi
 0047BA77    mov         edi,edx
 0047BA79    mov         ebx,eax
 0047BA7B    mov         esi,dword ptr [ebx+60]
 0047BA7E    test        esi,esi
>0047BA80    je          0047BA8D
 0047BA82    mov         edx,edi
 0047BA84    mov         eax,esi
 0047BA86    call        00466EF0
>0047BA8B    jmp         0047BA8F
 0047BA8D    xor         eax,eax
 0047BA8F    pop         edi
 0047BA90    pop         esi
 0047BA91    pop         ebx
 0047BA92    ret
end;*}

//0047BA94
{*function sub_0047BA94(?:TGLBaseSceneObject):?;
begin
 0047BA94    mov         edx,dword ptr [eax+60]
 0047BA97    test        edx,edx
>0047BA99    je          0047BA9F
 0047BA9B    mov         eax,dword ptr [edx+0C]
 0047BA9E    ret
 0047BA9F    xor         eax,eax
 0047BAA1    ret
end;*}

//0047BAA4
{*procedure TGLBaseSceneObject.sub_0047BAA4(?:?);
begin
 0047BAA4    push        ebx
 0047BAA5    push        esi
 0047BAA6    mov         esi,edx
 0047BAA8    mov         ebx,eax
 0047BAAA    mov         eax,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047BAAD    test        eax,eax
>0047BAAF    je          0047BAB8
 0047BAB1    mov         edx,esi
 0047BAB3    call        0047FE54
 0047BAB8    cmp         dword ptr [ebx+60],0;TGLBaseSceneObject.?f60:TPersistentObjectList
>0047BABC    jne         0047BACD
 0047BABE    mov         dl,1
 0047BAC0    mov         eax,[00466194];TPersistentObjectList
 0047BAC5    call        TPersistentObjectList.Create;TPersistentObjectList.Create
 0047BACA    mov         dword ptr [ebx+60],eax;TGLBaseSceneObject.?f60:TPersistentObjectList
 0047BACD    mov         edx,esi
 0047BACF    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047BAD2    call        00466E24
 0047BAD7    mov         dword ptr [esi+58],ebx
 0047BADA    mov         edx,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047BADD    mov         eax,esi
 0047BADF    call        0047DCE4
 0047BAE4    mov         eax,ebx
 0047BAE6    call        0047CF48
 0047BAEB    mov         eax,esi
 0047BAED    call        0047CF48
 0047BAF2    pop         esi
 0047BAF3    pop         ebx
 0047BAF4    ret
end;*}

//0047BAF8
{*procedure TGLBaseSceneObject.sub_0047BAF8(?:?);
begin
 0047BAF8    push        ebx
 0047BAF9    push        esi
 0047BAFA    push        edi
 0047BAFB    mov         ebx,eax
 0047BAFD    mov         ecx,dword ptr [ebx+4];TGLBaseSceneObject.FOwner:TComponent
 0047BB00    mov         eax,edx
 0047BB02    mov         dl,1
 0047BB04    call        dword ptr [eax+2C]
 0047BB07    mov         edi,eax
 0047BB09    mov         edx,edi
 0047BB0B    mov         eax,ebx
 0047BB0D    mov         si,0FFEC
 0047BB11    call        @CallDynaInst;TGLBaseSceneObject.sub_0047BAA4
 0047BB16    mov         eax,edi
 0047BB18    pop         edi
 0047BB19    pop         esi
 0047BB1A    pop         ebx
 0047BB1B    ret
end;*}

//0047BB1C
{*procedure TGLBaseSceneObject.sub_0047BB1C(?:?);
begin
 0047BB1C    push        ebx
 0047BB1D    push        esi
 0047BB1E    push        edi
 0047BB1F    mov         ebx,eax
 0047BB21    mov         ecx,dword ptr [ebx+4];TGLBaseSceneObject.FOwner:TComponent
 0047BB24    mov         eax,edx
 0047BB26    mov         dl,1
 0047BB28    call        dword ptr [eax+2C]
 0047BB2B    mov         edi,eax
 0047BB2D    mov         ecx,edi
 0047BB2F    xor         edx,edx
 0047BB31    mov         eax,ebx
 0047BB33    mov         si,0FFEA
 0047BB37    call        @CallDynaInst;TGLBaseSceneObject.sub_0047D25C
 0047BB3C    mov         eax,edi
 0047BB3E    pop         edi
 0047BB3F    pop         esi
 0047BB40    pop         ebx
 0047BB41    ret
end;*}

//0047BB44
procedure sub_0047BB44(?:TPersistent);
begin
{*
 0047BB44    push        ebx
 0047BB45    add         esp,0FFFFFFF0
 0047BB48    mov         ebx,eax
 0047BB4A    test        byte ptr [ebx+54],1
>0047BB4E    je          0047BBB8
 0047BB50    mov         eax,dword ptr [ebx+50]
 0047BB53    push        dword ptr [eax+18]
 0047BB56    lea         edx,[esp+4]
 0047BB5A    mov         eax,ebx
 0047BB5C    call        0047BDDC
 0047BB61    lea         eax,[esp+4]
 0047BB65    mov         edx,dword ptr [ebx+38]
 0047BB68    call        0045D844
 0047BB6D    mov         eax,dword ptr [ebx+50]
 0047BB70    push        dword ptr [eax+1C]
 0047BB73    mov         eax,dword ptr [ebx+38]
 0047BB76    lea         edx,[eax+10]
 0047BB79    mov         eax,dword ptr [ebx+4C]
 0047BB7C    add         eax,18
 0047BB7F    call        0045D844
 0047BB84    mov         eax,dword ptr [ebx+50]
 0047BB87    push        dword ptr [eax+20]
 0047BB8A    mov         eax,dword ptr [ebx+38]
 0047BB8D    lea         edx,[eax+20]
 0047BB90    mov         eax,dword ptr [ebx+48]
 0047BB93    add         eax,18
 0047BB96    call        0045D844
 0047BB9B    mov         eax,dword ptr [ebx+44]
 0047BB9E    lea         edx,[eax+18]
 0047BBA1    mov         eax,dword ptr [ebx+38]
 0047BBA4    add         eax,30
 0047BBA7    call        0045C9C0
 0047BBAC    and         byte ptr [ebx+54],0FE
 0047BBB0    or          byte ptr [ebx+54],2
 0047BBB4    or          byte ptr [ebx+54],4
 0047BBB8    add         esp,10
 0047BBBB    pop         ebx
 0047BBBC    ret
*}
end;

//0047BBC0
{*procedure sub_0047BBC0(?:?; ?:?);
begin
 0047BBC0    push        ebx
 0047BBC1    push        esi
 0047BBC2    push        edi
 0047BBC3    mov         esi,edx
 0047BBC5    mov         ebx,eax
 0047BBC7    mov         eax,ebx
 0047BBC9    call        0047BBE0
 0047BBCE    mov         edi,esi
 0047BBD0    mov         esi,eax
 0047BBD2    mov         ecx,10
 0047BBD7    rep movs    dword ptr [edi],dword ptr [esi]
 0047BBD9    pop         edi
 0047BBDA    pop         esi
 0047BBDB    pop         ebx
 0047BBDC    ret
end;*}

//0047BBE0
{*function sub_0047BBE0(?:?):?;
begin
 0047BBE0    push        ebx
 0047BBE1    push        esi
 0047BBE2    push        edi
 0047BBE3    mov         ebx,eax
 0047BBE5    test        byte ptr [ebx+54],2
>0047BBE9    je          0047BC55
 0047BBEB    mov         eax,ebx
 0047BBED    call        0047BB44
 0047BBF2    cmp         dword ptr [ebx+30],0
>0047BBF6    jne         0047BC0E
 0047BBF8    mov         eax,80
 0047BBFD    call        @GetMem
 0047BC02    mov         dword ptr [ebx+30],eax
 0047BC05    mov         eax,dword ptr [ebx+30]
 0047BC08    add         eax,40
 0047BC0B    mov         dword ptr [ebx+34],eax
 0047BC0E    mov         esi,dword ptr [ebx+58]
 0047BC11    test        esi,esi
>0047BC13    je          0047BC3C
 0047BC15    mov         eax,esi
 0047BC17    mov         edx,dword ptr ds:[479238];TGLSceneRootObject
 0047BC1D    call        @IsClass
 0047BC22    test        al,al
>0047BC24    jne         0047BC3C
 0047BC26    mov         eax,esi
 0047BC28    call        0047BBE0
 0047BC2D    mov         edx,eax
 0047BC2F    mov         ecx,dword ptr [ebx+30]
 0047BC32    mov         eax,dword ptr [ebx+38]
 0047BC35    call        0045E014
>0047BC3A    jmp         0047BC4D
 0047BC3C    mov         eax,dword ptr [ebx+38]
 0047BC3F    mov         edx,dword ptr [ebx+30]
 0047BC42    mov         esi,eax
 0047BC44    mov         edi,edx
 0047BC46    mov         ecx,10
 0047BC4B    rep movs    dword ptr [edi],dword ptr [esi]
 0047BC4D    and         byte ptr [ebx+54],0FD
 0047BC51    or          byte ptr [ebx+54],4
 0047BC55    mov         eax,dword ptr [ebx+30]
 0047BC58    pop         edi
 0047BC59    pop         esi
 0047BC5A    pop         ebx
 0047BC5B    ret
end;*}

//0047BC5C
{*procedure sub_0047BC5C(?:TGLBaseSceneObject; ?:?);
begin
 0047BC5C    push        ebx
 0047BC5D    push        esi
 0047BC5E    push        edi
 0047BC5F    mov         esi,edx
 0047BC61    mov         ebx,eax
 0047BC63    mov         eax,ebx
 0047BC65    call        0047BC7C
 0047BC6A    mov         edi,esi
 0047BC6C    mov         esi,eax
 0047BC6E    mov         ecx,10
 0047BC73    rep movs    dword ptr [edi],dword ptr [esi]
 0047BC75    pop         edi
 0047BC76    pop         esi
 0047BC77    pop         ebx
 0047BC78    ret
end;*}

//0047BC7C
{*function sub_0047BC7C(?:?):?;
begin
 0047BC7C    push        ebx
 0047BC7D    push        esi
 0047BC7E    push        edi
 0047BC7F    add         esp,0FFFFFF80
 0047BC82    mov         ebx,eax
 0047BC84    test        byte ptr [ebx+54],4
>0047BC88    je          0047BD3B
 0047BC8E    mov         edx,dword ptr ds:[5AE630];^gvar_005ACF64
 0047BC94    mov         eax,dword ptr [ebx+50]
 0047BC97    add         eax,18
 0047BC9A    call        0045D870
 0047BC9F    test        al,al
>0047BCA1    je          0047BD19
 0047BCA3    cmp         dword ptr [ebx+30],0
>0047BCA7    jne         0047BCBF
 0047BCA9    mov         eax,80
 0047BCAE    call        @GetMem
 0047BCB3    mov         dword ptr [ebx+30],eax
 0047BCB6    mov         eax,dword ptr [ebx+30]
 0047BCB9    add         eax,40
 0047BCBC    mov         dword ptr [ebx+34],eax
 0047BCBF    mov         eax,ebx
 0047BCC1    call        0047BB44
 0047BCC6    mov         esi,dword ptr [ebx+58]
 0047BCC9    test        esi,esi
>0047BCCB    je          0047BCFF
 0047BCCD    lea         edx,[esp+40]
 0047BCD1    mov         eax,dword ptr [ebx+38]
 0047BCD4    call        0045E790
 0047BCD9    lea         eax,[esp+40]
 0047BCDD    push        eax
 0047BCDE    mov         eax,esi
 0047BCE0    call        0047BC7C
 0047BCE5    lea         ecx,[esp+4]
 0047BCE9    pop         edx
 0047BCEA    call        0045DC38
 0047BCEF    mov         eax,dword ptr [ebx+34]
 0047BCF2    mov         esi,esp
 0047BCF4    mov         edi,eax
 0047BCF6    mov         ecx,10
 0047BCFB    rep movs    dword ptr [edi],dword ptr [esi]
>0047BCFD    jmp         0047BD37
 0047BCFF    mov         edx,esp
 0047BD01    mov         eax,dword ptr [ebx+38]
 0047BD04    call        0045E790
 0047BD09    mov         eax,dword ptr [ebx+34]
 0047BD0C    mov         esi,esp
 0047BD0E    mov         edi,eax
 0047BD10    mov         ecx,10
 0047BD15    rep movs    dword ptr [edi],dword ptr [esi]
>0047BD17    jmp         0047BD37
 0047BD19    mov         eax,ebx
 0047BD1B    call        0047BBE0
 0047BD20    mov         esi,dword ptr [ebx+34]
 0047BD23    push        esi
 0047BD24    mov         edi,esi
 0047BD26    mov         esi,eax
 0047BD28    mov         ecx,10
 0047BD2D    rep movs    dword ptr [edi],dword ptr [esi]
 0047BD2F    pop         esi
 0047BD30    mov         eax,esi
 0047BD32    call        0045E6F0
 0047BD37    and         byte ptr [ebx+54],0FB
 0047BD3B    mov         eax,dword ptr [ebx+34]
 0047BD3E    add         esp,80
 0047BD44    pop         edi
 0047BD45    pop         esi
 0047BD46    pop         ebx
 0047BD47    ret
end;*}

//0047BD48
{*procedure sub_0047BD48(?:TGLPlane; ?:?);
begin
 0047BD48    push        ebx
 0047BD49    push        esi
 0047BD4A    mov         esi,edx
 0047BD4C    mov         ebx,eax
 0047BD4E    mov         eax,ebx
 0047BD50    call        0047BBE0
 0047BD55    add         eax,20
 0047BD58    mov         edx,esi
 0047BD5A    call        0045D674
 0047BD5F    pop         esi
 0047BD60    pop         ebx
 0047BD61    ret
end;*}

//0047BD64
{*procedure sub_0047BD64(?:TGLBaseSceneObject; ?:?);
begin
 0047BD64    push        ebx
 0047BD65    push        esi
 0047BD66    push        edi
 0047BD67    mov         esi,edx
 0047BD69    mov         ebx,eax
 0047BD6B    mov         eax,ebx
 0047BD6D    call        0047BBE0
 0047BD72    mov         edi,esi
 0047BD74    lea         esi,[eax+30]
 0047BD77    movs        dword ptr [edi],dword ptr [esi]
 0047BD78    movs        dword ptr [edi],dword ptr [esi]
 0047BD79    movs        dword ptr [edi],dword ptr [esi]
 0047BD7A    movs        dword ptr [edi],dword ptr [esi]
 0047BD7B    pop         edi
 0047BD7C    pop         esi
 0047BD7D    pop         ebx
 0047BD7E    ret
end;*}

//0047BD80
{*procedure sub_0047BD80(?:TGLBaseSceneObject; ?:?; ?:?);
begin
 0047BD80    push        ebx
 0047BD81    push        esi
 0047BD82    push        edi
 0047BD83    mov         edi,ecx
 0047BD85    mov         esi,edx
 0047BD87    mov         ebx,eax
 0047BD89    mov         eax,ebx
 0047BD8B    call        0047BC7C
 0047BD90    mov         edx,eax
 0047BD92    mov         ecx,edi
 0047BD94    mov         eax,esi
 0047BD96    call        0045E03C
 0047BD9B    pop         edi
 0047BD9C    pop         esi
 0047BD9D    pop         ebx
 0047BD9E    ret
end;*}

//0047BDA0
{*procedure sub_0047BDA0(?:TGLBaseSceneObject; ?:Integer; ?:?);
begin
 0047BDA0    push        ebx
 0047BDA1    push        esi
 0047BDA2    push        edi
 0047BDA3    mov         edi,ecx
 0047BDA5    mov         esi,edx
 0047BDA7    mov         ebx,eax
 0047BDA9    mov         eax,ebx
 0047BDAB    call        0047BBE0
 0047BDB0    mov         edx,eax
 0047BDB2    mov         ecx,edi
 0047BDB4    mov         eax,esi
 0047BDB6    call        0045E03C
 0047BDBB    pop         edi
 0047BDBC    pop         esi
 0047BDBD    pop         ebx
 0047BDBE    ret
end;*}

//0047BDC0
{*procedure sub_0047BDC0(?:TGLImmaterialSceneObject; ?:?);
begin
 0047BDC0    push        ebx
 0047BDC1    push        esi
 0047BDC2    mov         esi,edx
 0047BDC4    mov         ebx,eax
 0047BDC6    mov         ecx,esi
 0047BDC8    mov         eax,dword ptr [ebx+4C]
 0047BDCB    lea         edx,[eax+18]
 0047BDCE    mov         eax,dword ptr [ebx+48]
 0047BDD1    add         eax,18
 0047BDD4    call        0045CEDC
 0047BDD9    pop         esi
 0047BDDA    pop         ebx
 0047BDDB    ret
end;*}

//0047BDDC
{*procedure sub_0047BDDC(?:TGLSkyBox; ?:?);
begin
 0047BDDC    push        ebx
 0047BDDD    push        esi
 0047BDDE    mov         esi,edx
 0047BDE0    mov         ebx,eax
 0047BDE2    mov         ecx,esi
 0047BDE4    mov         eax,dword ptr [ebx+48]
 0047BDE7    lea         edx,[eax+18]
 0047BDEA    mov         eax,dword ptr [ebx+4C]
 0047BDED    add         eax,18
 0047BDF0    call        0045CEDC
 0047BDF5    pop         esi
 0047BDF6    pop         ebx
 0047BDF7    ret
end;*}

//0047BDF8
{*procedure sub_0047BDF8(?:?);
begin
 0047BDF8    push        ebx
 0047BDF9    push        esi
 0047BDFA    mov         esi,edx
 0047BDFC    mov         ebx,eax
 0047BDFE    mov         edx,esi
 0047BE00    mov         eax,ebx
 0047BE02    call        0047BD64
 0047BE07    pop         esi
 0047BE08    pop         ebx
 0047BE09    ret
end;*}

//0047BE0C
{*procedure sub_0047BE0C(?:?; ?:?);
begin
 0047BE0C    push        ebx
 0047BE0D    push        esi
 0047BE0E    add         esp,0FFFFFFEC
 0047BE11    mov         esi,edx
 0047BE13    mov         ebx,eax
 0047BE15    lea         edx,[esp+4]
 0047BE19    mov         eax,ebx
 0047BE1B    mov         ecx,dword ptr [eax]
 0047BE1D    call        dword ptr [ecx+48]
 0047BE20    mov         edx,esi
 0047BE22    lea         eax,[esp+4]
 0047BE26    call        0045D948
 0047BE2B    fstp        dword ptr [esp]
 0047BE2E    wait
 0047BE2F    fld         dword ptr [esp]
 0047BE32    add         esp,14
 0047BE35    pop         esi
 0047BE36    pop         ebx
 0047BE37    ret
end;*}

//0047BE38
{*procedure sub_0047BE38(?:TGLBaseSceneObject; ?:?);
begin
 0047BE38    push        ebx
 0047BE39    push        esi
 0047BE3A    mov         esi,edx
 0047BE3C    mov         ebx,eax
 0047BE3E    mov         edx,esi
 0047BE40    mov         eax,ebx
 0047BE42    mov         ecx,dword ptr [eax]
 0047BE44    call        dword ptr [ecx+4C]
 0047BE47    mov         eax,dword ptr [ebx+50]
 0047BE4A    lea         edx,[eax+18]
 0047BE4D    mov         eax,esi
 0047BE4F    call        0045D7FC
 0047BE54    pop         esi
 0047BE55    pop         ebx
 0047BE56    ret
end;*}

//0047BE58
{*procedure sub_0047BE58(?:?);
begin
 0047BE58    mov         dword ptr [edx],3F000000
 0047BE5E    mov         dword ptr [edx+4],3F000000
 0047BE65    mov         dword ptr [edx+8],3F000000
 0047BE6C    xor         eax,eax
 0047BE6E    mov         dword ptr [edx+0C],eax
 0047BE71    ret
end;*}

//0047BE74
{*procedure sub_0047BE74(?:?; ?:?);
begin
 0047BE74    push        ebx
 0047BE75    push        esi
 0047BE76    push        edi
 0047BE77    push        ebp
 0047BE78    add         esp,0FFFFFF88
 0047BE7B    mov         dword ptr [esp],edx
 0047BE7E    mov         ebx,eax
 0047BE80    lea         edx,[esp+1C]
 0047BE84    mov         eax,ebx
 0047BE86    mov         ecx,dword ptr [eax]
 0047BE88    call        dword ptr [ecx+4C]
 0047BE8B    lea         edx,[esp+1C]
 0047BE8F    mov         eax,dword ptr [esp]
 0047BE92    call        0046E730
 0047BE97    mov         eax,dword ptr [ebx+60]
 0047BE9A    test        eax,eax
>0047BE9C    je          0047BEE5
 0047BE9E    mov         edi,dword ptr [eax+0C]
 0047BEA1    dec         edi
 0047BEA2    test        edi,edi
>0047BEA4    jl          0047BEE5
 0047BEA6    inc         edi
 0047BEA7    xor         ebp,ebp
 0047BEA9    mov         eax,dword ptr [ebx+60]
 0047BEAC    mov         eax,dword ptr [eax+8]
 0047BEAF    mov         esi,dword ptr [eax+ebp*4]
 0047BEB2    lea         edx,[esp+4]
 0047BEB6    mov         eax,esi
 0047BEB8    call        0047BF08
 0047BEBD    lea         edx,[esp+2C]
 0047BEC1    mov         eax,esi
 0047BEC3    call        0047DAEC
 0047BEC8    lea         edx,[esp+2C]
 0047BECC    lea         eax,[esp+4]
 0047BED0    call        0046E770
 0047BED5    lea         edx,[esp+4]
 0047BED9    mov         eax,dword ptr [esp]
 0047BEDC    call        0046E6C8
 0047BEE1    inc         ebp
 0047BEE2    dec         edi
>0047BEE3    jne         0047BEA9
 0047BEE5    lea         edx,[esp+6C]
 0047BEE9    mov         eax,dword ptr [ebx+50]
 0047BEEC    call        0046B8A8
 0047BEF1    lea         edx,[esp+6C]
 0047BEF5    mov         eax,dword ptr [esp]
 0047BEF8    call        0046E90C
 0047BEFD    add         esp,78
 0047BF00    pop         ebp
 0047BF01    pop         edi
 0047BF02    pop         esi
 0047BF03    pop         ebx
 0047BF04    ret
end;*}

//0047BF08
{*procedure sub_0047BF08(?:?; ?:?);
begin
 0047BF08    push        ebx
 0047BF09    push        esi
 0047BF0A    push        edi
 0047BF0B    push        ebp
 0047BF0C    add         esp,0FFFFFF98
 0047BF0F    mov         ebp,edx
 0047BF11    mov         ebx,eax
 0047BF13    lea         edx,[esp+18]
 0047BF17    mov         eax,ebx
 0047BF19    mov         ecx,dword ptr [eax]
 0047BF1B    call        dword ptr [ecx+4C]
 0047BF1E    lea         edx,[esp+18]
 0047BF22    mov         eax,ebp
 0047BF24    call        0046E730
 0047BF29    mov         eax,dword ptr [ebx+60]
 0047BF2C    test        eax,eax
>0047BF2E    je          0047BF75
 0047BF30    mov         edi,dword ptr [eax+0C]
 0047BF33    dec         edi
 0047BF34    test        edi,edi
>0047BF36    jl          0047BF75
 0047BF38    inc         edi
 0047BF39    xor         esi,esi
 0047BF3B    mov         edx,esp
 0047BF3D    mov         eax,dword ptr [ebx+60]
 0047BF40    mov         eax,dword ptr [eax+8]
 0047BF43    mov         eax,dword ptr [eax+esi*4]
 0047BF46    call        0047BF08
 0047BF4B    lea         edx,[esp+28]
 0047BF4F    mov         eax,dword ptr [ebx+60]
 0047BF52    mov         eax,dword ptr [eax+8]
 0047BF55    mov         eax,dword ptr [eax+esi*4]
 0047BF58    call        0047DAEC
 0047BF5D    lea         edx,[esp+28]
 0047BF61    mov         eax,esp
 0047BF63    call        0046E770
 0047BF68    mov         edx,esp
 0047BF6A    mov         eax,ebp
 0047BF6C    call        0046E6C8
 0047BF71    inc         esi
 0047BF72    dec         edi
>0047BF73    jne         0047BF3B
 0047BF75    add         esp,68
 0047BF78    pop         ebp
 0047BF79    pop         edi
 0047BF7A    pop         esi
 0047BF7B    pop         ebx
 0047BF7C    ret
end;*}

//0047BF80
procedure sub_0047BF80(?:TGLBaseSceneObject);
begin
{*
 0047BF80    push        ebx
 0047BF81    add         esp,0FFFFFFEC
 0047BF84    mov         ebx,eax
 0047BF86    lea         edx,[esp+4]
 0047BF8A    mov         eax,ebx
 0047BF8C    call        0047BE38
 0047BF91    lea         eax,[esp+4]
 0047BF95    call        0045D420
 0047BF9A    fstp        dword ptr [esp]
 0047BF9D    wait
 0047BF9E    fld         dword ptr [esp]
 0047BFA1    add         esp,14
 0047BFA4    pop         ebx
 0047BFA5    ret
*}
end;

//0047BFA8
{*function sub_0047BFA8(?:?):?;
begin
 0047BFA8    push        ebx
 0047BFA9    add         esp,0FFFFFFEC
 0047BFAC    mov         ebx,eax
 0047BFAE    lea         edx,[esp+4]
 0047BFB2    mov         eax,ebx
 0047BFB4    mov         ecx,dword ptr [eax]
 0047BFB6    call        dword ptr [ecx+4C]
 0047BFB9    lea         eax,[esp+4]
 0047BFBD    call        0045D420
 0047BFC2    fstp        dword ptr [esp]
 0047BFC5    wait
 0047BFC6    fld         dword ptr [esp]
 0047BFC9    add         esp,14
 0047BFCC    pop         ebx
 0047BFCD    ret
end;*}

//0047BFD0
{*procedure sub_0047BFD0(?:?);
begin
 0047BFD0    push        ebx
 0047BFD1    push        esi
 0047BFD2    add         esp,0FFFFFFA0
 0047BFD5    mov         esi,edx
 0047BFD7    mov         ebx,eax
 0047BFD9    lea         edx,[esp+10]
 0047BFDD    mov         eax,ebx
 0047BFDF    call        0047BE38
 0047BFE4    lea         edx,[esp+20]
 0047BFE8    mov         eax,ebx
 0047BFEA    call        0047BC5C
 0047BFEF    lea         edx,[esp+20]
 0047BFF3    mov         ecx,esp
 0047BFF5    mov         eax,esi
 0047BFF7    call        0045E03C
 0047BFFC    fld         dword ptr [esp]
 0047BFFF    mov         esi,dword ptr [ebx+50];TGLBaseSceneObject.?f50:TGLCoordinates
 0047C002    fmul        dword ptr [esi+18];TGLCoordinates.X:Single
 0047C005    fabs
 0047C007    fcomp       dword ptr [esp+10]
 0047C00B    fnstsw      al
 0047C00D    sahf
>0047C00E    ja          0047C034
 0047C010    fld         dword ptr [esp+4]
 0047C014    fmul        dword ptr [esi+1C];TGLCoordinates.Y:Single
 0047C017    fabs
 0047C019    fcomp       dword ptr [esp+14]
 0047C01D    fnstsw      al
 0047C01F    sahf
>0047C020    ja          0047C034
 0047C022    fld         dword ptr [esp+8]
 0047C026    fmul        dword ptr [esi+20];TGLCoordinates.Z:Single
 0047C029    fabs
 0047C02B    fcomp       dword ptr [esp+18]
 0047C02F    fnstsw      al
 0047C031    sahf
>0047C032    jbe         0047C038
 0047C034    xor         eax,eax
>0047C036    jmp         0047C03A
 0047C038    mov         al,1
 0047C03A    add         esp,60
 0047C03D    pop         esi
 0047C03E    pop         ebx
 0047C03F    ret
end;*}

//0047C040
{*function sub_0047C040(?:?; ?:?; ?:?; ?:?):?;
begin
 0047C040    push        ebp
 0047C041    mov         ebp,esp
 0047C043    add         esp,0FFFFFFC0
 0047C046    push        ebx
 0047C047    push        esi
 0047C048    push        edi
 0047C049    mov         edi,ecx
 0047C04B    mov         esi,edx
 0047C04D    mov         ebx,eax
 0047C04F    lea         edx,[ebp-40]
 0047C052    mov         eax,ebx
 0047C054    call        0047BD64
 0047C059    lea         edx,[ebp-40]
 0047C05C    lea         eax,[ebp-30]
 0047C05F    call        0045C9C0
 0047C064    mov         eax,ebx
 0047C066    call        0047BF80
 0047C06B    add         esp,0FFFFFFFC
 0047C06E    fstp        dword ptr [esp]
 0047C071    wait
 0047C072    lea         eax,[ebp-10]
 0047C075    push        eax
 0047C076    lea         eax,[ebp-20]
 0047C079    push        eax
 0047C07A    lea         ecx,[ebp-30]
 0047C07D    mov         edx,edi
 0047C07F    mov         eax,esi
 0047C081    call        0045FAAC
 0047C086    test        eax,eax
>0047C088    jle         0047C0C3
 0047C08A    mov         bl,1
 0047C08C    cmp         dword ptr [ebp+0C],0
>0047C090    je          0047C09D
 0047C092    lea         edx,[ebp-10]
 0047C095    mov         eax,dword ptr [ebp+0C]
 0047C098    call        0045C9C0
 0047C09D    cmp         dword ptr [ebp+8],0
>0047C0A1    je          0047C0C5
 0047C0A3    lea         edx,[ebp-30]
 0047C0A6    lea         eax,[ebp-10]
 0047C0A9    call        0045CCB0
 0047C0AE    lea         eax,[ebp-10]
 0047C0B1    call        0045D5EC
 0047C0B6    lea         edx,[ebp-10]
 0047C0B9    mov         eax,dword ptr [ebp+8]
 0047C0BC    call        0045C9C0
>0047C0C1    jmp         0047C0C5
 0047C0C3    xor         ebx,ebx
 0047C0C5    mov         eax,ebx
 0047C0C7    pop         edi
 0047C0C8    pop         esi
 0047C0C9    pop         ebx
 0047C0CA    mov         esp,ebp
 0047C0CC    pop         ebp
 0047C0CD    ret         8
end;*}

//0047C0D0
{*procedure sub_0047C0D0(?:?);
begin
 0047C0D0    push        ebx
 0047C0D1    push        esi
 0047C0D2    push        edi
 0047C0D3    push        ebp
 0047C0D4    add         esp,0FFFFFFBC
 0047C0D7    mov         ebp,edx
 0047C0D9    mov         dword ptr [esp],eax
 0047C0DC    mov         eax,dword ptr [esp]
 0047C0DF    call        0047BFA8
 0047C0E4    fstp        dword ptr [esp+8]
 0047C0E8    wait
 0047C0E9    mov         eax,ebp
 0047C0EB    call        0045D408
 0047C0F0    fstp        dword ptr [esp+4]
 0047C0F4    wait
 0047C0F5    mov         al,byte ptr [ebp+18]
 0047C0F8    sub         al,1
>0047C0FA    jb          0047C100
>0047C0FC    je          0047C114
>0047C0FE    jmp         0047C11E
 0047C100    push        dword ptr [esp+4]
 0047C104    push        dword ptr [esp+0C]
 0047C108    call        0045FBB8
 0047C10D    fstp        dword ptr [esp+0C]
 0047C111    wait
>0047C112    jmp         0047C13A
 0047C114    mov         eax,dword ptr [esp+8]
 0047C118    mov         dword ptr [esp+0C],eax
>0047C11C    jmp         0047C13A
 0047C11E    mov         ecx,0C6F
 0047C123    mov         edx,47C260;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047C128    mov         eax,47C298;'Assertion failure'
 0047C12D    call        @Assert
 0047C132    mov         eax,dword ptr [esp+8]
 0047C136    mov         dword ptr [esp+0C],eax
 0047C13A    lea         ecx,[esp+1C]
 0047C13E    mov         edx,dword ptr ds:[5AE610];^gvar_005ACEE8
 0047C144    mov         eax,ebp
 0047C146    call        0045CEA8
 0047C14B    lea         eax,[esp+1C]
 0047C14F    call        0045D408
 0047C154    fld         tbyte ptr ds:[47C2AC];0.001:Extended
 0047C15A    fcompp
 0047C15C    fnstsw      al
 0047C15E    sahf
>0047C15F    jbe         0047C172
 0047C161    lea         ecx,[esp+1C]
 0047C165    mov         edx,dword ptr ds:[5AE58C];^gvar_005ACEF4
 0047C16B    mov         eax,ebp
 0047C16D    call        0045CEA8
 0047C172    lea         ecx,[esp+28]
 0047C176    lea         edx,[esp+1C]
 0047C17A    mov         eax,ebp
 0047C17C    call        0045CEA8
 0047C181    lea         eax,[esp+1C]
 0047C185    call        0045D460
 0047C18A    lea         eax,[esp+28]
 0047C18E    call        0045D460
 0047C193    mov         dl,1
 0047C195    mov         eax,[0046E9C4];TGLSilhouette
 0047C19A    call        TGLSilhouette.Create;TGLSilhouette.Create
 0047C19F    mov         esi,eax
 0047C1A1    mov         dword ptr [esp+18],3E9930A7
 0047C1A9    fld         tbyte ptr ds:[47C2B8];0.98:Extended
 0047C1AF    fmul        dword ptr [esp+0C]
 0047C1B3    fstp        dword ptr [esp+0C]
 0047C1B7    wait
 0047C1B8    xor         ebx,ebx
 0047C1BA    mov         dword ptr [esp+34],ebx
 0047C1BE    fild        dword ptr [esp+34]
 0047C1C2    fmul        dword ptr [esp+18]
 0047C1C6    add         esp,0FFFFFFFC
 0047C1C9    fstp        dword ptr [esp]
 0047C1CC    wait
 0047C1CD    push        dword ptr [esp+10]
 0047C1D1    lea         edx,[esp+1C]
 0047C1D5    lea         eax,[esp+18]
 0047C1D9    call        0045F580
 0047C1DE    push        dword ptr [esp+10]
 0047C1E2    push        dword ptr [esp+18]
 0047C1E6    lea         ecx,[esp+40]
 0047C1EA    lea         edx,[esp+30]
 0047C1EE    lea         eax,[esp+24]
 0047C1F2    call        0045CD18
 0047C1F7    lea         edx,[esp+38]
 0047C1FB    mov         eax,dword ptr [esi+4];TGLSilhouette.?f4:TVectorList
 0047C1FE    call        00468F1C
 0047C203    lea         eax,[ebx+1]
 0047C206    mov         ecx,15
 0047C20B    cdq
 0047C20C    idiv        eax,ecx
 0047C20E    mov         edi,edx
 0047C210    mov         eax,dword ptr [esi+8];TGLSilhouette.?f8:TIntegerList
 0047C213    mov         ecx,edi
 0047C215    mov         edx,ebx
 0047C217    call        004691E0
 0047C21C    cmp         byte ptr [ebp+19],0
>0047C220    je          0047C232
 0047C222    push        edi
 0047C223    mov         eax,dword ptr [esi+0C];TGLSilhouette.?fC:TIntegerList
 0047C226    mov         ecx,ebx
 0047C228    mov         edx,15
 0047C22D    call        00469218
 0047C232    inc         ebx
 0047C233    cmp         ebx,15
>0047C236    jne         0047C1BA
 0047C238    cmp         byte ptr [ebp+19],0
>0047C23C    je          0047C24C
 0047C23E    mov         edx,dword ptr ds:[5AE680];^gvar_005ACFA4
 0047C244    mov         eax,dword ptr [esi+4];TGLSilhouette.?f4:TVectorList
 0047C247    call        00468EB8
 0047C24C    mov         eax,esi
 0047C24E    add         esp,44
 0047C251    pop         ebp
 0047C252    pop         edi
 0047C253    pop         esi
 0047C254    pop         ebx
 0047C255    ret
end;*}

//0047C2C4
procedure TGLBaseSceneObject.Assign(Source:TPersistent);
begin
{*
 0047C2C4    push        ebx
 0047C2C5    push        esi
 0047C2C6    push        edi
 0047C2C7    push        ebp
 0047C2C8    add         esp,0FFFFFFF8
 0047C2CB    mov         edi,edx
 0047C2CD    mov         ebx,eax
 0047C2CF    mov         eax,edi
 0047C2D1    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 0047C2D7    call        @IsClass
 0047C2DC    test        al,al
>0047C2DE    je          0047C414
 0047C2E4    mov         eax,ebx
 0047C2E6    call        0047B64C
 0047C2EB    mov         ebp,edi
 0047C2ED    mov         al,byte ptr [ebp+64]
 0047C2F0    mov         byte ptr [ebx+64],al;TGLBaseSceneObject.?f64:byte
 0047C2F3    mov         eax,ebp
 0047C2F5    call        0047BB44
 0047C2FA    mov         eax,dword ptr [ebp+38]
 0047C2FD    mov         edx,eax
 0047C2FF    mov         eax,ebx
 0047C301    call        0047DB1C
 0047C306    mov         al,byte ptr [ebp+6C]
 0047C309    mov         byte ptr [ebx+6C],al;TGLBaseSceneObject.?f6C:byte
 0047C30C    mov         al,byte ptr [ebp+75]
 0047C30F    mov         byte ptr [ebx+75],al;TGLBaseSceneObject.?f75:byte
 0047C312    mov         al,byte ptr [ebp+76]
 0047C315    mov         byte ptr [ebx+76],al;TGLBaseSceneObject.?f76:byte
 0047C318    mov         edx,dword ptr [ebp+70]
 0047C31B    mov         eax,dword ptr [ebx+70];TGLBaseSceneObject.?f70:TGLCoordinates
 0047C31E    mov         ecx,dword ptr [eax]
 0047C320    call        dword ptr [ecx+8];TGLCoordinates.Assign
 0047C323    mov         eax,ebx
 0047C325    mov         si,0FFEB
 0047C329    call        @CallDynaInst;TGLBaseSceneObject.sub_0047B788
 0047C32E    mov         edx,dword ptr [ebp+5C]
 0047C331    mov         eax,ebx
 0047C333    call        0047DCE4
 0047C338    mov         eax,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047C33B    test        eax,eax
>0047C33D    je          0047C344
 0047C33F    call        00480014
 0047C344    mov         eax,dword ptr [ebp+60]
 0047C347    test        eax,eax
>0047C349    je          0047C390
 0047C34B    mov         eax,dword ptr [eax+0C]
 0047C34E    dec         eax
 0047C34F    test        eax,eax
>0047C351    jl          0047C390
 0047C353    inc         eax
 0047C354    mov         dword ptr [esp+4],eax
 0047C358    mov         dword ptr [esp],0
 0047C35F    mov         eax,dword ptr [edi+60]
 0047C362    mov         edx,dword ptr [esp]
 0047C365    call        00466EF0
 0047C36A    mov         ebp,eax
 0047C36C    mov         eax,ebp
 0047C36E    call        TObject.ClassType
 0047C373    mov         edx,eax
 0047C375    mov         eax,ebx
 0047C377    mov         si,0FFEE
 0047C37B    call        @CallDynaInst;TGLBaseSceneObject.sub_0047BAF8
 0047C380    mov         edx,ebp
 0047C382    mov         ecx,dword ptr [eax]
 0047C384    call        dword ptr [ecx+8]
 0047C387    inc         dword ptr [esp]
 0047C38A    dec         dword ptr [esp+4]
>0047C38E    jne         0047C35F
 0047C390    mov         eax,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047C393    test        eax,eax
>0047C395    je          0047C39C
 0047C397    call        00480018
 0047C39C    mov         esi,edi
 0047C39E    mov         eax,dword ptr [esi+78]
 0047C3A1    mov         dword ptr [ebx+78],eax;TGLBaseSceneObject.?f78:dword
 0047C3A4    mov         eax,dword ptr [esi+7C]
 0047C3A7    mov         dword ptr [ebx+7C],eax;TGLBaseSceneObject.?f7C:dword
 0047C3AA    cmp         dword ptr [esi+80],0
>0047C3B1    je          0047C3CA
 0047C3B3    mov         eax,esi
 0047C3B5    call        TGLImmaterialSceneObject.GetBehaviours
 0047C3BA    push        eax
 0047C3BB    mov         eax,ebx
 0047C3BD    call        TGLImmaterialSceneObject.GetBehaviours
 0047C3C2    pop         edx
 0047C3C3    mov         ecx,dword ptr [eax]
 0047C3C5    call        dword ptr [ecx+8]
>0047C3C8    jmp         0047C3D5
 0047C3CA    lea         eax,[ebx+80];TGLBaseSceneObject.?f80:TGLBehaviours
 0047C3D0    call        FreeAndNil
 0047C3D5    cmp         dword ptr [esi+84],0
>0047C3DC    je          0047C3F5
 0047C3DE    mov         eax,esi
 0047C3E0    call        TGLImmaterialSceneObject.GetEffects
 0047C3E5    push        eax
 0047C3E6    mov         eax,ebx
 0047C3E8    call        TGLImmaterialSceneObject.GetEffects
 0047C3ED    pop         edx
 0047C3EE    mov         ecx,dword ptr [eax]
 0047C3F0    call        dword ptr [ecx+8]
>0047C3F3    jmp         0047C400
 0047C3F5    lea         eax,[ebx+84];TGLBaseSceneObject.?f84:TGLObjectEffects
 0047C3FB    call        FreeAndNil
 0047C400    mov         eax,dword ptr [esi+0C]
 0047C403    mov         dword ptr [ebx+0C],eax;TGLBaseSceneObject.Tag:Integer
 0047C406    mov         eax,dword ptr [esi+8C]
 0047C40C    mov         dword ptr [ebx+8C],eax;TGLBaseSceneObject.TagFloat:Single
>0047C412    jmp         0047C41D
 0047C414    mov         edx,edi
 0047C416    mov         eax,ebx
 0047C418    call        TPersistent.Assign
 0047C41D    pop         ecx
 0047C41E    pop         edx
 0047C41F    pop         ebp
 0047C420    pop         edi
 0047C421    pop         esi
 0047C422    pop         ebx
 0047C423    ret
*}
end;

//0047C424
{*function sub_0047C424(?:TGLBaseSceneObject):?;
begin
 0047C424    cmp         dword ptr [eax+68],0
>0047C428    jne         0047C433
 0047C42A    test        byte ptr [eax+1C],2
>0047C42E    jne         0047C433
 0047C430    xor         eax,eax
 0047C432    ret
 0047C433    mov         al,1
 0047C435    ret
end;*}

//0047C438
procedure TGLBaseSceneObject.GetParentComponent;
begin
{*
 0047C438    mov         eax,dword ptr [eax+58];TGLBaseSceneObject.?f58:dword
 0047C43B    ret
*}
end;

//0047C43C
procedure TGLBaseSceneObject.HasParent;
begin
{*
 0047C43C    cmp         dword ptr [eax+58],0;TGLBaseSceneObject.?f58:dword
 0047C440    setne       al
 0047C443    ret
*}
end;

//0047C444
{*procedure sub_0047C444(?:?; ?:?);
begin
 0047C444    push        ebp
 0047C445    mov         ebp,esp
 0047C447    push        ebx
 0047C448    mov         ebx,eax
 0047C44A    push        dword ptr [ebp+8]
 0047C44D    mov         eax,dword ptr [ebx+48]
 0047C450    lea         edx,[eax+18]
 0047C453    mov         eax,dword ptr [ebx+44]
 0047C456    call        0046B618
 0047C45B    mov         eax,ebx
 0047C45D    call        0047CF48
 0047C462    pop         ebx
 0047C463    pop         ebp
 0047C464    ret         4
end;*}

//0047C468
{*procedure sub_0047C468(?:?);
begin
 0047C468    push        ebx
 0047C469    mov         ebx,eax
 0047C46B    mov         eax,dword ptr [ebx+38]
 0047C46E    xor         ecx,ecx
 0047C470    mov         edx,40
 0047C475    call        @FillChar
 0047C47A    mov         edx,dword ptr [ebx+50]
 0047C47D    mov         edx,dword ptr [edx+18]
 0047C480    mov         eax,dword ptr [ebx+38]
 0047C483    mov         dword ptr [eax],edx
 0047C485    mov         edx,dword ptr [ebx+50]
 0047C488    mov         edx,dword ptr [edx+1C]
 0047C48B    mov         dword ptr [eax+14],edx
 0047C48E    mov         edx,dword ptr [ebx+50]
 0047C491    mov         edx,dword ptr [edx+20]
 0047C494    mov         dword ptr [eax+28],edx
 0047C497    mov         edx,dword ptr [ebx+44]
 0047C49A    add         edx,18
 0047C49D    add         eax,30
 0047C4A0    call        0045C9C0
 0047C4A5    mov         edx,dword ptr ds:[5AE680];^gvar_005ACFA4
 0047C4AB    mov         eax,dword ptr [ebx+70]
 0047C4AE    call        0046B7C8
 0047C4B3    mov         edx,dword ptr ds:[5AE214];^gvar_005ACF44
 0047C4B9    mov         eax,dword ptr [ebx+48]
 0047C4BC    call        0046B7C8
 0047C4C1    mov         edx,dword ptr ds:[5AE320];^gvar_005ACF34
 0047C4C7    mov         eax,dword ptr [ebx+4C]
 0047C4CA    call        0046B7C8
 0047C4CF    mov         eax,ebx
 0047C4D1    call        0047CF48
 0047C4D6    and         byte ptr [ebx+54],0FE
 0047C4DA    pop         ebx
 0047C4DB    ret
end;*}

//0047C4DC
{*procedure sub_0047C4DC(?:TGLBaseSceneObject; ?:?; ?:?; ?:?);
begin
 0047C4DC    push        ebp
 0047C4DD    mov         ebp,esp
 0047C4DF    add         esp,0FFFFFFB0
 0047C4E2    push        ebx
 0047C4E3    push        esi
 0047C4E4    mov         ebx,eax
 0047C4E6    mov         eax,ebx
 0047C4E8    call        0047C468
 0047C4ED    fld         dword ptr [ebp+10]
 0047C4F0    mov         eax,[005AE71C];^0.0174532923847437:Single
 0047C4F5    fmul        dword ptr [eax]
 0047C4F7    add         esp,0FFFFFFFC
 0047C4FA    fstp        dword ptr [esp]
 0047C4FD    wait
 0047C4FE    lea         edx,[ebp-50]
 0047C501    mov         eax,ebx
 0047C503    call        0047BDC0
 0047C508    lea         eax,[ebp-50]
 0047C50B    lea         edx,[ebp-40]
 0047C50E    call        0045DC1C
 0047C513    lea         ecx,[ebp-50]
 0047C516    lea         edx,[ebp-40]
 0047C519    mov         esi,dword ptr [ebx+4C]
 0047C51C    lea         eax,[esi+18]
 0047C51F    call        0045E03C
 0047C524    lea         edx,[ebp-50]
 0047C527    mov         eax,esi
 0047C529    call        0046B7C8
 0047C52E    mov         eax,dword ptr [ebx+4C]
 0047C531    call        0046B660
 0047C536    lea         ecx,[ebp-50]
 0047C539    lea         edx,[ebp-40]
 0047C53C    mov         esi,dword ptr [ebx+48]
 0047C53F    lea         eax,[esi+18]
 0047C542    call        0045E03C
 0047C547    lea         edx,[ebp-50]
 0047C54A    mov         eax,esi
 0047C54C    call        0046B7C8
 0047C551    mov         eax,dword ptr [ebx+48]
 0047C554    call        0046B660
 0047C559    push        dword ptr [ebp+10]
 0047C55C    call        0045F4F8
 0047C561    mov         eax,dword ptr [ebx+70]
 0047C564    fstp        dword ptr [eax+18]
 0047C567    wait
 0047C568    fld         dword ptr [ebp+0C]
 0047C56B    mov         eax,[005AE71C];^0.0174532923847437:Single
 0047C570    fmul        dword ptr [eax]
 0047C572    add         esp,0FFFFFFFC
 0047C575    fstp        dword ptr [esp]
 0047C578    wait
 0047C579    lea         edx,[ebp-40]
 0047C57C    mov         eax,dword ptr [ebx+4C]
 0047C57F    add         eax,18
 0047C582    call        0045DC1C
 0047C587    lea         ecx,[ebp-50]
 0047C58A    lea         edx,[ebp-40]
 0047C58D    mov         esi,dword ptr [ebx+4C]
 0047C590    lea         eax,[esi+18]
 0047C593    call        0045E03C
 0047C598    lea         edx,[ebp-50]
 0047C59B    mov         eax,esi
 0047C59D    call        0046B7C8
 0047C5A2    mov         eax,dword ptr [ebx+4C]
 0047C5A5    call        0046B660
 0047C5AA    lea         ecx,[ebp-50]
 0047C5AD    lea         edx,[ebp-40]
 0047C5B0    mov         esi,dword ptr [ebx+48]
 0047C5B3    lea         eax,[esi+18]
 0047C5B6    call        0045E03C
 0047C5BB    lea         edx,[ebp-50]
 0047C5BE    mov         eax,esi
 0047C5C0    call        0046B7C8
 0047C5C5    mov         eax,dword ptr [ebx+48]
 0047C5C8    call        0046B660
 0047C5CD    push        dword ptr [ebp+0C]
 0047C5D0    call        0045F4F8
 0047C5D5    mov         eax,dword ptr [ebx+70]
 0047C5D8    fstp        dword ptr [eax+1C]
 0047C5DB    wait
 0047C5DC    fld         dword ptr [ebp+8]
 0047C5DF    mov         eax,[005AE71C];^0.0174532923847437:Single
 0047C5E4    fmul        dword ptr [eax]
 0047C5E6    add         esp,0FFFFFFFC
 0047C5E9    fstp        dword ptr [esp]
 0047C5EC    wait
 0047C5ED    lea         edx,[ebp-40]
 0047C5F0    mov         eax,dword ptr [ebx+48]
 0047C5F3    add         eax,18
 0047C5F6    call        0045DC1C
 0047C5FB    lea         ecx,[ebp-50]
 0047C5FE    lea         edx,[ebp-40]
 0047C601    mov         esi,dword ptr [ebx+4C]
 0047C604    lea         eax,[esi+18]
 0047C607    call        0045E03C
 0047C60C    lea         edx,[ebp-50]
 0047C60F    mov         eax,esi
 0047C611    call        0046B7C8
 0047C616    mov         eax,dword ptr [ebx+4C]
 0047C619    call        0046B660
 0047C61E    lea         ecx,[ebp-50]
 0047C621    lea         edx,[ebp-40]
 0047C624    mov         esi,dword ptr [ebx+48]
 0047C627    lea         eax,[esi+18]
 0047C62A    call        0045E03C
 0047C62F    lea         edx,[ebp-50]
 0047C632    mov         eax,esi
 0047C634    call        0046B7C8
 0047C639    mov         eax,dword ptr [ebx+48]
 0047C63C    call        0046B660
 0047C641    push        dword ptr [ebp+8]
 0047C644    call        0045F4F8
 0047C649    mov         eax,dword ptr [ebx+70]
 0047C64C    fstp        dword ptr [eax+20]
 0047C64F    wait
 0047C650    mov         eax,ebx
 0047C652    call        0047CF48
 0047C657    mov         edx,ebx
 0047C659    mov         eax,ebx
 0047C65B    mov         ecx,dword ptr [eax]
 0047C65D    call        dword ptr [ecx+34]
 0047C660    pop         esi
 0047C661    pop         ebx
 0047C662    mov         esp,ebp
 0047C664    pop         ebp
 0047C665    ret         0C
end;*}

//0047C668
{*procedure sub_0047C668(?:?; ?:?);
begin
 0047C668    push        ebp
 0047C669    mov         ebp,esp
 0047C66B    add         esp,0FFFFFFE8
 0047C66E    push        ebx
 0047C66F    mov         dword ptr [ebp-4],eax
 0047C672    mov         eax,dword ptr [ebp-4]
 0047C675    mov         byte ptr [eax+74],1
 0047C679    xor         eax,eax
 0047C67B    push        ebp
 0047C67C    push        47C76D
 0047C681    push        dword ptr fs:[eax]
 0047C684    mov         dword ptr fs:[eax],esp
 0047C687    push        dword ptr [ebp+8]
 0047C68A    call        0045F4AC
 0047C68F    fchs
 0047C691    fstp        dword ptr [ebp+8]
 0047C694    wait
 0047C695    lea         edx,[ebp-18]
 0047C698    mov         eax,dword ptr [ebp-4]
 0047C69B    call        0047BDC0
 0047C6A0    push        dword ptr [ebp+8]
 0047C6A3    lea         edx,[ebp-18]
 0047C6A6    mov         eax,dword ptr [ebp-4]
 0047C6A9    mov         eax,dword ptr [eax+4C]
 0047C6AC    call        0046B640
 0047C6B1    mov         eax,dword ptr [ebp-4]
 0047C6B4    mov         eax,dword ptr [eax+4C]
 0047C6B7    call        0046B660
 0047C6BC    push        dword ptr [ebp+8]
 0047C6BF    lea         edx,[ebp-18]
 0047C6C2    mov         eax,dword ptr [ebp-4]
 0047C6C5    mov         eax,dword ptr [eax+48]
 0047C6C8    call        0046B640
 0047C6CD    mov         eax,dword ptr [ebp-4]
 0047C6D0    mov         eax,dword ptr [eax+48]
 0047C6D3    call        0046B660
 0047C6D8    mov         eax,dword ptr [ebp-4]
 0047C6DB    mov         ebx,dword ptr [eax+48]
 0047C6DE    push        dword ptr [ebx+1C]
 0047C6E1    push        dword ptr [ebx+18]
 0047C6E4    push        dword ptr [ebx+20]
 0047C6E7    call        0045D3F0
 0047C6EC    add         esp,0FFFFFFFC
 0047C6EF    fstp        dword ptr [esp]
 0047C6F2    wait
 0047C6F3    call        0045F620
 0047C6F8    add         esp,0FFFFFFFC
 0047C6FB    fstp        dword ptr [esp]
 0047C6FE    wait
 0047C6FF    call        0045F4E8
 0047C704    fchs
 0047C706    fstp        dword ptr [ebp-8]
 0047C709    wait
 0047C70A    mov         eax,dword ptr [ebp-4]
 0047C70D    mov         edx,dword ptr [eax+48]
 0047C710    fld         dword ptr [edx+18]
 0047C713    fcomp       dword ptr ds:[47C784];0:Single
 0047C719    fnstsw      al
 0047C71B    sahf
>0047C71C    jae         0047C748
 0047C71E    fld         dword ptr [edx+1C]
 0047C721    fcomp       dword ptr ds:[47C784];0:Single
 0047C727    fnstsw      al
 0047C729    sahf
>0047C72A    jae         0047C73B
 0047C72C    fld         dword ptr ds:[47C788];180:Single
 0047C732    fsub        dword ptr [ebp-8]
 0047C735    fstp        dword ptr [ebp-8]
 0047C738    wait
>0047C739    jmp         0047C748
 0047C73B    fld         dword ptr ds:[47C78C];-180:Single
 0047C741    fsub        dword ptr [ebp-8]
 0047C744    fstp        dword ptr [ebp-8]
 0047C747    wait
 0047C748    push        dword ptr [ebp-8]
 0047C74B    mov         eax,dword ptr [ebp-4]
 0047C74E    mov         eax,dword ptr [eax+70]
 0047C751    xor         edx,edx
 0047C753    call        TGLCoordinates.SetX
 0047C758    xor         eax,eax
 0047C75A    pop         edx
 0047C75B    pop         ecx
 0047C75C    pop         ecx
 0047C75D    mov         dword ptr fs:[eax],edx
 0047C760    push        47C774
 0047C765    mov         eax,dword ptr [ebp-4]
 0047C768    mov         byte ptr [eax+74],0
 0047C76C    ret
>0047C76D    jmp         @HandleFinally
>0047C772    jmp         0047C765
 0047C774    mov         eax,dword ptr [ebp-4]
 0047C777    call        0047CF48
 0047C77C    pop         ebx
 0047C77D    mov         esp,ebp
 0047C77F    pop         ebp
 0047C780    ret         4
end;*}

//0047C790
{*procedure TGLImmaterialSceneObject.SetPitchAngle(Value:Single; ?:?);
begin
 0047C790    push        ebp
 0047C791    mov         ebp,esp
 0047C793    add         esp,0FFFFFFA8
 0047C796    push        ebx
 0047C797    mov         dword ptr [ebp-4],eax
 0047C79A    fld         dword ptr [ebp+8]
 0047C79D    mov         eax,dword ptr [ebp-4]
 0047C7A0    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047C7A3    fcomp       dword ptr [eax+18];TGLCoordinates.X:Single
 0047C7A6    fnstsw      al
 0047C7A8    sahf
>0047C7A9    je          0047C88E
 0047C7AF    mov         eax,dword ptr [ebp-4]
 0047C7B2    test        byte ptr [eax+1C],1;TGLImmaterialSceneObject.FComponentState:TComponentState
>0047C7B6    jne         0047C87C
 0047C7BC    mov         eax,dword ptr [ebp-4]
 0047C7BF    mov         byte ptr [eax+74],1;TGLImmaterialSceneObject.?f74:byte
 0047C7C3    xor         eax,eax
 0047C7C5    push        ebp
 0047C7C6    push        47C875
 0047C7CB    push        dword ptr fs:[eax]
 0047C7CE    mov         dword ptr fs:[eax],esp
 0047C7D1    mov         eax,dword ptr [ebp-4]
 0047C7D4    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047C7D7    fld         dword ptr [eax+18];TGLCoordinates.X:Single
 0047C7DA    fsub        dword ptr [ebp+8]
 0047C7DD    add         esp,0FFFFFFF4
 0047C7E0    fstp        tbyte ptr [esp]
 0047C7E3    wait
 0047C7E4    call        0045F480
 0047C7E9    fstp        dword ptr [ebp-8]
 0047C7EC    wait
 0047C7ED    push        dword ptr [ebp-8]
 0047C7F0    lea         edx,[ebp-58]
 0047C7F3    mov         eax,dword ptr [ebp-4]
 0047C7F6    call        0047BDC0
 0047C7FB    lea         eax,[ebp-58]
 0047C7FE    lea         edx,[ebp-48]
 0047C801    call        0045DC1C
 0047C806    lea         ecx,[ebp-58]
 0047C809    lea         edx,[ebp-48]
 0047C80C    mov         eax,dword ptr [ebp-4]
 0047C80F    mov         ebx,dword ptr [eax+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047C812    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047C815    call        0045E03C
 0047C81A    lea         edx,[ebp-58]
 0047C81D    mov         eax,ebx
 0047C81F    call        0046B7C8
 0047C824    mov         eax,dword ptr [ebp-4]
 0047C827    mov         eax,dword ptr [eax+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047C82A    call        0046B660
 0047C82F    lea         ecx,[ebp-58]
 0047C832    lea         edx,[ebp-48]
 0047C835    mov         eax,dword ptr [ebp-4]
 0047C838    mov         ebx,dword ptr [eax+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047C83B    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047C83E    call        0045E03C
 0047C843    lea         edx,[ebp-58]
 0047C846    mov         eax,ebx
 0047C848    call        0046B7C8
 0047C84D    mov         eax,dword ptr [ebp-4]
 0047C850    mov         eax,dword ptr [eax+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047C853    call        0046B660
 0047C858    mov         eax,dword ptr [ebp-4]
 0047C85B    call        0047CF48
 0047C860    xor         eax,eax
 0047C862    pop         edx
 0047C863    pop         ecx
 0047C864    pop         ecx
 0047C865    mov         dword ptr fs:[eax],edx
 0047C868    push        47C87C
 0047C86D    mov         eax,dword ptr [ebp-4]
 0047C870    mov         byte ptr [eax+74],0;TGLImmaterialSceneObject.?f74:byte
 0047C874    ret
>0047C875    jmp         @HandleFinally
>0047C87A    jmp         0047C86D
 0047C87C    push        dword ptr [ebp+8]
 0047C87F    call        0045F4F8
 0047C884    mov         eax,dword ptr [ebp-4]
 0047C887    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047C88A    fstp        dword ptr [eax+18];TGLCoordinates.X:Single
 0047C88D    wait
 0047C88E    pop         ebx
 0047C88F    mov         esp,ebp
 0047C891    pop         ebp
 0047C892    ret         4
end;*}

//0047C898
{*procedure sub_0047C898(?:?; ?:?);
begin
 0047C898    push        ebp
 0047C899    mov         ebp,esp
 0047C89B    add         esp,0FFFFFFD8
 0047C89E    push        esi
 0047C89F    push        edi
 0047C8A0    mov         dword ptr [ebp-4],eax
 0047C8A3    mov         eax,dword ptr [ebp-4]
 0047C8A6    mov         byte ptr [eax+74],1
 0047C8AA    xor         eax,eax
 0047C8AC    push        ebp
 0047C8AD    push        47C9A3
 0047C8B2    push        dword ptr fs:[eax]
 0047C8B5    mov         dword ptr fs:[eax],esp
 0047C8B8    push        dword ptr [ebp+8]
 0047C8BB    call        0045F4AC
 0047C8C0    fstp        dword ptr [ebp+8]
 0047C8C3    wait
 0047C8C4    mov         eax,dword ptr [ebp-4]
 0047C8C7    mov         eax,dword ptr [eax+48]
 0047C8CA    lea         esi,[eax+18]
 0047C8CD    lea         edi,[ebp-28]
 0047C8D0    movs        dword ptr [edi],dword ptr [esi]
 0047C8D1    movs        dword ptr [edi],dword ptr [esi]
 0047C8D2    movs        dword ptr [edi],dword ptr [esi]
 0047C8D3    movs        dword ptr [edi],dword ptr [esi]
 0047C8D4    push        dword ptr [ebp+8]
 0047C8D7    lea         edx,[ebp-28]
 0047C8DA    mov         eax,dword ptr [ebp-4]
 0047C8DD    mov         eax,dword ptr [eax+4C]
 0047C8E0    call        0046B640
 0047C8E5    mov         eax,dword ptr [ebp-4]
 0047C8E8    mov         eax,dword ptr [eax+4C]
 0047C8EB    call        0046B660
 0047C8F0    push        dword ptr [ebp+8]
 0047C8F3    lea         edx,[ebp-28]
 0047C8F6    mov         eax,dword ptr [ebp-4]
 0047C8F9    mov         eax,dword ptr [eax+48]
 0047C8FC    call        0046B640
 0047C901    mov         eax,dword ptr [ebp-4]
 0047C904    mov         eax,dword ptr [eax+48]
 0047C907    call        0046B660
 0047C90C    lea         edx,[ebp-18]
 0047C90F    mov         eax,dword ptr [ebp-4]
 0047C912    call        0047BDC0
 0047C917    push        dword ptr [ebp-14]
 0047C91A    push        dword ptr [ebp-18]
 0047C91D    push        dword ptr [ebp-10]
 0047C920    call        0045D3F0
 0047C925    add         esp,0FFFFFFFC
 0047C928    fstp        dword ptr [esp]
 0047C92B    wait
 0047C92C    call        0045F620
 0047C931    add         esp,0FFFFFFFC
 0047C934    fstp        dword ptr [esp]
 0047C937    wait
 0047C938    call        0045F4E8
 0047C93D    fchs
 0047C93F    fstp        dword ptr [ebp-8]
 0047C942    wait
 0047C943    fld         dword ptr [ebp-18]
 0047C946    fcomp       dword ptr ds:[47C9BC];0:Single
 0047C94C    fnstsw      al
 0047C94E    sahf
>0047C94F    jae         0047C97B
 0047C951    fld         dword ptr [ebp-14]
 0047C954    fcomp       dword ptr ds:[47C9BC];0:Single
 0047C95A    fnstsw      al
 0047C95C    sahf
>0047C95D    jae         0047C96E
 0047C95F    fld         dword ptr ds:[47C9C0];180:Single
 0047C965    fsub        dword ptr [ebp-8]
 0047C968    fstp        dword ptr [ebp-8]
 0047C96B    wait
>0047C96C    jmp         0047C97B
 0047C96E    fld         dword ptr ds:[47C9C4];-180:Single
 0047C974    fsub        dword ptr [ebp-8]
 0047C977    fstp        dword ptr [ebp-8]
 0047C97A    wait
 0047C97B    push        dword ptr [ebp-8]
 0047C97E    mov         eax,dword ptr [ebp-4]
 0047C981    mov         eax,dword ptr [eax+70]
 0047C984    mov         edx,2
 0047C989    call        TGLCoordinates.SetX
 0047C98E    xor         eax,eax
 0047C990    pop         edx
 0047C991    pop         ecx
 0047C992    pop         ecx
 0047C993    mov         dword ptr fs:[eax],edx
 0047C996    push        47C9AA
 0047C99B    mov         eax,dword ptr [ebp-4]
 0047C99E    mov         byte ptr [eax+74],0
 0047C9A2    ret
>0047C9A3    jmp         @HandleFinally
>0047C9A8    jmp         0047C99B
 0047C9AA    mov         eax,dword ptr [ebp-4]
 0047C9AD    call        0047CF48
 0047C9B2    pop         edi
 0047C9B3    pop         esi
 0047C9B4    mov         esp,ebp
 0047C9B6    pop         ebp
 0047C9B7    ret         4
end;*}

//0047C9C8
{*procedure TGLImmaterialSceneObject.SetRollAngle(Value:Single; ?:?);
begin
 0047C9C8    push        ebp
 0047C9C9    mov         ebp,esp
 0047C9CB    add         esp,0FFFFFFA8
 0047C9CE    push        ebx
 0047C9CF    mov         dword ptr [ebp-4],eax
 0047C9D2    fld         dword ptr [ebp+8]
 0047C9D5    mov         eax,dword ptr [ebp-4]
 0047C9D8    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047C9DB    fcomp       dword ptr [eax+20];TGLCoordinates.Z:Single
 0047C9DE    fnstsw      al
 0047C9E0    sahf
>0047C9E1    je          0047CAC1
 0047C9E7    mov         eax,dword ptr [ebp-4]
 0047C9EA    test        byte ptr [eax+1C],1;TGLImmaterialSceneObject.FComponentState:TComponentState
>0047C9EE    jne         0047CAAF
 0047C9F4    mov         eax,dword ptr [ebp-4]
 0047C9F7    mov         byte ptr [eax+74],1;TGLImmaterialSceneObject.?f74:byte
 0047C9FB    xor         eax,eax
 0047C9FD    push        ebp
 0047C9FE    push        47CAA8
 0047CA03    push        dword ptr fs:[eax]
 0047CA06    mov         dword ptr fs:[eax],esp
 0047CA09    mov         eax,dword ptr [ebp-4]
 0047CA0C    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CA0F    fld         dword ptr [eax+20];TGLCoordinates.Z:Single
 0047CA12    fsub        dword ptr [ebp+8]
 0047CA15    add         esp,0FFFFFFF4
 0047CA18    fstp        tbyte ptr [esp]
 0047CA1B    wait
 0047CA1C    call        0045F480
 0047CA21    fstp        dword ptr [ebp-8]
 0047CA24    wait
 0047CA25    push        dword ptr [ebp-8]
 0047CA28    lea         edx,[ebp-48]
 0047CA2B    mov         eax,dword ptr [ebp-4]
 0047CA2E    mov         eax,dword ptr [eax+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047CA31    add         eax,18;TGLCoordinates.X:Single
 0047CA34    call        0045DC1C
 0047CA39    lea         ecx,[ebp-58]
 0047CA3C    lea         edx,[ebp-48]
 0047CA3F    mov         eax,dword ptr [ebp-4]
 0047CA42    mov         ebx,dword ptr [eax+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047CA45    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047CA48    call        0045E03C
 0047CA4D    lea         edx,[ebp-58]
 0047CA50    mov         eax,ebx
 0047CA52    call        0046B7C8
 0047CA57    mov         eax,dword ptr [ebp-4]
 0047CA5A    mov         eax,dword ptr [eax+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047CA5D    call        0046B660
 0047CA62    lea         ecx,[ebp-58]
 0047CA65    lea         edx,[ebp-48]
 0047CA68    mov         eax,dword ptr [ebp-4]
 0047CA6B    mov         ebx,dword ptr [eax+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047CA6E    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047CA71    call        0045E03C
 0047CA76    lea         edx,[ebp-58]
 0047CA79    mov         eax,ebx
 0047CA7B    call        0046B7C8
 0047CA80    mov         eax,dword ptr [ebp-4]
 0047CA83    mov         eax,dword ptr [eax+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047CA86    call        0046B660
 0047CA8B    mov         eax,dword ptr [ebp-4]
 0047CA8E    call        0047CF48
 0047CA93    xor         eax,eax
 0047CA95    pop         edx
 0047CA96    pop         ecx
 0047CA97    pop         ecx
 0047CA98    mov         dword ptr fs:[eax],edx
 0047CA9B    push        47CAAF
 0047CAA0    mov         eax,dword ptr [ebp-4]
 0047CAA3    mov         byte ptr [eax+74],0;TGLImmaterialSceneObject.?f74:byte
 0047CAA7    ret
>0047CAA8    jmp         @HandleFinally
>0047CAAD    jmp         0047CAA0
 0047CAAF    push        dword ptr [ebp+8]
 0047CAB2    call        0045F4F8
 0047CAB7    mov         eax,dword ptr [ebp-4]
 0047CABA    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CABD    fstp        dword ptr [eax+20];TGLCoordinates.Z:Single
 0047CAC0    wait
 0047CAC1    pop         ebx
 0047CAC2    mov         esp,ebp
 0047CAC4    pop         ebp
 0047CAC5    ret         4
end;*}

//0047CAC8
{*procedure sub_0047CAC8(?:TGLDummyCube; ?:?);
begin
 0047CAC8    push        ebp
 0047CAC9    mov         ebp,esp
 0047CACB    add         esp,0FFFFFFE8
 0047CACE    push        ebx
 0047CACF    push        esi
 0047CAD0    push        edi
 0047CAD1    mov         dword ptr [ebp-4],eax
 0047CAD4    mov         eax,dword ptr [ebp-4]
 0047CAD7    mov         byte ptr [eax+74],1
 0047CADB    xor         ecx,ecx
 0047CADD    push        ebp
 0047CADE    push        47CBCF
 0047CAE3    push        dword ptr fs:[ecx]
 0047CAE6    mov         dword ptr fs:[ecx],esp
 0047CAE9    push        dword ptr [ebp+8]
 0047CAEC    call        0045F4AC
 0047CAF1    fstp        dword ptr [ebp+8]
 0047CAF4    wait
 0047CAF5    mov         eax,dword ptr [ebp-4]
 0047CAF8    mov         eax,dword ptr [eax+4C]
 0047CAFB    lea         esi,[eax+18]
 0047CAFE    lea         edi,[ebp-18]
 0047CB01    movs        dword ptr [edi],dword ptr [esi]
 0047CB02    movs        dword ptr [edi],dword ptr [esi]
 0047CB03    movs        dword ptr [edi],dword ptr [esi]
 0047CB04    movs        dword ptr [edi],dword ptr [esi]
 0047CB05    push        dword ptr [ebp+8]
 0047CB08    lea         edx,[ebp-18]
 0047CB0B    call        0046B640
 0047CB10    mov         eax,dword ptr [ebp-4]
 0047CB13    mov         eax,dword ptr [eax+4C]
 0047CB16    call        0046B660
 0047CB1B    push        dword ptr [ebp+8]
 0047CB1E    lea         edx,[ebp-18]
 0047CB21    mov         eax,dword ptr [ebp-4]
 0047CB24    mov         eax,dword ptr [eax+48]
 0047CB27    call        0046B640
 0047CB2C    mov         eax,dword ptr [ebp-4]
 0047CB2F    mov         eax,dword ptr [eax+48]
 0047CB32    call        0046B660
 0047CB37    mov         eax,dword ptr [ebp-4]
 0047CB3A    mov         ebx,dword ptr [eax+48]
 0047CB3D    push        dword ptr [ebx+18]
 0047CB40    push        dword ptr [ebx+1C]
 0047CB43    push        dword ptr [ebx+20]
 0047CB46    call        0045D3F0
 0047CB4B    add         esp,0FFFFFFFC
 0047CB4E    fstp        dword ptr [esp]
 0047CB51    wait
 0047CB52    call        0045F620
 0047CB57    add         esp,0FFFFFFFC
 0047CB5A    fstp        dword ptr [esp]
 0047CB5D    wait
 0047CB5E    call        0045F4E8
 0047CB63    fchs
 0047CB65    fstp        dword ptr [ebp-8]
 0047CB68    wait
 0047CB69    mov         eax,dword ptr [ebp-4]
 0047CB6C    mov         edx,dword ptr [eax+48]
 0047CB6F    fld         dword ptr [edx+18]
 0047CB72    fcomp       dword ptr ds:[47CBE8];0:Single
 0047CB78    fnstsw      al
 0047CB7A    sahf
>0047CB7B    jae         0047CBA7
 0047CB7D    fld         dword ptr [edx+1C]
 0047CB80    fcomp       dword ptr ds:[47CBE8];0:Single
 0047CB86    fnstsw      al
 0047CB88    sahf
>0047CB89    jae         0047CB9A
 0047CB8B    fld         dword ptr ds:[47CBEC];180:Single
 0047CB91    fsub        dword ptr [ebp-8]
 0047CB94    fstp        dword ptr [ebp-8]
 0047CB97    wait
>0047CB98    jmp         0047CBA7
 0047CB9A    fld         dword ptr ds:[47CBF0];-180:Single
 0047CBA0    fsub        dword ptr [ebp-8]
 0047CBA3    fstp        dword ptr [ebp-8]
 0047CBA6    wait
 0047CBA7    push        dword ptr [ebp-8]
 0047CBAA    mov         eax,dword ptr [ebp-4]
 0047CBAD    mov         eax,dword ptr [eax+70]
 0047CBB0    mov         edx,1
 0047CBB5    call        TGLCoordinates.SetX
 0047CBBA    xor         eax,eax
 0047CBBC    pop         edx
 0047CBBD    pop         ecx
 0047CBBE    pop         ecx
 0047CBBF    mov         dword ptr fs:[eax],edx
 0047CBC2    push        47CBD6
 0047CBC7    mov         eax,dword ptr [ebp-4]
 0047CBCA    mov         byte ptr [eax+74],0
 0047CBCE    ret
>0047CBCF    jmp         @HandleFinally
>0047CBD4    jmp         0047CBC7
 0047CBD6    mov         eax,dword ptr [ebp-4]
 0047CBD9    call        0047CF48
 0047CBDE    pop         edi
 0047CBDF    pop         esi
 0047CBE0    pop         ebx
 0047CBE1    mov         esp,ebp
 0047CBE3    pop         ebp
 0047CBE4    ret         4
end;*}

//0047CBF4
{*procedure TGLImmaterialSceneObject.SetTurnAngle(Value:Single; ?:?);
begin
 0047CBF4    push        ebp
 0047CBF5    mov         ebp,esp
 0047CBF7    add         esp,0FFFFFFA8
 0047CBFA    push        ebx
 0047CBFB    mov         dword ptr [ebp-4],eax
 0047CBFE    fld         dword ptr [ebp+8]
 0047CC01    mov         eax,dword ptr [ebp-4]
 0047CC04    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CC07    fcomp       dword ptr [eax+1C];TGLCoordinates.Y:Single
 0047CC0A    fnstsw      al
 0047CC0C    sahf
>0047CC0D    je          0047CCED
 0047CC13    mov         eax,dword ptr [ebp-4]
 0047CC16    test        byte ptr [eax+1C],1;TGLImmaterialSceneObject.FComponentState:TComponentState
>0047CC1A    jne         0047CCDB
 0047CC20    mov         eax,dword ptr [ebp-4]
 0047CC23    mov         byte ptr [eax+74],1;TGLImmaterialSceneObject.?f74:byte
 0047CC27    xor         eax,eax
 0047CC29    push        ebp
 0047CC2A    push        47CCD4
 0047CC2F    push        dword ptr fs:[eax]
 0047CC32    mov         dword ptr fs:[eax],esp
 0047CC35    mov         eax,dword ptr [ebp-4]
 0047CC38    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CC3B    fld         dword ptr [eax+1C];TGLCoordinates.Y:Single
 0047CC3E    fsub        dword ptr [ebp+8]
 0047CC41    add         esp,0FFFFFFF4
 0047CC44    fstp        tbyte ptr [esp]
 0047CC47    wait
 0047CC48    call        0045F480
 0047CC4D    fstp        dword ptr [ebp-8]
 0047CC50    wait
 0047CC51    push        dword ptr [ebp-8]
 0047CC54    lea         edx,[ebp-48]
 0047CC57    mov         eax,dword ptr [ebp-4]
 0047CC5A    mov         eax,dword ptr [eax+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047CC5D    add         eax,18;TGLCoordinates.X:Single
 0047CC60    call        0045DC1C
 0047CC65    lea         ecx,[ebp-58]
 0047CC68    lea         edx,[ebp-48]
 0047CC6B    mov         eax,dword ptr [ebp-4]
 0047CC6E    mov         ebx,dword ptr [eax+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047CC71    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047CC74    call        0045E03C
 0047CC79    lea         edx,[ebp-58]
 0047CC7C    mov         eax,ebx
 0047CC7E    call        0046B7C8
 0047CC83    mov         eax,dword ptr [ebp-4]
 0047CC86    mov         eax,dword ptr [eax+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047CC89    call        0046B660
 0047CC8E    lea         ecx,[ebp-58]
 0047CC91    lea         edx,[ebp-48]
 0047CC94    mov         eax,dword ptr [ebp-4]
 0047CC97    mov         ebx,dword ptr [eax+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047CC9A    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047CC9D    call        0045E03C
 0047CCA2    lea         edx,[ebp-58]
 0047CCA5    mov         eax,ebx
 0047CCA7    call        0046B7C8
 0047CCAC    mov         eax,dword ptr [ebp-4]
 0047CCAF    mov         eax,dword ptr [eax+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047CCB2    call        0046B660
 0047CCB7    mov         eax,dword ptr [ebp-4]
 0047CCBA    call        0047CF48
 0047CCBF    xor         eax,eax
 0047CCC1    pop         edx
 0047CCC2    pop         ecx
 0047CCC3    pop         ecx
 0047CCC4    mov         dword ptr fs:[eax],edx
 0047CCC7    push        47CCDB
 0047CCCC    mov         eax,dword ptr [ebp-4]
 0047CCCF    mov         byte ptr [eax+74],0;TGLImmaterialSceneObject.?f74:byte
 0047CCD3    ret
>0047CCD4    jmp         @HandleFinally
>0047CCD9    jmp         0047CCCC
 0047CCDB    push        dword ptr [ebp+8]
 0047CCDE    call        0045F4F8
 0047CCE3    mov         eax,dword ptr [ebp-4]
 0047CCE6    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CCE9    fstp        dword ptr [eax+1C];TGLCoordinates.Y:Single
 0047CCEC    wait
 0047CCED    pop         ebx
 0047CCEE    mov         esp,ebp
 0047CCF0    pop         ebp
 0047CCF1    ret         4
end;*}

//0047CCF4
procedure TGLImmaterialSceneObject.GetPitchAngle;
begin
{*
 0047CCF4    push        ecx
 0047CCF5    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CCF8    mov         eax,dword ptr [eax+18];TGLCoordinates.X:Single
 0047CCFB    mov         dword ptr [esp],eax
 0047CCFE    fld         dword ptr [esp]
 0047CD01    pop         edx
 0047CD02    ret
*}
end;

//0047CD04
procedure TGLImmaterialSceneObject.GetTurnAngle;
begin
{*
 0047CD04    push        ecx
 0047CD05    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CD08    mov         eax,dword ptr [eax+1C];TGLCoordinates.Y:Single
 0047CD0B    mov         dword ptr [esp],eax
 0047CD0E    fld         dword ptr [esp]
 0047CD11    pop         edx
 0047CD12    ret
*}
end;

//0047CD14
procedure TGLImmaterialSceneObject.GetRollAngle;
begin
{*
 0047CD14    push        ecx
 0047CD15    mov         eax,dword ptr [eax+70];TGLImmaterialSceneObject.?f70:TGLCoordinates
 0047CD18    mov         eax,dword ptr [eax+20];TGLCoordinates.Z:Single
 0047CD1B    mov         dword ptr [esp],eax
 0047CD1E    fld         dword ptr [esp]
 0047CD21    pop         edx
 0047CD22    ret
*}
end;

//0047CD24
procedure TGLImmaterialSceneObject.SetShowAxes(Value:Boolean);
begin
{*
 0047CD24    push        esi
 0047CD25    mov         esi,eax
 0047CD27    cmp         dl,byte ptr [esi+6C];TGLImmaterialSceneObject.?f6C:byte
>0047CD2A    je          0047CD38
 0047CD2C    mov         byte ptr [esi+6C],dl;TGLImmaterialSceneObject.?f6C:byte
 0047CD2F    mov         edx,esi
 0047CD31    mov         eax,esi
 0047CD33    mov         ecx,dword ptr [eax]
 0047CD35    call        dword ptr [ecx+34];TGLImmaterialSceneObject.sub_0047DACC
 0047CD38    pop         esi
 0047CD39    ret
*}
end;

//0047CD3C
procedure TGLImmaterialSceneObject.SetScale(Value:TGLCoordinates);
begin
{*
 0047CD3C    push        ebx
 0047CD3D    mov         ebx,eax
 0047CD3F    mov         eax,dword ptr [ebx+50];TGLImmaterialSceneObject.?f50:TGLCoordinates
 0047CD42    mov         ecx,dword ptr [eax]
 0047CD44    call        dword ptr [ecx+8];TGLCoordinates.Assign
 0047CD47    mov         eax,ebx
 0047CD49    call        0047CF48
 0047CD4E    pop         ebx
 0047CD4F    ret
*}
end;

//0047CD50
procedure TGLBaseSceneObject.SetName(const NewName:TComponentName);
begin
{*
 0047CD50    push        ebx
 0047CD51    push        esi
 0047CD52    mov         esi,edx
 0047CD54    mov         ebx,eax
 0047CD56    mov         eax,dword ptr [ebx+8];TGLBaseSceneObject.Name:TComponentName
 0047CD59    mov         edx,esi
 0047CD5B    call        @LStrCmp
>0047CD60    je          0047CD83
 0047CD62    mov         edx,esi
 0047CD64    mov         eax,ebx
 0047CD66    call        TComponent.SetName
 0047CD6B    cmp         word ptr ds:[5E1506],0;gvar_005E1506
>0047CD73    je          0047CD83
 0047CD75    mov         edx,ebx
 0047CD77    mov         eax,dword ptr ds:[5E1508];gvar_005E1508
 0047CD7D    call        dword ptr ds:[5E1504]
 0047CD83    pop         esi
 0047CD84    pop         ebx
 0047CD85    ret
*}
end;

//0047CD88
{*function sub_0047CD88(?:?):?;
begin
 0047CD88    mov         edx,dword ptr [eax+58]
 0047CD8B    test        edx,edx
>0047CD8D    je          0047CD99
 0047CD8F    mov         edx,dword ptr [edx+60]
 0047CD92    xchg        eax,edx
 0047CD93    call        00466EF8
 0047CD98    ret
 0047CD99    or          eax,0FFFFFFFF
 0047CD9C    ret
end;*}

//0047CDA0
{*procedure sub_0047CDA0(?:TGLBaseSceneObject; ?:?);
begin
 0047CDA0    push        ebx
 0047CDA1    push        esi
 0047CDA2    push        edi
 0047CDA3    push        ebp
 0047CDA4    mov         edi,edx
 0047CDA6    mov         ebx,eax
 0047CDA8    mov         eax,dword ptr [ebx+58]
 0047CDAB    test        eax,eax
>0047CDAD    je          0047CE05
 0047CDAF    test        edi,edi
>0047CDB1    jge         0047CDB5
 0047CDB3    xor         edi,edi
 0047CDB5    call        0047BA94
 0047CDBA    cmp         eax,edi
>0047CDBC    jg          0047CDC1
 0047CDBE    mov         edi,eax
 0047CDC0    dec         edi
 0047CDC1    mov         eax,ebx
 0047CDC3    call        0047CD88
 0047CDC8    cmp         edi,eax
>0047CDCA    je          0047CE05
 0047CDCC    mov         eax,dword ptr [ebx+5C]
 0047CDCF    test        eax,eax
>0047CDD1    je          0047CDD8
 0047CDD3    call        00480014
 0047CDD8    mov         ebp,dword ptr [ebx+58]
 0047CDDB    xor         ecx,ecx
 0047CDDD    mov         edx,ebx
 0047CDDF    mov         eax,ebp
 0047CDE1    mov         si,0FFE9
 0047CDE5    call        @CallDynaInst
 0047CDEA    mov         ecx,ebx
 0047CDEC    mov         edx,edi
 0047CDEE    mov         eax,ebp
 0047CDF0    mov         si,0FFEA
 0047CDF4    call        @CallDynaInst
 0047CDF9    mov         eax,dword ptr [ebx+5C]
 0047CDFC    test        eax,eax
>0047CDFE    je          0047CE05
 0047CE00    call        00480018
 0047CE05    pop         ebp
 0047CE06    pop         edi
 0047CE07    pop         esi
 0047CE08    pop         ebx
 0047CE09    ret
end;*}

//0047CE0C
{*procedure TGLBaseSceneObject.sub_00422EDC(?:?);
begin
 0047CE0C    push        ebx
 0047CE0D    push        esi
 0047CE0E    push        edi
 0047CE0F    mov         edi,edx
 0047CE11    mov         ebx,eax
 0047CE13    mov         edx,edi
 0047CE15    mov         eax,ebx
 0047CE17    call        TComponent.sub_00422EDC
 0047CE1C    mov         eax,dword ptr [ebx+58];TGLBaseSceneObject.?f58:dword
 0047CE1F    test        eax,eax
>0047CE21    je          0047CE35
 0047CE23    xor         ecx,ecx
 0047CE25    mov         edx,ebx
 0047CE27    mov         si,0FFE9
 0047CE2B    call        @CallDynaInst
 0047CE30    xor         eax,eax
 0047CE32    mov         dword ptr [ebx+58],eax;TGLBaseSceneObject.?f58:dword
 0047CE35    test        edi,edi
>0047CE37    je          0047CEC2
 0047CE3D    mov         eax,edi
 0047CE3F    mov         edx,dword ptr ds:[47A72C];TGLScene
 0047CE45    call        @IsClass
 0047CE4A    test        al,al
>0047CE4C    je          0047CE7F
 0047CE4E    mov         eax,ebx
 0047CE50    mov         edx,dword ptr ds:[47A4A4];TGLCamera
 0047CE56    call        @IsClass
 0047CE5B    test        al,al
>0047CE5D    je          0047CE6F
 0047CE5F    mov         eax,dword ptr [edi+38]
 0047CE62    mov         edx,ebx
 0047CE64    mov         si,0FFEC
 0047CE68    call        @CallDynaInst
>0047CE6D    jmp         0047CEC2
 0047CE6F    mov         eax,dword ptr [edi+34]
 0047CE72    mov         edx,ebx
 0047CE74    mov         si,0FFEC
 0047CE78    call        @CallDynaInst
>0047CE7D    jmp         0047CEC2
 0047CE7F    mov         eax,dword ptr [ebx+58];TGLBaseSceneObject.?f58:dword
 0047CE82    test        eax,eax
>0047CE84    je          0047CE8A
 0047CE86    test        eax,eax
>0047CE88    jne         0047CEA1
 0047CE8A    mov         eax,edi
 0047CE8C    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 0047CE92    call        @IsClass
 0047CE97    test        al,al
>0047CE99    je          0047CE9F
 0047CE9B    mov         eax,edi
>0047CE9D    jmp         0047CEA1
 0047CE9F    xor         eax,eax
 0047CEA1    test        eax,eax
>0047CEA3    je          0047CEB4
 0047CEA5    mov         edx,ebx
 0047CEA7    mov         eax,edi
 0047CEA9    mov         si,0FFEC
 0047CEAD    call        @CallDynaInst
>0047CEB2    jmp         0047CEC2
 0047CEB4    xor         eax,eax
 0047CEB6    mov         dword ptr [ebx+58],eax;TGLBaseSceneObject.?f58:dword
 0047CEB9    xor         edx,edx
 0047CEBB    mov         eax,ebx
 0047CEBD    call        0047DCE4
 0047CEC2    pop         edi
 0047CEC3    pop         esi
 0047CEC4    pop         ebx
 0047CEC5    ret
end;*}

//0047CEC8
procedure TGLBaseSceneObject.sub_0047CEC8;
begin
{*
 0047CEC8    push        ebx
 0047CEC9    mov         ebx,eax
 0047CECB    test        byte ptr [ebx+54],8;TGLBaseSceneObject.?f54:byte
>0047CECF    jne         0047CEE0
 0047CED1    or          byte ptr [ebx+54],8;TGLBaseSceneObject.?f54:byte
 0047CED5    mov         edx,ebx
 0047CED7    mov         eax,ebx
 0047CED9    mov         ecx,dword ptr [eax]
 0047CEDB    call        dword ptr [ecx+34];TGLBaseSceneObject.sub_0047DACC
 0047CEDE    pop         ebx
 0047CEDF    ret
 0047CEE0    test        byte ptr [ebx+3C],1;TGLBaseSceneObject.?f3C:byte
>0047CEE4    je          0047CEEF
 0047CEE6    mov         edx,ebx
 0047CEE8    mov         eax,ebx
 0047CEEA    mov         ecx,dword ptr [eax]
 0047CEEC    call        dword ptr [ecx+34];TGLBaseSceneObject.sub_0047DACC
 0047CEEF    pop         ebx
 0047CEF0    ret
*}
end;

//0047CEF4
procedure sub_0047CEF4(?:TGLBaseSceneObject);
begin
{*
 0047CEF4    push        ebx
 0047CEF5    mov         ebx,eax
 0047CEF7    and         byte ptr [ebx+54],0F7;TGLBaseSceneObject.?f54:byte
 0047CEFB    pop         ebx
 0047CEFC    ret
*}
end;

//0047CF00
procedure sub_0047CF00(?:TGLBaseSceneObject);
begin
{*
 0047CF00    push        ebx
 0047CF01    push        esi
 0047CF02    push        edi
 0047CF03    mov         esi,eax
 0047CF05    mov         bl,byte ptr ds:[47CF44];0x6 gvar_0047CF44
 0047CF0B    mov         al,byte ptr [esi+54]
 0047CF0E    and         al,bl
 0047CF10    mov         edx,ebx
 0047CF12    cmp         dl,al
>0047CF14    je          0047CF3D
 0047CF16    or          bl,byte ptr [esi+54]
 0047CF19    mov         byte ptr [esi+54],bl
 0047CF1C    mov         eax,dword ptr [esi+60]
 0047CF1F    test        eax,eax
>0047CF21    je          0047CF3D
 0047CF23    mov         edi,dword ptr [eax+8]
 0047CF26    mov         ebx,dword ptr [eax+0C]
 0047CF29    dec         ebx
 0047CF2A    test        ebx,ebx
>0047CF2C    jl          0047CF3D
 0047CF2E    inc         ebx
 0047CF2F    xor         esi,esi
 0047CF31    mov         eax,dword ptr [edi+esi*4]
 0047CF34    call        0047CF00
 0047CF39    inc         esi
 0047CF3A    dec         ebx
>0047CF3B    jne         0047CF31
 0047CF3D    pop         edi
 0047CF3E    pop         esi
 0047CF3F    pop         ebx
 0047CF40    ret
*}
end;

//0047CF48
procedure sub_0047CF48(?:TGLBaseSceneObject);
begin
{*
 0047CF48    push        ebx
 0047CF49    mov         ebx,eax
 0047CF4B    test        byte ptr [ebx+54],1;TGLBaseSceneObject.?f54:byte
>0047CF4F    jne         0047CF6B
 0047CF51    or          byte ptr [ebx+54],1;TGLBaseSceneObject.?f54:byte
 0047CF55    mov         eax,ebx
 0047CF57    call        0047CF00
 0047CF5C    test        byte ptr [ebx+1C],1;TGLBaseSceneObject.FComponentState:TComponentState
>0047CF60    jne         0047CF6B
 0047CF62    mov         edx,ebx
 0047CF64    mov         eax,ebx
 0047CF66    mov         ecx,dword ptr [eax]
 0047CF68    call        dword ptr [ecx+34];TGLBaseSceneObject.sub_0047DACC
 0047CF6B    pop         ebx
 0047CF6C    ret
*}
end;

//0047CF70
{*procedure TGLBaseSceneObject.sub_0047CF70(?:?);
begin
 0047CF70    push        ebx
 0047CF71    push        esi
 0047CF72    push        edi
 0047CF73    mov         edi,edx
 0047CF75    mov         ebx,eax
 0047CF77    mov         eax,dword ptr [ebx+58];TGLBaseSceneObject.?f58:dword
 0047CF7A    test        eax,eax
>0047CF7C    je          0047CF90
 0047CF7E    xor         ecx,ecx
 0047CF80    mov         edx,ebx
 0047CF82    mov         si,0FFE9
 0047CF86    call        @CallDynaInst
 0047CF8B    xor         eax,eax
 0047CF8D    mov         dword ptr [ebx+58],eax;TGLBaseSceneObject.?f58:dword
 0047CF90    test        edi,edi
>0047CF92    je          0047CFA3
 0047CF94    mov         edx,ebx
 0047CF96    mov         eax,edi
 0047CF98    mov         si,0FFEC
 0047CF9C    call        @CallDynaInst
>0047CFA1    jmp         0047CFAC
 0047CFA3    xor         edx,edx
 0047CFA5    mov         eax,ebx
 0047CFA7    call        0047DCE4
 0047CFAC    pop         edi
 0047CFAD    pop         esi
 0047CFAE    pop         ebx
 0047CFAF    ret
end;*}

//0047CFB0
{*procedure sub_0047CFB0(?:?);
begin
 0047CFB0    push        ebp
 0047CFB1    mov         ebp,esp
 0047CFB3    add         esp,0FFFFFFDC
 0047CFB6    push        ebx
 0047CFB7    mov         dword ptr [ebp-4],eax
 0047CFBA    mov         eax,dword ptr [ebp-4]
 0047CFBD    cmp         byte ptr [eax+74],0;TGLBaseSceneObject.?f74:byte
>0047CFC1    jne         0047D1D4
 0047CFC7    mov         eax,dword ptr [ebp-4]
 0047CFCA    mov         byte ptr [eax+74],1;TGLBaseSceneObject.?f74:byte
 0047CFCE    xor         ecx,ecx
 0047CFD0    push        ebp
 0047CFD1    push        47D1CD
 0047CFD6    push        dword ptr fs:[ecx]
 0047CFD9    mov         dword ptr fs:[ecx],esp
 0047CFDC    mov         eax,dword ptr [ebp-4]
 0047CFDF    mov         ebx,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047CFE2    cmp         edx,ebx
>0047CFE4    jne         0047D0BA
 0047CFEA    mov         eax,ebx
 0047CFEC    call        0046B678
 0047CFF1    fcomp       dword ptr ds:[47D1DC];0:Single
 0047CFF7    fnstsw      al
 0047CFF9    sahf
>0047CFFA    jne         0047D00D
 0047CFFC    mov         edx,dword ptr ds:[5AE214];^gvar_005ACF44
 0047D002    mov         eax,dword ptr [ebp-4]
 0047D005    mov         eax,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047D008    call        0046B7C8
 0047D00D    mov         eax,dword ptr [ebp-4]
 0047D010    mov         eax,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047D013    call        0046B660
 0047D018    lea         ecx,[ebp-14]
 0047D01B    mov         eax,dword ptr [ebp-4]
 0047D01E    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D021    lea         edx,[eax+18];TGLCoordinates.X:Single
 0047D024    mov         eax,dword ptr [ebp-4]
 0047D027    mov         eax,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047D02A    add         eax,18;TGLCoordinates.X:Single
 0047D02D    call        0045CEDC
 0047D032    lea         eax,[ebp-14]
 0047D035    call        0045D420
 0047D03A    fld         tbyte ptr ds:[47D1E0];1E-5:Extended
 0047D040    fcompp
 0047D042    fnstsw      al
 0047D044    sahf
>0047D045    jbe         0047D088
 0047D047    lea         ecx,[ebp-14]
 0047D04A    mov         eax,dword ptr [ebp-4]
 0047D04D    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D050    lea         edx,[eax+18];TGLCoordinates.X:Single
 0047D053    mov         eax,[005AE214];^gvar_005ACF44
 0047D058    call        0045CEDC
 0047D05D    lea         eax,[ebp-14]
 0047D060    call        0045D420
 0047D065    fld         tbyte ptr ds:[47D1E0];1E-5:Extended
 0047D06B    fcompp
 0047D06D    fnstsw      al
 0047D06F    sahf
>0047D070    jbe         0047D088
 0047D072    lea         ecx,[ebp-14]
 0047D075    mov         eax,dword ptr [ebp-4]
 0047D078    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D07B    lea         edx,[eax+18];TGLCoordinates.X:Single
 0047D07E    mov         eax,[005AE3CC];^gvar_005ACF24
 0047D083    call        0045CEDC
 0047D088    lea         ecx,[ebp-24]
 0047D08B    mov         eax,dword ptr [ebp-4]
 0047D08E    mov         eax,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047D091    lea         edx,[eax+18];TGLCoordinates.X:Single
 0047D094    lea         eax,[ebp-14]
 0047D097    call        0045CEDC
 0047D09C    lea         edx,[ebp-24]
 0047D09F    mov         eax,dword ptr [ebp-4]
 0047D0A2    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D0A5    call        0046B7C8
 0047D0AA    mov         eax,dword ptr [ebp-4]
 0047D0AD    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D0B0    call        0046B660
>0047D0B5    jmp         0047D1B0
 0047D0BA    mov         eax,dword ptr [ebp-4]
 0047D0BD    mov         ebx,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D0C0    cmp         edx,ebx
>0047D0C2    jne         0047D195
 0047D0C8    mov         eax,ebx
 0047D0CA    call        0046B678
 0047D0CF    fcomp       dword ptr ds:[47D1DC];0:Single
 0047D0D5    fnstsw      al
 0047D0D7    sahf
>0047D0D8    jne         0047D0EB
 0047D0DA    mov         edx,dword ptr ds:[5AE320];^gvar_005ACF34
 0047D0E0    mov         eax,dword ptr [ebp-4]
 0047D0E3    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D0E6    call        0046B7C8
 0047D0EB    mov         eax,dword ptr [ebp-4]
 0047D0EE    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D0F1    call        0046B660
 0047D0F6    lea         ecx,[ebp-14]
 0047D0F9    mov         eax,dword ptr [ebp-4]
 0047D0FC    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D0FF    lea         edx,[eax+18];TGLCoordinates.X:Single
 0047D102    mov         eax,dword ptr [ebp-4]
 0047D105    mov         eax,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047D108    add         eax,18;TGLCoordinates.X:Single
 0047D10B    call        0045CEDC
 0047D110    lea         eax,[ebp-14]
 0047D113    call        0045D420
 0047D118    fld         tbyte ptr ds:[47D1E0];1E-5:Extended
 0047D11E    fcompp
 0047D120    fnstsw      al
 0047D122    sahf
>0047D123    jbe         0047D166
 0047D125    lea         ecx,[ebp-14]
 0047D128    mov         eax,dword ptr [ebp-4]
 0047D12B    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D12E    lea         edx,[eax+18];TGLCoordinates.X:Single
 0047D131    mov         eax,[005AE214];^gvar_005ACF44
 0047D136    call        0045CEDC
 0047D13B    lea         eax,[ebp-14]
 0047D13E    call        0045D420
 0047D143    fld         tbyte ptr ds:[47D1E0];1E-5:Extended
 0047D149    fcompp
 0047D14B    fnstsw      al
 0047D14D    sahf
>0047D14E    jbe         0047D166
 0047D150    lea         ecx,[ebp-14]
 0047D153    mov         eax,dword ptr [ebp-4]
 0047D156    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D159    lea         edx,[eax+18];TGLCoordinates.X:Single
 0047D15C    mov         eax,[005AE3CC];^gvar_005ACF24
 0047D161    call        0045CEDC
 0047D166    lea         ecx,[ebp-24]
 0047D169    lea         edx,[ebp-14]
 0047D16C    mov         eax,dword ptr [ebp-4]
 0047D16F    mov         eax,dword ptr [eax+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047D172    add         eax,18;TGLCoordinates.X:Single
 0047D175    call        0045CEDC
 0047D17A    lea         edx,[ebp-24]
 0047D17D    mov         eax,dword ptr [ebp-4]
 0047D180    mov         eax,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047D183    call        0046B7C8
 0047D188    mov         eax,dword ptr [ebp-4]
 0047D18B    mov         eax,dword ptr [eax+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047D18E    call        0046B660
>0047D193    jmp         0047D1B0
 0047D195    mov         eax,dword ptr [ebp-4]
 0047D198    mov         eax,dword ptr [eax+70];TGLBaseSceneObject.?f70:TGLCoordinates
 0047D19B    cmp         edx,eax
>0047D19D    jne         0047D1B0
 0047D19F    push        dword ptr [eax+18];TGLCoordinates.X:Single
 0047D1A2    push        dword ptr [eax+1C];TGLCoordinates.Y:Single
 0047D1A5    push        dword ptr [eax+20];TGLCoordinates.Z:Single
 0047D1A8    mov         eax,dword ptr [ebp-4]
 0047D1AB    call        0047C4DC
 0047D1B0    mov         eax,dword ptr [ebp-4]
 0047D1B3    call        0047CF48
 0047D1B8    xor         eax,eax
 0047D1BA    pop         edx
 0047D1BB    pop         ecx
 0047D1BC    pop         ecx
 0047D1BD    mov         dword ptr fs:[eax],edx
 0047D1C0    push        47D1D4
 0047D1C5    mov         eax,dword ptr [ebp-4]
 0047D1C8    mov         byte ptr [eax+74],0;TGLBaseSceneObject.?f74:byte
 0047D1CC    ret
>0047D1CD    jmp         @HandleFinally
>0047D1D2    jmp         0047D1C5
 0047D1D4    pop         ebx
 0047D1D5    mov         esp,ebp
 0047D1D7    pop         ebp
 0047D1D8    ret
end;*}

//0047D1EC
{*procedure sub_0047D1EC(?:?);
begin
 0047D1EC    push        ebx
 0047D1ED    push        esi
 0047D1EE    push        edi
 0047D1EF    mov         edi,edx
 0047D1F1    mov         ebx,eax
 0047D1F3    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D1F6    test        eax,eax
>0047D1F8    je          0047D219
 0047D1FA    mov         esi,dword ptr [eax+0C];TPersistentObjectList.?fC:dword
 0047D1FD    dec         esi
 0047D1FE    cmp         esi,0
>0047D201    jl          0047D219
 0047D203    mov         edx,edi
 0047D205    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D208    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 0047D20B    mov         eax,dword ptr [eax+esi*4]
 0047D20E    mov         ecx,dword ptr [eax]
 0047D210    call        dword ptr [ecx+30]
 0047D213    dec         esi
 0047D214    cmp         esi,0FFFFFFFF
>0047D217    jne         0047D203
 0047D219    mov         eax,dword ptr [ebx+80];TGLBaseSceneObject.?f80:TGLBehaviours
 0047D21F    test        eax,eax
>0047D221    je          0047D22A
 0047D223    mov         edx,edi
 0047D225    call        0047DFD4
 0047D22A    mov         eax,dword ptr [ebx+84];TGLBaseSceneObject.?f84:TGLObjectEffects
 0047D230    test        eax,eax
>0047D232    je          0047D23B
 0047D234    mov         edx,edi
 0047D236    call        0047E224
 0047D23B    cmp         word ptr [ebx+7A],0;TGLBaseSceneObject.?f7A:word
>0047D240    je          0047D255
 0047D242    push        dword ptr [edi+4]
 0047D245    push        dword ptr [edi]
 0047D247    push        dword ptr [edi+0C]
 0047D24A    push        dword ptr [edi+8]
 0047D24D    mov         edx,ebx
 0047D24F    mov         eax,dword ptr [ebx+7C];TGLBaseSceneObject.?f7C:dword
 0047D252    call        dword ptr [ebx+78]
 0047D255    pop         edi
 0047D256    pop         esi
 0047D257    pop         ebx
 0047D258    ret
end;*}

//0047D25C
{*procedure TGLBaseSceneObject.sub_0047D25C(?:?; ?:?);
begin
 0047D25C    push        ebx
 0047D25D    push        esi
 0047D25E    push        edi
 0047D25F    push        ebp
 0047D260    push        ecx
 0047D261    mov         ebx,ecx
 0047D263    mov         dword ptr [esp],edx
 0047D266    mov         edi,eax
 0047D268    cmp         dword ptr [edi+60],0;TGLBaseSceneObject.?f60:TPersistentObjectList
>0047D26C    jne         0047D27D
 0047D26E    mov         dl,1
 0047D270    mov         eax,[00466194];TPersistentObjectList
 0047D275    call        TPersistentObjectList.Create;TPersistentObjectList.Create
 0047D27A    mov         dword ptr [edi+60],eax;TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D27D    mov         ebp,dword ptr [edi+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D280    mov         eax,dword ptr [ebx+58]
 0047D283    test        eax,eax
>0047D285    je          0047D294
 0047D287    xor         ecx,ecx
 0047D289    mov         edx,ebx
 0047D28B    mov         si,0FFE9
 0047D28F    call        @CallDynaInst
 0047D294    mov         ecx,ebx
 0047D296    mov         edx,dword ptr [esp]
 0047D299    mov         eax,ebp
 0047D29B    call        00466F40
 0047D2A0    mov         dword ptr [ebx+58],edi
 0047D2A3    mov         eax,dword ptr [ebx+5C]
 0047D2A6    cmp         eax,dword ptr [edi+5C];TGLBaseSceneObject.?f5C:TComponent
>0047D2A9    je          0047D2B2
 0047D2AB    mov         eax,ebx
 0047D2AD    call        0047B64C
 0047D2B2    mov         edx,dword ptr [edi+5C];TGLBaseSceneObject.?f5C:TComponent
 0047D2B5    mov         eax,ebx
 0047D2B7    call        0047DCE4
 0047D2BC    mov         eax,dword ptr [edi+5C];TGLBaseSceneObject.?f5C:TComponent
 0047D2BF    test        eax,eax
>0047D2C1    je          0047D2CA
 0047D2C3    mov         edx,ebx
 0047D2C5    call        0047FE54
 0047D2CA    mov         eax,ebx
 0047D2CC    call        0047CF48
 0047D2D1    pop         edx
 0047D2D2    pop         ebp
 0047D2D3    pop         edi
 0047D2D4    pop         esi
 0047D2D5    pop         ebx
 0047D2D6    ret
end;*}

//0047D2D8
{*procedure TGLBaseSceneObject.sub_0047D2D8(?:?; ?:?);
begin
 0047D2D8    push        ebx
 0047D2D9    push        esi
 0047D2DA    push        edi
 0047D2DB    push        ebp
 0047D2DC    mov         ebx,ecx
 0047D2DE    mov         ebp,edx
 0047D2E0    mov         edi,eax
 0047D2E2    cmp         dword ptr [edi+60],0;TGLBaseSceneObject.?f60:TPersistentObjectList
>0047D2E6    je          0047D356
 0047D2E8    cmp         edi,dword ptr [ebp+58]
>0047D2EB    jne         0047D356
 0047D2ED    mov         eax,dword ptr [edi+5C];TGLBaseSceneObject.?f5C:TComponent
 0047D2F0    test        eax,eax
>0047D2F2    je          0047D2FB
 0047D2F4    mov         edx,ebp
 0047D2F6    call        0047FEA4
 0047D2FB    cmp         edi,dword ptr [ebp+4]
>0047D2FE    jne         0047D309
 0047D300    mov         edx,ebp
 0047D302    mov         eax,edi
 0047D304    call        TComponent.RemoveComponent
 0047D309    mov         edx,ebp
 0047D30B    mov         eax,dword ptr [edi+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D30E    call        00466F94
 0047D313    xor         eax,eax
 0047D315    mov         dword ptr [ebp+58],eax
 0047D318    test        bl,bl
>0047D31A    je          0047D34D
 0047D31C    mov         eax,edi
 0047D31E    mov         edx,dword ptr [eax]
 0047D320    call        dword ptr [edx+5C];TGLBaseSceneObject.sub_0047B688
>0047D323    jmp         0047D339
 0047D325    xor         edx,edx
 0047D327    mov         eax,ebp
 0047D329    call        0047BA74
 0047D32E    mov         edx,edi
 0047D330    mov         si,0FFE8
 0047D334    call        @CallDynaInst
 0047D339    mov         eax,ebp
 0047D33B    call        0047BA94
 0047D340    test        eax,eax
>0047D342    jg          0047D325
 0047D344    mov         eax,edi
 0047D346    mov         edx,dword ptr [eax]
 0047D348    call        dword ptr [edx+60];TGLBaseSceneObject.sub_0047B68C
>0047D34B    jmp         0047D356
 0047D34D    mov         edx,edi
 0047D34F    mov         eax,edi
 0047D351    mov         ecx,dword ptr [eax]
 0047D353    call        dword ptr [ecx+34];TGLBaseSceneObject.sub_0047DACC
 0047D356    pop         ebp
 0047D357    pop         edi
 0047D358    pop         esi
 0047D359    pop         ebx
 0047D35A    ret
end;*}

//0047D35C
{*function sub_0047D35C(?:?; ?:AnsiString; ?:?):?;
begin
 0047D35C    push        ebx
 0047D35D    push        esi
 0047D35E    push        edi
 0047D35F    push        ebp
 0047D360    add         esp,0FFFFFFF4
 0047D363    mov         byte ptr [esp+4],cl
 0047D367    mov         dword ptr [esp],edx
 0047D36A    mov         edi,eax
 0047D36C    xor         eax,eax
 0047D36E    mov         dword ptr [esp+8],eax
 0047D372    xor         ebp,ebp
 0047D374    mov         eax,dword ptr [edi+60]
 0047D377    test        eax,eax
>0047D379    je          0047D3F0
 0047D37B    mov         ebx,dword ptr [eax+0C]
 0047D37E    dec         ebx
 0047D37F    test        ebx,ebx
>0047D381    jl          0047D3B3
 0047D383    inc         ebx
 0047D384    xor         esi,esi
 0047D386    mov         eax,dword ptr [edi+60]
 0047D389    mov         edx,esi
 0047D38B    call        00466EF0
 0047D390    mov         eax,dword ptr [eax+8]
 0047D393    mov         edx,dword ptr [esp]
 0047D396    call        CompareText
 0047D39B    test        eax,eax
>0047D39D    jne         0047D3AF
 0047D39F    mov         eax,dword ptr [edi+60]
 0047D3A2    mov         edx,esi
 0047D3A4    call        00466EF0
 0047D3A9    mov         dword ptr [esp+8],eax
>0047D3AD    jmp         0047D3B3
 0047D3AF    inc         esi
 0047D3B0    dec         ebx
>0047D3B1    jne         0047D386
 0047D3B3    cmp         byte ptr [esp+4],0
>0047D3B8    jne         0047D3E8
 0047D3BA    mov         eax,dword ptr [edi+60]
 0047D3BD    mov         ebx,dword ptr [eax+0C]
 0047D3C0    dec         ebx
 0047D3C1    test        ebx,ebx
>0047D3C3    jl          0047D3E8
 0047D3C5    inc         ebx
 0047D3C6    xor         esi,esi
 0047D3C8    mov         eax,dword ptr [edi+60]
 0047D3CB    mov         edx,esi
 0047D3CD    call        00466EF0
 0047D3D2    mov         cl,byte ptr [esp+4]
 0047D3D6    mov         edx,dword ptr [esp]
 0047D3D9    call        0047D35C
 0047D3DE    mov         ebp,eax
 0047D3E0    test        ebp,ebp
>0047D3E2    jne         0047D3E8
 0047D3E4    inc         esi
 0047D3E5    dec         ebx
>0047D3E6    jne         0047D3C8
 0047D3E8    test        ebp,ebp
>0047D3EA    jne         0047D3F0
 0047D3EC    mov         ebp,dword ptr [esp+8]
 0047D3F0    mov         eax,ebp
 0047D3F2    add         esp,0C
 0047D3F5    pop         ebp
 0047D3F6    pop         edi
 0047D3F7    pop         esi
 0047D3F8    pop         ebx
 0047D3F9    ret
end;*}

//0047D3FC
{*procedure sub_0047D3FC(?:?; ?:Byte);
begin
 0047D3FC    push        ebx
 0047D3FD    push        esi
 0047D3FE    push        edi
 0047D3FF    add         esp,0FFFFFF54
 0047D405    mov         esi,edx
 0047D407    mov         edi,eax
 0047D409    mov         al,byte ptr [esi+5A]
 0047D40C    mov         edx,eax
 0047D40E    add         dl,0FE
 0047D411    sub         dl,2
>0047D414    jae         0047D4AE
 0047D41A    cmp         al,2
>0047D41C    jne         0047D463
 0047D41E    test        byte ptr [edi+3C],8
>0047D422    jne         0047D457
 0047D424    mov         eax,edi
 0047D426    call        0047BF80
 0047D42B    add         esp,0FFFFFFFC
 0047D42E    fstp        dword ptr [esp]
 0047D431    wait
 0047D432    lea         edx,[esp+0A0]
 0047D439    mov         eax,edi
 0047D43B    call        0047BD64
 0047D440    lea         eax,[esp+0A0]
 0047D447    lea         edx,[esi+60]
 0047D44A    call        0045FD40
 0047D44F    test        al,al
>0047D451    je          0047D457
 0047D453    xor         ebx,ebx
>0047D455    jmp         0047D459
 0047D457    mov         bl,1
 0047D459    cmp         dword ptr [edi+60],0
 0047D45D    setne       byte ptr [esp]
>0047D461    jmp         0047D4A1
 0047D463    lea         edx,[esp+4]
 0047D467    mov         eax,edi
 0047D469    call        0047BE74
 0047D46E    test        byte ptr [edi+3C],8
>0047D472    jne         0047D48C
 0047D474    lea         ecx,[esi+60]
 0047D477    lea         edx,[esp+10]
 0047D47B    lea         eax,[esp+4]
 0047D47F    call        0045FDDC
 0047D484    test        al,al
>0047D486    je          0047D48C
 0047D488    xor         ebx,ebx
>0047D48A    jmp         0047D48E
 0047D48C    mov         bl,1
 0047D48E    test        bl,bl
>0047D490    je          0047D498
 0047D492    cmp         dword ptr [edi+60],0
>0047D496    jne         0047D49C
 0047D498    xor         eax,eax
>0047D49A    jmp         0047D49E
 0047D49C    mov         al,1
 0047D49E    mov         byte ptr [esp],al
 0047D4A1    mov         al,byte ptr [esp]
 0047D4A4    or          al,bl
>0047D4A6    je          0047D6E4
>0047D4AC    jmp         0047D4D0
 0047D4AE    sub         al,2
>0047D4B0    jb          0047D4C6
 0047D4B2    mov         ecx,0FB5
 0047D4B7    mov         edx,47D6F8;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047D4BC    mov         eax,47D730;'Unknown visibility culling option'
 0047D4C1    call        @Assert
 0047D4C6    mov         bl,1
 0047D4C8    cmp         dword ptr [edi+60],0
 0047D4CC    setne       byte ptr [esp]
 0047D4D0    cmp         byte ptr ds:[5AD55C],0;gvar_005AD55C
>0047D4D7    je          0047D4EA
 0047D4D9    lea         eax,[esp+1C]
 0047D4DD    push        eax
 0047D4DE    push        0BA6
 0047D4E3    call        OpenGL32.glGetFloatv
>0047D4E8    jmp         0047D4EF
 0047D4EA    call        OpenGL32.glPushMatrix
 0047D4EF    test        byte ptr [edi+54],1
>0047D4F3    je          0047D4FC
 0047D4F5    mov         eax,edi
 0047D4F7    call        0047BB44
 0047D4FC    mov         eax,dword ptr [edi+38]
 0047D4FF    push        eax
 0047D500    call        OpenGL32.glMultMatrixf
 0047D505    cmp         byte ptr [esi+58],1
>0047D509    jne         0047D522
 0047D50B    cmp         byte ptr [esi+0F9],0
>0047D512    je          0047D51C
 0047D514    push        edi
 0047D515    call        OpenGL32.glPushName
>0047D51A    jmp         0047D522
 0047D51C    push        edi
 0047D51D    call        OpenGL32.glLoadName
 0047D522    test        bl,bl
>0047D524    je          0047D66D
 0047D52A    cmp         byte ptr [edi+6C],0
>0047D52E    je          0047D53D
 0047D530    mov         edx,esi
 0047D532    mov         cx,0CCCC
 0047D536    mov         eax,edi
 0047D538    call        0047BA10
 0047D53D    mov         eax,dword ptr [edi+84]
 0047D543    test        eax,eax
>0047D545    je          0047D623
 0047D54B    cmp         dword ptr [eax+0C],0
>0047D54F    jle         0047D623
 0047D555    cmp         byte ptr ds:[5AD55C],0;gvar_005AD55C
>0047D55C    je          0047D56F
 0047D55E    lea         eax,[esp+5C]
 0047D562    push        eax
 0047D563    push        0BA6
 0047D568    call        OpenGL32.glGetFloatv
>0047D56D    jmp         0047D574
 0047D56F    call        OpenGL32.glPushMatrix
 0047D574    mov         ecx,esi
 0047D576    mov         eax,dword ptr [edi+5C]
 0047D579    mov         edx,dword ptr [eax+4C]
 0047D57C    mov         eax,dword ptr [edi+84]
 0047D582    call        0047E250
 0047D587    cmp         byte ptr ds:[5AD55C],0;gvar_005AD55C
>0047D58E    je          0047D59C
 0047D590    lea         eax,[esp+5C]
 0047D594    push        eax
 0047D595    call        OpenGL32.glLoadMatrixf
>0047D59A    jmp         0047D5A6
 0047D59C    call        OpenGL32.glPopMatrix
 0047D5A1    call        OpenGL32.glPushMatrix
 0047D5A6    test        byte ptr [edi+3C],4
>0047D5AA    je          0047D5D1
 0047D5AC    mov         eax,dword ptr [esi+5C]
 0047D5AF    mov         dl,5
 0047D5B1    call        0046D634
 0047D5B6    mov         al,byte ptr [esp]
 0047D5B9    push        eax
 0047D5BA    mov         edx,esi
 0047D5BC    mov         cl,1
 0047D5BE    mov         eax,edi
 0047D5C0    mov         ebx,dword ptr [eax]
 0047D5C2    call        dword ptr [ebx+68]
 0047D5C5    mov         eax,dword ptr [esi+5C]
 0047D5C8    mov         dl,5
 0047D5CA    call        0046D5F8
>0047D5CF    jmp         0047D5E0
 0047D5D1    mov         al,byte ptr [esp]
 0047D5D4    push        eax
 0047D5D5    mov         edx,esi
 0047D5D7    mov         cl,1
 0047D5D9    mov         eax,edi
 0047D5DB    mov         ebx,dword ptr [eax]
 0047D5DD    call        dword ptr [ebx+68]
 0047D5E0    test        byte ptr [edi+3C],2
>0047D5E4    je          0047D5EE
 0047D5E6    mov         eax,dword ptr [esi+5C]
 0047D5E9    call        0046D994
 0047D5EE    mov         ecx,esi
 0047D5F0    mov         eax,dword ptr [edi+5C]
 0047D5F3    mov         edx,dword ptr [eax+4C]
 0047D5F6    mov         eax,dword ptr [edi+84]
 0047D5FC    call        0047E2A8
 0047D601    cmp         byte ptr ds:[5AD55C],0;gvar_005AD55C
>0047D608    je          0047D619
 0047D60A    lea         eax,[esp+5C]
 0047D60E    push        eax
 0047D60F    call        OpenGL32.glLoadMatrixf
>0047D614    jmp         0047D6B6
 0047D619    call        OpenGL32.glPopMatrix
>0047D61E    jmp         0047D6B6
 0047D623    test        byte ptr [edi+3C],4
>0047D627    je          0047D64E
 0047D629    mov         eax,dword ptr [esi+5C]
 0047D62C    mov         dl,5
 0047D62E    call        0046D634
 0047D633    mov         al,byte ptr [esp]
 0047D636    push        eax
 0047D637    mov         edx,esi
 0047D639    mov         cl,1
 0047D63B    mov         eax,edi
 0047D63D    mov         ebx,dword ptr [eax]
 0047D63F    call        dword ptr [ebx+68]
 0047D642    mov         eax,dword ptr [esi+5C]
 0047D645    mov         dl,5
 0047D647    call        0046D5F8
>0047D64C    jmp         0047D65D
 0047D64E    mov         al,byte ptr [esp]
 0047D651    push        eax
 0047D652    mov         edx,esi
 0047D654    mov         cl,1
 0047D656    mov         eax,edi
 0047D658    mov         ebx,dword ptr [eax]
 0047D65A    call        dword ptr [ebx+68]
 0047D65D    test        byte ptr [edi+3C],2
>0047D661    je          0047D6B6
 0047D663    mov         eax,dword ptr [esi+5C]
 0047D666    call        0046D994
>0047D66B    jmp         0047D6B6
 0047D66D    test        byte ptr [edi+3C],4
>0047D671    je          0047D6A7
 0047D673    mov         eax,dword ptr [edi+5C]
 0047D676    mov         eax,dword ptr [eax+4C]
 0047D679    cmp         byte ptr [eax+10F],0
>0047D680    je          0047D6A7
 0047D682    mov         eax,dword ptr [esi+5C]
 0047D685    mov         dl,5
 0047D687    call        0046D634
 0047D68C    mov         al,byte ptr [esp]
 0047D68F    push        eax
 0047D690    mov         edx,esi
 0047D692    xor         ecx,ecx
 0047D694    mov         eax,edi
 0047D696    mov         ebx,dword ptr [eax]
 0047D698    call        dword ptr [ebx+68]
 0047D69B    mov         eax,dword ptr [esi+5C]
 0047D69E    mov         dl,5
 0047D6A0    call        0046D5F8
>0047D6A5    jmp         0047D6B6
 0047D6A7    mov         al,byte ptr [esp]
 0047D6AA    push        eax
 0047D6AB    mov         edx,esi
 0047D6AD    xor         ecx,ecx
 0047D6AF    mov         eax,edi
 0047D6B1    mov         ebx,dword ptr [eax]
 0047D6B3    call        dword ptr [ebx+68]
 0047D6B6    cmp         byte ptr [esi+58],1
>0047D6BA    jne         0047D6CA
 0047D6BC    cmp         byte ptr [esi+0F9],0
>0047D6C3    je          0047D6CA
 0047D6C5    call        OpenGL32.glPopName
 0047D6CA    cmp         byte ptr ds:[5AD55C],0;gvar_005AD55C
>0047D6D1    je          0047D6DF
 0047D6D3    lea         eax,[esp+1C]
 0047D6D7    push        eax
 0047D6D8    call        OpenGL32.glLoadMatrixf
>0047D6DD    jmp         0047D6E4
 0047D6DF    call        OpenGL32.glPopMatrix
 0047D6E4    add         esp,0AC
 0047D6EA    pop         edi
 0047D6EB    pop         esi
 0047D6EC    pop         ebx
 0047D6ED    ret
end;*}

//0047D754
{*procedure sub_0047D754(?:?; ?:?; ?:?);
begin
 0047D754    push        ebp
 0047D755    mov         ebp,esp
 0047D757    push        ebx
 0047D758    push        esi
 0047D759    push        edi
 0047D75A    mov         edi,edx
 0047D75C    mov         esi,eax
 0047D75E    test        cl,cl
>0047D760    je          0047D78B
 0047D762    test        byte ptr [esi+3C],1;TGLBaseSceneObject.?f3C:byte
>0047D766    jne         0047D771
 0047D768    cmp         byte ptr [edi+0FC],0
>0047D76F    je          0047D77C
 0047D771    mov         edx,edi
 0047D773    mov         eax,esi
 0047D775    mov         ecx,dword ptr [eax]
 0047D777    call        dword ptr [ecx+64];TGLBaseSceneObject.sub_0047B730
>0047D77A    jmp         0047D78B
 0047D77C    mov         edx,edi
 0047D77E    mov         eax,esi
 0047D780    mov         ecx,dword ptr [eax]
 0047D782    call        dword ptr [ecx+44];TGLBaseSceneObject.sub_0047B5BC
 0047D785    push        eax
 0047D786    call        OpenGL32.glCallList
 0047D78B    cmp         byte ptr [ebp+8],0
>0047D78F    je          0047D7A5
 0047D791    push        edi
 0047D792    mov         eax,esi
 0047D794    call        0047BA94
 0047D799    mov         ecx,eax
 0047D79B    dec         ecx
 0047D79C    xor         edx,edx
 0047D79E    mov         eax,esi
 0047D7A0    mov         ebx,dword ptr [eax]
 0047D7A2    call        dword ptr [ebx+6C];TGLBaseSceneObject.sub_0047D7AC
 0047D7A5    pop         edi
 0047D7A6    pop         esi
 0047D7A7    pop         ebx
 0047D7A8    pop         ebp
 0047D7A9    ret         4
end;*}

//0047D7AC
{*procedure sub_0047D7AC(?:?; ?:?; ?:?);
begin
 0047D7AC    push        ebp
 0047D7AD    mov         ebp,esp
 0047D7AF    add         esp,0FFFFFFF0
 0047D7B2    push        ebx
 0047D7B3    push        esi
 0047D7B4    push        edi
 0047D7B5    mov         edi,ecx
 0047D7B7    mov         esi,edx
 0047D7B9    mov         ebx,eax
 0047D7BB    cmp         dword ptr [ebx+60],0;TGLBaseSceneObject.?f60:TPersistentObjectList
>0047D7BF    je          0047DA66
 0047D7C5    mov         eax,dword ptr [ebp+8]
 0047D7C8    mov         al,byte ptr [eax+5A]
 0047D7CB    mov         byte ptr [ebp-0A],al
 0047D7CE    mov         al,byte ptr [ebx+76];TGLBaseSceneObject.?f76:byte
 0047D7D1    test        al,al
>0047D7D3    je          0047D7DB
 0047D7D5    mov         edx,dword ptr [ebp+8]
 0047D7D8    mov         byte ptr [edx+5A],al
 0047D7DB    cmp         esi,edi
>0047D7DD    jne         0047D801
 0047D7DF    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D7E2    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 0047D7E5    mov         esi,dword ptr [eax+esi*4]
 0047D7E8    cmp         byte ptr [esi+64],0
>0047D7EC    je          0047DA5D
 0047D7F2    mov         edx,dword ptr [ebp+8]
 0047D7F5    mov         eax,esi
 0047D7F7    call        0047D3FC
>0047D7FC    jmp         0047DA5D
 0047D801    cmp         esi,edi
>0047D803    jge         0047DA5D
 0047D809    mov         eax,dword ptr [ebp+8]
 0047D80C    mov         al,byte ptr [eax+59]
 0047D80F    mov         byte ptr [ebp-9],al
 0047D812    mov         al,byte ptr [ebx+75];TGLBaseSceneObject.?f75:byte
 0047D815    test        al,al
>0047D817    je          0047D81F
 0047D819    mov         edx,dword ptr [ebp+8]
 0047D81C    mov         byte ptr [edx+59],al
 0047D81F    mov         eax,dword ptr [ebp+8]
 0047D822    mov         al,byte ptr [eax+59]
 0047D825    dec         al
>0047D827    je          0047D833
 0047D829    dec         eax
 0047D82A    sub         al,3
>0047D82C    jb          0047D865
>0047D82E    jmp         0047DA40
 0047D833    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D836    mov         ebx,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 0047D839    sub         edi,esi
>0047D83B    jl          0047DA54
 0047D841    inc         edi
 0047D842    mov         dword ptr [ebp-10],edi
 0047D845    mov         edi,esi
 0047D847    mov         esi,dword ptr [ebx+edi*4]
 0047D84A    cmp         byte ptr [esi+64],0
>0047D84E    je          0047D85A
 0047D850    mov         edx,dword ptr [ebp+8]
 0047D853    mov         eax,esi
 0047D855    call        0047D3FC
 0047D85A    inc         edi
 0047D85B    dec         dword ptr [ebp-10]
>0047D85E    jne         0047D847
>0047D860    jmp         0047DA54
 0047D865    mov         dl,1
 0047D867    mov         eax,[00467CC0];TSingleList
 0047D86C    call        TSingleList.Create;TSingleList.Create
 0047D871    mov         dword ptr [ebp-8],eax
 0047D874    mov         dl,1
 0047D876    mov         eax,[00466194];TPersistentObjectList
 0047D87B    call        TPersistentObjectList.Create;TPersistentObjectList.Create
 0047D880    mov         dword ptr [ebp-4],eax
 0047D883    lea         eax,[edi+1]
 0047D886    mov         edx,dword ptr [ebp-8]
 0047D889    mov         dword ptr [edx+10],eax;TSingleList.?f10:dword
 0047D88C    mov         edx,dword ptr [ebp-4]
 0047D88F    mov         dword ptr [edx+14],eax;TPersistentObjectList.?f14:dword
 0047D892    xor         edx,edx
 0047D894    push        ebp
 0047D895    push        47DA39
 0047D89A    push        dword ptr fs:[edx]
 0047D89D    mov         dword ptr fs:[edx],esp
 0047D8A0    mov         eax,dword ptr [ebp+8]
 0047D8A3    mov         al,byte ptr [eax+59]
 0047D8A6    sub         al,2
>0047D8A8    je          0047D926
 0047D8AA    dec         al
>0047D8AC    je          0047D8BB
 0047D8AE    dec         al
>0047D8B0    je          0047D977
>0047D8B6    jmp         0047D9C4
 0047D8BB    sub         edi,esi
>0047D8BD    jl          0047D9D8
 0047D8C3    inc         edi
 0047D8C4    mov         dword ptr [ebp-10],edi
 0047D8C7    mov         edi,esi
 0047D8C9    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D8CC    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 0047D8CF    mov         esi,dword ptr [eax+edi*4]
 0047D8D2    cmp         byte ptr [esi+64],0
>0047D8D6    je          0047D91B
 0047D8D8    mov         eax,esi
 0047D8DA    mov         edx,dword ptr [eax]
 0047D8DC    call        dword ptr [edx+40]
 0047D8DF    test        al,al
>0047D8E1    jne         0047D8EF
 0047D8E3    mov         edx,dword ptr [ebp+8]
 0047D8E6    mov         eax,esi
 0047D8E8    call        0047D3FC
>0047D8ED    jmp         0047D91B
 0047D8EF    mov         edx,esi
 0047D8F1    mov         eax,dword ptr [ebp-4]
 0047D8F4    call        00466E24
 0047D8F9    mov         edx,dword ptr [ebp+8]
 0047D8FC    add         edx,8
 0047D8FF    mov         eax,esi
 0047D901    call        0047BE0C
 0047D906    fadd        dword ptr ds:[47DA70];1:Single
 0047D90C    add         esp,0FFFFFFFC
 0047D90F    fstp        dword ptr [esp]
 0047D912    wait
 0047D913    mov         eax,dword ptr [ebp-8]
 0047D916    call        0046935C
 0047D91B    inc         edi
 0047D91C    dec         dword ptr [ebp-10]
>0047D91F    jne         0047D8C9
>0047D921    jmp         0047D9D8
 0047D926    sub         edi,esi
>0047D928    jl          0047D9D8
 0047D92E    inc         edi
 0047D92F    mov         dword ptr [ebp-10],edi
 0047D932    mov         edi,esi
 0047D934    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D937    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 0047D93A    mov         esi,dword ptr [eax+edi*4]
 0047D93D    cmp         byte ptr [esi+64],0
>0047D941    je          0047D96F
 0047D943    mov         edx,esi
 0047D945    mov         eax,dword ptr [ebp-4]
 0047D948    call        00466E24
 0047D94D    mov         edx,dword ptr [ebp+8]
 0047D950    add         edx,8
 0047D953    mov         eax,esi
 0047D955    call        0047BE0C
 0047D95A    fadd        dword ptr ds:[47DA70];1:Single
 0047D960    add         esp,0FFFFFFFC
 0047D963    fstp        dword ptr [esp]
 0047D966    wait
 0047D967    mov         eax,dword ptr [ebp-8]
 0047D96A    call        0046935C
 0047D96F    inc         edi
 0047D970    dec         dword ptr [ebp-10]
>0047D973    jne         0047D934
>0047D975    jmp         0047D9D8
 0047D977    sub         edi,esi
>0047D979    jl          0047D9D8
 0047D97B    inc         edi
 0047D97C    mov         dword ptr [ebp-10],edi
 0047D97F    mov         edi,esi
 0047D981    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047D984    mov         eax,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 0047D987    mov         esi,dword ptr [eax+edi*4]
 0047D98A    cmp         byte ptr [esi+64],0
>0047D98E    je          0047D9BC
 0047D990    mov         edx,esi
 0047D992    mov         eax,dword ptr [ebp-4]
 0047D995    call        00466E24
 0047D99A    mov         edx,dword ptr [ebp+8]
 0047D99D    add         edx,8
 0047D9A0    mov         eax,esi
 0047D9A2    call        0047BE0C
 0047D9A7    fsubr       dword ptr ds:[47DA74];-1:Single
 0047D9AD    add         esp,0FFFFFFFC
 0047D9B0    fstp        dword ptr [esp]
 0047D9B3    wait
 0047D9B4    mov         eax,dword ptr [ebp-8]
 0047D9B7    call        0046935C
 0047D9BC    inc         edi
 0047D9BD    dec         dword ptr [ebp-10]
>0047D9C0    jne         0047D981
>0047D9C2    jmp         0047D9D8
 0047D9C4    mov         ecx,1052
 0047D9C9    mov         edx,47DA80;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047D9CE    mov         eax,47DAB8;'Assertion failure'
 0047D9D3    call        @Assert
 0047D9D8    mov         eax,dword ptr [ebp-8]
 0047D9DB    mov         eax,dword ptr [eax+8];TSingleList.?f8:dword
 0047D9DE    test        eax,eax
>0047D9E0    jle         0047DA1B
 0047D9E2    cmp         eax,1
>0047D9E5    jle         0047D9F8
 0047D9E7    mov         edx,dword ptr [ebp-4]
 0047D9EA    push        edx
 0047D9EB    mov         edx,eax
 0047D9ED    dec         edx
 0047D9EE    mov         ecx,dword ptr [ebp-8]
 0047D9F1    xor         eax,eax
 0047D9F3    call        00467EC0
 0047D9F8    mov         eax,dword ptr [ebp-4]
 0047D9FB    mov         ebx,dword ptr [eax+8];TPersistentObjectList.?f8:dword
 0047D9FE    mov         eax,dword ptr [ebp-4]
 0047DA01    mov         edi,dword ptr [eax+0C];TPersistentObjectList.?fC:dword
 0047DA04    dec         edi
 0047DA05    cmp         edi,0
>0047DA08    jl          0047DA1B
 0047DA0A    mov         eax,dword ptr [ebx+edi*4]
 0047DA0D    mov         edx,dword ptr [ebp+8]
 0047DA10    call        0047D3FC
 0047DA15    dec         edi
 0047DA16    cmp         edi,0FFFFFFFF
>0047DA19    jne         0047DA0A
 0047DA1B    xor         eax,eax
 0047DA1D    pop         edx
 0047DA1E    pop         ecx
 0047DA1F    pop         ecx
 0047DA20    mov         dword ptr fs:[eax],edx
 0047DA23    push        47DA54
 0047DA28    mov         eax,dword ptr [ebp-4]
 0047DA2B    call        TObject.Free
 0047DA30    mov         eax,dword ptr [ebp-8]
 0047DA33    call        TObject.Free
 0047DA38    ret
>0047DA39    jmp         @HandleFinally
>0047DA3E    jmp         0047DA28
 0047DA40    mov         ecx,1061
 0047DA45    mov         edx,47DA80;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047DA4A    mov         eax,47DAB8;'Assertion failure'
 0047DA4F    call        @Assert
 0047DA54    mov         eax,dword ptr [ebp+8]
 0047DA57    mov         dl,byte ptr [ebp-9]
 0047DA5A    mov         byte ptr [eax+59],dl
 0047DA5D    mov         eax,dword ptr [ebp+8]
 0047DA60    mov         dl,byte ptr [ebp-0A]
 0047DA63    mov         byte ptr [eax+5A],dl
 0047DA66    pop         edi
 0047DA67    pop         esi
 0047DA68    pop         ebx
 0047DA69    mov         esp,ebp
 0047DA6B    pop         ebp
 0047DA6C    ret         4
end;*}

//0047DACC
procedure sub_0047DACC;
begin
{*
 0047DACC    push        ebx
 0047DACD    mov         ebx,eax
 0047DACF    cmp         dword ptr [ebx+5C],0;TGLBaseSceneObject.?f5C:TComponent
>0047DAD3    je          0047DAEA
 0047DAD5    mov         eax,ebx
 0047DAD7    call        0047C424
 0047DADC    test        al,al
>0047DADE    jne         0047DAEA
 0047DAE0    mov         edx,ebx
 0047DAE2    mov         eax,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047DAE5    mov         ecx,dword ptr [eax]
 0047DAE7    call        dword ptr [ecx+34]
 0047DAEA    pop         ebx
 0047DAEB    ret
*}
end;

//0047DAEC
{*procedure sub_0047DAEC(?:?; ?:?);
begin
 0047DAEC    push        ebx
 0047DAED    push        esi
 0047DAEE    push        edi
 0047DAEF    mov         esi,edx
 0047DAF1    mov         ebx,eax
 0047DAF3    mov         eax,ebx
 0047DAF5    call        0047BB44
 0047DAFA    mov         eax,dword ptr [ebx+38]
 0047DAFD    mov         edi,esi
 0047DAFF    mov         esi,eax
 0047DB01    mov         ecx,10
 0047DB06    rep movs    dword ptr [edi],dword ptr [esi]
 0047DB08    pop         edi
 0047DB09    pop         esi
 0047DB0A    pop         ebx
 0047DB0B    ret
end;*}

//0047DB0C
{*function sub_0047DB0C(?:TGLBaseSceneObject):?;
begin
 0047DB0C    push        ebx
 0047DB0D    mov         ebx,eax
 0047DB0F    mov         eax,ebx
 0047DB11    call        0047BB44
 0047DB16    mov         eax,dword ptr [ebx+38]
 0047DB19    pop         ebx
 0047DB1A    ret
end;*}

//0047DB1C
{*procedure sub_0047DB1C(?:TGLBaseSceneObject; ?:?);
begin
 0047DB1C    push        ebx
 0047DB1D    push        esi
 0047DB1E    push        edi
 0047DB1F    add         esp,0FFFFFFF0
 0047DB22    mov         ebx,eax
 0047DB24    mov         esi,dword ptr [ebx+38];TGLBaseSceneObject.?f38:Pointer
 0047DB27    push        esi
 0047DB28    mov         edi,esi
 0047DB2A    mov         esi,edx
 0047DB2C    mov         ecx,10
 0047DB31    rep movs    dword ptr [edi],dword ptr [esi]
 0047DB33    pop         esi
 0047DB34    mov         edx,esp
 0047DB36    lea         eax,[esi+20]
 0047DB39    call        0045D674
 0047DB3E    mov         edx,esp
 0047DB40    mov         eax,dword ptr [ebx+48];TGLBaseSceneObject.?f48:TGLCoordinates
 0047DB43    call        0046B7C8
 0047DB48    mov         edx,esp
 0047DB4A    mov         eax,dword ptr [ebx+38];TGLBaseSceneObject.?f38:Pointer
 0047DB4D    add         eax,10
 0047DB50    call        0045D674
 0047DB55    mov         edx,esp
 0047DB57    mov         eax,dword ptr [ebx+4C];TGLBaseSceneObject.?f4C:TGLCoordinates
 0047DB5A    call        0046B7C8
 0047DB5F    mov         eax,dword ptr [ebx+38];TGLBaseSceneObject.?f38:Pointer
 0047DB62    call        0045D420
 0047DB67    add         esp,0FFFFFFFC
 0047DB6A    fstp        dword ptr [esp]
 0047DB6D    wait
 0047DB6E    mov         eax,dword ptr [ebx+38];TGLBaseSceneObject.?f38:Pointer
 0047DB71    add         eax,10
 0047DB74    call        0045D420
 0047DB79    add         esp,0FFFFFFFC
 0047DB7C    fstp        dword ptr [esp]
 0047DB7F    wait
 0047DB80    mov         eax,dword ptr [ebx+38];TGLBaseSceneObject.?f38:Pointer
 0047DB83    add         eax,20
 0047DB86    call        0045D420
 0047DB8B    add         esp,0FFFFFFFC
 0047DB8E    fstp        dword ptr [esp]
 0047DB91    wait
 0047DB92    push        0
 0047DB94    mov         eax,dword ptr [ebx+50];TGLBaseSceneObject.?f50:TGLCoordinates
 0047DB97    call        0046B730
 0047DB9C    mov         eax,dword ptr [ebx+38];TGLBaseSceneObject.?f38:Pointer
 0047DB9F    lea         edx,[eax+30]
 0047DBA2    mov         eax,dword ptr [ebx+44];TGLBaseSceneObject.?f44:TGLCoordinates
 0047DBA5    call        0046B7C8
 0047DBAA    mov         eax,ebx
 0047DBAC    call        0047CF48
 0047DBB1    add         esp,10
 0047DBB4    pop         edi
 0047DBB5    pop         esi
 0047DBB6    pop         ebx
 0047DBB7    ret
end;*}

//0047DBB8
procedure TGLImmaterialSceneObject.SetPosition(Value:TGLCoordinates);
begin
{*
 0047DBB8    push        dword ptr [edx+18];TGLCoordinates.X:Single
 0047DBBB    push        dword ptr [edx+1C];TGLCoordinates.Y:Single
 0047DBBE    push        dword ptr [edx+20];TGLCoordinates.Z:Single
 0047DBC1    mov         eax,dword ptr [eax+44];TGLImmaterialSceneObject.?f44:TGLCoordinates
 0047DBC4    call        0046B7E0
 0047DBC9    ret
*}
end;

//0047DBCC
procedure TGLImmaterialSceneObject.SetDirection(Value:TGLCoordinates);
begin
{*
 0047DBCC    push        ebx
 0047DBCD    push        esi
 0047DBCE    mov         ebx,edx
 0047DBD0    mov         esi,eax
 0047DBD2    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047DBD5    call        0045D8D4
 0047DBDA    test        al,al
>0047DBDC    jne         0047DBEF
 0047DBDE    push        dword ptr [ebx+18];TGLCoordinates.X:Single
 0047DBE1    push        dword ptr [ebx+1C];TGLCoordinates.Y:Single
 0047DBE4    push        dword ptr [ebx+20];TGLCoordinates.Z:Single
 0047DBE7    mov         eax,dword ptr [esi+48];TGLImmaterialSceneObject.?f48:TGLCoordinates
 0047DBEA    call        0046B698
 0047DBEF    pop         esi
 0047DBF0    pop         ebx
 0047DBF1    ret
*}
end;

//0047DBF4
procedure TGLImmaterialSceneObject.SetUp(Value:TGLCoordinates);
begin
{*
 0047DBF4    push        ebx
 0047DBF5    push        esi
 0047DBF6    mov         ebx,edx
 0047DBF8    mov         esi,eax
 0047DBFA    lea         eax,[ebx+18];TGLCoordinates.X:Single
 0047DBFD    call        0045D8D4
 0047DC02    test        al,al
>0047DC04    jne         0047DC17
 0047DC06    push        dword ptr [ebx+18];TGLCoordinates.X:Single
 0047DC09    push        dword ptr [ebx+1C];TGLCoordinates.Y:Single
 0047DC0C    push        dword ptr [ebx+20];TGLCoordinates.Z:Single
 0047DC0F    mov         eax,dword ptr [esi+4C];TGLImmaterialSceneObject.?f4C:TGLCoordinates
 0047DC12    call        0046B698
 0047DC17    pop         esi
 0047DC18    pop         ebx
 0047DC19    ret
*}
end;

//0047DC1C
procedure TGLImmaterialSceneObject.SetVisible(Value:Boolean);
begin
{*
 0047DC1C    push        esi
 0047DC1D    mov         esi,eax
 0047DC1F    cmp         dl,byte ptr [esi+64];TGLImmaterialSceneObject.?f64:byte
>0047DC22    je          0047DC30
 0047DC24    mov         byte ptr [esi+64],dl;TGLImmaterialSceneObject.?f64:byte
 0047DC27    mov         edx,esi
 0047DC29    mov         eax,esi
 0047DC2B    mov         ecx,dword ptr [eax]
 0047DC2D    call        dword ptr [ecx+34];TGLImmaterialSceneObject.sub_0047DACC
 0047DC30    pop         esi
 0047DC31    ret
*}
end;

//0047DC34
procedure TGLImmaterialSceneObject.SetObjectsSorting(Value:TGLObjectsSorting);
begin
{*
 0047DC34    push        esi
 0047DC35    mov         esi,eax
 0047DC37    cmp         dl,byte ptr [esi+75];TGLImmaterialSceneObject.?f75:byte
>0047DC3A    je          0047DC48
 0047DC3C    mov         byte ptr [esi+75],dl;TGLImmaterialSceneObject.?f75:byte
 0047DC3F    mov         edx,esi
 0047DC41    mov         eax,esi
 0047DC43    mov         ecx,dword ptr [eax]
 0047DC45    call        dword ptr [ecx+34];TGLImmaterialSceneObject.sub_0047DACC
 0047DC48    pop         esi
 0047DC49    ret
*}
end;

//0047DC4C
procedure TGLImmaterialSceneObject.SetVisibilityCulling(Value:TGLVisibilityCulling);
begin
{*
 0047DC4C    push        esi
 0047DC4D    mov         esi,eax
 0047DC4F    cmp         dl,byte ptr [esi+76];TGLImmaterialSceneObject.?f76:byte
>0047DC52    je          0047DC60
 0047DC54    mov         byte ptr [esi+76],dl;TGLImmaterialSceneObject.?f76:byte
 0047DC57    mov         edx,esi
 0047DC59    mov         eax,esi
 0047DC5B    mov         ecx,dword ptr [eax]
 0047DC5D    call        dword ptr [ecx+34];TGLImmaterialSceneObject.sub_0047DACC
 0047DC60    pop         esi
 0047DC61    ret
*}
end;

//0047DC64
procedure TGLImmaterialSceneObject.SetBehaviours(Value:TGLBehaviours);
begin
{*
 0047DC64    push        ebx
 0047DC65    push        esi
 0047DC66    mov         esi,edx
 0047DC68    mov         ebx,eax
 0047DC6A    mov         eax,ebx
 0047DC6C    call        TGLImmaterialSceneObject.GetBehaviours
 0047DC71    mov         edx,esi
 0047DC73    mov         ecx,dword ptr [eax]
 0047DC75    call        dword ptr [ecx+8]
 0047DC78    pop         esi
 0047DC79    pop         ebx
 0047DC7A    ret
*}
end;

//0047DC7C
{*function TGLImmaterialSceneObject.GetBehaviours:?;
begin
 0047DC7C    push        ebx
 0047DC7D    mov         ebx,eax
 0047DC7F    cmp         dword ptr [ebx+80],0;TGLImmaterialSceneObject.?f80:TGLBehaviours
>0047DC86    jne         0047DC9C
 0047DC88    mov         ecx,ebx
 0047DC8A    mov         dl,1
 0047DC8C    mov         eax,[00478F0C];TGLBehaviours
 0047DC91    call        TGLBehaviours.Create;TGLBehaviours.Create
 0047DC96    mov         dword ptr [ebx+80],eax;TGLImmaterialSceneObject.?f80:TGLBehaviours
 0047DC9C    mov         eax,dword ptr [ebx+80];TGLImmaterialSceneObject.?f80:TGLBehaviours
 0047DCA2    pop         ebx
 0047DCA3    ret
end;*}

//0047DCA4
procedure TGLImmaterialSceneObject.SetEffects(Value:TGLObjectEffects);
begin
{*
 0047DCA4    push        ebx
 0047DCA5    push        esi
 0047DCA6    mov         esi,edx
 0047DCA8    mov         ebx,eax
 0047DCAA    mov         eax,ebx
 0047DCAC    call        TGLImmaterialSceneObject.GetEffects
 0047DCB1    mov         edx,esi
 0047DCB3    mov         ecx,dword ptr [eax]
 0047DCB5    call        dword ptr [ecx+8]
 0047DCB8    pop         esi
 0047DCB9    pop         ebx
 0047DCBA    ret
*}
end;

//0047DCBC
{*function TGLImmaterialSceneObject.GetEffects:?;
begin
 0047DCBC    push        ebx
 0047DCBD    mov         ebx,eax
 0047DCBF    cmp         dword ptr [ebx+84],0;TGLImmaterialSceneObject.?f84:TGLObjectEffects
>0047DCC6    jne         0047DCDC
 0047DCC8    mov         ecx,ebx
 0047DCCA    mov         dl,1
 0047DCCC    mov         eax,[00479070];TGLObjectEffects
 0047DCD1    call        TGLObjectEffects.Create;TGLObjectEffects.Create
 0047DCD6    mov         dword ptr [ebx+84],eax;TGLImmaterialSceneObject.?f84:TGLObjectEffects
 0047DCDC    mov         eax,dword ptr [ebx+84];TGLImmaterialSceneObject.?f84:TGLObjectEffects
 0047DCE2    pop         ebx
 0047DCE3    ret
end;*}

//0047DCE4
procedure sub_0047DCE4(?:TGLBaseSceneObject; ?:dword);
begin
{*
 0047DCE4    push        ebx
 0047DCE5    push        esi
 0047DCE6    push        edi
 0047DCE7    mov         esi,edx
 0047DCE9    mov         ebx,eax
 0047DCEB    mov         eax,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047DCEE    cmp         esi,eax
>0047DCF0    je          0047DD27
 0047DCF2    test        eax,eax
>0047DCF4    je          0047DCFD
 0047DCF6    mov         eax,ebx
 0047DCF8    call        0047B64C
 0047DCFD    mov         dword ptr [ebx+5C],esi;TGLBaseSceneObject.?f5C:TComponent
 0047DD00    mov         eax,dword ptr [ebx+60];TGLBaseSceneObject.?f60:TPersistentObjectList
 0047DD03    test        eax,eax
>0047DD05    je          0047DD27
 0047DD07    mov         esi,dword ptr [eax+0C];TPersistentObjectList.?fC:dword
 0047DD0A    dec         esi
 0047DD0B    test        esi,esi
>0047DD0D    jl          0047DD27
 0047DD0F    inc         esi
 0047DD10    xor         edi,edi
 0047DD12    mov         edx,edi
 0047DD14    mov         eax,ebx
 0047DD16    call        0047BA74
 0047DD1B    mov         edx,dword ptr [ebx+5C];TGLBaseSceneObject.?f5C:TComponent
 0047DD1E    call        0047DCE4
 0047DD23    inc         edi
 0047DD24    dec         esi
>0047DD25    jne         0047DD12
 0047DD27    pop         edi
 0047DD28    pop         esi
 0047DD29    pop         ebx
 0047DD2A    ret
*}
end;

//0047DD2C
constructor sub_0047DD2C;
begin
{*
 0047DD2C    push        ebx
 0047DD2D    push        esi
 0047DD2E    test        dl,dl
>0047DD30    je          0047DD3A
 0047DD32    add         esp,0FFFFFFF0
 0047DD35    call        @ClassCreate
 0047DD3A    mov         ebx,edx
 0047DD3C    mov         esi,eax
 0047DD3E    xor         edx,edx
 0047DD40    mov         eax,esi
 0047DD42    call        0046DC4C
 0047DD47    mov         eax,esi
 0047DD49    test        bl,bl
>0047DD4B    je          0047DD5C
 0047DD4D    call        @AfterConstruction
 0047DD52    pop         dword ptr fs:[0]
 0047DD59    add         esp,0C
 0047DD5C    mov         eax,esi
 0047DD5E    pop         esi
 0047DD5F    pop         ebx
 0047DD60    ret
*}
end;

//0047DD64
destructor TGLBaseBehaviour.Destroy;
begin
{*
 0047DD64    push        ebx
 0047DD65    push        esi
 0047DD66    call        @BeforeDestruction
 0047DD6B    mov         ebx,edx
 0047DD6D    mov         esi,eax
 0047DD6F    mov         edx,ebx
 0047DD71    and         dl,0FC
 0047DD74    mov         eax,esi
 0047DD76    call        TXCollectionItem.Destroy
 0047DD7B    test        bl,bl
>0047DD7D    jle         0047DD86
 0047DD7F    mov         eax,esi
 0047DD81    call        @ClassDestroy
 0047DD86    pop         esi
 0047DD87    pop         ebx
 0047DD88    ret
*}
end;

//0047DD8C
procedure sub_0047DD8C;
begin
{*
 0047DD8C    push        ebx
 0047DD8D    mov         ebx,eax
 0047DD8F    mov         eax,ebx
 0047DD91    call        TXCollectionItem.SetName
 0047DD96    cmp         word ptr ds:[5E150E],0;gvar_005E150E
>0047DD9E    je          0047DDAE
 0047DDA0    mov         edx,ebx
 0047DDA2    mov         eax,dword ptr ds:[5E1510];gvar_005E1510
 0047DDA8    call        dword ptr ds:[5E150C]
 0047DDAE    pop         ebx
 0047DDAF    ret
*}
end;

//0047DDB0
{*procedure sub_0047DDB0(?:?);
begin
 0047DDB0    mov         eax,edx
 0047DDB2    xor         edx,edx
 0047DDB4    call        TWriter.WriteInteger
 0047DDB9    ret
end;*}

//0047DDBC
{*procedure sub_0047DDBC(?:?);
begin
 0047DDBC    push        ebx
 0047DDBD    mov         ebx,edx
 0047DDBF    mov         eax,ebx
 0047DDC1    call        TReader.ReadInteger
 0047DDC6    test        eax,eax
>0047DDC8    je          0047DDDE
 0047DDCA    mov         ecx,1123
 0047DDCF    mov         edx,47DDE8;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047DDD4    mov         eax,47DE20;'Assertion failure'
 0047DDD9    call        @Assert
 0047DDDE    pop         ebx
 0047DDDF    ret
end;*}

//0047DE34
procedure sub_0047DE34;
begin
{*
 0047DE34    ret
*}
end;

//0047DE38
constructor TGLBehaviours.Create;
begin
{*
 0047DE38    push        ebx
 0047DE39    push        esi
 0047DE3A    push        edi
 0047DE3B    test        dl,dl
>0047DE3D    je          0047DE47
 0047DE3F    add         esp,0FFFFFFF0
 0047DE42    call        @ClassCreate
 0047DE47    mov         esi,ecx
 0047DE49    mov         ebx,edx
 0047DE4B    mov         edi,eax
 0047DE4D    mov         eax,esi
 0047DE4F    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 0047DE55    call        @IsClass
 0047DE5A    test        al,al
>0047DE5C    jne         0047DE72
 0047DE5E    mov         ecx,113E
 0047DE63    mov         edx,47DEA0;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047DE68    mov         eax,47DED8;'Assertion failure'
 0047DE6D    call        @Assert
 0047DE72    mov         ecx,esi
 0047DE74    xor         edx,edx
 0047DE76    mov         eax,edi
 0047DE78    call        0046E084
 0047DE7D    mov         eax,edi
 0047DE7F    test        bl,bl
>0047DE81    je          0047DE92
 0047DE83    call        @AfterConstruction
 0047DE88    pop         dword ptr fs:[0]
 0047DE8F    add         esp,0C
 0047DE92    mov         eax,edi
 0047DE94    pop         edi
 0047DE95    pop         esi
 0047DE96    pop         ebx
 0047DE97    ret
*}
end;

//0047DEEC
{*procedure TGLBehaviours.GetNamePath(?:?);
begin
 0047DEEC    push        ebp
 0047DEED    mov         ebp,esp
 0047DEEF    add         esp,0FFFFFEFC
 0047DEF5    push        ebx
 0047DEF6    push        esi
 0047DEF7    push        edi
 0047DEF8    xor         ecx,ecx
 0047DEFA    mov         dword ptr [ebp-4],ecx
 0047DEFD    mov         edi,edx
 0047DEFF    mov         ebx,eax
 0047DF01    xor         eax,eax
 0047DF03    push        ebp
 0047DF04    push        47DF7A
 0047DF09    push        dword ptr fs:[eax]
 0047DF0C    mov         dword ptr fs:[eax],esp
 0047DF0F    lea         edx,[ebp-104]
 0047DF15    mov         eax,dword ptr [ebx]
 0047DF17    call        TObject.ClassName
 0047DF1C    lea         edx,[ebp-104]
 0047DF22    mov         eax,edi
 0047DF24    call        @LStrFromString
 0047DF29    mov         eax,ebx
 0047DF2B    mov         si,0FFFF
 0047DF2F    call        @CallDynaInst;TXCollection.sub_0041ADA4
 0047DF34    test        eax,eax
>0047DF36    je          0047DF64
 0047DF38    mov         eax,ebx
 0047DF3A    mov         si,0FFFF
 0047DF3E    call        @CallDynaInst;TXCollection.sub_0041ADA4
 0047DF43    lea         edx,[ebp-4]
 0047DF46    mov         si,0FFFE
 0047DF4A    call        @CallDynaInst
 0047DF4F    cmp         dword ptr [ebp-4],0
>0047DF53    je          0047DF64
 0047DF55    mov         eax,edi
 0047DF57    mov         ecx,47DF90;'.Behaviours'
 0047DF5C    mov         edx,dword ptr [ebp-4]
 0047DF5F    call        @LStrCat3
 0047DF64    xor         eax,eax
 0047DF66    pop         edx
 0047DF67    pop         ecx
 0047DF68    pop         ecx
 0047DF69    mov         dword ptr fs:[eax],edx
 0047DF6C    push        47DF81
 0047DF71    lea         eax,[ebp-4]
 0047DF74    call        @LStrClr
 0047DF79    ret
>0047DF7A    jmp         @HandleFinally
>0047DF7F    jmp         0047DF71
 0047DF81    pop         edi
 0047DF82    pop         esi
 0047DF83    pop         ebx
 0047DF84    mov         esp,ebp
 0047DF86    pop         ebp
 0047DF87    ret
end;*}

//0047DF9C
constructor TGLBehaviour.Create;
begin
{*
 0047DF9C    mov         eax,[00478E54];TGLBehaviour
 0047DFA1    ret
*}
end;

//0047DFA4
{*function sub_0047DFA4(?:?):?;
begin
 0047DFA4    push        ebx
 0047DFA5    push        esi
 0047DFA6    mov         esi,edx
 0047DFA8    mov         ebx,eax
 0047DFAA    mov         edx,dword ptr ds:[478FB0];TGLObjectEffect
 0047DFB0    mov         eax,esi
 0047DFB2    call        TObject.InheritsFrom
 0047DFB7    test        al,al
>0047DFB9    jne         0047DFC8
 0047DFBB    mov         edx,esi
 0047DFBD    mov         eax,ebx
 0047DFBF    call        0046E5DC
 0047DFC4    test        al,al
>0047DFC6    jne         0047DFCD
 0047DFC8    xor         eax,eax
 0047DFCA    pop         esi
 0047DFCB    pop         ebx
 0047DFCC    ret
 0047DFCD    mov         al,1
 0047DFCF    pop         esi
 0047DFD0    pop         ebx
 0047DFD1    ret
end;*}

//0047DFD4
{*procedure sub_0047DFD4(?:dword; ?:?);
begin
 0047DFD4    push        ebx
 0047DFD5    push        esi
 0047DFD6    push        edi
 0047DFD7    push        ebp
 0047DFD8    mov         ebp,edx
 0047DFDA    mov         edi,eax
 0047DFDC    mov         ebx,dword ptr [edi+0C]
 0047DFDF    dec         ebx
 0047DFE0    test        ebx,ebx
>0047DFE2    jl          0047DFFB
 0047DFE4    inc         ebx
 0047DFE5    xor         esi,esi
 0047DFE7    mov         edx,esi
 0047DFE9    mov         eax,edi
 0047DFEB    call        0046E4D4
 0047DFF0    mov         edx,ebp
 0047DFF2    mov         ecx,dword ptr [eax]
 0047DFF4    call        dword ptr [ecx+30]
 0047DFF7    inc         esi
 0047DFF8    dec         ebx
>0047DFF9    jne         0047DFE7
 0047DFFB    pop         ebp
 0047DFFC    pop         edi
 0047DFFD    pop         esi
 0047DFFE    pop         ebx
 0047DFFF    ret
end;*}

//0047E000
{*procedure sub_0047E000(?:?);
begin
 0047E000    mov         eax,edx
 0047E002    xor         edx,edx
 0047E004    call        TWriter.WriteInteger
 0047E009    ret
end;*}

//0047E00C
{*procedure sub_0047E00C(?:?);
begin
 0047E00C    push        ebx
 0047E00D    mov         ebx,edx
 0047E00F    mov         eax,ebx
 0047E011    call        TReader.ReadInteger
 0047E016    test        eax,eax
>0047E018    je          0047E02E
 0047E01A    mov         ecx,1182
 0047E01F    mov         edx,47E038;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047E024    mov         eax,47E070;'Assertion failure'
 0047E029    call        @Assert
 0047E02E    pop         ebx
 0047E02F    ret
end;*}

//0047E084
procedure sub_0047E084;
begin
{*
 0047E084    ret
*}
end;

//0047E088
constructor TGLObjectEffects.Create;
begin
{*
 0047E088    push        ebx
 0047E089    push        esi
 0047E08A    push        edi
 0047E08B    test        dl,dl
>0047E08D    je          0047E097
 0047E08F    add         esp,0FFFFFFF0
 0047E092    call        @ClassCreate
 0047E097    mov         esi,ecx
 0047E099    mov         ebx,edx
 0047E09B    mov         edi,eax
 0047E09D    mov         eax,esi
 0047E09F    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 0047E0A5    call        @IsClass
 0047E0AA    test        al,al
>0047E0AC    jne         0047E0C2
 0047E0AE    mov         ecx,1197
 0047E0B3    mov         edx,47E0F0;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047E0B8    mov         eax,47E128;'Assertion failure'
 0047E0BD    call        @Assert
 0047E0C2    mov         ecx,esi
 0047E0C4    xor         edx,edx
 0047E0C6    mov         eax,edi
 0047E0C8    call        0046E084
 0047E0CD    mov         eax,edi
 0047E0CF    test        bl,bl
>0047E0D1    je          0047E0E2
 0047E0D3    call        @AfterConstruction
 0047E0D8    pop         dword ptr fs:[0]
 0047E0DF    add         esp,0C
 0047E0E2    mov         eax,edi
 0047E0E4    pop         edi
 0047E0E5    pop         esi
 0047E0E6    pop         ebx
 0047E0E7    ret
*}
end;

//0047E13C
{*procedure TGLObjectEffects.GetNamePath(?:?);
begin
 0047E13C    push        ebp
 0047E13D    mov         ebp,esp
 0047E13F    add         esp,0FFFFFEFC
 0047E145    push        ebx
 0047E146    push        esi
 0047E147    push        edi
 0047E148    xor         ecx,ecx
 0047E14A    mov         dword ptr [ebp-4],ecx
 0047E14D    mov         edi,edx
 0047E14F    mov         ebx,eax
 0047E151    xor         eax,eax
 0047E153    push        ebp
 0047E154    push        47E1CA
 0047E159    push        dword ptr fs:[eax]
 0047E15C    mov         dword ptr fs:[eax],esp
 0047E15F    lea         edx,[ebp-104]
 0047E165    mov         eax,dword ptr [ebx]
 0047E167    call        TObject.ClassName
 0047E16C    lea         edx,[ebp-104]
 0047E172    mov         eax,edi
 0047E174    call        @LStrFromString
 0047E179    mov         eax,ebx
 0047E17B    mov         si,0FFFF
 0047E17F    call        @CallDynaInst;TXCollection.sub_0041ADA4
 0047E184    test        eax,eax
>0047E186    je          0047E1B4
 0047E188    mov         eax,ebx
 0047E18A    mov         si,0FFFF
 0047E18E    call        @CallDynaInst;TXCollection.sub_0041ADA4
 0047E193    lea         edx,[ebp-4]
 0047E196    mov         si,0FFFE
 0047E19A    call        @CallDynaInst
 0047E19F    cmp         dword ptr [ebp-4],0
>0047E1A3    je          0047E1B4
 0047E1A5    mov         eax,edi
 0047E1A7    mov         ecx,47E1E0;'.Effects'
 0047E1AC    mov         edx,dword ptr [ebp-4]
 0047E1AF    call        @LStrCat3
 0047E1B4    xor         eax,eax
 0047E1B6    pop         edx
 0047E1B7    pop         ecx
 0047E1B8    pop         ecx
 0047E1B9    mov         dword ptr fs:[eax],edx
 0047E1BC    push        47E1D1
 0047E1C1    lea         eax,[ebp-4]
 0047E1C4    call        @LStrClr
 0047E1C9    ret
>0047E1CA    jmp         @HandleFinally
>0047E1CF    jmp         0047E1C1
 0047E1D1    pop         edi
 0047E1D2    pop         esi
 0047E1D3    pop         ebx
 0047E1D4    mov         esp,ebp
 0047E1D6    pop         ebp
 0047E1D7    ret
end;*}

//0047E1EC
constructor TGLObjectEffect.Create;
begin
{*
 0047E1EC    mov         eax,[00478FB0];TGLObjectEffect
 0047E1F1    ret
*}
end;

//0047E1F4
{*function sub_0047E1F4(?:?):?;
begin
 0047E1F4    push        ebx
 0047E1F5    push        esi
 0047E1F6    mov         esi,edx
 0047E1F8    mov         ebx,eax
 0047E1FA    mov         edx,dword ptr ds:[478FB0];TGLObjectEffect
 0047E200    mov         eax,esi
 0047E202    call        TObject.InheritsFrom
 0047E207    test        al,al
>0047E209    je          0047E218
 0047E20B    mov         edx,esi
 0047E20D    mov         eax,ebx
 0047E20F    call        0046E5DC
 0047E214    test        al,al
>0047E216    jne         0047E21D
 0047E218    xor         eax,eax
 0047E21A    pop         esi
 0047E21B    pop         ebx
 0047E21C    ret
 0047E21D    mov         al,1
 0047E21F    pop         esi
 0047E220    pop         ebx
 0047E221    ret
end;*}

//0047E224
{*procedure sub_0047E224(?:dword; ?:?);
begin
 0047E224    push        ebx
 0047E225    push        esi
 0047E226    push        edi
 0047E227    push        ebp
 0047E228    mov         ebp,edx
 0047E22A    mov         edi,eax
 0047E22C    mov         ebx,dword ptr [edi+0C]
 0047E22F    dec         ebx
 0047E230    test        ebx,ebx
>0047E232    jl          0047E24B
 0047E234    inc         ebx
 0047E235    xor         esi,esi
 0047E237    mov         edx,esi
 0047E239    mov         eax,edi
 0047E23B    call        0046E4D4
 0047E240    mov         edx,ebp
 0047E242    mov         ecx,dword ptr [eax]
 0047E244    call        dword ptr [ecx+30]
 0047E247    inc         esi
 0047E248    dec         ebx
>0047E249    jne         0047E237
 0047E24B    pop         ebp
 0047E24C    pop         edi
 0047E24D    pop         esi
 0047E24E    pop         ebx
 0047E24F    ret
end;*}

//0047E250
{*procedure sub_0047E250(?:?; ?:?; ?:?);
begin
 0047E250    push        ebx
 0047E251    push        esi
 0047E252    push        edi
 0047E253    add         esp,0FFFFFFF4
 0047E256    mov         dword ptr [esp+8],ecx
 0047E25A    mov         dword ptr [esp+4],edx
 0047E25E    mov         dword ptr [esp],eax
 0047E261    mov         eax,dword ptr [esp]
 0047E264    mov         esi,dword ptr [eax+0C]
 0047E267    dec         esi
 0047E268    test        esi,esi
>0047E26A    jl          0047E29F
 0047E26C    inc         esi
 0047E26D    xor         edi,edi
 0047E26F    mov         edx,edi
 0047E271    mov         eax,dword ptr [esp]
 0047E274    call        0046E4D4
 0047E279    mov         ebx,eax
 0047E27B    mov         eax,ebx
 0047E27D    mov         edx,dword ptr ds:[5AC0C8];0x0 gvar_005AC0C8
 0047E283    call        @IsClass
 0047E288    test        al,al
>0047E28A    je          0047E29B
 0047E28C    mov         ecx,dword ptr [esp+8]
 0047E290    mov         edx,dword ptr [esp+4]
 0047E294    mov         eax,ebx
 0047E296    mov         ebx,dword ptr [eax]
 0047E298    call        dword ptr [ebx+34]
 0047E29B    inc         edi
 0047E29C    dec         esi
>0047E29D    jne         0047E26F
 0047E29F    add         esp,0C
 0047E2A2    pop         edi
 0047E2A3    pop         esi
 0047E2A4    pop         ebx
 0047E2A5    ret
end;*}

//0047E2A8
{*procedure sub_0047E2A8(?:?; ?:?; ?:?);
begin
 0047E2A8    push        ebx
 0047E2A9    push        esi
 0047E2AA    push        edi
 0047E2AB    add         esp,0FFFFFFF4
 0047E2AE    mov         dword ptr [esp+8],ecx
 0047E2B2    mov         dword ptr [esp+4],edx
 0047E2B6    mov         dword ptr [esp],eax
 0047E2B9    mov         eax,dword ptr [esp]
 0047E2BC    mov         esi,dword ptr [eax+0C]
 0047E2BF    dec         esi
 0047E2C0    test        esi,esi
>0047E2C2    jl          0047E31F
 0047E2C4    inc         esi
 0047E2C5    xor         edi,edi
 0047E2C7    mov         edx,edi
 0047E2C9    mov         eax,dword ptr [esp]
 0047E2CC    call        0046E4D4
 0047E2D1    mov         ebx,eax
 0047E2D3    mov         eax,ebx
 0047E2D5    mov         edx,dword ptr ds:[5AC0C8];0x0 gvar_005AC0C8
 0047E2DB    call        @IsClass
 0047E2E0    test        al,al
>0047E2E2    je          0047E2F5
 0047E2E4    mov         ecx,dword ptr [esp+8]
 0047E2E8    mov         edx,dword ptr [esp+4]
 0047E2EC    mov         eax,ebx
 0047E2EE    mov         ebx,dword ptr [eax]
 0047E2F0    call        dword ptr [ebx+34]
>0047E2F3    jmp         0047E31B
 0047E2F5    cmp         dword ptr [esp+4],0
>0047E2FA    je          0047E31B
 0047E2FC    mov         eax,ebx
 0047E2FE    mov         edx,dword ptr ds:[5AC0C8];0x0 gvar_005AC0C8
 0047E304    call        @IsClass
 0047E309    test        al,al
>0047E30B    je          0047E31B
 0047E30D    mov         eax,dword ptr [esp+4]
 0047E311    mov         eax,dword ptr [eax+24]
 0047E314    mov         edx,ebx
 0047E316    call        00466E24
 0047E31B    inc         edi
 0047E31C    dec         esi
>0047E31D    jne         0047E2C7
 0047E31F    add         esp,0C
 0047E322    pop         edi
 0047E323    pop         esi
 0047E324    pop         ebx
 0047E325    ret
end;*}

//0047E328
constructor TGLCustomSceneObject.Create(AOwner:TComponent);
begin
{*
 0047E328    push        ebx
 0047E329    push        esi
 0047E32A    test        dl,dl
>0047E32C    je          0047E336
 0047E32E    add         esp,0FFFFFFF0
 0047E331    call        @ClassCreate
 0047E336    mov         ebx,edx
 0047E338    mov         esi,eax
 0047E33A    xor         edx,edx
 0047E33C    mov         eax,esi
 0047E33E    call        TGLBaseSceneObject.Create
 0047E343    mov         ecx,esi
 0047E345    mov         dl,1
 0047E347    mov         eax,[004720C4];TGLMaterial
 0047E34C    call        TGLMaterial.Create;TGLMaterial.Create
 0047E351    mov         dword ptr [esi+90],eax;TGLCustomSceneObject.?f90:TGLMaterial
 0047E357    mov         eax,esi
 0047E359    test        bl,bl
>0047E35B    je          0047E36C
 0047E35D    call        @AfterConstruction
 0047E362    pop         dword ptr fs:[0]
 0047E369    add         esp,0C
 0047E36C    mov         eax,esi
 0047E36E    pop         esi
 0047E36F    pop         ebx
 0047E370    ret
*}
end;

//0047E374
destructor TGLCustomSceneObject.Destroy;
begin
{*
 0047E374    push        ebx
 0047E375    push        esi
 0047E376    call        @BeforeDestruction
 0047E37B    mov         ebx,edx
 0047E37D    mov         esi,eax
 0047E37F    mov         edx,ebx
 0047E381    and         dl,0FC
 0047E384    mov         eax,esi
 0047E386    call        TGLBaseSceneObject.Destroy
 0047E38B    mov         eax,dword ptr [esi+90];TGLCustomSceneObject.?f90:TGLMaterial
 0047E391    call        TObject.Free
 0047E396    test        bl,bl
>0047E398    jle         0047E3A1
 0047E39A    mov         eax,esi
 0047E39C    call        @ClassDestroy
 0047E3A1    pop         esi
 0047E3A2    pop         ebx
 0047E3A3    ret
*}
end;

//0047E3A4
procedure TGLCustomSceneObject.Assign(Source:TPersistent);
begin
{*
 0047E3A4    push        ebx
 0047E3A5    push        esi
 0047E3A6    push        edi
 0047E3A7    mov         esi,edx
 0047E3A9    mov         ebx,eax
 0047E3AB    mov         eax,esi
 0047E3AD    mov         edx,dword ptr ds:[47911C];TGLCustomSceneObject
 0047E3B3    call        @IsClass
 0047E3B8    test        al,al
>0047E3BA    je          0047E3E0
 0047E3BC    mov         edi,esi
 0047E3BE    mov         edx,dword ptr [edi+90]
 0047E3C4    mov         eax,dword ptr [ebx+90];TGLCustomSceneObject.?f90:TGLMaterial
 0047E3CA    mov         ecx,dword ptr [eax]
 0047E3CC    call        dword ptr [ecx+8];TGLMaterial.Assign
 0047E3CF    lea         eax,[ebx+94];TGLCustomSceneObject.?f94:String
 0047E3D5    mov         edx,dword ptr [edi+94]
 0047E3DB    call        @LStrAsg
 0047E3E0    mov         edx,esi
 0047E3E2    mov         eax,ebx
 0047E3E4    call        TGLBaseSceneObject.Assign
 0047E3E9    pop         edi
 0047E3EA    pop         esi
 0047E3EB    pop         ebx
 0047E3EC    ret
*}
end;

//0047E3F0
procedure sub_0047E3F0;
begin
{*
 0047E3F0    mov         eax,dword ptr [eax+90];TGLCustomSceneObject.?f90:TGLMaterial
 0047E3F6    call        00476964
 0047E3FB    ret
*}
end;

//0047E3FC
procedure TGLCustomSceneObject.Loaded;
begin
{*
 0047E3FC    push        ebx
 0047E3FD    mov         ebx,eax
 0047E3FF    mov         eax,ebx
 0047E401    call        TGLBaseSceneObject.Loaded
 0047E406    mov         eax,dword ptr [ebx+90];TGLCustomSceneObject.?f90:TGLMaterial
 0047E40C    call        004763F8
 0047E411    pop         ebx
 0047E412    ret
*}
end;

//0047E414
procedure TGLSceneObject.SetMaterial(Value:TGLMaterial);
begin
{*
 0047E414    push        esi
 0047E415    mov         esi,eax
 0047E417    mov         eax,dword ptr [esi+90];TGLSceneObject.?f90:TGLMaterial
 0047E41D    mov         ecx,dword ptr [eax]
 0047E41F    call        dword ptr [ecx+8];TGLMaterial.Assign
 0047E422    mov         edx,esi
 0047E424    mov         eax,esi
 0047E426    mov         ecx,dword ptr [eax]
 0047E428    call        dword ptr [ecx+34];TGLSceneObject.sub_0047DACC
 0047E42B    pop         esi
 0047E42C    ret
*}
end;

//0047E430
procedure TGLCustomSceneObject.sub_0047B63C;
begin
{*
 0047E430    push        ebx
 0047E431    mov         ebx,eax
 0047E433    mov         eax,ebx
 0047E435    call        TGLBaseSceneObject.sub_0047B63C
 0047E43A    mov         eax,dword ptr [ebx+90];TGLCustomSceneObject.?f90:TGLMaterial
 0047E440    call        00476954
 0047E445    pop         ebx
 0047E446    ret
*}
end;

//0047E448
{*procedure sub_0047E448(?:?; ?:?; ?:?);
begin
 0047E448    push        ebp
 0047E449    mov         ebp,esp
 0047E44B    push        ebx
 0047E44C    push        esi
 0047E44D    push        edi
 0047E44E    mov         edi,edx
 0047E450    mov         esi,eax
 0047E452    test        cl,cl
>0047E454    je          0047E4DF
 0047E45A    mov         eax,dword ptr [esi+5C];TGLCustomSceneObject.?f5C:TComponent
 0047E45D    test        eax,eax
>0047E45F    je          0047E464
 0047E461    mov         dword ptr [eax+60],esi
 0047E464    cmp         byte ptr [edi+0FA],0
>0047E46B    jne         0047E4B6
 0047E46D    mov         edx,edi
 0047E46F    mov         eax,dword ptr [esi+90];TGLCustomSceneObject.?f90:TGLMaterial
 0047E475    call        00476434
 0047E47A    test        byte ptr [esi+3C],1;TGLCustomSceneObject.?f3C:byte
>0047E47E    jne         0047E489
 0047E480    cmp         byte ptr [edi+0FC],0
>0047E487    je          0047E494
 0047E489    mov         edx,edi
 0047E48B    mov         eax,esi
 0047E48D    mov         ecx,dword ptr [eax]
 0047E48F    call        dword ptr [ecx+64];TGLCustomSceneObject.sub_0047B730
>0047E492    jmp         0047E4A3
 0047E494    mov         edx,edi
 0047E496    mov         eax,esi
 0047E498    mov         ecx,dword ptr [eax]
 0047E49A    call        dword ptr [ecx+44];TGLCustomSceneObject.sub_0047B5BC
 0047E49D    push        eax
 0047E49E    call        OpenGL32.glCallList
 0047E4A3    mov         edx,edi
 0047E4A5    mov         eax,dword ptr [esi+90];TGLCustomSceneObject.?f90:TGLMaterial
 0047E4AB    call        00476760
 0047E4B0    test        al,al
>0047E4B2    jne         0047E47A
>0047E4B4    jmp         0047E4DF
 0047E4B6    test        byte ptr [esi+3C],1;TGLCustomSceneObject.?f3C:byte
>0047E4BA    jne         0047E4C5
 0047E4BC    cmp         byte ptr [edi+0FC],0
>0047E4C3    je          0047E4D0
 0047E4C5    mov         edx,edi
 0047E4C7    mov         eax,esi
 0047E4C9    mov         ecx,dword ptr [eax]
 0047E4CB    call        dword ptr [ecx+64];TGLCustomSceneObject.sub_0047B730
>0047E4CE    jmp         0047E4DF
 0047E4D0    mov         edx,edi
 0047E4D2    mov         eax,esi
 0047E4D4    mov         ecx,dword ptr [eax]
 0047E4D6    call        dword ptr [ecx+44];TGLCustomSceneObject.sub_0047B5BC
 0047E4D9    push        eax
 0047E4DA    call        OpenGL32.glCallList
 0047E4DF    cmp         byte ptr [ebp+8],0
>0047E4E3    je          0047E4F6
 0047E4E5    push        edi
 0047E4E6    mov         eax,dword ptr [esi+60];TGLCustomSceneObject.?f60:TPersistentObjectList
 0047E4E9    mov         ecx,dword ptr [eax+0C];TPersistentObjectList.?fC:dword
 0047E4EC    dec         ecx
 0047E4ED    xor         edx,edx
 0047E4EF    mov         eax,esi
 0047E4F1    mov         ebx,dword ptr [eax]
 0047E4F3    call        dword ptr [ebx+6C];TGLCustomSceneObject.sub_0047D7AC
 0047E4F6    pop         edi
 0047E4F7    pop         esi
 0047E4F8    pop         ebx
 0047E4F9    pop         ebp
 0047E4FA    ret         4
end;*}

//0047E500
constructor TGLSceneRootObject.Create(AOwner:TComponent);
begin
{*
 0047E500    push        ebx
 0047E501    push        esi
 0047E502    push        edi
 0047E503    test        dl,dl
>0047E505    je          0047E50F
 0047E507    add         esp,0FFFFFFF0
 0047E50A    call        @ClassCreate
 0047E50F    mov         esi,ecx
 0047E511    mov         ebx,edx
 0047E513    mov         edi,eax
 0047E515    mov         eax,esi
 0047E517    mov         edx,dword ptr ds:[47A72C];TGLScene
 0047E51D    call        @IsClass
 0047E522    test        al,al
>0047E524    jne         0047E53A
 0047E526    mov         ecx,1248
 0047E52B    mov         edx,47E578;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047E530    mov         eax,47E5B0;'Assertion failure'
 0047E535    call        @Assert
 0047E53A    mov         ecx,esi
 0047E53C    xor         edx,edx
 0047E53E    mov         eax,edi
 0047E540    call        TGLBaseSceneObject.Create
 0047E545    mov         al,byte ptr [edi+3C];TGLSceneRootObject.?f3C:byte
 0047E548    or          al,byte ptr ds:[47E5C4];0x1 gvar_0047E5C4
 0047E54E    mov         byte ptr [edi+3C],al;TGLSceneRootObject.?f3C:byte
 0047E551    mov         dword ptr [edi+5C],esi;TGLSceneRootObject.?f5C:TComponent
 0047E554    mov         eax,edi
 0047E556    test        bl,bl
>0047E558    je          0047E569
 0047E55A    call        @AfterConstruction
 0047E55F    pop         dword ptr fs:[0]
 0047E566    add         esp,0C
 0047E569    mov         eax,edi
 0047E56B    pop         edi
 0047E56C    pop         esi
 0047E56D    pop         ebx
 0047E56E    ret
*}
end;

//0047E5C8
constructor TGLCamera.Create(AOwner:TComponent);
begin
{*
 0047E5C8    push        ebp
 0047E5C9    mov         ebp,esp
 0047E5CB    add         esp,0FFFFFFF0
 0047E5CE    push        ebx
 0047E5CF    push        esi
 0047E5D0    test        dl,dl
>0047E5D2    je          0047E5DC
 0047E5D4    add         esp,0FFFFFFF0
 0047E5D7    call        @ClassCreate
 0047E5DC    mov         ebx,edx
 0047E5DE    mov         esi,eax
 0047E5E0    xor         edx,edx
 0047E5E2    mov         eax,esi
 0047E5E4    call        TGLBaseSceneObject.Create
 0047E5E9    mov         dword ptr [esi+90],42480000;TGLCamera.FocalLength:Single
 0047E5F3    mov         dword ptr [esi+94],42C80000;TGLCamera.DepthOfView:Single
 0047E5FD    mov         dword ptr [esi+9C],3F800000;TGLCamera.NearPlaneBias:Single
 0047E607    push        0
 0047E609    push        0
 0047E60B    push        0BF800000
 0047E610    push        0
 0047E612    lea         eax,[ebp-10]
 0047E615    call        0045C928
 0047E61A    lea         edx,[ebp-10]
 0047E61D    mov         eax,dword ptr [esi+48];TGLCamera.?f48:TGLCoordinates
 0047E620    call        0046B4F0
 0047E625    mov         byte ptr [esi+0B8],0;TGLCamera.CameraStyle:TGLCameraStyle
 0047E62C    mov         dword ptr [esi+0BC],3F800000;TGLCamera.SceneScale:Single
 0047E636    mov         eax,esi
 0047E638    test        bl,bl
>0047E63A    je          0047E64B
 0047E63C    call        @AfterConstruction
 0047E641    pop         dword ptr fs:[0]
 0047E648    add         esp,0C
 0047E64B    mov         eax,esi
 0047E64D    pop         esi
 0047E64E    pop         ebx
 0047E64F    mov         esp,ebp
 0047E651    pop         ebp
 0047E652    ret
*}
end;

//0047E654
destructor TGLCamera.Destroy;
begin
{*
 0047E654    push        ebx
 0047E655    push        esi
 0047E656    call        @BeforeDestruction
 0047E65B    mov         ebx,edx
 0047E65D    mov         esi,eax
 0047E65F    xor         edx,edx
 0047E661    mov         eax,esi
 0047E663    call        TGLCamera.SetTargetObject
 0047E668    mov         edx,ebx
 0047E66A    and         dl,0FC
 0047E66D    mov         eax,esi
 0047E66F    call        TGLBaseSceneObject.Destroy
 0047E674    test        bl,bl
>0047E676    jle         0047E67F
 0047E678    mov         eax,esi
 0047E67A    call        @ClassDestroy
 0047E67F    pop         esi
 0047E680    pop         ebx
 0047E681    ret
*}
end;

//0047E684
{*procedure sub_0047E684(?:?);
begin
 0047E684    push        ebx
 0047E685    push        esi
 0047E686    push        edi
 0047E687    add         esp,0FFFFFF90
 0047E68A    mov         ebx,eax
 0047E68C    cmp         word ptr [ebx+0C2],0
>0047E694    je          0047E6A9
 0047E696    mov         edx,ebx
 0047E698    mov         eax,dword ptr [ebx+0C4]
 0047E69E    call        dword ptr [ebx+0C0]
>0047E6A4    jmp         0047E820
 0047E6A9    mov         esi,dword ptr [ebx+0A4]
 0047E6AF    test        esi,esi
>0047E6B1    je          0047E75E
 0047E6B7    mov         edx,esp
 0047E6B9    mov         eax,esi
 0047E6BB    call        0047BD64
 0047E6C0    lea         edx,[esp+20]
 0047E6C4    mov         eax,ebx
 0047E6C6    call        0047BD64
 0047E6CB    lea         ecx,[esp+10]
 0047E6CF    lea         edx,[esp+20]
 0047E6D3    mov         eax,esp
 0047E6D5    call        0045CC4C
 0047E6DA    lea         eax,[esp+10]
 0047E6DE    call        0045D5EC
 0047E6E3    lea         esi,[esp+10]
 0047E6E7    lea         edi,[ebx+0A8]
 0047E6ED    movs        dword ptr [edi],dword ptr [esi]
 0047E6EE    movs        dword ptr [edi],dword ptr [esi]
 0047E6EF    movs        dword ptr [edi],dword ptr [esi]
 0047E6F0    movs        dword ptr [edi],dword ptr [esi]
 0047E6F1    mov         eax,dword ptr [ebx+4C]
 0047E6F4    fld         dword ptr [eax+20]
 0047E6F7    add         esp,0FFFFFFF8
 0047E6FA    fstp        qword ptr [esp]
 0047E6FD    wait
 0047E6FE    fld         dword ptr [eax+1C]
 0047E701    add         esp,0FFFFFFF8
 0047E704    fstp        qword ptr [esp]
 0047E707    wait
 0047E708    fld         dword ptr [eax+18]
 0047E70B    add         esp,0FFFFFFF8
 0047E70E    fstp        qword ptr [esp]
 0047E711    wait
 0047E712    fld         dword ptr [esp+20]
 0047E716    add         esp,0FFFFFFF8
 0047E719    fstp        qword ptr [esp]
 0047E71C    wait
 0047E71D    fld         dword ptr [esp+24]
 0047E721    add         esp,0FFFFFFF8
 0047E724    fstp        qword ptr [esp]
 0047E727    wait
 0047E728    fld         dword ptr [esp+28]
 0047E72C    add         esp,0FFFFFFF8
 0047E72F    fstp        qword ptr [esp]
 0047E732    wait
 0047E733    fld         dword ptr [esp+58]
 0047E737    add         esp,0FFFFFFF8
 0047E73A    fstp        qword ptr [esp]
 0047E73D    wait
 0047E73E    fld         dword ptr [esp+5C]
 0047E742    add         esp,0FFFFFFF8
 0047E745    fstp        qword ptr [esp]
 0047E748    wait
 0047E749    fld         dword ptr [esp+60]
 0047E74D    add         esp,0FFFFFFF8
 0047E750    fstp        qword ptr [esp]
 0047E753    wait
 0047E754    call        GLU32.gluLookAt
>0047E759    jmp         0047E819
 0047E75E    lea         edx,[esp+30]
 0047E762    mov         eax,dword ptr [ebx+58]
 0047E765    call        0047BBC0
 0047E76A    lea         edx,[esp+20]
 0047E76E    mov         eax,ebx
 0047E770    call        0047BD64
 0047E775    mov         ecx,esp
 0047E777    lea         edx,[esp+30]
 0047E77B    mov         eax,dword ptr [ebx+48]
 0047E77E    add         eax,18
 0047E781    call        0045E03C
 0047E786    mov         esi,esp
 0047E788    lea         edi,[ebx+0A8]
 0047E78E    movs        dword ptr [edi],dword ptr [esi]
 0047E78F    movs        dword ptr [edi],dword ptr [esi]
 0047E790    movs        dword ptr [edi],dword ptr [esi]
 0047E791    movs        dword ptr [edi],dword ptr [esi]
 0047E792    lea         ecx,[esp+10]
 0047E796    lea         edx,[esp+30]
 0047E79A    mov         eax,dword ptr [ebx+4C]
 0047E79D    add         eax,18
 0047E7A0    call        0045E03C
 0047E7A5    fld         dword ptr [esp+18]
 0047E7A9    add         esp,0FFFFFFF8
 0047E7AC    fstp        qword ptr [esp]
 0047E7AF    wait
 0047E7B0    fld         dword ptr [esp+1C]
 0047E7B4    add         esp,0FFFFFFF8
 0047E7B7    fstp        qword ptr [esp]
 0047E7BA    wait
 0047E7BB    fld         dword ptr [esp+20]
 0047E7BF    add         esp,0FFFFFFF8
 0047E7C2    fstp        qword ptr [esp]
 0047E7C5    wait
 0047E7C6    fld         dword ptr [esp+40]
 0047E7CA    fadd        dword ptr [esp+20]
 0047E7CE    add         esp,0FFFFFFF8
 0047E7D1    fstp        qword ptr [esp]
 0047E7D4    wait
 0047E7D5    fld         dword ptr [esp+44]
 0047E7D9    fadd        dword ptr [esp+24]
 0047E7DD    add         esp,0FFFFFFF8
 0047E7E0    fstp        qword ptr [esp]
 0047E7E3    wait
 0047E7E4    fld         dword ptr [esp+48]
 0047E7E8    fadd        dword ptr [esp+28]
 0047E7EC    add         esp,0FFFFFFF8
 0047E7EF    fstp        qword ptr [esp]
 0047E7F2    wait
 0047E7F3    fld         dword ptr [esp+58]
 0047E7F7    add         esp,0FFFFFFF8
 0047E7FA    fstp        qword ptr [esp]
 0047E7FD    wait
 0047E7FE    fld         dword ptr [esp+5C]
 0047E802    add         esp,0FFFFFFF8
 0047E805    fstp        qword ptr [esp]
 0047E808    wait
 0047E809    fld         dword ptr [esp+60]
 0047E80D    add         esp,0FFFFFFF8
 0047E810    fstp        qword ptr [esp]
 0047E813    wait
 0047E814    call        GLU32.gluLookAt
 0047E819    mov         eax,ebx
 0047E81B    call        0047CEF4
 0047E820    add         esp,70
 0047E823    pop         edi
 0047E824    pop         esi
 0047E825    pop         ebx
 0047E826    ret
end;*}

//0047E828
{*procedure sub_0047E828(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0047E828    push        ebp
 0047E829    mov         ebp,esp
 0047E82B    add         esp,0FFFFFF70
 0047E831    push        ebx
 0047E832    push        esi
 0047E833    push        edi
 0047E834    mov         edi,ecx
 0047E836    mov         dword ptr [ebp-4],edx
 0047E839    mov         ebx,eax
 0047E83B    mov         esi,dword ptr [ebp+0C]
 0047E83E    test        edi,edi
>0047E840    jle         0047ECBA
 0047E846    test        esi,esi
>0047E848    jle         0047ECBA
 0047E84E    mov         dl,byte ptr [ebx+0B8]
 0047E854    cmp         dl,2
>0047E857    jne         0047E8D3
 0047E859    mov         dword ptr [ebp-8C],esi
 0047E85F    fild        dword ptr [ebp-8C]
 0047E865    add         esp,0FFFFFFF8
 0047E868    fstp        qword ptr [esp]
 0047E86B    wait
 0047E86C    push        0
 0047E86E    push        0
 0047E870    mov         dword ptr [ebp-90],edi
 0047E876    fild        dword ptr [ebp-90]
 0047E87C    add         esp,0FFFFFFF8
 0047E87F    fstp        qword ptr [esp]
 0047E882    wait
 0047E883    push        0
 0047E885    push        0
 0047E887    call        GLU32.gluOrtho2D
 0047E88C    mov         dword ptr [ebx+98],0BF800000
 0047E896    mov         dword ptr [ebp-8C],edi
 0047E89C    fild        dword ptr [ebp-8C]
 0047E8A2    add         esp,0FFFFFFFC
 0047E8A5    fstp        dword ptr [esp]
 0047E8A8    wait
 0047E8A9    mov         dword ptr [ebp-90],esi
 0047E8AF    fild        dword ptr [ebp-90]
 0047E8B5    add         esp,0FFFFFFFC
 0047E8B8    fstp        dword ptr [esp]
 0047E8BB    wait
 0047E8BC    call        0045D3F0
 0047E8C1    fdiv        dword ptr ds:[47ECC4];2:Single
 0047E8C7    fstp        dword ptr [ebx+0A0]
 0047E8CD    wait
>0047E8CE    jmp         0047ECBA
 0047E8D3    cmp         dl,3
>0047E8D6    jne         0047E940
 0047E8D8    mov         dword ptr [ebp-8C],edi
 0047E8DE    fild        dword ptr [ebp-8C]
 0047E8E4    add         esp,0FFFFFFFC
 0047E8E7    fstp        dword ptr [esp]
 0047E8EA    wait
 0047E8EB    mov         dword ptr [ebp-90],esi
 0047E8F1    fild        dword ptr [ebp-90]
 0047E8F7    add         esp,0FFFFFFFC
 0047E8FA    fstp        dword ptr [esp]
 0047E8FD    wait
 0047E8FE    call        0045D3F0
 0047E903    fdiv        dword ptr ds:[47ECC4];2:Single
 0047E909    fstp        dword ptr [ebx+0A0]
 0047E90F    wait
 0047E910    cmp         word ptr [ebx+0CA],0
>0047E918    je          0047ECBA
 0047E91E    push        esi
 0047E91F    mov         eax,dword ptr [ebp+8]
 0047E922    push        eax
 0047E923    lea         eax,[ebx+0A0]
 0047E929    push        eax
 0047E92A    mov         edx,dword ptr [ebp-4]
 0047E92D    mov         ecx,edi
 0047E92F    mov         eax,dword ptr [ebx+0CC]
 0047E935    call        dword ptr [ebx+0C8]
>0047E93B    jmp         0047ECBA
 0047E940    mov         dword ptr [ebp-8C],edi
 0047E946    fild        dword ptr [ebp-8C]
 0047E94C    fstp        qword ptr [ebp-38]
 0047E94F    wait
 0047E950    mov         dword ptr [ebp-8C],esi
 0047E956    fild        dword ptr [ebp-8C]
 0047E95C    fcomp       qword ptr [ebp-38]
 0047E95F    fnstsw      al
 0047E961    sahf
>0047E962    jbe         0047E974
 0047E964    mov         dword ptr [ebp-8C],esi
 0047E96A    fild        dword ptr [ebp-8C]
 0047E970    fstp        qword ptr [ebp-38]
 0047E973    wait
 0047E974    test        dl,dl
>0047E976    je          0047E97D
 0047E978    sub         dl,4
>0047E97B    jne         0047E99B
 0047E97D    mov         dword ptr [ebp-8C],edi
 0047E983    fild        dword ptr [ebp-8C]
 0047E989    fmul        dword ptr [ebx+0BC]
 0047E98F    fdivr       dword ptr [ebx+9C]
 0047E995    fstp        qword ptr [ebp-48]
 0047E998    wait
>0047E999    jmp         0047E9C5
 0047E99B    fld         dword ptr ds:[47ECC8];100:Single
 0047E9A1    fmul        dword ptr [ebx+9C]
 0047E9A7    mov         dword ptr [ebp-8C],edi
 0047E9AD    fild        dword ptr [ebp-8C]
 0047E9B3    fmul        dword ptr [ebx+90]
 0047E9B9    fmul        dword ptr [ebx+0BC]
 0047E9BF    fdivp       st(1),st
 0047E9C1    fstp        qword ptr [ebp-48]
 0047E9C4    wait
 0047E9C5    mov         edx,dword ptr [ebp-4]
 0047E9C8    mov         edx,dword ptr [edx+8]
 0047E9CB    add         edx,edx
 0047E9CD    mov         eax,dword ptr [ebp-4]
 0047E9D0    mov         eax,dword ptr [eax]
 0047E9D2    add         eax,eax
 0047E9D4    add         edx,eax
 0047E9D6    sub         edx,edi
 0047E9D8    mov         dword ptr [ebp-8C],edx
 0047E9DE    fild        dword ptr [ebp-8C]
 0047E9E4    fmul        qword ptr [ebp-48]
 0047E9E7    fstp        qword ptr [ebp-40]
 0047E9EA    wait
 0047E9EB    mov         dword ptr [ebp-8C],edi
 0047E9F1    fild        dword ptr [ebp-8C]
 0047E9F7    fmul        qword ptr [ebp-40]
 0047E9FA    fld         dword ptr ds:[47ECC4];2:Single
 0047EA00    fmul        qword ptr [ebp-38]
 0047EA03    fdivp       st(1),st
 0047EA05    fstp        qword ptr [ebp-18]
 0047EA08    wait
 0047EA09    mov         edx,dword ptr [ebp-4]
 0047EA0C    mov         edx,edi
 0047EA0E    sub         edx,eax
 0047EA10    mov         dword ptr [ebp-8C],edx
 0047EA16    fild        dword ptr [ebp-8C]
 0047EA1C    fmul        qword ptr [ebp-48]
 0047EA1F    fstp        qword ptr [ebp-40]
 0047EA22    wait
 0047EA23    fld         qword ptr [ebp-40]
 0047EA26    fchs
 0047EA28    mov         dword ptr [ebp-8C],edi
 0047EA2E    fild        dword ptr [ebp-8C]
 0047EA34    fmulp       st(1),st
 0047EA36    fld         dword ptr ds:[47ECC4];2:Single
 0047EA3C    fmul        qword ptr [ebp-38]
 0047EA3F    fdivp       st(1),st
 0047EA41    fstp        qword ptr [ebp-10]
 0047EA44    wait
 0047EA45    mov         al,byte ptr [ebx+0B8]
 0047EA4B    test        al,al
>0047EA4D    je          0047EA53
 0047EA4F    sub         al,4
>0047EA51    jne         0047EA71
 0047EA53    mov         dword ptr [ebp-8C],esi
 0047EA59    fild        dword ptr [ebp-8C]
 0047EA5F    fmul        dword ptr [ebx+0BC]
 0047EA65    fdivr       dword ptr [ebx+9C]
 0047EA6B    fstp        qword ptr [ebp-48]
 0047EA6E    wait
>0047EA6F    jmp         0047EA9B
 0047EA71    fld         dword ptr ds:[47ECC8];100:Single
 0047EA77    fmul        dword ptr [ebx+9C]
 0047EA7D    mov         dword ptr [ebp-8C],esi
 0047EA83    fild        dword ptr [ebp-8C]
 0047EA89    fmul        dword ptr [ebx+90]
 0047EA8F    fmul        dword ptr [ebx+0BC]
 0047EA95    fdivp       st(1),st
 0047EA97    fstp        qword ptr [ebp-48]
 0047EA9A    wait
 0047EA9B    mov         edx,dword ptr [ebp-4]
 0047EA9E    mov         edx,dword ptr [edx+0C]
 0047EAA1    add         edx,edx
 0047EAA3    mov         eax,dword ptr [ebp-4]
 0047EAA6    mov         eax,dword ptr [eax+4]
 0047EAA9    add         eax,eax
 0047EAAB    add         edx,eax
 0047EAAD    sub         edx,esi
 0047EAAF    mov         dword ptr [ebp-8C],edx
 0047EAB5    fild        dword ptr [ebp-8C]
 0047EABB    fmul        qword ptr [ebp-48]
 0047EABE    fstp        qword ptr [ebp-40]
 0047EAC1    wait
 0047EAC2    mov         dword ptr [ebp-8C],esi
 0047EAC8    fild        dword ptr [ebp-8C]
 0047EACE    fmul        qword ptr [ebp-40]
 0047EAD1    fld         dword ptr ds:[47ECC4];2:Single
 0047EAD7    fmul        qword ptr [ebp-38]
 0047EADA    fdivp       st(1),st
 0047EADC    fstp        qword ptr [ebp-20]
 0047EADF    wait
 0047EAE0    mov         edx,dword ptr [ebp-4]
 0047EAE3    mov         edx,esi
 0047EAE5    sub         edx,eax
 0047EAE7    mov         dword ptr [ebp-8C],edx
 0047EAED    fild        dword ptr [ebp-8C]
 0047EAF3    fmul        qword ptr [ebp-48]
 0047EAF6    fstp        qword ptr [ebp-40]
 0047EAF9    wait
 0047EAFA    fld         qword ptr [ebp-40]
 0047EAFD    fchs
 0047EAFF    mov         dword ptr [ebp-8C],esi
 0047EB05    fild        dword ptr [ebp-8C]
 0047EB0B    fmulp       st(1),st
 0047EB0D    fld         dword ptr ds:[47ECC4];2:Single
 0047EB13    fmul        qword ptr [ebp-38]
 0047EB16    fdivp       st(1),st
 0047EB18    fstp        qword ptr [ebp-28]
 0047EB1B    wait
 0047EB1C    fld         dword ptr [ebx+90]
 0047EB22    fmul        dword ptr ds:[47ECC4];2:Single
 0047EB28    fild        dword ptr [ebp+8]
 0047EB2B    fmulp       st(1),st
 0047EB2D    fld         tbyte ptr ds:[47ECCC];25.4:Extended
 0047EB33    fmul        qword ptr [ebp-38]
 0047EB36    fdivp       st(1),st
 0047EB38    fmul        dword ptr [ebx+9C]
 0047EB3E    fstp        dword ptr [ebx+98]
 0047EB44    wait
 0047EB45    fld         dword ptr [ebx+98]
 0047EB4B    fadd        dword ptr [ebx+94]
 0047EB51    fstp        qword ptr [ebp-30]
 0047EB54    wait
 0047EB55    mov         al,byte ptr [ebx+0B8]
 0047EB5B    sub         al,1
>0047EB5D    jb          0047EB6E
>0047EB5F    je          0047EC4E
 0047EB65    sub         al,3
>0047EB67    je          0047EBA3
>0047EB69    jmp         0047EC80
 0047EB6E    push        dword ptr [ebp-2C]
 0047EB71    push        dword ptr [ebp-30]
 0047EB74    fld         dword ptr [ebx+98]
 0047EB7A    add         esp,0FFFFFFF8
 0047EB7D    fstp        qword ptr [esp]
 0047EB80    wait
 0047EB81    push        dword ptr [ebp-1C]
 0047EB84    push        dword ptr [ebp-20]
 0047EB87    push        dword ptr [ebp-24]
 0047EB8A    push        dword ptr [ebp-28]
 0047EB8D    push        dword ptr [ebp-14]
 0047EB90    push        dword ptr [ebp-18]
 0047EB93    push        dword ptr [ebp-0C]
 0047EB96    push        dword ptr [ebp-10]
 0047EB99    call        OpenGL32.glFrustum
>0047EB9E    jmp         0047EC94
 0047EBA3    mov         eax,[005AE67C];^gvar_005ACFB4
 0047EBA8    mov         esi,eax
 0047EBAA    lea         edi,[ebp-88]
 0047EBB0    mov         ecx,10
 0047EBB5    rep movs    dword ptr [edi],dword ptr [esi]
 0047EBB7    fld         dword ptr ds:[47ECC4];2:Single
 0047EBBD    fmul        dword ptr [ebx+98]
 0047EBC3    fld         qword ptr [ebp-18]
 0047EBC6    fsub        qword ptr [ebp-10]
 0047EBC9    fdivp       st(1),st
 0047EBCB    fstp        dword ptr [ebp-88]
 0047EBD1    wait
 0047EBD2    fld         dword ptr ds:[47ECC4];2:Single
 0047EBD8    fmul        dword ptr [ebx+98]
 0047EBDE    fld         qword ptr [ebp-20]
 0047EBE1    fsub        qword ptr [ebp-28]
 0047EBE4    fdivp       st(1),st
 0047EBE6    fstp        dword ptr [ebp-74]
 0047EBE9    wait
 0047EBEA    fld         qword ptr [ebp-18]
 0047EBED    fadd        qword ptr [ebp-10]
 0047EBF0    fld         qword ptr [ebp-18]
 0047EBF3    fsub        qword ptr [ebp-10]
 0047EBF6    fdivp       st(1),st
 0047EBF8    fstp        dword ptr [ebp-68]
 0047EBFB    wait
 0047EBFC    fld         qword ptr [ebp-20]
 0047EBFF    fadd        qword ptr [ebp-28]
 0047EC02    fld         qword ptr [ebp-20]
 0047EC05    fsub        qword ptr [ebp-28]
 0047EC08    fdivp       st(1),st
 0047EC0A    fstp        dword ptr [ebp-64]
 0047EC0D    wait
 0047EC0E    fld         dword ptr ds:[5AD560];9.99999974737875E-5:Single
 0047EC14    fsub        dword ptr ds:[47ECD8];1:Single
 0047EC1A    fstp        dword ptr [ebp-60]
 0047EC1D    wait
 0047EC1E    mov         dword ptr [ebp-5C],0BF800000
 0047EC25    fld         dword ptr ds:[5AD560];9.99999974737875E-5:Single
 0047EC2B    fsub        dword ptr ds:[47ECC4];2:Single
 0047EC31    fmul        dword ptr [ebx+98]
 0047EC37    fstp        dword ptr [ebp-50]
 0047EC3A    wait
 0047EC3B    xor         eax,eax
 0047EC3D    mov         dword ptr [ebp-4C],eax
 0047EC40    lea         eax,[ebp-88]
 0047EC46    push        eax
 0047EC47    call        OpenGL32.glMultMatrixf
>0047EC4C    jmp         0047EC94
 0047EC4E    push        dword ptr [ebp-2C]
 0047EC51    push        dword ptr [ebp-30]
 0047EC54    fld         dword ptr [ebx+98]
 0047EC5A    add         esp,0FFFFFFF8
 0047EC5D    fstp        qword ptr [esp]
 0047EC60    wait
 0047EC61    push        dword ptr [ebp-1C]
 0047EC64    push        dword ptr [ebp-20]
 0047EC67    push        dword ptr [ebp-24]
 0047EC6A    push        dword ptr [ebp-28]
 0047EC6D    push        dword ptr [ebp-14]
 0047EC70    push        dword ptr [ebp-18]
 0047EC73    push        dword ptr [ebp-0C]
 0047EC76    push        dword ptr [ebp-10]
 0047EC79    call        OpenGL32.glOrtho
>0047EC7E    jmp         0047EC94
 0047EC80    mov         ecx,12FB
 0047EC85    mov         edx,47ECE4;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047EC8A    mov         eax,47ED1C;'Assertion failure'
 0047EC8F    call        @Assert
 0047EC94    fld         qword ptr [ebp-18]
 0047EC97    add         esp,0FFFFFFFC
 0047EC9A    fstp        dword ptr [esp]
 0047EC9D    wait
 0047EC9E    fld         qword ptr [ebp-20]
 0047ECA1    add         esp,0FFFFFFFC
 0047ECA4    fstp        dword ptr [esp]
 0047ECA7    wait
 0047ECA8    call        0045D3F0
 0047ECAD    fdiv        dword ptr [ebx+98]
 0047ECB3    fstp        dword ptr [ebx+0A0]
 0047ECB9    wait
 0047ECBA    pop         edi
 0047ECBB    pop         esi
 0047ECBC    pop         ebx
 0047ECBD    mov         esp,ebp
 0047ECBF    pop         ebp
 0047ECC0    ret         8
end;*}

//0047ED30
procedure TGLCamera.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0047ED30    push        ebx
 0047ED31    push        esi
 0047ED32    push        edi
 0047ED33    mov         ebx,ecx
 0047ED35    mov         esi,edx
 0047ED37    mov         edi,eax
 0047ED39    cmp         bl,1
>0047ED3C    jne         0047ED4F
 0047ED3E    cmp         esi,dword ptr [edi+0A4];TGLCamera.TargetObject:TGLBaseSceneObject
>0047ED44    jne         0047ED4F
 0047ED46    xor         edx,edx
 0047ED48    mov         eax,edi
 0047ED4A    call        TGLCamera.SetTargetObject
 0047ED4F    mov         ecx,ebx
 0047ED51    mov         edx,esi
 0047ED53    mov         eax,edi
 0047ED55    call        TComponent.Notification
 0047ED5A    pop         edi
 0047ED5B    pop         esi
 0047ED5C    pop         ebx
 0047ED5D    ret
*}
end;

//0047ED60
procedure TGLCamera.SetTargetObject(Value:TGLBaseSceneObject);
begin
{*
 0047ED60    push        ebx
 0047ED61    push        esi
 0047ED62    mov         esi,edx
 0047ED64    mov         ebx,eax
 0047ED66    mov         eax,dword ptr [ebx+0A4];TGLCamera.TargetObject:TGLBaseSceneObject
 0047ED6C    cmp         esi,eax
>0047ED6E    je          0047ED9B
 0047ED70    test        eax,eax
>0047ED72    je          0047ED7B
 0047ED74    mov         edx,ebx
 0047ED76    call        TComponent.RemoveFreeNotification
 0047ED7B    mov         eax,esi
 0047ED7D    mov         dword ptr [ebx+0A4],eax;TGLCamera.TargetObject:TGLBaseSceneObject
 0047ED83    test        eax,eax
>0047ED85    je          0047ED8E
 0047ED87    mov         edx,ebx
 0047ED89    call        TComponent.FreeNotification
 0047ED8E    test        byte ptr [ebx+1C],1;TGLCamera.FComponentState:TComponentState
>0047ED92    jne         0047ED9B
 0047ED94    mov         eax,ebx
 0047ED96    call        0047CF48
 0047ED9B    pop         esi
 0047ED9C    pop         ebx
 0047ED9D    ret
*}
end;

//0047EDA0
{*procedure sub_0047EDA0(?:?; ?:?);
begin
 0047EDA0    push        ebp
 0047EDA1    mov         ebp,esp
 0047EDA3    add         esp,0FFFFFFD0
 0047EDA6    push        ebx
 0047EDA7    push        esi
 0047EDA8    push        edi
 0047EDA9    mov         ebx,eax
 0047EDAB    cmp         dword ptr [ebx+0A4],0
>0047EDB2    je          0047EE38
 0047EDB8    lea         edx,[ebp-20]
 0047EDBB    mov         eax,dword ptr [ebx+0A4]
 0047EDC1    call        0047BD64
 0047EDC6    lea         eax,[ebp-20]
 0047EDC9    push        eax
 0047EDCA    lea         edx,[ebp-30]
 0047EDCD    mov         eax,ebx
 0047EDCF    call        0047BD64
 0047EDD4    lea         eax,[ebp-30]
 0047EDD7    lea         ecx,[ebp-10]
 0047EDDA    pop         edx
 0047EDDB    call        0045CC04
 0047EDE0    fld         dword ptr ds:[47EE44];1:Single
 0047EDE6    fsub        dword ptr [ebp+8]
 0047EDE9    fchs
 0047EDEB    add         esp,0FFFFFFFC
 0047EDEE    fstp        dword ptr [esp]
 0047EDF1    wait
 0047EDF2    lea         eax,[ebp-10]
 0047EDF5    call        0045D78C
 0047EDFA    lea         edx,[ebp-20]
 0047EDFD    mov         eax,ebx
 0047EDFF    call        0047BD64
 0047EE04    lea         edx,[ebp-20]
 0047EE07    lea         eax,[ebp-10]
 0047EE0A    call        0045CAF8
 0047EE0F    mov         esi,dword ptr [ebx+58]
 0047EE12    test        esi,esi
>0047EE14    je          0047EE2D
 0047EE16    lea         ecx,[ebp-20]
 0047EE19    lea         edx,[ebp-10]
 0047EE1C    mov         eax,esi
 0047EE1E    call        0047BD80
 0047EE23    lea         esi,[ebp-20]
 0047EE26    lea         edi,[ebp-10]
 0047EE29    movs        dword ptr [edi],dword ptr [esi]
 0047EE2A    movs        dword ptr [edi],dword ptr [esi]
 0047EE2B    movs        dword ptr [edi],dword ptr [esi]
 0047EE2C    movs        dword ptr [edi],dword ptr [esi]
 0047EE2D    lea         edx,[ebp-10]
 0047EE30    mov         eax,dword ptr [ebx+44]
 0047EE33    call        0046B878
 0047EE38    pop         edi
 0047EE39    pop         esi
 0047EE3A    pop         ebx
 0047EE3B    mov         esp,ebp
 0047EE3D    pop         ebp
 0047EE3E    ret         4
end;*}

//0047EE48
{*procedure TGLCamera.SetDepthOfView(Value:Single; ?:?);
begin
 0047EE48    push        ebp
 0047EE49    mov         ebp,esp
 0047EE4B    mov         edx,eax
 0047EE4D    fld         dword ptr [edx+94];TGLCamera.DepthOfView:Single
 0047EE53    fcomp       dword ptr [ebp+8]
 0047EE56    fnstsw      al
 0047EE58    sahf
>0047EE59    je          0047EE71
 0047EE5B    mov         eax,dword ptr [ebp+8]
 0047EE5E    mov         dword ptr [edx+94],eax;TGLCamera.DepthOfView:Single
 0047EE64    test        byte ptr [edx+1C],1;TGLCamera.FComponentState:TComponentState
>0047EE68    jne         0047EE71
 0047EE6A    mov         eax,edx
 0047EE6C    call        0047CF48
 0047EE71    pop         ebp
 0047EE72    ret         4
end;*}

//0047EE78
{*procedure TGLCamera.SetFocalLength(Value:Single; ?:?);
begin
 0047EE78    push        ebp
 0047EE79    mov         ebp,esp
 0047EE7B    mov         edx,eax
 0047EE7D    fld         dword ptr [ebp+8]
 0047EE80    fcomp       dword ptr ds:[47EEBC];0:Single
 0047EE86    fnstsw      al
 0047EE88    sahf
>0047EE89    ja          0047EE92
 0047EE8B    mov         dword ptr [ebp+8],3F800000
 0047EE92    fld         dword ptr [edx+90];TGLCamera.FocalLength:Single
 0047EE98    fcomp       dword ptr [ebp+8]
 0047EE9B    fnstsw      al
 0047EE9D    sahf
>0047EE9E    je          0047EEB6
 0047EEA0    mov         eax,dword ptr [ebp+8]
 0047EEA3    mov         dword ptr [edx+90],eax;TGLCamera.FocalLength:Single
 0047EEA9    test        byte ptr [edx+1C],1;TGLCamera.FComponentState:TComponentState
>0047EEAD    jne         0047EEB6
 0047EEAF    mov         eax,edx
 0047EEB1    call        0047CF48
 0047EEB6    pop         ebp
 0047EEB7    ret         4
end;*}

//0047EEC0
{*function sub_0047EEC0(?:?; ?:?):?;
begin
 0047EEC0    push        ebp
 0047EEC1    mov         ebp,esp
 0047EEC3    push        ecx
 0047EEC4    push        ebx
 0047EEC5    mov         ebx,eax
 0047EEC7    fld         dword ptr [ebx+90]
 0047EECD    fcomp       dword ptr ds:[47EF20];0:Single
 0047EED3    fnstsw      al
 0047EED5    sahf
>0047EED6    jne         0047EEDF
 0047EED8    xor         eax,eax
 0047EEDA    mov         dword ptr [ebp-4],eax
>0047EEDD    jmp         0047EF17
 0047EEDF    fld         dword ptr [ebp+8]
 0047EEE2    fmul        dword ptr ds:[47EF24];0.5:Single
 0047EEE8    add         esp,0FFFFFFF4
 0047EEEB    fstp        tbyte ptr [esp]
 0047EEEE    wait
 0047EEEF    fld         dword ptr [ebx+90]
 0047EEF5    add         esp,0FFFFFFF4
 0047EEF8    fstp        tbyte ptr [esp]
 0047EEFB    wait
 0047EEFC    call        0045F610
 0047EF01    fmul        dword ptr ds:[47EF28];2:Single
 0047EF07    add         esp,0FFFFFFF4
 0047EF0A    fstp        tbyte ptr [esp]
 0047EF0D    wait
 0047EF0E    call        0045F4BC
 0047EF13    fstp        dword ptr [ebp-4]
 0047EF16    wait
 0047EF17    fld         dword ptr [ebp-4]
 0047EF1A    pop         ebx
 0047EF1B    pop         ecx
 0047EF1C    pop         ebp
 0047EF1D    ret         4
end;*}

//0047EF2C
{*procedure sub_0047EF2C(?:?; ?:?; ?:?);
begin
 0047EF2C    push        ebp
 0047EF2D    mov         ebp,esp
 0047EF2F    push        ebx
 0047EF30    mov         ebx,eax
 0047EF32    fld         dword ptr [ebp+0C]
 0047EF35    fdiv        dword ptr ds:[47EF70];2:Single
 0047EF3B    add         esp,0FFFFFFF4
 0047EF3E    fstp        tbyte ptr [esp]
 0047EF41    wait
 0047EF42    call        0045F480
 0047EF47    add         esp,0FFFFFFF4
 0047EF4A    fstp        tbyte ptr [esp]
 0047EF4D    wait
 0047EF4E    call        0045F630
 0047EF53    fmul        dword ptr ds:[47EF70];2:Single
 0047EF59    fdivr       dword ptr [ebp+8]
 0047EF5C    add         esp,0FFFFFFFC
 0047EF5F    fstp        dword ptr [esp]
 0047EF62    wait
 0047EF63    mov         eax,ebx
 0047EF65    call        TGLCamera.SetFocalLength
 0047EF6A    pop         ebx
 0047EF6B    pop         ebp
 0047EF6C    ret         8
end;*}

//0047EF74
procedure TGLCamera.SetCameraStyle(Value:TGLCameraStyle);
begin
{*
 0047EF74    push        esi
 0047EF75    mov         esi,eax
 0047EF77    cmp         dl,byte ptr [esi+0B8];TGLCamera.CameraStyle:TGLCameraStyle
>0047EF7D    je          0047EF8E
 0047EF7F    mov         byte ptr [esi+0B8],dl;TGLCamera.CameraStyle:TGLCameraStyle
 0047EF85    mov         edx,esi
 0047EF87    mov         eax,esi
 0047EF89    mov         ecx,dword ptr [eax]
 0047EF8B    call        dword ptr [ecx+34];TGLCamera.sub_0047DACC
 0047EF8E    pop         esi
 0047EF8F    ret
*}
end;

//0047EF90
{*procedure TGLCamera.SetSceneScale(Value:Single; ?:?);
begin
 0047EF90    push        ebp
 0047EF91    mov         ebp,esp
 0047EF93    mov         edx,eax
 0047EF95    fld         dword ptr [ebp+8]
 0047EF98    fcomp       dword ptr ds:[47EFCC];0:Single
 0047EF9E    fnstsw      al
 0047EFA0    sahf
>0047EFA1    jne         0047EFAA
 0047EFA3    mov         dword ptr [ebp+8],3F800000
 0047EFAA    fld         dword ptr [edx+0BC];TGLCamera.SceneScale:Single
 0047EFB0    fcomp       dword ptr [ebp+8]
 0047EFB3    fnstsw      al
 0047EFB5    sahf
>0047EFB6    je          0047EFC8
 0047EFB8    mov         eax,dword ptr [ebp+8]
 0047EFBB    mov         dword ptr [edx+0BC],eax;TGLCamera.SceneScale:Single
 0047EFC1    mov         eax,edx
 0047EFC3    mov         ecx,dword ptr [eax]
 0047EFC5    call        dword ptr [ecx+34];TGLCamera.sub_0047DACC
 0047EFC8    pop         ebp
 0047EFC9    ret         4
end;*}

//0047EFD0
function TGLCamera.IsStoredSceneScale(Value:Single):Boolean;
begin
{*
 0047EFD0    mov         edx,eax
 0047EFD2    fld         dword ptr [edx+0BC];TGLCamera.SceneScale:Single
 0047EFD8    fcomp       dword ptr ds:[47EFE8];1:Single
 0047EFDE    fnstsw      al
 0047EFE0    sahf
 0047EFE1    setne       al
 0047EFE4    ret
*}
end;

//0047EFEC
{*procedure TGLCamera.SetNearPlaneBias(Value:Single; ?:?);
begin
 0047EFEC    push        ebp
 0047EFED    mov         ebp,esp
 0047EFEF    mov         edx,eax
 0047EFF1    fld         dword ptr [ebp+8]
 0047EFF4    fcomp       dword ptr ds:[47F028];0:Single
 0047EFFA    fnstsw      al
 0047EFFC    sahf
>0047EFFD    ja          0047F006
 0047EFFF    mov         dword ptr [ebp+8],3F800000
 0047F006    fld         dword ptr [edx+9C];TGLCamera.NearPlaneBias:Single
 0047F00C    fcomp       dword ptr [ebp+8]
 0047F00F    fnstsw      al
 0047F011    sahf
>0047F012    je          0047F024
 0047F014    mov         eax,dword ptr [ebp+8]
 0047F017    mov         dword ptr [edx+9C],eax;TGLCamera.NearPlaneBias:Single
 0047F01D    mov         eax,edx
 0047F01F    mov         ecx,dword ptr [eax]
 0047F021    call        dword ptr [ecx+34];TGLCamera.sub_0047DACC
 0047F024    pop         ebp
 0047F025    ret         4
end;*}

//0047F02C
function TGLCamera.IsStoredNearPlaneBias(Value:Single):Boolean;
begin
{*
 0047F02C    mov         edx,eax
 0047F02E    fld         dword ptr [edx+9C];TGLCamera.NearPlaneBias:Single
 0047F034    fcomp       dword ptr ds:[47F044];1:Single
 0047F03A    fnstsw      al
 0047F03C    sahf
 0047F03D    setne       al
 0047F040    ret
*}
end;

//0047F048
{*procedure sub_0047F048(?:?; ?:?);
begin
 0047F048    push        ebp
 0047F049    mov         ebp,esp
 0047F04B    push        ebx
 0047F04C    push        esi
 0047F04D    mov         esi,edx
 0047F04F    mov         ebx,eax
 0047F051    cmp         byte ptr [ebp+8],0
>0047F055    je          0047F076
 0047F057    mov         eax,ebx
 0047F059    call        0047BA94
 0047F05E    test        eax,eax
>0047F060    jle         0047F076
 0047F062    push        esi
 0047F063    mov         eax,ebx
 0047F065    call        0047BA94
 0047F06A    mov         ecx,eax
 0047F06C    dec         ecx
 0047F06D    xor         edx,edx
 0047F06F    mov         eax,ebx
 0047F071    mov         ebx,dword ptr [eax]
 0047F073    call        dword ptr [ebx+6C];TGLCamera.sub_0047D7AC
 0047F076    pop         esi
 0047F077    pop         ebx
 0047F078    pop         ebp
 0047F079    ret         4
end;*}

//0047F07C
procedure sub_0047F07C;
begin
{*
 0047F07C    push        ebp
 0047F07D    mov         ebp,esp
 0047F07F    xor         eax,eax
 0047F081    pop         ebp
 0047F082    ret         8
*}
end;

//0047F088
{*procedure sub_0047F088(?:?; ?:?; ?:?);
begin
 0047F088    push        ebp
 0047F089    mov         ebp,esp
 0047F08B    push        ebx
 0047F08C    push        esi
 0047F08D    push        edi
 0047F08E    mov         edi,edx
 0047F090    mov         esi,eax
 0047F092    test        cl,cl
>0047F094    je          0047F0BF
 0047F096    test        byte ptr [esi+3C],1;TGLImmaterialSceneObject.?f3C:byte
>0047F09A    jne         0047F0A5
 0047F09C    cmp         byte ptr [edi+0FC],0
>0047F0A3    je          0047F0B0
 0047F0A5    mov         edx,edi
 0047F0A7    mov         eax,esi
 0047F0A9    mov         ecx,dword ptr [eax]
 0047F0AB    call        dword ptr [ecx+64];TGLImmaterialSceneObject.sub_0047B730
>0047F0AE    jmp         0047F0BF
 0047F0B0    mov         edx,edi
 0047F0B2    mov         eax,esi
 0047F0B4    mov         ecx,dword ptr [eax]
 0047F0B6    call        dword ptr [ecx+44];TGLImmaterialSceneObject.sub_0047B5BC
 0047F0B9    push        eax
 0047F0BA    call        OpenGL32.glCallList
 0047F0BF    cmp         byte ptr [ebp+8],0
>0047F0C3    je          0047F0D6
 0047F0C5    push        edi
 0047F0C6    mov         eax,dword ptr [esi+60];TGLImmaterialSceneObject.?f60:TPersistentObjectList
 0047F0C9    mov         ecx,dword ptr [eax+0C];TPersistentObjectList.?fC:dword
 0047F0CC    dec         ecx
 0047F0CD    xor         edx,edx
 0047F0CF    mov         eax,esi
 0047F0D1    mov         ebx,dword ptr [eax]
 0047F0D3    call        dword ptr [ebx+6C];TGLImmaterialSceneObject.sub_0047D7AC
 0047F0D6    pop         edi
 0047F0D7    pop         esi
 0047F0D8    pop         ebx
 0047F0D9    pop         ebp
 0047F0DA    ret         4
end;*}

//0047F0E0
constructor TGLCameraInvariantObject.Create(AOwner:TComponent);
begin
{*
 0047F0E0    push        ebx
 0047F0E1    push        esi
 0047F0E2    test        dl,dl
>0047F0E4    je          0047F0EE
 0047F0E6    add         esp,0FFFFFFF0
 0047F0E9    call        @ClassCreate
 0047F0EE    mov         ebx,edx
 0047F0F0    mov         esi,eax
 0047F0F2    xor         edx,edx
 0047F0F4    mov         eax,esi
 0047F0F6    call        TGLCustomSceneObject.Create
 0047F0FB    mov         byte ptr [esi+98],0;TGLCameraInvariantObject.?f98:byte
 0047F102    mov         eax,esi
 0047F104    test        bl,bl
>0047F106    je          0047F117
 0047F108    call        @AfterConstruction
 0047F10D    pop         dword ptr fs:[0]
 0047F114    add         esp,0C
 0047F117    mov         eax,esi
 0047F119    pop         esi
 0047F11A    pop         ebx
 0047F11B    ret
*}
end;

//0047F11C
procedure TGLCameraInvariantObject.Assign(Source:TPersistent);
begin
{*
 0047F11C    push        ebx
 0047F11D    push        esi
 0047F11E    mov         esi,edx
 0047F120    mov         ebx,eax
 0047F122    mov         eax,esi
 0047F124    mov         edx,dword ptr ds:[479654];TGLCameraInvariantObject
 0047F12A    call        @IsClass
 0047F12F    test        al,al
>0047F131    je          0047F13F
 0047F133    mov         al,byte ptr [esi+98]
 0047F139    mov         byte ptr [ebx+98],al;TGLCameraInvariantObject.?f98:byte
 0047F13F    mov         edx,esi
 0047F141    mov         eax,ebx
 0047F143    call        TGLCustomSceneObject.Assign
 0047F148    pop         esi
 0047F149    pop         ebx
 0047F14A    ret
*}
end;

//0047F14C
{*procedure sub_0047F14C(?:?; ?:?; ?:?);
begin
 0047F14C    push        ebp
 0047F14D    mov         ebp,esp
 0047F14F    add         esp,0FFFFFFBC
 0047F152    push        ebx
 0047F153    push        esi
 0047F154    mov         ebx,ecx
 0047F156    mov         esi,edx
 0047F158    mov         dword ptr [ebp-4],eax
 0047F15B    mov         eax,dword ptr [ebp-4]
 0047F15E    cmp         byte ptr [eax+98],0;TGLCameraInvariantObject.?f98:byte
>0047F165    je          0047F285
 0047F16B    call        OpenGL32.glPushMatrix
 0047F170    mov         eax,dword ptr [ebp-4]
 0047F173    mov         al,byte ptr [eax+98];TGLCameraInvariantObject.?f98:byte
 0047F179    dec         al
>0047F17B    je          0047F183
 0047F17D    dec         al
>0047F17F    je          0047F1A5
>0047F181    jmp         0047F1C0
 0047F183    mov         eax,dword ptr [ebp-4]
 0047F186    mov         eax,dword ptr [eax+5C];TGLCameraInvariantObject.?f5C:TComponent
 0047F189    mov         eax,dword ptr [eax+4C]
 0047F18C    add         eax,68
 0047F18F    push        eax
 0047F190    call        OpenGL32.glLoadMatrixf
 0047F195    push        dword ptr [esi+10]
 0047F198    push        dword ptr [esi+0C]
 0047F19B    push        dword ptr [esi+8]
 0047F19E    call        OpenGL32.glTranslatef
>0047F1A3    jmp         0047F1D4
 0047F1A5    call        OpenGL32.glLoadIdentity
 0047F1AA    push        0BF800000
 0047F1AF    push        0BF800000
 0047F1B4    push        3F800000
 0047F1B9    call        OpenGL32.glScalef
>0047F1BE    jmp         0047F1D4
 0047F1C0    mov         ecx,14D5
 0047F1C5    mov         edx,47F2A8;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0047F1CA    mov         eax,47F2E0;'Assertion failure'
 0047F1CF    call        @Assert
 0047F1D4    mov         eax,dword ptr [ebp-4]
 0047F1D7    mov         eax,dword ptr [eax+38];TGLCameraInvariantObject.?f38:Pointer
 0047F1DA    push        eax
 0047F1DB    call        OpenGL32.glMultMatrixf
 0047F1E0    lea         eax,[ebp-44]
 0047F1E3    push        eax
 0047F1E4    push        0BA6
 0047F1E9    call        OpenGL32.glGetFloatv
 0047F1EE    lea         edx,[ebp-44]
 0047F1F1    mov         eax,dword ptr [ebp-4]
 0047F1F4    mov         eax,dword ptr [eax+5C];TGLCameraInvariantObject.?f5C:TComponent
 0047F1F7    mov         eax,dword ptr [eax+4C]
 0047F1FA    call        00481558
 0047F1FF    xor         eax,eax
 0047F201    push        ebp
 0047F202    push        47F277
 0047F207    push        dword ptr fs:[eax]
 0047F20A    mov         dword ptr fs:[eax],esp
 0047F20D    test        bl,bl
>0047F20F    je          0047F23F
 0047F211    mov         eax,dword ptr [ebp-4]
 0047F214    test        byte ptr [eax+3C],1;TGLCameraInvariantObject.?f3C:byte
>0047F218    jne         0047F223
 0047F21A    cmp         byte ptr [esi+0FC],0
>0047F221    je          0047F22F
 0047F223    mov         edx,esi
 0047F225    mov         eax,dword ptr [ebp-4]
 0047F228    mov         ecx,dword ptr [eax]
 0047F22A    call        dword ptr [ecx+64];TGLCameraInvariantObject.sub_0047B730
>0047F22D    jmp         0047F23F
 0047F22F    mov         edx,esi
 0047F231    mov         eax,dword ptr [ebp-4]
 0047F234    mov         ecx,dword ptr [eax]
 0047F236    call        dword ptr [ecx+44];TGLCameraInvariantObject.sub_0047B5BC
 0047F239    push        eax
 0047F23A    call        OpenGL32.glCallList
 0047F23F    cmp         byte ptr [ebp+8],0
>0047F243    je          0047F25B
 0047F245    push        esi
 0047F246    mov         eax,dword ptr [ebp-4]
 0047F249    call        0047BA94
 0047F24E    mov         ecx,eax
 0047F250    dec         ecx
 0047F251    xor         edx,edx
 0047F253    mov         eax,dword ptr [ebp-4]
 0047F256    mov         ebx,dword ptr [eax]
 0047F258    call        dword ptr [ebx+6C];TGLCameraInvariantObject.sub_0047D7AC
 0047F25B    xor         eax,eax
 0047F25D    pop         edx
 0047F25E    pop         ecx
 0047F25F    pop         ecx
 0047F260    mov         dword ptr fs:[eax],edx
 0047F263    push        47F27E
 0047F268    mov         eax,dword ptr [ebp-4]
 0047F26B    mov         eax,dword ptr [eax+5C];TGLCameraInvariantObject.?f5C:TComponent
 0047F26E    mov         eax,dword ptr [eax+4C]
 0047F271    call        004815B4
 0047F276    ret
>0047F277    jmp         @HandleFinally
>0047F27C    jmp         0047F268
 0047F27E    call        OpenGL32.glPopMatrix
>0047F283    jmp         0047F295
 0047F285    mov         al,byte ptr [ebp+8]
 0047F288    push        eax
 0047F289    mov         edx,esi
 0047F28B    mov         ecx,ebx
 0047F28D    mov         eax,dword ptr [ebp-4]
 0047F290    call        0047F088
 0047F295    pop         esi
 0047F296    pop         ebx
 0047F297    mov         esp,ebp
 0047F299    pop         ebp
 0047F29A    ret         4
end;*}

//0047F2F4
procedure TGLDummyCube.SetCamInvarianceMode(Value:TGLCameraInvarianceMode);
begin
{*
 0047F2F4    push        esi
 0047F2F5    mov         esi,eax
 0047F2F7    cmp         dl,byte ptr [esi+98];TGLDummyCube.?f98:byte
>0047F2FD    je          0047F30E
 0047F2FF    mov         byte ptr [esi+98],dl;TGLDummyCube.?f98:byte
 0047F305    mov         edx,esi
 0047F307    mov         eax,esi
 0047F309    mov         ecx,dword ptr [eax]
 0047F30B    call        dword ptr [ecx+34];TGLDummyCube.sub_0047DACC
 0047F30E    pop         esi
 0047F30F    ret
*}
end;

//0047F310
constructor TGLDirectOpenGL.Create(AOwner:TComponent);
begin
{*
 0047F310    push        ebx
 0047F311    push        esi
 0047F312    test        dl,dl
>0047F314    je          0047F31E
 0047F316    add         esp,0FFFFFFF0
 0047F319    call        @ClassCreate
 0047F31E    mov         ebx,edx
 0047F320    mov         esi,eax
 0047F322    xor         edx,edx
 0047F324    mov         eax,esi
 0047F326    call        TGLCustomSceneObject.Create
 0047F32B    mov         al,byte ptr [esi+3C];TGLDirectOpenGL.?f3C:byte
 0047F32E    or          al,byte ptr ds:[47F358];0x3 gvar_0047F358
 0047F334    mov         byte ptr [esi+3C],al;TGLDirectOpenGL.?f3C:byte
 0047F337    mov         byte ptr [esi+0A8],0;TGLDirectOpenGL.Blend:Boolean
 0047F33E    mov         eax,esi
 0047F340    test        bl,bl
>0047F342    je          0047F353
 0047F344    call        @AfterConstruction
 0047F349    pop         dword ptr fs:[0]
 0047F350    add         esp,0C
 0047F353    mov         eax,esi
 0047F355    pop         esi
 0047F356    pop         ebx
 0047F357    ret
*}
end;

//0047F35C
procedure TGLDirectOpenGL.Assign(Source:TPersistent);
begin
{*
 0047F35C    push        ebx
 0047F35D    push        esi
 0047F35E    push        edi
 0047F35F    mov         esi,edx
 0047F361    mov         ebx,eax
 0047F363    mov         eax,esi
 0047F365    mov         edx,dword ptr ds:[479ADC];TGLDirectOpenGL
 0047F36B    call        @IsClass
 0047F370    test        al,al
>0047F372    je          0047F3B3
 0047F374    mov         edi,esi
 0047F376    mov         dl,byte ptr [edi+98]
 0047F37C    mov         eax,ebx
 0047F37E    call        TGLDirectOpenGL.SetUseBuildList
 0047F383    mov         eax,dword ptr [edi+0A0]
 0047F389    mov         dword ptr [ebx+0A0],eax;TGLDirectOpenGL.OnRender:TDirectRenderEvent
 0047F38F    mov         eax,dword ptr [edi+0A4]
 0047F395    mov         dword ptr [ebx+0A4],eax;TGLDirectOpenGL.?fA4:dword
 0047F39B    mov         eax,dword ptr [edi+78]
 0047F39E    mov         dword ptr [ebx+78],eax;TGLDirectOpenGL.?f78:dword
 0047F3A1    mov         eax,dword ptr [edi+7C]
 0047F3A4    mov         dword ptr [ebx+7C],eax;TGLDirectOpenGL.?f7C:dword
 0047F3A7    mov         al,byte ptr [edi+0A8]
 0047F3AD    mov         byte ptr [ebx+0A8],al;TGLDirectOpenGL.Blend:Boolean
 0047F3B3    mov         edx,esi
 0047F3B5    mov         eax,ebx
 0047F3B7    call        TGLCustomSceneObject.Assign
 0047F3BC    pop         edi
 0047F3BD    pop         esi
 0047F3BE    pop         ebx
 0047F3BF    ret
*}
end;

//0047F3C0
{*procedure sub_0047F3C0(?:?);
begin
 0047F3C0    push        ebx
 0047F3C1    push        esi
 0047F3C2    mov         esi,edx
 0047F3C4    mov         ebx,eax
 0047F3C6    cmp         word ptr [ebx+0A2],0;TGLDirectOpenGL.?fA2:word
>0047F3CE    je          0047F3E5
 0047F3D0    call        0046A47C
 0047F3D5    mov         ecx,esi
 0047F3D7    mov         edx,ebx
 0047F3D9    mov         eax,dword ptr [ebx+0A4];TGLDirectOpenGL.?fA4:dword
 0047F3DF    call        dword ptr [ebx+0A0];TGLDirectOpenGL.OnRender
 0047F3E5    pop         esi
 0047F3E6    pop         ebx
 0047F3E7    ret
end;*}

//0047F3E8
procedure TGLDirectOpenGL.SetUseBuildList(Value:Boolean);
begin
{*
 0047F3E8    push        ebx
 0047F3E9    mov         ebx,eax
 0047F3EB    cmp         dl,byte ptr [ebx+98];TGLDirectOpenGL.UseBuildList:Boolean
>0047F3F1    je          0047F417
 0047F3F3    mov         byte ptr [ebx+98],dl;TGLDirectOpenGL.UseBuildList:Boolean
 0047F3F9    test        dl,dl
>0047F3FB    je          0047F40C
 0047F3FD    mov         al,[0047F41C];0x1 gvar_0047F41C
 0047F402    not         eax
 0047F404    and         al,byte ptr [ebx+3C];TGLDirectOpenGL.?f3C:byte
 0047F407    mov         byte ptr [ebx+3C],al;TGLDirectOpenGL.?f3C:byte
>0047F40A    jmp         0047F417
 0047F40C    mov         al,[0047F41C];0x1 gvar_0047F41C
 0047F411    or          al,byte ptr [ebx+3C];TGLDirectOpenGL.?f3C:byte
 0047F414    mov         byte ptr [ebx+3C],al;TGLDirectOpenGL.?f3C:byte
 0047F417    pop         ebx
 0047F418    ret
*}
end;

//0047F420
{*function sub_0047F420:?;
begin
 0047F420    mov         al,byte ptr [eax+0A8];TGLDirectOpenGL.Blend:Boolean
 0047F426    ret
end;*}

//0047F428
procedure TGLDirectOpenGL.SetBlend(Value:Boolean);
begin
{*
 0047F428    push        esi
 0047F429    mov         esi,eax
 0047F42B    cmp         dl,byte ptr [esi+0A8];TGLDirectOpenGL.Blend:Boolean
>0047F431    je          0047F444
 0047F433    mov         byte ptr [esi+0A8],dl;TGLDirectOpenGL.Blend:Boolean
 0047F439    mov         eax,esi
 0047F43B    mov         si,0FFE7
 0047F43F    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0047F444    pop         esi
 0047F445    ret
*}
end;

//0047F448
constructor TGLRenderPoint.Create(AOwner:TComponent);
begin
{*
 0047F448    push        ebx
 0047F449    push        esi
 0047F44A    test        dl,dl
>0047F44C    je          0047F456
 0047F44E    add         esp,0FFFFFFF0
 0047F451    call        @ClassCreate
 0047F456    mov         ebx,edx
 0047F458    mov         esi,eax
 0047F45A    xor         edx,edx
 0047F45C    mov         eax,esi
 0047F45E    call        TGLCustomSceneObject.Create
 0047F463    mov         al,byte ptr [esi+3C];TGLRenderPoint.?f3C:byte
 0047F466    or          al,byte ptr ds:[47F48C];0x3 gvar_0047F48C
 0047F46C    mov         byte ptr [esi+3C],al;TGLRenderPoint.?f3C:byte
 0047F46F    mov         eax,esi
 0047F471    test        bl,bl
>0047F473    je          0047F484
 0047F475    call        @AfterConstruction
 0047F47A    pop         dword ptr fs:[0]
 0047F481    add         esp,0C
 0047F484    mov         eax,esi
 0047F486    pop         esi
 0047F487    pop         ebx
 0047F488    ret
*}
end;

//0047F490
destructor TGLRenderPoint.Destroy;
begin
{*
 0047F490    push        ebx
 0047F491    push        esi
 0047F492    call        @BeforeDestruction
 0047F497    mov         ebx,edx
 0047F499    mov         esi,eax
 0047F49B    mov         eax,esi
 0047F49D    call        0047F4F8
 0047F4A2    mov         edx,ebx
 0047F4A4    and         dl,0FC
 0047F4A7    mov         eax,esi
 0047F4A9    call        TGLCustomSceneObject.Destroy
 0047F4AE    test        bl,bl
>0047F4B0    jle         0047F4B9
 0047F4B2    mov         eax,esi
 0047F4B4    call        @ClassDestroy
 0047F4B9    pop         esi
 0047F4BA    pop         ebx
 0047F4BB    ret
*}
end;

//0047F4BC
{*procedure sub_0047F4BC(?:?);
begin
 0047F4BC    push        ebx
 0047F4BD    push        esi
 0047F4BE    push        edi
 0047F4BF    push        ebp
 0047F4C0    push        ecx
 0047F4C1    mov         dword ptr [esp],edx
 0047F4C4    mov         ebx,eax
 0047F4C6    mov         eax,dword ptr [ebx+98];TGLRenderPoint.?f98:.71
 0047F4CC    call        @DynArrayHigh
 0047F4D1    mov         esi,eax
 0047F4D3    test        esi,esi
>0047F4D5    jl          0047F4F2
 0047F4D7    inc         esi
 0047F4D8    xor         edi,edi
 0047F4DA    mov         eax,dword ptr [ebx+98];TGLRenderPoint.?f98:.71
 0047F4E0    lea         ebp,[eax+edi*8]
 0047F4E3    mov         ecx,dword ptr [esp]
 0047F4E6    mov         edx,ebx
 0047F4E8    mov         eax,dword ptr [ebp+4]
 0047F4EB    call        dword ptr [ebp]
 0047F4EE    inc         edi
 0047F4EF    dec         esi
>0047F4F0    jne         0047F4DA
 0047F4F2    pop         edx
 0047F4F3    pop         ebp
 0047F4F4    pop         edi
 0047F4F5    pop         esi
 0047F4F6    pop         ebx
 0047F4F7    ret
end;*}

//0047F4F8
procedure sub_0047F4F8(?:TGLRenderPoint);
begin
{*
 0047F4F8    push        ebx
 0047F4F9    push        esi
 0047F4FA    mov         ebx,eax
>0047F4FC    jmp         0047F53F
 0047F4FE    mov         eax,dword ptr [ebx+98];TGLRenderPoint.?f98:.71
 0047F504    call        @DynArrayHigh
 0047F509    mov         edx,dword ptr [ebx+9C];TGLRenderPoint.?f9C:.81
 0047F50F    lea         esi,[edx+eax*8]
 0047F512    mov         edx,ebx
 0047F514    mov         eax,dword ptr [esi+4]
 0047F517    call        dword ptr [esi]
 0047F519    mov         eax,dword ptr [ebx+98];TGLRenderPoint.?f98:.71
 0047F51F    call        @DynArrayLength
 0047F524    dec         eax
 0047F525    push        eax
 0047F526    lea         eax,[ebx+98];TGLRenderPoint.?f98:.71
 0047F52C    mov         ecx,1
 0047F531    mov         edx,dword ptr ds:[479C3C];.71
 0047F537    call        @DynArraySetLength
 0047F53C    add         esp,4
 0047F53F    mov         eax,dword ptr [ebx+98];TGLRenderPoint.?f98:.71
 0047F545    call        @DynArrayLength
 0047F54A    test        eax,eax
>0047F54C    jg          0047F4FE
 0047F54E    pop         esi
 0047F54F    pop         ebx
 0047F550    ret
*}
end;

//0047F554
constructor TGLProxyObject.Create(AOwner:TComponent);
begin
{*
 0047F554    push        ebx
 0047F555    push        esi
 0047F556    test        dl,dl
>0047F558    je          0047F562
 0047F55A    add         esp,0FFFFFFF0
 0047F55D    call        @ClassCreate
 0047F562    mov         ebx,edx
 0047F564    mov         esi,eax
 0047F566    xor         edx,edx
 0047F568    mov         eax,esi
 0047F56A    call        TGLBaseSceneObject.Create
 0047F56F    mov         al,byte ptr [esi+3C];TGLProxyObject.?f3C:byte
 0047F572    or          al,byte ptr ds:[47F5A0];0x2 gvar_0047F5A0
 0047F578    mov         byte ptr [esi+3C],al;TGLProxyObject.?f3C:byte
 0047F57B    mov         al,[0047F5A4];0x7 gvar_0047F5A4
 0047F580    mov         byte ptr [esi+94],al;TGLProxyObject.ProxyOptions:TGLProxyObjectOptions
 0047F586    mov         eax,esi
 0047F588    test        bl,bl
>0047F58A    je          0047F59B
 0047F58C    call        @AfterConstruction
 0047F591    pop         dword ptr fs:[0]
 0047F598    add         esp,0C
 0047F59B    mov         eax,esi
 0047F59D    pop         esi
 0047F59E    pop         ebx
 0047F59F    ret
*}
end;

//0047F5A8
destructor TGLProxyObject.Destroy;
begin
{*
 0047F5A8    push        ebx
 0047F5A9    push        esi
 0047F5AA    call        @BeforeDestruction
 0047F5AF    mov         ebx,edx
 0047F5B1    mov         esi,eax
 0047F5B3    xor         edx,edx
 0047F5B5    mov         eax,esi
 0047F5B7    mov         ecx,dword ptr [eax]
 0047F5B9    call        dword ptr [ecx+70];TGLProxyObject.SetMasterObject
 0047F5BC    mov         edx,ebx
 0047F5BE    and         dl,0FC
 0047F5C1    mov         eax,esi
 0047F5C3    call        TGLBaseSceneObject.Destroy
 0047F5C8    test        bl,bl
>0047F5CA    jle         0047F5D3
 0047F5CC    mov         eax,esi
 0047F5CE    call        @ClassDestroy
 0047F5D3    pop         esi
 0047F5D4    pop         ebx
 0047F5D5    ret
*}
end;

//0047F5D8
procedure TGLProxyObject.Assign(Source:TPersistent);
begin
{*
 0047F5D8    push        ebx
 0047F5D9    push        esi
 0047F5DA    mov         esi,edx
 0047F5DC    mov         ebx,eax
 0047F5DE    mov         eax,esi
 0047F5E0    mov         edx,dword ptr ds:[479D94];TGLProxyObject
 0047F5E6    call        @IsClass
 0047F5EB    test        al,al
>0047F5ED    je          0047F5FC
 0047F5EF    mov         edx,dword ptr [esi+90]
 0047F5F5    mov         eax,ebx
 0047F5F7    mov         ecx,dword ptr [eax]
 0047F5F9    call        dword ptr [ecx+70];TGLProxyObject.SetMasterObject
 0047F5FC    mov         edx,esi
 0047F5FE    mov         eax,ebx
 0047F600    call        TGLBaseSceneObject.Assign
 0047F605    pop         esi
 0047F606    pop         ebx
 0047F607    ret
*}
end;

//0047F608
{*procedure sub_0047F608(?:?; ?:?; ?:?);
begin
 0047F608    push        ebp
 0047F609    mov         ebp,esp
 0047F60B    add         esp,0FFFFFFF8
 0047F60E    push        ebx
 0047F60F    push        esi
 0047F610    push        edi
 0047F611    mov         byte ptr [ebp-5],cl
 0047F614    mov         esi,edx
 0047F616    mov         dword ptr [ebp-4],eax
 0047F619    mov         eax,dword ptr [ebp-4]
 0047F61C    cmp         byte ptr [eax+95],0;TGLProxyObject.?f95:byte
>0047F623    jne         0047F753
 0047F629    mov         eax,dword ptr [ebp-4]
 0047F62C    mov         byte ptr [eax+95],1;TGLProxyObject.?f95:byte
 0047F633    xor         eax,eax
 0047F635    push        ebp
 0047F636    push        47F744
 0047F63B    push        dword ptr fs:[eax]
 0047F63E    mov         dword ptr fs:[eax],esp
 0047F641    mov         eax,dword ptr [ebp-4]
 0047F644    cmp         dword ptr [eax+90],0;TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F64B    setne       bl
 0047F64E    test        bl,bl
>0047F650    je          0047F672
 0047F652    mov         eax,dword ptr [ebp-4]
 0047F655    test        byte ptr [eax+94],1;TGLProxyObject.ProxyOptions:TGLProxyObjectOptions
>0047F65C    je          0047F672
 0047F65E    mov         eax,dword ptr [ebp-4]
 0047F661    mov         eax,dword ptr [eax+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F667    call        TGLImmaterialSceneObject.GetEffects
 0047F66C    cmp         dword ptr [eax+0C],0
>0047F670    jg          0047F676
 0047F672    xor         eax,eax
>0047F674    jmp         0047F678
 0047F676    mov         al,1
 0047F678    mov         byte ptr [ebp-6],al
 0047F67B    test        bl,bl
>0047F67D    je          0047F6E0
 0047F67F    mov         eax,dword ptr [ebp-4]
 0047F682    test        byte ptr [eax+94],2;TGLProxyObject.ProxyOptions:TGLProxyObjectOptions
>0047F689    je          0047F6E0
 0047F68B    mov         bl,byte ptr [esi+0F9]
 0047F691    mov         byte ptr [esi+0F9],1
 0047F698    mov         eax,dword ptr [ebp-4]
 0047F69B    test        byte ptr [eax+94],4;TGLProxyObject.ProxyOptions:TGLProxyObjectOptions
>0047F6A2    je          0047F6B8
 0047F6A4    mov         eax,dword ptr [ebp-4]
 0047F6A7    mov         eax,dword ptr [eax+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F6AD    call        0047DB0C
 0047F6B2    push        eax
 0047F6B3    call        OpenGL32.glMultMatrixf
 0047F6B8    mov         eax,dword ptr [ebp-4]
 0047F6BB    mov         edi,dword ptr [eax+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F6C1    mov         eax,edi
 0047F6C3    call        0047BA94
 0047F6C8    test        eax,eax
 0047F6CA    setg        al
 0047F6CD    push        eax
 0047F6CE    mov         edx,esi
 0047F6D0    mov         eax,edi
 0047F6D2    mov         cl,byte ptr [ebp-5]
 0047F6D5    mov         edi,dword ptr [eax]
 0047F6D7    call        dword ptr [edi+68];TGLBaseSceneObject.sub_0047D754
 0047F6DA    mov         byte ptr [esi+0F9],bl
 0047F6E0    cmp         byte ptr [ebp+8],0
>0047F6E4    je          0047F708
 0047F6E6    mov         eax,dword ptr [ebp-4]
 0047F6E9    call        0047BA94
 0047F6EE    test        eax,eax
>0047F6F0    jle         0047F708
 0047F6F2    push        esi
 0047F6F3    mov         eax,dword ptr [ebp-4]
 0047F6F6    call        0047BA94
 0047F6FB    mov         ecx,eax
 0047F6FD    dec         ecx
 0047F6FE    xor         edx,edx
 0047F700    mov         eax,dword ptr [ebp-4]
 0047F703    mov         ebx,dword ptr [eax]
 0047F705    call        dword ptr [ebx+6C];TGLProxyObject.sub_0047D7AC
 0047F708    cmp         byte ptr [ebp-6],0
>0047F70C    je          0047F72C
 0047F70E    mov         eax,dword ptr [ebp-4]
 0047F711    mov         eax,dword ptr [eax+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F717    call        TGLImmaterialSceneObject.GetEffects
 0047F71C    mov         ecx,esi
 0047F71E    mov         edx,dword ptr [ebp-4]
 0047F721    mov         edx,dword ptr [edx+5C];TGLProxyObject.?f5C:TComponent
 0047F724    mov         edx,dword ptr [edx+4C]
 0047F727    call        0047E2A8
 0047F72C    xor         eax,eax
 0047F72E    pop         edx
 0047F72F    pop         ecx
 0047F730    pop         ecx
 0047F731    mov         dword ptr fs:[eax],edx
 0047F734    push        47F74B
 0047F739    mov         eax,dword ptr [ebp-4]
 0047F73C    mov         byte ptr [eax+95],0;TGLProxyObject.?f95:byte
 0047F743    ret
>0047F744    jmp         @HandleFinally
>0047F749    jmp         0047F739
 0047F74B    mov         eax,dword ptr [ebp-4]
 0047F74E    call        0047CEF4
 0047F753    pop         edi
 0047F754    pop         esi
 0047F755    pop         ebx
 0047F756    pop         ecx
 0047F757    pop         ecx
 0047F758    pop         ebp
 0047F759    ret         4
end;*}

//0047F75C
{*procedure sub_0047F75C(?:?);
begin
 0047F75C    push        ebx
 0047F75D    push        esi
 0047F75E    push        edi
 0047F75F    mov         esi,edx
 0047F761    mov         ebx,eax
 0047F763    mov         edi,dword ptr [ebx+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F769    test        edi,edi
>0047F76B    je          0047F778
 0047F76D    mov         edx,esi
 0047F76F    mov         eax,edi
 0047F771    mov         ecx,dword ptr [eax]
 0047F773    call        dword ptr [ecx+4C];TGLBaseSceneObject.sub_0047BE58
>0047F776    jmp         0047F781
 0047F778    mov         edx,esi
 0047F77A    mov         eax,ebx
 0047F77C    call        0047BE58
 0047F781    pop         edi
 0047F782    pop         esi
 0047F783    pop         ebx
 0047F784    ret
end;*}

//0047F788
procedure TGLProxyObject.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0047F788    push        ebx
 0047F789    push        esi
 0047F78A    push        edi
 0047F78B    mov         ebx,ecx
 0047F78D    mov         esi,edx
 0047F78F    mov         edi,eax
 0047F791    cmp         bl,1
>0047F794    jne         0047F7A7
 0047F796    cmp         esi,dword ptr [edi+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
>0047F79C    jne         0047F7A7
 0047F79E    xor         edx,edx
 0047F7A0    mov         eax,edi
 0047F7A2    mov         ecx,dword ptr [eax]
 0047F7A4    call        dword ptr [ecx+70];TGLProxyObject.SetMasterObject
 0047F7A7    mov         ecx,ebx
 0047F7A9    mov         edx,esi
 0047F7AB    mov         eax,edi
 0047F7AD    call        TComponent.Notification
 0047F7B2    pop         edi
 0047F7B3    pop         esi
 0047F7B4    pop         ebx
 0047F7B5    ret
*}
end;

//0047F7B8
procedure TGLProxyObject.SetMasterObject(Value:TGLBaseSceneObject);
begin
{*
 0047F7B8    push        ebx
 0047F7B9    push        esi
 0047F7BA    mov         esi,edx
 0047F7BC    mov         ebx,eax
 0047F7BE    mov         eax,dword ptr [ebx+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F7C4    cmp         esi,eax
>0047F7C6    je          0047F7F1
 0047F7C8    test        eax,eax
>0047F7CA    je          0047F7D3
 0047F7CC    mov         edx,ebx
 0047F7CE    call        TComponent.RemoveFreeNotification
 0047F7D3    mov         eax,esi
 0047F7D5    mov         dword ptr [ebx+90],eax;TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F7DB    test        eax,eax
>0047F7DD    je          0047F7E6
 0047F7DF    mov         edx,ebx
 0047F7E1    call        TComponent.FreeNotification
 0047F7E6    mov         eax,ebx
 0047F7E8    mov         si,0FFE7
 0047F7EC    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0047F7F1    pop         esi
 0047F7F2    pop         ebx
 0047F7F3    ret
*}
end;

//0047F7F4
procedure TGLProxyObject.SetProxyOptions(Value:TGLProxyObjectOptions);
begin
{*
 0047F7F4    push        ebx
 0047F7F5    push        esi
 0047F7F6    push        ecx
 0047F7F7    mov         byte ptr [esp],dl
 0047F7FA    mov         ebx,eax
 0047F7FC    mov         al,byte ptr [esp]
 0047F7FF    cmp         al,byte ptr [ebx+94];TGLProxyObject.ProxyOptions:TGLProxyObjectOptions
>0047F805    je          0047F81B
 0047F807    mov         al,byte ptr [esp]
 0047F80A    mov         byte ptr [ebx+94],al;TGLProxyObject.ProxyOptions:TGLProxyObjectOptions
 0047F810    mov         eax,ebx
 0047F812    mov         si,0FFE7
 0047F816    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 0047F81B    pop         edx
 0047F81C    pop         esi
 0047F81D    pop         ebx
 0047F81E    ret
*}
end;

//0047F820
{*function sub_0047F820(?:?; ?:?; ?:?; ?:?):?;
begin
 0047F820    push        ebp
 0047F821    mov         ebp,esp
 0047F823    add         esp,0FFFFFFD0
 0047F826    push        ebx
 0047F827    push        esi
 0047F828    push        edi
 0047F829    mov         edi,ecx
 0047F82B    mov         ebx,edx
 0047F82D    mov         esi,eax
 0047F82F    cmp         dword ptr [esi+90],0;TGLProxyObject.MasterObject:TGLBaseSceneObject
>0047F836    je          0047F94D
 0047F83C    lea         ecx,[ebp-30]
 0047F83F    mov         edx,ebx
 0047F841    mov         eax,esi
 0047F843    call        0047BD80
 0047F848    lea         edx,[ebp-30]
 0047F84B    lea         eax,[ebp-10]
 0047F84E    call        0045C9C0
 0047F853    lea         ecx,[ebp-30]
 0047F856    lea         edx,[ebp-10]
 0047F859    mov         eax,dword ptr [esi+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F85F    call        0047BDA0
 0047F864    lea         edx,[ebp-30]
 0047F867    lea         eax,[ebp-10]
 0047F86A    call        0045C9C0
 0047F86F    lea         ecx,[ebp-30]
 0047F872    mov         edx,edi
 0047F874    mov         eax,esi
 0047F876    call        0047BD80
 0047F87B    lea         edx,[ebp-30]
 0047F87E    lea         eax,[ebp-20]
 0047F881    call        0045C9C0
 0047F886    lea         ecx,[ebp-30]
 0047F889    lea         edx,[ebp-20]
 0047F88C    mov         eax,dword ptr [esi+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F892    call        0047BDA0
 0047F897    lea         edx,[ebp-30]
 0047F89A    lea         eax,[ebp-20]
 0047F89D    call        0045C9C0
 0047F8A2    lea         eax,[ebp-20]
 0047F8A5    call        0045D5EC
 0047F8AA    mov         eax,dword ptr [ebp+0C]
 0047F8AD    push        eax
 0047F8AE    mov         eax,dword ptr [ebp+8]
 0047F8B1    push        eax
 0047F8B2    lea         ecx,[ebp-20]
 0047F8B5    lea         edx,[ebp-10]
 0047F8B8    mov         eax,dword ptr [esi+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F8BE    mov         ebx,dword ptr [eax]
 0047F8C0    call        dword ptr [ebx+54];TGLBaseSceneObject.sub_0047C040
 0047F8C3    mov         ebx,eax
 0047F8C5    test        bl,bl
>0047F8C7    je          0047F94F
 0047F8CD    cmp         dword ptr [ebp+0C],0
>0047F8D1    je          0047F90C
 0047F8D3    lea         ecx,[ebp-30]
 0047F8D6    mov         eax,dword ptr [ebp+0C]
 0047F8D9    mov         edx,eax
 0047F8DB    mov         eax,dword ptr [esi+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F8E1    call        0047BD80
 0047F8E6    lea         edx,[ebp-30]
 0047F8E9    mov         edi,dword ptr [ebp+0C]
 0047F8EC    mov         eax,edi
 0047F8EE    call        0045C9C0
 0047F8F3    lea         ecx,[ebp-30]
 0047F8F6    mov         eax,dword ptr [ebp+0C]
 0047F8F9    mov         edx,eax
 0047F8FB    mov         eax,esi
 0047F8FD    call        0047BDA0
 0047F902    lea         edx,[ebp-30]
 0047F905    mov         eax,edi
 0047F907    call        0045C9C0
 0047F90C    cmp         dword ptr [ebp+8],0
>0047F910    je          0047F94F
 0047F912    lea         ecx,[ebp-30]
 0047F915    mov         eax,dword ptr [ebp+8]
 0047F918    mov         edx,eax
 0047F91A    mov         eax,dword ptr [esi+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F920    call        0047BD80
 0047F925    lea         edx,[ebp-30]
 0047F928    mov         edi,dword ptr [ebp+8]
 0047F92B    mov         eax,edi
 0047F92D    call        0045C9C0
 0047F932    lea         ecx,[ebp-30]
 0047F935    mov         eax,dword ptr [ebp+8]
 0047F938    mov         edx,eax
 0047F93A    mov         eax,esi
 0047F93C    call        0047BDA0
 0047F941    lea         edx,[ebp-30]
 0047F944    mov         eax,edi
 0047F946    call        0045C9C0
>0047F94B    jmp         0047F94F
 0047F94D    xor         ebx,ebx
 0047F94F    mov         eax,ebx
 0047F951    pop         edi
 0047F952    pop         esi
 0047F953    pop         ebx
 0047F954    mov         esp,ebp
 0047F956    pop         ebp
 0047F957    ret         8
end;*}

//0047F95C
{*function sub_0047F95C:?;
begin
 0047F95C    mov         ecx,dword ptr [eax+90];TGLProxyObject.MasterObject:TGLBaseSceneObject
 0047F962    test        ecx,ecx
>0047F964    je          0047F96E
 0047F966    mov         eax,ecx
 0047F968    mov         ecx,dword ptr [eax]
 0047F96A    call        dword ptr [ecx+58];TGLBaseSceneObject.sub_0047C0D0
 0047F96D    ret
 0047F96E    xor         eax,eax
 0047F970    ret
end;*}

//0047F974
constructor TGLLightSource.Create(AOwner:TComponent);
begin
{*
 0047F974    push        ebp
 0047F975    mov         ebp,esp
 0047F977    add         esp,0FFFFFFEC
 0047F97A    push        ebx
 0047F97B    push        esi
 0047F97C    test        dl,dl
>0047F97E    je          0047F988
 0047F980    add         esp,0FFFFFFF0
 0047F983    call        @ClassCreate
 0047F988    mov         byte ptr [ebp-1],dl
 0047F98B    mov         ebx,eax
 0047F98D    xor         edx,edx
 0047F98F    mov         eax,ebx
 0047F991    call        TGLBaseSceneObject.Create
 0047F996    mov         byte ptr [ebx+0AC],1;TGLLightSource.Shining:Boolean
 0047F99D    push        0
 0047F99F    push        0
 0047F9A1    push        0BF800000
 0047F9A6    push        0
 0047F9A8    lea         eax,[ebp-14]
 0047F9AB    call        0045C928
 0047F9B0    lea         eax,[ebp-14]
 0047F9B3    push        eax
 0047F9B4    push        1
 0047F9B6    mov         ecx,ebx
 0047F9B8    mov         dl,1
 0047F9BA    mov         eax,[0046AF7C];TGLCoordinates
 0047F9BF    call        TGLCoordinates.Create;TGLCoordinates.Create
 0047F9C4    mov         dword ptr [ebx+94],eax;TGLLightSource.SpotDirection:TGLCoordinates
 0047F9CA    mov         dword ptr [ebx+0A0],3F800000;TGLLightSource.ConstAttenuation:Single
 0047F9D4    xor         eax,eax
 0047F9D6    mov         dword ptr [ebx+0A4],eax;TGLLightSource.LinearAttenuation:Single
 0047F9DC    xor         eax,eax
 0047F9DE    mov         dword ptr [ebx+0A8],eax;TGLLightSource.QuadraticAttenuation:Single
 0047F9E4    mov         dword ptr [ebx+9C],43340000;TGLLightSource.SpotCutOff:Single
 0047F9EE    xor         eax,eax
 0047F9F0    mov         dword ptr [ebx+98],eax;TGLLightSource.SpotExponent:Single
 0047F9F6    mov         byte ptr [ebx+0BC],0;TGLLightSource.LightStyle:TLightStyle
 0047F9FD    mov         ecx,ebx
 0047F9FF    mov         dl,1
 0047FA01    mov         eax,[00470BF8];TGLColor
 0047FA06    call        TGLColor.Create;TGLColor.Create
 0047FA0B    mov         dword ptr [ebx+0B0],eax;TGLLightSource.Ambient:TGLColor
 0047FA11    mov         ecx,ebx
 0047FA13    mov         dl,1
 0047FA15    mov         eax,[00470BF8];TGLColor
 0047FA1A    call        TGLColor.Create;TGLColor.Create
 0047FA1F    mov         esi,eax
 0047FA21    mov         dword ptr [ebx+0B4],esi;TGLLightSource.Diffuse:TGLColor
 0047FA27    mov         edx,dword ptr ds:[5AE830];^gvar_005AD44C
 0047FA2D    mov         eax,esi
 0047FA2F    call        00472B10
 0047FA34    mov         ecx,ebx
 0047FA36    mov         dl,1
 0047FA38    mov         eax,[00470BF8];TGLColor
 0047FA3D    call        TGLColor.Create;TGLColor.Create
 0047FA42    mov         dword ptr [ebx+0B8],eax;TGLLightSource.Specular:TGLColor
 0047FA48    mov         eax,ebx
 0047FA4A    cmp         byte ptr [ebp-1],0
>0047FA4E    je          0047FA5F
 0047FA50    call        @AfterConstruction
 0047FA55    pop         dword ptr fs:[0]
 0047FA5C    add         esp,0C
 0047FA5F    mov         eax,ebx
 0047FA61    pop         esi
 0047FA62    pop         ebx
 0047FA63    mov         esp,ebp
 0047FA65    pop         ebp
 0047FA66    ret
*}
end;

//0047FA68
destructor TGLLightSource.Destroy;
begin
{*
 0047FA68    push        ebx
 0047FA69    push        esi
 0047FA6A    call        @BeforeDestruction
 0047FA6F    mov         ebx,edx
 0047FA71    mov         esi,eax
 0047FA73    mov         eax,dword ptr [esi+94];TGLLightSource.SpotDirection:TGLCoordinates
 0047FA79    call        TObject.Free
 0047FA7E    mov         eax,dword ptr [esi+0B0];TGLLightSource.Ambient:TGLColor
 0047FA84    call        TObject.Free
 0047FA89    mov         eax,dword ptr [esi+0B4];TGLLightSource.Diffuse:TGLColor
 0047FA8F    call        TObject.Free
 0047FA94    mov         eax,dword ptr [esi+0B8];TGLLightSource.Specular:TGLColor
 0047FA9A    call        TObject.Free
 0047FA9F    mov         edx,ebx
 0047FAA1    and         dl,0FC
 0047FAA4    mov         eax,esi
 0047FAA6    call        TGLBaseSceneObject.Destroy
 0047FAAB    test        bl,bl
>0047FAAD    jle         0047FAB6
 0047FAAF    mov         eax,esi
 0047FAB1    call        @ClassDestroy
 0047FAB6    pop         esi
 0047FAB7    pop         ebx
 0047FAB8    ret
*}
end;

//0047FABC
{*procedure sub_0047FABC(?:?; ?:?);
begin
 0047FABC    push        ebp
 0047FABD    mov         ebp,esp
 0047FABF    push        ebx
 0047FAC0    push        esi
 0047FAC1    mov         esi,edx
 0047FAC3    mov         ebx,eax
 0047FAC5    cmp         byte ptr [ebp+8],0
>0047FAC9    je          0047FAE5
 0047FACB    cmp         dword ptr [ebx+60],0;TGLLightSource.?f60:TPersistentObjectList
>0047FACF    je          0047FAE5
 0047FAD1    push        esi
 0047FAD2    mov         eax,ebx
 0047FAD4    call        0047BA94
 0047FAD9    mov         ecx,eax
 0047FADB    dec         ecx
 0047FADC    xor         edx,edx
 0047FADE    mov         eax,ebx
 0047FAE0    mov         ebx,dword ptr [eax]
 0047FAE2    call        dword ptr [ebx+6C];TGLLightSource.sub_0047D7AC
 0047FAE5    pop         esi
 0047FAE6    pop         ebx
 0047FAE7    pop         ebp
 0047FAE8    ret         4
end;*}

//0047FAEC
procedure sub_0047FAEC;
begin
{*
 0047FAEC    push        ebp
 0047FAED    mov         ebp,esp
 0047FAEF    xor         eax,eax
 0047FAF1    pop         ebp
 0047FAF2    ret         8
*}
end;

//0047FAF8
{*procedure sub_0047FAF8(?:?);
begin
 0047FAF8    push        ebx
 0047FAF9    push        esi
 0047FAFA    mov         esi,edx
 0047FAFC    mov         ebx,eax
 0047FAFE    mov         edx,esi
 0047FB00    mov         eax,ebx
 0047FB02    call        0047CFB0
 0047FB07    cmp         esi,dword ptr [ebx+94];TGLLightSource.SpotDirection:TGLCoordinates
>0047FB0D    jne         0047FB16
 0047FB0F    mov         eax,ebx
 0047FB11    call        0047CF48
 0047FB16    pop         esi
 0047FB17    pop         ebx
 0047FB18    ret
end;*}

//0047FB1C
{*function sub_0047FB1C:?;
begin
 0047FB1C    xor         eax,eax
 0047FB1E    ret
end;*}

//0047FB20
{*function sub_0047FB20:?;
begin
 0047FB20    xor         eax,eax
 0047FB22    ret
end;*}

//0047FB24
procedure TGLLightSource.SetShining(Value:Boolean);
begin
{*
 0047FB24    push        esi
 0047FB25    mov         esi,eax
 0047FB27    cmp         dl,byte ptr [esi+0AC];TGLLightSource.Shining:Boolean
>0047FB2D    je          0047FB3E
 0047FB2F    mov         byte ptr [esi+0AC],dl;TGLLightSource.Shining:Boolean
 0047FB35    mov         edx,esi
 0047FB37    mov         eax,esi
 0047FB39    mov         ecx,dword ptr [eax]
 0047FB3B    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FB3E    pop         esi
 0047FB3F    ret
*}
end;

//0047FB40
procedure TGLLightSource.SetSpotDirection(Value:TGLCoordinates);
begin
{*
 0047FB40    push        esi
 0047FB41    mov         esi,eax
 0047FB43    lea         eax,[edx+18];TGLCoordinates.X:Single
 0047FB46    mov         edx,eax
 0047FB48    mov         eax,dword ptr [esi+94];TGLLightSource.SpotDirection:TGLCoordinates
 0047FB4E    call        0046B7C8
 0047FB53    push        0
 0047FB55    mov         edx,3
 0047FB5A    mov         eax,dword ptr [esi+94];TGLLightSource.SpotDirection:TGLCoordinates
 0047FB60    call        TGLCoordinates.SetX
 0047FB65    mov         edx,esi
 0047FB67    mov         eax,esi
 0047FB69    mov         ecx,dword ptr [eax]
 0047FB6B    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FB6E    pop         esi
 0047FB6F    ret
*}
end;

//0047FB70
{*procedure TGLLightSource.SetSpotExponent(Value:Single; ?:?);
begin
 0047FB70    push        ebp
 0047FB71    mov         ebp,esp
 0047FB73    mov         edx,eax
 0047FB75    fld         dword ptr [edx+98];TGLLightSource.SpotExponent:Single
 0047FB7B    fcomp       dword ptr [ebp+8]
 0047FB7E    fnstsw      al
 0047FB80    sahf
>0047FB81    je          0047FB93
 0047FB83    mov         eax,dword ptr [ebp+8]
 0047FB86    mov         dword ptr [edx+98],eax;TGLLightSource.SpotExponent:Single
 0047FB8C    mov         eax,edx
 0047FB8E    mov         ecx,dword ptr [eax]
 0047FB90    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FB93    pop         ebp
 0047FB94    ret         4
end;*}

//0047FB98
{*procedure TGLLightSource.SetSpotCutOff(Value:Single; ?:?);
begin
 0047FB98    push        ebp
 0047FB99    mov         ebp,esp
 0047FB9B    mov         edx,eax
 0047FB9D    fld         dword ptr [edx+9C];TGLLightSource.SpotCutOff:Single
 0047FBA3    fcomp       dword ptr [ebp+8]
 0047FBA6    fnstsw      al
 0047FBA8    sahf
>0047FBA9    je          0047FBE5
 0047FBAB    fld         dword ptr [ebp+8]
 0047FBAE    fcomp       dword ptr ds:[47FBEC];0:Single
 0047FBB4    fnstsw      al
 0047FBB6    sahf
>0047FBB7    jb          0047FBC7
 0047FBB9    fld         dword ptr [ebp+8]
 0047FBBC    fcomp       dword ptr ds:[47FBF0];90:Single
 0047FBC2    fnstsw      al
 0047FBC4    sahf
>0047FBC5    jbe         0047FBD5
 0047FBC7    fld         dword ptr [ebp+8]
 0047FBCA    fcomp       dword ptr ds:[47FBF4];180:Single
 0047FBD0    fnstsw      al
 0047FBD2    sahf
>0047FBD3    jne         0047FBE5
 0047FBD5    mov         eax,dword ptr [ebp+8]
 0047FBD8    mov         dword ptr [edx+9C],eax;TGLLightSource.SpotCutOff:Single
 0047FBDE    mov         eax,edx
 0047FBE0    mov         ecx,dword ptr [eax]
 0047FBE2    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FBE5    pop         ebp
 0047FBE6    ret         4
end;*}

//0047FBF8
procedure TGLLightSource.SetLightStyle(Value:TLightStyle);
begin
{*
 0047FBF8    push        esi
 0047FBF9    mov         esi,eax
 0047FBFB    cmp         dl,byte ptr [esi+0BC];TGLLightSource.LightStyle:TLightStyle
>0047FC01    je          0047FC12
 0047FC03    mov         byte ptr [esi+0BC],dl;TGLLightSource.LightStyle:TLightStyle
 0047FC09    mov         edx,esi
 0047FC0B    mov         eax,esi
 0047FC0D    mov         ecx,dword ptr [eax]
 0047FC0F    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FC12    pop         esi
 0047FC13    ret
*}
end;

//0047FC14
procedure TGLLightSource.SetAmbient(Value:TGLColor);
begin
{*
 0047FC14    push        esi
 0047FC15    mov         esi,eax
 0047FC17    lea         eax,[edx+18];TGLColor.Red:Single
 0047FC1A    mov         edx,eax
 0047FC1C    mov         eax,dword ptr [esi+0B0];TGLLightSource.Ambient:TGLColor
 0047FC22    call        00472B48
 0047FC27    mov         edx,esi
 0047FC29    mov         eax,esi
 0047FC2B    mov         ecx,dword ptr [eax]
 0047FC2D    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FC30    pop         esi
 0047FC31    ret
*}
end;

//0047FC34
procedure TGLLightSource.SetDiffuse(Value:TGLColor);
begin
{*
 0047FC34    push        esi
 0047FC35    mov         esi,eax
 0047FC37    lea         eax,[edx+18];TGLColor.Red:Single
 0047FC3A    mov         edx,eax
 0047FC3C    mov         eax,dword ptr [esi+0B4];TGLLightSource.Diffuse:TGLColor
 0047FC42    call        00472B48
 0047FC47    mov         edx,esi
 0047FC49    mov         eax,esi
 0047FC4B    mov         ecx,dword ptr [eax]
 0047FC4D    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FC50    pop         esi
 0047FC51    ret
*}
end;

//0047FC54
procedure TGLLightSource.SetSpecular(Value:TGLColor);
begin
{*
 0047FC54    push        esi
 0047FC55    mov         esi,eax
 0047FC57    lea         eax,[edx+18];TGLColor.Red:Single
 0047FC5A    mov         edx,eax
 0047FC5C    mov         eax,dword ptr [esi+0B8];TGLLightSource.Specular:TGLColor
 0047FC62    call        00472B48
 0047FC67    mov         edx,esi
 0047FC69    mov         eax,esi
 0047FC6B    mov         ecx,dword ptr [eax]
 0047FC6D    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FC70    pop         esi
 0047FC71    ret
*}
end;

//0047FC74
{*procedure TGLLightSource.SetConstAttenuation(Value:Single; ?:?);
begin
 0047FC74    push        ebp
 0047FC75    mov         ebp,esp
 0047FC77    mov         edx,eax
 0047FC79    fld         dword ptr [edx+0A0];TGLLightSource.ConstAttenuation:Single
 0047FC7F    fcomp       dword ptr [ebp+8]
 0047FC82    fnstsw      al
 0047FC84    sahf
>0047FC85    je          0047FC97
 0047FC87    mov         eax,dword ptr [ebp+8]
 0047FC8A    mov         dword ptr [edx+0A0],eax;TGLLightSource.ConstAttenuation:Single
 0047FC90    mov         eax,edx
 0047FC92    mov         ecx,dword ptr [eax]
 0047FC94    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FC97    pop         ebp
 0047FC98    ret         4
end;*}

//0047FC9C
{*procedure TGLLightSource.SetLinearAttenuation(Value:Single; ?:?);
begin
 0047FC9C    push        ebp
 0047FC9D    mov         ebp,esp
 0047FC9F    mov         edx,eax
 0047FCA1    fld         dword ptr [edx+0A4];TGLLightSource.LinearAttenuation:Single
 0047FCA7    fcomp       dword ptr [ebp+8]
 0047FCAA    fnstsw      al
 0047FCAC    sahf
>0047FCAD    je          0047FCBF
 0047FCAF    mov         eax,dword ptr [ebp+8]
 0047FCB2    mov         dword ptr [edx+0A4],eax;TGLLightSource.LinearAttenuation:Single
 0047FCB8    mov         eax,edx
 0047FCBA    mov         ecx,dword ptr [eax]
 0047FCBC    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FCBF    pop         ebp
 0047FCC0    ret         4
end;*}

//0047FCC4
{*procedure TGLLightSource.SetQuadraticAttenuation(Value:Single; ?:?);
begin
 0047FCC4    push        ebp
 0047FCC5    mov         ebp,esp
 0047FCC7    mov         edx,eax
 0047FCC9    fld         dword ptr [edx+0A8];TGLLightSource.QuadraticAttenuation:Single
 0047FCCF    fcomp       dword ptr [ebp+8]
 0047FCD2    fnstsw      al
 0047FCD4    sahf
>0047FCD5    je          0047FCE7
 0047FCD7    mov         eax,dword ptr [ebp+8]
 0047FCDA    mov         dword ptr [edx+0A8],eax;TGLLightSource.QuadraticAttenuation:Single
 0047FCE0    mov         eax,edx
 0047FCE2    mov         ecx,dword ptr [eax]
 0047FCE4    call        dword ptr [ecx+34];TGLLightSource.sub_0047DACC
 0047FCE7    pop         ebp
 0047FCE8    ret         4
end;*}

//0047FCEC
constructor TGLScene.Create(AOwner:TComponent);
begin
{*
 0047FCEC    push        ebp
 0047FCED    mov         ebp,esp
 0047FCEF    push        ecx
 0047FCF0    push        ebx
 0047FCF1    push        esi
 0047FCF2    test        dl,dl
>0047FCF4    je          0047FCFE
 0047FCF6    add         esp,0FFFFFFF0
 0047FCF9    call        @ClassCreate
 0047FCFE    mov         byte ptr [ebp-1],dl
 0047FD01    mov         ebx,eax
 0047FD03    xor         edx,edx
 0047FD05    mov         eax,ebx
 0047FD07    call        TComponent.Create
 0047FD0C    mov         ecx,ebx
 0047FD0E    mov         dl,1
 0047FD10    mov         eax,[00479238];TGLSceneRootObject
 0047FD15    call        TGLSceneRootObject.Create;TGLSceneRootObject.Create
 0047FD1A    mov         esi,eax
 0047FD1C    mov         dword ptr [ebx+34],esi;TGLScene.?f34:TGLSceneRootObject
 0047FD1F    mov         eax,esi
 0047FD21    mov         edx,47FD94;'ObjectRoot'
 0047FD26    mov         ecx,dword ptr [eax]
 0047FD28    call        dword ptr [ecx+18];TGLBaseSceneObject.SetName
 0047FD2B    mov         ecx,ebx
 0047FD2D    mov         dl,1
 0047FD2F    mov         eax,[00479238];TGLSceneRootObject
 0047FD34    call        TGLSceneRootObject.Create;TGLSceneRootObject.Create
 0047FD39    mov         esi,eax
 0047FD3B    mov         dword ptr [ebx+38],esi;TGLScene.?f38:TGLSceneRootObject
 0047FD3E    mov         eax,esi
 0047FD40    mov         edx,47FDA8;'CameraRoot'
 0047FD45    mov         ecx,dword ptr [eax]
 0047FD47    call        dword ptr [ecx+18];TGLBaseSceneObject.SetName
 0047FD4A    mov         dl,1
 0047FD4C    mov         eax,[00466194];TPersistentObjectList
 0047FD51    call        TPersistentObjectList.Create;TPersistentObjectList.Create
 0047FD56    mov         dword ptr [ebx+40],eax;TGLScene.?f40:TPersistentObjectList
 0047FD59    mov         byte ptr [ebx+50],3;TGLScene.ObjectsSorting:TGLObjectsSorting
 0047FD5D    mov         byte ptr [ebx+51],1;TGLScene.VisibilityCulling:TGLVisibilityCulling
 0047FD61    mov         eax,dword ptr [ebx+40];TGLScene.?f40:TPersistentObjectList
 0047FD64    mov         edx,8
 0047FD69    call        00466FDC
 0047FD6E    mov         eax,ebx
 0047FD70    cmp         byte ptr [ebp-1],0
>0047FD74    je          0047FD85
 0047FD76    call        @AfterConstruction
 0047FD7B    pop         dword ptr fs:[0]
 0047FD82    add         esp,0C
 0047FD85    mov         eax,ebx
 0047FD87    pop         esi
 0047FD88    pop         ebx
 0047FD89    pop         ecx
 0047FD8A    pop         ebp
 0047FD8B    ret
*}
end;

//0047FDB4
destructor TGLScene.Destroy;
begin
{*
 0047FDB4    push        ebx
 0047FDB5    push        esi
 0047FDB6    call        @BeforeDestruction
 0047FDBB    mov         ebx,edx
 0047FDBD    mov         esi,eax
 0047FDBF    mov         eax,dword ptr [esi+34];TGLScene.?f34:TGLSceneRootObject
 0047FDC2    call        0047B64C
 0047FDC7    mov         eax,dword ptr [esi+38];TGLScene.?f38:TGLSceneRootObject
 0047FDCA    call        TObject.Free
 0047FDCF    mov         eax,dword ptr [esi+40];TGLScene.?f40:TPersistentObjectList
 0047FDD2    call        TObject.Free
 0047FDD7    mov         eax,dword ptr [esi+34];TGLScene.?f34:TGLSceneRootObject
 0047FDDA    call        TObject.Free
 0047FDDF    mov         edx,ebx
 0047FDE1    and         dl,0FC
 0047FDE4    mov         eax,esi
 0047FDE6    call        TComponent.Destroy
 0047FDEB    test        bl,bl
>0047FDED    jle         0047FDF6
 0047FDEF    mov         eax,esi
 0047FDF1    call        @ClassDestroy
 0047FDF6    pop         esi
 0047FDF7    pop         ebx
 0047FDF8    ret
*}
end;

//0047FDFC
{*procedure sub_0047FDFC(?:dword; ?:?);
begin
 0047FDFC    push        ebx
 0047FDFD    push        esi
 0047FDFE    mov         ecx,dword ptr [eax+40]
 0047FE01    mov         ebx,dword ptr [ecx+0C]
 0047FE04    dec         ebx
 0047FE05    test        ebx,ebx
>0047FE07    jl          0047FE2E
 0047FE09    inc         ebx
 0047FE0A    xor         ecx,ecx
 0047FE0C    mov         esi,dword ptr [eax+40]
 0047FE0F    mov         esi,dword ptr [esi+8]
 0047FE12    cmp         dword ptr [esi+ecx*4],0
>0047FE16    jne         0047FE2A
 0047FE18    mov         dword ptr [esi+ecx*4],edx
 0047FE1B    lea         eax,[ecx+4000]
 0047FE21    mov         dword ptr [edx+90],eax
 0047FE27    pop         esi
 0047FE28    pop         ebx
 0047FE29    ret
 0047FE2A    inc         ecx
 0047FE2B    dec         ebx
>0047FE2C    jne         0047FE0C
 0047FE2E    pop         esi
 0047FE2F    pop         ebx
 0047FE30    ret
end;*}

//0047FE34
procedure sub_0047FE34(?:dword);
begin
{*
 0047FE34    push        ebx
 0047FE35    mov         ebx,eax
 0047FE37    mov         eax,dword ptr [ebx+40]
 0047FE3A    call        00466EF8
 0047FE3F    test        eax,eax
>0047FE41    jl          0047FE4F
 0047FE43    xor         ecx,ecx
 0047FE45    mov         edx,eax
 0047FE47    mov         eax,dword ptr [ebx+40]
 0047FE4A    call        00466F8C
 0047FE4F    pop         ebx
 0047FE50    ret
*}
end;

//0047FE54
{*procedure sub_0047FE54(?:dword; ?:?);
begin
 0047FE54    push        ebx
 0047FE55    push        esi
 0047FE56    push        edi
 0047FE57    push        ebp
 0047FE58    mov         edi,edx
 0047FE5A    mov         ebp,eax
 0047FE5C    mov         eax,edi
 0047FE5E    mov         edx,dword ptr ds:[47A0C4];TGLLightSource
 0047FE64    call        @IsClass
 0047FE69    test        al,al
>0047FE6B    je          0047FE76
 0047FE6D    mov         edx,edi
 0047FE6F    mov         eax,ebp
 0047FE71    call        0047FDFC
 0047FE76    mov         eax,edi
 0047FE78    call        0047BA94
 0047FE7D    mov         ebx,eax
 0047FE7F    dec         ebx
 0047FE80    test        ebx,ebx
>0047FE82    jl          0047FE9D
 0047FE84    inc         ebx
 0047FE85    xor         esi,esi
 0047FE87    mov         edx,esi
 0047FE89    mov         eax,edi
 0047FE8B    call        0047BA74
 0047FE90    mov         edx,eax
 0047FE92    mov         eax,ebp
 0047FE94    call        0047FE54
 0047FE99    inc         esi
 0047FE9A    dec         ebx
>0047FE9B    jne         0047FE87
 0047FE9D    pop         ebp
 0047FE9E    pop         edi
 0047FE9F    pop         esi
 0047FEA0    pop         ebx
 0047FEA1    ret
end;*}

//0047FEA4
procedure sub_0047FEA4(?:dword; ?:TGLBaseSceneObject);
begin
{*
 0047FEA4    push        ebx
 0047FEA5    push        esi
 0047FEA6    push        edi
 0047FEA7    push        ebp
 0047FEA8    mov         edi,edx
 0047FEAA    mov         ebp,eax
 0047FEAC    mov         eax,edi
 0047FEAE    mov         edx,dword ptr ds:[47A0C4];TGLLightSource
 0047FEB4    call        @IsClass
 0047FEB9    test        al,al
>0047FEBB    je          0047FEC6
 0047FEBD    mov         edx,edi
 0047FEBF    mov         eax,ebp
 0047FEC1    call        0047FE34
 0047FEC6    mov         eax,edi
 0047FEC8    call        0047BA94
 0047FECD    mov         ebx,eax
 0047FECF    dec         ebx
 0047FED0    test        ebx,ebx
>0047FED2    jl          0047FEED
 0047FED4    inc         ebx
 0047FED5    xor         esi,esi
 0047FED7    mov         edx,esi
 0047FED9    mov         eax,edi
 0047FEDB    call        0047BA74
 0047FEE0    mov         edx,eax
 0047FEE2    mov         eax,ebp
 0047FEE4    call        0047FEA4
 0047FEE9    inc         esi
 0047FEEA    dec         ebx
>0047FEEB    jne         0047FED7
 0047FEED    pop         ebp
 0047FEEE    pop         edi
 0047FEEF    pop         esi
 0047FEF0    pop         ebx
 0047FEF1    ret
*}
end;

//0047FEF4
{*procedure sub_0047FEF4(?:?; ?:?);
begin
 0047FEF4    push        ebx
 0047FEF5    push        esi
 0047FEF6    mov         esi,edx
 0047FEF8    mov         ebx,eax
 0047FEFA    cmp         dword ptr [ebx+44],0
>0047FEFE    jne         0047FF0F
 0047FF00    mov         dl,1
 0047FF02    mov         eax,[00466194];TPersistentObjectList
 0047FF07    call        TPersistentObjectList.Create;TPersistentObjectList.Create
 0047FF0C    mov         dword ptr [ebx+44],eax
 0047FF0F    mov         edx,esi
 0047FF11    mov         eax,dword ptr [ebx+44]
 0047FF14    call        00466EF8
 0047FF19    test        eax,eax
>0047FF1B    jge         0047FF57
 0047FF1D    mov         edx,esi
 0047FF1F    mov         eax,dword ptr [ebx+44]
 0047FF22    call        00466E24
 0047FF27    cmp         dword ptr [ebx+3C],0
>0047FF2B    jne         0047FF3D
 0047FF2D    xor         edx,edx
 0047FF2F    mov         eax,dword ptr [ebx+44]
 0047FF32    call        00466EF0
 0047FF37    mov         eax,dword ptr [eax+20]
 0047FF3A    mov         dword ptr [ebx+3C],eax
 0047FF3D    mov         eax,dword ptr [ebx+44]
 0047FF40    cmp         dword ptr [eax+0C],1
>0047FF44    jle         0047FF57
 0047FF46    cmp         dword ptr [ebx+3C],0
>0047FF4A    je          0047FF57
 0047FF4C    mov         edx,dword ptr [esi+20]
 0047FF4F    mov         eax,dword ptr [ebx+3C]
 0047FF52    call        0046CA18
 0047FF57    pop         esi
 0047FF58    pop         ebx
 0047FF59    ret
end;*}

//0047FF5C
{*procedure sub_0047FF5C(?:?);
begin
 0047FF5C    push        ebx
 0047FF5D    mov         ebx,eax
 0047FF5F    mov         eax,dword ptr [ebx+44]
 0047FF62    test        eax,eax
>0047FF64    je          0047FF9D
 0047FF66    call        00466EF8
 0047FF6B    test        eax,eax
>0047FF6D    jl          0047FF9D
 0047FF6F    mov         edx,dword ptr [ebx+44]
 0047FF72    cmp         dword ptr [edx+0C],1
>0047FF76    jne         0047FF87
 0047FF78    lea         eax,[ebx+44]
 0047FF7B    call        FreeAndNil
 0047FF80    xor         eax,eax
 0047FF82    mov         dword ptr [ebx+3C],eax
>0047FF85    jmp         0047FF9D
 0047FF87    xchg        eax,edx
 0047FF88    call        00466E6C
 0047FF8D    xor         edx,edx
 0047FF8F    mov         eax,dword ptr [ebx+44]
 0047FF92    call        00466EF0
 0047FF97    mov         eax,dword ptr [eax+20]
 0047FF9A    mov         dword ptr [ebx+3C],eax
 0047FF9D    pop         ebx
 0047FF9E    ret
end;*}

//0047FFA0
{*procedure TGLScene.sub_00422EAC(?:?; ?:?; ?:?);
begin
 0047FFA0    push        ebp
 0047FFA1    mov         ebp,esp
 0047FFA3    push        ebx
 0047FFA4    push        esi
 0047FFA5    push        edi
 0047FFA6    mov         edi,edx
 0047FFA8    mov         ebx,eax
 0047FFAA    push        dword ptr [ebp+0C]
 0047FFAD    push        dword ptr [ebp+8]
 0047FFB0    mov         edx,edi
 0047FFB2    mov         eax,dword ptr [ebx+34];TGLScene.?f34:TGLSceneRootObject
 0047FFB5    mov         si,0FFFD
 0047FFB9    call        @CallDynaInst;TGLBaseSceneObject.sub_00422EAC
 0047FFBE    push        dword ptr [ebp+0C]
 0047FFC1    push        dword ptr [ebp+8]
 0047FFC4    mov         edx,edi
 0047FFC6    mov         eax,dword ptr [ebx+38];TGLScene.?f38:TGLSceneRootObject
 0047FFC9    mov         si,0FFFD
 0047FFCD    call        @CallDynaInst;TGLBaseSceneObject.sub_00422EAC
 0047FFD2    pop         edi
 0047FFD3    pop         esi
 0047FFD4    pop         ebx
 0047FFD5    pop         ebp
 0047FFD6    ret         8
end;*}

//0047FFDC
{*procedure TGLScene.sub_00422ED4(?:?; ?:?);
begin
 0047FFDC    push        ebx
 0047FFDD    push        esi
 0047FFDE    mov         esi,ecx
 0047FFE0    mov         ebx,edx
 0047FFE2    mov         eax,ebx
 0047FFE4    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 0047FFEA    call        @AsClass
 0047FFEF    mov         edx,esi
 0047FFF1    call        0047CDA0
 0047FFF6    pop         esi
 0047FFF7    pop         ebx
 0047FFF8    ret
end;*}

//0047FFFC
{*function sub_0047FFFC(?:TGLScene):?;
begin
 0047FFFC    cmp         dword ptr [eax+30],0
>00480000    jne         00480011
 00480002    test        byte ptr [eax+1C],1
>00480006    jne         00480011
 00480008    test        byte ptr [eax+1C],8
>0048000C    jne         00480011
 0048000E    xor         eax,eax
 00480010    ret
 00480011    mov         al,1
 00480013    ret
end;*}

//00480014
procedure sub_00480014(?:TComponent);
begin
{*
 00480014    inc         dword ptr [eax+30]
 00480017    ret
*}
end;

//00480018
procedure sub_00480018(?:TComponent);
begin
{*
 00480018    push        ebx
 00480019    mov         ebx,eax
 0048001B    cmp         dword ptr [ebx+30],0
>0048001F    jg          00480035
 00480021    mov         ecx,178E
 00480026    mov         edx,480054;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0048002B    mov         eax,48008C;'Assertion failure'
 00480030    call        @Assert
 00480035    dec         dword ptr [ebx+30]
 00480038    cmp         dword ptr [ebx+30],0
>0048003C    jne         00480047
 0048003E    mov         edx,ebx
 00480040    mov         eax,ebx
 00480042    mov         ecx,dword ptr [eax]
 00480044    call        dword ptr [ecx+34]
 00480047    pop         ebx
 00480048    ret
*}
end;

//004800A0
procedure TGLScene.SetObjectsSorting(Value:TGLObjectsSorting);
begin
{*
 004800A0    cmp         dl,byte ptr [eax+50];TGLScene.ObjectsSorting:TGLObjectsSorting
>004800A3    je          004800B9
 004800A5    test        dl,dl
>004800A7    jne         004800AF
 004800A9    mov         byte ptr [eax+50],3;TGLScene.ObjectsSorting:TGLObjectsSorting
>004800AD    jmp         004800B2
 004800AF    mov         byte ptr [eax+50],dl;TGLScene.ObjectsSorting:TGLObjectsSorting
 004800B2    mov         edx,eax
 004800B4    mov         ecx,dword ptr [eax]
 004800B6    call        dword ptr [ecx+34];TGLScene.sub_004805FC
 004800B9    ret
*}
end;

//004800BC
procedure TGLScene.SetVisibilityCulling(Value:TGLVisibilityCulling);
begin
{*
 004800BC    cmp         dl,byte ptr [eax+51];TGLScene.VisibilityCulling:TGLVisibilityCulling
>004800BF    je          004800D5
 004800C1    test        dl,dl
>004800C3    jne         004800CB
 004800C5    mov         byte ptr [eax+51],1;TGLScene.VisibilityCulling:TGLVisibilityCulling
>004800C9    jmp         004800CE
 004800CB    mov         byte ptr [eax+51],dl;TGLScene.VisibilityCulling:TGLVisibilityCulling
 004800CE    mov         edx,eax
 004800D0    mov         ecx,dword ptr [eax]
 004800D2    call        dword ptr [ecx+34];TGLScene.sub_004805FC
 004800D5    ret
*}
end;

//004800D8
procedure TGLScene.ReadState(Reader:TReader);
begin
{*
 004800D8    push        ebp
 004800D9    mov         ebp,esp
 004800DB    add         esp,0FFFFFFF8
 004800DE    push        ebx
 004800DF    mov         dword ptr [ebp-4],edx
 004800E2    mov         ebx,eax
 004800E4    mov         eax,dword ptr [ebp-4]
 004800E7    mov         eax,dword ptr [eax+18];TReader.FRoot:TComponent
 004800EA    mov         dword ptr [ebp-8],eax
 004800ED    xor         edx,edx
 004800EF    push        ebp
 004800F0    push        48012D
 004800F5    push        dword ptr fs:[edx]
 004800F8    mov         dword ptr fs:[edx],esp
 004800FB    mov         eax,dword ptr [ebx+4];TGLScene.FOwner:TComponent
 004800FE    test        eax,eax
>00480100    je          0048010B
 00480102    mov         edx,eax
 00480104    mov         eax,dword ptr [ebp-4]
 00480107    mov         ecx,dword ptr [eax]
 00480109    call        dword ptr [ecx];TFiler.SetRoot
 0048010B    mov         edx,dword ptr [ebp-4]
 0048010E    mov         eax,ebx
 00480110    call        TComponent.ReadState
 00480115    xor         eax,eax
 00480117    pop         edx
 00480118    pop         ecx
 00480119    pop         ecx
 0048011A    mov         dword ptr fs:[eax],edx
 0048011D    push        480134
 00480122    mov         edx,dword ptr [ebp-8]
 00480125    mov         eax,dword ptr [ebp-4]
 00480128    mov         ecx,dword ptr [eax]
 0048012A    call        dword ptr [ecx];TFiler.SetRoot
 0048012C    ret
>0048012D    jmp         @HandleFinally
>00480132    jmp         00480122
 00480134    pop         ebx
 00480135    pop         ecx
 00480136    pop         ecx
 00480137    pop         ebp
 00480138    ret
*}
end;

//0048013C
{*procedure sub_0048013C(?:?);
begin
 0048013C    push        ebp
 0048013D    mov         ebp,esp
 0048013F    add         esp,0FFFFFF80
 00480142    push        ebx
 00480143    mov         ebx,eax
 00480145    lea         eax,[ebp-40]
 00480148    push        eax
 00480149    push        0BA7
 0048014E    call        OpenGL32.glGetFloatv
 00480153    lea         eax,[ebp-80]
 00480156    push        eax
 00480157    push        0BA6
 0048015C    call        OpenGL32.glGetFloatv
 00480161    mov         ecx,ebx
 00480163    lea         edx,[ebp-40]
 00480166    lea         eax,[ebp-80]
 00480169    call        0045DC38
 0048016E    pop         ebx
 0048016F    mov         esp,ebp
 00480171    pop         ebp
 00480172    ret
end;*}

//00480174
{*procedure sub_00480174(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00480174    push        ebp
 00480175    mov         ebp,esp
 00480177    add         esp,0FFFFFE34
 0048017D    push        ebx
 0048017E    push        esi
 0048017F    push        edi
 00480180    mov         dword ptr [ebp-4],ecx
 00480183    mov         ebx,edx
 00480185    mov         edi,eax
 00480187    xor         eax,eax
 00480189    mov         dword ptr [edi+60],eax
 0048018C    mov         eax,dword ptr [ebx+24]
 0048018F    mov         si,0FFF4
 00480193    call        @CallDynaInst
 00480198    mov         dword ptr [edi+4C],ebx
 0048019B    lea         eax,[ebp-10C]
 004801A1    xor         ecx,ecx
 004801A3    mov         edx,100
 004801A8    call        @FillChar
 004801AD    mov         dword ptr [ebp-10C],edi
 004801B3    mov         dword ptr [ebp-108],ebx
 004801B9    mov         al,byte ptr [edi+50]
 004801BC    mov         byte ptr [ebp-0B3],al
 004801C2    mov         al,byte ptr [edi+51]
 004801C5    mov         byte ptr [ebp-0B2],al
 004801CB    mov         al,byte ptr [ebx+10C]
 004801D1    mov         byte ptr [ebp-14],al
 004801D4    mov         al,byte ptr [ebp+0C]
 004801D7    mov         byte ptr [ebp-0B4],al
 004801DD    mov         eax,dword ptr [edi+4C]
 004801E0    mov         eax,dword ptr [eax+118]
 004801E6    push        edi
 004801E7    lea         esi,[eax+18]
 004801EA    lea         edi,[ebp-24]
 004801ED    movs        dword ptr [edi],dword ptr [esi]
 004801EE    movs        dword ptr [edi],dword ptr [esi]
 004801EF    movs        dword ptr [edi],dword ptr [esi]
 004801F0    movs        dword ptr [edi],dword ptr [esi]
 004801F1    pop         edi
 004801F2    mov         esi,dword ptr [ebx+130]
 004801F8    push        esi
 004801F9    push        edi
 004801FA    lea         esi,[ebx+0EC]
 00480200    lea         edi,[ebp-104]
 00480206    movs        dword ptr [edi],dword ptr [esi]
 00480207    movs        dword ptr [edi],dword ptr [esi]
 00480208    movs        dword ptr [edi],dword ptr [esi]
 00480209    movs        dword ptr [edi],dword ptr [esi]
 0048020A    pop         edi
 0048020B    pop         esi
 0048020C    push        esi
 0048020D    push        edi
 0048020E    add         esi,0A8
 00480214    lea         edi,[ebp-0F4]
 0048021A    movs        dword ptr [edi],dword ptr [esi]
 0048021B    movs        dword ptr [edi],dword ptr [esi]
 0048021C    movs        dword ptr [edi],dword ptr [esi]
 0048021D    movs        dword ptr [edi],dword ptr [esi]
 0048021E    pop         edi
 0048021F    pop         esi
 00480220    lea         eax,[ebp-0F4]
 00480226    call        0045D5EC
 0048022B    xor         eax,eax
 0048022D    mov         dword ptr [ebp-0E8],eax
 00480233    lea         ecx,[ebp-11C]
 00480239    mov         eax,dword ptr [esi+4C]
 0048023C    lea         edx,[eax+18]
 0048023F    lea         eax,[ebp-0F4]
 00480245    call        0045CEDC
 0048024A    lea         ecx,[ebp-12C]
 00480250    lea         edx,[ebp-0F4]
 00480256    lea         eax,[ebp-11C]
 0048025C    call        0045CEDC
 00480261    push        esi
 00480262    push        edi
 00480263    lea         esi,[ebp-12C]
 00480269    lea         edi,[ebp-0E4]
 0048026F    movs        dword ptr [edi],dword ptr [esi]
 00480270    movs        dword ptr [edi],dword ptr [esi]
 00480271    movs        dword ptr [edi],dword ptr [esi]
 00480272    movs        dword ptr [edi],dword ptr [esi]
 00480273    pop         edi
 00480274    pop         esi
 00480275    lea         eax,[ebp-0E4]
 0048027B    call        0045D5EC
 00480280    push        esi
 00480281    push        edi
 00480282    lea         esi,[ebp-104]
 00480288    lea         edi,[ebp-0AC]
 0048028E    movs        dword ptr [edi],dword ptr [esi]
 0048028F    movs        dword ptr [edi],dword ptr [esi]
 00480290    movs        dword ptr [edi],dword ptr [esi]
 00480291    movs        dword ptr [edi],dword ptr [esi]
 00480292    pop         edi
 00480293    pop         esi
 00480294    push        esi
 00480295    push        edi
 00480296    lea         esi,[ebp-0F4]
 0048029C    lea         edi,[ebp-9C]
 004802A2    movs        dword ptr [edi],dword ptr [esi]
 004802A3    movs        dword ptr [edi],dword ptr [esi]
 004802A4    movs        dword ptr [edi],dword ptr [esi]
 004802A5    movs        dword ptr [edi],dword ptr [esi]
 004802A6    pop         edi
 004802A7    pop         esi
 004802A8    mov         eax,dword ptr [esi+0A0]
 004802AE    mov         dword ptr [ebp-8C],eax
 004802B4    fld         dword ptr [esi+98]
 004802BA    fadd        dword ptr [esi+94]
 004802C0    fstp        dword ptr [ebp-88]
 004802C6    wait
 004802C7    lea         eax,[ebp-1CC]
 004802CD    call        0048013C
 004802D2    lea         eax,[ebp-1CC]
 004802D8    lea         edx,[ebp-18C]
 004802DE    call        0045FC18
 004802E3    push        edi
 004802E4    lea         esi,[ebp-18C]
 004802EA    lea         edi,[ebp-84]
 004802F0    mov         ecx,18
 004802F5    rep movs    dword ptr [edi],dword ptr [esi]
 004802F7    pop         edi
 004802F8    mov         eax,dword ptr [ebp-4]
 004802FB    mov         dword ptr [ebp-0D0],eax
 00480301    mov         eax,dword ptr [ebp+10]
 00480304    mov         dword ptr [ebp-0CC],eax
 0048030A    mov         eax,dword ptr [ebx+124]
 00480310    mov         dword ptr [ebp-0C8],eax
 00480316    lea         eax,[ebx+68]
 00480319    mov         dword ptr [ebp-0D4],eax
 0048031F    mov         eax,dword ptr [ebx+18]
 00480322    mov         dword ptr [ebp-0B0],eax
 00480328    call        0046D994
 0048032D    mov         byte ptr [ebp-13],0
 00480331    test        byte ptr [ebx+11F],40
>00480338    jne         00480347
 0048033A    cmp         byte ptr [ebp-0B4],1
>00480341    je          00480347
 00480343    xor         eax,eax
>00480345    jmp         00480349
 00480347    mov         al,1
 00480349    mov         byte ptr [ebp-12],al
 0048034C    test        al,al
>0048034E    je          0048035F
 00480350    push        0
 00480352    push        0
 00480354    push        0
 00480356    push        0
 00480358    call        OpenGL32.glColorMask
>0048035D    jmp         0048036C
 0048035F    push        0FF
 00480361    push        0FF
 00480363    push        0FF
 00480365    push        0FF
 00480367    call        OpenGL32.glColorMask
 0048036C    cmp         word ptr [ebx+1A2],0
>00480374    je          0048038A
 00480376    lea         ecx,[ebp-10C]
 0048037C    mov         edx,ebx
 0048037E    mov         eax,dword ptr [ebx+1A4]
 00480384    call        dword ptr [ebx+1A0]
 0048038A    cmp         dword ptr [ebp+8],0
>0048038E    jne         004803A0
 00480390    lea         edx,[ebp-10C]
 00480396    mov         eax,dword ptr [edi+34]
 00480399    call        0047D3FC
>0048039E    jmp         004803AE
 004803A0    lea         edx,[ebp-10C]
 004803A6    mov         eax,dword ptr [ebp+8]
 004803A9    call        0047D3FC
 004803AE    push        0FF
 004803B0    push        0FF
 004803B2    push        0FF
 004803B4    push        0FF
 004803B6    call        OpenGL32.glColorMask
 004803BB    mov         eax,dword ptr [ebx+24]
 004803BE    mov         dword ptr [ebp-0C],eax
 004803C1    mov         eax,dword ptr [ebp-0C]
 004803C4    mov         eax,dword ptr [eax+0C]
 004803C7    test        eax,eax
>004803C9    jle         004803F8
 004803CB    mov         esi,eax
 004803CD    dec         esi
 004803CE    test        esi,esi
>004803D0    jl          004803F8
 004803D2    inc         esi
 004803D3    mov         dword ptr [ebp-8],0
 004803DA    mov         edx,dword ptr [ebp-8]
 004803DD    mov         eax,dword ptr [ebp-0C]
 004803E0    call        00466EF0
 004803E5    lea         ecx,[ebp-10C]
 004803EB    mov         edx,ebx
 004803ED    mov         edi,dword ptr [eax]
 004803EF    call        dword ptr [edi+34]
 004803F2    inc         dword ptr [ebp-8]
 004803F5    dec         esi
>004803F6    jne         004803DA
 004803F8    cmp         word ptr [ebx+1AA],0
>00480400    je          00480416
 00480402    lea         ecx,[ebp-10C]
 00480408    mov         edx,ebx
 0048040A    mov         eax,dword ptr [ebx+1AC]
 00480410    call        dword ptr [ebx+1A8]
 00480416    mov         dl,2
 00480418    mov         eax,dword ptr [ebp-0B0]
 0048041E    call        0046D634
 00480423    mov         dl,13
 00480425    mov         eax,dword ptr [ebp-0B0]
 0048042B    call        0046D634
 00480430    mov         dl,15
 00480432    mov         eax,dword ptr [ebp-0B0]
 00480438    call        0046D634
 0048043D    xor         edx,edx
 0048043F    mov         eax,dword ptr [ebp-0B0]
 00480445    call        0046D5F8
 0048044A    push        0
 0048044C    push        204
 00480451    call        OpenGL32.glAlphaFunc
 00480456    pop         edi
 00480457    pop         esi
 00480458    pop         ebx
 00480459    mov         esp,ebp
 0048045B    pop         ebp
 0048045C    ret         0C
end;*}

//00480460
{*procedure sub_00480460(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00480460    push        ebp
 00480461    mov         ebp,esp
 00480463    add         esp,0FFFFFFF0
 00480466    push        ebx
 00480467    mov         ebx,eax
 00480469    mov         eax,dword ptr [ebp+10]
 0048046C    mov         dword ptr [ebp-10],eax
 0048046F    mov         eax,dword ptr [ebp+14]
 00480472    mov         dword ptr [ebp-0C],eax
 00480475    mov         eax,dword ptr [ebp+8]
 00480478    mov         dword ptr [ebp-8],eax
 0048047B    mov         eax,dword ptr [ebp+0C]
 0048047E    mov         dword ptr [ebp-4],eax
 00480481    lea         edx,[ebp-10]
 00480484    mov         eax,dword ptr [ebx+34]
 00480487    mov         ecx,dword ptr [eax]
 00480489    call        dword ptr [ecx+30]
 0048048C    lea         edx,[ebp-10]
 0048048F    mov         eax,dword ptr [ebx+38]
 00480492    mov         ecx,dword ptr [eax]
 00480494    call        dword ptr [ecx+30]
 00480497    pop         ebx
 00480498    mov         esp,ebp
 0048049A    pop         ebp
 0048049B    ret         10
end;*}

//004804A0
{*function sub_004804A0(?:TGLScene; ?:AnsiString):?;
begin
 004804A0    push        ebx
 004804A1    push        esi
 004804A2    mov         esi,edx
 004804A4    mov         ebx,eax
 004804A6    xor         ecx,ecx
 004804A8    mov         edx,esi
 004804AA    mov         eax,dword ptr [ebx+34]
 004804AD    call        0047D35C
 004804B2    test        eax,eax
>004804B4    jne         004804C2
 004804B6    xor         ecx,ecx
 004804B8    mov         edx,esi
 004804BA    mov         eax,dword ptr [ebx+38]
 004804BD    call        0047D35C
 004804C2    pop         esi
 004804C3    pop         ebx
 004804C4    ret
end;*}

//004804C8
{*function sub_004804C8(?:TGLSceneRootObject; ?:?):?;
begin
 004804C8    push        ebp
 004804C9    mov         ebp,esp
 004804CB    add         esp,0FFFFFFF0
 004804CE    push        ebx
 004804CF    push        esi
 004804D0    push        edi
 004804D1    mov         dword ptr [ebp-4],eax
 004804D4    xor         eax,eax
 004804D6    mov         dword ptr [ebp-8],eax
 004804D9    mov         eax,dword ptr [ebp-4]
 004804DC    call        0047BA94
 004804E1    mov         esi,eax
 004804E3    dec         esi
 004804E4    test        esi,esi
>004804E6    jl          004805B2
 004804EC    inc         esi
 004804ED    mov         dword ptr [ebp-0C],0
 004804F4    mov         edx,dword ptr [ebp-0C]
 004804F7    mov         eax,dword ptr [ebp-4]
 004804FA    call        0047BA74
 004804FF    mov         ebx,eax
 00480501    cmp         byte ptr [ebx+64],0
>00480505    je          004805A8
 0048050B    mov         eax,dword ptr [ebp+8]
 0048050E    add         eax,0FFFFFFF0
 00480511    push        eax
 00480512    mov         eax,dword ptr [ebp+8]
 00480515    mov         eax,dword ptr [eax-1C]
 00480518    push        eax
 00480519    mov         eax,dword ptr [ebp+8]
 0048051C    mov         ecx,dword ptr [eax-18]
 0048051F    mov         eax,dword ptr [ebp+8]
 00480522    mov         edx,dword ptr [eax-14]
 00480525    mov         eax,ebx
 00480527    mov         edi,dword ptr [eax]
 00480529    call        dword ptr [edi+54]
 0048052C    test        al,al
>0048052E    je          0048059C
 00480530    mov         eax,dword ptr [ebp+8]
 00480533    lea         edx,[eax-10]
 00480536    mov         eax,dword ptr [ebp+8]
 00480539    mov         eax,dword ptr [eax-14]
 0048053C    call        0045D948
 00480541    fstp        dword ptr [ebp-10]
 00480544    wait
 00480545    fld         dword ptr [ebp-10]
 00480548    mov         eax,dword ptr [ebp+8]
 0048054B    fcomp       dword ptr [eax-20]
 0048054E    fnstsw      al
 00480550    sahf
>00480551    jae         0048059C
 00480553    mov         eax,dword ptr [ebp+8]
 00480556    mov         dword ptr [eax-24],ebx
 00480559    mov         eax,dword ptr [ebp+8]
 0048055C    mov         edx,dword ptr [ebp-10]
 0048055F    mov         dword ptr [eax-20],edx
 00480562    mov         eax,dword ptr [ebp+8]
 00480565    cmp         dword ptr [eax+0C],0
>00480569    je          0048057F
 0048056B    mov         eax,dword ptr [ebp+8]
 0048056E    mov         edx,dword ptr [ebp+8]
 00480571    mov         edx,dword ptr [edx+0C]
 00480574    push        esi
 00480575    lea         esi,[eax-10]
 00480578    mov         edi,edx
 0048057A    movs        dword ptr [edi],dword ptr [esi]
 0048057B    movs        dword ptr [edi],dword ptr [esi]
 0048057C    movs        dword ptr [edi],dword ptr [esi]
 0048057D    movs        dword ptr [edi],dword ptr [esi]
 0048057E    pop         esi
 0048057F    mov         eax,dword ptr [ebp+8]
 00480582    cmp         dword ptr [eax+8],0
>00480586    je          0048059C
 00480588    mov         eax,dword ptr [ebp+8]
 0048058B    mov         edx,dword ptr [ebp+8]
 0048058E    mov         edx,dword ptr [edx+8]
 00480591    push        esi
 00480592    lea         esi,[eax-34]
 00480595    mov         edi,edx
 00480597    movs        dword ptr [edi],dword ptr [esi]
 00480598    movs        dword ptr [edi],dword ptr [esi]
 00480599    movs        dword ptr [edi],dword ptr [esi]
 0048059A    movs        dword ptr [edi],dword ptr [esi]
 0048059B    pop         esi
 0048059C    mov         eax,dword ptr [ebp+8]
 0048059F    push        eax
 004805A0    mov         eax,ebx
 004805A2    call        004804C8
 004805A7    pop         ecx
 004805A8    inc         dword ptr [ebp-0C]
 004805AB    dec         esi
>004805AC    jne         004804F4
 004805B2    mov         eax,dword ptr [ebp-8]
 004805B5    pop         edi
 004805B6    pop         esi
 004805B7    pop         ebx
 004805B8    mov         esp,ebp
 004805BA    pop         ebp
 004805BB    ret
end;*}

//004805BC
{*function sub_004805BC(?:?; ?:?; ?:?):?;
begin
 004805BC    push        ebp
 004805BD    mov         ebp,esp
 004805BF    add         esp,0FFFFFFCC
 004805C2    mov         dword ptr [ebp-18],ecx
 004805C5    mov         dword ptr [ebp-14],edx
 004805C8    mov         dword ptr [ebp-20],60AD78EC
 004805CF    xor         edx,edx
 004805D1    mov         dword ptr [ebp-24],edx
 004805D4    cmp         dword ptr [ebp+8],0
>004805D8    je          004805E2
 004805DA    lea         edx,[ebp-34]
 004805DD    mov         dword ptr [ebp-1C],edx
>004805E0    jmp         004805E7
 004805E2    xor         edx,edx
 004805E4    mov         dword ptr [ebp-1C],edx
 004805E7    push        ebp
 004805E8    mov         eax,dword ptr [eax+34];TGLScene.?f34:TGLSceneRootObject
 004805EB    call        004804C8
 004805F0    pop         ecx
 004805F1    mov         eax,dword ptr [ebp-24]
 004805F4    mov         esp,ebp
 004805F6    pop         ebp
 004805F7    ret         8
end;*}

//004805FC
procedure sub_004805FC;
begin
{*
 004805FC    push        ebx
 004805FD    push        esi
 004805FE    push        edi
 004805FF    mov         ebx,eax
 00480601    mov         eax,ebx
 00480603    call        0047FFFC
 00480608    test        al,al
>0048060A    jne         00480635
 0048060C    cmp         dword ptr [ebx+44],0;TGLScene.?f44:dword
>00480610    je          00480635
 00480612    mov         eax,dword ptr [ebx+44];TGLScene.?f44:dword
 00480615    mov         esi,dword ptr [eax+0C]
 00480618    dec         esi
 00480619    test        esi,esi
>0048061B    jl          00480635
 0048061D    inc         esi
 0048061E    xor         edi,edi
 00480620    mov         edx,edi
 00480622    mov         eax,dword ptr [ebx+44];TGLScene.?f44:dword
 00480625    call        00466EF0
 0048062A    mov         edx,ebx
 0048062C    mov         ecx,dword ptr [eax]
 0048062E    call        dword ptr [ecx+10]
 00480631    inc         edi
 00480632    dec         esi
>00480633    jne         00480620
 00480635    pop         edi
 00480636    pop         esi
 00480637    pop         ebx
 00480638    ret
*}
end;

//0048063C
{*procedure sub_0048063C(?:?; ?:?);
begin
 0048063C    push        ebx
 0048063D    push        esi
 0048063E    push        edi
 0048063F    push        ebp
 00480640    add         esp,0FFFFFFF8
 00480643    mov         dword ptr [esp],edx
 00480646    mov         ebp,eax
 00480648    mov         eax,dword ptr [ebp+40]
 0048064B    mov         eax,dword ptr [eax+0C]
 0048064E    mov         dword ptr [esp+4],eax
 00480652    mov         eax,dword ptr [esp+4]
 00480656    cmp         eax,dword ptr [esp]
>00480659    jle         00480662
 0048065B    mov         eax,dword ptr [esp]
 0048065E    mov         dword ptr [esp+4],eax
 00480662    call        OpenGL32.glPushMatrix
 00480667    mov         esi,dword ptr [esp+4]
 0048066B    dec         esi
 0048066C    test        esi,esi
>0048066E    jl          00480854
 00480674    inc         esi
 00480675    xor         edi,edi
 00480677    mov         eax,dword ptr [ebp+40]
 0048067A    mov         edx,edi
 0048067C    call        00466EF0
 00480681    mov         ebx,eax
 00480683    test        ebx,ebx
>00480685    je          00480840
 0048068B    cmp         byte ptr [ebx+0AC],0
>00480692    je          00480832
 00480698    mov         eax,dword ptr [ebx+90]
 0048069E    push        eax
 0048069F    call        OpenGL32.glEnable
 004806A4    call        OpenGL32.glPopMatrix
 004806A9    call        OpenGL32.glPushMatrix
 004806AE    mov         eax,ebx
 004806B0    call        0047BB44
 004806B5    cmp         byte ptr [ebx+0BC],2
>004806BC    jne         004806EA
 004806BE    mov         eax,ebx
 004806C0    call        0047BBE0
 004806C5    push        eax
 004806C6    call        OpenGL32.glMultMatrixf
 004806CB    mov         eax,dword ptr [ebx+94]
 004806D1    call        0046B874
 004806D6    push        eax
 004806D7    push        1203
 004806DC    mov         eax,dword ptr [ebx+90]
 004806E2    push        eax
 004806E3    call        OpenGL32.glLightfv
>004806E8    jmp         00480712
 004806EA    mov         eax,dword ptr [ebx+58]
 004806ED    call        0047BBE0
 004806F2    push        eax
 004806F3    call        OpenGL32.glMultMatrixf
 004806F8    mov         eax,dword ptr [ebx+44]
 004806FB    call        0046B874
 00480700    push        eax
 00480701    push        1203
 00480706    mov         eax,dword ptr [ebx+90]
 0048070C    push        eax
 0048070D    call        OpenGL32.glLightfv
 00480712    mov         eax,dword ptr [ebx+0B0]
 00480718    call        00472C80
 0048071D    push        eax
 0048071E    push        1200
 00480723    mov         eax,dword ptr [ebx+90]
 00480729    push        eax
 0048072A    call        OpenGL32.glLightfv
 0048072F    mov         eax,dword ptr [ebx+0B4]
 00480735    call        00472C80
 0048073A    push        eax
 0048073B    push        1201
 00480740    mov         eax,dword ptr [ebx+90]
 00480746    push        eax
 00480747    call        OpenGL32.glLightfv
 0048074C    mov         eax,dword ptr [ebx+0B8]
 00480752    call        00472C80
 00480757    push        eax
 00480758    push        1202
 0048075D    mov         eax,dword ptr [ebx+90]
 00480763    push        eax
 00480764    call        OpenGL32.glLightfv
 00480769    cmp         byte ptr [ebx+0BC],0
>00480770    jne         004807D2
 00480772    fld         dword ptr [ebx+9C]
 00480778    fcomp       dword ptr ds:[480880];180:Single
 0048077E    fnstsw      al
 00480780    sahf
>00480781    je          004807B8
 00480783    mov         eax,dword ptr [ebx+94]
 00480789    call        0046B874
 0048078E    push        eax
 0048078F    push        1204
 00480794    mov         eax,dword ptr [ebx+90]
 0048079A    push        eax
 0048079B    call        OpenGL32.glLightfv
 004807A0    lea         eax,[ebx+98]
 004807A6    push        eax
 004807A7    push        1205
 004807AC    mov         eax,dword ptr [ebx+90]
 004807B2    push        eax
 004807B3    call        OpenGL32.glLightfv
 004807B8    lea         eax,[ebx+9C]
 004807BE    push        eax
 004807BF    push        1206
 004807C4    mov         eax,dword ptr [ebx+90]
 004807CA    push        eax
 004807CB    call        OpenGL32.glLightfv
>004807D0    jmp         004807E8
 004807D2    push        43340000
 004807D7    push        1206
 004807DC    mov         eax,dword ptr [ebx+90]
 004807E2    push        eax
 004807E3    call        OpenGL32.glLightf
 004807E8    lea         eax,[ebx+0A0]
 004807EE    push        eax
 004807EF    push        1207
 004807F4    mov         eax,dword ptr [ebx+90]
 004807FA    push        eax
 004807FB    call        OpenGL32.glLightfv
 00480800    lea         eax,[ebx+0A4]
 00480806    push        eax
 00480807    push        1208
 0048080C    mov         eax,dword ptr [ebx+90]
 00480812    push        eax
 00480813    call        OpenGL32.glLightfv
 00480818    lea         eax,[ebx+0A8]
 0048081E    push        eax
 0048081F    push        1209
 00480824    mov         eax,dword ptr [ebx+90]
 0048082A    push        eax
 0048082B    call        OpenGL32.glLightfv
>00480830    jmp         0048084C
 00480832    mov         eax,dword ptr [ebx+90]
 00480838    push        eax
 00480839    call        OpenGL32.glDisable
>0048083E    jmp         0048084C
 00480840    lea         eax,[edi+4000]
 00480846    push        eax
 00480847    call        OpenGL32.glDisable
 0048084C    inc         edi
 0048084D    dec         esi
>0048084E    jne         00480677
 00480854    call        OpenGL32.glPopMatrix
 00480859    mov         edi,dword ptr [esp+4]
 0048085D    mov         esi,dword ptr [esp]
 00480860    dec         esi
 00480861    sub         esi,edi
>00480863    jl          00480876
 00480865    inc         esi
 00480866    lea         eax,[edi+4000]
 0048086C    push        eax
 0048086D    call        OpenGL32.glDisable
 00480872    inc         edi
 00480873    dec         esi
>00480874    jne         00480866
 00480876    pop         ecx
 00480877    pop         edx
 00480878    pop         ebp
 00480879    pop         edi
 0048087A    pop         esi
 0048087B    pop         ebx
 0048087C    ret
end;*}

//00480884
constructor TGLFogEnvironment.Create;
begin
{*
 00480884    push        ebx
 00480885    push        esi
 00480886    push        edi
 00480887    test        dl,dl
>00480889    je          00480893
 0048088B    add         esp,0FFFFFFF0
 0048088E    call        @ClassCreate
 00480893    mov         esi,ecx
 00480895    mov         ebx,edx
 00480897    mov         edi,eax
 00480899    mov         ecx,esi
 0048089B    xor         edx,edx
 0048089D    mov         eax,edi
 0048089F    call        0046B394
 004808A4    mov         eax,esi
 004808A6    mov         edx,dword ptr ds:[47AB64];TGLSceneBuffer
 004808AC    call        @AsClass
 004808B1    mov         dword ptr [edi+18],eax;TGLFogEnvironment.?f18:TGLSceneBuffer
 004808B4    mov         eax,[005AE694];^gvar_005AD41C
 004808B9    push        eax
 004808BA    push        0
 004808BC    push        0
 004808BE    mov         ecx,edi
 004808C0    mov         dl,1
 004808C2    mov         eax,[00470BF8];TGLColor
 004808C7    call        TGLColor.Create;TGLColor.Create
 004808CC    mov         dword ptr [edi+1C],eax;TGLFogEnvironment.FogColor:TGLColor
 004808CF    mov         byte ptr [edi+28],0;TGLFogEnvironment.FogMode:TFogMode
 004808D3    mov         dword ptr [edi+20],41200000;TGLFogEnvironment.FogStart:Single
 004808DA    mov         dword ptr [edi+24],447A0000;TGLFogEnvironment.FogEnd:Single
 004808E1    mov         byte ptr [edi+29],0;TGLFogEnvironment.FogDistance:TFogDistance
 004808E5    mov         eax,edi
 004808E7    test        bl,bl
>004808E9    je          004808FA
 004808EB    call        @AfterConstruction
 004808F0    pop         dword ptr fs:[0]
 004808F7    add         esp,0C
 004808FA    mov         eax,edi
 004808FC    pop         edi
 004808FD    pop         esi
 004808FE    pop         ebx
 004808FF    ret
*}
end;

//00480900
destructor TGLFogEnvironment.Destroy;
begin
{*
 00480900    push        ebx
 00480901    push        esi
 00480902    call        @BeforeDestruction
 00480907    mov         ebx,edx
 00480909    mov         esi,eax
 0048090B    mov         eax,dword ptr [esi+1C];TGLFogEnvironment.FogColor:TGLColor
 0048090E    call        TObject.Free
 00480913    mov         edx,ebx
 00480915    and         dl,0FC
 00480918    mov         eax,esi
 0048091A    call        TMemoryStream.Destroy
 0048091F    test        bl,bl
>00480921    jle         0048092A
 00480923    mov         eax,esi
 00480925    call        @ClassDestroy
 0048092A    pop         esi
 0048092B    pop         ebx
 0048092C    ret
*}
end;

//00480930
procedure TGLFogEnvironment.SetFogColor(Value:TGLColor);
begin
{*
 00480930    push        ebx
 00480931    mov         ebx,eax
 00480933    test        edx,edx
>00480935    je          00480948
 00480937    mov         eax,dword ptr [ebx+1C];TGLFogEnvironment.FogColor:TGLColor
 0048093A    mov         ecx,dword ptr [eax]
 0048093C    call        dword ptr [ecx+8];TGLColor.Assign
 0048093F    mov         edx,ebx
 00480941    mov         eax,ebx
 00480943    mov         ecx,dword ptr [eax]
 00480945    call        dword ptr [ecx+10];TGLFogEnvironment.sub_0046B3D0
 00480948    pop         ebx
 00480949    ret
*}
end;

//0048094C
{*procedure TGLFogEnvironment.SetFogStart(Value:Single; ?:?);
begin
 0048094C    push        ebp
 0048094D    mov         ebp,esp
 0048094F    mov         edx,eax
 00480951    fld         dword ptr [ebp+8]
 00480954    fcomp       dword ptr [edx+20];TGLFogEnvironment.FogStart:Single
 00480957    fnstsw      al
 00480959    sahf
>0048095A    je          00480969
 0048095C    mov         eax,dword ptr [ebp+8]
 0048095F    mov         dword ptr [edx+20],eax;TGLFogEnvironment.FogStart:Single
 00480962    mov         eax,edx
 00480964    mov         ecx,dword ptr [eax]
 00480966    call        dword ptr [ecx+10];TGLFogEnvironment.sub_0046B3D0
 00480969    pop         ebp
 0048096A    ret         4
end;*}

//00480970
{*procedure TGLFogEnvironment.SetFogEnd(Value:Single; ?:?);
begin
 00480970    push        ebp
 00480971    mov         ebp,esp
 00480973    mov         edx,eax
 00480975    fld         dword ptr [ebp+8]
 00480978    fcomp       dword ptr [edx+24];TGLFogEnvironment.FogEnd:Single
 0048097B    fnstsw      al
 0048097D    sahf
>0048097E    je          0048098D
 00480980    mov         eax,dword ptr [ebp+8]
 00480983    mov         dword ptr [edx+24],eax;TGLFogEnvironment.FogEnd:Single
 00480986    mov         eax,edx
 00480988    mov         ecx,dword ptr [eax]
 0048098A    call        dword ptr [ecx+10];TGLFogEnvironment.sub_0046B3D0
 0048098D    pop         ebp
 0048098E    ret         4
end;*}

//00480994
procedure TGLFogEnvironment.Assign(Source:TPersistent);
begin
{*
 00480994    push        ebx
 00480995    push        esi
 00480996    push        edi
 00480997    mov         esi,edx
 00480999    mov         ebx,eax
 0048099B    mov         eax,esi
 0048099D    mov         edx,dword ptr ds:[47A8EC];TGLFogEnvironment
 004809A3    call        @IsClass
 004809A8    test        al,al
>004809AA    je          004809DA
 004809AC    mov         edi,esi
 004809AE    mov         edx,dword ptr [edi+1C]
 004809B1    mov         eax,dword ptr [ebx+1C];TGLFogEnvironment.FogColor:TGLColor
 004809B4    mov         ecx,dword ptr [eax]
 004809B6    call        dword ptr [ecx+8];TGLColor.Assign
 004809B9    mov         eax,dword ptr [edi+20]
 004809BC    mov         dword ptr [ebx+20],eax;TGLFogEnvironment.FogStart:Single
 004809BF    mov         eax,dword ptr [edi+24]
 004809C2    mov         dword ptr [ebx+24],eax;TGLFogEnvironment.FogEnd:Single
 004809C5    mov         al,byte ptr [edi+28]
 004809C8    mov         byte ptr [ebx+28],al;TGLFogEnvironment.FogMode:TFogMode
 004809CB    mov         al,byte ptr [edi+29]
 004809CE    mov         byte ptr [ebx+29],al;TGLFogEnvironment.FogDistance:TFogDistance
 004809D1    mov         edx,ebx
 004809D3    mov         eax,ebx
 004809D5    mov         ecx,dword ptr [eax]
 004809D7    call        dword ptr [ecx+10];TGLFogEnvironment.sub_0046B3D0
 004809DA    mov         edx,esi
 004809DC    mov         eax,ebx
 004809DE    call        TPersistent.Assign
 004809E3    pop         edi
 004809E4    pop         esi
 004809E5    pop         ebx
 004809E6    ret
*}
end;

//004809E8
{*function sub_004809E8(?:TGLFogEnvironment):?;
begin
 004809E8    push        ebx
 004809E9    push        esi
 004809EA    mov         ebx,eax
 004809EC    mov         esi,dword ptr [ebx+1C]
 004809EF    lea         edx,[esi+18]
 004809F2    lea         eax,[esi+18]
 004809F5    call        0045D870
 004809FA    test        al,al
>004809FC    je          00480A26
 004809FE    fld         dword ptr [ebx+20]
 00480A01    fcomp       dword ptr ds:[480A30];10:Single
 00480A07    fnstsw      al
 00480A09    sahf
>00480A0A    jne         00480A26
 00480A0C    fld         dword ptr [ebx+24]
 00480A0F    fcomp       dword ptr ds:[480A34];1000:Single
 00480A15    fnstsw      al
 00480A17    sahf
>00480A18    jne         00480A26
 00480A1A    cmp         byte ptr [ebx+28],0
>00480A1E    jne         00480A26
 00480A20    cmp         byte ptr [ebx+29],0
>00480A24    je          00480A2B
 00480A26    xor         eax,eax
 00480A28    pop         esi
 00480A29    pop         ebx
 00480A2A    ret
 00480A2B    mov         al,1
 00480A2D    pop         esi
 00480A2E    pop         ebx
 00480A2F    ret
end;*}

//00480A38
procedure TGLFogEnvironment.SetFogMode(Value:TFogMode);
begin
{*
 00480A38    cmp         dl,byte ptr [eax+28];TGLFogEnvironment.FogMode:TFogMode
>00480A3B    je          00480A47
 00480A3D    mov         byte ptr [eax+28],dl;TGLFogEnvironment.FogMode:TFogMode
 00480A40    mov         edx,eax
 00480A42    mov         ecx,dword ptr [eax]
 00480A44    call        dword ptr [ecx+10];TGLFogEnvironment.sub_0046B3D0
 00480A47    ret
*}
end;

//00480A48
procedure TGLFogEnvironment.SetFogDistance(Value:TFogDistance);
begin
{*
 00480A48    cmp         dl,byte ptr [eax+29];TGLFogEnvironment.FogDistance:TFogDistance
>00480A4B    je          00480A57
 00480A4D    mov         byte ptr [eax+29],dl;TGLFogEnvironment.FogDistance:TFogDistance
 00480A50    mov         edx,eax
 00480A52    mov         ecx,dword ptr [eax]
 00480A54    call        dword ptr [ecx+10];TGLFogEnvironment.sub_0046B3D0
 00480A57    ret
*}
end;

//00480A58
{*procedure sub_00480A58(?:?);
begin
 00480A58    push        ebx
 00480A59    push        esi
 00480A5A    push        edi
 00480A5B    mov         edi,eax
 00480A5D    mov         esi,dword ptr [edi+18]
 00480A60    mov         ebx,dword ptr [esi+20]
 00480A63    test        ebx,ebx
>00480A65    je          00480B99
 00480A6B    mov         eax,ebx
 00480A6D    call        0046C844
 00480A72    xor         al,1
 00480A74    mov         ebx,eax
 00480A76    test        bl,bl
>00480A78    je          00480A82
 00480A7A    mov         eax,dword ptr [esi+20]
 00480A7D    call        0046CC00
 00480A82    mov         al,byte ptr [edi+28]
 00480A85    sub         al,1
>00480A87    jb          00480A91
>00480A89    je          00480AA2
 00480A8B    dec         al
>00480A8D    je          00480AC3
>00480A8F    jmp         00480AE2
 00480A91    push        2601
 00480A96    push        0B65
 00480A9B    call        OpenGL32.glFogi
>00480AA0    jmp         00480AE2
 00480AA2    push        800
 00480AA7    push        0B65
 00480AAC    call        OpenGL32.glFogi
 00480AB1    mov         eax,dword ptr [edi+1C]
 00480AB4    push        dword ptr [eax+24]
 00480AB7    push        0B62
 00480ABC    call        OpenGL32.glFogf
>00480AC1    jmp         00480AE2
 00480AC3    push        801
 00480AC8    push        0B65
 00480ACD    call        OpenGL32.glFogi
 00480AD2    mov         eax,dword ptr [edi+1C]
 00480AD5    push        dword ptr [eax+24]
 00480AD8    push        0B62
 00480ADD    call        OpenGL32.glFogf
 00480AE2    mov         eax,dword ptr [edi+1C]
 00480AE5    call        00472C80
 00480AEA    push        eax
 00480AEB    push        0B66
 00480AF0    call        OpenGL32.glFogfv
 00480AF5    push        dword ptr [edi+20]
 00480AF8    push        0B63
 00480AFD    call        OpenGL32.glFogf
 00480B02    push        dword ptr [edi+24]
 00480B05    push        0B64
 00480B0A    call        OpenGL32.glFogf
 00480B0F    mov         eax,[005AE6D4];^gvar_005E0D1A
 00480B14    cmp         byte ptr [eax],0
>00480B17    je          00480B8A
 00480B19    mov         al,byte ptr [edi+29]
 00480B1C    sub         al,1
>00480B1E    jb          00480B28
>00480B20    je          00480B65
 00480B22    dec         al
>00480B24    je          00480B54
>00480B26    jmp         00480B76
 00480B28    cmp         dword ptr ds:[5AD564],0FFFFFFFF;gvar_005AD564
>00480B2F    jne         00480B42
 00480B31    push        5AD564;gvar_005AD564
 00480B36    push        855A
 00480B3B    call        OpenGL32.glGetIntegerv
>00480B40    jmp         00480B8A
 00480B42    mov         eax,[005AD564];0xFFFFFFFF gvar_005AD564
 00480B47    push        eax
 00480B48    push        855A
 00480B4D    call        OpenGL32.glFogi
>00480B52    jmp         00480B8A
 00480B54    push        855C
 00480B59    push        855A
 00480B5E    call        OpenGL32.glFogi
>00480B63    jmp         00480B8A
 00480B65    push        855B
 00480B6A    push        855A
 00480B6F    call        OpenGL32.glFogi
>00480B74    jmp         00480B8A
 00480B76    mov         ecx,19A8
 00480B7B    mov         edx,480BA8;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 00480B80    mov         eax,480BE0;'Assertion failure'
 00480B85    call        @Assert
 00480B8A    test        bl,bl
>00480B8C    je          00480B99
 00480B8E    mov         eax,dword ptr [edi+18]
 00480B91    mov         eax,dword ptr [eax+20]
 00480B94    call        0046CD1C
 00480B99    pop         edi
 00480B9A    pop         esi
 00480B9B    pop         ebx
 00480B9C    ret
end;*}

//00480BF4
constructor TGLSceneBuffer.Create;
begin
{*
 00480BF4    push        ebx
 00480BF5    push        esi
 00480BF6    test        dl,dl
>00480BF8    je          00480C02
 00480BFA    add         esp,0FFFFFFF0
 00480BFD    call        @ClassCreate
 00480C02    mov         ebx,edx
 00480C04    mov         esi,eax
 00480C06    xor         edx,edx
 00480C08    mov         eax,esi
 00480C0A    call        0046B394
 00480C0F    mov         ecx,esi
 00480C11    mov         dl,1
 00480C13    mov         eax,[0047A8EC];TGLFogEnvironment
 00480C18    call        TGLFogEnvironment.Create;TGLFogEnvironment.Create
 00480C1D    mov         dword ptr [esi+128],eax;TGLSceneBuffer.FogEnvironment:TGLFogEnvironment
 00480C23    mov         dword ptr [esi+110],0FF00000F;TGLSceneBuffer.BackgroundColor:TColor
 00480C2D    mov         dword ptr [esi+114],3F800000;TGLSceneBuffer.?f114:dword
 00480C37    mov         eax,[005AE6EC];^gvar_005AD42C
 00480C3C    push        eax
 00480C3D    push        0
 00480C3F    push        0
 00480C41    mov         ecx,esi
 00480C43    mov         dl,1
 00480C45    mov         eax,[00470BF8];TGLColor
 00480C4A    call        TGLColor.Create;TGLColor.Create
 00480C4F    mov         dword ptr [esi+118],eax;TGLSceneBuffer.AmbientColor:TGLColor
 00480C55    mov         byte ptr [esi+10F],1;TGLSceneBuffer.DepthTest:Boolean
 00480C5C    mov         byte ptr [esi+10C],1;TGLSceneBuffer.FaceCulling:Boolean
 00480C63    mov         byte ptr [esi+10E],1;TGLSceneBuffer.Lighting:Boolean
 00480C6A    mov         byte ptr [esi+11C],0;TGLSceneBuffer.AntiAliasing:TGLAntiAliasing
 00480C71    mov         byte ptr [esi+11D],0;TGLSceneBuffer.DepthPrecision:TGLDepthPrecision
 00480C78    mov         byte ptr [esi+11E],0;TGLSceneBuffer.ColorDepth:TGLColorDepth
 00480C7F    mov         byte ptr [esi+121],0;TGLSceneBuffer.ShadeModel:TGLShadeModel
 00480C86    mov         byte ptr [esi+10D],0;TGLSceneBuffer.FogEnable:Boolean
 00480C8D    mov         dl,1
 00480C8F    mov         eax,[00466194];TPersistentObjectList
 00480C94    call        TPersistentObjectList.Create;TPersistentObjectList.Create
 00480C99    mov         dword ptr [esi+24],eax;TGLSceneBuffer.?f24:TPersistentObjectList
 00480C9C    mov         dl,1
 00480C9E    mov         eax,[0046D52C];TGLStateCache
 00480CA3    call        TGLStateCache.Create;TGLStateCache.Create
 00480CA8    mov         dword ptr [esi+18],eax;TGLSceneBuffer.?f18:TGLStateCache
 00480CAB    mov         ax,[00480CDC];0x5 gvar_00480CDC
 00480CB1    mov         word ptr [esi+11F],ax;TGLSceneBuffer.ContextOptions:TContextOptions
 00480CB8    mov         eax,esi
 00480CBA    call        00481530
 00480CBF    mov         eax,esi
 00480CC1    test        bl,bl
>00480CC3    je          00480CD4
 00480CC5    call        @AfterConstruction
 00480CCA    pop         dword ptr fs:[0]
 00480CD1    add         esp,0C
 00480CD4    mov         eax,esi
 00480CD6    pop         esi
 00480CD7    pop         ebx
 00480CD8    ret
*}
end;

//00480CE0
destructor TGLSceneBuffer.Destroy;
begin
{*
 00480CE0    push        ebx
 00480CE1    push        esi
 00480CE2    call        @BeforeDestruction
 00480CE7    mov         ebx,edx
 00480CE9    mov         esi,eax
 00480CEB    mov         eax,esi
 00480CED    call        00481508
 00480CF2    mov         eax,dword ptr [esi+18];TGLSceneBuffer.?f18:TGLStateCache
 00480CF5    call        TObject.Free
 00480CFA    mov         eax,dword ptr [esi+130];TGLSceneBuffer.?f130:dword
 00480D00    test        eax,eax
>00480D02    je          00480D1C
 00480D04    cmp         dword ptr [eax+5C],0
>00480D08    je          00480D1C
 00480D0A    mov         eax,dword ptr [eax+5C]
 00480D0D    mov         edx,esi
 00480D0F    call        0047FF5C
 00480D14    xor         eax,eax
 00480D16    mov         dword ptr [esi+130],eax;TGLSceneBuffer.?f130:dword
 00480D1C    mov         eax,esi
 00480D1E    call        00481070
 00480D23    mov         eax,dword ptr [esi+118];TGLSceneBuffer.AmbientColor:TGLColor
 00480D29    call        TObject.Free
 00480D2E    mov         eax,dword ptr [esi+24];TGLSceneBuffer.?f24:TPersistentObjectList
 00480D31    call        TObject.Free
 00480D36    mov         eax,dword ptr [esi+128];TGLSceneBuffer.FogEnvironment:TGLFogEnvironment
 00480D3C    call        TObject.Free
 00480D41    mov         edx,ebx
 00480D43    and         dl,0FC
 00480D46    mov         eax,esi
 00480D48    call        TMemoryStream.Destroy
 00480D4D    test        bl,bl
>00480D4F    jle         00480D58
 00480D51    mov         eax,esi
 00480D53    call        @ClassDestroy
 00480D58    pop         esi
 00480D59    pop         ebx
 00480D5A    ret
*}
end;

//00480D5C
{*procedure sub_00480D5C(?:?);
begin
 00480D5C    push        ebx
 00480D5D    cmp         word ptr [eax+17A],0
>00480D65    je          00480D77
 00480D67    mov         ebx,eax
 00480D69    mov         edx,eax
 00480D6B    mov         eax,dword ptr [ebx+17C]
 00480D71    call        dword ptr [ebx+178]
 00480D77    pop         ebx
 00480D78    ret
end;*}

//00480D7C
{*procedure sub_00480D7C(?:?; ?:?);
begin
 00480D7C    push        ebx
 00480D7D    push        esi
 00480D7E    push        edi
 00480D7F    push        ebp
 00480D80    add         esp,0FFFFFFF8
 00480D83    mov         esi,edx
 00480D85    mov         edi,eax
 00480D87    mov         bl,byte ptr ds:[480E6C];0x0 gvar_00480E6C
 00480D8D    test        byte ptr [edi+11F],1
>00480D94    je          00480D9F
 00480D96    mov         al,[00480E70];0x1 gvar_00480E70
 00480D9B    or          al,bl
 00480D9D    mov         ebx,eax
 00480D9F    test        byte ptr [edi+11F],10
>00480DA6    je          00480DB1
 00480DA8    mov         al,[00480E74];0x2 gvar_00480E74
 00480DAD    or          al,bl
 00480DAF    mov         ebx,eax
 00480DB1    test        byte ptr [edi+11F],40
>00480DB8    je          00480DC2
 00480DBA    xor         eax,eax
 00480DBC    mov         dword ptr [esp+4],eax
>00480DC0    jmp         00480DD5
 00480DC2    xor         eax,eax
 00480DC4    mov         al,byte ptr [edi+11E]
 00480DCA    mov         eax,dword ptr [eax*4+5AD568]
 00480DD1    mov         dword ptr [esp+4],eax
 00480DD5    test        byte ptr [edi+11F],2
>00480DDC    je          00480DE5
 00480DDE    mov         ebp,8
>00480DE3    jmp         00480DE7
 00480DE5    xor         ebp,ebp
 00480DE7    test        byte ptr [edi+11F],20
>00480DEE    je          00480DF9
 00480DF0    mov         dword ptr [esp],8
>00480DF7    jmp         00480DFE
 00480DF9    xor         eax,eax
 00480DFB    mov         dword ptr [esp],eax
 00480DFE    mov         edx,ebx
 00480E00    mov         eax,esi
 00480E02    call        0046C760
 00480E07    mov         edx,dword ptr [esp+4]
 00480E0B    mov         eax,esi
 00480E0D    call        0046C4D8
 00480E12    xor         eax,eax
 00480E14    mov         al,byte ptr [edi+11D]
 00480E1A    mov         edx,dword ptr [eax*4+5AD580]
 00480E21    mov         eax,esi
 00480E23    call        0046C5B0
 00480E28    mov         edx,ebp
 00480E2A    mov         eax,esi
 00480E2C    call        0046C61C
 00480E31    mov         edx,dword ptr [esp]
 00480E34    mov         eax,esi
 00480E36    call        0046C544
 00480E3B    mov         edx,dword ptr [edi+12C]
 00480E41    mov         eax,esi
 00480E43    call        0046C688
 00480E48    xor         edx,edx
 00480E4A    mov         eax,esi
 00480E4C    call        0046C6F4
 00480E51    mov         dl,byte ptr [edi+11C]
 00480E57    mov         eax,esi
 00480E59    call        0046C7D8
 00480E5E    mov         eax,edi
 00480E60    call        00480D5C
 00480E65    pop         ecx
 00480E66    pop         edx
 00480E67    pop         ebp
 00480E68    pop         edi
 00480E69    pop         esi
 00480E6A    pop         ebx
 00480E6B    ret
end;*}

//00480E78
{*procedure sub_00480E78(?:TGLSceneBuffer; ?:HDC; ?:?);
begin
 00480E78    push        ebp
 00480E79    mov         ebp,esp
 00480E7B    add         esp,0FFFFFFE8
 00480E7E    push        ebx
 00480E7F    push        esi
 00480E80    push        edi
 00480E81    xor         ebx,ebx
 00480E83    mov         dword ptr [ebp-18],ebx
 00480E86    mov         ebx,ecx
 00480E88    mov         esi,edx
 00480E8A    mov         dword ptr [ebp-4],eax
 00480E8D    xor         eax,eax
 00480E8F    push        ebp
 00480E90    push        481035
 00480E95    push        dword ptr fs:[eax]
 00480E98    mov         dword ptr fs:[eax],esp
 00480E9B    mov         eax,dword ptr [ebp-4]
 00480E9E    call        00481070
 00480EA3    mov         eax,dword ptr [ebp-4]
 00480EA6    mov         byte ptr [eax+1C],1
 00480EAA    xor         edx,edx
 00480EAC    push        ebp
 00480EAD    push        481018
 00480EB2    push        dword ptr fs:[edx]
 00480EB5    mov         dword ptr fs:[edx],esp
 00480EB8    mov         eax,[005AE370];^gvar_005E14A4:TGLContextManager
 00480EBD    mov         eax,dword ptr [eax]
 00480EBF    call        0046D1D4
 00480EC4    mov         edi,eax
 00480EC6    mov         eax,dword ptr [ebp-4]
 00480EC9    mov         dword ptr [eax+20],edi
 00480ECC    test        edi,edi
>00480ECE    jne         00480EE6
 00480ED0    mov         ecx,48104C;'Failed to create RenderingContext.'
 00480ED5    mov         dl,1
 00480ED7    mov         eax,[00408B30];Exception
 00480EDC    call        Exception.Create;Exception.Create
 00480EE1    call        @RaiseExcept
 00480EE6    mov         eax,dword ptr [ebp-4]
 00480EE9    mov         edx,dword ptr [eax+20]
 00480EEC    mov         eax,dword ptr [ebp-4]
 00480EEF    call        00480D7C
 00480EF4    mov         eax,dword ptr [ebp-4]
 00480EF7    mov         eax,dword ptr [eax+20]
 00480EFA    xor         edx,edx
 00480EFC    push        ebp
 00480EFD    push        480F39
 00480F02    push        dword ptr fs:[edx]
 00480F05    mov         dword ptr fs:[edx],esp
 00480F08    test        bl,bl
>00480F0A    je          00480F28
 00480F0C    mov         edx,dword ptr [ebp-4]
 00480F0F    mov         edx,dword ptr [edx+108]
 00480F15    push        edx
 00480F16    mov         edx,dword ptr [ebp-4]
 00480F19    mov         ecx,dword ptr [edx+104]
 00480F1F    mov         edx,esi
 00480F21    call        0046C904
>00480F26    jmp         00480F2F
 00480F28    mov         edx,esi
 00480F2A    call        0046C878
 00480F2F    xor         eax,eax
 00480F31    pop         edx
 00480F32    pop         ecx
 00480F33    pop         ecx
 00480F34    mov         dword ptr fs:[eax],edx
>00480F37    jmp         00480F53
>00480F39    jmp         @HandleAnyException
 00480F3E    mov         eax,dword ptr [ebp-4]
 00480F41    add         eax,20
 00480F44    call        FreeAndNil
 00480F49    call        @RaiseAgain
 00480F4E    call        @DoneExcept
 00480F53    mov         eax,dword ptr [ebp-4]
 00480F56    mov         eax,dword ptr [eax+20]
 00480F59    call        0046CC00
 00480F5E    xor         eax,eax
 00480F60    push        ebp
 00480F61    push        480FFC
 00480F66    push        dword ptr fs:[eax]
 00480F69    mov         dword ptr fs:[eax],esp
 00480F6C    mov         eax,[005AE674];^gvar_005E0CD5
 00480F71    cmp         byte ptr [eax],0
>00480F74    jne         00480F97
 00480F76    lea         edx,[ebp-18]
 00480F79    mov         eax,[005AE250];^SResString14:TResStringRec
 00480F7E    call        LoadStr
 00480F83    mov         ecx,dword ptr [ebp-18]
 00480F86    mov         dl,1
 00480F88    mov         eax,[0046C278];EOpenGLError
 00480F8D    call        Exception.Create;EOpenGLError.Create
 00480F92    call        @RaiseExcept
 00480F97    mov         eax,dword ptr [ebp-4]
 00480F9A    mov         eax,dword ptr [eax+108]
 00480FA0    push        eax
 00480FA1    mov         eax,dword ptr [ebp-4]
 00480FA4    mov         eax,dword ptr [eax+104]
 00480FAA    push        eax
 00480FAB    push        0
 00480FAD    push        0
 00480FAF    call        OpenGL32.glViewport
 00480FB4    mov         eax,dword ptr [ebp-4]
 00480FB7    call        00481170
 00480FBC    push        3F800000
 00480FC1    lea         edx,[ebp-14]
 00480FC4    mov         eax,dword ptr [ebp-4]
 00480FC7    mov         eax,dword ptr [eax+110]
 00480FCD    call        00478438
 00480FD2    push        dword ptr [ebp-8]
 00480FD5    push        dword ptr [ebp-0C]
 00480FD8    push        dword ptr [ebp-10]
 00480FDB    push        dword ptr [ebp-14]
 00480FDE    call        OpenGL32.glClearColor
 00480FE3    xor         eax,eax
 00480FE5    pop         edx
 00480FE6    pop         ecx
 00480FE7    pop         ecx
 00480FE8    mov         dword ptr fs:[eax],edx
 00480FEB    push        481003
 00480FF0    mov         eax,dword ptr [ebp-4]
 00480FF3    mov         eax,dword ptr [eax+20]
 00480FF6    call        0046CD1C
 00480FFB    ret
>00480FFC    jmp         @HandleFinally
>00481001    jmp         00480FF0
 00481003    xor         eax,eax
 00481005    pop         edx
 00481006    pop         ecx
 00481007    pop         ecx
 00481008    mov         dword ptr fs:[eax],edx
 0048100B    push        48101F
 00481010    mov         eax,dword ptr [ebp-4]
 00481013    mov         byte ptr [eax+1C],0
 00481017    ret
>00481018    jmp         @HandleFinally
>0048101D    jmp         00481010
 0048101F    xor         eax,eax
 00481021    pop         edx
 00481022    pop         ecx
 00481023    pop         ecx
 00481024    mov         dword ptr fs:[eax],edx
 00481027    push        48103C
 0048102C    lea         eax,[ebp-18]
 0048102F    call        @LStrClr
 00481034    ret
>00481035    jmp         @HandleFinally
>0048103A    jmp         0048102C
 0048103C    pop         edi
 0048103D    pop         esi
 0048103E    pop         ebx
 0048103F    mov         esp,ebp
 00481041    pop         ebp
 00481042    ret
end;*}

//00481070
procedure sub_00481070(?:TGLSceneBuffer);
begin
{*
 00481070    push        ebx
 00481071    mov         ebx,eax
 00481073    cmp         dword ptr [ebx+20],0;TGLSceneBuffer.?f20:dword
>00481077    je          004810A2
 00481079    mov         eax,ebx
 0048107B    call        00481508
 00481080    lea         eax,[ebx+20];TGLSceneBuffer.?f20:dword
 00481083    call        FreeAndNil
 00481088    mov         eax,dword ptr [ebx+130];TGLSceneBuffer.?f130:dword
 0048108E    test        eax,eax
>00481090    je          004810A2
 00481092    cmp         dword ptr [eax+5C],0
>00481096    je          004810A2
 00481098    mov         eax,dword ptr [eax+5C]
 0048109B    mov         edx,ebx
 0048109D    call        0047FF5C
 004810A2    pop         ebx
 004810A3    ret
*}
end;

//004810A4
function sub_004810A4(?:TGLSceneBuffer):Boolean;
begin
{*
 004810A4    cmp         dword ptr [eax+20],0
 004810A8    setne       al
 004810AB    ret
*}
end;

//004810AC
procedure sub_004810AC(?:TGLSceneBuffer; ?:Integer; ?:Integer);
begin
{*
 004810AC    push        ebp
 004810AD    mov         ebp,esp
 004810AF    push        ecx
 004810B0    mov         dword ptr [ebp-4],eax
 004810B3    cmp         edx,1
>004810B6    jge         004810BD
 004810B8    mov         edx,1
 004810BD    cmp         ecx,1
>004810C0    jge         004810C7
 004810C2    mov         ecx,1
 004810C7    mov         eax,dword ptr [ebp-4]
 004810CA    mov         dword ptr [eax+104],edx
 004810D0    mov         eax,dword ptr [ebp-4]
 004810D3    mov         dword ptr [eax+108],ecx
 004810D9    mov         eax,dword ptr [ebp-4]
 004810DC    mov         eax,dword ptr [eax+20]
 004810DF    test        eax,eax
>004810E1    je          00481133
 004810E3    call        0046CC00
 004810E8    xor         eax,eax
 004810EA    push        ebp
 004810EB    push        48112C
 004810F0    push        dword ptr fs:[eax]
 004810F3    mov         dword ptr fs:[eax],esp
 004810F6    mov         eax,dword ptr [ebp-4]
 004810F9    mov         eax,dword ptr [eax+108]
 004810FF    push        eax
 00481100    mov         eax,dword ptr [ebp-4]
 00481103    mov         eax,dword ptr [eax+104]
 00481109    push        eax
 0048110A    push        0
 0048110C    push        0
 0048110E    call        OpenGL32.glViewport
 00481113    xor         eax,eax
 00481115    pop         edx
 00481116    pop         ecx
 00481117    pop         ecx
 00481118    mov         dword ptr fs:[eax],edx
 0048111B    push        481133
 00481120    mov         eax,dword ptr [ebp-4]
 00481123    mov         eax,dword ptr [eax+20]
 00481126    call        0046CD1C
 0048112B    ret
>0048112C    jmp         @HandleFinally
>00481131    jmp         00481120
 00481133    pop         ecx
 00481134    pop         ebp
 00481135    ret
*}
end;

//00481138
{*procedure sub_00481138(?:?; ?:?; ?:?; ?:?);
begin
 00481138    push        ebp
 00481139    mov         ebp,esp
 0048113B    push        ebx
 0048113C    mov         ebx,ecx
 0048113E    test        al,al
>00481140    je          00481159
 00481142    mov         eax,dword ptr [ebp+8]
 00481145    mov         eax,dword ptr [eax-4]
 00481148    mov         eax,dword ptr [eax+18]
 0048114B    call        0046D5F8
 00481150    push        ebx
 00481151    call        OpenGL32.glEnable
 00481156    pop         ebx
 00481157    pop         ebp
 00481158    ret
 00481159    mov         eax,dword ptr [ebp+8]
 0048115C    mov         eax,dword ptr [eax-4]
 0048115F    mov         eax,dword ptr [eax+18]
 00481162    call        0046D634
 00481167    push        ebx
 00481168    call        OpenGL32.glDisable
 0048116D    pop         ebx
 0048116E    pop         ebp
 0048116F    ret
end;*}

//00481170
{*procedure sub_00481170(?:?);
begin
 00481170    push        ebp
 00481171    mov         ebp,esp
 00481173    add         esp,0FFFFFFF8
 00481176    mov         dword ptr [ebp-4],eax
 00481179    mov         eax,dword ptr [ebp-4]
 0048117C    mov         eax,dword ptr [eax+118]
 00481182    call        00472C80
 00481187    push        eax
 00481188    push        0B53
 0048118D    call        OpenGL32.glLightModelfv
 00481192    mov         eax,dword ptr [ebp-4]
 00481195    test        byte ptr [eax+11F],8
>0048119C    je          004811AC
 0048119E    push        1
 004811A0    push        0B52
 004811A5    call        OpenGL32.glLightModeli
>004811AA    jmp         004811B8
 004811AC    push        0
 004811AE    push        0B52
 004811B3    call        OpenGL32.glLightModeli
 004811B8    push        ebp
 004811B9    mov         ecx,0BA1
 004811BE    mov         dl,0C
 004811C0    mov         al,1
 004811C2    call        00481138
 004811C7    pop         ecx
 004811C8    push        ebp
 004811C9    mov         eax,dword ptr [ebp-4]
 004811CC    mov         al,byte ptr [eax+10F]
 004811D2    mov         ecx,0B71
 004811D7    mov         dl,5
 004811D9    call        00481138
 004811DE    pop         ecx
 004811DF    push        ebp
 004811E0    mov         eax,dword ptr [ebp-4]
 004811E3    mov         al,byte ptr [eax+10C]
 004811E9    mov         ecx,0B44
 004811EE    mov         dl,4
 004811F0    call        00481138
 004811F5    pop         ecx
 004811F6    push        ebp
 004811F7    mov         eax,dword ptr [ebp-4]
 004811FA    mov         al,byte ptr [eax+10E]
 00481200    mov         ecx,0B50
 00481205    mov         dl,8
 00481207    call        00481138
 0048120C    pop         ecx
 0048120D    push        ebp
 0048120E    mov         eax,dword ptr [ebp-4]
 00481211    mov         al,byte ptr [eax+10D]
 00481217    mov         ecx,0B60
 0048121C    mov         dl,7
 0048121E    call        00481138
 00481223    pop         ecx
 00481224    lea         eax,[ebp-8]
 00481227    push        eax
 00481228    push        0D54
 0048122D    call        OpenGL32.glGetIntegerv
 00481232    push        ebp
 00481233    cmp         dword ptr [ebp-8],8
 00481237    setb        al
 0048123A    mov         ecx,0BD0
 0048123F    mov         dl,6
 00481241    call        00481138
 00481246    pop         ecx
 00481247    push        201
 0048124C    call        OpenGL32.glDepthFunc
 00481251    push        1102
 00481256    push        0C50
 0048125B    call        OpenGL32.glHint
 00481260    mov         eax,dword ptr [ebp-4]
 00481263    mov         al,byte ptr [eax+121]
 00481269    sub         al,2
>0048126B    jb          00481271
>0048126D    je          0048127D
>0048126F    jmp         00481289
 00481271    push        1D01
 00481276    call        OpenGL32.glShadeModel
>0048127B    jmp         0048129D
 0048127D    push        1D00
 00481282    call        OpenGL32.glShadeModel
>00481287    jmp         0048129D
 00481289    mov         ecx,1A93
 0048128E    mov         edx,4812AC;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 00481293    mov         eax,4812E4;'Assertion failure'
 00481298    call        @Assert
 0048129D    pop         ecx
 0048129E    pop         ecx
 0048129F    pop         ebp
 004812A0    ret
end;*}

//004812F8
{*procedure sub_004812F8(?:TGLSceneBuffer; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004812F8    push        ebp
 004812F9    mov         ebp,esp
 004812FB    add         esp,0FFFFFFF0
 004812FE    push        ebx
 004812FF    push        esi
 00481300    push        edi
 00481301    mov         dword ptr [ebp-8],ecx
 00481304    mov         edi,edx
 00481306    mov         dword ptr [ebp-4],eax
 00481309    mov         esi,dword ptr [ebp+0C]
 0048130C    mov         eax,dword ptr [ebp-4]
 0048130F    mov         eax,dword ptr [eax+20]
 00481312    test        eax,eax
>00481314    je          004814D6
 0048131A    call        0046CC00
 0048131F    xor         edx,edx
 00481321    push        ebp
 00481322    push        4814CF
 00481327    push        dword ptr fs:[edx]
 0048132A    mov         dword ptr fs:[edx],esp
 0048132D    test        esi,esi
>0048132F    jg          00481340
 00481331    mov         eax,dword ptr [edi+24]
 00481334    mov         eax,dword ptr [eax]
 00481336    call        dword ptr [eax+24]
 00481339    mov         esi,eax
 0048133B    mov         dword ptr [ebp-0C],esi
>0048133E    jmp         0048135C
 00481340    cmp         esi,8515
>00481346    jl          00481359
 00481348    cmp         esi,851B
>0048134E    jge         00481359
 00481350    mov         dword ptr [ebp-0C],8513
>00481357    jmp         0048135C
 00481359    mov         dword ptr [ebp-0C],esi
 0048135C    mov         eax,edi
 0048135E    call        004754DC
 00481363    mov         ebx,eax
 00481365    xor         bl,1
 00481368    test        bl,bl
>0048136A    je          00481375
 0048136C    mov         eax,edi
 0048136E    call        0047540C
>00481373    jmp         0048137C
 00481375    mov         eax,edi
 00481377    mov         edx,dword ptr [eax]
 00481379    call        dword ptr [edx+14]
 0048137C    or          bl,byte ptr [ebp+8]
 0048137F    push        eax
 00481380    mov         eax,dword ptr [ebp-4]
 00481383    mov         eax,dword ptr [eax+18]
 00481386    mov         ecx,dword ptr [ebp-0C]
 00481389    xor         edx,edx
 0048138B    call        0046D8B8
 00481390    test        bl,bl
>00481392    je          00481491
 00481398    mov         eax,dword ptr [ebp+1C]
 0048139B    imul        dword ptr [ebp+18]
 0048139E    shl         eax,2
 004813A1    call        @GetMem
 004813A6    mov         dword ptr [ebp-10],eax
 004813A9    xor         eax,eax
 004813AB    push        ebp
 004813AC    push        48148A
 004813B1    push        dword ptr fs:[eax]
 004813B4    mov         dword ptr fs:[eax],esp
 004813B7    mov         eax,dword ptr [ebp-10]
 004813BA    push        eax
 004813BB    push        1401
 004813C0    push        1908
 004813C5    mov         eax,dword ptr [ebp+18]
 004813C8    push        eax
 004813C9    mov         eax,dword ptr [ebp+1C]
 004813CC    push        eax
 004813CD    push        0
 004813CF    push        0
 004813D1    call        OpenGL32.glReadPixels
 004813D6    mov         al,byte ptr [edi+1F]
 004813D9    sub         al,2
>004813DB    jae         00481407
 004813DD    mov         eax,dword ptr [ebp-10]
 004813E0    push        eax
 004813E1    push        1401
 004813E6    push        1908
 004813EB    push        0
 004813ED    mov         eax,dword ptr [ebp+18]
 004813F0    push        eax
 004813F1    mov         eax,dword ptr [ebp+1C]
 004813F4    push        eax
 004813F5    mov         eax,edi
 004813F7    call        004755F4
 004813FC    push        eax
 004813FD    push        0
 004813FF    push        esi
 00481400    call        OpenGL32.glTexImage2D
>00481405    jmp         00481474
 00481407    mov         eax,[005AE7C8];^gvar_005E0D28
 0048140C    cmp         byte ptr [eax],0
>0048140F    je          00481450
 00481411    cmp         esi,0DE1
>00481417    jne         00481450
 00481419    push        1
 0048141B    push        8191
 00481420    push        esi
 00481421    call        OpenGL32.glTexParameteri
 00481426    mov         eax,dword ptr [ebp-10]
 00481429    push        eax
 0048142A    push        1401
 0048142F    push        1908
 00481434    push        0
 00481436    mov         eax,dword ptr [ebp+18]
 00481439    push        eax
 0048143A    mov         eax,dword ptr [ebp+1C]
 0048143D    push        eax
 0048143E    mov         eax,edi
 00481440    call        004755F4
 00481445    push        eax
 00481446    push        0
 00481448    push        esi
 00481449    call        OpenGL32.glTexImage2D
>0048144E    jmp         00481474
 00481450    mov         eax,dword ptr [ebp-10]
 00481453    push        eax
 00481454    push        1401
 00481459    push        1908
 0048145E    mov         eax,dword ptr [ebp+18]
 00481461    push        eax
 00481462    mov         eax,dword ptr [ebp+1C]
 00481465    push        eax
 00481466    mov         eax,edi
 00481468    call        004755F4
 0048146D    push        eax
 0048146E    push        esi
 0048146F    call        GLU32.gluBuild2DMipmaps
 00481474    xor         eax,eax
 00481476    pop         edx
 00481477    pop         ecx
 00481478    pop         ecx
 00481479    mov         dword ptr fs:[eax],edx
 0048147C    push        4814B1
 00481481    mov         eax,dword ptr [ebp-10]
 00481484    call        @FreeMem
 00481489    ret
>0048148A    jmp         @HandleFinally
>0048148F    jmp         00481481
 00481491    mov         eax,dword ptr [ebp+18]
 00481494    push        eax
 00481495    mov         eax,dword ptr [ebp+1C]
 00481498    push        eax
 00481499    mov         eax,dword ptr [ebp+20]
 0048149C    push        eax
 0048149D    mov         eax,dword ptr [ebp-8]
 004814A0    push        eax
 004814A1    mov         eax,dword ptr [ebp+10]
 004814A4    push        eax
 004814A5    mov         eax,dword ptr [ebp+14]
 004814A8    push        eax
 004814A9    push        0
 004814AB    push        esi
 004814AC    call        OpenGL32.glCopyTexSubImage2D
 004814B1    call        0046C3B8
 004814B6    xor         eax,eax
 004814B8    pop         edx
 004814B9    pop         ecx
 004814BA    pop         ecx
 004814BB    mov         dword ptr fs:[eax],edx
 004814BE    push        4814D6
 004814C3    mov         eax,dword ptr [ebp-4]
 004814C6    mov         eax,dword ptr [eax+20]
 004814C9    call        0046CD1C
 004814CE    ret
>004814CF    jmp         @HandleFinally
>004814D4    jmp         004814C3
 004814D6    pop         edi
 004814D7    pop         esi
 004814D8    pop         ebx
 004814D9    mov         esp,ebp
 004814DB    pop         ebp
 004814DC    ret         1C
end;*}

//004814E0
{*procedure sub_004814E0(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004814E0    push        ebp
 004814E1    mov         ebp,esp
 004814E3    push        ebx
 004814E4    lea         ebx,[eax+0FC]
 004814EA    mov         dword ptr [ebx],edx
 004814EC    mov         dword ptr [ebx+4],ecx
 004814EF    mov         edx,dword ptr [ebp+0C]
 004814F2    mov         dword ptr [ebx+8],edx
 004814F5    mov         edx,dword ptr [ebp+8]
 004814F8    mov         dword ptr [ebx+0C],edx
 004814FB    mov         edx,eax
 004814FD    mov         ecx,dword ptr [eax]
 004814FF    call        dword ptr [ecx+10]
 00481502    pop         ebx
 00481503    pop         ebp
 00481504    ret         8
end;*}

//00481508
procedure sub_00481508(?:TGLSceneBuffer);
begin
{*
 00481508    push        ebx
 00481509    mov         ebx,eax
 0048150B    cmp         byte ptr [ebx+138],0;TGLSceneBuffer.?f138:byte
>00481512    je          0048152E
 00481514    mov         eax,dword ptr [ebx+134];TGLSceneBuffer.?f134:dword
 0048151A    call        @FreeMem
 0048151F    xor         eax,eax
 00481521    mov         dword ptr [ebx+134],eax;TGLSceneBuffer.?f134:dword
 00481527    mov         byte ptr [ebx+138],0;TGLSceneBuffer.?f138:byte
 0048152E    pop         ebx
 0048152F    ret
*}
end;

//00481530
procedure sub_00481530(?:TGLSceneBuffer);
begin
{*
 00481530    xor         edx,edx
 00481532    mov         dword ptr [eax+150],edx;TGLSceneBuffer.?f150:dword
 00481538    xor         edx,edx
 0048153A    mov         dword ptr [eax+14C],edx;TGLSceneBuffer.?f14C:dword
 00481540    mov         dword ptr [eax+158],0;TGLSceneBuffer.?f158:dword
 0048154A    mov         dword ptr [eax+15C],0;TGLSceneBuffer.?f15C:dword
 00481554    ret
*}
end;

//00481558
{*procedure sub_00481558(?:?; ?:?);
begin
 00481558    push        ebx
 00481559    push        esi
 0048155A    push        edi
 0048155B    mov         edi,edx
 0048155D    mov         ebx,eax
 0048155F    mov         eax,dword ptr [ebx+0A8]
 00481565    call        @DynArrayLength
 0048156A    mov         esi,eax
 0048156C    lea         eax,[esi+1]
 0048156F    push        eax
 00481570    lea         eax,[ebx+0A8]
 00481576    mov         ecx,1
 0048157B    mov         edx,dword ptr ds:[47AB40];.72
 00481581    call        @DynArraySetLength
 00481586    add         esp,4
 00481589    mov         eax,esi
 0048158B    shl         eax,3
 0048158E    mov         edx,dword ptr [ebx+0A8]
 00481594    push        edi
 00481595    lea         edi,[edx+eax*8]
 00481598    lea         esi,[ebx+68]
 0048159B    mov         ecx,10
 004815A0    rep movs    dword ptr [edi],dword ptr [esi]
 004815A2    pop         edi
 004815A3    mov         esi,edi
 004815A5    lea         edi,[ebx+68]
 004815A8    mov         ecx,10
 004815AD    rep movs    dword ptr [edi],dword ptr [esi]
 004815AF    pop         edi
 004815B0    pop         esi
 004815B1    pop         ebx
 004815B2    ret
end;*}

//004815B4
{*procedure sub_004815B4(?:?);
begin
 004815B4    push        ebx
 004815B5    push        esi
 004815B6    push        edi
 004815B7    mov         ebx,eax
 004815B9    mov         eax,dword ptr [ebx+0A8]
 004815BF    call        @DynArrayHigh
 004815C4    mov         esi,eax
 004815C6    test        esi,esi
>004815C8    jge         004815DE
 004815CA    mov         ecx,1C27
 004815CF    mov         edx,481620;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 004815D4    mov         eax,481658;'Unbalanced PopModelViewMatrix'
 004815D9    call        @Assert
 004815DE    mov         eax,esi
 004815E0    shl         eax,3
 004815E3    mov         edx,dword ptr [ebx+0A8]
 004815E9    push        esi
 004815EA    lea         esi,[edx+eax*8]
 004815ED    lea         edi,[ebx+68]
 004815F0    mov         ecx,10
 004815F5    rep movs    dword ptr [edi],dword ptr [esi]
 004815F7    pop         esi
 004815F8    push        esi
 004815F9    lea         eax,[ebx+0A8]
 004815FF    mov         ecx,1
 00481604    mov         edx,dword ptr ds:[47AB40];.72
 0048160A    call        @DynArraySetLength
 0048160F    add         esp,4
 00481612    pop         edi
 00481613    pop         esi
 00481614    pop         ebx
 00481615    ret
end;*}

//00481678
{*procedure sub_00481678(?:?);
begin
 00481678    push        ebx
 00481679    push        esi
 0048167A    mov         esi,eax
 0048167C    mov         ebx,100
 00481681    mov         ax,[004816B8];0xC0 gvar_004816B8
 00481687    and         ax,word ptr [esi+11F]
 0048168E    mov         dx,word ptr ds:[4816BC];0x0 gvar_004816BC
 00481695    cmp         dx,ax
>00481698    jne         004816A0
 0048169A    or          ebx,4000
 004816A0    test        byte ptr [esi+11F],2
>004816A7    je          004816AF
 004816A9    or          ebx,400
 004816AF    push        ebx
 004816B0    call        OpenGL32.glClear
 004816B5    pop         esi
 004816B6    pop         ebx
 004816B7    ret
end;*}

//004816C0
procedure sub_004816C0;
begin
{*
 004816C0    call        00481E6C
 004816C5    ret
*}
end;

//004816C8
{*procedure sub_004816C8(?:?; ?:?; ?:?; ?:?);
begin
 004816C8    push        ebp
 004816C9    mov         ebp,esp
 004816CB    add         esp,0FFFFFFD8
 004816CE    push        ebx
 004816CF    push        esi
 004816D0    push        edi
 004816D1    mov         dword ptr [ebp-8],ecx
 004816D4    mov         dword ptr [ebp-4],edx
 004816D7    mov         ebx,eax
 004816D9    mov         esi,dword ptr [ebp+8]
 004816DC    push        1701
 004816E1    call        OpenGL32.glMatrixMode
 004816E6    call        OpenGL32.glLoadIdentity
 004816EB    test        esi,esi
>004816ED    je          00481766
 004816EF    lea         eax,[ebx+0FC]
 004816F5    push        eax
 004816F6    mov         eax,dword ptr [esi+0C]
 004816F9    sub         eax,dword ptr [esi+4]
 004816FC    cdq
 004816FD    xor         eax,edx
 004816FF    sub         eax,edx
 00481701    mov         dword ptr [ebp-0C],eax
 00481704    fild        dword ptr [ebp-0C]
 00481707    add         esp,0FFFFFFF8
 0048170A    fstp        qword ptr [esp]
 0048170D    wait
 0048170E    mov         ecx,dword ptr [esi+8]
 00481711    mov         eax,ecx
 00481713    mov         edi,dword ptr [esi]
 00481715    sub         eax,edi
 00481717    cdq
 00481718    xor         eax,edx
 0048171A    sub         eax,edx
 0048171C    mov         dword ptr [ebp-10],eax
 0048171F    fild        dword ptr [ebp-10]
 00481722    add         esp,0FFFFFFF8
 00481725    fstp        qword ptr [esp]
 00481728    wait
 00481729    mov         eax,dword ptr [esi+4]
 0048172C    add         eax,dword ptr [esi+0C]
 0048172F    sar         eax,1
>00481731    jns         00481736
 00481733    adc         eax,0
 00481736    mov         edx,dword ptr [ebx+108]
 0048173C    sub         edx,eax
 0048173E    mov         dword ptr [ebp-14],edx
 00481741    fild        dword ptr [ebp-14]
 00481744    add         esp,0FFFFFFF8
 00481747    fstp        qword ptr [esp]
 0048174A    wait
 0048174B    add         edi,ecx
 0048174D    sar         edi,1
>0048174F    jns         00481754
 00481751    adc         edi,0
 00481754    mov         dword ptr [ebp-18],edi
 00481757    fild        dword ptr [ebp-18]
 0048175A    add         esp,0FFFFFFF8
 0048175D    fstp        qword ptr [esp]
 00481760    wait
 00481761    call        GLU32.gluPickMatrix
 00481766    lea         eax,[ebx+0AC]
 0048176C    push        eax
 0048176D    push        0BA7
 00481772    call        OpenGL32.glGetFloatv
 00481777    mov         eax,dword ptr [ebx+130]
 0048177D    test        eax,eax
>0048177F    je          004817A8
 00481781    mov         edx,dword ptr [ebx+108]
 00481787    push        edx
 00481788    mov         edx,dword ptr [ebp-8]
 0048178B    push        edx
 0048178C    mov         edx,dword ptr [ebp-4]
 0048178F    mov         ecx,dword ptr [ebx+104]
 00481795    call        0047E828
 0048179A    lea         eax,[ebx+28]
 0048179D    push        eax
 0048179E    push        0BA7
 004817A3    call        OpenGL32.glGetFloatv
 004817A8    push        1700
 004817AD    call        OpenGL32.glMatrixMode
 004817B2    call        OpenGL32.glLoadIdentity
 004817B7    mov         eax,dword ptr [ebx+130]
 004817BD    test        eax,eax
>004817BF    je          004817E7
 004817C1    mov         edx,dword ptr [eax+5C]
 004817C4    mov         dword ptr [edx+48],eax
 004817C7    call        0047E684
 004817CC    lea         edx,[ebp-28]
 004817CF    mov         eax,dword ptr [ebx+130]
 004817D5    call        0047BD64
 004817DA    lea         esi,[ebp-28]
 004817DD    lea         edi,[ebx+0EC]
 004817E3    movs        dword ptr [edi],dword ptr [esi]
 004817E4    movs        dword ptr [edi],dword ptr [esi]
 004817E5    movs        dword ptr [edi],dword ptr [esi]
 004817E6    movs        dword ptr [edi],dword ptr [esi]
 004817E7    lea         eax,[ebx+68]
 004817EA    push        eax
 004817EB    push        0BA6
 004817F0    call        OpenGL32.glGetFloatv
 004817F5    pop         edi
 004817F6    pop         esi
 004817F7    pop         ebx
 004817F8    mov         esp,ebp
 004817FA    pop         ebp
 004817FB    ret         4
end;*}

//00481800
{*procedure sub_00481800(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00481800    push        ebp
 00481801    mov         ebp,esp
 00481803    add         esp,0FFFFFFF8
 00481806    push        ebx
 00481807    push        esi
 00481808    push        edi
 00481809    mov         dword ptr [ebp-4],ecx
 0048180C    mov         esi,edx
 0048180E    mov         ebx,eax
 00481810    push        0
 00481812    mov         edx,esi
 00481814    mov         ecx,dword ptr [ebp-4]
 00481817    mov         eax,ebx
 00481819    call        004816C8
 0048181E    call        0046A3C0
 00481823    call        0046A47C
 00481828    cmp         word ptr [ebx+18A],0
>00481830    je          00481840
 00481832    mov         edx,ebx
 00481834    mov         eax,dword ptr [ebx+18C]
 0048183A    call        dword ptr [ebx+188]
 00481840    cmp         word ptr [ebx+182],0
>00481848    je          00481872
 0048184A    mov         edi,dword ptr [ebx+4]
 0048184D    mov         eax,edi
 0048184F    mov         edx,dword ptr ds:[418C6C];TComponent
 00481855    call        @IsClass
 0048185A    test        al,al
>0048185C    je          00481872
 0048185E    test        byte ptr [edi+1C],10
>00481862    jne         00481872
 00481864    mov         edx,ebx
 00481866    mov         eax,dword ptr [ebx+184]
 0048186C    call        dword ptr [ebx+180]
 00481872    mov         eax,dword ptr [ebx+130]
 00481878    test        eax,eax
>0048187A    je          004818DF
 0048187C    cmp         dword ptr [eax+5C],0
>00481880    je          004818DF
 00481882    mov         edi,dword ptr [eax+5C]
 00481885    lea         eax,[ebp-8]
 00481888    push        eax
 00481889    push        0D31
 0048188E    call        OpenGL32.glGetIntegerv
 00481893    mov         edx,dword ptr [ebp-8]
 00481896    mov         eax,edi
 00481898    call        0048063C
 0048189D    cmp         byte ptr [ebx+10D],0
>004818A4    je          004818BD
 004818A6    push        0B60
 004818AB    call        OpenGL32.glEnable
 004818B0    mov         eax,dword ptr [ebx+128]
 004818B6    call        00480A58
>004818BB    jmp         004818C7
 004818BD    push        0B60
 004818C2    call        OpenGL32.glDisable
 004818C7    mov         eax,dword ptr [esi+0C]
 004818CA    push        eax
 004818CB    mov         al,byte ptr [ebp+0C]
 004818CE    push        eax
 004818CF    mov         eax,dword ptr [ebp+8]
 004818D2    push        eax
 004818D3    mov         ecx,dword ptr [esi+8]
 004818D6    mov         edx,ebx
 004818D8    mov         eax,edi
 004818DA    call        00480174
 004818DF    cmp         word ptr [ebx+192],0
>004818E7    je          00481911
 004818E9    mov         esi,dword ptr [ebx+4]
 004818EC    mov         eax,esi
 004818EE    mov         edx,dword ptr ds:[418C6C];TComponent
 004818F4    call        @IsClass
 004818F9    test        al,al
>004818FB    je          00481911
 004818FD    test        byte ptr [esi+1C],10
>00481901    jne         00481911
 00481903    mov         edx,ebx
 00481905    mov         eax,dword ptr [ebx+194]
 0048190B    call        dword ptr [ebx+190]
 00481911    mov         eax,dword ptr [ebx+0A8]
 00481917    call        @DynArrayLength
 0048191C    test        eax,eax
>0048191E    je          00481934
 00481920    mov         ecx,1E17
 00481925    mov         edx,481948;'C:\GLScene\glscene_v_1000714\Source\GLScene.pas'
 0048192A    mov         eax,481980;'Unbalance Push/PopModelViewMatrix.'
 0048192F    call        @Assert
 00481934    pop         edi
 00481935    pop         esi
 00481936    pop         ebx
 00481937    pop         ecx
 00481938    pop         ecx
 00481939    pop         ebp
 0048193A    ret         8
end;*}

//004819A4
procedure sub_004819A4;
begin
{*
 004819A4    xor         edx,edx
 004819A6    call        004819AC
 004819AB    ret
*}
end;

//004819AC
{*procedure sub_004819AC(?:TGLSceneBuffer; ?:?);
begin
 004819AC    push        ebp
 004819AD    mov         ebp,esp
 004819AF    add         esp,0FFFFFFD0
 004819B2    push        ebx
 004819B3    mov         ebx,edx
 004819B5    mov         dword ptr [ebp-4],eax
 004819B8    mov         eax,dword ptr [ebp-4]
 004819BB    cmp         byte ptr [eax+1C],0
>004819BF    jne         00481CCC
 004819C5    mov         eax,dword ptr [ebp-4]
 004819C8    cmp         dword ptr [eax+20],0
>004819CC    je          00481CCC
 004819D2    mov         eax,dword ptr [ebp-4]
 004819D5    push        dword ptr [eax+114]
 004819DB    lea         edx,[ebp-28]
 004819DE    mov         eax,dword ptr [ebp-4]
 004819E1    mov         eax,dword ptr [eax+110]
 004819E7    call        00478438
 004819EC    mov         eax,dword ptr [ebp-4]
 004819EF    cmp         byte ptr [eax+138],0
>004819F6    je          00481ACF
 004819FC    mov         eax,dword ptr [ebp-4]
 004819FF    cmp         dword ptr [eax+134],0
>00481A06    je          00481ACF
 00481A0C    mov         eax,dword ptr [ebp-4]
 00481A0F    mov         eax,dword ptr [eax+20]
 00481A12    call        0046CC00
 00481A17    xor         eax,eax
 00481A19    push        ebp
 00481A1A    push        481AC8
 00481A1F    push        dword ptr fs:[eax]
 00481A22    mov         dword ptr fs:[eax],esp
 00481A25    push        dword ptr [ebp-1C]
 00481A28    push        dword ptr [ebp-20]
 00481A2B    push        dword ptr [ebp-24]
 00481A2E    push        dword ptr [ebp-28]
 00481A31    call        OpenGL32.glClearColor
 00481A36    mov         eax,dword ptr [ebp-4]
 00481A39    call        00481678
 00481A3E    push        1701
 00481A43    call        OpenGL32.glMatrixMode
 00481A48    call        OpenGL32.glLoadIdentity
 00481A4D    push        1700
 00481A52    call        OpenGL32.glMatrixMode
 00481A57    call        OpenGL32.glLoadIdentity
 00481A5C    push        0BF800000
 00481A61    push        0BF800000
 00481A66    call        OpenGL32.glRasterPos2f
 00481A6B    mov         eax,dword ptr [ebp-4]
 00481A6E    mov         eax,dword ptr [eax+134]
 00481A74    push        eax
 00481A75    push        1401
 00481A7A    push        1908
 00481A7F    mov         eax,dword ptr [ebp-4]
 00481A82    mov         eax,dword ptr [eax+148]
 00481A88    push        eax
 00481A89    mov         eax,dword ptr [ebp-4]
 00481A8C    mov         eax,dword ptr [eax+144]
 00481A92    push        eax
 00481A93    call        OpenGL32.glDrawPixels
 00481A98    mov         eax,dword ptr [ebp-4]
 00481A9B    test        byte ptr [eax+120],1
>00481AA2    jne         00481AAF
 00481AA4    mov         eax,dword ptr [ebp-4]
 00481AA7    mov         eax,dword ptr [eax+20]
 00481AAA    mov         edx,dword ptr [eax]
 00481AAC    call        dword ptr [edx+10]
 00481AAF    xor         eax,eax
 00481AB1    pop         edx
 00481AB2    pop         ecx
 00481AB3    pop         ecx
 00481AB4    mov         dword ptr fs:[eax],edx
 00481AB7    push        481CCC
 00481ABC    mov         eax,dword ptr [ebp-4]
 00481ABF    mov         eax,dword ptr [eax+20]
 00481AC2    call        0046CD1C
 00481AC7    ret
>00481AC8    jmp         @HandleFinally
>00481ACD    jmp         00481ABC
 00481ACF    lea         eax,[ebp-18]
 00481AD2    call        0046F87C
 00481AD7    mov         eax,dword ptr [ebp-4]
 00481ADA    mov         eax,dword ptr [eax+130]
 00481AE0    test        eax,eax
>00481AE2    je          00481B03
 00481AE4    cmp         dword ptr [eax+5C],0
>00481AE8    je          00481B03
 00481AEA    call        0047BBE0
 00481AEF    mov         eax,dword ptr [ebp-4]
 00481AF2    mov         eax,dword ptr [eax+130]
 00481AF8    mov         eax,dword ptr [eax+5C]
 00481AFB    mov         edx,dword ptr [ebp-4]
 00481AFE    call        0047FEF4
 00481B03    mov         eax,dword ptr [ebp-4]
 00481B06    mov         byte ptr [eax+1C],1
 00481B0A    xor         eax,eax
 00481B0C    push        ebp
 00481B0D    push        481CC5
 00481B12    push        dword ptr fs:[eax]
 00481B15    mov         dword ptr fs:[eax],esp
 00481B18    mov         eax,dword ptr [ebp-4]
 00481B1B    mov         eax,dword ptr [eax+20]
 00481B1E    call        0046CC00
 00481B23    xor         eax,eax
 00481B25    push        ebp
 00481B26    push        481C69
 00481B2B    push        dword ptr fs:[eax]
 00481B2E    mov         dword ptr fs:[eax],esp
 00481B31    mov         eax,dword ptr [ebp-4]
 00481B34    cmp         dword ptr [eax+14C],0
>00481B3B    jne         00481B4A
 00481B3D    mov         eax,dword ptr [ebp-4]
 00481B40    add         eax,158
 00481B45    call        0046F87C
 00481B4A    mov         eax,dword ptr [ebp-4]
 00481B4D    mov         dword ptr [eax+124],60
 00481B57    call        0046C3B8
 00481B5C    mov         eax,dword ptr [ebp-4]
 00481B5F    call        00481170
 00481B64    push        dword ptr [ebp-1C]
 00481B67    push        dword ptr [ebp-20]
 00481B6A    push        dword ptr [ebp-24]
 00481B6D    push        dword ptr [ebp-28]
 00481B70    call        OpenGL32.glClearColor
 00481B75    mov         eax,dword ptr [ebp-4]
 00481B78    call        00481678
 00481B7D    call        0046C304
 00481B82    push        0
 00481B84    push        ebx
 00481B85    mov         eax,dword ptr [ebp-4]
 00481B88    mov         ecx,dword ptr [eax+124]
 00481B8E    mov         eax,dword ptr [ebp-4]
 00481B91    lea         edx,[eax+0FC]
 00481B97    mov         eax,dword ptr [ebp-4]
 00481B9A    call        00481800
 00481B9F    call        0046C304
 00481BA4    mov         eax,dword ptr [ebp-4]
 00481BA7    test        byte ptr [eax+120],1
>00481BAE    jne         00481BBB
 00481BB0    mov         eax,dword ptr [ebp-4]
 00481BB3    mov         eax,dword ptr [eax+20]
 00481BB6    mov         edx,dword ptr [eax]
 00481BB8    call        dword ptr [edx+10]
 00481BBB    mov         eax,dword ptr [ebp-4]
 00481BBE    inc         dword ptr [eax+14C]
 00481BC4    lea         eax,[ebp-10]
 00481BC7    call        0046F87C
 00481BCC    mov         eax,dword ptr [ebp-10]
 00481BCF    mov         edx,dword ptr [ebp-0C]
 00481BD2    sub         eax,dword ptr [ebp-18]
 00481BD5    sbb         edx,dword ptr [ebp-14]
 00481BD8    mov         dword ptr [ebp-30],eax
 00481BDB    mov         dword ptr [ebp-2C],edx
 00481BDE    fild        qword ptr [ebp-30]
 00481BE1    fild        qword ptr ds:[5E14FC];gvar_005E14FC:Double
 00481BE7    fdivp       st(1),st
 00481BE9    mov         eax,dword ptr [ebp-4]
 00481BEC    fstp        dword ptr [eax+160]
 00481BF2    wait
 00481BF3    mov         eax,dword ptr [ebp-4]
 00481BF6    mov         edx,dword ptr [eax+15C]
 00481BFC    mov         eax,dword ptr [eax+158]
 00481C02    sub         dword ptr [ebp-10],eax
 00481C05    sbb         dword ptr [ebp-0C],edx
 00481C08    cmp         dword ptr [ebp-0C],0
>00481C0C    jne         00481C16
 00481C0E    cmp         dword ptr [ebp-10],0
>00481C12    jbe         00481C4B
>00481C14    jmp         00481C18
>00481C16    jle         00481C4B
 00481C18    push        dword ptr ds:[5E1500]
 00481C1E    push        dword ptr ds:[5E14FC];gvar_005E14FC:Double
 00481C24    mov         eax,dword ptr [ebp-4]
 00481C27    mov         eax,dword ptr [eax+14C]
 00481C2D    cdq
 00481C2E    call        @_llmul
 00481C33    mov         dword ptr [ebp-30],eax
 00481C36    mov         dword ptr [ebp-2C],edx
 00481C39    fild        qword ptr [ebp-30]
 00481C3C    fild        qword ptr [ebp-10]
 00481C3F    fdivp       st(1),st
 00481C41    mov         eax,dword ptr [ebp-4]
 00481C44    fstp        dword ptr [eax+150]
 00481C4A    wait
 00481C4B    call        0046C304
 00481C50    xor         eax,eax
 00481C52    pop         edx
 00481C53    pop         ecx
 00481C54    pop         ecx
 00481C55    mov         dword ptr fs:[eax],edx
 00481C58    push        481C70
 00481C5D    mov         eax,dword ptr [ebp-4]
 00481C60    mov         eax,dword ptr [eax+20]
 00481C63    call        0046CD1C
 00481C68    ret
>00481C69    jmp         @HandleFinally
>00481C6E    jmp         00481C5D
 00481C70    mov         eax,dword ptr [ebp-4]
 00481C73    cmp         word ptr [eax+19A],0
>00481C7B    je          00481CB0
 00481C7D    mov         eax,dword ptr [ebp-4]
 00481C80    mov         eax,dword ptr [eax+4]
 00481C83    mov         edx,dword ptr ds:[418C6C];TComponent
 00481C89    call        @IsClass
 00481C8E    test        al,al
>00481C90    je          00481CB0
 00481C92    mov         eax,dword ptr [ebp-4]
 00481C95    mov         eax,dword ptr [eax+4]
 00481C98    test        byte ptr [eax+1C],10
>00481C9C    jne         00481CB0
 00481C9E    mov         ebx,dword ptr [ebp-4]
 00481CA1    mov         edx,dword ptr [ebp-4]
 00481CA4    mov         eax,dword ptr [ebx+19C]
 00481CAA    call        dword ptr [ebx+198]
 00481CB0    xor         eax,eax
 00481CB2    pop         edx
 00481CB3    pop         ecx
 00481CB4    pop         ecx
 00481CB5    mov         dword ptr fs:[eax],edx
 00481CB8    push        481CCC
 00481CBD    mov         eax,dword ptr [ebp-4]
 00481CC0    mov         byte ptr [eax+1C],0
 00481CC4    ret
>00481CC5    jmp         @HandleFinally
>00481CCA    jmp         00481CBD
 00481CCC    pop         ebx
 00481CCD    mov         esp,ebp
 00481CCF    pop         ebp
 00481CD0    ret
end;*}

//00481CD4
procedure TGLSceneBuffer.SetBackgroundColor(Value:TColor);
begin
{*
 00481CD4    cmp         edx,dword ptr [eax+110];TGLSceneBuffer.BackgroundColor:TColor
>00481CDA    je          00481CE9
 00481CDC    mov         dword ptr [eax+110],edx;TGLSceneBuffer.BackgroundColor:TColor
 00481CE2    mov         edx,eax
 00481CE4    mov         ecx,dword ptr [eax]
 00481CE6    call        dword ptr [ecx+10];TGLSceneBuffer.sub_004816C0
 00481CE9    ret
*}
end;

//00481CEC
procedure TGLSceneBuffer.SetAmbientColor(Value:TGLColor);
begin
{*
 00481CEC    mov         eax,dword ptr [eax+118];TGLSceneBuffer.AmbientColor:TGLColor
 00481CF2    mov         ecx,dword ptr [eax]
 00481CF4    call        dword ptr [ecx+8];TGLColor.Assign
 00481CF7    ret
*}
end;

//00481CF8
procedure sub_00481CF8(?:TGLSceneBuffer; ?:TGLCamera);
begin
{*
 00481CF8    push        ebx
 00481CF9    push        esi
 00481CFA    mov         esi,edx
 00481CFC    mov         ebx,eax
 00481CFE    mov         eax,dword ptr [ebx+130]
 00481D04    cmp         esi,eax
>00481D06    je          00481D44
 00481D08    test        eax,eax
>00481D0A    je          00481D24
 00481D0C    mov         edx,dword ptr [eax+5C]
 00481D0F    test        edx,edx
>00481D11    je          00481D1C
 00481D13    mov         eax,edx
 00481D15    mov         edx,ebx
 00481D17    call        0047FF5C
 00481D1C    xor         eax,eax
 00481D1E    mov         dword ptr [ebx+130],eax
 00481D24    test        esi,esi
>00481D26    je          00481D3B
 00481D28    cmp         dword ptr [esi+5C],0
>00481D2C    je          00481D3B
 00481D2E    mov         eax,esi
 00481D30    mov         dword ptr [ebx+130],eax
 00481D36    call        0047CF48
 00481D3B    mov         edx,ebx
 00481D3D    mov         eax,ebx
 00481D3F    mov         ecx,dword ptr [eax]
 00481D41    call        dword ptr [ecx+10]
 00481D44    pop         esi
 00481D45    pop         ebx
 00481D46    ret
*}
end;

//00481D48
procedure TGLSceneBuffer.SetContextOptions(Value:TContextOptions);
begin
{*
 00481D48    push        ebx
 00481D49    push        ecx
 00481D4A    mov         word ptr [esp],dx
 00481D4E    mov         ebx,eax
 00481D50    mov         ax,word ptr [esp]
 00481D54    cmp         ax,word ptr [ebx+11F];TGLSceneBuffer.ContextOptions:TContextOptions
>00481D5B    je          00481D6F
 00481D5D    mov         ax,word ptr [esp]
 00481D61    mov         word ptr [ebx+11F],ax;TGLSceneBuffer.ContextOptions:TContextOptions
 00481D68    mov         eax,ebx
 00481D6A    call        00481E90
 00481D6F    pop         edx
 00481D70    pop         ebx
 00481D71    ret
*}
end;

//00481D74
procedure TGLSceneBuffer.SetDepthTest(Value:Boolean);
begin
{*
 00481D74    cmp         dl,byte ptr [eax+10F];TGLSceneBuffer.DepthTest:Boolean
>00481D7A    je          00481D89
 00481D7C    mov         byte ptr [eax+10F],dl;TGLSceneBuffer.DepthTest:Boolean
 00481D82    mov         edx,eax
 00481D84    mov         ecx,dword ptr [eax]
 00481D86    call        dword ptr [ecx+10];TGLSceneBuffer.sub_004816C0
 00481D89    ret
*}
end;

//00481D8C
procedure TGLSceneBuffer.SetFaceCulling(Value:Boolean);
begin
{*
 00481D8C    cmp         dl,byte ptr [eax+10C];TGLSceneBuffer.FaceCulling:Boolean
>00481D92    je          00481DA1
 00481D94    mov         byte ptr [eax+10C],dl;TGLSceneBuffer.FaceCulling:Boolean
 00481D9A    mov         edx,eax
 00481D9C    mov         ecx,dword ptr [eax]
 00481D9E    call        dword ptr [ecx+10];TGLSceneBuffer.sub_004816C0
 00481DA1    ret
*}
end;

//00481DA4
procedure TGLSceneBuffer.SetLighting(Value:Boolean);
begin
{*
 00481DA4    cmp         dl,byte ptr [eax+10E];TGLSceneBuffer.Lighting:Boolean
>00481DAA    je          00481DB9
 00481DAC    mov         byte ptr [eax+10E],dl;TGLSceneBuffer.Lighting:Boolean
 00481DB2    mov         edx,eax
 00481DB4    mov         ecx,dword ptr [eax]
 00481DB6    call        dword ptr [ecx+10];TGLSceneBuffer.sub_004816C0
 00481DB9    ret
*}
end;

//00481DBC
procedure TGLSceneBuffer.SetAntiAliasing(Value:TGLAntiAliasing);
begin
{*
 00481DBC    cmp         dl,byte ptr [eax+11C];TGLSceneBuffer.AntiAliasing:TGLAntiAliasing
>00481DC2    je          00481DCF
 00481DC4    mov         byte ptr [eax+11C],dl;TGLSceneBuffer.AntiAliasing:TGLAntiAliasing
 00481DCA    call        00481E90
 00481DCF    ret
*}
end;

//00481DD0
procedure TGLSceneBuffer.SetDepthPrecision(Value:TGLDepthPrecision);
begin
{*
 00481DD0    cmp         dl,byte ptr [eax+11D];TGLSceneBuffer.DepthPrecision:TGLDepthPrecision
>00481DD6    je          00481DE3
 00481DD8    mov         byte ptr [eax+11D],dl;TGLSceneBuffer.DepthPrecision:TGLDepthPrecision
 00481DDE    call        00481E90
 00481DE3    ret
*}
end;

//00481DE4
procedure TGLSceneBuffer.SetColorDepth(Value:TGLColorDepth);
begin
{*
 00481DE4    cmp         dl,byte ptr [eax+11E];TGLSceneBuffer.ColorDepth:TGLColorDepth
>00481DEA    je          00481DF7
 00481DEC    mov         byte ptr [eax+11E],dl;TGLSceneBuffer.ColorDepth:TGLColorDepth
 00481DF2    call        00481E90
 00481DF7    ret
*}
end;

//00481DF8
procedure TGLSceneBuffer.SetShadeModel(Value:TGLShadeModel);
begin
{*
 00481DF8    cmp         dl,byte ptr [eax+121];TGLSceneBuffer.ShadeModel:TGLShadeModel
>00481DFE    je          00481E0D
 00481E00    mov         byte ptr [eax+121],dl;TGLSceneBuffer.ShadeModel:TGLShadeModel
 00481E06    mov         edx,eax
 00481E08    mov         ecx,dword ptr [eax]
 00481E0A    call        dword ptr [ecx+10];TGLSceneBuffer.sub_004816C0
 00481E0D    ret
*}
end;

//00481E10
procedure TGLSceneBuffer.SetFogEnable(Value:Boolean);
begin
{*
 00481E10    cmp         dl,byte ptr [eax+10D];TGLSceneBuffer.FogEnable:Boolean
>00481E16    je          00481E25
 00481E18    mov         byte ptr [eax+10D],dl;TGLSceneBuffer.FogEnable:Boolean
 00481E1E    mov         edx,eax
 00481E20    mov         ecx,dword ptr [eax]
 00481E22    call        dword ptr [ecx+10];TGLSceneBuffer.sub_004816C0
 00481E25    ret
*}
end;

//00481E28
procedure TGLSceneBuffer.SetFogEnvironment(Value:TGLFogEnvironment);
begin
{*
 00481E28    push        ebx
 00481E29    mov         ebx,eax
 00481E2B    mov         eax,dword ptr [ebx+128];TGLSceneBuffer.FogEnvironment:TGLFogEnvironment
 00481E31    mov         ecx,dword ptr [eax]
 00481E33    call        dword ptr [ecx+8];TGLFogEnvironment.Assign
 00481E36    mov         edx,ebx
 00481E38    mov         eax,ebx
 00481E3A    mov         ecx,dword ptr [eax]
 00481E3C    call        dword ptr [ecx+10];TGLSceneBuffer.sub_004816C0
 00481E3F    pop         ebx
 00481E40    ret
*}
end;

//00481E44
procedure TGLSceneBuffer.IsStoredFogEnvironment(Value:TGLFogEnvironment);
begin
{*
 00481E44    push        ebx
 00481E45    mov         ebx,eax
 00481E47    mov         eax,dword ptr [ebx+128];TGLSceneBuffer.FogEnvironment:TGLFogEnvironment
 00481E4D    call        004809E8
 00481E52    xor         al,1
 00481E54    pop         ebx
 00481E55    ret
*}
end;

//00481E58
procedure TGLSceneBuffer.SetAccumBufferBits(Value:Integer);
begin
{*
 00481E58    cmp         edx,dword ptr [eax+12C];TGLSceneBuffer.AccumBufferBits:Integer
>00481E5E    je          00481E6B
 00481E60    mov         dword ptr [eax+12C],edx;TGLSceneBuffer.AccumBufferBits:Integer
 00481E66    call        00481E90
 00481E6B    ret
*}
end;

//00481E6C
{*procedure sub_00481E6C(?:?);
begin
 00481E6C    push        ebx
 00481E6D    cmp         byte ptr [eax+1C],0
>00481E71    jne         00481E8D
 00481E73    cmp         word ptr [eax+16A],0
>00481E7B    je          00481E8D
 00481E7D    mov         ebx,eax
 00481E7F    mov         edx,eax
 00481E81    mov         eax,dword ptr [ebx+16C]
 00481E87    call        dword ptr [ebx+168]
 00481E8D    pop         ebx
 00481E8E    ret
end;*}

//00481E90
procedure sub_00481E90(?:TGLSceneBuffer);
begin
{*
 00481E90    push        ebx
 00481E91    cmp         word ptr [eax+172],0;TGLSceneBuffer.?f172:word
>00481E99    je          00481EAB
 00481E9B    mov         ebx,eax
 00481E9D    mov         edx,eax
 00481E9F    mov         eax,dword ptr [ebx+174];TGLSceneBuffer.?f174:TGLNonVisualViewer
 00481EA5    call        dword ptr [ebx+170];TGLSceneBuffer.OnStructuralChange
 00481EAB    pop         ebx
 00481EAC    ret
*}
end;

//00481EB0
constructor TGLNonVisualViewer.Create(AOwner:TComponent);
begin
{*
 00481EB0    push        ebp
 00481EB1    mov         ebp,esp
 00481EB3    push        ecx
 00481EB4    push        ebx
 00481EB5    push        esi
 00481EB6    test        dl,dl
>00481EB8    je          00481EC2
 00481EBA    add         esp,0FFFFFFF0
 00481EBD    call        @ClassCreate
 00481EC2    mov         byte ptr [ebp-1],dl
 00481EC5    mov         ebx,eax
 00481EC7    xor         edx,edx
 00481EC9    mov         eax,ebx
 00481ECB    call        TComponent.Create
 00481ED0    mov         dword ptr [ebx+34],100;TGLNonVisualViewer.Width:Integer
 00481ED7    mov         dword ptr [ebx+38],100;TGLNonVisualViewer.Height:Integer
 00481EDE    mov         ecx,ebx
 00481EE0    mov         dl,1
 00481EE2    mov         eax,[0047AB64];TGLSceneBuffer
 00481EE7    call        TGLSceneBuffer.Create;TGLSceneBuffer.Create
 00481EEC    mov         esi,eax
 00481EEE    mov         dword ptr [ebx+30],esi;TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00481EF1    mov         dword ptr [esi+16C],ebx;TGLSceneBuffer.?f16C:TGLNonVisualViewer
 00481EF7    mov         eax,dword ptr [ebx]
 00481EF9    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00481EFC    mov         dword ptr [esi+168],eax;TGLSceneBuffer.OnChange:TNotifyEvent
 00481F02    mov         dword ptr [esi+174],ebx;TGLSceneBuffer.?f174:TGLNonVisualViewer
 00481F08    mov         eax,dword ptr [ebx]
 00481F0A    mov         eax,dword ptr [eax+34];TGLNonVisualViewer.Width:Integer
 00481F0D    mov         dword ptr [esi+170],eax;TGLSceneBuffer.OnStructuralChange:TNotifyEvent
 00481F13    mov         dword ptr [esi+17C],ebx;TGLSceneBuffer.?f17C:TGLNonVisualViewer
 00481F19    mov         dword ptr [esi+178],4820AC;TGLSceneBuffer.?f178:dword sub_004820AC
 00481F23    mov         eax,ebx
 00481F25    cmp         byte ptr [ebp-1],0
>00481F29    je          00481F3A
 00481F2B    call        @AfterConstruction
 00481F30    pop         dword ptr fs:[0]
 00481F37    add         esp,0C
 00481F3A    mov         eax,ebx
 00481F3C    pop         esi
 00481F3D    pop         ebx
 00481F3E    pop         ecx
 00481F3F    pop         ebp
 00481F40    ret
*}
end;

//00481F44
destructor TGLNonVisualViewer.Destroy;
begin
{*
 00481F44    push        ebx
 00481F45    push        esi
 00481F46    call        @BeforeDestruction
 00481F4B    mov         ebx,edx
 00481F4D    mov         esi,eax
 00481F4F    mov         eax,dword ptr [esi+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00481F52    call        TObject.Free
 00481F57    mov         edx,ebx
 00481F59    and         dl,0FC
 00481F5C    mov         eax,esi
 00481F5E    call        TComponent.Destroy
 00481F63    test        bl,bl
>00481F65    jle         00481F6E
 00481F67    mov         eax,esi
 00481F69    call        @ClassDestroy
 00481F6E    pop         esi
 00481F6F    pop         ebx
 00481F70    ret
*}
end;

//00481F74
procedure TGLNonVisualViewer.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00481F74    push        ebx
 00481F75    push        esi
 00481F76    push        edi
 00481F77    mov         ebx,ecx
 00481F79    mov         esi,edx
 00481F7B    mov         edi,eax
 00481F7D    cmp         bl,1
>00481F80    jne         00481F96
 00481F82    mov         eax,edi
 00481F84    call        TGLNonVisualViewer.GetCamera
 00481F89    cmp         esi,eax
>00481F8B    jne         00481F96
 00481F8D    xor         edx,edx
 00481F8F    mov         eax,edi
 00481F91    call        TGLNonVisualViewer.SetCamera
 00481F96    mov         ecx,ebx
 00481F98    mov         edx,esi
 00481F9A    mov         eax,edi
 00481F9C    call        TComponent.Notification
 00481FA1    pop         edi
 00481FA2    pop         esi
 00481FA3    pop         ebx
 00481FA4    ret
*}
end;

//00481FA8
procedure sub_00481FA8;
begin
{*
 00481FA8    push        0
 00481FAA    mov         ecx,dword ptr [eax+34];TGLNonVisualViewer.Width:Integer
 00481FAD    push        ecx
 00481FAE    mov         ecx,dword ptr [eax+38];TGLNonVisualViewer.Height:Integer
 00481FB1    push        ecx
 00481FB2    push        0
 00481FB4    push        0
 00481FB6    xor         ecx,ecx
 00481FB8    call        00481FC0
 00481FBD    ret
*}
end;

//00481FC0
{*procedure sub_00481FC0(?:TGLNonVisualViewer; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00481FC0    push        ebp
 00481FC1    mov         ebp,esp
 00481FC3    push        ebx
 00481FC4    mov         ebx,dword ptr [ebp+18]
 00481FC7    push        ebx
 00481FC8    mov         ebx,dword ptr [ebp+14]
 00481FCB    push        ebx
 00481FCC    mov         ebx,dword ptr [ebp+10]
 00481FCF    push        ebx
 00481FD0    mov         ebx,dword ptr [ebp+0C]
 00481FD3    push        ebx
 00481FD4    mov         ebx,dword ptr [ebp+8]
 00481FD7    push        ebx
 00481FD8    push        0
 00481FDA    push        0
 00481FDC    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00481FDF    call        004812F8
 00481FE4    pop         ebx
 00481FE5    pop         ebp
 00481FE6    ret         14
end;*}

//00481FEC
{*procedure TGLNonVisualViewer.SetBeforeRender(Value:TNotifyEvent; ?:?; ?:?);
begin
 00481FEC    push        ebp
 00481FED    mov         ebp,esp
 00481FEF    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00481FF2    mov         edx,dword ptr [ebp+8]
 00481FF5    mov         dword ptr [eax+180],edx;TGLSceneBuffer.BeforeRender:TNotifyEvent
 00481FFB    mov         edx,dword ptr [ebp+0C]
 00481FFE    mov         dword ptr [eax+184],edx;TGLSceneBuffer.?f184:dword
 00482004    pop         ebp
 00482005    ret         8
end;*}

//00482008
{*procedure TGLNonVisualViewer.GetBeforeRender(?:?);
begin
 00482008    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 0048200B    mov         ecx,dword ptr [eax+180];TGLSceneBuffer.BeforeRender:TNotifyEvent
 00482011    mov         dword ptr [edx],ecx
 00482013    mov         ecx,dword ptr [eax+184];TGLSceneBuffer.?f184:dword
 00482019    mov         dword ptr [edx+4],ecx
 0048201C    ret
end;*}

//00482020
{*procedure TGLNonVisualViewer.SetPostRender(Value:TNotifyEvent; ?:?; ?:?);
begin
 00482020    push        ebp
 00482021    mov         ebp,esp
 00482023    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00482026    mov         edx,dword ptr [ebp+8]
 00482029    mov         dword ptr [eax+190],edx;TGLSceneBuffer.PostRender:TNotifyEvent
 0048202F    mov         edx,dword ptr [ebp+0C]
 00482032    mov         dword ptr [eax+194],edx;TGLSceneBuffer.?f194:dword
 00482038    pop         ebp
 00482039    ret         8
end;*}

//0048203C
{*procedure TGLNonVisualViewer.GetPostRender(?:?);
begin
 0048203C    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 0048203F    mov         ecx,dword ptr [eax+190];TGLSceneBuffer.PostRender:TNotifyEvent
 00482045    mov         dword ptr [edx],ecx
 00482047    mov         ecx,dword ptr [eax+194];TGLSceneBuffer.?f194:dword
 0048204D    mov         dword ptr [edx+4],ecx
 00482050    ret
end;*}

//00482054
{*procedure TGLNonVisualViewer.SetAfterRender(Value:TNotifyEvent; ?:?; ?:?);
begin
 00482054    push        ebp
 00482055    mov         ebp,esp
 00482057    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 0048205A    mov         edx,dword ptr [ebp+8]
 0048205D    mov         dword ptr [eax+198],edx;TGLSceneBuffer.AfterRender:TNotifyEvent
 00482063    mov         edx,dword ptr [ebp+0C]
 00482066    mov         dword ptr [eax+19C],edx;TGLSceneBuffer.?f19C:dword
 0048206C    pop         ebp
 0048206D    ret         8
end;*}

//00482070
{*procedure TGLNonVisualViewer.GetAfterRender(?:?);
begin
 00482070    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00482073    mov         ecx,dword ptr [eax+198];TGLSceneBuffer.AfterRender:TNotifyEvent
 00482079    mov         dword ptr [edx],ecx
 0048207B    mov         ecx,dword ptr [eax+19C];TGLSceneBuffer.?f19C:dword
 00482081    mov         dword ptr [edx+4],ecx
 00482084    ret
end;*}

//00482088
procedure TGLNonVisualViewer.SetCamera(Value:TGLCamera);
begin
{*
 00482088    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 0048208B    call        00481CF8
 00482090    ret
*}
end;

//00482094
{*function TGLNonVisualViewer.GetCamera:?;
begin
 00482094    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 00482097    mov         eax,dword ptr [eax+130];TGLSceneBuffer.?f130:dword
 0048209D    ret
end;*}

//004820A0
procedure TGLNonVisualViewer.SetBuffer(Value:TGLSceneBuffer);
begin
{*
 004820A0    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 004820A3    mov         ecx,dword ptr [eax]
 004820A5    call        dword ptr [ecx+8];TPersistent.Assign
 004820A8    ret
*}
end;

//004820AC
procedure sub_004820AC;
begin
{*
 004820AC    push        esi
 004820AD    mov         si,0FFEF
 004820B1    call        @CallDynaInst
 004820B6    pop         esi
 004820B7    ret
*}
end;

//004820B8
procedure TGLNonVisualViewer.sub_004820B8;
begin
{*
 004820B8    ret
*}
end;

//004820BC
procedure sub_004820BC;
begin
{*
 004820BC    ret
*}
end;

//004820C0
procedure sub_004820C0;
begin
{*
 004820C0    mov         eax,dword ptr [eax+30];TGLNonVisualViewer.Buffer:TGLSceneBuffer
 004820C3    call        00481070
 004820C8    ret
*}
end;

//004820CC
procedure TGLNonVisualViewer.SetWidth(Value:Integer);
begin
{*
 004820CC    cmp         edx,dword ptr [eax+34];TGLNonVisualViewer.Width:Integer
>004820CF    je          004820E7
 004820D1    mov         ecx,edx
 004820D3    mov         dword ptr [eax+34],ecx;TGLNonVisualViewer.Width:Integer
 004820D6    dec         ecx
>004820D7    jge         004820E0
 004820D9    mov         dword ptr [eax+34],1;TGLNonVisualViewer.Width:Integer
 004820E0    mov         edx,eax
 004820E2    mov         ecx,dword ptr [eax]
 004820E4    call        dword ptr [ecx+34];TGLNonVisualViewer.sub_004820C0
 004820E7    ret
*}
end;

//004820E8
procedure TGLNonVisualViewer.SetHeight(Value:Integer);
begin
{*
 004820E8    cmp         edx,dword ptr [eax+38];TGLNonVisualViewer.Height:Integer
>004820EB    je          00482103
 004820ED    mov         ecx,edx
 004820EF    mov         dword ptr [eax+38],ecx;TGLNonVisualViewer.Height:Integer
 004820F2    dec         ecx
>004820F3    jge         004820FC
 004820F5    mov         dword ptr [eax+38],1;TGLNonVisualViewer.Height:Integer
 004820FC    mov         edx,eax
 004820FE    mov         ecx,dword ptr [eax]
 00482100    call        dword ptr [ecx+34];TGLNonVisualViewer.sub_004820C0
 00482103    ret
*}
end;

//00482104
constructor TGLMemoryViewer.Create(AOwner:TComponent);
begin
{*
 00482104    push        ebx
 00482105    push        esi
 00482106    test        dl,dl
>00482108    je          00482112
 0048210A    add         esp,0FFFFFFF0
 0048210D    call        @ClassCreate
 00482112    mov         ebx,edx
 00482114    mov         esi,eax
 00482116    xor         edx,edx
 00482118    mov         eax,esi
 0048211A    call        TGLNonVisualViewer.Create
 0048211F    mov         edx,100
 00482124    mov         eax,esi
 00482126    call        TGLNonVisualViewer.SetWidth
 0048212B    mov         edx,100
 00482130    mov         eax,esi
 00482132    call        TGLNonVisualViewer.SetHeight
 00482137    mov         eax,esi
 00482139    test        bl,bl
>0048213B    je          0048214C
 0048213D    call        @AfterConstruction
 00482142    pop         dword ptr fs:[0]
 00482149    add         esp,0C
 0048214C    mov         eax,esi
 0048214E    pop         esi
 0048214F    pop         ebx
 00482150    ret
*}
end;

//00482154
procedure sub_00482154(?:TGLMemoryViewer);
begin
{*
 00482154    push        ebx
 00482155    mov         ebx,eax
 00482157    mov         eax,dword ptr [ebx+30]
 0048215A    cmp         dword ptr [eax+20],0
>0048215E    jne         0048217D
 00482160    mov         edx,dword ptr [ebx+34]
 00482163    push        edx
 00482164    mov         edx,dword ptr [ebx+38]
 00482167    push        edx
 00482168    xor         ecx,ecx
 0048216A    xor         edx,edx
 0048216C    call        004814E0
 00482171    mov         cl,1
 00482173    xor         edx,edx
 00482175    mov         eax,dword ptr [ebx+30]
 00482178    call        00480E78
 0048217D    pop         ebx
 0048217E    ret
*}
end;

//00482180
{*procedure sub_00482180(?:?);
begin
 00482180    push        ebx
 00482181    push        esi
 00482182    mov         esi,edx
 00482184    mov         ebx,eax
 00482186    mov         eax,ebx
 00482188    call        00482154
 0048218D    mov         edx,esi
 0048218F    mov         eax,dword ptr [ebx+30];TGLMemoryViewer.Buffer:TGLSceneBuffer
 00482192    call        004819AC
 00482197    pop         esi
 00482198    pop         ebx
 00482199    ret
end;*}

Initialization
//004821CC
{*
 004821CC    push        ebp
 004821CD    mov         ebp,esp
 004821CF    add         esp,0FFFFFFE4
 004821D2    sub         dword ptr ds:[5E14F8],1
>004821D9    jae         0048222A
 004821DB    mov         eax,[0047A0C4];TGLLightSource
 004821E0    mov         dword ptr [ebp-1C],eax
 004821E3    mov         eax,[0047A4A4];TGLCamera
 004821E8    mov         dword ptr [ebp-18],eax
 004821EB    mov         eax,[00479D94];TGLProxyObject
 004821F0    mov         dword ptr [ebp-14],eax
 004821F3    mov         eax,[0047A72C];TGLScene
 004821F8    mov         dword ptr [ebp-10],eax
 004821FB    mov         eax,[00479ADC];TGLDirectOpenGL
 00482200    mov         dword ptr [ebp-0C],eax
 00482203    mov         eax,[00479C84];TGLRenderPoint
 00482208    mov         dword ptr [ebp-8],eax
 0048220B    mov         eax,[0047B0EC];TGLMemoryViewer
 00482210    mov         dword ptr [ebp-4],eax
 00482213    lea         eax,[ebp-1C]
 00482216    mov         edx,6
 0048221B    call        RegisterClasses
 00482220    mov         eax,5E14FC;gvar_005E14FC:Double
 00482225    call        0046F884
 0048222A    mov         esp,ebp
 0048222C    pop         ebp
 0048222D    ret
*}
Finalization
end.