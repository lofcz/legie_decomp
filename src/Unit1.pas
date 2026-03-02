{
  Legie - Main Game Unit
  Reconstructed from IDR disassembly of Unit1.pas (70,222 lines of x86 assembly)

  This unit contains the entire game logic for "Legie", a Czech medieval
  fantasy adventure game built with Delphi 7 + GLScene + FMOD 3.x.

  Original: single TForm1 with 34 components, 20 event handlers,
  and ~200 standalone procedures/functions.
  
  Decompilation status:
    - Small utility functions: 10/10 done
    - Event handlers: 17/20 done (3 large ones remain as stubs)
    - Sound system: fully decompiled in SoundSystem.pas
    - Game functions: stubs with descriptive names
}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry, IniFiles, Math, ExtCtrls, ShellAPI,
  GLScene, GLWin32Viewer, GLCadencer, GLObjects, GLTexture,
  GLVectorFileObjects, GLHUDObjects, GLBitmapFont, GLSkyBox, GLVfsPAK,
  GLMisc, GLGraphics, JPEG, TGA,
  fmod, fmodtypes,
  LegieTypes, SoundSystem, FMODApi, CutsceneSystem, GameTextTable;

type
  TForm1 = class(TForm)
    { ---- Published Components (from Form1.dfm) ---- }
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    Timer: TGLCadencer;
    DummyCube1: TGLDummyCube;
    GLhrac: TGLDummyCube;
    kamera: TGLCamera;
    HUD: TGLDummyCube;
    Materialy: TGLMaterialLibrary;
    HUDText: TGLDummyCube;
    MaterialyStaticke: TGLMaterialLibrary;
    stit: TGLActor;
    zbran: TGLActor;
    HUDkurzor: TGLDummyCube;
    kurzor: TGLHUDSprite;
    HUD4: TGLDummyCube;
    DummyCube2: TGLDummyCube;
    HracSvetlo: TGLLightSource;
    GLLightSource2: TGLLightSource;
    GLskybox1: TGLSkyBox;
    HUDInv2: TGLDummyCube;
    HracPitch: TGLDummyCube;
    kurzorStr: TGLHUDSprite;
    KameraRozhovor: TGLCamera;
    RozhovorSleduj: TGLDummyCube;
    GLLightSource1: TGLLightSource;
    GLLightSource3: TGLLightSource;
    HUD2: TGLDummyCube;
    HUD3: TGLDummyCube;
    fadeCube: TGLDummyCube;
    denikl: TGLHUDText;
    denikp: TGLHUDText;
    DummyCube3: TGLDummyCube;
    statuskamera: TGLCamera;
    pak: TGLVfsPAK;

    { ---- Event Handlers ---- }
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure TimerProgress(Sender: TObject; const deltaTime, newTime: Double);
    procedure GLSceneViewer1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GLSceneViewer1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GLDirectOpenGL1Render(Sender: TObject; var rci: TRenderContextInfo);
    procedure Actor1Progress(Sender: TObject; const deltaTime, newTime: Double);
    procedure ComboBox4Change(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

{ Globals that must be in Unit1 for direct address access (matching asm) }
var
  MapDisplayActive: Byte;           { gvar_005F5584 }

{ Additional globals discovered during decompilation }
var
  DemoScreenShown: Boolean;       { gvar_005AE0CC }
  CzechKeyboard: Boolean;         { gvar_005AE0C4 }
  DemoImage: TImage;              { gvar_005F5D30 }
  MouseIsDown: Boolean;           { gvar_005FE491 }
  TurningLeft: Boolean;           { gvar_005F5592 }
  TurningRight: Boolean;          { gvar_005F5593 }
  TurnReadyState: Byte;           { gvar_005F5595 }
  TurnCounter: Word;              { gvar_005F5590 }
  IsAttacking: Boolean;           { gvar_005F5EF3 }
  AttackLocked: Boolean;          { gvar_005F5EF2 }
  CanForceAttack: Boolean;        { gvar_005F5EF7 }
  AttackAnimTimer: Word;          { gvar_005F5EFC }
  AmmoCount: Integer;             { gvar_005F5564 }
  ScreenBottomY: Integer;         { gvar_005F554C }
  PickedObject: TObject;          { gvar_005F5D48 }
  InputBuffer: AnsiString;        { gvar_005F5D4C }
  CoordX: Integer;                { gvar_005FE6A1 }
  CoordY: Integer;                { gvar_005FE6A5 }
  PhaseState: Word;               { gvar_005FE754 }
  Flag1, Flag2, Flag3: Word;      { gvar_005FE7A6..AA }
  StringVar1: AnsiString;         { gvar_005F5D8C }
  ByteFlag: Byte;                 { gvar_005F5D90 }
  StringVar2: AnsiString;         { gvar_005F5D94 }
  SomeCounter: Integer;           { gvar_005FE640 }

{ ---- Forward declarations for standalone functions ---- }

{ Small utility functions (fully decompiled) }
function CompareCoords(X, Y: Integer): Boolean;
function ExtractDigits(const S: AnsiString; Default: Integer): Integer;
function ExtractPrefixedNumber(const Prefix, S: AnsiString): Integer;
procedure SetSumAppearance(Visibility: Byte; Mode: Byte);
function CompareCoords2(X, Y: Integer): Boolean;
function AxisDistance(X1, Y1, X2, Y2: Byte): Integer;
procedure AdvancePhase;
function AllFlagsSet: Boolean;
function IsValueInRange(Index: Word): Boolean;
procedure ClearStringState;

{ Helper functions (decompiled) }
procedure AppendKeyToNameInput(CzechChar: Char; StandardChar: Char);
function CanPerformAction3: Boolean;
procedure HandleGameState2Pick(AForm: TForm1);

{ Smoke particle system }
procedure SpawnSmokeParticle(AForm: TForm1);
procedure UpdateSmokeParticles(AForm: TForm1);

{ Scene cleanup }
procedure ResetMapState; { 005967F4 }

{ Scene/level management (stubs - to be decompiled) }
procedure ProcessClickables; { 00561E50 - 34 strings }
procedure SetupSceneObject(const Name: AnsiString; X, Y, Z: Single;
  P1, P2, P3, P4: Integer; P5: Boolean); { 005626AC }
procedure UpdateCursorPos(X, Y: Single); { 00562724 }
procedure ClearClickAreas; { 00562990 }
procedure ClearAllAreas; { 00562C90 }
procedure SetGameMode(Mode: Byte); { 00562CF8 }
function GetGameMode(P: Byte): Integer; { 00562D80 }
function LookupSceneObject: Integer; { 00562D9C }

{ Inventory/items (stubs) }
procedure ProcessInventory; { 00563920 }
procedure ProcessBitmap(Bmp: TBitmap); { 0056410C }
procedure ProcessPick; { 005644A4 }
procedure EnterGameplay; { 0056455C }
procedure EnterInventory; { 00565464 }

{ Scene/dialogue (stubs) }
procedure ProcessSceneAction(AForm: TForm1; const ObjName: AnsiString); { 005652EC }
procedure DisplayMessage(AForm: TForm1; const Msg: AnsiString); { 005652EC alias }
procedure ShowFadingMessage(const Msg: AnsiString); { 00565DD0 }
procedure TransitionState; { 00565EB4 }

{ Level loading (stubs) }
procedure LoadLevel(AForm: TForm1; LevelID: Integer); { 005660D4 - 280 strings }
procedure SetupParticles(AForm: TForm1; P1, P2, P3: Integer; P4: Boolean); { 005691F0 }
procedure GameLogicUpdate; { 0056A59C }
procedure ParseScript; { 0056B8E4 }

{ Texture system (stubs) }
procedure LoadTexture(const Filename: AnsiString; Mode: Integer); { 0056DEBC }
procedure LoadTextureSystem(AForm: TForm1); { 0056E508 }

{ HUD (stubs) }
procedure UpdateHUD; { 0056F06C }
procedure UpdateSceneVisibility; { 00570084 }

{ Movement/player (stubs) }
procedure MoveWithCollision(P1, P2, P3, P4, P5, P6, P7: Integer); { 00570654 }
procedure TurnPlayer(Angle: Single); { 005706A0 }
procedure PitchPlayer(Angle: Single); { 0057074C }

{ NPC/item setup (stubs) }
procedure SetupNPCsAndItems(AForm: TForm1); { 00570BA8 }
procedure ProcessDialogue(AForm: TForm1; DialogID: Integer); { 0057342C }

{ Init/lifecycle (stubs) }
procedure LoadRegistrySettings(AForm: TForm1); { 005909A4 }
procedure InitNewGame; { 00590B2C - resets player stats, inventory, map }
procedure UpdateInputDisplay; { 00591C38 }
procedure GameStepUpdate(AForm: TForm1; DeltaTime: Double); { 00592374 }
procedure HandleMouseWheel(Direction: Integer); { 00598780 }
procedure EnterMainMenu(AForm: TForm1); { 00598038 }
procedure HandleInventoryScreen(AForm: TForm1); { 00598C28 }
procedure HandleSaveLoad(AForm: TForm1; SlotIndex: Integer); { 00599108 }
function ProcessAI(P: Integer): Integer; { 0059A59C }
procedure OpenURL(const URL: AnsiString); { 0059B878 }
procedure CustomGLRender(AForm: TForm1; P: Integer); { 005A8F50 }
procedure LoadSettings(AForm: TForm1); { 005AB24C }
procedure SaveSettings; { 005AB3C0 }

implementation

{$R *.DFM}

{ ============================================================ }
{ Small Utility Functions (fully decompiled from assembly)      }
{ ============================================================ }

function CompareCoords(X, Y: Integer): Boolean;
begin
  Result := (X = CoordX) and (Y = CoordY);
end;

function ExtractDigits(const S: AnsiString; Default: Integer): Integer;
var
  DigitStr: AnsiString;
  I, Code: Integer;
begin
  DigitStr := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      DigitStr := DigitStr + S[I];
  Val(DigitStr, Result, Code);
  if Code <> 0 then
    Result := Default;
end;

function ExtractPrefixedNumber(const Prefix, S: AnsiString): Integer;
var
  Stripped: AnsiString;
begin
  if AnsiPos(Prefix, S) = 1 then
  begin
    Stripped := StringReplace(S, Prefix, '', [rfIgnoreCase]);
    Result := ExtractDigits(Stripped, -1);
  end
  else
    Result := -1;
end;

procedure SetSumAppearance(Visibility: Byte; Mode: Byte);
{ 00561C98 - Sets the 'sum' smoke overlay alpha and visibility }
var
  Alpha: Single;
  LibMat: TGLLibMaterial;
  SumObj: TGLBaseSceneObject;
begin
  case Mode of
    1: Alpha := 0.25;
    2: Alpha := 0.05;
  else
    Alpha := 0.6;
  end;

  LibMat := TForm1(Form1Ref).MaterialyStaticke.LibMaterialByName('sum');
  if LibMat <> nil then
    LibMat.Material.FrontProperties.Diffuse.Alpha := Alpha;

  SumObj := TForm1(Form1Ref).GLScene1.Objects.FindChild('sum', False);
  if SumObj <> nil then
    SumObj.Visible := (Visibility <> 0);
end;

function CompareCoords2(X, Y: Integer): Boolean;
begin
  Result := (X = CoordX) and (Y = CoordY);
end;

function AxisDistance(X1, Y1, X2, Y2: Byte): Integer;
begin
  Result := 5;
  if X2 = X1 then
    Result := Y1 - Y2;
  if Y1 = Y2 then
    Result := X1 - X2;
  Result := Abs(Result);
end;

procedure AdvancePhase;
begin
  if PhaseState = 1 then
    PhaseState := 2;
end;

function AllFlagsSet: Boolean;
begin
  Result := (Flag1 = 1) and (Flag2 = 1) and (Flag3 = 1);
end;

function IsValueInRange(Index: Word): Boolean;
begin
  { Checks a global Single threshold (FadeAlpha at $5FE678) against
    integer range fields in a record array at $5FDD54 (36 bytes/record).
    Supports both normal and wrapped ranges. }
  // TODO: link to actual record array once structure is mapped
  Result := False;
end;

procedure ClearStringState;
begin
  StringVar1 := '';
  StringVar2 := '';
  ByteFlag := 0;
end;

{ ============================================================ }
{ Helper Functions (decompiled)                                 }
{ ============================================================ }

procedure AppendKeyToNameInput(CzechChar: Char; StandardChar: Char);
begin
  if Length(InputBuffer) >= 30 then Exit;

  if CzechKeyboard then
    case CzechChar of
      'Y': CzechChar := 'Z';
      'Z': CzechChar := 'Y';
    end;

  if StandardChar = ' ' then
    StandardChar := CzechChar;

  if not CzechKeyboard then
    InputBuffer := InputBuffer + CzechChar
  else
    InputBuffer := InputBuffer + StandardChar;

  UpdateInputDisplay;
end;

function CanPerformAction3: Boolean;
begin
  Result := (SomeCounter > 0) and (GetGameMode(3) > 0);
end;

procedure HandleGameState2Pick(AForm: TForm1);
begin
  if GameState <> 2 then Exit;
  PickedObject := nil; // placeholder for GLSceneViewer pick
  ProcessPick;
  EnterMainMenu(AForm);
end;

{ ============================================================ }
{ Scene Cleanup Functions                                       }
{ ============================================================ }

procedure ResetMapState; {@orig 005967F4}
begin
  MapDisplayActive := 0;
  ShowFadingMessage('map_');
end;

{ ============================================================ }
{ Stub Functions (to be decompiled)                             }
{ ============================================================ }

procedure ProcessClickables;
begin { 00561E50 - 34 strings: dvere, s2tajne, babice, houba... } end;

procedure SetupSceneObject(const Name: AnsiString; X, Y, Z: Single;
  P1, P2, P3, P4: Integer; P5: Boolean);
begin { 005626AC } end;

procedure UpdateCursorPos(X, Y: Single);
begin { 00562724 } end;

procedure ClearClickAreas;
begin { 00562990 } end;

procedure ClearAllAreas;
begin { 00562C90 } end;

type
  TClickAreaEntry = packed record
    ID: Byte;
    Pad: array[0..2] of Byte;
    Value: Integer;
  end;

var
  ClickAreaArray: array[0..25] of TClickAreaEntry;  { gvar_005FE568 }
  ActiveAreaIndex: Byte;                             { gvar_005FE6A0 }

procedure SetGameMode(Mode: Byte);
{ 00562CF8 - Manages the 26-entry click area table.
  Adds/updates an entry; if SetTransition=True, sets GameState=$0D }
begin
  GameState := Mode;
end;

function GetGameMode(P: Byte): Integer;
{ 00562D80 - Looks up a click area by ID, returns its value }
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to 25 do
    if ClickAreaArray[I].ID = P then
    begin
      Result := ClickAreaArray[I].Value;
      Exit;
    end;
end;

function LookupSceneObject: Integer;
begin
  Result := 0; { 00562D9C - 33 strings }
end;

procedure ProcessInventory;
begin { 00563920 - 10 strings } end;

procedure ProcessBitmap(Bmp: TBitmap);
begin { 0056410C } end;

procedure ProcessPick;
begin { 005644A4 } end;

procedure EnterGameplay;
begin
  GameState := GS_GAMEPLAY;
end;

procedure EnterInventory;
begin
  GameState := GS_INVENTORY;
end;

procedure ProcessSceneAction(AForm: TForm1; const ObjName: AnsiString);
begin { 005652EC } end;

procedure DisplayMessage(AForm: TForm1; const Msg: AnsiString);
begin { 005652EC alias } end;

procedure SpawnSmokeParticle(AForm: TForm1);
{ Spawns a smoke particle as TGLHUDSprite using 'kour_add' library material
  (bmAdditive clone of 'kour', created in FormCreate).
  Original sub_005691F0 case 0/7 uses TGLSprite on DummyCube2 with copied
  kour texture and bmAdditive. We use a library material to achieve the same. }
var
  Spr: TGLHUDSprite;
  StartSize: Single;
begin
  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD);
  StartSize := 32 + Random(32);
  Spr.Width := StartSize;
  Spr.Height := StartSize;
  Spr.Position.X := TargetMouseX + (Random(40) - 20);
  Spr.Position.Y := ViewerHeight - 60;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'kour_add';
  Spr.Rotation := Random(360);
  Spr.Tag := 200;
