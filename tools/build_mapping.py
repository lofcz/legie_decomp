"""
Build comprehensive global variable and function name mappings from analysis data
and raw assembly context. Produces:
  - analysis/global_vars.inc   (Delphi var declarations)
  - analysis/function_names.inc (Delphi forward declarations)  
  - analysis/mapping_report.txt (human-readable report)
"""
import json
import re
import sys
from pathlib import Path
from collections import defaultdict

BASE = Path(__file__).resolve().parent.parent
ANALYSIS = BASE / 'analysis'
PROJECTS = BASE / 'Projects'


def load_json(name):
    with open(ANALYSIS / name, 'r', encoding='utf-8') as f:
        return json.load(f)


# ──────────────────────────────────────────────────────────
# GLOBAL VARIABLE MAPPING
# ──────────────────────────────────────────────────────────

# Known mappings from manual analysis of assembly context
KNOWN_GVARS = {
    # Application
    '005F5524': ('Form1Ref',        'TForm1',       'Global form reference (71 reads)'),
    '005F5EE8': ('AppPath',         'AnsiString',   'ExtractFilePath(ParamStr(0))'),
    '005AE0C8': ('IsDemo',          'Boolean',      'Controls demo.sud vs legie.sud loading'),
    '005AE0C4': ('IsFullVersion',   'Boolean',      'Shows "FULL VERSION" in title'),
    '005F5DE4': ('BroadcastMsg',    'Cardinal',     'RegisterWindowMessage(legie)'),
    '005F5DE0': ('OldWndProc',      'Longint',      'SetWindowLong GWL_WNDPROC'),

    # Game State
    '005F5577': ('GameState',       'Byte',         'Main game state 0-0xF (34 refs)'),
    '005F5576': ('PrevGameState',   'Byte',         'Previous game state'),
    '005F5596': ('GameSubState',    'Byte',         'Sub-state flag'),
    '005F5DF8': ('GameLoading',     'Boolean',      'Loading flag checked in TimerProgress'),
    '005F5574': ('PlayerInCombat',  'Boolean',      'Combat mode flag (9 refs)'),

    # Timing
    '005F5540': ('AccumulatedTime', 'Double',       'Time accumulator in game loop'),
    '005F5554': ('GameSpeed',       'Single',       'Game speed multiplier'),
    '005F55A0': ('FrameCounter',    'Integer',      'Frame counter'),

    # Display
    '005F5548': ('ViewerWidth',     'Integer',      'GLSceneViewer width'),
    '005F554C': ('ViewerHeight',    'Integer',      'GLSceneViewer height'),
    '005F5550': ('InvertMouse',     'Boolean',      'Mouse inversion'),
    '005F552D': ('InvertMouseReg',  'Boolean',      'Registry inverse value'),
    '005F5D34': ('MouseSensitivity','Byte',         'Mouse sensitivity divisor'),

    # Input
    '005F5EE0': ('MouseX',          'Integer',      'Current mouse X'),
    '005F5EE4': ('MouseY',          'Integer',      'Current mouse Y'),
    '005F5DE8': ('PrevMouseX',      'Integer',      'Previous mouse X'),
    '005F5DEC': ('PrevMouseY',      'Integer',      'Previous mouse Y'),
    '005F5DF0': ('TargetMouseX',    'Single',       'Target mouse X'),
    '005F5DF4': ('TargetMouseY',    'Single',       'Target mouse Y'),
    '005F5DFC': ('IdleCounter',     'Integer',      'Idle timeout counter'),
    '005FE494': ('MouseWheelDelta', 'Integer',      'Mouse wheel accumulator'),

    # Sound
    '005F5380': ('SFXSamples',      'array[0..63] of Pointer', 'SFX sample handles'),
    '005F5374': ('MusicStream',     'Pointer',      'Current music FSOUND_Stream'),
    '005F5378': ('AmbientStream',   'Pointer',      'Ambient FSOUND_Stream'),
    '005F537C': ('CurrentMusic',    'ShortInt',     'Current music track (-1=none)'),
    '005F537D': ('CurrentAmbient',  'ShortInt',     'Current ambient track (-1=none)'),
    '005F54EC': ('MusicChannel',    'Integer',      'Active music channel'),
    '005F54F0': ('SplashChannel',   'Integer',      'Splashing sound channel'),
    '005F54F4': ('SpringChannel',   'Integer',      'Spring sound channel'),
    '005F552C': ('MasterVolume',    'Byte',         'Master volume from registry'),
    '005F5575': ('SFXToggle',       'Byte',         'SFX mode toggle (0-2)'),

    # Music stream memory buffers
    '005F54F8': ('StreamDungeon',   'TMemoryStream','dungeon.ogg buffer'),
    '005F54FC': ('StreamBourka',    'TMemoryStream','bourka.ogg buffer'),
    '005F5500': ('StreamDrezina',   'TMemoryStream','drezina.ogg buffer (full only)'),
    '005F5504': ('StreamBitva',     'TMemoryStream','bitva.ogg buffer (full only)'),
    '005F5508': ('StreamMesto',     'TMemoryStream','mesto.ogg buffer'),
    '005F550C': ('StreamLes',       'TMemoryStream','les.ogg buffer (full only)'),
    '005F5510': ('StreamAmbient',   'TMemoryStream','ambient.ogg buffer (full only)'),
    '005F5514': ('StreamTempHudba', 'TMemoryStream','temphudba.ogg buffer'),
    '005F5518': ('StreamDudy',      'TMemoryStream','dudy.ogg buffer'),
    '005F551C': ('StreamSudokop',   'TMemoryStream','sudokop.ogg buffer'),

    # Player
    '005F5D08': ('PlayerHealth',    'Byte',         'Health/menu index (context-dependent)'),
    '005F5D18': ('DialogueText',    'AnsiString',   'Current dialogue text (10 refs)'),
    '005F5D38': ('DialogueActive',  'Boolean',      'Dialogue active flag (8 refs)'),
    '005F5DA4': ('PlayerPosData',   'Pointer',      'Player position data (11 refs)'),

    # Inventory / Equipment
    '005F5592': ('HasHelmet',       'Boolean',      'Helmet equipped'),
    '005F5593': ('HasArmor',        'Boolean',      'Armor equipped'),
    '005F5594': ('EquipFlags1',     'Byte',         'Equipment bitflag 1'),
    '005F5595': ('EquipFlags2',     'Byte',         'Equipment bitflag 2'),
    '005F5590': ('ShowBorders',     'Word',         'Border display flags'),

    # Save/Load
    '005F555C': ('SaveSlot',        'Integer',      'Current save slot'),
    '005F5530': ('SaveData1',       'Integer',      'Save-related data 1'),
    '005F5534': ('SaveData2',       'Integer',      'Save-related data 2'),
    '005F552E': ('MouseSensReg',    'ShortInt',     'Mouse sensitivity from registry'),

    # Scene / Rendering
    '005FE498': ('GameDataPtr',     'Pointer',      'Main game data structure (24 refs)'),
    '005FE678': ('FadeAlpha',       'Single',       'Screen fade alpha'),
    '005FE688': ('SceneFlag1',      'Boolean',      'Scene rendering flag'),
    '005FE6A1': ('SceneFlag2',      'Byte',         'Scene state byte'),
    '005FDD49': ('SceneFlag3',      'Boolean',      'Scene init flag'),

    # GLScene pointers (read from TForm1 fields via [edi+xxx])
    '005AF664': ('GLScenePtr',      'Pointer',      'GLScene related (51 refs)'),
    '005AD060': ('MaterialsPtr',    'Pointer',      'Materials pointer (21 refs)'),
    '005E0E88': ('SceneObjPtr1',    'Pointer',      'Scene object (29 refs)'),
    '005E0E8C': ('SceneObjPtr2',    'Pointer',      'Scene object (12 refs)'),
    '005E0870': ('ActorPtr',        'Pointer',      'Actor pointer (12 refs)'),
    '005E0CE2': ('NPCState',        'Byte',         'NPC state (14 refs)'),
    '005E0CE7': ('NPCState2',       'Byte',         'NPC state 2'),
    '005E1340': ('ClickAreaCount',  'Integer',      'Clickable area count (14 refs)'),
    '005E1384': ('ClickData1',      'Integer',      'Click data 1'),
    '005E1388': ('ClickData2',      'Integer',      'Click data 2 (8 refs, 6 writes)'),
    '005E1390': ('ClickData3',      'Pointer',      'Click data 3 (18 refs)'),
    '005E1394': ('ClickData4',      'Pointer',      'Click data 4 (18 refs)'),
    '005E14AC': ('AnimState',       'Integer',      'Animation state (8 refs)'),
    '005E15A8': ('PAKInstance',     'Pointer',      'Global TGLVfsPAK instance'),

    # OpenGL-related
    '00607DE4': ('GL_Var1',  'Integer', 'OpenGL state var'),
    '00607DE8': ('GL_Var2',  'Integer', 'OpenGL state var'),
    '00607DF0': ('GL_Var3',  'Integer', 'OpenGL state var'),
    '00607DF4': ('GL_Var4',  'Integer', 'OpenGL state var'),
    '00607E00': ('GL_Var5',  'Integer', 'OpenGL state var'),
    '00607E04': ('GL_Var6',  'Integer', 'OpenGL state var'),
    '00607E08': ('GL_Var7',  'Integer', 'OpenGL state var'),
    '00607E1C': ('GL_Var8',  'Integer', 'OpenGL state var'),

    # FMOD internals
    '005E159C': ('FMODInitCount', 'Integer',  'FMOD init reference counter'),
    '005E15A0': ('OldFPUCW',     'Word',     'Saved FPU control word'),
}


