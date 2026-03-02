{ Function Forward Declarations - Reconstructed from sub_XXXXXXXX }

{ ---- GLScene ---- }
// 004804A0  FindSceneObject                 Find scene object by name

{ ---- GLVfsPAK ---- }
// 004A3268  PAKOpenFile                     Open file from PAK archive
// 004A3668  PAKGetStream                    Get file stream from PAK

{ ---- Unit1 ---- }
// 00561B60  CompareCoords                   Compare two coordinate values
// 00561B78  ExtractDigits                   Extract digits from string
// 00561D80  Util_561D80                     Small utility
// 00561E34  Util_561E34                     Small utility
// 00561E50  ProcessClickables               Process clickable objects (dvere, babice...)
// 005626AC  SetupSceneObj                   Multi-param scene object setup
// 00562724  UpdateCursorPos                 Update cursor position
// 00562780  UpdateCursor2                   Secondary cursor update
// 005627E4  ClearCursor                     Clear cursor state
// 00562858  GetClickArea                    Get clickable area at position
// 005628C8  GetClickInfo                    Get click area info
// 00562904  RegisterClickArea               Register new clickable area
// 00562938  UpdateClickArea                 Update clickable area
// 00562990  ClearClickAreas                 Clear all click areas
// 005629A8  AddClickArea                    Add click area with params
// 00562C90  ClearAllAreas                   Clear all clickable areas
// 00562CF8  SetGameMode                     Set game state/mode
// 00562D80  GetGameMode                     Get current game mode
// 00562D9C  LookupSceneObj                  Scene object lookup (33 strings)
// 00563900  InventoryCheck                  Check inventory state
// 00563920  ProcessInventory                Process inventory (10 strings)
// 0056410C  ProcessBitmap                   Bitmap processing
// 005641E4  ApplyBitmapEffect               Apply effect to bitmap
// 005644A4  UpdateInventoryUI               Update inventory UI
// 005644EC  GetInventoryItem                Get inventory item
// 00564514  SetInventoryItem                Set inventory item
// 00564544  ClearInventory                  Clear inventory display
// 0056455C  EnterGameplay                   Transition to gameplay state
// 005645A0  ExitGameplay                    Exit gameplay state
// 005645E0  UpdateGameplay                  Update gameplay state
// 005647E0  LoadMaterial                    Load material/texture
// 0056493C  LoadNPCModel                    Load NPC model (netopyr, obluda...)
// 00564CE4  BuildSceneElem                  Build scene element
// 00564EF0  GetSceneElem                    Get scene element
// 00564F08  RemoveSceneElem                 Remove scene element
// 00564F74  UpdateSceneElem                 Update scene element
// 00564FE0  ClearSceneElems                 Clear scene elements
// 00565000  SceneElemAction                 Scene element action
// 005652EC  ProcessSceneAction              Process named object action
// 00565374  SceneActionHelper               Scene action helper
// 00565444  StartDialogue                   Start dialogue sequence
// 00565464  EnterInventory                  Enter inventory screen
// 00565528  LoadStringRes                   Load string resource
// 00565558  ClearDialogue                   Clear dialogue state
// 005655D4  ShowDialogueText                Show dialogue text
// 00565684  DialogueChoice                  Process dialogue choice
// 005656C8  EndDialogue                     End dialogue sequence
// 005657C4  DialogueNext                    Advance dialogue
// 00565810  ShowFadingMsg                   Show fading message overlay
// 005658A8  HideFadingMsg                   Hide fading message
// 00565B50  UpdateFadingMsg                 Update fading messages
// 00565C20  GetFadingMsgAlpha               Get fading msg alpha
// 00565D08  IsFadingMsgActive               Check if fading msg active
// 00565D68  ClearFadingMsgs                 Clear all fading messages
// 00565D88  AddFadingMsg                    Add fading message
// 00565DD0  ShowMessage                     Show text message
// 00565E64  ClearMessage                    Clear text message
// 00565EB4  TransitionState                 Transition game state
// 00566098  LoadLevelHelper                 Level load helper
// 005660D4  LoadLevel                       Load level/area (280 strings!)
// 005691F0  SetupParticles                  Setup particle effects (kour, jiskra...)
// 00569D40  UpdateLevel                     Update level state
// 0056A59C  GameLogicUpdate                 Main game logic (916 lines)
// 0056B494  CheckCollision                  Collision detection
// 0056B548  CanMove                         Movement check
// 0056B558  MoveForward                     Move player forward
// 0056B5EC  MoveBackward                    Move player backward
// 0056B6EC  MoveSideways                    Strafe movement
// 0056B760  MoveToPos                       Move to position
// 0056B790  StopMovement                    Stop player movement
// 0056B7A0  ShowSubtitle                    Show subtitle text
// 0056B8E4  ParseScript                     Parse game script (r,z,t,x,d...)
// 0056D460  ScriptCommand                   Execute script command
// 0056D60C  UpdateScript                    Update script state
// 0056DEBC  LoadTexture                     Load texture file
// 0056E4DC  LoadTextureVar                  Load texture variant
// 0056E508  LoadTextureSystem               Texture system (46 strings)
// 0056F06C  UpdateHUD                       Update HUD display (94 strings)
// 00570084  UpdateVisibility                Update scene visibility (48 strings)
// 00570654  MoveWithCollision               Movement with collision
// 005706A0  TurnPlayer                      Turn player (yaw)
// 0057074C  PitchPlayer                     Pitch player (look up/down)
// 00570828  GetPlayerAngle                  Get player rotation
// 00570914  SetPlayerAngle                  Set player rotation
// 00570938  ResetPlayerPos                  Reset player position
// 00570990  UpdatePlayerPos                 Update player position
// 00570A34  SavePlayerPos                   Save player position
// 00570B78  LoadAnimation                   Load animation file
// 00570BA8  SetupNPCsAndItems               Setup NPCs/items (67 strings)
// 00571804  PlaceObject                     Place object in scene
// 0057185C  PlaceNPC                        Place NPC in scene
// 00571CEC  ConfigureNPC                    Configure NPC behavior
// 00571ECC  NPCInteraction                  NPC interaction handler (1132 lines)
// 0057342C  ProcessDialogue                 Dialogue system (262 strings, 27141 lines)
// 005909A4  LoadRegSettings                 Load registry settings
// 00590B2C  InitMaterials                   Initialize materials
// 00591C38  TimerTick                       Timer tick helper
// 00591CCC  UpdateTimerState                Update timer state
// 00591F88  InitScene                       Initialize scene
// 00591FA4  InitHUD                         Initialize HUD
// 005921AC  InitPlayer                      Initialize player
// 00592374  GameStepUpdate                  Game step update (35 strings, 3299 lines)
// 00595BCC  PreGameStep                     Pre-game step check
// 005967F4  PostGameStep                    Post-game step
// 00596818  StepHelper1                     Step helper
// 00596858  StepHelper2                     Step helper
// 00596880  IsStepReady                     Check if step ready
// 0059688C  RenderHUD                       Render HUD (map, health - 1097 lines)
// 00597868  UpdateUI                        Update UI elements
// 005978FC  ClearUI                         Clear UI state
// 00597918  SetupUI                         Setup UI components
// 00597ACC  HideUI                          Hide UI
// 00597AD4  ShowUI                          Show UI
// 00597B90  RefreshUI                       Refresh UI display
// 00597BA4  InitUI                          Initialize UI
// 00597EB0  UIAction1                       UI action 1
// 00597EC4  UIAction2                       UI action 2
// 00597EE8  UIAction3                       UI action 3
// 00597F00  UIQuery                         UI query
// 00597FF4  MenuTransition                  Menu state transition
// 00598038  HandleMainMenu                  Main menu handler (11 strings)
// 00598780  MenuAction                      Menu action handler
// 00598A68  MenuHelper                      Menu helper
// 00598C28  HandleInventory                 Inventory screen (10 strings)
// 005990E4  InventoryAction                 Inventory action
// 00599108  HandleSaveLoad                  Save/Load system (17 strings)
// 00599A3C  SaveLoadHelper                  Save/Load helper
// 00599BA4  SaveGame                        Save game to file
// 0059A59C  ProcessAI                       AI processing (946 lines)
// 0059B360  AIHelper1                       AI helper 1
// 0059B40C  AIHelper2                       AI helper 2
// 0059B418  AIHelper3                       AI helper 3
// 0059B520  AIUpdate                        AI state update
// 0059B7AC  CombatCalc                      Combat calculation
// 0059B878  OpenURL                         Open URL (ShellExecute)
// 0059B9B4  WebAction                       Web-related action
// 005A8EC4  GLRenderHelper                  GL render helper
// 005A8F50  CustomGLRender                  Custom OpenGL rendering (1164 lines)
// 005AA270  GLSmokeProgress                 GL smoke/particle progress
// 005AA308  GLFogUpdate                     GL fog parameter update
// 005AB24C  LoadSettings                    Load settings (Software\Sudokop)
// 005AB3C0  SaveSettings                    Save settings to registry