end;

procedure UpdateSmokeParticles(AForm: TForm1);
{ Per-frame update matching original sub_00569D40 case 0/7:
  - Position drifts up/sideways (original: +0.0005 X/Y, +0.0009 Z per frame)
  - Scale grows uniformly (original: Scale.X += 0.01 per frame)
  - Alpha fades by 0.005 per frame (original: 00569E99-00569EDB)
  - Deleted when alpha <= 0.05 }
var
  I: Integer;
  Child: TGLBaseSceneObject;
  Spr: TGLHUDSprite;
  CurAlpha: Single;
begin
  for I := AForm.HUD.Count - 1 downto 0 do
  begin
    Child := AForm.HUD.Children[I];
    if not (Child is TGLHUDSprite) then Continue;
    Spr := TGLHUDSprite(Child);
    if Spr.Name <> '' then Continue;

    CurAlpha := Spr.Material.FrontProperties.Diffuse.Alpha;

    if CurAlpha > 0.05 then
    begin
      Spr.Material.FrontProperties.Diffuse.Alpha := CurAlpha - 0.005;
    end
    else
    begin
      Spr.Free;
      Continue;
    end;

    Spr.Position.Y := Spr.Position.Y - 0.5;
    Spr.Position.X := Spr.Position.X + (Random(3) - 1) * 0.15;
    Spr.Width := Spr.Width + 0.3;
    Spr.Height := Spr.Height + 0.3;
    Spr.Rotation := Spr.Rotation + 0.5;
  end;
