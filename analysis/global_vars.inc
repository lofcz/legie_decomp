{ Global Variables - Reconstructed from gvar_XXXXXXXX addresses }
var
  { Game variables }
  IsFullVersion: Boolean;  { gvar_005AE0C4 - Shows "FULL VERSION" in title }
  IsDemo: Boolean;  { gvar_005AE0C8 - Controls demo.sud vs legie.sud loading }
  MusicStream: Pointer;  { gvar_005F5374 - Current music FSOUND_Stream }
  AmbientStream: Pointer;  { gvar_005F5378 - Ambient FSOUND_Stream }
  CurrentMusic: ShortInt;  { gvar_005F537C - Current music track (-1=none) }
  CurrentAmbient: ShortInt;  { gvar_005F537D - Current ambient track (-1=none) }
  SFXSamples: array[0..63] of Pointer;  { gvar_005F5380 - SFX sample handles }
  MusicChannel: Integer;  { gvar_005F54EC - Active music channel }
  SplashChannel: Integer;  { gvar_005F54F0 - Splashing sound channel }
  SpringChannel: Integer;  { gvar_005F54F4 - Spring sound channel }
  StreamDungeon: TMemoryStream;  { gvar_005F54F8 - dungeon.ogg buffer }
  StreamBourka: TMemoryStream;  { gvar_005F54FC - bourka.ogg buffer }
  StreamDrezina: TMemoryStream;  { gvar_005F5500 - drezina.ogg buffer (full only) }
  StreamBitva: TMemoryStream;  { gvar_005F5504 - bitva.ogg buffer (full only) }
  StreamMesto: TMemoryStream;  { gvar_005F5508 - mesto.ogg buffer }
  StreamLes: TMemoryStream;  { gvar_005F550C - les.ogg buffer (full only) }
  StreamAmbient: TMemoryStream;  { gvar_005F5510 - ambient.ogg buffer (full only) }
  StreamTempHudba: TMemoryStream;  { gvar_005F5514 - temphudba.ogg buffer }
  StreamDudy: TMemoryStream;  { gvar_005F5518 - dudy.ogg buffer }
  StreamSudokop: TMemoryStream;  { gvar_005F551C - sudokop.ogg buffer }
  Form1Ref: TForm1;  { gvar_005F5524 - Global form reference (71 reads) }
  MasterVolume: Byte;  { gvar_005F552C - Master volume from registry }
  InvertMouseReg: Boolean;  { gvar_005F552D - Registry inverse value }
  MouseSensReg: ShortInt;  { gvar_005F552E - Mouse sensitivity from registry }
  SaveData1: Integer;  { gvar_005F5530 - Save-related data 1 }
  SaveData2: Integer;  { gvar_005F5534 - Save-related data 2 }
  AccumulatedTime: Double;  { gvar_005F5540 - Time accumulator in game loop }
  ViewerWidth: Integer;  { gvar_005F5548 - GLSceneViewer width }
  ViewerHeight: Integer;  { gvar_005F554C - GLSceneViewer height }
  InvertMouse: Boolean;  { gvar_005F5550 - Mouse inversion }
  GameSpeed: Single;  { gvar_005F5554 - Game speed multiplier }
  SaveSlot: Integer;  { gvar_005F555C - Current save slot }
  PlayerInCombat: Boolean;  { gvar_005F5574 - Combat mode flag (9 refs) }
  SFXToggle: Byte;  { gvar_005F5575 - SFX mode toggle (0-2) }
  PrevGameState: Byte;  { gvar_005F5576 - Previous game state }
  GameState: Byte;  { gvar_005F5577 - Main game state 0-0xF (34 refs) }
  ShowBorders: Word;  { gvar_005F5590 - Border display flags }
  HasHelmet: Boolean;  { gvar_005F5592 - Helmet equipped }
  HasArmor: Boolean;  { gvar_005F5593 - Armor equipped }
  EquipFlags1: Byte;  { gvar_005F5594 - Equipment bitflag 1 }
  EquipFlags2: Byte;  { gvar_005F5595 - Equipment bitflag 2 }
  GameSubState: Byte;  { gvar_005F5596 - Sub-state flag }
  FrameCounter: Integer;  { gvar_005F55A0 - Frame counter }
  PlayerHealth: Byte;  { gvar_005F5D08 - Health/menu index (context-dependent) }
  DialogueText: AnsiString;  { gvar_005F5D18 - Current dialogue text (10 refs) }
  MouseSensitivity: Byte;  { gvar_005F5D34 - Mouse sensitivity divisor }
  DialogueActive: Boolean;  { gvar_005F5D38 - Dialogue active flag (8 refs) }
  PlayerPosData: Pointer;  { gvar_005F5DA4 - Player position data (11 refs) }
  OldWndProc: Longint;  { gvar_005F5DE0 - SetWindowLong GWL_WNDPROC }
  BroadcastMsg: Cardinal;  { gvar_005F5DE4 - RegisterWindowMessage(legie) }
  PrevMouseX: Integer;  { gvar_005F5DE8 - Previous mouse X }
  PrevMouseY: Integer;  { gvar_005F5DEC - Previous mouse Y }
  TargetMouseX: Single;  { gvar_005F5DF0 - Target mouse X }
  TargetMouseY: Single;  { gvar_005F5DF4 - Target mouse Y }
  GameLoading: Boolean;  { gvar_005F5DF8 - Loading flag checked in TimerProgress }
  IdleCounter: Integer;  { gvar_005F5DFC - Idle timeout counter }
  MouseX: Integer;  { gvar_005F5EE0 - Current mouse X }
  MouseY: Integer;  { gvar_005F5EE4 - Current mouse Y }
  AppPath: AnsiString;  { gvar_005F5EE8 - ExtractFilePath(ParamStr(0)) }

  { Scene variables }
  ActorPtr: Pointer;  { gvar_005E0870 - Actor pointer (12 refs) }
  NPCState: Byte;  { gvar_005E0CE2 - NPC state (14 refs) }
  NPCState2: Byte;  { gvar_005E0CE7 - NPC state 2 }
  SceneObjPtr1: Pointer;  { gvar_005E0E88 - Scene object (29 refs) }
  SceneObjPtr2: Pointer;  { gvar_005E0E8C - Scene object (12 refs) }
  ClickAreaCount: Integer;  { gvar_005E1340 - Clickable area count (14 refs) }
  ClickData1: Integer;  { gvar_005E1384 - Click data 1 }
  ClickData2: Integer;  { gvar_005E1388 - Click data 2 (8 refs, 6 writes) }
  ClickData3: Pointer;  { gvar_005E1390 - Click data 3 (18 refs) }
  ClickData4: Pointer;  { gvar_005E1394 - Click data 4 (18 refs) }
  AnimState: Integer;  { gvar_005E14AC - Animation state (8 refs) }
  FMODInitCount: Integer;  { gvar_005E159C - FMOD init reference counter }
  OldFPUCW: Word;  { gvar_005E15A0 - Saved FPU control word }
  PAKInstance: Pointer;  { gvar_005E15A8 - Global TGLVfsPAK instance }

  { OpenGL variables }
  GL_Var1: Integer;  { gvar_00607DE4 - OpenGL state var }
  GL_Var2: Integer;  { gvar_00607DE8 - OpenGL state var }
  GL_Var3: Integer;  { gvar_00607DF0 - OpenGL state var }
  GL_Var4: Integer;  { gvar_00607DF4 - OpenGL state var }
  GL_Var5: Integer;  { gvar_00607E00 - OpenGL state var }
  GL_Var6: Integer;  { gvar_00607E04 - OpenGL state var }
  GL_Var7: Integer;  { gvar_00607E08 - OpenGL state var }
  GL_Var8: Integer;  { gvar_00607E1C - OpenGL state var }

  { Other variables }
  MaterialsPtr: Pointer;  { gvar_005AD060 - Materials pointer (21 refs) }
  GLScenePtr: Pointer;  { gvar_005AF664 - GLScene related (51 refs) }
  SceneFlag3: Boolean;  { gvar_005FDD49 - Scene init flag }
  MouseWheelDelta: Integer;  { gvar_005FE494 - Mouse wheel accumulator }
  GameDataPtr: Pointer;  { gvar_005FE498 - Main game data structure (24 refs) }
  FadeAlpha: Single;  { gvar_005FE678 - Screen fade alpha }
  SceneFlag1: Boolean;  { gvar_005FE688 - Scene rendering flag }
  SceneFlag2: Byte;  { gvar_005FE6A1 - Scene state byte }