{ ---- _Unit107 ---- }
// 004B86D4  BuildFontChars                  Build font characters (66 strings a,b,c...)

{ ---- _Unit111 ---- }
// 004BB258  CutsceneSetCamera               Position camera from flythrough data
// 004BB378  CutsceneLoadScript              Load and parse _prulet.txt
// 004BB6AC  CutsceneInit                    Initialize cutscene system
// 004BB710  CutsceneProcess                 Process cutscene script (HUGE: 124k lines)

{ ---- _Unit114 ---- }
// 004B9934  SetupNPCActors                  Setup NPC actors (opilec, hrdina...)

{ ---- _Unit61 ---- }
// 00550A18  BuildGameTextTable              Build game text table (514 strings!)

{ ---- _Unit63 ---- }
// 004A1C60  FSOUND_SetOutput                FMOD import
// 004A1C68  FSOUND_Init                     FMOD import
// 004A1C70  FSOUND_Close                    FMOD import
// 004A1C78  FSOUND_SetSFXMasterVolume       FMOD import
// 004A1C80  FSOUND_GetSFXMasterVolume       FMOD import
// 004A1C88  FSOUND_Sample_Load              FMOD import
// 004A1C90  FSOUND_PlaySound                FMOD import
// 004A1C98  FSOUND_StopSound                FMOD import
// 004A1CA0  FSOUND_SetVolume                FMOD import
// 004A1CA8  FSOUND_SetPan                   FMOD import
// 004A1CB0  FSOUND_SetLoopMode              FMOD import
// 004A1CB8  FSOUND_Stream_Open              FMOD import
// 004A1CC0  FSOUND_Stream_Play              FMOD import
// 004A1CC8  FSOUND_Stream_Close             FMOD import
// 004A1CD0  FSOUND_Stream_GetLengthMs       FMOD import
// 004A1CD8  FSOUND_Stream_GetTime           FMOD import
// 004A1CE0  FSOUND_Stream_SetMode           FMOD import