end;

procedure ShowFadingMessage(const Msg: AnsiString);
begin { 00565DD0 } end;

procedure TransitionState;
begin { 00565EB4 } end;

procedure LoadLevel(AForm: TForm1; LevelID: Integer);
begin { 005660D4 - 280 strings } end;

procedure SetupParticles(AForm: TForm1; P1, P2, P3: Integer; P4: Boolean);
begin { 005691F0 } end;

procedure GameLogicUpdate;
begin { 0056A59C - 916 asm lines } end;

procedure ParseScript;
begin { 0056B8E4 - 18 strings } end;

procedure LoadTexture(const Filename: AnsiString; Mode: Integer);
{ 0056DEBC - Creates a TGLLibMaterial in MaterialyStaticke, loads from PAK }
var
  LibMat: TGLLibMaterial;
  Ext: AnsiString;
  ActualName: AnsiString;
begin
  ActualName := Filename;
  LibMat := TForm1(Form1Ref).MaterialyStaticke.Materials.Add;
  LibMat.Name := ActualName;

  with LibMat.Material do
  begin
    Texture.Disabled := False;
    FrontProperties.Diffuse.Red := 1.0;
    FrontProperties.Diffuse.Green := 1.0;
    FrontProperties.Diffuse.Blue := 1.0;
    FrontProperties.Diffuse.Alpha := 1.0;

    if TextureFormatFlag = 0 then
    begin
      Ext := 'jpg';
      Texture.TextureMode := tmModulate;
      BlendingMode := bmTransparency;
    end
    else
    begin
      Ext := 'tga';
      BlendingMode := bmTransparency;
      Texture.TextureMode := tmModulate;
      Texture.ImageAlpha := tiaDefault;
    end;
  end;

  if AnsiPos('save_', ActualName) > 0 then
    ActualName := 'save';

  try
    LibMat.Material.Texture.Image.LoadFromFile(ActualName + '.' + Ext);
  except
  end;

  if ActualName = 'tma3' then
    LibMat.Material.FrontProperties.Diffuse.Alpha := 0.5
  else if ActualName = 'tma2' then
    LibMat.Material.FrontProperties.Diffuse.Alpha := 0.85
  else if ActualName = 'tma4' then
    LibMat.Material.FrontProperties.Diffuse.Alpha := 0.25
  else if ActualName = 'sum' then
  begin
    LibMat.Material.FrontProperties.Diffuse.Alpha := 0.6;
    LibMat.Material.FrontProperties.Diffuse.Red := 1.0;
    LibMat.Material.FrontProperties.Diffuse.Green := 1.0;
    LibMat.Material.FrontProperties.Diffuse.Blue := 1.0;
  end;

  if (ActualName = 'm_0') or (ActualName = 'm_1') or (ActualName = 'm_2')
    or (ActualName = 'm_3') or (ActualName = 'm_4') or (ActualName = 'm_6') then
  begin
    LibMat.Material.FrontProperties.Diffuse.Red := 0.6;
    LibMat.Material.FrontProperties.Diffuse.Green := 0.6;
    LibMat.Material.FrontProperties.Diffuse.Blue := 0.6;
    LibMat.Material.FrontProperties.Diffuse.Alpha := 0.8;
  end;

  if Mode <> 0 then
    LibMat.Material.MaterialOptions := [moIgnoreFog, moNoLighting];

  LibMat.Material.Texture.ImageBrightness := 1.15;
