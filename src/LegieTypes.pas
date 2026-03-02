{
  Legie - Game Type Definitions and Global Variables
  Reconstructed from IDR disassembly of legie_unpacked.exe.
  Global variable addresses mapped from gvar_XXXXXXXX identifiers.

  89 global variables mapped, 190 functions named.
  See analysis/mapping_report.txt for full details.
}
unit LegieTypes;

interface

uses
  Classes, SysUtils, fmodtypes;

{ ===== Game State Constants ===== }
const
  GS_IDLE       = 0;
  GS_INTRO      = 1;
  GS_GAMEPLAY   = 2;
  GS_DIALOGUE   = 3;
  GS_INVENTORY  = 4;
  GS_DIARY      = 5;
  GS_EQUIPMENT  = 6;
  GS_MAP        = 7;
  GS_MAINMENU   = $0C;
  GS_CUTSCENE   = $0D;
  GS_LOADING    = $0F;

  MAX_SFX_SAMPLES = 64;

{ ===== Sound Effect Indices ===== }
const
  SFX_DITE     = $00;  SFX_PTACI    = $01;  SFX_KRYSA    = $02;
  SFX_DVERE    = $03;  SFX_ZVON     = $04;  SFX_PIVO     = $05;
  SFX_MINCE    = $06;  SFX_LOUC     = $07;  SFX_KROK1    = $08;
  SFX_KROK2    = $09;  SFX_KROKB1   = $0A;  SFX_KROKB2   = $0B;
  SFX_ZAMCENO  = $0C;  SFX_KLIKA    = $0D;  SFX_VYBUCH   = $0E;
  SFX_KOVAR1   = $14;  SFX_KOVAR2   = $15;  SFX_KOVAR0   = $16;
  SFX_KRIK     = $17;  SFX_BRANA    = $18;  SFX_CAK0     = $19;
  SFX_CVAK     = $1A;  SFX_VRZ2     = $1B;  SFX_CACHTANI = $1C;
  SFX_KUN      = $1D;  SFX_SEK      = $1E;  SFX_ODEMK    = $1F;
  SFX_VRZ      = $20;  SFX_HOROR    = $21;  SFX_TYC      = $22;
  SFX_KYBL     = $23;  SFX_UHLI     = $24;  SFX_PAKA     = $25;
  SFX_PRAMEN   = $26;  SFX_ZAPAL    = $27;  SFX_OHEN     = $28;
  SFX_SKRT     = $29;  SFX_ZAMC     = $2A;  SFX_VZDUCH   = $2B;
  SFX_DOHOR    = $2C;  SFX_MON_0_Z  = $2D;  SFX_SEK2     = $2E;
  SFX_SEK3     = $2F;  SFX_MON_0_S  = $30;  SFX_HADR     = $31;
  SFX_ZBROJ    = $32;  SFX_DUM      = $33;  SFX_MON_0_X  = $34;
  SFX_MON_2_A  = $35;  SFX_MON_2_B  = $36;  SFX_MON_1_A  = $37;
  SFX_MON_1_B  = $38;  SFX_MON_1_C  = $39;  SFX_AU       = $3A;
  SFX_DUM2     = $3B;  SFX_VINO     = $3C;

{ ===== Music Track Indices ===== }
const
  MUS_BOURKA    = 0;   MUS_MESTO     = 1;   MUS_DUDY      = 2;
  MUS_LES       = 3;   MUS_BITVA     = 4;   MUS_DUNGEON   = 5;
  MUS_DREZINA   = 6;   MUS_AMBIENT   = 7;
  MUS_TEMPHUDBA = 9;   MUS_SUDOKOP   = 10;

{ ===== Record Types ===== }
type
  TKlikaciPole = record      { size $24 - clickable area }
    X1, Y1, X2, Y2: Integer;
    Action: Integer;
    Param: Integer;
    Name: AnsiString;
    Hint: AnsiString;
    Flags: Integer;
  end;

  TRozhovorData = record     { size $2C - dialogue node }
    Text: AnsiString;
    Speaker, SoundFile, NextNode: Integer;
    Condition, Action: Integer;
    Param1, Param2, Param3, Param4: Integer;
    Flags: Integer;
  end;

  TMizejiciHlaska = record   { size $14 - fading message }
    Text: AnsiString;
    Alpha, FadeSpeed: Single;
    X, Y: Integer;
  end;

  TRozhovorVyberData = record { size $8 - dialogue choice }
    Text: AnsiString;
    TargetNode: Integer;
  end;