{ ---- _Unit64 ---- }
// 00560438  SoundInit                       FSOUND_Init(44100,32,0)
// 00560464  SoundShutdown                   FSOUND_Close
// 0056046C  LoadSFXSample                   Load single SFX from PAK
// 00560514  LoadAllSFX                      Load all 61 SFX + music streams
// 00560FD8  PlayMusicStream                 Open+play stream from memory
// 00561048  ToggleSFXMode                   Cycle SFX mode 0->1->2->0
// 00561070  PlayMusic                       Play music by track index
// 005612D8  StopMusic                       Close music stream
// 005612FC  StopAmbient                     Close ambient stream
// 00561320  IsMusicNearEnd                  Check if stream near end
// 00561358  PlaySFX                         Play/loop sound effect
// 00561434  StopAllSounds                   Stop channels 2-0x20
// 0056144C  GetVolumePercent                Get volume as 0-100
// 00561480  SetVolumePercent                Set volume from 0-100
// 005614B0  PlayStartupMusic                Play tempHudba + ambient

{ ---- _Unit66 ---- }
// 00460294  GLUtilFunc                      GL utility function
// 00463C68  InitOpenGLExtensions            Initialize GL extensions (89 strings)
// 00464EE4  InitWGLExtensions               Initialize WGL extensions

{ ---- _Unit96 ---- }
// 00498378  GeometryProc3                   3D geometry (796 lines)

{ ---- _Unit97 ---- }
// 0049B2B0  GeometryProc2                   Geometry processing (747 lines)
// 0049C1DC  GeometryProc1                   Geometry processing (2275 lines)