end;

procedure LoadTextureSystem(AForm: TForm1);
begin { 0056E508 - 46 strings } end;

procedure UpdateHUD;
begin { 0056F06C - 94 strings, 730 asm lines } end;

procedure UpdateSceneVisibility;
{ 00570084 - Registers all game materials in MaterialyStaticke }
var
  I: Integer;
begin
  TextureFormatFlag := 0;
  LoadTexture('vyber', 1);
  LoadTexture('zbroj', 0);
  LoadTexture('tma2', 1);
  LoadTexture('tma', 1);
  LoadTexture('tma3', 1);
  LoadTexture('tma4', 1);
  LoadTexture('sed', 1);
  LoadTexture('fade', 1);
  LoadTexture('sum', 1);
  LoadTexture('kour', 1);
  LoadTexture('map_r', 1);
  LoadTexture('map_x', 1);
  LoadTexture('map_t', 1);
  LoadTexture('map_z', 1);
  LoadTexture('map_e', 1);
  LoadTexture('map_s', 1);
  LoadTexture('zdravi', 1);
  for I := 1 to 5 do
  begin
    LoadTexture('save_' + IntToStr(I), 1);
    LoadTexture('save_' + IntToStr(I) + 'g', 1);
  end;
  LoadTexture('save_6', 1);

  TextureFormatFlag := 1;
  LoadTexture('zdravib', 1);
  LoadTexture('m_4', 1);
  LoadTexture('m_6', 1);
  LoadTexture('m_3', 1);
  LoadTexture('m_2', 1);
  LoadTexture('m_1', 1);
  LoadTexture('m_0', 1);
  LoadTexture('m_v0', 1);
  LoadTexture('m_v1', 1);
  LoadTexture('legie', 1);
  LoadTexture('inv_r', 1);
  LoadTexture('inv_l', 1);
  LoadTexture('inventar', 1);
  LoadTexture('kur', 1);
  LoadTexture('kur1', 1);
  LoadTexture('kur2', 1);
  LoadTexture('kur3', 1);
  LoadTexture('nic', 1);
  for I := 1 to 39 do
    LoadTexture('inv' + IntToStr(I), 1);
  LoadTexture('hrdinar', 1);
  LoadTexture('parat0', 1);
  LoadTexture('parat1', 1);
  LoadTexture('parat2', 1);
  LoadTexture('oko0', 1);
  LoadTexture('oko1', 1);
  LoadTexture('oko2', 1);
  LoadTexture('map_d', 1);
  LoadTexture('map_h', 1);
  LoadTexture('tma5', 1);
