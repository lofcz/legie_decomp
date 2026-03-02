//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLTexture;

interface

uses
  SysUtils, Classes, GLTexture, GLGraphics, Graphics, , GLMisc;

type
  TGLTextureMode = (tmDecal, tmModulate, tmBlend, tmReplace);
  TGLTextureWrap = (twBoth, twNone, twVertical, twHorizontal);
  TGLColor = class(TGLUpdateAbleObject)
  public
    Red:Single;//f18
    Green:Single;//f1C
    Blue:Single;//f20
    Alpha:Single;//f24
    f28:Pointer;//f28
    destructor Destroy; virtual;//00472ADC
    //procedure v4(?:?); virtual;//v4//00472BC8
    procedure Assign(Source:TPersistent); virtual;//v8//00472B88
    constructor Create; virtual;//vC//00472A40
    //procedure v10(?:?); virtual;//v10//00472C48
    //constructor Create(?:?; ?:?; ?:?);//00472A84
    //procedure SetRed(Value:Single; ?:?);//00472B60
  end;
  TTextureNeededEvent = procedure(Sender:TObject; var textureFileName:String) of object;;
  TGLTextureImageAlpha = (tiaDefault, tiaAlphaFromIntensity, tiaSuperBlackTransparent, tiaLuminance, tiaLuminanceSqrt, tiaOpaque, tiaTopLeftPointColorTransparent, tiaInverseLuminance, tiaInverseLuminanceSqrt);
  TGLTextureImage = class(TGLUpdateAbleObject)
  public
    f18:TGLTexture;//f18
    //f20:?;//f20
    f22:word;//f22
    f24:TGLTexture;//f24
    destructor Destroy; virtual;//00472F60
    constructor vC; virtual;//vC//00472F14
    procedure v10; virtual;//v10//00472FC0
    procedure v14; virtual; abstract;//v14//00402BEC
    procedure v18; virtual; abstract;//v18//00402BEC
    procedure v1C; virtual; abstract;//v1C//00402BEC
    //procedure v20(?:?); virtual;//v20//00472F88
    //function v24:?; virtual;//v24//00472F98
    procedure v28; virtual; abstract;//v28//00402BEC
    procedure v2C; virtual;//v2C//00472FBC
    procedure sub_00472FA0; dynamic;//00472FA0
    //procedure sub_00472FD8(?:?); dynamic;//00472FD8
    procedure @AbstractError; dynamic;//00402BEC
  end;
  TGLBlankImage = class(TGLTextureImage)
  public
    f28:TGLBitmap32;//f28
    f2C:Integer;//f2C
    f30:Integer;//f30
    destructor Destroy; virtual;//00473074
    procedure Assign(Source:TPersistent); virtual;//v8//004730A0
    constructor vC; virtual;//vC//00473030
    function GetHeight:Integer; virtual;//v14//00473134
    function GetWidth:Integer; virtual;//v18//00473110
    //procedure v1C(?:?); virtual;//v1C//004733CC
    //procedure v20(?:?); virtual;//v20//004733F4
    //function v28:?; virtual;//v28//00473138
    procedure v2C; virtual;//v2C//00473170
    //procedure sub_00472FD8(?:?); dynamic;//00473248
    //procedure sub_00473188(?:?); dynamic;//00473188
    procedure SetWidth(Value:Integer);//004730F0
    procedure SetHeight(Value:Integer);//00473114
  end;
  TGLPictureImage = class(TGLTextureImage)
  public
    f28:TGLBitmap32;//f28
    f2C:TPicture;//f2C
    destructor Destroy; virtual;//00473468
    procedure Assign(Source:TPersistent); virtual;//v8//0047349C
    constructor vC; virtual;//vC//00473430
    procedure v14; virtual;//v14//00473560
    procedure v18; virtual;//v18//00473574
    //function v28:?; virtual;//v28//00473588
    procedure v2C; virtual;//v2C//0047363C
  end;
  TGLPersistentImage = class(TGLPictureImage)
  public
    destructor Destroy; virtual;//004736DC
    constructor Create; virtual;//vC//004736A4
    //procedure v1C(?:?); virtual;//v1C//00473810
    //procedure v20(?:?); virtual;//v20//00473840
    //procedure sub_00472FD8(?:?); dynamic;//0047371C
    //procedure sub_00473704(?:?); dynamic;//00473704
    //function GetPicture:?;//00473660
    procedure SetPicture(Value:TPicture);//0047368C
  end;
  TGLPicFileImage = class(TGLPictureImage)
  public
    PictureFileName:String;//f38
    f3C:byte;//f3C
    destructor Destroy; virtual;//00473920
    procedure Assign(Source:TPersistent); virtual;//v8//00473948
    constructor vC; virtual;//vC//004738E8
    //procedure v1C(?:?); virtual;//v1C//00473CA0
    //procedure v20(?:?); virtual;//v20//00473CCC
    //function v28(?:?):?; virtual;//v28//00473A20
    procedure sub_00472FA0; dynamic;//004739AC
    //procedure sub_00472FD8(?:?); dynamic;//00473BFC
    //procedure sub_00473BF0(?:?); dynamic;//00473BF0
    procedure SetPictureFileName(Value:String);//0047397C
  end;
  TGLCubeMapImage = class(TGLTextureImage)
  public
    f28:TGLBitmap32;//f28
    f30:dword;//f30
    destructor Destroy; virtual;//00473D78
    procedure Assign(Source:TPersistent); virtual;//v8//00473DC0
    constructor vC; virtual;//vC//00473D10
    procedure v14; virtual;//v14//00473E2C
    procedure v18; virtual;//v18//00473E20
    //procedure v1C(?:?); virtual;//v1C//004740F8
    //function v24:?; virtual;//v24//00474124
    //function v28(?:?):?; virtual;//v28//00473E38
    procedure v2C; virtual;//v2C//00473F28
    //procedure sub_00472FD8(?:?); dynamic;//00473FE8
    //procedure sub_00473F40(?:?); dynamic;//00473F40
    //procedure SetPicturePX(Value:TPicture; ?:?);//00474138
    //function GetPicturePX(?:?):?;//00474150
  end;
  TGLFloatDataImage = class(TGLTextureImage)
  public
    f28:TGLBitmap32;//f28
    f2C:Integer;//f2C
    f30:Integer;//f30
    destructor Destroy; virtual;//004784F0
    procedure Assign(Source:TPersistent); virtual;//v8//0047851C
    constructor vC; virtual;//vC//004784AC
    function GetHeight:Integer; virtual;//v14//004785B0
    function GetWidth:Integer; virtual;//v18//0047858C
    //procedure v1C(?:?); virtual;//v1C//0047884C
    //procedure v20(?:?); virtual;//v20//00478878
    //function v24:?; virtual;//v24//004788C0
    //function v28:?; virtual;//v28//004785B4
    procedure v2C; virtual;//v2C//004785EC
    //procedure sub_00472FD8(?:?); dynamic;//004786C8
    //procedure sub_00478604(?:?); dynamic;//00478604
    procedure SetWidth(Value:Integer);//0047856C
    procedure SetHeight(Value:Integer);//00478590
  end;
  TGLShader = class(TGLUpdateAbleComponent)
  public
    Enabled:Boolean;//f30
    f34:TList;//f34
    f38:TGLVirtualHandle;//f38
    f3C:byte;//f3C
    f40:dword;//f40
    f44:byte;//f44
    f45:byte;//f45
    destructor Destroy; virtual;//004741BC
    constructor Create(AOwner:TComponent); virtual;//v2C//00474158
    procedure v34; virtual;//v34//0047422C
    procedure v38; virtual; abstract;//v38//00402BEC
    procedure v3C; virtual; abstract;//v3C//00402BEC
    procedure sub_00474268; dynamic;//00474268
    procedure sub_00474264; dynamic;//00474264
    procedure SetEnabled(Value:Boolean);//004744B0
  end;
  TGLTextureFormat = (tfDefault, tfRGB, tfRGBA, tfRGB16, tfRGBA16, tfAlpha, tfLuminance, tfLuminanceAlpha, tfIntensity, tfNormalMap, tfRGBAFloat16, tfRGBAFloat32);
  TGLTextureCompression = (tcDefault, tcNone, tcStandard, tcHighQuality, tcHighSpeed);
  TGLTextureFilteringQuality = (tfIsotropic, tfAnisotropic);
  TGLTextureMappingMode = (tmmUser, tmmObjectLinear, tmmEyeLinear, tmmSphere, tmmCubeMapReflection, tmmCubeMapNormal, tmmCubeMapLight0, tmmCubeMapCamera);
  TGLTexture = class(TGLUpdateAbleObject)
  public
    f18:TGLTextureHandle;//f18
    TextureMode:TGLTextureMode;//f1C
    TextureWrap:TGLTextureWrap;//f1D
    TextureFormat:TGLTextureFormat;//f1E
    MinFilter:TGLMinFilter;//f1F
    MagFilter:TGLMagFilter;//f20
    f21:byte;//f21
    Disabled:Boolean;//f22
    Image:TGLTextureImage;//f24
    ImageAlpha:TGLTextureImageAlpha;//f28
    ImageBrightness:Single;//f2C
    ImageGamma:Single;//f30
    MappingMode:TGLTextureMappingMode;//f34
    f38:TGLCoordinates4;//f38
    f3C:TGLCoordinates4;//f3C
    Compression:TGLTextureCompression;//f48
    f4C:dword;//f4C
    FilteringQuality:TGLTextureFilteringQuality;//f50
    //f54:?;//f54
    //f58:?;//f58
    EnvColor:TGLColor;//f5C
    NormalMapScale:Single;//f60
    destructor Destroy; virtual;//00474634
    procedure Assign(Source:TPersistent); virtual;//v8//00474688
    constructor Create; virtual;//vC//00474570
    //procedure v10(?:?); virtual;//v10//0047478C
    //function v14:?; virtual;//v14//004754E8
    //procedure v18(?:?); virtual;//v18//00475758
    //procedure v1C(?:?); virtual;//v1C//00475958
    procedure SetImage(Value:TGLTextureImage);//004747EC
    procedure SetImageClassName(Value:String);//00474868
    //procedure GetImageClassName(?:?);//0047490C
    procedure SetImageAlpha(Value:TGLTextureImageAlpha);//00474938
    //procedure SetImageBrightness(Value:Single; ?:?);//00474948
    function IsStoredImageBrightness(Value:Single):Boolean;//0047496C
    //procedure SetImageGamma(Value:Single; ?:?);//00474984
    function IsStoredImageGamma(Value:Single):Boolean;//004749A8
    procedure SetMagFilter(Value:TGLMagFilter);//004749C0
    procedure SetMinFilter(Value:TGLMinFilter);//004749D0
    procedure SetTextureMode(Value:TGLTextureMode);//004749E0
    procedure SetDisabled(Value:Boolean);//004749F0
    procedure SetEnvColor(Value:TGLColor);//00474A84
    //procedure SetNormalMapScale(Value:Single; ?:?);//00474A98
    function IsStoredNormalMapScale(Value:Single):Boolean;//00474AC0
    procedure SetTextureWrap(Value:TGLTextureWrap);//00474AD8
    procedure SetTextureFormat(Value:TGLTextureFormat);//00474AE8
    procedure SetCompression(Value:TGLTextureCompression);//00474AF8
    procedure SetFilteringQuality(Value:TGLTextureFilteringQuality);//00474B08
    procedure SetMappingMode(Value:TGLTextureMappingMode);//00474B18
    procedure SetMappingSCoordinates(Value:TGLCoordinates4);//00474B74
    //function GetMappingSCoordinates:?;//00474B8C
    procedure SetMappingTCoordinates(Value:TGLCoordinates4);//00474BB4
    //function GetMappingTCoordinates:?;//00474BCC
    procedure IsStoredImageClassName(Value:String);//00474BF4
  end;
  TGLTextureExItem = class(TCollectionItem)
  public
    Texture:TGLTexture;//fC
    TextureIndex:Integer;//f10
    TextureOffset:TGLCoordinates;//f14
    TextureScale:TGLCoordinates;//f18
    //f20:?;//f20
    destructor Destroy; virtual;//00475BC8
    procedure Assign(Source:TPersistent); virtual;//v8//00475C08
    //procedure GetDisplayName(?:?); virtual;//vC//00475DA0
    constructor Create(Collection:TCollection); virtual;//v1C//00475B14
    procedure sub_0041ADA4; dynamic;//00475DE0
    procedure SetTexture(Value:TGLTexture);//00475DF8
    procedure SetTextureIndex(Value:Integer);//00475E10
    procedure SetTextureOffset(Value:TGLCoordinates);//00475E28
    procedure SetTextureScale(Value:TGLCoordinates);//00475E40
  end;
  TGLTextureEx = class(TCollection)
  public
    f18:dword;//f18
    procedure sub_0041ADA4; dynamic;//00476050
    constructor Create;//00475EC8
  end;
  TPolygonMode = (pmFill, pmLines, pmPoints);
  TGLFaceProperties = class(TGLUpdateAbleObject)
  public
    Ambient:TGLColor;//f18
    Diffuse:TGLColor;//f1C
    Specular:TGLColor;//f20
    Emission:TGLColor;//f24
    PolygonMode:TPolygonMode;//f28
    Shininess:TShininess;//f29
    destructor Destroy; virtual;//00472D3C
    procedure Assign(Source:TPersistent); virtual;//v8//00472E04
    constructor Create; virtual;//vC//00472CAC
    procedure SetAmbient(Value:TGLColor);//00472E84
    procedure SetDiffuse(Value:TGLColor);//00472EA0
    procedure SetEmission(Value:TGLColor);//00472EBC
    procedure SetSpecular(Value:TGLColor);//00472ED8
    procedure SetPolygonMode(Value:TPolygonMode);//00472EF4
    procedure SetShininess(Value:TShininess);//00472F04
  end;
  TBlendingMode = (bmOpaque, bmTransparency, bmAdditive, bmAlphaTest50, bmAlphaTest100, bmModulate);
  TFaceCulling = (fcBufferDefault, fcCull, fcNoCull);
  TMaterialOption = (moIgnoreFog, moNoLighting);
  TMaterialOptions = set of TMaterialOption;
  TGLMaterial = class(TGLUpdateAbleObject)
  public
    FrontProperties:TGLFaceProperties;//f18
    f1C:TGLFaceProperties;//f1C
    BlendingMode:TBlendingMode;//f20
    f24:TGLTexture;//f24
    f28:TGLTextureEx;//f28
    MaterialLibrary:TGLMaterialLibrary;//f2C
    LibMaterialName:String;//f30
    MaterialOptions:TMaterialOptions;//f34
    FaceCulling:TFaceCulling;//f35
    f38:dword;//f38
    destructor Destroy; virtual;//00476118
    procedure Assign(Source:TPersistent); virtual;//v8//00476808
    constructor Create; virtual;//vC//004760C8
    procedure v10; virtual;//v10//004768CC
    procedure SetBackProperties(Value:TGLFaceProperties);//0047616C
    //function GetBackProperties:?;//0047618C
    procedure SetFrontProperties(Value:TGLFaceProperties);//004761AC
    procedure SetBlendingMode(Value:TBlendingMode);//004761C4
    procedure SetMaterialOptions(Value:TMaterialOptions);//004761D4
    //function GetTexture:?;//004761F8
    procedure SetTexture(Value:TGLTexture);//00476218
    procedure SetFaceCulling(Value:TFaceCulling);//00476240
    procedure SetMaterialLibrary(Value:TGLMaterialLibrary);//00476250
    procedure SetLibMaterialName(Value:AnsiString);//00476290
    //function GetTextureEx:?;//00476378
    procedure SetTextureEx(Value:TGLTextureEx);//00476398
    function IsStoredTextureEx(Value:TGLTextureEx):Boolean;//004763BC
    procedure IsStoredBackProperties(Value:TGLFaceProperties);//00476410
  end;
  TGLLibMaterial = class(TCollectionItem)
  public
    fC:TList;//fC
    Name:String;//f10
    f14:dword;//f14
    Material:TGLMaterial;//f18
    TextureOffset:TGLCoordinates;//f1C
    TextureScale:TGLCoordinates;//f20
    f24:byte;//f24
    //f28:?;//f28
    Texture2Name:String;//f68
    Shader:TGLShader;//f6C
    f74:dword;//f74
    Tag:Integer;//f78
    destructor Destroy; virtual;//00476AB8
    procedure Assign(Source:TPersistent); virtual;//v8//00476B70
    //procedure GetDisplayName(?:?); virtual;//vC//00477204
    constructor Create(Collection:TCollection); virtual;//v1C//0047698C
    procedure SetName(Value:AnsiString);//00477258
    procedure SetMaterial(Value:TGLMaterial);//00477300
    procedure SetTextureOffset(Value:TGLCoordinates);//00477310
    procedure SetTextureScale(Value:TGLCoordinates);//0047732C
    procedure SetTexture2Name(Value:String);//00477348
    procedure SetShader(Value:TGLShader);//00477384
  end;
  TGLLibMaterials = class(TOwnedCollection)
    constructor Create;//0047759C
  end;
  TGLMaterialLibrary = class(TGLCadenceAbleComponent)
  public
    Materials:TGLLibMaterials;//f34
    TexturePaths:String;//f38
    OnTextureNeeded:TTextureNeededEvent;//f40
    f48:TStringList;//f48
    f4C:dword;//f4C
    destructor Destroy; virtual;//004777B0
    procedure Loaded; virtual;//vC//00477878
    constructor Create(AOwner:TComponent); virtual;//v2C//00477768
    //procedure sub_0047837C(?:?); dynamic;//0047837C
    //procedure sub_00478328(?:?); dynamic;//00478328
    procedure SetMaterials(Value:TGLLibMaterials);//0047788C
    function IsStoredMaterials(Value:TGLLibMaterials):Boolean;//0047789C
    procedure SetTexturePaths(Value:String);//00477964
  end;
  ETexture = class(Exception)
  end;
  .22 = array of String;
//elSize = 4
//varType equivalent: varStrArg;
  .32 = array of ?;
//elSize = 4;
    procedure sub_00472734(?:AnsiString; ?:TBitmap);//00472734
    //function sub_004727E0(?:AnsiString):?;//004727E0
    procedure sub_00472920(?:TGLTextureImage);//00472920
    //function sub_0047294C(?:String):?;//0047294C
    constructor Create;//00472A40
    destructor Destroy;//00472ADC
    //procedure sub_00472B10(?:TGLColor; ?:?);//00472B10
    procedure sub_00472B48(?:TGLColor);//00472B48
    procedure Assign(Source:TPersistent);//00472B88
    //procedure sub_00472BC8(?:?);//00472BC8
    //procedure sub_00472C48(?:?);//00472C48
    //function sub_00472C80(?:?):?;//00472C80
    //function sub_00472C84(?:?; ?:?; ?:?; ?:?; ?:?):?;//00472C84
    constructor Create;//00472CAC
    destructor Destroy;//00472D3C
    //procedure sub_00472D84(?:?; ?:?; ?:?);//00472D84
    //procedure sub_00472DD4(?:?; ?:?; ?:?);//00472DD4
    procedure Assign(Source:TPersistent);//00472E04
    constructor sub_00472F14;//00472F14
    destructor Destroy;//00472F60
    //procedure sub_00472F88(?:?);//00472F88
    //function sub_00472F98:?;//00472F98
    procedure sub_00472FA0;//00472FA0
    procedure sub_00472FBC;//00472FBC
    procedure sub_00472FC0;//00472FC0
    //procedure sub_00472FD8(?:?);//00472FD8
    constructor sub_00473030;//00473030
    destructor Destroy;//00473074
    procedure Assign(Source:TPersistent);//004730A0
    function GetWidth:Integer;//00473110
    function GetHeight:Integer;//00473134
    //function sub_00473138:?;//00473138
    procedure sub_00473170;//00473170
    //procedure sub_00473188(?:?);//00473188
    //procedure sub_00472FD8(?:?);//00473248
    //procedure sub_004733CC(?:?);//004733CC
    //procedure sub_004733F4(?:?);//004733F4
    constructor sub_00473430;//00473430
    destructor Destroy;//00473468
    procedure Assign(Source:TPersistent);//0047349C
    procedure sub_00473560;//00473560
    procedure sub_00473574;//00473574
    //function sub_00473588:?;//00473588
    procedure sub_0047363C;//0047363C
    procedure sub_00473654;//00473654
    constructor Create;//004736A4
    destructor Destroy;//004736DC
    //procedure sub_00473704(?:?);//00473704
    //procedure sub_00472FD8(?:?);//0047371C
    //procedure sub_00473810(?:?);//00473810
    //procedure sub_00473840(?:?);//00473840
    constructor sub_004738E8;//004738E8
    destructor Destroy;//00473920
    procedure Assign(Source:TPersistent);//00473948
    procedure sub_00472FA0;//004739AC
    //function sub_00473A20(?:?):?;//00473A20
    //procedure sub_00473BF0(?:?);//00473BF0
    //procedure sub_00472FD8(?:?);//00473BFC
    //procedure sub_00473CA0(?:?);//00473CA0
    //procedure sub_00473CCC(?:?);//00473CCC
    constructor sub_00473D10;//00473D10
    destructor Destroy;//00473D78
    procedure Assign(Source:TPersistent);//00473DC0
    procedure sub_00473E20;//00473E20
    procedure sub_00473E2C;//00473E2C
    //function sub_00473E38(?:?):?;//00473E38
    procedure sub_00473F28;//00473F28
    //procedure sub_00473F40(?:?);//00473F40
    //procedure sub_00472FD8(?:?);//00473FE8
    //procedure sub_004740F8(?:?);//004740F8
    //function sub_00474124:?;//00474124
    procedure sub_0047412C;//0047412C
    constructor Create(AOwner:TComponent);//00474158
    destructor Destroy;//004741BC
    procedure sub_0047422C;//0047422C
    procedure sub_00474264;//00474264
    procedure sub_00474268;//00474268
    //procedure sub_0047426C(?:?);//0047426C
    procedure sub_004742A4(?:TGLShader);//004742A4
    //procedure sub_00474340(?:?; ?:?; ?:?);//00474340
    //function sub_004743F0(?:?; ?:?):?;//004743F0
    //procedure sub_00474498(?:?; ?:?; ?:?);//00474498
    procedure sub_0047453C(?:TGLShader; ?:TGLLibMaterial);//0047453C
    procedure sub_00474560(?:TGLShader);//00474560
    constructor Create;//00474570
    destructor Destroy;//00474634
    procedure Assign(Source:TPersistent);//00474688
    //procedure sub_0047478C(?:?);//0047478C
    procedure sub_004747C4(?:TGLTexture);//004747C4
    procedure sub_004747D8(?:TGLTexture);//004747D8
    //procedure sub_00474A70(?:?; ?:?);//00474A70
    //function sub_00474A7C(?:?):?;//00474A7C
    //procedure sub_00474C3C(?:?);//00474C3C
    //procedure sub_00474C44(?:?);//00474C44
    //procedure sub_00474EE0(?:?);//00474EE0
    //procedure sub_00474F08(?:?; ?:?);//00474F08
    //procedure sub_00475190(?:?; ?:?);//00475190
    //function sub_004751F4(?:?; ?:?):?;//004751F4
    //function sub_00475204(?:?; ?:?):?;//00475204
    //procedure sub_00475214(?:?; ?:?; ?:?; ?:?);//00475214
    //procedure sub_00475394(?:?; ?:?; ?:?);//00475394
    procedure sub_0047540C(?:TGLTexture);//0047540C
    //function sub_004754DC(?:?):Boolean;//004754DC
    //function sub_004754E8:?;//004754E8
    procedure sub_004755C8(?:TGLTexture);//004755C8
    function sub_004755E8(?:TGLTexture):Boolean;//004755E8
    //function sub_004755F4(?:TGLTexture):?;//004755F4
    //procedure sub_00475758(?:?);//00475758
    //procedure sub_00475958(?:?);//00475958
    //procedure sub_00475B00(?:?);//00475B00
    constructor Create(Collection:TCollection);//00475B14
    destructor Destroy;//00475BC8
    procedure Assign(Source:TPersistent);//00475C08
    procedure sub_00475C64(?:TGLTextureExItem);//00475C64
    //procedure sub_00475C74(?:?; ?:?);//00475C74
    //procedure sub_00475D20(?:?);//00475D20
    //procedure GetDisplayName(?:?);//00475DA0
    procedure sub_0041ADA4;//00475DE0
    procedure sub_00475DE4(?:dword);//00475DE4
    //procedure sub_00475E58(?:?);//00475E58
    procedure sub_00475F0C(?:TCollection);//00475F0C
    //procedure sub_00475F20(?:?; ?:?);//00475F20
    //procedure sub_00475FDC(?:?; ?:?);//00475FDC
    //function sub_00476018(?:?):?;//00476018
    //procedure sub_00476024(?:?);//00476024
    procedure sub_0041ADA4;//00476050
    //function sub_00476054(?:?; ?:?):?;//00476054
    //function sub_00476068(?:?; ?:?):?;//00476068
    constructor Create;//004760C8
    destructor Destroy;//00476118
    //function sub_0047625C(?:?):Boolean;//0047625C
    procedure sub_004763E0(?:Pointer);//004763E0
    procedure sub_004763F8(?:TGLMaterial);//004763F8
    //procedure sub_0047641C(?:?);//0047641C
    //procedure sub_00476434(?:TGLMaterial; ?:?);//00476434
    //function sub_00476760(?:TGLMaterial; ?:?):?;//00476760
    procedure Assign(Source:TPersistent);//00476808
    procedure sub_004768CC;//004768CC
    procedure sub_00476910(?:TGLMaterial);//00476910
    procedure sub_00476954(?:TGLMaterial);//00476954
    //function sub_00476964(?:TGLMaterial):?;//00476964
    constructor Create(Collection:TCollection);//0047698C
    destructor Destroy;//00476AB8
    procedure Assign(Source:TPersistent);//00476B70
    procedure sub_00476C24(?:TCollectionItem);//00476C24
    //procedure sub_00476C34(?:?; ?:?);//00476C34
    //function sub_00476DB0(?:?; ?:?):?;//00476DB0
    //procedure sub_00476E58(?:?; ?:TGLMaterial);//00476E58
    procedure sub_00476EE8(?:dword);//00476EE8
    //procedure sub_00476EF4(?:?; ?:?);//00476EF4
    //procedure sub_00476F84(?:?);//00476F84
    procedure sub_00476F90(?:Pointer);//00476F90
    procedure sub_004770EC(?:dword);//004770EC
    //procedure GetDisplayName(?:?);//00477204
    //procedure sub_00477218(?:?);//00477218
    //function sub_0047722C(?:TGLLibMaterial; ?:String):?;//0047722C
    procedure sub_004773B8(?:TGLLibMaterial);//004773B8
    //procedure sub_0047741C(?:?);//0047741C
    procedure sub_004775D8(?:TGLLibMaterials);//004775D8
    //function sub_00477604(?:TGLLibMaterials; ?:?):?;//00477604
    //procedure sub_00477618(?:?);//00477618
    //function sub_00477644(?:?):?;//00477644
    procedure sub_0047765C(?:TCollection; ?:AnsiString; ?:TCollection);//0047765C
    //function sub_004776DC(?:TCollection; ?:AnsiString):?;//004776DC
    procedure sub_0047773C(?:TGLLibMaterials);//0047773C
    constructor Create(AOwner:TComponent);//00477768
    destructor Destroy;//004777B0
    procedure sub_00477868(?:TGLMaterialLibrary);//00477868
    procedure Loaded;//00477878
    //procedure sub_004778B0(?:?);//004778B0
    procedure sub_004779FC(?:TGLMaterialLibrary; ?:TBinaryWriter);//004779FC
    procedure sub_00477EA0(?:TGLMaterialLibrary; ?:TBinaryReader);//00477EA0
    //procedure sub_00478328(?:?);//00478328
    //procedure sub_0047837C(?:?);//0047837C
    //function sub_004783D0(?:?; ?:?; ?:TBitmap):?;//004783D0
    //function sub_00478428(?:TGLMaterialLibrary):?;//00478428
    //procedure sub_00478438(?:?; ?:?; ?:?);//00478438
    constructor sub_004784AC;//004784AC
    destructor Destroy;//004784F0
    procedure Assign(Source:TPersistent);//0047851C
    function GetWidth:Integer;//0047858C
    function GetHeight:Integer;//004785B0
    //function sub_004785B4:?;//004785B4
    procedure sub_004785EC;//004785EC
    //procedure sub_00478604(?:?);//00478604
    //procedure sub_00472FD8(?:?);//004786C8
    //procedure sub_0047884C(?:?);//0047884C
    //procedure sub_00478878(?:?);//00478878
    //function sub_004788C0:?;//004788C0

implementation

//00472734
procedure sub_00472734(?:AnsiString; ?:TBitmap);
begin
{*
 00472734    push        ebp
 00472735    mov         ebp,esp
 00472737    add         esp,0FFFFFFF8
 0047273A    push        ebx
 0047273B    push        esi
 0047273C    push        edi
 0047273D    xor         ecx,ecx
 0047273F    mov         dword ptr [ebp-8],ecx
 00472742    mov         dword ptr [ebp-4],edx
 00472745    mov         edi,eax
 00472747    xor         eax,eax
 00472749    push        ebp
 0047274A    push        4727D1
 0047274F    push        dword ptr fs:[eax]
 00472752    mov         dword ptr fs:[eax],esp
 00472755    mov         eax,[005E14F0];gvar_005E14F0:?
 0047275A    call        @DynArrayLength
 0047275F    mov         ebx,eax
 00472761    lea         esi,[ebx+1]
 00472764    push        esi
 00472765    mov         eax,5E14F0;gvar_005E14F0:?
 0047276A    mov         ecx,1
 0047276F    mov         edx,dword ptr ds:[4726EC];.22
 00472775    call        @DynArraySetLength
 0047277A    add         esp,4
 0047277D    push        esi
 0047277E    mov         eax,5E14F4;gvar_005E14F4:?
 00472783    mov         ecx,1
 00472788    mov         edx,dword ptr ds:[472710];.32
 0047278E    call        @DynArraySetLength
 00472793    add         esp,4
 00472796    lea         edx,[ebp-8]
 00472799    mov         eax,edi
 0047279B    call        LowerCase
 004727A0    mov         edx,dword ptr [ebp-8]
 004727A3    mov         eax,[005E14F0];gvar_005E14F0:?
 004727A8    lea         eax,[eax+ebx*4]
 004727AB    call        @LStrAsg
 004727B0    mov         eax,[005E14F4];gvar_005E14F4:?
 004727B5    mov         edx,dword ptr [ebp-4]
 004727B8    mov         dword ptr [eax+ebx*4],edx
 004727BB    xor         eax,eax
 004727BD    pop         edx
 004727BE    pop         ecx
 004727BF    pop         ecx
 004727C0    mov         dword ptr fs:[eax],edx
 004727C3    push        4727D8
 004727C8    lea         eax,[ebp-8]
 004727CB    call        @LStrClr
 004727D0    ret
>004727D1    jmp         @HandleFinally
>004727D6    jmp         004727C8
 004727D8    pop         edi
 004727D9    pop         esi
 004727DA    pop         ebx
 004727DB    pop         ecx
 004727DC    pop         ecx
 004727DD    pop         ebp
 004727DE    ret
*}
end;

//004727E0
{*function sub_004727E0(?:AnsiString):?;
begin
 004727E0    push        ebp
 004727E1    mov         ebp,esp
 004727E3    add         esp,0FFFFFFEC
 004727E6    push        ebx
 004727E7    push        esi
 004727E8    push        edi
 004727E9    xor         edx,edx
 004727EB    mov         dword ptr [ebp-14],edx
 004727EE    mov         dword ptr [ebp-0C],edx
 004727F1    mov         dword ptr [ebp-4],eax
 004727F4    xor         eax,eax
 004727F6    push        ebp
 004727F7    push        47290E
 004727FC    push        dword ptr fs:[eax]
 004727FF    mov         dword ptr fs:[eax],esp
 00472802    xor         eax,eax
 00472804    mov         dword ptr [ebp-8],eax
 00472807    mov         eax,dword ptr [ebp-4]
 0047280A    call        00465B88
 0047280F    test        al,al
>00472811    je          004728F0
 00472817    xor         edi,edi
 00472819    lea         edx,[ebp-14]
 0047281C    mov         eax,dword ptr [ebp-4]
 0047281F    call        ExtractFileExt
 00472824    mov         eax,dword ptr [ebp-14]
 00472827    lea         edx,[ebp-0C]
 0047282A    call        LowerCase
 0047282F    mov         eax,[005E14F0];gvar_005E14F0:?
 00472834    call        @DynArrayHigh
 00472839    mov         esi,eax
 0047283B    test        esi,esi
>0047283D    jl          00472862
 0047283F    inc         esi
 00472840    xor         ebx,ebx
 00472842    mov         eax,[005E14F0];gvar_005E14F0:?
 00472847    mov         eax,dword ptr [eax+ebx*4]
 0047284A    mov         edx,dword ptr [ebp-0C]
 0047284D    call        @LStrCmp
>00472852    jne         0047285E
 00472854    mov         eax,[005E14F4];gvar_005E14F4:?
 00472859    mov         edi,dword ptr [eax+ebx*4]
>0047285C    jmp         00472862
 0047285E    inc         ebx
 0047285F    dec         esi
>00472860    jne         00472842
 00472862    test        edi,edi
>00472864    jne         00472870
 00472866    mov         eax,dword ptr [ebp-0C]
 00472869    call        0046F290
 0047286E    mov         edi,eax
 00472870    test        edi,edi
>00472872    je          004728F0
 00472874    mov         dl,1
 00472876    mov         eax,edi
 00472878    call        dword ptr [eax+48]
 0047287B    mov         dword ptr [ebp-8],eax
 0047287E    xor         eax,eax
 00472880    push        ebp
 00472881    push        4728D9
 00472886    push        dword ptr fs:[eax]
 00472889    mov         dword ptr fs:[eax],esp
 0047288C    xor         edx,edx
 0047288E    mov         eax,dword ptr [ebp-4]
 00472891    call        00465A70
 00472896    mov         dword ptr [ebp-10],eax
 00472899    xor         eax,eax
 0047289B    push        ebp
 0047289C    push        4728C8
 004728A1    push        dword ptr fs:[eax]
 004728A4    mov         dword ptr fs:[eax],esp
 004728A7    mov         edx,dword ptr [ebp-10]
 004728AA    mov         eax,dword ptr [ebp-8]
 004728AD    mov         ecx,dword ptr [eax]
 004728AF    call        dword ptr [ecx+54]
 004728B2    xor         eax,eax
 004728B4    pop         edx
 004728B5    pop         ecx
 004728B6    pop         ecx
 004728B7    mov         dword ptr fs:[eax],edx
 004728BA    push        4728CF
 004728BF    mov         eax,dword ptr [ebp-10]
 004728C2    call        TObject.Free
 004728C7    ret
>004728C8    jmp         @HandleFinally
>004728CD    jmp         004728BF
 004728CF    xor         eax,eax
 004728D1    pop         edx
 004728D2    pop         ecx
 004728D3    pop         ecx
 004728D4    mov         dword ptr fs:[eax],edx
>004728D7    jmp         004728F0
>004728D9    jmp         @HandleAnyException
 004728DE    lea         eax,[ebp-8]
 004728E1    call        FreeAndNil
 004728E6    call        @RaiseAgain
 004728EB    call        @DoneExcept
 004728F0    xor         eax,eax
 004728F2    pop         edx
 004728F3    pop         ecx
 004728F4    pop         ecx
 004728F5    mov         dword ptr fs:[eax],edx
 004728F8    push        472915
 004728FD    lea         eax,[ebp-14]
 00472900    call        @LStrClr
 00472905    lea         eax,[ebp-0C]
 00472908    call        @LStrClr
 0047290D    ret
>0047290E    jmp         @HandleFinally
>00472913    jmp         004728FD
 00472915    mov         eax,dword ptr [ebp-8]
 00472918    pop         edi
 00472919    pop         esi
 0047291A    pop         ebx
 0047291B    mov         esp,ebp
 0047291D    pop         ebp
 0047291E    ret
end;*}

//00472920
procedure sub_00472920(?:TGLTextureImage);
begin
{*
 00472920    push        ebx
 00472921    mov         ebx,eax
 00472923    cmp         dword ptr ds:[5E14E0],0;gvar_005E14E0:TList
>0047292A    jne         0047293D
 0047292C    mov         dl,1
 0047292E    mov         eax,[00417CEC];TList
 00472933    call        TObject.Create;TList.Create
 00472938    mov         [005E14E0],eax;gvar_005E14E0:TList
 0047293D    mov         edx,ebx
 0047293F    mov         eax,[005E14E0];gvar_005E14E0:TList
 00472944    call        TList.Add
 00472949    pop         ebx
 0047294A    ret
*}
end;

//0047294C
{*function sub_0047294C(?:String):?;
begin
 0047294C    push        ebp
 0047294D    mov         ebp,esp
 0047294F    add         esp,0FFFFFEF4
 00472955    push        ebx
 00472956    push        esi
 00472957    push        edi
 00472958    xor         edx,edx
 0047295A    mov         dword ptr [ebp-0C],edx
 0047295D    mov         dword ptr [ebp-4],eax
 00472960    xor         eax,eax
 00472962    push        ebp
 00472963    push        4729E1
 00472968    push        dword ptr fs:[eax]
 0047296B    mov         dword ptr fs:[eax],esp
 0047296E    xor         eax,eax
 00472970    mov         dword ptr [ebp-8],eax
 00472973    cmp         dword ptr ds:[5E14E0],0;gvar_005E14E0:TList
>0047297A    je          004729CB
 0047297C    mov         eax,[005E14E0];gvar_005E14E0:TList
 00472981    mov         esi,dword ptr [eax+8]
 00472984    dec         esi
 00472985    test        esi,esi
>00472987    jl          004729CB
 00472989    inc         esi
 0047298A    xor         edi,edi
 0047298C    mov         edx,edi
 0047298E    mov         eax,[005E14E0];gvar_005E14E0:TList
 00472993    call        TList.Get
 00472998    mov         ebx,eax
 0047299A    lea         edx,[ebp-10C]
 004729A0    mov         eax,ebx
 004729A2    call        TObject.ClassName
 004729A7    lea         edx,[ebp-10C]
 004729AD    lea         eax,[ebp-0C]
 004729B0    call        @LStrFromString
 004729B5    mov         eax,dword ptr [ebp-0C]
 004729B8    mov         edx,dword ptr [ebp-4]
 004729BB    call        @LStrCmp
>004729C0    jne         004729C7
 004729C2    mov         dword ptr [ebp-8],ebx
>004729C5    jmp         004729CB
 004729C7    inc         edi
 004729C8    dec         esi
>004729C9    jne         0047298C
 004729CB    xor         eax,eax
 004729CD    pop         edx
 004729CE    pop         ecx
 004729CF    pop         ecx
 004729D0    mov         dword ptr fs:[eax],edx
 004729D3    push        4729E8
 004729D8    lea         eax,[ebp-0C]
 004729DB    call        @LStrClr
 004729E0    ret
>004729E1    jmp         @HandleFinally
>004729E6    jmp         004729D8
 004729E8    mov         eax,dword ptr [ebp-8]
 004729EB    pop         edi
 004729EC    pop         esi
 004729ED    pop         ebx
 004729EE    mov         esp,ebp
 004729F0    pop         ebp
 004729F1    ret
end;*}

//00472A40
constructor TGLColor.Create;
begin
{*
 00472A40    push        ebx
 00472A41    push        esi
 00472A42    test        dl,dl
>00472A44    je          00472A4E
 00472A46    add         esp,0FFFFFFF0
 00472A49    call        @ClassCreate
 00472A4E    mov         ebx,edx
 00472A50    mov         esi,eax
 00472A52    xor         edx,edx
 00472A54    mov         eax,esi
 00472A56    call        0046B394
 00472A5B    mov         edx,5AD41C;gvar_005AD41C
 00472A60    mov         eax,esi
 00472A62    call        00472B10
 00472A67    mov         eax,esi
 00472A69    test        bl,bl
>00472A6B    je          00472A7C
 00472A6D    call        @AfterConstruction
 00472A72    pop         dword ptr fs:[0]
 00472A79    add         esp,0C
 00472A7C    mov         eax,esi
 00472A7E    pop         esi
 00472A7F    pop         ebx
 00472A80    ret
*}
end;

//00472A84
{*constructor TGLColor.Create(?:?; ?:?; ?:?);
begin
 00472A84    push        ebp
 00472A85    mov         ebp,esp
 00472A87    push        ecx
 00472A88    push        ebx
 00472A89    push        esi
 00472A8A    test        dl,dl
>00472A8C    je          00472A96
 00472A8E    add         esp,0FFFFFFF0
 00472A91    call        @ClassCreate
 00472A96    mov         byte ptr [ebp-1],dl
 00472A99    mov         ebx,eax
 00472A9B    xor         edx,edx
 00472A9D    mov         eax,ebx
 00472A9F    mov         esi,dword ptr [eax]
 00472AA1    call        dword ptr [esi+0C]
 00472AA4    mov         edx,dword ptr [ebp+10]
 00472AA7    mov         eax,ebx
 00472AA9    call        00472B10
 00472AAE    mov         eax,dword ptr [ebp+8]
 00472AB1    mov         dword ptr [ebx+10],eax
 00472AB4    mov         eax,dword ptr [ebp+0C]
 00472AB7    mov         dword ptr [ebx+14],eax
 00472ABA    mov         eax,ebx
 00472ABC    cmp         byte ptr [ebp-1],0
>00472AC0    je          00472AD1
 00472AC2    call        @AfterConstruction
 00472AC7    pop         dword ptr fs:[0]
 00472ACE    add         esp,0C
 00472AD1    mov         eax,ebx
 00472AD3    pop         esi
 00472AD4    pop         ebx
 00472AD5    pop         ecx
 00472AD6    pop         ebp
 00472AD7    ret         0C
end;*}

//00472ADC
destructor TGLColor.Destroy;
begin
{*
 00472ADC    push        ebx
 00472ADD    push        esi
 00472ADE    call        @BeforeDestruction
 00472AE3    mov         ebx,edx
 00472AE5    mov         esi,eax
 00472AE7    mov         eax,dword ptr [esi+28];TGLColor.?f28:Pointer
 00472AEA    mov         edx,10
 00472AEF    call        @FreeMem
 00472AF4    mov         edx,ebx
 00472AF6    and         dl,0FC
 00472AF9    mov         eax,esi
 00472AFB    call        TMemoryStream.Destroy
 00472B00    test        bl,bl
>00472B02    jle         00472B0B
 00472B04    mov         eax,esi
 00472B06    call        @ClassDestroy
 00472B0B    pop         esi
 00472B0C    pop         ebx
 00472B0D    ret
*}
end;

//00472B10
{*procedure sub_00472B10(?:TGLColor; ?:?);
begin
 00472B10    push        ebx
 00472B11    push        esi
 00472B12    push        edi
 00472B13    mov         esi,edx
 00472B15    mov         ebx,eax
 00472B17    mov         edx,esi
 00472B19    lea         eax,[ebx+18];TGLColor.Red:Single
 00472B1C    call        0045C9C0
 00472B21    mov         eax,[005AE6C4];^gvar_005AD1E0
 00472B26    cmp         byte ptr [eax],0
>00472B29    je          00472B43
 00472B2B    mov         eax,10
 00472B30    call        @GetMem
 00472B35    mov         edi,eax
 00472B37    mov         dword ptr [ebx+28],edi;TGLColor.?f28:Pointer
 00472B3A    mov         edx,esi
 00472B3C    mov         eax,edi
 00472B3E    call        0045C9C0
 00472B43    pop         edi
 00472B44    pop         esi
 00472B45    pop         ebx
 00472B46    ret
end;*}

//00472B48
procedure sub_00472B48(?:TGLColor);
begin
{*
 00472B48    push        ebx
 00472B49    mov         ebx,eax
 00472B4B    lea         eax,[ebx+18]
 00472B4E    call        0045C9C0
 00472B53    mov         edx,ebx
 00472B55    mov         eax,ebx
 00472B57    mov         ecx,dword ptr [eax]
 00472B59    call        dword ptr [ecx+10]
 00472B5C    pop         ebx
 00472B5D    ret
*}
end;

//00472B60
{*procedure TGLColor.SetRed(Value:Single; ?:?);
begin
 00472B60    push        ebp
 00472B61    mov         ebp,esp
 00472B63    mov         ecx,eax
 00472B65    fld         dword ptr [ecx+edx*4+18]
 00472B69    fcomp       dword ptr [ebp+8]
 00472B6C    fnstsw      al
 00472B6E    sahf
>00472B6F    je          00472B81
 00472B71    mov         eax,dword ptr [ebp+8]
 00472B74    mov         dword ptr [ecx+edx*4+18],eax
 00472B78    mov         edx,ecx
 00472B7A    mov         eax,ecx
 00472B7C    mov         ecx,dword ptr [eax]
 00472B7E    call        dword ptr [ecx+10];TGLColor.sub_00472C48
 00472B81    pop         ebp
 00472B82    ret         4
end;*}

//00472B88
procedure TGLColor.Assign(Source:TPersistent);
begin
{*
 00472B88    push        ebx
 00472B89    push        esi
 00472B8A    push        edi
 00472B8B    mov         esi,edx
 00472B8D    mov         ebx,eax
 00472B8F    test        esi,esi
>00472B91    je          00472BB9
 00472B93    mov         eax,esi
 00472B95    mov         edx,dword ptr ds:[470BF8];TGLColor
 00472B9B    call        @IsClass
 00472BA0    test        al,al
>00472BA2    je          00472BB9
 00472BA4    add         esi,18
 00472BA7    lea         edi,[ebx+18];TGLColor.Red:Single
 00472BAA    movs        dword ptr [edi],dword ptr [esi]
 00472BAB    movs        dword ptr [edi],dword ptr [esi]
 00472BAC    movs        dword ptr [edi],dword ptr [esi]
 00472BAD    movs        dword ptr [edi],dword ptr [esi]
 00472BAE    mov         edx,ebx
 00472BB0    mov         eax,ebx
 00472BB2    mov         ecx,dword ptr [eax]
 00472BB4    call        dword ptr [ecx+10];TGLColor.sub_00472C48
>00472BB7    jmp         00472BC2
 00472BB9    mov         edx,esi
 00472BBB    mov         eax,ebx
 00472BBD    call        TPersistent.Assign
 00472BC2    pop         edi
 00472BC3    pop         esi
 00472BC4    pop         ebx
 00472BC5    ret
*}
end;

//00472BC8
{*procedure sub_00472BC8(?:?);
begin
 00472BC8    push        ebx
 00472BC9    push        esi
 00472BCA    push        edi
 00472BCB    mov         esi,edx
 00472BCD    mov         ebx,eax
 00472BCF    mov         edx,esi
 00472BD1    mov         eax,ebx
 00472BD3    call        0041ACF0
 00472BD8    push        ebx
 00472BD9    push        472C20
 00472BDE    push        ebx
 00472BDF    push        472C34
 00472BE4    mov         edi,dword ptr [ebx+28];TGLColor.?f28:Pointer
 00472BE7    test        edi,edi
>00472BE9    je          00472BFD
 00472BEB    mov         edx,edi
 00472BED    lea         eax,[ebx+18];TGLColor.Red:Single
 00472BF0    call        0045D870
 00472BF5    test        al,al
>00472BF7    je          00472BFD
 00472BF9    xor         ecx,ecx
>00472BFB    jmp         00472BFF
 00472BFD    mov         cl,1
 00472BFF    mov         edx,472C18;'Color'
 00472C04    mov         eax,esi
 00472C06    mov         ebx,dword ptr [eax]
 00472C08    call        dword ptr [ebx+8]
 00472C0B    pop         edi
 00472C0C    pop         esi
 00472C0D    pop         ebx
 00472C0E    ret
end;*}

//00472C48
{*procedure sub_00472C48(?:?);
begin
 00472C48    push        ebx
 00472C49    push        esi
 00472C4A    push        edi
 00472C4B    mov         edi,edx
 00472C4D    mov         ebx,eax
 00472C4F    mov         esi,dword ptr [ebx+4];TGLColor.?f4:dword
 00472C52    test        esi,esi
>00472C54    je          00472C7B
 00472C56    mov         eax,esi
 00472C58    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 00472C5E    call        @IsClass
 00472C63    test        al,al
>00472C65    je          00472C72
 00472C67    mov         eax,esi
 00472C69    mov         si,0FFE7
 00472C6D    call        @CallDynaInst
 00472C72    mov         edx,edi
 00472C74    mov         eax,ebx
 00472C76    call        0046B3D0
 00472C7B    pop         edi
 00472C7C    pop         esi
 00472C7D    pop         ebx
 00472C7E    ret
end;*}

//00472C80
{*function sub_00472C80(?:?):?;
begin
 00472C80    add         eax,18
 00472C83    ret
end;*}

//00472C84
{*function sub_00472C84(?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00472C84    push        ebp
 00472C85    mov         ebp,esp
 00472C87    mov         edx,dword ptr [ebp+14]
 00472C8A    mov         dword ptr [eax+18],edx
 00472C8D    mov         edx,dword ptr [ebp+10]
 00472C90    mov         dword ptr [eax+1C],edx
 00472C93    mov         edx,dword ptr [ebp+0C]
 00472C96    mov         dword ptr [eax+20],edx
 00472C99    mov         edx,dword ptr [ebp+8]
 00472C9C    mov         dword ptr [eax+24],edx
 00472C9F    mov         edx,eax
 00472CA1    mov         ecx,dword ptr [eax]
 00472CA3    call        dword ptr [ecx+10]
 00472CA6    pop         ebp
 00472CA7    ret         10
end;*}

//00472CAC
constructor TGLFaceProperties.Create;
begin
{*
 00472CAC    push        ebx
 00472CAD    push        esi
 00472CAE    test        dl,dl
>00472CB0    je          00472CBA
 00472CB2    add         esp,0FFFFFFF0
 00472CB5    call        @ClassCreate
 00472CBA    mov         ebx,edx
 00472CBC    mov         esi,eax
 00472CBE    xor         edx,edx
 00472CC0    mov         eax,esi
 00472CC2    call        0046B394
 00472CC7    push        5AD42C;gvar_005AD42C
 00472CCC    push        0
 00472CCE    push        0
 00472CD0    mov         ecx,esi
 00472CD2    mov         dl,1
 00472CD4    mov         eax,[00470BF8];TGLColor
 00472CD9    call        TGLColor.Create;TGLColor.Create
 00472CDE    mov         dword ptr [esi+18],eax;TGLFaceProperties.Ambient:TGLColor
 00472CE1    push        5AD43C
 00472CE6    push        0
 00472CE8    push        0
 00472CEA    mov         ecx,esi
 00472CEC    mov         dl,1
 00472CEE    mov         eax,[00470BF8];TGLColor
 00472CF3    call        TGLColor.Create;TGLColor.Create
 00472CF8    mov         dword ptr [esi+1C],eax;TGLFaceProperties.Diffuse:TGLColor
 00472CFB    mov         ecx,esi
 00472CFD    mov         dl,1
 00472CFF    mov         eax,[00470BF8];TGLColor
 00472D04    call        TGLColor.Create;TGLColor.Create
 00472D09    mov         dword ptr [esi+24],eax;TGLFaceProperties.Emission:TGLColor
 00472D0C    mov         ecx,esi
 00472D0E    mov         dl,1
 00472D10    mov         eax,[00470BF8];TGLColor
 00472D15    call        TGLColor.Create;TGLColor.Create
 00472D1A    mov         dword ptr [esi+20],eax;TGLFaceProperties.Specular:TGLColor
 00472D1D    mov         byte ptr [esi+29],0;TGLFaceProperties.Shininess:TShininess
 00472D21    mov         eax,esi
 00472D23    test        bl,bl
>00472D25    je          00472D36
 00472D27    call        @AfterConstruction
 00472D2C    pop         dword ptr fs:[0]
 00472D33    add         esp,0C
 00472D36    mov         eax,esi
 00472D38    pop         esi
 00472D39    pop         ebx
 00472D3A    ret
*}
end;

//00472D3C
destructor TGLFaceProperties.Destroy;
begin
{*
 00472D3C    push        ebx
 00472D3D    push        esi
 00472D3E    call        @BeforeDestruction
 00472D43    mov         ebx,edx
 00472D45    mov         esi,eax
 00472D47    mov         eax,dword ptr [esi+18];TGLFaceProperties.Ambient:TGLColor
 00472D4A    call        TObject.Free
 00472D4F    mov         eax,dword ptr [esi+1C];TGLFaceProperties.Diffuse:TGLColor
 00472D52    call        TObject.Free
 00472D57    mov         eax,dword ptr [esi+24];TGLFaceProperties.Emission:TGLColor
 00472D5A    call        TObject.Free
 00472D5F    mov         eax,dword ptr [esi+20];TGLFaceProperties.Specular:TGLColor
 00472D62    call        TObject.Free
 00472D67    mov         edx,ebx
 00472D69    and         dl,0FC
 00472D6C    mov         eax,esi
 00472D6E    call        TMemoryStream.Destroy
 00472D73    test        bl,bl
>00472D75    jle         00472D7E
 00472D77    mov         eax,esi
 00472D79    call        @ClassDestroy
 00472D7E    pop         esi
 00472D7F    pop         ebx
 00472D80    ret
*}
end;

//00472D84
{*procedure sub_00472D84(?:?; ?:?; ?:?);
begin
 00472D84    push        ebx
 00472D85    push        esi
 00472D86    push        edi
 00472D87    mov         edi,ecx
 00472D89    mov         esi,edx
 00472D8B    mov         ebx,eax
 00472D8D    mov         eax,dword ptr [ebx+18]
 00472D90    add         eax,18
 00472D93    push        eax
 00472D94    mov         eax,dword ptr [ebx+1C]
 00472D97    add         eax,18
 00472D9A    push        eax
 00472D9B    mov         eax,dword ptr [ebx+20]
 00472D9E    add         eax,18
 00472DA1    push        eax
 00472DA2    xor         eax,eax
 00472DA4    mov         al,byte ptr [ebx+29]
 00472DA7    push        eax
 00472DA8    mov         eax,dword ptr [ebx+24]
 00472DAB    lea         ecx,[eax+18]
 00472DAE    mov         eax,dword ptr [esi+5C]
 00472DB1    mov         edx,edi
 00472DB3    call        0046D6EC
 00472DB8    xor         eax,eax
 00472DBA    mov         al,byte ptr [ebx+28]
 00472DBD    mov         ecx,dword ptr [eax*4+5AD484]
 00472DC4    mov         eax,dword ptr [esi+5C]
 00472DC7    mov         edx,edi
 00472DC9    call        0046D670
 00472DCE    pop         edi
 00472DCF    pop         esi
 00472DD0    pop         ebx
 00472DD1    ret
end;*}

//00472DD4
{*procedure sub_00472DD4(?:?; ?:?; ?:?);
begin
 00472DD4    push        ebx
 00472DD5    push        esi
 00472DD6    push        edi
 00472DD7    mov         edi,ecx
 00472DD9    mov         esi,edx
 00472DDB    mov         ebx,eax
 00472DDD    mov         eax,dword ptr [ebx+1C]
 00472DE0    add         eax,18
 00472DE3    push        eax
 00472DE4    call        OpenGL32.glColor4fv
 00472DE9    xor         eax,eax
 00472DEB    mov         al,byte ptr [ebx+28]
 00472DEE    mov         ecx,dword ptr [eax*4+5AD490]
 00472DF5    mov         eax,dword ptr [esi+5C]
 00472DF8    mov         edx,edi
 00472DFA    call        0046D670
 00472DFF    pop         edi
 00472E00    pop         esi
 00472E01    pop         ebx
 00472E02    ret
end;*}

//00472E04
procedure TGLFaceProperties.Assign(Source:TPersistent);
begin
{*
 00472E04    push        ebx
 00472E05    push        esi
 00472E06    push        edi
 00472E07    mov         esi,edx
 00472E09    mov         ebx,eax
 00472E0B    test        esi,esi
>00472E0D    je          00472E7D
 00472E0F    mov         eax,esi
 00472E11    mov         edx,dword ptr ds:[471E24];TGLFaceProperties
 00472E17    call        @IsClass
 00472E1C    test        al,al
>00472E1E    je          00472E7D
 00472E20    mov         eax,esi
 00472E22    mov         edx,dword ptr [eax+18]
 00472E25    mov         ecx,dword ptr [ebx+18];TGLFaceProperties.Ambient:TGLColor
 00472E28    push        esi
 00472E29    lea         esi,[edx+18]
 00472E2C    lea         edi,[ecx+18];TGLColor.Red:Single
 00472E2F    movs        dword ptr [edi],dword ptr [esi]
 00472E30    movs        dword ptr [edi],dword ptr [esi]
 00472E31    movs        dword ptr [edi],dword ptr [esi]
 00472E32    movs        dword ptr [edi],dword ptr [esi]
 00472E33    pop         esi
 00472E34    mov         edx,dword ptr [eax+1C]
 00472E37    mov         ecx,dword ptr [ebx+1C];TGLFaceProperties.Diffuse:TGLColor
 00472E3A    push        esi
 00472E3B    lea         esi,[edx+18]
 00472E3E    lea         edi,[ecx+18];TGLColor.Red:Single
 00472E41    movs        dword ptr [edi],dword ptr [esi]
 00472E42    movs        dword ptr [edi],dword ptr [esi]
 00472E43    movs        dword ptr [edi],dword ptr [esi]
 00472E44    movs        dword ptr [edi],dword ptr [esi]
 00472E45    pop         esi
 00472E46    mov         edx,dword ptr [eax+20]
 00472E49    mov         ecx,dword ptr [ebx+20];TGLFaceProperties.Specular:TGLColor
 00472E4C    push        esi
 00472E4D    lea         esi,[edx+18]
 00472E50    lea         edi,[ecx+18];TGLColor.Red:Single
 00472E53    movs        dword ptr [edi],dword ptr [esi]
 00472E54    movs        dword ptr [edi],dword ptr [esi]
 00472E55    movs        dword ptr [edi],dword ptr [esi]
 00472E56    movs        dword ptr [edi],dword ptr [esi]
 00472E57    pop         esi
 00472E58    mov         dl,byte ptr [eax+29]
 00472E5B    mov         byte ptr [ebx+29],dl;TGLFaceProperties.Shininess:TShininess
 00472E5E    mov         dl,byte ptr [eax+28]
 00472E61    mov         byte ptr [ebx+28],dl;TGLFaceProperties.PolygonMode:TPolygonMode
 00472E64    mov         eax,dword ptr [eax+24]
 00472E67    mov         edx,dword ptr [ebx+24];TGLFaceProperties.Emission:TGLColor
 00472E6A    lea         esi,[eax+18]
 00472E6D    lea         edi,[edx+18];TGLColor.Red:Single
 00472E70    movs        dword ptr [edi],dword ptr [esi]
 00472E71    movs        dword ptr [edi],dword ptr [esi]
 00472E72    movs        dword ptr [edi],dword ptr [esi]
 00472E73    movs        dword ptr [edi],dword ptr [esi]
 00472E74    mov         edx,ebx
 00472E76    mov         eax,ebx
 00472E78    mov         ecx,dword ptr [eax]
 00472E7A    call        dword ptr [ecx+10];TGLFaceProperties.sub_0046B3D0
 00472E7D    pop         edi
 00472E7E    pop         esi
 00472E7F    pop         ebx
 00472E80    ret
*}
end;

//00472E84
procedure TGLFaceProperties.SetAmbient(Value:TGLColor);
begin
{*
 00472E84    push        esi
 00472E85    push        edi
 00472E86    mov         ecx,dword ptr [eax+18];TGLFaceProperties.Ambient:TGLColor
 00472E89    lea         edi,[ecx+18];TGLColor.Red:Single
 00472E8C    lea         esi,[edx+18];TGLColor.Red:Single
 00472E8F    movs        dword ptr [edi],dword ptr [esi]
 00472E90    movs        dword ptr [edi],dword ptr [esi]
 00472E91    movs        dword ptr [edi],dword ptr [esi]
 00472E92    movs        dword ptr [edi],dword ptr [esi]
 00472E93    mov         edx,eax
 00472E95    mov         ecx,dword ptr [eax]
 00472E97    call        dword ptr [ecx+10];TGLFaceProperties.sub_0046B3D0
 00472E9A    pop         edi
 00472E9B    pop         esi
 00472E9C    ret
*}
end;

//00472EA0
procedure TGLFaceProperties.SetDiffuse(Value:TGLColor);
begin
{*
 00472EA0    push        esi
 00472EA1    push        edi
 00472EA2    mov         ecx,dword ptr [eax+1C];TGLFaceProperties.Diffuse:TGLColor
 00472EA5    lea         edi,[ecx+18];TGLColor.Red:Single
 00472EA8    lea         esi,[edx+18];TGLColor.Red:Single
 00472EAB    movs        dword ptr [edi],dword ptr [esi]
 00472EAC    movs        dword ptr [edi],dword ptr [esi]
 00472EAD    movs        dword ptr [edi],dword ptr [esi]
 00472EAE    movs        dword ptr [edi],dword ptr [esi]
 00472EAF    mov         edx,eax
 00472EB1    mov         ecx,dword ptr [eax]
 00472EB3    call        dword ptr [ecx+10];TGLFaceProperties.sub_0046B3D0
 00472EB6    pop         edi
 00472EB7    pop         esi
 00472EB8    ret
*}
end;

//00472EBC
procedure TGLFaceProperties.SetEmission(Value:TGLColor);
begin
{*
 00472EBC    push        esi
 00472EBD    push        edi
 00472EBE    mov         ecx,dword ptr [eax+24];TGLFaceProperties.Emission:TGLColor
 00472EC1    lea         edi,[ecx+18];TGLColor.Red:Single
 00472EC4    lea         esi,[edx+18];TGLColor.Red:Single
 00472EC7    movs        dword ptr [edi],dword ptr [esi]
 00472EC8    movs        dword ptr [edi],dword ptr [esi]
 00472EC9    movs        dword ptr [edi],dword ptr [esi]
 00472ECA    movs        dword ptr [edi],dword ptr [esi]
 00472ECB    mov         edx,eax
 00472ECD    mov         ecx,dword ptr [eax]
 00472ECF    call        dword ptr [ecx+10];TGLFaceProperties.sub_0046B3D0
 00472ED2    pop         edi
 00472ED3    pop         esi
 00472ED4    ret
*}
end;

//00472ED8
procedure TGLFaceProperties.SetSpecular(Value:TGLColor);
begin
{*
 00472ED8    push        esi
 00472ED9    push        edi
 00472EDA    mov         ecx,dword ptr [eax+20];TGLFaceProperties.Specular:TGLColor
 00472EDD    lea         edi,[ecx+18];TGLColor.Red:Single
 00472EE0    lea         esi,[edx+18];TGLColor.Red:Single
 00472EE3    movs        dword ptr [edi],dword ptr [esi]
 00472EE4    movs        dword ptr [edi],dword ptr [esi]
 00472EE5    movs        dword ptr [edi],dword ptr [esi]
 00472EE6    movs        dword ptr [edi],dword ptr [esi]
 00472EE7    mov         edx,eax
 00472EE9    mov         ecx,dword ptr [eax]
 00472EEB    call        dword ptr [ecx+10];TGLFaceProperties.sub_0046B3D0
 00472EEE    pop         edi
 00472EEF    pop         esi
 00472EF0    ret
*}
end;

//00472EF4
procedure TGLFaceProperties.SetPolygonMode(Value:TPolygonMode);
begin
{*
 00472EF4    cmp         dl,byte ptr [eax+28];TGLFaceProperties.PolygonMode:TPolygonMode
>00472EF7    je          00472F03
 00472EF9    mov         byte ptr [eax+28],dl;TGLFaceProperties.PolygonMode:TPolygonMode
 00472EFC    mov         edx,eax
 00472EFE    mov         ecx,dword ptr [eax]
 00472F00    call        dword ptr [ecx+10];TGLFaceProperties.sub_0046B3D0
 00472F03    ret
*}
end;

//00472F04
procedure TGLFaceProperties.SetShininess(Value:TShininess);
begin
{*
 00472F04    cmp         dl,byte ptr [eax+29];TGLFaceProperties.Shininess:TShininess
>00472F07    je          00472F13
 00472F09    mov         byte ptr [eax+29],dl;TGLFaceProperties.Shininess:TShininess
 00472F0C    mov         edx,eax
 00472F0E    mov         ecx,dword ptr [eax]
 00472F10    call        dword ptr [ecx+10];TGLFaceProperties.sub_0046B3D0
 00472F13    ret
*}
end;

//00472F14
constructor sub_00472F14;
begin
{*
 00472F14    push        ebx
 00472F15    push        esi
 00472F16    push        edi
 00472F17    test        dl,dl
>00472F19    je          00472F23
 00472F1B    add         esp,0FFFFFFF0
 00472F1E    call        @ClassCreate
 00472F23    mov         esi,ecx
 00472F25    mov         ebx,edx
 00472F27    mov         edi,eax
 00472F29    mov         ecx,esi
 00472F2B    xor         edx,edx
 00472F2D    mov         eax,edi
 00472F2F    call        0046B394
 00472F34    mov         eax,esi
 00472F36    mov         edx,dword ptr ds:[471868];TGLTexture
 00472F3C    call        @AsClass
 00472F41    mov         dword ptr [edi+18],eax;TGLTextureImage.?f18:TGLTexture
 00472F44    mov         eax,edi
 00472F46    test        bl,bl
>00472F48    je          00472F59
 00472F4A    call        @AfterConstruction
 00472F4F    pop         dword ptr fs:[0]
 00472F56    add         esp,0C
 00472F59    mov         eax,edi
 00472F5B    pop         edi
 00472F5C    pop         esi
 00472F5D    pop         ebx
 00472F5E    ret
*}
end;

//00472F60
destructor TGLTextureImage.Destroy;
begin
{*
 00472F60    push        ebx
 00472F61    push        esi
 00472F62    call        @BeforeDestruction
 00472F67    mov         ebx,edx
 00472F69    mov         esi,eax
 00472F6B    mov         edx,ebx
 00472F6D    and         dl,0FC
 00472F70    mov         eax,esi
 00472F72    call        TMemoryStream.Destroy
 00472F77    test        bl,bl
>00472F79    jle         00472F82
 00472F7B    mov         eax,esi
 00472F7D    call        @ClassDestroy
 00472F82    pop         esi
 00472F83    pop         ebx
 00472F84    ret
*}
end;

//00472F88
{*procedure sub_00472F88(?:?);
begin
 00472F88    push        ebx
 00472F89    push        esi
 00472F8A    mov         esi,edx
 00472F8C    mov         ebx,eax
 00472F8E    mov         edx,esi
 00472F90    mov         eax,ebx
 00472F92    call        dword ptr [eax+1C]
 00472F95    pop         esi
 00472F96    pop         ebx
 00472F97    ret
end;*}

//00472F98
{*function sub_00472F98:?;
begin
 00472F98    mov         eax,0DE1
 00472F9D    ret
end;*}

//00472FA0
procedure TGLTextureImage.sub_00472FA0;
begin
{*
 00472FA0    push        ebx
 00472FA1    mov         ebx,eax
 00472FA3    mov         eax,ebx
 00472FA5    mov         edx,dword ptr [eax]
 00472FA7    call        dword ptr [edx+2C];TGLTextureImage.sub_00472FBC
 00472FAA    mov         eax,dword ptr [ebx+18];TGLTextureImage.?f18:TGLTexture
 00472FAD    or          byte ptr [eax+21],1;TGLTexture.?f21:byte
 00472FB1    mov         edx,ebx
 00472FB3    mov         eax,ebx
 00472FB5    mov         ecx,dword ptr [eax]
 00472FB7    call        dword ptr [ecx+10];TGLTextureImage.sub_00472FC0
 00472FBA    pop         ebx
 00472FBB    ret
*}
end;

//00472FBC
procedure sub_00472FBC;
begin
{*
 00472FBC    ret
*}
end;

//00472FC0
procedure sub_00472FC0;
begin
{*
 00472FC0    push        ebx
 00472FC1    mov         ebx,eax
 00472FC3    mov         eax,dword ptr [ebx+18];TGLTextureImage.?f18:TGLTexture
 00472FC6    or          byte ptr [eax+21],1;TGLTexture.?f21:byte
 00472FCA    mov         edx,ebx
 00472FCC    mov         eax,dword ptr [ebx+18];TGLTextureImage.?f18:TGLTexture
 00472FCF    mov         ecx,dword ptr [eax]
 00472FD1    call        dword ptr [ecx+10];TGLTexture.sub_0047478C
 00472FD4    pop         ebx
 00472FD5    ret
*}
end;

//00472FD8
{*procedure TGLTextureImage.sub_00472FD8(?:?);
begin
 00472FD8    push        ebp
 00472FD9    mov         ebp,esp
 00472FDB    push        0
 00472FDD    push        ebx
 00472FDE    push        esi
 00472FDF    mov         esi,edx
 00472FE1    mov         ebx,eax
 00472FE3    xor         eax,eax
 00472FE5    push        ebp
 00472FE6    push        473023
 00472FEB    push        dword ptr fs:[eax]
 00472FEE    mov         dword ptr fs:[eax],esp
 00472FF1    cmp         word ptr [ebx+22],0;TGLTextureImage.?f22:word
>00472FF6    je          0047300D
 00472FF8    lea         eax,[ebp-4]
 00472FFB    mov         edx,esi
 00472FFD    call        @LStrLAsg
 00473002    lea         ecx,[ebp-4]
 00473005    mov         edx,ebx
 00473007    mov         eax,dword ptr [ebx+24];TGLTextureImage.?f24:TGLTexture
 0047300A    call        dword ptr [ebx+20]
 0047300D    xor         eax,eax
 0047300F    pop         edx
 00473010    pop         ecx
 00473011    pop         ecx
 00473012    mov         dword ptr fs:[eax],edx
 00473015    push        47302A
 0047301A    lea         eax,[ebp-4]
 0047301D    call        @LStrClr
 00473022    ret
>00473023    jmp         @HandleFinally
>00473028    jmp         0047301A
 0047302A    pop         esi
 0047302B    pop         ebx
 0047302C    pop         ecx
 0047302D    pop         ebp
 0047302E    ret
end;*}

//00473030
constructor sub_00473030;
begin
{*
 00473030    push        ebx
 00473031    push        esi
 00473032    test        dl,dl
>00473034    je          0047303E
 00473036    add         esp,0FFFFFFF0
 00473039    call        @ClassCreate
 0047303E    mov         ebx,edx
 00473040    mov         esi,eax
 00473042    xor         edx,edx
 00473044    mov         eax,esi
 00473046    call        00472F14
 0047304B    mov         dword ptr [esi+2C],100;TGLBlankImage.?f2C:Integer
 00473052    mov         dword ptr [esi+30],100;TGLBlankImage.?f30:Integer
 00473059    mov         eax,esi
 0047305B    test        bl,bl
>0047305D    je          0047306E
 0047305F    call        @AfterConstruction
 00473064    pop         dword ptr fs:[0]
 0047306B    add         esp,0C
 0047306E    mov         eax,esi
 00473070    pop         esi
 00473071    pop         ebx
 00473072    ret
*}
end;

//00473074
destructor TGLBlankImage.Destroy;
begin
{*
 00473074    push        ebx
 00473075    push        esi
 00473076    call        @BeforeDestruction
 0047307B    mov         ebx,edx
 0047307D    mov         esi,eax
 0047307F    mov         eax,esi
 00473081    mov         edx,dword ptr [eax]
 00473083    call        dword ptr [edx+2C];TGLBlankImage.sub_00473170
 00473086    mov         edx,ebx
 00473088    and         dl,0FC
 0047308B    mov         eax,esi
 0047308D    call        TGLTextureImage.Destroy
 00473092    test        bl,bl
>00473094    jle         0047309D
 00473096    mov         eax,esi
 00473098    call        @ClassDestroy
 0047309D    pop         esi
 0047309E    pop         ebx
 0047309F    ret
*}
end;

//004730A0
procedure TGLBlankImage.Assign(Source:TPersistent);
begin
{*
 004730A0    push        ebx
 004730A1    push        esi
 004730A2    mov         ebx,edx
 004730A4    mov         esi,eax
 004730A6    test        ebx,ebx
>004730A8    je          004730E2
 004730AA    mov         eax,ebx
 004730AC    mov         edx,dword ptr ds:[470F00];TGLBlankImage
 004730B2    call        @IsClass
 004730B7    test        al,al
>004730B9    je          004730D6
 004730BB    mov         eax,ebx
 004730BD    mov         edx,dword ptr [eax+2C]
 004730C0    mov         dword ptr [esi+2C],edx;TGLBlankImage.?f2C:Integer
 004730C3    mov         eax,dword ptr [eax+30]
 004730C6    mov         dword ptr [esi+30],eax;TGLBlankImage.?f30:Integer
 004730C9    mov         eax,esi
 004730CB    mov         si,0FFFB
 004730CF    call        @CallDynaInst;TGLTextureImage.sub_00472FA0
>004730D4    jmp         004730EB
 004730D6    mov         edx,ebx
 004730D8    mov         eax,esi
 004730DA    call        TPersistent.Assign
 004730DF    pop         esi
 004730E0    pop         ebx
 004730E1    ret
 004730E2    mov         edx,ebx
 004730E4    mov         eax,esi
 004730E6    call        TPersistent.Assign
 004730EB    pop         esi
 004730EC    pop         ebx
 004730ED    ret
*}
end;

//004730F0
procedure TGLBlankImage.SetWidth(Value:Integer);
begin
{*
 004730F0    push        esi
 004730F1    cmp         edx,dword ptr [eax+2C];TGLBlankImage.?f2C:Integer
>004730F4    je          0047310E
 004730F6    mov         ecx,edx
 004730F8    mov         dword ptr [eax+2C],ecx;TGLBlankImage.?f2C:Integer
 004730FB    dec         ecx
>004730FC    jge         00473105
 004730FE    mov         dword ptr [eax+2C],1;TGLBlankImage.?f2C:Integer
 00473105    mov         si,0FFFB
 00473109    call        @CallDynaInst;TGLTextureImage.sub_00472FA0
 0047310E    pop         esi
 0047310F    ret
*}
end;

//00473110
function TGLBlankImage.GetWidth:Integer;
begin
{*
 00473110    mov         eax,dword ptr [eax+2C];TGLBlankImage.?f2C:Integer
 00473113    ret
*}
end;

//00473114
procedure TGLBlankImage.SetHeight(Value:Integer);
begin
{*
 00473114    push        esi
 00473115    cmp         edx,dword ptr [eax+30];TGLBlankImage.?f30:Integer
>00473118    je          00473132
 0047311A    mov         ecx,edx
 0047311C    mov         dword ptr [eax+30],ecx;TGLBlankImage.?f30:Integer
 0047311F    dec         ecx
>00473120    jge         00473129
 00473122    mov         dword ptr [eax+30],1;TGLBlankImage.?f30:Integer
 00473129    mov         si,0FFFB
 0047312D    call        @CallDynaInst;TGLTextureImage.sub_00472FA0
 00473132    pop         esi
 00473133    ret
*}
end;

//00473134
function TGLBlankImage.GetHeight:Integer;
begin
{*
 00473134    mov         eax,dword ptr [eax+30];TGLBlankImage.?f30:Integer
 00473137    ret
*}
end;

//00473138
{*function sub_00473138:?;
begin
 00473138    push        ebx
 00473139    push        esi
 0047313A    mov         ebx,eax
 0047313C    cmp         dword ptr [ebx+28],0;TGLBlankImage.?f28:TGLBitmap32
>00473140    jne         00473168
 00473142    mov         dl,1
 00473144    mov         eax,[0046F8F4];TGLBitmap32
 00473149    call        TGLBitmap32.Create;TGLBitmap32.Create
 0047314E    mov         esi,eax
 00473150    mov         dword ptr [ebx+28],esi;TGLBlankImage.?f28:TGLBitmap32
 00473153    mov         edx,dword ptr [ebx+2C];TGLBlankImage.?f2C:Integer
 00473156    mov         eax,esi
 00473158    call        0047025C
 0047315D    mov         edx,dword ptr [ebx+30];TGLBlankImage.?f30:Integer
 00473160    mov         eax,dword ptr [ebx+28];TGLBlankImage.?f28:TGLBitmap32
 00473163    call        00470304
 00473168    mov         eax,dword ptr [ebx+28];TGLBlankImage.?f28:TGLBitmap32
 0047316B    pop         esi
 0047316C    pop         ebx
 0047316D    ret
end;*}

//00473170
procedure sub_00473170;
begin
{*
 00473170    push        ebx
 00473171    mov         ebx,eax
 00473173    mov         eax,dword ptr [ebx+28];TGLBlankImage.?f28:TGLBitmap32
 00473176    test        eax,eax
>00473178    je          00473184
 0047317A    call        TObject.Free
 0047317F    xor         eax,eax
 00473181    mov         dword ptr [ebx+28],eax;TGLBlankImage.?f28:TGLBitmap32
 00473184    pop         ebx
 00473185    ret
*}
end;

//00473188
{*procedure TGLBlankImage.sub_00473188(?:?);
begin
 00473188    push        ebp
 00473189    mov         ebp,esp
 0047318B    push        0
 0047318D    push        0
 0047318F    push        0
 00473191    push        ebx
 00473192    push        esi
 00473193    mov         esi,edx
 00473195    mov         ebx,eax
 00473197    xor         eax,eax
 00473199    push        ebp
 0047319A    push        473205
 0047319F    push        dword ptr fs:[eax]
 004731A2    mov         dword ptr fs:[eax],esp
 004731A5    push        47321C;'[BlankImage]'+#13+#10+Width='
 004731AA    mov         eax,ebx
 004731AC    mov         edx,dword ptr [eax]
 004731AE    call        dword ptr [edx+18];TGLBlankImage.GetWidth
 004731B1    lea         edx,[ebp-8]
 004731B4    call        IntToStr
 004731B9    push        dword ptr [ebp-8]
 004731BC    push        47323C;#13+#10+Height='
 004731C1    mov         eax,ebx
 004731C3    mov         edx,dword ptr [eax]
 004731C5    call        dword ptr [edx+14];TGLBlankImage.GetHeight
 004731C8    lea         edx,[ebp-0C]
 004731CB    call        IntToStr
 004731D0    push        dword ptr [ebp-0C]
 004731D3    lea         eax,[ebp-4]
 004731D6    mov         edx,4
 004731DB    call        @LStrCatN
 004731E0    mov         edx,dword ptr [ebp-4]
 004731E3    mov         eax,esi
 004731E5    call        0046BCFC
 004731EA    xor         eax,eax
 004731EC    pop         edx
 004731ED    pop         ecx
 004731EE    pop         ecx
 004731EF    mov         dword ptr fs:[eax],edx
 004731F2    push        47320C
 004731F7    lea         eax,[ebp-0C]
 004731FA    mov         edx,3
 004731FF    call        @LStrArrayClr
 00473204    ret
>00473205    jmp         @HandleFinally
>0047320A    jmp         004731F7
 0047320C    pop         esi
 0047320D    pop         ebx
 0047320E    mov         esp,ebp
 00473210    pop         ebp
 00473211    ret
end;*}

//00473248
{*procedure TGLBlankImage.sub_00472FD8(?:?);
begin
 00473248    push        ebp
 00473249    mov         ebp,esp
 0047324B    xor         ecx,ecx
 0047324D    push        ecx
 0047324E    push        ecx
 0047324F    push        ecx
 00473250    push        ecx
 00473251    push        ecx
 00473252    push        ecx
 00473253    push        ecx
 00473254    push        ecx
 00473255    push        ebx
 00473256    push        esi
 00473257    mov         esi,edx
 00473259    mov         ebx,eax
 0047325B    xor         eax,eax
 0047325D    push        ebp
 0047325E    push        473360
 00473263    push        dword ptr fs:[eax]
 00473266    mov         dword ptr fs:[eax],esp
 00473269    lea         eax,[ebp-8]
 0047326C    mov         edx,esi
 0047326E    call        @LStrLAsg
 00473273    cmp         word ptr [ebx+22],0;TGLBlankImage.?f22:word
>00473278    je          00473285
 0047327A    lea         ecx,[ebp-8]
 0047327D    mov         edx,ebx
 0047327F    mov         eax,dword ptr [ebx+24];TGLBlankImage.?f24:TGLTexture
 00473282    call        dword ptr [ebx+20]
 00473285    mov         eax,dword ptr [ebp-8]
 00473288    call        FileExists
 0047328D    test        al,al
>0047328F    je          0047330C
 00473291    mov         dl,1
 00473293    mov         eax,[00418350];TStringList
 00473298    call        TObject.Create;TStringList.Create
 0047329D    mov         dword ptr [ebp-4],eax
 004732A0    xor         eax,eax
 004732A2    push        ebp
 004732A3    push        473305
 004732A8    push        dword ptr fs:[eax]
 004732AB    mov         dword ptr fs:[eax],esp
 004732AE    mov         edx,dword ptr [ebp-8]
 004732B1    mov         eax,dword ptr [ebp-4]
 004732B4    mov         ecx,dword ptr [eax]
 004732B6    call        dword ptr [ecx+68];TStrings.LoadFromFile
 004732B9    lea         ecx,[ebp-0C]
 004732BC    mov         edx,473378;'Width'
 004732C1    mov         eax,dword ptr [ebp-4]
 004732C4    call        TStrings.GetValue
 004732C9    mov         eax,dword ptr [ebp-0C]
 004732CC    call        StrToInt
 004732D1    mov         dword ptr [ebx+2C],eax;TGLBlankImage.?f2C:Integer
 004732D4    lea         ecx,[ebp-10]
 004732D7    mov         edx,473388;'Height'
 004732DC    mov         eax,dword ptr [ebp-4]
 004732DF    call        TStrings.GetValue
 004732E4    mov         eax,dword ptr [ebp-10]
 004732E7    call        StrToInt
 004732EC    mov         dword ptr [ebx+30],eax;TGLBlankImage.?f30:Integer
 004732EF    xor         eax,eax
 004732F1    pop         edx
 004732F2    pop         ecx
 004732F3    pop         ecx
 004732F4    mov         dword ptr fs:[eax],edx
 004732F7    push        473345
 004732FC    mov         eax,dword ptr [ebp-4]
 004732FF    call        TObject.Free
 00473304    ret
>00473305    jmp         @HandleFinally
>0047330A    jmp         004732FC
 0047330C    lea         eax,[ebp-14]
 0047330F    push        eax
 00473310    lea         edx,[ebp-18]
 00473313    mov         eax,[005AE6AC];^SResString16:TResStringRec
 00473318    call        LoadStr
 0047331D    mov         eax,dword ptr [ebp-18]
 00473320    push        eax
 00473321    mov         dword ptr [ebp-20],esi
 00473324    mov         byte ptr [ebp-1C],0B
 00473328    lea         edx,[ebp-20]
 0047332B    xor         ecx,ecx
 0047332D    pop         eax
 0047332E    call        Format
 00473333    mov         eax,dword ptr [ebp-14]
 00473336    mov         ecx,964
 0047333B    mov         edx,473398;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00473340    call        @Assert
 00473345    xor         eax,eax
 00473347    pop         edx
 00473348    pop         ecx
 00473349    pop         ecx
 0047334A    mov         dword ptr fs:[eax],edx
 0047334D    push        473367
 00473352    lea         eax,[ebp-18]
 00473355    mov         edx,5
 0047335A    call        @LStrArrayClr
 0047335F    ret
>00473360    jmp         @HandleFinally
>00473365    jmp         00473352
 00473367    pop         esi
 00473368    pop         ebx
 00473369    mov         esp,ebp
 0047336B    pop         ebp
 0047336C    ret
end;*}

//004733CC
{*procedure sub_004733CC(?:?);
begin
 004733CC    push        ebx
 004733CD    mov         ebx,edx
 004733CF    mov         eax,ebx
 004733D1    mov         edx,4733E8;'Blank Image'
 004733D6    call        @LStrAsg
 004733DB    pop         ebx
 004733DC    ret
end;*}

//004733F4
{*procedure sub_004733F4(?:?);
begin
 004733F4    push        ebx
 004733F5    mov         ebx,edx
 004733F7    mov         eax,ebx
 004733F9    mov         edx,473410;'Blank Image (Width x Height)'
 004733FE    call        @LStrAsg
 00473403    pop         ebx
 00473404    ret
end;*}

//00473430
constructor sub_00473430;
begin
{*
 00473430    push        ebx
 00473431    push        esi
 00473432    test        dl,dl
>00473434    je          0047343E
 00473436    add         esp,0FFFFFFF0
 00473439    call        @ClassCreate
 0047343E    mov         ebx,edx
 00473440    mov         esi,eax
 00473442    xor         edx,edx
 00473444    mov         eax,esi
 00473446    call        00472F14
 0047344B    mov         eax,esi
 0047344D    test        bl,bl
>0047344F    je          00473460
 00473451    call        @AfterConstruction
 00473456    pop         dword ptr fs:[0]
 0047345D    add         esp,0C
 00473460    mov         eax,esi
 00473462    pop         esi
 00473463    pop         ebx
 00473464    ret
*}
end;

//00473468
destructor TGLPictureImage.Destroy;
begin
{*
 00473468    push        ebx
 00473469    push        esi
 0047346A    call        @BeforeDestruction
 0047346F    mov         ebx,edx
 00473471    mov         esi,eax
 00473473    mov         eax,esi
 00473475    mov         edx,dword ptr [eax]
 00473477    call        dword ptr [edx+2C];TGLPictureImage.sub_0047363C
 0047347A    mov         eax,dword ptr [esi+2C];TGLPictureImage.?f2C:TPicture
 0047347D    call        TObject.Free
 00473482    mov         edx,ebx
 00473484    and         dl,0FC
 00473487    mov         eax,esi
 00473489    call        TGLTextureImage.Destroy
 0047348E    test        bl,bl
>00473490    jle         00473499
 00473492    mov         eax,esi
 00473494    call        @ClassDestroy
 00473499    pop         esi
 0047349A    pop         ebx
 0047349B    ret
*}
end;

//0047349C
procedure TGLPictureImage.Assign(Source:TPersistent);
begin
{*
 0047349C    push        ebx
 0047349D    push        esi
 0047349E    mov         ebx,edx
 004734A0    mov         esi,eax
 004734A2    test        ebx,ebx
>004734A4    je          00473554
 004734AA    mov         eax,ebx
 004734AC    mov         edx,dword ptr ds:[4710BC];TGLPersistentImage
 004734B2    call        @IsClass
 004734B7    test        al,al
>004734B9    je          004734D5
 004734BB    mov         eax,ebx
 004734BD    call        TGLPersistentImage.GetPicture
 004734C2    push        eax
 004734C3    mov         eax,esi
 004734C5    call        TGLPersistentImage.GetPicture
 004734CA    pop         edx
 004734CB    mov         ecx,dword ptr [eax]
 004734CD    call        dword ptr [ecx+8]
>004734D0    jmp         0047355D
 004734D5    mov         eax,ebx
 004734D7    mov         edx,dword ptr ds:[424AB8];TGraphic
 004734DD    call        @IsClass
 004734E2    test        al,al
>004734E4    je          004734F6
 004734E6    mov         eax,esi
 004734E8    call        TGLPersistentImage.GetPicture
 004734ED    mov         edx,ebx
 004734EF    mov         ecx,dword ptr [eax]
 004734F1    call        dword ptr [ecx+8]
>004734F4    jmp         0047355D
 004734F6    mov         eax,ebx
 004734F8    mov         edx,dword ptr ds:[424C0C];TPicture
 004734FE    call        @IsClass
 00473503    test        al,al
>00473505    je          00473517
 00473507    mov         eax,esi
 00473509    call        TGLPersistentImage.GetPicture
 0047350E    mov         edx,ebx
 00473510    mov         ecx,dword ptr [eax]
 00473512    call        dword ptr [ecx+8]
>00473515    jmp         0047355D
 00473517    mov         eax,ebx
 00473519    mov         edx,dword ptr ds:[46F8F4];TGLBitmap32
 0047351F    call        @IsClass
 00473524    test        al,al
>00473526    je          00473548
 00473528    mov         eax,ebx
 0047352A    call        00470168
 0047352F    mov         ebx,eax
 00473531    mov         eax,esi
 00473533    call        TGLPersistentImage.GetPicture
 00473538    mov         edx,ebx
 0047353A    call        TPicture.SetGraphic
 0047353F    mov         eax,ebx
 00473541    call        TObject.Free
>00473546    jmp         0047355D
 00473548    mov         edx,ebx
 0047354A    mov         eax,esi
 0047354C    call        TPersistent.Assign
 00473551    pop         esi
 00473552    pop         ebx
 00473553    ret
 00473554    mov         edx,ebx
 00473556    mov         eax,esi
 00473558    call        TPersistent.Assign
 0047355D    pop         esi
 0047355E    pop         ebx
 0047355F    ret
*}
end;

//00473560
procedure sub_00473560;
begin
{*
 00473560    push        ebx
 00473561    mov         ebx,eax
 00473563    mov         eax,ebx
 00473565    call        TGLPersistentImage.GetPicture
 0047356A    call        TPicture.GetHeight
 0047356F    pop         ebx
 00473570    ret
*}
end;

//00473574
procedure sub_00473574;
begin
{*
 00473574    push        ebx
 00473575    mov         ebx,eax
 00473577    mov         eax,ebx
 00473579    call        TGLPersistentImage.GetPicture
 0047357E    call        TPicture.GetWidth
 00473583    pop         ebx
 00473584    ret
*}
end;

//00473588
{*function sub_00473588:?;
begin
 00473588    push        ebp
 00473589    mov         ebp,esp
 0047358B    push        ecx
 0047358C    mov         dword ptr [ebp-4],eax
 0047358F    mov         eax,dword ptr [ebp-4]
 00473592    cmp         dword ptr [eax+28],0;TGLPictureImage.?f28:TGLBitmap32
>00473596    jne         00473631
 0047359C    mov         dl,1
 0047359E    mov         eax,[0046F8F4];TGLBitmap32
 004735A3    call        TGLBitmap32.Create;TGLBitmap32.Create
 004735A8    mov         edx,dword ptr [ebp-4]
 004735AB    mov         dword ptr [edx+28],eax;TGLPictureImage.?f28:TGLBitmap32
 004735AE    mov         eax,dword ptr [ebp-4]
 004735B1    call        TGLPersistentImage.GetPicture
 004735B6    cmp         word ptr [eax+12],0
>004735BB    je          0047361B
 004735BD    mov         eax,dword ptr [ebp-4]
 004735C0    call        TGLPersistentImage.GetPicture
 004735C5    xor         edx,edx
 004735C7    mov         dword ptr [eax+10],edx
 004735CA    mov         dword ptr [eax+14],edx
 004735CD    xor         eax,eax
 004735CF    push        ebp
 004735D0    push        473614
 004735D5    push        dword ptr fs:[eax]
 004735D8    mov         dword ptr fs:[eax],esp
 004735DB    mov         eax,dword ptr [ebp-4]
 004735DE    call        TGLPersistentImage.GetPicture
 004735E3    mov         edx,dword ptr [eax+0C]
 004735E6    mov         eax,dword ptr [ebp-4]
 004735E9    mov         eax,dword ptr [eax+28];TGLPictureImage.?f28:TGLBitmap32
 004735EC    mov         ecx,dword ptr [eax]
 004735EE    call        dword ptr [ecx+8];TGLBitmap32.Assign
 004735F1    xor         eax,eax
 004735F3    pop         edx
 004735F4    pop         ecx
 004735F5    pop         ecx
 004735F6    mov         dword ptr fs:[eax],edx
 004735F9    push        473631
 004735FE    mov         eax,dword ptr [ebp-4]
 00473601    call        TGLPersistentImage.GetPicture
 00473606    mov         edx,dword ptr [ebp-4]
 00473609    mov         dword ptr [eax+14],edx
 0047360C    mov         dword ptr [eax+10],473654;sub_00473654
 00473613    ret
>00473614    jmp         @HandleFinally
>00473619    jmp         004735FE
 0047361B    mov         eax,dword ptr [ebp-4]
 0047361E    call        TGLPersistentImage.GetPicture
 00473623    mov         edx,dword ptr [eax+0C]
 00473626    mov         eax,dword ptr [ebp-4]
 00473629    mov         eax,dword ptr [eax+28];TGLPictureImage.?f28:TGLBitmap32
 0047362C    mov         ecx,dword ptr [eax]
 0047362E    call        dword ptr [ecx+8];TGLBitmap32.Assign
 00473631    mov         eax,dword ptr [ebp-4]
 00473634    mov         eax,dword ptr [eax+28];TGLPictureImage.?f28:TGLBitmap32
 00473637    pop         ecx
 00473638    pop         ebp
 00473639    ret
end;*}

//0047363C
procedure sub_0047363C;
begin
{*
 0047363C    push        ebx
 0047363D    mov         ebx,eax
 0047363F    mov         eax,dword ptr [ebx+28];TGLPictureImage.?f28:TGLBitmap32
 00473642    test        eax,eax
>00473644    je          00473650
 00473646    call        TObject.Free
 0047364B    xor         eax,eax
 0047364D    mov         dword ptr [ebx+28],eax;TGLPictureImage.?f28:TGLBitmap32
 00473650    pop         ebx
 00473651    ret
*}
end;

//00473654
procedure sub_00473654;
begin
{*
 00473654    push        esi
 00473655    mov         si,0FFFB
 00473659    call        @CallDynaInst
 0047365E    pop         esi
 0047365F    ret
*}
end;

//00473660
{*function TGLPersistentImage.GetPicture:?;
begin
 00473660    push        ebx
 00473661    push        esi
 00473662    mov         ebx,eax
 00473664    cmp         dword ptr [ebx+2C],0;TGLPersistentImage.?f2C:TPicture
>00473668    jne         00473685
 0047366A    mov         dl,1
 0047366C    mov         eax,[00424C0C];TPicture
 00473671    call        TPicture.Create;TPicture.Create
 00473676    mov         esi,eax
 00473678    mov         dword ptr [ebx+2C],esi;TGLPersistentImage.?f2C:TPicture
 0047367B    mov         dword ptr [esi+14],ebx;TPicture.?f14:TGLPersistentImage
 0047367E    mov         dword ptr [esi+10],473654;TPicture.FOnChange:TNotifyEvent sub_00473654
 00473685    mov         eax,dword ptr [ebx+2C];TGLPersistentImage.?f2C:TPicture
 00473688    pop         esi
 00473689    pop         ebx
 0047368A    ret
end;*}

//0047368C
procedure TGLPersistentImage.SetPicture(Value:TPicture);
begin
{*
 0047368C    push        ebx
 0047368D    push        esi
 0047368E    mov         esi,edx
 00473690    mov         ebx,eax
 00473692    mov         eax,ebx
 00473694    call        TGLPersistentImage.GetPicture
 00473699    mov         edx,esi
 0047369B    mov         ecx,dword ptr [eax]
 0047369D    call        dword ptr [ecx+8]
 004736A0    pop         esi
 004736A1    pop         ebx
 004736A2    ret
*}
end;

//004736A4
constructor TGLPersistentImage.Create;
begin
{*
 004736A4    push        ebx
 004736A5    push        esi
 004736A6    test        dl,dl
>004736A8    je          004736B2
 004736AA    add         esp,0FFFFFFF0
 004736AD    call        @ClassCreate
 004736B2    mov         ebx,edx
 004736B4    mov         esi,eax
 004736B6    xor         edx,edx
 004736B8    mov         eax,esi
 004736BA    call        00473430
 004736BF    mov         eax,esi
 004736C1    test        bl,bl
>004736C3    je          004736D4
 004736C5    call        @AfterConstruction
 004736CA    pop         dword ptr fs:[0]
 004736D1    add         esp,0C
 004736D4    mov         eax,esi
 004736D6    pop         esi
 004736D7    pop         ebx
 004736D8    ret
*}
end;

//004736DC
destructor TGLPersistentImage.Destroy;
begin
{*
 004736DC    push        ebx
 004736DD    push        esi
 004736DE    call        @BeforeDestruction
 004736E3    mov         ebx,edx
 004736E5    mov         esi,eax
 004736E7    mov         edx,ebx
 004736E9    and         dl,0FC
 004736EC    mov         eax,esi
 004736EE    call        TGLPictureImage.Destroy
 004736F3    test        bl,bl
>004736F5    jle         004736FE
 004736F7    mov         eax,esi
 004736F9    call        @ClassDestroy
 004736FE    pop         esi
 004736FF    pop         ebx
 00473700    ret
*}
end;

//00473704
{*procedure TGLPersistentImage.sub_00473704(?:?);
begin
 00473704    push        ebx
 00473705    push        esi
 00473706    mov         esi,edx
 00473708    mov         ebx,eax
 0047370A    mov         eax,ebx
 0047370C    call        TGLPersistentImage.GetPicture
 00473711    mov         edx,esi
 00473713    call        TPicture.SaveToFile
 00473718    pop         esi
 00473719    pop         ebx
 0047371A    ret
end;*}

//0047371C
{*procedure TGLPersistentImage.sub_00472FD8(?:?);
begin
 0047371C    push        ebp
 0047371D    mov         ebp,esp
 0047371F    add         esp,0FFFFFFF0
 00473722    push        ebx
 00473723    push        esi
 00473724    push        edi
 00473725    xor         ecx,ecx
 00473727    mov         dword ptr [ebp-10],ecx
 0047372A    mov         dword ptr [ebp-4],ecx
 0047372D    mov         esi,edx
 0047372F    mov         ebx,eax
 00473731    xor         eax,eax
 00473733    push        ebp
 00473734    push        473800
 00473739    push        dword ptr fs:[eax]
 0047373C    mov         dword ptr fs:[eax],esp
 0047373F    lea         eax,[ebp-4]
 00473742    mov         edx,esi
 00473744    call        @LStrLAsg
 00473749    cmp         word ptr [ebx+22],0;TGLPersistentImage.?f22:word
>0047374E    je          0047375B
 00473750    lea         ecx,[ebp-4]
 00473753    mov         edx,ebx
 00473755    mov         eax,dword ptr [ebx+24];TGLPersistentImage.?f24:TGLTexture
 00473758    call        dword ptr [ebx+20]
 0047375B    call        00465A4C
 00473760    test        al,al
>00473762    je          00473789
 00473764    mov         eax,dword ptr [ebp-4]
 00473767    call        004727E0
 0047376C    mov         edi,eax
 0047376E    test        edi,edi
>00473770    je          004737A6
 00473772    mov         eax,ebx
 00473774    call        TGLPersistentImage.GetPicture
 00473779    mov         edx,edi
 0047377B    call        TPicture.SetGraphic
 00473780    mov         eax,edi
 00473782    call        TObject.Free
>00473787    jmp         004737E2
 00473789    mov         eax,dword ptr [ebp-4]
 0047378C    call        FileExists
 00473791    test        al,al
>00473793    je          004737A6
 00473795    mov         eax,ebx
 00473797    call        TGLPersistentImage.GetPicture
 0047379C    mov         edx,dword ptr [ebp-4]
 0047379F    call        00428DC8
>004737A4    jmp         004737E2
 004737A6    mov         eax,ebx
 004737A8    call        TGLPersistentImage.GetPicture
 004737AD    xor         edx,edx
 004737AF    call        TPicture.SetGraphic
 004737B4    mov         dword ptr [ebp-0C],esi
 004737B7    mov         byte ptr [ebp-8],0B
 004737BB    lea         eax,[ebp-0C]
 004737BE    push        eax
 004737BF    push        0
 004737C1    lea         edx,[ebp-10]
 004737C4    mov         eax,[005AE6AC];^SResString16:TResStringRec
 004737C9    call        LoadStr
 004737CE    mov         ecx,dword ptr [ebp-10]
 004737D1    mov         dl,1
 004737D3    mov         eax,[00472694];ETexture
 004737D8    call        Exception.CreateFmt;ETexture.Create
 004737DD    call        @RaiseExcept
 004737E2    xor         eax,eax
 004737E4    pop         edx
 004737E5    pop         ecx
 004737E6    pop         ecx
 004737E7    mov         dword ptr fs:[eax],edx
 004737EA    push        473807
 004737EF    lea         eax,[ebp-10]
 004737F2    call        @LStrClr
 004737F7    lea         eax,[ebp-4]
 004737FA    call        @LStrClr
 004737FF    ret
>00473800    jmp         @HandleFinally
>00473805    jmp         004737EF
 00473807    pop         edi
 00473808    pop         esi
 00473809    pop         ebx
 0047380A    mov         esp,ebp
 0047380C    pop         ebp
 0047380D    ret
end;*}

//00473810
{*procedure sub_00473810(?:?);
begin
 00473810    push        ebx
 00473811    mov         ebx,edx
 00473813    mov         eax,ebx
 00473815    mov         edx,47382C;'Persistent Image'
 0047381A    call        @LStrAsg
 0047381F    pop         ebx
 00473820    ret
end;*}

//00473840
{*procedure sub_00473840(?:?);
begin
 00473840    push        ebx
 00473841    mov         ebx,edx
 00473843    mov         eax,ebx
 00473845    mov         edx,47385C;'Image data is stored in its original format with other form resources,ie. in...
 0047384A    call        @LStrAsg
 0047384F    pop         ebx
 00473850    ret
end;*}

//004738E8
constructor sub_004738E8;
begin
{*
 004738E8    push        ebx
 004738E9    push        esi
 004738EA    test        dl,dl
>004738EC    je          004738F6
 004738EE    add         esp,0FFFFFFF0
 004738F1    call        @ClassCreate
 004738F6    mov         ebx,edx
 004738F8    mov         esi,eax
 004738FA    xor         edx,edx
 004738FC    mov         eax,esi
 004738FE    call        00473430
 00473903    mov         eax,esi
 00473905    test        bl,bl
>00473907    je          00473918
 00473909    call        @AfterConstruction
 0047390E    pop         dword ptr fs:[0]
 00473915    add         esp,0C
 00473918    mov         eax,esi
 0047391A    pop         esi
 0047391B    pop         ebx
 0047391C    ret
*}
end;

//00473920
destructor TGLPicFileImage.Destroy;
begin
{*
 00473920    push        ebx
 00473921    push        esi
 00473922    call        @BeforeDestruction
 00473927    mov         ebx,edx
 00473929    mov         esi,eax
 0047392B    mov         edx,ebx
 0047392D    and         dl,0FC
 00473930    mov         eax,esi
 00473932    call        TGLPictureImage.Destroy
 00473937    test        bl,bl
>00473939    jle         00473942
 0047393B    mov         eax,esi
 0047393D    call        @ClassDestroy
 00473942    pop         esi
 00473943    pop         ebx
 00473944    ret
*}
end;

//00473948
procedure TGLPicFileImage.Assign(Source:TPersistent);
begin
{*
 00473948    push        ebx
 00473949    push        esi
 0047394A    mov         esi,edx
 0047394C    mov         ebx,eax
 0047394E    mov         eax,esi
 00473950    mov         edx,dword ptr ds:[4711AC];TGLPicFileImage
 00473956    call        @IsClass
 0047395B    test        al,al
>0047395D    je          0047396D
 0047395F    lea         eax,[ebx+38];TGLPicFileImage.PictureFileName:String
 00473962    mov         edx,dword ptr [esi+38]
 00473965    call        @LStrAsg
 0047396A    pop         esi
 0047396B    pop         ebx
 0047396C    ret
 0047396D    mov         edx,esi
 0047396F    mov         eax,ebx
 00473971    call        TGLPictureImage.Assign
 00473976    pop         esi
 00473977    pop         ebx
 00473978    ret
*}
end;

//0047397C
procedure TGLPicFileImage.SetPictureFileName(Value:String);
begin
{*
 0047397C    push        ebx
 0047397D    push        esi
 0047397E    mov         esi,edx
 00473980    mov         ebx,eax
 00473982    mov         eax,esi
 00473984    mov         edx,dword ptr [ebx+38];TGLPicFileImage.PictureFileName:String
 00473987    call        @LStrCmp
>0047398C    je          004739A7
 0047398E    lea         eax,[ebx+38];TGLPicFileImage.PictureFileName:String
 00473991    mov         edx,esi
 00473993    call        @LStrAsg
 00473998    mov         byte ptr [ebx+3C],0;TGLPicFileImage.?f3C:byte
 0047399C    mov         eax,ebx
 0047399E    mov         si,0FFFB
 004739A2    call        @CallDynaInst;TGLPicFileImage.sub_00472FA0
 004739A7    pop         esi
 004739A8    pop         ebx
 004739A9    ret
*}
end;

//004739AC
procedure TGLPicFileImage.sub_00472FA0;
begin
{*
 004739AC    push        ebp
 004739AD    mov         ebp,esp
 004739AF    push        ecx
 004739B0    mov         dword ptr [ebp-4],eax
 004739B3    mov         eax,dword ptr [ebp-4]
 004739B6    call        TGLPersistentImage.GetPicture
 004739BB    xor         edx,edx
 004739BD    mov         dword ptr [eax+10],edx
 004739C0    mov         dword ptr [eax+14],edx
 004739C3    xor         eax,eax
 004739C5    push        ebp
 004739C6    push        473A0B
 004739CB    push        dword ptr fs:[eax]
 004739CE    mov         dword ptr fs:[eax],esp
 004739D1    mov         eax,dword ptr [ebp-4]
 004739D4    call        TGLPersistentImage.GetPicture
 004739D9    xor         edx,edx
 004739DB    mov         ecx,dword ptr [eax]
 004739DD    call        dword ptr [ecx+8]
 004739E0    mov         eax,dword ptr [ebp-4]
 004739E3    xor         edx,edx
 004739E5    mov         dword ptr [eax+28],edx;TGLPicFileImage.?f28:TGLBitmap32
 004739E8    xor         eax,eax
 004739EA    pop         edx
 004739EB    pop         ecx
 004739EC    pop         ecx
 004739ED    mov         dword ptr fs:[eax],edx
 004739F0    push        473A12
 004739F5    mov         eax,dword ptr [ebp-4]
 004739F8    call        TGLPersistentImage.GetPicture
 004739FD    mov         edx,dword ptr [ebp-4]
 00473A00    mov         dword ptr [eax+14],edx
 00473A03    mov         dword ptr [eax+10],473654;sub_00473654
 00473A0A    ret
>00473A0B    jmp         @HandleFinally
>00473A10    jmp         004739F5
 00473A12    mov         eax,dword ptr [ebp-4]
 00473A15    call        TGLTextureImage.sub_00472FA0
 00473A1A    pop         ecx
 00473A1B    pop         ebp
 00473A1C    ret
*}
end;

//00473A20
{*function sub_00473A20(?:?):?;
begin
 00473A20    push        ebp
 00473A21    mov         ebp,esp
 00473A23    add         esp,0FFFFFFE4
 00473A26    push        ebx
 00473A27    push        esi
 00473A28    xor         ecx,ecx
 00473A2A    mov         dword ptr [ebp-10],ecx
 00473A2D    mov         dword ptr [ebp-14],ecx
 00473A30    mov         dword ptr [ebp-0C],ecx
 00473A33    mov         ebx,edx
 00473A35    mov         dword ptr [ebp-4],eax
 00473A38    xor         eax,eax
 00473A3A    push        ebp
 00473A3B    push        473BA2
 00473A40    push        dword ptr fs:[eax]
 00473A43    mov         dword ptr fs:[eax],esp
 00473A46    mov         eax,dword ptr [ebp-4]
 00473A49    mov         edx,dword ptr [eax]
 00473A4B    call        dword ptr [edx+18];TGLPicFileImage.sub_00473574
 00473A4E    test        eax,eax
>00473A50    jg          00473B7A
 00473A56    mov         eax,dword ptr [ebp-4]
 00473A59    cmp         dword ptr [eax+38],0;TGLPicFileImage.PictureFileName:String
>00473A5D    je          00473B7A
 00473A63    mov         eax,dword ptr [ebp-4]
 00473A66    call        TGLPersistentImage.GetPicture
 00473A6B    xor         edx,edx
 00473A6D    mov         dword ptr [eax+10],edx
 00473A70    mov         dword ptr [eax+14],edx
 00473A73    xor         eax,eax
 00473A75    push        ebp
 00473A76    push        473B73
 00473A7B    push        dword ptr fs:[eax]
 00473A7E    mov         dword ptr fs:[eax],esp
 00473A81    lea         eax,[ebp-0C]
 00473A84    mov         edx,dword ptr [ebp-4]
 00473A87    mov         edx,dword ptr [edx+38];TGLPicFileImage.PictureFileName:String
 00473A8A    call        @LStrLAsg
 00473A8F    mov         eax,dword ptr [ebp-4]
 00473A92    cmp         word ptr [eax+22],0;TGLPicFileImage.?f22:word
>00473A97    je          00473AA8
 00473A99    lea         ecx,[ebp-0C]
 00473A9C    mov         esi,dword ptr [ebp-4]
 00473A9F    mov         edx,dword ptr [ebp-4]
 00473AA2    mov         eax,dword ptr [esi+24];TGLPicFileImage.?f24:TGLTexture
 00473AA5    call        dword ptr [esi+20]
 00473AA8    mov         eax,dword ptr [ebp-0C]
 00473AAB    call        00465B88
 00473AB0    test        al,al
>00473AB2    je          00473AD6
 00473AB4    mov         eax,dword ptr [ebp-0C]
 00473AB7    call        004727E0
 00473ABC    mov         esi,eax
 00473ABE    mov         eax,dword ptr [ebp-4]
 00473AC1    call        TGLPersistentImage.GetPicture
 00473AC6    mov         edx,esi
 00473AC8    call        TPicture.SetGraphic
 00473ACD    mov         eax,esi
 00473ACF    call        TObject.Free
>00473AD4    jmp         00473B34
 00473AD6    mov         eax,dword ptr [ebp-4]
 00473AD9    call        TGLPersistentImage.GetPicture
 00473ADE    xor         edx,edx
 00473AE0    call        TPicture.SetGraphic
 00473AE5    mov         eax,dword ptr [ebp-4]
 00473AE8    cmp         byte ptr [eax+3C],0;TGLPicFileImage.?f3C:byte
>00473AEC    jne         00473B34
 00473AEE    mov         eax,dword ptr [ebp-4]
 00473AF1    mov         byte ptr [eax+3C],1;TGLPicFileImage.?f3C:byte
 00473AF5    lea         eax,[ebp-10]
 00473AF8    push        eax
 00473AF9    lea         edx,[ebp-14]
 00473AFC    mov         eax,[005AE6AC];^SResString16:TResStringRec
 00473B01    call        LoadStr
 00473B06    mov         eax,dword ptr [ebp-14]
 00473B09    push        eax
 00473B0A    mov         eax,dword ptr [ebp-4]
 00473B0D    mov         eax,dword ptr [eax+38];TGLPicFileImage.PictureFileName:String
 00473B10    mov         dword ptr [ebp-1C],eax
 00473B13    mov         byte ptr [ebp-18],0B
 00473B17    lea         edx,[ebp-1C]
 00473B1A    xor         ecx,ecx
 00473B1C    pop         eax
 00473B1D    call        Format
 00473B22    mov         eax,dword ptr [ebp-10]
 00473B25    mov         ecx,0A81
 00473B2A    mov         edx,473BBC;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00473B2F    call        @Assert
 00473B34    mov         edx,ebx
 00473B36    mov         eax,dword ptr [ebp-4]
 00473B39    call        00473588
 00473B3E    mov         dword ptr [ebp-8],eax
 00473B41    mov         eax,dword ptr [ebp-4]
 00473B44    call        TGLPersistentImage.GetPicture
 00473B49    xor         edx,edx
 00473B4B    call        TPicture.SetGraphic
 00473B50    xor         eax,eax
 00473B52    pop         edx
 00473B53    pop         ecx
 00473B54    pop         ecx
 00473B55    mov         dword ptr fs:[eax],edx
 00473B58    push        473B87
 00473B5D    mov         eax,dword ptr [ebp-4]
 00473B60    call        TGLPersistentImage.GetPicture
 00473B65    mov         edx,dword ptr [ebp-4]
 00473B68    mov         dword ptr [eax+14],edx
 00473B6B    mov         dword ptr [eax+10],473654;sub_00473654
 00473B72    ret
>00473B73    jmp         @HandleFinally
>00473B78    jmp         00473B5D
 00473B7A    mov         edx,ebx
 00473B7C    mov         eax,dword ptr [ebp-4]
 00473B7F    call        00473588
 00473B84    mov         dword ptr [ebp-8],eax
 00473B87    xor         eax,eax
 00473B89    pop         edx
 00473B8A    pop         ecx
 00473B8B    pop         ecx
 00473B8C    mov         dword ptr fs:[eax],edx
 00473B8F    push        473BA9
 00473B94    lea         eax,[ebp-14]
 00473B97    mov         edx,3
 00473B9C    call        @LStrArrayClr
 00473BA1    ret
>00473BA2    jmp         @HandleFinally
>00473BA7    jmp         00473B94
 00473BA9    mov         eax,dword ptr [ebp-8]
 00473BAC    pop         esi
 00473BAD    pop         ebx
 00473BAE    mov         esp,ebp
 00473BB0    pop         ebp
 00473BB1    ret
end;*}

//00473BF0
{*procedure TGLPicFileImage.sub_00473BF0(?:?);
begin
 00473BF0    mov         eax,dword ptr [eax+38];TGLPicFileImage.PictureFileName:String
 00473BF3    xchg        eax,edx
 00473BF4    call        0046BCFC
 00473BF9    ret
end;*}

//00473BFC
{*procedure TGLPicFileImage.sub_00472FD8(?:?);
begin
 00473BFC    push        ebp
 00473BFD    mov         ebp,esp
 00473BFF    push        0
 00473C01    push        ebx
 00473C02    push        esi
 00473C03    mov         ebx,edx
 00473C05    mov         esi,eax
 00473C07    xor         eax,eax
 00473C09    push        ebp
 00473C0A    push        473C86
 00473C0F    push        dword ptr fs:[eax]
 00473C12    mov         dword ptr fs:[eax],esp
 00473C15    mov         edx,ebx
 00473C17    mov         eax,esi
 00473C19    call        TGLTextureImage.sub_00472FD8
 00473C1E    mov         eax,ebx
 00473C20    call        0046BDE4
 00473C25    cmp         edx,0
>00473C28    jne         00473C33
 00473C2A    cmp         eax,200
>00473C2F    jae         00473C67
>00473C31    jmp         00473C35
>00473C33    jge         00473C67
 00473C35    lea         edx,[ebp-4]
 00473C38    mov         eax,ebx
 00473C3A    call        0046BD60
 00473C3F    mov         edx,dword ptr [ebp-4]
 00473C42    mov         eax,473C9C;#0
 00473C47    call        @LStrPos
 00473C4C    test        eax,eax
>00473C4E    jle         00473C5B
 00473C50    mov         edx,ebx
 00473C52    mov         eax,esi
 00473C54    call        TGLPicFileImage.SetPictureFileName
>00473C59    jmp         00473C70
 00473C5B    mov         edx,dword ptr [ebp-4]
 00473C5E    mov         eax,esi
 00473C60    call        TGLPicFileImage.SetPictureFileName
>00473C65    jmp         00473C70
 00473C67    mov         edx,ebx
 00473C69    mov         eax,esi
 00473C6B    call        TGLPicFileImage.SetPictureFileName
 00473C70    xor         eax,eax
 00473C72    pop         edx
 00473C73    pop         ecx
 00473C74    pop         ecx
 00473C75    mov         dword ptr fs:[eax],edx
 00473C78    push        473C8D
 00473C7D    lea         eax,[ebp-4]
 00473C80    call        @LStrClr
 00473C85    ret
>00473C86    jmp         @HandleFinally
>00473C8B    jmp         00473C7D
 00473C8D    pop         esi
 00473C8E    pop         ebx
 00473C8F    pop         ecx
 00473C90    pop         ebp
 00473C91    ret
end;*}

//00473CA0
{*procedure sub_00473CA0(?:?);
begin
 00473CA0    push        ebx
 00473CA1    mov         ebx,edx
 00473CA3    mov         eax,ebx
 00473CA5    mov         edx,473CBC;'PicFile Image'
 00473CAA    call        @LStrAsg
 00473CAF    pop         ebx
 00473CB0    ret
end;*}

//00473CCC
{*procedure sub_00473CCC(?:?);
begin
 00473CCC    push        ebx
 00473CCD    mov         ebx,edx
 00473CCF    mov         eax,ebx
 00473CD1    mov         edx,473CE8;'Image data is retrieved from a file.'
 00473CD6    call        @LStrAsg
 00473CDB    pop         ebx
 00473CDC    ret
end;*}

//00473D10
constructor sub_00473D10;
begin
{*
 00473D10    push        ebp
 00473D11    mov         ebp,esp
 00473D13    push        ecx
 00473D14    push        ebx
 00473D15    push        esi
 00473D16    push        edi
 00473D17    test        dl,dl
>00473D19    je          00473D23
 00473D1B    add         esp,0FFFFFFF0
 00473D1E    call        @ClassCreate
 00473D23    mov         byte ptr [ebp-1],dl
 00473D26    mov         esi,eax
 00473D28    xor         edx,edx
 00473D2A    mov         eax,esi
 00473D2C    call        00472F14
 00473D31    xor         ebx,ebx
 00473D33    mov         dl,1
 00473D35    mov         eax,[00424C0C];TPicture
 00473D3A    call        TPicture.Create;TPicture.Create
 00473D3F    mov         edi,eax
 00473D41    xor         eax,eax
 00473D43    mov         al,bl
 00473D45    mov         dword ptr [esi+eax*4+30],edi
 00473D49    mov         dword ptr [edi+14],esi;TPicture.?f14:TGLPersistentImage
 00473D4C    mov         dword ptr [edi+10],47412C;TPicture.FOnChange:TNotifyEvent sub_0047412C
 00473D53    inc         ebx
 00473D54    cmp         bl,6
>00473D57    jne         00473D33
 00473D59    mov         eax,esi
 00473D5B    cmp         byte ptr [ebp-1],0
>00473D5F    je          00473D70
 00473D61    call        @AfterConstruction
 00473D66    pop         dword ptr fs:[0]
 00473D6D    add         esp,0C
 00473D70    mov         eax,esi
 00473D72    pop         edi
 00473D73    pop         esi
 00473D74    pop         ebx
 00473D75    pop         ecx
 00473D76    pop         ebp
 00473D77    ret
*}
end;

//00473D78
destructor TGLCubeMapImage.Destroy;
begin
{*
 00473D78    push        ebx
 00473D79    push        esi
 00473D7A    push        ecx
 00473D7B    call        @BeforeDestruction
 00473D80    mov         byte ptr [esp],dl
 00473D83    mov         esi,eax
 00473D85    mov         eax,esi
 00473D87    mov         edx,dword ptr [eax]
 00473D89    call        dword ptr [edx+2C];TGLCubeMapImage.sub_00473F28
 00473D8C    xor         ebx,ebx
 00473D8E    xor         eax,eax
 00473D90    mov         al,bl
 00473D92    mov         eax,dword ptr [esi+eax*4+30]
 00473D96    call        TObject.Free
 00473D9B    inc         ebx
 00473D9C    cmp         bl,6
>00473D9F    jne         00473D8E
 00473DA1    mov         dl,byte ptr [esp]
 00473DA4    and         dl,0FC
 00473DA7    mov         eax,esi
 00473DA9    call        TGLTextureImage.Destroy
 00473DAE    cmp         byte ptr [esp],0
>00473DB2    jle         00473DBB
 00473DB4    mov         eax,esi
 00473DB6    call        @ClassDestroy
 00473DBB    pop         edx
 00473DBC    pop         esi
 00473DBD    pop         ebx
 00473DBE    ret
*}
end;

//00473DC0
procedure TGLCubeMapImage.Assign(Source:TPersistent);
begin
{*
 00473DC0    push        ebx
 00473DC1    push        esi
 00473DC2    push        edi
 00473DC3    push        ebp
 00473DC4    mov         esi,edx
 00473DC6    mov         edi,eax
 00473DC8    test        esi,esi
>00473DCA    je          00473E0F
 00473DCC    mov         eax,esi
 00473DCE    mov         edx,dword ptr ds:[4712B8];TGLCubeMapImage
 00473DD4    call        @IsClass
 00473DD9    test        al,al
>00473DDB    je          00473E04
 00473DDD    xor         ebx,ebx
 00473DDF    mov         ebp,ebx
 00473DE1    and         ebp,7F
 00473DE4    mov         edx,dword ptr [esi+ebp*4+30]
 00473DE8    mov         eax,dword ptr [edi+ebp*4+30]
 00473DEC    mov         ecx,dword ptr [eax]
 00473DEE    call        dword ptr [ecx+8]
 00473DF1    inc         ebx
 00473DF2    cmp         bl,6
>00473DF5    jne         00473DDF
 00473DF7    mov         eax,edi
 00473DF9    mov         si,0FFFB
 00473DFD    call        @CallDynaInst;TGLTextureImage.sub_00472FA0
>00473E02    jmp         00473E18
 00473E04    mov         edx,esi
 00473E06    mov         eax,edi
 00473E08    call        TPersistent.Assign
>00473E0D    jmp         00473E18
 00473E0F    mov         edx,esi
 00473E11    mov         eax,edi
 00473E13    call        TPersistent.Assign
 00473E18    pop         ebp
 00473E19    pop         edi
 00473E1A    pop         esi
 00473E1B    pop         ebx
 00473E1C    ret
*}
end;

//00473E20
procedure sub_00473E20;
begin
{*
 00473E20    mov         eax,dword ptr [eax+30];TGLCubeMapImage.?f30:dword
 00473E23    call        TPicture.GetWidth
 00473E28    ret
*}
end;

//00473E2C
procedure sub_00473E2C;
begin
{*
 00473E2C    mov         eax,dword ptr [eax+30];TGLCubeMapImage.?f30:dword
 00473E2F    call        TPicture.GetHeight
 00473E34    ret
*}
end;

//00473E38
{*function sub_00473E38(?:?):?;
begin
 00473E38    push        ebp
 00473E39    mov         ebp,esp
 00473E3B    add         esp,0FFFFFFF8
 00473E3E    mov         dword ptr [ebp-4],eax
 00473E41    mov         byte ptr [ebp-5],0
 00473E45    add         edx,0FFFF7AEB
 00473E4B    cmp         edx,5
>00473E4E    ja          00473E91
 00473E50    jmp         dword ptr [edx*4+473E57]
 00473E50    dd          00473E6F
 00473E50    dd          00473E75
 00473E50    dd          00473E7B
 00473E50    dd          00473E81
 00473E50    dd          00473E87
 00473E50    dd          00473E8D
 00473E6F    mov         byte ptr [ebp-5],0
>00473E73    jmp         00473E91
 00473E75    mov         byte ptr [ebp-5],1
>00473E79    jmp         00473E91
 00473E7B    mov         byte ptr [ebp-5],2
>00473E7F    jmp         00473E91
 00473E81    mov         byte ptr [ebp-5],3
>00473E85    jmp         00473E91
 00473E87    mov         byte ptr [ebp-5],4
>00473E8B    jmp         00473E91
 00473E8D    mov         byte ptr [ebp-5],5
 00473E91    mov         eax,dword ptr [ebp-4]
 00473E94    mov         eax,dword ptr [eax+28];TGLCubeMapImage.?f28:TGLBitmap32
 00473E97    test        eax,eax
>00473E99    je          00473EA0
 00473E9B    call        TObject.Free
 00473EA0    mov         dl,1
 00473EA2    mov         eax,[0046F8F4];TGLBitmap32
 00473EA7    call        TGLBitmap32.Create;TGLBitmap32.Create
 00473EAC    mov         edx,dword ptr [ebp-4]
 00473EAF    mov         dword ptr [edx+28],eax;TGLCubeMapImage.?f28:TGLBitmap32
 00473EB2    xor         edx,edx
 00473EB4    mov         dl,byte ptr [ebp-5]
 00473EB7    mov         eax,dword ptr [ebp-4]
 00473EBA    mov         eax,dword ptr [eax+edx*4+30]
 00473EBE    xor         ecx,ecx
 00473EC0    mov         dword ptr [eax+10],ecx
 00473EC3    mov         dword ptr [eax+14],ecx
 00473EC6    xor         ecx,ecx
 00473EC8    push        ebp
 00473EC9    push        473F14
 00473ECE    push        dword ptr fs:[ecx]
 00473ED1    mov         dword ptr fs:[ecx],esp
 00473ED4    mov         eax,dword ptr [ebp-4]
 00473ED7    mov         eax,dword ptr [eax+28];TGLCubeMapImage.?f28:TGLBitmap32
 00473EDA    mov         byte ptr [eax+14],1;TGLBitmap32.?f14:byte
 00473EDE    mov         ecx,dword ptr [ebp-4]
 00473EE1    mov         edx,dword ptr [ecx+edx*4+30]
 00473EE5    mov         edx,dword ptr [edx+0C]
 00473EE8    mov         ecx,dword ptr [eax]
 00473EEA    call        dword ptr [ecx+8];TGLBitmap32.Assign
 00473EED    xor         eax,eax
 00473EEF    pop         edx
 00473EF0    pop         ecx
 00473EF1    pop         ecx
 00473EF2    mov         dword ptr fs:[eax],edx
 00473EF5    push        473F1B
 00473EFA    xor         eax,eax
 00473EFC    mov         al,byte ptr [ebp-5]
 00473EFF    mov         edx,dword ptr [ebp-4]
 00473F02    mov         eax,dword ptr [edx+eax*4+30]
 00473F06    mov         edx,dword ptr [ebp-4]
 00473F09    mov         dword ptr [eax+14],edx
 00473F0C    mov         dword ptr [eax+10],47412C;sub_0047412C
 00473F13    ret
>00473F14    jmp         @HandleFinally
>00473F19    jmp         00473EFA
 00473F1B    mov         eax,dword ptr [ebp-4]
 00473F1E    mov         eax,dword ptr [eax+28];TGLCubeMapImage.?f28:TGLBitmap32
 00473F21    pop         ecx
 00473F22    pop         ecx
 00473F23    pop         ebp
 00473F24    ret
end;*}

//00473F28
procedure sub_00473F28;
begin
{*
 00473F28    push        ebx
 00473F29    mov         ebx,eax
 00473F2B    mov         eax,dword ptr [ebx+28];TGLCubeMapImage.?f28:TGLBitmap32
 00473F2E    test        eax,eax
>00473F30    je          00473F3C
 00473F32    call        TObject.Free
 00473F37    xor         eax,eax
 00473F39    mov         dword ptr [ebx+28],eax;TGLCubeMapImage.?f28:TGLBitmap32
 00473F3C    pop         ebx
 00473F3D    ret
*}
end;

//00473F40
{*procedure TGLCubeMapImage.sub_00473F40(?:?);
begin
 00473F40    push        ebp
 00473F41    mov         ebp,esp
 00473F43    add         esp,0FFFFFFF0
 00473F46    push        ebx
 00473F47    push        esi
 00473F48    mov         dword ptr [ebp-4],edx
 00473F4B    mov         esi,eax
 00473F4D    push        0FFFF
 00473F52    mov         ecx,dword ptr [ebp-4]
 00473F55    mov         dl,1
 00473F57    mov         eax,[00418550];TFileStream
 00473F5C    call        TFileStream.Create;TFileStream.Create
 00473F61    mov         dword ptr [ebp-8],eax
 00473F64    mov         dl,1
 00473F66    mov         eax,[00424EB8];TBitmap
 00473F6B    call        TBitmap.Create;TBitmap.Create
 00473F70    mov         dword ptr [ebp-0C],eax
 00473F73    xor         eax,eax
 00473F75    push        ebp
 00473F76    push        473FDB
 00473F7B    push        dword ptr fs:[eax]
 00473F7E    mov         dword ptr fs:[eax],esp
 00473F81    mov         word ptr [ebp-0E],100
 00473F87    lea         edx,[ebp-0E]
 00473F8A    mov         ecx,2
 00473F8F    mov         eax,dword ptr [ebp-8]
 00473F92    mov         ebx,dword ptr [eax]
 00473F94    call        dword ptr [ebx+10];THandleStream.Write
 00473F97    xor         ebx,ebx
 00473F99    xor         eax,eax
 00473F9B    mov         al,bl
 00473F9D    mov         eax,dword ptr [esi+eax*4+30]
 00473FA1    mov         edx,dword ptr [eax+0C]
 00473FA4    mov         eax,dword ptr [ebp-0C]
 00473FA7    mov         ecx,dword ptr [eax]
 00473FA9    call        dword ptr [ecx+8];TBitmap.Assign
 00473FAC    mov         edx,dword ptr [ebp-8]
 00473FAF    mov         eax,dword ptr [ebp-0C]
 00473FB2    mov         ecx,dword ptr [eax]
 00473FB4    call        dword ptr [ecx+58];TBitmap.SaveToStream
 00473FB7    inc         ebx
 00473FB8    cmp         bl,6
>00473FBB    jne         00473F99
 00473FBD    xor         eax,eax
 00473FBF    pop         edx
 00473FC0    pop         ecx
 00473FC1    pop         ecx
 00473FC2    mov         dword ptr fs:[eax],edx
 00473FC5    push        473FE2
 00473FCA    mov         eax,dword ptr [ebp-0C]
 00473FCD    call        TObject.Free
 00473FD2    mov         eax,dword ptr [ebp-8]
 00473FD5    call        TObject.Free
 00473FDA    ret
>00473FDB    jmp         @HandleFinally
>00473FE0    jmp         00473FCA
 00473FE2    pop         esi
 00473FE3    pop         ebx
 00473FE4    mov         esp,ebp
 00473FE6    pop         ebp
 00473FE7    ret
end;*}

//00473FE8
{*procedure TGLCubeMapImage.sub_00472FD8(?:?);
begin
 00473FE8    push        ebp
 00473FE9    mov         ebp,esp
 00473FEB    add         esp,0FFFFFFF0
 00473FEE    push        ebx
 00473FEF    push        esi
 00473FF0    mov         dword ptr [ebp-4],edx
 00473FF3    mov         esi,eax
 00473FF5    push        20
 00473FF7    mov         ecx,dword ptr [ebp-4]
 00473FFA    mov         dl,1
 00473FFC    mov         eax,[00418550];TFileStream
 00474001    call        TFileStream.Create;TFileStream.Create
 00474006    mov         dword ptr [ebp-8],eax
 00474009    mov         dl,1
 0047400B    mov         eax,[00424EB8];TBitmap
 00474010    call        TBitmap.Create;TBitmap.Create
 00474015    mov         dword ptr [ebp-0C],eax
 00474018    xor         eax,eax
 0047401A    push        ebp
 0047401B    push        474093
 00474020    push        dword ptr fs:[eax]
 00474023    mov         dword ptr fs:[eax],esp
 00474026    lea         edx,[ebp-0E]
 00474029    mov         ecx,2
 0047402E    mov         eax,dword ptr [ebp-8]
 00474031    mov         ebx,dword ptr [eax]
 00474033    call        dword ptr [ebx+0C];THandleStream.Read
 00474036    cmp         word ptr [ebp-0E],100
>0047403C    je          00474052
 0047403E    mov         ecx,0B50
 00474043    mov         edx,4740A8;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00474048    mov         eax,4740E4;'Assertion failure'
 0047404D    call        @Assert
 00474052    xor         ebx,ebx
 00474054    mov         edx,dword ptr [ebp-8]
 00474057    mov         eax,dword ptr [ebp-0C]
 0047405A    mov         ecx,dword ptr [eax]
 0047405C    call        dword ptr [ecx+54];TBitmap.LoadFromStream
 0047405F    xor         eax,eax
 00474061    mov         al,bl
 00474063    mov         eax,dword ptr [esi+eax*4+30]
 00474067    mov         edx,dword ptr [ebp-0C]
 0047406A    call        TPicture.SetGraphic
 0047406F    inc         ebx
 00474070    cmp         bl,6
>00474073    jne         00474054
 00474075    xor         eax,eax
 00474077    pop         edx
 00474078    pop         ecx
 00474079    pop         ecx
 0047407A    mov         dword ptr fs:[eax],edx
 0047407D    push        47409A
 00474082    mov         eax,dword ptr [ebp-0C]
 00474085    call        TObject.Free
 0047408A    mov         eax,dword ptr [ebp-8]
 0047408D    call        TObject.Free
 00474092    ret
>00474093    jmp         @HandleFinally
>00474098    jmp         00474082
 0047409A    pop         esi
 0047409B    pop         ebx
 0047409C    mov         esp,ebp
 0047409E    pop         ebp
 0047409F    ret
end;*}

//004740F8
{*procedure sub_004740F8(?:?);
begin
 004740F8    push        ebx
 004740F9    mov         ebx,edx
 004740FB    mov         eax,ebx
 004740FD    mov         edx,474114;'CubeMap Image'
 00474102    call        @LStrAsg
 00474107    pop         ebx
 00474108    ret
end;*}

//00474124
{*function sub_00474124:?;
begin
 00474124    mov         eax,8513
 00474129    ret
end;*}

//0047412C
procedure sub_0047412C;
begin
{*
 0047412C    push        esi
 0047412D    mov         si,0FFFB
 00474131    call        @CallDynaInst
 00474136    pop         esi
 00474137    ret
*}
end;

//00474138
{*procedure TGLCubeMapImage.SetPicturePX(Value:TPicture; ?:?);
begin
 00474138    push        esi
 00474139    push        edi
 0047413A    mov         edi,ecx
 0047413C    mov         esi,eax
 0047413E    xor         eax,eax
 00474140    mov         al,dl
 00474142    mov         eax,dword ptr [esi+eax*4+30]
 00474146    mov         edx,edi
 00474148    mov         ecx,dword ptr [eax]
 0047414A    call        dword ptr [ecx+8]
 0047414D    pop         edi
 0047414E    pop         esi
 0047414F    ret
end;*}

//00474150
{*function TGLCubeMapImage.GetPicturePX(?:?):?;
begin
 00474150    and         edx,7F
 00474153    mov         eax,dword ptr [eax+edx*4+30]
 00474157    ret
end;*}

//00474158
constructor TGLShader.Create(AOwner:TComponent);
begin
{*
 00474158    push        ebx
 00474159    push        esi
 0047415A    push        edi
 0047415B    test        dl,dl
>0047415D    je          00474167
 0047415F    add         esp,0FFFFFFF0
 00474162    call        @ClassCreate
 00474167    mov         esi,ecx
 00474169    mov         ebx,edx
 0047416B    mov         edi,eax
 0047416D    mov         dl,1
 0047416F    mov         eax,[00417CEC];TList
 00474174    call        TObject.Create;TList.Create
 00474179    mov         dword ptr [edi+34],eax;TGLShader.?f34:TList
 0047417C    mov         dl,1
 0047417E    mov         eax,[0046C040];TGLVirtualHandle
 00474183    call        TGLVirtualHandle.Create;TGLVirtualHandle.Create
 00474188    mov         dword ptr [edi+38],eax;TGLShader.?f38:TGLVirtualHandle
 0047418B    mov         byte ptr [edi+3C],1;TGLShader.?f3C:byte
 0047418F    mov         byte ptr [edi+30],1;TGLShader.Enabled:Boolean
 00474193    mov         ecx,esi
 00474195    xor         edx,edx
 00474197    mov         eax,edi
 00474199    call        TComponent.Create
 0047419E    mov         eax,edi
 004741A0    test        bl,bl
>004741A2    je          004741B3
 004741A4    call        @AfterConstruction
 004741A9    pop         dword ptr fs:[0]
 004741B0    add         esp,0C
 004741B3    mov         eax,edi
 004741B5    pop         edi
 004741B6    pop         esi
 004741B7    pop         ebx
 004741B8    ret
*}
end;

//004741BC
destructor TGLShader.Destroy;
begin
{*
 004741BC    push        ebx
 004741BD    push        esi
 004741BE    push        edi
 004741BF    push        ebp
 004741C0    call        @BeforeDestruction
 004741C5    mov         ebx,edx
 004741C7    mov         esi,eax
 004741C9    mov         eax,dword ptr [esi+38];TGLShader.?f38:TGLVirtualHandle
 004741CC    call        0046CFA8
 004741D1    mov         eax,esi
 004741D3    call        004742A4
 004741D8    mov         edx,ebx
 004741DA    and         dl,0FC
 004741DD    mov         eax,esi
 004741DF    call        TComponent.Destroy
 004741E4    mov         edi,dword ptr [esi+34];TGLShader.?f34:TList
 004741E7    xor         eax,eax
 004741E9    mov         dword ptr [esi+34],eax;TGLShader.?f34:TList
 004741EC    mov         ebp,dword ptr [edi+8];TList.FCount:Integer
 004741EF    dec         ebp
 004741F0    cmp         ebp,0
>004741F3    jl          0047420B
 004741F5    mov         edx,ebp
 004741F7    mov         eax,edi
 004741F9    call        TList.Get
 004741FE    xor         edx,edx
 00474200    call        TGLLibMaterial.SetShader
 00474205    dec         ebp
 00474206    cmp         ebp,0FFFFFFFF
>00474209    jne         004741F5
 0047420B    mov         eax,edi
 0047420D    call        TObject.Free
 00474212    mov         eax,dword ptr [esi+38];TGLShader.?f38:TGLVirtualHandle
 00474215    call        TObject.Free
 0047421A    test        bl,bl
>0047421C    jle         00474225
 0047421E    mov         eax,esi
 00474220    call        @ClassDestroy
 00474225    pop         ebp
 00474226    pop         edi
 00474227    pop         esi
 00474228    pop         ebx
 00474229    ret
*}
end;

//0047422C
procedure sub_0047422C;
begin
{*
 0047422C    push        ebx
 0047422D    push        esi
 0047422E    mov         esi,eax
 00474230    cmp         dword ptr [esi+40],0;TGLShader.?f40:dword
>00474234    jne         0047425E
 00474236    mov         eax,dword ptr [esi+34];TGLShader.?f34:TList
 00474239    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 0047423C    dec         ebx
 0047423D    cmp         ebx,0
>00474240    jl          00474257
 00474242    mov         edx,ebx
 00474244    mov         eax,dword ptr [esi+34];TGLShader.?f34:TList
 00474247    call        TList.Get
 0047424C    call        00476F90
 00474251    dec         ebx
 00474252    cmp         ebx,0FFFFFFFF
>00474255    jne         00474242
 00474257    mov         eax,esi
 00474259    call        004742A4
 0047425E    pop         esi
 0047425F    pop         ebx
 00474260    ret
*}
end;

//00474264
procedure TGLShader.sub_00474264;
begin
{*
 00474264    ret
*}
end;

//00474268
procedure TGLShader.sub_00474268;
begin
{*
 00474268    ret
*}
end;

//0047426C
{*procedure sub_0047426C(?:?);
begin
 0047426C    push        ebx
 0047426D    push        esi
 0047426E    mov         ebx,eax
 00474270    mov         eax,dword ptr [ebx+38]
 00474273    cmp         dword ptr [eax+8],0
>00474277    jne         004742A1
 00474279    mov         dword ptr [eax+14],ebx
 0047427C    mov         dword ptr [eax+10],4744A8
 00474283    mov         dword ptr [eax+1C],ebx
 00474286    mov         dword ptr [eax+18],474498;sub_00474498
 0047428D    call        0046CEE8
 00474292    mov         eax,ebx
 00474294    mov         si,0FFEF
 00474298    call        @CallDynaInst
 0047429D    mov         byte ptr [ebx+45],1
 004742A1    pop         esi
 004742A2    pop         ebx
 004742A3    ret
end;*}

//004742A4
procedure sub_004742A4(?:TGLShader);
begin
{*
 004742A4    push        ebp
 004742A5    mov         ebp,esp
 004742A7    add         esp,0FFFFFFF8
 004742AA    push        ebx
 004742AB    push        esi
 004742AC    mov         dword ptr [ebp-4],eax
 004742AF    mov         eax,dword ptr [ebp-4]
 004742B2    mov         ebx,dword ptr [eax+38];TGLShader.?f38:TGLVirtualHandle
 004742B5    cmp         dword ptr [ebx+8],0;TGLVirtualHandle.?f8:dword
>004742B9    je          0047433A
 004742BB    mov         eax,dword ptr [ebp-4]
 004742BE    cmp         byte ptr [eax+45],0;TGLShader.?f45:byte
>004742C2    je          0047433A
 004742C4    mov         eax,dword ptr [ebx+4];TGLVirtualHandle.?f4:dword
 004742C7    call        0046C844
 004742CC    xor         al,1
 004742CE    mov         byte ptr [ebp-5],al
 004742D1    cmp         byte ptr [ebp-5],0
>004742D5    je          004742E5
 004742D7    mov         eax,dword ptr [ebp-4]
 004742DA    mov         eax,dword ptr [eax+38];TGLShader.?f38:TGLVirtualHandle
 004742DD    mov         eax,dword ptr [eax+4];TGLVirtualHandle.?f4:dword
 004742E0    call        0046CC00
 004742E5    xor         eax,eax
 004742E7    push        ebp
 004742E8    push        474328
 004742ED    push        dword ptr fs:[eax]
 004742F0    mov         dword ptr fs:[eax],esp
 004742F3    mov         eax,dword ptr [ebp-4]
 004742F6    mov         byte ptr [eax+45],0;TGLShader.?f45:byte
 004742FA    mov         eax,dword ptr [ebp-4]
 004742FD    mov         si,0FFEE
 00474301    call        @CallDynaInst;TGLShader.sub_00474268
 00474306    xor         eax,eax
 00474308    pop         edx
 00474309    pop         ecx
 0047430A    pop         ecx
 0047430B    mov         dword ptr fs:[eax],edx
 0047430E    push        47432F
 00474313    cmp         byte ptr [ebp-5],0
>00474317    je          00474327
 00474319    mov         eax,dword ptr [ebp-4]
 0047431C    mov         eax,dword ptr [eax+38];TGLShader.?f38:TGLVirtualHandle
 0047431F    mov         eax,dword ptr [eax+4];TGLVirtualHandle.?f4:dword
 00474322    call        0046CD1C
 00474327    ret
>00474328    jmp         @HandleFinally
>0047432D    jmp         00474313
 0047432F    mov         eax,dword ptr [ebp-4]
 00474332    mov         eax,dword ptr [eax+38];TGLShader.?f38:TGLVirtualHandle
 00474335    call        0046CFA8
 0047433A    pop         esi
 0047433B    pop         ebx
 0047433C    pop         ecx
 0047433D    pop         ecx
 0047433E    pop         ebp
 0047433F    ret
*}
end;

//00474340
{*procedure sub_00474340(?:?; ?:?; ?:?);
begin
 00474340    push        ebx
 00474341    push        esi
 00474342    push        edi
 00474343    mov         edi,ecx
 00474345    mov         esi,edx
 00474347    mov         ebx,eax
 00474349    cmp         byte ptr [ebx+44],0
>0047434D    je          00474363
 0047434F    mov         ecx,0BF9
 00474354    mov         edx,474394;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00474359    mov         eax,4743D0;'Unbalanced shader application.'
 0047435E    call        @Assert
 00474363    cmp         byte ptr [ebx+30],0
>00474367    je          00474384
 00474369    mov         eax,dword ptr [ebx+38]
 0047436C    cmp         dword ptr [eax+8],0
>00474370    jne         00474379
 00474372    mov         eax,ebx
 00474374    call        0047426C
 00474379    mov         edx,esi
 0047437B    mov         ecx,edi
 0047437D    mov         eax,ebx
 0047437F    mov         esi,dword ptr [eax]
 00474381    call        dword ptr [esi+38]
 00474384    mov         byte ptr [ebx+44],1
 00474388    pop         edi
 00474389    pop         esi
 0047438A    pop         ebx
 0047438B    ret
end;*}

//004743F0
{*function sub_004743F0(?:?; ?:?):?;
begin
 004743F0    push        ebx
 004743F1    push        esi
 004743F2    mov         esi,edx
 004743F4    mov         ebx,eax
 004743F6    cmp         byte ptr [ebx+44],0
>004743FA    jne         00474410
 004743FC    mov         ecx,0C06
 00474401    mov         edx,47443C;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00474406    mov         eax,474478;'Unbalanced shader application.'
 0047440B    call        @Assert
 00474410    cmp         byte ptr [ebx+30],0
>00474414    je          0047442A
 00474416    mov         edx,esi
 00474418    mov         eax,ebx
 0047441A    mov         ecx,dword ptr [eax]
 0047441C    call        dword ptr [ecx+3C]
 0047441F    test        al,al
>00474421    jne         00474430
 00474423    mov         byte ptr [ebx+44],0
 00474427    pop         esi
 00474428    pop         ebx
 00474429    ret
 0047442A    mov         byte ptr [ebx+44],0
 0047442E    xor         eax,eax
 00474430    pop         esi
 00474431    pop         ebx
 00474432    ret
end;*}

//00474498
{*procedure sub_00474498(?:?; ?:?; ?:?);
begin
 00474498    push        ebx
 00474499    mov         ebx,ecx
 0047449B    call        004742A4
 004744A0    xor         eax,eax
 004744A2    mov         dword ptr [ebx],eax
 004744A4    pop         ebx
 004744A5    ret
end;*}

//004744B0
procedure TGLShader.SetEnabled(Value:Boolean);
begin
{*
 004744B0    push        ebx
 004744B1    push        esi
 004744B2    mov         ebx,edx
 004744B4    mov         esi,eax
 004744B6    cmp         byte ptr [esi+44],0;TGLShader.?f44:byte
>004744BA    je          004744D0
 004744BC    mov         ecx,0C24
 004744C1    mov         edx,4744EC;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 004744C6    mov         eax,474528;'Shader is active.'
 004744CB    call        @Assert
 004744D0    cmp         bl,byte ptr [esi+30];TGLShader.Enabled:Boolean
>004744D3    je          004744E1
 004744D5    mov         byte ptr [esi+30],bl;TGLShader.Enabled:Boolean
 004744D8    mov         edx,esi
 004744DA    mov         eax,esi
 004744DC    mov         ecx,dword ptr [eax]
 004744DE    call        dword ptr [ecx+34];TGLShader.sub_0047422C
 004744E1    pop         esi
 004744E2    pop         ebx
 004744E3    ret
*}
end;

//0047453C
procedure sub_0047453C(?:TGLShader; ?:TGLLibMaterial);
begin
{*
 0047453C    push        ebx
 0047453D    push        esi
 0047453E    mov         esi,edx
 00474540    mov         ebx,eax
 00474542    mov         edx,esi
 00474544    mov         eax,dword ptr [ebx+34]
 00474547    call        TList.IndexOf
 0047454C    test        eax,eax
>0047454E    jge         0047455A
 00474550    mov         edx,esi
 00474552    mov         eax,dword ptr [ebx+34]
 00474555    call        TList.Add
 0047455A    pop         esi
 0047455B    pop         ebx
 0047455C    ret
*}
end;

//00474560
procedure sub_00474560(?:TGLShader);
begin
{*
 00474560    mov         ecx,dword ptr [eax+34]
 00474563    test        ecx,ecx
>00474565    je          0047456E
 00474567    mov         eax,ecx
 00474569    call        TList.Remove
 0047456E    ret
*}
end;

//00474570
constructor TGLTexture.Create;
begin
{*
 00474570    push        ebp
 00474571    mov         ebp,esp
 00474573    push        ecx
 00474574    push        ebx
 00474575    push        esi
 00474576    test        dl,dl
>00474578    je          00474582
 0047457A    add         esp,0FFFFFFF0
 0047457D    call        @ClassCreate
 00474582    mov         byte ptr [ebp-1],dl
 00474585    mov         ebx,eax
 00474587    xor         edx,edx
 00474589    mov         eax,ebx
 0047458B    call        0046B394
 00474590    mov         byte ptr [ebx+22],1;TGLTexture.Disabled:Boolean
 00474594    mov         al,[00474630];0x3 gvar_00474630
 00474599    mov         byte ptr [ebx+21],al;TGLTexture.?f21:byte
 0047459C    mov         ecx,ebx
 0047459E    mov         dl,1
 004745A0    mov         eax,[004710BC];TGLPersistentImage
 004745A5    call        TGLPersistentImage.Create;TGLPersistentImage.Create
 004745AA    mov         esi,eax
 004745AC    mov         dword ptr [ebx+24],esi;TGLTexture.Image:TGLTextureImage
 004745AF    mov         dword ptr [esi+24],ebx;TGLPersistentImage.?f24:TGLTexture
 004745B2    mov         dword ptr [esi+20],475B00;TGLPersistentImage.?f20:? sub_00475B00
 004745B9    mov         byte ptr [ebx+28],0;TGLTexture.ImageAlpha:TGLTextureImageAlpha
 004745BD    mov         dword ptr [ebx+2C],3F800000;TGLTexture.ImageBrightness:Single
 004745C4    mov         dword ptr [ebx+30],3F800000;TGLTexture.ImageGamma:Single
 004745CB    mov         byte ptr [ebx+20],1;TGLTexture.MagFilter:TGLMagFilter
 004745CF    mov         byte ptr [ebx+1F],5;TGLTexture.MinFilter:TGLMinFilter
 004745D3    mov         byte ptr [ebx+50],0;TGLTexture.FilteringQuality:TGLTextureFilteringQuality
 004745D7    mov         dword ptr [ebx+4C],0FFFFFFFF;TGLTexture.?f4C:dword
 004745DE    mov         dl,1
 004745E0    mov         eax,[0046C11C];TGLTextureHandle
 004745E5    call        TGLVirtualHandle.Create;TGLTextureHandle.Create
 004745EA    mov         dword ptr [ebx+18],eax;TGLTexture.?f18:TGLTextureHandle
 004745ED    mov         byte ptr [ebx+34],0;TGLTexture.MappingMode:TGLTextureMappingMode
 004745F1    push        5AD40C
 004745F6    push        0
 004745F8    push        0
 004745FA    mov         ecx,ebx
 004745FC    mov         dl,1
 004745FE    mov         eax,[00470BF8];TGLColor
 00474603    call        TGLColor.Create;TGLColor.Create
 00474608    mov         dword ptr [ebx+5C],eax;TGLTexture.EnvColor:TGLColor
 0047460B    mov         dword ptr [ebx+60],3E000000;TGLTexture.NormalMapScale:Single
 00474612    mov         eax,ebx
 00474614    cmp         byte ptr [ebp-1],0
>00474618    je          00474629
 0047461A    call        @AfterConstruction
 0047461F    pop         dword ptr fs:[0]
 00474626    add         esp,0C
 00474629    mov         eax,ebx
 0047462B    pop         esi
 0047462C    pop         ebx
 0047462D    pop         ecx
 0047462E    pop         ebp
 0047462F    ret
*}
end;

//00474634
destructor TGLTexture.Destroy;
begin
{*
 00474634    push        ebx
 00474635    push        esi
 00474636    call        @BeforeDestruction
 0047463B    mov         ebx,edx
 0047463D    mov         esi,eax
 0047463F    mov         eax,dword ptr [esi+5C];TGLTexture.EnvColor:TGLColor
 00474642    call        TObject.Free
 00474647    mov         eax,dword ptr [esi+38];TGLTexture.?f38:TGLCoordinates4
 0047464A    call        TObject.Free
 0047464F    mov         eax,dword ptr [esi+3C];TGLTexture.?f3C:TGLCoordinates4
 00474652    call        TObject.Free
 00474657    mov         eax,esi
 00474659    call        004755C8
 0047465E    mov         eax,dword ptr [esi+18];TGLTexture.?f18:TGLTextureHandle
 00474661    call        TObject.Free
 00474666    mov         eax,dword ptr [esi+24];TGLTexture.Image:TGLTextureImage
 00474669    call        TObject.Free
 0047466E    mov         edx,ebx
 00474670    and         dl,0FC
 00474673    mov         eax,esi
 00474675    call        TMemoryStream.Destroy
 0047467A    test        bl,bl
>0047467C    jle         00474685
 0047467E    mov         eax,esi
 00474680    call        @ClassDestroy
 00474685    pop         esi
 00474686    pop         ebx
 00474687    ret
*}
end;

//00474688
procedure TGLTexture.Assign(Source:TPersistent);
begin
{*
 00474688    push        ebx
 00474689    push        esi
 0047468A    push        edi
 0047468B    mov         esi,edx
 0047468D    mov         ebx,eax
 0047468F    test        esi,esi
>00474691    je          0047476C
 00474697    mov         eax,esi
 00474699    mov         edx,dword ptr ds:[471868];TGLTexture
 0047469F    call        @IsClass
 004746A4    test        al,al
>004746A6    je          00474726
 004746A8    cmp         ebx,esi
>004746AA    je          00474781
 004746B0    mov         edi,esi
 004746B2    mov         al,byte ptr [edi+28]
 004746B5    mov         byte ptr [ebx+28],al;TGLTexture.ImageAlpha:TGLTextureImageAlpha
 004746B8    mov         al,byte ptr [edi+1C]
 004746BB    mov         byte ptr [ebx+1C],al;TGLTexture.TextureMode:TGLTextureMode
 004746BE    mov         al,byte ptr [edi+1D]
 004746C1    mov         byte ptr [ebx+1D],al;TGLTexture.TextureWrap:TGLTextureWrap
 004746C4    mov         al,byte ptr [edi+1E]
 004746C7    mov         byte ptr [ebx+1E],al;TGLTexture.TextureFormat:TGLTextureFormat
 004746CA    mov         al,byte ptr [edi+48]
 004746CD    mov         byte ptr [ebx+48],al;TGLTexture.Compression:TGLTextureCompression
 004746D0    mov         al,byte ptr [edi+1F]
 004746D3    mov         byte ptr [ebx+1F],al;TGLTexture.MinFilter:TGLMinFilter
 004746D6    mov         al,byte ptr [edi+20]
 004746D9    mov         byte ptr [ebx+20],al;TGLTexture.MagFilter:TGLMagFilter
 004746DC    mov         al,byte ptr [edi+34]
 004746DF    mov         byte ptr [ebx+34],al;TGLTexture.MappingMode:TGLTextureMappingMode
 004746E2    mov         eax,edi
 004746E4    call        TGLTexture.GetMappingSCoordinates
 004746E9    push        eax
 004746EA    mov         eax,ebx
 004746EC    call        TGLTexture.GetMappingSCoordinates
 004746F1    pop         edx
 004746F2    mov         ecx,dword ptr [eax]
 004746F4    call        dword ptr [ecx+8]
 004746F7    mov         eax,edi
 004746F9    call        TGLTexture.GetMappingTCoordinates
 004746FE    push        eax
 004746FF    mov         eax,ebx
 00474701    call        TGLTexture.GetMappingTCoordinates
 00474706    pop         edx
 00474707    mov         ecx,dword ptr [eax]
 00474709    call        dword ptr [ecx+8]
 0047470C    mov         al,byte ptr [edi+22]
 0047470F    mov         byte ptr [ebx+22],al;TGLTexture.Disabled:Boolean
 00474712    mov         edx,dword ptr [edi+24]
 00474715    mov         eax,ebx
 00474717    call        TGLTexture.SetImage
 0047471C    mov         al,[00474788];0x3 gvar_00474788
 00474721    mov         byte ptr [ebx+21],al;TGLTexture.?f21:byte
>00474724    jmp         00474781
 00474726    mov         eax,esi
 00474728    mov         edx,dword ptr ds:[424AB8];TGraphic
 0047472E    call        @IsClass
 00474733    test        al,al
>00474735    je          00474743
 00474737    mov         edx,esi
 00474739    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 0047473C    mov         ecx,dword ptr [eax]
 0047473E    call        dword ptr [ecx+8];TPersistent.Assign
>00474741    jmp         00474781
 00474743    mov         eax,esi
 00474745    mov         edx,dword ptr ds:[424C0C];TPicture
 0047474B    call        @IsClass
 00474750    test        al,al
>00474752    je          00474761
 00474754    mov         edx,dword ptr [esi+0C]
 00474757    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 0047475A    mov         ecx,dword ptr [eax]
 0047475C    call        dword ptr [ecx+8];TPersistent.Assign
>0047475F    jmp         00474781
 00474761    mov         edx,esi
 00474763    mov         eax,ebx
 00474765    call        TPersistent.Assign
>0047476A    jmp         00474781
 0047476C    mov         byte ptr [ebx+22],1;TGLTexture.Disabled:Boolean
 00474770    xor         edx,edx
 00474772    mov         eax,ebx
 00474774    call        TGLTexture.SetImage
 00474779    mov         al,[00474788];0x3 gvar_00474788
 0047477E    mov         byte ptr [ebx+21],al;TGLTexture.?f21:byte
 00474781    pop         edi
 00474782    pop         esi
 00474783    pop         ebx
 00474784    ret
*}
end;

//0047478C
{*procedure sub_0047478C(?:?);
begin
 0047478C    push        ebx
 0047478D    push        esi
 0047478E    push        edi
 0047478F    mov         edi,edx
 00474791    mov         ebx,eax
 00474793    mov         esi,dword ptr [ebx+4];TGLTexture.?f4:dword
 00474796    test        esi,esi
>00474798    je          004747B4
 0047479A    mov         eax,esi
 0047479C    mov         edx,dword ptr ds:[471BC4];TGLTextureExItem
 004747A2    call        @IsClass
 004747A7    test        al,al
>004747A9    je          004747B4
 004747AB    mov         edx,edi
 004747AD    mov         eax,esi
 004747AF    call        00475C64
 004747B4    mov         edx,edi
 004747B6    mov         eax,ebx
 004747B8    call        0046B3D0
 004747BD    pop         edi
 004747BE    pop         esi
 004747BF    pop         ebx
 004747C0    ret
end;*}

//004747C4
procedure sub_004747C4(?:TGLTexture);
begin
{*
 004747C4    push        ebx
 004747C5    mov         ebx,eax
 004747C7    or          byte ptr [ebx+21],1
 004747CB    mov         edx,ebx
 004747CD    mov         eax,ebx
 004747CF    mov         ecx,dword ptr [eax]
 004747D1    call        dword ptr [ecx+10]
 004747D4    pop         ebx
 004747D5    ret
*}
end;

//004747D8
procedure sub_004747D8(?:TGLTexture);
begin
{*
 004747D8    push        ebx
 004747D9    mov         ebx,eax
 004747DB    or          byte ptr [ebx+21],2
 004747DF    mov         edx,ebx
 004747E1    mov         eax,ebx
 004747E3    mov         ecx,dword ptr [eax]
 004747E5    call        dword ptr [ecx+10]
 004747E8    pop         ebx
 004747E9    ret
*}
end;

//004747EC
procedure TGLTexture.SetImage(Value:TGLTextureImage);
begin
{*
 004747EC    push        ebx
 004747ED    push        esi
 004747EE    push        edi
 004747EF    mov         esi,edx
 004747F1    mov         ebx,eax
 004747F3    test        esi,esi
>004747F5    je          0047483D
 004747F7    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 004747FA    call        TObject.ClassType
 004747FF    mov         edi,eax
 00474801    mov         eax,esi
 00474803    call        TObject.ClassType
 00474808    cmp         edi,eax
>0047480A    je          00474831
 0047480C    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 0047480F    call        TObject.Free
 00474814    mov         eax,esi
 00474816    call        TObject.ClassType
 0047481B    mov         ecx,ebx
 0047481D    mov         dl,1
 0047481F    call        dword ptr [eax+0C]
 00474822    mov         edi,eax
 00474824    mov         dword ptr [ebx+24],edi;TGLTexture.Image:TGLTextureImage
 00474827    mov         dword ptr [edi+24],ebx
 0047482A    mov         dword ptr [edi+20],475B00;sub_00475B00
 00474831    mov         edx,esi
 00474833    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 00474836    mov         ecx,dword ptr [eax]
 00474838    call        dword ptr [ecx+8];TPersistent.Assign
>0047483B    jmp         00474862
 0047483D    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 00474840    call        TObject.Free
 00474845    mov         ecx,ebx
 00474847    mov         dl,1
 00474849    mov         eax,[004710BC];TGLPersistentImage
 0047484E    call        TGLPersistentImage.Create;TGLPersistentImage.Create
 00474853    mov         esi,eax
 00474855    mov         dword ptr [ebx+24],esi;TGLTexture.Image:TGLTextureImage
 00474858    mov         dword ptr [esi+24],ebx;TGLPersistentImage.?f24:TGLTexture
 0047485B    mov         dword ptr [esi+20],475B00;TGLPersistentImage.?f20:? sub_00475B00
 00474862    pop         edi
 00474863    pop         esi
 00474864    pop         ebx
 00474865    ret
*}
end;

//00474868
procedure TGLTexture.SetImageClassName(Value:String);
begin
{*
 00474868    push        ebp
 00474869    mov         ebp,esp
 0047486B    add         esp,0FFFFFEFC
 00474871    push        ebx
 00474872    push        esi
 00474873    push        edi
 00474874    xor         ecx,ecx
 00474876    mov         dword ptr [ebp-4],ecx
 00474879    mov         esi,edx
 0047487B    mov         ebx,eax
 0047487D    xor         eax,eax
 0047487F    push        ebp
 00474880    push        4748FB
 00474885    push        dword ptr fs:[eax]
 00474888    mov         dword ptr fs:[eax],esp
 0047488B    test        esi,esi
>0047488D    je          004748E5
 0047488F    lea         edx,[ebp-104]
 00474895    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 00474898    mov         eax,dword ptr [eax]
 0047489A    call        TObject.ClassName
 0047489F    lea         edx,[ebp-104]
 004748A5    lea         eax,[ebp-4]
 004748A8    call        @LStrFromString
 004748AD    mov         eax,dword ptr [ebp-4]
 004748B0    mov         edx,esi
 004748B2    call        @LStrCmp
>004748B7    je          004748E5
 004748B9    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 004748BC    call        TObject.Free
 004748C1    mov         eax,esi
 004748C3    call        0047294C
 004748C8    mov         ecx,ebx
 004748CA    mov         dl,1
 004748CC    call        dword ptr [eax+0C]
 004748CF    mov         edi,eax
 004748D1    mov         dword ptr [ebx+24],edi;TGLTexture.Image:TGLTextureImage
 004748D4    mov         dword ptr [edi+24],ebx
 004748D7    mov         dword ptr [edi+20],475B00;sub_00475B00
 004748DE    mov         eax,ebx
 004748E0    call        004747C4
 004748E5    xor         eax,eax
 004748E7    pop         edx
 004748E8    pop         ecx
 004748E9    pop         ecx
 004748EA    mov         dword ptr fs:[eax],edx
 004748ED    push        474902
 004748F2    lea         eax,[ebp-4]
 004748F5    call        @LStrClr
 004748FA    ret
>004748FB    jmp         @HandleFinally
>00474900    jmp         004748F2
 00474902    pop         edi
 00474903    pop         esi
 00474904    pop         ebx
 00474905    mov         esp,ebp
 00474907    pop         ebp
 00474908    ret
*}
end;

//0047490C
{*procedure TGLTexture.GetImageClassName(?:?);
begin
 0047490C    push        ebx
 0047490D    push        esi
 0047490E    add         esp,0FFFFFF00
 00474914    mov         esi,edx
 00474916    mov         ebx,eax
 00474918    mov         edx,esp
 0047491A    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 0047491D    mov         eax,dword ptr [eax]
 0047491F    call        TObject.ClassName
 00474924    mov         edx,esp
 00474926    mov         eax,esi
 00474928    call        @LStrFromString
 0047492D    add         esp,100
 00474933    pop         esi
 00474934    pop         ebx
 00474935    ret
end;*}

//00474938
procedure TGLTexture.SetImageAlpha(Value:TGLTextureImageAlpha);
begin
{*
 00474938    cmp         dl,byte ptr [eax+28];TGLTexture.ImageAlpha:TGLTextureImageAlpha
>0047493B    je          00474945
 0047493D    mov         byte ptr [eax+28],dl;TGLTexture.ImageAlpha:TGLTextureImageAlpha
 00474940    call        004747C4
 00474945    ret
*}
end;

//00474948
{*procedure TGLTexture.SetImageBrightness(Value:Single; ?:?);
begin
 00474948    push        ebp
 00474949    mov         ebp,esp
 0047494B    mov         edx,eax
 0047494D    fld         dword ptr [edx+2C];TGLTexture.ImageBrightness:Single
 00474950    fcomp       dword ptr [ebp+8]
 00474953    fnstsw      al
 00474955    sahf
>00474956    je          00474965
 00474958    mov         eax,dword ptr [ebp+8]
 0047495B    mov         dword ptr [edx+2C],eax;TGLTexture.ImageBrightness:Single
 0047495E    mov         eax,edx
 00474960    call        004747C4
 00474965    pop         ebp
 00474966    ret         4
end;*}

//0047496C
function TGLTexture.IsStoredImageBrightness(Value:Single):Boolean;
begin
{*
 0047496C    mov         edx,eax
 0047496E    fld         dword ptr [edx+2C];TGLTexture.ImageBrightness:Single
 00474971    fcomp       dword ptr ds:[474980];1:Single
 00474977    fnstsw      al
 00474979    sahf
 0047497A    setne       al
 0047497D    ret
*}
end;

//00474984
{*procedure TGLTexture.SetImageGamma(Value:Single; ?:?);
begin
 00474984    push        ebp
 00474985    mov         ebp,esp
 00474987    mov         edx,eax
 00474989    fld         dword ptr [edx+30];TGLTexture.ImageGamma:Single
 0047498C    fcomp       dword ptr [ebp+8]
 0047498F    fnstsw      al
 00474991    sahf
>00474992    je          004749A1
 00474994    mov         eax,dword ptr [ebp+8]
 00474997    mov         dword ptr [edx+30],eax;TGLTexture.ImageGamma:Single
 0047499A    mov         eax,edx
 0047499C    call        004747C4
 004749A1    pop         ebp
 004749A2    ret         4
end;*}

//004749A8
function TGLTexture.IsStoredImageGamma(Value:Single):Boolean;
begin
{*
 004749A8    mov         edx,eax
 004749AA    fld         dword ptr [edx+30];TGLTexture.ImageGamma:Single
 004749AD    fcomp       dword ptr ds:[4749BC];1:Single
 004749B3    fnstsw      al
 004749B5    sahf
 004749B6    setne       al
 004749B9    ret
*}
end;

//004749C0
procedure TGLTexture.SetMagFilter(Value:TGLMagFilter);
begin
{*
 004749C0    cmp         dl,byte ptr [eax+20];TGLTexture.MagFilter:TGLMagFilter
>004749C3    je          004749CD
 004749C5    mov         byte ptr [eax+20],dl;TGLTexture.MagFilter:TGLMagFilter
 004749C8    call        004747D8
 004749CD    ret
*}
end;

//004749D0
procedure TGLTexture.SetMinFilter(Value:TGLMinFilter);
begin
{*
 004749D0    cmp         dl,byte ptr [eax+1F];TGLTexture.MinFilter:TGLMinFilter
>004749D3    je          004749DD
 004749D5    mov         byte ptr [eax+1F],dl;TGLTexture.MinFilter:TGLMinFilter
 004749D8    call        004747D8
 004749DD    ret
*}
end;

//004749E0
procedure TGLTexture.SetTextureMode(Value:TGLTextureMode);
begin
{*
 004749E0    cmp         dl,byte ptr [eax+1C];TGLTexture.TextureMode:TGLTextureMode
>004749E3    je          004749ED
 004749E5    mov         byte ptr [eax+1C],dl;TGLTexture.TextureMode:TGLTextureMode
 004749E8    call        004747D8
 004749ED    ret
*}
end;

//004749F0
procedure TGLTexture.SetDisabled(Value:Boolean);
begin
{*
 004749F0    push        ebx
 004749F1    push        esi
 004749F2    mov         ebx,eax
 004749F4    cmp         dl,byte ptr [ebx+22];TGLTexture.Disabled:Boolean
>004749F7    je          00474A6C
 004749F9    mov         byte ptr [ebx+22],dl;TGLTexture.Disabled:Boolean
 004749FC    cmp         dword ptr [ebx+4],0;TGLTexture.?f4:dword
>00474A00    jne         00474A27
 00474A02    mov         esi,dword ptr [ebx+4];TGLTexture.?f4:dword
 00474A05    mov         eax,esi
 00474A07    mov         edx,dword ptr ds:[4720C4];TGLMaterial
 00474A0D    call        @IsClass
 00474A12    test        al,al
>00474A14    jne         00474A27
 00474A16    mov         eax,esi
 00474A18    mov         edx,dword ptr ds:[471BC4];TGLTextureExItem
 00474A1E    call        @IsClass
 00474A23    test        al,al
>00474A25    je          00474A63
 00474A27    mov         esi,dword ptr [ebx+4];TGLTexture.?f4:dword
 00474A2A    mov         eax,esi
 00474A2C    mov         edx,dword ptr ds:[4720C4];TGLMaterial
 00474A32    call        @IsClass
 00474A37    test        al,al
>00474A39    je          00474A44
 00474A3B    mov         edx,ebx
 00474A3D    mov         eax,esi
 00474A3F    call        00476910
 00474A44    mov         esi,dword ptr [ebx+4];TGLTexture.?f4:dword
 00474A47    mov         eax,esi
 00474A49    mov         edx,dword ptr ds:[471BC4];TGLTextureExItem
 00474A4F    call        @IsClass
 00474A54    test        al,al
>00474A56    je          00474A6C
 00474A58    mov         edx,ebx
 00474A5A    mov         eax,esi
 00474A5C    call        00475DE4
>00474A61    jmp         00474A6C
 00474A63    mov         edx,ebx
 00474A65    mov         eax,ebx
 00474A67    mov         ecx,dword ptr [eax]
 00474A69    call        dword ptr [ecx+10];TGLTexture.sub_0047478C
 00474A6C    pop         esi
 00474A6D    pop         ebx
 00474A6E    ret
*}
end;

//00474A70
{*procedure sub_00474A70(?:?; ?:?);
begin
 00474A70    xor         dl,1
 00474A73    call        TGLTexture.SetDisabled
 00474A78    ret
end;*}

//00474A7C
{*function sub_00474A7C(?:?):?;
begin
 00474A7C    mov         al,byte ptr [eax+22]
 00474A7F    xor         al,1
 00474A81    ret
end;*}

//00474A84
procedure TGLTexture.SetEnvColor(Value:TGLColor);
begin
{*
 00474A84    push        ebx
 00474A85    mov         ebx,eax
 00474A87    mov         eax,dword ptr [ebx+5C];TGLTexture.EnvColor:TGLColor
 00474A8A    mov         ecx,dword ptr [eax]
 00474A8C    call        dword ptr [ecx+8];TGLColor.Assign
 00474A8F    mov         eax,ebx
 00474A91    call        004747D8
 00474A96    pop         ebx
 00474A97    ret
*}
end;

//00474A98
{*procedure TGLTexture.SetNormalMapScale(Value:Single; ?:?);
begin
 00474A98    push        ebp
 00474A99    mov         ebp,esp
 00474A9B    mov         edx,eax
 00474A9D    fld         dword ptr [ebp+8]
 00474AA0    fcomp       dword ptr [edx+60];TGLTexture.NormalMapScale:Single
 00474AA3    fnstsw      al
 00474AA5    sahf
>00474AA6    je          00474ABB
 00474AA8    mov         eax,dword ptr [ebp+8]
 00474AAB    mov         dword ptr [edx+60],eax;TGLTexture.NormalMapScale:Single
 00474AAE    cmp         byte ptr [edx+1E],9;TGLTexture.TextureFormat:TGLTextureFormat
>00474AB2    jne         00474ABB
 00474AB4    mov         eax,edx
 00474AB6    call        004747C4
 00474ABB    pop         ebp
 00474ABC    ret         4
end;*}

//00474AC0
function TGLTexture.IsStoredNormalMapScale(Value:Single):Boolean;
begin
{*
 00474AC0    mov         edx,eax
 00474AC2    fld         dword ptr [edx+60];TGLTexture.NormalMapScale:Single
 00474AC5    fcomp       dword ptr ds:[474AD4];0.125:Single
 00474ACB    fnstsw      al
 00474ACD    sahf
 00474ACE    setne       al
 00474AD1    ret
*}
end;

//00474AD8
procedure TGLTexture.SetTextureWrap(Value:TGLTextureWrap);
begin
{*
 00474AD8    cmp         dl,byte ptr [eax+1D];TGLTexture.TextureWrap:TGLTextureWrap
>00474ADB    je          00474AE5
 00474ADD    mov         byte ptr [eax+1D],dl;TGLTexture.TextureWrap:TGLTextureWrap
 00474AE0    call        004747D8
 00474AE5    ret
*}
end;

//00474AE8
procedure TGLTexture.SetTextureFormat(Value:TGLTextureFormat);
begin
{*
 00474AE8    cmp         dl,byte ptr [eax+1E];TGLTexture.TextureFormat:TGLTextureFormat
>00474AEB    je          00474AF5
 00474AED    mov         byte ptr [eax+1E],dl;TGLTexture.TextureFormat:TGLTextureFormat
 00474AF0    call        004747D8
 00474AF5    ret
*}
end;

//00474AF8
procedure TGLTexture.SetCompression(Value:TGLTextureCompression);
begin
{*
 00474AF8    cmp         dl,byte ptr [eax+48];TGLTexture.Compression:TGLTextureCompression
>00474AFB    je          00474B05
 00474AFD    mov         byte ptr [eax+48],dl;TGLTexture.Compression:TGLTextureCompression
 00474B00    call        004747D8
 00474B05    ret
*}
end;

//00474B08
procedure TGLTexture.SetFilteringQuality(Value:TGLTextureFilteringQuality);
begin
{*
 00474B08    cmp         dl,byte ptr [eax+50];TGLTexture.FilteringQuality:TGLTextureFilteringQuality
>00474B0B    je          00474B15
 00474B0D    mov         byte ptr [eax+50],dl;TGLTexture.FilteringQuality:TGLTextureFilteringQuality
 00474B10    call        004747D8
 00474B15    ret
*}
end;

//00474B18
procedure TGLTexture.SetMappingMode(Value:TGLTextureMappingMode);
begin
{*
 00474B18    push        ebx
 00474B19    push        esi
 00474B1A    mov         ebx,eax
 00474B1C    cmp         dl,byte ptr [ebx+34];TGLTexture.MappingMode:TGLTextureMappingMode
>00474B1F    je          00474B6E
 00474B21    test        dl,dl
>00474B23    jne         00474B2B
 00474B25    cmp         byte ptr [ebx+34],0;TGLTexture.MappingMode:TGLTextureMappingMode
>00474B29    jne         00474B39
 00474B2B    test        dl,dl
>00474B2D    jne         00474B35
 00474B2F    cmp         byte ptr [ebx+34],0;TGLTexture.MappingMode:TGLTextureMappingMode
>00474B33    jne         00474B39
 00474B35    xor         eax,eax
>00474B37    jmp         00474B3B
 00474B39    mov         al,1
 00474B3B    mov         byte ptr [ebx+34],dl;TGLTexture.MappingMode:TGLTextureMappingMode
 00474B3E    test        al,al
>00474B40    je          00474B65
 00474B42    mov         esi,dword ptr [ebx+4];TGLTexture.?f4:dword
 00474B45    test        esi,esi
>00474B47    je          00474B6E
 00474B49    mov         eax,esi
 00474B4B    mov         edx,dword ptr ds:[4720C4];TGLMaterial
 00474B51    call        @IsClass
 00474B56    test        al,al
>00474B58    je          00474B6E
 00474B5A    mov         edx,ebx
 00474B5C    mov         eax,esi
 00474B5E    call        00476910
>00474B63    jmp         00474B6E
 00474B65    mov         edx,ebx
 00474B67    mov         eax,ebx
 00474B69    mov         ecx,dword ptr [eax]
 00474B6B    call        dword ptr [ecx+10];TGLTexture.sub_0047478C
 00474B6E    pop         esi
 00474B6F    pop         ebx
 00474B70    ret
*}
end;

//00474B74
procedure TGLTexture.SetMappingSCoordinates(Value:TGLCoordinates4);
begin
{*
 00474B74    push        ebx
 00474B75    push        esi
 00474B76    mov         esi,edx
 00474B78    mov         ebx,eax
 00474B7A    mov         eax,ebx
 00474B7C    call        TGLTexture.GetMappingSCoordinates
 00474B81    mov         edx,esi
 00474B83    mov         ecx,dword ptr [eax]
 00474B85    call        dword ptr [ecx+8]
 00474B88    pop         esi
 00474B89    pop         ebx
 00474B8A    ret
*}
end;

//00474B8C
{*function TGLTexture.GetMappingSCoordinates:?;
begin
 00474B8C    push        ebx
 00474B8D    mov         ebx,eax
 00474B8F    cmp         dword ptr [ebx+38],0;TGLTexture.?f38:TGLCoordinates4
>00474B93    jne         00474BAE
 00474B95    mov         eax,[005AE3CC];^gvar_005ACF24
 00474B9A    push        eax
 00474B9B    push        1
 00474B9D    mov         ecx,ebx
 00474B9F    mov         dl,1
 00474BA1    mov         eax,[0046B068];TGLCoordinates4
 00474BA6    call        TGLCoordinates.Create;TGLCoordinates4.Create
 00474BAB    mov         dword ptr [ebx+38],eax;TGLTexture.?f38:TGLCoordinates4
 00474BAE    mov         eax,dword ptr [ebx+38];TGLTexture.?f38:TGLCoordinates4
 00474BB1    pop         ebx
 00474BB2    ret
end;*}

//00474BB4
procedure TGLTexture.SetMappingTCoordinates(Value:TGLCoordinates4);
begin
{*
 00474BB4    push        ebx
 00474BB5    push        esi
 00474BB6    mov         esi,edx
 00474BB8    mov         ebx,eax
 00474BBA    mov         eax,ebx
 00474BBC    call        TGLTexture.GetMappingTCoordinates
 00474BC1    mov         edx,esi
 00474BC3    mov         ecx,dword ptr [eax]
 00474BC5    call        dword ptr [ecx+8]
 00474BC8    pop         esi
 00474BC9    pop         ebx
 00474BCA    ret
*}
end;

//00474BCC
{*function TGLTexture.GetMappingTCoordinates:?;
begin
 00474BCC    push        ebx
 00474BCD    mov         ebx,eax
 00474BCF    cmp         dword ptr [ebx+3C],0;TGLTexture.?f3C:TGLCoordinates4
>00474BD3    jne         00474BEE
 00474BD5    mov         eax,[005AE3CC];^gvar_005ACF24
 00474BDA    push        eax
 00474BDB    push        1
 00474BDD    mov         ecx,ebx
 00474BDF    mov         dl,1
 00474BE1    mov         eax,[0046B068];TGLCoordinates4
 00474BE6    call        TGLCoordinates.Create;TGLCoordinates4.Create
 00474BEB    mov         dword ptr [ebx+3C],eax;TGLTexture.?f3C:TGLCoordinates4
 00474BEE    mov         eax,dword ptr [ebx+3C];TGLTexture.?f3C:TGLCoordinates4
 00474BF1    pop         ebx
 00474BF2    ret
end;*}

//00474BF4
procedure TGLTexture.IsStoredImageClassName(Value:String);
begin
{*
 00474BF4    push        ebx
 00474BF5    add         esp,0FFFFFE00
 00474BFB    mov         ebx,eax
 00474BFD    mov         edx,esp
 00474BFF    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 00474C02    mov         eax,dword ptr [eax]
 00474C04    call        TObject.ClassName
 00474C09    mov         eax,esp
 00474C0B    push        eax
 00474C0C    lea         edx,[esp+104]
 00474C13    mov         eax,[004710BC];TGLPersistentImage
 00474C18    call        TObject.ClassName
 00474C1D    lea         edx,[esp+104]
 00474C24    pop         eax
 00474C25    xor         ecx,ecx
 00474C27    mov         cl,byte ptr [eax]
 00474C29    inc         ecx
 00474C2A    call        @AStrCmp
 00474C2F    setne       al
 00474C32    add         esp,200
 00474C38    pop         ebx
 00474C39    ret
*}
end;

//00474C3C
{*procedure sub_00474C3C(?:?);
begin
 00474C3C    mov         edx,dword ptr [eax]
 00474C3E    call        dword ptr [edx+14]
 00474C41    ret
end;*}

//00474C44
{*procedure sub_00474C44(?:?);
begin
 00474C44    push        ebx
 00474C45    mov         ebx,eax
 00474C47    xor         eax,eax
 00474C49    mov         al,byte ptr [ebx+34]
 00474C4C    cmp         eax,7
>00474C4F    ja          00474E70
 00474C55    jmp         dword ptr [eax*4+474C5C]
 00474C55    dd          00474E84
 00474C55    dd          00474C7E
 00474C55    dd          00474CF0
 00474C55    dd          00474D62
 00474C55    dd          00474DA0
 00474C55    dd          00474E0A
 00474C55    dd          00474E0A
 00474C55    dd          00474DA0
 00474C7C    pop         ebx
 00474C7D    ret
 00474C7E    push        2401
 00474C83    push        2500
 00474C88    push        2000
 00474C8D    call        OpenGL32.glTexGeni
 00474C92    push        2401
 00474C97    push        2500
 00474C9C    push        2001
 00474CA1    call        OpenGL32.glTexGeni
 00474CA6    mov         eax,ebx
 00474CA8    call        TGLTexture.GetMappingSCoordinates
 00474CAD    add         eax,18
 00474CB0    push        eax
 00474CB1    push        2501
 00474CB6    push        2000
 00474CBB    call        OpenGL32.glTexGenfv
 00474CC0    mov         eax,ebx
 00474CC2    call        TGLTexture.GetMappingTCoordinates
 00474CC7    add         eax,18
 00474CCA    push        eax
 00474CCB    push        2501
 00474CD0    push        2001
 00474CD5    call        OpenGL32.glTexGenfv
 00474CDA    push        0C60
 00474CDF    call        OpenGL32.glEnable
 00474CE4    push        0C61
 00474CE9    call        OpenGL32.glEnable
 00474CEE    pop         ebx
 00474CEF    ret
 00474CF0    push        2400
 00474CF5    push        2500
 00474CFA    push        2000
 00474CFF    call        OpenGL32.glTexGeni
 00474D04    push        2400
 00474D09    push        2500
 00474D0E    push        2001
 00474D13    call        OpenGL32.glTexGeni
 00474D18    mov         eax,ebx
 00474D1A    call        TGLTexture.GetMappingSCoordinates
 00474D1F    add         eax,18
 00474D22    push        eax
 00474D23    push        2502
 00474D28    push        2000
 00474D2D    call        OpenGL32.glTexGenfv
 00474D32    mov         eax,ebx
 00474D34    call        TGLTexture.GetMappingTCoordinates
 00474D39    add         eax,18
 00474D3C    push        eax
 00474D3D    push        2502
 00474D42    push        2001
 00474D47    call        OpenGL32.glTexGenfv
 00474D4C    push        0C60
 00474D51    call        OpenGL32.glEnable
 00474D56    push        0C61
 00474D5B    call        OpenGL32.glEnable
 00474D60    pop         ebx
 00474D61    ret
 00474D62    push        2402
 00474D67    push        2500
 00474D6C    push        2000
 00474D71    call        OpenGL32.glTexGeni
 00474D76    push        2402
 00474D7B    push        2500
 00474D80    push        2001
 00474D85    call        OpenGL32.glTexGeni
 00474D8A    push        0C60
 00474D8F    call        OpenGL32.glEnable
 00474D94    push        0C61
 00474D99    call        OpenGL32.glEnable
 00474D9E    pop         ebx
 00474D9F    ret
 00474DA0    mov         eax,[005AE74C];^gvar_005E0CE7
 00474DA5    cmp         byte ptr [eax],0
>00474DA8    je          00474E84
 00474DAE    push        8512
 00474DB3    push        2500
 00474DB8    push        2000
 00474DBD    call        OpenGL32.glTexGeni
 00474DC2    push        8512
 00474DC7    push        2500
 00474DCC    push        2001
 00474DD1    call        OpenGL32.glTexGeni
 00474DD6    push        8512
 00474DDB    push        2500
 00474DE0    push        2002
 00474DE5    call        OpenGL32.glTexGeni
 00474DEA    push        0C60
 00474DEF    call        OpenGL32.glEnable
 00474DF4    push        0C61
 00474DF9    call        OpenGL32.glEnable
 00474DFE    push        0C62
 00474E03    call        OpenGL32.glEnable
 00474E08    pop         ebx
 00474E09    ret
 00474E0A    mov         eax,[005AE74C];^gvar_005E0CE7
 00474E0F    cmp         byte ptr [eax],0
>00474E12    je          00474E84
 00474E14    push        8511
 00474E19    push        2500
 00474E1E    push        2000
 00474E23    call        OpenGL32.glTexGeni
 00474E28    push        8511
 00474E2D    push        2500
 00474E32    push        2001
 00474E37    call        OpenGL32.glTexGeni
 00474E3C    push        8511
 00474E41    push        2500
 00474E46    push        2002
 00474E4B    call        OpenGL32.glTexGeni
 00474E50    push        0C60
 00474E55    call        OpenGL32.glEnable
 00474E5A    push        0C61
 00474E5F    call        OpenGL32.glEnable
 00474E64    push        0C62
 00474E69    call        OpenGL32.glEnable
 00474E6E    pop         ebx
 00474E6F    ret
 00474E70    mov         ecx,0DF3
 00474E75    mov         edx,474E90;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00474E7A    mov         eax,474ECC;'Assertion failure'
 00474E7F    call        @Assert
 00474E84    pop         ebx
 00474E85    ret
end;*}

//00474EE0
{*procedure sub_00474EE0(?:?);
begin
 00474EE0    cmp         byte ptr [eax+34],0
>00474EE4    je          00474F04
 00474EE6    push        0C60
 00474EEB    call        OpenGL32.glDisable
 00474EF0    push        0C61
 00474EF5    call        OpenGL32.glDisable
 00474EFA    push        0C62
 00474EFF    call        OpenGL32.glDisable
 00474F04    ret
end;*}

//00474F08
{*procedure sub_00474F08(?:?; ?:?);
begin
 00474F08    push        ebx
 00474F09    push        esi
 00474F0A    push        edi
 00474F0B    add         esp,0FFFFFFB0
 00474F0E    mov         esi,edx
 00474F10    mov         ebx,eax
 00474F12    cmp         byte ptr [ebx+22],0
>00474F16    jne         0047516D
 00474F1C    mov         eax,dword ptr [ebx+24]
 00474F1F    mov         eax,dword ptr [eax]
 00474F21    call        dword ptr [eax+24]
 00474F24    cmp         eax,0DE1
>00474F29    jne         00474F51
 00474F2B    mov         eax,dword ptr [esi+5C]
 00474F2E    mov         dl,13
 00474F30    call        0046D5F8
 00474F35    mov         eax,ebx
 00474F37    mov         edx,dword ptr [eax]
 00474F39    call        dword ptr [edx+14]
 00474F3C    push        eax
 00474F3D    mov         eax,dword ptr [esi+5C]
 00474F40    mov         ecx,0DE1
 00474F45    xor         edx,edx
 00474F47    call        0046D8B8
>00474F4C    jmp         0047512B
 00474F51    mov         eax,dword ptr [ebx+24]
 00474F54    mov         eax,dword ptr [eax]
 00474F56    call        dword ptr [eax+24]
 00474F59    cmp         eax,84F5
>00474F5E    jne         00474F86
 00474F60    mov         eax,dword ptr [esi+5C]
 00474F63    mov         dl,15
 00474F65    call        0046D5F8
 00474F6A    mov         eax,ebx
 00474F6C    mov         edx,dword ptr [eax]
 00474F6E    call        dword ptr [edx+14]
 00474F71    push        eax
 00474F72    mov         eax,dword ptr [esi+5C]
 00474F75    mov         ecx,84F5
 00474F7A    xor         edx,edx
 00474F7C    call        0046D8B8
>00474F81    jmp         0047512B
 00474F86    mov         eax,[005AE74C];^gvar_005E0CE7
 00474F8B    cmp         byte ptr [eax],0
>00474F8E    je          0047512B
 00474F94    mov         eax,dword ptr [esi+5C]
 00474F97    mov         dl,14
 00474F99    call        0046D5F8
 00474F9E    mov         eax,ebx
 00474FA0    mov         edx,dword ptr [eax]
 00474FA2    call        dword ptr [edx+14]
 00474FA5    push        eax
 00474FA6    mov         eax,dword ptr [esi+5C]
 00474FA9    mov         ecx,8513
 00474FAE    xor         edx,edx
 00474FB0    call        0046D8B8
 00474FB5    push        1702
 00474FBA    call        OpenGL32.glMatrixMode
 00474FBF    mov         al,byte ptr [ebx+34]
 00474FC2    add         al,0FC
 00474FC4    sub         al,2
>00474FC6    jb          00474FD7
>00474FC8    je          00475017
 00474FCA    dec         al
>00474FCC    je          00475087
>00474FD2    jmp         00475121
 00474FD7    mov         eax,dword ptr [esi+38]
 00474FDA    mov         esi,eax
 00474FDC    mov         edi,esp
 00474FDE    mov         ecx,10
 00474FE3    rep movs    dword ptr [edi],dword ptr [esi]
 00474FE5    mov         eax,esp
 00474FE7    call        0045E620
 00474FEC    mov         eax,[005AE790];^gvar_005E0CE8
 00474FF1    cmp         byte ptr [eax],0
>00474FF4    je          00475005
 00474FF6    push        esp
 00474FF7    mov         eax,[005AE7A4];^gvar_005E0F10
 00474FFC    mov         eax,dword ptr [eax]
 00474FFE    call        eax
>00475000    jmp         00475121
 00475005    mov         eax,esp
 00475007    call        0045E680
 0047500C    push        esp
 0047500D    call        OpenGL32.glLoadMatrixf
>00475012    jmp         00475121
 00475017    mov         eax,dword ptr [esi]
 00475019    mov         edi,dword ptr [eax+40]
 0047501C    cmp         dword ptr [edi+0C],0
>00475020    jle         00475121
 00475026    xor         edx,edx
 00475028    mov         eax,edi
 0047502A    call        00466EF0
 0047502F    mov         edx,esp
 00475031    call        0047BBC0
 00475036    mov         eax,esp
 00475038    call        0045E620
 0047503D    mov         eax,[005AE790];^gvar_005E0CE8
 00475042    cmp         byte ptr [eax],0
>00475045    je          00475053
 00475047    push        esp
 00475048    mov         eax,[005AE7A4];^gvar_005E0F10
 0047504D    mov         eax,dword ptr [eax]
 0047504F    call        eax
>00475051    jmp         00475060
 00475053    mov         eax,esp
 00475055    call        0045E680
 0047505A    push        esp
 0047505B    call        OpenGL32.glLoadMatrixf
 00475060    mov         eax,dword ptr [esi+38]
 00475063    mov         esi,eax
 00475065    mov         edi,esp
 00475067    mov         ecx,10
 0047506C    rep movs    dword ptr [edi],dword ptr [esi]
 0047506E    mov         eax,esp
 00475070    call        0045E620
 00475075    mov         eax,esp
 00475077    call        0045E680
 0047507C    push        esp
 0047507D    call        OpenGL32.glMultMatrixf
>00475082    jmp         00475121
 00475087    lea         ecx,[esp+40]
 0047508B    lea         edx,[esi+18]
 0047508E    lea         eax,[esi+28]
 00475091    call        0045CEDC
 00475096    push        esi
 00475097    lea         esi,[esp+44]
 0047509B    lea         edi,[esp+4]
 0047509F    movs        dword ptr [edi],dword ptr [esi]
 004750A0    movs        dword ptr [edi],dword ptr [esi]
 004750A1    movs        dword ptr [edi],dword ptr [esi]
 004750A2    movs        dword ptr [edi],dword ptr [esi]
 004750A3    pop         esi
 004750A4    lea         edx,[esp+40]
 004750A8    lea         eax,[esi+18]
 004750AB    call        0045D714
 004750B0    push        esi
 004750B1    lea         esi,[esp+44]
 004750B5    lea         edi,[esp+14]
 004750B9    movs        dword ptr [edi],dword ptr [esi]
 004750BA    movs        dword ptr [edi],dword ptr [esi]
 004750BB    movs        dword ptr [edi],dword ptr [esi]
 004750BC    movs        dword ptr [edi],dword ptr [esi]
 004750BD    pop         esi
 004750BE    push        esi
 004750BF    add         esi,28
 004750C2    lea         edi,[esp+24]
 004750C6    movs        dword ptr [edi],dword ptr [esi]
 004750C7    movs        dword ptr [edi],dword ptr [esi]
 004750C8    movs        dword ptr [edi],dword ptr [esi]
 004750C9    movs        dword ptr [edi],dword ptr [esi]
 004750CA    pop         esi
 004750CB    mov         eax,[005AE57C];^gvar_005ACF94
 004750D0    push        esi
 004750D1    mov         esi,eax
 004750D3    lea         edi,[esp+34]
 004750D7    movs        dword ptr [edi],dword ptr [esi]
 004750D8    movs        dword ptr [edi],dword ptr [esi]
 004750D9    movs        dword ptr [edi],dword ptr [esi]
 004750DA    movs        dword ptr [edi],dword ptr [esi]
 004750DB    pop         esi
 004750DC    mov         eax,[005AE790];^gvar_005E0CE8
 004750E1    cmp         byte ptr [eax],0
>004750E4    je          004750F2
 004750E6    push        esp
 004750E7    mov         eax,[005AE7A4];^gvar_005E0F10
 004750EC    mov         eax,dword ptr [eax]
 004750EE    call        eax
>004750F0    jmp         004750FF
 004750F2    mov         eax,esp
 004750F4    call        0045E680
 004750F9    push        esp
 004750FA    call        OpenGL32.glLoadMatrixf
 004750FF    mov         eax,dword ptr [esi+38]
 00475102    mov         esi,eax
 00475104    mov         edi,esp
 00475106    mov         ecx,10
 0047510B    rep movs    dword ptr [edi],dword ptr [esi]
 0047510D    mov         eax,esp
 0047510F    call        0045E620
 00475114    mov         eax,esp
 00475116    call        0045E680
 0047511B    push        esp
 0047511C    call        OpenGL32.glMultMatrixf
 00475121    push        1700
 00475126    call        OpenGL32.glMatrixMode
 0047512B    xor         eax,eax
 0047512D    mov         al,byte ptr [ebx+1C]
 00475130    mov         eax,dword ptr [eax*4+5AD474]
 00475137    push        eax
 00475138    push        2200
 0047513D    push        2300
 00475142    call        OpenGL32.glTexEnvi
 00475147    mov         eax,dword ptr [ebx+5C]
 0047514A    call        00472C80
 0047514F    push        eax
 00475150    push        2201
 00475155    push        2300
 0047515A    call        OpenGL32.glTexEnvfv
 0047515F    mov         eax,ebx
 00475161    call        00474C44
 00475166    call        0046A47C
>0047516B    jmp         00475186
 0047516D    mov         eax,dword ptr [esi+5C]
 00475170    mov         dl,13
 00475172    call        0046D634
 00475177    mov         eax,dword ptr [esi+5C]
 0047517A    mov         dl,15
 0047517C    call        0046D634
 00475181    call        0046A47C
 00475186    add         esp,50
 00475189    pop         edi
 0047518A    pop         esi
 0047518B    pop         ebx
 0047518C    ret
end;*}

//00475190
{*procedure sub_00475190(?:?; ?:?);
begin
 00475190    push        ebx
 00475191    push        esi
 00475192    mov         ebx,eax
 00475194    cmp         byte ptr [ebx+22],0
>00475198    jne         004751F1
 0047519A    mov         esi,dword ptr [edx+5C]
 0047519D    test        byte ptr [esi+8E],10
>004751A4    je          004751CA
 004751A6    mov         eax,esi
 004751A8    mov         dl,14
 004751AA    call        0046D634
 004751AF    push        1702
 004751B4    call        OpenGL32.glMatrixMode
 004751B9    call        OpenGL32.glLoadIdentity
 004751BE    push        1700
 004751C3    call        OpenGL32.glMatrixMode
>004751C8    jmp         004751EA
 004751CA    mov         eax,dword ptr [edx+5C]
 004751CD    test        byte ptr [eax+8E],8
>004751D4    je          004751E1
 004751D6    mov         eax,esi
 004751D8    mov         dl,13
 004751DA    call        0046D634
>004751DF    jmp         004751EA
 004751E1    mov         eax,esi
 004751E3    mov         dl,15
 004751E5    call        0046D634
 004751EA    mov         eax,ebx
 004751EC    call        00474EE0
 004751F1    pop         esi
 004751F2    pop         ebx
 004751F3    ret
end;*}

//004751F4
{*function sub_004751F4(?:?; ?:?):?;
begin
 004751F4    push        ecx
 004751F5    mov         ecx,edx
 004751F7    mov         edx,2
 004751FC    call        00475214
 00475201    ret
end;*}

//00475204
{*function sub_00475204(?:?; ?:?):?;
begin
 00475204    push        ecx
 00475205    mov         ecx,edx
 00475207    mov         edx,2
 0047520C    call        00475394
 00475211    ret
end;*}

//00475214
{*procedure sub_00475214(?:?; ?:?; ?:?; ?:?);
begin
 00475214    push        ebp
 00475215    mov         ebp,esp
 00475217    add         esp,0FFFFFFC0
 0047521A    push        ebx
 0047521B    push        esi
 0047521C    push        edi
 0047521D    mov         edi,ecx
 0047521F    mov         esi,edx
 00475221    mov         ebx,eax
 00475223    cmp         byte ptr [ebx+22],0
>00475227    jne         0047538B
 0047522D    lea         eax,[esi+84C0]
 00475233    dec         eax
 00475234    push        eax
 00475235    mov         eax,[005AE62C];^gvar_005E0E88
 0047523A    mov         eax,dword ptr [eax]
 0047523C    call        eax
 0047523E    mov         eax,dword ptr [ebx+24]
 00475241    mov         eax,dword ptr [eax]
 00475243    call        dword ptr [eax+24]
 00475246    cmp         eax,0DE1
>0047524B    jne         004752B4
 0047524D    mov         eax,dword ptr [ebx+24]
 00475250    mov         eax,dword ptr [eax]
 00475252    call        dword ptr [eax+24]
 00475255    push        eax
 00475256    call        OpenGL32.glEnable
 0047525B    mov         eax,ebx
 0047525D    mov         edx,dword ptr [eax]
 0047525F    call        dword ptr [edx+14]
 00475262    push        eax
 00475263    mov         eax,dword ptr [ebx+24]
 00475266    mov         eax,dword ptr [eax]
 00475268    call        dword ptr [eax+24]
 0047526B    mov         ecx,eax
 0047526D    mov         edx,esi
 0047526F    dec         edx
 00475270    mov         eax,dword ptr [edi+5C]
 00475273    call        0046D8B8
 00475278    cmp         dword ptr [ebp+8],0
>0047527C    je          00475342
 00475282    mov         eax,dword ptr [ebp+8]
 00475285    cmp         byte ptr [eax+24],0
>00475289    jne         00475342
 0047528F    push        1702
 00475294    call        OpenGL32.glMatrixMode
 00475299    mov         eax,dword ptr [ebp+8]
 0047529C    add         eax,28
 0047529F    push        eax
 004752A0    call        OpenGL32.glLoadMatrixf
 004752A5    push        1700
 004752AA    call        OpenGL32.glMatrixMode
>004752AF    jmp         00475342
 004752B4    mov         eax,[005AE74C];^gvar_005E0CE7
 004752B9    cmp         byte ptr [eax],0
>004752BC    je          00475342
 004752C2    mov         eax,dword ptr [ebx+24]
 004752C5    mov         eax,dword ptr [eax]
 004752C7    call        dword ptr [eax+24]
 004752CA    push        eax
 004752CB    call        OpenGL32.glEnable
 004752D0    mov         eax,ebx
 004752D2    mov         edx,dword ptr [eax]
 004752D4    call        dword ptr [edx+14]
 004752D7    push        eax
 004752D8    mov         eax,dword ptr [ebx+24]
 004752DB    mov         eax,dword ptr [eax]
 004752DD    call        dword ptr [eax+24]
 004752E0    mov         ecx,eax
 004752E2    mov         edx,esi
 004752E4    dec         edx
 004752E5    mov         eax,dword ptr [edi+5C]
 004752E8    call        0046D8B8
 004752ED    push        1702
 004752F2    call        OpenGL32.glMatrixMode
 004752F7    mov         eax,dword ptr [edi+38]
 004752FA    mov         esi,eax
 004752FC    lea         edi,[ebp-40]
 004752FF    mov         ecx,10
 00475304    rep movs    dword ptr [edi],dword ptr [esi]
 00475306    lea         eax,[ebp-40]
 00475309    call        0045E620
 0047530E    mov         eax,[005AE790];^gvar_005E0CE8
 00475313    cmp         byte ptr [eax],0
>00475316    je          00475327
 00475318    lea         eax,[ebp-40]
 0047531B    push        eax
 0047531C    mov         eax,[005AE7A4];^gvar_005E0F10
 00475321    mov         eax,dword ptr [eax]
 00475323    call        eax
>00475325    jmp         00475338
 00475327    lea         eax,[ebp-40]
 0047532A    call        0045E680
 0047532F    lea         eax,[ebp-40]
 00475332    push        eax
 00475333    call        OpenGL32.glLoadMatrixf
 00475338    push        1700
 0047533D    call        OpenGL32.glMatrixMode
 00475342    xor         eax,eax
 00475344    mov         al,byte ptr [ebx+1C]
 00475347    mov         eax,dword ptr [eax*4+5AD474]
 0047534E    push        eax
 0047534F    push        2200
 00475354    push        2300
 00475359    call        OpenGL32.glTexEnvi
 0047535E    mov         eax,dword ptr [ebx+5C]
 00475361    call        00472C80
 00475366    push        eax
 00475367    push        2201
 0047536C    push        2300
 00475371    call        OpenGL32.glTexEnvfv
 00475376    mov         eax,ebx
 00475378    call        00474C44
 0047537D    push        84C0
 00475382    mov         eax,[005AE62C];^gvar_005E0E88
 00475387    mov         eax,dword ptr [eax]
 00475389    call        eax
 0047538B    pop         edi
 0047538C    pop         esi
 0047538D    pop         ebx
 0047538E    mov         esp,ebp
 00475390    pop         ebp
 00475391    ret         4
end;*}

//00475394
{*procedure sub_00475394(?:?; ?:?; ?:?);
begin
 00475394    push        ebp
 00475395    mov         ebp,esp
 00475397    push        ebx
 00475398    push        esi
 00475399    mov         ebx,eax
 0047539B    mov         esi,dword ptr [ebp+8]
 0047539E    add         edx,84C0
 004753A4    dec         edx
 004753A5    push        edx
 004753A6    mov         eax,[005AE62C];^gvar_005E0E88
 004753AB    mov         eax,dword ptr [eax]
 004753AD    call        eax
 004753AF    mov         eax,ebx
 004753B1    call        00474EE0
 004753B6    mov         eax,dword ptr [ebx+24]
 004753B9    mov         eax,dword ptr [eax]
 004753BB    call        dword ptr [eax+24]
 004753BE    cmp         eax,0DE1
>004753C3    jne         004753CF
 004753C5    test        esi,esi
>004753C7    je          004753E8
 004753C9    cmp         byte ptr [esi+24],0
>004753CD    jne         004753E8
 004753CF    push        1702
 004753D4    call        OpenGL32.glMatrixMode
 004753D9    call        OpenGL32.glLoadIdentity
 004753DE    push        1700
 004753E3    call        OpenGL32.glMatrixMode
 004753E8    mov         eax,dword ptr [ebx+24]
 004753EB    mov         eax,dword ptr [eax]
 004753ED    call        dword ptr [eax+24]
 004753F0    push        eax
 004753F1    call        OpenGL32.glDisable
 004753F6    push        84C0
 004753FB    mov         eax,[005AE62C];^gvar_005E0E88
 00475400    mov         eax,dword ptr [eax]
 00475402    call        eax
 00475404    pop         esi
 00475405    pop         ebx
 00475406    pop         ebp
 00475407    ret         4
end;*}

//0047540C
procedure sub_0047540C(?:TGLTexture);
begin
{*
 0047540C    push        ebx
 0047540D    push        esi
 0047540E    mov         ebx,eax
 00475410    mov         eax,dword ptr [ebx+18]
 00475413    cmp         dword ptr [eax+8],0
>00475417    jne         0047543B
 00475419    call        0046CEE8
 0047541E    mov         eax,dword ptr [ebx+18]
 00475421    cmp         dword ptr [eax+8],0
>00475425    jne         0047543B
 00475427    mov         ecx,0EBD
 0047542C    mov         edx,475488;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00475431    mov         eax,4754C4;'Assertion failure'
 00475436    call        @Assert
 0047543B    mov         eax,dword ptr [ebx+24]
 0047543E    mov         eax,dword ptr [eax]
 00475440    call        dword ptr [eax+24]
 00475443    mov         esi,eax
 00475445    cmp         esi,8513
>0047544B    jne         00475457
 0047544D    mov         eax,[005AE74C];^gvar_005E0CE7
 00475452    cmp         byte ptr [eax],0
>00475455    je          0047546D
 00475457    mov         eax,dword ptr [ebx+18]
 0047545A    mov         eax,dword ptr [eax+8]
 0047545D    push        eax
 0047545E    push        esi
 0047545F    call        OpenGL32.glBindTexture
 00475464    mov         edx,esi
 00475466    mov         eax,ebx
 00475468    mov         ecx,dword ptr [eax]
 0047546A    call        dword ptr [ecx+1C]
 0047546D    mov         eax,dword ptr [ebx+18]
 00475470    mov         eax,dword ptr [eax+8]
 00475473    mov         dl,byte ptr ds:[4754D8];0x0 gvar_004754D8
 00475479    mov         byte ptr [ebx+21],dl
 0047547C    pop         esi
 0047547D    pop         ebx
 0047547E    ret
*}
end;

//004754DC
{*function sub_004754DC(?:?):Boolean;
begin
 004754DC    mov         eax,dword ptr [eax+18]
 004754DF    cmp         dword ptr [eax+8],0
 004754E3    setne       al
 004754E6    ret
end;*}

//004754E8
{*function sub_004754E8:?;
begin
 004754E8    push        ebx
 004754E9    push        esi
 004754EA    push        edi
 004754EB    push        ebp
 004754EC    push        ecx
 004754ED    mov         esi,eax
 004754EF    mov         eax,dword ptr [esi+18];TGLTexture.?f18:TGLTextureHandle
 004754F2    cmp         dword ptr [eax+8],0;TGLTextureHandle.?f8:dword
>004754F6    je          00475506
 004754F8    mov         al,[004755C4];0x0 gvar_004755C4
 004754FD    cmp         al,byte ptr [esi+21];TGLTexture.?f21:byte
>00475500    je          004755B7
 00475506    mov         eax,esi
 00475508    call        0047540C
 0047550D    mov         eax,dword ptr [esi+24];TGLTexture.Image:TGLTextureImage
 00475510    mov         eax,dword ptr [eax]
 00475512    call        dword ptr [eax+24];TGLTextureImage.sub_00472F98
 00475515    cmp         eax,8513
>0047551A    jne         0047552B
 0047551C    mov         edx,dword ptr ds:[5AE74C];^gvar_005E0CE7
 00475522    cmp         byte ptr [edx],0
>00475525    je          004755B7
 0047552B    cmp         eax,8513
>00475530    jne         004755AE
 00475532    mov         eax,dword ptr [esi+24];TGLTexture.Image:TGLTextureImage
 00475535    mov         edx,dword ptr ds:[4712B8];TGLCubeMapImage
 0047553B    call        @AsClass
 00475540    mov         dword ptr [esp],eax
 00475543    xor         edx,edx
 00475545    mov         eax,dword ptr [esp]
 00475548    call        TGLCubeMapImage.GetPicturePX
 0047554D    call        TPicture.GetWidth
 00475552    mov         edi,eax
 00475554    test        edi,edi
 00475556    setg        al
 00475559    test        al,al
>0047555B    je          00475591
 0047555D    xor         ebx,ebx
 0047555F    mov         edx,ebx
 00475561    mov         eax,dword ptr [esp]
 00475564    call        TGLCubeMapImage.GetPicturePX
 00475569    mov         ebp,eax
 0047556B    mov         eax,ebp
 0047556D    call        TPicture.GetWidth
 00475572    cmp         edi,eax
>00475574    jne         00475581
 00475576    mov         eax,ebp
 00475578    call        TPicture.GetHeight
 0047557D    cmp         edi,eax
>0047557F    je          00475585
 00475581    xor         eax,eax
>00475583    jmp         00475587
 00475585    mov         al,1
 00475587    test        al,al
>00475589    je          00475591
 0047558B    inc         ebx
 0047558C    cmp         bl,6
>0047558F    jne         0047555F
 00475591    test        al,al
>00475593    je          004755B7
 00475595    mov         ebx,8515
 0047559A    mov         edx,ebx
 0047559C    mov         eax,esi
 0047559E    mov         ecx,dword ptr [eax]
 004755A0    call        dword ptr [ecx+18];TGLTexture.sub_00475758
 004755A3    inc         ebx
 004755A4    cmp         ebx,851B
>004755AA    jne         0047559A
>004755AC    jmp         004755B7
 004755AE    mov         edx,eax
 004755B0    mov         eax,esi
 004755B2    mov         ecx,dword ptr [eax]
 004755B4    call        dword ptr [ecx+18];TGLTexture.sub_00475758
 004755B7    mov         eax,dword ptr [esi+18];TGLTexture.?f18:TGLTextureHandle
 004755BA    mov         eax,dword ptr [eax+8];TGLTextureHandle.?f8:dword
 004755BD    pop         edx
 004755BE    pop         ebp
 004755BF    pop         edi
 004755C0    pop         esi
 004755C1    pop         ebx
 004755C2    ret
end;*}

//004755C8
procedure sub_004755C8(?:TGLTexture);
begin
{*
 004755C8    push        ebx
 004755C9    mov         ebx,eax
 004755CB    mov         eax,dword ptr [ebx+18];TGLTexture.?f18:TGLTextureHandle
 004755CE    call        0046CFA8
 004755D3    mov         al,[004755E4];0x3 gvar_004755E4
 004755D8    mov         byte ptr [ebx+21],al;TGLTexture.?f21:byte
 004755DB    mov         dword ptr [ebx+4C],0FFFFFFFF;TGLTexture.?f4C:dword
 004755E2    pop         ebx
 004755E3    ret
*}
end;

//004755E8
function sub_004755E8(?:TGLTexture):Boolean;
begin
{*
 004755E8    mov         al,byte ptr [eax+1E]
 004755EB    add         al,0F6
 004755ED    sub         al,2
 004755EF    setb        al
 004755F2    ret
*}
end;

//004755F4
{*function sub_004755F4(?:TGLTexture):?;
begin
 004755F4    push        ebx
 004755F5    push        esi
 004755F6    push        ecx
 004755F7    mov         esi,eax
 004755F9    mov         al,byte ptr [esi+1E]
 004755FC    test        al,al
>004755FE    jne         00475619
 00475600    cmp         byte ptr ds:[5AD46C],0;gvar_005AD46C
>00475607    jne         0047560F
 00475609    mov         byte ptr [esp],2
>0047560D    jmp         0047561C
 0047560F    mov         al,[005AD46C];0x2 gvar_005AD46C
 00475614    mov         byte ptr [esp],al
>00475617    jmp         0047561C
 00475619    mov         byte ptr [esp],al
 0047561C    mov         eax,[005AE4A4];^gvar_005E0CE6
 00475621    cmp         byte ptr [eax],0
>00475624    je          00475646
 00475626    mov         al,byte ptr [esi+48]
 00475629    test        al,al
>0047562B    jne         00475642
 0047562D    cmp         byte ptr ds:[5AD470],0;gvar_005AD470
>00475634    jne         0047563A
 00475636    mov         bl,1
>00475638    jmp         00475648
 0047563A    mov         bl,byte ptr ds:[5AD470];0x1 gvar_005AD470
>00475640    jmp         00475648
 00475642    mov         ebx,eax
>00475644    jmp         00475648
 00475646    mov         bl,1
 00475648    mov         eax,esi
 0047564A    call        004755E8
 0047564F    test        al,al
>00475651    je          00475655
 00475653    mov         bl,1
 00475655    cmp         bl,1
>00475658    je          004756BE
 0047565A    sub         bl,2
>0047565D    je          00475669
 0047565F    dec         bl
>00475661    je          0047567A
 00475663    dec         bl
>00475665    je          0047568B
>00475667    jmp         0047569C
 00475669    push        1100
 0047566E    push        84EF
 00475673    call        OpenGL32.glHint
>00475678    jmp         004756B0
 0047567A    push        1102
 0047567F    push        84EF
 00475684    call        OpenGL32.glHint
>00475689    jmp         004756B0
 0047568B    push        1101
 00475690    push        84EF
 00475695    call        OpenGL32.glHint
>0047569A    jmp         004756B0
 0047569C    mov         ecx,0F29
 004756A1    mov         edx,475708;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 004756A6    mov         eax,475744;'Assertion failure'
 004756AB    call        @Assert
 004756B0    xor         eax,eax
 004756B2    mov         al,byte ptr [esp]
 004756B5    mov         ebx,dword ptr [eax*4+5AD4C4]
>004756BC    jmp         004756CA
 004756BE    xor         eax,eax
 004756C0    mov         al,byte ptr [esp]
 004756C3    mov         ebx,dword ptr [eax*4+5AD498]
 004756CA    mov         eax,esi
 004756CC    call        004755E8
 004756D1    test        al,al
>004756D3    je          004756F8
 004756D5    mov         eax,[005AE128];^gvar_005E0D25
 004756DA    cmp         byte ptr [eax],0
>004756DD    jne         004756F8
 004756DF    mov         al,byte ptr [esp]
 004756E2    sub         al,0A
>004756E4    je          004756EC
 004756E6    dec         al
>004756E8    je          004756F3
>004756EA    jmp         004756F8
 004756EC    mov         ebx,888A
>004756F1    jmp         004756F8
 004756F3    mov         ebx,888B
 004756F8    mov         eax,ebx
 004756FA    pop         edx
 004756FB    pop         esi
 004756FC    pop         ebx
 004756FD    ret
end;*}

//00475758
{*procedure sub_00475758(?:?);
begin
 00475758    push        ebx
 00475759    push        esi
 0047575A    push        edi
 0047575B    push        ebp
 0047575C    mov         edi,edx
 0047575E    mov         ebx,eax
 00475760    mov         edx,edi
 00475762    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 00475765    mov         ecx,dword ptr [eax]
 00475767    call        dword ptr [ecx+28];@AbstractError
 0047576A    mov         esi,eax
 0047576C    test        esi,esi
>0047576E    je          004758F7
 00475774    mov         eax,esi
 00475776    call        00470248
 0047577B    test        al,al
>0047577D    jne         004758F7
 00475783    mov         eax,ebx
 00475785    call        004755F4
 0047578A    mov         ebp,eax
 0047578C    cmp         byte ptr [ebx+1E],9;TGLTexture.TextureFormat:TGLTextureFormat
>00475790    jne         004757C0
 00475792    push        dword ptr [ebx+60];TGLTexture.NormalMapScale:Single
 00475795    mov         al,byte ptr [ebx+1D];TGLTexture.TextureWrap:TGLTextureWrap
 00475798    mov         edx,eax
 0047579A    test        dl,dl
>0047579C    je          004757A7
 0047579E    sub         dl,2
>004757A1    je          004757A7
 004757A3    xor         edx,edx
>004757A5    jmp         004757A9
 004757A7    mov         dl,1
 004757A9    push        edx
 004757AA    test        al,al
>004757AC    je          004757B6
 004757AE    sub         al,3
>004757B0    je          004757B6
 004757B2    xor         edx,edx
>004757B4    jmp         004757B8
 004757B6    mov         dl,1
 004757B8    mov         eax,esi
 004757BA    pop         ecx
 004757BB    call        0047084C
 004757C0    xor         eax,eax
 004757C2    mov         al,byte ptr [ebx+28];TGLTexture.ImageAlpha:TGLTextureImageAlpha
 004757C5    cmp         eax,8
>004757C8    ja          0047586B
 004757CE    jmp         dword ptr [eax*4+4757D5]
 004757CE    dd          0047587F
 004757CE    dd          004757FE
 004757CE    dd          00475807
 004757CE    dd          00475812
 004757CE    dd          0047581B
 004757CE    dd          0047582B
 004757CE    dd          00475836
 004757CE    dd          00475844
 004757CE    dd          00475854
>004757F9    jmp         0047587F
 004757FE    mov         eax,esi
 00475800    call        004703A8
>00475805    jmp         0047587F
 00475807    xor         edx,edx
 00475809    mov         eax,esi
 0047580B    call        004703F0
>00475810    jmp         0047587F
 00475812    mov         eax,esi
 00475814    call        004703A8
>00475819    jmp         0047587F
 0047581B    mov         eax,esi
 0047581D    call        004703A8
 00475822    mov         eax,esi
 00475824    call        00470508
>00475829    jmp         0047587F
 0047582B    mov         dl,0FF
 0047582D    mov         eax,esi
 0047582F    call        004704B4
>00475834    jmp         0047587F
 00475836    mov         eax,dword ptr [esi+4]
 00475839    mov         edx,dword ptr [eax]
 0047583B    mov         eax,esi
 0047583D    call        00470430
>00475842    jmp         0047587F
 00475844    mov         eax,esi
 00475846    call        004703A8
 0047584B    mov         eax,esi
 0047584D    call        004704DC
>00475852    jmp         0047587F
 00475854    mov         eax,esi
 00475856    call        004703A8
 0047585B    mov         eax,esi
 0047585D    call        00470508
 00475862    mov         eax,esi
 00475864    call        004704DC
>00475869    jmp         0047587F
 0047586B    mov         ecx,0F62
 00475870    mov         edx,475904;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00475875    mov         eax,475940;'Assertion failure'
 0047587A    call        @Assert
 0047587F    fld         dword ptr [ebx+2C];TGLTexture.ImageBrightness:Single
 00475882    fcomp       dword ptr ds:[475954];1:Single
 00475888    fnstsw      al
 0047588A    sahf
>0047588B    je          00475897
 0047588D    push        dword ptr [ebx+2C];TGLTexture.ImageBrightness:Single
 00475890    mov         eax,esi
 00475892    call        0047055C
 00475897    fld         dword ptr [ebx+30];TGLTexture.ImageGamma:Single
 0047589A    fcomp       dword ptr ds:[475954];1:Single
 004758A0    fnstsw      al
 004758A2    sahf
>004758A3    je          004758AF
 004758A5    push        dword ptr [ebx+30];TGLTexture.ImageGamma:Single
 004758A8    mov         eax,esi
 004758AA    call        00470584
 004758AF    call        0046C304
 004758B4    push        ebp
 004758B5    lea         eax,[ebx+54];TGLTexture.?f54:?
 004758B8    push        eax
 004758B9    lea         eax,[ebx+58];TGLTexture.?f58:?
 004758BC    push        eax
 004758BD    mov         cl,byte ptr [ebx+1F];TGLTexture.MinFilter:TGLMinFilter
 004758C0    mov         edx,edi
 004758C2    mov         eax,esi
 004758C4    call        004705F0
 004758C9    lea         eax,[ebx+4C];TGLTexture.?f4C:dword
 004758CC    push        eax
 004758CD    push        86A0
 004758D2    push        0
 004758D4    push        edi
 004758D5    call        OpenGL32.glGetTexLevelParameteriv
 004758DA    call        OpenGL32.glGetError
 004758DF    test        eax,eax
>004758E1    je          004758EA
 004758E3    mov         dword ptr [ebx+4C],0FFFFFFFF;TGLTexture.?f4C:dword
 004758EA    call        0046C3B8
 004758EF    mov         eax,dword ptr [ebx+24];TGLTexture.Image:TGLTextureImage
 004758F2    mov         edx,dword ptr [eax]
 004758F4    call        dword ptr [edx+2C];TGLTextureImage.sub_00472FBC
 004758F7    pop         ebp
 004758F8    pop         edi
 004758F9    pop         esi
 004758FA    pop         ebx
 004758FB    ret
end;*}

//00475958
{*procedure sub_00475958(?:?);
begin
 00475958    push        ebx
 00475959    push        esi
 0047595A    mov         esi,edx
 0047595C    mov         ebx,eax
 0047595E    push        1102
 00475963    push        0C50
 00475968    call        OpenGL32.glHint
 0047596D    push        4
 0047596F    push        0CF5
 00475974    call        OpenGL32.glPixelStorei
 00475979    push        0
 0047597B    push        0CF2
 00475980    call        OpenGL32.glPixelStorei
 00475985    push        0
 00475987    push        0CF3
 0047598C    call        OpenGL32.glPixelStorei
 00475991    push        0
 00475993    push        0CF4
 00475998    call        OpenGL32.glPixelStorei
 0047599D    mov         eax,ebx
 0047599F    call        004755E8
 004759A4    test        al,al
>004759A6    je          00475A34
 004759AC    push        812F
 004759B1    push        2802
 004759B6    push        esi
 004759B7    call        OpenGL32.glTexParameteri
 004759BC    push        812F
 004759C1    push        2803
 004759C6    push        esi
 004759C7    call        OpenGL32.glTexParameteri
 004759CC    mov         eax,[005AE128];^gvar_005E0D25
 004759D1    cmp         byte ptr [eax],0
>004759D4    je          00475A11
 004759D6    cmp         byte ptr [ebx+1E],0A;TGLTexture.TextureFormat:TGLTextureFormat
>004759DA    jne         00475A11
 004759DC    xor         eax,eax
 004759DE    mov         al,byte ptr [ebx+1F];TGLTexture.MinFilter:TGLMinFilter
 004759E1    mov         eax,dword ptr [eax*4+5AD53C]
 004759E8    push        eax
 004759E9    push        2801
 004759EE    push        esi
 004759EF    call        OpenGL32.glTexParameteri
 004759F4    xor         eax,eax
 004759F6    mov         al,byte ptr [ebx+20];TGLTexture.MagFilter:TGLMagFilter
 004759F9    mov         eax,dword ptr [eax*4+5AD534]
 00475A00    push        eax
 00475A01    push        2800
 00475A06    push        esi
 00475A07    call        OpenGL32.glTexParameteri
>00475A0C    jmp         00475AFC
 00475A11    push        2600
 00475A16    push        2801
 00475A1B    push        esi
 00475A1C    call        OpenGL32.glTexParameteri
 00475A21    push        2600
 00475A26    push        2800
 00475A2B    push        esi
 00475A2C    call        OpenGL32.glTexParameteri
 00475A31    pop         esi
 00475A32    pop         ebx
 00475A33    ret
 00475A34    mov         eax,[005AE698];^gvar_005E0CD6
 00475A39    cmp         byte ptr [eax],0
>00475A3C    jne         00475A48
 00475A3E    mov         eax,[005AE654];^gvar_005E0D0D
 00475A43    cmp         byte ptr [eax],0
>00475A46    je          00475A7A
 00475A48    xor         eax,eax
 00475A4A    mov         al,byte ptr [ebx+1D];TGLTexture.TextureWrap:TGLTextureWrap
 00475A4D    mov         eax,dword ptr [eax*4+5AD4F4]
 00475A54    push        eax
 00475A55    push        2802
 00475A5A    push        esi
 00475A5B    call        OpenGL32.glTexParameteri
 00475A60    xor         eax,eax
 00475A62    mov         al,byte ptr [ebx+1D];TGLTexture.TextureWrap:TGLTextureWrap
 00475A65    mov         eax,dword ptr [eax*4+5AD504]
 00475A6C    push        eax
 00475A6D    push        2803
 00475A72    push        esi
 00475A73    call        OpenGL32.glTexParameteri
>00475A78    jmp         00475AAA
 00475A7A    xor         eax,eax
 00475A7C    mov         al,byte ptr [ebx+1D];TGLTexture.TextureWrap:TGLTextureWrap
 00475A7F    mov         eax,dword ptr [eax*4+5AD514]
 00475A86    push        eax
 00475A87    push        2802
 00475A8C    push        esi
 00475A8D    call        OpenGL32.glTexParameteri
 00475A92    xor         eax,eax
 00475A94    mov         al,byte ptr [ebx+1D];TGLTexture.TextureWrap:TGLTextureWrap
 00475A97    mov         eax,dword ptr [eax*4+5AD524]
 00475A9E    push        eax
 00475A9F    push        2803
 00475AA4    push        esi
 00475AA5    call        OpenGL32.glTexParameteri
 00475AAA    xor         eax,eax
 00475AAC    mov         al,byte ptr [ebx+1F];TGLTexture.MinFilter:TGLMinFilter
 00475AAF    mov         eax,dword ptr [eax*4+5AD53C]
 00475AB6    push        eax
 00475AB7    push        2801
 00475ABC    push        esi
 00475ABD    call        OpenGL32.glTexParameteri
 00475AC2    xor         eax,eax
 00475AC4    mov         al,byte ptr [ebx+20];TGLTexture.MagFilter:TGLMagFilter
 00475AC7    mov         eax,dword ptr [eax*4+5AD534]
 00475ACE    push        eax
 00475ACF    push        2800
 00475AD4    push        esi
 00475AD5    call        OpenGL32.glTexParameteri
 00475ADA    mov         eax,[005AE704];^gvar_005E0D10
 00475ADF    cmp         byte ptr [eax],0
>00475AE2    je          00475AFC
 00475AE4    xor         eax,eax
 00475AE6    mov         al,byte ptr [ebx+50];TGLTexture.FilteringQuality:TGLTextureFilteringQuality
 00475AE9    mov         eax,dword ptr [eax*4+5AD554]
 00475AF0    push        eax
 00475AF1    push        84FE
 00475AF6    push        esi
 00475AF7    call        OpenGL32.glTexParameteri
 00475AFC    pop         esi
 00475AFD    pop         ebx
 00475AFE    ret
end;*}

//00475B00
{*procedure sub_00475B00(?:?);
begin
 00475B00    push        ebx
 00475B01    cmp         word ptr [eax+42],0
>00475B06    je          00475B10
 00475B08    mov         ebx,eax
 00475B0A    mov         eax,dword ptr [ebx+44]
 00475B0D    call        dword ptr [ebx+40]
 00475B10    pop         ebx
 00475B11    ret
end;*}

//00475B14
constructor TGLTextureExItem.Create(Collection:TCollection);
begin
{*
 00475B14    push        ebp
 00475B15    mov         ebp,esp
 00475B17    push        ecx
 00475B18    push        ebx
 00475B19    push        esi
 00475B1A    push        edi
 00475B1B    test        dl,dl
>00475B1D    je          00475B27
 00475B1F    add         esp,0FFFFFFF0
 00475B22    call        @ClassCreate
 00475B27    mov         byte ptr [ebp-1],dl
 00475B2A    mov         ebx,eax
 00475B2C    xor         edx,edx
 00475B2E    mov         eax,ebx
 00475B30    call        TCollectionItem.Create
 00475B35    mov         ecx,ebx
 00475B37    mov         dl,1
 00475B39    mov         eax,[00471868];TGLTexture
 00475B3E    call        TGLTexture.Create;TGLTexture.Create
 00475B43    mov         dword ptr [ebx+0C],eax;TGLTextureExItem.Texture:TGLTexture
 00475B46    mov         eax,[005AE1F8];^gvar_005ACF84
 00475B4B    push        eax
 00475B4C    push        2
 00475B4E    mov         ecx,ebx
 00475B50    mov         dl,1
 00475B52    mov         eax,[0046AF7C];TGLCoordinates
 00475B57    call        TGLCoordinates.Create;TGLCoordinates.Create
 00475B5C    mov         esi,eax
 00475B5E    mov         dword ptr [ebx+14],esi;TGLTextureExItem.TextureOffset:TGLCoordinates
 00475B61    mov         dword ptr [esi+14],ebx;TGLCoordinates.?f14:TGLTextureExItem
 00475B64    mov         dword ptr [esi+10],475EC0;TGLCoordinates.?f10:?
 00475B6B    mov         eax,[005AE630];^gvar_005ACF64
 00475B70    push        eax
 00475B71    push        2
 00475B73    mov         ecx,ebx
 00475B75    mov         dl,1
 00475B77    mov         eax,[0046AF7C];TGLCoordinates
 00475B7C    call        TGLCoordinates.Create;TGLCoordinates.Create
 00475B81    mov         esi,eax
 00475B83    mov         dword ptr [ebx+18],esi;TGLTextureExItem.TextureScale:TGLCoordinates
 00475B86    mov         dword ptr [esi+14],ebx;TGLCoordinates.?f14:TGLTextureExItem
 00475B89    mov         dword ptr [esi+10],475EC0;TGLCoordinates.?f10:?
 00475B90    mov         eax,dword ptr [ebx+8];TGLTextureExItem.FID:Integer
 00475B93    mov         dword ptr [ebx+10],eax;TGLTextureExItem.TextureIndex:Integer
 00475B96    mov         eax,[005AE67C];^gvar_005ACFB4
 00475B9B    mov         esi,eax
 00475B9D    lea         edi,[ebx+20];TGLTextureExItem.?f20:?
 00475BA0    mov         ecx,10
 00475BA5    rep movs    dword ptr [edi],dword ptr [esi]
 00475BA7    mov         eax,ebx
 00475BA9    cmp         byte ptr [ebp-1],0
>00475BAD    je          00475BBE
 00475BAF    call        @AfterConstruction
 00475BB4    pop         dword ptr fs:[0]
 00475BBB    add         esp,0C
 00475BBE    mov         eax,ebx
 00475BC0    pop         edi
 00475BC1    pop         esi
 00475BC2    pop         ebx
 00475BC3    pop         ecx
 00475BC4    pop         ebp
 00475BC5    ret
*}
end;

//00475BC8
destructor TGLTextureExItem.Destroy;
begin
{*
 00475BC8    push        ebx
 00475BC9    push        esi
 00475BCA    call        @BeforeDestruction
 00475BCF    mov         ebx,edx
 00475BD1    mov         esi,eax
 00475BD3    mov         eax,dword ptr [esi+0C];TGLTextureExItem.Texture:TGLTexture
 00475BD6    call        TObject.Free
 00475BDB    mov         eax,dword ptr [esi+14];TGLTextureExItem.TextureOffset:TGLCoordinates
 00475BDE    call        TObject.Free
 00475BE3    mov         eax,dword ptr [esi+18];TGLTextureExItem.TextureScale:TGLCoordinates
 00475BE6    call        TObject.Free
 00475BEB    mov         edx,ebx
 00475BED    and         dl,0FC
 00475BF0    mov         eax,esi
 00475BF2    call        TCollectionItem.Destroy
 00475BF7    test        bl,bl
>00475BF9    jle         00475C02
 00475BFB    mov         eax,esi
 00475BFD    call        @ClassDestroy
 00475C02    pop         esi
 00475C03    pop         ebx
 00475C04    ret
*}
end;

//00475C08
procedure TGLTextureExItem.Assign(Source:TPersistent);
begin
{*
 00475C08    push        ebx
 00475C09    push        esi
 00475C0A    push        edi
 00475C0B    mov         esi,edx
 00475C0D    mov         ebx,eax
 00475C0F    mov         eax,esi
 00475C11    mov         edx,dword ptr ds:[471BC4];TGLTextureExItem
 00475C17    call        @IsClass
 00475C1C    test        al,al
>00475C1E    je          00475C55
 00475C20    mov         edi,esi
 00475C22    mov         edx,dword ptr [edi+0C]
 00475C25    mov         eax,ebx
 00475C27    call        TGLTextureExItem.SetTexture
 00475C2C    mov         edx,dword ptr [edi+10]
 00475C2F    mov         eax,ebx
 00475C31    call        TGLTextureExItem.SetTextureIndex
 00475C36    mov         edx,dword ptr [edi+14]
 00475C39    mov         eax,ebx
 00475C3B    call        TGLTextureExItem.SetTextureOffset
 00475C40    mov         edx,dword ptr [edi+18]
 00475C43    mov         eax,ebx
 00475C45    call        TGLTextureExItem.SetTextureScale
 00475C4A    mov         edx,ebx
 00475C4C    mov         eax,ebx
 00475C4E    call        00475C64
>00475C53    jmp         00475C5E
 00475C55    mov         edx,esi
 00475C57    mov         eax,ebx
 00475C59    call        TPersistent.Assign
 00475C5E    pop         edi
 00475C5F    pop         esi
 00475C60    pop         ebx
 00475C61    ret
*}
end;

//00475C64
procedure sub_00475C64(?:TGLTextureExItem);
begin
{*
 00475C64    mov         ecx,dword ptr [eax+4];TGLTextureExItem.FCollection:TCollection
 00475C67    test        ecx,ecx
>00475C69    je          00475C72
 00475C6B    mov         eax,ecx
 00475C6D    call        00475F0C
 00475C72    ret
*}
end;

//00475C74
{*procedure sub_00475C74(?:?; ?:?);
begin
 00475C74    push        ebx
 00475C75    push        esi
 00475C76    mov         esi,edx
 00475C78    mov         ebx,eax
 00475C7A    mov         byte ptr [ebx+60],0
 00475C7E    mov         eax,dword ptr [ebx+0C]
 00475C81    call        00474A7C
 00475C86    test        al,al
>00475C88    je          00475D1B
 00475C8E    mov         eax,dword ptr [ebx+10]
 00475C91    add         eax,84C0
 00475C96    push        eax
 00475C97    mov         eax,[005AE62C];^gvar_005E0E88
 00475C9C    mov         eax,dword ptr [eax]
 00475C9E    call        eax
 00475CA0    push        1702
 00475CA5    call        OpenGL32.glMatrixMode
 00475CAA    call        OpenGL32.glPushMatrix
 00475CAF    cmp         byte ptr [ebx+1C],0
>00475CB3    je          00475CBC
 00475CB5    call        OpenGL32.glLoadIdentity
>00475CBA    jmp         00475CC5
 00475CBC    lea         eax,[ebx+20]
 00475CBF    push        eax
 00475CC0    call        OpenGL32.glLoadMatrixf
 00475CC5    push        1700
 00475CCA    call        OpenGL32.glMatrixMode
 00475CCF    push        84C0
 00475CD4    mov         eax,[005AE62C];^gvar_005E0E88
 00475CD9    mov         eax,dword ptr [eax]
 00475CDB    call        eax
 00475CDD    mov         eax,dword ptr [ebx+10]
 00475CE0    test        eax,eax
>00475CE2    jne         00475CF0
 00475CE4    mov         edx,esi
 00475CE6    mov         eax,dword ptr [ebx+0C]
 00475CE9    call        00474F08
>00475CEE    jmp         00475D17
 00475CF0    cmp         eax,1
>00475CF3    jne         00475D03
 00475CF5    mov         edx,esi
 00475CF7    xor         ecx,ecx
 00475CF9    mov         eax,dword ptr [ebx+0C]
 00475CFC    call        004751F4
>00475D01    jmp         00475D17
 00475D03    cmp         eax,2
>00475D06    jl          00475D17
 00475D08    push        0
 00475D0A    mov         ecx,esi
 00475D0C    mov         edx,eax
 00475D0E    inc         edx
 00475D0F    mov         eax,dword ptr [ebx+0C]
 00475D12    call        00475214
 00475D17    mov         byte ptr [ebx+60],1
 00475D1B    pop         esi
 00475D1C    pop         ebx
 00475D1D    ret
end;*}

//00475D20
{*procedure sub_00475D20(?:?);
begin
 00475D20    push        ebx
 00475D21    mov         ebx,eax
 00475D23    cmp         byte ptr [ebx+60],0
>00475D27    je          00475D9C
 00475D29    mov         eax,dword ptr [ebx+10]
 00475D2C    test        eax,eax
>00475D2E    jne         00475D3A
 00475D30    mov         eax,dword ptr [ebx+0C]
 00475D33    call        00475190
>00475D38    jmp         00475D5F
 00475D3A    cmp         eax,1
>00475D3D    jne         00475D4B
 00475D3F    xor         ecx,ecx
 00475D41    mov         eax,dword ptr [ebx+0C]
 00475D44    call        00475204
>00475D49    jmp         00475D5F
 00475D4B    cmp         eax,2
>00475D4E    jl          00475D5F
 00475D50    push        0
 00475D52    mov         ecx,edx
 00475D54    mov         edx,eax
 00475D56    inc         edx
 00475D57    mov         eax,dword ptr [ebx+0C]
 00475D5A    call        00475394
 00475D5F    mov         eax,dword ptr [ebx+10]
 00475D62    add         eax,84C0
 00475D67    push        eax
 00475D68    mov         eax,[005AE62C];^gvar_005E0E88
 00475D6D    mov         eax,dword ptr [eax]
 00475D6F    call        eax
 00475D71    push        1702
 00475D76    call        OpenGL32.glMatrixMode
 00475D7B    call        OpenGL32.glPopMatrix
 00475D80    push        1700
 00475D85    call        OpenGL32.glMatrixMode
 00475D8A    push        84C0
 00475D8F    mov         eax,[005AE62C];^gvar_005E0E88
 00475D94    mov         eax,dword ptr [eax]
 00475D96    call        eax
 00475D98    mov         byte ptr [ebx+60],0
 00475D9C    pop         ebx
 00475D9D    ret
end;*}

//00475DA0
{*procedure TGLTextureExItem.GetDisplayName(?:?);
begin
 00475DA0    push        ebx
 00475DA1    push        esi
 00475DA2    add         esp,0FFFFFFF8
 00475DA5    mov         esi,edx
 00475DA7    mov         ebx,eax
 00475DA9    push        esi
 00475DAA    mov         eax,dword ptr [ebx+10];TGLTextureExItem.TextureIndex:Integer
 00475DAD    mov         dword ptr [esp+4],eax
 00475DB1    mov         byte ptr [esp+8],0
 00475DB6    lea         edx,[esp+4]
 00475DBA    xor         ecx,ecx
 00475DBC    mov         eax,475DD4;'Tex [%d]'
 00475DC1    call        Format
 00475DC6    pop         ecx
 00475DC7    pop         edx
 00475DC8    pop         esi
 00475DC9    pop         ebx
 00475DCA    ret
end;*}

//00475DE0
procedure TGLTextureExItem.sub_0041ADA4;
begin
{*
 00475DE0    mov         eax,dword ptr [eax+4];TGLTextureExItem.FCollection:TCollection
 00475DE3    ret
*}
end;

//00475DE4
procedure sub_00475DE4(?:dword);
begin
{*
 00475DE4    mov         ecx,dword ptr [eax+4]
 00475DE7    mov         ecx,dword ptr [ecx+18]
 00475DEA    test        ecx,ecx
>00475DEC    je          00475DF5
 00475DEE    mov         eax,ecx
 00475DF0    call        00476910
 00475DF5    ret
*}
end;

//00475DF8
procedure TGLTextureExItem.SetTexture(Value:TGLTexture);
begin
{*
 00475DF8    push        ebx
 00475DF9    mov         ebx,eax
 00475DFB    mov         eax,dword ptr [ebx+0C];TGLTextureExItem.Texture:TGLTexture
 00475DFE    mov         ecx,dword ptr [eax]
 00475E00    call        dword ptr [ecx+8];TGLTexture.Assign
 00475E03    mov         edx,ebx
 00475E05    mov         eax,ebx
 00475E07    call        00475C64
 00475E0C    pop         ebx
 00475E0D    ret
*}
end;

//00475E10
procedure TGLTextureExItem.SetTextureIndex(Value:Integer);
begin
{*
 00475E10    test        edx,edx
>00475E12    jge         00475E16
 00475E14    xor         edx,edx
 00475E16    cmp         edx,dword ptr [eax+10];TGLTextureExItem.TextureIndex:Integer
>00475E19    je          00475E25
 00475E1B    mov         dword ptr [eax+10],edx;TGLTextureExItem.TextureIndex:Integer
 00475E1E    mov         edx,eax
 00475E20    call        00475C64
 00475E25    ret
*}
end;

//00475E28
procedure TGLTextureExItem.SetTextureOffset(Value:TGLCoordinates);
begin
{*
 00475E28    push        ebx
 00475E29    mov         ebx,eax
 00475E2B    mov         eax,dword ptr [ebx+14];TGLTextureExItem.TextureOffset:TGLCoordinates
 00475E2E    mov         ecx,dword ptr [eax]
 00475E30    call        dword ptr [ecx+8];TGLCoordinates.Assign
 00475E33    mov         edx,ebx
 00475E35    mov         eax,ebx
 00475E37    call        00475C64
 00475E3C    pop         ebx
 00475E3D    ret
*}
end;

//00475E40
procedure TGLTextureExItem.SetTextureScale(Value:TGLCoordinates);
begin
{*
 00475E40    push        ebx
 00475E41    mov         ebx,eax
 00475E43    mov         eax,dword ptr [ebx+18];TGLTextureExItem.TextureScale:TGLCoordinates
 00475E46    mov         ecx,dword ptr [eax]
 00475E48    call        dword ptr [ecx+8];TGLCoordinates.Assign
 00475E4B    mov         edx,ebx
 00475E4D    mov         eax,ebx
 00475E4F    call        00475C64
 00475E54    pop         ebx
 00475E55    ret
*}
end;

//00475E58
{*procedure sub_00475E58(?:?);
begin
 00475E58    push        ebx
 00475E59    push        esi
 00475E5A    push        edi
 00475E5B    add         esp,0FFFFFFC0
 00475E5E    mov         ebx,eax
 00475E60    mov         edx,dword ptr ds:[5AE1F8];^gvar_005ACF84
 00475E66    mov         eax,dword ptr [ebx+14]
 00475E69    call        0046B68C
 00475E6E    test        al,al
>00475E70    je          00475E8A
 00475E72    mov         edx,dword ptr ds:[5AE630];^gvar_005ACF64
 00475E78    mov         eax,dword ptr [ebx+18]
 00475E7B    call        0046B68C
 00475E80    test        al,al
>00475E82    je          00475E8A
 00475E84    mov         byte ptr [ebx+1C],1
>00475E88    jmp         00475EAD
 00475E8A    mov         byte ptr [ebx+1C],0
 00475E8E    mov         ecx,esp
 00475E90    mov         eax,dword ptr [ebx+14]
 00475E93    lea         edx,[eax+18]
 00475E96    mov         eax,dword ptr [ebx+18]
 00475E99    add         eax,18
 00475E9C    call        0045DA0C
 00475EA1    mov         esi,esp
 00475EA3    lea         edi,[ebx+20]
 00475EA6    mov         ecx,10
 00475EAB    rep movs    dword ptr [edi],dword ptr [esi]
 00475EAD    mov         edx,ebx
 00475EAF    mov         eax,ebx
 00475EB1    call        00475C64
 00475EB6    add         esp,40
 00475EB9    pop         edi
 00475EBA    pop         esi
 00475EBB    pop         ebx
 00475EBC    ret
end;*}

//00475EC8
constructor TGLTextureEx.Create;
begin
{*
 00475EC8    push        ebx
 00475EC9    push        esi
 00475ECA    push        edi
 00475ECB    test        dl,dl
>00475ECD    je          00475ED7
 00475ECF    add         esp,0FFFFFFF0
 00475ED2    call        @ClassCreate
 00475ED7    mov         esi,ecx
 00475ED9    mov         ebx,edx
 00475EDB    mov         edi,eax
 00475EDD    mov         ecx,dword ptr ds:[471BC4];TGLTextureExItem
 00475EE3    xor         edx,edx
 00475EE5    mov         eax,edi
 00475EE7    call        TCollection.Create
 00475EEC    mov         dword ptr [edi+18],esi
 00475EEF    mov         eax,edi
 00475EF1    test        bl,bl
>00475EF3    je          00475F04
 00475EF5    call        @AfterConstruction
 00475EFA    pop         dword ptr fs:[0]
 00475F01    add         esp,0C
 00475F04    mov         eax,edi
 00475F06    pop         edi
 00475F07    pop         esi
 00475F08    pop         ebx
 00475F09    ret
*}
end;

//00475F0C
procedure sub_00475F0C(?:TCollection);
begin
{*
 00475F0C    push        esi
 00475F0D    mov         esi,dword ptr [eax+18]
 00475F10    test        esi,esi
>00475F12    je          00475F1B
 00475F14    mov         eax,esi
 00475F16    mov         ecx,dword ptr [eax]
 00475F18    call        dword ptr [ecx+10]
 00475F1B    pop         esi
 00475F1C    ret
*}
end;

//00475F20
{*procedure sub_00475F20(?:?; ?:?);
begin
 00475F20    push        ebx
 00475F21    push        esi
 00475F22    push        edi
 00475F23    push        ebp
 00475F24    add         esp,0FFFFFFF8
 00475F27    mov         dword ptr [esp],edx
 00475F2A    mov         esi,eax
 00475F2C    mov         eax,[005AE588];^gvar_005E0CE2
 00475F31    cmp         byte ptr [eax],0
>00475F34    je          00475FD3
 00475F3A    xor         ebp,ebp
 00475F3C    lea         eax,[esp+4]
 00475F40    push        eax
 00475F41    push        84E2
 00475F46    call        OpenGL32.glGetIntegerv
 00475F4B    mov         eax,esi
 00475F4D    call        TCollection.GetCount
 00475F52    mov         edi,eax
 00475F54    dec         edi
 00475F55    test        edi,edi
>00475F57    jl          00475FC8
 00475F59    inc         edi
 00475F5A    xor         ebx,ebx
 00475F5C    mov         edx,ebx
 00475F5E    mov         eax,esi
 00475F60    call        00476054
 00475F65    mov         eax,dword ptr [eax+10]
 00475F68    cmp         eax,dword ptr [esp+4]
>00475F6C    jge         00475FC4
 00475F6E    mov         edx,ebx
 00475F70    mov         eax,esi
 00475F72    call        00476054
 00475F77    mov         edx,dword ptr [esp]
 00475F7A    call        00475C74
 00475F7F    mov         edx,ebx
 00475F81    mov         eax,esi
 00475F83    call        00476054
 00475F88    cmp         byte ptr [eax+60],0
>00475F8C    je          00475FC4
 00475F8E    mov         edx,ebx
 00475F90    mov         eax,esi
 00475F92    call        00476054
 00475F97    cmp         dword ptr [eax+10],0
>00475F9B    jle         00475FC4
 00475F9D    mov         edx,ebx
 00475F9F    mov         eax,esi
 00475FA1    call        00476054
 00475FA6    mov         eax,dword ptr [eax+0C]
 00475FA9    cmp         byte ptr [eax+34],0
>00475FAD    jne         00475FC4
 00475FAF    mov         edx,ebx
 00475FB1    mov         eax,esi
 00475FB3    call        00476054
 00475FB8    mov         ecx,dword ptr [eax+10]
 00475FBB    mov         eax,1
 00475FC0    shl         eax,cl
 00475FC2    or          ebp,eax
 00475FC4    inc         ebx
 00475FC5    dec         edi
>00475FC6    jne         00475F5C
 00475FC8    test        ebp,ebp
>00475FCA    jbe         00475FD3
 00475FCC    mov         eax,ebp
 00475FCE    call        0046AA28
 00475FD3    pop         ecx
 00475FD4    pop         edx
 00475FD5    pop         ebp
 00475FD6    pop         edi
 00475FD7    pop         esi
 00475FD8    pop         ebx
 00475FD9    ret
end;*}

//00475FDC
{*procedure sub_00475FDC(?:?; ?:?);
begin
 00475FDC    push        ebx
 00475FDD    push        esi
 00475FDE    push        edi
 00475FDF    push        ebp
 00475FE0    mov         ebp,edx
 00475FE2    mov         edi,eax
 00475FE4    mov         eax,[005AE588];^gvar_005E0CE2
 00475FE9    cmp         byte ptr [eax],0
>00475FEC    je          00476013
 00475FEE    mov         eax,edi
 00475FF0    call        TCollection.GetCount
 00475FF5    mov         ebx,eax
 00475FF7    dec         ebx
 00475FF8    test        ebx,ebx
>00475FFA    jl          00476013
 00475FFC    inc         ebx
 00475FFD    xor         esi,esi
 00475FFF    mov         edx,esi
 00476001    mov         eax,edi
 00476003    call        00476054
 00476008    mov         edx,ebp
 0047600A    call        00475D20
 0047600F    inc         esi
 00476010    dec         ebx
>00476011    jne         00475FFF
 00476013    pop         ebp
 00476014    pop         edi
 00476015    pop         esi
 00476016    pop         ebx
 00476017    ret
end;*}

//00476018
{*function sub_00476018(?:?):?;
begin
 00476018    push        ebx
 00476019    mov         ebx,eax
 0047601B    mov         eax,ebx
 0047601D    call        TCollection.Add
 00476022    pop         ebx
 00476023    ret
end;*}

//00476024
{*procedure sub_00476024(?:?);
begin
 00476024    push        ebx
 00476025    push        esi
 00476026    push        edi
 00476027    mov         edi,eax
 00476029    mov         eax,edi
 0047602B    call        TCollection.GetCount
 00476030    mov         ebx,eax
 00476032    dec         ebx
 00476033    test        ebx,ebx
>00476035    jl          0047604C
 00476037    inc         ebx
 00476038    xor         esi,esi
 0047603A    mov         edx,esi
 0047603C    mov         eax,edi
 0047603E    call        00476054
 00476043    call        00475E58
 00476048    inc         esi
 00476049    dec         ebx
>0047604A    jne         0047603A
 0047604C    pop         edi
 0047604D    pop         esi
 0047604E    pop         ebx
 0047604F    ret
end;*}

//00476050
procedure TGLTextureEx.sub_0041ADA4;
begin
{*
 00476050    mov         eax,dword ptr [eax+18];TGLTextureEx.?f18:dword
 00476053    ret
*}
end;

//00476054
{*function sub_00476054(?:?; ?:?):?;
begin
 00476054    push        ebx
 00476055    push        esi
 00476056    mov         esi,edx
 00476058    mov         ebx,eax
 0047605A    mov         edx,esi
 0047605C    mov         eax,ebx
 0047605E    call        TCollection.GetItem
 00476063    pop         esi
 00476064    pop         ebx
 00476065    ret
end;*}

//00476068
{*function sub_00476068(?:?; ?:?):?;
begin
 00476068    push        ebx
 00476069    push        esi
 0047606A    push        edi
 0047606B    push        ebp
 0047606C    push        ecx
 0047606D    mov         dword ptr [esp],edx
 00476070    mov         edi,eax
 00476072    xor         ebx,ebx
 00476074    test        edi,edi
>00476076    je          004760BF
 00476078    mov         eax,edi
 0047607A    call        TCollection.GetCount
 0047607F    mov         esi,eax
 00476081    dec         esi
 00476082    test        esi,esi
>00476084    jl          004760BF
 00476086    inc         esi
 00476087    xor         ebp,ebp
 00476089    mov         edx,ebp
 0047608B    mov         eax,edi
 0047608D    call        00476054
 00476092    mov         eax,dword ptr [eax+10]
 00476095    cmp         eax,dword ptr [esp]
>00476098    jne         004760BB
 0047609A    test        bl,bl
>0047609C    jne         004760B7
 0047609E    mov         edx,ebp
 004760A0    mov         eax,edi
 004760A2    call        00476054
 004760A7    mov         eax,dword ptr [eax+0C]
 004760AA    call        00474A7C
 004760AF    test        al,al
>004760B1    jne         004760B7
 004760B3    xor         eax,eax
>004760B5    jmp         004760B9
 004760B7    mov         al,1
 004760B9    mov         ebx,eax
 004760BB    inc         ebp
 004760BC    dec         esi
>004760BD    jne         00476089
 004760BF    mov         eax,ebx
 004760C1    pop         edx
 004760C2    pop         ebp
 004760C3    pop         edi
 004760C4    pop         esi
 004760C5    pop         ebx
 004760C6    ret
end;*}

//004760C8
constructor TGLMaterial.Create;
begin
{*
 004760C8    push        ebx
 004760C9    push        esi
 004760CA    test        dl,dl
>004760CC    je          004760D6
 004760CE    add         esp,0FFFFFFF0
 004760D1    call        @ClassCreate
 004760D6    mov         ebx,edx
 004760D8    mov         esi,eax
 004760DA    xor         edx,edx
 004760DC    mov         eax,esi
 004760DE    call        0046B394
 004760E3    mov         ecx,esi
 004760E5    mov         dl,1
 004760E7    mov         eax,[00471E24];TGLFaceProperties
 004760EC    call        TGLFaceProperties.Create;TGLFaceProperties.Create
 004760F1    mov         dword ptr [esi+18],eax;TGLMaterial.FrontProperties:TGLFaceProperties
 004760F4    xor         eax,eax
 004760F6    mov         dword ptr [esi+24],eax;TGLMaterial.?f24:TGLTexture
 004760F9    mov         byte ptr [esi+35],0;TGLMaterial.FaceCulling:TFaceCulling
 004760FD    mov         eax,esi
 004760FF    test        bl,bl
>00476101    je          00476112
 00476103    call        @AfterConstruction
 00476108    pop         dword ptr fs:[0]
 0047610F    add         esp,0C
 00476112    mov         eax,esi
 00476114    pop         esi
 00476115    pop         ebx
 00476116    ret
*}
end;

//00476118
destructor TGLMaterial.Destroy;
begin
{*
 00476118    push        ebx
 00476119    push        esi
 0047611A    call        @BeforeDestruction
 0047611F    mov         ebx,edx
 00476121    mov         esi,eax
 00476123    mov         eax,dword ptr [esi+38];TGLMaterial.?f38:dword
 00476126    test        eax,eax
>00476128    je          00476131
 0047612A    mov         edx,esi
 0047612C    call        00476EE8
 00476131    mov         eax,dword ptr [esi+1C];TGLMaterial.?f1C:TGLFaceProperties
 00476134    call        TObject.Free
 00476139    mov         eax,dword ptr [esi+18];TGLMaterial.FrontProperties:TGLFaceProperties
 0047613C    call        TObject.Free
 00476141    mov         eax,dword ptr [esi+24];TGLMaterial.?f24:TGLTexture
 00476144    call        TObject.Free
 00476149    mov         eax,dword ptr [esi+28];TGLMaterial.?f28:TGLTextureEx
 0047614C    call        TObject.Free
 00476151    mov         edx,ebx
 00476153    and         dl,0FC
 00476156    mov         eax,esi
 00476158    call        TMemoryStream.Destroy
 0047615D    test        bl,bl
>0047615F    jle         00476168
 00476161    mov         eax,esi
 00476163    call        @ClassDestroy
 00476168    pop         esi
 00476169    pop         ebx
 0047616A    ret
*}
end;

//0047616C
procedure TGLMaterial.SetBackProperties(Value:TGLFaceProperties);
begin
{*
 0047616C    push        ebx
 0047616D    push        esi
 0047616E    mov         esi,edx
 00476170    mov         ebx,eax
 00476172    mov         eax,ebx
 00476174    call        TGLMaterial.GetBackProperties
 00476179    mov         edx,esi
 0047617B    mov         ecx,dword ptr [eax]
 0047617D    call        dword ptr [ecx+8]
 00476180    mov         edx,ebx
 00476182    mov         eax,ebx
 00476184    mov         ecx,dword ptr [eax]
 00476186    call        dword ptr [ecx+10];TGLMaterial.sub_004768CC
 00476189    pop         esi
 0047618A    pop         ebx
 0047618B    ret
*}
end;

//0047618C
{*function TGLMaterial.GetBackProperties:?;
begin
 0047618C    push        ebx
 0047618D    mov         ebx,eax
 0047618F    cmp         dword ptr [ebx+1C],0;TGLMaterial.?f1C:TGLFaceProperties
>00476193    jne         004761A6
 00476195    mov         ecx,ebx
 00476197    mov         dl,1
 00476199    mov         eax,[00471E24];TGLFaceProperties
 0047619E    call        TGLFaceProperties.Create;TGLFaceProperties.Create
 004761A3    mov         dword ptr [ebx+1C],eax;TGLMaterial.?f1C:TGLFaceProperties
 004761A6    mov         eax,dword ptr [ebx+1C];TGLMaterial.?f1C:TGLFaceProperties
 004761A9    pop         ebx
 004761AA    ret
end;*}

//004761AC
procedure TGLMaterial.SetFrontProperties(Value:TGLFaceProperties);
begin
{*
 004761AC    push        esi
 004761AD    mov         esi,eax
 004761AF    mov         eax,dword ptr [esi+18];TGLMaterial.FrontProperties:TGLFaceProperties
 004761B2    mov         ecx,dword ptr [eax]
 004761B4    call        dword ptr [ecx+8];TGLFaceProperties.Assign
 004761B7    mov         edx,esi
 004761B9    mov         eax,esi
 004761BB    mov         ecx,dword ptr [eax]
 004761BD    call        dword ptr [ecx+10];TGLMaterial.sub_004768CC
 004761C0    pop         esi
 004761C1    ret
*}
end;

//004761C4
procedure TGLMaterial.SetBlendingMode(Value:TBlendingMode);
begin
{*
 004761C4    cmp         dl,byte ptr [eax+20];TGLMaterial.BlendingMode:TBlendingMode
>004761C7    je          004761D3
 004761C9    mov         byte ptr [eax+20],dl;TGLMaterial.BlendingMode:TBlendingMode
 004761CC    mov         edx,eax
 004761CE    mov         ecx,dword ptr [eax]
 004761D0    call        dword ptr [ecx+10];TGLMaterial.sub_004768CC
 004761D3    ret
*}
end;

//004761D4
procedure TGLMaterial.SetMaterialOptions(Value:TMaterialOptions);
begin
{*
 004761D4    push        ebx
 004761D5    push        ecx
 004761D6    mov         byte ptr [esp],dl
 004761D9    mov         ebx,eax
 004761DB    mov         al,byte ptr [ebx+34];TGLMaterial.MaterialOptions:TMaterialOptions
 004761DE    cmp         al,byte ptr [esp]
>004761E1    je          004761F2
 004761E3    mov         al,byte ptr [esp]
 004761E6    mov         byte ptr [ebx+34],al;TGLMaterial.MaterialOptions:TMaterialOptions
 004761E9    mov         edx,ebx
 004761EB    mov         eax,ebx
 004761ED    mov         ecx,dword ptr [eax]
 004761EF    call        dword ptr [ecx+10];TGLMaterial.sub_004768CC
 004761F2    pop         edx
 004761F3    pop         ebx
 004761F4    ret
*}
end;

//004761F8
{*function TGLMaterial.GetTexture:?;
begin
 004761F8    push        ebx
 004761F9    mov         ebx,eax
 004761FB    cmp         dword ptr [ebx+24],0;TGLMaterial.?f24:TGLTexture
>004761FF    jne         00476212
 00476201    mov         ecx,ebx
 00476203    mov         dl,1
 00476205    mov         eax,[00471868];TGLTexture
 0047620A    call        TGLTexture.Create;TGLTexture.Create
 0047620F    mov         dword ptr [ebx+24],eax;TGLMaterial.?f24:TGLTexture
 00476212    mov         eax,dword ptr [ebx+24];TGLMaterial.?f24:TGLTexture
 00476215    pop         ebx
 00476216    ret
end;*}

//00476218
procedure TGLMaterial.SetTexture(Value:TGLTexture);
begin
{*
 00476218    push        ebx
 00476219    push        esi
 0047621A    mov         esi,edx
 0047621C    mov         ebx,eax
 0047621E    test        esi,esi
>00476220    je          00476233
 00476222    mov         eax,ebx
 00476224    call        TGLMaterial.GetTexture
 00476229    mov         edx,esi
 0047622B    mov         ecx,dword ptr [eax]
 0047622D    call        dword ptr [ecx+8]
 00476230    pop         esi
 00476231    pop         ebx
 00476232    ret
 00476233    lea         eax,[ebx+24];TGLMaterial.?f24:TGLTexture
 00476236    call        FreeAndNil
 0047623B    pop         esi
 0047623C    pop         ebx
 0047623D    ret
*}
end;

//00476240
procedure TGLMaterial.SetFaceCulling(Value:TFaceCulling);
begin
{*
 00476240    cmp         dl,byte ptr [eax+35];TGLMaterial.FaceCulling:TFaceCulling
>00476243    je          0047624F
 00476245    mov         byte ptr [eax+35],dl;TGLMaterial.FaceCulling:TFaceCulling
 00476248    mov         edx,eax
 0047624A    mov         ecx,dword ptr [eax]
 0047624C    call        dword ptr [ecx+10];TGLMaterial.sub_004768CC
 0047624F    ret
*}
end;

//00476250
procedure TGLMaterial.SetMaterialLibrary(Value:TGLMaterialLibrary);
begin
{*
 00476250    mov         dword ptr [eax+2C],edx;TGLMaterial.MaterialLibrary:TGLMaterialLibrary
 00476253    mov         edx,dword ptr [eax+30];TGLMaterial.LibMaterialName:String
 00476256    call        TGLMaterial.SetLibMaterialName
 0047625B    ret
*}
end;

//0047625C
{*function sub_0047625C(?:?):Boolean;
begin
 0047625C    push        ebx
 0047625D    xor         ebx,ebx
>0047625F    jmp         0047627C
 00476261    mov         eax,dword ptr [eax+18]
 00476264    mov         edx,dword ptr [eax+2C]
 00476267    test        edx,edx
>00476269    je          00476279
 0047626B    mov         edx,dword ptr [edx+34]
 0047626E    mov         eax,dword ptr [eax+30]
 00476271    xchg        eax,edx
 00476272    call        004776DC
>00476277    jmp         0047627B
 00476279    xor         eax,eax
 0047627B    inc         ebx
 0047627C    test        eax,eax
>0047627E    je          00476285
 00476280    cmp         ebx,10
>00476283    jl          00476261
 00476285    cmp         ebx,10
 00476288    setge       al
 0047628B    pop         ebx
 0047628C    ret
end;*}

//00476290
procedure TGLMaterial.SetLibMaterialName(Value:AnsiString);
begin
{*
 00476290    push        ebx
 00476291    push        esi
 00476292    push        edi
 00476293    mov         edi,edx
 00476295    mov         ebx,eax
 00476297    mov         eax,dword ptr [ebx+2C];TGLMaterial.MaterialLibrary:TGLMaterialLibrary
 0047629A    test        eax,eax
>0047629C    je          004762AC
 0047629E    mov         eax,dword ptr [eax+34];TGLMaterialLibrary.Materials:TGLLibMaterials
 004762A1    mov         edx,edi
 004762A3    call        004776DC
 004762A8    mov         esi,eax
>004762AA    jmp         004762AE
 004762AC    xor         esi,esi
 004762AE    mov         eax,esi
 004762B0    call        0047625C
 004762B5    test        al,al
>004762B7    je          004762CD
 004762B9    mov         ecx,1164
 004762BE    mov         edx,476310;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 004762C3    mov         eax,47634C;'Error: Cyclic material reference detected!'
 004762C8    call        @Assert
 004762CD    lea         eax,[ebx+30];TGLMaterial.LibMaterialName:String
 004762D0    mov         edx,edi
 004762D2    call        @LStrAsg
 004762D7    mov         eax,dword ptr [ebx+38];TGLMaterial.?f38:dword
 004762DA    cmp         esi,eax
>004762DC    je          00476302
 004762DE    test        eax,eax
>004762E0    je          004762E9
 004762E2    mov         edx,ebx
 004762E4    call        00476EE8
 004762E9    mov         eax,esi
 004762EB    mov         dword ptr [ebx+38],eax;TGLMaterial.?f38:dword
 004762EE    test        eax,eax
>004762F0    je          004762F9
 004762F2    mov         edx,ebx
 004762F4    call        00476E58
 004762F9    mov         edx,ebx
 004762FB    mov         eax,ebx
 004762FD    call        00476910
 00476302    pop         edi
 00476303    pop         esi
 00476304    pop         ebx
 00476305    ret
*}
end;

//00476378
{*function TGLMaterial.GetTextureEx:?;
begin
 00476378    push        ebx
 00476379    mov         ebx,eax
 0047637B    cmp         dword ptr [ebx+28],0;TGLMaterial.?f28:TGLTextureEx
>0047637F    jne         00476392
 00476381    mov         ecx,ebx
 00476383    mov         dl,1
 00476385    mov         eax,[00471D10];TGLTextureEx
 0047638A    call        TGLTextureEx.Create;TGLTextureEx.Create
 0047638F    mov         dword ptr [ebx+28],eax;TGLMaterial.?f28:TGLTextureEx
 00476392    mov         eax,dword ptr [ebx+28];TGLMaterial.?f28:TGLTextureEx
 00476395    pop         ebx
 00476396    ret
end;*}

//00476398
procedure TGLMaterial.SetTextureEx(Value:TGLTextureEx);
begin
{*
 00476398    push        ebx
 00476399    push        esi
 0047639A    mov         esi,edx
 0047639C    mov         ebx,eax
 0047639E    test        esi,esi
>004763A0    jne         004763A8
 004763A2    cmp         dword ptr [ebx+28],0;TGLMaterial.?f28:TGLTextureEx
>004763A6    je          004763B6
 004763A8    mov         eax,ebx
 004763AA    call        TGLMaterial.GetTextureEx
 004763AF    mov         edx,esi
 004763B1    mov         ecx,dword ptr [eax]
 004763B3    call        dword ptr [ecx+8]
 004763B6    pop         esi
 004763B7    pop         ebx
 004763B8    ret
*}
end;

//004763BC
function TGLMaterial.IsStoredTextureEx(Value:TGLTextureEx):Boolean;
begin
{*
 004763BC    push        ebx
 004763BD    mov         ebx,eax
 004763BF    cmp         dword ptr [ebx+28],0;TGLMaterial.?f28:TGLTextureEx
>004763C3    je          004763D5
 004763C5    mov         eax,ebx
 004763C7    call        TGLMaterial.GetTextureEx
 004763CC    call        TCollection.GetCount
 004763D1    test        eax,eax
>004763D3    jg          004763D9
 004763D5    xor         eax,eax
 004763D7    pop         ebx
 004763D8    ret
 004763D9    mov         al,1
 004763DB    pop         ebx
 004763DC    ret
*}
end;

//004763E0
procedure sub_004763E0(?:Pointer);
begin
{*
 004763E0    push        ebx
 004763E1    mov         ebx,eax
 004763E3    xor         eax,eax
 004763E5    mov         dword ptr [ebx+2C],eax
 004763E8    lea         eax,[ebx+30]
 004763EB    call        @LStrClr
 004763F0    xor         eax,eax
 004763F2    mov         dword ptr [ebx+38],eax
 004763F5    pop         ebx
 004763F6    ret
*}
end;

//004763F8
procedure sub_004763F8(?:TGLMaterial);
begin
{*
 004763F8    push        ebx
 004763F9    mov         ebx,eax
 004763FB    cmp         dword ptr [ebx+28],0
>004763FF    je          0047640D
 00476401    mov         eax,ebx
 00476403    call        TGLMaterial.GetTextureEx
 00476408    call        00476024
 0047640D    pop         ebx
 0047640E    ret
*}
end;

//00476410
procedure TGLMaterial.IsStoredBackProperties(Value:TGLFaceProperties);
begin
{*
 00476410    cmp         dword ptr [eax+38],0;TGLMaterial.?f38:dword
 00476414    setne       al
 00476417    xor         al,1
 00476419    ret
*}
end;

//0047641C
{*procedure sub_0047641C(?:?);
begin
 0047641C    mov         edx,dword ptr [eax+24]
 0047641F    test        edx,edx
>00476421    je          00476430
 00476423    cmp         byte ptr [edx+22],0
>00476427    jne         00476430
 00476429    mov         eax,edx
 0047642B    call        00474C3C
 00476430    ret
end;*}

//00476434
{*procedure sub_00476434(?:TGLMaterial; ?:?);
begin
 00476434    push        ebx
 00476435    push        esi
 00476436    mov         esi,edx
 00476438    mov         ebx,eax
 0047643A    mov         eax,dword ptr [ebx+38]
 0047643D    test        eax,eax
>0047643F    je          0047644B
 00476441    mov         edx,esi
 00476443    call        00476C34
 00476448    pop         esi
 00476449    pop         ebx
 0047644A    ret
 0047644B    test        byte ptr [ebx+34],2
>0047644F    je          00476467
 00476451    mov         eax,dword ptr [esi+5C]
 00476454    test        byte ptr [eax+8D],1
>0047645B    je          00476467
 0047645D    mov         dl,8
 0047645F    call        0046D634
 00476464    inc         dword ptr [esi+54]
 00476467    mov         eax,dword ptr [esi+5C]
 0047646A    test        byte ptr [eax+8D],1
>00476471    je          00476484
 00476473    mov         edx,esi
 00476475    mov         ecx,404
 0047647A    mov         eax,dword ptr [ebx+18]
 0047647D    call        00472D84
>00476482    jmp         00476493
 00476484    mov         edx,esi
 00476486    mov         ecx,404
 0047648B    mov         eax,dword ptr [ebx+18]
 0047648E    call        00472DD4
 00476493    mov         eax,dword ptr [esi+5C]
 00476496    test        byte ptr [eax+8C],10
>0047649D    je          00476511
 0047649F    mov         dl,byte ptr [ebx+35]
 004764A2    sub         dl,1
>004764A5    jb          004764B3
>004764A7    je          0047657A
 004764AD    dec         dl
>004764AF    je          004764DF
>004764B1    jmp         004764FB
 004764B3    cmp         byte ptr [esi+0F8],0
>004764BA    jne         0047657A
 004764C0    mov         dl,4
 004764C2    call        0046D634
 004764C7    mov         eax,ebx
 004764C9    call        TGLMaterial.GetBackProperties
 004764CE    mov         edx,esi
 004764D0    mov         ecx,405
 004764D5    call        00472D84
>004764DA    jmp         0047657A
 004764DF    mov         dl,4
 004764E1    call        0046D634
 004764E6    mov         eax,ebx
 004764E8    call        TGLMaterial.GetBackProperties
 004764ED    mov         edx,esi
 004764EF    mov         ecx,405
 004764F4    call        00472D84
>004764F9    jmp         0047657A
 004764FB    mov         ecx,11CB
 00476500    mov         edx,476710;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00476505    mov         eax,47674C;'Assertion failure'
 0047650A    call        @Assert
>0047650F    jmp         0047657A
 00476511    mov         dl,byte ptr [ebx+35]
 00476514    sub         dl,1
>00476517    jb          00476521
>00476519    je          00476548
 0047651B    dec         dl
>0047651D    je          00476551
>0047651F    jmp         00476566
 00476521    cmp         byte ptr [esi+0F8],0
>00476528    je          00476533
 0047652A    mov         dl,4
 0047652C    call        0046D5F8
>00476531    jmp         0047657A
 00476533    mov         eax,ebx
 00476535    call        TGLMaterial.GetBackProperties
 0047653A    mov         edx,esi
 0047653C    mov         ecx,405
 00476541    call        00472D84
>00476546    jmp         0047657A
 00476548    mov         dl,4
 0047654A    call        0046D5F8
>0047654F    jmp         0047657A
 00476551    mov         eax,ebx
 00476553    call        TGLMaterial.GetBackProperties
 00476558    mov         edx,esi
 0047655A    mov         ecx,405
 0047655F    call        00472D84
>00476564    jmp         0047657A
 00476566    mov         ecx,11D8
 0047656B    mov         edx,476710;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00476570    mov         eax,47674C;'Assertion failure'
 00476575    call        @Assert
 0047657A    cmp         byte ptr [esi+0FB],0
>00476581    jne         0047669A
 00476587    xor         eax,eax
 00476589    mov         al,byte ptr [ebx+20]
 0047658C    cmp         eax,5
>0047658F    ja          00476686
 00476595    jmp         dword ptr [eax*4+47659C]
 00476595    dd          004765B4
 00476595    dd          004765CD
 00476595    dd          004765F5
 00476595    dd          0047661A
 00476595    dd          0047663F
 00476595    dd          00476664
 004765B4    mov         eax,dword ptr [esi+5C]
 004765B7    mov         dl,2
 004765B9    call        0046D634
 004765BE    mov         eax,dword ptr [esi+5C]
 004765C1    xor         edx,edx
 004765C3    call        0046D634
>004765C8    jmp         0047669A
 004765CD    mov         eax,dword ptr [esi+5C]
 004765D0    mov         dl,2
 004765D2    call        0046D5F8
 004765D7    mov         eax,dword ptr [esi+5C]
 004765DA    xor         edx,edx
 004765DC    call        0046D5F8
 004765E1    push        303
 004765E6    push        302
 004765EB    call        OpenGL32.glBlendFunc
>004765F0    jmp         0047669A
 004765F5    mov         eax,dword ptr [esi+5C]
 004765F8    mov         dl,2
 004765FA    call        0046D5F8
 004765FF    mov         eax,dword ptr [esi+5C]
 00476602    xor         edx,edx
 00476604    call        0046D5F8
 00476609    push        1
 0047660B    push        302
 00476610    call        OpenGL32.glBlendFunc
>00476615    jmp         0047669A
 0047661A    mov         eax,dword ptr [esi+5C]
 0047661D    mov         dl,2
 0047661F    call        0046D634
 00476624    mov         eax,dword ptr [esi+5C]
 00476627    xor         edx,edx
 00476629    call        0046D5F8
 0047662E    push        3F000000
 00476633    push        206
 00476638    call        OpenGL32.glAlphaFunc
>0047663D    jmp         0047669A
 0047663F    mov         eax,dword ptr [esi+5C]
 00476642    mov         dl,2
 00476644    call        0046D634
 00476649    mov         eax,dword ptr [esi+5C]
 0047664C    xor         edx,edx
 0047664E    call        0046D5F8
 00476653    push        3F800000
 00476658    push        206
 0047665D    call        OpenGL32.glAlphaFunc
>00476662    jmp         0047669A
 00476664    mov         eax,dword ptr [esi+5C]
 00476667    mov         dl,2
 00476669    call        0046D5F8
 0047666E    mov         eax,dword ptr [esi+5C]
 00476671    xor         edx,edx
 00476673    call        0046D5F8
 00476678    push        0
 0047667A    push        306
 0047667F    call        OpenGL32.glBlendFunc
>00476684    jmp         0047669A
 00476686    mov         ecx,11FB
 0047668B    mov         edx,476710;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00476690    mov         eax,47674C;'Assertion failure'
 00476695    call        @Assert
 0047669A    test        byte ptr [ebx+34],1
>0047669E    je          004766B6
 004766A0    mov         eax,dword ptr [esi+5C]
 004766A3    test        byte ptr [eax+8C],80
>004766AA    je          004766B6
 004766AC    mov         dl,7
 004766AE    call        0046D634
 004766B3    inc         dword ptr [esi+50]
 004766B6    cmp         dword ptr [ebx+28],0
>004766BA    jne         004766CC
 004766BC    mov         eax,dword ptr [ebx+24]
 004766BF    test        eax,eax
>004766C1    je          00476702
 004766C3    mov         edx,esi
 004766C5    call        00474F08
>004766CA    jmp         00476702
 004766CC    cmp         dword ptr [ebx+24],0
>004766D0    je          004766EC
 004766D2    xor         edx,edx
 004766D4    mov         eax,dword ptr [ebx+28]
 004766D7    call        00476068
 004766DC    test        al,al
>004766DE    jne         004766EC
 004766E0    mov         edx,esi
 004766E2    mov         eax,dword ptr [ebx+24]
 004766E5    call        00474F08
>004766EA    jmp         00476702
 004766EC    mov         eax,dword ptr [ebx+28]
 004766EF    call        TCollection.GetCount
 004766F4    test        eax,eax
>004766F6    jle         00476702
 004766F8    mov         edx,esi
 004766FA    mov         eax,dword ptr [ebx+28]
 004766FD    call        00475F20
 00476702    pop         esi
 00476703    pop         ebx
 00476704    ret
end;*}

//00476760
{*function sub_00476760(?:TGLMaterial; ?:?):?;
begin
 00476760    push        ebx
 00476761    push        esi
 00476762    push        edi
 00476763    mov         esi,edx
 00476765    mov         ebx,eax
 00476767    mov         eax,dword ptr [ebx+38]
 0047676A    test        eax,eax
>0047676C    je          0047677A
 0047676E    mov         edx,esi
 00476770    call        00476DB0
>00476775    jmp         00476804
 0047677A    mov         al,byte ptr [ebx+20]
 0047677D    add         al,0FD
 0047677F    sub         al,2
>00476781    jae         0047678F
 00476783    push        0
 00476785    push        204
 0047678A    call        OpenGL32.glAlphaFunc
 0047678F    test        byte ptr [ebx+34],2
>00476793    je          004767AE
 00476795    cmp         dword ptr [esi+54],0
>00476799    jle         004767AE
 0047679B    dec         dword ptr [esi+54]
 0047679E    cmp         dword ptr [esi+54],0
>004767A2    jne         004767AE
 004767A4    mov         eax,dword ptr [esi+5C]
 004767A7    mov         dl,8
 004767A9    call        0046D5F8
 004767AE    test        byte ptr [ebx+34],1
>004767B2    je          004767CD
 004767B4    cmp         dword ptr [esi+50],0
>004767B8    jle         004767CD
 004767BA    dec         dword ptr [esi+50]
 004767BD    cmp         dword ptr [esi+50],0
>004767C1    jne         004767CD
 004767C3    mov         eax,dword ptr [esi+5C]
 004767C6    mov         dl,7
 004767C8    call        0046D5F8
 004767CD    mov         edi,dword ptr [ebx+24]
 004767D0    test        edi,edi
>004767D2    je          004767F4
 004767D4    cmp         byte ptr [edi+22],0
>004767D8    jne         004767F4
 004767DA    xor         edx,edx
 004767DC    mov         eax,dword ptr [ebx+28]
 004767DF    call        00476068
 004767E4    test        al,al
>004767E6    jne         004767F4
 004767E8    mov         edx,esi
 004767EA    mov         eax,dword ptr [ebx+24]
 004767ED    call        00475190
>004767F2    jmp         00476802
 004767F4    mov         eax,dword ptr [ebx+28]
 004767F7    test        eax,eax
>004767F9    je          00476802
 004767FB    mov         edx,esi
 004767FD    call        00475FDC
 00476802    xor         eax,eax
 00476804    pop         edi
 00476805    pop         esi
 00476806    pop         ebx
 00476807    ret
end;*}

//00476808
procedure TGLMaterial.Assign(Source:TPersistent);
begin
{*
 00476808    push        ebx
 00476809    push        esi
 0047680A    push        edi
 0047680B    mov         ebx,edx
 0047680D    mov         esi,eax
 0047680F    test        ebx,ebx
>00476811    je          004768BF
 00476817    mov         eax,ebx
 00476819    mov         edx,dword ptr ds:[4720C4];TGLMaterial
 0047681F    call        @IsClass
 00476824    test        al,al
>00476826    je          004768BF
 0047682C    mov         edi,ebx
 0047682E    cmp         dword ptr [edi+1C],0
>00476832    je          0047684B
 00476834    mov         eax,edi
 00476836    call        TGLMaterial.GetBackProperties
 0047683B    push        eax
 0047683C    mov         eax,esi
 0047683E    call        TGLMaterial.GetBackProperties
 00476843    pop         edx
 00476844    mov         ecx,dword ptr [eax]
 00476846    call        dword ptr [ecx+8]
>00476849    jmp         00476853
 0047684B    lea         eax,[esi+1C];TGLMaterial.?f1C:TGLFaceProperties
 0047684E    call        FreeAndNil
 00476853    mov         edx,dword ptr [edi+18]
 00476856    mov         eax,dword ptr [esi+18];TGLMaterial.FrontProperties:TGLFaceProperties
 00476859    mov         ecx,dword ptr [eax]
 0047685B    call        dword ptr [ecx+8];TGLFaceProperties.Assign
 0047685E    mov         al,byte ptr [edi+20]
 00476861    mov         byte ptr [esi+20],al;TGLMaterial.BlendingMode:TBlendingMode
 00476864    mov         al,byte ptr [edi+34]
 00476867    mov         byte ptr [esi+34],al;TGLMaterial.MaterialOptions:TMaterialOptions
 0047686A    cmp         dword ptr [edi+24],0
>0047686E    je          00476881
 00476870    mov         eax,esi
 00476872    call        TGLMaterial.GetTexture
 00476877    mov         edx,dword ptr [edi+24]
 0047687A    mov         ecx,dword ptr [eax]
 0047687C    call        dword ptr [ecx+8]
>0047687F    jmp         00476889
 00476881    lea         eax,[esi+24];TGLMaterial.?f24:TGLTexture
 00476884    call        FreeAndNil
 00476889    mov         al,byte ptr [edi+35]
 0047688C    mov         byte ptr [esi+35],al;TGLMaterial.FaceCulling:TFaceCulling
 0047688F    mov         eax,dword ptr [edi+2C]
 00476892    mov         dword ptr [esi+2C],eax;TGLMaterial.MaterialLibrary:TGLMaterialLibrary
 00476895    mov         edx,dword ptr [edi+30]
 00476898    mov         eax,esi
 0047689A    call        TGLMaterial.SetLibMaterialName
 0047689F    mov         eax,edi
 004768A1    call        TGLMaterial.GetTextureEx
 004768A6    push        eax
 004768A7    mov         eax,esi
 004768A9    call        TGLMaterial.GetTextureEx
 004768AE    pop         edx
 004768AF    mov         ecx,dword ptr [eax]
 004768B1    call        dword ptr [ecx+8]
 004768B4    mov         edx,esi
 004768B6    mov         eax,esi
 004768B8    mov         ecx,dword ptr [eax]
 004768BA    call        dword ptr [ecx+10];TGLMaterial.sub_004768CC
>004768BD    jmp         004768C8
 004768BF    mov         edx,ebx
 004768C1    mov         eax,esi
 004768C3    call        TPersistent.Assign
 004768C8    pop         edi
 004768C9    pop         esi
 004768CA    pop         ebx
 004768CB    ret
*}
end;

//004768CC
procedure sub_004768CC;
begin
{*
 004768CC    push        ebx
 004768CD    push        esi
 004768CE    mov         ebx,eax
 004768D0    mov         esi,dword ptr [ebx+4];TGLMaterial.?f4:dword
 004768D3    test        esi,esi
>004768D5    je          0047690B
 004768D7    mov         eax,esi
 004768D9    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 004768DF    call        @IsClass
 004768E4    test        al,al
>004768E6    je          004768F3
 004768E8    mov         edx,ebx
 004768EA    mov         eax,esi
 004768EC    mov         ecx,dword ptr [eax]
 004768EE    call        dword ptr [ecx+34]
>004768F1    jmp         0047690B
 004768F3    mov         eax,esi
 004768F5    mov         edx,dword ptr ds:[4722D0];TGLLibMaterial
 004768FB    call        @IsClass
 00476900    test        al,al
>00476902    je          0047690B
 00476904    mov         eax,esi
 00476906    call        00476F90
 0047690B    pop         esi
 0047690C    pop         ebx
 0047690D    ret
*}
end;

//00476910
procedure sub_00476910(?:TGLMaterial);
begin
{*
 00476910    push        ebx
 00476911    push        esi
 00476912    mov         ebx,eax
 00476914    mov         esi,dword ptr [ebx+4];TGLMaterial.?f4:dword
 00476917    test        esi,esi
>00476919    je          00476951
 0047691B    mov         eax,esi
 0047691D    mov         edx,dword ptr ds:[478C24];TGLBaseSceneObject
 00476923    call        @IsClass
 00476928    test        al,al
>0047692A    je          00476939
 0047692C    mov         eax,esi
 0047692E    mov         si,0FFE7
 00476932    call        @CallDynaInst
>00476937    jmp         00476951
 00476939    mov         eax,esi
 0047693B    mov         edx,dword ptr ds:[4722D0];TGLLibMaterial
 00476941    call        @IsClass
 00476946    test        al,al
>00476948    je          00476951
 0047694A    mov         eax,esi
 0047694C    call        004770EC
 00476951    pop         esi
 00476952    pop         ebx
 00476953    ret
*}
end;

//00476954
procedure sub_00476954(?:TGLMaterial);
begin
{*
 00476954    mov         edx,dword ptr [eax+24]
 00476957    test        edx,edx
>00476959    je          00476962
 0047695B    mov         eax,edx
 0047695D    call        004755C8
 00476962    ret
*}
end;

//00476964
{*function sub_00476964(?:TGLMaterial):?;
begin
 00476964    mov         edx,dword ptr [eax+38]
 00476967    test        edx,edx
>00476969    je          00476974
 0047696B    mov         eax,dword ptr [edx+18]
 0047696E    call        00476964
 00476973    ret
 00476974    mov         al,byte ptr [eax+20]
 00476977    test        al,al
>00476979    je          00476985
 0047697B    add         al,0FD
 0047697D    sub         al,2
>0047697F    jb          00476985
 00476981    xor         eax,eax
>00476983    jmp         00476987
 00476985    mov         al,1
 00476987    xor         al,1
 00476989    ret
end;*}

//0047698C
constructor TGLLibMaterial.Create(Collection:TCollection);
begin
{*
 0047698C    push        ebp
 0047698D    mov         ebp,esp
 0047698F    push        0
 00476991    push        ebx
 00476992    push        esi
 00476993    push        edi
 00476994    test        dl,dl
>00476996    je          004769A0
 00476998    add         esp,0FFFFFFF0
 0047699B    call        @ClassCreate
 004769A0    mov         esi,ecx
 004769A2    mov         ebx,edx
 004769A4    mov         edi,eax
 004769A6    xor         eax,eax
 004769A8    push        ebp
 004769A9    push        476A7D
 004769AE    push        dword ptr fs:[eax]
 004769B1    mov         dword ptr fs:[eax],esp
 004769B4    mov         ecx,esi
 004769B6    xor         edx,edx
 004769B8    mov         eax,edi
 004769BA    call        TCollectionItem.Create
 004769BF    mov         dl,1
 004769C1    mov         eax,[00417CEC];TList
 004769C6    call        TObject.Create;TList.Create
 004769CB    mov         dword ptr [edi+0C],eax;TGLLibMaterial.?fC:TList
 004769CE    lea         ecx,[ebp-4]
 004769D1    mov         edx,476AAC;'LibMaterial'
 004769D6    mov         eax,esi
 004769D8    call        0047765C
 004769DD    mov         edx,dword ptr [ebp-4]
 004769E0    lea         eax,[edi+10];TGLLibMaterial.Name:String
 004769E3    call        @LStrAsg
 004769E8    mov         edx,dword ptr [edi+10];TGLLibMaterial.Name:String
 004769EB    mov         eax,dword ptr [edi]
 004769ED    call        0047722C
 004769F2    mov         dword ptr [edi+14],eax;TGLLibMaterial.?f14:dword
 004769F5    mov         ecx,edi
 004769F7    mov         dl,1
 004769F9    mov         eax,[004720C4];TGLMaterial
 004769FE    call        TGLMaterial.Create;TGLMaterial.Create
 00476A03    mov         esi,eax
 00476A05    mov         dword ptr [edi+18],esi;TGLLibMaterial.Material:TGLMaterial
 00476A08    mov         eax,esi
 00476A0A    call        TGLMaterial.GetTexture
 00476A0F    mov         dword ptr [eax+44],edi
 00476A12    mov         dword ptr [eax+40],47744C
 00476A19    mov         eax,[005AE1F8];^gvar_005ACF84
 00476A1E    push        eax
 00476A1F    push        2
 00476A21    mov         ecx,edi
 00476A23    mov         dl,1
 00476A25    mov         eax,[0046AF7C];TGLCoordinates
 00476A2A    call        TGLCoordinates.Create;TGLCoordinates.Create
 00476A2F    mov         esi,eax
 00476A31    mov         dword ptr [edi+1C],esi;TGLLibMaterial.TextureOffset:TGLCoordinates
 00476A34    mov         dword ptr [esi+14],edi;TGLCoordinates.?f14:TGLTextureExItem
 00476A37    mov         dword ptr [esi+10],477444;TGLCoordinates.?f10:?
 00476A3E    mov         eax,[005AE630];^gvar_005ACF64
 00476A43    push        eax
 00476A44    push        2
 00476A46    mov         ecx,edi
 00476A48    mov         dl,1
 00476A4A    mov         eax,[0046AF7C];TGLCoordinates
 00476A4F    call        TGLCoordinates.Create;TGLCoordinates.Create
 00476A54    mov         esi,eax
 00476A56    mov         dword ptr [edi+20],esi;TGLLibMaterial.TextureScale:TGLCoordinates
 00476A59    mov         dword ptr [esi+14],edi;TGLCoordinates.?f14:TGLTextureExItem
 00476A5C    mov         dword ptr [esi+10],477444;TGLCoordinates.?f10:?
 00476A63    mov         byte ptr [edi+24],1;TGLLibMaterial.?f24:byte
 00476A67    xor         eax,eax
 00476A69    pop         edx
 00476A6A    pop         ecx
 00476A6B    pop         ecx
 00476A6C    mov         dword ptr fs:[eax],edx
 00476A6F    push        476A84
 00476A74    lea         eax,[ebp-4]
 00476A77    call        @LStrClr
 00476A7C    ret
>00476A7D    jmp         @HandleFinally
>00476A82    jmp         00476A74
 00476A84    mov         eax,edi
 00476A86    test        bl,bl
>00476A88    je          00476A99
 00476A8A    call        @AfterConstruction
 00476A8F    pop         dword ptr fs:[0]
 00476A96    add         esp,0C
 00476A99    mov         eax,edi
 00476A9B    pop         edi
 00476A9C    pop         esi
 00476A9D    pop         ebx
 00476A9E    pop         ecx
 00476A9F    pop         ebp
 00476AA0    ret
*}
end;

//00476AB8
destructor TGLLibMaterial.Destroy;
begin
{*
 00476AB8    push        ebx
 00476AB9    push        esi
 00476ABA    push        edi
 00476ABB    push        ebp
 00476ABC    push        ecx
 00476ABD    call        @BeforeDestruction
 00476AC2    mov         byte ptr [esp],dl
 00476AC5    mov         esi,eax
 00476AC7    xor         edx,edx
 00476AC9    mov         eax,esi
 00476ACB    call        TGLLibMaterial.SetShader
 00476AD0    xor         edx,edx
 00476AD2    mov         eax,esi
 00476AD4    call        TGLLibMaterial.SetTexture2Name
 00476AD9    mov         eax,dword ptr [esi+0C];TGLLibMaterial.?fC:TList
 00476ADC    mov         edi,dword ptr [eax+8];TList.FCount:Integer
 00476ADF    dec         edi
 00476AE0    test        edi,edi
>00476AE2    jl          00476B2F
 00476AE4    inc         edi
 00476AE5    xor         ebp,ebp
 00476AE7    mov         eax,dword ptr [esi+0C];TGLLibMaterial.?fC:TList
 00476AEA    mov         edx,ebp
 00476AEC    call        TList.Get
 00476AF1    mov         ebx,eax
 00476AF3    mov         eax,ebx
 00476AF5    mov         edx,dword ptr ds:[4720C4];TGLMaterial
 00476AFB    call        @IsClass
 00476B00    test        al,al
>00476B02    je          00476B0D
 00476B04    mov         eax,ebx
 00476B06    call        004763E0
>00476B0B    jmp         00476B2B
 00476B0D    mov         eax,ebx
 00476B0F    mov         edx,dword ptr ds:[4722D0];TGLLibMaterial
 00476B15    call        @IsClass
 00476B1A    test        al,al
>00476B1C    je          00476B2B
 00476B1E    xor         eax,eax
 00476B20    mov         dword ptr [ebx+74],eax
 00476B23    lea         eax,[ebx+68]
 00476B26    call        @LStrClr
 00476B2B    inc         ebp
 00476B2C    dec         edi
>00476B2D    jne         00476AE7
 00476B2F    mov         eax,dword ptr [esi+0C];TGLLibMaterial.?fC:TList
 00476B32    call        TObject.Free
 00476B37    mov         eax,dword ptr [esi+18];TGLLibMaterial.Material:TGLMaterial
 00476B3A    call        TObject.Free
 00476B3F    mov         eax,dword ptr [esi+1C];TGLLibMaterial.TextureOffset:TGLCoordinates
 00476B42    call        TObject.Free
 00476B47    mov         eax,dword ptr [esi+20];TGLLibMaterial.TextureScale:TGLCoordinates
 00476B4A    call        TObject.Free
 00476B4F    mov         dl,byte ptr [esp]
 00476B52    and         dl,0FC
 00476B55    mov         eax,esi
 00476B57    call        TCollectionItem.Destroy
 00476B5C    cmp         byte ptr [esp],0
>00476B60    jle         00476B69
 00476B62    mov         eax,esi
 00476B64    call        @ClassDestroy
 00476B69    pop         edx
 00476B6A    pop         ebp
 00476B6B    pop         edi
 00476B6C    pop         esi
 00476B6D    pop         ebx
 00476B6E    ret
*}
end;

//00476B70
procedure TGLLibMaterial.Assign(Source:TPersistent);
begin
{*
 00476B70    push        ebp
 00476B71    mov         ebp,esp
 00476B73    push        0
 00476B75    push        ebx
 00476B76    push        esi
 00476B77    push        edi
 00476B78    mov         esi,edx
 00476B7A    mov         ebx,eax
 00476B7C    xor         eax,eax
 00476B7E    push        ebp
 00476B7F    push        476C17
 00476B84    push        dword ptr fs:[eax]
 00476B87    mov         dword ptr fs:[eax],esp
 00476B8A    mov         eax,esi
 00476B8C    mov         edx,dword ptr ds:[4722D0];TGLLibMaterial
 00476B92    call        @IsClass
 00476B97    test        al,al
>00476B99    je          00476BF8
 00476B9B    lea         ecx,[ebp-4]
 00476B9E    mov         edi,esi
 00476BA0    mov         edx,dword ptr [edi+10]
 00476BA3    mov         eax,dword ptr [ebx+4];TGLLibMaterial.FCollection:TCollection
 00476BA6    call        0047765C
 00476BAB    mov         edx,dword ptr [ebp-4]
 00476BAE    lea         eax,[ebx+10];TGLLibMaterial.Name:String
 00476BB1    call        @LStrAsg
 00476BB6    mov         edx,dword ptr [ebx+10];TGLLibMaterial.Name:String
 00476BB9    mov         eax,dword ptr [ebx]
 00476BBB    call        0047722C
 00476BC0    mov         dword ptr [ebx+14],eax;TGLLibMaterial.?f14:dword
 00476BC3    mov         edx,dword ptr [edi+18]
 00476BC6    mov         eax,dword ptr [ebx+18];TGLLibMaterial.Material:TGLMaterial
 00476BC9    mov         ecx,dword ptr [eax]
 00476BCB    call        dword ptr [ecx+8];TGLMaterial.Assign
 00476BCE    mov         edx,dword ptr [edi+1C]
 00476BD1    mov         eax,dword ptr [ebx+1C];TGLLibMaterial.TextureOffset:TGLCoordinates
 00476BD4    mov         ecx,dword ptr [eax]
 00476BD6    call        dword ptr [ecx+8];TGLCoordinates.Assign
 00476BD9    mov         edx,dword ptr [edi+20]
 00476BDC    mov         eax,dword ptr [ebx+20];TGLLibMaterial.TextureScale:TGLCoordinates
 00476BDF    mov         ecx,dword ptr [eax]
 00476BE1    call        dword ptr [ecx+8];TGLCoordinates.Assign
 00476BE4    lea         eax,[ebx+68];TGLLibMaterial.Texture2Name:String
 00476BE7    mov         edx,dword ptr [edi+68]
 00476BEA    call        @LStrAsg
 00476BEF    mov         eax,ebx
 00476BF1    call        004773B8
>00476BF6    jmp         00476C01
 00476BF8    mov         edx,esi
 00476BFA    mov         eax,ebx
 00476BFC    call        TPersistent.Assign
 00476C01    xor         eax,eax
 00476C03    pop         edx
 00476C04    pop         ecx
 00476C05    pop         ecx
 00476C06    mov         dword ptr fs:[eax],edx
 00476C09    push        476C1E
 00476C0E    lea         eax,[ebp-4]
 00476C11    call        @LStrClr
 00476C16    ret
>00476C17    jmp         @HandleFinally
>00476C1C    jmp         00476C0E
 00476C1E    pop         edi
 00476C1F    pop         esi
 00476C20    pop         ebx
 00476C21    pop         ecx
 00476C22    pop         ebp
 00476C23    ret
*}
end;

//00476C24
procedure sub_00476C24(?:TCollectionItem);
begin
{*
 00476C24    test        eax,eax
>00476C26    je          00476C30
 00476C28    mov         eax,dword ptr [eax+18]
 00476C2B    call        0047641C
 00476C30    ret
*}
end;

//00476C34
{*procedure sub_00476C34(?:?; ?:?);
begin
 00476C34    push        ebx
 00476C35    push        esi
 00476C36    push        edi
 00476C37    mov         esi,edx
 00476C39    mov         ebx,eax
 00476C3B    call        0046A298
 00476C40    mov         eax,dword ptr [ebx+6C]
 00476C43    test        eax,eax
>00476C45    je          00476C6E
 00476C47    mov         dl,byte ptr [eax+3C]
 00476C4A    sub         dl,1
>00476C4D    jb          00476C55
 00476C4F    dec         dl
>00476C51    je          00476C60
>00476C53    jmp         00476C6E
 00476C55    mov         edx,esi
 00476C57    mov         ecx,ebx
 00476C59    call        00474340
>00476C5E    jmp         00476C6E
 00476C60    mov         edx,esi
 00476C62    mov         ecx,ebx
 00476C64    call        00474340
>00476C69    jmp         00476DAA
 00476C6E    cmp         dword ptr [ebx+68],0
>00476C72    je          00476CD2
 00476C74    mov         eax,[005AE588];^gvar_005E0CE2
 00476C79    cmp         byte ptr [eax],0
>00476C7C    je          00476CD2
 00476C7E    mov         eax,[005AE180];^gvar_005E1341
 00476C83    cmp         byte ptr [eax],0
>00476C86    jne         00476CD2
 00476C88    cmp         dword ptr [ebx+74],0
>00476C8C    jne         00476CB5
 00476C8E    mov         edx,dword ptr [ebx+68]
 00476C91    mov         eax,dword ptr [ebx+4]
 00476C94    call        004776DC
 00476C99    mov         edi,eax
 00476C9B    mov         dword ptr [ebx+74],edi
 00476C9E    test        edi,edi
>00476CA0    je          00476CAD
 00476CA2    mov         edx,ebx
 00476CA4    mov         eax,edi
 00476CA6    call        00476EF4
>00476CAB    jmp         00476CB5
 00476CAD    lea         eax,[ebx+68]
 00476CB0    call        @LStrClr
 00476CB5    mov         edi,dword ptr [ebx+74]
 00476CB8    test        edi,edi
>00476CBA    je          00476CCA
 00476CBC    mov         eax,dword ptr [edi+18]
 00476CBF    call        TGLMaterial.GetTexture
 00476CC4    cmp         byte ptr [eax+22],0
>00476CC8    je          00476CCE
 00476CCA    xor         eax,eax
>00476CCC    jmp         00476CD4
 00476CCE    mov         al,1
>00476CD0    jmp         00476CD4
 00476CD2    xor         eax,eax
 00476CD4    test        al,al
>00476CD6    jne         00476D06
 00476CD8    mov         eax,dword ptr [ebx+18]
 00476CDB    call        TGLMaterial.GetTexture
 00476CE0    cmp         byte ptr [eax+22],0
>00476CE4    jne         00476CF7
 00476CE6    cmp         byte ptr [ebx+24],0
>00476CEA    jne         00476CF7
 00476CEC    lea         edx,[ebx+28]
 00476CEF    mov         eax,dword ptr [esi+5C]
 00476CF2    call        0046D8F8
 00476CF7    mov         edx,esi
 00476CF9    mov         eax,dword ptr [ebx+18]
 00476CFC    call        00476434
>00476D01    jmp         00476D8E
 00476D06    cmp         byte ptr [ebx+24],0
>00476D0A    jne         00476D17
 00476D0C    lea         edx,[ebx+28]
 00476D0F    mov         eax,dword ptr [esi+5C]
 00476D12    call        0046D8F8
 00476D17    mov         edx,esi
 00476D19    mov         eax,dword ptr [ebx+18]
 00476D1C    call        00476434
 00476D21    mov         eax,dword ptr [ebx+74]
 00476D24    mov         eax,dword ptr [eax+18]
 00476D27    call        TGLMaterial.GetTexture
 00476D2C    mov         edx,esi
 00476D2E    mov         ecx,dword ptr [ebx+74]
 00476D31    call        004751F4
 00476D36    mov         eax,dword ptr [ebx+18]
 00476D39    call        TGLMaterial.GetTexture
 00476D3E    cmp         byte ptr [eax+22],0
>00476D42    jne         00476D71
 00476D44    mov         eax,dword ptr [ebx+18]
 00476D47    call        TGLMaterial.GetTexture
 00476D4C    cmp         byte ptr [eax+34],0
>00476D50    jne         00476D71
 00476D52    mov         eax,dword ptr [ebx+74]
 00476D55    mov         eax,dword ptr [eax+18]
 00476D58    call        TGLMaterial.GetTexture
 00476D5D    cmp         byte ptr [eax+34],0
>00476D61    jne         00476D6A
 00476D63    call        0046A684
>00476D68    jmp         00476D8E
 00476D6A    call        0046A47C
>00476D6F    jmp         00476D8E
 00476D71    mov         eax,dword ptr [ebx+74]
 00476D74    mov         eax,dword ptr [eax+18]
 00476D77    call        TGLMaterial.GetTexture
 00476D7C    cmp         byte ptr [eax+34],0
>00476D80    jne         00476D89
 00476D82    call        0046A538
>00476D87    jmp         00476D8E
 00476D89    call        0046A47C
 00476D8E    mov         eax,dword ptr [ebx+6C]
 00476D91    test        eax,eax
>00476D93    je          00476DA5
 00476D95    mov         dl,byte ptr [eax+3C]
 00476D98    dec         dl
>00476D9A    jne         00476DA5
 00476D9C    mov         edx,esi
 00476D9E    mov         ecx,ebx
 00476DA0    call        00474340
 00476DA5    call        0046A2C0
 00476DAA    pop         edi
 00476DAB    pop         esi
 00476DAC    pop         ebx
 00476DAD    ret
end;*}

//00476DB0
{*function sub_00476DB0(?:?; ?:?):?;
begin
 00476DB0    push        ebx
 00476DB1    push        esi
 00476DB2    push        edi
 00476DB3    push        ebp
 00476DB4    mov         edi,edx
 00476DB6    mov         esi,eax
 00476DB8    xor         ebx,ebx
 00476DBA    mov         eax,dword ptr [esi+6C]
 00476DBD    test        eax,eax
>00476DBF    je          00476DE4
 00476DC1    mov         dl,byte ptr [eax+3C]
 00476DC4    dec         dl
>00476DC6    je          00476DCE
 00476DC8    dec         dl
>00476DCA    je          00476DD9
>00476DCC    jmp         00476DE4
 00476DCE    mov         edx,edi
 00476DD0    call        004743F0
 00476DD5    mov         ebx,eax
>00476DD7    jmp         00476DE4
 00476DD9    mov         edx,edi
 00476DDB    call        004743F0
 00476DE0    mov         ebx,eax
>00476DE2    jmp         00476E4E
 00476DE4    test        bl,bl
>00476DE6    jne         00476E4E
 00476DE8    mov         ebp,dword ptr [esi+74]
 00476DEB    test        ebp,ebp
>00476DED    je          00476E10
 00476DEF    mov         eax,[005AE180];^gvar_005E1341
 00476DF4    cmp         byte ptr [eax],0
>00476DF7    jne         00476E10
 00476DF9    mov         eax,dword ptr [ebp+18]
 00476DFC    call        TGLMaterial.GetTexture
 00476E01    mov         edx,edi
 00476E03    mov         ecx,dword ptr [esi+74]
 00476E06    call        00475204
 00476E0B    call        0046A47C
 00476E10    mov         edx,edi
 00476E12    mov         eax,dword ptr [esi+18]
 00476E15    call        00476760
 00476E1A    mov         eax,dword ptr [esi+18]
 00476E1D    call        TGLMaterial.GetTexture
 00476E22    cmp         byte ptr [eax+22],0
>00476E26    jne         00476E36
 00476E28    cmp         byte ptr [esi+24],0
>00476E2C    jne         00476E36
 00476E2E    mov         eax,dword ptr [edi+5C]
 00476E31    call        0046D920
 00476E36    mov         eax,dword ptr [esi+6C]
 00476E39    test        eax,eax
>00476E3B    je          00476E4E
 00476E3D    mov         dl,byte ptr [eax+3C]
 00476E40    sub         dl,1
>00476E43    jae         00476E4E
 00476E45    mov         edx,edi
 00476E47    call        004743F0
 00476E4C    mov         ebx,eax
 00476E4E    mov         eax,ebx
 00476E50    pop         ebp
 00476E51    pop         edi
 00476E52    pop         esi
 00476E53    pop         ebx
 00476E54    ret
end;*}

//00476E58
{*procedure sub_00476E58(?:?; ?:TGLMaterial);
begin
 00476E58    push        ebx
 00476E59    push        esi
 00476E5A    mov         esi,edx
 00476E5C    mov         ebx,eax
 00476E5E    mov         edx,esi
 00476E60    mov         eax,dword ptr [ebx+0C]
 00476E63    call        TList.IndexOf
 00476E68    test        eax,eax
>00476E6A    jl          00476E80
 00476E6C    mov         ecx,133D
 00476E71    mov         edx,476E98;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00476E76    mov         eax,476ED4;'Assertion failure'
 00476E7B    call        @Assert
 00476E80    mov         edx,esi
 00476E82    mov         eax,dword ptr [ebx+0C]
 00476E85    call        TList.Add
 00476E8A    pop         esi
 00476E8B    pop         ebx
 00476E8C    ret
end;*}

//00476EE8
procedure sub_00476EE8(?:dword);
begin
{*
 00476EE8    mov         eax,dword ptr [eax+0C]
 00476EEB    call        TList.Remove
 00476EF0    ret
*}
end;

//00476EF4
{*procedure sub_00476EF4(?:?; ?:?);
begin
 00476EF4    push        ebx
 00476EF5    push        esi
 00476EF6    mov         esi,edx
 00476EF8    mov         ebx,eax
 00476EFA    mov         edx,esi
 00476EFC    mov         eax,dword ptr [ebx+0C]
 00476EFF    call        TList.IndexOf
 00476F04    test        eax,eax
>00476F06    jl          00476F1C
 00476F08    mov         ecx,135B
 00476F0D    mov         edx,476F34;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 00476F12    mov         eax,476F70;'Assertion failure'
 00476F17    call        @Assert
 00476F1C    mov         edx,esi
 00476F1E    mov         eax,dword ptr [ebx+0C]
 00476F21    call        TList.Add
 00476F26    pop         esi
 00476F27    pop         ebx
 00476F28    ret
end;*}

//00476F84
{*procedure sub_00476F84(?:?);
begin
 00476F84    mov         eax,dword ptr [eax+0C]
 00476F87    call        TList.Remove
 00476F8C    ret
end;*}

//00476F90
procedure sub_00476F90(?:Pointer);
begin
{*
 00476F90    push        ebp
 00476F91    mov         ebp,esp
 00476F93    push        ecx
 00476F94    push        ebx
 00476F95    push        esi
 00476F96    push        edi
 00476F97    mov         dword ptr [ebp-4],eax
 00476F9A    mov         eax,dword ptr [ebp-4]
 00476F9D    cmp         byte ptr [eax+70],0
>00476FA1    jne         0047708B
 00476FA7    mov         eax,dword ptr [ebp-4]
 00476FAA    mov         byte ptr [eax+70],1
 00476FAE    xor         eax,eax
 00476FB0    push        ebp
 00476FB1    push        477084
 00476FB6    push        dword ptr fs:[eax]
 00476FB9    mov         dword ptr fs:[eax],esp
 00476FBC    mov         eax,dword ptr [ebp-4]
 00476FBF    mov         eax,dword ptr [eax+0C]
 00476FC2    mov         edi,dword ptr [eax+8]
 00476FC5    dec         edi
 00476FC6    test        edi,edi
>00476FC8    jl          0047706F
 00476FCE    inc         edi
 00476FCF    xor         ebx,ebx
 00476FD1    mov         eax,dword ptr [ebp-4]
 00476FD4    mov         eax,dword ptr [eax+0C]
 00476FD7    mov         edx,ebx
 00476FD9    call        TList.Get
 00476FDE    mov         esi,eax
 00476FE0    mov         eax,esi
 00476FE2    mov         edx,dword ptr ds:[46AD40];TGLUpdateAbleObject
 00476FE8    call        @IsClass
 00476FED    test        al,al
>00476FEF    je          00477008
 00476FF1    mov         eax,dword ptr [ebp-4]
 00476FF4    mov         eax,dword ptr [eax+0C]
 00476FF7    mov         edx,ebx
 00476FF9    call        TList.Get
 00476FFE    mov         edx,dword ptr [ebp-4]
 00477001    mov         ecx,dword ptr [eax]
 00477003    call        dword ptr [ecx+10]
>00477006    jmp         00477067
 00477008    mov         eax,esi
 0047700A    mov         edx,dword ptr ds:[46AEB0];TGLUpdateAbleComponent
 00477010    call        @IsClass
 00477015    test        al,al
>00477017    je          00477030
 00477019    mov         eax,dword ptr [ebp-4]
 0047701C    mov         eax,dword ptr [eax+0C]
 0047701F    mov         edx,ebx
 00477021    call        TList.Get
 00477026    mov         edx,dword ptr [ebp-4]
 00477029    mov         ecx,dword ptr [eax]
 0047702B    call        dword ptr [ecx+34]
>0047702E    jmp         00477067
 00477030    mov         eax,esi
 00477032    mov         edx,dword ptr ds:[4722D0];TGLLibMaterial
 00477038    call        @IsClass
 0047703D    test        al,al
>0047703F    jne         00477055
 00477041    mov         ecx,1377
 00477046    mov         edx,47709C;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 0047704B    mov         eax,4770D8;'Assertion failure'
 00477050    call        @Assert
 00477055    mov         eax,dword ptr [ebp-4]
 00477058    mov         eax,dword ptr [eax+0C]
 0047705B    mov         edx,ebx
 0047705D    call        TList.Get
 00477062    call        00476F90
 00477067    inc         ebx
 00477068    dec         edi
>00477069    jne         00476FD1
 0047706F    xor         eax,eax
 00477071    pop         edx
 00477072    pop         ecx
 00477073    pop         ecx
 00477074    mov         dword ptr fs:[eax],edx
 00477077    push        47708B
 0047707C    mov         eax,dword ptr [ebp-4]
 0047707F    mov         byte ptr [eax+70],0
 00477083    ret
>00477084    jmp         @HandleFinally
>00477089    jmp         0047707C
 0047708B    pop         edi
 0047708C    pop         esi
 0047708D    pop         ebx
 0047708E    pop         ecx
 0047708F    pop         ebp
 00477090    ret
*}
end;

//004770EC
procedure sub_004770EC(?:dword);
begin
{*
 004770EC    push        ebp
 004770ED    mov         ebp,esp
 004770EF    push        ecx
 004770F0    push        ebx
 004770F1    push        esi
 004770F2    push        edi
 004770F3    mov         dword ptr [ebp-4],eax
 004770F6    mov         eax,dword ptr [ebp-4]
 004770F9    cmp         byte ptr [eax+70],0
>004770FD    jne         004771FB
 00477103    mov         eax,dword ptr [ebp-4]
 00477106    mov         byte ptr [eax+70],1
 0047710A    xor         eax,eax
 0047710C    push        ebp
 0047710D    push        4771F4
 00477112    push        dword ptr fs:[eax]
 00477115    mov         dword ptr fs:[eax],esp
 00477118    mov         eax,dword ptr [ebp-4]
 0047711B    mov         eax,dword ptr [eax+0C]
 0047711E    mov         edi,dword ptr [eax+8]
 00477121    dec         edi
 00477122    test        edi,edi
>00477124    jl          004771DF
 0047712A    inc         edi
 0047712B    xor         ebx,ebx
 0047712D    mov         eax,dword ptr [ebp-4]
 00477130    mov         eax,dword ptr [eax+0C]
 00477133    mov         edx,ebx
 00477135    call        TList.Get
 0047713A    mov         esi,eax
 0047713C    mov         eax,esi
 0047713E    mov         edx,dword ptr ds:[4720C4];TGLMaterial
 00477144    call        @IsClass
 00477149    test        al,al
>0047714B    je          00477164
 0047714D    mov         eax,dword ptr [ebp-4]
 00477150    mov         eax,dword ptr [eax+0C]
 00477153    mov         edx,ebx
 00477155    call        TList.Get
 0047715A    mov         edx,dword ptr [ebp-4]
 0047715D    call        00476910
>00477162    jmp         004771D7
 00477164    mov         eax,esi
 00477166    mov         edx,dword ptr ds:[4722D0];TGLLibMaterial
 0047716C    call        @IsClass
 00477171    test        al,al
>00477173    je          00477189
 00477175    mov         eax,dword ptr [ebp-4]
 00477178    mov         eax,dword ptr [eax+0C]
 0047717B    mov         edx,ebx
 0047717D    call        TList.Get
 00477182    call        004770EC
>00477187    jmp         004771D7
 00477189    mov         eax,esi
 0047718B    mov         edx,dword ptr ds:[46AD40];TGLUpdateAbleObject
 00477191    call        @IsClass
 00477196    test        al,al
>00477198    je          004771B1
 0047719A    mov         eax,dword ptr [ebp-4]
 0047719D    mov         eax,dword ptr [eax+0C]
 004771A0    mov         edx,ebx
 004771A2    call        TList.Get
 004771A7    mov         edx,dword ptr [ebp-4]
 004771AA    mov         ecx,dword ptr [eax]
 004771AC    call        dword ptr [ecx+10]
>004771AF    jmp         004771D7
 004771B1    mov         eax,esi
 004771B3    mov         edx,dword ptr ds:[46AEB0];TGLUpdateAbleComponent
 004771B9    call        @IsClass
 004771BE    test        al,al
>004771C0    je          004771D7
 004771C2    mov         eax,dword ptr [ebp-4]
 004771C5    mov         eax,dword ptr [eax+0C]
 004771C8    mov         edx,ebx
 004771CA    call        TList.Get
 004771CF    mov         edx,dword ptr [ebp-4]
 004771D2    mov         ecx,dword ptr [eax]
 004771D4    call        dword ptr [ecx+34]
 004771D7    inc         ebx
 004771D8    dec         edi
>004771D9    jne         0047712D
 004771DF    xor         eax,eax
 004771E1    pop         edx
 004771E2    pop         ecx
 004771E3    pop         ecx
 004771E4    mov         dword ptr fs:[eax],edx
 004771E7    push        4771FB
 004771EC    mov         eax,dword ptr [ebp-4]
 004771EF    mov         byte ptr [eax+70],0
 004771F3    ret
>004771F4    jmp         @HandleFinally
>004771F9    jmp         004771EC
 004771FB    pop         edi
 004771FC    pop         esi
 004771FD    pop         ebx
 004771FE    pop         ecx
 004771FF    pop         ebp
 00477200    ret
*}
end;

//00477204
{*procedure TGLLibMaterial.GetDisplayName(?:?);
begin
 00477204    push        ebx
 00477205    push        esi
 00477206    mov         esi,edx
 00477208    mov         ebx,eax
 0047720A    mov         eax,esi
 0047720C    mov         edx,dword ptr [ebx+10];TGLLibMaterial.Name:String
 0047720F    call        @LStrAsg
 00477214    pop         esi
 00477215    pop         ebx
 00477216    ret
end;*}

//00477218
{*procedure sub_00477218(?:?);
begin
 00477218    push        ebx
 00477219    mov         ebx,eax
 0047721B    mov         eax,ebx
 0047721D    call        004773B8
 00477222    mov         eax,dword ptr [ebx+18]
 00477225    call        004763F8
 0047722A    pop         ebx
 0047722B    ret
end;*}

//0047722C
{*function sub_0047722C(?:TGLLibMaterial; ?:String):?;
begin
 0047722C    push        ebx
 0047722D    push        esi
 0047722E    mov         esi,edx
 00477230    mov         eax,esi
 00477232    call        @LStrLen
 00477237    mov         edx,eax
 00477239    test        eax,eax
>0047723B    jle         00477252
 0047723D    mov         ecx,1
 00477242    xor         ebx,ebx
 00477244    mov         bl,byte ptr [esi+ecx-1]
 00477248    add         edx,edx
 0047724A    add         ebx,edx
 0047724C    mov         edx,ebx
 0047724E    inc         ecx
 0047724F    dec         eax
>00477250    jne         00477242
 00477252    mov         eax,edx
 00477254    pop         esi
 00477255    pop         ebx
 00477256    ret
end;*}

//00477258
procedure TGLLibMaterial.SetName(Value:AnsiString);
begin
{*
 00477258    push        ebp
 00477259    mov         ebp,esp
 0047725B    push        0
 0047725D    push        ebx
 0047725E    push        esi
 0047725F    push        edi
 00477260    mov         edi,edx
 00477262    mov         ebx,eax
 00477264    xor         eax,eax
 00477266    push        ebp
 00477267    push        4772F1
 0047726C    push        dword ptr fs:[eax]
 0047726F    mov         dword ptr fs:[eax],esp
 00477272    mov         eax,edi
 00477274    mov         edx,dword ptr [ebx+10];TGLLibMaterial.Name:String
 00477277    call        @LStrCmp
>0047727C    je          004772DB
 0047727E    mov         eax,dword ptr [ebx+4];TGLLibMaterial.FCollection:TCollection
 00477281    mov         si,0FFFF
 00477285    call        @CallDynaInst;TPersistent.sub_0041ADA4
 0047728A    test        byte ptr [eax+1C],1
>0047728E    jne         004772C4
 00477290    mov         edx,edi
 00477292    mov         eax,dword ptr [ebx+4];TGLLibMaterial.FCollection:TCollection
 00477295    call        004776DC
 0047729A    cmp         ebx,eax
>0047729C    je          004772B8
 0047729E    lea         ecx,[ebp-4]
 004772A1    mov         edx,edi
 004772A3    mov         eax,dword ptr [ebx+4];TGLLibMaterial.FCollection:TCollection
 004772A6    call        0047765C
 004772AB    mov         edx,dword ptr [ebp-4]
 004772AE    lea         eax,[ebx+10];TGLLibMaterial.Name:String
 004772B1    call        @LStrAsg
>004772B6    jmp         004772CE
 004772B8    lea         eax,[ebx+10];TGLLibMaterial.Name:String
 004772BB    mov         edx,edi
 004772BD    call        @LStrAsg
>004772C2    jmp         004772CE
 004772C4    lea         eax,[ebx+10];TGLLibMaterial.Name:String
 004772C7    mov         edx,edi
 004772C9    call        @LStrAsg
 004772CE    mov         edx,dword ptr [ebx+10];TGLLibMaterial.Name:String
 004772D1    mov         eax,dword ptr [ebx]
 004772D3    call        0047722C
 004772D8    mov         dword ptr [ebx+14],eax;TGLLibMaterial.?f14:dword
 004772DB    xor         eax,eax
 004772DD    pop         edx
 004772DE    pop         ecx
 004772DF    pop         ecx
 004772E0    mov         dword ptr fs:[eax],edx
 004772E3    push        4772F8
 004772E8    lea         eax,[ebp-4]
 004772EB    call        @LStrClr
 004772F0    ret
>004772F1    jmp         @HandleFinally
>004772F6    jmp         004772E8
 004772F8    pop         edi
 004772F9    pop         esi
 004772FA    pop         ebx
 004772FB    pop         ecx
 004772FC    pop         ebp
 004772FD    ret
*}
end;

//00477300
procedure TGLLibMaterial.SetMaterial(Value:TGLMaterial);
begin
{*
 00477300    push        esi
 00477301    mov         esi,eax
 00477303    mov         eax,dword ptr [esi+18];TGLLibMaterial.Material:TGLMaterial
 00477306    mov         ecx,dword ptr [eax]
 00477308    call        dword ptr [ecx+8];TGLMaterial.Assign
 0047730B    pop         esi
 0047730C    ret
*}
end;

//00477310
procedure TGLLibMaterial.SetTextureOffset(Value:TGLCoordinates);
begin
{*
 00477310    push        ebx
 00477311    mov         ebx,eax
 00477313    lea         eax,[edx+18];TGLCoordinates.X:Single
 00477316    mov         edx,eax
 00477318    mov         eax,dword ptr [ebx+1C];TGLLibMaterial.TextureOffset:TGLCoordinates
 0047731B    call        0046B878
 00477320    mov         eax,ebx
 00477322    call        004773B8
 00477327    pop         ebx
 00477328    ret
*}
end;

//0047732C
procedure TGLLibMaterial.SetTextureScale(Value:TGLCoordinates);
begin
{*
 0047732C    push        ebx
 0047732D    mov         ebx,eax
 0047732F    lea         eax,[edx+18];TGLCoordinates.X:Single
 00477332    mov         edx,eax
 00477334    mov         eax,dword ptr [ebx+20];TGLLibMaterial.TextureScale:TGLCoordinates
 00477337    call        0046B878
 0047733C    mov         eax,ebx
 0047733E    call        004773B8
 00477343    pop         ebx
 00477344    ret
*}
end;

//00477348
procedure TGLLibMaterial.SetTexture2Name(Value:String);
begin
{*
 00477348    push        ebx
 00477349    push        esi
 0047734A    mov         esi,edx
 0047734C    mov         ebx,eax
 0047734E    mov         eax,esi
 00477350    mov         edx,dword ptr [ebx+68];TGLLibMaterial.Texture2Name:String
 00477353    call        @LStrCmp
>00477358    je          0047737E
 0047735A    mov         eax,dword ptr [ebx+74];TGLLibMaterial.?f74:dword
 0047735D    test        eax,eax
>0047735F    je          0047736D
 00477361    mov         edx,ebx
 00477363    call        00476F84
 00477368    xor         eax,eax
 0047736A    mov         dword ptr [ebx+74],eax;TGLLibMaterial.?f74:dword
 0047736D    lea         eax,[ebx+68];TGLLibMaterial.Texture2Name:String
 00477370    mov         edx,esi
 00477372    call        @LStrAsg
 00477377    mov         eax,ebx
 00477379    call        00476F90
 0047737E    pop         esi
 0047737F    pop         ebx
 00477380    ret
*}
end;

//00477384
procedure TGLLibMaterial.SetShader(Value:TGLShader);
begin
{*
 00477384    push        ebx
 00477385    push        esi
 00477386    mov         esi,edx
 00477388    mov         ebx,eax
 0047738A    mov         eax,dword ptr [ebx+6C];TGLLibMaterial.Shader:TGLShader
 0047738D    cmp         esi,eax
>0047738F    je          004773B3
 00477391    test        eax,eax
>00477393    je          0047739C
 00477395    mov         edx,ebx
 00477397    call        00474560
 0047739C    mov         eax,esi
 0047739E    mov         dword ptr [ebx+6C],eax;TGLLibMaterial.Shader:TGLShader
 004773A1    test        eax,eax
>004773A3    je          004773AC
 004773A5    mov         edx,ebx
 004773A7    call        0047453C
 004773AC    mov         eax,ebx
 004773AE    call        00476F90
 004773B3    pop         esi
 004773B4    pop         ebx
 004773B5    ret
*}
end;

//004773B8
procedure sub_004773B8(?:TGLLibMaterial);
begin
{*
 004773B8    push        ebx
 004773B9    push        esi
 004773BA    push        edi
 004773BB    add         esp,0FFFFFFC0
 004773BE    mov         ebx,eax
 004773C0    mov         edx,dword ptr ds:[5AE1F8];^gvar_005ACF84
 004773C6    mov         eax,dword ptr [ebx+1C];TGLLibMaterial.TextureOffset:TGLCoordinates
 004773C9    call        0046B68C
 004773CE    test        al,al
>004773D0    je          004773EA
 004773D2    mov         edx,dword ptr ds:[5AE630];^gvar_005ACF64
 004773D8    mov         eax,dword ptr [ebx+20];TGLLibMaterial.TextureScale:TGLCoordinates
 004773DB    call        0046B68C
 004773E0    test        al,al
>004773E2    je          004773EA
 004773E4    mov         byte ptr [ebx+24],1;TGLLibMaterial.?f24:byte
>004773E8    jmp         0047740D
 004773EA    mov         byte ptr [ebx+24],0;TGLLibMaterial.?f24:byte
 004773EE    mov         ecx,esp
 004773F0    mov         eax,dword ptr [ebx+1C];TGLLibMaterial.TextureOffset:TGLCoordinates
 004773F3    lea         edx,[eax+18];TGLCoordinates.X:Single
 004773F6    mov         eax,dword ptr [ebx+20];TGLLibMaterial.TextureScale:TGLCoordinates
 004773F9    add         eax,18;TGLCoordinates.X:Single
 004773FC    call        0045DA0C
 00477401    mov         esi,esp
 00477403    lea         edi,[ebx+28];TGLLibMaterial.?f28:?
 00477406    mov         ecx,10
 0047740B    rep movs    dword ptr [edi],dword ptr [esi]
 0047740D    mov         eax,ebx
 0047740F    call        00476F90
 00477414    add         esp,40
 00477417    pop         edi
 00477418    pop         esi
 00477419    pop         ebx
 0047741A    ret
*}
end;

//0047741C
{*procedure sub_0047741C(?:?);
begin
 0047741C    push        ebx
 0047741D    mov         ebx,eax
 0047741F    mov         eax,dword ptr [ebx+18]
 00477422    call        00476954
 00477427    cmp         dword ptr [ebx+68],0
>0047742B    je          00477441
 0047742D    mov         edx,dword ptr [ebx+68]
 00477430    mov         eax,dword ptr [ebx+4]
 00477433    call        004776DC
 00477438    test        eax,eax
>0047743A    je          00477441
 0047743C    call        0047741C
 00477441    pop         ebx
 00477442    ret
end;*}

//0047759C
constructor TGLLibMaterials.Create;
begin
{*
 0047759C    push        ebx
 0047759D    push        esi
 0047759E    test        dl,dl
>004775A0    je          004775AA
 004775A2    add         esp,0FFFFFFF0
 004775A5    call        @ClassCreate
 004775AA    mov         ebx,edx
 004775AC    mov         esi,eax
 004775AE    mov         eax,[004722D0];TGLLibMaterial
 004775B3    push        eax
 004775B4    xor         edx,edx
 004775B6    mov         eax,esi
 004775B8    call        TOwnedCollection.Create
 004775BD    mov         eax,esi
 004775BF    test        bl,bl
>004775C1    je          004775D2
 004775C3    call        @AfterConstruction
 004775C8    pop         dword ptr fs:[0]
 004775CF    add         esp,0C
 004775D2    mov         eax,esi
 004775D4    pop         esi
 004775D5    pop         ebx
 004775D6    ret
*}
end;

//004775D8
procedure sub_004775D8(?:TGLLibMaterials);
begin
{*
 004775D8    push        ebx
 004775D9    push        esi
 004775DA    push        edi
 004775DB    mov         edi,eax
 004775DD    mov         eax,edi
 004775DF    call        TCollection.GetCount
 004775E4    mov         ebx,eax
 004775E6    dec         ebx
 004775E7    test        ebx,ebx
>004775E9    jl          00477600
 004775EB    inc         ebx
 004775EC    xor         esi,esi
 004775EE    mov         edx,esi
 004775F0    mov         eax,edi
 004775F2    call        00477604
 004775F7    call        00477218
 004775FC    inc         esi
 004775FD    dec         ebx
>004775FE    jne         004775EE
 00477600    pop         edi
 00477601    pop         esi
 00477602    pop         ebx
 00477603    ret
*}
end;

//00477604
{*function sub_00477604(?:TGLLibMaterials; ?:?):?;
begin
 00477604    push        ebx
 00477605    push        esi
 00477606    mov         esi,edx
 00477608    mov         ebx,eax
 0047760A    mov         edx,esi
 0047760C    mov         eax,ebx
 0047760E    call        TCollection.GetItem
 00477613    pop         esi
 00477614    pop         ebx
 00477615    ret
end;*}

//00477618
{*procedure sub_00477618(?:?);
begin
 00477618    push        ebx
 00477619    push        esi
 0047761A    push        edi
 0047761B    mov         edi,eax
 0047761D    mov         eax,edi
 0047761F    call        TCollection.GetCount
 00477624    mov         ebx,eax
 00477626    dec         ebx
 00477627    test        ebx,ebx
>00477629    jl          00477640
 0047762B    inc         ebx
 0047762C    xor         esi,esi
 0047762E    mov         edx,esi
 00477630    mov         eax,edi
 00477632    call        00477604
 00477637    call        0047741C
 0047763C    inc         esi
 0047763D    dec         ebx
>0047763E    jne         0047762E
 00477640    pop         edi
 00477641    pop         esi
 00477642    pop         ebx
 00477643    ret
end;*}

//00477644
{*function sub_00477644(?:?):?;
begin
 00477644    push        ebx
 00477645    mov         ebx,eax
 00477647    mov         eax,ebx
 00477649    call        TCollection.Add
 0047764E    mov         edx,dword ptr ds:[4722D0];TGLLibMaterial
 00477654    call        @AsClass
 00477659    pop         ebx
 0047765A    ret
end;*}

//0047765C
procedure sub_0047765C(?:TCollection; ?:AnsiString; ?:TCollection);
begin
{*
 0047765C    push        ebp
 0047765D    mov         ebp,esp
 0047765F    add         esp,0FFFFFFF8
 00477662    push        ebx
 00477663    push        esi
 00477664    push        edi
 00477665    xor         ebx,ebx
 00477667    mov         dword ptr [ebp-8],ebx
 0047766A    mov         ebx,ecx
 0047766C    mov         dword ptr [ebp-4],edx
 0047766F    mov         edi,eax
 00477671    xor         eax,eax
 00477673    push        ebp
 00477674    push        4776CB
 00477679    push        dword ptr fs:[eax]
 0047767C    mov         dword ptr fs:[eax],esp
 0047767F    mov         eax,ebx
 00477681    mov         edx,dword ptr [ebp-4]
 00477684    call        @LStrAsg
 00477689    mov         esi,1
>0047768E    jmp         004776A8
 00477690    lea         edx,[ebp-8]
 00477693    mov         eax,esi
 00477695    call        IntToStr
 0047769A    mov         ecx,dword ptr [ebp-8]
 0047769D    mov         eax,ebx
 0047769F    mov         edx,dword ptr [ebp-4]
 004776A2    call        @LStrCat3
 004776A7    inc         esi
 004776A8    mov         edx,dword ptr [ebx]
 004776AA    mov         eax,edi
 004776AC    call        004776DC
 004776B1    test        eax,eax
>004776B3    jne         00477690
 004776B5    xor         eax,eax
 004776B7    pop         edx
 004776B8    pop         ecx
 004776B9    pop         ecx
 004776BA    mov         dword ptr fs:[eax],edx
 004776BD    push        4776D2
 004776C2    lea         eax,[ebp-8]
 004776C5    call        @LStrClr
 004776CA    ret
>004776CB    jmp         @HandleFinally
>004776D0    jmp         004776C2
 004776D2    pop         edi
 004776D3    pop         esi
 004776D4    pop         ebx
 004776D5    pop         ecx
 004776D6    pop         ecx
 004776D7    pop         ebp
 004776D8    ret
*}
end;

//004776DC
{*function sub_004776DC(?:TCollection; ?:AnsiString):?;
begin
 004776DC    push        ebx
 004776DD    push        esi
 004776DE    push        edi
 004776DF    push        ebp
 004776E0    add         esp,0FFFFFFF8
 004776E3    mov         dword ptr [esp],edx
 004776E6    mov         ebp,eax
 004776E8    mov         edx,dword ptr [esp]
 004776EB    mov         eax,[004722D0];TGLLibMaterial
 004776F0    call        0047722C
 004776F5    mov         dword ptr [esp+4],eax
 004776F9    mov         eax,ebp
 004776FB    call        TCollection.GetCount
 00477700    mov         esi,eax
 00477702    dec         esi
 00477703    test        esi,esi
>00477705    jl          00477733
 00477707    inc         esi
 00477708    xor         edi,edi
 0047770A    mov         edx,edi
 0047770C    mov         eax,ebp
 0047770E    call        TCollection.GetItem
 00477713    mov         ebx,eax
 00477715    mov         eax,dword ptr [ebx+14]
 00477718    cmp         eax,dword ptr [esp+4]
>0047771C    jne         0047772F
 0047771E    mov         eax,dword ptr [ebx+10]
 00477721    mov         edx,dword ptr [esp]
 00477724    call        @LStrCmp
>00477729    jne         0047772F
 0047772B    mov         eax,ebx
>0047772D    jmp         00477735
 0047772F    inc         edi
 00477730    dec         esi
>00477731    jne         0047770A
 00477733    xor         eax,eax
 00477735    pop         ecx
 00477736    pop         edx
 00477737    pop         ebp
 00477738    pop         edi
 00477739    pop         esi
 0047773A    pop         ebx
 0047773B    ret
end;*}

//0047773C
procedure sub_0047773C(?:TGLLibMaterials);
begin
{*
 0047773C    push        ebx
 0047773D    push        esi
 0047773E    push        edi
 0047773F    mov         edi,eax
 00477741    mov         eax,edi
 00477743    call        TCollection.GetCount
 00477748    mov         ebx,eax
 0047774A    dec         ebx
 0047774B    test        ebx,ebx
>0047774D    jl          00477764
 0047774F    inc         ebx
 00477750    xor         esi,esi
 00477752    mov         edx,esi
 00477754    mov         eax,edi
 00477756    call        TCollection.GetItem
 0047775B    call        00476C24
 00477760    inc         esi
 00477761    dec         ebx
>00477762    jne         00477752
 00477764    pop         edi
 00477765    pop         esi
 00477766    pop         ebx
 00477767    ret
*}
end;

//00477768
constructor TGLMaterialLibrary.Create(AOwner:TComponent);
begin
{*
 00477768    push        ebx
 00477769    push        esi
 0047776A    test        dl,dl
>0047776C    je          00477776
 0047776E    add         esp,0FFFFFFF0
 00477771    call        @ClassCreate
 00477776    mov         ebx,edx
 00477778    mov         esi,eax
 0047777A    xor         edx,edx
 0047777C    mov         eax,esi
 0047777E    call        TComponent.Create
 00477783    mov         ecx,esi
 00477785    mov         dl,1
 00477787    mov         eax,[0047248C];TGLLibMaterials
 0047778C    call        TGLLibMaterials.Create;TGLLibMaterials.Create
 00477791    mov         dword ptr [esi+34],eax;TGLMaterialLibrary.Materials:TGLLibMaterials
 00477794    mov         eax,esi
 00477796    test        bl,bl
>00477798    je          004777A9
 0047779A    call        @AfterConstruction
 0047779F    pop         dword ptr fs:[0]
 004777A6    add         esp,0C
 004777A9    mov         eax,esi
 004777AB    pop         esi
 004777AC    pop         ebx
 004777AD    ret
*}
end;

//004777B0
destructor TGLMaterialLibrary.Destroy;
begin
{*
 004777B0    push        ebx
 004777B1    push        esi
 004777B2    call        @BeforeDestruction
 004777B7    mov         ebx,edx
 004777B9    mov         esi,eax
 004777BB    cmp         dword ptr [esi+4C],0;TGLMaterialLibrary.?f4C:dword
>004777BF    je          004777D5
 004777C1    mov         ecx,14D5
 004777C6    mov         edx,47780C;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 004777CB    mov         eax,477848;'Unbalanced material application'
 004777D0    call        @Assert
 004777D5    mov         eax,dword ptr [esi+48];TGLMaterialLibrary.?f48:TStringList
 004777D8    call        TObject.Free
 004777DD    mov         eax,dword ptr [esi+34];TGLMaterialLibrary.Materials:TGLLibMaterials
 004777E0    call        TObject.Free
 004777E5    xor         eax,eax
 004777E7    mov         dword ptr [esi+34],eax;TGLMaterialLibrary.Materials:TGLLibMaterials
 004777EA    mov         edx,ebx
 004777EC    and         dl,0FC
 004777EF    mov         eax,esi
 004777F1    call        TComponent.Destroy
 004777F6    test        bl,bl
>004777F8    jle         00477801
 004777FA    mov         eax,esi
 004777FC    call        @ClassDestroy
 00477801    pop         esi
 00477802    pop         ebx
 00477803    ret
*}
end;

//00477868
procedure sub_00477868(?:TGLMaterialLibrary);
begin
{*
 00477868    mov         edx,dword ptr [eax+34]
 0047786B    test        edx,edx
>0047786D    je          00477876
 0047786F    mov         eax,edx
 00477871    call        00477618
 00477876    ret
*}
end;

//00477878
procedure TGLMaterialLibrary.Loaded;
begin
{*
 00477878    push        ebx
 00477879    mov         ebx,eax
 0047787B    mov         eax,dword ptr [ebx+34];TGLMaterialLibrary.Materials:TGLLibMaterials
 0047787E    call        004775D8
 00477883    mov         eax,ebx
 00477885    call        TComponent.Loaded
 0047788A    pop         ebx
 0047788B    ret
*}
end;

//0047788C
procedure TGLMaterialLibrary.SetMaterials(Value:TGLLibMaterials);
begin
{*
 0047788C    push        esi
 0047788D    mov         esi,eax
 0047788F    mov         eax,dword ptr [esi+34];TGLMaterialLibrary.Materials:TGLLibMaterials
 00477892    mov         ecx,dword ptr [eax]
 00477894    call        dword ptr [ecx+8];TCollection.Assign
 00477897    pop         esi
 00477898    ret
*}
end;

//0047789C
function TGLMaterialLibrary.IsStoredMaterials(Value:TGLLibMaterials):Boolean;
begin
{*
 0047789C    push        ebx
 0047789D    mov         ebx,eax
 0047789F    mov         eax,dword ptr [ebx+34];TGLMaterialLibrary.Materials:TGLLibMaterials
 004778A2    call        TCollection.GetCount
 004778A7    test        eax,eax
 004778A9    setg        al
 004778AC    pop         ebx
 004778AD    ret
*}
end;

//004778B0
{*procedure sub_004778B0(?:?);
begin
 004778B0    push        ebp
 004778B1    mov         ebp,esp
 004778B3    push        0
 004778B5    push        0
 004778B7    xor         eax,eax
 004778B9    push        ebp
 004778BA    push        47794A
 004778BF    push        dword ptr fs:[eax]
 004778C2    mov         dword ptr fs:[eax],esp
 004778C5    lea         eax,[ebp-8]
 004778C8    push        eax
 004778C9    mov         eax,dword ptr [ebp+8]
 004778CC    mov         ecx,dword ptr [eax-0C]
 004778CF    mov         eax,dword ptr [ebp+8]
 004778D2    sub         ecx,dword ptr [eax-8]
 004778D5    dec         ecx
 004778D6    mov         eax,dword ptr [ebp+8]
 004778D9    mov         edx,dword ptr [eax-8]
 004778DC    inc         edx
 004778DD    mov         eax,dword ptr [ebp+8]
 004778E0    mov         eax,dword ptr [eax-4]
 004778E3    call        @LStrCopy
 004778E8    mov         eax,dword ptr [ebp-8]
 004778EB    lea         edx,[ebp-4]
 004778EE    call        Trim
 004778F3    mov         eax,dword ptr [ebp-4]
 004778F6    call        @LStrLen
 004778FB    test        eax,eax
>004778FD    jle         0047792F
 004778FF    mov         eax,dword ptr [ebp-4]
 00477902    call        @LStrLen
 00477907    mov         edx,dword ptr [ebp-4]
 0047790A    cmp         byte ptr [edx+eax-1],5C
>0047790F    je          0047791E
 00477911    lea         eax,[ebp-4]
 00477914    mov         edx,477960;'\'
 00477919    call        @LStrCat
 0047791E    mov         eax,dword ptr [ebp+8]
 00477921    mov         eax,dword ptr [eax-10]
 00477924    mov         eax,dword ptr [eax+48]
 00477927    mov         edx,dword ptr [ebp-4]
 0047792A    mov         ecx,dword ptr [eax]
 0047792C    call        dword ptr [ecx+38]
 0047792F    xor         eax,eax
 00477931    pop         edx
 00477932    pop         ecx
 00477933    pop         ecx
 00477934    mov         dword ptr fs:[eax],edx
 00477937    push        477951
 0047793C    lea         eax,[ebp-8]
 0047793F    mov         edx,2
 00477944    call        @LStrArrayClr
 00477949    ret
>0047794A    jmp         @HandleFinally
>0047794F    jmp         0047793C
 00477951    pop         ecx
 00477952    pop         ecx
 00477953    pop         ebp
 00477954    ret
end;*}

//00477964
procedure TGLMaterialLibrary.SetTexturePaths(Value:String);
begin
{*
 00477964    push        ebp
 00477965    mov         ebp,esp
 00477967    add         esp,0FFFFFFF0
 0047796A    push        ebx
 0047796B    mov         dword ptr [ebp-4],edx
 0047796E    mov         dword ptr [ebp-10],eax
 00477971    mov         eax,dword ptr [ebp-10]
 00477974    mov         eax,dword ptr [eax+48];TGLMaterialLibrary.?f48:TStringList
 00477977    call        TObject.Free
 0047797C    mov         eax,dword ptr [ebp-10]
 0047797F    xor         edx,edx
 00477981    mov         dword ptr [eax+48],edx;TGLMaterialLibrary.?f48:TStringList
 00477984    mov         eax,dword ptr [ebp-10]
 00477987    add         eax,38;TGLMaterialLibrary.TexturePaths:String
 0047798A    mov         edx,dword ptr [ebp-4]
 0047798D    call        @LStrAsg
 00477992    cmp         dword ptr [ebp-4],0
>00477996    je          004779F7
 00477998    mov         dl,1
 0047799A    mov         eax,[00418350];TStringList
 0047799F    call        TObject.Create;TStringList.Create
 004779A4    mov         edx,dword ptr [ebp-10]
 004779A7    mov         dword ptr [edx+48],eax;TGLMaterialLibrary.?f48:TStringList
 004779AA    xor         eax,eax
 004779AC    mov         dword ptr [ebp-8],eax
 004779AF    mov         eax,dword ptr [ebp-4]
 004779B2    call        @LStrLen
 004779B7    mov         ebx,eax
 004779B9    test        ebx,ebx
>004779BB    jle         004779E4
 004779BD    mov         dword ptr [ebp-0C],1
 004779C4    mov         eax,dword ptr [ebp-4]
 004779C7    mov         edx,dword ptr [ebp-0C]
 004779CA    cmp         byte ptr [eax+edx-1],3B
>004779CF    jne         004779DE
 004779D1    push        ebp
 004779D2    call        004778B0
 004779D7    pop         ecx
 004779D8    mov         eax,dword ptr [ebp-0C]
 004779DB    mov         dword ptr [ebp-8],eax
 004779DE    inc         dword ptr [ebp-0C]
 004779E1    dec         ebx
>004779E2    jne         004779C4
 004779E4    mov         eax,dword ptr [ebp-4]
 004779E7    call        @LStrLen
 004779EC    inc         eax
 004779ED    mov         dword ptr [ebp-0C],eax
 004779F0    push        ebp
 004779F1    call        004778B0
 004779F6    pop         ecx
 004779F7    pop         ebx
 004779F8    mov         esp,ebp
 004779FA    pop         ebp
 004779FB    ret
*}
end;

//004779FC
procedure sub_004779FC(?:TGLMaterialLibrary; ?:TBinaryWriter);
begin
{*
 004779FC    push        ebp
 004779FD    mov         ebp,esp
 004779FF    add         esp,0FFFFFFD8
 00477A02    push        ebx
 00477A03    push        esi
 00477A04    push        edi
 00477A05    mov         dword ptr [ebp-8],edx
 00477A08    mov         dword ptr [ebp-4],eax
 00477A0B    mov         edx,2
 00477A10    mov         eax,dword ptr [ebp-8]
 00477A13    mov         ecx,dword ptr [eax]
 00477A15    call        dword ptr [ecx+8]
 00477A18    mov         eax,dword ptr [ebp-4]
 00477A1B    mov         eax,dword ptr [eax+34]
 00477A1E    call        TCollection.GetCount
 00477A23    mov         edx,eax
 00477A25    mov         eax,dword ptr [ebp-8]
 00477A28    mov         ecx,dword ptr [eax]
 00477A2A    call        dword ptr [ecx+8]
 00477A2D    mov         eax,dword ptr [ebp-4]
 00477A30    mov         eax,dword ptr [eax+34]
 00477A33    call        TCollection.GetCount
 00477A38    dec         eax
 00477A39    test        eax,eax
>00477A3B    jl          00477E97
 00477A41    inc         eax
 00477A42    mov         dword ptr [ebp-24],eax
 00477A45    mov         dword ptr [ebp-0C],0
 00477A4C    mov         eax,dword ptr [ebp-4]
 00477A4F    mov         eax,dword ptr [eax+34]
 00477A52    mov         edx,dword ptr [ebp-0C]
 00477A55    call        00477604
 00477A5A    mov         dword ptr [ebp-14],eax
 00477A5D    mov         eax,dword ptr [ebp-14]
 00477A60    mov         edx,dword ptr [eax+10]
 00477A63    mov         eax,dword ptr [ebp-8]
 00477A66    mov         ecx,dword ptr [eax]
 00477A68    call        dword ptr [ecx+10]
 00477A6B    mov         eax,dword ptr [ebp-14]
 00477A6E    mov         eax,dword ptr [eax+18]
 00477A71    call        TGLMaterial.GetTexture
 00477A76    mov         edi,eax
 00477A78    mov         esi,dword ptr [edi+24]
 00477A7B    mov         ebx,esi
 00477A7D    mov         eax,edi
 00477A7F    call        00474A7C
 00477A84    test        al,al
>00477A86    je          00477B5D
 00477A8C    mov         eax,esi
 00477A8E    mov         edx,dword ptr ds:[4710BC];TGLPersistentImage
 00477A94    call        @IsClass
 00477A99    test        al,al
>00477A9B    je          00477B5D
 00477AA1    mov         eax,ebx
 00477AA3    call        TGLPersistentImage.GetPicture
 00477AA8    cmp         dword ptr [eax+0C],0
>00477AAC    je          00477B5D
 00477AB2    mov         dl,1
 00477AB4    mov         eax,dword ptr [ebp-8]
 00477AB7    mov         ecx,dword ptr [eax]
 00477AB9    call        dword ptr [ecx+0C]
 00477ABC    xor         ecx,ecx
 00477ABE    mov         dl,1
 00477AC0    mov         eax,[004186BC];TStringStream
 00477AC5    call        TStringStream.Create;TStringStream.Create
 00477ACA    mov         dword ptr [ebp-18],eax
 00477ACD    xor         eax,eax
 00477ACF    push        ebp
 00477AD0    push        477B56
 00477AD5    push        dword ptr fs:[eax]
 00477AD8    mov         dword ptr fs:[eax],esp
 00477ADB    mov         dl,1
 00477ADD    mov         eax,[00424EB8];TBitmap
 00477AE2    call        TBitmap.Create;TBitmap.Create
 00477AE7    mov         dword ptr [ebp-1C],eax
 00477AEA    xor         eax,eax
 00477AEC    push        ebp
 00477AED    push        477B2B
 00477AF2    push        dword ptr fs:[eax]
 00477AF5    mov         dword ptr fs:[eax],esp
 00477AF8    mov         eax,ebx
 00477AFA    call        TGLPersistentImage.GetPicture
 00477AFF    mov         edx,dword ptr [eax+0C]
 00477B02    mov         eax,dword ptr [ebp-1C]
 00477B05    mov         ecx,dword ptr [eax]
 00477B07    call        dword ptr [ecx+8];TBitmap.Assign
 00477B0A    mov         edx,dword ptr [ebp-18]
 00477B0D    mov         eax,dword ptr [ebp-1C]
 00477B10    mov         ecx,dword ptr [eax]
 00477B12    call        dword ptr [ecx+58];TBitmap.SaveToStream
 00477B15    xor         eax,eax
 00477B17    pop         edx
 00477B18    pop         ecx
 00477B19    pop         ecx
 00477B1A    mov         dword ptr fs:[eax],edx
 00477B1D    push        477B32
 00477B22    mov         eax,dword ptr [ebp-1C]
 00477B25    call        TObject.Free
 00477B2A    ret
>00477B2B    jmp         @HandleFinally
>00477B30    jmp         00477B22
 00477B32    mov         eax,dword ptr [ebp-18]
 00477B35    mov         edx,dword ptr [eax+4];TStringStream.FDataString:String
 00477B38    mov         eax,dword ptr [ebp-8]
 00477B3B    mov         ecx,dword ptr [eax]
 00477B3D    call        dword ptr [ecx+10]
 00477B40    xor         eax,eax
 00477B42    pop         edx
 00477B43    pop         ecx
 00477B44    pop         ecx
 00477B45    mov         dword ptr fs:[eax],edx
 00477B48    push        477B67
 00477B4D    mov         eax,dword ptr [ebp-18]
 00477B50    call        TObject.Free
 00477B55    ret
>00477B56    jmp         @HandleFinally
>00477B5B    jmp         00477B4D
 00477B5D    xor         edx,edx
 00477B5F    mov         eax,dword ptr [ebp-8]
 00477B62    mov         ecx,dword ptr [eax]
 00477B64    call        dword ptr [ecx+0C]
 00477B67    mov         eax,dword ptr [ebp-14]
 00477B6A    mov         eax,dword ptr [eax+18]
 00477B6D    mov         ebx,dword ptr [eax+18]
 00477B70    mov         eax,dword ptr [ebx+18]
 00477B73    call        00472C80
 00477B78    mov         edx,eax
 00477B7A    mov         ecx,0C
 00477B7F    mov         eax,dword ptr [ebp-8]
 00477B82    mov         esi,dword ptr [eax]
 00477B84    call        dword ptr [esi+4]
 00477B87    mov         eax,dword ptr [ebx+1C]
 00477B8A    call        00472C80
 00477B8F    mov         edx,eax
 00477B91    mov         ecx,10
 00477B96    mov         eax,dword ptr [ebp-8]
 00477B99    mov         esi,dword ptr [eax]
 00477B9B    call        dword ptr [esi+4]
 00477B9E    mov         eax,dword ptr [ebx+24]
 00477BA1    call        00472C80
 00477BA6    mov         edx,eax
 00477BA8    mov         ecx,0C
 00477BAD    mov         eax,dword ptr [ebp-8]
 00477BB0    mov         esi,dword ptr [eax]
 00477BB2    call        dword ptr [esi+4]
 00477BB5    mov         eax,dword ptr [ebx+20]
 00477BB8    call        00472C80
 00477BBD    mov         edx,eax
 00477BBF    mov         ecx,0C
 00477BC4    mov         eax,dword ptr [ebp-8]
 00477BC7    mov         ebx,dword ptr [eax]
 00477BC9    call        dword ptr [ebx+4]
 00477BCC    mov         eax,dword ptr [ebp-14]
 00477BCF    mov         eax,dword ptr [eax+18]
 00477BD2    mov         ebx,dword ptr [eax+18]
 00477BD5    lea         edx,[ebx+29]
 00477BD8    mov         ecx,1
 00477BDD    mov         eax,dword ptr [ebp-8]
 00477BE0    mov         esi,dword ptr [eax]
 00477BE2    call        dword ptr [esi+4]
 00477BE5    xor         edx,edx
 00477BE7    mov         dl,byte ptr [ebx+28]
 00477BEA    mov         eax,dword ptr [ebp-8]
 00477BED    mov         ecx,dword ptr [eax]
 00477BEF    call        dword ptr [ecx+8]
 00477BF2    mov         eax,dword ptr [ebp-14]
 00477BF5    mov         eax,dword ptr [eax+18]
 00477BF8    call        TGLMaterial.GetBackProperties
 00477BFD    mov         ebx,eax
 00477BFF    mov         eax,dword ptr [ebx+18]
 00477C02    call        00472C80
 00477C07    mov         edx,eax
 00477C09    mov         ecx,0C
 00477C0E    mov         eax,dword ptr [ebp-8]
 00477C11    mov         esi,dword ptr [eax]
 00477C13    call        dword ptr [esi+4]
 00477C16    mov         eax,dword ptr [ebx+1C]
 00477C19    call        00472C80
 00477C1E    mov         edx,eax
 00477C20    mov         ecx,10
 00477C25    mov         eax,dword ptr [ebp-8]
 00477C28    mov         esi,dword ptr [eax]
 00477C2A    call        dword ptr [esi+4]
 00477C2D    mov         eax,dword ptr [ebx+24]
 00477C30    call        00472C80
 00477C35    mov         edx,eax
 00477C37    mov         ecx,0C
 00477C3C    mov         eax,dword ptr [ebp-8]
 00477C3F    mov         esi,dword ptr [eax]
 00477C41    call        dword ptr [esi+4]
 00477C44    mov         eax,dword ptr [ebx+20]
 00477C47    call        00472C80
 00477C4C    mov         edx,eax
 00477C4E    mov         ecx,0C
 00477C53    mov         eax,dword ptr [ebp-8]
 00477C56    mov         esi,dword ptr [eax]
 00477C58    call        dword ptr [esi+4]
 00477C5B    lea         edx,[ebx+29]
 00477C5E    mov         ecx,1
 00477C63    mov         eax,dword ptr [ebp-8]
 00477C66    mov         esi,dword ptr [eax]
 00477C68    call        dword ptr [esi+4]
 00477C6B    xor         edx,edx
 00477C6D    mov         dl,byte ptr [ebx+28]
 00477C70    mov         eax,dword ptr [ebp-8]
 00477C73    mov         ecx,dword ptr [eax]
 00477C75    call        dword ptr [ecx+8]
 00477C78    mov         eax,dword ptr [ebp-14]
 00477C7B    mov         eax,dword ptr [eax+18]
 00477C7E    xor         edx,edx
 00477C80    mov         dl,byte ptr [eax+20]
 00477C83    mov         eax,dword ptr [ebp-8]
 00477C86    mov         ecx,dword ptr [eax]
 00477C88    call        dword ptr [ecx+8]
 00477C8B    mov         edx,1
 00477C90    mov         eax,dword ptr [ebp-8]
 00477C93    mov         ecx,dword ptr [eax]
 00477C95    call        dword ptr [ecx+8]
 00477C98    mov         eax,dword ptr [ebp-14]
 00477C9B    mov         eax,dword ptr [eax+18]
 00477C9E    lea         edx,[eax+34]
 00477CA1    mov         ecx,1
 00477CA6    mov         eax,dword ptr [ebp-8]
 00477CA9    mov         ebx,dword ptr [eax]
 00477CAB    call        dword ptr [ebx+4]
 00477CAE    mov         eax,dword ptr [ebp-14]
 00477CB1    mov         eax,dword ptr [eax+1C]
 00477CB4    call        0046B874
 00477CB9    mov         edx,eax
 00477CBB    mov         ecx,0C
 00477CC0    mov         eax,dword ptr [ebp-8]
 00477CC3    mov         ebx,dword ptr [eax]
 00477CC5    call        dword ptr [ebx+4]
 00477CC8    mov         eax,dword ptr [ebp-14]
 00477CCB    mov         eax,dword ptr [eax+20]
 00477CCE    call        0046B874
 00477CD3    mov         edx,eax
 00477CD5    mov         ecx,0C
 00477CDA    mov         eax,dword ptr [ebp-8]
 00477CDD    mov         ebx,dword ptr [eax]
 00477CDF    call        dword ptr [ebx+4]
 00477CE2    mov         eax,dword ptr [ebp-14]
 00477CE5    mov         edx,dword ptr [eax+68]
 00477CE8    mov         eax,dword ptr [ebp-8]
 00477CEB    mov         ecx,dword ptr [eax]
 00477CED    call        dword ptr [ecx+10]
 00477CF0    mov         eax,dword ptr [ebp-14]
 00477CF3    mov         eax,dword ptr [eax+18]
 00477CF6    call        TGLMaterial.GetTextureEx
 00477CFB    call        TCollection.GetCount
 00477D00    mov         edx,eax
 00477D02    mov         eax,dword ptr [ebp-8]
 00477D05    mov         ecx,dword ptr [eax]
 00477D07    call        dword ptr [ecx+8]
 00477D0A    mov         eax,dword ptr [ebp-14]
 00477D0D    mov         eax,dword ptr [eax+18]
 00477D10    call        TGLMaterial.GetTextureEx
 00477D15    call        TCollection.GetCount
 00477D1A    dec         eax
 00477D1B    test        eax,eax
>00477D1D    jl          00477E8B
 00477D23    inc         eax
 00477D24    mov         dword ptr [ebp-28],eax
 00477D27    mov         dword ptr [ebp-10],0
 00477D2E    mov         eax,dword ptr [ebp-14]
 00477D31    mov         eax,dword ptr [eax+18]
 00477D34    call        TGLMaterial.GetTextureEx
 00477D39    mov         edx,dword ptr [ebp-10]
 00477D3C    call        00476054
 00477D41    mov         dword ptr [ebp-20],eax
 00477D44    mov         eax,dword ptr [ebp-20]
 00477D47    mov         eax,dword ptr [eax+0C]
 00477D4A    mov         esi,dword ptr [eax+24]
 00477D4D    mov         ebx,esi
 00477D4F    mov         eax,dword ptr [ebp-20]
 00477D52    mov         eax,dword ptr [eax+0C]
 00477D55    call        00474A7C
 00477D5A    test        al,al
>00477D5C    je          00477E33
 00477D62    mov         eax,esi
 00477D64    mov         edx,dword ptr ds:[4710BC];TGLPersistentImage
 00477D6A    call        @IsClass
 00477D6F    test        al,al
>00477D71    je          00477E33
 00477D77    mov         eax,ebx
 00477D79    call        TGLPersistentImage.GetPicture
 00477D7E    cmp         dword ptr [eax+0C],0
>00477D82    je          00477E33
 00477D88    mov         dl,1
 00477D8A    mov         eax,dword ptr [ebp-8]
 00477D8D    mov         ecx,dword ptr [eax]
 00477D8F    call        dword ptr [ecx+0C]
 00477D92    xor         ecx,ecx
 00477D94    mov         dl,1
 00477D96    mov         eax,[004186BC];TStringStream
 00477D9B    call        TStringStream.Create;TStringStream.Create
 00477DA0    mov         dword ptr [ebp-18],eax
 00477DA3    xor         eax,eax
 00477DA5    push        ebp
 00477DA6    push        477E2C
 00477DAB    push        dword ptr fs:[eax]
 00477DAE    mov         dword ptr fs:[eax],esp
 00477DB1    mov         dl,1
 00477DB3    mov         eax,[00424EB8];TBitmap
 00477DB8    call        TBitmap.Create;TBitmap.Create
 00477DBD    mov         dword ptr [ebp-1C],eax
 00477DC0    xor         eax,eax
 00477DC2    push        ebp
 00477DC3    push        477E01
 00477DC8    push        dword ptr fs:[eax]
 00477DCB    mov         dword ptr fs:[eax],esp
 00477DCE    mov         eax,ebx
 00477DD0    call        TGLPersistentImage.GetPicture
 00477DD5    mov         edx,dword ptr [eax+0C]
 00477DD8    mov         eax,dword ptr [ebp-1C]
 00477DDB    mov         ecx,dword ptr [eax]
 00477DDD    call        dword ptr [ecx+8];TBitmap.Assign
 00477DE0    mov         edx,dword ptr [ebp-18]
 00477DE3    mov         eax,dword ptr [ebp-1C]
 00477DE6    mov         ecx,dword ptr [eax]
 00477DE8    call        dword ptr [ecx+58];TBitmap.SaveToStream
 00477DEB    xor         eax,eax
 00477DED    pop         edx
 00477DEE    pop         ecx
 00477DEF    pop         ecx
 00477DF0    mov         dword ptr fs:[eax],edx
 00477DF3    push        477E08
 00477DF8    mov         eax,dword ptr [ebp-1C]
 00477DFB    call        TObject.Free
 00477E00    ret
>00477E01    jmp         @HandleFinally
>00477E06    jmp         00477DF8
 00477E08    mov         eax,dword ptr [ebp-18]
 00477E0B    mov         edx,dword ptr [eax+4];TStringStream.FDataString:String
 00477E0E    mov         eax,dword ptr [ebp-8]
 00477E11    mov         ecx,dword ptr [eax]
 00477E13    call        dword ptr [ecx+10]
 00477E16    xor         eax,eax
 00477E18    pop         edx
 00477E19    pop         ecx
 00477E1A    pop         ecx
 00477E1B    mov         dword ptr fs:[eax],edx
 00477E1E    push        477E3D
 00477E23    mov         eax,dword ptr [ebp-18]
 00477E26    call        TObject.Free
 00477E2B    ret
>00477E2C    jmp         @HandleFinally
>00477E31    jmp         00477E23
 00477E33    xor         edx,edx
 00477E35    mov         eax,dword ptr [ebp-8]
 00477E38    mov         ecx,dword ptr [eax]
 00477E3A    call        dword ptr [ecx+0C]
 00477E3D    mov         eax,dword ptr [ebp-20]
 00477E40    mov         edx,dword ptr [eax+10]
 00477E43    mov         eax,dword ptr [ebp-8]
 00477E46    mov         ecx,dword ptr [eax]
 00477E48    call        dword ptr [ecx+8]
 00477E4B    mov         eax,dword ptr [ebp-20]
 00477E4E    mov         eax,dword ptr [eax+14]
 00477E51    call        0046B874
 00477E56    mov         edx,eax
 00477E58    mov         ecx,0C
 00477E5D    mov         eax,dword ptr [ebp-8]
 00477E60    mov         ebx,dword ptr [eax]
 00477E62    call        dword ptr [ebx+4]
 00477E65    mov         eax,dword ptr [ebp-20]
 00477E68    mov         eax,dword ptr [eax+18]
 00477E6B    call        0046B874
 00477E70    mov         edx,eax
 00477E72    mov         ecx,0C
 00477E77    mov         eax,dword ptr [ebp-8]
 00477E7A    mov         ebx,dword ptr [eax]
 00477E7C    call        dword ptr [ebx+4]
 00477E7F    inc         dword ptr [ebp-10]
 00477E82    dec         dword ptr [ebp-28]
>00477E85    jne         00477D2E
 00477E8B    inc         dword ptr [ebp-0C]
 00477E8E    dec         dword ptr [ebp-24]
>00477E91    jne         00477A4C
 00477E97    pop         edi
 00477E98    pop         esi
 00477E99    pop         ebx
 00477E9A    mov         esp,ebp
 00477E9C    pop         ebp
 00477E9D    ret
*}
end;

//00477EA0
procedure sub_00477EA0(?:TGLMaterialLibrary; ?:TBinaryReader);
begin
{*
 00477EA0    push        ebp
 00477EA1    mov         ebp,esp
 00477EA3    add         esp,0FFFFFFCC
 00477EA6    push        ebx
 00477EA7    push        esi
 00477EA8    xor         ecx,ecx
 00477EAA    mov         dword ptr [ebp-34],ecx
 00477EAD    mov         dword ptr [ebp-30],ecx
 00477EB0    mov         dword ptr [ebp-2C],ecx
 00477EB3    mov         dword ptr [ebp-14],ecx
 00477EB6    mov         dword ptr [ebp-8],edx
 00477EB9    mov         dword ptr [ebp-4],eax
 00477EBC    xor         eax,eax
 00477EBE    push        ebp
 00477EBF    push        47831A
 00477EC4    push        dword ptr fs:[eax]
 00477EC7    mov         dword ptr fs:[eax],esp
 00477ECA    mov         eax,dword ptr [ebp-8]
 00477ECD    mov         edx,dword ptr [eax]
 00477ECF    call        dword ptr [edx+0C]
 00477ED2    mov         dword ptr [ebp-0C],eax
 00477ED5    cmp         dword ptr [ebp-0C],0
>00477ED9    jl          004782E7
 00477EDF    cmp         dword ptr [ebp-0C],2
>00477EE3    jg          004782E7
 00477EE9    mov         eax,dword ptr [ebp-4]
 00477EEC    cmp         byte ptr [eax+30],0
>00477EF0    jne         00477EFD
 00477EF2    mov         eax,dword ptr [ebp-4]
 00477EF5    mov         eax,dword ptr [eax+34]
 00477EF8    call        TCollection.Clear
 00477EFD    mov         eax,dword ptr [ebp-8]
 00477F00    mov         edx,dword ptr [eax]
 00477F02    call        dword ptr [edx+0C]
 00477F05    dec         eax
 00477F06    test        eax,eax
>00477F08    jl          004782F7
 00477F0E    inc         eax
 00477F0F    mov         dword ptr [ebp-24],eax
 00477F12    lea         edx,[ebp-14]
 00477F15    mov         eax,dword ptr [ebp-8]
 00477F18    mov         ecx,dword ptr [eax]
 00477F1A    call        dword ptr [ecx+14]
 00477F1D    mov         eax,dword ptr [ebp-4]
 00477F20    cmp         byte ptr [eax+30],0
>00477F24    je          00477F36
 00477F26    mov         edx,dword ptr [ebp-14]
 00477F29    mov         eax,dword ptr [ebp-4]
 00477F2C    call        00478428
 00477F31    mov         dword ptr [ebp-10],eax
>00477F34    jmp         00477F3B
 00477F36    xor         eax,eax
 00477F38    mov         dword ptr [ebp-10],eax
 00477F3B    mov         eax,dword ptr [ebp-8]
 00477F3E    mov         edx,dword ptr [eax]
 00477F40    call        dword ptr [edx+10]
 00477F43    test        al,al
>00477F45    je          00478007
 00477F4B    lea         edx,[ebp-2C]
 00477F4E    mov         eax,dword ptr [ebp-8]
 00477F51    mov         ecx,dword ptr [eax]
 00477F53    call        dword ptr [ecx+14]
 00477F56    mov         ecx,dword ptr [ebp-2C]
 00477F59    mov         dl,1
 00477F5B    mov         eax,[004186BC];TStringStream
 00477F60    call        TStringStream.Create;TStringStream.Create
 00477F65    mov         dword ptr [ebp-18],eax
 00477F68    xor         eax,eax
 00477F6A    push        ebp
 00477F6B    push        478000
 00477F70    push        dword ptr fs:[eax]
 00477F73    mov         dword ptr fs:[eax],esp
 00477F76    mov         dl,1
 00477F78    mov         eax,[00424EB8];TBitmap
 00477F7D    call        TBitmap.Create;TBitmap.Create
 00477F82    mov         dword ptr [ebp-1C],eax
 00477F85    xor         eax,eax
 00477F87    push        ebp
 00477F88    push        477FE3
 00477F8D    push        dword ptr fs:[eax]
 00477F90    mov         dword ptr fs:[eax],esp
 00477F93    mov         edx,dword ptr [ebp-18]
 00477F96    mov         eax,dword ptr [ebp-1C]
 00477F99    mov         ecx,dword ptr [eax]
 00477F9B    call        dword ptr [ecx+54];TBitmap.LoadFromStream
 00477F9E    cmp         dword ptr [ebp-10],0
>00477FA2    jne         00477FB7
 00477FA4    mov         ecx,dword ptr [ebp-1C]
 00477FA7    mov         edx,dword ptr [ebp-14]
 00477FAA    mov         eax,dword ptr [ebp-4]
 00477FAD    call        004783D0
 00477FB2    mov         dword ptr [ebp-10],eax
>00477FB5    jmp         00477FCD
 00477FB7    mov         eax,dword ptr [ebp-10]
 00477FBA    mov         eax,dword ptr [eax+18]
 00477FBD    call        TGLMaterial.GetTexture
 00477FC2    mov         eax,dword ptr [eax+24]
 00477FC5    mov         edx,dword ptr [ebp-1C]
 00477FC8    mov         ecx,dword ptr [eax]
 00477FCA    call        dword ptr [ecx+8]
 00477FCD    xor         eax,eax
 00477FCF    pop         edx
 00477FD0    pop         ecx
 00477FD1    pop         ecx
 00477FD2    mov         dword ptr fs:[eax],edx
 00477FD5    push        477FEA
 00477FDA    mov         eax,dword ptr [ebp-1C]
 00477FDD    call        TObject.Free
 00477FE2    ret
>00477FE3    jmp         @HandleFinally
>00477FE8    jmp         00477FDA
 00477FEA    xor         eax,eax
 00477FEC    pop         edx
 00477FED    pop         ecx
 00477FEE    pop         ecx
 00477FEF    mov         dword ptr fs:[eax],edx
 00477FF2    push        478026
 00477FF7    mov         eax,dword ptr [ebp-18]
 00477FFA    call        TObject.Free
 00477FFF    ret
>00478000    jmp         @HandleFinally
>00478005    jmp         00477FF7
 00478007    cmp         dword ptr [ebp-10],0
>0047800B    jne         00478026
 0047800D    mov         eax,dword ptr [ebp-4]
 00478010    mov         eax,dword ptr [eax+34]
 00478013    call        00477644
 00478018    mov         dword ptr [ebp-10],eax
 0047801B    mov         edx,dword ptr [ebp-14]
 0047801E    mov         eax,dword ptr [ebp-10]
 00478021    call        TGLLibMaterial.SetName
 00478026    mov         eax,dword ptr [ebp-10]
 00478029    mov         eax,dword ptr [eax+18]
 0047802C    mov         ebx,dword ptr [eax+18]
 0047802F    mov         eax,dword ptr [ebx+18]
 00478032    call        00472C80
 00478037    mov         edx,eax
 00478039    mov         ecx,0C
 0047803E    mov         eax,dword ptr [ebp-8]
 00478041    mov         esi,dword ptr [eax]
 00478043    call        dword ptr [esi+4]
 00478046    mov         eax,dword ptr [ebx+1C]
 00478049    call        00472C80
 0047804E    mov         edx,eax
 00478050    mov         ecx,10
 00478055    mov         eax,dword ptr [ebp-8]
 00478058    mov         esi,dword ptr [eax]
 0047805A    call        dword ptr [esi+4]
 0047805D    mov         eax,dword ptr [ebx+24]
 00478060    call        00472C80
 00478065    mov         edx,eax
 00478067    mov         ecx,0C
 0047806C    mov         eax,dword ptr [ebp-8]
 0047806F    mov         esi,dword ptr [eax]
 00478071    call        dword ptr [esi+4]
 00478074    mov         eax,dword ptr [ebx+20]
 00478077    call        00472C80
 0047807C    mov         edx,eax
 0047807E    mov         ecx,0C
 00478083    mov         eax,dword ptr [ebp-8]
 00478086    mov         ebx,dword ptr [eax]
 00478088    call        dword ptr [ebx+4]
 0047808B    cmp         dword ptr [ebp-0C],1
>0047808F    jl          004781C3
 00478095    mov         eax,dword ptr [ebp-10]
 00478098    mov         eax,dword ptr [eax+18]
 0047809B    mov         ebx,dword ptr [eax+18]
 0047809E    lea         edx,[ebx+29]
 004780A1    mov         ecx,1
 004780A6    mov         eax,dword ptr [ebp-8]
 004780A9    mov         esi,dword ptr [eax]
 004780AB    call        dword ptr [esi+4]
 004780AE    mov         eax,dword ptr [ebp-8]
 004780B1    mov         edx,dword ptr [eax]
 004780B3    call        dword ptr [edx+0C]
 004780B6    mov         edx,eax
 004780B8    mov         eax,ebx
 004780BA    call        TGLFaceProperties.SetPolygonMode
 004780BF    mov         eax,dword ptr [ebp-10]
 004780C2    mov         eax,dword ptr [eax+18]
 004780C5    call        TGLMaterial.GetBackProperties
 004780CA    mov         ebx,eax
 004780CC    mov         eax,dword ptr [ebx+18]
 004780CF    call        00472C80
 004780D4    mov         edx,eax
 004780D6    mov         ecx,0C
 004780DB    mov         eax,dword ptr [ebp-8]
 004780DE    mov         esi,dword ptr [eax]
 004780E0    call        dword ptr [esi+4]
 004780E3    mov         eax,dword ptr [ebx+1C]
 004780E6    call        00472C80
 004780EB    mov         edx,eax
 004780ED    mov         ecx,10
 004780F2    mov         eax,dword ptr [ebp-8]
 004780F5    mov         esi,dword ptr [eax]
 004780F7    call        dword ptr [esi+4]
 004780FA    mov         eax,dword ptr [ebx+24]
 004780FD    call        00472C80
 00478102    mov         edx,eax
 00478104    mov         ecx,0C
 00478109    mov         eax,dword ptr [ebp-8]
 0047810C    mov         esi,dword ptr [eax]
 0047810E    call        dword ptr [esi+4]
 00478111    mov         eax,dword ptr [ebx+20]
 00478114    call        00472C80
 00478119    mov         edx,eax
 0047811B    mov         ecx,0C
 00478120    mov         eax,dword ptr [ebp-8]
 00478123    mov         esi,dword ptr [eax]
 00478125    call        dword ptr [esi+4]
 00478128    lea         edx,[ebx+29]
 0047812B    mov         ecx,1
 00478130    mov         eax,dword ptr [ebp-8]
 00478133    mov         esi,dword ptr [eax]
 00478135    call        dword ptr [esi+4]
 00478138    mov         eax,dword ptr [ebp-8]
 0047813B    mov         edx,dword ptr [eax]
 0047813D    call        dword ptr [edx+0C]
 00478140    mov         edx,eax
 00478142    mov         eax,ebx
 00478144    call        TGLFaceProperties.SetPolygonMode
 00478149    mov         eax,dword ptr [ebp-8]
 0047814C    mov         edx,dword ptr [eax]
 0047814E    call        dword ptr [edx+0C]
 00478151    mov         edx,eax
 00478153    mov         eax,dword ptr [ebp-10]
 00478156    mov         eax,dword ptr [eax+18]
 00478159    call        TGLMaterial.SetBlendingMode
 0047815E    mov         eax,dword ptr [ebp-8]
 00478161    mov         edx,dword ptr [eax]
 00478163    call        dword ptr [edx+0C]
 00478166    mov         edx,dword ptr [ebp-10]
 00478169    mov         edx,dword ptr [edx+18]
 0047816C    add         edx,34
 0047816F    mov         ecx,eax
 00478171    mov         eax,dword ptr [ebp-8]
 00478174    mov         ebx,dword ptr [eax]
 00478176    call        dword ptr [ebx+4]
 00478179    mov         eax,dword ptr [ebp-10]
 0047817C    mov         eax,dword ptr [eax+1C]
 0047817F    call        0046B874
 00478184    mov         edx,eax
 00478186    mov         ecx,0C
 0047818B    mov         eax,dword ptr [ebp-8]
 0047818E    mov         ebx,dword ptr [eax]
 00478190    call        dword ptr [ebx+4]
 00478193    mov         eax,dword ptr [ebp-10]
 00478196    mov         eax,dword ptr [eax+20]
 00478199    call        0046B874
 0047819E    mov         edx,eax
 004781A0    mov         ecx,0C
 004781A5    mov         eax,dword ptr [ebp-8]
 004781A8    mov         ebx,dword ptr [eax]
 004781AA    call        dword ptr [ebx+4]
 004781AD    lea         edx,[ebp-30]
 004781B0    mov         eax,dword ptr [ebp-8]
 004781B3    mov         ecx,dword ptr [eax]
 004781B5    call        dword ptr [ecx+14]
 004781B8    mov         edx,dword ptr [ebp-30]
 004781BB    mov         eax,dword ptr [ebp-10]
 004781BE    call        TGLLibMaterial.SetTexture2Name
 004781C3    cmp         dword ptr [ebp-0C],2
>004781C7    jl          004782DC
 004781CD    mov         eax,dword ptr [ebp-8]
 004781D0    mov         edx,dword ptr [eax]
 004781D2    call        dword ptr [edx+0C]
 004781D5    dec         eax
 004781D6    test        eax,eax
>004781D8    jl          004782DC
 004781DE    inc         eax
 004781DF    mov         dword ptr [ebp-28],eax
 004781E2    mov         eax,dword ptr [ebp-10]
 004781E5    mov         eax,dword ptr [eax+18]
 004781E8    call        TGLMaterial.GetTextureEx
 004781ED    call        00476018
 004781F2    mov         dword ptr [ebp-20],eax
 004781F5    mov         eax,dword ptr [ebp-8]
 004781F8    mov         edx,dword ptr [eax]
 004781FA    call        dword ptr [edx+10]
 004781FD    test        al,al
>004781FF    je          0047828D
 00478205    lea         edx,[ebp-34]
 00478208    mov         eax,dword ptr [ebp-8]
 0047820B    mov         ecx,dword ptr [eax]
 0047820D    call        dword ptr [ecx+14]
 00478210    mov         ecx,dword ptr [ebp-34]
 00478213    mov         dl,1
 00478215    mov         eax,[004186BC];TStringStream
 0047821A    call        TStringStream.Create;TStringStream.Create
 0047821F    mov         dword ptr [ebp-18],eax
 00478222    mov         dl,1
 00478224    mov         eax,[00424EB8];TBitmap
 00478229    call        TBitmap.Create;TBitmap.Create
 0047822E    mov         dword ptr [ebp-1C],eax
 00478231    xor         eax,eax
 00478233    push        ebp
 00478234    push        478286
 00478239    push        dword ptr fs:[eax]
 0047823C    mov         dword ptr fs:[eax],esp
 0047823F    mov         edx,dword ptr [ebp-18]
 00478242    mov         eax,dword ptr [ebp-1C]
 00478245    mov         ecx,dword ptr [eax]
 00478247    call        dword ptr [ecx+54];TBitmap.LoadFromStream
 0047824A    mov         eax,dword ptr [ebp-20]
 0047824D    mov         eax,dword ptr [eax+0C]
 00478250    mov         eax,dword ptr [eax+24]
 00478253    mov         edx,dword ptr [ebp-1C]
 00478256    mov         ecx,dword ptr [eax]
 00478258    call        dword ptr [ecx+8]
 0047825B    mov         eax,dword ptr [ebp-20]
 0047825E    mov         eax,dword ptr [eax+0C]
 00478261    mov         dl,1
 00478263    call        00474A70
 00478268    xor         eax,eax
 0047826A    pop         edx
 0047826B    pop         ecx
 0047826C    pop         ecx
 0047826D    mov         dword ptr fs:[eax],edx
 00478270    push        47828D
 00478275    mov         eax,dword ptr [ebp-1C]
 00478278    call        TObject.Free
 0047827D    mov         eax,dword ptr [ebp-18]
 00478280    call        TObject.Free
 00478285    ret
>00478286    jmp         @HandleFinally
>0047828B    jmp         00478275
 0047828D    mov         eax,dword ptr [ebp-8]
 00478290    mov         edx,dword ptr [eax]
 00478292    call        dword ptr [edx+0C]
 00478295    mov         edx,eax
 00478297    mov         eax,dword ptr [ebp-20]
 0047829A    call        TGLTextureExItem.SetTextureIndex
 0047829F    mov         eax,dword ptr [ebp-20]
 004782A2    mov         eax,dword ptr [eax+14]
 004782A5    call        0046B874
 004782AA    mov         edx,eax
 004782AC    mov         ecx,0C
 004782B1    mov         eax,dword ptr [ebp-8]
 004782B4    mov         ebx,dword ptr [eax]
 004782B6    call        dword ptr [ebx+4]
 004782B9    mov         eax,dword ptr [ebp-20]
 004782BC    mov         eax,dword ptr [eax+18]
 004782BF    call        0046B874
 004782C4    mov         edx,eax
 004782C6    mov         ecx,0C
 004782CB    mov         eax,dword ptr [ebp-8]
 004782CE    mov         ebx,dword ptr [eax]
 004782D0    call        dword ptr [ebx+4]
 004782D3    dec         dword ptr [ebp-28]
>004782D6    jne         004781E2
 004782DC    dec         dword ptr [ebp-24]
>004782DF    jne         00477F12
>004782E5    jmp         004782F7
 004782E7    mov         eax,dword ptr [ebp-4]
 004782EA    call        TObject.ClassType
 004782EF    mov         edx,dword ptr [ebp-0C]
 004782F2    call        00466450
 004782F7    xor         eax,eax
 004782F9    pop         edx
 004782FA    pop         ecx
 004782FB    pop         ecx
 004782FC    mov         dword ptr fs:[eax],edx
 004782FF    push        478321
 00478304    lea         eax,[ebp-34]
 00478307    mov         edx,3
 0047830C    call        @LStrArrayClr
 00478311    lea         eax,[ebp-14]
 00478314    call        @LStrClr
 00478319    ret
>0047831A    jmp         @HandleFinally
>0047831F    jmp         00478304
 00478321    pop         esi
 00478322    pop         ebx
 00478323    mov         esp,ebp
 00478325    pop         ebp
 00478326    ret
*}
end;

//00478328
{*procedure TGLMaterialLibrary.sub_00478328(?:?);
begin
 00478328    push        ebp
 00478329    mov         ebp,esp
 0047832B    push        ecx
 0047832C    push        ebx
 0047832D    mov         ebx,eax
 0047832F    mov         ecx,edx
 00478331    mov         eax,[004662F4];TBinaryWriter
 00478336    mov         dl,1
 00478338    call        TBinaryWriter.Create;TBinaryWriter.Create
 0047833D    mov         dword ptr [ebp-4],eax
 00478340    xor         eax,eax
 00478342    push        ebp
 00478343    push        47836E
 00478348    push        dword ptr fs:[eax]
 0047834B    mov         dword ptr fs:[eax],esp
 0047834E    mov         edx,dword ptr [ebp-4]
 00478351    mov         eax,ebx
 00478353    call        004779FC
 00478358    xor         eax,eax
 0047835A    pop         edx
 0047835B    pop         ecx
 0047835C    pop         ecx
 0047835D    mov         dword ptr fs:[eax],edx
 00478360    push        478375
 00478365    mov         eax,dword ptr [ebp-4]
 00478368    call        TObject.Free
 0047836D    ret
>0047836E    jmp         @HandleFinally
>00478373    jmp         00478365
 00478375    pop         ebx
 00478376    pop         ecx
 00478377    pop         ebp
 00478378    ret
end;*}

//0047837C
{*procedure TGLMaterialLibrary.sub_0047837C(?:?);
begin
 0047837C    push        ebp
 0047837D    mov         ebp,esp
 0047837F    push        ecx
 00478380    push        ebx
 00478381    mov         ebx,eax
 00478383    mov         ecx,edx
 00478385    mov         eax,[00466270];TBinaryReader
 0047838A    mov         dl,1
 0047838C    call        TBinaryReader.Create;TBinaryReader.Create
 00478391    mov         dword ptr [ebp-4],eax
 00478394    xor         eax,eax
 00478396    push        ebp
 00478397    push        4783C2
 0047839C    push        dword ptr fs:[eax]
 0047839F    mov         dword ptr fs:[eax],esp
 004783A2    mov         edx,dword ptr [ebp-4]
 004783A5    mov         eax,ebx
 004783A7    call        00477EA0
 004783AC    xor         eax,eax
 004783AE    pop         edx
 004783AF    pop         ecx
 004783B0    pop         ecx
 004783B1    mov         dword ptr fs:[eax],edx
 004783B4    push        4783C9
 004783B9    mov         eax,dword ptr [ebp-4]
 004783BC    call        TObject.Free
 004783C1    ret
>004783C2    jmp         @HandleFinally
>004783C7    jmp         004783B9
 004783C9    pop         ebx
 004783CA    pop         ecx
 004783CB    pop         ebp
 004783CC    ret
end;*}

//004783D0
{*function sub_004783D0(?:?; ?:?; ?:TBitmap):?;
begin
 004783D0    push        ebx
 004783D1    push        esi
 004783D2    push        edi
 004783D3    mov         edi,ecx
 004783D5    mov         ebx,edx
 004783D7    mov         eax,dword ptr [eax+34]
 004783DA    call        00477644
 004783DF    mov         esi,eax
 004783E1    mov         edx,ebx
 004783E3    mov         eax,esi
 004783E5    call        TGLLibMaterial.SetName
 004783EA    mov         eax,dword ptr [esi+18]
 004783ED    call        TGLMaterial.GetTexture
 004783F2    mov         ebx,eax
 004783F4    mov         dl,5
 004783F6    mov         eax,ebx
 004783F8    call        TGLTexture.SetMinFilter
 004783FD    mov         dl,1
 004783FF    mov         eax,ebx
 00478401    call        TGLTexture.SetMagFilter
 00478406    mov         dl,1
 00478408    mov         eax,ebx
 0047840A    call        TGLTexture.SetTextureMode
 0047840F    xor         edx,edx
 00478411    mov         eax,ebx
 00478413    call        TGLTexture.SetDisabled
 00478418    mov         edx,edi
 0047841A    mov         eax,dword ptr [ebx+24]
 0047841D    mov         ecx,dword ptr [eax]
 0047841F    call        dword ptr [ecx+8]
 00478422    mov         eax,esi
 00478424    pop         edi
 00478425    pop         esi
 00478426    pop         ebx
 00478427    ret
end;*}

//00478428
{*function sub_00478428(?:TGLMaterialLibrary):?;
begin
 00478428    test        eax,eax
>0047842A    je          00478435
 0047842C    mov         eax,dword ptr [eax+34]
 0047842F    call        004776DC
 00478434    ret
 00478435    xor         eax,eax
 00478437    ret
end;*}

//00478438
{*procedure sub_00478438(?:?; ?:?; ?:?);
begin
 00478438    push        ebp
 00478439    mov         ebp,esp
 0047843B    push        ecx
 0047843C    push        ebx
 0047843D    mov         ebx,edx
 0047843F    call        0046F4A8
 00478444    mov         edx,eax
 00478446    and         edx,0FF
 0047844C    mov         dword ptr [ebp-4],edx
 0047844F    fild        dword ptr [ebp-4]
 00478452    fld         tbyte ptr ds:[4784A0];0.00392156862745098:Extended
 00478458    fmulp       st(1),st
 0047845A    fstp        dword ptr [ebx]
 0047845C    wait
 0047845D    mov         edx,eax
 0047845F    shr         edx,8
 00478462    and         edx,0FF
 00478468    mov         dword ptr [ebp-4],edx
 0047846B    fild        dword ptr [ebp-4]
 0047846E    fld         tbyte ptr ds:[4784A0];0.00392156862745098:Extended
 00478474    fmulp       st(1),st
 00478476    fstp        dword ptr [ebx+4]
 00478479    wait
 0047847A    shr         eax,10
 0047847D    and         eax,0FF
 00478482    mov         dword ptr [ebp-4],eax
 00478485    fild        dword ptr [ebp-4]
 00478488    fld         tbyte ptr ds:[4784A0];0.00392156862745098:Extended
 0047848E    fmulp       st(1),st
 00478490    fstp        dword ptr [ebx+8]
 00478493    wait
 00478494    mov         eax,dword ptr [ebp+8]
 00478497    mov         dword ptr [ebx+0C],eax
 0047849A    pop         ebx
 0047849B    pop         ecx
 0047849C    pop         ebp
 0047849D    ret         4
end;*}

//004784AC
constructor sub_004784AC;
begin
{*
 004784AC    push        ebx
 004784AD    push        esi
 004784AE    test        dl,dl
>004784B0    je          004784BA
 004784B2    add         esp,0FFFFFFF0
 004784B5    call        @ClassCreate
 004784BA    mov         ebx,edx
 004784BC    mov         esi,eax
 004784BE    xor         edx,edx
 004784C0    mov         eax,esi
 004784C2    call        00472F14
 004784C7    mov         dword ptr [esi+2C],100;TGLFloatDataImage.?f2C:Integer
 004784CE    mov         dword ptr [esi+30],100;TGLFloatDataImage.?f30:Integer
 004784D5    mov         eax,esi
 004784D7    test        bl,bl
>004784D9    je          004784EA
 004784DB    call        @AfterConstruction
 004784E0    pop         dword ptr fs:[0]
 004784E7    add         esp,0C
 004784EA    mov         eax,esi
 004784EC    pop         esi
 004784ED    pop         ebx
 004784EE    ret
*}
end;

//004784F0
destructor TGLFloatDataImage.Destroy;
begin
{*
 004784F0    push        ebx
 004784F1    push        esi
 004784F2    call        @BeforeDestruction
 004784F7    mov         ebx,edx
 004784F9    mov         esi,eax
 004784FB    mov         eax,esi
 004784FD    mov         edx,dword ptr [eax]
 004784FF    call        dword ptr [edx+2C];TGLFloatDataImage.sub_004785EC
 00478502    mov         edx,ebx
 00478504    and         dl,0FC
 00478507    mov         eax,esi
 00478509    call        TGLTextureImage.Destroy
 0047850E    test        bl,bl
>00478510    jle         00478519
 00478512    mov         eax,esi
 00478514    call        @ClassDestroy
 00478519    pop         esi
 0047851A    pop         ebx
 0047851B    ret
*}
end;

//0047851C
procedure TGLFloatDataImage.Assign(Source:TPersistent);
begin
{*
 0047851C    push        ebx
 0047851D    push        esi
 0047851E    mov         ebx,edx
 00478520    mov         esi,eax
 00478522    test        ebx,ebx
>00478524    je          0047855E
 00478526    mov         eax,ebx
 00478528    mov         edx,dword ptr ds:[471458];TGLFloatDataImage
 0047852E    call        @IsClass
 00478533    test        al,al
>00478535    je          00478552
 00478537    mov         eax,ebx
 00478539    mov         edx,dword ptr [eax+2C]
 0047853C    mov         dword ptr [esi+2C],edx;TGLFloatDataImage.?f2C:Integer
 0047853F    mov         eax,dword ptr [eax+30]
 00478542    mov         dword ptr [esi+30],eax;TGLFloatDataImage.?f30:Integer
 00478545    mov         eax,esi
 00478547    mov         si,0FFFB
 0047854B    call        @CallDynaInst;TGLTextureImage.sub_00472FA0
>00478550    jmp         00478567
 00478552    mov         edx,ebx
 00478554    mov         eax,esi
 00478556    call        TPersistent.Assign
 0047855B    pop         esi
 0047855C    pop         ebx
 0047855D    ret
 0047855E    mov         edx,ebx
 00478560    mov         eax,esi
 00478562    call        TPersistent.Assign
 00478567    pop         esi
 00478568    pop         ebx
 00478569    ret
*}
end;

//0047856C
procedure TGLFloatDataImage.SetWidth(Value:Integer);
begin
{*
 0047856C    push        esi
 0047856D    cmp         edx,dword ptr [eax+2C];TGLFloatDataImage.?f2C:Integer
>00478570    je          0047858A
 00478572    mov         ecx,edx
 00478574    mov         dword ptr [eax+2C],ecx;TGLFloatDataImage.?f2C:Integer
 00478577    dec         ecx
>00478578    jge         00478581
 0047857A    mov         dword ptr [eax+2C],1;TGLFloatDataImage.?f2C:Integer
 00478581    mov         si,0FFFB
 00478585    call        @CallDynaInst;TGLTextureImage.sub_00472FA0
 0047858A    pop         esi
 0047858B    ret
*}
end;

//0047858C
function TGLFloatDataImage.GetWidth:Integer;
begin
{*
 0047858C    mov         eax,dword ptr [eax+2C];TGLFloatDataImage.?f2C:Integer
 0047858F    ret
*}
end;

//00478590
procedure TGLFloatDataImage.SetHeight(Value:Integer);
begin
{*
 00478590    push        esi
 00478591    cmp         edx,dword ptr [eax+30];TGLFloatDataImage.?f30:Integer
>00478594    je          004785AE
 00478596    mov         ecx,edx
 00478598    mov         dword ptr [eax+30],ecx;TGLFloatDataImage.?f30:Integer
 0047859B    dec         ecx
>0047859C    jge         004785A5
 0047859E    mov         dword ptr [eax+30],1;TGLFloatDataImage.?f30:Integer
 004785A5    mov         si,0FFFB
 004785A9    call        @CallDynaInst;TGLTextureImage.sub_00472FA0
 004785AE    pop         esi
 004785AF    ret
*}
end;

//004785B0
function TGLFloatDataImage.GetHeight:Integer;
begin
{*
 004785B0    mov         eax,dword ptr [eax+30];TGLFloatDataImage.?f30:Integer
 004785B3    ret
*}
end;

//004785B4
{*function sub_004785B4:?;
begin
 004785B4    push        ebx
 004785B5    push        esi
 004785B6    mov         ebx,eax
 004785B8    cmp         dword ptr [ebx+28],0;TGLFloatDataImage.?f28:TGLBitmap32
>004785BC    jne         004785E4
 004785BE    mov         dl,1
 004785C0    mov         eax,[0046F8F4];TGLBitmap32
 004785C5    call        TGLBitmap32.Create;TGLBitmap32.Create
 004785CA    mov         esi,eax
 004785CC    mov         dword ptr [ebx+28],esi;TGLFloatDataImage.?f28:TGLBitmap32
 004785CF    mov         edx,dword ptr [ebx+2C];TGLFloatDataImage.?f2C:Integer
 004785D2    mov         eax,esi
 004785D4    call        0047025C
 004785D9    mov         edx,dword ptr [ebx+30];TGLFloatDataImage.?f30:Integer
 004785DC    mov         eax,dword ptr [ebx+28];TGLFloatDataImage.?f28:TGLBitmap32
 004785DF    call        00470304
 004785E4    mov         eax,dword ptr [ebx+28];TGLFloatDataImage.?f28:TGLBitmap32
 004785E7    pop         esi
 004785E8    pop         ebx
 004785E9    ret
end;*}

//004785EC
procedure sub_004785EC;
begin
{*
 004785EC    push        ebx
 004785ED    mov         ebx,eax
 004785EF    mov         eax,dword ptr [ebx+28];TGLFloatDataImage.?f28:TGLBitmap32
 004785F2    test        eax,eax
>004785F4    je          00478600
 004785F6    call        TObject.Free
 004785FB    xor         eax,eax
 004785FD    mov         dword ptr [ebx+28],eax;TGLFloatDataImage.?f28:TGLBitmap32
 00478600    pop         ebx
 00478601    ret
*}
end;

//00478604
{*procedure TGLFloatDataImage.sub_00478604(?:?);
begin
 00478604    push        ebp
 00478605    mov         ebp,esp
 00478607    push        0
 00478609    push        0
 0047860B    push        0
 0047860D    push        ebx
 0047860E    push        esi
 0047860F    mov         esi,edx
 00478611    mov         ebx,eax
 00478613    xor         eax,eax
 00478615    push        ebp
 00478616    push        478681
 0047861B    push        dword ptr fs:[eax]
 0047861E    mov         dword ptr fs:[eax],esp
 00478621    push        478698;'[FloatDataImage]'+#13+#10+Width='
 00478626    mov         eax,ebx
 00478628    mov         edx,dword ptr [eax]
 0047862A    call        dword ptr [edx+18];TGLFloatDataImage.GetWidth
 0047862D    lea         edx,[ebp-8]
 00478630    call        IntToStr
 00478635    push        dword ptr [ebp-8]
 00478638    push        4786BC;#13+#10+Height='
 0047863D    mov         eax,ebx
 0047863F    mov         edx,dword ptr [eax]
 00478641    call        dword ptr [edx+14];TGLFloatDataImage.GetHeight
 00478644    lea         edx,[ebp-0C]
 00478647    call        IntToStr
 0047864C    push        dword ptr [ebp-0C]
 0047864F    lea         eax,[ebp-4]
 00478652    mov         edx,4
 00478657    call        @LStrCatN
 0047865C    mov         edx,dword ptr [ebp-4]
 0047865F    mov         eax,esi
 00478661    call        0046BCFC
 00478666    xor         eax,eax
 00478668    pop         edx
 00478669    pop         ecx
 0047866A    pop         ecx
 0047866B    mov         dword ptr fs:[eax],edx
 0047866E    push        478688
 00478673    lea         eax,[ebp-0C]
 00478676    mov         edx,3
 0047867B    call        @LStrArrayClr
 00478680    ret
>00478681    jmp         @HandleFinally
>00478686    jmp         00478673
 00478688    pop         esi
 00478689    pop         ebx
 0047868A    mov         esp,ebp
 0047868C    pop         ebp
 0047868D    ret
end;*}

//004786C8
{*procedure TGLFloatDataImage.sub_00472FD8(?:?);
begin
 004786C8    push        ebp
 004786C9    mov         ebp,esp
 004786CB    xor         ecx,ecx
 004786CD    push        ecx
 004786CE    push        ecx
 004786CF    push        ecx
 004786D0    push        ecx
 004786D1    push        ecx
 004786D2    push        ecx
 004786D3    push        ecx
 004786D4    push        ecx
 004786D5    push        ebx
 004786D6    push        esi
 004786D7    mov         esi,edx
 004786D9    mov         ebx,eax
 004786DB    xor         eax,eax
 004786DD    push        ebp
 004786DE    push        4787E0
 004786E3    push        dword ptr fs:[eax]
 004786E6    mov         dword ptr fs:[eax],esp
 004786E9    lea         eax,[ebp-8]
 004786EC    mov         edx,esi
 004786EE    call        @LStrLAsg
 004786F3    cmp         word ptr [ebx+22],0;TGLFloatDataImage.?f22:word
>004786F8    je          00478705
 004786FA    lea         ecx,[ebp-8]
 004786FD    mov         edx,ebx
 004786FF    mov         eax,dword ptr [ebx+24];TGLFloatDataImage.?f24:TGLTexture
 00478702    call        dword ptr [ebx+20]
 00478705    mov         eax,dword ptr [ebp-8]
 00478708    call        FileExists
 0047870D    test        al,al
>0047870F    je          0047878C
 00478711    mov         dl,1
 00478713    mov         eax,[00418350];TStringList
 00478718    call        TObject.Create;TStringList.Create
 0047871D    mov         dword ptr [ebp-4],eax
 00478720    xor         eax,eax
 00478722    push        ebp
 00478723    push        478785
 00478728    push        dword ptr fs:[eax]
 0047872B    mov         dword ptr fs:[eax],esp
 0047872E    mov         edx,dword ptr [ebp-8]
 00478731    mov         eax,dword ptr [ebp-4]
 00478734    mov         ecx,dword ptr [eax]
 00478736    call        dword ptr [ecx+68];TStrings.LoadFromFile
 00478739    lea         ecx,[ebp-0C]
 0047873C    mov         edx,4787F8;'Width'
 00478741    mov         eax,dword ptr [ebp-4]
 00478744    call        TStrings.GetValue
 00478749    mov         eax,dword ptr [ebp-0C]
 0047874C    call        StrToInt
 00478751    mov         dword ptr [ebx+2C],eax;TGLFloatDataImage.?f2C:Integer
 00478754    lea         ecx,[ebp-10]
 00478757    mov         edx,478808;'Height'
 0047875C    mov         eax,dword ptr [ebp-4]
 0047875F    call        TStrings.GetValue
 00478764    mov         eax,dword ptr [ebp-10]
 00478767    call        StrToInt
 0047876C    mov         dword ptr [ebx+30],eax;TGLFloatDataImage.?f30:Integer
 0047876F    xor         eax,eax
 00478771    pop         edx
 00478772    pop         ecx
 00478773    pop         ecx
 00478774    mov         dword ptr fs:[eax],edx
 00478777    push        4787C5
 0047877C    mov         eax,dword ptr [ebp-4]
 0047877F    call        TObject.Free
 00478784    ret
>00478785    jmp         @HandleFinally
>0047878A    jmp         0047877C
 0047878C    lea         eax,[ebp-14]
 0047878F    push        eax
 00478790    lea         edx,[ebp-18]
 00478793    mov         eax,[005AE6AC];^SResString16:TResStringRec
 00478798    call        LoadStr
 0047879D    mov         eax,dword ptr [ebp-18]
 004787A0    push        eax
 004787A1    mov         dword ptr [ebp-20],esi
 004787A4    mov         byte ptr [ebp-1C],0B
 004787A8    lea         edx,[ebp-20]
 004787AB    xor         ecx,ecx
 004787AD    pop         eax
 004787AE    call        Format
 004787B3    mov         eax,dword ptr [ebp-14]
 004787B6    mov         ecx,1862
 004787BB    mov         edx,478818;'C:\GLScene\glscene_v_1000714\Source\GLTexture.pas'
 004787C0    call        @Assert
 004787C5    xor         eax,eax
 004787C7    pop         edx
 004787C8    pop         ecx
 004787C9    pop         ecx
 004787CA    mov         dword ptr fs:[eax],edx
 004787CD    push        4787E7
 004787D2    lea         eax,[ebp-18]
 004787D5    mov         edx,5
 004787DA    call        @LStrArrayClr
 004787DF    ret
>004787E0    jmp         @HandleFinally
>004787E5    jmp         004787D2
 004787E7    pop         esi
 004787E8    pop         ebx
 004787E9    mov         esp,ebp
 004787EB    pop         ebp
 004787EC    ret
end;*}

//0047884C
{*procedure sub_0047884C(?:?);
begin
 0047884C    push        ebx
 0047884D    mov         ebx,edx
 0047884F    mov         eax,ebx
 00478851    mov         edx,478868;'FloatData Image'
 00478856    call        @LStrAsg
 0047885B    pop         ebx
 0047885C    ret
end;*}

//00478878
{*procedure sub_00478878(?:?);
begin
 00478878    push        ebx
 00478879    mov         ebx,edx
 0047887B    mov         eax,ebx
 0047887D    mov         edx,478894;'Image to be dynamically generated by OpenGL'
 00478882    call        @LStrAsg
 00478887    pop         ebx
 00478888    ret
end;*}

//004788C0
{*function sub_004788C0:?;
begin
 004788C0    mov         eax,84F5
 004788C5    ret
end;*}

Initialization
//00478948
{*
 00478948    push        ebp
 00478949    mov         ebp,esp
 0047894B    push        ecx
 0047894C    xor         eax,eax
 0047894E    push        ebp
 0047894F    push        4789CA
 00478954    push        dword ptr fs:[eax]
 00478957    mov         dword ptr fs:[eax],esp
 0047895A    sub         dword ptr ds:[5E14DC],1
>00478961    jae         004789BC
 00478963    call        0046F4C4
 00478968    mov         eax,[00470F00];TGLBlankImage
 0047896D    call        00472920
 00478972    mov         eax,[004710BC];TGLPersistentImage
 00478977    call        00472920
 0047897C    mov         eax,[004711AC];TGLPicFileImage
 00478981    call        00472920
 00478986    mov         eax,[004712B8];TGLCubeMapImage
 0047898B    call        00472920
 00478990    mov         eax,[00471458];TGLFloatDataImage
 00478995    call        00472920
 0047899A    mov         eax,[0047253C];TGLMaterialLibrary
 0047899F    mov         dword ptr [ebp-4],eax
 004789A2    lea         eax,[ebp-4]
 004789A5    xor         edx,edx
 004789A7    call        RegisterClasses
 004789AC    mov         edx,dword ptr ds:[424EB8];TBitmap
 004789B2    mov         eax,4789DC;'.bmp'
 004789B7    call        00472734
 004789BC    xor         eax,eax
 004789BE    pop         edx
 004789BF    pop         ecx
 004789C0    pop         ecx
 004789C1    mov         dword ptr fs:[eax],edx
 004789C4    push        4789D1
 004789C9    ret
>004789CA    jmp         @HandleFinally
>004789CF    jmp         004789C9
 004789D1    pop         ecx
 004789D2    pop         ebp
 004789D3    ret
*}
Finalization
//004788C8
{*
 004788C8    push        ebp
 004788C9    mov         ebp,esp
 004788CB    xor         eax,eax
 004788CD    push        ebp
 004788CE    push        47893E
 004788D3    push        dword ptr fs:[eax]
 004788D6    mov         dword ptr fs:[eax],esp
 004788D9    inc         dword ptr ds:[5E14DC]
>004788DF    jne         00478930
 004788E1    mov         eax,[005E14E4];gvar_005E14E4
 004788E6    call        TObject.Free
 004788EB    mov         eax,[005E14E0];gvar_005E14E0:TList
 004788F0    call        TObject.Free
 004788F5    xor         eax,eax
 004788F7    mov         [005E14E0],eax;gvar_005E14E0:TList
 004788FC    mov         eax,5E14E8;gvar_005E14E8:void 
 00478901    call        FreeAndNil
 00478906    mov         eax,5E14EC;gvar_005E14EC:void 
 0047890B    call        FreeAndNil
 00478910    mov         eax,5E14F4;gvar_005E14F4:?
 00478915    mov         edx,dword ptr ds:[472710];.32
 0047891B    call        @DynArrayClear
 00478920    mov         eax,5E14F0;gvar_005E14F0:?
 00478925    mov         edx,dword ptr ds:[4726EC];.22
 0047892B    call        @DynArrayClear
 00478930    xor         eax,eax
 00478932    pop         edx
 00478933    pop         ecx
 00478934    pop         ecx
 00478935    mov         dword ptr fs:[eax],edx
 00478938    push        478945
 0047893D    ret
>0047893E    jmp         @HandleFinally
>00478943    jmp         0047893D
 00478945    pop         ebp
 00478946    ret
*}
end.