# ──────────────────────────────────────────────────────────
# FUNCTION NAME MAPPING
# ──────────────────────────────────────────────────────────

# Known mappings from string xrefs and call analysis
KNOWN_FUNCS = {
    # _Unit64 - Sound system
    '00560438': ('SoundInit',          '_Unit64', 'FSOUND_Init(44100,32,0)'),
    '00560464': ('SoundShutdown',      '_Unit64', 'FSOUND_Close'),
    '0056046C': ('LoadSFXSample',      '_Unit64', 'Load single SFX from PAK'),
    '00560514': ('LoadAllSFX',         '_Unit64', 'Load all 61 SFX + music streams'),
    '00560FD8': ('PlayMusicStream',    '_Unit64', 'Open+play stream from memory'),
    '00561048': ('ToggleSFXMode',      '_Unit64', 'Cycle SFX mode 0->1->2->0'),
    '00561070': ('PlayMusic',          '_Unit64', 'Play music by track index'),
    '005612D8': ('StopMusic',          '_Unit64', 'Close music stream'),
    '005612FC': ('StopAmbient',        '_Unit64', 'Close ambient stream'),
    '00561320': ('IsMusicNearEnd',     '_Unit64', 'Check if stream near end'),
    '00561358': ('PlaySFX',            '_Unit64', 'Play/loop sound effect'),
    '00561434': ('StopAllSounds',      '_Unit64', 'Stop channels 2-0x20'),
    '0056144C': ('GetVolumePercent',   '_Unit64', 'Get volume as 0-100'),
    '00561480': ('SetVolumePercent',   '_Unit64', 'Set volume from 0-100'),
    '005614B0': ('PlayStartupMusic',   '_Unit64', 'Play tempHudba + ambient'),

    # _Unit111 - Cutscene/flythrough system
    '004BB258': ('CutsceneSetCamera',  '_Unit111', 'Position camera from flythrough data'),
    '004BB378': ('CutsceneLoadScript', '_Unit111', 'Load and parse _prulet.txt'),
    '004BB6AC': ('CutsceneInit',       '_Unit111', 'Initialize cutscene system'),
    '004BB710': ('CutsceneProcess',    '_Unit111', 'Process cutscene script (HUGE: 124k lines)'),

    # _Unit61 - Game text/data tables
    '00550A18': ('BuildGameTextTable', '_Unit61', 'Build game text table (514 strings!)'),

    # _Unit114 - NPC/Actor system
    '004B9934': ('SetupNPCActors',     '_Unit114', 'Setup NPC actors (opilec, hrdina...)'),

    # Unit1 - Utility functions
    '00561B60': ('CompareCoords',      'Unit1', 'Compare two coordinate values'),
    '00561B78': ('ExtractDigits',      'Unit1', 'Extract digits from string'),
    '00561D80': ('Util_561D80',        'Unit1', 'Small utility'),
    '00561E34': ('Util_561E34',        'Unit1', 'Small utility'),
    '00561E50': ('ProcessClickables',  'Unit1', 'Process clickable objects (dvere, babice...)'),

    # Unit1 - Scene/level management
    '005626AC': ('SetupSceneObj',      'Unit1', 'Multi-param scene object setup'),
    '00562724': ('UpdateCursorPos',    'Unit1', 'Update cursor position'),
    '00562780': ('UpdateCursor2',      'Unit1', 'Secondary cursor update'),
    '005627E4': ('ClearCursor',        'Unit1', 'Clear cursor state'),
    '00562858': ('GetClickArea',       'Unit1', 'Get clickable area at position'),
    '005628C8': ('GetClickInfo',       'Unit1', 'Get click area info'),
    '00562904': ('RegisterClickArea',  'Unit1', 'Register new clickable area'),
    '00562938': ('UpdateClickArea',    'Unit1', 'Update clickable area'),
    '00562990': ('ClearClickAreas',    'Unit1', 'Clear all click areas'),
    '005629A8': ('AddClickArea',       'Unit1', 'Add click area with params'),
    '00562C90': ('ClearAllAreas',      'Unit1', 'Clear all clickable areas'),
    '00562CF8': ('SetGameMode',        'Unit1', 'Set game state/mode'),
    '00562D80': ('GetGameMode',        'Unit1', 'Get current game mode'),
    '00562D9C': ('LookupSceneObj',     'Unit1', 'Scene object lookup (33 strings)'),

    # Unit1 - Inventory and items
    '00563900': ('InventoryCheck',     'Unit1', 'Check inventory state'),
    '00563920': ('ProcessInventory',   'Unit1', 'Process inventory (10 strings)'),
    '0056410C': ('ProcessBitmap',      'Unit1', 'Bitmap processing'),
    '005641E4': ('ApplyBitmapEffect',  'Unit1', 'Apply effect to bitmap'),
    '005644A4': ('UpdateInventoryUI',  'Unit1', 'Update inventory UI'),
    '005644EC': ('GetInventoryItem',   'Unit1', 'Get inventory item'),
    '00564514': ('SetInventoryItem',   'Unit1', 'Set inventory item'),
    '00564544': ('ClearInventory',     'Unit1', 'Clear inventory display'),
    '0056455C': ('EnterGameplay',      'Unit1', 'Transition to gameplay state'),
    '005645A0': ('ExitGameplay',       'Unit1', 'Exit gameplay state'),
    '005645E0': ('UpdateGameplay',     'Unit1', 'Update gameplay state'),

    # Unit1 - Materials and textures
    '005647E0': ('LoadMaterial',       'Unit1', 'Load material/texture'),
    '0056493C': ('LoadNPCModel',       'Unit1', 'Load NPC model (netopyr, obluda...)'),
    '00564CE4': ('BuildSceneElem',     'Unit1', 'Build scene element'),
    '00564EF0': ('GetSceneElem',       'Unit1', 'Get scene element'),
    '00564F08': ('RemoveSceneElem',    'Unit1', 'Remove scene element'),
    '00564F74': ('UpdateSceneElem',    'Unit1', 'Update scene element'),
    '00564FE0': ('ClearSceneElems',    'Unit1', 'Clear scene elements'),
    '00565000': ('SceneElemAction',    'Unit1', 'Scene element action'),

    # Unit1 - Scene actions and dialogue
    '005652EC': ('ProcessSceneAction', 'Unit1', 'Process named object action'),
    '00565374': ('SceneActionHelper',  'Unit1', 'Scene action helper'),
    '00565444': ('StartDialogue',      'Unit1', 'Start dialogue sequence'),
    '00565464': ('EnterInventory',     'Unit1', 'Enter inventory screen'),
    '00565528': ('LoadStringRes',      'Unit1', 'Load string resource'),
    '00565558': ('ClearDialogue',      'Unit1', 'Clear dialogue state'),
    '005655D4': ('ShowDialogueText',   'Unit1', 'Show dialogue text'),
    '00565684': ('DialogueChoice',     'Unit1', 'Process dialogue choice'),
    '005656C8': ('EndDialogue',        'Unit1', 'End dialogue sequence'),
    '005657C4': ('DialogueNext',       'Unit1', 'Advance dialogue'),
    '00565810': ('ShowFadingMsg',      'Unit1', 'Show fading message overlay'),
    '005658A8': ('HideFadingMsg',      'Unit1', 'Hide fading message'),
    '00565B50': ('UpdateFadingMsg',    'Unit1', 'Update fading messages'),
    '00565C20': ('GetFadingMsgAlpha',  'Unit1', 'Get fading msg alpha'),
    '00565D08': ('IsFadingMsgActive',  'Unit1', 'Check if fading msg active'),
    '00565D68': ('ClearFadingMsgs',    'Unit1', 'Clear all fading messages'),
    '00565D88': ('AddFadingMsg',       'Unit1', 'Add fading message'),
    '00565DD0': ('ShowMessage',        'Unit1', 'Show text message'),
    '00565E64': ('ClearMessage',       'Unit1', 'Clear text message'),
    '00565EB4': ('TransitionState',    'Unit1', 'Transition game state'),

    # Unit1 - Level loading (LARGE)
    '005660D4': ('LoadLevel',          'Unit1', 'Load level/area (280 strings!)'),
    '005691F0': ('SetupParticles',     'Unit1', 'Setup particle effects (kour, jiskra...)'),
    '00566098': ('LoadLevelHelper',    'Unit1', 'Level load helper'),
    '00569D40': ('UpdateLevel',        'Unit1', 'Update level state'),

    # Unit1 - Game logic
    '0056A59C': ('GameLogicUpdate',    'Unit1', 'Main game logic (916 lines)'),
    '0056B494': ('CheckCollision',     'Unit1', 'Collision detection'),
    '0056B548': ('CanMove',            'Unit1', 'Movement check'),
    '0056B558': ('MoveForward',        'Unit1', 'Move player forward'),
    '0056B5EC': ('MoveBackward',       'Unit1', 'Move player backward'),
    '0056B6EC': ('MoveSideways',       'Unit1', 'Strafe movement'),
    '0056B760': ('MoveToPos',          'Unit1', 'Move to position'),
    '0056B790': ('StopMovement',       'Unit1', 'Stop player movement'),
    '0056B7A0': ('ShowSubtitle',       'Unit1', 'Show subtitle text'),

    # Unit1 - Script parser
    '0056B8E4': ('ParseScript',        'Unit1', 'Parse game script (r,z,t,x,d...)'),
    '0056D460': ('ScriptCommand',      'Unit1', 'Execute script command'),
    '0056D60C': ('UpdateScript',       'Unit1', 'Update script state'),

    # Unit1 - Texture system
    '0056DEBC': ('LoadTexture',        'Unit1', 'Load texture file'),
    '0056E4DC': ('LoadTextureVar',     'Unit1', 'Load texture variant'),
    '0056E508': ('LoadTextureSystem',  'Unit1', 'Texture system (46 strings)'),

    # Unit1 - HUD and rendering
    '0056F06C': ('UpdateHUD',          'Unit1', 'Update HUD display (94 strings)'),
    '00570084': ('UpdateVisibility',   'Unit1', 'Update scene visibility (48 strings)'),
    '00570654': ('MoveWithCollision',  'Unit1', 'Movement with collision'),
    '005706A0': ('TurnPlayer',         'Unit1', 'Turn player (yaw)'),
    '0057074C': ('PitchPlayer',        'Unit1', 'Pitch player (look up/down)'),
    '00570828': ('GetPlayerAngle',     'Unit1', 'Get player rotation'),
    '00570914': ('SetPlayerAngle',     'Unit1', 'Set player rotation'),
    '00570938': ('ResetPlayerPos',     'Unit1', 'Reset player position'),
    '00570990': ('UpdatePlayerPos',    'Unit1', 'Update player position'),
    '00570A34': ('SavePlayerPos',      'Unit1', 'Save player position'),
    '00570B78': ('LoadAnimation',      'Unit1', 'Load animation file'),

    # Unit1 - NPC/item setup (LARGE)
    '00570BA8': ('SetupNPCsAndItems',  'Unit1', 'Setup NPCs/items (67 strings)'),
    '00571804': ('PlaceObject',        'Unit1', 'Place object in scene'),
    '0057185C': ('PlaceNPC',           'Unit1', 'Place NPC in scene'),
    '00571CEC': ('ConfigureNPC',       'Unit1', 'Configure NPC behavior'),
    '00571ECC': ('NPCInteraction',     'Unit1', 'NPC interaction handler (1132 lines)'),

    # Unit1 - Dialogue system (VERY LARGE)
    '0057342C': ('ProcessDialogue',    'Unit1', 'Dialogue system (262 strings, 27141 lines)'),

    # Unit1 - Init and lifecycle
    '005909A4': ('LoadRegSettings',    'Unit1', 'Load registry settings'),
    '00590B2C': ('InitMaterials',      'Unit1', 'Initialize materials'),
    '00591C38': ('TimerTick',          'Unit1', 'Timer tick helper'),
    '00591CCC': ('UpdateTimerState',   'Unit1', 'Update timer state'),
    '00591F88': ('InitScene',          'Unit1', 'Initialize scene'),
    '00591FA4': ('InitHUD',            'Unit1', 'Initialize HUD'),
    '005921AC': ('InitPlayer',         'Unit1', 'Initialize player'),

    # Unit1 - Game step (LARGE)
    '00592374': ('GameStepUpdate',     'Unit1', 'Game step update (35 strings, 3299 lines)'),
    '00595BCC': ('PreGameStep',        'Unit1', 'Pre-game step check'),
    '005967F4': ('PostGameStep',       'Unit1', 'Post-game step'),
    '00596818': ('StepHelper1',        'Unit1', 'Step helper'),
    '00596858': ('StepHelper2',        'Unit1', 'Step helper'),
    '00596880': ('IsStepReady',        'Unit1', 'Check if step ready'),

    # Unit1 - HUD rendering (LARGE)
    '0059688C': ('RenderHUD',          'Unit1', 'Render HUD (map, health - 1097 lines)'),

    # Unit1 - Menu and UI
    '00597868': ('UpdateUI',           'Unit1', 'Update UI elements'),
    '005978FC': ('ClearUI',            'Unit1', 'Clear UI state'),
    '00597918': ('SetupUI',            'Unit1', 'Setup UI components'),
    '00597ACC': ('HideUI',             'Unit1', 'Hide UI'),
    '00597AD4': ('ShowUI',             'Unit1', 'Show UI'),
    '00597B90': ('RefreshUI',          'Unit1', 'Refresh UI display'),
    '00597BA4': ('InitUI',             'Unit1', 'Initialize UI'),
    '00597EB0': ('UIAction1',          'Unit1', 'UI action 1'),
    '00597EC4': ('UIAction2',          'Unit1', 'UI action 2'),
    '00597EE8': ('UIAction3',          'Unit1', 'UI action 3'),
    '00597F00': ('UIQuery',            'Unit1', 'UI query'),
    '00597FF4': ('MenuTransition',     'Unit1', 'Menu state transition'),
    '00598038': ('HandleMainMenu',     'Unit1', 'Main menu handler (11 strings)'),
    '00598780': ('MenuAction',         'Unit1', 'Menu action handler'),
    '00598A68': ('MenuHelper',         'Unit1', 'Menu helper'),
    '00598C28': ('HandleInventory',    'Unit1', 'Inventory screen (10 strings)'),
    '005990E4': ('InventoryAction',    'Unit1', 'Inventory action'),
    '00599108': ('HandleSaveLoad',     'Unit1', 'Save/Load system (17 strings)'),
    '00599A3C': ('SaveLoadHelper',     'Unit1', 'Save/Load helper'),
    '00599BA4': ('SaveGame',           'Unit1', 'Save game to file'),

    # Unit1 - AI and behavior
    '0059A59C': ('ProcessAI',          'Unit1', 'AI processing (946 lines)'),
    '0059B360': ('AIHelper1',          'Unit1', 'AI helper 1'),
    '0059B40C': ('AIHelper2',          'Unit1', 'AI helper 2'),
    '0059B418': ('AIHelper3',          'Unit1', 'AI helper 3'),
    '0059B520': ('AIUpdate',           'Unit1', 'AI state update'),
    '0059B7AC': ('CombatCalc',         'Unit1', 'Combat calculation'),
    '0059B878': ('OpenURL',            'Unit1', 'Open URL (ShellExecute)'),
    '0059B9B4': ('WebAction',          'Unit1', 'Web-related action'),

    # Unit1 - Custom GL rendering
    '005A8EC4': ('GLRenderHelper',     'Unit1', 'GL render helper'),
    '005A8F50': ('CustomGLRender',     'Unit1', 'Custom OpenGL rendering (1164 lines)'),
    '005AA270': ('GLSmokeProgress',    'Unit1', 'GL smoke/particle progress'),
    '005AA308': ('GLFogUpdate',        'Unit1', 'GL fog parameter update'),

    # Unit1 - Settings
    '005AB24C': ('LoadSettings',       'Unit1', 'Load settings (Software\\Sudokop)'),
    '005AB3C0': ('SaveSettings',       'Unit1', 'Save settings to registry'),

    # _Unit63 - FMOD imports (replaced by real fmod.pas)
    '004A1C60': ('FSOUND_SetOutput',   '_Unit63', 'FMOD import'),
    '004A1C68': ('FSOUND_Init',        '_Unit63', 'FMOD import'),
    '004A1C70': ('FSOUND_Close',       '_Unit63', 'FMOD import'),
    '004A1C78': ('FSOUND_SetSFXMasterVolume', '_Unit63', 'FMOD import'),
    '004A1C80': ('FSOUND_GetSFXMasterVolume', '_Unit63', 'FMOD import'),
    '004A1C88': ('FSOUND_Sample_Load', '_Unit63', 'FMOD import'),
    '004A1C90': ('FSOUND_PlaySound',   '_Unit63', 'FMOD import'),
    '004A1C98': ('FSOUND_StopSound',   '_Unit63', 'FMOD import'),
    '004A1CA0': ('FSOUND_SetVolume',   '_Unit63', 'FMOD import'),
    '004A1CA8': ('FSOUND_SetPan',      '_Unit63', 'FMOD import'),
    '004A1CB0': ('FSOUND_SetLoopMode', '_Unit63', 'FMOD import'),
    '004A1CB8': ('FSOUND_Stream_Open', '_Unit63', 'FMOD import'),
    '004A1CC0': ('FSOUND_Stream_Play', '_Unit63', 'FMOD import'),
    '004A1CC8': ('FSOUND_Stream_Close','_Unit63', 'FMOD import'),
    '004A1CD0': ('FSOUND_Stream_GetLengthMs','_Unit63', 'FMOD import'),
    '004A1CD8': ('FSOUND_Stream_GetTime','_Unit63', 'FMOD import'),
    '004A1CE0': ('FSOUND_Stream_SetMode','_Unit63', 'FMOD import'),

    # _Unit66 - OpenGL imports
    '00463C68': ('InitOpenGLExtensions','_Unit66', 'Initialize GL extensions (89 strings)'),
    '00464EE4': ('InitWGLExtensions',  '_Unit66', 'Initialize WGL extensions'),
    '00460294': ('GLUtilFunc',         '_Unit66', 'GL utility function'),

    # GLScene-related
    '004804A0': ('FindSceneObject',    'GLScene', 'Find scene object by name'),
    '004A3268': ('PAKOpenFile',        'GLVfsPAK','Open file from PAK archive'),
    '004A3668': ('PAKGetStream',       'GLVfsPAK','Get file stream from PAK'),

    # _Unit97 - 3D geometry/rendering
    '0049C1DC': ('GeometryProc1',      '_Unit97', 'Geometry processing (2275 lines)'),
    '0049B2B0': ('GeometryProc2',      '_Unit97', 'Geometry processing (747 lines)'),
    '00498378': ('GeometryProc3',      '_Unit96', '3D geometry (796 lines)'),

    # _Unit107
    '004B86D4': ('BuildFontChars',     '_Unit107', 'Build font characters (66 strings a,b,c...)'),
}