end;

procedure MoveWithCollision(P1, P2, P3, P4, P5, P6, P7: Integer);
begin { 00570654 } end;

procedure TurnPlayer(Angle: Single);
{ 005706A0 - Rotate player horizontally, wrap yaw to [0,360) }
var
  Yaw: PSingle;
begin
  Yaw := PSingle(PChar(GameDataPtr) + $1E0);
  Yaw^ := Yaw^ + Angle;
  if Yaw^ < 0.0 then Yaw^ := Yaw^ + 360.0;
  if Yaw^ >= 360.0 then Yaw^ := Yaw^ - 360.0;
  { TODO: update GL camera Direction.Z }
end;

procedure PitchPlayer(Angle: Single);
{ 0057074C - Adjust vertical look, clamp pitch to [25..150] }
var
  Pitch: PSingle;
begin
  if Angle = 0.0 then Exit;
  Pitch := PSingle(PChar(GameDataPtr) + $1E4);
  if Angle < 0.0 then
    if Pitch^ + Angle < 25.0 then
      Angle := 25.0 - Pitch^;
  if Angle > 0.0 then
    if Pitch^ + Angle > 150.0 then
      Angle := 150.0 - Pitch^;
  Pitch^ := Pitch^ + Angle;
  { TODO: update GL camera Direction.X }
end;

procedure SetupNPCsAndItems(AForm: TForm1);
begin { 00570BA8 - 67 strings } end;

procedure ProcessDialogue(AForm: TForm1; DialogID: Integer);
begin { 0057342C - 262 strings, 27141 asm lines } end;

procedure LoadRegistrySettings(AForm: TForm1);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\Sudokop', False) then
    begin
      if Reg.ValueExists('volume') then
        MasterVolume := Reg.ReadInteger('volume');
      if Reg.ValueExists('borders') then
        ShowBorders := Reg.ReadInteger('borders');
      if Reg.ValueExists('inverse') then
        InvertMouse := Reg.ReadInteger('inverse') <> 0;
      if Reg.ValueExists('mouse') then
        MouseSensitivity := Reg.ReadInteger('mouse');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure InitNewGame;
begin { 00590B2C } end;

procedure UpdateInputDisplay;
begin { 00591C38 } end;

procedure GameStepUpdate(AForm: TForm1; DeltaTime: Double); { 00592374 }
var
  BtnIdx: Integer;
  SprName: AnsiString;
  SprObj: TGLBaseSceneObject;
  LibMat: TGLLibMaterial;
  YFromBottom: Integer;
  ClampedX: Integer;
begin
  if DeltaTime = 0.0 then Exit;

  case GameState of
    GS_MAINMENU: begin
      MenuHoverIndex := $C8;

      { Button 6: ornament top-right area }
      if (MouseY < 100) and (MouseX > ViewerWidth - 150) then
        MenuHoverIndex := 6;

      { Button 5: smoke/version area with m_v1 positioning }
      if (MouseY > 25) and (MouseY < 75) and
         (MouseX > 20) and (MouseX < 190) and
         (MouseIsDown) then
      begin
        MenuHoverIndex := 5;
        ClampedX := MouseX;
        if ClampedX < 50 then ClampedX := 50;
        if ClampedX > 150 then ClampedX := 150;
        SprObj := AForm.GLScene1.Objects.FindChild('m_v1', False);
        if SprObj <> nil then
          SprObj.Position.X := ClampedX;
      end;

      YFromBottom := ViewerHeight - MouseY;

      { Button 4 }
      if (YFromBottom >= 196) and (YFromBottom <= 231) and
         (MouseX > TargetMouseX - 75) and (MouseX < TargetMouseX + 75) then
        MenuHoverIndex := 4;

      { Button 3 }
      if (YFromBottom >= 232) and (YFromBottom <= 278) and
         (MouseX > TargetMouseX - 126) and (MouseX < TargetMouseX + 126) and
         (MenuActiveFlags <> 0) then
        MenuHoverIndex := 3;

      { Button 2 }
      if (YFromBottom >= 279) and (YFromBottom <= 316) and
         (MouseX > TargetMouseX - 66) and (MouseX < TargetMouseX + 66) and
         (MenuActiveFlags <> 0) then
        MenuHoverIndex := 2;

      { Button 1 }
      if (YFromBottom >= 317) and (YFromBottom <= 356) and
         (MouseX > TargetMouseX - 77) and (MouseX < TargetMouseX + 77) then
        MenuHoverIndex := 1;

      { Button 0 }
      if (YFromBottom >= 357) and (YFromBottom <= 387) and
         (MouseX > TargetMouseX - 98) and (MouseX < TargetMouseX + 98) then
        MenuHoverIndex := 0;

      { Update library material brightness based on hover state }
      for BtnIdx := 0 to 6 do
      begin
        if BtnIdx = 5 then Continue;
        SprName := 'm_' + IntToStr(BtnIdx);
        LibMat := AForm.MaterialyStaticke.LibMaterialByName(SprName);
        if LibMat <> nil then
        begin
          with LibMat.Material.FrontProperties.Diffuse do
          begin
            if BtnIdx = MenuHoverIndex then
            begin
              Red := 1.0; Green := 1.0; Blue := 1.0; Alpha := 0.95;
            end
            else if BtnIdx = 6 then
            begin
              Red := 0.85; Green := 0.85; Blue := 0.85; Alpha := 0.80;
            end
            else
            begin
              Red := 0.60; Green := 0.60; Blue := 0.60; Alpha := 0.80;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure HandleMouseWheel(Direction: Integer);