{ ===== Global Variables (from gvar_XXXXXXXX mapping) ===== }
var
  { -- Application -- }
  AppPath: AnsiString;              { gvar_005F5EE8 }
  IsDemo: Boolean;                  { gvar_005AE0C8 }
  IsFullVersion: Boolean;           { gvar_005AE0C4 }
  BroadcastMsg: Cardinal;           { gvar_005F5DE4 }
  OldWndProc: Longint;              { gvar_005F5DE0 }

  { -- Game State Machine -- }
  GameState: Byte;                  { gvar_005F5577 - 34 refs, 16 writes }
  PrevGameState: Byte;              { gvar_005F5576 }
  GameSubState: Byte;               { gvar_005F5596 }
  GameLoading: Boolean;             { gvar_005F5DF8 }
  PlayerInCombat: Boolean;          { gvar_005F5574 }

  { -- Timing -- }
  AccumulatedTime: Double;          { gvar_005F5540 }
  GameSpeed: Single;                { gvar_005F5554 }
  FrameCounter: Integer;            { gvar_005F55A0 }

  { -- Display -- }
  ViewerWidth: Integer;             { gvar_005F5548 }
  ViewerHeight: Integer;            { gvar_005F554C }
  InvertMouse: Boolean;             { gvar_005F5550 }
  InvertMouseReg: Boolean;          { gvar_005F552D }
  MouseSensitivity: Byte;           { gvar_005F5D34 }
  MouseSensReg: ShortInt;           { gvar_005F552E }
  MenuActiveFlags: Byte;            { gvar_005F5D2E - nonzero when save/load unlocked }

  { -- Input -- }
  MouseX: Integer;                  { gvar_005F5EE0 }
  MouseY: Integer;                  { gvar_005F5EE4 }
  PrevMouseX: Integer;              { gvar_005F5DE8 }
  PrevMouseY: Integer;              { gvar_005F5DEC }
  TargetMouseX: Integer;             { gvar_005F5DF0 - screen center X in menu mode }
  TargetMouseY: Integer;             { gvar_005F5DF4 - screen center Y in menu mode }
  IdleCounter: Integer;             { gvar_005F5DFC }
  MouseWheelDelta: Integer;         { gvar_005FE494 }

  { -- Sound -- }
  SFXSamples: array[0..MAX_SFX_SAMPLES-1] of PFSoundSample;  { gvar_005F5380 }
  MusicStream: PFSoundStream;       { gvar_005F5374 }
  AmbientStream: PFSoundStream;     { gvar_005F5378 }
  CurrentMusic: ShortInt;           { gvar_005F537C }
  CurrentAmbient: ShortInt;         { gvar_005F537D }
  MusicChannel: Integer;            { gvar_005F54EC }
  SplashChannel: Integer;           { gvar_005F54F0 }
  SpringChannel: Integer;           { gvar_005F54F4 }
  MasterVolume: Byte;               { gvar_005F552C }
  SFXToggle: Byte;                  { gvar_005F5575 }

  { -- Music stream memory buffers -- }
  StreamDungeon: TMemoryStream;     { gvar_005F54F8 }
  StreamBourka: TMemoryStream;      { gvar_005F54FC }
  StreamDrezina: TMemoryStream;     { gvar_005F5500 }
  StreamBitva: TMemoryStream;       { gvar_005F5504 }
  StreamMesto: TMemoryStream;       { gvar_005F5508 }
  StreamLes: TMemoryStream;         { gvar_005F550C }
  StreamAmbient: TMemoryStream;     { gvar_005F5510 }
  StreamTempHudba: TMemoryStream;   { gvar_005F5514 }
  StreamDudy: TMemoryStream;        { gvar_005F5518 }
  StreamSudokop: TMemoryStream;     { gvar_005F551C }

  { -- Player -- }
  MenuHoverIndex: Byte;             { gvar_005F5D08 - menu hover in state $0C, health in gameplay }
  DialogueText: AnsiString;         { gvar_005F5D18 }
  DialogueActive: Boolean;          { gvar_005F5D38 }
  PlayerPosData: Pointer;           { gvar_005F5DA4 }

  { -- Inventory/Equipment -- }
  HasHelmet: Boolean;               { gvar_005F5592 }
  HasArmor: Boolean;                { gvar_005F5593 }
  EquipFlags1: Byte;                { gvar_005F5594 }
  EquipFlags2: Byte;                { gvar_005F5595 }
  ShowBorders: Word;                { gvar_005F5590 }
  SaveSlot: Integer;                { gvar_005F555C }
  SaveData1: Integer;               { gvar_005F5530 }
  SaveData2: Integer;               { gvar_005F5534 }

  { -- Menu animation -- }
  PlochaDirection: ShortInt;        { gvar_005F5D81 - +1 increasing, -1 decreasing }
  PlochaAlpha: Single;              { gvar_005F5D84 - oscillates between 0.1 and 0.25 }
  SmokeSpawnTimer: Integer;         { counter for smoke particle spawning }

  { -- Scene/Rendering -- }
  Form1Ref: Pointer;                { gvar_005F5524 - 71 refs }
  GameDataPtr: Pointer;             { gvar_005FE498 - 24 refs }
  FadeAlpha: Single;                { gvar_005FE678 }
  SceneFlag1: Boolean;              { gvar_005FE688 }
  SceneFlag2: Byte;                 { gvar_005FE6A1 }
  TextureFormatFlag: Byte;          { gvar_005FDD48 - 0=JPG, 1=TGA }
  SceneFlag3: Boolean;              { gvar_005FDD49 }
  GLScenePtr: Pointer;              { gvar_005AF664 - 51 refs }
  MaterialsPtr: Pointer;            { gvar_005AD060 - 21 refs }
  SceneObjPtr1: Pointer;            { gvar_005E0E88 - 29 refs }
  SceneObjPtr2: Pointer;            { gvar_005E0E8C }
  ActorPtr: Pointer;                { gvar_005E0870 }
  NPCState: Byte;                   { gvar_005E0CE2 }
  NPCState2: Byte;                  { gvar_005E0CE7 }
  ClickAreaCount: Integer;          { gvar_005E1340 }
  ClickData1: Integer;              { gvar_005E1384 }
  ClickData2: Integer;              { gvar_005E1388 }
  ClickData3: Pointer;              { gvar_005E1390 - 18 refs }
  ClickData4: Pointer;              { gvar_005E1394 - 18 refs }
  AnimState: Integer;               { gvar_005E14AC }
  PAKInstance: Pointer;             { gvar_005E15A8 }

implementation

end.
