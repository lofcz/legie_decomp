//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLVectorFileObjects;

interface

uses
  SysUtils, Classes, VectorLists, GLVectorFileObjects, GLTexture, GLMisc;

type
  TMeshAutoCentering = (macCenterX, macCenterY, macCenterZ, macUseBarycenter);
  TMeshAutoCenterings = set of TMeshAutoCentering;
  TBaseMeshObject = class(TPersistentObject)
  public
    f8:String;//f8
    fC:TAffineVectorList;//fC
    f10:TAffineVectorList;//f10
    f14:byte;//f14
    destructor Destroy; virtual;//0048EDF0
    constructor Create; virtual;//vC//0048ED98
    //procedure sub_0048F540(?:?; ?:?); dynamic;//0048F540
    procedure sub_0048EF7C; dynamic;//0048EF7C
    procedure sub_0048EF2C; dynamic;//0048EF2C
    //procedure sub_0048EF44(?:?; ?:?); dynamic;//0048EF44
    //procedure sub_00466894(?:?); dynamic;//0048EE78
    //procedure sub_00466814(?:?); dynamic;//0048EE28
  end;
  TSkeletonFrame = class(TPersistentObject)
  public
    fC:String;//fC
    f10:TAffineVectorList;//f10
    f14:TAffineVectorList;//f14
    f18:TQuaternionList;//f18
    f1C:dword;//f1C
    f20:byte;//f20
    destructor Destroy; virtual;//0048F608
    constructor Create; virtual;//vC//0048F5A0
    //procedure sub_00466894(?:?); dynamic;//0048F6AC
    //procedure sub_00466814(?:?); dynamic;//0048F64C
  end;
  TSkeletonFrameList = class(TPersistentObjectList)
  public
    destructor Destroy; virtual;//0048FAD0
    procedure sub_00466E50; dynamic;//0048FB30
    //procedure sub_00466894(?:?); dynamic;//0048FB04
    constructor Create;//0048FA98
  end;
  TSkeletonBoneList = class(TPersistentObjectList)
  public
    f18:dword;//f18
    //f1C:?;//f1C
    //f4C:?;//f4C
    destructor Destroy; virtual;//0048FBF0
    constructor vC; virtual;//vC//0048FBA4
    //procedure v20(?:?); virtual;//v20//0048FC80
    //procedure v24(?:?); virtual;//v24//0048FCA8
    //procedure v28(?:?); virtual;//v28//0048FCDC
    procedure v2C; virtual; abstract;//v2C//00402BEC
    procedure v30; virtual;//v30//0048FD10
    //procedure sub_00466894(?:?); dynamic;//0048FC3C
    //procedure sub_00466814(?:?); dynamic;//0048FC24
  end;
  TSkeletonRootBoneList = class(TSkeletonBoneList)
  public
    //procedure v2C(?:?); virtual;//v2C//0048FD94
    //procedure sub_00466894(?:?); dynamic;//0048FD50
    //procedure sub_00466814(?:?); dynamic;//0048FD38
    constructor Create;//0048FB6C
  end;
  TSkeletonBone = class(TSkeletonBoneList)
  public
    f5C:TSkeletonBoneList;//f5C
    f60:dword;//f60
    f64:String;//f64
    f68:dword;//f68
    destructor Destroy; virtual;//0048FE34
    constructor vC; virtual;//vC//0048FDF8
    //procedure v24(?:?); virtual;//v24//00490074
    //procedure v28(?:?); virtual;//v28//00490080
    //procedure v2C(?:?); virtual;//v2C//0048FFDC
    procedure v30; virtual;//v30//004900C0
    procedure sub_00467038; dynamic;//004900A4
    //procedure sub_00466894(?:?); dynamic;//0048FEA4
    //procedure sub_00466814(?:?); dynamic;//0048FE68
  end;
  TSkeletonCollider = class(TPersistentObject)
  public
    f8:dword;//f8
    fC:dword;//fC
    f10:dword;//f10
    //f14:?;//f14
    //f54:?;//f54
    f94:byte;//f94
    constructor vC; virtual;//vC//00490108
    procedure v1C; virtual;//v1C//004901F8
    //procedure sub_00466894(?:?); dynamic;//004901B4
    //procedure sub_00466814(?:?); dynamic;//0049016C
  end;
  TSkeletonColliderList = class(TPersistentObjectList)
  public
    f18:dword;//f18
    destructor Destroy; virtual;//004902BC
    procedure sub_00466E50; dynamic;//00490374
    //procedure sub_00466894(?:?); dynamic;//00490304
    constructor Create;//00490280
  end;
  TSkeleton = class(TPersistentObject)
  public
    fC:TSkeletonRootBoneList;//fC
    f10:TSkeletonFrameList;//f10
    f14:dword;//f14
    f18:dword;//f18
    f1C:TSkeletonColliderList;//f1C
    destructor Destroy; virtual;//00490488
    constructor vC; virtual;//vC//00490420
    //procedure sub_00466894(?:?); dynamic;//0049053C
    //procedure sub_00466814(?:?); dynamic;//004904D4
    constructor Create;//004903E8
  end;
  TMeshObject = class(TBaseMeshObject)
  public
    f18:dword;//f18
    f1C:TAffineVectorList;//f1C
    f20:TTexPointList;//f20
    f24:TVectorList;//f24
    f28:TFaceGroups;//f28
    f2C:byte;//f2C
    //f2D:?;//f2D
    f2E:byte;//f2E
    f34:TList;//f34
    f38:dword;//f38
    f3C:dword;//f3C
    f40:dword;//f40
    destructor Destroy; virtual;//00490D74
    constructor vC; virtual;//vC//00490CE0
    //procedure v1C(?:?); virtual;//v1C//00491928
    //procedure v20(?:?); virtual;//v20//00491998
    //procedure v24(?:?); virtual;//v24//004912E0
    procedure sub_004912B0; dynamic;//004912B0
    procedure sub_004912A0; dynamic;//004912A0
    procedure sub_0049119C; dynamic;//0049119C
    //procedure sub_0048F540(?:?; ?:?); dynamic;//00491088
    procedure sub_0048EF2C; dynamic;//00491034
    //procedure sub_00466894(?:?); dynamic;//00490EC8
    //procedure sub_00466814(?:?); dynamic;//00490DF4
    constructor Create;//00490C90
  end;
  TMeshObjectList = class(TPersistentObjectList)
  public
    destructor Destroy; virtual;//00491EC0
    //procedure v24(?:?); virtual;//v24//00491F8C
    //procedure v28(?:?); virtual;//v28//00491FC0
    procedure sub_00492374; dynamic;//00492374
    procedure sub_00466E50; dynamic;//004920E8
    //procedure sub_00466894(?:?); dynamic;//00491EF4
    constructor Create;//00491E88
  end;
  TMeshMorphTarget = class(TBaseMeshObject)
  public
    f18:dword;//f18
    destructor Destroy; virtual;//004923F0
    //procedure sub_00466894(?:?); dynamic;//0049243C
    //procedure sub_00466814(?:?); dynamic;//00492424
    constructor Create;//004923A0
  end;
  TMeshMorphTargetList = class(TPersistentObjectList)
  public
    destructor Destroy; virtual;//0049249C
    procedure sub_00466E50; dynamic;//00492530
    //procedure sub_00466894(?:?); dynamic;//004924D0
    constructor Create;//00492464
  end;
  TMorphableMeshObject = class(TMeshObject)
  public
    f44:TMeshMorphTargetList;//f44
    destructor Destroy; virtual;//004925B4
    constructor vC; virtual;//vC//0049256C
    //procedure sub_0048EF7C(?:?); dynamic;//00492664
    procedure sub_0048EF2C; dynamic;//00492648
    //procedure sub_00466894(?:?); dynamic;//00492610
    //procedure sub_00466814(?:?); dynamic;//004925E4
  end;
  TSkeletonMeshObject = class(TMorphableMeshObject)
  public
    f48:dword;//f48
    f4C:dword;//f4C
    f50:dword;//f50
    f54:Integer;//f54
    f58:dword;//f58
    f5C:Integer;//f5C
    f60:TList;//f60
    destructor Destroy; virtual;//004928CC
    constructor vC; virtual;//vC//00492888
    procedure sub_0048EF2C; dynamic;//004929F4
    //procedure sub_00466894(?:?); dynamic;//00492974
    //procedure sub_00466814(?:?); dynamic;//00492908
  end;
  TFaceGroup = class(TPersistentObject)
  public
    f8:dword;//f8
    fC:String;//fC
    f14:dword;//f14
    destructor Destroy; virtual;//0049303C
    constructor Create; virtual;//v1C//00492FE8
    procedure v20; virtual; abstract;//v20//00402BEC
    procedure sub_0049336C; dynamic;//0049336C
    procedure sub_00493368; dynamic;//00493368
    procedure @AbstractError; dynamic;//00402BEC
    procedure sub_00493360; dynamic;//00493360
    //procedure sub_00466894(?:?); dynamic;//004930C0
    //procedure sub_00466814(?:?); dynamic;//00493070
  end;
  TFGVertexIndexList = class(TFaceGroup)
  public
    f1C:TIntegerList;//f1C
    f20:byte;//f20
    destructor Destroy; virtual;//004933B8
    constructor vC; virtual;//vC//00493370
    //procedure v20(?:?); virtual;//v20//00493464
    procedure sub_00493368; dynamic;//004938D8
    procedure sub_00493804; dynamic;//00493804
    //procedure sub_00493360(?:?; ?:?; ?:?); dynamic;//004937B8
    //procedure sub_00466894(?:?); dynamic;//00493420
    //procedure sub_00466814(?:?); dynamic;//004933E8
  end;
  TFGVertexNormalTexIndexList = class(TFGVertexIndexList)
  public
    f24:TIntegerList;//f24
    f28:TIntegerList;//f28
    destructor Destroy; virtual;//00493944
    constructor vC; virtual;//vC//004938F0
    procedure v20; virtual;//v20//00493A00
    //procedure sub_00493360(?:?; ?:?; ?:?); dynamic;//00493BD0
    //procedure sub_00466894(?:?); dynamic;//004939B8
    //procedure sub_00466814(?:?); dynamic;//0049397C
  end;
  TFGIndexTexCoordList = class(TFGVertexIndexList)
  public
    f24:TAffineVectorList;//f24
    destructor Destroy; virtual;//00493C68
    constructor vC; virtual;//vC//00493C24
    procedure v20; virtual;//v20//00493CFC
    //procedure sub_00493360(?:?; ?:?; ?:?); dynamic;//00493F04
    //procedure sub_00466894(?:?); dynamic;//00493CC4
    //procedure sub_00466814(?:?); dynamic;//00493C98
  end;
  TFaceGroups = class(TPersistentObjectList)
  public
    f18:dword;//f18
    destructor Destroy; virtual;//00494124
    procedure sub_00466E50; dynamic;//00494184
    //procedure sub_00466894(?:?); dynamic;//00494158
    constructor Create;//004940EC
  end;
  TMeshNormalsOrientation = (mnoDefault, mnoInvert);
  TVectorFile = class(TDataFile)
  public
    fC:byte;//fC
    constructor vC; virtual;//vC//00494260
    //procedure v14(?:?); virtual;//v14//00494334
  end;
  TGLGLSMVectorFile = class(TVectorFile)
  public
    //function v10:?; virtual;//v10//00494338
    //procedure sub_00465D9C(?:?); dynamic;//00494368
    //procedure sub_00494344(?:?); dynamic;//00494344
  end;
  TGLBaseMesh = class(TGLSceneObject)
  public
    f98:byte;//f98
    f9C:TGLMaterialLibrary;//f9C
    fA0:TGLMaterialLibrary;//fA0
    fA4:Single;//fA4
    fA8:Single;//fA8
    fAC:Single;//fAC
    fB4:byte;//fB4
    fB5:byte;//fB5
    fB6:byte;//fB6
    fB7:byte;//fB7
    fB8:TGLCoordinates;//fB8
    fBC:byte;//fBC
    fC0:dword;//fC0
    fC4:String;//fC4
    fC8:TMeshObjectList;//fC8
    fCC:TSkeleton;//fCC
    destructor Destroy; virtual;//00494448
    procedure Assign(Source:TPersistent); virtual;//v8//004944A0
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00494B6C
    constructor Create(AOwner:TComponent); virtual;//v2C//0049438C
    //procedure v4C(?:?); virtual;//v4C//00494BB0
    //function v54(?:?; ?:?; ?:?; ?:?):?; virtual;//v54//004950C4
    //function v58(?:?):?; virtual;//v58//00495268
    procedure v64; virtual;//v64//00494E98
    //procedure v68(?:?; ?:?; ?:?); virtual;//v68//00494EA4
    //procedure sub_00494860(?:?; ?:?); dynamic;//00494860
    //procedure sub_00494804(?:?); dynamic;//00494804
    //procedure sub_00494780(?:?; ?:?); dynamic;//00494780
    //procedure sub_00494724(?:?); dynamic;//00494724
    //procedure sub_004945F8(?:?; ?:?); dynamic;//004945F8
    //procedure sub_00494580(?:?); dynamic;//00494580
    procedure sub_00494D5C; dynamic;//00494D5C
    procedure sub_00494CA4; dynamic;//00494CA4
    procedure sub_00494E40; dynamic;//00494E40
    procedure sub_00494DE4; dynamic;//00494DE4
    //procedure sub_00494C94(?:?); dynamic;//00494C94
    procedure sub_0047CEC8; dynamic;//00495094
    procedure sub_0047B63C; dynamic;//00494C68
  end;
  TGLFreeForm = class(TGLBaseMesh)
  public
    fD0:dword;//fD0
    destructor Destroy; virtual;//00495324
    constructor Create(AOwner:TComponent); virtual;//v2C//004952E8
    procedure SetMaterialLibrary(Value:TGLMaterialLibrary);//00494A80
    procedure SetLightmapLibrary(Value:TGLMaterialLibrary);//00494AE4
    procedure SetNormalsOrientation(Value:TMeshNormalsOrientation);//00494B34
    procedure SetUseMeshMaterials(Value:Boolean);//00494E64
  end;
  TGLActorOption = (aoSkeletonNormalizeNormals);
  TGLActorOptions = set of TGLActorOption;
  TActorAnimationReference = (aarMorph, aarSkeleton, aarNone);
  TActorAnimation = class(TCollectionItem)
  public
    Name:String;//fC
    StartFrame:Integer;//f10
    EndFrame:Integer;//f14
    Reference:TActorAnimationReference;//f18
    destructor Destroy; virtual;//0049538C
    procedure Assign(Source:TPersistent); virtual;//v8//004953D4
    //procedure GetDisplayName(?:?); virtual;//vC//0049541C
    constructor Create(Collection:TCollection); virtual;//v1C//00495354
    procedure SetStartFrame(Value:Integer);//00495540
    procedure SetEndFrame(Value:Integer);//00495574
    procedure SetReference(Value:TActorAnimationReference);//004955A8
  end;
  TActorAnimations = class(TCollection)
  public
    f18:dword;//f18
    procedure sub_0041ADA4; dynamic;//00495630
    constructor Create;//004955F0
  end;
  TGLBaseAnimationControler = class(TComponent)
  public
    Enabled:Boolean;//f30
    Actor:TGLActor;//f34
    destructor Destroy; virtual;//00495750
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00495780
    constructor Create(AOwner:TComponent); virtual;//v2C//00495714
    procedure v30; virtual;//v30//004957AC
    //function v34:?; virtual;//v34//00495808
    procedure SetEnabled(Value:Boolean);//004957C0
    procedure SetActor(Value:TGLActor);//004957D4
  end;
  TGLAnimationControler = class(TGLBaseAnimationControler)
  public
    AnimationName:String;//f38
    Ratio:Single;//f3C
    procedure v30; virtual;//v30//0049580C
    //function v34(?:?):?; virtual;//v34//00495878
    procedure SetAnimationName(Value:String);//00495820
    //procedure SetRatio(Value:Single; ?:?);//00495848
  end;
  TActorFrameInterpolation = (afpNone, afpLinear);
  TActorAnimationMode = (aamNone, aamPlayOnce, aamLoop, aamBounceForward, aamBounceBackward, aamLoopBackward, aamExternal);
  TGLActor = class(TGLBaseMesh)
  public
    StartFrame:Integer;//fD0
    EndFrame:Integer;//fD4
    Reference:TActorAnimationReference;//fD8
    CurrentFrame:Integer;//fDC
    CurrentFrameDelta:Single;//fE0
    FrameInterpolation:TActorFrameInterpolation;//fE4
    Interval:Integer;//fE8
    AnimationMode:TActorAnimationMode;//fEC
    OnFrameChanged:TNotifyEvent;//fF0
    fF2:word;//fF2
    fF4:dword;//fF4
    OnEndFrameReached:TNotifyEvent;//fF8
    OnStartFrameReached:TNotifyEvent;//f100
    Animations:TActorAnimations;//f108
    f10C:dword;//f10C
    f110:TList;//f110
    Options:TGLActorOptions;//f114
    destructor Destroy; virtual;//004959CC
    procedure Assign(Source:TPersistent); virtual;//v8//00495A08
    constructor Create(AOwner:TComponent); virtual;//v2C//00495948
    //procedure v30(?:?); virtual;//v30//00496250
    //procedure v64(?:?); virtual;//v64//00495ED0
    //procedure sub_004945F8(?:?; ?:?); dynamic;//00496340
    procedure sub_00494E40; dynamic;//0049619C
    procedure sub_00494DE4; dynamic;//00496158
    procedure SetOverlaySkeleton(Value:Boolean);//00494B50
    procedure SetCurrentFrame(Value:Integer);//00495B48
    procedure SetStartFrame(Value:Integer);//00495C10
    procedure SetEndFrame(Value:Integer);//00495C64
    procedure SetAnimations(Value:TActorAnimations);//00495CA4
    function IsStoredAnimations(Value:TActorAnimations):Boolean;//00495CB4
    procedure SetOptions(Value:TGLActorOptions);//00495CCC
  end;
  TVectorFileFormat = class(TObject)
  public
    f4:dword;//f4
    f8:String;//f8
    fC:String;//fC
    f10:dword;//f10
  end;
  TVectorFileFormatsList = class(TPersistentObjectList)
  public
    destructor Destroy; virtual;//0048EB54
  end;
  EInvalidVectorFile = class(Exception)
  end;
  .43 = array of ?;
//elSize = 1;
  .63 = array of ?;
//elSize = 1C;
    //function sub_0048EB0C:?;//0048EB0C
    procedure sub_0048EB2C(?:AnsiString; ?:AnsiString; ?:TVectorFile);//0048EB2C
    destructor Destroy;//0048EB54
    //procedure sub_0048EB88(?:?; ?:?; ?:?; ?:?; ?:?);//0048EB88
    //function sub_0048EC14(?:?; ?:AnsiString):?;//0048EC14
    //function sub_0048ECAC(?:?; ?:?):?;//0048ECAC
    constructor Create;//0048ED98
    destructor Destroy;//0048EDF0
    //procedure sub_00466814(?:?);//0048EE28
    //procedure sub_00466894(?:?);//0048EE78
    procedure sub_0048EF2C;//0048EF2C
    //procedure sub_0048EF44(?:?; ?:?);//0048EF44
    procedure sub_0048EF7C;//0048EF7C
    //function sub_0048EF90(?:?; ?:?; ?:?):?;//0048EF90
    //procedure sub_0048EFF8(?:TMeshMorphTarget; ?:TIntegerList; ?:?; ?:?);//0048EFF8
    //procedure sub_0048F540(?:?; ?:?);//0048F540
    procedure sub_0048F588(?:TBaseMeshObject);//0048F588
    procedure sub_0048F594(?:TBaseMeshObject);//0048F594
    constructor Create;//0048F5A0
    destructor Destroy;//0048F608
    //procedure sub_00466814(?:?);//0048F64C
    //procedure sub_00466894(?:?);//0048F6AC
    //procedure sub_0048F774(?:?);//0048F774
    procedure sub_0048FA80(?:TSkeletonFrame);//0048FA80
    destructor Destroy;//0048FAD0
    //procedure sub_00466894(?:?);//0048FB04
    procedure sub_00466E50;//0048FB30
    //function sub_0048FB64(?:TSkeletonFrameList; ?:Integer):?;//0048FB64
    constructor sub_0048FBA4;//0048FBA4
    destructor Destroy;//0048FBF0
    //procedure sub_00466814(?:?);//0048FC24
    //procedure sub_00466894(?:?);//0048FC3C
    //procedure sub_0048FC80(?:?);//0048FC80
    //function sub_0048FCA0(?:TSkeletonBoneList; ?:?):?;//0048FCA0
    //procedure sub_0048FCA8(?:?);//0048FCA8
    //procedure sub_0048FCDC(?:?);//0048FCDC
    procedure sub_0048FD10;//0048FD10
    //procedure sub_00466814(?:?);//0048FD38
    //procedure sub_00466894(?:?);//0048FD50
    //procedure sub_0048FD94(?:?);//0048FD94
    constructor sub_0048FDF8;//0048FDF8
    destructor Destroy;//0048FE34
    //procedure sub_00466814(?:?);//0048FE68
    //procedure sub_00466894(?:?);//0048FEA4
    procedure sub_0048FF44(?:dword);//0048FF44
    //procedure sub_0048FFDC(?:?);//0048FFDC
    //function sub_0049006C(?:TSkeletonBone; ?:?):?;//0049006C
    //procedure sub_00490074(?:?);//00490074
    //procedure sub_00490080(?:?);//00490080
    procedure sub_00467038;//004900A4
    procedure sub_004900C0;//004900C0
    constructor sub_00490108;//00490108
    //procedure sub_00466814(?:?);//0049016C
    //procedure sub_00466894(?:?);//004901B4
    procedure sub_004901F8;//004901F8
    //procedure sub_00490274(?:?; ?:?);//00490274
    destructor Destroy;//004902BC
    //function sub_004902F0(?:TSkeletonColliderList; ?:?):?;//004902F0
    //procedure sub_00466894(?:?);//00490304
    procedure sub_00466E50;//00490374
    //procedure sub_004903B0(?:?);//004903B0
    constructor sub_00490420;//00490420
    destructor Destroy;//00490488
    //procedure sub_00466814(?:?);//004904D4
    //procedure sub_00466894(?:?);//0049053C
    //function sub_0049059C(?:dword):?;//0049059C
    //procedure sub_004905C4(?:TSkeleton; ?:?);//004905C4
    procedure sub_004905EC(?:TSkeleton);//004905EC
    //procedure sub_00490600(?:?; ?:?);//00490600
    //function sub_00490660(?:dword; ?:?):?;//00490660
    //procedure sub_004906C4(?:TSkeleton; ?:Integer; ?:?; ?:?);//004906C4
    //procedure sub_004907A0(?:TSkeleton; ?:?; ?:Longint);//004907A0
    //procedure sub_00490BAC(?:TSkeleton; ?:?);//00490BAC
    //procedure sub_00490C28(?:TSkeleton; ?:?);//00490C28
    procedure sub_00490C50(?:TSkeleton);//00490C50
    constructor sub_00490CE0;//00490CE0
    destructor Destroy;//00490D74
    //procedure sub_00466814(?:?);//00490DF4
    //procedure sub_00466894(?:?);//00490EC8
    procedure sub_0048EF2C;//00491034
    //procedure sub_0048F540(?:?; ?:?);//00491088
    procedure sub_0049119C;//0049119C
    //procedure sub_00491288(?:?);//00491288
    //procedure sub_00491294(?:?);//00491294
    procedure sub_004912A0;//004912A0
    procedure sub_004912B0;//004912B0
    //procedure sub_004912E0(?:?);//004912E0
    //function sub_00491348(?:TMeshObject; ?:?):?;//00491348
    //procedure sub_00491388(?:TMeshObject; ?:?);//00491388
    //procedure sub_00491414(?:TMeshObject; ?:?);//00491414
    //procedure sub_004914A0(?:TMeshObject; ?:?; ?:?);//004914A0
    //procedure sub_0049170C(?:TMeshObject; ?:?);//0049170C
    //procedure sub_00491824(?:?; ?:?);//00491824
    //procedure sub_004918E8(?:?);//004918E8
    //procedure sub_00491928(?:?);//00491928
    //procedure sub_00491998(?:?);//00491998
    destructor Destroy;//00491EC0
    //procedure sub_00466894(?:?);//00491EF4
    //procedure sub_00491F3C(?:?; ?:?);//00491F3C
    procedure sub_00491F68(?:TMeshObjectList);//00491F68
    //procedure sub_00491F8C(?:?);//00491F8C
    //procedure sub_00491FC0(?:?);//00491FC0
    procedure sub_00491FF4(?:TMeshObjectList; ?:Integer);//00491FF4
    //procedure sub_00492038(?:TMeshObjectList; ?:Integer; ?:?; ?:?);//00492038
    //function sub_00492090(?:TMeshObjectList):?;//00492090
    procedure sub_00466E50;//004920E8
    //function sub_00492124(?:TMeshObjectList; ?:?):?;//00492124
    //procedure sub_0049212C(?:TMeshObjectList; ?:?; ?:?);//0049212C
    //procedure sub_004921FC(?:TMeshObjectList; ?:?);//004921FC
    //function sub_00492230(?:TMeshObjectList; ?:?; ?:?):?;//00492230
    procedure sub_00492374;//00492374
    destructor Destroy;//004923F0
    //procedure sub_00466814(?:?);//00492424
    //procedure sub_00466894(?:?);//0049243C
    destructor Destroy;//0049249C
    //procedure sub_00466894(?:?);//004924D0
    //procedure sub_004924FC(?:TMeshMorphTargetList; ?:?);//004924FC
    procedure sub_00466E50;//00492530
    //function sub_00492564(?:TMeshMorphTargetList; ?:?):?;//00492564
    constructor sub_0049256C;//0049256C
    destructor Destroy;//004925B4
    //procedure sub_00466814(?:?);//004925E4
    //procedure sub_00466894(?:?);//00492610
    procedure sub_0048EF2C;//00492648
    //procedure sub_0048EF7C(?:?);//00492664
    //procedure sub_00492680(?:TMorphableMeshObject; ?:?);//00492680
    //procedure sub_00492748(?:?; ?:?; ?:?; ?:?);//00492748
    constructor sub_00492888;//00492888
    destructor Destroy;//004928CC
    //procedure sub_00466814(?:?);//00492908
    //procedure sub_00466894(?:?);//00492974
    procedure sub_0048EF2C;//004929F4
    procedure sub_00492A40(?:TSkeletonMeshObject);//00492A40
    //procedure sub_00492B50(?:?);//00492B50
    //procedure sub_00492D0C(?:?; ?:?);//00492D0C
    constructor Create;//00492FE8
    destructor Destroy;//0049303C
    //procedure sub_00466814(?:?);//00493070
    //procedure sub_00466894(?:?);//004930C0
    //procedure sub_0049314C(?:?; ?:?; ?:?);//0049314C
    //procedure sub_0049322C(?:TFGVertexIndexList; ?:?);//0049322C
    //procedure sub_0049332C(?:?; ?:?);//0049332C
    //procedure sub_00493358(?:?);//00493358
    procedure sub_00493360;//00493360
    procedure sub_00493368;//00493368
    procedure sub_0049336C;//0049336C
    constructor sub_00493370;//00493370
    destructor Destroy;//004933B8
    //procedure sub_00466814(?:?);//004933E8
    //procedure sub_00466894(?:?);//00493420
    //procedure sub_00493464(?:?);//00493464
    //procedure sub_004934B0(?:TFGVertexIndexList; ?:?; ?:?; ?:?);//004934B0
    //procedure sub_00493360(?:?; ?:?; ?:?);//004937B8
    procedure sub_00493804;//00493804
    procedure sub_00493368;//004938D8
    procedure sub_004938E4(?:TFGVertexIndexList);//004938E4
    constructor sub_004938F0;//004938F0
    destructor Destroy;//00493944
    //procedure sub_00466814(?:?);//0049397C
    //procedure sub_00466894(?:?);//004939B8
    procedure sub_00493A00;//00493A00
    //procedure sub_00493360(?:?; ?:?; ?:?);//00493BD0
    constructor sub_00493C24;//00493C24
    destructor Destroy;//00493C68
    //procedure sub_00466814(?:?);//00493C98
    //procedure sub_00466894(?:?);//00493CC4
    procedure sub_00493CFC;//00493CFC
    //procedure sub_00493360(?:?; ?:?; ?:?);//00493F04
    //procedure sub_004940C4(?:TFGIndexTexCoordList; ?:?; ?:?; ?:?);//004940C4
    destructor Destroy;//00494124
    //procedure sub_00466894(?:?);//00494158
    procedure sub_00466E50;//00494184
    //function sub_004941BC(?:TFaceGroups; ?:?):?;//004941BC
    //procedure sub_004941C4(?:?; ?:?);//004941C4
    //procedure sub_004941F0(?:?);//004941F0
    //procedure sub_00494214(?:TFaceGroups; ?:TAffineVectorList; ?:?; ?:?);//00494214
    constructor sub_00494260;//00494260
    //function sub_00494320(?:TVectorFile):?;//00494320
    //procedure sub_00494334(?:?);//00494334
    //function sub_00494338:?;//00494338
    //procedure sub_00494344(?:?);//00494344
    //procedure sub_00465D9C(?:?);//00494368
    constructor Create(AOwner:TComponent);//0049438C
    destructor Destroy;//00494448
    procedure Assign(Source:TPersistent);//004944A0
    //procedure sub_00494580(?:?);//00494580
    //procedure sub_004945F8(?:?; ?:?);//004945F8
    //procedure sub_00494724(?:?);//00494724
    //procedure sub_00494780(?:?; ?:?);//00494780
    //procedure sub_00494804(?:?);//00494804
    //procedure sub_00494860(?:?; ?:?);//00494860
    //procedure sub_00494918(?:TGLBaseMesh; ?:?; ?:?);//00494918
    //procedure sub_004949F4(?:TGLBaseMesh; ?:?);//004949F4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00494B6C
    //procedure sub_00494BB0(?:?);//00494BB0
    procedure sub_0047B63C;//00494C68
    //procedure sub_00494C94(?:?);//00494C94
    procedure sub_00494CA4;//00494CA4
    procedure sub_00494D5C;//00494D5C
    procedure sub_00494DE4;//00494DE4
    procedure sub_00494DF0(?:TGLBaseMesh);//00494DF0
    procedure sub_00494E20(?:TGLBaseMesh);//00494E20
    procedure sub_00494E40;//00494E40
    procedure sub_00494E98;//00494E98
    //procedure sub_00494EA4(?:?; ?:?; ?:?);//00494EA4
    procedure sub_0047CEC8;//00495094
    //function sub_004950C4(?:?; ?:?; ?:?; ?:?):?;//004950C4
    //function sub_00495268(?:?):?;//00495268
    constructor Create(AOwner:TComponent);//004952E8
    destructor Destroy;//00495324
    constructor Create(Collection:TCollection);//00495354
    destructor Destroy;//0049538C
    procedure Assign(Source:TPersistent);//004953D4
    //procedure GetDisplayName(?:?);//0049541C
    //function sub_00495490(?:TActorAnimation):?;//00495490
    procedure sub_0041ADA4;//00495630
    //function sub_00495634(?:?; ?:?):?;//00495634
    //function sub_00495648(?:?):?;//00495648
    //function sub_00495660(?:TActorAnimations; ?:String):?;//00495660
    //function sub_004956B4(?:?; ?:?; ?:?):?;//004956B4
    constructor Create(AOwner:TComponent);//00495714
    destructor Destroy;//00495750
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00495780
    procedure sub_004957AC;//004957AC
    //function sub_00495808:?;//00495808
    procedure sub_0049580C;//0049580C
    //function sub_00495878(?:?):?;//00495878
    constructor Create(AOwner:TComponent);//00495948
    destructor Destroy;//004959CC
    procedure Assign(Source:TPersistent);//00495A08
    procedure sub_00495A58(?:TGLActor; ?:TGLBaseAnimationControler);//00495A58
    procedure sub_00495A94(?:TGLActor; ?:TGLBaseAnimationControler);//00495A94
    //function sub_00495CF8(?:TGLActor):?;//00495CF8
    //procedure sub_00495E30(?:TGLActor; ?:?);//00495E30
    //procedure sub_00495ED0(?:?);//00495ED0
    procedure sub_00494DE4;//00496158
    procedure sub_00494E40;//0049619C
    //function sub_004961A0(?:TGLActor):?;//004961A0
    //procedure sub_00496250(?:?);//00496250
    //procedure sub_004945F8(?:?; ?:?);//00496340
    //procedure sub_00496368(?:TGLActor; ?:AnsiString; ?:?);//00496368
    //procedure sub_00496390(?:TGLActor; ?:?; ?:?);//00496390
    //procedure sub_004963DC(?:TGLActor; ?:?);//004963DC
    procedure sub_00496414(?:TGLActor; ?:TPersistent);//00496414
    function sub_004964FC(?:TGLActor):Boolean;//004964FC

implementation

//0048EB0C
{*function sub_0048EB0C:?;
begin
 0048EB0C    cmp         dword ptr ds:[5E156C],0;gvar_005E156C:TVectorFileFormatsList
>0048EB13    jne         0048EB26
 0048EB15    mov         dl,1
 0048EB17    mov         eax,[0048E9E8];TVectorFileFormatsList
 0048EB1C    call        TPersistentObjectList.Create;TVectorFileFormatsList.Create
 0048EB21    mov         [005E156C],eax;gvar_005E156C:TVectorFileFormatsList
 0048EB26    mov         eax,[005E156C];gvar_005E156C:TVectorFileFormatsList
 0048EB2B    ret
end;*}

//0048EB2C
procedure sub_0048EB2C(?:AnsiString; ?:AnsiString; ?:TVectorFile);
begin
{*
 0048EB2C    push        ebx
 0048EB2D    push        esi
 0048EB2E    push        edi
 0048EB2F    mov         ebx,ecx
 0048EB31    mov         edi,edx
 0048EB33    mov         esi,eax
 0048EB35    mov         eax,ebx
 0048EB37    call        RegisterClass
 0048EB3C    push        0
 0048EB3E    push        ebx
 0048EB3F    call        0048EB0C
 0048EB44    mov         ecx,edi
 0048EB46    mov         edx,esi
 0048EB48    call        0048EB88
 0048EB4D    pop         edi
 0048EB4E    pop         esi
 0048EB4F    pop         ebx
 0048EB50    ret
*}
end;

//0048EB54
destructor TVectorFileFormatsList.Destroy;
begin
{*
 0048EB54    push        ebx
 0048EB55    push        esi
 0048EB56    push        edi
 0048EB57    call        @BeforeDestruction
 0048EB5C    mov         ebx,edx
 0048EB5E    mov         edi,eax
 0048EB60    mov         eax,edi
 0048EB62    mov         si,0FFF3
 0048EB66    call        @CallDynaInst;TPersistentObjectList.sub_00467038
 0048EB6B    mov         edx,ebx
 0048EB6D    and         dl,0FC
 0048EB70    mov         eax,edi
 0048EB72    call        TPersistentObjectList.Destroy
 0048EB77    test        bl,bl
>0048EB79    jle         0048EB82
 0048EB7B    mov         eax,edi
 0048EB7D    call        @ClassDestroy
 0048EB82    pop         edi
 0048EB83    pop         esi
 0048EB84    pop         ebx
 0048EB85    ret
*}
end;

//0048EB88
{*procedure sub_0048EB88(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0048EB88    push        ebp
 0048EB89    mov         ebp,esp
 0048EB8B    add         esp,0FFFFFFF8
 0048EB8E    push        ebx
 0048EB8F    push        esi
 0048EB90    push        edi
 0048EB91    xor         ebx,ebx
 0048EB93    mov         dword ptr [ebp-8],ebx
 0048EB96    mov         dword ptr [ebp-4],ecx
 0048EB99    mov         edi,edx
 0048EB9B    mov         esi,eax
 0048EB9D    xor         eax,eax
 0048EB9F    push        ebp
 0048EBA0    push        48EC04
 0048EBA5    push        dword ptr fs:[eax]
 0048EBA8    mov         dword ptr fs:[eax],esp
 0048EBAB    mov         dl,1
 0048EBAD    mov         eax,[0048E970];TVectorFileFormat
 0048EBB2    call        TObject.Create;TVectorFileFormat.Create
 0048EBB7    mov         ebx,eax
 0048EBB9    lea         edx,[ebp-8]
 0048EBBC    mov         eax,edi
 0048EBBE    call        AnsiLowerCase
 0048EBC3    mov         edx,dword ptr [ebp-8]
 0048EBC6    lea         eax,[ebx+8];TVectorFileFormat.?f8:String
 0048EBC9    call        @LStrAsg
 0048EBCE    mov         eax,dword ptr [ebp+8]
 0048EBD1    mov         dword ptr [ebx+4],eax;TVectorFileFormat.?f4:dword
 0048EBD4    lea         eax,[ebx+0C];TVectorFileFormat.?fC:String
 0048EBD7    mov         edx,dword ptr [ebp-4]
 0048EBDA    call        @LStrAsg
 0048EBDF    mov         eax,dword ptr [ebp+0C]
 0048EBE2    mov         dword ptr [ebx+10],eax;TVectorFileFormat.?f10:dword
 0048EBE5    mov         edx,ebx
 0048EBE7    mov         eax,esi
 0048EBE9    call        00466E24
 0048EBEE    xor         eax,eax
 0048EBF0    pop         edx
 0048EBF1    pop         ecx
 0048EBF2    pop         ecx
 0048EBF3    mov         dword ptr fs:[eax],edx
 0048EBF6    push        48EC0B
 0048EBFB    lea         eax,[ebp-8]
 0048EBFE    call        @LStrClr
 0048EC03    ret
>0048EC04    jmp         @HandleFinally
>0048EC09    jmp         0048EBFB
 0048EC0B    pop         edi
 0048EC0C    pop         esi
 0048EC0D    pop         ebx
 0048EC0E    pop         ecx
 0048EC0F    pop         ecx
 0048EC10    pop         ebp
 0048EC11    ret         8
end;*}

//0048EC14
{*function sub_0048EC14(?:?; ?:AnsiString):?;
begin
 0048EC14    push        ebp
 0048EC15    mov         ebp,esp
 0048EC17    add         esp,0FFFFFFF8
 0048EC1A    push        ebx
 0048EC1B    push        esi
 0048EC1C    push        edi
 0048EC1D    xor         ecx,ecx
 0048EC1F    mov         dword ptr [ebp-8],ecx
 0048EC22    mov         dword ptr [ebp-4],edx
 0048EC25    mov         edi,eax
 0048EC27    mov         eax,dword ptr [ebp-4]
 0048EC2A    call        @LStrAddRef
 0048EC2F    xor         eax,eax
 0048EC31    push        ebp
 0048EC32    push        48EC9C
 0048EC37    push        dword ptr fs:[eax]
 0048EC3A    mov         dword ptr fs:[eax],esp
 0048EC3D    lea         edx,[ebp-8]
 0048EC40    mov         eax,dword ptr [ebp-4]
 0048EC43    call        AnsiLowerCase
 0048EC48    mov         edx,dword ptr [ebp-8]
 0048EC4B    lea         eax,[ebp-4]
 0048EC4E    call        @LStrLAsg
 0048EC53    mov         ebx,dword ptr [edi+0C]
 0048EC56    dec         ebx
 0048EC57    cmp         ebx,0
>0048EC5A    jl          0048EC7F
 0048EC5C    mov         edx,ebx
 0048EC5E    mov         eax,edi
 0048EC60    call        00466EF0
 0048EC65    mov         esi,eax
 0048EC67    mov         eax,dword ptr [esi+8]
 0048EC6A    mov         edx,dword ptr [ebp-4]
 0048EC6D    call        @LStrCmp
>0048EC72    jne         0048EC79
 0048EC74    mov         ebx,dword ptr [esi+4]
>0048EC77    jmp         0048EC81
 0048EC79    dec         ebx
 0048EC7A    cmp         ebx,0FFFFFFFF
>0048EC7D    jne         0048EC5C
 0048EC7F    xor         ebx,ebx
 0048EC81    xor         eax,eax
 0048EC83    pop         edx
 0048EC84    pop         ecx
 0048EC85    pop         ecx
 0048EC86    mov         dword ptr fs:[eax],edx
 0048EC89    push        48ECA3
 0048EC8E    lea         eax,[ebp-8]
 0048EC91    mov         edx,2
 0048EC96    call        @LStrArrayClr
 0048EC9B    ret
>0048EC9C    jmp         @HandleFinally
>0048ECA1    jmp         0048EC8E
 0048ECA3    mov         eax,ebx
 0048ECA5    pop         edi
 0048ECA6    pop         esi
 0048ECA7    pop         ebx
 0048ECA8    pop         ecx
 0048ECA9    pop         ecx
 0048ECAA    pop         ebp
 0048ECAB    ret
end;*}

//0048ECAC
{*function sub_0048ECAC(?:?; ?:?):?;
begin
 0048ECAC    push        ebp
 0048ECAD    mov         ebp,esp
 0048ECAF    add         esp,0FFFFFFE0
 0048ECB2    push        ebx
 0048ECB3    push        esi
 0048ECB4    xor         ecx,ecx
 0048ECB6    mov         dword ptr [ebp-18],ecx
 0048ECB9    mov         dword ptr [ebp-20],ecx
 0048ECBC    mov         dword ptr [ebp-1C],ecx
 0048ECBF    mov         dword ptr [ebp-4],ecx
 0048ECC2    mov         esi,edx
 0048ECC4    mov         ebx,eax
 0048ECC6    xor         eax,eax
 0048ECC8    push        ebp
 0048ECC9    push        48ED79
 0048ECCE    push        dword ptr fs:[eax]
 0048ECD1    mov         dword ptr fs:[eax],esp
 0048ECD4    lea         edx,[ebp-4]
 0048ECD7    mov         eax,esi
 0048ECD9    call        ExtractFileExt
 0048ECDE    lea         eax,[ebp-4]
 0048ECE1    mov         ecx,1
 0048ECE6    mov         edx,1
 0048ECEB    call        @LStrDelete
 0048ECF0    mov         edx,dword ptr [ebp-4]
 0048ECF3    mov         eax,ebx
 0048ECF5    call        0048EC14
 0048ECFA    mov         ebx,eax
 0048ECFC    test        ebx,ebx
>0048ECFE    jne         0048ED56
 0048ED00    mov         eax,dword ptr [ebp-4]
 0048ED03    mov         dword ptr [ebp-14],eax
 0048ED06    mov         byte ptr [ebp-10],0B
 0048ED0A    lea         edx,[ebp-1C]
 0048ED0D    mov         eax,dword ptr [ebp-4]
 0048ED10    call        UpperCase
 0048ED15    mov         ecx,dword ptr [ebp-1C]
 0048ED18    lea         eax,[ebp-18]
 0048ED1B    mov         edx,48ED90;'GLFile'
 0048ED20    call        @LStrCat3
 0048ED25    mov         eax,dword ptr [ebp-18]
 0048ED28    mov         dword ptr [ebp-0C],eax
 0048ED2B    mov         byte ptr [ebp-8],0B
 0048ED2F    lea         eax,[ebp-14]
 0048ED32    push        eax
 0048ED33    push        1
 0048ED35    lea         edx,[ebp-20]
 0048ED38    mov         eax,[005AE260];^SResString18:TResStringRec
 0048ED3D    call        LoadStr
 0048ED42    mov         ecx,dword ptr [ebp-20]
 0048ED45    mov         dl,1
 0048ED47    mov         eax,[0048EAAC];EInvalidVectorFile
 0048ED4C    call        Exception.CreateFmt;EInvalidVectorFile.Create
 0048ED51    call        @RaiseExcept
 0048ED56    xor         eax,eax
 0048ED58    pop         edx
 0048ED59    pop         ecx
 0048ED5A    pop         ecx
 0048ED5B    mov         dword ptr fs:[eax],edx
 0048ED5E    push        48ED80
 0048ED63    lea         eax,[ebp-20]
 0048ED66    mov         edx,3
 0048ED6B    call        @LStrArrayClr
 0048ED70    lea         eax,[ebp-4]
 0048ED73    call        @LStrClr
 0048ED78    ret
>0048ED79    jmp         @HandleFinally
>0048ED7E    jmp         0048ED63
 0048ED80    mov         eax,ebx
 0048ED82    pop         esi
 0048ED83    pop         ebx
 0048ED84    mov         esp,ebp
 0048ED86    pop         ebp
 0048ED87    ret
end;*}

//0048ED98
constructor TBaseMeshObject.Create;
begin
{*
 0048ED98    push        ebx
 0048ED99    push        esi
 0048ED9A    test        dl,dl
>0048ED9C    je          0048EDA6
 0048ED9E    add         esp,0FFFFFFF0
 0048EDA1    call        @ClassCreate
 0048EDA6    mov         ebx,edx
 0048EDA8    mov         esi,eax
 0048EDAA    mov         dl,1
 0048EDAC    mov         eax,[00467A00];TAffineVectorList
 0048EDB1    call        TAffineVectorList.Create;TAffineVectorList.Create
 0048EDB6    mov         dword ptr [esi+0C],eax;TBaseMeshObject.?fC:TAffineVectorList
 0048EDB9    mov         dl,1
 0048EDBB    mov         eax,[00467A00];TAffineVectorList
 0048EDC0    call        TAffineVectorList.Create;TAffineVectorList.Create
 0048EDC5    mov         dword ptr [esi+10],eax;TBaseMeshObject.?f10:TAffineVectorList
 0048EDC8    mov         byte ptr [esi+14],1;TBaseMeshObject.?f14:byte
 0048EDCC    xor         edx,edx
 0048EDCE    mov         eax,esi
 0048EDD0    call        004666E0
 0048EDD5    mov         eax,esi
 0048EDD7    test        bl,bl
>0048EDD9    je          0048EDEA
 0048EDDB    call        @AfterConstruction
 0048EDE0    pop         dword ptr fs:[0]
 0048EDE7    add         esp,0C
 0048EDEA    mov         eax,esi
 0048EDEC    pop         esi
 0048EDED    pop         ebx
 0048EDEE    ret
*}
end;

//0048EDF0
destructor TBaseMeshObject.Destroy;
begin
{*
 0048EDF0    push        ebx
 0048EDF1    push        esi
 0048EDF2    call        @BeforeDestruction
 0048EDF7    mov         ebx,edx
 0048EDF9    mov         esi,eax
 0048EDFB    mov         eax,dword ptr [esi+10];TBaseMeshObject.?f10:TAffineVectorList
 0048EDFE    call        TObject.Free
 0048EE03    mov         eax,dword ptr [esi+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048EE06    call        TObject.Free
 0048EE0B    mov         edx,ebx
 0048EE0D    and         dl,0FC
 0048EE10    mov         eax,esi
 0048EE12    call        TPersistentObject.Destroy
 0048EE17    test        bl,bl
>0048EE19    jle         0048EE22
 0048EE1B    mov         eax,esi
 0048EE1D    call        @ClassDestroy
 0048EE22    pop         esi
 0048EE23    pop         ebx
 0048EE24    ret
*}
end;

//0048EE28
{*procedure TBaseMeshObject.sub_00466814(?:?);
begin
 0048EE28    push        ebx
 0048EE29    push        esi
 0048EE2A    push        edi
 0048EE2B    mov         edi,edx
 0048EE2D    mov         ebx,eax
 0048EE2F    mov         edx,edi
 0048EE31    mov         eax,ebx
 0048EE33    call        TPersistentObject.sub_00466814
 0048EE38    mov         edx,1
 0048EE3D    mov         eax,edi
 0048EE3F    mov         ecx,dword ptr [eax]
 0048EE41    call        dword ptr [ecx+8]
 0048EE44    mov         edx,dword ptr [ebx+8];TBaseMeshObject.?f8:String
 0048EE47    mov         eax,edi
 0048EE49    mov         ecx,dword ptr [eax]
 0048EE4B    call        dword ptr [ecx+10]
 0048EE4E    mov         edx,edi
 0048EE50    mov         eax,dword ptr [ebx+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048EE53    mov         si,0FFFC
 0048EE57    call        @CallDynaInst;TBaseVectorList.sub_00466814
 0048EE5C    mov         edx,edi
 0048EE5E    mov         eax,dword ptr [ebx+10];TBaseMeshObject.?f10:TAffineVectorList
 0048EE61    mov         si,0FFFC
 0048EE65    call        @CallDynaInst;TBaseVectorList.sub_00466814
 0048EE6A    mov         dl,byte ptr [ebx+14];TBaseMeshObject.?f14:byte
 0048EE6D    mov         eax,edi
 0048EE6F    mov         ecx,dword ptr [eax]
 0048EE71    call        dword ptr [ecx+0C]
 0048EE74    pop         edi
 0048EE75    pop         esi
 0048EE76    pop         ebx
 0048EE77    ret
end;*}

//0048EE78
{*procedure TBaseMeshObject.sub_00466894(?:?);
begin
 0048EE78    push        ebp
 0048EE79    mov         ebp,esp
 0048EE7B    add         esp,0FFFFFFF8
 0048EE7E    push        ebx
 0048EE7F    push        esi
 0048EE80    push        edi
 0048EE81    xor         ecx,ecx
 0048EE83    mov         dword ptr [ebp-8],ecx
 0048EE86    mov         edi,edx
 0048EE88    mov         ebx,eax
 0048EE8A    xor         eax,eax
 0048EE8C    push        ebp
 0048EE8D    push        48EF1C
 0048EE92    push        dword ptr fs:[eax]
 0048EE95    mov         dword ptr fs:[eax],esp
 0048EE98    mov         edx,edi
 0048EE9A    mov         eax,ebx
 0048EE9C    call        TPersistentObject.sub_00466894
 0048EEA1    mov         eax,edi
 0048EEA3    mov         edx,dword ptr [eax]
 0048EEA5    call        dword ptr [edx+0C]
 0048EEA8    mov         dword ptr [ebp-4],eax
 0048EEAB    mov         eax,dword ptr [ebp-4]
 0048EEAE    sub         eax,2
>0048EEB1    jae         0048EEFC
 0048EEB3    lea         edx,[ebp-8]
 0048EEB6    mov         eax,edi
 0048EEB8    mov         ecx,dword ptr [eax]
 0048EEBA    call        dword ptr [ecx+14]
 0048EEBD    mov         edx,dword ptr [ebp-8]
 0048EEC0    lea         eax,[ebx+8];TBaseMeshObject.?f8:String
 0048EEC3    call        @LStrAsg
 0048EEC8    mov         edx,edi
 0048EECA    mov         eax,dword ptr [ebx+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048EECD    mov         si,0FFFB
 0048EED1    call        @CallDynaInst;TBaseVectorList.sub_00466894
 0048EED6    mov         edx,edi
 0048EED8    mov         eax,dword ptr [ebx+10];TBaseMeshObject.?f10:TAffineVectorList
 0048EEDB    mov         si,0FFFB
 0048EEDF    call        @CallDynaInst;TBaseVectorList.sub_00466894
 0048EEE4    cmp         dword ptr [ebp-4],1
>0048EEE8    jl          0048EEF6
 0048EEEA    mov         eax,edi
 0048EEEC    mov         edx,dword ptr [eax]
 0048EEEE    call        dword ptr [edx+10]
 0048EEF1    mov         byte ptr [ebx+14],al;TBaseMeshObject.?f14:byte
>0048EEF4    jmp         0048EF06
 0048EEF6    mov         byte ptr [ebx+14],1;TBaseMeshObject.?f14:byte
>0048EEFA    jmp         0048EF06
 0048EEFC    mov         edx,dword ptr [ebp-4]
 0048EEFF    mov         eax,ebx
 0048EF01    call        00466914
 0048EF06    xor         eax,eax
 0048EF08    pop         edx
 0048EF09    pop         ecx
 0048EF0A    pop         ecx
 0048EF0B    mov         dword ptr fs:[eax],edx
 0048EF0E    push        48EF23
 0048EF13    lea         eax,[ebp-8]
 0048EF16    call        @LStrClr
 0048EF1B    ret
>0048EF1C    jmp         @HandleFinally
>0048EF21    jmp         0048EF13
 0048EF23    pop         edi
 0048EF24    pop         esi
 0048EF25    pop         ebx
 0048EF26    pop         ecx
 0048EF27    pop         ecx
 0048EF28    pop         ebp
 0048EF29    ret
end;*}

//0048EF2C
procedure TBaseMeshObject.sub_0048EF2C;
begin
{*
 0048EF2C    push        ebx
 0048EF2D    mov         ebx,eax
 0048EF2F    mov         eax,dword ptr [ebx+10];TBaseMeshObject.?f10:TAffineVectorList
 0048EF32    call        00468280
 0048EF37    mov         eax,dword ptr [ebx+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048EF3A    call        00468280
 0048EF3F    pop         ebx
 0048EF40    ret
*}
end;

//0048EF44
{*procedure TBaseMeshObject.sub_0048EF44(?:?; ?:?);
begin
 0048EF44    push        ebx
 0048EF45    push        esi
 0048EF46    push        edi
 0048EF47    push        ebp
 0048EF48    add         esp,0FFFFFFF4
 0048EF4B    mov         ebp,ecx
 0048EF4D    mov         edi,edx
 0048EF4F    mov         ebx,eax
 0048EF51    mov         edx,esp
 0048EF53    mov         eax,dword ptr [ebx+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048EF56    mov         si,0FFF3
 0048EF5A    call        @CallDynaInst;TBaseVectorList.sub_00468434
 0048EF5F    mov         edx,esp
 0048EF61    mov         eax,edi
 0048EF63    call        0045CADC
 0048EF68    mov         eax,dword ptr [ebx+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048EF6B    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 0048EF6E    add         dword ptr [ebp],eax
 0048EF71    add         esp,0C
 0048EF74    pop         ebp
 0048EF75    pop         edi
 0048EF76    pop         esi
 0048EF77    pop         ebx
 0048EF78    ret
end;*}

//0048EF7C
procedure TBaseMeshObject.sub_0048EF7C;
begin
{*
 0048EF7C    push        esi
 0048EF7D    mov         esi,eax
 0048EF7F    mov         eax,dword ptr [esi+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048EF82    mov         si,0FFF0
 0048EF86    call        @CallDynaInst;TAffineVectorList.sub_00468578
 0048EF8B    pop         esi
 0048EF8C    ret
*}
end;

//0048EF90
{*function sub_0048EF90(?:?; ?:?; ?:?):?;
begin
 0048EF90    push        ebp
 0048EF91    mov         ebp,esp
 0048EF93    push        ecx
 0048EF94    push        ebx
 0048EF95    push        esi
 0048EF96    mov         dword ptr [ebp-4],edx
 0048EF99    mov         esi,eax
 0048EF9B    mov         eax,dword ptr [ebp+8]
 0048EF9E    mov         eax,dword ptr [eax-4]
 0048EFA1    mov         edx,esi
 0048EFA3    call        00469260
 0048EFA8    mov         ebx,eax
 0048EFAA    mov         eax,dword ptr [ebp+8]
 0048EFAD    cmp         ebx,dword ptr [eax-8]
>0048EFB0    jge         0048EFD7
 0048EFB2    mov         edx,dword ptr ds:[5AE438];^gvar_005ACF18
 0048EFB8    mov         eax,dword ptr [ebp+8]
 0048EFBB    mov         eax,dword ptr [eax-0C]
 0048EFBE    mov         eax,dword ptr [eax+10]
 0048EFC1    call        00468A90
 0048EFC6    mov         ebx,eax
 0048EFC8    mov         eax,dword ptr [ebp+8]
 0048EFCB    mov         eax,dword ptr [eax-4]
 0048EFCE    mov         ecx,ebx
 0048EFD0    mov         edx,esi
 0048EFD2    call        00469268
 0048EFD7    lea         eax,[ebx+ebx*2]
 0048EFDA    mov         edx,dword ptr [ebp+8]
 0048EFDD    mov         edx,dword ptr [edx-0C]
 0048EFE0    mov         edx,dword ptr [edx+10]
 0048EFE3    mov         edx,dword ptr [edx+24]
 0048EFE6    lea         eax,[edx+eax*4]
 0048EFE9    mov         edx,dword ptr [ebp-4]
 0048EFEC    call        0045CADC
 0048EFF1    mov         eax,ebx
 0048EFF3    pop         esi
 0048EFF4    pop         ebx
 0048EFF5    pop         ecx
 0048EFF6    pop         ebp
 0048EFF7    ret
end;*}

//0048EFF8
{*procedure sub_0048EFF8(?:TMeshMorphTarget; ?:TIntegerList; ?:?; ?:?);
begin
 0048EFF8    push        ebp
 0048EFF9    mov         ebp,esp
 0048EFFB    add         esp,0FFFFFFBC
 0048EFFE    push        ebx
 0048EFFF    push        esi
 0048F000    push        edi
 0048F001    mov         ebx,ecx
 0048F003    mov         esi,edx
 0048F005    mov         dword ptr [ebp-0C],eax
 0048F008    mov         edi,dword ptr [ebp+8]
 0048F00B    test        edi,edi
>0048F00D    jne         0048F245
 0048F013    mov         eax,dword ptr [ebp-0C]
 0048F016    mov         eax,dword ptr [eax+10]
 0048F019    call        00468280
 0048F01E    mov         eax,dword ptr [ebp-0C]
 0048F021    mov         eax,dword ptr [eax+0C]
 0048F024    mov         edx,dword ptr [eax+8]
 0048F027    mov         eax,dword ptr [ebp-0C]
 0048F02A    mov         eax,dword ptr [eax+10]
 0048F02D    call        00468118
 0048F032    sub         bl,1
>0048F035    jb          0048F042
>0048F037    je          0048F103
>0048F03D    jmp         0048F21D
 0048F042    xor         ebx,ebx
>0048F044    jmp         0048F0F0
 0048F049    mov         eax,dword ptr [ebp-0C]
 0048F04C    mov         edi,dword ptr [eax+0C]
 0048F04F    lea         eax,[ebp-20]
 0048F052    push        eax
 0048F053    lea         edx,[ebx+2]
 0048F056    mov         eax,esi
 0048F058    call        00469260
 0048F05D    mov         edx,eax
 0048F05F    lea         ecx,[ebp-2C]
 0048F062    mov         eax,edi
 0048F064    call        00468C18
 0048F069    lea         eax,[ebp-2C]
 0048F06C    push        eax
 0048F06D    lea         edx,[ebx+1]
 0048F070    mov         eax,esi
 0048F072    call        00469260
 0048F077    mov         edx,eax
 0048F079    lea         ecx,[ebp-38]
 0048F07C    mov         eax,edi
 0048F07E    call        00468C18
 0048F083    lea         eax,[ebp-38]
 0048F086    push        eax
 0048F087    lea         edx,[ebx]
 0048F089    mov         eax,esi
 0048F08B    call        00469260
 0048F090    mov         edx,eax
 0048F092    lea         ecx,[ebp-44]
 0048F095    mov         eax,edi
 0048F097    call        00468C18
 0048F09C    lea         eax,[ebp-44]
 0048F09F    pop         edx
 0048F0A0    pop         ecx
 0048F0A1    call        0045ECD4
 0048F0A6    mov         eax,dword ptr [ebp-0C]
 0048F0A9    mov         edi,dword ptr [eax+10]
 0048F0AC    lea         edx,[ebx]
 0048F0AE    mov         eax,esi
 0048F0B0    call        00469260
 0048F0B5    mov         edx,eax
 0048F0B7    lea         ecx,[ebp-20]
 0048F0BA    mov         eax,edi
 0048F0BC    call        00468CE0
 0048F0C1    lea         edx,[ebx+1]
 0048F0C4    mov         eax,esi
 0048F0C6    call        00469260
 0048F0CB    mov         edx,eax
 0048F0CD    lea         ecx,[ebp-20]
 0048F0D0    mov         eax,edi
 0048F0D2    call        00468CE0
 0048F0D7    lea         edx,[ebx+2]
 0048F0DA    mov         eax,esi
 0048F0DC    call        00469260
 0048F0E1    mov         edx,eax
 0048F0E3    lea         ecx,[ebp-20]
 0048F0E6    mov         eax,edi
 0048F0E8    call        00468CE0
 0048F0ED    add         ebx,3
 0048F0F0    mov         eax,dword ptr [esi+8]
 0048F0F3    sub         eax,3
 0048F0F6    cmp         ebx,eax
>0048F0F8    jle         0048F049
>0048F0FE    jmp         0048F231
 0048F103    xor         ebx,ebx
>0048F105    jmp         0048F20D
 0048F10A    mov         eax,dword ptr [ebp-0C]
 0048F10D    mov         edi,dword ptr [eax+0C]
 0048F110    test        bl,1
>0048F113    jne         0048F16E
 0048F115    lea         eax,[ebp-20]
 0048F118    push        eax
 0048F119    lea         edx,[ebx+2]
 0048F11C    mov         eax,esi
 0048F11E    call        00469260
 0048F123    mov         edx,eax
 0048F125    lea         ecx,[ebp-2C]
 0048F128    mov         eax,edi
 0048F12A    call        00468C18
 0048F12F    lea         eax,[ebp-2C]
 0048F132    push        eax
 0048F133    lea         edx,[ebx+1]
 0048F136    mov         eax,esi
 0048F138    call        00469260
 0048F13D    mov         edx,eax
 0048F13F    lea         ecx,[ebp-38]
 0048F142    mov         eax,edi
 0048F144    call        00468C18
 0048F149    lea         eax,[ebp-38]
 0048F14C    push        eax
 0048F14D    lea         edx,[ebx]
 0048F14F    mov         eax,esi
 0048F151    call        00469260
 0048F156    mov         edx,eax
 0048F158    lea         ecx,[ebp-44]
 0048F15B    mov         eax,edi
 0048F15D    call        00468C18
 0048F162    lea         eax,[ebp-44]
 0048F165    pop         edx
 0048F166    pop         ecx
 0048F167    call        0045ECD4
>0048F16C    jmp         0048F1C5
 0048F16E    lea         eax,[ebp-20]
 0048F171    push        eax
 0048F172    lea         edx,[ebx+1]
 0048F175    mov         eax,esi
 0048F177    call        00469260
 0048F17C    mov         edx,eax
 0048F17E    lea         ecx,[ebp-2C]
 0048F181    mov         eax,edi
 0048F183    call        00468C18
 0048F188    lea         eax,[ebp-2C]
 0048F18B    push        eax
 0048F18C    lea         edx,[ebx+2]
 0048F18F    mov         eax,esi
 0048F191    call        00469260
 0048F196    mov         edx,eax
 0048F198    lea         ecx,[ebp-38]
 0048F19B    mov         eax,edi
 0048F19D    call        00468C18
 0048F1A2    lea         eax,[ebp-38]
 0048F1A5    push        eax
 0048F1A6    lea         edx,[ebx]
 0048F1A8    mov         eax,esi
 0048F1AA    call        00469260
 0048F1AF    mov         edx,eax
 0048F1B1    lea         ecx,[ebp-44]
 0048F1B4    mov         eax,edi
 0048F1B6    call        00468C18
 0048F1BB    lea         eax,[ebp-44]
 0048F1BE    pop         edx
 0048F1BF    pop         ecx
 0048F1C0    call        0045ECD4
 0048F1C5    mov         eax,dword ptr [ebp-0C]
 0048F1C8    mov         edi,dword ptr [eax+10]
 0048F1CB    lea         edx,[ebx]
 0048F1CD    mov         eax,esi
 0048F1CF    call        00469260
 0048F1D4    mov         edx,eax
 0048F1D6    lea         ecx,[ebp-20]
 0048F1D9    mov         eax,edi
 0048F1DB    call        00468CE0
 0048F1E0    lea         edx,[ebx+1]
 0048F1E3    mov         eax,esi
 0048F1E5    call        00469260
 0048F1EA    mov         edx,eax
 0048F1EC    lea         ecx,[ebp-20]
 0048F1EF    mov         eax,edi
 0048F1F1    call        00468CE0
 0048F1F6    lea         edx,[ebx+2]
 0048F1F9    mov         eax,esi
 0048F1FB    call        00469260
 0048F200    mov         edx,eax
 0048F202    lea         ecx,[ebp-20]
 0048F205    mov         eax,edi
 0048F207    call        00468CE0
 0048F20C    inc         ebx
 0048F20D    mov         eax,dword ptr [esi+8]
 0048F210    sub         eax,3
 0048F213    cmp         ebx,eax
>0048F215    jle         0048F10A
>0048F21B    jmp         0048F231
 0048F21D    mov         ecx,848
 0048F222    mov         edx,48F4E8;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 0048F227    mov         eax,48F52C;'Assertion failure'
 0048F22C    call        @Assert
 0048F231    mov         eax,dword ptr [ebp-0C]
 0048F234    mov         eax,dword ptr [eax+10]
 0048F237    mov         si,0FFF2
 0048F23B    call        @CallDynaInst
>0048F240    jmp         0048F4D5
 0048F245    mov         eax,dword ptr [ebp-0C]
 0048F248    mov         eax,dword ptr [eax+10]
 0048F24B    mov         eax,dword ptr [eax+8]
 0048F24E    mov         dword ptr [ebp-8],eax
 0048F251    mov         dl,1
 0048F253    mov         eax,[00467C18];TIntegerList
 0048F258    call        TIntegerList.Create;TIntegerList.Create
 0048F25D    mov         dword ptr [ebp-4],eax
 0048F260    mov         eax,dword ptr [ebp-0C]
 0048F263    mov         eax,dword ptr [eax+0C]
 0048F266    mov         eax,dword ptr [eax+8]
 0048F269    push        eax
 0048F26A    xor         ecx,ecx
 0048F26C    or          edx,0FFFFFFFF
 0048F26F    mov         eax,dword ptr [ebp-4]
 0048F272    call        00469284
 0048F277    sub         bl,1
>0048F27A    jb          0048F287
>0048F27C    je          0048F35D
>0048F282    jmp         0048F48F
 0048F287    xor         ebx,ebx
>0048F289    jmp         0048F34A
 0048F28E    mov         eax,dword ptr [ebp-0C]
 0048F291    mov         eax,dword ptr [eax+0C]
 0048F294    mov         dword ptr [ebp-10],eax
 0048F297    lea         eax,[ebp-20]
 0048F29A    push        eax
 0048F29B    lea         edx,[ebx+2]
 0048F29E    mov         eax,esi
 0048F2A0    call        00469260
 0048F2A5    mov         edx,eax
 0048F2A7    lea         ecx,[ebp-2C]
 0048F2AA    mov         eax,dword ptr [ebp-10]
 0048F2AD    call        00468C18
 0048F2B2    lea         eax,[ebp-2C]
 0048F2B5    push        eax
 0048F2B6    lea         edx,[ebx+1]
 0048F2B9    mov         eax,esi
 0048F2BB    call        00469260
 0048F2C0    mov         edx,eax
 0048F2C2    lea         ecx,[ebp-38]
 0048F2C5    mov         eax,dword ptr [ebp-10]
 0048F2C8    call        00468C18
 0048F2CD    lea         eax,[ebp-38]
 0048F2D0    push        eax
 0048F2D1    lea         edx,[ebx]
 0048F2D3    mov         eax,esi
 0048F2D5    call        00469260
 0048F2DA    mov         edx,eax
 0048F2DC    lea         ecx,[ebp-44]
 0048F2DF    mov         eax,dword ptr [ebp-10]
 0048F2E2    call        00468C18
 0048F2E7    lea         eax,[ebp-44]
 0048F2EA    pop         edx
 0048F2EB    pop         ecx
 0048F2EC    call        0045ECD4
 0048F2F1    push        ebp
 0048F2F2    lea         edx,[ebx]
 0048F2F4    mov         eax,esi
 0048F2F6    call        00469260
 0048F2FB    lea         edx,[ebp-20]
 0048F2FE    call        0048EF90
 0048F303    pop         ecx
 0048F304    mov         edx,eax
 0048F306    mov         eax,edi
 0048F308    call        004691B4
 0048F30D    push        ebp
 0048F30E    lea         edx,[ebx+1]
 0048F311    mov         eax,esi
 0048F313    call        00469260
 0048F318    lea         edx,[ebp-20]
 0048F31B    call        0048EF90
 0048F320    pop         ecx
 0048F321    mov         edx,eax
 0048F323    mov         eax,edi
 0048F325    call        004691B4
 0048F32A    push        ebp
 0048F32B    lea         edx,[ebx+2]
 0048F32E    mov         eax,esi
 0048F330    call        00469260
 0048F335    lea         edx,[ebp-20]
 0048F338    call        0048EF90
 0048F33D    pop         ecx
 0048F33E    mov         edx,eax
 0048F340    mov         eax,edi
 0048F342    call        004691B4
 0048F347    add         ebx,3
 0048F34A    mov         eax,dword ptr [esi+8]
 0048F34D    sub         eax,3
 0048F350    cmp         ebx,eax
>0048F352    jle         0048F28E
>0048F358    jmp         0048F4A3
 0048F35D    xor         ebx,ebx
>0048F35F    jmp         0048F47F
 0048F364    mov         eax,dword ptr [ebp-0C]
 0048F367    mov         eax,dword ptr [eax+0C]
 0048F36A    mov         dword ptr [ebp-14],eax
 0048F36D    test        bl,1
>0048F370    jne         0048F3CE
 0048F372    lea         eax,[ebp-20]
 0048F375    push        eax
 0048F376    lea         edx,[ebx+2]
 0048F379    mov         eax,esi
 0048F37B    call        00469260
 0048F380    mov         edx,eax
 0048F382    lea         ecx,[ebp-2C]
 0048F385    mov         eax,dword ptr [ebp-14]
 0048F388    call        00468C18
 0048F38D    lea         eax,[ebp-2C]
 0048F390    push        eax
 0048F391    lea         edx,[ebx+1]
 0048F394    mov         eax,esi
 0048F396    call        00469260
 0048F39B    mov         edx,eax
 0048F39D    lea         ecx,[ebp-38]
 0048F3A0    mov         eax,dword ptr [ebp-14]
 0048F3A3    call        00468C18
 0048F3A8    lea         eax,[ebp-38]
 0048F3AB    push        eax
 0048F3AC    lea         edx,[ebx]
 0048F3AE    mov         eax,esi
 0048F3B0    call        00469260
 0048F3B5    mov         edx,eax
 0048F3B7    lea         ecx,[ebp-44]
 0048F3BA    mov         eax,dword ptr [ebp-14]
 0048F3BD    call        00468C18
 0048F3C2    lea         eax,[ebp-44]
 0048F3C5    pop         edx
 0048F3C6    pop         ecx
 0048F3C7    call        0045ECD4
>0048F3CC    jmp         0048F428
 0048F3CE    lea         eax,[ebp-20]
 0048F3D1    push        eax
 0048F3D2    lea         edx,[ebx+1]
 0048F3D5    mov         eax,esi
 0048F3D7    call        00469260
 0048F3DC    mov         edx,eax
 0048F3DE    lea         ecx,[ebp-2C]
 0048F3E1    mov         eax,dword ptr [ebp-14]
 0048F3E4    call        00468C18
 0048F3E9    lea         eax,[ebp-2C]
 0048F3EC    push        eax
 0048F3ED    lea         edx,[ebx+2]
 0048F3F0    mov         eax,esi
 0048F3F2    call        00469260
 0048F3F7    mov         edx,eax
 0048F3F9    lea         ecx,[ebp-38]
 0048F3FC    mov         eax,dword ptr [ebp-14]
 0048F3FF    call        00468C18
 0048F404    lea         eax,[ebp-38]
 0048F407    push        eax
 0048F408    lea         edx,[ebx]
 0048F40A    mov         eax,esi
 0048F40C    call        00469260
 0048F411    mov         edx,eax
 0048F413    lea         ecx,[ebp-44]
 0048F416    mov         eax,dword ptr [ebp-14]
 0048F419    call        00468C18
 0048F41E    lea         eax,[ebp-44]
 0048F421    pop         edx
 0048F422    pop         ecx
 0048F423    call        0045ECD4
 0048F428    push        ebp
 0048F429    lea         edx,[ebx]
 0048F42B    mov         eax,esi
 0048F42D    call        00469260
 0048F432    lea         edx,[ebp-20]
 0048F435    call        0048EF90
 0048F43A    pop         ecx
 0048F43B    mov         edx,eax
 0048F43D    mov         eax,edi
 0048F43F    call        004691B4
 0048F444    push        ebp
 0048F445    lea         edx,[ebx+1]
 0048F448    mov         eax,esi
 0048F44A    call        00469260
 0048F44F    lea         edx,[ebp-20]
 0048F452    call        0048EF90
 0048F457    pop         ecx
 0048F458    mov         edx,eax
 0048F45A    mov         eax,edi
 0048F45C    call        004691B4
 0048F461    push        ebp
 0048F462    lea         edx,[ebx+2]
 0048F465    mov         eax,esi
 0048F467    call        00469260
 0048F46C    lea         edx,[ebp-20]
 0048F46F    call        0048EF90
 0048F474    pop         ecx
 0048F475    mov         edx,eax
 0048F477    mov         eax,edi
 0048F479    call        004691B4
 0048F47E    inc         ebx
 0048F47F    mov         eax,dword ptr [esi+8]
 0048F482    sub         eax,3
 0048F485    cmp         ebx,eax
>0048F487    jle         0048F364
>0048F48D    jmp         0048F4A3
 0048F48F    mov         ecx,86D
 0048F494    mov         edx,48F4E8;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 0048F499    mov         eax,48F52C;'Assertion failure'
 0048F49E    call        @Assert
 0048F4A3    mov         ebx,dword ptr [ebp-8]
 0048F4A6    mov         eax,dword ptr [ebp-0C]
 0048F4A9    mov         eax,dword ptr [eax+10]
 0048F4AC    mov         esi,dword ptr [eax+8]
 0048F4AF    dec         esi
 0048F4B0    sub         esi,ebx
>0048F4B2    jl          0048F4CD
 0048F4B4    inc         esi
 0048F4B5    lea         eax,[ebx+ebx*2]
 0048F4B8    mov         edx,dword ptr [ebp-0C]
 0048F4BB    mov         edx,dword ptr [edx+10]
 0048F4BE    mov         edx,dword ptr [edx+24]
 0048F4C1    lea         eax,[edx+eax*4]
 0048F4C4    call        0045D460
 0048F4C9    inc         ebx
 0048F4CA    dec         esi
>0048F4CB    jne         0048F4B5
 0048F4CD    mov         eax,dword ptr [ebp-4]
 0048F4D0    call        TObject.Free
 0048F4D5    pop         edi
 0048F4D6    pop         esi
 0048F4D7    pop         ebx
 0048F4D8    mov         esp,ebp
 0048F4DA    pop         ebp
 0048F4DB    ret         4
end;*}

//0048F540
{*procedure TBaseMeshObject.sub_0048F540(?:?; ?:?);
begin
 0048F540    push        ebx
 0048F541    push        esi
 0048F542    push        edi
 0048F543    push        ebp
 0048F544    mov         edi,ecx
 0048F546    mov         ebx,eax
 0048F548    mov         dl,1
 0048F54A    mov         eax,[00467A00];TAffineVectorList
 0048F54F    call        TAffineVectorList.Create;TAffineVectorList.Create
 0048F554    mov         esi,eax
 0048F556    mov         ecx,dword ptr [ebx+0C];TBaseMeshObject.?fC:TAffineVectorList
 0048F559    mov         eax,dword ptr [ecx+8];TAffineVectorList.?f8:dword
 0048F55C    mov         ebp,3
 0048F561    cdq
 0048F562    idiv        eax,ebp
 0048F564    test        edx,edx
>0048F566    jne         0048F57F
 0048F568    mov         edx,ecx
 0048F56A    mov         eax,esi
 0048F56C    mov         ecx,dword ptr [eax]
 0048F56E    call        dword ptr [ecx+8];TAffineVectorList.Assign
 0048F571    test        edi,edi
>0048F573    je          0048F57F
 0048F575    mov         edx,dword ptr [ebx+10];TBaseMeshObject.?f10:TAffineVectorList
 0048F578    mov         eax,edi
 0048F57A    mov         ecx,dword ptr [eax]
 0048F57C    call        dword ptr [ecx+8]
 0048F57F    mov         eax,esi
 0048F581    pop         ebp
 0048F582    pop         edi
 0048F583    pop         esi
 0048F584    pop         ebx
 0048F585    ret
end;*}

//0048F588
procedure sub_0048F588(?:TBaseMeshObject);
begin
{*
 0048F588    mov         eax,dword ptr [eax+0C]
 0048F58B    mov         ecx,dword ptr [eax]
 0048F58D    call        dword ptr [ecx+8]
 0048F590    ret
*}
end;

//0048F594
procedure sub_0048F594(?:TBaseMeshObject);
begin
{*
 0048F594    mov         eax,dword ptr [eax+10]
 0048F597    mov         ecx,dword ptr [eax]
 0048F599    call        dword ptr [ecx+8]
 0048F59C    ret
*}
end;

//0048F5A0
constructor TSkeletonFrame.Create;
begin
{*
 0048F5A0    push        ebx
 0048F5A1    push        esi
 0048F5A2    test        dl,dl
>0048F5A4    je          0048F5AE
 0048F5A6    add         esp,0FFFFFFF0
 0048F5A9    call        @ClassCreate
 0048F5AE    mov         ebx,edx
 0048F5B0    mov         esi,eax
 0048F5B2    xor         edx,edx
 0048F5B4    mov         eax,esi
 0048F5B6    call        004666E0
 0048F5BB    mov         dl,1
 0048F5BD    mov         eax,[00467A00];TAffineVectorList
 0048F5C2    call        TAffineVectorList.Create;TAffineVectorList.Create
 0048F5C7    mov         dword ptr [esi+10],eax;TSkeletonFrame.?f10:TAffineVectorList
 0048F5CA    mov         dl,1
 0048F5CC    mov         eax,[00467A00];TAffineVectorList
 0048F5D1    call        TAffineVectorList.Create;TAffineVectorList.Create
 0048F5D6    mov         dword ptr [esi+14],eax;TSkeletonFrame.?f14:TAffineVectorList
 0048F5D9    mov         dl,1
 0048F5DB    mov         eax,[00467E04];TQuaternionList
 0048F5E0    call        TQuaternionList.Create;TQuaternionList.Create
 0048F5E5    mov         dword ptr [esi+18],eax;TSkeletonFrame.?f18:TQuaternionList
 0048F5E8    mov         byte ptr [esi+20],0;TSkeletonFrame.?f20:byte
 0048F5EC    mov         eax,esi
 0048F5EE    test        bl,bl
>0048F5F0    je          0048F601
 0048F5F2    call        @AfterConstruction
 0048F5F7    pop         dword ptr fs:[0]
 0048F5FE    add         esp,0C
 0048F601    mov         eax,esi
 0048F603    pop         esi
 0048F604    pop         ebx
 0048F605    ret
*}
end;

//0048F608
destructor TSkeletonFrame.Destroy;
begin
{*
 0048F608    push        ebx
 0048F609    push        esi
 0048F60A    call        @BeforeDestruction
 0048F60F    mov         ebx,edx
 0048F611    mov         esi,eax
 0048F613    mov         eax,esi
 0048F615    call        0048FA80
 0048F61A    mov         eax,dword ptr [esi+14];TSkeletonFrame.?f14:TAffineVectorList
 0048F61D    call        TObject.Free
 0048F622    mov         eax,dword ptr [esi+10];TSkeletonFrame.?f10:TAffineVectorList
 0048F625    call        TObject.Free
 0048F62A    mov         eax,dword ptr [esi+18];TSkeletonFrame.?f18:TQuaternionList
 0048F62D    call        TObject.Free
 0048F632    mov         edx,ebx
 0048F634    and         dl,0FC
 0048F637    mov         eax,esi
 0048F639    call        TPersistentObject.Destroy
 0048F63E    test        bl,bl
>0048F640    jle         0048F649
 0048F642    mov         eax,esi
 0048F644    call        @ClassDestroy
 0048F649    pop         esi
 0048F64A    pop         ebx
 0048F64B    ret
*}
end;

//0048F64C
{*procedure TSkeletonFrame.sub_00466814(?:?);
begin
 0048F64C    push        ebx
 0048F64D    push        esi
 0048F64E    push        edi
 0048F64F    mov         edi,edx
 0048F651    mov         ebx,eax
 0048F653    mov         edx,edi
 0048F655    mov         eax,ebx
 0048F657    call        TPersistentObject.sub_00466814
 0048F65C    mov         edx,1
 0048F661    mov         eax,edi
 0048F663    mov         ecx,dword ptr [eax]
 0048F665    call        dword ptr [ecx+8]
 0048F668    mov         edx,dword ptr [ebx+0C];TSkeletonFrame.?fC:String
 0048F66B    mov         eax,edi
 0048F66D    mov         ecx,dword ptr [eax]
 0048F66F    call        dword ptr [ecx+10]
 0048F672    mov         edx,edi
 0048F674    mov         eax,dword ptr [ebx+10];TSkeletonFrame.?f10:TAffineVectorList
 0048F677    mov         si,0FFFC
 0048F67B    call        @CallDynaInst;TBaseVectorList.sub_00466814
 0048F680    mov         edx,edi
 0048F682    mov         eax,dword ptr [ebx+14];TSkeletonFrame.?f14:TAffineVectorList
 0048F685    mov         si,0FFFC
 0048F689    call        @CallDynaInst;TBaseVectorList.sub_00466814
 0048F68E    mov         edx,edi
 0048F690    mov         eax,dword ptr [ebx+18];TSkeletonFrame.?f18:TQuaternionList
 0048F693    mov         si,0FFFC
 0048F697    call        @CallDynaInst;TBaseVectorList.sub_00466814
 0048F69C    xor         edx,edx
 0048F69E    mov         dl,byte ptr [ebx+20];TSkeletonFrame.?f20:byte
 0048F6A1    mov         eax,edi
 0048F6A3    mov         ecx,dword ptr [eax]
 0048F6A5    call        dword ptr [ecx+8]
 0048F6A8    pop         edi
 0048F6A9    pop         esi
 0048F6AA    pop         ebx
 0048F6AB    ret
end;*}

//0048F6AC
{*procedure TSkeletonFrame.sub_00466894(?:?);
begin
 0048F6AC    push        ebp
 0048F6AD    mov         ebp,esp
 0048F6AF    add         esp,0FFFFFFF8
 0048F6B2    push        ebx
 0048F6B3    push        esi
 0048F6B4    push        edi
 0048F6B5    xor         ecx,ecx
 0048F6B7    mov         dword ptr [ebp-8],ecx
 0048F6BA    mov         edi,edx
 0048F6BC    mov         ebx,eax
 0048F6BE    xor         eax,eax
 0048F6C0    push        ebp
 0048F6C1    push        48F763
 0048F6C6    push        dword ptr fs:[eax]
 0048F6C9    mov         dword ptr fs:[eax],esp
 0048F6CC    mov         edx,edi
 0048F6CE    mov         eax,ebx
 0048F6D0    call        TPersistentObject.sub_00466894
 0048F6D5    mov         eax,edi
 0048F6D7    mov         edx,dword ptr [eax]
 0048F6D9    call        dword ptr [edx+0C]
 0048F6DC    mov         dword ptr [ebp-4],eax
 0048F6DF    cmp         dword ptr [ebp-4],0
>0048F6E3    je          0048F6EB
 0048F6E5    cmp         dword ptr [ebp-4],1
>0048F6E9    jne         0048F73C
 0048F6EB    lea         edx,[ebp-8]
 0048F6EE    mov         eax,edi
 0048F6F0    mov         ecx,dword ptr [eax]
 0048F6F2    call        dword ptr [ecx+14]
 0048F6F5    mov         edx,dword ptr [ebp-8]
 0048F6F8    lea         eax,[ebx+0C];TSkeletonFrame.?fC:String
 0048F6FB    call        @LStrAsg
 0048F700    mov         edx,edi
 0048F702    mov         eax,dword ptr [ebx+10];TSkeletonFrame.?f10:TAffineVectorList
 0048F705    mov         si,0FFFB
 0048F709    call        @CallDynaInst;TBaseVectorList.sub_00466894
 0048F70E    mov         edx,edi
 0048F710    mov         eax,dword ptr [ebx+14];TSkeletonFrame.?f14:TAffineVectorList
 0048F713    mov         si,0FFFB
 0048F717    call        @CallDynaInst;TBaseVectorList.sub_00466894
 0048F71C    cmp         dword ptr [ebp-4],1
>0048F720    jne         0048F746
 0048F722    mov         edx,edi
 0048F724    mov         eax,dword ptr [ebx+18];TSkeletonFrame.?f18:TQuaternionList
 0048F727    mov         si,0FFFB
 0048F72B    call        @CallDynaInst;TBaseVectorList.sub_00466894
 0048F730    mov         eax,edi
 0048F732    mov         edx,dword ptr [eax]
 0048F734    call        dword ptr [edx+0C]
 0048F737    mov         byte ptr [ebx+20],al;TSkeletonFrame.?f20:byte
>0048F73A    jmp         0048F746
 0048F73C    mov         edx,dword ptr [ebp-4]
 0048F73F    mov         eax,ebx
 0048F741    call        00466914
 0048F746    mov         eax,ebx
 0048F748    call        0048FA80
 0048F74D    xor         eax,eax
 0048F74F    pop         edx
 0048F750    pop         ecx
 0048F751    pop         ecx
 0048F752    mov         dword ptr fs:[eax],edx
 0048F755    push        48F76A
 0048F75A    lea         eax,[ebp-8]
 0048F75D    call        @LStrClr
 0048F762    ret
>0048F763    jmp         @HandleFinally
>0048F768    jmp         0048F75A
 0048F76A    pop         edi
 0048F76B    pop         esi
 0048F76C    pop         ebx
 0048F76D    pop         ecx
 0048F76E    pop         ecx
 0048F76F    pop         ebp
 0048F770    ret
end;*}

//0048F774
{*procedure sub_0048F774(?:?);
begin
 0048F774    push        ebx
 0048F775    push        esi
 0048F776    push        edi
 0048F777    add         esp,0FFFFFF1C
 0048F77D    mov         ebx,eax
 0048F77F    cmp         dword ptr [ebx+1C],0
>0048F783    jne         0048FA6F
 0048F789    mov         al,byte ptr [ebx+20]
 0048F78C    sub         al,1
>0048F78E    jb          0048F79B
>0048F790    je          0048F9AD
>0048F796    jmp         0048FA6F
 0048F79B    mov         eax,dword ptr [ebx+14]
 0048F79E    mov         eax,dword ptr [eax+8]
 0048F7A1    shl         eax,6
 0048F7A4    call        AllocMem
 0048F7A9    mov         dword ptr [ebx+1C],eax
 0048F7AC    mov         eax,dword ptr [ebx+14]
 0048F7AF    mov         edi,dword ptr [eax+8]
 0048F7B2    dec         edi
 0048F7B3    test        edi,edi
>0048F7B5    jl          0048FA6F
 0048F7BB    inc         edi
 0048F7BC    xor         esi,esi
 0048F7BE    lea         ecx,[esp+98]
 0048F7C5    mov         edx,esi
 0048F7C7    mov         eax,dword ptr [ebx+14]
 0048F7CA    call        00468C18
 0048F7CF    fld         dword ptr [esp+98]
 0048F7D6    fcomp       dword ptr ds:[48FA7C];0:Single
 0048F7DC    fnstsw      al
 0048F7DE    sahf
>0048F7DF    je          0048F818
 0048F7E1    lea         ecx,[esp+98]
 0048F7E8    mov         edx,esi
 0048F7EA    mov         eax,dword ptr [ebx+14]
 0048F7ED    call        00468C18
 0048F7F2    push        dword ptr [esp+98]
 0048F7F9    lea         edx,[esp+8]
 0048F7FD    lea         eax,[esp+4]
 0048F801    call        0045F570
 0048F806    push        dword ptr [esp]
 0048F809    push        dword ptr [esp+8]
 0048F80D    lea         eax,[esp+10]
 0048F811    call        0045DA44
>0048F816    jmp         0048F82E
 0048F818    mov         eax,[005AE67C];^gvar_005ACFB4
 0048F81D    push        esi
 0048F81E    push        edi
 0048F81F    mov         esi,eax
 0048F821    lea         edi,[esp+10]
 0048F825    mov         ecx,10
 0048F82A    rep movs    dword ptr [edi],dword ptr [esi]
 0048F82C    pop         edi
 0048F82D    pop         esi
 0048F82E    lea         ecx,[esp+98]
 0048F835    mov         edx,esi
 0048F837    mov         eax,dword ptr [ebx+14]
 0048F83A    call        00468C18
 0048F83F    fld         dword ptr [esp+9C]
 0048F846    fcomp       dword ptr ds:[48FA7C];0:Single
 0048F84C    fnstsw      al
 0048F84E    sahf
>0048F84F    je          0048F8B0
 0048F851    lea         ecx,[esp+98]
 0048F858    mov         edx,esi
 0048F85A    mov         eax,dword ptr [ebx+14]
 0048F85D    call        00468C18
 0048F862    push        dword ptr [esp+9C]
 0048F869    lea         edx,[esp+8]
 0048F86D    lea         eax,[esp+4]
 0048F871    call        0045F570
 0048F876    push        dword ptr [esp]
 0048F879    push        dword ptr [esp+8]
 0048F87D    lea         eax,[esp+50]
 0048F881    call        0045DA88
 0048F886    lea         ecx,[esp+0A4]
 0048F88D    lea         edx,[esp+48]
 0048F891    lea         eax,[esp+8]
 0048F895    call        0045DC38
 0048F89A    push        esi
 0048F89B    push        edi
 0048F89C    lea         esi,[esp+0AC]
 0048F8A3    lea         edi,[esp+10]
 0048F8A7    mov         ecx,10
 0048F8AC    rep movs    dword ptr [edi],dword ptr [esi]
 0048F8AE    pop         edi
 0048F8AF    pop         esi
 0048F8B0    lea         ecx,[esp+98]
 0048F8B7    mov         edx,esi
 0048F8B9    mov         eax,dword ptr [ebx+14]
 0048F8BC    call        00468C18
 0048F8C1    fld         dword ptr [esp+0A0]
 0048F8C8    fcomp       dword ptr ds:[48FA7C];0:Single
 0048F8CE    fnstsw      al
 0048F8D0    sahf
>0048F8D1    je          0048F932
 0048F8D3    lea         ecx,[esp+98]
 0048F8DA    mov         edx,esi
 0048F8DC    mov         eax,dword ptr [ebx+14]
 0048F8DF    call        00468C18
 0048F8E4    push        dword ptr [esp+0A0]
 0048F8EB    lea         edx,[esp+8]
 0048F8EF    lea         eax,[esp+4]
 0048F8F3    call        0045F570
 0048F8F8    push        dword ptr [esp]
 0048F8FB    push        dword ptr [esp+8]
 0048F8FF    lea         eax,[esp+50]
 0048F903    call        0045DACC
 0048F908    lea         ecx,[esp+0A4]
 0048F90F    lea         edx,[esp+48]
 0048F913    lea         eax,[esp+8]
 0048F917    call        0045DC38
 0048F91C    push        esi
 0048F91D    push        edi
 0048F91E    lea         esi,[esp+0AC]
 0048F925    lea         edi,[esp+10]
 0048F929    mov         ecx,10
 0048F92E    rep movs    dword ptr [edi],dword ptr [esi]
 0048F930    pop         edi
 0048F931    pop         esi
 0048F932    lea         ecx,[esp+98]
 0048F939    mov         edx,esi
 0048F93B    mov         eax,dword ptr [ebx+10]
 0048F93E    call        00468C18
 0048F943    mov         eax,dword ptr [esp+98]
 0048F94A    mov         dword ptr [esp+38],eax
 0048F94E    lea         ecx,[esp+98]
 0048F955    mov         edx,esi
 0048F957    mov         eax,dword ptr [ebx+10]
 0048F95A    call        00468C18
 0048F95F    mov         eax,dword ptr [esp+9C]
 0048F966    mov         dword ptr [esp+3C],eax
 0048F96A    lea         ecx,[esp+98]
 0048F971    mov         edx,esi
 0048F973    mov         eax,dword ptr [ebx+10]
 0048F976    call        00468C18
 0048F97B    mov         eax,dword ptr [esp+0A0]
 0048F982    mov         dword ptr [esp+40],eax
 0048F986    mov         eax,esi
 0048F988    shl         eax,3
 0048F98B    mov         edx,dword ptr [ebx+1C]
 0048F98E    push        esi
 0048F98F    push        edi
 0048F990    lea         edi,[edx+eax*8]
 0048F993    lea         esi,[esp+10]
 0048F997    mov         ecx,10
 0048F99C    rep movs    dword ptr [edi],dword ptr [esi]
 0048F99E    pop         edi
 0048F99F    pop         esi
 0048F9A0    inc         esi
 0048F9A1    dec         edi
>0048F9A2    jne         0048F7BE
>0048F9A8    jmp         0048FA6F
 0048F9AD    mov         eax,dword ptr [ebx+18]
 0048F9B0    mov         eax,dword ptr [eax+8]
 0048F9B3    shl         eax,6
 0048F9B6    call        AllocMem
 0048F9BB    mov         dword ptr [ebx+1C],eax
 0048F9BE    mov         eax,dword ptr [ebx+18]
 0048F9C1    mov         edi,dword ptr [eax+8]
 0048F9C4    dec         edi
 0048F9C5    test        edi,edi
>0048F9C7    jl          0048FA6F
 0048F9CD    inc         edi
 0048F9CE    xor         esi,esi
 0048F9D0    lea         ecx,[esp+88]
 0048F9D7    mov         edx,esi
 0048F9D9    mov         eax,dword ptr [ebx+18]
 0048F9DC    call        004694F8
 0048F9E1    lea         edx,[esp+8]
 0048F9E5    lea         eax,[esp+88]
 0048F9EC    call        0045EE90
 0048F9F1    lea         ecx,[esp+98]
 0048F9F8    mov         edx,esi
 0048F9FA    mov         eax,dword ptr [ebx+10]
 0048F9FD    call        00468C18
 0048FA02    mov         eax,dword ptr [esp+98]
 0048FA09    mov         dword ptr [esp+38],eax
 0048FA0D    lea         ecx,[esp+98]
 0048FA14    mov         edx,esi
 0048FA16    mov         eax,dword ptr [ebx+10]
 0048FA19    call        00468C18
 0048FA1E    mov         eax,dword ptr [esp+9C]
 0048FA25    mov         dword ptr [esp+3C],eax
 0048FA29    lea         ecx,[esp+98]
 0048FA30    mov         edx,esi
 0048FA32    mov         eax,dword ptr [ebx+10]
 0048FA35    call        00468C18
 0048FA3A    mov         eax,dword ptr [esp+0A0]
 0048FA41    mov         dword ptr [esp+40],eax
 0048FA45    mov         dword ptr [esp+44],3F800000
 0048FA4D    mov         eax,esi
 0048FA4F    shl         eax,3
 0048FA52    mov         edx,dword ptr [ebx+1C]
 0048FA55    push        esi
 0048FA56    push        edi
 0048FA57    lea         edi,[edx+eax*8]
 0048FA5A    lea         esi,[esp+10]
 0048FA5E    mov         ecx,10
 0048FA63    rep movs    dword ptr [edi],dword ptr [esi]
 0048FA65    pop         edi
 0048FA66    pop         esi
 0048FA67    inc         esi
 0048FA68    dec         edi
>0048FA69    jne         0048F9D0
 0048FA6F    mov         eax,dword ptr [ebx+1C]
 0048FA72    add         esp,0E4
 0048FA78    pop         edi
 0048FA79    pop         esi
 0048FA7A    pop         ebx
 0048FA7B    ret
end;*}

//0048FA80
procedure sub_0048FA80(?:TSkeletonFrame);
begin
{*
 0048FA80    push        ebx
 0048FA81    mov         ebx,eax
 0048FA83    mov         eax,dword ptr [ebx+1C];TSkeletonFrame.?f1C:dword
 0048FA86    test        eax,eax
>0048FA88    je          0048FA94
 0048FA8A    call        @FreeMem
 0048FA8F    xor         eax,eax
 0048FA91    mov         dword ptr [ebx+1C],eax;TSkeletonFrame.?f1C:dword
 0048FA94    pop         ebx
 0048FA95    ret
*}
end;

//0048FA98
constructor TSkeletonFrameList.Create;
begin
{*
 0048FA98    push        ebx
 0048FA99    push        esi
 0048FA9A    test        dl,dl
>0048FA9C    je          0048FAA6
 0048FA9E    add         esp,0FFFFFFF0
 0048FAA1    call        @ClassCreate
 0048FAA6    mov         ebx,edx
 0048FAA8    mov         esi,eax
 0048FAAA    mov         dword ptr [esi+18],ecx
 0048FAAD    xor         edx,edx
 0048FAAF    mov         eax,esi
 0048FAB1    mov         ecx,dword ptr [eax]
 0048FAB3    call        dword ptr [ecx+0C]
 0048FAB6    mov         eax,esi
 0048FAB8    test        bl,bl
>0048FABA    je          0048FACB
 0048FABC    call        @AfterConstruction
 0048FAC1    pop         dword ptr fs:[0]
 0048FAC8    add         esp,0C
 0048FACB    mov         eax,esi
 0048FACD    pop         esi
 0048FACE    pop         ebx
 0048FACF    ret
*}
end;

//0048FAD0
destructor TSkeletonFrameList.Destroy;
begin
{*
 0048FAD0    push        ebx
 0048FAD1    push        esi
 0048FAD2    push        edi
 0048FAD3    call        @BeforeDestruction
 0048FAD8    mov         ebx,edx
 0048FADA    mov         edi,eax
 0048FADC    mov         eax,edi
 0048FADE    mov         si,0FFF4
 0048FAE2    call        @CallDynaInst;TSkeletonFrameList.sub_00466E50
 0048FAE7    mov         edx,ebx
 0048FAE9    and         dl,0FC
 0048FAEC    mov         eax,edi
 0048FAEE    call        TPersistentObjectList.Destroy
 0048FAF3    test        bl,bl
>0048FAF5    jle         0048FAFE
 0048FAF7    mov         eax,edi
 0048FAF9    call        @ClassDestroy
 0048FAFE    pop         edi
 0048FAFF    pop         esi
 0048FB00    pop         ebx
 0048FB01    ret
*}
end;

//0048FB04
{*procedure TSkeletonFrameList.sub_00466894(?:?);
begin
 0048FB04    push        ebx
 0048FB05    push        esi
 0048FB06    push        edi
 0048FB07    mov         ebx,eax
 0048FB09    mov         eax,ebx
 0048FB0B    call        TPersistentObjectList.sub_00466894
 0048FB10    mov         esi,dword ptr [ebx+0C];TSkeletonFrameList.?fC:dword
 0048FB13    dec         esi
 0048FB14    test        esi,esi
>0048FB16    jl          0048FB2B
 0048FB18    inc         esi
 0048FB19    xor         edi,edi
 0048FB1B    mov         edx,edi
 0048FB1D    mov         eax,ebx
 0048FB1F    call        0048FB64
 0048FB24    mov         dword ptr [eax+8],ebx
 0048FB27    inc         edi
 0048FB28    dec         esi
>0048FB29    jne         0048FB1B
 0048FB2B    pop         edi
 0048FB2C    pop         esi
 0048FB2D    pop         ebx
 0048FB2E    ret
end;*}

//0048FB30
procedure TSkeletonFrameList.sub_00466E50;
begin
{*
 0048FB30    push        ebx
 0048FB31    push        esi
 0048FB32    push        edi
 0048FB33    mov         edi,eax
 0048FB35    mov         ebx,dword ptr [edi+0C];TSkeletonFrameList.?fC:dword
 0048FB38    dec         ebx
 0048FB39    test        ebx,ebx
>0048FB3B    jl          0048FB57
 0048FB3D    inc         ebx
 0048FB3E    xor         esi,esi
 0048FB40    mov         edx,esi
 0048FB42    mov         eax,edi
 0048FB44    call        0048FB64
 0048FB49    xor         edx,edx
 0048FB4B    mov         dword ptr [eax+8],edx
 0048FB4E    call        TObject.Free
 0048FB53    inc         esi
 0048FB54    dec         ebx
>0048FB55    jne         0048FB40
 0048FB57    mov         eax,edi
 0048FB59    call        TPersistentObjectList.sub_00466E50
 0048FB5E    pop         edi
 0048FB5F    pop         esi
 0048FB60    pop         ebx
 0048FB61    ret
*}
end;

//0048FB64
{*function sub_0048FB64(?:TSkeletonFrameList; ?:Integer):?;
begin
 0048FB64    mov         eax,dword ptr [eax+8];TSkeletonFrameList.?f8:dword
 0048FB67    mov         eax,dword ptr [eax+edx*4]
 0048FB6A    ret
end;*}

//0048FB6C
constructor TSkeletonRootBoneList.Create;
begin
{*
 0048FB6C    push        ebx
 0048FB6D    push        esi
 0048FB6E    test        dl,dl
>0048FB70    je          0048FB7A
 0048FB72    add         esp,0FFFFFFF0
 0048FB75    call        @ClassCreate
 0048FB7A    mov         ebx,edx
 0048FB7C    mov         esi,eax
 0048FB7E    mov         dword ptr [esi+18],ecx
 0048FB81    xor         edx,edx
 0048FB83    mov         eax,esi
 0048FB85    mov         ecx,dword ptr [eax]
 0048FB87    call        dword ptr [ecx+0C]
 0048FB8A    mov         eax,esi
 0048FB8C    test        bl,bl
>0048FB8E    je          0048FB9F
 0048FB90    call        @AfterConstruction
 0048FB95    pop         dword ptr fs:[0]
 0048FB9C    add         esp,0C
 0048FB9F    mov         eax,esi
 0048FBA1    pop         esi
 0048FBA2    pop         ebx
 0048FBA3    ret
*}
end;

//0048FBA4
constructor sub_0048FBA4;
begin
{*
 0048FBA4    push        ebx
 0048FBA5    push        esi
 0048FBA6    push        edi
 0048FBA7    test        dl,dl
>0048FBA9    je          0048FBB3
 0048FBAB    add         esp,0FFFFFFF0
 0048FBAE    call        @ClassCreate
 0048FBB3    mov         ebx,edx
 0048FBB5    mov         esi,eax
 0048FBB7    xor         edx,edx
 0048FBB9    mov         eax,esi
 0048FBBB    call        TPersistentObjectList.Create
 0048FBC0    mov         eax,[005AE67C];^gvar_005ACFB4
 0048FBC5    push        esi
 0048FBC6    lea         edi,[esi+1C];TSkeletonBoneList.?f1C:?
 0048FBC9    mov         esi,eax
 0048FBCB    mov         ecx,10
 0048FBD0    rep movs    dword ptr [edi],dword ptr [esi]
 0048FBD2    pop         esi
 0048FBD3    mov         eax,esi
 0048FBD5    test        bl,bl
>0048FBD7    je          0048FBE8
 0048FBD9    call        @AfterConstruction
 0048FBDE    pop         dword ptr fs:[0]
 0048FBE5    add         esp,0C
 0048FBE8    mov         eax,esi
 0048FBEA    pop         edi
 0048FBEB    pop         esi
 0048FBEC    pop         ebx
 0048FBED    ret
*}
end;

//0048FBF0
destructor TSkeletonBoneList.Destroy;
begin
{*
 0048FBF0    push        ebx
 0048FBF1    push        esi
 0048FBF2    push        edi
 0048FBF3    call        @BeforeDestruction
 0048FBF8    mov         ebx,edx
 0048FBFA    mov         edi,eax
 0048FBFC    mov         eax,edi
 0048FBFE    mov         si,0FFF3
 0048FC02    call        @CallDynaInst;TPersistentObjectList.sub_00467038
 0048FC07    mov         edx,ebx
 0048FC09    and         dl,0FC
 0048FC0C    mov         eax,edi
 0048FC0E    call        TPersistentObjectList.Destroy
 0048FC13    test        bl,bl
>0048FC15    jle         0048FC1E
 0048FC17    mov         eax,edi
 0048FC19    call        @ClassDestroy
 0048FC1E    pop         edi
 0048FC1F    pop         esi
 0048FC20    pop         ebx
 0048FC21    ret
*}
end;

//0048FC24
{*procedure TSkeletonBoneList.sub_00466814(?:?);
begin
 0048FC24    push        ebx
 0048FC25    mov         ebx,edx
 0048FC27    mov         edx,ebx
 0048FC29    call        TPersistentObjectList.sub_00466814
 0048FC2E    xor         edx,edx
 0048FC30    mov         eax,ebx
 0048FC32    mov         ecx,dword ptr [eax]
 0048FC34    call        dword ptr [ecx+8]
 0048FC37    pop         ebx
 0048FC38    ret
end;*}

//0048FC3C
{*procedure TSkeletonBoneList.sub_00466894(?:?);
begin
 0048FC3C    push        ebx
 0048FC3D    push        esi
 0048FC3E    push        edi
 0048FC3F    mov         esi,edx
 0048FC41    mov         ebx,eax
 0048FC43    mov         edx,esi
 0048FC45    mov         eax,ebx
 0048FC47    call        TPersistentObjectList.sub_00466894
 0048FC4C    mov         eax,esi
 0048FC4E    mov         edx,dword ptr [eax]
 0048FC50    call        dword ptr [edx+0C]
 0048FC53    test        eax,eax
>0048FC55    je          0048FC60
 0048FC57    mov         edx,eax
 0048FC59    mov         eax,ebx
 0048FC5B    call        00466914
 0048FC60    mov         esi,dword ptr [ebx+0C];TSkeletonBoneList.?fC:dword
 0048FC63    dec         esi
 0048FC64    test        esi,esi
>0048FC66    jl          0048FC7B
 0048FC68    inc         esi
 0048FC69    xor         edi,edi
 0048FC6B    mov         edx,edi
 0048FC6D    mov         eax,ebx
 0048FC6F    call        0048FCA0
 0048FC74    mov         dword ptr [eax+5C],ebx
 0048FC77    inc         edi
 0048FC78    dec         esi
>0048FC79    jne         0048FC6B
 0048FC7B    pop         edi
 0048FC7C    pop         esi
 0048FC7D    pop         ebx
 0048FC7E    ret
end;*}

//0048FC80
{*procedure sub_0048FC80(?:?);
begin
 0048FC80    push        ebx
 0048FC81    push        esi
 0048FC82    mov         esi,edx
 0048FC84    mov         ebx,eax
 0048FC86    mov         eax,esi
 0048FC88    mov         edx,dword ptr ds:[48CDD8];TSkeletonBone
 0048FC8E    call        @AsClass
 0048FC93    mov         dword ptr [eax+5C],ebx;TSkeletonBone.?f5C:TSkeletonBoneList
 0048FC96    mov         edx,dword ptr [ebx+18];TSkeletonBoneList.?f18:dword
 0048FC99    mov         dword ptr [eax+18],edx;TSkeletonBone.?f18:dword
 0048FC9C    pop         esi
 0048FC9D    pop         ebx
 0048FC9E    ret
end;*}

//0048FCA0
{*function sub_0048FCA0(?:TSkeletonBoneList; ?:?):?;
begin
 0048FCA0    mov         eax,dword ptr [eax+8];TSkeletonBoneList.?f8:dword
 0048FCA3    mov         eax,dword ptr [eax+edx*4]
 0048FCA6    ret
end;*}

//0048FCA8
{*procedure sub_0048FCA8(?:?);
begin
 0048FCA8    push        ebx
 0048FCA9    push        esi
 0048FCAA    push        edi
 0048FCAB    push        ecx
 0048FCAC    mov         dword ptr [esp],edx
 0048FCAF    mov         edi,eax
 0048FCB1    xor         eax,eax
 0048FCB3    mov         ebx,dword ptr [edi+0C];TSkeletonBoneList.?fC:dword
 0048FCB6    dec         ebx
 0048FCB7    test        ebx,ebx
>0048FCB9    jl          0048FCD7
 0048FCBB    inc         ebx
 0048FCBC    xor         esi,esi
 0048FCBE    mov         edx,esi
 0048FCC0    mov         eax,edi
 0048FCC2    call        0048FCA0
 0048FCC7    mov         edx,dword ptr [esp]
 0048FCCA    mov         ecx,dword ptr [eax]
 0048FCCC    call        dword ptr [ecx+24]
 0048FCCF    test        eax,eax
>0048FCD1    jne         0048FCD7
 0048FCD3    inc         esi
 0048FCD4    dec         ebx
>0048FCD5    jne         0048FCBE
 0048FCD7    pop         edx
 0048FCD8    pop         edi
 0048FCD9    pop         esi
 0048FCDA    pop         ebx
 0048FCDB    ret
end;*}

//0048FCDC
{*procedure sub_0048FCDC(?:?);
begin
 0048FCDC    push        ebx
 0048FCDD    push        esi
 0048FCDE    push        edi
 0048FCDF    push        ecx
 0048FCE0    mov         dword ptr [esp],edx
 0048FCE3    mov         edi,eax
 0048FCE5    xor         eax,eax
 0048FCE7    mov         ebx,dword ptr [edi+0C];TSkeletonBoneList.?fC:dword
 0048FCEA    dec         ebx
 0048FCEB    test        ebx,ebx
>0048FCED    jl          0048FD0B
 0048FCEF    inc         ebx
 0048FCF0    xor         esi,esi
 0048FCF2    mov         edx,esi
 0048FCF4    mov         eax,edi
 0048FCF6    call        0048FCA0
 0048FCFB    mov         edx,dword ptr [esp]
 0048FCFE    mov         ecx,dword ptr [eax]
 0048FD00    call        dword ptr [ecx+28]
 0048FD03    test        eax,eax
>0048FD05    jne         0048FD0B
 0048FD07    inc         esi
 0048FD08    dec         ebx
>0048FD09    jne         0048FCF2
 0048FD0B    pop         edx
 0048FD0C    pop         edi
 0048FD0D    pop         esi
 0048FD0E    pop         ebx
 0048FD0F    ret
end;*}

//0048FD10
procedure sub_0048FD10;
begin
{*
 0048FD10    push        ebx
 0048FD11    push        esi
 0048FD12    push        edi
 0048FD13    mov         edi,eax
 0048FD15    mov         ebx,dword ptr [edi+0C];TSkeletonBoneList.?fC:dword
 0048FD18    dec         ebx
 0048FD19    test        ebx,ebx
>0048FD1B    jl          0048FD32
 0048FD1D    inc         ebx
 0048FD1E    xor         esi,esi
 0048FD20    mov         edx,esi
 0048FD22    mov         eax,edi
 0048FD24    call        0048FCA0
 0048FD29    mov         edx,dword ptr [eax]
 0048FD2B    call        dword ptr [edx+30]
 0048FD2E    inc         esi
 0048FD2F    dec         ebx
>0048FD30    jne         0048FD20
 0048FD32    pop         edi
 0048FD33    pop         esi
 0048FD34    pop         ebx
 0048FD35    ret
*}
end;

//0048FD38
{*procedure TSkeletonRootBoneList.sub_00466814(?:?);
begin
 0048FD38    push        ebx
 0048FD39    mov         ebx,edx
 0048FD3B    mov         edx,ebx
 0048FD3D    call        TSkeletonBoneList.sub_00466814
 0048FD42    xor         edx,edx
 0048FD44    mov         eax,ebx
 0048FD46    mov         ecx,dword ptr [eax]
 0048FD48    call        dword ptr [ecx+8]
 0048FD4B    pop         ebx
 0048FD4C    ret
end;*}

//0048FD50
{*procedure TSkeletonRootBoneList.sub_00466894(?:?);
begin
 0048FD50    push        ebx
 0048FD51    push        esi
 0048FD52    push        edi
 0048FD53    mov         esi,edx
 0048FD55    mov         ebx,eax
 0048FD57    mov         edx,esi
 0048FD59    mov         eax,ebx
 0048FD5B    call        TSkeletonBoneList.sub_00466894
 0048FD60    mov         eax,esi
 0048FD62    mov         edx,dword ptr [eax]
 0048FD64    call        dword ptr [edx+0C]
 0048FD67    test        eax,eax
>0048FD69    je          0048FD74
 0048FD6B    mov         edx,eax
 0048FD6D    mov         eax,ebx
 0048FD6F    call        00466914
 0048FD74    mov         esi,dword ptr [ebx+0C];TSkeletonRootBoneList.?fC:dword
 0048FD77    dec         esi
 0048FD78    test        esi,esi
>0048FD7A    jl          0048FD8F
 0048FD7C    inc         esi
 0048FD7D    xor         edi,edi
 0048FD7F    mov         edx,edi
 0048FD81    mov         eax,ebx
 0048FD83    call        0048FCA0
 0048FD88    mov         dword ptr [eax+5C],ebx
 0048FD8B    inc         edi
 0048FD8C    dec         esi
>0048FD8D    jne         0048FD7F
 0048FD8F    pop         edi
 0048FD90    pop         esi
 0048FD91    pop         ebx
 0048FD92    ret
end;*}

//0048FD94
{*procedure sub_0048FD94(?:?);
begin
 0048FD94    push        ebx
 0048FD95    push        esi
 0048FD96    push        edi
 0048FD97    push        ebp
 0048FD98    mov         ebp,edx
 0048FD9A    mov         edi,eax
 0048FD9C    push        2000
 0048FDA1    call        OpenGL32.glPushAttrib
 0048FDA6    push        0B57
 0048FDAB    call        OpenGL32.glDisable
 0048FDB0    push        0B50
 0048FDB5    call        OpenGL32.glDisable
 0048FDBA    push        3F800000
 0048FDBF    push        3F800000
 0048FDC4    push        3F800000
 0048FDC9    call        OpenGL32.glColor3f
 0048FDCE    mov         ebx,dword ptr [edi+0C];TSkeletonRootBoneList.?fC:dword
 0048FDD1    dec         ebx
 0048FDD2    test        ebx,ebx
>0048FDD4    jl          0048FDED
 0048FDD6    inc         ebx
 0048FDD7    xor         esi,esi
 0048FDD9    mov         edx,esi
 0048FDDB    mov         eax,edi
 0048FDDD    call        0048FCA0
 0048FDE2    mov         edx,ebp
 0048FDE4    mov         ecx,dword ptr [eax]
 0048FDE6    call        dword ptr [ecx+2C]
 0048FDE9    inc         esi
 0048FDEA    dec         ebx
>0048FDEB    jne         0048FDD9
 0048FDED    call        OpenGL32.glPopAttrib
 0048FDF2    pop         ebp
 0048FDF3    pop         edi
 0048FDF4    pop         esi
 0048FDF5    pop         ebx
 0048FDF6    ret
end;*}

//0048FDF8
constructor sub_0048FDF8;
begin
{*
 0048FDF8    push        ebx
 0048FDF9    push        esi
 0048FDFA    test        dl,dl
>0048FDFC    je          0048FE06
 0048FDFE    add         esp,0FFFFFFF0
 0048FE01    call        @ClassCreate
 0048FE06    mov         ebx,edx
 0048FE08    mov         esi,eax
 0048FE0A    mov         dword ptr [esi+68],0FFFFFFFF;TSkeletonBone.?f68:dword
 0048FE11    xor         edx,edx
 0048FE13    mov         eax,esi
 0048FE15    call        0048FBA4
 0048FE1A    mov         eax,esi
 0048FE1C    test        bl,bl
>0048FE1E    je          0048FE2F
 0048FE20    call        @AfterConstruction
 0048FE25    pop         dword ptr fs:[0]
 0048FE2C    add         esp,0C
 0048FE2F    mov         eax,esi
 0048FE31    pop         esi
 0048FE32    pop         ebx
 0048FE33    ret
*}
end;

//0048FE34
destructor TSkeletonBone.Destroy;
begin
{*
 0048FE34    push        ebx
 0048FE35    push        esi
 0048FE36    call        @BeforeDestruction
 0048FE3B    mov         ebx,edx
 0048FE3D    mov         esi,eax
 0048FE3F    mov         eax,dword ptr [esi+5C];TSkeletonBone.?f5C:TSkeletonBoneList
 0048FE42    test        eax,eax
>0048FE44    je          0048FE4D
 0048FE46    mov         edx,esi
 0048FE48    call        00466F94
 0048FE4D    mov         edx,ebx
 0048FE4F    and         dl,0FC
 0048FE52    mov         eax,esi
 0048FE54    call        TSkeletonBoneList.Destroy
 0048FE59    test        bl,bl
>0048FE5B    jle         0048FE64
 0048FE5D    mov         eax,esi
 0048FE5F    call        @ClassDestroy
 0048FE64    pop         esi
 0048FE65    pop         ebx
 0048FE66    ret
*}
end;

//0048FE68
{*procedure TSkeletonBone.sub_00466814(?:?);
begin
 0048FE68    push        ebx
 0048FE69    push        esi
 0048FE6A    mov         esi,edx
 0048FE6C    mov         ebx,eax
 0048FE6E    mov         edx,esi
 0048FE70    mov         eax,ebx
 0048FE72    call        TSkeletonBoneList.sub_00466814
 0048FE77    xor         edx,edx
 0048FE79    mov         eax,esi
 0048FE7B    mov         ecx,dword ptr [eax]
 0048FE7D    call        dword ptr [ecx+8]
 0048FE80    mov         edx,dword ptr [ebx+64];TSkeletonBone.?f64:String
 0048FE83    mov         eax,esi
 0048FE85    mov         ecx,dword ptr [eax]
 0048FE87    call        dword ptr [ecx+10]
 0048FE8A    mov         edx,dword ptr [ebx+60];TSkeletonBone.?f60:dword
 0048FE8D    mov         eax,esi
 0048FE8F    mov         ecx,dword ptr [eax]
 0048FE91    call        dword ptr [ecx+8]
 0048FE94    mov         edx,dword ptr [ebx+68];TSkeletonBone.?f68:dword
 0048FE97    mov         eax,esi
 0048FE99    mov         ecx,dword ptr [eax]
 0048FE9B    call        dword ptr [ecx+8]
 0048FE9E    pop         esi
 0048FE9F    pop         ebx
 0048FEA0    ret
end;*}

//0048FEA4
{*procedure TSkeletonBone.sub_00466894(?:?);
begin
 0048FEA4    push        ebp
 0048FEA5    mov         ebp,esp
 0048FEA7    push        0
 0048FEA9    push        ebx
 0048FEAA    push        esi
 0048FEAB    push        edi
 0048FEAC    mov         esi,edx
 0048FEAE    mov         ebx,eax
 0048FEB0    xor         eax,eax
 0048FEB2    push        ebp
 0048FEB3    push        48FF37
 0048FEB8    push        dword ptr fs:[eax]
 0048FEBB    mov         dword ptr fs:[eax],esp
 0048FEBE    mov         edx,esi
 0048FEC0    mov         eax,ebx
 0048FEC2    call        TSkeletonBoneList.sub_00466894
 0048FEC7    mov         eax,esi
 0048FEC9    mov         edx,dword ptr [eax]
 0048FECB    call        dword ptr [edx+0C]
 0048FECE    test        eax,eax
>0048FED0    jne         0048FEFD
 0048FED2    lea         edx,[ebp-4]
 0048FED5    mov         eax,esi
 0048FED7    mov         ecx,dword ptr [eax]
 0048FED9    call        dword ptr [ecx+14]
 0048FEDC    mov         edx,dword ptr [ebp-4]
 0048FEDF    lea         eax,[ebx+64];TSkeletonBone.?f64:String
 0048FEE2    call        @LStrAsg
 0048FEE7    mov         eax,esi
 0048FEE9    mov         edx,dword ptr [eax]
 0048FEEB    call        dword ptr [edx+0C]
 0048FEEE    mov         dword ptr [ebx+60],eax;TSkeletonBone.?f60:dword
 0048FEF1    mov         eax,esi
 0048FEF3    mov         edx,dword ptr [eax]
 0048FEF5    call        dword ptr [edx+0C]
 0048FEF8    mov         dword ptr [ebx+68],eax;TSkeletonBone.?f68:dword
>0048FEFB    jmp         0048FF06
 0048FEFD    mov         edx,eax
 0048FEFF    mov         eax,ebx
 0048FF01    call        00466914
 0048FF06    mov         esi,dword ptr [ebx+0C];TSkeletonBone.?fC:dword
 0048FF09    dec         esi
 0048FF0A    test        esi,esi
>0048FF0C    jl          0048FF21
 0048FF0E    inc         esi
 0048FF0F    xor         edi,edi
 0048FF11    mov         edx,edi
 0048FF13    mov         eax,ebx
 0048FF15    call        0049006C
 0048FF1A    mov         dword ptr [eax+5C],ebx
 0048FF1D    inc         edi
 0048FF1E    dec         esi
>0048FF1F    jne         0048FF11
 0048FF21    xor         eax,eax
 0048FF23    pop         edx
 0048FF24    pop         ecx
 0048FF25    pop         ecx
 0048FF26    mov         dword ptr fs:[eax],edx
 0048FF29    push        48FF3E
 0048FF2E    lea         eax,[ebp-4]
 0048FF31    call        @LStrClr
 0048FF36    ret
>0048FF37    jmp         @HandleFinally
>0048FF3C    jmp         0048FF2E
 0048FF3E    pop         edi
 0048FF3F    pop         esi
 0048FF40    pop         ebx
 0048FF41    pop         ecx
 0048FF42    pop         ebp
 0048FF43    ret
end;*}

//0048FF44
procedure sub_0048FF44(?:dword);
begin
{*
 0048FF44    push        ebp
 0048FF45    mov         ebp,esp
 0048FF47    add         esp,0FFFFFFEC
 0048FF4A    push        ebx
 0048FF4B    mov         ebx,eax
 0048FF4D    mov         eax,ebx
 0048FF4F    shr         eax,18
 0048FF52    and         eax,0FF
 0048FF57    mov         dword ptr [ebp-8],eax
 0048FF5A    xor         eax,eax
 0048FF5C    mov         dword ptr [ebp-4],eax
 0048FF5F    fild        qword ptr [ebp-8]
 0048FF62    fdiv        dword ptr ds:[48FFD8];255:Single
 0048FF68    add         esp,0FFFFFFFC
 0048FF6B    fstp        dword ptr [esp]
 0048FF6E    wait
 0048FF6F    mov         eax,ebx
 0048FF71    call        0046F4C0
 0048FF76    and         eax,0FF
 0048FF7B    mov         dword ptr [ebp-0C],eax
 0048FF7E    fild        dword ptr [ebp-0C]
 0048FF81    fdiv        dword ptr ds:[48FFD8];255:Single
 0048FF87    add         esp,0FFFFFFFC
 0048FF8A    fstp        dword ptr [esp]
 0048FF8D    wait
 0048FF8E    mov         eax,ebx
 0048FF90    call        0046F4BC
 0048FF95    and         eax,0FF
 0048FF9A    mov         dword ptr [ebp-10],eax
 0048FF9D    fild        dword ptr [ebp-10]
 0048FFA0    fdiv        dword ptr ds:[48FFD8];255:Single
 0048FFA6    add         esp,0FFFFFFFC
 0048FFA9    fstp        dword ptr [esp]
 0048FFAC    wait
 0048FFAD    mov         eax,ebx
 0048FFAF    call        0046F4B8
 0048FFB4    and         eax,0FF
 0048FFB9    mov         dword ptr [ebp-14],eax
 0048FFBC    fild        dword ptr [ebp-14]
 0048FFBF    fdiv        dword ptr ds:[48FFD8];255:Single
 0048FFC5    add         esp,0FFFFFFFC
 0048FFC8    fstp        dword ptr [esp]
 0048FFCB    wait
 0048FFCC    call        OpenGL32.glColor4f
 0048FFD1    pop         ebx
 0048FFD2    mov         esp,ebp
 0048FFD4    pop         ebp
 0048FFD5    ret
*}
end;

//0048FFDC
{*procedure sub_0048FFDC(?:?);
begin
 0048FFDC    push        ebx
 0048FFDD    push        esi
 0048FFDE    push        edi
 0048FFDF    push        ebp
 0048FFE0    mov         ebp,edx
 0048FFE2    mov         ebx,eax
 0048FFE4    push        40A00000
 0048FFE9    call        OpenGL32.glPointSize
 0048FFEE    push        0
 0048FFF0    call        OpenGL32.glBegin
 0048FFF5    mov         eax,dword ptr [ebx+68];TSkeletonBone.?f68:dword
 0048FFF8    call        0048FF44
 0048FFFD    lea         eax,[ebx+4C];TSkeletonBone.?f4C:?
 00490000    push        eax
 00490001    call        OpenGL32.glVertex3fv
 00490006    call        OpenGL32.glEnd
 0049000B    push        3F800000
 00490010    call        OpenGL32.glPointSize
 00490015    mov         eax,dword ptr [ebx+5C];TSkeletonBone.?f5C:TSkeletonBoneList
 00490018    mov         edx,dword ptr ds:[48CDD8];TSkeletonBone
 0049001E    call        @IsClass
 00490023    test        al,al
>00490025    je          00490048
 00490027    push        1
 00490029    call        OpenGL32.glBegin
 0049002E    mov         eax,dword ptr [ebx+5C];TSkeletonBone.?f5C:TSkeletonBoneList
 00490031    add         eax,4C;TSkeletonBoneList.?f4C:?
 00490034    push        eax
 00490035    call        OpenGL32.glVertex3fv
 0049003A    lea         eax,[ebx+4C];TSkeletonBone.?f4C:?
 0049003D    push        eax
 0049003E    call        OpenGL32.glVertex3fv
 00490043    call        OpenGL32.glEnd
 00490048    mov         esi,dword ptr [ebx+0C];TSkeletonBone.?fC:dword
 0049004B    dec         esi
 0049004C    test        esi,esi
>0049004E    jl          00490067
 00490050    inc         esi
 00490051    xor         edi,edi
 00490053    mov         edx,edi
 00490055    mov         eax,ebx
 00490057    call        0049006C
 0049005C    mov         edx,ebp
 0049005E    mov         ecx,dword ptr [eax]
 00490060    call        dword ptr [ecx+2C]
 00490063    inc         edi
 00490064    dec         esi
>00490065    jne         00490053
 00490067    pop         ebp
 00490068    pop         edi
 00490069    pop         esi
 0049006A    pop         ebx
 0049006B    ret
end;*}

//0049006C
{*function sub_0049006C(?:TSkeletonBone; ?:?):?;
begin
 0049006C    mov         eax,dword ptr [eax+8];TSkeletonBone.?f8:dword
 0049006F    mov         eax,dword ptr [eax+edx*4]
 00490072    ret
end;*}

//00490074
{*procedure sub_00490074(?:?);
begin
 00490074    cmp         edx,dword ptr [eax+60];TSkeletonBone.?f60:dword
>00490077    je          0049007E
 00490079    call        0048FCA8
 0049007E    ret
end;*}

//00490080
{*procedure sub_00490080(?:?);
begin
 00490080    push        ebx
 00490081    push        esi
 00490082    mov         esi,edx
 00490084    mov         ebx,eax
 00490086    mov         eax,dword ptr [ebx+64];TSkeletonBone.?f64:String
 00490089    mov         edx,esi
 0049008B    call        @LStrCmp
>00490090    jne         00490097
 00490092    mov         eax,ebx
 00490094    pop         esi
 00490095    pop         ebx
 00490096    ret
 00490097    mov         edx,esi
 00490099    mov         eax,ebx
 0049009B    call        0048FCDC
 004900A0    pop         esi
 004900A1    pop         ebx
 004900A2    ret
end;*}

//004900A4
procedure TSkeletonBone.sub_00467038;
begin
{*
 004900A4    push        ebx
 004900A5    mov         ebx,eax
 004900A7    xor         eax,eax
 004900A9    mov         dword ptr [ebx+60],eax;TSkeletonBone.?f60:dword
 004900AC    lea         eax,[ebx+64];TSkeletonBone.?f64:String
 004900AF    call        @LStrClr
 004900B4    mov         eax,ebx
 004900B6    call        TPersistentObjectList.sub_00467038
 004900BB    pop         ebx
 004900BC    ret
*}
end;

//004900C0
procedure sub_004900C0;
begin
{*
 004900C0    push        ebx
 004900C1    push        esi
 004900C2    push        edi
 004900C3    add         esp,0FFFFFFC0
 004900C6    mov         ebx,eax
 004900C8    mov         eax,dword ptr [ebx+18];TSkeletonBone.?f18:dword
 004900CB    call        0049059C
 004900D0    call        0048F774
 004900D5    mov         edx,dword ptr [ebx+60];TSkeletonBone.?f60:dword
 004900D8    shl         edx,3
 004900DB    lea         eax,[eax+edx*8]
 004900DE    mov         ecx,esp
 004900E0    mov         edx,dword ptr [ebx+5C];TSkeletonBone.?f5C:TSkeletonBoneList
 004900E3    add         edx,1C;TSkeletonBoneList.?f1C:?
 004900E6    call        0045DC38
 004900EB    mov         esi,esp
 004900ED    lea         edi,[ebx+1C];TSkeletonBone.?f1C:?
 004900F0    mov         ecx,10
 004900F5    rep movs    dword ptr [edi],dword ptr [esi]
 004900F7    mov         eax,ebx
 004900F9    call        0048FD10
 004900FE    add         esp,40
 00490101    pop         edi
 00490102    pop         esi
 00490103    pop         ebx
 00490104    ret
*}
end;

//00490108
constructor sub_00490108;
begin
{*
 00490108    push        ebx
 00490109    push        esi
 0049010A    push        edi
 0049010B    test        dl,dl
>0049010D    je          00490117
 0049010F    add         esp,0FFFFFFF0
 00490112    call        @ClassCreate
 00490117    mov         ebx,edx
 00490119    mov         esi,eax
 0049011B    xor         edx,edx
 0049011D    mov         eax,esi
 0049011F    call        004666E0
 00490124    mov         eax,[005AE67C];^gvar_005ACFB4
 00490129    push        esi
 0049012A    lea         edi,[esi+14];TSkeletonCollider.?f14:?
 0049012D    mov         esi,eax
 0049012F    mov         ecx,10
 00490134    rep movs    dword ptr [edi],dword ptr [esi]
 00490136    pop         esi
 00490137    mov         eax,[005AE67C];^gvar_005ACFB4
 0049013C    push        esi
 0049013D    lea         edi,[esi+54];TSkeletonCollider.?f54:?
 00490140    mov         esi,eax
 00490142    mov         ecx,10
 00490147    rep movs    dword ptr [edi],dword ptr [esi]
 00490149    pop         esi
 0049014A    mov         byte ptr [esi+94],1;TSkeletonCollider.?f94:byte
 00490151    mov         eax,esi
 00490153    test        bl,bl
>00490155    je          00490166
 00490157    call        @AfterConstruction
 0049015C    pop         dword ptr fs:[0]
 00490163    add         esp,0C
 00490166    mov         eax,esi
 00490168    pop         edi
 00490169    pop         esi
 0049016A    pop         ebx
 0049016B    ret
*}
end;

//0049016C
{*procedure TSkeletonCollider.sub_00466814(?:?);
begin
 0049016C    push        ebx
 0049016D    push        esi
 0049016E    mov         esi,edx
 00490170    mov         ebx,eax
 00490172    mov         edx,esi
 00490174    mov         eax,ebx
 00490176    call        TPersistentObject.sub_00466814
 0049017B    xor         edx,edx
 0049017D    mov         eax,esi
 0049017F    mov         ecx,dword ptr [eax]
 00490181    call        dword ptr [ecx+8]
 00490184    mov         eax,dword ptr [ebx+0C];TSkeletonCollider.?fC:dword
 00490187    test        eax,eax
>00490189    je          00490197
 0049018B    mov         edx,dword ptr [eax+60]
 0049018E    mov         eax,esi
 00490190    mov         ecx,dword ptr [eax]
 00490192    call        dword ptr [ecx+8]
>00490195    jmp         004901A1
 00490197    or          edx,0FFFFFFFF
 0049019A    mov         eax,esi
 0049019C    mov         ecx,dword ptr [eax]
 0049019E    call        dword ptr [ecx+8]
 004901A1    lea         edx,[ebx+14];TSkeletonCollider.?f14:?
 004901A4    mov         ecx,40
 004901A9    mov         eax,esi
 004901AB    mov         ebx,dword ptr [eax]
 004901AD    call        dword ptr [ebx+4]
 004901B0    pop         esi
 004901B1    pop         ebx
 004901B2    ret
end;*}

//004901B4
{*procedure TSkeletonCollider.sub_00466894(?:?);
begin
 004901B4    push        ebx
 004901B5    push        esi
 004901B6    mov         esi,edx
 004901B8    mov         ebx,eax
 004901BA    mov         edx,esi
 004901BC    mov         eax,ebx
 004901BE    call        TPersistentObject.sub_00466894
 004901C3    mov         eax,esi
 004901C5    mov         edx,dword ptr [eax]
 004901C7    call        dword ptr [edx+0C]
 004901CA    test        eax,eax
>004901CC    jne         004901EA
 004901CE    mov         eax,esi
 004901D0    mov         edx,dword ptr [eax]
 004901D2    call        dword ptr [edx+0C]
 004901D5    mov         dword ptr [ebx+10],eax;TSkeletonCollider.?f10:dword
 004901D8    lea         edx,[ebx+14];TSkeletonCollider.?f14:?
 004901DB    mov         ecx,40
 004901E0    mov         eax,esi
 004901E2    mov         ebx,dword ptr [eax]
 004901E4    call        dword ptr [ebx+4]
 004901E7    pop         esi
 004901E8    pop         ebx
 004901E9    ret
 004901EA    mov         edx,eax
 004901EC    mov         eax,ebx
 004901EE    call        00466914
 004901F3    pop         esi
 004901F4    pop         ebx
 004901F5    ret
end;*}

//004901F8
procedure sub_004901F8;
begin
{*
 004901F8    push        ebx
 004901F9    push        esi
 004901FA    push        edi
 004901FB    push        ebp
 004901FC    add         esp,0FFFFFF80
 004901FF    mov         ebx,eax
 00490201    mov         edi,dword ptr [ebx+0C];TSkeletonCollider.?fC:dword
 00490204    test        edi,edi
>00490206    je          0049025C
 00490208    mov         eax,dword ptr [ebx+8];TSkeletonCollider.?f8:dword
 0049020B    mov         esi,dword ptr [eax+18]
 0049020E    mov         eax,esi
 00490210    mov         edx,dword ptr ds:[48D054];TSkeleton
 00490216    call        @IsClass
 0049021B    test        al,al
>0049021D    je          0049024D
 0049021F    mov         ebp,dword ptr [esi+8]
 00490222    test        ebp,ebp
>00490224    je          00490241
 00490226    lea         edx,[esp+40]
 0049022A    mov         eax,ebp
 0049022C    call        0047BBC0
 00490231    lea         edx,[esp+40]
 00490235    mov         ecx,esp
 00490237    lea         eax,[edi+1C]
 0049023A    call        0045DC38
>0049023F    jmp         0049024D
 00490241    lea         esi,[edi+1C]
 00490244    mov         edi,esp
 00490246    mov         ecx,10
 0049024B    rep movs    dword ptr [edi],dword ptr [esi]
 0049024D    lea         ecx,[ebx+54];TSkeletonCollider.?f54:?
 00490250    mov         edx,esp
 00490252    lea         eax,[ebx+14];TSkeletonCollider.?f14:?
 00490255    call        0045E014
>0049025A    jmp         00490269
 0049025C    lea         esi,[ebx+14];TSkeletonCollider.?f14:?
 0049025F    lea         edi,[ebx+54];TSkeletonCollider.?f54:?
 00490262    mov         ecx,10
 00490267    rep movs    dword ptr [edi],dword ptr [esi]
 00490269    add         esp,80
 0049026F    pop         ebp
 00490270    pop         edi
 00490271    pop         esi
 00490272    pop         ebx
 00490273    ret
*}
end;

//00490274
{*procedure sub_00490274(?:?; ?:?);
begin
 00490274    cmp         edx,dword ptr [eax+0C]
>00490277    je          0049027C
 00490279    mov         dword ptr [eax+0C],edx
 0049027C    ret
end;*}

//00490280
constructor TSkeletonColliderList.Create;
begin
{*
 00490280    push        ebx
 00490281    push        esi
 00490282    push        edi
 00490283    test        dl,dl
>00490285    je          0049028F
 00490287    add         esp,0FFFFFFF0
 0049028A    call        @ClassCreate
 0049028F    mov         esi,ecx
 00490291    mov         ebx,edx
 00490293    mov         edi,eax
 00490295    xor         edx,edx
 00490297    mov         eax,edi
 00490299    mov         ecx,dword ptr [eax]
 0049029B    call        dword ptr [ecx+0C]
 0049029E    mov         dword ptr [edi+18],esi
 004902A1    mov         eax,edi
 004902A3    test        bl,bl
>004902A5    je          004902B6
 004902A7    call        @AfterConstruction
 004902AC    pop         dword ptr fs:[0]
 004902B3    add         esp,0C
 004902B6    mov         eax,edi
 004902B8    pop         edi
 004902B9    pop         esi
 004902BA    pop         ebx
 004902BB    ret
*}
end;

//004902BC
destructor TSkeletonColliderList.Destroy;
begin
{*
 004902BC    push        ebx
 004902BD    push        esi
 004902BE    push        edi
 004902BF    call        @BeforeDestruction
 004902C4    mov         ebx,edx
 004902C6    mov         edi,eax
 004902C8    mov         eax,edi
 004902CA    mov         si,0FFF4
 004902CE    call        @CallDynaInst;TSkeletonColliderList.sub_00466E50
 004902D3    mov         edx,ebx
 004902D5    and         dl,0FC
 004902D8    mov         eax,edi
 004902DA    call        TPersistentObjectList.Destroy
 004902DF    test        bl,bl
>004902E1    jle         004902EA
 004902E3    mov         eax,edi
 004902E5    call        @ClassDestroy
 004902EA    pop         edi
 004902EB    pop         esi
 004902EC    pop         ebx
 004902ED    ret
*}
end;

//004902F0
{*function sub_004902F0(?:TSkeletonColliderList; ?:?):?;
begin
 004902F0    push        ebx
 004902F1    push        esi
 004902F2    mov         esi,edx
 004902F4    mov         ebx,eax
 004902F6    mov         edx,esi
 004902F8    mov         eax,ebx
 004902FA    call        00466EF0
 004902FF    pop         esi
 00490300    pop         ebx
 00490301    ret
end;*}

//00490304
{*procedure TSkeletonColliderList.sub_00466894(?:?);
begin
 00490304    push        ebx
 00490305    push        esi
 00490306    push        edi
 00490307    mov         ebx,eax
 00490309    mov         eax,ebx
 0049030B    call        TPersistentObjectList.sub_00466894
 00490310    mov         edi,dword ptr [ebx+0C];TSkeletonColliderList.?fC:dword
 00490313    dec         edi
 00490314    test        edi,edi
>00490316    jl          00490370
 00490318    inc         edi
 00490319    xor         esi,esi
 0049031B    mov         edx,esi
 0049031D    mov         eax,ebx
 0049031F    call        004902F0
 00490324    mov         dword ptr [eax+8],ebx
 00490327    mov         eax,dword ptr [ebx+18];TSkeletonColliderList.?f18:dword
 0049032A    mov         edx,dword ptr ds:[48D054];TSkeleton
 00490330    call        @IsClass
 00490335    test        al,al
>00490337    je          0049036C
 00490339    mov         edx,esi
 0049033B    mov         eax,ebx
 0049033D    call        004902F0
 00490342    cmp         dword ptr [eax+10],0FFFFFFFF
>00490346    je          0049036C
 00490348    mov         edx,esi
 0049034A    mov         eax,ebx
 0049034C    call        004902F0
 00490351    mov         edx,dword ptr [eax+10]
 00490354    mov         eax,dword ptr [ebx+18];TSkeletonColliderList.?f18:dword
 00490357    call        00490660
 0049035C    push        eax
 0049035D    mov         edx,esi
 0049035F    mov         eax,ebx
 00490361    call        004902F0
 00490366    pop         edx
 00490367    call        00490274
 0049036C    inc         esi
 0049036D    dec         edi
>0049036E    jne         0049031B
 00490370    pop         edi
 00490371    pop         esi
 00490372    pop         ebx
 00490373    ret
end;*}

//00490374
procedure TSkeletonColliderList.sub_00466E50;
begin
{*
 00490374    push        ebx
 00490375    push        esi
 00490376    push        edi
 00490377    mov         esi,eax
 00490379    mov         edi,dword ptr [esi+0C];TSkeletonColliderList.?fC:dword
 0049037C    dec         edi
 0049037D    test        edi,edi
>0049037F    jl          004903A4
 00490381    inc         edi
 00490382    xor         ebx,ebx
 00490384    mov         edx,ebx
 00490386    mov         eax,esi
 00490388    call        004902F0
 0049038D    xor         edx,edx
 0049038F    mov         dword ptr [eax+8],edx
 00490392    mov         edx,ebx
 00490394    mov         eax,esi
 00490396    call        004902F0
 0049039B    call        TObject.Free
 004903A0    inc         ebx
 004903A1    dec         edi
>004903A2    jne         00490384
 004903A4    mov         eax,esi
 004903A6    call        TPersistentObjectList.sub_00466E50
 004903AB    pop         edi
 004903AC    pop         esi
 004903AD    pop         ebx
 004903AE    ret
*}
end;

//004903B0
{*procedure sub_004903B0(?:?);
begin
 004903B0    push        ebx
 004903B1    push        esi
 004903B2    push        edi
 004903B3    mov         edi,eax
 004903B5    mov         esi,dword ptr [edi+0C]
 004903B8    dec         esi
 004903B9    test        esi,esi
>004903BB    jl          004903E4
 004903BD    inc         esi
 004903BE    xor         ebx,ebx
 004903C0    mov         edx,ebx
 004903C2    mov         eax,edi
 004903C4    call        004902F0
 004903C9    cmp         byte ptr [eax+94],0
>004903D0    je          004903E0
 004903D2    mov         edx,ebx
 004903D4    mov         eax,edi
 004903D6    call        004902F0
 004903DB    mov         edx,dword ptr [eax]
 004903DD    call        dword ptr [edx+1C]
 004903E0    inc         ebx
 004903E1    dec         esi
>004903E2    jne         004903C0
 004903E4    pop         edi
 004903E5    pop         esi
 004903E6    pop         ebx
 004903E7    ret
end;*}

//004903E8
constructor TSkeleton.Create;
begin
{*
 004903E8    push        ebx
 004903E9    push        esi
 004903EA    test        dl,dl
>004903EC    je          004903F6
 004903EE    add         esp,0FFFFFFF0
 004903F1    call        @ClassCreate
 004903F6    mov         ebx,edx
 004903F8    mov         esi,eax
 004903FA    mov         dword ptr [esi+8],ecx
 004903FD    xor         edx,edx
 004903FF    mov         eax,esi
 00490401    mov         ecx,dword ptr [eax]
 00490403    call        dword ptr [ecx+0C]
 00490406    mov         eax,esi
 00490408    test        bl,bl
>0049040A    je          0049041B
 0049040C    call        @AfterConstruction
 00490411    pop         dword ptr fs:[0]
 00490418    add         esp,0C
 0049041B    mov         eax,esi
 0049041D    pop         esi
 0049041E    pop         ebx
 0049041F    ret
*}
end;

//00490420
constructor sub_00490420;
begin
{*
 00490420    push        ebx
 00490421    push        esi
 00490422    test        dl,dl
>00490424    je          0049042E
 00490426    add         esp,0FFFFFFF0
 00490429    call        @ClassCreate
 0049042E    mov         ebx,edx
 00490430    mov         esi,eax
 00490432    xor         edx,edx
 00490434    mov         eax,esi
 00490436    call        004666E0
 0049043B    mov         ecx,esi
 0049043D    mov         dl,1
 0049043F    mov         eax,[0048CCF8];TSkeletonRootBoneList
 00490444    call        TSkeletonRootBoneList.Create;TSkeletonRootBoneList.Create
 00490449    mov         dword ptr [esi+0C],eax;TSkeleton.?fC:TSkeletonRootBoneList
 0049044C    mov         ecx,esi
 0049044E    mov         dl,1
 00490450    mov         eax,[0048CB54];TSkeletonFrameList
 00490455    call        TSkeletonFrameList.Create;TSkeletonFrameList.Create
 0049045A    mov         dword ptr [esi+10],eax;TSkeleton.?f10:TSkeletonFrameList
 0049045D    mov         ecx,esi
 0049045F    mov         dl,1
 00490461    mov         eax,[0048CF84];TSkeletonColliderList
 00490466    call        TSkeletonColliderList.Create;TSkeletonColliderList.Create
 0049046B    mov         dword ptr [esi+1C],eax;TSkeleton.?f1C:TSkeletonColliderList
 0049046E    mov         eax,esi
 00490470    test        bl,bl
>00490472    je          00490483
 00490474    call        @AfterConstruction
 00490479    pop         dword ptr fs:[0]
 00490480    add         esp,0C
 00490483    mov         eax,esi
 00490485    pop         esi
 00490486    pop         ebx
 00490487    ret
*}
end;

//00490488
destructor TSkeleton.Destroy;
begin
{*
 00490488    push        ebx
 00490489    push        esi
 0049048A    call        @BeforeDestruction
 0049048F    mov         ebx,edx
 00490491    mov         esi,eax
 00490493    mov         eax,esi
 00490495    call        004905EC
 0049049A    mov         eax,dword ptr [esi+14];TSkeleton.?f14:dword
 0049049D    call        TObject.Free
 004904A2    mov         eax,dword ptr [esi+10];TSkeleton.?f10:TSkeletonFrameList
 004904A5    call        TObject.Free
 004904AA    mov         eax,dword ptr [esi+0C];TSkeleton.?fC:TSkeletonRootBoneList
 004904AD    call        TObject.Free
 004904B2    mov         eax,dword ptr [esi+1C];TSkeleton.?f1C:TSkeletonColliderList
 004904B5    call        TObject.Free
 004904BA    mov         edx,ebx
 004904BC    and         dl,0FC
 004904BF    mov         eax,esi
 004904C1    call        TPersistentObject.Destroy
 004904C6    test        bl,bl
>004904C8    jle         004904D1
 004904CA    mov         eax,esi
 004904CC    call        @ClassDestroy
 004904D1    pop         esi
 004904D2    pop         ebx
 004904D3    ret
*}
end;

//004904D4
{*procedure TSkeleton.sub_00466814(?:?);
begin
 004904D4    push        ebx
 004904D5    push        esi
 004904D6    push        edi
 004904D7    mov         edi,edx
 004904D9    mov         ebx,eax
 004904DB    mov         edx,edi
 004904DD    mov         eax,ebx
 004904DF    call        TPersistentObject.sub_00466814
 004904E4    mov         eax,dword ptr [ebx+1C];TSkeleton.?f1C:TSkeletonColliderList
 004904E7    cmp         dword ptr [eax+0C],0;TSkeletonColliderList.?fC:dword
>004904EB    jle         004904FB
 004904ED    mov         edx,1
 004904F2    mov         eax,edi
 004904F4    mov         ecx,dword ptr [eax]
 004904F6    call        dword ptr [ecx+8]
>004904F9    jmp         00490504
 004904FB    xor         edx,edx
 004904FD    mov         eax,edi
 004904FF    mov         ecx,dword ptr [eax]
 00490501    call        dword ptr [ecx+8]
 00490504    mov         edx,edi
 00490506    mov         eax,dword ptr [ebx+0C];TSkeleton.?fC:TSkeletonRootBoneList
 00490509    mov         si,0FFFC
 0049050D    call        @CallDynaInst;TSkeletonRootBoneList.sub_00466814
 00490512    mov         edx,edi
 00490514    mov         eax,dword ptr [ebx+10];TSkeleton.?f10:TSkeletonFrameList
 00490517    mov         si,0FFFC
 0049051B    call        @CallDynaInst;TPersistentObjectList.sub_00466814
 00490520    mov         eax,dword ptr [ebx+1C];TSkeleton.?f1C:TSkeletonColliderList
 00490523    cmp         dword ptr [eax+0C],0;TSkeletonColliderList.?fC:dword
>00490527    jle         00490537
 00490529    mov         edx,edi
 0049052B    mov         eax,dword ptr [ebx+10];TSkeleton.?f10:TSkeletonFrameList
 0049052E    mov         si,0FFFC
 00490532    call        @CallDynaInst;TPersistentObjectList.sub_00466814
 00490537    pop         edi
 00490538    pop         esi
 00490539    pop         ebx
 0049053A    ret
end;*}

//0049053C
{*procedure TSkeleton.sub_00466894(?:?);
begin
 0049053C    push        ebx
 0049053D    push        esi
 0049053E    push        edi
 0049053F    push        ebp
 00490540    mov         ebp,edx
 00490542    mov         edi,eax
 00490544    mov         edx,ebp
 00490546    mov         eax,edi
 00490548    call        TPersistentObject.sub_00466894
 0049054D    mov         eax,ebp
 0049054F    mov         edx,dword ptr [eax]
 00490551    call        dword ptr [edx+0C]
 00490554    mov         ebx,eax
 00490556    test        ebx,ebx
>00490558    je          0049055F
 0049055A    cmp         ebx,1
>0049055D    jne         0049058E
 0049055F    mov         edx,ebp
 00490561    mov         eax,dword ptr [edi+0C];TSkeleton.?fC:TSkeletonRootBoneList
 00490564    mov         si,0FFFB
 00490568    call        @CallDynaInst;TSkeletonRootBoneList.sub_00466894
 0049056D    mov         edx,ebp
 0049056F    mov         eax,dword ptr [edi+10];TSkeleton.?f10:TSkeletonFrameList
 00490572    mov         si,0FFFB
 00490576    call        @CallDynaInst;TSkeletonFrameList.sub_00466894
 0049057B    dec         ebx
>0049057C    jne         00490597
 0049057E    mov         edx,ebp
 00490580    mov         eax,dword ptr [edi+1C];TSkeleton.?f1C:TSkeletonColliderList
 00490583    mov         si,0FFFB
 00490587    call        @CallDynaInst;TSkeletonColliderList.sub_00466894
>0049058C    jmp         00490597
 0049058E    mov         edx,ebx
 00490590    mov         eax,edi
 00490592    call        00466914
 00490597    pop         ebp
 00490598    pop         edi
 00490599    pop         esi
 0049059A    pop         ebx
 0049059B    ret
end;*}

//0049059C
{*function sub_0049059C(?:dword):?;
begin
 0049059C    push        ebx
 0049059D    push        esi
 0049059E    mov         ebx,eax
 004905A0    cmp         dword ptr [ebx+14],0
>004905A4    jne         004905BC
 004905A6    xor         edx,edx
 004905A8    mov         eax,dword ptr [ebx+10]
 004905AB    call        0048FB64
 004905B0    mov         si,0FFFD
 004905B4    call        @CallDynaInst
 004905B9    mov         dword ptr [ebx+14],eax
 004905BC    mov         eax,dword ptr [ebx+14]
 004905BF    pop         esi
 004905C0    pop         ebx
 004905C1    ret
end;*}

//004905C4
{*procedure sub_004905C4(?:TSkeleton; ?:?);
begin
 004905C4    push        ebx
 004905C5    push        esi
 004905C6    push        edi
 004905C7    mov         edi,edx
 004905C9    mov         ebx,eax
 004905CB    mov         eax,dword ptr [ebx+14]
 004905CE    test        eax,eax
>004905D0    je          004905D7
 004905D2    call        TObject.Free
 004905D7    mov         eax,edi
 004905D9    mov         si,0FFFD
 004905DD    call        @CallDynaInst
 004905E2    mov         dword ptr [ebx+14],eax
 004905E5    pop         edi
 004905E6    pop         esi
 004905E7    pop         ebx
 004905E8    ret
end;*}

//004905EC
procedure sub_004905EC(?:TSkeleton);
begin
{*
 004905EC    push        ebx
 004905ED    mov         ebx,eax
 004905EF    mov         eax,dword ptr [ebx+18];TSkeleton.?f18:dword
 004905F2    call        TObject.Free
 004905F7    xor         eax,eax
 004905F9    mov         dword ptr [ebx+18],eax;TSkeleton.?f18:dword
 004905FC    pop         ebx
 004905FD    ret
*}
end;

//00490600
{*procedure sub_00490600(?:?; ?:?);
begin
 00490600    push        ebp
 00490601    mov         ebp,esp
 00490603    push        ebx
 00490604    push        esi
 00490605    push        edi
 00490606    mov         esi,eax
 00490608    mov         eax,dword ptr [ebp+8]
 0049060B    mov         eax,dword ptr [eax-4]
 0049060E    mov         eax,dword ptr [eax+18]
 00490611    mov         ecx,dword ptr [eax+8]
 00490614    mov         edx,dword ptr [esi+60]
 00490617    cmp         ecx,edx
>00490619    jg          00490624
 0049061B    mov         ecx,dword ptr [ebp+8]
 0049061E    inc         edx
 0049061F    call        TList.SetCount
 00490624    mov         eax,dword ptr [ebp+8]
 00490627    mov         eax,dword ptr [eax-4]
 0049062A    mov         eax,dword ptr [eax+18]
 0049062D    mov         ecx,esi
 0049062F    mov         edx,dword ptr [esi+60]
 00490632    call        TList.Put
 00490637    mov         ebx,dword ptr [esi+0C]
 0049063A    dec         ebx
 0049063B    test        ebx,ebx
>0049063D    jl          00490659
 0049063F    inc         ebx
 00490640    xor         edi,edi
 00490642    mov         eax,dword ptr [ebp+8]
 00490645    push        eax
 00490646    mov         edx,edi
 00490648    mov         eax,esi
 0049064A    call        0049006C
 0049064F    call        00490600
 00490654    pop         ecx
 00490655    inc         edi
 00490656    dec         ebx
>00490657    jne         00490642
 00490659    pop         edi
 0049065A    pop         esi
 0049065B    pop         ebx
 0049065C    pop         ebp
 0049065D    ret
end;*}

//00490660
{*function sub_00490660(?:dword; ?:?):?;
begin
 00490660    push        ebp
 00490661    mov         ebp,esp
 00490663    push        ecx
 00490664    push        ebx
 00490665    push        esi
 00490666    push        edi
 00490667    mov         edi,edx
 00490669    mov         dword ptr [ebp-4],eax
 0049066C    mov         eax,dword ptr [ebp-4]
 0049066F    cmp         dword ptr [eax+18],0
>00490673    jne         004906B0
 00490675    mov         dl,1
 00490677    mov         eax,[00417CEC];TList
 0049067C    call        TObject.Create;TList.Create
 00490681    mov         edx,dword ptr [ebp-4]
 00490684    mov         dword ptr [edx+18],eax
 00490687    mov         eax,dword ptr [ebp-4]
 0049068A    mov         eax,dword ptr [eax+0C]
 0049068D    mov         ebx,dword ptr [eax+0C]
 00490690    dec         ebx
 00490691    test        ebx,ebx
>00490693    jl          004906B0
 00490695    inc         ebx
 00490696    xor         esi,esi
 00490698    push        ebp
 00490699    mov         eax,dword ptr [ebp-4]
 0049069C    mov         eax,dword ptr [eax+0C]
 0049069F    mov         edx,esi
 004906A1    call        0048FCA0
 004906A6    call        00490600
 004906AB    pop         ecx
 004906AC    inc         esi
 004906AD    dec         ebx
>004906AE    jne         00490698
 004906B0    mov         eax,dword ptr [ebp-4]
 004906B3    mov         eax,dword ptr [eax+18]
 004906B6    mov         edx,edi
 004906B8    call        TList.Get
 004906BD    pop         edi
 004906BE    pop         esi
 004906BF    pop         ebx
 004906C0    pop         ecx
 004906C1    pop         ebp
 004906C2    ret
end;*}

//004906C4
{*procedure sub_004906C4(?:TSkeleton; ?:Integer; ?:?; ?:?);
begin
 004906C4    push        ebp
 004906C5    mov         ebp,esp
 004906C7    add         esp,0FFFFFFF8
 004906CA    push        ebx
 004906CB    push        esi
 004906CC    push        edi
 004906CD    mov         dword ptr [ebp-8],ecx
 004906D0    mov         dword ptr [ebp-4],edx
 004906D3    mov         ebx,eax
 004906D5    mov         eax,dword ptr [ebx+14]
 004906D8    test        eax,eax
>004906DA    je          004906E1
 004906DC    call        TObject.Free
 004906E1    mov         dl,1
 004906E3    mov         eax,[0048CA88];TSkeletonFrame
 004906E8    call        TSkeletonFrame.Create;TSkeletonFrame.Create
 004906ED    mov         dword ptr [ebx+14],eax
 004906F0    mov         edx,dword ptr [ebp-4]
 004906F3    mov         eax,dword ptr [ebx+10]
 004906F6    call        0048FB64
 004906FB    mov         al,byte ptr [eax+20]
 004906FE    mov         esi,dword ptr [ebx+14]
 00490701    mov         byte ptr [esi+20],al
 00490704    mov         edi,esi
 00490706    push        dword ptr [ebp+8]
 00490709    mov         edx,dword ptr [ebp-8]
 0049070C    mov         eax,dword ptr [ebx+10]
 0049070F    call        0048FB64
 00490714    mov         eax,dword ptr [eax+10]
 00490717    push        eax
 00490718    mov         edx,dword ptr [ebp-4]
 0049071B    mov         eax,dword ptr [ebx+10]
 0049071E    call        0048FB64
 00490723    mov         edx,dword ptr [eax+10]
 00490726    mov         eax,dword ptr [edi+10]
 00490729    pop         ecx
 0049072A    mov         si,0FFED
 0049072E    call        @CallDynaInst
 00490733    mov         al,byte ptr [edi+20]
 00490736    sub         al,1
>00490738    jb          0049073E
>0049073A    je          00490769
>0049073C    jmp         00490796
 0049073E    push        dword ptr [ebp+8]
 00490741    mov         edx,dword ptr [ebp-8]
 00490744    mov         eax,dword ptr [ebx+10]
 00490747    call        0048FB64
 0049074C    mov         eax,dword ptr [eax+14]
 0049074F    push        eax
 00490750    mov         edx,dword ptr [ebp-4]
 00490753    mov         eax,dword ptr [ebx+10]
 00490756    call        0048FB64
 0049075B    mov         edx,dword ptr [eax+14]
 0049075E    mov         eax,dword ptr [edi+14]
 00490761    pop         ecx
 00490762    call        0046870C
>00490767    jmp         00490796
 00490769    push        dword ptr [ebp+8]
 0049076C    mov         edx,dword ptr [ebp-8]
 0049076F    mov         eax,dword ptr [ebx+10]
 00490772    call        0048FB64
 00490777    mov         eax,dword ptr [eax+18]
 0049077A    push        eax
 0049077B    mov         edx,dword ptr [ebp-4]
 0049077E    mov         eax,dword ptr [ebx+10]
 00490781    call        0048FB64
 00490786    mov         edx,dword ptr [eax+18]
 00490789    mov         eax,dword ptr [edi+18]
 0049078C    pop         ecx
 0049078D    mov         si,0FFED
 00490791    call        @CallDynaInst
 00490796    pop         edi
 00490797    pop         esi
 00490798    pop         ebx
 00490799    pop         ecx
 0049079A    pop         ecx
 0049079B    pop         ebp
 0049079C    ret         4
end;*}

//004907A0
{*procedure sub_004907A0(?:TSkeleton; ?:?; ?:Longint);
begin
 004907A0    push        ebx
 004907A1    push        esi
 004907A2    push        edi
 004907A3    push        ebp
 004907A4    add         esp,0FFFFFFF4
 004907A7    mov         dword ptr [esp+4],ecx
 004907AB    mov         ebp,edx
 004907AD    mov         dword ptr [esp],eax
 004907B0    mov         ebx,dword ptr [esp+4]
 004907B4    sub         ebx,0
 004907B7    inc         ebx
 004907B8    cmp         ebx,1
>004907BB    jge         004907D1
 004907BD    mov         ecx,0C30
 004907C2    mov         edx,490B50;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 004907C7    mov         eax,490B94;'Assertion failure'
 004907CC    call        @Assert
 004907D1    xor         edi,edi
 004907D3    dec         ebx
>004907D4    jne         004907F7
 004907D6    mov         eax,edi
 004907D8    shl         eax,3
 004907DB    sub         eax,edi
 004907DD    lea         eax,[ebp+eax*4]
 004907E1    push        dword ptr [eax+8]
 004907E4    mov         ecx,dword ptr [eax+4]
 004907E7    mov         edx,dword ptr [eax]
 004907E9    mov         eax,dword ptr [esp+4]
 004907ED    call        004906C4
>004907F2    jmp         00490B3E
 004907F7    mov         eax,dword ptr [esp]
 004907FA    mov         eax,dword ptr [eax+14]
 004907FD    test        eax,eax
>004907FF    je          00490806
 00490801    call        TObject.Free
 00490806    mov         dl,1
 00490808    mov         eax,[0048CA88];TSkeletonFrame
 0049080D    call        TSkeletonFrame.Create;TSkeletonFrame.Create
 00490812    mov         edx,dword ptr [esp]
 00490815    mov         dword ptr [edx+14],eax
 00490818    mov         eax,edi
 0049081A    shl         eax,3
 0049081D    sub         eax,edi
 0049081F    mov         edx,dword ptr [ebp+eax*4]
 00490823    mov         eax,dword ptr [esp]
 00490826    mov         eax,dword ptr [eax+10]
 00490829    call        0048FB64
 0049082E    mov         al,byte ptr [eax+20]
 00490831    mov         edx,dword ptr [esp]
 00490834    mov         ebx,dword ptr [edx+14]
 00490837    mov         byte ptr [ebx+20],al
 0049083A    mov         dword ptr [esp+8],ebx
 0049083E    mov         dl,1
 00490840    mov         eax,[00467A00];TAffineVectorList
 00490845    call        TAffineVectorList.Create;TAffineVectorList.Create
 0049084A    mov         ebx,eax
 0049084C    mov         eax,edi
 0049084E    shl         eax,3
 00490851    sub         eax,edi
 00490853    push        dword ptr [ebp+eax*4+8]
 00490857    mov         eax,edi
 00490859    shl         eax,3
 0049085C    sub         eax,edi
 0049085E    mov         edx,dword ptr [ebp+eax*4+4]
 00490862    mov         eax,dword ptr [esp+4]
 00490866    mov         eax,dword ptr [eax+10]
 00490869    call        0048FB64
 0049086E    mov         eax,dword ptr [eax+10]
 00490871    push        eax
 00490872    mov         eax,edi
 00490874    shl         eax,3
 00490877    sub         eax,edi
 00490879    mov         edx,dword ptr [ebp+eax*4]
 0049087D    mov         eax,dword ptr [esp+8]
 00490881    mov         eax,dword ptr [eax+10]
 00490884    call        0048FB64
 00490889    mov         edx,dword ptr [eax+10]
 0049088C    mov         eax,dword ptr [esp+10]
 00490890    mov         eax,dword ptr [eax+10]
 00490893    pop         ecx
 00490894    mov         si,0FFED
 00490898    call        @CallDynaInst
 0049089D    mov         eax,edi
 0049089F    shl         eax,3
 004908A2    sub         eax,edi
 004908A4    fld         dword ptr [ebp+eax*4+0C]
 004908A8    fcomp       dword ptr ds:[490BA8];1:Single
 004908AE    fnstsw      al
 004908B0    sahf
>004908B1    je          004908CA
 004908B3    mov         eax,edi
 004908B5    shl         eax,3
 004908B8    sub         eax,edi
 004908BA    push        dword ptr [ebp+eax*4+0C]
 004908BE    mov         eax,dword ptr [esp+0C]
 004908C2    mov         eax,dword ptr [eax+10]
 004908C5    call        00468DD4
 004908CA    inc         edi
 004908CB    cmp         edi,dword ptr [esp+4]
>004908CF    jg          0049095A
 004908D5    mov         esi,edi
 004908D7    shl         esi,3
 004908DA    sub         esi,edi
 004908DC    cmp         dword ptr [ebp+esi*4+10],0
>004908E1    jne         0049092F
 004908E3    push        dword ptr [ebp+esi*4+8]
 004908E7    mov         edx,dword ptr [ebp+esi*4+4]
 004908EB    mov         eax,dword ptr [esp+4]
 004908EF    mov         eax,dword ptr [eax+10]
 004908F2    call        0048FB64
 004908F7    mov         eax,dword ptr [eax+10]
 004908FA    push        eax
 004908FB    mov         edx,dword ptr [ebp+esi*4]
 004908FF    mov         eax,dword ptr [esp+8]
 00490903    mov         eax,dword ptr [eax+10]
 00490906    call        0048FB64
 0049090B    mov         edx,dword ptr [eax+10]
 0049090E    mov         eax,ebx
 00490910    pop         ecx
 00490911    mov         si,0FFED
 00490915    call        @CallDynaInst;TAffineVectorList.sub_00468D00
 0049091A    push        3F800000
 0049091F    mov         eax,dword ptr [esp+0C]
 00490923    mov         eax,dword ptr [eax+10]
 00490926    mov         edx,ebx
 00490928    call        00468858
>0049092D    jmp         0049094F
 0049092F    push        3F800000
 00490934    mov         eax,edi
 00490936    shl         eax,3
 00490939    sub         eax,edi
 0049093B    mov         edx,dword ptr [ebp+eax*4+10]
 0049093F    mov         eax,dword ptr [esp+0C]
 00490943    mov         eax,dword ptr [eax+10]
 00490946    mov         si,0FFEC
 0049094A    call        @CallDynaInst
 0049094F    inc         edi
 00490950    cmp         edi,dword ptr [esp+4]
>00490954    jle         004908D5
 0049095A    mov         eax,ebx
 0049095C    call        TObject.Free
 00490961    xor         edi,edi
 00490963    mov         eax,dword ptr [esp+8]
 00490967    mov         al,byte ptr [eax+20]
 0049096A    sub         al,1
>0049096C    jb          00490979
>0049096E    je          00490A52
>00490974    jmp         00490B3E
 00490979    mov         dl,1
 0049097B    mov         eax,[00467A00];TAffineVectorList
 00490980    call        TAffineVectorList.Create;TAffineVectorList.Create
 00490985    mov         ebx,eax
 00490987    mov         esi,edi
 00490989    shl         esi,3
 0049098C    sub         esi,edi
 0049098E    push        dword ptr [ebp+esi*4+8]
 00490992    mov         edx,dword ptr [ebp+esi*4+4]
 00490996    mov         eax,dword ptr [esp+4]
 0049099A    mov         eax,dword ptr [eax+10]
 0049099D    call        0048FB64
 004909A2    mov         eax,dword ptr [eax+14]
 004909A5    push        eax
 004909A6    mov         edx,dword ptr [ebp+esi*4]
 004909AA    mov         eax,dword ptr [esp+8]
 004909AE    mov         eax,dword ptr [eax+10]
 004909B1    call        0048FB64
 004909B6    mov         edx,dword ptr [eax+14]
 004909B9    mov         eax,dword ptr [esp+10]
 004909BD    mov         eax,dword ptr [eax+14]
 004909C0    pop         ecx
 004909C1    call        0046870C
 004909C6    inc         edi
 004909C7    cmp         edi,dword ptr [esp+4]
>004909CB    jg          00490A46
 004909CD    mov         esi,edi
 004909CF    shl         esi,3
 004909D2    sub         esi,edi
 004909D4    cmp         dword ptr [ebp+esi*4+14],0
>004909D9    jne         00490A23
 004909DB    push        dword ptr [ebp+esi*4+8]
 004909DF    mov         edx,dword ptr [ebp+esi*4+4]
 004909E3    mov         eax,dword ptr [esp+4]
 004909E7    mov         eax,dword ptr [eax+10]
 004909EA    call        0048FB64
 004909EF    mov         eax,dword ptr [eax+14]
 004909F2    push        eax
 004909F3    mov         edx,dword ptr [ebp+esi*4]
 004909F7    mov         eax,dword ptr [esp+8]
 004909FB    mov         eax,dword ptr [eax+10]
 004909FE    call        0048FB64
 00490A03    mov         edx,dword ptr [eax+14]
 00490A06    mov         eax,ebx
 00490A08    pop         ecx
 00490A09    call        0046870C
 00490A0E    push        3F800000
 00490A13    mov         eax,dword ptr [esp+0C]
 00490A17    mov         eax,dword ptr [eax+14]
 00490A1A    mov         edx,ebx
 00490A1C    call        00468858
>00490A21    jmp         00490A3F
 00490A23    push        3F800000
 00490A28    mov         eax,edi
 00490A2A    shl         eax,3
 00490A2D    sub         eax,edi
 00490A2F    mov         edx,dword ptr [ebp+eax*4+14]
 00490A33    mov         eax,dword ptr [esp+0C]
 00490A37    mov         eax,dword ptr [eax+14]
 00490A3A    call        00468858
 00490A3F    inc         edi
 00490A40    cmp         edi,dword ptr [esp+4]
>00490A44    jle         004909CD
 00490A46    mov         eax,ebx
 00490A48    call        TObject.Free
>00490A4D    jmp         00490B3E
 00490A52    mov         dl,1
 00490A54    mov         eax,[00467E04];TQuaternionList
 00490A59    call        TQuaternionList.Create;TQuaternionList.Create
 00490A5E    mov         ebx,eax
 00490A60    mov         esi,edi
 00490A62    shl         esi,3
 00490A65    sub         esi,edi
 00490A67    push        dword ptr [ebp+esi*4+8]
 00490A6B    mov         edx,dword ptr [ebp+esi*4+4]
 00490A6F    mov         eax,dword ptr [esp+4]
 00490A73    mov         eax,dword ptr [eax+10]
 00490A76    call        0048FB64
 00490A7B    mov         eax,dword ptr [eax+18]
 00490A7E    push        eax
 00490A7F    mov         edx,dword ptr [ebp+esi*4]
 00490A83    mov         eax,dword ptr [esp+8]
 00490A87    mov         eax,dword ptr [eax+10]
 00490A8A    call        0048FB64
 00490A8F    mov         edx,dword ptr [eax+18]
 00490A92    mov         eax,dword ptr [esp+10]
 00490A96    mov         eax,dword ptr [eax+18]
 00490A99    pop         ecx
 00490A9A    mov         si,0FFED
 00490A9E    call        @CallDynaInst
 00490AA3    inc         edi
 00490AA4    cmp         edi,dword ptr [esp+4]
>00490AA8    jg          00490B37
 00490AAE    mov         esi,edi
 00490AB0    shl         esi,3
 00490AB3    sub         esi,edi
 00490AB5    cmp         dword ptr [ebp+esi*4+18],0
>00490ABA    jne         00490B0C
 00490ABC    push        dword ptr [ebp+esi*4+8]
 00490AC0    mov         edx,dword ptr [ebp+esi*4+4]
 00490AC4    mov         eax,dword ptr [esp+4]
 00490AC8    mov         eax,dword ptr [eax+10]
 00490ACB    call        0048FB64
 00490AD0    mov         eax,dword ptr [eax+18]
 00490AD3    push        eax
 00490AD4    mov         edx,dword ptr [ebp+esi*4]
 00490AD8    mov         eax,dword ptr [esp+8]
 00490ADC    mov         eax,dword ptr [eax+10]
 00490ADF    call        0048FB64
 00490AE4    mov         edx,dword ptr [eax+18]
 00490AE7    mov         eax,ebx
 00490AE9    pop         ecx
 00490AEA    mov         si,0FFED
 00490AEE    call        @CallDynaInst;TQuaternionList.sub_0046953C
 00490AF3    push        3F800000
 00490AF8    mov         eax,dword ptr [esp+0C]
 00490AFC    mov         eax,dword ptr [eax+18]
 00490AFF    mov         edx,ebx
 00490B01    mov         si,0FFEC
 00490B05    call        @CallDynaInst
>00490B0A    jmp         00490B2C
 00490B0C    push        3F800000
 00490B11    mov         eax,edi
 00490B13    shl         eax,3
 00490B16    sub         eax,edi
 00490B18    mov         edx,dword ptr [ebp+eax*4+18]
 00490B1C    mov         eax,dword ptr [esp+0C]
 00490B20    mov         eax,dword ptr [eax+18]
 00490B23    mov         si,0FFEC
 00490B27    call        @CallDynaInst
 00490B2C    inc         edi
 00490B2D    cmp         edi,dword ptr [esp+4]
>00490B31    jle         00490AAE
 00490B37    mov         eax,ebx
 00490B39    call        TObject.Free
 00490B3E    add         esp,0C
 00490B41    pop         ebp
 00490B42    pop         edi
 00490B43    pop         esi
 00490B44    pop         ebx
 00490B45    ret
end;*}

//00490BAC
{*procedure sub_00490BAC(?:TSkeleton; ?:?);
begin
 00490BAC    push        ebx
 00490BAD    push        esi
 00490BAE    push        edi
 00490BAF    push        ebp
 00490BB0    push        ecx
 00490BB1    mov         byte ptr [esp],dl
 00490BB4    mov         ebx,eax
 00490BB6    mov         eax,dword ptr [ebx+8]
 00490BB9    mov         eax,dword ptr [eax+0C8]
 00490BBF    cmp         dword ptr [eax+0C],0
>00490BC3    jle         00490C20
 00490BC5    mov         eax,dword ptr [ebx+0C]
 00490BC8    mov         edx,dword ptr [eax]
 00490BCA    call        dword ptr [edx+30]
 00490BCD    mov         eax,dword ptr [ebx+1C]
 00490BD0    cmp         dword ptr [eax+0C],0
>00490BD4    jle         00490BDB
 00490BD6    call        004903B0
 00490BDB    mov         eax,dword ptr [ebx+8]
 00490BDE    mov         eax,dword ptr [eax+0C8]
 00490BE4    mov         edi,dword ptr [eax+0C]
 00490BE7    dec         edi
 00490BE8    test        edi,edi
>00490BEA    jl          00490C20
 00490BEC    inc         edi
 00490BED    xor         ebp,ebp
 00490BEF    mov         eax,dword ptr [ebx+8]
 00490BF2    mov         eax,dword ptr [eax+0C8]
 00490BF8    mov         edx,ebp
 00490BFA    call        00492124
 00490BFF    mov         esi,eax
 00490C01    mov         eax,esi
 00490C03    mov         edx,dword ptr ds:[48D528];TSkeletonMeshObject
 00490C09    call        @IsClass
 00490C0E    test        al,al
>00490C10    je          00490C1C
 00490C12    mov         dl,byte ptr [esp]
 00490C15    mov         eax,esi
 00490C17    call        00492D0C
 00490C1C    inc         ebp
 00490C1D    dec         edi
>00490C1E    jne         00490BEF
 00490C20    pop         edx
 00490C21    pop         ebp
 00490C22    pop         edi
 00490C23    pop         esi
 00490C24    pop         ebx
 00490C25    ret
end;*}

//00490C28
{*procedure sub_00490C28(?:TSkeleton; ?:?);
begin
 00490C28    push        ebx
 00490C29    push        esi
 00490C2A    mov         esi,edx
 00490C2C    mov         ebx,eax
 00490C2E    mov         eax,esi
 00490C30    call        0049059C
 00490C35    push        eax
 00490C36    mov         eax,ebx
 00490C38    call        0049059C
 00490C3D    pop         edx
 00490C3E    mov         ecx,dword ptr [eax]
 00490C40    call        dword ptr [ecx+8]
 00490C43    mov         dl,1
 00490C45    mov         eax,ebx
 00490C47    call        00490BAC
 00490C4C    pop         esi
 00490C4D    pop         ebx
 00490C4E    ret
end;*}

//00490C50
procedure sub_00490C50(?:TSkeleton);
begin
{*
 00490C50    push        ebx
 00490C51    push        esi
 00490C52    mov         ebx,eax
 00490C54    mov         eax,ebx
 00490C56    call        004905EC
 00490C5B    mov         eax,dword ptr [ebx+0C]
 00490C5E    mov         si,0FFF3
 00490C62    call        @CallDynaInst
 00490C67    mov         eax,dword ptr [ebx+10]
 00490C6A    mov         si,0FFF4
 00490C6E    call        @CallDynaInst
 00490C73    mov         eax,dword ptr [ebx+14]
 00490C76    call        TObject.Free
 00490C7B    xor         eax,eax
 00490C7D    mov         dword ptr [ebx+14],eax
 00490C80    mov         eax,dword ptr [ebx+1C]
 00490C83    mov         si,0FFF4
 00490C87    call        @CallDynaInst
 00490C8C    pop         esi
 00490C8D    pop         ebx
 00490C8E    ret
*}
end;

//00490C90
constructor TMeshObject.Create;
begin
{*
 00490C90    push        ebp
 00490C91    mov         ebp,esp
 00490C93    push        ecx
 00490C94    push        ebx
 00490C95    test        dl,dl
>00490C97    je          00490CA1
 00490C99    add         esp,0FFFFFFF0
 00490C9C    call        @ClassCreate
 00490CA1    mov         byte ptr [ebp-1],dl
 00490CA4    mov         ebx,eax
 00490CA6    mov         dword ptr [ebx+18],ecx
 00490CA9    xor         edx,edx
 00490CAB    mov         eax,ebx
 00490CAD    mov         ecx,dword ptr [eax]
 00490CAF    call        dword ptr [ecx+0C]
 00490CB2    mov         eax,dword ptr [ebx+18]
 00490CB5    test        eax,eax
>00490CB7    je          00490CC0
 00490CB9    mov         edx,ebx
 00490CBB    call        00466E24
 00490CC0    mov         eax,ebx
 00490CC2    cmp         byte ptr [ebp-1],0
>00490CC6    je          00490CD7
 00490CC8    call        @AfterConstruction
 00490CCD    pop         dword ptr fs:[0]
 00490CD4    add         esp,0C
 00490CD7    mov         eax,ebx
 00490CD9    pop         ebx
 00490CDA    pop         ecx
 00490CDB    pop         ebp
 00490CDC    ret
*}
end;

//00490CE0
constructor sub_00490CE0;
begin
{*
 00490CE0    push        ebx
 00490CE1    push        esi
 00490CE2    test        dl,dl
>00490CE4    je          00490CEE
 00490CE6    add         esp,0FFFFFFF0
 00490CE9    call        @ClassCreate
 00490CEE    mov         ebx,edx
 00490CF0    mov         esi,eax
 00490CF2    mov         byte ptr [esi+2C],0;TMeshObject.?f2C:byte
 00490CF6    mov         dl,1
 00490CF8    mov         eax,[00467A00];TAffineVectorList
 00490CFD    call        TAffineVectorList.Create;TAffineVectorList.Create
 00490D02    mov         dword ptr [esi+1C],eax;TMeshObject.?f1C:TAffineVectorList
 00490D05    mov         dl,1
 00490D07    mov         eax,[00467B70];TTexPointList
 00490D0C    call        TTexPointList.Create;TTexPointList.Create
 00490D11    mov         dword ptr [esi+20],eax;TMeshObject.?f20:TTexPointList
 00490D14    mov         dl,1
 00490D16    mov         eax,[00467AC4];TVectorList
 00490D1B    call        TVectorList.Create;TVectorList.Create
 00490D20    mov         dword ptr [esi+24],eax;TMeshObject.?f24:TVectorList
 00490D23    mov         ecx,esi
 00490D25    mov         dl,1
 00490D27    mov         eax,[0048D97C];TFaceGroups
 00490D2C    call        TFaceGroups.Create;TFaceGroups.Create
 00490D31    mov         dword ptr [esi+28],eax;TMeshObject.?f28:TFaceGroups
 00490D34    mov         dl,1
 00490D36    mov         eax,[00417CEC];TList
 00490D3B    call        TObject.Create;TList.Create
 00490D40    mov         dword ptr [esi+34],eax;TMeshObject.?f34:TList
 00490D43    mov         dword ptr [esi+3C],1;TMeshObject.?f3C:dword
 00490D4A    mov         dword ptr [esi+38],2;TMeshObject.?f38:dword
 00490D51    xor         edx,edx
 00490D53    mov         eax,esi
 00490D55    call        TBaseMeshObject.Create
 00490D5A    mov         eax,esi
 00490D5C    test        bl,bl
>00490D5E    je          00490D6F
 00490D60    call        @AfterConstruction
 00490D65    pop         dword ptr fs:[0]
 00490D6C    add         esp,0C
 00490D6F    mov         eax,esi
 00490D71    pop         esi
 00490D72    pop         ebx
 00490D73    ret
*}
end;

//00490D74
destructor TMeshObject.Destroy;
begin
{*
 00490D74    push        ebx
 00490D75    push        esi
 00490D76    push        edi
 00490D77    push        ebp
 00490D78    call        @BeforeDestruction
 00490D7D    mov         ebx,edx
 00490D7F    mov         ebp,eax
 00490D81    mov         eax,dword ptr [ebp+28];TMeshObject.?f28:TFaceGroups
 00490D84    call        TObject.Free
 00490D89    mov         eax,dword ptr [ebp+24];TMeshObject.?f24:TVectorList
 00490D8C    call        TObject.Free
 00490D91    mov         eax,dword ptr [ebp+1C];TMeshObject.?f1C:TAffineVectorList
 00490D94    call        TObject.Free
 00490D99    mov         eax,dword ptr [ebp+20];TMeshObject.?f20:TTexPointList
 00490D9C    call        TObject.Free
 00490DA1    mov         eax,dword ptr [ebp+34];TMeshObject.?f34:TList
 00490DA4    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 00490DA7    dec         esi
 00490DA8    test        esi,esi
>00490DAA    jl          00490DC2
 00490DAC    inc         esi
 00490DAD    xor         edi,edi
 00490DAF    mov         eax,dword ptr [ebp+34];TMeshObject.?f34:TList
 00490DB2    mov         edx,edi
 00490DB4    call        TList.Get
 00490DB9    call        TObject.Free
 00490DBE    inc         edi
 00490DBF    dec         esi
>00490DC0    jne         00490DAF
 00490DC2    mov         eax,dword ptr [ebp+34];TMeshObject.?f34:TList
 00490DC5    call        TObject.Free
 00490DCA    mov         eax,dword ptr [ebp+18];TMeshObject.?f18:dword
 00490DCD    test        eax,eax
>00490DCF    je          00490DD8
 00490DD1    mov         edx,ebp
 00490DD3    call        00466F94
 00490DD8    mov         edx,ebx
 00490DDA    and         dl,0FC
 00490DDD    mov         eax,ebp
 00490DDF    call        TBaseMeshObject.Destroy
 00490DE4    test        bl,bl
>00490DE6    jle         00490DEF
 00490DE8    mov         eax,ebp
 00490DEA    call        @ClassDestroy
 00490DEF    pop         ebp
 00490DF0    pop         edi
 00490DF1    pop         esi
 00490DF2    pop         ebx
 00490DF3    ret
*}
end;

//00490DF4
{*procedure TMeshObject.sub_00466814(?:?);
begin
 00490DF4    push        ebx
 00490DF5    push        esi
 00490DF6    push        edi
 00490DF7    push        ebp
 00490DF8    push        ecx
 00490DF9    mov         edi,edx
 00490DFB    mov         ebx,eax
 00490DFD    mov         edx,edi
 00490DFF    mov         eax,ebx
 00490E01    call        TBaseMeshObject.sub_00466814
 00490E06    mov         edx,2
 00490E0B    mov         eax,edi
 00490E0D    mov         ecx,dword ptr [eax]
 00490E0F    call        dword ptr [ecx+8]
 00490E12    mov         edx,edi
 00490E14    mov         eax,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 00490E17    mov         si,0FFFC
 00490E1B    call        @CallDynaInst;TBaseVectorList.sub_00466814
 00490E20    mov         edx,edi
 00490E22    mov         eax,dword ptr [ebx+20];TMeshObject.?f20:TTexPointList
 00490E25    mov         si,0FFFC
 00490E29    call        @CallDynaInst;TBaseList.sub_00466814
 00490E2E    mov         edx,edi
 00490E30    mov         eax,dword ptr [ebx+24];TMeshObject.?f24:TVectorList
 00490E33    mov         si,0FFFC
 00490E37    call        @CallDynaInst;TBaseVectorList.sub_00466814
 00490E3C    mov         edx,edi
 00490E3E    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00490E41    mov         si,0FFFC
 00490E45    call        @CallDynaInst;TPersistentObjectList.sub_00466814
 00490E4A    xor         edx,edx
 00490E4C    mov         dl,byte ptr [ebx+2C];TMeshObject.?f2C:byte
 00490E4F    mov         eax,edi
 00490E51    mov         ecx,dword ptr [eax]
 00490E53    call        dword ptr [ecx+8]
 00490E56    mov         edx,1
 00490E5B    mov         eax,edi
 00490E5D    mov         ecx,dword ptr [eax]
 00490E5F    call        dword ptr [ecx+8]
 00490E62    lea         edx,[ebx+2D];TMeshObject.?f2D:?
 00490E65    mov         ecx,1
 00490E6A    mov         eax,edi
 00490E6C    mov         esi,dword ptr [eax]
 00490E6E    call        dword ptr [esi+4]
 00490E71    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00490E74    mov         edx,dword ptr [eax+8];TList.FCount:Integer
 00490E77    mov         eax,edi
 00490E79    mov         ecx,dword ptr [eax]
 00490E7B    call        dword ptr [ecx+8]
 00490E7E    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00490E81    mov         ebp,dword ptr [eax+8];TList.FCount:Integer
 00490E84    dec         ebp
 00490E85    test        ebp,ebp
>00490E87    jl          00490EAC
 00490E89    inc         ebp
 00490E8A    mov         dword ptr [esp],0
 00490E91    mov         edx,dword ptr [esp]
 00490E94    mov         eax,ebx
 00490E96    call        00491348
 00490E9B    mov         edx,edi
 00490E9D    mov         si,0FFFC
 00490EA1    call        @CallDynaInst
 00490EA6    inc         dword ptr [esp]
 00490EA9    dec         ebp
>00490EAA    jne         00490E91
 00490EAC    mov         edx,dword ptr [ebx+38];TMeshObject.?f38:dword
 00490EAF    mov         eax,edi
 00490EB1    mov         ecx,dword ptr [eax]
 00490EB3    call        dword ptr [ecx+8]
 00490EB6    mov         edx,dword ptr [ebx+3C];TMeshObject.?f3C:dword
 00490EB9    mov         eax,edi
 00490EBB    mov         ecx,dword ptr [eax]
 00490EBD    call        dword ptr [ecx+8]
 00490EC0    pop         edx
 00490EC1    pop         ebp
 00490EC2    pop         edi
 00490EC3    pop         esi
 00490EC4    pop         ebx
 00490EC5    ret
end;*}

//00490EC8
{*procedure TMeshObject.sub_00466894(?:?);
begin
 00490EC8    push        ebx
 00490EC9    push        esi
 00490ECA    push        edi
 00490ECB    push        ebp
 00490ECC    push        ecx
 00490ECD    mov         edi,edx
 00490ECF    mov         ebx,eax
 00490ED1    mov         edx,edi
 00490ED3    mov         eax,ebx
 00490ED5    call        TBaseMeshObject.sub_00466894
 00490EDA    mov         eax,edi
 00490EDC    mov         edx,dword ptr [eax]
 00490EDE    call        dword ptr [edx+0C]
 00490EE1    mov         ebp,eax
 00490EE3    mov         eax,ebp
 00490EE5    sub         eax,3
>00490EE8    jae         00490FC4
 00490EEE    mov         edx,edi
 00490EF0    mov         eax,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 00490EF3    mov         si,0FFFB
 00490EF7    call        @CallDynaInst;TBaseVectorList.sub_00466894
 00490EFC    cmp         ebp,1
>00490EFF    jl          00490F11
 00490F01    mov         edx,edi
 00490F03    mov         eax,dword ptr [ebx+20];TMeshObject.?f20:TTexPointList
 00490F06    mov         si,0FFFB
 00490F0A    call        @CallDynaInst;TBaseList.sub_00466894
>00490F0F    jmp         00490F19
 00490F11    mov         eax,dword ptr [ebx+20];TMeshObject.?f20:TTexPointList
 00490F14    call        00468280
 00490F19    mov         edx,edi
 00490F1B    mov         eax,dword ptr [ebx+24];TMeshObject.?f24:TVectorList
 00490F1E    mov         si,0FFFB
 00490F22    call        @CallDynaInst;TBaseVectorList.sub_00466894
 00490F27    mov         edx,edi
 00490F29    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00490F2C    mov         si,0FFFB
 00490F30    call        @CallDynaInst;TFaceGroups.sub_00466894
 00490F35    mov         eax,edi
 00490F37    mov         edx,dword ptr [eax]
 00490F39    call        dword ptr [edx+0C]
 00490F3C    mov         byte ptr [ebx+2C],al;TMeshObject.?f2C:byte
 00490F3F    mov         eax,edi
 00490F41    mov         edx,dword ptr [eax]
 00490F43    call        dword ptr [edx+0C]
 00490F46    dec         eax
>00490F47    je          00490F5D
 00490F49    mov         ecx,0D24
 00490F4E    mov         edx,490FDC;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00490F53    mov         eax,491020;'Assertion failure'
 00490F58    call        @Assert
 00490F5D    lea         edx,[ebx+2D];TMeshObject.?f2D:?
 00490F60    mov         ecx,1
 00490F65    mov         eax,edi
 00490F67    mov         esi,dword ptr [eax]
 00490F69    call        dword ptr [esi+4]
 00490F6C    cmp         ebp,2
>00490F6F    jl          00490FCD
 00490F71    mov         eax,edi
 00490F73    mov         edx,dword ptr [eax]
 00490F75    call        dword ptr [edx+0C]
 00490F78    mov         ebp,eax
 00490F7A    dec         ebp
 00490F7B    test        ebp,ebp
>00490F7D    jl          00490FA2
 00490F7F    inc         ebp
 00490F80    mov         dword ptr [esp],0
 00490F87    mov         edx,dword ptr [esp]
 00490F8A    mov         eax,ebx
 00490F8C    call        00491348
 00490F91    mov         edx,edi
 00490F93    mov         si,0FFFB
 00490F97    call        @CallDynaInst
 00490F9C    inc         dword ptr [esp]
 00490F9F    dec         ebp
>00490FA0    jne         00490F87
 00490FA2    mov         eax,edi
 00490FA4    mov         edx,dword ptr [eax]
 00490FA6    call        dword ptr [edx+0C]
 00490FA9    mov         edx,eax
 00490FAB    mov         eax,ebx
 00490FAD    call        00491388
 00490FB2    mov         eax,edi
 00490FB4    mov         edx,dword ptr [eax]
 00490FB6    call        dword ptr [edx+0C]
 00490FB9    mov         edx,eax
 00490FBB    mov         eax,ebx
 00490FBD    call        00491414
>00490FC2    jmp         00490FCD
 00490FC4    mov         edx,ebp
 00490FC6    mov         eax,ebx
 00490FC8    call        00466914
 00490FCD    pop         edx
 00490FCE    pop         ebp
 00490FCF    pop         edi
 00490FD0    pop         esi
 00490FD1    pop         ebx
 00490FD2    ret
end;*}

//00491034
procedure TMeshObject.sub_0048EF2C;
begin
{*
 00491034    push        ebx
 00491035    push        esi
 00491036    push        edi
 00491037    mov         ebx,eax
 00491039    mov         eax,ebx
 0049103B    call        TBaseMeshObject.sub_0048EF2C
 00491040    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491043    mov         si,0FFF4
 00491047    call        @CallDynaInst;TFaceGroups.sub_00466E50
 0049104C    mov         eax,dword ptr [ebx+24];TMeshObject.?f24:TVectorList
 0049104F    call        00468280
 00491054    mov         eax,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 00491057    call        00468280
 0049105C    mov         eax,dword ptr [ebx+20];TMeshObject.?f20:TTexPointList
 0049105F    call        00468280
 00491064    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00491067    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 0049106A    dec         esi
 0049106B    test        esi,esi
>0049106D    jl          00491084
 0049106F    inc         esi
 00491070    xor         edi,edi
 00491072    mov         edx,edi
 00491074    mov         eax,ebx
 00491076    call        00491348
 0049107B    call        00468280
 00491080    inc         edi
 00491081    dec         esi
>00491082    jne         00491072
 00491084    pop         edi
 00491085    pop         esi
 00491086    pop         ebx
 00491087    ret
*}
end;

//00491088
{*procedure TMeshObject.sub_0048F540(?:?; ?:?);
begin
 00491088    push        ebx
 00491089    push        esi
 0049108A    push        edi
 0049108B    push        ebp
 0049108C    mov         ebp,ecx
 0049108E    mov         edi,edx
 00491090    mov         ebx,eax
 00491092    mov         al,byte ptr [ebx+2C];TMeshObject.?f2C:byte
 00491095    sub         al,1
>00491097    jb          004910A1
>00491099    je          004910CC
 0049109B    dec         al
>0049109D    je          00491102
>0049109F    jmp         0049111F
 004910A1    xor         ecx,ecx
 004910A3    xor         edx,edx
 004910A5    mov         eax,ebx
 004910A7    call        TBaseMeshObject.sub_0048F540
 004910AC    mov         esi,eax
 004910AE    test        edi,edi
>004910B0    je          004910BC
 004910B2    mov         edx,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 004910B5    mov         eax,edi
 004910B7    mov         ecx,dword ptr [eax]
 004910B9    call        dword ptr [ecx+8]
 004910BC    test        ebp,ebp
>004910BE    je          00491135
 004910C0    mov         edx,dword ptr [ebx+10];TMeshObject.?f10:TAffineVectorList
 004910C3    mov         eax,ebp
 004910C5    mov         ecx,dword ptr [eax]
 004910C7    call        dword ptr [ecx+8]
>004910CA    jmp         00491135
 004910CC    mov         dl,1
 004910CE    mov         eax,[00467A00];TAffineVectorList
 004910D3    call        TAffineVectorList.Create;TAffineVectorList.Create
 004910D8    mov         esi,eax
 004910DA    mov         edx,esi
 004910DC    mov         eax,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 004910DF    call        0048C064
 004910E4    test        edi,edi
>004910E6    je          004910F2
 004910E8    mov         edx,edi
 004910EA    mov         eax,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 004910ED    call        0048C064
 004910F2    test        ebp,ebp
>004910F4    je          00491135
 004910F6    mov         edx,ebp
 004910F8    mov         eax,dword ptr [ebx+10];TMeshObject.?f10:TAffineVectorList
 004910FB    call        0048C064
>00491100    jmp         00491135
 00491102    mov         dl,1
 00491104    mov         eax,[00467A00];TAffineVectorList
 00491109    call        TAffineVectorList.Create;TAffineVectorList.Create
 0049110E    mov         esi,eax
 00491110    push        ebp
 00491111    mov         ecx,edi
 00491113    mov         edx,esi
 00491115    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491118    call        00494214
>0049111D    jmp         00491135
 0049111F    xor         esi,esi
 00491121    mov         ecx,0D5A
 00491126    mov         edx,491144;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 0049112B    mov         eax,491188;'Assertion failure'
 00491130    call        @Assert
 00491135    mov         eax,esi
 00491137    pop         ebp
 00491138    pop         edi
 00491139    pop         esi
 0049113A    pop         ebx
 0049113B    ret
end;*}

//0049119C
procedure TMeshObject.sub_0049119C;
begin
{*
 0049119C    push        ebx
 0049119D    push        esi
 0049119E    push        edi
 0049119F    push        ebp
 004911A0    push        ecx
 004911A1    mov         ebx,eax
 004911A3    mov         al,byte ptr [ebx+2C];TMeshObject.?f2C:byte
 004911A6    sub         al,1
>004911A8    jb          004911B2
>004911AA    je          004911C4
 004911AC    dec         al
>004911AE    je          004911D5
>004911B0    jmp         00491208
 004911B2    mov         eax,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 004911B5    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 004911B8    mov         ecx,3
 004911BD    cdq
 004911BE    idiv        eax,ecx
 004911C0    mov         ebp,eax
>004911C2    jmp         0049121E
 004911C4    mov         eax,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 004911C7    mov         ebp,dword ptr [eax+8];TAffineVectorList.?f8:dword
 004911CA    sub         ebp,2
 004911CD    test        ebp,ebp
>004911CF    jge         0049121E
 004911D1    xor         ebp,ebp
>004911D3    jmp         0049121E
 004911D5    xor         ebp,ebp
 004911D7    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 004911DA    mov         edi,dword ptr [eax+0C];TFaceGroups.?fC:dword
 004911DD    dec         edi
 004911DE    test        edi,edi
>004911E0    jl          0049121E
 004911E2    inc         edi
 004911E3    mov         dword ptr [esp],0
 004911EA    mov         edx,dword ptr [esp]
 004911ED    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 004911F0    call        004941BC
 004911F5    mov         si,0FFF3
 004911F9    call        @CallDynaInst
 004911FE    add         ebp,eax
 00491200    inc         dword ptr [esp]
 00491203    dec         edi
>00491204    jne         004911EA
>00491206    jmp         0049121E
 00491208    xor         ebp,ebp
 0049120A    mov         ecx,0D72
 0049120F    mov         edx,491230;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00491214    mov         eax,491274;'Assertion failure'
 00491219    call        @Assert
 0049121E    mov         eax,ebp
 00491220    pop         edx
 00491221    pop         ebp
 00491222    pop         edi
 00491223    pop         esi
 00491224    pop         ebx
 00491225    ret
*}
end;

//00491288
{*procedure sub_00491288(?:?);
begin
 00491288    mov         eax,dword ptr [eax+28]
 0049128B    call        004941C4
 00491290    ret
end;*}

//00491294
{*procedure sub_00491294(?:?);
begin
 00491294    mov         eax,dword ptr [eax+28]
 00491297    call        004941F0
 0049129C    ret
end;*}

//004912A0
procedure TMeshObject.sub_004912A0;
begin
{*
 004912A0    push        esi
 004912A1    mov         eax,dword ptr [eax+0C];TMeshObject.?fC:TAffineVectorList
 004912A4    mov         si,0FFF4
 004912A8    call        @CallDynaInst;TBaseVectorList.sub_0046837C
 004912AD    pop         esi
 004912AE    ret
*}
end;

//004912B0
procedure TMeshObject.sub_004912B0;
begin
{*
 004912B0    push        ebx
 004912B1    push        esi
 004912B2    push        edi
 004912B3    push        ebp
 004912B4    mov         ebp,eax
 004912B6    mov         eax,dword ptr [ebp+28];TMeshObject.?f28:TFaceGroups
 004912B9    mov         ebx,dword ptr [eax+0C];TFaceGroups.?fC:dword
 004912BC    dec         ebx
 004912BD    test        ebx,ebx
>004912BF    jl          004912DB
 004912C1    inc         ebx
 004912C2    xor         edi,edi
 004912C4    mov         eax,dword ptr [ebp+28];TMeshObject.?f28:TFaceGroups
 004912C7    mov         edx,edi
 004912C9    call        004941BC
 004912CE    mov         si,0FFF1
 004912D2    call        @CallDynaInst
 004912D7    inc         edi
 004912D8    dec         ebx
>004912D9    jne         004912C4
 004912DB    pop         ebp
 004912DC    pop         edi
 004912DD    pop         esi
 004912DE    pop         ebx
 004912DF    ret
*}
end;

//004912E0
{*procedure sub_004912E0(?:?);
begin
 004912E0    push        esi
 004912E1    push        edi
 004912E2    add         esp,0FFFFFFE8
 004912E5    mov         edi,edx
 004912E7    lea         ecx,[esp+0C]
 004912EB    mov         edx,esp
 004912ED    mov         si,0FFEF
 004912F1    call        @CallDynaInst;TMeshObject.sub_004912A0
 004912F6    fld         dword ptr [edi]
 004912F8    fcomp       dword ptr [esp]
 004912FB    fnstsw      al
 004912FD    sahf
>004912FE    jb          0049133B
 00491300    fld         dword ptr [edi+4]
 00491303    fcomp       dword ptr [esp+4]
 00491307    fnstsw      al
 00491309    sahf
>0049130A    jb          0049133B
 0049130C    fld         dword ptr [edi+8]
 0049130F    fcomp       dword ptr [esp+8]
 00491313    fnstsw      al
 00491315    sahf
>00491316    jb          0049133B
 00491318    fld         dword ptr [edi]
 0049131A    fcomp       dword ptr [esp+0C]
 0049131E    fnstsw      al
 00491320    sahf
>00491321    ja          0049133B
 00491323    fld         dword ptr [edi+4]
 00491326    fcomp       dword ptr [esp+10]
 0049132A    fnstsw      al
 0049132C    sahf
>0049132D    ja          0049133B
 0049132F    fld         dword ptr [edi+8]
 00491332    fcomp       dword ptr [esp+14]
 00491336    fnstsw      al
 00491338    sahf
>00491339    jbe         0049133F
 0049133B    xor         eax,eax
>0049133D    jmp         00491341
 0049133F    mov         al,1
 00491341    add         esp,18
 00491344    pop         edi
 00491345    pop         esi
 00491346    ret
end;*}

//00491348
{*function sub_00491348(?:TMeshObject; ?:?):?;
begin
 00491348    push        ebx
 00491349    push        esi
 0049134A    push        edi
 0049134B    mov         edi,edx
 0049134D    mov         ebx,eax
 0049134F    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00491352    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00491355    dec         eax
 00491356    cmp         edi,eax
>00491358    jle         0049137A
 0049135A    mov         esi,edi
 0049135C    sub         esi,eax
>0049135E    jl          0049137A
 00491360    inc         esi
 00491361    mov         dl,1
 00491363    mov         eax,[00467AC4];TVectorList
 00491368    call        TVectorList.Create;TVectorList.Create
 0049136D    mov         edx,eax
 0049136F    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00491372    call        TList.Add
 00491377    dec         esi
>00491378    jne         00491361
 0049137A    mov         edx,edi
 0049137C    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 0049137F    call        TList.Get
 00491384    pop         edi
 00491385    pop         esi
 00491386    pop         ebx
 00491387    ret
end;*}

//00491388
{*procedure sub_00491388(?:TMeshObject; ?:?);
begin
 00491388    push        ebx
 00491389    push        esi
 0049138A    mov         esi,edx
 0049138C    mov         ebx,eax
 0049138E    test        esi,esi
>00491390    jge         004913A6
 00491392    mov         ecx,0DDA
 00491397    mov         edx,4913BC;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 0049139C    mov         eax,491400;'Assertion failure'
 004913A1    call        @Assert
 004913A6    cmp         esi,dword ptr [ebx+38];TMeshObject.?f38:dword
>004913A9    je          004913AE
 004913AB    mov         dword ptr [ebx+38],esi;TMeshObject.?f38:dword
 004913AE    pop         esi
 004913AF    pop         ebx
 004913B0    ret
end;*}

//00491414
{*procedure sub_00491414(?:TMeshObject; ?:?);
begin
 00491414    push        ebx
 00491415    push        esi
 00491416    mov         esi,edx
 00491418    mov         ebx,eax
 0049141A    test        esi,esi
>0049141C    jge         00491432
 0049141E    mov         ecx,0DF2
 00491423    mov         edx,491448;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00491428    mov         eax,49148C;'Assertion failure'
 0049142D    call        @Assert
 00491432    cmp         esi,dword ptr [ebx+3C];TMeshObject.?f3C:dword
>00491435    je          0049143A
 00491437    mov         dword ptr [ebx+3C],esi;TMeshObject.?f3C:dword
 0049143A    pop         esi
 0049143B    pop         ebx
 0049143C    ret
end;*}

//004914A0
{*procedure sub_004914A0(?:TMeshObject; ?:?; ?:?);
begin
 004914A0    push        ebx
 004914A1    push        esi
 004914A2    push        edi
 004914A3    push        ebp
 004914A4    mov         esi,edx
 004914A6    mov         ebx,eax
 004914A8    test        cl,cl
>004914AA    jne         004914B6
 004914AC    cmp         byte ptr [ebx+2E],0
>004914B0    jne         004916B6
 004914B6    mov         eax,dword ptr [ebx+0C]
 004914B9    cmp         dword ptr [eax+8],0
>004914BD    jle         004914E0
 004914BF    push        8074
 004914C4    call        OpenGL32.glEnableClientState
 004914C9    mov         eax,dword ptr [ebx+0C]
 004914CC    mov         eax,dword ptr [eax+24]
 004914CF    push        eax
 004914D0    push        0
 004914D2    push        1406
 004914D7    push        3
 004914D9    call        OpenGL32.glVertexPointer
>004914DE    jmp         004914EA
 004914E0    push        8074
 004914E5    call        OpenGL32.glDisableClientState
 004914EA    cmp         byte ptr [esi+0FA],0
>004914F1    jne         00491650
 004914F7    mov         eax,dword ptr [ebx+10]
 004914FA    cmp         dword ptr [eax+8],0
>004914FE    jle         0049151F
 00491500    push        8075
 00491505    call        OpenGL32.glEnableClientState
 0049150A    mov         eax,dword ptr [ebx+10]
 0049150D    mov         eax,dword ptr [eax+24]
 00491510    push        eax
 00491511    push        0
 00491513    push        1406
 00491518    call        OpenGL32.glNormalPointer
>0049151D    jmp         00491529
 0049151F    push        8075
 00491524    call        OpenGL32.glDisableClientState
 00491529    mov         eax,dword ptr [ebx+24]
 0049152C    cmp         dword ptr [eax+8],0
>00491530    jle         0049155C
 00491532    cmp         byte ptr [esi+0FA],0
>00491539    jne         0049155C
 0049153B    push        8076
 00491540    call        OpenGL32.glEnableClientState
 00491545    mov         eax,dword ptr [ebx+24]
 00491548    mov         eax,dword ptr [eax+24]
 0049154B    push        eax
 0049154C    push        0
 0049154E    push        1406
 00491553    push        4
 00491555    call        OpenGL32.glColorPointer
>0049155A    jmp         00491566
 0049155C    push        8076
 00491561    call        OpenGL32.glDisableClientState
 00491566    mov         eax,dword ptr [ebx+1C]
 00491569    cmp         dword ptr [eax+8],0
>0049156D    jle         00491598
 0049156F    push        8078
 00491574    mov         eax,[005AE600];^gvar_005E1370
 00491579    mov         eax,dword ptr [eax]
 0049157B    call        eax
 0049157D    mov         eax,dword ptr [ebx+1C]
 00491580    mov         eax,dword ptr [eax+24]
 00491583    push        eax
 00491584    push        0C
 00491586    push        1406
 0049158B    push        2
 0049158D    mov         eax,[005AE1B4];^gvar_005E136C
 00491592    mov         eax,dword ptr [eax]
 00491594    call        eax
>00491596    jmp         004915A6
 00491598    push        8078
 0049159D    mov         eax,[005AE624];^gvar_005E1374
 004915A2    mov         eax,dword ptr [eax]
 004915A4    call        eax
 004915A6    mov         eax,[005AE588];^gvar_005E0CE2
 004915AB    cmp         byte ptr [eax],0
>004915AE    je          00491672
 004915B4    mov         eax,dword ptr [ebx+20]
 004915B7    cmp         dword ptr [eax+8],0
>004915BB    jle         004915EA
 004915BD    push        84C1
 004915C2    mov         eax,[005AE6B8];^gvar_005E0E8C
 004915C7    mov         eax,dword ptr [eax]
 004915C9    call        eax
 004915CB    mov         eax,dword ptr [ebx+20]
 004915CE    mov         eax,dword ptr [eax+24]
 004915D1    push        eax
 004915D2    push        8
 004915D4    push        1406
 004915D9    push        2
 004915DB    call        OpenGL32.glTexCoordPointer
 004915E0    push        8078
 004915E5    call        OpenGL32.glEnableClientState
 004915EA    mov         eax,dword ptr [ebx+34]
 004915ED    mov         ebp,dword ptr [eax+8]
 004915F0    dec         ebp
 004915F1    test        ebp,ebp
>004915F3    jl          00491640
 004915F5    inc         ebp
 004915F6    xor         edi,edi
 004915F8    mov         edx,edi
 004915FA    mov         eax,ebx
 004915FC    call        00491348
 00491601    cmp         dword ptr [eax+8],0
>00491605    jle         0049163C
 00491607    lea         eax,[edi+84C0]
 0049160D    push        eax
 0049160E    mov         eax,[005AE6B8];^gvar_005E0E8C
 00491613    mov         eax,dword ptr [eax]
 00491615    call        eax
 00491617    mov         edx,edi
 00491619    mov         eax,ebx
 0049161B    call        00491348
 00491620    mov         eax,dword ptr [eax+24]
 00491623    push        eax
 00491624    push        10
 00491626    push        1406
 0049162B    push        4
 0049162D    call        OpenGL32.glTexCoordPointer
 00491632    push        8078
 00491637    call        OpenGL32.glEnableClientState
 0049163C    inc         edi
 0049163D    dec         ebp
>0049163E    jne         004915F8
 00491640    push        84C0
 00491645    mov         eax,[005AE6B8];^gvar_005E0E8C
 0049164A    mov         eax,dword ptr [eax]
 0049164C    call        eax
>0049164E    jmp         00491672
 00491650    push        8075
 00491655    call        OpenGL32.glDisableClientState
 0049165A    push        8076
 0049165F    call        OpenGL32.glDisableClientState
 00491664    push        8078
 00491669    mov         eax,[005AE624];^gvar_005E1374
 0049166E    mov         eax,dword ptr [eax]
 00491670    call        eax
 00491672    mov         eax,[005AE18C];^gvar_005E0CFC
 00491677    cmp         byte ptr [eax],0
>0049167A    je          00491697
 0049167C    mov         eax,dword ptr [ebx+20]
 0049167F    cmp         dword ptr [eax+8],0
>00491683    jne         00491697
 00491685    mov         eax,dword ptr [ebx+0C]
 00491688    mov         eax,dword ptr [eax+8]
 0049168B    push        eax
 0049168C    push        0
 0049168E    mov         eax,[005AE620];^gvar_005E0EF8
 00491693    mov         eax,dword ptr [eax]
 00491695    call        eax
 00491697    mov         dword ptr [ebx+30],0FFFFFFFF
 0049169E    mov         byte ptr [ebx+2E],1
 004916A2    mov         byte ptr [ebx+2F],0
 004916A6    cmp         byte ptr [esi+58],1
>004916AA    je          00491704
 004916AC    call        0046AA3C
 004916B1    mov         dword ptr [ebx+40],eax
>004916B4    jmp         00491704
 004916B6    cmp         byte ptr [esi+0FA],0
>004916BD    jne         00491704
 004916BF    cmp         byte ptr [esi+58],1
>004916C3    je          00491704
 004916C5    mov         eax,dword ptr [ebx+1C]
 004916C8    cmp         dword ptr [eax+8],0
>004916CC    jle         00491704
 004916CE    call        0046AA3C
 004916D3    mov         esi,eax
 004916D5    cmp         esi,dword ptr [ebx+40]
>004916D8    je          00491704
 004916DA    push        8078
 004916DF    mov         eax,[005AE600];^gvar_005E1370
 004916E4    mov         eax,dword ptr [eax]
 004916E6    call        eax
 004916E8    mov         eax,dword ptr [ebx+1C]
 004916EB    mov         eax,dword ptr [eax+24]
 004916EE    push        eax
 004916EF    push        0C
 004916F1    push        1406
 004916F6    push        2
 004916F8    mov         eax,[005AE1B4];^gvar_005E136C
 004916FD    mov         eax,dword ptr [eax]
 004916FF    call        eax
 00491701    mov         dword ptr [ebx+40],esi
 00491704    pop         ebp
 00491705    pop         edi
 00491706    pop         esi
 00491707    pop         ebx
 00491708    ret
end;*}

//0049170C
{*procedure sub_0049170C(?:TMeshObject; ?:?);
begin
 0049170C    push        ebx
 0049170D    push        esi
 0049170E    push        edi
 0049170F    mov         esi,edx
 00491711    mov         ebx,eax
 00491713    cmp         byte ptr [ebx+2E],0
>00491717    je          00491820
 0049171D    mov         edx,esi
 0049171F    mov         eax,ebx
 00491721    call        004918E8
 00491726    mov         eax,[005AE18C];^gvar_005E0CFC
 0049172B    cmp         byte ptr [eax],0
>0049172E    je          00491742
 00491730    mov         eax,dword ptr [ebx+20]
 00491733    cmp         dword ptr [eax+8],0
>00491737    jne         00491742
 00491739    mov         eax,[005AE3E8];^gvar_005E0EFC
 0049173E    mov         eax,dword ptr [eax]
 00491740    call        eax
 00491742    mov         eax,dword ptr [ebx+0C]
 00491745    cmp         dword ptr [eax+8],0
>00491749    jle         00491755
 0049174B    push        8074
 00491750    call        OpenGL32.glDisableClientState
 00491755    cmp         byte ptr [esi+0FA],0
>0049175C    jne         0049181C
 00491762    mov         eax,dword ptr [ebx+10]
 00491765    cmp         dword ptr [eax+8],0
>00491769    jle         00491775
 0049176B    push        8075
 00491770    call        OpenGL32.glDisableClientState
 00491775    mov         eax,dword ptr [ebx+24]
 00491778    cmp         dword ptr [eax+8],0
>0049177C    jle         00491791
 0049177E    cmp         byte ptr [esi+0FA],0
>00491785    jne         00491791
 00491787    push        8076
 0049178C    call        OpenGL32.glDisableClientState
 00491791    mov         eax,dword ptr [ebx+1C]
 00491794    cmp         dword ptr [eax+8],0
>00491798    jle         004917A8
 0049179A    push        8078
 0049179F    mov         eax,[005AE624];^gvar_005E1374
 004917A4    mov         eax,dword ptr [eax]
 004917A6    call        eax
 004917A8    mov         eax,[005AE588];^gvar_005E0CE2
 004917AD    cmp         byte ptr [eax],0
>004917B0    je          0049181C
 004917B2    mov         eax,dword ptr [ebx+20]
 004917B5    cmp         dword ptr [eax+8],0
>004917B9    jle         004917D3
 004917BB    push        84C1
 004917C0    mov         eax,[005AE6B8];^gvar_005E0E8C
 004917C5    mov         eax,dword ptr [eax]
 004917C7    call        eax
 004917C9    push        8078
 004917CE    call        OpenGL32.glDisableClientState
 004917D3    mov         eax,dword ptr [ebx+34]
 004917D6    mov         edi,dword ptr [eax+8]
 004917D9    dec         edi
 004917DA    test        edi,edi
>004917DC    jl          0049180E
 004917DE    inc         edi
 004917DF    xor         esi,esi
 004917E1    mov         edx,esi
 004917E3    mov         eax,ebx
 004917E5    call        00491348
 004917EA    cmp         dword ptr [eax+8],0
>004917EE    jle         0049180A
 004917F0    lea         eax,[esi+84C0]
 004917F6    push        eax
 004917F7    mov         eax,[005AE6B8];^gvar_005E0E8C
 004917FC    mov         eax,dword ptr [eax]
 004917FE    call        eax
 00491800    push        8078
 00491805    call        OpenGL32.glDisableClientState
 0049180A    inc         esi
 0049180B    dec         edi
>0049180C    jne         004917E1
 0049180E    push        84C0
 00491813    mov         eax,[005AE6B8];^gvar_005E0E8C
 00491818    mov         eax,dword ptr [eax]
 0049181A    call        eax
 0049181C    mov         byte ptr [ebx+2E],0
 00491820    pop         edi
 00491821    pop         esi
 00491822    pop         ebx
 00491823    ret
end;*}

//00491824
{*procedure sub_00491824(?:?; ?:?);
begin
 00491824    push        ebx
 00491825    mov         ebx,eax
 00491827    mov         eax,[005AE588];^gvar_005E0CE2
 0049182C    cmp         byte ptr [eax],0
>0049182F    je          00491884
 00491831    cmp         byte ptr [edx+0FA],0
>00491838    jne         00491884
 0049183A    cmp         byte ptr [ebx+2E],0
>0049183E    jne         00491854
 00491840    mov         ecx,0FC5
 00491845    mov         edx,491890;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 0049184A    mov         eax,4918D4;'Assertion failure'
 0049184F    call        @Assert
 00491854    cmp         byte ptr [ebx+2F],0
>00491858    jne         00491884
 0049185A    push        84C1
 0049185F    mov         eax,[005AE62C];^gvar_005E0E88
 00491864    mov         eax,dword ptr [eax]
 00491866    call        eax
 00491868    push        0DE1
 0049186D    call        OpenGL32.glEnable
 00491872    push        84C0
 00491877    mov         eax,[005AE62C];^gvar_005E0E88
 0049187C    mov         eax,dword ptr [eax]
 0049187E    call        eax
 00491880    mov         byte ptr [ebx+2F],1
 00491884    pop         ebx
 00491885    ret
end;*}

//004918E8
{*procedure sub_004918E8(?:?);
begin
 004918E8    push        ebx
 004918E9    mov         ebx,eax
 004918EB    mov         eax,[005AE588];^gvar_005E0CE2
 004918F0    cmp         byte ptr [eax],0
>004918F3    je          00491925
 004918F5    cmp         byte ptr [ebx+2F],0
>004918F9    je          00491925
 004918FB    push        84C1
 00491900    mov         eax,[005AE62C];^gvar_005E0E88
 00491905    mov         eax,dword ptr [eax]
 00491907    call        eax
 00491909    push        0DE1
 0049190E    call        OpenGL32.glDisable
 00491913    push        84C0
 00491918    mov         eax,[005AE62C];^gvar_005E0E88
 0049191D    mov         eax,dword ptr [eax]
 0049191F    call        eax
 00491921    mov         byte ptr [ebx+2F],0
 00491925    pop         ebx
 00491926    ret
end;*}

//00491928
{*procedure sub_00491928(?:?);
begin
 00491928    push        ebx
 00491929    push        esi
 0049192A    push        edi
 0049192B    mov         esi,eax
 0049192D    cmp         byte ptr [esi+2C],2;TMeshObject.?f2C:byte
>00491931    jne         00491962
 00491933    cmp         dword ptr [edx+48],0
>00491937    je          00491962
 00491939    mov         eax,dword ptr [esi+28];TMeshObject.?f28:TFaceGroups
 0049193C    mov         ebx,dword ptr [eax+0C];TFaceGroups.?fC:dword
 0049193F    dec         ebx
 00491940    test        ebx,ebx
>00491942    jl          00491962
 00491944    inc         ebx
 00491945    xor         edi,edi
 00491947    mov         eax,dword ptr [esi+28];TMeshObject.?f28:TFaceGroups
 0049194A    mov         eax,dword ptr [eax+8];TFaceGroups.?f8:dword
 0049194D    mov         eax,dword ptr [eax+edi*4]
 00491950    mov         edx,dword ptr [eax+10]
 00491953    test        edx,edx
>00491955    je          0049195E
 00491957    mov         eax,edx
 00491959    call        00476C24
 0049195E    inc         edi
 0049195F    dec         ebx
>00491960    jne         00491947
 00491962    pop         edi
 00491963    pop         esi
 00491964    pop         ebx
 00491965    ret
end;*}

//00491998
{*procedure sub_00491998(?:?);
begin
 00491998    push        ebp
 00491999    mov         ebp,esp
 0049199B    add         esp,0FFFFFFE0
 0049199E    push        ebx
 0049199F    push        esi
 004919A0    push        edi
 004919A1    xor         ecx,ecx
 004919A3    mov         dword ptr [ebp-14],ecx
 004919A6    mov         dword ptr [ebp-4],edx
 004919A9    mov         ebx,eax
 004919AB    xor         eax,eax
 004919AD    push        ebp
 004919AE    push        491E18
 004919B3    push        dword ptr fs:[eax]
 004919B6    mov         dword ptr fs:[eax],esp
 004919B9    mov         byte ptr [ebx+2E],0;TMeshObject.?f2E:byte
 004919BD    xor         eax,eax
 004919BF    mov         dword ptr [ebx+40],eax;TMeshObject.?f40:dword
 004919C2    mov         eax,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 004919C5    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 004919C8    mov         edx,dword ptr [ebx+24];TMeshObject.?f24:TVectorList
 004919CB    cmp         eax,dword ptr [edx+8];TVectorList.?f8:dword
 004919CE    sete        byte ptr [ebp-0F]
 004919D2    cmp         byte ptr [ebp-0F],0
>004919D6    je          00491A06
 004919D8    push        2000
 004919DD    call        OpenGL32.glPushAttrib
 004919E2    push        0B57
 004919E7    call        OpenGL32.glEnable
 004919EC    push        1602
 004919F1    push        408
 004919F6    call        OpenGL32.glColorMaterial
 004919FB    mov         eax,dword ptr [ebp-4]
 004919FE    mov         eax,dword ptr [eax+5C]
 00491A01    call        0046D830
 00491A06    mov         al,byte ptr [ebx+2C];TMeshObject.?f2C:byte
 00491A09    sub         al,2
>00491A0B    jb          00491A18
>00491A0D    je          00491C00
>00491A13    jmp         00491DD3
 00491A18    mov         eax,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 00491A1B    cmp         dword ptr [eax+8],0;TAffineVectorList.?f8:dword
>00491A1F    jle         00491DE7
 00491A25    mov         edx,dword ptr [ebp-4]
 00491A28    xor         ecx,ecx
 00491A2A    mov         eax,ebx
 00491A2C    call        004914A0
 00491A31    mov         eax,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 00491A34    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 00491A37    mov         edx,dword ptr [ebx+10];TMeshObject.?f10:TAffineVectorList
 00491A3A    cmp         eax,dword ptr [edx+8];TAffineVectorList.?f8:dword
 00491A3D    sete        byte ptr [ebp-0D]
 00491A41    mov         edx,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 00491A44    cmp         eax,dword ptr [edx+8];TAffineVectorList.?f8:dword
 00491A47    sete        byte ptr [ebp-0E]
 00491A4B    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00491A4E    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00491A51    push        eax
 00491A52    lea         eax,[ebp-14]
 00491A55    mov         ecx,1
 00491A5A    mov         edx,dword ptr ds:[491968];.43
 00491A60    call        @DynArraySetLength
 00491A65    add         esp,4
 00491A68    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00491A6B    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00491A6E    dec         eax
 00491A6F    test        eax,eax
>00491A71    jl          00491AAF
 00491A73    inc         eax
 00491A74    mov         dword ptr [ebp-1C],eax
 00491A77    mov         dword ptr [ebp-8],0
 00491A7E    mov         edx,dword ptr [ebp-8]
 00491A81    mov         eax,ebx
 00491A83    call        00491348
 00491A88    cmp         dword ptr [eax+8],0
>00491A8C    jle         00491A98
 00491A8E    mov         eax,[005AE588];^gvar_005E0CE2
 00491A93    cmp         byte ptr [eax],0
>00491A96    jne         00491A9C
 00491A98    xor         eax,eax
>00491A9A    jmp         00491A9E
 00491A9C    mov         al,1
 00491A9E    mov         edx,dword ptr [ebp-14]
 00491AA1    mov         ecx,dword ptr [ebp-8]
 00491AA4    mov         byte ptr [edx+ecx],al
 00491AA7    inc         dword ptr [ebp-8]
 00491AAA    dec         dword ptr [ebp-1C]
>00491AAD    jne         00491A7E
 00491AAF    cmp         byte ptr [ebx+2C],0;TMeshObject.?f2C:byte
>00491AB3    jne         00491ABE
 00491AB5    push        4
 00491AB7    call        OpenGL32.glBegin
>00491ABC    jmp         00491AC5
 00491ABE    push        5
 00491AC0    call        OpenGL32.glBegin
 00491AC5    mov         eax,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 00491AC8    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 00491ACB    dec         eax
 00491ACC    test        eax,eax
>00491ACE    jl          00491BF6
 00491AD4    inc         eax
 00491AD5    mov         dword ptr [ebp-1C],eax
 00491AD8    mov         dword ptr [ebp-8],0
 00491ADF    cmp         byte ptr [ebp-0D],0
>00491AE3    je          00491AFA
 00491AE5    mov         eax,dword ptr [ebp-8]
 00491AE8    lea         eax,[eax+eax*2]
 00491AEB    mov         edx,dword ptr [ebx+10];TMeshObject.?f10:TAffineVectorList
 00491AEE    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 00491AF1    lea         eax,[edx+eax*4]
 00491AF4    push        eax
 00491AF5    call        OpenGL32.glNormal3fv
 00491AFA    cmp         byte ptr [ebp-0F],0
>00491AFE    je          00491B14
 00491B00    mov         eax,dword ptr [ebp-8]
 00491B03    add         eax,eax
 00491B05    mov         edx,dword ptr [ebx+24];TMeshObject.?f24:TVectorList
 00491B08    mov         edx,dword ptr [edx+24];TVectorList.?f24:dword
 00491B0B    lea         eax,[edx+eax*8]
 00491B0E    push        eax
 00491B0F    call        OpenGL32.glColor4fv
 00491B14    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00491B17    cmp         dword ptr [eax+8],0;TList.FCount:Integer
>00491B1B    jle         00491BB6
 00491B21    mov         eax,dword ptr [ebp-14]
 00491B24    cmp         byte ptr [eax],0
>00491B27    je          00491B4E
 00491B29    xor         edx,edx
 00491B2B    mov         eax,ebx
 00491B2D    call        00491348
 00491B32    mov         eax,dword ptr [eax+24]
 00491B35    mov         edx,dword ptr [ebp-8]
 00491B38    add         edx,edx
 00491B3A    lea         eax,[eax+edx*8]
 00491B3D    push        eax
 00491B3E    push        84C0
 00491B43    mov         eax,[005AE254];^gvar_005E0E74
 00491B48    mov         eax,dword ptr [eax]
 00491B4A    call        eax
>00491B4C    jmp         00491B6D
 00491B4E    cmp         byte ptr [ebp-0E],0
>00491B52    je          00491B6D
 00491B54    mov         eax,dword ptr [ebp-8]
 00491B57    lea         eax,[eax+eax*2]
 00491B5A    mov         edx,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 00491B5D    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 00491B60    lea         eax,[edx+eax*4]
 00491B63    push        eax
 00491B64    mov         eax,[005AE39C];^gvar_005E1348
 00491B69    mov         eax,dword ptr [eax]
 00491B6B    call        eax
 00491B6D    mov         eax,dword ptr [ebx+34];TMeshObject.?f34:TList
 00491B70    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00491B73    dec         eax
 00491B74    test        eax,eax
>00491B76    jle         00491BD5
 00491B78    mov         dword ptr [ebp-20],eax
 00491B7B    mov         esi,1
 00491B80    mov         eax,dword ptr [ebp-14]
 00491B83    cmp         byte ptr [eax+esi],0
>00491B87    je          00491BAE
 00491B89    mov         edx,esi
 00491B8B    mov         eax,ebx
 00491B8D    call        00491348
 00491B92    mov         eax,dword ptr [eax+24]
 00491B95    mov         edx,dword ptr [ebp-8]
 00491B98    add         edx,edx
 00491B9A    lea         eax,[eax+edx*8]
 00491B9D    push        eax
 00491B9E    lea         eax,[esi+84C0]
 00491BA4    push        eax
 00491BA5    mov         eax,[005AE254];^gvar_005E0E74
 00491BAA    mov         eax,dword ptr [eax]
 00491BAC    call        eax
 00491BAE    inc         esi
 00491BAF    dec         dword ptr [ebp-20]
>00491BB2    jne         00491B80
>00491BB4    jmp         00491BD5
 00491BB6    cmp         byte ptr [ebp-0E],0
>00491BBA    je          00491BD5
 00491BBC    mov         eax,dword ptr [ebp-8]
 00491BBF    lea         eax,[eax+eax*2]
 00491BC2    mov         edx,dword ptr [ebx+1C];TMeshObject.?f1C:TAffineVectorList
 00491BC5    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 00491BC8    lea         eax,[edx+eax*4]
 00491BCB    push        eax
 00491BCC    mov         eax,[005AE39C];^gvar_005E1348
 00491BD1    mov         eax,dword ptr [eax]
 00491BD3    call        eax
 00491BD5    mov         eax,dword ptr [ebp-8]
 00491BD8    lea         eax,[eax+eax*2]
 00491BDB    mov         edx,dword ptr [ebx+0C];TMeshObject.?fC:TAffineVectorList
 00491BDE    mov         edx,dword ptr [edx+24];TAffineVectorList.?f24:dword
 00491BE1    lea         eax,[edx+eax*4]
 00491BE4    push        eax
 00491BE5    call        OpenGL32.glVertex3fv
 00491BEA    inc         dword ptr [ebp-8]
 00491BED    dec         dword ptr [ebp-1C]
>00491BF0    jne         00491ADF
 00491BF6    call        OpenGL32.glEnd
>00491BFB    jmp         00491DE7
 00491C00    mov         eax,dword ptr [ebp-4]
 00491C03    cmp         dword ptr [eax+48],0
>00491C07    je          00491DA0
 00491C0D    test        byte ptr [ebx+2D],1;TMeshObject.?f2D:?
>00491C11    je          00491CDA
 00491C17    mov         eax,[005AD70C];0x1 gvar_005AD70C
 00491C1C    mov         dword ptr [ebp-0C],eax
 00491C1F    inc         dword ptr ds:[5AD70C];gvar_005AD70C
 00491C25    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491C28    mov         eax,dword ptr [eax+0C];TFaceGroups.?fC:dword
 00491C2B    dec         eax
 00491C2C    test        eax,eax
>00491C2E    jl          00491D61
 00491C34    inc         eax
 00491C35    mov         dword ptr [ebp-1C],eax
 00491C38    mov         dword ptr [ebp-8],0
 00491C3F    mov         edx,dword ptr [ebp-8]
 00491C42    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491C45    call        004941BC
 00491C4A    mov         eax,dword ptr [eax+18]
 00491C4D    cmp         eax,dword ptr [ebp-0C]
>00491C50    je          00491CC9
 00491C52    mov         edx,dword ptr [ebp-8]
 00491C55    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491C58    call        004941BC
 00491C5D    mov         eax,dword ptr [eax+10]
 00491C60    mov         dword ptr [ebp-18],eax
 00491C63    cmp         dword ptr [ebp-18],0
>00491C67    je          00491C74
 00491C69    mov         edx,dword ptr [ebp-4]
 00491C6C    mov         eax,dword ptr [ebp-18]
 00491C6F    call        00476C34
 00491C74    mov         esi,dword ptr [ebp-8]
 00491C77    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491C7A    mov         eax,dword ptr [eax+0C];TFaceGroups.?fC:dword
 00491C7D    dec         eax
 00491C7E    sub         eax,esi
>00491C80    jl          00491CB4
 00491C82    inc         eax
 00491C83    mov         dword ptr [ebp-20],eax
 00491C86    mov         edx,esi
 00491C88    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491C8B    call        004941BC
 00491C90    mov         edx,dword ptr [eax+18]
 00491C93    cmp         edx,dword ptr [ebp-0C]
>00491C96    je          00491CAE
 00491C98    mov         edx,dword ptr [eax+10]
 00491C9B    cmp         edx,dword ptr [ebp-18]
>00491C9E    jne         00491CAE
 00491CA0    mov         edx,dword ptr [ebp-0C]
 00491CA3    mov         dword ptr [eax+18],edx
 00491CA6    mov         edx,dword ptr [ebp-4]
 00491CA9    mov         ecx,dword ptr [eax]
 00491CAB    call        dword ptr [ecx+20]
 00491CAE    inc         esi
 00491CAF    dec         dword ptr [ebp-20]
>00491CB2    jne         00491C86
 00491CB4    cmp         dword ptr [ebp-18],0
>00491CB8    je          00491CC9
 00491CBA    mov         edx,dword ptr [ebp-4]
 00491CBD    mov         eax,dword ptr [ebp-18]
 00491CC0    call        00476DB0
 00491CC5    test        al,al
>00491CC7    jne         00491C74
 00491CC9    inc         dword ptr [ebp-8]
 00491CCC    dec         dword ptr [ebp-1C]
>00491CCF    jne         00491C3F
>00491CD5    jmp         00491D61
 00491CDA    xor         eax,eax
 00491CDC    mov         dword ptr [ebp-8],eax
 00491CDF    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491CE2    mov         edi,dword ptr [eax+0C];TFaceGroups.?fC:dword
 00491CE5    cmp         edi,dword ptr [ebp-8]
>00491CE8    jle         00491D61
 00491CEA    mov         edx,dword ptr [ebp-8]
 00491CED    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491CF0    call        004941BC
 00491CF5    mov         eax,dword ptr [eax+10]
 00491CF8    mov         dword ptr [ebp-18],eax
 00491CFB    cmp         dword ptr [ebp-18],0
>00491CFF    je          00491D46
 00491D01    mov         edx,dword ptr [ebp-4]
 00491D04    mov         eax,dword ptr [ebp-18]
 00491D07    call        00476C34
 00491D0C    mov         esi,dword ptr [ebp-8]
 00491D0F    cmp         edi,esi
>00491D11    jle         00491D32
 00491D13    mov         edx,esi
 00491D15    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491D18    call        004941BC
 00491D1D    mov         edx,dword ptr [eax+10]
 00491D20    cmp         edx,dword ptr [ebp-18]
>00491D23    jne         00491D32
 00491D25    mov         edx,dword ptr [ebp-4]
 00491D28    mov         ecx,dword ptr [eax]
 00491D2A    call        dword ptr [ecx+20]
 00491D2D    inc         esi
 00491D2E    cmp         edi,esi
>00491D30    jg          00491D13
 00491D32    mov         edx,dword ptr [ebp-4]
 00491D35    mov         eax,dword ptr [ebp-18]
 00491D38    call        00476DB0
 00491D3D    test        al,al
>00491D3F    jne         00491D0C
 00491D41    mov         dword ptr [ebp-8],esi
>00491D44    jmp         00491D5C
 00491D46    mov         edx,dword ptr [ebp-8]
 00491D49    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491D4C    call        004941BC
 00491D51    mov         edx,dword ptr [ebp-4]
 00491D54    mov         ecx,dword ptr [eax]
 00491D56    call        dword ptr [ecx+20]
 00491D59    inc         dword ptr [ebp-8]
 00491D5C    cmp         edi,dword ptr [ebp-8]
>00491D5F    jg          00491CEA
 00491D61    mov         eax,dword ptr [ebp-4]
 00491D64    mov         eax,dword ptr [eax+5C]
 00491D67    test        byte ptr [eax+8C],10
>00491D6E    je          00491D88
 00491D70    mov         edx,dword ptr [ebp-4]
 00491D73    cmp         byte ptr [edx+0F8],0
>00491D7A    jne         00491DE7
 00491D7C    mov         edx,dword ptr [ebp-4]
 00491D7F    mov         dl,4
 00491D81    call        0046D634
>00491D86    jmp         00491DE7
 00491D88    mov         edx,dword ptr [ebp-4]
 00491D8B    cmp         byte ptr [edx+0F8],0
>00491D92    je          00491DE7
 00491D94    mov         edx,dword ptr [ebp-4]
 00491D97    mov         dl,4
 00491D99    call        0046D5F8
>00491D9E    jmp         00491DE7
 00491DA0    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491DA3    mov         eax,dword ptr [eax+0C];TFaceGroups.?fC:dword
 00491DA6    dec         eax
 00491DA7    test        eax,eax
>00491DA9    jl          00491DE7
 00491DAB    inc         eax
 00491DAC    mov         dword ptr [ebp-1C],eax
 00491DAF    mov         dword ptr [ebp-8],0
 00491DB6    mov         edx,dword ptr [ebp-8]
 00491DB9    mov         eax,dword ptr [ebx+28];TMeshObject.?f28:TFaceGroups
 00491DBC    call        004941BC
 00491DC1    mov         edx,dword ptr [ebp-4]
 00491DC4    mov         ecx,dword ptr [eax]
 00491DC6    call        dword ptr [ecx+20]
 00491DC9    inc         dword ptr [ebp-8]
 00491DCC    dec         dword ptr [ebp-1C]
>00491DCF    jne         00491DB6
>00491DD1    jmp         00491DE7
 00491DD3    mov         ecx,1055
 00491DD8    mov         edx,491E30;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00491DDD    mov         eax,491E74;'Assertion failure'
 00491DE2    call        @Assert
 00491DE7    cmp         byte ptr [ebp-0F],0
>00491DEB    je          00491DF2
 00491DED    call        OpenGL32.glPopAttrib
 00491DF2    mov         edx,dword ptr [ebp-4]
 00491DF5    mov         eax,ebx
 00491DF7    call        0049170C
 00491DFC    xor         eax,eax
 00491DFE    pop         edx
 00491DFF    pop         ecx
 00491E00    pop         ecx
 00491E01    mov         dword ptr fs:[eax],edx
 00491E04    push        491E1F
 00491E09    lea         eax,[ebp-14]
 00491E0C    mov         edx,dword ptr ds:[491968];.43
 00491E12    call        @DynArrayClear
 00491E17    ret
>00491E18    jmp         @HandleFinally
>00491E1D    jmp         00491E09
 00491E1F    pop         edi
 00491E20    pop         esi
 00491E21    pop         ebx
 00491E22    mov         esp,ebp
 00491E24    pop         ebp
 00491E25    ret
end;*}

//00491E88
constructor TMeshObjectList.Create;
begin
{*
 00491E88    push        ebx
 00491E89    push        esi
 00491E8A    test        dl,dl
>00491E8C    je          00491E96
 00491E8E    add         esp,0FFFFFFF0
 00491E91    call        @ClassCreate
 00491E96    mov         ebx,edx
 00491E98    mov         esi,eax
 00491E9A    mov         dword ptr [esi+18],ecx
 00491E9D    xor         edx,edx
 00491E9F    mov         eax,esi
 00491EA1    mov         ecx,dword ptr [eax]
 00491EA3    call        dword ptr [ecx+0C]
 00491EA6    mov         eax,esi
 00491EA8    test        bl,bl
>00491EAA    je          00491EBB
 00491EAC    call        @AfterConstruction
 00491EB1    pop         dword ptr fs:[0]
 00491EB8    add         esp,0C
 00491EBB    mov         eax,esi
 00491EBD    pop         esi
 00491EBE    pop         ebx
 00491EBF    ret
*}
end;

//00491EC0
destructor TMeshObjectList.Destroy;
begin
{*
 00491EC0    push        ebx
 00491EC1    push        esi
 00491EC2    push        edi
 00491EC3    call        @BeforeDestruction
 00491EC8    mov         ebx,edx
 00491ECA    mov         edi,eax
 00491ECC    mov         eax,edi
 00491ECE    mov         si,0FFF4
 00491ED2    call        @CallDynaInst;TMeshObjectList.sub_00466E50
 00491ED7    mov         edx,ebx
 00491ED9    and         dl,0FC
 00491EDC    mov         eax,edi
 00491EDE    call        TPersistentObjectList.Destroy
 00491EE3    test        bl,bl
>00491EE5    jle         00491EEE
 00491EE7    mov         eax,edi
 00491EE9    call        @ClassDestroy
 00491EEE    pop         edi
 00491EEF    pop         esi
 00491EF0    pop         ebx
 00491EF1    ret
*}
end;

//00491EF4
{*procedure TMeshObjectList.sub_00466894(?:?);
begin
 00491EF4    push        ebx
 00491EF5    push        esi
 00491EF6    push        edi
 00491EF7    push        ebp
 00491EF8    mov         esi,eax
 00491EFA    mov         eax,esi
 00491EFC    call        TPersistentObjectList.sub_00466894
 00491F01    mov         edi,dword ptr [esi+0C];TMeshObjectList.?fC:dword
 00491F04    dec         edi
 00491F05    test        edi,edi
>00491F07    jl          00491F36
 00491F09    inc         edi
 00491F0A    xor         ebp,ebp
 00491F0C    mov         edx,ebp
 00491F0E    mov         eax,esi
 00491F10    call        00492124
 00491F15    mov         ebx,eax
 00491F17    mov         dword ptr [ebx+18],esi
 00491F1A    mov         eax,ebx
 00491F1C    mov         edx,dword ptr ds:[48D528];TSkeletonMeshObject
 00491F22    call        @IsClass
 00491F27    test        al,al
>00491F29    je          00491F32
 00491F2B    mov         eax,ebx
 00491F2D    call        00492B50
 00491F32    inc         ebp
 00491F33    dec         edi
>00491F34    jne         00491F0C
 00491F36    pop         ebp
 00491F37    pop         edi
 00491F38    pop         esi
 00491F39    pop         ebx
 00491F3A    ret
end;*}

//00491F3C
{*procedure sub_00491F3C(?:?; ?:?);
begin
 00491F3C    push        ebx
 00491F3D    push        esi
 00491F3E    push        edi
 00491F3F    push        ebp
 00491F40    mov         ebp,edx
 00491F42    mov         edi,eax
 00491F44    mov         ebx,dword ptr [edi+0C]
 00491F47    dec         ebx
 00491F48    test        ebx,ebx
>00491F4A    jl          00491F60
 00491F4C    inc         ebx
 00491F4D    xor         esi,esi
 00491F4F    mov         eax,dword ptr [edi+8]
 00491F52    mov         eax,dword ptr [eax+esi*4]
 00491F55    mov         edx,ebp
 00491F57    call        00491288
 00491F5C    inc         esi
 00491F5D    dec         ebx
>00491F5E    jne         00491F4F
 00491F60    pop         ebp
 00491F61    pop         edi
 00491F62    pop         esi
 00491F63    pop         ebx
 00491F64    ret
end;*}

//00491F68
procedure sub_00491F68(?:TMeshObjectList);
begin
{*
 00491F68    push        ebx
 00491F69    push        esi
 00491F6A    push        edi
 00491F6B    mov         edi,eax
 00491F6D    mov         ebx,dword ptr [edi+0C]
 00491F70    dec         ebx
 00491F71    test        ebx,ebx
>00491F73    jl          00491F87
 00491F75    inc         ebx
 00491F76    xor         esi,esi
 00491F78    mov         eax,dword ptr [edi+8]
 00491F7B    mov         eax,dword ptr [eax+esi*4]
 00491F7E    call        00491294
 00491F83    inc         esi
 00491F84    dec         ebx
>00491F85    jne         00491F78
 00491F87    pop         edi
 00491F88    pop         esi
 00491F89    pop         ebx
 00491F8A    ret
*}
end;

//00491F8C
{*procedure sub_00491F8C(?:?);
begin
 00491F8C    push        esi
 00491F8D    push        edi
 00491F8E    push        ebp
 00491F8F    push        ecx
 00491F90    mov         dword ptr [esp],edx
 00491F93    mov         ebp,eax
 00491F95    mov         esi,dword ptr [ebp+0C];TMeshObjectList.?fC:dword
 00491F98    dec         esi
 00491F99    test        esi,esi
>00491F9B    jl          00491FBB
 00491F9D    inc         esi
 00491F9E    xor         edi,edi
 00491FA0    mov         edx,edi
 00491FA2    mov         eax,ebp
 00491FA4    call        00492124
 00491FA9    cmp         byte ptr [eax+14],0
>00491FAD    je          00491FB7
 00491FAF    mov         edx,dword ptr [esp]
 00491FB2    mov         ecx,dword ptr [eax]
 00491FB4    call        dword ptr [ecx+1C]
 00491FB7    inc         edi
 00491FB8    dec         esi
>00491FB9    jne         00491FA0
 00491FBB    pop         edx
 00491FBC    pop         ebp
 00491FBD    pop         edi
 00491FBE    pop         esi
 00491FBF    ret
end;*}

//00491FC0
{*procedure sub_00491FC0(?:?);
begin
 00491FC0    push        esi
 00491FC1    push        edi
 00491FC2    push        ebp
 00491FC3    push        ecx
 00491FC4    mov         dword ptr [esp],edx
 00491FC7    mov         ebp,eax
 00491FC9    mov         esi,dword ptr [ebp+0C];TMeshObjectList.?fC:dword
 00491FCC    dec         esi
 00491FCD    test        esi,esi
>00491FCF    jl          00491FEF
 00491FD1    inc         esi
 00491FD2    xor         edi,edi
 00491FD4    mov         edx,edi
 00491FD6    mov         eax,ebp
 00491FD8    call        00492124
 00491FDD    cmp         byte ptr [eax+14],0
>00491FE1    je          00491FEB
 00491FE3    mov         edx,dword ptr [esp]
 00491FE6    mov         ecx,dword ptr [eax]
 00491FE8    call        dword ptr [ecx+20]
 00491FEB    inc         edi
 00491FEC    dec         esi
>00491FED    jne         00491FD4
 00491FEF    pop         edx
 00491FF0    pop         ebp
 00491FF1    pop         edi
 00491FF2    pop         esi
 00491FF3    ret
end;*}

//00491FF4
procedure sub_00491FF4(?:TMeshObjectList; ?:Integer);
begin
{*
 00491FF4    push        ebx
 00491FF5    push        esi
 00491FF6    push        edi
 00491FF7    push        ebp
 00491FF8    mov         ebp,edx
 00491FFA    mov         edi,eax
 00491FFC    mov         esi,dword ptr [edi+0C]
 00491FFF    dec         esi
 00492000    test        esi,esi
>00492002    jl          00492033
 00492004    inc         esi
 00492005    xor         ebx,ebx
 00492007    mov         edx,ebx
 00492009    mov         eax,edi
 0049200B    call        00492124
 00492010    mov         edx,dword ptr ds:[48D448];TMorphableMeshObject
 00492016    call        @IsClass
 0049201B    test        al,al
>0049201D    je          0049202F
 0049201F    mov         edx,ebx
 00492021    mov         eax,edi
 00492023    call        00492124
 00492028    mov         edx,ebp
 0049202A    call        00492680
 0049202F    inc         ebx
 00492030    dec         esi
>00492031    jne         00492007
 00492033    pop         ebp
 00492034    pop         edi
 00492035    pop         esi
 00492036    pop         ebx
 00492037    ret
*}
end;

//00492038
{*procedure sub_00492038(?:TMeshObjectList; ?:Integer; ?:?; ?:?);
begin
 00492038    push        ebp
 00492039    mov         ebp,esp
 0049203B    add         esp,0FFFFFFF8
 0049203E    push        ebx
 0049203F    push        esi
 00492040    push        edi
 00492041    mov         dword ptr [ebp-8],ecx
 00492044    mov         dword ptr [ebp-4],edx
 00492047    mov         edi,eax
 00492049    mov         esi,dword ptr [edi+0C]
 0049204C    dec         esi
 0049204D    test        esi,esi
>0049204F    jl          00492087
 00492051    inc         esi
 00492052    xor         ebx,ebx
 00492054    mov         edx,ebx
 00492056    mov         eax,edi
 00492058    call        00492124
 0049205D    mov         edx,dword ptr ds:[48D448];TMorphableMeshObject
 00492063    call        @IsClass
 00492068    test        al,al
>0049206A    je          00492083
 0049206C    push        dword ptr [ebp+8]
 0049206F    mov         edx,ebx
 00492071    mov         eax,edi
 00492073    call        00492124
 00492078    mov         ecx,dword ptr [ebp-8]
 0049207B    mov         edx,dword ptr [ebp-4]
 0049207E    call        00492748
 00492083    inc         ebx
 00492084    dec         esi
>00492085    jne         00492054
 00492087    pop         edi
 00492088    pop         esi
 00492089    pop         ebx
 0049208A    pop         ecx
 0049208B    pop         ecx
 0049208C    pop         ebp
 0049208D    ret         4
end;*}

//00492090
{*function sub_00492090(?:TMeshObjectList):?;
begin
 00492090    push        ebx
 00492091    push        esi
 00492092    push        edi
 00492093    push        ebp
 00492094    mov         edi,eax
 00492096    mov         ebp,7FFFFFFF
 0049209B    mov         esi,dword ptr [edi+0C]
 0049209E    dec         esi
 0049209F    test        esi,esi
>004920A1    jl          004920D7
 004920A3    inc         esi
 004920A4    xor         ebx,ebx
 004920A6    mov         edx,ebx
 004920A8    mov         eax,edi
 004920AA    call        00492124
 004920AF    mov         edx,dword ptr ds:[48D448];TMorphableMeshObject
 004920B5    call        @IsClass
 004920BA    test        al,al
>004920BC    je          004920D3
 004920BE    mov         edx,ebx
 004920C0    mov         eax,edi
 004920C2    call        00492124
 004920C7    mov         edx,dword ptr [eax+44]
 004920CA    mov         edx,dword ptr [edx+0C]
 004920CD    cmp         ebp,edx
>004920CF    jle         004920D3
 004920D1    mov         ebp,edx
 004920D3    inc         ebx
 004920D4    dec         esi
>004920D5    jne         004920A6
 004920D7    cmp         ebp,7FFFFFFF
>004920DD    jne         004920E1
 004920DF    xor         ebp,ebp
 004920E1    mov         eax,ebp
 004920E3    pop         ebp
 004920E4    pop         edi
 004920E5    pop         esi
 004920E6    pop         ebx
 004920E7    ret
end;*}

//004920E8
procedure TMeshObjectList.sub_00466E50;
begin
{*
 004920E8    push        ebx
 004920E9    push        esi
 004920EA    push        edi
 004920EB    mov         esi,eax
 004920ED    mov         eax,esi
 004920EF    call        00491F68
 004920F4    mov         ebx,dword ptr [esi+0C];TMeshObjectList.?fC:dword
 004920F7    dec         ebx
 004920F8    test        ebx,ebx
>004920FA    jl          00492116
 004920FC    inc         ebx
 004920FD    xor         edi,edi
 004920FF    mov         edx,edi
 00492101    mov         eax,esi
 00492103    call        00492124
 00492108    xor         edx,edx
 0049210A    mov         dword ptr [eax+18],edx
 0049210D    call        TObject.Free
 00492112    inc         edi
 00492113    dec         ebx
>00492114    jne         004920FF
 00492116    mov         eax,esi
 00492118    call        TPersistentObjectList.sub_00466E50
 0049211D    pop         edi
 0049211E    pop         esi
 0049211F    pop         ebx
 00492120    ret
*}
end;

//00492124
{*function sub_00492124(?:TMeshObjectList; ?:?):?;
begin
 00492124    mov         eax,dword ptr [eax+8];TMeshObjectList.?f8:dword
 00492127    mov         eax,dword ptr [eax+edx*4]
 0049212A    ret
end;*}

//0049212C
{*procedure sub_0049212C(?:TMeshObjectList; ?:?; ?:?);
begin
 0049212C    push        ebx
 0049212D    push        esi
 0049212E    add         esp,0FFFFFFD0
 00492131    mov         dword ptr [esp+8],ecx
 00492135    mov         dword ptr [esp+4],edx
 00492139    mov         dword ptr [esp],eax
 0049213C    push        dword ptr ds:[5AD710]
 00492142    push        dword ptr ds:[5AD710]
 00492148    push        dword ptr ds:[5AD710]
 0049214E    mov         eax,dword ptr [esp+10]
 00492152    call        0045C8DC
 00492157    push        dword ptr ds:[5AD714]
 0049215D    push        dword ptr ds:[5AD714]
 00492163    push        dword ptr ds:[5AD714]
 00492169    mov         eax,dword ptr [esp+14]
 0049216D    call        0045C8DC
 00492172    mov         eax,dword ptr [esp]
 00492175    mov         eax,dword ptr [eax+0C]
 00492178    dec         eax
 00492179    test        eax,eax
>0049217B    jl          004921F5
 0049217D    inc         eax
 0049217E    mov         dword ptr [esp+14],eax
 00492182    mov         dword ptr [esp+0C],0
 0049218A    mov         edx,dword ptr [esp+0C]
 0049218E    mov         eax,dword ptr [esp]
 00492191    call        00492124
 00492196    lea         ecx,[esp+24]
 0049219A    lea         edx,[esp+18]
 0049219E    mov         si,0FFEF
 004921A2    call        @CallDynaInst
 004921A7    mov         dword ptr [esp+10],3
 004921AF    lea         edx,[esp+18]
 004921B3    mov         ecx,dword ptr [esp+4]
 004921B7    lea         ebx,[esp+24]
 004921BB    mov         esi,dword ptr [esp+8]
 004921BF    fld         dword ptr [edx]
 004921C1    fcomp       dword ptr [ecx]
 004921C3    fnstsw      al
 004921C5    sahf
>004921C6    jae         004921CC
 004921C8    mov         eax,dword ptr [edx]
 004921CA    mov         dword ptr [ecx],eax
 004921CC    fld         dword ptr [ebx]
 004921CE    fcomp       dword ptr [esi]
 004921D0    fnstsw      al
 004921D2    sahf
>004921D3    jbe         004921D9
 004921D5    mov         eax,dword ptr [ebx]
 004921D7    mov         dword ptr [esi],eax
 004921D9    add         esi,4
 004921DC    add         ebx,4
 004921DF    add         ecx,4
 004921E2    add         edx,4
 004921E5    dec         dword ptr [esp+10]
>004921E9    jne         004921BF
 004921EB    inc         dword ptr [esp+0C]
 004921EF    dec         dword ptr [esp+14]
>004921F3    jne         0049218A
 004921F5    add         esp,30
 004921F8    pop         esi
 004921F9    pop         ebx
 004921FA    ret
end;*}

//004921FC
{*procedure sub_004921FC(?:TMeshObjectList; ?:?);
begin
 004921FC    push        ebx
 004921FD    push        esi
 004921FE    push        edi
 004921FF    push        ebp
 00492200    push        ecx
 00492201    mov         dword ptr [esp],edx
 00492204    mov         ebp,eax
 00492206    mov         ebx,dword ptr [ebp+0C]
 00492209    dec         ebx
 0049220A    test        ebx,ebx
>0049220C    jl          0049222A
 0049220E    inc         ebx
 0049220F    xor         edi,edi
 00492211    mov         edx,edi
 00492213    mov         eax,ebp
 00492215    call        00492124
 0049221A    mov         edx,dword ptr [esp]
 0049221D    mov         si,0FFF2
 00492221    call        @CallDynaInst
 00492226    inc         edi
 00492227    dec         ebx
>00492228    jne         00492211
 0049222A    pop         edx
 0049222B    pop         ebp
 0049222C    pop         edi
 0049222D    pop         esi
 0049222E    pop         ebx
 0049222F    ret
end;*}

//00492230
{*function sub_00492230(?:TMeshObjectList; ?:?; ?:?):?;
begin
 00492230    push        ebp
 00492231    mov         ebp,esp
 00492233    add         esp,0FFFFFFDC
 00492236    push        esi
 00492237    mov         dword ptr [ebp-0C],ecx
 0049223A    mov         dword ptr [ebp-8],edx
 0049223D    mov         dword ptr [ebp-4],eax
 00492240    mov         dl,1
 00492242    mov         eax,[00467A00];TAffineVectorList
 00492247    call        TAffineVectorList.Create;TAffineVectorList.Create
 0049224C    mov         dword ptr [ebp-10],eax
 0049224F    cmp         dword ptr [ebp-8],0
>00492253    je          00492266
 00492255    mov         dl,1
 00492257    mov         eax,[00467A00];TAffineVectorList
 0049225C    call        TAffineVectorList.Create;TAffineVectorList.Create
 00492261    mov         dword ptr [ebp-1C],eax
>00492264    jmp         0049226B
 00492266    xor         eax,eax
 00492268    mov         dword ptr [ebp-1C],eax
 0049226B    cmp         dword ptr [ebp-0C],0
>0049226F    je          00492282
 00492271    mov         dl,1
 00492273    mov         eax,[00467A00];TAffineVectorList
 00492278    call        TAffineVectorList.Create;TAffineVectorList.Create
 0049227D    mov         dword ptr [ebp-20],eax
>00492280    jmp         00492287
 00492282    xor         eax,eax
 00492284    mov         dword ptr [ebp-20],eax
 00492287    xor         eax,eax
 00492289    push        ebp
 0049228A    push        492362
 0049228F    push        dword ptr fs:[eax]
 00492292    mov         dword ptr fs:[eax],esp
 00492295    mov         eax,dword ptr [ebp-4]
 00492298    mov         eax,dword ptr [eax+0C]
 0049229B    dec         eax
 0049229C    test        eax,eax
>0049229E    jl          00492344
 004922A4    inc         eax
 004922A5    mov         dword ptr [ebp-24],eax
 004922A8    mov         dword ptr [ebp-14],0
 004922AF    mov         edx,dword ptr [ebp-14]
 004922B2    mov         eax,dword ptr [ebp-4]
 004922B5    call        00492124
 004922BA    mov         ecx,dword ptr [ebp-20]
 004922BD    mov         edx,dword ptr [ebp-1C]
 004922C0    mov         si,0FFF1
 004922C4    call        @CallDynaInst
 004922C9    mov         dword ptr [ebp-18],eax
 004922CC    xor         eax,eax
 004922CE    push        ebp
 004922CF    push        492331
 004922D4    push        dword ptr fs:[eax]
 004922D7    mov         dword ptr fs:[eax],esp
 004922DA    mov         edx,dword ptr [ebp-18]
 004922DD    mov         eax,dword ptr [ebp-10]
 004922E0    call        00468BCC
 004922E5    cmp         dword ptr [ebp-8],0
>004922E9    je          00492300
 004922EB    mov         edx,dword ptr [ebp-1C]
 004922EE    mov         eax,dword ptr [ebp-8]
 004922F1    call        00468BCC
 004922F6    xor         edx,edx
 004922F8    mov         eax,dword ptr [ebp-1C]
 004922FB    call        00468118
 00492300    cmp         dword ptr [ebp-0C],0
>00492304    je          0049231B
 00492306    mov         edx,dword ptr [ebp-20]
 00492309    mov         eax,dword ptr [ebp-0C]
 0049230C    call        00468BCC
 00492311    xor         edx,edx
 00492313    mov         eax,dword ptr [ebp-20]
 00492316    call        00468118
 0049231B    xor         eax,eax
 0049231D    pop         edx
 0049231E    pop         ecx
 0049231F    pop         ecx
 00492320    mov         dword ptr fs:[eax],edx
 00492323    push        492338
 00492328    mov         eax,dword ptr [ebp-18]
 0049232B    call        TObject.Free
 00492330    ret
>00492331    jmp         @HandleFinally
>00492336    jmp         00492328
 00492338    inc         dword ptr [ebp-14]
 0049233B    dec         dword ptr [ebp-24]
>0049233E    jne         004922AF
 00492344    xor         eax,eax
 00492346    pop         edx
 00492347    pop         ecx
 00492348    pop         ecx
 00492349    mov         dword ptr fs:[eax],edx
 0049234C    push        492369
 00492351    mov         eax,dword ptr [ebp-1C]
 00492354    call        TObject.Free
 00492359    mov         eax,dword ptr [ebp-20]
 0049235C    call        TObject.Free
 00492361    ret
>00492362    jmp         @HandleFinally
>00492367    jmp         00492351
 00492369    mov         eax,dword ptr [ebp-10]
 0049236C    pop         esi
 0049236D    mov         esp,ebp
 0049236F    pop         ebp
 00492370    ret
end;*}

//00492374
procedure TMeshObjectList.sub_00492374;
begin
{*
 00492374    push        ebx
 00492375    push        esi
 00492376    push        edi
 00492377    push        ebp
 00492378    mov         ebp,eax
 0049237A    mov         ebx,dword ptr [ebp+0C];TMeshObjectList.?fC:dword
 0049237D    dec         ebx
 0049237E    test        ebx,ebx
>00492380    jl          0049239B
 00492382    inc         ebx
 00492383    xor         edi,edi
 00492385    mov         edx,edi
 00492387    mov         eax,ebp
 00492389    call        00492124
 0049238E    mov         si,0FFEE
 00492392    call        @CallDynaInst
 00492397    inc         edi
 00492398    dec         ebx
>00492399    jne         00492385
 0049239B    pop         ebp
 0049239C    pop         edi
 0049239D    pop         esi
 0049239E    pop         ebx
 0049239F    ret
*}
end;

//004923A0
constructor TMeshMorphTarget.Create;
begin
{*
 004923A0    push        ebp
 004923A1    mov         ebp,esp
 004923A3    push        ecx
 004923A4    push        ebx
 004923A5    test        dl,dl
>004923A7    je          004923B1
 004923A9    add         esp,0FFFFFFF0
 004923AC    call        @ClassCreate
 004923B1    mov         byte ptr [ebp-1],dl
 004923B4    mov         ebx,eax
 004923B6    mov         dword ptr [ebx+18],ecx
 004923B9    xor         edx,edx
 004923BB    mov         eax,ebx
 004923BD    mov         ecx,dword ptr [eax]
 004923BF    call        dword ptr [ecx+0C]
 004923C2    mov         eax,dword ptr [ebx+18]
 004923C5    test        eax,eax
>004923C7    je          004923D0
 004923C9    mov         edx,ebx
 004923CB    call        00466E24
 004923D0    mov         eax,ebx
 004923D2    cmp         byte ptr [ebp-1],0
>004923D6    je          004923E7
 004923D8    call        @AfterConstruction
 004923DD    pop         dword ptr fs:[0]
 004923E4    add         esp,0C
 004923E7    mov         eax,ebx
 004923E9    pop         ebx
 004923EA    pop         ecx
 004923EB    pop         ebp
 004923EC    ret
*}
end;

//004923F0
destructor TMeshMorphTarget.Destroy;
begin
{*
 004923F0    push        ebx
 004923F1    push        esi
 004923F2    call        @BeforeDestruction
 004923F7    mov         ebx,edx
 004923F9    mov         esi,eax
 004923FB    mov         eax,dword ptr [esi+18];TMeshMorphTarget.?f18:dword
 004923FE    test        eax,eax
>00492400    je          00492409
 00492402    mov         edx,esi
 00492404    call        00466F94
 00492409    mov         edx,ebx
 0049240B    and         dl,0FC
 0049240E    mov         eax,esi
 00492410    call        TBaseMeshObject.Destroy
 00492415    test        bl,bl
>00492417    jle         00492420
 00492419    mov         eax,esi
 0049241B    call        @ClassDestroy
 00492420    pop         esi
 00492421    pop         ebx
 00492422    ret
*}
end;

//00492424
{*procedure TMeshMorphTarget.sub_00466814(?:?);
begin
 00492424    push        ebx
 00492425    mov         ebx,edx
 00492427    mov         edx,ebx
 00492429    call        TBaseMeshObject.sub_00466814
 0049242E    xor         edx,edx
 00492430    mov         eax,ebx
 00492432    mov         ecx,dword ptr [eax]
 00492434    call        dword ptr [ecx+8]
 00492437    pop         ebx
 00492438    ret
end;*}

//0049243C
{*procedure TMeshMorphTarget.sub_00466894(?:?);
begin
 0049243C    push        ebx
 0049243D    push        esi
 0049243E    mov         esi,edx
 00492440    mov         ebx,eax
 00492442    mov         edx,esi
 00492444    mov         eax,ebx
 00492446    call        TBaseMeshObject.sub_00466894
 0049244B    mov         eax,esi
 0049244D    mov         edx,dword ptr [eax]
 0049244F    call        dword ptr [edx+0C]
 00492452    test        eax,eax
>00492454    je          0049245F
 00492456    mov         edx,eax
 00492458    mov         eax,ebx
 0049245A    call        00466914
 0049245F    pop         esi
 00492460    pop         ebx
 00492461    ret
end;*}

//00492464
constructor TMeshMorphTargetList.Create;
begin
{*
 00492464    push        ebx
 00492465    push        esi
 00492466    test        dl,dl
>00492468    je          00492472
 0049246A    add         esp,0FFFFFFF0
 0049246D    call        @ClassCreate
 00492472    mov         ebx,edx
 00492474    mov         esi,eax
 00492476    mov         dword ptr [esi+18],ecx
 00492479    xor         edx,edx
 0049247B    mov         eax,esi
 0049247D    mov         ecx,dword ptr [eax]
 0049247F    call        dword ptr [ecx+0C]
 00492482    mov         eax,esi
 00492484    test        bl,bl
>00492486    je          00492497
 00492488    call        @AfterConstruction
 0049248D    pop         dword ptr fs:[0]
 00492494    add         esp,0C
 00492497    mov         eax,esi
 00492499    pop         esi
 0049249A    pop         ebx
 0049249B    ret
*}
end;

//0049249C
destructor TMeshMorphTargetList.Destroy;
begin
{*
 0049249C    push        ebx
 0049249D    push        esi
 0049249E    push        edi
 0049249F    call        @BeforeDestruction
 004924A4    mov         ebx,edx
 004924A6    mov         edi,eax
 004924A8    mov         eax,edi
 004924AA    mov         si,0FFF4
 004924AE    call        @CallDynaInst;TMeshMorphTargetList.sub_00466E50
 004924B3    mov         edx,ebx
 004924B5    and         dl,0FC
 004924B8    mov         eax,edi
 004924BA    call        TPersistentObjectList.Destroy
 004924BF    test        bl,bl
>004924C1    jle         004924CA
 004924C3    mov         eax,edi
 004924C5    call        @ClassDestroy
 004924CA    pop         edi
 004924CB    pop         esi
 004924CC    pop         ebx
 004924CD    ret
*}
end;

//004924D0
{*procedure TMeshMorphTargetList.sub_00466894(?:?);
begin
 004924D0    push        ebx
 004924D1    push        esi
 004924D2    push        edi
 004924D3    mov         ebx,eax
 004924D5    mov         eax,ebx
 004924D7    call        TPersistentObjectList.sub_00466894
 004924DC    mov         esi,dword ptr [ebx+0C];TMeshMorphTargetList.?fC:dword
 004924DF    dec         esi
 004924E0    test        esi,esi
>004924E2    jl          004924F7
 004924E4    inc         esi
 004924E5    xor         edi,edi
 004924E7    mov         edx,edi
 004924E9    mov         eax,ebx
 004924EB    call        00492564
 004924F0    mov         dword ptr [eax+18],ebx
 004924F3    inc         edi
 004924F4    dec         esi
>004924F5    jne         004924E7
 004924F7    pop         edi
 004924F8    pop         esi
 004924F9    pop         ebx
 004924FA    ret
end;*}

//004924FC
{*procedure sub_004924FC(?:TMeshMorphTargetList; ?:?);
begin
 004924FC    push        ebx
 004924FD    push        esi
 004924FE    push        edi
 004924FF    push        ebp
 00492500    push        ecx
 00492501    mov         dword ptr [esp],edx
 00492504    mov         ebp,eax
 00492506    mov         ebx,dword ptr [ebp+0C]
 00492509    dec         ebx
 0049250A    test        ebx,ebx
>0049250C    jl          0049252A
 0049250E    inc         ebx
 0049250F    xor         edi,edi
 00492511    mov         edx,edi
 00492513    mov         eax,ebp
 00492515    call        00492564
 0049251A    mov         edx,dword ptr [esp]
 0049251D    mov         si,0FFF2
 00492521    call        @CallDynaInst
 00492526    inc         edi
 00492527    dec         ebx
>00492528    jne         00492511
 0049252A    pop         edx
 0049252B    pop         ebp
 0049252C    pop         edi
 0049252D    pop         esi
 0049252E    pop         ebx
 0049252F    ret
end;*}

//00492530
procedure TMeshMorphTargetList.sub_00466E50;
begin
{*
 00492530    push        ebx
 00492531    push        esi
 00492532    push        edi
 00492533    mov         edi,eax
 00492535    mov         ebx,dword ptr [edi+0C];TMeshMorphTargetList.?fC:dword
 00492538    dec         ebx
 00492539    test        ebx,ebx
>0049253B    jl          00492557
 0049253D    inc         ebx
 0049253E    xor         esi,esi
 00492540    mov         edx,esi
 00492542    mov         eax,edi
 00492544    call        00492564
 00492549    xor         edx,edx
 0049254B    mov         dword ptr [eax+18],edx
 0049254E    call        TObject.Free
 00492553    inc         esi
 00492554    dec         ebx
>00492555    jne         00492540
 00492557    mov         eax,edi
 00492559    call        TPersistentObjectList.sub_00466E50
 0049255E    pop         edi
 0049255F    pop         esi
 00492560    pop         ebx
 00492561    ret
*}
end;

//00492564
{*function sub_00492564(?:TMeshMorphTargetList; ?:?):?;
begin
 00492564    mov         eax,dword ptr [eax+8];TMeshMorphTargetList.?f8:dword
 00492567    mov         eax,dword ptr [eax+edx*4]
 0049256A    ret
end;*}

//0049256C
constructor sub_0049256C;
begin
{*
 0049256C    push        ebx
 0049256D    push        esi
 0049256E    test        dl,dl
>00492570    je          0049257A
 00492572    add         esp,0FFFFFFF0
 00492575    call        @ClassCreate
 0049257A    mov         ebx,edx
 0049257C    mov         esi,eax
 0049257E    xor         edx,edx
 00492580    mov         eax,esi
 00492582    call        00490CE0
 00492587    mov         ecx,esi
 00492589    mov         dl,1
 0049258B    mov         eax,[0048D378];TMeshMorphTargetList
 00492590    call        TMeshMorphTargetList.Create;TMeshMorphTargetList.Create
 00492595    mov         dword ptr [esi+44],eax;TMorphableMeshObject.?f44:TMeshMorphTargetList
 00492598    mov         eax,esi
 0049259A    test        bl,bl
>0049259C    je          004925AD
 0049259E    call        @AfterConstruction
 004925A3    pop         dword ptr fs:[0]
 004925AA    add         esp,0C
 004925AD    mov         eax,esi
 004925AF    pop         esi
 004925B0    pop         ebx
 004925B1    ret
*}
end;

//004925B4
destructor TMorphableMeshObject.Destroy;
begin
{*
 004925B4    push        ebx
 004925B5    push        esi
 004925B6    call        @BeforeDestruction
 004925BB    mov         ebx,edx
 004925BD    mov         esi,eax
 004925BF    mov         eax,dword ptr [esi+44];TMorphableMeshObject.?f44:TMeshMorphTargetList
 004925C2    call        TObject.Free
 004925C7    mov         edx,ebx
 004925C9    and         dl,0FC
 004925CC    mov         eax,esi
 004925CE    call        TMeshObject.Destroy
 004925D3    test        bl,bl
>004925D5    jle         004925DE
 004925D7    mov         eax,esi
 004925D9    call        @ClassDestroy
 004925DE    pop         esi
 004925DF    pop         ebx
 004925E0    ret
*}
end;

//004925E4
{*procedure TMorphableMeshObject.sub_00466814(?:?);
begin
 004925E4    push        ebx
 004925E5    push        esi
 004925E6    mov         esi,edx
 004925E8    mov         ebx,eax
 004925EA    mov         edx,esi
 004925EC    mov         eax,ebx
 004925EE    call        TMeshObject.sub_00466814
 004925F3    xor         edx,edx
 004925F5    mov         eax,esi
 004925F7    mov         ecx,dword ptr [eax]
 004925F9    call        dword ptr [ecx+8]
 004925FC    mov         edx,esi
 004925FE    mov         eax,dword ptr [ebx+44];TMorphableMeshObject.?f44:TMeshMorphTargetList
 00492601    mov         si,0FFFC
 00492605    call        @CallDynaInst;TPersistentObjectList.sub_00466814
 0049260A    pop         esi
 0049260B    pop         ebx
 0049260C    ret
end;*}

//00492610
{*procedure TMorphableMeshObject.sub_00466894(?:?);
begin
 00492610    push        ebx
 00492611    push        esi
 00492612    mov         esi,edx
 00492614    mov         ebx,eax
 00492616    mov         edx,esi
 00492618    mov         eax,ebx
 0049261A    call        TMeshObject.sub_00466894
 0049261F    mov         eax,esi
 00492621    mov         edx,dword ptr [eax]
 00492623    call        dword ptr [edx+0C]
 00492626    test        eax,eax
>00492628    jne         0049263B
 0049262A    mov         edx,esi
 0049262C    mov         eax,dword ptr [ebx+44];TMorphableMeshObject.?f44:TMeshMorphTargetList
 0049262F    mov         si,0FFFB
 00492633    call        @CallDynaInst;TMeshMorphTargetList.sub_00466894
 00492638    pop         esi
 00492639    pop         ebx
 0049263A    ret
 0049263B    mov         edx,eax
 0049263D    mov         eax,ebx
 0049263F    call        00466914
 00492644    pop         esi
 00492645    pop         ebx
 00492646    ret
end;*}

//00492648
procedure TMorphableMeshObject.sub_0048EF2C;
begin
{*
 00492648    push        ebx
 00492649    push        esi
 0049264A    mov         ebx,eax
 0049264C    mov         eax,ebx
 0049264E    call        TMeshObject.sub_0048EF2C
 00492653    mov         eax,dword ptr [ebx+44];TMorphableMeshObject.?f44:TMeshMorphTargetList
 00492656    mov         si,0FFF4
 0049265A    call        @CallDynaInst;TMeshMorphTargetList.sub_00466E50
 0049265F    pop         esi
 00492660    pop         ebx
 00492661    ret
*}
end;

//00492664
{*procedure TMorphableMeshObject.sub_0048EF7C(?:?);
begin
 00492664    push        ebx
 00492665    push        esi
 00492666    mov         esi,edx
 00492668    mov         ebx,eax
 0049266A    mov         edx,esi
 0049266C    mov         eax,ebx
 0049266E    call        TBaseMeshObject.sub_0048EF7C
 00492673    mov         edx,esi
 00492675    mov         eax,dword ptr [ebx+44];TMorphableMeshObject.?f44:TMeshMorphTargetList
 00492678    call        004924FC
 0049267D    pop         esi
 0049267E    pop         ebx
 0049267F    ret
end;*}

//00492680
{*procedure sub_00492680(?:TMorphableMeshObject; ?:?);
begin
 00492680    push        ebx
 00492681    push        esi
 00492682    mov         esi,edx
 00492684    mov         ebx,eax
 00492686    test        esi,esi
>00492688    jne         00492693
 0049268A    mov         eax,dword ptr [ebx+44]
 0049268D    cmp         dword ptr [eax+0C],0
>00492691    je          004926E3
 00492693    mov         eax,dword ptr [ebx+44]
 00492696    mov         eax,dword ptr [eax+0C]
 00492699    cmp         eax,esi
>0049269B    ja          004926B1
 0049269D    mov         ecx,11F9
 004926A2    mov         edx,4926F0;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 004926A7    mov         eax,492734;'Assertion failure'
 004926AC    call        @Assert
 004926B1    mov         edx,esi
 004926B3    mov         eax,dword ptr [ebx+44]
 004926B6    call        00492564
 004926BB    mov         esi,eax
 004926BD    mov         eax,dword ptr [esi+0C]
 004926C0    cmp         dword ptr [eax+8],0
>004926C4    jle         004926D0
 004926C6    mov         edx,eax
 004926C8    mov         eax,dword ptr [ebx+0C]
 004926CB    mov         ecx,dword ptr [eax]
 004926CD    call        dword ptr [ecx+8]
 004926D0    mov         eax,dword ptr [esi+10]
 004926D3    cmp         dword ptr [eax+8],0
>004926D7    jle         004926E3
 004926D9    mov         edx,eax
 004926DB    mov         eax,dword ptr [ebx+10]
 004926DE    mov         ecx,dword ptr [eax]
 004926E0    call        dword ptr [ecx+8]
 004926E3    pop         esi
 004926E4    pop         ebx
 004926E5    ret
end;*}

//00492748
{*procedure sub_00492748(?:?; ?:?; ?:?; ?:?);
begin
 00492748    push        ebp
 00492749    mov         ebp,esp
 0049274B    add         esp,0FFFFFFF8
 0049274E    push        ebx
 0049274F    push        esi
 00492750    push        edi
 00492751    mov         dword ptr [ebp-4],ecx
 00492754    mov         esi,edx
 00492756    mov         ebx,eax
 00492758    mov         eax,dword ptr [ebx+44]
 0049275B    mov         eax,dword ptr [eax+0C]
 0049275E    cmp         eax,esi
>00492760    jbe         00492767
 00492762    cmp         eax,dword ptr [ebp-4]
>00492765    ja          0049277B
 00492767    mov         ecx,120A
 0049276C    mov         edx,492828;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00492771    mov         eax,49286C;'Assertion failure'
 00492776    call        @Assert
 0049277B    fld         dword ptr [ebp+8]
 0049277E    fcomp       dword ptr ds:[492880];0:Single
 00492784    fnstsw      al
 00492786    sahf
>00492787    jne         00492797
 00492789    mov         edx,esi
 0049278B    mov         eax,ebx
 0049278D    call        00492680
>00492792    jmp         00492817
 00492797    fld         dword ptr [ebp+8]
 0049279A    fcomp       dword ptr ds:[492884];1:Single
 004927A0    fnstsw      al
 004927A2    sahf
>004927A3    jne         004927B1
 004927A5    mov         edx,dword ptr [ebp-4]
 004927A8    mov         eax,ebx
 004927AA    call        00492680
>004927AF    jmp         00492817
 004927B1    mov         edx,esi
 004927B3    mov         eax,dword ptr [ebx+44]
 004927B6    call        00492564
 004927BB    mov         edi,eax
 004927BD    mov         edx,dword ptr [ebp-4]
 004927C0    mov         eax,dword ptr [ebx+44]
 004927C3    call        00492564
 004927C8    mov         dword ptr [ebp-8],eax
 004927CB    mov         esi,dword ptr [edi+0C]
 004927CE    cmp         dword ptr [esi+8],0
>004927D2    jle         004927EB
 004927D4    push        dword ptr [ebp+8]
 004927D7    mov         eax,dword ptr [ebp-8]
 004927DA    mov         ecx,dword ptr [eax+0C]
 004927DD    mov         edx,esi
 004927DF    mov         eax,dword ptr [ebx+0C]
 004927E2    mov         si,0FFED
 004927E6    call        @CallDynaInst
 004927EB    mov         esi,dword ptr [edi+10]
 004927EE    cmp         dword ptr [esi+8],0
>004927F2    jle         00492817
 004927F4    push        dword ptr [ebp+8]
 004927F7    mov         eax,dword ptr [ebp-8]
 004927FA    mov         ecx,dword ptr [eax+10]
 004927FD    mov         edx,esi
 004927FF    mov         eax,dword ptr [ebx+10]
 00492802    mov         si,0FFED
 00492806    call        @CallDynaInst
 0049280B    mov         eax,dword ptr [ebx+10]
 0049280E    mov         si,0FFF2
 00492812    call        @CallDynaInst
 00492817    pop         edi
 00492818    pop         esi
 00492819    pop         ebx
 0049281A    pop         ecx
 0049281B    pop         ecx
 0049281C    pop         ebp
 0049281D    ret         4
end;*}

//00492888
constructor sub_00492888;
begin
{*
 00492888    push        ebx
 00492889    push        esi
 0049288A    test        dl,dl
>0049288C    je          00492896
 0049288E    add         esp,0FFFFFFF0
 00492891    call        @ClassCreate
 00492896    mov         ebx,edx
 00492898    mov         esi,eax
 0049289A    mov         dl,1
 0049289C    mov         eax,[00417CEC];TList
 004928A1    call        TObject.Create;TList.Create
 004928A6    mov         dword ptr [esi+60],eax;TSkeletonMeshObject.?f60:TList
 004928A9    xor         edx,edx
 004928AB    mov         eax,esi
 004928AD    call        0049256C
 004928B2    mov         eax,esi
 004928B4    test        bl,bl
>004928B6    je          004928C7
 004928B8    call        @AfterConstruction
 004928BD    pop         dword ptr fs:[0]
 004928C4    add         esp,0C
 004928C7    mov         eax,esi
 004928C9    pop         esi
 004928CA    pop         ebx
 004928CB    ret
*}
end;

//004928CC
destructor TSkeletonMeshObject.Destroy;
begin
{*
 004928CC    push        ebx
 004928CD    push        esi
 004928CE    push        edi
 004928CF    call        @BeforeDestruction
 004928D4    mov         ebx,edx
 004928D6    mov         edi,eax
 004928D8    mov         eax,edi
 004928DA    mov         si,0FFF3
 004928DE    call        @CallDynaInst;TSkeletonMeshObject.sub_0048EF2C
 004928E3    mov         eax,dword ptr [edi+60];TSkeletonMeshObject.?f60:TList
 004928E6    call        TObject.Free
 004928EB    mov         edx,ebx
 004928ED    and         dl,0FC
 004928F0    mov         eax,edi
 004928F2    call        TMorphableMeshObject.Destroy
 004928F7    test        bl,bl
>004928F9    jle         00492902
 004928FB    mov         eax,edi
 004928FD    call        @ClassDestroy
 00492902    pop         edi
 00492903    pop         esi
 00492904    pop         ebx
 00492905    ret
*}
end;

//00492908
{*procedure TSkeletonMeshObject.sub_00466814(?:?);
begin
 00492908    push        ebx
 00492909    push        esi
 0049290A    push        edi
 0049290B    push        ebp
 0049290C    push        ecx
 0049290D    mov         edi,edx
 0049290F    mov         ebx,eax
 00492911    mov         edx,edi
 00492913    mov         eax,ebx
 00492915    call        TMorphableMeshObject.sub_00466814
 0049291A    xor         edx,edx
 0049291C    mov         eax,edi
 0049291E    mov         ecx,dword ptr [eax]
 00492920    call        dword ptr [ecx+8]
 00492923    mov         edx,dword ptr [ebx+4C];TSkeletonMeshObject.?f4C:dword
 00492926    mov         eax,edi
 00492928    mov         ecx,dword ptr [eax]
 0049292A    call        dword ptr [ecx+8]
 0049292D    mov         edx,dword ptr [ebx+54];TSkeletonMeshObject.?f54:Integer
 00492930    mov         eax,edi
 00492932    mov         ecx,dword ptr [eax]
 00492934    call        dword ptr [ecx+8]
 00492937    mov         edx,dword ptr [ebx+50];TSkeletonMeshObject.?f50:dword
 0049293A    mov         eax,edi
 0049293C    mov         ecx,dword ptr [eax]
 0049293E    call        dword ptr [ecx+8]
 00492941    mov         esi,dword ptr [ebx+4C];TSkeletonMeshObject.?f4C:dword
 00492944    dec         esi
 00492945    test        esi,esi
>00492947    jl          0049296D
 00492949    inc         esi
 0049294A    mov         dword ptr [esp],0
 00492951    mov         eax,dword ptr [ebx+48];TSkeletonMeshObject.?f48:dword
 00492954    mov         edx,dword ptr [esp]
 00492957    mov         edx,dword ptr [eax+edx*4]
 0049295A    mov         ecx,dword ptr [ebx+54];TSkeletonMeshObject.?f54:Integer
 0049295D    shl         ecx,3
 00492960    mov         eax,edi
 00492962    mov         ebp,dword ptr [eax]
 00492964    call        dword ptr [ebp+4]
 00492967    inc         dword ptr [esp]
 0049296A    dec         esi
>0049296B    jne         00492951
 0049296D    pop         edx
 0049296E    pop         ebp
 0049296F    pop         edi
 00492970    pop         esi
 00492971    pop         ebx
 00492972    ret
end;*}

//00492974
{*procedure TSkeletonMeshObject.sub_00466894(?:?);
begin
 00492974    push        ebx
 00492975    push        esi
 00492976    push        edi
 00492977    push        ebp
 00492978    push        ecx
 00492979    mov         esi,edx
 0049297B    mov         ebx,eax
 0049297D    mov         edx,esi
 0049297F    mov         eax,ebx
 00492981    call        TMorphableMeshObject.sub_00466894
 00492986    mov         eax,esi
 00492988    mov         edx,dword ptr [eax]
 0049298A    call        dword ptr [edx+0C]
 0049298D    test        eax,eax
>0049298F    jne         004929E4
 00492991    mov         eax,esi
 00492993    mov         edx,dword ptr [eax]
 00492995    call        dword ptr [edx+0C]
 00492998    mov         dword ptr [ebx+4C],eax;TSkeletonMeshObject.?f4C:dword
 0049299B    mov         eax,esi
 0049299D    mov         edx,dword ptr [eax]
 0049299F    call        dword ptr [edx+0C]
 004929A2    mov         dword ptr [ebx+54],eax;TSkeletonMeshObject.?f54:Integer
 004929A5    mov         eax,esi
 004929A7    mov         edx,dword ptr [eax]
 004929A9    call        dword ptr [edx+0C]
 004929AC    mov         dword ptr [ebx+50],eax;TSkeletonMeshObject.?f50:dword
 004929AF    mov         eax,ebx
 004929B1    call        00492A40
 004929B6    mov         edi,dword ptr [ebx+4C];TSkeletonMeshObject.?f4C:dword
 004929B9    dec         edi
 004929BA    test        edi,edi
>004929BC    jl          004929ED
 004929BE    inc         edi
 004929BF    mov         dword ptr [esp],0
 004929C6    mov         eax,dword ptr [ebx+48];TSkeletonMeshObject.?f48:dword
 004929C9    mov         edx,dword ptr [esp]
 004929CC    mov         edx,dword ptr [eax+edx*4]
 004929CF    mov         ecx,dword ptr [ebx+54];TSkeletonMeshObject.?f54:Integer
 004929D2    shl         ecx,3
 004929D5    mov         eax,esi
 004929D7    mov         ebp,dword ptr [eax]
 004929D9    call        dword ptr [ebp+4]
 004929DC    inc         dword ptr [esp]
 004929DF    dec         edi
>004929E0    jne         004929C6
>004929E2    jmp         004929ED
 004929E4    mov         edx,eax
 004929E6    mov         eax,ebx
 004929E8    call        00466914
 004929ED    pop         edx
 004929EE    pop         ebp
 004929EF    pop         edi
 004929F0    pop         esi
 004929F1    pop         ebx
 004929F2    ret
end;*}

//004929F4
procedure TSkeletonMeshObject.sub_0048EF2C;
begin
{*
 004929F4    push        ebx
 004929F5    push        esi
 004929F6    push        edi
 004929F7    mov         ebx,eax
 004929F9    mov         eax,ebx
 004929FB    call        TMorphableMeshObject.sub_0048EF2C
 00492A00    xor         eax,eax
 00492A02    mov         dword ptr [ebx+4C],eax;TSkeletonMeshObject.?f4C:dword
 00492A05    xor         eax,eax
 00492A07    mov         dword ptr [ebx+54],eax;TSkeletonMeshObject.?f54:Integer
 00492A0A    mov         eax,ebx
 00492A0C    call        00492A40
 00492A11    mov         eax,dword ptr [ebx+60];TSkeletonMeshObject.?f60:TList
 00492A14    mov         esi,dword ptr [eax+8];TList.FCount:Integer
 00492A17    dec         esi
 00492A18    test        esi,esi
>00492A1A    jl          00492A32
 00492A1C    inc         esi
 00492A1D    xor         edi,edi
 00492A1F    mov         edx,edi
 00492A21    mov         eax,dword ptr [ebx+60];TSkeletonMeshObject.?f60:TList
 00492A24    call        TList.Get
 00492A29    call        TObject.Free
 00492A2E    inc         edi
 00492A2F    dec         esi
>00492A30    jne         00492A1F
 00492A32    mov         eax,dword ptr [ebx+60];TSkeletonMeshObject.?f60:TList
 00492A35    mov         edx,dword ptr [eax]
 00492A37    call        dword ptr [edx+8];TList.Clear
 00492A3A    pop         edi
 00492A3B    pop         esi
 00492A3C    pop         ebx
 00492A3D    ret
*}
end;

//00492A40
procedure sub_00492A40(?:TSkeletonMeshObject);
begin
{*
 00492A40    push        ebx
 00492A41    push        esi
 00492A42    push        edi
 00492A43    push        ebp
 00492A44    add         esp,0FFFFFFF4
 00492A47    mov         ebx,eax
 00492A49    mov         esi,dword ptr [ebx+54];TSkeletonMeshObject.?f54:Integer
 00492A4C    mov         eax,dword ptr [ebx+50];TSkeletonMeshObject.?f50:dword
 00492A4F    imul        esi,eax
 00492A52    test        esi,esi
>00492A54    jne         00492A7A
 00492A56    mov         eax,dword ptr [ebx+48];TSkeletonMeshObject.?f48:dword
 00492A59    test        eax,eax
>00492A5B    je          00492B40
 00492A61    mov         eax,dword ptr [eax]
 00492A63    call        @FreeMem
 00492A68    mov         eax,dword ptr [ebx+48];TSkeletonMeshObject.?f48:dword
 00492A6B    call        @FreeMem
 00492A70    xor         eax,eax
 00492A72    mov         dword ptr [ebx+48],eax;TSkeletonMeshObject.?f48:dword
>00492A75    jmp         00492B40
 00492A7A    shl         eax,2
 00492A7D    call        @GetMem
 00492A82    mov         dword ptr [esp+4],eax
 00492A86    mov         eax,esi
 00492A88    shl         eax,3
 00492A8B    call        AllocMem
 00492A90    mov         edx,dword ptr [esp+4]
 00492A94    mov         dword ptr [edx],eax
 00492A96    mov         eax,dword ptr [ebx+50];TSkeletonMeshObject.?f50:dword
 00492A99    dec         eax
 00492A9A    test        eax,eax
>00492A9C    jle         00492AC4
 00492A9E    mov         dword ptr [esp+8],eax
 00492AA2    mov         eax,1
 00492AA7    mov         edx,eax
 00492AA9    shl         edx,3
 00492AAC    imul        edx,dword ptr [ebx+54];TSkeletonMeshObject.?f54:Integer
 00492AB0    mov         ecx,dword ptr [esp+4]
 00492AB4    add         edx,dword ptr [ecx]
 00492AB6    mov         ecx,dword ptr [esp+4]
 00492ABA    mov         dword ptr [ecx+eax*4],edx
 00492ABD    inc         eax
 00492ABE    dec         dword ptr [esp+8]
>00492AC2    jne         00492AA7
 00492AC4    mov         edx,dword ptr [ebx+4C];TSkeletonMeshObject.?f4C:dword
 00492AC7    mov         eax,dword ptr [ebx+58];TSkeletonMeshObject.?f58:dword
 00492ACA    cmp         edx,eax
>00492ACC    jle         00492AD2
 00492ACE    mov         esi,eax
>00492AD0    jmp         00492AD4
 00492AD2    mov         esi,edx
 00492AD4    mov         edx,dword ptr [ebx+54];TSkeletonMeshObject.?f54:Integer
 00492AD7    mov         eax,dword ptr [ebx+5C];TSkeletonMeshObject.?f5C:Integer
 00492ADA    cmp         edx,eax
>00492ADC    jle         00492AE3
 00492ADE    mov         dword ptr [esp],eax
>00492AE1    jmp         00492AE6
 00492AE3    mov         dword ptr [esp],edx
 00492AE6    dec         esi
 00492AE7    test        esi,esi
>00492AE9    jl          00492B23
 00492AEB    inc         esi
 00492AEC    mov         dword ptr [esp+8],esi
 00492AF0    xor         eax,eax
 00492AF2    mov         esi,dword ptr [esp]
 00492AF5    dec         esi
 00492AF6    test        esi,esi
>00492AF8    jl          00492B1C
 00492AFA    inc         esi
 00492AFB    xor         edx,edx
 00492AFD    mov         ecx,dword ptr [esp+4]
 00492B01    mov         ecx,dword ptr [ecx+eax*4]
 00492B04    mov         edi,dword ptr [ebx+48];TSkeletonMeshObject.?f48:dword
 00492B07    mov         edi,dword ptr [edi+eax*4]
 00492B0A    mov         ebp,dword ptr [edi+edx*8]
 00492B0D    mov         dword ptr [ecx+edx*8],ebp
 00492B10    mov         ebp,dword ptr [edi+edx*8+4]
 00492B14    mov         dword ptr [ecx+edx*8+4],ebp
 00492B18    inc         edx
 00492B19    dec         esi
>00492B1A    jne         00492AFD
 00492B1C    inc         eax
 00492B1D    dec         dword ptr [esp+8]
>00492B21    jne         00492AF2
 00492B23    mov         eax,dword ptr [ebx+48];TSkeletonMeshObject.?f48:dword
 00492B26    test        eax,eax
>00492B28    je          00492B39
 00492B2A    mov         eax,dword ptr [eax]
 00492B2C    call        @FreeMem
 00492B31    mov         eax,dword ptr [ebx+48];TSkeletonMeshObject.?f48:dword
 00492B34    call        @FreeMem
 00492B39    mov         eax,dword ptr [esp+4]
 00492B3D    mov         dword ptr [ebx+48],eax;TSkeletonMeshObject.?f48:dword
 00492B40    mov         eax,dword ptr [ebx+54];TSkeletonMeshObject.?f54:Integer
 00492B43    mov         dword ptr [ebx+5C],eax;TSkeletonMeshObject.?f5C:Integer
 00492B46    add         esp,0C
 00492B49    pop         ebp
 00492B4A    pop         edi
 00492B4B    pop         esi
 00492B4C    pop         ebx
 00492B4D    ret
*}
end;

//00492B50
{*procedure sub_00492B50(?:?);
begin
 00492B50    push        ebx
 00492B51    push        esi
 00492B52    push        edi
 00492B53    push        ebp
 00492B54    add         esp,0FFFFFF88
 00492B57    mov         esi,eax
 00492B59    mov         eax,dword ptr [esi+60]
 00492B5C    mov         eax,dword ptr [eax+8]
 00492B5F    dec         eax
 00492B60    test        eax,eax
>00492B62    jl          00492B81
 00492B64    inc         eax
 00492B65    mov         dword ptr [esp+4],eax
 00492B69    xor         ebx,ebx
 00492B6B    mov         edx,ebx
 00492B6D    mov         eax,dword ptr [esi+60]
 00492B70    call        TList.Get
 00492B75    call        TObject.Free
 00492B7A    inc         ebx
 00492B7B    dec         dword ptr [esp+4]
>00492B7F    jne         00492B6B
 00492B81    mov         eax,dword ptr [esi+60]
 00492B84    mov         edx,dword ptr [eax]
 00492B86    call        dword ptr [edx+8]
 00492B89    mov         eax,dword ptr [esi+54]
 00492B8C    dec         eax
 00492B8D    test        eax,eax
>00492B8F    jl          00492D01
 00492B95    inc         eax
 00492B96    mov         dword ptr [esp+4],eax
 00492B9A    mov         dword ptr [esp],0
 00492BA1    mov         dl,1
 00492BA3    mov         eax,[0048C9A0];TBaseMeshObject
 00492BA8    call        TBaseMeshObject.Create;TBaseMeshObject.Create
 00492BAD    mov         edi,eax
 00492BAF    mov         edx,edi
 00492BB1    mov         eax,dword ptr [esi+60]
 00492BB4    call        TList.Add
 00492BB9    mov         edx,dword ptr [esi+0C]
 00492BBC    mov         eax,edi
 00492BBE    call        0048F588
 00492BC3    mov         edx,dword ptr [esi+10]
 00492BC6    mov         eax,edi
 00492BC8    call        0048F594
 00492BCD    mov         eax,dword ptr [esi+0C]
 00492BD0    mov         eax,dword ptr [eax+8]
 00492BD3    dec         eax
 00492BD4    test        eax,eax
>00492BD6    jl          00492CF4
 00492BDC    inc         eax
 00492BDD    mov         dword ptr [esp+8],eax
 00492BE1    xor         ebx,ebx
 00492BE3    mov         eax,dword ptr [esi+48]
 00492BE6    mov         eax,dword ptr [eax+ebx*4]
 00492BE9    mov         edx,dword ptr [esp]
 00492BEC    mov         eax,dword ptr [eax+edx*8]
 00492BEF    mov         edx,dword ptr [esi+18]
 00492BF2    mov         edx,dword ptr [edx+18]
 00492BF5    mov         edx,dword ptr [edx+0CC]
 00492BFB    mov         edx,dword ptr [edx+0C]
 00492BFE    xchg        eax,edx
 00492BFF    mov         ecx,dword ptr [eax]
 00492C01    call        dword ptr [ecx+24]
 00492C04    mov         ebp,eax
 00492C06    lea         ecx,[esp+5C]
 00492C0A    mov         edx,ebx
 00492C0C    mov         eax,dword ptr [esi+0C]
 00492C0F    call        00468C18
 00492C14    lea         edx,[esp+5C]
 00492C18    lea         eax,[esp+4C]
 00492C1C    call        0045C9FC
 00492C21    push        esi
 00492C22    push        edi
 00492C23    lea         esi,[ebp+1C]
 00492C26    lea         edi,[esp+14]
 00492C2A    mov         ecx,10
 00492C2F    rep movs    dword ptr [edi],dword ptr [esi]
 00492C31    pop         edi
 00492C32    pop         esi
 00492C33    lea         eax,[esp+0C]
 00492C37    call        0045E6F0
 00492C3C    lea         ecx,[esp+68]
 00492C40    lea         edx,[esp+0C]
 00492C44    lea         eax,[esp+4C]
 00492C48    call        0045E03C
 00492C4D    push        esi
 00492C4E    push        edi
 00492C4F    lea         esi,[esp+70]
 00492C53    lea         edi,[esp+54]
 00492C57    movs        dword ptr [edi],dword ptr [esi]
 00492C58    movs        dword ptr [edi],dword ptr [esi]
 00492C59    movs        dword ptr [edi],dword ptr [esi]
 00492C5A    movs        dword ptr [edi],dword ptr [esi]
 00492C5B    pop         edi
 00492C5C    pop         esi
 00492C5D    lea         eax,[esp+4C]
 00492C61    mov         ecx,eax
 00492C63    mov         eax,dword ptr [edi+0C];TBaseMeshObject.?fC:TAffineVectorList
 00492C66    mov         edx,ebx
 00492C68    call        00468C9C
 00492C6D    push        0
 00492C6F    lea         ecx,[esp+60]
 00492C73    mov         edx,ebx
 00492C75    mov         eax,dword ptr [esi+10]
 00492C78    call        00468C18
 00492C7D    lea         edx,[esp+60]
 00492C81    lea         eax,[esp+50]
 00492C85    call        0045C9A0
 00492C8A    push        esi
 00492C8B    push        edi
 00492C8C    lea         esi,[ebp+1C]
 00492C8F    lea         edi,[esp+14]
 00492C93    mov         ecx,10
 00492C98    rep movs    dword ptr [edi],dword ptr [esi]
 00492C9A    pop         edi
 00492C9B    pop         esi
 00492C9C    mov         eax,[005AE680];^gvar_005ACFA4
 00492CA1    push        esi
 00492CA2    push        edi
 00492CA3    mov         esi,eax
 00492CA5    lea         edi,[esp+44]
 00492CA9    movs        dword ptr [edi],dword ptr [esi]
 00492CAA    movs        dword ptr [edi],dword ptr [esi]
 00492CAB    movs        dword ptr [edi],dword ptr [esi]
 00492CAC    movs        dword ptr [edi],dword ptr [esi]
 00492CAD    pop         edi
 00492CAE    pop         esi
 00492CAF    lea         eax,[esp+0C]
 00492CB3    call        0045E6F0
 00492CB8    lea         ecx,[esp+68]
 00492CBC    lea         edx,[esp+0C]
 00492CC0    lea         eax,[esp+4C]
 00492CC4    call        0045E03C
 00492CC9    push        esi
 00492CCA    push        edi
 00492CCB    lea         esi,[esp+70]
 00492CCF    lea         edi,[esp+54]
 00492CD3    movs        dword ptr [edi],dword ptr [esi]
 00492CD4    movs        dword ptr [edi],dword ptr [esi]
 00492CD5    movs        dword ptr [edi],dword ptr [esi]
 00492CD6    movs        dword ptr [edi],dword ptr [esi]
 00492CD7    pop         edi
 00492CD8    pop         esi
 00492CD9    lea         eax,[esp+4C]
 00492CDD    mov         ecx,eax
 00492CDF    mov         eax,dword ptr [edi+10];TBaseMeshObject.?f10:TAffineVectorList
 00492CE2    mov         edx,ebx
 00492CE4    call        00468C9C
 00492CE9    inc         ebx
 00492CEA    dec         dword ptr [esp+8]
>00492CEE    jne         00492BE3
 00492CF4    inc         dword ptr [esp]
 00492CF7    dec         dword ptr [esp+4]
>00492CFB    jne         00492BA1
 00492D01    add         esp,78
 00492D04    pop         ebp
 00492D05    pop         edi
 00492D06    pop         esi
 00492D07    pop         ebx
 00492D08    ret
end;*}

//00492D0C
{*procedure sub_00492D0C(?:?; ?:?);
begin
 00492D0C    push        ebx
 00492D0D    push        esi
 00492D0E    push        edi
 00492D0F    push        ebp
 00492D10    add         esp,0FFFFFF94
 00492D13    mov         byte ptr [esp],dl
 00492D16    mov         esi,eax
 00492D18    xor         edx,edx
 00492D1A    mov         eax,dword ptr [esi+60]
 00492D1D    call        TList.Get
 00492D22    mov         edx,dword ptr [eax+0C]
 00492D25    mov         dword ptr [esp+4],edx
 00492D29    mov         eax,dword ptr [eax+10]
 00492D2C    mov         dword ptr [esp+8],eax
 00492D30    mov         eax,dword ptr [esi+18]
 00492D33    mov         eax,dword ptr [eax+18]
 00492D36    mov         eax,dword ptr [eax+0CC]
 00492D3C    mov         dword ptr [esp+10],eax
 00492D40    xor         eax,eax
 00492D42    mov         dword ptr [esp+24],eax
 00492D46    cmp         dword ptr [esi+54],1
>00492D4A    jne         00492E17
 00492D50    mov         eax,dword ptr [esp+4]
 00492D54    mov         eax,dword ptr [eax+8]
 00492D57    dec         eax
 00492D58    test        eax,eax
>00492D5A    jl          00492FC8
 00492D60    inc         eax
 00492D61    mov         dword ptr [esp+14],eax
 00492D65    xor         ebx,ebx
 00492D67    mov         eax,dword ptr [esi+48]
 00492D6A    mov         eax,dword ptr [eax+ebx*4]
 00492D6D    mov         eax,dword ptr [eax]
 00492D6F    mov         edx,eax
 00492D71    mov         eax,dword ptr [esp+10]
 00492D75    call        00490660
 00492D7A    mov         dword ptr [esp+0C],eax
 00492D7E    lea         edi,[ebx+ebx*2]
 00492D81    mov         eax,dword ptr [esp+4]
 00492D85    mov         eax,dword ptr [eax+24]
 00492D88    lea         eax,[eax+edi*4]
 00492D8B    lea         ecx,[esp+50]
 00492D8F    mov         edx,dword ptr [esp+0C]
 00492D93    add         edx,1C
 00492D96    call        0045E138
 00492D9B    mov         eax,dword ptr [esi+0C]
 00492D9E    mov         eax,dword ptr [eax+24]
 00492DA1    mov         edx,dword ptr [esp+50]
 00492DA5    mov         dword ptr [eax+edi*4],edx
 00492DA8    mov         edx,dword ptr [esp+54]
 00492DAC    mov         dword ptr [eax+edi*4+4],edx
 00492DB0    mov         edx,dword ptr [esp+58]
 00492DB4    mov         dword ptr [eax+edi*4+8],edx
 00492DB8    mov         eax,dword ptr [esp+8]
 00492DBC    mov         eax,dword ptr [eax+24]
 00492DBF    lea         edx,[esp+18]
 00492DC3    mov         ecx,dword ptr [eax+edi*4]
 00492DC6    mov         dword ptr [edx],ecx
 00492DC8    mov         ecx,dword ptr [eax+edi*4+4]
 00492DCC    mov         dword ptr [edx+4],ecx
 00492DCF    mov         ecx,dword ptr [eax+edi*4+8]
 00492DD3    mov         dword ptr [edx+8],ecx
 00492DD6    lea         ecx,[esp+28]
 00492DDA    mov         eax,dword ptr [esp+0C]
 00492DDE    lea         edx,[eax+1C]
 00492DE1    lea         eax,[esp+18]
 00492DE5    call        0045E03C
 00492DEA    mov         eax,dword ptr [esi+10]
 00492DED    mov         eax,dword ptr [eax+24]
 00492DF0    lea         edx,[esp+28]
 00492DF4    mov         ecx,dword ptr [edx]
 00492DF6    mov         dword ptr [eax+edi*4],ecx
 00492DF9    mov         ecx,dword ptr [edx+4]
 00492DFC    mov         dword ptr [eax+edi*4+4],ecx
 00492E00    mov         ecx,dword ptr [edx+8]
 00492E03    mov         dword ptr [eax+edi*4+8],ecx
 00492E07    inc         ebx
 00492E08    dec         dword ptr [esp+14]
>00492E0C    jne         00492D67
>00492E12    jmp         00492FC8
 00492E17    mov         eax,dword ptr [esp+4]
 00492E1B    mov         eax,dword ptr [eax+8]
 00492E1E    dec         eax
 00492E1F    test        eax,eax
>00492E21    jl          00492FC8
 00492E27    inc         eax
 00492E28    mov         dword ptr [esp+14],eax
 00492E2C    xor         ebx,ebx
 00492E2E    lea         eax,[ebx+ebx*2]
 00492E31    mov         edx,dword ptr [esi+0C]
 00492E34    mov         edx,dword ptr [edx+24]
 00492E37    mov         ecx,dword ptr ds:[5AE438];^gvar_005ACF18
 00492E3D    mov         edi,dword ptr [ecx]
 00492E3F    mov         dword ptr [edx+eax*4],edi
 00492E42    mov         edi,dword ptr [ecx+4]
 00492E45    mov         dword ptr [edx+eax*4+4],edi
 00492E49    mov         edi,dword ptr [ecx+8]
 00492E4C    mov         dword ptr [edx+eax*4+8],edi
 00492E50    mov         edx,dword ptr [esi+10]
 00492E53    mov         edx,dword ptr [edx+24]
 00492E56    mov         ecx,dword ptr ds:[5AE438];^gvar_005ACF18
 00492E5C    mov         edi,dword ptr [ecx]
 00492E5E    mov         dword ptr [edx+eax*4],edi
 00492E61    mov         edi,dword ptr [ecx+4]
 00492E64    mov         dword ptr [edx+eax*4+4],edi
 00492E68    mov         edi,dword ptr [ecx+8]
 00492E6B    mov         dword ptr [edx+eax*4+8],edi
 00492E6F    mov         ebp,dword ptr [esi+54]
 00492E72    dec         ebp
 00492E73    test        ebp,ebp
>00492E75    jl          00492FBD
 00492E7B    inc         ebp
 00492E7C    xor         edi,edi
 00492E7E    mov         edx,edi
 00492E80    mov         eax,dword ptr [esi+60]
 00492E83    call        TList.Get
 00492E88    mov         edx,dword ptr [eax+0C]
 00492E8B    mov         dword ptr [esp+4],edx
 00492E8F    mov         eax,dword ptr [eax+10]
 00492E92    mov         dword ptr [esp+8],eax
 00492E96    mov         eax,[005AE438];^gvar_005ACF18
 00492E9B    mov         edx,dword ptr [eax]
 00492E9D    mov         dword ptr [esp+38],edx
 00492EA1    mov         edx,dword ptr [eax+4]
 00492EA4    mov         dword ptr [esp+3C],edx
 00492EA8    mov         edx,dword ptr [eax+8]
 00492EAB    mov         dword ptr [esp+40],edx
 00492EAF    mov         eax,[005AE438];^gvar_005ACF18
 00492EB4    mov         edx,dword ptr [eax]
 00492EB6    mov         dword ptr [esp+44],edx
 00492EBA    mov         edx,dword ptr [eax+4]
 00492EBD    mov         dword ptr [esp+48],edx
 00492EC1    mov         edx,dword ptr [eax+8]
 00492EC4    mov         dword ptr [esp+4C],edx
 00492EC8    mov         eax,dword ptr [esi+48]
 00492ECB    mov         eax,dword ptr [eax+ebx*4]
 00492ECE    fld         dword ptr [eax+edi*8+4]
 00492ED2    fcomp       dword ptr ds:[492FE4];0:Single
 00492ED8    fnstsw      al
 00492EDA    sahf
>00492EDB    je          00492F8B
 00492EE1    mov         eax,dword ptr [esi+48]
 00492EE4    mov         eax,dword ptr [eax+ebx*4]
 00492EE7    mov         eax,dword ptr [eax+edi*8]
 00492EEA    mov         edx,eax
 00492EEC    mov         eax,dword ptr [esp+10]
 00492EF0    call        00490660
 00492EF5    mov         dword ptr [esp+0C],eax
 00492EF9    lea         eax,[ebx+ebx*2]
 00492EFC    mov         edx,dword ptr [esp+4]
 00492F00    mov         edx,dword ptr [edx+24]
 00492F03    lea         eax,[edx+eax*4]
 00492F06    lea         ecx,[esp+50]
 00492F0A    mov         edx,dword ptr [esp+0C]
 00492F0E    add         edx,1C
 00492F11    call        0045E138
 00492F16    lea         edx,[esp+50]
 00492F1A    mov         eax,dword ptr [esi+48]
 00492F1D    mov         eax,dword ptr [eax+ebx*4]
 00492F20    lea         ecx,[eax+edi*8+4]
 00492F24    lea         eax,[esp+38]
 00492F28    call        0045CCF8
 00492F2D    lea         eax,[ebx+ebx*2]
 00492F30    mov         edx,dword ptr [esp+8]
 00492F34    mov         edx,dword ptr [edx+24]
 00492F37    lea         ecx,[esp+18]
 00492F3B    lea         edx,[edx+eax*4]
 00492F3E    mov         eax,dword ptr [edx]
 00492F40    mov         dword ptr [ecx],eax
 00492F42    mov         eax,dword ptr [edx+4]
 00492F45    mov         dword ptr [ecx+4],eax
 00492F48    mov         eax,dword ptr [edx+8]
 00492F4B    mov         dword ptr [ecx+8],eax
 00492F4E    lea         ecx,[esp+5C]
 00492F52    mov         eax,dword ptr [esp+0C]
 00492F56    lea         edx,[eax+1C]
 00492F59    lea         eax,[esp+18]
 00492F5D    call        0045E03C
 00492F62    push        esi
 00492F63    push        edi
 00492F64    lea         esi,[esp+64]
 00492F68    lea         edi,[esp+20]
 00492F6C    movs        dword ptr [edi],dword ptr [esi]
 00492F6D    movs        dword ptr [edi],dword ptr [esi]
 00492F6E    movs        dword ptr [edi],dword ptr [esi]
 00492F6F    movs        dword ptr [edi],dword ptr [esi]
 00492F70    pop         edi
 00492F71    pop         esi
 00492F72    mov         eax,dword ptr [esi+48]
 00492F75    mov         eax,dword ptr [eax+ebx*4]
 00492F78    lea         ecx,[eax+edi*8+4]
 00492F7C    lea         eax,[esp+18]
 00492F80    mov         edx,eax
 00492F82    lea         eax,[esp+44]
 00492F86    call        0045CCF8
 00492F8B    lea         eax,[ebx+ebx*2]
 00492F8E    mov         edx,dword ptr [esi+0C]
 00492F91    mov         edx,dword ptr [edx+24]
 00492F94    lea         eax,[edx+eax*4]
 00492F97    lea         edx,[esp+38]
 00492F9B    call        0045CADC
 00492FA0    lea         eax,[ebx+ebx*2]
 00492FA3    mov         edx,dword ptr [esi+10]
 00492FA6    mov         edx,dword ptr [edx+24]
 00492FA9    lea         eax,[edx+eax*4]
 00492FAC    lea         edx,[esp+44]
 00492FB0    call        0045CADC
 00492FB5    inc         edi
 00492FB6    dec         ebp
>00492FB7    jne         00492E7E
 00492FBD    inc         ebx
 00492FBE    dec         dword ptr [esp+14]
>00492FC2    jne         00492E2E
 00492FC8    cmp         byte ptr [esp],0
>00492FCC    je          00492FDA
 00492FCE    mov         eax,dword ptr [esi+10]
 00492FD1    mov         si,0FFF2
 00492FD5    call        @CallDynaInst
 00492FDA    add         esp,6C
 00492FDD    pop         ebp
 00492FDE    pop         edi
 00492FDF    pop         esi
 00492FE0    pop         ebx
 00492FE1    ret
end;*}

//00492FE8
constructor TFGVertexIndexList.Create;
begin
{*
 00492FE8    push        ebp
 00492FE9    mov         ebp,esp
 00492FEB    push        ecx
 00492FEC    push        ebx
 00492FED    test        dl,dl
>00492FEF    je          00492FF9
 00492FF1    add         esp,0FFFFFFF0
 00492FF4    call        @ClassCreate
 00492FF9    mov         byte ptr [ebp-1],dl
 00492FFC    mov         ebx,eax
 00492FFE    mov         dword ptr [ebx+8],ecx;TFaceGroup.?f8:dword
 00493001    mov         dword ptr [ebx+14],0FFFFFFFF;TFaceGroup.?f14:dword
 00493008    xor         edx,edx
 0049300A    mov         eax,ebx
 0049300C    mov         ecx,dword ptr [eax]
 0049300E    call        dword ptr [ecx+0C];TFaceGroup.sub_004666E0
 00493011    mov         eax,dword ptr [ebx+8];TFaceGroup.?f8:dword
 00493014    test        eax,eax
>00493016    je          0049301F
 00493018    mov         edx,ebx
 0049301A    call        00466E24
 0049301F    mov         eax,ebx
 00493021    cmp         byte ptr [ebp-1],0
>00493025    je          00493036
 00493027    call        @AfterConstruction
 0049302C    pop         dword ptr fs:[0]
 00493033    add         esp,0C
 00493036    mov         eax,ebx
 00493038    pop         ebx
 00493039    pop         ecx
 0049303A    pop         ebp
 0049303B    ret
*}
end;

//0049303C
destructor TFaceGroup.Destroy;
begin
{*
 0049303C    push        ebx
 0049303D    push        esi
 0049303E    call        @BeforeDestruction
 00493043    mov         ebx,edx
 00493045    mov         esi,eax
 00493047    mov         eax,dword ptr [esi+8];TFaceGroup.?f8:dword
 0049304A    test        eax,eax
>0049304C    je          00493055
 0049304E    mov         edx,esi
 00493050    call        00466F94
 00493055    mov         edx,ebx
 00493057    and         dl,0FC
 0049305A    mov         eax,esi
 0049305C    call        TPersistentObject.Destroy
 00493061    test        bl,bl
>00493063    jle         0049306C
 00493065    mov         eax,esi
 00493067    call        @ClassDestroy
 0049306C    pop         esi
 0049306D    pop         ebx
 0049306E    ret
*}
end;

//00493070
{*procedure TFaceGroup.sub_00466814(?:?);
begin
 00493070    push        ebx
 00493071    push        esi
 00493072    mov         esi,edx
 00493074    mov         ebx,eax
 00493076    mov         edx,esi
 00493078    mov         eax,ebx
 0049307A    call        TPersistentObject.sub_00466814
 0049307F    cmp         dword ptr [ebx+14],0;TFaceGroup.?f14:dword
>00493083    jge         0049309B
 00493085    xor         edx,edx
 00493087    mov         eax,esi
 00493089    mov         ecx,dword ptr [eax]
 0049308B    call        dword ptr [ecx+8]
 0049308E    mov         edx,dword ptr [ebx+0C];TFaceGroup.?fC:String
 00493091    mov         eax,esi
 00493093    mov         ecx,dword ptr [eax]
 00493095    call        dword ptr [ecx+10]
 00493098    pop         esi
 00493099    pop         ebx
 0049309A    ret
 0049309B    mov         edx,1
 004930A0    mov         eax,esi
 004930A2    mov         ecx,dword ptr [eax]
 004930A4    call        dword ptr [ecx+8]
 004930A7    mov         edx,dword ptr [ebx+0C];TFaceGroup.?fC:String
 004930AA    mov         eax,esi
 004930AC    mov         ecx,dword ptr [eax]
 004930AE    call        dword ptr [ecx+10]
 004930B1    mov         edx,dword ptr [ebx+14];TFaceGroup.?f14:dword
 004930B4    mov         eax,esi
 004930B6    mov         ecx,dword ptr [eax]
 004930B8    call        dword ptr [ecx+8]
 004930BB    pop         esi
 004930BC    pop         ebx
 004930BD    ret
end;*}

//004930C0
{*procedure TFaceGroup.sub_00466894(?:?);
begin
 004930C0    push        ebp
 004930C1    mov         ebp,esp
 004930C3    push        0
 004930C5    push        ebx
 004930C6    push        esi
 004930C7    push        edi
 004930C8    mov         edi,edx
 004930CA    mov         ebx,eax
 004930CC    xor         eax,eax
 004930CE    push        ebp
 004930CF    push        49313F
 004930D4    push        dword ptr fs:[eax]
 004930D7    mov         dword ptr fs:[eax],esp
 004930DA    mov         edx,edi
 004930DC    mov         eax,ebx
 004930DE    call        TPersistentObject.sub_00466894
 004930E3    mov         eax,edi
 004930E5    mov         edx,dword ptr [eax]
 004930E7    call        dword ptr [edx+0C]
 004930EA    mov         esi,eax
 004930EC    mov         eax,esi
 004930EE    sub         eax,2
>004930F1    jae         00493120
 004930F3    lea         edx,[ebp-4]
 004930F6    mov         eax,edi
 004930F8    mov         ecx,dword ptr [eax]
 004930FA    call        dword ptr [ecx+14]
 004930FD    mov         edx,dword ptr [ebp-4]
 00493100    lea         eax,[ebx+0C];TFaceGroup.?fC:String
 00493103    call        @LStrAsg
 00493108    dec         esi
>00493109    jl          00493117
 0049310B    mov         eax,edi
 0049310D    mov         edx,dword ptr [eax]
 0049310F    call        dword ptr [edx+0C]
 00493112    mov         dword ptr [ebx+14],eax;TFaceGroup.?f14:dword
>00493115    jmp         00493129
 00493117    mov         dword ptr [ebx+14],0FFFFFFFF;TFaceGroup.?f14:dword
>0049311E    jmp         00493129
 00493120    mov         edx,esi
 00493122    mov         eax,ebx
 00493124    call        00466914
 00493129    xor         eax,eax
 0049312B    pop         edx
 0049312C    pop         ecx
 0049312D    pop         ecx
 0049312E    mov         dword ptr fs:[eax],edx
 00493131    push        493146
 00493136    lea         eax,[ebp-4]
 00493139    call        @LStrClr
 0049313E    ret
>0049313F    jmp         @HandleFinally
>00493144    jmp         00493136
 00493146    pop         edi
 00493147    pop         esi
 00493148    pop         ebx
 00493149    pop         ecx
 0049314A    pop         ebp
 0049314B    ret
end;*}

//0049314C
{*procedure sub_0049314C(?:?; ?:?; ?:?);
begin
 0049314C    push        ebx
 0049314D    push        esi
 0049314E    mov         esi,ecx
 00493150    mov         ebx,edx
 00493152    mov         eax,[005AE588];^gvar_005E0CE2
 00493157    cmp         byte ptr [eax],0
>0049315A    je          004931C9
 0049315C    mov         eax,dword ptr [ebx+24]
 0049315F    mov         eax,dword ptr [eax]
 00493161    call        dword ptr [eax+24]
 00493164    cmp         eax,0DE1
>00493169    je          0049317F
 0049316B    mov         ecx,13A8
 00493170    mov         edx,4931D4;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00493175    mov         eax,493218;'Assertion failure'
 0049317A    call        @Assert
 0049317F    push        84C1
 00493184    mov         eax,[005AE62C];^gvar_005E0E88
 00493189    mov         eax,dword ptr [eax]
 0049318B    call        eax
 0049318D    mov         eax,ebx
 0049318F    mov         edx,dword ptr [eax]
 00493191    call        dword ptr [edx+14]
 00493194    push        eax
 00493195    mov         eax,dword ptr [esi+5C]
 00493198    mov         ecx,0DE1
 0049319D    mov         edx,1
 004931A2    call        0046D8B8
 004931A7    push        2100
 004931AC    push        2200
 004931B1    push        2300
 004931B6    call        OpenGL32.glTexEnvi
 004931BB    push        84C0
 004931C0    mov         eax,[005AE62C];^gvar_005E0E88
 004931C5    mov         eax,dword ptr [eax]
 004931C7    call        eax
 004931C9    pop         esi
 004931CA    pop         ebx
 004931CB    ret
end;*}

//0049322C
{*procedure sub_0049322C(?:TFGVertexIndexList; ?:?);
begin
 0049322C    push        ebx
 0049322D    push        esi
 0049322E    push        edi
 0049322F    mov         esi,edx
 00493231    mov         ebx,eax
 00493233    mov         eax,[005AE588];^gvar_005E0CE2
 00493238    cmp         byte ptr [eax],0
>0049323B    je          004932C6
 00493241    cmp         byte ptr [esi+0FA],0
>00493248    jne         004932C6
 0049324A    cmp         dword ptr [esi+4C],0
>0049324E    je          004932C6
 00493250    mov         eax,dword ptr [ebx+8]
 00493253    mov         eax,dword ptr [eax+18]
 00493256    mov         ecx,dword ptr [eax+30]
 00493259    mov         edx,dword ptr [ebx+14]
 0049325C    cmp         ecx,edx
>0049325E    je          004932C6
 00493260    mov         dword ptr [eax+30],edx
 00493263    mov         edi,dword ptr [ebx+14]
 00493266    test        edi,edi
>00493268    jl          004932BF
 0049326A    mov         eax,dword ptr [esi+4C]
 0049326D    mov         eax,dword ptr [eax+34]
 00493270    call        TCollection.GetCount
 00493275    cmp         edi,eax
>00493277    jl          0049328D
 00493279    mov         ecx,13BE
 0049327E    mov         edx,4932D4;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00493283    mov         eax,493318;'Assertion failure'
 00493288    call        @Assert
 0049328D    mov         eax,dword ptr [esi+4C]
 00493290    mov         eax,dword ptr [eax+34]
 00493293    mov         edx,dword ptr [ebx+14]
 00493296    call        00477604
 0049329B    mov         edi,eax
 0049329D    mov         eax,dword ptr [edi+18]
 004932A0    call        TGLMaterial.GetTexture
 004932A5    mov         edx,eax
 004932A7    mov         ecx,esi
 004932A9    mov         eax,ebx
 004932AB    call        0049314C
 004932B0    mov         edx,esi
 004932B2    mov         eax,dword ptr [ebx+8]
 004932B5    mov         eax,dword ptr [eax+18]
 004932B8    call        00491824
>004932BD    jmp         004932C6
 004932BF    mov         edx,esi
 004932C1    call        004918E8
 004932C6    pop         edi
 004932C7    pop         esi
 004932C8    pop         ebx
 004932C9    ret
end;*}

//0049332C
{*procedure sub_0049332C(?:?; ?:?);
begin
 0049332C    push        ebx
 0049332D    push        esi
 0049332E    mov         esi,edx
 00493330    mov         ebx,eax
 00493332    cmp         dword ptr [ebx+0C],0
>00493336    je          0049334D
 00493338    test        esi,esi
>0049333A    je          0049334D
 0049333C    mov         edx,dword ptr [ebx+0C]
 0049333F    mov         eax,dword ptr [esi+34]
 00493342    call        004776DC
 00493347    mov         dword ptr [ebx+10],eax
 0049334A    pop         esi
 0049334B    pop         ebx
 0049334C    ret
 0049334D    xor         eax,eax
 0049334F    mov         dword ptr [ebx+10],eax
 00493352    pop         esi
 00493353    pop         ebx
 00493354    ret
end;*}

//00493358
{*procedure sub_00493358(?:?);
begin
 00493358    xor         edx,edx
 0049335A    mov         dword ptr [eax+10],edx
 0049335D    ret
end;*}

//00493360
procedure TFaceGroup.sub_00493360;
begin
{*
 00493360    push        ebp
 00493361    mov         ebp,esp
 00493363    pop         ebp
 00493364    ret         4
*}
end;

//00493368
procedure TFaceGroup.sub_00493368;
begin
{*
 00493368    ret
*}
end;

//0049336C
procedure TFaceGroup.sub_0049336C;
begin
{*
 0049336C    ret
*}
end;

//00493370
constructor sub_00493370;
begin
{*
 00493370    push        ebx
 00493371    push        esi
 00493372    test        dl,dl
>00493374    je          0049337E
 00493376    add         esp,0FFFFFFF0
 00493379    call        @ClassCreate
 0049337E    mov         ebx,edx
 00493380    mov         esi,eax
 00493382    xor         edx,edx
 00493384    mov         eax,esi
 00493386    call        004666E0
 0049338B    mov         dl,1
 0049338D    mov         eax,[00467C18];TIntegerList
 00493392    call        TIntegerList.Create;TIntegerList.Create
 00493397    mov         dword ptr [esi+1C],eax;TFGVertexIndexList.?f1C:TIntegerList
 0049339A    mov         byte ptr [esi+20],0;TFGVertexIndexList.?f20:byte
 0049339E    mov         eax,esi
 004933A0    test        bl,bl
>004933A2    je          004933B3
 004933A4    call        @AfterConstruction
 004933A9    pop         dword ptr fs:[0]
 004933B0    add         esp,0C
 004933B3    mov         eax,esi
 004933B5    pop         esi
 004933B6    pop         ebx
 004933B7    ret
*}
end;

//004933B8
destructor TFGVertexIndexList.Destroy;
begin
{*
 004933B8    push        ebx
 004933B9    push        esi
 004933BA    call        @BeforeDestruction
 004933BF    mov         ebx,edx
 004933C1    mov         esi,eax
 004933C3    mov         eax,dword ptr [esi+1C];TFGVertexIndexList.?f1C:TIntegerList
 004933C6    call        TObject.Free
 004933CB    mov         edx,ebx
 004933CD    and         dl,0FC
 004933D0    mov         eax,esi
 004933D2    call        TFaceGroup.Destroy
 004933D7    test        bl,bl
>004933D9    jle         004933E2
 004933DB    mov         eax,esi
 004933DD    call        @ClassDestroy
 004933E2    pop         esi
 004933E3    pop         ebx
 004933E4    ret
*}
end;

//004933E8
{*procedure TFGVertexIndexList.sub_00466814(?:?);
begin
 004933E8    push        ebx
 004933E9    push        esi
 004933EA    push        edi
 004933EB    mov         edi,edx
 004933ED    mov         ebx,eax
 004933EF    mov         edx,edi
 004933F1    mov         eax,ebx
 004933F3    call        TFaceGroup.sub_00466814
 004933F8    xor         edx,edx
 004933FA    mov         eax,edi
 004933FC    mov         ecx,dword ptr [eax]
 004933FE    call        dword ptr [ecx+8]
 00493401    mov         edx,edi
 00493403    mov         eax,dword ptr [ebx+1C];TFGVertexIndexList.?f1C:TIntegerList
 00493406    mov         si,0FFFC
 0049340A    call        @CallDynaInst;TBaseList.sub_00466814
 0049340F    xor         edx,edx
 00493411    mov         dl,byte ptr [ebx+20];TFGVertexIndexList.?f20:byte
 00493414    mov         eax,edi
 00493416    mov         ecx,dword ptr [eax]
 00493418    call        dword ptr [ecx+8]
 0049341B    pop         edi
 0049341C    pop         esi
 0049341D    pop         ebx
 0049341E    ret
end;*}

//00493420
{*procedure TFGVertexIndexList.sub_00466894(?:?);
begin
 00493420    push        ebx
 00493421    push        esi
 00493422    push        edi
 00493423    mov         edi,edx
 00493425    mov         ebx,eax
 00493427    mov         edx,edi
 00493429    mov         eax,ebx
 0049342B    call        TFaceGroup.sub_00466894
 00493430    mov         eax,edi
 00493432    mov         edx,dword ptr [eax]
 00493434    call        dword ptr [edx+0C]
 00493437    test        eax,eax
>00493439    jne         00493455
 0049343B    mov         edx,edi
 0049343D    mov         eax,dword ptr [ebx+1C];TFGVertexIndexList.?f1C:TIntegerList
 00493440    mov         si,0FFFB
 00493444    call        @CallDynaInst;TBaseList.sub_00466894
 00493449    mov         eax,edi
 0049344B    mov         edx,dword ptr [eax]
 0049344D    call        dword ptr [edx+0C]
 00493450    mov         byte ptr [ebx+20],al;TFGVertexIndexList.?f20:byte
>00493453    jmp         0049345E
 00493455    mov         edx,eax
 00493457    mov         eax,ebx
 00493459    call        00466914
 0049345E    pop         edi
 0049345F    pop         esi
 00493460    pop         ebx
 00493461    ret
end;*}

//00493464
{*procedure sub_00493464(?:?);
begin
 00493464    push        ebx
 00493465    push        esi
 00493466    mov         esi,edx
 00493468    mov         ebx,eax
 0049346A    mov         eax,dword ptr [ebx+1C];TFGVertexIndexList.?f1C:TIntegerList
 0049346D    cmp         dword ptr [eax+8],0;TIntegerList.?f8:dword
>00493471    je          004934AD
 00493473    mov         edx,esi
 00493475    mov         eax,dword ptr [ebx+8];TFGVertexIndexList.?f8:dword
 00493478    mov         eax,dword ptr [eax+18]
 0049347B    xor         ecx,ecx
 0049347D    call        004914A0
 00493482    mov         edx,esi
 00493484    mov         eax,ebx
 00493486    call        0049322C
 0049348B    mov         eax,dword ptr [ebx+1C];TFGVertexIndexList.?f1C:TIntegerList
 0049348E    mov         edx,dword ptr [eax+24];TIntegerList.?f24:dword
 00493491    push        edx
 00493492    push        1405
 00493497    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 0049349A    push        eax
 0049349B    xor         eax,eax
 0049349D    mov         al,byte ptr [ebx+20];TFGVertexIndexList.?f20:byte
 004934A0    mov         eax,dword ptr [eax*4+5AD718]
 004934A7    push        eax
 004934A8    call        OpenGL32.glDrawElements
 004934AD    pop         esi
 004934AE    pop         ebx
 004934AF    ret
end;*}

//004934B0
{*procedure sub_004934B0(?:TFGVertexIndexList; ?:?; ?:?; ?:?);
begin
 004934B0    push        ebp
 004934B1    mov         ebp,esp
 004934B3    add         esp,0FFFFFFD0
 004934B6    push        ebx
 004934B7    push        esi
 004934B8    push        edi
 004934B9    mov         dword ptr [ebp-4],ecx
 004934BC    mov         edi,edx
 004934BE    mov         esi,eax
 004934C0    mov         ebx,dword ptr [ebp+8]
 004934C3    cmp         dword ptr [ebp-4],0
>004934C7    je          0049374E
 004934CD    mov         ecx,dword ptr [ebx+8]
 004934D0    cmp         ecx,3
>004934D3    jl          0049374E
 004934D9    xor         eax,eax
 004934DB    mov         al,byte ptr [esi+20]
 004934DE    cmp         eax,4
>004934E1    ja          0049373A
 004934E7    jmp         dword ptr [eax*4+4934EE]
 004934E7    dd          00493502
 004934E7    dd          00493577
 004934E7    dd          00493502
 004934E7    dd          004935A9
 004934E7    dd          00493647
 00493502    mov         eax,ecx
 00493504    mov         ecx,3
 00493509    cdq
 0049350A    idiv        eax,ecx
 0049350C    lea         eax,[eax+eax*2]
 0049350F    mov         dword ptr [ebp-8],eax
 00493512    cmp         dword ptr [edi+8],0
>00493516    jle         00493561
 00493518    mov         eax,dword ptr [ebp-4]
 0049351B    mov         edx,dword ptr [eax+8]
 0049351E    add         edx,dword ptr [ebp-8]
 00493521    mov         eax,dword ptr [ebp-4]
 00493524    call        0046824C
 00493529    mov         eax,dword ptr [ebp-8]
 0049352C    dec         eax
 0049352D    test        eax,eax
>0049352F    jl          0049374E
 00493535    inc         eax
 00493536    mov         dword ptr [ebp-0C],eax
 00493539    xor         esi,esi
 0049353B    lea         ecx,[ebp-18]
 0049353E    mov         eax,dword ptr [ebx+24]
 00493541    mov         edx,dword ptr [eax+esi*4]
 00493544    mov         eax,edi
 00493546    call        00468C18
 0049354B    lea         edx,[ebp-18]
 0049354E    mov         eax,dword ptr [ebp-4]
 00493551    call        00468A90
 00493556    inc         esi
 00493557    dec         dword ptr [ebp-0C]
>0049355A    jne         0049353B
>0049355C    jmp         0049374E
 00493561    mov         eax,dword ptr [ebp-4]
 00493564    mov         edx,dword ptr [eax+8]
 00493567    add         edx,dword ptr [ebp-8]
 0049356A    mov         eax,dword ptr [ebp-4]
 0049356D    call        00468208
>00493572    jmp         0049374E
 00493577    cmp         dword ptr [edi+8],0
>0049357B    jle         0049358E
 0049357D    mov         ecx,dword ptr [ebp-4]
 00493580    mov         edx,ebx
 00493582    mov         eax,edi
 00493584    call        0048C0D0
>00493589    jmp         0049374E
 0049358E    mov         eax,dword ptr [ebp-4]
 00493591    mov         edx,dword ptr [eax+8]
 00493594    sub         ecx,2
 00493597    lea         eax,[ecx+ecx*2]
 0049359A    add         edx,eax
 0049359C    mov         eax,dword ptr [ebp-4]
 0049359F    call        00468208
>004935A4    jmp         0049374E
 004935A9    sub         ecx,2
 004935AC    lea         eax,[ecx+ecx*2]
 004935AF    mov         dword ptr [ebp-8],eax
 004935B2    cmp         dword ptr [edi+8],0
>004935B6    jle         00493631
 004935B8    mov         eax,dword ptr [ebp-4]
 004935BB    mov         edx,dword ptr [eax+8]
 004935BE    add         edx,dword ptr [ebp-8]
 004935C1    mov         eax,dword ptr [ebp-4]
 004935C4    call        0046824C
 004935C9    mov         eax,dword ptr [esi+1C]
 004935CC    mov         eax,dword ptr [eax+8]
 004935CF    dec         eax
 004935D0    sub         eax,2
>004935D3    jl          0049374E
 004935D9    inc         eax
 004935DA    mov         dword ptr [ebp-0C],eax
 004935DD    mov         esi,2
 004935E2    lea         ecx,[ebp-18]
 004935E5    mov         eax,dword ptr [ebx+24]
 004935E8    mov         edx,dword ptr [eax+esi*4]
 004935EB    mov         eax,edi
 004935ED    call        00468C18
 004935F2    lea         eax,[ebp-18]
 004935F5    push        eax
 004935F6    lea         ecx,[ebp-24]
 004935F9    mov         eax,dword ptr [ebx+24]
 004935FC    mov         edx,dword ptr [eax+esi*4-4]
 00493600    mov         eax,edi
 00493602    call        00468C18
 00493607    lea         eax,[ebp-24]
 0049360A    push        eax
 0049360B    lea         ecx,[ebp-30]
 0049360E    mov         eax,dword ptr [ebx+24]
 00493611    mov         edx,dword ptr [eax]
 00493613    mov         eax,edi
 00493615    call        00468C18
 0049361A    lea         edx,[ebp-30]
 0049361D    mov         eax,dword ptr [ebp-4]
 00493620    pop         ecx
 00493621    call        00468AD0
 00493626    inc         esi
 00493627    dec         dword ptr [ebp-0C]
>0049362A    jne         004935E2
>0049362C    jmp         0049374E
 00493631    mov         eax,dword ptr [ebp-4]
 00493634    mov         edx,dword ptr [eax+8]
 00493637    add         edx,dword ptr [ebp-8]
 0049363A    mov         eax,dword ptr [ebp-4]
 0049363D    call        00468208
>00493642    jmp         0049374E
 00493647    test        ecx,ecx
>00493649    jns         0049364E
 0049364B    add         ecx,3
 0049364E    sar         ecx,2
 00493651    mov         dword ptr [ebp-8],ecx
 00493654    cmp         dword ptr [edi+8],0
>00493658    jle         00493720
 0049365E    mov         eax,dword ptr [ebp-4]
 00493661    mov         edx,dword ptr [eax+8]
 00493664    mov         eax,dword ptr [ebp-8]
 00493667    add         eax,eax
 00493669    lea         eax,[eax+eax*2]
 0049366C    add         edx,eax
 0049366E    mov         eax,dword ptr [ebp-4]
 00493671    call        0046824C
 00493676    xor         esi,esi
 00493678    cmp         dword ptr [ebp-8],0
>0049367C    jle         0049374E
 00493682    lea         ecx,[ebp-18]
 00493685    mov         eax,dword ptr [ebx+24]
 00493688    mov         edx,dword ptr [eax+esi*4+8]
 0049368C    mov         eax,edi
 0049368E    call        00468C18
 00493693    lea         eax,[ebp-18]
 00493696    push        eax
 00493697    lea         ecx,[ebp-24]
 0049369A    mov         eax,dword ptr [ebx+24]
 0049369D    mov         edx,dword ptr [eax+esi*4+4]
 004936A1    mov         eax,edi
 004936A3    call        00468C18
 004936A8    lea         eax,[ebp-24]
 004936AB    push        eax
 004936AC    lea         ecx,[ebp-30]
 004936AF    mov         eax,dword ptr [ebx+24]
 004936B2    mov         edx,dword ptr [eax+esi*4]
 004936B5    mov         eax,edi
 004936B7    call        00468C18
 004936BC    lea         edx,[ebp-30]
 004936BF    mov         eax,dword ptr [ebp-4]
 004936C2    pop         ecx
 004936C3    call        00468AD0
 004936C8    lea         ecx,[ebp-18]
 004936CB    mov         eax,dword ptr [ebx+24]
 004936CE    mov         edx,dword ptr [eax+esi*4+0C]
 004936D2    mov         eax,edi
 004936D4    call        00468C18
 004936D9    lea         eax,[ebp-18]
 004936DC    push        eax
 004936DD    lea         ecx,[ebp-24]
 004936E0    mov         eax,dword ptr [ebx+24]
 004936E3    mov         edx,dword ptr [eax+esi*4+8]
 004936E7    mov         eax,edi
 004936E9    call        00468C18
 004936EE    lea         eax,[ebp-24]
 004936F1    push        eax
 004936F2    lea         ecx,[ebp-30]
 004936F5    mov         eax,dword ptr [ebx+24]
 004936F8    mov         edx,dword ptr [eax+esi*4]
 004936FB    mov         eax,edi
 004936FD    call        00468C18
 00493702    lea         edx,[ebp-30]
 00493705    mov         eax,dword ptr [ebp-4]
 00493708    pop         ecx
 00493709    call        00468AD0
 0049370E    add         esi,4
 00493711    dec         dword ptr [ebp-8]
 00493714    cmp         dword ptr [ebp-8],0
>00493718    jg          00493682
>0049371E    jmp         0049374E
 00493720    mov         eax,dword ptr [ebp-4]
 00493723    mov         edx,dword ptr [eax+8]
 00493726    mov         eax,dword ptr [ebp-8]
 00493729    add         eax,eax
 0049372B    lea         eax,[eax+eax*2]
 0049372E    add         edx,eax
 00493730    mov         eax,dword ptr [ebp-4]
 00493733    call        00468208
>00493738    jmp         0049374E
 0049373A    mov         ecx,146B
 0049373F    mov         edx,493760;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00493744    mov         eax,4937A4;'Assertion failure'
 00493749    call        @Assert
 0049374E    pop         edi
 0049374F    pop         esi
 00493750    pop         ebx
 00493751    mov         esp,ebp
 00493753    pop         ebp
 00493754    ret         4
end;*}

//004937B8
{*procedure TFGVertexIndexList.sub_00493360(?:?; ?:?; ?:?);
begin
 004937B8    push        ebp
 004937B9    mov         ebp,esp
 004937BB    push        ecx
 004937BC    push        ebx
 004937BD    push        esi
 004937BE    mov         dword ptr [ebp-4],ecx
 004937C1    mov         ebx,eax
 004937C3    mov         eax,dword ptr [ebx+8];TFGVertexIndexList.?f8:dword
 004937C6    mov         esi,dword ptr [eax+18]
 004937C9    mov         eax,dword ptr [ebx+1C];TFGVertexIndexList.?f1C:TIntegerList
 004937CC    push        eax
 004937CD    mov         ecx,edx
 004937CF    mov         eax,ebx
 004937D1    mov         edx,dword ptr [esi+0C]
 004937D4    call        004934B0
 004937D9    mov         eax,dword ptr [ebx+1C];TFGVertexIndexList.?f1C:TIntegerList
 004937DC    push        eax
 004937DD    mov         ecx,dword ptr [ebp-4]
 004937E0    mov         edx,dword ptr [esi+1C]
 004937E3    mov         eax,ebx
 004937E5    call        004934B0
 004937EA    mov         eax,dword ptr [ebx+1C];TFGVertexIndexList.?f1C:TIntegerList
 004937ED    push        eax
 004937EE    mov         ecx,dword ptr [ebp+8]
 004937F1    mov         edx,dword ptr [esi+10]
 004937F4    mov         eax,ebx
 004937F6    call        004934B0
 004937FB    pop         esi
 004937FC    pop         ebx
 004937FD    pop         ecx
 004937FE    pop         ebp
 004937FF    ret         4
end;*}

//00493804
procedure TFGVertexIndexList.sub_00493804;
begin
{*
 00493804    push        ebx
 00493805    mov         ecx,eax
 00493807    xor         eax,eax
 00493809    mov         al,byte ptr [ecx+20];TFGVertexIndexList.?f20:byte
 0049380C    cmp         eax,4
>0049380F    ja          0049385E
 00493811    jmp         dword ptr [eax*4+493818]
 00493811    dd          0049382C
 00493811    dd          0049383E
 00493811    dd          0049382C
 00493811    dd          0049383E
 00493811    dd          0049384F
 0049382C    mov         eax,dword ptr [ecx+1C];TFGVertexIndexList.?f1C:TIntegerList
 0049382F    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 00493832    mov         ecx,3
 00493837    cdq
 00493838    idiv        eax,ecx
 0049383A    mov         ebx,eax
>0049383C    jmp         00493874
 0049383E    mov         eax,dword ptr [ecx+1C];TFGVertexIndexList.?f1C:TIntegerList
 00493841    mov         ebx,dword ptr [eax+8];TIntegerList.?f8:dword
 00493844    sub         ebx,2
 00493847    test        ebx,ebx
>00493849    jge         00493874
 0049384B    xor         ebx,ebx
>0049384D    jmp         00493874
 0049384F    mov         eax,dword ptr [ecx+1C];TFGVertexIndexList.?f1C:TIntegerList
 00493852    mov         ebx,dword ptr [eax+8];TIntegerList.?f8:dword
 00493855    sar         ebx,1
>00493857    jns         00493874
 00493859    adc         ebx,0
>0049385C    jmp         00493874
 0049385E    xor         ebx,ebx
 00493860    mov         ecx,148C
 00493865    mov         edx,493880;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 0049386A    mov         eax,4938C4;'Assertion failure'
 0049386F    call        @Assert
 00493874    mov         eax,ebx
 00493876    pop         ebx
 00493877    ret
*}
end;

//004938D8
procedure TFGVertexIndexList.sub_00493368;
begin
{*
 004938D8    mov         eax,dword ptr [eax+1C];TFGVertexIndexList.?f1C:TIntegerList
 004938DB    call        00468318
 004938E0    ret
*}
end;

//004938E4
procedure sub_004938E4(?:TFGVertexIndexList);
begin
{*
 004938E4    mov         eax,dword ptr [eax+1C]
 004938E7    call        004691B4
 004938EC    ret
*}
end;

//004938F0
constructor sub_004938F0;
begin
{*
 004938F0    push        ebx
 004938F1    push        esi
 004938F2    test        dl,dl
>004938F4    je          004938FE
 004938F6    add         esp,0FFFFFFF0
 004938F9    call        @ClassCreate
 004938FE    mov         ebx,edx
 00493900    mov         esi,eax
 00493902    xor         edx,edx
 00493904    mov         eax,esi
 00493906    call        00493370
 0049390B    mov         dl,1
 0049390D    mov         eax,[00467C18];TIntegerList
 00493912    call        TIntegerList.Create;TIntegerList.Create
 00493917    mov         dword ptr [esi+24],eax;TFGVertexNormalTexIndexList.?f24:TIntegerList
 0049391A    mov         dl,1
 0049391C    mov         eax,[00467C18];TIntegerList
 00493921    call        TIntegerList.Create;TIntegerList.Create
 00493926    mov         dword ptr [esi+28],eax;TFGVertexNormalTexIndexList.?f28:TIntegerList
 00493929    mov         eax,esi
 0049392B    test        bl,bl
>0049392D    je          0049393E
 0049392F    call        @AfterConstruction
 00493934    pop         dword ptr fs:[0]
 0049393B    add         esp,0C
 0049393E    mov         eax,esi
 00493940    pop         esi
 00493941    pop         ebx
 00493942    ret
*}
end;

//00493944
destructor TFGVertexNormalTexIndexList.Destroy;
begin
{*
 00493944    push        ebx
 00493945    push        esi
 00493946    call        @BeforeDestruction
 0049394B    mov         ebx,edx
 0049394D    mov         esi,eax
 0049394F    mov         eax,dword ptr [esi+28];TFGVertexNormalTexIndexList.?f28:TIntegerList
 00493952    call        TObject.Free
 00493957    mov         eax,dword ptr [esi+24];TFGVertexNormalTexIndexList.?f24:TIntegerList
 0049395A    call        TObject.Free
 0049395F    mov         edx,ebx
 00493961    and         dl,0FC
 00493964    mov         eax,esi
 00493966    call        TFGVertexIndexList.Destroy
 0049396B    test        bl,bl
>0049396D    jle         00493976
 0049396F    mov         eax,esi
 00493971    call        @ClassDestroy
 00493976    pop         esi
 00493977    pop         ebx
 00493978    ret
*}
end;

//0049397C
{*procedure TFGVertexNormalTexIndexList.sub_00466814(?:?);
begin
 0049397C    push        ebx
 0049397D    push        esi
 0049397E    push        edi
 0049397F    mov         edi,edx
 00493981    mov         ebx,eax
 00493983    mov         edx,edi
 00493985    mov         eax,ebx
 00493987    call        TFGVertexIndexList.sub_00466814
 0049398C    xor         edx,edx
 0049398E    mov         eax,edi
 00493990    mov         ecx,dword ptr [eax]
 00493992    call        dword ptr [ecx+8]
 00493995    mov         edx,edi
 00493997    mov         eax,dword ptr [ebx+24];TFGVertexNormalTexIndexList.?f24:TIntegerList
 0049399A    mov         si,0FFFC
 0049399E    call        @CallDynaInst;TBaseList.sub_00466814
 004939A3    mov         edx,edi
 004939A5    mov         eax,dword ptr [ebx+28];TFGVertexNormalTexIndexList.?f28:TIntegerList
 004939A8    mov         si,0FFFC
 004939AC    call        @CallDynaInst;TBaseList.sub_00466814
 004939B1    pop         edi
 004939B2    pop         esi
 004939B3    pop         ebx
 004939B4    ret
end;*}

//004939B8
{*procedure TFGVertexNormalTexIndexList.sub_00466894(?:?);
begin
 004939B8    push        ebx
 004939B9    push        esi
 004939BA    push        edi
 004939BB    mov         edi,edx
 004939BD    mov         ebx,eax
 004939BF    mov         edx,edi
 004939C1    mov         eax,ebx
 004939C3    call        TFGVertexIndexList.sub_00466894
 004939C8    mov         eax,edi
 004939CA    mov         edx,dword ptr [eax]
 004939CC    call        dword ptr [edx+0C]
 004939CF    test        eax,eax
>004939D1    jne         004939F1
 004939D3    mov         edx,edi
 004939D5    mov         eax,dword ptr [ebx+24];TFGVertexNormalTexIndexList.?f24:TIntegerList
 004939D8    mov         si,0FFFB
 004939DC    call        @CallDynaInst;TBaseList.sub_00466894
 004939E1    mov         edx,edi
 004939E3    mov         eax,dword ptr [ebx+28];TFGVertexNormalTexIndexList.?f28:TIntegerList
 004939E6    mov         si,0FFFB
 004939EA    call        @CallDynaInst;TBaseList.sub_00466894
>004939EF    jmp         004939FA
 004939F1    mov         edx,eax
 004939F3    mov         eax,ebx
 004939F5    call        00466914
 004939FA    pop         edi
 004939FB    pop         esi
 004939FC    pop         ebx
 004939FD    ret
end;*}

//00493A00
procedure sub_00493A00;
begin
{*
 00493A00    push        ebx
 00493A01    push        esi
 00493A02    push        edi
 00493A03    push        ebp
 00493A04    add         esp,0FFFFFFF0
 00493A07    mov         ebx,eax
 00493A09    mov         eax,dword ptr [ebx+28];TFGVertexNormalTexIndexList.?f28:TIntegerList
 00493A0C    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 00493A0F    test        eax,eax
>00493A11    je          00493A1B
 00493A13    mov         ecx,dword ptr [ebx+1C];TFGVertexNormalTexIndexList.?f1C:TIntegerList
 00493A16    cmp         eax,dword ptr [ecx+8];TIntegerList.?f8:dword
>00493A19    jl          00493A2D
 00493A1B    mov         eax,dword ptr [ebx+24];TFGVertexNormalTexIndexList.?f24:TIntegerList
 00493A1E    mov         edx,dword ptr [eax+8];TIntegerList.?f8:dword
 00493A21    test        edx,edx
>00493A23    je          00493A41
 00493A25    mov         eax,dword ptr [ebx+1C];TFGVertexNormalTexIndexList.?f1C:TIntegerList
 00493A28    cmp         edx,dword ptr [eax+8];TIntegerList.?f8:dword
>00493A2B    jge         00493A41
 00493A2D    mov         ecx,152B
 00493A32    mov         edx,493B78;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00493A37    mov         eax,493BBC;'Assertion failure'
 00493A3C    call        @Assert
 00493A41    mov         eax,dword ptr [ebx+8];TFGVertexNormalTexIndexList.?f8:dword
 00493A44    mov         eax,dword ptr [eax+18]
 00493A47    mov         edx,dword ptr [eax+0C]
 00493A4A    mov         edx,dword ptr [edx+24]
 00493A4D    mov         dword ptr [esp],edx
 00493A50    mov         edx,dword ptr [eax+10]
 00493A53    mov         edx,dword ptr [edx+24]
 00493A56    mov         dword ptr [esp+4],edx
 00493A5A    mov         eax,dword ptr [eax+1C]
 00493A5D    mov         eax,dword ptr [eax+24]
 00493A60    mov         dword ptr [esp+8],eax
 00493A64    mov         al,byte ptr [ebx+20];TFGVertexNormalTexIndexList.?f20:byte
 00493A67    sub         al,1
>00493A69    jb          00493A77
>00493A6B    je          00493A80
 00493A6D    dec         al
>00493A6F    je          00493A77
 00493A71    dec         al
>00493A73    je          00493A89
>00493A75    jmp         00493A92
 00493A77    push        4
 00493A79    call        OpenGL32.glBegin
>00493A7E    jmp         00493AA6
 00493A80    push        5
 00493A82    call        OpenGL32.glBegin
>00493A87    jmp         00493AA6
 00493A89    push        6
 00493A8B    call        OpenGL32.glBegin
>00493A90    jmp         00493AA6
 00493A92    mov         ecx,1534
 00493A97    mov         edx,493B78;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00493A9C    mov         eax,493BBC;'Assertion failure'
 00493AA1    call        @Assert
 00493AA6    mov         eax,dword ptr [ebx+1C];TFGVertexNormalTexIndexList.?f1C:TIntegerList
 00493AA9    mov         edi,dword ptr [eax+24];TIntegerList.?f24:dword
 00493AAC    mov         edx,dword ptr [ebx+24];TFGVertexNormalTexIndexList.?f24:TIntegerList
 00493AAF    cmp         dword ptr [edx+8],0;TIntegerList.?f8:dword
>00493AB3    jle         00493ABA
 00493AB5    mov         ebp,dword ptr [edx+24];TIntegerList.?f24:dword
>00493AB8    jmp         00493ABC
 00493ABA    mov         ebp,edi
 00493ABC    mov         edx,dword ptr [ebx+28];TFGVertexNormalTexIndexList.?f28:TIntegerList
 00493ABF    cmp         dword ptr [edx+8],0;TIntegerList.?f8:dword
>00493AC3    jle         00493ACE
 00493AC5    mov         edx,dword ptr [edx+24];TIntegerList.?f24:dword
 00493AC8    mov         dword ptr [esp+0C],edx
>00493ACC    jmp         00493AD2
 00493ACE    mov         dword ptr [esp+0C],edi
 00493AD2    cmp         dword ptr [esp+8],0
>00493AD7    je          00493B2B
 00493AD9    mov         esi,dword ptr [eax+8];TIntegerList.?f8:dword
 00493ADC    dec         esi
 00493ADD    test        esi,esi
>00493ADF    jl          00493B60
 00493AE1    inc         esi
 00493AE2    xor         ebx,ebx
 00493AE4    mov         eax,dword ptr [ebp+ebx*4]
 00493AE8    lea         eax,[eax+eax*2]
 00493AEB    mov         edx,dword ptr [esp+4]
 00493AEF    lea         eax,[edx+eax*4]
 00493AF2    push        eax
 00493AF3    call        OpenGL32.glNormal3fv
 00493AF8    mov         eax,dword ptr [esp+0C]
 00493AFC    mov         eax,dword ptr [eax+ebx*4]
 00493AFF    lea         eax,[eax+eax*2]
 00493B02    mov         edx,dword ptr [esp+8]
 00493B06    lea         eax,[edx+eax*4]
 00493B09    push        eax
 00493B0A    mov         eax,[005AE39C];^gvar_005E1348
 00493B0F    mov         eax,dword ptr [eax]
 00493B11    call        eax
 00493B13    mov         eax,dword ptr [edi+ebx*4]
 00493B16    lea         eax,[eax+eax*2]
 00493B19    mov         edx,dword ptr [esp]
 00493B1C    lea         eax,[edx+eax*4]
 00493B1F    push        eax
 00493B20    call        OpenGL32.glVertex3fv
 00493B25    inc         ebx
 00493B26    dec         esi
>00493B27    jne         00493AE4
>00493B29    jmp         00493B60
 00493B2B    mov         esi,dword ptr [eax+8];TIntegerList.?f8:dword
 00493B2E    dec         esi
 00493B2F    test        esi,esi
>00493B31    jl          00493B60
 00493B33    inc         esi
 00493B34    xor         ebx,ebx
 00493B36    mov         eax,dword ptr [ebp+ebx*4]
 00493B3A    lea         eax,[eax+eax*2]
 00493B3D    mov         edx,dword ptr [esp+4]
 00493B41    lea         eax,[edx+eax*4]
 00493B44    push        eax
 00493B45    call        OpenGL32.glNormal3fv
 00493B4A    mov         eax,dword ptr [edi+ebx*4]
 00493B4D    lea         eax,[eax+eax*2]
 00493B50    mov         edx,dword ptr [esp]
 00493B53    lea         eax,[edx+eax*4]
 00493B56    push        eax
 00493B57    call        OpenGL32.glVertex3fv
 00493B5C    inc         ebx
 00493B5D    dec         esi
>00493B5E    jne         00493B36
 00493B60    call        OpenGL32.glEnd
 00493B65    add         esp,10
 00493B68    pop         ebp
 00493B69    pop         edi
 00493B6A    pop         esi
 00493B6B    pop         ebx
 00493B6C    ret
*}
end;

//00493BD0
{*procedure TFGVertexNormalTexIndexList.sub_00493360(?:?; ?:?; ?:?);
begin
 00493BD0    push        ebp
 00493BD1    mov         ebp,esp
 00493BD3    push        ebx
 00493BD4    push        esi
 00493BD5    mov         esi,ecx
 00493BD7    mov         ebx,eax
 00493BD9    mov         eax,dword ptr [ebx+1C];TFGVertexNormalTexIndexList.?f1C:TIntegerList
 00493BDC    push        eax
 00493BDD    mov         eax,dword ptr [ebx+8];TFGVertexNormalTexIndexList.?f8:dword
 00493BE0    mov         eax,dword ptr [eax+18]
 00493BE3    mov         eax,dword ptr [eax+0C]
 00493BE6    mov         ecx,edx
 00493BE8    mov         edx,ebx
 00493BEA    xchg        eax,edx
 00493BEB    call        004934B0
 00493BF0    mov         eax,dword ptr [ebx+28];TFGVertexNormalTexIndexList.?f28:TIntegerList
 00493BF3    push        eax
 00493BF4    mov         eax,dword ptr [ebx+8];TFGVertexNormalTexIndexList.?f8:dword
 00493BF7    mov         eax,dword ptr [eax+18]
 00493BFA    mov         edx,dword ptr [eax+1C]
 00493BFD    mov         ecx,esi
 00493BFF    mov         eax,ebx
 00493C01    call        004934B0
 00493C06    mov         eax,dword ptr [ebx+24];TFGVertexNormalTexIndexList.?f24:TIntegerList
 00493C09    push        eax
 00493C0A    mov         eax,dword ptr [ebx+8];TFGVertexNormalTexIndexList.?f8:dword
 00493C0D    mov         eax,dword ptr [eax+18]
 00493C10    mov         edx,dword ptr [eax+10]
 00493C13    mov         ecx,dword ptr [ebp+8]
 00493C16    mov         eax,ebx
 00493C18    call        004934B0
 00493C1D    pop         esi
 00493C1E    pop         ebx
 00493C1F    pop         ebp
 00493C20    ret         4
end;*}

//00493C24
constructor sub_00493C24;
begin
{*
 00493C24    push        ebx
 00493C25    push        esi
 00493C26    test        dl,dl
>00493C28    je          00493C32
 00493C2A    add         esp,0FFFFFFF0
 00493C2D    call        @ClassCreate
 00493C32    mov         ebx,edx
 00493C34    mov         esi,eax
 00493C36    xor         edx,edx
 00493C38    mov         eax,esi
 00493C3A    call        00493370
 00493C3F    mov         dl,1
 00493C41    mov         eax,[00467A00];TAffineVectorList
 00493C46    call        TAffineVectorList.Create;TAffineVectorList.Create
 00493C4B    mov         dword ptr [esi+24],eax;TFGIndexTexCoordList.?f24:TAffineVectorList
 00493C4E    mov         eax,esi
 00493C50    test        bl,bl
>00493C52    je          00493C63
 00493C54    call        @AfterConstruction
 00493C59    pop         dword ptr fs:[0]
 00493C60    add         esp,0C
 00493C63    mov         eax,esi
 00493C65    pop         esi
 00493C66    pop         ebx
 00493C67    ret
*}
end;

//00493C68
destructor TFGIndexTexCoordList.Destroy;
begin
{*
 00493C68    push        ebx
 00493C69    push        esi
 00493C6A    call        @BeforeDestruction
 00493C6F    mov         ebx,edx
 00493C71    mov         esi,eax
 00493C73    mov         eax,dword ptr [esi+24];TFGIndexTexCoordList.?f24:TAffineVectorList
 00493C76    call        TObject.Free
 00493C7B    mov         edx,ebx
 00493C7D    and         dl,0FC
 00493C80    mov         eax,esi
 00493C82    call        TFGVertexIndexList.Destroy
 00493C87    test        bl,bl
>00493C89    jle         00493C92
 00493C8B    mov         eax,esi
 00493C8D    call        @ClassDestroy
 00493C92    pop         esi
 00493C93    pop         ebx
 00493C94    ret
*}
end;

//00493C98
{*procedure TFGIndexTexCoordList.sub_00466814(?:?);
begin
 00493C98    push        ebx
 00493C99    push        esi
 00493C9A    mov         esi,edx
 00493C9C    mov         ebx,eax
 00493C9E    mov         edx,esi
 00493CA0    mov         eax,ebx
 00493CA2    call        TFGVertexIndexList.sub_00466814
 00493CA7    xor         edx,edx
 00493CA9    mov         eax,esi
 00493CAB    mov         ecx,dword ptr [eax]
 00493CAD    call        dword ptr [ecx+8]
 00493CB0    mov         edx,esi
 00493CB2    mov         eax,dword ptr [ebx+24];TFGIndexTexCoordList.?f24:TAffineVectorList
 00493CB5    mov         si,0FFFC
 00493CB9    call        @CallDynaInst;TBaseVectorList.sub_00466814
 00493CBE    pop         esi
 00493CBF    pop         ebx
 00493CC0    ret
end;*}

//00493CC4
{*procedure TFGIndexTexCoordList.sub_00466894(?:?);
begin
 00493CC4    push        ebx
 00493CC5    push        esi
 00493CC6    mov         esi,edx
 00493CC8    mov         ebx,eax
 00493CCA    mov         edx,esi
 00493CCC    mov         eax,ebx
 00493CCE    call        TFGVertexIndexList.sub_00466894
 00493CD3    mov         eax,esi
 00493CD5    mov         edx,dword ptr [eax]
 00493CD7    call        dword ptr [edx+0C]
 00493CDA    test        eax,eax
>00493CDC    jne         00493CEF
 00493CDE    mov         edx,esi
 00493CE0    mov         eax,dword ptr [ebx+24];TFGIndexTexCoordList.?f24:TAffineVectorList
 00493CE3    mov         si,0FFFB
 00493CE7    call        @CallDynaInst;TBaseVectorList.sub_00466894
 00493CEC    pop         esi
 00493CED    pop         ebx
 00493CEE    ret
 00493CEF    mov         edx,eax
 00493CF1    mov         eax,ebx
 00493CF3    call        00466914
 00493CF8    pop         esi
 00493CF9    pop         ebx
 00493CFA    ret
end;*}

//00493CFC
procedure sub_00493CFC;
begin
{*
 00493CFC    push        ebx
 00493CFD    push        esi
 00493CFE    push        edi
 00493CFF    push        ebp
 00493D00    add         esp,0FFFFFFEC
 00493D03    mov         ebx,eax
 00493D05    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493D08    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 00493D0B    mov         edx,dword ptr [ebx+24];TFGIndexTexCoordList.?f24:TAffineVectorList
 00493D0E    cmp         eax,dword ptr [edx+8];TAffineVectorList.?f8:dword
>00493D11    je          00493D27
 00493D13    mov         ecx,15A0
 00493D18    mov         edx,493EAC;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00493D1D    mov         eax,493EF0;'Assertion failure'
 00493D22    call        @Assert
 00493D27    mov         eax,dword ptr [ebx+24];TFGIndexTexCoordList.?f24:TAffineVectorList
 00493D2A    mov         eax,dword ptr [eax+24];TAffineVectorList.?f24:dword
 00493D2D    mov         dword ptr [esp],eax
 00493D30    mov         eax,dword ptr [ebx+8];TFGIndexTexCoordList.?f8:dword
 00493D33    mov         ecx,dword ptr [eax+18]
 00493D36    mov         eax,dword ptr [ecx+0C]
 00493D39    mov         edx,dword ptr [eax+24]
 00493D3C    mov         dword ptr [esp+4],edx
 00493D40    mov         edx,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493D43    mov         edi,dword ptr [edx+24];TIntegerList.?f24:dword
 00493D46    mov         edx,dword ptr [ecx+24]
 00493D49    mov         ecx,dword ptr [edx+24]
 00493D4C    mov         dword ptr [esp+0C],ecx
 00493D50    mov         eax,dword ptr [eax+8]
 00493D53    cmp         eax,dword ptr [edx+8]
 00493D56    sete        byte ptr [esp+10]
 00493D5B    xor         eax,eax
 00493D5D    mov         al,byte ptr [ebx+20];TFGIndexTexCoordList.?f20:byte
 00493D60    cmp         eax,4
>00493D63    ja          00493DAD
 00493D65    jmp         dword ptr [eax*4+493D6C]
 00493D65    dd          00493D80
 00493D65    dd          00493D92
 00493D65    dd          00493D89
 00493D65    dd          00493D9B
 00493D65    dd          00493DA4
 00493D80    push        4
 00493D82    call        OpenGL32.glBegin
>00493D87    jmp         00493DC1
 00493D89    push        4
 00493D8B    call        OpenGL32.glBegin
>00493D90    jmp         00493DC1
 00493D92    push        5
 00493D94    call        OpenGL32.glBegin
>00493D99    jmp         00493DC1
 00493D9B    push        6
 00493D9D    call        OpenGL32.glBegin
>00493DA2    jmp         00493DC1
 00493DA4    push        7
 00493DA6    call        OpenGL32.glBegin
>00493DAB    jmp         00493DC1
 00493DAD    mov         ecx,15AD
 00493DB2    mov         edx,493EAC;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00493DB7    mov         eax,493EF0;'Assertion failure'
 00493DBC    call        @Assert
 00493DC1    mov         eax,dword ptr [ebx+8];TFGIndexTexCoordList.?f8:dword
 00493DC4    mov         eax,dword ptr [eax+18]
 00493DC7    mov         edx,dword ptr [eax+10]
 00493DCA    mov         ecx,dword ptr [edx+8]
 00493DCD    mov         eax,dword ptr [eax+0C]
 00493DD0    cmp         ecx,dword ptr [eax+8]
>00493DD3    jne         00493E44
 00493DD5    mov         eax,dword ptr [edx+24]
 00493DD8    mov         dword ptr [esp+8],eax
 00493DDC    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493DDF    mov         esi,dword ptr [eax+8];TIntegerList.?f8:dword
 00493DE2    dec         esi
 00493DE3    test        esi,esi
>00493DE5    jl          00493E95
 00493DEB    inc         esi
 00493DEC    xor         ebx,ebx
 00493DEE    lea         eax,[ebx+ebx*2]
 00493DF1    mov         edx,dword ptr [esp]
 00493DF4    lea         eax,[edx+eax*4]
 00493DF7    push        eax
 00493DF8    mov         eax,[005AE39C];^gvar_005E1348
 00493DFD    mov         eax,dword ptr [eax]
 00493DFF    call        eax
 00493E01    mov         ebp,dword ptr [edi+ebx*4]
 00493E04    cmp         byte ptr [esp+10],0
>00493E09    je          00493E1C
 00493E0B    mov         eax,ebp
 00493E0D    add         eax,eax
 00493E0F    mov         edx,dword ptr [esp+0C]
 00493E13    lea         eax,[edx+eax*8]
 00493E16    push        eax
 00493E17    call        OpenGL32.glColor4fv
 00493E1C    lea         eax,[ebp+ebp*2]
 00493E20    mov         edx,dword ptr [esp+8]
 00493E24    lea         eax,[edx+eax*4]
 00493E27    push        eax
 00493E28    call        OpenGL32.glNormal3fv
 00493E2D    lea         eax,[ebp+ebp*2]
 00493E31    mov         edx,dword ptr [esp+4]
 00493E35    lea         eax,[edx+eax*4]
 00493E38    push        eax
 00493E39    call        OpenGL32.glVertex3fv
 00493E3E    inc         ebx
 00493E3F    dec         esi
>00493E40    jne         00493DEE
>00493E42    jmp         00493E95
 00493E44    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493E47    mov         esi,dword ptr [eax+8];TIntegerList.?f8:dword
 00493E4A    dec         esi
 00493E4B    test        esi,esi
>00493E4D    jl          00493E95
 00493E4F    inc         esi
 00493E50    xor         ebx,ebx
 00493E52    lea         eax,[ebx+ebx*2]
 00493E55    mov         edx,dword ptr [esp]
 00493E58    lea         eax,[edx+eax*4]
 00493E5B    push        eax
 00493E5C    mov         eax,[005AE39C];^gvar_005E1348
 00493E61    mov         eax,dword ptr [eax]
 00493E63    call        eax
 00493E65    cmp         byte ptr [esp+10],0
>00493E6A    je          00493E7E
 00493E6C    mov         eax,dword ptr [edi+ebx*4]
 00493E6F    add         eax,eax
 00493E71    mov         edx,dword ptr [esp+0C]
 00493E75    lea         eax,[edx+eax*8]
 00493E78    push        eax
 00493E79    call        OpenGL32.glColor4fv
 00493E7E    mov         eax,dword ptr [edi+ebx*4]
 00493E81    lea         eax,[eax+eax*2]
 00493E84    mov         edx,dword ptr [esp+4]
 00493E88    lea         eax,[edx+eax*4]
 00493E8B    push        eax
 00493E8C    call        OpenGL32.glVertex3fv
 00493E91    inc         ebx
 00493E92    dec         esi
>00493E93    jne         00493E52
 00493E95    call        OpenGL32.glEnd
 00493E9A    add         esp,14
 00493E9D    pop         ebp
 00493E9E    pop         edi
 00493E9F    pop         esi
 00493EA0    pop         ebx
 00493EA1    ret
*}
end;

//00493F04
{*procedure TFGIndexTexCoordList.sub_00493360(?:?; ?:?; ?:?);
begin
 00493F04    push        ebp
 00493F05    mov         ebp,esp
 00493F07    add         esp,0FFFFFFD8
 00493F0A    push        ebx
 00493F0B    push        esi
 00493F0C    push        edi
 00493F0D    mov         dword ptr [ebp-4],ecx
 00493F10    mov         ebx,eax
 00493F12    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493F15    push        eax
 00493F16    mov         eax,dword ptr [ebx+8];TFGIndexTexCoordList.?f8:dword
 00493F19    mov         eax,dword ptr [eax+18]
 00493F1C    mov         eax,dword ptr [eax+0C]
 00493F1F    mov         ecx,edx
 00493F21    mov         edx,ebx
 00493F23    xchg        eax,edx
 00493F24    call        004934B0
 00493F29    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493F2C    push        eax
 00493F2D    mov         eax,dword ptr [ebx+8];TFGIndexTexCoordList.?f8:dword
 00493F30    mov         eax,dword ptr [eax+18]
 00493F33    mov         edx,dword ptr [eax+10]
 00493F36    mov         ecx,dword ptr [ebp+8]
 00493F39    mov         eax,ebx
 00493F3B    call        004934B0
 00493F40    mov         esi,dword ptr [ebx+24];TFGIndexTexCoordList.?f24:TAffineVectorList
 00493F43    mov         al,byte ptr [ebx+20];TFGIndexTexCoordList.?f20:byte
 00493F46    sub         al,1
>00493F48    jb          00493F59
>00493F4A    je          00493FB4
 00493F4C    dec         al
>00493F4E    je          00493F59
 00493F50    dec         al
>00493F52    je          00493FCD
>00493F54    jmp         00494044
 00493F59    cmp         dword ptr [ebp-4],0
>00493F5D    je          00494058
 00493F63    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493F66    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 00493F69    mov         ecx,3
 00493F6E    cdq
 00493F6F    idiv        eax,ecx
 00493F71    lea         eax,[eax+eax*2]
 00493F74    mov         ebx,eax
 00493F76    mov         eax,dword ptr [ebp-4]
 00493F79    mov         edx,dword ptr [eax+8]
 00493F7C    add         edx,ebx
 00493F7E    mov         eax,dword ptr [ebp-4]
 00493F81    call        0046824C
 00493F86    mov         edi,ebx
 00493F88    dec         edi
 00493F89    test        edi,edi
>00493F8B    jl          00494058
 00493F91    inc         edi
 00493F92    xor         ebx,ebx
 00493F94    lea         ecx,[ebp-10]
 00493F97    mov         edx,ebx
 00493F99    mov         eax,esi
 00493F9B    call        00468C18
 00493FA0    lea         edx,[ebp-10]
 00493FA3    mov         eax,dword ptr [ebp-4]
 00493FA6    call        00468A90
 00493FAB    inc         ebx
 00493FAC    dec         edi
>00493FAD    jne         00493F94
>00493FAF    jmp         00494058
 00493FB4    cmp         dword ptr [ebp-4],0
>00493FB8    je          00494058
 00493FBE    mov         edx,esi
 00493FC0    mov         eax,dword ptr [ebp-4]
 00493FC3    call        0048C064
>00493FC8    jmp         00494058
 00493FCD    cmp         dword ptr [ebp-4],0
>00493FD1    je          00494058
 00493FD7    mov         eax,dword ptr [ebp-4]
 00493FDA    mov         edx,dword ptr [eax+8]
 00493FDD    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493FE0    mov         eax,dword ptr [eax+8];TIntegerList.?f8:dword
 00493FE3    sub         eax,2
 00493FE6    lea         eax,[eax+eax*2]
 00493FE9    add         edx,eax
 00493FEB    mov         eax,dword ptr [ebp-4]
 00493FEE    call        0046824C
 00493FF3    mov         eax,dword ptr [ebx+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00493FF6    mov         edi,dword ptr [eax+8];TIntegerList.?f8:dword
 00493FF9    dec         edi
 00493FFA    sub         edi,2
>00493FFD    jl          00494058
 00493FFF    inc         edi
 00494000    mov         ebx,2
 00494005    lea         ecx,[ebp-10]
 00494008    mov         edx,ebx
 0049400A    mov         eax,esi
 0049400C    call        00468C18
 00494011    lea         eax,[ebp-10]
 00494014    push        eax
 00494015    lea         ecx,[ebp-1C]
 00494018    mov         edx,ebx
 0049401A    dec         edx
 0049401B    mov         eax,esi
 0049401D    call        00468C18
 00494022    lea         eax,[ebp-1C]
 00494025    push        eax
 00494026    lea         ecx,[ebp-28]
 00494029    xor         edx,edx
 0049402B    mov         eax,esi
 0049402D    call        00468C18
 00494032    lea         edx,[ebp-28]
 00494035    mov         eax,dword ptr [ebp-4]
 00494038    pop         ecx
 00494039    call        00468AD0
 0049403E    inc         ebx
 0049403F    dec         edi
>00494040    jne         00494005
>00494042    jmp         00494058
 00494044    mov         ecx,15E9
 00494049    mov         edx,49406C;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 0049404E    mov         eax,4940B0;'Assertion failure'
 00494053    call        @Assert
 00494058    pop         edi
 00494059    pop         esi
 0049405A    pop         ebx
 0049405B    mov         esp,ebp
 0049405D    pop         ebp
 0049405E    ret         4
end;*}

//004940C4
{*procedure sub_004940C4(?:TFGIndexTexCoordList; ?:?; ?:?; ?:?);
begin
 004940C4    push        ebp
 004940C5    mov         ebp,esp
 004940C7    push        ebx
 004940C8    push        esi
 004940C9    mov         esi,edx
 004940CB    mov         ebx,eax
 004940CD    push        dword ptr [ebp+0C]
 004940D0    push        dword ptr [ebp+8]
 004940D3    push        0
 004940D5    mov         eax,dword ptr [ebx+24]
 004940D8    call        00468B84
 004940DD    mov         edx,esi
 004940DF    mov         eax,ebx
 004940E1    call        004938E4
 004940E6    pop         esi
 004940E7    pop         ebx
 004940E8    pop         ebp
 004940E9    ret         8
end;*}

//004940EC
constructor TFaceGroups.Create;
begin
{*
 004940EC    push        ebx
 004940ED    push        esi
 004940EE    test        dl,dl
>004940F0    je          004940FA
 004940F2    add         esp,0FFFFFFF0
 004940F5    call        @ClassCreate
 004940FA    mov         ebx,edx
 004940FC    mov         esi,eax
 004940FE    mov         dword ptr [esi+18],ecx;TFaceGroups.?f18:dword
 00494101    xor         edx,edx
 00494103    mov         eax,esi
 00494105    mov         ecx,dword ptr [eax]
 00494107    call        dword ptr [ecx+0C];TFaceGroups.sub_00466DB4
 0049410A    mov         eax,esi
 0049410C    test        bl,bl
>0049410E    je          0049411F
 00494110    call        @AfterConstruction
 00494115    pop         dword ptr fs:[0]
 0049411C    add         esp,0C
 0049411F    mov         eax,esi
 00494121    pop         esi
 00494122    pop         ebx
 00494123    ret
*}
end;

//00494124
destructor TFaceGroups.Destroy;
begin
{*
 00494124    push        ebx
 00494125    push        esi
 00494126    push        edi
 00494127    call        @BeforeDestruction
 0049412C    mov         ebx,edx
 0049412E    mov         edi,eax
 00494130    mov         eax,edi
 00494132    mov         si,0FFF4
 00494136    call        @CallDynaInst;TFaceGroups.sub_00466E50
 0049413B    mov         edx,ebx
 0049413D    and         dl,0FC
 00494140    mov         eax,edi
 00494142    call        TPersistentObjectList.Destroy
 00494147    test        bl,bl
>00494149    jle         00494152
 0049414B    mov         eax,edi
 0049414D    call        @ClassDestroy
 00494152    pop         edi
 00494153    pop         esi
 00494154    pop         ebx
 00494155    ret
*}
end;

//00494158
{*procedure TFaceGroups.sub_00466894(?:?);
begin
 00494158    push        ebx
 00494159    push        esi
 0049415A    push        edi
 0049415B    mov         ebx,eax
 0049415D    mov         eax,ebx
 0049415F    call        TPersistentObjectList.sub_00466894
 00494164    mov         esi,dword ptr [ebx+0C];TFaceGroups.?fC:dword
 00494167    dec         esi
 00494168    test        esi,esi
>0049416A    jl          0049417F
 0049416C    inc         esi
 0049416D    xor         edi,edi
 0049416F    mov         edx,edi
 00494171    mov         eax,ebx
 00494173    call        004941BC
 00494178    mov         dword ptr [eax+8],ebx
 0049417B    inc         edi
 0049417C    dec         esi
>0049417D    jne         0049416F
 0049417F    pop         edi
 00494180    pop         esi
 00494181    pop         ebx
 00494182    ret
end;*}

//00494184
procedure TFaceGroups.sub_00466E50;
begin
{*
 00494184    push        ebx
 00494185    push        esi
 00494186    push        edi
 00494187    mov         edi,eax
 00494189    mov         ebx,dword ptr [edi+0C];TFaceGroups.?fC:dword
 0049418C    dec         ebx
 0049418D    test        ebx,ebx
>0049418F    jl          004941AF
 00494191    inc         ebx
 00494192    xor         esi,esi
 00494194    mov         edx,esi
 00494196    mov         eax,edi
 00494198    call        004941BC
 0049419D    test        eax,eax
>0049419F    je          004941AB
 004941A1    xor         edx,edx
 004941A3    mov         dword ptr [eax+8],edx
 004941A6    call        TObject.Free
 004941AB    inc         esi
 004941AC    dec         ebx
>004941AD    jne         00494194
 004941AF    mov         eax,edi
 004941B1    call        TPersistentObjectList.sub_00466E50
 004941B6    pop         edi
 004941B7    pop         esi
 004941B8    pop         ebx
 004941B9    ret
*}
end;

//004941BC
{*function sub_004941BC(?:TFaceGroups; ?:?):?;
begin
 004941BC    mov         eax,dword ptr [eax+8];TFaceGroups.?f8:dword
 004941BF    mov         eax,dword ptr [eax+edx*4]
 004941C2    ret
end;*}

//004941C4
{*procedure sub_004941C4(?:?; ?:?);
begin
 004941C4    push        ebx
 004941C5    push        esi
 004941C6    push        edi
 004941C7    push        ebp
 004941C8    mov         ebp,edx
 004941CA    mov         edi,eax
 004941CC    mov         ebx,dword ptr [edi+0C]
 004941CF    dec         ebx
 004941D0    test        ebx,ebx
>004941D2    jl          004941E8
 004941D4    inc         ebx
 004941D5    xor         esi,esi
 004941D7    mov         eax,dword ptr [edi+8]
 004941DA    mov         eax,dword ptr [eax+esi*4]
 004941DD    mov         edx,ebp
 004941DF    call        0049332C
 004941E4    inc         esi
 004941E5    dec         ebx
>004941E6    jne         004941D7
 004941E8    pop         ebp
 004941E9    pop         edi
 004941EA    pop         esi
 004941EB    pop         ebx
 004941EC    ret
end;*}

//004941F0
{*procedure sub_004941F0(?:?);
begin
 004941F0    push        ebx
 004941F1    push        esi
 004941F2    push        edi
 004941F3    mov         edi,eax
 004941F5    mov         ebx,dword ptr [edi+0C]
 004941F8    dec         ebx
 004941F9    test        ebx,ebx
>004941FB    jl          0049420F
 004941FD    inc         ebx
 004941FE    xor         esi,esi
 00494200    mov         eax,dword ptr [edi+8]
 00494203    mov         eax,dword ptr [eax+esi*4]
 00494206    call        00493358
 0049420B    inc         esi
 0049420C    dec         ebx
>0049420D    jne         00494200
 0049420F    pop         edi
 00494210    pop         esi
 00494211    pop         ebx
 00494212    ret
end;*}

//00494214
{*procedure sub_00494214(?:TFaceGroups; ?:TAffineVectorList; ?:?; ?:?);
begin
 00494214    push        ebp
 00494215    mov         ebp,esp
 00494217    add         esp,0FFFFFFF4
 0049421A    push        ebx
 0049421B    push        esi
 0049421C    push        edi
 0049421D    mov         dword ptr [ebp-0C],ecx
 00494220    mov         dword ptr [ebp-8],edx
 00494223    mov         dword ptr [ebp-4],eax
 00494226    mov         eax,dword ptr [ebp-4]
 00494229    mov         ebx,dword ptr [eax+0C];TFaceGroups.?fC:dword
 0049422C    dec         ebx
 0049422D    test        ebx,ebx
>0049422F    jl          00494255
 00494231    inc         ebx
 00494232    xor         edi,edi
 00494234    mov         eax,dword ptr [ebp+8]
 00494237    push        eax
 00494238    mov         edx,edi
 0049423A    mov         eax,dword ptr [ebp-4]
 0049423D    call        004941BC
 00494242    mov         ecx,dword ptr [ebp-0C]
 00494245    mov         edx,dword ptr [ebp-8]
 00494248    mov         si,0FFF4
 0049424C    call        @CallDynaInst
 00494251    inc         edi
 00494252    dec         ebx
>00494253    jne         00494234
 00494255    pop         edi
 00494256    pop         esi
 00494257    pop         ebx
 00494258    mov         esp,ebp
 0049425A    pop         ebp
 0049425B    ret         4
end;*}

//00494260
constructor sub_00494260;
begin
{*
 00494260    push        ebx
 00494261    push        esi
 00494262    push        edi
 00494263    test        dl,dl
>00494265    je          0049426F
 00494267    add         esp,0FFFFFFF0
 0049426A    call        @ClassCreate
 0049426F    mov         esi,ecx
 00494271    mov         ebx,edx
 00494273    mov         edi,eax
 00494275    mov         eax,esi
 00494277    mov         edx,dword ptr ds:[48DBF0];TGLBaseMesh
 0049427D    call        @IsClass
 00494282    test        al,al
>00494284    jne         0049429A
 00494286    mov         ecx,1694
 0049428B    mov         edx,4942C8;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00494290    mov         eax,49430C;'Assertion failure'
 00494295    call        @Assert
 0049429A    mov         ecx,esi
 0049429C    xor         edx,edx
 0049429E    mov         eax,edi
 004942A0    call        00465BC8
 004942A5    mov         eax,edi
 004942A7    test        bl,bl
>004942A9    je          004942BA
 004942AB    call        @AfterConstruction
 004942B0    pop         dword ptr fs:[0]
 004942B7    add         esp,0C
 004942BA    mov         eax,edi
 004942BC    pop         edi
 004942BD    pop         esi
 004942BE    pop         ebx
 004942BF    ret
*}
end;

//00494320
{*function sub_00494320(?:TVectorFile):?;
begin
 00494320    push        ebx
 00494321    push        esi
 00494322    mov         ebx,eax
 00494324    mov         eax,ebx
 00494326    mov         si,0FFFF
 0049432A    call        @CallDynaInst
 0049432F    pop         esi
 00494330    pop         ebx
 00494331    ret
end;*}

//00494334
{*procedure sub_00494334(?:?);
begin
 00494334    mov         byte ptr [eax+0C],dl;TVectorFile.?fC:byte
 00494337    ret
end;*}

//00494338
{*function sub_00494338:?;
begin
 00494338    mov         al,[00494340];0x3 gvar_00494340
 0049433D    ret
end;*}

//00494344
{*procedure TGLGLSMVectorFile.sub_00494344(?:?);
begin
 00494344    push        ebx
 00494345    push        esi
 00494346    mov         esi,edx
 00494348    mov         ebx,eax
 0049434A    mov         eax,ebx
 0049434C    call        00494320
 00494351    mov         eax,dword ptr [eax+0C8]
 00494357    xor         ecx,ecx
 00494359    mov         edx,esi
 0049435B    mov         si,0FFF9
 0049435F    call        @CallDynaInst
 00494364    pop         esi
 00494365    pop         ebx
 00494366    ret
end;*}

//00494368
{*procedure TGLGLSMVectorFile.sub_00465D9C(?:?);
begin
 00494368    push        ebx
 00494369    push        esi
 0049436A    mov         esi,edx
 0049436C    mov         ebx,eax
 0049436E    mov         eax,ebx
 00494370    call        00494320
 00494375    mov         eax,dword ptr [eax+0C8]
 0049437B    xor         ecx,ecx
 0049437D    mov         edx,esi
 0049437F    mov         si,0FFFA
 00494383    call        @CallDynaInst
 00494388    pop         esi
 00494389    pop         ebx
 0049438A    ret
end;*}

//0049438C
constructor TGLBaseMesh.Create(AOwner:TComponent);
begin
{*
 0049438C    push        ebx
 0049438D    push        esi
 0049438E    test        dl,dl
>00494390    je          0049439A
 00494392    add         esp,0FFFFFFF0
 00494395    call        @ClassCreate
 0049439A    mov         ebx,edx
 0049439C    mov         esi,eax
 0049439E    xor         edx,edx
 004943A0    mov         eax,esi
 004943A2    call        TGLCustomSceneObject.Create
 004943A7    mov         al,byte ptr [esi+3C];TGLBaseMesh.?f3C:byte
 004943AA    or          al,byte ptr ds:[494440];0x2 gvar_00494440
 004943B0    mov         byte ptr [esi+3C],al;TGLBaseMesh.?f3C:byte
 004943B3    cmp         dword ptr [esi+0C8],0;TGLBaseMesh.?fC8:TMeshObjectList
>004943BA    jne         004943D0
 004943BC    mov         ecx,esi
 004943BE    mov         dl,1
 004943C0    mov         eax,[0048D1E4];TMeshObjectList
 004943C5    call        TMeshObjectList.Create;TMeshObjectList.Create
 004943CA    mov         dword ptr [esi+0C8],eax;TGLBaseMesh.?fC8:TMeshObjectList
 004943D0    cmp         dword ptr [esi+0CC],0;TGLBaseMesh.?fCC:TSkeleton
>004943D7    jne         004943ED
 004943D9    mov         ecx,esi
 004943DB    mov         dl,1
 004943DD    mov         eax,[0048D054];TSkeleton
 004943E2    call        TSkeleton.Create;TSkeleton.Create
 004943E7    mov         dword ptr [esi+0CC],eax;TGLBaseMesh.?fCC:TSkeleton
 004943ED    mov         byte ptr [esi+0B4],1;TGLBaseMesh.?fB4:byte
 004943F4    mov         al,[00494444];0x0 gvar_00494444
 004943F9    mov         byte ptr [esi+0B7],al;TGLBaseMesh.?fB7:byte
 004943FF    mov         dword ptr [esi+0A4],0BF800000;TGLBaseMesh.?fA4:Single
 00494409    mov         eax,[005AE594];^gvar_005ACF74
 0049440E    push        eax
 0049440F    push        0
 00494411    mov         ecx,esi
 00494413    mov         dl,1
 00494415    mov         eax,[0046AF7C];TGLCoordinates
 0049441A    call        TGLCoordinates.Create;TGLCoordinates.Create
 0049441F    mov         dword ptr [esi+0B8],eax;TGLBaseMesh.?fB8:TGLCoordinates
 00494425    mov         eax,esi
 00494427    test        bl,bl
>00494429    je          0049443A
 0049442B    call        @AfterConstruction
 00494430    pop         dword ptr fs:[0]
 00494437    add         esp,0C
 0049443A    mov         eax,esi
 0049443C    pop         esi
 0049443D    pop         ebx
 0049443E    ret
*}
end;

//00494448
destructor TGLBaseMesh.Destroy;
begin
{*
 00494448    push        ebx
 00494449    push        esi
 0049444A    call        @BeforeDestruction
 0049444F    mov         ebx,edx
 00494451    mov         esi,eax
 00494453    mov         eax,dword ptr [esi+0C0];TGLBaseMesh.?fC0:dword
 00494459    call        TObject.Free
 0049445E    mov         eax,esi
 00494460    call        00494E20
 00494465    mov         eax,dword ptr [esi+0CC];TGLBaseMesh.?fCC:TSkeleton
 0049446B    call        TObject.Free
 00494470    mov         eax,dword ptr [esi+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494476    call        TObject.Free
 0049447B    mov         eax,dword ptr [esi+0B8];TGLBaseMesh.?fB8:TGLCoordinates
 00494481    call        TObject.Free
 00494486    mov         edx,ebx
 00494488    and         dl,0FC
 0049448B    mov         eax,esi
 0049448D    call        TGLCustomSceneObject.Destroy
 00494492    test        bl,bl
>00494494    jle         0049449D
 00494496    mov         eax,esi
 00494498    call        @ClassDestroy
 0049449D    pop         esi
 0049449E    pop         ebx
 0049449F    ret
*}
end;

//004944A0
procedure TGLBaseMesh.Assign(Source:TPersistent);
begin
{*
 004944A0    push        ebx
 004944A1    push        esi
 004944A2    push        edi
 004944A3    mov         esi,edx
 004944A5    mov         ebx,eax
 004944A7    mov         eax,esi
 004944A9    mov         edx,dword ptr ds:[48DBF0];TGLBaseMesh
 004944AF    call        @IsClass
 004944B4    test        al,al
>004944B6    je          00494572
 004944BC    mov         eax,dword ptr [ebx+0CC];TGLBaseMesh.?fCC:TSkeleton
 004944C2    call        00490C50
 004944C7    mov         edi,esi
 004944C9    mov         al,byte ptr [edi+98]
 004944CF    mov         byte ptr [ebx+98],al;TGLBaseMesh.?f98:byte
 004944D5    mov         eax,dword ptr [edi+9C]
 004944DB    mov         dword ptr [ebx+9C],eax;TGLBaseMesh.?f9C:TGLMaterialLibrary
 004944E1    mov         eax,dword ptr [edi+0A0]
 004944E7    mov         dword ptr [ebx+0A0],eax;TGLBaseMesh.?fA0:TGLMaterialLibrary
 004944ED    push        esi
 004944EE    push        edi
 004944EF    lea         esi,[edi+0A4]
 004944F5    lea         edi,[ebx+0A4];TGLBaseMesh.?fA4:Single
 004944FB    movs        dword ptr [edi],dword ptr [esi]
 004944FC    movs        dword ptr [edi],dword ptr [esi]
 004944FD    movs        dword ptr [edi],dword ptr [esi]
 004944FE    movs        dword ptr [edi],dword ptr [esi]
 004944FF    pop         edi
 00494500    pop         esi
 00494501    mov         al,byte ptr [edi+0B4]
 00494507    mov         byte ptr [ebx+0B4],al;TGLBaseMesh.?fB4:byte
 0049450D    mov         al,byte ptr [edi+0B5]
 00494513    mov         byte ptr [ebx+0B5],al;TGLBaseMesh.?fB5:byte
 00494519    mov         al,byte ptr [edi+0B6]
 0049451F    mov         byte ptr [ebx+0B6],al;TGLBaseMesh.?fB6:byte
 00494525    mov         al,byte ptr [edi+0B7]
 0049452B    mov         byte ptr [ebx+0B7],al;TGLBaseMesh.?fB7:byte
 00494531    mov         edx,dword ptr [edi+0B8]
 00494537    mov         eax,dword ptr [ebx+0B8];TGLBaseMesh.?fB8:TGLCoordinates
 0049453D    mov         ecx,dword ptr [eax]
 0049453F    call        dword ptr [ecx+8];TGLCoordinates.Assign
 00494542    mov         edx,dword ptr [edi+0CC]
 00494548    mov         eax,dword ptr [ebx+0CC];TGLBaseMesh.?fCC:TSkeleton
 0049454E    mov         ecx,dword ptr [eax]
 00494550    call        dword ptr [ecx+8];TPersistentObject.Assign
 00494553    mov         eax,dword ptr [ebx+0CC];TGLBaseMesh.?fCC:TSkeleton
 00494559    mov         eax,dword ptr [eax+0C];TSkeleton.?fC:TSkeletonRootBoneList
 0049455C    mov         edx,dword ptr [eax]
 0049455E    call        dword ptr [edx+30];TSkeletonRootBoneList.sub_0048FD10
 00494561    mov         edx,dword ptr [edi+0C8]
 00494567    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 0049456D    mov         ecx,dword ptr [eax]
 0049456F    call        dword ptr [ecx+8];TPersistentObject.Assign
 00494572    mov         edx,esi
 00494574    mov         eax,ebx
 00494576    call        TGLCustomSceneObject.Assign
 0049457B    pop         edi
 0049457C    pop         esi
 0049457D    pop         ebx
 0049457E    ret
*}
end;

//00494580
{*procedure TGLBaseMesh.sub_00494580(?:?);
begin
 00494580    push        ebp
 00494581    mov         ebp,esp
 00494583    push        ecx
 00494584    push        ebx
 00494585    push        esi
 00494586    push        edi
 00494587    mov         edi,edx
 00494589    mov         ebx,eax
 0049458B    lea         eax,[ebx+0C4];TGLBaseMesh.?fC4:String
 00494591    call        @LStrClr
 00494596    test        edi,edi
>00494598    je          004945F0
 0049459A    mov         dx,20
 0049459E    mov         eax,edi
 004945A0    call        00465A70
 004945A5    mov         dword ptr [ebp-4],eax
 004945A8    xor         eax,eax
 004945AA    push        ebp
 004945AB    push        4945E9
 004945B0    push        dword ptr fs:[eax]
 004945B3    mov         dword ptr fs:[eax],esp
 004945B6    mov         ecx,dword ptr [ebp-4]
 004945B9    mov         edx,edi
 004945BB    mov         eax,ebx
 004945BD    mov         si,0FFE0
 004945C1    call        @CallDynaInst;TGLBaseMesh.sub_004945F8
 004945C6    lea         eax,[ebx+0C4];TGLBaseMesh.?fC4:String
 004945CC    mov         edx,edi
 004945CE    call        @LStrAsg
 004945D3    xor         eax,eax
 004945D5    pop         edx
 004945D6    pop         ecx
 004945D7    pop         ecx
 004945D8    mov         dword ptr fs:[eax],edx
 004945DB    push        4945F0
 004945E0    mov         eax,dword ptr [ebp-4]
 004945E3    call        TObject.Free
 004945E8    ret
>004945E9    jmp         @HandleFinally
>004945EE    jmp         004945E0
 004945F0    pop         edi
 004945F1    pop         esi
 004945F2    pop         ebx
 004945F3    pop         ecx
 004945F4    pop         ebp
 004945F5    ret
end;*}

//004945F8
{*procedure TGLBaseMesh.sub_004945F8(?:?; ?:?);
begin
 004945F8    push        ebp
 004945F9    mov         ebp,esp
 004945FB    add         esp,0FFFFFFF8
 004945FE    push        ebx
 004945FF    push        esi
 00494600    push        edi
 00494601    mov         edi,ecx
 00494603    mov         ebx,edx
 00494605    mov         dword ptr [ebp-4],eax
 00494608    mov         eax,dword ptr [ebp-4]
 0049460B    add         eax,0C4;TGLBaseMesh.?fC4:String
 00494610    call        @LStrClr
 00494615    test        ebx,ebx
>00494617    je          0049471D
 0049461D    mov         eax,dword ptr [ebp-4]
 00494620    mov         eax,dword ptr [eax+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494626    mov         si,0FFF4
 0049462A    call        @CallDynaInst;TMeshObjectList.sub_00466E50
 0049462F    mov         eax,dword ptr [ebp-4]
 00494632    mov         eax,dword ptr [eax+0CC];TGLBaseMesh.?fCC:TSkeleton
 00494638    call        00490C50
 0049463D    call        0048EB0C
 00494642    mov         edx,ebx
 00494644    call        0048ECAC
 00494649    mov         ecx,dword ptr [ebp-4]
 0049464C    mov         dl,1
 0049464E    call        dword ptr [eax+0C]
 00494651    mov         dword ptr [ebp-8],eax
 00494654    xor         edx,edx
 00494656    push        ebp
 00494657    push        4946F2
 0049465C    push        dword ptr fs:[edx]
 0049465F    mov         dword ptr fs:[edx],esp
 00494662    mov         eax,dword ptr [ebp-8]
 00494665    add         eax,8
 00494668    mov         edx,ebx
 0049466A    call        @LStrAsg
 0049466F    mov         edx,dword ptr [ebp-8]
 00494672    mov         eax,dword ptr [ebp-4]
 00494675    mov         si,0FFE6
 00494679    call        @CallDynaInst;TGLBaseMesh.sub_00494C94
 0049467E    mov         eax,dword ptr [ebp-4]
 00494681    mov         eax,dword ptr [eax+5C];TGLBaseMesh.?f5C:TComponent
 00494684    test        eax,eax
>00494686    je          0049468D
 00494688    call        00480014
 0049468D    xor         edx,edx
 0049468F    push        ebp
 00494690    push        4946D5
 00494695    push        dword ptr fs:[edx]
 00494698    mov         dword ptr fs:[edx],esp
 0049469B    mov         edx,edi
 0049469D    mov         eax,dword ptr [ebp-8]
 004946A0    mov         si,0FFFA
 004946A4    call        @CallDynaInst
 004946A9    mov         eax,dword ptr [ebp-4]
 004946AC    add         eax,0C4;TGLBaseMesh.?fC4:String
 004946B1    mov         edx,ebx
 004946B3    call        @LStrAsg
 004946B8    xor         eax,eax
 004946BA    pop         edx
 004946BB    pop         ecx
 004946BC    pop         ecx
 004946BD    mov         dword ptr fs:[eax],edx
 004946C0    push        4946DC
 004946C5    mov         eax,dword ptr [ebp-4]
 004946C8    mov         eax,dword ptr [eax+5C];TGLBaseMesh.?f5C:TComponent
 004946CB    test        eax,eax
>004946CD    je          004946D4
 004946CF    call        00480018
 004946D4    ret
>004946D5    jmp         @HandleFinally
>004946DA    jmp         004946C5
 004946DC    xor         eax,eax
 004946DE    pop         edx
 004946DF    pop         ecx
 004946E0    pop         ecx
 004946E1    mov         dword ptr fs:[eax],edx
 004946E4    push        4946F9
 004946E9    mov         eax,dword ptr [ebp-8]
 004946EC    call        TObject.Free
 004946F1    ret
>004946F2    jmp         @HandleFinally
>004946F7    jmp         004946E9
 004946F9    mov         eax,dword ptr [ebp-4]
 004946FC    mov         si,0FFE2
 00494700    call        @CallDynaInst;TGLBaseMesh.sub_00494D5C
 00494705    mov         eax,dword ptr [ebp-4]
 00494708    mov         si,0FFE3
 0049470C    call        @CallDynaInst;TGLBaseMesh.sub_00494CA4
 00494711    mov         eax,dword ptr [ebp-4]
 00494714    mov         si,0FFE5
 00494718    call        @CallDynaInst;TGLBaseMesh.sub_00494DE4
 0049471D    pop         edi
 0049471E    pop         esi
 0049471F    pop         ebx
 00494720    pop         ecx
 00494721    pop         ecx
 00494722    pop         ebp
 00494723    ret
end;*}

//00494724
{*procedure TGLBaseMesh.sub_00494724(?:?);
begin
 00494724    push        ebp
 00494725    mov         ebp,esp
 00494727    push        ecx
 00494728    push        ebx
 00494729    push        esi
 0049472A    mov         ebx,edx
 0049472C    mov         esi,eax
 0049472E    test        ebx,ebx
>00494730    je          0049477B
 00494732    mov         dx,0FFFF
 00494736    mov         eax,ebx
 00494738    call        00465A70
 0049473D    mov         dword ptr [ebp-4],eax
 00494740    xor         eax,eax
 00494742    push        ebp
 00494743    push        494774
 00494748    push        dword ptr fs:[eax]
 0049474B    mov         dword ptr fs:[eax],esp
 0049474E    mov         ecx,dword ptr [ebp-4]
 00494751    mov         edx,ebx
 00494753    mov         eax,esi
 00494755    mov         si,0FFDE
 00494759    call        @CallDynaInst;TGLBaseMesh.sub_00494780
 0049475E    xor         eax,eax
 00494760    pop         edx
 00494761    pop         ecx
 00494762    pop         ecx
 00494763    mov         dword ptr fs:[eax],edx
 00494766    push        49477B
 0049476B    mov         eax,dword ptr [ebp-4]
 0049476E    call        TObject.Free
 00494773    ret
>00494774    jmp         @HandleFinally
>00494779    jmp         0049476B
 0049477B    pop         esi
 0049477C    pop         ebx
 0049477D    pop         ecx
 0049477E    pop         ebp
 0049477F    ret
end;*}

//00494780
{*procedure TGLBaseMesh.sub_00494780(?:?; ?:?);
begin
 00494780    push        ebp
 00494781    mov         ebp,esp
 00494783    push        ecx
 00494784    push        ebx
 00494785    push        esi
 00494786    push        edi
 00494787    mov         edi,ecx
 00494789    mov         esi,edx
 0049478B    mov         ebx,eax
 0049478D    test        esi,esi
>0049478F    je          004947FB
 00494791    call        0048EB0C
 00494796    mov         edx,esi
 00494798    call        0048ECAC
 0049479D    mov         ecx,ebx
 0049479F    mov         dl,1
 004947A1    call        dword ptr [eax+0C]
 004947A4    mov         dword ptr [ebp-4],eax
 004947A7    xor         eax,eax
 004947A9    push        ebp
 004947AA    push        4947F4
 004947AF    push        dword ptr fs:[eax]
 004947B2    mov         dword ptr fs:[eax],esp
 004947B5    mov         eax,dword ptr [ebp-4]
 004947B8    add         eax,8
 004947BB    mov         edx,esi
 004947BD    call        @LStrAsg
 004947C2    mov         edx,dword ptr [ebp-4]
 004947C5    mov         eax,ebx
 004947C7    mov         si,0FFE6
 004947CB    call        @CallDynaInst;TGLBaseMesh.sub_00494C94
 004947D0    mov         edx,edi
 004947D2    mov         eax,dword ptr [ebp-4]
 004947D5    mov         si,0FFF9
 004947D9    call        @CallDynaInst
 004947DE    xor         eax,eax
 004947E0    pop         edx
 004947E1    pop         ecx
 004947E2    pop         ecx
 004947E3    mov         dword ptr fs:[eax],edx
 004947E6    push        4947FB
 004947EB    mov         eax,dword ptr [ebp-4]
 004947EE    call        TObject.Free
 004947F3    ret
>004947F4    jmp         @HandleFinally
>004947F9    jmp         004947EB
 004947FB    pop         edi
 004947FC    pop         esi
 004947FD    pop         ebx
 004947FE    pop         ecx
 004947FF    pop         ebp
 00494800    ret
end;*}

//00494804
{*procedure TGLBaseMesh.sub_00494804(?:?);
begin
 00494804    push        ebp
 00494805    mov         ebp,esp
 00494807    push        ecx
 00494808    push        ebx
 00494809    push        esi
 0049480A    mov         ebx,edx
 0049480C    mov         esi,eax
 0049480E    test        ebx,ebx
>00494810    je          0049485B
 00494812    mov         dx,20
 00494816    mov         eax,ebx
 00494818    call        00465A70
 0049481D    mov         dword ptr [ebp-4],eax
 00494820    xor         eax,eax
 00494822    push        ebp
 00494823    push        494854
 00494828    push        dword ptr fs:[eax]
 0049482B    mov         dword ptr fs:[eax],esp
 0049482E    mov         ecx,dword ptr [ebp-4]
 00494831    mov         edx,ebx
 00494833    mov         eax,esi
 00494835    mov         si,0FFDC
 00494839    call        @CallDynaInst;TGLBaseMesh.sub_00494860
 0049483E    xor         eax,eax
 00494840    pop         edx
 00494841    pop         ecx
 00494842    pop         ecx
 00494843    mov         dword ptr fs:[eax],edx
 00494846    push        49485B
 0049484B    mov         eax,dword ptr [ebp-4]
 0049484E    call        TObject.Free
 00494853    ret
>00494854    jmp         @HandleFinally
>00494859    jmp         0049484B
 0049485B    pop         esi
 0049485C    pop         ebx
 0049485D    pop         ecx
 0049485E    pop         ebp
 0049485F    ret
end;*}

//00494860
{*procedure TGLBaseMesh.sub_00494860(?:?; ?:?);
begin
 00494860    push        ebp
 00494861    mov         ebp,esp
 00494863    add         esp,0FFFFFFF8
 00494866    push        ebx
 00494867    push        esi
 00494868    push        edi
 00494869    mov         edi,ecx
 0049486B    mov         ebx,edx
 0049486D    mov         dword ptr [ebp-4],eax
 00494870    test        ebx,ebx
>00494872    je          0049490E
 00494878    call        0048EB0C
 0049487D    mov         edx,ebx
 0049487F    call        0048ECAC
 00494884    mov         ecx,dword ptr [ebp-4]
 00494887    mov         dl,1
 00494889    call        dword ptr [eax+0C]
 0049488C    mov         dword ptr [ebp-8],eax
 0049488F    mov         eax,dword ptr [ebp-8]
 00494892    add         eax,8
 00494895    mov         edx,ebx
 00494897    call        @LStrAsg
 0049489C    mov         edx,dword ptr [ebp-8]
 0049489F    mov         eax,dword ptr [ebp-4]
 004948A2    mov         si,0FFE6
 004948A6    call        @CallDynaInst;TGLBaseMesh.sub_00494C94
 004948AB    xor         edx,edx
 004948AD    push        ebp
 004948AE    push        4948FB
 004948B3    push        dword ptr fs:[edx]
 004948B6    mov         dword ptr fs:[edx],esp
 004948B9    mov         eax,dword ptr [ebp-4]
 004948BC    mov         eax,dword ptr [eax+5C];TGLBaseMesh.?f5C:TComponent
 004948BF    test        eax,eax
>004948C1    je          004948C8
 004948C3    call        00480014
 004948C8    mov         edx,edi
 004948CA    mov         eax,dword ptr [ebp-8]
 004948CD    mov         si,0FFFA
 004948D1    call        @CallDynaInst
 004948D6    mov         eax,dword ptr [ebp-4]
 004948D9    mov         eax,dword ptr [eax+5C];TGLBaseMesh.?f5C:TComponent
 004948DC    test        eax,eax
>004948DE    je          004948E5
 004948E0    call        00480018
 004948E5    xor         eax,eax
 004948E7    pop         edx
 004948E8    pop         ecx
 004948E9    pop         ecx
 004948EA    mov         dword ptr fs:[eax],edx
 004948ED    push        494902
 004948F2    mov         eax,dword ptr [ebp-8]
 004948F5    call        TObject.Free
 004948FA    ret
>004948FB    jmp         @HandleFinally
>00494900    jmp         004948F2
 00494902    mov         eax,dword ptr [ebp-4]
 00494905    mov         si,0FFE5
 00494909    call        @CallDynaInst;TGLBaseMesh.sub_00494DE4
 0049490E    pop         edi
 0049490F    pop         esi
 00494910    pop         ebx
 00494911    pop         ecx
 00494912    pop         ecx
 00494913    pop         ebp
 00494914    ret
end;*}

//00494918
{*procedure sub_00494918(?:TGLBaseMesh; ?:?; ?:?);
begin
 00494918    push        ebx
 00494919    push        esi
 0049491A    add         esp,0FFFFFFD0
 0049491D    mov         dword ptr [esp+8],ecx
 00494921    mov         dword ptr [esp+4],edx
 00494925    mov         dword ptr [esp],eax
 00494928    push        dword ptr ds:[5AD72C]
 0049492E    push        dword ptr ds:[5AD72C]
 00494934    push        dword ptr ds:[5AD72C]
 0049493A    mov         eax,dword ptr [esp+10]
 0049493E    call        0045C8DC
 00494943    push        dword ptr ds:[5AD730]
 00494949    push        dword ptr ds:[5AD730]
 0049494F    push        dword ptr ds:[5AD730]
 00494955    mov         eax,dword ptr [esp+14]
 00494959    call        0045C8DC
 0049495E    mov         eax,dword ptr [esp]
 00494961    mov         eax,dword ptr [eax+0C8]
 00494967    mov         eax,dword ptr [eax+0C]
 0049496A    dec         eax
 0049496B    test        eax,eax
>0049496D    jl          004949ED
 0049496F    inc         eax
 00494970    mov         dword ptr [esp+14],eax
 00494974    mov         dword ptr [esp+0C],0
 0049497C    mov         eax,dword ptr [esp]
 0049497F    mov         eax,dword ptr [eax+0C8]
 00494985    mov         edx,dword ptr [esp+0C]
 00494989    call        00492124
 0049498E    lea         ecx,[esp+24]
 00494992    lea         edx,[esp+18]
 00494996    mov         si,0FFEF
 0049499A    call        @CallDynaInst
 0049499F    mov         dword ptr [esp+10],3
 004949A7    lea         edx,[esp+18]
 004949AB    mov         ecx,dword ptr [esp+4]
 004949AF    lea         ebx,[esp+24]
 004949B3    mov         esi,dword ptr [esp+8]
 004949B7    fld         dword ptr [edx]
 004949B9    fcomp       dword ptr [ecx]
 004949BB    fnstsw      al
 004949BD    sahf
>004949BE    jae         004949C4
 004949C0    mov         eax,dword ptr [edx]
 004949C2    mov         dword ptr [ecx],eax
 004949C4    fld         dword ptr [ebx]
 004949C6    fcomp       dword ptr [esi]
 004949C8    fnstsw      al
 004949CA    sahf
>004949CB    jbe         004949D1
 004949CD    mov         eax,dword ptr [ebx]
 004949CF    mov         dword ptr [esi],eax
 004949D1    add         esi,4
 004949D4    add         ebx,4
 004949D7    add         ecx,4
 004949DA    add         edx,4
 004949DD    dec         dword ptr [esp+10]
>004949E1    jne         004949B7
 004949E3    inc         dword ptr [esp+0C]
 004949E7    dec         dword ptr [esp+14]
>004949EB    jne         0049497C
 004949ED    add         esp,30
 004949F0    pop         esi
 004949F1    pop         ebx
 004949F2    ret
end;*}

//004949F4
{*procedure sub_004949F4(?:TGLBaseMesh; ?:?);
begin
 004949F4    push        ebx
 004949F5    push        esi
 004949F6    push        edi
 004949F7    push        ebp
 004949F8    add         esp,0FFFFFFF8
 004949FB    mov         dword ptr [esp],edx
 004949FE    mov         ebp,eax
 00494A00    mov         eax,dword ptr [esp]
 00494A03    mov         edx,dword ptr ds:[5AE438];^gvar_005ACF18
 00494A09    mov         ecx,dword ptr [edx]
 00494A0B    mov         dword ptr [eax],ecx
 00494A0D    mov         ecx,dword ptr [edx+4]
 00494A10    mov         dword ptr [eax+4],ecx
 00494A13    mov         ecx,dword ptr [edx+8]
 00494A16    mov         dword ptr [eax+8],ecx
 00494A19    xor         eax,eax
 00494A1B    mov         dword ptr [esp+4],eax
 00494A1F    mov         eax,dword ptr [ebp+0C8]
 00494A25    mov         ebx,dword ptr [eax+0C]
 00494A28    dec         ebx
 00494A29    test        ebx,ebx
>00494A2B    jl          00494A51
 00494A2D    inc         ebx
 00494A2E    xor         edi,edi
 00494A30    mov         eax,dword ptr [ebp+0C8]
 00494A36    mov         edx,edi
 00494A38    call        00492124
 00494A3D    lea         ecx,[esp+4]
 00494A41    mov         edx,dword ptr [esp]
 00494A44    mov         si,0FFF4
 00494A48    call        @CallDynaInst
 00494A4D    inc         edi
 00494A4E    dec         ebx
>00494A4F    jne         00494A30
 00494A51    cmp         dword ptr [esp+4],0
>00494A56    jle         00494A72
 00494A58    fild        dword ptr [esp+4]
 00494A5C    fdivr       dword ptr ds:[494A7C];1:Single
 00494A62    add         esp,0FFFFFFFC
 00494A65    fstp        dword ptr [esp]
 00494A68    wait
 00494A69    mov         eax,dword ptr [esp+4]
 00494A6D    call        0045D76C
 00494A72    pop         ecx
 00494A73    pop         edx
 00494A74    pop         ebp
 00494A75    pop         edi
 00494A76    pop         esi
 00494A77    pop         ebx
 00494A78    ret
end;*}

//00494A80
procedure TGLFreeForm.SetMaterialLibrary(Value:TGLMaterialLibrary);
begin
{*
 00494A80    push        ebx
 00494A81    push        esi
 00494A82    push        edi
 00494A83    mov         edi,edx
 00494A85    mov         ebx,eax
 00494A87    cmp         edi,dword ptr [ebx+9C];TGLFreeForm.?f9C:TGLMaterialLibrary
>00494A8D    je          00494ADE
 00494A8F    cmp         byte ptr [ebx+0BC],0;TGLFreeForm.?fBC:byte
>00494A96    je          00494A9F
 00494A98    mov         eax,ebx
 00494A9A    call        00494E20
 00494A9F    cmp         dword ptr [ebx+9C],0;TGLFreeForm.?f9C:TGLMaterialLibrary
>00494AA6    je          00494AC0
 00494AA8    mov         eax,ebx
 00494AAA    mov         si,0FFEF
 00494AAE    call        @CallDynaInst;TGLBaseMesh.sub_0047B63C
 00494AB3    mov         edx,ebx
 00494AB5    mov         eax,dword ptr [ebx+9C];TGLFreeForm.?f9C:TGLMaterialLibrary
 00494ABB    call        TComponent.RemoveFreeNotification
 00494AC0    mov         eax,edi
 00494AC2    mov         dword ptr [ebx+9C],eax;TGLFreeForm.?f9C:TGLMaterialLibrary
 00494AC8    test        eax,eax
>00494ACA    je          00494AD3
 00494ACC    mov         edx,ebx
 00494ACE    call        TComponent.FreeNotification
 00494AD3    mov         eax,ebx
 00494AD5    mov         si,0FFE7
 00494AD9    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00494ADE    pop         edi
 00494ADF    pop         esi
 00494AE0    pop         ebx
 00494AE1    ret
*}
end;

//00494AE4
procedure TGLFreeForm.SetLightmapLibrary(Value:TGLMaterialLibrary);
begin
{*
 00494AE4    push        ebx
 00494AE5    push        esi
 00494AE6    push        edi
 00494AE7    mov         edi,edx
 00494AE9    mov         ebx,eax
 00494AEB    mov         eax,dword ptr [ebx+0A0];TGLFreeForm.?fA0:TGLMaterialLibrary
 00494AF1    cmp         edi,eax
>00494AF3    je          00494B2F
 00494AF5    test        eax,eax
>00494AF7    je          00494B11
 00494AF9    mov         eax,ebx
 00494AFB    mov         si,0FFEF
 00494AFF    call        @CallDynaInst;TGLBaseMesh.sub_0047B63C
 00494B04    mov         edx,ebx
 00494B06    mov         eax,dword ptr [ebx+0A0];TGLFreeForm.?fA0:TGLMaterialLibrary
 00494B0C    call        TComponent.RemoveFreeNotification
 00494B11    mov         eax,edi
 00494B13    mov         dword ptr [ebx+0A0],eax;TGLFreeForm.?fA0:TGLMaterialLibrary
 00494B19    test        eax,eax
>00494B1B    je          00494B24
 00494B1D    mov         edx,ebx
 00494B1F    call        TComponent.FreeNotification
 00494B24    mov         eax,ebx
 00494B26    mov         si,0FFE7
 00494B2A    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00494B2F    pop         edi
 00494B30    pop         esi
 00494B31    pop         ebx
 00494B32    ret
*}
end;

//00494B34
procedure TGLFreeForm.SetNormalsOrientation(Value:TMeshNormalsOrientation);
begin
{*
 00494B34    push        esi
 00494B35    cmp         dl,byte ptr [eax+98];TGLFreeForm.?f98:byte
>00494B3B    je          00494B4C
 00494B3D    mov         byte ptr [eax+98],dl;TGLFreeForm.?f98:byte
 00494B43    mov         si,0FFE7
 00494B47    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00494B4C    pop         esi
 00494B4D    ret
*}
end;

//00494B50
procedure TGLActor.SetOverlaySkeleton(Value:Boolean);
begin
{*
 00494B50    push        esi
 00494B51    mov         esi,eax
 00494B53    cmp         dl,byte ptr [esi+0B5];TGLActor.?fB5:byte
>00494B59    je          00494B6A
 00494B5B    mov         byte ptr [esi+0B5],dl;TGLActor.?fB5:byte
 00494B61    mov         edx,esi
 00494B63    mov         eax,esi
 00494B65    mov         ecx,dword ptr [eax]
 00494B67    call        dword ptr [ecx+34];TGLActor.sub_0047DACC
 00494B6A    pop         esi
 00494B6B    ret
*}
end;

//00494B6C
procedure TGLBaseMesh.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00494B6C    push        ebx
 00494B6D    push        esi
 00494B6E    push        edi
 00494B6F    mov         ebx,ecx
 00494B71    mov         edi,edx
 00494B73    mov         esi,eax
 00494B75    cmp         bl,1
>00494B78    jne         00494B9E
 00494B7A    cmp         edi,dword ptr [esi+9C];TGLBaseMesh.?f9C:TGLMaterialLibrary
>00494B80    jne         00494B8D
 00494B82    xor         edx,edx
 00494B84    mov         eax,esi
 00494B86    call        TGLFreeForm.SetMaterialLibrary
>00494B8B    jmp         00494B9E
 00494B8D    cmp         edi,dword ptr [esi+0A0];TGLBaseMesh.?fA0:TGLMaterialLibrary
>00494B93    jne         00494B9E
 00494B95    xor         edx,edx
 00494B97    mov         eax,esi
 00494B99    call        TGLFreeForm.SetLightmapLibrary
 00494B9E    mov         ecx,ebx
 00494BA0    mov         edx,edi
 00494BA2    mov         eax,esi
 00494BA4    call        TComponent.Notification
 00494BA9    pop         edi
 00494BAA    pop         esi
 00494BAB    pop         ebx
 00494BAC    ret
*}
end;

//00494BB0
{*procedure sub_00494BB0(?:?);
begin
 00494BB0    push        ebx
 00494BB1    push        esi
 00494BB2    add         esp,0FFFFFFE8
 00494BB5    mov         esi,edx
 00494BB7    mov         ebx,eax
 00494BB9    fld         dword ptr [ebx+0A4];TGLBaseMesh.?fA4:Single
 00494BBF    fcomp       dword ptr ds:[494C64];0:Single
 00494BC5    fnstsw      al
 00494BC7    sahf
>00494BC8    jae         00494C50
 00494BCE    lea         ecx,[esp+0C]
 00494BD2    mov         edx,esp
 00494BD4    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494BDA    call        0049212C
 00494BDF    fld         dword ptr [esp]
 00494BE2    fabs
 00494BE4    add         esp,0FFFFFFF4
 00494BE7    fstp        tbyte ptr [esp]
 00494BEA    wait
 00494BEB    fld         dword ptr [esp+18]
 00494BEF    fabs
 00494BF1    add         esp,0FFFFFFF4
 00494BF4    fstp        tbyte ptr [esp]
 00494BF7    wait
 00494BF8    call        0045F6FC
 00494BFD    fstp        dword ptr [ebx+0A4];TGLBaseMesh.?fA4:Single
 00494C03    wait
 00494C04    fld         dword ptr [esp+4]
 00494C08    fabs
 00494C0A    add         esp,0FFFFFFF4
 00494C0D    fstp        tbyte ptr [esp]
 00494C10    wait
 00494C11    fld         dword ptr [esp+1C]
 00494C15    fabs
 00494C17    add         esp,0FFFFFFF4
 00494C1A    fstp        tbyte ptr [esp]
 00494C1D    wait
 00494C1E    call        0045F6FC
 00494C23    fstp        dword ptr [ebx+0A8];TGLBaseMesh.?fA8:Single
 00494C29    wait
 00494C2A    fld         dword ptr [esp+8]
 00494C2E    fabs
 00494C30    add         esp,0FFFFFFF4
 00494C33    fstp        tbyte ptr [esp]
 00494C36    wait
 00494C37    fld         dword ptr [esp+20]
 00494C3B    fabs
 00494C3D    add         esp,0FFFFFFF4
 00494C40    fstp        tbyte ptr [esp]
 00494C43    wait
 00494C44    call        0045F6FC
 00494C49    fstp        dword ptr [ebx+0AC];TGLBaseMesh.?fAC:Single
 00494C4F    wait
 00494C50    lea         edx,[ebx+0A4];TGLBaseMesh.?fA4:Single
 00494C56    mov         eax,esi
 00494C58    call        0045C9C0
 00494C5D    add         esp,18
 00494C60    pop         esi
 00494C61    pop         ebx
 00494C62    ret
end;*}

//00494C68
procedure TGLBaseMesh.sub_0047B63C;
begin
{*
 00494C68    push        ebx
 00494C69    mov         ebx,eax
 00494C6B    mov         eax,dword ptr [ebx+9C];TGLBaseMesh.?f9C:TGLMaterialLibrary
 00494C71    test        eax,eax
>00494C73    je          00494C7A
 00494C75    call        00477868
 00494C7A    mov         eax,dword ptr [ebx+0A0];TGLBaseMesh.?fA0:TGLMaterialLibrary
 00494C80    test        eax,eax
>00494C82    je          00494C89
 00494C84    call        00477868
 00494C89    mov         eax,ebx
 00494C8B    call        TGLCustomSceneObject.sub_0047B63C
 00494C90    pop         ebx
 00494C91    ret
*}
end;

//00494C94
{*procedure TGLBaseMesh.sub_00494C94(?:?);
begin
 00494C94    mov         al,byte ptr [eax+98];TGLBaseMesh.?f98:byte
 00494C9A    xchg        eax,edx
 00494C9B    mov         ecx,dword ptr [eax]
 00494C9D    call        dword ptr [ecx+14]
 00494CA0    ret
end;*}

//00494CA4
procedure TGLBaseMesh.sub_00494CA4;
begin
{*
 00494CA4    push        ebx
 00494CA5    add         esp,0FFFFFFD0
 00494CA8    mov         ebx,eax
 00494CAA    test        byte ptr [ebx+0B7],8;TGLBaseMesh.?fB7:byte
>00494CB1    je          00494CCB
 00494CB3    lea         edx,[esp+24]
 00494CB7    mov         eax,ebx
 00494CB9    call        004949F4
 00494CBE    lea         eax,[esp+24]
 00494CC2    mov         edx,esp
 00494CC4    call        0045D6FC
>00494CC9    jmp         00494D44
 00494CCB    lea         ecx,[esp+18]
 00494CCF    lea         edx,[esp+0C]
 00494CD3    mov         eax,ebx
 00494CD5    call        00494918
 00494CDA    test        byte ptr [ebx+0B7],1;TGLBaseMesh.?fB7:byte
>00494CE1    je          00494CF7
 00494CE3    fld         dword ptr [esp+0C]
 00494CE7    fadd        dword ptr [esp+18]
 00494CEB    fmul        dword ptr ds:[494D58];-0.5:Single
 00494CF1    fstp        dword ptr [esp]
 00494CF4    wait
>00494CF5    jmp         00494CFC
 00494CF7    xor         eax,eax
 00494CF9    mov         dword ptr [esp],eax
 00494CFC    test        byte ptr [ebx+0B7],2;TGLBaseMesh.?fB7:byte
>00494D03    je          00494D1A
 00494D05    fld         dword ptr [esp+10]
 00494D09    fadd        dword ptr [esp+1C]
 00494D0D    fmul        dword ptr ds:[494D58];-0.5:Single
 00494D13    fstp        dword ptr [esp+4]
 00494D17    wait
>00494D18    jmp         00494D20
 00494D1A    xor         eax,eax
 00494D1C    mov         dword ptr [esp+4],eax
 00494D20    test        byte ptr [ebx+0B7],4;TGLBaseMesh.?fB7:byte
>00494D27    je          00494D3E
 00494D29    fld         dword ptr [esp+14]
 00494D2D    fadd        dword ptr [esp+20]
 00494D31    fmul        dword ptr ds:[494D58];-0.5:Single
 00494D37    fstp        dword ptr [esp+8]
 00494D3B    wait
>00494D3C    jmp         00494D44
 00494D3E    xor         eax,eax
 00494D40    mov         dword ptr [esp+8],eax
 00494D44    mov         edx,esp
 00494D46    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494D4C    call        004921FC
 00494D51    add         esp,30
 00494D54    pop         ebx
 00494D55    ret
*}
end;

//00494D5C
procedure TGLBaseMesh.sub_00494D5C;
begin
{*
 00494D5C    push        ebx
 00494D5D    push        esi
 00494D5E    push        edi
 00494D5F    add         esp,0FFFFFFF4
 00494D62    mov         ebx,eax
 00494D64    mov         edx,dword ptr [ebx+0B8];TGLBaseMesh.?fB8:TGLCoordinates
 00494D6A    fld         dword ptr [edx+18];TGLCoordinates.X:Single
 00494D6D    fcomp       dword ptr ds:[494DE0];1:Single
 00494D73    fnstsw      al
 00494D75    sahf
>00494D76    jne         00494D94
 00494D78    fld         dword ptr [edx+1C];TGLCoordinates.Y:Single
 00494D7B    fcomp       dword ptr ds:[494DE0];1:Single
 00494D81    fnstsw      al
 00494D83    sahf
>00494D84    jne         00494D94
 00494D86    fld         dword ptr [edx+20];TGLCoordinates.Z:Single
 00494D89    fcomp       dword ptr ds:[494DE0];1:Single
 00494D8F    fnstsw      al
 00494D91    sahf
>00494D92    je          00494DD8
 00494D94    mov         eax,dword ptr [ebx+0B8];TGLBaseMesh.?fB8:TGLCoordinates
 00494D9A    push        dword ptr [eax+18];TGLCoordinates.X:Single
 00494D9D    push        dword ptr [edx+1C];TGLCoordinates.Y:Single
 00494DA0    push        dword ptr [edx+20];TGLCoordinates.Z:Single
 00494DA3    lea         eax,[esp+0C]
 00494DA7    call        0045CA34
 00494DAC    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494DB2    mov         esi,dword ptr [eax+0C];TMeshObjectList.?fC:dword
 00494DB5    dec         esi
 00494DB6    test        esi,esi
>00494DB8    jl          00494DD8
 00494DBA    inc         esi
 00494DBB    xor         edi,edi
 00494DBD    mov         edx,edi
 00494DBF    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494DC5    call        00492124
 00494DCA    mov         eax,dword ptr [eax+0C]
 00494DCD    mov         edx,esp
 00494DCF    call        00468E04
 00494DD4    inc         edi
 00494DD5    dec         esi
>00494DD6    jne         00494DBD
 00494DD8    add         esp,0C
 00494DDB    pop         edi
 00494DDC    pop         esi
 00494DDD    pop         ebx
 00494DDE    ret
*}
end;

//00494DE4
procedure TGLBaseMesh.sub_00494DE4;
begin
{*
 00494DE4    push        esi
 00494DE5    mov         si,0FFE7
 00494DE9    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00494DEE    pop         esi
 00494DEF    ret
*}
end;

//00494DF0
procedure sub_00494DF0(?:TGLBaseMesh);
begin
{*
 00494DF0    push        ebx
 00494DF1    mov         ebx,eax
 00494DF3    cmp         byte ptr [ebx+0BC],0
>00494DFA    je          00494E03
 00494DFC    mov         eax,ebx
 00494DFE    call        00494E20
 00494E03    mov         edx,dword ptr [ebx+9C]
 00494E09    mov         eax,dword ptr [ebx+0C8]
 00494E0F    call        00491F3C
 00494E14    mov         byte ptr [ebx+0BC],1
 00494E1B    pop         ebx
 00494E1C    ret
*}
end;

//00494E20
procedure sub_00494E20(?:TGLBaseMesh);
begin
{*
 00494E20    push        ebx
 00494E21    mov         ebx,eax
 00494E23    cmp         byte ptr [ebx+0BC],0;TGLBaseMesh.?fBC:byte
>00494E2A    je          00494E3E
 00494E2C    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494E32    call        00491F68
 00494E37    mov         byte ptr [ebx+0BC],0;TGLBaseMesh.?fBC:byte
 00494E3E    pop         ebx
 00494E3F    ret
*}
end;

//00494E40
procedure TGLBaseMesh.sub_00494E40;
begin
{*
 00494E40    push        ebx
 00494E41    mov         ebx,eax
 00494E43    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494E49    mov         ecx,dword ptr [eax]
 00494E4B    call        dword ptr [ecx+24];TMeshObjectList.sub_00491F8C
 00494E4E    mov         eax,dword ptr [ebx+0A0];TGLBaseMesh.?fA0:TGLMaterialLibrary
 00494E54    test        eax,eax
>00494E56    je          00494E60
 00494E58    mov         eax,dword ptr [eax+34];TGLMaterialLibrary.Materials:TGLLibMaterials
 00494E5B    call        0047773C
 00494E60    pop         ebx
 00494E61    ret
*}
end;

//00494E64
procedure TGLFreeForm.SetUseMeshMaterials(Value:Boolean);
begin
{*
 00494E64    push        ebx
 00494E65    push        esi
 00494E66    mov         ebx,eax
 00494E68    cmp         dl,byte ptr [ebx+0B4];TGLFreeForm.?fB4:byte
>00494E6E    je          00494E95
 00494E70    mov         byte ptr [ebx+0B4],dl;TGLFreeForm.?fB4:byte
 00494E76    cmp         byte ptr [ebx+0BC],0;TGLFreeForm.?fBC:byte
>00494E7D    je          00494E8A
 00494E7F    test        dl,dl
>00494E81    jne         00494E8A
 00494E83    mov         eax,ebx
 00494E85    call        00494E20
 00494E8A    mov         eax,ebx
 00494E8C    mov         si,0FFE7
 00494E90    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00494E95    pop         esi
 00494E96    pop         ebx
 00494E97    ret
*}
end;

//00494E98
procedure sub_00494E98;
begin
{*
 00494E98    mov         eax,dword ptr [eax+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 00494E9E    mov         ecx,dword ptr [eax]
 00494EA0    call        dword ptr [ecx+28];TMeshObjectList.sub_00491FC0
 00494EA3    ret
*}
end;

//00494EA4
{*procedure sub_00494EA4(?:?; ?:?; ?:?);
begin
 00494EA4    push        ebp
 00494EA5    mov         ebp,esp
 00494EA7    push        ecx
 00494EA8    push        ebx
 00494EA9    push        esi
 00494EAA    push        edi
 00494EAB    mov         byte ptr [ebp-1],cl
 00494EAE    mov         edi,edx
 00494EB0    mov         ebx,eax
 00494EB2    cmp         dword ptr [ebx+0A0],0;TGLBaseMesh.?fA0:TGLMaterialLibrary
>00494EB9    je          00494EC0
 00494EBB    call        0046A3B0
 00494EC0    cmp         byte ptr [ebp-1],0
>00494EC4    je          00494FF8
 00494ECA    mov         al,byte ptr [ebx+98];TGLBaseMesh.?f98:byte
 00494ED0    sub         al,1
>00494ED2    jb          00494EF6
>00494ED4    je          00494ED8
>00494ED6    jmp         00494EE2
 00494ED8    mov         eax,dword ptr [edi+5C]
 00494EDB    call        0046D950
>00494EE0    jmp         00494EF6
 00494EE2    mov         ecx,1886
 00494EE7    mov         edx,49503C;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00494EEC    mov         eax,495080;'Assertion failure'
 00494EF1    call        @Assert
 00494EF6    cmp         byte ptr [edi+0FA],0
>00494EFD    jne         00494FBE
 00494F03    cmp         byte ptr [ebx+0B4],0;TGLBaseMesh.?fB4:byte
>00494F0A    je          00494F30
 00494F0C    cmp         dword ptr [ebx+9C],0;TGLBaseMesh.?f9C:TGLMaterialLibrary
>00494F13    je          00494F30
 00494F15    mov         eax,dword ptr [ebx+9C];TGLBaseMesh.?f9C:TGLMaterialLibrary
 00494F1B    mov         dword ptr [edi+48],eax
 00494F1E    cmp         byte ptr [ebx+0BC],0;TGLBaseMesh.?fBC:byte
>00494F25    jne         00494F35
 00494F27    mov         eax,ebx
 00494F29    call        00494DF0
>00494F2E    jmp         00494F35
 00494F30    xor         eax,eax
 00494F32    mov         dword ptr [edi+48],eax
 00494F35    mov         eax,dword ptr [ebx+0A0];TGLBaseMesh.?fA0:TGLMaterialLibrary
 00494F3B    test        eax,eax
>00494F3D    je          00494F44
 00494F3F    mov         dword ptr [edi+4C],eax
>00494F42    jmp         00494F49
 00494F44    xor         eax,eax
 00494F46    mov         dword ptr [edi+4C],eax
 00494F49    cmp         byte ptr [edi+0FC],0
>00494F50    jne         00494F63
 00494F52    mov         eax,ebx
 00494F54    call        0047B620
 00494F59    test        al,al
>00494F5B    jne         00494F70
 00494F5D    test        byte ptr [ebx+3C],1;TGLBaseMesh.?f3C:byte
>00494F61    jne         00494F70
 00494F63    mov         edx,edi
 00494F65    mov         eax,ebx
 00494F67    mov         si,0FFE4
 00494F6B    call        @CallDynaInst;TGLBaseMesh.sub_00494E40
 00494F70    mov         edx,edi
 00494F72    mov         eax,dword ptr [ebx+90];TGLBaseMesh.?f90:TGLMaterial
 00494F78    call        00476434
 00494F7D    test        byte ptr [ebx+3C],1;TGLBaseMesh.?f3C:byte
>00494F81    jne         00494F8C
 00494F83    cmp         byte ptr [edi+0FC],0
>00494F8A    je          00494F97
 00494F8C    mov         edx,edi
 00494F8E    mov         eax,ebx
 00494F90    mov         ecx,dword ptr [eax]
 00494F92    call        dword ptr [ecx+64];TGLBaseMesh.sub_00494E98
>00494F95    jmp         00494FA6
 00494F97    mov         edx,edi
 00494F99    mov         eax,ebx
 00494F9B    mov         ecx,dword ptr [eax]
 00494F9D    call        dword ptr [ecx+44];TGLBaseMesh.sub_0047B5BC
 00494FA0    push        eax
 00494FA1    call        OpenGL32.glCallList
 00494FA6    mov         edx,edi
 00494FA8    mov         eax,dword ptr [ebx+90];TGLBaseMesh.?f90:TGLMaterial
 00494FAE    call        00476760
 00494FB3    test        al,al
>00494FB5    jne         00494F7D
 00494FB7    xor         eax,eax
 00494FB9    mov         dword ptr [edi+48],eax
>00494FBC    jmp         00494FE7
 00494FBE    test        byte ptr [ebx+3C],1;TGLBaseMesh.?f3C:byte
>00494FC2    jne         00494FCD
 00494FC4    cmp         byte ptr [edi+0FC],0
>00494FCB    je          00494FD8
 00494FCD    mov         edx,edi
 00494FCF    mov         eax,ebx
 00494FD1    mov         ecx,dword ptr [eax]
 00494FD3    call        dword ptr [ecx+64];TGLBaseMesh.sub_00494E98
>00494FD6    jmp         00494FE7
 00494FD8    mov         edx,edi
 00494FDA    mov         eax,ebx
 00494FDC    mov         ecx,dword ptr [eax]
 00494FDE    call        dword ptr [ecx+44];TGLBaseMesh.sub_0047B5BC
 00494FE1    push        eax
 00494FE2    call        OpenGL32.glCallList
 00494FE7    cmp         byte ptr [ebx+98],0;TGLBaseMesh.?f98:byte
>00494FEE    je          00494FF8
 00494FF0    mov         eax,dword ptr [edi+5C]
 00494FF3    call        0046D950
 00494FF8    cmp         dword ptr [ebx+0A0],0;TGLBaseMesh.?fA0:TGLMaterialLibrary
>00494FFF    je          00495006
 00495001    call        0046A3B8
 00495006    cmp         byte ptr [ebp+8],0
>0049500A    je          0049502B
 0049500C    mov         eax,ebx
 0049500E    call        0047BA94
 00495013    test        eax,eax
>00495015    jle         0049502B
 00495017    push        edi
 00495018    mov         eax,ebx
 0049501A    call        0047BA94
 0049501F    mov         ecx,eax
 00495021    dec         ecx
 00495022    xor         edx,edx
 00495024    mov         eax,ebx
 00495026    mov         ebx,dword ptr [eax]
 00495028    call        dword ptr [ebx+6C];TGLBaseMesh.sub_0047D7AC
 0049502B    pop         edi
 0049502C    pop         esi
 0049502D    pop         ebx
 0049502E    pop         ecx
 0049502F    pop         ebp
 00495030    ret         4
end;*}

//00495094
procedure TGLBaseMesh.sub_0047CEC8;
begin
{*
 00495094    push        ebx
 00495095    push        esi
 00495096    mov         ebx,eax
 00495098    mov         dword ptr [ebx+0A4],0BF800000;TGLBaseMesh.?fA4:Single
 004950A2    mov         eax,ebx
 004950A4    call        00494E20
 004950A9    mov         eax,dword ptr [ebx+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 004950AF    mov         si,0FFF2
 004950B3    call        @CallDynaInst;TMeshObjectList.sub_00492374
 004950B8    mov         eax,ebx
 004950BA    call        TGLBaseSceneObject.sub_0047CEC8
 004950BF    pop         esi
 004950C0    pop         ebx
 004950C1    ret
*}
end;

//004950C4
{*function sub_004950C4(?:?; ?:?; ?:?; ?:?):?;
begin
 004950C4    push        ebp
 004950C5    mov         ebp,esp
 004950C7    add         esp,0FFFFFFA0
 004950CA    push        ebx
 004950CB    push        esi
 004950CC    push        edi
 004950CD    mov         esi,ecx
 004950CF    mov         ebx,edx
 004950D1    mov         dword ptr [ebp-4],eax
 004950D4    mov         eax,dword ptr [ebp-4]
 004950D7    mov         eax,dword ptr [eax+0C8];TGLBaseMesh.?fC8:TMeshObjectList
 004950DD    xor         ecx,ecx
 004950DF    xor         edx,edx
 004950E1    call        00492230
 004950E6    mov         dword ptr [ebp-8],eax
 004950E9    xor         eax,eax
 004950EB    push        ebp
 004950EC    push        4951E5
 004950F1    push        dword ptr fs:[eax]
 004950F4    mov         dword ptr fs:[eax],esp
 004950F7    lea         ecx,[ebp-60]
 004950FA    mov         edx,ebx
 004950FC    mov         eax,dword ptr [ebp-4]
 004950FF    call        0047BD80
 00495104    lea         edx,[ebp-60]
 00495107    lea         eax,[ebp-20]
 0049510A    call        0045C9C0
 0049510F    lea         ecx,[ebp-60]
 00495112    mov         edx,esi
 00495114    mov         eax,dword ptr [ebp-4]
 00495117    call        0047BD80
 0049511C    lea         edx,[ebp-60]
 0049511F    lea         eax,[ebp-30]
 00495122    call        0045C9C0
 00495127    mov         dword ptr [ebp-10],0BF800000
 0049512E    xor         ebx,ebx
>00495130    jmp         004951C3
 00495135    lea         esi,[ebx+ebx*2]
 00495138    mov         eax,dword ptr [ebp-8]
 0049513B    mov         eax,dword ptr [eax+24]
 0049513E    lea         eax,[eax+esi*4+0C]
 00495142    push        eax
 00495143    mov         eax,dword ptr [ebp-8]
 00495146    mov         eax,dword ptr [eax+24]
 00495149    lea         eax,[eax+esi*4+18]
 0049514D    push        eax
 0049514E    lea         eax,[ebp-40]
 00495151    push        eax
 00495152    lea         eax,[ebp-50]
 00495155    push        eax
 00495156    mov         eax,dword ptr [ebp-8]
 00495159    mov         eax,dword ptr [eax+24]
 0049515C    lea         ecx,[eax+esi*4]
 0049515F    lea         edx,[ebp-30]
 00495162    lea         eax,[ebp-20]
 00495165    call        0045F94C
 0049516A    test        al,al
>0049516C    je          004951C0
 0049516E    lea         edx,[ebp-40]
 00495171    lea         eax,[ebp-20]
 00495174    call        0045D948
 00495179    fstp        dword ptr [ebp-0C]
 0049517C    wait
 0049517D    fld         dword ptr [ebp-0C]
 00495180    fcomp       dword ptr [ebp-10]
 00495183    fnstsw      al
 00495185    sahf
>00495186    jb          00495196
 00495188    fld         dword ptr [ebp-10]
 0049518B    fcomp       dword ptr ds:[495264];0:Single
 00495191    fnstsw      al
 00495193    sahf
>00495194    jae         004951C0
 00495196    mov         eax,dword ptr [ebp-0C]
 00495199    mov         dword ptr [ebp-10],eax
 0049519C    cmp         dword ptr [ebp+0C],0
>004951A0    je          004951AE
 004951A2    mov         eax,dword ptr [ebp+0C]
 004951A5    mov         edi,eax
 004951A7    lea         esi,[ebp-40]
 004951AA    movs        dword ptr [edi],dword ptr [esi]
 004951AB    movs        dword ptr [edi],dword ptr [esi]
 004951AC    movs        dword ptr [edi],dword ptr [esi]
 004951AD    movs        dword ptr [edi],dword ptr [esi]
 004951AE    cmp         dword ptr [ebp+8],0
>004951B2    je          004951C0
 004951B4    mov         eax,dword ptr [ebp+8]
 004951B7    mov         edi,eax
 004951B9    lea         esi,[ebp-50]
 004951BC    movs        dword ptr [edi],dword ptr [esi]
 004951BD    movs        dword ptr [edi],dword ptr [esi]
 004951BE    movs        dword ptr [edi],dword ptr [esi]
 004951BF    movs        dword ptr [edi],dword ptr [esi]
 004951C0    add         ebx,3
 004951C3    mov         eax,dword ptr [ebp-8]
 004951C6    cmp         ebx,dword ptr [eax+8]
>004951C9    jl          00495135
 004951CF    xor         eax,eax
 004951D1    pop         edx
 004951D2    pop         ecx
 004951D3    pop         ecx
 004951D4    mov         dword ptr fs:[eax],edx
 004951D7    push        4951EC
 004951DC    mov         eax,dword ptr [ebp-8]
 004951DF    call        TObject.Free
 004951E4    ret
>004951E5    jmp         @HandleFinally
>004951EA    jmp         004951DC
 004951EC    fld         dword ptr [ebp-10]
 004951EF    fcomp       dword ptr ds:[495264];0:Single
 004951F5    fnstsw      al
 004951F7    sahf
 004951F8    setae       bl
 004951FB    test        bl,bl
>004951FD    je          00495256
 004951FF    cmp         dword ptr [ebp+0C],0
>00495203    je          00495220
 00495205    lea         ecx,[ebp-60]
 00495208    mov         eax,dword ptr [ebp+0C]
 0049520B    mov         edx,eax
 0049520D    mov         eax,dword ptr [ebp-4]
 00495210    call        0047BDA0
 00495215    lea         edx,[ebp-60]
 00495218    mov         eax,dword ptr [ebp+0C]
 0049521B    call        0045C9C0
 00495220    cmp         dword ptr [ebp+8],0
>00495224    je          00495256
 00495226    lea         ecx,[ebp-60]
 00495229    mov         eax,dword ptr [ebp+8]
 0049522C    mov         edx,eax
 0049522E    mov         eax,dword ptr [ebp-4]
 00495231    call        0047BDA0
 00495236    lea         edx,[ebp-60]
 00495239    mov         esi,dword ptr [ebp+8]
 0049523C    mov         eax,esi
 0049523E    call        0045C9C0
 00495243    mov         eax,dword ptr [ebp-4]
 00495246    cmp         byte ptr [eax+98],1;TGLBaseMesh.?f98:byte
>0049524D    jne         00495256
 0049524F    mov         eax,esi
 00495251    call        0045D74C
 00495256    mov         eax,ebx
 00495258    pop         edi
 00495259    pop         esi
 0049525A    pop         ebx
 0049525B    mov         esp,ebp
 0049525D    pop         ebp
 0049525E    ret         8
end;*}

//00495268
{*function sub_00495268(?:?):?;
begin
 00495268    push        ebp
 00495269    mov         ebp,esp
 0049526B    add         esp,0FFFFFFF8
 0049526E    push        ebx
 0049526F    mov         ebx,edx
 00495271    xor         edx,edx
 00495273    mov         dword ptr [ebp-8],edx
 00495276    mov         edx,dword ptr [eax+0C0];TGLBaseMesh.?fC0:dword
 0049527C    test        edx,edx
>0049527E    je          00495294
 00495280    mov         dword ptr [ebp-4],edx
 00495283    push        1
 00495285    lea         ecx,[ebp-8]
 00495288    mov         edx,ebx
 0049528A    mov         eax,dword ptr [ebp-4]
 0049528D    mov         ebx,dword ptr [eax]
 0049528F    call        dword ptr [ebx+8]
>00495292    jmp         004952DF
 00495294    mov         ecx,eax
 00495296    mov         dl,1
 00495298    mov         eax,[0048C254];TGLBaseMeshConnectivity
 0049529D    call        TGLBaseMeshConnectivity.Create;TGLBaseMeshConnectivity.Create
 004952A2    mov         dword ptr [ebp-4],eax
 004952A5    xor         eax,eax
 004952A7    push        ebp
 004952A8    push        4952D8
 004952AD    push        dword ptr fs:[eax]
 004952B0    mov         dword ptr fs:[eax],esp
 004952B3    push        1
 004952B5    lea         ecx,[ebp-8]
 004952B8    mov         edx,ebx
 004952BA    mov         eax,dword ptr [ebp-4]
 004952BD    mov         ebx,dword ptr [eax]
 004952BF    call        dword ptr [ebx+8];TGLBaseMeshConnectivity.sub_0048C7B0
 004952C2    xor         eax,eax
 004952C4    pop         edx
 004952C5    pop         ecx
 004952C6    pop         ecx
 004952C7    mov         dword ptr fs:[eax],edx
 004952CA    push        4952DF
 004952CF    mov         eax,dword ptr [ebp-4]
 004952D2    call        TObject.Free
 004952D7    ret
>004952D8    jmp         @HandleFinally
>004952DD    jmp         004952CF
 004952DF    mov         eax,dword ptr [ebp-8]
 004952E2    pop         ebx
 004952E3    pop         ecx
 004952E4    pop         ecx
 004952E5    pop         ebp
 004952E6    ret
end;*}

//004952E8
constructor TGLFreeForm.Create(AOwner:TComponent);
begin
{*
 004952E8    push        ebx
 004952E9    push        esi
 004952EA    test        dl,dl
>004952EC    je          004952F6
 004952EE    add         esp,0FFFFFFF0
 004952F1    call        @ClassCreate
 004952F6    mov         ebx,edx
 004952F8    mov         esi,eax
 004952FA    xor         edx,edx
 004952FC    mov         eax,esi
 004952FE    call        TGLBaseMesh.Create
 00495303    mov         byte ptr [esi+0B4],1;TGLFreeForm.?fB4:byte
 0049530A    mov         eax,esi
 0049530C    test        bl,bl
>0049530E    je          0049531F
 00495310    call        @AfterConstruction
 00495315    pop         dword ptr fs:[0]
 0049531C    add         esp,0C
 0049531F    mov         eax,esi
 00495321    pop         esi
 00495322    pop         ebx
 00495323    ret
*}
end;

//00495324
destructor TGLFreeForm.Destroy;
begin
{*
 00495324    push        ebx
 00495325    push        esi
 00495326    call        @BeforeDestruction
 0049532B    mov         ebx,edx
 0049532D    mov         esi,eax
 0049532F    mov         eax,dword ptr [esi+0D0];TGLFreeForm.?fD0:dword
 00495335    call        TObject.Free
 0049533A    mov         edx,ebx
 0049533C    and         dl,0FC
 0049533F    mov         eax,esi
 00495341    call        TGLBaseMesh.Destroy
 00495346    test        bl,bl
>00495348    jle         00495351
 0049534A    mov         eax,esi
 0049534C    call        @ClassDestroy
 00495351    pop         esi
 00495352    pop         ebx
 00495353    ret
*}
end;

//00495354
constructor TActorAnimation.Create(Collection:TCollection);
begin
{*
 00495354    push        ebx
 00495355    push        esi
 00495356    test        dl,dl
>00495358    je          00495362
 0049535A    add         esp,0FFFFFFF0
 0049535D    call        @ClassCreate
 00495362    mov         ebx,edx
 00495364    mov         esi,eax
 00495366    xor         edx,edx
 00495368    mov         eax,esi
 0049536A    call        TCollectionItem.Create
 0049536F    mov         eax,esi
 00495371    test        bl,bl
>00495373    je          00495384
 00495375    call        @AfterConstruction
 0049537A    pop         dword ptr fs:[0]
 00495381    add         esp,0C
 00495384    mov         eax,esi
 00495386    pop         esi
 00495387    pop         ebx
 00495388    ret
*}
end;

//0049538C
destructor TActorAnimation.Destroy;
begin
{*
 0049538C    push        ebx
 0049538D    push        esi
 0049538E    call        @BeforeDestruction
 00495393    mov         ebx,edx
 00495395    mov         esi,eax
 00495397    mov         eax,dword ptr [esi+4];TActorAnimation.FCollection:TCollection
 0049539A    mov         edx,dword ptr ds:[48E15C];TActorAnimations
 004953A0    call        @AsClass
 004953A5    mov         eax,dword ptr [eax+18];TActorAnimations.?f18:dword
 004953A8    cmp         esi,dword ptr [eax+10C]
>004953AE    jne         004953B8
 004953B0    xor         edx,edx
 004953B2    mov         dword ptr [eax+10C],edx
 004953B8    mov         edx,ebx
 004953BA    and         dl,0FC
 004953BD    mov         eax,esi
 004953BF    call        TCollectionItem.Destroy
 004953C4    test        bl,bl
>004953C6    jle         004953CF
 004953C8    mov         eax,esi
 004953CA    call        @ClassDestroy
 004953CF    pop         esi
 004953D0    pop         ebx
 004953D1    ret
*}
end;

//004953D4
procedure TActorAnimation.Assign(Source:TPersistent);
begin
{*
 004953D4    push        ebx
 004953D5    push        esi
 004953D6    push        edi
 004953D7    mov         esi,edx
 004953D9    mov         ebx,eax
 004953DB    mov         eax,esi
 004953DD    mov         edx,dword ptr ds:[48E00C];TActorAnimation
 004953E3    call        @IsClass
 004953E8    test        al,al
>004953EA    je          0049540D
 004953EC    lea         eax,[ebx+0C];TActorAnimation.Name:String
 004953EF    mov         edi,esi
 004953F1    mov         edx,dword ptr [edi+0C]
 004953F4    call        @LStrAsg
 004953F9    mov         eax,dword ptr [edi+10]
 004953FC    mov         dword ptr [ebx+10],eax;TActorAnimation.StartFrame:Integer
 004953FF    mov         eax,dword ptr [edi+14]
 00495402    mov         dword ptr [ebx+14],eax;TActorAnimation.EndFrame:Integer
 00495405    mov         al,byte ptr [edi+18]
 00495408    mov         byte ptr [ebx+18],al;TActorAnimation.Reference:TActorAnimationReference
>0049540B    jmp         00495416
 0049540D    mov         edx,esi
 0049540F    mov         eax,ebx
 00495411    call        TPersistent.Assign
 00495416    pop         edi
 00495417    pop         esi
 00495418    pop         ebx
 00495419    ret
*}
end;

//0049541C
{*procedure TActorAnimation.GetDisplayName(?:?);
begin
 0049541C    push        ebx
 0049541D    push        esi
 0049541E    add         esp,0FFFFFFE0
 00495421    mov         esi,edx
 00495423    mov         ebx,eax
 00495425    push        esi
 00495426    mov         eax,ebx
 00495428    call        TCollectionItem.GetIndex
 0049542D    mov         dword ptr [esp+4],eax
 00495431    mov         byte ptr [esp+8],0
 00495436    mov         eax,dword ptr [ebx+0C];TActorAnimation.Name:String
 00495439    mov         dword ptr [esp+0C],eax
 0049543D    mov         byte ptr [esp+10],0B
 00495442    mov         eax,dword ptr [ebx+10];TActorAnimation.StartFrame:Integer
 00495445    mov         dword ptr [esp+14],eax
 00495449    mov         byte ptr [esp+18],0
 0049544E    mov         eax,dword ptr [ebx+14];TActorAnimation.EndFrame:Integer
 00495451    mov         dword ptr [esp+1C],eax
 00495455    mov         byte ptr [esp+20],0
 0049545A    lea         edx,[esp+4]
 0049545E    mov         ecx,3
 00495463    mov         eax,49547C;'%d - %s [%d - %d]'
 00495468    call        Format
 0049546D    add         esp,20
 00495470    pop         esi
 00495471    pop         ebx
 00495472    ret
end;*}

//00495490
{*function sub_00495490(?:TActorAnimation):?;
begin
 00495490    push        ebx
 00495491    mov         dl,byte ptr [eax+18]
 00495494    sub         dl,1
>00495497    jb          0049549D
>00495499    je          004954B2
>0049549B    jmp         004954C6
 0049549D    mov         eax,dword ptr [eax+4]
 004954A0    mov         eax,dword ptr [eax+18]
 004954A3    mov         eax,dword ptr [eax+0C8]
 004954A9    call        00492090
 004954AE    mov         ebx,eax
>004954B0    jmp         004954DC
 004954B2    mov         eax,dword ptr [eax+4]
 004954B5    mov         eax,dword ptr [eax+18]
 004954B8    mov         eax,dword ptr [eax+0CC]
 004954BE    mov         eax,dword ptr [eax+10]
 004954C1    mov         ebx,dword ptr [eax+0C]
>004954C4    jmp         004954DC
 004954C6    xor         ebx,ebx
 004954C8    mov         ecx,1A05
 004954CD    mov         edx,4954E8;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 004954D2    mov         eax,49552C;'Assertion failure'
 004954D7    call        @Assert
 004954DC    mov         eax,ebx
 004954DE    pop         ebx
 004954DF    ret
end;*}

//00495540
procedure TActorAnimation.SetStartFrame(Value:Integer);
begin
{*
 00495540    push        ebx
 00495541    push        esi
 00495542    mov         esi,edx
 00495544    mov         ebx,eax
 00495546    test        esi,esi
>00495548    jge         00495551
 0049554A    xor         eax,eax
 0049554C    mov         dword ptr [ebx+10],eax;TActorAnimation.StartFrame:Integer
>0049554F    jmp         00495565
 00495551    mov         eax,ebx
 00495553    call        00495490
 00495558    cmp         eax,esi
>0049555A    jg          00495562
 0049555C    dec         eax
 0049555D    mov         dword ptr [ebx+10],eax;TActorAnimation.StartFrame:Integer
>00495560    jmp         00495565
 00495562    mov         dword ptr [ebx+10],esi;TActorAnimation.StartFrame:Integer
 00495565    mov         eax,dword ptr [ebx+10];TActorAnimation.StartFrame:Integer
 00495568    cmp         eax,dword ptr [ebx+14];TActorAnimation.EndFrame:Integer
>0049556B    jle         00495570
 0049556D    mov         dword ptr [ebx+14],eax;TActorAnimation.EndFrame:Integer
 00495570    pop         esi
 00495571    pop         ebx
 00495572    ret
*}
end;

//00495574
procedure TActorAnimation.SetEndFrame(Value:Integer);
begin
{*
 00495574    push        ebx
 00495575    push        esi
 00495576    mov         esi,edx
 00495578    mov         ebx,eax
 0049557A    test        esi,esi
>0049557C    jge         00495585
 0049557E    xor         eax,eax
 00495580    mov         dword ptr [ebx+14],eax;TActorAnimation.EndFrame:Integer
>00495583    jmp         00495599
 00495585    mov         eax,ebx
 00495587    call        00495490
 0049558C    cmp         eax,esi
>0049558E    jg          00495596
 00495590    dec         eax
 00495591    mov         dword ptr [ebx+14],eax;TActorAnimation.EndFrame:Integer
>00495594    jmp         00495599
 00495596    mov         dword ptr [ebx+14],esi;TActorAnimation.EndFrame:Integer
 00495599    mov         eax,dword ptr [ebx+14];TActorAnimation.EndFrame:Integer
 0049559C    cmp         eax,dword ptr [ebx+10];TActorAnimation.StartFrame:Integer
>0049559F    jge         004955A4
 004955A1    mov         dword ptr [ebx+10],eax;TActorAnimation.StartFrame:Integer
 004955A4    pop         esi
 004955A5    pop         ebx
 004955A6    ret
*}
end;

//004955A8
procedure TActorAnimation.SetReference(Value:TActorAnimationReference);
begin
{*
 004955A8    push        ebx
 004955A9    mov         ebx,eax
 004955AB    cmp         dl,byte ptr [ebx+18];TActorAnimation.Reference:TActorAnimationReference
>004955AE    je          004955C7
 004955B0    mov         byte ptr [ebx+18],dl;TActorAnimation.Reference:TActorAnimationReference
 004955B3    mov         edx,dword ptr [ebx+10];TActorAnimation.StartFrame:Integer
 004955B6    mov         eax,ebx
 004955B8    call        TActorAnimation.SetStartFrame
 004955BD    mov         edx,dword ptr [ebx+14];TActorAnimation.EndFrame:Integer
 004955C0    mov         eax,ebx
 004955C2    call        TActorAnimation.SetEndFrame
 004955C7    pop         ebx
 004955C8    ret
*}
end;

//004955F0
constructor TActorAnimations.Create;
begin
{*
 004955F0    push        ebx
 004955F1    push        esi
 004955F2    test        dl,dl
>004955F4    je          004955FE
 004955F6    add         esp,0FFFFFFF0
 004955F9    call        @ClassCreate
 004955FE    mov         ebx,edx
 00495600    mov         esi,eax
 00495602    mov         dword ptr [esi+18],ecx
 00495605    mov         ecx,dword ptr ds:[48E00C];TActorAnimation
 0049560B    xor         edx,edx
 0049560D    mov         eax,esi
 0049560F    call        TCollection.Create
 00495614    mov         eax,esi
 00495616    test        bl,bl
>00495618    je          00495629
 0049561A    call        @AfterConstruction
 0049561F    pop         dword ptr fs:[0]
 00495626    add         esp,0C
 00495629    mov         eax,esi
 0049562B    pop         esi
 0049562C    pop         ebx
 0049562D    ret
*}
end;

//00495630
procedure TActorAnimations.sub_0041ADA4;
begin
{*
 00495630    mov         eax,dword ptr [eax+18];TActorAnimations.?f18:dword
 00495633    ret
*}
end;

//00495634
{*function sub_00495634(?:?; ?:?):?;
begin
 00495634    push        ebx
 00495635    push        esi
 00495636    mov         esi,edx
 00495638    mov         ebx,eax
 0049563A    mov         edx,esi
 0049563C    mov         eax,ebx
 0049563E    call        TCollection.GetItem
 00495643    pop         esi
 00495644    pop         ebx
 00495645    ret
end;*}

//00495648
{*function sub_00495648(?:?):?;
begin
 00495648    push        ebx
 00495649    mov         ebx,eax
 0049564B    mov         eax,ebx
 0049564D    call        TCollection.Add
 00495652    mov         edx,dword ptr ds:[48E00C];TActorAnimation
 00495658    call        @AsClass
 0049565D    pop         ebx
 0049565E    ret
end;*}

//00495660
{*function sub_00495660(?:TActorAnimations; ?:String):?;
begin
 00495660    push        ebx
 00495661    push        esi
 00495662    push        edi
 00495663    push        ebp
 00495664    push        ecx
 00495665    mov         ebp,edx
 00495667    mov         edi,eax
 00495669    xor         eax,eax
 0049566B    mov         dword ptr [esp],eax
 0049566E    mov         eax,edi
 00495670    call        TCollection.GetCount
 00495675    mov         esi,eax
 00495677    dec         esi
 00495678    test        esi,esi
>0049567A    jl          004956A8
 0049567C    inc         esi
 0049567D    xor         ebx,ebx
 0049567F    mov         edx,ebx
 00495681    mov         eax,edi
 00495683    call        00495634
 00495688    mov         eax,dword ptr [eax+0C]
 0049568B    mov         edx,ebp
 0049568D    call        CompareText
 00495692    test        eax,eax
>00495694    jne         004956A4
 00495696    mov         edx,ebx
 00495698    mov         eax,edi
 0049569A    call        00495634
 0049569F    mov         dword ptr [esp],eax
>004956A2    jmp         004956A8
 004956A4    inc         ebx
 004956A5    dec         esi
>004956A6    jne         0049567F
 004956A8    mov         eax,dword ptr [esp]
 004956AB    pop         edx
 004956AC    pop         ebp
 004956AD    pop         edi
 004956AE    pop         esi
 004956AF    pop         ebx
 004956B0    ret
end;*}

//004956B4
{*function sub_004956B4(?:?; ?:?; ?:?):?;
begin
 004956B4    push        ebx
 004956B5    push        esi
 004956B6    push        edi
 004956B7    push        ebp
 004956B8    add         esp,0FFFFFFF8
 004956BB    mov         byte ptr [esp],cl
 004956BE    mov         ebp,edx
 004956C0    mov         edi,eax
 004956C2    xor         eax,eax
 004956C4    mov         dword ptr [esp+4],eax
 004956C8    mov         eax,edi
 004956CA    call        TCollection.GetCount
 004956CF    mov         esi,eax
 004956D1    dec         esi
 004956D2    test        esi,esi
>004956D4    jl          00495707
 004956D6    inc         esi
 004956D7    xor         ebx,ebx
 004956D9    mov         edx,ebx
 004956DB    mov         eax,edi
 004956DD    call        00495634
 004956E2    cmp         ebp,dword ptr [eax+10]
>004956E5    jl          00495703
 004956E7    cmp         ebp,dword ptr [eax+14]
>004956EA    jg          00495703
 004956EC    mov         al,byte ptr [eax+18]
 004956EF    cmp         al,byte ptr [esp]
>004956F2    jne         00495703
 004956F4    mov         edx,ebx
 004956F6    mov         eax,edi
 004956F8    call        00495634
 004956FD    mov         dword ptr [esp+4],eax
>00495701    jmp         00495707
 00495703    inc         ebx
 00495704    dec         esi
>00495705    jne         004956D9
 00495707    mov         eax,dword ptr [esp+4]
 0049570B    pop         ecx
 0049570C    pop         edx
 0049570D    pop         ebp
 0049570E    pop         edi
 0049570F    pop         esi
 00495710    pop         ebx
 00495711    ret
end;*}

//00495714
constructor TGLBaseAnimationControler.Create(AOwner:TComponent);
begin
{*
 00495714    push        ebx
 00495715    push        esi
 00495716    test        dl,dl
>00495718    je          00495722
 0049571A    add         esp,0FFFFFFF0
 0049571D    call        @ClassCreate
 00495722    mov         ebx,edx
 00495724    mov         esi,eax
 00495726    xor         edx,edx
 00495728    mov         eax,esi
 0049572A    call        TComponent.Create
 0049572F    mov         byte ptr [esi+30],1;TGLBaseAnimationControler.Enabled:Boolean
 00495733    mov         eax,esi
 00495735    test        bl,bl
>00495737    je          00495748
 00495739    call        @AfterConstruction
 0049573E    pop         dword ptr fs:[0]
 00495745    add         esp,0C
 00495748    mov         eax,esi
 0049574A    pop         esi
 0049574B    pop         ebx
 0049574C    ret
*}
end;

//00495750
destructor TGLBaseAnimationControler.Destroy;
begin
{*
 00495750    push        ebx
 00495751    push        esi
 00495752    call        @BeforeDestruction
 00495757    mov         ebx,edx
 00495759    mov         esi,eax
 0049575B    xor         edx,edx
 0049575D    mov         eax,esi
 0049575F    call        TGLBaseAnimationControler.SetActor
 00495764    mov         edx,ebx
 00495766    and         dl,0FC
 00495769    mov         eax,esi
 0049576B    call        TComponent.Destroy
 00495770    test        bl,bl
>00495772    jle         0049577B
 00495774    mov         eax,esi
 00495776    call        @ClassDestroy
 0049577B    pop         esi
 0049577C    pop         ebx
 0049577D    ret
*}
end;

//00495780
procedure TGLBaseAnimationControler.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00495780    push        ebx
 00495781    push        esi
 00495782    push        edi
 00495783    mov         ebx,ecx
 00495785    mov         esi,edx
 00495787    mov         edi,eax
 00495789    cmp         esi,dword ptr [edi+34];TGLBaseAnimationControler.Actor:TGLActor
>0049578C    jne         0049579C
 0049578E    cmp         bl,1
>00495791    jne         0049579C
 00495793    xor         edx,edx
 00495795    mov         eax,edi
 00495797    call        TGLBaseAnimationControler.SetActor
 0049579C    mov         ecx,ebx
 0049579E    mov         edx,esi
 004957A0    mov         eax,edi
 004957A2    call        TComponent.Notification
 004957A7    pop         edi
 004957A8    pop         esi
 004957A9    pop         ebx
 004957AA    ret
*}
end;

//004957AC
procedure sub_004957AC;
begin
{*
 004957AC    push        esi
 004957AD    mov         esi,dword ptr [eax+34];TGLBaseAnimationControler.Actor:TGLActor
 004957B0    test        esi,esi
>004957B2    je          004957BD
 004957B4    mov         edx,eax
 004957B6    mov         eax,esi
 004957B8    mov         ecx,dword ptr [eax]
 004957BA    call        dword ptr [ecx+34];TGLActor.sub_0047DACC
 004957BD    pop         esi
 004957BE    ret
*}
end;

//004957C0
procedure TGLBaseAnimationControler.SetEnabled(Value:Boolean);
begin
{*
 004957C0    cmp         dl,byte ptr [eax+30];TGLBaseAnimationControler.Enabled:Boolean
>004957C3    je          004957D3
 004957C5    mov         byte ptr [eax+30],dl;TGLBaseAnimationControler.Enabled:Boolean
 004957C8    cmp         dword ptr [eax+34],0;TGLBaseAnimationControler.Actor:TGLActor
>004957CC    je          004957D3
 004957CE    mov         edx,dword ptr [eax]
 004957D0    call        dword ptr [edx+30];TGLBaseAnimationControler.sub_004957AC
 004957D3    ret
*}
end;

//004957D4
procedure TGLBaseAnimationControler.SetActor(Value:TGLActor);
begin
{*
 004957D4    push        ebx
 004957D5    push        esi
 004957D6    mov         esi,edx
 004957D8    mov         ebx,eax
 004957DA    mov         eax,dword ptr [ebx+34];TGLBaseAnimationControler.Actor:TGLActor
 004957DD    cmp         esi,eax
>004957DF    je          00495803
 004957E1    test        eax,eax
>004957E3    je          004957EC
 004957E5    mov         edx,ebx
 004957E7    call        00495A94
 004957EC    mov         eax,esi
 004957EE    mov         dword ptr [ebx+34],eax;TGLBaseAnimationControler.Actor:TGLActor
 004957F1    test        eax,eax
>004957F3    je          00495803
 004957F5    mov         edx,ebx
 004957F7    call        00495A58
 004957FC    mov         eax,ebx
 004957FE    mov         edx,dword ptr [eax]
 00495800    call        dword ptr [edx+30];TGLBaseAnimationControler.sub_004957AC
 00495803    pop         esi
 00495804    pop         ebx
 00495805    ret
*}
end;

//00495808
{*function sub_00495808:?;
begin
 00495808    xor         eax,eax
 0049580A    ret
end;*}

//0049580C
procedure sub_0049580C;
begin
{*
 0049580C    push        ebx
 0049580D    mov         ebx,eax
 0049580F    cmp         dword ptr [ebx+38],0;TGLAnimationControler.AnimationName:String
>00495813    je          0049581C
 00495815    mov         eax,ebx
 00495817    call        004957AC
 0049581C    pop         ebx
 0049581D    ret
*}
end;

//00495820
procedure TGLAnimationControler.SetAnimationName(Value:String);
begin
{*
 00495820    push        ebx
 00495821    push        esi
 00495822    mov         esi,edx
 00495824    mov         ebx,eax
 00495826    mov         eax,dword ptr [ebx+38];TGLAnimationControler.AnimationName:String
 00495829    mov         edx,esi
 0049582B    call        @LStrCmp
>00495830    je          00495843
 00495832    lea         eax,[ebx+38];TGLAnimationControler.AnimationName:String
 00495835    mov         edx,esi
 00495837    call        @LStrAsg
 0049583C    mov         eax,ebx
 0049583E    mov         edx,dword ptr [eax]
 00495840    call        dword ptr [edx+30];TGLAnimationControler.sub_0049580C
 00495843    pop         esi
 00495844    pop         ebx
 00495845    ret
*}
end;

//00495848
{*procedure TGLAnimationControler.SetRatio(Value:Single; ?:?);
begin
 00495848    push        ebp
 00495849    mov         ebp,esp
 0049584B    push        ebx
 0049584C    mov         ebx,eax
 0049584E    fld         dword ptr [ebx+3C];TGLAnimationControler.Ratio:Single
 00495851    fcomp       dword ptr [ebp+8]
 00495854    fnstsw      al
 00495856    sahf
>00495857    je          00495873
 00495859    push        dword ptr [ebp+8]
 0049585C    push        0
 0049585E    push        3F800000
 00495863    call        0045F7C4
 00495868    fstp        dword ptr [ebx+3C];TGLAnimationControler.Ratio:Single
 0049586B    wait
 0049586C    mov         eax,ebx
 0049586E    mov         edx,dword ptr [eax]
 00495870    call        dword ptr [edx+30];TGLAnimationControler.sub_0049580C
 00495873    pop         ebx
 00495874    pop         ebp
 00495875    ret         4
end;*}

//00495878
{*function sub_00495878(?:?):?;
begin
 00495878    push        ebx
 00495879    push        esi
 0049587A    push        edi
 0049587B    add         esp,0FFFFFFF8
 0049587E    mov         edi,edx
 00495880    mov         esi,eax
 00495882    cmp         byte ptr [esi+30],0;TGLAnimationControler.Enabled:Boolean
>00495886    jne         0049588F
 00495888    xor         ebx,ebx
>0049588A    jmp         00495935
 0049588F    mov         eax,dword ptr [esi+34];TGLAnimationControler.Actor:TGLActor
 00495892    mov         eax,dword ptr [eax+108];TGLActor.Animations:TActorAnimations
 00495898    mov         edx,dword ptr [esi+38];TGLAnimationControler.AnimationName:String
 0049589B    call        00495660
 004958A0    mov         edx,eax
 004958A2    test        edx,edx
 004958A4    setne       bl
 004958A7    test        bl,bl
>004958A9    je          00495935
 004958AF    fld         dword ptr [esi+3C];TGLAnimationControler.Ratio:Single
 004958B2    fcomp       dword ptr ds:[495940];0:Single
 004958B8    fnstsw      al
 004958BA    sahf
>004958BB    jne         004958CC
 004958BD    mov         eax,dword ptr [edx+10]
 004958C0    mov         dword ptr [edi],eax
 004958C2    mov         dword ptr [edi+4],eax
 004958C5    xor         eax,eax
 004958C7    mov         dword ptr [edi+8],eax
>004958CA    jmp         00495924
 004958CC    fld         dword ptr [esi+3C];TGLAnimationControler.Ratio:Single
 004958CF    fcomp       dword ptr ds:[495944];1:Single
 004958D5    fnstsw      al
 004958D7    sahf
>004958D8    jne         004958E9
 004958DA    mov         eax,dword ptr [edx+14]
 004958DD    mov         dword ptr [edi],eax
 004958DF    mov         dword ptr [edi+4],eax
 004958E2    xor         eax,eax
 004958E4    mov         dword ptr [edi+8],eax
>004958E7    jmp         00495924
 004958E9    mov         ecx,dword ptr [edx+14]
 004958EC    mov         eax,dword ptr [edx+10]
 004958EF    sub         ecx,eax
 004958F1    mov         dword ptr [esp],ecx
 004958F4    fild        dword ptr [esp]
 004958F7    fmul        dword ptr [esi+3C];TGLAnimationControler.Ratio:Single
 004958FA    mov         dword ptr [esp+4],eax
 004958FE    fild        dword ptr [esp+4]
 00495902    faddp       st(1),st
 00495904    fstp        dword ptr [edi+8]
 00495907    wait
 00495908    push        dword ptr [edi+8]
 0049590B    call        0045F688
 00495910    mov         esi,eax
 00495912    mov         dword ptr [edi],esi
 00495914    inc         esi
 00495915    mov         dword ptr [edi+4],esi
 00495918    push        dword ptr [edi+8]
 0049591B    call        0045F6C8
 00495920    fstp        dword ptr [edi+8]
 00495923    wait
 00495924    mov         dword ptr [edi+0C],3F800000
 0049592B    xor         eax,eax
 0049592D    mov         dword ptr [edi+14],eax
 00495930    xor         eax,eax
 00495932    mov         dword ptr [edi+18],eax
 00495935    mov         eax,ebx
 00495937    pop         ecx
 00495938    pop         edx
 00495939    pop         edi
 0049593A    pop         esi
 0049593B    pop         ebx
 0049593C    ret
end;*}

//00495948
constructor TGLActor.Create(AOwner:TComponent);
begin
{*
 00495948    push        ebx
 00495949    push        esi
 0049594A    test        dl,dl
>0049594C    je          00495956
 0049594E    add         esp,0FFFFFFF0
 00495951    call        @ClassCreate
 00495956    mov         ebx,edx
 00495958    mov         esi,eax
 0049595A    xor         edx,edx
 0049595C    mov         eax,esi
 0049595E    call        TGLBaseMesh.Create
 00495963    mov         al,byte ptr [esi+3C];TGLActor.?f3C:byte
 00495966    or          al,byte ptr ds:[4959C8];0x1 gvar_004959C8
 0049596C    mov         byte ptr [esi+3C],al;TGLActor.?f3C:byte
 0049596F    mov         byte ptr [esi+0E4],1;TGLActor.FrameInterpolation:TActorFrameInterpolation
 00495976    mov         byte ptr [esi+0EC],0;TGLActor.AnimationMode:TActorAnimationMode
 0049597D    mov         dword ptr [esi+0E8],64;TGLActor.Interval:Integer
 00495987    mov         ecx,esi
 00495989    mov         dl,1
 0049598B    mov         eax,[0048E15C];TActorAnimations
 00495990    call        TActorAnimations.Create;TActorAnimations.Create
 00495995    mov         dword ptr [esi+108],eax;TGLActor.Animations:TActorAnimations
 0049599B    xor         eax,eax
 0049599D    mov         dword ptr [esi+110],eax;TGLActor.?f110:TList
 004959A3    mov         al,[004959C8];0x1 gvar_004959C8
 004959A8    mov         byte ptr [esi+114],al;TGLActor.Options:TGLActorOptions
 004959AE    mov         eax,esi
 004959B0    test        bl,bl
>004959B2    je          004959C3
 004959B4    call        @AfterConstruction
 004959B9    pop         dword ptr fs:[0]
 004959C0    add         esp,0C
 004959C3    mov         eax,esi
 004959C5    pop         esi
 004959C6    pop         ebx
 004959C7    ret
*}
end;

//004959CC
destructor TGLActor.Destroy;
begin
{*
 004959CC    push        ebx
 004959CD    push        esi
 004959CE    call        @BeforeDestruction
 004959D3    mov         ebx,edx
 004959D5    mov         esi,eax
 004959D7    mov         edx,ebx
 004959D9    and         dl,0FC
 004959DC    mov         eax,esi
 004959DE    call        TGLBaseMesh.Destroy
 004959E3    mov         eax,dword ptr [esi+110];TGLActor.?f110:TList
 004959E9    call        TObject.Free
 004959EE    mov         eax,dword ptr [esi+108];TGLActor.Animations:TActorAnimations
 004959F4    call        TObject.Free
 004959F9    test        bl,bl
>004959FB    jle         00495A04
 004959FD    mov         eax,esi
 004959FF    call        @ClassDestroy
 00495A04    pop         esi
 00495A05    pop         ebx
 00495A06    ret
*}
end;

//00495A08
procedure TGLActor.Assign(Source:TPersistent);
begin
{*
 00495A08    push        ebx
 00495A09    push        esi
 00495A0A    push        edi
 00495A0B    mov         esi,edx
 00495A0D    mov         ebx,eax
 00495A0F    mov         edx,esi
 00495A11    mov         eax,ebx
 00495A13    call        TGLBaseMesh.Assign
 00495A18    mov         eax,esi
 00495A1A    mov         edx,dword ptr ds:[48E564];TGLActor
 00495A20    call        @IsClass
 00495A25    test        al,al
>00495A27    je          00495A51
 00495A29    mov         edi,esi
 00495A2B    mov         edx,dword ptr [edi+108]
 00495A31    mov         eax,dword ptr [ebx+108];TGLActor.Animations:TActorAnimations
 00495A37    mov         ecx,dword ptr [eax]
 00495A39    call        dword ptr [ecx+8];TCollection.Assign
 00495A3C    mov         al,byte ptr [edi+0EC]
 00495A42    mov         byte ptr [ebx+0EC],al;TGLActor.AnimationMode:TActorAnimationMode
 00495A48    mov         edx,edi
 00495A4A    mov         eax,ebx
 00495A4C    call        00496414
 00495A51    pop         edi
 00495A52    pop         esi
 00495A53    pop         ebx
 00495A54    ret
*}
end;

//00495A58
procedure sub_00495A58(?:TGLActor; ?:TGLBaseAnimationControler);
begin
{*
 00495A58    push        ebx
 00495A59    push        esi
 00495A5A    mov         esi,edx
 00495A5C    mov         ebx,eax
 00495A5E    cmp         dword ptr [ebx+110],0;TGLActor.?f110:TList
>00495A65    jne         00495A79
 00495A67    mov         dl,1
 00495A69    mov         eax,[00417CEC];TList
 00495A6E    call        TObject.Create;TList.Create
 00495A73    mov         dword ptr [ebx+110],eax;TGLActor.?f110:TList
 00495A79    mov         edx,esi
 00495A7B    mov         eax,dword ptr [ebx+110];TGLActor.?f110:TList
 00495A81    call        TList.Add
 00495A86    mov         edx,esi
 00495A88    mov         eax,ebx
 00495A8A    call        TComponent.FreeNotification
 00495A8F    pop         esi
 00495A90    pop         ebx
 00495A91    ret
*}
end;

//00495A94
procedure sub_00495A94(?:TGLActor; ?:TGLBaseAnimationControler);
begin
{*
 00495A94    push        ebx
 00495A95    push        esi
 00495A96    mov         esi,edx
 00495A98    mov         ebx,eax
 00495A9A    cmp         dword ptr [ebx+110],0;TGLActor.?f110:TList
>00495AA1    jne         00495AB7
 00495AA3    mov         ecx,1BCB
 00495AA8    mov         edx,495AF0;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00495AAD    mov         eax,495B34;'Assertion failure'
 00495AB2    call        @Assert
 00495AB7    mov         edx,esi
 00495AB9    mov         eax,dword ptr [ebx+110];TGLActor.?f110:TList
 00495ABF    call        TList.Remove
 00495AC4    mov         edx,esi
 00495AC6    mov         eax,ebx
 00495AC8    call        TComponent.RemoveFreeNotification
 00495ACD    mov         eax,dword ptr [ebx+110];TGLActor.?f110:TList
 00495AD3    cmp         dword ptr [eax+8],0;TList.FCount:Integer
>00495AD7    jne         00495AE4
 00495AD9    lea         eax,[ebx+110];TGLActor.?f110:TList
 00495ADF    call        FreeAndNil
 00495AE4    pop         esi
 00495AE5    pop         ebx
 00495AE6    ret
*}
end;

//00495B48
procedure TGLActor.SetCurrentFrame(Value:Integer);
begin
{*
 00495B48    push        ebx
 00495B49    push        esi
 00495B4A    mov         esi,edx
 00495B4C    mov         ebx,eax
 00495B4E    cmp         esi,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
>00495B54    je          00495C0C
 00495B5A    mov         eax,ebx
 00495B5C    call        004961A0
 00495B61    dec         eax
 00495B62    cmp         esi,eax
>00495B64    jle         00495B76
 00495B66    mov         eax,ebx
 00495B68    call        004961A0
 00495B6D    dec         eax
 00495B6E    mov         dword ptr [ebx+0DC],eax;TGLActor.CurrentFrame:Integer
>00495B74    jmp         00495B8A
 00495B76    test        esi,esi
>00495B78    jge         00495B84
 00495B7A    xor         eax,eax
 00495B7C    mov         dword ptr [ebx+0DC],eax;TGLActor.CurrentFrame:Integer
>00495B82    jmp         00495B8A
 00495B84    mov         dword ptr [ebx+0DC],esi;TGLActor.CurrentFrame:Integer
 00495B8A    xor         eax,eax
 00495B8C    mov         dword ptr [ebx+0E0],eax;TGLActor.CurrentFrameDelta:Single
 00495B92    mov         al,byte ptr [ebx+0EC];TGLActor.AnimationMode:TActorAnimationMode
 00495B98    dec         al
>00495B9A    je          00495BA6
 00495B9C    sub         al,2
>00495B9E    je          00495BBD
 00495BA0    dec         al
>00495BA2    je          00495BD4
>00495BA4    jmp         00495BE9
 00495BA6    mov         eax,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495BAC    cmp         eax,dword ptr [ebx+0D4];TGLActor.EndFrame:Integer
>00495BB2    jne         00495BE9
 00495BB4    mov         byte ptr [ebx+0EC],0;TGLActor.AnimationMode:TActorAnimationMode
>00495BBB    jmp         00495BE9
 00495BBD    mov         eax,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495BC3    cmp         eax,dword ptr [ebx+0D4];TGLActor.EndFrame:Integer
>00495BC9    jne         00495BE9
 00495BCB    mov         byte ptr [ebx+0EC],4;TGLActor.AnimationMode:TActorAnimationMode
>00495BD2    jmp         00495BE9
 00495BD4    mov         eax,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495BDA    cmp         eax,dword ptr [ebx+0D0];TGLActor.StartFrame:Integer
>00495BE0    jne         00495BE9
 00495BE2    mov         byte ptr [ebx+0EC],3;TGLActor.AnimationMode:TActorAnimationMode
 00495BE9    mov         eax,ebx
 00495BEB    mov         si,0FFE7
 00495BEF    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00495BF4    cmp         word ptr [ebx+0F2],0;TGLActor.?fF2:word
>00495BFC    je          00495C0C
 00495BFE    mov         edx,ebx
 00495C00    mov         eax,dword ptr [ebx+0F4];TGLActor.?fF4:dword
 00495C06    call        dword ptr [ebx+0F0];TGLActor.OnFrameChanged
 00495C0C    pop         esi
 00495C0D    pop         ebx
 00495C0E    ret
*}
end;

//00495C10
procedure TGLActor.SetStartFrame(Value:Integer);
begin
{*
 00495C10    push        ebx
 00495C11    push        esi
 00495C12    mov         esi,edx
 00495C14    mov         ebx,eax
 00495C16    test        esi,esi
>00495C18    jl          00495C33
 00495C1A    mov         eax,ebx
 00495C1C    call        004961A0
 00495C21    cmp         esi,eax
>00495C23    jge         00495C33
 00495C25    cmp         esi,dword ptr [ebx+0D0];TGLActor.StartFrame:Integer
>00495C2B    je          00495C33
 00495C2D    mov         dword ptr [ebx+0D0],esi;TGLActor.StartFrame:Integer
 00495C33    mov         eax,dword ptr [ebx+0D0];TGLActor.StartFrame:Integer
 00495C39    cmp         eax,dword ptr [ebx+0D4];TGLActor.EndFrame:Integer
>00495C3F    jle         00495C47
 00495C41    mov         dword ptr [ebx+0D4],eax;TGLActor.EndFrame:Integer
 00495C47    mov         eax,dword ptr [ebx+0D0];TGLActor.StartFrame:Integer
 00495C4D    cmp         eax,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
>00495C53    jle         00495C5E
 00495C55    mov         edx,eax
 00495C57    mov         eax,ebx
 00495C59    call        TGLActor.SetCurrentFrame
 00495C5E    pop         esi
 00495C5F    pop         ebx
 00495C60    ret
*}
end;

//00495C64
procedure TGLActor.SetEndFrame(Value:Integer);
begin
{*
 00495C64    push        ebx
 00495C65    push        esi
 00495C66    mov         esi,edx
 00495C68    mov         ebx,eax
 00495C6A    test        esi,esi
>00495C6C    jl          00495C87
 00495C6E    mov         eax,ebx
 00495C70    call        004961A0
 00495C75    cmp         esi,eax
>00495C77    jge         00495C87
 00495C79    cmp         esi,dword ptr [ebx+0D4];TGLActor.EndFrame:Integer
>00495C7F    je          00495C87
 00495C81    mov         dword ptr [ebx+0D4],esi;TGLActor.EndFrame:Integer
 00495C87    mov         eax,dword ptr [ebx+0D4];TGLActor.EndFrame:Integer
 00495C8D    cmp         eax,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
>00495C93    jge         00495C9E
 00495C95    mov         edx,eax
 00495C97    mov         eax,ebx
 00495C99    call        TGLActor.SetCurrentFrame
 00495C9E    pop         esi
 00495C9F    pop         ebx
 00495CA0    ret
*}
end;

//00495CA4
procedure TGLActor.SetAnimations(Value:TActorAnimations);
begin
{*
 00495CA4    push        esi
 00495CA5    mov         esi,eax
 00495CA7    mov         eax,dword ptr [esi+108];TGLActor.Animations:TActorAnimations
 00495CAD    mov         ecx,dword ptr [eax]
 00495CAF    call        dword ptr [ecx+8];TCollection.Assign
 00495CB2    pop         esi
 00495CB3    ret
*}
end;

//00495CB4
function TGLActor.IsStoredAnimations(Value:TActorAnimations):Boolean;
begin
{*
 00495CB4    push        ebx
 00495CB5    mov         ebx,eax
 00495CB7    mov         eax,dword ptr [ebx+108];TGLActor.Animations:TActorAnimations
 00495CBD    call        TCollection.GetCount
 00495CC2    test        eax,eax
 00495CC4    setg        al
 00495CC7    pop         ebx
 00495CC8    ret
*}
end;

//00495CCC
procedure TGLActor.SetOptions(Value:TGLActorOptions);
begin
{*
 00495CCC    push        ebx
 00495CCD    push        esi
 00495CCE    push        ecx
 00495CCF    mov         byte ptr [esp],dl
 00495CD2    mov         ebx,eax
 00495CD4    mov         al,byte ptr [ebx+114];TGLActor.Options:TGLActorOptions
 00495CDA    cmp         al,byte ptr [esp]
>00495CDD    je          00495CF3
 00495CDF    mov         al,byte ptr [esp]
 00495CE2    mov         byte ptr [ebx+114],al;TGLActor.Options:TGLActorOptions
 00495CE8    mov         eax,ebx
 00495CEA    mov         si,0FFE7
 00495CEE    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00495CF3    pop         edx
 00495CF4    pop         esi
 00495CF5    pop         ebx
 00495CF6    ret
*}
end;

//00495CF8
{*function sub_00495CF8(?:TGLActor):?;
begin
 00495CF8    push        ebx
 00495CF9    mov         dl,byte ptr [eax+0EC]
 00495CFF    sub         dl,2
>00495D02    jb          00495D51
 00495D04    sub         dl,2
>00495D07    jb          00495D19
 00495D09    sub         dl,2
>00495D0C    jb          00495D75
>00495D0E    je          00495DAA
>00495D14    jmp         00495DB2
 00495D19    mov         edx,dword ptr [eax+10C]
 00495D1F    test        edx,edx
>00495D21    je          00495D2B
 00495D23    mov         ebx,dword ptr [edx+10]
>00495D26    jmp         00495DCC
 00495D2B    mov         ebx,dword ptr [eax+0DC]
 00495D31    inc         ebx
 00495D32    mov         edx,dword ptr [eax+0D4]
 00495D38    cmp         ebx,edx
>00495D3A    jle         00495DCC
 00495D40    sub         ebx,edx
 00495D42    dec         ebx
 00495D43    add         ebx,dword ptr [eax+0D0]
 00495D49    cmp         edx,ebx
>00495D4B    jge         00495DCC
 00495D4D    mov         ebx,edx
>00495D4F    jmp         00495DCC
 00495D51    mov         edx,dword ptr [eax+10C]
 00495D57    test        edx,edx
>00495D59    je          00495D60
 00495D5B    mov         ebx,dword ptr [edx+10]
>00495D5E    jmp         00495DCC
 00495D60    mov         ebx,dword ptr [eax+0DC]
 00495D66    inc         ebx
 00495D67    mov         edx,dword ptr [eax+0D4]
 00495D6D    cmp         ebx,edx
>00495D6F    jle         00495DCC
 00495D71    mov         ebx,edx
>00495D73    jmp         00495DCC
 00495D75    mov         edx,dword ptr [eax+10C]
 00495D7B    test        edx,edx
>00495D7D    je          00495D84
 00495D7F    mov         ebx,dword ptr [edx+10]
>00495D82    jmp         00495DCC
 00495D84    mov         ebx,dword ptr [eax+0DC]
 00495D8A    dec         ebx
 00495D8B    mov         edx,dword ptr [eax+0D0]
 00495D91    cmp         ebx,edx
>00495D93    jge         00495DCC
 00495D95    mov         ecx,edx
 00495D97    sub         ecx,ebx
 00495D99    dec         ecx
 00495D9A    mov         ebx,dword ptr [eax+0D4]
 00495DA0    sub         ebx,ecx
 00495DA2    cmp         edx,ebx
>00495DA4    jle         00495DCC
 00495DA6    mov         ebx,edx
>00495DA8    jmp         00495DCC
 00495DAA    mov         ebx,dword ptr [eax+0DC]
>00495DB0    jmp         00495DCC
 00495DB2    mov         ebx,dword ptr [eax+0DC]
 00495DB8    mov         ecx,1C4E
 00495DBD    mov         edx,495DD8;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 00495DC2    mov         eax,495E1C;'Assertion failure'
 00495DC7    call        @Assert
 00495DCC    mov         eax,ebx
 00495DCE    pop         ebx
 00495DCF    ret
end;*}

//00495E30
{*procedure sub_00495E30(?:TGLActor; ?:?);
begin
 00495E30    push        ebx
 00495E31    push        esi
 00495E32    mov         ebx,eax
 00495E34    mov         esi,edx
 00495E36    test        esi,esi
>00495E38    jle         00495E9B
 00495E3A    mov         eax,ebx
 00495E3C    call        00495CF8
 00495E41    mov         edx,eax
 00495E43    mov         eax,ebx
 00495E45    call        TGLActor.SetCurrentFrame
 00495E4A    dec         esi
 00495E4B    cmp         word ptr [ebx+0FA],0
>00495E53    je          00495E71
 00495E55    mov         eax,dword ptr [ebx+0DC]
 00495E5B    cmp         eax,dword ptr [ebx+0D4]
>00495E61    jne         00495E71
 00495E63    mov         edx,ebx
 00495E65    mov         eax,dword ptr [ebx+0FC]
 00495E6B    call        dword ptr [ebx+0F8]
 00495E71    cmp         word ptr [ebx+102],0
>00495E79    je          00495E97
 00495E7B    mov         eax,dword ptr [ebx+0DC]
 00495E81    cmp         eax,dword ptr [ebx+0D0]
>00495E87    jne         00495E97
 00495E89    mov         edx,ebx
 00495E8B    mov         eax,dword ptr [ebx+104]
 00495E91    call        dword ptr [ebx+100]
 00495E97    test        esi,esi
>00495E99    jg          00495E3A
 00495E9B    pop         esi
 00495E9C    pop         ebx
 00495E9D    ret
end;*}

//00495ED0
{*procedure sub_00495ED0(?:?);
begin
 00495ED0    push        ebp
 00495ED1    mov         ebp,esp
 00495ED3    add         esp,0FFFFFFF4
 00495ED6    push        ebx
 00495ED7    push        esi
 00495ED8    push        edi
 00495ED9    xor         ecx,ecx
 00495EDB    mov         dword ptr [ebp-0C],ecx
 00495EDE    mov         esi,edx
 00495EE0    mov         ebx,eax
 00495EE2    xor         eax,eax
 00495EE4    push        ebp
 00495EE5    push        49614A
 00495EEA    push        dword ptr fs:[eax]
 00495EED    mov         dword ptr fs:[eax],esp
 00495EF0    mov         eax,ebx
 00495EF2    call        00495CF8
 00495EF7    mov         edi,eax
 00495EF9    mov         al,byte ptr [ebx+0D8];TGLActor.Reference:TActorAnimationReference
 00495EFF    sub         al,1
>00495F01    jb          00495F0A
>00495F03    je          00495F50
>00495F05    jmp         004960F3
 00495F0A    test        edi,edi
>00495F0C    jl          004960F3
 00495F12    mov         al,byte ptr [ebx+0E4];TGLActor.FrameInterpolation:TActorFrameInterpolation
 00495F18    dec         al
>00495F1A    jne         00495F3A
 00495F1C    push        dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 00495F22    mov         ecx,edi
 00495F24    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495F2A    mov         eax,dword ptr [ebx+0C8];TGLActor.?fC8:TMeshObjectList
 00495F30    call        00492038
>00495F35    jmp         004960F3
 00495F3A    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495F40    mov         eax,dword ptr [ebx+0C8];TGLActor.?fC8:TMeshObjectList
 00495F46    call        00491FF4
>00495F4B    jmp         004960F3
 00495F50    mov         eax,dword ptr [ebx+0CC];TGLActor.?fCC:TSkeleton
 00495F56    mov         eax,dword ptr [eax+10];TSkeleton.?f10:TSkeletonFrameList
 00495F59    cmp         dword ptr [eax+0C],0;TSkeletonFrameList.?fC:dword
>00495F5D    jle         004960F3
 00495F63    cmp         dword ptr [ebx+110],0;TGLActor.?f110:TList
>00495F6A    je          0049608F
 00495F70    cmp         byte ptr [ebx+0EC],6;TGLActor.AnimationMode:TActorAnimationMode
>00495F77    je          0049608F
 00495F7D    mov         eax,dword ptr [ebx+110];TGLActor.?f110:TList
 00495F83    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00495F86    inc         eax
 00495F87    push        eax
 00495F88    lea         eax,[ebp-0C]
 00495F8B    mov         ecx,1
 00495F90    mov         edx,dword ptr ds:[495EA0];.63
 00495F96    call        @DynArraySetLength
 00495F9B    add         esp,4
 00495F9E    test        edi,edi
>00495FA0    jl          00495FEE
 00495FA2    mov         al,byte ptr [ebx+0E4];TGLActor.FrameInterpolation:TActorFrameInterpolation
 00495FA8    dec         al
>00495FAA    jne         00495FCC
 00495FAC    mov         eax,dword ptr [ebp-0C]
 00495FAF    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495FB5    mov         dword ptr [eax],edx
 00495FB7    mov         dword ptr [eax+4],edi
 00495FBA    mov         edx,dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 00495FC0    mov         dword ptr [eax+8],edx
 00495FC3    mov         dword ptr [eax+0C],3F800000
>00495FCA    jmp         0049600E
 00495FCC    mov         eax,dword ptr [ebp-0C]
 00495FCF    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495FD5    mov         dword ptr [eax],edx
 00495FD7    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495FDD    mov         dword ptr [eax+4],edx
 00495FE0    xor         edx,edx
 00495FE2    mov         dword ptr [eax+8],edx
 00495FE5    mov         dword ptr [eax+0C],3F800000
>00495FEC    jmp         0049600E
 00495FEE    mov         eax,dword ptr [ebp-0C]
 00495FF1    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495FF7    mov         dword ptr [eax],edx
 00495FF9    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 00495FFF    mov         dword ptr [eax+4],edx
 00496002    xor         edx,edx
 00496004    mov         dword ptr [eax+8],edx
 00496007    mov         dword ptr [eax+0C],3F800000
 0049600E    mov         dword ptr [ebp-8],1
 00496015    mov         eax,dword ptr [ebx+110];TGLActor.?f110:TList
 0049601B    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 0049601E    dec         edi
 0049601F    test        edi,edi
>00496021    jl          0049605B
 00496023    inc         edi
 00496024    mov         dword ptr [ebp-4],0
 0049602B    mov         edx,dword ptr [ebp-4]
 0049602E    mov         eax,dword ptr [ebx+110];TGLActor.?f110:TList
 00496034    call        TList.Get
 00496039    mov         edx,dword ptr [ebp-8]
 0049603C    mov         ecx,edx
 0049603E    shl         edx,3
 00496041    sub         edx,ecx
 00496043    mov         ecx,dword ptr [ebp-0C]
 00496046    lea         edx,[ecx+edx*4]
 00496049    mov         ecx,dword ptr [eax]
 0049604B    call        dword ptr [ecx+34]
 0049604E    test        al,al
>00496050    je          00496055
 00496052    inc         dword ptr [ebp-8]
 00496055    inc         dword ptr [ebp-4]
 00496058    dec         edi
>00496059    jne         0049602B
 0049605B    mov         eax,dword ptr [ebp-8]
 0049605E    push        eax
 0049605F    lea         eax,[ebp-0C]
 00496062    mov         ecx,1
 00496067    mov         edx,dword ptr ds:[495EA0];.63
 0049606D    call        @DynArraySetLength
 00496072    add         esp,4
 00496075    mov         eax,dword ptr [ebp-0C]
 00496078    call        @DynArrayHigh
 0049607D    mov         ecx,eax
 0049607F    mov         edx,dword ptr [ebp-0C]
 00496082    mov         eax,dword ptr [ebx+0CC];TGLActor.?fCC:TSkeleton
 00496088    call        004907A0
>0049608D    jmp         004960DE
 0049608F    test        edi,edi
>00496091    jl          004960DE
 00496093    cmp         byte ptr [ebx+0EC],6;TGLActor.AnimationMode:TActorAnimationMode
>0049609A    je          004960DE
 0049609C    mov         al,byte ptr [ebx+0E4];TGLActor.FrameInterpolation:TActorFrameInterpolation
 004960A2    dec         al
>004960A4    jne         004960C1
 004960A6    push        dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 004960AC    mov         ecx,edi
 004960AE    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 004960B4    mov         eax,dword ptr [ebx+0CC];TGLActor.?fCC:TSkeleton
 004960BA    call        004906C4
>004960BF    jmp         004960DE
 004960C1    mov         edi,dword ptr [ebx+0CC];TGLActor.?fCC:TSkeleton
 004960C7    mov         eax,dword ptr [edi+10];TSkeleton.?f10:TSkeletonFrameList
 004960CA    mov         edx,dword ptr [ebx+0DC];TGLActor.CurrentFrame:Integer
 004960D0    call        0048FB64
 004960D5    mov         edx,eax
 004960D7    mov         eax,edi
 004960D9    call        004905C4
 004960DE    test        byte ptr [ebx+114],1;TGLActor.Options:TGLActorOptions
 004960E5    setne       dl
 004960E8    mov         eax,dword ptr [ebx+0CC];TGLActor.?fCC:TSkeleton
 004960EE    call        00490BAC
 004960F3    mov         edx,esi
 004960F5    mov         eax,ebx
 004960F7    call        00494E98
 004960FC    cmp         byte ptr [ebx+0B5],0;TGLActor.?fB5:byte
>00496103    je          0049612E
 00496105    push        2000
 0049610A    call        OpenGL32.glPushAttrib
 0049610F    push        0B71
 00496114    call        OpenGL32.glDisable
 00496119    mov         edx,esi
 0049611B    mov         eax,dword ptr [ebx+0CC];TGLActor.?fCC:TSkeleton
 00496121    mov         eax,dword ptr [eax+0C];TSkeleton.?fC:TSkeletonRootBoneList
 00496124    mov         ecx,dword ptr [eax]
 00496126    call        dword ptr [ecx+2C];TSkeletonRootBoneList.sub_0048FD94
 00496129    call        OpenGL32.glPopAttrib
 0049612E    xor         eax,eax
 00496130    pop         edx
 00496131    pop         ecx
 00496132    pop         ecx
 00496133    mov         dword ptr fs:[eax],edx
 00496136    push        496151
 0049613B    lea         eax,[ebp-0C]
 0049613E    mov         edx,dword ptr ds:[495EA0];.63
 00496144    call        @DynArrayClear
 00496149    ret
>0049614A    jmp         @HandleFinally
>0049614F    jmp         0049613B
 00496151    pop         edi
 00496152    pop         esi
 00496153    pop         ebx
 00496154    mov         esp,ebp
 00496156    pop         ebp
 00496157    ret
end;*}

//00496158
procedure TGLActor.sub_00494DE4;
begin
{*
 00496158    push        ebx
 00496159    mov         ebx,eax
 0049615B    xor         eax,eax
 0049615D    mov         dword ptr [ebx+0D0],eax;TGLActor.StartFrame:Integer
 00496163    mov         eax,ebx
 00496165    call        004961A0
 0049616A    dec         eax
 0049616B    mov         dword ptr [ebx+0D4],eax;TGLActor.EndFrame:Integer
 00496171    xor         eax,eax
 00496173    mov         dword ptr [ebx+0DC],eax;TGLActor.CurrentFrame:Integer
 00496179    cmp         word ptr [ebx+0F2],0;TGLActor.?fF2:word
>00496181    je          00496191
 00496183    mov         edx,ebx
 00496185    mov         eax,dword ptr [ebx+0F4];TGLActor.?fF4:dword
 0049618B    call        dword ptr [ebx+0F0];TGLActor.OnFrameChanged
 00496191    mov         eax,ebx
 00496193    call        TGLBaseMesh.sub_00494DE4
 00496198    pop         ebx
 00496199    ret
*}
end;

//0049619C
procedure TGLActor.sub_00494E40;
begin
{*
 0049619C    ret
*}
end;

//004961A0
{*function sub_004961A0(?:TGLActor):?;
begin
 004961A0    push        ebx
 004961A1    mov         dl,byte ptr [eax+0D8];TGLActor.Reference:TActorAnimationReference
 004961A7    sub         dl,1
>004961AA    jb          004961B4
>004961AC    je          004961C3
 004961AE    dec         dl
>004961B0    je          004961D1
>004961B2    jmp         004961D5
 004961B4    mov         eax,dword ptr [eax+0C8];TGLActor.?fC8:TMeshObjectList
 004961BA    call        00492090
 004961BF    mov         ebx,eax
>004961C1    jmp         004961EB
 004961C3    mov         eax,dword ptr [eax+0CC];TGLActor.?fCC:TSkeleton
 004961C9    mov         eax,dword ptr [eax+10];TSkeleton.?f10:TSkeletonFrameList
 004961CC    mov         ebx,dword ptr [eax+0C];TSkeletonFrameList.?fC:dword
>004961CF    jmp         004961EB
 004961D1    xor         ebx,ebx
>004961D3    jmp         004961EB
 004961D5    xor         ebx,ebx
 004961D7    mov         ecx,1CDB
 004961DC    mov         edx,4961F8;'C:\GLScene\glscene_v_1000714\Source\GLVectorFileObjects.pas'
 004961E1    mov         eax,49623C;'Assertion failure'
 004961E6    call        @Assert
 004961EB    mov         eax,ebx
 004961ED    pop         ebx
 004961EE    ret
end;*}

//00496250
{*procedure sub_00496250(?:?);
begin
 00496250    push        ebx
 00496251    push        esi
 00496252    push        ecx
 00496253    mov         esi,edx
 00496255    mov         ebx,eax
 00496257    mov         edx,esi
 00496259    mov         eax,ebx
 0049625B    call        0047D1EC
 00496260    cmp         byte ptr [ebx+0EC],0;TGLActor.AnimationMode:TActorAnimationMode
>00496267    je          00496332
 0049626D    cmp         dword ptr [ebx+0E8],0;TGLActor.Interval:Integer
>00496274    jle         00496332
 0049627A    mov         eax,dword ptr [ebx+0D0];TGLActor.StartFrame:Integer
 00496280    cmp         eax,dword ptr [ebx+0D4];TGLActor.EndFrame:Integer
>00496286    je          00496332
 0049628C    mov         eax,ebx
 0049628E    call        004961A0
 00496293    dec         eax
>00496294    jle         00496332
 0049629A    fld         qword ptr [esi]
 0049629C    fmul        dword ptr ds:[496338];1000:Single
 004962A2    fild        dword ptr [ebx+0E8];TGLActor.Interval:Integer
 004962A8    fdivp       st(1),st
 004962AA    fadd        dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 004962B0    fstp        dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 004962B6    wait
 004962B7    fld         dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 004962BD    fcomp       dword ptr ds:[49633C];1:Single
 004962C3    fnstsw      al
 004962C5    sahf
>004962C6    jbe         0049631E
 004962C8    mov         eax,dword ptr [ebx+10C];TGLActor.?f10C:dword
 004962CE    test        eax,eax
>004962D0    je          004962E5
 004962D2    xor         ecx,ecx
 004962D4    mov         edx,eax
 004962D6    mov         eax,ebx
 004962D8    call        00496390
 004962DD    xor         eax,eax
 004962DF    mov         dword ptr [ebx+10C],eax;TGLActor.?f10C:dword
 004962E5    push        dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 004962EB    call        0045F6C8
 004962F0    fstp        dword ptr [esp]
 004962F3    wait
 004962F4    push        dword ptr [ebx+0E0];TGLActor.CurrentFrameDelta:Single
 004962FA    call        0045F688
 004962FF    mov         edx,eax
 00496301    mov         eax,ebx
 00496303    call        00495E30
 00496308    mov         eax,dword ptr [esp]
 0049630B    mov         dword ptr [ebx+0E0],eax;TGLActor.CurrentFrameDelta:Single
 00496311    mov         eax,ebx
 00496313    mov         si,0FFE7
 00496317    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
>0049631C    jmp         00496332
 0049631E    cmp         byte ptr [ebx+0E4],0;TGLActor.FrameInterpolation:TActorFrameInterpolation
>00496325    je          00496332
 00496327    mov         eax,ebx
 00496329    mov         si,0FFE7
 0049632D    call        @CallDynaInst;TGLBaseMesh.sub_0047CEC8
 00496332    pop         edx
 00496333    pop         esi
 00496334    pop         ebx
 00496335    ret
end;*}

//00496340
{*procedure TGLActor.sub_004945F8(?:?; ?:?);
begin
 00496340    push        ebx
 00496341    push        esi
 00496342    push        edi
 00496343    mov         edi,ecx
 00496345    mov         esi,edx
 00496347    mov         ebx,eax
 00496349    test        esi,esi
>0049634B    je          00496363
 0049634D    mov         eax,dword ptr [ebx+108];TGLActor.Animations:TActorAnimations
 00496353    call        TCollection.Clear
 00496358    mov         ecx,edi
 0049635A    mov         edx,esi
 0049635C    mov         eax,ebx
 0049635E    call        TGLBaseMesh.sub_004945F8
 00496363    pop         edi
 00496364    pop         esi
 00496365    pop         ebx
 00496366    ret
end;*}

//00496368
{*procedure sub_00496368(?:TGLActor; ?:AnsiString; ?:?);
begin
 00496368    push        ebx
 00496369    push        esi
 0049636A    push        edi
 0049636B    mov         ebx,ecx
 0049636D    mov         esi,edx
 0049636F    mov         edi,eax
 00496371    mov         edx,esi
 00496373    mov         eax,dword ptr [edi+108]
 00496379    call        00495660
 0049637E    mov         edx,eax
 00496380    mov         ecx,ebx
 00496382    mov         eax,edi
 00496384    call        00496390
 00496389    pop         edi
 0049638A    pop         esi
 0049638B    pop         ebx
 0049638C    ret
end;*}

//00496390
{*procedure sub_00496390(?:TGLActor; ?:?; ?:?);
begin
 00496390    push        ebx
 00496391    push        esi
 00496392    mov         esi,edx
 00496394    mov         ebx,eax
 00496396    test        esi,esi
>00496398    je          004963D8
 0049639A    test        cl,cl
>0049639C    je          004963AE
 0049639E    mov         dword ptr [ebx+10C],esi;TGLActor.?f10C:dword
 004963A4    xor         eax,eax
 004963A6    mov         dword ptr [ebx+0E0],eax;TGLActor.CurrentFrameDelta:Single
>004963AC    jmp         004963D8
 004963AE    mov         al,byte ptr [esi+18]
 004963B1    mov         byte ptr [ebx+0D8],al;TGLActor.Reference:TActorAnimationReference
 004963B7    mov         edx,dword ptr [esi+10]
 004963BA    mov         eax,ebx
 004963BC    call        TGLActor.SetStartFrame
 004963C1    mov         edx,dword ptr [esi+14]
 004963C4    mov         eax,ebx
 004963C6    call        TGLActor.SetEndFrame
 004963CB    mov         edx,dword ptr [ebx+0D0];TGLActor.StartFrame:Integer
 004963D1    mov         eax,ebx
 004963D3    call        TGLActor.SetCurrentFrame
 004963D8    pop         esi
 004963D9    pop         ebx
 004963DA    ret
end;*}

//004963DC
{*procedure sub_004963DC(?:TGLActor; ?:?);
begin
 004963DC    push        ebx
 004963DD    push        esi
 004963DE    mov         esi,edx
 004963E0    mov         cl,byte ptr [eax+0D8]
 004963E6    mov         edx,dword ptr [eax+0DC]
 004963EC    mov         eax,dword ptr [eax+108]
 004963F2    call        004956B4
 004963F7    mov         ebx,eax
 004963F9    test        ebx,ebx
>004963FB    je          0049640A
 004963FD    mov         eax,esi
 004963FF    mov         edx,dword ptr [ebx+0C]
 00496402    call        @LStrAsg
 00496407    pop         esi
 00496408    pop         ebx
 00496409    ret
 0049640A    mov         eax,esi
 0049640C    call        @LStrClr
 00496411    pop         esi
 00496412    pop         ebx
 00496413    ret
end;*}

//00496414
procedure sub_00496414(?:TGLActor; ?:TPersistent);
begin
{*
 00496414    push        ebx
 00496415    push        esi
 00496416    push        edi
 00496417    mov         esi,edx
 00496419    mov         ebx,eax
 0049641B    test        esi,esi
>0049641D    je          004964F5
 00496423    mov         eax,ebx
 00496425    call        004961A0
 0049642A    cmp         eax,dword ptr [esi+0D0]
>00496430    jle         0049643E
 00496432    mov         eax,dword ptr [esi+0D0]
 00496438    mov         dword ptr [ebx+0D0],eax;TGLActor.StartFrame:Integer
 0049643E    mov         eax,ebx
 00496440    call        004961A0
 00496445    cmp         eax,dword ptr [esi+0D4]
>0049644B    jle         00496459
 0049644D    mov         eax,dword ptr [esi+0D4]
 00496453    mov         dword ptr [ebx+0D4],eax;TGLActor.EndFrame:Integer
 00496459    mov         al,byte ptr [esi+0D8]
 0049645F    mov         byte ptr [ebx+0D8],al;TGLActor.Reference:TActorAnimationReference
 00496465    mov         eax,ebx
 00496467    call        004961A0
 0049646C    cmp         eax,dword ptr [esi+0DC]
>00496472    jle         00496480
 00496474    mov         eax,dword ptr [esi+0DC]
 0049647A    mov         dword ptr [ebx+0DC],eax;TGLActor.CurrentFrame:Integer
 00496480    mov         eax,dword ptr [esi+0E0]
 00496486    mov         dword ptr [ebx+0E0],eax;TGLActor.CurrentFrameDelta:Single
 0049648C    mov         al,byte ptr [esi+0EC]
 00496492    mov         byte ptr [ebx+0EC],al;TGLActor.AnimationMode:TActorAnimationMode
 00496498    mov         al,byte ptr [esi+0E4]
 0049649E    mov         byte ptr [ebx+0E4],al;TGLActor.FrameInterpolation:TActorFrameInterpolation
 004964A4    mov         edi,dword ptr [esi+10C]
 004964AA    test        edi,edi
>004964AC    je          004964C4
 004964AE    mov         edx,dword ptr [edi+0C]
 004964B1    mov         eax,dword ptr [ebx+108];TGLActor.Animations:TActorAnimations
 004964B7    call        00495660
 004964BC    mov         dword ptr [ebx+10C],eax;TGLActor.?f10C:dword
>004964C2    jmp         004964CC
 004964C4    xor         eax,eax
 004964C6    mov         dword ptr [ebx+10C],eax;TGLActor.?f10C:dword
 004964CC    mov         eax,dword ptr [ebx+0CC];TGLActor.?fCC:TSkeleton
 004964D2    mov         edx,dword ptr [eax+10];TSkeleton.?f10:TSkeletonFrameList
 004964D5    cmp         dword ptr [edx+0C],0;TSkeletonFrameList.?fC:dword
>004964D9    jle         004964F5
 004964DB    mov         edx,dword ptr [esi+0CC]
 004964E1    mov         edx,dword ptr [edx+10]
 004964E4    cmp         dword ptr [edx+0C],0
>004964E8    jle         004964F5
 004964EA    mov         edx,dword ptr [esi+0CC]
 004964F0    call        00490C28
 004964F5    pop         edi
 004964F6    pop         esi
 004964F7    pop         ebx
 004964F8    ret
*}
end;

//004964FC
function sub_004964FC(?:TGLActor):Boolean;
begin
{*
 004964FC    cmp         dword ptr [eax+10C],0
 00496503    setne       al
 00496506    ret
*}
end;

Initialization
//00496558
{*
 00496558    push        ebp
 00496559    mov         ebp,esp
 0049655B    add         esp,0FFFFFFBC
 0049655E    sub         dword ptr ds:[5E1568],1
>00496565    jae         00496615
 0049656B    mov         ecx,dword ptr ds:[48DB34];TGLGLSMVectorFile
 00496571    mov         edx,496624;'GLScene Mesh'
 00496576    mov         eax,49663C;'glsm'
 0049657B    call        0048EB2C
 00496580    mov         eax,[0048DD50];TGLFreeForm
 00496585    mov         dword ptr [ebp-44],eax
 00496588    mov         eax,[0048E564];TGLActor
 0049658D    mov         dword ptr [ebp-40],eax
 00496590    mov         eax,[0048D054];TSkeleton
 00496595    mov         dword ptr [ebp-3C],eax
 00496598    mov         eax,[0048CA88];TSkeletonFrame
 0049659D    mov         dword ptr [ebp-38],eax
 004965A0    mov         eax,[0048CDD8];TSkeletonBone
 004965A5    mov         dword ptr [ebp-34],eax
 004965A8    mov         eax,[0048D528];TSkeletonMeshObject
 004965AD    mov         dword ptr [ebp-30],eax
 004965B0    mov         eax,[0048D104];TMeshObject
 004965B5    mov         dword ptr [ebp-2C],eax
 004965B8    mov         eax,[0048CB54];TSkeletonFrameList
 004965BD    mov         dword ptr [ebp-28],eax
 004965C0    mov         eax,[0048D2B8];TMeshMorphTarget
 004965C5    mov         dword ptr [ebp-24],eax
 004965C8    mov         eax,[0048D448];TMorphableMeshObject
 004965CD    mov         dword ptr [ebp-20],eax
 004965D0    mov         eax,[0048D600];TFaceGroup
 004965D5    mov         dword ptr [ebp-1C],eax
 004965D8    mov         eax,[0048D6E4];TFGVertexIndexList
 004965DD    mov         dword ptr [ebp-18],eax
 004965E0    mov         eax,[0048D7C0];TFGVertexNormalTexIndexList
 004965E5    mov         dword ptr [ebp-14],eax
 004965E8    mov         eax,[0048E348];TGLAnimationControler
 004965ED    mov         dword ptr [ebp-10],eax
 004965F0    mov         eax,[0048D8A4];TFGIndexTexCoordList
 004965F5    mov         dword ptr [ebp-0C],eax
 004965F8    mov         eax,[0048CEC0];TSkeletonCollider
 004965FD    mov         dword ptr [ebp-8],eax
 00496600    mov         eax,[0048CF84];TSkeletonColliderList
 00496605    mov         dword ptr [ebp-4],eax
 00496608    lea         eax,[ebp-44]
 0049660B    mov         edx,10
 00496610    call        RegisterClasses
 00496615    mov         esp,ebp
 00496617    pop         ebp
 00496618    ret
*}
Finalization
//00496508
{*
 00496508    push        ebp
 00496509    mov         ebp,esp
 0049650B    xor         eax,eax
 0049650D    push        ebp
 0049650E    push        49654E
 00496513    push        dword ptr fs:[eax]
 00496516    mov         dword ptr fs:[eax],esp
 00496519    inc         dword ptr ds:[5E1568]
>0049651F    jne         00496540
 00496521    mov         eax,[005E156C];gvar_005E156C:TVectorFileFormatsList
 00496526    call        TObject.Free
 0049652B    mov         eax,5AD734;^'morph'
 00496530    mov         ecx,2
 00496535    mov         edx,dword ptr ds:[4010B4];String
 0049653B    call        @FinalizeArray
 00496540    xor         eax,eax
 00496542    pop         edx
 00496543    pop         ecx
 00496544    pop         ecx
 00496545    mov         dword ptr fs:[eax],edx
 00496548    push        496555
 0049654D    ret
>0049654E    jmp         @HandleFinally
>00496553    jmp         0049654D
 00496555    pop         ebp
 00496556    ret
*}
end.