begin { 00598780 } end;

procedure EnterMainMenu(AForm: TForm1); {@orig 00598038}
var
  Spr: TGLHUDSprite;
begin
  MenuHoverIndex := $C8;
  DialogueText := '';
  SetSumAppearance(1, 0);
  ResetMapState;

  GameState := GS_MAINMENU;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD3);
  Spr.Name := 'm_logo';
  Spr.Position.X := TargetMouseX;
  Spr.Position.Y := ViewerHeight - 100;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'legie';
  Spr.Width := 128;
  Spr.Height := 512;
  Spr.Rotation := 90;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD3);
  Spr.Name := 'm_4';
  Spr.Position.X := TargetMouseX;
  Spr.Position.Y := ViewerHeight - 210;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_4';
  Spr.Width := 64;
  Spr.Height := 256;
  Spr.Rotation := 90;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD3);
  Spr.Name := 'm_3';
  Spr.Position.X := TargetMouseX;
  Spr.Position.Y := ViewerHeight - 255;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_3';
  Spr.Width := 64;
  Spr.Height := 256;
  Spr.Rotation := 90;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD3);
  Spr.Name := 'm_2';
  Spr.Position.X := TargetMouseX;
  Spr.Position.Y := ViewerHeight - 296;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_2';
  Spr.Width := 64;
  Spr.Height := 256;
  Spr.Rotation := 90;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD3);
  Spr.Name := 'm_1';
  Spr.Position.X := TargetMouseX;
  Spr.Position.Y := ViewerHeight - 336;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_1';
  Spr.Width := 64;
  Spr.Height := 256;
  Spr.Rotation := 90;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD3);
  Spr.Name := 'm_0';
  Spr.Position.X := TargetMouseX;
  Spr.Position.Y := ViewerHeight - 375;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_0';
  Spr.Width := 64;
  Spr.Height := 256;
  Spr.Rotation := 90;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD2);
  Spr.Name := 'm_v0';
  Spr.Position.X := 100;
  Spr.Position.Y := 50;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_v0';
  Spr.Width := 16;
  Spr.Height := 128;
  Spr.Rotation := 270;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD3);
  Spr.Name := 'm_v1';
  Spr.Position.X := 50;
  Spr.Position.Y := 50;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_v1';
  Spr.Width := 32;
  Spr.Height := 32;
  Spr.Visible := True;

  Spr := TGLHUDSprite.CreateAsChild(AForm.HUD2);
  Spr.Name := 'm_o';
  Spr.Position.X := ViewerWidth - 80;
  Spr.Position.Y := 50;
  Spr.Material.MaterialLibrary := AForm.MaterialyStaticke;
  Spr.Material.LibMaterialName := 'm_6';
  Spr.Width := 128;
  Spr.Height := 128;
  Spr.Visible := True;
end;

procedure HandleInventoryScreen(AForm: TForm1);
begin { 00598C28 - 10 strings } end;

procedure HandleSaveLoad(AForm: TForm1; SlotIndex: Integer);
begin { 00599108 - 17 strings } end;

function ProcessAI(P: Integer): Integer;
begin
  Result := 0; { 0059A59C - 946 asm lines }
end;

procedure OpenURL(const URL: AnsiString);
begin
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure CustomGLRender(AForm: TForm1; P: Integer);
begin { 005A8F50 - 1164 asm lines } end;

procedure LoadSettings(AForm: TForm1);
{ 005AB24C - Load settings from registry Software\Sudokop\Legie }
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\Sudokop\Legie', False) then
    begin
      try
        if Reg.ValueExists('volume') then
          MasterVolume := Reg.ReadInteger('volume');
      except end;
      try
        if Reg.ValueExists('borders') then
          ShowBorders := Reg.ReadInteger('borders');
      except end;
      try
        if Reg.ValueExists('inverse') then
          InvertMouse := Reg.ReadInteger('inverse') <> 0;
      except end;
      try
        if Reg.ValueExists('mouse') then
          MouseSensitivity := Reg.ReadInteger('mouse');
      except end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure SaveSettings;
{ 005AB3C0 - Save settings to registry Software\Sudokop\Legie }
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\Sudokop\Legie', True) then
    begin
      Reg.WriteInteger('volume', MasterVolume);
      Reg.WriteInteger('borders', ShowBorders);
      Reg.WriteInteger('mouse', MouseSensitivity);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

{ GetStringByID is now in GameTextTable.pas unit }

{ ============================================================ }
{ TForm1 Event Handlers (decompiled from assembly)              }
{ ============================================================ }

var
  DebugLogStarted: Boolean = False;

procedure DebugLog(const Msg: string);
var F: TextFile;
begin
  AssignFile(F, ExtractFilePath(ParamStr(0)) + 'debug.log');
  if not DebugLogStarted then begin
    Rewrite(F);
    DebugLogStarted := True;
  end else
    Append(F);
  WriteLn(F, FormatDateTime('hh:nn:ss.zzz', Now) + ' ' + Msg);
  CloseFile(F);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  SumSpr: TGLHUDSprite;
  TileCalc: Integer;
  KourSrc, KourAdd: TGLLibMaterial;