def generate_gvar_declarations():
    """Generate Delphi var declarations for all known globals."""
    lines = []
    lines.append('{ Global Variables - Reconstructed from gvar_XXXXXXXX addresses }')
    lines.append('var')

    categories = defaultdict(list)
    for addr, (name, typ, comment) in sorted(KNOWN_GVARS.items()):
        if '005F5' in addr or '005AE' in addr:
            cat = 'Game'
        elif '005E' in addr:
            cat = 'Scene'
        elif '00607' in addr:
            cat = 'OpenGL'
        else:
            cat = 'Other'
        categories[cat].append((addr, name, typ, comment))

    for cat in ['Game', 'Scene', 'OpenGL', 'Other']:
        if cat not in categories:
            continue
        lines.append(f'  {{ {cat} variables }}')
        for addr, name, typ, comment in categories[cat]:
            lines.append(f'  {name}: {typ};  {{ gvar_{addr} - {comment} }}')
        lines.append('')

    return '\n'.join(lines)


def generate_func_declarations():
    """Generate Delphi forward declarations for all known functions."""
    lines = []
    lines.append('{ Function Forward Declarations - Reconstructed from sub_XXXXXXXX }')
    lines.append('')

    by_unit = defaultdict(list)
    for addr, (name, unit, comment) in sorted(KNOWN_FUNCS.items()):
        by_unit[unit].append((addr, name, comment))

    for unit in sorted(by_unit.keys()):
        lines.append(f'{{ ---- {unit} ---- }}')
        for addr, name, comment in by_unit[unit]:
            lines.append(f'// {addr}  {name:30s}  {comment}')
        lines.append('')

    return '\n'.join(lines)


