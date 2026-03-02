//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Forms;

interface

uses
  SysUtils, Classes, Forms, Controls, Graphics, Menus, Unit1;

type
  TScrollBarStyle = (ssRegular, ssFlat, ssHotTrack);
  TControlScrollBar = class(TPersistent)
  public
    FControl:TScrollingWinControl;//f4
    Increment:TScrollBarInc;//f8
    FPageIncrement:TScrollBarInc;//fA
    Position:Integer;//fC
    Range:Integer;//f10
    FCalcRange:Integer;//f14
    FKind:TScrollBarKind;//f18
    Margin:Word;//f1A
    Visible:Boolean;//f1C
    Tracking:Boolean;//f1D
    FScaled:Boolean;//f1E
    Smooth:Boolean;//f1F
    FDelay:Integer;//f20
    ButtonSize:Integer;//f24
    Color:TColor;//f28
    ParentColor:Boolean;//f2C
    Size:Integer;//f30
    Style:TScrollBarStyle;//f34
    ThumbSize:Integer;//f38
    FPageDiv:Integer;//f3C
    FLineDiv:Integer;//f40
    FUpdateNeeded:Boolean;//f44
    procedure Assign(Source:TPersistent); virtual;//v8//00452770
    constructor Create(AControl:TScrollingWinControl; AKind:TScrollBarKind);//004526E0
    procedure IsStoredIncrement(Value:TScrollBarInc);//00452768
    procedure ChangeBiDiPosition;//004527C0
    procedure CalcAutoRange;//004528CC
    function IsScrollBarVisible:Boolean;//00452978
    function ControlSize(ControlSB:Boolean; AssumeSB:Boolean):Integer;//00452A60
    function NeedsScrollBarVisible:Boolean;//00452AE0
    procedure ScrollMessage(var Msg:TWMScroll);//00452B58
    procedure SetButtonSize(Value:Integer);//00452E50
    procedure SetColor(Value:TColor);//00452E94
    procedure SetParentColor(Value:Boolean);//00452EB0
    procedure SetPosition(Value:Integer);//00452EC8
    procedure SetSize(Value:Integer);//00452F8C
    procedure SetStyle(Value:TScrollBarStyle);//00452FD0
    procedure SetThumbSize(Value:Integer);//00452FE8
    procedure DoSetRange(Value:Integer);//00453000
    procedure SetRange(Value:Integer);//00453018
    function IsRangeStored(Value:Integer):Boolean;//0045302C
    procedure SetVisible(Value:Boolean);//00453038
    procedure Update(ControlSB:Boolean; AssumeSB:Boolean);//0045314C
  end;
  TWindowState = (wsNormal, wsMinimized, wsMaximized);
  TScrollingWinControl = class(TWinControl)
  public
    HorzScrollBar:TControlScrollBar;//f208
    VertScrollBar:TControlScrollBar;//f20C
    FAutoScroll:Boolean;//f210
    FAutoRangeCount:Integer;//f214
    FUpdatingScrollBars:Boolean;//f218
    destructor Destroy; virtual;//004532DC
    constructor Create(AOwner:TComponent); virtual;//v2C//00453264
    //procedure v8C(?:?); virtual;//v8C//00453994
    procedure AlignControls(AControl:TControl; var ARect:TRect); virtual;//v90//00453368
    procedure CreateParams(var Params:TCreateParams); virtual;//v98//00453318
    procedure CreateWnd; virtual;//vA0//00453328
    function AutoScrollEnabled:Boolean; virtual;//vC8//00453388
    procedure AutoScrollInView(AControl:TControl); virtual;//vCC//00453638
    procedure vD0; virtual;//vD0//0045386C
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//00453870
    procedure WMHScroll(Message:TWMCommand); message WM_HSCROLL;//0045394C
    procedure WMVScroll(Message:TWMHScroll); message WM_VSCROLL;//00453970
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//00453A04
    procedure DoFlipChildren; dynamic;//004533A8
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//00453848
    procedure CalcAutoRange;//004534C0
    procedure SetAutoScroll(Value:Boolean);//004534E4
    procedure SetHorzScrollBar(Value:TControlScrollBar);//00453520
    procedure SetVertScrollBar(Value:TControlScrollBar);//00453530
    procedure UpdateScrollBars;//00453540
    procedure ScrollInView(AControl:TControl);//00453650
    procedure ScaleScrollBars(M:Integer; D:Integer);//004537A4
  end;
  TFormBorderStyle = (bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin);
  TFormStyle = (fsNormal, fsMDIChild, fsMDIForm, fsStayOnTop);
  TBorderIcon = (biSystemMenu, biMinimize, biMaximize, biHelp);
  TBorderIcons = set of TBorderIcon;
  TPosition = (poDesigned, poDefault, poDefaultPosOnly, poDefaultSizeOnly, poScreenCenter, poDesktopCenter, poMainFormCenter, poOwnerFormCenter);
  TDefaultMonitor = (dmDesktop, dmPrimary, dmMainForm, dmActiveForm);
  TPrintScale = (poNone, poProportional, poPrintToFit);
  TCloseAction = (caNone, caHide, caFree, caMinimize);
  TCloseEvent = procedure(Sender:TObject; var Action:TCloseAction) of object;;
  TCloseQueryEvent = procedure(Sender:TObject; var CanClose:Boolean) of object;;
  TShortCutEvent = procedure(var Msg:TWMKey; var Handled:Boolean) of object;;
  THelpEvent = function(Command:Word; Data:Integer; var CallHelp:Boolean):Boolean of object;;
  TCustomForm = class(TScrollingWinControl)
  public
    FActiveControl:TWinControl;//f220
    FFocusedControl:TWinControl;//f224
    FBorderIcons:TBorderIcons;//f228
    FBorderStyle:TFormBorderStyle;//f229
    FSizeChanging:Boolean;//f22A
    FWindowState:TWindowState;//f22B
    FShowAction:TShowAction;//f22C
    FKeyPreview:Boolean;//f22D
    FActive:Boolean;//f22E
    FFormStyle:TFormStyle;//f22F
    FPosition:TPosition;//f230
    FDefaultMonitor:TDefaultMonitor;//f231
    FTileMode:TTileMode;//f232
    FDropTarget:Boolean;//f233
    FOldCreateOrder:Boolean;//f234
    FPrintScale:TPrintScale;//f235
    FCanvas:TControlCanvas;//f238
    FHelpFile:String;//f23C
    FIcon:TIcon;//f240
    FInCMParentBiDiModeChanged:Boolean;//f244
    FMenu:TMainMenu;//f248
    FModalResult:TModalResult;//f24C
    FDesigner:IDesignerHook;//f250
    FClientHandle:HWND;//f254
    FWindowMenu:TMenuItem;//f258
    FPixelsPerInch:Integer;//f25C
    FObjectMenuItem:TMenuItem;//f260
    FOleForm:IOleForm;//f264
    FClientWidth:Integer;//f268
    FClientHeight:Integer;//f26C
    FTextHeight:Integer;//f270
    FDefClientProc:TFarProc;//f274
    FClientInstance:TFarProc;//f278
    FActiveOleControl:TWinControl;//f27C
    FSavedBorderStyle:TFormBorderStyle;//f280
    FOnActivate:TNotifyEvent;//f288
    FOnClose:TCloseEvent;//f290
    FOnCloseQuery:TCloseQueryEvent;//f298
    FOnDeactivate:TNotifyEvent;//f2A0
    FOnHelp:THelpEvent;//f2A8
    FOnHide:TNotifyEvent;//f2B0
    FOnPaint:TNotifyEvent;//f2B8
    FOnShortCut:TShortCutEvent;//f2C0
    FOnShow:TNotifyEvent;//f2C8
    FOnCreate:TNotifyEvent;//f2D0
    FOnDestroy:TNotifyEvent;//f2D8
    FAlphaBlend:Boolean;//f2E0
    FAlphaBlendValue:Byte;//f2E1
    FScreenSnap:Boolean;//f2E2
    FSnapBuffer:Integer;//f2E4
    FTransparentColor:Boolean;//f2E8
    FTransparentColorValue:TColor;//f2EC
    FActionLists:TList;//f2F0
    FFormState:TFormState;//f2F4
    procedure AfterConstruction; virtual;//00453C20
    procedure BeforeDestruction; virtual;//00453DD4
    procedure DefaultHandler(var Message:void ); virtual;//00456240
    destructor Destroy; virtual;//00453E3C
    procedure DefineProperties(Filer:TFiler); virtual;//v4//004543AC
    procedure Loaded; virtual;//vC//00453FFC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00454038
    procedure ReadState(Reader:TReader); virtual;//v14//00454144
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString); virtual;//v20//004549BC
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v28//0045855C
    constructor Create(AOwner:TComponent); virtual;//v2C//00453A94
    function GetClientRect:TRect; virtual;//v44//0045469C
    function GetFloating:Boolean; virtual;//v54//00454790
    procedure SetParent(AParent:TWinControl); virtual;//v68//00454984
    procedure SetParentBiDiMode(Value:Boolean); virtual;//v6C//00454850
    procedure WndProc(var Message:TMessage); virtual;//v74//004549FC
    procedure AlignControls(AControl:TControl; var Rect:TRect); virtual;//v90//004550A0
    procedure CreateParams(var Params:TCreateParams); virtual;//v98//00455D64
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v9C//004560C4
    procedure CreateWnd; virtual;//vA0//00455F80
    procedure DestroyWindowHandle; virtual;//vAC//004561FC
    procedure PaintWindow(DC:HDC); virtual;//vB8//004568F0
    procedure SetFocus; virtual;//vC4//00457E04
    procedure Resizing(State:TWindowState); virtual;//vD0//00456EE4
    procedure DoCreate; virtual;//vD4//00453F20
    procedure DoDestroy; virtual;//vD8//00453F9C
    procedure UpdateActions; virtual;//vDC//004581E4
    constructor CreateNew(AOwner:TComponent; Dummy:Integer); virtual;//vE0//00453C58
    function CloseQuery:Boolean; virtual;//vE4//00457CE8
    function SetFocusedControl(Control:TWinControl):Boolean; virtual;//vE8//004563C8
    //function vEC:?; virtual;//vEC//00457E9C
    //function vF0:?; virtual;//vF0//00454980
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//00456D38
    procedure WMActivate(var Message:TWMActivate); message WM_ACTIVATE;//00456EC4
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//00456A4C
    procedure WMClose; message WM_CLOSE;//00456F1C
    procedure WMQueryEndSession(var Message:TWMQueryEndSession); message WM_QUERYENDSESSION;//00456F24
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//00456B2C
    procedure WMShowWindow(var Message:TWMShowWindow); message WM_SHOWWINDOW;//00457034
    procedure WMSettingChange(var Message:TMessage); message WM_SETTINGCHANGE;//00458268
    procedure WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo); message WM_GETMINMAXINFO;//00457378
    procedure WMIconEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ICONERASEBKGND;//00456ACC
    procedure WMNextDlgCtl(var Message:TWMNextDlgCtl); message WM_NEXTDLGCTL;//00457124
    procedure WMQueryDragIcon(var Message:TWMQueryDragIcon); message WM_QUERYDRAGICON;//00456B64
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;//00457418
    procedure WMHelp(var Message:TWMHelp); message WM_HELP;//00457218
    procedure WMNCCreate(var Message:TWMNCCreate); message WM_NCCREATE;//00456C74
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//00456CA8
    procedure WMCommand(Message:TWMCharToItem); message WM_COMMAND;//00456D98
    procedure WMSysCommand(var Message:TWMSysCommand); message WM_SYSCOMMAND;//00456FA8
    procedure WMInitMenuPopup(var Message:TWMInitMenuPopup); message WM_INITMENUPOPUP;//00456DCC
    procedure WMMenuSelect(var Message:TWMMenuSelect); message WM_MENUSELECT;//00456E1C
    procedure WMMenuChar(var Message:TWMMenuChar); message WM_MENUCHAR;//00456DE4
    procedure WMEnterMenuLoop(var Message:TMessage); message WM_ENTERMENULOOP;//00457150
    procedure WMMDIActivate(var Message:TWMMDIActivate); message WM_MDIACTIVATE;//004570CC
    procedure CMActivate(var Message:TCMActivate); message CM_ACTIVATE;//004574D0
    procedure CMDeactivate(var Message:TCMDeactivate); message CM_DEACTIVATE;//004574F4
    procedure CMDialogKey(var Message:TCMDialogKey); message CM_DIALOGKEY;//00457518
    procedure CMParentFontChanged(var Message:TMessage); message CM_PARENTFONTCHANGED;//00457BAC
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//00455910
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//00455994
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//0045594C
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//00457B54
    procedure CMMenuChanged(var Message:TMessage); message CM_MENUCHANGED;//004559B4
    procedure CMAppSysCommand(var Message:TMessage); message CM_APPSYSCOMMAND;//00456F50
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//004575B4
    procedure CMIconChanged(var Message:TMessage); message CM_ICONCHANGED;//00457B2C
    procedure CMRelease; message CM_RELEASE;//00457B4C
    procedure CMUIActivate; message CM_UIACTIVATE;//00457BA4
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//0045510C
    procedure CMParentBiDiModeChanged(var Message:TMessage); message CM_PARENTBIDIMODECHANGED;//004551A4
    procedure CMActionUpdate(var Message:TMessage); message CM_ACTIONUPDATE;//00458438
    procedure CMActionExecute(var Message:TMessage); message CM_ACTIONEXECUTE;//00458338
    procedure CMIsShortCut(var Message:TWMKey); message CM_DOCKNOTIFICATION;//00457C18
    procedure IsShortCut(var Message:TWMKey); dynamic;//004584E0
    procedure Paint; dynamic;//004568B4
    procedure HandleCreateException; dynamic;//004585D0
    procedure DoShow; dynamic;//0045467C
    procedure DoHide; dynamic;//0045465C
    procedure DoClose(var Action:TCloseAction); dynamic;//0045463C
    procedure Deactivate; dynamic;//00456884
    procedure sub_00456658; dynamic;//00456658
    procedure Activate; dynamic;//00456854
    procedure MouseWheelHandler(var Message:TMessage); dynamic;//00458598
    procedure Dock(NewDockSite:TWinControl; ARect:TRect); dynamic;//00455290
    procedure sub_0043CF6C; dynamic;//0045491C
    procedure RequestAlign; dynamic;//0045824C
    procedure PaletteChanged(Foreground:Boolean); dynamic;//004569AC
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect); dynamic;//004552D4
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//004544F4
    procedure BeginAutoDrag; dynamic;//004544F0
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//004547BC
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00454724
    procedure ReadIgnoreFontProperty(Reader:TReader);//0045445C
    procedure ReadTextHeight(Reader:TReader);//0045447C
    procedure WriteTextHeight(Writer:TWriter);//00454494
    procedure WritePixelsPerInch(Writer:TWriter);//004544B0
    function GetTextHeight:Integer;//004544CC
    procedure IconChanged(Sender:TObject);//00454574
    function IsClientSizeStored(Value:Integer):Boolean;//004545D0
    function IsFormSizeStored(Value:Integer):Boolean;//004545E0
    function IsAutoScrollStored(Value:Boolean):Boolean;//00454608
    procedure SetClientWidth(Value:Integer);//00454878
    procedure SetClientHeight(Value:Integer);//004548A8
    procedure SetVisible(Value:Boolean);//004548D8
    procedure ClientWndProc(var Message:TMessage);//00454EC0
    procedure SetBorderIcons(Value:TBorderIcons);//0045522C
    procedure SetBorderStyle(Value:TFormBorderStyle);//00455258
    function GetActiveMDIChild:TForm;//00455328
    function GetMDIChildCount:Integer;//0045535C
    function GetMDIChildren(I:Integer):TForm;//004553A8
    function GetMonitor:TMonitor;//00455428
    function GetCanvas:TCanvas;//00455510
    procedure SetIcon(Value:TIcon);//00455518
    function IsForm(Value:TWinControl):Boolean;//00455524
    function IsIconStored(Value:TIcon):Boolean;//0045552C
    procedure SetFormStyle(Value:TFormStyle);//00455554
    procedure RefreshMDIMenu;//004555D4
    procedure SetObjectMenuItem(Value:TMenuItem);//00455650
    procedure SetWindowMenu(Value:TMenuItem);//00455674
    procedure SetMenu(Value:TMainMenu);//0045569C
    function GetPixelsPerInch:Integer;//00455870
    procedure SetPixelsPerInch(Value:Integer);//00455884
    procedure SetPosition(Value:TPosition);//004558B8
    function GetScaled:Boolean;//004558D4
    procedure SetScaled(Value:Boolean);//004558E0
    function NormalColor:TColor;//00455934
    procedure SetWindowState(Value:TWindowState);//004559D0
    procedure SetWindowToMonitor;//00455A10
    procedure SetActiveControl(Control:TWinControl);//004562A4
    procedure DefocusControl(Control:TWinControl; Removing:Boolean);//0045635C
    procedure FocusControl(Control:TWinControl);//004563A4
    procedure SetWindowFocus;//0045665C
    procedure SetActive(Value:Boolean);//004566AC
    procedure SendCancelMode(Sender:TControl);//00456710
    procedure MergeMenu(MergeState:Boolean);//00456760
    function GetIconHandle:HICON;//004568D4
    procedure Close;//00457C44
    procedure CloseModal;//00457D4C
    procedure Hide;//00457DE4
    procedure Show;//00457DEC
    procedure Release;//00457E80
    procedure SetLayeredAttribs;//004585E0
    procedure SetAlphaBlend(const Value:Boolean);//004586B8
    procedure SetAlphaBlendValue(const Value:Byte);//004586CC
    procedure SetTransparentColorValue(const Value:TColor);//004586E0
    procedure SetTransparentColor(const Value:Boolean);//004586F4
    procedure InitAlphaBlending(var Params:TCreateParams);//00458708
  end;
  TForm = class(TCustomForm)
  end;
  TCustomDockForm = class(TCustomForm)
  public
    procedure Loaded; virtual;//vC//004588A0
    constructor Create(AOwner:TComponent); virtual;//v2C//00458734
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//00458918
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//00458940
    procedure CMVisibleChanged(var Message:TMessage); message CM_VISIBLECHANGED;//00458B1C
    procedure CMControlListChange(var Message:TMessage); message CM_CONTROLLISTCHANGE;//004589D8
    procedure CMUnDockClient(var Message:TCMUnDockClient); message CM_UNDOCKCLIENT;//00458B04
    procedure CMDockNotification(var Message:TCMDockNotification); dynamic;//00458A30
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean); dynamic;//004588EC
    procedure DoRemoveDockClient(Client:TControl); dynamic;//00458880
    procedure DoAddDockClient(Client:TControl; const ARect:TRect); dynamic;//0045879C
  end;
  TMonitor = class(TObject)
  public
    FHandle:HMONITOR;//f4
    FMonitorNum:Integer;//f8
    function GetLeft:Integer;//00458B58
    function GetHeight:Integer;//00458B70
    function GetTop:Integer;//00458B8C
    function GetWidth:Integer;//00458BA4
    function GetBoundsRect:TRect;//00458BC0
    function GetWorkareaRect:TRect;//00458BF0
  end;
  TScreen = class(TComponent)
  public
    FFonts:TStrings;//f30
    FImes:TStrings;//f34
    FDefaultIme:String;//f38
    FDefaultKbLayout:HKL;//f3C
    FPixelsPerInch:Integer;//f40
    FCursor:TCursor;//f44
    FCursorCount:Integer;//f48
    FForms:TList;//f4C
    FCustomForms:TList;//f50
    FDataModules:TList;//f54
    FMonitors:TList;//f58
    FCursorList:PCursorRec;//f5C
    FDefaultCursor:HCURSOR;//f60
    FActiveControl:TWinControl;//f64
    FActiveCustomForm:TCustomForm;//f68
    FActiveForm:TForm;//f6C
    FLastActiveControl:TWinControl;//f70
    FLastActiveCustomForm:TCustomForm;//f74
    FFocusedForm:TCustomForm;//f78
    FSaveFocusedList:TList;//f7C
    FHintFont:TFont;//f80
    FIconFont:TFont;//f84
    FMenuFont:TFont;//f88
    FAlignLevel:Word;//f8C
    FControlState:TControlState;//f8E
    FOnActiveControlChange:TNotifyEvent;//f90
    FOnActiveFormChange:TNotifyEvent;//f98
    destructor Destroy; virtual;//00458D78
    constructor Create(AOwner:TComponent); virtual;//v2C//00458C20
    function GetHeight:Integer;//00458E40
    function GetWidth:Integer;//00458E4C
    function GetDesktopTop:Integer;//00458E58
    function GetDesktopLeft:Integer;//00458E64
    function GetDesktopHeight:Integer;//00458E70
    function GetDesktopWidth:Integer;//00458E7C
    function GetMonitor(Index:Integer):TMonitor;//00458E88
    function GetMonitorCount:Integer;//00458E9C
    function GetForm(Index:Integer):TForm;//00458EB8
    function GetFormCount:Integer;//00458ECC
    function GetCustomForms(Index:Integer):TCustomForm;//00458ED4
    function GetCustomFormCount:Integer;//00458EE8
    procedure UpdateLastActive;//00458EF0
    procedure AddForm(AForm:TCustomForm);//00458F3C
    procedure RemoveForm(AForm:TCustomForm);//00458F74
    procedure AddDataModule(DataModule:TDataModule);//00458FC4
    procedure RemoveDataModule(DataModule:TDataModule);//00458FD0
    procedure CreateCursors;//00458FDC
    procedure DestroyCursors;//00459038
    procedure InsertCursor(Index:Integer; Handle:HCURSOR);//00459094
    function GetImes:TStrings;//004590BC
    function GetDefaultIME:AnsiString;//004592BC
    procedure IconFontChanged(Sender:TObject);//004592D8
    function GetDataModule(Index:Integer):TDataModule;//00459328
    function GetDataModuleCount:Integer;//0045933C
    function GetCursors(Index:Integer):HCURSOR;//00459344
    procedure SetCursor(Value:TCursor);//0045936C
    procedure GetMetricSettings;//004593FC
    procedure DisableAlign;//00459550
    procedure EnableAlign;//00459558
    procedure Realign;//00459578
    procedure AlignForms(AForm:TCustomForm; var Rect:TRect);//00459934
    procedure AlignForm(AForm:TCustomForm);//004599BC
    procedure ResetFonts;//00459A44
  end;
  THintInfo = THintInfo = record//size=0x40
f38:String;//f38
end;;
  TApplication = class(TComponent)
  public
    FHandle:HWND;//f30
    FBiDiMode:TBiDiMode;//f34
    FBiDiKeyboard:String;//f38
    FNonBiDiKeyboard:String;//f3C
    FObjectInstance:Pointer;//f40
    FMainForm:TForm;//f44
    FMouseControl:TControl;//f48
    FHelpSystem:IHelpSystem;//f4C
    FHelpFile:String;//f50
    FHint:String;//f54
    FHintActive:Boolean;//f58
    FUpdateFormatSettings:Boolean;//f59
    FUpdateMetricSettings:Boolean;//f5A
    FShowMainForm:Boolean;//f5B
    FHintColor:TColor;//f5C
    FHintControl:TControl;//f60
    FHintCursorRect:TRect;//f64
    FHintHidePause:Integer;//f74
    FHintPause:Integer;//f78
    FHintShortCuts:Boolean;//f7C
    FHintShortPause:Integer;//f80
    FHintWindow:THintWindow;//f84
    FShowHint:Boolean;//f88
    FTimerMode:TTimerMode;//f89
    FTimerHandle:Word;//f8A
    FTitle:String;//f8C
    FTopMostList:TList;//f90
    FTopMostLevel:Integer;//f94
    FIcon:TIcon;//f98
    FTerminate:Boolean;//f9C
    FActive:Boolean;//f9D
    FAllowTesting:Boolean;//f9E
    FTestLib:THandle;//fA0
    FHandleCreated:Boolean;//fA4
    FRunning:Boolean;//fA5
    FWindowHooks:TList;//fA8
    FWindowList:Pointer;//fAC
    FDialogHandle:HWND;//fB0
    FAutoDragDocking:Boolean;//fB4
    FModalLevel:Integer;//fB8
    FOnActionExecute:TActionEvent;//fC0
    FOnActionUpdate:TActionEvent;//fC8
    FOnException:TExceptionEvent;//fD0
    FOnMessage:TMessageEvent;//fD8
    fDC:TForm1;//fDC
    FOnModalBegin:TNotifyEvent;//fE0
    FOnModalEnd:TNotifyEvent;//fE8
    FOnHelp:THelpEvent;//fF0
    FOnHint:TNotifyEvent;//fF8
    FOnIdle:TIdleEvent;//f100
    f104:dword;//f104
    FOnDeactivate:TNotifyEvent;//f108
    FOnActivate:TNotifyEvent;//f110
    FOnMinimize:TNotifyEvent;//f118
    FOnRestore:TNotifyEvent;//f120
    FOnShortCut:TShortCutEvent;//f128
    FOnShowHint:TShowHintEvent;//f130
    FOnSettingChange:TSettingChangeEvent;//f138
    destructor Destroy; virtual;//00459EF0
    constructor Create(AOwner:TComponent); virtual;//v2C//00459D04
    procedure CreateHandle;//0045A00C
    procedure ControlDestroyed(Control:TControl);//0045A1BC
    procedure DoNormalizeTopMosts(IncludeMain:Boolean);//0045A28C
    procedure ModalStarted;//0045A33C
    procedure ModalFinished;//0045A368
    procedure NormalizeTopMosts;//0045A394
    procedure NormalizeAllTopMosts;//0045A39C
    procedure RestoreTopMosts;//0045A3A4
    function UseRightToLeftReading:Boolean;//0045A410
    function UseRightToLeftAlignment:Boolean;//0045A428
    function CheckIniChange(var Message:TMessage):Boolean;//0045A440
    procedure SettingChange(var Message:TWMSettingChange);//0045A498
    procedure WndProc(var Message:TMessage);//0045A58C
    function GetIconHandle:HICON;//0045AC90
    procedure Minimize;//0045ACAC
    procedure Restore;//0045AD5C
    procedure BringToFront;//0045AE5C
    function GetTitle:AnsiString;//0045AE98
    procedure SetTitle(const Value:AnsiString);//0045AEE4
    function IsDlgMsg(var Msg:TMsg):Boolean;//0045AF74
    function IsMDIMsg(var Msg:TMsg):Boolean;//0045AF98
    function IsKeyMsg(var Msg:TMsg):Boolean;//0045AFE8
    function IsHintMsg(var Msg:TMsg):Boolean;//0045B0A0
    function IsShortCut(var Message:TWMKey):Boolean;//0045B0D4
    function ProcessMessage(var Msg:TMsg):Boolean;//0045B140
    procedure ProcessMessages;//0045B1D8
    procedure HandleMessage;//0045B1F0
    procedure HookMainWindow(Hook:TWindowHook);//0045B214
    procedure UnhookMainWindow(Hook:TWindowHook);//0045B270
    procedure Initialize;//0045B2EC
    procedure CreateForm(InstanceClass:TComponentClass; var Reference:void );//0045B304
    procedure Run;//0045B384
    procedure Terminate;//0045B470
    procedure HandleException(Sender:TObject);//0045B484
    function MessageBox(const Text:PChar; const Caption:PChar; Flags:Longint):Integer;//0045B514
    procedure ShowException(E:Exception);//0045B67C
    function InvokeHelp(Command:Word; Data:Longint):Boolean;//0045B754
    function HelpKeyword(const Keyword:AnsiString):Boolean;//0045B8BC
    function HelpContext(Context:THelpContext):Boolean;//0045B924
    function HelpCommand(Command:Integer; Data:Longint):Boolean;//0045B98C
    procedure SetShowHint(Value:Boolean);//0045B994
    procedure DoActionIdle;//0045B9E4
    function DoMouseIdle:TControl;//0045BA48
    procedure Idle(const Msg:TMsg);//0045BAC0
    procedure NotifyForms(Msg:Word);//0045BBE0
    procedure IconChanged(Sender:TObject);//0045BC1C
    procedure SetHint(const Value:AnsiString);//0045BC80
    procedure UpdateVisible;//0045BD70
    function ValidateHelpSystem:Boolean;//0045BDF8
    procedure StartHintTimer(Value:Integer; TimerMode:TTimerMode);//0045BE20
    procedure StopHintTimer;//0045BE64
    procedure HintMouseMessage(Control:TControl; var Message:TMessage);//0045BE8C
    procedure HintTimerExpired;//0045BF9C
    procedure HideHint;//0045BFD4
    procedure CancelHint;//0045C018
    procedure ActivateHint(CursorPos:TPoint);//0045C2B0
    function GetCurrentHelpFile:AnsiString;//0045C644
    function DispatchAction(Msg:Longint; Action:TBasicAction):Boolean;//0045C680
    function ExecuteAction(Action:TBasicAction):Boolean;//0045C710
    function UpdateAction(Action:TBasicAction):Boolean;//0045C738
    procedure WakeMainThread(Sender:TObject);//0045C7AC
    procedure HookSynchronizeWakeup;//0045C7BC
    procedure UnhookSynchronizeWakeup;//0045C7CC
  end;
    function SaveFocusState:TFocusState;//00452190
    procedure RestoreFocusState(FocusState:TFocusState);//00452198
    procedure ShowMDIClientEdge(ClientHandle:THandle; ShowEdge:Boolean);//004521A0
    procedure DoneApplication;//004521EC
    function DoDisableWindow(Window:HWND; Data:Longint):BOOL; stdcall;//00452224
    function DisableTaskWindows(ActiveWindow:HWND):Pointer;//00452274
    procedure EnableTaskWindows(WindowList:Pointer);//00452328
    function DoFindWindow(Window:HWND; Param:Longint):BOOL; stdcall;//00452360
    function FindTopMostWindow(ActiveWindow:HWND):HWND;//004523C4
    function SendFocusMessage(Window:HWND; Msg:Word):Boolean;//00452400
    function CheckTaskWindow(Window:HWND; Data:Longint):BOOL; stdcall;//00452420
    function ForegroundTask:Boolean;//00452440
    function FindGlobalComponent(const Name:AnsiString):TComponent;//0045246C
    function KeysToShiftState(Keys:Word):TShiftState;//004524EC
    function KeyDataToShiftState(KeyData:Longint):TShiftState;//00452540
    function KeyboardStateToShiftState(const KeyboardState:TKeyboardState):TShiftState;//0045257C
    function IsAccel(VK:Word; const Str:AnsiString):Boolean;//004525C8
    function GetParentForm(Control:TControl):TCustomForm;//00452638
    function ValidParentForm(Control:TControl):TCustomForm;//00452660
    procedure Assign(Source:TPersistent);//00452770
    procedure ProcessHorz(Control:TControl);//004527F8
    procedure ProcessVert(Control:TControl);//00452864
    function ScrollBarVisible(Code:Word):Boolean;//004529B0
    function Adjustment(Code:Word; Metric:Word):Integer;//004529E4
    function GetRealScrollPosition:Integer;//00452AF8
    procedure UpdateScrollProperties(Redraw:Boolean);//00453044
    constructor Create(AOwner:TComponent);//00453264
    destructor Destroy;//004532DC
    procedure CreateParams(var Params:TCreateParams);//00453318
    procedure CreateWnd;//00453328
    procedure AlignControls(AControl:TControl; var ARect:TRect);//00453368
    function AutoScrollEnabled:Boolean;//00453388
    procedure DoFlipChildren;//004533A8
    procedure AutoScrollInView(AControl:TControl);//00453638
    procedure ChangeScale(M:Integer; D:Integer);//00453848
    procedure sub_0045386C;//0045386C
    procedure WMSize(var Message:TWMSize);//00453870
    procedure WMHScroll(Message:TWMCommand);//0045394C
    procedure WMVScroll(Message:TWMHScroll);//00453970
    //procedure sub_00453994(?:?);//00453994
    procedure CMBiDiModeChanged(var Message:TMessage);//00453A04
    constructor Create(AOwner:TComponent);//00453A94
    procedure AfterConstruction;//00453C20
    constructor CreateNew(AOwner:TComponent; Dummy:Integer);//00453C58
    procedure BeforeDestruction;//00453DD4
    destructor Destroy;//00453E3C
    procedure DoCreate;//00453F20
    procedure DoDestroy;//00453F9C
    procedure Loaded;//00453FFC
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00454038
    procedure ReadState(Reader:TReader);//00454144
    procedure DefineProperties(Filer:TFiler);//004543AC
    procedure BeginAutoDrag;//004544F0
    procedure ChangeScale(M:Integer; D:Integer);//004544F4
    procedure DoClose(var Action:TCloseAction);//0045463C
    procedure DoHide;//0045465C
    procedure DoShow;//0045467C
    function GetClientRect:TRect;//0045469C
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00454724
    function GetFloating:Boolean;//00454790
    procedure SetChildOrder(Child:TComponent; Order:Integer);//004547BC
    procedure SetParentBiDiMode(Value:Boolean);//00454850
    procedure sub_0043CF6C;//0045491C
    //function sub_00454980:?;//00454980
    procedure SetParent(AParent:TWinControl);//00454984
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);//004549BC
    procedure WndProc(var Message:TMessage);//004549FC
    procedure Default;//00454E34
    function MaximizedChildren:Boolean;//00454E80
    procedure AlignControls(AControl:TControl; var Rect:TRect);//004550A0
    procedure CMBiDiModeChanged(var Message:TMessage);//0045510C
    procedure CMParentBiDiModeChanged(var Message:TMessage);//004551A4
    procedure Dock(NewDockSite:TWinControl; ARect:TRect);//00455290
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect);//004552D4
    function EnumMonitorsProc(hm:HMONITOR; dc:HDC; r:PRect; Data:Pointer):Boolean; stdcall;//004553F8
    procedure CMColorChanged(var Message:TMessage);//00455910
    procedure CMCtl3DChanged(var Message:TMessage);//0045594C
    procedure CMFontChanged(var Message:TMessage);//00455994
    procedure CMMenuChanged(var Message:TMessage);//004559B4
    procedure CreateParams(var Params:TCreateParams);//00455D64
    procedure CreateWnd;//00455F80
    procedure CreateWindowHandle(const Params:TCreateParams);//004560C4
    procedure DestroyWindowHandle;//004561FC
    procedure DefaultHandler(var Message:void );//00456240
    function SetFocusedControl(Control:TWinControl):Boolean;//004563C8
    procedure sub_00456658;//00456658
    procedure DoNestedActivation(Msg:Cardinal; Control:TWinControl; Form:TCustomForm);//00456808
    procedure Activate;//00456854
    procedure Deactivate;//00456884
    procedure Paint;//004568B4
    procedure PaintWindow(DC:HDC);//004568F0
    procedure PaletteChanged(Foreground:Boolean);//004569AC
    procedure WMPaint(var Message:TWMPaint);//00456A4C
    procedure WMIconEraseBkgnd(var Message:TWMEraseBkgnd);//00456ACC
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//00456B2C
    procedure WMQueryDragIcon(var Message:TWMQueryDragIcon);//00456B64
    procedure ModifySystemMenu;//00456B78
    procedure WMNCCreate(var Message:TWMNCCreate);//00456C74
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//00456CA8
    procedure WMDestroy(var Message:TWMDestroy);//00456D38
    procedure WMCommand(Message:TWMCharToItem);//00456D98
    procedure WMInitMenuPopup(var Message:TWMInitMenuPopup);//00456DCC
    procedure WMMenuChar(var Message:TWMMenuChar);//00456DE4
    procedure WMMenuSelect(var Message:TWMMenuSelect);//00456E1C
    procedure WMActivate(var Message:TWMActivate);//00456EC4
    procedure Resizing(State:TWindowState);//00456EE4
    procedure WMClose;//00456F1C
    procedure WMQueryEndSession(var Message:TWMQueryEndSession);//00456F24
    procedure CMAppSysCommand(var Message:TMessage);//00456F50
    procedure WMSysCommand(var Message:TWMSysCommand);//00456FA8
    procedure WMShowWindow(var Message:TWMShowWindow);//00457034
    procedure WMMDIActivate(var Message:TWMMDIActivate);//004570CC
    procedure WMNextDlgCtl(var Message:TWMNextDlgCtl);//00457124
    procedure WMEnterMenuLoop(var Message:TMessage);//00457150
    function GetMenuHelpContext(Menu:TMenu):Integer;//0045716C
    function ControlHasHelp(const Control:TWinControl):Boolean;//004571AC
    procedure GetHelpInfo(const Control:TWinControl; var HType:THelpType; var ContextID:Integer; var Keyword:AnsiString);//004571E4
    procedure WMHelp(var Message:TWMHelp);//00457218
    procedure WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo);//00457378
    procedure HandleEdge(var Edge:Integer; SnapToEdge:Integer; SnapDistance:Integer);//004573EC
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging);//00457418
    procedure CMActivate(var Message:TCMActivate);//004574D0
    procedure CMDeactivate(var Message:TCMDeactivate);//004574F4
    procedure CMDialogKey(var Message:TCMDialogKey);//00457518
    procedure CMShowingChanged(var Message:TMessage);//004575B4
    procedure CMIconChanged(var Message:TMessage);//00457B2C
    procedure CMRelease;//00457B4C
    procedure CMTextChanged(var Message:TMessage);//00457B54
    procedure CMUIActivate;//00457BA4
    procedure CMParentFontChanged(var Message:TMessage);//00457BAC
    procedure CMIsShortCut(var Message:TWMKey);//00457C18
    function CloseQuery:Boolean;//00457CE8
    procedure SetFocus;//00457E04
    //function sub_00457E9C:?;//00457E9C
    procedure TraverseClients(Container:TWinControl);//00458174
    procedure UpdateActions;//004581E4
    procedure RequestAlign;//0045824C
    procedure WMSettingChange(var Message:TMessage);//00458268
    function ProcessExecute(Control:TControl):Boolean;//0045828C
    function TraverseClients(Container:TWinControl):Boolean;//004582BC
    procedure CMActionExecute(var Message:TMessage);//00458338
    function ProcessUpdate(Control:TControl):Boolean;//0045838C
    function TraverseClients(Container:TWinControl):Boolean;//004583BC
    procedure CMActionUpdate(var Message:TMessage);//00458438
    function DispatchShortCut:Boolean;//0045848C
    procedure IsShortCut(var Message:TWMKey);//004584E0
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//0045855C
    procedure MouseWheelHandler(var Message:TMessage);//00458598
    procedure HandleCreateException;//004585D0
    constructor Create(AOwner:TComponent);//00458734
    procedure DoAddDockClient(Client:TControl; const ARect:TRect);//0045879C
    procedure DoRemoveDockClient(Client:TControl);//00458880
    procedure Loaded;//004588A0
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);//004588EC
    procedure WMNCHitTest(var Message:TWMNCHitTest);//00458918
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//00458940
    procedure CMControlListChange(var Message:TMessage);//004589D8
    procedure CMDockNotification(var Message:TCMDockNotification);//00458A30
    procedure CMUnDockClient(var Message:TCMUnDockClient);//00458B04
    procedure CMVisibleChanged(var Message:TMessage);//00458B1C
    constructor Create(AOwner:TComponent);//00458C20
    destructor Destroy;//00458D78
    function InsertBefore(C1:TCustomForm; C2:TCustomForm; AAlign:TAlign):Boolean;//00459580
    procedure DoPosition(Form:TCustomForm; AAlign:TAlign);//004595E0
    procedure DoAlign(AAlign:TAlign);//00459790
    function AlignWork:Boolean;//004598DC
    function GetHint(Control:TControl):AnsiString;//00459A50
    function GetHintControl(Control:TControl):TControl;//00459A88
    procedure HintTimerProc(Wnd:HWND; Msg:Longint; TimerID:Longint; SysTime:Longint); stdcall;//00459AA8
    procedure HintMouseThread(Param:Integer); stdcall;//00459AFC
    function HintGetMsgHook(nCode:Integer; wParam:Longint; var Msg:TMsg):Longint; stdcall;//00459B58
    procedure HookHintHooks;//00459B9C
    procedure UnhookHintHooks;//00459C10
    function GetAnimation:Boolean;//00459C6C
    procedure SetAnimation(Value:Boolean);//00459C9C
    procedure ShowWinNoAnimate(Handle:HWND; CmdShow:Integer);//00459CC4
    constructor _NF__A5A;//00459CF4
    constructor Create(AOwner:TComponent);//00459D04
    destructor Destroy;//00459EF0
    function GetTopMostWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;//0045A21C
    procedure Default;//0045A504
    procedure DrawAppIcon;//0045A540
    procedure SetVisible(Value:Boolean);//0045BD14
    function FindScanline(Source:Pointer; MaxLen:Cardinal; Value:Cardinal):Cardinal;//0045C040
    function GetCursorHeightMargin:Integer;//0045C050
    procedure ValidateHintWindow(HintClass:THintWindowClass);//0045C1A4
    function MultiLineWidth(const Value:AnsiString):Integer;//0045C204
    procedure InitProcs;//0045C760
    procedure _NF__BA6;//0045C7DC

implementation

//00452190
function SaveFocusState:TFocusState;
begin
{*
 00452190    mov         eax,[005ACDB8];gvar_005ACDB8
 00452195    ret
*}
end;

//00452198
procedure RestoreFocusState(FocusState:TFocusState);
begin
{*
 00452198    mov         [005ACDB8],eax;gvar_005ACDB8
 0045219D    ret
*}
end;

//004521A0
procedure ShowMDIClientEdge(ClientHandle:THandle; ShowEdge:Boolean);
begin
{*
 004521A0    push        ebx
 004521A1    push        esi
 004521A2    mov         ebx,edx
 004521A4    mov         esi,eax
 004521A6    test        esi,esi
>004521A8    je          004521E7
 004521AA    push        0EC
 004521AC    push        esi
 004521AD    call        user32.GetWindowLongA
 004521B2    test        bl,bl
>004521B4    je          004521C2
 004521B6    test        ah,2
>004521B9    jne         004521E7
 004521BB    or          eax,200
>004521C0    jmp         004521CC
 004521C2    test        ah,2
>004521C5    je          004521E7
 004521C7    and         eax,0FFFFFDFF
 004521CC    push        eax
 004521CD    push        0EC
 004521CF    push        esi
 004521D0    call        user32.SetWindowLongA
 004521D5    push        37
 004521D7    push        0
 004521D9    push        0
 004521DB    push        0
 004521DD    push        0
 004521DF    push        0
 004521E1    push        esi
 004521E2    call        user32.SetWindowPos
 004521E7    pop         esi
 004521E8    pop         ebx
 004521E9    ret
*}
end;

//004521EC
procedure DoneApplication;
begin
{*
 004521EC    mov         eax,[005E0CAC];Application:TApplication
 004521F1    mov         eax,dword ptr [eax+30]
 004521F4    test        eax,eax
>004521F6    je          00452200
 004521F8    push        0
 004521FA    push        eax
 004521FB    call        user32.ShowOwnedPopups
 00452200    xor         edx,edx
 00452202    mov         eax,[005E0CAC];Application:TApplication
 00452207    call        TApplication.SetShowHint
 0045220C    mov         eax,[005E0CAC];Application:TApplication
 00452211    call        TComponent.Destroying
 00452216    mov         eax,[005E0CAC];Application:TApplication
 0045221B    call        TComponent.DestroyComponents
 00452220    ret
*}
end;

//00452224
function DoDisableWindow(Window:HWND; Data:Longint):BOOL; stdcall;
begin
{*
 00452224    push        ebp
 00452225    mov         ebp,esp
 00452227    push        ebx
 00452228    mov         ebx,dword ptr [ebp+8]
 0045222B    cmp         ebx,dword ptr ds:[5ACDBC]
>00452231    je          00452269
 00452233    push        ebx
 00452234    call        user32.IsWindowVisible
 00452239    test        eax,eax
>0045223B    je          00452269
 0045223D    push        ebx
 0045223E    call        user32.IsWindowEnabled
 00452243    test        eax,eax
>00452245    je          00452269
 00452247    mov         eax,8
 0045224C    call        @GetMem
 00452251    mov         edx,dword ptr ds:[5ACDC8]
 00452257    mov         dword ptr [eax],edx
 00452259    mov         dword ptr [eax+4],ebx
 0045225C    mov         [005ACDC8],eax
 00452261    push        0
 00452263    push        ebx
 00452264    call        user32.EnableWindow
 00452269    or          eax,0FFFFFFFF
 0045226C    pop         ebx
 0045226D    pop         ebp
 0045226E    ret         8
*}
end;

//00452274
function DisableTaskWindows(ActiveWindow:HWND):Pointer;
begin
{*
 00452274    push        ebp
 00452275    mov         ebp,esp
 00452277    add         esp,0FFFFFFF4
 0045227A    push        ebx
 0045227B    push        esi
 0045227C    push        edi
 0045227D    xor         edx,edx
 0045227F    mov         dword ptr [ebp-4],edx
 00452282    mov         edx,dword ptr ds:[5ACDBC]
 00452288    mov         dword ptr [ebp-8],edx
 0045228B    mov         edx,dword ptr ds:[5ACDC8]
 00452291    mov         dword ptr [ebp-0C],edx
 00452294    mov         [005ACDBC],eax
 00452299    xor         eax,eax
 0045229B    mov         [005ACDC8],eax
 004522A0    xor         eax,eax
 004522A2    push        ebp
 004522A3    push        452317
 004522A8    push        dword ptr fs:[eax]
 004522AB    mov         dword ptr fs:[eax],esp
 004522AE    xor         eax,eax
 004522B0    push        ebp
 004522B1    push        4522E0
 004522B6    push        dword ptr fs:[eax]
 004522B9    mov         dword ptr fs:[eax],esp
 004522BC    push        0
 004522BE    push        452224;DoDisableWindow:BOOL
 004522C3    call        KERNEL32.GetCurrentThreadId
 004522C8    push        eax
 004522C9    call        user32.EnumThreadWindows
 004522CE    mov         eax,[005ACDC8]
 004522D3    mov         dword ptr [ebp-4],eax
 004522D6    xor         eax,eax
 004522D8    pop         edx
 004522D9    pop         ecx
 004522DA    pop         ecx
 004522DB    mov         dword ptr fs:[eax],edx
>004522DE    jmp         004522F9
>004522E0    jmp         @HandleAnyException
 004522E5    mov         eax,[005ACDC8]
 004522EA    call        EnableTaskWindows
 004522EF    call        @RaiseAgain
 004522F4    call        @DoneExcept
 004522F9    xor         eax,eax
 004522FB    pop         edx
 004522FC    pop         ecx
 004522FD    pop         ecx
 004522FE    mov         dword ptr fs:[eax],edx
 00452301    push        45231E
 00452306    mov         eax,dword ptr [ebp-0C]
 00452309    mov         [005ACDC8],eax
 0045230E    mov         eax,dword ptr [ebp-8]
 00452311    mov         [005ACDBC],eax
 00452316    ret
>00452317    jmp         @HandleFinally
>0045231C    jmp         00452306
 0045231E    mov         eax,dword ptr [ebp-4]
 00452321    pop         edi
 00452322    pop         esi
 00452323    pop         ebx
 00452324    mov         esp,ebp
 00452326    pop         ebp
 00452327    ret
*}
end;

//00452328
procedure EnableTaskWindows(WindowList:Pointer);
begin
{*
 00452328    push        ebx
 00452329    push        esi
 0045232A    mov         esi,eax
 0045232C    test        esi,esi
>0045232E    je          0045235C
 00452330    mov         ebx,esi
 00452332    mov         eax,dword ptr [ebx+4]
 00452335    push        eax
 00452336    call        user32.IsWindow
 0045233B    test        eax,eax
>0045233D    je          0045234A
 0045233F    push        0FF
 00452341    mov         eax,dword ptr [ebx+4]
 00452344    push        eax
 00452345    call        user32.EnableWindow
 0045234A    mov         esi,dword ptr [ebx]
 0045234C    mov         edx,8
 00452351    mov         eax,ebx
 00452353    call        @FreeMem
 00452358    test        esi,esi
>0045235A    jne         00452330
 0045235C    pop         esi
 0045235D    pop         ebx
 0045235E    ret
*}
end;

//00452360
function DoFindWindow(Window:HWND; Param:Longint):BOOL; stdcall;
begin
{*
 00452360    push        ebp
 00452361    mov         ebp,esp
 00452363    push        ebx
 00452364    mov         ebx,dword ptr [ebp+8]
 00452367    cmp         ebx,dword ptr ds:[5ACDBC]
>0045236D    je          004523B9
 0045236F    mov         eax,[005E0CAC];Application:TApplication
 00452374    cmp         ebx,dword ptr [eax+30]
>00452377    je          004523B9
 00452379    push        ebx
 0045237A    call        user32.IsWindowVisible
 0045237F    test        eax,eax
>00452381    je          004523B9
 00452383    push        ebx
 00452384    call        user32.IsWindowEnabled
 00452389    test        eax,eax
>0045238B    je          004523B9
 0045238D    push        0EC
 0045238F    push        ebx
 00452390    call        user32.GetWindowLongA
 00452395    test        al,8
>00452397    jne         004523AA
 00452399    cmp         dword ptr ds:[5ACDC0],0
>004523A0    jne         004523B9
 004523A2    mov         dword ptr ds:[5ACDC0],ebx
>004523A8    jmp         004523B9
 004523AA    cmp         dword ptr ds:[5ACDC4],0
>004523B1    jne         004523B9
 004523B3    mov         dword ptr ds:[5ACDC4],ebx
 004523B9    or          eax,0FFFFFFFF
 004523BC    pop         ebx
 004523BD    pop         ebp
 004523BE    ret         8
*}
end;

//004523C4
function FindTopMostWindow(ActiveWindow:HWND):HWND;
begin
{*
 004523C4    mov         [005ACDBC],eax
 004523C9    xor         eax,eax
 004523CB    mov         [005ACDC0],eax
 004523D0    xor         eax,eax
 004523D2    mov         [005ACDC4],eax
 004523D7    push        0
 004523D9    push        452360;DoFindWindow:BOOL
 004523DE    call        KERNEL32.GetCurrentThreadId
 004523E3    push        eax
 004523E4    call        user32.EnumThreadWindows
 004523E9    cmp         dword ptr ds:[5ACDC0],0
>004523F0    je          004523F8
 004523F2    mov         eax,[005ACDC0]
 004523F7    ret
 004523F8    mov         eax,[005ACDC4]
 004523FD    ret
*}
end;

//00452400
function SendFocusMessage(Window:HWND; Msg:Word):Boolean;
begin
{*
 00452400    push        ebx
 00452401    mov         ebx,dword ptr ds:[5ACDB8];gvar_005ACDB8
 00452407    push        0
 00452409    push        0
 0045240B    movzx       edx,dx
 0045240E    push        edx
 0045240F    push        eax
 00452410    call        user32.SendMessageA
 00452415    cmp         ebx,dword ptr ds:[5ACDB8];gvar_005ACDB8
 0045241B    sete        al
 0045241E    pop         ebx
 0045241F    ret
*}
end;

//00452420
function CheckTaskWindow(Window:HWND; Data:Longint):BOOL; stdcall;
begin
{*
 00452420    push        ebp
 00452421    mov         ebp,esp
 00452423    push        ebx
 00452424    mov         eax,dword ptr [ebp+0C]
 00452427    or          edx,0FFFFFFFF
 0045242A    mov         ecx,eax
 0045242C    mov         ebx,dword ptr [ecx]
 0045242E    cmp         ebx,dword ptr [ebp+8]
>00452431    jne         00452439
 00452433    xor         edx,edx
 00452435    mov         byte ptr [ecx+4],1
 00452439    mov         eax,edx
 0045243B    pop         ebx
 0045243C    pop         ebp
 0045243D    ret         8
*}
end;

//00452440
function ForegroundTask:Boolean;
begin
{*
 00452440    add         esp,0FFFFFFF8
 00452443    call        user32.GetActiveWindow
 00452448    mov         dword ptr [esp],eax
 0045244B    mov         byte ptr [esp+4],0
 00452450    mov         eax,esp
 00452452    push        eax
 00452453    push        452420;CheckTaskWindow:BOOL
 00452458    call        KERNEL32.GetCurrentThreadId
 0045245D    push        eax
 0045245E    call        user32.EnumThreadWindows
 00452463    mov         al,byte ptr [esp+4]
 00452467    pop         ecx
 00452468    pop         edx
 00452469    ret
*}
end;

//0045246C
function FindGlobalComponent(const Name:AnsiString):TComponent;
begin
{*
 0045246C    push        ebx
 0045246D    push        esi
 0045246E    push        edi
 0045246F    push        ebp
 00452470    mov         ebp,eax
 00452472    mov         eax,[005E0CB0];Screen:TScreen
 00452477    call        TScreen.GetFormCount
 0045247C    mov         esi,eax
 0045247E    dec         esi
 0045247F    test        esi,esi
>00452481    jl          004524AC
 00452483    inc         esi
 00452484    xor         edi,edi
 00452486    mov         edx,edi
 00452488    mov         eax,[005E0CB0];Screen:TScreen
 0045248D    call        TScreen.GetForm
 00452492    mov         ebx,eax
 00452494    test        byte ptr [ebx+1D],2
>00452498    jne         004524A8
 0045249A    mov         edx,dword ptr [ebx+8]
 0045249D    mov         eax,ebp
 0045249F    call        CompareText
 004524A4    test        eax,eax
>004524A6    je          004524E2
 004524A8    inc         edi
 004524A9    dec         esi
>004524AA    jne         00452486
 004524AC    mov         eax,[005E0CB0];Screen:TScreen
 004524B1    call        TScreen.GetDataModuleCount
 004524B6    mov         esi,eax
 004524B8    dec         esi
 004524B9    test        esi,esi
>004524BB    jl          004524E0
 004524BD    inc         esi
 004524BE    xor         edi,edi
 004524C0    mov         edx,edi
 004524C2    mov         eax,[005E0CB0];Screen:TScreen
 004524C7    call        TScreen.GetDataModule
 004524CC    mov         ebx,eax
 004524CE    mov         edx,dword ptr [ebx+8]
 004524D1    mov         eax,ebp
 004524D3    call        CompareText
 004524D8    test        eax,eax
>004524DA    je          004524E2
 004524DC    inc         edi
 004524DD    dec         esi
>004524DE    jne         004524C0
 004524E0    xor         ebx,ebx
 004524E2    mov         eax,ebx
 004524E4    pop         ebp
 004524E5    pop         edi
 004524E6    pop         esi
 004524E7    pop         ebx
 004524E8    ret
*}
end;

//004524EC
function KeysToShiftState(Keys:Word):TShiftState;
begin
{*
 004524EC    push        ebx
 004524ED    push        esi
 004524EE    mov         esi,eax
 004524F0    mov         bl,byte ptr ds:[45253C]
 004524F6    test        si,4
>004524FB    je          00452500
 004524FD    or          bl,1
 00452500    test        si,8
>00452505    je          0045250A
 00452507    or          bl,4
 0045250A    test        si,1
>0045250F    je          00452514
 00452511    or          bl,8
 00452514    test        si,2
>00452519    je          0045251E
 0045251B    or          bl,10
 0045251E    test        si,10
>00452523    je          00452528
 00452525    or          bl,20
 00452528    push        12
 0045252A    call        user32.GetKeyState
 0045252F    test        ax,ax
>00452532    jge         00452537
 00452534    or          bl,2
 00452537    mov         eax,ebx
 00452539    pop         esi
 0045253A    pop         ebx
 0045253B    ret
*}
end;

//00452540
function KeyDataToShiftState(KeyData:Longint):TShiftState;
begin
{*
 00452540    push        ebx
 00452541    push        esi
 00452542    mov         esi,eax
 00452544    mov         bl,byte ptr ds:[452578]
 0045254A    push        10
 0045254C    call        user32.GetKeyState
 00452551    test        ax,ax
>00452554    jge         00452559
 00452556    or          bl,1
 00452559    push        11
 0045255B    call        user32.GetKeyState
 00452560    test        ax,ax
>00452563    jge         00452568
 00452565    or          bl,4
 00452568    test        esi,20000000
>0045256E    je          00452573
 00452570    or          bl,2
 00452573    mov         eax,ebx
 00452575    pop         esi
 00452576    pop         ebx
 00452577    ret
*}
end;

//0045257C
function KeyboardStateToShiftState(const KeyboardState:TKeyboardState):TShiftState;
begin
{*
 0045257C    push        ebx
 0045257D    push        esi
 0045257E    mov         esi,eax
 00452580    mov         bl,byte ptr ds:[4525C4]
 00452586    test        byte ptr [esi+10],80
>0045258A    je          0045258F
 0045258C    or          bl,1
 0045258F    test        byte ptr [esi+11],80
>00452593    je          00452598
 00452595    or          bl,4
 00452598    test        byte ptr [esi+12],80
>0045259C    je          004525A1
 0045259E    or          bl,2
 004525A1    test        byte ptr [esi+1],80
>004525A5    je          004525AA
 004525A7    or          bl,8
 004525AA    test        byte ptr [esi+2],80
>004525AE    je          004525B3
 004525B0    or          bl,10
 004525B3    test        byte ptr [esi+4],80
>004525B7    je          004525BC
 004525B9    or          bl,20
 004525BC    mov         eax,ebx
 004525BE    pop         esi
 004525BF    pop         ebx
 004525C0    ret
*}
end;

//004525C8
function IsAccel(VK:Word; const Str:AnsiString):Boolean;
begin
{*
 004525C8    push        ebp
 004525C9    mov         ebp,esp
 004525CB    push        0
 004525CD    push        0
 004525CF    push        ebx
 004525D0    push        esi
 004525D1    mov         esi,edx
 004525D3    mov         ebx,eax
 004525D5    xor         eax,eax
 004525D7    push        ebp
 004525D8    push        452626
 004525DD    push        dword ptr fs:[eax]
 004525E0    mov         dword ptr fs:[eax],esp
 004525E3    lea         edx,[ebp-4]
 004525E6    mov         eax,esi
 004525E8    call        GetHotkey
 004525ED    mov         eax,dword ptr [ebp-4]
 004525F0    push        eax
 004525F1    lea         eax,[ebp-8]
 004525F4    mov         edx,ebx
 004525F6    call        @LStrFromChar
 004525FB    mov         eax,dword ptr [ebp-8]
 004525FE    pop         edx
 004525FF    call        CompareText
 00452604    test        eax,eax
 00452606    sete        al
 00452609    mov         ebx,eax
 0045260B    xor         eax,eax
 0045260D    pop         edx
 0045260E    pop         ecx
 0045260F    pop         ecx
 00452610    mov         dword ptr fs:[eax],edx
 00452613    push        45262D
 00452618    lea         eax,[ebp-8]
 0045261B    mov         edx,2
 00452620    call        @LStrArrayClr
 00452625    ret
>00452626    jmp         @HandleFinally
>0045262B    jmp         00452618
 0045262D    mov         eax,ebx
 0045262F    pop         esi
 00452630    pop         ebx
 00452631    pop         ecx
 00452632    pop         ecx
 00452633    pop         ebp
 00452634    ret
*}
end;

//00452638
function GetParentForm(Control:TControl):TCustomForm;
begin
{*
 00452638    push        ebx
 00452639    mov         ebx,eax
>0045263B    jmp         0045263F
 0045263D    mov         ebx,eax
 0045263F    mov         eax,dword ptr [ebx+30]
 00452642    test        eax,eax
>00452644    jne         0045263D
 00452646    mov         eax,ebx
 00452648    mov         edx,dword ptr ds:[450CFC];TCustomForm
 0045264E    call        @IsClass
 00452653    test        al,al
>00452655    je          0045265B
 00452657    mov         eax,ebx
 00452659    pop         ebx
 0045265A    ret
 0045265B    xor         eax,eax
 0045265D    pop         ebx
 0045265E    ret
*}
end;

//00452660
function ValidParentForm(Control:TControl):TCustomForm;
begin
{*
 00452660    push        ebp
 00452661    mov         ebp,esp
 00452663    add         esp,0FFFFFFF4
 00452666    push        ebx
 00452667    push        esi
 00452668    xor         edx,edx
 0045266A    mov         dword ptr [ebp-0C],edx
 0045266D    mov         esi,eax
 0045266F    xor         eax,eax
 00452671    push        ebp
 00452672    push        4526D1
 00452677    push        dword ptr fs:[eax]
 0045267A    mov         dword ptr fs:[eax],esp
 0045267D    mov         eax,esi
 0045267F    call        GetParentForm
 00452684    mov         ebx,eax
 00452686    test        ebx,ebx
>00452688    jne         004526BB
 0045268A    mov         eax,dword ptr [esi+8]
 0045268D    mov         dword ptr [ebp-8],eax
 00452690    mov         byte ptr [ebp-4],0B
 00452694    lea         eax,[ebp-8]
 00452697    push        eax
 00452698    push        0
 0045269A    lea         edx,[ebp-0C]
 0045269D    mov         eax,[005AE604];^SParentRequired:TResStringRec
 004526A2    call        LoadStr
 004526A7    mov         ecx,dword ptr [ebp-0C]
 004526AA    mov         dl,1
 004526AC    mov         eax,[00417C8C];EInvalidOperation
 004526B1    call        Exception.CreateFmt
 004526B6    call        @RaiseExcept
 004526BB    xor         eax,eax
 004526BD    pop         edx
 004526BE    pop         ecx
 004526BF    pop         ecx
 004526C0    mov         dword ptr fs:[eax],edx
 004526C3    push        4526D8
 004526C8    lea         eax,[ebp-0C]
 004526CB    call        @LStrClr
 004526D0    ret
>004526D1    jmp         @HandleFinally
>004526D6    jmp         004526C8
 004526D8    mov         eax,ebx
 004526DA    pop         esi
 004526DB    pop         ebx
 004526DC    mov         esp,ebp
 004526DE    pop         ebp
 004526DF    ret
*}
end;

//004526E0
constructor TControlScrollBar.Create(AControl:TScrollingWinControl; AKind:TScrollBarKind);
begin
{*
 004526E0    push        ebp
 004526E1    mov         ebp,esp
 004526E3    push        ebx
 004526E4    push        esi
 004526E5    push        edi
 004526E6    test        dl,dl
>004526E8    je          004526F2
 004526EA    add         esp,0FFFFFFF0
 004526ED    call        @ClassCreate
 004526F2    mov         esi,ecx
 004526F4    mov         ebx,edx
 004526F6    mov         edi,eax
 004526F8    xor         edx,edx
 004526FA    mov         eax,edi
 004526FC    call        TObject.Create
 00452701    mov         dword ptr [edi+4],esi
 00452704    mov         al,byte ptr [ebp+8]
 00452707    mov         byte ptr [edi+18],al
 0045270A    mov         cx,50
 0045270E    mov         word ptr [edi+0A],cx
 00452712    movzx       eax,cx
 00452715    mov         ecx,0A
 0045271A    xor         edx,edx
 0045271C    div         eax,ecx
 0045271E    mov         word ptr [edi+8],ax
 00452722    mov         byte ptr [edi+1C],1
 00452726    mov         dword ptr [edi+20],0A
 0045272D    mov         dword ptr [edi+40],4
 00452734    mov         dword ptr [edi+3C],0C
 0045273B    mov         dword ptr [edi+28],0FF000014
 00452742    mov         byte ptr [edi+2C],1
 00452746    mov         byte ptr [edi+44],1
 0045274A    mov         eax,edi
 0045274C    test        bl,bl
>0045274E    je          0045275F
 00452750    call        @AfterConstruction
 00452755    pop         dword ptr fs:[0]
 0045275C    add         esp,0C
 0045275F    mov         eax,edi
 00452761    pop         edi
 00452762    pop         esi
 00452763    pop         ebx
 00452764    pop         ebp
 00452765    ret         4
*}
end;

//00452768
procedure TControlScrollBar.IsStoredIncrement(Value:TScrollBarInc);
begin
{*
 00452768    mov         al,byte ptr [eax+1F];TControlScrollBar.Smooth:Boolean
 0045276B    xor         al,1
 0045276D    ret
*}
end;

//00452770
procedure TControlScrollBar.Assign(Source:TPersistent);
begin
{*
 00452770    push        ebx
 00452771    push        esi
 00452772    push        edi
 00452773    mov         esi,edx
 00452775    mov         ebx,eax
 00452777    mov         eax,esi
 00452779    mov         edx,dword ptr ds:[450464];TControlScrollBar
 0045277F    call        @IsClass
 00452784    test        al,al
>00452786    je          004527B2
 00452788    mov         edi,esi
 0045278A    mov         dl,byte ptr [edi+1C]
 0045278D    mov         eax,ebx
 0045278F    call        TControlScrollBar.SetVisible
 00452794    mov         edx,dword ptr [edi+10]
 00452797    mov         eax,ebx
 00452799    call        TControlScrollBar.SetRange
 0045279E    mov         edx,dword ptr [edi+0C]
 004527A1    mov         eax,ebx
 004527A3    call        TControlScrollBar.SetPosition
 004527A8    mov         ax,word ptr [edi+8]
 004527AC    mov         word ptr [ebx+8],ax
>004527B0    jmp         004527BB
 004527B2    mov         edx,esi
 004527B4    mov         eax,ebx
 004527B6    call        TPersistent.Assign
 004527BB    pop         edi
 004527BC    pop         esi
 004527BD    pop         ebx
 004527BE    ret
*}
end;

//004527C0
procedure TControlScrollBar.ChangeBiDiPosition;
begin
{*
 004527C0    push        ebx
 004527C1    mov         ebx,eax
 004527C3    cmp         byte ptr [ebx+18],0
>004527C7    jne         004527F5
 004527C9    mov         eax,ebx
 004527CB    call        TControlScrollBar.IsScrollBarVisible
 004527D0    test        al,al
>004527D2    je          004527F5
 004527D4    mov         eax,dword ptr [ebx+4]
 004527D7    call        TControl.UseRightToLeftScrollBar
 004527DC    test        al,al
>004527DE    jne         004527EB
 004527E0    xor         edx,edx
 004527E2    mov         eax,ebx
 004527E4    call        TControlScrollBar.SetPosition
>004527E9    jmp         004527F5
 004527EB    mov         edx,dword ptr [ebx+10]
 004527EE    mov         eax,ebx
 004527F0    call        TControlScrollBar.SetPosition
 004527F5    pop         ebx
 004527F6    ret
*}
end;

//004527F8
procedure ProcessHorz(Control:TControl);
begin
{*
 004527F8    push        ebp
 004527F9    mov         ebp,esp
 004527FB    push        ebx
 004527FC    mov         ebx,eax
 004527FE    cmp         byte ptr [ebx+57],0
>00452802    je          00452858
 00452804    mov         al,byte ptr [ebx+5B]
 00452807    sub         al,1
>00452809    jb          00452815
 0045280B    sub         al,2
>0045280D    je          00452815
 0045280F    dec         al
>00452811    je          0045284F
>00452813    jmp         00452858
 00452815    cmp         byte ptr [ebx+5B],3
>00452819    je          0045282D
 0045281B    mov         al,[0045285C]
 00452820    and         al,byte ptr [ebx+61]
 00452823    mov         dl,byte ptr ds:[452860]
 00452829    cmp         dl,al
>0045282B    jne         00452858
 0045282D    mov         eax,dword ptr [ebp+8]
 00452830    mov         eax,dword ptr [eax-8]
 00452833    mov         edx,dword ptr [eax+0C]
 00452836    add         edx,dword ptr [ebx+40]
 00452839    add         edx,dword ptr [ebx+48]
 0045283C    mov         eax,dword ptr [ebp+8]
 0045283F    mov         eax,dword ptr [eax-4]
 00452842    call        Max
 00452847    mov         edx,dword ptr [ebp+8]
 0045284A    mov         dword ptr [edx-4],eax
>0045284D    jmp         00452858
 0045284F    mov         eax,dword ptr [ebp+8]
 00452852    mov         edx,dword ptr [ebx+48]
 00452855    add         dword ptr [eax-0C],edx
 00452858    pop         ebx
 00452859    pop         ebp
 0045285A    ret
*}
end;

//00452864
procedure ProcessVert(Control:TControl);
begin
{*
 00452864    push        ebp
 00452865    mov         ebp,esp
 00452867    push        ebx
 00452868    mov         ebx,eax
 0045286A    cmp         byte ptr [ebx+57],0
>0045286E    je          004528BE
 00452870    mov         al,byte ptr [ebx+5B]
 00452873    sub         al,2
>00452875    jb          0045287B
>00452877    je          004528B5
>00452879    jmp         004528BE
 0045287B    cmp         byte ptr [ebx+5B],1
>0045287F    je          00452893
 00452881    mov         al,[004528C4]
 00452886    and         al,byte ptr [ebx+61]
 00452889    mov         dl,byte ptr ds:[4528C8]
 0045288F    cmp         dl,al
>00452891    jne         004528BE
 00452893    mov         eax,dword ptr [ebp+8]
 00452896    mov         eax,dword ptr [eax-8]
 00452899    mov         edx,dword ptr [eax+0C]
 0045289C    add         edx,dword ptr [ebx+44]
 0045289F    add         edx,dword ptr [ebx+4C]
 004528A2    mov         eax,dword ptr [ebp+8]
 004528A5    mov         eax,dword ptr [eax-4]
 004528A8    call        Max
 004528AD    mov         edx,dword ptr [ebp+8]
 004528B0    mov         dword ptr [edx-4],eax
>004528B3    jmp         004528BE
 004528B5    mov         eax,dword ptr [ebp+8]
 004528B8    mov         edx,dword ptr [ebx+4C]
 004528BB    add         dword ptr [eax-0C],edx
 004528BE    pop         ebx
 004528BF    pop         ebp
 004528C0    ret
*}
end;

//004528CC
procedure TControlScrollBar.CalcAutoRange;
begin
{*
 004528CC    push        ebp
 004528CD    mov         ebp,esp
 004528CF    add         esp,0FFFFFFF4
 004528D2    push        ebx
 004528D3    push        esi
 004528D4    mov         dword ptr [ebp-8],eax
 004528D7    mov         eax,dword ptr [ebp-8]
 004528DA    mov         ebx,dword ptr [eax+4]
 004528DD    cmp         byte ptr [ebx+210],0
>004528E4    je          00452971
 004528EA    mov         eax,ebx
 004528EC    mov         edx,dword ptr [eax]
 004528EE    call        dword ptr [edx+0C8]
 004528F4    test        al,al
>004528F6    je          00452967
 004528F8    xor         eax,eax
 004528FA    mov         dword ptr [ebp-4],eax
 004528FD    xor         eax,eax
 004528FF    mov         dword ptr [ebp-0C],eax
 00452902    mov         eax,dword ptr [ebp-8]
 00452905    mov         eax,dword ptr [eax+4]
 00452908    call        TWinControl.GetControlCount
 0045290D    mov         ebx,eax
 0045290F    dec         ebx
 00452910    test        ebx,ebx
>00452912    jl          0045294E
 00452914    inc         ebx
 00452915    xor         esi,esi
 00452917    mov         eax,dword ptr [ebp-8]
 0045291A    cmp         byte ptr [eax+18],0
>0045291E    jne         00452936
 00452920    push        ebp
 00452921    mov         eax,dword ptr [ebp-8]
 00452924    mov         eax,dword ptr [eax+4]
 00452927    mov         edx,esi
 00452929    call        TWinControl.GetControl
 0045292E    call        ProcessHorz
 00452933    pop         ecx
>00452934    jmp         0045294A
 00452936    push        ebp
 00452937    mov         eax,dword ptr [ebp-8]
 0045293A    mov         eax,dword ptr [eax+4]
 0045293D    mov         edx,esi
 0045293F    call        TWinControl.GetControl
 00452944    call        ProcessVert
 00452949    pop         ecx
 0045294A    inc         esi
 0045294B    dec         ebx
>0045294C    jne         00452917
 0045294E    mov         edx,dword ptr [ebp-4]
 00452951    add         edx,dword ptr [ebp-0C]
 00452954    mov         eax,dword ptr [ebp-8]
 00452957    movzx       eax,word ptr [eax+1A]
 0045295B    add         edx,eax
 0045295D    mov         eax,dword ptr [ebp-8]
 00452960    call        TControlScrollBar.DoSetRange
>00452965    jmp         00452971
 00452967    xor         edx,edx
 00452969    mov         eax,dword ptr [ebp-8]
 0045296C    call        TControlScrollBar.DoSetRange
 00452971    pop         esi
 00452972    pop         ebx
 00452973    mov         esp,ebp
 00452975    pop         ebp
 00452976    ret
*}
end;

//00452978
function TControlScrollBar.IsScrollBarVisible:Boolean;
begin
{*
 00452978    push        ebx
 00452979    push        esi
 0045297A    mov         ebx,eax
 0045297C    mov         esi,100000
 00452981    cmp         byte ptr [ebx+18],1
>00452985    jne         0045298C
 00452987    mov         esi,200000
 0045298C    cmp         byte ptr [ebx+1C],0
>00452990    je          004529A6
 00452992    push        0F0
 00452994    mov         eax,dword ptr [ebx+4]
 00452997    call        TWinControl.GetHandle
 0045299C    push        eax
 0045299D    call        user32.GetWindowLongA
 004529A2    test        eax,esi
>004529A4    jne         004529AB
 004529A6    xor         eax,eax
 004529A8    pop         esi
 004529A9    pop         ebx
 004529AA    ret
 004529AB    mov         al,1
 004529AD    pop         esi
 004529AE    pop         ebx
 004529AF    ret
*}
end;

//004529B0
function ScrollBarVisible(Code:Word):Boolean;
begin
{*
 004529B0    push        ebp
 004529B1    mov         ebp,esp
 004529B3    push        ebx
 004529B4    mov         ebx,100000
 004529B9    cmp         ax,1
>004529BD    jne         004529C4
 004529BF    mov         ebx,200000
 004529C4    push        0F0
 004529C6    mov         eax,dword ptr [ebp+8]
 004529C9    mov         eax,dword ptr [eax-4]
 004529CC    mov         eax,dword ptr [eax+4]
 004529CF    call        TWinControl.GetHandle
 004529D4    push        eax
 004529D5    call        user32.GetWindowLongA
 004529DA    test        eax,ebx
 004529DC    setne       al
 004529DF    pop         ebx
 004529E0    pop         ebp
 004529E1    ret
*}
end;

//004529E4
function Adjustment(Code:Word; Metric:Word):Integer;
begin
{*
 004529E4    push        ebp
 004529E5    mov         ebp,esp
 004529E7    push        ebx
 004529E8    push        esi
 004529E9    push        edi
 004529EA    mov         edi,edx
 004529EC    mov         esi,eax
 004529EE    xor         ebx,ebx
 004529F0    mov         eax,dword ptr [ebp+8]
 004529F3    cmp         byte ptr [eax-5],0
>004529F7    jne         00452A59
 004529F9    mov         eax,dword ptr [ebp+8]
 004529FC    cmp         byte ptr [eax-6],0
>00452A00    je          00452A2B
 00452A02    mov         eax,dword ptr [ebp+8]
 00452A05    push        eax
 00452A06    mov         eax,esi
 00452A08    call        ScrollBarVisible
 00452A0D    pop         ecx
 00452A0E    test        al,al
>00452A10    jne         00452A2B
 00452A12    movzx       eax,di
 00452A15    push        eax
 00452A16    mov         eax,[005AE32C]
 00452A1B    mov         eax,dword ptr [eax]
 00452A1D    call        eax
 00452A1F    mov         ebx,eax
 00452A21    mov         eax,dword ptr [ebp+8]
 00452A24    sub         ebx,dword ptr [eax-0C]
 00452A27    neg         ebx
>00452A29    jmp         00452A59
 00452A2B    mov         eax,dword ptr [ebp+8]
 00452A2E    cmp         byte ptr [eax-6],0
>00452A32    jne         00452A59
 00452A34    mov         eax,dword ptr [ebp+8]
 00452A37    push        eax
 00452A38    mov         eax,esi
 00452A3A    call        ScrollBarVisible
 00452A3F    pop         ecx
 00452A40    test        al,al
>00452A42    je          00452A59
 00452A44    movzx       eax,di
 00452A47    push        eax
 00452A48    mov         eax,[005AE32C]
 00452A4D    mov         eax,dword ptr [eax]
 00452A4F    call        eax
 00452A51    mov         ebx,eax
 00452A53    mov         eax,dword ptr [ebp+8]
 00452A56    sub         ebx,dword ptr [eax-0C]
 00452A59    mov         eax,ebx
 00452A5B    pop         edi
 00452A5C    pop         esi
 00452A5D    pop         ebx
 00452A5E    pop         ebp
 00452A5F    ret
*}
end;

//00452A60
function TControlScrollBar.ControlSize(ControlSB:Boolean; AssumeSB:Boolean):Integer;
begin
{*
 00452A60    push        ebp
 00452A61    mov         ebp,esp
 00452A63    add         esp,0FFFFFFF4
 00452A66    push        ebx
 00452A67    mov         byte ptr [ebp-6],cl
 00452A6A    mov         byte ptr [ebp-5],dl
 00452A6D    mov         dword ptr [ebp-4],eax
 00452A70    push        0F0
 00452A72    mov         eax,dword ptr [ebp-4]
 00452A75    mov         eax,dword ptr [eax+4]
 00452A78    call        TWinControl.GetHandle
 00452A7D    push        eax
 00452A7E    call        user32.GetWindowLongA
 00452A83    test        eax,840000
 00452A88    setne       al
 00452A8B    and         eax,7F
 00452A8E    mov         dword ptr [ebp-0C],eax
 00452A91    mov         eax,dword ptr [ebp-4]
 00452A94    cmp         byte ptr [eax+18],1
>00452A98    jne         00452ABA
 00452A9A    push        ebp
 00452A9B    mov         dx,15
 00452A9F    xor         eax,eax
 00452AA1    call        Adjustment
 00452AA6    pop         ecx
 00452AA7    mov         ebx,eax
 00452AA9    mov         eax,dword ptr [ebp-4]
 00452AAC    mov         eax,dword ptr [eax+4]
 00452AAF    call        TControl.GetClientHeight
 00452AB4    add         ebx,eax
 00452AB6    mov         eax,ebx
>00452AB8    jmp         00452ADA
 00452ABA    push        ebp
 00452ABB    mov         dx,14
 00452ABF    mov         ax,1
 00452AC3    call        Adjustment
 00452AC8    pop         ecx
 00452AC9    mov         ebx,eax
 00452ACB    mov         eax,dword ptr [ebp-4]
 00452ACE    mov         eax,dword ptr [eax+4]
 00452AD1    call        TControl.GetClientWidth
 00452AD6    add         ebx,eax
 00452AD8    mov         eax,ebx
 00452ADA    pop         ebx
 00452ADB    mov         esp,ebp
 00452ADD    pop         ebp
 00452ADE    ret
*}
end;

//00452AE0
function TControlScrollBar.NeedsScrollBarVisible:Boolean;
begin
{*
 00452AE0    push        ebx
 00452AE1    mov         ebx,eax
 00452AE3    xor         ecx,ecx
 00452AE5    xor         edx,edx
 00452AE7    mov         eax,ebx
 00452AE9    call        TControlScrollBar.ControlSize
 00452AEE    cmp         eax,dword ptr [ebx+10]
 00452AF1    setl        al
 00452AF4    pop         ebx
 00452AF5    ret
*}
end;

//00452AF8
function GetRealScrollPosition:Integer;
begin
{*
 00452AF8    push        ebp
 00452AF9    mov         ebp,esp
 00452AFB    add         esp,0FFFFFFE4
 00452AFE    push        ebx
 00452AFF    push        esi
 00452B00    mov         dword ptr [ebp-1C],1C
 00452B07    mov         dword ptr [ebp-18],10
 00452B0E    xor         ebx,ebx
 00452B10    mov         eax,dword ptr [ebp+8]
 00452B13    mov         eax,dword ptr [eax-4]
 00452B16    cmp         byte ptr [eax+18],1
>00452B1A    jne         00452B21
 00452B1C    mov         ebx,1
 00452B21    mov         eax,dword ptr [ebp+8]
 00452B24    mov         esi,dword ptr [eax-8]
 00452B27    movsx       esi,word ptr [esi+6]
 00452B2B    lea         eax,[ebp-1C]
 00452B2E    push        eax
 00452B2F    push        ebx
 00452B30    mov         eax,dword ptr [ebp+8]
 00452B33    mov         eax,dword ptr [eax-4]
 00452B36    mov         eax,dword ptr [eax+4]
 00452B39    call        TWinControl.GetHandle
 00452B3E    push        eax
 00452B3F    mov         eax,[005AE16C];^FlatSB_GetScrollInfo:function(val hWnd:Windows.HWND;val BarFlag:System.I...
 00452B44    mov         eax,dword ptr [eax]
 00452B46    call        eax
 00452B48    test        eax,eax
>00452B4A    je          00452B4F
 00452B4C    mov         esi,dword ptr [ebp-4]
 00452B4F    mov         eax,esi
 00452B51    pop         esi
 00452B52    pop         ebx
 00452B53    mov         esp,ebp
 00452B55    pop         ebp
 00452B56    ret
*}
end;

//00452B58
procedure TControlScrollBar.ScrollMessage(var Msg:TWMScroll);
begin
{*
 00452B58    push        ebp
 00452B59    mov         ebp,esp
 00452B5B    add         esp,0FFFFFFF0
 00452B5E    push        ebx
 00452B5F    push        esi
 00452B60    push        edi
 00452B61    mov         dword ptr [ebp-8],edx
 00452B64    mov         dword ptr [ebp-4],eax
 00452B67    mov         eax,dword ptr [ebp-4]
 00452B6A    cmp         byte ptr [eax+1F],0
>00452B6E    je          00452D12
 00452B74    mov         eax,dword ptr [ebp-8]
 00452B77    mov         ax,word ptr [eax+4]
 00452B7B    sub         ax,4
>00452B7F    jae         00452D12
 00452B85    mov         eax,dword ptr [ebp-8]
 00452B88    mov         ax,word ptr [eax+4]
 00452B8C    sub         ax,2
>00452B90    jb          00452B9A
 00452B92    sub         ax,2
>00452B96    jb          00452BBB
>00452B98    jmp         00452BE1
 00452B9A    mov         eax,dword ptr [ebp-4]
 00452B9D    movzx       ebx,word ptr [eax+8]
 00452BA1    mov         eax,ebx
 00452BA3    mov         edx,dword ptr [ebp-4]
 00452BA6    mov         ecx,dword ptr [edx+40]
 00452BA9    cdq
 00452BAA    idiv        eax,ecx
 00452BAC    mov         dword ptr [ebp-0C],eax
 00452BAF    mov         eax,ebx
 00452BB1    cdq
 00452BB2    idiv        eax,ecx
 00452BB4    mov         dword ptr [ebp-10],edx
 00452BB7    mov         esi,ecx
>00452BB9    jmp         00452BED
 00452BBB    mov         eax,dword ptr [ebp-4]
 00452BBE    movzx       eax,word ptr [eax+0A]
 00452BC2    mov         dword ptr [ebp-0C],eax
 00452BC5    mov         eax,dword ptr [ebp-4]
 00452BC8    mov         ecx,dword ptr [eax+3C]
 00452BCB    mov         eax,dword ptr [ebp-0C]
 00452BCE    cdq
 00452BCF    idiv        eax,ecx
 00452BD1    mov         dword ptr [ebp-10],edx
 00452BD4    mov         eax,dword ptr [ebp-0C]
 00452BD7    cdq
 00452BD8    idiv        eax,ecx
 00452BDA    mov         dword ptr [ebp-0C],eax
 00452BDD    mov         esi,ecx
>00452BDF    jmp         00452BED
 00452BE1    xor         esi,esi
 00452BE3    xor         eax,eax
 00452BE5    mov         dword ptr [ebp-0C],eax
 00452BE8    xor         eax,eax
 00452BEA    mov         dword ptr [ebp-10],eax
 00452BED    xor         edi,edi
 00452BEF    test        esi,esi
>00452BF1    jle         00452C92
 00452BF7    call        GetCurrentTime
 00452BFC    mov         ebx,eax
 00452BFE    mov         eax,ebx
 00452C00    sub         eax,edi
 00452C02    mov         edx,dword ptr [ebp-4]
 00452C05    mov         edx,dword ptr [edx+20]
 00452C08    cmp         eax,edx
>00452C0A    jge         00452C14
 00452C0C    sub         edx,eax
 00452C0E    push        edx
 00452C0F    call        KERNEL32.Sleep
 00452C14    mov         edi,ebx
 00452C16    mov         eax,dword ptr [ebp-8]
 00452C19    mov         ax,word ptr [eax+4]
 00452C1D    sub         ax,1
>00452C21    jb          00452C31
>00452C23    je          00452C44
 00452C25    dec         ax
>00452C28    je          00452C57
 00452C2A    dec         ax
>00452C2D    je          00452C6A
>00452C2F    jmp         00452C7B
 00452C31    mov         eax,dword ptr [ebp-4]
 00452C34    mov         edx,dword ptr [eax+0C]
 00452C37    sub         edx,dword ptr [ebp-0C]
 00452C3A    mov         eax,dword ptr [ebp-4]
 00452C3D    call        TControlScrollBar.SetPosition
>00452C42    jmp         00452C7B
 00452C44    mov         eax,dword ptr [ebp-4]
 00452C47    mov         edx,dword ptr [eax+0C]
 00452C4A    add         edx,dword ptr [ebp-0C]
 00452C4D    mov         eax,dword ptr [ebp-4]
 00452C50    call        TControlScrollBar.SetPosition
>00452C55    jmp         00452C7B
 00452C57    mov         eax,dword ptr [ebp-4]
 00452C5A    mov         edx,dword ptr [eax+0C]
 00452C5D    sub         edx,dword ptr [ebp-0C]
 00452C60    mov         eax,dword ptr [ebp-4]
 00452C63    call        TControlScrollBar.SetPosition
>00452C68    jmp         00452C7B
 00452C6A    mov         eax,dword ptr [ebp-4]
 00452C6D    mov         edx,dword ptr [eax+0C]
 00452C70    add         edx,dword ptr [ebp-0C]
 00452C73    mov         eax,dword ptr [ebp-4]
 00452C76    call        TControlScrollBar.SetPosition
 00452C7B    mov         eax,dword ptr [ebp-4]
 00452C7E    mov         eax,dword ptr [eax+4]
 00452C81    mov         edx,dword ptr [eax]
 00452C83    call        dword ptr [edx+88]
 00452C89    dec         esi
 00452C8A    test        esi,esi
>00452C8C    jg          00452BF7
 00452C92    cmp         dword ptr [ebp-10],0
>00452C96    jle         00452E46
 00452C9C    mov         eax,dword ptr [ebp-8]
 00452C9F    mov         ax,word ptr [eax+4]
 00452CA3    sub         ax,1
>00452CA7    jb          00452CBA
>00452CA9    je          00452CD0
 00452CAB    dec         ax
>00452CAE    je          00452CE6
 00452CB0    dec         ax
>00452CB3    je          00452CFC
>00452CB5    jmp         00452E46
 00452CBA    mov         eax,dword ptr [ebp-4]
 00452CBD    mov         edx,dword ptr [eax+0C]
 00452CC0    sub         edx,dword ptr [ebp-10]
 00452CC3    mov         eax,dword ptr [ebp-4]
 00452CC6    call        TControlScrollBar.SetPosition
>00452CCB    jmp         00452E46
 00452CD0    mov         eax,dword ptr [ebp-4]
 00452CD3    mov         edx,dword ptr [eax+0C]
 00452CD6    add         edx,dword ptr [ebp-10]
 00452CD9    mov         eax,dword ptr [ebp-4]
 00452CDC    call        TControlScrollBar.SetPosition
>00452CE1    jmp         00452E46
 00452CE6    mov         eax,dword ptr [ebp-4]
 00452CE9    mov         edx,dword ptr [eax+0C]
 00452CEC    sub         edx,dword ptr [ebp-10]
 00452CEF    mov         eax,dword ptr [ebp-4]
 00452CF2    call        TControlScrollBar.SetPosition
>00452CF7    jmp         00452E46
 00452CFC    mov         eax,dword ptr [ebp-4]
 00452CFF    mov         edx,dword ptr [eax+0C]
 00452D02    add         edx,dword ptr [ebp-10]
 00452D05    mov         eax,dword ptr [ebp-4]
 00452D08    call        TControlScrollBar.SetPosition
>00452D0D    jmp         00452E46
 00452D12    mov         eax,dword ptr [ebp-8]
 00452D15    movsx       eax,word ptr [eax+4]
 00452D19    cmp         eax,7
>00452D1C    ja          00452E46
 00452D22    jmp         dword ptr [eax*4+452D29]
 00452D22    dd          00452D49
 00452D22    dd          00452D65
 00452D22    dd          00452D81
 00452D22    dd          00452DA2
 00452D22    dd          00452DC3
 00452D22    dd          00452DF3
 00452D22    dd          00452E2C
 00452D22    dd          00452E38
 00452D49    mov         eax,dword ptr [ebp-4]
 00452D4C    mov         edx,dword ptr [eax+0C]
 00452D4F    mov         eax,dword ptr [ebp-4]
 00452D52    movzx       eax,word ptr [eax+8]
 00452D56    sub         edx,eax
 00452D58    mov         eax,dword ptr [ebp-4]
 00452D5B    call        TControlScrollBar.SetPosition
>00452D60    jmp         00452E46
 00452D65    mov         eax,dword ptr [ebp-4]
 00452D68    mov         edx,dword ptr [eax+0C]
 00452D6B    mov         eax,dword ptr [ebp-4]
 00452D6E    movzx       eax,word ptr [eax+8]
 00452D72    add         edx,eax
 00452D74    mov         eax,dword ptr [ebp-4]
 00452D77    call        TControlScrollBar.SetPosition
>00452D7C    jmp         00452E46
 00452D81    xor         ecx,ecx
 00452D83    mov         dl,1
 00452D85    mov         eax,dword ptr [ebp-4]
 00452D88    call        TControlScrollBar.ControlSize
 00452D8D    mov         edx,dword ptr [ebp-4]
 00452D90    mov         edx,dword ptr [edx+0C]
 00452D93    sub         edx,eax
 00452D95    mov         eax,dword ptr [ebp-4]
 00452D98    call        TControlScrollBar.SetPosition
>00452D9D    jmp         00452E46
 00452DA2    xor         ecx,ecx
 00452DA4    mov         dl,1
 00452DA6    mov         eax,dword ptr [ebp-4]
 00452DA9    call        TControlScrollBar.ControlSize
 00452DAE    mov         edx,eax
 00452DB0    mov         eax,dword ptr [ebp-4]
 00452DB3    add         edx,dword ptr [eax+0C]
 00452DB6    mov         eax,dword ptr [ebp-4]
 00452DB9    call        TControlScrollBar.SetPosition
>00452DBE    jmp         00452E46
 00452DC3    mov         eax,dword ptr [ebp-4]
 00452DC6    cmp         dword ptr [eax+14],7FFF
>00452DCD    jle         00452DE2
 00452DCF    push        ebp
 00452DD0    call        GetRealScrollPosition
 00452DD5    pop         ecx
 00452DD6    mov         edx,eax
 00452DD8    mov         eax,dword ptr [ebp-4]
 00452DDB    call        TControlScrollBar.SetPosition
>00452DE0    jmp         00452E46
 00452DE2    mov         edx,dword ptr [ebp-8]
 00452DE5    movsx       edx,word ptr [edx+6]
 00452DE9    mov         eax,dword ptr [ebp-4]
 00452DEC    call        TControlScrollBar.SetPosition
>00452DF1    jmp         00452E46
 00452DF3    mov         eax,dword ptr [ebp-4]
 00452DF6    cmp         byte ptr [eax+1D],0
>00452DFA    je          00452E46
 00452DFC    mov         eax,dword ptr [ebp-4]
 00452DFF    cmp         dword ptr [eax+14],7FFF
>00452E06    jle         00452E1B
 00452E08    push        ebp
 00452E09    call        GetRealScrollPosition
 00452E0E    pop         ecx
 00452E0F    mov         edx,eax
 00452E11    mov         eax,dword ptr [ebp-4]
 00452E14    call        TControlScrollBar.SetPosition
>00452E19    jmp         00452E46
 00452E1B    mov         edx,dword ptr [ebp-8]
 00452E1E    movsx       edx,word ptr [edx+6]
 00452E22    mov         eax,dword ptr [ebp-4]
 00452E25    call        TControlScrollBar.SetPosition
>00452E2A    jmp         00452E46
 00452E2C    xor         edx,edx
 00452E2E    mov         eax,dword ptr [ebp-4]
 00452E31    call        TControlScrollBar.SetPosition
>00452E36    jmp         00452E46
 00452E38    mov         eax,dword ptr [ebp-4]
 00452E3B    mov         edx,dword ptr [eax+14]
 00452E3E    mov         eax,dword ptr [ebp-4]
 00452E41    call        TControlScrollBar.SetPosition
 00452E46    pop         edi
 00452E47    pop         esi
 00452E48    pop         ebx
 00452E49    mov         esp,ebp
 00452E4B    pop         ebp
 00452E4C    ret
*}
end;

//00452E50
procedure TControlScrollBar.SetButtonSize(Value:Integer);
begin
{*
 00452E50    push        ebx
 00452E51    push        esi
 00452E52    mov         ebx,eax
 00452E54    cmp         edx,dword ptr [ebx+24]
>00452E57    je          00452E8F
 00452E59    mov         esi,edx
 00452E5B    test        esi,esi
>00452E5D    jne         00452E77
 00452E5F    xor         eax,eax
 00452E61    mov         al,byte ptr [ebx+18]
 00452E64    mov         eax,dword ptr [eax*4+5ACDCC]
 00452E6B    push        eax
 00452E6C    mov         eax,[005AE32C]
 00452E71    mov         eax,dword ptr [eax]
 00452E73    call        eax
 00452E75    mov         edx,eax
 00452E77    mov         dword ptr [ebx+24],edx
 00452E7A    mov         byte ptr [ebx+44],1
 00452E7E    mov         eax,dword ptr [ebx+4]
 00452E81    call        TScrollingWinControl.UpdateScrollBars
 00452E86    test        esi,esi
>00452E88    jne         00452E8F
 00452E8A    xor         eax,eax
 00452E8C    mov         dword ptr [ebx+24],eax
 00452E8F    pop         esi
 00452E90    pop         ebx
 00452E91    ret
*}
end;

//00452E94
procedure TControlScrollBar.SetColor(Value:TColor);
begin
{*
 00452E94    cmp         edx,dword ptr [eax+28]
>00452E97    je          00452EAC
 00452E99    mov         dword ptr [eax+28],edx
 00452E9C    mov         byte ptr [eax+2C],0
 00452EA0    mov         byte ptr [eax+44],1
 00452EA4    mov         eax,dword ptr [eax+4]
 00452EA7    call        TScrollingWinControl.UpdateScrollBars
 00452EAC    ret
*}
end;

//00452EB0
procedure TControlScrollBar.SetParentColor(Value:Boolean);
begin
{*
 00452EB0    cmp         dl,byte ptr [eax+2C]
>00452EB3    je          00452EC6
 00452EB5    mov         byte ptr [eax+2C],dl
 00452EB8    test        dl,dl
>00452EBA    je          00452EC6
 00452EBC    mov         edx,0FF000014
 00452EC1    call        TControlScrollBar.SetColor
 00452EC6    ret
*}
end;

//00452EC8
procedure TControlScrollBar.SetPosition(Value:Integer);
begin
{*
 00452EC8    push        ebx
 00452EC9    push        esi
 00452ECA    push        edi
 00452ECB    mov         ebx,eax
 00452ECD    mov         eax,dword ptr [ebx+4]
 00452ED0    test        byte ptr [eax+1C],2
>00452ED4    je          00452EDE
 00452ED6    mov         dword ptr [ebx+0C],edx
>00452ED9    jmp         00452F85
 00452EDE    mov         eax,dword ptr [ebx+14]
 00452EE1    cmp         edx,eax
>00452EE3    jle         00452EE9
 00452EE5    mov         edx,eax
>00452EE7    jmp         00452EEF
 00452EE9    test        edx,edx
>00452EEB    jge         00452EEF
 00452EED    xor         edx,edx
 00452EEF    cmp         byte ptr [ebx+18],0
>00452EF3    jne         00452EF9
 00452EF5    xor         esi,esi
>00452EF7    jmp         00452EFD
 00452EF9    mov         si,1
 00452EFD    mov         eax,dword ptr [ebx+0C]
 00452F00    cmp         edx,eax
>00452F02    je          00452F51
 00452F04    mov         dword ptr [ebx+0C],edx
 00452F07    cmp         byte ptr [ebx+18],0
>00452F0B    jne         00452F1D
 00452F0D    sub         eax,edx
 00452F0F    mov         edx,eax
 00452F11    xor         ecx,ecx
 00452F13    mov         eax,dword ptr [ebx+4]
 00452F16    call        TWinControl.ScrollBy
>00452F1B    jmp         00452F2B
 00452F1D    mov         ecx,eax
 00452F1F    sub         ecx,edx
 00452F21    mov         eax,dword ptr [ebx+4]
 00452F24    xor         edx,edx
 00452F26    call        TWinControl.ScrollBy
 00452F2B    mov         eax,dword ptr [ebx+4]
 00452F2E    test        byte ptr [eax+1C],10
>00452F32    je          00452F51
 00452F34    call        GetParentForm
 00452F39    test        eax,eax
>00452F3B    je          00452F51
 00452F3D    cmp         dword ptr [eax+250],0
>00452F44    je          00452F51
 00452F46    mov         eax,dword ptr [eax+250]
 00452F4C    mov         edx,dword ptr [eax]
 00452F4E    call        dword ptr [edx+0C]
 00452F51    movzx       edi,si
 00452F54    push        edi
 00452F55    mov         eax,dword ptr [ebx+4]
 00452F58    call        TWinControl.GetHandle
 00452F5D    push        eax
 00452F5E    mov         eax,[005AE3DC];^FlatSB_GetScrollPos:function(val hWnd:Windows.HWND;val nBar:System.Integ...
 00452F63    mov         eax,dword ptr [eax]
 00452F65    call        eax
 00452F67    cmp         eax,dword ptr [ebx+0C]
>00452F6A    je          00452F85
 00452F6C    push        0FF
 00452F6E    mov         eax,dword ptr [ebx+0C]
 00452F71    push        eax
 00452F72    push        edi
 00452F73    mov         eax,dword ptr [ebx+4]
 00452F76    call        TWinControl.GetHandle
 00452F7B    push        eax
 00452F7C    mov         eax,[005AE7BC];^FlatSB_SetScrollPos:function(val hWnd:Windows.HWND;val nBar:System.Integ...
 00452F81    mov         eax,dword ptr [eax]
 00452F83    call        eax
 00452F85    pop         edi
 00452F86    pop         esi
 00452F87    pop         ebx
 00452F88    ret
*}
end;

//00452F8C
procedure TControlScrollBar.SetSize(Value:Integer);
begin
{*
 00452F8C    push        ebx
 00452F8D    push        esi
 00452F8E    mov         ebx,eax
 00452F90    cmp         edx,dword ptr [ebx+30]
>00452F93    je          00452FCB
 00452F95    mov         esi,edx
 00452F97    test        esi,esi
>00452F99    jne         00452FB3
 00452F9B    xor         eax,eax
 00452F9D    mov         al,byte ptr [ebx+18]
 00452FA0    mov         eax,dword ptr [eax*4+5ACDD4]
 00452FA7    push        eax
 00452FA8    mov         eax,[005AE32C]
 00452FAD    mov         eax,dword ptr [eax]
 00452FAF    call        eax
 00452FB1    mov         edx,eax
 00452FB3    mov         dword ptr [ebx+30],edx
 00452FB6    mov         byte ptr [ebx+44],1
 00452FBA    mov         eax,dword ptr [ebx+4]
 00452FBD    call        TScrollingWinControl.UpdateScrollBars
 00452FC2    test        esi,esi
>00452FC4    jne         00452FCB
 00452FC6    xor         eax,eax
 00452FC8    mov         dword ptr [ebx+30],eax
 00452FCB    pop         esi
 00452FCC    pop         ebx
 00452FCD    ret
*}
end;

//00452FD0
procedure TControlScrollBar.SetStyle(Value:TScrollBarStyle);
begin
{*
 00452FD0    cmp         dl,byte ptr [eax+34]
>00452FD3    je          00452FE4
 00452FD5    mov         byte ptr [eax+34],dl
 00452FD8    mov         byte ptr [eax+44],1
 00452FDC    mov         eax,dword ptr [eax+4]
 00452FDF    call        TScrollingWinControl.UpdateScrollBars
 00452FE4    ret
*}
end;

//00452FE8
procedure TControlScrollBar.SetThumbSize(Value:Integer);
begin
{*
 00452FE8    cmp         edx,dword ptr [eax+38]
>00452FEB    je          00452FFC
 00452FED    mov         dword ptr [eax+38],edx
 00452FF0    mov         byte ptr [eax+44],1
 00452FF4    mov         eax,dword ptr [eax+4]
 00452FF7    call        TScrollingWinControl.UpdateScrollBars
 00452FFC    ret
*}
end;

//00453000
procedure TControlScrollBar.DoSetRange(Value:Integer);
begin
{*
 00453000    mov         ecx,edx
 00453002    mov         dword ptr [eax+10],ecx
 00453005    test        ecx,ecx
>00453007    jge         0045300E
 00453009    xor         edx,edx
 0045300B    mov         dword ptr [eax+10],edx
 0045300E    mov         eax,dword ptr [eax+4]
 00453011    call        TScrollingWinControl.UpdateScrollBars
 00453016    ret
*}
end;

//00453018
procedure TControlScrollBar.SetRange(Value:Integer);
begin
{*
 00453018    mov         ecx,dword ptr [eax+4]
 0045301B    mov         byte ptr [ecx+210],0
 00453022    mov         byte ptr [eax+1E],1
 00453026    call        TControlScrollBar.DoSetRange
 0045302B    ret
*}
end;

//0045302C
function TControlScrollBar.IsRangeStored(Value:Integer):Boolean;
begin
{*
 0045302C    mov         eax,dword ptr [eax+4]
 0045302F    mov         al,byte ptr [eax+210]
 00453035    xor         al,1
 00453037    ret
*}
end;

//00453038
procedure TControlScrollBar.SetVisible(Value:Boolean);
begin
{*
 00453038    mov         byte ptr [eax+1C],dl
 0045303B    mov         eax,dword ptr [eax+4]
 0045303E    call        TScrollingWinControl.UpdateScrollBars
 00453043    ret
*}
end;

//00453044
procedure UpdateScrollProperties(Redraw:Boolean);
begin
{*
 00453044    push        ebp
 00453045    mov         ebp,esp
 00453047    push        ebx
 00453048    push        esi
 00453049    mov         ebx,eax
 0045304B    mov         esi,dword ptr [ebp+8]
 0045304E    add         esi,0FFFFFFFC
 00453051    cmp         bl,1
 00453054    cmc
 00453055    sbb         eax,eax
 00453057    push        eax
 00453058    mov         eax,dword ptr [esi]
 0045305A    movzx       eax,byte ptr [eax+34]
 0045305E    mov         eax,dword ptr [eax*4+5ACE04]
 00453065    push        eax
 00453066    mov         eax,dword ptr [esi]
 00453068    movzx       eax,byte ptr [eax+18]
 0045306C    lea         eax,[eax+eax*4]
 0045306F    mov         eax,dword ptr [eax*4+5ACDDC]
 00453076    push        eax
 00453077    mov         eax,dword ptr [esi]
 00453079    mov         eax,dword ptr [eax+4]
 0045307C    call        TWinControl.GetHandle
 00453081    push        eax
 00453082    call        FlatSB_SetScrollProp
 00453087    mov         eax,dword ptr [esi]
 00453089    cmp         dword ptr [eax+24],0
>0045308D    jle         004530B8
 0045308F    push        0
 00453091    mov         eax,dword ptr [esi]
 00453093    mov         eax,dword ptr [eax+24]
 00453096    push        eax
 00453097    mov         eax,dword ptr [esi]
 00453099    movzx       eax,byte ptr [eax+18]
 0045309D    lea         eax,[eax+eax*4]
 004530A0    mov         eax,dword ptr [eax*4+5ACDE0]
 004530A7    push        eax
 004530A8    mov         eax,dword ptr [esi]
 004530AA    mov         eax,dword ptr [eax+4]
 004530AD    call        TWinControl.GetHandle
 004530B2    push        eax
 004530B3    call        FlatSB_SetScrollProp
 004530B8    mov         eax,dword ptr [esi]
 004530BA    cmp         dword ptr [eax+38],0
>004530BE    jle         004530E9
 004530C0    push        0
 004530C2    mov         eax,dword ptr [esi]
 004530C4    mov         eax,dword ptr [eax+38]
 004530C7    push        eax
 004530C8    mov         eax,dword ptr [esi]
 004530CA    movzx       eax,byte ptr [eax+18]
 004530CE    lea         eax,[eax+eax*4]
 004530D1    mov         eax,dword ptr [eax*4+5ACDE4]
 004530D8    push        eax
 004530D9    mov         eax,dword ptr [esi]
 004530DB    mov         eax,dword ptr [eax+4]
 004530DE    call        TWinControl.GetHandle
 004530E3    push        eax
 004530E4    call        FlatSB_SetScrollProp
 004530E9    mov         eax,dword ptr [esi]
 004530EB    cmp         dword ptr [eax+30],0
>004530EF    jle         0045311A
 004530F1    push        0
 004530F3    mov         eax,dword ptr [esi]
 004530F5    mov         eax,dword ptr [eax+30]
 004530F8    push        eax
 004530F9    mov         eax,dword ptr [esi]
 004530FB    movzx       eax,byte ptr [eax+18]
 004530FF    lea         eax,[eax+eax*4]
 00453102    mov         eax,dword ptr [eax*4+5ACDE8]
 00453109    push        eax
 0045310A    mov         eax,dword ptr [esi]
 0045310C    mov         eax,dword ptr [eax+4]
 0045310F    call        TWinControl.GetHandle
 00453114    push        eax
 00453115    call        FlatSB_SetScrollProp
 0045311A    push        0
 0045311C    mov         eax,dword ptr [esi]
 0045311E    mov         eax,dword ptr [eax+28]
 00453121    call        ColorToRGB
 00453126    push        eax
 00453127    mov         eax,dword ptr [esi]
 00453129    movzx       eax,byte ptr [eax+18]
 0045312D    lea         eax,[eax+eax*4]
 00453130    mov         eax,dword ptr [eax*4+5ACDEC]
 00453137    push        eax
 00453138    mov         eax,dword ptr [esi]
 0045313A    mov         eax,dword ptr [eax+4]
 0045313D    call        TWinControl.GetHandle
 00453142    push        eax
 00453143    call        FlatSB_SetScrollProp
 00453148    pop         esi
 00453149    pop         ebx
 0045314A    pop         ebp
 0045314B    ret
*}
end;

//0045314C
procedure TControlScrollBar.Update(ControlSB:Boolean; AssumeSB:Boolean);
begin
{*
 0045314C    push        ebp
 0045314D    mov         ebp,esp
 0045314F    add         esp,0FFFFFFDC
 00453152    push        ebx
 00453153    push        esi
 00453154    push        edi
 00453155    mov         byte ptr [ebp-6],cl
 00453158    mov         byte ptr [ebp-5],dl
 0045315B    mov         dword ptr [ebp-4],eax
 0045315E    lea         esi,[ebp-4]
 00453161    mov         eax,dword ptr [esi]
 00453163    xor         edx,edx
 00453165    mov         dword ptr [eax+14],edx
 00453168    xor         ebx,ebx
 0045316A    mov         eax,dword ptr [esi]
 0045316C    cmp         byte ptr [eax+18],1
>00453170    jne         00453176
 00453172    mov         bx,1
 00453176    mov         eax,dword ptr [esi]
 00453178    cmp         byte ptr [eax+1C],0
>0045317C    je          004531A2
 0045317E    mov         cl,byte ptr [ebp-6]
 00453181    mov         dl,byte ptr [ebp-5]
 00453184    mov         eax,dword ptr [esi]
 00453186    call        TControlScrollBar.ControlSize
 0045318B    mov         edx,dword ptr [esi]
 0045318D    mov         edi,dword ptr [edx+10]
 00453190    sub         edi,eax
 00453192    mov         eax,dword ptr [esi]
 00453194    mov         dword ptr [eax+14],edi
 00453197    test        edi,edi
>00453199    jge         004531A2
 0045319B    mov         eax,dword ptr [esi]
 0045319D    xor         edx,edx
 0045319F    mov         dword ptr [eax+14],edx
 004531A2    mov         dword ptr [ebp-22],1C
 004531A9    mov         dword ptr [ebp-1E],17
 004531B0    xor         eax,eax
 004531B2    mov         dword ptr [ebp-1A],eax
 004531B5    mov         eax,dword ptr [esi]
 004531B7    cmp         dword ptr [eax+14],0
>004531BB    jle         004531C7
 004531BD    mov         eax,dword ptr [esi]
 004531BF    mov         eax,dword ptr [eax+10]
 004531C2    mov         dword ptr [ebp-16],eax
>004531C5    jmp         004531CC
 004531C7    xor         eax,eax
 004531C9    mov         dword ptr [ebp-16],eax
 004531CC    mov         cl,byte ptr [ebp-6]
 004531CF    mov         dl,byte ptr [ebp-5]
 004531D2    mov         eax,dword ptr [esi]
 004531D4    call        TControlScrollBar.ControlSize
 004531D9    inc         eax
 004531DA    mov         dword ptr [ebp-12],eax
 004531DD    mov         eax,dword ptr [esi]
 004531DF    mov         eax,dword ptr [eax+0C]
 004531E2    mov         dword ptr [ebp-0E],eax
 004531E5    mov         dword ptr [ebp-0A],eax
 004531E8    push        ebp
 004531E9    mov         eax,dword ptr [esi]
 004531EB    mov         al,byte ptr [eax+44]
 004531EE    call        UpdateScrollProperties
 004531F3    pop         ecx
 004531F4    mov         eax,dword ptr [esi]
 004531F6    mov         byte ptr [eax+44],0
 004531FA    push        0FF
 004531FC    lea         eax,[ebp-22]
 004531FF    push        eax
 00453200    movzx       eax,bx
 00453203    push        eax
 00453204    mov         eax,dword ptr [esi]
 00453206    mov         eax,dword ptr [eax+4]
 00453209    call        TWinControl.GetHandle
 0045320E    push        eax
 0045320F    mov         eax,[005AE554];^FlatSB_SetScrollInfo:function(val hWnd:Windows.HWND;val BarFlag:System.I...
 00453214    mov         eax,dword ptr [eax]
 00453216    call        eax
 00453218    mov         eax,dword ptr [esi]
 0045321A    mov         edx,dword ptr [eax+0C]
 0045321D    mov         eax,dword ptr [esi]
 0045321F    call        TControlScrollBar.SetPosition
 00453224    xor         ecx,ecx
 00453226    mov         dl,1
 00453228    mov         eax,dword ptr [esi]
 0045322A    call        TControlScrollBar.ControlSize
 0045322F    lea         eax,[eax+eax*8]
 00453232    mov         ecx,0A
 00453237    cdq
 00453238    idiv        eax,ecx
 0045323A    mov         ebx,eax
 0045323C    mov         eax,dword ptr [esi]
 0045323E    mov         word ptr [eax+0A],bx
 00453242    mov         eax,dword ptr [esi]
 00453244    cmp         byte ptr [eax+1F],0
>00453248    je          0045325C
 0045324A    movzx       eax,bx
 0045324D    mov         ecx,0A
 00453252    xor         edx,edx
 00453254    div         eax,ecx
 00453256    mov         edx,dword ptr [esi]
 00453258    mov         word ptr [edx+8],ax
 0045325C    pop         edi
 0045325D    pop         esi
 0045325E    pop         ebx
 0045325F    mov         esp,ebp
 00453261    pop         ebp
 00453262    ret
*}
end;

//00453264
constructor TScrollingWinControl.Create(AOwner:TComponent);
begin
{*
 00453264    push        ebx
 00453265    push        esi
 00453266    test        dl,dl
>00453268    je          00453272
 0045326A    add         esp,0FFFFFFF0
 0045326D    call        @ClassCreate
 00453272    mov         ebx,edx
 00453274    mov         esi,eax
 00453276    xor         edx,edx
 00453278    mov         eax,esi
 0045327A    call        TWinControl.Create
 0045327F    mov         eax,dword ptr [esi+50]
 00453282    or          eax,dword ptr ds:[4532D8]
 00453288    mov         dword ptr [esi+50],eax
 0045328B    push        0
 0045328D    mov         ecx,esi
 0045328F    mov         dl,1
 00453291    mov         eax,[00450464];TControlScrollBar
 00453296    call        TControlScrollBar.Create
 0045329B    mov         dword ptr [esi+208],eax
 004532A1    push        1
 004532A3    mov         ecx,esi
 004532A5    mov         dl,1
 004532A7    mov         eax,[00450464];TControlScrollBar
 004532AC    call        TControlScrollBar.Create
 004532B1    mov         dword ptr [esi+20C],eax
 004532B7    mov         byte ptr [esi+210],1
 004532BE    mov         eax,esi
 004532C0    test        bl,bl
>004532C2    je          004532D3
 004532C4    call        @AfterConstruction
 004532C9    pop         dword ptr fs:[0]
 004532D0    add         esp,0C
 004532D3    mov         eax,esi
 004532D5    pop         esi
 004532D6    pop         ebx
 004532D7    ret
*}
end;

//004532DC
destructor TScrollingWinControl.Destroy;
begin
{*
 004532DC    push        ebx
 004532DD    push        esi
 004532DE    call        @BeforeDestruction
 004532E3    mov         ebx,edx
 004532E5    mov         esi,eax
 004532E7    mov         eax,dword ptr [esi+208]
 004532ED    call        TObject.Free
 004532F2    mov         eax,dword ptr [esi+20C]
 004532F8    call        TObject.Free
 004532FD    mov         edx,ebx
 004532FF    and         dl,0FC
 00453302    mov         eax,esi
 00453304    call        TWinControl.Destroy
 00453309    test        bl,bl
>0045330B    jle         00453314
 0045330D    mov         eax,esi
 0045330F    call        @ClassDestroy
 00453314    pop         esi
 00453315    pop         ebx
 00453316    ret
*}
end;

//00453318
procedure TScrollingWinControl.CreateParams(var Params:TCreateParams);
begin
{*
 00453318    push        ebx
 00453319    mov         ebx,edx
 0045331B    mov         edx,ebx
 0045331D    call        TWinControl.CreateParams
 00453322    and         dword ptr [ebx+24],0FFFFFFFC
 00453326    pop         ebx
 00453327    ret
*}
end;

//00453328
procedure TScrollingWinControl.CreateWnd;
begin
{*
 00453328    push        ebx
 00453329    mov         ebx,eax
 0045332B    mov         eax,ebx
 0045332D    call        TWinControl.CreateWnd
 00453332    mov         eax,[005AE810];^SysLocale:TSysLocale
 00453337    cmp         byte ptr [eax+0D],0
>0045333B    jne         0045335D
 0045333D    mov         edx,1
 00453342    mov         eax,5
 00453347    call        CheckWin32Version
 0045334C    test        al,al
>0045334E    jne         0045335D
 00453350    mov         eax,ebx
 00453352    call        TWinControl.GetHandle
 00453357    push        eax
 00453358    call        InitializeFlatSB
 0045335D    mov         eax,ebx
 0045335F    call        TScrollingWinControl.UpdateScrollBars
 00453364    pop         ebx
 00453365    ret
*}
end;

//00453368
procedure TScrollingWinControl.AlignControls(AControl:TControl; var ARect:TRect);
begin
{*
 00453368    push        ebx
 00453369    push        esi
 0045336A    push        edi
 0045336B    mov         edi,ecx
 0045336D    mov         esi,edx
 0045336F    mov         ebx,eax
 00453371    mov         eax,ebx
 00453373    call        TScrollingWinControl.CalcAutoRange
 00453378    mov         ecx,edi
 0045337A    mov         edx,esi
 0045337C    mov         eax,ebx
 0045337E    call        TWinControl.AlignControls
 00453383    pop         edi
 00453384    pop         esi
 00453385    pop         ebx
 00453386    ret
*}
end;

//00453388
function TScrollingWinControl.AutoScrollEnabled:Boolean;
begin
{*
 00453388    cmp         byte ptr [eax+5C],0
>0045338C    jne         004533A0
 0045338E    cmp         byte ptr [eax+1A8],0
>00453395    je          004533A3
 00453397    cmp         byte ptr [eax+1A7],0
>0045339E    je          004533A3
 004533A0    xor         eax,eax
 004533A2    ret
 004533A3    mov         al,1
 004533A5    ret
*}
end;

//004533A8
procedure TScrollingWinControl.DoFlipChildren;
begin
{*
 004533A8    push        ebp
 004533A9    mov         ebp,esp
 004533AB    add         esp,0FFFFFFF0
 004533AE    push        ebx
 004533AF    push        esi
 004533B0    push        edi
 004533B1    mov         dword ptr [ebp-4],eax
 004533B4    mov         dl,1
 004533B6    mov         eax,[00417CEC];TList
 004533BB    call        TObject.Create
 004533C0    mov         dword ptr [ebp-10],eax
 004533C3    xor         eax,eax
 004533C5    push        ebp
 004533C6    push        4534B0
 004533CB    push        dword ptr fs:[eax]
 004533CE    mov         dword ptr fs:[eax],esp
 004533D1    mov         eax,dword ptr [ebp-4]
 004533D4    call        TControl.GetClientWidth
 004533D9    mov         dword ptr [ebp-8],eax
 004533DC    mov         eax,dword ptr [ebp-4]
 004533DF    mov         ebx,dword ptr [eax+208]
 004533E5    mov         eax,ebx
 004533E7    call        TControlScrollBar.IsScrollBarVisible
 004533EC    test        al,al
>004533EE    je          004533F8
 004533F0    mov         eax,dword ptr [ebx+10]
 004533F3    cmp         eax,dword ptr [ebp-8]
>004533F6    jg          004533FC
 004533F8    xor         eax,eax
>004533FA    jmp         004533FE
 004533FC    mov         al,1
 004533FE    mov         byte ptr [ebp-9],al
 00453401    cmp         byte ptr [ebp-9],0
>00453405    je          00453416
 00453407    mov         eax,dword ptr [ebx+10]
 0045340A    mov         dword ptr [ebp-8],eax
 0045340D    xor         edx,edx
 0045340F    mov         eax,ebx
 00453411    call        TControlScrollBar.SetPosition
 00453416    mov         eax,dword ptr [ebp-4]
 00453419    call        TWinControl.GetControlCount
 0045341E    mov         esi,eax
 00453420    dec         esi
 00453421    test        esi,esi
>00453423    jl          0045345C
 00453425    inc         esi
 00453426    xor         ebx,ebx
 00453428    mov         edx,ebx
 0045342A    mov         eax,dword ptr [ebp-4]
 0045342D    call        TWinControl.GetControl
 00453432    mov         edi,eax
 00453434    mov         edx,ebx
 00453436    mov         eax,dword ptr [ebp-4]
 00453439    call        TWinControl.GetControl
 0045343E    mov         edx,eax
 00453440    mov         eax,dword ptr [ebp-10]
 00453443    call        TList.Add
 00453448    mov         edx,dword ptr [ebp-8]
 0045344B    sub         edx,dword ptr [edi+48]
 0045344E    sub         edx,dword ptr [edi+40]
 00453451    mov         eax,edi
 00453453    call        TControl.SetLeft
 00453458    inc         ebx
 00453459    dec         esi
>0045345A    jne         00453428
 0045345C    mov         eax,dword ptr [ebp-10]
 0045345F    mov         esi,dword ptr [eax+8]
 00453462    dec         esi
 00453463    test        esi,esi
>00453465    jl          00453486
 00453467    inc         esi
 00453468    xor         ebx,ebx
 0045346A    push        0
 0045346C    mov         edx,ebx
 0045346E    mov         eax,dword ptr [ebp-10]
 00453471    call        TList.Get
 00453476    xor         ecx,ecx
 00453478    mov         edx,0B03E
 0045347D    call        TControl.Perform
 00453482    inc         ebx
 00453483    dec         esi
>00453484    jne         0045346A
 00453486    cmp         byte ptr [ebp-9],0
>0045348A    je          0045349A
 0045348C    mov         eax,dword ptr [ebp-4]
 0045348F    mov         eax,dword ptr [eax+208]
 00453495    call        TControlScrollBar.ChangeBiDiPosition
 0045349A    xor         eax,eax
 0045349C    pop         edx
 0045349D    pop         ecx
 0045349E    pop         ecx
 0045349F    mov         dword ptr fs:[eax],edx
 004534A2    push        4534B7
 004534A7    mov         eax,dword ptr [ebp-10]
 004534AA    call        TObject.Free
 004534AF    ret
>004534B0    jmp         @HandleFinally
>004534B5    jmp         004534A7
 004534B7    pop         edi
 004534B8    pop         esi
 004534B9    pop         ebx
 004534BA    mov         esp,ebp
 004534BC    pop         ebp
 004534BD    ret
*}
end;

//004534C0
procedure TScrollingWinControl.CalcAutoRange;
begin
{*
 004534C0    push        ebx
 004534C1    mov         ebx,eax
 004534C3    cmp         dword ptr [ebx+214],0
>004534CA    jg          004534E2
 004534CC    mov         eax,dword ptr [ebx+208]
 004534D2    call        TControlScrollBar.CalcAutoRange
 004534D7    mov         eax,dword ptr [ebx+20C]
 004534DD    call        TControlScrollBar.CalcAutoRange
 004534E2    pop         ebx
 004534E3    ret
*}
end;

//004534E4
procedure TScrollingWinControl.SetAutoScroll(Value:Boolean);
begin
{*
 004534E4    push        ebx
 004534E5    mov         ebx,eax
 004534E7    cmp         dl,byte ptr [ebx+210]
>004534ED    je          0045351C
 004534EF    mov         byte ptr [ebx+210],dl
 004534F5    test        dl,dl
>004534F7    je          00453502
 004534F9    mov         eax,ebx
 004534FB    call        TScrollingWinControl.CalcAutoRange
>00453500    jmp         0045351C
 00453502    xor         edx,edx
 00453504    mov         eax,dword ptr [ebx+208]
 0045350A    call        TControlScrollBar.SetRange
 0045350F    xor         edx,edx
 00453511    mov         eax,dword ptr [ebx+20C]
 00453517    call        TControlScrollBar.SetRange
 0045351C    pop         ebx
 0045351D    ret
*}
end;

//00453520
procedure TScrollingWinControl.SetHorzScrollBar(Value:TControlScrollBar);
begin
{*
 00453520    push        esi
 00453521    mov         esi,eax
 00453523    mov         eax,dword ptr [esi+208]
 00453529    mov         ecx,dword ptr [eax]
 0045352B    call        dword ptr [ecx+8]
 0045352E    pop         esi
 0045352F    ret
*}
end;

//00453530
procedure TScrollingWinControl.SetVertScrollBar(Value:TControlScrollBar);
begin
{*
 00453530    push        esi
 00453531    mov         esi,eax
 00453533    mov         eax,dword ptr [esi+20C]
 00453539    mov         ecx,dword ptr [eax]
 0045353B    call        dword ptr [ecx+8]
 0045353E    pop         esi
 0045353F    ret
*}
end;

//00453540
procedure TScrollingWinControl.UpdateScrollBars;
begin
{*
 00453540    push        ebp
 00453541    mov         ebp,esp
 00453543    push        ecx
 00453544    mov         dword ptr [ebp-4],eax
 00453547    mov         eax,dword ptr [ebp-4]
 0045354A    cmp         byte ptr [eax+218],0
>00453551    jne         00453632
 00453557    mov         eax,dword ptr [ebp-4]
 0045355A    call        TWinControl.HandleAllocated
 0045355F    test        al,al
>00453561    je          00453632
 00453567    xor         eax,eax
 00453569    push        ebp
 0045356A    push        45362B
 0045356F    push        dword ptr fs:[eax]
 00453572    mov         dword ptr fs:[eax],esp
 00453575    mov         eax,dword ptr [ebp-4]
 00453578    mov         byte ptr [eax+218],1
 0045357F    mov         eax,dword ptr [ebp-4]
 00453582    mov         eax,dword ptr [eax+20C]
 00453588    call        TControlScrollBar.NeedsScrollBarVisible
 0045358D    test        al,al
>0045358F    je          004535B7
 00453591    mov         eax,dword ptr [ebp-4]
 00453594    mov         eax,dword ptr [eax+208]
 0045359A    mov         cl,1
 0045359C    xor         edx,edx
 0045359E    call        TControlScrollBar.Update
 004535A3    mov         eax,dword ptr [ebp-4]
 004535A6    mov         eax,dword ptr [eax+20C]
 004535AC    xor         ecx,ecx
 004535AE    mov         dl,1
 004535B0    call        TControlScrollBar.Update
>004535B5    jmp         00453613
 004535B7    mov         eax,dword ptr [ebp-4]
 004535BA    mov         eax,dword ptr [eax+208]
 004535C0    call        TControlScrollBar.NeedsScrollBarVisible
 004535C5    test        al,al
>004535C7    je          004535EF
 004535C9    mov         eax,dword ptr [ebp-4]
 004535CC    mov         eax,dword ptr [eax+20C]
 004535D2    mov         cl,1
 004535D4    xor         edx,edx
 004535D6    call        TControlScrollBar.Update
 004535DB    mov         eax,dword ptr [ebp-4]
 004535DE    mov         eax,dword ptr [eax+208]
 004535E4    xor         ecx,ecx
 004535E6    mov         dl,1
 004535E8    call        TControlScrollBar.Update
>004535ED    jmp         00453613
 004535EF    mov         eax,dword ptr [ebp-4]
 004535F2    mov         eax,dword ptr [eax+20C]
 004535F8    xor         ecx,ecx
 004535FA    xor         edx,edx
 004535FC    call        TControlScrollBar.Update
 00453601    mov         eax,dword ptr [ebp-4]
 00453604    mov         eax,dword ptr [eax+208]
 0045360A    xor         ecx,ecx
 0045360C    mov         dl,1
 0045360E    call        TControlScrollBar.Update
 00453613    xor         eax,eax
 00453615    pop         edx
 00453616    pop         ecx
 00453617    pop         ecx
 00453618    mov         dword ptr fs:[eax],edx
 0045361B    push        453632
 00453620    mov         eax,dword ptr [ebp-4]
 00453623    mov         byte ptr [eax+218],0
 0045362A    ret
>0045362B    jmp         @HandleFinally
>00453630    jmp         00453620
 00453632    pop         ecx
 00453633    pop         ebp
 00453634    ret
*}
end;

//00453638
procedure TScrollingWinControl.AutoScrollInView(AControl:TControl);
begin
{*
 00453638    test        edx,edx
>0045363A    je          0045364D
 0045363C    test        byte ptr [edx+1C],1
>00453640    jne         0045364D
 00453642    test        byte ptr [eax+1C],1
>00453646    jne         0045364D
 00453648    call        TScrollingWinControl.ScrollInView
 0045364D    ret
*}
end;

//00453650
procedure TScrollingWinControl.ScrollInView(AControl:TControl);
begin
{*
 00453650    push        ebx
 00453651    push        esi
 00453652    push        edi
 00453653    push        ebp
 00453654    add         esp,0FFFFFFE0
 00453657    mov         esi,edx
 00453659    mov         ebx,eax
 0045365B    mov         edi,esp
 0045365D    test        esi,esi
>0045365F    je          00453799
 00453665    mov         edx,edi
 00453667    mov         eax,esi
 00453669    mov         ecx,dword ptr [eax]
 0045366B    call        dword ptr [ecx+44]
 0045366E    mov         eax,dword ptr [ebx+208]
 00453674    movzx       eax,word ptr [eax+1A]
 00453678    sub         dword ptr [edi],eax
 0045367A    add         dword ptr [edi+8],eax
 0045367D    mov         eax,dword ptr [ebx+20C]
 00453683    movzx       eax,word ptr [eax+1A]
 00453687    sub         dword ptr [edi+4],eax
 0045368A    add         dword ptr [edi+0C],eax
 0045368D    lea         ecx,[esp+18]
 00453691    mov         edx,edi
 00453693    mov         eax,esi
 00453695    call        TControl.ClientToScreen
 0045369A    lea         edx,[esp+18]
 0045369E    lea         ecx,[esp+10]
 004536A2    mov         eax,ebx
 004536A4    call        TControl.ScreenToClient
 004536A9    mov         eax,dword ptr [esp+10]
 004536AD    mov         dword ptr [edi],eax
 004536AF    mov         eax,dword ptr [esp+14]
 004536B3    mov         dword ptr [edi+4],eax
 004536B6    lea         ecx,[esp+18]
 004536BA    lea         edx,[edi+8]
 004536BD    mov         eax,esi
 004536BF    call        TControl.ClientToScreen
 004536C4    lea         edx,[esp+18]
 004536C8    lea         ecx,[esp+10]
 004536CC    mov         eax,ebx
 004536CE    call        TControl.ScreenToClient
 004536D3    mov         eax,dword ptr [esp+10]
 004536D7    mov         dword ptr [edi+8],eax
 004536DA    mov         eax,dword ptr [esp+14]
 004536DE    mov         dword ptr [edi+0C],eax
 004536E1    mov         esi,dword ptr [edi]
 004536E3    test        esi,esi
>004536E5    jge         004536F9
 004536E7    mov         eax,dword ptr [ebx+208]
 004536ED    mov         edx,dword ptr [eax+0C]
 004536F0    add         edx,esi
 004536F2    call        TControlScrollBar.SetPosition
>004536F7    jmp         0045373C
 004536F9    mov         eax,ebx
 004536FB    call        TControl.GetClientWidth
 00453700    mov         ebp,dword ptr [edi+8]
 00453703    cmp         eax,ebp
>00453705    jge         0045373C
 00453707    mov         eax,ebx
 00453709    call        TControl.GetClientWidth
 0045370E    sub         ebp,esi
 00453710    cmp         eax,ebp
>00453712    jge         00453720
 00453714    mov         eax,ebx
 00453716    call        TControl.GetClientWidth
 0045371B    add         eax,dword ptr [edi]
 0045371D    mov         dword ptr [edi+8],eax
 00453720    mov         esi,dword ptr [ebx+208]
 00453726    mov         eax,ebx
 00453728    call        TControl.GetClientWidth
 0045372D    mov         edx,dword ptr [esi+0C]
 00453730    add         edx,dword ptr [edi+8]
 00453733    sub         edx,eax
 00453735    mov         eax,esi
 00453737    call        TControlScrollBar.SetPosition
 0045373C    mov         esi,dword ptr [edi+4]
 0045373F    test        esi,esi
>00453741    jge         00453755
 00453743    mov         eax,dword ptr [ebx+20C]
 00453749    mov         edx,dword ptr [eax+0C]
 0045374C    add         edx,esi
 0045374E    call        TControlScrollBar.SetPosition
>00453753    jmp         00453799
 00453755    mov         eax,ebx
 00453757    call        TControl.GetClientHeight
 0045375C    mov         ebp,dword ptr [edi+0C]
 0045375F    cmp         eax,ebp
>00453761    jge         00453799
 00453763    mov         eax,ebx
 00453765    call        TControl.GetClientHeight
 0045376A    sub         ebp,esi
 0045376C    cmp         eax,ebp
>0045376E    jge         0045377D
 00453770    mov         eax,ebx
 00453772    call        TControl.GetClientHeight
 00453777    add         eax,dword ptr [edi+4]
 0045377A    mov         dword ptr [edi+0C],eax
 0045377D    mov         esi,dword ptr [ebx+20C]
 00453783    mov         eax,ebx
 00453785    call        TControl.GetClientHeight
 0045378A    mov         edx,dword ptr [esi+0C]
 0045378D    add         edx,dword ptr [edi+0C]
 00453790    sub         edx,eax
 00453792    mov         eax,esi
 00453794    call        TControlScrollBar.SetPosition
 00453799    add         esp,20
 0045379C    pop         ebp
 0045379D    pop         edi
 0045379E    pop         esi
 0045379F    pop         ebx
 004537A0    ret
*}
end;

//004537A4
procedure TScrollingWinControl.ScaleScrollBars(M:Integer; D:Integer);
begin
{*
 004537A4    push        ebx
 004537A5    push        esi
 004537A6    push        edi
 004537A7    push        ebp
 004537A8    mov         edi,ecx
 004537AA    mov         esi,edx
 004537AC    mov         ebx,eax
 004537AE    cmp         edi,esi
>004537B0    je          0045382F
 004537B2    test        byte ptr [ebx+1C],1
>004537B6    jne         004537CC
 004537B8    mov         eax,dword ptr [ebx+208]
 004537BE    mov         byte ptr [eax+1E],1
 004537C2    mov         eax,dword ptr [ebx+20C]
 004537C8    mov         byte ptr [eax+1E],1
 004537CC    xor         edx,edx
 004537CE    mov         eax,dword ptr [ebx+208]
 004537D4    call        TControlScrollBar.SetPosition
 004537D9    xor         edx,edx
 004537DB    mov         eax,dword ptr [ebx+20C]
 004537E1    call        TControlScrollBar.SetPosition
 004537E6    cmp         byte ptr [ebx+210],0
>004537ED    jne         0045382F
 004537EF    mov         ebp,dword ptr [ebx+208]
 004537F5    cmp         byte ptr [ebp+1E],0
>004537F9    je          0045380F
 004537FB    push        edi
 004537FC    push        esi
 004537FD    mov         eax,dword ptr [ebp+10]
 00453800    push        eax
 00453801    call        KERNEL32.MulDiv
 00453806    mov         edx,eax
 00453808    mov         eax,ebp
 0045380A    call        TControlScrollBar.SetRange
 0045380F    mov         ebp,dword ptr [ebx+20C]
 00453815    cmp         byte ptr [ebp+1E],0
>00453819    je          0045382F
 0045381B    push        edi
 0045381C    push        esi
 0045381D    mov         eax,dword ptr [ebp+10]
 00453820    push        eax
 00453821    call        KERNEL32.MulDiv
 00453826    mov         edx,eax
 00453828    mov         eax,ebp
 0045382A    call        TControlScrollBar.SetRange
 0045382F    mov         eax,dword ptr [ebx+208]
 00453835    mov         byte ptr [eax+1E],0
 00453839    mov         eax,dword ptr [ebx+20C]
 0045383F    mov         byte ptr [eax+1E],0
 00453843    pop         ebp
 00453844    pop         edi
 00453845    pop         esi
 00453846    pop         ebx
 00453847    ret
*}
end;

//00453848
procedure TScrollingWinControl.ChangeScale(M:Integer; D:Integer);
begin
{*
 00453848    push        ebx
 00453849    push        esi
 0045384A    push        edi
 0045384B    mov         edi,ecx
 0045384D    mov         esi,edx
 0045384F    mov         ebx,eax
 00453851    mov         ecx,edi
 00453853    mov         edx,esi
 00453855    mov         eax,ebx
 00453857    call        TScrollingWinControl.ScaleScrollBars
 0045385C    mov         ecx,edi
 0045385E    mov         edx,esi
 00453860    mov         eax,ebx
 00453862    call        TWinControl.ChangeScale
 00453867    pop         edi
 00453868    pop         esi
 00453869    pop         ebx
 0045386A    ret
*}
end;

//0045386C
procedure sub_0045386C;
begin
{*
 0045386C    ret
*}
end;

//00453870
procedure TScrollingWinControl.WMSize(var Message:TWMSize);
begin
{*
 00453870    push        ebp
 00453871    mov         ebp,esp
 00453873    push        ecx
 00453874    push        ebx
 00453875    mov         ebx,edx
 00453877    mov         dword ptr [ebp-4],eax
 0045387A    mov         eax,dword ptr [ebp-4]
 0045387D    inc         dword ptr [eax+214]
 00453883    xor         edx,edx
 00453885    push        ebp
 00453886    push        4538DA
 0045388B    push        dword ptr fs:[edx]
 0045388E    mov         dword ptr fs:[edx],esp
 00453891    mov         edx,ebx
 00453893    mov         eax,dword ptr [ebp-4]
 00453896    call        TWinControl.WMSize
 0045389B    xor         eax,eax
 0045389D    mov         edx,dword ptr [ebx+4]
 004538A0    sub         edx,1
>004538A3    jb          004538AC
>004538A5    je          004538B0
 004538A7    dec         edx
>004538A8    je          004538B4
>004538AA    jmp         004538B6
 004538AC    xor         eax,eax
>004538AE    jmp         004538B6
 004538B0    mov         al,1
>004538B2    jmp         004538B6
 004538B4    mov         al,2
 004538B6    mov         edx,eax
 004538B8    mov         eax,dword ptr [ebp-4]
 004538BB    mov         ecx,dword ptr [eax]
 004538BD    call        dword ptr [ecx+0D0]
 004538C3    xor         eax,eax
 004538C5    pop         edx
 004538C6    pop         ecx
 004538C7    pop         ecx
 004538C8    mov         dword ptr fs:[eax],edx
 004538CB    push        4538E1
 004538D0    mov         eax,dword ptr [ebp-4]
 004538D3    dec         dword ptr [eax+214]
 004538D9    ret
>004538DA    jmp         @HandleFinally
>004538DF    jmp         004538D0
 004538E1    mov         eax,dword ptr [ebp-4]
 004538E4    mov         byte ptr [eax+218],1
 004538EB    xor         eax,eax
 004538ED    push        ebp
 004538EE    push        453919
 004538F3    push        dword ptr fs:[eax]
 004538F6    mov         dword ptr fs:[eax],esp
 004538F9    mov         eax,dword ptr [ebp-4]
 004538FC    call        TScrollingWinControl.CalcAutoRange
 00453901    xor         eax,eax
 00453903    pop         edx
 00453904    pop         ecx
 00453905    pop         ecx
 00453906    mov         dword ptr fs:[eax],edx
 00453909    push        453920
 0045390E    mov         eax,dword ptr [ebp-4]
 00453911    mov         byte ptr [eax+218],0
 00453918    ret
>00453919    jmp         @HandleFinally
>0045391E    jmp         0045390E
 00453920    mov         eax,dword ptr [ebp-4]
 00453923    mov         eax,dword ptr [eax+208]
 00453929    cmp         byte ptr [eax+1C],0
>0045392D    jne         0045393E
 0045392F    mov         eax,dword ptr [ebp-4]
 00453932    mov         eax,dword ptr [eax+20C]
 00453938    cmp         byte ptr [eax+1C],0
>0045393C    je          00453946
 0045393E    mov         eax,dword ptr [ebp-4]
 00453941    call        TScrollingWinControl.UpdateScrollBars
 00453946    pop         ebx
 00453947    pop         ecx
 00453948    pop         ebp
 00453949    ret
*}
end;

//0045394C
procedure TScrollingWinControl.WMHScroll(Message:TWMCommand);
begin
{*
 0045394C    cmp         dword ptr [edx+8],0
>00453950    jne         0045396A
 00453952    mov         ecx,dword ptr [eax+208];TScrollingWinControl.HorzScrollBar:TControlScrollBar
 00453958    cmp         byte ptr [ecx+1C],0;TControlScrollBar.Visible:Boolean
>0045395C    je          0045396A
 0045395E    mov         eax,dword ptr [eax+208];TScrollingWinControl.HorzScrollBar:TControlScrollBar
 00453964    call        TControlScrollBar.ScrollMessage
 00453969    ret
 0045396A    call        TWinControl.WMCommand
 0045396F    ret
*}
end;

//00453970
procedure TScrollingWinControl.WMVScroll(Message:TWMHScroll);
begin
{*
 00453970    cmp         dword ptr [edx+8],0
>00453974    jne         0045398E
 00453976    mov         ecx,dword ptr [eax+20C];TScrollingWinControl.VertScrollBar:TControlScrollBar
 0045397C    cmp         byte ptr [ecx+1C],0;TControlScrollBar.Visible:Boolean
>00453980    je          0045398E
 00453982    mov         eax,dword ptr [eax+20C];TScrollingWinControl.VertScrollBar:TControlScrollBar
 00453988    call        TControlScrollBar.ScrollMessage
 0045398D    ret
 0045398E    call        TWinControl.WMHScroll
 00453993    ret
*}
end;

//00453994
{*procedure sub_00453994(?:?);
begin
 00453994    push        ebx
 00453995    push        esi
 00453996    push        edi
 00453997    add         esp,0FFFFFFF0
 0045399A    mov         esi,edx
 0045399C    mov         ebx,eax
 0045399E    mov         eax,ebx
 004539A0    call        TControl.GetClientHeight
 004539A5    mov         edx,dword ptr [ebx+20C];TScrollingWinControl.VertScrollBar:TControlScrollBar
 004539AB    mov         edx,dword ptr [edx+10];TControlScrollBar.Range:Integer
 004539AE    call        Max
 004539B3    push        eax
 004539B4    lea         eax,[esp+4]
 004539B8    push        eax
 004539B9    mov         eax,ebx
 004539BB    call        TControl.GetClientWidth
 004539C0    mov         edx,eax
 004539C2    mov         edi,dword ptr [ebx+208];TScrollingWinControl.HorzScrollBar:TControlScrollBar
 004539C8    mov         eax,dword ptr [edi+10];TControlScrollBar.Range:Integer
 004539CB    call        Max
 004539D0    mov         ecx,eax
 004539D2    mov         eax,dword ptr [ebx+20C];TScrollingWinControl.VertScrollBar:TControlScrollBar
 004539D8    mov         edx,dword ptr [eax+0C];TControlScrollBar.Position:Integer
 004539DB    neg         edx
 004539DD    mov         eax,dword ptr [edi+0C];TControlScrollBar.Position:Integer
 004539E0    neg         eax
 004539E2    call        Rect
 004539E7    push        esi
 004539E8    mov         edi,esi
 004539EA    lea         esi,[esp+4]
 004539EE    movs        dword ptr [edi],dword ptr [esi]
 004539EF    movs        dword ptr [edi],dword ptr [esi]
 004539F0    movs        dword ptr [edi],dword ptr [esi]
 004539F1    movs        dword ptr [edi],dword ptr [esi]
 004539F2    pop         esi
 004539F3    mov         edx,esi
 004539F5    mov         eax,ebx
 004539F7    call        0043E544
 004539FC    add         esp,10
 004539FF    pop         edi
 00453A00    pop         esi
 00453A01    pop         ebx
 00453A02    ret
end;*}

//00453A04
procedure TScrollingWinControl.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 00453A04    push        ebp
 00453A05    mov         ebp,esp
 00453A07    add         esp,0FFFFFFF4
 00453A0A    mov         dword ptr [ebp-8],edx
 00453A0D    mov         dword ptr [ebp-4],eax
 00453A10    mov         eax,dword ptr [ebp-8]
 00453A13    mov         eax,dword ptr [eax+4]
 00453A16    mov         dword ptr [ebp-0C],eax
 00453A19    xor         eax,eax
 00453A1B    push        ebp
 00453A1C    push        453A65
 00453A21    push        dword ptr fs:[eax]
 00453A24    mov         dword ptr fs:[eax],esp
 00453A27    mov         eax,dword ptr [ebp-4]
 00453A2A    mov         edx,dword ptr ds:[5AC0C8];gvar_005AC0C8
 00453A30    call        @IsClass
 00453A35    test        al,al
>00453A37    jne         00453A43
 00453A39    mov         eax,dword ptr [ebp-8]
 00453A3C    mov         dword ptr [eax+4],1
 00453A43    mov         edx,dword ptr [ebp-8]
 00453A46    mov         eax,dword ptr [ebp-4]
 00453A49    call        TWinControl.CMBiDiModeChanged
 00453A4E    xor         eax,eax
 00453A50    pop         edx
 00453A51    pop         ecx
 00453A52    pop         ecx
 00453A53    mov         dword ptr fs:[eax],edx
 00453A56    push        453A6C
 00453A5B    mov         eax,dword ptr [ebp-8]
 00453A5E    mov         edx,dword ptr [ebp-0C]
 00453A61    mov         dword ptr [eax+4],edx
 00453A64    ret
>00453A65    jmp         @HandleFinally
>00453A6A    jmp         00453A5B
 00453A6C    mov         eax,dword ptr [ebp-4]
 00453A6F    call        TWinControl.HandleAllocated
 00453A74    test        al,al
>00453A76    je          00453A8E
 00453A78    mov         eax,dword ptr [ebp-4]
 00453A7B    mov         eax,dword ptr [eax+208]
 00453A81    call        TControlScrollBar.ChangeBiDiPosition
 00453A86    mov         eax,dword ptr [ebp-4]
 00453A89    call        TScrollingWinControl.UpdateScrollBars
 00453A8E    mov         esp,ebp
 00453A90    pop         ebp
 00453A91    ret
*}
end;

//00453A94
constructor TCustomForm.Create(AOwner:TComponent);
begin
{*
 00453A94    push        ebp
 00453A95    mov         ebp,esp
 00453A97    add         esp,0FFFFFEEC
 00453A9D    push        ebx
 00453A9E    xor         ebx,ebx
 00453AA0    mov         dword ptr [ebp-114],ebx
 00453AA6    test        dl,dl
>00453AA8    je          00453AB2
 00453AAA    add         esp,0FFFFFFF0
 00453AAD    call        @ClassCreate
 00453AB2    mov         ebx,ecx
 00453AB4    mov         byte ptr [ebp-5],dl
 00453AB7    mov         dword ptr [ebp-4],eax
 00453ABA    xor         eax,eax
 00453ABC    push        ebp
 00453ABD    push        453BF8
 00453AC2    push        dword ptr fs:[eax]
 00453AC5    mov         dword ptr fs:[eax],esp
 00453AC8    mov         eax,[005AE7D0];^GlobalNameSpace:IReadWriteSync
 00453ACD    mov         eax,dword ptr [eax]
 00453ACF    mov         edx,dword ptr [eax]
 00453AD1    call        dword ptr [edx+14]
 00453AD4    xor         eax,eax
 00453AD6    push        ebp
 00453AD7    push        453BD8
 00453ADC    push        dword ptr fs:[eax]
 00453ADF    mov         dword ptr fs:[eax],esp
 00453AE2    push        0
 00453AE4    mov         ecx,ebx
 00453AE6    xor         edx,edx
 00453AE8    mov         eax,dword ptr [ebp-4]
 00453AEB    mov         ebx,dword ptr [eax]
 00453AED    call        dword ptr [ebx+0E0];TCustomForm.CreateNew
 00453AF3    mov         eax,dword ptr [ebp-4]
 00453AF6    call        TObject.ClassType
 00453AFB    cmp         eax,dword ptr ds:[451000];TForm
>00453B01    je          00453BBE
 00453B07    mov         eax,dword ptr [ebp-4]
 00453B0A    test        byte ptr [eax+1C],10;TCustomForm.FComponentState:TComponentState
>00453B0E    jne         00453BBE
 00453B14    mov         eax,dword ptr [ebp-4]
 00453B17    or          byte ptr [eax+2F4],1;TCustomForm.FFormState:TFormState
 00453B1E    xor         eax,eax
 00453B20    push        ebp
 00453B21    push        453BA0
 00453B26    push        dword ptr fs:[eax]
 00453B29    mov         dword ptr fs:[eax],esp
 00453B2C    mov         edx,dword ptr ds:[451000];TForm
 00453B32    mov         eax,dword ptr [ebp-4]
 00453B35    call        InitInheritedComponent
 00453B3A    test        al,al
>00453B3C    jne         00453B88
 00453B3E    lea         edx,[ebp-110]
 00453B44    mov         eax,dword ptr [ebp-4]
 00453B47    mov         eax,dword ptr [eax]
 00453B49    call        TObject.ClassName
 00453B4E    lea         eax,[ebp-110]
 00453B54    mov         dword ptr [ebp-10],eax
 00453B57    mov         byte ptr [ebp-0C],4
 00453B5B    lea         eax,[ebp-10]
 00453B5E    push        eax
 00453B5F    push        0
 00453B61    lea         edx,[ebp-114]
 00453B67    mov         eax,[005AE41C];^SResNotFound:TResStringRec
 00453B6C    call        LoadStr
 00453B71    mov         ecx,dword ptr [ebp-114]
 00453B77    mov         dl,1
 00453B79    mov         eax,[00417A68];EResNotFound
 00453B7E    call        Exception.CreateFmt;EResNotFound.Create
 00453B83    call        @RaiseExcept
 00453B88    xor         eax,eax
 00453B8A    pop         edx
 00453B8B    pop         ecx
 00453B8C    pop         ecx
 00453B8D    mov         dword ptr fs:[eax],edx
 00453B90    push        453BA7
 00453B95    mov         eax,dword ptr [ebp-4]
 00453B98    and         byte ptr [eax+2F4],0FE;TCustomForm.FFormState:TFormState
 00453B9F    ret
>00453BA0    jmp         @HandleFinally
>00453BA5    jmp         00453B95
 00453BA7    mov         eax,dword ptr [ebp-4]
 00453BAA    cmp         byte ptr [eax+234],0;TCustomForm.FOldCreateOrder:Boolean
>00453BB1    je          00453BBE
 00453BB3    mov         eax,dword ptr [ebp-4]
 00453BB6    mov         edx,dword ptr [eax]
 00453BB8    call        dword ptr [edx+0D4];TCustomForm.DoCreate
 00453BBE    xor         eax,eax
 00453BC0    pop         edx
 00453BC1    pop         ecx
 00453BC2    pop         ecx
 00453BC3    mov         dword ptr fs:[eax],edx
 00453BC6    push        453BDF
 00453BCB    mov         eax,[005AE7D0];^GlobalNameSpace:IReadWriteSync
 00453BD0    mov         eax,dword ptr [eax]
 00453BD2    mov         edx,dword ptr [eax]
 00453BD4    call        dword ptr [edx+18]
 00453BD7    ret
>00453BD8    jmp         @HandleFinally
>00453BDD    jmp         00453BCB
 00453BDF    xor         eax,eax
 00453BE1    pop         edx
 00453BE2    pop         ecx
 00453BE3    pop         ecx
 00453BE4    mov         dword ptr fs:[eax],edx
 00453BE7    push        453BFF
 00453BEC    lea         eax,[ebp-114]
 00453BF2    call        @LStrClr
 00453BF7    ret
>00453BF8    jmp         @HandleFinally
>00453BFD    jmp         00453BEC
 00453BFF    mov         eax,dword ptr [ebp-4]
 00453C02    cmp         byte ptr [ebp-5],0
>00453C06    je          00453C17
 00453C08    call        @AfterConstruction
 00453C0D    pop         dword ptr fs:[0]
 00453C14    add         esp,0C
 00453C17    mov         eax,dword ptr [ebp-4]
 00453C1A    pop         ebx
 00453C1B    mov         esp,ebp
 00453C1D    pop         ebp
 00453C1E    ret
*}
end;

//00453C20
procedure TCustomForm.AfterConstruction;
begin
{*
 00453C20    push        ebx
 00453C21    push        esi
 00453C22    mov         ebx,eax
 00453C24    cmp         byte ptr [ebx+234],0
>00453C2B    jne         00453C37
 00453C2D    mov         eax,ebx
 00453C2F    mov         edx,dword ptr [eax]
 00453C31    call        dword ptr [edx+0D4]
 00453C37    test        byte ptr [ebx+2F4],20
>00453C3E    je          00453C52
 00453C40    mov         eax,ebx
 00453C42    mov         si,0FFB3
 00453C46    call        @CallDynaInst
 00453C4B    and         byte ptr [ebx+2F4],0DF
 00453C52    pop         esi
 00453C53    pop         ebx
 00453C54    ret
*}
end;

//00453C58
constructor TCustomForm.CreateNew(AOwner:TComponent; Dummy:Integer);
begin
{*
 00453C58    push        ebp
 00453C59    mov         ebp,esp
 00453C5B    push        ecx
 00453C5C    push        ebx
 00453C5D    push        esi
 00453C5E    test        dl,dl
>00453C60    je          00453C6A
 00453C62    add         esp,0FFFFFFF0
 00453C65    call        @ClassCreate
 00453C6A    mov         byte ptr [ebp-1],dl
 00453C6D    mov         ebx,eax
 00453C6F    xor         edx,edx
 00453C71    mov         eax,ebx
 00453C73    call        TScrollingWinControl.Create
 00453C78    mov         eax,[00453DCC]
 00453C7D    mov         dword ptr [ebx+50],eax
 00453C80    xor         edx,edx
 00453C82    mov         eax,ebx
 00453C84    call        TControl.SetLeft
 00453C89    xor         edx,edx
 00453C8B    mov         eax,ebx
 00453C8D    call        TControl.SetTop
 00453C92    mov         edx,140
 00453C97    mov         eax,ebx
 00453C99    call        TControl.SetWidth
 00453C9E    mov         edx,0F0
 00453CA3    mov         eax,ebx
 00453CA5    call        TControl.SetHeight
 00453CAA    mov         dl,1
 00453CAC    mov         eax,[00424FFC];TIcon
 00453CB1    call        TIcon.Create
 00453CB6    mov         esi,eax
 00453CB8    mov         dword ptr [ebx+240],esi
 00453CBE    push        31
 00453CC0    mov         eax,[005AE32C]
 00453CC5    mov         eax,dword ptr [eax]
 00453CC7    call        eax
 00453CC9    mov         edx,eax
 00453CCB    mov         eax,esi
 00453CCD    mov         ecx,dword ptr [eax]
 00453CCF    call        dword ptr [ecx+40]
 00453CD2    push        32
 00453CD4    mov         eax,[005AE32C]
 00453CD9    mov         eax,dword ptr [eax]
 00453CDB    call        eax
 00453CDD    mov         edx,eax
 00453CDF    mov         eax,dword ptr [ebx+240]
 00453CE5    mov         ecx,dword ptr [eax]
 00453CE7    call        dword ptr [ecx+34]
 00453CEA    mov         eax,dword ptr [ebx+240]
 00453CF0    mov         dword ptr [eax+14],ebx
 00453CF3    mov         dword ptr [eax+10],454574;TCustomForm.IconChanged
 00453CFA    mov         dl,1
 00453CFC    mov         eax,[00436FD4];TControlCanvas
 00453D01    call        TCanvas.Create
 00453D06    mov         esi,eax
 00453D08    mov         dword ptr [ebx+238],esi
 00453D0E    mov         eax,esi
 00453D10    mov         edx,ebx
 00453D12    call        TControlCanvas.SetControl
 00453D17    mov         al,[00453DD0]
 00453D1C    mov         byte ptr [ebx+228],al
 00453D22    mov         byte ptr [ebx+229],2
 00453D29    mov         byte ptr [ebx+22B],0
 00453D30    mov         byte ptr [ebx+231],3
 00453D37    mov         byte ptr [ebx+244],0
 00453D3E    mov         eax,[005E0CB0];Screen:TScreen
 00453D43    mov         eax,dword ptr [eax+40]
 00453D46    mov         dword ptr [ebx+25C],eax
 00453D4C    mov         byte ptr [ebx+235],1
 00453D53    mov         eax,ebx
 00453D55    call        TObject.ClassType
 00453D5A    mov         dword ptr [ebx+0B8],eax
 00453D60    mov         byte ptr [ebx+2E1],0FF
 00453D67    xor         eax,eax
 00453D69    mov         dword ptr [ebx+2EC],eax
 00453D6F    xor         edx,edx
 00453D71    mov         eax,ebx
 00453D73    call        TCustomForm.SetVisible
 00453D78    xor         edx,edx
 00453D7A    mov         eax,ebx
 00453D7C    call        TControl.SetParentColor
 00453D81    xor         edx,edx
 00453D83    mov         eax,ebx
 00453D85    call        TControl.SetParentFont
 00453D8A    mov         dl,1
 00453D8C    mov         eax,ebx
 00453D8E    call        TWinControl.SetCtl3D
 00453D93    mov         edx,ebx
 00453D95    mov         eax,[005E0CB0];Screen:TScreen
 00453D9A    call        TScreen.AddForm
 00453D9F    mov         dword ptr [ebx+2E4],0A
 00453DA9    mov         eax,ebx
 00453DAB    cmp         byte ptr [ebp-1],0
>00453DAF    je          00453DC0
 00453DB1    call        @AfterConstruction
 00453DB6    pop         dword ptr fs:[0]
 00453DBD    add         esp,0C
 00453DC0    mov         eax,ebx
 00453DC2    pop         esi
 00453DC3    pop         ebx
 00453DC4    pop         ecx
 00453DC5    pop         ebp
 00453DC6    ret         4
*}
end;

//00453DD4
procedure TCustomForm.BeforeDestruction;
begin
{*
 00453DD4    push        ebx
 00453DD5    mov         ebx,eax
 00453DD7    mov         eax,[005AE7D0];^GlobalNameSpace:IReadWriteSync
 00453DDC    mov         eax,dword ptr [eax]
 00453DDE    mov         edx,dword ptr [eax]
 00453DE0    call        dword ptr [edx+14]
 00453DE3    mov         eax,ebx
 00453DE5    call        TComponent.Destroying
 00453DEA    mov         eax,[005E0CB0];Screen:TScreen
 00453DEF    mov         eax,dword ptr [eax+7C]
 00453DF2    mov         edx,ebx
 00453DF4    call        TList.Remove
 00453DF9    xor         edx,edx
 00453DFB    mov         eax,ebx
 00453DFD    call        RemoveFixupReferences
 00453E02    cmp         dword ptr [ebx+264],0
>00453E09    je          00453E16
 00453E0B    mov         eax,dword ptr [ebx+264]
 00453E11    mov         edx,dword ptr [eax]
 00453E13    call        dword ptr [edx+0C]
 00453E16    cmp         byte ptr [ebx+22F],1
>00453E1D    je          00453E26
 00453E1F    mov         eax,ebx
 00453E21    call        TCustomForm.Hide
 00453E26    cmp         byte ptr [ebx+234],0
>00453E2D    jne         00453E39
 00453E2F    mov         eax,ebx
 00453E31    mov         edx,dword ptr [eax]
 00453E33    call        dword ptr [edx+0D8]
 00453E39    pop         ebx
 00453E3A    ret
*}
end;

//00453E3C
destructor TCustomForm.Destroy;
begin
{*
 00453E3C    push        ebp
 00453E3D    mov         ebp,esp
 00453E3F    add         esp,0FFFFFFF8
 00453E42    call        @BeforeDestruction
 00453E47    mov         byte ptr [ebp-5],dl
 00453E4A    mov         dword ptr [ebp-4],eax
 00453E4D    mov         eax,dword ptr [ebp-4]
 00453E50    test        byte ptr [eax+1C],8
>00453E54    jne         00453E62
 00453E56    mov         eax,[005AE7D0];^GlobalNameSpace:IReadWriteSync
 00453E5B    mov         eax,dword ptr [eax]
 00453E5D    mov         edx,dword ptr [eax]
 00453E5F    call        dword ptr [edx+14]
 00453E62    xor         eax,eax
 00453E64    push        ebp
 00453E65    push        453F06
 00453E6A    push        dword ptr fs:[eax]
 00453E6D    mov         dword ptr fs:[eax],esp
 00453E70    mov         eax,dword ptr [ebp-4]
 00453E73    cmp         byte ptr [eax+234],0
>00453E7A    je          00453E87
 00453E7C    mov         eax,dword ptr [ebp-4]
 00453E7F    mov         edx,dword ptr [eax]
 00453E81    call        dword ptr [edx+0D8]
 00453E87    xor         edx,edx
 00453E89    mov         eax,dword ptr [ebp-4]
 00453E8C    call        TCustomForm.MergeMenu
 00453E91    mov         eax,dword ptr [ebp-4]
 00453E94    call        TWinControl.HandleAllocated
 00453E99    test        al,al
>00453E9B    je          00453EA8
 00453E9D    mov         eax,dword ptr [ebp-4]
 00453EA0    mov         edx,dword ptr [eax]
 00453EA2    call        dword ptr [edx+0AC]
 00453EA8    mov         edx,dword ptr [ebp-4]
 00453EAB    mov         eax,[005E0CB0];Screen:TScreen
 00453EB0    call        TScreen.RemoveForm
 00453EB5    mov         eax,dword ptr [ebp-4]
 00453EB8    mov         eax,dword ptr [eax+238]
 00453EBE    call        TObject.Free
 00453EC3    mov         eax,dword ptr [ebp-4]
 00453EC6    mov         eax,dword ptr [eax+240]
 00453ECC    call        TObject.Free
 00453ED1    mov         eax,dword ptr [ebp-4]
 00453ED4    add         eax,2F0
 00453ED9    call        FreeAndNil
 00453EDE    mov         dl,byte ptr [ebp-5]
 00453EE1    and         dl,0FC
 00453EE4    mov         eax,dword ptr [ebp-4]
 00453EE7    call        TScrollingWinControl.Destroy
 00453EEC    xor         eax,eax
 00453EEE    pop         edx
 00453EEF    pop         ecx
 00453EF0    pop         ecx
 00453EF1    mov         dword ptr fs:[eax],edx
 00453EF4    push        453F0D
 00453EF9    mov         eax,[005AE7D0];^GlobalNameSpace:IReadWriteSync
 00453EFE    mov         eax,dword ptr [eax]
 00453F00    mov         edx,dword ptr [eax]
 00453F02    call        dword ptr [edx+18]
 00453F05    ret
>00453F06    jmp         @HandleFinally
>00453F0B    jmp         00453EF9
 00453F0D    cmp         byte ptr [ebp-5],0
>00453F11    jle         00453F1B
 00453F13    mov         eax,dword ptr [ebp-4]
 00453F16    call        @ClassDestroy
 00453F1B    pop         ecx
 00453F1C    pop         ecx
 00453F1D    pop         ebp
 00453F1E    ret
*}
end;

//00453F20
procedure TCustomForm.DoCreate;
begin
{*
 00453F20    push        ebp
 00453F21    mov         ebp,esp
 00453F23    push        ecx
 00453F24    push        ebx
 00453F25    push        esi
 00453F26    push        edi
 00453F27    mov         dword ptr [ebp-4],eax
 00453F2A    mov         eax,dword ptr [ebp-4]
 00453F2D    cmp         word ptr [eax+2D2],0
>00453F35    je          00453F80
 00453F37    xor         eax,eax
 00453F39    push        ebp
 00453F3A    push        453F61
 00453F3F    push        dword ptr fs:[eax]
 00453F42    mov         dword ptr fs:[eax],esp
 00453F45    mov         ebx,dword ptr [ebp-4]
 00453F48    mov         edx,dword ptr [ebp-4]
 00453F4B    mov         eax,dword ptr [ebx+2D4]
 00453F51    call        dword ptr [ebx+2D0]
 00453F57    xor         eax,eax
 00453F59    pop         edx
 00453F5A    pop         ecx
 00453F5B    pop         ecx
 00453F5C    mov         dword ptr fs:[eax],edx
>00453F5F    jmp         00453F80
>00453F61    jmp         @HandleAnyException
 00453F66    mov         eax,dword ptr [ebp-4]
 00453F69    mov         si,0FFAD
 00453F6D    call        @CallDynaInst
 00453F72    test        al,al
>00453F74    jne         00453F7B
 00453F76    call        @RaiseAgain
 00453F7B    call        @DoneExcept
 00453F80    mov         eax,dword ptr [ebp-4]
 00453F83    test        byte ptr [eax+2F4],2
>00453F8A    je          00453F96
 00453F8C    mov         dl,1
 00453F8E    mov         eax,dword ptr [ebp-4]
 00453F91    call        TCustomForm.SetVisible
 00453F96    pop         edi
 00453F97    pop         esi
 00453F98    pop         ebx
 00453F99    pop         ecx
 00453F9A    pop         ebp
 00453F9B    ret
*}
end;

//00453F9C
procedure TCustomForm.DoDestroy;
begin
{*
 00453F9C    push        ebp
 00453F9D    mov         ebp,esp
 00453F9F    push        ecx
 00453FA0    push        ebx
 00453FA1    push        esi
 00453FA2    push        edi
 00453FA3    mov         dword ptr [ebp-4],eax
 00453FA6    mov         eax,dword ptr [ebp-4]
 00453FA9    cmp         word ptr [eax+2DA],0
>00453FB1    je          00453FF4
 00453FB3    xor         eax,eax
 00453FB5    push        ebp
 00453FB6    push        453FDD
 00453FBB    push        dword ptr fs:[eax]
 00453FBE    mov         dword ptr fs:[eax],esp
 00453FC1    mov         ebx,dword ptr [ebp-4]
 00453FC4    mov         edx,dword ptr [ebp-4]
 00453FC7    mov         eax,dword ptr [ebx+2DC]
 00453FCD    call        dword ptr [ebx+2D8]
 00453FD3    xor         eax,eax
 00453FD5    pop         edx
 00453FD6    pop         ecx
 00453FD7    pop         ecx
 00453FD8    mov         dword ptr fs:[eax],edx
>00453FDB    jmp         00453FF4
>00453FDD    jmp         @HandleAnyException
 00453FE2    mov         edx,dword ptr [ebp-4]
 00453FE5    mov         eax,[005E0CAC];Application:TApplication
 00453FEA    call        TApplication.HandleException
 00453FEF    call        @DoneExcept
 00453FF4    pop         edi
 00453FF5    pop         esi
 00453FF6    pop         ebx
 00453FF7    pop         ecx
 00453FF8    pop         ebp
 00453FF9    ret
*}
end;

//00453FFC
procedure TCustomForm.Loaded;
begin
{*
 00453FFC    push        ebx
 00453FFD    push        esi
 00453FFE    push        edi
 00453FFF    mov         ebx,eax
 00454001    mov         eax,ebx
 00454003    call        TControl.Loaded
 00454008    mov         eax,dword ptr [ebx+220]
 0045400E    test        eax,eax
>00454010    je          00454034
 00454012    mov         edi,eax
 00454014    xor         eax,eax
 00454016    mov         dword ptr [ebx+220],eax
 0045401C    mov         eax,edi
 0045401E    mov         si,0FFB8
 00454022    call        @CallDynaInst
 00454027    test        al,al
>00454029    je          00454034
 0045402B    mov         edx,edi
 0045402D    mov         eax,ebx
 0045402F    call        TCustomForm.SetActiveControl
 00454034    pop         edi
 00454035    pop         esi
 00454036    pop         ebx
 00454037    ret
*}
end;

//00454038
procedure TCustomForm.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00454038    push        ebx
 00454039    push        esi
 0045403A    push        edi
 0045403B    push        ebp
 0045403C    mov         ebx,ecx
 0045403E    mov         esi,edx
 00454040    mov         edi,eax
 00454042    mov         ecx,ebx
 00454044    mov         edx,esi
 00454046    mov         eax,edi
 00454048    call        TControl.Notification
 0045404D    mov         eax,ebx
 0045404F    sub         al,1
>00454051    jb          0045405A
>00454053    je          004540CC
>00454055    jmp         00454125
 0045405A    mov         eax,esi
 0045405C    mov         edx,dword ptr ds:[447574];TCustomActionList
 00454062    call        @IsClass
 00454067    test        al,al
>00454069    je          00454098
 0045406B    cmp         dword ptr [edi+2F0],0
>00454072    jne         00454086
 00454074    mov         dl,1
 00454076    mov         eax,[00417CEC];TList
 0045407B    call        TObject.Create
 00454080    mov         dword ptr [edi+2F0],eax
 00454086    mov         edx,esi
 00454088    mov         eax,dword ptr [edi+2F0]
 0045408E    call        TList.Add
>00454093    jmp         00454125
 00454098    test        byte ptr [edi+1C],1
>0045409C    jne         00454125
 004540A2    cmp         dword ptr [edi+248],0
>004540A9    jne         00454125
 004540AB    cmp         edi,dword ptr [esi+4]
>004540AE    jne         00454125
 004540B0    mov         eax,esi
 004540B2    mov         edx,dword ptr ds:[44A66C];TMainMenu
 004540B8    call        @IsClass
 004540BD    test        al,al
>004540BF    je          00454125
 004540C1    mov         edx,esi
 004540C3    mov         eax,edi
 004540C5    call        TCustomForm.SetMenu
>004540CA    jmp         00454125
 004540CC    mov         ebp,dword ptr [edi+2F0]
 004540D2    test        ebp,ebp
>004540D4    je          004540F2
 004540D6    mov         eax,esi
 004540D8    mov         edx,dword ptr ds:[447574];TCustomActionList
 004540DE    call        @IsClass
 004540E3    test        al,al
>004540E5    je          004540F2
 004540E7    mov         edx,esi
 004540E9    mov         eax,ebp
 004540EB    call        TList.Remove
>004540F0    jmp         00454125
 004540F2    cmp         esi,dword ptr [edi+248]
>004540F8    jne         00454103
 004540FA    xor         edx,edx
 004540FC    mov         eax,edi
 004540FE    call        TCustomForm.SetMenu
 00454103    cmp         esi,dword ptr [edi+258]
>00454109    jne         00454114
 0045410B    xor         edx,edx
 0045410D    mov         eax,edi
 0045410F    call        TCustomForm.SetWindowMenu
 00454114    cmp         esi,dword ptr [edi+260]
>0045411A    jne         00454125
 0045411C    xor         edx,edx
 0045411E    mov         eax,edi
 00454120    call        TCustomForm.SetObjectMenuItem
 00454125    cmp         dword ptr [edi+250],0
>0045412C    je          0045413D
 0045412E    mov         ecx,ebx
 00454130    mov         edx,esi
 00454132    mov         eax,dword ptr [edi+250]
 00454138    mov         ebx,dword ptr [eax]
 0045413A    call        dword ptr [ebx+10]
 0045413D    pop         ebp
 0045413E    pop         edi
 0045413F    pop         esi
 00454140    pop         ebx
 00454141    ret
*}
end;

//00454144
procedure TCustomForm.ReadState(Reader:TReader);
begin
{*
 00454144    push        ebp
 00454145    mov         ebp,esp
 00454147    push        ecx
 00454148    push        ebx
 00454149    push        esi
 0045414A    mov         esi,edx
 0045414C    mov         dword ptr [ebp-4],eax
 0045414F    mov         eax,dword ptr [ebp-4]
 00454152    call        TWinControl.DisableAlign
 00454157    xor         edx,edx
 00454159    push        ebp
 0045415A    push        45439A
 0045415F    push        dword ptr fs:[edx]
 00454162    mov         dword ptr fs:[edx],esp
 00454165    mov         eax,dword ptr [ebp-4]
 00454168    xor         edx,edx
 0045416A    mov         dword ptr [eax+268],edx
 00454170    mov         eax,dword ptr [ebp-4]
 00454173    xor         edx,edx
 00454175    mov         dword ptr [eax+26C],edx
 0045417B    mov         eax,dword ptr [ebp-4]
 0045417E    xor         edx,edx
 00454180    mov         dword ptr [eax+270],edx
 00454186    xor         ebx,ebx
 00454188    mov         al,[005AF661];gvar_005AF661
 0045418D    xor         al,1
 0045418F    mov         edx,dword ptr [ebp-4]
 00454192    mov         byte ptr [edx+234],al
 00454198    mov         edx,esi
 0045419A    mov         eax,dword ptr [ebp-4]
 0045419D    call        TWinControl.ReadState
 004541A2    mov         eax,dword ptr [ebp-4]
 004541A5    cmp         dword ptr [eax+25C],0
>004541AC    je          0045430E
 004541B2    mov         eax,dword ptr [ebp-4]
 004541B5    cmp         dword ptr [eax+270],0
>004541BC    jle         0045430E
 004541C2    mov         eax,dword ptr [ebp-4]
 004541C5    test        byte ptr [eax+98],10
>004541CC    je          00454211
 004541CE    mov         eax,dword ptr [ebp-4]
 004541D1    mov         eax,dword ptr [eax+25C]
 004541D7    mov         edx,dword ptr ds:[5E0CB0];Screen:TScreen
 004541DD    cmp         eax,dword ptr [edx+40]
>004541E0    je          00454211
 004541E2    mov         eax,dword ptr [ebp-4]
 004541E5    mov         eax,dword ptr [eax+25C]
 004541EB    push        eax
 004541EC    mov         eax,[005E0CB0];Screen:TScreen
 004541F1    mov         eax,dword ptr [eax+40]
 004541F4    push        eax
 004541F5    mov         eax,dword ptr [ebp-4]
 004541F8    mov         esi,dword ptr [eax+68]
 004541FB    mov         eax,esi
 004541FD    call        TFont.GetHeight
 00454202    push        eax
 00454203    call        KERNEL32.MulDiv
 00454208    mov         edx,eax
 0045420A    mov         eax,esi
 0045420C    call        TFont.SetHeight
 00454211    mov         eax,[005E0CB0];Screen:TScreen
 00454216    mov         eax,dword ptr [eax+40]
 00454219    mov         edx,dword ptr [ebp-4]
 0045421C    mov         dword ptr [edx+25C],eax
 00454222    mov         eax,dword ptr [ebp-4]
 00454225    call        TCustomForm.GetTextHeight
 0045422A    mov         esi,eax
 0045422C    mov         eax,dword ptr [ebp-4]
 0045422F    mov         eax,dword ptr [eax+270]
 00454235    cmp         esi,eax
>00454237    je          0045430E
 0045423D    mov         bl,1
 0045423F    mov         ecx,eax
 00454241    mov         edx,esi
 00454243    mov         eax,dword ptr [ebp-4]
 00454246    call        TScrollingWinControl.ScaleScrollBars
 0045424B    mov         eax,dword ptr [ebp-4]
 0045424E    mov         ecx,dword ptr [eax+270]
 00454254    mov         edx,esi
 00454256    mov         eax,dword ptr [ebp-4]
 00454259    call        TWinControl.ScaleControls
 0045425E    mov         eax,dword ptr [ebp-4]
 00454261    test        byte ptr [eax+98],4
>00454268    je          0045428D
 0045426A    mov         eax,dword ptr [ebp-4]
 0045426D    mov         eax,dword ptr [eax+270]
 00454273    push        eax
 00454274    push        esi
 00454275    mov         eax,dword ptr [ebp-4]
 00454278    mov         eax,dword ptr [eax+268]
 0045427E    push        eax
 0045427F    call        KERNEL32.MulDiv
 00454284    mov         edx,dword ptr [ebp-4]
 00454287    mov         dword ptr [edx+268],eax
 0045428D    mov         eax,dword ptr [ebp-4]
 00454290    test        byte ptr [eax+98],8
>00454297    je          004542BC
 00454299    mov         eax,dword ptr [ebp-4]
 0045429C    mov         eax,dword ptr [eax+270]
 004542A2    push        eax
 004542A3    push        esi
 004542A4    mov         eax,dword ptr [ebp-4]
 004542A7    mov         eax,dword ptr [eax+26C]
 004542AD    push        eax
 004542AE    call        KERNEL32.MulDiv
 004542B3    mov         edx,dword ptr [ebp-4]
 004542B6    mov         dword ptr [edx+26C],eax
 004542BC    mov         eax,dword ptr [ebp-4]
 004542BF    test        byte ptr [eax+98],20
>004542C6    je          0045430E
 004542C8    mov         eax,dword ptr [ebp-4]
 004542CB    mov         eax,dword ptr [eax+270]
 004542D1    push        eax
 004542D2    push        esi
 004542D3    mov         eax,dword ptr [ebp-4]
 004542D6    mov         eax,dword ptr [eax+1FA]
 004542DC    push        eax
 004542DD    call        KERNEL32.MulDiv
 004542E2    mov         edx,dword ptr [ebp-4]
 004542E5    mov         dword ptr [edx+1FA],eax
 004542EB    mov         eax,dword ptr [ebp-4]
 004542EE    mov         eax,dword ptr [eax+270]
 004542F4    push        eax
 004542F5    push        esi
 004542F6    mov         eax,dword ptr [ebp-4]
 004542F9    mov         eax,dword ptr [eax+1FE]
 004542FF    push        eax
 00454300    call        KERNEL32.MulDiv
 00454305    mov         edx,dword ptr [ebp-4]
 00454308    mov         dword ptr [edx+1FE],eax
 0045430E    mov         eax,dword ptr [ebp-4]
 00454311    mov         eax,dword ptr [eax+268]
 00454317    test        eax,eax
>00454319    jle         00454325
 0045431B    mov         edx,eax
 0045431D    mov         eax,dword ptr [ebp-4]
 00454320    call        TControl.SetClientWidth
 00454325    mov         eax,dword ptr [ebp-4]
 00454328    mov         eax,dword ptr [eax+26C]
 0045432E    test        eax,eax
>00454330    jle         0045433C
 00454332    mov         edx,eax
 00454334    mov         eax,dword ptr [ebp-4]
 00454337    call        TControl.SetClientHeight
 0045433C    mov         eax,dword ptr [ebp-4]
 0045433F    mov         dl,byte ptr ds:[4543A8]
 00454345    mov         byte ptr [eax+98],dl
 0045434B    test        bl,bl
>0045434D    jne         00454373
 0045434F    mov         ecx,1
 00454354    mov         edx,1
 00454359    mov         eax,dword ptr [ebp-4]
 0045435C    call        TScrollingWinControl.ScaleScrollBars
 00454361    mov         ecx,1
 00454366    mov         edx,1
 0045436B    mov         eax,dword ptr [ebp-4]
 0045436E    call        TWinControl.ScaleControls
 00454373    push        0
 00454375    xor         ecx,ecx
 00454377    mov         edx,0B03D
 0045437C    mov         eax,dword ptr [ebp-4]
 0045437F    call        TControl.Perform
 00454384    xor         eax,eax
 00454386    pop         edx
 00454387    pop         ecx
 00454388    pop         ecx
 00454389    mov         dword ptr fs:[eax],edx
 0045438C    push        4543A1
 00454391    mov         eax,dword ptr [ebp-4]
 00454394    call        TWinControl.EnableAlign
 00454399    ret
>0045439A    jmp         @HandleFinally
>0045439F    jmp         00454391
 004543A1    pop         esi
 004543A2    pop         ebx
 004543A3    pop         ecx
 004543A4    pop         ebp
 004543A5    ret
*}
end;

//004543AC
procedure TCustomForm.DefineProperties(Filer:TFiler);
begin
{*
 004543AC    push        ebx
 004543AD    push        esi
 004543AE    push        edi
 004543AF    mov         esi,edx
 004543B1    mov         ebx,eax
 004543B3    mov         edx,esi
 004543B5    mov         eax,ebx
 004543B7    call        TWinControl.DefineProperties
 004543BC    push        0
 004543BE    push        0
 004543C0    push        ebx
 004543C1    push        4544B0;TCustomForm.WritePixelsPerInch
 004543C6    mov         cl,byte ptr [ebx+5E]
 004543C9    xor         cl,1
 004543CC    mov         edx,45441C;'PixelsPerInch'
 004543D1    mov         eax,esi
 004543D3    mov         edi,dword ptr [eax]
 004543D5    call        dword ptr [edi+4]
 004543D8    push        ebx
 004543D9    push        45447C;TCustomForm.ReadTextHeight
 004543DE    push        ebx
 004543DF    push        454494;TCustomForm.WriteTextHeight
 004543E4    mov         cl,byte ptr [ebx+5E]
 004543E7    xor         cl,1
 004543EA    mov         edx,454434;'TextHeight'
 004543EF    mov         eax,esi
 004543F1    mov         edi,dword ptr [eax]
 004543F3    call        dword ptr [edi+4]
 004543F6    push        ebx
 004543F7    push        45445C;TCustomForm.ReadIgnoreFontProperty
 004543FC    push        0
 004543FE    push        0
 00454400    xor         ecx,ecx
 00454402    mov         edx,454448;'IgnoreFontProperty'
 00454407    mov         eax,esi
 00454409    mov         ebx,dword ptr [eax]
 0045440B    call        dword ptr [ebx+4]
 0045440E    pop         edi
 0045440F    pop         esi
 00454410    pop         ebx
 00454411    ret
*}
end;

//0045445C
procedure TCustomForm.ReadIgnoreFontProperty(Reader:TReader);
begin
{*
 0045445C    push        ebx
 0045445D    push        esi
 0045445E    mov         esi,edx
 00454460    mov         ebx,eax
 00454462    mov         eax,esi
 00454464    call        TReader.ReadBoolean
 00454469    test        al,al
>0045446B    je          00454476
 0045446D    mov         dl,1
 0045446F    mov         eax,ebx
 00454471    call        TControl.SetParentFont
 00454476    pop         esi
 00454477    pop         ebx
 00454478    ret
*}
end;

//0045447C
procedure TCustomForm.ReadTextHeight(Reader:TReader);
begin
{*
 0045447C    push        ebx
 0045447D    push        esi
 0045447E    mov         esi,edx
 00454480    mov         ebx,eax
 00454482    mov         eax,esi
 00454484    call        TReader.ReadInteger
 00454489    mov         dword ptr [ebx+270],eax
 0045448F    pop         esi
 00454490    pop         ebx
 00454491    ret
*}
end;

//00454494
procedure TCustomForm.WriteTextHeight(Writer:TWriter);
begin
{*
 00454494    push        ebx
 00454495    push        esi
 00454496    mov         esi,edx
 00454498    mov         ebx,eax
 0045449A    mov         eax,ebx
 0045449C    call        TCustomForm.GetTextHeight
 004544A1    mov         edx,eax
 004544A3    mov         eax,esi
 004544A5    call        TWriter.WriteInteger
 004544AA    pop         esi
 004544AB    pop         ebx
 004544AC    ret
*}
end;

//004544B0
procedure TCustomForm.WritePixelsPerInch(Writer:TWriter);
begin
{*
 004544B0    push        ebx
 004544B1    push        esi
 004544B2    mov         esi,edx
 004544B4    mov         ebx,eax
 004544B6    mov         eax,ebx
 004544B8    call        TCustomForm.GetPixelsPerInch
 004544BD    mov         edx,eax
 004544BF    mov         eax,esi
 004544C1    call        TWriter.WriteInteger
 004544C6    pop         esi
 004544C7    pop         ebx
 004544C8    ret
*}
end;

//004544CC
function TCustomForm.GetTextHeight:Integer;
begin
{*
 004544CC    push        ebx
 004544CD    mov         ebx,eax
 004544CF    mov         eax,ebx
 004544D1    call        TCustomForm.GetCanvas
 004544D6    mov         edx,4544EC;'0'
 004544DB    call        TCanvas.TextHeight
 004544E0    pop         ebx
 004544E1    ret
*}
end;

//004544F0
procedure TCustomForm.BeginAutoDrag;
begin
{*
 004544F0    ret
*}
end;

//004544F4
procedure TCustomForm.ChangeScale(M:Integer; D:Integer);
begin
{*
 004544F4    push        ebx
 004544F5    push        esi
 004544F6    push        edi
 004544F7    push        ebp
 004544F8    mov         edi,ecx
 004544FA    mov         esi,edx
 004544FC    mov         ebx,eax
 004544FE    mov         ecx,edi
 00454500    mov         edx,esi
 00454502    mov         eax,ebx
 00454504    call        TScrollingWinControl.ScaleScrollBars
 00454509    mov         ecx,edi
 0045450B    mov         edx,esi
 0045450D    mov         eax,ebx
 0045450F    call        TWinControl.ScaleControls
 00454514    mov         eax,ebx
 00454516    call        TCustomForm.IsClientSizeStored
 0045451B    test        al,al
>0045451D    je          00454551
 0045451F    mov         eax,ebx
 00454521    call        TControl.GetClientHeight
 00454526    mov         ebp,eax
 00454528    push        edi
 00454529    push        esi
 0045452A    mov         eax,ebx
 0045452C    call        TControl.GetClientWidth
 00454531    push        eax
 00454532    call        KERNEL32.MulDiv
 00454537    mov         edx,eax
 00454539    mov         eax,ebx
 0045453B    call        TCustomForm.SetClientWidth
 00454540    push        edi
 00454541    push        esi
 00454542    push        ebp
 00454543    call        KERNEL32.MulDiv
 00454548    mov         edx,eax
 0045454A    mov         eax,ebx
 0045454C    call        TCustomForm.SetClientHeight
 00454551    push        edi
 00454552    push        esi
 00454553    mov         ebp,dword ptr [ebx+68]
 00454556    mov         eax,ebp
 00454558    call        TFont.GetSize
 0045455D    push        eax
 0045455E    call        KERNEL32.MulDiv
 00454563    mov         edx,eax
 00454565    mov         eax,ebp
 00454567    call        TFont.SetSize
 0045456C    pop         ebp
 0045456D    pop         edi
 0045456E    pop         esi
 0045456F    pop         ebx
 00454570    ret
*}
end;

//00454574
procedure TCustomForm.IconChanged(Sender:TObject);
begin
{*
 00454574    push        ebx
 00454575    mov         ebx,eax
 00454577    mov         eax,[005AE3F0];^NewStyleControls:Boolean
 0045457C    cmp         byte ptr [eax],0
>0045457F    je          004545B3
 00454581    mov         eax,ebx
 00454583    call        TWinControl.HandleAllocated
 00454588    test        al,al
>0045458A    je          004545CB
 0045458C    cmp         byte ptr [ebx+229],3
>00454593    je          004545CB
 00454595    mov         eax,ebx
 00454597    call        TCustomForm.GetIconHandle
 0045459C    push        eax
 0045459D    push        1
 0045459F    push        80
 004545A4    mov         eax,ebx
 004545A6    call        TWinControl.GetHandle
 004545AB    push        eax
 004545AC    call        user32.SendMessageA
 004545B1    pop         ebx
 004545B2    ret
 004545B3    mov         eax,ebx
 004545B5    call        TWinControl.GetHandle
 004545BA    push        eax
 004545BB    call        user32.IsIconic
 004545C0    test        eax,eax
>004545C2    je          004545CB
 004545C4    mov         eax,ebx
 004545C6    mov         edx,dword ptr [eax]
 004545C8    call        dword ptr [edx+7C]
 004545CB    pop         ebx
 004545CC    ret
*}
end;

//004545D0
function TCustomForm.IsClientSizeStored(Value:Integer):Boolean;
begin
{*
 004545D0    push        ebx
 004545D1    mov         ebx,eax
 004545D3    mov         eax,ebx
 004545D5    call        TCustomForm.IsFormSizeStored
 004545DA    xor         al,1
 004545DC    pop         ebx
 004545DD    ret
*}
end;

//004545E0
function TCustomForm.IsFormSizeStored(Value:Integer):Boolean;
begin
{*
 004545E0    cmp         byte ptr [eax+210],0
>004545E7    jne         00454604
 004545E9    mov         edx,dword ptr [eax+208]
 004545EF    cmp         dword ptr [edx+10],0
>004545F3    jne         00454604
 004545F5    mov         eax,dword ptr [eax+20C]
 004545FB    cmp         dword ptr [eax+10],0
>004545FF    jne         00454604
 00454601    xor         eax,eax
 00454603    ret
 00454604    mov         al,1
 00454606    ret
*}
end;

//00454608
function TCustomForm.IsAutoScrollStored(Value:Boolean):Boolean;
begin
{*
 00454608    push        ebx
 00454609    mov         ebx,eax
 0045460B    mov         eax,ebx
 0045460D    call        TCustomForm.IsForm
 00454612    test        al,al
>00454614    je          00454632
 00454616    mov         al,byte ptr [ebx+229]
 0045461C    sub         al,2
>0045461E    je          00454628
 00454620    sub         al,3
>00454622    je          00454628
 00454624    xor         eax,eax
>00454626    jmp         0045462A
 00454628    mov         al,1
 0045462A    cmp         al,byte ptr [ebx+210]
>00454630    jne         00454636
 00454632    xor         eax,eax
 00454634    pop         ebx
 00454635    ret
 00454636    mov         al,1
 00454638    pop         ebx
 00454639    ret
*}
end;

//0045463C
procedure TCustomForm.DoClose(var Action:TCloseAction);
begin
{*
 0045463C    push        ebx
 0045463D    cmp         word ptr [eax+292],0
>00454645    je          00454659
 00454647    mov         ecx,edx
 00454649    mov         ebx,eax
 0045464B    mov         edx,eax
 0045464D    mov         eax,dword ptr [ebx+294]
 00454653    call        dword ptr [ebx+290]
 00454659    pop         ebx
 0045465A    ret
*}
end;

//0045465C
procedure TCustomForm.DoHide;
begin
{*
 0045465C    push        ebx
 0045465D    cmp         word ptr [eax+2B2],0
>00454665    je          00454677
 00454667    mov         ebx,eax
 00454669    mov         edx,eax
 0045466B    mov         eax,dword ptr [ebx+2B4]
 00454671    call        dword ptr [ebx+2B0]
 00454677    pop         ebx
 00454678    ret
*}
end;

//0045467C
procedure TCustomForm.DoShow;
begin
{*
 0045467C    push        ebx
 0045467D    cmp         word ptr [eax+2CA],0
>00454685    je          00454697
 00454687    mov         ebx,eax
 00454689    mov         edx,eax
 0045468B    mov         eax,dword ptr [ebx+2CC]
 00454691    call        dword ptr [ebx+2C8]
 00454697    pop         ebx
 00454698    ret
*}
end;

//0045469C
function TCustomForm.GetClientRect:TRect;
begin
{*
 0045469C    push        ebx
 0045469D    push        esi
 0045469E    mov         esi,edx
 004546A0    mov         ebx,eax
 004546A2    mov         eax,ebx
 004546A4    call        TWinControl.GetHandle
 004546A9    push        eax
 004546AA    call        user32.IsIconic
 004546AF    test        eax,eax
>004546B1    je          00454716
 004546B3    push        0
 004546B5    push        0
 004546B7    push        0
 004546B9    push        0
 004546BB    push        esi
 004546BC    call        user32.SetRect
 004546C1    push        0EC
 004546C3    mov         eax,ebx
 004546C5    call        TWinControl.GetHandle
 004546CA    push        eax
 004546CB    call        user32.GetWindowLongA
 004546D0    push        eax
 004546D1    cmp         dword ptr [ebx+248],0
 004546D8    setne       al
 004546DB    neg         al
 004546DD    sbb         eax,eax
 004546DF    push        eax
 004546E0    push        0F0
 004546E2    mov         eax,ebx
 004546E4    call        TWinControl.GetHandle
 004546E9    push        eax
 004546EA    call        user32.GetWindowLongA
 004546EF    push        eax
 004546F0    push        esi
 004546F1    call        user32.AdjustWindowRectEx
 004546F6    mov         eax,dword ptr [ebx+4C]
 004546F9    sub         eax,dword ptr [esi+0C]
 004546FC    add         eax,dword ptr [esi+4]
 004546FF    push        eax
 00454700    mov         eax,dword ptr [ebx+48]
 00454703    sub         eax,dword ptr [esi+8]
 00454706    add         eax,dword ptr [esi]
 00454708    push        eax
 00454709    push        0
 0045470B    push        0
 0045470D    push        esi
 0045470E    call        user32.SetRect
 00454713    pop         esi
 00454714    pop         ebx
 00454715    ret
 00454716    mov         edx,esi
 00454718    mov         eax,ebx
 0045471A    call        TWinControl.GetClientRect
 0045471F    pop         esi
 00454720    pop         ebx
 00454721    ret
*}
end;

//00454724
procedure TCustomForm.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00454724    push        ebp
 00454725    mov         ebp,esp
 00454727    add         esp,0FFFFFFF8
 0045472A    push        ebx
 0045472B    push        esi
 0045472C    push        edi
 0045472D    mov         esi,edx
 0045472F    mov         ebx,eax
 00454731    push        dword ptr [ebp+0C]
 00454734    push        dword ptr [ebp+8]
 00454737    mov         edx,esi
 00454739    mov         eax,ebx
 0045473B    call        TWinControl.GetChildren
 00454740    cmp         ebx,esi
>00454742    jne         00454786
 00454744    mov         eax,ebx
 00454746    call        TComponent.GetComponentCount
 0045474B    dec         eax
 0045474C    test        eax,eax
>0045474E    jl          00454786
 00454750    inc         eax
 00454751    mov         dword ptr [ebp-8],eax
 00454754    mov         dword ptr [ebp-4],0
 0045475B    mov         edx,dword ptr [ebp-4]
 0045475E    mov         eax,ebx
 00454760    call        TComponent.GetComponent
 00454765    mov         edi,eax
 00454767    mov         eax,edi
 00454769    mov         si,0FFF1
 0045476D    call        @CallDynaInst
 00454772    test        al,al
>00454774    jne         0045477E
 00454776    mov         edx,edi
 00454778    mov         eax,dword ptr [ebp+0C]
 0045477B    call        dword ptr [ebp+8]
 0045477E    inc         dword ptr [ebp-4]
 00454781    dec         dword ptr [ebp-8]
>00454784    jne         0045475B
 00454786    pop         edi
 00454787    pop         esi
 00454788    pop         ebx
 00454789    pop         ecx
 0045478A    pop         ecx
 0045478B    pop         ebp
 0045478C    ret         8
*}
end;

//00454790
function TCustomForm.GetFloating:Boolean;
begin
{*
 00454790    push        ebx
 00454791    push        esi
 00454792    mov         ebx,eax
 00454794    cmp         dword ptr [ebx+0A0],0
>0045479B    jne         004547B1
 0045479D    mov         eax,ebx
 0045479F    mov         edx,dword ptr [eax]
 004547A1    call        dword ptr [edx+58]
 004547A4    mov         esi,eax
 004547A6    mov         eax,ebx
 004547A8    call        TObject.ClassType
 004547AD    cmp         esi,eax
>004547AF    je          004547B6
 004547B1    xor         eax,eax
 004547B3    pop         esi
 004547B4    pop         ebx
 004547B5    ret
 004547B6    mov         al,1
 004547B8    pop         esi
 004547B9    pop         ebx
 004547BA    ret
*}
end;

//004547BC
procedure TCustomForm.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 004547BC    push        ebx
 004547BD    push        esi
 004547BE    push        edi
 004547BF    push        ebp
 004547C0    add         esp,0FFFFFFF4
 004547C3    mov         dword ptr [esp+4],ecx
 004547C7    mov         dword ptr [esp],edx
 004547CA    mov         ebp,eax
 004547CC    mov         eax,dword ptr [esp]
 004547CF    mov         edx,dword ptr ds:[437BA4];TControl
 004547D5    call        @IsClass
 004547DA    test        al,al
>004547DC    je          004547EE
 004547DE    mov         ecx,dword ptr [esp+4]
 004547E2    mov         edx,dword ptr [esp]
 004547E5    mov         eax,ebp
 004547E7    call        TWinControl.SetChildOrder
>004547EC    jmp         00454846
 004547EE    mov         eax,ebp
 004547F0    call        TWinControl.GetControlCount
 004547F5    sub         dword ptr [esp+4],eax
 004547F9    mov         dword ptr [esp+8],0FFFFFFFF
 00454801    mov         eax,ebp
 00454803    call        TComponent.GetComponentCount
 00454808    mov         ebx,eax
 0045480A    dec         ebx
 0045480B    test        ebx,ebx
>0045480D    jl          00454846
 0045480F    inc         ebx
 00454810    xor         edi,edi
 00454812    mov         edx,edi
 00454814    mov         eax,ebp
 00454816    call        TComponent.GetComponent
 0045481B    mov         si,0FFF1
 0045481F    call        @CallDynaInst
 00454824    test        al,al
>00454826    jne         00454842
 00454828    inc         dword ptr [esp+8]
 0045482C    mov         eax,dword ptr [esp+8]
 00454830    cmp         eax,dword ptr [esp+4]
>00454834    jne         00454842
 00454836    mov         edx,edi
 00454838    mov         eax,dword ptr [esp]
 0045483B    call        TComponent.SetComponentIndex
>00454840    jmp         00454846
 00454842    inc         edi
 00454843    dec         ebx
>00454844    jne         00454812
 00454846    add         esp,0C
 00454849    pop         ebp
 0045484A    pop         edi
 0045484B    pop         esi
 0045484C    pop         ebx
 0045484D    ret
*}
end;

//00454850
procedure TCustomForm.SetParentBiDiMode(Value:Boolean);
begin
{*
 00454850    push        ebx
 00454851    mov         ebx,eax
 00454853    cmp         dl,byte ptr [ebx+60]
>00454856    je          00454875
 00454858    mov         eax,ebx
 0045485A    call        TControl.SetParentBiDiMode
 0045485F    cmp         dword ptr [ebx+30],0
>00454863    jne         00454875
 00454865    push        0
 00454867    xor         ecx,ecx
 00454869    mov         edx,0B03D
 0045486E    mov         eax,ebx
 00454870    call        TControl.Perform
 00454875    pop         ebx
 00454876    ret
*}
end;

//00454878
procedure TCustomForm.SetClientWidth(Value:Integer);
begin
{*
 00454878    push        ebx
 00454879    mov         ebx,eax
 0045487B    test        byte ptr [ebx+54],8
>0045487F    je          0045489A
 00454881    mov         dword ptr [ebx+268],edx
 00454887    mov         al,[004548A4]
 0045488C    or          al,byte ptr [ebx+98]
 00454892    mov         byte ptr [ebx+98],al
 00454898    pop         ebx
 00454899    ret
 0045489A    mov         eax,ebx
 0045489C    call        TControl.SetClientWidth
 004548A1    pop         ebx
 004548A2    ret
*}
end;

//004548A8
procedure TCustomForm.SetClientHeight(Value:Integer);
begin
{*
 004548A8    push        ebx
 004548A9    mov         ebx,eax
 004548AB    test        byte ptr [ebx+54],8
>004548AF    je          004548CA
 004548B1    mov         dword ptr [ebx+26C],edx
 004548B7    mov         al,[004548D4]
 004548BC    or          al,byte ptr [ebx+98]
 004548C2    mov         byte ptr [ebx+98],al
 004548C8    pop         ebx
 004548C9    ret
 004548CA    mov         eax,ebx
 004548CC    call        TControl.SetClientHeight
 004548D1    pop         ebx
 004548D2    ret
*}
end;

//004548D8
procedure TCustomForm.SetVisible(Value:Boolean);
begin
{*
 004548D8    push        ebx
 004548D9    push        esi
 004548DA    mov         ebx,edx
 004548DC    mov         esi,eax
 004548DE    test        byte ptr [esi+2F4],1
>004548E5    je          004548FE
 004548E7    test        bl,bl
>004548E9    je          004548F4
 004548EB    or          byte ptr [esi+2F4],2
>004548F2    jmp         00454917
 004548F4    and         byte ptr [esi+2F4],0FD
 004548FB    pop         esi
 004548FC    pop         ebx
 004548FD    ret
 004548FE    test        bl,bl
>00454900    je          0045490E
 00454902    cmp         bl,byte ptr [esi+57]
>00454905    je          0045490E
 00454907    mov         eax,esi
 00454909    call        TCustomForm.SetWindowToMonitor
 0045490E    mov         edx,ebx
 00454910    mov         eax,esi
 00454912    call        TControl.SetVisible
 00454917    pop         esi
 00454918    pop         ebx
 00454919    ret
*}
end;

//0045491C
procedure TCustomForm.sub_0043CF6C;
begin
{*
 0045491C    push        ebp
 0045491D    mov         ebp,esp
 0045491F    push        0
 00454921    xor         edx,edx
 00454923    push        ebp
 00454924    push        454975
 00454929    push        dword ptr fs:[edx]
 0045492C    mov         dword ptr fs:[edx],esp
 0045492F    cmp         byte ptr [eax+22F],1;TCustomForm.FFormStyle:TFormStyle
>00454936    jne         0045495F
 00454938    cmp         byte ptr [eax+57],0;TCustomForm.FVisible:Boolean
>0045493C    je          0045495F
 0045493E    lea         edx,[ebp-4]
 00454941    mov         eax,[005AE190];^SMDIChildNotVisible:TResStringRec
 00454946    call        LoadStr
 0045494B    mov         ecx,dword ptr [ebp-4]
 0045494E    mov         dl,1
 00454950    mov         eax,[00417C8C];EInvalidOperation
 00454955    call        Exception.Create;EInvalidOperation.Create
 0045495A    call        @RaiseExcept
 0045495F    xor         eax,eax
 00454961    pop         edx
 00454962    pop         ecx
 00454963    pop         ecx
 00454964    mov         dword ptr fs:[eax],edx
 00454967    push        45497C
 0045496C    lea         eax,[ebp-4]
 0045496F    call        @LStrClr
 00454974    ret
>00454975    jmp         @HandleFinally
>0045497A    jmp         0045496C
 0045497C    pop         ecx
 0045497D    pop         ebp
 0045497E    ret
*}
end;

//00454980
{*function sub_00454980:?;
begin
 00454980    xor         eax,eax
 00454982    ret
end;*}

//00454984
procedure TCustomForm.SetParent(AParent:TWinControl);
begin
{*
 00454984    push        ebx
 00454985    push        esi
 00454986    mov         esi,edx
 00454988    mov         ebx,eax
 0045498A    mov         eax,dword ptr [ebx+30]
 0045498D    cmp         esi,eax
>0045498F    je          004549B6
 00454991    cmp         ebx,esi
>00454993    je          004549B6
 00454995    test        eax,eax
>00454997    jne         004549A0
 00454999    mov         eax,ebx
 0045499B    call        TWinControl.DestroyHandle
 004549A0    mov         edx,esi
 004549A2    mov         eax,ebx
 004549A4    call        TControl.SetParent
 004549A9    cmp         dword ptr [ebx+30],0
>004549AD    jne         004549B6
 004549AF    mov         eax,ebx
 004549B1    call        TWinControl.UpdateControlState
 004549B6    pop         esi
 004549B7    pop         ebx
 004549B8    ret
*}
end;

//004549BC
procedure TCustomForm.ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);
begin
{*
 004549BC    push        ebp
 004549BD    mov         ebp,esp
 004549BF    push        ebx
 004549C0    push        esi
 004549C1    push        edi
 004549C2    mov         edi,ecx
 004549C4    mov         esi,edx
 004549C6    mov         ebx,eax
 004549C8    mov         eax,dword ptr [ebp+8]
 004549CB    push        eax
 004549CC    mov         ecx,edi
 004549CE    mov         edx,esi
 004549D0    mov         eax,ebx
 004549D2    call        TComponent.ValidateRename
 004549D7    cmp         dword ptr [ebx+250],0
>004549DE    je          004549F3
 004549E0    mov         eax,dword ptr [ebp+8]
 004549E3    push        eax
 004549E4    mov         ecx,edi
 004549E6    mov         edx,esi
 004549E8    mov         eax,dword ptr [ebx+250]
 004549EE    mov         ebx,dword ptr [eax]
 004549F0    call        dword ptr [ebx+2C]
 004549F3    pop         edi
 004549F4    pop         esi
 004549F5    pop         ebx
 004549F6    pop         ebp
 004549F7    ret         4
*}
end;

//004549FC
procedure TCustomForm.WndProc(var Message:TMessage);
begin
{*
 004549FC    push        ebp
 004549FD    mov         ebp,esp
 004549FF    add         esp,0FFFFFFEC
 00454A02    push        ebx
 00454A03    push        esi
 00454A04    push        edi
 00454A05    mov         ebx,edx
 00454A07    mov         dword ptr [ebp-4],eax
 00454A0A    mov         eax,dword ptr [ebx]
 00454A0C    mov         edx,eax
 00454A0E    cmp         edx,46
>00454A11    jg          00454A36
>00454A13    je          00454B06
 00454A19    add         edx,0FFFFFFFA
 00454A1C    sub         edx,3
>00454A1F    jb          00454A4A
 00454A21    sub         edx,22
>00454A24    je          00454B7B
 00454A2A    dec         edx
>00454A2B    je          00454C7C
>00454A31    jmp         00454DAA
 00454A36    sub         edx,0B01A
>00454A3C    je          00454AE5
 00454A42    dec         edx
>00454A43    je          00454AC4
>00454A45    jmp         00454DAA
 00454A4A    cmp         byte ptr ds:[5ACDB4],0
>00454A51    je          00454E22
 00454A57    cmp         dword ptr [ebx],7
>00454A5A    jne         00454E18
 00454A60    mov         eax,dword ptr [ebp-4]
 00454A63    test        byte ptr [eax+1C],10
>00454A67    jne         00454E18
 00454A6D    xor         esi,esi
 00454A6F    mov         eax,dword ptr [ebp-4]
 00454A72    cmp         byte ptr [eax+22F],2
>00454A79    jne         00454A98
 00454A7B    mov         eax,dword ptr [ebp-4]
 00454A7E    call        TCustomForm.GetActiveMDIChild
 00454A83    test        eax,eax
>00454A85    je          00454AB1
 00454A87    mov         eax,dword ptr [ebp-4]
 00454A8A    call        TCustomForm.GetActiveMDIChild
 00454A8F    call        TWinControl.GetHandle
 00454A94    mov         esi,eax
>00454A96    jmp         00454AB1
 00454A98    mov         eax,dword ptr [ebp-4]
 00454A9B    mov         eax,dword ptr [eax+220]
 00454AA1    test        eax,eax
>00454AA3    je          00454AB1
 00454AA5    cmp         eax,dword ptr [ebp-4]
>00454AA8    je          00454AB1
 00454AAA    call        TWinControl.GetHandle
 00454AAF    mov         esi,eax
 00454AB1    test        esi,esi
>00454AB3    je          00454E18
 00454AB9    push        esi
 00454ABA    call        user32.SetFocus
>00454ABF    jmp         00454E22
 00454AC4    mov         eax,dword ptr [ebp-4]
 00454AC7    cmp         dword ptr [eax+0A0],0
>00454ACE    je          00454E18
 00454AD4    mov         eax,dword ptr [ebp-4]
 00454AD7    mov         si,0FFB1
 00454ADB    call        @CallDynaInst
>00454AE0    jmp         00454E18
 00454AE5    mov         eax,dword ptr [ebp-4]
 00454AE8    cmp         dword ptr [eax+0A0],0
>00454AEF    je          00454E18
 00454AF5    mov         eax,dword ptr [ebp-4]
 00454AF8    mov         si,0FFB3
 00454AFC    call        @CallDynaInst
>00454B01    jmp         00454E18
 00454B06    mov         eax,dword ptr [ebp-4]
 00454B09    mov         ax,word ptr [eax+1C]
 00454B0D    and         ax,word ptr ds:[454E2C]
 00454B14    mov         dx,word ptr ds:[454E30]
 00454B1B    cmp         dx,ax
>00454B1E    jne         00454E18
 00454B24    mov         eax,dword ptr [ebp-4]
 00454B27    mov         al,byte ptr [eax+230]
 00454B2D    dec         eax
 00454B2E    sub         al,2
>00454B30    jae         00454B45
 00454B32    mov         eax,dword ptr [ebp-4]
 00454B35    cmp         byte ptr [eax+22B],2
>00454B3C    je          00454B45
 00454B3E    mov         eax,dword ptr [ebx+8]
 00454B41    or          dword ptr [eax+18],2
 00454B45    mov         eax,dword ptr [ebp-4]
 00454B48    mov         al,byte ptr [eax+230]
 00454B4E    sub         al,1
>00454B50    je          00454B5A
 00454B52    sub         al,2
>00454B54    jne         00454E18
 00454B5A    mov         eax,dword ptr [ebp-4]
 00454B5D    mov         al,byte ptr [eax+229]
 00454B63    sub         al,2
>00454B65    je          00454B6F
 00454B67    sub         al,3
>00454B69    jne         00454E18
 00454B6F    mov         eax,dword ptr [ebx+8]
 00454B72    or          dword ptr [eax+18],1
>00454B76    jmp         00454E18
 00454B7B    mov         eax,dword ptr [ebx+8]
 00454B7E    mov         dword ptr [ebp-14],eax
 00454B81    mov         eax,dword ptr [ebp-14]
 00454B84    cmp         dword ptr [eax],1
>00454B87    jne         00454E18
 00454B8D    mov         eax,dword ptr [ebp-4]
 00454B90    cmp         dword ptr [eax+248],0
>00454B97    je          00454E18
 00454B9D    mov         eax,dword ptr [ebp-14]
 00454BA0    mov         edx,dword ptr [eax+8]
 00454BA3    mov         eax,dword ptr [ebp-4]
 00454BA6    mov         eax,dword ptr [eax+248]
 00454BAC    xor         ecx,ecx
 00454BAE    call        TMenu.FindItem
 00454BB3    mov         edi,eax
 00454BB5    test        edi,edi
>00454BB7    je          00454E18
 00454BBD    mov         dl,1
 00454BBF    mov         eax,[00436FD4];TControlCanvas
 00454BC4    call        TCanvas.Create
 00454BC9    mov         dword ptr [ebp-0C],eax
 00454BCC    xor         eax,eax
 00454BCE    push        ebp
 00454BCF    push        454C75
 00454BD4    push        dword ptr fs:[eax]
 00454BD7    mov         dword ptr fs:[eax],esp
 00454BDA    mov         eax,dword ptr [ebp-14]
 00454BDD    mov         eax,dword ptr [eax+18]
 00454BE0    push        eax
 00454BE1    call        gdi32.SaveDC
 00454BE6    mov         dword ptr [ebp-8],eax
 00454BE9    xor         eax,eax
 00454BEB    push        ebp
 00454BEC    push        454C58
 00454BF1    push        dword ptr fs:[eax]
 00454BF4    mov         dword ptr fs:[eax],esp
 00454BF7    mov         eax,dword ptr [ebp-14]
 00454BFA    mov         edx,dword ptr [eax+18]
 00454BFD    mov         eax,dword ptr [ebp-0C]
 00454C00    call        TCanvas.SetHandle
 00454C05    mov         eax,[005E0CB0];Screen:TScreen
 00454C0A    mov         edx,dword ptr [eax+88]
 00454C10    mov         eax,dword ptr [ebp-0C]
 00454C13    call        TCanvas.SetFont
 00454C18    mov         eax,dword ptr [ebp-14]
 00454C1B    mov         ax,word ptr [eax+10]
 00454C1F    push        eax
 00454C20    mov         eax,dword ptr [ebp-14]
 00454C23    lea         ecx,[eax+1C]
 00454C26    mov         edx,dword ptr [ebp-0C]
 00454C29    mov         eax,edi
 00454C2B    call        DrawMenuItem
 00454C30    xor         eax,eax
 00454C32    pop         edx
 00454C33    pop         ecx
 00454C34    pop         ecx
 00454C35    mov         dword ptr fs:[eax],edx
 00454C38    push        454C5F
 00454C3D    xor         edx,edx
 00454C3F    mov         eax,dword ptr [ebp-0C]
 00454C42    call        TCanvas.SetHandle
 00454C47    mov         eax,dword ptr [ebp-8]
 00454C4A    push        eax
 00454C4B    mov         eax,dword ptr [ebp-14]
 00454C4E    mov         eax,dword ptr [eax+18]
 00454C51    push        eax
 00454C52    call        gdi32.RestoreDC
 00454C57    ret
>00454C58    jmp         @HandleFinally
>00454C5D    jmp         00454C3D
 00454C5F    xor         eax,eax
 00454C61    pop         edx
 00454C62    pop         ecx
 00454C63    pop         ecx
 00454C64    mov         dword ptr fs:[eax],edx
 00454C67    push        454E22
 00454C6C    mov         eax,dword ptr [ebp-0C]
 00454C6F    call        TObject.Free
 00454C74    ret
>00454C75    jmp         @HandleFinally
>00454C7A    jmp         00454C6C
 00454C7C    mov         esi,dword ptr [ebx+8]
 00454C7F    cmp         dword ptr [esi],1
>00454C82    jne         00454E18
 00454C88    mov         eax,dword ptr [ebp-4]
 00454C8B    cmp         dword ptr [eax+248],0
>00454C92    je          00454E18
 00454C98    mov         edx,dword ptr [esi+8]
 00454C9B    mov         eax,dword ptr [ebp-4]
 00454C9E    mov         eax,dword ptr [eax+248]
 00454CA4    xor         ecx,ecx
 00454CA6    call        TMenu.FindItem
 00454CAB    mov         edi,eax
 00454CAD    test        edi,edi
>00454CAF    je          00454E18
 00454CB5    mov         eax,dword ptr [ebp-4]
 00454CB8    call        TWinControl.GetHandle
 00454CBD    push        eax
 00454CBE    call        user32.GetWindowDC
 00454CC3    mov         dword ptr [ebp-10],eax
 00454CC6    xor         eax,eax
 00454CC8    push        ebp
 00454CC9    push        454DA3
 00454CCE    push        dword ptr fs:[eax]
 00454CD1    mov         dword ptr fs:[eax],esp
 00454CD4    mov         dl,1
 00454CD6    mov         eax,[00436FD4];TControlCanvas
 00454CDB    call        TCanvas.Create
 00454CE0    mov         dword ptr [ebp-0C],eax
 00454CE3    xor         eax,eax
 00454CE5    push        ebp
 00454CE6    push        454D7C
 00454CEB    push        dword ptr fs:[eax]
 00454CEE    mov         dword ptr fs:[eax],esp
 00454CF1    mov         eax,dword ptr [ebp-10]
 00454CF4    push        eax
 00454CF5    call        gdi32.SaveDC
 00454CFA    mov         dword ptr [ebp-8],eax
 00454CFD    xor         eax,eax
 00454CFF    push        ebp
 00454D00    push        454D5F
 00454D05    push        dword ptr fs:[eax]
 00454D08    mov         dword ptr fs:[eax],esp
 00454D0B    mov         edx,dword ptr [ebp-10]
 00454D0E    mov         eax,dword ptr [ebp-0C]
 00454D11    call        TCanvas.SetHandle
 00454D16    mov         eax,[005E0CB0];Screen:TScreen
 00454D1B    mov         edx,dword ptr [eax+88]
 00454D21    mov         eax,dword ptr [ebp-0C]
 00454D24    call        TCanvas.SetFont
 00454D29    lea         eax,[esi+10]
 00454D2C    push        eax
 00454D2D    lea         ecx,[esi+0C]
 00454D30    mov         edx,dword ptr [ebp-0C]
 00454D33    mov         eax,edi
 00454D35    mov         ebx,dword ptr [eax]
 00454D37    call        dword ptr [ebx+38]
 00454D3A    xor         eax,eax
 00454D3C    pop         edx
 00454D3D    pop         ecx
 00454D3E    pop         ecx
 00454D3F    mov         dword ptr fs:[eax],edx
 00454D42    push        454D66
 00454D47    xor         edx,edx
 00454D49    mov         eax,dword ptr [ebp-0C]
 00454D4C    call        TCanvas.SetHandle
 00454D51    mov         eax,dword ptr [ebp-8]
 00454D54    push        eax
 00454D55    mov         eax,dword ptr [ebp-10]
 00454D58    push        eax
 00454D59    call        gdi32.RestoreDC
 00454D5E    ret
>00454D5F    jmp         @HandleFinally
>00454D64    jmp         00454D47
 00454D66    xor         eax,eax
 00454D68    pop         edx
 00454D69    pop         ecx
 00454D6A    pop         ecx
 00454D6B    mov         dword ptr fs:[eax],edx
 00454D6E    push        454D83
 00454D73    mov         eax,dword ptr [ebp-0C]
 00454D76    call        TObject.Free
 00454D7B    ret
>00454D7C    jmp         @HandleFinally
>00454D81    jmp         00454D73
 00454D83    xor         eax,eax
 00454D85    pop         edx
 00454D86    pop         ecx
 00454D87    pop         ecx
 00454D88    mov         dword ptr fs:[eax],edx
 00454D8B    push        454E22
 00454D90    mov         eax,dword ptr [ebp-10]
 00454D93    push        eax
 00454D94    mov         eax,dword ptr [ebp-4]
 00454D97    call        TWinControl.GetHandle
 00454D9C    push        eax
 00454D9D    call        user32.ReleaseDC
 00454DA2    ret
>00454DA3    jmp         @HandleFinally
>00454DA8    jmp         00454D90
 00454DAA    cmp         eax,dword ptr ds:[5E0CB8];RM_TaskbarCreated:DWORD
>00454DB0    jne         00454E18
 00454DB2    push        0
 00454DB4    xor         ecx,ecx
 00454DB6    mov         edx,0B025
 00454DBB    mov         eax,dword ptr [ebp-4]
 00454DBE    call        TControl.Perform
 00454DC3    push        0
 00454DC5    xor         ecx,ecx
 00454DC7    mov         edx,0B024
 00454DCC    mov         eax,dword ptr [ebp-4]
 00454DCF    call        TControl.Perform
 00454DD4    push        0
 00454DD6    xor         ecx,ecx
 00454DD8    mov         edx,0B035
 00454DDD    mov         eax,dword ptr [ebp-4]
 00454DE0    call        TControl.Perform
 00454DE5    push        0
 00454DE7    xor         ecx,ecx
 00454DE9    mov         edx,0B009
 00454DEE    mov         eax,dword ptr [ebp-4]
 00454DF1    call        TControl.Perform
 00454DF6    push        0
 00454DF8    xor         ecx,ecx
 00454DFA    mov         edx,0B008
 00454DFF    mov         eax,dword ptr [ebp-4]
 00454E02    call        TControl.Perform
 00454E07    push        0
 00454E09    xor         ecx,ecx
 00454E0B    mov         edx,0B03D
 00454E10    mov         eax,dword ptr [ebp-4]
 00454E13    call        TControl.Perform
 00454E18    mov         edx,ebx
 00454E1A    mov         eax,dword ptr [ebp-4]
 00454E1D    call        TWinControl.WndProc
 00454E22    pop         edi
 00454E23    pop         esi
 00454E24    pop         ebx
 00454E25    mov         esp,ebp
 00454E27    pop         ebp
 00454E28    ret
*}
end;

//00454E34
procedure Default;
begin
{*
 00454E34    push        ebp
 00454E35    mov         ebp,esp
 00454E37    mov         eax,dword ptr [ebp+8]
 00454E3A    mov         eax,dword ptr [eax-8]
 00454E3D    mov         eax,dword ptr [eax+8]
 00454E40    push        eax
 00454E41    mov         eax,dword ptr [ebp+8]
 00454E44    mov         eax,dword ptr [eax-8]
 00454E47    mov         eax,dword ptr [eax+4]
 00454E4A    push        eax
 00454E4B    mov         eax,dword ptr [ebp+8]
 00454E4E    mov         eax,dword ptr [eax-8]
 00454E51    mov         eax,dword ptr [eax]
 00454E53    push        eax
 00454E54    mov         eax,dword ptr [ebp+8]
 00454E57    mov         eax,dword ptr [eax-4]
 00454E5A    mov         eax,dword ptr [eax+254]
 00454E60    push        eax
 00454E61    mov         eax,dword ptr [ebp+8]
 00454E64    mov         eax,dword ptr [eax-4]
 00454E67    mov         eax,dword ptr [eax+274]
 00454E6D    push        eax
 00454E6E    call        user32.CallWindowProcA
 00454E73    mov         edx,dword ptr [ebp+8]
 00454E76    mov         edx,dword ptr [edx-8]
 00454E79    mov         dword ptr [edx+0C],eax
 00454E7C    pop         ebp
 00454E7D    ret
*}
end;

//00454E80
function MaximizedChildren:Boolean;
begin
{*
 00454E80    push        ebp
 00454E81    mov         ebp,esp
 00454E83    push        ebx
 00454E84    push        esi
 00454E85    mov         eax,dword ptr [ebp+8]
 00454E88    mov         eax,dword ptr [eax-4]
 00454E8B    call        TCustomForm.GetMDIChildCount
 00454E90    mov         ebx,eax
 00454E92    dec         ebx
 00454E93    test        ebx,ebx
>00454E95    jl          00454EB8
 00454E97    inc         ebx
 00454E98    xor         esi,esi
 00454E9A    mov         eax,dword ptr [ebp+8]
 00454E9D    mov         eax,dword ptr [eax-4]
 00454EA0    mov         edx,esi
 00454EA2    call        TCustomForm.GetMDIChildren
 00454EA7    cmp         byte ptr [eax+22B],2
>00454EAE    jne         00454EB4
 00454EB0    mov         al,1
>00454EB2    jmp         00454EBA
 00454EB4    inc         esi
 00454EB5    dec         ebx
>00454EB6    jne         00454E9A
 00454EB8    xor         eax,eax
 00454EBA    pop         esi
 00454EBB    pop         ebx
 00454EBC    pop         ebp
 00454EBD    ret
*}
end;

//00454EC0
procedure TCustomForm.ClientWndProc(var Message:TMessage);
begin
{*
 00454EC0    push        ebp
 00454EC1    mov         ebp,esp
 00454EC3    add         esp,0FFFFFF8C
 00454EC6    mov         dword ptr [ebp-8],edx
 00454EC9    mov         dword ptr [ebp-4],eax
 00454ECC    mov         eax,dword ptr [ebp-8]
 00454ECF    mov         eax,dword ptr [eax]
 00454ED1    sub         eax,0F
>00454ED4    je          00454FDE
 00454EDA    sub         eax,5
>00454EDD    je          00454F14
 00454EDF    sub         eax,2B
>00454EE2    je          00454F97
 00454EE8    sub         eax,45
>00454EEB    jne         00455095
 00454EF1    push        ebp
 00454EF2    call        Default
 00454EF7    pop         ecx
 00454EF8    mov         eax,dword ptr [ebp-8]
 00454EFB    cmp         dword ptr [eax+0C],1
>00454EFF    jne         0045509C
 00454F05    mov         eax,dword ptr [ebp-8]
 00454F08    mov         dword ptr [eax+0C],0FFFFFFFF
>00454F0F    jmp         0045509C
 00454F14    mov         eax,dword ptr [ebp-4]
 00454F17    mov         eax,dword ptr [eax+170]
 00454F1D    call        TBrush.GetHandle
 00454F22    push        eax
 00454F23    lea         edx,[ebp-6C]
 00454F26    mov         eax,dword ptr [ebp-4]
 00454F29    mov         ecx,dword ptr [eax]
 00454F2B    call        dword ptr [ecx+44]
 00454F2E    lea         eax,[ebp-6C]
 00454F31    push        eax
 00454F32    mov         eax,dword ptr [ebp-8]
 00454F35    mov         eax,dword ptr [eax+4]
 00454F38    push        eax
 00454F39    call        user32.FillRect
 00454F3E    mov         eax,dword ptr [ebp-4]
 00454F41    cmp         byte ptr [eax+22F],2
>00454F48    jne         00454F88
 00454F4A    mov         eax,dword ptr [ebp-4]
 00454F4D    cmp         dword ptr [eax+254],0
>00454F54    je          00454F88
 00454F56    lea         eax,[ebp-5C]
 00454F59    push        eax
 00454F5A    mov         eax,dword ptr [ebp-4]
 00454F5D    mov         eax,dword ptr [eax+254]
 00454F63    push        eax
 00454F64    call        user32.GetClientRect
 00454F69    mov         eax,dword ptr [ebp-4]
 00454F6C    mov         eax,dword ptr [eax+170]
 00454F72    call        TBrush.GetHandle
 00454F77    push        eax
 00454F78    lea         eax,[ebp-5C]
 00454F7B    push        eax
 00454F7C    mov         eax,dword ptr [ebp-8]
 00454F7F    mov         eax,dword ptr [eax+4]
 00454F82    push        eax
 00454F83    call        user32.FillRect
 00454F88    mov         eax,dword ptr [ebp-8]
 00454F8B    mov         dword ptr [eax+0C],1
>00454F92    jmp         0045509C
 00454F97    push        ebp
 00454F98    call        Default
 00454F9D    pop         ecx
 00454F9E    mov         eax,dword ptr [ebp-4]
 00454FA1    cmp         byte ptr [eax+22F],2
>00454FA8    jne         0045509C
 00454FAE    mov         eax,dword ptr [ebp-4]
 00454FB1    call        TCustomForm.GetMDIChildCount
 00454FB6    test        eax,eax
>00454FB8    je          00454FC9
 00454FBA    push        ebp
 00454FBB    call        MaximizedChildren
 00454FC0    pop         ecx
 00454FC1    test        al,al
>00454FC3    je          00454FC9
 00454FC5    xor         edx,edx
>00454FC7    jmp         00454FCB
 00454FC9    mov         dl,1
 00454FCB    mov         eax,dword ptr [ebp-4]
 00454FCE    mov         eax,dword ptr [eax+254]
 00454FD4    call        ShowMDIClientEdge
>00454FD9    jmp         0045509C
 00454FDE    mov         eax,dword ptr [ebp-8]
 00454FE1    mov         eax,dword ptr [eax+4]
 00454FE4    mov         dword ptr [ebp-0C],eax
 00454FE7    cmp         dword ptr [ebp-0C],0
>00454FEB    jne         00455006
 00454FED    lea         eax,[ebp-4C]
 00454FF0    push        eax
 00454FF1    mov         eax,dword ptr [ebp-4]
 00454FF4    mov         eax,dword ptr [eax+254]
 00454FFA    push        eax
 00454FFB    call        user32.BeginPaint
 00455000    mov         edx,dword ptr [ebp-8]
 00455003    mov         dword ptr [edx+4],eax
 00455006    xor         eax,eax
 00455008    push        ebp
 00455009    push        45508E
 0045500E    push        dword ptr fs:[eax]
 00455011    mov         dword ptr fs:[eax],esp
 00455014    cmp         dword ptr [ebp-0C],0
>00455018    jne         0045505C
 0045501A    lea         eax,[ebp-5C]
 0045501D    push        eax
 0045501E    mov         eax,dword ptr [ebp-4]
 00455021    mov         eax,dword ptr [eax+254]
 00455027    push        eax
 00455028    call        user32.GetWindowRect
 0045502D    lea         ecx,[ebp-74]
 00455030    lea         edx,[ebp-5C]
 00455033    mov         eax,dword ptr [ebp-4]
 00455036    call        TControl.ScreenToClient
 0045503B    mov         eax,dword ptr [ebp-74]
 0045503E    mov         dword ptr [ebp-5C],eax
 00455041    mov         eax,dword ptr [ebp-70]
 00455044    mov         dword ptr [ebp-58],eax
 00455047    mov         ecx,dword ptr [ebp-58]
 0045504A    neg         ecx
 0045504C    mov         edx,dword ptr [ebp-5C]
 0045504F    neg         edx
 00455051    mov         eax,dword ptr [ebp-8]
 00455054    mov         eax,dword ptr [eax+4]
 00455057    call        MoveWindowOrg
 0045505C    mov         edx,dword ptr [ebp-8]
 0045505F    mov         eax,dword ptr [ebp-4]
 00455062    call        TWinControl.PaintHandler
 00455067    xor         eax,eax
 00455069    pop         edx
 0045506A    pop         ecx
 0045506B    pop         ecx
 0045506C    mov         dword ptr fs:[eax],edx
 0045506F    push        45509C
 00455074    cmp         dword ptr [ebp-0C],0
>00455078    jne         0045508D
 0045507A    lea         eax,[ebp-4C]
 0045507D    push        eax
 0045507E    mov         eax,dword ptr [ebp-4]
 00455081    mov         eax,dword ptr [eax+254]
 00455087    push        eax
 00455088    call        user32.EndPaint
 0045508D    ret
>0045508E    jmp         @HandleFinally
>00455093    jmp         00455074
 00455095    push        ebp
 00455096    call        Default
 0045509B    pop         ecx
 0045509C    mov         esp,ebp
 0045509E    pop         ebp
 0045509F    ret
*}
end;

//004550A0
procedure TCustomForm.AlignControls(AControl:TControl; var Rect:TRect);
begin
{*
 004550A0    push        ebx
 004550A1    push        esi
 004550A2    push        edi
 004550A3    add         esp,0FFFFFFF0
 004550A6    mov         esi,ecx
 004550A8    mov         ebx,eax
 004550AA    mov         ecx,esi
 004550AC    mov         eax,ebx
 004550AE    call        TScrollingWinControl.AlignControls
 004550B3    mov         eax,dword ptr [ebx+254]
 004550B9    test        eax,eax
>004550BB    je          00455104
 004550BD    push        14
 004550BF    mov         ecx,dword ptr [esi+0C]
 004550C2    mov         edi,dword ptr [esi+4]
 004550C5    sub         ecx,edi
 004550C7    push        ecx
 004550C8    mov         ecx,dword ptr [esi+8]
 004550CB    mov         edx,dword ptr [esi]
 004550CD    sub         ecx,edx
 004550CF    push        ecx
 004550D0    push        edi
 004550D1    push        edx
 004550D2    push        1
 004550D4    push        eax
 004550D5    call        user32.SetWindowPos
 004550DA    cmp         byte ptr [ebx+22F],2
>004550E1    jne         00455104
 004550E3    push        esp
 004550E4    mov         eax,dword ptr [ebx+254]
 004550EA    push        eax
 004550EB    call        user32.GetClientRect
 004550F0    test        eax,eax
>004550F2    je          00455104
 004550F4    push        0FF
 004550F6    push        0
 004550F8    mov         eax,dword ptr [ebx+254]
 004550FE    push        eax
 004550FF    call        user32.InvalidateRect
 00455104    add         esp,10
 00455107    pop         edi
 00455108    pop         esi
 00455109    pop         ebx
 0045510A    ret
*}
end;

//0045510C
procedure TCustomForm.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 0045510C    push        ebx
 0045510D    push        esi
 0045510E    push        edi
 0045510F    push        ecx
 00455110    mov         ebx,eax
 00455112    mov         eax,ebx
 00455114    call        TScrollingWinControl.CMBiDiModeChanged
 00455119    mov         eax,ebx
 0045511B    call        TWinControl.HandleAllocated
 00455120    test        al,al
>00455122    je          00455161
 00455124    push        0EC
 00455126    mov         eax,ebx
 00455128    call        TWinControl.GetHandle
 0045512D    push        eax
 0045512E    call        user32.GetWindowLongA
 00455133    and         eax,0FFFFEFFF
 00455138    and         eax,0FFFFDFFF
 0045513D    and         eax,0FFFFBFFF
 00455142    mov         dword ptr [esp],eax
 00455145    mov         edx,esp
 00455147    mov         eax,ebx
 00455149    call        TWinControl.AddBiDiModeExStyle
 0045514E    mov         eax,dword ptr [esp]
 00455151    push        eax
 00455152    push        0EC
 00455154    mov         eax,ebx
 00455156    call        TWinControl.GetHandle
 0045515B    push        eax
 0045515C    call        user32.SetWindowLongA
 00455161    mov         eax,ebx
 00455163    call        TComponent.GetComponentCount
 00455168    mov         edi,eax
 0045516A    dec         edi
 0045516B    test        edi,edi
>0045516D    jl          0045519C
 0045516F    inc         edi
 00455170    xor         esi,esi
 00455172    mov         edx,esi
 00455174    mov         eax,ebx
 00455176    call        TComponent.GetComponent
 0045517B    mov         edx,dword ptr ds:[44A578];TMenu
 00455181    call        @IsClass
 00455186    test        al,al
>00455188    je          00455198
 0045518A    mov         edx,esi
 0045518C    mov         eax,ebx
 0045518E    call        TComponent.GetComponent
 00455193    call        TMenu.ParentBiDiModeChanged
 00455198    inc         esi
 00455199    dec         edi
>0045519A    jne         00455172
 0045519C    pop         edx
 0045519D    pop         edi
 0045519E    pop         esi
 0045519F    pop         ebx
 004551A0    ret
*}
end;

//004551A4
procedure TCustomForm.CMParentBiDiModeChanged(var Message:TMessage);
begin
{*
 004551A4    push        ebp
 004551A5    mov         ebp,esp
 004551A7    push        ecx
 004551A8    mov         dword ptr [ebp-4],eax
 004551AB    mov         eax,dword ptr [ebp-4]
 004551AE    cmp         byte ptr [eax+244],0
>004551B5    jne         00455228
 004551B7    mov         eax,dword ptr [ebp-4]
 004551BA    mov         byte ptr [eax+244],1
 004551C1    xor         edx,edx
 004551C3    push        ebp
 004551C4    push        455221
 004551C9    push        dword ptr fs:[edx]
 004551CC    mov         dword ptr fs:[edx],esp
 004551CF    mov         eax,dword ptr [ebp-4]
 004551D2    cmp         byte ptr [eax+60],0
>004551D6    je          00455209
 004551D8    mov         eax,dword ptr [ebp-4]
 004551DB    mov         eax,dword ptr [eax+30]
 004551DE    test        eax,eax
>004551E0    jne         004551F4
 004551E2    mov         eax,[005E0CAC];Application:TApplication
 004551E7    mov         dl,byte ptr [eax+34]
 004551EA    mov         eax,dword ptr [ebp-4]
 004551ED    mov         ecx,dword ptr [eax]
 004551EF    call        dword ptr [ecx+70]
>004551F2    jmp         004551FF
 004551F4    mov         dl,byte ptr [eax+5F]
 004551F7    mov         eax,dword ptr [ebp-4]
 004551FA    mov         ecx,dword ptr [eax]
 004551FC    call        dword ptr [ecx+70]
 004551FF    mov         dl,1
 00455201    mov         eax,dword ptr [ebp-4]
 00455204    mov         ecx,dword ptr [eax]
 00455206    call        dword ptr [ecx+6C]
 00455209    xor         eax,eax
 0045520B    pop         edx
 0045520C    pop         ecx
 0045520D    pop         ecx
 0045520E    mov         dword ptr fs:[eax],edx
 00455211    push        455228
 00455216    mov         eax,dword ptr [ebp-4]
 00455219    mov         byte ptr [eax+244],0
 00455220    ret
>00455221    jmp         @HandleFinally
>00455226    jmp         00455216
 00455228    pop         ecx
 00455229    pop         ebp
 0045522A    ret
*}
end;

//0045522C
procedure TCustomForm.SetBorderIcons(Value:TBorderIcons);
begin
{*
 0045522C    push        ebx
 0045522D    push        ecx
 0045522E    mov         byte ptr [esp],dl
 00455231    mov         ebx,eax
 00455233    mov         al,byte ptr [esp]
 00455236    cmp         al,byte ptr [ebx+228]
>0045523C    je          00455254
 0045523E    mov         al,byte ptr [esp]
 00455241    mov         byte ptr [ebx+228],al
 00455247    test        byte ptr [ebx+1C],10
>0045524B    jne         00455254
 0045524D    mov         eax,ebx
 0045524F    call        TWinControl.RecreateWnd
 00455254    pop         edx
 00455255    pop         ebx
 00455256    ret
*}
end;

//00455258
procedure TCustomForm.SetBorderStyle(Value:TFormBorderStyle);
begin
{*
 00455258    push        esi
 00455259    mov         esi,eax
 0045525B    cmp         dl,byte ptr [esi+229]
>00455261    je          0045528D
 00455263    mov         eax,edx
 00455265    mov         byte ptr [esi+229],al
 0045526B    sub         al,2
>0045526D    je          00455277
 0045526F    sub         al,3
>00455271    je          00455277
 00455273    xor         edx,edx
>00455275    jmp         00455279
 00455277    mov         dl,1
 00455279    mov         eax,esi
 0045527B    call        TScrollingWinControl.SetAutoScroll
 00455280    test        byte ptr [esi+1C],10
>00455284    jne         0045528D
 00455286    mov         eax,esi
 00455288    call        TWinControl.RecreateWnd
 0045528D    pop         esi
 0045528E    ret
*}
end;

//00455290
procedure TCustomForm.Dock(NewDockSite:TWinControl; ARect:TRect);
begin
{*
 00455290    push        ebx
 00455291    push        esi
 00455292    push        edi
 00455293    add         esp,0FFFFFFF0
 00455296    mov         esi,ecx
 00455298    lea         edi,[esp]
 0045529B    movs        dword ptr [edi],dword ptr [esi]
 0045529C    movs        dword ptr [edi],dword ptr [esi]
 0045529D    movs        dword ptr [edi],dword ptr [esi]
 0045529E    movs        dword ptr [edi],dword ptr [esi]
 0045529F    mov         ebx,eax
 004552A1    mov         edi,dword ptr [ebx+30]
 004552A4    mov         esi,dword ptr [ebx+0A0]
 004552AA    mov         ecx,esp
 004552AC    mov         eax,ebx
 004552AE    call        TControl.Dock
 004552B3    mov         eax,dword ptr [ebx+30]
 004552B6    test        eax,eax
>004552B8    je          004552CD
 004552BA    cmp         edi,eax
>004552BC    jne         004552CD
 004552BE    cmp         esi,dword ptr [ebx+0A0]
>004552C4    je          004552CD
 004552C6    mov         eax,ebx
 004552C8    call        TWinControl.RecreateWnd
 004552CD    add         esp,10
 004552D0    pop         edi
 004552D1    pop         esi
 004552D2    pop         ebx
 004552D3    ret
*}
end;

//004552D4
procedure TCustomForm.DoDock(NewDockSite:TWinControl; var ARect:TRect);
begin
{*
 004552D4    push        ebx
 004552D5    push        esi
 004552D6    push        edi
 004552D7    mov         edi,ecx
 004552D9    mov         esi,edx
 004552DB    mov         ebx,eax
 004552DD    cmp         esi,dword ptr [ebx+0A0]
>004552E3    je          00455319
 004552E5    test        esi,esi
>004552E7    je          004552F4
 004552E9    mov         eax,ebx
 004552EB    mov         edx,dword ptr [eax]
 004552ED    call        dword ptr [edx+54]
 004552F0    test        al,al
>004552F2    je          00455319
 004552F4    test        esi,esi
>004552F6    jne         00455306
 004552F8    mov         al,byte ptr [ebx+280]
 004552FE    mov         byte ptr [ebx+229],al
>00455304    jmp         00455319
 00455306    mov         al,byte ptr [ebx+229]
 0045530C    mov         byte ptr [ebx+280],al
 00455312    mov         byte ptr [ebx+229],0
 00455319    mov         ecx,edi
 0045531B    mov         edx,esi
 0045531D    mov         eax,ebx
 0045531F    call        TControl.DoDock
 00455324    pop         edi
 00455325    pop         esi
 00455326    pop         ebx
 00455327    ret
*}
end;

//00455328
function TCustomForm.GetActiveMDIChild:TForm;
begin
{*
 00455328    push        ebx
 00455329    mov         ebx,eax
 0045532B    xor         eax,eax
 0045532D    cmp         byte ptr [ebx+22F],2
>00455334    jne         00455359
 00455336    cmp         dword ptr [ebx+254],0
>0045533D    je          00455359
 0045533F    push        0
 00455341    push        0
 00455343    push        229
 00455348    mov         eax,dword ptr [ebx+254]
 0045534E    push        eax
 0045534F    call        user32.SendMessageA
 00455354    call        FindControl
 00455359    pop         ebx
 0045535A    ret
*}
end;

//0045535C
function TCustomForm.GetMDIChildCount:Integer;
begin
{*
 0045535C    push        ebx
 0045535D    push        esi
 0045535E    push        edi
 0045535F    xor         edi,edi
 00455361    cmp         byte ptr [eax+22F],2
>00455368    jne         004553A1
 0045536A    cmp         dword ptr [eax+254],0
>00455371    je          004553A1
 00455373    mov         eax,[005E0CB0];Screen:TScreen
 00455378    call        TScreen.GetFormCount
 0045537D    mov         ebx,eax
 0045537F    dec         ebx
 00455380    test        ebx,ebx
>00455382    jl          004553A1
 00455384    inc         ebx
 00455385    xor         esi,esi
 00455387    mov         edx,esi
 00455389    mov         eax,[005E0CB0];Screen:TScreen
 0045538E    call        TScreen.GetForm
 00455393    cmp         byte ptr [eax+22F],1
>0045539A    jne         0045539D
 0045539C    inc         edi
 0045539D    inc         esi
 0045539E    dec         ebx
>0045539F    jne         00455387
 004553A1    mov         eax,edi
 004553A3    pop         edi
 004553A4    pop         esi
 004553A5    pop         ebx
 004553A6    ret
*}
end;

//004553A8
function TCustomForm.GetMDIChildren(I:Integer):TForm;
begin
{*
 004553A8    push        ebx
 004553A9    push        esi
 004553AA    push        edi
 004553AB    mov         edi,edx
 004553AD    cmp         byte ptr [eax+22F],2
>004553B4    jne         004553F1
 004553B6    cmp         dword ptr [eax+254],0
>004553BD    je          004553F1
 004553BF    mov         eax,[005E0CB0];Screen:TScreen
 004553C4    call        TScreen.GetFormCount
 004553C9    mov         ebx,eax
 004553CB    dec         ebx
 004553CC    test        ebx,ebx
>004553CE    jl          004553F1
 004553D0    inc         ebx
 004553D1    xor         esi,esi
 004553D3    mov         edx,esi
 004553D5    mov         eax,[005E0CB0];Screen:TScreen
 004553DA    call        TScreen.GetForm
 004553DF    cmp         byte ptr [eax+22F],1
>004553E6    jne         004553ED
 004553E8    dec         edi
 004553E9    test        edi,edi
>004553EB    jl          004553F3
 004553ED    inc         esi
 004553EE    dec         ebx
>004553EF    jne         004553D3
 004553F1    xor         eax,eax
 004553F3    pop         edi
 004553F4    pop         esi
 004553F5    pop         ebx
 004553F6    ret
*}
end;

//004553F8
function EnumMonitorsProc(hm:HMONITOR; dc:HDC; r:PRect; Data:Pointer):Boolean; stdcall;
begin
{*
 004553F8    push        ebp
 004553F9    mov         ebp,esp
 004553FB    push        ebx
 004553FC    mov         ebx,dword ptr [ebp+14]
 004553FF    mov         dl,1
 00455401    mov         eax,[00451F78];TMonitor
 00455406    call        TObject.Create
 0045540B    mov         edx,dword ptr [ebp+8]
 0045540E    mov         dword ptr [eax+4],edx
 00455411    mov         edx,dword ptr [ebx+8]
 00455414    mov         dword ptr [eax+8],edx
 00455417    mov         edx,eax
 00455419    mov         eax,ebx
 0045541B    call        TList.Add
 00455420    mov         al,1
 00455422    pop         ebx
 00455423    pop         ebp
 00455424    ret         10
*}
end;

//00455428
function TCustomForm.GetMonitor:TMonitor;
begin
{*
 00455428    push        ebx
 00455429    push        esi
 0045542A    push        edi
 0045542B    push        ebp
 0045542C    push        ecx
 0045542D    mov         ebx,eax
 0045542F    mov         ebp,5E0CB0;Screen:TScreen
 00455434    xor         eax,eax
 00455436    mov         dword ptr [esp],eax
 00455439    push        2
 0045543B    mov         eax,ebx
 0045543D    call        TWinControl.GetHandle
 00455442    push        eax
 00455443    mov         eax,[005AE418];^MonitorFromWindow:TMonitorFromWindow
 00455448    mov         eax,dword ptr [eax]
 0045544A    call        eax
 0045544C    mov         edi,eax
 0045544E    mov         eax,dword ptr [ebp]
 00455451    call        TScreen.GetMonitorCount
 00455456    mov         ebx,eax
 00455458    dec         ebx
 00455459    test        ebx,ebx
>0045545B    jl          00455485
 0045545D    inc         ebx
 0045545E    xor         esi,esi
 00455460    mov         edx,esi
 00455462    mov         eax,dword ptr [ebp]
 00455465    call        TScreen.GetMonitor
 0045546A    cmp         edi,dword ptr [eax+4]
>0045546D    jne         00455481
 0045546F    mov         edx,esi
 00455471    mov         eax,dword ptr [ebp]
 00455474    call        TScreen.GetMonitor
 00455479    mov         dword ptr [esp],eax
>0045547C    jmp         00455506
 00455481    inc         esi
 00455482    dec         ebx
>00455483    jne         00455460
 00455485    mov         eax,dword ptr [ebp]
 00455488    call        TScreen.GetMonitorCount
 0045548D    mov         ebx,eax
 0045548F    dec         ebx
 00455490    test        ebx,ebx
>00455492    jl          004554AD
 00455494    inc         ebx
 00455495    xor         esi,esi
 00455497    mov         eax,dword ptr [ebp]
 0045549A    mov         eax,dword ptr [eax+58]
 0045549D    mov         edx,esi
 0045549F    call        TList.Get
 004554A4    call        TObject.Free
 004554A9    inc         esi
 004554AA    dec         ebx
>004554AB    jne         00455497
 004554AD    mov         eax,dword ptr [ebp]
 004554B0    mov         eax,dword ptr [eax+58]
 004554B3    mov         edx,dword ptr [eax]
 004554B5    call        dword ptr [edx+8]
 004554B8    mov         eax,dword ptr [ebp]
 004554BB    mov         eax,dword ptr [eax+58]
 004554BE    push        eax
 004554BF    mov         eax,4553F8;EnumMonitorsProc:Boolean
 004554C4    push        eax
 004554C5    push        0
 004554C7    push        0
 004554C9    mov         eax,[005AE4A0];^EnumDisplayMonitors:TEnumDisplayMonitors
 004554CE    mov         eax,dword ptr [eax]
 004554D0    call        eax
 004554D2    mov         eax,dword ptr [ebp]
 004554D5    call        TScreen.GetMonitorCount
 004554DA    mov         ebx,eax
 004554DC    dec         ebx
 004554DD    test        ebx,ebx
>004554DF    jl          00455506
 004554E1    inc         ebx
 004554E2    xor         esi,esi
 004554E4    mov         edx,esi
 004554E6    mov         eax,dword ptr [ebp]
 004554E9    call        TScreen.GetMonitor
 004554EE    cmp         edi,dword ptr [eax+4]
>004554F1    jne         00455502
 004554F3    mov         edx,esi
 004554F5    mov         eax,dword ptr [ebp]
 004554F8    call        TScreen.GetMonitor
 004554FD    mov         dword ptr [esp],eax
>00455500    jmp         00455506
 00455502    inc         esi
 00455503    dec         ebx
>00455504    jne         004554E4
 00455506    mov         eax,dword ptr [esp]
 00455509    pop         edx
 0045550A    pop         ebp
 0045550B    pop         edi
 0045550C    pop         esi
 0045550D    pop         ebx
 0045550E    ret
*}
end;

//00455510
function TCustomForm.GetCanvas:TCanvas;
begin
{*
 00455510    mov         eax,dword ptr [eax+238]
 00455516    ret
*}
end;

//00455518
procedure TCustomForm.SetIcon(Value:TIcon);
begin
{*
 00455518    mov         eax,dword ptr [eax+240]
 0045551E    mov         ecx,dword ptr [eax]
 00455520    call        dword ptr [ecx+8]
 00455523    ret
*}
end;

//00455524
function TCustomForm.IsForm(Value:TWinControl):Boolean;
begin
{*
 00455524    mov         al,byte ptr [eax+5E]
 00455527    xor         al,1
 00455529    ret
*}
end;

//0045552C
function TCustomForm.IsIconStored(Value:TIcon):Boolean;
begin
{*
 0045552C    push        ebx
 0045552D    mov         ebx,eax
 0045552F    mov         eax,ebx
 00455531    call        TCustomForm.IsForm
 00455536    test        al,al
>00455538    je          00455549
 0045553A    mov         eax,dword ptr [ebx+240]
 00455540    call        TIcon.GetHandle
 00455545    test        eax,eax
>00455547    jne         0045554D
 00455549    xor         eax,eax
 0045554B    pop         ebx
 0045554C    ret
 0045554D    mov         al,1
 0045554F    pop         ebx
 00455550    ret
*}
end;

//00455554
procedure TCustomForm.SetFormStyle(Value:TFormStyle);
begin
{*
 00455554    push        ebx
 00455555    push        esi
 00455556    mov         ebx,edx
 00455558    mov         esi,eax
 0045555A    cmp         bl,byte ptr [esi+22F]
>00455560    je          004555CF
 00455562    cmp         bl,1
>00455565    jne         00455579
 00455567    cmp         byte ptr [esi+230],0
>0045556E    jne         00455579
 00455570    mov         dl,1
 00455572    mov         eax,esi
 00455574    call        TCustomForm.SetPosition
 00455579    test        byte ptr [esi+1C],10
>0045557D    jne         00455586
 0045557F    mov         eax,esi
 00455581    call        TWinControl.DestroyHandle
 00455586    mov         al,byte ptr [esi+22F]
 0045558C    mov         byte ptr [esi+22F],bl
 00455592    cmp         bl,2
>00455595    je          0045559B
 00455597    cmp         al,2
>00455599    jne         004555B4
 0045559B    cmp         byte ptr [esi+1A5],0
>004555A2    jne         004555B4
 004555A4    mov         eax,esi
 004555A6    call        TCustomForm.NormalColor
 004555AB    mov         edx,eax
 004555AD    mov         eax,esi
 004555AF    call        TControl.SetColor
 004555B4    test        byte ptr [esi+1C],10
>004555B8    jne         004555C1
 004555BA    mov         eax,esi
 004555BC    call        TWinControl.UpdateControlState
 004555C1    cmp         bl,1
>004555C4    jne         004555CF
 004555C6    mov         dl,1
 004555C8    mov         eax,esi
 004555CA    call        TCustomForm.SetVisible
 004555CF    pop         esi
 004555D0    pop         ebx
 004555D1    ret
*}
end;

//004555D4
procedure TCustomForm.RefreshMDIMenu;
begin
{*
 004555D4    push        ebx
 004555D5    push        esi
 004555D6    push        edi
 004555D7    push        ebp
 004555D8    mov         ebp,eax
 004555DA    cmp         byte ptr [ebp+22F],2
>004555E1    jne         00455648
 004555E3    cmp         dword ptr [ebp+254],0
>004555EA    je          00455648
 004555EC    xor         esi,esi
 004555EE    mov         eax,dword ptr [ebp+248]
 004555F4    test        eax,eax
>004555F6    je          004555FF
 004555F8    mov         edx,dword ptr [eax]
 004555FA    call        dword ptr [edx+34]
 004555FD    mov         esi,eax
 004555FF    xor         edi,edi
 00455601    mov         eax,dword ptr [ebp+258]
 00455607    test        eax,eax
>00455609    je          00455612
 0045560B    call        TMenuItem.GetHandle
 00455610    mov         edi,eax
 00455612    mov         eax,ebp
 00455614    call        TWinControl.GetHandle
 00455619    push        eax
 0045561A    call        user32.GetMenu
 0045561F    cmp         esi,eax
 00455621    setne       bl
 00455624    push        edi
 00455625    push        esi
 00455626    push        230
 0045562B    mov         eax,dword ptr [ebp+254]
 00455631    push        eax
 00455632    call        user32.SendMessageA
 00455637    test        bl,bl
>00455639    je          00455648
 0045563B    mov         eax,ebp
 0045563D    call        TWinControl.GetHandle
 00455642    push        eax
 00455643    call        user32.DrawMenuBar
 00455648    pop         ebp
 00455649    pop         edi
 0045564A    pop         esi
 0045564B    pop         ebx
 0045564C    ret
*}
end;

//00455650
procedure TCustomForm.SetObjectMenuItem(Value:TMenuItem);
begin
{*
 00455650    push        ebx
 00455651    mov         ebx,edx
 00455653    mov         dword ptr [eax+260],ebx
 00455659    test        ebx,ebx
>0045565B    je          0045566F
 0045565D    mov         edx,eax
 0045565F    mov         eax,ebx
 00455661    call        TComponent.FreeNotification
 00455666    xor         edx,edx
 00455668    mov         eax,ebx
 0045566A    call        TMenuItem.SetEnabled
 0045566F    pop         ebx
 00455670    ret
*}
end;

//00455674
procedure TCustomForm.SetWindowMenu(Value:TMenuItem);
begin
{*
 00455674    push        ebx
 00455675    mov         ebx,eax
 00455677    cmp         edx,dword ptr [ebx+258]
>0045567D    je          00455699
 0045567F    mov         dword ptr [ebx+258],edx
 00455685    test        edx,edx
>00455687    je          00455692
 00455689    mov         eax,edx
 0045568B    mov         edx,ebx
 0045568D    call        TComponent.FreeNotification
 00455692    mov         eax,ebx
 00455694    call        TCustomForm.RefreshMDIMenu
 00455699    pop         ebx
 0045569A    ret
*}
end;

//0045569C
procedure TCustomForm.SetMenu(Value:TMainMenu);
begin
{*
 0045569C    push        ebp
 0045569D    mov         ebp,esp
 0045569F    add         esp,0FFFFFFF0
 004556A2    push        ebx
 004556A3    push        esi
 004556A4    push        edi
 004556A5    xor         ecx,ecx
 004556A7    mov         dword ptr [ebp-10],ecx
 004556AA    mov         esi,edx
 004556AC    mov         ebx,eax
 004556AE    xor         eax,eax
 004556B0    push        ebp
 004556B1    push        455862
 004556B6    push        dword ptr fs:[eax]
 004556B9    mov         dword ptr fs:[eax],esp
 004556BC    test        esi,esi
>004556BE    je          00455730
 004556C0    mov         eax,[005E0CB0];Screen:TScreen
 004556C5    call        TScreen.GetFormCount
 004556CA    dec         eax
 004556CB    test        eax,eax
>004556CD    jl          00455730
 004556CF    inc         eax
 004556D0    mov         dword ptr [ebp-4],eax
 004556D3    xor         edi,edi
 004556D5    mov         edx,edi
 004556D7    mov         eax,[005E0CB0];Screen:TScreen
 004556DC    call        TScreen.GetForm
 004556E1    cmp         esi,dword ptr [eax+248]
>004556E7    jne         0045572A
 004556E9    mov         edx,edi
 004556EB    mov         eax,[005E0CB0];Screen:TScreen
 004556F0    call        TScreen.GetForm
 004556F5    cmp         ebx,eax
>004556F7    je          0045572A
 004556F9    mov         eax,dword ptr [esi+8]
 004556FC    mov         dword ptr [ebp-0C],eax
 004556FF    mov         byte ptr [ebp-8],0B
 00455703    lea         eax,[ebp-0C]
 00455706    push        eax
 00455707    push        0
 00455709    lea         edx,[ebp-10]
 0045570C    mov         eax,[005AE2A8];^SDuplicateMenus:TResStringRec
 00455711    call        LoadStr
 00455716    mov         ecx,dword ptr [ebp-10]
 00455719    mov         dl,1
 0045571B    mov         eax,[00417C8C];EInvalidOperation
 00455720    call        Exception.CreateFmt
 00455725    call        @RaiseExcept
 0045572A    inc         edi
 0045572B    dec         dword ptr [ebp-4]
>0045572E    jne         004556D5
 00455730    mov         eax,dword ptr [ebx+248]
 00455736    test        eax,eax
>00455738    je          00455741
 0045573A    xor         edx,edx
 0045573C    call        TMenu.SetWindowHandle
 00455741    test        byte ptr [ebx+1C],8
>00455745    jne         00455751
 00455747    test        esi,esi
>00455749    je          00455753
 0045574B    test        byte ptr [esi+1C],8
>0045574F    je          00455753
 00455751    xor         esi,esi
 00455753    mov         dword ptr [ebx+248],esi
 00455759    test        esi,esi
>0045575B    je          00455766
 0045575D    mov         edx,ebx
 0045575F    mov         eax,esi
 00455761    call        TComponent.FreeNotification
 00455766    test        esi,esi
>00455768    je          00455819
 0045576E    test        byte ptr [ebx+1C],10
>00455772    jne         00455781
 00455774    cmp         byte ptr [ebx+229],3
>0045577B    je          00455819
 00455781    mov         eax,dword ptr [ebx+248]
 00455787    cmp         byte ptr [eax+5C],0
>0045578B    jne         00455796
 0045578D    cmp         byte ptr [ebx+22F],1
>00455794    jne         0045579C
 00455796    test        byte ptr [ebx+1C],10
>0045579A    je          004557F4
 0045579C    mov         eax,ebx
 0045579E    call        TWinControl.HandleAllocated
 004557A3    test        al,al
>004557A5    je          00455833
 004557AB    mov         eax,dword ptr [ebx+248]
 004557B1    mov         edx,dword ptr [eax]
 004557B3    call        dword ptr [edx+34]
 004557B6    mov         edi,eax
 004557B8    mov         eax,ebx
 004557BA    call        TWinControl.GetHandle
 004557BF    push        eax
 004557C0    call        user32.GetMenu
 004557C5    cmp         edi,eax
>004557C7    je          004557E2
 004557C9    mov         eax,dword ptr [ebx+248]
 004557CF    mov         edx,dword ptr [eax]
 004557D1    call        dword ptr [edx+34]
 004557D4    push        eax
 004557D5    mov         eax,ebx
 004557D7    call        TWinControl.GetHandle
 004557DC    push        eax
 004557DD    call        user32.SetMenu
 004557E2    mov         eax,ebx
 004557E4    call        TWinControl.GetHandle
 004557E9    mov         edx,eax
 004557EB    mov         eax,esi
 004557ED    call        TMenu.SetWindowHandle
>004557F2    jmp         00455833
 004557F4    cmp         byte ptr [ebx+22F],1
>004557FB    je          00455833
 004557FD    mov         eax,ebx
 004557FF    call        TWinControl.HandleAllocated
 00455804    test        al,al
>00455806    je          00455833
 00455808    push        0
 0045580A    mov         eax,ebx
 0045580C    call        TWinControl.GetHandle
 00455811    push        eax
 00455812    call        user32.SetMenu
>00455817    jmp         00455833
 00455819    mov         eax,ebx
 0045581B    call        TWinControl.HandleAllocated
 00455820    test        al,al
>00455822    je          00455833
 00455824    push        0
 00455826    mov         eax,ebx
 00455828    call        TWinControl.GetHandle
 0045582D    push        eax
 0045582E    call        user32.SetMenu
 00455833    cmp         byte ptr [ebx+22E],0
>0045583A    je          00455845
 0045583C    mov         dl,1
 0045583E    mov         eax,ebx
 00455840    call        TCustomForm.MergeMenu
 00455845    mov         eax,ebx
 00455847    call        TCustomForm.RefreshMDIMenu
 0045584C    xor         eax,eax
 0045584E    pop         edx
 0045584F    pop         ecx
 00455850    pop         ecx
 00455851    mov         dword ptr fs:[eax],edx
 00455854    push        455869
 00455859    lea         eax,[ebp-10]
 0045585C    call        @LStrClr
 00455861    ret
>00455862    jmp         @HandleFinally
>00455867    jmp         00455859
 00455869    pop         edi
 0045586A    pop         esi
 0045586B    pop         ebx
 0045586C    mov         esp,ebp
 0045586E    pop         ebp
 0045586F    ret
*}
end;

//00455870
function TCustomForm.GetPixelsPerInch:Integer;
begin
{*
 00455870    mov         eax,dword ptr [eax+25C]
 00455876    test        eax,eax
>00455878    jne         00455882
 0045587A    mov         eax,[005E0CB0];Screen:TScreen
 0045587F    mov         eax,dword ptr [eax+40]
 00455882    ret
*}
end;

//00455884
procedure TCustomForm.SetPixelsPerInch(Value:Integer);
begin
{*
 00455884    push        ebx
 00455885    push        esi
 00455886    mov         esi,edx
 00455888    mov         ebx,eax
 0045588A    mov         eax,ebx
 0045588C    call        TCustomForm.GetPixelsPerInch
 00455891    cmp         esi,eax
>00455893    je          004558B3
 00455895    test        esi,esi
>00455897    je          0045589E
 00455899    cmp         esi,24
>0045589C    jl          004558B3
 0045589E    test        byte ptr [ebx+1C],1
>004558A2    je          004558AD
 004558A4    cmp         dword ptr [ebx+25C],0
>004558AB    je          004558B3
 004558AD    mov         dword ptr [ebx+25C],esi
 004558B3    pop         esi
 004558B4    pop         ebx
 004558B5    ret
*}
end;

//004558B8
procedure TCustomForm.SetPosition(Value:TPosition);
begin
{*
 004558B8    cmp         dl,byte ptr [eax+230]
>004558BE    je          004558D1
 004558C0    mov         byte ptr [eax+230],dl
 004558C6    test        byte ptr [eax+1C],10
>004558CA    jne         004558D1
 004558CC    call        TWinControl.RecreateWnd
 004558D1    ret
*}
end;

//004558D4
function TCustomForm.GetScaled:Boolean;
begin
{*
 004558D4    cmp         dword ptr [eax+25C],0
 004558DB    setne       al
 004558DE    ret
*}
end;

//004558E0
procedure TCustomForm.SetScaled(Value:Boolean);
begin
{*
 004558E0    push        ebx
 004558E1    push        esi
 004558E2    mov         ebx,edx
 004558E4    mov         esi,eax
 004558E6    mov         eax,esi
 004558E8    call        TCustomForm.GetScaled
 004558ED    cmp         bl,al
>004558EF    je          0045590B
 004558F1    xor         eax,eax
 004558F3    mov         dword ptr [esi+25C],eax
 004558F9    test        bl,bl
>004558FB    je          0045590B
 004558FD    mov         eax,[005E0CB0];Screen:TScreen
 00455902    mov         eax,dword ptr [eax+40]
 00455905    mov         dword ptr [esi+25C],eax
 0045590B    pop         esi
 0045590C    pop         ebx
 0045590D    ret
*}
end;

//00455910
procedure TCustomForm.CMColorChanged(var Message:TMessage);
begin
{*
 00455910    push        ebx
 00455911    mov         ebx,eax
 00455913    mov         eax,ebx
 00455915    call        TWinControl.CMColorChanged
 0045591A    mov         eax,dword ptr [ebx+238]
 00455920    test        eax,eax
>00455922    je          0045592F
 00455924    mov         eax,dword ptr [eax+14]
 00455927    mov         edx,dword ptr [ebx+70]
 0045592A    call        TBrush.SetColor
 0045592F    pop         ebx
 00455930    ret
*}
end;

//00455934
function TCustomForm.NormalColor:TColor;
begin
{*
 00455934    mov         edx,0FF000005
 00455939    cmp         byte ptr [eax+22F],2
>00455940    jne         00455947
 00455942    mov         edx,0FF00000C
 00455947    mov         eax,edx
 00455949    ret
*}
end;

//0045594C
procedure TCustomForm.CMCtl3DChanged(var Message:TMessage);
begin
{*
 0045594C    push        ebx
 0045594D    mov         ebx,eax
 0045594F    mov         eax,ebx
 00455951    call        TWinControl.CMCtl3DChanged
 00455956    cmp         byte ptr [ebx+1A5],0
>0045595D    je          00455979
 0045595F    mov         eax,ebx
 00455961    call        TCustomForm.NormalColor
 00455966    cmp         eax,dword ptr [ebx+70]
>00455969    jne         00455992
 0045596B    mov         edx,0FF00000F
 00455970    mov         eax,ebx
 00455972    call        TControl.SetColor
 00455977    pop         ebx
 00455978    ret
 00455979    cmp         dword ptr [ebx+70],0FF00000F
>00455980    jne         00455992
 00455982    mov         eax,ebx
 00455984    call        TCustomForm.NormalColor
 00455989    mov         edx,eax
 0045598B    mov         eax,ebx
 0045598D    call        TControl.SetColor
 00455992    pop         ebx
 00455993    ret
*}
end;

//00455994
procedure TCustomForm.CMFontChanged(var Message:TMessage);
begin
{*
 00455994    push        ebx
 00455995    mov         ebx,eax
 00455997    mov         eax,ebx
 00455999    call        TWinControl.CMFontChanged
 0045599E    mov         eax,dword ptr [ebx+238]
 004559A4    test        eax,eax
>004559A6    je          004559B0
 004559A8    mov         edx,dword ptr [ebx+68]
 004559AB    call        TCanvas.SetFont
 004559B0    pop         ebx
 004559B1    ret
*}
end;

//004559B4
procedure TCustomForm.CMMenuChanged(var Message:TMessage);
begin
{*
 004559B4    push        ebx
 004559B5    mov         ebx,eax
 004559B7    mov         eax,ebx
 004559B9    call        TCustomForm.RefreshMDIMenu
 004559BE    mov         edx,dword ptr [ebx+248]
 004559C4    mov         eax,ebx
 004559C6    call        TCustomForm.SetMenu
 004559CB    pop         ebx
 004559CC    ret
*}
end;

//004559D0
procedure TCustomForm.SetWindowState(Value:TWindowState);
begin
{*
 004559D0    push        ebx
 004559D1    push        esi
 004559D2    mov         ebx,edx
 004559D4    mov         esi,eax
 004559D6    cmp         bl,byte ptr [esi+22B]
>004559DC    je          00455A0C
 004559DE    mov         byte ptr [esi+22B],bl
 004559E4    test        byte ptr [esi+1C],10
>004559E8    jne         00455A0C
 004559EA    cmp         byte ptr [esi+1A6],0
>004559F1    je          00455A0C
 004559F3    xor         eax,eax
 004559F5    mov         al,bl
 004559F7    mov         eax,dword ptr [eax*4+5ACE10]
 004559FE    push        eax
 004559FF    mov         eax,esi
 00455A01    call        TWinControl.GetHandle
 00455A06    push        eax
 00455A07    call        user32.ShowWindow
 00455A0C    pop         esi
 00455A0D    pop         ebx
 00455A0E    ret
*}
end;

//00455A10
procedure TCustomForm.SetWindowToMonitor;
begin
{*
 00455A10    push        ebx
 00455A11    push        esi
 00455A12    push        edi
 00455A13    push        ebp
 00455A14    add         esp,0FFFFFFEC
 00455A17    mov         ebx,eax
 00455A19    mov         al,byte ptr [ebx+231]
 00455A1F    test        al,al
>00455A21    je          00455D5C
 00455A27    mov         edx,dword ptr ds:[5E0CAC];Application:TApplication
 00455A2D    cmp         dword ptr [edx+44],0
>00455A31    je          00455D5C
 00455A37    xor         edx,edx
 00455A39    mov         dword ptr [esp],edx
 00455A3C    cmp         al,2
>00455A3E    jne         00455A55
 00455A40    mov         eax,[005E0CAC];Application:TApplication
 00455A45    mov         eax,dword ptr [eax+44]
 00455A48    call        TCustomForm.GetMonitor
 00455A4D    mov         eax,dword ptr [eax+4]
 00455A50    mov         dword ptr [esp],eax
>00455A53    jmp         00455A96
 00455A55    mov         al,byte ptr [ebx+231]
 00455A5B    cmp         al,3
>00455A5D    jne         00455A80
 00455A5F    mov         edx,dword ptr ds:[5E0CB0];Screen:TScreen
 00455A65    cmp         dword ptr [edx+68],0
>00455A69    je          00455A80
 00455A6B    mov         eax,[005E0CB0];Screen:TScreen
 00455A70    mov         eax,dword ptr [eax+68]
 00455A73    call        TCustomForm.GetMonitor
 00455A78    mov         eax,dword ptr [eax+4]
 00455A7B    mov         dword ptr [esp],eax
>00455A7E    jmp         00455A96
 00455A80    cmp         al,1
>00455A82    jne         00455A96
 00455A84    xor         edx,edx
 00455A86    mov         eax,[005E0CB0];Screen:TScreen
 00455A8B    call        TScreen.GetMonitor
 00455A90    mov         eax,dword ptr [eax+4]
 00455A93    mov         dword ptr [esp],eax
 00455A96    mov         eax,ebx
 00455A98    call        TCustomForm.GetMonitor
 00455A9D    mov         eax,dword ptr [eax+4]
 00455AA0    mov         dword ptr [esp+4],eax
 00455AA4    mov         eax,[005E0CB0];Screen:TScreen
 00455AA9    call        TScreen.GetMonitorCount
 00455AAE    dec         eax
 00455AAF    test        eax,eax
>00455AB1    jl          00455D5C
 00455AB7    inc         eax
 00455AB8    mov         dword ptr [esp+10],eax
 00455ABC    xor         esi,esi
 00455ABE    mov         edx,esi
 00455AC0    mov         eax,[005E0CB0];Screen:TScreen
 00455AC5    call        TScreen.GetMonitor
 00455ACA    mov         eax,dword ptr [eax+4]
 00455ACD    cmp         eax,dword ptr [esp]
>00455AD0    jne         00455D51
 00455AD6    mov         eax,dword ptr [esp]
 00455AD9    cmp         eax,dword ptr [esp+4]
>00455ADD    je          00455D51
 00455AE3    mov         eax,[005E0CB0];Screen:TScreen
 00455AE8    call        TScreen.GetMonitorCount
 00455AED    mov         edi,eax
 00455AEF    dec         edi
 00455AF0    test        edi,edi
>00455AF2    jl          00455D51
 00455AF8    inc         edi
 00455AF9    mov         dword ptr [esp+8],0
 00455B01    mov         edx,dword ptr [esp+8]
 00455B05    mov         eax,[005E0CB0];Screen:TScreen
 00455B0A    call        TScreen.GetMonitor
 00455B0F    mov         eax,dword ptr [eax+4]
 00455B12    cmp         eax,dword ptr [esp+4]
>00455B16    jne         00455D46
 00455B1C    mov         al,byte ptr [ebx+230]
 00455B22    cmp         al,4
>00455B24    jne         00455BA0
 00455B26    mov         eax,dword ptr [ebx+48]
 00455B29    push        eax
 00455B2A    mov         ebp,dword ptr [ebx+4C]
 00455B2D    push        ebp
 00455B2E    mov         edx,esi
 00455B30    mov         eax,[005E0CB0];Screen:TScreen
 00455B35    call        TScreen.GetMonitor
 00455B3A    call        TMonitor.GetTop
 00455B3F    push        eax
 00455B40    mov         edx,esi
 00455B42    mov         eax,[005E0CB0];Screen:TScreen
 00455B47    call        TScreen.GetMonitor
 00455B4C    call        TMonitor.GetHeight
 00455B51    sub         eax,ebp
 00455B53    sar         eax,1
>00455B55    jns         00455B5A
 00455B57    adc         eax,0
 00455B5A    pop         edx
 00455B5B    add         edx,eax
 00455B5D    push        edx
 00455B5E    mov         edx,esi
 00455B60    mov         eax,[005E0CB0];Screen:TScreen
 00455B65    call        TScreen.GetMonitor
 00455B6A    call        TMonitor.GetLeft
 00455B6F    mov         ebp,eax
 00455B71    mov         edx,esi
 00455B73    mov         eax,[005E0CB0];Screen:TScreen
 00455B78    call        TScreen.GetMonitor
 00455B7D    call        TMonitor.GetWidth
 00455B82    sub         eax,dword ptr [ebx+48]
 00455B85    sar         eax,1
>00455B87    jns         00455B8C
 00455B89    adc         eax,0
 00455B8C    add         ebp,eax
 00455B8E    mov         edx,ebp
 00455B90    mov         eax,ebx
 00455B92    pop         ecx
 00455B93    mov         ebp,dword ptr [eax]
 00455B95    call        dword ptr [ebp+84]
>00455B9B    jmp         00455D46
 00455BA0    cmp         al,6
>00455BA2    jne         00455C1E
 00455BA4    mov         eax,dword ptr [ebx+48]
 00455BA7    push        eax
 00455BA8    mov         ebp,dword ptr [ebx+4C]
 00455BAB    push        ebp
 00455BAC    mov         edx,esi
 00455BAE    mov         eax,[005E0CB0];Screen:TScreen
 00455BB3    call        TScreen.GetMonitor
 00455BB8    call        TMonitor.GetTop
 00455BBD    push        eax
 00455BBE    mov         edx,esi
 00455BC0    mov         eax,[005E0CB0];Screen:TScreen
 00455BC5    call        TScreen.GetMonitor
 00455BCA    call        TMonitor.GetHeight
 00455BCF    sub         eax,ebp
 00455BD1    sar         eax,1
>00455BD3    jns         00455BD8
 00455BD5    adc         eax,0
 00455BD8    pop         edx
 00455BD9    add         edx,eax
 00455BDB    push        edx
 00455BDC    mov         edx,esi
 00455BDE    mov         eax,[005E0CB0];Screen:TScreen
 00455BE3    call        TScreen.GetMonitor
 00455BE8    call        TMonitor.GetLeft
 00455BED    mov         ebp,eax
 00455BEF    mov         edx,esi
 00455BF1    mov         eax,[005E0CB0];Screen:TScreen
 00455BF6    call        TScreen.GetMonitor
 00455BFB    call        TMonitor.GetWidth
 00455C00    sub         eax,dword ptr [ebx+48]
 00455C03    sar         eax,1
>00455C05    jns         00455C0A
 00455C07    adc         eax,0
 00455C0A    add         ebp,eax
 00455C0C    mov         edx,ebp
 00455C0E    mov         eax,ebx
 00455C10    pop         ecx
 00455C11    mov         ebp,dword ptr [eax]
 00455C13    call        dword ptr [ebp+84]
>00455C19    jmp         00455D46
 00455C1E    mov         edx,esi
 00455C20    mov         eax,[005E0CB0];Screen:TScreen
 00455C25    call        TScreen.GetMonitor
 00455C2A    call        TMonitor.GetLeft
 00455C2F    mov         ebp,eax
 00455C31    add         ebp,dword ptr [ebx+40]
 00455C34    mov         edx,dword ptr [esp+8]
 00455C38    mov         eax,[005E0CB0];Screen:TScreen
 00455C3D    call        TScreen.GetMonitor
 00455C42    call        TMonitor.GetLeft
 00455C47    sub         ebp,eax
 00455C49    mov         edx,esi
 00455C4B    mov         eax,[005E0CB0];Screen:TScreen
 00455C50    call        TScreen.GetMonitor
 00455C55    call        TMonitor.GetLeft
 00455C5A    push        eax
 00455C5B    mov         edx,esi
 00455C5D    mov         eax,[005E0CB0];Screen:TScreen
 00455C62    call        TScreen.GetMonitor
 00455C67    call        TMonitor.GetWidth
 00455C6C    pop         edx
 00455C6D    add         edx,eax
 00455C6F    mov         eax,dword ptr [ebx+48]
 00455C72    add         eax,ebp
 00455C74    cmp         edx,eax
>00455C76    jge         00455CA1
 00455C78    mov         edx,esi
 00455C7A    mov         eax,[005E0CB0];Screen:TScreen
 00455C7F    call        TScreen.GetMonitor
 00455C84    call        TMonitor.GetLeft
 00455C89    mov         ebp,eax
 00455C8B    mov         edx,esi
 00455C8D    mov         eax,[005E0CB0];Screen:TScreen
 00455C92    call        TScreen.GetMonitor
 00455C97    call        TMonitor.GetWidth
 00455C9C    add         ebp,eax
 00455C9E    sub         ebp,dword ptr [ebx+48]
 00455CA1    mov         edx,esi
 00455CA3    mov         eax,[005E0CB0];Screen:TScreen
 00455CA8    call        TScreen.GetMonitor
 00455CAD    call        TMonitor.GetTop
 00455CB2    add         eax,dword ptr [ebx+44]
 00455CB5    push        eax
 00455CB6    mov         edx,dword ptr [esp+0C]
 00455CBA    mov         eax,[005E0CB0];Screen:TScreen
 00455CBF    call        TScreen.GetMonitor
 00455CC4    call        TMonitor.GetTop
 00455CC9    pop         edx
 00455CCA    sub         edx,eax
 00455CCC    mov         dword ptr [esp+0C],edx
 00455CD0    mov         edx,esi
 00455CD2    mov         eax,[005E0CB0];Screen:TScreen
 00455CD7    call        TScreen.GetMonitor
 00455CDC    call        TMonitor.GetTop
 00455CE1    push        eax
 00455CE2    mov         edx,esi
 00455CE4    mov         eax,[005E0CB0];Screen:TScreen
 00455CE9    call        TScreen.GetMonitor
 00455CEE    call        TMonitor.GetHeight
 00455CF3    pop         edx
 00455CF4    add         edx,eax
 00455CF6    mov         eax,dword ptr [esp+0C]
 00455CFA    add         eax,dword ptr [ebx+4C]
 00455CFD    cmp         edx,eax
>00455CFF    jge         00455D2E
 00455D01    mov         edx,esi
 00455D03    mov         eax,[005E0CB0];Screen:TScreen
 00455D08    call        TScreen.GetMonitor
 00455D0D    call        TMonitor.GetTop
 00455D12    push        eax
 00455D13    mov         edx,esi
 00455D15    mov         eax,[005E0CB0];Screen:TScreen
 00455D1A    call        TScreen.GetMonitor
 00455D1F    call        TMonitor.GetHeight
 00455D24    pop         edx
 00455D25    add         edx,eax
 00455D27    sub         edx,dword ptr [ebx+4C]
 00455D2A    mov         dword ptr [esp+0C],edx
 00455D2E    mov         eax,dword ptr [ebx+48]
 00455D31    push        eax
 00455D32    mov         eax,dword ptr [ebx+4C]
 00455D35    push        eax
 00455D36    mov         ecx,dword ptr [esp+14]
 00455D3A    mov         edx,ebp
 00455D3C    mov         eax,ebx
 00455D3E    mov         ebp,dword ptr [eax]
 00455D40    call        dword ptr [ebp+84]
 00455D46    inc         dword ptr [esp+8]
 00455D4A    dec         edi
>00455D4B    jne         00455B01
 00455D51    inc         esi
 00455D52    dec         dword ptr [esp+10]
>00455D56    jne         00455ABE
 00455D5C    add         esp,14
 00455D5F    pop         ebp
 00455D60    pop         edi
 00455D61    pop         esi
 00455D62    pop         ebx
 00455D63    ret
*}
end;

//00455D64
procedure TCustomForm.CreateParams(var Params:TCreateParams);
begin
{*
 00455D64    push        ebx
 00455D65    push        esi
 00455D66    push        edi
 00455D67    push        ecx
 00455D68    mov         esi,edx
 00455D6A    mov         edi,eax
 00455D6C    mov         edx,esi
 00455D6E    mov         eax,edi
 00455D70    call        TScrollingWinControl.CreateParams
 00455D75    mov         edx,esi
 00455D77    mov         eax,edi
 00455D79    call        TCustomForm.InitAlphaBlending
 00455D7E    cmp         dword ptr [edi+30],0
>00455D82    jne         00455D9F
 00455D84    cmp         dword ptr [edi+190],0
>00455D8B    jne         00455D9F
 00455D8D    mov         eax,[005E0CAC];Application:TApplication
 00455D92    mov         eax,dword ptr [eax+30]
 00455D95    mov         dword ptr [esi+1C],eax
 00455D98    and         dword ptr [esi+4],0BFFCFFFF
 00455D9F    mov         dword ptr [esi+24],8
 00455DA6    test        byte ptr [edi+1C],10
>00455DAA    je          00455DBE
 00455DAC    cmp         dword ptr [edi+30],0
>00455DB0    jne         00455DBE
 00455DB2    or          dword ptr [esi+4],0CF0000
>00455DB9    jmp         00455F6F
 00455DBE    mov         al,byte ptr [edi+230]
 00455DC4    dec         eax
 00455DC5    sub         al,2
>00455DC7    jae         00455DD7
 00455DC9    mov         dword ptr [esi+0C],80000000
 00455DD0    mov         dword ptr [esi+10],80000000
 00455DD7    mov         bl,byte ptr [edi+228]
 00455DDD    mov         al,byte ptr [edi+229]
 00455DE3    mov         byte ptr [esp],al
 00455DE6    cmp         byte ptr [edi+22F],1
>00455DED    jne         00455DFE
 00455DEF    mov         al,byte ptr [esp]
 00455DF2    test        al,al
>00455DF4    je          00455DFA
 00455DF6    sub         al,3
>00455DF8    jne         00455DFE
 00455DFA    mov         byte ptr [esp],2
 00455DFE    xor         eax,eax
 00455E00    mov         al,byte ptr [esp]
 00455E03    cmp         eax,5
>00455E06    ja          00455EC2
 00455E0C    jmp         dword ptr [eax*4+455E13]
 00455E0C    dd          00455E2B
 00455E0C    dd          00455E49
 00455E0C    dd          00455E52
 00455E0C    dd          00455E77
 00455E0C    dd          00455E49
 00455E0C    dd          00455E52
 00455E2B    cmp         dword ptr [edi+30],0
>00455E2F    jne         00455E41
 00455E31    cmp         dword ptr [edi+190],0
>00455E38    jne         00455E41
 00455E3A    or          dword ptr [esi+4],80000000
 00455E41    mov         bl,byte ptr ds:[455F74]
>00455E47    jmp         00455EC2
 00455E49    or          dword ptr [esi+4],0C00000
>00455E50    jmp         00455EC2
 00455E52    or          dword ptr [esi+4],0C40000
 00455E59    mov         al,byte ptr [edi+230]
 00455E5F    sub         al,1
>00455E61    je          00455E67
 00455E63    sub         al,2
>00455E65    jne         00455EC2
 00455E67    mov         dword ptr [esi+14],80000000
 00455E6E    mov         dword ptr [esi+18],80000000
>00455E75    jmp         00455EC2
 00455E77    mov         eax,dword ptr [esi+4]
 00455E7A    or          eax,80000000
 00455E7F    or          eax,0C00000
 00455E84    mov         dword ptr [esi+4],eax
 00455E87    mov         dword ptr [esi+8],101
 00455E8E    lea         edx,[esi+8]
 00455E91    mov         eax,edi
 00455E93    call        TWinControl.AddBiDiModeExStyle
 00455E98    mov         eax,[005AE3F0];^NewStyleControls:Boolean
 00455E9D    cmp         byte ptr [eax],0
>00455EA0    jne         00455EB2
 00455EA2    mov         eax,dword ptr [esi+4]
 00455EA5    or          eax,400000
 00455EAA    or          eax,80
 00455EAF    mov         dword ptr [esi+4],eax
 00455EB2    mov         al,[00455F78]
 00455EB7    and         al,bl
 00455EB9    mov         ebx,eax
 00455EBB    mov         dword ptr [esi+24],2808
 00455EC2    mov         al,byte ptr [esp]
 00455EC5    add         al,0FC
 00455EC7    sub         al,2
>00455EC9    jae         00455EE5
 00455ECB    mov         dword ptr [esi+8],80
 00455ED2    lea         edx,[esi+8]
 00455ED5    mov         eax,edi
 00455ED7    call        TWinControl.AddBiDiModeExStyle
 00455EDC    mov         al,[00455F7C]
 00455EE1    and         al,bl
 00455EE3    mov         ebx,eax
 00455EE5    mov         al,byte ptr [esp]
 00455EE8    sub         al,3
>00455EEA    jae         00455F32
 00455EEC    cmp         byte ptr [edi+22F],1
>00455EF3    jne         00455EFA
 00455EF5    test        bl,1
>00455EF8    je          00455F12
 00455EFA    test        bl,2
>00455EFD    je          00455F06
 00455EFF    or          dword ptr [esi+4],20000
 00455F06    test        bl,4
>00455F09    je          00455F12
 00455F0B    or          dword ptr [esi+4],10000
 00455F12    mov         al,byte ptr [edi+22B]
 00455F18    cmp         al,1
>00455F1A    jne         00455F25
 00455F1C    or          dword ptr [esi+4],20000000
>00455F23    jmp         00455F39
 00455F25    cmp         al,2
>00455F27    jne         00455F39
 00455F29    or          dword ptr [esi+4],1000000
>00455F30    jmp         00455F39
 00455F32    mov         byte ptr [edi+22B],0
 00455F39    test        bl,1
>00455F3C    je          00455F45
 00455F3E    or          dword ptr [esi+4],80000
 00455F45    test        bl,8
>00455F48    je          00455F51
 00455F4A    or          dword ptr [esi+8],400
 00455F51    test        byte ptr [edi+1D],2
>00455F55    je          00455F5E
 00455F57    and         dword ptr [esi+4],0FF3FFFFF
 00455F5E    cmp         byte ptr [edi+22F],1
>00455F65    jne         00455F6F
 00455F67    mov         eax,406FD4;user32.DefMDIChildProcA:Longint
 00455F6C    mov         dword ptr [esi+28],eax
 00455F6F    pop         edx
 00455F70    pop         edi
 00455F71    pop         esi
 00455F72    pop         ebx
 00455F73    ret
*}
end;

//00455F80
procedure TCustomForm.CreateWnd;
begin
{*
 00455F80    push        ebx
 00455F81    push        esi
 00455F82    add         esp,0FFFFFFF8
 00455F85    mov         ebx,eax
 00455F87    mov         eax,ebx
 00455F89    call        TScrollingWinControl.CreateWnd
 00455F8E    mov         eax,[005AE3F0];^NewStyleControls:Boolean
 00455F93    cmp         byte ptr [eax],0
>00455F96    je          00455FD5
 00455F98    cmp         byte ptr [ebx+229],3
>00455F9F    je          00455FBF
 00455FA1    mov         eax,ebx
 00455FA3    call        TCustomForm.GetIconHandle
 00455FA8    push        eax
 00455FA9    push        1
 00455FAB    push        80
 00455FB0    mov         eax,ebx
 00455FB2    call        TWinControl.GetHandle
 00455FB7    push        eax
 00455FB8    call        user32.SendMessageA
>00455FBD    jmp         00455FD5
 00455FBF    push        0
 00455FC1    push        1
 00455FC3    push        80
 00455FC8    mov         eax,ebx
 00455FCA    call        TWinControl.GetHandle
 00455FCF    push        eax
 00455FD0    call        user32.SendMessageA
 00455FD5    test        byte ptr [ebx+1C],10
>00455FD9    jne         004560B1
 00455FDF    mov         al,byte ptr [ebx+22F]
 00455FE5    sub         al,2
>00455FE7    je          00455FF6
 00455FE9    dec         al
>00455FEB    je          00456098
>00455FF1    jmp         004560B1
 00455FF6    mov         dword ptr [esp+4],0FF00
 00455FFE    xor         eax,eax
 00456000    mov         dword ptr [esp],eax
 00456003    mov         esi,dword ptr [ebx+258]
 00456009    test        esi,esi
>0045600B    je          00456017
 0045600D    mov         eax,esi
 0045600F    call        TMenuItem.GetHandle
 00456014    mov         dword ptr [esp],eax
 00456017    push        56330001
 0045601C    push        0
 0045601E    push        0
 00456020    mov         eax,ebx
 00456022    call        TControl.GetClientWidth
 00456027    push        eax
 00456028    mov         eax,ebx
 0045602A    call        TControl.GetClientHeight
 0045602F    push        eax
 00456030    mov         eax,ebx
 00456032    call        TWinControl.GetHandle
 00456037    push        eax
 00456038    push        0
 0045603A    mov         eax,[005AF664];gvar_005AF664
 0045603F    push        eax
 00456040    lea         eax,[esp+20]
 00456044    push        eax
 00456045    mov         edx,4560B8
 0045604A    xor         ecx,ecx
 0045604C    mov         eax,200
 00456051    call        CreateWindowEx
 00456056    mov         dword ptr [ebx+254],eax
 0045605C    push        ebx
 0045605D    push        454EC0;TCustomForm.ClientWndProc
 00456062    call        MakeObjectInstance
 00456067    mov         dword ptr [ebx+278],eax
 0045606D    push        0FC
 0045606F    mov         eax,dword ptr [ebx+254]
 00456075    push        eax
 00456076    call        user32.GetWindowLongA
 0045607B    mov         dword ptr [ebx+274],eax
 00456081    mov         eax,dword ptr [ebx+278]
 00456087    push        eax
 00456088    push        0FC
 0045608A    mov         eax,dword ptr [ebx+254]
 00456090    push        eax
 00456091    call        user32.SetWindowLongA
>00456096    jmp         004560B1
 00456098    push        13
 0045609A    push        0
 0045609C    push        0
 0045609E    push        0
 004560A0    push        0
 004560A2    push        0FF
 004560A4    mov         eax,ebx
 004560A6    call        TWinControl.GetHandle
 004560AB    push        eax
 004560AC    call        user32.SetWindowPos
 004560B1    pop         ecx
 004560B2    pop         edx
 004560B3    pop         esi
 004560B4    pop         ebx
 004560B5    ret
*}
end;

//004560C4
procedure TCustomForm.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 004560C4    push        ebp
 004560C5    mov         ebp,esp
 004560C7    add         esp,0FFFFFF4C
 004560CD    push        ebx
 004560CE    push        esi
 004560CF    push        edi
 004560D0    xor         ecx,ecx
 004560D2    mov         dword ptr [ebp-0B4],ecx
 004560D8    mov         ebx,eax
 004560DA    xor         eax,eax
 004560DC    push        ebp
 004560DD    push        4561ED
 004560E2    push        dword ptr fs:[eax]
 004560E5    mov         dword ptr fs:[eax],esp
 004560E8    cmp         byte ptr [ebx+22F],1;TCustomForm.FFormStyle:TFormStyle
>004560EF    jne         004561A0
 004560F5    test        byte ptr [ebx+1C],10;TCustomForm.FComponentState:TComponentState
>004560F9    jne         004561A0
 004560FF    mov         eax,[005E0CAC];Application:TApplication
 00456104    mov         eax,dword ptr [eax+44]
 00456107    test        eax,eax
>00456109    je          00456114
 0045610B    cmp         dword ptr [eax+254],0
>00456112    jne         0045613B
 00456114    lea         edx,[ebp-0B4]
 0045611A    mov         eax,[005AE6A8];^SNoMDIForm:TResStringRec
 0045611F    call        LoadStr
 00456124    mov         ecx,dword ptr [ebp-0B4]
 0045612A    mov         dl,1
 0045612C    mov         eax,[00417C8C];EInvalidOperation
 00456131    call        Exception.Create;EInvalidOperation.Create
 00456136    call        @RaiseExcept
 0045613B    lea         eax,[edx+4C]
 0045613E    mov         dword ptr [ebp-24],eax
 00456141    mov         eax,dword ptr [edx]
 00456143    mov         dword ptr [ebp-20],eax
 00456146    mov         eax,[005AF664];gvar_005AF664
 0045614B    mov         dword ptr [ebp-1C],eax
 0045614E    mov         eax,dword ptr [edx+0C];TCreateParams.X:Integer
 00456151    mov         dword ptr [ebp-18],eax
 00456154    mov         eax,dword ptr [edx+10];TCreateParams.Y:Integer
 00456157    mov         dword ptr [ebp-14],eax
 0045615A    mov         eax,dword ptr [edx+14];TCreateParams.Width:Integer
 0045615D    mov         dword ptr [ebp-10],eax
 00456160    mov         eax,dword ptr [edx+18];TCreateParams.Height:Integer
 00456163    mov         dword ptr [ebp-0C],eax
 00456166    mov         eax,dword ptr [edx+4];TCreateParams.Style:DWORD
 00456169    mov         dword ptr [ebp-8],eax
 0045616C    mov         eax,dword ptr [edx+20];TCreateParams.Param:Pointer
 0045616F    mov         dword ptr [ebp-4],eax
 00456172    lea         eax,[ebp-24]
 00456175    push        eax
 00456176    push        0
 00456178    push        220
 0045617D    mov         eax,[005E0CAC];Application:TApplication
 00456182    mov         eax,dword ptr [eax+44]
 00456185    mov         eax,dword ptr [eax+254]
 0045618B    push        eax
 0045618C    call        user32.SendMessageA
 00456191    mov         dword ptr [ebx+180],eax;TCustomForm.FHandle:HWND
 00456197    or          byte ptr [ebx+2F4],10;TCustomForm.FFormState:TFormState
>0045619E    jmp         004561CD
 004561A0    mov         esi,edx
 004561A2    lea         edi,[ebp-0B0]
 004561A8    mov         ecx,23
 004561AD    rep movs    dword ptr [edi],dword ptr [esi]
 004561AF    and         dword ptr [ebp-0A8],0FFF7FFFF
 004561B9    lea         edx,[ebp-0B0]
 004561BF    mov         eax,ebx
 004561C1    call        TWinControl.CreateWindowHandle
 004561C6    and         byte ptr [ebx+2F4],0EF;TCustomForm.FFormState:TFormState
 004561CD    mov         eax,ebx
 004561CF    call        TCustomForm.SetLayeredAttribs
 004561D4    xor         eax,eax
 004561D6    pop         edx
 004561D7    pop         ecx
 004561D8    pop         ecx
 004561D9    mov         dword ptr fs:[eax],edx
 004561DC    push        4561F4
 004561E1    lea         eax,[ebp-0B4]
 004561E7    call        @LStrClr
 004561EC    ret
>004561ED    jmp         @HandleFinally
>004561F2    jmp         004561E1
 004561F4    pop         edi
 004561F5    pop         esi
 004561F6    pop         ebx
 004561F7    mov         esp,ebp
 004561F9    pop         ebp
 004561FA    ret
*}
end;

//004561FC
procedure TCustomForm.DestroyWindowHandle;
begin
{*
 004561FC    push        ebx
 004561FD    mov         ebx,eax
 004561FF    test        byte ptr [ebx+2F4],10
>00456206    je          0045622D
 00456208    push        0
 0045620A    mov         eax,ebx
 0045620C    call        TWinControl.GetHandle
 00456211    push        eax
 00456212    push        221
 00456217    mov         eax,[005E0CAC];Application:TApplication
 0045621C    mov         eax,dword ptr [eax+44]
 0045621F    mov         eax,dword ptr [eax+254]
 00456225    push        eax
 00456226    call        user32.SendMessageA
>0045622B    jmp         00456234
 0045622D    mov         eax,ebx
 0045622F    call        TWinControl.DestroyWindowHandle
 00456234    xor         eax,eax
 00456236    mov         dword ptr [ebx+254],eax
 0045623C    pop         ebx
 0045623D    ret
*}
end;

//00456240
procedure TCustomForm.DefaultHandler(var Message:void );
begin
{*
 00456240    push        ebx
 00456241    push        esi
 00456242    mov         esi,edx
 00456244    mov         ebx,eax
 00456246    cmp         dword ptr [ebx+254],0
>0045624D    je          00456296
 0045624F    cmp         dword ptr [esi],5
>00456252    jne         00456271
 00456254    mov         eax,dword ptr [esi+8]
 00456257    push        eax
 00456258    mov         eax,dword ptr [esi+4]
 0045625B    push        eax
 0045625C    mov         eax,dword ptr [esi]
 0045625E    push        eax
 0045625F    mov         eax,ebx
 00456261    call        TWinControl.GetHandle
 00456266    push        eax
 00456267    call        user32.DefWindowProcA
 0045626C    mov         dword ptr [esi+0C],eax
>0045626F    jmp         0045629F
 00456271    mov         eax,dword ptr [esi+8]
 00456274    push        eax
 00456275    mov         eax,dword ptr [esi+4]
 00456278    push        eax
 00456279    mov         eax,dword ptr [esi]
 0045627B    push        eax
 0045627C    mov         eax,dword ptr [ebx+254]
 00456282    push        eax
 00456283    mov         eax,ebx
 00456285    call        TWinControl.GetHandle
 0045628A    push        eax
 0045628B    call        user32.DefFrameProcA
 00456290    mov         dword ptr [esi+0C],eax
 00456293    pop         esi
 00456294    pop         ebx
 00456295    ret
 00456296    mov         edx,esi
 00456298    mov         eax,ebx
 0045629A    call        TWinControl.DefaultHandler
 0045629F    pop         esi
 004562A0    pop         ebx
 004562A1    ret
*}
end;

//004562A4
procedure TCustomForm.SetActiveControl(Control:TWinControl);
begin
{*
 004562A4    push        ebp
 004562A5    mov         ebp,esp
 004562A7    push        0
 004562A9    push        ebx
 004562AA    push        esi
 004562AB    push        edi
 004562AC    mov         edi,edx
 004562AE    mov         ebx,eax
 004562B0    xor         eax,eax
 004562B2    push        ebp
 004562B3    push        45634C
 004562B8    push        dword ptr fs:[eax]
 004562BB    mov         dword ptr fs:[eax],esp
 004562BE    cmp         edi,dword ptr [ebx+220]
>004562C4    je          00456336
 004562C6    test        edi,edi
>004562C8    je          0045630F
 004562CA    cmp         ebx,edi
>004562CC    je          004562EE
 004562CE    mov         eax,edi
 004562D0    call        GetParentForm
 004562D5    cmp         ebx,eax
>004562D7    jne         004562EE
 004562D9    test        byte ptr [ebx+1C],1
>004562DD    jne         0045630F
 004562DF    mov         eax,edi
 004562E1    mov         si,0FFB8
 004562E5    call        @CallDynaInst
 004562EA    test        al,al
>004562EC    jne         0045630F
 004562EE    lea         edx,[ebp-4]
 004562F1    mov         eax,[005AE6E4];^SCannotFocus:TResStringRec
 004562F6    call        LoadStr
 004562FB    mov         ecx,dword ptr [ebp-4]
 004562FE    mov         dl,1
 00456300    mov         eax,[00417C8C];EInvalidOperation
 00456305    call        Exception.Create
 0045630A    call        @RaiseExcept
 0045630F    mov         dword ptr [ebx+220],edi
 00456315    test        byte ptr [ebx+1C],1
>00456319    jne         00456336
 0045631B    cmp         byte ptr [ebx+22E],0
>00456322    je          0045632B
 00456324    mov         eax,ebx
 00456326    call        TCustomForm.SetWindowFocus
 0045632B    mov         eax,ebx
 0045632D    mov         si,0FFB2
 00456331    call        @CallDynaInst
 00456336    xor         eax,eax
 00456338    pop         edx
 00456339    pop         ecx
 0045633A    pop         ecx
 0045633B    mov         dword ptr fs:[eax],edx
 0045633E    push        456353
 00456343    lea         eax,[ebp-4]
 00456346    call        @LStrClr
 0045634B    ret
>0045634C    jmp         @HandleFinally
>00456351    jmp         00456343
 00456353    pop         edi
 00456354    pop         esi
 00456355    pop         ebx
 00456356    pop         ecx
 00456357    pop         ebp
 00456358    ret
*}
end;

//0045635C
procedure TCustomForm.DefocusControl(Control:TWinControl; Removing:Boolean);
begin
{*
 0045635C    push        ebx
 0045635D    push        esi
 0045635E    push        edi
 0045635F    mov         ebx,ecx
 00456361    mov         esi,edx
 00456363    mov         edi,eax
 00456365    test        bl,bl
>00456367    je          00456383
 00456369    mov         edx,dword ptr [edi+224]
 0045636F    mov         eax,esi
 00456371    call        TWinControl.ContainsControl
 00456376    test        al,al
>00456378    je          00456383
 0045637A    mov         eax,dword ptr [esi+30]
 0045637D    mov         dword ptr [edi+224],eax
 00456383    mov         edx,dword ptr [edi+220]
 00456389    mov         eax,esi
 0045638B    call        TWinControl.ContainsControl
 00456390    test        al,al
>00456392    je          0045639D
 00456394    xor         edx,edx
 00456396    mov         eax,edi
 00456398    call        TCustomForm.SetActiveControl
 0045639D    pop         edi
 0045639E    pop         esi
 0045639F    pop         ebx
 004563A0    ret
*}
end;

//004563A4
procedure TCustomForm.FocusControl(Control:TWinControl);
begin
{*
 004563A4    push        ebx
 004563A5    push        esi
 004563A6    mov         esi,eax
 004563A8    mov         bl,byte ptr [esi+22E]
 004563AE    mov         eax,esi
 004563B0    call        TCustomForm.SetActiveControl
 004563B5    test        bl,bl
>004563B7    jne         004563C3
 004563B9    mov         eax,esi
 004563BB    mov         edx,dword ptr [eax]
 004563BD    call        dword ptr [edx+0C4]
 004563C3    pop         esi
 004563C4    pop         ebx
 004563C5    ret
*}
end;

//004563C8
function TCustomForm.SetFocusedControl(Control:TWinControl):Boolean;
begin
{*
 004563C8    push        ebp
 004563C9    mov         ebp,esp
 004563CB    push        ecx
 004563CC    push        ebx
 004563CD    push        esi
 004563CE    push        edi
 004563CF    mov         dword ptr [ebp-4],edx
 004563D2    mov         edi,eax
 004563D4    xor         ebx,ebx
 004563D6    inc         dword ptr ds:[5ACDB8];gvar_005ACDB8
 004563DC    cmp         dword ptr [edi+250],0
>004563E3    jne         004563FD
 004563E5    cmp         edi,dword ptr [ebp-4]
>004563E8    je          004563F5
 004563EA    mov         eax,dword ptr [ebp-4]
 004563ED    mov         dword ptr [edi+220],eax
>004563F3    jmp         004563FD
 004563F5    xor         eax,eax
 004563F7    mov         dword ptr [edi+220],eax
 004563FD    mov         eax,[005E0CB0];Screen:TScreen
 00456402    mov         edx,dword ptr [ebp-4]
 00456405    mov         dword ptr [eax+64],edx
 00456408    mov         eax,[005E0CB0];Screen:TScreen
 0045640D    mov         dword ptr [eax+68],edi
 00456410    mov         eax,[005E0CB0];Screen:TScreen
 00456415    mov         eax,dword ptr [eax+50]
 00456418    mov         edx,edi
 0045641A    call        TList.Remove
 0045641F    mov         eax,[005E0CB0];Screen:TScreen
 00456424    mov         eax,dword ptr [eax+50]
 00456427    mov         ecx,edi
 00456429    xor         edx,edx
 0045642B    call        TList.Insert
 00456430    mov         eax,edi
 00456432    mov         edx,dword ptr ds:[451000];TForm
 00456438    call        @IsClass
 0045643D    test        al,al
>0045643F    je          0045646B
 00456441    mov         eax,[005E0CB0];Screen:TScreen
 00456446    mov         dword ptr [eax+6C],edi
 00456449    mov         eax,[005E0CB0];Screen:TScreen
 0045644E    mov         eax,dword ptr [eax+4C]
 00456451    mov         edx,edi
 00456453    call        TList.Remove
 00456458    mov         eax,[005E0CB0];Screen:TScreen
 0045645D    mov         eax,dword ptr [eax+4C]
 00456460    mov         ecx,edi
 00456462    xor         edx,edx
 00456464    call        TList.Insert
>00456469    jmp         00456475
 0045646B    mov         eax,[005E0CB0];Screen:TScreen
 00456470    xor         edx,edx
 00456472    mov         dword ptr [eax+6C],edx
 00456475    mov         eax,dword ptr [ebp-4]
 00456478    test        byte ptr [eax+54],20
>0045647C    jne         0045664B
 00456482    mov         eax,dword ptr [ebp-4]
 00456485    mov         ax,word ptr [eax+54]
 00456489    or          ax,word ptr ds:[456654]
 00456490    mov         edx,dword ptr [ebp-4]
 00456493    mov         word ptr [edx+54],ax
 00456497    xor         edx,edx
 00456499    push        ebp
 0045649A    push        456638
 0045649F    push        dword ptr fs:[edx]
 004564A2    mov         dword ptr fs:[edx],esp
 004564A5    mov         eax,[005E0CB0];Screen:TScreen
 004564AA    mov         eax,dword ptr [eax+78]
 004564AD    cmp         edi,eax
>004564AF    je          00456505
 004564B1    test        eax,eax
>004564B3    je          004564DF
 004564B5    call        TWinControl.GetHandle
 004564BA    mov         esi,eax
 004564BC    mov         eax,[005E0CB0];Screen:TScreen
 004564C1    xor         edx,edx
 004564C3    mov         dword ptr [eax+78],edx
 004564C6    mov         dx,0B001
 004564CA    mov         eax,esi
 004564CC    call        SendFocusMessage
 004564D1    test        al,al
>004564D3    jne         004564DF
 004564D5    call        @TryFinallyExit
>004564DA    jmp         0045664B
 004564DF    mov         eax,[005E0CB0];Screen:TScreen
 004564E4    mov         dword ptr [eax+78],edi
 004564E7    mov         eax,edi
 004564E9    call        TWinControl.GetHandle
 004564EE    mov         dx,0B000
 004564F2    call        SendFocusMessage
 004564F7    test        al,al
>004564F9    jne         00456505
 004564FB    call        @TryFinallyExit
>00456500    jmp         0045664B
 00456505    cmp         dword ptr [edi+224],0
>0045650C    jne         00456514
 0045650E    mov         dword ptr [edi+224],edi
 00456514    mov         eax,dword ptr [edi+224]
 0045651A    cmp         eax,dword ptr [ebp-4]
>0045651D    je          00456613
>00456523    jmp         0045655A
 00456525    mov         eax,dword ptr [edi+224]
 0045652B    call        TWinControl.GetHandle
 00456530    mov         esi,eax
 00456532    mov         eax,dword ptr [edi+224]
 00456538    mov         eax,dword ptr [eax+30]
 0045653B    mov         dword ptr [edi+224],eax
 00456541    mov         dx,0B01B
 00456545    mov         eax,esi
 00456547    call        SendFocusMessage
 0045654C    test        al,al
>0045654E    jne         0045655A
 00456550    call        @TryFinallyExit
>00456555    jmp         0045664B
 0045655A    mov         esi,dword ptr [edi+224]
 00456560    test        esi,esi
>00456562    je          004565AA
 00456564    mov         eax,esi
 00456566    mov         edx,dword ptr [ebp-4]
 00456569    call        TWinControl.ContainsControl
 0045656E    test        al,al
>00456570    je          00456525
>00456572    jmp         004565AA
 00456574    mov         esi,dword ptr [ebp-4]
>00456577    jmp         0045657B
 00456579    mov         esi,eax
 0045657B    mov         eax,dword ptr [esi+30]
 0045657E    cmp         eax,dword ptr [edi+224]
>00456584    jne         00456579
 00456586    mov         dword ptr [edi+224],esi
 0045658C    mov         eax,esi
 0045658E    call        TWinControl.GetHandle
 00456593    mov         dx,0B01A
 00456597    call        SendFocusMessage
 0045659C    test        al,al
>0045659E    jne         004565AA
 004565A0    call        @TryFinallyExit
>004565A5    jmp         0045664B
 004565AA    mov         eax,dword ptr [edi+224]
 004565B0    cmp         eax,dword ptr [ebp-4]
>004565B3    jne         00456574
 004565B5    mov         eax,dword ptr [ebp-4]
 004565B8    mov         esi,dword ptr [eax+30]
 004565BB    test        esi,esi
>004565BD    je          004565E4
 004565BF    mov         eax,esi
 004565C1    mov         edx,dword ptr ds:[450700];TScrollingWinControl
 004565C7    call        @IsClass
 004565CC    test        al,al
>004565CE    je          004565DD
 004565D0    mov         edx,dword ptr [ebp-4]
 004565D3    mov         eax,esi
 004565D5    mov         ecx,dword ptr [eax]
 004565D7    call        dword ptr [ecx+0CC]
 004565DD    mov         esi,dword ptr [esi+30]
 004565E0    test        esi,esi
>004565E2    jne         004565BF
 004565E4    mov         eax,dword ptr [ebp-4]
 004565E7    push        eax
 004565E8    xor         ecx,ecx
 004565EA    mov         edx,0B007
 004565EF    mov         eax,edi
 004565F1    call        TControl.Perform
 004565F6    mov         eax,dword ptr [edi+27C]
 004565FC    test        eax,eax
>004565FE    je          00456613
 00456600    cmp         eax,dword ptr [ebp-4]
>00456603    je          00456613
 00456605    push        0
 00456607    xor         ecx,ecx
 00456609    mov         edx,0B02A
 0045660E    call        TControl.Perform
 00456613    xor         eax,eax
 00456615    pop         edx
 00456616    pop         ecx
 00456617    pop         ecx
 00456618    mov         dword ptr fs:[eax],edx
 0045661B    push        45663F
 00456620    mov         eax,dword ptr [ebp-4]
 00456623    mov         dx,word ptr ds:[456654]
 0045662A    not         edx
 0045662C    and         dx,word ptr [eax+54]
 00456630    mov         eax,dword ptr [ebp-4]
 00456633    mov         word ptr [eax+54],dx
 00456637    ret
>00456638    jmp         @HandleFinally
>0045663D    jmp         00456620
 0045663F    mov         eax,[005E0CB0];Screen:TScreen
 00456644    call        TScreen.UpdateLastActive
 00456649    mov         bl,1
 0045664B    mov         eax,ebx
 0045664D    pop         edi
 0045664E    pop         esi
 0045664F    pop         ebx
 00456650    pop         ecx
 00456651    pop         ebp
 00456652    ret
*}
end;

//00456658
procedure TCustomForm.sub_00456658;
begin
{*
 00456658    ret
*}
end;

//0045665C
procedure TCustomForm.SetWindowFocus;
begin
{*
 0045665C    push        ebx
 0045665D    push        esi
 0045665E    mov         edx,dword ptr [eax+220]
 00456664    test        edx,edx
>00456666    je          00456675
 00456668    cmp         dword ptr [eax+250],0
>0045666F    jne         00456675
 00456671    mov         ebx,edx
>00456673    jmp         00456677
 00456675    mov         ebx,eax
 00456677    mov         eax,ebx
 00456679    call        TWinControl.GetHandle
 0045667E    push        eax
 0045667F    call        user32.SetFocus
 00456684    mov         eax,ebx
 00456686    call        TWinControl.GetHandle
 0045668B    mov         esi,eax
 0045668D    call        user32.GetFocus
 00456692    cmp         esi,eax
>00456694    jne         004566A6
 00456696    push        0
 00456698    xor         ecx,ecx
 0045669A    mov         edx,0B029
 0045669F    mov         eax,ebx
 004566A1    call        TControl.Perform
 004566A6    pop         esi
 004566A7    pop         ebx
 004566A8    ret
*}
end;

//004566AC
procedure TCustomForm.SetActive(Value:Boolean);
begin
{*
 004566AC    push        ebx
 004566AD    push        esi
 004566AE    mov         ebx,edx
 004566B0    mov         esi,eax
 004566B2    mov         byte ptr [esi+22E],bl
 004566B8    mov         eax,dword ptr [esi+27C]
 004566BE    test        eax,eax
>004566C0    je          004566D2
 004566C2    push        0
 004566C4    xor         ecx,ecx
 004566C6    mov         cl,bl
 004566C8    mov         edx,0B02B
 004566CD    call        TControl.Perform
 004566D2    test        bl,bl
>004566D4    je          0045670D
 004566D6    cmp         dword ptr [esi+220],0
>004566DD    jne         004566FD
 004566DF    test        byte ptr [esi+1C],10
>004566E3    jne         004566FD
 004566E5    push        1
 004566E7    push        0
 004566E9    mov         cl,1
 004566EB    xor         edx,edx
 004566ED    mov         eax,esi
 004566EF    call        TWinControl.FindNextControl
 004566F4    mov         edx,eax
 004566F6    mov         eax,esi
 004566F8    call        TCustomForm.SetActiveControl
 004566FD    mov         dl,1
 004566FF    mov         eax,esi
 00456701    call        TCustomForm.MergeMenu
 00456706    mov         eax,esi
 00456708    call        TCustomForm.SetWindowFocus
 0045670D    pop         esi
 0045670E    pop         ebx
 0045670F    ret
*}
end;

//00456710
procedure TCustomForm.SendCancelMode(Sender:TControl);
begin
{*
 00456710    push        ebx
 00456711    push        esi
 00456712    mov         esi,edx
 00456714    mov         ebx,eax
 00456716    cmp         byte ptr [ebx+22E],0
>0045671D    je          0045673B
 0045671F    cmp         dword ptr [ebx+220],0
>00456726    je          0045673B
 00456728    push        esi
 00456729    xor         ecx,ecx
 0045672B    mov         edx,0B004
 00456730    mov         eax,dword ptr [ebx+220]
 00456736    call        TControl.Perform
 0045673B    cmp         byte ptr [ebx+22F],2
>00456742    jne         0045675D
 00456744    mov         eax,ebx
 00456746    call        TCustomForm.GetActiveMDIChild
 0045674B    test        eax,eax
>0045674D    je          0045675D
 0045674F    mov         eax,ebx
 00456751    call        TCustomForm.GetActiveMDIChild
 00456756    mov         edx,esi
 00456758    call        TCustomForm.SendCancelMode
 0045675D    pop         esi
 0045675E    pop         ebx
 0045675F    ret
*}
end;

//00456760
procedure TCustomForm.MergeMenu(MergeState:Boolean);
begin
{*
 00456760    push        esi
 00456761    test        byte ptr [eax+2F4],8
>00456768    jne         00456804
 0045676E    mov         ecx,dword ptr ds:[5E0CAC];Application:TApplication
 00456774    cmp         dword ptr [ecx+44],0
>00456778    je          00456804
 0045677E    mov         ecx,dword ptr ds:[5E0CAC];Application:TApplication
 00456784    mov         ecx,dword ptr [ecx+44]
 00456787    cmp         dword ptr [ecx+248],0
>0045678E    je          00456804
 00456790    mov         ecx,dword ptr ds:[5E0CAC];Application:TApplication
 00456796    cmp         eax,dword ptr [ecx+44]
>00456799    je          00456804
 0045679B    cmp         byte ptr [eax+22F],1
>004567A2    je          004567B6
 004567A4    mov         ecx,dword ptr ds:[5E0CAC];Application:TApplication
 004567AA    mov         ecx,dword ptr [ecx+44]
 004567AD    cmp         byte ptr [ecx+22F],2
>004567B4    je          00456804
 004567B6    xor         esi,esi
 004567B8    test        byte ptr [eax+1C],10
>004567BC    jne         004567E2
 004567BE    cmp         dword ptr [eax+248],0
>004567C5    je          004567E2
 004567C7    mov         ecx,dword ptr [eax+248]
 004567CD    cmp         byte ptr [ecx+5C],0
>004567D1    jne         004567DC
 004567D3    cmp         byte ptr [eax+22F],1
>004567DA    jne         004567E2
 004567DC    mov         esi,dword ptr [eax+248]
 004567E2    mov         eax,[005E0CAC];Application:TApplication
 004567E7    mov         eax,dword ptr [eax+44]
 004567EA    mov         eax,dword ptr [eax+248]
 004567F0    test        dl,dl
>004567F2    je          004567FD
 004567F4    mov         edx,esi
 004567F6    call        TMainMenu.Merge
>004567FB    jmp         00456804
 004567FD    mov         edx,esi
 004567FF    call        TMainMenu.Unmerge
 00456804    pop         esi
 00456805    ret
*}
end;

//00456808
procedure DoNestedActivation(Msg:Cardinal; Control:TWinControl; Form:TCustomForm);
begin
{*
 00456808    push        ebx
 00456809    push        esi
 0045680A    push        edi
 0045680B    push        ebp
 0045680C    mov         edi,ecx
 0045680E    mov         ebx,edx
 00456810    mov         ebp,eax
 00456812    test        ebx,ebx
>00456814    je          0045684C
>00456816    jmp         0045681A
 00456818    mov         ebx,esi
 0045681A    mov         esi,dword ptr [ebx+30]
 0045681D    test        esi,esi
>0045681F    je          00456832
 00456821    mov         eax,ebx
 00456823    mov         edx,dword ptr ds:[450CFC];TCustomForm
 00456829    call        @IsClass
 0045682E    test        al,al
>00456830    je          00456818
 00456832    test        ebx,ebx
>00456834    je          0045684C
 00456836    cmp         edi,ebx
>00456838    je          0045684C
 0045683A    push        0
 0045683C    push        0
 0045683E    push        ebp
 0045683F    mov         eax,ebx
 00456841    call        TWinControl.GetHandle
 00456846    push        eax
 00456847    call        user32.SendMessageA
 0045684C    pop         ebp
 0045684D    pop         edi
 0045684E    pop         esi
 0045684F    pop         ebx
 00456850    ret
*}
end;

//00456854
procedure TCustomForm.Activate;
begin
{*
 00456854    push        ebx
 00456855    mov         ebx,eax
 00456857    mov         ecx,ebx
 00456859    mov         edx,dword ptr [ebx+220]
 0045685F    mov         eax,0B000
 00456864    call        DoNestedActivation
 00456869    cmp         word ptr [ebx+28A],0
>00456871    je          00456881
 00456873    mov         edx,ebx
 00456875    mov         eax,dword ptr [ebx+28C]
 0045687B    call        dword ptr [ebx+288]
 00456881    pop         ebx
 00456882    ret
*}
end;

//00456884
procedure TCustomForm.Deactivate;
begin
{*
 00456884    push        ebx
 00456885    mov         ebx,eax
 00456887    mov         ecx,ebx
 00456889    mov         edx,dword ptr [ebx+220]
 0045688F    mov         eax,0B001
 00456894    call        DoNestedActivation
 00456899    cmp         word ptr [ebx+2A2],0
>004568A1    je          004568B1
 004568A3    mov         edx,ebx
 004568A5    mov         eax,dword ptr [ebx+2A4]
 004568AB    call        dword ptr [ebx+2A0]
 004568B1    pop         ebx
 004568B2    ret
*}
end;

//004568B4
procedure TCustomForm.Paint;
begin
{*
 004568B4    push        ebx
 004568B5    cmp         word ptr [eax+2BA],0
>004568BD    je          004568CF
 004568BF    mov         ebx,eax
 004568C1    mov         edx,eax
 004568C3    mov         eax,dword ptr [ebx+2BC]
 004568C9    call        dword ptr [ebx+2B8]
 004568CF    pop         ebx
 004568D0    ret
*}
end;

//004568D4
function TCustomForm.GetIconHandle:HICON;
begin
{*
 004568D4    mov         eax,dword ptr [eax+240]
 004568DA    call        TIcon.GetHandle
 004568DF    test        eax,eax
>004568E1    jne         004568ED
 004568E3    mov         eax,[005E0CAC];Application:TApplication
 004568E8    call        TApplication.GetIconHandle
 004568ED    ret
*}
end;

//004568F0
procedure TCustomForm.PaintWindow(DC:HDC);
begin
{*
 004568F0    push        ebp
 004568F1    mov         ebp,esp
 004568F3    push        ecx
 004568F4    push        ebx
 004568F5    push        esi
 004568F6    mov         ebx,edx
 004568F8    mov         dword ptr [ebp-4],eax
 004568FB    mov         eax,dword ptr [ebp-4]
 004568FE    mov         eax,dword ptr [eax+238]
 00456904    call        TCanvas.Lock
 00456909    xor         eax,eax
 0045690B    push        ebp
 0045690C    push        45699E
 00456911    push        dword ptr fs:[eax]
 00456914    mov         dword ptr fs:[eax],esp
 00456917    mov         eax,dword ptr [ebp-4]
 0045691A    mov         eax,dword ptr [eax+238]
 00456920    mov         edx,ebx
 00456922    call        TCanvas.SetHandle
 00456927    xor         eax,eax
 00456929    push        ebp
 0045692A    push        45697B
 0045692F    push        dword ptr fs:[eax]
 00456932    mov         dword ptr fs:[eax],esp
 00456935    mov         eax,dword ptr [ebp-4]
 00456938    cmp         dword ptr [eax+250],0
>0045693F    je          00456951
 00456941    mov         eax,dword ptr [ebp-4]
 00456944    mov         eax,dword ptr [eax+250]
 0045694A    mov         edx,dword ptr [eax]
 0045694C    call        dword ptr [edx+28]
>0045694F    jmp         0045695D
 00456951    mov         eax,dword ptr [ebp-4]
 00456954    mov         si,0FFAC
 00456958    call        @CallDynaInst
 0045695D    xor         eax,eax
 0045695F    pop         edx
 00456960    pop         ecx
 00456961    pop         ecx
 00456962    mov         dword ptr fs:[eax],edx
 00456965    push        456982
 0045696A    mov         eax,dword ptr [ebp-4]
 0045696D    mov         eax,dword ptr [eax+238]
 00456973    xor         edx,edx
 00456975    call        TCanvas.SetHandle
 0045697A    ret
>0045697B    jmp         @HandleFinally
>00456980    jmp         0045696A
 00456982    xor         eax,eax
 00456984    pop         edx
 00456985    pop         ecx
 00456986    pop         ecx
 00456987    mov         dword ptr fs:[eax],edx
 0045698A    push        4569A5
 0045698F    mov         eax,dword ptr [ebp-4]
 00456992    mov         eax,dword ptr [eax+238]
 00456998    call        TCanvas.Unlock
 0045699D    ret
>0045699E    jmp         @HandleFinally
>004569A3    jmp         0045698F
 004569A5    pop         esi
 004569A6    pop         ebx
 004569A7    pop         ecx
 004569A8    pop         ebp
 004569A9    ret
*}
end;

//004569AC
procedure TCustomForm.PaletteChanged(Foreground:Boolean);
begin
{*
 004569AC    push        ebx
 004569AD    push        esi
 004569AE    push        edi
 004569AF    push        ebp
 004569B0    add         esp,0FFFFFFF0
 004569B3    mov         byte ptr [esp+4],dl
 004569B7    mov         dword ptr [esp],eax
 004569BA    xor         ebx,ebx
 004569BC    mov         eax,dword ptr [esp]
 004569BF    call        TCustomForm.GetActiveMDIChild
 004569C4    mov         dword ptr [esp+0C],eax
 004569C8    cmp         dword ptr [esp+0C],0
>004569CD    je          004569E2
 004569CF    mov         dl,byte ptr [esp+4]
 004569D3    mov         eax,dword ptr [esp+0C]
 004569D7    mov         si,0FFD1
 004569DB    call        @CallDynaInst
 004569E0    mov         ebx,eax
 004569E2    mov         eax,dword ptr [esp]
 004569E5    call        TCustomForm.GetMDIChildCount
 004569EA    mov         ebp,eax
 004569EC    dec         ebp
 004569ED    test        ebp,ebp
>004569EF    jl          00456A2C
 004569F1    inc         ebp
 004569F2    mov         dword ptr [esp+8],0
 004569FA    test        byte ptr [esp+4],bl
>004569FE    jne         00456A40
 00456A00    mov         edx,dword ptr [esp+8]
 00456A04    mov         eax,dword ptr [esp]
 00456A07    call        TCustomForm.GetMDIChildren
 00456A0C    mov         edi,eax
 00456A0E    cmp         edi,dword ptr [esp+0C]
>00456A12    je          00456A25
 00456A14    mov         dl,byte ptr [esp+4]
 00456A18    mov         eax,edi
 00456A1A    mov         si,0FFD1
 00456A1E    call        @CallDynaInst
 00456A23    or          bl,al
 00456A25    inc         dword ptr [esp+8]
 00456A29    dec         ebp
>00456A2A    jne         004569FA
 00456A2C    test        byte ptr [esp+4],bl
>00456A30    jne         00456A40
 00456A32    mov         dl,byte ptr [esp+4]
 00456A36    mov         eax,dword ptr [esp]
 00456A39    call        TWinControl.PaletteChanged
 00456A3E    mov         ebx,eax
 00456A40    mov         eax,ebx
 00456A42    add         esp,10
 00456A45    pop         ebp
 00456A46    pop         edi
 00456A47    pop         esi
 00456A48    pop         ebx
 00456A49    ret
*}
end;

//00456A4C
procedure TCustomForm.WMPaint(var Message:TWMPaint);
begin
{*
 00456A4C    push        ebx
 00456A4D    push        esi
 00456A4E    add         esp,0FFFFFFC0
 00456A51    mov         esi,edx
 00456A53    mov         ebx,eax
 00456A55    mov         eax,ebx
 00456A57    call        TWinControl.GetHandle
 00456A5C    push        eax
 00456A5D    call        user32.IsIconic
 00456A62    test        eax,eax
>00456A64    jne         00456A8F
 00456A66    mov         ax,[00456AC8]
 00456A6C    or          ax,word ptr [ebx+54]
 00456A70    mov         word ptr [ebx+54],ax
 00456A74    mov         edx,esi
 00456A76    mov         eax,ebx
 00456A78    call        TWinControl.WMPaint
 00456A7D    mov         ax,[00456AC8]
 00456A83    not         eax
 00456A85    and         ax,word ptr [ebx+54]
 00456A89    mov         word ptr [ebx+54],ax
>00456A8D    jmp         00456ABF
 00456A8F    push        esp
 00456A90    mov         eax,ebx
 00456A92    call        TWinControl.GetHandle
 00456A97    push        eax
 00456A98    call        user32.BeginPaint
 00456A9D    mov         esi,eax
 00456A9F    mov         eax,ebx
 00456AA1    call        TCustomForm.GetIconHandle
 00456AA6    push        eax
 00456AA7    push        0
 00456AA9    push        0
 00456AAB    push        esi
 00456AAC    call        user32.DrawIcon
 00456AB1    push        esp
 00456AB2    mov         eax,ebx
 00456AB4    call        TWinControl.GetHandle
 00456AB9    push        eax
 00456ABA    call        user32.EndPaint
 00456ABF    add         esp,40
 00456AC2    pop         esi
 00456AC3    pop         ebx
 00456AC4    ret
*}
end;

//00456ACC
procedure TCustomForm.WMIconEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 00456ACC    push        ebx
 00456ACD    push        esi
 00456ACE    add         esp,0FFFFFFF0
 00456AD1    mov         esi,edx
 00456AD3    mov         ebx,eax
 00456AD5    cmp         byte ptr [ebx+22F],1
>00456ADC    jne         00456B25
 00456ADE    cmp         byte ptr [ebx+22F],1
>00456AE5    jne         00456B1C
 00456AE7    test        byte ptr [ebx+1C],10
>00456AEB    jne         00456B1C
 00456AED    mov         eax,[005E0CAC];Application:TApplication
 00456AF2    mov         eax,dword ptr [eax+44]
 00456AF5    mov         eax,dword ptr [eax+170]
 00456AFB    call        TBrush.GetHandle
 00456B00    push        eax
 00456B01    lea         edx,[esp+4]
 00456B05    mov         eax,ebx
 00456B07    mov         ecx,dword ptr [eax]
 00456B09    call        dword ptr [ecx+44]
 00456B0C    lea         eax,[esp+4]
 00456B10    push        eax
 00456B11    mov         eax,dword ptr [esi+4]
 00456B14    push        eax
 00456B15    call        user32.FillRect
>00456B1A    jmp         00456B25
 00456B1C    mov         edx,esi
 00456B1E    mov         eax,ebx
 00456B20    mov         ecx,dword ptr [eax]
 00456B22    call        dword ptr [ecx-10]
 00456B25    add         esp,10
 00456B28    pop         esi
 00456B29    pop         ebx
 00456B2A    ret
*}
end;

//00456B2C
procedure TCustomForm.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 00456B2C    push        esi
 00456B2D    push        edi
 00456B2E    mov         edi,edx
 00456B30    mov         esi,eax
 00456B32    mov         eax,esi
 00456B34    call        TWinControl.GetHandle
 00456B39    push        eax
 00456B3A    call        user32.IsIconic
 00456B3F    test        eax,eax
>00456B41    jne         00456B4F
 00456B43    mov         edx,edi
 00456B45    mov         eax,esi
 00456B47    call        TWinControl.WMEraseBkgnd
 00456B4C    pop         edi
 00456B4D    pop         esi
 00456B4E    ret
 00456B4F    mov         dword ptr [edi],27
 00456B55    mov         edx,edi
 00456B57    mov         eax,esi
 00456B59    mov         ecx,dword ptr [eax]
 00456B5B    call        dword ptr [ecx-10]
 00456B5E    pop         edi
 00456B5F    pop         esi
 00456B60    ret
*}
end;

//00456B64
procedure TCustomForm.WMQueryDragIcon(var Message:TWMQueryDragIcon);
begin
{*
 00456B64    push        ebx
 00456B65    push        esi
 00456B66    mov         esi,edx
 00456B68    mov         ebx,eax
 00456B6A    mov         eax,ebx
 00456B6C    call        TCustomForm.GetIconHandle
 00456B71    mov         dword ptr [esi+0C],eax
 00456B74    pop         esi
 00456B75    pop         ebx
 00456B76    ret
*}
end;

//00456B78
procedure ModifySystemMenu;
begin
{*
 00456B78    push        ebp
 00456B79    mov         ebp,esp
 00456B7B    push        ebx
 00456B7C    mov         eax,dword ptr [ebp+8]
 00456B7F    mov         eax,dword ptr [eax-4]
 00456B82    cmp         byte ptr [eax+229],0
>00456B89    je          00456C6E
 00456B8F    mov         eax,dword ptr [ebp+8]
 00456B92    mov         eax,dword ptr [eax-4]
 00456B95    test        byte ptr [eax+228],1
>00456B9C    je          00456C6E
 00456BA2    mov         eax,dword ptr [ebp+8]
 00456BA5    mov         eax,dword ptr [eax-4]
 00456BA8    cmp         byte ptr [eax+22F],1
>00456BAF    je          00456C6E
 00456BB5    push        0
 00456BB7    mov         eax,dword ptr [ebp+8]
 00456BBA    mov         eax,dword ptr [eax-4]
 00456BBD    call        TWinControl.GetHandle
 00456BC2    push        eax
 00456BC3    call        user32.GetSystemMenu
 00456BC8    mov         ebx,eax
 00456BCA    mov         eax,dword ptr [ebp+8]
 00456BCD    mov         eax,dword ptr [eax-4]
 00456BD0    cmp         byte ptr [eax+229],3
>00456BD7    jne         00456C36
 00456BD9    push        0
 00456BDB    push        0F130
 00456BE0    push        ebx
 00456BE1    call        user32.DeleteMenu
 00456BE6    push        400
 00456BEB    push        7
 00456BED    push        ebx
 00456BEE    call        user32.DeleteMenu
 00456BF3    push        400
 00456BF8    push        5
 00456BFA    push        ebx
 00456BFB    call        user32.DeleteMenu
 00456C00    push        0
 00456C02    push        0F030
 00456C07    push        ebx
 00456C08    call        user32.DeleteMenu
 00456C0D    push        0
 00456C0F    push        0F020
 00456C14    push        ebx
 00456C15    call        user32.DeleteMenu
 00456C1A    push        0
 00456C1C    push        0F000
 00456C21    push        ebx
 00456C22    call        user32.DeleteMenu
 00456C27    push        0
 00456C29    push        0F120
 00456C2E    push        ebx
 00456C2F    call        user32.DeleteMenu
>00456C34    jmp         00456C6E
 00456C36    mov         eax,dword ptr [ebp+8]
 00456C39    mov         eax,dword ptr [eax-4]
 00456C3C    test        byte ptr [eax+228],2
>00456C43    jne         00456C52
 00456C45    push        1
 00456C47    push        0F020
 00456C4C    push        ebx
 00456C4D    call        user32.EnableMenuItem
 00456C52    mov         eax,dword ptr [ebp+8]
 00456C55    mov         eax,dword ptr [eax-4]
 00456C58    test        byte ptr [eax+228],4
>00456C5F    jne         00456C6E
 00456C61    push        1
 00456C63    push        0F030
 00456C68    push        ebx
 00456C69    call        user32.EnableMenuItem
 00456C6E    pop         ebx
 00456C6F    pop         ebp
 00456C70    ret
*}
end;

//00456C74
procedure TCustomForm.WMNCCreate(var Message:TWMNCCreate);
begin
{*
 00456C74    push        ebp
 00456C75    mov         ebp,esp
 00456C77    push        ecx
 00456C78    mov         dword ptr [ebp-4],eax
 00456C7B    mov         eax,dword ptr [ebp-4]
 00456C7E    mov         ecx,dword ptr [eax]
 00456C80    call        dword ptr [ecx-10]
 00456C83    mov         eax,dword ptr [ebp-4]
 00456C86    mov         edx,dword ptr [eax+248]
 00456C8C    mov         eax,dword ptr [ebp-4]
 00456C8F    call        TCustomForm.SetMenu
 00456C94    mov         eax,dword ptr [ebp-4]
 00456C97    test        byte ptr [eax+1C],10
>00456C9B    jne         00456CA4
 00456C9D    push        ebp
 00456C9E    call        ModifySystemMenu
 00456CA3    pop         ecx
 00456CA4    pop         ecx
 00456CA5    pop         ebp
 00456CA6    ret
*}
end;

//00456CA8
procedure TCustomForm.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 00456CA8    push        ebx
 00456CA9    push        esi
 00456CAA    mov         esi,edx
 00456CAC    mov         ebx,eax
 00456CAE    cmp         dword ptr [esi+4],2
>00456CB2    jne         00456D29
 00456CB4    cmp         byte ptr [ebx+9B],1
>00456CBB    jne         00456D29
 00456CBD    test        byte ptr [ebx+1C],10
>00456CC1    jne         00456D29
 00456CC3    mov         eax,ebx
 00456CC5    call        TWinControl.GetHandle
 00456CCA    push        eax
 00456CCB    call        user32.IsIconic
 00456CD0    test        eax,eax
>00456CD2    jne         00456D29
 00456CD4    push        7
 00456CD6    push        0
 00456CD8    push        0
 00456CDA    push        0
 00456CDC    push        0
 00456CDE    push        0
 00456CE0    mov         eax,ebx
 00456CE2    call        TWinControl.GetHandle
 00456CE7    push        eax
 00456CE8    call        user32.SetWindowPos
 00456CED    mov         eax,dword ptr [esi+8]
 00456CF0    push        eax
 00456CF1    mov         eax,dword ptr [esi+4]
 00456CF4    push        eax
 00456CF5    push        0A2
 00456CFA    mov         eax,ebx
 00456CFC    call        TWinControl.GetHandle
 00456D01    push        eax
 00456D02    call        user32.PostMessageA
 00456D07    cmp         byte ptr [ebx+22E],0
>00456D0E    je          00456D32
 00456D10    mov         eax,ebx
 00456D12    mov         edx,dword ptr [eax]
 00456D14    call        dword ptr [edx+54]
 00456D17    mov         edx,eax
 00456D19    xor         dl,1
 00456D1C    or          ecx,0FFFFFFFF
 00456D1F    mov         eax,ebx
 00456D21    call        TControl.BeginDrag
 00456D26    pop         esi
 00456D27    pop         ebx
 00456D28    ret
 00456D29    mov         edx,esi
 00456D2B    mov         eax,ebx
 00456D2D    call        TControl.WMNCLButtonDown
 00456D32    pop         esi
 00456D33    pop         ebx
 00456D34    ret
*}
end;

//00456D38
procedure TCustomForm.WMDestroy(var Message:TWMDestroy);
begin
{*
 00456D38    push        ebx
 00456D39    push        esi
 00456D3A    mov         esi,edx
 00456D3C    mov         ebx,eax
 00456D3E    mov         eax,[005AE3F0];^NewStyleControls:Boolean
 00456D43    cmp         byte ptr [eax],0
>00456D46    je          00456D5E
 00456D48    push        0
 00456D4A    push        1
 00456D4C    push        80
 00456D51    mov         eax,ebx
 00456D53    call        TWinControl.GetHandle
 00456D58    push        eax
 00456D59    call        user32.SendMessageA
 00456D5E    cmp         dword ptr [ebx+248],0
>00456D65    je          00456D8C
 00456D67    cmp         byte ptr [ebx+22F],1
>00456D6E    je          00456D8C
 00456D70    push        0
 00456D72    mov         eax,ebx
 00456D74    call        TWinControl.GetHandle
 00456D79    push        eax
 00456D7A    call        user32.SetMenu
 00456D7F    xor         edx,edx
 00456D81    mov         eax,dword ptr [ebx+248]
 00456D87    call        TMenu.SetWindowHandle
 00456D8C    mov         edx,esi
 00456D8E    mov         eax,ebx
 00456D90    call        TWinControl.WMDestroy
 00456D95    pop         esi
 00456D96    pop         ebx
 00456D97    ret
*}
end;

//00456D98
procedure TCustomForm.WMCommand(Message:TWMCharToItem);
begin
{*
 00456D98    push        ebx
 00456D99    push        esi
 00456D9A    mov         esi,edx
 00456D9C    mov         ebx,eax
 00456D9E    cmp         dword ptr [esi+8],0
>00456DA2    jne         00456DC0
 00456DA4    cmp         dword ptr [ebx+248],0;TCustomForm.FMenu:TMainMenu
>00456DAB    je          00456DC0
 00456DAD    mov         dx,word ptr [esi+4]
 00456DB1    mov         eax,dword ptr [ebx+248];TCustomForm.FMenu:TMainMenu
 00456DB7    call        TMenu.DispatchCommand
 00456DBC    test        al,al
>00456DBE    jne         00456DC9
 00456DC0    mov         edx,esi
 00456DC2    mov         eax,ebx
 00456DC4    call        TWinControl.WMCharToItem
 00456DC9    pop         esi
 00456DCA    pop         ebx
 00456DCB    ret
*}
end;

//00456DCC
procedure TCustomForm.WMInitMenuPopup(var Message:TWMInitMenuPopup);
begin
{*
 00456DCC    mov         ecx,dword ptr [eax+248]
 00456DD2    test        ecx,ecx
>00456DD4    je          00456DE0
 00456DD6    mov         edx,dword ptr [edx+4]
 00456DD9    mov         eax,ecx
 00456DDB    call        TMenu.DispatchPopup
 00456DE0    ret
*}
end;

//00456DE4
procedure TCustomForm.WMMenuChar(var Message:TWMMenuChar);
begin
{*
 00456DE4    push        ebx
 00456DE5    push        esi
 00456DE6    mov         esi,edx
 00456DE8    mov         ebx,eax
 00456DEA    mov         eax,dword ptr [ebx+248]
 00456DF0    test        eax,eax
>00456DF2    je          00456E0D
 00456DF4    mov         edx,esi
 00456DF6    call        TMenu.ProcessMenuChar
 00456DFB    cmp         dword ptr [esi+0C],0
>00456DFF    jne         00456E16
 00456E01    mov         edx,esi
 00456E03    mov         eax,ebx
 00456E05    mov         ecx,dword ptr [eax]
 00456E07    call        dword ptr [ecx-10]
 00456E0A    pop         esi
 00456E0B    pop         ebx
 00456E0C    ret
 00456E0D    mov         edx,esi
 00456E0F    mov         eax,ebx
 00456E11    mov         ecx,dword ptr [eax]
 00456E13    call        dword ptr [ecx-10]
 00456E16    pop         esi
 00456E17    pop         ebx
 00456E18    ret
*}
end;

//00456E1C
procedure TCustomForm.WMMenuSelect(var Message:TWMMenuSelect);
begin
{*
 00456E1C    push        ebp
 00456E1D    mov         ebp,esp
 00456E1F    push        0
 00456E21    push        ebx
 00456E22    push        esi
 00456E23    push        edi
 00456E24    mov         edi,eax
 00456E26    xor         eax,eax
 00456E28    push        ebp
 00456E29    push        456EB7
 00456E2E    push        dword ptr fs:[eax]
 00456E31    mov         dword ptr fs:[eax],esp
 00456E34    cmp         dword ptr [edi+248],0
>00456E3B    je          00456EA1
 00456E3D    xor         esi,esi
 00456E3F    cmp         word ptr [edx+6],0FFFF
>00456E45    jne         00456E4E
 00456E47    cmp         word ptr [edx+4],0
>00456E4C    je          00456E77
 00456E4E    xor         ebx,ebx
 00456E50    movzx       eax,word ptr [edx+4]
 00456E54    test        byte ptr [edx+6],10
>00456E58    je          00456E66
 00456E5A    mov         bl,1
 00456E5C    push        eax
 00456E5D    mov         eax,dword ptr [edx+8]
 00456E60    push        eax
 00456E61    call        user32.GetSubMenu
 00456E66    mov         ecx,ebx
 00456E68    mov         edx,eax
 00456E6A    mov         eax,dword ptr [edi+248]
 00456E70    call        TMenu.FindItem
 00456E75    mov         esi,eax
 00456E77    test        esi,esi
>00456E79    je          00456E95
 00456E7B    lea         edx,[ebp-4]
 00456E7E    mov         eax,dword ptr [esi+58]
 00456E81    call        GetLongHint
 00456E86    mov         edx,dword ptr [ebp-4]
 00456E89    mov         eax,[005E0CAC];Application:TApplication
 00456E8E    call        TApplication.SetHint
>00456E93    jmp         00456EA1
 00456E95    xor         edx,edx
 00456E97    mov         eax,[005E0CAC];Application:TApplication
 00456E9C    call        TApplication.SetHint
 00456EA1    xor         eax,eax
 00456EA3    pop         edx
 00456EA4    pop         ecx
 00456EA5    pop         ecx
 00456EA6    mov         dword ptr fs:[eax],edx
 00456EA9    push        456EBE
 00456EAE    lea         eax,[ebp-4]
 00456EB1    call        @LStrClr
 00456EB6    ret
>00456EB7    jmp         @HandleFinally
>00456EBC    jmp         00456EAE
 00456EBE    pop         edi
 00456EBF    pop         esi
 00456EC0    pop         ebx
 00456EC1    pop         ecx
 00456EC2    pop         ebp
 00456EC3    ret
*}
end;

//00456EC4
procedure TCustomForm.WMActivate(var Message:TWMActivate);
begin
{*
 00456EC4    cmp         byte ptr [eax+22F],2
>00456ECB    jne         00456ED3
 00456ECD    test        byte ptr [eax+1C],10
>00456ED1    je          00456EE0
 00456ED3    cmp         word ptr [edx+4],0
 00456ED8    setne       dl
 00456EDB    call        TCustomForm.SetActive
 00456EE0    ret
*}
end;

//00456EE4
procedure TCustomForm.Resizing(State:TWindowState);
begin
{*
 00456EE4    push        ebx
 00456EE5    push        esi
 00456EE6    mov         ebx,eax
 00456EE8    test        byte ptr [ebx+1C],10
>00456EEC    jne         00456EF4
 00456EEE    mov         byte ptr [ebx+22B],dl
 00456EF4    cmp         dl,1
>00456EF7    je          00456F04
 00456EF9    mov         eax,ebx
 00456EFB    mov         si,0FFD0
 00456EFF    call        @CallDynaInst
 00456F04    cmp         dword ptr [ebx+264],0
>00456F0B    je          00456F18
 00456F0D    mov         eax,dword ptr [ebx+264]
 00456F13    mov         edx,dword ptr [eax]
 00456F15    call        dword ptr [edx+10]
 00456F18    pop         esi
 00456F19    pop         ebx
 00456F1A    ret
*}
end;

//00456F1C
procedure TCustomForm.WMClose;
begin
{*
 00456F1C    call        TCustomForm.Close
 00456F21    ret
*}
end;

//00456F24
procedure TCustomForm.WMQueryEndSession(var Message:TWMQueryEndSession);
begin
{*
 00456F24    push        ebx
 00456F25    push        esi
 00456F26    mov         esi,edx
 00456F28    mov         ebx,eax
 00456F2A    mov         eax,ebx
 00456F2C    mov         edx,dword ptr [eax]
 00456F2E    call        dword ptr [edx+0E4]
 00456F34    test        al,al
>00456F36    je          00456F41
 00456F38    call        CallTerminateProcs
 00456F3D    test        al,al
>00456F3F    jne         00456F45
 00456F41    xor         eax,eax
>00456F43    jmp         00456F47
 00456F45    mov         al,1
 00456F47    and         eax,7F
 00456F4A    mov         dword ptr [esi+0C],eax
 00456F4D    pop         esi
 00456F4E    pop         ebx
 00456F4F    ret
*}
end;

//00456F50
procedure TCustomForm.CMAppSysCommand(var Message:TMessage);
begin
{*
 00456F50    push        ebx
 00456F51    push        esi
 00456F52    mov         ebx,edx
 00456F54    xor         edx,edx
 00456F56    mov         dword ptr [ebx+0C],edx
 00456F59    test        byte ptr [eax+1C],10
>00456F5D    jne         00456F7D
 00456F5F    cmp         byte ptr [eax+22F],1
>00456F66    je          00456F7D
 00456F68    cmp         dword ptr [eax+248],0
>00456F6F    je          00456F7D
 00456F71    mov         edx,dword ptr [eax+248]
 00456F77    cmp         byte ptr [edx+5C],0
>00456F7B    je          00456FA3
 00456F7D    mov         esi,dword ptr [ebx+8]
 00456F80    xor         edx,edx
 00456F82    call        TCustomForm.SendCancelMode
 00456F87    movzx       ecx,word ptr [esi+8]
 00456F8B    mov         edx,dword ptr [esi+4]
 00456F8E    mov         eax,0B017
 00456F93    call        SendAppMessage
 00456F98    test        eax,eax
>00456F9A    je          00456FA3
 00456F9C    mov         dword ptr [ebx+0C],1
 00456FA3    pop         esi
 00456FA4    pop         ebx
 00456FA5    ret
*}
end;

//00456FA8
procedure TCustomForm.WMSysCommand(var Message:TWMSysCommand);
begin
{*
 00456FA8    push        ebx
 00456FA9    push        esi
 00456FAA    mov         esi,edx
 00456FAC    mov         ebx,eax
 00456FAE    mov         eax,dword ptr [esi+4]
 00456FB1    and         eax,0FFF0
 00456FB6    cmp         eax,0F020
>00456FBB    jne         00456FD5
 00456FBD    mov         eax,[005E0CAC];Application:TApplication
 00456FC2    cmp         ebx,dword ptr [eax+44]
>00456FC5    jne         00456FD5
 00456FC7    mov         edx,esi
 00456FC9    mov         eax,[005E0CAC];Application:TApplication
 00456FCE    call        TApplication.WndProc
>00456FD3    jmp         00457002
 00456FD5    mov         eax,dword ptr [esi+4]
 00456FD8    and         eax,0FFF0
 00456FDD    cmp         eax,0F010
>00456FE2    jne         00456FF9
 00456FE4    test        byte ptr [ebx+1C],10
>00456FE8    jne         00456FF9
 00456FEA    cmp         byte ptr [ebx+5B],0
>00456FEE    je          00456FF9
 00456FF0    cmp         byte ptr [ebx+22B],1
>00456FF7    jne         00457002
 00456FF9    mov         edx,esi
 00456FFB    mov         eax,ebx
 00456FFD    call        TWinControl.WMSysCommand
 00457002    mov         eax,dword ptr [esi+4]
 00457005    and         eax,0FFF0
 0045700A    cmp         eax,0F020
>0045700F    je          00457018
 00457011    cmp         eax,0F120
>00457016    jne         0045702F
 00457018    test        byte ptr [ebx+1C],10
>0045701C    jne         0045702F
 0045701E    cmp         byte ptr [ebx+5B],0
>00457022    je          0045702F
 00457024    mov         eax,ebx
 00457026    mov         si,0FFD0
 0045702A    call        @CallDynaInst
 0045702F    pop         esi
 00457030    pop         ebx
 00457031    ret
*}
end;

//00457034
procedure TCustomForm.WMShowWindow(var Message:TWMShowWindow);
begin
{*
 00457034    push        ebx
 00457035    push        esi
 00457036    mov         esi,edx
 00457038    mov         ebx,eax
 0045703A    mov         eax,dword ptr [esi+8]
 0045703D    dec         eax
>0045703E    je          00457047
 00457040    sub         eax,2
>00457043    je          0045708E
>00457045    jmp         004570BE
 00457047    mov         eax,ebx
 00457049    call        TWinControl.GetHandle
 0045704E    push        eax
 0045704F    call        user32.IsIconic
 00457054    test        eax,eax
>00457056    je          00457061
 00457058    mov         byte ptr [ebx+22C],2
>0045705F    jmp         00457082
 00457061    mov         eax,ebx
 00457063    call        TWinControl.GetHandle
 00457068    push        eax
 00457069    call        user32.IsZoomed
 0045706E    test        eax,eax
>00457070    je          0045707B
 00457072    mov         byte ptr [ebx+22C],3
>00457079    jmp         00457082
 0045707B    mov         byte ptr [ebx+22C],1
 00457082    mov         edx,esi
 00457084    mov         eax,ebx
 00457086    mov         ecx,dword ptr [eax]
 00457088    call        dword ptr [ecx-10]
 0045708B    pop         esi
 0045708C    pop         ebx
 0045708D    ret
 0045708E    cmp         byte ptr [ebx+22C],0
>00457095    je          004570C7
 00457097    xor         eax,eax
 00457099    mov         al,byte ptr [ebx+22C]
 0045709F    mov         eax,dword ptr [eax*4+5ACE18]
 004570A6    push        eax
 004570A7    mov         eax,ebx
 004570A9    call        TWinControl.GetHandle
 004570AE    push        eax
 004570AF    call        user32.ShowWindow
 004570B4    mov         byte ptr [ebx+22C],0
 004570BB    pop         esi
 004570BC    pop         ebx
 004570BD    ret
 004570BE    mov         edx,esi
 004570C0    mov         eax,ebx
 004570C2    mov         ecx,dword ptr [eax]
 004570C4    call        dword ptr [ecx-10]
 004570C7    pop         esi
 004570C8    pop         ebx
 004570C9    ret
*}
end;

//004570CC
procedure TCustomForm.WMMDIActivate(var Message:TWMMDIActivate);
begin
{*
 004570CC    push        ebx
 004570CD    push        esi
 004570CE    mov         ebx,edx
 004570D0    mov         esi,eax
 004570D2    mov         edx,ebx
 004570D4    mov         eax,esi
 004570D6    mov         ecx,dword ptr [eax]
 004570D8    call        dword ptr [ecx-10]
 004570DB    cmp         byte ptr [esi+22F],1
>004570E2    jne         00457121
 004570E4    mov         eax,esi
 004570E6    call        TWinControl.GetHandle
 004570EB    cmp         eax,dword ptr [ebx+8]
 004570EE    sete        al
 004570F1    mov         ebx,eax
 004570F3    mov         edx,ebx
 004570F5    mov         eax,esi
 004570F7    call        TCustomForm.SetActive
 004570FC    test        bl,bl
>004570FE    je          00457121
 00457100    mov         eax,[005E0CAC];Application:TApplication
 00457105    mov         eax,dword ptr [eax+44]
 00457108    test        byte ptr [eax+54],4
>0045710C    je          00457121
 0045710E    mov         eax,[005E0CAC];Application:TApplication
 00457113    mov         eax,dword ptr [eax+44]
 00457116    mov         dl,1
 00457118    mov         si,0FFD1
 0045711C    call        @CallDynaInst
 00457121    pop         esi
 00457122    pop         ebx
 00457123    ret
*}
end;

//00457124
procedure TCustomForm.WMNextDlgCtl(var Message:TWMNextDlgCtl);
begin
{*
 00457124    cmp         word ptr [edx+8],0
>00457129    je          00457135
 0045712B    mov         eax,dword ptr [edx+4]
 0045712E    push        eax
 0045712F    call        user32.SetFocus
 00457134    ret
 00457135    push        1
 00457137    mov         ecx,dword ptr [edx+4]
 0045713A    cmp         ecx,1
 0045713D    sbb         ecx,ecx
 0045713F    neg         ecx
 00457141    mov         edx,dword ptr [eax+220]
 00457147    call        TWinControl.SelectNext
 0045714C    ret
*}
end;

//00457150
procedure TCustomForm.WMEnterMenuLoop(var Message:TMessage);
begin
{*
 00457150    push        ebx
 00457151    push        esi
 00457152    mov         esi,edx
 00457154    mov         ebx,eax
 00457156    xor         edx,edx
 00457158    mov         eax,ebx
 0045715A    call        TCustomForm.SendCancelMode
 0045715F    mov         edx,esi
 00457161    mov         eax,ebx
 00457163    mov         ecx,dword ptr [eax]
 00457165    call        dword ptr [ecx-10]
 00457168    pop         esi
 00457169    pop         ebx
 0045716A    ret
*}
end;

//0045716C
function GetMenuHelpContext(Menu:TMenu):Integer;
begin
{*
 0045716C    push        ebp
 0045716D    mov         ebp,esp
 0045716F    push        ebx
 00457170    mov         ebx,eax
 00457172    xor         eax,eax
 00457174    test        ebx,ebx
>00457176    je          004571A6
 00457178    mov         eax,dword ptr [ebp+8]
 0045717B    mov         eax,dword ptr [eax-4]
 0045717E    mov         eax,dword ptr [eax+8]
 00457181    mov         edx,dword ptr [eax+8]
 00457184    mov         cl,1
 00457186    mov         eax,ebx
 00457188    call        TMenu.GetHelpContext
 0045718D    test        eax,eax
>0045718F    jne         004571A6
 00457191    mov         eax,dword ptr [ebp+8]
 00457194    mov         eax,dword ptr [eax-4]
 00457197    mov         eax,dword ptr [eax+8]
 0045719A    mov         edx,dword ptr [eax+0C]
 0045719D    xor         ecx,ecx
 0045719F    mov         eax,ebx
 004571A1    call        TMenu.GetHelpContext
 004571A6    pop         ebx
 004571A7    pop         ebp
 004571A8    ret
*}
end;

//004571AC
function ControlHasHelp(const Control:TWinControl):Boolean;
begin
{*
 004571AC    push        ebx
 004571AD    push        esi
 004571AE    mov         esi,eax
 004571B0    xor         ebx,ebx
 004571B2    cmp         byte ptr [esi+150],1
>004571B9    jne         004571C8
 004571BB    cmp         dword ptr [esi+158],0
>004571C2    je          004571C8
 004571C4    mov         bl,1
>004571C6    jmp         004571DC
 004571C8    cmp         byte ptr [esi+150],0
>004571CF    jne         004571DC
 004571D1    cmp         dword ptr [esi+154],0
>004571D8    je          004571DC
 004571DA    mov         bl,1
 004571DC    mov         eax,ebx
 004571DE    pop         esi
 004571DF    pop         ebx
 004571E0    ret
*}
end;

//004571E4
procedure GetHelpInfo(const Control:TWinControl; var HType:THelpType; var ContextID:Integer; var Keyword:AnsiString);
begin
{*
 004571E4    push        ebp
 004571E5    mov         ebp,esp
 004571E7    push        ebx
 004571E8    mov         ebx,eax
 004571EA    cmp         byte ptr [ebx+150],1
>004571F1    jne         00457200
 004571F3    mov         byte ptr [edx],1
 004571F6    mov         eax,dword ptr [ebx+158]
 004571FC    mov         dword ptr [ecx],eax
>004571FE    jmp         00457211
 00457200    mov         byte ptr [edx],0
 00457203    mov         eax,dword ptr [ebp+8]
 00457206    mov         edx,dword ptr [ebx+154]
 0045720C    call        @LStrAsg
 00457211    pop         ebx
 00457212    pop         ebp
 00457213    ret         4
*}
end;

//00457218
procedure TCustomForm.WMHelp(var Message:TWMHelp);
begin
{*
 00457218    push        ebp
 00457219    mov         ebp,esp
 0045721B    add         esp,0FFFFFFDC
 0045721E    push        ebx
 0045721F    push        esi
 00457220    xor         ecx,ecx
 00457222    mov         dword ptr [ebp-10],ecx
 00457225    mov         dword ptr [ebp-4],edx
 00457228    mov         esi,eax
 0045722A    xor         eax,eax
 0045722C    push        ebp
 0045722D    push        457369
 00457232    push        dword ptr fs:[eax]
 00457235    mov         dword ptr fs:[eax],esp
 00457238    test        byte ptr [esi+1C],10
>0045723C    jne         00457353
 00457242    mov         eax,dword ptr [ebp-4]
 00457245    mov         eax,dword ptr [eax+8]
 00457248    cmp         dword ptr [eax+4],1
>0045724C    jne         004572AB
 0045724E    mov         eax,dword ptr [eax+0C]
 00457251    call        FindControl
 00457256    mov         ebx,eax
>00457258    jmp         0045725D
 0045725A    mov         ebx,dword ptr [ebx+30]
 0045725D    test        ebx,ebx
>0045725F    je          0045726C
 00457261    mov         eax,ebx
 00457263    call        ControlHasHelp
 00457268    test        al,al
>0045726A    je          0045725A
 0045726C    test        ebx,ebx
>0045726E    je          00457353
 00457274    lea         eax,[ebp-10]
 00457277    push        eax
 00457278    lea         ecx,[ebp-8]
 0045727B    lea         edx,[ebp-9]
 0045727E    mov         eax,ebx
 00457280    call        GetHelpInfo
 00457285    lea         ecx,[ebp-24]
 00457288    xor         edx,edx
 0045728A    xor         eax,eax
 0045728C    call        Point
 00457291    lea         edx,[ebp-24]
 00457294    lea         ecx,[ebp-1C]
 00457297    mov         eax,ebx
 00457299    call        TControl.ClientToScreen
 0045729E    lea         eax,[ebp-1C]
 004572A1    call        PointToSmallPoint
 004572A6    mov         dword ptr [ebp-14],eax
>004572A9    jmp         004572F6
 004572AB    mov         byte ptr [ebp-9],1
 004572AF    push        ebp
 004572B0    mov         eax,dword ptr [esi+248]
 004572B6    call        GetMenuHelpContext
 004572BB    pop         ecx
 004572BC    mov         dword ptr [ebp-8],eax
 004572BF    cmp         dword ptr [ebp-8],0
>004572C3    jne         004572D2
 004572C5    push        ebp
 004572C6    mov         eax,dword ptr [esi+7C]
 004572C9    call        GetMenuHelpContext
 004572CE    pop         ecx
 004572CF    mov         dword ptr [ebp-8],eax
 004572D2    lea         ecx,[ebp-24]
 004572D5    xor         edx,edx
 004572D7    xor         eax,eax
 004572D9    call        Point
 004572DE    lea         edx,[ebp-24]
 004572E1    lea         ecx,[ebp-1C]
 004572E4    mov         eax,esi
 004572E6    call        TControl.ClientToScreen
 004572EB    lea         eax,[ebp-1C]
 004572EE    call        PointToSmallPoint
 004572F3    mov         dword ptr [ebp-14],eax
 004572F6    test        byte ptr [esi+228],8
>004572FD    je          0045732B
 004572FF    cmp         byte ptr [ebp-9],1
>00457303    jne         0045732B
 00457305    mov         ecx,dword ptr [ebp-14]
 00457308    mov         edx,0D
 0045730D    mov         eax,[005E0CAC];Application:TApplication
 00457312    call        TApplication.HelpCommand
 00457317    mov         ecx,dword ptr [ebp-8]
 0045731A    mov         edx,8
 0045731F    mov         eax,[005E0CAC];Application:TApplication
 00457324    call        TApplication.HelpCommand
>00457329    jmp         00457353
 0045732B    cmp         byte ptr [ebp-9],1
>0045732F    jne         00457340
 00457331    mov         edx,dword ptr [ebp-8]
 00457334    mov         eax,[005E0CAC];Application:TApplication
 00457339    call        TApplication.HelpContext
>0045733E    jmp         00457353
 00457340    cmp         byte ptr [ebp-9],0
>00457344    jne         00457353
 00457346    mov         edx,dword ptr [ebp-10]
 00457349    mov         eax,[005E0CAC];Application:TApplication
 0045734E    call        TApplication.HelpKeyword
 00457353    xor         eax,eax
 00457355    pop         edx
 00457356    pop         ecx
 00457357    pop         ecx
 00457358    mov         dword ptr fs:[eax],edx
 0045735B    push        457370
 00457360    lea         eax,[ebp-10]
 00457363    call        @LStrClr
 00457368    ret
>00457369    jmp         @HandleFinally
>0045736E    jmp         00457360
 00457370    pop         esi
 00457371    pop         ebx
 00457372    mov         esp,ebp
 00457374    pop         ebp
 00457375    ret
*}
end;

//00457378
procedure TCustomForm.WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo);
begin
{*
 00457378    push        ebx
 00457379    push        esi
 0045737A    push        ecx
 0045737B    mov         dword ptr [esp],edx
 0045737E    mov         esi,eax
 00457380    test        byte ptr [esi+1C],2
>00457384    jne         004573DB
 00457386    cmp         byte ptr [esi+22A],0
>0045738D    je          004573DB
 0045738F    mov         edx,dword ptr [esp]
 00457392    mov         edx,dword ptr [edx+8]
 00457395    mov         eax,dword ptr [esi+74]
 00457398    lea         ecx,[edx+18]
 0045739B    mov         ebx,dword ptr [eax+14]
 0045739E    test        ebx,ebx
>004573A0    jbe         004573A4
 004573A2    mov         dword ptr [ecx],ebx
 004573A4    mov         ebx,dword ptr [eax+10]
 004573A7    test        ebx,ebx
>004573A9    jbe         004573AE
 004573AB    mov         dword ptr [ecx+4],ebx
 004573AE    lea         ecx,[edx+20]
 004573B1    mov         ebx,dword ptr [eax+0C]
 004573B4    test        ebx,ebx
>004573B6    jbe         004573BA
 004573B8    mov         dword ptr [ecx],ebx
 004573BA    mov         ebx,dword ptr [eax+8]
 004573BD    test        ebx,ebx
>004573BF    jbe         004573C4
 004573C1    mov         dword ptr [ecx+4],ebx
 004573C4    lea         eax,[edx+20]
 004573C7    push        eax
 004573C8    lea         eax,[edx+24]
 004573CB    push        eax
 004573CC    lea         ecx,[edx+1C]
 004573CF    lea         eax,[edx+18]
 004573D2    mov         edx,eax
 004573D4    mov         eax,esi
 004573D6    mov         ebx,dword ptr [eax]
 004573D8    call        dword ptr [ebx+38]
 004573DB    mov         edx,dword ptr [esp]
 004573DE    mov         eax,esi
 004573E0    mov         ecx,dword ptr [eax]
 004573E2    call        dword ptr [ecx-10]
 004573E5    pop         edx
 004573E6    pop         esi
 004573E7    pop         ebx
 004573E8    ret
*}
end;

//004573EC
procedure HandleEdge(var Edge:Integer; SnapToEdge:Integer; SnapDistance:Integer);
begin
{*
 004573EC    push        ebp
 004573ED    mov         ebp,esp
 004573EF    push        ebx
 004573F0    push        esi
 004573F1    mov         esi,edx
 004573F3    mov         ebx,eax
 004573F5    mov         eax,dword ptr [ebx]
 004573F7    add         eax,ecx
 004573F9    sub         eax,esi
 004573FB    cdq
 004573FC    xor         eax,edx
 004573FE    sub         eax,edx
 00457400    mov         edx,dword ptr [ebp+8]
 00457403    mov         edx,dword ptr [edx-4]
 00457406    cmp         eax,dword ptr [edx+2E4]
>0045740C    jge         00457412
 0045740E    sub         esi,ecx
 00457410    mov         dword ptr [ebx],esi
 00457412    pop         esi
 00457413    pop         ebx
 00457414    pop         ebp
 00457415    ret
*}
end;

//00457418
procedure TCustomForm.WMWindowPosChanging(var Message:TWMWindowPosChanging);
begin
{*
 00457418    push        ebp
 00457419    mov         ebp,esp
 0045741B    add         esp,0FFFFFFDC
 0045741E    push        ebx
 0045741F    push        esi
 00457420    mov         ebx,edx
 00457422    mov         dword ptr [ebp-4],eax
 00457425    mov         edx,dword ptr [ebp-4]
 00457428    cmp         byte ptr [edx+2E2],0
>0045742F    je          004574BD
 00457435    mov         eax,dword ptr [ebx+8]
 00457438    cmp         dword ptr [eax+8],0
>0045743C    jne         00457444
 0045743E    cmp         dword ptr [eax+0C],0
>00457442    je          004574BD
 00457444    mov         esi,dword ptr [ebx+8]
 00457447    mov         eax,dword ptr [ebp-4]
 0045744A    call        TCustomForm.GetMonitor
 0045744F    lea         edx,[ebp-14]
 00457452    call        TMonitor.GetWorkareaRect
 00457457    push        ebp
 00457458    mov         eax,dword ptr [ebp-4]
 0045745B    call        TCustomForm.GetMonitor
 00457460    lea         edx,[ebp-24]
 00457463    call        TMonitor.GetWorkareaRect
 00457468    mov         ecx,dword ptr [ebp-24]
 0045746B    lea         eax,[esi+8]
 0045746E    mov         edx,dword ptr [ebp-14]
 00457471    call        HandleEdge
 00457476    pop         ecx
 00457477    push        ebp
 00457478    mov         eax,dword ptr [ebp-4]
 0045747B    call        TCustomForm.GetMonitor
 00457480    lea         edx,[ebp-24]
 00457483    call        TMonitor.GetWorkareaRect
 00457488    mov         ecx,dword ptr [ebp-20]
 0045748B    lea         eax,[esi+0C]
 0045748E    mov         edx,dword ptr [ebp-10]
 00457491    call        HandleEdge
 00457496    pop         ecx
 00457497    push        ebp
 00457498    mov         eax,dword ptr [ebp-4]
 0045749B    mov         ecx,dword ptr [eax+48]
 0045749E    lea         eax,[esi+8]
 004574A1    mov         edx,dword ptr [ebp-0C]
 004574A4    call        HandleEdge
 004574A9    pop         ecx
 004574AA    push        ebp
 004574AB    mov         eax,dword ptr [ebp-4]
 004574AE    mov         ecx,dword ptr [eax+4C]
 004574B1    lea         eax,[esi+0C]
 004574B4    mov         edx,dword ptr [ebp-8]
 004574B7    call        HandleEdge
 004574BC    pop         ecx
 004574BD    mov         edx,ebx
 004574BF    mov         eax,dword ptr [ebp-4]
 004574C2    call        TWinControl.WMWindowPosChanging
 004574C7    pop         esi
 004574C8    pop         ebx
 004574C9    mov         esp,ebp
 004574CB    pop         ebp
 004574CC    ret
*}
end;

//004574D0
procedure TCustomForm.CMActivate(var Message:TCMActivate);
begin
{*
 004574D0    push        ebx
 004574D1    push        esi
 004574D2    mov         ebx,eax
 004574D4    test        byte ptr [ebx+1C],2
>004574D8    jne         004574E8
 004574DA    mov         eax,ebx
 004574DC    mov         si,0FFB3
 004574E0    call        @CallDynaInst
 004574E5    pop         esi
 004574E6    pop         ebx
 004574E7    ret
 004574E8    or          byte ptr [ebx+2F4],20
 004574EF    pop         esi
 004574F0    pop         ebx
 004574F1    ret
*}
end;

//004574F4
procedure TCustomForm.CMDeactivate(var Message:TCMDeactivate);
begin
{*
 004574F4    push        ebx
 004574F5    push        esi
 004574F6    mov         ebx,eax
 004574F8    test        byte ptr [ebx+1C],2
>004574FC    jne         0045750C
 004574FE    mov         eax,ebx
 00457500    mov         si,0FFB1
 00457504    call        @CallDynaInst
 00457509    pop         esi
 0045750A    pop         ebx
 0045750B    ret
 0045750C    and         byte ptr [ebx+2F4],0DF
 00457513    pop         esi
 00457514    pop         ebx
 00457515    ret
*}
end;

//00457518
procedure TCustomForm.CMDialogKey(var Message:TCMDialogKey);
begin
{*
 00457518    push        ebx
 00457519    push        esi
 0045751A    mov         esi,edx
 0045751C    mov         ebx,eax
 0045751E    push        12
 00457520    call        user32.GetKeyState
 00457525    test        ax,ax
>00457528    jl          004575A6
 0045752A    mov         ax,word ptr [esi+4]
 0045752E    sub         ax,9
>00457532    je          0045753F
 00457534    add         eax,0FFFFFFE4
 00457537    sub         ax,4
>0045753B    jb          00457571
>0045753D    jmp         004575A6
 0045753F    push        11
 00457541    call        user32.GetKeyState
 00457546    test        ax,ax
>00457549    jl          004575A6
 0045754B    push        1
 0045754D    push        10
 0045754F    call        user32.GetKeyState
 00457554    test        ax,ax
 00457557    setge       cl
 0045755A    mov         edx,dword ptr [ebx+220]
 00457560    mov         eax,ebx
 00457562    call        TWinControl.SelectNext
 00457567    mov         dword ptr [esi+0C],1
 0045756E    pop         esi
 0045756F    pop         ebx
 00457570    ret
 00457571    mov         eax,dword ptr [ebx+220]
 00457577    test        eax,eax
>00457579    je          004575AF
 0045757B    push        0
 0045757D    mov         dx,word ptr [esi+4]
 00457581    cmp         dx,27
>00457585    je          00457591
 00457587    cmp         dx,28
>0045758B    je          00457591
 0045758D    xor         ecx,ecx
>0045758F    jmp         00457593
 00457591    mov         cl,1
 00457593    mov         edx,dword ptr [eax+30]
 00457596    xchg        eax,edx
 00457597    call        TWinControl.SelectNext
 0045759C    mov         dword ptr [esi+0C],1
 004575A3    pop         esi
 004575A4    pop         ebx
 004575A5    ret
 004575A6    mov         edx,esi
 004575A8    mov         eax,ebx
 004575AA    call        TWinControl.CMDialogKey
 004575AF    pop         esi
 004575B0    pop         ebx
 004575B1    ret
*}
end;

//004575B4
procedure TCustomForm.CMShowingChanged(var Message:TMessage);
begin
{*
 004575B4    push        ebp
 004575B5    mov         ebp,esp
 004575B7    add         esp,0FFFFFFF8
 004575BA    push        ebx
 004575BB    push        esi
 004575BC    push        edi
 004575BD    xor         ecx,ecx
 004575BF    mov         dword ptr [ebp-8],ecx
 004575C2    mov         dword ptr [ebp-4],eax
 004575C5    xor         eax,eax
 004575C7    push        ebp
 004575C8    push        457B1E
 004575CD    push        dword ptr fs:[eax]
 004575D0    mov         dword ptr fs:[eax],esp
 004575D3    mov         eax,dword ptr [ebp-4]
 004575D6    test        byte ptr [eax+1C],10;TCustomForm.FComponentState:TComponentState
>004575DA    jne         00457609
 004575DC    mov         eax,dword ptr [ebp-4]
 004575DF    test        byte ptr [eax+2F4],4;TCustomForm.FFormState:TFormState
>004575E6    je          00457609
 004575E8    lea         edx,[ebp-8]
 004575EB    mov         eax,[005AE7F0];^SVisibleChanged:TResStringRec
 004575F0    call        LoadStr
 004575F5    mov         ecx,dword ptr [ebp-8]
 004575F8    mov         dl,1
 004575FA    mov         eax,[00417C8C];EInvalidOperation
 004575FF    call        Exception.Create;EInvalidOperation.Create
 00457604    call        @RaiseExcept
 00457609    mov         eax,[005E0CAC];Application:TApplication
 0045760E    call        TApplication.UpdateVisible
 00457613    mov         eax,dword ptr [ebp-4]
 00457616    or          byte ptr [eax+2F4],4;TCustomForm.FFormState:TFormState
 0045761D    xor         edx,edx
 0045761F    push        ebp
 00457620    push        457B01
 00457625    push        dword ptr fs:[edx]
 00457628    mov         dword ptr fs:[edx],esp
 0045762B    mov         eax,dword ptr [ebp-4]
 0045762E    test        byte ptr [eax+1C],10;TCustomForm.FComponentState:TComponentState
>00457632    jne         00457AE9
 00457638    mov         eax,dword ptr [ebp-4]
 0045763B    cmp         byte ptr [eax+1A6],0;TCustomForm.FShowing:Boolean
>00457642    je          004579E4
 00457648    xor         eax,eax
 0045764A    push        ebp
 0045764B    push        45766C
 00457650    push        dword ptr fs:[eax]
 00457653    mov         dword ptr fs:[eax],esp
 00457656    mov         eax,dword ptr [ebp-4]
 00457659    mov         si,0FFAE
 0045765D    call        @CallDynaInst;TCustomForm.DoShow
 00457662    xor         eax,eax
 00457664    pop         edx
 00457665    pop         ecx
 00457666    pop         ecx
 00457667    mov         dword ptr fs:[eax],edx
>0045766A    jmp         00457683
>0045766C    jmp         @HandleAnyException
 00457671    mov         edx,dword ptr [ebp-4]
 00457674    mov         eax,[005E0CAC];Application:TApplication
 00457679    call        TApplication.HandleException
 0045767E    call        @DoneExcept
 00457683    mov         eax,dword ptr [ebp-4]
 00457686    cmp         byte ptr [eax+230],4;TCustomForm.FPosition:TPosition
>0045768D    je          004576AF
 0045768F    mov         eax,dword ptr [ebp-4]
 00457692    cmp         byte ptr [eax+230],6;TCustomForm.FPosition:TPosition
>00457699    jne         00457766
 0045769F    mov         eax,dword ptr [ebp-4]
 004576A2    cmp         byte ptr [eax+22F],1;TCustomForm.FFormStyle:TFormStyle
>004576A9    jne         00457766
 004576AF    mov         eax,dword ptr [ebp-4]
 004576B2    cmp         byte ptr [eax+22F],1;TCustomForm.FFormStyle:TFormStyle
>004576B9    jne         004576F3
 004576BB    mov         eax,[005E0CAC];Application:TApplication
 004576C0    mov         eax,dword ptr [eax+44]
 004576C3    call        TControl.GetClientWidth
 004576C8    mov         ebx,eax
 004576CA    mov         eax,dword ptr [ebp-4]
 004576CD    sub         ebx,dword ptr [eax+48]
 004576D0    sar         ebx,1
>004576D2    jns         004576D7
 004576D4    adc         ebx,0
 004576D7    mov         eax,[005E0CAC];Application:TApplication
 004576DC    mov         eax,dword ptr [eax+44]
 004576DF    call        TControl.GetClientHeight
 004576E4    mov         edx,dword ptr [ebp-4]
 004576E7    sub         eax,dword ptr [edx+4C]
 004576EA    sar         eax,1
>004576EC    jns         00457723
 004576EE    adc         eax,0
>004576F1    jmp         00457723
 004576F3    mov         eax,[005E0CB0];Screen:TScreen
 004576F8    call        TScreen.GetWidth
 004576FD    mov         ebx,eax
 004576FF    mov         eax,dword ptr [ebp-4]
 00457702    sub         ebx,dword ptr [eax+48]
 00457705    sar         ebx,1
>00457707    jns         0045770C
 00457709    adc         ebx,0
 0045770C    mov         eax,[005E0CB0];Screen:TScreen
 00457711    call        TScreen.GetHeight
 00457716    mov         edx,dword ptr [ebp-4]
 00457719    sub         eax,dword ptr [edx+4C]
 0045771C    sar         eax,1
>0045771E    jns         00457723
 00457720    adc         eax,0
 00457723    test        ebx,ebx
>00457725    jge         00457729
 00457727    xor         ebx,ebx
 00457729    test        eax,eax
>0045772B    jge         0045772F
 0045772D    xor         eax,eax
 0045772F    mov         edx,dword ptr [ebp-4]
 00457732    mov         edx,dword ptr [edx+48];TCustomForm.Width:Integer
 00457735    push        edx
 00457736    mov         edx,dword ptr [ebp-4]
 00457739    mov         edx,dword ptr [edx+4C];TCustomForm.Height:Integer
 0045773C    push        edx
 0045773D    mov         ecx,eax
 0045773F    mov         edx,ebx
 00457741    mov         eax,dword ptr [ebp-4]
 00457744    mov         ebx,dword ptr [eax]
 00457746    call        dword ptr [ebx+84];TWinControl.SetBounds
 0045774C    mov         eax,dword ptr [ebp-4]
 0045774F    cmp         byte ptr [eax+57],0;TCustomForm.FVisible:Boolean
>00457753    je          004578F0
 00457759    mov         eax,dword ptr [ebp-4]
 0045775C    call        TCustomForm.SetWindowToMonitor
>00457761    jmp         004578F0
 00457766    mov         eax,dword ptr [ebp-4]
 00457769    mov         al,byte ptr [eax+230];TCustomForm.FPosition:TPosition
 0045776F    mov         edx,eax
 00457771    add         dl,0FA
 00457774    sub         dl,2
>00457777    jae         0045784B
 0045777D    mov         eax,[005E0CAC];Application:TApplication
 00457782    mov         esi,dword ptr [eax+44]
 00457785    mov         eax,dword ptr [ebp-4]
 00457788    cmp         byte ptr [eax+230],7;TCustomForm.FPosition:TPosition
>0045778F    jne         004577AC
 00457791    mov         eax,dword ptr [ebp-4]
 00457794    mov         eax,dword ptr [eax+4];TCustomForm.FOwner:TComponent
 00457797    mov         edx,dword ptr ds:[450CFC];TCustomForm
 0045779D    call        @IsClass
 004577A2    test        al,al
>004577A4    je          004577AC
 004577A6    mov         eax,dword ptr [ebp-4]
 004577A9    mov         esi,dword ptr [eax+4];TCustomForm.FOwner:TComponent
 004577AC    test        esi,esi
>004577AE    je          004577D8
 004577B0    mov         ebx,dword ptr [esi+48]
 004577B3    mov         eax,dword ptr [ebp-4]
 004577B6    sub         ebx,dword ptr [eax+48]
 004577B9    sar         ebx,1
>004577BB    jns         004577C0
 004577BD    adc         ebx,0
 004577C0    add         ebx,dword ptr [esi+40]
 004577C3    mov         eax,dword ptr [esi+4C]
 004577C6    mov         edx,dword ptr [ebp-4]
 004577C9    sub         eax,dword ptr [edx+4C]
 004577CC    sar         eax,1
>004577CE    jns         004577D3
 004577D0    adc         eax,0
 004577D3    add         eax,dword ptr [esi+44]
>004577D6    jmp         00457808
 004577D8    mov         eax,[005E0CB0];Screen:TScreen
 004577DD    call        TScreen.GetWidth
 004577E2    mov         ebx,eax
 004577E4    mov         eax,dword ptr [ebp-4]
 004577E7    sub         ebx,dword ptr [eax+48]
 004577EA    sar         ebx,1
>004577EC    jns         004577F1
 004577EE    adc         ebx,0
 004577F1    mov         eax,[005E0CB0];Screen:TScreen
 004577F6    call        TScreen.GetHeight
 004577FB    mov         edx,dword ptr [ebp-4]
 004577FE    sub         eax,dword ptr [edx+4C]
 00457801    sar         eax,1
>00457803    jns         00457808
 00457805    adc         eax,0
 00457808    test        ebx,ebx
>0045780A    jge         0045780E
 0045780C    xor         ebx,ebx
 0045780E    test        eax,eax
>00457810    jge         00457814
 00457812    xor         eax,eax
 00457814    mov         edx,dword ptr [ebp-4]
 00457817    mov         edx,dword ptr [edx+48];TCustomForm.Width:Integer
 0045781A    push        edx
 0045781B    mov         edx,dword ptr [ebp-4]
 0045781E    mov         edx,dword ptr [edx+4C];TCustomForm.Height:Integer
 00457821    push        edx
 00457822    mov         ecx,eax
 00457824    mov         edx,ebx
 00457826    mov         eax,dword ptr [ebp-4]
 00457829    mov         ebx,dword ptr [eax]
 0045782B    call        dword ptr [ebx+84];TWinControl.SetBounds
 00457831    mov         eax,dword ptr [ebp-4]
 00457834    cmp         byte ptr [eax+57],0;TCustomForm.FVisible:Boolean
>00457838    je          004578F0
 0045783E    mov         eax,dword ptr [ebp-4]
 00457841    call        TCustomForm.SetWindowToMonitor
>00457846    jmp         004578F0
 0045784B    cmp         al,5
>0045784D    jne         004578F0
 00457853    mov         eax,dword ptr [ebp-4]
 00457856    cmp         byte ptr [eax+22F],1;TCustomForm.FFormStyle:TFormStyle
>0045785D    jne         00457897
 0045785F    mov         eax,[005E0CAC];Application:TApplication
 00457864    mov         eax,dword ptr [eax+44]
 00457867    call        TControl.GetClientWidth
 0045786C    mov         ebx,eax
 0045786E    mov         eax,dword ptr [ebp-4]
 00457871    sub         ebx,dword ptr [eax+48]
 00457874    sar         ebx,1
>00457876    jns         0045787B
 00457878    adc         ebx,0
 0045787B    mov         eax,[005E0CAC];Application:TApplication
 00457880    mov         eax,dword ptr [eax+44]
 00457883    call        TControl.GetClientHeight
 00457888    mov         edx,dword ptr [ebp-4]
 0045788B    sub         eax,dword ptr [edx+4C]
 0045788E    sar         eax,1
>00457890    jns         004578C7
 00457892    adc         eax,0
>00457895    jmp         004578C7
 00457897    mov         eax,[005E0CB0];Screen:TScreen
 0045789C    call        TScreen.GetDesktopWidth
 004578A1    mov         ebx,eax
 004578A3    mov         eax,dword ptr [ebp-4]
 004578A6    sub         ebx,dword ptr [eax+48]
 004578A9    sar         ebx,1
>004578AB    jns         004578B0
 004578AD    adc         ebx,0
 004578B0    mov         eax,[005E0CB0];Screen:TScreen
 004578B5    call        TScreen.GetDesktopHeight
 004578BA    mov         edx,dword ptr [ebp-4]
 004578BD    sub         eax,dword ptr [edx+4C]
 004578C0    sar         eax,1
>004578C2    jns         004578C7
 004578C4    adc         eax,0
 004578C7    test        ebx,ebx
>004578C9    jge         004578CD
 004578CB    xor         ebx,ebx
 004578CD    test        eax,eax
>004578CF    jge         004578D3
 004578D1    xor         eax,eax
 004578D3    mov         edx,dword ptr [ebp-4]
 004578D6    mov         edx,dword ptr [edx+48];TCustomForm.Width:Integer
 004578D9    push        edx
 004578DA    mov         edx,dword ptr [ebp-4]
 004578DD    mov         edx,dword ptr [edx+4C];TCustomForm.Height:Integer
 004578E0    push        edx
 004578E1    mov         ecx,eax
 004578E3    mov         edx,ebx
 004578E5    mov         eax,dword ptr [ebp-4]
 004578E8    mov         ebx,dword ptr [eax]
 004578EA    call        dword ptr [ebx+84];TWinControl.SetBounds
 004578F0    mov         eax,dword ptr [ebp-4]
 004578F3    mov         byte ptr [eax+230],0;TCustomForm.FPosition:TPosition
 004578FA    mov         eax,dword ptr [ebp-4]
 004578FD    cmp         byte ptr [eax+22F],1;TCustomForm.FFormStyle:TFormStyle
>00457904    jne         004579BF
 0045790A    mov         eax,dword ptr [ebp-4]
 0045790D    cmp         byte ptr [eax+22B],2;TCustomForm.FWindowState:TWindowState
>00457914    jne         0045794C
 00457916    push        0
 00457918    mov         eax,dword ptr [ebp-4]
 0045791B    call        TWinControl.GetHandle
 00457920    push        eax
 00457921    push        223
 00457926    mov         eax,[005E0CAC];Application:TApplication
 0045792B    mov         eax,dword ptr [eax+44]
 0045792E    mov         eax,dword ptr [eax+254]
 00457934    push        eax
 00457935    call        user32.SendMessageA
 0045793A    push        3
 0045793C    mov         eax,dword ptr [ebp-4]
 0045793F    call        TWinControl.GetHandle
 00457944    push        eax
 00457945    call        user32.ShowWindow
>0045794A    jmp         0045799D
 0045794C    mov         eax,dword ptr [ebp-4]
 0045794F    movzx       eax,byte ptr [eax+22B];TCustomForm.FWindowState:TWindowState
 00457956    mov         eax,dword ptr [eax*4+5ACE28]
 0045795D    push        eax
 0045795E    mov         eax,dword ptr [ebp-4]
 00457961    call        TWinControl.GetHandle
 00457966    push        eax
 00457967    call        user32.ShowWindow
 0045796C    mov         eax,dword ptr [ebp-4]
 0045796F    mov         eax,dword ptr [eax+48];TCustomForm.Width:Integer
 00457972    mov         edx,dword ptr [ebp-4]
 00457975    mov         edx,dword ptr [edx+4C];TCustomForm.Height:Integer
 00457978    shl         edx,10
 0045797B    or          eax,edx
 0045797D    push        eax
 0045797E    push        0
 00457980    push        5
 00457982    mov         eax,dword ptr [ebp-4]
 00457985    call        TWinControl.GetHandle
 0045798A    push        eax
 0045798B    push        406FD4;user32.DefMDIChildProcA:Longint
 00457990    call        user32.CallWindowProcA
 00457995    mov         eax,dword ptr [ebp-4]
 00457998    call        TControl.BringToFront
 0045799D    push        0
 0045799F    push        0
 004579A1    push        234
 004579A6    mov         eax,[005E0CAC];Application:TApplication
 004579AB    mov         eax,dword ptr [eax+44]
 004579AE    mov         eax,dword ptr [eax+254]
 004579B4    push        eax
 004579B5    call        user32.SendMessageA
>004579BA    jmp         00457AE9
 004579BF    mov         eax,dword ptr [ebp-4]
 004579C2    movzx       eax,byte ptr [eax+22B];TCustomForm.FWindowState:TWindowState
 004579C9    mov         eax,dword ptr [eax*4+5ACE28]
 004579D0    push        eax
 004579D1    mov         eax,dword ptr [ebp-4]
 004579D4    call        TWinControl.GetHandle
 004579D9    push        eax
 004579DA    call        user32.ShowWindow
>004579DF    jmp         00457AE9
 004579E4    xor         eax,eax
 004579E6    push        ebp
 004579E7    push        457A08
 004579EC    push        dword ptr fs:[eax]
 004579EF    mov         dword ptr fs:[eax],esp
 004579F2    mov         eax,dword ptr [ebp-4]
 004579F5    mov         si,0FFAF
 004579F9    call        @CallDynaInst;TCustomForm.DoHide
 004579FE    xor         eax,eax
 00457A00    pop         edx
 00457A01    pop         ecx
 00457A02    pop         ecx
 00457A03    mov         dword ptr fs:[eax],edx
>00457A06    jmp         00457A1F
>00457A08    jmp         @HandleAnyException
 00457A0D    mov         edx,dword ptr [ebp-4]
 00457A10    mov         eax,[005E0CAC];Application:TApplication
 00457A15    call        TApplication.HandleException
 00457A1A    call        @DoneExcept
 00457A1F    mov         eax,[005E0CB0];Screen:TScreen
 00457A24    mov         eax,dword ptr [eax+6C]
 00457A27    cmp         eax,dword ptr [ebp-4]
>00457A2A    jne         00457A36
 00457A2C    xor         edx,edx
 00457A2E    mov         eax,dword ptr [ebp-4]
 00457A31    call        TCustomForm.MergeMenu
 00457A36    mov         eax,dword ptr [ebp-4]
 00457A39    cmp         byte ptr [eax+22F],1;TCustomForm.FFormStyle:TFormStyle
>00457A40    jne         00457A4F
 00457A42    mov         eax,dword ptr [ebp-4]
 00457A45    call        TWinControl.DestroyHandle
>00457A4A    jmp         00457AE9
 00457A4F    mov         eax,dword ptr [ebp-4]
 00457A52    test        byte ptr [eax+2F4],8;TCustomForm.FFormState:TFormState
>00457A59    je          00457A7A
 00457A5B    push        97
 00457A60    push        0
 00457A62    push        0
 00457A64    push        0
 00457A66    push        0
 00457A68    push        0
 00457A6A    mov         eax,dword ptr [ebp-4]
 00457A6D    call        TWinControl.GetHandle
 00457A72    push        eax
 00457A73    call        user32.SetWindowPos
>00457A78    jmp         00457AE9
 00457A7A    xor         ebx,ebx
 00457A7C    mov         eax,dword ptr [ebp-4]
 00457A7F    call        TWinControl.GetHandle
 00457A84    mov         esi,eax
 00457A86    call        user32.GetActiveWindow
 00457A8B    cmp         esi,eax
>00457A8D    jne         00457AB0
 00457A8F    mov         eax,dword ptr [ebp-4]
 00457A92    call        TWinControl.GetHandle
 00457A97    push        eax
 00457A98    call        user32.IsIconic
 00457A9D    test        eax,eax
>00457A9F    jne         00457AB0
 00457AA1    mov         eax,dword ptr [ebp-4]
 00457AA4    call        TWinControl.GetHandle
 00457AA9    call        FindTopMostWindow
 00457AAE    mov         ebx,eax
 00457AB0    test        ebx,ebx
>00457AB2    je          00457AD9
 00457AB4    push        97
 00457AB9    push        0
 00457ABB    push        0
 00457ABD    push        0
 00457ABF    push        0
 00457AC1    push        0
 00457AC3    mov         eax,dword ptr [ebp-4]
 00457AC6    call        TWinControl.GetHandle
 00457ACB    push        eax
 00457ACC    call        user32.SetWindowPos
 00457AD1    push        ebx
 00457AD2    call        user32.SetActiveWindow
>00457AD7    jmp         00457AE9
 00457AD9    push        0
 00457ADB    mov         eax,dword ptr [ebp-4]
 00457ADE    call        TWinControl.GetHandle
 00457AE3    push        eax
 00457AE4    call        user32.ShowWindow
 00457AE9    xor         eax,eax
 00457AEB    pop         edx
 00457AEC    pop         ecx
 00457AED    pop         ecx
 00457AEE    mov         dword ptr fs:[eax],edx
 00457AF1    push        457B08
 00457AF6    mov         eax,dword ptr [ebp-4]
 00457AF9    and         byte ptr [eax+2F4],0FB;TCustomForm.FFormState:TFormState
 00457B00    ret
>00457B01    jmp         @HandleFinally
>00457B06    jmp         00457AF6
 00457B08    xor         eax,eax
 00457B0A    pop         edx
 00457B0B    pop         ecx
 00457B0C    pop         ecx
 00457B0D    mov         dword ptr fs:[eax],edx
 00457B10    push        457B25
 00457B15    lea         eax,[ebp-8]
 00457B18    call        @LStrClr
 00457B1D    ret
>00457B1E    jmp         @HandleFinally
>00457B23    jmp         00457B15
 00457B25    pop         edi
 00457B26    pop         esi
 00457B27    pop         ebx
 00457B28    pop         ecx
 00457B29    pop         ecx
 00457B2A    pop         ebp
 00457B2B    ret
*}
end;

//00457B2C
procedure TCustomForm.CMIconChanged(var Message:TMessage);
begin
{*
 00457B2C    push        ebx
 00457B2D    mov         ebx,eax
 00457B2F    mov         eax,dword ptr [ebx+240]
 00457B35    call        TIcon.GetHandle
 00457B3A    test        eax,eax
>00457B3C    jne         00457B47
 00457B3E    xor         edx,edx
 00457B40    mov         eax,ebx
 00457B42    call        TCustomForm.IconChanged
 00457B47    pop         ebx
 00457B48    ret
*}
end;

//00457B4C
procedure TCustomForm.CMRelease;
begin
{*
 00457B4C    call        TObject.Free
 00457B51    ret
*}
end;

//00457B54
procedure TCustomForm.CMTextChanged(var Message:TMessage);
begin
{*
 00457B54    push        esi
 00457B55    mov         esi,eax
 00457B57    mov         eax,esi
 00457B59    mov         ecx,dword ptr [eax]
 00457B5B    call        dword ptr [ecx-10]
 00457B5E    cmp         byte ptr [esi+22F],1
>00457B65    jne         00457BA0
 00457B67    mov         eax,[005E0CAC];Application:TApplication
 00457B6C    cmp         dword ptr [eax+44],0
>00457B70    je          00457BA0
 00457B72    mov         eax,[005E0CAC];Application:TApplication
 00457B77    mov         eax,dword ptr [eax+44]
 00457B7A    cmp         dword ptr [eax+254],0
>00457B81    je          00457BA0
 00457B83    push        0
 00457B85    push        0
 00457B87    push        234
 00457B8C    mov         eax,[005E0CAC];Application:TApplication
 00457B91    mov         eax,dword ptr [eax+44]
 00457B94    mov         eax,dword ptr [eax+254]
 00457B9A    push        eax
 00457B9B    call        user32.SendMessageA
 00457BA0    pop         esi
 00457BA1    ret
*}
end;

//00457BA4
procedure TCustomForm.CMUIActivate;
begin
{*
 00457BA4    mov         ecx,dword ptr [eax]
 00457BA6    call        dword ptr [ecx-10];TCustomForm.DefaultHandler
 00457BA9    ret
*}
end;

//00457BAC
procedure TCustomForm.CMParentFontChanged(var Message:TMessage);
begin
{*
 00457BAC    push        ebp
 00457BAD    mov         ebp,esp
 00457BAF    push        ecx
 00457BB0    push        esi
 00457BB1    mov         esi,eax
 00457BB3    cmp         byte ptr [esi+59],0
>00457BB7    je          00457C11
 00457BB9    cmp         dword ptr [edx+4],0
>00457BBD    je          00457BCC
 00457BBF    mov         eax,dword ptr [esi+68]
 00457BC2    mov         edx,dword ptr [edx+8]
 00457BC5    mov         ecx,dword ptr [eax]
 00457BC7    call        dword ptr [ecx+8]
>00457BCA    jmp         00457C11
 00457BCC    mov         dl,1
 00457BCE    mov         eax,[0042451C];TFont
 00457BD3    call        TFont.Create
 00457BD8    mov         dword ptr [ebp-4],eax
 00457BDB    xor         eax,eax
 00457BDD    push        ebp
 00457BDE    push        457C0A
 00457BE3    push        dword ptr fs:[eax]
 00457BE6    mov         dword ptr fs:[eax],esp
 00457BE9    mov         eax,dword ptr [esi+68]
 00457BEC    mov         edx,dword ptr [ebp-4]
 00457BEF    mov         ecx,dword ptr [eax]
 00457BF1    call        dword ptr [ecx+8]
 00457BF4    xor         eax,eax
 00457BF6    pop         edx
 00457BF7    pop         ecx
 00457BF8    pop         ecx
 00457BF9    mov         dword ptr fs:[eax],edx
 00457BFC    push        457C11
 00457C01    mov         eax,dword ptr [ebp-4]
 00457C04    call        TObject.Free
 00457C09    ret
>00457C0A    jmp         @HandleFinally
>00457C0F    jmp         00457C01
 00457C11    pop         esi
 00457C12    pop         ecx
 00457C13    pop         ebp
 00457C14    ret
*}
end;

//00457C18
procedure TCustomForm.CMIsShortCut(var Message:TWMKey);
begin
{*
 00457C18    push        ebx
 00457C19    push        esi
 00457C1A    push        edi
 00457C1B    mov         ebx,edx
 00457C1D    mov         edi,eax
 00457C1F    mov         edx,ebx
 00457C21    mov         eax,edi
 00457C23    mov         si,0FFAB
 00457C27    call        @CallDynaInst
 00457C2C    test        al,al
>00457C2E    je          00457C39
 00457C30    mov         dword ptr [ebx+0C],1
>00457C37    jmp         00457C3E
 00457C39    xor         eax,eax
 00457C3B    mov         dword ptr [ebx+0C],eax
 00457C3E    pop         edi
 00457C3F    pop         esi
 00457C40    pop         ebx
 00457C41    ret
*}
end;

//00457C44
procedure TCustomForm.Close;
begin
{*
 00457C44    push        ebx
 00457C45    push        esi
 00457C46    push        ecx
 00457C47    mov         ebx,eax
 00457C49    test        byte ptr [ebx+2F4],8
>00457C50    je          00457C61
 00457C52    mov         dword ptr [ebx+24C],2
>00457C5C    jmp         00457CE1
 00457C61    mov         eax,ebx
 00457C63    mov         edx,dword ptr [eax]
 00457C65    call        dword ptr [edx+0E4]
 00457C6B    test        al,al
>00457C6D    je          00457CE1
 00457C6F    cmp         byte ptr [ebx+22F],1
>00457C76    jne         00457C8D
 00457C78    test        byte ptr [ebx+228],2
>00457C7F    je          00457C87
 00457C81    mov         byte ptr [esp],3
>00457C85    jmp         00457C91
 00457C87    mov         byte ptr [esp],0
>00457C8B    jmp         00457C91
 00457C8D    mov         byte ptr [esp],1
 00457C91    mov         edx,esp
 00457C93    mov         eax,ebx
 00457C95    mov         si,0FFB0
 00457C99    call        @CallDynaInst
 00457C9E    cmp         byte ptr [esp],0
>00457CA2    je          00457CE1
 00457CA4    mov         eax,[005E0CAC];Application:TApplication
 00457CA9    cmp         ebx,dword ptr [eax+44]
>00457CAC    jne         00457CBA
 00457CAE    mov         eax,[005E0CAC];Application:TApplication
 00457CB3    call        TApplication.Terminate
>00457CB8    jmp         00457CE1
 00457CBA    cmp         byte ptr [esp],1
>00457CBE    jne         00457CC9
 00457CC0    mov         eax,ebx
 00457CC2    call        TCustomForm.Hide
>00457CC7    jmp         00457CE1
 00457CC9    cmp         byte ptr [esp],3
>00457CCD    jne         00457CDA
 00457CCF    mov         dl,1
 00457CD1    mov         eax,ebx
 00457CD3    call        TCustomForm.SetWindowState
>00457CD8    jmp         00457CE1
 00457CDA    mov         eax,ebx
 00457CDC    call        TCustomForm.Release
 00457CE1    pop         edx
 00457CE2    pop         esi
 00457CE3    pop         ebx
 00457CE4    ret
*}
end;

//00457CE8
function TCustomForm.CloseQuery:Boolean;
begin
{*
 00457CE8    push        ebx
 00457CE9    push        esi
 00457CEA    push        edi
 00457CEB    push        ecx
 00457CEC    mov         ebx,eax
 00457CEE    cmp         byte ptr [ebx+22F],2
>00457CF5    jne         00457D25
 00457CF7    mov         byte ptr [esp],0
 00457CFB    mov         eax,ebx
 00457CFD    call        TCustomForm.GetMDIChildCount
 00457D02    mov         esi,eax
 00457D04    dec         esi
 00457D05    test        esi,esi
>00457D07    jl          00457D25
 00457D09    inc         esi
 00457D0A    xor         edi,edi
 00457D0C    mov         edx,edi
 00457D0E    mov         eax,ebx
 00457D10    call        TCustomForm.GetMDIChildren
 00457D15    mov         edx,dword ptr [eax]
 00457D17    call        dword ptr [edx+0E4]
 00457D1D    test        al,al
>00457D1F    je          00457D43
 00457D21    inc         edi
 00457D22    dec         esi
>00457D23    jne         00457D0C
 00457D25    mov         byte ptr [esp],1
 00457D29    cmp         word ptr [ebx+29A],0
>00457D31    je          00457D43
 00457D33    mov         ecx,esp
 00457D35    mov         edx,ebx
 00457D37    mov         eax,dword ptr [ebx+29C]
 00457D3D    call        dword ptr [ebx+298]
 00457D43    mov         al,byte ptr [esp]
 00457D46    pop         edx
 00457D47    pop         edi
 00457D48    pop         esi
 00457D49    pop         ebx
 00457D4A    ret
*}
end;

//00457D4C
procedure TCustomForm.CloseModal;
begin
{*
 00457D4C    push        ebp
 00457D4D    mov         ebp,esp
 00457D4F    add         esp,0FFFFFFF8
 00457D52    push        ebx
 00457D53    push        esi
 00457D54    push        edi
 00457D55    mov         dword ptr [ebp-4],eax
 00457D58    xor         eax,eax
 00457D5A    push        ebp
 00457D5B    push        457DB8
 00457D60    push        dword ptr fs:[eax]
 00457D63    mov         dword ptr fs:[eax],esp
 00457D66    mov         byte ptr [ebp-5],0
 00457D6A    mov         eax,dword ptr [ebp-4]
 00457D6D    mov         edx,dword ptr [eax]
 00457D6F    call        dword ptr [edx+0E4]
 00457D75    test        al,al
>00457D77    je          00457D8C
 00457D79    mov         byte ptr [ebp-5],1
 00457D7D    lea         edx,[ebp-5]
 00457D80    mov         eax,dword ptr [ebp-4]
 00457D83    mov         si,0FFB0
 00457D87    call        @CallDynaInst
 00457D8C    mov         al,byte ptr [ebp-5]
 00457D8F    sub         al,1
>00457D91    jb          00457D99
 00457D93    dec         al
>00457D95    je          00457DA6
>00457D97    jmp         00457DAE
 00457D99    mov         eax,dword ptr [ebp-4]
 00457D9C    xor         edx,edx
 00457D9E    mov         dword ptr [eax+24C],edx
>00457DA4    jmp         00457DAE
 00457DA6    mov         eax,dword ptr [ebp-4]
 00457DA9    call        TCustomForm.Release
 00457DAE    xor         eax,eax
 00457DB0    pop         edx
 00457DB1    pop         ecx
 00457DB2    pop         ecx
 00457DB3    mov         dword ptr fs:[eax],edx
>00457DB6    jmp         00457DDA
>00457DB8    jmp         @HandleAnyException
 00457DBD    mov         eax,dword ptr [ebp-4]
 00457DC0    xor         edx,edx
 00457DC2    mov         dword ptr [eax+24C],edx
 00457DC8    mov         edx,dword ptr [ebp-4]
 00457DCB    mov         eax,[005E0CAC];Application:TApplication
 00457DD0    call        TApplication.HandleException
 00457DD5    call        @DoneExcept
 00457DDA    pop         edi
 00457DDB    pop         esi
 00457DDC    pop         ebx
 00457DDD    pop         ecx
 00457DDE    pop         ecx
 00457DDF    pop         ebp
 00457DE0    ret
*}
end;

//00457DE4
procedure TCustomForm.Hide;
begin
{*
 00457DE4    xor         edx,edx
 00457DE6    call        TCustomForm.SetVisible
 00457DEB    ret
*}
end;

//00457DEC
procedure TCustomForm.Show;
begin
{*
 00457DEC    push        ebx
 00457DED    mov         ebx,eax
 00457DEF    mov         dl,1
 00457DF1    mov         eax,ebx
 00457DF3    call        TCustomForm.SetVisible
 00457DF8    mov         eax,ebx
 00457DFA    call        TControl.BringToFront
 00457DFF    pop         ebx
 00457E00    ret
*}
end;

//00457E04
procedure TCustomForm.SetFocus;
begin
{*
 00457E04    push        ebp
 00457E05    mov         ebp,esp
 00457E07    push        0
 00457E09    push        ebx
 00457E0A    mov         ebx,eax
 00457E0C    xor         eax,eax
 00457E0E    push        ebp
 00457E0F    push        457E72
 00457E14    push        dword ptr fs:[eax]
 00457E17    mov         dword ptr fs:[eax],esp
 00457E1A    cmp         byte ptr [ebx+22E],0;TCustomForm.FActive:Boolean
>00457E21    jne         00457E5C
 00457E23    cmp         byte ptr [ebx+57],0;TCustomForm.FVisible:Boolean
>00457E27    je          00457E34
 00457E29    mov         eax,ebx
 00457E2B    mov         edx,dword ptr [eax]
 00457E2D    call        dword ptr [edx+50];TImage.GetEnabled
 00457E30    test        al,al
>00457E32    jne         00457E55
 00457E34    lea         edx,[ebp-4]
 00457E37    mov         eax,[005AE6E4];^SCannotFocus:TResStringRec
 00457E3C    call        LoadStr
 00457E41    mov         ecx,dword ptr [ebp-4]
 00457E44    mov         dl,1
 00457E46    mov         eax,[00417C8C];EInvalidOperation
 00457E4B    call        Exception.Create;EInvalidOperation.Create
 00457E50    call        @RaiseExcept
 00457E55    mov         eax,ebx
 00457E57    call        TCustomForm.SetWindowFocus
 00457E5C    xor         eax,eax
 00457E5E    pop         edx
 00457E5F    pop         ecx
 00457E60    pop         ecx
 00457E61    mov         dword ptr fs:[eax],edx
 00457E64    push        457E79
 00457E69    lea         eax,[ebp-4]
 00457E6C    call        @LStrClr
 00457E71    ret
>00457E72    jmp         @HandleFinally
>00457E77    jmp         00457E69
 00457E79    pop         ebx
 00457E7A    pop         ecx
 00457E7B    pop         ebp
 00457E7C    ret
*}
end;

//00457E80
procedure TCustomForm.Release;
begin
{*
 00457E80    push        ebx
 00457E81    mov         ebx,eax
 00457E83    push        0
 00457E85    push        0
 00457E87    push        0B021
 00457E8C    mov         eax,ebx
 00457E8E    call        TWinControl.GetHandle
 00457E93    push        eax
 00457E94    call        user32.PostMessageA
 00457E99    pop         ebx
 00457E9A    ret
*}
end;

//00457E9C
{*function sub_00457E9C:?;
begin
 00457E9C    push        ebp
 00457E9D    mov         ebp,esp
 00457E9F    add         esp,0FFFFFFE0
 00457EA2    push        ebx
 00457EA3    push        esi
 00457EA4    xor         edx,edx
 00457EA6    mov         dword ptr [ebp-20],edx
 00457EA9    mov         dword ptr [ebp-4],eax
 00457EAC    xor         eax,eax
 00457EAE    push        ebp
 00457EAF    push        458164
 00457EB4    push        dword ptr fs:[eax]
 00457EB7    mov         dword ptr fs:[eax],esp
 00457EBA    call        CancelDrag
 00457EBF    mov         eax,dword ptr [ebp-4]
 00457EC2    cmp         byte ptr [eax+57],0;TCustomForm.FVisible:Boolean
>00457EC6    jne         00457EEC
 00457EC8    mov         eax,dword ptr [ebp-4]
 00457ECB    mov         edx,dword ptr [eax]
 00457ECD    call        dword ptr [edx+50];TImage.GetEnabled
 00457ED0    test        al,al
>00457ED2    je          00457EEC
 00457ED4    mov         eax,dword ptr [ebp-4]
 00457ED7    test        byte ptr [eax+2F4],8;TCustomForm.FFormState:TFormState
>00457EDE    jne         00457EEC
 00457EE0    mov         eax,dword ptr [ebp-4]
 00457EE3    cmp         byte ptr [eax+22F],1;TCustomForm.FFormStyle:TFormStyle
>00457EEA    jne         00457F0D
 00457EEC    lea         edx,[ebp-20]
 00457EEF    mov         eax,[005AE420];^SCannotShowModal:TResStringRec
 00457EF4    call        LoadStr
 00457EF9    mov         ecx,dword ptr [ebp-20]
 00457EFC    mov         dl,1
 00457EFE    mov         eax,[00417C8C];EInvalidOperation
 00457F03    call        Exception.Create;EInvalidOperation.Create
 00457F08    call        @RaiseExcept
 00457F0D    call        user32.GetCapture
 00457F12    test        eax,eax
>00457F14    je          00457F27
 00457F16    push        0
 00457F18    push        0
 00457F1A    push        1F
 00457F1C    call        user32.GetCapture
 00457F21    push        eax
 00457F22    call        user32.SendMessageA
 00457F27    call        user32.ReleaseCapture
 00457F2C    mov         eax,[005E0CAC];Application:TApplication
 00457F31    call        TApplication.ModalStarted
 00457F36    xor         edx,edx
 00457F38    push        ebp
 00457F39    push        458147
 00457F3E    push        dword ptr fs:[edx]
 00457F41    mov         dword ptr fs:[edx],esp
 00457F44    mov         eax,dword ptr [ebp-4]
 00457F47    or          byte ptr [eax+2F4],8;TCustomForm.FFormState:TFormState
 00457F4E    call        user32.GetActiveWindow
 00457F53    mov         dword ptr [ebp-1C],eax
 00457F56    mov         eax,[005ACDB8];0x0 gvar_005ACDB8
 00457F5B    mov         dword ptr [ebp-10],eax
 00457F5E    mov         eax,[005E0CB0];Screen:TScreen
 00457F63    mov         ecx,dword ptr [eax+78]
 00457F66    mov         eax,[005E0CB0];Screen:TScreen
 00457F6B    mov         eax,dword ptr [eax+7C]
 00457F6E    xor         edx,edx
 00457F70    call        TList.Insert
 00457F75    mov         eax,[005E0CB0];Screen:TScreen
 00457F7A    mov         edx,dword ptr [ebp-4]
 00457F7D    mov         dword ptr [eax+78],edx
 00457F80    mov         eax,[005E0CB0];Screen:TScreen
 00457F85    mov         ax,word ptr [eax+44]
 00457F89    mov         word ptr [ebp-12],ax
 00457F8D    xor         edx,edx
 00457F8F    mov         eax,[005E0CB0];Screen:TScreen
 00457F94    call        TScreen.SetCursor
 00457F99    mov         eax,[005E0CB0];Screen:TScreen
 00457F9E    mov         eax,dword ptr [eax+48]
 00457FA1    mov         dword ptr [ebp-18],eax
 00457FA4    xor         eax,eax
 00457FA6    call        DisableTaskWindows
 00457FAB    mov         dword ptr [ebp-0C],eax
 00457FAE    xor         edx,edx
 00457FB0    push        ebp
 00457FB1    push        458125
 00457FB6    push        dword ptr fs:[edx]
 00457FB9    mov         dword ptr fs:[edx],esp
 00457FBC    mov         eax,dword ptr [ebp-4]
 00457FBF    call        TCustomForm.Show
 00457FC4    xor         edx,edx
 00457FC6    push        ebp
 00457FC7    push        458084
 00457FCC    push        dword ptr fs:[edx]
 00457FCF    mov         dword ptr fs:[edx],esp
 00457FD2    push        0
 00457FD4    push        0
 00457FD6    push        0B000
 00457FDB    mov         eax,dword ptr [ebp-4]
 00457FDE    call        TWinControl.GetHandle
 00457FE3    push        eax
 00457FE4    call        user32.SendMessageA
 00457FE9    mov         eax,dword ptr [ebp-4]
 00457FEC    xor         edx,edx
 00457FEE    mov         dword ptr [eax+24C],edx;TCustomForm.FModalResult:TModalResult
 00457FF4    mov         eax,[005E0CAC];Application:TApplication
 00457FF9    call        TApplication.HandleMessage
 00457FFE    mov         eax,[005E0CAC];Application:TApplication
 00458003    cmp         byte ptr [eax+9C],0
>0045800A    je          0045801B
 0045800C    mov         eax,dword ptr [ebp-4]
 0045800F    mov         dword ptr [eax+24C],2;TCustomForm.FModalResult:TModalResult
>00458019    jmp         0045802F
 0045801B    mov         eax,dword ptr [ebp-4]
 0045801E    cmp         dword ptr [eax+24C],0;TCustomForm.FModalResult:TModalResult
>00458025    je          0045802F
 00458027    mov         eax,dword ptr [ebp-4]
 0045802A    call        TCustomForm.CloseModal
 0045802F    mov         eax,dword ptr [ebp-4]
 00458032    mov         eax,dword ptr [eax+24C];TCustomForm.FModalResult:TModalResult
 00458038    test        eax,eax
>0045803A    je          00457FF4
 0045803C    mov         dword ptr [ebp-8],eax
 0045803F    push        0
 00458041    push        0
 00458043    push        0B001
 00458048    mov         eax,dword ptr [ebp-4]
 0045804B    call        TWinControl.GetHandle
 00458050    push        eax
 00458051    call        user32.SendMessageA
 00458056    mov         eax,dword ptr [ebp-4]
 00458059    call        TWinControl.GetHandle
 0045805E    mov         ebx,eax
 00458060    call        user32.GetActiveWindow
 00458065    cmp         ebx,eax
>00458067    je          0045806E
 00458069    xor         eax,eax
 0045806B    mov         dword ptr [ebp-1C],eax
 0045806E    xor         eax,eax
 00458070    pop         edx
 00458071    pop         ecx
 00458072    pop         ecx
 00458073    mov         dword ptr fs:[eax],edx
 00458076    push        45808B
 0045807B    mov         eax,dword ptr [ebp-4]
 0045807E    call        TCustomForm.Hide
 00458083    ret
>00458084    jmp         @HandleFinally
>00458089    jmp         0045807B
 0045808B    xor         eax,eax
 0045808D    pop         edx
 0045808E    pop         ecx
 0045808F    pop         ecx
 00458090    mov         dword ptr fs:[eax],edx
 00458093    push        45812F
 00458098    mov         eax,[005E0CB0];Screen:TScreen
 0045809D    mov         eax,dword ptr [eax+48]
 004580A0    cmp         eax,dword ptr [ebp-18]
>004580A3    jne         004580B5
 004580A5    mov         dx,word ptr [ebp-12]
 004580A9    mov         eax,[005E0CB0];Screen:TScreen
 004580AE    call        TScreen.SetCursor
>004580B3    jmp         004580C1
 004580B5    xor         edx,edx
 004580B7    mov         eax,[005E0CB0];Screen:TScreen
 004580BC    call        TScreen.SetCursor
 004580C1    mov         eax,dword ptr [ebp-0C]
 004580C4    call        EnableTaskWindows
 004580C9    mov         eax,[005E0CB0];Screen:TScreen
 004580CE    mov         ebx,dword ptr [eax+7C]
 004580D1    cmp         dword ptr [ebx+8],0
>004580D5    jle         004580F9
 004580D7    mov         eax,ebx
 004580D9    call        TList.First
 004580DE    mov         esi,eax
 004580E0    mov         eax,[005E0CB0];Screen:TScreen
 004580E5    mov         dword ptr [eax+78],esi
 004580E8    mov         edx,esi
 004580EA    mov         eax,[005E0CB0];Screen:TScreen
 004580EF    mov         eax,dword ptr [eax+7C]
 004580F2    call        TList.Remove
>004580F7    jmp         00458103
 004580F9    mov         eax,[005E0CB0];Screen:TScreen
 004580FE    xor         edx,edx
 00458100    mov         dword ptr [eax+78],edx
 00458103    cmp         dword ptr [ebp-1C],0
>00458107    je          00458112
 00458109    mov         eax,dword ptr [ebp-1C]
 0045810C    push        eax
 0045810D    call        user32.SetActiveWindow
 00458112    mov         eax,dword ptr [ebp-10]
 00458115    mov         [005ACDB8],eax;gvar_005ACDB8
 0045811A    mov         eax,dword ptr [ebp-4]
 0045811D    and         byte ptr [eax+2F4],0F7;TCustomForm.FFormState:TFormState
 00458124    ret
>00458125    jmp         @HandleFinally
>0045812A    jmp         00458098
 0045812F    xor         eax,eax
 00458131    pop         edx
 00458132    pop         ecx
 00458133    pop         ecx
 00458134    mov         dword ptr fs:[eax],edx
 00458137    push        45814E
 0045813C    mov         eax,[005E0CAC];Application:TApplication
 00458141    call        TApplication.ModalFinished
 00458146    ret
>00458147    jmp         @HandleFinally
>0045814C    jmp         0045813C
 0045814E    xor         eax,eax
 00458150    pop         edx
 00458151    pop         ecx
 00458152    pop         ecx
 00458153    mov         dword ptr fs:[eax],edx
 00458156    push        45816B
 0045815B    lea         eax,[ebp-20]
 0045815E    call        @LStrClr
 00458163    ret
>00458164    jmp         @HandleFinally
>00458169    jmp         0045815B
 0045816B    mov         eax,dword ptr [ebp-8]
 0045816E    pop         esi
 0045816F    pop         ebx
 00458170    mov         esp,ebp
 00458172    pop         ebp
 00458173    ret
end;*}

//00458174
procedure TraverseClients(Container:TWinControl);
begin
{*
 00458174    push        ebp
 00458175    mov         ebp,esp
 00458177    push        ecx
 00458178    push        ebx
 00458179    push        esi
 0045817A    push        edi
 0045817B    mov         dword ptr [ebp-4],eax
 0045817E    mov         eax,dword ptr [ebp-4]
 00458181    cmp         byte ptr [eax+1A6],0
>00458188    je          004581DC
 0045818A    mov         eax,dword ptr [ebp-4]
 0045818D    call        TWinControl.GetControlCount
 00458192    mov         esi,eax
 00458194    dec         esi
 00458195    test        esi,esi
>00458197    jl          004581DC
 00458199    inc         esi
 0045819A    xor         edi,edi
 0045819C    mov         edx,edi
 0045819E    mov         eax,dword ptr [ebp-4]
 004581A1    call        TWinControl.GetControl
 004581A6    mov         ebx,eax
 004581A8    test        byte ptr [ebx+51],80
>004581AC    je          004581BB
 004581AE    cmp         byte ptr [ebx+57],0
>004581B2    je          004581BB
 004581B4    mov         eax,ebx
 004581B6    mov         edx,dword ptr [eax]
 004581B8    call        dword ptr [edx+78]
 004581BB    mov         eax,ebx
 004581BD    mov         edx,dword ptr ds:[4380F4];TWinControl
 004581C3    call        @IsClass
 004581C8    test        al,al
>004581CA    je          004581D8
 004581CC    mov         eax,dword ptr [ebp+8]
 004581CF    push        eax
 004581D0    mov         eax,ebx
 004581D2    call        TraverseClients
 004581D7    pop         ecx
 004581D8    inc         edi
 004581D9    dec         esi
>004581DA    jne         0045819C
 004581DC    pop         edi
 004581DD    pop         esi
 004581DE    pop         ebx
 004581DF    pop         ecx
 004581E0    pop         ebp
 004581E1    ret
*}
end;

//004581E4
procedure TCustomForm.UpdateActions;
begin
{*
 004581E4    push        ebp
 004581E5    mov         ebp,esp
 004581E7    push        ebx
 004581E8    push        esi
 004581E9    push        edi
 004581EA    mov         ebx,eax
 004581EC    test        byte ptr [ebx+1C],10
>004581F0    jne         00458246
 004581F2    cmp         byte ptr [ebx+1A6],0
>004581F9    je          00458246
 004581FB    mov         eax,ebx
 004581FD    mov         edx,dword ptr [eax]
 004581FF    call        dword ptr [edx+78]
 00458202    mov         esi,dword ptr [ebx+248]
 00458208    test        esi,esi
>0045820A    je          0045823D
 0045820C    mov         eax,dword ptr [esi+34]
 0045820F    call        TMenuItem.GetCount
 00458214    dec         eax
 00458215    test        eax,eax
>00458217    jl          0045823D
 00458219    inc         eax
 0045821A    mov         esi,eax
 0045821C    xor         edi,edi
 0045821E    mov         eax,dword ptr [ebx+248]
 00458224    mov         eax,dword ptr [eax+34]
 00458227    mov         edx,edi
 00458229    call        TMenuItem.GetItem
 0045822E    cmp         byte ptr [eax+3E],0
>00458232    je          00458239
 00458234    mov         edx,dword ptr [eax]
 00458236    call        dword ptr [edx+40]
 00458239    inc         edi
 0045823A    dec         esi
>0045823B    jne         0045821E
 0045823D    push        ebp
 0045823E    mov         eax,ebx
 00458240    call        TraverseClients
 00458245    pop         ecx
 00458246    pop         edi
 00458247    pop         esi
 00458248    pop         ebx
 00458249    pop         ebp
 0045824A    ret
*}
end;

//0045824C
procedure TCustomForm.RequestAlign;
begin
{*
 0045824C    cmp         dword ptr [eax+30],0
>00458250    jne         0045825F
 00458252    mov         edx,eax
 00458254    mov         eax,[005E0CB0];Screen:TScreen
 00458259    call        TScreen.AlignForm
 0045825E    ret
 0045825F    call        TControl.RequestAlign
 00458264    ret
*}
end;

//00458268
procedure TCustomForm.WMSettingChange(var Message:TMessage);
begin
{*
 00458268    push        ebx
 00458269    push        esi
 0045826A    mov         esi,edx
 0045826C    mov         ebx,eax
 0045826E    mov         edx,esi
 00458270    mov         eax,ebx
 00458272    call        TWinControl.WMWinIniChange
 00458277    cmp         dword ptr [esi+4],2F
>0045827B    jne         00458288
 0045827D    mov         eax,ebx
 0045827F    mov         si,0FFD0
 00458283    call        @CallDynaInst
 00458288    pop         esi
 00458289    pop         ebx
 0045828A    ret
*}
end;

//0045828C
function ProcessExecute(Control:TControl):Boolean;
begin
{*
 0045828C    push        ebp
 0045828D    mov         ebp,esp
 0045828F    push        ebx
 00458290    push        esi
 00458291    mov         ebx,eax
 00458293    test        ebx,ebx
>00458295    je          004582AF
 00458297    mov         eax,dword ptr [ebp+8]
 0045829A    mov         edx,dword ptr [eax-4]
 0045829D    mov         edx,dword ptr [edx+8]
 004582A0    mov         eax,ebx
 004582A2    mov         si,0FFF3
 004582A6    call        @CallDynaInst
 004582AB    test        al,al
>004582AD    jne         004582B3
 004582AF    xor         eax,eax
>004582B1    jmp         004582B5
 004582B3    mov         al,1
 004582B5    pop         esi
 004582B6    pop         ebx
 004582B7    pop         ebp
 004582B8    ret
*}
end;

//004582BC
function TraverseClients(Container:TWinControl):Boolean;
begin
{*
 004582BC    push        ebp
 004582BD    mov         ebp,esp
 004582BF    push        ecx
 004582C0    push        ebx
 004582C1    push        esi
 004582C2    push        edi
 004582C3    mov         dword ptr [ebp-4],eax
 004582C6    mov         eax,dword ptr [ebp-4]
 004582C9    cmp         byte ptr [eax+1A6],0
>004582D0    je          0045832F
 004582D2    mov         eax,dword ptr [ebp-4]
 004582D5    call        TWinControl.GetControlCount
 004582DA    mov         esi,eax
 004582DC    dec         esi
 004582DD    test        esi,esi
>004582DF    jl          0045832F
 004582E1    inc         esi
 004582E2    xor         edi,edi
 004582E4    mov         edx,edi
 004582E6    mov         eax,dword ptr [ebp-4]
 004582E9    call        TWinControl.GetControl
 004582EE    mov         ebx,eax
 004582F0    cmp         byte ptr [ebx+57],0
>004582F4    je          00458306
 004582F6    mov         eax,dword ptr [ebp+8]
 004582F9    push        eax
 004582FA    mov         eax,ebx
 004582FC    call        ProcessExecute
 00458301    pop         ecx
 00458302    test        al,al
>00458304    jne         00458327
 00458306    mov         eax,ebx
 00458308    mov         edx,dword ptr ds:[4380F4];TWinControl
 0045830E    call        @IsClass
 00458313    test        al,al
>00458315    je          0045832B
 00458317    mov         eax,dword ptr [ebp+8]
 0045831A    push        eax
 0045831B    mov         eax,ebx
 0045831D    call        TraverseClients
 00458322    pop         ecx
 00458323    test        al,al
>00458325    je          0045832B
 00458327    mov         al,1
>00458329    jmp         00458331
 0045832B    inc         edi
 0045832C    dec         esi
>0045832D    jne         004582E4
 0045832F    xor         eax,eax
 00458331    pop         edi
 00458332    pop         esi
 00458333    pop         ebx
 00458334    pop         ecx
 00458335    pop         ebp
 00458336    ret
*}
end;

//00458338
procedure TCustomForm.CMActionExecute(var Message:TMessage);
begin
{*
 00458338    push        ebp
 00458339    mov         ebp,esp
 0045833B    push        ecx
 0045833C    push        ebx
 0045833D    mov         dword ptr [ebp-4],edx
 00458340    mov         ebx,eax
 00458342    test        byte ptr [ebx+1C],10
>00458346    jne         00458386
 00458348    cmp         byte ptr [ebx+1A6],0
>0045834F    je          00458386
 00458351    push        ebp
 00458352    mov         eax,dword ptr [ebx+220]
 00458358    call        ProcessExecute
 0045835D    pop         ecx
 0045835E    test        al,al
>00458360    jne         0045837C
 00458362    push        ebp
 00458363    mov         eax,ebx
 00458365    call        ProcessExecute
 0045836A    pop         ecx
 0045836B    test        al,al
>0045836D    jne         0045837C
 0045836F    push        ebp
 00458370    mov         eax,ebx
 00458372    call        TraverseClients
 00458377    pop         ecx
 00458378    test        al,al
>0045837A    je          00458386
 0045837C    mov         eax,dword ptr [ebp-4]
 0045837F    mov         dword ptr [eax+0C],1
 00458386    pop         ebx
 00458387    pop         ecx
 00458388    pop         ebp
 00458389    ret
*}
end;

//0045838C
function ProcessUpdate(Control:TControl):Boolean;
begin
{*
 0045838C    push        ebp
 0045838D    mov         ebp,esp
 0045838F    push        ebx
 00458390    push        esi
 00458391    mov         ebx,eax
 00458393    test        ebx,ebx
>00458395    je          004583AF
 00458397    mov         eax,dword ptr [ebp+8]
 0045839A    mov         edx,dword ptr [eax-4]
 0045839D    mov         edx,dword ptr [edx+8]
 004583A0    mov         eax,ebx
 004583A2    mov         si,0FFF0
 004583A6    call        @CallDynaInst
 004583AB    test        al,al
>004583AD    jne         004583B3
 004583AF    xor         eax,eax
>004583B1    jmp         004583B5
 004583B3    mov         al,1
 004583B5    pop         esi
 004583B6    pop         ebx
 004583B7    pop         ebp
 004583B8    ret
*}
end;

//004583BC
function TraverseClients(Container:TWinControl):Boolean;
begin
{*
 004583BC    push        ebp
 004583BD    mov         ebp,esp
 004583BF    push        ecx
 004583C0    push        ebx
 004583C1    push        esi
 004583C2    push        edi
 004583C3    mov         dword ptr [ebp-4],eax
 004583C6    mov         eax,dword ptr [ebp-4]
 004583C9    cmp         byte ptr [eax+1A6],0
>004583D0    je          0045842F
 004583D2    mov         eax,dword ptr [ebp-4]
 004583D5    call        TWinControl.GetControlCount
 004583DA    mov         esi,eax
 004583DC    dec         esi
 004583DD    test        esi,esi
>004583DF    jl          0045842F
 004583E1    inc         esi
 004583E2    xor         edi,edi
 004583E4    mov         edx,edi
 004583E6    mov         eax,dword ptr [ebp-4]
 004583E9    call        TWinControl.GetControl
 004583EE    mov         ebx,eax
 004583F0    cmp         byte ptr [ebx+57],0
>004583F4    je          00458406
 004583F6    mov         eax,dword ptr [ebp+8]
 004583F9    push        eax
 004583FA    mov         eax,ebx
 004583FC    call        ProcessUpdate
 00458401    pop         ecx
 00458402    test        al,al
>00458404    jne         00458427
 00458406    mov         eax,ebx
 00458408    mov         edx,dword ptr ds:[4380F4];TWinControl
 0045840E    call        @IsClass
 00458413    test        al,al
>00458415    je          0045842B
 00458417    mov         eax,dword ptr [ebp+8]
 0045841A    push        eax
 0045841B    mov         eax,ebx
 0045841D    call        TraverseClients
 00458422    pop         ecx
 00458423    test        al,al
>00458425    je          0045842B
 00458427    mov         al,1
>00458429    jmp         00458431
 0045842B    inc         edi
 0045842C    dec         esi
>0045842D    jne         004583E4
 0045842F    xor         eax,eax
 00458431    pop         edi
 00458432    pop         esi
 00458433    pop         ebx
 00458434    pop         ecx
 00458435    pop         ebp
 00458436    ret
*}
end;

//00458438
procedure TCustomForm.CMActionUpdate(var Message:TMessage);
begin
{*
 00458438    push        ebp
 00458439    mov         ebp,esp
 0045843B    push        ecx
 0045843C    push        ebx
 0045843D    mov         dword ptr [ebp-4],edx
 00458440    mov         ebx,eax
 00458442    test        byte ptr [ebx+1C],10
>00458446    jne         00458486
 00458448    cmp         byte ptr [ebx+1A6],0
>0045844F    je          00458486
 00458451    push        ebp
 00458452    mov         eax,dword ptr [ebx+220]
 00458458    call        ProcessUpdate
 0045845D    pop         ecx
 0045845E    test        al,al
>00458460    jne         0045847C
 00458462    push        ebp
 00458463    mov         eax,ebx
 00458465    call        ProcessUpdate
 0045846A    pop         ecx
 0045846B    test        al,al
>0045846D    jne         0045847C
 0045846F    push        ebp
 00458470    mov         eax,ebx
 00458472    call        TraverseClients
 00458477    pop         ecx
 00458478    test        al,al
>0045847A    je          00458486
 0045847C    mov         eax,dword ptr [ebp-4]
 0045847F    mov         dword ptr [eax+0C],1
 00458486    pop         ebx
 00458487    pop         ecx
 00458488    pop         ebp
 00458489    ret
*}
end;

//0045848C
function DispatchShortCut:Boolean;
begin
{*
 0045848C    push        ebp
 0045848D    mov         ebp,esp
 0045848F    push        ebx
 00458490    push        esi
 00458491    mov         eax,dword ptr [ebp+8]
 00458494    mov         eax,dword ptr [eax-4]
 00458497    mov         eax,dword ptr [eax+2F0]
 0045849D    test        eax,eax
>0045849F    je          004584D9
 004584A1    mov         edx,dword ptr [ebp+8]
 004584A4    mov         ebx,dword ptr [eax+8]
 004584A7    dec         ebx
 004584A8    test        ebx,ebx
>004584AA    jl          004584D9
 004584AC    inc         ebx
 004584AD    xor         esi,esi
 004584AF    mov         eax,dword ptr [ebp+8]
 004584B2    mov         eax,dword ptr [eax-4]
 004584B5    mov         eax,dword ptr [eax+2F0]
 004584BB    mov         edx,esi
 004584BD    call        TList.Get
 004584C2    mov         edx,dword ptr [ebp+8]
 004584C5    mov         edx,dword ptr [edx-8]
 004584C8    call        TCustomActionList.IsShortCut
 004584CD    test        al,al
>004584CF    je          004584D5
 004584D1    mov         al,1
>004584D3    jmp         004584DB
 004584D5    inc         esi
 004584D6    dec         ebx
>004584D7    jne         004584AF
 004584D9    xor         eax,eax
 004584DB    pop         esi
 004584DC    pop         ebx
 004584DD    pop         ebp
 004584DE    ret
*}
end;

//004584E0
procedure TCustomForm.IsShortCut(var Message:TWMKey);
begin
{*
 004584E0    push        ebp
 004584E1    mov         ebp,esp
 004584E3    add         esp,0FFFFFFF4
 004584E6    push        ebx
 004584E7    push        esi
 004584E8    mov         dword ptr [ebp-8],edx
 004584EB    mov         dword ptr [ebp-4],eax
 004584EE    mov         byte ptr [ebp-9],0
 004584F2    mov         eax,dword ptr [ebp-4]
 004584F5    cmp         word ptr [eax+2C2],0
>004584FD    je          00458514
 004584FF    lea         ecx,[ebp-9]
 00458502    mov         edx,dword ptr [ebp-8]
 00458505    mov         ebx,dword ptr [ebp-4]
 00458508    mov         eax,dword ptr [ebx+2C4]
 0045850E    call        dword ptr [ebx+2C0]
 00458514    cmp         byte ptr [ebp-9],0
>00458518    jne         0045854E
 0045851A    mov         eax,dword ptr [ebp-4]
 0045851D    mov         ebx,dword ptr [eax+248]
 00458523    test        ebx,ebx
>00458525    je          0045853F
 00458527    cmp         dword ptr [ebx+38],0
>0045852B    je          0045853F
 0045852D    mov         edx,dword ptr [ebp-8]
 00458530    mov         eax,ebx
 00458532    mov         si,0FFEF
 00458536    call        @CallDynaInst
 0045853B    test        al,al
>0045853D    jne         0045854E
 0045853F    push        ebp
 00458540    call        DispatchShortCut
 00458545    pop         ecx
 00458546    test        al,al
>00458548    jne         0045854E
 0045854A    xor         eax,eax
>0045854C    jmp         00458550
 0045854E    mov         al,1
 00458550    mov         byte ptr [ebp-9],al
 00458553    mov         al,byte ptr [ebp-9]
 00458556    pop         esi
 00458557    pop         ebx
 00458558    mov         esp,ebp
 0045855A    pop         ebp
 0045855B    ret
*}
end;

//0045855C
function TCustomForm.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 0045855C    push        ebp
 0045855D    mov         ebp,esp
 0045855F    push        ebx
 00458560    push        esi
 00458561    push        edi
 00458562    mov         edi,dword ptr [ebp+10]
 00458565    mov         esi,dword ptr [ebp+0C]
 00458568    mov         ebx,dword ptr [ebp+8]
 0045856B    cmp         dword ptr [ebx+250],0
>00458572    je          00458585
 00458574    push        edi
 00458575    push        esi
 00458576    mov         eax,dword ptr [ebx+250]
 0045857C    push        eax
 0045857D    mov         eax,dword ptr [eax]
 0045857F    call        dword ptr [eax]
 00458581    test        eax,eax
>00458583    je          0045858F
 00458585    push        edi
 00458586    push        esi
 00458587    push        ebx
 00458588    call        TComponent.QueryInterface
>0045858D    jmp         00458591
 0045858F    xor         eax,eax
 00458591    pop         edi
 00458592    pop         esi
 00458593    pop         ebx
 00458594    pop         ebp
 00458595    ret         0C
*}
end;

//00458598
procedure TCustomForm.MouseWheelHandler(var Message:TMessage);
begin
{*
 00458598    push        ebx
 00458599    push        esi
 0045859A    push        edi
 0045859B    mov         esi,edx
 0045859D    mov         ebx,eax
 0045859F    mov         edi,dword ptr [ebx+224]
 004585A5    test        edi,edi
>004585A7    je          004585C1
 004585A9    mov         eax,dword ptr [esi+8]
 004585AC    push        eax
 004585AD    mov         ecx,dword ptr [esi+4]
 004585B0    mov         edx,0B043
 004585B5    mov         eax,edi
 004585B7    call        TControl.Perform
 004585BC    mov         dword ptr [esi+0C],eax
>004585BF    jmp         004585CA
 004585C1    mov         edx,esi
 004585C3    mov         eax,ebx
 004585C5    call        TControl.MouseWheelHandler
 004585CA    pop         edi
 004585CB    pop         esi
 004585CC    pop         ebx
 004585CD    ret
*}
end;

//004585D0
procedure TCustomForm.HandleCreateException;
begin
{*
 004585D0    mov         edx,eax
 004585D2    mov         eax,[005E0CAC];Application:TApplication
 004585D7    call        TApplication.HandleException
 004585DC    mov         al,1
 004585DE    ret
*}
end;

//004585E0
procedure TCustomForm.SetLayeredAttribs;
begin
{*
 004585E0    push        ebx
 004585E1    push        esi
 004585E2    mov         ebx,eax
 004585E4    test        byte ptr [ebx+1C],10
>004585E8    jne         004586B4
 004585EE    cmp         dword ptr ds:[5ACDB0],0
>004585F5    je          004586B4
 004585FB    mov         eax,ebx
 004585FD    call        TWinControl.HandleAllocated
 00458602    test        al,al
>00458604    je          004586B4
 0045860A    push        0EC
 0045860C    mov         eax,ebx
 0045860E    call        TWinControl.GetHandle
 00458613    push        eax
 00458614    call        user32.GetWindowLongA
 00458619    mov         esi,eax
 0045861B    cmp         byte ptr [ebx+2E0],0
>00458622    jne         0045862D
 00458624    cmp         byte ptr [ebx+2E8],0
>0045862B    je          00458688
 0045862D    test        esi,80000
>00458633    jne         0045864B
 00458635    or          esi,80000
 0045863B    push        esi
 0045863C    push        0EC
 0045863E    mov         eax,ebx
 00458640    call        TWinControl.GetHandle
 00458645    push        eax
 00458646    call        user32.SetWindowLongA
 0045864B    xor         eax,eax
 0045864D    mov         al,byte ptr [ebx+2E0]
 00458653    mov         eax,dword ptr [eax*4+5ACE34]
 0045865A    xor         edx,edx
 0045865C    mov         dl,byte ptr [ebx+2E8]
 00458662    or          eax,dword ptr [edx*4+5ACE3C]
 00458669    push        eax
 0045866A    mov         al,byte ptr [ebx+2E1]
 00458670    push        eax
 00458671    mov         eax,dword ptr [ebx+2EC]
 00458677    push        eax
 00458678    mov         eax,ebx
 0045867A    call        TWinControl.GetHandle
 0045867F    push        eax
 00458680    call        dword ptr ds:[5ACDB0]
>00458686    jmp         004586B4
 00458688    and         esi,0FFF7FFFF
 0045868E    push        esi
 0045868F    push        0EC
 00458691    mov         eax,ebx
 00458693    call        TWinControl.GetHandle
 00458698    push        eax
 00458699    call        user32.SetWindowLongA
 0045869E    push        485
 004586A3    push        0
 004586A5    push        0
 004586A7    mov         eax,ebx
 004586A9    call        TWinControl.GetHandle
 004586AE    push        eax
 004586AF    call        user32.RedrawWindow
 004586B4    pop         esi
 004586B5    pop         ebx
 004586B6    ret
*}
end;

//004586B8
procedure TCustomForm.SetAlphaBlend(const Value:Boolean);
begin
{*
 004586B8    cmp         dl,byte ptr [eax+2E0]
>004586BE    je          004586CB
 004586C0    mov         byte ptr [eax+2E0],dl
 004586C6    call        TCustomForm.SetLayeredAttribs
 004586CB    ret
*}
end;

//004586CC
procedure TCustomForm.SetAlphaBlendValue(const Value:Byte);
begin
{*
 004586CC    cmp         dl,byte ptr [eax+2E1]
>004586D2    je          004586DF
 004586D4    mov         byte ptr [eax+2E1],dl
 004586DA    call        TCustomForm.SetLayeredAttribs
 004586DF    ret
*}
end;

//004586E0
procedure TCustomForm.SetTransparentColorValue(const Value:TColor);
begin
{*
 004586E0    cmp         edx,dword ptr [eax+2EC]
>004586E6    je          004586F3
 004586E8    mov         dword ptr [eax+2EC],edx
 004586EE    call        TCustomForm.SetLayeredAttribs
 004586F3    ret
*}
end;

//004586F4
procedure TCustomForm.SetTransparentColor(const Value:Boolean);
begin
{*
 004586F4    cmp         dl,byte ptr [eax+2E8]
>004586FA    je          00458707
 004586FC    mov         byte ptr [eax+2E8],dl
 00458702    call        TCustomForm.SetLayeredAttribs
 00458707    ret
*}
end;

//00458708
procedure TCustomForm.InitAlphaBlending(var Params:TCreateParams);
begin
{*
 00458708    test        byte ptr [eax+1C],10
>0045870C    jne         00458730
 0045870E    cmp         dword ptr ds:[5ACDB0],0
>00458715    je          00458730
 00458717    cmp         byte ptr [eax+2E0],0
>0045871E    jne         00458729
 00458720    cmp         byte ptr [eax+2E8],0
>00458727    je          00458730
 00458729    or          dword ptr [edx+8],80000
 00458730    ret
*}
end;

//00458734
constructor TCustomDockForm.Create(AOwner:TComponent);
begin
{*
 00458734    push        ebp
 00458735    mov         ebp,esp
 00458737    push        ecx
 00458738    push        ebx
 00458739    push        esi
 0045873A    test        dl,dl
>0045873C    je          00458746
 0045873E    add         esp,0FFFFFFF0
 00458741    call        @ClassCreate
 00458746    mov         byte ptr [ebp-1],dl
 00458749    mov         ebx,eax
 0045874B    push        0
 0045874D    xor         edx,edx
 0045874F    mov         eax,ebx
 00458751    mov         esi,dword ptr [eax]
 00458753    call        dword ptr [esi+0E0]
 00458759    xor         edx,edx
 0045875B    mov         eax,ebx
 0045875D    call        TScrollingWinControl.SetAutoScroll
 00458762    mov         dl,5
 00458764    mov         eax,ebx
 00458766    call        TCustomForm.SetBorderStyle
 0045876B    mov         dl,1
 0045876D    mov         eax,ebx
 0045876F    call        TWinControl.SetDockSite
 00458774    mov         dl,3
 00458776    mov         eax,ebx
 00458778    call        TCustomForm.SetFormStyle
 0045877D    mov         eax,ebx
 0045877F    cmp         byte ptr [ebp-1],0
>00458783    je          00458794
 00458785    call        @AfterConstruction
 0045878A    pop         dword ptr fs:[0]
 00458791    add         esp,0C
 00458794    mov         eax,ebx
 00458796    pop         esi
 00458797    pop         ebx
 00458798    pop         ecx
 00458799    pop         ebp
 0045879A    ret
*}
end;

//0045879C
procedure TCustomDockForm.DoAddDockClient(Client:TControl; const ARect:TRect);
begin
{*
 0045879C    push        ebp
 0045879D    mov         ebp,esp
 0045879F    add         esp,0FFFFFFF4
 004587A2    push        ebx
 004587A3    push        esi
 004587A4    xor         ebx,ebx
 004587A6    mov         dword ptr [ebp-0C],ebx
 004587A9    mov         dword ptr [ebp-8],ecx
 004587AC    mov         dword ptr [ebp-4],edx
 004587AF    mov         esi,eax
 004587B1    xor         eax,eax
 004587B3    push        ebp
 004587B4    push        458873
 004587B9    push        dword ptr fs:[eax]
 004587BC    mov         dword ptr fs:[eax],esp
 004587BF    mov         eax,esi
 004587C1    call        TWinControl.GetDockClientCount
 004587C6    dec         eax
>004587C7    jne         00458837
 004587C9    mov         eax,dword ptr [ebp-4]
 004587CC    call        TControl.GetTextLen
 004587D1    mov         ecx,eax
 004587D3    inc         ecx
 004587D4    lea         eax,[ebp-0C]
 004587D7    xor         edx,edx
 004587D9    call        @LStrFromPCharLen
 004587DE    mov         eax,dword ptr [ebp-0C]
 004587E1    call        @LStrLen
 004587E6    push        eax
 004587E7    mov         eax,dword ptr [ebp-0C]
 004587EA    call        @LStrToPChar
 004587EF    mov         edx,eax
 004587F1    mov         eax,dword ptr [ebp-4]
 004587F4    pop         ecx
 004587F5    call        TControl.GetTextBuf
 004587FA    mov         eax,dword ptr [ebp-0C]
 004587FD    call        @LStrLen
 00458802    test        eax,eax
>00458804    jle         0045882D
 00458806    mov         ebx,1
 0045880B    mov         edx,dword ptr [ebp-0C]
 0045880E    mov         dl,byte ptr [edx+ebx-1]
 00458812    sub         dl,0A
>00458815    je          0045881C
 00458817    sub         dl,3
>0045881A    jne         00458829
 0045881C    mov         edx,ebx
 0045881E    dec         edx
 0045881F    lea         eax,[ebp-0C]
 00458822    call        @LStrSetLength
>00458827    jmp         0045882D
 00458829    inc         ebx
 0045882A    dec         eax
>0045882B    jne         0045880B
 0045882D    mov         edx,dword ptr [ebp-0C]
 00458830    mov         eax,esi
 00458832    call        TControl.SetText
 00458837    mov         ecx,dword ptr [ebp-8]
 0045883A    mov         edx,dword ptr [ebp-4]
 0045883D    mov         eax,esi
 0045883F    call        TWinControl.DoAddDockClient
 00458844    mov         dl,5
 00458846    mov         eax,dword ptr [ebp-4]
 00458849    call        TControl.SetAlign
 0045884E    test        byte ptr [esi+1C],1
>00458852    jne         0045885D
 00458854    mov         dl,1
 00458856    mov         eax,esi
 00458858    call        TCustomForm.SetVisible
 0045885D    xor         eax,eax
 0045885F    pop         edx
 00458860    pop         ecx
 00458861    pop         ecx
 00458862    mov         dword ptr fs:[eax],edx
 00458865    push        45887A
 0045886A    lea         eax,[ebp-0C]
 0045886D    call        @LStrClr
 00458872    ret
>00458873    jmp         @HandleFinally
>00458878    jmp         0045886A
 0045887A    pop         esi
 0045887B    pop         ebx
 0045887C    mov         esp,ebp
 0045887E    pop         ebp
 0045887F    ret
*}
end;

//00458880
procedure TCustomDockForm.DoRemoveDockClient(Client:TControl);
begin
{*
 00458880    push        ebx
 00458881    mov         ebx,eax
 00458883    mov         eax,ebx
 00458885    call        TWinControl.DoRemoveDockClient
 0045888A    mov         eax,ebx
 0045888C    call        TWinControl.GetDockClientCount
 00458891    test        eax,eax
>00458893    jne         0045889C
 00458895    mov         eax,ebx
 00458897    call        TCustomForm.Release
 0045889C    pop         ebx
 0045889D    ret
*}
end;

//004588A0
procedure TCustomDockForm.Loaded;
begin
{*
 004588A0    push        ebx
 004588A1    push        esi
 004588A2    push        edi
 004588A3    push        ebp
 004588A4    add         esp,0FFFFFFF0
 004588A7    mov         ebx,eax
 004588A9    mov         eax,ebx
 004588AB    call        TWinControl.GetControlCount
 004588B0    mov         edi,eax
 004588B2    dec         edi
 004588B3    test        edi,edi
>004588B5    jl          004588DD
 004588B7    inc         edi
 004588B8    xor         ebp,ebp
 004588BA    mov         edx,esp
 004588BC    mov         eax,ebx
 004588BE    mov         ecx,dword ptr [eax]
 004588C0    call        dword ptr [ecx+44]
 004588C3    push        esp
 004588C4    mov         edx,ebp
 004588C6    mov         eax,ebx
 004588C8    call        TWinControl.GetControl
 004588CD    mov         edx,ebx
 004588CF    pop         ecx
 004588D0    mov         si,0FFCC
 004588D4    call        @CallDynaInst
 004588D9    inc         ebp
 004588DA    dec         edi
>004588DB    jne         004588BA
 004588DD    mov         eax,ebx
 004588DF    call        TCustomForm.Loaded
 004588E4    add         esp,10
 004588E7    pop         ebp
 004588E8    pop         edi
 004588E9    pop         esi
 004588EA    pop         ebx
 004588EB    ret
*}
end;

//004588EC
procedure TCustomDockForm.GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);
begin
{*
 004588EC    push        ebp
 004588ED    mov         ebp,esp
 004588EF    add         esp,0FFFFFFF8
 004588F2    push        ebx
 004588F3    push        esi
 004588F4    push        edi
 004588F5    mov         esi,dword ptr [ebp+0C]
 004588F8    lea         edi,[ebp-8]
 004588FB    movs        dword ptr [edi],dword ptr [esi]
 004588FC    movs        dword ptr [edi],dword ptr [esi]
 004588FD    mov         ebx,eax
 004588FF    mov         eax,ebx
 00458901    call        TWinControl.GetDockClientCount
 00458906    test        eax,eax
 00458908    mov         eax,dword ptr [ebp+8]
 0045890B    sete        byte ptr [eax]
 0045890E    pop         edi
 0045890F    pop         esi
 00458910    pop         ebx
 00458911    pop         ecx
 00458912    pop         ecx
 00458913    pop         ebp
 00458914    ret         8
*}
end;

//00458918
procedure TCustomDockForm.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 00458918    push        ebx
 00458919    push        esi
 0045891A    mov         esi,edx
 0045891C    mov         ebx,eax
 0045891E    mov         edx,esi
 00458920    mov         eax,ebx
 00458922    call        TWinControl.WMNCHitTest
 00458927    test        byte ptr [ebx+1C],10
>0045892B    jne         0045893A
 0045892D    cmp         dword ptr [esi+0C],1
>00458931    jne         0045893A
 00458933    mov         dword ptr [esi+0C],2
 0045893A    pop         esi
 0045893B    pop         ebx
 0045893C    ret
*}
end;

//00458940
procedure TCustomDockForm.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 00458940    push        ebx
 00458941    push        esi
 00458942    mov         esi,edx
 00458944    mov         ebx,eax
 00458946    cmp         dword ptr [esi+4],2
>0045894A    jne         004589C9
 0045894C    cmp         byte ptr [ebx+9B],1
>00458953    je          004589C9
 00458955    test        byte ptr [ebx+1C],10
>00458959    jne         004589C9
 0045895B    mov         eax,ebx
 0045895D    call        TWinControl.GetHandle
 00458962    push        eax
 00458963    call        user32.IsIconic
 00458968    test        eax,eax
>0045896A    jne         004589C9
 0045896C    mov         eax,ebx
 0045896E    call        TWinControl.GetDockClientCount
 00458973    test        eax,eax
>00458975    jle         004589C9
 00458977    push        7
 00458979    push        0
 0045897B    push        0
 0045897D    push        0
 0045897F    push        0
 00458981    push        0
 00458983    mov         eax,ebx
 00458985    call        TWinControl.GetHandle
 0045898A    push        eax
 0045898B    call        user32.SetWindowPos
 00458990    mov         eax,dword ptr [esi+8]
 00458993    push        eax
 00458994    mov         eax,dword ptr [esi+4]
 00458997    push        eax
 00458998    push        0A2
 0045899D    mov         eax,ebx
 0045899F    call        TWinControl.GetHandle
 004589A4    push        eax
 004589A5    call        user32.PostMessageA
 004589AA    cmp         byte ptr [ebx+22E],0
>004589B1    je          004589D2
 004589B3    xor         edx,edx
 004589B5    mov         eax,ebx
 004589B7    call        TWinControl.GetDockClients
 004589BC    or          ecx,0FFFFFFFF
 004589BF    mov         dl,1
 004589C1    call        TControl.BeginDrag
 004589C6    pop         esi
 004589C7    pop         ebx
 004589C8    ret
 004589C9    mov         edx,esi
 004589CB    mov         eax,ebx
 004589CD    call        TCustomForm.WMNCLButtonDown
 004589D2    pop         esi
 004589D3    pop         ebx
 004589D4    ret
*}
end;

//004589D8
procedure TCustomDockForm.CMControlListChange(var Message:TMessage);
begin
{*
 004589D8    push        ebx
 004589D9    push        esi
 004589DA    push        edi
 004589DB    add         esp,0FFFFFFF0
 004589DE    mov         ebx,edx
 004589E0    mov         esi,eax
 004589E2    mov         edx,ebx
 004589E4    mov         eax,esi
 004589E6    call        TWinControl.CMControlListChange
 004589EB    cmp         dword ptr [ebx+8],0
>004589EF    jne         00458A27
 004589F1    mov         eax,dword ptr [ebx+4]
 004589F4    push        eax
 004589F5    xor         ecx,ecx
 004589F7    mov         edx,0B039
 004589FC    mov         eax,esi
 004589FE    call        TControl.Perform
 00458A03    mov         edi,dword ptr [ebx+4]
 00458A06    cmp         esi,dword ptr [edi+0A0]
>00458A0C    jne         00458A27
 00458A0E    mov         edx,esp
 00458A10    mov         eax,edi
 00458A12    call        TControl.GetBoundsRect
 00458A17    mov         ecx,esp
 00458A19    mov         eax,edi
 00458A1B    or          edx,0FFFFFFFF
 00458A1E    mov         si,0FFCC
 00458A22    call        @CallDynaInst
 00458A27    add         esp,10
 00458A2A    pop         edi
 00458A2B    pop         esi
 00458A2C    pop         ebx
 00458A2D    ret
*}
end;

//00458A30
procedure TCustomDockForm.CMDockNotification(var Message:TCMDockNotification);
begin
{*
 00458A30    push        ebp
 00458A31    mov         ebp,esp
 00458A33    push        0
 00458A35    push        ebx
 00458A36    push        esi
 00458A37    mov         ebx,edx
 00458A39    mov         esi,eax
 00458A3B    xor         eax,eax
 00458A3D    push        ebp
 00458A3E    push        458AF6
 00458A43    push        dword ptr fs:[eax]
 00458A46    mov         dword ptr fs:[eax],esp
 00458A49    mov         edx,ebx
 00458A4B    mov         eax,esi
 00458A4D    mov         ecx,dword ptr [eax]
 00458A4F    call        dword ptr [ecx-10]
 00458A52    mov         eax,dword ptr [ebx+8]
 00458A55    mov         eax,dword ptr [eax]
 00458A57    sub         eax,0C
>00458A5A    je          00458A72
 00458A5C    sub         eax,0AFFF
>00458A61    jne         00458AE0
 00458A63    mov         eax,dword ptr [ebx+4]
 00458A66    mov         dl,byte ptr [eax+57]
 00458A69    mov         eax,esi
 00458A6B    call        TCustomForm.SetVisible
>00458A70    jmp         00458AE0
 00458A72    mov         eax,dword ptr [ebx+4]
 00458A75    call        TControl.GetTextLen
 00458A7A    mov         ecx,eax
 00458A7C    inc         ecx
 00458A7D    lea         eax,[ebp-4]
 00458A80    xor         edx,edx
 00458A82    call        @LStrFromPCharLen
 00458A87    mov         eax,dword ptr [ebp-4]
 00458A8A    call        @LStrLen
 00458A8F    push        eax
 00458A90    mov         eax,dword ptr [ebp-4]
 00458A93    call        @LStrToPChar
 00458A98    mov         edx,eax
 00458A9A    mov         eax,dword ptr [ebx+4]
 00458A9D    pop         ecx
 00458A9E    call        TControl.GetTextBuf
 00458AA3    mov         eax,dword ptr [ebp-4]
 00458AA6    call        @LStrLen
 00458AAB    test        eax,eax
>00458AAD    jle         00458AD6
 00458AAF    mov         ebx,1
 00458AB4    mov         edx,dword ptr [ebp-4]
 00458AB7    mov         dl,byte ptr [edx+ebx-1]
 00458ABB    sub         dl,0A
>00458ABE    je          00458AC5
 00458AC0    sub         dl,3
>00458AC3    jne         00458AD2
 00458AC5    mov         edx,ebx
 00458AC7    dec         edx
 00458AC8    lea         eax,[ebp-4]
 00458ACB    call        @LStrSetLength
>00458AD0    jmp         00458AD6
 00458AD2    inc         ebx
 00458AD3    dec         eax
>00458AD4    jne         00458AB4
 00458AD6    mov         edx,dword ptr [ebp-4]
 00458AD9    mov         eax,esi
 00458ADB    call        TControl.SetText
 00458AE0    xor         eax,eax
 00458AE2    pop         edx
 00458AE3    pop         ecx
 00458AE4    pop         ecx
 00458AE5    mov         dword ptr fs:[eax],edx
 00458AE8    push        458AFD
 00458AED    lea         eax,[ebp-4]
 00458AF0    call        @LStrClr
 00458AF5    ret
>00458AF6    jmp         @HandleFinally
>00458AFB    jmp         00458AED
 00458AFD    pop         esi
 00458AFE    pop         ebx
 00458AFF    pop         ecx
 00458B00    pop         ebp
 00458B01    ret
*}
end;

//00458B04
procedure TCustomDockForm.CMUnDockClient(var Message:TCMUnDockClient);
begin
{*
 00458B04    push        ebx
 00458B05    mov         ebx,edx
 00458B07    mov         edx,ebx
 00458B09    call        TWinControl.CMUnDockClient
 00458B0E    mov         eax,dword ptr [ebx+8]
 00458B11    xor         edx,edx
 00458B13    call        TControl.SetAlign
 00458B18    pop         ebx
 00458B19    ret
*}
end;

//00458B1C
procedure TCustomDockForm.CMVisibleChanged(var Message:TMessage);
begin
{*
 00458B1C    push        ebx
 00458B1D    push        esi
 00458B1E    push        edi
 00458B1F    mov         ebx,eax
 00458B21    mov         eax,ebx
 00458B23    call        TWinControl.CMVisibleChanged
 00458B28    test        byte ptr [ebx+1C],8
>00458B2C    jne         00458B54
 00458B2E    mov         eax,ebx
 00458B30    call        TWinControl.GetDockClientCount
 00458B35    mov         esi,eax
 00458B37    dec         esi
 00458B38    test        esi,esi
>00458B3A    jl          00458B54
 00458B3C    inc         esi
 00458B3D    xor         edi,edi
 00458B3F    mov         edx,edi
 00458B41    mov         eax,ebx
 00458B43    call        TWinControl.GetDockClients
 00458B48    mov         dl,byte ptr [ebx+57]
 00458B4B    call        TControl.SetVisible
 00458B50    inc         edi
 00458B51    dec         esi
>00458B52    jne         00458B3F
 00458B54    pop         edi
 00458B55    pop         esi
 00458B56    pop         ebx
 00458B57    ret
*}
end;

//00458B58
function TMonitor.GetLeft:Integer;
begin
{*
 00458B58    push        ebx
 00458B59    add         esp,0FFFFFFF0
 00458B5C    mov         ebx,eax
 00458B5E    mov         edx,esp
 00458B60    mov         eax,ebx
 00458B62    call        TMonitor.GetBoundsRect
 00458B67    mov         eax,dword ptr [esp]
 00458B6A    add         esp,10
 00458B6D    pop         ebx
 00458B6E    ret
*}
end;

//00458B70
function TMonitor.GetHeight:Integer;
begin
{*
 00458B70    push        ebx
 00458B71    add         esp,0FFFFFFF0
 00458B74    mov         ebx,eax
 00458B76    mov         edx,esp
 00458B78    mov         eax,ebx
 00458B7A    call        TMonitor.GetBoundsRect
 00458B7F    mov         eax,dword ptr [esp+0C]
 00458B83    sub         eax,dword ptr [esp+4]
 00458B87    add         esp,10
 00458B8A    pop         ebx
 00458B8B    ret
*}
end;

//00458B8C
function TMonitor.GetTop:Integer;
begin
{*
 00458B8C    push        ebx
 00458B8D    add         esp,0FFFFFFF0
 00458B90    mov         ebx,eax
 00458B92    mov         edx,esp
 00458B94    mov         eax,ebx
 00458B96    call        TMonitor.GetBoundsRect
 00458B9B    mov         eax,dword ptr [esp+4]
 00458B9F    add         esp,10
 00458BA2    pop         ebx
 00458BA3    ret
*}
end;

//00458BA4
function TMonitor.GetWidth:Integer;
begin
{*
 00458BA4    push        ebx
 00458BA5    add         esp,0FFFFFFF0
 00458BA8    mov         ebx,eax
 00458BAA    mov         edx,esp
 00458BAC    mov         eax,ebx
 00458BAE    call        TMonitor.GetBoundsRect
 00458BB3    mov         eax,dword ptr [esp+8]
 00458BB7    sub         eax,dword ptr [esp]
 00458BBA    add         esp,10
 00458BBD    pop         ebx
 00458BBE    ret
*}
end;

//00458BC0
function TMonitor.GetBoundsRect:TRect;
begin
{*
 00458BC0    push        ebx
 00458BC1    push        esi
 00458BC2    push        edi
 00458BC3    add         esp,0FFFFFFD8
 00458BC6    mov         ebx,edx
 00458BC8    mov         dword ptr [esp],28
 00458BCF    push        esp
 00458BD0    mov         eax,dword ptr [eax+4]
 00458BD3    push        eax
 00458BD4    mov         eax,[005AE300];^GetMonitorInfo:TGetMonitorInfoA
 00458BD9    mov         eax,dword ptr [eax]
 00458BDB    call        eax
 00458BDD    mov         edi,ebx
 00458BDF    lea         esi,[esp+4]
 00458BE3    movs        dword ptr [edi],dword ptr [esi]
 00458BE4    movs        dword ptr [edi],dword ptr [esi]
 00458BE5    movs        dword ptr [edi],dword ptr [esi]
 00458BE6    movs        dword ptr [edi],dword ptr [esi]
 00458BE7    add         esp,28
 00458BEA    pop         edi
 00458BEB    pop         esi
 00458BEC    pop         ebx
 00458BED    ret
*}
end;

//00458BF0
function TMonitor.GetWorkareaRect:TRect;
begin
{*
 00458BF0    push        ebx
 00458BF1    push        esi
 00458BF2    push        edi
 00458BF3    add         esp,0FFFFFFD8
 00458BF6    mov         ebx,edx
 00458BF8    mov         dword ptr [esp],28
 00458BFF    push        esp
 00458C00    mov         eax,dword ptr [eax+4]
 00458C03    push        eax
 00458C04    mov         eax,[005AE300];^GetMonitorInfo:TGetMonitorInfoA
 00458C09    mov         eax,dword ptr [eax]
 00458C0B    call        eax
 00458C0D    mov         edi,ebx
 00458C0F    lea         esi,[esp+14]
 00458C13    movs        dword ptr [edi],dword ptr [esi]
 00458C14    movs        dword ptr [edi],dword ptr [esi]
 00458C15    movs        dword ptr [edi],dword ptr [esi]
 00458C16    movs        dword ptr [edi],dword ptr [esi]
 00458C17    add         esp,28
 00458C1A    pop         edi
 00458C1B    pop         esi
 00458C1C    pop         ebx
 00458C1D    ret
*}
end;

//00458C20
constructor TScreen.Create(AOwner:TComponent);
begin
{*
 00458C20    push        ebp
 00458C21    mov         ebp,esp
 00458C23    push        ecx
 00458C24    push        ebx
 00458C25    push        esi
 00458C26    test        dl,dl
>00458C28    je          00458C32
 00458C2A    add         esp,0FFFFFFF0
 00458C2D    call        @ClassCreate
 00458C32    mov         byte ptr [ebp-1],dl
 00458C35    mov         ebx,eax
 00458C37    xor         edx,edx
 00458C39    mov         eax,ebx
 00458C3B    call        TComponent.Create
 00458C40    mov         eax,[005AE280]
 00458C45    mov         dword ptr [eax+4],ebx
 00458C48    mov         dword ptr [eax],458FC4;TScreen.AddDataModule
 00458C4E    mov         eax,[005AE290]
 00458C53    mov         dword ptr [eax+4],ebx
 00458C56    mov         dword ptr [eax],458FD0;TScreen.RemoveDataModule
 00458C5C    mov         eax,ebx
 00458C5E    call        TScreen.CreateCursors
 00458C63    push        0
 00458C65    call        user32.GetKeyboardLayout
 00458C6A    mov         dword ptr [ebx+3C],eax
 00458C6D    mov         dl,1
 00458C6F    mov         eax,[00417CEC];TList
 00458C74    call        TObject.Create
 00458C79    mov         dword ptr [ebx+4C],eax
 00458C7C    mov         dl,1
 00458C7E    mov         eax,[00417CEC];TList
 00458C83    call        TObject.Create
 00458C88    mov         dword ptr [ebx+50],eax
 00458C8B    mov         dl,1
 00458C8D    mov         eax,[00417CEC];TList
 00458C92    call        TObject.Create
 00458C97    mov         dword ptr [ebx+54],eax
 00458C9A    mov         dl,1
 00458C9C    mov         eax,[00417CEC];TList
 00458CA1    call        TObject.Create
 00458CA6    mov         dword ptr [ebx+58],eax
 00458CA9    mov         dl,1
 00458CAB    mov         eax,[00417CEC];TList
 00458CB0    call        TObject.Create
 00458CB5    mov         dword ptr [ebx+7C],eax
 00458CB8    push        0
 00458CBA    call        user32.GetDC
 00458CBF    mov         esi,eax
 00458CC1    push        5A
 00458CC3    push        esi
 00458CC4    call        gdi32.GetDeviceCaps
 00458CC9    mov         dword ptr [ebx+40],eax
 00458CCC    push        esi
 00458CCD    push        0
 00458CCF    call        user32.ReleaseDC
 00458CD4    mov         eax,dword ptr [ebx+58]
 00458CD7    push        eax
 00458CD8    mov         eax,4553F8;EnumMonitorsProc:Boolean
 00458CDD    push        eax
 00458CDE    push        0
 00458CE0    push        0
 00458CE2    mov         eax,[005AE4A0];^EnumDisplayMonitors:TEnumDisplayMonitors
 00458CE7    mov         eax,dword ptr [eax]
 00458CE9    call        eax
 00458CEB    mov         dl,1
 00458CED    mov         eax,[0042451C];TFont
 00458CF2    call        TFont.Create
 00458CF7    mov         dword ptr [ebx+84],eax
 00458CFD    mov         dl,1
 00458CFF    mov         eax,[0042451C];TFont
 00458D04    call        TFont.Create
 00458D09    mov         dword ptr [ebx+88],eax
 00458D0F    mov         dl,1
 00458D11    mov         eax,[0042451C];TFont
 00458D16    call        TFont.Create
 00458D1B    mov         dword ptr [ebx+80],eax
 00458D21    mov         eax,ebx
 00458D23    call        TScreen.GetMetricSettings
 00458D28    mov         eax,dword ptr [ebx+84]
 00458D2E    mov         dword ptr [eax+0C],ebx
 00458D31    mov         dword ptr [eax+8],4592D8;TScreen.IconFontChanged
 00458D38    mov         eax,dword ptr [ebx+88]
 00458D3E    mov         dword ptr [eax+0C],ebx
 00458D41    mov         dword ptr [eax+8],4592D8;TScreen.IconFontChanged
 00458D48    mov         eax,dword ptr [ebx+80]
 00458D4E    mov         dword ptr [eax+0C],ebx
 00458D51    mov         dword ptr [eax+8],4592D8;TScreen.IconFontChanged
 00458D58    mov         eax,ebx
 00458D5A    cmp         byte ptr [ebp-1],0
>00458D5E    je          00458D6F
 00458D60    call        @AfterConstruction
 00458D65    pop         dword ptr fs:[0]
 00458D6C    add         esp,0C
 00458D6F    mov         eax,ebx
 00458D71    pop         esi
 00458D72    pop         ebx
 00458D73    pop         ecx
 00458D74    pop         ebp
 00458D75    ret
*}
end;

//00458D78
destructor TScreen.Destroy;
begin
{*
 00458D78    push        ebx
 00458D79    push        esi
 00458D7A    push        edi
 00458D7B    push        ebp
 00458D7C    call        @BeforeDestruction
 00458D81    mov         ebx,edx
 00458D83    mov         ebp,eax
 00458D85    mov         eax,dword ptr [ebp+80]
 00458D8B    call        TObject.Free
 00458D90    mov         eax,dword ptr [ebp+88]
 00458D96    call        TObject.Free
 00458D9B    mov         eax,dword ptr [ebp+84]
 00458DA1    call        TObject.Free
 00458DA6    mov         eax,dword ptr [ebp+54]
 00458DA9    call        TObject.Free
 00458DAE    mov         eax,dword ptr [ebp+50]
 00458DB1    call        TObject.Free
 00458DB6    mov         eax,dword ptr [ebp+4C]
 00458DB9    call        TObject.Free
 00458DBE    mov         eax,dword ptr [ebp+30]
 00458DC1    call        TObject.Free
 00458DC6    mov         eax,dword ptr [ebp+34]
 00458DC9    call        TObject.Free
 00458DCE    mov         eax,dword ptr [ebp+7C]
 00458DD1    call        TObject.Free
 00458DD6    mov         eax,dword ptr [ebp+58]
 00458DD9    test        eax,eax
>00458DDB    je          00458DFB
 00458DDD    mov         esi,dword ptr [eax+8]
 00458DE0    dec         esi
 00458DE1    test        esi,esi
>00458DE3    jl          00458DFB
 00458DE5    inc         esi
 00458DE6    xor         edi,edi
 00458DE8    mov         eax,dword ptr [ebp+58]
 00458DEB    mov         edx,edi
 00458DED    call        TList.Get
 00458DF2    call        TObject.Free
 00458DF7    inc         edi
 00458DF8    dec         esi
>00458DF9    jne         00458DE8
 00458DFB    mov         eax,dword ptr [ebp+58]
 00458DFE    call        TObject.Free
 00458E03    mov         eax,ebp
 00458E05    call        TScreen.DestroyCursors
 00458E0A    mov         eax,[005AE280]
 00458E0F    xor         edx,edx
 00458E11    mov         dword ptr [eax],edx
 00458E13    mov         dword ptr [eax+4],edx
 00458E16    mov         eax,[005AE290]
 00458E1B    xor         edx,edx
 00458E1D    mov         dword ptr [eax],edx
 00458E1F    mov         dword ptr [eax+4],edx
 00458E22    mov         edx,ebx
 00458E24    and         dl,0FC
 00458E27    mov         eax,ebp
 00458E29    call        TComponent.Destroy
 00458E2E    test        bl,bl
>00458E30    jle         00458E39
 00458E32    mov         eax,ebp
 00458E34    call        @ClassDestroy
 00458E39    pop         ebp
 00458E3A    pop         edi
 00458E3B    pop         esi
 00458E3C    pop         ebx
 00458E3D    ret
*}
end;

//00458E40
function TScreen.GetHeight:Integer;
begin
{*
 00458E40    push        1
 00458E42    mov         eax,[005AE32C]
 00458E47    mov         eax,dword ptr [eax]
 00458E49    call        eax
 00458E4B    ret
*}
end;

//00458E4C
function TScreen.GetWidth:Integer;
begin
{*
 00458E4C    push        0
 00458E4E    mov         eax,[005AE32C]
 00458E53    mov         eax,dword ptr [eax]
 00458E55    call        eax
 00458E57    ret
*}
end;

//00458E58
function TScreen.GetDesktopTop:Integer;
begin
{*
 00458E58    push        4D
 00458E5A    mov         eax,[005AE32C]
 00458E5F    mov         eax,dword ptr [eax]
 00458E61    call        eax
 00458E63    ret
*}
end;

//00458E64
function TScreen.GetDesktopLeft:Integer;
begin
{*
 00458E64    push        4C
 00458E66    mov         eax,[005AE32C]
 00458E6B    mov         eax,dword ptr [eax]
 00458E6D    call        eax
 00458E6F    ret
*}
end;

//00458E70
function TScreen.GetDesktopHeight:Integer;
begin
{*
 00458E70    push        4F
 00458E72    mov         eax,[005AE32C]
 00458E77    mov         eax,dword ptr [eax]
 00458E79    call        eax
 00458E7B    ret
*}
end;

//00458E7C
function TScreen.GetDesktopWidth:Integer;
begin
{*
 00458E7C    push        4E
 00458E7E    mov         eax,[005AE32C]
 00458E83    mov         eax,dword ptr [eax]
 00458E85    call        eax
 00458E87    ret
*}
end;

//00458E88
function TScreen.GetMonitor(Index:Integer):TMonitor;
begin
{*
 00458E88    push        ebx
 00458E89    push        esi
 00458E8A    mov         esi,edx
 00458E8C    mov         ebx,eax
 00458E8E    mov         edx,esi
 00458E90    mov         eax,dword ptr [ebx+58]
 00458E93    call        TList.Get
 00458E98    pop         esi
 00458E99    pop         ebx
 00458E9A    ret
*}
end;

//00458E9C
function TScreen.GetMonitorCount:Integer;
begin
{*
 00458E9C    mov         edx,dword ptr [eax+58]
 00458E9F    mov         edx,dword ptr [edx+8]
 00458EA2    test        edx,edx
>00458EA4    jne         00458EB2
 00458EA6    push        50
 00458EA8    mov         eax,[005AE32C]
 00458EAD    mov         eax,dword ptr [eax]
 00458EAF    call        eax
 00458EB1    ret
 00458EB2    mov         eax,edx
 00458EB4    ret
*}
end;

//00458EB8
function TScreen.GetForm(Index:Integer):TForm;
begin
{*
 00458EB8    push        ebx
 00458EB9    push        esi
 00458EBA    mov         esi,edx
 00458EBC    mov         ebx,eax
 00458EBE    mov         edx,esi
 00458EC0    mov         eax,dword ptr [ebx+4C]
 00458EC3    call        TList.Get
 00458EC8    pop         esi
 00458EC9    pop         ebx
 00458ECA    ret
*}
end;

//00458ECC
function TScreen.GetFormCount:Integer;
begin
{*
 00458ECC    mov         eax,dword ptr [eax+4C]
 00458ECF    mov         eax,dword ptr [eax+8]
 00458ED2    ret
*}
end;

//00458ED4
function TScreen.GetCustomForms(Index:Integer):TCustomForm;
begin
{*
 00458ED4    push        ebx
 00458ED5    push        esi
 00458ED6    mov         esi,edx
 00458ED8    mov         ebx,eax
 00458EDA    mov         edx,esi
 00458EDC    mov         eax,dword ptr [ebx+50]
 00458EDF    call        TList.Get
 00458EE4    pop         esi
 00458EE5    pop         ebx
 00458EE6    ret
*}
end;

//00458EE8
function TScreen.GetCustomFormCount:Integer;
begin
{*
 00458EE8    mov         eax,dword ptr [eax+50]
 00458EEB    mov         eax,dword ptr [eax+8]
 00458EEE    ret
*}
end;

//00458EF0
procedure TScreen.UpdateLastActive;
begin
{*
 00458EF0    push        ebx
 00458EF1    mov         ebx,eax
 00458EF3    mov         eax,dword ptr [ebx+68]
 00458EF6    cmp         eax,dword ptr [ebx+74]
>00458EF9    je          00458F16
 00458EFB    mov         dword ptr [ebx+74],eax
 00458EFE    cmp         word ptr [ebx+9A],0
>00458F06    je          00458F16
 00458F08    mov         edx,ebx
 00458F0A    mov         eax,dword ptr [ebx+9C]
 00458F10    call        dword ptr [ebx+98]
 00458F16    mov         eax,dword ptr [ebx+64]
 00458F19    cmp         eax,dword ptr [ebx+70]
>00458F1C    je          00458F39
 00458F1E    mov         dword ptr [ebx+70],eax
 00458F21    cmp         word ptr [ebx+92],0
>00458F29    je          00458F39
 00458F2B    mov         edx,ebx
 00458F2D    mov         eax,dword ptr [ebx+94]
 00458F33    call        dword ptr [ebx+90]
 00458F39    pop         ebx
 00458F3A    ret
*}
end;

//00458F3C
procedure TScreen.AddForm(AForm:TCustomForm);
begin
{*
 00458F3C    push        ebx
 00458F3D    push        esi
 00458F3E    mov         esi,edx
 00458F40    mov         ebx,eax
 00458F42    mov         edx,esi
 00458F44    mov         eax,dword ptr [ebx+50]
 00458F47    call        TList.Add
 00458F4C    mov         eax,esi
 00458F4E    mov         edx,dword ptr ds:[451000];TForm
 00458F54    call        @IsClass
 00458F59    test        al,al
>00458F5B    je          00458F71
 00458F5D    mov         edx,esi
 00458F5F    mov         eax,dword ptr [ebx+4C]
 00458F62    call        TList.Add
 00458F67    mov         eax,[005E0CAC];Application:TApplication
 00458F6C    call        TApplication.UpdateVisible
 00458F71    pop         esi
 00458F72    pop         ebx
 00458F73    ret
*}
end;

//00458F74
procedure TScreen.RemoveForm(AForm:TCustomForm);
begin
{*
 00458F74    push        ebx
 00458F75    push        esi
 00458F76    mov         esi,edx
 00458F78    mov         ebx,eax
 00458F7A    mov         edx,esi
 00458F7C    mov         eax,dword ptr [ebx+50]
 00458F7F    call        TList.Remove
 00458F84    mov         edx,esi
 00458F86    mov         eax,dword ptr [ebx+4C]
 00458F89    call        TList.Remove
 00458F8E    mov         eax,[005E0CAC];Application:TApplication
 00458F93    call        TApplication.UpdateVisible
 00458F98    mov         eax,dword ptr [ebx+50]
 00458F9B    cmp         dword ptr [eax+8],0
>00458F9F    jne         00458FBF
 00458FA1    mov         eax,[005E0CAC];Application:TApplication
 00458FA6    cmp         dword ptr [eax+84],0
>00458FAD    je          00458FBF
 00458FAF    mov         eax,[005E0CAC];Application:TApplication
 00458FB4    mov         eax,dword ptr [eax+84]
 00458FBA    call        THintWindow.ReleaseHandle
 00458FBF    pop         esi
 00458FC0    pop         ebx
 00458FC1    ret
*}
end;

//00458FC4
procedure TScreen.AddDataModule(DataModule:TDataModule);
begin
{*
 00458FC4    mov         eax,dword ptr [eax+54]
 00458FC7    call        TList.Add
 00458FCC    ret
*}
end;

//00458FD0
procedure TScreen.RemoveDataModule(DataModule:TDataModule);
begin
{*
 00458FD0    mov         eax,dword ptr [eax+54]
 00458FD3    call        TList.Remove
 00458FD8    ret
*}
end;

//00458FDC
procedure TScreen.CreateCursors;
begin
{*
 00458FDC    push        ebx
 00458FDD    push        esi
 00458FDE    push        edi
 00458FDF    push        ebp
 00458FE0    mov         ebp,eax
 00458FE2    push        7F00
 00458FE7    push        0
 00458FE9    call        user32.LoadCursorA
 00458FEE    mov         dword ptr [ebp+60],eax
 00458FF1    mov         ebx,0FFFFFFEA
 00458FF6    mov         esi,5ACE44
 00458FFB    cmp         ebx,0FFFFFFEF
>00458FFE    jl          00459005
 00459000    cmp         ebx,0FFFFFFF4
>00459003    jle         0045900A
 00459005    cmp         ebx,0FFFFFFEB
>00459008    jne         00459012
 0045900A    mov         edi,dword ptr ds:[5AF664];gvar_005AF664
>00459010    jmp         00459014
 00459012    xor         edi,edi
 00459014    mov         eax,dword ptr [esi]
 00459016    push        eax
 00459017    push        edi
 00459018    call        user32.LoadCursorA
 0045901D    mov         ecx,eax
 0045901F    mov         edx,ebx
 00459021    mov         eax,ebp
 00459023    call        TScreen.InsertCursor
 00459028    inc         ebx
 00459029    add         esi,4
 0045902C    cmp         ebx,0FFFFFFFF
>0045902F    jne         00458FFB
 00459031    pop         ebp
 00459032    pop         edi
 00459033    pop         esi
 00459034    pop         ebx
 00459035    ret
*}
end;

//00459038
procedure TScreen.DestroyCursors;
begin
{*
 00459038    push        ebx
 00459039    push        esi
 0045903A    push        edi
 0045903B    mov         edi,eax
 0045903D    mov         ebx,dword ptr [edi+5C]
 00459040    test        ebx,ebx
>00459042    je          00459077
 00459044    mov         eax,dword ptr [ebx+4]
 00459047    cmp         eax,0FFFFFFEF
>0045904A    jl          00459051
 0045904C    cmp         eax,0FFFFFFF4
>0045904F    jle         0045905A
 00459051    cmp         eax,0FFFFFFEB
>00459054    je          0045905A
 00459056    test        eax,eax
>00459058    jle         00459063
 0045905A    mov         eax,dword ptr [ebx+8]
 0045905D    push        eax
 0045905E    call        user32.DestroyCursor
 00459063    mov         esi,dword ptr [ebx]
 00459065    mov         edx,0C
 0045906A    mov         eax,ebx
 0045906C    call        @FreeMem
 00459071    mov         ebx,esi
 00459073    test        ebx,ebx
>00459075    jne         00459044
 00459077    push        7F00
 0045907C    push        0
 0045907E    call        user32.LoadCursorA
 00459083    mov         edx,dword ptr [edi+60]
 00459086    cmp         eax,edx
>00459088    je          00459090
 0045908A    push        edx
 0045908B    call        user32.DestroyCursor
 00459090    pop         edi
 00459091    pop         esi
 00459092    pop         ebx
 00459093    ret
*}
end;

//00459094
procedure TScreen.InsertCursor(Index:Integer; Handle:HCURSOR);
begin
{*
 00459094    push        ebx
 00459095    push        esi
 00459096    push        edi
 00459097    mov         edi,ecx
 00459099    mov         esi,edx
 0045909B    mov         ebx,eax
 0045909D    mov         eax,0C
 004590A2    call        @GetMem
 004590A7    mov         edx,dword ptr [ebx+5C]
 004590AA    mov         dword ptr [eax],edx
 004590AC    mov         dword ptr [eax+4],esi
 004590AF    mov         dword ptr [eax+8],edi
 004590B2    mov         dword ptr [ebx+5C],eax
 004590B5    pop         edi
 004590B6    pop         esi
 004590B7    pop         ebx
 004590B8    ret
*}
end;

//004590BC
function TScreen.GetImes:TStrings;
begin
{*
 004590BC    push        ebp
 004590BD    mov         ebp,esp
 004590BF    add         esp,0FFFFFDA0
 004590C5    push        ebx
 004590C6    xor         edx,edx
 004590C8    mov         dword ptr [ebp-260],edx
 004590CE    mov         dword ptr [ebp-4],eax
 004590D1    xor         eax,eax
 004590D3    push        ebp
 004590D4    push        459267
 004590D9    push        dword ptr fs:[eax]
 004590DC    mov         dword ptr fs:[eax],esp
 004590DF    mov         eax,dword ptr [ebp-4]
 004590E2    cmp         dword ptr [eax+34],0
>004590E6    jne         00459248
 004590EC    mov         dl,1
 004590EE    mov         eax,[00418350];TStringList
 004590F3    call        TObject.Create
 004590F8    mov         edx,dword ptr [ebp-4]
 004590FB    mov         dword ptr [edx+34],eax
 004590FE    mov         eax,dword ptr [ebp-4]
 00459101    add         eax,38
 00459104    call        @LStrClr
 00459109    lea         eax,[ebp-114]
 0045910F    push        eax
 00459110    push        40
 00459112    call        user32.GetKeyboardLayoutList
 00459117    dec         eax
 00459118    test        eax,eax
>0045911A    jl          00459237
 00459120    inc         eax
 00459121    mov         dword ptr [ebp-10],eax
 00459124    lea         eax,[ebp-114]
 0045912A    mov         dword ptr [ebp-14],eax
 0045912D    mov         eax,dword ptr [ebp-14]
 00459130    mov         eax,dword ptr [eax]
 00459132    call        Imm32IsIME
 00459137    test        al,al
>00459139    je          0045922A
 0045913F    lea         eax,[ebp-0C]
 00459142    push        eax
 00459143    push        20019
 00459148    push        0
 0045914A    push        0
 0045914C    mov         eax,dword ptr [ebp-14]
 0045914F    mov         eax,dword ptr [eax]
 00459151    mov         dword ptr [ebp-25C],eax
 00459157    mov         byte ptr [ebp-258],0
 0045915E    lea         ecx,[ebp-25C]
 00459164    mov         edx,459278
 00459169    lea         eax,[ebp-254]
 0045916F    call        StrFmt
 00459174    push        eax
 00459175    push        80000002
 0045917A    call        advapi32.RegOpenKeyExA
 0045917F    test        eax,eax
>00459181    jne         0045922A
 00459187    xor         eax,eax
 00459189    push        ebp
 0045918A    push        459223
 0045918F    push        dword ptr fs:[eax]
 00459192    mov         dword ptr fs:[eax],esp
 00459195    mov         dword ptr [ebp-8],100
 0045919C    lea         eax,[ebp-8]
 0045919F    push        eax
 004591A0    lea         eax,[ebp-214]
 004591A6    push        eax
 004591A7    push        0
 004591A9    push        0
 004591AB    push        4592B0
 004591B0    mov         eax,dword ptr [ebp-0C]
 004591B3    push        eax
 004591B4    call        advapi32.RegQueryValueExA
 004591B9    test        eax,eax
>004591BB    jne         0045920C
 004591BD    lea         eax,[ebp-260]
 004591C3    lea         edx,[ebp-214]
 004591C9    mov         ecx,100
 004591CE    call        @LStrFromArray
 004591D3    mov         edx,dword ptr [ebp-260]
 004591D9    mov         eax,dword ptr [ebp-14]
 004591DC    mov         ecx,dword ptr [eax]
 004591DE    mov         eax,dword ptr [ebp-4]
 004591E1    mov         eax,dword ptr [eax+34]
 004591E4    mov         ebx,dword ptr [eax]
 004591E6    call        dword ptr [ebx+3C]
 004591E9    mov         eax,dword ptr [ebp-14]
 004591EC    mov         eax,dword ptr [eax]
 004591EE    mov         edx,dword ptr [ebp-4]
 004591F1    cmp         eax,dword ptr [edx+3C]
>004591F4    jne         0045920C
 004591F6    mov         eax,dword ptr [ebp-4]
 004591F9    add         eax,38
 004591FC    lea         edx,[ebp-214]
 00459202    mov         ecx,100
 00459207    call        @LStrFromArray
 0045920C    xor         eax,eax
 0045920E    pop         edx
 0045920F    pop         ecx
 00459210    pop         ecx
 00459211    mov         dword ptr fs:[eax],edx
 00459214    push        45922A
 00459219    mov         eax,dword ptr [ebp-0C]
 0045921C    push        eax
 0045921D    call        advapi32.RegCloseKey
 00459222    ret
>00459223    jmp         @HandleFinally
>00459228    jmp         00459219
 0045922A    add         dword ptr [ebp-14],4
 0045922E    dec         dword ptr [ebp-10]
>00459231    jne         0045912D
 00459237    mov         eax,dword ptr [ebp-4]
 0045923A    mov         eax,dword ptr [eax+34]
 0045923D    mov         byte ptr [eax+1D],0
 00459241    mov         dl,1
 00459243    call        TStringList.SetSorted
 00459248    mov         eax,dword ptr [ebp-4]
 0045924B    mov         ebx,dword ptr [eax+34]
 0045924E    xor         eax,eax
 00459250    pop         edx
 00459251    pop         ecx
 00459252    pop         ecx
 00459253    mov         dword ptr fs:[eax],edx
 00459256    push        45926E
 0045925B    lea         eax,[ebp-260]
 00459261    call        @LStrClr
 00459266    ret
>00459267    jmp         @HandleFinally
>0045926C    jmp         0045925B
 0045926E    mov         eax,ebx
 00459270    pop         ebx
 00459271    mov         esp,ebp
 00459273    pop         ebp
 00459274    ret
*}
end;

//004592BC
function TScreen.GetDefaultIME:AnsiString;
begin
{*
 004592BC    push        ebx
 004592BD    push        esi
 004592BE    mov         esi,edx
 004592C0    mov         ebx,eax
 004592C2    mov         eax,ebx
 004592C4    call        TScreen.GetImes
 004592C9    mov         eax,esi
 004592CB    mov         edx,dword ptr [ebx+38]
 004592CE    call        @LStrAsg
 004592D3    pop         esi
 004592D4    pop         ebx
 004592D5    ret
*}
end;

//004592D8
procedure TScreen.IconFontChanged(Sender:TObject);
begin
{*
 004592D8    push        ebx
 004592D9    push        esi
 004592DA    mov         esi,edx
 004592DC    mov         ebx,eax
 004592DE    mov         dx,0B035
 004592E2    mov         eax,[005E0CAC];Application:TApplication
 004592E7    call        TApplication.NotifyForms
 004592EC    cmp         esi,dword ptr [ebx+80]
>004592F2    jne         00459323
 004592F4    cmp         dword ptr ds:[5E0CAC],0;Application:TApplication
>004592FB    je          00459323
 004592FD    mov         eax,[005E0CAC];Application:TApplication
 00459302    cmp         byte ptr [eax+88],0
>00459309    je          00459323
 0045930B    xor         edx,edx
 0045930D    mov         eax,[005E0CAC];Application:TApplication
 00459312    call        TApplication.SetShowHint
 00459317    mov         dl,1
 00459319    mov         eax,[005E0CAC];Application:TApplication
 0045931E    call        TApplication.SetShowHint
 00459323    pop         esi
 00459324    pop         ebx
 00459325    ret
*}
end;

//00459328
function TScreen.GetDataModule(Index:Integer):TDataModule;
begin
{*
 00459328    push        ebx
 00459329    push        esi
 0045932A    mov         esi,edx
 0045932C    mov         ebx,eax
 0045932E    mov         edx,esi
 00459330    mov         eax,dword ptr [ebx+54]
 00459333    call        TList.Get
 00459338    pop         esi
 00459339    pop         ebx
 0045933A    ret
*}
end;

//0045933C
function TScreen.GetDataModuleCount:Integer;
begin
{*
 0045933C    mov         eax,dword ptr [eax+54]
 0045933F    mov         eax,dword ptr [eax+8]
 00459342    ret
*}
end;

//00459344
function TScreen.GetCursors(Index:Integer):HCURSOR;
begin
{*
 00459344    xor         ecx,ecx
 00459346    cmp         edx,0FFFFFFFF
>00459349    je          00459367
 0045934B    mov         ecx,dword ptr [eax+5C]
>0045934E    jmp         00459352
 00459350    mov         ecx,dword ptr [ecx]
 00459352    test        ecx,ecx
>00459354    je          0045935B
 00459356    cmp         edx,dword ptr [ecx+4]
>00459359    jne         00459350
 0045935B    test        ecx,ecx
>0045935D    jne         00459364
 0045935F    mov         ecx,dword ptr [eax+60]
>00459362    jmp         00459367
 00459364    mov         ecx,dword ptr [ecx+8]
 00459367    mov         eax,ecx
 00459369    ret
*}
end;

//0045936C
procedure TScreen.SetCursor(Value:TCursor);
begin
{*
 0045936C    push        ebx
 0045936D    push        esi
 0045936E    push        edi
 0045936F    push        ebp
 00459370    add         esp,0FFFFFFF8
 00459373    mov         esi,edx
 00459375    mov         ebx,eax
 00459377    cmp         si,word ptr [ebx+44]
>0045937B    je          004593F0
 0045937D    mov         word ptr [ebx+44],si
 00459381    test        si,si
>00459384    jne         004593E0
 00459386    push        esp
 00459387    call        user32.GetCursorPos
 0045938C    push        dword ptr [esp+4]
 00459390    push        dword ptr [esp+4]
 00459394    call        user32.WindowFromPoint
 00459399    mov         edi,eax
 0045939B    test        edi,edi
>0045939D    je          004593E0
 0045939F    push        0
 004593A1    push        edi
 004593A2    call        user32.GetWindowThreadProcessId
 004593A7    mov         ebp,eax
 004593A9    call        KERNEL32.GetCurrentThreadId
 004593AE    cmp         ebp,eax
>004593B0    jne         004593E0
 004593B2    mov         eax,esp
 004593B4    call        PointToSmallPoint
 004593B9    push        eax
 004593BA    push        0
 004593BC    push        84
 004593C1    push        edi
 004593C2    call        user32.SendMessageA
 004593C7    mov         ebx,eax
 004593C9    mov         dx,200
 004593CD    mov         eax,ebx
 004593CF    call        MakeLong
 004593D4    push        eax
 004593D5    push        edi
 004593D6    push        20
 004593D8    push        edi
 004593D9    call        user32.SendMessageA
>004593DE    jmp         004593F3
 004593E0    movsx       edx,si
 004593E3    mov         eax,ebx
 004593E5    call        TScreen.GetCursors
 004593EA    push        eax
 004593EB    call        user32.SetCursor
 004593F0    inc         dword ptr [ebx+48]
 004593F3    pop         ecx
 004593F4    pop         edx
 004593F5    pop         ebp
 004593F6    pop         edi
 004593F7    pop         esi
 004593F8    pop         ebx
 004593F9    ret
*}
end;

//004593FC
procedure TScreen.GetMetricSettings;
begin
{*
 004593FC    push        ebp
 004593FD    mov         ebp,esp
 004593FF    add         esp,0FFFFFE6C
 00459405    push        ebx
 00459406    mov         ebx,eax
 00459408    mov         byte ptr [ebp-1],0
 0045940C    cmp         dword ptr ds:[5E0CAC],0;Application:TApplication
>00459413    je          00459423
 00459415    mov         eax,[005E0CAC];Application:TApplication
 0045941A    mov         al,byte ptr [eax+88]
 00459420    mov         byte ptr [ebp-1],al
 00459423    xor         eax,eax
 00459425    push        ebp
 00459426    push        459541
 0045942B    push        dword ptr fs:[eax]
 0045942E    mov         dword ptr fs:[eax],esp
 00459431    cmp         dword ptr ds:[5E0CAC],0;Application:TApplication
>00459438    je          00459446
 0045943A    xor         edx,edx
 0045943C    mov         eax,[005E0CAC];Application:TApplication
 00459441    call        TApplication.SetShowHint
 00459446    push        0
 00459448    lea         eax,[ebp-3D]
 0045944B    push        eax
 0045944C    push        3C
 0045944E    push        1F
 00459450    call        user32.SystemParametersInfoA
 00459455    test        eax,eax
>00459457    je          00459471
 00459459    lea         eax,[ebp-3D]
 0045945C    push        eax
 0045945D    call        gdi32.CreateFontIndirectA
 00459462    mov         edx,eax
 00459464    mov         eax,dword ptr [ebx+84]
 0045946A    call        TFont.SetHandle
>0045946F    jmp         00459485
 00459471    push        0D
 00459473    call        gdi32.GetStockObject
 00459478    mov         edx,eax
 0045947A    mov         eax,dword ptr [ebx+84]
 00459480    call        TFont.SetHandle
 00459485    mov         dword ptr [ebp-191],154
 0045948F    push        0
 00459491    lea         eax,[ebp-191]
 00459497    push        eax
 00459498    push        0
 0045949A    push        29
 0045949C    call        user32.SystemParametersInfoA
 004594A1    test        eax,eax
>004594A3    je          004594D9
 004594A5    lea         eax,[ebp-0B5]
 004594AB    push        eax
 004594AC    call        gdi32.CreateFontIndirectA
 004594B1    mov         edx,eax
 004594B3    mov         eax,dword ptr [ebx+80]
 004594B9    call        TFont.SetHandle
 004594BE    lea         eax,[ebp-0F1]
 004594C4    push        eax
 004594C5    call        gdi32.CreateFontIndirectA
 004594CA    mov         edx,eax
 004594CC    mov         eax,dword ptr [ebx+88]
 004594D2    call        TFont.SetHandle
>004594D7    jmp         004594FD
 004594D9    mov         eax,dword ptr [ebx+80]
 004594DF    mov         edx,8
 004594E4    call        TFont.SetSize
 004594E9    push        0D
 004594EB    call        gdi32.GetStockObject
 004594F0    mov         edx,eax
 004594F2    mov         eax,dword ptr [ebx+88]
 004594F8    call        TFont.SetHandle
 004594FD    mov         eax,dword ptr [ebx+80]
 00459503    mov         edx,0FF000017
 00459508    call        TFont.SetColor
 0045950D    mov         eax,dword ptr [ebx+88]
 00459513    mov         edx,0FF000007
 00459518    call        TFont.SetColor
 0045951D    xor         eax,eax
 0045951F    pop         edx
 00459520    pop         ecx
 00459521    pop         ecx
 00459522    mov         dword ptr fs:[eax],edx
 00459525    push        459548
 0045952A    cmp         dword ptr ds:[5E0CAC],0;Application:TApplication
>00459531    je          00459540
 00459533    mov         dl,byte ptr [ebp-1]
 00459536    mov         eax,[005E0CAC];Application:TApplication
 0045953B    call        TApplication.SetShowHint
 00459540    ret
>00459541    jmp         @HandleFinally
>00459546    jmp         0045952A
 00459548    pop         ebx
 00459549    mov         esp,ebp
 0045954B    pop         ebp
 0045954C    ret
*}
end;

//00459550
procedure TScreen.DisableAlign;
begin
{*
 00459550    inc         word ptr [eax+8C]
 00459557    ret
*}
end;

//00459558
procedure TScreen.EnableAlign;
begin
{*
 00459558    dec         word ptr [eax+8C]
 0045955F    cmp         word ptr [eax+8C],0
>00459567    jne         00459577
 00459569    test        byte ptr [eax+8E],10
>00459570    je          00459577
 00459572    call        TScreen.Realign
 00459577    ret
*}
end;

//00459578
procedure TScreen.Realign;
begin
{*
 00459578    xor         edx,edx
 0045957A    call        TScreen.AlignForm
 0045957F    ret
*}
end;

//00459580
function InsertBefore(C1:TCustomForm; C2:TCustomForm; AAlign:TAlign):Boolean;
begin
{*
 00459580    push        ebp
 00459581    mov         ebp,esp
 00459583    push        ecx
 00459584    push        ebx
 00459585    mov         byte ptr [ebp-1],cl
 00459588    xor         ecx,ecx
 0045958A    mov         bl,byte ptr [ebp-1]
 0045958D    dec         bl
>0045958F    je          0045959F
 00459591    dec         bl
>00459593    je          004595AA
 00459595    dec         bl
>00459597    je          004595BD
 00459599    dec         bl
>0045959B    je          004595C8
>0045959D    jmp         004595D9
 0045959F    mov         edx,dword ptr [edx+44]
 004595A2    cmp         edx,dword ptr [eax+44]
 004595A5    setg        cl
>004595A8    jmp         004595D9
 004595AA    mov         ecx,dword ptr [edx+44]
 004595AD    add         ecx,dword ptr [edx+4C]
 004595B0    mov         edx,dword ptr [eax+44]
 004595B3    add         edx,dword ptr [eax+4C]
 004595B6    cmp         ecx,edx
 004595B8    setl        cl
>004595BB    jmp         004595D9
 004595BD    mov         edx,dword ptr [edx+40]
 004595C0    cmp         edx,dword ptr [eax+40]
 004595C3    setg        cl
>004595C6    jmp         004595D9
 004595C8    mov         ecx,dword ptr [edx+40]
 004595CB    add         ecx,dword ptr [edx+48]
 004595CE    mov         edx,dword ptr [eax+40]
 004595D1    add         edx,dword ptr [eax+48]
 004595D4    cmp         ecx,edx
 004595D6    setl        cl
 004595D9    mov         eax,ecx
 004595DB    pop         ebx
 004595DC    pop         ecx
 004595DD    pop         ebp
 004595DE    ret
*}
end;

//004595E0
procedure DoPosition(Form:TCustomForm; AAlign:TAlign);
begin
{*
 004595E0    push        ebp
 004595E1    mov         ebp,esp
 004595E3    add         esp,0FFFFFFF0
 004595E6    push        ebx
 004595E7    push        esi
 004595E8    push        edi
 004595E9    mov         byte ptr [ebp-1],dl
 004595EC    mov         ebx,eax
 004595EE    mov         eax,dword ptr [ebp+8]
 004595F1    mov         esi,dword ptr [eax-4]
 004595F4    mov         esi,dword ptr [esi+8]
 004595F7    mov         eax,dword ptr [ebp+8]
 004595FA    mov         eax,dword ptr [eax-4]
 004595FD    sub         esi,dword ptr [eax]
 004595FF    test        esi,esi
>00459601    jl          0045960C
 00459603    mov         al,byte ptr [ebp-1]
 00459606    add         al,0FD
 00459608    sub         al,2
>0045960A    jae         0045960F
 0045960C    mov         esi,dword ptr [ebx+48]
 0045960F    mov         eax,dword ptr [ebp+8]
 00459612    mov         eax,dword ptr [eax-4]
 00459615    mov         eax,dword ptr [eax+0C]
 00459618    mov         edx,dword ptr [ebp+8]
 0045961B    mov         edx,dword ptr [edx-4]
 0045961E    sub         eax,dword ptr [edx+4]
 00459621    mov         dword ptr [ebp-10],eax
 00459624    cmp         dword ptr [ebp-10],0
>00459628    jl          00459632
 0045962A    mov         al,byte ptr [ebp-1]
 0045962D    dec         eax
 0045962E    sub         al,2
>00459630    jae         00459638
 00459632    mov         eax,dword ptr [ebx+4C]
 00459635    mov         dword ptr [ebp-10],eax
 00459638    cmp         byte ptr [ebp-1],1
>0045963C    jne         00459662
 0045963E    cmp         byte ptr [ebx+22B],2
>00459645    jne         00459662
 00459647    mov         eax,dword ptr [ebx+40]
 0045964A    mov         dword ptr [ebp-8],eax
 0045964D    mov         eax,dword ptr [ebx+44]
 00459650    mov         dword ptr [ebp-0C],eax
 00459653    push        3D
 00459655    mov         eax,[005AE32C]
 0045965A    mov         eax,dword ptr [eax]
 0045965C    call        eax
 0045965E    mov         esi,eax
>00459660    jmp         00459679
 00459662    mov         eax,dword ptr [ebp+8]
 00459665    mov         eax,dword ptr [eax-4]
 00459668    mov         eax,dword ptr [eax]
 0045966A    mov         dword ptr [ebp-8],eax
 0045966D    mov         eax,dword ptr [ebp+8]
 00459670    mov         eax,dword ptr [eax-4]
 00459673    mov         eax,dword ptr [eax+4]
 00459676    mov         dword ptr [ebp-0C],eax
 00459679    mov         al,byte ptr [ebp-1]
 0045967C    dec         al
>0045967E    je          0045968E
 00459680    dec         al
>00459682    je          0045969C
 00459684    dec         al
>00459686    je          004596B6
 00459688    dec         al
>0045968A    je          004596C0
>0045968C    jmp         004596D5
 0045968E    mov         eax,dword ptr [ebp+8]
 00459691    mov         eax,dword ptr [eax-4]
 00459694    mov         edx,dword ptr [ebp-10]
 00459697    add         dword ptr [eax+4],edx
>0045969A    jmp         004596D5
 0045969C    mov         eax,dword ptr [ebp+8]
 0045969F    mov         eax,dword ptr [eax-4]
 004596A2    mov         edx,dword ptr [ebp-10]
 004596A5    sub         dword ptr [eax+0C],edx
 004596A8    mov         eax,dword ptr [ebp+8]
 004596AB    mov         eax,dword ptr [eax-4]
 004596AE    mov         eax,dword ptr [eax+0C]
 004596B1    mov         dword ptr [ebp-0C],eax
>004596B4    jmp         004596D5
 004596B6    mov         eax,dword ptr [ebp+8]
 004596B9    mov         eax,dword ptr [eax-4]
 004596BC    add         dword ptr [eax],esi
>004596BE    jmp         004596D5
 004596C0    mov         eax,dword ptr [ebp+8]
 004596C3    mov         eax,dword ptr [eax-4]
 004596C6    sub         dword ptr [eax+8],esi
 004596C9    mov         eax,dword ptr [ebp+8]
 004596CC    mov         eax,dword ptr [eax-4]
 004596CF    mov         eax,dword ptr [eax+8]
 004596D2    mov         dword ptr [ebp-8],eax
 004596D5    push        esi
 004596D6    mov         eax,dword ptr [ebp-10]
 004596D9    push        eax
 004596DA    mov         ecx,dword ptr [ebp-0C]
 004596DD    mov         edx,dword ptr [ebp-8]
 004596E0    mov         eax,ebx
 004596E2    mov         edi,dword ptr [eax]
 004596E4    call        dword ptr [edi+84]
 004596EA    cmp         byte ptr [ebx+22B],2
>004596F1    jne         004596FC
 004596F3    sub         esi,dword ptr [ebp-8]
 004596F6    mov         eax,dword ptr [ebp-0C]
 004596F9    sub         dword ptr [ebp-10],eax
 004596FC    mov         eax,dword ptr [ebx+48]
 004596FF    cmp         esi,eax
>00459701    jne         0045970B
 00459703    mov         edx,dword ptr [ebx+4C]
 00459706    cmp         edx,dword ptr [ebp-10]
>00459709    je          00459789
 0045970B    xor         edx,edx
 0045970D    mov         dl,byte ptr [ebp-1]
 00459710    cmp         edx,5
>00459713    ja          00459789
 00459715    jmp         dword ptr [edx*4+45971C]
 00459715    dd          00459789
 00459715    dd          00459734
 00459715    dd          00459745
 00459715    dd          00459756
 00459715    dd          00459762
 00459715    dd          0045976F
 00459734    mov         eax,dword ptr [ebp-10]
 00459737    sub         eax,dword ptr [ebx+4C]
 0045973A    mov         edx,dword ptr [ebp+8]
 0045973D    mov         edx,dword ptr [edx-4]
 00459740    sub         dword ptr [edx+4],eax
>00459743    jmp         00459789
 00459745    mov         eax,dword ptr [ebp-10]
 00459748    sub         eax,dword ptr [ebx+4C]
 0045974B    mov         edx,dword ptr [ebp+8]
 0045974E    mov         edx,dword ptr [edx-4]
 00459751    add         dword ptr [edx+0C],eax
>00459754    jmp         00459789
 00459756    sub         esi,eax
 00459758    mov         eax,dword ptr [ebp+8]
 0045975B    mov         eax,dword ptr [eax-4]
 0045975E    sub         dword ptr [eax],esi
>00459760    jmp         00459789
 00459762    sub         esi,eax
 00459764    mov         eax,dword ptr [ebp+8]
 00459767    mov         eax,dword ptr [eax-4]
 0045976A    add         dword ptr [eax+8],esi
>0045976D    jmp         00459789
 0045976F    sub         esi,eax
 00459771    mov         eax,dword ptr [ebp+8]
 00459774    mov         eax,dword ptr [eax-4]
 00459777    add         dword ptr [eax+8],esi
 0045977A    mov         eax,dword ptr [ebp-10]
 0045977D    sub         eax,dword ptr [ebx+4C]
 00459780    mov         edx,dword ptr [ebp+8]
 00459783    mov         edx,dword ptr [edx-4]
 00459786    add         dword ptr [edx+0C],eax
 00459789    pop         edi
 0045978A    pop         esi
 0045978B    pop         ebx
 0045978C    mov         esp,ebp
 0045978E    pop         ebp
 0045978F    ret
*}
end;

//00459790
procedure DoAlign(AAlign:TAlign);
begin
{*
 00459790    push        ebp
 00459791    mov         ebp,esp
 00459793    add         esp,0FFFFFFF8
 00459796    push        ebx
 00459797    push        esi
 00459798    push        edi
 00459799    mov         byte ptr [ebp-1],al
 0045979C    mov         eax,dword ptr [ebp+8]
 0045979F    mov         eax,dword ptr [eax-8]
 004597A2    mov         edx,dword ptr [eax]
 004597A4    call        dword ptr [edx+8]
 004597A7    mov         eax,dword ptr [ebp+8]
 004597AA    cmp         dword ptr [eax-0C],0
>004597AE    je          00459802
 004597B0    mov         eax,dword ptr [ebp+8]
 004597B3    mov         eax,dword ptr [eax-0C]
 004597B6    cmp         dword ptr [eax+30],0
>004597BA    jne         00459802
 004597BC    mov         eax,dword ptr [ebp+8]
 004597BF    mov         eax,dword ptr [eax-0C]
 004597C2    test        byte ptr [eax+1C],10
>004597C6    jne         00459802
 004597C8    mov         eax,dword ptr [ebp+8]
 004597CB    mov         eax,dword ptr [eax-0C]
 004597CE    cmp         byte ptr [eax+57],0
>004597D2    je          00459802
 004597D4    mov         eax,dword ptr [ebp+8]
 004597D7    mov         eax,dword ptr [eax-0C]
 004597DA    mov         al,byte ptr [eax+5B]
 004597DD    cmp         al,byte ptr [ebp-1]
>004597E0    jne         00459802
 004597E2    mov         eax,dword ptr [ebp+8]
 004597E5    mov         eax,dword ptr [eax-0C]
 004597E8    cmp         byte ptr [eax+22B],1
>004597EF    je          00459802
 004597F1    mov         eax,dword ptr [ebp+8]
 004597F4    mov         edx,dword ptr [eax-0C]
 004597F7    mov         eax,dword ptr [ebp+8]
 004597FA    mov         eax,dword ptr [eax-8]
 004597FD    call        TList.Add
 00459802    mov         eax,dword ptr [ebp+8]
 00459805    mov         eax,dword ptr [eax-10]
 00459808    call        TScreen.GetCustomFormCount
 0045980D    mov         edi,eax
 0045980F    dec         edi
 00459810    test        edi,edi
>00459812    jl          0045989D
 00459818    inc         edi
 00459819    mov         dword ptr [ebp-8],0
 00459820    mov         eax,dword ptr [ebp+8]
 00459823    mov         eax,dword ptr [eax-10]
 00459826    mov         edx,dword ptr [ebp-8]
 00459829    call        TScreen.GetCustomForms
 0045982E    mov         ebx,eax
 00459830    cmp         dword ptr [ebx+30],0
>00459834    jne         00459897
 00459836    mov         al,byte ptr [ebx+5B]
 00459839    cmp         al,byte ptr [ebp-1]
>0045983C    jne         00459897
 0045983E    test        byte ptr [ebx+1C],10
>00459842    jne         00459897
 00459844    cmp         byte ptr [ebx+57],0
>00459848    je          00459897
 0045984A    cmp         byte ptr [ebx+22B],1
>00459851    je          00459897
 00459853    mov         eax,dword ptr [ebp+8]
 00459856    cmp         ebx,dword ptr [eax-0C]
>00459859    je          00459897
 0045985B    xor         esi,esi
>0045985D    jmp         00459860
 0045985F    inc         esi
 00459860    mov         eax,dword ptr [ebp+8]
 00459863    mov         eax,dword ptr [eax-8]
 00459866    cmp         esi,dword ptr [eax+8]
>00459869    jge         00459888
 0045986B    mov         eax,dword ptr [ebp+8]
 0045986E    mov         eax,dword ptr [eax-8]
 00459871    mov         edx,esi
 00459873    call        TList.Get
 00459878    mov         edx,eax
 0045987A    mov         cl,byte ptr [ebp-1]
 0045987D    mov         eax,ebx
 0045987F    call        InsertBefore
 00459884    test        al,al
>00459886    je          0045985F
 00459888    mov         eax,dword ptr [ebp+8]
 0045988B    mov         eax,dword ptr [eax-8]
 0045988E    mov         ecx,ebx
 00459890    mov         edx,esi
 00459892    call        TList.Insert
 00459897    inc         dword ptr [ebp-8]
 0045989A    dec         edi
>0045989B    jne         00459820
 0045989D    mov         eax,dword ptr [ebp+8]
 004598A0    mov         eax,dword ptr [eax-8]
 004598A3    mov         edi,dword ptr [eax+8]
 004598A6    dec         edi
 004598A7    test        edi,edi
>004598A9    jl          004598D4
 004598AB    inc         edi
 004598AC    mov         dword ptr [ebp-8],0
 004598B3    mov         eax,dword ptr [ebp+8]
 004598B6    push        eax
 004598B7    mov         eax,dword ptr [ebp+8]
 004598BA    mov         eax,dword ptr [eax-8]
 004598BD    mov         edx,dword ptr [ebp-8]
 004598C0    call        TList.Get
 004598C5    mov         dl,byte ptr [ebp-1]
 004598C8    call        DoPosition
 004598CD    pop         ecx
 004598CE    inc         dword ptr [ebp-8]
 004598D1    dec         edi
>004598D2    jne         004598B3
 004598D4    pop         edi
 004598D5    pop         esi
 004598D6    pop         ebx
 004598D7    pop         ecx
 004598D8    pop         ecx
 004598D9    pop         ebp
 004598DA    ret
*}
end;

//004598DC
function AlignWork:Boolean;
begin
{*
 004598DC    push        ebp
 004598DD    mov         ebp,esp
 004598DF    push        ebx
 004598E0    push        esi
 004598E1    mov         bl,1
 004598E3    mov         eax,dword ptr [ebp+8]
 004598E6    mov         eax,dword ptr [eax-10]
 004598E9    call        TScreen.GetCustomFormCount
 004598EE    mov         esi,eax
 004598F0    dec         esi
 004598F1    cmp         esi,0
>004598F4    jl          0045992A
 004598F6    mov         eax,dword ptr [ebp+8]
 004598F9    mov         eax,dword ptr [eax-10]
 004598FC    mov         edx,esi
 004598FE    call        TScreen.GetCustomForms
 00459903    cmp         dword ptr [eax+30],0
>00459907    jne         00459924
 00459909    test        byte ptr [eax+1C],10
>0045990D    jne         00459924
 0045990F    cmp         byte ptr [eax+5B],0
>00459913    je          00459924
 00459915    cmp         byte ptr [eax+57],0
>00459919    je          00459924
 0045991B    cmp         byte ptr [eax+22B],1
>00459922    jne         0045992C
 00459924    dec         esi
 00459925    cmp         esi,0FFFFFFFF
>00459928    jne         004598F6
 0045992A    xor         ebx,ebx
 0045992C    mov         eax,ebx
 0045992E    pop         esi
 0045992F    pop         ebx
 00459930    pop         ebp
 00459931    ret
*}
end;

//00459934
procedure TScreen.AlignForms(AForm:TCustomForm; var Rect:TRect);
begin
{*
 00459934    push        ebp
 00459935    mov         ebp,esp
 00459937    add         esp,0FFFFFFF0
 0045993A    mov         dword ptr [ebp-4],ecx
 0045993D    mov         dword ptr [ebp-0C],edx
 00459940    mov         dword ptr [ebp-10],eax
 00459943    push        ebp
 00459944    call        AlignWork
 00459949    pop         ecx
 0045994A    test        al,al
>0045994C    je          004599B5
 0045994E    mov         dl,1
 00459950    mov         eax,[00417CEC];TList
 00459955    call        TObject.Create
 0045995A    mov         dword ptr [ebp-8],eax
 0045995D    xor         eax,eax
 0045995F    push        ebp
 00459960    push        4599AE
 00459965    push        dword ptr fs:[eax]
 00459968    mov         dword ptr fs:[eax],esp
 0045996B    push        ebp
 0045996C    mov         al,1
 0045996E    call        DoAlign
 00459973    pop         ecx
 00459974    push        ebp
 00459975    mov         al,2
 00459977    call        DoAlign
 0045997C    pop         ecx
 0045997D    push        ebp
 0045997E    mov         al,3
 00459980    call        DoAlign
 00459985    pop         ecx
 00459986    push        ebp
 00459987    mov         al,4
 00459989    call        DoAlign
 0045998E    pop         ecx
 0045998F    push        ebp
 00459990    mov         al,5
 00459992    call        DoAlign
 00459997    pop         ecx
 00459998    xor         eax,eax
 0045999A    pop         edx
 0045999B    pop         ecx
 0045999C    pop         ecx
 0045999D    mov         dword ptr fs:[eax],edx
 004599A0    push        4599B5
 004599A5    mov         eax,dword ptr [ebp-8]
 004599A8    call        TObject.Free
 004599AD    ret
>004599AE    jmp         @HandleFinally
>004599B3    jmp         004599A5
 004599B5    mov         esp,ebp
 004599B7    pop         ebp
 004599B8    ret
*}
end;

//004599BC
procedure TScreen.AlignForm(AForm:TCustomForm);
begin
{*
 004599BC    push        ebp
 004599BD    mov         ebp,esp
 004599BF    add         esp,0FFFFFFEC
 004599C2    push        ebx
 004599C3    mov         ebx,edx
 004599C5    mov         dword ptr [ebp-4],eax
 004599C8    mov         eax,dword ptr [ebp-4]
 004599CB    cmp         word ptr [eax+8C],0
>004599D3    je          004599E2
 004599D5    mov         eax,dword ptr [ebp-4]
 004599D8    or          word ptr [eax+8E],10
>004599E0    jmp         00459A3C
 004599E2    mov         eax,dword ptr [ebp-4]
 004599E5    call        TScreen.DisableAlign
 004599EA    xor         eax,eax
 004599EC    push        ebp
 004599ED    push        459A35
 004599F2    push        dword ptr fs:[eax]
 004599F5    mov         dword ptr fs:[eax],esp
 004599F8    push        0
 004599FA    lea         eax,[ebp-14]
 004599FD    push        eax
 004599FE    push        0
 00459A00    push        30
 00459A02    call        user32.SystemParametersInfoA
 00459A07    lea         ecx,[ebp-14]
 00459A0A    mov         edx,ebx
 00459A0C    mov         eax,dword ptr [ebp-4]
 00459A0F    call        TScreen.AlignForms
 00459A14    xor         eax,eax
 00459A16    pop         edx
 00459A17    pop         ecx
 00459A18    pop         ecx
 00459A19    mov         dword ptr fs:[eax],edx
 00459A1C    push        459A3C
 00459A21    mov         eax,dword ptr [ebp-4]
 00459A24    and         word ptr [eax+8E],0FFFFFFEF
 00459A2C    mov         eax,dword ptr [ebp-4]
 00459A2F    call        TScreen.EnableAlign
 00459A34    ret
>00459A35    jmp         @HandleFinally
>00459A3A    jmp         00459A21
 00459A3C    pop         ebx
 00459A3D    mov         esp,ebp
 00459A3F    pop         ebp
 00459A40    ret
*}
end;

//00459A44
procedure TScreen.ResetFonts;
begin
{*
 00459A44    add         eax,30
 00459A47    call        FreeAndNil
 00459A4C    ret
*}
end;

//00459A50
function GetHint(Control:TControl):AnsiString;
begin
{*
 00459A50    push        ebx
 00459A51    push        esi
 00459A52    mov         esi,edx
 00459A54    mov         ebx,eax
 00459A56    test        ebx,ebx
>00459A58    je          00459A7C
 00459A5A    cmp         dword ptr [ebx+80],0
>00459A61    jne         00459A68
 00459A63    mov         ebx,dword ptr [ebx+30]
>00459A66    jmp         00459A78
 00459A68    mov         eax,esi
 00459A6A    mov         edx,dword ptr [ebx+80]
 00459A70    call        @LStrAsg
 00459A75    pop         esi
 00459A76    pop         ebx
 00459A77    ret
 00459A78    test        ebx,ebx
>00459A7A    jne         00459A5A
 00459A7C    mov         eax,esi
 00459A7E    call        @LStrClr
 00459A83    pop         esi
 00459A84    pop         ebx
 00459A85    ret
*}
end;

//00459A88
function GetHintControl(Control:TControl):TControl;
begin
{*
>00459A88    jmp         00459A8D
 00459A8A    mov         eax,dword ptr [eax+30]
 00459A8D    test        eax,eax
>00459A8F    je          00459A9A
 00459A91    cmp         byte ptr [eax+99],0
>00459A98    je          00459A8A
 00459A9A    test        eax,eax
>00459A9C    je          00459AA6
 00459A9E    test        byte ptr [eax+1C],10
>00459AA2    je          00459AA6
 00459AA4    xor         eax,eax
 00459AA6    ret
*}
end;

//00459AA8
procedure HintTimerProc(Wnd:HWND; Msg:Longint; TimerID:Longint; SysTime:Longint); stdcall;
begin
{*
 00459AA8    push        ebp
 00459AA9    mov         ebp,esp
 00459AAB    push        ebx
 00459AAC    push        esi
 00459AAD    push        edi
 00459AAE    cmp         dword ptr ds:[5E0CAC],0;Application:TApplication
>00459AB5    je          00459AF3
 00459AB7    xor         eax,eax
 00459AB9    push        ebp
 00459ABA    push        459AD9
 00459ABF    push        dword ptr fs:[eax]
 00459AC2    mov         dword ptr fs:[eax],esp
 00459AC5    mov         eax,[005E0CAC];Application:TApplication
 00459ACA    call        TApplication.HintTimerExpired
 00459ACF    xor         eax,eax
 00459AD1    pop         edx
 00459AD2    pop         ecx
 00459AD3    pop         ecx
 00459AD4    mov         dword ptr fs:[eax],edx
>00459AD7    jmp         00459AF3
>00459AD9    jmp         @HandleAnyException
 00459ADE    mov         edx,dword ptr ds:[5E0CAC];Application:TApplication
 00459AE4    mov         eax,[005E0CAC];Application:TApplication
 00459AE9    call        TApplication.HandleException
 00459AEE    call        @DoneExcept
 00459AF3    pop         edi
 00459AF4    pop         esi
 00459AF5    pop         ebx
 00459AF6    pop         ebp
 00459AF7    ret         10
*}
end;

//00459AFC
procedure HintMouseThread(Param:Integer); stdcall;
begin
{*
 00459AFC    push        ebp
 00459AFD    mov         ebp,esp
 00459AFF    add         esp,0FFFFFFF8
 00459B02    push        ebx
 00459B03    mov         ebx,5E0CAC;Application:TApplication
 00459B08    call        KERNEL32.GetCurrentThreadId
 00459B0D    mov         [005E0CBC],eax;HintThreadID:DWORD
>00459B12    jmp         00459B3D
 00459B14    cmp         dword ptr [ebx],0
>00459B17    je          00459B3D
 00459B19    mov         eax,dword ptr [ebx]
 00459B1B    cmp         dword ptr [eax+60],0
>00459B1F    je          00459B3D
 00459B21    lea         eax,[ebp-8]
 00459B24    push        eax
 00459B25    call        user32.GetCursorPos
 00459B2A    lea         eax,[ebp-8]
 00459B2D    call        FindVCLWindow
 00459B32    test        eax,eax
>00459B34    jne         00459B3D
 00459B36    mov         eax,dword ptr [ebx]
 00459B38    call        TApplication.CancelHint
 00459B3D    push        64
 00459B3F    mov         eax,[005E0CC0];HintDoneEvent:THandle
 00459B44    push        eax
 00459B45    call        KERNEL32.WaitForSingleObject
 00459B4A    cmp         eax,102
>00459B4F    je          00459B14
 00459B51    pop         ebx
 00459B52    pop         ecx
 00459B53    pop         ecx
 00459B54    pop         ebp
 00459B55    ret         4
*}
end;

//00459B58
function HintGetMsgHook(nCode:Integer; wParam:Longint; var Msg:TMsg):Longint; stdcall;
begin
{*
 00459B58    push        ebp
 00459B59    mov         ebp,esp
 00459B5B    push        ebx
 00459B5C    push        esi
 00459B5D    push        edi
 00459B5E    mov         esi,dword ptr [ebp+10]
 00459B61    mov         ebx,dword ptr [ebp+8]
 00459B64    push        esi
 00459B65    mov         eax,dword ptr [ebp+0C]
 00459B68    push        eax
 00459B69    push        ebx
 00459B6A    mov         eax,[005E0CC4];HintHook:HHOOK
 00459B6F    push        eax
 00459B70    call        user32.CallNextHookEx
 00459B75    mov         edi,eax
 00459B77    test        ebx,ebx
>00459B79    jl          00459B90
 00459B7B    cmp         dword ptr ds:[5E0CAC],0;Application:TApplication
>00459B82    je          00459B90
 00459B84    mov         edx,esi
 00459B86    mov         eax,[005E0CAC];Application:TApplication
 00459B8B    call        TApplication.IsHintMsg
 00459B90    mov         eax,edi
 00459B92    pop         edi
 00459B93    pop         esi
 00459B94    pop         ebx
 00459B95    pop         ebp
 00459B96    ret         0C
*}
end;

//00459B9C
procedure HookHintHooks;
begin
{*
 00459B9C    push        ecx
 00459B9D    mov         eax,[005E0CAC];Application:TApplication
 00459BA2    cmp         byte ptr [eax+0A5],0
>00459BA9    jne         00459C0D
 00459BAB    cmp         dword ptr ds:[5E0CC4],0;HintHook:HHOOK
>00459BB2    jne         00459BCE
 00459BB4    call        KERNEL32.GetCurrentThreadId
 00459BB9    push        eax
 00459BBA    push        0
 00459BBC    mov         eax,459B58;HintGetMsgHook:Longint
 00459BC1    push        eax
 00459BC2    push        3
 00459BC4    call        user32.SetWindowsHookExA
 00459BC9    mov         [005E0CC4],eax;HintHook:HHOOK
 00459BCE    cmp         dword ptr ds:[5E0CC0],0;HintDoneEvent:THandle
>00459BD5    jne         00459BE9
 00459BD7    push        0
 00459BD9    push        0
 00459BDB    push        0
 00459BDD    push        0
 00459BDF    call        KERNEL32.CreateEventA
 00459BE4    mov         [005E0CC0],eax;HintDoneEvent:THandle
 00459BE9    cmp         dword ptr ds:[5E0CC8],0;HintThread:THandle
>00459BF0    jne         00459C0D
 00459BF2    push        esp
 00459BF3    push        0
 00459BF5    push        0
 00459BF7    push        459AFC;HintMouseThread
 00459BFC    push        3E8
 00459C01    push        0
 00459C03    call        KERNEL32.CreateThread
 00459C08    mov         [005E0CC8],eax;HintThread:THandle
 00459C0D    pop         edx
 00459C0E    ret
*}
end;

//00459C10
procedure UnhookHintHooks;
begin
{*
 00459C10    cmp         dword ptr ds:[5E0CC4],0;HintHook:HHOOK
>00459C17    je          00459C24
 00459C19    mov         eax,[005E0CC4];HintHook:HHOOK
 00459C1E    push        eax
 00459C1F    call        user32.UnhookWindowsHookEx
 00459C24    xor         eax,eax
 00459C26    mov         [005E0CC4],eax;HintHook:HHOOK
 00459C2B    cmp         dword ptr ds:[5E0CC8],0;HintThread:THandle
>00459C32    je          00459C6B
 00459C34    mov         eax,[005E0CC0];HintDoneEvent:THandle
 00459C39    push        eax
 00459C3A    call        KERNEL32.SetEvent
 00459C3F    call        KERNEL32.GetCurrentThreadId
 00459C44    cmp         eax,dword ptr ds:[5E0CBC];HintThreadID:DWORD
>00459C4A    je          00459C59
 00459C4C    push        0FF
 00459C4E    mov         eax,[005E0CC8];HintThread:THandle
 00459C53    push        eax
 00459C54    call        KERNEL32.WaitForSingleObject
 00459C59    mov         eax,[005E0CC8];HintThread:THandle
 00459C5E    push        eax
 00459C5F    call        KERNEL32.CloseHandle
 00459C64    xor         eax,eax
 00459C66    mov         [005E0CC8],eax;HintThread:THandle
 00459C6B    ret
*}
end;

//00459C6C
function GetAnimation:Boolean;
begin
{*
 00459C6C    add         esp,0FFFFFFF8
 00459C6F    mov         dword ptr [esp],8
 00459C76    push        0
 00459C78    lea         eax,[esp+4]
 00459C7C    push        eax
 00459C7D    push        8
 00459C7F    push        48
 00459C81    call        user32.SystemParametersInfoA
 00459C86    test        eax,eax
>00459C88    je          00459C95
 00459C8A    cmp         dword ptr [esp+4],0
 00459C8F    setne       al
 00459C92    pop         ecx
 00459C93    pop         edx
 00459C94    ret
 00459C95    xor         eax,eax
 00459C97    pop         ecx
 00459C98    pop         edx
 00459C99    ret
*}
end;

//00459C9C
procedure SetAnimation(Value:Boolean);
begin
{*
 00459C9C    add         esp,0FFFFFFF8
 00459C9F    mov         dword ptr [esp],8
 00459CA6    cmp         al,1
 00459CA8    cmc
 00459CA9    sbb         eax,eax
 00459CAB    mov         dword ptr [esp+4],eax
 00459CAF    push        0
 00459CB1    lea         eax,[esp+4]
 00459CB5    push        eax
 00459CB6    push        8
 00459CB8    push        49
 00459CBA    call        user32.SystemParametersInfoA
 00459CBF    pop         ecx
 00459CC0    pop         edx
 00459CC1    ret
*}
end;

//00459CC4
procedure ShowWinNoAnimate(Handle:HWND; CmdShow:Integer);
begin
{*
 00459CC4    push        ebx
 00459CC5    push        esi
 00459CC6    push        edi
 00459CC7    mov         edi,edx
 00459CC9    mov         esi,eax
 00459CCB    call        GetAnimation
 00459CD0    mov         ebx,eax
 00459CD2    test        bl,bl
>00459CD4    je          00459CDD
 00459CD6    xor         eax,eax
 00459CD8    call        SetAnimation
 00459CDD    push        edi
 00459CDE    push        esi
 00459CDF    call        user32.ShowWindow
 00459CE4    test        bl,bl
>00459CE6    je          00459CEF
 00459CE8    mov         al,1
 00459CEA    call        SetAnimation
 00459CEF    pop         edi
 00459CF0    pop         esi
 00459CF1    pop         ebx
 00459CF2    ret
*}
end;

//00459CF4
constructor _NF__A5A;
begin
{*
 00459CF4    push        esp
 00459CF5    inc         ecx
>00459CF6    jo          00459D68
 00459CF8    ins         byte ptr [edi],dl
 00459CF9    imul        esp,dword ptr [ebx+61],6E6F6974
 00459D00    add         byte ptr [eax],al
 00459D02    add         byte ptr [eax],al
 00459D04    push        ebp
 00459D05    mov         ebp,esp
 00459D07    add         esp,0FFFFFEFC
 00459D0D    push        ebx
 00459D0E    push        esi
 00459D0F    test        dl,dl
>00459D11    je          00459D1B
 00459D13    add         esp,0FFFFFFF0
 00459D16    call        @ClassCreate
 00459D1B    mov         byte ptr [ebp-1],dl
 00459D1E    mov         ebx,eax
 00459D20    xor         edx,edx
 00459D22    mov         eax,ebx
 00459D24    call        TComponent.Create
 00459D29    mov         eax,[005AE484]
 00459D2E    cmp         word ptr [eax+2],0
>00459D33    jne         00459D43
 00459D35    mov         eax,[005AE484]
 00459D3A    mov         dword ptr [eax+4],ebx
 00459D3D    mov         dword ptr [eax],45B484;TApplication.HandleException
 00459D43    mov         eax,[005AE5CC]
 00459D48    cmp         word ptr [eax+2],0
>00459D4D    jne         00459D5D
 00459D4F    mov         eax,[005AE5CC]
 00459D54    mov         dword ptr [eax+4],ebx
 00459D57    mov         dword ptr [eax],45B67C;TApplication.ShowException
 00459D5D    mov         byte ptr [ebx+34],0
 00459D61    mov         dl,1
 00459D63    mov         eax,[00417CEC];TList
 00459D68    call        TObject.Create
 00459D6D    mov         dword ptr [ebx+90],eax
 00459D73    mov         dl,1
 00459D75    mov         eax,[00417CEC];TList
 00459D7A    call        TObject.Create
 00459D7F    mov         dword ptr [ebx+0A8],eax
 00459D85    xor         eax,eax
 00459D87    mov         dword ptr [ebx+60],eax
 00459D8A    xor         eax,eax
 00459D8C    mov         dword ptr [ebx+84],eax
 00459D92    mov         dword ptr [ebx+5C],0FF000018
 00459D99    mov         dword ptr [ebx+78],1F4
 00459DA0    mov         byte ptr [ebx+7C],1
 00459DA4    xor         eax,eax
 00459DA6    mov         dword ptr [ebx+80],eax
 00459DAC    mov         dword ptr [ebx+74],9C4
 00459DB3    mov         byte ptr [ebx+88],0
 00459DBA    mov         byte ptr [ebx+9D],1
 00459DC1    mov         byte ptr [ebx+0B4],1
 00459DC8    mov         dl,1
 00459DCA    mov         eax,[00424FFC];TIcon
 00459DCF    call        TIcon.Create
 00459DD4    mov         esi,eax
 00459DD6    mov         dword ptr [ebx+98],esi
 00459DDC    push        459EE4
 00459DE1    mov         eax,[005AE308];MainInstance:Cardinal
 00459DE6    mov         eax,dword ptr [eax]
 00459DE8    push        eax
 00459DE9    call        user32.LoadIconA
 00459DEE    mov         edx,eax
 00459DF0    mov         eax,esi
 00459DF2    call        TIcon.SetHandle
 00459DF7    mov         eax,dword ptr [ebx+98]
 00459DFD    mov         dword ptr [eax+14],ebx
 00459E00    mov         dword ptr [eax+10],45BC1C;TApplication.IconChanged
 00459E07    push        100
 00459E0C    lea         eax,[ebp-101]
 00459E12    push        eax
 00459E13    mov         eax,[005AE308];MainInstance:Cardinal
 00459E18    mov         eax,dword ptr [eax]
 00459E1A    push        eax
 00459E1B    call        KERNEL32.GetModuleFileNameA
 00459E20    lea         eax,[ebp-101]
 00459E26    push        eax
 00459E27    lea         eax,[ebp-101]
 00459E2D    push        eax
 00459E2E    call        user32.OemToCharA
 00459E33    lea         eax,[ebp-101]
 00459E39    mov         dl,5C
 00459E3B    call        AnsiStrRScan
 00459E40    test        eax,eax
>00459E42    je          00459E52
 00459E44    lea         edx,[eax+1]
 00459E47    lea         eax,[ebp-101]
 00459E4D    call        StrCopy
 00459E52    lea         eax,[ebp-101]
 00459E58    mov         dl,2E
 00459E5A    call        AnsiStrScan
 00459E5F    test        eax,eax
>00459E61    je          00459E66
 00459E63    mov         byte ptr [eax],0
 00459E66    lea         eax,[ebp-101]
 00459E6C    inc         eax
 00459E6D    push        eax
 00459E6E    call        user32.CharLowerA
 00459E73    lea         eax,[ebx+8C]
 00459E79    lea         edx,[ebp-101]
 00459E7F    mov         ecx,100
 00459E84    call        @LStrFromArray
 00459E89    mov         eax,[005AE110];^IsLibrary:Boolean
 00459E8E    cmp         byte ptr [eax],0
>00459E91    jne         00459E9A
 00459E93    mov         eax,ebx
 00459E95    call        TApplication.CreateHandle
 00459E9A    mov         byte ptr [ebx+59],1
 00459E9E    mov         byte ptr [ebx+5A],1
 00459EA2    mov         byte ptr [ebx+5B],1
 00459EA6    mov         byte ptr [ebx+9E],1
 00459EAD    xor         eax,eax
 00459EAF    mov         dword ptr [ebx+0A0],eax
 00459EB5    mov         eax,ebx
 00459EB7    call        TApplication.ValidateHelpSystem
 00459EBC    mov         eax,ebx
 00459EBE    call        TApplication.HookSynchronizeWakeup
 00459EC3    mov         eax,ebx
 00459EC5    cmp         byte ptr [ebp-1],0
>00459EC9    je          00459EDA
 00459ECB    call        @AfterConstruction
 00459ED0    pop         dword ptr fs:[0]
 00459ED7    add         esp,0C
 00459EDA    mov         eax,ebx
 00459EDC    pop         esi
 00459EDD    pop         ebx
 00459EDE    mov         esp,ebp
 00459EE0    pop         ebp
 00459EE1    ret
*}
end;

//00459D04
constructor TApplication.Create(AOwner:TComponent);
begin
{*
 00459D04    push        ebp
 00459D05    mov         ebp,esp
 00459D07    add         esp,0FFFFFEFC
 00459D0D    push        ebx
 00459D0E    push        esi
 00459D0F    test        dl,dl
>00459D11    je          00459D1B
 00459D13    add         esp,0FFFFFFF0
 00459D16    call        @ClassCreate
 00459D1B    mov         byte ptr [ebp-1],dl
 00459D1E    mov         ebx,eax
 00459D20    xor         edx,edx
 00459D22    mov         eax,ebx
 00459D24    call        TComponent.Create
 00459D29    mov         eax,[005AE484]
 00459D2E    cmp         word ptr [eax+2],0
>00459D33    jne         00459D43
 00459D35    mov         eax,[005AE484]
 00459D3A    mov         dword ptr [eax+4],ebx
 00459D3D    mov         dword ptr [eax],45B484;TApplication.HandleException
 00459D43    mov         eax,[005AE5CC]
 00459D48    cmp         word ptr [eax+2],0
>00459D4D    jne         00459D5D
 00459D4F    mov         eax,[005AE5CC]
 00459D54    mov         dword ptr [eax+4],ebx
 00459D57    mov         dword ptr [eax],45B67C;TApplication.ShowException
 00459D5D    mov         byte ptr [ebx+34],0
 00459D61    mov         dl,1
 00459D63    mov         eax,[00417CEC];TList
 00459D68    call        TObject.Create
 00459D6D    mov         dword ptr [ebx+90],eax
 00459D73    mov         dl,1
 00459D75    mov         eax,[00417CEC];TList
 00459D7A    call        TObject.Create
 00459D7F    mov         dword ptr [ebx+0A8],eax
 00459D85    xor         eax,eax
 00459D87    mov         dword ptr [ebx+60],eax
 00459D8A    xor         eax,eax
 00459D8C    mov         dword ptr [ebx+84],eax
 00459D92    mov         dword ptr [ebx+5C],0FF000018
 00459D99    mov         dword ptr [ebx+78],1F4
 00459DA0    mov         byte ptr [ebx+7C],1
 00459DA4    xor         eax,eax
 00459DA6    mov         dword ptr [ebx+80],eax
 00459DAC    mov         dword ptr [ebx+74],9C4
 00459DB3    mov         byte ptr [ebx+88],0
 00459DBA    mov         byte ptr [ebx+9D],1
 00459DC1    mov         byte ptr [ebx+0B4],1
 00459DC8    mov         dl,1
 00459DCA    mov         eax,[00424FFC];TIcon
 00459DCF    call        TIcon.Create
 00459DD4    mov         esi,eax
 00459DD6    mov         dword ptr [ebx+98],esi
 00459DDC    push        459EE4
 00459DE1    mov         eax,[005AE308];MainInstance:Cardinal
 00459DE6    mov         eax,dword ptr [eax]
 00459DE8    push        eax
 00459DE9    call        user32.LoadIconA
 00459DEE    mov         edx,eax
 00459DF0    mov         eax,esi
 00459DF2    call        TIcon.SetHandle
 00459DF7    mov         eax,dword ptr [ebx+98]
 00459DFD    mov         dword ptr [eax+14],ebx
 00459E00    mov         dword ptr [eax+10],45BC1C;TApplication.IconChanged
 00459E07    push        100
 00459E0C    lea         eax,[ebp-101]
 00459E12    push        eax
 00459E13    mov         eax,[005AE308];MainInstance:Cardinal
 00459E18    mov         eax,dword ptr [eax]
 00459E1A    push        eax
 00459E1B    call        KERNEL32.GetModuleFileNameA
 00459E20    lea         eax,[ebp-101]
 00459E26    push        eax
 00459E27    lea         eax,[ebp-101]
 00459E2D    push        eax
 00459E2E    call        user32.OemToCharA
 00459E33    lea         eax,[ebp-101]
 00459E39    mov         dl,5C
 00459E3B    call        AnsiStrRScan
 00459E40    test        eax,eax
>00459E42    je          00459E52
 00459E44    lea         edx,[eax+1]
 00459E47    lea         eax,[ebp-101]
 00459E4D    call        StrCopy
 00459E52    lea         eax,[ebp-101]
 00459E58    mov         dl,2E
 00459E5A    call        AnsiStrScan
 00459E5F    test        eax,eax
>00459E61    je          00459E66
 00459E63    mov         byte ptr [eax],0
 00459E66    lea         eax,[ebp-101]
 00459E6C    inc         eax
 00459E6D    push        eax
 00459E6E    call        user32.CharLowerA
 00459E73    lea         eax,[ebx+8C]
 00459E79    lea         edx,[ebp-101]
 00459E7F    mov         ecx,100
 00459E84    call        @LStrFromArray
 00459E89    mov         eax,[005AE110];^IsLibrary:Boolean
 00459E8E    cmp         byte ptr [eax],0
>00459E91    jne         00459E9A
 00459E93    mov         eax,ebx
 00459E95    call        TApplication.CreateHandle
 00459E9A    mov         byte ptr [ebx+59],1
 00459E9E    mov         byte ptr [ebx+5A],1
 00459EA2    mov         byte ptr [ebx+5B],1
 00459EA6    mov         byte ptr [ebx+9E],1
 00459EAD    xor         eax,eax
 00459EAF    mov         dword ptr [ebx+0A0],eax
 00459EB5    mov         eax,ebx
 00459EB7    call        TApplication.ValidateHelpSystem
 00459EBC    mov         eax,ebx
 00459EBE    call        TApplication.HookSynchronizeWakeup
 00459EC3    mov         eax,ebx
 00459EC5    cmp         byte ptr [ebp-1],0
>00459EC9    je          00459EDA
 00459ECB    call        @AfterConstruction
 00459ED0    pop         dword ptr fs:[0]
 00459ED7    add         esp,0C
 00459EDA    mov         eax,ebx
 00459EDC    pop         esi
 00459EDD    pop         ebx
 00459EDE    mov         esp,ebp
 00459EE0    pop         ebp
 00459EE1    ret
*}
end;

//00459EF0
destructor TApplication.Destroy;
begin
{*
 00459EF0    push        ebx
 00459EF1    push        esi
 00459EF2    add         esp,0FFFFFFF0
 00459EF5    call        @BeforeDestruction
 00459EFA    mov         ebx,edx
 00459EFC    mov         esi,eax
 00459EFE    mov         eax,esi
 00459F00    call        TApplication.UnhookSynchronizeWakeup
 00459F05    mov         dword ptr [esp+4],esi
 00459F09    mov         dword ptr [esp],45B484;TApplication.HandleException
 00459F10    mov         eax,[005AE484]
 00459F15    mov         eax,dword ptr [eax]
 00459F17    cmp         eax,dword ptr [esp]
>00459F1A    jne         00459F28
 00459F1C    mov         eax,[005AE484]
 00459F21    xor         edx,edx
 00459F23    mov         dword ptr [eax],edx
 00459F25    mov         dword ptr [eax+4],edx
 00459F28    mov         dword ptr [esp+0C],esi
 00459F2C    mov         dword ptr [esp+8],45B67C;TApplication.ShowException
 00459F34    mov         eax,[005AE5CC]
 00459F39    mov         eax,dword ptr [eax]
 00459F3B    cmp         eax,dword ptr [esp+8]
>00459F3F    jne         00459F4D
 00459F41    mov         eax,[005AE5CC]
 00459F46    xor         edx,edx
 00459F48    mov         dword ptr [eax],edx
 00459F4A    mov         dword ptr [eax+4],edx
 00459F4D    mov         eax,dword ptr [esi+0A0]
 00459F53    test        eax,eax
>00459F55    je          00459F5D
 00459F57    push        eax
 00459F58    call        KERNEL32.FreeLibrary
 00459F5D    mov         byte ptr [esi+9D],0
 00459F64    mov         eax,esi
 00459F66    call        TApplication.CancelHint
 00459F6B    xor         edx,edx
 00459F6D    mov         eax,esi
 00459F6F    call        TApplication.SetShowHint
 00459F74    mov         edx,ebx
 00459F76    and         dl,0FC
 00459F79    mov         eax,esi
 00459F7B    call        TComponent.Destroy
 00459F80    push        esi
 00459F81    push        45A440;TApplication.CheckIniChange:Boolean
 00459F86    mov         eax,esi
 00459F88    call        TApplication.UnhookMainWindow
 00459F8D    mov         eax,dword ptr [esi+30]
 00459F90    test        eax,eax
>00459F92    je          00459FC0
 00459F94    cmp         byte ptr [esi+0A4],0
>00459F9B    je          00459FC0
 00459F9D    mov         edx,dword ptr ds:[5AE3F0];^NewStyleControls:Boolean
 00459FA3    cmp         byte ptr [edx],0
>00459FA6    je          00459FB7
 00459FA8    push        0
 00459FAA    push        1
 00459FAC    push        80
 00459FB1    push        eax
 00459FB2    call        user32.SendMessageA
 00459FB7    mov         eax,dword ptr [esi+30]
 00459FBA    push        eax
 00459FBB    call        user32.DestroyWindow
 00459FC0    cmp         dword ptr [esi+4C],0
>00459FC4    je          00459FCE
 00459FC6    lea         eax,[esi+4C]
 00459FC9    call        @IntfClear
 00459FCE    mov         eax,dword ptr [esi+40]
 00459FD1    test        eax,eax
>00459FD3    je          00459FDA
 00459FD5    call        FreeObjectInstance
 00459FDA    mov         eax,dword ptr [esi+0A8]
 00459FE0    call        TObject.Free
 00459FE5    mov         eax,dword ptr [esi+90]
 00459FEB    call        TObject.Free
 00459FF0    mov         eax,dword ptr [esi+98]
 00459FF6    call        TObject.Free
 00459FFB    test        bl,bl
>00459FFD    jle         0045A006
 00459FFF    mov         eax,esi
 0045A001    call        @ClassDestroy
 0045A006    add         esp,10
 0045A009    pop         esi
 0045A00A    pop         ebx
 0045A00B    ret
*}
end;

//0045A00C
procedure TApplication.CreateHandle;
begin
{*
 0045A00C    push        ebp
 0045A00D    mov         ebp,esp
 0045A00F    add         esp,0FFFFFFD4
 0045A012    push        ebx
 0045A013    xor         edx,edx
 0045A015    mov         dword ptr [ebp-2C],edx
 0045A018    mov         ebx,eax
 0045A01A    xor         eax,eax
 0045A01C    push        ebp
 0045A01D    push        45A1AD
 0045A022    push        dword ptr fs:[eax]
 0045A025    mov         dword ptr fs:[eax],esp
 0045A028    cmp         byte ptr [ebx+0A4],0
>0045A02F    jne         0045A197
 0045A035    mov         eax,[005AE640];IsConsole:Boolean
 0045A03A    cmp         byte ptr [eax],0
>0045A03D    jne         0045A197
 0045A043    push        ebx
 0045A044    push        45A58C;TApplication.WndProc
 0045A049    call        MakeObjectInstance
 0045A04E    mov         dword ptr [ebx+40],eax
 0045A051    mov         eax,406FDC;user32.DefWindowProcA:Longint
 0045A056    mov         [005ACE9C],eax;^user32.DefWindowProcA:Longint
 0045A05B    lea         eax,[ebp-28]
 0045A05E    push        eax
 0045A05F    mov         eax,[005ACEBC];^_NF__A5A
 0045A064    push        eax
 0045A065    mov         eax,[005AF664];gvar_005AF664
 0045A06A    push        eax
 0045A06B    call        user32.GetClassInfoA
 0045A070    test        eax,eax
>0045A072    jne         0045A0AE
 0045A074    mov         eax,[005AF664];gvar_005AF664
 0045A079    mov         [005ACEA8],eax
 0045A07E    push        5ACE98
 0045A083    call        user32.RegisterClassA
 0045A088    test        ax,ax
>0045A08B    jne         0045A0AE
 0045A08D    lea         edx,[ebp-2C]
 0045A090    mov         eax,[005AE204];^SWindowClass:TResStringRec
 0045A095    call        LoadStr
 0045A09A    mov         ecx,dword ptr [ebp-2C]
 0045A09D    mov         dl,1
 0045A09F    mov         eax,[00417C30];EOutOfResources
 0045A0A4    call        Exception.Create
 0045A0A9    call        @RaiseExcept
 0045A0AE    push        0
 0045A0B0    mov         eax,[005AE32C]
 0045A0B5    mov         eax,dword ptr [eax]
 0045A0B7    call        eax
 0045A0B9    sar         eax,1
>0045A0BB    jns         0045A0C0
 0045A0BD    adc         eax,0
 0045A0C0    push        eax
 0045A0C1    push        1
 0045A0C3    mov         eax,[005AE32C]
 0045A0C8    mov         eax,dword ptr [eax]
 0045A0CA    call        eax
 0045A0CC    sar         eax,1
>0045A0CE    jns         0045A0D3
 0045A0D0    adc         eax,0
 0045A0D3    push        eax
 0045A0D4    push        0
 0045A0D6    push        0
 0045A0D8    push        0
 0045A0DA    push        0
 0045A0DC    mov         eax,[005AF664];gvar_005AF664
 0045A0E1    push        eax
 0045A0E2    push        0
 0045A0E4    mov         eax,dword ptr [ebx+8C]
 0045A0EA    call        @LStrToPChar
 0045A0EF    mov         edx,eax
 0045A0F1    mov         ecx,84CA0000
 0045A0F6    mov         eax,[005ACEBC];^_NF__A5A
 0045A0FB    call        CreateWindow
 0045A100    mov         dword ptr [ebx+30],eax
 0045A103    lea         eax,[ebx+8C]
 0045A109    call        @LStrClr
 0045A10E    mov         byte ptr [ebx+0A4],1
 0045A115    mov         eax,dword ptr [ebx+40]
 0045A118    push        eax
 0045A119    push        0FC
 0045A11B    mov         eax,dword ptr [ebx+30]
 0045A11E    push        eax
 0045A11F    call        user32.SetWindowLongA
 0045A124    mov         eax,[005AE3F0];^NewStyleControls:Boolean
 0045A129    cmp         byte ptr [eax],0
>0045A12C    je          0045A159
 0045A12E    mov         eax,ebx
 0045A130    call        TApplication.GetIconHandle
 0045A135    push        eax
 0045A136    push        1
 0045A138    push        80
 0045A13D    mov         eax,dword ptr [ebx+30]
 0045A140    push        eax
 0045A141    call        user32.SendMessageA
 0045A146    mov         eax,ebx
 0045A148    call        TApplication.GetIconHandle
 0045A14D    push        eax
 0045A14E    push        0F2
 0045A150    mov         eax,dword ptr [ebx+30]
 0045A153    push        eax
 0045A154    call        user32.SetClassLongA
 0045A159    push        0
 0045A15B    mov         eax,dword ptr [ebx+30]
 0045A15E    push        eax
 0045A15F    call        user32.GetSystemMenu
 0045A164    mov         ebx,eax
 0045A166    push        0
 0045A168    push        0F030
 0045A16D    push        ebx
 0045A16E    call        user32.DeleteMenu
 0045A173    push        0
 0045A175    push        0F000
 0045A17A    push        ebx
 0045A17B    call        user32.DeleteMenu
 0045A180    mov         eax,[005AE3F0];^NewStyleControls:Boolean
 0045A185    cmp         byte ptr [eax],0
>0045A188    je          0045A197
 0045A18A    push        0
 0045A18C    push        0F010
 0045A191    push        ebx
 0045A192    call        user32.DeleteMenu
 0045A197    xor         eax,eax
 0045A199    pop         edx
 0045A19A    pop         ecx
 0045A19B    pop         ecx
 0045A19C    mov         dword ptr fs:[eax],edx
 0045A19F    push        45A1B4
 0045A1A4    lea         eax,[ebp-2C]
 0045A1A7    call        @LStrClr
 0045A1AC    ret
>0045A1AD    jmp         @HandleFinally
>0045A1B2    jmp         0045A1A4
 0045A1B4    pop         ebx
 0045A1B5    mov         esp,ebp
 0045A1B7    pop         ebp
 0045A1B8    ret
*}
end;

//0045A1BC
procedure TApplication.ControlDestroyed(Control:TControl);
begin
{*
 0045A1BC    push        ebx
 0045A1BD    push        esi
 0045A1BE    mov         ecx,5E0CB0;Screen:TScreen
 0045A1C3    cmp         edx,dword ptr [eax+44]
>0045A1C6    jne         0045A1CD
 0045A1C8    xor         ebx,ebx
 0045A1CA    mov         dword ptr [eax+44],ebx
 0045A1CD    cmp         edx,dword ptr [eax+48]
>0045A1D0    jne         0045A1D7
 0045A1D2    xor         ebx,ebx
 0045A1D4    mov         dword ptr [eax+48],ebx
 0045A1D7    mov         ebx,dword ptr [ecx]
 0045A1D9    cmp         edx,dword ptr [ebx+64]
>0045A1DC    jne         0045A1E5
 0045A1DE    mov         ebx,dword ptr [ecx]
 0045A1E0    xor         esi,esi
 0045A1E2    mov         dword ptr [ebx+64],esi
 0045A1E5    mov         ebx,dword ptr [ecx]
 0045A1E7    cmp         edx,dword ptr [ebx+68]
>0045A1EA    jne         0045A1FA
 0045A1EC    mov         ebx,dword ptr [ecx]
 0045A1EE    xor         esi,esi
 0045A1F0    mov         dword ptr [ebx+68],esi
 0045A1F3    mov         ebx,dword ptr [ecx]
 0045A1F5    xor         esi,esi
 0045A1F7    mov         dword ptr [ebx+6C],esi
 0045A1FA    mov         ebx,dword ptr [ecx]
 0045A1FC    cmp         edx,dword ptr [ebx+78]
>0045A1FF    jne         0045A208
 0045A201    mov         ebx,dword ptr [ecx]
 0045A203    xor         esi,esi
 0045A205    mov         dword ptr [ebx+78],esi
 0045A208    cmp         edx,dword ptr [eax+60]
>0045A20B    jne         0045A212
 0045A20D    xor         edx,edx
 0045A20F    mov         dword ptr [eax+60],edx
 0045A212    mov         eax,dword ptr [ecx]
 0045A214    call        TScreen.UpdateLastActive
 0045A219    pop         esi
 0045A21A    pop         ebx
 0045A21B    ret
*}
end;

//0045A21C
function GetTopMostWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;
begin
{*
 0045A21C    push        ebp
 0045A21D    mov         ebp,esp
 0045A21F    push        ebx
 0045A220    push        esi
 0045A221    push        edi
 0045A222    mov         ebx,dword ptr [ebp+8]
 0045A225    or          esi,0FFFFFFFF
 0045A228    push        4
 0045A22A    push        ebx
 0045A22B    call        user32.GetWindow
 0045A230    mov         edx,dword ptr ds:[5E0CAC];Application:TApplication
 0045A236    cmp         eax,dword ptr [edx+30]
>0045A239    jne         0045A282
 0045A23B    push        0EC
 0045A23D    push        ebx
 0045A23E    call        user32.GetWindowLongA
 0045A243    test        al,8
>0045A245    je          0045A27B
 0045A247    mov         eax,[005E0CAC];Application:TApplication
 0045A24C    mov         edi,dword ptr [eax+44]
 0045A24F    test        edi,edi
>0045A251    je          0045A267
 0045A253    mov         eax,dword ptr [ebp+0C]
 0045A256    cmp         byte ptr [eax+4],0
>0045A25A    jne         0045A267
 0045A25C    mov         eax,edi
 0045A25E    call        TWinControl.GetHandle
 0045A263    cmp         ebx,eax
>0045A265    je          0045A27B
 0045A267    mov         eax,[005E0CAC];Application:TApplication
 0045A26C    mov         eax,dword ptr [eax+90]
 0045A272    mov         edx,ebx
 0045A274    call        TList.Add
>0045A279    jmp         0045A282
 0045A27B    mov         eax,dword ptr [ebp+0C]
 0045A27E    mov         dword ptr [eax],ebx
 0045A280    xor         esi,esi
 0045A282    mov         eax,esi
 0045A284    pop         edi
 0045A285    pop         esi
 0045A286    pop         ebx
 0045A287    pop         ebp
 0045A288    ret         8
*}
end;

//0045A28C
procedure TApplication.DoNormalizeTopMosts(IncludeMain:Boolean);
begin
{*
 0045A28C    push        ebx
 0045A28D    push        esi
 0045A28E    add         esp,0FFFFFFF8
 0045A291    mov         ebx,eax
 0045A293    mov         eax,[005E0CAC];Application:TApplication
 0045A298    cmp         dword ptr [eax+30],0
>0045A29C    je          0045A336
 0045A2A2    cmp         dword ptr [ebx+94],0
>0045A2A9    jne         0045A330
 0045A2AF    mov         eax,dword ptr [ebx+30]
 0045A2B2    mov         dword ptr [esp],eax
 0045A2B5    mov         byte ptr [esp+4],dl
 0045A2B9    mov         eax,esp
 0045A2BB    push        eax
 0045A2BC    push        45A21C;GetTopMostWindows:BOOL
 0045A2C1    call        user32.EnumWindows
 0045A2C6    mov         eax,dword ptr [ebx+90]
 0045A2CC    cmp         dword ptr [eax+8],0
>0045A2D0    je          0045A330
 0045A2D2    push        3
 0045A2D4    mov         eax,dword ptr [esp+4]
 0045A2D8    push        eax
 0045A2D9    call        user32.GetWindow
 0045A2DE    mov         esi,eax
 0045A2E0    mov         dword ptr [esp],esi
 0045A2E3    push        0EC
 0045A2E5    push        esi
 0045A2E6    call        user32.GetWindowLongA
 0045A2EB    test        al,8
>0045A2ED    je          0045A2F6
 0045A2EF    mov         dword ptr [esp],0FFFFFFFE
 0045A2F6    mov         eax,dword ptr [ebx+90]
 0045A2FC    mov         esi,dword ptr [eax+8]
 0045A2FF    dec         esi
 0045A300    cmp         esi,0
>0045A303    jl          0045A330
 0045A305    push        213
 0045A30A    push        0
 0045A30C    push        0
 0045A30E    push        0
 0045A310    push        0
 0045A312    mov         eax,dword ptr [esp+14]
 0045A316    push        eax
 0045A317    mov         edx,esi
 0045A319    mov         eax,dword ptr [ebx+90]
 0045A31F    call        TList.Get
 0045A324    push        eax
 0045A325    call        user32.SetWindowPos
 0045A32A    dec         esi
 0045A32B    cmp         esi,0FFFFFFFF
>0045A32E    jne         0045A305
 0045A330    inc         dword ptr [ebx+94]
 0045A336    pop         ecx
 0045A337    pop         edx
 0045A338    pop         esi
 0045A339    pop         ebx
 0045A33A    ret
*}
end;

//0045A33C
procedure TApplication.ModalStarted;
begin
{*
 0045A33C    push        ebx
 0045A33D    inc         dword ptr [eax+0B8]
 0045A343    cmp         dword ptr [eax+0B8],1
>0045A34A    jne         0045A366
 0045A34C    cmp         word ptr [eax+0E2],0
>0045A354    je          0045A366
 0045A356    mov         ebx,eax
 0045A358    mov         edx,eax
 0045A35A    mov         eax,dword ptr [ebx+0E4]
 0045A360    call        dword ptr [ebx+0E0]
 0045A366    pop         ebx
 0045A367    ret
*}
end;

//0045A368
procedure TApplication.ModalFinished;
begin
{*
 0045A368    push        ebx
 0045A369    dec         dword ptr [eax+0B8]
 0045A36F    cmp         dword ptr [eax+0B8],0
>0045A376    jne         0045A392
 0045A378    cmp         word ptr [eax+0EA],0
>0045A380    je          0045A392
 0045A382    mov         ebx,eax
 0045A384    mov         edx,eax
 0045A386    mov         eax,dword ptr [ebx+0EC]
 0045A38C    call        dword ptr [ebx+0E8]
 0045A392    pop         ebx
 0045A393    ret
*}
end;

//0045A394
procedure TApplication.NormalizeTopMosts;
begin
{*
 0045A394    xor         edx,edx
 0045A396    call        TApplication.DoNormalizeTopMosts
 0045A39B    ret
*}
end;

//0045A39C
procedure TApplication.NormalizeAllTopMosts;
begin
{*
 0045A39C    mov         dl,1
 0045A39E    call        TApplication.DoNormalizeTopMosts
 0045A3A3    ret
*}
end;

//0045A3A4
procedure TApplication.RestoreTopMosts;
begin
{*
 0045A3A4    push        ebx
 0045A3A5    push        esi
 0045A3A6    mov         ebx,eax
 0045A3A8    mov         eax,[005E0CAC];Application:TApplication
 0045A3AD    cmp         dword ptr [eax+30],0
>0045A3B1    je          0045A40D
 0045A3B3    cmp         dword ptr [ebx+94],0
>0045A3BA    jle         0045A40D
 0045A3BC    dec         dword ptr [ebx+94]
 0045A3C2    cmp         dword ptr [ebx+94],0
>0045A3C9    jne         0045A40D
 0045A3CB    mov         eax,dword ptr [ebx+90]
 0045A3D1    mov         esi,dword ptr [eax+8]
 0045A3D4    dec         esi
 0045A3D5    cmp         esi,0
>0045A3D8    jl          0045A402
 0045A3DA    push        213
 0045A3DF    push        0
 0045A3E1    push        0
 0045A3E3    push        0
 0045A3E5    push        0
 0045A3E7    push        0FF
 0045A3E9    mov         edx,esi
 0045A3EB    mov         eax,dword ptr [ebx+90]
 0045A3F1    call        TList.Get
 0045A3F6    push        eax
 0045A3F7    call        user32.SetWindowPos
 0045A3FC    dec         esi
 0045A3FD    cmp         esi,0FFFFFFFF
>0045A400    jne         0045A3DA
 0045A402    mov         eax,dword ptr [ebx+90]
 0045A408    mov         edx,dword ptr [eax]
 0045A40A    call        dword ptr [edx+8]
 0045A40D    pop         esi
 0045A40E    pop         ebx
 0045A40F    ret
*}
end;

//0045A410
function TApplication.UseRightToLeftReading:Boolean;
begin
{*
 0045A410    mov         edx,dword ptr ds:[5AE810];^SysLocale:TSysLocale
 0045A416    cmp         byte ptr [edx+0D],0
>0045A41A    je          0045A422
 0045A41C    cmp         byte ptr [eax+34],0
>0045A420    jne         0045A425
 0045A422    xor         eax,eax
 0045A424    ret
 0045A425    mov         al,1
 0045A427    ret
*}
end;

//0045A428
function TApplication.UseRightToLeftAlignment:Boolean;
begin
{*
 0045A428    mov         edx,dword ptr ds:[5AE810];^SysLocale:TSysLocale
 0045A42E    cmp         byte ptr [edx+0D],0
>0045A432    je          0045A43A
 0045A434    cmp         byte ptr [eax+34],1
>0045A438    je          0045A43D
 0045A43A    xor         eax,eax
 0045A43C    ret
 0045A43D    mov         al,1
 0045A43F    ret
*}
end;

//0045A440
function TApplication.CheckIniChange(var Message:TMessage):Boolean;
begin
{*
 0045A440    push        ebx
 0045A441    push        esi
 0045A442    push        edi
 0045A443    mov         edi,edx
 0045A445    mov         esi,eax
 0045A447    xor         ebx,ebx
 0045A449    mov         eax,dword ptr [edi]
 0045A44B    cmp         eax,dword ptr ds:[5E0CB8];RM_TaskbarCreated:DWORD
>0045A451    je          0045A458
 0045A453    cmp         eax,1A
>0045A456    jne         0045A491
 0045A458    cmp         byte ptr [esi+59],0
>0045A45C    je          0045A46D
 0045A45E    push        400
 0045A463    call        KERNEL32.SetThreadLocale
 0045A468    call        GetFormatSettings
 0045A46D    cmp         byte ptr [esi+5A],0
>0045A471    je          0045A47D
 0045A473    mov         eax,[005E0CB0];Screen:TScreen
 0045A478    call        TScreen.GetMetricSettings
 0045A47D    mov         eax,dword ptr [edi]
 0045A47F    cmp         eax,dword ptr ds:[5E0CB8];RM_TaskbarCreated:DWORD
>0045A485    jne         0045A491
 0045A487    mov         eax,[005E0CB0];Screen:TScreen
 0045A48C    call        TScreen.ResetFonts
 0045A491    mov         eax,ebx
 0045A493    pop         edi
 0045A494    pop         esi
 0045A495    pop         ebx
 0045A496    ret
*}
end;

//0045A498
procedure TApplication.SettingChange(var Message:TWMSettingChange);
begin
{*
 0045A498    push        ebp
 0045A499    mov         ebp,esp
 0045A49B    push        0
 0045A49D    push        ebx
 0045A49E    push        esi
 0045A49F    mov         esi,edx
 0045A4A1    mov         ebx,eax
 0045A4A3    xor         eax,eax
 0045A4A5    push        ebp
 0045A4A6    push        45A4F5
 0045A4AB    push        dword ptr fs:[eax]
 0045A4AE    mov         dword ptr fs:[eax],esp
 0045A4B1    cmp         word ptr [ebx+13A],0
>0045A4B9    je          0045A4DF
 0045A4BB    lea         eax,[ebp-4]
 0045A4BE    mov         edx,dword ptr [esi+8]
 0045A4C1    call        @LStrFromPChar
 0045A4C6    mov         eax,dword ptr [ebp-4]
 0045A4C9    push        eax
 0045A4CA    lea         eax,[esi+0C]
 0045A4CD    push        eax
 0045A4CE    mov         ecx,dword ptr [esi+4]
 0045A4D1    mov         edx,ebx
 0045A4D3    mov         eax,dword ptr [ebx+13C]
 0045A4D9    call        dword ptr [ebx+138]
 0045A4DF    xor         eax,eax
 0045A4E1    pop         edx
 0045A4E2    pop         ecx
 0045A4E3    pop         ecx
 0045A4E4    mov         dword ptr fs:[eax],edx
 0045A4E7    push        45A4FC
 0045A4EC    lea         eax,[ebp-4]
 0045A4EF    call        @LStrClr
 0045A4F4    ret
>0045A4F5    jmp         @HandleFinally
>0045A4FA    jmp         0045A4EC
 0045A4FC    pop         esi
 0045A4FD    pop         ebx
 0045A4FE    pop         ecx
 0045A4FF    pop         ebp
 0045A500    ret
*}
end;

//0045A504
procedure Default;
begin
{*
 0045A504    push        ebp
 0045A505    mov         ebp,esp
 0045A507    mov         eax,dword ptr [ebp+8]
 0045A50A    mov         eax,dword ptr [eax-8]
 0045A50D    mov         eax,dword ptr [eax+8]
 0045A510    push        eax
 0045A511    mov         eax,dword ptr [ebp+8]
 0045A514    mov         eax,dword ptr [eax-8]
 0045A517    mov         eax,dword ptr [eax+4]
 0045A51A    push        eax
 0045A51B    mov         eax,dword ptr [ebp+8]
 0045A51E    mov         eax,dword ptr [eax-8]
 0045A521    mov         eax,dword ptr [eax]
 0045A523    push        eax
 0045A524    mov         eax,dword ptr [ebp+8]
 0045A527    mov         eax,dword ptr [eax-4]
 0045A52A    mov         eax,dword ptr [eax+30]
 0045A52D    push        eax
 0045A52E    call        user32.DefWindowProcA
 0045A533    mov         edx,dword ptr [ebp+8]
 0045A536    mov         edx,dword ptr [edx-8]
 0045A539    mov         dword ptr [edx+0C],eax
 0045A53C    pop         ebp
 0045A53D    ret
*}
end;

//0045A540
procedure DrawAppIcon;
begin
{*
 0045A540    push        ebp
 0045A541    mov         ebp,esp
 0045A543    add         esp,0FFFFFFC0
 0045A546    push        ebx
 0045A547    lea         eax,[ebp-40]
 0045A54A    push        eax
 0045A54B    mov         eax,dword ptr [ebp+8]
 0045A54E    mov         eax,dword ptr [eax-4]
 0045A551    mov         eax,dword ptr [eax+30]
 0045A554    push        eax
 0045A555    call        user32.BeginPaint
 0045A55A    mov         ebx,eax
 0045A55C    mov         eax,dword ptr [ebp+8]
 0045A55F    mov         eax,dword ptr [eax-4]
 0045A562    call        TApplication.GetIconHandle
 0045A567    push        eax
 0045A568    push        0
 0045A56A    push        0
 0045A56C    push        ebx
 0045A56D    call        user32.DrawIcon
 0045A572    lea         eax,[ebp-40]
 0045A575    push        eax
 0045A576    mov         eax,dword ptr [ebp+8]
 0045A579    mov         eax,dword ptr [eax-4]
 0045A57C    mov         eax,dword ptr [eax+30]
 0045A57F    push        eax
 0045A580    call        user32.EndPaint
 0045A585    pop         ebx
 0045A586    mov         esp,ebp
 0045A588    pop         ebp
 0045A589    ret
*}
end;

//0045A58C
procedure TApplication.WndProc(var Message:TMessage);
begin
{*
 0045A58C    push        ebp
 0045A58D    mov         ebp,esp
 0045A58F    add         esp,0FFFFFFF8
 0045A592    push        ebx
 0045A593    push        esi
 0045A594    push        edi
 0045A595    mov         dword ptr [ebp-8],edx
 0045A598    mov         dword ptr [ebp-4],eax
 0045A59B    xor         edx,edx
 0045A59D    push        ebp
 0045A59E    push        45AC46
 0045A5A3    push        dword ptr fs:[edx]
 0045A5A6    mov         dword ptr fs:[edx],esp
 0045A5A9    mov         eax,dword ptr [ebp-8]
 0045A5AC    xor         edx,edx
 0045A5AE    mov         dword ptr [eax+0C],edx
 0045A5B1    mov         eax,dword ptr [ebp-4]
 0045A5B4    mov         eax,dword ptr [eax+0A8]
 0045A5BA    mov         ebx,dword ptr [eax+8]
 0045A5BD    dec         ebx
 0045A5BE    test        ebx,ebx
>0045A5C0    jl          0045A5F4
 0045A5C2    inc         ebx
 0045A5C3    xor         esi,esi
 0045A5C5    mov         eax,dword ptr [ebp-4]
 0045A5C8    mov         eax,dword ptr [eax+0A8]
 0045A5CE    mov         edx,esi
 0045A5D0    call        TList.Get
 0045A5D5    mov         edi,eax
 0045A5D7    mov         edx,dword ptr [ebp-8]
 0045A5DA    mov         eax,dword ptr [edi+4]
 0045A5DD    call        dword ptr [edi]
 0045A5DF    test        al,al
>0045A5E1    je          0045A5F0
 0045A5E3    xor         eax,eax
 0045A5E5    pop         edx
 0045A5E6    pop         ecx
 0045A5E7    pop         ecx
 0045A5E8    mov         dword ptr fs:[eax],edx
>0045A5EB    jmp         0045AC5B
 0045A5F0    inc         esi
 0045A5F1    dec         ebx
>0045A5F2    jne         0045A5C5
 0045A5F4    mov         edx,dword ptr [ebp-8]
 0045A5F7    mov         eax,dword ptr [ebp-4]
 0045A5FA    call        TApplication.CheckIniChange
 0045A5FF    mov         ebx,dword ptr [ebp-8]
 0045A602    mov         ebx,dword ptr [ebx]
 0045A604    mov         eax,ebx
 0045A606    cmp         eax,53
>0045A609    jg          0045A6BD
>0045A60F    je          0045AB5B
 0045A615    cmp         eax,16
>0045A618    jg          0045A684
>0045A61A    je          0045A920
 0045A620    cmp         eax,14
>0045A623    ja          0045AC35
 0045A629    jmp         dword ptr [eax*4+45A630]
 0045A629    dd          0045AC2C
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045A7FE
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045A886
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045A7AE
 0045A629    dd          0045A796
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045AC35
 0045A629    dd          0045A7D6
 0045A684    cmp         eax,1D
>0045A687    jg          0045A6A6
>0045A689    je          0045ABFF
 0045A68F    sub         eax,1A
>0045A692    je          0045ABD9
 0045A698    sub         eax,2
>0045A69B    je          0045A81F
>0045A6A1    jmp         0045AC35
 0045A6A6    sub         eax,37
>0045A6A9    je          0045A7EB
 0045A6AF    sub         eax,13
>0045A6B2    je          0045A93C
>0045A6B8    jmp         0045AC35
 0045A6BD    cmp         eax,0B017
>0045A6C2    jg          0045A713
>0045A6C4    je          0045AA33
 0045A6CA    cmp         eax,0B000
>0045A6CF    jg          0045A6FA
>0045A6D1    je          0045AACC
 0045A6D7    sub         eax,112
>0045A6DC    je          0045A755
 0045A6DE    add         eax,0FFFFFFE0
 0045A6E1    sub         eax,7
>0045A6E4    jb          0045A8F4
 0045A6EA    sub         eax,1E1
>0045A6EF    je          0045AC12
>0045A6F5    jmp         0045AC35
 0045A6FA    sub         eax,0B001
>0045A6FF    je          0045AAF4
 0045A705    sub         eax,15
>0045A708    je          0045AA11
>0045A70E    jmp         0045AC35
 0045A713    cmp         eax,0B020
>0045A718    jg          0045A739
>0045A71A    je          0045AB75
 0045A720    sub         eax,0B01A
>0045A725    je          0045AB1C
 0045A72B    sub         eax,5
>0045A72E    je          0045AB5B
>0045A734    jmp         0045AC35
 0045A739    sub         eax,0B031
>0045A73E    je          0045ABAE
 0045A744    add         eax,0FFFFFFF2
 0045A747    sub         eax,2
>0045A74A    jb          0045A9F0
>0045A750    jmp         0045AC35
 0045A755    mov         eax,dword ptr [ebp-8]
 0045A758    mov         eax,dword ptr [eax+4]
 0045A75B    and         eax,0FFF0
 0045A760    sub         eax,0F020
>0045A765    je          0045A770
 0045A767    sub         eax,100
>0045A76C    je          0045A77D
>0045A76E    jmp         0045A78A
 0045A770    mov         eax,dword ptr [ebp-4]
 0045A773    call        TApplication.Minimize
>0045A778    jmp         0045AC3C
 0045A77D    mov         eax,dword ptr [ebp-4]
 0045A780    call        TApplication.Restore
>0045A785    jmp         0045AC3C
 0045A78A    push        ebp
 0045A78B    call        Default
 0045A790    pop         ecx
>0045A791    jmp         0045AC3C
 0045A796    mov         eax,dword ptr [ebp-4]
 0045A799    mov         eax,dword ptr [eax+44]
 0045A79C    test        eax,eax
>0045A79E    je          0045AC3C
 0045A7A4    call        TCustomForm.Close
>0045A7A9    jmp         0045AC3C
 0045A7AE    mov         eax,dword ptr [ebp-4]
 0045A7B1    mov         eax,dword ptr [eax+30]
 0045A7B4    push        eax
 0045A7B5    call        user32.IsIconic
 0045A7BA    test        eax,eax
>0045A7BC    je          0045A7CA
 0045A7BE    push        ebp
 0045A7BF    call        DrawAppIcon
 0045A7C4    pop         ecx
>0045A7C5    jmp         0045AC3C
 0045A7CA    push        ebp
 0045A7CB    call        Default
 0045A7D0    pop         ecx
>0045A7D1    jmp         0045AC3C
 0045A7D6    mov         eax,dword ptr [ebp-8]
 0045A7D9    mov         dword ptr [eax],27
 0045A7DF    push        ebp
 0045A7E0    call        Default
 0045A7E5    pop         ecx
>0045A7E6    jmp         0045AC3C
 0045A7EB    mov         eax,dword ptr [ebp-4]
 0045A7EE    call        TApplication.GetIconHandle
 0045A7F3    mov         edx,dword ptr [ebp-8]
 0045A7F6    mov         dword ptr [edx+0C],eax
>0045A7F9    jmp         0045AC3C
 0045A7FE    push        0
 0045A800    push        0
 0045A802    push        0B01A
 0045A807    mov         eax,dword ptr [ebp-4]
 0045A80A    mov         eax,dword ptr [eax+30]
 0045A80D    push        eax
 0045A80E    call        user32.PostMessageA
 0045A813    push        ebp
 0045A814    call        Default
 0045A819    pop         ecx
>0045A81A    jmp         0045AC3C
 0045A81F    push        ebp
 0045A820    call        Default
 0045A825    pop         ecx
 0045A826    mov         eax,dword ptr [ebp-8]
 0045A829    cmp         dword ptr [eax+4],1
 0045A82D    sbb         eax,eax
 0045A82F    inc         eax
 0045A830    mov         edx,dword ptr [ebp-4]
 0045A833    mov         byte ptr [edx+9D],al
 0045A839    mov         eax,dword ptr [ebp-8]
 0045A83C    cmp         dword ptr [eax+4],0
>0045A840    je          0045A864
 0045A842    mov         eax,dword ptr [ebp-4]
 0045A845    call        TApplication.RestoreTopMosts
 0045A84A    push        0
 0045A84C    push        0
 0045A84E    push        0B000
 0045A853    mov         eax,dword ptr [ebp-4]
 0045A856    mov         eax,dword ptr [eax+30]
 0045A859    push        eax
 0045A85A    call        user32.PostMessageA
>0045A85F    jmp         0045AC3C
 0045A864    mov         eax,dword ptr [ebp-4]
 0045A867    call        TApplication.NormalizeTopMosts
 0045A86C    push        0
 0045A86E    push        0
 0045A870    push        0B001
 0045A875    mov         eax,dword ptr [ebp-4]
 0045A878    mov         eax,dword ptr [eax+30]
 0045A87B    push        eax
 0045A87C    call        user32.PostMessageA
>0045A881    jmp         0045AC3C
 0045A886    mov         eax,dword ptr [ebp-8]
 0045A889    cmp         dword ptr [eax+4],0
>0045A88D    je          0045A8C0
 0045A88F    mov         eax,dword ptr [ebp-4]
 0045A892    call        TApplication.RestoreTopMosts
 0045A897    mov         eax,dword ptr [ebp-4]
 0045A89A    mov         eax,dword ptr [eax+0AC]
 0045A8A0    test        eax,eax
>0045A8A2    je          0045A8B4
 0045A8A4    call        EnableTaskWindows
 0045A8A9    mov         eax,dword ptr [ebp-4]
 0045A8AC    xor         edx,edx
 0045A8AE    mov         dword ptr [eax+0AC],edx
 0045A8B4    push        ebp
 0045A8B5    call        Default
 0045A8BA    pop         ecx
>0045A8BB    jmp         0045AC3C
 0045A8C0    push        ebp
 0045A8C1    call        Default
 0045A8C6    pop         ecx
 0045A8C7    mov         eax,dword ptr [ebp-4]
 0045A8CA    cmp         dword ptr [eax+0AC],0
>0045A8D1    jne         0045A8E7
 0045A8D3    mov         eax,dword ptr [ebp-4]
 0045A8D6    mov         eax,dword ptr [eax+30]
 0045A8D9    call        DisableTaskWindows
 0045A8DE    mov         edx,dword ptr [ebp-4]
 0045A8E1    mov         dword ptr [edx+0AC],eax
 0045A8E7    mov         eax,dword ptr [ebp-4]
 0045A8EA    call        TApplication.NormalizeAllTopMosts
>0045A8EF    jmp         0045AC3C
 0045A8F4    mov         esi,dword ptr [ebp-8]
 0045A8F7    mov         esi,dword ptr [esi+8]
 0045A8FA    push        esi
 0045A8FB    mov         eax,dword ptr [ebp-8]
 0045A8FE    mov         eax,dword ptr [eax+4]
 0045A901    push        eax
 0045A902    mov         eax,dword ptr [ebp-8]
 0045A905    add         ebx,0BC00
 0045A90B    push        ebx
 0045A90C    mov         eax,dword ptr [ebp-8]
 0045A90F    push        esi
 0045A910    call        user32.SendMessageA
 0045A915    mov         edx,dword ptr [ebp-8]
 0045A918    mov         dword ptr [edx+0C],eax
>0045A91B    jmp         0045AC3C
 0045A920    mov         eax,dword ptr [ebp-8]
 0045A923    cmp         dword ptr [eax+4],0
>0045A927    je          0045AC3C
 0045A92D    mov         eax,dword ptr [ebp-4]
 0045A930    mov         byte ptr [eax+9C],1
>0045A937    jmp         0045AC3C
 0045A93C    mov         eax,dword ptr [ebp-8]
 0045A93F    mov         eax,dword ptr [eax+8]
 0045A942    cmp         dword ptr [eax],0DE534454
>0045A948    jne         0045AC3C
 0045A94E    mov         eax,dword ptr [ebp-4]
 0045A951    cmp         byte ptr [eax+9E],0
>0045A958    je          0045AC3C
 0045A95E    mov         eax,dword ptr [ebp-4]
 0045A961    cmp         dword ptr [eax+0A0],0
>0045A968    jne         0045A9E3
 0045A96A    mov         edx,8000
 0045A96F    mov         eax,45AC6C;'vcltest3.dll'
 0045A974    call        SafeLoadLibrary
 0045A979    mov         ebx,eax
 0045A97B    mov         eax,dword ptr [ebp-4]
 0045A97E    mov         dword ptr [eax+0A0],ebx
 0045A984    test        ebx,ebx
>0045A986    je          0045A9C8
 0045A988    mov         eax,dword ptr [ebp-8]
 0045A98B    xor         edx,edx
 0045A98D    mov         dword ptr [eax+0C],edx
 0045A990    push        45AC7C
 0045A995    mov         eax,dword ptr [ebp-4]
 0045A998    mov         eax,dword ptr [eax+0A0]
 0045A99E    push        eax
 0045A99F    call        KERNEL32.GetProcAddress
 0045A9A4    mov         esi,eax
 0045A9A6    mov         ebx,esi
 0045A9A8    test        esi,esi
>0045A9AA    je          0045AC3C
 0045A9B0    mov         eax,dword ptr [ebp-8]
 0045A9B3    mov         eax,dword ptr [eax+8]
 0045A9B6    mov         edx,dword ptr [eax+8]
 0045A9B9    push        edx
 0045A9BA    mov         edx,dword ptr [ebp-8]
 0045A9BD    mov         eax,dword ptr [eax+4]
 0045A9C0    push        eax
 0045A9C1    call        ebx
>0045A9C3    jmp         0045AC3C
 0045A9C8    call        KERNEL32.GetLastError
 0045A9CD    mov         edx,dword ptr [ebp-8]
 0045A9D0    mov         dword ptr [edx+0C],eax
 0045A9D3    mov         eax,dword ptr [ebp-4]
 0045A9D6    xor         edx,edx
 0045A9D8    mov         dword ptr [eax+0A0],edx
>0045A9DE    jmp         0045AC3C
 0045A9E3    mov         eax,dword ptr [ebp-8]
 0045A9E6    xor         edx,edx
 0045A9E8    mov         dword ptr [eax+0C],edx
>0045A9EB    jmp         0045AC3C
 0045A9F0    mov         ecx,dword ptr [ebp-8]
 0045A9F3    mov         ecx,dword ptr [ecx+8]
 0045A9F6    mov         eax,dword ptr [ebp-8]
 0045A9F9    mov         edx,ebx
 0045A9FB    mov         eax,dword ptr [ebp-4]
 0045A9FE    call        TApplication.DispatchAction
 0045AA03    and         eax,7F
 0045AA06    mov         edx,dword ptr [ebp-8]
 0045AA09    mov         dword ptr [edx+0C],eax
>0045AA0C    jmp         0045AC3C
 0045AA11    mov         edx,dword ptr [ebp-8]
 0045AA14    mov         eax,dword ptr [ebp-4]
 0045AA17    call        TApplication.IsShortCut
 0045AA1C    test        al,al
>0045AA1E    je          0045AC3C
 0045AA24    mov         eax,dword ptr [ebp-8]
 0045AA27    mov         dword ptr [eax+0C],1
>0045AA2E    jmp         0045AC3C
 0045AA33    mov         eax,dword ptr [ebp-4]
 0045AA36    mov         eax,dword ptr [eax+44]
 0045AA39    test        eax,eax
>0045AA3B    je          0045AC3C
 0045AA41    mov         esi,eax
 0045AA43    mov         eax,esi
 0045AA45    call        TWinControl.GetHandle
 0045AA4A    test        eax,eax
>0045AA4C    je          0045AC3C
 0045AA52    mov         eax,esi
 0045AA54    call        TWinControl.GetHandle
 0045AA59    push        eax
 0045AA5A    call        user32.IsWindowEnabled
 0045AA5F    test        eax,eax
>0045AA61    je          0045AC3C
 0045AA67    mov         eax,esi
 0045AA69    call        TWinControl.GetHandle
 0045AA6E    push        eax
 0045AA6F    call        user32.IsWindowVisible
 0045AA74    test        eax,eax
>0045AA76    je          0045AC3C
 0045AA7C    mov         byte ptr ds:[5ACDB4],0
 0045AA83    call        user32.GetFocus
 0045AA88    mov         ebx,eax
 0045AA8A    mov         eax,esi
 0045AA8C    call        TWinControl.GetHandle
 0045AA91    push        eax
 0045AA92    call        user32.SetFocus
 0045AA97    mov         eax,dword ptr [ebp-8]
 0045AA9A    mov         eax,dword ptr [eax+8]
 0045AA9D    push        eax
 0045AA9E    mov         ecx,dword ptr [ebp-8]
 0045AAA1    mov         ecx,dword ptr [ecx+4]
 0045AAA4    mov         edx,112
 0045AAA9    mov         eax,esi
 0045AAAB    call        TControl.Perform
 0045AAB0    push        ebx
 0045AAB1    call        user32.SetFocus
 0045AAB6    mov         byte ptr ds:[5ACDB4],1
 0045AABD    mov         eax,dword ptr [ebp-8]
 0045AAC0    mov         dword ptr [eax+0C],1
>0045AAC7    jmp         0045AC3C
 0045AACC    mov         eax,dword ptr [ebp-4]
 0045AACF    cmp         word ptr [eax+112],0
>0045AAD7    je          0045AC3C
 0045AADD    mov         ebx,dword ptr [ebp-4]
 0045AAE0    mov         edx,dword ptr [ebp-4]
 0045AAE3    mov         eax,dword ptr [ebx+114]
 0045AAE9    call        dword ptr [ebx+110]
>0045AAEF    jmp         0045AC3C
 0045AAF4    mov         eax,dword ptr [ebp-4]
 0045AAF7    cmp         word ptr [eax+10A],0
>0045AAFF    je          0045AC3C
 0045AB05    mov         ebx,dword ptr [ebp-4]
 0045AB08    mov         edx,dword ptr [ebp-4]
 0045AB0B    mov         eax,dword ptr [ebx+10C]
 0045AB11    call        dword ptr [ebx+108]
>0045AB17    jmp         0045AC3C
 0045AB1C    mov         eax,dword ptr [ebp-4]
 0045AB1F    mov         eax,dword ptr [eax+30]
 0045AB22    push        eax
 0045AB23    call        user32.IsIconic
 0045AB28    test        eax,eax
>0045AB2A    jne         0045AC3C
 0045AB30    call        user32.GetFocus
 0045AB35    mov         edx,dword ptr [ebp-4]
 0045AB38    cmp         eax,dword ptr [edx+30]
>0045AB3B    jne         0045AC3C
 0045AB41    xor         eax,eax
 0045AB43    call        FindTopMostWindow
 0045AB48    test        eax,eax
>0045AB4A    je          0045AC3C
 0045AB50    push        eax
 0045AB51    call        user32.SetFocus
>0045AB56    jmp         0045AC3C
 0045AB5B    mov         ecx,dword ptr [ebp-8]
 0045AB5E    mov         ecx,dword ptr [ecx+8]
 0045AB61    mov         edx,dword ptr [ebp-8]
 0045AB64    mov         dx,word ptr [edx+4]
 0045AB68    mov         eax,dword ptr [ebp-4]
 0045AB6B    call        TApplication.InvokeHelp
>0045AB70    jmp         0045AC3C
 0045AB75    mov         eax,dword ptr [ebp-8]
 0045AB78    cmp         dword ptr [eax+4],0
>0045AB7C    jne         0045AB96
 0045AB7E    mov         eax,dword ptr [ebp-8]
 0045AB81    mov         eax,dword ptr [eax+8]
 0045AB84    push        dword ptr [eax+4]
 0045AB87    push        dword ptr [eax]
 0045AB89    mov         eax,dword ptr [ebp-4]
 0045AB8C    call        TApplication.HookMainWindow
>0045AB91    jmp         0045AC3C
 0045AB96    mov         eax,dword ptr [ebp-8]
 0045AB99    mov         eax,dword ptr [eax+8]
 0045AB9C    push        dword ptr [eax+4]
 0045AB9F    push        dword ptr [eax]
 0045ABA1    mov         eax,dword ptr [ebp-4]
 0045ABA4    call        TApplication.UnhookMainWindow
>0045ABA9    jmp         0045AC3C
 0045ABAE    mov         eax,dword ptr [ebp-8]
 0045ABB1    cmp         dword ptr [eax+4],1
>0045ABB5    jne         0045ABC8
 0045ABB7    mov         eax,dword ptr [ebp-4]
 0045ABBA    mov         eax,dword ptr [eax+0B0]
 0045ABC0    mov         edx,dword ptr [ebp-8]
 0045ABC3    mov         dword ptr [edx+0C],eax
>0045ABC6    jmp         0045AC3C
 0045ABC8    mov         eax,dword ptr [ebp-8]
 0045ABCB    mov         eax,dword ptr [eax+8]
 0045ABCE    mov         edx,dword ptr [ebp-4]
 0045ABD1    mov         dword ptr [edx+0B0],eax
>0045ABD7    jmp         0045AC3C
 0045ABD9    mov         edx,dword ptr [ebp-8]
 0045ABDC    mov         edx,dword ptr [edx+4]
 0045ABDF    mov         eax,[005AE778];^Mouse:TMouse
 0045ABE4    mov         eax,dword ptr [eax]
 0045ABE6    call        TMouse.SettingChanged
 0045ABEB    mov         edx,dword ptr [ebp-8]
 0045ABEE    mov         eax,dword ptr [ebp-4]
 0045ABF1    call        TApplication.SettingChange
 0045ABF6    push        ebp
 0045ABF7    call        Default
 0045ABFC    pop         ecx
>0045ABFD    jmp         0045AC3C
 0045ABFF    mov         eax,[005E0CB0];Screen:TScreen
 0045AC04    call        TScreen.ResetFonts
 0045AC09    push        ebp
 0045AC0A    call        Default
 0045AC0F    pop         ecx
>0045AC10    jmp         0045AC3C
 0045AC12    call        ThemeServices
 0045AC17    call        TThemeServices.GetThemesEnabled
 0045AC1C    test        al,al
>0045AC1E    je          0045AC3C
 0045AC20    call        ThemeServices
 0045AC25    call        TThemeServices.ApplyThemeChange
>0045AC2A    jmp         0045AC3C
 0045AC2C    xor         eax,eax
 0045AC2E    call        CheckSynchronize
>0045AC33    jmp         0045AC3C
 0045AC35    push        ebp
 0045AC36    call        Default
 0045AC3B    pop         ecx
 0045AC3C    xor         eax,eax
 0045AC3E    pop         edx
 0045AC3F    pop         ecx
 0045AC40    pop         ecx
 0045AC41    mov         dword ptr fs:[eax],edx
>0045AC44    jmp         0045AC5B
>0045AC46    jmp         @HandleAnyException
 0045AC4B    mov         edx,dword ptr [ebp-4]
 0045AC4E    mov         eax,dword ptr [ebp-4]
 0045AC51    call        TApplication.HandleException
 0045AC56    call        @DoneExcept
 0045AC5B    pop         edi
 0045AC5C    pop         esi
 0045AC5D    pop         ebx
 0045AC5E    pop         ecx
 0045AC5F    pop         ecx
 0045AC60    pop         ebp
 0045AC61    ret
*}
end;

//0045AC90
function TApplication.GetIconHandle:HICON;
begin
{*
 0045AC90    mov         eax,dword ptr [eax+98]
 0045AC96    call        TIcon.GetHandle
 0045AC9B    test        eax,eax
>0045AC9D    jne         0045ACAB
 0045AC9F    push        7F00
 0045ACA4    push        0
 0045ACA6    call        user32.LoadIconA
 0045ACAB    ret
*}
end;

//0045ACAC
procedure TApplication.Minimize;
begin
{*
 0045ACAC    push        ebx
 0045ACAD    push        esi
 0045ACAE    mov         ebx,eax
 0045ACB0    mov         eax,dword ptr [ebx+30]
 0045ACB3    push        eax
 0045ACB4    call        user32.IsIconic
 0045ACB9    test        eax,eax
>0045ACBB    jne         0045AD59
 0045ACC1    mov         eax,ebx
 0045ACC3    call        TApplication.NormalizeTopMosts
 0045ACC8    mov         eax,dword ptr [ebx+30]
 0045ACCB    push        eax
 0045ACCC    call        user32.SetActiveWindow
 0045ACD1    cmp         dword ptr [ebx+44],0
>0045ACD5    je          0045AD34
 0045ACD7    cmp         byte ptr [ebx+5B],0
>0045ACDB    jne         0045ACE6
 0045ACDD    mov         eax,dword ptr [ebx+44]
 0045ACE0    cmp         byte ptr [eax+57],0
>0045ACE4    je          0045AD34
 0045ACE6    mov         eax,dword ptr [ebx+44]
 0045ACE9    call        TWinControl.GetHandle
 0045ACEE    push        eax
 0045ACEF    call        user32.IsWindowEnabled
 0045ACF4    test        eax,eax
>0045ACF6    je          0045AD34
 0045ACF8    push        40
 0045ACFA    push        0
 0045ACFC    mov         esi,dword ptr [ebx+44]
 0045ACFF    mov         eax,dword ptr [esi+48]
 0045AD02    push        eax
 0045AD03    mov         eax,dword ptr [esi+44]
 0045AD06    push        eax
 0045AD07    mov         eax,dword ptr [esi+40]
 0045AD0A    push        eax
 0045AD0B    mov         eax,dword ptr [ebx+44]
 0045AD0E    call        TWinControl.GetHandle
 0045AD13    push        eax
 0045AD14    mov         eax,dword ptr [ebx+30]
 0045AD17    push        eax
 0045AD18    call        user32.SetWindowPos
 0045AD1D    push        0
 0045AD1F    push        0F020
 0045AD24    push        112
 0045AD29    mov         eax,dword ptr [ebx+30]
 0045AD2C    push        eax
 0045AD2D    call        user32.DefWindowProcA
>0045AD32    jmp         0045AD41
 0045AD34    mov         edx,6
 0045AD39    mov         eax,dword ptr [ebx+30]
 0045AD3C    call        ShowWinNoAnimate
 0045AD41    cmp         word ptr [ebx+11A],0
>0045AD49    je          0045AD59
 0045AD4B    mov         edx,ebx
 0045AD4D    mov         eax,dword ptr [ebx+11C]
 0045AD53    call        dword ptr [ebx+118]
 0045AD59    pop         esi
 0045AD5A    pop         ebx
 0045AD5B    ret
*}
end;

//0045AD5C
procedure TApplication.Restore;
begin
{*
 0045AD5C    push        ebx
 0045AD5D    push        esi
 0045AD5E    mov         ebx,eax
 0045AD60    mov         eax,dword ptr [ebx+30]
 0045AD63    push        eax
 0045AD64    call        user32.IsIconic
 0045AD69    test        eax,eax
>0045AD6B    je          0045AE59
 0045AD71    mov         eax,dword ptr [ebx+30]
 0045AD74    push        eax
 0045AD75    call        user32.SetActiveWindow
 0045AD7A    cmp         dword ptr [ebx+44],0
>0045AD7E    je          0045ADB8
 0045AD80    cmp         byte ptr [ebx+5B],0
>0045AD84    jne         0045AD8F
 0045AD86    mov         eax,dword ptr [ebx+44]
 0045AD89    cmp         byte ptr [eax+57],0
>0045AD8D    je          0045ADB8
 0045AD8F    mov         eax,dword ptr [ebx+44]
 0045AD92    call        TWinControl.GetHandle
 0045AD97    push        eax
 0045AD98    call        user32.IsWindowEnabled
 0045AD9D    test        eax,eax
>0045AD9F    je          0045ADB8
 0045ADA1    push        0
 0045ADA3    push        0F120
 0045ADA8    push        112
 0045ADAD    mov         eax,dword ptr [ebx+30]
 0045ADB0    push        eax
 0045ADB1    call        user32.DefWindowProcA
>0045ADB6    jmp         0045ADC5
 0045ADB8    mov         edx,9
 0045ADBD    mov         eax,dword ptr [ebx+30]
 0045ADC0    call        ShowWinNoAnimate
 0045ADC5    push        40
 0045ADC7    push        0
 0045ADC9    push        0
 0045ADCB    push        1
 0045ADCD    mov         eax,[005AE32C]
 0045ADD2    mov         eax,dword ptr [eax]
 0045ADD4    call        eax
 0045ADD6    sar         eax,1
>0045ADD8    jns         0045ADDD
 0045ADDA    adc         eax,0
 0045ADDD    push        eax
 0045ADDE    push        0
 0045ADE0    mov         eax,[005AE32C]
 0045ADE5    mov         eax,dword ptr [eax]
 0045ADE7    call        eax
 0045ADE9    sar         eax,1
>0045ADEB    jns         0045ADF0
 0045ADED    adc         eax,0
 0045ADF0    push        eax
 0045ADF1    push        0
 0045ADF3    mov         eax,dword ptr [ebx+30]
 0045ADF6    push        eax
 0045ADF7    call        user32.SetWindowPos
 0045ADFC    mov         eax,dword ptr [ebx+44]
 0045ADFF    test        eax,eax
>0045AE01    je          0045AE21
 0045AE03    cmp         byte ptr [eax+22B],1
>0045AE0A    jne         0045AE21
 0045AE0C    cmp         byte ptr [eax+57],0
>0045AE10    jne         0045AE21
 0045AE12    xor         edx,edx
 0045AE14    call        TCustomForm.SetWindowState
 0045AE19    mov         eax,dword ptr [ebx+44]
 0045AE1C    call        TCustomForm.Show
 0045AE21    mov         eax,ebx
 0045AE23    call        TApplication.RestoreTopMosts
 0045AE28    mov         eax,[005E0CB0];Screen:TScreen
 0045AE2D    mov         esi,dword ptr [eax+64]
 0045AE30    test        esi,esi
>0045AE32    je          0045AE41
 0045AE34    mov         eax,esi
 0045AE36    call        TWinControl.GetHandle
 0045AE3B    push        eax
 0045AE3C    call        user32.SetFocus
 0045AE41    cmp         word ptr [ebx+122],0
>0045AE49    je          0045AE59
 0045AE4B    mov         edx,ebx
 0045AE4D    mov         eax,dword ptr [ebx+124]
 0045AE53    call        dword ptr [ebx+120]
 0045AE59    pop         esi
 0045AE5A    pop         ebx
 0045AE5B    ret
*}
end;

//0045AE5C
procedure TApplication.BringToFront;
begin
{*
 0045AE5C    push        ebx
 0045AE5D    push        esi
 0045AE5E    mov         ebx,eax
 0045AE60    mov         eax,dword ptr [ebx+30]
 0045AE63    test        eax,eax
>0045AE65    je          0045AE92
 0045AE67    push        eax
 0045AE68    call        user32.GetLastActivePopup
 0045AE6D    mov         esi,eax
 0045AE6F    test        esi,esi
>0045AE71    je          0045AE92
 0045AE73    cmp         esi,dword ptr [ebx+30]
>0045AE76    je          0045AE92
 0045AE78    push        esi
 0045AE79    call        user32.IsWindowVisible
 0045AE7E    test        eax,eax
>0045AE80    je          0045AE92
 0045AE82    push        esi
 0045AE83    call        user32.IsWindowEnabled
 0045AE88    test        eax,eax
>0045AE8A    je          0045AE92
 0045AE8C    push        esi
 0045AE8D    call        user32.SetForegroundWindow
 0045AE92    pop         esi
 0045AE93    pop         ebx
 0045AE94    ret
*}
end;

//0045AE98
function TApplication.GetTitle:AnsiString;
begin
{*
 0045AE98    push        ebx
 0045AE99    push        esi
 0045AE9A    add         esp,0FFFFFF00
 0045AEA0    mov         esi,edx
 0045AEA2    mov         ebx,eax
 0045AEA4    cmp         byte ptr [ebx+0A4],0
>0045AEAB    je          0045AECD
 0045AEAD    push        100
 0045AEB2    lea         eax,[esp+4]
 0045AEB6    push        eax
 0045AEB7    mov         eax,dword ptr [ebx+30]
 0045AEBA    push        eax
 0045AEBB    call        user32.GetWindowTextA
 0045AEC0    mov         ecx,eax
 0045AEC2    mov         edx,esp
 0045AEC4    mov         eax,esi
 0045AEC6    call        @LStrFromPCharLen
>0045AECB    jmp         0045AEDA
 0045AECD    mov         eax,esi
 0045AECF    mov         edx,dword ptr [ebx+8C]
 0045AED5    call        @LStrAsg
 0045AEDA    add         esp,100
 0045AEE0    pop         esi
 0045AEE1    pop         ebx
 0045AEE2    ret
*}
end;

//0045AEE4
procedure TApplication.SetTitle(const Value:AnsiString);
begin
{*
 0045AEE4    push        ebp
 0045AEE5    mov         ebp,esp
 0045AEE7    push        0
 0045AEE9    push        ebx
 0045AEEA    push        esi
 0045AEEB    mov         esi,edx
 0045AEED    mov         ebx,eax
 0045AEEF    xor         eax,eax
 0045AEF1    push        ebp
 0045AEF2    push        45AF66
 0045AEF7    push        dword ptr fs:[eax]
 0045AEFA    mov         dword ptr fs:[eax],esp
 0045AEFD    cmp         byte ptr [ebx+0A4],0
>0045AF04    je          0045AF43
 0045AF06    lea         edx,[ebp-4]
 0045AF09    mov         eax,ebx
 0045AF0B    call        TApplication.GetTitle
 0045AF10    mov         eax,dword ptr [ebp-4]
 0045AF13    mov         edx,esi
 0045AF15    call        @LStrCmp
>0045AF1A    jne         0045AF25
 0045AF1C    cmp         dword ptr [ebx+8C],0
>0045AF23    je          0045AF50
 0045AF25    mov         eax,esi
 0045AF27    call        @LStrToPChar
 0045AF2C    push        eax
 0045AF2D    mov         eax,dword ptr [ebx+30]
 0045AF30    push        eax
 0045AF31    call        user32.SetWindowTextA
 0045AF36    lea         eax,[ebx+8C]
 0045AF3C    call        @LStrClr
>0045AF41    jmp         0045AF50
 0045AF43    lea         eax,[ebx+8C]
 0045AF49    mov         edx,esi
 0045AF4B    call        @LStrAsg
 0045AF50    xor         eax,eax
 0045AF52    pop         edx
 0045AF53    pop         ecx
 0045AF54    pop         ecx
 0045AF55    mov         dword ptr fs:[eax],edx
 0045AF58    push        45AF6D
 0045AF5D    lea         eax,[ebp-4]
 0045AF60    call        @LStrClr
 0045AF65    ret
>0045AF66    jmp         @HandleFinally
>0045AF6B    jmp         0045AF5D
 0045AF6D    pop         esi
 0045AF6E    pop         ebx
 0045AF6F    pop         ecx
 0045AF70    pop         ebp
 0045AF71    ret
*}
end;

//0045AF74
function TApplication.IsDlgMsg(var Msg:TMsg):Boolean;
begin
{*
 0045AF74    push        ebx
 0045AF75    push        esi
 0045AF76    push        edi
 0045AF77    mov         edi,edx
 0045AF79    mov         ebx,eax
 0045AF7B    xor         eax,eax
 0045AF7D    mov         esi,dword ptr [ebx+0B0]
 0045AF83    test        esi,esi
>0045AF85    je          0045AF94
 0045AF87    push        edi
 0045AF88    push        esi
 0045AF89    call        user32.IsDialogMessageA
 0045AF8E    cmp         eax,1
 0045AF91    sbb         eax,eax
 0045AF93    inc         eax
 0045AF94    pop         edi
 0045AF95    pop         esi
 0045AF96    pop         ebx
 0045AF97    ret
*}
end;

//0045AF98
function TApplication.IsMDIMsg(var Msg:TMsg):Boolean;
begin
{*
 0045AF98    push        ebx
 0045AF99    push        esi
 0045AF9A    push        edi
 0045AF9B    mov         edi,edx
 0045AF9D    mov         ebx,eax
 0045AF9F    xor         eax,eax
 0045AFA1    mov         esi,dword ptr [ebx+44]
 0045AFA4    test        esi,esi
>0045AFA6    je          0045AFE2
 0045AFA8    cmp         byte ptr [esi+22F],2
>0045AFAF    jne         0045AFE2
 0045AFB1    mov         edx,dword ptr ds:[5E0CB0];Screen:TScreen
 0045AFB7    cmp         dword ptr [edx+6C],0
>0045AFBB    je          0045AFE2
 0045AFBD    mov         edx,dword ptr ds:[5E0CB0];Screen:TScreen
 0045AFC3    mov         edx,dword ptr [edx+6C]
 0045AFC6    cmp         byte ptr [edx+22F],1
>0045AFCD    jne         0045AFE2
 0045AFCF    push        edi
 0045AFD0    mov         eax,dword ptr [esi+254]
 0045AFD6    push        eax
 0045AFD7    call        user32.TranslateMDISysAccel
 0045AFDC    cmp         eax,1
 0045AFDF    sbb         eax,eax
 0045AFE1    inc         eax
 0045AFE2    pop         edi
 0045AFE3    pop         esi
 0045AFE4    pop         ebx
 0045AFE5    ret
*}
end;

//0045AFE8
function TApplication.IsKeyMsg(var Msg:TMsg):Boolean;
begin
{*
 0045AFE8    push        ebx
 0045AFE9    push        esi
 0045AFEA    push        edi
 0045AFEB    push        ebp
 0045AFEC    mov         esi,edx
 0045AFEE    mov         edi,eax
 0045AFF0    xor         ebx,ebx
 0045AFF2    mov         eax,dword ptr [esi+4]
 0045AFF5    cmp         eax,100
>0045AFFA    jb          0045B099
 0045B000    cmp         eax,108
>0045B005    ja          0045B099
 0045B00B    call        user32.GetCapture
 0045B010    mov         ebp,eax
 0045B012    test        ebp,ebp
>0045B014    jne         0045B06C
 0045B016    mov         ebp,dword ptr [esi]
 0045B018    mov         eax,dword ptr [edi+44]
 0045B01B    test        eax,eax
>0045B01D    je          0045B038
 0045B01F    cmp         ebp,dword ptr [eax+254]
>0045B025    jne         0045B038
 0045B027    call        TWinControl.GetHandle
 0045B02C    mov         ebp,eax
>0045B02E    jmp         0045B04D
 0045B030    push        ebp
 0045B031    call        user32.GetParent
 0045B036    mov         ebp,eax
 0045B038    mov         eax,ebp
 0045B03A    call        FindControl
 0045B03F    test        eax,eax
>0045B041    jne         0045B047
 0045B043    test        ebp,ebp
>0045B045    jne         0045B030
 0045B047    test        ebp,ebp
>0045B049    jne         0045B04D
 0045B04B    mov         ebp,dword ptr [esi]
 0045B04D    mov         eax,dword ptr [esi+0C]
 0045B050    push        eax
 0045B051    mov         eax,dword ptr [esi+8]
 0045B054    push        eax
 0045B055    mov         eax,dword ptr [esi+4]
 0045B058    add         eax,0BC00
 0045B05D    push        eax
 0045B05E    push        ebp
 0045B05F    call        user32.SendMessageA
 0045B064    test        eax,eax
>0045B066    je          0045B099
 0045B068    mov         bl,1
>0045B06A    jmp         0045B099
 0045B06C    push        0FA
 0045B06E    push        ebp
 0045B06F    call        user32.GetWindowLongA
 0045B074    cmp         eax,dword ptr ds:[5AF664];gvar_005AF664
>0045B07A    jne         0045B099
 0045B07C    mov         eax,dword ptr [esi+0C]
 0045B07F    push        eax
 0045B080    mov         eax,dword ptr [esi+8]
 0045B083    push        eax
 0045B084    mov         eax,dword ptr [esi+4]
 0045B087    add         eax,0BC00
 0045B08C    push        eax
 0045B08D    push        ebp
 0045B08E    call        user32.SendMessageA
 0045B093    test        eax,eax
>0045B095    je          0045B099
 0045B097    mov         bl,1
 0045B099    mov         eax,ebx
 0045B09B    pop         ebp
 0045B09C    pop         edi
 0045B09D    pop         esi
 0045B09E    pop         ebx
 0045B09F    ret
*}
end;

//0045B0A0
function TApplication.IsHintMsg(var Msg:TMsg):Boolean;
begin
{*
 0045B0A0    push        ebx
 0045B0A1    push        esi
 0045B0A2    push        edi
 0045B0A3    push        ebp
 0045B0A4    mov         edi,edx
 0045B0A6    mov         ebp,eax
 0045B0A8    xor         ebx,ebx
 0045B0AA    mov         esi,dword ptr [ebp+84]
 0045B0B0    test        esi,esi
>0045B0B2    je          0045B0CB
 0045B0B4    mov         edx,edi
 0045B0B6    mov         eax,esi
 0045B0B8    mov         ecx,dword ptr [eax]
 0045B0BA    call        dword ptr [ecx+0DC]
 0045B0C0    test        al,al
>0045B0C2    je          0045B0CB
 0045B0C4    mov         eax,ebp
 0045B0C6    call        TApplication.CancelHint
 0045B0CB    mov         eax,ebx
 0045B0CD    pop         ebp
 0045B0CE    pop         edi
 0045B0CF    pop         esi
 0045B0D0    pop         ebx
 0045B0D1    ret
*}
end;

//0045B0D4
function TApplication.IsShortCut(var Message:TWMKey):Boolean;
begin
{*
 0045B0D4    push        ebx
 0045B0D5    push        esi
 0045B0D6    push        edi
 0045B0D7    push        ebp
 0045B0D8    push        ecx
 0045B0D9    mov         ebp,edx
 0045B0DB    mov         ebx,eax
 0045B0DD    mov         byte ptr [esp],0
 0045B0E1    cmp         word ptr [ebx+12A],0
>0045B0E9    je          0045B0FB
 0045B0EB    mov         ecx,esp
 0045B0ED    mov         edx,ebp
 0045B0EF    mov         eax,dword ptr [ebx+12C]
 0045B0F5    call        dword ptr [ebx+128]
 0045B0FB    cmp         byte ptr [esp],0
>0045B0FF    jne         0045B12F
 0045B101    mov         edi,dword ptr [ebx+44]
 0045B104    test        edi,edi
>0045B106    je          0045B12B
 0045B108    mov         eax,edi
 0045B10A    call        TWinControl.GetHandle
 0045B10F    push        eax
 0045B110    call        user32.IsWindowEnabled
 0045B115    test        eax,eax
>0045B117    je          0045B12B
 0045B119    mov         edx,ebp
 0045B11B    mov         eax,dword ptr [ebx+44]
 0045B11E    mov         si,0FFAB
 0045B122    call        @CallDynaInst
 0045B127    test        al,al
>0045B129    jne         0045B12F
 0045B12B    xor         eax,eax
>0045B12D    jmp         0045B131
 0045B12F    mov         al,1
 0045B131    mov         byte ptr [esp],al
 0045B134    mov         al,byte ptr [esp]
 0045B137    pop         edx
 0045B138    pop         ebp
 0045B139    pop         edi
 0045B13A    pop         esi
 0045B13B    pop         ebx
 0045B13C    ret
*}
end;

//0045B140
function TApplication.ProcessMessage(var Msg:TMsg):Boolean;
begin
{*
 0045B140    push        ebx
 0045B141    push        esi
 0045B142    push        edi
 0045B143    push        ecx
 0045B144    mov         edi,edx
 0045B146    mov         esi,eax
 0045B148    xor         ebx,ebx
 0045B14A    push        1
 0045B14C    push        0
 0045B14E    push        0
 0045B150    push        0
 0045B152    push        edi
 0045B153    call        user32.PeekMessageA
 0045B158    test        eax,eax
>0045B15A    je          0045B1D1
 0045B15C    mov         bl,1
 0045B15E    cmp         dword ptr [edi+4],12
>0045B162    je          0045B1CA
 0045B164    mov         byte ptr [esp],0
 0045B168    cmp         word ptr [esi+0DA],0
>0045B170    je          0045B182
 0045B172    mov         ecx,esp
 0045B174    mov         edx,edi
 0045B176    mov         eax,dword ptr [esi+0DC]
 0045B17C    call        dword ptr [esi+0D8]
 0045B182    mov         edx,edi
 0045B184    mov         eax,esi
 0045B186    call        TApplication.IsHintMsg
 0045B18B    test        al,al
>0045B18D    jne         0045B1D1
 0045B18F    cmp         byte ptr [esp],0
>0045B193    jne         0045B1D1
 0045B195    mov         edx,edi
 0045B197    mov         eax,esi
 0045B199    call        TApplication.IsMDIMsg
 0045B19E    test        al,al
>0045B1A0    jne         0045B1D1
 0045B1A2    mov         edx,edi
 0045B1A4    mov         eax,esi
 0045B1A6    call        TApplication.IsKeyMsg
 0045B1AB    test        al,al
>0045B1AD    jne         0045B1D1
 0045B1AF    mov         edx,edi
 0045B1B1    mov         eax,esi
 0045B1B3    call        TApplication.IsDlgMsg
 0045B1B8    test        al,al
>0045B1BA    jne         0045B1D1
 0045B1BC    push        edi
 0045B1BD    call        user32.TranslateMessage
 0045B1C2    push        edi
 0045B1C3    call        user32.DispatchMessageA
>0045B1C8    jmp         0045B1D1
 0045B1CA    mov         byte ptr [esi+9C],1
 0045B1D1    mov         eax,ebx
 0045B1D3    pop         edx
 0045B1D4    pop         edi
 0045B1D5    pop         esi
 0045B1D6    pop         ebx
 0045B1D7    ret
*}
end;

//0045B1D8
procedure TApplication.ProcessMessages;
begin
{*
 0045B1D8    push        ebx
 0045B1D9    add         esp,0FFFFFFE4
 0045B1DC    mov         ebx,eax
 0045B1DE    mov         edx,esp
 0045B1E0    mov         eax,ebx
 0045B1E2    call        TApplication.ProcessMessage
 0045B1E7    test        al,al
>0045B1E9    jne         0045B1DE
 0045B1EB    add         esp,1C
 0045B1EE    pop         ebx
 0045B1EF    ret
*}
end;

//0045B1F0
procedure TApplication.HandleMessage;
begin
{*
 0045B1F0    push        ebx
 0045B1F1    add         esp,0FFFFFFE4
 0045B1F4    mov         ebx,eax
 0045B1F6    mov         edx,esp
 0045B1F8    mov         eax,ebx
 0045B1FA    call        TApplication.ProcessMessage
 0045B1FF    test        al,al
>0045B201    jne         0045B20C
 0045B203    mov         edx,esp
 0045B205    mov         eax,ebx
 0045B207    call        TApplication.Idle
 0045B20C    add         esp,1C
 0045B20F    pop         ebx
 0045B210    ret
*}
end;

//0045B214
procedure TApplication.HookMainWindow(Hook:TWindowHook);
begin
{*
 0045B214    push        ebp
 0045B215    mov         ebp,esp
 0045B217    push        ebx
 0045B218    mov         ebx,eax
 0045B21A    cmp         byte ptr [ebx+0A4],0
>0045B221    jne         0045B23D
 0045B223    mov         eax,dword ptr [ebx+30]
 0045B226    test        eax,eax
>0045B228    je          0045B26A
 0045B22A    lea         edx,[ebp+8]
 0045B22D    push        edx
 0045B22E    push        0
 0045B230    push        0B020
 0045B235    push        eax
 0045B236    call        user32.SendMessageA
>0045B23B    jmp         0045B26A
 0045B23D    mov         eax,dword ptr [ebx+0A8]
 0045B243    call        TList.Expand
 0045B248    mov         eax,8
 0045B24D    call        @GetMem
 0045B252    mov         edx,dword ptr [ebp+8]
 0045B255    mov         dword ptr [eax],edx
 0045B257    mov         edx,dword ptr [ebp+0C]
 0045B25A    mov         dword ptr [eax+4],edx
 0045B25D    mov         edx,eax
 0045B25F    mov         eax,dword ptr [ebx+0A8]
 0045B265    call        TList.Add
 0045B26A    pop         ebx
 0045B26B    pop         ebp
 0045B26C    ret         8
*}
end;

//0045B270
procedure TApplication.UnhookMainWindow(Hook:TWindowHook);
begin
{*
 0045B270    push        ebp
 0045B271    mov         ebp,esp
 0045B273    push        ebx
 0045B274    push        esi
 0045B275    push        edi
 0045B276    mov         ebx,eax
 0045B278    cmp         byte ptr [ebx+0A4],0
>0045B27F    jne         0045B29B
 0045B281    mov         eax,dword ptr [ebx+30]
 0045B284    test        eax,eax
>0045B286    je          0045B2E5
 0045B288    lea         edx,[ebp+8]
 0045B28B    push        edx
 0045B28C    push        1
 0045B28E    push        0B020
 0045B293    push        eax
 0045B294    call        user32.SendMessageA
>0045B299    jmp         0045B2E5
 0045B29B    mov         eax,dword ptr [ebx+0A8]
 0045B2A1    mov         edi,dword ptr [eax+8]
 0045B2A4    dec         edi
 0045B2A5    test        edi,edi
>0045B2A7    jl          0045B2E5
 0045B2A9    inc         edi
 0045B2AA    xor         esi,esi
 0045B2AC    mov         edx,esi
 0045B2AE    mov         eax,dword ptr [ebx+0A8]
 0045B2B4    call        TList.Get
 0045B2B9    mov         edx,dword ptr [eax]
 0045B2BB    cmp         edx,dword ptr [ebp+8]
>0045B2BE    jne         0045B2E1
 0045B2C0    mov         edx,dword ptr [ebp+0C]
 0045B2C3    cmp         edx,dword ptr [eax+4]
>0045B2C6    jne         0045B2E1
 0045B2C8    mov         edx,8
 0045B2CD    call        @FreeMem
 0045B2D2    mov         edx,esi
 0045B2D4    mov         eax,dword ptr [ebx+0A8]
 0045B2DA    call        TList.Delete
>0045B2DF    jmp         0045B2E5
 0045B2E1    inc         esi
 0045B2E2    dec         edi
>0045B2E3    jne         0045B2AC
 0045B2E5    pop         edi
 0045B2E6    pop         esi
 0045B2E7    pop         ebx
 0045B2E8    pop         ebp
 0045B2E9    ret         8
*}
end;

//0045B2EC
procedure TApplication.Initialize;
begin
{*
 0045B2EC    push        ebx
 0045B2ED    mov         eax,[005AE444];InitProc:Pointer
 0045B2F2    cmp         dword ptr [eax],0
>0045B2F5    je          0045B301
 0045B2F7    mov         ebx,dword ptr ds:[5AE444];InitProc:Pointer
 0045B2FD    mov         ebx,dword ptr [ebx]
 0045B2FF    call        ebx
 0045B301    pop         ebx
 0045B302    ret
*}
end;

//0045B304
procedure TApplication.CreateForm(InstanceClass:TComponentClass; var Reference:void );
begin
{*
 0045B304    push        ebp
 0045B305    mov         ebp,esp
 0045B307    push        ecx
 0045B308    push        ebx
 0045B309    push        esi
 0045B30A    push        edi
 0045B30B    mov         dword ptr [ebp-4],ecx
 0045B30E    mov         ebx,edx
 0045B310    mov         esi,eax
 0045B312    mov         eax,ebx
 0045B314    call        dword ptr [eax-0C]
 0045B317    mov         ebx,eax
 0045B319    mov         eax,dword ptr [ebp-4]
 0045B31C    mov         dword ptr [eax],ebx
 0045B31E    xor         eax,eax
 0045B320    push        ebp
 0045B321    push        45B342
 0045B326    push        dword ptr fs:[eax]
 0045B329    mov         dword ptr fs:[eax],esp
 0045B32C    mov         ecx,esi
 0045B32E    or          edx,0FFFFFFFF
 0045B331    mov         eax,ebx
 0045B333    mov         edi,dword ptr [eax]
 0045B335    call        dword ptr [edi+2C]
 0045B338    xor         eax,eax
 0045B33A    pop         edx
 0045B33B    pop         ecx
 0045B33C    pop         ecx
 0045B33D    mov         dword ptr fs:[eax],edx
>0045B340    jmp         0045B358
>0045B342    jmp         @HandleAnyException
 0045B347    mov         eax,dword ptr [ebp-4]
 0045B34A    xor         edx,edx
 0045B34C    mov         dword ptr [eax],edx
 0045B34E    call        @RaiseAgain
 0045B353    call        @DoneExcept
 0045B358    cmp         dword ptr [esi+44],0
>0045B35C    jne         0045B37B
 0045B35E    mov         eax,ebx
 0045B360    mov         edx,dword ptr ds:[451000];TForm
 0045B366    call        @IsClass
 0045B36B    test        al,al
>0045B36D    je          0045B37B
 0045B36F    mov         edi,ebx
 0045B371    mov         eax,edi
 0045B373    call        TWinControl.HandleNeeded
 0045B378    mov         dword ptr [esi+44],edi
 0045B37B    pop         edi
 0045B37C    pop         esi
 0045B37D    pop         ebx
 0045B37E    pop         ecx
 0045B37F    pop         ebp
 0045B380    ret
*}
end;

//0045B384
procedure TApplication.Run;
begin
{*
 0045B384    push        ebp
 0045B385    mov         ebp,esp
 0045B387    push        ecx
 0045B388    push        ebx
 0045B389    push        esi
 0045B38A    push        edi
 0045B38B    mov         dword ptr [ebp-4],eax
 0045B38E    mov         eax,dword ptr [ebp-4]
 0045B391    mov         byte ptr [eax+0A5],1
 0045B398    xor         edx,edx
 0045B39A    push        ebp
 0045B39B    push        45B462
 0045B3A0    push        dword ptr fs:[edx]
 0045B3A3    mov         dword ptr fs:[edx],esp
 0045B3A6    mov         eax,4521EC;DoneApplication
 0045B3AB    call        AddExitProc
 0045B3B0    mov         eax,dword ptr [ebp-4]
 0045B3B3    mov         eax,dword ptr [eax+44]
 0045B3B6    test        eax,eax
>0045B3B8    je          0045B44A
 0045B3BE    mov         edx,dword ptr ds:[5AE518];CmdShow:Integer
 0045B3C4    mov         edx,dword ptr [edx]
 0045B3C6    sub         edx,3
>0045B3C9    je          0045B3D9
 0045B3CB    sub         edx,4
>0045B3CE    jne         0045B3E0
 0045B3D0    mov         byte ptr [eax+22B],1
>0045B3D7    jmp         0045B3E0
 0045B3D9    mov         dl,2
 0045B3DB    call        TCustomForm.SetWindowState
 0045B3E0    mov         eax,dword ptr [ebp-4]
 0045B3E3    cmp         byte ptr [eax+5B],0
>0045B3E7    je          0045B409
 0045B3E9    mov         eax,dword ptr [ebp-4]
 0045B3EC    mov         eax,dword ptr [eax+44]
 0045B3EF    cmp         byte ptr [eax+22B],1
>0045B3F6    jne         0045B402
 0045B3F8    mov         eax,dword ptr [ebp-4]
 0045B3FB    call        TApplication.Minimize
>0045B400    jmp         0045B409
 0045B402    mov         dl,1
 0045B404    call        TCustomForm.SetVisible
 0045B409    xor         eax,eax
 0045B40B    push        ebp
 0045B40C    push        45B429
 0045B411    push        dword ptr fs:[eax]
 0045B414    mov         dword ptr fs:[eax],esp
 0045B417    mov         eax,dword ptr [ebp-4]
 0045B41A    call        TApplication.HandleMessage
 0045B41F    xor         eax,eax
 0045B421    pop         edx
 0045B422    pop         ecx
 0045B423    pop         ecx
 0045B424    mov         dword ptr fs:[eax],edx
>0045B427    jmp         0045B43E
>0045B429    jmp         @HandleAnyException
 0045B42E    mov         edx,dword ptr [ebp-4]
 0045B431    mov         eax,dword ptr [ebp-4]
 0045B434    call        TApplication.HandleException
 0045B439    call        @DoneExcept
 0045B43E    mov         eax,dword ptr [ebp-4]
 0045B441    cmp         byte ptr [eax+9C],0
>0045B448    je          0045B409
 0045B44A    xor         eax,eax
 0045B44C    pop         edx
 0045B44D    pop         ecx
 0045B44E    pop         ecx
 0045B44F    mov         dword ptr fs:[eax],edx
 0045B452    push        45B469
 0045B457    mov         eax,dword ptr [ebp-4]
 0045B45A    mov         byte ptr [eax+0A5],0
 0045B461    ret
>0045B462    jmp         @HandleFinally
>0045B467    jmp         0045B457
 0045B469    pop         edi
 0045B46A    pop         esi
 0045B46B    pop         ebx
 0045B46C    pop         ecx
 0045B46D    pop         ebp
 0045B46E    ret
*}
end;

//0045B470
procedure TApplication.Terminate;
begin
{*
 0045B470    call        CallTerminateProcs
 0045B475    test        al,al
>0045B477    je          0045B480
 0045B479    push        0
 0045B47B    call        user32.PostQuitMessage
 0045B480    ret
*}
end;

//0045B484
procedure TApplication.HandleException(Sender:TObject);
begin
{*
 0045B484    push        ebx
 0045B485    push        esi
 0045B486    mov         esi,edx
 0045B488    mov         ebx,eax
 0045B48A    call        user32.GetCapture
 0045B48F    test        eax,eax
>0045B491    je          0045B4A4
 0045B493    push        0
 0045B495    push        0
 0045B497    push        1F
 0045B499    call        user32.GetCapture
 0045B49E    push        eax
 0045B49F    call        user32.SendMessageA
 0045B4A4    call        ExceptObject
 0045B4A9    mov         edx,dword ptr ds:[408B30];Exception
 0045B4AF    call        @IsClass
 0045B4B4    test        al,al
>0045B4B6    je          0045B4FE
 0045B4B8    call        ExceptObject
 0045B4BD    mov         edx,dword ptr ds:[408B98];EAbort
 0045B4C3    call        @IsClass
 0045B4C8    test        al,al
>0045B4CA    jne         0045B50F
 0045B4CC    cmp         word ptr [ebx+0D2],0
>0045B4D4    je          0045B4ED
 0045B4D6    call        ExceptObject
 0045B4DB    mov         ecx,eax
 0045B4DD    mov         edx,esi
 0045B4DF    mov         eax,dword ptr [ebx+0D4]
 0045B4E5    call        dword ptr [ebx+0D0]
>0045B4EB    jmp         0045B50F
 0045B4ED    call        ExceptObject
 0045B4F2    mov         edx,eax
 0045B4F4    mov         eax,ebx
 0045B4F6    call        TApplication.ShowException
 0045B4FB    pop         esi
 0045B4FC    pop         ebx
 0045B4FD    ret
 0045B4FE    call        ExceptAddr
 0045B503    push        eax
 0045B504    call        ExceptObject
 0045B509    pop         edx
 0045B50A    call        ShowException
 0045B50F    pop         esi
 0045B510    pop         ebx
 0045B511    ret
*}
end;

//0045B514
function TApplication.MessageBox(const Text:PChar; const Caption:PChar; Flags:Longint):Integer;
begin
{*
 0045B514    push        ebp
 0045B515    mov         ebp,esp
 0045B517    add         esp,0FFFFFFAC
 0045B51A    push        ebx
 0045B51B    push        esi
 0045B51C    push        edi
 0045B51D    mov         edi,ecx
 0045B51F    mov         esi,edx
 0045B521    mov         dword ptr [ebp-4],eax
 0045B524    mov         ebx,dword ptr [ebp+8]
 0045B527    call        user32.GetActiveWindow
 0045B52C    mov         dword ptr [ebp-0C],eax
 0045B52F    push        2
 0045B531    mov         eax,dword ptr [ebp-0C]
 0045B534    push        eax
 0045B535    mov         eax,[005AE418];^MonitorFromWindow:TMonitorFromWindow
 0045B53A    mov         eax,dword ptr [eax]
 0045B53C    call        eax
 0045B53E    mov         dword ptr [ebp-14],eax
 0045B541    push        2
 0045B543    mov         eax,dword ptr [ebp-4]
 0045B546    mov         eax,dword ptr [eax+30]
 0045B549    push        eax
 0045B54A    mov         eax,[005AE418];^MonitorFromWindow:TMonitorFromWindow
 0045B54F    mov         eax,dword ptr [eax]
 0045B551    call        eax
 0045B553    mov         dword ptr [ebp-18],eax
 0045B556    mov         eax,dword ptr [ebp-14]
 0045B559    cmp         eax,dword ptr [ebp-18]
>0045B55C    je          0045B5BE
 0045B55E    mov         dword ptr [ebp-44],28
 0045B565    lea         eax,[ebp-44]
 0045B568    push        eax
 0045B569    mov         eax,dword ptr [ebp-14]
 0045B56C    push        eax
 0045B56D    mov         eax,[005AE300];^GetMonitorInfo:TGetMonitorInfoA
 0045B572    mov         eax,dword ptr [eax]
 0045B574    call        eax
 0045B576    lea         eax,[ebp-54]
 0045B579    push        eax
 0045B57A    mov         eax,dword ptr [ebp-4]
 0045B57D    mov         eax,dword ptr [eax+30]
 0045B580    push        eax
 0045B581    call        user32.GetWindowRect
 0045B586    push        1D
 0045B588    push        0
 0045B58A    push        0
 0045B58C    mov         ecx,dword ptr [ebp-34]
 0045B58F    mov         edx,dword ptr [ebp-3C]
 0045B592    sub         ecx,edx
 0045B594    sar         ecx,1
>0045B596    jns         0045B59B
 0045B598    adc         ecx,0
 0045B59B    add         ecx,edx
 0045B59D    push        ecx
 0045B59E    mov         edx,dword ptr [ebp-38]
 0045B5A1    mov         eax,dword ptr [ebp-40]
 0045B5A4    sub         edx,eax
 0045B5A6    sar         edx,1
>0045B5A8    jns         0045B5AD
 0045B5AA    adc         edx,0
 0045B5AD    add         edx,eax
 0045B5AF    push        edx
 0045B5B0    push        0
 0045B5B2    mov         eax,dword ptr [ebp-4]
 0045B5B5    mov         eax,dword ptr [eax+30]
 0045B5B8    push        eax
 0045B5B9    call        user32.SetWindowPos
 0045B5BE    xor         eax,eax
 0045B5C0    call        DisableTaskWindows
 0045B5C5    mov         dword ptr [ebp-10],eax
 0045B5C8    call        SaveFocusState
 0045B5CD    mov         dword ptr [ebp-1C],eax
 0045B5D0    mov         eax,dword ptr [ebp-4]
 0045B5D3    call        TApplication.UseRightToLeftReading
 0045B5D8    test        al,al
>0045B5DA    je          0045B5E2
 0045B5DC    or          ebx,100000
 0045B5E2    xor         ecx,ecx
 0045B5E4    push        ebp
 0045B5E5    push        45B669
 0045B5EA    push        dword ptr fs:[ecx]
 0045B5ED    mov         dword ptr fs:[ecx],esp
 0045B5F0    push        ebx
 0045B5F1    push        edi
 0045B5F2    push        esi
 0045B5F3    mov         eax,dword ptr [ebp-4]
 0045B5F6    mov         eax,dword ptr [eax+30]
 0045B5F9    push        eax
 0045B5FA    call        user32.MessageBoxA
 0045B5FF    mov         dword ptr [ebp-8],eax
 0045B602    xor         eax,eax
 0045B604    pop         edx
 0045B605    pop         ecx
 0045B606    pop         ecx
 0045B607    mov         dword ptr fs:[eax],edx
 0045B60A    push        45B670
 0045B60F    mov         eax,dword ptr [ebp-14]
 0045B612    cmp         eax,dword ptr [ebp-18]
>0045B615    je          0045B64F
 0045B617    push        1D
 0045B619    push        0
 0045B61B    push        0
 0045B61D    mov         ecx,dword ptr [ebp-48]
 0045B620    mov         edx,dword ptr [ebp-50]
 0045B623    sub         ecx,edx
 0045B625    sar         ecx,1
>0045B627    jns         0045B62C
 0045B629    adc         ecx,0
 0045B62C    add         ecx,edx
 0045B62E    push        ecx
 0045B62F    mov         edx,dword ptr [ebp-4C]
 0045B632    mov         eax,dword ptr [ebp-54]
 0045B635    sub         edx,eax
 0045B637    sar         edx,1
>0045B639    jns         0045B63E
 0045B63B    adc         edx,0
 0045B63E    add         edx,eax
 0045B640    push        edx
 0045B641    push        0
 0045B643    mov         eax,dword ptr [ebp-4]
 0045B646    mov         eax,dword ptr [eax+30]
 0045B649    push        eax
 0045B64A    call        user32.SetWindowPos
 0045B64F    mov         eax,dword ptr [ebp-10]
 0045B652    call        EnableTaskWindows
 0045B657    mov         eax,dword ptr [ebp-0C]
 0045B65A    push        eax
 0045B65B    call        user32.SetActiveWindow
 0045B660    mov         eax,dword ptr [ebp-1C]
 0045B663    call        RestoreFocusState
 0045B668    ret
>0045B669    jmp         @HandleFinally
>0045B66E    jmp         0045B60F
 0045B670    mov         eax,dword ptr [ebp-8]
 0045B673    pop         edi
 0045B674    pop         esi
 0045B675    pop         ebx
 0045B676    mov         esp,ebp
 0045B678    pop         ebp
 0045B679    ret         4
*}
end;

//0045B67C
procedure TApplication.ShowException(E:Exception);
begin
{*
 0045B67C    push        ebp
 0045B67D    mov         ebp,esp
 0045B67F    add         esp,0FFFFFEF8
 0045B685    push        ebx
 0045B686    push        esi
 0045B687    xor         ecx,ecx
 0045B689    mov         dword ptr [ebp-108],ecx
 0045B68F    mov         dword ptr [ebp-4],ecx
 0045B692    mov         esi,edx
 0045B694    mov         ebx,eax
 0045B696    xor         eax,eax
 0045B698    push        ebp
 0045B699    push        45B737
 0045B69E    push        dword ptr fs:[eax]
 0045B6A1    mov         dword ptr fs:[eax],esp
 0045B6A4    lea         eax,[ebp-4]
 0045B6A7    mov         edx,dword ptr [esi+4]
 0045B6AA    call        @LStrLAsg
 0045B6AF    cmp         dword ptr [ebp-4],0
>0045B6B3    je          0045B6E9
 0045B6B5    mov         eax,dword ptr [ebp-4]
 0045B6B8    call        AnsiLastChar
 0045B6BD    mov         edx,eax
 0045B6BF    lea         eax,[ebp-104]
 0045B6C5    call        @_CToPasStr
 0045B6CA    lea         eax,[ebp-104]
 0045B6D0    mov         edx,45B744
 0045B6D5    call        @PStrCmp
>0045B6DA    jbe         0045B6E9
 0045B6DC    lea         eax,[ebp-4]
 0045B6DF    mov         edx,45B750;'.'
 0045B6E4    call        @LStrCat
 0045B6E9    push        10
 0045B6EB    lea         edx,[ebp-108]
 0045B6F1    mov         eax,ebx
 0045B6F3    call        TApplication.GetTitle
 0045B6F8    mov         eax,dword ptr [ebp-108]
 0045B6FE    call        @LStrToPChar
 0045B703    push        eax
 0045B704    mov         eax,dword ptr [ebp-4]
 0045B707    call        @LStrToPChar
 0045B70C    mov         edx,eax
 0045B70E    mov         eax,ebx
 0045B710    pop         ecx
 0045B711    call        TApplication.MessageBox
 0045B716    xor         eax,eax
 0045B718    pop         edx
 0045B719    pop         ecx
 0045B71A    pop         ecx
 0045B71B    mov         dword ptr fs:[eax],edx
 0045B71E    push        45B73E
 0045B723    lea         eax,[ebp-108]
 0045B729    call        @LStrClr
 0045B72E    lea         eax,[ebp-4]
 0045B731    call        @LStrClr
 0045B736    ret
>0045B737    jmp         @HandleFinally
>0045B73C    jmp         0045B723
 0045B73E    pop         esi
 0045B73F    pop         ebx
 0045B740    mov         esp,ebp
 0045B742    pop         ebp
 0045B743    ret
*}
end;

//0045B754
function TApplication.InvokeHelp(Command:Word; Data:Longint):Boolean;
begin
{*
 0045B754    push        ebx
 0045B755    push        esi
 0045B756    push        edi
 0045B757    push        ebp
 0045B758    add         esp,0FFFFFFF4
 0045B75B    mov         dword ptr [esp+4],ecx
 0045B75F    mov         word ptr [esp],dx
 0045B763    mov         esi,eax
 0045B765    xor         ebx,ebx
 0045B767    mov         byte ptr [esp+8],1
 0045B76C    mov         eax,[005E0CB0];Screen:TScreen
 0045B771    mov         edi,dword ptr [eax+68]
 0045B774    test        edi,edi
>0045B776    je          0045B7A0
 0045B778    cmp         word ptr [edi+2AA],0
>0045B780    je          0045B7A0
 0045B782    lea         eax,[esp+8]
 0045B786    push        eax
 0045B787    mov         ecx,dword ptr [esp+8]
 0045B78B    mov         dx,word ptr [esp+4]
 0045B790    mov         eax,dword ptr [edi+2AC]
 0045B796    call        dword ptr [edi+2A8]
 0045B79C    mov         ebx,eax
>0045B79E    jmp         0045B7C6
 0045B7A0    cmp         word ptr [esi+0F2],0
>0045B7A8    je          0045B7C6
 0045B7AA    lea         eax,[esp+8]
 0045B7AE    push        eax
 0045B7AF    mov         ecx,dword ptr [esp+8]
 0045B7B3    mov         dx,word ptr [esp+4]
 0045B7B8    mov         eax,dword ptr [esi+0F4]
 0045B7BE    call        dword ptr [esi+0F0]
 0045B7C4    mov         ebx,eax
 0045B7C6    test        edi,edi
>0045B7C8    je          0045B7F6
 0045B7CA    test        byte ptr [edi+1C],10
>0045B7CE    je          0045B7D5
 0045B7D0    mov         byte ptr [esp+8],0
 0045B7D5    mov         eax,edi
 0045B7D7    call        TWinControl.GetTabOrder
 0045B7DC    cmp         ax,0FFFFFFFF
>0045B7E0    jne         0045B7F6
 0045B7E2    cmp         byte ptr [edi+57],0
>0045B7E6    jne         0045B7F6
 0045B7E8    cmp         dword ptr [edi+220],0
>0045B7EF    jne         0045B7F6
 0045B7F1    mov         byte ptr [esp+8],0
 0045B7F6    cmp         byte ptr [esp+8],0
>0045B7FB    je          0045B8B2
 0045B801    test        bl,bl
>0045B803    jne         0045B8B2
 0045B809    test        edi,edi
>0045B80B    je          0045B853
 0045B80D    mov         eax,edi
 0045B80F    call        TWinControl.HandleAllocated
 0045B814    test        al,al
>0045B816    je          0045B853
 0045B818    cmp         dword ptr [edi+23C],0
>0045B81F    je          0045B853
 0045B821    mov         eax,edi
 0045B823    call        TWinControl.GetHandle
 0045B828    mov         ebp,eax
 0045B82A    mov         eax,esi
 0045B82C    call        TApplication.ValidateHelpSystem
 0045B831    test        al,al
>0045B833    je          0045B8B2
 0045B835    mov         ax,word ptr [esp]
 0045B839    push        eax
 0045B83A    mov         eax,dword ptr [esp+8]
 0045B83E    push        eax
 0045B83F    mov         ecx,dword ptr [edi+23C]
 0045B845    mov         edx,ebp
 0045B847    mov         eax,dword ptr [esi+4C]
 0045B84A    mov         ebx,dword ptr [eax]
 0045B84C    call        dword ptr [ebx+20]
 0045B84F    mov         ebx,eax
>0045B851    jmp         0045B8B2
 0045B853    cmp         dword ptr [esi+50],0
>0045B857    je          0045B890
 0045B859    mov         ebp,dword ptr [esi+30]
 0045B85C    mov         eax,dword ptr [esi+44]
 0045B85F    test        eax,eax
>0045B861    je          0045B86A
 0045B863    call        TWinControl.GetHandle
 0045B868    mov         ebp,eax
 0045B86A    mov         eax,esi
 0045B86C    call        TApplication.ValidateHelpSystem
 0045B871    test        al,al
>0045B873    je          0045B8B2
 0045B875    mov         ax,word ptr [esp]
 0045B879    push        eax
 0045B87A    mov         eax,dword ptr [esp+8]
 0045B87E    push        eax
 0045B87F    mov         ecx,dword ptr [esi+50]
 0045B882    mov         edx,ebp
 0045B884    mov         eax,dword ptr [esi+4C]
 0045B887    mov         ebx,dword ptr [eax]
 0045B889    call        dword ptr [ebx+20]
 0045B88C    mov         ebx,eax
>0045B88E    jmp         0045B8B2
 0045B890    cmp         byte ptr [esi+0A4],0
>0045B897    jne         0045B8B2
 0045B899    mov         eax,dword ptr [esp+4]
 0045B89D    push        eax
 0045B89E    movzx       eax,word ptr [esp+4]
 0045B8A3    push        eax
 0045B8A4    push        0B01F
 0045B8A9    mov         eax,dword ptr [esi+30]
 0045B8AC    push        eax
 0045B8AD    call        user32.PostMessageA
 0045B8B2    mov         eax,ebx
 0045B8B4    add         esp,0C
 0045B8B7    pop         ebp
 0045B8B8    pop         edi
 0045B8B9    pop         esi
 0045B8BA    pop         ebx
 0045B8BB    ret
*}
end;

//0045B8BC
function TApplication.HelpKeyword(const Keyword:AnsiString):Boolean;
begin
{*
 0045B8BC    push        ebp
 0045B8BD    mov         ebp,esp
 0045B8BF    push        0
 0045B8C1    push        ebx
 0045B8C2    push        esi
 0045B8C3    push        edi
 0045B8C4    mov         edi,edx
 0045B8C6    mov         esi,eax
 0045B8C8    xor         eax,eax
 0045B8CA    push        ebp
 0045B8CB    push        45B914
 0045B8D0    push        dword ptr fs:[eax]
 0045B8D3    mov         dword ptr fs:[eax],esp
 0045B8D6    mov         bl,1
 0045B8D8    mov         eax,esi
 0045B8DA    call        TApplication.ValidateHelpSystem
 0045B8DF    test        al,al
>0045B8E1    je          0045B8FC
 0045B8E3    lea         edx,[ebp-4]
 0045B8E6    mov         eax,esi
 0045B8E8    call        TApplication.GetCurrentHelpFile
 0045B8ED    mov         ecx,dword ptr [ebp-4]
 0045B8F0    mov         edx,edi
 0045B8F2    mov         eax,dword ptr [esi+4C]
 0045B8F5    mov         esi,dword ptr [eax]
 0045B8F7    call        dword ptr [esi+0C]
>0045B8FA    jmp         0045B8FE
 0045B8FC    xor         ebx,ebx
 0045B8FE    xor         eax,eax
 0045B900    pop         edx
 0045B901    pop         ecx
 0045B902    pop         ecx
 0045B903    mov         dword ptr fs:[eax],edx
 0045B906    push        45B91B
 0045B90B    lea         eax,[ebp-4]
 0045B90E    call        @LStrClr
 0045B913    ret
>0045B914    jmp         @HandleFinally
>0045B919    jmp         0045B90B
 0045B91B    mov         eax,ebx
 0045B91D    pop         edi
 0045B91E    pop         esi
 0045B91F    pop         ebx
 0045B920    pop         ecx
 0045B921    pop         ebp
 0045B922    ret
*}
end;

//0045B924
function TApplication.HelpContext(Context:THelpContext):Boolean;
begin
{*
 0045B924    push        ebp
 0045B925    mov         ebp,esp
 0045B927    push        0
 0045B929    push        ebx
 0045B92A    push        esi
 0045B92B    push        edi
 0045B92C    mov         edi,edx
 0045B92E    mov         esi,eax
 0045B930    xor         eax,eax
 0045B932    push        ebp
 0045B933    push        45B97C
 0045B938    push        dword ptr fs:[eax]
 0045B93B    mov         dword ptr fs:[eax],esp
 0045B93E    mov         bl,1
 0045B940    mov         eax,esi
 0045B942    call        TApplication.ValidateHelpSystem
 0045B947    test        al,al
>0045B949    je          0045B964
 0045B94B    lea         edx,[ebp-4]
 0045B94E    mov         eax,esi
 0045B950    call        TApplication.GetCurrentHelpFile
 0045B955    mov         ecx,dword ptr [ebp-4]
 0045B958    mov         edx,edi
 0045B95A    mov         eax,dword ptr [esi+4C]
 0045B95D    mov         esi,dword ptr [eax]
 0045B95F    call        dword ptr [esi+10]
>0045B962    jmp         0045B966
 0045B964    xor         ebx,ebx
 0045B966    xor         eax,eax
 0045B968    pop         edx
 0045B969    pop         ecx
 0045B96A    pop         ecx
 0045B96B    mov         dword ptr fs:[eax],edx
 0045B96E    push        45B983
 0045B973    lea         eax,[ebp-4]
 0045B976    call        @LStrClr
 0045B97B    ret
>0045B97C    jmp         @HandleFinally
>0045B981    jmp         0045B973
 0045B983    mov         eax,ebx
 0045B985    pop         edi
 0045B986    pop         esi
 0045B987    pop         ebx
 0045B988    pop         ecx
 0045B989    pop         ebp
 0045B98A    ret
*}
end;

//0045B98C
function TApplication.HelpCommand(Command:Integer; Data:Longint):Boolean;
begin
{*
 0045B98C    call        TApplication.InvokeHelp
 0045B991    ret
*}
end;

//0045B994
procedure TApplication.SetShowHint(Value:Boolean);
begin
{*
 0045B994    push        ebx
 0045B995    push        esi
 0045B996    mov         ebx,eax
 0045B998    cmp         dl,byte ptr [ebx+88]
>0045B99E    je          0045B9DF
 0045B9A0    mov         eax,edx
 0045B9A2    mov         byte ptr [ebx+88],al
 0045B9A8    test        al,al
>0045B9AA    je          0045B9CC
 0045B9AC    mov         ecx,ebx
 0045B9AE    mov         dl,1
 0045B9B0    mov         eax,[005ACDAC]
 0045B9B5    call        dword ptr [eax+2C]
 0045B9B8    mov         esi,eax
 0045B9BA    mov         dword ptr [ebx+84],esi
 0045B9C0    mov         edx,dword ptr [ebx+5C]
 0045B9C3    mov         eax,esi
 0045B9C5    call        TControl.SetColor
>0045B9CA    jmp         0045B9DF
 0045B9CC    mov         eax,dword ptr [ebx+84]
 0045B9D2    call        TObject.Free
 0045B9D7    xor         eax,eax
 0045B9D9    mov         dword ptr [ebx+84],eax
 0045B9DF    pop         esi
 0045B9E0    pop         ebx
 0045B9E1    ret
*}
end;

//0045B9E4
procedure TApplication.DoActionIdle;
begin
{*
 0045B9E4    push        ebx
 0045B9E5    push        esi
 0045B9E6    push        edi
 0045B9E7    mov         eax,[005E0CB0];Screen:TScreen
 0045B9EC    call        TScreen.GetCustomFormCount
 0045B9F1    mov         esi,eax
 0045B9F3    dec         esi
 0045B9F4    test        esi,esi
>0045B9F6    jl          0045BA44
 0045B9F8    inc         esi
 0045B9F9    xor         edi,edi
 0045B9FB    mov         edx,edi
 0045B9FD    mov         eax,[005E0CB0];Screen:TScreen
 0045BA02    call        TScreen.GetCustomForms
 0045BA07    mov         ebx,eax
 0045BA09    mov         eax,ebx
 0045BA0B    call        TWinControl.HandleAllocated
 0045BA10    test        al,al
>0045BA12    je          0045BA40
 0045BA14    mov         eax,ebx
 0045BA16    call        TWinControl.GetHandle
 0045BA1B    push        eax
 0045BA1C    call        user32.IsWindowVisible
 0045BA21    test        eax,eax
>0045BA23    je          0045BA40
 0045BA25    mov         eax,ebx
 0045BA27    call        TWinControl.GetHandle
 0045BA2C    push        eax
 0045BA2D    call        user32.IsWindowEnabled
 0045BA32    test        eax,eax
>0045BA34    je          0045BA40
 0045BA36    mov         eax,ebx
 0045BA38    mov         edx,dword ptr [eax]
 0045BA3A    call        dword ptr [edx+0DC]
 0045BA40    inc         edi
 0045BA41    dec         esi
>0045BA42    jne         0045B9FB
 0045BA44    pop         edi
 0045BA45    pop         esi
 0045BA46    pop         ebx
 0045BA47    ret
*}
end;

//0045BA48
function TApplication.DoMouseIdle:TControl;
begin
{*
 0045BA48    push        ebx
 0045BA49    push        esi
 0045BA4A    push        edi
 0045BA4B    add         esp,0FFFFFFF8
 0045BA4E    mov         ebx,eax
 0045BA50    push        esp
 0045BA51    call        user32.GetCursorPos
 0045BA56    mov         eax,esp
 0045BA58    mov         dl,1
 0045BA5A    call        FindDragTarget
 0045BA5F    mov         edi,eax
 0045BA61    call        GetCaptureControl
 0045BA66    mov         esi,eax
 0045BA68    cmp         edi,dword ptr [ebx+48]
>0045BA6B    je          0045BAB8
 0045BA6D    cmp         dword ptr [ebx+48],0
>0045BA71    je          0045BA77
 0045BA73    test        esi,esi
>0045BA75    je          0045BA80
 0045BA77    test        esi,esi
>0045BA79    je          0045BA91
 0045BA7B    cmp         esi,dword ptr [ebx+48]
>0045BA7E    jne         0045BA91
 0045BA80    push        0
 0045BA82    xor         ecx,ecx
 0045BA84    mov         edx,0B014
 0045BA89    mov         eax,dword ptr [ebx+48]
 0045BA8C    call        TControl.Perform
 0045BA91    mov         dword ptr [ebx+48],edi
 0045BA94    cmp         dword ptr [ebx+48],0
>0045BA98    je          0045BA9E
 0045BA9A    test        esi,esi
>0045BA9C    je          0045BAA7
 0045BA9E    test        esi,esi
>0045BAA0    je          0045BAB8
 0045BAA2    cmp         esi,dword ptr [ebx+48]
>0045BAA5    jne         0045BAB8
 0045BAA7    push        0
 0045BAA9    xor         ecx,ecx
 0045BAAB    mov         edx,0B013
 0045BAB0    mov         eax,dword ptr [ebx+48]
 0045BAB3    call        TControl.Perform
 0045BAB8    mov         eax,edi
 0045BABA    pop         ecx
 0045BABB    pop         edx
 0045BABC    pop         edi
 0045BABD    pop         esi
 0045BABE    pop         ebx
 0045BABF    ret
*}
end;

//0045BAC0
procedure TApplication.Idle(const Msg:TMsg);
begin
{*
 0045BAC0    push        ebp
 0045BAC1    mov         ebp,esp
 0045BAC3    add         esp,0FFFFFFF0
 0045BAC6    push        ebx
 0045BAC7    push        esi
 0045BAC8    push        edi
 0045BAC9    xor         ecx,ecx
 0045BACB    mov         dword ptr [ebp-0C],ecx
 0045BACE    mov         dword ptr [ebp-10],ecx
 0045BAD1    mov         dword ptr [ebp-4],eax
 0045BAD4    xor         eax,eax
 0045BAD6    push        ebp
 0045BAD7    push        45BBD0
 0045BADC    push        dword ptr fs:[eax]
 0045BADF    mov         dword ptr fs:[eax],esp
 0045BAE2    mov         eax,dword ptr [ebp-4]
 0045BAE5    call        TApplication.DoMouseIdle
 0045BAEA    mov         ebx,eax
 0045BAEC    mov         eax,dword ptr [ebp-4]
 0045BAEF    cmp         byte ptr [eax+88],0
>0045BAF6    je          0045BB09
 0045BAF8    mov         eax,dword ptr [ebp-4]
 0045BAFB    cmp         dword ptr [eax+48],0
>0045BAFF    jne         0045BB09
 0045BB01    mov         eax,dword ptr [ebp-4]
 0045BB04    call        TApplication.CancelHint
 0045BB09    lea         edx,[ebp-10]
 0045BB0C    mov         eax,ebx
 0045BB0E    call        GetHint
 0045BB13    mov         eax,dword ptr [ebp-10]
 0045BB16    lea         edx,[ebp-0C]
 0045BB19    call        GetLongHint
 0045BB1E    mov         edx,dword ptr [ebp-0C]
 0045BB21    mov         eax,[005E0CAC];Application:TApplication
 0045BB26    call        TApplication.SetHint
 0045BB2B    mov         byte ptr [ebp-5],1
 0045BB2F    xor         eax,eax
 0045BB31    push        ebp
 0045BB32    push        45BB77
 0045BB37    push        dword ptr fs:[eax]
 0045BB3A    mov         dword ptr fs:[eax],esp
 0045BB3D    mov         eax,dword ptr [ebp-4]
 0045BB40    cmp         word ptr [eax+102],0
>0045BB48    je          0045BB5F
 0045BB4A    lea         ecx,[ebp-5]
 0045BB4D    mov         ebx,dword ptr [ebp-4]
 0045BB50    mov         edx,dword ptr [ebp-4]
 0045BB53    mov         eax,dword ptr [ebx+104]
 0045BB59    call        dword ptr [ebx+100]
 0045BB5F    cmp         byte ptr [ebp-5],0
>0045BB63    je          0045BB6D
 0045BB65    mov         eax,dword ptr [ebp-4]
 0045BB68    call        TApplication.DoActionIdle
 0045BB6D    xor         eax,eax
 0045BB6F    pop         edx
 0045BB70    pop         ecx
 0045BB71    pop         ecx
 0045BB72    mov         dword ptr fs:[eax],edx
>0045BB75    jmp         0045BB8C
>0045BB77    jmp         @HandleAnyException
 0045BB7C    mov         edx,dword ptr [ebp-4]
 0045BB7F    mov         eax,dword ptr [ebp-4]
 0045BB82    call        TApplication.HandleException
 0045BB87    call        @DoneExcept
 0045BB8C    call        KERNEL32.GetCurrentThreadId
 0045BB91    mov         edx,dword ptr ds:[5AE80C];MainThreadID:Cardinal
 0045BB97    cmp         eax,dword ptr [edx]
>0045BB99    jne         0045BBAA
 0045BB9B    xor         eax,eax
 0045BB9D    call        CheckSynchronize
 0045BBA2    test        al,al
>0045BBA4    je          0045BBAA
 0045BBA6    mov         byte ptr [ebp-5],0
 0045BBAA    cmp         byte ptr [ebp-5],0
>0045BBAE    je          0045BBB5
 0045BBB0    call        user32.WaitMessage
 0045BBB5    xor         eax,eax
 0045BBB7    pop         edx
 0045BBB8    pop         ecx
 0045BBB9    pop         ecx
 0045BBBA    mov         dword ptr fs:[eax],edx
 0045BBBD    push        45BBD7
 0045BBC2    lea         eax,[ebp-10]
 0045BBC5    mov         edx,2
 0045BBCA    call        @LStrArrayClr
 0045BBCF    ret
>0045BBD0    jmp         @HandleFinally
>0045BBD5    jmp         0045BBC2
 0045BBD7    pop         edi
 0045BBD8    pop         esi
 0045BBD9    pop         ebx
 0045BBDA    mov         esp,ebp
 0045BBDC    pop         ebp
 0045BBDD    ret
*}
end;

//0045BBE0
procedure TApplication.NotifyForms(Msg:Word);
begin
{*
 0045BBE0    push        ebx
 0045BBE1    push        esi
 0045BBE2    push        edi
 0045BBE3    mov         edi,edx
 0045BBE5    mov         eax,[005E0CB0];Screen:TScreen
 0045BBEA    call        TScreen.GetFormCount
 0045BBEF    mov         ebx,eax
 0045BBF1    dec         ebx
 0045BBF2    test        ebx,ebx
>0045BBF4    jl          0045BC15
 0045BBF6    inc         ebx
 0045BBF7    xor         esi,esi
 0045BBF9    push        0
 0045BBFB    mov         edx,esi
 0045BBFD    mov         eax,[005E0CB0];Screen:TScreen
 0045BC02    call        TScreen.GetForm
 0045BC07    movzx       edx,di
 0045BC0A    xor         ecx,ecx
 0045BC0C    call        TControl.Perform
 0045BC11    inc         esi
 0045BC12    dec         ebx
>0045BC13    jne         0045BBF9
 0045BC15    pop         edi
 0045BC16    pop         esi
 0045BC17    pop         ebx
 0045BC18    ret
*}
end;

//0045BC1C
procedure TApplication.IconChanged(Sender:TObject);
begin
{*
 0045BC1C    push        ebx
 0045BC1D    mov         ebx,eax
 0045BC1F    mov         eax,[005AE3F0];^NewStyleControls:Boolean
 0045BC24    cmp         byte ptr [eax],0
>0045BC27    je          0045BC56
 0045BC29    mov         eax,ebx
 0045BC2B    call        TApplication.GetIconHandle
 0045BC30    push        eax
 0045BC31    push        1
 0045BC33    push        80
 0045BC38    mov         eax,dword ptr [ebx+30]
 0045BC3B    push        eax
 0045BC3C    call        user32.SendMessageA
 0045BC41    mov         eax,ebx
 0045BC43    call        TApplication.GetIconHandle
 0045BC48    push        eax
 0045BC49    push        0F2
 0045BC4B    mov         eax,dword ptr [ebx+30]
 0045BC4E    push        eax
 0045BC4F    call        user32.SetClassLongA
>0045BC54    jmp         0045BC70
 0045BC56    mov         eax,dword ptr [ebx+30]
 0045BC59    push        eax
 0045BC5A    call        user32.IsIconic
 0045BC5F    test        eax,eax
>0045BC61    je          0045BC70
 0045BC63    push        0FF
 0045BC65    push        0
 0045BC67    mov         eax,dword ptr [ebx+30]
 0045BC6A    push        eax
 0045BC6B    call        user32.InvalidateRect
 0045BC70    mov         dx,0B01D
 0045BC74    mov         eax,ebx
 0045BC76    call        TApplication.NotifyForms
 0045BC7B    pop         ebx
 0045BC7C    ret
*}
end;

//0045BC80
procedure TApplication.SetHint(const Value:AnsiString);
begin
{*
 0045BC80    push        ebp
 0045BC81    mov         ebp,esp
 0045BC83    push        ecx
 0045BC84    push        ebx
 0045BC85    push        esi
 0045BC86    mov         esi,edx
 0045BC88    mov         ebx,eax
 0045BC8A    mov         eax,dword ptr [ebx+54]
 0045BC8D    mov         edx,esi
 0045BC8F    call        @LStrCmp
>0045BC94    je          0045BD0C
 0045BC96    lea         eax,[ebx+54]
 0045BC99    mov         edx,esi
 0045BC9B    call        @LStrAsg
 0045BCA0    cmp         word ptr [ebx+0FA],0
>0045BCA8    je          0045BCBA
 0045BCAA    mov         edx,ebx
 0045BCAC    mov         eax,dword ptr [ebx+0FC]
 0045BCB2    call        dword ptr [ebx+0F8]
>0045BCB8    jmp         0045BD0C
 0045BCBA    mov         ecx,ebx
 0045BCBC    mov         dl,1
 0045BCBE    mov         eax,[00435CD8];THintAction
 0045BCC3    call        THintAction.Create
 0045BCC8    mov         dword ptr [ebp-4],eax
 0045BCCB    mov         edx,esi
 0045BCCD    mov         eax,dword ptr [ebp-4]
 0045BCD0    call        TCustomAction.SetHint
 0045BCD5    xor         eax,eax
 0045BCD7    push        ebp
 0045BCD8    push        45BD05
 0045BCDD    push        dword ptr fs:[eax]
 0045BCE0    mov         dword ptr fs:[eax],esp
 0045BCE3    mov         eax,dword ptr [ebp-4]
 0045BCE6    mov         si,0FFEF
 0045BCEA    call        @CallDynaInst
 0045BCEF    xor         eax,eax
 0045BCF1    pop         edx
 0045BCF2    pop         ecx
 0045BCF3    pop         ecx
 0045BCF4    mov         dword ptr fs:[eax],edx
 0045BCF7    push        45BD0C
 0045BCFC    mov         eax,dword ptr [ebp-4]
 0045BCFF    call        TObject.Free
 0045BD04    ret
>0045BD05    jmp         @HandleFinally
>0045BD0A    jmp         0045BCFC
 0045BD0C    pop         esi
 0045BD0D    pop         ebx
 0045BD0E    pop         ecx
 0045BD0F    pop         ebp
 0045BD10    ret
*}
end;

//0045BD14
procedure SetVisible(Value:Boolean);
begin
{*
 0045BD14    push        ebp
 0045BD15    mov         ebp,esp
 0045BD17    push        ebx
 0045BD18    mov         ebx,eax
 0045BD1A    mov         eax,dword ptr [ebp+8]
 0045BD1D    mov         eax,dword ptr [eax-4]
 0045BD20    mov         eax,dword ptr [eax+30]
 0045BD23    push        eax
 0045BD24    call        user32.IsWindowVisible
 0045BD29    cmp         eax,1
 0045BD2C    sbb         eax,eax
 0045BD2E    inc         eax
 0045BD2F    cmp         al,byte ptr ds:[5ACEC0]
>0045BD35    jne         0045BD6B
 0045BD37    cmp         bl,byte ptr ds:[5ACEC0]
>0045BD3D    je          0045BD6B
 0045BD3F    xor         eax,eax
 0045BD41    mov         al,bl
 0045BD43    movzx       eax,word ptr [eax*2+5ACEC4]
 0045BD4B    push        eax
 0045BD4C    push        0
 0045BD4E    push        0
 0045BD50    push        0
 0045BD52    push        0
 0045BD54    push        0
 0045BD56    mov         eax,dword ptr [ebp+8]
 0045BD59    mov         eax,dword ptr [eax-4]
 0045BD5C    mov         eax,dword ptr [eax+30]
 0045BD5F    push        eax
 0045BD60    call        user32.SetWindowPos
 0045BD65    mov         byte ptr ds:[5ACEC0],bl
 0045BD6B    pop         ebx
 0045BD6C    pop         ebp
 0045BD6D    ret
*}
end;

//0045BD70
procedure TApplication.UpdateVisible;
begin
{*
 0045BD70    push        ebp
 0045BD71    mov         ebp,esp
 0045BD73    push        ecx
 0045BD74    push        ebx
 0045BD75    push        esi
 0045BD76    push        edi
 0045BD77    mov         dword ptr [ebp-4],eax
 0045BD7A    mov         eax,dword ptr [ebp-4]
 0045BD7D    cmp         dword ptr [eax+30],0
>0045BD81    je          0045BDEF
 0045BD83    mov         eax,[005E0CB0];Screen:TScreen
 0045BD88    call        TScreen.GetFormCount
 0045BD8D    mov         esi,eax
 0045BD8F    dec         esi
 0045BD90    test        esi,esi
>0045BD92    jl          0045BDE6
 0045BD94    inc         esi
 0045BD95    xor         edi,edi
 0045BD97    mov         edx,edi
 0045BD99    mov         eax,[005E0CB0];Screen:TScreen
 0045BD9E    call        TScreen.GetForm
 0045BDA3    mov         ebx,eax
 0045BDA5    cmp         byte ptr [ebx+57],0
>0045BDA9    je          0045BDE2
 0045BDAB    cmp         dword ptr [ebx+190],0
>0045BDB2    je          0045BDD7
 0045BDB4    mov         eax,ebx
 0045BDB6    call        TWinControl.HandleAllocated
 0045BDBB    test        al,al
>0045BDBD    jne         0045BDD7
 0045BDBF    mov         eax,dword ptr [ebx+190]
 0045BDC5    push        eax
 0045BDC6    mov         eax,ebx
 0045BDC8    call        TWinControl.GetHandle
 0045BDCD    push        eax
 0045BDCE    call        user32.IsChild
 0045BDD3    test        eax,eax
>0045BDD5    jne         0045BDE2
 0045BDD7    push        ebp
 0045BDD8    mov         al,1
 0045BDDA    call        SetVisible
 0045BDDF    pop         ecx
>0045BDE0    jmp         0045BDEF
 0045BDE2    inc         edi
 0045BDE3    dec         esi
>0045BDE4    jne         0045BD97
 0045BDE6    push        ebp
 0045BDE7    xor         eax,eax
 0045BDE9    call        SetVisible
 0045BDEE    pop         ecx
 0045BDEF    pop         edi
 0045BDF0    pop         esi
 0045BDF1    pop         ebx
 0045BDF2    pop         ecx
 0045BDF3    pop         ebp
 0045BDF4    ret
*}
end;

//0045BDF8
function TApplication.ValidateHelpSystem:Boolean;
begin
{*
 0045BDF8    push        ebx
 0045BDF9    push        esi
 0045BDFA    mov         esi,eax
 0045BDFC    xor         ebx,ebx
 0045BDFE    cmp         dword ptr [esi+4C],0
>0045BE02    jne         0045BE11
 0045BE04    lea         eax,[esi+4C]
 0045BE07    call        @IntfClear
 0045BE0C    call        GetHelpSystem
 0045BE11    cmp         dword ptr [esi+4C],0
>0045BE15    je          0045BE19
 0045BE17    mov         bl,1
 0045BE19    mov         eax,ebx
 0045BE1B    pop         esi
 0045BE1C    pop         ebx
 0045BE1D    ret
*}
end;

//0045BE20
procedure TApplication.StartHintTimer(Value:Integer; TimerMode:TTimerMode);
begin
{*
 0045BE20    push        ebx
 0045BE21    push        esi
 0045BE22    push        edi
 0045BE23    mov         ebx,ecx
 0045BE25    mov         esi,edx
 0045BE27    mov         edi,eax
 0045BE29    mov         eax,edi
 0045BE2B    call        TApplication.StopHintTimer
 0045BE30    push        459AA8;HintTimerProc
 0045BE35    push        esi
 0045BE36    push        0
 0045BE38    push        0
 0045BE3A    call        user32.SetTimer
 0045BE3F    mov         word ptr [edi+8A],ax
 0045BE46    mov         byte ptr [edi+89],bl
 0045BE4C    cmp         word ptr [edi+8A],0
>0045BE54    jne         0045BE5D
 0045BE56    mov         eax,edi
 0045BE58    call        TApplication.CancelHint
 0045BE5D    pop         edi
 0045BE5E    pop         esi
 0045BE5F    pop         ebx
 0045BE60    ret
*}
end;

//0045BE64
procedure TApplication.StopHintTimer;
begin
{*
 0045BE64    push        ebx
 0045BE65    mov         ebx,eax
 0045BE67    mov         ax,word ptr [ebx+8A]
 0045BE6E    test        ax,ax
>0045BE71    je          0045BE87
 0045BE73    movzx       eax,ax
 0045BE76    push        eax
 0045BE77    push        0
 0045BE79    call        user32.KillTimer
 0045BE7E    mov         word ptr [ebx+8A],0
 0045BE87    pop         ebx
 0045BE88    ret
*}
end;

//0045BE8C
procedure TApplication.HintMouseMessage(Control:TControl; var Message:TMessage);
begin
{*
 0045BE8C    push        ebx
 0045BE8D    push        esi
 0045BE8E    push        edi
 0045BE8F    push        ebp
 0045BE90    add         esp,0FFFFFFE0
 0045BE93    mov         ebp,ecx
 0045BE95    mov         edi,edx
 0045BE97    mov         esi,eax
 0045BE99    lea         edx,[esp+18]
 0045BE9D    mov         eax,dword ptr [ebp+8]
 0045BEA0    call        SmallPointToPoint
 0045BEA5    lea         edx,[esp+18]
 0045BEA9    lea         ecx,[esp+10]
 0045BEAD    mov         eax,edi
 0045BEAF    call        TControl.ClientToScreen
 0045BEB4    lea         eax,[esp+10]
 0045BEB8    mov         dl,1
 0045BEBA    call        FindDragTarget
 0045BEBF    call        GetHintControl
 0045BEC4    mov         ebx,eax
 0045BEC6    test        ebx,ebx
>0045BEC8    je          0045BED3
 0045BECA    cmp         byte ptr [ebx+99],0
>0045BED1    jne         0045BEDF
 0045BED3    mov         eax,esi
 0045BED5    call        TApplication.CancelHint
>0045BEDA    jmp         0045BF93
 0045BEDF    cmp         ebx,dword ptr [esi+60]
>0045BEE2    jne         0045BF14
 0045BEE4    lea         edx,[esp+18]
 0045BEE8    mov         eax,dword ptr [ebp+8]
 0045BEEB    call        SmallPointToPoint
 0045BEF0    lea         edx,[esp+18]
 0045BEF4    lea         ecx,[esp+10]
 0045BEF8    mov         eax,edi
 0045BEFA    call        TControl.ClientToScreen
 0045BEFF    push        dword ptr [esp+14]
 0045BF03    push        dword ptr [esp+14]
 0045BF07    lea         eax,[esi+64]
 0045BF0A    push        eax
 0045BF0B    call        user32.PtInRect
 0045BF10    test        eax,eax
>0045BF12    jne         0045BF93
 0045BF14    mov         al,byte ptr [esi+58]
 0045BF17    mov         byte ptr [esp+4],al
 0045BF1B    cmp         byte ptr [esp+4],0
>0045BF20    je          0045BF2D
 0045BF22    mov         eax,dword ptr [esi+80]
 0045BF28    mov         dword ptr [esp],eax
>0045BF2B    jmp         0045BF33
 0045BF2D    mov         eax,dword ptr [esi+78]
 0045BF30    mov         dword ptr [esp],eax
 0045BF33    mov         eax,esp
 0045BF35    push        eax
 0045BF36    xor         ecx,ecx
 0045BF38    mov         cl,byte ptr [esp+8]
 0045BF3C    mov         edx,0B041
 0045BF41    mov         eax,ebx
 0045BF43    call        TControl.Perform
 0045BF48    cmp         byte ptr [esp+4],0
>0045BF4D    je          0045BF76
 0045BF4F    cmp         dword ptr [esp],0
>0045BF53    jne         0045BF76
 0045BF55    mov         al,byte ptr [esp+4]
 0045BF59    mov         byte ptr [esi+58],al
 0045BF5C    mov         dword ptr [esi+60],ebx
 0045BF5F    lea         eax,[esp+5]
 0045BF63    push        eax
 0045BF64    call        user32.GetCursorPos
 0045BF69    lea         edx,[esp+5]
 0045BF6D    mov         eax,esi
 0045BF6F    call        TApplication.ActivateHint
>0045BF74    jmp         0045BF93
 0045BF76    mov         eax,esi
 0045BF78    call        TApplication.CancelHint
 0045BF7D    mov         al,byte ptr [esp+4]
 0045BF81    mov         byte ptr [esi+58],al
 0045BF84    mov         dword ptr [esi+60],ebx
 0045BF87    xor         ecx,ecx
 0045BF89    mov         edx,dword ptr [esp]
 0045BF8C    mov         eax,esi
 0045BF8E    call        TApplication.StartHintTimer
 0045BF93    add         esp,20
 0045BF96    pop         ebp
 0045BF97    pop         edi
 0045BF98    pop         esi
 0045BF99    pop         ebx
 0045BF9A    ret
*}
end;

//0045BF9C
procedure TApplication.HintTimerExpired;
begin
{*
 0045BF9C    push        ebx
 0045BF9D    add         esp,0FFFFFFF8
 0045BFA0    mov         ebx,eax
 0045BFA2    mov         eax,ebx
 0045BFA4    call        TApplication.StopHintTimer
 0045BFA9    mov         al,byte ptr [ebx+89]
 0045BFAF    sub         al,1
>0045BFB1    jb          0045BFBE
>0045BFB3    jne         0045BFCD
 0045BFB5    mov         eax,ebx
 0045BFB7    call        TApplication.HideHint
>0045BFBC    jmp         0045BFCD
 0045BFBE    push        esp
 0045BFBF    call        user32.GetCursorPos
 0045BFC4    mov         edx,esp
 0045BFC6    mov         eax,ebx
 0045BFC8    call        TApplication.ActivateHint
 0045BFCD    pop         ecx
 0045BFCE    pop         edx
 0045BFCF    pop         ebx
 0045BFD0    ret
*}
end;

//0045BFD4
procedure TApplication.HideHint;
begin
{*
 0045BFD4    push        ebx
 0045BFD5    push        esi
 0045BFD6    mov         ebx,eax
 0045BFD8    mov         esi,dword ptr [ebx+84]
 0045BFDE    test        esi,esi
>0045BFE0    je          0045C015
 0045BFE2    mov         eax,esi
 0045BFE4    call        TWinControl.HandleAllocated
 0045BFE9    test        al,al
>0045BFEB    je          0045C015
 0045BFED    mov         eax,dword ptr [ebx+84]
 0045BFF3    call        TWinControl.GetHandle
 0045BFF8    push        eax
 0045BFF9    call        user32.IsWindowVisible
 0045BFFE    test        eax,eax
>0045C000    je          0045C015
 0045C002    push        0
 0045C004    mov         eax,dword ptr [ebx+84]
 0045C00A    call        TWinControl.GetHandle
 0045C00F    push        eax
 0045C010    call        user32.ShowWindow
 0045C015    pop         esi
 0045C016    pop         ebx
 0045C017    ret
*}
end;

//0045C018
procedure TApplication.CancelHint;
begin
{*
 0045C018    push        ebx
 0045C019    mov         ebx,eax
 0045C01B    cmp         dword ptr [ebx+60],0
>0045C01F    je          0045C03D
 0045C021    mov         eax,ebx
 0045C023    call        TApplication.HideHint
 0045C028    xor         eax,eax
 0045C02A    mov         dword ptr [ebx+60],eax
 0045C02D    mov         byte ptr [ebx+58],0
 0045C031    call        UnhookHintHooks
 0045C036    mov         eax,ebx
 0045C038    call        TApplication.StopHintTimer
 0045C03D    pop         ebx
 0045C03E    ret
*}
end;

//0045C040
function FindScanline(Source:Pointer; MaxLen:Cardinal; Value:Cardinal):Cardinal;
begin
{*
 0045C040    push        ecx
 0045C041    mov         ecx,edx
 0045C043    mov         edx,edi
 0045C045    mov         edi,eax
 0045C047    pop         eax
 0045C048    repe scas   byte ptr [edi]
 0045C04A    mov         eax,ecx
 0045C04C    mov         edi,edx
 0045C04E    ret
*}
end;

//0045C050
function GetCursorHeightMargin:Integer;
begin
{*
 0045C050    push        ebp
 0045C051    mov         ebp,esp
 0045C053    add         esp,0FFFFFFD8
 0045C056    push        ebx
 0045C057    push        esi
 0045C058    push        edi
 0045C059    push        0E
 0045C05B    mov         eax,[005AE32C]
 0045C060    mov         eax,dword ptr [eax]
 0045C062    call        eax
 0045C064    mov         dword ptr [ebp-4],eax
 0045C067    lea         eax,[ebp-28]
 0045C06A    push        eax
 0045C06B    call        user32.GetCursor
 0045C070    push        eax
 0045C071    call        user32.GetIconInfo
 0045C076    test        eax,eax
>0045C078    je          0045C199
 0045C07E    xor         edx,edx
 0045C080    push        ebp
 0045C081    push        45C192
 0045C086    push        dword ptr fs:[edx]
 0045C089    mov         dword ptr fs:[edx],esp
 0045C08C    lea         ecx,[ebp-0C]
 0045C08F    lea         edx,[ebp-8]
 0045C092    mov         eax,dword ptr [ebp-1C]
 0045C095    call        GetDIBSizes
 0045C09A    mov         eax,dword ptr [ebp-8]
 0045C09D    add         eax,dword ptr [ebp-0C]
 0045C0A0    call        AllocMem
 0045C0A5    mov         dword ptr [ebp-10],eax
 0045C0A8    xor         edx,edx
 0045C0AA    push        ebp
 0045C0AB    push        45C163
 0045C0B0    push        dword ptr fs:[edx]
 0045C0B3    mov         dword ptr fs:[edx],esp
 0045C0B6    mov         ebx,dword ptr [ebp-10]
 0045C0B9    add         ebx,dword ptr [ebp-8]
 0045C0BC    push        ebx
 0045C0BD    mov         esi,dword ptr [ebp-10]
 0045C0C0    mov         ecx,esi
 0045C0C2    xor         edx,edx
 0045C0C4    mov         eax,dword ptr [ebp-1C]
 0045C0C7    call        GetDIB
 0045C0CC    test        al,al
>0045C0CE    je          0045C147
 0045C0D0    mov         eax,dword ptr [ebp-10]
 0045C0D3    cmp         word ptr [eax+0E],1
>0045C0D8    jne         0045C147
 0045C0DA    mov         eax,dword ptr [esi+4]
 0045C0DD    mov         edx,eax
 0045C0DF    movzx       ecx,word ptr [esi+0E]
 0045C0E3    imul        edx,ecx
 0045C0E6    add         edx,1F
 0045C0E9    and         edx,0FFFFFFE0
 0045C0EC    test        edx,edx
>0045C0EE    jns         0045C0F3
 0045C0F0    add         edx,7
 0045C0F3    sar         edx,3
 0045C0F6    mov         dword ptr [ebp-14],edx
 0045C0F9    mov         edi,eax
 0045C0FB    imul        edi,dword ptr [ebp-14]
 0045C0FF    add         ebx,dword ptr [ebp-0C]
 0045C102    sub         ebx,edi
 0045C104    mov         ecx,0FF
 0045C109    mov         edx,edi
 0045C10B    mov         eax,ebx
 0045C10D    call        FindScanline
 0045C112    mov         dword ptr [ebp-4],eax
 0045C115    cmp         dword ptr [ebp-4],0
>0045C119    jne         0045C137
 0045C11B    mov         eax,dword ptr [esi+8]
 0045C11E    mov         edx,dword ptr [esi+4]
 0045C121    add         edx,edx
 0045C123    cmp         eax,edx
>0045C125    jl          0045C137
 0045C127    mov         eax,ebx
 0045C129    sub         eax,edi
 0045C12B    xor         ecx,ecx
 0045C12D    mov         edx,edi
 0045C12F    call        FindScanline
 0045C134    mov         dword ptr [ebp-4],eax
 0045C137    mov         eax,dword ptr [ebp-4]
 0045C13A    cdq
 0045C13B    idiv        eax,dword ptr [ebp-14]
 0045C13E    mov         dword ptr [ebp-4],eax
 0045C141    mov         eax,dword ptr [ebp-20]
 0045C144    sub         dword ptr [ebp-4],eax
 0045C147    xor         eax,eax
 0045C149    pop         edx
 0045C14A    pop         ecx
 0045C14B    pop         ecx
 0045C14C    mov         dword ptr fs:[eax],edx
 0045C14F    push        45C16A
 0045C154    mov         edx,dword ptr [ebp-8]
 0045C157    add         edx,dword ptr [ebp-0C]
 0045C15A    mov         eax,dword ptr [ebp-10]
 0045C15D    call        @FreeMem
 0045C162    ret
>0045C163    jmp         @HandleFinally
>0045C168    jmp         0045C154
 0045C16A    xor         eax,eax
 0045C16C    pop         edx
 0045C16D    pop         ecx
 0045C16E    pop         ecx
 0045C16F    mov         dword ptr fs:[eax],edx
 0045C172    push        45C199
 0045C177    mov         eax,dword ptr [ebp-18]
 0045C17A    test        eax,eax
>0045C17C    je          0045C184
 0045C17E    push        eax
 0045C17F    call        gdi32.DeleteObject
 0045C184    mov         eax,dword ptr [ebp-1C]
 0045C187    test        eax,eax
>0045C189    je          0045C191
 0045C18B    push        eax
 0045C18C    call        gdi32.DeleteObject
 0045C191    ret
>0045C192    jmp         @HandleFinally
>0045C197    jmp         0045C177
 0045C199    mov         eax,dword ptr [ebp-4]
 0045C19C    pop         edi
 0045C19D    pop         esi
 0045C19E    pop         ebx
 0045C19F    mov         esp,ebp
 0045C1A1    pop         ebp
 0045C1A2    ret
*}
end;

//0045C1A4
procedure ValidateHintWindow(HintClass:THintWindowClass);
begin
{*
 0045C1A4    push        ebp
 0045C1A5    mov         ebp,esp
 0045C1A7    push        ebx
 0045C1A8    push        esi
 0045C1A9    mov         ebx,eax
 0045C1AB    test        ebx,ebx
>0045C1AD    jne         0045C1B5
 0045C1AF    mov         ebx,dword ptr ds:[5ACDAC]
 0045C1B5    mov         eax,dword ptr [ebp+8]
 0045C1B8    mov         eax,dword ptr [eax-4]
 0045C1BB    mov         esi,dword ptr [eax+84]
 0045C1C1    test        esi,esi
>0045C1C3    je          0045C1D3
 0045C1C5    mov         eax,dword ptr [ebp+8]
 0045C1C8    mov         eax,esi
 0045C1CA    call        TObject.ClassType
 0045C1CF    cmp         ebx,eax
>0045C1D1    je          0045C1FD
 0045C1D3    mov         eax,dword ptr [ebp+8]
 0045C1D6    mov         eax,dword ptr [eax-4]
 0045C1D9    mov         eax,dword ptr [eax+84]
 0045C1DF    call        TObject.Free
 0045C1E4    mov         eax,dword ptr [ebp+8]
 0045C1E7    mov         ecx,dword ptr [eax-4]
 0045C1EA    mov         dl,1
 0045C1EC    mov         eax,ebx
 0045C1EE    call        dword ptr [eax+2C]
 0045C1F1    mov         edx,dword ptr [ebp+8]
 0045C1F4    mov         edx,dword ptr [edx-4]
 0045C1F7    mov         dword ptr [edx+84],eax
 0045C1FD    pop         esi
 0045C1FE    pop         ebx
 0045C1FF    pop         ebp
 0045C200    ret
*}
end;

//0045C204
function MultiLineWidth(const Value:AnsiString):Integer;
begin
{*
 0045C204    push        ebp
 0045C205    mov         ebp,esp
 0045C207    add         esp,0FFFFFFF8
 0045C20A    push        ebx
 0045C20B    push        esi
 0045C20C    xor         edx,edx
 0045C20E    mov         dword ptr [ebp-8],edx
 0045C211    xor         edx,edx
 0045C213    push        ebp
 0045C214    push        45C29E
 0045C219    push        dword ptr fs:[edx]
 0045C21C    mov         dword ptr fs:[edx],esp
 0045C21F    xor         edx,edx
 0045C221    mov         dword ptr [ebp-4],edx
 0045C224    mov         ebx,eax
 0045C226    test        ebx,ebx
>0045C228    je          0045C288
>0045C22A    jmp         0045C283
 0045C22C    mov         esi,ebx
>0045C22E    jmp         0045C239
 0045C230    mov         eax,ebx
 0045C232    call        StrNextChar
 0045C237    mov         ebx,eax
 0045C239    mov         al,byte ptr [ebx]
 0045C23B    test        al,al
>0045C23D    je          0045C247
 0045C23F    sub         al,0A
>0045C241    je          0045C247
 0045C243    sub         al,3
>0045C245    jne         0045C230
 0045C247    mov         ecx,ebx
 0045C249    sub         ecx,esi
 0045C24B    lea         eax,[ebp-8]
 0045C24E    mov         edx,esi
 0045C250    call        @LStrFromPCharLen
 0045C255    mov         eax,dword ptr [ebp+8]
 0045C258    mov         eax,dword ptr [eax-4]
 0045C25B    mov         eax,dword ptr [eax+84]
 0045C261    mov         eax,dword ptr [eax+208]
 0045C267    mov         edx,dword ptr [ebp-8]
 0045C26A    call        TCanvas.TextWidth
 0045C26F    cmp         eax,dword ptr [ebp-4]
>0045C272    jle         0045C277
 0045C274    mov         dword ptr [ebp-4],eax
 0045C277    cmp         byte ptr [ebx],0D
>0045C27A    jne         0045C27D
 0045C27C    inc         ebx
 0045C27D    cmp         byte ptr [ebx],0A
>0045C280    jne         0045C283
 0045C282    inc         ebx
 0045C283    cmp         byte ptr [ebx],0
>0045C286    jne         0045C22C
 0045C288    xor         eax,eax
 0045C28A    pop         edx
 0045C28B    pop         ecx
 0045C28C    pop         ecx
 0045C28D    mov         dword ptr fs:[eax],edx
 0045C290    push        45C2A5
 0045C295    lea         eax,[ebp-8]
 0045C298    call        @LStrClr
 0045C29D    ret
>0045C29E    jmp         @HandleFinally
>0045C2A3    jmp         0045C295
 0045C2A5    mov         eax,dword ptr [ebp-4]
 0045C2A8    pop         esi
 0045C2A9    pop         ebx
 0045C2AA    pop         ecx
 0045C2AB    pop         ecx
 0045C2AC    pop         ebp
 0045C2AD    ret
*}
end;

//0045C2B0
procedure TApplication.ActivateHint(CursorPos:TPoint);
begin
{*
 0045C2B0    push        ebp
 0045C2B1    mov         ebp,esp
 0045C2B3    add         esp,0FFFFFF70
 0045C2B9    push        ebx
 0045C2BA    push        esi
 0045C2BB    push        edi
 0045C2BC    xor         ecx,ecx
 0045C2BE    mov         dword ptr [ebp-8C],ecx
 0045C2C4    mov         dword ptr [ebp-90],ecx
 0045C2CA    mov         esi,edx
 0045C2CC    lea         edi,[ebp-0C]
 0045C2CF    movs        dword ptr [edi],dword ptr [esi]
 0045C2D0    movs        dword ptr [edi],dword ptr [esi]
 0045C2D1    mov         dword ptr [ebp-4],eax
 0045C2D4    lea         eax,[ebp-60]
 0045C2D7    mov         edx,dword ptr ds:[452088];THintInfo
 0045C2DD    call        @AddRefRecord
 0045C2E2    lea         ebx,[ebp-4]
 0045C2E5    xor         eax,eax
 0045C2E7    push        ebp
 0045C2E8    push        45C636
 0045C2ED    push        dword ptr fs:[eax]
 0045C2F0    mov         dword ptr fs:[eax],esp
 0045C2F3    mov         eax,dword ptr [ebx]
 0045C2F5    mov         byte ptr [eax+58],0
 0045C2F9    mov         eax,dword ptr [ebx]
 0045C2FB    cmp         byte ptr [eax+88],0
>0045C302    je          0045C5EF
 0045C308    mov         eax,dword ptr [ebx]
 0045C30A    cmp         dword ptr [eax+60],0
>0045C30E    je          0045C5EF
 0045C314    call        ForegroundTask
 0045C319    test        al,al
>0045C31B    je          0045C5EF
 0045C321    lea         eax,[ebp-0C]
 0045C324    mov         dl,1
 0045C326    call        FindDragTarget
 0045C32B    call        GetHintControl
 0045C330    mov         edx,dword ptr [ebx]
 0045C332    cmp         eax,dword ptr [edx+60]
>0045C335    jne         0045C5EF
 0045C33B    mov         eax,dword ptr [ebx]
 0045C33D    mov         eax,dword ptr [eax+60]
 0045C340    mov         dword ptr [ebp-60],eax
 0045C343    mov         eax,dword ptr [ebp-0C]
 0045C346    mov         dword ptr [ebp-58],eax
 0045C349    mov         eax,dword ptr [ebp-8]
 0045C34C    mov         dword ptr [ebp-54],eax
 0045C34F    call        GetCursorHeightMargin
 0045C354    add         dword ptr [ebp-54],eax
 0045C357    mov         eax,[005E0CB0];Screen:TScreen
 0045C35C    call        TScreen.GetWidth
 0045C361    mov         dword ptr [ebp-50],eax
 0045C364    mov         eax,dword ptr [ebx]
 0045C366    mov         eax,dword ptr [eax+5C]
 0045C369    mov         dword ptr [ebp-4C],eax
 0045C36C    lea         edx,[ebp-80]
 0045C36F    mov         eax,dword ptr [ebx]
 0045C371    mov         eax,dword ptr [eax+60]
 0045C374    call        TControl.GetBoundsRect
 0045C379    lea         esi,[ebp-80]
 0045C37C    lea         edi,[ebp-48]
 0045C37F    movs        dword ptr [edi],dword ptr [esi]
 0045C380    movs        dword ptr [edi],dword ptr [esi]
 0045C381    movs        dword ptr [edi],dword ptr [esi]
 0045C382    movs        dword ptr [edi],dword ptr [esi]
 0045C383    lea         edx,[ebp-14]
 0045C386    mov         eax,dword ptr [ebx]
 0045C388    mov         eax,dword ptr [eax+60]
 0045C38B    mov         ecx,dword ptr [eax]
 0045C38D    call        dword ptr [ecx+40]
 0045C390    xor         eax,eax
 0045C392    mov         dword ptr [ebp-1C],eax
 0045C395    xor         eax,eax
 0045C397    mov         dword ptr [ebp-18],eax
 0045C39A    mov         eax,dword ptr [ebx]
 0045C39C    mov         eax,dword ptr [eax+60]
 0045C39F    mov         esi,dword ptr [eax+30]
 0045C3A2    test        esi,esi
>0045C3A4    je          0045C3B2
 0045C3A6    lea         edx,[ebp-1C]
 0045C3A9    mov         eax,esi
 0045C3AB    mov         ecx,dword ptr [eax]
 0045C3AD    call        dword ptr [ecx+40]
>0045C3B0    jmp         0045C3E1
 0045C3B2    mov         eax,dword ptr [ebx]
 0045C3B4    mov         esi,dword ptr [eax+60]
 0045C3B7    mov         eax,esi
 0045C3B9    mov         edx,dword ptr ds:[4380F4];TWinControl
 0045C3BF    call        @IsClass
 0045C3C4    test        al,al
>0045C3C6    je          0045C3E1
 0045C3C8    cmp         dword ptr [esi+190],0
>0045C3CF    je          0045C3E1
 0045C3D1    lea         eax,[ebp-1C]
 0045C3D4    push        eax
 0045C3D5    mov         eax,dword ptr [esi+190]
 0045C3DB    push        eax
 0045C3DC    call        user32.ClientToScreen
 0045C3E1    mov         eax,dword ptr [ebp-18]
 0045C3E4    sub         eax,dword ptr [ebp-10]
 0045C3E7    push        eax
 0045C3E8    mov         eax,dword ptr [ebp-1C]
 0045C3EB    sub         eax,dword ptr [ebp-14]
 0045C3EE    push        eax
 0045C3EF    lea         eax,[ebp-48]
 0045C3F2    push        eax
 0045C3F3    call        user32.OffsetRect
 0045C3F8    lea         ecx,[ebp-88]
 0045C3FE    lea         edx,[ebp-0C]
 0045C401    mov         eax,dword ptr [ebx]
 0045C403    mov         eax,dword ptr [eax+60]
 0045C406    call        TControl.ScreenToClient
 0045C40B    mov         eax,dword ptr [ebp-88]
 0045C411    mov         dword ptr [ebp-38],eax
 0045C414    mov         eax,dword ptr [ebp-84]
 0045C41A    mov         dword ptr [ebp-34],eax
 0045C41D    lea         edx,[ebp-90]
 0045C423    mov         eax,dword ptr [ebx]
 0045C425    mov         eax,dword ptr [eax+60]
 0045C428    call        GetHint
 0045C42D    mov         eax,dword ptr [ebp-90]
 0045C433    lea         edx,[ebp-8C]
 0045C439    call        GetShortHint
 0045C43E    mov         edx,dword ptr [ebp-8C]
 0045C444    lea         eax,[ebp-28]
 0045C447    call        @LStrLAsg
 0045C44C    xor         eax,eax
 0045C44E    mov         dword ptr [ebp-30],eax
 0045C451    mov         eax,dword ptr [ebx]
 0045C453    mov         eax,dword ptr [eax+74]
 0045C456    mov         dword ptr [ebp-2C],eax
 0045C459    mov         eax,[005ACDAC]
 0045C45E    mov         dword ptr [ebp-5C],eax
 0045C461    xor         eax,eax
 0045C463    mov         dword ptr [ebp-24],eax
 0045C466    lea         eax,[ebp-60]
 0045C469    push        eax
 0045C46A    mov         eax,dword ptr [ebx]
 0045C46C    mov         eax,dword ptr [eax+60]
 0045C46F    xor         ecx,ecx
 0045C471    mov         edx,0B030
 0045C476    call        TControl.Perform
 0045C47B    test        eax,eax
 0045C47D    sete        byte ptr [ebp-1D]
 0045C481    cmp         byte ptr [ebp-1D],0
>0045C485    je          0045C4AB
 0045C487    mov         eax,dword ptr [ebx]
 0045C489    cmp         word ptr [eax+132],0
>0045C491    je          0045C4AB
 0045C493    lea         eax,[ebp-60]
 0045C496    push        eax
 0045C497    lea         ecx,[ebp-1D]
 0045C49A    lea         edx,[ebp-28]
 0045C49D    mov         esi,dword ptr [ebx]
 0045C49F    mov         eax,dword ptr [esi+134]
 0045C4A5    call        dword ptr [esi+130]
 0045C4AB    cmp         byte ptr [ebp-1D],0
>0045C4AF    je          0045C4B9
 0045C4B1    mov         eax,dword ptr [ebx]
 0045C4B3    cmp         dword ptr [eax+60],0
>0045C4B7    jne         0045C4BD
 0045C4B9    xor         eax,eax
>0045C4BB    jmp         0045C4BF
 0045C4BD    mov         al,1
 0045C4BF    mov         edx,dword ptr [ebx]
 0045C4C1    mov         byte ptr [edx+58],al
 0045C4C4    mov         eax,dword ptr [ebx]
 0045C4C6    cmp         byte ptr [eax+58],0
>0045C4CA    je          0045C5EF
 0045C4D0    cmp         dword ptr [ebp-28],0
>0045C4D4    je          0045C5EF
 0045C4DA    push        ebp
 0045C4DB    mov         eax,dword ptr [ebp-5C]
 0045C4DE    call        ValidateHintWindow
 0045C4E3    pop         ecx
 0045C4E4    mov         eax,dword ptr [ebx]
 0045C4E6    mov         eax,dword ptr [eax+60]
 0045C4E9    mov         dl,byte ptr [eax+5F]
 0045C4EC    mov         eax,dword ptr [ebx]
 0045C4EE    mov         eax,dword ptr [eax+84]
 0045C4F4    mov         ecx,dword ptr [eax]
 0045C4F6    call        dword ptr [ecx+70]
 0045C4F9    mov         eax,dword ptr [ebp-24]
 0045C4FC    push        eax
 0045C4FD    lea         eax,[ebp-70]
 0045C500    push        eax
 0045C501    mov         eax,dword ptr [ebx]
 0045C503    mov         eax,dword ptr [eax+84]
 0045C509    mov         ecx,dword ptr [ebp-28]
 0045C50C    mov         edx,dword ptr [ebp-50]
 0045C50F    mov         esi,dword ptr [eax]
 0045C511    call        dword ptr [esi+0D8]
 0045C517    mov         eax,dword ptr [ebp-54]
 0045C51A    push        eax
 0045C51B    mov         eax,dword ptr [ebp-58]
 0045C51E    push        eax
 0045C51F    lea         eax,[ebp-70]
 0045C522    push        eax
 0045C523    call        user32.OffsetRect
 0045C528    mov         eax,dword ptr [ebx]
 0045C52A    mov         eax,dword ptr [eax+84]
 0045C530    mov         si,0FFC8
 0045C534    call        @CallDynaInst
 0045C539    test        al,al
>0045C53B    je          0045C550
 0045C53D    push        ebp
 0045C53E    mov         eax,dword ptr [ebp-28]
 0045C541    call        MultiLineWidth
 0045C546    pop         ecx
 0045C547    add         eax,5
 0045C54A    sub         dword ptr [ebp-70],eax
 0045C54D    sub         dword ptr [ebp-68],eax
 0045C550    lea         ecx,[ebp-88]
 0045C556    lea         edx,[ebp-48]
 0045C559    mov         eax,dword ptr [ebx]
 0045C55B    mov         eax,dword ptr [eax+60]
 0045C55E    call        TControl.ClientToScreen
 0045C563    mov         eax,dword ptr [ebx]
 0045C565    mov         edx,dword ptr [ebp-88]
 0045C56B    mov         dword ptr [eax+64],edx
 0045C56E    mov         edx,dword ptr [ebp-84]
 0045C574    mov         dword ptr [eax+68],edx
 0045C577    lea         ecx,[ebp-88]
 0045C57D    lea         edx,[ebp-40]
 0045C580    mov         eax,dword ptr [ebx]
 0045C582    mov         eax,dword ptr [eax+60]
 0045C585    call        TControl.ClientToScreen
 0045C58A    mov         eax,dword ptr [ebx]
 0045C58C    mov         edx,dword ptr [ebp-88]
 0045C592    mov         dword ptr [eax+6C],edx
 0045C595    mov         edx,dword ptr [ebp-84]
 0045C59B    mov         dword ptr [eax+70],edx
 0045C59E    mov         eax,dword ptr [ebx]
 0045C5A0    mov         eax,dword ptr [eax+84]
 0045C5A6    mov         edx,dword ptr [ebp-4C]
 0045C5A9    call        TControl.SetColor
 0045C5AE    mov         eax,dword ptr [ebp-24]
 0045C5B1    push        eax
 0045C5B2    mov         eax,dword ptr [ebx]
 0045C5B4    mov         eax,dword ptr [eax+84]
 0045C5BA    mov         ecx,dword ptr [ebp-28]
 0045C5BD    lea         edx,[ebp-70]
 0045C5C0    mov         esi,dword ptr [eax]
 0045C5C2    call        dword ptr [esi+0D4]
 0045C5C8    call        HookHintHooks
 0045C5CD    mov         eax,dword ptr [ebp-30]
 0045C5D0    test        eax,eax
>0045C5D2    jle         0045C5E1
 0045C5D4    xor         ecx,ecx
 0045C5D6    mov         edx,eax
 0045C5D8    mov         eax,dword ptr [ebx]
 0045C5DA    call        TApplication.StartHintTimer
>0045C5DF    jmp         0045C60A
 0045C5E1    mov         cl,1
 0045C5E3    mov         edx,dword ptr [ebp-2C]
 0045C5E6    mov         eax,dword ptr [ebx]
 0045C5E8    call        TApplication.StartHintTimer
>0045C5ED    jmp         0045C60A
 0045C5EF    mov         eax,dword ptr [ebp-30]
 0045C5F2    test        eax,eax
>0045C5F4    jle         0045C603
 0045C5F6    xor         ecx,ecx
 0045C5F8    mov         edx,eax
 0045C5FA    mov         eax,dword ptr [ebx]
 0045C5FC    call        TApplication.StartHintTimer
>0045C601    jmp         0045C60A
 0045C603    mov         eax,dword ptr [ebx]
 0045C605    call        TApplication.CancelHint
 0045C60A    xor         eax,eax
 0045C60C    pop         edx
 0045C60D    pop         ecx
 0045C60E    pop         ecx
 0045C60F    mov         dword ptr fs:[eax],edx
 0045C612    push        45C63D
 0045C617    lea         eax,[ebp-90]
 0045C61D    mov         edx,2
 0045C622    call        @LStrArrayClr
 0045C627    lea         eax,[ebp-60]
 0045C62A    mov         edx,dword ptr ds:[452088];THintInfo
 0045C630    call        @FinalizeRecord
 0045C635    ret
>0045C636    jmp         @HandleFinally
>0045C63B    jmp         0045C617
 0045C63D    pop         edi
 0045C63E    pop         esi
 0045C63F    pop         ebx
 0045C640    mov         esp,ebp
 0045C642    pop         ebp
 0045C643    ret
*}
end;

//0045C644
function TApplication.GetCurrentHelpFile:AnsiString;
begin
{*
 0045C644    push        ebx
 0045C645    push        esi
 0045C646    push        edi
 0045C647    mov         edi,edx
 0045C649    mov         esi,eax
 0045C64B    mov         eax,[005E0CB0];Screen:TScreen
 0045C650    mov         ebx,dword ptr [eax+68]
 0045C653    test        ebx,ebx
>0045C655    je          0045C66F
 0045C657    cmp         dword ptr [ebx+23C],0
>0045C65E    je          0045C66F
 0045C660    mov         eax,edi
 0045C662    mov         edx,dword ptr [ebx+23C]
 0045C668    call        @LStrAsg
>0045C66D    jmp         0045C679
 0045C66F    mov         eax,edi
 0045C671    mov         edx,dword ptr [esi+50]
 0045C674    call        @LStrAsg
 0045C679    pop         edi
 0045C67A    pop         esi
 0045C67B    pop         ebx
 0045C67C    ret
*}
end;

//0045C680
function TApplication.DispatchAction(Msg:Longint; Action:TBasicAction):Boolean;
begin
{*
 0045C680    push        ebx
 0045C681    push        esi
 0045C682    push        edi
 0045C683    push        ebp
 0045C684    add         esp,0FFFFFFF8
 0045C687    mov         ebx,ecx
 0045C689    mov         dword ptr [esp],edx
 0045C68C    mov         esi,eax
 0045C68E    mov         eax,[005E0CB0];Screen:TScreen
 0045C693    mov         edi,dword ptr [eax+6C]
 0045C696    test        edi,edi
>0045C698    je          0045C6AB
 0045C69A    push        ebx
 0045C69B    xor         ecx,ecx
 0045C69D    mov         edx,dword ptr [esp+4]
 0045C6A1    mov         eax,edi
 0045C6A3    call        TControl.Perform
 0045C6A8    dec         eax
>0045C6A9    je          0045C6CB
 0045C6AB    mov         ebp,dword ptr [esi+44]
 0045C6AE    cmp         edi,ebp
>0045C6B0    je          0045C6C7
 0045C6B2    test        ebp,ebp
>0045C6B4    je          0045C6C7
 0045C6B6    push        ebx
 0045C6B7    xor         ecx,ecx
 0045C6B9    mov         edx,dword ptr [esp+4]
 0045C6BD    mov         eax,ebp
 0045C6BF    call        TControl.Perform
 0045C6C4    dec         eax
>0045C6C5    je          0045C6CB
 0045C6C7    xor         eax,eax
>0045C6C9    jmp         0045C6CD
 0045C6CB    mov         al,1
 0045C6CD    mov         byte ptr [esp+4],al
 0045C6D1    cmp         byte ptr [esp+4],0
>0045C6D6    jne         0045C704
 0045C6D8    mov         eax,ebx
 0045C6DA    mov         edx,dword ptr ds:[44776C];TCustomAction
 0045C6E0    call        @IsClass
 0045C6E5    test        al,al
>0045C6E7    je          0045C704
 0045C6E9    cmp         byte ptr [ebx+6A],0
>0045C6ED    je          0045C704
 0045C6EF    cmp         byte ptr [ebx+60],0
>0045C6F3    je          0045C704
 0045C6F5    cmp         word ptr [ebx+42],0
 0045C6FA    setne       dl
 0045C6FD    mov         eax,ebx
 0045C6FF    call        TCustomAction.SetEnabled
 0045C704    mov         al,byte ptr [esp+4]
 0045C708    pop         ecx
 0045C709    pop         edx
 0045C70A    pop         ebp
 0045C70B    pop         edi
 0045C70C    pop         esi
 0045C70D    pop         ebx
 0045C70E    ret
*}
end;

//0045C710
function TApplication.ExecuteAction(Action:TBasicAction):Boolean;
begin
{*
 0045C710    push        ebx
 0045C711    push        ecx
 0045C712    mov         byte ptr [esp],0
 0045C716    cmp         word ptr [eax+0C2],0
>0045C71E    je          0045C730
 0045C720    mov         ecx,esp
 0045C722    mov         ebx,eax
 0045C724    mov         eax,dword ptr [ebx+0C4]
 0045C72A    call        dword ptr [ebx+0C0]
 0045C730    mov         al,byte ptr [esp]
 0045C733    pop         edx
 0045C734    pop         ebx
 0045C735    ret
*}
end;

//0045C738
function TApplication.UpdateAction(Action:TBasicAction):Boolean;
begin
{*
 0045C738    push        ebx
 0045C739    push        ecx
 0045C73A    mov         byte ptr [esp],0
 0045C73E    cmp         word ptr [eax+0CA],0
>0045C746    je          0045C758
 0045C748    mov         ecx,esp
 0045C74A    mov         ebx,eax
 0045C74C    mov         eax,dword ptr [ebx+0CC]
 0045C752    call        dword ptr [ebx+0C8]
 0045C758    mov         al,byte ptr [esp]
 0045C75B    pop         edx
 0045C75C    pop         ebx
 0045C75D    ret
*}
end;

//0045C760
procedure InitProcs;
begin
{*
 0045C760    push        ebx
 0045C761    push        45C784
 0045C766    call        KERNEL32.GetModuleHandleA
 0045C76B    mov         ebx,eax
 0045C76D    test        ebx,ebx
>0045C76F    je          0045C781
 0045C771    push        45C790
 0045C776    push        ebx
 0045C777    call        KERNEL32.GetProcAddress
 0045C77C    mov         [005ACDB0],eax
 0045C781    pop         ebx
 0045C782    ret
*}
end;

//0045C7AC
procedure TApplication.WakeMainThread(Sender:TObject);
begin
{*
 0045C7AC    push        0
 0045C7AE    push        0
 0045C7B0    push        0
 0045C7B2    mov         eax,dword ptr [eax+30]
 0045C7B5    push        eax
 0045C7B6    call        user32.PostMessageA
 0045C7BB    ret
*}
end;

//0045C7BC
procedure TApplication.HookSynchronizeWakeup;
begin
{*
 0045C7BC    mov         edx,dword ptr ds:[5AE774]
 0045C7C2    mov         dword ptr [edx+4],eax
 0045C7C5    mov         dword ptr [edx],45C7AC;TApplication.WakeMainThread
 0045C7CB    ret
*}
end;

//0045C7CC
procedure TApplication.UnhookSynchronizeWakeup;
begin
{*
 0045C7CC    mov         eax,[005AE774]
 0045C7D1    xor         edx,edx
 0045C7D3    mov         dword ptr [eax],edx
 0045C7D5    mov         dword ptr [eax+4],edx
 0045C7D8    ret
*}
end;

//0045C7DC
procedure _NF__BA6;
begin
{*
 0045C7DC    add         dword ptr [eax],eax
 0045C7DE    add         byte ptr [eax],al
 0045C7E0    lods        byte ptr [esi]
 0045C7E1    int         5A
 0045C7E3    add         byte ptr [edi+eax*4+43],cl
 0045C7E7    add         byte ptr [eax],al
 0045C7E9    add         byte ptr [eax],al
 0045C7EB    add         byte ptr [ebp-75],dl;{Finalization}
*}
end;

Initialization
//0045C848
{*
 0045C848    sub         dword ptr ds:[5E0CB4],1
>0045C84F    jae         0045C879
 0045C851    mov         eax,45C7DC;_NF__BA6
 0045C856    call        @InitImports
 0045C85B    call        InitProcs
 0045C860    push        45C87C
 0045C865    call        user32.RegisterWindowMessageA
 0045C86A    mov         [005E0CB8],eax;RM_TaskbarCreated:DWORD
 0045C86F    mov         eax,45246C;FindGlobalComponent:TComponent
 0045C874    call        RegisterFindGlobalComponentProc
 0045C879    ret
*}
Finalization
//0045C7EC
{*
 0045C7EC    push        ebp
 0045C7ED    mov         ebp,esp
 0045C7EF    xor         eax,eax
 0045C7F1    push        ebp
 0045C7F2    push        45C83F
 0045C7F7    push        dword ptr fs:[eax]
 0045C7FA    mov         dword ptr fs:[eax],esp
 0045C7FD    inc         dword ptr ds:[5E0CB4]
>0045C803    jne         0045C831
 0045C805    cmp         dword ptr ds:[5E0CAC],0;Application:TApplication
>0045C80C    je          0045C813
 0045C80E    call        DoneApplication
 0045C813    cmp         dword ptr ds:[5E0CC0],0;HintDoneEvent:THandle
>0045C81A    je          0045C827
 0045C81C    mov         eax,[005E0CC0];HintDoneEvent:THandle
 0045C821    push        eax
 0045C822    call        KERNEL32.CloseHandle
 0045C827    mov         eax,45246C;FindGlobalComponent:TComponent
 0045C82C    call        UnregisterFindGlobalComponentProc
 0045C831    xor         eax,eax
 0045C833    pop         edx
 0045C834    pop         ecx
 0045C835    pop         ecx
 0045C836    mov         dword ptr fs:[eax],edx
 0045C839    push        45C846
 0045C83E    ret
>0045C83F    jmp         @HandleFinally
>0045C844    jmp         0045C83E
 0045C846    pop         ebp
 0045C847    ret
*}
end.