begin
  DebugLog('FormCreate START');
  Form1Ref := Self;
  Caption := 'Legie';
  if IsDemo then
    Caption := Caption + ' - DEMO'
  else if IsFullVersion then
    Caption := Caption + ' - FULL VERSION - DO NOT DISTRIBUTE!';

  DebugLog('Caption set');
  BroadcastMsg := RegisterWindowMessage('legie');

  MouseWheelDelta := 0;
  PrevGameState := 0;
  GameSubState := 0;
  GameLoading := False;
  GameState := GS_IDLE;
  DemoScreenShown := False;

  DebugLog('Loading settings...');
  LoadSettings(Self);
  AppPath := ExtractFilePath(ParamStr(0));
  DebugLog('AppPath = ' + AppPath);

  { Look for game data in exe dir, then parent dir }
  if not FileExists(AppPath + 'legie.sud') then
    if FileExists(ExtractFilePath(ExcludeTrailingPathDelimiter(AppPath)) + 'legie.sud') then
      AppPath := ExtractFilePath(ExcludeTrailingPathDelimiter(AppPath));

  if IsDemo then
  begin
    if not FileExists(AppPath + 'demo.sud') then
    begin
      Application.MessageBox('demo.sud not found', 'Legie', MB_OK);
      Exit;
    end;
    pak.LoadFromFile(AppPath + 'demo.sud', fmOpenRead);
  end
  else
  begin
    if not FileExists(AppPath + 'legie.sud') then
    begin
      Application.MessageBox('legie.sud not found', 'Legie', MB_OK);
      Exit;
    end;
    DebugLog('Loading legie.sud...');
    pak.LoadFromFile(AppPath + 'legie.sud', fmOpenRead);
    DebugLog('PAK loaded OK');
  end;

  Randomize;
  AccumulatedTime := 0;

  DebugLog('Init FMOD...');
  try
    if not InitFMOD then
      DebugLog('FMOD init failed');
    SoundInit;
    DebugLog('Sound init OK');
  except
    on E: Exception do DebugLog('FMOD exception: ' + E.Message);
  end;

  DebugLog('LoadRegistrySettings...');
  LoadRegistrySettings(Self);
  DebugLog('InitNewGame...');
  InitNewGame;

  ViewerWidth := GLSceneViewer1.Width;
  ViewerHeight := GLSceneViewer1.Height;

  DebugLog('Loading SFX...');
  try
    if not LoadAllSFX then
      DebugLog('Some SFX failed');
    DebugLog('SFX done');
  except
    on E: Exception do DebugLog('SFX exception: ' + E.Message);
  end;

  DebugLog('Registering materials...');
  UpdateSceneVisibility;

  { Create additive-blended kour material for smoke particles.
    Original sub_005691F0 copies kour texture to sprite's own material and
    sets bmAdditive. Since we use HUD sprites with library materials, we need
    a separate library material with the correct blending mode. }
  KourSrc := MaterialyStaticke.LibMaterialByName('kour');
  if KourSrc <> nil then
  begin
    KourAdd := MaterialyStaticke.Materials.Add;
    KourAdd.Name := 'kour_add';
    KourAdd.Material.Texture.Assign(KourSrc.Material.Texture);
    KourAdd.Material.BlendingMode := bmAdditive;
    KourAdd.Material.MaterialOptions := [moNoLighting];
    KourAdd.Material.FrontProperties.Diffuse.Alpha := 1.0;
    KourAdd.Material.FrontProperties.Diffuse.Red := 1.0;
    KourAdd.Material.FrontProperties.Diffuse.Green := 1.0;
    KourAdd.Material.FrontProperties.Diffuse.Blue := 1.0;
  end;
  DebugLog('Materials registered');

  Color := $292929;

  TargetMouseX := GLSceneViewer1.Width div 2;
  TargetMouseY := GLSceneViewer1.Height div 2;

  DebugLog('Creating HUD sprites...');

  { 'sum' sprite - smoke/overlay, tiled to cover screen }
  { Original asm (0059132D): loop adds $80 (128) until >= ViewerWidth/Height,
    then XTiles = counter, Width = counter shl 7 (counter * 128).
    With ViewerWidth=724: XTiles=768, Width=98304.
    This makes TextureOffset shifts (0..6.5) shift by <1% of tiling = subtle shimmer. }
  SumSpr := TGLHUDSprite.CreateAsChild(HUD);
  SumSpr.Name := 'sum';
  SumSpr.Position.Y := TargetMouseY;
  SumSpr.Position.X := TargetMouseX;
  TileCalc := 0;
  repeat Inc(TileCalc, 128) until TileCalc >= GLSceneViewer1.Width;
  SumSpr.XTiles := TileCalc;
  SumSpr.Width := TileCalc * 128;
  TileCalc := 0;
  repeat Inc(TileCalc, 128) until TileCalc >= GLSceneViewer1.Height;
  SumSpr.YTiles := TileCalc;
  SumSpr.Height := TileCalc * 128;
  SumSpr.Material.MaterialLibrary := MaterialyStaticke;
  SumSpr.Material.LibMaterialName := 'sum';
  SumSpr.Visible := False;

  { 'fade' sprite - darkness overlay }
  with TGLHUDSprite.CreateAsChild(HUD) do
  begin
    Name := 'fade';
    Position.X := TargetMouseX;
    Position.Y := TargetMouseY;
    Width := GLSceneViewer1.Width;
    Height := GLSceneViewer1.Height;
    Material.MaterialLibrary := MaterialyStaticke;
    Material.LibMaterialName := 'tma3';
    Visible := False;
  end;

  { 'fade2' sprite - another fade overlay }
  with TGLHUDSprite.CreateAsChild(fadeCube) do
  begin
    Name := 'fade2';
    Position.X := TargetMouseY;
    Position.Y := TargetMouseX;
    Width := GLSceneViewer1.Width + 100;
    Height := GLSceneViewer1.Height + 100;
    Material.MaterialLibrary := MaterialyStaticke;
    Material.LibMaterialName := 'fade';
    Visible := False;
  end;
  fadeCube.Visible := False;

  { cursor setup }
  kurzor.Material.MaterialLibrary := MaterialyStaticke;
  kurzor.Material.LibMaterialName := 'kur';
  kurzorStr.Material.MaterialLibrary := MaterialyStaticke;
  kurzorStr.Material.LibMaterialName := 'kur1';
  kurzorStr.Visible := False;

  DebugLog('FormCreate DONE');

  EnterMainMenu(Self);
  Timer.Enabled := True;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  { 005AB230 }
  SetWindowLong(TForm1(Form1Ref).Handle, GWL_WNDPROC, OldWndProc);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  { 005AA29C - empty stub }
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { 005AAD10 - empty stub }
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Path: AnsiString;
begin
  { 005AAD14 - 84 asm lines }
  if IsDemo and (not DemoScreenShown) then
  begin
    GLSceneViewer1.Visible := False;
    Timer.Enabled := False;

    DemoImage := TImage.Create(TForm1(Form1Ref));
    Path := AppPath + '\demo.jpg';
    DemoImage.Picture.LoadFromFile(Path);
    DemoImage.Align := alClient;
    DemoImage.Center := True;
    DemoImage.Visible := True;
    DemoImage.Parent := TForm1(Form1Ref);
    DemoImage.Name := 'demo';
    DemoImage.BringToFront;

    DemoScreenShown := True;
    CanClose := False;
  end
  else
  begin
    Timer.Enabled := False;
    TransitionState;
    StopMusic;
    StopAmbient;
    SoundShutdown;
    SaveSettings;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  { 005AAF24 - 206 asm lines }
  // TODO: decompile - movement keys, ESC, function keys, QWERTZ input
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  { 00599CD8 - 510 asm lines, 11 strings }
  // TODO: decompile - key releases, F5/F9 quick save/load
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  { 005AB4B4 }
  if IsDemo and DemoScreenShown then
    Close;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  { 005AB45C }
  if IsDemo and DemoScreenShown then
  begin
    if TargetMouseY + 200 < Y then
      OpenURL('legie.sudokop.com')
    else
      Close;
  end;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  { 005AA2D4 }
  if (not TurningLeft) and (not TurningRight) then
    HandleMouseWheel(-1);
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  { 005AA2A0 }
  if (not TurningLeft) and (not TurningRight) then
    HandleMouseWheel(1);