def generate_report():
    """Generate comprehensive mapping report."""
    gvar_map = load_json('gvar_map.json')
    func_catalog = load_json('function_catalog.json')

    lines = []
    lines.append('=' * 70)
    lines.append('LEGIE VARIABLE & FUNCTION MAPPING REPORT')
    lines.append('=' * 70)
    lines.append('')

    # Stats
    game_gvars = {k: v for k, v in gvar_map.items()
                  if any(p in k for p in ['005F', '005AE', '005E1', '005FE', '005FD'])}
    lines.append(f'Total global variables:  {len(gvar_map)}')
    lines.append(f'Game-relevant globals:   {len(game_gvars)}')
    lines.append(f'Named globals:           {len(KNOWN_GVARS)}')
    lines.append(f'Named functions:         {len(KNOWN_FUNCS)}')
    lines.append('')

    # Unit1 functions
    unit1_funcs = [f for f in func_catalog if f['unit'] == 'Unit1']
    named = sum(1 for f in unit1_funcs if f['address'] in KNOWN_FUNCS)
    lines.append(f'Unit1 functions:         {len(unit1_funcs)}')
    lines.append(f'Unit1 named:             {named}')
    lines.append(f'Unit1 unnamed:           {len(unit1_funcs) - named}')
    lines.append('')

    # Unnamed Unit1 functions
    lines.append('UNNAMED UNIT1 FUNCTIONS:')
    lines.append('-' * 70)
    for f in sorted(unit1_funcs, key=lambda x: x['asm_lines'], reverse=True):
        addr = f['address']
        if addr not in KNOWN_FUNCS:
            cls = f['class']
            name = f['name']
            fqn = f"{cls + '.' if cls else ''}{name}"
            strs = ', '.join(f['strings'][:3]) if f['strings'] else '(no strings)'
            lines.append(f'  {addr}  {fqn:40s}  {f["asm_lines"]:5d} asm  strings: {strs}')

    lines.append('')

    # Unmapped game globals (high ref count)
    lines.append('UNMAPPED GAME GLOBALS (>3 refs):')
    lines.append('-' * 70)
    for gvar_name, info in sorted(game_gvars.items(),
                                   key=lambda x: len(x[1]['readers']) + len(x[1]['writers']),
                                   reverse=True):
        addr = gvar_name.replace('gvar_', '')
        if addr not in KNOWN_GVARS:
            total = len(info['readers']) + len(info['writers'])
            if total > 3:
                readers = [r['func'] for r in info['readers'][:3]]
                lines.append(f'  {gvar_name}  {total:3d} refs  readers: {", ".join(readers)}')

    return '\n'.join(lines)


if __name__ == '__main__':
    print("Building mappings...")

    gvar_decl = generate_gvar_declarations()
    func_decl = generate_func_declarations()
    report = generate_report()

    (ANALYSIS / 'global_vars.inc').write_text(gvar_decl, encoding='utf-8')
    (ANALYSIS / 'function_names.inc').write_text(func_decl, encoding='utf-8')
    (ANALYSIS / 'mapping_report.txt').write_text(report, encoding='utf-8')

    print(f"  global_vars.inc     - {len(KNOWN_GVARS)} variables")
    print(f"  function_names.inc  - {len(KNOWN_FUNCS)} functions")
    print(f"  mapping_report.txt  - full report")
    print("Done.")