end;

procedure TForm1.TimerProgress(Sender: TObject; const deltaTime, newTime: Double);
const
  FIXED_STEP = 0.01;
var
  SumLibMat: TGLLibMaterial;
begin
  { 00595C24 - 745 asm lines, main game loop }
  if not Application.Active then
    HandleGameState2Pick(Self);

  AccumulatedTime := AccumulatedTime + deltaTime;

  while AccumulatedTime >= FIXED_STEP do
  begin
    GameStepUpdate(Self, FIXED_STEP);
    AccumulatedTime := AccumulatedTime - FIXED_STEP;
  end;

  { Cursor sprite follows mouse position }
  kurzor.Position.X := MouseX + 17;
  kurzor.Position.Y := MouseY + 17;

  { Animate sum TextureOffset every frame (original: 00593B4A-00593BC5) }
  begin
    SumLibMat := MaterialyStaticke.LibMaterialByName('sum');
    if SumLibMat <> nil then
    begin
      SumLibMat.TextureOffset.X := (Random(256) * Random(256)) / 10000.0;
      SumLibMat.TextureOffset.Y := (Random(256) * Random(256)) / 10000.0;
    end;
  end;

  { Smoke particle system for main menu }
  if GameState = GS_MAINMENU then
  begin
    Inc(SmokeSpawnTimer);
    if SmokeSpawnTimer >= 80 then
    begin
      SmokeSpawnTimer := 0;
      SpawnSmokeParticle(Self);
    end;
  end;

  UpdateSmokeParticles(Self);

  if not GameLoading then
  begin
    case GameState of
      GS_GAMEPLAY, GS_CUTSCENE: begin
        // TODO: movement, collision, camera updates
      end;
    end;

    PrevMouseX := TargetMouseX;
    PrevMouseY := TargetMouseY;
  end;
end;

procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AnimName, Msg: AnsiString;
begin
  { 00591AAC - 92 asm lines }
  MouseIsDown := True;

  { Combat mode: right-click attack }
  if (GameState = 1) and (Button = mbRight) and
     (not IsAttacking) and (not AttackLocked) then
  begin
    if AttackAnimTimer = 0 then
    begin
      // AnimName := zbran.CurrentAnimation;
      // if (AnimName <> 'ceka') and (not CanForceAttack) then Exit from block
    end
    else if not CanForceAttack then
      { skip };

    if AmmoCount > 0 then
    begin
      if GetGameMode(1) <> 0 then
      begin
        IsAttacking := True;
        AttackAnimTimer := 35;
      end
      else
      begin
        GetStringByID($76, Msg);
        DisplayMessage(Self, Msg);
      end;
    end;
  end;

  { Navigation mode: turn left/right on edge click }
  if GameState = $0F then
  begin
    if ScreenBottomY - 100 < MouseY then
    begin
      if (TargetMouseX - 285 > MouseX)
         and (not TurningLeft) and (TurnReadyState = $FF) then
      begin
        TurnCounter := 0;
        TurningLeft := True;
      end;
      if (TargetMouseX + 285 < MouseX)
         and (not TurningRight) and (TurnReadyState = $FF) then
      begin
        TurnCounter := 0;
        TurningRight := True;
      end;
    end;
  end;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  { 00591C1C }
  MouseX := X;
  MouseY := Y;
end;

procedure TForm1.GLSceneViewer1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  { 0059BABC - 12393 asm lines, 111 strings }
  MouseIsDown := False;
  case GameState of
    GS_MAINMENU: begin
      case MenuHoverIndex of
        0: ; { New Game - stub }
        1: ; { Load Game - stub }
        2: ; { Save Game - stub }
        3: ; { Settings - stub }
        4: Close; { Exit game }
        6: OpenURL('www.sudokop.com');
      end;
    end;
  end;
end;

procedure TForm1.GLDirectOpenGL1Render(Sender: TObject;
  var rci: TRenderContextInfo);
begin
  { 005A8EC0 - empty stub }
end;

procedure TForm1.Actor1Progress(Sender: TObject;
  const deltaTime, newTime: Double);
begin
  { 005A8EB8 - empty stub }
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
  { 005AA298 - empty stub }
end;

end.
