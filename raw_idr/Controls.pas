//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Controls;

interface

uses
  SysUtils, Classes, Controls, Graphics, Menus;

type
  TAlign = (alNone, alTop, alBottom, alLeft, alRight, alClient, alCustom);
  TDragObject = class(TObject)
  public
    FDragTarget:Pointer;//f4
    FDragHandle:HWND;//f8
    FDragPos:TPoint;//fC
    FDragTargetPos:TPoint;//f14
    FDropped:Boolean;//f1C
    FMouseDeltaX:Double;//f20
    FMouseDeltaY:Double;//f28
    FCancelling:Boolean;//f30
    procedure AfterConstruction; virtual;//004392F8
    procedure AfterConstruction; virtual;//004392E8
    procedure v0; virtual;//v0//00439130
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor; virtual;//v4//00439274
    //function v8:?; virtual;//v8//00439270
    procedure WndProc(var Msg:TMessage); virtual;//vC//00439174
    procedure Assign(Source:TDragObject); virtual;//v10//004390D8
    function GetName:AnsiString; virtual;//v14//00439138
    procedure v18; virtual;//v18//0043928C
    //function v1C:?; virtual;//v1C//00439290
    procedure v20; virtual;//v20//00439298
    function Capture:HWND;//00439118
    procedure ReleaseCapture(Handle:HWND);//00439160
    procedure MainWndProc(var Message:TMessage);//0043929C
  end;
  TBaseDragControlObject = class(TDragObject)
  public
    FControl:TControl;//f38
    procedure Finished(Target:TObject; X:Integer; Y:Integer; Accepted:Boolean); virtual;//v0//00439384
    procedure Assign(Source:TDragObject); virtual;//v10//0043932C
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer); virtual;//v24//00439358
    constructor Create(AControl:TControl); virtual;//v28//00439308
  end;
  TDragControlObject = class(TBaseDragControlObject)
  public
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor; virtual;//v4//004393B8
    function GetDragImages:TDragImageList; virtual;//v8//004393D0
    procedure HideDragImage; virtual;//v18//004393DC
    procedure ShowDragImage; virtual;//v20//004393FC
  end;
  TDragControlObjectEx = class(TDragControlObject)
  public
    procedure BeforeDestruction; virtual;//0043941C
  end;
  TDragDockObject = class(TBaseDragControlObject)
  public
    FBrush:TBrush;//f40
    FDockRect:TRect;//f44
    FDropAlign:TAlign;//f54
    FDropOnControl:TControl;//f58
    FEraseDockRect:TRect;//f5C
    FFloating:Boolean;//f6C
    destructor Destroy; virtual;//00439484
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor; virtual;//v4//004395FC
    procedure Assign(Source:TDragObject); virtual;//v10//004394B4
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer); virtual;//v24//00439510
    constructor Create(AControl:TControl); virtual;//v28//00439420
    procedure AdjustDockRect(ARect:TRect); virtual;//v2C//00439558
    procedure DrawDragDockImage; virtual;//v30//004395D4
    procedure EraseDragDockImage; virtual;//v34//004395E8
    //function v38:?; virtual;//v38//00439608
  end;
  TDragDockObjectEx = class(TDragDockObject)
  public
    procedure BeforeDestruction; virtual;//00439610
  end;
  TControlCanvas = class(TCanvas)
  public
    FControl:TControl;//f58
    FDeviceContext:HDC;//f5C
    FWindowHandle:HWND;//f60
    destructor Destroy; virtual;//0043A7E0
    procedure CreateHandle; virtual;//v14//0043A80C
    procedure FreeHandle;//0043A8B4
    procedure SetControl(AControl:TControl);//0043A8E8
    procedure UpdateTextFlags;//0043A900
  end;
  TControlActionLink = class(TActionLink)
  public
    FClient:TControl;//f18
    procedure AssignClient(AClient:TObject); virtual;//v0//0043AA50
    function IsOnExecuteLinked:Boolean; virtual;//v8//0043AC70
    procedure SetOnExecute(Value:TNotifyEvent); virtual;//v10//0043AD1C
    function IsCaptionLinked:Boolean; virtual;//v20//0043AB5C
    function IsEnabledLinked:Boolean; virtual;//v28//0043ABD0
    function IsHelpLinked:Boolean; virtual;//v34//0043AD48
    function IsHintLinked:Boolean; virtual;//v38//0043AC04
    function IsVisibleLinked:Boolean; virtual;//v44//0043AC3C
    procedure SetCaption(const Value:AnsiString); virtual;//v4C//0043AC98
    procedure SetEnabled(Value:Boolean); virtual;//v54//0043ACB8
    //procedure v5C(?:?); virtual;//v5C//0043ADCC
    procedure SetHelpContext(Value:THelpContext); virtual;//v60//0043ADAC
    procedure SetHelpType(Value:THelpType); virtual;//v64//0043ADEC
    procedure SetHint(const Value:AnsiString); virtual;//v68//0043ACD8
    procedure SetVisible(Value:Boolean); virtual;//v74//0043ACFC
    function DoShowHint(var HintStr:AnsiString):Boolean; virtual;//v78//0043AA6C
  end;
  TMouseButton = (mbLeft, mbRight, mbMiddle);
  TDragMode = (dmManual, dmAutomatic);
  TDragState = (dsDragEnter, dsDragLeave, dsDragMove);
  TDragKind = (dkDrag, dkDock);
  TAnchorKind = (akLeft, akTop, akRight, akBottom);
  TAnchors = set of TAnchorKind;
  TSizeConstraints = class(TPersistent)
  public
    FControl:TControl;//f4
    MaxHeight:TConstraintSize;//f8
    MaxWidth:TConstraintSize;//fC
    MinHeight:TConstraintSize;//f10
    MinWidth:TConstraintSize;//f14
    FOnChange:TNotifyEvent;//f18
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0043A968
    procedure Change; virtual;//vC//0043AA3C
    constructor Create(Control:TControl); virtual;//v10//0043A92C
    procedure SetConstraints(Index:Integer; Value:TConstraintSize);//0043A9B0
  end;
  TMouseEvent = procedure(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer) of object;;
  TMouseMoveEvent = procedure(Sender:TObject; Shift:TShiftState; X:Integer; Y:Integer) of object;;
  TKeyEvent = procedure(Sender:TObject; var Key:Word; Shift:TShiftState) of object;;
  TKeyPressEvent = procedure(Sender:TObject; var Key:Char) of object;;
  TDragOverEvent = procedure(Sender:TObject; Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean) of object;;
  TDragDropEvent = procedure(Sender:TObject; Source:TObject; X:Integer; Y:Integer) of object;;
  TStartDragEvent = procedure(Sender:TObject; var DragObject:TDragObject) of object;;
  TEndDragEvent = procedure(Sender:TObject; Target:TObject; X:Integer; Y:Integer) of object;;
  TDockDropEvent = procedure(Sender:TObject; Source:TDragDockObject; X:Integer; Y:Integer) of object;;
  TDockOverEvent = procedure(Sender:TObject; Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean) of object;;
  TUnDockEvent = procedure(Sender:TObject; Client:TControl; NewTarget:TWinControl; var Allow:Boolean) of object;;
  TStartDockEvent = procedure(Sender:TObject; var DragObject:TDragDockObject) of object;;
  TGetSiteInfoEvent = procedure(Sender:TObject; DockClient:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean) of object;;
  TCanResizeEvent = procedure(Sender:TObject; var NewWidth:Integer; var NewHeight:Integer; var Resize:Boolean) of object;;
  TConstrainedResizeEvent = procedure(Sender:TObject; var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer) of object;;
  TMouseWheelEvent = procedure(Sender:TObject; Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint; var Handled:Boolean) of object;;
  TMouseWheelUpDownEvent = procedure(Sender:TObject; Shift:TShiftState; MousePos:TPoint; var Handled:Boolean) of object;;
  TContextPopupEvent = procedure(Sender:TObject; MousePos:TPoint; var Handled:Boolean) of object;;
  TControl = class(TComponent)
  public
    FParent:TWinControl;//f30
    FWindowProc:TWndMethod;//f38
    Left:Integer;//f40
    Top:Integer;//f44
    Width:Integer;//f48
    Height:Integer;//f4C
    FControlStyle:TControlStyle;//f50
    f51:byte;//f51
    FControlState:TControlState;//f54
    FDesktopFont:Boolean;//f56
    FVisible:Boolean;//f57
    FEnabled:Boolean;//f58
    FParentFont:Boolean;//f59
    FParentColor:Boolean;//f5A
    FAlign:TAlign;//f5B
    FAutoSize:Boolean;//f5C
    FDragMode:TDragMode;//f5D
    FIsControl:Boolean;//f5E
    FBiDiMode:TBiDiMode;//f5F
    FParentBiDiMode:Boolean;//f60
    FAnchors:TAnchors;//f61
    FAnchorMove:Boolean;//f62
    FText:PChar;//f64
    FFont:TFont;//f68
    FActionLink:TControlActionLink;//f6C
    FColor:TColor;//f70
    FConstraints:TSizeConstraints;//f74
    Cursor:TCursor;//f78
    FDragCursor:TCursor;//f7A
    FPopupMenu:TPopupMenu;//f7C
    Hint:String;//f80
    FFontHeight:Integer;//f84
    FAnchorRules:TPoint;//f88
    FOriginalParentSize:TPoint;//f90
    FScalingFlags:TScalingFlags;//f98
    FShowHint:Boolean;//f99
    FParentShowHint:Boolean;//f9A
    FDragKind:TDragKind;//f9B
    FDockOrientation:TDockOrientation;//f9C
    FHostDockSite:TWinControl;//fA0
    FWheelAccumulator:Integer;//fA4
    FUndockWidth:Integer;//fA8
    FUndockHeight:Integer;//fAC
    FLRDockWidth:Integer;//fB0
    FTBDockHeight:Integer;//fB4
    FFloatingDockSiteClass:TWinControlClass;//fB8
    FOnCanResize:TCanResizeEvent;//fC0
    FOnConstrainedResize:TConstrainedResizeEvent;//fC8
    FOnMouseDown:TMouseEvent;//fD0
    FOnMouseMove:TMouseMoveEvent;//fD8
    FOnMouseUp:TMouseEvent;//fE0
    FOnDragDrop:TDragDropEvent;//fE8
    FOnDragOver:TDragOverEvent;//fF0
    FOnResize:TNotifyEvent;//fF8
    FOnStartDock:TStartDockEvent;//f100
    FOnEndDock:TEndDragEvent;//f108
    FOnStartDrag:TStartDragEvent;//f110
    FOnEndDrag:TEndDragEvent;//f118
    FOnClick:TNotifyEvent;//f120
    FOnDblClick:TNotifyEvent;//f128
    FOnContextPopup:TContextPopupEvent;//f130
    FOnMouseWheel:TMouseWheelEvent;//f138
    FOnMouseWheelDown:TMouseWheelUpDownEvent;//f140
    FOnMouseWheelUp:TMouseWheelUpDownEvent;//f148
    HelpType:THelpType;//f150
    HelpKeyword:String;//f154
    HelpContext:THelpContext;//f158
    procedure DefaultHandler(var Message:void ); virtual;//0043D104
    destructor Destroy; virtual;//0043AEE4
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0043DDE4
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0043D1DC
    procedure Loaded; virtual;//vC//0043DDAC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0043B1DC
    procedure ReadState(Reader:TReader); virtual;//v14//0043B148
    procedure SetName(const Value:TComponentName); virtual;//v18//0043BAE4
    constructor Create(AOwner:TComponent); virtual;//v2C//0043AE0C
    function CanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v30//0043CC74
    //function v34:?; virtual;//v34//0043CC70
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer); virtual;//v38//0043CD40
    function GetAction:TBasicAction; virtual;//v3C//0043B050
    //procedure v40(?:?); virtual;//v40//0043B794
    function GetClientRect:TRect; virtual;//v44//0043B6F8
    //function v48:?; virtual;//v48//0043C010
    //function v4C:?; virtual;//v4C//0043AF98
    function GetEnabled:Boolean; virtual;//v50//0043AF9C
    function GetFloating:Boolean; virtual;//v54//0043DF7C
    //function v58:?; virtual;//v58//0043DFA8
    procedure SetAutoSize(Value:Boolean); virtual;//v5C//0043BACC
    procedure SetDragMode(Value:TDragMode); virtual;//v60//0043B114
    procedure SetEnabled(Value:Boolean); virtual;//v64//0043BC58
    procedure SetParent(AParent:TWinControl); virtual;//v68//0043BBD0
    procedure SetParentBiDiMode(Value:Boolean); virtual;//v6C//0043BEE4
    procedure SetBiDiMode(Value:TBiDiMode); virtual;//v70//0043BD90
    procedure WndProc(var Message:TMessage); virtual;//v74//0043CF70
    procedure InitiateAction; virtual;//v78//0043E02C
    procedure Invalidate; virtual;//v7C//0043C1D0
    procedure Repaint; virtual;//v80//0043C238
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer); virtual;//v84//0043B2C8
    procedure Update; virtual;//v88//0043C224
    procedure WMCancelMode(var Message:TWMCancelMode); message WM_CANCELMODE;//0043D798
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;//0043D7D8
    procedure WMContextMenu(var Message:TWMContextMenu); message WM_CONTEXTMENU;//0043E068
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//0043D3C0
    procedure WMMouseMove(var Message:TWMMouseMove); message WM_MOUSEMOVE;//0043D5A0
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//0043D374
    procedure WMLButtonUp(var Message:TWMLButtonUp); message WM_LBUTTONUP;//0043D688
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk); message WM_LBUTTONDBLCLK;//0043D3DC
    procedure WMRButtonDown(var Message:TWMRButtonDown); message WM_RBUTTONDOWN;//0043D4D0
    procedure WMRButtonUp(var Message:TWMRButtonUp); message WM_RBUTTONUP;//0043D700
    procedure WMRButtonDblClk(var Message:TWMRButtonDblClk); message WM_RBUTTONDBLCLK;//0043D4F8
    procedure WMMButtonDown(var Message:TWMMButtonDown); message WM_MBUTTONDOWN;//0043D520
    procedure WMMButtonUp(var Message:TWMMButtonUp); message WM_MBUTTONUP;//0043D720
    procedure WMMButtonDblClk(var Message:TWMMButtonDblClk); message WM_MBUTTONDBLCLK;//0043D548
    procedure WMMouseWheel(var Message:TWMMouseWheel); message WM_MOUSEWHEEL;//0043D740
    procedure CMParentFontChanged(var Message:TMessage); message CM_PARENTFONTCHANGED;//0043D9C0
    procedure CMParentColorChanged(var Message:TMessage); message CM_PARENTCOLORCHANGED;//0043D8C8
    procedure CMHitTest(var Message:TWMNCHitTest); message CM_HITTEST;//0043DA14
    procedure CMVisibleChanged(var Message:TMessage); message CM_VISIBLECHANGED;//0043D888
    procedure CMEnabledChanged; message CM_ENABLEDCHANGED;//0043D8B0
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//0043D8C0
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//0043D8B8
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//0043DA1C
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//0043DA34
    procedure CMDesignHitTest(var Message:TWMMouse); message CM_DESIGNHITTEST;//0043DA4C
    procedure CMParentShowHintChanged(var Message:TMessage); message CM_PARENTSHOWHINTCHANGED;//0043D998
    procedure CMHintShow(var Message:TMessage); message CM_HINTSHOW;//0043E03C
    procedure CMSysFontChanged(var Message:TMessage); message CM_SYSFONTCHANGED;//0043D9F0
    procedure CMFloat(var Message:TCMFloat); message CM_FLOAT;//0043DB64
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//0043D978
    procedure CMParentBiDiModeChanged(var Message:TMessage); message CM_PARENTBIDIMODECHANGED;//0043D8F8
    procedure CMMouseWheel(var Message:TCMMouseWheel); message CM_MOUSEWHEEL;//0043D91C
    procedure UseRightToLeftAlignment; dynamic;//0043C34C
    procedure MouseWheelHandler(var Message:TMessage); dynamic;//0043C1E0
    procedure sub_0043C330; dynamic;//0043C330
    procedure DragDrop(Source:TObject; X:Integer; Y:Integer); dynamic;//0043C4A8
    procedure Dock(NewDockSite:TWinControl; ARect:TRect); dynamic;//0043B510
    procedure sub_0043CF6C; dynamic;//0043CF6C
    procedure SetZOrder(TopMost:Boolean); dynamic;//0043BFEC
    procedure Resize; dynamic;//0043B128
    procedure RequestAlign; dynamic;//0043B118
    procedure PaletteChanged(Foreground:Boolean); dynamic;//0043AFD8
    procedure PositionDockRect(DragDockObject:TDragDockObject); dynamic;//0043C520
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0043D618
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0043D570
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0043D2B8
    procedure sub_0043D430; dynamic;//0043D430
    procedure sub_0043AFA0; dynamic;//0043AFA0
    procedure GetDockEdge(MousePos:TPoint); dynamic;//0043DECC
    procedure sub_0043DCE4; dynamic;//0043DCE4
    procedure EraseDragDockImage(DragDockObject:TDragDockObject); dynamic;//0043C8EC
    procedure DrawDragDockImage(DragDockObject:TDragDockObject); dynamic;//0043C8D8
    procedure DoStartDrag(var DragObject:TDragObject); dynamic;//0043C4D4
    procedure DoEndDrag(Target:TObject; X:Integer; Y:Integer); dynamic;//0043C4F4
    procedure DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//0043C46C
    procedure sub_0043C45C; dynamic;//0043C45C
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint); dynamic;//0043C760
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint); dynamic;//0043C714
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint); dynamic;//0043C650
    procedure DoStartDock(var DragObject:TDragObject); dynamic;//0043C630
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect); dynamic;//0043B61C
    procedure DoEndDock(Target:TObject; X:Integer; Y:Integer); dynamic;//0043C604
    procedure DoContextPopup(MousePos:TPoint; var Handled:Boolean); dynamic;//0043E190
    procedure DockTrackNoTarget(Source:TDragDockObject; X:Integer; Y:Integer); dynamic;//0043C5F0
    procedure DefaultDockImage(DragDockObject:TDragDockObject; Erase:Boolean); dynamic;//0043C7AC
    procedure DblClick; dynamic;//0043D298
    procedure DesignWndProc(var Message:TMessage); dynamic;//0043CD9C
    procedure Click; dynamic;//0043D22C
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//0043B918
    procedure BeginAutoDrag; dynamic;//0043C380
    procedure AdjustSize; dynamic;//0043DFB0
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//0043DBC4
    procedure HasParent; dynamic;//0043AFA4
    procedure GetParentComponent; dynamic;//0043AFAC
    procedure SetParentComponent(Value:TComponent); dynamic;//0043AFB0
    procedure SetAnchors(Value:TAnchors);//0043B060
    procedure SetAction(Value:TBasicAction);//0043B080
    function IsAnchorsStored(Value:TAnchors):Boolean;//0043B0FC
    procedure SetAlign(Value:TAlign);//0043B220
    procedure UpdateAnchorRules;//0043B360
    procedure SetLeft(Value:Integer);//0043B47C
    procedure SetTop(Value:Integer);//0043B4A0
    procedure SetWidth(Value:Integer);//0043B4C8
    procedure SetHeight(Value:Integer);//0043B4EC
    procedure SetHelpContext(const Value:THelpContext);//0043B674
    procedure SetHelpKeyword(const Value:AnsiString);//0043B688
    function GetBoundsRect:TRect;//0043B6AC
    procedure SetBoundsRect(const Rect:TRect);//0043B6CC
    function GetClientWidth:Integer;//0043B710
    procedure SetClientWidth(Value:Integer);//0043B728
    function GetClientHeight:Integer;//0043B754
    procedure SetClientHeight(Value:Integer);//0043B76C
    function ClientToScreen(const Point:TPoint):TPoint;//0043B824
    function ScreenToClient(const Point:TPoint):TPoint;//0043B850
    procedure SendCancelMode(Sender:TControl);//0043B87C
    procedure SendDockNotification(Msg:Cardinal; WParam:Integer; LParam:Integer);//0043B8AC
    procedure SetClientSize(Value:TPoint);//0043BB88
    procedure SetVisible(Value:Boolean);//0043BC1C
    function GetTextLen:Integer;//0043BC70
    function GetTextBuf(Buffer:PChar; BufSize:Integer):Integer;//0043BC80
    function GetUndockHeight:Integer;//0043BC8C
    function GetUndockWidth:Integer;//0043BCA0
    procedure SetPopupMenu(Value:TPopupMenu);//0043BCB4
    procedure SetTextBuf(Buffer:PChar);//0043BCD8
    function GetText:TCaption;//0043BCFC
    procedure SetText(const Value:TCaption);//0043BD2C
    procedure FontChanged(Sender:TObject);//0043BDAC
    procedure SetFont(Value:TFont);//0043BDF0
    function IsFontStored(Value:TFont):Boolean;//0043BE00
    function IsShowHintStored(Value:Boolean):Boolean;//0043BE14
    procedure SetParentFont(Value:Boolean);//0043BE28
    procedure SetShowHint(Value:Boolean);//0043BE4C
    procedure SetParentShowHint(Value:Boolean);//0043BE70
    procedure SetColor(Value:TColor);//0043BE9C
    procedure SetParentColor(Value:Boolean);//0043BEC0
    procedure SetCursor(Value:TCursor);//0043BF08
    function GetMouseCapture:Boolean;//0043BF24
    procedure SetMouseCapture(Value:Boolean);//0043BF34
    procedure BringToFront;//0043BF5C
    procedure SetZOrderPosition(Position:Integer);//0043BF6C
    procedure InvalidateControl(IsVisible:Boolean; IsOpaque:Boolean);//0043C144
    function UseRightToLeftReading:Boolean;//0043C334
    function UseRightToLeftScrollBar:Boolean;//0043C364
    procedure BeginDrag(Immediate:Boolean; Threshold:Integer);//0043C398
    function Dragging:Boolean;//0043C460
    procedure DoDragMsg(var DragMsg:TCMDrag);//0043C900
    function ManualDock(NewDockSite:TWinControl; DropControl:TControl; ControlSide:TAlign):Boolean;//0043C9F0
    function ManualFloat(ScreenPos:TRect):Boolean;//0043CBD0
    procedure DoConstraintsChange(Sender:TObject);//0043CC64
    function DoCanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//0043CCA4
    function DoCanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//0043CD10
    function CalcCursorPos:TPoint;//0043CD70
    procedure DoConstrainedResize(var NewWidth:Integer; var NewHeight:Integer);//0043CDD0
    function Perform(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;//0043CEA4
    procedure CalcDockSizes;//0043CED8
    procedure UpdateBoundsRect(const R:TRect);//0043CF48
    procedure ReadIsControl(Reader:TReader);//0043D18C
    procedure WriteIsControl(Writer:TWriter);//0043D1A0
    procedure DoMouseDown(var Message:TWMMouse; Button:TMouseButton; Shift:TShiftState);//0043D2F0
    function CheckNewSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//0043D434
    procedure DoMouseUp(var Message:TWMMouse; Button:TMouseButton);//0043D650
    function CreateFloatingDockSite(Bounds:TRect):TWinControl;//0043DA54
    procedure DoActionChange(Sender:TObject);//0043DCC0
    function IsCaptionStored(Value:TCaption):Boolean;//0043DCEC
    function IsEnabledStored(Value:Boolean):Boolean;//0043DD0C
    function IsHintStored(Value:String):Boolean;//0043DD2C
    function IsHelpContextStored(Value:String):Boolean;//0043DD4C
    function IsVisibleStored(Value:Boolean):Boolean;//0043DD6C
    function IsOnClickStored(Value:TNotifyEvent):Boolean;//0043DD8C
    function DrawTextBiDiModeFlags(Flags:Longint):Longint;//0043DFD0
    function DrawTextBiDiModeFlagsReadingOnly:Longint;//0043E010
    procedure SetConstraints(const Value:TSizeConstraints);//0043E1C4
  end;
  TWinControlActionLink = class(TControlActionLink)
  public
    FClient:TWinControl;//f20
    procedure AssignClient(AClient:TObject); virtual;//v0//0043E1D0
    procedure IsHelpContextLinked; virtual;//v30//0043E1F4
    procedure v5C; virtual;//v5C//0043E1FC
  end;
  TWinControl = class(TControl)
  public
    FAlignLevel:Word;//f160
    FBevelEdges:TBevelEdges;//f162
    FBevelInner:TBevelCut;//f163
    FBevelOuter:TBevelCut;//f164
    FBevelKind:TBevelKind;//f165
    FBevelWidth:TBevelWidth;//f168
    FBorderWidth:TBorderWidth;//f16C
    FBrush:TBrush;//f170
    FDefWndProc:Pointer;//f174
    FDockClients:TList;//f178
    FDockManager:IDockManager;//f17C
    FHandle:HWND;//f180
    FImeMode:TImeMode;//f184
    FImeName:TImeName;//f188
    FObjectInstance:Pointer;//f18C
    FParentWindow:HWND;//f190
    FTabList:TList;//f194
    FControls:TList;//f198
    FWinControls:TList;//f19C
    FTabOrder:Integer;//f1A0
    FTabStop:Boolean;//f1A4
    FCtl3D:Boolean;//f1A5
    FShowing:Boolean;//f1A6
    FUseDockManager:Boolean;//f1A7
    FDockSite:Boolean;//f1A8
    FParentCtl3D:Boolean;//f1A9
    FOnDockDrop:TDockDropEvent;//f1B0
    FOnDockOver:TDockOverEvent;//f1B8
    FOnEnter:TNotifyEvent;//f1C0
    FOnExit:TNotifyEvent;//f1C8
    FOnGetSiteInfo:TGetSiteInfoEvent;//f1D0
    FOnKeyDown:TKeyEvent;//f1D8
    FOnKeyPress:TKeyPressEvent;//f1E0
    FOnKeyUp:TKeyEvent;//f1E8
    FOnUnDock:TUnDockEvent;//f1F0
    FDoubleBuffered:Boolean;//f1F8
    FInImeComposition:Boolean;//f1F9
    FDesignSize:TPoint;//f1FA
    procedure DefaultHandler(var Message:void ); virtual;//00440050
    destructor Destroy; virtual;//0043E328
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00442F80
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0043F818
    procedure ReadState(Reader:TReader); virtual;//v14//0043E4CC
    constructor Create(AOwner:TComponent); virtual;//v2C//0043E204
    procedure CanResize(var NewWidth:Integer; var NewHeight:Integer); virtual;//v30//00442A94
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v34//00442FB0
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer); virtual;//v38//00442EFC
    function GetClientOrigin:TPoint; virtual;//v40//00442580
    function GetClientRect:TRect; virtual;//v44//004425A0
    function GetDeviceContext(var WindowHandle:HWND):HDC; virtual;//v48//004422B8
    procedure WndProc(var Message:TMessage); virtual;//v74//0043FEEC
    procedure Invalidate; virtual;//v7C//0044230C
    procedure Repaint; virtual;//v80//004423C8
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer); virtual;//v84//00441EC4
    procedure Update; virtual;//v88//004423AC
    procedure v8C; virtual;//v8C//0043E544
    procedure AlignControls(AControl:TControl; var Rect:TRect); virtual;//v90//0043EBD8
    procedure CreateHandle; virtual;//v94//0043F978
    procedure CreateParams(var Params:TCreateParams); virtual;//v98//0043F364
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v9C//0043F660
    procedure CreateWnd; virtual;//vA0//0043F490
    //function vA4:?; virtual;//vA4//0043FA10
    procedure CustomAlignPosition(Control:TControl; var NewLeft:Integer; var NewTop:Integer; var NewWidth:Integer; var NewHeight:Integer; var AlignRect:TRect; AlignInfo:TAlignInfo); virtual;//vA8//0043FA14
    procedure DestroyWindowHandle; virtual;//vAC//0043F8CC
    procedure DestroyWnd; virtual;//vB0//0043F874
    //procedure vB4(?:?); virtual;//vB4//004424EC
    procedure PaintWindow(DC:HDC); virtual;//vB8//004402BC
    procedure SetParentBackground(Value:Boolean); virtual;//vBC//004435BC
    procedure ShowControl(AControl:TControl); virtual;//vC0//00442168
    procedure SetFocus; virtual;//vC4//00442458
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//0044172C
    procedure WMMove(var Message:TWMMove); message WM_MOVE;//00440AF8
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//00440AC4
    procedure WMKillFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//00440C0C
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_KILLFOCUS;//00440C20
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//00440668
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//0044092C
    procedure WMSysColorChange(var Message:TWMSysColorChange); message WM_SYSCOLORCHANGE;//0044080C
    procedure WMWinIniChange(var Message:TMessage); message WM_SETTINGCHANGE;//00440828
    procedure WMFontChange(var Message:TMessage); message WM_FONTCHANGE;//0044083C
    procedure WMTimeChange(var Message:TMessage); message WM_TIMECHANGE;//0044084C
    procedure WMSetCursor(var Message:TWMSetCursor); message WM_SETCURSOR;//00440B0C
    procedure WMDrawItem(var Message:TWMDrawItem); message WM_DRAWITEM;//004408E4
    procedure WMMeasureItem(var Message:TWMMeasureItem); message WM_MEASUREITEM;//00440908
    procedure WMDeleteItem(var Message:TWMDeleteItem); message WM_DELETEITEM;//004408C0
    procedure WMVScroll(var Message:TWMVScroll); message WM_VKEYTOITEM;//0044170C
    procedure WMVKeyToItem(var Message:TWMVKeyToItem); message WM_CHARTOITEM;//004416B8
    procedure WMCompareItem(var Message:TWMCompareItem); message WM_COMPAREITEM;//0044089C
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;//00440A74
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;//004409B4
    procedure WMNotify(var Message:TWMNotify); message WM_NOTIFY;//004407E8
    procedure WMContextMenu(var Message:TWMContextMenu); message WM_CONTEXTMENU;//004434B4
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;//00441760
    procedure WMNCCalcSize(var Message:TWMNCCalcSize); message WM_NCCALCSIZE;//0044317C
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//0044177C
    procedure WMNCPaint(var Message:TMessage); message WM_NCPAINT;//0044320C
    procedure WMKeyDown(var Message:TWMKeyDown); message WM_KEYDOWN;//00441394
    procedure WMKeyUp(var Message:TWMKeyUp); message WM_KEYUP;//0044147C
    procedure WMChar(var Message:TWMChar); message WM_CHAR;//00441540
    procedure WMSysKeyDown(var Message:TWMKeyDown); message WM_SYSKEYDOWN;//004413C0
    procedure WMSysKeyUp(var Message:TWMKeyUp); message WM_SYSKEYUP;//0044149C
    procedure WMIMEStartComp(var Message:TMessage); dynamic;//00440C34
    procedure WMIMEEndComp(var Message:TMessage); dynamic;//00440C48
    procedure WMCharToItem(var Message:TWMCharToItem); message WM_COMMAND;//004407C8
    procedure WMSysCommand(var Message:TWMSysCommand); message WM_SYSCOMMAND;//00441610
    procedure WMCommand(var Message:TWMCommand); message WM_HSCROLL;//0044085C
    procedure WMHScroll(var Message:TWMHScroll); message WM_VSCROLL;//0044087C
    procedure WMParentNotify(var Message:TWMParentNotify); message WM_PARENTNOTIFY;//004416D8
    procedure WMQueryNewPalette(var Message:TMessage); message WM_QUERYNEWPALETTE;//004417F8
    procedure WMPaletteChanged(var Message:TMessage); message WM_PALETTECHANGED;//0044181C
    procedure WMPrintClient(var Message:TWMPrintClient); dynamic;//00443584
    procedure CMDialogKey(var Message:TWMKey); message CM_DIALOGKEY;//00441954
    procedure CMDialogChar(var Message:TWMKey); message CM_DIALOGCHAR;//0044195C
    procedure CMFocusChanged(var Message:TCMFocusChanged); message CM_FOCUSCHANGED;//00441964
    procedure CMVisibleChanged(var Message:TMessage); message CM_VISIBLECHANGED;//0044196C
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//004419C4
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//00441A0C
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//00441A34
    procedure CMCursorChanged(var Message:TMessage); message CM_CURSORCHANGED;//00441A70
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//00441AF0
    procedure CMParentCtl3DChanged(var Message:TMessage); message CM_PARENTCTL3DCHANGED;//00441B30
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//0044199C
    procedure CMEnter(var Message:TWMNoParams); message CM_ENTER;//0044188C
    procedure CMExit(var Message:TWMNoParams); message CM_EXIT;//00441900
    procedure CMDesignHitTest(var Message:TWMMouse); message CM_DESIGNHITTEST;//0044190C
    procedure CMShowHintChanged(var Message:TMessage); message CM_SHOWHINTCHANGED;//0044183C
    procedure CMSysColorChange; message CM_SYSCOLORCHANGE;//00441B70
    procedure CMWinIniChange; message CM_WININICHANGE;//00441B78
    procedure CMFontChange; message CM_FONTCHANGE;//00441B80
    procedure CMTimeChange; message CM_TIMECHANGE;//00441B88
    procedure CMControlListChange(var Message:TMessage); message CM_CONTROLLISTCHANGE;//00441BEC
    procedure CMChildKey(var Message:TMessage); message CM_CHILDKEY;//00441940
    procedure CMDrag(var Message:TCMDrag); message CM_DRAG;//00441B90
    procedure CMRecreateWnd(var Message:TMessage); message CM_RECREATEWND;//0043FA90
    procedure CMInvalidate(var Message:TMessage); message CM_INVALIDATE;//0044231C
    procedure CMSysFontChanged(var Message:TMessage); message CM_SYSFONTCHANGED;//00441C00
    procedure CMChanged(var Message:TMessage); message CM_CHANGED;//0044192C
    procedure CMDockClient(var Message:TCMDockClient); message CM_DOCKCLIENT;//0044116C
    procedure CMUnDockClient(var Message:TCMUnDockClient); message CM_UNDOCKCLIENT;//00441258
    procedure CMFloat(var Message:TCMFloat); message CM_FLOAT;//00441280
    procedure CMBorderChanged(var Message:TMessage); message CM_BORDERCHANGED;//00441AB0
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//00441854
    procedure CNKeyDown(var Message:TWMKeyDown); dynamic;//00441CB0
    procedure CNKeyUp(var Message:TWMKeyUp); dynamic;//00441D94
    procedure CNChar(var Message:TWMChar); dynamic;//00441DE8
    procedure CNSysKeyDown(var Message:TWMKeyDown); dynamic;//00441E34
    procedure CNSysChar(var Message:TWMChar); dynamic;//00441E90
    procedure GetTabOrderList(List:TList); dynamic;//00442874
    procedure Focused; dynamic;//00442490
    procedure FlipChildren(AllLevels:Boolean); dynamic;//0043EE74
    procedure DockDrop(Source:TDragDockObject; X:Integer; Y:Integer); dynamic;//00440E34
    procedure CanFocus; dynamic;//00442418
    procedure ReloadDockedControl(const AControlName:AnsiString; var AControl:TControl); dynamic;//00440F50
    procedure KeyPress(var Key:Char); dynamic;//004414BC
    procedure KeyUp(var Key:Word; Shift:TShiftState); dynamic;//004413EC
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//00441304
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean); dynamic;//00440FAC
    procedure DoUnDock(NewTarget:TWinControl; Client:TControl); dynamic;//00440EF8
    procedure DoRemoveDockClient(Client:TControl); dynamic;//00440DF0
    procedure DoFlipChildren; dynamic;//0043EDA0
    procedure DoExit; dynamic;//00440E14
    procedure DoEnter; dynamic;//00440DF4
    procedure DoDockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//00440E84
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//00440EB8
    procedure DoAddDockClient(Client:TControl; const ARect:TRect); dynamic;//00440DE0
    procedure CreateDockManager; dynamic;//00441048
    procedure sub_00441044; dynamic;//00441044
    procedure SetZOrder(TopMost:Boolean); dynamic;//00442258
    procedure PaletteChanged(Foreground:Boolean); dynamic;//004417A0
    procedure sub_0043DCE4; dynamic;//00442F78
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//00441FE4
    procedure AdjustSize; dynamic;//004425B8
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//00442F38
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//00442A54
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00442A0C
    procedure FixupTabList;//0043E3F8
    procedure AlignControl(AControl:TControl);//0043ECDC
    procedure DisableAlign;//0043ED70
    procedure EnableAlign;//0043ED78
    procedure Realign;//0043ED98
    function ContainsControl(Control:TControl):Boolean;//0043EFB4
    procedure RemoveFocus(Removing:Boolean);//0043EFC8
    procedure Insert(AControl:TControl);//0043EFE8
    procedure Remove(AControl:TControl);//0043F034
    procedure InsertControl(AControl:TControl);//0043F07C
    procedure RemoveControl(AControl:TControl);//0043F150
    function GetControl(Index:Integer):TControl;//0043F1CC
    function GetControlCount:Integer;//0043F208
    procedure Broadcast(var Message:void );//0043F228
    procedure NotifyControls(Msg:Word);//0043F268
    procedure CreateSubClass(var Params:TCreateParams; ControlClassName:PChar);//0043F290
    procedure AddBiDiModeExStyle(var ExStyle:DWORD);//0043F2FC
    procedure ReadDesignSize(Reader:TReader);//0043F6A0
    procedure WriteDesignSize(Writer:TWriter);//0043F6D8
    function PrecedingWindow(Control:TWinControl):HWND;//0043F930
    procedure DestroyHandle;//0043FA30
    procedure RecreateWnd;//0043FA78
    procedure UpdateShowing;//0043FAD0
    procedure UpdateControlState;//0043FBCC
    procedure SetParentWindow(Value:HWND);//0043FC0C
    procedure MainWndProc(var Message:TMessage);//0043FC94
    function ControlAtPos(const Pos:TPoint; AllowDisabled:Boolean; AllowWinControls:Boolean):TControl;//0043FDC4
    function IsControlMouseMsg(var Message:TWMMouse):Boolean;//0043FE58
    procedure PaintHandler(var Message:TWMPaint);//0044018C
    procedure PaintControls(DC:HDC; First:TControl);//004402E4
    procedure PaintTo(DC:HDC; X:Integer; Y:Integer);//00440514
    procedure ResetIme;//00440C5C
    procedure SetIme;//00440D48
    function GetDockClientCount:Integer;//00440F74
    function GetDockClients(Index:Integer):TControl;//00440F88
    function GetVisibleDockClientCount:Integer;//00441008
    procedure SetDockSite(Value:Boolean);//004410B4
    function DoKeyDown(var Message:TWMKey):Boolean;//0044132C
    function DoKeyUp(var Message:TWMKey):Boolean;//00441414
    function DoKeyPress(var Message:TWMKey):Boolean;//004414DC
    function IsMenuKey(var Message:TWMKey):Boolean;//00441C1C
    procedure ScaleControls(M:Integer; D:Integer);//00441F9C
    procedure ScrollBy(DeltaX:Integer; DeltaY:Integer);//00442090
    procedure SetZOrderPosition(Position:Integer);//00442180
    procedure InvalidateFrame;//004423E0
    procedure HandleNeeded;//004424B4
    function GetHandle:HWND;//004424D8
    procedure SetBorderWidth(Value:TBorderWidth);//004425F8
    procedure SetCtl3D(Value:Boolean);//00442618
    function IsCtl3DStored(Value:Boolean):Boolean;//0044263C
    function GetTabOrder:TTabOrder;//00442648
    procedure UpdateTabOrder(Value:TTabOrder);//0044266C
    procedure SetTabOrder(Value:TTabOrder);//004426C8
    procedure SetTabStop(Value:Boolean);//004426E0
    procedure SetUseDockManager(Value:Boolean);//00442740
    function HandleAllocated:Boolean;//004427B0
    procedure UpdateBounds;//004427BC
    function FindNextControl(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean; CheckParent:Boolean):TWinControl;//004428D4
    procedure SelectNext(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean);//004429E0
    procedure CalcConstraints(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//00442B20
    procedure UpdateUIState(CharCode:Word);//00443520
    function GetParentBackground:Boolean;//004435B4
  end;
  TGraphicControl = class(TControl)
  public
    FCanvas:TCanvas;//f160
    destructor Destroy; virtual;//00443658
    constructor Create(AOwner:TComponent); virtual;//v2C//004435FC
    procedure v8C; virtual;//v8C//00443740
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//00443698
  end;
  TCustomControl = class(TWinControl)
  public
    FCanvas:TCanvas;//f208
    destructor Destroy; virtual;//00444094
    constructor Create(AOwner:TComponent); virtual;//v2C//00444038
    procedure PaintWindow(DC:HDC); virtual;//vB8//004440E4
    procedure vC8; virtual;//vC8//00444190
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//004440C4
  end;
  THintWindow = class(TCustomControl)
  public
    FActivating:Boolean;//f210
    FLastActive:Cardinal;//f214
    constructor Create(AOwner:TComponent); virtual;//v2C//00443744
    procedure CreateParams(var Params:TCreateParams); virtual;//v98//004437B0
    procedure Paint; virtual;//vC8//00443880
    //procedure vCC(?:?); virtual;//vCC//00443C98
    procedure ActivateHint(Rect:TRect; const AHint:AnsiString); virtual;//vD0//00443A2C
    procedure ActivateHintData(Rect:TRect; const AHint:AnsiString; AData:Pointer); virtual;//vD4//00443C14
    //procedure vD8(?:?; ?:?; ?:?); virtual;//vD8//00443C3C
    function IsHintMsg(var Msg:TMsg):Boolean; virtual;//vDC//00443928
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//00443814
    procedure WMNCPaint(var Message:TMessage); message WM_NCPAINT;//0044381C
    procedure WMPrint(var Message:TMessage); dynamic;//00443D04
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//00443994
    procedure ReleaseHandle;//0044398C
  end;
  TDockZone = class(TObject)
  public
    FChildControl:TControl;//f4
    FChildZones:TDockZone;//f8
    FNextSibling:TDockZone;//fC
    FOrientation:TDockOrientation;//f10
    FParentZone:TDockZone;//f14
    FPrevSibling:TDockZone;//f18
    FTree:TDockTree;//f1C
    FZoneLimit:Integer;//f20
    FOldSize:Integer;//f24
    constructor Create(Tree:TDockTree);//004441D4
    function GetChildCount:Integer;//004441F8
    function GetVisibleChildCount:Integer;//0044420C
    function GetVisible:Boolean;//00444228
    function GetLimitBegin:Integer;//0044425C
    function GetLimitSize:Integer;//004442A4
    function GetTopLeft(Orient:Integer):Integer;//004442EC
    function GetHeightWidth(Orient:Integer):Integer;//00444358
    procedure ResetChildren;//00444408
    function GetControlName:AnsiString;//004444B0
    function SetControlName(const Value:AnsiString):Boolean;//004444F4
    procedure Update;//004445A8
    function GetZoneLimit:Integer;//00444720
    procedure SetZoneLimit(const Value:Integer);//00444748
    procedure ExpandZoneLimit(NewLimit:Integer);//0044475C
    procedure ResetZoneLimits;//00444798
    function NextVisible:TDockZone;//004447F8
    function PrevVisible:TDockZone;//00444804
    function FirstVisibleChild:TDockZone;//00444820
  end;
  TDockTree = class(TInterfacedObject)
  public
    FBorderWidth:Integer;//fC
    FBrush:TBrush;//f10
    FDockSite:TWinControl;//f14
    FGrabberSize:Integer;//f18
    FGrabbersOnTop:Boolean;//f1C
    FOldRect:TRect;//f1D
    FOldWndProc:TWndMethod;//f30
    FReplacementZone:TDockZone;//f38
    FScaleBy:Double;//f40
    FShiftScaleOrient:TDockOrientation;//f48
    FShiftBy:Integer;//f4C
    FSizePos:TPoint;//f50
    FSizingDC:HDC;//f58
    FSizingWnd:HWND;//f5C
    FSizingZone:TDockZone;//f60
    FTopZone:TDockZone;//f64
    FTopXYLimit:Integer;//f68
    FUpdateCount:Integer;//f6C
    FVersion:Integer;//f70
    destructor Destroy; virtual;//00444994
    procedure AdjustDockRect(Control:TControl; var ARect:TRect); virtual;//v0//004449E8
    function HitTest(const MousePos:TPoint; var HTFlag:Integer):TControl; virtual;//v4//00444B60
    //procedure v8(?:?; ?:?; ?:?); virtual;//v8//00444B70
    procedure LoadFromStream(Stream:TStream); virtual;//vC//00445330
    procedure PaintDockFrame(Canvas:TCanvas; Control:TControl; const ARect:TRect); virtual;//v10//00445618
    //procedure v14(?:?; ?:?; ?:?; ?:?); virtual;//v14//00445858
    procedure RemoveControl(Control:TControl); virtual;//v18//00445A5C
    procedure SaveToStream(Stream:TStream); virtual;//v1C//00445F60
    procedure ResetBounds(Force:Boolean); virtual;//v20//00445D14
    constructor Create(DockSite:TWinControl); virtual;//v24//0044482C
    procedure PaintSite(DC:HDC); virtual;//v28//004456F4
    procedure BeginUpdate;//004449FC
    procedure EndUpdate;//00444A00
    function FindControlZone(Control:TControl):TDockZone;//00444A6C
    procedure ForEachAt(Zone:TDockZone; Proc:TForEachZoneProc);//00444AD4
    procedure InsertNewParent(NewZone:TDockZone; SiblingZone:TDockZone; ParentOrientation:TDockOrientation; InsertLast:Boolean);//00444D80
    procedure InsertSibling(NewZone:TDockZone; SiblingZone:TDockZone; InsertLast:Boolean);//00444F28
    function InternalHitTest(const MousePos:TPoint; var HTFlag:Integer):TDockZone;//00445260
    procedure PruneZone(Zone:TDockZone);//00445A00
    procedure RemoveZone(Zone:TDockZone);//00445A98
    procedure ScaleZone(Zone:TDockZone);//00445DF0
    procedure SetNewBounds(Zone:TDockZone);//00446130
    procedure SetReplacingControl(Control:TControl);//0044615C
    procedure ShiftZone(Zone:TDockZone);//00446174
    procedure SplitterMouseDown(OnZone:TDockZone; MousePos:TPoint);//004461A4
    procedure SplitterMouseUp;//00446204
    procedure UpdateAll;//00446280
    procedure UpdateZone(Zone:TDockZone);//004462A8
    procedure DrawSizeSplitter;//004462B8
    function GetNextLimit(AZone:TDockZone):Integer;//00446434
    procedure ControlVisibilityChanged(Control:TControl; Visible:Boolean);//004466B8
    procedure WindowProc(var Message:TMessage);//004467D0
  end;
  TMouse = class(TObject)
  public
    FDragImmediate:Boolean;//f4
    FDragThreshold:Integer;//f8
    FMousePresent:Boolean;//fC
    FNativeWheelSupport:Boolean;//fD
    FScrollLines:Integer;//f10
    FScrollLinesMessage:UINT;//f14
    FWheelHwnd:HWND;//f18
    FWheelMessage:UINT;//f1C
    FWheelPresent:Boolean;//f20
    FWheelSupportMessage:UINT;//f24
    constructor Create;//00446BB8
    destructor Destroy;//00446C48
    function GetCapture:HWND;//00446C78
    function GetCursorPos:TPoint;//00446C80
    procedure GetMouseData;//00446C90
    procedure GetNativeData;//00446CAC
    procedure GetRegisteredData;//00446CDC
    procedure SetCapture(const Value:HWND);//00446D04
    procedure SettingChanged(Setting:Integer);//00446D2C
  end;
  TSiteList = class(TList)
  public
    procedure Clear; virtual;//v8//00439040
    function Find(ParentWnd:HWND; var Index:Integer):Boolean;//00438F88
    procedure AddSite(ASite:TWinControl);//00438FE4
    function GetTopSite:TWinControl;//00439074
  end;
    procedure ChangeBiDiModeAlignment(var Alignment:TAlignment);//00438AEC
    function InitWndProc(HWindow:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;//00438B00
    function ObjectFromHWnd(Handle:HWND):TWinControl;//00438BB8
    function FindControl(Handle:HWND):TWinControl;//00438BEC
    function SendAppMessage(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;//00438C48
    function CursorToIdent(Cursor:Longint; var Ident:AnsiString):Boolean;//00438E0C
    function IdentToCursor(const Ident:AnsiString; var Cursor:Longint):Boolean;//00438E1C
    function GetShortHint(const Hint:AnsiString):AnsiString;//00438E2C
    function GetLongHint(const Hint:AnsiString):AnsiString;//00438E70
    function GetCaptureControl:TControl;//00438EB4
    procedure SetCaptureControl(Control:TControl);//00438EDC
    function GetTopParent:HWND;//00438FBC
    procedure Clear;//00439040
    procedure Assign(Source:TDragObject);//004390D8
    procedure sub_00439130;//00439130
    function GetName:AnsiString;//00439138
    procedure WndProc(var Msg:TMessage);//00439174
    //function sub_00439270:?;//00439270
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;//00439274
    procedure sub_0043928C;//0043928C
    //function sub_00439290:?;//00439290
    procedure sub_00439298;//00439298
    procedure AfterConstruction;//004392E8
    procedure AfterConstruction;//004392F8
    constructor Create(AControl:TControl);//00439308
    procedure Assign(Source:TDragObject);//0043932C
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer);//00439358
    procedure Finished(Target:TObject; X:Integer; Y:Integer; Accepted:Boolean);//00439384
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;//004393B8
    function GetDragImages:TDragImageList;//004393D0
    procedure HideDragImage;//004393DC
    procedure ShowDragImage;//004393FC
    procedure BeforeDestruction;//0043941C
    constructor Create(AControl:TControl);//00439420
    destructor Destroy;//00439484
    procedure Assign(Source:TDragObject);//004394B4
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer);//00439510
    function AbsMin(Value1:Integer; Value2:Integer):Integer;//00439534
    procedure AdjustDockRect(ARect:TRect);//00439558
    procedure DrawDragDockImage;//004395D4
    procedure EraseDragDockImage;//004395E8
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;//004395FC
    //function sub_00439608:?;//00439608
    procedure BeforeDestruction;//00439610
    function IsBeforeTargetWindow(Window:HWND; Data:Longint):BOOL; stdcall;//00439614
    function ValidDockTarget(Target:TWinControl):Boolean;//00439680
    function IsSiteChildOfClient:Boolean;//00439818
    function GetDockSiteAtPos(MousePos:TPoint; Client:TControl):TWinControl;//0043985C
    procedure RegisterDockSite(Site:TWinControl; DoRegister:Boolean);//004399B8
    function DragMessage(Handle:HWND; Msg:TDragMessage; Source:TDragObject; Target:Pointer; const Pos:TPoint):Longint;//00439A18
    function IsDelphiHandle(Handle:HWND):Boolean;//00439A70
    function DragFindWindow(const Pos:TPoint):HWND;//00439AD0
    function DragFindTarget(const Pos:TPoint; var Handle:HWND; DragKind:TDragKind; Client:TControl):Pointer;//00439AFC
    function DoDragOver(DragMsg:TDragMessage):Boolean;//00439B4C
    function GetDropCtl:TControl;//00439B88
    procedure DragTo(const Pos:TPoint);//00439C1C
    procedure DragInit(ADragObject:TDragObject; Immediate:Boolean; Threshold:Integer);//00439EEC
    procedure DragInitControl(Control:TControl; Immediate:Boolean; Threshold:Integer);//0043A05C
    function CheckUndock:Boolean;//0043A220
    procedure DragDone(Drop:Boolean);//0043A294
    procedure CancelDrag;//0043A56C
    function FindVCLWindow(const Pos:TPoint):TWinControl;//0043A584
    function FindDragTarget(const Pos:TPoint; AllowDisabled:Boolean):TControl;//0043A5B8
    procedure ListAdd(var List:TList; Item:Pointer);//0043A600
    procedure ListRemove(var List:TList; Item:Pointer);//0043A628
    procedure MoveWindowOrg(DC:HDC; DX:Integer; DY:Integer);//0043A648
    procedure FreeDeviceContext;//0043A678
    procedure FreeDeviceContexts;//0043A734
    destructor Destroy;//0043A7E0
    procedure CreateHandle;//0043A80C
    constructor Create(Control:TControl);//0043A92C
    procedure AssignTo(Dest:TPersistent);//0043A968
    procedure Change;//0043AA3C
    procedure AssignClient(AClient:TObject);//0043AA50
    function DoShowHint(var HintStr:AnsiString):Boolean;//0043AA6C
    function IsCaptionLinked:Boolean;//0043AB5C
    function IsEnabledLinked:Boolean;//0043ABD0
    function IsHintLinked:Boolean;//0043AC04
    function IsVisibleLinked:Boolean;//0043AC3C
    function IsOnExecuteLinked:Boolean;//0043AC70
    procedure SetCaption(const Value:AnsiString);//0043AC98
    procedure SetEnabled(Value:Boolean);//0043ACB8
    procedure SetHint(const Value:AnsiString);//0043ACD8
    procedure SetVisible(Value:Boolean);//0043ACFC
    procedure SetOnExecute(Value:TNotifyEvent);//0043AD1C
    function IsHelpLinked:Boolean;//0043AD48
    procedure SetHelpContext(Value:THelpContext);//0043ADAC
    //procedure sub_0043ADCC(?:?);//0043ADCC
    procedure SetHelpType(Value:THelpType);//0043ADEC
    constructor Create(AOwner:TComponent);//0043AE0C
    destructor Destroy;//0043AEE4
    //function sub_0043AF98:?;//0043AF98
    function GetEnabled:Boolean;//0043AF9C
    procedure sub_0043AFA0;//0043AFA0
    procedure HasParent;//0043AFA4
    procedure GetParentComponent;//0043AFAC
    procedure SetParentComponent(Value:TComponent);//0043AFB0
    procedure PaletteChanged(Foreground:Boolean);//0043AFD8
    function GetAction:TBasicAction;//0043B050
    procedure SetDragMode(Value:TDragMode);//0043B114
    procedure RequestAlign;//0043B118
    procedure Resize;//0043B128
    procedure ReadState(Reader:TReader);//0043B148
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0043B1DC
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);//0043B2C8
    procedure Dock(NewDockSite:TWinControl; ARect:TRect);//0043B510
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect);//0043B61C
    function GetClientRect:TRect;//0043B6F8
    //procedure sub_0043B794(?:?);//0043B794
    procedure ChangeScale(M:Integer; D:Integer);//0043B918
    procedure SetAutoSize(Value:Boolean);//0043BACC
    procedure SetName(const Value:TComponentName);//0043BAE4
    procedure SetParent(AParent:TWinControl);//0043BBD0
    procedure SetEnabled(Value:Boolean);//0043BC58
    procedure SetBiDiMode(Value:TBiDiMode);//0043BD90
    procedure IsStoredBiDiMode(Value:TBiDiMode);//0043BE20
    procedure IsStoredColor(Value:TColor);//0043BEB8
    procedure SetParentBiDiMode(Value:Boolean);//0043BEE4
    procedure SetZOrder(TopMost:Boolean);//0043BFEC
    //function sub_0043C010:?;//0043C010
    function BackgroundClipped:Boolean;//0043C0B8
    procedure Invalidate;//0043C1D0
    procedure MouseWheelHandler(var Message:TMessage);//0043C1E0
    procedure Update;//0043C224
    procedure Repaint;//0043C238
    procedure sub_0043C330;//0043C330
    procedure UseRightToLeftAlignment;//0043C34C
    procedure BeginAutoDrag;//0043C380
    procedure sub_0043C45C;//0043C45C
    procedure DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//0043C46C
    procedure DragDrop(Source:TObject; X:Integer; Y:Integer);//0043C4A8
    procedure DoStartDrag(var DragObject:TDragObject);//0043C4D4
    procedure DoEndDrag(Target:TObject; X:Integer; Y:Integer);//0043C4F4
    procedure PositionDockRect(DragDockObject:TDragDockObject);//0043C520
    procedure DockTrackNoTarget(Source:TDragDockObject; X:Integer; Y:Integer);//0043C5F0
    procedure DoEndDock(Target:TObject; X:Integer; Y:Integer);//0043C604
    procedure DoStartDock(var DragObject:TDragObject);//0043C630
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);//0043C650
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);//0043C714
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);//0043C760
    procedure DefaultDockImage(DragDockObject:TDragDockObject; Erase:Boolean);//0043C7AC
    procedure DrawDragDockImage(DragDockObject:TDragDockObject);//0043C8D8
    procedure EraseDragDockImage(DragDockObject:TDragDockObject);//0043C8EC
    //function sub_0043CC70:?;//0043CC70
    function CanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//0043CC74
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//0043CD40
    procedure DesignWndProc(var Message:TMessage);//0043CD9C
    procedure sub_0043CF6C;//0043CF6C
    procedure WndProc(var Message:TMessage);//0043CF70
    procedure DefaultHandler(var Message:void );//0043D104
    function DoWriteIsControl:Boolean;//0043D1AC
    procedure DefineProperties(Filer:TFiler);//0043D1DC
    procedure Click;//0043D22C
    procedure DblClick;//0043D298
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0043D2B8
    procedure WMLButtonDown(var Message:TWMLButtonDown);//0043D374
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//0043D3C0
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk);//0043D3DC
    procedure sub_0043D430;//0043D430
    procedure WMRButtonDown(var Message:TWMRButtonDown);//0043D4D0
    procedure WMRButtonDblClk(var Message:TWMRButtonDblClk);//0043D4F8
    procedure WMMButtonDown(var Message:TWMMButtonDown);//0043D520
    procedure WMMButtonDblClk(var Message:TWMMButtonDblClk);//0043D548
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//0043D570
    procedure WMMouseMove(var Message:TWMMouseMove);//0043D5A0
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0043D618
    procedure WMLButtonUp(var Message:TWMLButtonUp);//0043D688
    procedure WMRButtonUp(var Message:TWMRButtonUp);//0043D700
    procedure WMMButtonUp(var Message:TWMMButtonUp);//0043D720
    procedure WMMouseWheel(var Message:TWMMouseWheel);//0043D740
    procedure WMCancelMode(var Message:TWMCancelMode);//0043D798
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged);//0043D7D8
    procedure CMVisibleChanged(var Message:TMessage);//0043D888
    procedure CMEnabledChanged;//0043D8B0
    procedure CMFontChanged(var Message:TMessage);//0043D8B8
    procedure CMColorChanged(var Message:TMessage);//0043D8C0
    procedure CMParentColorChanged(var Message:TMessage);//0043D8C8
    procedure CMParentBiDiModeChanged(var Message:TMessage);//0043D8F8
    procedure CMMouseWheel(var Message:TCMMouseWheel);//0043D91C
    procedure CMBiDiModeChanged(var Message:TMessage);//0043D978
    procedure CMParentShowHintChanged(var Message:TMessage);//0043D998
    procedure CMParentFontChanged(var Message:TMessage);//0043D9C0
    procedure CMSysFontChanged(var Message:TMessage);//0043D9F0
    procedure CMHitTest(var Message:TWMNCHitTest);//0043DA14
    procedure CMMouseEnter(var Message:TMessage);//0043DA1C
    procedure CMMouseLeave(var Message:TMessage);//0043DA34
    procedure CMDesignHitTest(var Message:TWMMouse);//0043DA4C
    procedure UpdateFloatingDockSitePos;//0043DAD8
    procedure CMFloat(var Message:TCMFloat);//0043DB64
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//0043DBC4
    procedure sub_0043DCE4;//0043DCE4
    procedure Loaded;//0043DDAC
    procedure AssignTo(Dest:TPersistent);//0043DDE4
    //function MinVar(const Data:array[$0..-$1] of System.Double; const _Dv_:?):Integer;//0043DE90
    procedure GetDockEdge(MousePos:TPoint);//0043DECC
    function GetFloating:Boolean;//0043DF7C
    //function sub_0043DFA8:?;//0043DFA8
    procedure AdjustSize;//0043DFB0
    procedure InitiateAction;//0043E02C
    procedure CMHintShow(var Message:TMessage);//0043E03C
    procedure WMContextMenu(var Message:TWMContextMenu);//0043E068
    procedure DoContextPopup(MousePos:TPoint; var Handled:Boolean);//0043E190
    procedure AssignClient(AClient:TObject);//0043E1D0
    procedure IsHelpContextLinked;//0043E1F4
    procedure sub_0043E1FC;//0043E1FC
    constructor Create(AOwner:TComponent);//0043E204
    destructor Destroy;//0043E328
    procedure ReadState(Reader:TReader);//0043E4CC
    procedure sub_0043E544;//0043E544
    function InsertBefore(C1:TControl; C2:TControl; AAlign:TAlign):Boolean;//0043E548
    procedure DoPosition(Control:TControl; AAlign:TAlign; AlignInfo:TAlignInfo);//0043E5D4
    procedure DoAlign(AAlign:TAlign);//0043EA14
    function AlignWork:Boolean;//0043EB84
    procedure AlignControls(AControl:TControl; var Rect:TRect);//0043EBD8
    procedure DoFlipChildren;//0043EDA0
    procedure FlipChildren(AllLevels:Boolean);//0043EE74
    procedure CreateParams(var Params:TCreateParams);//0043F364
    procedure CreateWnd;//0043F490
    procedure CreateWindowHandle(const Params:TCreateParams);//0043F660
    function PointsEqual(const P1:TPoint; const P2:TPoint):Boolean;//0043F72C
    function DoWriteDesignSize:Boolean;//0043F740
    procedure DefineProperties(Filer:TFiler);//0043F818
    procedure DestroyWnd;//0043F874
    procedure DestroyWindowHandle;//0043F8CC
    procedure CreateHandle;//0043F978
    //function sub_0043FA10:?;//0043FA10
    procedure CustomAlignPosition(Control:TControl; var NewLeft:Integer; var NewTop:Integer; var NewWidth:Integer; var NewHeight:Integer; var AlignRect:TRect; AlignInfo:TAlignInfo);//0043FA14
    procedure CMRecreateWnd(var Message:TMessage);//0043FA90
    function GetControlAtPos(AControl:TControl):Boolean;//0043FD0C
    procedure WndProc(var Message:TMessage);//0043FEEC
    procedure DefaultHandler(var Message:void );//00440050
    function DoControlMsg(ControlHandle:HWND; var Message:void ):Boolean;//00440158
    procedure PaintWindow(DC:HDC);//004402BC
    procedure WMPaint(var Message:TWMPaint);//00440668
    procedure WMCharToItem(var Message:TWMCharToItem);//004407C8
    procedure WMNotify(var Message:TWMNotify);//004407E8
    procedure WMSysColorChange(var Message:TWMSysColorChange);//0044080C
    procedure WMWinIniChange(var Message:TMessage);//00440828
    procedure WMFontChange(var Message:TMessage);//0044083C
    procedure WMTimeChange(var Message:TMessage);//0044084C
    procedure WMCommand(var Message:TWMCommand);//0044085C
    procedure WMHScroll(var Message:TWMHScroll);//0044087C
    procedure WMCompareItem(var Message:TWMCompareItem);//0044089C
    procedure WMDeleteItem(var Message:TWMDeleteItem);//004408C0
    procedure WMDrawItem(var Message:TWMDrawItem);//004408E4
    procedure WMMeasureItem(var Message:TWMMeasureItem);//00440908
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//0044092C
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged);//004409B4
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging);//00440A74
    procedure WMSize(var Message:TWMSize);//00440AC4
    procedure WMMove(var Message:TWMMove);//00440AF8
    procedure WMSetCursor(var Message:TWMSetCursor);//00440B0C
    procedure WMKillFocus(var Message:TWMSetFocus);//00440C0C
    procedure WMSetFocus(var Message:TWMSetFocus);//00440C20
    procedure WMIMEStartComp(var Message:TMessage);//00440C34
    procedure WMIMEEndComp(var Message:TMessage);//00440C48
    procedure DoAddDockClient(Client:TControl; const ARect:TRect);//00440DE0
    procedure DoRemoveDockClient(Client:TControl);//00440DF0
    procedure DoEnter;//00440DF4
    procedure DoExit;//00440E14
    procedure DockDrop(Source:TDragDockObject; X:Integer; Y:Integer);//00440E34
    procedure DoDockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//00440E84
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//00440EB8
    procedure DoUnDock(NewTarget:TWinControl; Client:TControl);//00440EF8
    procedure ReloadDockedControl(const AControlName:AnsiString; var AControl:TControl);//00440F50
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);//00440FAC
    procedure sub_00441044;//00441044
    procedure CreateDockManager;//00441048
    procedure CMDockClient(var Message:TCMDockClient);//0044116C
    procedure CMUnDockClient(var Message:TCMUnDockClient);//00441258
    procedure CMFloat(var Message:TCMFloat);//00441280
    procedure KeyDown(var Key:Word; Shift:TShiftState);//00441304
    procedure WMKeyDown(var Message:TWMKeyDown);//00441394
    procedure WMSysKeyDown(var Message:TWMKeyDown);//004413C0
    procedure KeyUp(var Key:Word; Shift:TShiftState);//004413EC
    procedure WMKeyUp(var Message:TWMKeyUp);//0044147C
    procedure WMSysKeyUp(var Message:TWMKeyUp);//0044149C
    procedure KeyPress(var Key:Char);//004414BC
    procedure WMChar(var Message:TWMChar);//00441540
    function TraverseControls(Container:TWinControl):Boolean;//00441560
    procedure WMSysCommand(var Message:TWMSysCommand);//00441610
    procedure WMVKeyToItem(var Message:TWMVKeyToItem);//004416B8
    procedure WMParentNotify(var Message:TWMParentNotify);//004416D8
    procedure WMVScroll(var Message:TWMVScroll);//0044170C
    procedure WMDestroy(var Message:TWMDestroy);//0044172C
    procedure WMNCDestroy(var Message:TWMNCDestroy);//00441760
    procedure WMNCHitTest(var Message:TWMNCHitTest);//0044177C
    procedure PaletteChanged(Foreground:Boolean);//004417A0
    procedure WMQueryNewPalette(var Message:TMessage);//004417F8
    procedure WMPaletteChanged(var Message:TMessage);//0044181C
    procedure CMShowHintChanged(var Message:TMessage);//0044183C
    procedure CMBiDiModeChanged(var Message:TMessage);//00441854
    procedure CMEnter(var Message:TWMNoParams);//0044188C
    procedure CMExit(var Message:TWMNoParams);//00441900
    procedure CMDesignHitTest(var Message:TWMMouse);//0044190C
    procedure CMChanged(var Message:TMessage);//0044192C
    procedure CMChildKey(var Message:TMessage);//00441940
    procedure CMDialogKey(var Message:TWMKey);//00441954
    procedure CMDialogChar(var Message:TWMKey);//0044195C
    procedure CMFocusChanged(var Message:TCMFocusChanged);//00441964
    procedure CMVisibleChanged(var Message:TMessage);//0044196C
    procedure CMShowingChanged(var Message:TMessage);//0044199C
    procedure CMEnabledChanged(var Message:TMessage);//004419C4
    procedure CMColorChanged(var Message:TMessage);//00441A0C
    procedure CMFontChanged(var Message:TMessage);//00441A34
    procedure CMCursorChanged(var Message:TMessage);//00441A70
    procedure CMBorderChanged(var Message:TMessage);//00441AB0
    procedure CMCtl3DChanged(var Message:TMessage);//00441AF0
    procedure CMParentCtl3DChanged(var Message:TMessage);//00441B30
    procedure CMSysColorChange;//00441B70
    procedure CMWinIniChange;//00441B78
    procedure CMFontChange;//00441B80
    procedure CMTimeChange;//00441B88
    procedure CMDrag(var Message:TCMDrag);//00441B90
    procedure CMControlListChange(var Message:TMessage);//00441BEC
    procedure CMSysFontChanged(var Message:TMessage);//00441C00
    procedure CNKeyDown(var Message:TWMKeyDown);//00441CB0
    procedure CNKeyUp(var Message:TWMKeyUp);//00441D94
    procedure CNChar(var Message:TWMChar);//00441DE8
    procedure CNSysKeyDown(var Message:TWMKeyDown);//00441E34
    procedure CNSysChar(var Message:TWMChar);//00441E90
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);//00441EC4
    procedure ChangeScale(M:Integer; D:Integer);//00441FE4
    procedure ShowControl(AControl:TControl);//00442168
    procedure SetZOrder(TopMost:Boolean);//00442258
    function GetDeviceContext(var WindowHandle:HWND):HDC;//004422B8
    procedure Invalidate;//0044230C
    procedure CMInvalidate(var Message:TMessage);//0044231C
    procedure Update;//004423AC
    procedure Repaint;//004423C8
    procedure CanFocus;//00442418
    procedure SetFocus;//00442458
    procedure Focused;//00442490
    //procedure sub_004424EC(?:?);//004424EC
    function GetClientOrigin:TPoint;//00442580
    function GetClientRect:TRect;//004425A0
    procedure AdjustSize;//004425B8
    procedure GetTabOrderList(List:TList);//00442874
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00442A0C
    procedure SetChildOrder(Child:TComponent; Order:Integer);//00442A54
    procedure CanResize(var NewWidth:Integer; var NewHeight:Integer);//00442A94
    procedure DoCalcConstraints(Control:TControl; var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//00442A9C
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//00442EFC
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//00442F38
    procedure sub_0043DCE4;//00442F78
    procedure AssignTo(Dest:TPersistent);//00442F80
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//00442FB0
    procedure WMNCCalcSize(var Message:TWMNCCalcSize);//0044317C
    procedure WMNCPaint(var Message:TMessage);//0044320C
    procedure WMContextMenu(var Message:TWMContextMenu);//004434B4
    procedure WMPrintClient(var Message:TWMPrintClient);//00443584
    procedure SetParentBackground(Value:Boolean);//004435BC
    constructor Create(AOwner:TComponent);//004435FC
    destructor Destroy;//00443658
    procedure WMPaint(var Message:TWMPaint);//00443698
    procedure sub_00443740;//00443740
    constructor Create(AOwner:TComponent);//00443744
    procedure CreateParams(var Params:TCreateParams);//004437B0
    procedure WMNCHitTest(var Message:TWMNCHitTest);//00443814
    procedure WMNCPaint(var Message:TMessage);//0044381C
    procedure Paint;//00443880
    function IsHintMsg(var Msg:TMsg):Boolean;//00443928
    procedure CMTextChanged(var Message:TMessage);//00443994
    procedure ActivateHint(Rect:TRect; const AHint:AnsiString);//00443A2C
    procedure ActivateHintData(Rect:TRect; const AHint:AnsiString; AData:Pointer);//00443C14
    //procedure sub_00443C3C(?:?; ?:?; ?:?);//00443C3C
    //procedure sub_00443C98(?:?);//00443C98
    procedure WMPrint(var Message:TMessage);//00443D04
    function ClientToWindow(Handle:HWND; X:Integer; Y:Integer):TPoint;//00443D28
    procedure CombineDragCursor;//00443D68
    function SetDragImage(Index:Integer; HotSpotX:Integer; HotSpotY:Integer):Boolean;//00443E34
    procedure SetDragCursor(Value:TCursor);//00443E7C
    function BeginDrag(Window:HWND; X:Integer; Y:Integer):Boolean;//00443E94
    function DragLock(Window:HWND; XPos:Integer; YPos:Integer):Boolean;//00443EF4
    procedure DragUnlock;//00443F58
    function DragMove(X:Integer; Y:Integer):Boolean;//00443F7C
    procedure ShowDragImage;//00443FC0
    procedure HideDragImage;//00443FD8
    function EndDrag:Boolean;//00443FF0
    constructor Create(AOwner:TComponent);//00444038
    destructor Destroy;//00444094
    procedure WMPaint(var Message:TWMPaint);//004440C4
    procedure PaintWindow(DC:HDC);//004440E4
    procedure sub_00444190;//00444190
    function NextVisibleZone(StartZone:TDockZone):TDockZone;//00444194
    function IsOrientationSet(Zone:TDockZone):Boolean;//004441B0
    function ParentNotLast:Boolean;//00444578
    function GetLastChildZone(Zone:TDockZone):TDockZone;//0044474C
    constructor Create(DockSite:TWinControl);//0044482C
    destructor Destroy;//00444994
    procedure AdjustDockRect(Control:TControl; var ARect:TRect);//004449E8
    procedure DoFindControlZone(StartZone:TDockZone);//00444A14
    procedure DoForEach(Zone:TDockZone);//00444A98
    //procedure sub_00444AEC(?:?; ?:?; ?:?);//00444AEC
    function HitTest(const MousePos:TPoint; var HTFlag:Integer):TControl;//00444B60
    //procedure sub_00444B70(?:?; ?:?; ?:?);//00444B70
    procedure DoFindZone(Zone:TDockZone);//00444FA0
    function FindControlAtPos(const Pos:TPoint):TControl;//004451CC
    procedure ReadControlName(var ControlName:AnsiString);//004452E8
    procedure LoadFromStream(Stream:TStream);//00445330
    procedure DrawCloseButton(Left:Integer; Top:Integer);//00445538
    procedure DrawGrabberLine(Left:Integer; Top:Integer; Right:Integer; Bottom:Integer);//00445590
    procedure PaintDockFrame(Canvas:TCanvas; Control:TControl; const ARect:TRect);//00445618
    procedure PaintSite(DC:HDC);//004456F4
    //procedure sub_00445858(?:?; ?:?; ?:?; ?:?);//00445858
    procedure DoPrune(Zone:TDockZone);//004459CC
    procedure RemoveControl(Control:TControl);//00445A5C
    procedure ResetBounds(Force:Boolean);//00445D14
    procedure WriteControlName(ControlName:AnsiString);//00445E2C
    procedure DoSaveZone(Zone:TDockZone; Level:Integer);//00445EA4
    procedure SaveToStream(Stream:TStream);//00445F60
    procedure DoSetNewBounds(Zone:TDockZone);//004460A8
    procedure DoGetNextLimit(Zone:TDockZone);//004463A4
    function GetDockAlign(Client:TControl; DropCtl:TControl):TAlign;//00446484
    procedure HideZone(const Zone:TDockZone);//00446500
    procedure ShowZone(const Zone:TDockZone);//00446580
    procedure CalcSplitterPos;//00446740
    procedure InitIMM32;//00446D90
    function Win32NLSEnableIME(hWnd:HWND; Enable:Boolean):Boolean;//00446FF8
    procedure SetImeMode(hWnd:HWND; Mode:TImeMode);//00447014
    function Imm32IsIME(hKl:HKL):Boolean;//004470F0
    procedure DoneControls;//00447104
    procedure InitControls;//0044718C

implementation

//00438AEC
procedure ChangeBiDiModeAlignment(var Alignment:TAlignment);
begin
{*
 00438AEC    mov         dl,byte ptr [eax]
 00438AEE    sub         dl,1
>00438AF1    jb          00438AF7
>00438AF3    je          00438AFB
>00438AF5    jmp         00438AFE
 00438AF7    mov         byte ptr [eax],1
 00438AFA    ret
 00438AFB    mov         byte ptr [eax],0
 00438AFE    ret
*}
end;

//00438B00
function InitWndProc(HWindow:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;
begin
{*
 00438B00    push        ebp
 00438B01    mov         ebp,esp
 00438B03    push        ecx
 00438B04    push        ebx
 00438B05    lea         ebx,[ebp-4]
 00438B08    mov         eax,[005ACB68]
 00438B0D    mov         edx,dword ptr [ebp+8]
 00438B10    mov         dword ptr [eax+180],edx
 00438B16    mov         eax,[005ACB68]
 00438B1B    mov         eax,dword ptr [eax+18C]
 00438B21    push        eax
 00438B22    push        0FC
 00438B24    mov         eax,dword ptr [ebp+8]
 00438B27    push        eax
 00438B28    call        user32.SetWindowLongA
 00438B2D    push        0F0
 00438B2F    mov         eax,dword ptr [ebp+8]
 00438B32    push        eax
 00438B33    call        user32.GetWindowLongA
 00438B38    test        eax,40000000
>00438B3D    je          00438B5D
 00438B3F    push        0F4
 00438B41    mov         eax,dword ptr [ebp+8]
 00438B44    push        eax
 00438B45    call        user32.GetWindowLongA
 00438B4A    test        eax,eax
>00438B4C    jne         00438B5D
 00438B4E    mov         eax,dword ptr [ebp+8]
 00438B51    push        eax
 00438B52    push        0F4
 00438B54    mov         eax,dword ptr [ebp+8]
 00438B57    push        eax
 00438B58    call        user32.SetWindowLongA
 00438B5D    mov         eax,[005ACB68]
 00438B62    push        eax
 00438B63    movzx       eax,word ptr ds:[5E0C1A];ControlAtom:TAtom
 00438B6A    push        eax
 00438B6B    mov         eax,dword ptr [ebp+8]
 00438B6E    push        eax
 00438B6F    call        user32.SetPropA
 00438B74    mov         eax,[005ACB68]
 00438B79    push        eax
 00438B7A    movzx       eax,word ptr ds:[5E0C18];WindowAtom:TAtom
 00438B81    push        eax
 00438B82    mov         eax,dword ptr [ebp+8]
 00438B85    push        eax
 00438B86    call        user32.SetPropA
 00438B8B    push        dword ptr [ebp+14]
 00438B8E    push        dword ptr [ebp+10]
 00438B91    push        dword ptr [ebp+0C]
 00438B94    push        dword ptr [ebp+8]
 00438B97    mov         eax,[005ACB68]
 00438B9C    mov         dword ptr ds:[5ACB68],0
 00438BA6    call        dword ptr [eax+18C]
 00438BAC    mov         dword ptr [ebp-4],eax
 00438BAF    mov         eax,dword ptr [ebx]
 00438BB1    pop         ebx
 00438BB2    pop         ecx
 00438BB3    pop         ebp
 00438BB4    ret         10
*}
end;

//00438BB8
function ObjectFromHWnd(Handle:HWND):TWinControl;
begin
{*
 00438BB8    push        ebx
 00438BB9    push        ecx
 00438BBA    mov         ebx,eax
 00438BBC    push        esp
 00438BBD    push        ebx
 00438BBE    call        user32.GetWindowThreadProcessId
 00438BC3    test        eax,eax
>00438BC5    je          00438BE4
 00438BC7    call        KERNEL32.GetCurrentProcessId
 00438BCC    cmp         eax,dword ptr [esp]
>00438BCF    jne         00438BE4
 00438BD1    push        0
 00438BD3    push        0
 00438BD5    mov         eax,[005E0C24];RM_GetObjectInstance:DWORD
 00438BDA    push        eax
 00438BDB    push        ebx
 00438BDC    call        user32.SendMessageA
 00438BE1    pop         edx
 00438BE2    pop         ebx
 00438BE3    ret
 00438BE4    xor         eax,eax
 00438BE6    pop         edx
 00438BE7    pop         ebx
 00438BE8    ret
*}
end;

//00438BEC
function FindControl(Handle:HWND):TWinControl;
begin
{*
 00438BEC    push        ebx
 00438BED    push        esi
 00438BEE    push        ecx
 00438BEF    mov         ebx,eax
 00438BF1    xor         esi,esi
 00438BF3    test        ebx,ebx
>00438BF5    je          00438C40
 00438BF7    push        esp
 00438BF8    push        ebx
 00438BF9    call        user32.GetWindowThreadProcessId
 00438BFE    test        eax,eax
>00438C00    je          00438C40
 00438C02    call        KERNEL32.GetCurrentProcessId
 00438C07    cmp         eax,dword ptr [esp]
>00438C0A    jne         00438C40
 00438C0C    mov         eax,[005E0C20];ControlAtomString:AnsiString
 00438C11    call        @LStrToPChar
 00438C16    push        eax
 00438C17    call        KERNEL32.GlobalFindAtomA
 00438C1C    cmp         ax,word ptr ds:[5E0C1A];ControlAtom:TAtom
>00438C23    jne         00438C37
 00438C25    movzx       eax,word ptr ds:[5E0C1A];ControlAtom:TAtom
 00438C2C    push        eax
 00438C2D    push        ebx
 00438C2E    call        user32.GetPropA
 00438C33    mov         esi,eax
>00438C35    jmp         00438C40
 00438C37    mov         eax,ebx
 00438C39    call        ObjectFromHWnd
 00438C3E    mov         esi,eax
 00438C40    mov         eax,esi
 00438C42    pop         edx
 00438C43    pop         esi
 00438C44    pop         ebx
 00438C45    ret
*}
end;

//00438C48
function SendAppMessage(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;
begin
{*
 00438C48    push        ebx
 00438C49    push        esi
 00438C4A    mov         ebx,dword ptr ds:[5AE584];^Application:TApplication
 00438C50    mov         ebx,dword ptr [ebx]
 00438C52    mov         esi,dword ptr [ebx+30]
 00438C55    test        esi,esi
>00438C57    je          00438C6A
 00438C59    push        ecx
 00438C5A    push        edx
 00438C5B    push        eax
 00438C5C    mov         eax,[005AE584];^Application:TApplication
 00438C61    push        esi
 00438C62    call        user32.SendMessageA
 00438C67    pop         esi
 00438C68    pop         ebx
 00438C69    ret
 00438C6A    xor         eax,eax
 00438C6C    pop         esi
 00438C6D    pop         ebx
 00438C6E    ret
*}
end;

//00438E0C
function CursorToIdent(Cursor:Longint; var Ident:AnsiString):Boolean;
begin
{*
 00438E0C    push        15
 00438E0E    mov         ecx,5ACB78
 00438E13    call        IntToIdent
 00438E18    ret
*}
end;

//00438E1C
function IdentToCursor(const Ident:AnsiString; var Cursor:Longint):Boolean;
begin
{*
 00438E1C    push        15
 00438E1E    mov         ecx,5ACB78
 00438E23    call        IdentToInt
 00438E28    ret
*}
end;

//00438E2C
function GetShortHint(const Hint:AnsiString):AnsiString;
begin
{*
 00438E2C    push        ebx
 00438E2D    push        esi
 00438E2E    push        edi
 00438E2F    mov         edi,edx
 00438E31    mov         esi,eax
 00438E33    mov         edx,esi
 00438E35    mov         eax,438E6C;'|'
 00438E3A    call        AnsiPos
 00438E3F    mov         ebx,eax
 00438E41    test        ebx,ebx
>00438E43    jne         00438E50
 00438E45    mov         eax,edi
 00438E47    mov         edx,esi
 00438E49    call        @LStrAsg
>00438E4E    jmp         00438E60
 00438E50    push        edi
 00438E51    mov         ecx,ebx
 00438E53    dec         ecx
 00438E54    mov         edx,1
 00438E59    mov         eax,esi
 00438E5B    call        @LStrCopy
 00438E60    pop         edi
 00438E61    pop         esi
 00438E62    pop         ebx
 00438E63    ret
*}
end;

//00438E70
function GetLongHint(const Hint:AnsiString):AnsiString;
begin
{*
 00438E70    push        ebx
 00438E71    push        esi
 00438E72    push        edi
 00438E73    mov         edi,edx
 00438E75    mov         esi,eax
 00438E77    mov         edx,esi
 00438E79    mov         eax,438EB0;'|'
 00438E7E    call        AnsiPos
 00438E83    mov         ebx,eax
 00438E85    test        ebx,ebx
>00438E87    jne         00438E94
 00438E89    mov         eax,edi
 00438E8B    mov         edx,esi
 00438E8D    call        @LStrAsg
>00438E92    jmp         00438EA4
 00438E94    push        edi
 00438E95    lea         edx,[ebx+1]
 00438E98    mov         ecx,7FFFFFFF
 00438E9D    mov         eax,esi
 00438E9F    call        @LStrCopy
 00438EA4    pop         edi
 00438EA5    pop         esi
 00438EA6    pop         ebx
 00438EA7    ret
*}
end;

//00438EB4
function GetCaptureControl:TControl;
begin
{*
 00438EB4    call        user32.GetCapture
 00438EB9    call        FindControl
 00438EBE    test        eax,eax
>00438EC0    je          00438EDB
 00438EC2    cmp         dword ptr ds:[5ACC28],0
>00438EC9    je          00438EDB
 00438ECB    mov         edx,dword ptr ds:[5ACC28]
 00438ED1    cmp         eax,dword ptr [edx+30]
>00438ED4    jne         00438EDB
 00438ED6    mov         eax,[005ACC28]
 00438EDB    ret
*}
end;

//00438EDC
procedure SetCaptureControl(Control:TControl);
begin
{*
 00438EDC    push        ebx
 00438EDD    mov         ebx,eax
 00438EDF    call        user32.ReleaseCapture
 00438EE4    xor         eax,eax
 00438EE6    mov         [005ACC28],eax
 00438EEB    test        ebx,ebx
>00438EED    je          00438F1C
 00438EEF    mov         eax,ebx
 00438EF1    mov         edx,dword ptr ds:[4380F4];TWinControl
 00438EF7    call        @IsClass
 00438EFC    test        al,al
>00438EFE    jne         00438F0F
 00438F00    cmp         dword ptr [ebx+30],0
>00438F04    je          00438F1C
 00438F06    mov         dword ptr ds:[5ACC28],ebx
 00438F0C    mov         ebx,dword ptr [ebx+30]
 00438F0F    mov         eax,ebx
 00438F11    call        TWinControl.GetHandle
 00438F16    push        eax
 00438F17    call        user32.SetCapture
 00438F1C    pop         ebx
 00438F1D    ret
*}
end;

//00438F88
function TSiteList.Find(ParentWnd:HWND; var Index:Integer):Boolean;
begin
{*
 00438F88    push        ebx
 00438F89    push        esi
 00438F8A    push        edi
 00438F8B    mov         ebx,ecx
 00438F8D    mov         edi,edx
 00438F8F    mov         esi,eax
 00438F91    xor         eax,eax
 00438F93    mov         dword ptr [ebx],eax
 00438F95    xor         eax,eax
>00438F97    jmp         00438FAE
 00438F99    mov         edx,dword ptr [ebx]
 00438F9B    mov         eax,esi
 00438F9D    call        TList.Get
 00438FA2    cmp         edi,dword ptr [eax+4]
 00438FA5    sete        al
 00438FA8    test        al,al
>00438FAA    jne         00438FB5
 00438FAC    inc         dword ptr [ebx]
 00438FAE    mov         edx,dword ptr [ebx]
 00438FB0    cmp         edx,dword ptr [esi+8]
>00438FB3    jl          00438F99
 00438FB5    pop         edi
 00438FB6    pop         esi
 00438FB7    pop         ebx
 00438FB8    ret
*}
end;

//00438FBC
function GetTopParent:HWND;
begin
{*
 00438FBC    push        ebp
 00438FBD    mov         ebp,esp
 00438FBF    push        ebx
 00438FC0    mov         eax,dword ptr [ebp+8]
 00438FC3    mov         eax,dword ptr [eax-4]
 00438FC6    call        TWinControl.GetHandle
 00438FCB    mov         ebx,eax
 00438FCD    test        eax,eax
>00438FCF    je          00438FDD
 00438FD1    mov         ebx,eax
 00438FD3    push        eax
 00438FD4    call        user32.GetParent
 00438FD9    test        eax,eax
>00438FDB    jne         00438FD1
 00438FDD    mov         eax,ebx
 00438FDF    pop         ebx
 00438FE0    pop         ebp
 00438FE1    ret
*}
end;

//00438FE4
procedure TSiteList.AddSite(ASite:TWinControl);
begin
{*
 00438FE4    push        ebp
 00438FE5    mov         ebp,esp
 00438FE7    add         esp,0FFFFFFF8
 00438FEA    push        ebx
 00438FEB    push        esi
 00438FEC    push        edi
 00438FED    mov         dword ptr [ebp-4],edx
 00438FF0    mov         esi,eax
 00438FF2    mov         eax,8
 00438FF7    call        @GetMem
 00438FFC    mov         ebx,eax
 00438FFE    mov         eax,dword ptr [ebp-4]
 00439001    mov         dword ptr [ebx],eax
 00439003    push        ebp
 00439004    call        GetTopParent
 00439009    pop         ecx
 0043900A    mov         edi,eax
 0043900C    mov         dword ptr [ebx+4],edi
 0043900F    lea         ecx,[ebp-8]
 00439012    mov         edx,edi
 00439014    mov         eax,esi
 00439016    call        TSiteList.Find
 0043901B    test        al,al
>0043901D    je          0043902D
 0043901F    mov         ecx,ebx
 00439021    mov         edx,dword ptr [ebp-8]
 00439024    mov         eax,esi
 00439026    call        TList.Insert
>0043902B    jmp         00439036
 0043902D    mov         edx,ebx
 0043902F    mov         eax,esi
 00439031    call        TList.Add
 00439036    pop         edi
 00439037    pop         esi
 00439038    pop         ebx
 00439039    pop         ecx
 0043903A    pop         ecx
 0043903B    pop         ebp
 0043903C    ret
*}
end;

//00439040
procedure TSiteList.Clear;
begin
{*
 00439040    push        ebx
 00439041    push        esi
 00439042    push        edi
 00439043    mov         edi,eax
 00439045    mov         ebx,dword ptr [edi+8]
 00439048    dec         ebx
 00439049    test        ebx,ebx
>0043904B    jl          00439067
 0043904D    inc         ebx
 0043904E    xor         esi,esi
 00439050    mov         edx,esi
 00439052    mov         eax,edi
 00439054    call        TList.Get
 00439059    mov         edx,8
 0043905E    call        @FreeMem
 00439063    inc         esi
 00439064    dec         ebx
>00439065    jne         00439050
 00439067    mov         eax,edi
 00439069    call        TList.Clear
 0043906E    pop         edi
 0043906F    pop         esi
 00439070    pop         ebx
 00439071    ret
*}
end;

//00439074
function TSiteList.GetTopSite:TWinControl;
begin
{*
 00439074    push        ebx
 00439075    push        esi
 00439076    push        edi
 00439077    push        ecx
 00439078    mov         ebx,eax
 0043907A    xor         edi,edi
 0043907C    mov         eax,dword ptr [ebx+8]
 0043907F    test        eax,eax
>00439081    je          004390D0
 00439083    dec         eax
>00439084    jne         00439093
 00439086    xor         edx,edx
 00439088    mov         eax,ebx
 0043908A    call        TList.Get
 0043908F    mov         edi,dword ptr [eax]
>00439091    jmp         004390D0
 00439093    call        user32.GetDesktopWindow
 00439098    push        eax
 00439099    call        user32.GetTopWindow
 0043909E    mov         esi,eax
>004390A0    jmp         004390C8
 004390A2    mov         ecx,esp
 004390A4    mov         edx,esi
 004390A6    mov         eax,ebx
 004390A8    call        TSiteList.Find
 004390AD    test        al,al
>004390AF    je          004390BE
 004390B1    mov         eax,dword ptr [ebx+4]
 004390B4    mov         edx,dword ptr [esp]
 004390B7    mov         eax,dword ptr [eax+edx*4]
 004390BA    mov         edi,dword ptr [eax]
>004390BC    jmp         004390C8
 004390BE    push        2
 004390C0    push        esi
 004390C1    call        user32.GetWindow
 004390C6    mov         esi,eax
 004390C8    test        edi,edi
>004390CA    jne         004390D0
 004390CC    test        esi,esi
>004390CE    jne         004390A2
 004390D0    mov         eax,edi
 004390D2    pop         edx
 004390D3    pop         edi
 004390D4    pop         esi
 004390D5    pop         ebx
 004390D6    ret
*}
end;

//004390D8
procedure TDragObject.Assign(Source:TDragObject);
begin
{*
 004390D8    mov         ecx,dword ptr [edx+4]
 004390DB    mov         dword ptr [eax+4],ecx
 004390DE    mov         ecx,dword ptr [edx+8]
 004390E1    mov         dword ptr [eax+8],ecx
 004390E4    mov         ecx,dword ptr [edx+0C]
 004390E7    mov         dword ptr [eax+0C],ecx
 004390EA    mov         ecx,dword ptr [edx+10]
 004390ED    mov         dword ptr [eax+10],ecx
 004390F0    mov         ecx,dword ptr [edx+14]
 004390F3    mov         dword ptr [eax+14],ecx
 004390F6    mov         ecx,dword ptr [edx+18]
 004390F9    mov         dword ptr [eax+18],ecx
 004390FC    mov         ecx,dword ptr [edx+20]
 004390FF    mov         dword ptr [eax+20],ecx
 00439102    mov         ecx,dword ptr [edx+24]
 00439105    mov         dword ptr [eax+24],ecx
 00439108    mov         ecx,dword ptr [edx+28]
 0043910B    mov         dword ptr [eax+28],ecx
 0043910E    mov         ecx,dword ptr [edx+2C]
 00439111    mov         dword ptr [eax+2C],ecx
 00439114    ret
*}
end;

//00439118
function TDragObject.Capture:HWND;
begin
{*
 00439118    push        ebx
 00439119    push        eax
 0043911A    push        43929C;TDragObject.MainWndProc
 0043911F    call        AllocateHWnd
 00439124    mov         ebx,eax
 00439126    push        ebx
 00439127    call        user32.SetCapture
 0043912C    mov         eax,ebx
 0043912E    pop         ebx
 0043912F    ret
*}
end;

//00439130
procedure sub_00439130;
begin
{*
 00439130    push        ebp
 00439131    mov         ebp,esp
 00439133    pop         ebp
 00439134    ret         8
*}
end;

//00439138
function TDragObject.GetName:AnsiString;
begin
{*
 00439138    push        ebx
 00439139    push        esi
 0043913A    add         esp,0FFFFFF00
 00439140    mov         esi,edx
 00439142    mov         ebx,eax
 00439144    mov         edx,esp
 00439146    mov         eax,dword ptr [ebx]
 00439148    call        TObject.ClassName
 0043914D    mov         edx,esp
 0043914F    mov         eax,esi
 00439151    call        @LStrFromString
 00439156    add         esp,100
 0043915C    pop         esi
 0043915D    pop         ebx
 0043915E    ret
*}
end;

//00439160
procedure TDragObject.ReleaseCapture(Handle:HWND);
begin
{*
 00439160    push        ebx
 00439161    mov         ebx,edx
 00439163    call        user32.ReleaseCapture
 00439168    mov         eax,ebx
 0043916A    call        DeallocateHWnd
 0043916F    pop         ebx
 00439170    ret
*}
end;

//00439174
procedure TDragObject.WndProc(var Msg:TMessage);
begin
{*
 00439174    push        ebp
 00439175    mov         ebp,esp
 00439177    add         esp,0FFFFFFF4
 0043917A    push        ebx
 0043917B    push        esi
 0043917C    push        edi
 0043917D    mov         ebx,edx
 0043917F    mov         dword ptr [ebp-4],eax
 00439182    xor         eax,eax
 00439184    push        ebp
 00439185    push        43923E
 0043918A    push        dword ptr fs:[eax]
 0043918D    mov         dword ptr fs:[eax],esp
 00439190    mov         eax,dword ptr [ebx]
 00439192    cmp         eax,215
>00439197    jg          004391B1
>00439199    je          004391E1
 0043919B    sub         eax,200
>004391A0    je          004391BD
 004391A2    sub         eax,2
>004391A5    je          004391EA
 004391A7    sub         eax,3
>004391AA    je          004391EA
>004391AC    jmp         00439234
 004391B1    sub         eax,0BD00
>004391B6    je          00439208
 004391B8    dec         eax
>004391B9    je          004391F3
>004391BB    jmp         00439234
 004391BD    lea         edx,[ebp-0C]
 004391C0    mov         eax,dword ptr [ebx+8]
 004391C3    call        SmallPointToPoint
 004391C8    lea         eax,[ebp-0C]
 004391CB    push        eax
 004391CC    mov         eax,[005E0C34];DragCapture:HWND
 004391D1    push        eax
 004391D2    call        user32.ClientToScreen
 004391D7    lea         eax,[ebp-0C]
 004391DA    call        DragTo
>004391DF    jmp         00439234
 004391E1    xor         eax,eax
 004391E3    call        DragDone
>004391E8    jmp         00439234
 004391EA    mov         al,1
 004391EC    call        DragDone
>004391F1    jmp         00439234
 004391F3    cmp         dword ptr [ebx+4],11
>004391F7    jne         00439234
 004391F9    mov         eax,[005E0C2C]
 004391FE    add         eax,0C
 00439201    call        DragTo
>00439206    jmp         00439234
 00439208    mov         eax,dword ptr [ebx+4]
 0043920B    sub         eax,11
>0043920E    je          00439217
 00439210    sub         eax,0A
>00439213    je          00439226
>00439215    jmp         00439234
 00439217    mov         eax,[005E0C2C]
 0043921C    add         eax,0C
 0043921F    call        DragTo
>00439224    jmp         00439234
 00439226    mov         dword ptr [ebx+0C],1
 0043922D    xor         eax,eax
 0043922F    call        DragDone
 00439234    xor         eax,eax
 00439236    pop         edx
 00439237    pop         ecx
 00439238    pop         ecx
 00439239    mov         dword ptr fs:[eax],edx
>0043923C    jmp         00439267
>0043923E    jmp         @HandleAnyException
 00439243    cmp         dword ptr ds:[5E0C28],0;DragControl:TControl
>0043924A    je          00439253
 0043924C    xor         eax,eax
 0043924E    call        DragDone
 00439253    mov         eax,[005AE584];^Application:TApplication
 00439258    mov         eax,dword ptr [eax]
 0043925A    mov         edx,dword ptr [ebp-4]
 0043925D    call        TApplication.HandleException
 00439262    call        @DoneExcept
 00439267    pop         edi
 00439268    pop         esi
 00439269    pop         ebx
 0043926A    mov         esp,ebp
 0043926C    pop         ebp
 0043926D    ret
*}
end;

//00439270
{*function sub_00439270:?;
begin
 00439270    xor         eax,eax
 00439272    ret
end;*}

//00439274
function TDragObject.GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;
begin
{*
 00439274    push        ebp
 00439275    mov         ebp,esp
 00439277    test        dl,dl
>00439279    je          00439281
 0043927B    mov         ax,0FFF4
>0043927F    jmp         00439285
 00439281    mov         ax,0FFF3
 00439285    pop         ebp
 00439286    ret         4
*}
end;

//0043928C
procedure sub_0043928C;
begin
{*
 0043928C    ret
*}
end;

//00439290
{*function sub_00439290:?;
begin
 00439290    mov         eax,[005AF664];gvar_005AF664
 00439295    ret
end;*}

//00439298
procedure sub_00439298;
begin
{*
 00439298    ret
*}
end;

//0043929C
procedure TDragObject.MainWndProc(var Message:TMessage);
begin
{*
 0043929C    push        ebp
 0043929D    mov         ebp,esp
 0043929F    push        ecx
 004392A0    push        ebx
 004392A1    push        esi
 004392A2    push        edi
 004392A3    mov         dword ptr [ebp-4],eax
 004392A6    xor         eax,eax
 004392A8    push        ebp
 004392A9    push        4392C6
 004392AE    push        dword ptr fs:[eax]
 004392B1    mov         dword ptr fs:[eax],esp
 004392B4    mov         eax,dword ptr [ebp-4]
 004392B7    mov         ecx,dword ptr [eax]
 004392B9    call        dword ptr [ecx+0C]
 004392BC    xor         eax,eax
 004392BE    pop         edx
 004392BF    pop         ecx
 004392C0    pop         ecx
 004392C1    mov         dword ptr fs:[eax],edx
>004392C4    jmp         004392DF
>004392C6    jmp         @HandleAnyException
 004392CB    mov         eax,[005AE584];^Application:TApplication
 004392D0    mov         eax,dword ptr [eax]
 004392D2    mov         edx,dword ptr [ebp-4]
 004392D5    call        TApplication.HandleException
 004392DA    call        @DoneExcept
 004392DF    pop         edi
 004392E0    pop         esi
 004392E1    pop         ebx
 004392E2    pop         ecx
 004392E3    pop         ebp
 004392E4    ret
*}
end;

//004392E8
procedure TDragObject.AfterConstruction;
begin
{*
 004392E8    call        TCustomVariantType.BeforeDestruction
 004392ED    xor         eax,eax
 004392EF    mov         [005E0C58],eax;DragSave:TDragObject
 004392F4    ret
*}
end;

//004392F8
procedure TDragObject.AfterConstruction;
begin
{*
 004392F8    call        TObject.AfterConstruction
 004392FD    xor         eax,eax
 004392FF    mov         [005E0C58],eax;DragSave:TDragObject
 00439304    ret
*}
end;

//00439308
constructor TBaseDragControlObject.Create(AControl:TControl);
begin
{*
 00439308    test        dl,dl
>0043930A    je          00439314
 0043930C    add         esp,0FFFFFFF0
 0043930F    call        @ClassCreate
 00439314    mov         dword ptr [eax+38],ecx
 00439317    test        dl,dl
>00439319    je          0043932A
 0043931B    call        @AfterConstruction
 00439320    pop         dword ptr fs:[0]
 00439327    add         esp,0C
 0043932A    ret
*}
end;

//0043932C
procedure TBaseDragControlObject.Assign(Source:TDragObject);
begin
{*
 0043932C    push        ebx
 0043932D    push        esi
 0043932E    mov         esi,edx
 00439330    mov         ebx,eax
 00439332    mov         edx,esi
 00439334    mov         eax,ebx
 00439336    call        TDragObject.Assign
 0043933B    mov         eax,esi
 0043933D    mov         edx,dword ptr ds:[436C94];TBaseDragControlObject
 00439343    call        @IsClass
 00439348    test        al,al
>0043934A    je          00439352
 0043934C    mov         eax,dword ptr [esi+38]
 0043934F    mov         dword ptr [ebx+38],eax
 00439352    pop         esi
 00439353    pop         ebx
 00439354    ret
*}
end;

//00439358
procedure TBaseDragControlObject.EndDrag(Target:TObject; X:Integer; Y:Integer);
begin
{*
 00439358    push        ebp
 00439359    mov         ebp,esp
 0043935B    push        ecx
 0043935C    push        esi
 0043935D    push        edi
 0043935E    mov         dword ptr [ebp-4],ecx
 00439361    mov         edi,edx
 00439363    mov         esi,eax
 00439365    mov         eax,dword ptr [ebp+8]
 00439368    push        eax
 00439369    mov         ecx,dword ptr [ebp-4]
 0043936C    mov         edx,edi
 0043936E    mov         eax,dword ptr [esi+38]
 00439371    mov         si,0FFDD
 00439375    call        @CallDynaInst
 0043937A    pop         edi
 0043937B    pop         esi
 0043937C    pop         ecx
 0043937D    pop         ebp
 0043937E    ret         4
*}
end;

//00439384
procedure TBaseDragControlObject.Finished(Target:TObject; X:Integer; Y:Integer; Accepted:Boolean);
begin
{*
 00439384    push        ebp
 00439385    mov         ebp,esp
 00439387    push        ebx
 00439388    push        esi
 00439389    push        edi
 0043938A    mov         edi,ecx
 0043938C    mov         ebx,eax
 0043938E    cmp         byte ptr [ebp+8],0
>00439392    jne         004393A2
 00439394    mov         eax,dword ptr [ebx+38]
 00439397    mov         si,0FFDF
 0043939B    call        @CallDynaInst
 004393A0    xor         edx,edx
 004393A2    mov         eax,dword ptr [ebp+0C]
 004393A5    push        eax
 004393A6    mov         ecx,edi
 004393A8    mov         eax,ebx
 004393AA    mov         ebx,dword ptr [eax]
 004393AC    call        dword ptr [ebx+24]
 004393AF    pop         edi
 004393B0    pop         esi
 004393B1    pop         ebx
 004393B2    pop         ebp
 004393B3    ret         8
*}
end;

//004393B8
function TDragControlObject.GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;
begin
{*
 004393B8    push        ebp
 004393B9    mov         ebp,esp
 004393BB    test        dl,dl
>004393BD    je          004393C8
 004393BF    mov         eax,dword ptr [eax+38]
 004393C2    mov         ax,word ptr [eax+7A]
>004393C6    jmp         004393CC
 004393C8    mov         ax,0FFF3
 004393CC    pop         ebp
 004393CD    ret         4
*}
end;

//004393D0
function TDragControlObject.GetDragImages:TDragImageList;
begin
{*
 004393D0    mov         eax,dword ptr [eax+38]
 004393D3    mov         edx,dword ptr [eax]
 004393D5    call        dword ptr [edx+4C]
 004393D8    ret
*}
end;

//004393DC
procedure TDragControlObject.HideDragImage;
begin
{*
 004393DC    push        ebx
 004393DD    mov         ebx,eax
 004393DF    mov         eax,dword ptr [ebx+38]
 004393E2    mov         edx,dword ptr [eax]
 004393E4    call        dword ptr [edx+4C]
 004393E7    test        eax,eax
>004393E9    je          004393F8
 004393EB    mov         eax,dword ptr [ebx+38]
 004393EE    mov         edx,dword ptr [eax]
 004393F0    call        dword ptr [edx+4C]
 004393F3    call        TDragImageList.HideDragImage
 004393F8    pop         ebx
 004393F9    ret
*}
end;

//004393FC
procedure TDragControlObject.ShowDragImage;
begin
{*
 004393FC    push        ebx
 004393FD    mov         ebx,eax
 004393FF    mov         eax,dword ptr [ebx+38]
 00439402    mov         edx,dword ptr [eax]
 00439404    call        dword ptr [edx+4C]
 00439407    test        eax,eax
>00439409    je          00439418
 0043940B    mov         eax,dword ptr [ebx+38]
 0043940E    mov         edx,dword ptr [eax]
 00439410    call        dword ptr [edx+4C]
 00439413    call        TDragImageList.ShowDragImage
 00439418    pop         ebx
 00439419    ret
*}
end;

//0043941C
procedure TDragControlObjectEx.BeforeDestruction;
begin
{*
 0043941C    ret
*}
end;

//00439420
constructor TDragDockObject.Create(AControl:TControl);
begin
{*
 00439420    push        ebp
 00439421    mov         ebp,esp
 00439423    push        ecx
 00439424    push        ebx
 00439425    push        esi
 00439426    test        dl,dl
>00439428    je          00439432
 0043942A    add         esp,0FFFFFFF0
 0043942D    call        @ClassCreate
 00439432    mov         byte ptr [ebp-1],dl
 00439435    mov         ebx,eax
 00439437    xor         edx,edx
 00439439    mov         eax,ebx
 0043943B    call        TBaseDragControlObject.Create
 00439440    mov         dl,1
 00439442    mov         eax,[00424798];TBrush
 00439447    call        TBrush.Create
 0043944C    mov         esi,eax
 0043944E    mov         dword ptr [ebx+40],esi
 00439451    mov         edx,0FFFFFF
 00439456    xor         eax,eax
 00439458    call        AllocPatternBitmap
 0043945D    mov         edx,eax
 0043945F    mov         eax,esi
 00439461    call        TBrush.SetBitmap
 00439466    mov         eax,ebx
 00439468    cmp         byte ptr [ebp-1],0
>0043946C    je          0043947D
 0043946E    call        @AfterConstruction
 00439473    pop         dword ptr fs:[0]
 0043947A    add         esp,0C
 0043947D    mov         eax,ebx
 0043947F    pop         esi
 00439480    pop         ebx
 00439481    pop         ecx
 00439482    pop         ebp
 00439483    ret
*}
end;

//00439484
destructor TDragDockObject.Destroy;
begin
{*
 00439484    push        ebx
 00439485    push        esi
 00439486    call        @BeforeDestruction
 0043948B    mov         ebx,edx
 0043948D    mov         esi,eax
 0043948F    mov         eax,dword ptr [esi+40]
 00439492    call        TObject.Free
 00439497    mov         edx,ebx
 00439499    and         dl,0FC
 0043949C    mov         eax,esi
 0043949E    call        TObject.Destroy
 004394A3    test        bl,bl
>004394A5    jle         004394AE
 004394A7    mov         eax,esi
 004394A9    call        @ClassDestroy
 004394AE    pop         esi
 004394AF    pop         ebx
 004394B0    ret
*}
end;

//004394B4
procedure TDragDockObject.Assign(Source:TDragObject);
begin
{*
 004394B4    push        ebx
 004394B5    push        esi
 004394B6    push        edi
 004394B7    mov         esi,edx
 004394B9    mov         ebx,eax
 004394BB    mov         edx,esi
 004394BD    mov         eax,ebx
 004394BF    call        TBaseDragControlObject.Assign
 004394C4    mov         eax,esi
 004394C6    mov         edx,dword ptr ds:[436E74];TDragDockObject
 004394CC    call        @IsClass
 004394D1    test        al,al
>004394D3    je          0043950C
 004394D5    mov         eax,esi
 004394D7    mov         dl,byte ptr [eax+54]
 004394DA    mov         byte ptr [ebx+54],dl
 004394DD    mov         edx,dword ptr [eax+58]
 004394E0    mov         dword ptr [ebx+58],edx
 004394E3    mov         dl,byte ptr [eax+6C]
 004394E6    mov         byte ptr [ebx+6C],dl
 004394E9    push        esi
 004394EA    lea         esi,[eax+44]
 004394ED    lea         edi,[ebx+44]
 004394F0    movs        dword ptr [edi],dword ptr [esi]
 004394F1    movs        dword ptr [edi],dword ptr [esi]
 004394F2    movs        dword ptr [edi],dword ptr [esi]
 004394F3    movs        dword ptr [edi],dword ptr [esi]
 004394F4    pop         esi
 004394F5    push        esi
 004394F6    lea         esi,[eax+5C]
 004394F9    lea         edi,[ebx+5C]
 004394FC    movs        dword ptr [edi],dword ptr [esi]
 004394FD    movs        dword ptr [edi],dword ptr [esi]
 004394FE    movs        dword ptr [edi],dword ptr [esi]
 004394FF    movs        dword ptr [edi],dword ptr [esi]
 00439500    pop         esi
 00439501    mov         edx,dword ptr [eax+40]
 00439504    mov         eax,dword ptr [ebx+40]
 00439507    mov         ecx,dword ptr [eax]
 00439509    call        dword ptr [ecx+8]
 0043950C    pop         edi
 0043950D    pop         esi
 0043950E    pop         ebx
 0043950F    ret
*}
end;

//00439510
procedure TDragDockObject.EndDrag(Target:TObject; X:Integer; Y:Integer);
begin
{*
 00439510    push        ebp
 00439511    mov         ebp,esp
 00439513    push        esi
 00439514    push        edi
 00439515    mov         edi,edx
 00439517    mov         esi,eax
 00439519    mov         eax,dword ptr [ebp+8]
 0043951C    push        eax
 0043951D    mov         edx,edi
 0043951F    mov         eax,dword ptr [esi+38]
 00439522    mov         si,0FFE5
 00439526    call        @CallDynaInst
 0043952B    pop         edi
 0043952C    pop         esi
 0043952D    pop         ebp
 0043952E    ret         4
*}
end;

//00439534
function AbsMin(Value1:Integer; Value2:Integer):Integer;
begin
{*
 00439534    push        ebx
 00439535    push        esi
 00439536    mov         ebx,edx
 00439538    mov         ecx,eax
 0043953A    mov         eax,ecx
 0043953C    cdq
 0043953D    xor         eax,edx
 0043953F    sub         eax,edx
 00439541    mov         esi,eax
 00439543    mov         eax,ebx
 00439545    cdq
 00439546    xor         eax,edx
 00439548    sub         eax,edx
 0043954A    cmp         esi,eax
>0043954C    jge         00439553
 0043954E    mov         eax,ecx
 00439550    pop         esi
 00439551    pop         ebx
 00439552    ret
 00439553    mov         eax,ebx
 00439555    pop         esi
 00439556    pop         ebx
 00439557    ret
*}
end;

//00439558
procedure TDragDockObject.AdjustDockRect(ARect:TRect);
begin
{*
 00439558    push        ebx
 00439559    push        esi
 0043955A    push        edi
 0043955B    add         esp,0FFFFFFF0
 0043955E    mov         esi,edx
 00439560    lea         edi,[esp]
 00439563    movs        dword ptr [edi],dword ptr [esi]
 00439564    movs        dword ptr [edi],dword ptr [esi]
 00439565    movs        dword ptr [edi],dword ptr [esi]
 00439566    movs        dword ptr [edi],dword ptr [esi]
 00439567    mov         ebx,eax
 00439569    mov         eax,dword ptr [ebx+0C]
 0043956C    mov         edx,dword ptr [esp]
 0043956F    cmp         eax,edx
>00439571    jl          00439579
 00439573    cmp         eax,dword ptr [esp+8]
>00439577    jle         0043958D
 00439579    sub         edx,eax
 0043957B    mov         ecx,dword ptr [esp+8]
 0043957F    sub         ecx,eax
 00439581    mov         eax,ecx
 00439583    xchg        eax,edx
 00439584    call        AbsMin
 00439589    mov         esi,eax
>0043958B    jmp         0043958F
 0043958D    xor         esi,esi
 0043958F    mov         eax,dword ptr [ebx+10]
 00439592    mov         edx,dword ptr [esp+4]
 00439596    cmp         eax,edx
>00439598    jl          004395A0
 0043959A    cmp         eax,dword ptr [esp+0C]
>0043959E    jle         004395B2
 004395A0    sub         edx,eax
 004395A2    mov         ecx,dword ptr [esp+0C]
 004395A6    sub         ecx,eax
 004395A8    mov         eax,ecx
 004395AA    xchg        eax,edx
 004395AB    call        AbsMin
>004395B0    jmp         004395B4
 004395B2    xor         eax,eax
 004395B4    test        esi,esi
>004395B6    jne         004395BC
 004395B8    test        eax,eax
>004395BA    je          004395CB
 004395BC    neg         eax
 004395BE    push        eax
 004395BF    neg         esi
 004395C1    push        esi
 004395C2    lea         eax,[ebx+44]
 004395C5    push        eax
 004395C6    call        user32.OffsetRect
 004395CB    add         esp,10
 004395CE    pop         edi
 004395CF    pop         esi
 004395D0    pop         ebx
 004395D1    ret
*}
end;

//004395D4
procedure TDragDockObject.DrawDragDockImage;
begin
{*
 004395D4    push        esi
 004395D5    mov         esi,eax
 004395D7    mov         edx,esi
 004395D9    mov         eax,dword ptr [esi+38]
 004395DC    mov         si,0FFDB
 004395E0    call        @CallDynaInst
 004395E5    pop         esi
 004395E6    ret
*}
end;

//004395E8
procedure TDragDockObject.EraseDragDockImage;
begin
{*
 004395E8    push        esi
 004395E9    mov         esi,eax
 004395EB    mov         edx,esi
 004395ED    mov         eax,dword ptr [esi+38]
 004395F0    mov         si,0FFDA
 004395F4    call        @CallDynaInst
 004395F9    pop         esi
 004395FA    ret
*}
end;

//004395FC
function TDragDockObject.GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;
begin
{*
 004395FC    push        ebp
 004395FD    mov         ebp,esp
 004395FF    xor         eax,eax
 00439601    pop         ebp
 00439602    ret         4
*}
end;

//00439608
{*function sub_00439608:?;
begin
 00439608    mov         eax,4
 0043960D    ret
end;*}

//00439610
procedure TDragDockObjectEx.BeforeDestruction;
begin
{*
 00439610    ret
*}
end;

//00439614
function IsBeforeTargetWindow(Window:HWND; Data:Longint):BOOL; stdcall;
begin
{*
 00439614    push        ebp
 00439615    mov         ebp,esp
 00439617    add         esp,0FFFFFFF0
 0043961A    push        ebx
 0043961B    push        esi
 0043961C    push        edi
 0043961D    mov         ebx,dword ptr [ebp+0C]
 00439620    mov         esi,dword ptr [ebp+8]
 00439623    mov         edi,ebx
 00439625    cmp         esi,dword ptr [edi+4]
>00439628    jne         0043962E
 0043962A    xor         eax,eax
>0043962C    jmp         00439674
 0043962E    cmp         dword ptr [edi+8],0
>00439632    jne         00439654
 00439634    lea         eax,[ebp-10]
 00439637    push        eax
 00439638    push        esi
 00439639    call        user32.GetWindowRect
 0043963E    push        dword ptr [edi+10]
 00439641    push        dword ptr [edi+0C]
 00439644    lea         eax,[ebp-10]
 00439647    push        eax
 00439648    call        user32.PtInRect
 0043964D    test        eax,eax
>0043964F    je          00439654
 00439651    mov         dword ptr [edi+8],esi
 00439654    mov         edx,ebx
 00439656    cmp         esi,dword ptr [edx+8]
>00439659    jne         00439663
 0043965B    xor         eax,eax
 0043965D    mov         byte ptr [edx+14],1
>00439661    jmp         00439674
 00439663    cmp         esi,dword ptr [edx]
>00439665    jne         00439671
 00439667    or          eax,0FFFFFFFF
 0043966A    xor         ecx,ecx
 0043966C    mov         dword ptr [edx+8],ecx
>0043966F    jmp         00439674
 00439671    or          eax,0FFFFFFFF
 00439674    pop         edi
 00439675    pop         esi
 00439676    pop         ebx
 00439677    mov         esp,ebp
 00439679    pop         ebp
 0043967A    ret         8
*}
end;

//00439680
function ValidDockTarget(Target:TWinControl):Boolean;
begin
{*
 00439680    push        ebp
 00439681    mov         ebp,esp
 00439683    add         esp,0FFFFFFC4
 00439686    push        ebx
 00439687    push        esi
 00439688    push        edi
 00439689    mov         ebx,eax
 0043968B    mov         byte ptr [ebp-1],1
 0043968F    mov         eax,dword ptr [ebp+8]
 00439692    add         eax,0FFFFFFF7
 00439695    call        DragFindWindow
 0043969A    mov         esi,eax
 0043969C    mov         dword ptr [ebp-14],esi
 0043969F    push        4
 004396A1    push        esi
 004396A2    call        user32.GetWindow
 004396A7    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 004396AD    mov         edx,dword ptr [edx]
 004396AF    cmp         eax,dword ptr [edx+30]
>004396B2    je          004396DB
 004396B4    mov         eax,dword ptr [ebp-14]
 004396B7    call        FindControl
 004396BC    mov         esi,eax
 004396BE    test        esi,esi
>004396C0    je          0043980E
>004396C6    jmp         004396CA
 004396C8    mov         esi,eax
 004396CA    mov         eax,dword ptr [esi+30]
 004396CD    test        eax,eax
>004396CF    jne         004396C8
 004396D1    mov         eax,esi
 004396D3    call        TWinControl.GetHandle
 004396D8    mov         dword ptr [ebp-14],eax
 004396DB    cmp         dword ptr [ebp-14],0
>004396DF    je          0043980E
 004396E5    mov         esi,ebx
>004396E7    jmp         004396EB
 004396E9    mov         esi,eax
 004396EB    mov         eax,dword ptr [esi+30]
 004396EE    test        eax,eax
>004396F0    jne         004396E9
 004396F2    mov         eax,esi
 004396F4    call        TWinControl.GetHandle
 004396F9    mov         edi,eax
 004396FB    mov         dword ptr [ebp-18],edi
 004396FE    cmp         edi,dword ptr [ebp-14]
>00439701    je          0043980E
 00439707    mov         eax,dword ptr [ebp+8]
 0043970A    mov         eax,dword ptr [eax-10]
 0043970D    mov         eax,dword ptr [eax+30]
 00439710    test        eax,eax
>00439712    je          00439730
 00439714    mov         edx,dword ptr [ebp+8]
 00439717    mov         esi,eax
>00439719    jmp         0043971D
 0043971B    mov         esi,eax
 0043971D    mov         eax,dword ptr [esi+30]
 00439720    test        eax,eax
>00439722    jne         0043971B
 00439724    mov         eax,esi
 00439726    call        TWinControl.GetHandle
 0043972B    mov         dword ptr [ebp-1C],eax
>0043972E    jmp         0043975A
 00439730    mov         eax,dword ptr [ebp+8]
 00439733    mov         eax,dword ptr [eax-10]
 00439736    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043973C    call        @IsClass
 00439741    test        al,al
>00439743    je          00439755
 00439745    mov         eax,dword ptr [ebp+8]
 00439748    mov         eax,dword ptr [eax-10]
 0043974B    call        TWinControl.GetHandle
 00439750    mov         dword ptr [ebp-1C],eax
>00439753    jmp         0043975A
 00439755    xor         eax,eax
 00439757    mov         dword ptr [ebp-1C],eax
 0043975A    mov         byte ptr [ebp-8],0
 0043975E    mov         eax,dword ptr [ebp+8]
 00439761    mov         edx,dword ptr [eax-9]
 00439764    mov         dword ptr [ebp-10],edx
 00439767    mov         edx,dword ptr [eax-5]
 0043976A    mov         dword ptr [ebp-0C],edx
 0043976D    lea         eax,[ebp-1C]
 00439770    push        eax
 00439771    push        439614;IsBeforeTargetWindow:BOOL
 00439776    call        KERNEL32.GetCurrentThreadId
 0043977B    push        eax
 0043977C    call        user32.EnumThreadWindows
 00439781    cmp         byte ptr [ebp-8],0
>00439785    je          0043980E
 0043978B    lea         eax,[ebp-2C]
 0043978E    push        eax
 0043978F    mov         eax,dword ptr [ebp-14]
 00439792    push        eax
 00439793    call        user32.GetWindowRect
 00439798    mov         eax,dword ptr [ebp+8]
 0043979B    add         eax,0FFFFFFF7
 0043979E    push        eax
 0043979F    mov         eax,dword ptr [ebp+8]
 004397A2    dec         eax
 004397A3    push        eax
 004397A4    lea         ecx,[ebp-3C]
 004397A7    mov         eax,dword ptr [ebp+8]
 004397AA    mov         edx,dword ptr [eax-10]
 004397AD    mov         eax,ebx
 004397AF    mov         si,0FFBD
 004397B3    call        @CallDynaInst
 004397B8    mov         eax,[005E0C2C]
 004397BD    mov         edx,dword ptr ds:[436E74];TDragDockObject
 004397C3    call        @IsClass
 004397C8    test        al,al
>004397CA    je          004397F5
 004397CC    mov         eax,[005E0C2C]
 004397D1    mov         eax,dword ptr [eax+38]
 004397D4    cmp         dword ptr [eax+0A0],0
>004397DB    je          004397F5
 004397DD    mov         eax,[005E0C2C]
 004397E2    mov         eax,dword ptr [eax+38]
 004397E5    mov         eax,dword ptr [eax+0A0]
 004397EB    call        TWinControl.GetHandle
 004397F0    cmp         eax,dword ptr [ebp-14]
>004397F3    je          0043980E
 004397F5    lea         eax,[ebp-3C]
 004397F8    push        eax
 004397F9    lea         eax,[ebp-2C]
 004397FC    push        eax
 004397FD    lea         eax,[ebp-2C]
 00439800    push        eax
 00439801    call        user32.IntersectRect
 00439806    test        eax,eax
>00439808    je          0043980E
 0043980A    mov         byte ptr [ebp-1],0
 0043980E    mov         al,byte ptr [ebp-1]
 00439811    pop         edi
 00439812    pop         esi
 00439813    pop         ebx
 00439814    mov         esp,ebp
 00439816    pop         ebp
 00439817    ret
*}
end;

//00439818
function IsSiteChildOfClient:Boolean;
begin
{*
 00439818    push        ebp
 00439819    mov         ebp,esp
 0043981B    mov         eax,dword ptr [ebp+8]
 0043981E    mov         eax,dword ptr [eax-10]
 00439821    mov         edx,dword ptr ds:[4380F4];TWinControl
 00439827    call        @IsClass
 0043982C    test        al,al
>0043982E    je          00439855
 00439830    mov         eax,dword ptr [ebp+8]
 00439833    mov         eax,dword ptr [eax-14]
 00439836    call        TWinControl.GetHandle
 0043983B    push        eax
 0043983C    mov         eax,dword ptr [ebp+8]
 0043983F    mov         eax,dword ptr [eax-10]
 00439842    call        TWinControl.GetHandle
 00439847    push        eax
 00439848    call        user32.IsChild
 0043984D    cmp         eax,1
 00439850    sbb         eax,eax
 00439852    inc         eax
 00439853    pop         ebp
 00439854    ret
 00439855    xor         eax,eax
 00439857    pop         ebp
 00439858    ret
*}
end;

//0043985C
function GetDockSiteAtPos(MousePos:TPoint; Client:TControl):TWinControl;
begin
{*
 0043985C    push        ebp
 0043985D    mov         ebp,esp
 0043985F    add         esp,0FFFFFFD8
 00439862    push        ebx
 00439863    push        esi
 00439864    push        edi
 00439865    mov         esi,eax
 00439867    lea         edi,[ebp-9]
 0043986A    movs        dword ptr [edi],dword ptr [esi]
 0043986B    movs        dword ptr [edi],dword ptr [esi]
 0043986C    mov         dword ptr [ebp-10],edx
 0043986F    xor         eax,eax
 00439871    mov         dword ptr [ebp-18],eax
 00439874    cmp         dword ptr ds:[5E0C50],0;DockSiteList:TList
>0043987B    je          004399AB
 00439881    push        11
 00439883    call        user32.GetKeyState
 00439888    test        ax,8000
 0043988C    setne       al
 0043988F    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 00439895    mov         edx,dword ptr [edx]
 00439897    xor         al,byte ptr [edx+0B4]
>0043989D    je          004399AB
 004398A3    mov         eax,[005E0C54];QualifyingSites:TSiteList
 004398A8    mov         edx,dword ptr [eax]
 004398AA    call        dword ptr [edx+8]
 004398AD    mov         eax,[005E0C50];DockSiteList:TList
 004398B2    mov         ebx,dword ptr [eax+8]
 004398B5    dec         ebx
 004398B6    test        ebx,ebx
>004398B8    jl          0043997A
 004398BE    inc         ebx
 004398BF    xor         edi,edi
 004398C1    mov         edx,edi
 004398C3    mov         eax,[005E0C50];DockSiteList:TList
 004398C8    call        TList.Get
 004398CD    mov         dword ptr [ebp-14],eax
 004398D0    mov         eax,dword ptr [ebp-14]
 004398D3    cmp         eax,dword ptr [ebp-10]
>004398D6    je          00439972
 004398DC    mov         eax,dword ptr [ebp-14]
 004398DF    cmp         byte ptr [eax+1A6],0
>004398E6    je          00439972
 004398EC    mov         eax,dword ptr [ebp-14]
 004398EF    mov         edx,dword ptr [eax]
 004398F1    call        dword ptr [edx+50]
 004398F4    test        al,al
>004398F6    je          00439972
 004398F8    mov         eax,dword ptr [ebp-14]
 004398FB    call        TWinControl.GetHandle
 00439900    push        eax
 00439901    call        user32.IsWindowVisible
 00439906    test        eax,eax
>00439908    je          00439972
 0043990A    push        ebp
 0043990B    call        IsSiteChildOfClient
 00439910    pop         ecx
 00439911    test        al,al
>00439913    jne         00439972
 00439915    mov         eax,dword ptr [ebp-10]
 00439918    mov         eax,dword ptr [eax+0A0]
 0043991E    cmp         eax,dword ptr [ebp-14]
>00439921    jne         0043992E
 00439923    mov         eax,dword ptr [ebp-14]
 00439926    call        TWinControl.GetVisibleDockClientCount
 0043992B    dec         eax
>0043992C    jle         00439972
 0043992E    mov         byte ptr [ebp-1],1
 00439932    lea         eax,[ebp-9]
 00439935    push        eax
 00439936    lea         eax,[ebp-1]
 00439939    push        eax
 0043993A    lea         ecx,[ebp-28]
 0043993D    mov         edx,dword ptr [ebp-10]
 00439940    mov         eax,dword ptr [ebp-14]
 00439943    mov         si,0FFBD
 00439947    call        @CallDynaInst
 0043994C    cmp         byte ptr [ebp-1],0
>00439950    je          00439972
 00439952    push        dword ptr [ebp-5]
 00439955    push        dword ptr [ebp-9]
 00439958    lea         eax,[ebp-28]
 0043995B    push        eax
 0043995C    call        user32.PtInRect
 00439961    test        eax,eax
>00439963    je          00439972
 00439965    mov         edx,dword ptr [ebp-14]
 00439968    mov         eax,[005E0C54];QualifyingSites:TSiteList
 0043996D    call        TSiteList.AddSite
 00439972    inc         edi
 00439973    dec         ebx
>00439974    jne         004398C1
 0043997A    mov         eax,[005E0C54];QualifyingSites:TSiteList
 0043997F    cmp         dword ptr [eax+8],0
>00439983    jle         00439992
 00439985    mov         eax,[005E0C54];QualifyingSites:TSiteList
 0043998A    call        TSiteList.GetTopSite
 0043998F    mov         dword ptr [ebp-18],eax
 00439992    cmp         dword ptr [ebp-18],0
>00439996    je          004399AB
 00439998    push        ebp
 00439999    mov         eax,dword ptr [ebp-18]
 0043999C    call        ValidDockTarget
 004399A1    pop         ecx
 004399A2    test        al,al
>004399A4    jne         004399AB
 004399A6    xor         eax,eax
 004399A8    mov         dword ptr [ebp-18],eax
 004399AB    mov         eax,dword ptr [ebp-18]
 004399AE    pop         edi
 004399AF    pop         esi
 004399B0    pop         ebx
 004399B1    mov         esp,ebp
 004399B3    pop         ebp
 004399B4    ret
*}
end;

//004399B8
procedure RegisterDockSite(Site:TWinControl; DoRegister:Boolean);
begin
{*
 004399B8    push        ebx
 004399B9    push        esi
 004399BA    push        edi
 004399BB    mov         ebx,edx
 004399BD    mov         esi,eax
 004399BF    test        esi,esi
>004399C1    je          00439A11
 004399C3    cmp         dword ptr ds:[5E0C50],0;DockSiteList:TList
>004399CA    jne         004399DD
 004399CC    mov         dl,1
 004399CE    mov         eax,[00417CEC];TList
 004399D3    call        TObject.Create
 004399D8    mov         [005E0C50],eax;DockSiteList:TList
 004399DD    mov         edi,esi
 004399DF    mov         edx,edi
 004399E1    mov         eax,[005E0C50];DockSiteList:TList
 004399E6    call        TList.IndexOf
 004399EB    test        bl,bl
>004399ED    je          00439A00
 004399EF    inc         eax
>004399F0    jne         00439A11
 004399F2    mov         edx,edi
 004399F4    mov         eax,[005E0C50];DockSiteList:TList
 004399F9    call        TList.Add
>004399FE    jmp         00439A11
 00439A00    cmp         eax,0FFFFFFFF
>00439A03    je          00439A11
 00439A05    mov         edx,eax
 00439A07    mov         eax,[005E0C50];DockSiteList:TList
 00439A0C    call        TList.Delete
 00439A11    pop         edi
 00439A12    pop         esi
 00439A13    pop         ebx
 00439A14    ret
*}
end;

//00439A18
function DragMessage(Handle:HWND; Msg:TDragMessage; Source:TDragObject; Target:Pointer; const Pos:TPoint):Longint;
begin
{*
 00439A18    push        ebp
 00439A19    mov         ebp,esp
 00439A1B    add         esp,0FFFFFFE8
 00439A1E    push        ebx
 00439A1F    mov         dword ptr [ebp-4],ecx
 00439A22    xor         ecx,ecx
 00439A24    test        eax,eax
>00439A26    je          00439A64
 00439A28    mov         ecx,dword ptr [ebp+8]
 00439A2B    mov         ebx,dword ptr [ecx]
 00439A2D    mov         dword ptr [ebp-18],ebx
 00439A30    mov         ebx,dword ptr [ecx+4]
 00439A33    mov         dword ptr [ebp-14],ebx
 00439A36    mov         ecx,dword ptr [ebp+0C]
 00439A39    mov         dword ptr [ebp-0C],ecx
 00439A3C    mov         ecx,dword ptr [ebp-4]
 00439A3F    mov         dword ptr [ebp-10],ecx
 00439A42    cmp         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
 00439A49    sete        cl
 00439A4C    mov         byte ptr [ebp-8],cl
 00439A4F    lea         ecx,[ebp-18]
 00439A52    push        ecx
 00439A53    and         edx,7F
 00439A56    push        edx
 00439A57    push        0B02F
 00439A5C    push        eax
 00439A5D    call        user32.SendMessageA
 00439A62    mov         ecx,eax
 00439A64    mov         eax,ecx
 00439A66    pop         ebx
 00439A67    mov         esp,ebp
 00439A69    pop         ebp
 00439A6A    ret         8
*}
end;

//00439A70
function IsDelphiHandle(Handle:HWND):Boolean;
begin
{*
 00439A70    push        ebx
 00439A71    push        esi
 00439A72    push        ecx
 00439A73    mov         esi,eax
 00439A75    xor         ebx,ebx
 00439A77    test        esi,esi
>00439A79    je          00439ACA
 00439A7B    push        esp
 00439A7C    push        esi
 00439A7D    call        user32.GetWindowThreadProcessId
 00439A82    test        eax,eax
>00439A84    je          00439ACA
 00439A86    call        KERNEL32.GetCurrentProcessId
 00439A8B    cmp         eax,dword ptr [esp]
>00439A8E    jne         00439ACA
 00439A90    mov         eax,[005E0C1C];WindowAtomString:AnsiString
 00439A95    call        @LStrToPChar
 00439A9A    push        eax
 00439A9B    call        KERNEL32.GlobalFindAtomA
 00439AA0    cmp         ax,word ptr ds:[5E0C18];WindowAtom:TAtom
>00439AA7    jne         00439ABE
 00439AA9    movzx       eax,word ptr ds:[5E0C18];WindowAtom:TAtom
 00439AB0    push        eax
 00439AB1    push        esi
 00439AB2    call        user32.GetPropA
 00439AB7    test        eax,eax
 00439AB9    setne       bl
>00439ABC    jmp         00439ACA
 00439ABE    mov         eax,esi
 00439AC0    call        ObjectFromHWnd
 00439AC5    test        eax,eax
 00439AC7    setne       bl
 00439ACA    mov         eax,ebx
 00439ACC    pop         edx
 00439ACD    pop         esi
 00439ACE    pop         ebx
 00439ACF    ret
*}
end;

//00439AD0
function DragFindWindow(const Pos:TPoint):HWND;
begin
{*
 00439AD0    push        ebx
 00439AD1    push        dword ptr [eax+4]
 00439AD4    push        dword ptr [eax]
 00439AD6    call        user32.WindowFromPoint
 00439ADB    mov         ebx,eax
 00439ADD    test        ebx,ebx
>00439ADF    je          00439AF8
 00439AE1    mov         eax,ebx
 00439AE3    call        IsDelphiHandle
 00439AE8    test        al,al
>00439AEA    jne         00439AF8
 00439AEC    push        ebx
 00439AED    call        user32.GetParent
 00439AF2    mov         ebx,eax
 00439AF4    test        ebx,ebx
>00439AF6    jne         00439AE1
 00439AF8    mov         eax,ebx
 00439AFA    pop         ebx
 00439AFB    ret
*}
end;

//00439AFC
function DragFindTarget(const Pos:TPoint; var Handle:HWND; DragKind:TDragKind; Client:TControl):Pointer;
begin
{*
 00439AFC    push        ebp
 00439AFD    mov         ebp,esp
 00439AFF    push        ebx
 00439B00    push        esi
 00439B01    mov         esi,edx
 00439B03    mov         ebx,eax
 00439B05    test        cl,cl
>00439B07    jne         00439B28
 00439B09    mov         eax,ebx
 00439B0B    call        DragFindWindow
 00439B10    mov         dword ptr [esi],eax
 00439B12    push        0
 00439B14    push        ebx
 00439B15    mov         eax,dword ptr [esi]
 00439B17    mov         ecx,dword ptr ds:[5E0C2C]
 00439B1D    mov         dl,5
 00439B1F    call        DragMessage
 00439B24    mov         ebx,eax
>00439B26    jmp         00439B41
 00439B28    mov         eax,ebx
 00439B2A    mov         edx,dword ptr [ebp+8]
 00439B2D    call        GetDockSiteAtPos
 00439B32    mov         ebx,eax
 00439B34    test        ebx,ebx
>00439B36    je          00439B41
 00439B38    mov         eax,ebx
 00439B3A    call        TWinControl.GetHandle
 00439B3F    mov         dword ptr [esi],eax
 00439B41    mov         eax,ebx
 00439B43    pop         esi
 00439B44    pop         ebx
 00439B45    pop         ebp
 00439B46    ret         4
*}
end;

//00439B4C
function DoDragOver(DragMsg:TDragMessage):Boolean;
begin
{*
 00439B4C    push        ebx
 00439B4D    push        esi
 00439B4E    mov         ebx,eax
 00439B50    xor         eax,eax
 00439B52    mov         edx,dword ptr ds:[5E0C2C]
 00439B58    mov         esi,dword ptr [edx+4]
 00439B5B    test        esi,esi
>00439B5D    je          00439B84
 00439B5F    push        esi
 00439B60    mov         eax,[005E0C2C]
 00439B65    add         eax,0C
 00439B68    push        eax
 00439B69    mov         eax,[005E0C2C]
 00439B6E    mov         eax,dword ptr [eax+8]
 00439B71    mov         ecx,dword ptr ds:[5E0C2C]
 00439B77    mov         edx,ebx
 00439B79    call        DragMessage
 00439B7E    cmp         eax,1
 00439B81    sbb         eax,eax
 00439B83    inc         eax
 00439B84    pop         esi
 00439B85    pop         ebx
 00439B86    ret
*}
end;

//00439B88
function GetDropCtl:TControl;
begin
{*
 00439B88    push        ebx
 00439B89    push        esi
 00439B8A    push        edi
 00439B8B    xor         edi,edi
 00439B8D    mov         eax,[005E0C2C]
 00439B92    mov         esi,dword ptr [eax+4]
 00439B95    test        esi,esi
>00439B97    je          00439C15
 00439B99    cmp         byte ptr [esi+1A7],0
>00439BA0    je          00439C15
 00439BA2    cmp         dword ptr [esi+178],0
>00439BA9    je          00439C15
 00439BAB    mov         eax,esi
 00439BAD    call        TWinControl.GetDockClientCount
 00439BB2    test        eax,eax
>00439BB4    je          00439C15
 00439BB6    mov         eax,esi
 00439BB8    call        TWinControl.GetDockClientCount
 00439BBD    dec         eax
>00439BBE    jne         00439BD8
 00439BC0    xor         edx,edx
 00439BC2    mov         eax,dword ptr [esi+178]
 00439BC8    call        TList.Get
 00439BCD    mov         edx,dword ptr ds:[5E0C2C]
 00439BD3    cmp         eax,dword ptr [edx+38]
>00439BD6    je          00439C15
 00439BD8    mov         eax,[005E0C2C]
 00439BDD    add         eax,0C
 00439BE0    xor         edx,edx
 00439BE2    call        FindDragTarget
 00439BE7    mov         ebx,eax
>00439BE9    jmp         00439C0D
 00439BEB    mov         edx,ebx
 00439BED    mov         eax,dword ptr [esi+178]
 00439BF3    call        TList.IndexOf
 00439BF8    cmp         eax,0FFFFFFFF
>00439BFB    je          00439C0A
 00439BFD    mov         edx,eax
 00439BFF    mov         eax,esi
 00439C01    call        TWinControl.GetDockClients
 00439C06    mov         edi,eax
>00439C08    jmp         00439C15
 00439C0A    mov         ebx,dword ptr [ebx+30]
 00439C0D    test        ebx,ebx
>00439C0F    je          00439C15
 00439C11    cmp         esi,ebx
>00439C13    jne         00439BEB
 00439C15    mov         eax,edi
 00439C17    pop         edi
 00439C18    pop         esi
 00439C19    pop         ebx
 00439C1A    ret
*}
end;

//00439C1C
procedure DragTo(const Pos:TPoint);
begin
{*
 00439C1C    push        ebx
 00439C1D    push        esi
 00439C1E    push        edi
 00439C1F    add         esp,0FFFFFFF0
 00439C22    mov         edi,eax
 00439C24    cmp         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
>00439C2B    jne         00439C5A
 00439C2D    mov         eax,[005E0C38];DragStartPos:TPoint
 00439C32    sub         eax,dword ptr [edi]
 00439C34    cdq
 00439C35    xor         eax,edx
 00439C37    sub         eax,edx
 00439C39    cmp         eax,dword ptr ds:[5E0C44];DragThreshold:Integer
>00439C3F    jge         00439C5A
 00439C41    mov         eax,[005E0C3C]
 00439C46    sub         eax,dword ptr [edi+4]
 00439C49    cdq
 00439C4A    xor         eax,edx
 00439C4C    sub         eax,edx
 00439C4E    cmp         eax,dword ptr ds:[5E0C44];DragThreshold:Integer
>00439C54    jl          00439EE3
 00439C5A    mov         eax,[005E0C28];DragControl:TControl
 00439C5F    push        eax
 00439C60    mov         eax,[005E0C28];DragControl:TControl
 00439C65    mov         cl,byte ptr [eax+9B]
 00439C6B    lea         edx,[esp+4]
 00439C6F    mov         eax,edi
 00439C71    call        DragFindTarget
 00439C76    mov         ebx,eax
 00439C78    cmp         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
>00439C7F    jne         00439CA7
 00439C81    cmp         dword ptr ds:[5E0C4C],0;DragImageList:TDragImageList
>00439C88    je          00439CA7
 00439C8A    mov         eax,[005E0C3C]
 00439C8F    push        eax
 00439C90    call        user32.GetDesktopWindow
 00439C95    mov         edx,eax
 00439C97    mov         ecx,dword ptr ds:[5E0C38];DragStartPos:TPoint
 00439C9D    mov         eax,[005E0C4C];DragImageList:TDragImageList
 00439CA2    call        TDragImageList.BeginDrag
 00439CA7    mov         eax,[005E0C28];DragControl:TControl
 00439CAC    cmp         byte ptr [eax+9B],0
>00439CB3    jne         00439CC3
 00439CB5    mov         byte ptr ds:[5E0C48],1;ActiveDrag:TDragOperation
 00439CBC    mov         byte ptr [esp+4],0
>00439CC1    jmp         00439CD6
 00439CC3    cmp         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
 00439CCA    setne       byte ptr [esp+4]
 00439CCF    mov         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
 00439CD6    mov         eax,[005E0C2C]
 00439CDB    cmp         ebx,dword ptr [eax+4]
>00439CDE    je          00439D2B
 00439CE0    mov         al,1
 00439CE2    call        DoDragOver
 00439CE7    cmp         dword ptr ds:[5E0C2C],0
>00439CEE    je          00439EE3
 00439CF4    mov         eax,[005E0C2C]
 00439CF9    mov         dword ptr [eax+4],ebx
 00439CFC    mov         eax,[005E0C2C]
 00439D01    mov         edx,dword ptr [esp]
 00439D04    mov         dword ptr [eax+8],edx
 00439D07    mov         eax,[005E0C2C]
 00439D0C    mov         edx,dword ptr [edi]
 00439D0E    mov         dword ptr [eax+0C],edx
 00439D11    mov         edx,dword ptr [edi+4]
 00439D14    mov         dword ptr [eax+10],edx
 00439D17    xor         eax,eax
 00439D19    call        DoDragOver
 00439D1E    cmp         dword ptr ds:[5E0C2C],0
>00439D25    je          00439EE3
 00439D2B    mov         eax,[005E0C2C]
 00439D30    mov         edx,dword ptr [edi]
 00439D32    mov         dword ptr [eax+0C],edx
 00439D35    mov         edx,dword ptr [edi+4]
 00439D38    mov         dword ptr [eax+10],edx
 00439D3B    mov         eax,[005E0C2C]
 00439D40    cmp         dword ptr [eax+4],0
>00439D44    je          00439D6C
 00439D46    lea         ecx,[esp+8]
 00439D4A    mov         edx,edi
 00439D4C    mov         eax,[005E0C2C]
 00439D51    mov         eax,dword ptr [eax+4]
 00439D54    call        TControl.ScreenToClient
 00439D59    mov         eax,[005E0C2C]
 00439D5E    mov         edx,dword ptr [esp+8]
 00439D62    mov         dword ptr [eax+14],edx
 00439D65    mov         edx,dword ptr [esp+0C]
 00439D69    mov         dword ptr [eax+18],edx
 00439D6C    mov         eax,dword ptr [edi+4]
 00439D6F    push        eax
 00439D70    mov         al,2
 00439D72    call        DoDragOver
 00439D77    mov         edx,eax
 00439D79    mov         ecx,dword ptr [edi]
 00439D7B    mov         eax,[005E0C2C]
 00439D80    mov         esi,dword ptr [eax]
 00439D82    call        dword ptr [esi+4]
 00439D85    mov         esi,eax
 00439D87    cmp         dword ptr ds:[5E0C4C],0;DragImageList:TDragImageList
>00439D8E    je          00439DFA
 00439D90    test        ebx,ebx
>00439D92    je          00439D9A
 00439D94    test        byte ptr [ebx+51],20
>00439D98    je          00439DDB
 00439D9A    mov         edx,esi
 00439D9C    mov         eax,[005E0C4C];DragImageList:TDragImageList
 00439DA1    call        TDragImageList.SetDragCursor
 00439DA6    mov         eax,[005E0C4C];DragImageList:TDragImageList
 00439DAB    cmp         byte ptr [eax+6A],0
>00439DAF    jne         00439DCA
 00439DB1    mov         eax,dword ptr [edi+4]
 00439DB4    push        eax
 00439DB5    call        user32.GetDesktopWindow
 00439DBA    mov         edx,eax
 00439DBC    mov         ecx,dword ptr [edi]
 00439DBE    mov         eax,[005E0C4C];DragImageList:TDragImageList
 00439DC3    call        TDragImageList.BeginDrag
>00439DC8    jmp         00439DFA
 00439DCA    mov         ecx,dword ptr [edi+4]
 00439DCD    mov         edx,dword ptr [edi]
 00439DCF    mov         eax,[005E0C4C];DragImageList:TDragImageList
 00439DD4    call        TDragImageList.DragMove
>00439DD9    jmp         00439DFA
 00439DDB    mov         eax,[005E0C4C];DragImageList:TDragImageList
 00439DE0    call        TDragImageList.EndDrag
 00439DE5    movsx       edx,si
 00439DE8    mov         eax,[005AE7DC];^Screen:TScreen
 00439DED    mov         eax,dword ptr [eax]
 00439DEF    call        TScreen.GetCursors
 00439DF4    push        eax
 00439DF5    call        user32.SetCursor
 00439DFA    movsx       edx,si
 00439DFD    mov         eax,[005AE7DC];^Screen:TScreen
 00439E02    mov         eax,dword ptr [eax]
 00439E04    call        TScreen.GetCursors
 00439E09    push        eax
 00439E0A    call        user32.SetCursor
 00439E0F    cmp         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
>00439E16    jne         00439EE3
 00439E1C    test        ebx,ebx
>00439E1E    jne         00439E3A
 00439E20    mov         edx,dword ptr [edi+4]
 00439E23    push        edx
 00439E24    mov         ecx,dword ptr [edi]
 00439E26    mov         eax,[005E0C2C]
 00439E2B    mov         edx,dword ptr [eax+38]
 00439E2E    xchg        eax,edx
 00439E2F    mov         si,0FFE7
 00439E33    call        @CallDynaInst
>00439E38    jmp         00439E96
 00439E3A    call        GetDropCtl
 00439E3F    mov         ebx,eax
 00439E41    mov         eax,[005E0C2C]
 00439E46    mov         dword ptr [eax+58],ebx
 00439E49    test        ebx,ebx
>00439E4B    jne         00439E71
 00439E4D    mov         eax,[005E0C2C]
 00439E52    lea         edx,[eax+14]
 00439E55    mov         eax,[005E0C2C]
 00439E5A    mov         eax,dword ptr [eax+4]
 00439E5D    mov         si,0FFD8
 00439E61    call        @CallDynaInst
 00439E66    mov         edx,dword ptr ds:[5E0C2C]
 00439E6C    mov         byte ptr [edx+54],al
>00439E6F    jmp         00439E96
 00439E71    lea         ecx,[esp+8]
 00439E75    mov         edx,edi
 00439E77    mov         eax,ebx
 00439E79    call        TControl.ScreenToClient
 00439E7E    lea         edx,[esp+8]
 00439E82    mov         eax,ebx
 00439E84    mov         si,0FFD8
 00439E88    call        @CallDynaInst
 00439E8D    mov         edx,dword ptr ds:[5E0C2C]
 00439E93    mov         byte ptr [edx+54],al
 00439E96    cmp         dword ptr ds:[5E0C2C],0
>00439E9D    je          00439EE3
 00439E9F    mov         ebx,dword ptr ds:[5E0C2C]
 00439EA5    lea         edx,[ebx+5C]
 00439EA8    lea         eax,[ebx+44]
 00439EAB    mov         ecx,10
 00439EB0    call        CompareMem
 00439EB5    test        al,al
>00439EB7    jne         00439EE3
 00439EB9    cmp         byte ptr [esp+4],0
>00439EBE    je          00439ECA
 00439EC0    mov         eax,[005E0C2C]
 00439EC5    mov         edx,dword ptr [eax]
 00439EC7    call        dword ptr [edx+34]
 00439ECA    mov         eax,[005E0C2C]
 00439ECF    mov         edx,dword ptr [eax]
 00439ED1    call        dword ptr [edx+30]
 00439ED4    mov         eax,[005E0C2C]
 00439ED9    lea         esi,[eax+44]
 00439EDC    lea         edi,[eax+5C]
 00439EDF    movs        dword ptr [edi],dword ptr [esi]
 00439EE0    movs        dword ptr [edi],dword ptr [esi]
 00439EE1    movs        dword ptr [edi],dword ptr [esi]
 00439EE2    movs        dword ptr [edi],dword ptr [esi]
 00439EE3    add         esp,10
 00439EE6    pop         edi
 00439EE7    pop         esi
 00439EE8    pop         ebx
 00439EE9    ret
*}
end;

//00439EEC
procedure DragInit(ADragObject:TDragObject; Immediate:Boolean; Threshold:Integer);
begin
{*
 00439EEC    push        ebx
 00439EED    push        esi
 00439EEE    push        edi
 00439EEF    add         esp,0FFFFFFF8
 00439EF2    mov         edi,ecx
 00439EF4    mov         ebx,edx
 00439EF6    mov         esi,eax
 00439EF8    mov         dword ptr ds:[5E0C2C],esi
 00439EFE    mov         eax,[005E0C2C]
 00439F03    xor         edx,edx
 00439F05    mov         dword ptr [eax+4],edx
 00439F08    push        5E0C38;DragStartPos:TPoint
 00439F0D    call        user32.GetCursorPos
 00439F12    mov         eax,[005E0C2C]
 00439F17    mov         edx,dword ptr ds:[5E0C38];DragStartPos:TPoint
 00439F1D    mov         dword ptr [eax+0C],edx
 00439F20    mov         edx,dword ptr ds:[5E0C3C]
 00439F26    mov         dword ptr [eax+10],edx
 00439F29    call        user32.GetCursor
 00439F2E    mov         [005E0C40],eax;DragSaveCursor:HCURSOR
 00439F33    mov         eax,[005E0C2C]
 00439F38    call        TDragObject.Capture
 00439F3D    mov         [005E0C34],eax;DragCapture:HWND
 00439F42    mov         dword ptr ds:[5E0C44],edi;DragThreshold:Integer
 00439F48    mov         eax,esi
 00439F4A    mov         edx,dword ptr ds:[436E74];TDragDockObject
 00439F50    call        @IsClass
 00439F55    test        al,al
>00439F57    je          00439FE9
 00439F5D    mov         edx,esi
 00439F5F    lea         eax,[edx+44]
 00439F62    mov         edi,dword ptr [eax+8]
 00439F65    mov         ecx,dword ptr [eax]
 00439F67    sub         edi,ecx
 00439F69    test        edi,edi
>00439F6B    jle         00439F8D
 00439F6D    mov         edi,dword ptr [edx+0C]
 00439F70    sub         edi,ecx
 00439F72    mov         dword ptr [esp],edi
 00439F75    fild        dword ptr [esp]
 00439F78    mov         ecx,dword ptr [eax+8]
 00439F7B    sub         ecx,dword ptr [eax]
 00439F7D    mov         dword ptr [esp+4],ecx
 00439F81    fild        dword ptr [esp+4]
 00439F85    fdivp       st(1),st
 00439F87    fstp        qword ptr [edx+20]
 00439F8A    wait
>00439F8B    jmp         00439F95
 00439F8D    xor         ecx,ecx
 00439F8F    mov         dword ptr [edx+20],ecx
 00439F92    mov         dword ptr [edx+24],ecx
 00439F95    mov         ecx,dword ptr [eax+0C]
 00439F98    mov         edx,dword ptr [eax+4]
 00439F9B    sub         ecx,edx
 00439F9D    test        ecx,ecx
>00439F9F    jle         00439FC4
 00439FA1    mov         ecx,esi
 00439FA3    mov         edi,dword ptr [ecx+10]
 00439FA6    sub         edi,edx
 00439FA8    mov         dword ptr [esp],edi
 00439FAB    fild        dword ptr [esp]
 00439FAE    mov         edx,dword ptr [eax+0C]
 00439FB1    sub         edx,dword ptr [eax+4]
 00439FB4    mov         dword ptr [esp+4],edx
 00439FB8    fild        dword ptr [esp+4]
 00439FBC    fdivp       st(1),st
 00439FBE    fstp        qword ptr [ecx+28]
 00439FC1    wait
>00439FC2    jmp         00439FCC
 00439FC4    xor         eax,eax
 00439FC6    mov         dword ptr [esi+28],eax
 00439FC9    mov         dword ptr [esi+2C],eax
 00439FCC    test        bl,bl
>00439FCE    je          00439FE0
 00439FD0    mov         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
 00439FD7    mov         eax,esi
 00439FD9    mov         edx,dword ptr [eax]
 00439FDB    call        dword ptr [edx+30]
>00439FDE    jmp         00439FFD
 00439FE0    mov         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
>00439FE7    jmp         00439FFD
 00439FE9    test        bl,bl
>00439FEB    je          00439FF6
 00439FED    mov         byte ptr ds:[5E0C48],1;ActiveDrag:TDragOperation
>00439FF4    jmp         00439FFD
 00439FF6    mov         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
 00439FFD    mov         eax,[005E0C2C]
 0043A002    mov         edx,dword ptr [eax]
 0043A004    call        dword ptr [edx+8]
 0043A007    mov         [005E0C4C],eax;DragImageList:TDragImageList
 0043A00C    cmp         dword ptr ds:[5E0C4C],0;DragImageList:TDragImageList
>0043A013    je          0043A032
 0043A015    mov         eax,[005E0C3C]
 0043A01A    push        eax
 0043A01B    call        user32.GetDesktopWindow
 0043A020    mov         edx,eax
 0043A022    mov         ecx,dword ptr ds:[5E0C38];DragStartPos:TPoint
 0043A028    mov         eax,[005E0C4C];DragImageList:TDragImageList
 0043A02D    call        TDragImageList.BeginDrag
 0043A032    mov         dl,1
 0043A034    mov         eax,[00438F20];TSiteList
 0043A039    call        TObject.Create
 0043A03E    mov         [005E0C54],eax;QualifyingSites:TSiteList
 0043A043    cmp         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
>0043A04A    je          0043A056
 0043A04C    mov         eax,5E0C38;DragStartPos:TPoint
 0043A051    call        DragTo
 0043A056    pop         ecx
 0043A057    pop         edx
 0043A058    pop         edi
 0043A059    pop         esi
 0043A05A    pop         ebx
 0043A05B    ret
*}
end;

//0043A05C
procedure DragInitControl(Control:TControl; Immediate:Boolean; Threshold:Integer);
begin
{*
 0043A05C    push        ebp
 0043A05D    mov         ebp,esp
 0043A05F    add         esp,0FFFFFFE0
 0043A062    push        ebx
 0043A063    push        esi
 0043A064    push        edi
 0043A065    mov         dword ptr [ebp-4],ecx
 0043A068    mov         ebx,edx
 0043A06A    mov         edi,eax
 0043A06C    mov         dword ptr ds:[5E0C28],edi;DragControl:TControl
 0043A072    xor         edx,edx
 0043A074    push        ebp
 0043A075    push        43A201
 0043A07A    push        dword ptr fs:[edx]
 0043A07D    mov         dword ptr fs:[edx],esp
 0043A080    xor         eax,eax
 0043A082    mov         dword ptr [ebp-8],eax
 0043A085    mov         byte ptr ds:[5E0C30],0;DragInternalObject:Boolean
 0043A08C    cmp         byte ptr [edi+9B],0
>0043A093    jne         0043A0E0
 0043A095    lea         edx,[ebp-8]
 0043A098    mov         eax,edi
 0043A09A    mov         si,0FFDC
 0043A09E    call        @CallDynaInst
 0043A0A3    cmp         dword ptr ds:[5E0C28],0;DragControl:TControl
>0043A0AA    jne         0043A0B9
 0043A0AC    xor         eax,eax
 0043A0AE    pop         edx
 0043A0AF    pop         ecx
 0043A0B0    pop         ecx
 0043A0B1    mov         dword ptr fs:[eax],edx
>0043A0B4    jmp         0043A217
 0043A0B9    cmp         dword ptr [ebp-8],0
>0043A0BD    jne         0043A1EA
 0043A0C3    mov         ecx,edi
 0043A0C5    mov         dl,1
 0043A0C7    mov         eax,[00436DE4];TDragControlObjectEx
 0043A0CC    call        TBaseDragControlObject.Create
 0043A0D1    mov         dword ptr [ebp-8],eax
 0043A0D4    mov         byte ptr ds:[5E0C30],1;DragInternalObject:Boolean
>0043A0DB    jmp         0043A1EA
 0043A0E0    lea         edx,[ebp-8]
 0043A0E3    mov         eax,edi
 0043A0E5    mov         si,0FFE3
 0043A0E9    call        @CallDynaInst
 0043A0EE    cmp         dword ptr ds:[5E0C28],0;DragControl:TControl
>0043A0F5    jne         0043A104
 0043A0F7    xor         eax,eax
 0043A0F9    pop         edx
 0043A0FA    pop         ecx
 0043A0FB    pop         ecx
 0043A0FC    mov         dword ptr fs:[eax],edx
>0043A0FF    jmp         0043A217
 0043A104    cmp         dword ptr [ebp-8],0
>0043A108    jne         0043A122
 0043A10A    mov         ecx,edi
 0043A10C    mov         dl,1
 0043A10E    mov         eax,[00436F38];TDragDockObjectEx
 0043A113    call        TDragDockObject.Create
 0043A118    mov         dword ptr [ebp-8],eax
 0043A11B    mov         byte ptr ds:[5E0C30],1;DragInternalObject:Boolean
 0043A122    mov         eax,dword ptr [ebp-8]
 0043A125    mov         esi,dword ptr [eax+38]
 0043A128    mov         eax,esi
 0043A12A    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043A130    call        @IsClass
 0043A135    test        al,al
>0043A137    je          0043A152
 0043A139    mov         eax,dword ptr [ebp-8]
 0043A13C    add         eax,44
 0043A13F    push        eax
 0043A140    mov         eax,esi
 0043A142    call        TWinControl.GetHandle
 0043A147    push        eax
 0043A148    call        user32.GetWindowRect
>0043A14D    jmp         0043A1DD
 0043A152    mov         eax,dword ptr [ebp-8]
 0043A155    mov         esi,dword ptr [eax+38]
 0043A158    cmp         dword ptr [esi+30],0
>0043A15C    jne         0043A189
 0043A15E    mov         eax,esi
 0043A160    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043A166    call        @IsClass
 0043A16B    test        al,al
>0043A16D    jne         0043A189
 0043A16F    lea         eax,[ebp-10]
 0043A172    push        eax
 0043A173    call        user32.GetCursorPos
 0043A178    mov         eax,dword ptr [ebp-8]
 0043A17B    mov         edx,dword ptr [ebp-10]
 0043A17E    mov         dword ptr [eax+44],edx
 0043A181    mov         edx,dword ptr [ebp-0C]
 0043A184    mov         dword ptr [eax+48],edx
>0043A187    jmp         0043A1B1
 0043A189    lea         ecx,[ebp-20]
 0043A18C    xor         edx,edx
 0043A18E    xor         eax,eax
 0043A190    call        Point
 0043A195    lea         edx,[ebp-20]
 0043A198    lea         ecx,[ebp-18]
 0043A19B    mov         eax,esi
 0043A19D    call        TControl.ClientToScreen
 0043A1A2    mov         eax,dword ptr [ebp-8]
 0043A1A5    mov         edx,dword ptr [ebp-18]
 0043A1A8    mov         dword ptr [eax+44],edx
 0043A1AB    mov         edx,dword ptr [ebp-14]
 0043A1AE    mov         dword ptr [eax+48],edx
 0043A1B1    mov         esi,dword ptr [ebp-8]
 0043A1B4    mov         edx,dword ptr [esi+48]
 0043A1B7    mov         eax,dword ptr [ebp-8]
 0043A1BA    mov         edi,dword ptr [eax+38]
 0043A1BD    add         edx,dword ptr [edi+4C]
 0043A1C0    mov         eax,dword ptr [esi+44]
 0043A1C3    add         eax,dword ptr [edi+48]
 0043A1C6    lea         ecx,[ebp-18]
 0043A1C9    call        Point
 0043A1CE    mov         eax,dword ptr [ebp-8]
 0043A1D1    mov         edx,dword ptr [ebp-18]
 0043A1D4    mov         dword ptr [eax+4C],edx
 0043A1D7    mov         edx,dword ptr [ebp-14]
 0043A1DA    mov         dword ptr [eax+50],edx
 0043A1DD    mov         eax,dword ptr [ebp-8]
 0043A1E0    lea         esi,[eax+44]
 0043A1E3    lea         edi,[eax+5C]
 0043A1E6    movs        dword ptr [edi],dword ptr [esi]
 0043A1E7    movs        dword ptr [edi],dword ptr [esi]
 0043A1E8    movs        dword ptr [edi],dword ptr [esi]
 0043A1E9    movs        dword ptr [edi],dword ptr [esi]
 0043A1EA    mov         ecx,dword ptr [ebp-4]
 0043A1ED    mov         edx,ebx
 0043A1EF    mov         eax,dword ptr [ebp-8]
 0043A1F2    call        DragInit
 0043A1F7    xor         eax,eax
 0043A1F9    pop         edx
 0043A1FA    pop         ecx
 0043A1FB    pop         ecx
 0043A1FC    mov         dword ptr fs:[eax],edx
>0043A1FF    jmp         0043A217
>0043A201    jmp         @HandleAnyException
 0043A206    xor         eax,eax
 0043A208    mov         [005E0C28],eax;DragControl:TControl
 0043A20D    call        @RaiseAgain
 0043A212    call        @DoneExcept
 0043A217    pop         edi
 0043A218    pop         esi
 0043A219    pop         ebx
 0043A21A    mov         esp,ebp
 0043A21C    pop         ebp
 0043A21D    ret
*}
end;

//0043A220
function CheckUndock:Boolean;
begin
{*
 0043A220    push        ebp
 0043A221    mov         ebp,esp
 0043A223    push        ebx
 0043A224    push        esi
 0043A225    mov         eax,[005E0C2C]
 0043A22A    cmp         dword ptr [eax+4],0
 0043A22E    setne       bl
 0043A231    mov         eax,dword ptr [ebp+8]
 0043A234    cmp         byte ptr [eax-1],0
>0043A238    je          0043A28C
 0043A23A    cmp         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
>0043A241    jne         0043A28C
 0043A243    mov         eax,[005E0C28];DragControl:TControl
 0043A248    mov         edx,dword ptr [eax]
 0043A24A    call        dword ptr [edx+54]
 0043A24D    test        al,al
>0043A24F    jne         0043A25F
 0043A251    mov         eax,[005E0C28];DragControl:TControl
 0043A256    cmp         dword ptr [eax+0A0],0
>0043A25D    jne         0043A263
 0043A25F    mov         bl,1
>0043A261    jmp         0043A28C
 0043A263    mov         eax,[005E0C28];DragControl:TControl
 0043A268    mov         eax,dword ptr [eax+0A0]
 0043A26E    test        eax,eax
>0043A270    je          0043A28C
 0043A272    mov         edx,dword ptr ds:[5E0C2C]
 0043A278    mov         edx,dword ptr [edx+4]
 0043A27B    mov         ecx,dword ptr ds:[5E0C28];DragControl:TControl
 0043A281    mov         si,0FFBE
 0043A285    call        @CallDynaInst
 0043A28A    mov         ebx,eax
 0043A28C    mov         eax,ebx
 0043A28E    pop         esi
 0043A28F    pop         ebx
 0043A290    pop         ebp
 0043A291    ret
*}
end;

//0043A294
procedure DragDone(Drop:Boolean);
begin
{*
 0043A294    push        ebp
 0043A295    mov         ebp,esp
 0043A297    add         esp,0FFFFFFF4
 0043A29A    push        ebx
 0043A29B    mov         byte ptr [ebp-1],al
 0043A29E    xor         ebx,ebx
 0043A2A0    mov         byte ptr [ebp-2],0
 0043A2A4    cmp         dword ptr ds:[5E0C2C],0
>0043A2AB    je          0043A567
 0043A2B1    mov         eax,[005E0C2C]
 0043A2B6    cmp         byte ptr [eax+30],0
>0043A2BA    jne         0043A567
 0043A2C0    xor         edx,edx
 0043A2C2    push        ebp
 0043A2C3    push        43A560
 0043A2C8    push        dword ptr fs:[edx]
 0043A2CB    mov         dword ptr fs:[edx],esp
 0043A2CE    mov         eax,[005E0C2C]
 0043A2D3    mov         [005E0C58],eax;DragSave:TDragObject
 0043A2D8    xor         edx,edx
 0043A2DA    push        ebp
 0043A2DB    push        43A4EE
 0043A2E0    push        dword ptr fs:[edx]
 0043A2E3    mov         dword ptr fs:[edx],esp
 0043A2E6    mov         eax,[005E0C2C]
 0043A2EB    mov         byte ptr [eax+30],1
 0043A2EF    mov         eax,[005E0C2C]
 0043A2F4    mov         dl,byte ptr [ebp-1]
 0043A2F7    mov         byte ptr [eax+1C],dl
 0043A2FA    mov         edx,dword ptr ds:[5E0C34];DragCapture:HWND
 0043A300    mov         eax,[005E0C2C]
 0043A305    call        TDragObject.ReleaseCapture
 0043A30A    cmp         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
>0043A311    jne         0043A336
 0043A313    mov         eax,[005E0C2C]
 0043A318    mov         edx,dword ptr ds:[436E74];TDragDockObject
 0043A31E    call        @AsClass
 0043A323    mov         ebx,eax
 0043A325    mov         eax,ebx
 0043A327    mov         edx,dword ptr [eax]
 0043A329    call        dword ptr [edx+34]
 0043A32C    cmp         dword ptr [ebx+4],0
 0043A330    sete        al
 0043A333    mov         byte ptr [ebx+6C],al
 0043A336    mov         eax,[005E0C2C]
 0043A33B    cmp         dword ptr [eax+4],0
>0043A33F    je          0043A36B
 0043A341    mov         eax,[005E0C2C]
 0043A346    mov         eax,dword ptr [eax+4]
 0043A349    mov         edx,dword ptr ds:[437BA4];TControl
 0043A34F    call        @IsClass
 0043A354    test        al,al
>0043A356    je          0043A36B
 0043A358    mov         eax,[005E0C2C]
 0043A35D    mov         edx,dword ptr [eax+14]
 0043A360    mov         dword ptr [ebp-0A],edx
 0043A363    mov         edx,dword ptr [eax+18]
 0043A366    mov         dword ptr [ebp-6],edx
>0043A369    jmp         0043A37C
 0043A36B    mov         eax,[005E0C2C]
 0043A370    mov         edx,dword ptr [eax+0C]
 0043A373    mov         dword ptr [ebp-0A],edx
 0043A376    mov         edx,dword ptr [eax+10]
 0043A379    mov         dword ptr [ebp-6],edx
 0043A37C    push        ebp
 0043A37D    call        CheckUndock
 0043A382    pop         ecx
 0043A383    test        al,al
>0043A385    je          0043A3B0
 0043A387    cmp         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
>0043A38E    jne         0043A396
 0043A390    cmp         byte ptr [ebx+6C],0
>0043A394    jne         0043A3AA
 0043A396    cmp         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
>0043A39D    je          0043A3B0
 0043A39F    mov         al,1
 0043A3A1    call        DoDragOver
 0043A3A6    test        al,al
>0043A3A8    je          0043A3B0
 0043A3AA    cmp         byte ptr [ebp-1],0
>0043A3AE    jne         0043A3B4
 0043A3B0    xor         eax,eax
>0043A3B2    jmp         0043A3B6
 0043A3B4    mov         al,1
 0043A3B6    mov         byte ptr [ebp-2],al
 0043A3B9    cmp         byte ptr ds:[5E0C48],2;ActiveDrag:TDragOperation
>0043A3C0    jne         0043A405
 0043A3C2    cmp         byte ptr [ebp-2],0
>0043A3C6    je          0043A425
 0043A3C8    cmp         byte ptr [ebx+6C],0
>0043A3CC    je          0043A425
 0043A3CE    mov         eax,dword ptr [ebx+38]
 0043A3D1    call        GetParentForm
 0043A3D6    test        eax,eax
>0043A3D8    je          0043A3EC
 0043A3DA    mov         edx,dword ptr [eax+220]
 0043A3E0    cmp         edx,dword ptr [ebx+38]
>0043A3E3    jne         0043A3EC
 0043A3E5    xor         edx,edx
 0043A3E7    call        TCustomForm.SetActiveControl
 0043A3EC    mov         eax,[005E0C2C]
 0043A3F1    push        eax
 0043A3F2    xor         ecx,ecx
 0043A3F4    mov         edx,0B03A
 0043A3F9    mov         eax,[005E0C28];DragControl:TControl
 0043A3FE    call        TControl.Perform
>0043A403    jmp         0043A425
 0043A405    cmp         dword ptr ds:[5E0C4C],0;DragImageList:TDragImageList
>0043A40C    je          0043A41A
 0043A40E    mov         eax,[005E0C4C];DragImageList:TDragImageList
 0043A413    call        TDragImageList.EndDrag
>0043A418    jmp         0043A425
 0043A41A    mov         eax,[005E0C40];DragSaveCursor:HCURSOR
 0043A41F    push        eax
 0043A420    call        user32.SetCursor
 0043A425    xor         eax,eax
 0043A427    mov         [005E0C28],eax;DragControl:TControl
 0043A42C    xor         eax,eax
 0043A42E    mov         [005E0C2C],eax
 0043A433    cmp         dword ptr ds:[5E0C58],0;DragSave:TDragObject
>0043A43A    je          0043A49A
 0043A43C    mov         eax,[005E0C58];DragSave:TDragObject
 0043A441    cmp         dword ptr [eax+4],0
>0043A445    je          0043A49A
 0043A447    mov         al,3
 0043A449    cmp         byte ptr [ebp-2],0
>0043A44D    jne         0043A471
 0043A44F    mov         al,4
 0043A451    mov         edx,dword ptr ds:[5E0C58];DragSave:TDragObject
 0043A457    xor         ecx,ecx
 0043A459    mov         dword ptr [edx+0C],ecx
 0043A45C    mov         edx,dword ptr ds:[5E0C58];DragSave:TDragObject
 0043A462    xor         ecx,ecx
 0043A464    mov         dword ptr [edx+10],ecx
 0043A467    xor         edx,edx
 0043A469    mov         dword ptr [ebp-0A],edx
 0043A46C    xor         edx,edx
 0043A46E    mov         dword ptr [ebp-6],edx
 0043A471    mov         edx,dword ptr ds:[5E0C58];DragSave:TDragObject
 0043A477    mov         edx,dword ptr [edx+4]
 0043A47A    push        edx
 0043A47B    mov         edx,dword ptr ds:[5E0C58];DragSave:TDragObject
 0043A481    add         edx,0C
 0043A484    push        edx
 0043A485    mov         edx,dword ptr ds:[5E0C58];DragSave:TDragObject
 0043A48B    mov         edx,dword ptr [edx+8]
 0043A48E    mov         ecx,dword ptr ds:[5E0C58];DragSave:TDragObject
 0043A494    xchg        eax,edx
 0043A495    call        DragMessage
 0043A49A    xor         eax,eax
 0043A49C    pop         edx
 0043A49D    pop         ecx
 0043A49E    pop         ecx
 0043A49F    mov         dword ptr fs:[eax],edx
 0043A4A2    push        43A4F5
 0043A4A7    mov         eax,[005E0C54];QualifyingSites:TSiteList
 0043A4AC    call        TObject.Free
 0043A4B1    xor         eax,eax
 0043A4B3    mov         [005E0C54],eax;QualifyingSites:TSiteList
 0043A4B8    cmp         dword ptr ds:[5E0C58],0;DragSave:TDragObject
>0043A4BF    je          0043A4E6
 0043A4C1    mov         eax,[005E0C58];DragSave:TDragObject
 0043A4C6    mov         byte ptr [eax+30],0
 0043A4CA    mov         eax,dword ptr [ebp-6]
 0043A4CD    push        eax
 0043A4CE    mov         al,byte ptr [ebp-2]
 0043A4D1    push        eax
 0043A4D2    mov         eax,[005E0C58];DragSave:TDragObject
 0043A4D7    mov         edx,dword ptr [eax+4]
 0043A4DA    mov         ecx,dword ptr [ebp-0A]
 0043A4DD    mov         eax,[005E0C58];DragSave:TDragObject
 0043A4E2    mov         ebx,dword ptr [eax]
 0043A4E4    call        dword ptr [ebx]
 0043A4E6    xor         eax,eax
 0043A4E8    mov         [005E0C2C],eax
 0043A4ED    ret
>0043A4EE    jmp         @HandleFinally
>0043A4F3    jmp         0043A4A7
 0043A4F5    xor         eax,eax
 0043A4F7    pop         edx
 0043A4F8    pop         ecx
 0043A4F9    pop         ecx
 0043A4FA    mov         dword ptr fs:[eax],edx
 0043A4FD    push        43A567
 0043A502    xor         eax,eax
 0043A504    mov         [005E0C28],eax;DragControl:TControl
 0043A509    cmp         dword ptr ds:[5E0C58],0;DragSave:TDragObject
>0043A510    je          0043A558
 0043A512    mov         eax,[005E0C58];DragSave:TDragObject
 0043A517    mov         edx,dword ptr ds:[436DE4];TDragControlObjectEx
 0043A51D    call        @IsClass
 0043A522    test        al,al
>0043A524    jne         0043A54E
 0043A526    mov         eax,[005E0C58];DragSave:TDragObject
 0043A52B    mov         edx,dword ptr ds:[5AC0C8];gvar_005AC0C8
 0043A531    call        @IsClass
 0043A536    test        al,al
>0043A538    jne         0043A54E
 0043A53A    mov         eax,[005E0C58];DragSave:TDragObject
 0043A53F    mov         edx,dword ptr ds:[436F38];TDragDockObjectEx
 0043A545    call        @IsClass
 0043A54A    test        al,al
>0043A54C    je          0043A558
 0043A54E    mov         eax,[005E0C58];DragSave:TDragObject
 0043A553    call        TObject.Free
 0043A558    mov         byte ptr ds:[5E0C48],0;ActiveDrag:TDragOperation
 0043A55F    ret
>0043A560    jmp         @HandleFinally
>0043A565    jmp         0043A502
 0043A567    pop         ebx
 0043A568    mov         esp,ebp
 0043A56A    pop         ebp
 0043A56B    ret
*}
end;

//0043A56C
procedure CancelDrag;
begin
{*
 0043A56C    cmp         dword ptr ds:[5E0C2C],0
>0043A573    je          0043A57C
 0043A575    xor         eax,eax
 0043A577    call        DragDone
 0043A57C    xor         eax,eax
 0043A57E    mov         [005E0C28],eax;DragControl:TControl
 0043A583    ret
*}
end;

//0043A584
function FindVCLWindow(const Pos:TPoint):TWinControl;
begin
{*
 0043A584    push        ebx
 0043A585    push        esi
 0043A586    push        dword ptr [eax+4]
 0043A589    push        dword ptr [eax]
 0043A58B    call        user32.WindowFromPoint
 0043A590    mov         ebx,eax
 0043A592    xor         esi,esi
 0043A594    test        ebx,ebx
>0043A596    je          0043A5B1
 0043A598    mov         eax,ebx
 0043A59A    call        FindControl
 0043A59F    mov         esi,eax
 0043A5A1    test        esi,esi
>0043A5A3    jne         0043A5B1
 0043A5A5    push        ebx
 0043A5A6    call        user32.GetParent
 0043A5AB    mov         ebx,eax
 0043A5AD    test        ebx,ebx
>0043A5AF    jne         0043A598
 0043A5B1    mov         eax,esi
 0043A5B3    pop         esi
 0043A5B4    pop         ebx
 0043A5B5    ret
*}
end;

//0043A5B8
function FindDragTarget(const Pos:TPoint; AllowDisabled:Boolean):TControl;
begin
{*
 0043A5B8    push        ebx
 0043A5B9    push        esi
 0043A5BA    push        edi
 0043A5BB    push        ebp
 0043A5BC    add         esp,0FFFFFFF8
 0043A5BF    mov         ebx,edx
 0043A5C1    mov         edi,eax
 0043A5C3    xor         esi,esi
 0043A5C5    mov         eax,edi
 0043A5C7    call        FindVCLWindow
 0043A5CC    mov         ebp,eax
 0043A5CE    test        ebp,ebp
>0043A5D0    je          0043A5F6
 0043A5D2    mov         esi,ebp
 0043A5D4    push        0
 0043A5D6    lea         ecx,[esp+4]
 0043A5DA    mov         edx,edi
 0043A5DC    mov         eax,ebp
 0043A5DE    call        TControl.ScreenToClient
 0043A5E3    lea         edx,[esp+4]
 0043A5E7    mov         ecx,ebx
 0043A5E9    mov         eax,ebp
 0043A5EB    call        TWinControl.ControlAtPos
 0043A5F0    test        eax,eax
>0043A5F2    je          0043A5F6
 0043A5F4    mov         esi,eax
 0043A5F6    mov         eax,esi
 0043A5F8    pop         ecx
 0043A5F9    pop         edx
 0043A5FA    pop         ebp
 0043A5FB    pop         edi
 0043A5FC    pop         esi
 0043A5FD    pop         ebx
 0043A5FE    ret
*}
end;

//0043A600
procedure ListAdd(var List:TList; Item:Pointer);
begin
{*
 0043A600    push        ebx
 0043A601    push        esi
 0043A602    mov         esi,edx
 0043A604    mov         ebx,eax
 0043A606    cmp         dword ptr [ebx],0
>0043A609    jne         0043A619
 0043A60B    mov         dl,1
 0043A60D    mov         eax,[00417CEC];TList
 0043A612    call        TObject.Create
 0043A617    mov         dword ptr [ebx],eax
 0043A619    mov         eax,dword ptr [ebx]
 0043A61B    mov         edx,esi
 0043A61D    call        TList.Add
 0043A622    pop         esi
 0043A623    pop         ebx
 0043A624    ret
*}
end;

//0043A628
procedure ListRemove(var List:TList; Item:Pointer);
begin
{*
 0043A628    push        ebx
 0043A629    mov         ebx,eax
 0043A62B    mov         eax,dword ptr [ebx]
 0043A62D    call        TList.Remove
 0043A632    mov         eax,dword ptr [ebx]
 0043A634    cmp         dword ptr [eax+8],0
>0043A638    jne         0043A645
 0043A63A    mov         eax,dword ptr [ebx]
 0043A63C    call        TObject.Free
 0043A641    xor         eax,eax
 0043A643    mov         dword ptr [ebx],eax
 0043A645    pop         ebx
 0043A646    ret
*}
end;

//0043A648
procedure MoveWindowOrg(DC:HDC; DX:Integer; DY:Integer);
begin
{*
 0043A648    push        ebx
 0043A649    push        esi
 0043A64A    push        edi
 0043A64B    add         esp,0FFFFFFF8
 0043A64E    mov         edi,ecx
 0043A650    mov         esi,edx
 0043A652    mov         ebx,eax
 0043A654    push        esp
 0043A655    push        ebx
 0043A656    call        gdi32.GetWindowOrgEx
 0043A65B    push        0
 0043A65D    mov         eax,dword ptr [esp+8]
 0043A661    sub         eax,edi
 0043A663    push        eax
 0043A664    mov         eax,dword ptr [esp+8]
 0043A668    sub         eax,esi
 0043A66A    push        eax
 0043A66B    push        ebx
 0043A66C    call        gdi32.SetWindowOrgEx
 0043A671    pop         ecx
 0043A672    pop         edx
 0043A673    pop         edi
 0043A674    pop         esi
 0043A675    pop         ebx
 0043A676    ret
*}
end;

//0043A678
procedure FreeDeviceContext;
begin
{*
 0043A678    push        ebp
 0043A679    mov         ebp,esp
 0043A67B    add         esp,0FFFFFFF0
 0043A67E    mov         eax,[005E0C5C];CanvasList:TThreadList
 0043A683    call        TThreadList.LockList
 0043A688    mov         dword ptr [ebp-8],eax
 0043A68B    xor         eax,eax
 0043A68D    push        ebp
 0043A68E    push        43A728
 0043A693    push        dword ptr fs:[eax]
 0043A696    mov         dword ptr fs:[eax],esp
 0043A699    mov         eax,dword ptr [ebp-8]
 0043A69C    mov         eax,dword ptr [eax+8]
 0043A69F    dec         eax
 0043A6A0    test        eax,eax
>0043A6A2    jl          0043A710
 0043A6A4    inc         eax
 0043A6A5    mov         dword ptr [ebp-0C],eax
 0043A6A8    mov         dword ptr [ebp-4],0
 0043A6AF    mov         edx,dword ptr [ebp-4]
 0043A6B2    mov         eax,dword ptr [ebp-8]
 0043A6B5    call        TList.Get
 0043A6BA    mov         dword ptr [ebp-10],eax
 0043A6BD    mov         eax,dword ptr [ebp-10]
 0043A6C0    call        TCanvas.TryLock
 0043A6C5    test        al,al
>0043A6C7    je          0043A708
 0043A6C9    xor         eax,eax
 0043A6CB    push        ebp
 0043A6CC    push        43A701
 0043A6D1    push        dword ptr fs:[eax]
 0043A6D4    mov         dword ptr fs:[eax],esp
 0043A6D7    mov         eax,dword ptr [ebp-10]
 0043A6DA    call        TControlCanvas.FreeHandle
 0043A6DF    call        @TryFinallyExit
 0043A6E4    call        @TryFinallyExit
>0043A6E9    jmp         0043A72F
 0043A6EB    xor         eax,eax
 0043A6ED    pop         edx
 0043A6EE    pop         ecx
 0043A6EF    pop         ecx
 0043A6F0    mov         dword ptr fs:[eax],edx
 0043A6F3    push        43A708
 0043A6F8    mov         eax,dword ptr [ebp-10]
 0043A6FB    call        TCanvas.Unlock
 0043A700    ret
>0043A701    jmp         @HandleFinally
>0043A706    jmp         0043A6F8
 0043A708    inc         dword ptr [ebp-4]
 0043A70B    dec         dword ptr [ebp-0C]
>0043A70E    jne         0043A6AF
 0043A710    xor         eax,eax
 0043A712    pop         edx
 0043A713    pop         ecx
 0043A714    pop         ecx
 0043A715    mov         dword ptr fs:[eax],edx
 0043A718    push        43A72F
 0043A71D    mov         eax,[005E0C5C];CanvasList:TThreadList
 0043A722    call        TThreadList.UnlockList
 0043A727    ret
>0043A728    jmp         @HandleFinally
>0043A72D    jmp         0043A71D
 0043A72F    mov         esp,ebp
 0043A731    pop         ebp
 0043A732    ret
*}
end;

//0043A734
procedure FreeDeviceContexts;
begin
{*
 0043A734    push        ebp
 0043A735    mov         ebp,esp
 0043A737    add         esp,0FFFFFFF4
 0043A73A    mov         eax,[005E0C5C];CanvasList:TThreadList
 0043A73F    call        TThreadList.LockList
 0043A744    mov         dword ptr [ebp-8],eax
 0043A747    xor         eax,eax
 0043A749    push        ebp
 0043A74A    push        43A7D2
 0043A74F    push        dword ptr fs:[eax]
 0043A752    mov         dword ptr fs:[eax],esp
 0043A755    mov         eax,dword ptr [ebp-8]
 0043A758    mov         eax,dword ptr [eax+8]
 0043A75B    dec         eax
 0043A75C    cmp         eax,0
>0043A75F    jl          0043A7BA
 0043A761    mov         dword ptr [ebp-4],eax
 0043A764    mov         edx,dword ptr [ebp-4]
 0043A767    mov         eax,dword ptr [ebp-8]
 0043A76A    call        TList.Get
 0043A76F    mov         dword ptr [ebp-0C],eax
 0043A772    mov         eax,dword ptr [ebp-0C]
 0043A775    call        TCanvas.TryLock
 0043A77A    test        al,al
>0043A77C    je          0043A7B1
 0043A77E    xor         eax,eax
 0043A780    push        ebp
 0043A781    push        43A7AA
 0043A786    push        dword ptr fs:[eax]
 0043A789    mov         dword ptr fs:[eax],esp
 0043A78C    mov         eax,dword ptr [ebp-0C]
 0043A78F    call        TControlCanvas.FreeHandle
 0043A794    xor         eax,eax
 0043A796    pop         edx
 0043A797    pop         ecx
 0043A798    pop         ecx
 0043A799    mov         dword ptr fs:[eax],edx
 0043A79C    push        43A7B1
 0043A7A1    mov         eax,dword ptr [ebp-0C]
 0043A7A4    call        TCanvas.Unlock
 0043A7A9    ret
>0043A7AA    jmp         @HandleFinally
>0043A7AF    jmp         0043A7A1
 0043A7B1    dec         dword ptr [ebp-4]
 0043A7B4    cmp         dword ptr [ebp-4],0FFFFFFFF
>0043A7B8    jne         0043A764
 0043A7BA    xor         eax,eax
 0043A7BC    pop         edx
 0043A7BD    pop         ecx
 0043A7BE    pop         ecx
 0043A7BF    mov         dword ptr fs:[eax],edx
 0043A7C2    push        43A7D9
 0043A7C7    mov         eax,[005E0C5C];CanvasList:TThreadList
 0043A7CC    call        TThreadList.UnlockList
 0043A7D1    ret
>0043A7D2    jmp         @HandleFinally
>0043A7D7    jmp         0043A7C7
 0043A7D9    mov         esp,ebp
 0043A7DB    pop         ebp
 0043A7DC    ret
*}
end;

//0043A7E0
destructor TControlCanvas.Destroy;
begin
{*
 0043A7E0    push        ebx
 0043A7E1    push        esi
 0043A7E2    call        @BeforeDestruction
 0043A7E7    mov         ebx,edx
 0043A7E9    mov         esi,eax
 0043A7EB    mov         eax,esi
 0043A7ED    call        TControlCanvas.FreeHandle
 0043A7F2    mov         edx,ebx
 0043A7F4    and         dl,0FC
 0043A7F7    mov         eax,esi
 0043A7F9    call        TCanvas.Destroy
 0043A7FE    test        bl,bl
>0043A800    jle         0043A809
 0043A802    mov         eax,esi
 0043A804    call        @ClassDestroy
 0043A809    pop         esi
 0043A80A    pop         ebx
 0043A80B    ret
*}
end;

//0043A80C
procedure TControlCanvas.CreateHandle;
begin
{*
 0043A80C    push        ebp
 0043A80D    mov         ebp,esp
 0043A80F    push        ecx
 0043A810    push        ebx
 0043A811    mov         dword ptr [ebp-4],eax
 0043A814    mov         eax,dword ptr [ebp-4]
 0043A817    cmp         dword ptr [eax+58],0
>0043A81B    jne         0043A82A
 0043A81D    mov         eax,dword ptr [ebp-4]
 0043A820    call        TCanvas.CreateHandle
>0043A825    jmp         0043A8AE
 0043A82A    mov         eax,dword ptr [ebp-4]
 0043A82D    cmp         dword ptr [eax+5C],0
>0043A831    jne         0043A898
 0043A833    mov         eax,[005E0C5C];CanvasList:TThreadList
 0043A838    call        TThreadList.LockList
 0043A83D    mov         ebx,eax
 0043A83F    xor         eax,eax
 0043A841    push        ebp
 0043A842    push        43A891
 0043A847    push        dword ptr fs:[eax]
 0043A84A    mov         dword ptr fs:[eax],esp
 0043A84D    cmp         dword ptr [ebx+8],4
>0043A851    jl          0043A858
 0043A853    call        FreeDeviceContext
 0043A858    mov         eax,dword ptr [ebp-4]
 0043A85B    lea         edx,[eax+60]
 0043A85E    mov         eax,dword ptr [ebp-4]
 0043A861    mov         eax,dword ptr [eax+58]
 0043A864    mov         ecx,dword ptr [eax]
 0043A866    call        dword ptr [ecx+48]
 0043A869    mov         edx,dword ptr [ebp-4]
 0043A86C    mov         dword ptr [edx+5C],eax
 0043A86F    mov         edx,dword ptr [ebp-4]
 0043A872    mov         eax,ebx
 0043A874    call        TList.Add
 0043A879    xor         eax,eax
 0043A87B    pop         edx
 0043A87C    pop         ecx
 0043A87D    pop         ecx
 0043A87E    mov         dword ptr fs:[eax],edx
 0043A881    push        43A898
 0043A886    mov         eax,[005E0C5C];CanvasList:TThreadList
 0043A88B    call        TThreadList.UnlockList
 0043A890    ret
>0043A891    jmp         @HandleFinally
>0043A896    jmp         0043A886
 0043A898    mov         eax,dword ptr [ebp-4]
 0043A89B    mov         edx,dword ptr [eax+5C]
 0043A89E    mov         eax,dword ptr [ebp-4]
 0043A8A1    call        TCanvas.SetHandle
 0043A8A6    mov         eax,dword ptr [ebp-4]
 0043A8A9    call        TControlCanvas.UpdateTextFlags
 0043A8AE    pop         ebx
 0043A8AF    pop         ecx
 0043A8B0    pop         ebp
 0043A8B1    ret
*}
end;

//0043A8B4
procedure TControlCanvas.FreeHandle;
begin
{*
 0043A8B4    push        ebx
 0043A8B5    mov         ebx,eax
 0043A8B7    cmp         dword ptr [ebx+5C],0
>0043A8BB    je          0043A8E4
 0043A8BD    xor         edx,edx
 0043A8BF    mov         eax,ebx
 0043A8C1    call        TCanvas.SetHandle
 0043A8C6    mov         edx,ebx
 0043A8C8    mov         eax,[005E0C5C];CanvasList:TThreadList
 0043A8CD    call        TThreadList.Remove
 0043A8D2    mov         eax,dword ptr [ebx+5C]
 0043A8D5    push        eax
 0043A8D6    mov         eax,dword ptr [ebx+60]
 0043A8D9    push        eax
 0043A8DA    call        user32.ReleaseDC
 0043A8DF    xor         eax,eax
 0043A8E1    mov         dword ptr [ebx+5C],eax
 0043A8E4    pop         ebx
 0043A8E5    ret
*}
end;

//0043A8E8
procedure TControlCanvas.SetControl(AControl:TControl);
begin
{*
 0043A8E8    push        ebx
 0043A8E9    push        esi
 0043A8EA    mov         esi,edx
 0043A8EC    mov         ebx,eax
 0043A8EE    cmp         esi,dword ptr [ebx+58]
>0043A8F1    je          0043A8FD
 0043A8F3    mov         eax,ebx
 0043A8F5    call        TControlCanvas.FreeHandle
 0043A8FA    mov         dword ptr [ebx+58],esi
 0043A8FD    pop         esi
 0043A8FE    pop         ebx
 0043A8FF    ret
*}
end;

//0043A900
procedure TControlCanvas.UpdateTextFlags;
begin
{*
 0043A900    push        ebx
 0043A901    push        esi
 0043A902    mov         ebx,eax
 0043A904    mov         esi,dword ptr [ebx+58]
 0043A907    test        esi,esi
>0043A909    je          0043A926
 0043A90B    mov         eax,esi
 0043A90D    call        TControl.UseRightToLeftReading
 0043A912    test        al,al
>0043A914    je          0043A91F
 0043A916    or          dword ptr [ebx+54],80
>0043A91D    jmp         0043A926
 0043A91F    and         dword ptr [ebx+54],0FFFFFF7F
 0043A926    pop         esi
 0043A927    pop         ebx
 0043A928    ret
*}
end;

//0043A92C
constructor TSizeConstraints.Create(Control:TControl);
begin
{*
 0043A92C    push        ebx
 0043A92D    push        esi
 0043A92E    push        edi
 0043A92F    test        dl,dl
>0043A931    je          0043A93B
 0043A933    add         esp,0FFFFFFF0
 0043A936    call        @ClassCreate
 0043A93B    mov         esi,ecx
 0043A93D    mov         ebx,edx
 0043A93F    mov         edi,eax
 0043A941    xor         edx,edx
 0043A943    mov         eax,edi
 0043A945    call        TObject.Create
 0043A94A    mov         dword ptr [edi+4],esi
 0043A94D    mov         eax,edi
 0043A94F    test        bl,bl
>0043A951    je          0043A962
 0043A953    call        @AfterConstruction
 0043A958    pop         dword ptr fs:[0]
 0043A95F    add         esp,0C
 0043A962    mov         eax,edi
 0043A964    pop         edi
 0043A965    pop         esi
 0043A966    pop         ebx
 0043A967    ret
*}
end;

//0043A968
procedure TSizeConstraints.AssignTo(Dest:TPersistent);
begin
{*
 0043A968    push        ebx
 0043A969    push        esi
 0043A96A    mov         ebx,edx
 0043A96C    mov         esi,eax
 0043A96E    mov         eax,ebx
 0043A970    mov         edx,dword ptr ds:[4372F0];TSizeConstraints
 0043A976    call        @IsClass
 0043A97B    test        al,al
>0043A97D    je          0043A9A1
 0043A97F    mov         eax,ebx
 0043A981    mov         edx,dword ptr [esi+10]
 0043A984    mov         dword ptr [eax+10],edx
 0043A987    mov         edx,dword ptr [esi+8]
 0043A98A    mov         dword ptr [eax+8],edx
 0043A98D    mov         edx,dword ptr [esi+14]
 0043A990    mov         dword ptr [eax+14],edx
 0043A993    mov         edx,dword ptr [esi+0C]
 0043A996    mov         dword ptr [eax+0C],edx
 0043A999    mov         edx,dword ptr [eax]
 0043A99B    call        dword ptr [edx+0C]
 0043A99E    pop         esi
 0043A99F    pop         ebx
 0043A9A0    ret
 0043A9A1    mov         edx,ebx
 0043A9A3    mov         eax,esi
 0043A9A5    call        TPersistent.AssignTo
 0043A9AA    pop         esi
 0043A9AB    pop         ebx
 0043A9AC    ret
*}
end;

//0043A9B0
procedure TSizeConstraints.SetConstraints(Index:Integer; Value:TConstraintSize);
begin
{*
 0043A9B0    push        esi
 0043A9B1    mov         esi,eax
 0043A9B3    sub         edx,1
>0043A9B6    jb          0043A9C2
>0043A9B8    je          0043A9DF
 0043A9BA    dec         edx
>0043A9BB    je          0043A9FC
 0043A9BD    dec         edx
>0043A9BE    je          0043AA1B
>0043A9C0    jmp         0043AA38
 0043A9C2    cmp         ecx,dword ptr [esi+8]
>0043A9C5    je          0043AA38
 0043A9C7    mov         dword ptr [esi+8],ecx
 0043A9CA    test        ecx,ecx
>0043A9CC    jbe         0043A9D6
 0043A9CE    cmp         ecx,dword ptr [esi+10]
>0043A9D1    jae         0043A9D6
 0043A9D3    mov         dword ptr [esi+10],ecx
 0043A9D6    mov         eax,esi
 0043A9D8    mov         edx,dword ptr [eax]
 0043A9DA    call        dword ptr [edx+0C]
 0043A9DD    pop         esi
 0043A9DE    ret
 0043A9DF    cmp         ecx,dword ptr [esi+0C]
>0043A9E2    je          0043AA38
 0043A9E4    mov         dword ptr [esi+0C],ecx
 0043A9E7    test        ecx,ecx
>0043A9E9    jbe         0043A9F3
 0043A9EB    cmp         ecx,dword ptr [esi+14]
>0043A9EE    jae         0043A9F3
 0043A9F0    mov         dword ptr [esi+14],ecx
 0043A9F3    mov         eax,esi
 0043A9F5    mov         edx,dword ptr [eax]
 0043A9F7    call        dword ptr [edx+0C]
 0043A9FA    pop         esi
 0043A9FB    ret
 0043A9FC    cmp         ecx,dword ptr [esi+10]
>0043A9FF    je          0043AA38
 0043AA01    mov         dword ptr [esi+10],ecx
 0043AA04    mov         eax,dword ptr [esi+8]
 0043AA07    test        eax,eax
>0043AA09    jbe         0043AA12
 0043AA0B    cmp         eax,ecx
>0043AA0D    jae         0043AA12
 0043AA0F    mov         dword ptr [esi+8],ecx
 0043AA12    mov         eax,esi
 0043AA14    mov         edx,dword ptr [eax]
 0043AA16    call        dword ptr [edx+0C]
 0043AA19    pop         esi
 0043AA1A    ret
 0043AA1B    cmp         ecx,dword ptr [esi+14]
>0043AA1E    je          0043AA38
 0043AA20    mov         dword ptr [esi+14],ecx
 0043AA23    mov         eax,dword ptr [esi+0C]
 0043AA26    test        eax,eax
>0043AA28    jbe         0043AA31
 0043AA2A    cmp         eax,ecx
>0043AA2C    jae         0043AA31
 0043AA2E    mov         dword ptr [esi+0C],ecx
 0043AA31    mov         eax,esi
 0043AA33    mov         edx,dword ptr [eax]
 0043AA35    call        dword ptr [edx+0C]
 0043AA38    pop         esi
 0043AA39    ret
*}
end;

//0043AA3C
procedure TSizeConstraints.Change;
begin
{*
 0043AA3C    push        ebx
 0043AA3D    cmp         word ptr [eax+1A],0
>0043AA42    je          0043AA4E
 0043AA44    mov         ebx,eax
 0043AA46    mov         edx,eax
 0043AA48    mov         eax,dword ptr [ebx+1C]
 0043AA4B    call        dword ptr [ebx+18]
 0043AA4E    pop         ebx
 0043AA4F    ret
*}
end;

//0043AA50
procedure TControlActionLink.AssignClient(AClient:TObject);
begin
{*
 0043AA50    push        ebx
 0043AA51    push        esi
 0043AA52    mov         esi,edx
 0043AA54    mov         ebx,eax
 0043AA56    mov         eax,esi
 0043AA58    mov         edx,dword ptr ds:[437BA4];TControl
 0043AA5E    call        @AsClass
 0043AA63    mov         dword ptr [ebx+18],eax
 0043AA66    pop         esi
 0043AA67    pop         ebx
 0043AA68    ret
*}
end;

//0043AA6C
function TControlActionLink.DoShowHint(var HintStr:AnsiString):Boolean;
begin
{*
 0043AA6C    push        ebp
 0043AA6D    mov         ebp,esp
 0043AA6F    add         esp,0FFFFFFE4
 0043AA72    push        ebx
 0043AA73    push        esi
 0043AA74    push        edi
 0043AA75    xor         ecx,ecx
 0043AA77    mov         dword ptr [ebp-8],ecx
 0043AA7A    mov         dword ptr [ebp-1C],ecx
 0043AA7D    mov         edi,edx
 0043AA7F    mov         ebx,eax
 0043AA81    xor         eax,eax
 0043AA83    push        ebp
 0043AA84    push        43AB39
 0043AA89    push        dword ptr fs:[eax]
 0043AA8C    mov         dword ptr fs:[eax],esp
 0043AA8F    mov         byte ptr [ebp-1],1
 0043AA93    mov         eax,dword ptr [ebx+10]
 0043AA96    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043AA9C    call        @IsClass
 0043AAA1    test        al,al
>0043AAA3    je          0043AB1B
 0043AAA5    mov         edx,edi
 0043AAA7    mov         eax,dword ptr [ebx+10]
 0043AAAA    mov         si,0FFEE
 0043AAAE    call        @CallDynaInst
 0043AAB3    test        al,al
>0043AAB5    je          0043AB1B
 0043AAB7    mov         eax,[005AE584];^Application:TApplication
 0043AABC    mov         eax,dword ptr [eax]
 0043AABE    cmp         byte ptr [eax+7C],0
>0043AAC2    je          0043AB1B
 0043AAC4    mov         eax,dword ptr [ebx+10]
 0043AAC7    cmp         word ptr [eax+84],0
>0043AACF    je          0043AB1B
 0043AAD1    cmp         dword ptr [edi],0
>0043AAD4    je          0043AB1B
 0043AAD6    lea         eax,[ebp-8]
 0043AAD9    push        eax
 0043AADA    mov         eax,dword ptr [edi]
 0043AADC    mov         dword ptr [ebp-18],eax
 0043AADF    mov         byte ptr [ebp-14],0B
 0043AAE3    lea         edx,[ebp-1C]
 0043AAE6    mov         eax,dword ptr [ebx+10]
 0043AAE9    mov         ax,word ptr [eax+84]
 0043AAF0    call        ShortCutToText
 0043AAF5    mov         eax,dword ptr [ebp-1C]
 0043AAF8    mov         dword ptr [ebp-10],eax
 0043AAFB    mov         byte ptr [ebp-0C],0B
 0043AAFF    lea         edx,[ebp-18]
 0043AB02    mov         ecx,1
 0043AB07    mov         eax,43AB54;'%s (%s)'
 0043AB0C    call        Format
 0043AB11    mov         edx,dword ptr [ebp-8]
 0043AB14    mov         eax,edi
 0043AB16    call        @LStrAsg
 0043AB1B    xor         eax,eax
 0043AB1D    pop         edx
 0043AB1E    pop         ecx
 0043AB1F    pop         ecx
 0043AB20    mov         dword ptr fs:[eax],edx
 0043AB23    push        43AB40
 0043AB28    lea         eax,[ebp-1C]
 0043AB2B    call        @LStrClr
 0043AB30    lea         eax,[ebp-8]
 0043AB33    call        @LStrClr
 0043AB38    ret
>0043AB39    jmp         @HandleFinally
>0043AB3E    jmp         0043AB28
 0043AB40    mov         al,byte ptr [ebp-1]
 0043AB43    pop         edi
 0043AB44    pop         esi
 0043AB45    pop         ebx
 0043AB46    mov         esp,ebp
 0043AB48    pop         ebp
 0043AB49    ret
*}
end;

//0043AB5C
function TControlActionLink.IsCaptionLinked:Boolean;
begin
{*
 0043AB5C    push        ebp
 0043AB5D    mov         ebp,esp
 0043AB5F    push        0
 0043AB61    push        ebx
 0043AB62    mov         ebx,eax
 0043AB64    xor         eax,eax
 0043AB66    push        ebp
 0043AB67    push        43ABC3
 0043AB6C    push        dword ptr fs:[eax]
 0043AB6F    mov         dword ptr fs:[eax],esp
 0043AB72    mov         eax,ebx
 0043AB74    call        TActionLink.IsCaptionLinked
 0043AB79    test        al,al
>0043AB7B    je          0043ABA5
 0043AB7D    lea         edx,[ebp-4]
 0043AB80    mov         eax,dword ptr [ebx+18]
 0043AB83    call        TControl.GetText
 0043AB88    mov         eax,dword ptr [ebp-4]
 0043AB8B    push        eax
 0043AB8C    mov         eax,dword ptr [ebx+10]
 0043AB8F    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043AB95    call        @AsClass
 0043AB9A    mov         edx,dword ptr [eax+64]
 0043AB9D    pop         eax
 0043AB9E    call        @LStrCmp
>0043ABA3    je          0043ABA9
 0043ABA5    xor         eax,eax
>0043ABA7    jmp         0043ABAB
 0043ABA9    mov         al,1
 0043ABAB    mov         ebx,eax
 0043ABAD    xor         eax,eax
 0043ABAF    pop         edx
 0043ABB0    pop         ecx
 0043ABB1    pop         ecx
 0043ABB2    mov         dword ptr fs:[eax],edx
 0043ABB5    push        43ABCA
 0043ABBA    lea         eax,[ebp-4]
 0043ABBD    call        @LStrClr
 0043ABC2    ret
>0043ABC3    jmp         @HandleFinally
>0043ABC8    jmp         0043ABBA
 0043ABCA    mov         eax,ebx
 0043ABCC    pop         ebx
 0043ABCD    pop         ecx
 0043ABCE    pop         ebp
 0043ABCF    ret
*}
end;

//0043ABD0
function TControlActionLink.IsEnabledLinked:Boolean;
begin
{*
 0043ABD0    push        ebx
 0043ABD1    mov         ebx,eax
 0043ABD3    mov         eax,ebx
 0043ABD5    call        TActionLink.IsEnabledLinked
 0043ABDA    test        al,al
>0043ABDC    je          0043ABFB
 0043ABDE    mov         eax,dword ptr [ebx+18]
 0043ABE1    mov         edx,dword ptr [eax]
 0043ABE3    call        dword ptr [edx+50]
 0043ABE6    push        eax
 0043ABE7    mov         eax,dword ptr [ebx+10]
 0043ABEA    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043ABF0    call        @AsClass
 0043ABF5    pop         edx
 0043ABF6    cmp         dl,byte ptr [eax+6A]
>0043ABF9    je          0043ABFF
 0043ABFB    xor         eax,eax
 0043ABFD    pop         ebx
 0043ABFE    ret
 0043ABFF    mov         al,1
 0043AC01    pop         ebx
 0043AC02    ret
*}
end;

//0043AC04
function TControlActionLink.IsHintLinked:Boolean;
begin
{*
 0043AC04    push        ebx
 0043AC05    mov         ebx,eax
 0043AC07    mov         eax,ebx
 0043AC09    call        TActionLink.IsHintLinked
 0043AC0E    test        al,al
>0043AC10    je          0043AC33
 0043AC12    mov         eax,dword ptr [ebx+10]
 0043AC15    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043AC1B    call        @AsClass
 0043AC20    mov         edx,dword ptr [eax+7C]
 0043AC23    mov         eax,dword ptr [ebx+18]
 0043AC26    mov         eax,dword ptr [eax+80]
 0043AC2C    call        @LStrCmp
>0043AC31    je          0043AC37
 0043AC33    xor         eax,eax
 0043AC35    pop         ebx
 0043AC36    ret
 0043AC37    mov         al,1
 0043AC39    pop         ebx
 0043AC3A    ret
*}
end;

//0043AC3C
function TControlActionLink.IsVisibleLinked:Boolean;
begin
{*
 0043AC3C    push        ebx
 0043AC3D    mov         ebx,eax
 0043AC3F    mov         eax,ebx
 0043AC41    call        TActionLink.IsVisibleLinked
 0043AC46    test        al,al
>0043AC48    je          0043AC66
 0043AC4A    mov         eax,dword ptr [ebx+10]
 0043AC4D    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043AC53    call        @AsClass
 0043AC58    mov         al,byte ptr [eax+86]
 0043AC5E    mov         edx,dword ptr [ebx+18]
 0043AC61    cmp         al,byte ptr [edx+57]
>0043AC64    je          0043AC6A
 0043AC66    xor         eax,eax
 0043AC68    pop         ebx
 0043AC69    ret
 0043AC6A    mov         al,1
 0043AC6C    pop         ebx
 0043AC6D    ret
*}
end;

//0043AC70
function TControlActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 0043AC70    push        ebx
 0043AC71    mov         ebx,eax
 0043AC73    mov         eax,ebx
 0043AC75    call        TBasicActionLink.IsOnExecuteLinked
 0043AC7A    test        al,al
>0043AC7C    je          0043AC8F
 0043AC7E    mov         eax,dword ptr [ebx+18]
 0043AC81    mov         eax,dword ptr [eax+120]
 0043AC87    mov         edx,dword ptr [ebx+10]
 0043AC8A    cmp         eax,dword ptr [edx+40]
>0043AC8D    je          0043AC93
 0043AC8F    xor         eax,eax
 0043AC91    pop         ebx
 0043AC92    ret
 0043AC93    mov         al,1
 0043AC95    pop         ebx
 0043AC96    ret
*}
end;

//0043AC98
procedure TControlActionLink.SetCaption(const Value:AnsiString);
begin
{*
 0043AC98    push        ebx
 0043AC99    push        esi
 0043AC9A    mov         esi,edx
 0043AC9C    mov         ebx,eax
 0043AC9E    mov         eax,ebx
 0043ACA0    mov         edx,dword ptr [eax]
 0043ACA2    call        dword ptr [edx+20]
 0043ACA5    test        al,al
>0043ACA7    je          0043ACB3
 0043ACA9    mov         edx,esi
 0043ACAB    mov         eax,dword ptr [ebx+18]
 0043ACAE    call        TControl.SetText
 0043ACB3    pop         esi
 0043ACB4    pop         ebx
 0043ACB5    ret
*}
end;

//0043ACB8
procedure TControlActionLink.SetEnabled(Value:Boolean);
begin
{*
 0043ACB8    push        ebx
 0043ACB9    push        esi
 0043ACBA    mov         ebx,edx
 0043ACBC    mov         esi,eax
 0043ACBE    mov         eax,esi
 0043ACC0    mov         edx,dword ptr [eax]
 0043ACC2    call        dword ptr [edx+28]
 0043ACC5    test        al,al
>0043ACC7    je          0043ACD3
 0043ACC9    mov         edx,ebx
 0043ACCB    mov         eax,dword ptr [esi+18]
 0043ACCE    mov         ecx,dword ptr [eax]
 0043ACD0    call        dword ptr [ecx+64]
 0043ACD3    pop         esi
 0043ACD4    pop         ebx
 0043ACD5    ret
*}
end;

//0043ACD8
procedure TControlActionLink.SetHint(const Value:AnsiString);
begin
{*
 0043ACD8    push        ebx
 0043ACD9    push        esi
 0043ACDA    mov         esi,edx
 0043ACDC    mov         ebx,eax
 0043ACDE    mov         eax,ebx
 0043ACE0    mov         edx,dword ptr [eax]
 0043ACE2    call        dword ptr [edx+38]
 0043ACE5    test        al,al
>0043ACE7    je          0043ACF8
 0043ACE9    mov         eax,dword ptr [ebx+18]
 0043ACEC    add         eax,80
 0043ACF1    mov         edx,esi
 0043ACF3    call        @LStrAsg
 0043ACF8    pop         esi
 0043ACF9    pop         ebx
 0043ACFA    ret
*}
end;

//0043ACFC
procedure TControlActionLink.SetVisible(Value:Boolean);
begin
{*
 0043ACFC    push        ebx
 0043ACFD    push        esi
 0043ACFE    mov         ebx,edx
 0043AD00    mov         esi,eax
 0043AD02    mov         eax,esi
 0043AD04    mov         edx,dword ptr [eax]
 0043AD06    call        dword ptr [edx+44]
 0043AD09    test        al,al
>0043AD0B    je          0043AD17
 0043AD0D    mov         edx,ebx
 0043AD0F    mov         eax,dword ptr [esi+18]
 0043AD12    call        TControl.SetVisible
 0043AD17    pop         esi
 0043AD18    pop         ebx
 0043AD19    ret
*}
end;

//0043AD1C
procedure TControlActionLink.SetOnExecute(Value:TNotifyEvent);
begin
{*
 0043AD1C    push        ebp
 0043AD1D    mov         ebp,esp
 0043AD1F    push        ebx
 0043AD20    mov         ebx,eax
 0043AD22    mov         eax,ebx
 0043AD24    mov         edx,dword ptr [eax]
 0043AD26    call        dword ptr [edx+8]
 0043AD29    test        al,al
>0043AD2B    je          0043AD42
 0043AD2D    mov         eax,dword ptr [ebx+18]
 0043AD30    mov         edx,dword ptr [ebp+8]
 0043AD33    mov         dword ptr [eax+120],edx
 0043AD39    mov         edx,dword ptr [ebp+0C]
 0043AD3C    mov         dword ptr [eax+124],edx
 0043AD42    pop         ebx
 0043AD43    pop         ebp
 0043AD44    ret         8
*}
end;

//0043AD48
function TControlActionLink.IsHelpLinked:Boolean;
begin
{*
 0043AD48    push        ebx
 0043AD49    push        esi
 0043AD4A    push        edi
 0043AD4B    mov         ebx,eax
 0043AD4D    mov         eax,dword ptr [ebx+10]
 0043AD50    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043AD56    call        @AsClass
 0043AD5B    mov         edi,eax
 0043AD5D    mov         eax,dword ptr [edi+74]
 0043AD60    mov         esi,dword ptr [ebx+18]
 0043AD63    cmp         eax,dword ptr [esi+158]
>0043AD69    jne         0043ADA2
 0043AD6B    mov         eax,dword ptr [ebx+10]
 0043AD6E    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043AD74    call        @AsClass
 0043AD79    mov         edx,dword ptr [edi+78]
 0043AD7C    mov         eax,dword ptr [esi+154]
 0043AD82    call        @LStrCmp
>0043AD87    jne         0043ADA2
 0043AD89    mov         eax,dword ptr [ebx+10]
 0043AD8C    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043AD92    call        @AsClass
 0043AD97    mov         al,byte ptr [edi+70]
 0043AD9A    cmp         al,byte ptr [esi+150]
>0043ADA0    je          0043ADA6
 0043ADA2    xor         eax,eax
>0043ADA4    jmp         0043ADA8
 0043ADA6    mov         al,1
 0043ADA8    pop         edi
 0043ADA9    pop         esi
 0043ADAA    pop         ebx
 0043ADAB    ret
*}
end;

//0043ADAC
procedure TControlActionLink.SetHelpContext(Value:THelpContext);
begin
{*
 0043ADAC    push        ebx
 0043ADAD    push        esi
 0043ADAE    mov         esi,edx
 0043ADB0    mov         ebx,eax
 0043ADB2    mov         eax,ebx
 0043ADB4    mov         edx,dword ptr [eax]
 0043ADB6    call        dword ptr [edx+34]
 0043ADB9    test        al,al
>0043ADBB    je          0043ADC7
 0043ADBD    mov         edx,esi
 0043ADBF    mov         eax,dword ptr [ebx+18]
 0043ADC2    call        TControl.SetHelpKeyword
 0043ADC7    pop         esi
 0043ADC8    pop         ebx
 0043ADC9    ret
*}
end;

//0043ADCC
{*procedure sub_0043ADCC(?:?);
begin
 0043ADCC    push        ebx
 0043ADCD    push        esi
 0043ADCE    mov         esi,edx
 0043ADD0    mov         ebx,eax
 0043ADD2    mov         eax,ebx
 0043ADD4    mov         edx,dword ptr [eax]
 0043ADD6    call        dword ptr [edx+34];TControlActionLink.IsHelpLinked
 0043ADD9    test        al,al
>0043ADDB    je          0043ADE7
 0043ADDD    mov         edx,esi
 0043ADDF    mov         eax,dword ptr [ebx+18];TControlActionLink.FClient:TControl
 0043ADE2    call        TControl.SetHelpContext
 0043ADE7    pop         esi
 0043ADE8    pop         ebx
 0043ADE9    ret
end;*}

//0043ADEC
procedure TControlActionLink.SetHelpType(Value:THelpType);
begin
{*
 0043ADEC    push        ebx
 0043ADED    push        esi
 0043ADEE    mov         ebx,edx
 0043ADF0    mov         esi,eax
 0043ADF2    mov         eax,esi
 0043ADF4    mov         edx,dword ptr [eax]
 0043ADF6    call        dword ptr [edx+34]
 0043ADF9    test        al,al
>0043ADFB    je          0043AE06
 0043ADFD    mov         eax,dword ptr [esi+18]
 0043AE00    mov         byte ptr [eax+150],bl
 0043AE06    pop         esi
 0043AE07    pop         ebx
 0043AE08    ret
*}
end;

//0043AE0C
constructor TControl.Create(AOwner:TComponent);
begin
{*
 0043AE0C    push        ebp
 0043AE0D    mov         ebp,esp
 0043AE0F    push        ecx
 0043AE10    push        ebx
 0043AE11    push        esi
 0043AE12    test        dl,dl
>0043AE14    je          0043AE1E
 0043AE16    add         esp,0FFFFFFF0
 0043AE19    call        @ClassCreate
 0043AE1E    mov         byte ptr [ebp-1],dl
 0043AE21    mov         ebx,eax
 0043AE23    xor         edx,edx
 0043AE25    mov         eax,ebx
 0043AE27    call        TComponent.Create
 0043AE2C    mov         dword ptr [ebx+3C],ebx
 0043AE2F    mov         eax,dword ptr [ebx]
 0043AE31    mov         eax,dword ptr [eax+74]
 0043AE34    mov         dword ptr [ebx+38],eax
 0043AE37    mov         eax,[0043AEDC]
 0043AE3C    mov         dword ptr [ebx+50],eax
 0043AE3F    mov         dl,1
 0043AE41    mov         eax,[0042451C];TFont
 0043AE46    call        TFont.Create
 0043AE4B    mov         esi,eax
 0043AE4D    mov         dword ptr [ebx+68],esi
 0043AE50    mov         dword ptr [esi+0C],ebx
 0043AE53    mov         dword ptr [esi+8],43BDAC;TControl.FontChanged
 0043AE5A    mov         al,[0043AEE0]
 0043AE5F    mov         byte ptr [ebx+61],al
 0043AE62    mov         ecx,ebx
 0043AE64    mov         dl,1
 0043AE66    mov         eax,[004372F0];TSizeConstraints
 0043AE6B    call        TSizeConstraints.Create
 0043AE70    mov         esi,eax
 0043AE72    mov         dword ptr [ebx+74],esi
 0043AE75    mov         dword ptr [esi+1C],ebx
 0043AE78    mov         dword ptr [esi+18],43CC64;TControl.DoConstraintsChange
 0043AE7F    mov         dword ptr [ebx+70],0FF000005
 0043AE86    mov         byte ptr [ebx+57],1
 0043AE8A    mov         byte ptr [ebx+58],1
 0043AE8E    mov         byte ptr [ebx+59],1
 0043AE92    mov         byte ptr [ebx+5A],1
 0043AE96    mov         byte ptr [ebx+9A],1
 0043AE9D    mov         byte ptr [ebx+60],1
 0043AEA1    mov         byte ptr [ebx+5E],0
 0043AEA5    mov         word ptr [ebx+7A],0FFF4
 0043AEAB    mov         eax,[00451DA0];TCustomDockForm
 0043AEB0    mov         dword ptr [ebx+0B8],eax
 0043AEB6    mov         byte ptr [ebx+150],1
 0043AEBD    mov         eax,ebx
 0043AEBF    cmp         byte ptr [ebp-1],0
>0043AEC3    je          0043AED4
 0043AEC5    call        @AfterConstruction
 0043AECA    pop         dword ptr fs:[0]
 0043AED1    add         esp,0C
 0043AED4    mov         eax,ebx
 0043AED6    pop         esi
 0043AED7    pop         ebx
 0043AED8    pop         ecx
 0043AED9    pop         ebp
 0043AEDA    ret
*}
end;

//0043AEE4
destructor TControl.Destroy;
begin
{*
 0043AEE4    push        ebx
 0043AEE5    push        esi
 0043AEE6    push        edi
 0043AEE7    add         esp,0FFFFFFF0
 0043AEEA    call        @BeforeDestruction
 0043AEEF    mov         ebx,edx
 0043AEF1    mov         edi,eax
 0043AEF3    mov         eax,[005AE584];^Application:TApplication
 0043AEF8    mov         eax,dword ptr [eax]
 0043AEFA    mov         edx,edi
 0043AEFC    call        TApplication.ControlDestroyed
 0043AF01    mov         eax,dword ptr [edi+0A0]
 0043AF07    test        eax,eax
>0043AF09    je          0043AF4A
 0043AF0B    test        byte ptr [eax+1C],8
>0043AF0F    jne         0043AF4A
 0043AF11    push        edi
 0043AF12    xor         ecx,ecx
 0043AF14    mov         edx,0B039
 0043AF19    call        TControl.Perform
 0043AF1E    xor         edx,edx
 0043AF20    mov         eax,edi
 0043AF22    mov         ecx,dword ptr [eax]
 0043AF24    call        dword ptr [ecx+68]
 0043AF27    mov         edx,esp
 0043AF29    mov         eax,edi
 0043AF2B    call        TControl.GetBoundsRect
 0043AF30    mov         ecx,esp
 0043AF32    or          edx,0FFFFFFFF
 0043AF35    mov         eax,edi
 0043AF37    mov         si,0FFCC
 0043AF3B    call        @CallDynaInst
 0043AF40    xor         eax,eax
 0043AF42    mov         dword ptr [edi+0A0],eax
>0043AF48    jmp         0043AF53
 0043AF4A    xor         edx,edx
 0043AF4C    mov         eax,edi
 0043AF4E    mov         ecx,dword ptr [eax]
 0043AF50    call        dword ptr [ecx+68]
 0043AF53    mov         eax,dword ptr [edi+6C]
 0043AF56    call        TObject.Free
 0043AF5B    xor         eax,eax
 0043AF5D    mov         dword ptr [edi+6C],eax
 0043AF60    mov         eax,dword ptr [edi+74]
 0043AF63    call        TObject.Free
 0043AF68    mov         eax,dword ptr [edi+68]
 0043AF6B    call        TObject.Free
 0043AF70    mov         eax,dword ptr [edi+64]
 0043AF73    call        StrDispose
 0043AF78    mov         edx,ebx
 0043AF7A    and         dl,0FC
 0043AF7D    mov         eax,edi
 0043AF7F    call        TComponent.Destroy
 0043AF84    test        bl,bl
>0043AF86    jle         0043AF8F
 0043AF88    mov         eax,edi
 0043AF8A    call        @ClassDestroy
 0043AF8F    add         esp,10
 0043AF92    pop         edi
 0043AF93    pop         esi
 0043AF94    pop         ebx
 0043AF95    ret
*}
end;

//0043AF98
{*function sub_0043AF98:?;
begin
 0043AF98    xor         eax,eax
 0043AF9A    ret
end;*}

//0043AF9C
function TImage.GetEnabled:Boolean;
begin
{*
 0043AF9C    mov         al,byte ptr [eax+58];TImage.FEnabled:Boolean
 0043AF9F    ret
*}
end;

//0043AFA0
procedure TControl.sub_0043AFA0;
begin
{*
 0043AFA0    xor         eax,eax
 0043AFA2    ret
*}
end;

//0043AFA4
procedure TControl.HasParent;
begin
{*
 0043AFA4    cmp         dword ptr [eax+30],0
 0043AFA8    setne       al
 0043AFAB    ret
*}
end;

//0043AFAC
procedure TControl.GetParentComponent;
begin
{*
 0043AFAC    mov         eax,dword ptr [eax+30];TControl.FParent:TWinControl
 0043AFAF    ret
*}
end;

//0043AFB0
procedure TControl.SetParentComponent(Value:TComponent);
begin
{*
 0043AFB0    push        ebx
 0043AFB1    push        esi
 0043AFB2    mov         esi,edx
 0043AFB4    mov         ebx,eax
 0043AFB6    cmp         esi,dword ptr [ebx+30]
>0043AFB9    je          0043AFD5
 0043AFBB    mov         eax,esi
 0043AFBD    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043AFC3    call        @IsClass
 0043AFC8    test        al,al
>0043AFCA    je          0043AFD5
 0043AFCC    mov         edx,esi
 0043AFCE    mov         eax,ebx
 0043AFD0    mov         ecx,dword ptr [eax]
 0043AFD2    call        dword ptr [ecx+68]
 0043AFD5    pop         esi
 0043AFD6    pop         ebx
 0043AFD7    ret
*}
end;

//0043AFD8
procedure TControl.PaletteChanged(Foreground:Boolean);
begin
{*
 0043AFD8    push        ebx
 0043AFD9    push        esi
 0043AFDA    push        edi
 0043AFDB    push        ebp
 0043AFDC    add         esp,0FFFFFFF8
 0043AFDF    mov         byte ptr [esp],dl
 0043AFE2    mov         ebp,eax
 0043AFE4    xor         ebx,ebx
 0043AFE6    cmp         byte ptr [ebp+57],0
>0043AFEA    je          0043B044
 0043AFEC    mov         eax,ebp
 0043AFEE    mov         si,0FFD7
 0043AFF2    call        @CallDynaInst
 0043AFF7    mov         edi,eax
 0043AFF9    test        edi,edi
>0043AFFB    je          0043B044
 0043AFFD    lea         edx,[esp+4]
 0043B001    mov         eax,ebp
 0043B003    mov         ecx,dword ptr [eax]
 0043B005    call        dword ptr [ecx+48]
 0043B008    mov         esi,eax
 0043B00A    mov         al,byte ptr [esp]
 0043B00D    xor         al,1
 0043B00F    neg         al
 0043B011    sbb         eax,eax
 0043B013    push        eax
 0043B014    push        edi
 0043B015    push        esi
 0043B016    call        gdi32.SelectPalette
 0043B01B    mov         edi,eax
 0043B01D    push        esi
 0043B01E    call        gdi32.RealizePalette
 0043B023    test        eax,eax
>0043B025    je          0043B02E
 0043B027    mov         eax,ebp
 0043B029    mov         edx,dword ptr [eax]
 0043B02B    call        dword ptr [edx+7C]
 0043B02E    push        0FF
 0043B030    push        edi
 0043B031    push        esi
 0043B032    call        gdi32.SelectPalette
 0043B037    push        esi
 0043B038    mov         eax,dword ptr [esp+8]
 0043B03C    push        eax
 0043B03D    call        user32.ReleaseDC
 0043B042    mov         bl,1
 0043B044    mov         eax,ebx
 0043B046    pop         ecx
 0043B047    pop         edx
 0043B048    pop         ebp
 0043B049    pop         edi
 0043B04A    pop         esi
 0043B04B    pop         ebx
 0043B04C    ret
*}
end;

//0043B050
function TControl.GetAction:TBasicAction;
begin
{*
 0043B050    mov         edx,dword ptr [eax+6C]
 0043B053    test        edx,edx
>0043B055    je          0043B05B
 0043B057    mov         eax,dword ptr [edx+10]
 0043B05A    ret
 0043B05B    xor         eax,eax
 0043B05D    ret
*}
end;

//0043B060
procedure TControl.SetAnchors(Value:TAnchors);
begin
{*
 0043B060    push        ebx
 0043B061    push        ecx
 0043B062    mov         byte ptr [esp],dl
 0043B065    mov         ebx,eax
 0043B067    mov         al,byte ptr [esp]
 0043B06A    cmp         al,byte ptr [ebx+61]
>0043B06D    je          0043B07C
 0043B06F    mov         al,byte ptr [esp]
 0043B072    mov         byte ptr [ebx+61],al
 0043B075    mov         eax,ebx
 0043B077    call        TControl.UpdateAnchorRules
 0043B07C    pop         edx
 0043B07D    pop         ebx
 0043B07E    ret
*}
end;

//0043B080
procedure TControl.SetAction(Value:TBasicAction);
begin
{*
 0043B080    push        ebx
 0043B081    push        esi
 0043B082    push        edi
 0043B083    mov         edi,edx
 0043B085    mov         ebx,eax
 0043B087    test        edi,edi
>0043B089    jne         0043B0A1
 0043B08B    mov         eax,dword ptr [ebx+6C]
 0043B08E    call        TObject.Free
 0043B093    xor         eax,eax
 0043B095    mov         dword ptr [ebx+6C],eax
 0043B098    and         dword ptr [ebx+50],0FFFF7FFF
>0043B09F    jmp         0043B0F7
 0043B0A1    or          dword ptr [ebx+50],8000
 0043B0A8    cmp         dword ptr [ebx+6C],0
>0043B0AC    jne         0043B0C3
 0043B0AE    mov         eax,ebx
 0043B0B0    mov         si,0FFD9
 0043B0B4    call        @CallDynaInst
 0043B0B9    mov         ecx,ebx
 0043B0BB    mov         dl,1
 0043B0BD    call        dword ptr [eax+14]
 0043B0C0    mov         dword ptr [ebx+6C],eax
 0043B0C3    mov         edx,edi
 0043B0C5    mov         eax,dword ptr [ebx+6C]
 0043B0C8    mov         ecx,dword ptr [eax]
 0043B0CA    call        dword ptr [ecx+0C]
 0043B0CD    mov         eax,dword ptr [ebx+6C]
 0043B0D0    mov         dword ptr [eax+0C],ebx
 0043B0D3    mov         dword ptr [eax+8],43DCC0;TControl.DoActionChange
 0043B0DA    test        byte ptr [edi+1C],1
 0043B0DE    setne       cl
 0043B0E1    mov         edx,edi
 0043B0E3    mov         eax,ebx
 0043B0E5    mov         si,0FFEF
 0043B0E9    call        @CallDynaInst
 0043B0EE    mov         edx,ebx
 0043B0F0    mov         eax,edi
 0043B0F2    call        TComponent.FreeNotification
 0043B0F7    pop         edi
 0043B0F8    pop         esi
 0043B0F9    pop         ebx
 0043B0FA    ret
*}
end;

//0043B0FC
function TControl.IsAnchorsStored(Value:TAnchors):Boolean;
begin
{*
 0043B0FC    push        ebx
 0043B0FD    mov         ebx,eax
 0043B0FF    xor         eax,eax
 0043B101    mov         al,byte ptr [ebx+5B]
 0043B104    mov         al,byte ptr [eax+5ACB70]
 0043B10A    cmp         al,byte ptr [ebx+61]
 0043B10D    setne       al
 0043B110    pop         ebx
 0043B111    ret
*}
end;

//0043B114
procedure TImage.SetDragMode(Value:TDragMode);
begin
{*
 0043B114    mov         byte ptr [eax+5D],dl;TImage.FDragMode:TDragMode
 0043B117    ret
*}
end;

//0043B118
procedure TControl.RequestAlign;
begin
{*
 0043B118    mov         edx,dword ptr [eax+30]
 0043B11B    test        edx,edx
>0043B11D    je          0043B125
 0043B11F    xchg        eax,edx
 0043B120    call        TWinControl.AlignControl
 0043B125    ret
*}
end;

//0043B128
procedure TControl.Resize;
begin
{*
 0043B128    push        ebx
 0043B129    cmp         word ptr [eax+0FA],0
>0043B131    je          0043B143
 0043B133    mov         ebx,eax
 0043B135    mov         edx,eax
 0043B137    mov         eax,dword ptr [ebx+0FC]
 0043B13D    call        dword ptr [ebx+0F8]
 0043B143    pop         ebx
 0043B144    ret
*}
end;

//0043B148
procedure TControl.ReadState(Reader:TReader);
begin
{*
 0043B148    push        ebx
 0043B149    push        esi
 0043B14A    push        edi
 0043B14B    mov         esi,edx
 0043B14D    mov         ebx,eax
 0043B14F    or          word ptr [ebx+54],8
 0043B154    mov         edi,dword ptr [esi+2C]
 0043B157    mov         eax,edi
 0043B159    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043B15F    call        @IsClass
 0043B164    test        al,al
>0043B166    je          0043B171
 0043B168    mov         edx,edi
 0043B16A    mov         eax,ebx
 0043B16C    mov         ecx,dword ptr [eax]
 0043B16E    call        dword ptr [ecx+68]
 0043B171    mov         edx,esi
 0043B173    mov         eax,ebx
 0043B175    call        TComponent.ReadState
 0043B17A    and         word ptr [ebx+54],0FFFFFFF7
 0043B17F    cmp         dword ptr [ebx+30],0
>0043B183    je          0043B1D5
 0043B185    push        0
 0043B187    xor         ecx,ecx
 0043B189    mov         edx,0B009
 0043B18E    mov         eax,ebx
 0043B190    call        TControl.Perform
 0043B195    push        0
 0043B197    xor         ecx,ecx
 0043B199    mov         edx,0B008
 0043B19E    mov         eax,ebx
 0043B1A0    call        TControl.Perform
 0043B1A5    push        0
 0043B1A7    xor         ecx,ecx
 0043B1A9    mov         edx,0B023
 0043B1AE    mov         eax,ebx
 0043B1B0    call        TControl.Perform
 0043B1B5    push        0
 0043B1B7    xor         ecx,ecx
 0043B1B9    mov         edx,0B035
 0043B1BE    mov         eax,ebx
 0043B1C0    call        TControl.Perform
 0043B1C5    push        0
 0043B1C7    xor         ecx,ecx
 0043B1C9    mov         edx,0B03D
 0043B1CE    mov         eax,ebx
 0043B1D0    call        TControl.Perform
 0043B1D5    pop         edi
 0043B1D6    pop         esi
 0043B1D7    pop         ebx
 0043B1D8    ret
*}
end;

//0043B1DC
procedure TControl.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0043B1DC    push        ebx
 0043B1DD    push        esi
 0043B1DE    push        edi
 0043B1DF    mov         ebx,ecx
 0043B1E1    mov         edi,edx
 0043B1E3    mov         esi,eax
 0043B1E5    mov         ecx,ebx
 0043B1E7    mov         edx,edi
 0043B1E9    mov         eax,esi
 0043B1EB    call        TComponent.Notification
 0043B1F0    cmp         bl,1
>0043B1F3    jne         0043B219
 0043B1F5    cmp         edi,dword ptr [esi+7C]
>0043B1F8    jne         0043B205
 0043B1FA    xor         edx,edx
 0043B1FC    mov         eax,esi
 0043B1FE    call        TControl.SetPopupMenu
>0043B203    jmp         0043B219
 0043B205    mov         eax,esi
 0043B207    mov         edx,dword ptr [eax]
 0043B209    call        dword ptr [edx+3C]
 0043B20C    cmp         edi,eax
>0043B20E    jne         0043B219
 0043B210    xor         edx,edx
 0043B212    mov         eax,esi
 0043B214    call        TControl.SetAction
 0043B219    pop         edi
 0043B21A    pop         esi
 0043B21B    pop         ebx
 0043B21C    ret
*}
end;

//0043B220
procedure TControl.SetAlign(Value:TAlign);
begin
{*
 0043B220    push        ebx
 0043B221    push        esi
 0043B222    push        edi
 0043B223    push        ecx
 0043B224    mov         ebx,edx
 0043B226    mov         edi,eax
 0043B228    mov         al,byte ptr [edi+5B]
 0043B22B    cmp         bl,al
>0043B22D    je          0043B2B8
 0043B233    mov         byte ptr [esp],al
 0043B236    mov         byte ptr [edi+5B],bl
 0043B239    xor         eax,eax
 0043B23B    mov         al,bl
 0043B23D    mov         dl,byte ptr [eax+5ACB70]
 0043B243    mov         eax,edi
 0043B245    call        TControl.SetAnchors
 0043B24A    test        byte ptr [edi+1C],1
>0043B24E    jne         0043B2B8
 0043B250    test        byte ptr [edi+1C],10
>0043B254    je          0043B25C
 0043B256    cmp         dword ptr [edi+30],0
>0043B25A    je          0043B2B8
 0043B25C    cmp         bl,6
>0043B25F    je          0043B2B8
 0043B261    cmp         byte ptr [esp],6
>0043B265    je          0043B2B8
 0043B267    mov         al,byte ptr [esp]
 0043B26A    dec         eax
 0043B26B    sub         al,2
 0043B26D    setb        al
 0043B270    mov         edx,ebx
 0043B272    add         dl,0FD
 0043B275    sub         dl,2
 0043B278    setb        dl
 0043B27B    cmp         al,dl
>0043B27D    jne         0043B2AD
 0043B27F    mov         al,byte ptr [esp]
 0043B282    test        al,al
>0043B284    je          0043B2AD
 0043B286    sub         al,5
>0043B288    je          0043B2AD
 0043B28A    test        bl,bl
>0043B28C    je          0043B2AD
 0043B28E    sub         bl,5
>0043B291    je          0043B2AD
 0043B293    mov         eax,dword ptr [edi+4C]
 0043B296    push        eax
 0043B297    mov         eax,dword ptr [edi+48]
 0043B29A    push        eax
 0043B29B    mov         ecx,dword ptr [edi+44]
 0043B29E    mov         edx,dword ptr [edi+40]
 0043B2A1    mov         eax,edi
 0043B2A3    mov         ebx,dword ptr [eax]
 0043B2A5    call        dword ptr [ebx+84]
>0043B2AB    jmp         0043B2B8
 0043B2AD    mov         eax,edi
 0043B2AF    mov         si,0FFEE
 0043B2B3    call        @CallDynaInst
 0043B2B8    mov         eax,edi
 0043B2BA    mov         si,0FFD0
 0043B2BE    call        @CallDynaInst
 0043B2C3    pop         edx
 0043B2C4    pop         edi
 0043B2C5    pop         esi
 0043B2C6    pop         ebx
 0043B2C7    ret
*}
end;

//0043B2C8
procedure TControl.SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);
begin
{*
 0043B2C8    push        ebp
 0043B2C9    mov         ebp,esp
 0043B2CB    push        ebx
 0043B2CC    push        esi
 0043B2CD    push        edi
 0043B2CE    mov         edi,ecx
 0043B2D0    mov         esi,edx
 0043B2D2    mov         ebx,eax
 0043B2D4    lea         ecx,[ebp+8]
 0043B2D7    lea         edx,[ebp+0C]
 0043B2DA    mov         eax,ebx
 0043B2DC    call        TControl.CheckNewSize
 0043B2E1    test        al,al
>0043B2E3    je          0043B357
 0043B2E5    cmp         esi,dword ptr [ebx+40]
>0043B2E8    jne         0043B2FF
 0043B2EA    cmp         edi,dword ptr [ebx+44]
>0043B2ED    jne         0043B2FF
 0043B2EF    mov         eax,dword ptr [ebp+0C]
 0043B2F2    cmp         eax,dword ptr [ebx+48]
>0043B2F5    jne         0043B2FF
 0043B2F7    mov         eax,dword ptr [ebp+8]
 0043B2FA    cmp         eax,dword ptr [ebx+4C]
>0043B2FD    je          0043B357
 0043B2FF    xor         ecx,ecx
 0043B301    mov         dl,byte ptr [ebx+57]
 0043B304    mov         eax,ebx
 0043B306    call        TControl.InvalidateControl
 0043B30B    mov         dword ptr [ebx+40],esi
 0043B30E    mov         dword ptr [ebx+44],edi
 0043B311    mov         eax,dword ptr [ebp+0C]
 0043B314    mov         dword ptr [ebx+48],eax
 0043B317    mov         eax,dword ptr [ebp+8]
 0043B31A    mov         dword ptr [ebx+4C],eax
 0043B31D    mov         eax,ebx
 0043B31F    call        TControl.UpdateAnchorRules
 0043B324    mov         eax,ebx
 0043B326    mov         edx,dword ptr [eax]
 0043B328    call        dword ptr [edx+7C]
 0043B32B    push        0
 0043B32D    xor         ecx,ecx
 0043B32F    mov         edx,47
 0043B334    mov         eax,ebx
 0043B336    call        TControl.Perform
 0043B33B    mov         eax,ebx
 0043B33D    mov         si,0FFD0
 0043B341    call        @CallDynaInst
 0043B346    test        byte ptr [ebx+1C],1
>0043B34A    jne         0043B357
 0043B34C    mov         eax,ebx
 0043B34E    mov         si,0FFCF
 0043B352    call        @CallDynaInst
 0043B357    pop         edi
 0043B358    pop         esi
 0043B359    pop         ebx
 0043B35A    pop         ebp
 0043B35B    ret         8
*}
end;

//0043B360
procedure TControl.UpdateAnchorRules;
begin
{*
 0043B360    push        ebx
 0043B361    push        esi
 0043B362    add         esp,0FFFFFFF0
 0043B365    mov         esi,eax
 0043B367    cmp         byte ptr [esi+62],0
>0043B36B    jne         0043B472
 0043B371    test        byte ptr [esi+1C],1
>0043B375    jne         0043B472
 0043B37B    mov         bl,byte ptr [esi+61]
 0043B37E    mov         al,[0043B478]
 0043B383    cmp         al,bl
>0043B385    jne         0043B39C
 0043B387    xor         eax,eax
 0043B389    mov         dword ptr [esi+90],eax
 0043B38F    xor         eax,eax
 0043B391    mov         dword ptr [esi+94],eax
>0043B397    jmp         0043B472
 0043B39C    test        bl,4
>0043B39F    je          0043B3BC
 0043B3A1    test        bl,1
>0043B3A4    je          0043B3B1
 0043B3A6    mov         eax,dword ptr [esi+48]
 0043B3A9    mov         dword ptr [esi+88],eax
>0043B3AF    jmp         0043B3CF
 0043B3B1    mov         eax,dword ptr [esi+40]
 0043B3B4    mov         dword ptr [esi+88],eax
>0043B3BA    jmp         0043B3CF
 0043B3BC    mov         eax,dword ptr [esi+48]
 0043B3BF    sar         eax,1
>0043B3C1    jns         0043B3C6
 0043B3C3    adc         eax,0
 0043B3C6    add         eax,dword ptr [esi+40]
 0043B3C9    mov         dword ptr [esi+88],eax
 0043B3CF    test        bl,8
>0043B3D2    je          0043B3EF
 0043B3D4    test        bl,2
>0043B3D7    je          0043B3E4
 0043B3D9    mov         eax,dword ptr [esi+4C]
 0043B3DC    mov         dword ptr [esi+8C],eax
>0043B3E2    jmp         0043B402
 0043B3E4    mov         eax,dword ptr [esi+44]
 0043B3E7    mov         dword ptr [esi+8C],eax
>0043B3ED    jmp         0043B402
 0043B3EF    mov         eax,dword ptr [esi+4C]
 0043B3F2    sar         eax,1
>0043B3F4    jns         0043B3F9
 0043B3F6    adc         eax,0
 0043B3F9    add         eax,dword ptr [esi+44]
 0043B3FC    mov         dword ptr [esi+8C],eax
 0043B402    mov         ebx,dword ptr [esi+30]
 0043B405    test        ebx,ebx
>0043B407    je          0043B472
 0043B409    test        byte ptr [ebx+1C],2
>0043B40D    je          0043B42F
 0043B40F    test        byte ptr [esi+1C],10
>0043B413    jne         0043B472
 0043B415    mov         eax,dword ptr [ebx+1FA]
 0043B41B    mov         dword ptr [esi+90],eax
 0043B421    mov         eax,dword ptr [ebx+1FE]
 0043B427    mov         dword ptr [esi+94],eax
>0043B42D    jmp         0043B472
 0043B42F    mov         eax,ebx
 0043B431    call        TWinControl.HandleAllocated
 0043B436    test        al,al
>0043B438    je          0043B45A
 0043B43A    mov         edx,esp
 0043B43C    mov         eax,dword ptr [esi+30]
 0043B43F    mov         ecx,dword ptr [eax]
 0043B441    call        dword ptr [ecx+44]
 0043B444    mov         eax,dword ptr [esp+8]
 0043B448    mov         dword ptr [esi+90],eax
 0043B44E    mov         eax,dword ptr [esp+0C]
 0043B452    mov         dword ptr [esi+94],eax
>0043B458    jmp         0043B472
 0043B45A    mov         eax,dword ptr [esi+30]
 0043B45D    mov         eax,dword ptr [eax+48]
 0043B460    mov         dword ptr [esi+90],eax
 0043B466    mov         eax,dword ptr [esi+30]
 0043B469    mov         eax,dword ptr [eax+4C]
 0043B46C    mov         dword ptr [esi+94],eax
 0043B472    add         esp,10
 0043B475    pop         esi
 0043B476    pop         ebx
 0043B477    ret
*}
end;

//0043B47C
procedure TControl.SetLeft(Value:Integer);
begin
{*
 0043B47C    push        ebx
 0043B47D    push        esi
 0043B47E    mov         esi,eax
 0043B480    mov         eax,dword ptr [esi+48]
 0043B483    push        eax
 0043B484    mov         eax,dword ptr [esi+4C]
 0043B487    push        eax
 0043B488    mov         ecx,dword ptr [esi+44]
 0043B48B    mov         eax,esi
 0043B48D    mov         ebx,dword ptr [eax]
 0043B48F    call        dword ptr [ebx+84]
 0043B495    or          byte ptr [esi+98],1
 0043B49C    pop         esi
 0043B49D    pop         ebx
 0043B49E    ret
*}
end;

//0043B4A0
procedure TControl.SetTop(Value:Integer);
begin
{*
 0043B4A0    push        ebx
 0043B4A1    push        esi
 0043B4A2    mov         esi,eax
 0043B4A4    mov         eax,dword ptr [esi+48]
 0043B4A7    push        eax
 0043B4A8    mov         eax,dword ptr [esi+4C]
 0043B4AB    push        eax
 0043B4AC    mov         ecx,edx
 0043B4AE    mov         eax,esi
 0043B4B0    mov         edx,dword ptr [esi+40]
 0043B4B3    mov         ebx,dword ptr [eax]
 0043B4B5    call        dword ptr [ebx+84]
 0043B4BB    or          byte ptr [esi+98],2
 0043B4C2    pop         esi
 0043B4C3    pop         ebx
 0043B4C4    ret
*}
end;

//0043B4C8
procedure TControl.SetWidth(Value:Integer);
begin
{*
 0043B4C8    push        ebx
 0043B4C9    push        esi
 0043B4CA    mov         esi,eax
 0043B4CC    push        edx
 0043B4CD    mov         eax,dword ptr [esi+4C]
 0043B4D0    push        eax
 0043B4D1    mov         ecx,dword ptr [esi+44]
 0043B4D4    mov         eax,esi
 0043B4D6    mov         edx,dword ptr [esi+40]
 0043B4D9    mov         ebx,dword ptr [eax]
 0043B4DB    call        dword ptr [ebx+84]
 0043B4E1    or          byte ptr [esi+98],4
 0043B4E8    pop         esi
 0043B4E9    pop         ebx
 0043B4EA    ret
*}
end;

//0043B4EC
procedure TControl.SetHeight(Value:Integer);
begin
{*
 0043B4EC    push        ebx
 0043B4ED    push        esi
 0043B4EE    mov         esi,eax
 0043B4F0    mov         eax,dword ptr [esi+48]
 0043B4F3    push        eax
 0043B4F4    push        edx
 0043B4F5    mov         ecx,dword ptr [esi+44]
 0043B4F8    mov         eax,esi
 0043B4FA    mov         edx,dword ptr [esi+40]
 0043B4FD    mov         ebx,dword ptr [eax]
 0043B4FF    call        dword ptr [ebx+84]
 0043B505    or          byte ptr [esi+98],8
 0043B50C    pop         esi
 0043B50D    pop         ebx
 0043B50E    ret
*}
end;

//0043B510
procedure TControl.Dock(NewDockSite:TWinControl; ARect:TRect);
begin
{*
 0043B510    push        ebp
 0043B511    mov         ebp,esp
 0043B513    add         esp,0FFFFFFEC
 0043B516    push        ebx
 0043B517    push        esi
 0043B518    push        edi
 0043B519    mov         esi,ecx
 0043B51B    lea         edi,[ebp-14]
 0043B51E    movs        dword ptr [edi],dword ptr [esi]
 0043B51F    movs        dword ptr [edi],dword ptr [esi]
 0043B520    movs        dword ptr [edi],dword ptr [esi]
 0043B521    movs        dword ptr [edi],dword ptr [esi]
 0043B522    mov         ebx,edx
 0043B524    mov         dword ptr [ebp-4],eax
 0043B527    mov         eax,dword ptr [ebp-4]
 0043B52A    cmp         ebx,dword ptr [eax+0A0]
>0043B530    je          0043B576
 0043B532    mov         eax,dword ptr [ebp-4]
 0043B535    mov         eax,dword ptr [eax+0A0]
 0043B53B    test        eax,eax
>0043B53D    je          0043B556
 0043B53F    cmp         dword ptr [eax+178],0
>0043B546    je          0043B556
 0043B548    mov         eax,dword ptr [eax+178]
 0043B54E    mov         edx,dword ptr [ebp-4]
 0043B551    call        TList.Remove
 0043B556    test        ebx,ebx
>0043B558    je          0043B576
 0043B55A    cmp         ebx,0FFFFFFFF
>0043B55D    je          0043B576
 0043B55F    cmp         dword ptr [ebx+178],0
>0043B566    je          0043B576
 0043B568    mov         eax,dword ptr [ebx+178]
 0043B56E    mov         edx,dword ptr [ebp-4]
 0043B571    call        TList.Add
 0043B576    mov         eax,dword ptr [ebp-4]
 0043B579    or          word ptr [eax+54],400
 0043B57F    xor         edx,edx
 0043B581    push        ebp
 0043B582    push        43B60B
 0043B587    push        dword ptr fs:[edx]
 0043B58A    mov         dword ptr fs:[edx],esp
 0043B58D    cmp         ebx,0FFFFFFFF
>0043B590    je          0043B5A3
 0043B592    lea         ecx,[ebp-14]
 0043B595    mov         edx,ebx
 0043B597    mov         eax,dword ptr [ebp-4]
 0043B59A    mov         si,0FFE4
 0043B59E    call        @CallDynaInst
 0043B5A3    mov         eax,dword ptr [ebp-4]
 0043B5A6    mov         eax,dword ptr [eax+0A0]
 0043B5AC    cmp         ebx,eax
>0043B5AE    je          0043B5F4
 0043B5B0    mov         edi,eax
 0043B5B2    cmp         ebx,0FFFFFFFF
>0043B5B5    je          0043B5D7
 0043B5B7    mov         eax,dword ptr [ebp-4]
 0043B5BA    mov         dword ptr [eax+0A0],ebx
 0043B5C0    test        ebx,ebx
>0043B5C2    je          0043B5E2
 0043B5C4    lea         ecx,[ebp-14]
 0043B5C7    mov         edx,dword ptr [ebp-4]
 0043B5CA    mov         eax,ebx
 0043B5CC    mov         si,0FFC5
 0043B5D0    call        @CallDynaInst
>0043B5D5    jmp         0043B5E2
 0043B5D7    mov         eax,dword ptr [ebp-4]
 0043B5DA    xor         edx,edx
 0043B5DC    mov         dword ptr [eax+0A0],edx
 0043B5E2    test        edi,edi
>0043B5E4    je          0043B5F4
 0043B5E6    mov         edx,dword ptr [ebp-4]
 0043B5E9    mov         eax,edi
 0043B5EB    mov         si,0FFBF
 0043B5EF    call        @CallDynaInst
 0043B5F4    xor         eax,eax
 0043B5F6    pop         edx
 0043B5F7    pop         ecx
 0043B5F8    pop         ecx
 0043B5F9    mov         dword ptr fs:[eax],edx
 0043B5FC    push        43B612
 0043B601    mov         eax,dword ptr [ebp-4]
 0043B604    and         word ptr [eax+54],0FBFF
 0043B60A    ret
>0043B60B    jmp         @HandleFinally
>0043B610    jmp         0043B601
 0043B612    pop         edi
 0043B613    pop         esi
 0043B614    pop         ebx
 0043B615    mov         esp,ebp
 0043B617    pop         ebp
 0043B618    ret
*}
end;

//0043B61C
procedure TControl.DoDock(NewDockSite:TWinControl; var ARect:TRect);
begin
{*
 0043B61C    push        ebx
 0043B61D    push        esi
 0043B61E    push        edi
 0043B61F    mov         edi,ecx
 0043B621    mov         esi,edx
 0043B623    mov         ebx,eax
 0043B625    mov         eax,ebx
 0043B627    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043B62D    call        @IsClass
 0043B632    test        al,al
>0043B634    jne         0043B642
 0043B636    xor         ecx,ecx
 0043B638    mov         dl,byte ptr [ebx+57]
 0043B63B    mov         eax,ebx
 0043B63D    call        TControl.InvalidateControl
 0043B642    cmp         esi,dword ptr [ebx+30]
>0043B645    je          0043B652
 0043B647    mov         edx,edi
 0043B649    mov         eax,ebx
 0043B64B    call        TControl.UpdateBoundsRect
>0043B650    jmp         0043B65B
 0043B652    mov         edx,edi
 0043B654    mov         eax,ebx
 0043B656    call        TControl.SetBoundsRect
 0043B65B    test        esi,esi
>0043B65D    je          0043B664
 0043B65F    cmp         esi,0FFFFFFFF
>0043B662    jne         0043B66D
 0043B664    xor         edx,edx
 0043B666    mov         eax,ebx
 0043B668    mov         ecx,dword ptr [eax]
 0043B66A    call        dword ptr [ecx+68]
 0043B66D    pop         edi
 0043B66E    pop         esi
 0043B66F    pop         ebx
 0043B670    ret
*}
end;

//0043B674
procedure TControl.SetHelpContext(const Value:THelpContext);
begin
{*
 0043B674    test        byte ptr [eax+1C],1
>0043B678    jne         0043B681
 0043B67A    mov         byte ptr [eax+150],1
 0043B681    mov         dword ptr [eax+158],edx
 0043B687    ret
*}
end;

//0043B688
procedure TControl.SetHelpKeyword(const Value:AnsiString);
begin
{*
 0043B688    push        ebx
 0043B689    push        esi
 0043B68A    mov         esi,edx
 0043B68C    mov         ebx,eax
 0043B68E    test        byte ptr [ebx+1C],1
>0043B692    jne         0043B69B
 0043B694    mov         byte ptr [ebx+150],0
 0043B69B    lea         eax,[ebx+154]
 0043B6A1    mov         edx,esi
 0043B6A3    call        @LStrAsg
 0043B6A8    pop         esi
 0043B6A9    pop         ebx
 0043B6AA    ret
*}
end;

//0043B6AC
function TControl.GetBoundsRect:TRect;
begin
{*
 0043B6AC    mov         ecx,dword ptr [eax+40]
 0043B6AF    mov         dword ptr [edx],ecx
 0043B6B1    mov         ecx,dword ptr [eax+44]
 0043B6B4    mov         dword ptr [edx+4],ecx
 0043B6B7    mov         ecx,dword ptr [eax+40]
 0043B6BA    add         ecx,dword ptr [eax+48]
 0043B6BD    mov         dword ptr [edx+8],ecx
 0043B6C0    mov         ecx,dword ptr [eax+44]
 0043B6C3    add         ecx,dword ptr [eax+4C]
 0043B6C6    mov         dword ptr [edx+0C],ecx
 0043B6C9    ret
*}
end;

//0043B6CC
procedure TControl.SetBoundsRect(const Rect:TRect);
begin
{*
 0043B6CC    push        ebx
 0043B6CD    push        esi
 0043B6CE    push        edi
 0043B6CF    push        ebp
 0043B6D0    mov         esi,eax
 0043B6D2    mov         eax,dword ptr [edx+8]
 0043B6D5    mov         edi,dword ptr [edx]
 0043B6D7    sub         eax,edi
 0043B6D9    push        eax
 0043B6DA    mov         eax,dword ptr [edx+0C]
 0043B6DD    mov         ebp,dword ptr [edx+4]
 0043B6E0    sub         eax,ebp
 0043B6E2    push        eax
 0043B6E3    mov         ecx,ebp
 0043B6E5    mov         edx,edi
 0043B6E7    mov         eax,esi
 0043B6E9    mov         ebx,dword ptr [eax]
 0043B6EB    call        dword ptr [ebx+84]
 0043B6F1    pop         ebp
 0043B6F2    pop         edi
 0043B6F3    pop         esi
 0043B6F4    pop         ebx
 0043B6F5    ret
*}
end;

//0043B6F8
function TControl.GetClientRect:TRect;
begin
{*
 0043B6F8    xor         ecx,ecx
 0043B6FA    mov         dword ptr [edx],ecx
 0043B6FC    xor         ecx,ecx
 0043B6FE    mov         dword ptr [edx+4],ecx
 0043B701    mov         ecx,dword ptr [eax+48]
 0043B704    mov         dword ptr [edx+8],ecx
 0043B707    mov         eax,dword ptr [eax+4C]
 0043B70A    mov         dword ptr [edx+0C],eax
 0043B70D    ret
*}
end;

//0043B710
function TControl.GetClientWidth:Integer;
begin
{*
 0043B710    push        ebx
 0043B711    add         esp,0FFFFFFF0
 0043B714    mov         ebx,eax
 0043B716    mov         edx,esp
 0043B718    mov         eax,ebx
 0043B71A    mov         ecx,dword ptr [eax]
 0043B71C    call        dword ptr [ecx+44]
 0043B71F    mov         eax,dword ptr [esp+8]
 0043B723    add         esp,10
 0043B726    pop         ebx
 0043B727    ret
*}
end;

//0043B728
procedure TControl.SetClientWidth(Value:Integer);
begin
{*
 0043B728    push        ebx
 0043B729    push        esi
 0043B72A    add         esp,0FFFFFFF8
 0043B72D    mov         esi,edx
 0043B72F    mov         ebx,eax
 0043B731    mov         eax,ebx
 0043B733    call        TControl.GetClientHeight
 0043B738    mov         edx,eax
 0043B73A    mov         ecx,esp
 0043B73C    mov         eax,esi
 0043B73E    call        Point
 0043B743    mov         edx,esp
 0043B745    mov         eax,ebx
 0043B747    call        TControl.SetClientSize
 0043B74C    pop         ecx
 0043B74D    pop         edx
 0043B74E    pop         esi
 0043B74F    pop         ebx
 0043B750    ret
*}
end;

//0043B754
function TControl.GetClientHeight:Integer;
begin
{*
 0043B754    push        ebx
 0043B755    add         esp,0FFFFFFF0
 0043B758    mov         ebx,eax
 0043B75A    mov         edx,esp
 0043B75C    mov         eax,ebx
 0043B75E    mov         ecx,dword ptr [eax]
 0043B760    call        dword ptr [ecx+44]
 0043B763    mov         eax,dword ptr [esp+0C]
 0043B767    add         esp,10
 0043B76A    pop         ebx
 0043B76B    ret
*}
end;

//0043B76C
procedure TControl.SetClientHeight(Value:Integer);
begin
{*
 0043B76C    push        ebx
 0043B76D    push        esi
 0043B76E    add         esp,0FFFFFFF8
 0043B771    mov         esi,edx
 0043B773    mov         ebx,eax
 0043B775    mov         eax,ebx
 0043B777    call        TControl.GetClientWidth
 0043B77C    mov         ecx,esp
 0043B77E    mov         edx,esi
 0043B780    call        Point
 0043B785    mov         edx,esp
 0043B787    mov         eax,ebx
 0043B789    call        TControl.SetClientSize
 0043B78E    pop         ecx
 0043B78F    pop         edx
 0043B790    pop         esi
 0043B791    pop         ebx
 0043B792    ret
*}
end;

//0043B794
{*procedure sub_0043B794(?:?);
begin
 0043B794    push        ebp
 0043B795    mov         ebp,esp
 0043B797    add         esp,0FFFFFFF4
 0043B79A    push        ebx
 0043B79B    push        esi
 0043B79C    xor         ecx,ecx
 0043B79E    mov         dword ptr [ebp-0C],ecx
 0043B7A1    mov         esi,edx
 0043B7A3    mov         ebx,eax
 0043B7A5    xor         eax,eax
 0043B7A7    push        ebp
 0043B7A8    push        43B815
 0043B7AD    push        dword ptr fs:[eax]
 0043B7B0    mov         dword ptr fs:[eax],esp
 0043B7B3    cmp         dword ptr [ebx+30],0;TControl.FParent:TWinControl
>0043B7B7    jne         0043B7EA
 0043B7B9    mov         eax,dword ptr [ebx+8];TControl.Name:TComponentName
 0043B7BC    mov         dword ptr [ebp-8],eax
 0043B7BF    mov         byte ptr [ebp-4],0B
 0043B7C3    lea         eax,[ebp-8]
 0043B7C6    push        eax
 0043B7C7    push        0
 0043B7C9    lea         edx,[ebp-0C]
 0043B7CC    mov         eax,[005AE604];^SParentRequired:TResStringRec
 0043B7D1    call        LoadStr
 0043B7D6    mov         ecx,dword ptr [ebp-0C]
 0043B7D9    mov         dl,1
 0043B7DB    mov         eax,[00417C8C];EInvalidOperation
 0043B7E0    call        Exception.CreateFmt;EInvalidOperation.Create
 0043B7E5    call        @RaiseExcept
 0043B7EA    mov         edx,esi
 0043B7EC    mov         eax,dword ptr [ebx+30];TControl.FParent:TWinControl
 0043B7EF    mov         ecx,dword ptr [eax]
 0043B7F1    call        dword ptr [ecx+40];TWinControl.GetClientOrigin
 0043B7F4    mov         eax,dword ptr [ebx+40];TControl.Left:Integer
 0043B7F7    add         dword ptr [esi],eax
 0043B7F9    mov         eax,dword ptr [ebx+44];TControl.Top:Integer
 0043B7FC    add         dword ptr [esi+4],eax
 0043B7FF    xor         eax,eax
 0043B801    pop         edx
 0043B802    pop         ecx
 0043B803    pop         ecx
 0043B804    mov         dword ptr fs:[eax],edx
 0043B807    push        43B81C
 0043B80C    lea         eax,[ebp-0C]
 0043B80F    call        @LStrClr
 0043B814    ret
>0043B815    jmp         @HandleFinally
>0043B81A    jmp         0043B80C
 0043B81C    pop         esi
 0043B81D    pop         ebx
 0043B81E    mov         esp,ebp
 0043B820    pop         ebp
 0043B821    ret
end;*}

//0043B824
function TControl.ClientToScreen(const Point:TPoint):TPoint;
begin
{*
 0043B824    push        ebx
 0043B825    push        esi
 0043B826    push        edi
 0043B827    add         esp,0FFFFFFF8
 0043B82A    mov         edi,ecx
 0043B82C    mov         esi,edx
 0043B82E    mov         ebx,eax
 0043B830    mov         edx,esp
 0043B832    mov         eax,ebx
 0043B834    mov         ecx,dword ptr [eax]
 0043B836    call        dword ptr [ecx+40]
 0043B839    mov         eax,dword ptr [esi]
 0043B83B    add         eax,dword ptr [esp]
 0043B83E    mov         dword ptr [edi],eax
 0043B840    mov         eax,dword ptr [esi+4]
 0043B843    add         eax,dword ptr [esp+4]
 0043B847    mov         dword ptr [edi+4],eax
 0043B84A    pop         ecx
 0043B84B    pop         edx
 0043B84C    pop         edi
 0043B84D    pop         esi
 0043B84E    pop         ebx
 0043B84F    ret
*}
end;

//0043B850
function TControl.ScreenToClient(const Point:TPoint):TPoint;
begin
{*
 0043B850    push        ebx
 0043B851    push        esi
 0043B852    push        edi
 0043B853    add         esp,0FFFFFFF8
 0043B856    mov         edi,ecx
 0043B858    mov         esi,edx
 0043B85A    mov         ebx,eax
 0043B85C    mov         edx,esp
 0043B85E    mov         eax,ebx
 0043B860    mov         ecx,dword ptr [eax]
 0043B862    call        dword ptr [ecx+40]
 0043B865    mov         eax,dword ptr [esi]
 0043B867    sub         eax,dword ptr [esp]
 0043B86A    mov         dword ptr [edi],eax
 0043B86C    mov         eax,dword ptr [esi+4]
 0043B86F    sub         eax,dword ptr [esp+4]
 0043B873    mov         dword ptr [edi+4],eax
 0043B876    pop         ecx
 0043B877    pop         edx
 0043B878    pop         edi
 0043B879    pop         esi
 0043B87A    pop         ebx
 0043B87B    ret
*}
end;

//0043B87C
procedure TControl.SendCancelMode(Sender:TControl);
begin
{*
 0043B87C    push        ebx
 0043B87D    push        esi
 0043B87E    mov         esi,edx
 0043B880    mov         ebx,eax
 0043B882    test        ebx,ebx
>0043B884    je          0043B8A7
 0043B886    mov         eax,ebx
 0043B888    mov         edx,dword ptr ds:[450CFC];TCustomForm
 0043B88E    call        @IsClass
 0043B893    test        al,al
>0043B895    je          0043B8A0
 0043B897    mov         edx,esi
 0043B899    mov         eax,ebx
 0043B89B    call        TCustomForm.SendCancelMode
 0043B8A0    mov         ebx,dword ptr [ebx+30]
 0043B8A3    test        ebx,ebx
>0043B8A5    jne         0043B886
 0043B8A7    pop         esi
 0043B8A8    pop         ebx
 0043B8A9    ret
*}
end;

//0043B8AC
procedure TControl.SendDockNotification(Msg:Cardinal; WParam:Integer; LParam:Integer);
begin
{*
 0043B8AC    push        ebp
 0043B8AD    mov         ebp,esp
 0043B8AF    add         esp,0FFFFFFF0
 0043B8B2    push        ebx
 0043B8B3    push        esi
 0043B8B4    push        edi
 0043B8B5    mov         dword ptr [ebp-4],ecx
 0043B8B8    mov         edi,edx
 0043B8BA    mov         ebx,eax
 0043B8BC    mov         esi,dword ptr [ebx+0A0]
 0043B8C2    test        esi,esi
>0043B8C4    je          0043B906
 0043B8C6    cmp         dword ptr ds:[5E0C2C],0
>0043B8CD    jne         0043B906
 0043B8CF    mov         ax,[0043B910]
 0043B8D5    and         ax,word ptr [ebx+1C]
 0043B8D9    mov         dx,word ptr ds:[43B914]
 0043B8E0    cmp         dx,ax
>0043B8E3    jne         0043B906
 0043B8E5    mov         dword ptr [ebp-10],edi
 0043B8E8    mov         eax,dword ptr [ebp-4]
 0043B8EB    mov         dword ptr [ebp-0C],eax
 0043B8EE    mov         eax,dword ptr [ebp+8]
 0043B8F1    mov         dword ptr [ebp-8],eax
 0043B8F4    lea         eax,[ebp-10]
 0043B8F7    push        eax
 0043B8F8    mov         ecx,ebx
 0043B8FA    mov         edx,0B042
 0043B8FF    mov         eax,esi
 0043B901    call        TControl.Perform
 0043B906    pop         edi
 0043B907    pop         esi
 0043B908    pop         ebx
 0043B909    mov         esp,ebp
 0043B90B    pop         ebp
 0043B90C    ret         4
*}
end;

//0043B918
procedure TControl.ChangeScale(M:Integer; D:Integer);
begin
{*
 0043B918    push        ebx
 0043B919    push        esi
 0043B91A    push        edi
 0043B91B    push        ebp
 0043B91C    add         esp,0FFFFFFF0
 0043B91F    mov         dword ptr [esp],ecx
 0043B922    mov         edi,edx
 0043B924    mov         esi,eax
 0043B926    cmp         edi,dword ptr [esp]
>0043B929    je          0043BAA6
 0043B92F    test        byte ptr [esi+1C],1
>0043B933    je          0043B93D
 0043B935    mov         bl,byte ptr [esi+98]
>0043B93B    jmp         0043B943
 0043B93D    mov         bl,byte ptr ds:[43BABC]
 0043B943    test        bl,1
>0043B946    je          0043B95A
 0043B948    mov         eax,dword ptr [esp]
 0043B94B    push        eax
 0043B94C    push        edi
 0043B94D    mov         eax,dword ptr [esi+40]
 0043B950    push        eax
 0043B951    call        KERNEL32.MulDiv
 0043B956    mov         ebp,eax
>0043B958    jmp         0043B95D
 0043B95A    mov         ebp,dword ptr [esi+40]
 0043B95D    test        bl,2
>0043B960    je          0043B976
 0043B962    mov         eax,dword ptr [esp]
 0043B965    push        eax
 0043B966    push        edi
 0043B967    mov         eax,dword ptr [esi+44]
 0043B96A    push        eax
 0043B96B    call        KERNEL32.MulDiv
 0043B970    mov         dword ptr [esp+4],eax
>0043B974    jmp         0043B97D
 0043B976    mov         eax,dword ptr [esi+44]
 0043B979    mov         dword ptr [esp+4],eax
 0043B97D    test        bl,4
>0043B980    je          0043B9BA
 0043B982    test        byte ptr [esi+51],1
>0043B986    jne         0043B9BA
 0043B988    test        bl,1
>0043B98B    je          0043B9A6
 0043B98D    mov         eax,dword ptr [esp]
 0043B990    push        eax
 0043B991    push        edi
 0043B992    mov         eax,dword ptr [esi+40]
 0043B995    add         eax,dword ptr [esi+48]
 0043B998    push        eax
 0043B999    call        KERNEL32.MulDiv
 0043B99E    sub         eax,ebp
 0043B9A0    mov         dword ptr [esp+8],eax
>0043B9A4    jmp         0043B9C1
 0043B9A6    mov         eax,dword ptr [esp]
 0043B9A9    push        eax
 0043B9AA    push        edi
 0043B9AB    mov         eax,dword ptr [esi+48]
 0043B9AE    push        eax
 0043B9AF    call        KERNEL32.MulDiv
 0043B9B4    mov         dword ptr [esp+8],eax
>0043B9B8    jmp         0043B9C1
 0043B9BA    mov         eax,dword ptr [esi+48]
 0043B9BD    mov         dword ptr [esp+8],eax
 0043B9C1    test        bl,8
 0043B9C4    setne       al
 0043B9C7    test        al,al
>0043B9C9    je          0043BA0A
 0043B9CB    test        byte ptr [esi+51],2
>0043B9CF    jne         0043BA0A
 0043B9D1    test        bl,8
 0043B9D4    setne       dl
 0043B9D7    test        al,al
>0043B9D9    je          0043B9F6
 0043B9DB    mov         eax,dword ptr [esp]
 0043B9DE    push        eax
 0043B9DF    push        edi
 0043B9E0    mov         eax,dword ptr [esi+44]
 0043B9E3    add         eax,dword ptr [esi+4C]
 0043B9E6    push        eax
 0043B9E7    call        KERNEL32.MulDiv
 0043B9EC    sub         eax,dword ptr [esp+4]
 0043B9F0    mov         dword ptr [esp+0C],eax
>0043B9F4    jmp         0043BA11
 0043B9F6    mov         eax,dword ptr [esp]
 0043B9F9    push        eax
 0043B9FA    push        edi
 0043B9FB    mov         eax,dword ptr [esi+44]
 0043B9FE    push        eax
 0043B9FF    call        KERNEL32.MulDiv
 0043BA04    mov         dword ptr [esp+0C],eax
>0043BA08    jmp         0043BA11
 0043BA0A    mov         eax,dword ptr [esi+4C]
 0043BA0D    mov         dword ptr [esp+0C],eax
 0043BA11    mov         eax,dword ptr [esp+8]
 0043BA15    push        eax
 0043BA16    mov         eax,dword ptr [esp+10]
 0043BA1A    push        eax
 0043BA1B    mov         ecx,dword ptr [esp+0C]
 0043BA1F    mov         edx,ebp
 0043BA21    mov         eax,esi
 0043BA23    mov         ebp,dword ptr [eax]
 0043BA25    call        dword ptr [ebp+84]
 0043BA2B    mov         eax,ebx
 0043BA2D    and         al,byte ptr ds:[43BAC0]
 0043BA33    mov         dl,byte ptr ds:[43BAC4]
 0043BA39    cmp         dl,al
>0043BA3B    je          0043BA54
 0043BA3D    mov         eax,dword ptr [esp]
 0043BA40    push        eax
 0043BA41    push        edi
 0043BA42    mov         eax,dword ptr [esi+90]
 0043BA48    push        eax
 0043BA49    call        KERNEL32.MulDiv
 0043BA4E    mov         dword ptr [esi+90],eax
 0043BA54    mov         eax,ebx
 0043BA56    and         al,byte ptr ds:[43BAC8]
 0043BA5C    mov         dl,byte ptr ds:[43BAC4]
 0043BA62    cmp         dl,al
>0043BA64    je          0043BA7D
 0043BA66    mov         eax,dword ptr [esp]
 0043BA69    push        eax
 0043BA6A    push        edi
 0043BA6B    mov         eax,dword ptr [esi+94]
 0043BA71    push        eax
 0043BA72    call        KERNEL32.MulDiv
 0043BA77    mov         dword ptr [esi+94],eax
 0043BA7D    cmp         byte ptr [esi+59],0
>0043BA81    jne         0043BAA6
 0043BA83    test        bl,10
>0043BA86    je          0043BAA6
 0043BA88    mov         eax,dword ptr [esp]
 0043BA8B    push        eax
 0043BA8C    push        edi
 0043BA8D    mov         ebx,dword ptr [esi+68]
 0043BA90    mov         eax,ebx
 0043BA92    call        TFont.GetSize
 0043BA97    push        eax
 0043BA98    call        KERNEL32.MulDiv
 0043BA9D    mov         edx,eax
 0043BA9F    mov         eax,ebx
 0043BAA1    call        TFont.SetSize
 0043BAA6    mov         al,[0043BAC4]
 0043BAAB    mov         byte ptr [esi+98],al
 0043BAB1    add         esp,10
 0043BAB4    pop         ebp
 0043BAB5    pop         edi
 0043BAB6    pop         esi
 0043BAB7    pop         ebx
 0043BAB8    ret
*}
end;

//0043BACC
procedure TControl.SetAutoSize(Value:Boolean);
begin
{*
 0043BACC    push        esi
 0043BACD    cmp         dl,byte ptr [eax+5C]
>0043BAD0    je          0043BAE2
 0043BAD2    mov         byte ptr [eax+5C],dl
 0043BAD5    test        dl,dl
>0043BAD7    je          0043BAE2
 0043BAD9    mov         si,0FFEE
 0043BADD    call        @CallDynaInst
 0043BAE2    pop         esi
 0043BAE3    ret
*}
end;

//0043BAE4
procedure TControl.SetName(const Value:TComponentName);
begin
{*
 0043BAE4    push        ebp
 0043BAE5    mov         ebp,esp
 0043BAE7    add         esp,0FFFFFFF8
 0043BAEA    push        ebx
 0043BAEB    push        esi
 0043BAEC    push        edi
 0043BAED    xor         ecx,ecx
 0043BAEF    mov         dword ptr [ebp-8],ecx
 0043BAF2    mov         dword ptr [ebp-4],edx
 0043BAF5    mov         edi,eax
 0043BAF7    xor         eax,eax
 0043BAF9    push        ebp
 0043BAFA    push        43BB7A
 0043BAFF    push        dword ptr fs:[eax]
 0043BB02    mov         dword ptr fs:[eax],esp
 0043BB05    test        byte ptr [edi+50],20
>0043BB09    je          0043BB46
 0043BB0B    test        byte ptr [edi+1C],1
>0043BB0F    jne         0043BB46
 0043BB11    lea         edx,[ebp-8]
 0043BB14    mov         eax,edi
 0043BB16    call        TControl.GetText
 0043BB1B    mov         edx,dword ptr [ebp-8]
 0043BB1E    mov         eax,dword ptr [edi+8]
 0043BB21    call        @LStrCmp
>0043BB26    jne         0043BB46
 0043BB28    mov         esi,dword ptr [edi+4]
 0043BB2B    test        esi,esi
>0043BB2D    je          0043BB4A
 0043BB2F    mov         eax,esi
 0043BB31    mov         edx,dword ptr ds:[437BA4];TControl
 0043BB37    call        @IsClass
 0043BB3C    test        al,al
>0043BB3E    je          0043BB4A
 0043BB40    test        byte ptr [esi+1C],1
>0043BB44    je          0043BB4A
 0043BB46    xor         ebx,ebx
>0043BB48    jmp         0043BB4C
 0043BB4A    mov         bl,1
 0043BB4C    mov         edx,dword ptr [ebp-4]
 0043BB4F    mov         eax,edi
 0043BB51    call        TComponent.SetName
 0043BB56    test        bl,bl
>0043BB58    je          0043BB64
 0043BB5A    mov         edx,dword ptr [ebp-4]
 0043BB5D    mov         eax,edi
 0043BB5F    call        TControl.SetText
 0043BB64    xor         eax,eax
 0043BB66    pop         edx
 0043BB67    pop         ecx
 0043BB68    pop         ecx
 0043BB69    mov         dword ptr fs:[eax],edx
 0043BB6C    push        43BB81
 0043BB71    lea         eax,[ebp-8]
 0043BB74    call        @LStrClr
 0043BB79    ret
>0043BB7A    jmp         @HandleFinally
>0043BB7F    jmp         0043BB71
 0043BB81    pop         edi
 0043BB82    pop         esi
 0043BB83    pop         ebx
 0043BB84    pop         ecx
 0043BB85    pop         ecx
 0043BB86    pop         ebp
 0043BB87    ret
*}
end;

//0043BB88
procedure TControl.SetClientSize(Value:TPoint);
begin
{*
 0043BB88    push        ebx
 0043BB89    push        esi
 0043BB8A    push        edi
 0043BB8B    add         esp,0FFFFFFE8
 0043BB8E    mov         esi,edx
 0043BB90    lea         edi,[esp]
 0043BB93    movs        dword ptr [edi],dword ptr [esi]
 0043BB94    movs        dword ptr [edi],dword ptr [esi]
 0043BB95    mov         ebx,eax
 0043BB97    lea         edx,[esp+8]
 0043BB9B    mov         eax,ebx
 0043BB9D    mov         ecx,dword ptr [eax]
 0043BB9F    call        dword ptr [ecx+44]
 0043BBA2    mov         eax,dword ptr [ebx+48]
 0043BBA5    sub         eax,dword ptr [esp+10]
 0043BBA9    add         eax,dword ptr [esp]
 0043BBAC    push        eax
 0043BBAD    mov         eax,dword ptr [ebx+4C]
 0043BBB0    sub         eax,dword ptr [esp+18]
 0043BBB4    add         eax,dword ptr [esp+8]
 0043BBB8    push        eax
 0043BBB9    mov         ecx,dword ptr [ebx+44]
 0043BBBC    mov         edx,dword ptr [ebx+40]
 0043BBBF    mov         eax,ebx
 0043BBC1    mov         ebx,dword ptr [eax]
 0043BBC3    call        dword ptr [ebx+84]
 0043BBC9    add         esp,18
 0043BBCC    pop         edi
 0043BBCD    pop         esi
 0043BBCE    pop         ebx
 0043BBCF    ret
*}
end;

//0043BBD0
procedure TControl.SetParent(AParent:TWinControl);
begin
{*
 0043BBD0    push        ebx
 0043BBD1    push        esi
 0043BBD2    mov         esi,edx
 0043BBD4    mov         ebx,eax
 0043BBD6    cmp         esi,dword ptr [ebx+30]
>0043BBD9    je          0043BC18
 0043BBDB    cmp         ebx,esi
>0043BBDD    jne         0043BBF6
 0043BBDF    mov         ecx,dword ptr ds:[5AE608];^SControlParentSetToSelf:TResStringRec
 0043BBE5    mov         dl,1
 0043BBE7    mov         eax,[00417C8C];EInvalidOperation
 0043BBEC    call        Exception.CreateRes
 0043BBF1    call        @RaiseExcept
 0043BBF6    mov         eax,dword ptr [ebx+30]
 0043BBF9    test        eax,eax
>0043BBFB    je          0043BC04
 0043BBFD    mov         edx,ebx
 0043BBFF    call        TWinControl.RemoveControl
 0043BC04    test        esi,esi
>0043BC06    je          0043BC18
 0043BC08    mov         edx,ebx
 0043BC0A    mov         eax,esi
 0043BC0C    call        TWinControl.InsertControl
 0043BC11    mov         eax,ebx
 0043BC13    call        TControl.UpdateAnchorRules
 0043BC18    pop         esi
 0043BC19    pop         ebx
 0043BC1A    ret
*}
end;

//0043BC1C
procedure TControl.SetVisible(Value:Boolean);
begin
{*
 0043BC1C    push        ebx
 0043BC1D    push        esi
 0043BC1E    push        edi
 0043BC1F    mov         ebx,edx
 0043BC21    mov         edi,eax
 0043BC23    cmp         bl,byte ptr [edi+57]
>0043BC26    je          0043BC53
 0043BC28    mov         eax,edi
 0043BC2A    mov         si,0FFCD
 0043BC2E    call        @CallDynaInst
 0043BC33    mov         byte ptr [edi+57],bl
 0043BC36    push        0
 0043BC38    xor         ecx,ecx
 0043BC3A    mov         cl,bl
 0043BC3C    mov         edx,0B00B
 0043BC41    mov         eax,edi
 0043BC43    call        TControl.Perform
 0043BC48    mov         eax,edi
 0043BC4A    mov         si,0FFD0
 0043BC4E    call        @CallDynaInst
 0043BC53    pop         edi
 0043BC54    pop         esi
 0043BC55    pop         ebx
 0043BC56    ret
*}
end;

//0043BC58
procedure TControl.SetEnabled(Value:Boolean);
begin
{*
 0043BC58    cmp         dl,byte ptr [eax+58]
>0043BC5B    je          0043BC6E
 0043BC5D    mov         byte ptr [eax+58],dl
 0043BC60    push        0
 0043BC62    xor         ecx,ecx
 0043BC64    mov         edx,0B00C
 0043BC69    call        TControl.Perform
 0043BC6E    ret
*}
end;

//0043BC70
function TControl.GetTextLen:Integer;
begin
{*
 0043BC70    push        0
 0043BC72    xor         ecx,ecx
 0043BC74    mov         edx,0E
 0043BC79    call        TControl.Perform
 0043BC7E    ret
*}
end;

//0043BC80
function TControl.GetTextBuf(Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 0043BC80    push        edx
 0043BC81    mov         edx,0D
 0043BC86    call        TControl.Perform
 0043BC8B    ret
*}
end;

//0043BC8C
function TControl.GetUndockHeight:Integer;
begin
{*
 0043BC8C    mov         edx,dword ptr [eax+0AC]
 0043BC92    test        edx,edx
>0043BC94    jle         0043BC99
 0043BC96    mov         eax,edx
 0043BC98    ret
 0043BC99    mov         eax,dword ptr [eax+4C]
 0043BC9C    ret
*}
end;

//0043BCA0
function TControl.GetUndockWidth:Integer;
begin
{*
 0043BCA0    mov         edx,dword ptr [eax+0A8]
 0043BCA6    test        edx,edx
>0043BCA8    jle         0043BCAD
 0043BCAA    mov         eax,edx
 0043BCAC    ret
 0043BCAD    mov         eax,dword ptr [eax+48]
 0043BCB0    ret
*}
end;

//0043BCB4
procedure TControl.SetPopupMenu(Value:TPopupMenu);
begin
{*
 0043BCB4    push        ebx
 0043BCB5    push        esi
 0043BCB6    mov         esi,edx
 0043BCB8    mov         ebx,eax
 0043BCBA    mov         dword ptr [ebx+7C],esi
 0043BCBD    test        esi,esi
>0043BCBF    je          0043BCD3
 0043BCC1    mov         edx,ebx
 0043BCC3    mov         eax,esi
 0043BCC5    call        TMenu.ParentBiDiModeChanged
 0043BCCA    mov         edx,ebx
 0043BCCC    mov         eax,esi
 0043BCCE    call        TComponent.FreeNotification
 0043BCD3    pop         esi
 0043BCD4    pop         ebx
 0043BCD5    ret
*}
end;

//0043BCD8
procedure TControl.SetTextBuf(Buffer:PChar);
begin
{*
 0043BCD8    push        ebx
 0043BCD9    mov         ebx,eax
 0043BCDB    push        edx
 0043BCDC    xor         ecx,ecx
 0043BCDE    mov         eax,ebx
 0043BCE0    mov         edx,0C
 0043BCE5    call        TControl.Perform
 0043BCEA    push        0
 0043BCEC    xor         ecx,ecx
 0043BCEE    mov         edx,0B012
 0043BCF3    mov         eax,ebx
 0043BCF5    call        TControl.Perform
 0043BCFA    pop         ebx
 0043BCFB    ret
*}
end;

//0043BCFC
function TControl.GetText:TCaption;
begin
{*
 0043BCFC    push        ebx
 0043BCFD    push        esi
 0043BCFE    push        edi
 0043BCFF    mov         edi,edx
 0043BD01    mov         esi,eax
 0043BD03    mov         eax,esi
 0043BD05    call        TControl.GetTextLen
 0043BD0A    mov         ebx,eax
 0043BD0C    mov         eax,edi
 0043BD0E    mov         ecx,ebx
 0043BD10    xor         edx,edx
 0043BD12    call        @LStrFromPCharLen
 0043BD17    test        ebx,ebx
>0043BD19    je          0043BD27
 0043BD1B    lea         ecx,[ebx+1]
 0043BD1E    mov         edx,dword ptr [edi]
 0043BD20    mov         eax,esi
 0043BD22    call        TControl.GetTextBuf
 0043BD27    pop         edi
 0043BD28    pop         esi
 0043BD29    pop         ebx
 0043BD2A    ret
*}
end;

//0043BD2C
procedure TControl.SetText(const Value:TCaption);
begin
{*
 0043BD2C    push        ebp
 0043BD2D    mov         ebp,esp
 0043BD2F    push        0
 0043BD31    push        ebx
 0043BD32    push        esi
 0043BD33    mov         esi,edx
 0043BD35    mov         ebx,eax
 0043BD37    xor         eax,eax
 0043BD39    push        ebp
 0043BD3A    push        43BD81
 0043BD3F    push        dword ptr fs:[eax]
 0043BD42    mov         dword ptr fs:[eax],esp
 0043BD45    lea         edx,[ebp-4]
 0043BD48    mov         eax,ebx
 0043BD4A    call        TControl.GetText
 0043BD4F    mov         eax,dword ptr [ebp-4]
 0043BD52    mov         edx,esi
 0043BD54    call        @LStrCmp
>0043BD59    je          0043BD6B
 0043BD5B    mov         eax,esi
 0043BD5D    call        @LStrToPChar
 0043BD62    mov         edx,eax
 0043BD64    mov         eax,ebx
 0043BD66    call        TControl.SetTextBuf
 0043BD6B    xor         eax,eax
 0043BD6D    pop         edx
 0043BD6E    pop         ecx
 0043BD6F    pop         ecx
 0043BD70    mov         dword ptr fs:[eax],edx
 0043BD73    push        43BD88
 0043BD78    lea         eax,[ebp-4]
 0043BD7B    call        @LStrClr
 0043BD80    ret
>0043BD81    jmp         @HandleFinally
>0043BD86    jmp         0043BD78
 0043BD88    pop         esi
 0043BD89    pop         ebx
 0043BD8A    pop         ecx
 0043BD8B    pop         ebp
 0043BD8C    ret
*}
end;

//0043BD90
procedure TControl.SetBiDiMode(Value:TBiDiMode);
begin
{*
 0043BD90    cmp         dl,byte ptr [eax+5F]
>0043BD93    je          0043BDAA
 0043BD95    mov         byte ptr [eax+5F],dl
 0043BD98    mov         byte ptr [eax+60],0
 0043BD9C    push        0
 0043BD9E    xor         ecx,ecx
 0043BDA0    mov         edx,0B03C
 0043BDA5    call        TControl.Perform
 0043BDAA    ret
*}
end;

//0043BDAC
procedure TControl.FontChanged(Sender:TObject);
begin
{*
 0043BDAC    push        ebx
 0043BDAD    mov         ebx,eax
 0043BDAF    mov         byte ptr [ebx+59],0
 0043BDB3    mov         byte ptr [ebx+56],0
 0043BDB7    mov         eax,dword ptr [ebx+68]
 0043BDBA    call        TFont.GetHeight
 0043BDBF    cmp         eax,dword ptr [ebx+84]
>0043BDC5    je          0043BDDC
 0043BDC7    or          byte ptr [ebx+98],10
 0043BDCE    mov         eax,dword ptr [ebx+68]
 0043BDD1    call        TFont.GetHeight
 0043BDD6    mov         dword ptr [ebx+84],eax
 0043BDDC    push        0
 0043BDDE    xor         ecx,ecx
 0043BDE0    mov         edx,0B00E
 0043BDE5    mov         eax,ebx
 0043BDE7    call        TControl.Perform
 0043BDEC    pop         ebx
 0043BDED    ret
*}
end;

//0043BDF0
procedure TControl.SetFont(Value:TFont);
begin
{*
 0043BDF0    push        esi
 0043BDF1    mov         esi,eax
 0043BDF3    mov         eax,dword ptr [esi+68]
 0043BDF6    mov         ecx,dword ptr [eax]
 0043BDF8    call        dword ptr [ecx+8]
 0043BDFB    pop         esi
 0043BDFC    ret
*}
end;

//0043BE00
function TControl.IsFontStored(Value:TFont):Boolean;
begin
{*
 0043BE00    cmp         byte ptr [eax+59],0
>0043BE04    jne         0043BE0C
 0043BE06    cmp         byte ptr [eax+56],0
>0043BE0A    je          0043BE0F
 0043BE0C    xor         eax,eax
 0043BE0E    ret
 0043BE0F    mov         al,1
 0043BE11    ret
*}
end;

//0043BE14
function TControl.IsShowHintStored(Value:Boolean):Boolean;
begin
{*
 0043BE14    mov         al,byte ptr [eax+9A]
 0043BE1A    xor         al,1
 0043BE1C    ret
*}
end;

//0043BE20
procedure TLabel.IsStoredBiDiMode(Value:TBiDiMode);
begin
{*
 0043BE20    mov         al,byte ptr [eax+60];TLabel.FParentBiDiMode:Boolean
 0043BE23    xor         al,1
 0043BE25    ret
*}
end;

//0043BE28
procedure TControl.SetParentFont(Value:Boolean);
begin
{*
 0043BE28    cmp         dl,byte ptr [eax+59]
>0043BE2B    je          0043BE4A
 0043BE2D    mov         byte ptr [eax+59],dl
 0043BE30    cmp         dword ptr [eax+30],0
>0043BE34    je          0043BE4A
 0043BE36    test        byte ptr [eax+1C],2
>0043BE3A    jne         0043BE4A
 0043BE3C    push        0
 0043BE3E    xor         ecx,ecx
 0043BE40    mov         edx,0B008
 0043BE45    call        TControl.Perform
 0043BE4A    ret
*}
end;

//0043BE4C
procedure TControl.SetShowHint(Value:Boolean);
begin
{*
 0043BE4C    cmp         dl,byte ptr [eax+99]
>0043BE52    je          0043BE6F
 0043BE54    mov         byte ptr [eax+99],dl
 0043BE5A    mov         byte ptr [eax+9A],0
 0043BE61    push        0
 0043BE63    xor         ecx,ecx
 0043BE65    mov         edx,0B022
 0043BE6A    call        TControl.Perform
 0043BE6F    ret
*}
end;

//0043BE70
procedure TControl.SetParentShowHint(Value:Boolean);
begin
{*
 0043BE70    cmp         dl,byte ptr [eax+9A]
>0043BE76    je          0043BE98
 0043BE78    mov         byte ptr [eax+9A],dl
 0043BE7E    cmp         dword ptr [eax+30],0
>0043BE82    je          0043BE98
 0043BE84    test        byte ptr [eax+1C],2
>0043BE88    jne         0043BE98
 0043BE8A    push        0
 0043BE8C    xor         ecx,ecx
 0043BE8E    mov         edx,0B023
 0043BE93    call        TControl.Perform
 0043BE98    ret
*}
end;

//0043BE9C
procedure TControl.SetColor(Value:TColor);
begin
{*
 0043BE9C    cmp         edx,dword ptr [eax+70]
>0043BE9F    je          0043BEB6
 0043BEA1    mov         dword ptr [eax+70],edx
 0043BEA4    mov         byte ptr [eax+5A],0
 0043BEA8    push        0
 0043BEAA    xor         ecx,ecx
 0043BEAC    mov         edx,0B00D
 0043BEB1    call        TControl.Perform
 0043BEB6    ret
*}
end;

//0043BEB8
procedure TLabel.IsStoredColor(Value:TColor);
begin
{*
 0043BEB8    mov         al,byte ptr [eax+5A];TLabel.FParentColor:Boolean
 0043BEBB    xor         al,1
 0043BEBD    ret
*}
end;

//0043BEC0
procedure TControl.SetParentColor(Value:Boolean);
begin
{*
 0043BEC0    cmp         dl,byte ptr [eax+5A]
>0043BEC3    je          0043BEE2
 0043BEC5    mov         byte ptr [eax+5A],dl
 0043BEC8    cmp         dword ptr [eax+30],0
>0043BECC    je          0043BEE2
 0043BECE    test        byte ptr [eax+1C],2
>0043BED2    jne         0043BEE2
 0043BED4    push        0
 0043BED6    xor         ecx,ecx
 0043BED8    mov         edx,0B009
 0043BEDD    call        TControl.Perform
 0043BEE2    ret
*}
end;

//0043BEE4
procedure TControl.SetParentBiDiMode(Value:Boolean);
begin
{*
 0043BEE4    cmp         dl,byte ptr [eax+60]
>0043BEE7    je          0043BF06
 0043BEE9    mov         byte ptr [eax+60],dl
 0043BEEC    cmp         dword ptr [eax+30],0
>0043BEF0    je          0043BF06
 0043BEF2    test        byte ptr [eax+1C],2
>0043BEF6    jne         0043BF06
 0043BEF8    push        0
 0043BEFA    xor         ecx,ecx
 0043BEFC    mov         edx,0B03D
 0043BF01    call        TControl.Perform
 0043BF06    ret
*}
end;

//0043BF08
procedure TControl.SetCursor(Value:TCursor);
begin
{*
 0043BF08    cmp         dx,word ptr [eax+78]
>0043BF0C    je          0043BF20
 0043BF0E    mov         word ptr [eax+78],dx
 0043BF12    push        0
 0043BF14    xor         ecx,ecx
 0043BF16    mov         edx,0B00F
 0043BF1B    call        TControl.Perform
 0043BF20    ret
*}
end;

//0043BF24
function TControl.GetMouseCapture:Boolean;
begin
{*
 0043BF24    push        ebx
 0043BF25    mov         ebx,eax
 0043BF27    call        GetCaptureControl
 0043BF2C    cmp         ebx,eax
 0043BF2E    sete        al
 0043BF31    pop         ebx
 0043BF32    ret
*}
end;

//0043BF34
procedure TControl.SetMouseCapture(Value:Boolean);
begin
{*
 0043BF34    push        ebx
 0043BF35    push        esi
 0043BF36    mov         ebx,edx
 0043BF38    mov         esi,eax
 0043BF3A    mov         eax,esi
 0043BF3C    call        TControl.GetMouseCapture
 0043BF41    cmp         bl,al
>0043BF43    je          0043BF59
 0043BF45    test        bl,bl
>0043BF47    je          0043BF52
 0043BF49    mov         eax,esi
 0043BF4B    call        SetCaptureControl
>0043BF50    jmp         0043BF59
 0043BF52    xor         eax,eax
 0043BF54    call        SetCaptureControl
 0043BF59    pop         esi
 0043BF5A    pop         ebx
 0043BF5B    ret
*}
end;

//0043BF5C
procedure TControl.BringToFront;
begin
{*
 0043BF5C    push        esi
 0043BF5D    mov         dl,1
 0043BF5F    mov         si,0FFCE
 0043BF63    call        @CallDynaInst
 0043BF68    pop         esi
 0043BF69    ret
*}
end;

//0043BF6C
procedure TControl.SetZOrderPosition(Position:Integer);
begin
{*
 0043BF6C    push        ebx
 0043BF6D    push        esi
 0043BF6E    push        edi
 0043BF6F    mov         esi,edx
 0043BF71    mov         ebx,eax
 0043BF73    mov         eax,dword ptr [ebx+30]
 0043BF76    test        eax,eax
>0043BF78    je          0043BFE6
 0043BF7A    mov         eax,dword ptr [eax+198]
 0043BF80    mov         edx,ebx
 0043BF82    call        TList.IndexOf
 0043BF87    test        eax,eax
>0043BF89    jl          0043BFE6
 0043BF8B    mov         edx,dword ptr [ebx+30]
 0043BF8E    mov         edi,dword ptr [edx+198]
 0043BF94    mov         edx,dword ptr [edi+8]
 0043BF97    test        esi,esi
>0043BF99    jge         0043BF9D
 0043BF9B    xor         esi,esi
 0043BF9D    cmp         edx,esi
>0043BF9F    jg          0043BFA4
 0043BFA1    mov         esi,edx
 0043BFA3    dec         esi
 0043BFA4    cmp         eax,esi
>0043BFA6    je          0043BFE6
 0043BFA8    mov         edx,edi
 0043BFAA    xchg        eax,edx
 0043BFAB    call        TList.Delete
 0043BFB0    mov         eax,dword ptr [ebx+30]
 0043BFB3    mov         eax,dword ptr [eax+198]
 0043BFB9    mov         ecx,ebx
 0043BFBB    mov         edx,esi
 0043BFBD    call        TList.Insert
 0043BFC2    mov         cl,1
 0043BFC4    mov         dl,byte ptr [ebx+57]
 0043BFC7    mov         eax,ebx
 0043BFC9    call        TControl.InvalidateControl
 0043BFCE    mov         eax,ebx
 0043BFD0    call        ValidParentForm
 0043BFD5    test        byte ptr [eax+54],4
>0043BFD9    je          0043BFE6
 0043BFDB    mov         dl,1
 0043BFDD    mov         si,0FFD1
 0043BFE1    call        @CallDynaInst
 0043BFE6    pop         edi
 0043BFE7    pop         esi
 0043BFE8    pop         ebx
 0043BFE9    ret
*}
end;

//0043BFEC
procedure TControl.SetZOrder(TopMost:Boolean);
begin
{*
 0043BFEC    mov         ecx,dword ptr [eax+30]
 0043BFEF    test        ecx,ecx
>0043BFF1    je          0043C00F
 0043BFF3    test        dl,dl
>0043BFF5    je          0043C008
 0043BFF7    mov         edx,dword ptr [ecx+198]
 0043BFFD    mov         edx,dword ptr [edx+8]
 0043C000    dec         edx
 0043C001    call        TControl.SetZOrderPosition
>0043C006    jmp         0043C00F
 0043C008    xor         edx,edx
 0043C00A    call        TControl.SetZOrderPosition
 0043C00F    ret
*}
end;

//0043C010
{*function sub_0043C010:?;
begin
 0043C010    push        ebp
 0043C011    mov         ebp,esp
 0043C013    add         esp,0FFFFFFF4
 0043C016    push        ebx
 0043C017    push        esi
 0043C018    xor         ecx,ecx
 0043C01A    mov         dword ptr [ebp-0C],ecx
 0043C01D    mov         ebx,eax
 0043C01F    xor         eax,eax
 0043C021    push        ebp
 0043C022    push        43C0A6
 0043C027    push        dword ptr fs:[eax]
 0043C02A    mov         dword ptr fs:[eax],esp
 0043C02D    cmp         dword ptr [ebx+30],0;TControl.FParent:TWinControl
>0043C031    jne         0043C064
 0043C033    mov         eax,dword ptr [ebx+8];TControl.Name:TComponentName
 0043C036    mov         dword ptr [ebp-8],eax
 0043C039    mov         byte ptr [ebp-4],0B
 0043C03D    lea         eax,[ebp-8]
 0043C040    push        eax
 0043C041    push        0
 0043C043    lea         edx,[ebp-0C]
 0043C046    mov         eax,[005AE604];^SParentRequired:TResStringRec
 0043C04B    call        LoadStr
 0043C050    mov         ecx,dword ptr [ebp-0C]
 0043C053    mov         dl,1
 0043C055    mov         eax,[00417C8C];EInvalidOperation
 0043C05A    call        Exception.CreateFmt;EInvalidOperation.Create
 0043C05F    call        @RaiseExcept
 0043C064    mov         eax,dword ptr [ebx+30];TControl.FParent:TWinControl
 0043C067    mov         ecx,dword ptr [eax]
 0043C069    call        dword ptr [ecx+48];TWinControl.GetDeviceContext
 0043C06C    mov         esi,eax
 0043C06E    push        0
 0043C070    mov         eax,dword ptr [ebx+44];TControl.Top:Integer
 0043C073    push        eax
 0043C074    mov         eax,dword ptr [ebx+40];TControl.Left:Integer
 0043C077    push        eax
 0043C078    push        esi
 0043C079    call        gdi32.SetViewportOrgEx
 0043C07E    mov         eax,dword ptr [ebx+4C];TControl.Height:Integer
 0043C081    push        eax
 0043C082    mov         eax,dword ptr [ebx+48];TControl.Width:Integer
 0043C085    push        eax
 0043C086    push        0
 0043C088    push        0
 0043C08A    push        esi
 0043C08B    call        gdi32.IntersectClipRect
 0043C090    xor         eax,eax
 0043C092    pop         edx
 0043C093    pop         ecx
 0043C094    pop         ecx
 0043C095    mov         dword ptr fs:[eax],edx
 0043C098    push        43C0AD
 0043C09D    lea         eax,[ebp-0C]
 0043C0A0    call        @LStrClr
 0043C0A5    ret
>0043C0A6    jmp         @HandleFinally
>0043C0AB    jmp         0043C09D
 0043C0AD    mov         eax,esi
 0043C0AF    pop         esi
 0043C0B0    pop         ebx
 0043C0B1    mov         esp,ebp
 0043C0B3    pop         ebp
 0043C0B4    ret
end;*}

//0043C0B8
function BackgroundClipped:Boolean;
begin
{*
 0043C0B8    push        ebp
 0043C0B9    mov         ebp,esp
 0043C0BB    add         esp,0FFFFFFDC
 0043C0BE    push        ebx
 0043C0BF    push        esi
 0043C0C0    push        edi
 0043C0C1    mov         byte ptr [ebp-1],1
 0043C0C5    mov         eax,dword ptr [ebp+8]
 0043C0C8    mov         eax,dword ptr [eax-4]
 0043C0CB    mov         eax,dword ptr [eax+30]
 0043C0CE    mov         edi,dword ptr [eax+198]
 0043C0D4    mov         eax,dword ptr [ebp+8]
 0043C0D7    mov         edx,dword ptr [eax-4]
 0043C0DA    mov         eax,edi
 0043C0DC    call        TList.IndexOf
 0043C0E1    mov         esi,eax
 0043C0E3    test        esi,esi
>0043C0E5    jle         0043C135
 0043C0E7    dec         esi
 0043C0E8    mov         edx,esi
 0043C0EA    mov         eax,edi
 0043C0EC    call        TList.Get
 0043C0F1    mov         ebx,eax
 0043C0F3    cmp         byte ptr [ebx+57],0
>0043C0F7    je          0043C131
 0043C0F9    test        byte ptr [ebx+50],40
>0043C0FD    je          0043C131
 0043C0FF    lea         edx,[ebp-24]
 0043C102    mov         eax,ebx
 0043C104    call        TControl.GetBoundsRect
 0043C109    lea         eax,[ebp-24]
 0043C10C    push        eax
 0043C10D    mov         eax,dword ptr [ebp+8]
 0043C110    add         eax,0FFFFFFEC
 0043C113    push        eax
 0043C114    lea         eax,[ebp-11]
 0043C117    push        eax
 0043C118    call        user32.IntersectRect
 0043C11D    mov         eax,dword ptr [ebp+8]
 0043C120    add         eax,0FFFFFFEC
 0043C123    push        eax
 0043C124    lea         eax,[ebp-11]
 0043C127    push        eax
 0043C128    call        user32.EqualRect
 0043C12D    test        eax,eax
>0043C12F    jne         0043C139
 0043C131    test        esi,esi
>0043C133    jg          0043C0E7
 0043C135    mov         byte ptr [ebp-1],0
 0043C139    mov         al,byte ptr [ebp-1]
 0043C13C    pop         edi
 0043C13D    pop         esi
 0043C13E    pop         ebx
 0043C13F    mov         esp,ebp
 0043C141    pop         ebp
 0043C142    ret
*}
end;

//0043C144
procedure TControl.InvalidateControl(IsVisible:Boolean; IsOpaque:Boolean);
begin
{*
 0043C144    push        ebp
 0043C145    mov         ebp,esp
 0043C147    add         esp,0FFFFFFE8
 0043C14A    push        ebx
 0043C14B    mov         byte ptr [ebp-15],cl
 0043C14E    mov         ebx,edx
 0043C150    mov         dword ptr [ebp-4],eax
 0043C153    test        bl,bl
>0043C155    jne         0043C169
 0043C157    mov         eax,dword ptr [ebp-4]
 0043C15A    test        byte ptr [eax+1C],10
>0043C15E    je          0043C1C9
 0043C160    mov         eax,dword ptr [ebp-4]
 0043C163    test        byte ptr [eax+51],4
>0043C167    jne         0043C1C9
 0043C169    mov         eax,dword ptr [ebp-4]
 0043C16C    cmp         dword ptr [eax+30],0
>0043C170    je          0043C1C9
 0043C172    mov         eax,dword ptr [ebp-4]
 0043C175    mov         eax,dword ptr [eax+30]
 0043C178    call        TWinControl.HandleAllocated
 0043C17D    test        al,al
>0043C17F    je          0043C1C9
 0043C181    lea         edx,[ebp-14]
 0043C184    mov         eax,dword ptr [ebp-4]
 0043C187    call        TControl.GetBoundsRect
 0043C18C    cmp         byte ptr [ebp-15],0
>0043C190    jne         0043C1A9
 0043C192    mov         eax,dword ptr [ebp-4]
 0043C195    mov         eax,dword ptr [eax+30]
 0043C198    test        byte ptr [eax+50],40
>0043C19C    jne         0043C1A9
 0043C19E    push        ebp
 0043C19F    call        BackgroundClipped
 0043C1A4    pop         ecx
 0043C1A5    test        al,al
>0043C1A7    je          0043C1AD
 0043C1A9    xor         eax,eax
>0043C1AB    jmp         0043C1AF
 0043C1AD    mov         al,1
 0043C1AF    neg         al
 0043C1B1    sbb         eax,eax
 0043C1B3    push        eax
 0043C1B4    lea         eax,[ebp-14]
 0043C1B7    push        eax
 0043C1B8    mov         eax,dword ptr [ebp-4]
 0043C1BB    mov         eax,dword ptr [eax+30]
 0043C1BE    call        TWinControl.GetHandle
 0043C1C3    push        eax
 0043C1C4    call        user32.InvalidateRect
 0043C1C9    pop         ebx
 0043C1CA    mov         esp,ebp
 0043C1CC    pop         ebp
 0043C1CD    ret
*}
end;

//0043C1D0
procedure TControl.Invalidate;
begin
{*
 0043C1D0    test        byte ptr [eax+50],40
 0043C1D4    setne       cl
 0043C1D7    mov         dl,byte ptr [eax+57]
 0043C1DA    call        TControl.InvalidateControl
 0043C1DF    ret
*}
end;

//0043C1E0
procedure TControl.MouseWheelHandler(var Message:TMessage);
begin
{*
 0043C1E0    push        ebx
 0043C1E1    push        esi
 0043C1E2    push        edi
 0043C1E3    mov         edi,edx
 0043C1E5    mov         ebx,eax
 0043C1E7    mov         eax,ebx
 0043C1E9    call        GetParentForm
 0043C1EE    mov         esi,eax
 0043C1F0    test        esi,esi
>0043C1F2    je          0043C207
 0043C1F4    cmp         ebx,esi
>0043C1F6    je          0043C207
 0043C1F8    mov         edx,edi
 0043C1FA    mov         eax,esi
 0043C1FC    mov         si,0FFC9
 0043C200    call        @CallDynaInst
>0043C205    jmp         0043C21D
 0043C207    mov         eax,dword ptr [edi+8]
 0043C20A    push        eax
 0043C20B    mov         ecx,dword ptr [edi+4]
 0043C20E    mov         edx,0B043
 0043C213    mov         eax,ebx
 0043C215    call        TControl.Perform
 0043C21A    mov         dword ptr [edi+0C],eax
 0043C21D    pop         edi
 0043C21E    pop         esi
 0043C21F    pop         ebx
 0043C220    ret
*}
end;

//0043C224
procedure TControl.Update;
begin
{*
 0043C224    push        esi
 0043C225    mov         esi,dword ptr [eax+30]
 0043C228    test        esi,esi
>0043C22A    je          0043C236
 0043C22C    mov         eax,esi
 0043C22E    mov         edx,dword ptr [eax]
 0043C230    call        dword ptr [edx+88]
 0043C236    pop         esi
 0043C237    ret
*}
end;

//0043C238
procedure TControl.Repaint;
begin
{*
 0043C238    push        ebp
 0043C239    mov         ebp,esp
 0043C23B    add         esp,0FFFFFFF8
 0043C23E    push        ebx
 0043C23F    mov         dword ptr [ebp-4],eax
 0043C242    mov         eax,dword ptr [ebp-4]
 0043C245    cmp         byte ptr [eax+57],0
>0043C249    jne         0043C265
 0043C24B    mov         eax,dword ptr [ebp-4]
 0043C24E    test        byte ptr [eax+1C],10
>0043C252    je          0043C32B
 0043C258    mov         eax,dword ptr [ebp-4]
 0043C25B    test        byte ptr [eax+51],4
>0043C25F    jne         0043C32B
 0043C265    mov         eax,dword ptr [ebp-4]
 0043C268    cmp         dword ptr [eax+30],0
>0043C26C    je          0043C32B
 0043C272    mov         eax,dword ptr [ebp-4]
 0043C275    mov         eax,dword ptr [eax+30]
 0043C278    call        TWinControl.HandleAllocated
 0043C27D    test        al,al
>0043C27F    je          0043C32B
 0043C285    mov         eax,dword ptr [ebp-4]
 0043C288    test        byte ptr [eax+50],40
>0043C28C    je          0043C318
 0043C292    mov         eax,dword ptr [ebp-4]
 0043C295    mov         eax,dword ptr [eax+30]
 0043C298    call        TWinControl.GetHandle
 0043C29D    push        eax
 0043C29E    call        user32.GetDC
 0043C2A3    mov         dword ptr [ebp-8],eax
 0043C2A6    xor         ecx,ecx
 0043C2A8    push        ebp
 0043C2A9    push        43C311
 0043C2AE    push        dword ptr fs:[ecx]
 0043C2B1    mov         dword ptr fs:[ecx],esp
 0043C2B4    mov         edx,dword ptr [ebp-4]
 0043C2B7    mov         edx,dword ptr [edx+44]
 0043C2BA    mov         ecx,edx
 0043C2BC    mov         ebx,dword ptr [ebp-4]
 0043C2BF    add         ecx,dword ptr [ebx+4C]
 0043C2C2    push        ecx
 0043C2C3    mov         eax,dword ptr [ebp-4]
 0043C2C6    mov         eax,dword ptr [eax+40]
 0043C2C9    mov         ecx,eax
 0043C2CB    mov         ebx,dword ptr [ebp-4]
 0043C2CE    add         ecx,dword ptr [ebx+48]
 0043C2D1    push        ecx
 0043C2D2    push        edx
 0043C2D3    push        eax
 0043C2D4    mov         eax,dword ptr [ebp-8]
 0043C2D7    push        eax
 0043C2D8    call        gdi32.IntersectClipRect
 0043C2DD    mov         eax,dword ptr [ebp-4]
 0043C2E0    mov         eax,dword ptr [eax+30]
 0043C2E3    mov         ecx,dword ptr [ebp-4]
 0043C2E6    mov         edx,dword ptr [ebp-8]
 0043C2E9    call        TWinControl.PaintControls
 0043C2EE    xor         eax,eax
 0043C2F0    pop         edx
 0043C2F1    pop         ecx
 0043C2F2    pop         ecx
 0043C2F3    mov         dword ptr fs:[eax],edx
 0043C2F6    push        43C32B
 0043C2FB    mov         eax,dword ptr [ebp-8]
 0043C2FE    push        eax
 0043C2FF    mov         eax,dword ptr [ebp-4]
 0043C302    mov         eax,dword ptr [eax+30]
 0043C305    call        TWinControl.GetHandle
 0043C30A    push        eax
 0043C30B    call        user32.ReleaseDC
 0043C310    ret
>0043C311    jmp         @HandleFinally
>0043C316    jmp         0043C2FB
 0043C318    mov         eax,dword ptr [ebp-4]
 0043C31B    mov         edx,dword ptr [eax]
 0043C31D    call        dword ptr [edx+7C]
 0043C320    mov         eax,dword ptr [ebp-4]
 0043C323    mov         edx,dword ptr [eax]
 0043C325    call        dword ptr [edx+88]
 0043C32B    pop         ebx
 0043C32C    pop         ecx
 0043C32D    pop         ecx
 0043C32E    pop         ebp
 0043C32F    ret
*}
end;

//0043C330
procedure TControl.sub_0043C330;
begin
{*
 0043C330    xor         eax,eax
 0043C332    ret
*}
end;

//0043C334
function TControl.UseRightToLeftReading:Boolean;
begin
{*
 0043C334    mov         edx,dword ptr ds:[5AE810];^SysLocale:TSysLocale
 0043C33A    cmp         byte ptr [edx+0D],0
>0043C33E    je          0043C346
 0043C340    cmp         byte ptr [eax+5F],0
>0043C344    jne         0043C349
 0043C346    xor         eax,eax
 0043C348    ret
 0043C349    mov         al,1
 0043C34B    ret
*}
end;

//0043C34C
procedure TControl.UseRightToLeftAlignment;
begin
{*
 0043C34C    mov         edx,dword ptr ds:[5AE810];^SysLocale:TSysLocale
 0043C352    cmp         byte ptr [edx+0D],0
>0043C356    je          0043C35E
 0043C358    cmp         byte ptr [eax+5F],1
>0043C35C    je          0043C361
 0043C35E    xor         eax,eax
 0043C360    ret
 0043C361    mov         al,1
 0043C363    ret
*}
end;

//0043C364
function TControl.UseRightToLeftScrollBar:Boolean;
begin
{*
 0043C364    mov         edx,dword ptr ds:[5AE810];^SysLocale:TSysLocale
 0043C36A    cmp         byte ptr [edx+0D],0
>0043C36E    je          0043C378
 0043C370    mov         al,byte ptr [eax+5F]
 0043C373    dec         eax
 0043C374    sub         al,2
>0043C376    jb          0043C37B
 0043C378    xor         eax,eax
 0043C37A    ret
 0043C37B    mov         al,1
 0043C37D    ret
*}
end;

//0043C380
procedure TControl.BeginAutoDrag;
begin
{*
 0043C380    mov         edx,dword ptr ds:[5E0C0C];Mouse:TMouse
 0043C386    mov         ecx,dword ptr [edx+8]
 0043C389    mov         edx,dword ptr ds:[5E0C0C];Mouse:TMouse
 0043C38F    mov         dl,byte ptr [edx+4]
 0043C392    call        TControl.BeginDrag
 0043C397    ret
*}
end;

//0043C398
procedure TControl.BeginDrag(Immediate:Boolean; Threshold:Integer);
begin
{*
 0043C398    push        ebx
 0043C399    push        esi
 0043C39A    push        edi
 0043C39B    add         esp,0FFFFFFF0
 0043C39E    mov         esi,ecx
 0043C3A0    mov         ebx,edx
 0043C3A2    mov         edi,eax
 0043C3A4    mov         eax,edi
 0043C3A6    mov         edx,dword ptr ds:[450CFC];TCustomForm
 0043C3AC    call        @IsClass
 0043C3B1    test        al,al
>0043C3B3    je          0043C3D5
 0043C3B5    cmp         byte ptr [edi+9B],1
>0043C3BC    je          0043C3D5
 0043C3BE    mov         ecx,dword ptr ds:[5AE5F4];^SCannotDragForm:TResStringRec
 0043C3C4    mov         dl,1
 0043C3C6    mov         eax,[00417C8C];EInvalidOperation
 0043C3CB    call        Exception.CreateRes
 0043C3D0    call        @RaiseExcept
 0043C3D5    mov         eax,edi
 0043C3D7    call        TControl.CalcDockSizes
 0043C3DC    cmp         dword ptr ds:[5E0C28],0;DragControl:TControl
>0043C3E3    je          0043C3EE
 0043C3E5    cmp         dword ptr ds:[5E0C28],0FFFFFFFF;DragControl:TControl
>0043C3EC    jne         0043C453
 0043C3EE    xor         eax,eax
 0043C3F0    mov         [005E0C28],eax;DragControl:TControl
 0043C3F5    test        byte ptr [edi+54],1
>0043C3F9    je          0043C433
 0043C3FB    push        esp
 0043C3FC    call        user32.GetCursorPos
 0043C401    lea         ecx,[esp+8]
 0043C405    mov         edx,esp
 0043C407    mov         eax,edi
 0043C409    call        TControl.ScreenToClient
 0043C40E    mov         eax,dword ptr [esp+8]
 0043C412    mov         dword ptr [esp],eax
 0043C415    mov         eax,dword ptr [esp+0C]
 0043C419    mov         dword ptr [esp+4],eax
 0043C41D    mov         eax,esp
 0043C41F    call        PointToSmallPoint
 0043C424    push        eax
 0043C425    xor         ecx,ecx
 0043C427    mov         edx,202
 0043C42C    mov         eax,edi
 0043C42E    call        TControl.Perform
 0043C433    test        esi,esi
>0043C435    jge         0043C43F
 0043C437    mov         eax,[005E0C0C];Mouse:TMouse
 0043C43C    mov         esi,dword ptr [eax+8]
 0043C43F    cmp         dword ptr ds:[5E0C28],0FFFFFFFF;DragControl:TControl
>0043C446    je          0043C453
 0043C448    mov         ecx,esi
 0043C44A    mov         edx,ebx
 0043C44C    mov         eax,edi
 0043C44E    call        DragInitControl
 0043C453    add         esp,10
 0043C456    pop         edi
 0043C457    pop         esi
 0043C458    pop         ebx
 0043C459    ret
*}
end;

//0043C45C
procedure TControl.sub_0043C45C;
begin
{*
 0043C45C    ret
*}
end;

//0043C460
function TControl.Dragging:Boolean;
begin
{*
 0043C460    cmp         eax,dword ptr ds:[5E0C28];DragControl:TControl
 0043C466    sete        al
 0043C469    ret
*}
end;

//0043C46C
procedure TControl.DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 0043C46C    push        ebp
 0043C46D    mov         ebp,esp
 0043C46F    push        ebx
 0043C470    push        esi
 0043C471    mov         esi,dword ptr [ebp+8]
 0043C474    mov         byte ptr [esi],0
 0043C477    cmp         word ptr [eax+0F2],0
>0043C47F    je          0043C4A0
 0043C481    mov         byte ptr [esi],1
 0043C484    push        ecx
 0043C485    mov         ecx,dword ptr [ebp+10]
 0043C488    push        ecx
 0043C489    mov         cl,byte ptr [ebp+0C]
 0043C48C    push        ecx
 0043C48D    push        esi
 0043C48E    mov         ebx,eax
 0043C490    mov         ecx,edx
 0043C492    mov         edx,eax
 0043C494    mov         eax,dword ptr [ebx+0F4]
 0043C49A    call        dword ptr [ebx+0F0]
 0043C4A0    pop         esi
 0043C4A1    pop         ebx
 0043C4A2    pop         ebp
 0043C4A3    ret         0C
*}
end;

//0043C4A8
procedure TControl.DragDrop(Source:TObject; X:Integer; Y:Integer);
begin
{*
 0043C4A8    push        ebp
 0043C4A9    mov         ebp,esp
 0043C4AB    push        ebx
 0043C4AC    cmp         word ptr [eax+0EA],0
>0043C4B4    je          0043C4CD
 0043C4B6    push        ecx
 0043C4B7    mov         ecx,dword ptr [ebp+8]
 0043C4BA    push        ecx
 0043C4BB    mov         ebx,eax
 0043C4BD    mov         ecx,edx
 0043C4BF    mov         edx,eax
 0043C4C1    mov         eax,dword ptr [ebx+0EC]
 0043C4C7    call        dword ptr [ebx+0E8]
 0043C4CD    pop         ebx
 0043C4CE    pop         ebp
 0043C4CF    ret         4
*}
end;

//0043C4D4
procedure TControl.DoStartDrag(var DragObject:TDragObject);
begin
{*
 0043C4D4    push        ebx
 0043C4D5    cmp         word ptr [eax+112],0
>0043C4DD    je          0043C4F1
 0043C4DF    mov         ecx,edx
 0043C4E1    mov         ebx,eax
 0043C4E3    mov         edx,eax
 0043C4E5    mov         eax,dword ptr [ebx+114]
 0043C4EB    call        dword ptr [ebx+110]
 0043C4F1    pop         ebx
 0043C4F2    ret
*}
end;

//0043C4F4
procedure TControl.DoEndDrag(Target:TObject; X:Integer; Y:Integer);
begin
{*
 0043C4F4    push        ebp
 0043C4F5    mov         ebp,esp
 0043C4F7    push        ebx
 0043C4F8    cmp         word ptr [eax+11A],0
>0043C500    je          0043C519
 0043C502    push        ecx
 0043C503    mov         ecx,dword ptr [ebp+8]
 0043C506    push        ecx
 0043C507    mov         ebx,eax
 0043C509    mov         ecx,edx
 0043C50B    mov         edx,eax
 0043C50D    mov         eax,dword ptr [ebx+11C]
 0043C513    call        dword ptr [ebx+118]
 0043C519    pop         ebx
 0043C51A    pop         ebp
 0043C51B    ret         4
*}
end;

//0043C520
procedure TControl.PositionDockRect(DragDockObject:TDragDockObject);
begin
{*
 0043C520    push        ebx
 0043C521    push        esi
 0043C522    push        edi
 0043C523    push        ebp
 0043C524    add         esp,0FFFFFFEC
 0043C527    mov         ebx,edx
 0043C529    cmp         dword ptr [ebx+4],0
>0043C52D    je          0043C53B
 0043C52F    mov         eax,dword ptr [ebx+4]
 0043C532    cmp         byte ptr [eax+1A7],0
>0043C539    jne         0043C5A8
 0043C53B    mov         eax,dword ptr [ebx+38]
 0043C53E    call        TControl.GetUndockWidth
 0043C543    mov         edi,eax
 0043C545    mov         eax,dword ptr [ebx+38]
 0043C548    call        TControl.GetUndockHeight
 0043C54D    mov         ebp,eax
 0043C54F    mov         dword ptr [esp+10],edi
 0043C553    fild        dword ptr [esp+10]
 0043C557    fmul        qword ptr [ebx+20]
 0043C55A    fild        dword ptr [ebx+0C]
 0043C55D    fsubrp      st(1),st
 0043C55F    fstp        qword ptr [esp]
 0043C562    wait
 0043C563    mov         dword ptr [esp+10],ebp
 0043C567    fild        dword ptr [esp+10]
 0043C56B    fmul        qword ptr [ebx+28]
 0043C56E    fild        dword ptr [ebx+10]
 0043C571    fsubrp      st(1),st
 0043C573    fstp        qword ptr [esp+8]
 0043C577    wait
 0043C578    lea         esi,[ebx+44]
 0043C57B    fld         qword ptr [esp]
 0043C57E    call        @ROUND
 0043C583    mov         dword ptr [esi],eax
 0043C585    fld         qword ptr [esp+8]
 0043C589    call        @ROUND
 0043C58E    mov         dword ptr [esi+4],eax
 0043C591    add         edi,dword ptr [esi]
 0043C593    mov         dword ptr [esi+8],edi
 0043C596    add         ebp,dword ptr [esi+4]
 0043C599    mov         dword ptr [esi+0C],ebp
 0043C59C    lea         edx,[ebx+44]
 0043C59F    mov         eax,ebx
 0043C5A1    mov         ecx,dword ptr [eax]
 0043C5A3    call        dword ptr [ecx+2C]
>0043C5A6    jmp         0043C5E8
 0043C5A8    lea         eax,[ebx+44]
 0043C5AB    push        eax
 0043C5AC    mov         eax,dword ptr [ebx+4]
 0043C5AF    call        TWinControl.GetHandle
 0043C5B4    push        eax
 0043C5B5    call        user32.GetWindowRect
 0043C5BA    mov         eax,dword ptr [ebx+4]
 0043C5BD    cmp         byte ptr [eax+1A7],0
>0043C5C4    je          0043C5E8
 0043C5C6    cmp         dword ptr [eax+17C],0
>0043C5CD    je          0043C5E8
 0043C5CF    mov         dl,byte ptr [ebx+54]
 0043C5D2    push        edx
 0043C5D3    lea         edx,[ebx+44]
 0043C5D6    push        edx
 0043C5D7    mov         eax,dword ptr [eax+17C]
 0043C5DD    mov         ecx,dword ptr [ebx+58]
 0043C5E0    mov         edx,dword ptr [ebx+38]
 0043C5E3    mov         ebx,dword ptr [eax]
 0043C5E5    call        dword ptr [ebx+24]
 0043C5E8    add         esp,14
 0043C5EB    pop         ebp
 0043C5EC    pop         edi
 0043C5ED    pop         esi
 0043C5EE    pop         ebx
 0043C5EF    ret
*}
end;

//0043C5F0
procedure TControl.DockTrackNoTarget(Source:TDragDockObject; X:Integer; Y:Integer);
begin
{*
 0043C5F0    push        ebp
 0043C5F1    mov         ebp,esp
 0043C5F3    push        esi
 0043C5F4    mov         si,0FFD2
 0043C5F8    call        @CallDynaInst
 0043C5FD    pop         esi
 0043C5FE    pop         ebp
 0043C5FF    ret         4
*}
end;

//0043C604
procedure TControl.DoEndDock(Target:TObject; X:Integer; Y:Integer);
begin
{*
 0043C604    push        ebp
 0043C605    mov         ebp,esp
 0043C607    push        ebx
 0043C608    cmp         word ptr [eax+10A],0
>0043C610    je          0043C629
 0043C612    push        ecx
 0043C613    mov         ecx,dword ptr [ebp+8]
 0043C616    push        ecx
 0043C617    mov         ebx,eax
 0043C619    mov         ecx,edx
 0043C61B    mov         edx,eax
 0043C61D    mov         eax,dword ptr [ebx+10C]
 0043C623    call        dword ptr [ebx+108]
 0043C629    pop         ebx
 0043C62A    pop         ebp
 0043C62B    ret         4
*}
end;

//0043C630
procedure TControl.DoStartDock(var DragObject:TDragObject);
begin
{*
 0043C630    push        ebx
 0043C631    cmp         word ptr [eax+102],0
>0043C639    je          0043C64D
 0043C63B    mov         ecx,edx
 0043C63D    mov         ebx,eax
 0043C63F    mov         edx,eax
 0043C641    mov         eax,dword ptr [ebx+104]
 0043C647    call        dword ptr [ebx+100]
 0043C64D    pop         ebx
 0043C64E    ret
*}
end;

//0043C650
procedure TControl.DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);
begin
{*
 0043C650    push        ebp
 0043C651    mov         ebp,esp
 0043C653    add         esp,0FFFFFFF4
 0043C656    push        ebx
 0043C657    push        esi
 0043C658    push        edi
 0043C659    mov         esi,dword ptr [ebp+8]
 0043C65C    lea         edi,[ebp-9]
 0043C65F    movs        dword ptr [edi],dword ptr [esi]
 0043C660    movs        dword ptr [edi],dword ptr [esi]
 0043C661    mov         esi,ecx
 0043C663    mov         byte ptr [ebp-1],dl
 0043C666    mov         ebx,eax
 0043C668    mov         byte ptr [ebp-0A],0
 0043C66C    cmp         word ptr [ebx+13A],0
>0043C674    je          0043C690
 0043C676    push        esi
 0043C677    lea         eax,[ebp-9]
 0043C67A    push        eax
 0043C67B    lea         eax,[ebp-0A]
 0043C67E    push        eax
 0043C67F    mov         cl,byte ptr [ebp-1]
 0043C682    mov         edx,ebx
 0043C684    mov         eax,dword ptr [ebx+13C]
 0043C68A    call        dword ptr [ebx+138]
 0043C690    cmp         byte ptr [ebp-0A],0
>0043C694    jne         0043C707
 0043C696    add         dword ptr [ebx+0A4],esi
>0043C69C    jmp         0043C6F5
 0043C69E    test        ecx,ecx
 0043C6A0    setl        al
 0043C6A3    mov         ecx,eax
 0043C6A5    mov         eax,dword ptr [ebx+0A4]
 0043C6AB    cdq
 0043C6AC    xor         eax,edx
 0043C6AE    sub         eax,edx
 0043C6B0    mov         esi,eax
 0043C6B2    sub         esi,78
 0043C6B5    mov         dword ptr [ebx+0A4],esi
 0043C6BB    test        cl,cl
>0043C6BD    je          0043C6E1
 0043C6BF    test        esi,esi
>0043C6C1    je          0043C6CB
 0043C6C3    neg         esi
 0043C6C5    mov         dword ptr [ebx+0A4],esi
 0043C6CB    lea         ecx,[ebp-9]
 0043C6CE    mov         dl,byte ptr [ebp-1]
 0043C6D1    mov         eax,ebx
 0043C6D3    mov         si,0FFE1
 0043C6D7    call        @CallDynaInst
 0043C6DC    mov         byte ptr [ebp-0A],al
>0043C6DF    jmp         0043C6F5
 0043C6E1    lea         ecx,[ebp-9]
 0043C6E4    mov         dl,byte ptr [ebp-1]
 0043C6E7    mov         eax,ebx
 0043C6E9    mov         si,0FFE0
 0043C6ED    call        @CallDynaInst
 0043C6F2    mov         byte ptr [ebp-0A],al
 0043C6F5    mov         ecx,dword ptr [ebx+0A4]
 0043C6FB    mov         eax,ecx
 0043C6FD    cdq
 0043C6FE    xor         eax,edx
 0043C700    sub         eax,edx
 0043C702    cmp         eax,78
>0043C705    jge         0043C69E
 0043C707    mov         al,byte ptr [ebp-0A]
 0043C70A    pop         edi
 0043C70B    pop         esi
 0043C70C    pop         ebx
 0043C70D    mov         esp,ebp
 0043C70F    pop         ebp
 0043C710    ret         4
*}
end;

//0043C714
procedure TControl.DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);
begin
{*
 0043C714    push        ebx
 0043C715    push        esi
 0043C716    push        edi
 0043C717    add         esp,0FFFFFFF4
 0043C71A    mov         esi,ecx
 0043C71C    lea         edi,[esp+1]
 0043C720    movs        dword ptr [edi],dword ptr [esi]
 0043C721    movs        dword ptr [edi],dword ptr [esi]
 0043C722    mov         byte ptr [esp],dl
 0043C725    mov         byte ptr [esp+9],0
 0043C72A    cmp         word ptr [eax+142],0
>0043C732    je          0043C752
 0043C734    lea         edx,[esp+1]
 0043C738    push        edx
 0043C739    lea         edx,[esp+0D]
 0043C73D    push        edx
 0043C73E    mov         ebx,eax
 0043C740    mov         cl,byte ptr [esp+8]
 0043C744    mov         edx,eax
 0043C746    mov         eax,dword ptr [ebx+144]
 0043C74C    call        dword ptr [ebx+140]
 0043C752    mov         al,byte ptr [esp+9]
 0043C756    add         esp,0C
 0043C759    pop         edi
 0043C75A    pop         esi
 0043C75B    pop         ebx
 0043C75C    ret
*}
end;

//0043C760
procedure TControl.DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);
begin
{*
 0043C760    push        ebx
 0043C761    push        esi
 0043C762    push        edi
 0043C763    add         esp,0FFFFFFF4
 0043C766    mov         esi,ecx
 0043C768    lea         edi,[esp+1]
 0043C76C    movs        dword ptr [edi],dword ptr [esi]
 0043C76D    movs        dword ptr [edi],dword ptr [esi]
 0043C76E    mov         byte ptr [esp],dl
 0043C771    mov         byte ptr [esp+9],0
 0043C776    cmp         word ptr [eax+14A],0
>0043C77E    je          0043C79E
 0043C780    lea         edx,[esp+1]
 0043C784    push        edx
 0043C785    lea         edx,[esp+0D]
 0043C789    push        edx
 0043C78A    mov         ebx,eax
 0043C78C    mov         cl,byte ptr [esp+8]
 0043C790    mov         edx,eax
 0043C792    mov         eax,dword ptr [ebx+14C]
 0043C798    call        dword ptr [ebx+148]
 0043C79E    mov         al,byte ptr [esp+9]
 0043C7A2    add         esp,0C
 0043C7A5    pop         edi
 0043C7A6    pop         esi
 0043C7A7    pop         ebx
 0043C7A8    ret
*}
end;

//0043C7AC
procedure TControl.DefaultDockImage(DragDockObject:TDragDockObject; Erase:Boolean);
begin
{*
 0043C7AC    push        ebp
 0043C7AD    mov         ebp,esp
 0043C7AF    add         esp,0FFFFFFE0
 0043C7B2    push        ebx
 0043C7B3    push        esi
 0043C7B4    push        edi
 0043C7B5    mov         byte ptr [ebp-1],cl
 0043C7B8    mov         esi,edx
 0043C7BA    mov         eax,esi
 0043C7BC    mov         edx,dword ptr [eax]
 0043C7BE    call        dword ptr [edx+38]
 0043C7C1    mov         ebx,eax
 0043C7C3    cmp         byte ptr [ebp-1],0
>0043C7C7    je          0043C7D7
 0043C7C9    push        esi
 0043C7CA    add         esi,5C
 0043C7CD    lea         edi,[ebp-20]
 0043C7D0    movs        dword ptr [edi],dword ptr [esi]
 0043C7D1    movs        dword ptr [edi],dword ptr [esi]
 0043C7D2    movs        dword ptr [edi],dword ptr [esi]
 0043C7D3    movs        dword ptr [edi],dword ptr [esi]
 0043C7D4    pop         esi
>0043C7D5    jmp         0043C7E3
 0043C7D7    push        esi
 0043C7D8    add         esi,44
 0043C7DB    lea         edi,[ebp-20]
 0043C7DE    movs        dword ptr [edi],dword ptr [esi]
 0043C7DF    movs        dword ptr [edi],dword ptr [esi]
 0043C7E0    movs        dword ptr [edi],dword ptr [esi]
 0043C7E1    movs        dword ptr [edi],dword ptr [esi]
 0043C7E2    pop         esi
 0043C7E3    call        user32.GetDesktopWindow
 0043C7E8    mov         dword ptr [ebp-8],eax
 0043C7EB    push        402
 0043C7F0    push        0
 0043C7F2    mov         eax,dword ptr [ebp-8]
 0043C7F5    push        eax
 0043C7F6    call        user32.GetDCEx
 0043C7FB    mov         dword ptr [ebp-0C],eax
 0043C7FE    xor         eax,eax
 0043C800    push        ebp
 0043C801    push        43C8C7
 0043C806    push        dword ptr fs:[eax]
 0043C809    mov         dword ptr fs:[eax],esp
 0043C80C    mov         eax,dword ptr [esi+40]
 0043C80F    call        TBrush.GetHandle
 0043C814    push        eax
 0043C815    mov         eax,dword ptr [ebp-0C]
 0043C818    push        eax
 0043C819    call        gdi32.SelectObject
 0043C81E    mov         dword ptr [ebp-10],eax
 0043C821    push        5A0049
 0043C826    push        ebx
 0043C827    mov         eax,dword ptr [ebp-18]
 0043C82A    mov         esi,dword ptr [ebp-20]
 0043C82D    sub         eax,esi
 0043C82F    sub         eax,ebx
 0043C831    push        eax
 0043C832    mov         edi,dword ptr [ebp-1C]
 0043C835    push        edi
 0043C836    mov         eax,esi
 0043C838    add         eax,ebx
 0043C83A    push        eax
 0043C83B    mov         eax,dword ptr [ebp-0C]
 0043C83E    push        eax
 0043C83F    call        gdi32.PatBlt
 0043C844    push        5A0049
 0043C849    mov         eax,dword ptr [ebp-14]
 0043C84C    sub         eax,edi
 0043C84E    sub         eax,ebx
 0043C850    push        eax
 0043C851    push        ebx
 0043C852    mov         eax,edi
 0043C854    add         eax,ebx
 0043C856    push        eax
 0043C857    mov         eax,dword ptr [ebp-18]
 0043C85A    sub         eax,ebx
 0043C85C    push        eax
 0043C85D    mov         eax,dword ptr [ebp-0C]
 0043C860    push        eax
 0043C861    call        gdi32.PatBlt
 0043C866    push        5A0049
 0043C86B    push        ebx
 0043C86C    mov         eax,dword ptr [ebp-18]
 0043C86F    sub         eax,dword ptr [ebp-20]
 0043C872    sub         eax,ebx
 0043C874    push        eax
 0043C875    mov         eax,dword ptr [ebp-14]
 0043C878    sub         eax,ebx
 0043C87A    push        eax
 0043C87B    push        esi
 0043C87C    mov         eax,dword ptr [ebp-0C]
 0043C87F    push        eax
 0043C880    call        gdi32.PatBlt
 0043C885    push        5A0049
 0043C88A    mov         eax,dword ptr [ebp-14]
 0043C88D    sub         eax,dword ptr [ebp-1C]
 0043C890    sub         eax,ebx
 0043C892    push        eax
 0043C893    push        ebx
 0043C894    push        edi
 0043C895    push        esi
 0043C896    mov         eax,dword ptr [ebp-0C]
 0043C899    push        eax
 0043C89A    call        gdi32.PatBlt
 0043C89F    mov         eax,dword ptr [ebp-10]
 0043C8A2    push        eax
 0043C8A3    mov         eax,dword ptr [ebp-0C]
 0043C8A6    push        eax
 0043C8A7    call        gdi32.SelectObject
 0043C8AC    xor         eax,eax
 0043C8AE    pop         edx
 0043C8AF    pop         ecx
 0043C8B0    pop         ecx
 0043C8B1    mov         dword ptr fs:[eax],edx
 0043C8B4    push        43C8CE
 0043C8B9    mov         eax,dword ptr [ebp-0C]
 0043C8BC    push        eax
 0043C8BD    mov         eax,dword ptr [ebp-8]
 0043C8C0    push        eax
 0043C8C1    call        user32.ReleaseDC
 0043C8C6    ret
>0043C8C7    jmp         @HandleFinally
>0043C8CC    jmp         0043C8B9
 0043C8CE    pop         edi
 0043C8CF    pop         esi
 0043C8D0    pop         ebx
 0043C8D1    mov         esp,ebp
 0043C8D3    pop         ebp
 0043C8D4    ret
*}
end;

//0043C8D8
procedure TControl.DrawDragDockImage(DragDockObject:TDragDockObject);
begin
{*
 0043C8D8    push        esi
 0043C8D9    mov         esi,eax
 0043C8DB    xor         ecx,ecx
 0043C8DD    mov         eax,esi
 0043C8DF    mov         si,0FFE8
 0043C8E3    call        @CallDynaInst
 0043C8E8    pop         esi
 0043C8E9    ret
*}
end;

//0043C8EC
procedure TControl.EraseDragDockImage(DragDockObject:TDragDockObject);
begin
{*
 0043C8EC    push        esi
 0043C8ED    mov         esi,eax
 0043C8EF    mov         cl,1
 0043C8F1    mov         eax,esi
 0043C8F3    mov         si,0FFE8
 0043C8F7    call        @CallDynaInst
 0043C8FC    pop         esi
 0043C8FD    ret
*}
end;

//0043C900
procedure TControl.DoDragMsg(var DragMsg:TCMDrag);
begin
{*
 0043C900    push        ebx
 0043C901    push        esi
 0043C902    push        edi
 0043C903    push        ebp
 0043C904    add         esp,0FFFFFFF0
 0043C907    mov         edi,edx
 0043C909    mov         dword ptr [esp],eax
 0043C90C    mov         ebp,dword ptr [edi+8]
 0043C90F    mov         esi,dword ptr [ebp+8]
 0043C912    mov         eax,esi
 0043C914    mov         edx,dword ptr ds:[436E74];TDragDockObject
 0043C91A    call        @IsClass
 0043C91F    mov         ebx,eax
 0043C921    cmp         byte ptr ds:[5E0C30],0;DragInternalObject:Boolean
>0043C928    je          0043C93E
 0043C92A    test        bl,bl
>0043C92C    jne         0043C93E
 0043C92E    mov         eax,esi
 0043C930    mov         edx,dword ptr ds:[436D58];TDragControlObject
 0043C936    call        @AsClass
 0043C93B    mov         esi,dword ptr [eax+38]
 0043C93E    lea         ecx,[esp+5]
 0043C942    mov         edx,ebp
 0043C944    mov         eax,dword ptr [esp]
 0043C947    call        TControl.ScreenToClient
 0043C94C    mov         al,byte ptr [edi+4]
 0043C94F    sub         al,3
>0043C951    jb          0043C95A
>0043C953    je          0043C9B1
>0043C955    jmp         0043C9E6
 0043C95A    mov         byte ptr [esp+4],1
 0043C95F    test        bl,bl
>0043C961    je          0043C985
 0043C963    mov         eax,dword ptr [esp+9]
 0043C967    push        eax
 0043C968    mov         al,byte ptr [edi+4]
 0043C96B    push        eax
 0043C96C    lea         eax,[esp+0C]
 0043C970    push        eax
 0043C971    mov         ecx,dword ptr [esp+11]
 0043C975    mov         edx,esi
 0043C977    mov         eax,dword ptr [ebp+0C]
 0043C97A    mov         si,0FFC4
 0043C97E    call        @CallDynaInst
>0043C983    jmp         0043C9A6
 0043C985    mov         eax,dword ptr [esp+9]
 0043C989    push        eax
 0043C98A    mov         al,byte ptr [edi+4]
 0043C98D    push        eax
 0043C98E    lea         eax,[esp+0C]
 0043C992    push        eax
 0043C993    mov         ecx,dword ptr [esp+11]
 0043C997    mov         edx,esi
 0043C999    mov         eax,dword ptr [esp+0C]
 0043C99D    mov         si,0FFDE
 0043C9A1    call        @CallDynaInst
 0043C9A6    xor         eax,eax
 0043C9A8    mov         al,byte ptr [esp+4]
 0043C9AC    mov         dword ptr [edi+0C],eax
>0043C9AF    jmp         0043C9E6
 0043C9B1    test        bl,bl
>0043C9B3    je          0043C9CE
 0043C9B5    mov         eax,dword ptr [esp+9]
 0043C9B9    push        eax
 0043C9BA    mov         ecx,dword ptr [esp+9]
 0043C9BE    mov         edx,esi
 0043C9C0    mov         eax,dword ptr [ebp+0C]
 0043C9C3    mov         si,0FFB7
 0043C9C7    call        @CallDynaInst
>0043C9CC    jmp         0043C9E6
 0043C9CE    mov         eax,dword ptr [esp+9]
 0043C9D2    push        eax
 0043C9D3    mov         ecx,dword ptr [esp+9]
 0043C9D7    mov         edx,esi
 0043C9D9    mov         eax,dword ptr [esp+4]
 0043C9DD    mov         si,0FFCB
 0043C9E1    call        @CallDynaInst
 0043C9E6    add         esp,10
 0043C9E9    pop         ebp
 0043C9EA    pop         edi
 0043C9EB    pop         esi
 0043C9EC    pop         ebx
 0043C9ED    ret
*}
end;

//0043C9F0
function TControl.ManualDock(NewDockSite:TWinControl; DropControl:TControl; ControlSide:TAlign):Boolean;
begin
{*
 0043C9F0    push        ebp
 0043C9F1    mov         ebp,esp
 0043C9F3    add         esp,0FFFFFFCC
 0043C9F6    push        ebx
 0043C9F7    push        esi
 0043C9F8    push        edi
 0043C9F9    mov         dword ptr [ebp-4],ecx
 0043C9FC    mov         edi,edx
 0043C9FE    mov         ebx,eax
 0043CA00    test        edi,edi
>0043CA02    je          0043CA0D
 0043CA04    cmp         edi,0FFFFFFFF
>0043CA07    jne         0043CACA
 0043CA0D    mov         eax,dword ptr [ebx+0A0]
 0043CA13    test        eax,eax
>0043CA15    je          0043CA54
 0043CA17    cmp         byte ptr [eax+1A7],0
>0043CA1E    je          0043CA54
 0043CA20    cmp         dword ptr [eax+17C],0
>0043CA27    je          0043CA54
 0043CA29    lea         ecx,[ebp-1C]
 0043CA2C    mov         eax,dword ptr [eax+17C]
 0043CA32    mov         edx,ebx
 0043CA34    mov         esi,dword ptr [eax]
 0043CA36    call        dword ptr [esi+14]
 0043CA39    push        2
 0043CA3B    lea         eax,[ebp-1C]
 0043CA3E    push        eax
 0043CA3F    push        0
 0043CA41    mov         eax,dword ptr [ebx+0A0]
 0043CA47    call        TWinControl.GetHandle
 0043CA4C    push        eax
 0043CA4D    call        user32.MapWindowPoints
>0043CA52    jmp         0043CA8E
 0043CA54    lea         ecx,[ebp-24]
 0043CA57    mov         edx,dword ptr [ebx+44]
 0043CA5A    mov         eax,dword ptr [ebx+40]
 0043CA5D    call        Point
 0043CA62    mov         eax,dword ptr [ebp-24]
 0043CA65    mov         dword ptr [ebp-1C],eax
 0043CA68    mov         eax,dword ptr [ebp-20]
 0043CA6B    mov         dword ptr [ebp-18],eax
 0043CA6E    mov         esi,dword ptr [ebx+30]
 0043CA71    test        esi,esi
>0043CA73    je          0043CA8E
 0043CA75    lea         ecx,[ebp-24]
 0043CA78    lea         edx,[ebp-1C]
 0043CA7B    mov         eax,esi
 0043CA7D    call        TControl.ClientToScreen
 0043CA82    mov         eax,dword ptr [ebp-24]
 0043CA85    mov         dword ptr [ebp-1C],eax
 0043CA88    mov         eax,dword ptr [ebp-20]
 0043CA8B    mov         dword ptr [ebp-18],eax
 0043CA8E    mov         eax,ebx
 0043CA90    call        TControl.GetUndockHeight
 0043CA95    push        eax
 0043CA96    lea         eax,[ebp-34]
 0043CA99    push        eax
 0043CA9A    mov         eax,ebx
 0043CA9C    call        TControl.GetUndockWidth
 0043CAA1    mov         ecx,eax
 0043CAA3    mov         edx,dword ptr [ebp-18]
 0043CAA6    mov         eax,dword ptr [ebp-1C]
 0043CAA9    call        Rect
 0043CAAE    lea         esi,[ebp-34]
 0043CAB1    lea         edi,[ebp-1C]
 0043CAB4    movs        dword ptr [edi],dword ptr [esi]
 0043CAB5    movs        dword ptr [edi],dword ptr [esi]
 0043CAB6    movs        dword ptr [edi],dword ptr [esi]
 0043CAB7    movs        dword ptr [edi],dword ptr [esi]
 0043CAB8    lea         edx,[ebp-1C]
 0043CABB    mov         eax,ebx
 0043CABD    call        TControl.ManualFloat
 0043CAC2    mov         byte ptr [ebp-5],al
>0043CAC5    jmp         0043CBC2
 0043CACA    mov         eax,ebx
 0043CACC    call        TControl.CalcDockSizes
 0043CAD1    cmp         dword ptr [ebx+0A0],0
>0043CAD8    je          0043CAF5
 0043CADA    mov         eax,dword ptr [ebx+0A0]
 0043CAE0    mov         ecx,ebx
 0043CAE2    mov         edx,edi
 0043CAE4    mov         si,0FFBE
 0043CAE8    call        @CallDynaInst
 0043CAED    test        al,al
>0043CAEF    jne         0043CAF5
 0043CAF1    xor         eax,eax
>0043CAF3    jmp         0043CAF7
 0043CAF5    mov         al,1
 0043CAF7    mov         byte ptr [ebp-5],al
 0043CAFA    cmp         byte ptr [ebp-5],0
>0043CAFE    je          0043CBC2
 0043CB04    mov         ecx,ebx
 0043CB06    mov         dl,1
 0043CB08    mov         eax,[00436E74];TDragDockObject
 0043CB0D    call        TDragDockObject.Create
 0043CB12    mov         dword ptr [ebp-0C],eax
 0043CB15    xor         edx,edx
 0043CB17    push        ebp
 0043CB18    push        43CBBB
 0043CB1D    push        dword ptr fs:[edx]
 0043CB20    mov         dword ptr fs:[edx],esp
 0043CB23    mov         eax,dword ptr [ebx+0A0]
 0043CB29    test        eax,eax
>0043CB2B    je          0043CB36
 0043CB2D    call        TWinControl.GetHandle
 0043CB32    mov         esi,eax
>0043CB34    jmp         0043CB38
 0043CB36    xor         esi,esi
 0043CB38    lea         edx,[ebp-1C]
 0043CB3B    mov         eax,ebx
 0043CB3D    call        TControl.GetBoundsRect
 0043CB42    test        esi,esi
>0043CB44    je          0043CB54
 0043CB46    push        2
 0043CB48    lea         eax,[ebp-1C]
 0043CB4B    push        eax
 0043CB4C    push        0
 0043CB4E    push        esi
 0043CB4F    call        user32.MapWindowPoints
 0043CB54    mov         eax,dword ptr [ebp-0C]
 0043CB57    mov         dword ptr [eax+4],edi
 0043CB5A    mov         eax,dword ptr [ebp-0C]
 0043CB5D    mov         dl,byte ptr [ebp+8]
 0043CB60    mov         byte ptr [eax+54],dl
 0043CB63    mov         eax,dword ptr [ebp-0C]
 0043CB66    mov         edx,dword ptr [ebp-4]
 0043CB69    mov         dword ptr [eax+58],edx
 0043CB6C    mov         eax,dword ptr [ebp-0C]
 0043CB6F    push        edi
 0043CB70    lea         edi,[eax+44]
 0043CB73    lea         esi,[ebp-1C]
 0043CB76    movs        dword ptr [edi],dword ptr [esi]
 0043CB77    movs        dword ptr [edi],dword ptr [esi]
 0043CB78    movs        dword ptr [edi],dword ptr [esi]
 0043CB79    movs        dword ptr [edi],dword ptr [esi]
 0043CB7A    pop         edi
 0043CB7B    push        1
 0043CB7D    lea         eax,[ebp-1C]
 0043CB80    push        eax
 0043CB81    mov         eax,edi
 0043CB83    call        TWinControl.GetHandle
 0043CB88    push        eax
 0043CB89    push        0
 0043CB8B    call        user32.MapWindowPoints
 0043CB90    mov         eax,dword ptr [ebp-18]
 0043CB93    push        eax
 0043CB94    mov         ecx,dword ptr [ebp-1C]
 0043CB97    mov         edx,dword ptr [ebp-0C]
 0043CB9A    mov         eax,edi
 0043CB9C    mov         si,0FFB7
 0043CBA0    call        @CallDynaInst
 0043CBA5    xor         eax,eax
 0043CBA7    pop         edx
 0043CBA8    pop         ecx
 0043CBA9    pop         ecx
 0043CBAA    mov         dword ptr fs:[eax],edx
 0043CBAD    push        43CBC2
 0043CBB2    mov         eax,dword ptr [ebp-0C]
 0043CBB5    call        TObject.Free
 0043CBBA    ret
>0043CBBB    jmp         @HandleFinally
>0043CBC0    jmp         0043CBB2
 0043CBC2    mov         al,byte ptr [ebp-5]
 0043CBC5    pop         edi
 0043CBC6    pop         esi
 0043CBC7    pop         ebx
 0043CBC8    mov         esp,ebp
 0043CBCA    pop         ebp
 0043CBCB    ret         4
*}
end;

//0043CBD0
function TControl.ManualFloat(ScreenPos:TRect):Boolean;
begin
{*
 0043CBD0    push        ebx
 0043CBD1    push        esi
 0043CBD2    push        edi
 0043CBD3    add         esp,0FFFFFFE0
 0043CBD6    mov         esi,edx
 0043CBD8    lea         edi,[esp]
 0043CBDB    movs        dword ptr [edi],dword ptr [esi]
 0043CBDC    movs        dword ptr [edi],dword ptr [esi]
 0043CBDD    movs        dword ptr [edi],dword ptr [esi]
 0043CBDE    movs        dword ptr [edi],dword ptr [esi]
 0043CBDF    mov         edi,eax
 0043CBE1    mov         ebx,dword ptr [edi+0A0]
 0043CBE7    test        ebx,ebx
>0043CBE9    je          0043CC02
 0043CBEB    mov         ecx,edi
 0043CBED    xor         edx,edx
 0043CBEF    mov         eax,ebx
 0043CBF1    mov         si,0FFBE
 0043CBF5    call        @CallDynaInst
 0043CBFA    test        al,al
>0043CBFC    jne         0043CC02
 0043CBFE    xor         eax,eax
>0043CC00    jmp         0043CC04
 0043CC02    mov         al,1
 0043CC04    mov         ebx,eax
 0043CC06    test        bl,bl
>0043CC08    je          0043CC5A
 0043CC0A    mov         edx,esp
 0043CC0C    mov         eax,edi
 0043CC0E    call        TControl.CreateFloatingDockSite
 0043CC13    mov         esi,eax
 0043CC15    test        esi,esi
>0043CC17    je          0043CC4B
 0043CC19    mov         eax,esi
 0043CC1B    call        TControl.GetClientHeight
 0043CC20    push        eax
 0043CC21    lea         eax,[esp+14]
 0043CC25    push        eax
 0043CC26    mov         eax,esi
 0043CC28    call        TControl.GetClientWidth
 0043CC2D    mov         ecx,eax
 0043CC2F    xor         edx,edx
 0043CC31    xor         eax,eax
 0043CC33    call        Bounds
 0043CC38    lea         ecx,[esp+10]
 0043CC3C    mov         edx,esi
 0043CC3E    mov         eax,edi
 0043CC40    mov         si,0FFCC
 0043CC44    call        @CallDynaInst
>0043CC49    jmp         0043CC5A
 0043CC4B    mov         ecx,esp
 0043CC4D    mov         edx,esi
 0043CC4F    mov         eax,edi
 0043CC51    mov         si,0FFCC
 0043CC55    call        @CallDynaInst
 0043CC5A    mov         eax,ebx
 0043CC5C    add         esp,20
 0043CC5F    pop         edi
 0043CC60    pop         esi
 0043CC61    pop         ebx
 0043CC62    ret
*}
end;

//0043CC64
procedure TControl.DoConstraintsChange(Sender:TObject);
begin
{*
 0043CC64    push        esi
 0043CC65    mov         si,0FFEE
 0043CC69    call        @CallDynaInst
 0043CC6E    pop         esi
 0043CC6F    ret
*}
end;

//0043CC70
{*function sub_0043CC70:?;
begin
 0043CC70    mov         al,1
 0043CC72    ret
end;*}

//0043CC74
function TControl.CanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 0043CC74    push        ebx
 0043CC75    push        ecx
 0043CC76    mov         byte ptr [esp],1
 0043CC7A    cmp         word ptr [eax+0C2],0
>0043CC82    je          0043CC9C
 0043CC84    push        ecx
 0043CC85    lea         ecx,[esp+4]
 0043CC89    push        ecx
 0043CC8A    mov         ecx,edx
 0043CC8C    mov         ebx,eax
 0043CC8E    mov         edx,eax
 0043CC90    mov         eax,dword ptr [ebx+0C4]
 0043CC96    call        dword ptr [ebx+0C0]
 0043CC9C    mov         al,byte ptr [esp]
 0043CC9F    pop         edx
 0043CCA0    pop         ebx
 0043CCA1    ret
*}
end;

//0043CCA4
function TControl.DoCanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 0043CCA4    push        ebx
 0043CCA5    push        esi
 0043CCA6    add         esp,0FFFFFFF0
 0043CCA9    mov         dword ptr [esp+4],ecx
 0043CCAD    mov         dword ptr [esp],edx
 0043CCB0    mov         esi,eax
 0043CCB2    cmp         byte ptr [esi+5B],5
>0043CCB6    je          0043CD05
 0043CCB8    mov         eax,dword ptr [esp]
 0043CCBB    mov         eax,dword ptr [eax]
 0043CCBD    mov         dword ptr [esp+8],eax
 0043CCC1    mov         eax,dword ptr [esp+4]
 0043CCC5    mov         eax,dword ptr [eax]
 0043CCC7    mov         dword ptr [esp+0C],eax
 0043CCCB    lea         ecx,[esp+0C]
 0043CCCF    lea         edx,[esp+8]
 0043CCD3    mov         eax,esi
 0043CCD5    mov         ebx,dword ptr [eax]
 0043CCD7    call        dword ptr [ebx+34]
 0043CCDA    mov         dl,byte ptr [esi+5B]
 0043CCDD    mov         ecx,edx
 0043CCDF    test        cl,cl
>0043CCE1    je          0043CCEB
 0043CCE3    add         cl,0FD
 0043CCE6    sub         cl,2
>0043CCE9    jae         0043CCF4
 0043CCEB    mov         ecx,dword ptr [esp]
 0043CCEE    mov         ebx,dword ptr [esp+8]
 0043CCF2    mov         dword ptr [ecx],ebx
 0043CCF4    sub         dl,3
>0043CCF7    jae         0043CD07
 0043CCF9    mov         edx,dword ptr [esp+4]
 0043CCFD    mov         ecx,dword ptr [esp+0C]
 0043CD01    mov         dword ptr [edx],ecx
>0043CD03    jmp         0043CD07
 0043CD05    mov         al,1
 0043CD07    add         esp,10
 0043CD0A    pop         esi
 0043CD0B    pop         ebx
 0043CD0C    ret
*}
end;

//0043CD10
function TControl.DoCanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 0043CD10    push        ebx
 0043CD11    push        esi
 0043CD12    push        edi
 0043CD13    push        ecx
 0043CD14    mov         dword ptr [esp],ecx
 0043CD17    mov         edi,edx
 0043CD19    mov         esi,eax
 0043CD1B    mov         ecx,dword ptr [esp]
 0043CD1E    mov         edx,edi
 0043CD20    mov         eax,esi
 0043CD22    mov         ebx,dword ptr [eax]
 0043CD24    call        dword ptr [ebx+30]
 0043CD27    mov         ebx,eax
 0043CD29    test        bl,bl
>0043CD2B    je          0043CD39
 0043CD2D    mov         ecx,dword ptr [esp]
 0043CD30    mov         edx,edi
 0043CD32    mov         eax,esi
 0043CD34    call        TControl.DoConstrainedResize
 0043CD39    mov         eax,ebx
 0043CD3B    pop         edx
 0043CD3C    pop         edi
 0043CD3D    pop         esi
 0043CD3E    pop         ebx
 0043CD3F    ret
*}
end;

//0043CD40
procedure TControl.ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 0043CD40    push        ebp
 0043CD41    mov         ebp,esp
 0043CD43    push        ebx
 0043CD44    cmp         word ptr [eax+0CA],0
>0043CD4C    je          0043CD69
 0043CD4E    push        ecx
 0043CD4F    mov         ecx,dword ptr [ebp+0C]
 0043CD52    push        ecx
 0043CD53    mov         ecx,dword ptr [ebp+8]
 0043CD56    push        ecx
 0043CD57    mov         ecx,edx
 0043CD59    mov         ebx,eax
 0043CD5B    mov         edx,eax
 0043CD5D    mov         eax,dword ptr [ebx+0CC]
 0043CD63    call        dword ptr [ebx+0C8]
 0043CD69    pop         ebx
 0043CD6A    pop         ebp
 0043CD6B    ret         8
*}
end;

//0043CD70
function TControl.CalcCursorPos:TPoint;
begin
{*
 0043CD70    push        ebx
 0043CD71    push        esi
 0043CD72    add         esp,0FFFFFFF8
 0043CD75    mov         ebx,edx
 0043CD77    mov         esi,eax
 0043CD79    push        ebx
 0043CD7A    call        user32.GetCursorPos
 0043CD7F    mov         ecx,esp
 0043CD81    mov         edx,ebx
 0043CD83    mov         eax,esi
 0043CD85    call        TControl.ScreenToClient
 0043CD8A    mov         eax,dword ptr [esp]
 0043CD8D    mov         dword ptr [ebx],eax
 0043CD8F    mov         eax,dword ptr [esp+4]
 0043CD93    mov         dword ptr [ebx+4],eax
 0043CD96    pop         ecx
 0043CD97    pop         edx
 0043CD98    pop         esi
 0043CD99    pop         ebx
 0043CD9A    ret
*}
end;

//0043CD9C
procedure TControl.DesignWndProc(var Message:TMessage);
begin
{*
 0043CD9C    push        esi
 0043CD9D    test        byte ptr [eax+50],4
>0043CDA1    je          0043CDC5
 0043CDA3    mov         esi,dword ptr [edx]
 0043CDA5    cmp         esi,204
>0043CDAB    je          0043CDC9
 0043CDAD    cmp         esi,205
>0043CDB3    je          0043CDC9
 0043CDB5    cmp         esi,200
>0043CDBB    je          0043CDC9
 0043CDBD    cmp         esi,206
>0043CDC3    je          0043CDC9
 0043CDC5    xor         eax,eax
 0043CDC7    pop         esi
 0043CDC8    ret
 0043CDC9    mov         al,1
 0043CDCB    pop         esi
 0043CDCC    ret
*}
end;

//0043CDD0
procedure TControl.DoConstrainedResize(var NewWidth:Integer; var NewHeight:Integer);
begin
{*
 0043CDD0    push        ebx
 0043CDD1    push        esi
 0043CDD2    push        edi
 0043CDD3    add         esp,0FFFFFFF0
 0043CDD6    mov         edi,ecx
 0043CDD8    mov         esi,edx
 0043CDDA    mov         edx,dword ptr [eax+74]
 0043CDDD    mov         edx,dword ptr [edx+14]
 0043CDE0    test        edx,edx
>0043CDE2    jbe         0043CDE9
 0043CDE4    mov         dword ptr [esp],edx
>0043CDE7    jmp         0043CDEE
 0043CDE9    xor         edx,edx
 0043CDEB    mov         dword ptr [esp],edx
 0043CDEE    mov         edx,dword ptr [eax+74]
 0043CDF1    mov         edx,dword ptr [edx+10]
 0043CDF4    test        edx,edx
>0043CDF6    jbe         0043CDFE
 0043CDF8    mov         dword ptr [esp+4],edx
>0043CDFC    jmp         0043CE04
 0043CDFE    xor         edx,edx
 0043CE00    mov         dword ptr [esp+4],edx
 0043CE04    mov         edx,dword ptr [eax+74]
 0043CE07    mov         edx,dword ptr [edx+0C]
 0043CE0A    test        edx,edx
>0043CE0C    jbe         0043CE14
 0043CE0E    mov         dword ptr [esp+8],edx
>0043CE12    jmp         0043CE1A
 0043CE14    xor         edx,edx
 0043CE16    mov         dword ptr [esp+8],edx
 0043CE1A    mov         edx,dword ptr [eax+74]
 0043CE1D    mov         edx,dword ptr [edx+8]
 0043CE20    test        edx,edx
>0043CE22    jbe         0043CE2A
 0043CE24    mov         dword ptr [esp+0C],edx
>0043CE28    jmp         0043CE30
 0043CE2A    xor         edx,edx
 0043CE2C    mov         dword ptr [esp+0C],edx
 0043CE30    lea         edx,[esp+8]
 0043CE34    push        edx
 0043CE35    lea         edx,[esp+10]
 0043CE39    push        edx
 0043CE3A    lea         ecx,[esp+0C]
 0043CE3E    lea         edx,[esp+8]
 0043CE42    mov         ebx,dword ptr [eax]
 0043CE44    call        dword ptr [ebx+38]
 0043CE47    cmp         dword ptr [esp+8],0
>0043CE4C    jle         0043CE5E
 0043CE4E    mov         eax,dword ptr [esi]
 0043CE50    cmp         eax,dword ptr [esp+8]
>0043CE54    jle         0043CE5E
 0043CE56    mov         eax,dword ptr [esp+8]
 0043CE5A    mov         dword ptr [esi],eax
>0043CE5C    jmp         0043CE70
 0043CE5E    cmp         dword ptr [esp],0
>0043CE62    jle         0043CE70
 0043CE64    mov         eax,dword ptr [esi]
 0043CE66    cmp         eax,dword ptr [esp]
>0043CE69    jge         0043CE70
 0043CE6B    mov         eax,dword ptr [esp]
 0043CE6E    mov         dword ptr [esi],eax
 0043CE70    cmp         dword ptr [esp+0C],0
>0043CE75    jle         0043CE87
 0043CE77    mov         eax,dword ptr [edi]
 0043CE79    cmp         eax,dword ptr [esp+0C]
>0043CE7D    jle         0043CE87
 0043CE7F    mov         eax,dword ptr [esp+0C]
 0043CE83    mov         dword ptr [edi],eax
>0043CE85    jmp         0043CE9C
 0043CE87    cmp         dword ptr [esp+4],0
>0043CE8C    jle         0043CE9C
 0043CE8E    mov         eax,dword ptr [edi]
 0043CE90    cmp         eax,dword ptr [esp+4]
>0043CE94    jge         0043CE9C
 0043CE96    mov         eax,dword ptr [esp+4]
 0043CE9A    mov         dword ptr [edi],eax
 0043CE9C    add         esp,10
 0043CE9F    pop         edi
 0043CEA0    pop         esi
 0043CEA1    pop         ebx
 0043CEA2    ret
*}
end;

//0043CEA4
function TControl.Perform(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;
begin
{*
 0043CEA4    push        ebp
 0043CEA5    mov         ebp,esp
 0043CEA7    add         esp,0FFFFFFF0
 0043CEAA    push        ebx
 0043CEAB    mov         dword ptr [ebp-10],edx
 0043CEAE    mov         dword ptr [ebp-0C],ecx
 0043CEB1    mov         edx,dword ptr [ebp+8]
 0043CEB4    mov         dword ptr [ebp-8],edx
 0043CEB7    xor         edx,edx
 0043CEB9    mov         dword ptr [ebp-4],edx
 0043CEBC    test        eax,eax
>0043CEBE    je          0043CECB
 0043CEC0    lea         edx,[ebp-10]
 0043CEC3    mov         ebx,eax
 0043CEC5    mov         eax,dword ptr [ebx+3C]
 0043CEC8    call        dword ptr [ebx+38]
 0043CECB    mov         eax,dword ptr [ebp-4]
 0043CECE    pop         ebx
 0043CECF    mov         esp,ebp
 0043CED1    pop         ebp
 0043CED2    ret         4
*}
end;

//0043CED8
procedure TControl.CalcDockSizes;
begin
{*
 0043CED8    push        ebx
 0043CED9    mov         ebx,eax
 0043CEDB    mov         eax,ebx
 0043CEDD    mov         edx,dword ptr [eax]
 0043CEDF    call        dword ptr [edx+54]
 0043CEE2    test        al,al
>0043CEE4    je          0043CEFA
 0043CEE6    mov         eax,dword ptr [ebx+4C]
 0043CEE9    mov         dword ptr [ebx+0AC],eax
 0043CEEF    mov         eax,dword ptr [ebx+48]
 0043CEF2    mov         dword ptr [ebx+0A8],eax
 0043CEF8    pop         ebx
 0043CEF9    ret
 0043CEFA    cmp         dword ptr [ebx+0A0],0
>0043CF01    je          0043CF46
 0043CF03    cmp         byte ptr [ebx+9C],2
>0043CF0A    je          0043CF1A
 0043CF0C    mov         eax,dword ptr [ebx+0A0]
 0043CF12    mov         al,byte ptr [eax+5B]
 0043CF15    dec         eax
 0043CF16    sub         al,2
>0043CF18    jae         0043CF25
 0043CF1A    mov         eax,dword ptr [ebx+4C]
 0043CF1D    mov         dword ptr [ebx+0B4],eax
>0043CF23    jmp         0043CF46
 0043CF25    cmp         byte ptr [ebx+9C],1
>0043CF2C    je          0043CF3D
 0043CF2E    mov         eax,dword ptr [ebx+0A0]
 0043CF34    mov         al,byte ptr [eax+5B]
 0043CF37    add         al,0FD
 0043CF39    sub         al,2
>0043CF3B    jae         0043CF46
 0043CF3D    mov         eax,dword ptr [ebx+48]
 0043CF40    mov         dword ptr [ebx+0B0],eax
 0043CF46    pop         ebx
 0043CF47    ret
*}
end;

//0043CF48
procedure TControl.UpdateBoundsRect(const R:TRect);
begin
{*
 0043CF48    mov         ecx,dword ptr [edx]
 0043CF4A    mov         dword ptr [eax+40],ecx
 0043CF4D    mov         ecx,dword ptr [edx+4]
 0043CF50    mov         dword ptr [eax+44],ecx
 0043CF53    mov         ecx,dword ptr [edx+8]
 0043CF56    sub         ecx,dword ptr [edx]
 0043CF58    mov         dword ptr [eax+48],ecx
 0043CF5B    mov         ecx,dword ptr [edx+0C]
 0043CF5E    sub         ecx,dword ptr [edx+4]
 0043CF61    mov         dword ptr [eax+4C],ecx
 0043CF64    call        TControl.UpdateAnchorRules
 0043CF69    ret
*}
end;

//0043CF6C
procedure TControl.sub_0043CF6C;
begin
{*
 0043CF6C    ret
*}
end;

//0043CF70
procedure TControl.WndProc(var Message:TMessage);
begin
{*
 0043CF70    push        ebp
 0043CF71    mov         ebp,esp
 0043CF73    add         esp,0FFFFFEEC
 0043CF79    push        ebx
 0043CF7A    push        esi
 0043CF7B    push        edi
 0043CF7C    mov         ebx,edx
 0043CF7E    mov         esi,eax
 0043CF80    test        byte ptr [esi+1C],10
>0043CF84    je          0043CFBC
 0043CF86    mov         eax,esi
 0043CF88    call        GetParentForm
 0043CF8D    mov         dword ptr [ebp-14],eax
 0043CF90    cmp         dword ptr [ebp-14],0
>0043CF94    je          0043CFBC
 0043CF96    mov         eax,dword ptr [ebp-14]
 0043CF99    cmp         dword ptr [eax+250],0
>0043CFA0    je          0043CFBC
 0043CFA2    mov         ecx,ebx
 0043CFA4    mov         eax,dword ptr [ebp-14]
 0043CFA7    mov         eax,dword ptr [eax+250]
 0043CFAD    mov         edx,esi
 0043CFAF    mov         edi,dword ptr [eax]
 0043CFB1    call        dword ptr [edi+24]
 0043CFB4    test        al,al
>0043CFB6    jne         0043D0FB
 0043CFBC    mov         eax,dword ptr [ebx]
 0043CFBE    cmp         eax,100
>0043CFC3    jb          0043CFFC
 0043CFC5    cmp         eax,108
>0043CFCA    ja          0043CFFC
 0043CFCC    mov         eax,esi
 0043CFCE    call        GetParentForm
 0043CFD3    mov         dword ptr [ebp-14],eax
 0043CFD6    cmp         dword ptr [ebp-14],0
>0043CFDA    je          0043D0F2
 0043CFE0    mov         ecx,ebx
 0043CFE2    mov         edx,esi
 0043CFE4    mov         eax,dword ptr [ebp-14]
 0043CFE7    mov         edi,dword ptr [eax]
 0043CFE9    call        dword ptr [edi+0F0]
 0043CFEF    test        al,al
>0043CFF1    jne         0043D0FB
>0043CFF7    jmp         0043D0F2
 0043CFFC    mov         eax,dword ptr [ebx]
 0043CFFE    cmp         eax,200
>0043D003    jb          0043D0DB
 0043D009    cmp         eax,20A
>0043D00E    ja          0043D0DB
 0043D014    test        byte ptr [esi+50],80
>0043D018    jne         0043D02E
 0043D01A    sub         eax,203
>0043D01F    je          0043D02B
 0043D021    sub         eax,3
>0043D024    je          0043D02B
 0043D026    sub         eax,3
>0043D029    jne         0043D02E
 0043D02B    sub         dword ptr [ebx],2
 0043D02E    mov         eax,dword ptr [ebx]
 0043D030    sub         eax,200
>0043D035    je          0043D042
 0043D037    dec         eax
>0043D038    je          0043D057
 0043D03A    dec         eax
>0043D03B    je          0043D074
 0043D03D    dec         eax
>0043D03E    je          0043D057
>0043D040    jmp         0043D07B
 0043D042    mov         ecx,ebx
 0043D044    mov         eax,[005AE584];^Application:TApplication
 0043D049    mov         eax,dword ptr [eax]
 0043D04B    mov         edx,esi
 0043D04D    call        TApplication.HintMouseMessage
>0043D052    jmp         0043D0F2
 0043D057    cmp         byte ptr [esi+5D],1
>0043D05B    jne         0043D06D
 0043D05D    mov         eax,esi
 0043D05F    mov         si,0FFED
 0043D063    call        @CallDynaInst
>0043D068    jmp         0043D0FB
 0043D06D    or          word ptr [esi+54],1
>0043D072    jmp         0043D0F2
 0043D074    and         word ptr [esi+54],0FFFFFFFE
>0043D079    jmp         0043D0F2
 0043D07B    mov         eax,[005E0C0C];Mouse:TMouse
 0043D080    cmp         byte ptr [eax+20],0
>0043D084    je          0043D0F2
 0043D086    mov         eax,[005E0C0C];Mouse:TMouse
 0043D08B    cmp         dword ptr [eax+1C],0
>0043D08F    je          0043D0F2
 0043D091    mov         eax,dword ptr [ebx]
 0043D093    mov         edx,dword ptr ds:[5E0C0C];Mouse:TMouse
 0043D099    cmp         eax,dword ptr [edx+1C]
>0043D09C    jne         0043D0F2
 0043D09E    lea         eax,[ebp-114]
 0043D0A4    push        eax
 0043D0A5    call        user32.GetKeyboardState
 0043D0AA    mov         eax,dword ptr [ebx]
 0043D0AC    mov         dword ptr [ebp-10],eax
 0043D0AF    lea         eax,[ebp-114]
 0043D0B5    call        KeyboardStateToShiftState
 0043D0BA    mov         byte ptr [ebp-0C],al
 0043D0BD    mov         ax,word ptr [ebx+4]
 0043D0C1    mov         word ptr [ebp-0A],ax
 0043D0C5    mov         eax,dword ptr [ebx+8]
 0043D0C8    mov         dword ptr [ebp-8],eax
 0043D0CB    lea         edx,[ebp-10]
 0043D0CE    mov         eax,esi
 0043D0D0    mov         si,0FFC9
 0043D0D4    call        @CallDynaInst
>0043D0D9    jmp         0043D0FB
 0043D0DB    cmp         eax,0B00B
>0043D0E0    jne         0043D0F2
 0043D0E2    mov         edx,dword ptr [ebx+8]
 0043D0E5    push        edx
 0043D0E6    mov         ecx,dword ptr [ebx+4]
 0043D0E9    mov         edx,eax
 0043D0EB    mov         eax,esi
 0043D0ED    call        TControl.SendDockNotification
 0043D0F2    mov         edx,ebx
 0043D0F4    mov         eax,esi
 0043D0F6    mov         ecx,dword ptr [eax]
 0043D0F8    call        dword ptr [ecx-14]
 0043D0FB    pop         edi
 0043D0FC    pop         esi
 0043D0FD    pop         ebx
 0043D0FE    mov         esp,ebp
 0043D100    pop         ebp
 0043D101    ret
*}
end;

//0043D104
procedure TControl.DefaultHandler(var Message:void );
begin
{*
 0043D104    push        ebx
 0043D105    push        esi
 0043D106    push        edi
 0043D107    mov         ebx,edx
 0043D109    mov         esi,eax
 0043D10B    mov         eax,dword ptr [ebx]
 0043D10D    sub         eax,0C
>0043D110    je          0043D15C
 0043D112    dec         eax
>0043D113    je          0043D11A
 0043D115    dec         eax
>0043D116    je          0043D142
>0043D118    jmp         0043D181
 0043D11A    mov         eax,dword ptr [esi+64]
 0043D11D    test        eax,eax
>0043D11F    je          0043D125
 0043D121    mov         edi,eax
>0043D123    jmp         0043D12A
 0043D125    mov         edi,43D188
 0043D12A    mov         ecx,dword ptr [ebx+4]
 0043D12D    dec         ecx
 0043D12E    mov         eax,dword ptr [ebx+8]
 0043D131    mov         edx,edi
 0043D133    call        StrLCopy
 0043D138    call        StrLen
 0043D13D    mov         dword ptr [ebx+0C],eax
>0043D140    jmp         0043D181
 0043D142    mov         edi,dword ptr [esi+64]
 0043D145    test        edi,edi
>0043D147    jne         0043D150
 0043D149    xor         eax,eax
 0043D14B    mov         dword ptr [ebx+0C],eax
>0043D14E    jmp         0043D181
 0043D150    mov         eax,edi
 0043D152    call        StrLen
 0043D157    mov         dword ptr [ebx+0C],eax
>0043D15A    jmp         0043D181
 0043D15C    mov         eax,dword ptr [ebx+8]
 0043D15F    call        StrNew
 0043D164    mov         edi,eax
 0043D166    mov         eax,dword ptr [esi+64]
 0043D169    call        StrDispose
 0043D16E    mov         dword ptr [esi+64],edi
 0043D171    mov         eax,dword ptr [ebx+8]
 0043D174    push        eax
 0043D175    mov         ecx,dword ptr [ebx+4]
 0043D178    mov         edx,dword ptr [ebx]
 0043D17A    mov         eax,esi
 0043D17C    call        TControl.SendDockNotification
 0043D181    pop         edi
 0043D182    pop         esi
 0043D183    pop         ebx
 0043D184    ret
*}
end;

//0043D18C
procedure TControl.ReadIsControl(Reader:TReader);
begin
{*
 0043D18C    push        ebx
 0043D18D    push        esi
 0043D18E    mov         esi,edx
 0043D190    mov         ebx,eax
 0043D192    mov         eax,esi
 0043D194    call        TReader.ReadBoolean
 0043D199    mov         byte ptr [ebx+5E],al
 0043D19C    pop         esi
 0043D19D    pop         ebx
 0043D19E    ret
*}
end;

//0043D1A0
procedure TControl.WriteIsControl(Writer:TWriter);
begin
{*
 0043D1A0    mov         al,byte ptr [eax+5E]
 0043D1A3    xchg        eax,edx
 0043D1A4    call        TWriter.WriteBoolean
 0043D1A9    ret
*}
end;

//0043D1AC
function DoWriteIsControl:Boolean;
begin
{*
 0043D1AC    push        ebp
 0043D1AD    mov         ebp,esp
 0043D1AF    mov         eax,dword ptr [ebp+8]
 0043D1B2    mov         eax,dword ptr [eax-4]
 0043D1B5    mov         eax,dword ptr [eax+20]
 0043D1B8    test        eax,eax
>0043D1BA    je          0043D1D0
 0043D1BC    mov         edx,dword ptr [ebp+8]
 0043D1BF    mov         al,byte ptr [eax+5E]
 0043D1C2    mov         edx,dword ptr [ebp+8]
 0043D1C5    mov         edx,dword ptr [edx-8]
 0043D1C8    cmp         al,byte ptr [edx+5E]
 0043D1CB    setne       al
 0043D1CE    pop         ebp
 0043D1CF    ret
 0043D1D0    mov         eax,dword ptr [ebp+8]
 0043D1D3    mov         eax,dword ptr [eax-8]
 0043D1D6    mov         al,byte ptr [eax+5E]
 0043D1D9    pop         ebp
 0043D1DA    ret
*}
end;

//0043D1DC
procedure TControl.DefineProperties(Filer:TFiler);
begin
{*
 0043D1DC    push        ebp
 0043D1DD    mov         ebp,esp
 0043D1DF    add         esp,0FFFFFFF8
 0043D1E2    push        ebx
 0043D1E3    mov         dword ptr [ebp-4],edx
 0043D1E6    mov         dword ptr [ebp-8],eax
 0043D1E9    mov         eax,dword ptr [ebp-8]
 0043D1EC    push        eax
 0043D1ED    push        43D18C;TControl.ReadIsControl
 0043D1F2    mov         eax,dword ptr [ebp-8]
 0043D1F5    push        eax
 0043D1F6    push        43D1A0;TControl.WriteIsControl
 0043D1FB    push        ebp
 0043D1FC    call        DoWriteIsControl
 0043D201    pop         ecx
 0043D202    mov         ecx,eax
 0043D204    mov         edx,43D220;'IsControl'
 0043D209    mov         eax,dword ptr [ebp-4]
 0043D20C    mov         ebx,dword ptr [eax]
 0043D20E    call        dword ptr [ebx+4]
 0043D211    pop         ebx
 0043D212    pop         ecx
 0043D213    pop         ecx
 0043D214    pop         ebp
 0043D215    ret
*}
end;

//0043D22C
procedure TControl.Click;
begin
{*
 0043D22C    push        ebx
 0043D22D    mov         ebx,eax
 0043D22F    cmp         word ptr [ebx+122],0
>0043D237    je          0043D266
 0043D239    mov         eax,ebx
 0043D23B    mov         edx,dword ptr [eax]
 0043D23D    call        dword ptr [edx+3C]
 0043D240    test        eax,eax
>0043D242    je          0043D266
 0043D244    mov         eax,ebx
 0043D246    mov         edx,dword ptr [eax]
 0043D248    call        dword ptr [edx+3C]
 0043D24B    mov         eax,dword ptr [eax+40]
 0043D24E    cmp         eax,dword ptr [ebx+120]
>0043D254    je          0043D266
 0043D256    mov         edx,ebx
 0043D258    mov         eax,dword ptr [ebx+124]
 0043D25E    call        dword ptr [ebx+120]
 0043D264    pop         ebx
 0043D265    ret
 0043D266    test        byte ptr [ebx+1C],10
>0043D26A    jne         0043D27E
 0043D26C    cmp         dword ptr [ebx+6C],0
>0043D270    je          0043D27E
 0043D272    mov         edx,ebx
 0043D274    mov         eax,dword ptr [ebx+6C]
 0043D277    mov         ecx,dword ptr [eax]
 0043D279    call        dword ptr [ecx+18]
>0043D27C    jmp         0043D296
 0043D27E    cmp         word ptr [ebx+122],0
>0043D286    je          0043D296
 0043D288    mov         edx,ebx
 0043D28A    mov         eax,dword ptr [ebx+124]
 0043D290    call        dword ptr [ebx+120]
 0043D296    pop         ebx
 0043D297    ret
*}
end;

//0043D298
procedure TControl.DblClick;
begin
{*
 0043D298    push        ebx
 0043D299    cmp         word ptr [eax+12A],0
>0043D2A1    je          0043D2B3
 0043D2A3    mov         ebx,eax
 0043D2A5    mov         edx,eax
 0043D2A7    mov         eax,dword ptr [ebx+12C]
 0043D2AD    call        dword ptr [ebx+128]
 0043D2B3    pop         ebx
 0043D2B4    ret
*}
end;

//0043D2B8
procedure TControl.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0043D2B8    push        ebp
 0043D2B9    mov         ebp,esp
 0043D2BB    push        ecx
 0043D2BC    push        ebx
 0043D2BD    mov         byte ptr [ebp-1],cl
 0043D2C0    cmp         word ptr [eax+0D2],0
>0043D2C8    je          0043D2E8
 0043D2CA    mov         cl,byte ptr [ebp-1]
 0043D2CD    push        ecx
 0043D2CE    mov         ecx,dword ptr [ebp+0C]
 0043D2D1    push        ecx
 0043D2D2    mov         ecx,dword ptr [ebp+8]
 0043D2D5    push        ecx
 0043D2D6    mov         ebx,eax
 0043D2D8    mov         ecx,edx
 0043D2DA    mov         edx,eax
 0043D2DC    mov         eax,dword ptr [ebx+0D4]
 0043D2E2    call        dword ptr [ebx+0D0]
 0043D2E8    pop         ebx
 0043D2E9    pop         ecx
 0043D2EA    pop         ebp
 0043D2EB    ret         8
*}
end;

//0043D2F0
procedure TControl.DoMouseDown(var Message:TWMMouse; Button:TMouseButton; Shift:TShiftState);
begin
{*
 0043D2F0    push        ebp
 0043D2F1    mov         ebp,esp
 0043D2F3    add         esp,0FFFFFFF8
 0043D2F6    push        ebx
 0043D2F7    push        esi
 0043D2F8    push        edi
 0043D2F9    mov         ebx,ecx
 0043D2FB    mov         esi,edx
 0043D2FD    mov         edi,eax
 0043D2FF    test        byte ptr [edi+51],10
>0043D303    jne         0043D36B
 0043D305    cmp         dword ptr [edi+48],8000
>0043D30C    jg          0043D317
 0043D30E    cmp         dword ptr [edi+4C],8000
>0043D315    jle         0043D346
 0043D317    lea         edx,[ebp-8]
 0043D31A    mov         eax,edi
 0043D31C    call        TControl.CalcCursorPos
 0043D321    mov         eax,dword ptr [ebp-8]
 0043D324    push        eax
 0043D325    mov         eax,dword ptr [ebp-4]
 0043D328    push        eax
 0043D329    mov         ax,word ptr [esi+4]
 0043D32D    call        KeysToShiftState
 0043D332    mov         ecx,eax
 0043D334    or          cl,byte ptr [ebp+8]
 0043D337    mov         edx,ebx
 0043D339    mov         eax,edi
 0043D33B    mov         si,0FFD5
 0043D33F    call        @CallDynaInst
>0043D344    jmp         0043D36B
 0043D346    movsx       eax,word ptr [esi+8]
 0043D34A    push        eax
 0043D34B    movsx       eax,word ptr [esi+0A]
 0043D34F    push        eax
 0043D350    mov         ax,word ptr [esi+4]
 0043D354    call        KeysToShiftState
 0043D359    mov         ecx,eax
 0043D35B    or          cl,byte ptr [ebp+8]
 0043D35E    mov         edx,ebx
 0043D360    mov         eax,edi
 0043D362    mov         si,0FFD5
 0043D366    call        @CallDynaInst
 0043D36B    pop         edi
 0043D36C    pop         esi
 0043D36D    pop         ebx
 0043D36E    pop         ecx
 0043D36F    pop         ecx
 0043D370    pop         ebp
 0043D371    ret         4
*}
end;

//0043D374
procedure TControl.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 0043D374    push        ebx
 0043D375    push        esi
 0043D376    mov         esi,edx
 0043D378    mov         ebx,eax
 0043D37A    mov         edx,ebx
 0043D37C    mov         eax,ebx
 0043D37E    call        TControl.SendCancelMode
 0043D383    mov         edx,esi
 0043D385    mov         eax,ebx
 0043D387    mov         ecx,dword ptr [eax]
 0043D389    call        dword ptr [ecx-10]
 0043D38C    test        byte ptr [ebx+50],2
>0043D390    je          0043D39B
 0043D392    mov         dl,1
 0043D394    mov         eax,ebx
 0043D396    call        TControl.SetMouseCapture
 0043D39B    test        byte ptr [ebx+50],8
>0043D39F    je          0043D3A6
 0043D3A1    or          word ptr [ebx+54],2
 0043D3A6    mov         al,[0043D3BC]
 0043D3AB    push        eax
 0043D3AC    mov         edx,esi
 0043D3AE    xor         ecx,ecx
 0043D3B0    mov         eax,ebx
 0043D3B2    call        TControl.DoMouseDown
 0043D3B7    pop         esi
 0043D3B8    pop         ebx
 0043D3B9    ret
*}
end;

//0043D3C0
procedure TControl.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 0043D3C0    push        ebx
 0043D3C1    push        esi
 0043D3C2    mov         esi,edx
 0043D3C4    mov         ebx,eax
 0043D3C6    mov         edx,ebx
 0043D3C8    mov         eax,ebx
 0043D3CA    call        TControl.SendCancelMode
 0043D3CF    mov         edx,esi
 0043D3D1    mov         eax,ebx
 0043D3D3    mov         ecx,dword ptr [eax]
 0043D3D5    call        dword ptr [ecx-10]
 0043D3D8    pop         esi
 0043D3D9    pop         ebx
 0043D3DA    ret
*}
end;

//0043D3DC
procedure TControl.WMLButtonDblClk(var Message:TWMLButtonDblClk);
begin
{*
 0043D3DC    push        ebx
 0043D3DD    push        esi
 0043D3DE    push        edi
 0043D3DF    mov         edi,edx
 0043D3E1    mov         ebx,eax
 0043D3E3    mov         edx,ebx
 0043D3E5    mov         eax,ebx
 0043D3E7    call        TControl.SendCancelMode
 0043D3EC    mov         edx,edi
 0043D3EE    mov         eax,ebx
 0043D3F0    mov         ecx,dword ptr [eax]
 0043D3F2    call        dword ptr [ecx-10]
 0043D3F5    test        byte ptr [ebx+50],2
>0043D3F9    je          0043D404
 0043D3FB    mov         dl,1
 0043D3FD    mov         eax,ebx
 0043D3FF    call        TControl.SetMouseCapture
 0043D404    test        byte ptr [ebx+50],8
>0043D408    je          0043D415
 0043D40A    mov         eax,ebx
 0043D40C    mov         si,0FFE9
 0043D410    call        @CallDynaInst
 0043D415    mov         al,[0043D42C]
 0043D41A    push        eax
 0043D41B    mov         edx,edi
 0043D41D    xor         ecx,ecx
 0043D41F    mov         eax,ebx
 0043D421    call        TControl.DoMouseDown
 0043D426    pop         edi
 0043D427    pop         esi
 0043D428    pop         ebx
 0043D429    ret
*}
end;

//0043D430
procedure TControl.sub_0043D430;
begin
{*
 0043D430    mov         eax,dword ptr [eax+7C];TControl.FPopupMenu:TPopupMenu
 0043D433    ret
*}
end;

//0043D434
function TControl.CheckNewSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 0043D434    push        ebx
 0043D435    push        esi
 0043D436    push        edi
 0043D437    push        ebp
 0043D438    add         esp,0FFFFFFF0
 0043D43B    mov         ebp,ecx
 0043D43D    mov         edi,edx
 0043D43F    mov         esi,eax
 0043D441    xor         ebx,ebx
 0043D443    mov         eax,dword ptr [edi]
 0043D445    mov         dword ptr [esp],eax
 0043D448    mov         eax,dword ptr [ebp]
 0043D44B    mov         dword ptr [esp+4],eax
 0043D44F    lea         ecx,[esp+4]
 0043D453    mov         edx,esp
 0043D455    mov         eax,esi
 0043D457    call        TControl.DoCanResize
 0043D45C    test        al,al
>0043D45E    je          0043D4C5
 0043D460    mov         eax,dword ptr [esp]
 0043D463    mov         dword ptr [esp+8],eax
 0043D467    mov         eax,dword ptr [esp+4]
 0043D46B    mov         dword ptr [esp+0C],eax
 0043D46F    cmp         byte ptr [esi+5C],0
>0043D473    je          0043D4B2
 0043D475    lea         ecx,[esp+0C]
 0043D479    lea         edx,[esp+8]
 0043D47D    mov         eax,esi
 0043D47F    call        TControl.DoCanAutoSize
 0043D484    test        al,al
>0043D486    je          0043D49B
 0043D488    mov         eax,dword ptr [esp+8]
 0043D48C    cmp         eax,dword ptr [esp]
>0043D48F    jne         0043D49B
 0043D491    mov         eax,dword ptr [esp+0C]
 0043D495    cmp         eax,dword ptr [esp+4]
>0043D499    je          0043D4B2
 0043D49B    lea         ecx,[esp+0C]
 0043D49F    lea         edx,[esp+8]
 0043D4A3    mov         eax,esi
 0043D4A5    call        TControl.DoCanResize
 0043D4AA    test        al,al
>0043D4AC    jne         0043D4B2
 0043D4AE    xor         ebx,ebx
>0043D4B0    jmp         0043D4B4
 0043D4B2    mov         bl,1
 0043D4B4    test        bl,bl
>0043D4B6    je          0043D4C5
 0043D4B8    mov         eax,dword ptr [esp+8]
 0043D4BC    mov         dword ptr [edi],eax
 0043D4BE    mov         eax,dword ptr [esp+0C]
 0043D4C2    mov         dword ptr [ebp],eax
 0043D4C5    mov         eax,ebx
 0043D4C7    add         esp,10
 0043D4CA    pop         ebp
 0043D4CB    pop         edi
 0043D4CC    pop         esi
 0043D4CD    pop         ebx
 0043D4CE    ret
*}
end;

//0043D4D0
procedure TControl.WMRButtonDown(var Message:TWMRButtonDown);
begin
{*
 0043D4D0    push        ebx
 0043D4D1    push        esi
 0043D4D2    mov         esi,edx
 0043D4D4    mov         ebx,eax
 0043D4D6    mov         edx,esi
 0043D4D8    mov         eax,ebx
 0043D4DA    mov         ecx,dword ptr [eax]
 0043D4DC    call        dword ptr [ecx-10]
 0043D4DF    mov         al,[0043D4F4]
 0043D4E4    push        eax
 0043D4E5    mov         edx,esi
 0043D4E7    mov         cl,1
 0043D4E9    mov         eax,ebx
 0043D4EB    call        TControl.DoMouseDown
 0043D4F0    pop         esi
 0043D4F1    pop         ebx
 0043D4F2    ret
*}
end;

//0043D4F8
procedure TControl.WMRButtonDblClk(var Message:TWMRButtonDblClk);
begin
{*
 0043D4F8    push        ebx
 0043D4F9    push        esi
 0043D4FA    mov         esi,edx
 0043D4FC    mov         ebx,eax
 0043D4FE    mov         edx,esi
 0043D500    mov         eax,ebx
 0043D502    mov         ecx,dword ptr [eax]
 0043D504    call        dword ptr [ecx-10]
 0043D507    mov         al,[0043D51C]
 0043D50C    push        eax
 0043D50D    mov         edx,esi
 0043D50F    mov         cl,1
 0043D511    mov         eax,ebx
 0043D513    call        TControl.DoMouseDown
 0043D518    pop         esi
 0043D519    pop         ebx
 0043D51A    ret
*}
end;

//0043D520
procedure TControl.WMMButtonDown(var Message:TWMMButtonDown);
begin
{*
 0043D520    push        ebx
 0043D521    push        esi
 0043D522    mov         esi,edx
 0043D524    mov         ebx,eax
 0043D526    mov         edx,esi
 0043D528    mov         eax,ebx
 0043D52A    mov         ecx,dword ptr [eax]
 0043D52C    call        dword ptr [ecx-10]
 0043D52F    mov         al,[0043D544]
 0043D534    push        eax
 0043D535    mov         edx,esi
 0043D537    mov         cl,2
 0043D539    mov         eax,ebx
 0043D53B    call        TControl.DoMouseDown
 0043D540    pop         esi
 0043D541    pop         ebx
 0043D542    ret
*}
end;

//0043D548
procedure TControl.WMMButtonDblClk(var Message:TWMMButtonDblClk);
begin
{*
 0043D548    push        ebx
 0043D549    push        esi
 0043D54A    mov         esi,edx
 0043D54C    mov         ebx,eax
 0043D54E    mov         edx,esi
 0043D550    mov         eax,ebx
 0043D552    mov         ecx,dword ptr [eax]
 0043D554    call        dword ptr [ecx-10]
 0043D557    mov         al,[0043D56C]
 0043D55C    push        eax
 0043D55D    mov         edx,esi
 0043D55F    mov         cl,2
 0043D561    mov         eax,ebx
 0043D563    call        TControl.DoMouseDown
 0043D568    pop         esi
 0043D569    pop         ebx
 0043D56A    ret
*}
end;

//0043D570
procedure TControl.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0043D570    push        ebp
 0043D571    mov         ebp,esp
 0043D573    push        ecx
 0043D574    push        ebx
 0043D575    mov         byte ptr [ebp-1],dl
 0043D578    cmp         word ptr [eax+0DA],0
>0043D580    je          0043D59A
 0043D582    push        ecx
 0043D583    mov         edx,dword ptr [ebp+8]
 0043D586    push        edx
 0043D587    mov         ebx,eax
 0043D589    mov         edx,eax
 0043D58B    mov         cl,byte ptr [ebp-1]
 0043D58E    mov         eax,dword ptr [ebx+0DC]
 0043D594    call        dword ptr [ebx+0D8]
 0043D59A    pop         ebx
 0043D59B    pop         ecx
 0043D59C    pop         ebp
 0043D59D    ret         4
*}
end;

//0043D5A0
procedure TControl.WMMouseMove(var Message:TWMMouseMove);
begin
{*
 0043D5A0    push        ebx
 0043D5A1    push        esi
 0043D5A2    add         esp,0FFFFFFF8
 0043D5A5    mov         esi,edx
 0043D5A7    mov         ebx,eax
 0043D5A9    mov         edx,esi
 0043D5AB    mov         eax,ebx
 0043D5AD    mov         ecx,dword ptr [eax]
 0043D5AF    call        dword ptr [ecx-10]
 0043D5B2    test        byte ptr [ebx+51],10
>0043D5B6    jne         0043D613
 0043D5B8    cmp         dword ptr [ebx+48],8000
>0043D5BF    jg          0043D5CA
 0043D5C1    cmp         dword ptr [ebx+4C],8000
>0043D5C8    jle         0043D5F4
 0043D5CA    mov         edx,esp
 0043D5CC    mov         eax,ebx
 0043D5CE    call        TControl.CalcCursorPos
 0043D5D3    mov         eax,dword ptr [esp+4]
 0043D5D7    push        eax
 0043D5D8    mov         ax,word ptr [esi+4]
 0043D5DC    call        KeysToShiftState
 0043D5E1    mov         edx,eax
 0043D5E3    mov         ecx,dword ptr [esp+4]
 0043D5E7    mov         eax,ebx
 0043D5E9    mov         si,0FFD4
 0043D5ED    call        @CallDynaInst
>0043D5F2    jmp         0043D613
 0043D5F4    movsx       eax,word ptr [esi+0A]
 0043D5F8    push        eax
 0043D5F9    mov         ax,word ptr [esi+4]
 0043D5FD    call        KeysToShiftState
 0043D602    mov         edx,eax
 0043D604    movsx       ecx,word ptr [esi+8]
 0043D608    mov         eax,ebx
 0043D60A    mov         si,0FFD4
 0043D60E    call        @CallDynaInst
 0043D613    pop         ecx
 0043D614    pop         edx
 0043D615    pop         esi
 0043D616    pop         ebx
 0043D617    ret
*}
end;

//0043D618
procedure TControl.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0043D618    push        ebp
 0043D619    mov         ebp,esp
 0043D61B    push        ecx
 0043D61C    push        ebx
 0043D61D    mov         byte ptr [ebp-1],cl
 0043D620    cmp         word ptr [eax+0E2],0
>0043D628    je          0043D648
 0043D62A    mov         cl,byte ptr [ebp-1]
 0043D62D    push        ecx
 0043D62E    mov         ecx,dword ptr [ebp+0C]
 0043D631    push        ecx
 0043D632    mov         ecx,dword ptr [ebp+8]
 0043D635    push        ecx
 0043D636    mov         ebx,eax
 0043D638    mov         ecx,edx
 0043D63A    mov         edx,eax
 0043D63C    mov         eax,dword ptr [ebx+0E4]
 0043D642    call        dword ptr [ebx+0E0]
 0043D648    pop         ebx
 0043D649    pop         ecx
 0043D64A    pop         ebp
 0043D64B    ret         8
*}
end;

//0043D650
procedure TControl.DoMouseUp(var Message:TWMMouse; Button:TMouseButton);
begin
{*
 0043D650    push        ebx
 0043D651    push        esi
 0043D652    push        edi
 0043D653    mov         ebx,ecx
 0043D655    mov         esi,edx
 0043D657    mov         edi,eax
 0043D659    test        byte ptr [edi+51],10
>0043D65D    jne         0043D681
 0043D65F    movsx       eax,word ptr [esi+8]
 0043D663    push        eax
 0043D664    movsx       eax,word ptr [esi+0A]
 0043D668    push        eax
 0043D669    mov         ax,word ptr [esi+4]
 0043D66D    call        KeysToShiftState
 0043D672    mov         ecx,eax
 0043D674    mov         edx,ebx
 0043D676    mov         eax,edi
 0043D678    mov         si,0FFD3
 0043D67C    call        @CallDynaInst
 0043D681    pop         edi
 0043D682    pop         esi
 0043D683    pop         ebx
 0043D684    ret
*}
end;

//0043D688
procedure TControl.WMLButtonUp(var Message:TWMLButtonUp);
begin
{*
 0043D688    push        ebx
 0043D689    push        esi
 0043D68A    push        edi
 0043D68B    add         esp,0FFFFFFE8
 0043D68E    mov         edi,edx
 0043D690    mov         ebx,eax
 0043D692    mov         edx,edi
 0043D694    mov         eax,ebx
 0043D696    mov         ecx,dword ptr [eax]
 0043D698    call        dword ptr [ecx-10]
 0043D69B    test        byte ptr [ebx+50],2
>0043D69F    je          0043D6AA
 0043D6A1    xor         edx,edx
 0043D6A3    mov         eax,ebx
 0043D6A5    call        TControl.SetMouseCapture
 0043D6AA    test        byte ptr [ebx+54],2
>0043D6AE    je          0043D6EB
 0043D6B0    and         word ptr [ebx+54],0FFFFFFFD
 0043D6B5    mov         edx,esp
 0043D6B7    mov         eax,dword ptr [edi+8]
 0043D6BA    call        SmallPointToPoint
 0043D6BF    push        dword ptr [esp+4]
 0043D6C3    push        dword ptr [esp+4]
 0043D6C7    lea         edx,[esp+10]
 0043D6CB    mov         eax,ebx
 0043D6CD    mov         ecx,dword ptr [eax]
 0043D6CF    call        dword ptr [ecx+44]
 0043D6D2    lea         eax,[esp+10]
 0043D6D6    push        eax
 0043D6D7    call        user32.PtInRect
 0043D6DC    test        eax,eax
>0043D6DE    je          0043D6EB
 0043D6E0    mov         eax,ebx
 0043D6E2    mov         si,0FFEB
 0043D6E6    call        @CallDynaInst
 0043D6EB    mov         edx,edi
 0043D6ED    xor         ecx,ecx
 0043D6EF    mov         eax,ebx
 0043D6F1    call        TControl.DoMouseUp
 0043D6F6    add         esp,18
 0043D6F9    pop         edi
 0043D6FA    pop         esi
 0043D6FB    pop         ebx
 0043D6FC    ret
*}
end;

//0043D700
procedure TControl.WMRButtonUp(var Message:TWMRButtonUp);
begin
{*
 0043D700    push        ebx
 0043D701    push        esi
 0043D702    mov         esi,edx
 0043D704    mov         ebx,eax
 0043D706    mov         edx,esi
 0043D708    mov         eax,ebx
 0043D70A    mov         ecx,dword ptr [eax]
 0043D70C    call        dword ptr [ecx-10]
 0043D70F    mov         edx,esi
 0043D711    mov         cl,1
 0043D713    mov         eax,ebx
 0043D715    call        TControl.DoMouseUp
 0043D71A    pop         esi
 0043D71B    pop         ebx
 0043D71C    ret
*}
end;

//0043D720
procedure TControl.WMMButtonUp(var Message:TWMMButtonUp);
begin
{*
 0043D720    push        ebx
 0043D721    push        esi
 0043D722    mov         esi,edx
 0043D724    mov         ebx,eax
 0043D726    mov         edx,esi
 0043D728    mov         eax,ebx
 0043D72A    mov         ecx,dword ptr [eax]
 0043D72C    call        dword ptr [ecx-10]
 0043D72F    mov         edx,esi
 0043D731    mov         cl,2
 0043D733    mov         eax,ebx
 0043D735    call        TControl.DoMouseUp
 0043D73A    pop         esi
 0043D73B    pop         ebx
 0043D73C    ret
*}
end;

//0043D740
procedure TControl.WMMouseWheel(var Message:TWMMouseWheel);
begin
{*
 0043D740    push        ebx
 0043D741    push        esi
 0043D742    push        edi
 0043D743    mov         ebx,edx
 0043D745    mov         edi,eax
 0043D747    mov         eax,[005E0C0C];Mouse:TMouse
 0043D74C    cmp         byte ptr [eax+20],0
>0043D750    jne         0043D76A
 0043D752    mov         eax,[005E0C0C];Mouse:TMouse
 0043D757    mov         byte ptr [eax+20],1
 0043D75B    mov         edx,68
 0043D760    mov         eax,[005E0C0C];Mouse:TMouse
 0043D765    call        TMouse.SettingChanged
 0043D76A    mov         ax,word ptr [ebx+4]
 0043D76E    call        KeysToShiftState
 0043D773    mov         byte ptr [ebx+4],al
 0043D776    mov         edx,ebx
 0043D778    mov         eax,edi
 0043D77A    mov         si,0FFC9
 0043D77E    call        @CallDynaInst
 0043D783    cmp         dword ptr [ebx+0C],0
>0043D787    jne         0043D792
 0043D789    mov         edx,ebx
 0043D78B    mov         eax,edi
 0043D78D    mov         ecx,dword ptr [eax]
 0043D78F    call        dword ptr [ecx-10]
 0043D792    pop         edi
 0043D793    pop         esi
 0043D794    pop         ebx
 0043D795    ret
*}
end;

//0043D798
procedure TControl.WMCancelMode(var Message:TWMCancelMode);
begin
{*
 0043D798    push        esi
 0043D799    mov         esi,eax
 0043D79B    mov         eax,esi
 0043D79D    mov         ecx,dword ptr [eax]
 0043D79F    call        dword ptr [ecx-10]
 0043D7A2    mov         eax,esi
 0043D7A4    call        TControl.GetMouseCapture
 0043D7A9    test        al,al
>0043D7AB    je          0043D7CE
 0043D7AD    xor         edx,edx
 0043D7AF    mov         eax,esi
 0043D7B1    call        TControl.SetMouseCapture
 0043D7B6    test        byte ptr [esi+54],1
>0043D7BA    je          0043D7D3
 0043D7BC    push        0FF
 0043D7BE    xor         ecx,ecx
 0043D7C0    mov         edx,202
 0043D7C5    mov         eax,esi
 0043D7C7    call        TControl.Perform
 0043D7CC    pop         esi
 0043D7CD    ret
 0043D7CE    and         word ptr [esi+54],0FFFFFFFE
 0043D7D3    pop         esi
 0043D7D4    ret
*}
end;

//0043D7D8
procedure TControl.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
{*
 0043D7D8    push        ebx
 0043D7D9    push        esi
 0043D7DA    mov         esi,edx
 0043D7DC    mov         ebx,eax
 0043D7DE    mov         edx,esi
 0043D7E0    mov         eax,ebx
 0043D7E2    mov         ecx,dword ptr [eax]
 0043D7E4    call        dword ptr [ecx-10]
 0043D7E7    mov         ax,[0043D880]
 0043D7ED    and         ax,word ptr [ebx+1C]
 0043D7F1    mov         dx,word ptr ds:[43D884]
 0043D7F8    cmp         dx,ax
>0043D7FB    jne         0043D87B
 0043D7FD    mov         eax,dword ptr [ebx+74]
 0043D800    mov         edx,dword ptr [eax+0C]
 0043D803    test        edx,edx
>0043D805    jbe         0043D814
 0043D807    cmp         edx,dword ptr [ebx+48]
>0043D80A    jge         0043D814
 0043D80C    mov         edx,dword ptr [ebx+48]
 0043D80F    mov         dword ptr [eax+0C],edx
>0043D812    jmp         0043D826
 0043D814    mov         edx,dword ptr [eax+14]
 0043D817    test        edx,edx
>0043D819    jbe         0043D826
 0043D81B    cmp         edx,dword ptr [ebx+48]
>0043D81E    jle         0043D826
 0043D820    mov         edx,dword ptr [ebx+48]
 0043D823    mov         dword ptr [eax+14],edx
 0043D826    mov         edx,dword ptr [eax+8]
 0043D829    test        edx,edx
>0043D82B    jbe         0043D83A
 0043D82D    cmp         edx,dword ptr [ebx+4C]
>0043D830    jge         0043D83A
 0043D832    mov         edx,dword ptr [ebx+4C]
 0043D835    mov         dword ptr [eax+8],edx
>0043D838    jmp         0043D84C
 0043D83A    mov         edx,dword ptr [eax+10]
 0043D83D    test        edx,edx
>0043D83F    jbe         0043D84C
 0043D841    cmp         edx,dword ptr [ebx+4C]
>0043D844    jle         0043D84C
 0043D846    mov         edx,dword ptr [ebx+4C]
 0043D849    mov         dword ptr [eax+10],edx
 0043D84C    mov         eax,dword ptr [esi+8]
 0043D84F    test        eax,eax
>0043D851    je          0043D87B
 0043D853    cmp         dword ptr [ebx+0A0],0
>0043D85A    je          0043D87B
 0043D85C    test        byte ptr [ebx+55],4
>0043D860    jne         0043D87B
 0043D862    test        byte ptr [eax+18],1
>0043D866    jne         0043D87B
 0043D868    cmp         dword ptr [eax+10],0
>0043D86C    je          0043D87B
 0043D86E    cmp         dword ptr [eax+14],0
>0043D872    je          0043D87B
 0043D874    mov         eax,ebx
 0043D876    call        TControl.CalcDockSizes
 0043D87B    pop         esi
 0043D87C    pop         ebx
 0043D87D    ret
*}
end;

//0043D888
procedure TControl.CMVisibleChanged(var Message:TMessage);
begin
{*
 0043D888    test        byte ptr [eax+1C],10
>0043D88C    je          0043D894
 0043D88E    test        byte ptr [eax+51],4
>0043D892    je          0043D8AD
 0043D894    cmp         byte ptr [eax+57],0
>0043D898    je          0043D8A0
 0043D89A    test        byte ptr [eax+50],40
>0043D89E    jne         0043D8A4
 0043D8A0    xor         ecx,ecx
>0043D8A2    jmp         0043D8A6
 0043D8A4    mov         cl,1
 0043D8A6    mov         dl,1
 0043D8A8    call        TControl.InvalidateControl
 0043D8AD    ret
*}
end;

//0043D8B0
procedure TControl.CMEnabledChanged;
begin
{*
 0043D8B0    mov         edx,dword ptr [eax]
 0043D8B2    call        dword ptr [edx+7C];TControl.Invalidate
 0043D8B5    ret
*}
end;

//0043D8B8
procedure TControl.CMFontChanged(var Message:TMessage);
begin
{*
 0043D8B8    mov         edx,dword ptr [eax]
 0043D8BA    call        dword ptr [edx+7C]
 0043D8BD    ret
*}
end;

//0043D8C0
procedure TControl.CMColorChanged(var Message:TMessage);
begin
{*
 0043D8C0    mov         edx,dword ptr [eax]
 0043D8C2    call        dword ptr [edx+7C]
 0043D8C5    ret
*}
end;

//0043D8C8
procedure TControl.CMParentColorChanged(var Message:TMessage);
begin
{*
 0043D8C8    push        ebx
 0043D8C9    mov         ebx,eax
 0043D8CB    cmp         byte ptr [ebx+5A],0
>0043D8CF    je          0043D8F4
 0043D8D1    cmp         dword ptr [edx+4],0
>0043D8D5    je          0043D8E3
 0043D8D7    mov         edx,dword ptr [edx+8]
 0043D8DA    mov         eax,ebx
 0043D8DC    call        TControl.SetColor
>0043D8E1    jmp         0043D8F0
 0043D8E3    mov         eax,dword ptr [ebx+30]
 0043D8E6    mov         edx,dword ptr [eax+70]
 0043D8E9    mov         eax,ebx
 0043D8EB    call        TControl.SetColor
 0043D8F0    mov         byte ptr [ebx+5A],1
 0043D8F4    pop         ebx
 0043D8F5    ret
*}
end;

//0043D8F8
procedure TControl.CMParentBiDiModeChanged(var Message:TMessage);
begin
{*
 0043D8F8    push        ebx
 0043D8F9    push        esi
 0043D8FA    mov         ebx,eax
 0043D8FC    cmp         byte ptr [ebx+60],0
>0043D900    je          0043D917
 0043D902    mov         esi,dword ptr [ebx+30]
 0043D905    test        esi,esi
>0043D907    je          0043D913
 0043D909    mov         dl,byte ptr [esi+5F]
 0043D90C    mov         eax,ebx
 0043D90E    mov         ecx,dword ptr [eax]
 0043D910    call        dword ptr [ecx+70]
 0043D913    mov         byte ptr [ebx+60],1
 0043D917    pop         esi
 0043D918    pop         ebx
 0043D919    ret
*}
end;

//0043D91C
procedure TControl.CMMouseWheel(var Message:TCMMouseWheel);
begin
{*
 0043D91C    push        ebx
 0043D91D    push        esi
 0043D91E    push        edi
 0043D91F    add         esp,0FFFFFFF8
 0043D922    mov         ebx,edx
 0043D924    mov         edi,eax
 0043D926    xor         eax,eax
 0043D928    mov         dword ptr [ebx+0C],eax
 0043D92B    mov         edx,esp
 0043D92D    mov         eax,dword ptr [ebx+8]
 0043D930    call        SmallPointToPoint
 0043D935    push        esp
 0043D936    movsx       ecx,word ptr [ebx+6]
 0043D93A    mov         dl,byte ptr [ebx+4]
 0043D93D    mov         eax,edi
 0043D93F    mov         si,0FFE2
 0043D943    call        @CallDynaInst
 0043D948    test        al,al
>0043D94A    je          0043D955
 0043D94C    mov         dword ptr [ebx+0C],1
>0043D953    jmp         0043D972
 0043D955    mov         esi,dword ptr [edi+30]
 0043D958    test        esi,esi
>0043D95A    je          0043D972
 0043D95C    mov         eax,dword ptr [ebx+8]
 0043D95F    push        eax
 0043D960    mov         ecx,dword ptr [ebx+4]
 0043D963    mov         edx,0B043
 0043D968    mov         eax,esi
 0043D96A    call        TControl.Perform
 0043D96F    mov         dword ptr [ebx+0C],eax
 0043D972    pop         ecx
 0043D973    pop         edx
 0043D974    pop         edi
 0043D975    pop         esi
 0043D976    pop         ebx
 0043D977    ret
*}
end;

//0043D978
procedure TControl.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 0043D978    push        esi
 0043D979    mov         esi,eax
 0043D97B    mov         eax,[005AE810];^SysLocale:TSysLocale
 0043D980    cmp         byte ptr [eax+0D],0
>0043D984    je          0043D993
 0043D986    cmp         dword ptr [edx+4],0
>0043D98A    jne         0043D993
 0043D98C    mov         eax,esi
 0043D98E    mov         edx,dword ptr [eax]
 0043D990    call        dword ptr [edx+7C]
 0043D993    pop         esi
 0043D994    ret
*}
end;

//0043D998
procedure TControl.CMParentShowHintChanged(var Message:TMessage);
begin
{*
 0043D998    push        ebx
 0043D999    mov         ebx,eax
 0043D99B    cmp         byte ptr [ebx+9A],0
>0043D9A2    je          0043D9BB
 0043D9A4    mov         eax,dword ptr [ebx+30]
 0043D9A7    mov         dl,byte ptr [eax+99]
 0043D9AD    mov         eax,ebx
 0043D9AF    call        TControl.SetShowHint
 0043D9B4    mov         byte ptr [ebx+9A],1
 0043D9BB    pop         ebx
 0043D9BC    ret
*}
end;

//0043D9C0
procedure TControl.CMParentFontChanged(var Message:TMessage);
begin
{*
 0043D9C0    push        ebx
 0043D9C1    mov         ebx,eax
 0043D9C3    cmp         byte ptr [ebx+59],0
>0043D9C7    je          0043D9EC
 0043D9C9    cmp         dword ptr [edx+4],0
>0043D9CD    je          0043D9DB
 0043D9CF    mov         edx,dword ptr [edx+8]
 0043D9D2    mov         eax,ebx
 0043D9D4    call        TControl.SetFont
>0043D9D9    jmp         0043D9E8
 0043D9DB    mov         eax,dword ptr [ebx+30]
 0043D9DE    mov         edx,dword ptr [eax+68]
 0043D9E1    mov         eax,ebx
 0043D9E3    call        TControl.SetFont
 0043D9E8    mov         byte ptr [ebx+59],1
 0043D9EC    pop         ebx
 0043D9ED    ret
*}
end;

//0043D9F0
procedure TControl.CMSysFontChanged(var Message:TMessage);
begin
{*
 0043D9F0    push        ebx
 0043D9F1    mov         ebx,eax
 0043D9F3    cmp         byte ptr [ebx+56],0
>0043D9F7    je          0043DA11
 0043D9F9    mov         eax,[005AE7DC];^Screen:TScreen
 0043D9FE    mov         eax,dword ptr [eax]
 0043DA00    mov         edx,dword ptr [eax+84]
 0043DA06    mov         eax,ebx
 0043DA08    call        TControl.SetFont
 0043DA0D    mov         byte ptr [ebx+56],1
 0043DA11    pop         ebx
 0043DA12    ret
*}
end;

//0043DA14
procedure TControl.CMHitTest(var Message:TWMNCHitTest);
begin
{*
 0043DA14    mov         dword ptr [edx+0C],1
 0043DA1B    ret
*}
end;

//0043DA1C
procedure TControl.CMMouseEnter(var Message:TMessage);
begin
{*
 0043DA1C    mov         edx,dword ptr [eax+30]
 0043DA1F    test        edx,edx
>0043DA21    je          0043DA32
 0043DA23    push        eax
 0043DA24    xor         ecx,ecx
 0043DA26    mov         eax,edx
 0043DA28    mov         edx,0B013
 0043DA2D    call        TControl.Perform
 0043DA32    ret
*}
end;

//0043DA34
procedure TControl.CMMouseLeave(var Message:TMessage);
begin
{*
 0043DA34    mov         edx,dword ptr [eax+30]
 0043DA37    test        edx,edx
>0043DA39    je          0043DA4A
 0043DA3B    push        eax
 0043DA3C    xor         ecx,ecx
 0043DA3E    mov         eax,edx
 0043DA40    mov         edx,0B014
 0043DA45    call        TControl.Perform
 0043DA4A    ret
*}
end;

//0043DA4C
procedure TControl.CMDesignHitTest(var Message:TWMMouse);
begin
{*
 0043DA4C    xor         eax,eax
 0043DA4E    mov         dword ptr [edx+0C],eax
 0043DA51    ret
*}
end;

//0043DA54
function TControl.CreateFloatingDockSite(Bounds:TRect):TWinControl;
begin
{*
 0043DA54    push        ebx
 0043DA55    push        esi
 0043DA56    push        edi
 0043DA57    add         esp,0FFFFFFF0
 0043DA5A    mov         esi,edx
 0043DA5C    lea         edi,[esp]
 0043DA5F    movs        dword ptr [edi],dword ptr [esi]
 0043DA60    movs        dword ptr [edi],dword ptr [esi]
 0043DA61    movs        dword ptr [edi],dword ptr [esi]
 0043DA62    movs        dword ptr [edi],dword ptr [esi]
 0043DA63    mov         ebx,eax
 0043DA65    xor         esi,esi
 0043DA67    mov         eax,ebx
 0043DA69    mov         edx,dword ptr [eax]
 0043DA6B    call        dword ptr [edx+58]
 0043DA6E    test        eax,eax
>0043DA70    je          0043DACE
 0043DA72    mov         eax,ebx
 0043DA74    mov         edx,dword ptr [eax]
 0043DA76    call        dword ptr [edx+58]
 0043DA79    mov         edi,eax
 0043DA7B    mov         eax,ebx
 0043DA7D    call        TObject.ClassType
 0043DA82    cmp         edi,eax
>0043DA84    je          0043DACE
 0043DA86    mov         eax,ebx
 0043DA88    mov         edx,dword ptr [eax]
 0043DA8A    call        dword ptr [edx+58]
 0043DA8D    mov         ecx,dword ptr ds:[5AE584];^Application:TApplication
 0043DA93    mov         ecx,dword ptr [ecx]
 0043DA95    mov         dl,1
 0043DA97    call        dword ptr [eax+2C]
 0043DA9A    mov         esi,eax
 0043DA9C    mov         edx,dword ptr [esp+4]
 0043DAA0    mov         eax,esi
 0043DAA2    call        TControl.SetTop
 0043DAA7    mov         edx,dword ptr [esp]
 0043DAAA    mov         eax,esi
 0043DAAC    call        TControl.SetLeft
 0043DAB1    mov         edx,dword ptr [esp+8]
 0043DAB5    sub         edx,dword ptr [esp]
 0043DAB8    mov         eax,esi
 0043DABA    call        TControl.SetClientWidth
 0043DABF    mov         edx,dword ptr [esp+0C]
 0043DAC3    sub         edx,dword ptr [esp+4]
 0043DAC7    mov         eax,esi
 0043DAC9    call        TControl.SetClientHeight
 0043DACE    mov         eax,esi
 0043DAD0    add         esp,10
 0043DAD3    pop         edi
 0043DAD4    pop         esi
 0043DAD5    pop         ebx
 0043DAD6    ret
*}
end;

//0043DAD8
procedure UpdateFloatingDockSitePos;
begin
{*
 0043DAD8    push        ebp
 0043DAD9    mov         ebp,esp
 0043DADB    add         esp,0FFFFFFE0
 0043DADE    push        ebx
 0043DADF    push        esi
 0043DAE0    push        edi
 0043DAE1    mov         edi,dword ptr [ebp+8]
 0043DAE4    add         edi,0FFFFFFFC
 0043DAE7    lea         ecx,[ebp-10]
 0043DAEA    mov         eax,dword ptr [edi]
 0043DAEC    mov         edx,dword ptr [eax+44]
 0043DAEF    mov         eax,dword ptr [edi]
 0043DAF1    mov         eax,dword ptr [eax+40]
 0043DAF4    call        Point
 0043DAF9    lea         edx,[ebp-10]
 0043DAFC    lea         ecx,[ebp-8]
 0043DAFF    mov         eax,dword ptr [edi]
 0043DB01    mov         eax,dword ptr [eax+30]
 0043DB04    call        TControl.ClientToScreen
 0043DB09    mov         eax,dword ptr [ebp+8]
 0043DB0C    mov         eax,dword ptr [eax-8]
 0043DB0F    mov         eax,dword ptr [eax+8]
 0043DB12    lea         ebx,[eax+44]
 0043DB15    mov         eax,dword ptr [ebx+0C]
 0043DB18    sub         eax,dword ptr [ebx+4]
 0043DB1B    mov         edx,dword ptr [edi]
 0043DB1D    mov         esi,dword ptr [edx+30]
 0043DB20    add         eax,dword ptr [esi+4C]
 0043DB23    mov         edx,dword ptr [edi]
 0043DB25    sub         eax,dword ptr [edx+4C]
 0043DB28    push        eax
 0043DB29    lea         eax,[ebp-20]
 0043DB2C    push        eax
 0043DB2D    mov         ecx,dword ptr [ebx+8]
 0043DB30    sub         ecx,dword ptr [ebx]
 0043DB32    add         ecx,dword ptr [esi+48]
 0043DB35    mov         eax,dword ptr [edi]
 0043DB37    sub         ecx,dword ptr [eax+48]
 0043DB3A    mov         edx,dword ptr [esi+44]
 0043DB3D    add         edx,dword ptr [ebx+4]
 0043DB40    sub         edx,dword ptr [ebp-4]
 0043DB43    mov         eax,dword ptr [esi+40]
 0043DB46    add         eax,dword ptr [ebx]
 0043DB48    sub         eax,dword ptr [ebp-8]
 0043DB4B    call        Rect
 0043DB50    lea         edx,[ebp-20]
 0043DB53    mov         eax,esi
 0043DB55    call        TControl.SetBoundsRect
 0043DB5A    pop         edi
 0043DB5B    pop         esi
 0043DB5C    pop         ebx
 0043DB5D    mov         esp,ebp
 0043DB5F    pop         ebp
 0043DB60    ret
*}
end;

//0043DB64
procedure TControl.CMFloat(var Message:TCMFloat);
begin
{*
 0043DB64    push        ebp
 0043DB65    mov         ebp,esp
 0043DB67    add         esp,0FFFFFFF8
 0043DB6A    push        ebx
 0043DB6B    mov         dword ptr [ebp-8],edx
 0043DB6E    mov         dword ptr [ebp-4],eax
 0043DB71    mov         eax,dword ptr [ebp-4]
 0043DB74    mov         edx,dword ptr [eax]
 0043DB76    call        dword ptr [edx+54]
 0043DB79    test        al,al
>0043DB7B    je          0043DB8F
 0043DB7D    mov         eax,dword ptr [ebp-4]
 0043DB80    cmp         dword ptr [eax+30],0
>0043DB84    je          0043DB8F
 0043DB86    push        ebp
 0043DB87    call        UpdateFloatingDockSitePos
 0043DB8C    pop         ecx
>0043DB8D    jmp         0043DBBF
 0043DB8F    mov         eax,dword ptr [ebp-8]
 0043DB92    mov         eax,dword ptr [eax+8]
 0043DB95    lea         edx,[eax+44]
 0043DB98    mov         eax,dword ptr [ebp-4]
 0043DB9B    call        TControl.CreateFloatingDockSite
 0043DBA0    mov         ebx,eax
 0043DBA2    test        ebx,ebx
>0043DBA4    je          0043DBBF
 0043DBA6    mov         eax,dword ptr [ebp-8]
 0043DBA9    mov         eax,dword ptr [eax+8]
 0043DBAC    mov         dword ptr [eax+4],ebx
 0043DBAF    mov         eax,ebx
 0043DBB1    call        TWinControl.GetHandle
 0043DBB6    mov         edx,dword ptr [ebp-8]
 0043DBB9    mov         edx,dword ptr [edx+8]
 0043DBBC    mov         dword ptr [edx+8],eax
 0043DBBF    pop         ebx
 0043DBC0    pop         ecx
 0043DBC1    pop         ecx
 0043DBC2    pop         ebp
 0043DBC3    ret
*}
end;

//0043DBC4
procedure TControl.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 0043DBC4    push        ebp
 0043DBC5    mov         ebp,esp
 0043DBC7    push        0
 0043DBC9    push        0
 0043DBCB    push        ebx
 0043DBCC    push        esi
 0043DBCD    push        edi
 0043DBCE    mov         ebx,ecx
 0043DBD0    mov         edi,edx
 0043DBD2    mov         esi,eax
 0043DBD4    xor         eax,eax
 0043DBD6    push        ebp
 0043DBD7    push        43DCB2
 0043DBDC    push        dword ptr fs:[eax]
 0043DBDF    mov         dword ptr fs:[eax],esp
 0043DBE2    mov         eax,edi
 0043DBE4    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043DBEA    call        @IsClass
 0043DBEF    test        al,al
>0043DBF1    je          0043DC97
 0043DBF7    test        bl,bl
>0043DBF9    je          0043DC22
 0043DBFB    lea         edx,[ebp-4]
 0043DBFE    mov         eax,esi
 0043DC00    call        TControl.GetText
 0043DC05    cmp         dword ptr [ebp-4],0
>0043DC09    je          0043DC22
 0043DC0B    lea         edx,[ebp-8]
 0043DC0E    mov         eax,esi
 0043DC10    call        TControl.GetText
 0043DC15    mov         eax,dword ptr [ebp-8]
 0043DC18    mov         edx,dword ptr [esi+8]
 0043DC1B    call        @LStrCmp
>0043DC20    jne         0043DC2C
 0043DC22    mov         edx,dword ptr [edi+64]
 0043DC25    mov         eax,esi
 0043DC27    call        TControl.SetText
 0043DC2C    test        bl,bl
>0043DC2E    je          0043DC3B
 0043DC30    mov         eax,esi
 0043DC32    mov         edx,dword ptr [eax]
 0043DC34    call        dword ptr [edx+50]
 0043DC37    cmp         al,1
>0043DC39    jne         0043DC45
 0043DC3B    mov         dl,byte ptr [edi+6A]
 0043DC3E    mov         eax,esi
 0043DC40    mov         ecx,dword ptr [eax]
 0043DC42    call        dword ptr [ecx+64]
 0043DC45    test        bl,bl
>0043DC47    je          0043DC52
 0043DC49    cmp         dword ptr [esi+80],0
>0043DC50    jne         0043DC60
 0043DC52    lea         eax,[esi+80]
 0043DC58    mov         edx,dword ptr [edi+7C]
 0043DC5B    call        @LStrAsg
 0043DC60    test        bl,bl
>0043DC62    je          0043DC6A
 0043DC64    cmp         byte ptr [esi+57],1
>0043DC68    jne         0043DC77
 0043DC6A    mov         dl,byte ptr [edi+86]
 0043DC70    mov         eax,esi
 0043DC72    call        TControl.SetVisible
 0043DC77    test        bl,bl
>0043DC79    je          0043DC85
 0043DC7B    cmp         word ptr [esi+122],0
>0043DC83    jne         0043DC97
 0043DC85    mov         eax,dword ptr [edi+40]
 0043DC88    mov         dword ptr [esi+120],eax
 0043DC8E    mov         eax,dword ptr [edi+44]
 0043DC91    mov         dword ptr [esi+124],eax
 0043DC97    xor         eax,eax
 0043DC99    pop         edx
 0043DC9A    pop         ecx
 0043DC9B    pop         ecx
 0043DC9C    mov         dword ptr fs:[eax],edx
 0043DC9F    push        43DCB9
 0043DCA4    lea         eax,[ebp-8]
 0043DCA7    mov         edx,2
 0043DCAC    call        @LStrArrayClr
 0043DCB1    ret
>0043DCB2    jmp         @HandleFinally
>0043DCB7    jmp         0043DCA4
 0043DCB9    pop         edi
 0043DCBA    pop         esi
 0043DCBB    pop         ebx
 0043DCBC    pop         ecx
 0043DCBD    pop         ecx
 0043DCBE    pop         ebp
 0043DCBF    ret
*}
end;

//0043DCC0
procedure TControl.DoActionChange(Sender:TObject);
begin
{*
 0043DCC0    push        ebx
 0043DCC1    push        esi
 0043DCC2    mov         esi,edx
 0043DCC4    mov         ebx,eax
 0043DCC6    mov         eax,ebx
 0043DCC8    mov         edx,dword ptr [eax]
 0043DCCA    call        dword ptr [edx+3C]
 0043DCCD    cmp         esi,eax
>0043DCCF    jne         0043DCE0
 0043DCD1    xor         ecx,ecx
 0043DCD3    mov         edx,esi
 0043DCD5    mov         eax,ebx
 0043DCD7    mov         si,0FFEF
 0043DCDB    call        @CallDynaInst
 0043DCE0    pop         esi
 0043DCE1    pop         ebx
 0043DCE2    ret
*}
end;

//0043DCE4
procedure TControl.sub_0043DCE4;
begin
{*
 0043DCE4    mov         eax,[00437074];TControlActionLink
 0043DCE9    ret
*}
end;

//0043DCEC
function TControl.IsCaptionStored(Value:TCaption):Boolean;
begin
{*
 0043DCEC    push        ebx
 0043DCED    push        esi
 0043DCEE    mov         ebx,eax
 0043DCF0    mov         esi,dword ptr [ebx+6C]
 0043DCF3    test        esi,esi
>0043DCF5    je          0043DD07
 0043DCF7    mov         eax,esi
 0043DCF9    mov         edx,dword ptr [eax]
 0043DCFB    call        dword ptr [edx+20]
 0043DCFE    test        al,al
>0043DD00    je          0043DD07
 0043DD02    xor         eax,eax
 0043DD04    pop         esi
 0043DD05    pop         ebx
 0043DD06    ret
 0043DD07    mov         al,1
 0043DD09    pop         esi
 0043DD0A    pop         ebx
 0043DD0B    ret
*}
end;

//0043DD0C
function TControl.IsEnabledStored(Value:Boolean):Boolean;
begin
{*
 0043DD0C    push        ebx
 0043DD0D    push        esi
 0043DD0E    mov         ebx,eax
 0043DD10    mov         esi,dword ptr [ebx+6C]
 0043DD13    test        esi,esi
>0043DD15    je          0043DD27
 0043DD17    mov         eax,esi
 0043DD19    mov         edx,dword ptr [eax]
 0043DD1B    call        dword ptr [edx+28]
 0043DD1E    test        al,al
>0043DD20    je          0043DD27
 0043DD22    xor         eax,eax
 0043DD24    pop         esi
 0043DD25    pop         ebx
 0043DD26    ret
 0043DD27    mov         al,1
 0043DD29    pop         esi
 0043DD2A    pop         ebx
 0043DD2B    ret
*}
end;

//0043DD2C
function TControl.IsHintStored(Value:String):Boolean;
begin
{*
 0043DD2C    push        ebx
 0043DD2D    push        esi
 0043DD2E    mov         ebx,eax
 0043DD30    mov         esi,dword ptr [ebx+6C]
 0043DD33    test        esi,esi
>0043DD35    je          0043DD47
 0043DD37    mov         eax,esi
 0043DD39    mov         edx,dword ptr [eax]
 0043DD3B    call        dword ptr [edx+38]
 0043DD3E    test        al,al
>0043DD40    je          0043DD47
 0043DD42    xor         eax,eax
 0043DD44    pop         esi
 0043DD45    pop         ebx
 0043DD46    ret
 0043DD47    mov         al,1
 0043DD49    pop         esi
 0043DD4A    pop         ebx
 0043DD4B    ret
*}
end;

//0043DD4C
function TControl.IsHelpContextStored(Value:String):Boolean;
begin
{*
 0043DD4C    push        ebx
 0043DD4D    push        esi
 0043DD4E    mov         ebx,eax
 0043DD50    mov         esi,dword ptr [ebx+6C]
 0043DD53    test        esi,esi
>0043DD55    je          0043DD67
 0043DD57    mov         eax,esi
 0043DD59    mov         edx,dword ptr [eax]
 0043DD5B    call        dword ptr [edx+30]
 0043DD5E    test        al,al
>0043DD60    je          0043DD67
 0043DD62    xor         eax,eax
 0043DD64    pop         esi
 0043DD65    pop         ebx
 0043DD66    ret
 0043DD67    mov         al,1
 0043DD69    pop         esi
 0043DD6A    pop         ebx
 0043DD6B    ret
*}
end;

//0043DD6C
function TControl.IsVisibleStored(Value:Boolean):Boolean;
begin
{*
 0043DD6C    push        ebx
 0043DD6D    push        esi
 0043DD6E    mov         ebx,eax
 0043DD70    mov         esi,dword ptr [ebx+6C]
 0043DD73    test        esi,esi
>0043DD75    je          0043DD87
 0043DD77    mov         eax,esi
 0043DD79    mov         edx,dword ptr [eax]
 0043DD7B    call        dword ptr [edx+44]
 0043DD7E    test        al,al
>0043DD80    je          0043DD87
 0043DD82    xor         eax,eax
 0043DD84    pop         esi
 0043DD85    pop         ebx
 0043DD86    ret
 0043DD87    mov         al,1
 0043DD89    pop         esi
 0043DD8A    pop         ebx
 0043DD8B    ret
*}
end;

//0043DD8C
function TControl.IsOnClickStored(Value:TNotifyEvent):Boolean;
begin
{*
 0043DD8C    push        ebx
 0043DD8D    push        esi
 0043DD8E    mov         ebx,eax
 0043DD90    mov         esi,dword ptr [ebx+6C]
 0043DD93    test        esi,esi
>0043DD95    je          0043DDA7
 0043DD97    mov         eax,esi
 0043DD99    mov         edx,dword ptr [eax]
 0043DD9B    call        dword ptr [edx+8]
 0043DD9E    test        al,al
>0043DDA0    je          0043DDA7
 0043DDA2    xor         eax,eax
 0043DDA4    pop         esi
 0043DDA5    pop         ebx
 0043DDA6    ret
 0043DDA7    mov         al,1
 0043DDA9    pop         esi
 0043DDAA    pop         ebx
 0043DDAB    ret
*}
end;

//0043DDAC
procedure TControl.Loaded;
begin
{*
 0043DDAC    push        ebx
 0043DDAD    push        esi
 0043DDAE    mov         ebx,eax
 0043DDB0    mov         eax,ebx
 0043DDB2    call        TComponent.Loaded
 0043DDB7    mov         eax,ebx
 0043DDB9    mov         edx,dword ptr [eax]
 0043DDBB    call        dword ptr [edx+3C]
 0043DDBE    test        eax,eax
>0043DDC0    je          0043DDD8
 0043DDC2    mov         eax,ebx
 0043DDC4    mov         edx,dword ptr [eax]
 0043DDC6    call        dword ptr [edx+3C]
 0043DDC9    mov         edx,eax
 0043DDCB    mov         cl,1
 0043DDCD    mov         eax,ebx
 0043DDCF    mov         si,0FFEF
 0043DDD3    call        @CallDynaInst
 0043DDD8    mov         eax,ebx
 0043DDDA    call        TControl.UpdateAnchorRules
 0043DDDF    pop         esi
 0043DDE0    pop         ebx
 0043DDE1    ret
*}
end;

//0043DDE4
procedure TControl.AssignTo(Dest:TPersistent);
begin
{*
 0043DDE4    push        ebp
 0043DDE5    mov         ebp,esp
 0043DDE7    push        0
 0043DDE9    push        ebx
 0043DDEA    push        esi
 0043DDEB    push        edi
 0043DDEC    mov         esi,edx
 0043DDEE    mov         ebx,eax
 0043DDF0    xor         eax,eax
 0043DDF2    push        ebp
 0043DDF3    push        43DE80
 0043DDF8    push        dword ptr fs:[eax]
 0043DDFB    mov         dword ptr fs:[eax],esp
 0043DDFE    mov         eax,esi
 0043DE00    mov         edx,dword ptr ds:[44776C];TCustomAction
 0043DE06    call        @IsClass
 0043DE0B    test        al,al
>0043DE0D    je          0043DE61
 0043DE0F    mov         eax,ebx
 0043DE11    mov         edx,dword ptr [eax]
 0043DE13    call        dword ptr [edx+50]
 0043DE16    mov         edx,eax
 0043DE18    mov         edi,esi
 0043DE1A    mov         eax,edi
 0043DE1C    call        TCustomAction.SetEnabled
 0043DE21    mov         edx,dword ptr [ebx+80]
 0043DE27    mov         eax,edi
 0043DE29    call        TCustomAction.SetHint
 0043DE2E    lea         edx,[ebp-4]
 0043DE31    mov         eax,ebx
 0043DE33    call        TControl.GetText
 0043DE38    mov         edx,dword ptr [ebp-4]
 0043DE3B    mov         eax,edi
 0043DE3D    call        TCustomAction.SetCaption
 0043DE42    mov         dl,byte ptr [ebx+57]
 0043DE45    mov         eax,edi
 0043DE47    call        TCustomAction.SetVisible
 0043DE4C    push        dword ptr [ebx+124]
 0043DE52    push        dword ptr [ebx+120]
 0043DE58    mov         eax,edi
 0043DE5A    mov         edx,dword ptr [eax]
 0043DE5C    call        dword ptr [edx+34]
>0043DE5F    jmp         0043DE6A
 0043DE61    mov         edx,esi
 0043DE63    mov         eax,ebx
 0043DE65    call        TPersistent.AssignTo
 0043DE6A    xor         eax,eax
 0043DE6C    pop         edx
 0043DE6D    pop         ecx
 0043DE6E    pop         ecx
 0043DE6F    mov         dword ptr fs:[eax],edx
 0043DE72    push        43DE87
 0043DE77    lea         eax,[ebp-4]
 0043DE7A    call        @LStrClr
 0043DE7F    ret
>0043DE80    jmp         @HandleFinally
>0043DE85    jmp         0043DE77
 0043DE87    pop         edi
 0043DE88    pop         esi
 0043DE89    pop         ebx
 0043DE8A    pop         ecx
 0043DE8B    pop         ebp
 0043DE8C    ret
*}
end;

//0043DE90
{*function MinVar(const Data:array[$0..-$1] of System.Double; const _Dv_:?):Integer;
begin
 0043DE90    push        ebp
 0043DE91    mov         ebp,esp
 0043DE93    push        ecx
 0043DE94    push        ebx
 0043DE95    push        esi
 0043DE96    mov         dword ptr [ebp-4],eax
 0043DE99    xor         ebx,ebx
 0043DE9B    mov         ecx,edx
 0043DE9D    test        ecx,ecx
>0043DE9F    jle         0043DEC2
 0043DEA1    mov         esi,1
 0043DEA6    mov         edx,dword ptr [ebp-4]
 0043DEA9    add         edx,8
 0043DEAC    fld         qword ptr [edx]
 0043DEAE    mov         eax,dword ptr [ebp-4]
 0043DEB1    fcomp       qword ptr [eax+ebx*8]
 0043DEB4    fnstsw      al
 0043DEB6    sahf
>0043DEB7    jae         0043DEBB
 0043DEB9    mov         ebx,esi
 0043DEBB    inc         esi
 0043DEBC    add         edx,8
 0043DEBF    dec         ecx
>0043DEC0    jne         0043DEAC
 0043DEC2    mov         eax,ebx
 0043DEC4    pop         esi
 0043DEC5    pop         ebx
 0043DEC6    pop         ecx
 0043DEC7    pop         ebp
 0043DEC8    ret
end;*}

//0043DECC
procedure TControl.GetDockEdge(MousePos:TPoint);
begin
{*
 0043DECC    push        ebx
 0043DECD    push        esi
 0043DECE    push        edi
 0043DECF    push        ebp
 0043DED0    add         esp,0FFFFFFC8
 0043DED3    mov         esi,edx
 0043DED5    lea         edi,[esp]
 0043DED8    movs        dword ptr [edi],dword ptr [esi]
 0043DED9    movs        dword ptr [edi],dword ptr [esi]
 0043DEDA    xor         ebx,ebx
 0043DEDC    mov         esi,dword ptr [eax+48]
 0043DEDF    mov         edi,dword ptr [eax+4C]
 0043DEE2    mov         eax,dword ptr [esp]
 0043DEE5    test        eax,eax
>0043DEE7    jg          0043DEF0
 0043DEE9    mov         bl,3
>0043DEEB    jmp         0043DF71
 0043DEF0    cmp         esi,eax
>0043DEF2    jg          0043DEF8
 0043DEF4    mov         bl,4
>0043DEF6    jmp         0043DF71
 0043DEF8    mov         edx,dword ptr [esp+4]
 0043DEFC    test        edx,edx
>0043DEFE    jg          0043DF04
 0043DF00    mov         bl,1
>0043DF02    jmp         0043DF71
 0043DF04    cmp         edi,edx
>0043DF06    jg          0043DF0C
 0043DF08    mov         bl,2
>0043DF0A    jmp         0043DF71
 0043DF0C    mov         ebp,edx
 0043DF0E    sub         edi,edx
 0043DF10    mov         dword ptr [esp+8],eax
 0043DF14    sub         esi,eax
 0043DF16    fild        dword ptr [esp+8]
 0043DF1A    fstp        qword ptr [esp+0C]
 0043DF1E    wait
 0043DF1F    mov         dword ptr [esp+2C],esi
 0043DF23    fild        dword ptr [esp+2C]
 0043DF27    fstp        qword ptr [esp+14]
 0043DF2B    wait
 0043DF2C    mov         dword ptr [esp+30],ebp
 0043DF30    fild        dword ptr [esp+30]
 0043DF34    fstp        qword ptr [esp+1C]
 0043DF38    wait
 0043DF39    mov         dword ptr [esp+34],edi
 0043DF3D    fild        dword ptr [esp+34]
 0043DF41    fstp        qword ptr [esp+24]
 0043DF45    wait
 0043DF46    lea         eax,[esp+0C]
 0043DF4A    mov         edx,3
 0043DF4F    call        MinVar
 0043DF54    sub         eax,1
>0043DF57    jb          0043DF63
>0043DF59    je          0043DF67
 0043DF5B    dec         eax
>0043DF5C    je          0043DF6B
 0043DF5E    dec         eax
>0043DF5F    je          0043DF6F
>0043DF61    jmp         0043DF71
 0043DF63    mov         bl,3
>0043DF65    jmp         0043DF71
 0043DF67    mov         bl,4
>0043DF69    jmp         0043DF71
 0043DF6B    mov         bl,1
>0043DF6D    jmp         0043DF71
 0043DF6F    mov         bl,2
 0043DF71    mov         eax,ebx
 0043DF73    add         esp,38
 0043DF76    pop         ebp
 0043DF77    pop         edi
 0043DF78    pop         esi
 0043DF79    pop         ebx
 0043DF7A    ret
*}
end;

//0043DF7C
function TControl.GetFloating:Boolean;
begin
{*
 0043DF7C    push        ebx
 0043DF7D    mov         ebx,eax
 0043DF7F    cmp         dword ptr [ebx+0A0],0
>0043DF86    je          0043DFA0
 0043DF88    mov         eax,ebx
 0043DF8A    mov         edx,dword ptr [eax]
 0043DF8C    call        dword ptr [edx+58]
 0043DF8F    mov         edx,eax
 0043DF91    mov         eax,dword ptr [ebx+0A0]
 0043DF97    call        @IsClass
 0043DF9C    test        al,al
>0043DF9E    jne         0043DFA4
 0043DFA0    xor         eax,eax
 0043DFA2    pop         ebx
 0043DFA3    ret
 0043DFA4    mov         al,1
 0043DFA6    pop         ebx
 0043DFA7    ret
*}
end;

//0043DFA8
{*function sub_0043DFA8:?;
begin
 0043DFA8    mov         eax,dword ptr [eax+0B8];TControl.FFloatingDockSiteClass:TWinControlClass
 0043DFAE    ret
end;*}

//0043DFB0
procedure TControl.AdjustSize;
begin
{*
 0043DFB0    push        ebx
 0043DFB1    test        byte ptr [eax+1C],1
>0043DFB5    jne         0043DFCD
 0043DFB7    mov         edx,dword ptr [eax+48]
 0043DFBA    push        edx
 0043DFBB    mov         edx,dword ptr [eax+4C]
 0043DFBE    push        edx
 0043DFBF    mov         ecx,dword ptr [eax+44]
 0043DFC2    mov         edx,dword ptr [eax+40]
 0043DFC5    mov         ebx,dword ptr [eax]
 0043DFC7    call        dword ptr [ebx+84]
 0043DFCD    pop         ebx
 0043DFCE    ret
*}
end;

//0043DFD0
function TControl.DrawTextBiDiModeFlags(Flags:Longint):Longint;
begin
{*
 0043DFD0    push        ebx
 0043DFD1    push        esi
 0043DFD2    push        edi
 0043DFD3    mov         edi,eax
 0043DFD5    mov         ebx,edx
 0043DFD7    mov         eax,edi
 0043DFD9    mov         si,0FFC8
 0043DFDD    call        @CallDynaInst
 0043DFE2    test        al,al
>0043DFE4    je          0043E000
 0043DFE6    mov         eax,ebx
 0043DFE8    and         eax,2
 0043DFEB    cmp         eax,2
>0043DFEE    jne         0043DFF5
 0043DFF0    and         ebx,0FFFFFFFD
>0043DFF3    jmp         0043E000
 0043DFF5    mov         eax,ebx
 0043DFF7    and         eax,1
 0043DFFA    dec         eax
>0043DFFB    je          0043E000
 0043DFFD    or          ebx,2
 0043E000    mov         eax,edi
 0043E002    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 0043E007    or          ebx,eax
 0043E009    mov         eax,ebx
 0043E00B    pop         edi
 0043E00C    pop         esi
 0043E00D    pop         ebx
 0043E00E    ret
*}
end;

//0043E010
function TControl.DrawTextBiDiModeFlagsReadingOnly:Longint;
begin
{*
 0043E010    push        ebx
 0043E011    mov         ebx,eax
 0043E013    mov         eax,ebx
 0043E015    call        TControl.UseRightToLeftReading
 0043E01A    test        al,al
>0043E01C    je          0043E025
 0043E01E    mov         eax,20000
 0043E023    pop         ebx
 0043E024    ret
 0043E025    xor         eax,eax
 0043E027    pop         ebx
 0043E028    ret
*}
end;

//0043E02C
procedure TControl.InitiateAction;
begin
{*
 0043E02C    mov         edx,dword ptr [eax+6C]
 0043E02F    test        edx,edx
>0043E031    je          0043E03A
 0043E033    mov         eax,edx
 0043E035    mov         edx,dword ptr [eax]
 0043E037    call        dword ptr [edx+1C]
 0043E03A    ret
*}
end;

//0043E03C
procedure TControl.CMHintShow(var Message:TMessage);
begin
{*
 0043E03C    push        ebx
 0043E03D    push        esi
 0043E03E    push        edi
 0043E03F    mov         edi,edx
 0043E041    mov         ebx,eax
 0043E043    mov         esi,dword ptr [ebx+6C]
 0043E046    test        esi,esi
>0043E048    je          0043E062
 0043E04A    mov         eax,dword ptr [edi+8]
 0043E04D    lea         edx,[eax+38]
 0043E050    mov         eax,esi
 0043E052    mov         ecx,dword ptr [eax]
 0043E054    call        dword ptr [ecx+78]
 0043E057    test        al,al
>0043E059    jne         0043E062
 0043E05B    mov         dword ptr [edi+0C],1
 0043E062    pop         edi
 0043E063    pop         esi
 0043E064    pop         ebx
 0043E065    ret
*}
end;

//0043E068
procedure TControl.WMContextMenu(var Message:TWMContextMenu);
begin
{*
 0043E068    push        ebx
 0043E069    push        esi
 0043E06A    push        edi
 0043E06B    push        ebp
 0043E06C    add         esp,0FFFFFFD4
 0043E06F    mov         ebp,edx
 0043E071    mov         edi,eax
 0043E073    cmp         dword ptr [ebp+0C],0
>0043E077    jne         0043E187
 0043E07D    test        byte ptr [edi+1C],10
>0043E081    je          0043E091
 0043E083    mov         edx,ebp
 0043E085    mov         eax,edi
 0043E087    mov         ecx,dword ptr [eax]
 0043E089    call        dword ptr [ecx-10]
>0043E08C    jmp         0043E187
 0043E091    mov         edx,esp
 0043E093    mov         eax,dword ptr [ebp+8]
 0043E096    call        SmallPointToPoint
 0043E09B    mov         eax,esp
 0043E09D    call        InvalidPoint
 0043E0A2    test        al,al
>0043E0A4    je          0043E0B7
 0043E0A6    mov         eax,dword ptr [esp]
 0043E0A9    mov         dword ptr [esp+8],eax
 0043E0AD    mov         eax,dword ptr [esp+4]
 0043E0B1    mov         dword ptr [esp+0C],eax
>0043E0B5    jmp         0043E0F3
 0043E0B7    lea         ecx,[esp+8]
 0043E0BB    mov         edx,esp
 0043E0BD    mov         eax,edi
 0043E0BF    call        TControl.ScreenToClient
 0043E0C4    push        dword ptr [esp+0C]
 0043E0C8    push        dword ptr [esp+0C]
 0043E0CC    lea         edx,[esp+1C]
 0043E0D0    mov         eax,edi
 0043E0D2    mov         ecx,dword ptr [eax]
 0043E0D4    call        dword ptr [ecx+44]
 0043E0D7    lea         eax,[esp+1C]
 0043E0DB    push        eax
 0043E0DC    call        user32.PtInRect
 0043E0E1    test        eax,eax
>0043E0E3    jne         0043E0F3
 0043E0E5    mov         edx,ebp
 0043E0E7    mov         eax,edi
 0043E0E9    mov         ecx,dword ptr [eax]
 0043E0EB    call        dword ptr [ecx-10]
>0043E0EE    jmp         0043E187
 0043E0F3    mov         byte ptr [esp+10],0
 0043E0F8    lea         ecx,[esp+10]
 0043E0FC    lea         edx,[esp+8]
 0043E100    mov         eax,edi
 0043E102    mov         si,0FFE6
 0043E106    call        @CallDynaInst
 0043E10B    xor         eax,eax
 0043E10D    mov         al,byte ptr [esp+10]
 0043E111    mov         dword ptr [ebp+0C],eax
 0043E114    cmp         byte ptr [esp+10],0
>0043E119    jne         0043E187
 0043E11B    mov         eax,edi
 0043E11D    mov         si,0FFD6
 0043E121    call        @CallDynaInst
 0043E126    mov         ebx,eax
 0043E128    test        ebx,ebx
>0043E12A    je          0043E178
 0043E12C    cmp         byte ptr [ebx+61],0
>0043E130    je          0043E178
 0043E132    xor         edx,edx
 0043E134    mov         eax,edi
 0043E136    call        TControl.SendCancelMode
 0043E13B    mov         dword ptr [ebx+64],edi
 0043E13E    mov         eax,esp
 0043E140    call        InvalidPoint
 0043E145    test        al,al
>0043E147    je          0043E163
 0043E149    lea         ecx,[esp+24]
 0043E14D    xor         edx,edx
 0043E14F    xor         eax,eax
 0043E151    call        Point
 0043E156    lea         edx,[esp+24]
 0043E15A    mov         ecx,esp
 0043E15C    mov         eax,edi
 0043E15E    call        TControl.ClientToScreen
 0043E163    mov         ecx,dword ptr [esp+4]
 0043E167    mov         edx,dword ptr [esp]
 0043E16A    mov         eax,ebx
 0043E16C    mov         ebx,dword ptr [eax]
 0043E16E    call        dword ptr [ebx+40]
 0043E171    mov         dword ptr [ebp+0C],1
 0043E178    cmp         dword ptr [ebp+0C],0
>0043E17C    jne         0043E187
 0043E17E    mov         edx,ebp
 0043E180    mov         eax,edi
 0043E182    mov         ecx,dword ptr [eax]
 0043E184    call        dword ptr [ecx-10]
 0043E187    add         esp,2C
 0043E18A    pop         ebp
 0043E18B    pop         edi
 0043E18C    pop         esi
 0043E18D    pop         ebx
 0043E18E    ret
*}
end;

//0043E190
procedure TControl.DoContextPopup(MousePos:TPoint; var Handled:Boolean);
begin
{*
 0043E190    push        ebx
 0043E191    push        esi
 0043E192    push        edi
 0043E193    add         esp,0FFFFFFF8
 0043E196    mov         esi,edx
 0043E198    lea         edi,[esp]
 0043E19B    movs        dword ptr [edi],dword ptr [esi]
 0043E19C    movs        dword ptr [edi],dword ptr [esi]
 0043E19D    cmp         word ptr [eax+132],0
>0043E1A5    je          0043E1BC
 0043E1A7    push        ecx
 0043E1A8    mov         ebx,eax
 0043E1AA    mov         edx,eax
 0043E1AC    lea         ecx,[esp+4]
 0043E1B0    mov         eax,dword ptr [ebx+134]
 0043E1B6    call        dword ptr [ebx+130]
 0043E1BC    pop         ecx
 0043E1BD    pop         edx
 0043E1BE    pop         edi
 0043E1BF    pop         esi
 0043E1C0    pop         ebx
 0043E1C1    ret
*}
end;

//0043E1C4
procedure TControl.SetConstraints(const Value:TSizeConstraints);
begin
{*
 0043E1C4    mov         eax,dword ptr [eax+74]
 0043E1C7    mov         ecx,dword ptr [eax]
 0043E1C9    call        dword ptr [ecx+8]
 0043E1CC    ret
*}
end;

//0043E1D0
procedure TWinControlActionLink.AssignClient(AClient:TObject);
begin
{*
 0043E1D0    push        ebx
 0043E1D1    push        esi
 0043E1D2    mov         esi,edx
 0043E1D4    mov         ebx,eax
 0043E1D6    mov         edx,esi
 0043E1D8    mov         eax,ebx
 0043E1DA    call        TControlActionLink.AssignClient
 0043E1DF    mov         eax,esi
 0043E1E1    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043E1E7    call        @AsClass
 0043E1EC    mov         dword ptr [ebx+20],eax
 0043E1EF    pop         esi
 0043E1F0    pop         ebx
 0043E1F1    ret
*}
end;

//0043E1F4
procedure TWinControlActionLink.IsHelpContextLinked;
begin
{*
 0043E1F4    mov         edx,dword ptr [eax]
 0043E1F6    call        dword ptr [edx+34];TControlActionLink.IsHelpLinked
 0043E1F9    ret
*}
end;

//0043E1FC
procedure sub_0043E1FC;
begin
{*
 0043E1FC    call        0043ADCC
 0043E201    ret
*}
end;

//0043E204
constructor TWinControl.Create(AOwner:TComponent);
begin
{*
 0043E204    push        ebp
 0043E205    mov         ebp,esp
 0043E207    add         esp,0FFFFFFF8
 0043E20A    push        ebx
 0043E20B    push        esi
 0043E20C    xor         ebx,ebx
 0043E20E    mov         dword ptr [ebp-8],ebx
 0043E211    test        dl,dl
>0043E213    je          0043E21D
 0043E215    add         esp,0FFFFFFF0
 0043E218    call        @ClassCreate
 0043E21D    mov         byte ptr [ebp-1],dl
 0043E220    mov         ebx,eax
 0043E222    xor         eax,eax
 0043E224    push        ebp
 0043E225    push        43E2FC
 0043E22A    push        dword ptr fs:[eax]
 0043E22D    mov         dword ptr fs:[eax],esp
 0043E230    xor         edx,edx
 0043E232    mov         eax,ebx
 0043E234    call        TControl.Create
 0043E239    push        ebx
 0043E23A    push        43FC94;TWinControl.MainWndProc
 0043E23F    call        MakeObjectInstance
 0043E244    mov         dword ptr [ebx+18C],eax
 0043E24A    mov         dl,1
 0043E24C    mov         eax,[00424798];TBrush
 0043E251    call        TBrush.Create
 0043E256    mov         esi,eax
 0043E258    mov         dword ptr [ebx+170],esi
 0043E25E    mov         edx,dword ptr [ebx+70]
 0043E261    mov         eax,esi
 0043E263    call        TBrush.SetColor
 0043E268    mov         byte ptr [ebx+1A9],1
 0043E26F    mov         dword ptr [ebx+1A0],0FFFFFFFF
 0043E279    mov         byte ptr [ebx+184],3
 0043E280    mov         eax,[005AE810];^SysLocale:TSysLocale
 0043E285    cmp         dword ptr [eax+4],11
>0043E289    jne         0043E298
 0043E28B    lea         eax,[ebx+188]
 0043E291    call        @LStrClr
>0043E296    jmp         0043E2B5
 0043E298    lea         edx,[ebp-8]
 0043E29B    mov         eax,[005AE7DC];^Screen:TScreen
 0043E2A0    mov         eax,dword ptr [eax]
 0043E2A2    call        TScreen.GetDefaultIME
 0043E2A7    mov         edx,dword ptr [ebp-8]
 0043E2AA    lea         eax,[ebx+188]
 0043E2B0    call        @LStrAsg
 0043E2B5    mov         byte ptr [ebx+1A7],0
 0043E2BC    mov         al,[0043E324]
 0043E2C1    mov         byte ptr [ebx+162],al
 0043E2C7    mov         byte ptr [ebx+163],2
 0043E2CE    mov         byte ptr [ebx+164],1
 0043E2D5    mov         dword ptr [ebx+168],1
 0043E2DF    mov         byte ptr [ebx+150],1
 0043E2E6    xor         eax,eax
 0043E2E8    pop         edx
 0043E2E9    pop         ecx
 0043E2EA    pop         ecx
 0043E2EB    mov         dword ptr fs:[eax],edx
 0043E2EE    push        43E303
 0043E2F3    lea         eax,[ebp-8]
 0043E2F6    call        @LStrClr
 0043E2FB    ret
>0043E2FC    jmp         @HandleFinally
>0043E301    jmp         0043E2F3
 0043E303    mov         eax,ebx
 0043E305    cmp         byte ptr [ebp-1],0
>0043E309    je          0043E31A
 0043E30B    call        @AfterConstruction
 0043E310    pop         dword ptr fs:[0]
 0043E317    add         esp,0C
 0043E31A    mov         eax,ebx
 0043E31C    pop         esi
 0043E31D    pop         ebx
 0043E31E    pop         ecx
 0043E31F    pop         ecx
 0043E320    pop         ebp
 0043E321    ret
*}
end;

//0043E328
destructor TWinControl.Destroy;
begin
{*
 0043E328    push        ebx
 0043E329    push        esi
 0043E32A    push        edi
 0043E32B    call        @BeforeDestruction
 0043E330    mov         ebx,edx
 0043E332    mov         edi,eax
 0043E334    mov         eax,edi
 0043E336    call        TComponent.Destroying
 0043E33B    cmp         byte ptr [edi+1A8],0
>0043E342    je          0043E354
 0043E344    mov         byte ptr [edi+1A8],0
 0043E34B    xor         edx,edx
 0043E34D    mov         eax,edi
 0043E34F    call        RegisterDockSite
 0043E354    lea         eax,[edi+17C]
 0043E35A    call        @IntfClear
 0043E35F    mov         eax,dword ptr [edi+178]
 0043E365    call        TObject.Free
 0043E36A    cmp         dword ptr [edi+30],0
>0043E36E    je          0043E379
 0043E370    mov         dl,1
 0043E372    mov         eax,edi
 0043E374    call        TWinControl.RemoveFocus
 0043E379    cmp         dword ptr [edi+180],0
>0043E380    je          0043E38C
 0043E382    mov         eax,edi
 0043E384    mov         edx,dword ptr [eax]
 0043E386    call        dword ptr [edx+0AC]
 0043E38C    mov         eax,edi
 0043E38E    call        TWinControl.GetControlCount
 0043E393    test        eax,eax
>0043E395    je          0043E3C0
 0043E397    mov         edx,eax
 0043E399    dec         edx
 0043E39A    mov         eax,edi
 0043E39C    call        TWinControl.GetControl
 0043E3A1    mov         esi,eax
 0043E3A3    mov         edx,esi
 0043E3A5    mov         eax,edi
 0043E3A7    call        TWinControl.Remove
 0043E3AC    mov         dl,1
 0043E3AE    mov         eax,esi
 0043E3B0    mov         ecx,dword ptr [eax]
 0043E3B2    call        dword ptr [ecx-4]
 0043E3B5    mov         eax,edi
 0043E3B7    call        TWinControl.GetControlCount
 0043E3BC    test        eax,eax
>0043E3BE    jne         0043E397
 0043E3C0    mov         eax,dword ptr [edi+170]
 0043E3C6    call        TObject.Free
 0043E3CB    mov         eax,dword ptr [edi+18C]
 0043E3D1    test        eax,eax
>0043E3D3    je          0043E3DA
 0043E3D5    call        FreeObjectInstance
 0043E3DA    mov         edx,ebx
 0043E3DC    and         dl,0FC
 0043E3DF    mov         eax,edi
 0043E3E1    call        TControl.Destroy
 0043E3E6    test        bl,bl
>0043E3E8    jle         0043E3F1
 0043E3EA    mov         eax,edi
 0043E3EC    call        @ClassDestroy
 0043E3F1    pop         edi
 0043E3F2    pop         esi
 0043E3F3    pop         ebx
 0043E3F4    ret
*}
end;

//0043E3F8
procedure TWinControl.FixupTabList;
begin
{*
 0043E3F8    push        ebp
 0043E3F9    mov         ebp,esp
 0043E3FB    add         esp,0FFFFFFF4
 0043E3FE    push        ebx
 0043E3FF    push        esi
 0043E400    mov         dword ptr [ebp-4],eax
 0043E403    mov         eax,dword ptr [ebp-4]
 0043E406    cmp         dword ptr [eax+19C],0
>0043E40D    je          0043E4C3
 0043E413    mov         dl,1
 0043E415    mov         eax,[00417CEC];TList
 0043E41A    call        TObject.Create
 0043E41F    mov         dword ptr [ebp-0C],eax
 0043E422    xor         ecx,ecx
 0043E424    push        ebp
 0043E425    push        43E4BC
 0043E42A    push        dword ptr fs:[ecx]
 0043E42D    mov         dword ptr fs:[ecx],esp
 0043E430    mov         eax,dword ptr [ebp-4]
 0043E433    mov         eax,dword ptr [eax+19C]
 0043E439    mov         eax,dword ptr [eax+8]
 0043E43C    mov         dword ptr [ebp-8],eax
 0043E43F    mov         edx,dword ptr [ebp-8]
 0043E442    mov         eax,dword ptr [ebp-0C]
 0043E445    call        TList.SetCount
 0043E44A    mov         ebx,dword ptr [ebp-8]
 0043E44D    dec         ebx
 0043E44E    test        ebx,ebx
>0043E450    jl          0043E482
 0043E452    inc         ebx
 0043E453    xor         esi,esi
 0043E455    mov         eax,dword ptr [ebp-4]
 0043E458    mov         eax,dword ptr [eax+19C]
 0043E45E    mov         edx,esi
 0043E460    call        TList.Get
 0043E465    mov         edx,dword ptr [eax+1A0]
 0043E46B    test        edx,edx
>0043E46D    jl          0043E47E
 0043E46F    cmp         edx,dword ptr [ebp-8]
>0043E472    jge         0043E47E
 0043E474    mov         ecx,eax
 0043E476    mov         eax,dword ptr [ebp-0C]
 0043E479    call        TList.Put
 0043E47E    inc         esi
 0043E47F    dec         ebx
>0043E480    jne         0043E455
 0043E482    mov         ebx,dword ptr [ebp-8]
 0043E485    dec         ebx
 0043E486    test        ebx,ebx
>0043E488    jl          0043E4A6
 0043E48A    inc         ebx
 0043E48B    xor         esi,esi
 0043E48D    mov         edx,esi
 0043E48F    mov         eax,dword ptr [ebp-0C]
 0043E492    call        TList.Get
 0043E497    test        eax,eax
>0043E499    je          0043E4A2
 0043E49B    mov         edx,esi
 0043E49D    call        TWinControl.UpdateTabOrder
 0043E4A2    inc         esi
 0043E4A3    dec         ebx
>0043E4A4    jne         0043E48D
 0043E4A6    xor         eax,eax
 0043E4A8    pop         edx
 0043E4A9    pop         ecx
 0043E4AA    pop         ecx
 0043E4AB    mov         dword ptr fs:[eax],edx
 0043E4AE    push        43E4C3
 0043E4B3    mov         eax,dword ptr [ebp-0C]
 0043E4B6    call        TObject.Free
 0043E4BB    ret
>0043E4BC    jmp         @HandleFinally
>0043E4C1    jmp         0043E4B3
 0043E4C3    pop         esi
 0043E4C4    pop         ebx
 0043E4C5    mov         esp,ebp
 0043E4C7    pop         ebp
 0043E4C8    ret
*}
end;

//0043E4CC
procedure TWinControl.ReadState(Reader:TReader);
begin
{*
 0043E4CC    push        ebp
 0043E4CD    mov         ebp,esp
 0043E4CF    push        ecx
 0043E4D0    push        ebx
 0043E4D1    mov         ebx,edx
 0043E4D3    mov         dword ptr [ebp-4],eax
 0043E4D6    mov         eax,dword ptr [ebp-4]
 0043E4D9    call        TWinControl.DisableAlign
 0043E4DE    xor         eax,eax
 0043E4E0    push        ebp
 0043E4E1    push        43E50C
 0043E4E6    push        dword ptr fs:[eax]
 0043E4E9    mov         dword ptr fs:[eax],esp
 0043E4EC    mov         edx,ebx
 0043E4EE    mov         eax,dword ptr [ebp-4]
 0043E4F1    call        TControl.ReadState
 0043E4F6    xor         eax,eax
 0043E4F8    pop         edx
 0043E4F9    pop         ecx
 0043E4FA    pop         ecx
 0043E4FB    mov         dword ptr fs:[eax],edx
 0043E4FE    push        43E513
 0043E503    mov         eax,dword ptr [ebp-4]
 0043E506    call        TWinControl.EnableAlign
 0043E50B    ret
>0043E50C    jmp         @HandleFinally
>0043E511    jmp         0043E503
 0043E513    mov         eax,dword ptr [ebp-4]
 0043E516    call        TWinControl.FixupTabList
 0043E51B    mov         eax,dword ptr [ebp-4]
 0043E51E    cmp         dword ptr [eax+30],0
>0043E522    je          0043E535
 0043E524    push        0
 0043E526    xor         ecx,ecx
 0043E528    mov         edx,0B011
 0043E52D    mov         eax,dword ptr [ebp-4]
 0043E530    call        TControl.Perform
 0043E535    mov         eax,dword ptr [ebp-4]
 0043E538    call        TWinControl.UpdateControlState
 0043E53D    pop         ebx
 0043E53E    pop         ecx
 0043E53F    pop         ebp
 0043E540    ret
*}
end;

//0043E544
procedure sub_0043E544;
begin
{*
 0043E544    ret
*}
end;

//0043E548
function InsertBefore(C1:TControl; C2:TControl; AAlign:TAlign):Boolean;
begin
{*
 0043E548    push        ebp
 0043E549    mov         ebp,esp
 0043E54B    push        ecx
 0043E54C    push        ebx
 0043E54D    mov         byte ptr [ebp-1],cl
 0043E550    xor         ecx,ecx
 0043E552    xor         ebx,ebx
 0043E554    mov         bl,byte ptr [ebp-1]
 0043E557    cmp         ebx,6
>0043E55A    ja          0043E5CE
 0043E55C    jmp         dword ptr [ebx*4+43E563]
 0043E55C    dd          0043E5CE
 0043E55C    dd          0043E57F
 0043E55C    dd          0043E58A
 0043E55C    dd          0043E59D
 0043E55C    dd          0043E5A8
 0043E55C    dd          0043E5CE
 0043E55C    dd          0043E5BB
 0043E57F    mov         edx,dword ptr [edx+44]
 0043E582    cmp         edx,dword ptr [eax+44]
 0043E585    setg        cl
>0043E588    jmp         0043E5CE
 0043E58A    mov         ecx,dword ptr [edx+44]
 0043E58D    add         ecx,dword ptr [edx+4C]
 0043E590    mov         edx,dword ptr [eax+44]
 0043E593    add         edx,dword ptr [eax+4C]
 0043E596    cmp         ecx,edx
 0043E598    setle       cl
>0043E59B    jmp         0043E5CE
 0043E59D    mov         edx,dword ptr [edx+40]
 0043E5A0    cmp         edx,dword ptr [eax+40]
 0043E5A3    setg        cl
>0043E5A6    jmp         0043E5CE
 0043E5A8    mov         ecx,dword ptr [edx+40]
 0043E5AB    add         ecx,dword ptr [edx+48]
 0043E5AE    mov         edx,dword ptr [eax+40]
 0043E5B1    add         edx,dword ptr [eax+48]
 0043E5B4    cmp         ecx,edx
 0043E5B6    setle       cl
>0043E5B9    jmp         0043E5CE
 0043E5BB    mov         ecx,dword ptr [ebp+8]
 0043E5BE    mov         ecx,dword ptr [ecx-4]
 0043E5C1    xchg        eax,ecx
 0043E5C2    xchg        edx,ecx
 0043E5C4    mov         ebx,dword ptr [eax]
 0043E5C6    call        dword ptr [ebx+0A4]
 0043E5CC    mov         ecx,eax
 0043E5CE    mov         eax,ecx
 0043E5D0    pop         ebx
 0043E5D1    pop         ecx
 0043E5D2    pop         ebp
 0043E5D3    ret
*}
end;

//0043E5D4
procedure DoPosition(Control:TControl; AAlign:TAlign; AlignInfo:TAlignInfo);
begin
{*
 0043E5D4    push        ebp
 0043E5D5    mov         ebp,esp
 0043E5D7    add         esp,0FFFFFFC0
 0043E5DA    push        ebx
 0043E5DB    push        esi
 0043E5DC    push        edi
 0043E5DD    mov         esi,ecx
 0043E5DF    lea         edi,[ebp-30]
 0043E5E2    movs        dword ptr [edi],dword ptr [esi]
 0043E5E3    movs        dword ptr [edi],dword ptr [esi]
 0043E5E4    movs        dword ptr [edi],dword ptr [esi]
 0043E5E5    movs        dword ptr [edi],dword ptr [esi]
 0043E5E6    mov         byte ptr [ebp-5],dl
 0043E5E9    mov         dword ptr [ebp-4],eax
 0043E5EC    cmp         byte ptr [ebp-5],0
>0043E5F0    je          0043E609
 0043E5F2    xor         eax,eax
 0043E5F4    mov         al,byte ptr [ebp-5]
 0043E5F7    mov         al,byte ptr [eax+5ACB70]
 0043E5FD    mov         edx,dword ptr [ebp-4]
 0043E600    cmp         al,byte ptr [edx+61]
>0043E603    je          0043E7DE
 0043E609    mov         eax,dword ptr [ebp-4]
 0043E60C    cmp         dword ptr [eax+90],0
>0043E613    je          0043E7D4
 0043E619    mov         eax,dword ptr [ebp-4]
 0043E61C    cmp         dword ptr [eax+94],0
>0043E623    je          0043E7D4
 0043E629    mov         eax,dword ptr [ebp-4]
 0043E62C    mov         eax,dword ptr [eax+40]
 0043E62F    mov         dword ptr [ebp-0C],eax
 0043E632    mov         eax,dword ptr [ebp-4]
 0043E635    mov         eax,dword ptr [eax+44]
 0043E638    mov         dword ptr [ebp-10],eax
 0043E63B    mov         eax,dword ptr [ebp-4]
 0043E63E    mov         eax,dword ptr [eax+48]
 0043E641    mov         dword ptr [ebp-14],eax
 0043E644    mov         eax,dword ptr [ebp-4]
 0043E647    mov         eax,dword ptr [eax+4C]
 0043E64A    mov         dword ptr [ebp-18],eax
 0043E64D    mov         eax,dword ptr [ebp-4]
 0043E650    mov         eax,dword ptr [eax+30]
 0043E653    call        TWinControl.HandleAllocated
 0043E658    test        al,al
>0043E65A    je          0043E678
 0043E65C    lea         edx,[ebp-40]
 0043E65F    mov         eax,dword ptr [ebp-4]
 0043E662    mov         eax,dword ptr [eax+30]
 0043E665    mov         ecx,dword ptr [eax]
 0043E667    call        dword ptr [ecx+44]
 0043E66A    mov         eax,dword ptr [ebp-38]
 0043E66D    mov         dword ptr [ebp-20],eax
 0043E670    mov         eax,dword ptr [ebp-34]
 0043E673    mov         dword ptr [ebp-1C],eax
>0043E676    jmp         0043E68C
 0043E678    lea         ecx,[ebp-20]
 0043E67B    mov         eax,dword ptr [ebp-4]
 0043E67E    mov         ebx,dword ptr [eax+30]
 0043E681    mov         edx,dword ptr [ebx+4C]
 0043E684    mov         eax,dword ptr [ebx+48]
 0043E687    call        Point
 0043E68C    mov         eax,dword ptr [ebp-4]
 0043E68F    test        byte ptr [eax+61],4
>0043E693    je          0043E6D6
 0043E695    mov         eax,dword ptr [ebp-4]
 0043E698    test        byte ptr [eax+61],1
>0043E69C    je          0043E6BA
 0043E69E    mov         eax,dword ptr [ebp-4]
 0043E6A1    mov         eax,dword ptr [eax+90]
 0043E6A7    mov         edx,dword ptr [ebp-4]
 0043E6AA    sub         eax,dword ptr [edx+88]
 0043E6B0    mov         edx,dword ptr [ebp-20]
 0043E6B3    sub         edx,eax
 0043E6B5    mov         dword ptr [ebp-14],edx
>0043E6B8    jmp         0043E70B
 0043E6BA    mov         eax,dword ptr [ebp-4]
 0043E6BD    mov         eax,dword ptr [eax+90]
 0043E6C3    mov         edx,dword ptr [ebp-4]
 0043E6C6    sub         eax,dword ptr [edx+88]
 0043E6CC    mov         edx,dword ptr [ebp-20]
 0043E6CF    sub         edx,eax
 0043E6D1    mov         dword ptr [ebp-0C],edx
>0043E6D4    jmp         0043E70B
 0043E6D6    mov         eax,dword ptr [ebp-4]
 0043E6D9    test        byte ptr [eax+61],1
>0043E6DD    jne         0043E70B
 0043E6DF    mov         eax,dword ptr [ebp-4]
 0043E6E2    mov         eax,dword ptr [eax+90]
 0043E6E8    push        eax
 0043E6E9    mov         eax,dword ptr [ebp-20]
 0043E6EC    push        eax
 0043E6ED    mov         eax,dword ptr [ebp-4]
 0043E6F0    mov         eax,dword ptr [eax+88]
 0043E6F6    push        eax
 0043E6F7    call        KERNEL32.MulDiv
 0043E6FC    mov         edx,dword ptr [ebp-14]
 0043E6FF    sar         edx,1
>0043E701    jns         0043E706
 0043E703    adc         edx,0
 0043E706    sub         eax,edx
 0043E708    mov         dword ptr [ebp-0C],eax
 0043E70B    mov         eax,dword ptr [ebp-4]
 0043E70E    test        byte ptr [eax+61],8
>0043E712    je          0043E755
 0043E714    mov         eax,dword ptr [ebp-4]
 0043E717    test        byte ptr [eax+61],2
>0043E71B    je          0043E739
 0043E71D    mov         eax,dword ptr [ebp-4]
 0043E720    mov         eax,dword ptr [eax+94]
 0043E726    mov         edx,dword ptr [ebp-4]
 0043E729    sub         eax,dword ptr [edx+8C]
 0043E72F    mov         edx,dword ptr [ebp-1C]
 0043E732    sub         edx,eax
 0043E734    mov         dword ptr [ebp-18],edx
>0043E737    jmp         0043E78A
 0043E739    mov         eax,dword ptr [ebp-4]
 0043E73C    mov         eax,dword ptr [eax+94]
 0043E742    mov         edx,dword ptr [ebp-4]
 0043E745    sub         eax,dword ptr [edx+8C]
 0043E74B    mov         edx,dword ptr [ebp-1C]
 0043E74E    sub         edx,eax
 0043E750    mov         dword ptr [ebp-10],edx
>0043E753    jmp         0043E78A
 0043E755    mov         eax,dword ptr [ebp-4]
 0043E758    test        byte ptr [eax+61],2
>0043E75C    jne         0043E78A
 0043E75E    mov         eax,dword ptr [ebp-4]
 0043E761    mov         eax,dword ptr [eax+94]
 0043E767    push        eax
 0043E768    mov         eax,dword ptr [ebp-1C]
 0043E76B    push        eax
 0043E76C    mov         eax,dword ptr [ebp-4]
 0043E76F    mov         eax,dword ptr [eax+8C]
 0043E775    push        eax
 0043E776    call        KERNEL32.MulDiv
 0043E77B    mov         edx,dword ptr [ebp-18]
 0043E77E    sar         edx,1
>0043E780    jns         0043E785
 0043E782    adc         edx,0
 0043E785    sub         eax,edx
 0043E787    mov         dword ptr [ebp-10],eax
 0043E78A    mov         eax,dword ptr [ebp-4]
 0043E78D    mov         byte ptr [eax+62],1
 0043E791    xor         eax,eax
 0043E793    push        ebp
 0043E794    push        43E7CD
 0043E799    push        dword ptr fs:[eax]
 0043E79C    mov         dword ptr fs:[eax],esp
 0043E79F    mov         eax,dword ptr [ebp-14]
 0043E7A2    push        eax
 0043E7A3    mov         eax,dword ptr [ebp-18]
 0043E7A6    push        eax
 0043E7A7    mov         ecx,dword ptr [ebp-10]
 0043E7AA    mov         edx,dword ptr [ebp-0C]
 0043E7AD    mov         eax,dword ptr [ebp-4]
 0043E7B0    mov         ebx,dword ptr [eax]
 0043E7B2    call        dword ptr [ebx+84]
 0043E7B8    xor         eax,eax
 0043E7BA    pop         edx
 0043E7BB    pop         ecx
 0043E7BC    pop         ecx
 0043E7BD    mov         dword ptr fs:[eax],edx
 0043E7C0    push        43E7D4
 0043E7C5    mov         eax,dword ptr [ebp-4]
 0043E7C8    mov         byte ptr [eax+62],0
 0043E7CC    ret
>0043E7CD    jmp         @HandleFinally
>0043E7D2    jmp         0043E7C5
 0043E7D4    cmp         byte ptr [ebp-5],0
>0043E7D8    je          0043EA0A
 0043E7DE    mov         eax,dword ptr [ebp+8]
 0043E7E1    mov         eax,dword ptr [eax-8]
 0043E7E4    mov         eax,dword ptr [eax+8]
 0043E7E7    mov         edx,dword ptr [ebp+8]
 0043E7EA    mov         edx,dword ptr [edx-8]
 0043E7ED    sub         eax,dword ptr [edx]
 0043E7EF    mov         dword ptr [ebp-14],eax
 0043E7F2    cmp         dword ptr [ebp-14],0
>0043E7F6    jl          0043E805
 0043E7F8    mov         al,byte ptr [ebp-5]
 0043E7FB    add         al,0FD
 0043E7FD    sub         al,2
>0043E7FF    jb          0043E805
 0043E801    sub         al,1
>0043E803    jne         0043E80E
 0043E805    mov         eax,dword ptr [ebp-4]
 0043E808    mov         eax,dword ptr [eax+48]
 0043E80B    mov         dword ptr [ebp-14],eax
 0043E80E    mov         eax,dword ptr [ebp+8]
 0043E811    mov         eax,dword ptr [eax-8]
 0043E814    mov         eax,dword ptr [eax+0C]
 0043E817    mov         edx,dword ptr [ebp+8]
 0043E81A    mov         edx,dword ptr [edx-8]
 0043E81D    sub         eax,dword ptr [edx+4]
 0043E820    mov         dword ptr [ebp-18],eax
 0043E823    cmp         dword ptr [ebp-18],0
>0043E827    jl          0043E835
 0043E829    mov         al,byte ptr [ebp-5]
 0043E82C    dec         eax
 0043E82D    sub         al,2
>0043E82F    jb          0043E835
 0043E831    sub         al,3
>0043E833    jne         0043E83E
 0043E835    mov         eax,dword ptr [ebp-4]
 0043E838    mov         eax,dword ptr [eax+4C]
 0043E83B    mov         dword ptr [ebp-18],eax
 0043E83E    mov         eax,dword ptr [ebp+8]
 0043E841    mov         eax,dword ptr [eax-8]
 0043E844    mov         eax,dword ptr [eax]
 0043E846    mov         dword ptr [ebp-0C],eax
 0043E849    mov         eax,dword ptr [ebp+8]
 0043E84C    mov         eax,dword ptr [eax-8]
 0043E84F    mov         eax,dword ptr [eax+4]
 0043E852    mov         dword ptr [ebp-10],eax
 0043E855    xor         eax,eax
 0043E857    mov         al,byte ptr [ebp-5]
 0043E85A    cmp         eax,6
>0043E85D    ja          0043E912
 0043E863    jmp         dword ptr [eax*4+43E86A]
 0043E863    dd          0043E912
 0043E863    dd          0043E886
 0043E863    dd          0043E894
 0043E863    dd          0043E8AE
 0043E863    dd          0043E8BB
 0043E863    dd          0043E912
 0043E863    dd          0043E8D5
 0043E886    mov         eax,dword ptr [ebp+8]
 0043E889    mov         eax,dword ptr [eax-8]
 0043E88C    mov         edx,dword ptr [ebp-18]
 0043E88F    add         dword ptr [eax+4],edx
>0043E892    jmp         0043E912
 0043E894    mov         eax,dword ptr [ebp+8]
 0043E897    mov         eax,dword ptr [eax-8]
 0043E89A    mov         edx,dword ptr [ebp-18]
 0043E89D    sub         dword ptr [eax+0C],edx
 0043E8A0    mov         eax,dword ptr [ebp+8]
 0043E8A3    mov         eax,dword ptr [eax-8]
 0043E8A6    mov         eax,dword ptr [eax+0C]
 0043E8A9    mov         dword ptr [ebp-10],eax
>0043E8AC    jmp         0043E912
 0043E8AE    mov         eax,dword ptr [ebp+8]
 0043E8B1    mov         eax,dword ptr [eax-8]
 0043E8B4    mov         edx,dword ptr [ebp-14]
 0043E8B7    add         dword ptr [eax],edx
>0043E8B9    jmp         0043E912
 0043E8BB    mov         eax,dword ptr [ebp+8]
 0043E8BE    mov         eax,dword ptr [eax-8]
 0043E8C1    mov         edx,dword ptr [ebp-14]
 0043E8C4    sub         dword ptr [eax+8],edx
 0043E8C7    mov         eax,dword ptr [ebp+8]
 0043E8CA    mov         eax,dword ptr [eax-8]
 0043E8CD    mov         eax,dword ptr [eax+8]
 0043E8D0    mov         dword ptr [ebp-0C],eax
>0043E8D3    jmp         0043E912
 0043E8D5    mov         eax,dword ptr [ebp-4]
 0043E8D8    mov         eax,dword ptr [eax+40]
 0043E8DB    mov         dword ptr [ebp-0C],eax
 0043E8DE    mov         eax,dword ptr [ebp-4]
 0043E8E1    mov         eax,dword ptr [eax+44]
 0043E8E4    mov         dword ptr [ebp-10],eax
 0043E8E7    lea         eax,[ebp-10]
 0043E8EA    push        eax
 0043E8EB    lea         eax,[ebp-14]
 0043E8EE    push        eax
 0043E8EF    lea         eax,[ebp-18]
 0043E8F2    push        eax
 0043E8F3    mov         eax,dword ptr [ebp+8]
 0043E8F6    mov         eax,dword ptr [eax-8]
 0043E8F9    push        eax
 0043E8FA    lea         eax,[ebp-30]
 0043E8FD    push        eax
 0043E8FE    lea         ecx,[ebp-0C]
 0043E901    mov         eax,dword ptr [ebp+8]
 0043E904    mov         eax,dword ptr [eax-4]
 0043E907    mov         edx,dword ptr [ebp-4]
 0043E90A    mov         ebx,dword ptr [eax]
 0043E90C    call        dword ptr [ebx+0A8]
 0043E912    mov         eax,dword ptr [ebp-4]
 0043E915    mov         byte ptr [eax+62],1
 0043E919    xor         eax,eax
 0043E91B    push        ebp
 0043E91C    push        43E955
 0043E921    push        dword ptr fs:[eax]
 0043E924    mov         dword ptr fs:[eax],esp
 0043E927    mov         eax,dword ptr [ebp-14]
 0043E92A    push        eax
 0043E92B    mov         eax,dword ptr [ebp-18]
 0043E92E    push        eax
 0043E92F    mov         ecx,dword ptr [ebp-10]
 0043E932    mov         edx,dword ptr [ebp-0C]
 0043E935    mov         eax,dword ptr [ebp-4]
 0043E938    mov         ebx,dword ptr [eax]
 0043E93A    call        dword ptr [ebx+84]
 0043E940    xor         eax,eax
 0043E942    pop         edx
 0043E943    pop         ecx
 0043E944    pop         ecx
 0043E945    mov         dword ptr fs:[eax],edx
 0043E948    push        43E95C
 0043E94D    mov         eax,dword ptr [ebp-4]
 0043E950    mov         byte ptr [eax+62],0
 0043E954    ret
>0043E955    jmp         @HandleFinally
>0043E95A    jmp         0043E94D
 0043E95C    mov         eax,dword ptr [ebp-4]
 0043E95F    mov         eax,dword ptr [eax+48]
 0043E962    cmp         eax,dword ptr [ebp-14]
>0043E965    jne         0043E976
 0043E967    mov         edx,dword ptr [ebp-4]
 0043E96A    mov         edx,dword ptr [edx+4C]
 0043E96D    cmp         edx,dword ptr [ebp-18]
>0043E970    je          0043EA0A
 0043E976    xor         edx,edx
 0043E978    mov         dl,byte ptr [ebp-5]
 0043E97B    cmp         edx,5
>0043E97E    ja          0043EA0A
 0043E984    jmp         dword ptr [edx*4+43E98B]
 0043E984    dd          0043EA0A
 0043E984    dd          0043E9A3
 0043E984    dd          0043E9B7
 0043E984    dd          0043E9CB
 0043E984    dd          0043E9DA
 0043E984    dd          0043E9EA
 0043E9A3    mov         eax,dword ptr [ebp-4]
 0043E9A6    mov         edx,dword ptr [ebp-18]
 0043E9A9    sub         edx,dword ptr [eax+4C]
 0043E9AC    mov         eax,dword ptr [ebp+8]
 0043E9AF    mov         eax,dword ptr [eax-8]
 0043E9B2    sub         dword ptr [eax+4],edx
>0043E9B5    jmp         0043EA0A
 0043E9B7    mov         eax,dword ptr [ebp-4]
 0043E9BA    mov         edx,dword ptr [ebp-18]
 0043E9BD    sub         edx,dword ptr [eax+4C]
 0043E9C0    mov         eax,dword ptr [ebp+8]
 0043E9C3    mov         eax,dword ptr [eax-8]
 0043E9C6    add         dword ptr [eax+0C],edx
>0043E9C9    jmp         0043EA0A
 0043E9CB    mov         edx,dword ptr [ebp-14]
 0043E9CE    sub         edx,eax
 0043E9D0    mov         eax,dword ptr [ebp+8]
 0043E9D3    mov         eax,dword ptr [eax-8]
 0043E9D6    sub         dword ptr [eax],edx
>0043E9D8    jmp         0043EA0A
 0043E9DA    mov         edx,dword ptr [ebp-14]
 0043E9DD    sub         edx,eax
 0043E9DF    mov         eax,dword ptr [ebp+8]
 0043E9E2    mov         eax,dword ptr [eax-8]
 0043E9E5    add         dword ptr [eax+8],edx
>0043E9E8    jmp         0043EA0A
 0043E9EA    mov         edx,dword ptr [ebp-14]
 0043E9ED    sub         edx,eax
 0043E9EF    mov         eax,dword ptr [ebp+8]
 0043E9F2    mov         eax,dword ptr [eax-8]
 0043E9F5    add         dword ptr [eax+8],edx
 0043E9F8    mov         eax,dword ptr [ebp-4]
 0043E9FB    mov         edx,dword ptr [ebp-18]
 0043E9FE    sub         edx,dword ptr [eax+4C]
 0043EA01    mov         eax,dword ptr [ebp+8]
 0043EA04    mov         eax,dword ptr [eax-8]
 0043EA07    add         dword ptr [eax+0C],edx
 0043EA0A    pop         edi
 0043EA0B    pop         esi
 0043EA0C    pop         ebx
 0043EA0D    mov         esp,ebp
 0043EA0F    pop         ebp
 0043EA10    ret
*}
end;

//0043EA14
procedure DoAlign(AAlign:TAlign);
begin
{*
 0043EA14    push        ebp
 0043EA15    mov         ebp,esp
 0043EA17    add         esp,0FFFFFFE8
 0043EA1A    push        ebx
 0043EA1B    push        esi
 0043EA1C    push        edi
 0043EA1D    mov         ebx,eax
 0043EA1F    mov         eax,dword ptr [ebp+8]
 0043EA22    mov         eax,dword ptr [eax-0C]
 0043EA25    mov         edx,dword ptr [eax]
 0043EA27    call        dword ptr [edx+8]
 0043EA2A    mov         eax,dword ptr [ebp+8]
 0043EA2D    cmp         dword ptr [eax-10],0
>0043EA31    je          0043EA77
 0043EA33    test        bl,bl
>0043EA35    je          0043EA5B
 0043EA37    mov         eax,dword ptr [ebp+8]
 0043EA3A    mov         eax,dword ptr [eax-10]
 0043EA3D    cmp         byte ptr [eax+57],0
>0043EA41    jne         0043EA5B
 0043EA43    mov         eax,dword ptr [ebp+8]
 0043EA46    mov         eax,dword ptr [eax-10]
 0043EA49    test        byte ptr [eax+1C],10
>0043EA4D    je          0043EA77
 0043EA4F    mov         eax,dword ptr [ebp+8]
 0043EA52    mov         eax,dword ptr [eax-10]
 0043EA55    test        byte ptr [eax+51],4
>0043EA59    jne         0043EA77
 0043EA5B    mov         eax,dword ptr [ebp+8]
 0043EA5E    mov         eax,dword ptr [eax-10]
 0043EA61    cmp         bl,byte ptr [eax+5B]
>0043EA64    jne         0043EA77
 0043EA66    mov         eax,dword ptr [ebp+8]
 0043EA69    mov         edx,dword ptr [eax-10]
 0043EA6C    mov         eax,dword ptr [ebp+8]
 0043EA6F    mov         eax,dword ptr [eax-0C]
 0043EA72    call        TList.Add
 0043EA77    mov         eax,dword ptr [ebp+8]
 0043EA7A    mov         eax,dword ptr [eax-4]
 0043EA7D    call        TWinControl.GetControlCount
 0043EA82    dec         eax
 0043EA83    test        eax,eax
>0043EA85    jl          0043EB27
 0043EA8B    inc         eax
 0043EA8C    mov         dword ptr [ebp-8],eax
 0043EA8F    mov         dword ptr [ebp-4],0
 0043EA96    mov         eax,dword ptr [ebp+8]
 0043EA99    mov         eax,dword ptr [eax-4]
 0043EA9C    mov         edx,dword ptr [ebp-4]
 0043EA9F    call        TWinControl.GetControl
 0043EAA4    mov         edi,eax
 0043EAA6    cmp         bl,byte ptr [edi+5B]
>0043EAA9    jne         0043EB1B
 0043EAAB    test        bl,bl
>0043EAAD    je          0043EAD3
 0043EAAF    cmp         byte ptr [edi+57],0
>0043EAB3    jne         0043EAD3
 0043EAB5    mov         eax,[0043EB80]
 0043EABA    and         eax,dword ptr [edi+50]
 0043EABD    mov         edx,dword ptr ds:[43EB80]
 0043EAC3    cmp         edx,eax
>0043EAC5    je          0043EAD3
 0043EAC7    test        byte ptr [edi+1C],10
>0043EACB    je          0043EB1B
 0043EACD    test        byte ptr [edi+51],4
>0043EAD1    jne         0043EB1B
 0043EAD3    mov         eax,dword ptr [ebp+8]
 0043EAD6    cmp         edi,dword ptr [eax-10]
>0043EAD9    je          0043EB1B
 0043EADB    xor         esi,esi
>0043EADD    jmp         0043EAE0
 0043EADF    inc         esi
 0043EAE0    mov         eax,dword ptr [ebp+8]
 0043EAE3    mov         eax,dword ptr [eax-0C]
 0043EAE6    cmp         esi,dword ptr [eax+8]
>0043EAE9    jge         0043EB0C
 0043EAEB    mov         eax,dword ptr [ebp+8]
 0043EAEE    push        eax
 0043EAEF    mov         eax,dword ptr [ebp+8]
 0043EAF2    mov         eax,dword ptr [eax-0C]
 0043EAF5    mov         edx,esi
 0043EAF7    call        TList.Get
 0043EAFC    mov         edx,eax
 0043EAFE    mov         ecx,ebx
 0043EB00    mov         eax,edi
 0043EB02    call        InsertBefore
 0043EB07    pop         ecx
 0043EB08    test        al,al
>0043EB0A    je          0043EADF
 0043EB0C    mov         eax,dword ptr [ebp+8]
 0043EB0F    mov         eax,dword ptr [eax-0C]
 0043EB12    mov         ecx,edi
 0043EB14    mov         edx,esi
 0043EB16    call        TList.Insert
 0043EB1B    inc         dword ptr [ebp-4]
 0043EB1E    dec         dword ptr [ebp-8]
>0043EB21    jne         0043EA96
 0043EB27    mov         eax,dword ptr [ebp+8]
 0043EB2A    mov         eax,dword ptr [eax-0C]
 0043EB2D    mov         eax,dword ptr [eax+8]
 0043EB30    dec         eax
 0043EB31    test        eax,eax
>0043EB33    jl          0043EB77
 0043EB35    inc         eax
 0043EB36    mov         dword ptr [ebp-8],eax
 0043EB39    mov         dword ptr [ebp-4],0
 0043EB40    mov         eax,dword ptr [ebp+8]
 0043EB43    mov         eax,dword ptr [eax-0C]
 0043EB46    mov         dword ptr [ebp-18],eax
 0043EB49    mov         eax,dword ptr [ebp-4]
 0043EB4C    mov         dword ptr [ebp-14],eax
 0043EB4F    mov         byte ptr [ebp-10],bl
 0043EB52    mov         eax,dword ptr [ebp+8]
 0043EB55    push        eax
 0043EB56    mov         eax,dword ptr [ebp+8]
 0043EB59    mov         eax,dword ptr [eax-0C]
 0043EB5C    mov         edx,dword ptr [ebp-4]
 0043EB5F    call        TList.Get
 0043EB64    lea         ecx,[ebp-18]
 0043EB67    mov         edx,ebx
 0043EB69    call        DoPosition
 0043EB6E    pop         ecx
 0043EB6F    inc         dword ptr [ebp-4]
 0043EB72    dec         dword ptr [ebp-8]
>0043EB75    jne         0043EB40
 0043EB77    pop         edi
 0043EB78    pop         esi
 0043EB79    pop         ebx
 0043EB7A    mov         esp,ebp
 0043EB7C    pop         ebp
 0043EB7D    ret
*}
end;

//0043EB84
function AlignWork:Boolean;
begin
{*
 0043EB84    push        ebp
 0043EB85    mov         ebp,esp
 0043EB87    push        ebx
 0043EB88    push        esi
 0043EB89    push        edi
 0043EB8A    mov         edi,dword ptr [ebp+8]
 0043EB8D    add         edi,0FFFFFFFC
 0043EB90    mov         bl,1
 0043EB92    mov         eax,dword ptr [edi]
 0043EB94    call        TWinControl.GetControlCount
 0043EB99    mov         esi,eax
 0043EB9B    dec         esi
 0043EB9C    cmp         esi,0
>0043EB9F    jl          0043EBCA
 0043EBA1    mov         eax,dword ptr [edi]
 0043EBA3    mov         edx,esi
 0043EBA5    call        TWinControl.GetControl
 0043EBAA    cmp         byte ptr [eax+5B],0
>0043EBAE    jne         0043EBCC
 0043EBB0    mov         eax,dword ptr [edi]
 0043EBB2    mov         edx,esi
 0043EBB4    call        TWinControl.GetControl
 0043EBB9    mov         dl,byte ptr ds:[43EBD4]
 0043EBBF    cmp         dl,byte ptr [eax+61]
>0043EBC2    jne         0043EBCC
 0043EBC4    dec         esi
 0043EBC5    cmp         esi,0FFFFFFFF
>0043EBC8    jne         0043EBA1
 0043EBCA    xor         ebx,ebx
 0043EBCC    mov         eax,ebx
 0043EBCE    pop         edi
 0043EBCF    pop         esi
 0043EBD0    pop         ebx
 0043EBD1    pop         ebp
 0043EBD2    ret
*}
end;

//0043EBD8
procedure TWinControl.AlignControls(AControl:TControl; var Rect:TRect);
begin
{*
 0043EBD8    push        ebp
 0043EBD9    mov         ebp,esp
 0043EBDB    add         esp,0FFFFFFF0
 0043EBDE    push        esi
 0043EBDF    mov         dword ptr [ebp-8],ecx
 0043EBE2    mov         dword ptr [ebp-10],edx
 0043EBE5    mov         dword ptr [ebp-4],eax
 0043EBE8    mov         eax,dword ptr [ebp-4]
 0043EBEB    cmp         byte ptr [eax+1A8],0
>0043EBF2    je          0043EC1C
 0043EBF4    mov         eax,dword ptr [ebp-4]
 0043EBF7    cmp         byte ptr [eax+1A7],0
>0043EBFE    je          0043EC1C
 0043EC00    mov         eax,dword ptr [ebp-4]
 0043EC03    cmp         dword ptr [eax+17C],0
>0043EC0A    je          0043EC1C
 0043EC0C    mov         eax,dword ptr [ebp-4]
 0043EC0F    mov         eax,dword ptr [eax+17C]
 0043EC15    xor         edx,edx
 0043EC17    mov         ecx,dword ptr [eax]
 0043EC19    call        dword ptr [ecx+2C]
 0043EC1C    push        ebp
 0043EC1D    call        AlignWork
 0043EC22    pop         ecx
 0043EC23    test        al,al
>0043EC25    je          0043ECBE
 0043EC2B    mov         edx,dword ptr [ebp-8]
 0043EC2E    mov         eax,dword ptr [ebp-4]
 0043EC31    mov         ecx,dword ptr [eax]
 0043EC33    call        dword ptr [ecx+8C]
 0043EC39    mov         dl,1
 0043EC3B    mov         eax,[00417CEC];TList
 0043EC40    call        TObject.Create
 0043EC45    mov         dword ptr [ebp-0C],eax
 0043EC48    xor         eax,eax
 0043EC4A    push        ebp
 0043EC4B    push        43ECB7
 0043EC50    push        dword ptr fs:[eax]
 0043EC53    mov         dword ptr fs:[eax],esp
 0043EC56    push        ebp
 0043EC57    mov         al,1
 0043EC59    call        DoAlign
 0043EC5E    pop         ecx
 0043EC5F    push        ebp
 0043EC60    mov         al,2
 0043EC62    call        DoAlign
 0043EC67    pop         ecx
 0043EC68    push        ebp
 0043EC69    mov         al,3
 0043EC6B    call        DoAlign
 0043EC70    pop         ecx
 0043EC71    push        ebp
 0043EC72    mov         al,4
 0043EC74    call        DoAlign
 0043EC79    pop         ecx
 0043EC7A    push        ebp
 0043EC7B    mov         al,5
 0043EC7D    call        DoAlign
 0043EC82    pop         ecx
 0043EC83    push        ebp
 0043EC84    mov         al,6
 0043EC86    call        DoAlign
 0043EC8B    pop         ecx
 0043EC8C    push        ebp
 0043EC8D    xor         eax,eax
 0043EC8F    call        DoAlign
 0043EC94    pop         ecx
 0043EC95    mov         eax,dword ptr [ebp-4]
 0043EC98    mov         si,0FFC7
 0043EC9C    call        @CallDynaInst
 0043ECA1    xor         eax,eax
 0043ECA3    pop         edx
 0043ECA4    pop         ecx
 0043ECA5    pop         ecx
 0043ECA6    mov         dword ptr fs:[eax],edx
 0043ECA9    push        43ECBE
 0043ECAE    mov         eax,dword ptr [ebp-0C]
 0043ECB1    call        TObject.Free
 0043ECB6    ret
>0043ECB7    jmp         @HandleFinally
>0043ECBC    jmp         0043ECAE
 0043ECBE    mov         eax,dword ptr [ebp-4]
 0043ECC1    cmp         byte ptr [eax+1A6],0
>0043ECC8    je          0043ECD6
 0043ECCA    mov         eax,dword ptr [ebp-4]
 0043ECCD    mov         si,0FFEE
 0043ECD1    call        @CallDynaInst
 0043ECD6    pop         esi
 0043ECD7    mov         esp,ebp
 0043ECD9    pop         ebp
 0043ECDA    ret
*}
end;

//0043ECDC
procedure TWinControl.AlignControl(AControl:TControl);
begin
{*
 0043ECDC    push        ebp
 0043ECDD    mov         ebp,esp
 0043ECDF    add         esp,0FFFFFFEC
 0043ECE2    push        ebx
 0043ECE3    mov         ebx,edx
 0043ECE5    mov         dword ptr [ebp-4],eax
 0043ECE8    mov         eax,dword ptr [ebp-4]
 0043ECEB    call        TWinControl.HandleAllocated
 0043ECF0    test        al,al
>0043ECF2    je          0043ED6A
 0043ECF4    mov         eax,dword ptr [ebp-4]
 0043ECF7    test        byte ptr [eax+1C],8
>0043ECFB    jne         0043ED6A
 0043ECFD    mov         eax,dword ptr [ebp-4]
 0043ED00    cmp         word ptr [eax+160],0
>0043ED08    je          0043ED14
 0043ED0A    mov         eax,dword ptr [ebp-4]
 0043ED0D    or          word ptr [eax+54],10
>0043ED12    jmp         0043ED6A
 0043ED14    mov         eax,dword ptr [ebp-4]
 0043ED17    call        TWinControl.DisableAlign
 0043ED1C    xor         eax,eax
 0043ED1E    push        ebp
 0043ED1F    push        43ED63
 0043ED24    push        dword ptr fs:[eax]
 0043ED27    mov         dword ptr fs:[eax],esp
 0043ED2A    lea         edx,[ebp-14]
 0043ED2D    mov         eax,dword ptr [ebp-4]
 0043ED30    mov         ecx,dword ptr [eax]
 0043ED32    call        dword ptr [ecx+44]
 0043ED35    lea         ecx,[ebp-14]
 0043ED38    mov         edx,ebx
 0043ED3A    mov         eax,dword ptr [ebp-4]
 0043ED3D    mov         ebx,dword ptr [eax]
 0043ED3F    call        dword ptr [ebx+90]
 0043ED45    xor         eax,eax
 0043ED47    pop         edx
 0043ED48    pop         ecx
 0043ED49    pop         ecx
 0043ED4A    mov         dword ptr fs:[eax],edx
 0043ED4D    push        43ED6A
 0043ED52    mov         eax,dword ptr [ebp-4]
 0043ED55    and         word ptr [eax+54],0FFFFFFEF
 0043ED5A    mov         eax,dword ptr [ebp-4]
 0043ED5D    call        TWinControl.EnableAlign
 0043ED62    ret
>0043ED63    jmp         @HandleFinally
>0043ED68    jmp         0043ED52
 0043ED6A    pop         ebx
 0043ED6B    mov         esp,ebp
 0043ED6D    pop         ebp
 0043ED6E    ret
*}
end;

//0043ED70
procedure TWinControl.DisableAlign;
begin
{*
 0043ED70    inc         word ptr [eax+160]
 0043ED77    ret
*}
end;

//0043ED78
procedure TWinControl.EnableAlign;
begin
{*
 0043ED78    dec         word ptr [eax+160]
 0043ED7F    cmp         word ptr [eax+160],0
>0043ED87    jne         0043ED94
 0043ED89    test        byte ptr [eax+54],10
>0043ED8D    je          0043ED94
 0043ED8F    call        TWinControl.Realign
 0043ED94    ret
*}
end;

//0043ED98
procedure TWinControl.Realign;
begin
{*
 0043ED98    xor         edx,edx
 0043ED9A    call        TWinControl.AlignControl
 0043ED9F    ret
*}
end;

//0043EDA0
procedure TWinControl.DoFlipChildren;
begin
{*
 0043EDA0    push        ebp
 0043EDA1    mov         ebp,esp
 0043EDA3    add         esp,0FFFFFFF4
 0043EDA6    push        ebx
 0043EDA7    push        esi
 0043EDA8    push        edi
 0043EDA9    mov         dword ptr [ebp-4],eax
 0043EDAC    mov         dl,1
 0043EDAE    mov         eax,[00417CEC];TList
 0043EDB3    call        TObject.Create
 0043EDB8    mov         dword ptr [ebp-0C],eax
 0043EDBB    xor         eax,eax
 0043EDBD    push        ebp
 0043EDBE    push        43EE65
 0043EDC3    push        dword ptr fs:[eax]
 0043EDC6    mov         dword ptr fs:[eax],esp
 0043EDC9    mov         eax,dword ptr [ebp-4]
 0043EDCC    call        TControl.GetClientWidth
 0043EDD1    mov         dword ptr [ebp-8],eax
 0043EDD4    mov         eax,dword ptr [ebp-4]
 0043EDD7    call        TWinControl.GetControlCount
 0043EDDC    mov         ebx,eax
 0043EDDE    dec         ebx
 0043EDDF    test        ebx,ebx
>0043EDE1    jl          0043EE25
 0043EDE3    inc         ebx
 0043EDE4    xor         esi,esi
 0043EDE6    mov         edx,esi
 0043EDE8    mov         eax,dword ptr [ebp-4]
 0043EDEB    call        TWinControl.GetControl
 0043EDF0    mov         edi,eax
 0043EDF2    mov         eax,dword ptr [edi+4]
 0043EDF5    mov         edx,dword ptr [ebp-4]
 0043EDF8    cmp         eax,dword ptr [edx+4]
>0043EDFB    jne         0043EE21
 0043EDFD    mov         edx,esi
 0043EDFF    mov         eax,dword ptr [ebp-4]
 0043EE02    call        TWinControl.GetControl
 0043EE07    mov         edx,eax
 0043EE09    mov         eax,dword ptr [ebp-0C]
 0043EE0C    call        TList.Add
 0043EE11    mov         edx,dword ptr [ebp-8]
 0043EE14    sub         edx,dword ptr [edi+48]
 0043EE17    sub         edx,dword ptr [edi+40]
 0043EE1A    mov         eax,edi
 0043EE1C    call        TControl.SetLeft
 0043EE21    inc         esi
 0043EE22    dec         ebx
>0043EE23    jne         0043EDE6
 0043EE25    mov         eax,dword ptr [ebp-0C]
 0043EE28    mov         ebx,dword ptr [eax+8]
 0043EE2B    dec         ebx
 0043EE2C    test        ebx,ebx
>0043EE2E    jl          0043EE4F
 0043EE30    inc         ebx
 0043EE31    xor         esi,esi
 0043EE33    push        0
 0043EE35    mov         edx,esi
 0043EE37    mov         eax,dword ptr [ebp-0C]
 0043EE3A    call        TList.Get
 0043EE3F    xor         ecx,ecx
 0043EE41    mov         edx,0B03E
 0043EE46    call        TControl.Perform
 0043EE4B    inc         esi
 0043EE4C    dec         ebx
>0043EE4D    jne         0043EE33
 0043EE4F    xor         eax,eax
 0043EE51    pop         edx
 0043EE52    pop         ecx
 0043EE53    pop         ecx
 0043EE54    mov         dword ptr fs:[eax],edx
 0043EE57    push        43EE6C
 0043EE5C    mov         eax,dword ptr [ebp-0C]
 0043EE5F    call        TObject.Free
 0043EE64    ret
>0043EE65    jmp         @HandleFinally
>0043EE6A    jmp         0043EE5C
 0043EE6C    pop         edi
 0043EE6D    pop         esi
 0043EE6E    pop         ebx
 0043EE6F    mov         esp,ebp
 0043EE71    pop         ebp
 0043EE72    ret
*}
end;

//0043EE74
procedure TWinControl.FlipChildren(AllLevels:Boolean);
begin
{*
 0043EE74    push        ebp
 0043EE75    mov         ebp,esp
 0043EE77    add         esp,0FFFFFFF4
 0043EE7A    push        ebx
 0043EE7B    push        esi
 0043EE7C    push        edi
 0043EE7D    mov         byte ptr [ebp-5],dl
 0043EE80    mov         dword ptr [ebp-4],eax
 0043EE83    mov         eax,dword ptr [ebp-4]
 0043EE86    call        TWinControl.GetControlCount
 0043EE8B    test        eax,eax
>0043EE8D    je          0043EFAC
 0043EE93    mov         dl,1
 0043EE95    mov         eax,[00417CEC];TList
 0043EE9A    call        TObject.Create
 0043EE9F    mov         dword ptr [ebp-0C],eax
 0043EEA2    mov         eax,dword ptr [ebp-4]
 0043EEA5    call        TWinControl.DisableAlign
 0043EEAA    xor         edx,edx
 0043EEAC    push        ebp
 0043EEAD    push        43EF5B
 0043EEB2    push        dword ptr fs:[edx]
 0043EEB5    mov         dword ptr fs:[edx],esp
 0043EEB8    mov         eax,dword ptr [ebp-4]
 0043EEBB    call        TWinControl.GetControlCount
 0043EEC0    mov         edi,eax
 0043EEC2    dec         edi
 0043EEC3    test        edi,edi
>0043EEC5    jl          0043EEF5
 0043EEC7    inc         edi
 0043EEC8    xor         ebx,ebx
 0043EECA    mov         edx,ebx
 0043EECC    mov         eax,dword ptr [ebp-4]
 0043EECF    call        TWinControl.GetControl
 0043EED4    mov         al,byte ptr [eax+5B]
 0043EED7    add         al,0FD
 0043EED9    sub         al,2
>0043EEDB    jae         0043EEF1
 0043EEDD    mov         edx,ebx
 0043EEDF    mov         eax,dword ptr [ebp-4]
 0043EEE2    call        TWinControl.GetControl
 0043EEE7    mov         edx,eax
 0043EEE9    mov         eax,dword ptr [ebp-0C]
 0043EEEC    call        TList.Add
 0043EEF1    inc         ebx
 0043EEF2    dec         edi
>0043EEF3    jne         0043EECA
 0043EEF5    mov         eax,dword ptr [ebp-4]
 0043EEF8    mov         si,0FFC0
 0043EEFC    call        @CallDynaInst
 0043EF01    xor         eax,eax
 0043EF03    pop         edx
 0043EF04    pop         ecx
 0043EF05    pop         ecx
 0043EF06    mov         dword ptr fs:[eax],edx
 0043EF09    push        43EF62
>0043EF0E    jmp         0043EF40
 0043EF10    mov         edx,ebx
 0043EF12    dec         edx
 0043EF13    mov         eax,dword ptr [ebp-0C]
 0043EF16    call        TList.Get
 0043EF1B    cmp         byte ptr [eax+5B],3
>0043EF1F    jne         0043EF2A
 0043EF21    mov         dl,4
 0043EF23    call        TControl.SetAlign
>0043EF28    jmp         0043EF31
 0043EF2A    mov         dl,3
 0043EF2C    call        TControl.SetAlign
 0043EF31    mov         eax,dword ptr [ebp-0C]
 0043EF34    mov         edx,dword ptr [eax+8]
 0043EF37    dec         edx
 0043EF38    mov         eax,dword ptr [ebp-0C]
 0043EF3B    call        TList.Delete
 0043EF40    mov         eax,dword ptr [ebp-0C]
 0043EF43    mov         ebx,dword ptr [eax+8]
 0043EF46    test        ebx,ebx
>0043EF48    jg          0043EF10
 0043EF4A    mov         eax,dword ptr [ebp-0C]
 0043EF4D    call        TObject.Free
 0043EF52    mov         eax,dword ptr [ebp-4]
 0043EF55    call        TWinControl.EnableAlign
 0043EF5A    ret
>0043EF5B    jmp         @HandleFinally
>0043EF60    jmp         0043EF40
 0043EF62    cmp         byte ptr [ebp-5],0
>0043EF66    je          0043EFAC
 0043EF68    mov         eax,dword ptr [ebp-4]
 0043EF6B    call        TWinControl.GetControlCount
 0043EF70    mov         edi,eax
 0043EF72    dec         edi
 0043EF73    test        edi,edi
>0043EF75    jl          0043EFAC
 0043EF77    inc         edi
 0043EF78    xor         ebx,ebx
 0043EF7A    mov         edx,ebx
 0043EF7C    mov         eax,dword ptr [ebp-4]
 0043EF7F    call        TWinControl.GetControl
 0043EF84    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043EF8A    call        @IsClass
 0043EF8F    test        al,al
>0043EF91    je          0043EFA8
 0043EF93    mov         edx,ebx
 0043EF95    mov         eax,dword ptr [ebp-4]
 0043EF98    call        TWinControl.GetControl
 0043EF9D    mov         dl,1
 0043EF9F    mov         si,0FFB6
 0043EFA3    call        @CallDynaInst
 0043EFA8    inc         ebx
 0043EFA9    dec         edi
>0043EFAA    jne         0043EF7A
 0043EFAC    pop         edi
 0043EFAD    pop         esi
 0043EFAE    pop         ebx
 0043EFAF    mov         esp,ebp
 0043EFB1    pop         ebp
 0043EFB2    ret
*}
end;

//0043EFB4
function TWinControl.ContainsControl(Control:TControl):Boolean;
begin
{*
>0043EFB4    jmp         0043EFB9
 0043EFB6    mov         edx,dword ptr [edx+30]
 0043EFB9    test        edx,edx
>0043EFBB    je          0043EFC1
 0043EFBD    cmp         eax,edx
>0043EFBF    jne         0043EFB6
 0043EFC1    test        edx,edx
 0043EFC3    setne       al
 0043EFC6    ret
*}
end;

//0043EFC8
procedure TWinControl.RemoveFocus(Removing:Boolean);
begin
{*
 0043EFC8    push        ebx
 0043EFC9    push        esi
 0043EFCA    mov         ebx,edx
 0043EFCC    mov         esi,eax
 0043EFCE    mov         eax,esi
 0043EFD0    call        GetParentForm
 0043EFD5    test        eax,eax
>0043EFD7    je          0043EFE2
 0043EFD9    mov         ecx,ebx
 0043EFDB    mov         edx,esi
 0043EFDD    call        TCustomForm.DefocusControl
 0043EFE2    pop         esi
 0043EFE3    pop         ebx
 0043EFE4    ret
*}
end;

//0043EFE8
procedure TWinControl.Insert(AControl:TControl);
begin
{*
 0043EFE8    push        ebx
 0043EFE9    push        esi
 0043EFEA    mov         ebx,edx
 0043EFEC    mov         esi,eax
 0043EFEE    test        ebx,ebx
>0043EFF0    je          0043F02F
 0043EFF2    mov         eax,ebx
 0043EFF4    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043EFFA    call        @IsClass
 0043EFFF    test        al,al
>0043F001    je          0043F01F
 0043F003    lea         eax,[esi+19C]
 0043F009    mov         edx,ebx
 0043F00B    call        ListAdd
 0043F010    lea         eax,[esi+194]
 0043F016    mov         edx,ebx
 0043F018    call        ListAdd
>0043F01D    jmp         0043F02C
 0043F01F    lea         eax,[esi+198]
 0043F025    mov         edx,ebx
 0043F027    call        ListAdd
 0043F02C    mov         dword ptr [ebx+30],esi
 0043F02F    pop         esi
 0043F030    pop         ebx
 0043F031    ret
*}
end;

//0043F034
procedure TWinControl.Remove(AControl:TControl);
begin
{*
 0043F034    push        ebx
 0043F035    push        esi
 0043F036    mov         ebx,edx
 0043F038    mov         esi,eax
 0043F03A    mov         eax,ebx
 0043F03C    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043F042    call        @IsClass
 0043F047    test        al,al
>0043F049    je          0043F067
 0043F04B    lea         eax,[esi+194]
 0043F051    mov         edx,ebx
 0043F053    call        ListRemove
 0043F058    lea         eax,[esi+19C]
 0043F05E    mov         edx,ebx
 0043F060    call        ListRemove
>0043F065    jmp         0043F074
 0043F067    lea         eax,[esi+198]
 0043F06D    mov         edx,ebx
 0043F06F    call        ListRemove
 0043F074    xor         eax,eax
 0043F076    mov         dword ptr [ebx+30],eax
 0043F079    pop         esi
 0043F07A    pop         ebx
 0043F07B    ret
*}
end;

//0043F07C
procedure TWinControl.InsertControl(AControl:TControl);
begin
{*
 0043F07C    push        ebx
 0043F07D    push        esi
 0043F07E    push        edi
 0043F07F    mov         ebx,edx
 0043F081    mov         edi,eax
 0043F083    mov         edx,edi
 0043F085    mov         eax,ebx
 0043F087    mov         si,0FFF5
 0043F08B    call        @CallDynaInst
 0043F090    push        1
 0043F092    mov         esi,ebx
 0043F094    mov         ecx,esi
 0043F096    mov         edx,0B02C
 0043F09B    mov         eax,edi
 0043F09D    call        TControl.Perform
 0043F0A2    mov         edx,ebx
 0043F0A4    mov         eax,edi
 0043F0A6    call        TWinControl.Insert
 0043F0AB    test        byte ptr [ebx+1C],2
>0043F0AF    jne         0043F13A
 0043F0B5    push        0
 0043F0B7    xor         ecx,ecx
 0043F0B9    mov         edx,0B009
 0043F0BE    mov         eax,ebx
 0043F0C0    call        TControl.Perform
 0043F0C5    push        0
 0043F0C7    xor         ecx,ecx
 0043F0C9    mov         edx,0B008
 0043F0CE    mov         eax,ebx
 0043F0D0    call        TControl.Perform
 0043F0D5    push        0
 0043F0D7    xor         ecx,ecx
 0043F0D9    mov         edx,0B023
 0043F0DE    mov         eax,ebx
 0043F0E0    call        TControl.Perform
 0043F0E5    push        0
 0043F0E7    xor         ecx,ecx
 0043F0E9    mov         edx,0B03D
 0043F0EE    mov         eax,ebx
 0043F0F0    call        TControl.Perform
 0043F0F5    mov         eax,ebx
 0043F0F7    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043F0FD    call        @IsClass
 0043F102    test        al,al
>0043F104    je          0043F11F
 0043F106    push        0
 0043F108    xor         ecx,ecx
 0043F10A    mov         edx,0B011
 0043F10F    mov         eax,ebx
 0043F111    call        TControl.Perform
 0043F116    mov         eax,edi
 0043F118    call        TWinControl.UpdateControlState
>0043F11D    jmp         0043F131
 0043F11F    mov         eax,edi
 0043F121    call        TWinControl.HandleAllocated
 0043F126    test        al,al
>0043F128    je          0043F131
 0043F12A    mov         eax,ebx
 0043F12C    mov         edx,dword ptr [eax]
 0043F12E    call        dword ptr [edx+7C]
 0043F131    mov         edx,ebx
 0043F133    mov         eax,edi
 0043F135    call        TWinControl.AlignControl
 0043F13A    push        1
 0043F13C    mov         ecx,esi
 0043F13E    mov         edx,0B036
 0043F143    mov         eax,edi
 0043F145    call        TControl.Perform
 0043F14A    pop         edi
 0043F14B    pop         esi
 0043F14C    pop         ebx
 0043F14D    ret
*}
end;

//0043F150
procedure TWinControl.RemoveControl(AControl:TControl);
begin
{*
 0043F150    push        ebx
 0043F151    push        esi
 0043F152    push        edi
 0043F153    push        ebp
 0043F154    mov         ebx,edx
 0043F156    mov         esi,eax
 0043F158    push        0
 0043F15A    mov         edi,ebx
 0043F15C    mov         ecx,edi
 0043F15E    mov         edx,0B036
 0043F163    mov         eax,esi
 0043F165    call        TControl.Perform
 0043F16A    mov         eax,ebx
 0043F16C    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043F172    call        @IsClass
 0043F177    test        al,al
>0043F179    je          0043F18F
 0043F17B    mov         dl,1
 0043F17D    mov         ebp,ebx
 0043F17F    mov         eax,ebp
 0043F181    call        TWinControl.RemoveFocus
 0043F186    mov         eax,ebp
 0043F188    call        TWinControl.DestroyHandle
>0043F18D    jmp         0043F1A6
 0043F18F    mov         eax,esi
 0043F191    call        TWinControl.HandleAllocated
 0043F196    test        al,al
>0043F198    je          0043F1A6
 0043F19A    xor         ecx,ecx
 0043F19C    mov         dl,byte ptr [ebx+57]
 0043F19F    mov         eax,ebx
 0043F1A1    call        TControl.InvalidateControl
 0043F1A6    mov         edx,ebx
 0043F1A8    mov         eax,esi
 0043F1AA    call        TWinControl.Remove
 0043F1AF    push        0
 0043F1B1    mov         ecx,edi
 0043F1B3    mov         edx,0B02C
 0043F1B8    mov         eax,esi
 0043F1BA    call        TControl.Perform
 0043F1BF    mov         eax,esi
 0043F1C1    call        TWinControl.Realign
 0043F1C6    pop         ebp
 0043F1C7    pop         edi
 0043F1C8    pop         esi
 0043F1C9    pop         ebx
 0043F1CA    ret
*}
end;

//0043F1CC
function TWinControl.GetControl(Index:Integer):TControl;
begin
{*
 0043F1CC    push        ebx
 0043F1CD    push        esi
 0043F1CE    push        edi
 0043F1CF    push        ebp
 0043F1D0    mov         edi,edx
 0043F1D2    mov         ebx,eax
 0043F1D4    mov         ebp,dword ptr [ebx+198]
 0043F1DA    test        ebp,ebp
>0043F1DC    je          0043F1E3
 0043F1DE    mov         esi,dword ptr [ebp+8]
>0043F1E1    jmp         0043F1E5
 0043F1E3    xor         esi,esi
 0043F1E5    cmp         esi,edi
>0043F1E7    jle         0043F1F4
 0043F1E9    mov         edx,edi
 0043F1EB    mov         eax,ebp
 0043F1ED    call        TList.Get
>0043F1F2    jmp         0043F203
 0043F1F4    mov         edx,edi
 0043F1F6    sub         edx,esi
 0043F1F8    mov         eax,dword ptr [ebx+19C]
 0043F1FE    call        TList.Get
 0043F203    pop         ebp
 0043F204    pop         edi
 0043F205    pop         esi
 0043F206    pop         ebx
 0043F207    ret
*}
end;

//0043F208
function TWinControl.GetControlCount:Integer;
begin
{*
 0043F208    xor         edx,edx
 0043F20A    mov         ecx,dword ptr [eax+198]
 0043F210    test        ecx,ecx
>0043F212    je          0043F217
 0043F214    add         edx,dword ptr [ecx+8]
 0043F217    mov         ecx,dword ptr [eax+19C]
 0043F21D    test        ecx,ecx
>0043F21F    je          0043F224
 0043F221    add         edx,dword ptr [ecx+8]
 0043F224    mov         eax,edx
 0043F226    ret
*}
end;

//0043F228
procedure TWinControl.Broadcast(var Message:void );
begin
{*
 0043F228    push        ebx
 0043F229    push        esi
 0043F22A    push        edi
 0043F22B    push        ebp
 0043F22C    push        ecx
 0043F22D    mov         esi,edx
 0043F22F    mov         dword ptr [esp],eax
 0043F232    mov         eax,dword ptr [esp]
 0043F235    call        TWinControl.GetControlCount
 0043F23A    mov         ebx,eax
 0043F23C    dec         ebx
 0043F23D    test        ebx,ebx
>0043F23F    jl          0043F262
 0043F241    inc         ebx
 0043F242    xor         edi,edi
 0043F244    mov         edx,edi
 0043F246    mov         eax,dword ptr [esp]
 0043F249    call        TWinControl.GetControl
 0043F24E    mov         ebp,eax
 0043F250    mov         edx,esi
 0043F252    mov         eax,dword ptr [ebp+3C]
 0043F255    call        dword ptr [ebp+38]
 0043F258    cmp         dword ptr [esi+0C],0
>0043F25C    jne         0043F262
 0043F25E    inc         edi
 0043F25F    dec         ebx
>0043F260    jne         0043F244
 0043F262    pop         edx
 0043F263    pop         ebp
 0043F264    pop         edi
 0043F265    pop         esi
 0043F266    pop         ebx
 0043F267    ret
*}
end;

//0043F268
procedure TWinControl.NotifyControls(Msg:Word);
begin
{*
 0043F268    add         esp,0FFFFFFF0
 0043F26B    movzx       edx,dx
 0043F26E    mov         dword ptr [esp],edx
 0043F271    xor         edx,edx
 0043F273    mov         dword ptr [esp+4],edx
 0043F277    xor         edx,edx
 0043F279    mov         dword ptr [esp+8],edx
 0043F27D    xor         edx,edx
 0043F27F    mov         dword ptr [esp+0C],edx
 0043F283    mov         edx,esp
 0043F285    call        TWinControl.Broadcast
 0043F28A    add         esp,10
 0043F28D    ret
*}
end;

//0043F290
procedure TWinControl.CreateSubClass(var Params:TCreateParams; ControlClassName:PChar);
begin
{*
 0043F290    push        ebx
 0043F291    push        esi
 0043F292    push        edi
 0043F293    mov         esi,ecx
 0043F295    mov         ebx,edx
 0043F297    test        esi,esi
>0043F299    je          0043F2F7
 0043F29B    mov         edi,dword ptr [ebx+34]
 0043F29E    lea         eax,[ebx+24]
 0043F2A1    push        eax
 0043F2A2    push        esi
 0043F2A3    mov         eax,[005AF664];gvar_005AF664
 0043F2A8    push        eax
 0043F2A9    call        user32.GetClassInfoA
 0043F2AE    test        eax,eax
>0043F2B0    jne         0043F2E6
 0043F2B2    lea         eax,[ebx+24]
 0043F2B5    push        eax
 0043F2B6    push        esi
 0043F2B7    push        0
 0043F2B9    call        user32.GetClassInfoA
 0043F2BE    test        eax,eax
>0043F2C0    jne         0043F2E6
 0043F2C2    lea         eax,[ebx+24]
 0043F2C5    push        eax
 0043F2C6    push        esi
 0043F2C7    mov         eax,[005AE308];MainInstance:Cardinal
 0043F2CC    mov         eax,dword ptr [eax]
 0043F2CE    push        eax
 0043F2CF    call        user32.GetClassInfoA
 0043F2D4    test        eax,eax
>0043F2D6    jne         0043F2E6
 0043F2D8    lea         eax,[ebx+24]
 0043F2DB    push        eax
 0043F2DC    push        esi
 0043F2DD    mov         eax,dword ptr [ebx+34]
 0043F2E0    push        eax
 0043F2E1    call        user32.GetClassInfoA
 0043F2E6    mov         dword ptr [ebx+34],edi
 0043F2E9    mov         eax,dword ptr [ebx+24]
 0043F2EC    and         eax,0FFFFBF1F
 0043F2F1    or          eax,3
 0043F2F4    mov         dword ptr [ebx+24],eax
 0043F2F7    pop         edi
 0043F2F8    pop         esi
 0043F2F9    pop         ebx
 0043F2FA    ret
*}
end;

//0043F2FC
procedure TWinControl.AddBiDiModeExStyle(var ExStyle:DWORD);
begin
{*
 0043F2FC    push        ebx
 0043F2FD    push        esi
 0043F2FE    push        edi
 0043F2FF    mov         edi,edx
 0043F301    mov         ebx,eax
 0043F303    mov         eax,ebx
 0043F305    call        TControl.UseRightToLeftReading
 0043F30A    test        al,al
>0043F30C    je          0043F314
 0043F30E    or          dword ptr [edi],2000
 0043F314    mov         eax,ebx
 0043F316    call        TControl.UseRightToLeftScrollBar
 0043F31B    test        al,al
>0043F31D    je          0043F325
 0043F31F    or          dword ptr [edi],4000
 0043F325    mov         eax,ebx
 0043F327    mov         si,0FFC8
 0043F32B    call        @CallDynaInst
 0043F330    test        al,al
>0043F332    je          0043F35D
 0043F334    mov         eax,ebx
 0043F336    mov         si,0FFCA
 0043F33A    call        @CallDynaInst
 0043F33F    test        al,al
>0043F341    jne         0043F34B
 0043F343    or          dword ptr [edi],1000
>0043F349    jmp         0043F35D
 0043F34B    mov         eax,ebx
 0043F34D    mov         si,0FFCA
 0043F351    call        @CallDynaInst
 0043F356    cmp         al,1
>0043F358    jne         0043F35D
 0043F35A    or          dword ptr [edi],0
 0043F35D    pop         edi
 0043F35E    pop         esi
 0043F35F    pop         ebx
 0043F360    ret
*}
end;

//0043F364
procedure TWinControl.CreateParams(var Params:TCreateParams);
begin
{*
 0043F364    push        ebp
 0043F365    mov         ebp,esp
 0043F367    add         esp,0FFFFFEFC
 0043F36D    push        ebx
 0043F36E    push        esi
 0043F36F    push        edi
 0043F370    xor         ecx,ecx
 0043F372    mov         dword ptr [ebp-4],ecx
 0043F375    mov         ebx,edx
 0043F377    mov         esi,eax
 0043F379    xor         eax,eax
 0043F37B    push        ebp
 0043F37C    push        43F482
 0043F381    push        dword ptr fs:[eax]
 0043F384    mov         dword ptr fs:[eax],esp
 0043F387    mov         eax,ebx
 0043F389    xor         ecx,ecx
 0043F38B    mov         edx,8C
 0043F390    call        @FillChar
 0043F395    mov         eax,dword ptr [esi+64]
 0043F398    mov         dword ptr [ebx],eax
 0043F39A    mov         dword ptr [ebx+4],44000000
 0043F3A1    lea         edx,[ebx+8]
 0043F3A4    mov         eax,esi
 0043F3A6    call        TWinControl.AddBiDiModeExStyle
 0043F3AB    test        byte ptr [esi+50],1
>0043F3AF    je          0043F3BF
 0043F3B1    or          dword ptr [ebx+4],2000000
 0043F3B8    or          dword ptr [ebx+8],10000
 0043F3BF    test        byte ptr [esi+1C],10
>0043F3C3    jne         0043F3D7
 0043F3C5    mov         eax,esi
 0043F3C7    mov         edx,dword ptr [eax]
 0043F3C9    call        dword ptr [edx+50]
 0043F3CC    test        al,al
>0043F3CE    jne         0043F3D7
 0043F3D0    or          dword ptr [ebx+4],8000000
 0043F3D7    cmp         byte ptr [esi+1A4],0
>0043F3DE    je          0043F3E7
 0043F3E0    or          dword ptr [ebx+4],10000
 0043F3E7    mov         eax,dword ptr [esi+40]
 0043F3EA    mov         dword ptr [ebx+0C],eax
 0043F3ED    mov         eax,dword ptr [esi+44]
 0043F3F0    mov         dword ptr [ebx+10],eax
 0043F3F3    mov         eax,dword ptr [esi+48]
 0043F3F6    mov         dword ptr [ebx+14],eax
 0043F3F9    mov         eax,dword ptr [esi+4C]
 0043F3FC    mov         dword ptr [ebx+18],eax
 0043F3FF    mov         edi,dword ptr [esi+30]
 0043F402    test        edi,edi
>0043F404    je          0043F412
 0043F406    mov         eax,edi
 0043F408    call        TWinControl.GetHandle
 0043F40D    mov         dword ptr [ebx+1C],eax
>0043F410    jmp         0043F41B
 0043F412    mov         eax,dword ptr [esi+190]
 0043F418    mov         dword ptr [ebx+1C],eax
 0043F41B    mov         dword ptr [ebx+24],0B
 0043F422    mov         eax,406FDC;user32.DefWindowProcA:Longint
 0043F427    mov         dword ptr [ebx+28],eax
 0043F42A    push        7F00
 0043F42F    push        0
 0043F431    call        user32.LoadCursorA
 0043F436    mov         dword ptr [ebx+3C],eax
 0043F439    xor         eax,eax
 0043F43B    mov         dword ptr [ebx+40],eax
 0043F43E    mov         eax,[005AF664];gvar_005AF664
 0043F443    mov         dword ptr [ebx+34],eax
 0043F446    lea         edx,[ebp-104]
 0043F44C    mov         eax,dword ptr [esi]
 0043F44E    call        TObject.ClassName
 0043F453    lea         edx,[ebp-104]
 0043F459    lea         eax,[ebp-4]
 0043F45C    call        @LStrFromString
 0043F461    mov         edx,dword ptr [ebp-4]
 0043F464    lea         eax,[ebx+4C]
 0043F467    call        StrPCopy
 0043F46C    xor         eax,eax
 0043F46E    pop         edx
 0043F46F    pop         ecx
 0043F470    pop         ecx
 0043F471    mov         dword ptr fs:[eax],edx
 0043F474    push        43F489
 0043F479    lea         eax,[ebp-4]
 0043F47C    call        @LStrClr
 0043F481    ret
>0043F482    jmp         @HandleFinally
>0043F487    jmp         0043F479
 0043F489    pop         edi
 0043F48A    pop         esi
 0043F48B    pop         ebx
 0043F48C    mov         esp,ebp
 0043F48E    pop         ebp
 0043F48F    ret
*}
end;

//0043F490
procedure TWinControl.CreateWnd;
begin
{*
 0043F490    push        ebp
 0043F491    mov         ebp,esp
 0043F493    add         esp,0FFFFFF40
 0043F499    push        ebx
 0043F49A    push        esi
 0043F49B    xor         edx,edx
 0043F49D    mov         dword ptr [ebp-0C0],edx
 0043F4A3    mov         esi,eax
 0043F4A5    xor         eax,eax
 0043F4A7    push        ebp
 0043F4A8    push        43F651
 0043F4AD    push        dword ptr fs:[eax]
 0043F4B0    mov         dword ptr fs:[eax],esp
 0043F4B3    lea         edx,[ebp-8C]
 0043F4B9    mov         eax,esi
 0043F4BB    mov         ecx,dword ptr [eax]
 0043F4BD    call        dword ptr [ecx+98]
 0043F4C3    cmp         dword ptr [ebp-70],0
>0043F4C7    jne         0043F53C
 0043F4C9    test        byte ptr [ebp-85],40
>0043F4D0    je          0043F53C
 0043F4D2    mov         ebx,dword ptr [esi+4]
 0043F4D5    test        ebx,ebx
>0043F4D7    je          0043F4FC
 0043F4D9    test        byte ptr [ebx+1C],2
>0043F4DD    je          0043F4FC
 0043F4DF    mov         eax,ebx
 0043F4E1    mov         edx,dword ptr ds:[4380F4];TWinControl
 0043F4E7    call        @IsClass
 0043F4EC    test        al,al
>0043F4EE    je          0043F4FC
 0043F4F0    mov         eax,ebx
 0043F4F2    call        TWinControl.GetHandle
 0043F4F7    mov         dword ptr [ebp-70],eax
>0043F4FA    jmp         0043F53C
 0043F4FC    mov         eax,dword ptr [esi+8]
 0043F4FF    mov         dword ptr [ebp-0BC],eax
 0043F505    mov         byte ptr [ebp-0B8],0B
 0043F50C    lea         eax,[ebp-0BC]
 0043F512    push        eax
 0043F513    push        0
 0043F515    lea         edx,[ebp-0C0]
 0043F51B    mov         eax,[005AE604];^SParentRequired:TResStringRec
 0043F520    call        LoadStr
 0043F525    mov         ecx,dword ptr [ebp-0C0]
 0043F52B    mov         dl,1
 0043F52D    mov         eax,[00417C8C];EInvalidOperation
 0043F532    call        Exception.CreateFmt
 0043F537    call        @RaiseExcept
 0043F53C    mov         eax,dword ptr [ebp-64]
 0043F53F    mov         dword ptr [esi+174],eax
 0043F545    lea         eax,[ebp-0B4]
 0043F54B    push        eax
 0043F54C    lea         eax,[ebp-40]
 0043F54F    push        eax
 0043F550    mov         eax,dword ptr [ebp-58]
 0043F553    push        eax
 0043F554    call        user32.GetClassInfoA
 0043F559    cmp         eax,1
 0043F55C    sbb         eax,eax
 0043F55E    inc         eax
 0043F55F    test        al,al
>0043F561    je          0043F570
 0043F563    mov         edx,438B00;InitWndProc:Longint
 0043F568    cmp         edx,dword ptr [ebp-0B0]
>0043F56E    je          0043F5A1
 0043F570    test        al,al
>0043F572    je          0043F581
 0043F574    mov         eax,dword ptr [ebp-58]
 0043F577    push        eax
 0043F578    lea         eax,[ebp-40]
 0043F57B    push        eax
 0043F57C    call        user32.UnregisterClassA
 0043F581    mov         dword ptr [ebp-64],438B00;InitWndProc:Longint
 0043F588    lea         eax,[ebp-40]
 0043F58B    mov         dword ptr [ebp-44],eax
 0043F58E    lea         eax,[ebp-68]
 0043F591    push        eax
 0043F592    call        user32.RegisterClassA
 0043F597    test        ax,ax
>0043F59A    jne         0043F5A1
 0043F59C    call        RaiseLastOSError
 0043F5A1    mov         dword ptr ds:[5ACB68],esi
 0043F5A7    lea         edx,[ebp-8C]
 0043F5AD    mov         eax,esi
 0043F5AF    mov         ecx,dword ptr [eax]
 0043F5B1    call        dword ptr [ecx+9C]
 0043F5B7    cmp         dword ptr [esi+180],0
>0043F5BE    jne         0043F5C5
 0043F5C0    call        RaiseLastOSError
 0043F5C5    push        0F0
 0043F5C7    mov         eax,dword ptr [esi+180]
 0043F5CD    push        eax
 0043F5CE    call        user32.GetWindowLongA
 0043F5D3    test        eax,40000000
>0043F5D8    je          0043F5FB
 0043F5DA    push        0F4
 0043F5DC    mov         eax,dword ptr [esi+180]
 0043F5E2    push        eax
 0043F5E3    call        user32.GetWindowLongA
 0043F5E8    test        eax,eax
>0043F5EA    jne         0043F5FB
 0043F5EC    mov         eax,dword ptr [esi+180]
 0043F5F2    push        eax
 0043F5F3    push        0F4
 0043F5F5    push        eax
 0043F5F6    call        user32.SetWindowLongA
 0043F5FB    mov         eax,dword ptr [esi+64]
 0043F5FE    call        StrDispose
 0043F603    xor         eax,eax
 0043F605    mov         dword ptr [esi+64],eax
 0043F608    mov         eax,esi
 0043F60A    call        TWinControl.UpdateBounds
 0043F60F    push        1
 0043F611    mov         eax,dword ptr [esi+68]
 0043F614    call        TFont.GetHandle
 0043F619    mov         ecx,eax
 0043F61B    mov         edx,30
 0043F620    mov         eax,esi
 0043F622    call        TControl.Perform
 0043F627    cmp         byte ptr [esi+5C],0
>0043F62B    je          0043F638
 0043F62D    mov         eax,esi
 0043F62F    mov         si,0FFEE
 0043F633    call        @CallDynaInst
 0043F638    xor         eax,eax
 0043F63A    pop         edx
 0043F63B    pop         ecx
 0043F63C    pop         ecx
 0043F63D    mov         dword ptr fs:[eax],edx
 0043F640    push        43F658
 0043F645    lea         eax,[ebp-0C0]
 0043F64B    call        @LStrClr
 0043F650    ret
>0043F651    jmp         @HandleFinally
>0043F656    jmp         0043F645
 0043F658    pop         esi
 0043F659    pop         ebx
 0043F65A    mov         esp,ebp
 0043F65C    pop         ebp
 0043F65D    ret
*}
end;

//0043F660
procedure TWinControl.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 0043F660    push        ebx
 0043F661    push        esi
 0043F662    mov         ebx,edx
 0043F664    mov         esi,eax
 0043F666    mov         eax,dword ptr [ebx+4]
 0043F669    push        eax
 0043F66A    mov         eax,dword ptr [ebx+0C]
 0043F66D    push        eax
 0043F66E    mov         eax,dword ptr [ebx+10]
 0043F671    push        eax
 0043F672    mov         eax,dword ptr [ebx+14]
 0043F675    push        eax
 0043F676    mov         eax,dword ptr [ebx+18]
 0043F679    push        eax
 0043F67A    mov         eax,dword ptr [ebx+1C]
 0043F67D    push        eax
 0043F67E    push        0
 0043F680    mov         eax,dword ptr [ebx+34]
 0043F683    push        eax
 0043F684    mov         eax,dword ptr [ebx+20]
 0043F687    push        eax
 0043F688    mov         ecx,dword ptr [ebx]
 0043F68A    lea         edx,[ebx+4C]
 0043F68D    mov         eax,dword ptr [ebx+8]
 0043F690    call        CreateWindowEx
 0043F695    mov         dword ptr [esi+180],eax
 0043F69B    pop         esi
 0043F69C    pop         ebx
 0043F69D    ret
*}
end;

//0043F6A0
procedure TWinControl.ReadDesignSize(Reader:TReader);
begin
{*
 0043F6A0    push        ebx
 0043F6A1    push        esi
 0043F6A2    mov         esi,edx
 0043F6A4    mov         ebx,eax
 0043F6A6    mov         eax,esi
 0043F6A8    call        TReader.ReadListBegin
 0043F6AD    mov         eax,esi
 0043F6AF    call        TReader.ReadInteger
 0043F6B4    mov         dword ptr [ebx+1FA],eax
 0043F6BA    mov         eax,esi
 0043F6BC    call        TReader.ReadInteger
 0043F6C1    mov         dword ptr [ebx+1FE],eax
 0043F6C7    or          byte ptr [ebx+98],20
 0043F6CE    mov         eax,esi
 0043F6D0    call        TReader.ReadListEnd
 0043F6D5    pop         esi
 0043F6D6    pop         ebx
 0043F6D7    ret
*}
end;

//0043F6D8
procedure TWinControl.WriteDesignSize(Writer:TWriter);
begin
{*
 0043F6D8    push        ebx
 0043F6D9    push        esi
 0043F6DA    add         esp,0FFFFFFF0
 0043F6DD    mov         esi,edx
 0043F6DF    mov         ebx,eax
 0043F6E1    mov         edx,esp
 0043F6E3    mov         eax,ebx
 0043F6E5    mov         ecx,dword ptr [eax]
 0043F6E7    call        dword ptr [ecx+44]
 0043F6EA    mov         eax,dword ptr [esp+8]
 0043F6EE    mov         dword ptr [ebx+1FA],eax
 0043F6F4    mov         eax,dword ptr [esp+0C]
 0043F6F8    mov         dword ptr [ebx+1FE],eax
 0043F6FE    mov         eax,esi
 0043F700    call        TWriter.WriteListBegin
 0043F705    mov         edx,dword ptr [ebx+1FA]
 0043F70B    mov         eax,esi
 0043F70D    call        TWriter.WriteInteger
 0043F712    mov         edx,dword ptr [ebx+1FE]
 0043F718    mov         eax,esi
 0043F71A    call        TWriter.WriteInteger
 0043F71F    mov         eax,esi
 0043F721    call        TWriter.WriteListEnd
 0043F726    add         esp,10
 0043F729    pop         esi
 0043F72A    pop         ebx
 0043F72B    ret
*}
end;

//0043F72C
function PointsEqual(const P1:TPoint; const P2:TPoint):Boolean;
begin
{*
 0043F72C    mov         ecx,dword ptr [eax]
 0043F72E    cmp         ecx,dword ptr [edx]
>0043F730    jne         0043F73A
 0043F732    mov         eax,dword ptr [eax+4]
 0043F735    cmp         eax,dword ptr [edx+4]
>0043F738    je          0043F73D
 0043F73A    xor         eax,eax
 0043F73C    ret
 0043F73D    mov         al,1
 0043F73F    ret
*}
end;

//0043F740
function DoWriteDesignSize:Boolean;
begin
{*
 0043F740    push        ebp
 0043F741    mov         ebp,esp
 0043F743    push        ecx
 0043F744    push        ebx
 0043F745    push        esi
 0043F746    push        edi
 0043F747    mov         byte ptr [ebp-1],1
 0043F74B    mov         eax,dword ptr [ebp+8]
 0043F74E    mov         eax,dword ptr [eax-4]
 0043F751    mov         ebx,dword ptr [eax+20]
 0043F754    test        ebx,ebx
>0043F756    je          0043F779
 0043F758    mov         eax,dword ptr [ebp+8]
 0043F75B    lea         edx,[ebx+1FA]
 0043F761    mov         eax,dword ptr [ebp+8]
 0043F764    mov         eax,dword ptr [eax-8]
 0043F767    add         eax,1FA
 0043F76C    call        PointsEqual
 0043F771    test        al,al
>0043F773    jne         0043F807
 0043F779    mov         eax,dword ptr [ebp+8]
 0043F77C    mov         eax,dword ptr [eax-8]
 0043F77F    mov         eax,dword ptr [eax+198]
 0043F785    test        eax,eax
>0043F787    je          0043F7C0
 0043F789    mov         edx,dword ptr [ebp+8]
 0043F78C    mov         ebx,dword ptr [eax+8]
 0043F78F    dec         ebx
 0043F790    test        ebx,ebx
>0043F792    jl          0043F7C0
 0043F794    inc         ebx
 0043F795    xor         esi,esi
 0043F797    mov         eax,dword ptr [ebp+8]
 0043F79A    mov         eax,dword ptr [eax-8]
 0043F79D    mov         eax,dword ptr [eax+198]
 0043F7A3    mov         edx,esi
 0043F7A5    call        TList.Get
 0043F7AA    mov         edi,eax
 0043F7AC    cmp         byte ptr [edi+5B],0
>0043F7B0    jne         0043F7BC
 0043F7B2    mov         al,[0043F814]
 0043F7B7    cmp         al,byte ptr [edi+61]
>0043F7BA    jne         0043F80B
 0043F7BC    inc         esi
 0043F7BD    dec         ebx
>0043F7BE    jne         0043F797
 0043F7C0    mov         eax,dword ptr [ebp+8]
 0043F7C3    mov         eax,dword ptr [eax-8]
 0043F7C6    mov         eax,dword ptr [eax+19C]
 0043F7CC    test        eax,eax
>0043F7CE    je          0043F807
 0043F7D0    mov         edx,dword ptr [ebp+8]
 0043F7D3    mov         ebx,dword ptr [eax+8]
 0043F7D6    dec         ebx
 0043F7D7    test        ebx,ebx
>0043F7D9    jl          0043F807
 0043F7DB    inc         ebx
 0043F7DC    xor         esi,esi
 0043F7DE    mov         eax,dword ptr [ebp+8]
 0043F7E1    mov         eax,dword ptr [eax-8]
 0043F7E4    mov         eax,dword ptr [eax+19C]
 0043F7EA    mov         edx,esi
 0043F7EC    call        TList.Get
 0043F7F1    mov         edi,eax
 0043F7F3    cmp         byte ptr [edi+5B],0
>0043F7F7    jne         0043F803
 0043F7F9    mov         al,[0043F814]
 0043F7FE    cmp         al,byte ptr [edi+61]
>0043F801    jne         0043F80B
 0043F803    inc         esi
 0043F804    dec         ebx
>0043F805    jne         0043F7DE
 0043F807    mov         byte ptr [ebp-1],0
 0043F80B    mov         al,byte ptr [ebp-1]
 0043F80E    pop         edi
 0043F80F    pop         esi
 0043F810    pop         ebx
 0043F811    pop         ecx
 0043F812    pop         ebp
 0043F813    ret
*}
end;

//0043F818
procedure TWinControl.DefineProperties(Filer:TFiler);
begin
{*
 0043F818    push        ebp
 0043F819    mov         ebp,esp
 0043F81B    add         esp,0FFFFFFF8
 0043F81E    push        ebx
 0043F81F    mov         dword ptr [ebp-4],edx
 0043F822    mov         dword ptr [ebp-8],eax
 0043F825    mov         edx,dword ptr [ebp-4]
 0043F828    mov         eax,dword ptr [ebp-8]
 0043F82B    call        TControl.DefineProperties
 0043F830    mov         eax,dword ptr [ebp-8]
 0043F833    push        eax
 0043F834    push        43F6A0;TWinControl.ReadDesignSize
 0043F839    mov         eax,dword ptr [ebp-8]
 0043F83C    push        eax
 0043F83D    push        43F6D8;TWinControl.WriteDesignSize
 0043F842    push        ebp
 0043F843    call        DoWriteDesignSize
 0043F848    pop         ecx
 0043F849    mov         ecx,eax
 0043F84B    mov         edx,43F868;'DesignSize'
 0043F850    mov         eax,dword ptr [ebp-4]
 0043F853    mov         ebx,dword ptr [eax]
 0043F855    call        dword ptr [ebx+4]
 0043F858    pop         ebx
 0043F859    pop         ecx
 0043F85A    pop         ecx
 0043F85B    pop         ebp
 0043F85C    ret
*}
end;

//0043F874
procedure TWinControl.DestroyWnd;
begin
{*
 0043F874    push        ebx
 0043F875    push        esi
 0043F876    push        edi
 0043F877    mov         ebx,eax
 0043F879    mov         eax,ebx
 0043F87B    call        TControl.GetTextLen
 0043F880    mov         esi,eax
 0043F882    cmp         esi,1
>0043F885    jge         0043F896
 0043F887    mov         eax,43F8C8
 0043F88C    call        StrNew
 0043F891    mov         dword ptr [ebx+64],eax
>0043F894    jmp         0043F8B5
 0043F896    lea         eax,[esi+1]
 0043F899    call        StrAlloc
 0043F89E    mov         edi,eax
 0043F8A0    mov         dword ptr [ebx+64],edi
 0043F8A3    mov         eax,edi
 0043F8A5    call        StrBufSize
 0043F8AA    mov         ecx,eax
 0043F8AC    mov         edx,edi
 0043F8AE    mov         eax,ebx
 0043F8B0    call        TControl.GetTextBuf
 0043F8B5    call        FreeDeviceContexts
 0043F8BA    mov         eax,ebx
 0043F8BC    mov         edx,dword ptr [eax]
 0043F8BE    call        dword ptr [edx+0AC]
 0043F8C4    pop         edi
 0043F8C5    pop         esi
 0043F8C6    pop         ebx
 0043F8C7    ret
*}
end;

//0043F8CC
procedure TWinControl.DestroyWindowHandle;
begin
{*
 0043F8CC    push        ebp
 0043F8CD    mov         ebp,esp
 0043F8CF    push        ecx
 0043F8D0    mov         dword ptr [ebp-4],eax
 0043F8D3    mov         eax,dword ptr [ebp-4]
 0043F8D6    or          word ptr [eax+54],200
 0043F8DC    xor         eax,eax
 0043F8DE    push        ebp
 0043F8DF    push        43F919
 0043F8E4    push        dword ptr fs:[eax]
 0043F8E7    mov         dword ptr fs:[eax],esp
 0043F8EA    mov         eax,dword ptr [ebp-4]
 0043F8ED    mov         eax,dword ptr [eax+180]
 0043F8F3    push        eax
 0043F8F4    call        user32.DestroyWindow
 0043F8F9    test        eax,eax
>0043F8FB    jne         0043F902
 0043F8FD    call        RaiseLastOSError
 0043F902    xor         eax,eax
 0043F904    pop         edx
 0043F905    pop         ecx
 0043F906    pop         ecx
 0043F907    mov         dword ptr fs:[eax],edx
 0043F90A    push        43F920
 0043F90F    mov         eax,dword ptr [ebp-4]
 0043F912    and         word ptr [eax+54],0FDFF
 0043F918    ret
>0043F919    jmp         @HandleFinally
>0043F91E    jmp         0043F90F
 0043F920    mov         eax,dword ptr [ebp-4]
 0043F923    xor         edx,edx
 0043F925    mov         dword ptr [eax+180],edx
 0043F92B    pop         ecx
 0043F92C    pop         ebp
 0043F92D    ret
*}
end;

//0043F930
function TWinControl.PrecedingWindow(Control:TWinControl):HWND;
begin
{*
 0043F930    push        ebx
 0043F931    push        esi
 0043F932    push        edi
 0043F933    mov         ebx,edx
 0043F935    mov         edi,eax
 0043F937    mov         eax,dword ptr [edi+19C]
 0043F93D    mov         edx,ebx
 0043F93F    call        TList.IndexOf
 0043F944    mov         esi,eax
 0043F946    inc         esi
 0043F947    mov         eax,dword ptr [edi+19C]
 0043F94D    mov         ebx,dword ptr [eax+8]
 0043F950    dec         ebx
 0043F951    sub         ebx,esi
>0043F953    jl          0043F971
 0043F955    inc         ebx
 0043F956    mov         eax,dword ptr [edi+19C]
 0043F95C    mov         edx,esi
 0043F95E    call        TList.Get
 0043F963    mov         eax,dword ptr [eax+180]
 0043F969    test        eax,eax
>0043F96B    jne         0043F973
 0043F96D    inc         esi
 0043F96E    dec         ebx
>0043F96F    jne         0043F956
 0043F971    xor         eax,eax
 0043F973    pop         edi
 0043F974    pop         esi
 0043F975    pop         ebx
 0043F976    ret
*}
end;

//0043F978
procedure TWinControl.CreateHandle;
begin
{*
 0043F978    push        ebx
 0043F979    push        esi
 0043F97A    push        edi
 0043F97B    mov         ebx,eax
 0043F97D    cmp         dword ptr [ebx+180],0
>0043F984    jne         0043FA0A
 0043F98A    mov         eax,ebx
 0043F98C    mov         edx,dword ptr [eax]
 0043F98E    call        dword ptr [edx+0A0]
 0043F994    mov         esi,ebx
 0043F996    push        esi
 0043F997    movzx       eax,word ptr ds:[5E0C1A];ControlAtom:TAtom
 0043F99E    push        eax
 0043F99F    mov         eax,dword ptr [ebx+180]
 0043F9A5    push        eax
 0043F9A6    call        user32.SetPropA
 0043F9AB    push        esi
 0043F9AC    movzx       eax,word ptr ds:[5E0C18];WindowAtom:TAtom
 0043F9B3    push        eax
 0043F9B4    mov         eax,dword ptr [ebx+180]
 0043F9BA    push        eax
 0043F9BB    call        user32.SetPropA
 0043F9C0    mov         esi,dword ptr [ebx+30]
 0043F9C3    test        esi,esi
>0043F9C5    je          0043F9E7
 0043F9C7    push        13
 0043F9C9    push        0
 0043F9CB    push        0
 0043F9CD    push        0
 0043F9CF    push        0
 0043F9D1    mov         edx,ebx
 0043F9D3    mov         eax,esi
 0043F9D5    call        TWinControl.PrecedingWindow
 0043F9DA    push        eax
 0043F9DB    mov         eax,dword ptr [ebx+180]
 0043F9E1    push        eax
 0043F9E2    call        user32.SetWindowPos
 0043F9E7    mov         eax,ebx
 0043F9E9    call        TWinControl.GetControlCount
 0043F9EE    mov         esi,eax
 0043F9F0    dec         esi
 0043F9F1    test        esi,esi
>0043F9F3    jl          0043FA0A
 0043F9F5    inc         esi
 0043F9F6    xor         edi,edi
 0043F9F8    mov         edx,edi
 0043F9FA    mov         eax,ebx
 0043F9FC    call        TWinControl.GetControl
 0043FA01    call        TControl.UpdateAnchorRules
 0043FA06    inc         edi
 0043FA07    dec         esi
>0043FA08    jne         0043F9F8
 0043FA0A    pop         edi
 0043FA0B    pop         esi
 0043FA0C    pop         ebx
 0043FA0D    ret
*}
end;

//0043FA10
{*function sub_0043FA10:?;
begin
 0043FA10    xor         eax,eax
 0043FA12    ret
end;*}

//0043FA14
procedure TWinControl.CustomAlignPosition(Control:TControl; var NewLeft:Integer; var NewTop:Integer; var NewWidth:Integer; var NewHeight:Integer; var AlignRect:TRect; AlignInfo:TAlignInfo);
begin
{*
 0043FA14    push        ebp
 0043FA15    mov         ebp,esp
 0043FA17    add         esp,0FFFFFFF0
 0043FA1A    push        esi
 0043FA1B    push        edi
 0043FA1C    mov         esi,dword ptr [ebp+8]
 0043FA1F    lea         edi,[ebp-10]
 0043FA22    movs        dword ptr [edi],dword ptr [esi]
 0043FA23    movs        dword ptr [edi],dword ptr [esi]
 0043FA24    movs        dword ptr [edi],dword ptr [esi]
 0043FA25    movs        dword ptr [edi],dword ptr [esi]
 0043FA26    pop         edi
 0043FA27    pop         esi
 0043FA28    mov         esp,ebp
 0043FA2A    pop         ebp
 0043FA2B    ret         14
*}
end;

//0043FA30
procedure TWinControl.DestroyHandle;
begin
{*
 0043FA30    push        ebx
 0043FA31    push        esi
 0043FA32    push        edi
 0043FA33    mov         ebx,eax
 0043FA35    cmp         dword ptr [ebx+180],0
>0043FA3C    je          0043FA73
 0043FA3E    mov         eax,dword ptr [ebx+19C]
 0043FA44    test        eax,eax
>0043FA46    je          0043FA69
 0043FA48    mov         esi,dword ptr [eax+8]
 0043FA4B    dec         esi
 0043FA4C    test        esi,esi
>0043FA4E    jl          0043FA69
 0043FA50    inc         esi
 0043FA51    xor         edi,edi
 0043FA53    mov         edx,edi
 0043FA55    mov         eax,dword ptr [ebx+19C]
 0043FA5B    call        TList.Get
 0043FA60    call        TWinControl.DestroyHandle
 0043FA65    inc         edi
 0043FA66    dec         esi
>0043FA67    jne         0043FA53
 0043FA69    mov         eax,ebx
 0043FA6B    mov         edx,dword ptr [eax]
 0043FA6D    call        dword ptr [edx+0B0]
 0043FA73    pop         edi
 0043FA74    pop         esi
 0043FA75    pop         ebx
 0043FA76    ret
*}
end;

//0043FA78
procedure TWinControl.RecreateWnd;
begin
{*
 0043FA78    cmp         dword ptr [eax+180],0
>0043FA7F    je          0043FA8F
 0043FA81    push        0
 0043FA83    xor         ecx,ecx
 0043FA85    mov         edx,0B033
 0043FA8A    call        TControl.Perform
 0043FA8F    ret
*}
end;

//0043FA90
procedure TWinControl.CMRecreateWnd(var Message:TMessage);
begin
{*
 0043FA90    push        ebx
 0043FA91    push        esi
 0043FA92    push        edi
 0043FA93    mov         edi,eax
 0043FA95    mov         eax,edi
 0043FA97    mov         si,0FFB5
 0043FA9B    call        @CallDynaInst
 0043FAA0    mov         ebx,eax
 0043FAA2    mov         eax,edi
 0043FAA4    call        TWinControl.DestroyHandle
 0043FAA9    mov         eax,edi
 0043FAAB    call        TWinControl.UpdateControlState
 0043FAB0    test        bl,bl
>0043FAB2    je          0043FAC9
 0043FAB4    cmp         dword ptr [edi+180],0
>0043FABB    je          0043FAC9
 0043FABD    mov         eax,dword ptr [edi+180]
 0043FAC3    push        eax
 0043FAC4    call        user32.SetFocus
 0043FAC9    pop         edi
 0043FACA    pop         esi
 0043FACB    pop         ebx
 0043FACC    ret
*}
end;

//0043FAD0
procedure TWinControl.UpdateShowing;
begin
{*
 0043FAD0    push        ebp
 0043FAD1    mov         ebp,esp
 0043FAD3    add         esp,0FFFFFFF8
 0043FAD6    push        ebx
 0043FAD7    push        esi
 0043FAD8    push        edi
 0043FAD9    mov         dword ptr [ebp-4],eax
 0043FADC    mov         eax,dword ptr [ebp-4]
 0043FADF    cmp         byte ptr [eax+57],0
>0043FAE3    jne         0043FAF7
 0043FAE5    mov         eax,dword ptr [ebp-4]
 0043FAE8    test        byte ptr [eax+1C],10
>0043FAEC    je          0043FB00
 0043FAEE    mov         eax,dword ptr [ebp-4]
 0043FAF1    test        byte ptr [eax+51],4
>0043FAF5    jne         0043FB00
 0043FAF7    mov         eax,dword ptr [ebp-4]
 0043FAFA    test        byte ptr [eax+54],8
>0043FAFE    je          0043FB04
 0043FB00    xor         eax,eax
>0043FB02    jmp         0043FB06
 0043FB04    mov         al,1
 0043FB06    mov         byte ptr [ebp-5],al
 0043FB09    cmp         byte ptr [ebp-5],0
>0043FB0D    je          0043FB57
 0043FB0F    mov         eax,dword ptr [ebp-4]
 0043FB12    cmp         dword ptr [eax+180],0
>0043FB19    jne         0043FB26
 0043FB1B    mov         eax,dword ptr [ebp-4]
 0043FB1E    mov         edx,dword ptr [eax]
 0043FB20    call        dword ptr [edx+94]
 0043FB26    mov         eax,dword ptr [ebp-4]
 0043FB29    mov         eax,dword ptr [eax+19C]
 0043FB2F    test        eax,eax
>0043FB31    je          0043FB57
 0043FB33    mov         ebx,dword ptr [eax+8]
 0043FB36    dec         ebx
 0043FB37    test        ebx,ebx
>0043FB39    jl          0043FB57
 0043FB3B    inc         ebx
 0043FB3C    xor         esi,esi
 0043FB3E    mov         eax,dword ptr [ebp-4]
 0043FB41    mov         eax,dword ptr [eax+19C]
 0043FB47    mov         edx,esi
 0043FB49    call        TList.Get
 0043FB4E    call        TWinControl.UpdateShowing
 0043FB53    inc         esi
 0043FB54    dec         ebx
>0043FB55    jne         0043FB3E
 0043FB57    mov         eax,dword ptr [ebp-4]
 0043FB5A    cmp         dword ptr [eax+180],0
>0043FB61    je          0043FBC3
 0043FB63    mov         eax,dword ptr [ebp-4]
 0043FB66    mov         al,byte ptr [eax+1A6]
 0043FB6C    cmp         al,byte ptr [ebp-5]
>0043FB6F    je          0043FBC3
 0043FB71    mov         eax,dword ptr [ebp-4]
 0043FB74    mov         dl,byte ptr [ebp-5]
 0043FB77    mov         byte ptr [eax+1A6],dl
 0043FB7D    xor         eax,eax
 0043FB7F    push        ebp
 0043FB80    push        43FBA6
 0043FB85    push        dword ptr fs:[eax]
 0043FB88    mov         dword ptr fs:[eax],esp
 0043FB8B    push        0
 0043FB8D    xor         ecx,ecx
 0043FB8F    mov         edx,0B019
 0043FB94    mov         eax,dword ptr [ebp-4]
 0043FB97    call        TControl.Perform
 0043FB9C    xor         eax,eax
 0043FB9E    pop         edx
 0043FB9F    pop         ecx
 0043FBA0    pop         ecx
 0043FBA1    mov         dword ptr fs:[eax],edx
>0043FBA4    jmp         0043FBC3
>0043FBA6    jmp         @HandleAnyException
 0043FBAB    mov         al,byte ptr [ebp-5]
 0043FBAE    xor         al,1
 0043FBB0    mov         edx,dword ptr [ebp-4]
 0043FBB3    mov         byte ptr [edx+1A6],al
 0043FBB9    call        @RaiseAgain
 0043FBBE    call        @DoneExcept
 0043FBC3    pop         edi
 0043FBC4    pop         esi
 0043FBC5    pop         ebx
 0043FBC6    pop         ecx
 0043FBC7    pop         ecx
 0043FBC8    pop         ebp
 0043FBC9    ret
*}
end;

//0043FBCC
procedure TWinControl.UpdateControlState;
begin
{*
 0043FBCC    push        ebx
 0043FBCD    push        esi
 0043FBCE    mov         esi,eax
 0043FBD0    mov         ebx,esi
>0043FBD2    jmp         0043FBDF
 0043FBD4    mov         ebx,eax
 0043FBD6    cmp         byte ptr [ebx+1A6],0
>0043FBDD    je          0043FC07
 0043FBDF    mov         eax,dword ptr [ebx+30]
 0043FBE2    test        eax,eax
>0043FBE4    jne         0043FBD4
 0043FBE6    mov         eax,ebx
 0043FBE8    mov         edx,dword ptr ds:[450CFC];TCustomForm
 0043FBEE    call        @IsClass
 0043FBF3    test        al,al
>0043FBF5    jne         0043FC00
 0043FBF7    cmp         dword ptr [ebx+190],0
>0043FBFE    je          0043FC07
 0043FC00    mov         eax,esi
 0043FC02    call        TWinControl.UpdateShowing
 0043FC07    pop         esi
 0043FC08    pop         ebx
 0043FC09    ret
*}
end;

//0043FC0C
procedure TWinControl.SetParentWindow(Value:HWND);
begin
{*
 0043FC0C    push        ebx
 0043FC0D    push        esi
 0043FC0E    mov         esi,edx
 0043FC10    mov         ebx,eax
 0043FC12    cmp         dword ptr [ebx+30],0
>0043FC16    jne         0043FC90
 0043FC18    cmp         esi,dword ptr [ebx+190]
>0043FC1E    je          0043FC90
 0043FC20    cmp         dword ptr [ebx+180],0
>0043FC27    je          0043FC7C
 0043FC29    cmp         dword ptr [ebx+190],0
>0043FC30    je          0043FC7C
 0043FC32    test        esi,esi
>0043FC34    je          0043FC7C
 0043FC36    mov         dword ptr [ebx+190],esi
 0043FC3C    push        esi
 0043FC3D    mov         eax,dword ptr [ebx+180]
 0043FC43    push        eax
 0043FC44    call        user32.SetParent
 0043FC49    mov         eax,[005AE310]
 0043FC4E    cmp         dword ptr [eax],5
>0043FC51    jl          0043FC89
 0043FC53    mov         eax,[005AE800]
 0043FC58    cmp         dword ptr [eax],2
>0043FC5B    jne         0043FC89
 0043FC5D    push        0
 0043FC5F    mov         dx,3
 0043FC63    mov         ax,3
 0043FC67    call        MakeWParam
 0043FC6C    mov         ecx,eax
 0043FC6E    mov         edx,127
 0043FC73    mov         eax,ebx
 0043FC75    call        TControl.Perform
>0043FC7A    jmp         0043FC89
 0043FC7C    mov         eax,ebx
 0043FC7E    call        TWinControl.DestroyHandle
 0043FC83    mov         dword ptr [ebx+190],esi
 0043FC89    mov         eax,ebx
 0043FC8B    call        TWinControl.UpdateControlState
 0043FC90    pop         esi
 0043FC91    pop         ebx
 0043FC92    ret
*}
end;

//0043FC94
procedure TWinControl.MainWndProc(var Message:TMessage);
begin
{*
 0043FC94    push        ebp
 0043FC95    mov         ebp,esp
 0043FC97    push        ecx
 0043FC98    push        ebx
 0043FC99    push        esi
 0043FC9A    push        edi
 0043FC9B    mov         dword ptr [ebp-4],eax
 0043FC9E    xor         eax,eax
 0043FCA0    push        ebp
 0043FCA1    push        43FCEC
 0043FCA6    push        dword ptr fs:[eax]
 0043FCA9    mov         dword ptr fs:[eax],esp
 0043FCAC    xor         eax,eax
 0043FCAE    push        ebp
 0043FCAF    push        43FCDB
 0043FCB4    push        dword ptr fs:[eax]
 0043FCB7    mov         dword ptr fs:[eax],esp
 0043FCBA    mov         ebx,dword ptr [ebp-4]
 0043FCBD    mov         eax,dword ptr [ebx+3C]
 0043FCC0    call        dword ptr [ebx+38]
 0043FCC3    xor         eax,eax
 0043FCC5    pop         edx
 0043FCC6    pop         ecx
 0043FCC7    pop         ecx
 0043FCC8    mov         dword ptr fs:[eax],edx
 0043FCCB    push        43FCE2
 0043FCD0    call        FreeDeviceContexts
 0043FCD5    call        FreeMemoryContexts
 0043FCDA    ret
>0043FCDB    jmp         @HandleFinally
>0043FCE0    jmp         0043FCD0
 0043FCE2    xor         eax,eax
 0043FCE4    pop         edx
 0043FCE5    pop         ecx
 0043FCE6    pop         ecx
 0043FCE7    mov         dword ptr fs:[eax],edx
>0043FCEA    jmp         0043FD05
>0043FCEC    jmp         @HandleAnyException
 0043FCF1    mov         eax,[005AE584];^Application:TApplication
 0043FCF6    mov         eax,dword ptr [eax]
 0043FCF8    mov         edx,dword ptr [ebp-4]
 0043FCFB    call        TApplication.HandleException
 0043FD00    call        @DoneExcept
 0043FD05    pop         edi
 0043FD06    pop         esi
 0043FD07    pop         ebx
 0043FD08    pop         ecx
 0043FD09    pop         ebp
 0043FD0A    ret
*}
end;

//0043FD0C
function GetControlAtPos(AControl:TControl):Boolean;
begin
{*
 0043FD0C    push        ebp
 0043FD0D    mov         ebp,esp
 0043FD0F    add         esp,0FFFFFFE8
 0043FD12    push        ebx
 0043FD13    mov         ebx,eax
 0043FD15    lea         ecx,[ebp-8]
 0043FD18    mov         eax,dword ptr [ebp+8]
 0043FD1B    mov         edx,dword ptr [eax-4]
 0043FD1E    mov         edx,dword ptr [edx+4]
 0043FD21    sub         edx,dword ptr [ebx+44]
 0043FD24    mov         eax,dword ptr [ebp+8]
 0043FD27    mov         eax,dword ptr [eax-4]
 0043FD2A    mov         eax,dword ptr [eax]
 0043FD2C    sub         eax,dword ptr [ebx+40]
 0043FD2F    call        Point
 0043FD34    mov         eax,dword ptr [ebp+8]
 0043FD37    mov         edx,dword ptr [ebp-8]
 0043FD3A    mov         dword ptr [eax-0C],edx
 0043FD3D    mov         edx,dword ptr [ebp-4]
 0043FD40    mov         dword ptr [eax-8],edx
 0043FD43    mov         eax,dword ptr [ebp+8]
 0043FD46    push        dword ptr [eax-8]
 0043FD49    push        dword ptr [eax-0C]
 0043FD4C    lea         edx,[ebp-18]
 0043FD4F    mov         eax,ebx
 0043FD51    mov         ecx,dword ptr [eax]
 0043FD53    call        dword ptr [ecx+44]
 0043FD56    lea         eax,[ebp-18]
 0043FD59    push        eax
 0043FD5A    call        user32.PtInRect
 0043FD5F    test        eax,eax
>0043FD61    je          0043FDAD
 0043FD63    test        byte ptr [ebx+1C],10
>0043FD67    je          0043FD75
 0043FD69    cmp         byte ptr [ebx+57],0
>0043FD6D    jne         0043FDB1
 0043FD6F    test        byte ptr [ebx+51],4
>0043FD73    je          0043FDB1
 0043FD75    cmp         byte ptr [ebx+57],0
>0043FD79    je          0043FDAD
 0043FD7B    mov         eax,ebx
 0043FD7D    mov         edx,dword ptr [eax]
 0043FD7F    call        dword ptr [edx+50]
 0043FD82    test        al,al
>0043FD84    jne         0043FD8F
 0043FD86    mov         eax,dword ptr [ebp+8]
 0043FD89    cmp         byte ptr [eax-0D],0
>0043FD8D    je          0043FDAD
 0043FD8F    mov         eax,dword ptr [ebp+8]
 0043FD92    add         eax,0FFFFFFF4
 0043FD95    call        PointToSmallPoint
 0043FD9A    push        eax
 0043FD9B    xor         ecx,ecx
 0043FD9D    mov         edx,0B00A
 0043FDA2    mov         eax,ebx
 0043FDA4    call        TControl.Perform
 0043FDA9    test        eax,eax
>0043FDAB    jne         0043FDB1
 0043FDAD    xor         eax,eax
>0043FDAF    jmp         0043FDB3
 0043FDB1    mov         al,1
 0043FDB3    test        al,al
>0043FDB5    je          0043FDBD
 0043FDB7    mov         edx,dword ptr [ebp+8]
 0043FDBA    mov         dword ptr [edx-14],ebx
 0043FDBD    pop         ebx
 0043FDBE    mov         esp,ebp
 0043FDC0    pop         ebp
 0043FDC1    ret
*}
end;

//0043FDC4
function TWinControl.ControlAtPos(const Pos:TPoint; AllowDisabled:Boolean; AllowWinControls:Boolean):TControl;
begin
{*
 0043FDC4    push        ebp
 0043FDC5    mov         ebp,esp
 0043FDC7    add         esp,0FFFFFFEC
 0043FDCA    push        ebx
 0043FDCB    push        esi
 0043FDCC    mov         byte ptr [ebp-0D],cl
 0043FDCF    mov         dword ptr [ebp-4],edx
 0043FDD2    mov         esi,eax
 0043FDD4    xor         eax,eax
 0043FDD6    mov         dword ptr [ebp-14],eax
 0043FDD9    cmp         byte ptr [ebp+8],0
>0043FDDD    je          0043FE15
 0043FDDF    cmp         dword ptr [esi+19C],0
>0043FDE6    je          0043FE15
 0043FDE8    mov         eax,dword ptr [esi+19C]
 0043FDEE    mov         ebx,dword ptr [eax+8]
 0043FDF1    dec         ebx
 0043FDF2    cmp         ebx,0
>0043FDF5    jl          0043FE15
 0043FDF7    push        ebp
 0043FDF8    mov         edx,ebx
 0043FDFA    mov         eax,dword ptr [esi+19C]
 0043FE00    call        TList.Get
 0043FE05    call        GetControlAtPos
 0043FE0A    pop         ecx
 0043FE0B    test        al,al
>0043FE0D    jne         0043FE15
 0043FE0F    dec         ebx
 0043FE10    cmp         ebx,0FFFFFFFF
>0043FE13    jne         0043FDF7
 0043FE15    mov         eax,dword ptr [esi+198]
 0043FE1B    test        eax,eax
>0043FE1D    je          0043FE4C
 0043FE1F    cmp         dword ptr [ebp-14],0
>0043FE23    jne         0043FE4C
 0043FE25    mov         ebx,dword ptr [eax+8]
 0043FE28    dec         ebx
 0043FE29    cmp         ebx,0
>0043FE2C    jl          0043FE4C
 0043FE2E    push        ebp
 0043FE2F    mov         edx,ebx
 0043FE31    mov         eax,dword ptr [esi+198]
 0043FE37    call        TList.Get
 0043FE3C    call        GetControlAtPos
 0043FE41    pop         ecx
 0043FE42    test        al,al
>0043FE44    jne         0043FE4C
 0043FE46    dec         ebx
 0043FE47    cmp         ebx,0FFFFFFFF
>0043FE4A    jne         0043FE2E
 0043FE4C    mov         eax,dword ptr [ebp-14]
 0043FE4F    pop         esi
 0043FE50    pop         ebx
 0043FE51    mov         esp,ebp
 0043FE53    pop         ebp
 0043FE54    ret         4
*}
end;

//0043FE58
function TWinControl.IsControlMouseMsg(var Message:TWMMouse):Boolean;
begin
{*
 0043FE58    push        ebx
 0043FE59    push        esi
 0043FE5A    push        edi
 0043FE5B    add         esp,0FFFFFFF0
 0043FE5E    mov         esi,edx
 0043FE60    mov         ebx,eax
 0043FE62    mov         eax,ebx
 0043FE64    call        TWinControl.GetHandle
 0043FE69    mov         edi,eax
 0043FE6B    call        user32.GetCapture
 0043FE70    cmp         edi,eax
>0043FE72    jne         0043FE93
 0043FE74    cmp         dword ptr ds:[5ACC28],0
>0043FE7B    je          0043FE8F
 0043FE7D    mov         eax,[005ACC28]
 0043FE82    cmp         ebx,dword ptr [eax+30]
>0043FE85    jne         0043FE8F
 0043FE87    mov         ebx,dword ptr ds:[5ACC28]
>0043FE8D    jmp         0043FEB0
 0043FE8F    xor         ebx,ebx
>0043FE91    jmp         0043FEB0
 0043FE93    push        0
 0043FE95    lea         edx,[esp+0C]
 0043FE99    mov         eax,dword ptr [esi+8]
 0043FE9C    call        SmallPointToPoint
 0043FEA1    lea         edx,[esp+0C]
 0043FEA5    xor         ecx,ecx
 0043FEA7    mov         eax,ebx
 0043FEA9    call        TWinControl.ControlAtPos
 0043FEAE    mov         ebx,eax
 0043FEB0    xor         eax,eax
 0043FEB2    test        ebx,ebx
>0043FEB4    je          0043FEE4
 0043FEB6    movsx       eax,word ptr [esi+8]
 0043FEBA    sub         eax,dword ptr [ebx+40]
 0043FEBD    mov         dword ptr [esp],eax
 0043FEC0    movsx       eax,word ptr [esi+0A]
 0043FEC4    sub         eax,dword ptr [ebx+44]
 0043FEC7    mov         dword ptr [esp+4],eax
 0043FECB    mov         eax,esp
 0043FECD    call        PointToSmallPoint
 0043FED2    push        eax
 0043FED3    mov         ecx,dword ptr [esi+4]
 0043FED6    mov         edx,dword ptr [esi]
 0043FED8    mov         eax,ebx
 0043FEDA    call        TControl.Perform
 0043FEDF    mov         dword ptr [esi+0C],eax
 0043FEE2    mov         al,1
 0043FEE4    add         esp,10
 0043FEE7    pop         edi
 0043FEE8    pop         esi
 0043FEE9    pop         ebx
 0043FEEA    ret
*}
end;

//0043FEEC
procedure TWinControl.WndProc(var Message:TMessage);
begin
{*
 0043FEEC    push        ebx
 0043FEED    push        esi
 0043FEEE    push        edi
 0043FEEF    add         esp,0FFFFFFF0
 0043FEF2    mov         esi,edx
 0043FEF4    mov         ebx,eax
 0043FEF6    mov         eax,dword ptr [esi]
 0043FEF8    cmp         eax,84
>0043FEFD    jg          0043FF17
>0043FEFF    je          0043FF71
 0043FF01    sub         eax,7
>0043FF04    je          0043FF38
 0043FF06    dec         eax
>0043FF07    je          0043FF62
 0043FF09    sub         eax,17
>0043FF0C    je          00440007
>0043FF12    jmp         0044003F
 0043FF17    add         eax,0FFFFFF00
 0043FF1C    sub         eax,9
>0043FF1F    jb          0043FFFA
 0043FF25    add         eax,0FFFFFF09
 0043FF2A    sub         eax,0B
>0043FF2D    jb          0043FFC2
>0043FF33    jmp         0044003F
 0043FF38    mov         eax,ebx
 0043FF3A    call        GetParentForm
 0043FF3F    mov         edi,eax
 0043FF41    test        edi,edi
>0043FF43    je          0044003F
 0043FF49    mov         edx,ebx
 0043FF4B    mov         eax,edi
 0043FF4D    mov         ecx,dword ptr [eax]
 0043FF4F    call        dword ptr [ecx+0E8]
 0043FF55    test        al,al
>0043FF57    je          00440048
>0043FF5D    jmp         0044003F
 0043FF62    test        byte ptr [ebx+54],20
>0043FF66    jne         00440048
>0043FF6C    jmp         0044003F
 0043FF71    mov         edx,esi
 0043FF73    mov         eax,ebx
 0043FF75    call        TControl.WndProc
 0043FF7A    cmp         dword ptr [esi+0C],0FFFFFFFF
>0043FF7E    jne         00440048
 0043FF84    push        0
 0043FF86    lea         edx,[esp+0C]
 0043FF8A    mov         eax,dword ptr [esi+8]
 0043FF8D    call        SmallPointToPoint
 0043FF92    lea         edx,[esp+0C]
 0043FF96    lea         ecx,[esp+4]
 0043FF9A    mov         eax,ebx
 0043FF9C    call        TControl.ScreenToClient
 0043FFA1    lea         edx,[esp+4]
 0043FFA5    xor         ecx,ecx
 0043FFA7    mov         eax,ebx
 0043FFA9    call        TWinControl.ControlAtPos
 0043FFAE    test        eax,eax
>0043FFB0    je          00440048
 0043FFB6    mov         dword ptr [esi+0C],1
>0043FFBD    jmp         00440048
 0043FFC2    mov         edx,esi
 0043FFC4    mov         eax,ebx
 0043FFC6    call        TWinControl.IsControlMouseMsg
 0043FFCB    test        al,al
>0043FFCD    je          0044003F
 0043FFCF    cmp         dword ptr [esi+0C],0
>0043FFD3    jne         00440048
 0043FFD5    mov         eax,ebx
 0043FFD7    call        TWinControl.HandleAllocated
 0043FFDC    test        al,al
>0043FFDE    je          00440048
 0043FFE0    mov         eax,dword ptr [esi+8]
 0043FFE3    push        eax
 0043FFE4    mov         eax,dword ptr [esi+4]
 0043FFE7    push        eax
 0043FFE8    mov         eax,dword ptr [esi]
 0043FFEA    push        eax
 0043FFEB    mov         eax,ebx
 0043FFED    call        TWinControl.GetHandle
 0043FFF2    push        eax
 0043FFF3    call        user32.DefWindowProcA
>0043FFF8    jmp         00440048
 0043FFFA    mov         eax,ebx
 0043FFFC    call        TControl.Dragging
 00440001    test        al,al
>00440003    jne         00440048
>00440005    jmp         0044003F
 00440007    mov         eax,ebx
 00440009    call        TWinControl.GetHandle
 0044000E    mov         edi,eax
 00440010    call        user32.GetCapture
 00440015    cmp         edi,eax
>00440017    jne         0044003F
 00440019    cmp         dword ptr ds:[5ACC28],0
>00440020    je          0044003F
 00440022    mov         eax,[005ACC28]
 00440027    cmp         ebx,dword ptr [eax+30]
>0044002A    jne         0044003F
 0044002C    push        0
 0044002E    xor         ecx,ecx
 00440030    mov         edx,1F
 00440035    mov         eax,[005ACC28]
 0044003A    call        TControl.Perform
 0044003F    mov         edx,esi
 00440041    mov         eax,ebx
 00440043    call        TControl.WndProc
 00440048    add         esp,10
 0044004B    pop         edi
 0044004C    pop         esi
 0044004D    pop         ebx
 0044004E    ret
*}
end;

//00440050
procedure TWinControl.DefaultHandler(var Message:void );
begin
{*
 00440050    push        ebx
 00440051    push        esi
 00440052    push        edi
 00440053    push        ebp
 00440054    mov         ebx,edx
 00440056    mov         esi,eax
 00440058    cmp         dword ptr [esi+180],0
>0044005F    je          00440148
 00440065    mov         edi,dword ptr [ebx]
 00440067    cmp         edi,7B
>0044006A    jne         00440090
 0044006C    cmp         dword ptr [esi+30],0
>00440070    je          00440090
 00440072    mov         eax,dword ptr [ebx+8]
 00440075    push        eax
 00440076    mov         ecx,dword ptr [ebx+4]
 00440079    mov         edx,edi
 0044007B    mov         eax,dword ptr [esi+30]
 0044007E    call        TControl.Perform
 00440083    mov         ebp,eax
 00440085    mov         dword ptr [ebx+0C],ebp
 00440088    test        ebp,ebp
>0044008A    jne         00440151
 00440090    mov         edi,dword ptr [ebx]
 00440092    mov         eax,edi
 00440094    add         eax,0FFFFFECE
 00440099    sub         eax,7
>0044009C    jb          004400AA
 0044009E    add         eax,0FFFF4407
 004400A3    sub         eax,7
>004400A6    jb          004400C4
>004400A8    jmp         00440103
 004400AA    mov         ebp,dword ptr [ebx+8]
 004400AD    push        ebp
 004400AE    mov         eax,dword ptr [ebx+4]
 004400B1    push        eax
 004400B2    add         edi,0BC00
 004400B8    push        edi
 004400B9    push        ebp
 004400BA    call        user32.SendMessageA
 004400BF    mov         dword ptr [ebx+0C],eax
>004400C2    jmp         0044012F
 004400C4    mov         eax,dword ptr [esi+68]
 004400C7    mov         eax,dword ptr [eax+18]
 004400CA    call        ColorToRGB
 004400CF    push        eax
 004400D0    mov         eax,dword ptr [ebx+4]
 004400D3    push        eax
 004400D4    call        gdi32.SetTextColor
 004400D9    mov         eax,dword ptr [esi+170]
 004400DF    call        TBrush.GetColor
 004400E4    call        ColorToRGB
 004400E9    push        eax
 004400EA    mov         eax,dword ptr [ebx+4]
 004400ED    push        eax
 004400EE    call        gdi32.SetBkColor
 004400F3    mov         eax,dword ptr [esi+170]
 004400F9    call        TBrush.GetHandle
 004400FE    mov         dword ptr [ebx+0C],eax
>00440101    jmp         0044012F
 00440103    cmp         edi,dword ptr ds:[5E0C24];RM_GetObjectInstance:DWORD
>00440109    jne         00440110
 0044010B    mov         dword ptr [ebx+0C],esi
>0044010E    jmp         0044012F
 00440110    mov         eax,dword ptr [ebx+8]
 00440113    push        eax
 00440114    mov         eax,dword ptr [ebx+4]
 00440117    push        eax
 00440118    push        edi
 00440119    mov         eax,dword ptr [esi+180]
 0044011F    push        eax
 00440120    mov         eax,dword ptr [esi+174]
 00440126    push        eax
 00440127    call        user32.CallWindowProcA
 0044012C    mov         dword ptr [ebx+0C],eax
 0044012F    mov         eax,dword ptr [ebx]
 00440131    cmp         eax,0C
>00440134    jne         00440151
 00440136    mov         edx,dword ptr [ebx+8]
 00440139    push        edx
 0044013A    mov         ecx,dword ptr [ebx+4]
 0044013D    mov         edx,eax
 0044013F    mov         eax,esi
 00440141    call        TControl.SendDockNotification
>00440146    jmp         00440151
 00440148    mov         edx,ebx
 0044014A    mov         eax,esi
 0044014C    call        TControl.DefaultHandler
 00440151    pop         ebp
 00440152    pop         edi
 00440153    pop         esi
 00440154    pop         ebx
 00440155    ret
*}
end;

//00440158
function DoControlMsg(ControlHandle:HWND; var Message:void ):Boolean;
begin
{*
 00440158    push        ebx
 00440159    push        esi
 0044015A    push        edi
 0044015B    mov         esi,edx
 0044015D    xor         ebx,ebx
 0044015F    call        FindControl
 00440164    mov         edi,eax
 00440166    test        edi,edi
>00440168    je          00440185
 0044016A    mov         eax,dword ptr [esi+8]
 0044016D    push        eax
 0044016E    mov         ecx,dword ptr [esi+4]
 00440171    mov         edx,dword ptr [esi]
 00440173    add         edx,0BC00
 00440179    mov         eax,edi
 0044017B    call        TControl.Perform
 00440180    mov         dword ptr [esi+0C],eax
 00440183    mov         bl,1
 00440185    mov         eax,ebx
 00440187    pop         edi
 00440188    pop         esi
 00440189    pop         ebx
 0044018A    ret
*}
end;

//0044018C
procedure TWinControl.PaintHandler(var Message:TWMPaint);
begin
{*
 0044018C    push        ebp
 0044018D    mov         ebp,esp
 0044018F    add         esp,0FFFFFFB0
 00440192    push        ebx
 00440193    push        esi
 00440194    push        edi
 00440195    mov         dword ptr [ebp-8],edx
 00440198    mov         dword ptr [ebp-4],eax
 0044019B    mov         ebx,dword ptr [ebp-8]
 0044019E    mov         ebx,dword ptr [ebx+4]
 004401A1    test        ebx,ebx
>004401A3    jne         004401B9
 004401A5    lea         eax,[ebp-50]
 004401A8    push        eax
 004401A9    mov         eax,dword ptr [ebp-4]
 004401AC    call        TWinControl.GetHandle
 004401B1    push        eax
 004401B2    call        user32.BeginPaint
 004401B7    mov         ebx,eax
 004401B9    xor         edx,edx
 004401BB    push        ebp
 004401BC    push        4402AC
 004401C1    push        dword ptr fs:[edx]
 004401C4    mov         dword ptr fs:[edx],esp
 004401C7    mov         eax,dword ptr [ebp-4]
 004401CA    cmp         dword ptr [eax+198],0
>004401D1    jne         004401E5
 004401D3    mov         edx,ebx
 004401D5    mov         eax,dword ptr [ebp-4]
 004401D8    mov         ecx,dword ptr [eax]
 004401DA    call        dword ptr [ecx+0B8]
>004401E0    jmp         00440277
 004401E5    push        ebx
 004401E6    call        gdi32.SaveDC
 004401EB    mov         dword ptr [ebp-10],eax
 004401EE    mov         dword ptr [ebp-0C],2
 004401F5    mov         eax,dword ptr [ebp-4]
 004401F8    mov         eax,dword ptr [eax+198]
 004401FE    mov         edi,dword ptr [eax+8]
 00440201    dec         edi
 00440202    test        edi,edi
>00440204    jl          0044025A
 00440206    inc         edi
 00440207    xor         esi,esi
 00440209    mov         eax,dword ptr [ebp-4]
 0044020C    mov         eax,dword ptr [eax+198]
 00440212    mov         edx,esi
 00440214    call        TList.Get
 00440219    cmp         byte ptr [eax+57],0
>0044021D    jne         0044022B
 0044021F    test        byte ptr [eax+1C],10
>00440223    je          00440256
 00440225    test        byte ptr [eax+51],4
>00440229    jne         00440256
 0044022B    test        byte ptr [eax+50],40
>0044022F    je          00440256
 00440231    mov         edx,dword ptr [eax+44]
 00440234    add         edx,dword ptr [eax+4C]
 00440237    push        edx
 00440238    mov         edx,dword ptr [eax+40]
 0044023B    add         edx,dword ptr [eax+48]
 0044023E    push        edx
 0044023F    mov         edx,dword ptr [eax+44]
 00440242    push        edx
 00440243    mov         eax,dword ptr [eax+40]
 00440246    push        eax
 00440247    push        ebx
 00440248    call        gdi32.ExcludeClipRect
 0044024D    mov         dword ptr [ebp-0C],eax
 00440250    cmp         dword ptr [ebp-0C],1
>00440254    je          0044025A
 00440256    inc         esi
 00440257    dec         edi
>00440258    jne         00440209
 0044025A    cmp         dword ptr [ebp-0C],1
>0044025E    je          0044026D
 00440260    mov         edx,ebx
 00440262    mov         eax,dword ptr [ebp-4]
 00440265    mov         ecx,dword ptr [eax]
 00440267    call        dword ptr [ecx+0B8]
 0044026D    mov         eax,dword ptr [ebp-10]
 00440270    push        eax
 00440271    push        ebx
 00440272    call        gdi32.RestoreDC
 00440277    xor         ecx,ecx
 00440279    mov         edx,ebx
 0044027B    mov         eax,dword ptr [ebp-4]
 0044027E    call        TWinControl.PaintControls
 00440283    xor         eax,eax
 00440285    pop         edx
 00440286    pop         ecx
 00440287    pop         ecx
 00440288    mov         dword ptr fs:[eax],edx
 0044028B    push        4402B3
 00440290    mov         eax,dword ptr [ebp-8]
 00440293    cmp         dword ptr [eax+4],0
>00440297    jne         004402AB
 00440299    lea         eax,[ebp-50]
 0044029C    push        eax
 0044029D    mov         eax,dword ptr [ebp-4]
 004402A0    call        TWinControl.GetHandle
 004402A5    push        eax
 004402A6    call        user32.EndPaint
 004402AB    ret
>004402AC    jmp         @HandleFinally
>004402B1    jmp         00440290
 004402B3    pop         edi
 004402B4    pop         esi
 004402B5    pop         ebx
 004402B6    mov         esp,ebp
 004402B8    pop         ebp
 004402B9    ret
*}
end;

//004402BC
procedure TWinControl.PaintWindow(DC:HDC);
begin
{*
 004402BC    add         esp,0FFFFFFF0
 004402BF    mov         dword ptr [esp],0F
 004402C6    mov         dword ptr [esp+4],edx
 004402CA    xor         edx,edx
 004402CC    mov         dword ptr [esp+8],edx
 004402D0    xor         edx,edx
 004402D2    mov         dword ptr [esp+0C],edx
 004402D6    mov         edx,esp
 004402D8    mov         ecx,dword ptr [eax]
 004402DA    call        dword ptr [ecx-10]
 004402DD    add         esp,10
 004402E0    ret
*}
end;

//004402E4
procedure TWinControl.PaintControls(DC:HDC; First:TControl);
begin
{*
 004402E4    push        ebx
 004402E5    push        esi
 004402E6    push        edi
 004402E7    push        ebp
 004402E8    add         esp,0FFFFFFE0
 004402EB    mov         ebx,ecx
 004402ED    mov         ebp,edx
 004402EF    mov         esi,eax
 004402F1    cmp         byte ptr [esi+1A8],0
>004402F8    je          00440319
 004402FA    cmp         byte ptr [esi+1A7],0
>00440301    je          00440319
 00440303    cmp         dword ptr [esi+17C],0
>0044030A    je          00440319
 0044030C    mov         eax,dword ptr [esi+17C]
 00440312    mov         edx,ebp
 00440314    mov         ecx,dword ptr [eax]
 00440316    call        dword ptr [ecx+20]
 00440319    mov         eax,dword ptr [esi+198]
 0044031F    test        eax,eax
>00440321    je          00440406
 00440327    xor         edi,edi
 00440329    test        ebx,ebx
>0044032B    je          0044033C
 0044032D    mov         edx,ebx
 0044032F    call        TList.IndexOf
 00440334    mov         edi,eax
 00440336    test        edi,edi
>00440338    jge         0044033C
 0044033A    xor         edi,edi
 0044033C    mov         eax,dword ptr [esi+198]
 00440342    mov         eax,dword ptr [eax+8]
 00440345    mov         dword ptr [esp],eax
 00440348    cmp         edi,dword ptr [esp]
>0044034B    jge         00440406
 00440351    mov         eax,dword ptr [esi+198]
 00440357    mov         edx,edi
 00440359    call        TList.Get
 0044035E    mov         ebx,eax
 00440360    cmp         byte ptr [ebx+57],0
>00440364    jne         0044037A
 00440366    test        byte ptr [ebx+1C],10
>0044036A    je          004403FC
 00440370    test        byte ptr [ebx+51],4
>00440374    jne         004403FC
 0044037A    mov         eax,dword ptr [ebx+44]
 0044037D    add         eax,dword ptr [ebx+4C]
 00440380    push        eax
 00440381    lea         eax,[esp+14]
 00440385    push        eax
 00440386    mov         ecx,dword ptr [ebx+40]
 00440389    add         ecx,dword ptr [ebx+48]
 0044038C    mov         edx,dword ptr [ebx+44]
 0044038F    mov         eax,dword ptr [ebx+40]
 00440392    call        Bounds
 00440397    lea         eax,[esp+10]
 0044039B    push        eax
 0044039C    push        ebp
 0044039D    call        gdi32.RectVisible
 004403A2    test        eax,eax
>004403A4    je          004403FC
 004403A6    test        byte ptr [esi+54],80
>004403AA    je          004403B2
 004403AC    or          word ptr [ebx+54],80
 004403B2    push        ebp
 004403B3    call        gdi32.SaveDC
 004403B8    mov         dword ptr [esp+4],eax
 004403BC    mov         ecx,dword ptr [ebx+44]
 004403BF    mov         edx,dword ptr [ebx+40]
 004403C2    mov         eax,ebp
 004403C4    call        MoveWindowOrg
 004403C9    mov         eax,dword ptr [ebx+4C]
 004403CC    push        eax
 004403CD    mov         eax,dword ptr [ebx+48]
 004403D0    push        eax
 004403D1    push        0
 004403D3    push        0
 004403D5    push        ebp
 004403D6    call        gdi32.IntersectClipRect
 004403DB    push        0
 004403DD    mov         ecx,ebp
 004403DF    mov         edx,0F
 004403E4    mov         eax,ebx
 004403E6    call        TControl.Perform
 004403EB    mov         eax,dword ptr [esp+4]
 004403EF    push        eax
 004403F0    push        ebp
 004403F1    call        gdi32.RestoreDC
 004403F6    and         word ptr [ebx+54],0FF7F
 004403FC    inc         edi
 004403FD    cmp         edi,dword ptr [esp]
>00440400    jl          00440351
 00440406    mov         eax,dword ptr [esi+19C]
 0044040C    test        eax,eax
>0044040E    je          0044050C
 00440414    mov         eax,dword ptr [eax+8]
 00440417    dec         eax
 00440418    test        eax,eax
>0044041A    jl          0044050C
 00440420    inc         eax
 00440421    mov         dword ptr [esp+0C],eax
 00440425    xor         edi,edi
 00440427    mov         eax,dword ptr [esi+19C]
 0044042D    mov         edx,edi
 0044042F    call        TList.Get
 00440434    mov         ebx,eax
 00440436    cmp         byte ptr [ebx+1A5],0
>0044043D    je          00440501
 00440443    test        byte ptr [ebx+50],10
>00440447    je          00440501
 0044044D    cmp         byte ptr [ebx+57],0
>00440451    jne         00440467
 00440453    test        byte ptr [ebx+1C],10
>00440457    je          00440501
 0044045D    test        byte ptr [ebx+51],4
>00440461    jne         00440501
 00440467    mov         eax,0FF000010
 0044046C    call        ColorToRGB
 00440471    push        eax
 00440472    call        gdi32.CreateSolidBrush
 00440477    mov         dword ptr [esp+8],eax
 0044047B    mov         eax,dword ptr [esp+8]
 0044047F    push        eax
 00440480    mov         eax,dword ptr [ebx+44]
 00440483    add         eax,dword ptr [ebx+4C]
 00440486    push        eax
 00440487    lea         eax,[esp+18]
 0044048B    push        eax
 0044048C    mov         ecx,dword ptr [ebx+40]
 0044048F    add         ecx,dword ptr [ebx+48]
 00440492    mov         edx,dword ptr [ebx+44]
 00440495    dec         edx
 00440496    mov         eax,dword ptr [ebx+40]
 00440499    dec         eax
 0044049A    call        Bounds
 0044049F    lea         eax,[esp+14]
 004404A3    push        eax
 004404A4    push        ebp
 004404A5    call        user32.FrameRect
 004404AA    mov         eax,dword ptr [esp+8]
 004404AE    push        eax
 004404AF    call        gdi32.DeleteObject
 004404B4    mov         eax,0FF000014
 004404B9    call        ColorToRGB
 004404BE    push        eax
 004404BF    call        gdi32.CreateSolidBrush
 004404C4    mov         dword ptr [esp+8],eax
 004404C8    mov         eax,dword ptr [esp+8]
 004404CC    push        eax
 004404CD    mov         eax,dword ptr [ebx+44]
 004404D0    add         eax,dword ptr [ebx+4C]
 004404D3    inc         eax
 004404D4    push        eax
 004404D5    lea         eax,[esp+18]
 004404D9    push        eax
 004404DA    mov         ecx,dword ptr [ebx+40]
 004404DD    add         ecx,dword ptr [ebx+48]
 004404E0    inc         ecx
 004404E1    mov         edx,dword ptr [ebx+44]
 004404E4    mov         eax,dword ptr [ebx+40]
 004404E7    call        Bounds
 004404EC    lea         eax,[esp+14]
 004404F0    push        eax
 004404F1    push        ebp
 004404F2    call        user32.FrameRect
 004404F7    mov         eax,dword ptr [esp+8]
 004404FB    push        eax
 004404FC    call        gdi32.DeleteObject
 00440501    inc         edi
 00440502    dec         dword ptr [esp+0C]
>00440506    jne         00440427
 0044050C    add         esp,20
 0044050F    pop         ebp
 00440510    pop         edi
 00440511    pop         esi
 00440512    pop         ebx
 00440513    ret
*}
end;

//00440514
procedure TWinControl.PaintTo(DC:HDC; X:Integer; Y:Integer);
begin
{*
 00440514    push        ebp
 00440515    mov         ebp,esp
 00440517    add         esp,0FFFFFFE0
 0044051A    push        ebx
 0044051B    push        esi
 0044051C    push        edi
 0044051D    mov         edi,ecx
 0044051F    mov         esi,edx
 00440521    mov         ebx,eax
 00440523    or          word ptr [ebx+54],80
 00440529    push        esi
 0044052A    call        gdi32.SaveDC
 0044052F    mov         dword ptr [ebp-0C],eax
 00440532    mov         ecx,dword ptr [ebp+8]
 00440535    mov         edx,edi
 00440537    mov         eax,esi
 00440539    call        MoveWindowOrg
 0044053E    mov         eax,dword ptr [ebx+4C]
 00440541    push        eax
 00440542    mov         eax,dword ptr [ebx+48]
 00440545    push        eax
 00440546    push        0
 00440548    push        0
 0044054A    push        esi
 0044054B    call        gdi32.IntersectClipRect
 00440550    xor         edi,edi
 00440552    xor         eax,eax
 00440554    mov         dword ptr [ebp-8],eax
 00440557    push        0EC
 00440559    mov         eax,ebx
 0044055B    call        TWinControl.GetHandle
 00440560    push        eax
 00440561    call        user32.GetWindowLongA
 00440566    test        ah,2
>00440569    je          00440579
 0044056B    mov         dword ptr [ebp-8],0A
 00440572    mov         edi,200F
>00440577    jmp         0044059B
 00440579    push        0F0
 0044057B    mov         eax,ebx
 0044057D    call        TWinControl.GetHandle
 00440582    push        eax
 00440583    call        user32.GetWindowLongA
 00440588    test        eax,800000
>0044058D    je          0044059B
 0044058F    mov         dword ptr [ebp-8],3
 00440596    mov         edi,0A00F
 0044059B    test        edi,edi
>0044059D    je          004405E8
 0044059F    mov         eax,dword ptr [ebx+4C]
 004405A2    push        eax
 004405A3    mov         eax,dword ptr [ebx+48]
 004405A6    push        eax
 004405A7    push        0
 004405A9    push        0
 004405AB    lea         eax,[ebp-20]
 004405AE    push        eax
 004405AF    call        user32.SetRect
 004405B4    push        edi
 004405B5    mov         eax,dword ptr [ebp-8]
 004405B8    push        eax
 004405B9    lea         eax,[ebp-20]
 004405BC    push        eax
 004405BD    push        esi
 004405BE    call        user32.DrawEdge
 004405C3    mov         ecx,dword ptr [ebp-1C]
 004405C6    mov         edx,dword ptr [ebp-20]
 004405C9    mov         eax,esi
 004405CB    call        MoveWindowOrg
 004405D0    mov         eax,dword ptr [ebp-14]
 004405D3    sub         eax,dword ptr [ebp-1C]
 004405D6    push        eax
 004405D7    mov         eax,dword ptr [ebp-18]
 004405DA    sub         eax,dword ptr [ebp-20]
 004405DD    push        eax
 004405DE    push        0
 004405E0    push        0
 004405E2    push        esi
 004405E3    call        gdi32.IntersectClipRect
 004405E8    push        0
 004405EA    mov         ecx,esi
 004405EC    mov         edx,14
 004405F1    mov         eax,ebx
 004405F3    call        TControl.Perform
 004405F8    push        0
 004405FA    mov         ecx,esi
 004405FC    mov         edx,0F
 00440601    mov         eax,ebx
 00440603    call        TControl.Perform
 00440608    mov         eax,dword ptr [ebx+19C]
 0044060E    test        eax,eax
>00440610    je          0044064F
 00440612    mov         eax,dword ptr [eax+8]
 00440615    dec         eax
 00440616    test        eax,eax
>00440618    jl          0044064F
 0044061A    inc         eax
 0044061B    mov         dword ptr [ebp-10],eax
 0044061E    mov         dword ptr [ebp-4],0
 00440625    mov         edx,dword ptr [ebp-4]
 00440628    mov         eax,dword ptr [ebx+19C]
 0044062E    call        TList.Get
 00440633    cmp         byte ptr [eax+57],0
>00440637    je          00440647
 00440639    mov         edx,dword ptr [eax+44]
 0044063C    push        edx
 0044063D    mov         ecx,dword ptr [eax+40]
 00440640    mov         edx,esi
 00440642    call        TWinControl.PaintTo
 00440647    inc         dword ptr [ebp-4]
 0044064A    dec         dword ptr [ebp-10]
>0044064D    jne         00440625
 0044064F    mov         eax,dword ptr [ebp-0C]
 00440652    push        eax
 00440653    push        esi
 00440654    call        gdi32.RestoreDC
 00440659    and         word ptr [ebx+54],0FF7F
 0044065F    pop         edi
 00440660    pop         esi
 00440661    pop         ebx
 00440662    mov         esp,ebp
 00440664    pop         ebp
 00440665    ret         4
*}
end;

//00440668
procedure TWinControl.WMPaint(var Message:TWMPaint);
begin
{*
 00440668    push        ebp
 00440669    mov         ebp,esp
 0044066B    add         esp,0FFFFFF94
 0044066E    push        ebx
 0044066F    push        esi
 00440670    push        edi
 00440671    mov         esi,edx
 00440673    mov         ebx,eax
 00440675    cmp         byte ptr [ebx+1F8],0
>0044067C    je          00440684
 0044067E    cmp         dword ptr [esi+4],0
>00440682    je          004406B1
 00440684    test        byte ptr [ebx+55],1
>00440688    jne         004406A3
 0044068A    mov         eax,ebx
 0044068C    call        TWinControl.GetControlCount
 00440691    test        eax,eax
>00440693    jne         004406A3
 00440695    mov         edx,esi
 00440697    mov         eax,ebx
 00440699    mov         ecx,dword ptr [eax]
 0044069B    call        dword ptr [ecx-10]
>0044069E    jmp         004407C1
 004406A3    mov         edx,esi
 004406A5    mov         eax,ebx
 004406A7    call        TWinControl.PaintHandler
>004406AC    jmp         004407C1
 004406B1    push        0
 004406B3    call        user32.GetDC
 004406B8    mov         edi,eax
 004406BA    lea         edx,[ebp-5C]
 004406BD    mov         eax,ebx
 004406BF    mov         ecx,dword ptr [eax]
 004406C1    call        dword ptr [ecx+44]
 004406C4    mov         eax,dword ptr [ebp-50]
 004406C7    push        eax
 004406C8    lea         edx,[ebp-6C]
 004406CB    mov         eax,ebx
 004406CD    mov         ecx,dword ptr [eax]
 004406CF    call        dword ptr [ecx+44]
 004406D2    mov         eax,dword ptr [ebp-64]
 004406D5    push        eax
 004406D6    push        edi
 004406D7    call        gdi32.CreateCompatibleBitmap
 004406DC    mov         dword ptr [ebp-8],eax
 004406DF    push        edi
 004406E0    push        0
 004406E2    call        user32.ReleaseDC
 004406E7    push        0
 004406E9    call        gdi32.CreateCompatibleDC
 004406EE    mov         dword ptr [ebp-4],eax
 004406F1    mov         eax,dword ptr [ebp-8]
 004406F4    push        eax
 004406F5    mov         eax,dword ptr [ebp-4]
 004406F8    push        eax
 004406F9    call        gdi32.SelectObject
 004406FE    mov         dword ptr [ebp-0C],eax
 00440701    xor         eax,eax
 00440703    push        ebp
 00440704    push        4407BA
 00440709    push        dword ptr fs:[eax]
 0044070C    mov         dword ptr fs:[eax],esp
 0044070F    lea         eax,[ebp-4C]
 00440712    push        eax
 00440713    mov         eax,ebx
 00440715    call        TWinControl.GetHandle
 0044071A    push        eax
 0044071B    call        user32.BeginPaint
 00440720    mov         edi,eax
 00440722    mov         eax,dword ptr [ebp-4]
 00440725    push        eax
 00440726    mov         ecx,dword ptr [ebp-4]
 00440729    mov         edx,14
 0044072E    mov         eax,ebx
 00440730    call        TControl.Perform
 00440735    mov         eax,dword ptr [ebp-4]
 00440738    mov         dword ptr [esi+4],eax
 0044073B    mov         edx,esi
 0044073D    mov         eax,ebx
 0044073F    call        TWinControl.WMPaint
 00440744    xor         eax,eax
 00440746    mov         dword ptr [esi+4],eax
 00440749    push        0CC0020
 0044074E    push        0
 00440750    push        0
 00440752    mov         eax,dword ptr [ebp-4]
 00440755    push        eax
 00440756    lea         edx,[ebp-5C]
 00440759    mov         eax,ebx
 0044075B    mov         ecx,dword ptr [eax]
 0044075D    call        dword ptr [ecx+44]
 00440760    mov         eax,dword ptr [ebp-50]
 00440763    push        eax
 00440764    lea         edx,[ebp-6C]
 00440767    mov         eax,ebx
 00440769    mov         ecx,dword ptr [eax]
 0044076B    call        dword ptr [ecx+44]
 0044076E    mov         eax,dword ptr [ebp-64]
 00440771    push        eax
 00440772    push        0
 00440774    push        0
 00440776    push        edi
 00440777    call        gdi32.BitBlt
 0044077C    lea         eax,[ebp-4C]
 0044077F    push        eax
 00440780    mov         eax,ebx
 00440782    call        TWinControl.GetHandle
 00440787    push        eax
 00440788    call        user32.EndPaint
 0044078D    xor         eax,eax
 0044078F    pop         edx
 00440790    pop         ecx
 00440791    pop         ecx
 00440792    mov         dword ptr fs:[eax],edx
 00440795    push        4407C1
 0044079A    mov         eax,dword ptr [ebp-0C]
 0044079D    push        eax
 0044079E    mov         eax,dword ptr [ebp-4]
 004407A1    push        eax
 004407A2    call        gdi32.SelectObject
 004407A7    mov         eax,dword ptr [ebp-4]
 004407AA    push        eax
 004407AB    call        gdi32.DeleteDC
 004407B0    mov         eax,dword ptr [ebp-8]
 004407B3    push        eax
 004407B4    call        gdi32.DeleteObject
 004407B9    ret
>004407BA    jmp         @HandleFinally
>004407BF    jmp         0044079A
 004407C1    pop         edi
 004407C2    pop         esi
 004407C3    pop         ebx
 004407C4    mov         esp,ebp
 004407C6    pop         ebp
 004407C7    ret
*}
end;

//004407C8
procedure TWinControl.WMCharToItem(var Message:TWMCharToItem);
begin
{*
 004407C8    push        ebx
 004407C9    push        esi
 004407CA    mov         ebx,edx
 004407CC    mov         esi,eax
 004407CE    mov         edx,ebx
 004407D0    mov         eax,dword ptr [ebx+8]
 004407D3    call        DoControlMsg
 004407D8    test        al,al
>004407DA    jne         004407E5
 004407DC    mov         edx,ebx
 004407DE    mov         eax,esi
 004407E0    mov         ecx,dword ptr [eax]
 004407E2    call        dword ptr [ecx-10]
 004407E5    pop         esi
 004407E6    pop         ebx
 004407E7    ret
*}
end;

//004407E8
procedure TWinControl.WMNotify(var Message:TWMNotify);
begin
{*
 004407E8    push        ebx
 004407E9    push        esi
 004407EA    mov         ebx,edx
 004407EC    mov         esi,eax
 004407EE    mov         edx,ebx
 004407F0    mov         eax,dword ptr [ebx+8]
 004407F3    mov         eax,dword ptr [eax]
 004407F5    call        DoControlMsg
 004407FA    test        al,al
>004407FC    jne         00440807
 004407FE    mov         edx,ebx
 00440800    mov         eax,esi
 00440802    mov         ecx,dword ptr [eax]
 00440804    call        dword ptr [ecx-10]
 00440807    pop         esi
 00440808    pop         ebx
 00440809    ret
*}
end;

//0044080C
procedure TWinControl.WMSysColorChange(var Message:TWMSysColorChange);
begin
{*
 0044080C    push        ebx
 0044080D    mov         ebx,eax
 0044080F    call        PaletteChanged
 00440814    push        0
 00440816    xor         ecx,ecx
 00440818    mov         edx,0B024
 0044081D    mov         eax,ebx
 0044081F    call        TControl.Perform
 00440824    pop         ebx
 00440825    ret
*}
end;

//00440828
procedure TWinControl.WMWinIniChange(var Message:TMessage);
begin
{*
 00440828    mov         ecx,dword ptr [edx+8]
 0044082B    push        ecx
 0044082C    mov         ecx,dword ptr [edx+4]
 0044082F    mov         edx,0B025
 00440834    call        TControl.Perform
 00440839    ret
*}
end;

//0044083C
procedure TWinControl.WMFontChange(var Message:TMessage);
begin
{*
 0044083C    push        0
 0044083E    xor         ecx,ecx
 00440840    mov         edx,0B026
 00440845    call        TControl.Perform
 0044084A    ret
*}
end;

//0044084C
procedure TWinControl.WMTimeChange(var Message:TMessage);
begin
{*
 0044084C    push        0
 0044084E    xor         ecx,ecx
 00440850    mov         edx,0B027
 00440855    call        TControl.Perform
 0044085A    ret
*}
end;

//0044085C
procedure TWinControl.WMCommand(var Message:TWMCommand);
begin
{*
 0044085C    push        ebx
 0044085D    push        esi
 0044085E    mov         ebx,edx
 00440860    mov         esi,eax
 00440862    mov         edx,ebx
 00440864    mov         eax,dword ptr [ebx+8]
 00440867    call        DoControlMsg
 0044086C    test        al,al
>0044086E    jne         00440879
 00440870    mov         edx,ebx
 00440872    mov         eax,esi
 00440874    mov         ecx,dword ptr [eax]
 00440876    call        dword ptr [ecx-10]
 00440879    pop         esi
 0044087A    pop         ebx
 0044087B    ret
*}
end;

//0044087C
procedure TWinControl.WMHScroll(var Message:TWMHScroll);
begin
{*
 0044087C    push        ebx
 0044087D    push        esi
 0044087E    mov         ebx,edx
 00440880    mov         esi,eax
 00440882    mov         edx,ebx
 00440884    mov         eax,dword ptr [ebx+8]
 00440887    call        DoControlMsg
 0044088C    test        al,al
>0044088E    jne         00440899
 00440890    mov         edx,ebx
 00440892    mov         eax,esi
 00440894    mov         ecx,dword ptr [eax]
 00440896    call        dword ptr [ecx-10]
 00440899    pop         esi
 0044089A    pop         ebx
 0044089B    ret
*}
end;

//0044089C
procedure TWinControl.WMCompareItem(var Message:TWMCompareItem);
begin
{*
 0044089C    push        ebx
 0044089D    push        esi
 0044089E    mov         ebx,edx
 004408A0    mov         esi,eax
 004408A2    mov         edx,ebx
 004408A4    mov         eax,dword ptr [ebx+8]
 004408A7    mov         eax,dword ptr [eax+4]
 004408AA    call        DoControlMsg
 004408AF    test        al,al
>004408B1    jne         004408BC
 004408B3    mov         edx,ebx
 004408B5    mov         eax,esi
 004408B7    mov         ecx,dword ptr [eax]
 004408B9    call        dword ptr [ecx-10]
 004408BC    pop         esi
 004408BD    pop         ebx
 004408BE    ret
*}
end;

//004408C0
procedure TWinControl.WMDeleteItem(var Message:TWMDeleteItem);
begin
{*
 004408C0    push        ebx
 004408C1    push        esi
 004408C2    mov         ebx,edx
 004408C4    mov         esi,eax
 004408C6    mov         edx,ebx
 004408C8    mov         eax,dword ptr [ebx+8]
 004408CB    mov         eax,dword ptr [eax+4]
 004408CE    call        DoControlMsg
 004408D3    test        al,al
>004408D5    jne         004408E0
 004408D7    mov         edx,ebx
 004408D9    mov         eax,esi
 004408DB    mov         ecx,dword ptr [eax]
 004408DD    call        dword ptr [ecx-10]
 004408E0    pop         esi
 004408E1    pop         ebx
 004408E2    ret
*}
end;

//004408E4
procedure TWinControl.WMDrawItem(var Message:TWMDrawItem);
begin
{*
 004408E4    push        ebx
 004408E5    push        esi
 004408E6    mov         ebx,edx
 004408E8    mov         esi,eax
 004408EA    mov         edx,ebx
 004408EC    mov         eax,dword ptr [ebx+8]
 004408EF    mov         eax,dword ptr [eax+4]
 004408F2    call        DoControlMsg
 004408F7    test        al,al
>004408F9    jne         00440904
 004408FB    mov         edx,ebx
 004408FD    mov         eax,esi
 004408FF    mov         ecx,dword ptr [eax]
 00440901    call        dword ptr [ecx-10]
 00440904    pop         esi
 00440905    pop         ebx
 00440906    ret
*}
end;

//00440908
procedure TWinControl.WMMeasureItem(var Message:TWMMeasureItem);
begin
{*
 00440908    push        ebx
 00440909    push        esi
 0044090A    mov         ebx,edx
 0044090C    mov         esi,eax
 0044090E    mov         edx,ebx
 00440910    mov         eax,dword ptr [ebx+8]
 00440913    mov         eax,dword ptr [eax+4]
 00440916    call        DoControlMsg
 0044091B    test        al,al
>0044091D    jne         00440928
 0044091F    mov         edx,ebx
 00440921    mov         eax,esi
 00440923    mov         ecx,dword ptr [eax]
 00440925    call        dword ptr [ecx-10]
 00440928    pop         esi
 00440929    pop         ebx
 0044092A    ret
*}
end;

//0044092C
procedure TWinControl.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 0044092C    push        ebx
 0044092D    push        esi
 0044092E    push        edi
 0044092F    add         esp,0FFFFFFF0
 00440932    mov         esi,edx
 00440934    mov         ebx,eax
 00440936    call        ThemeServices
 0044093B    mov         edi,eax
 0044093D    mov         eax,edi
 0044093F    call        TThemeServices.GetThemesEnabled
 00440944    test        al,al
>00440946    je          0044096F
 00440948    cmp         dword ptr [ebx+30],0
>0044094C    je          0044096F
 0044094E    test        byte ptr [ebx+52],4
>00440952    je          0044096F
 00440954    push        0
 00440956    push        0
 00440958    push        0
 0044095A    mov         eax,ebx
 0044095C    call        TWinControl.GetHandle
 00440961    mov         edx,eax
 00440963    mov         ecx,dword ptr [esi+4]
 00440966    mov         eax,edi
 00440968    call        TThemeServices.DrawParentBackground
>0044096D    jmp         004409A5
 0044096F    cmp         byte ptr [ebx+1F8],0
>00440976    je          00440980
 00440978    mov         eax,dword ptr [esi+4]
 0044097B    cmp         eax,dword ptr [esi+8]
>0044097E    jne         004409A5
 00440980    mov         eax,dword ptr [ebx+170]
 00440986    call        TBrush.GetHandle
 0044098B    push        eax
 0044098C    lea         edx,[esp+4]
 00440990    mov         eax,ebx
 00440992    mov         ecx,dword ptr [eax]
 00440994    call        dword ptr [ecx+44]
 00440997    lea         eax,[esp+4]
 0044099B    push        eax
 0044099C    mov         eax,dword ptr [esi+4]
 0044099F    push        eax
 004409A0    call        user32.FillRect
 004409A5    mov         dword ptr [esi+0C],1
 004409AC    add         esp,10
 004409AF    pop         edi
 004409B0    pop         esi
 004409B1    pop         ebx
 004409B2    ret
*}
end;

//004409B4
procedure TWinControl.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
{*
 004409B4    push        ebx
 004409B5    push        esi
 004409B6    push        edi
 004409B7    push        ecx
 004409B8    mov         esi,edx
 004409BA    mov         edi,eax
 004409BC    cmp         byte ptr [edi+1A5],0
>004409C3    je          004409DA
 004409C5    test        byte ptr [edi+50],10
>004409C9    je          004409DA
 004409CB    cmp         dword ptr [edi+30],0
>004409CF    je          004409DA
 004409D1    mov         eax,dword ptr [esi+8]
 004409D4    test        byte ptr [eax+18],8
>004409D8    je          004409DE
 004409DA    xor         ebx,ebx
>004409DC    jmp         004409E0
 004409DE    mov         bl,1
 004409E0    mov         eax,dword ptr [esi+8]
 004409E3    test        byte ptr [eax+18],2
>004409E7    jne         004409F9
 004409E9    mov         eax,dword ptr [edi+180]
 004409EF    push        eax
 004409F0    call        user32.IsWindowVisible
 004409F5    test        eax,eax
>004409F7    jne         004409FD
 004409F9    xor         eax,eax
>004409FB    jmp         004409FF
 004409FD    mov         al,1
 004409FF    mov         byte ptr [esp],al
 00440A02    mov         eax,dword ptr [esi+8]
 00440A05    test        byte ptr [eax+18],1
>00440A09    jne         00440A1B
 00440A0B    mov         eax,dword ptr [edi+180]
 00440A11    push        eax
 00440A12    call        user32.IsWindowVisible
 00440A17    test        eax,eax
>00440A19    jne         00440A1F
 00440A1B    xor         eax,eax
>00440A1D    jmp         00440A21
 00440A1F    mov         al,1
 00440A21    mov         byte ptr [esp+1],al
 00440A25    test        bl,bl
>00440A27    je          00440A39
 00440A29    mov         al,byte ptr [esp]
 00440A2C    or          al,byte ptr [esp+1]
>00440A30    je          00440A39
 00440A32    mov         eax,edi
 00440A34    call        TWinControl.InvalidateFrame
 00440A39    test        byte ptr [edi+55],2
>00440A3D    jne         00440A46
 00440A3F    mov         eax,edi
 00440A41    call        TWinControl.UpdateBounds
 00440A46    mov         edx,esi
 00440A48    mov         eax,edi
 00440A4A    call        TControl.WMWindowPosChanged
 00440A4F    test        bl,bl
>00440A51    je          00440A6C
 00440A53    mov         al,byte ptr [esp]
 00440A56    or          al,byte ptr [esp+1]
>00440A5A    jne         00440A65
 00440A5C    mov         eax,dword ptr [esi+8]
 00440A5F    test        byte ptr [eax+18],0C0
>00440A63    je          00440A6C
 00440A65    mov         eax,edi
 00440A67    call        TWinControl.InvalidateFrame
 00440A6C    pop         edx
 00440A6D    pop         edi
 00440A6E    pop         esi
 00440A6F    pop         ebx
 00440A70    ret
*}
end;

//00440A74
procedure TWinControl.WMWindowPosChanging(var Message:TWMWindowPosChanging);
begin
{*
 00440A74    push        ebx
 00440A75    push        esi
 00440A76    push        edi
 00440A77    mov         edi,edx
 00440A79    mov         ebx,eax
 00440A7B    mov         ax,[00440ABC]
 00440A81    and         ax,word ptr [ebx+1C]
 00440A85    mov         dx,word ptr ds:[440AC0]
 00440A8C    cmp         dx,ax
>00440A8F    jne         00440AAF
 00440A91    mov         esi,dword ptr [edi+8]
 00440A94    test        byte ptr [esi+18],1
>00440A98    jne         00440AAF
 00440A9A    lea         ecx,[esi+14]
 00440A9D    lea         edx,[esi+10]
 00440AA0    mov         eax,ebx
 00440AA2    call        TControl.CheckNewSize
 00440AA7    test        al,al
>00440AA9    jne         00440AAF
 00440AAB    or          dword ptr [esi+18],1
 00440AAF    mov         edx,edi
 00440AB1    mov         eax,ebx
 00440AB3    mov         ecx,dword ptr [eax]
 00440AB5    call        dword ptr [ecx-10]
 00440AB8    pop         edi
 00440AB9    pop         esi
 00440ABA    pop         ebx
 00440ABB    ret
*}
end;

//00440AC4
procedure TWinControl.WMSize(var Message:TWMSize);
begin
{*
 00440AC4    push        ebx
 00440AC5    push        esi
 00440AC6    mov         esi,edx
 00440AC8    mov         ebx,eax
 00440ACA    mov         eax,ebx
 00440ACC    call        TWinControl.UpdateBounds
 00440AD1    mov         edx,esi
 00440AD3    mov         eax,ebx
 00440AD5    mov         ecx,dword ptr [eax]
 00440AD7    call        dword ptr [ecx-10]
 00440ADA    mov         eax,ebx
 00440ADC    call        TWinControl.Realign
 00440AE1    test        byte ptr [ebx+1C],1
>00440AE5    jne         00440AF2
 00440AE7    mov         eax,ebx
 00440AE9    mov         si,0FFCF
 00440AED    call        @CallDynaInst
 00440AF2    pop         esi
 00440AF3    pop         ebx
 00440AF4    ret
*}
end;

//00440AF8
procedure TWinControl.WMMove(var Message:TWMMove);
begin
{*
 00440AF8    push        esi
 00440AF9    mov         esi,eax
 00440AFB    mov         eax,esi
 00440AFD    mov         ecx,dword ptr [eax]
 00440AFF    call        dword ptr [ecx-10]
 00440B02    mov         eax,esi
 00440B04    call        TWinControl.UpdateBounds
 00440B09    pop         esi
 00440B0A    ret
*}
end;

//00440B0C
procedure TWinControl.WMSetCursor(var Message:TWMSetCursor);
begin
{*
 00440B0C    push        ebx
 00440B0D    push        esi
 00440B0E    push        edi
 00440B0F    add         esp,0FFFFFFF0
 00440B12    mov         esi,edx
 00440B14    mov         ebx,eax
 00440B16    mov         eax,dword ptr [esi+4]
 00440B19    cmp         eax,dword ptr [ebx+180]
>00440B1F    jne         00440BFB
 00440B25    mov         ax,word ptr [esi+8]
 00440B29    sub         ax,0FFFFFFFE
>00440B2D    je          00440BBD
 00440B33    sub         ax,3
>00440B37    jne         00440BFB
 00440B3D    mov         eax,[005AE7DC];^Screen:TScreen
 00440B42    mov         eax,dword ptr [eax]
 00440B44    mov         di,word ptr [eax+44]
 00440B48    test        di,di
>00440B4B    jne         00440B9A
 00440B4D    push        esp
 00440B4E    call        user32.GetCursorPos
 00440B53    push        0
 00440B55    lea         ecx,[esp+0C]
 00440B59    lea         edx,[esp+4]
 00440B5D    mov         eax,ebx
 00440B5F    call        TControl.ScreenToClient
 00440B64    lea         edx,[esp+0C]
 00440B68    xor         ecx,ecx
 00440B6A    mov         eax,ebx
 00440B6C    call        TWinControl.ControlAtPos
 00440B71    test        eax,eax
>00440B73    je          00440B85
 00440B75    test        byte ptr [eax+1C],10
>00440B79    je          00440B81
 00440B7B    mov         di,0FFFE
>00440B7F    jmp         00440B85
 00440B81    mov         di,word ptr [eax+78]
 00440B85    test        di,di
>00440B88    jne         00440B9A
 00440B8A    test        byte ptr [ebx+1C],10
>00440B8E    je          00440B96
 00440B90    mov         di,0FFFE
>00440B94    jmp         00440B9A
 00440B96    mov         di,word ptr [ebx+78]
 00440B9A    test        di,di
>00440B9D    je          00440BFB
 00440B9F    movsx       edx,di
 00440BA2    mov         eax,[005AE7DC];^Screen:TScreen
 00440BA7    mov         eax,dword ptr [eax]
 00440BA9    call        TScreen.GetCursors
 00440BAE    push        eax
 00440BAF    call        user32.SetCursor
 00440BB4    mov         dword ptr [esi+0C],1
>00440BBB    jmp         00440C04
 00440BBD    cmp         word ptr [esi+0A],201
>00440BC3    jne         00440BFB
 00440BC5    mov         eax,[005AE584];^Application:TApplication
 00440BCA    mov         eax,dword ptr [eax]
 00440BCC    cmp         dword ptr [eax+30],0
>00440BD0    je          00440BFB
 00440BD2    mov         eax,[005AE584];^Application:TApplication
 00440BD7    mov         eax,dword ptr [eax]
 00440BD9    mov         eax,dword ptr [eax+30]
 00440BDC    push        eax
 00440BDD    call        user32.GetLastActivePopup
 00440BE2    mov         edi,eax
 00440BE4    call        user32.GetForegroundWindow
 00440BE9    cmp         edi,eax
>00440BEB    je          00440BFB
 00440BED    mov         eax,[005AE584];^Application:TApplication
 00440BF2    mov         eax,dword ptr [eax]
 00440BF4    call        TApplication.BringToFront
>00440BF9    jmp         00440C04
 00440BFB    mov         edx,esi
 00440BFD    mov         eax,ebx
 00440BFF    mov         ecx,dword ptr [eax]
 00440C01    call        dword ptr [ecx-10]
 00440C04    add         esp,10
 00440C07    pop         edi
 00440C08    pop         esi
 00440C09    pop         ebx
 00440C0A    ret
*}
end;

//00440C0C
procedure TWinControl.WMKillFocus(var Message:TWMSetFocus);
begin
{*
 00440C0C    push        esi
 00440C0D    mov         esi,eax
 00440C0F    mov         eax,esi
 00440C11    mov         ecx,dword ptr [eax]
 00440C13    call        dword ptr [ecx-10]
 00440C16    mov         eax,esi
 00440C18    call        TWinControl.ResetIme
 00440C1D    pop         esi
 00440C1E    ret
*}
end;

//00440C20
procedure TWinControl.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 00440C20    push        esi
 00440C21    mov         esi,eax
 00440C23    mov         eax,esi
 00440C25    mov         ecx,dword ptr [eax]
 00440C27    call        dword ptr [ecx-10]
 00440C2A    mov         eax,esi
 00440C2C    call        TWinControl.SetIme
 00440C31    pop         esi
 00440C32    ret
*}
end;

//00440C34
procedure TWinControl.WMIMEStartComp(var Message:TMessage);
begin
{*
 00440C34    push        esi
 00440C35    mov         esi,eax
 00440C37    mov         byte ptr [esi+1F9],1
 00440C3E    mov         eax,esi
 00440C40    mov         ecx,dword ptr [eax]
 00440C42    call        dword ptr [ecx-10]
 00440C45    pop         esi
 00440C46    ret
*}
end;

//00440C48
procedure TWinControl.WMIMEEndComp(var Message:TMessage);
begin
{*
 00440C48    push        esi
 00440C49    mov         esi,eax
 00440C4B    mov         byte ptr [esi+1F9],0
 00440C52    mov         eax,esi
 00440C54    mov         ecx,dword ptr [eax]
 00440C56    call        dword ptr [ecx-10]
 00440C59    pop         esi
 00440C5A    ret
*}
end;

//00440C5C
procedure TWinControl.ResetIme;
begin
{*
 00440C5C    push        ebp
 00440C5D    mov         ebp,esp
 00440C5F    push        0
 00440C61    push        ebx
 00440C62    push        esi
 00440C63    push        edi
 00440C64    mov         ebx,eax
 00440C66    xor         eax,eax
 00440C68    push        ebp
 00440C69    push        440D3B
 00440C6E    push        dword ptr fs:[eax]
 00440C71    mov         dword ptr fs:[eax],esp
 00440C74    mov         eax,[005AE810];^SysLocale:TSysLocale
 00440C79    cmp         byte ptr [eax+0C],0
>00440C7D    je          00440D25
 00440C83    cmp         dword ptr [ebx+188],0
>00440C8A    je          00440D13
 00440C90    lea         edx,[ebp-4]
 00440C93    mov         eax,[005AE7DC];^Screen:TScreen
 00440C98    mov         eax,dword ptr [eax]
 00440C9A    call        TScreen.GetDefaultIME
 00440C9F    mov         edx,dword ptr [ebp-4]
 00440CA2    mov         eax,dword ptr [ebx+188]
 00440CA8    call        AnsiCompareText
 00440CAD    test        eax,eax
>00440CAF    je          00440D13
 00440CB1    mov         eax,[005AE7DC];^Screen:TScreen
 00440CB6    mov         eax,dword ptr [eax]
 00440CB8    call        TScreen.GetImes
 00440CBD    mov         edx,dword ptr [eax]
 00440CBF    call        dword ptr [edx+14]
 00440CC2    test        eax,eax
>00440CC4    je          00440D13
 00440CC6    mov         eax,[005AE7DC];^Screen:TScreen
 00440CCB    mov         eax,dword ptr [eax]
 00440CCD    mov         esi,dword ptr [eax+3C]
 00440CD0    cmp         byte ptr [ebx+184],0
>00440CD7    je          00440D0B
 00440CD9    mov         eax,[005AE7DC];^Screen:TScreen
 00440CDE    mov         eax,dword ptr [eax]
 00440CE0    call        TScreen.GetImes
 00440CE5    mov         edx,dword ptr [ebx+188]
 00440CEB    mov         ecx,dword ptr [eax]
 00440CED    call        dword ptr [ecx+54]
 00440CF0    mov         edi,eax
 00440CF2    test        edi,edi
>00440CF4    jl          00440D0B
 00440CF6    mov         eax,[005AE7DC];^Screen:TScreen
 00440CFB    mov         eax,dword ptr [eax]
 00440CFD    call        TScreen.GetImes
 00440D02    mov         edx,edi
 00440D04    mov         ecx,dword ptr [eax]
 00440D06    call        dword ptr [ecx+18]
 00440D09    mov         esi,eax
 00440D0B    push        1
 00440D0D    push        esi
 00440D0E    call        user32.ActivateKeyboardLayout
 00440D13    mov         eax,ebx
 00440D15    call        TWinControl.GetHandle
 00440D1A    mov         dl,byte ptr [ebx+184]
 00440D20    call        SetImeMode
 00440D25    xor         eax,eax
 00440D27    pop         edx
 00440D28    pop         ecx
 00440D29    pop         ecx
 00440D2A    mov         dword ptr fs:[eax],edx
 00440D2D    push        440D42
 00440D32    lea         eax,[ebp-4]
 00440D35    call        @LStrClr
 00440D3A    ret
>00440D3B    jmp         @HandleFinally
>00440D40    jmp         00440D32
 00440D42    pop         edi
 00440D43    pop         esi
 00440D44    pop         ebx
 00440D45    pop         ecx
 00440D46    pop         ebp
 00440D47    ret
*}
end;

//00440D48
procedure TWinControl.SetIme;
begin
{*
 00440D48    push        ebp
 00440D49    mov         ebp,esp
 00440D4B    push        0
 00440D4D    push        ebx
 00440D4E    mov         ebx,eax
 00440D50    xor         eax,eax
 00440D52    push        ebp
 00440D53    push        440DD2
 00440D58    push        dword ptr fs:[eax]
 00440D5B    mov         dword ptr fs:[eax],esp
 00440D5E    mov         eax,[005AE810];^SysLocale:TSysLocale
 00440D63    cmp         byte ptr [eax+0C],0
>00440D67    je          00440DBC
 00440D69    cmp         dword ptr [ebx+188],0
>00440D70    je          00440DA5
 00440D72    lea         edx,[ebp-4]
 00440D75    mov         eax,[005AE7DC];^Screen:TScreen
 00440D7A    mov         eax,dword ptr [eax]
 00440D7C    call        TScreen.GetDefaultIME
 00440D81    mov         edx,dword ptr [ebp-4]
 00440D84    mov         eax,dword ptr [ebx+188]
 00440D8A    call        AnsiCompareText
 00440D8F    test        eax,eax
>00440D91    je          00440DA5
 00440D93    push        1
 00440D95    mov         eax,[005AE7DC];^Screen:TScreen
 00440D9A    mov         eax,dword ptr [eax]
 00440D9C    mov         eax,dword ptr [eax+3C]
 00440D9F    push        eax
 00440DA0    call        user32.ActivateKeyboardLayout
 00440DA5    cmp         byte ptr [ebx+184],0
>00440DAC    jne         00440DBC
 00440DAE    mov         eax,ebx
 00440DB0    call        TWinControl.GetHandle
 00440DB5    mov         dl,1
 00440DB7    call        Win32NLSEnableIME
 00440DBC    xor         eax,eax
 00440DBE    pop         edx
 00440DBF    pop         ecx
 00440DC0    pop         ecx
 00440DC1    mov         dword ptr fs:[eax],edx
 00440DC4    push        440DD9
 00440DC9    lea         eax,[ebp-4]
 00440DCC    call        @LStrClr
 00440DD1    ret
>00440DD2    jmp         @HandleFinally
>00440DD7    jmp         00440DC9
 00440DD9    pop         ebx
 00440DDA    pop         ecx
 00440DDB    pop         ebp
 00440DDC    ret
*}
end;

//00440DE0
procedure TWinControl.DoAddDockClient(Client:TControl; const ARect:TRect);
begin
{*
 00440DE0    push        esi
 00440DE1    mov         esi,edx
 00440DE3    mov         edx,eax
 00440DE5    mov         eax,esi
 00440DE7    mov         ecx,dword ptr [eax]
 00440DE9    call        dword ptr [ecx+68]
 00440DEC    pop         esi
 00440DED    ret
*}
end;

//00440DF0
procedure TWinControl.DoRemoveDockClient(Client:TControl);
begin
{*
 00440DF0    ret
*}
end;

//00440DF4
procedure TWinControl.DoEnter;
begin
{*
 00440DF4    push        ebx
 00440DF5    cmp         word ptr [eax+1C2],0
>00440DFD    je          00440E0F
 00440DFF    mov         ebx,eax
 00440E01    mov         edx,eax
 00440E03    mov         eax,dword ptr [ebx+1C4]
 00440E09    call        dword ptr [ebx+1C0]
 00440E0F    pop         ebx
 00440E10    ret
*}
end;

//00440E14
procedure TWinControl.DoExit;
begin
{*
 00440E14    push        ebx
 00440E15    cmp         word ptr [eax+1CA],0
>00440E1D    je          00440E2F
 00440E1F    mov         ebx,eax
 00440E21    mov         edx,eax
 00440E23    mov         eax,dword ptr [ebx+1CC]
 00440E29    call        dword ptr [ebx+1C8]
 00440E2F    pop         ebx
 00440E30    ret
*}
end;

//00440E34
procedure TWinControl.DockDrop(Source:TDragDockObject; X:Integer; Y:Integer);
begin
{*
 00440E34    push        ebp
 00440E35    mov         ebp,esp
 00440E37    push        ebx
 00440E38    push        esi
 00440E39    push        edi
 00440E3A    mov         edi,ecx
 00440E3C    mov         esi,edx
 00440E3E    mov         ebx,eax
 00440E40    mov         dx,word ptr [ebp+8]
 00440E44    mov         eax,edi
 00440E46    call        SmallPoint
 00440E4B    push        eax
 00440E4C    mov         ecx,esi
 00440E4E    mov         edx,0B038
 00440E53    mov         eax,ebx
 00440E55    call        TControl.Perform
 00440E5A    test        eax,eax
>00440E5C    jl          00440E7D
 00440E5E    cmp         word ptr [ebx+1B2],0
>00440E66    je          00440E7D
 00440E68    push        edi
 00440E69    mov         eax,dword ptr [ebp+8]
 00440E6C    push        eax
 00440E6D    mov         ecx,esi
 00440E6F    mov         edx,ebx
 00440E71    mov         eax,dword ptr [ebx+1B4]
 00440E77    call        dword ptr [ebx+1B0]
 00440E7D    pop         edi
 00440E7E    pop         esi
 00440E7F    pop         ebx
 00440E80    pop         ebp
 00440E81    ret         4
*}
end;

//00440E84
procedure TWinControl.DoDockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 00440E84    push        ebp
 00440E85    mov         ebp,esp
 00440E87    push        ebx
 00440E88    cmp         word ptr [eax+1BA],0
>00440E90    je          00440EB1
 00440E92    push        ecx
 00440E93    mov         ecx,dword ptr [ebp+10]
 00440E96    push        ecx
 00440E97    mov         cl,byte ptr [ebp+0C]
 00440E9A    push        ecx
 00440E9B    mov         ecx,dword ptr [ebp+8]
 00440E9E    push        ecx
 00440E9F    mov         ebx,eax
 00440EA1    mov         ecx,edx
 00440EA3    mov         edx,eax
 00440EA5    mov         eax,dword ptr [ebx+1BC]
 00440EAB    call        dword ptr [ebx+1B8]
 00440EB1    pop         ebx
 00440EB2    pop         ebp
 00440EB3    ret         0C
*}
end;

//00440EB8
procedure TWinControl.DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 00440EB8    push        ebp
 00440EB9    mov         ebp,esp
 00440EBB    push        ecx
 00440EBC    push        ebx
 00440EBD    push        esi
 00440EBE    push        edi
 00440EBF    mov         dword ptr [ebp-4],ecx
 00440EC2    mov         edi,edx
 00440EC4    mov         ebx,eax
 00440EC6    mov         edx,edi
 00440EC8    mov         eax,ebx
 00440ECA    mov         si,0FFD2
 00440ECE    call        @CallDynaInst
 00440ED3    mov         eax,dword ptr [ebp+10]
 00440ED6    push        eax
 00440ED7    mov         al,byte ptr [ebp+0C]
 00440EDA    push        eax
 00440EDB    mov         eax,dword ptr [ebp+8]
 00440EDE    push        eax
 00440EDF    mov         ecx,dword ptr [ebp-4]
 00440EE2    mov         edx,edi
 00440EE4    mov         eax,ebx
 00440EE6    mov         si,0FFC3
 00440EEA    call        @CallDynaInst
 00440EEF    pop         edi
 00440EF0    pop         esi
 00440EF1    pop         ebx
 00440EF2    pop         ecx
 00440EF3    pop         ebp
 00440EF4    ret         0C
*}
end;

//00440EF8
procedure TWinControl.DoUnDock(NewTarget:TWinControl; Client:TControl);
begin
{*
 00440EF8    push        ebx
 00440EF9    push        esi
 00440EFA    push        edi
 00440EFB    push        ecx
 00440EFC    mov         edi,ecx
 00440EFE    mov         esi,edx
 00440F00    mov         ebx,eax
 00440F02    mov         byte ptr [esp],1
 00440F06    cmp         word ptr [ebx+1F2],0
>00440F0E    je          00440F26
 00440F10    push        esi
 00440F11    lea         eax,[esp+4]
 00440F15    push        eax
 00440F16    mov         ecx,edi
 00440F18    mov         edx,ebx
 00440F1A    mov         eax,dword ptr [ebx+1F4]
 00440F20    call        dword ptr [ebx+1F0]
 00440F26    cmp         byte ptr [esp],0
>00440F2A    je          00440F3F
 00440F2C    push        edi
 00440F2D    mov         ecx,esi
 00440F2F    mov         edx,0B039
 00440F34    mov         eax,ebx
 00440F36    call        TControl.Perform
 00440F3B    test        eax,eax
>00440F3D    je          00440F43
 00440F3F    xor         eax,eax
>00440F41    jmp         00440F45
 00440F43    mov         al,1
 00440F45    mov         byte ptr [esp],al
 00440F48    mov         al,byte ptr [esp]
 00440F4B    pop         edx
 00440F4C    pop         edi
 00440F4D    pop         esi
 00440F4E    pop         ebx
 00440F4F    ret
*}
end;

//00440F50
procedure TWinControl.ReloadDockedControl(const AControlName:AnsiString; var AControl:TControl);
begin
{*
 00440F50    push        ebx
 00440F51    push        esi
 00440F52    push        edi
 00440F53    mov         edi,ecx
 00440F55    mov         esi,edx
 00440F57    mov         ebx,eax
 00440F59    mov         edx,esi
 00440F5B    mov         eax,dword ptr [ebx+4]
 00440F5E    call        TComponent.FindComponent
 00440F63    mov         edx,dword ptr ds:[437BA4];TControl
 00440F69    call        @AsClass
 00440F6E    mov         dword ptr [edi],eax
 00440F70    pop         edi
 00440F71    pop         esi
 00440F72    pop         ebx
 00440F73    ret
*}
end;

//00440F74
function TWinControl.GetDockClientCount:Integer;
begin
{*
 00440F74    mov         edx,dword ptr [eax+178]
 00440F7A    test        edx,edx
>00440F7C    je          00440F82
 00440F7E    mov         eax,dword ptr [edx+8]
 00440F81    ret
 00440F82    xor         eax,eax
 00440F84    ret
*}
end;

//00440F88
function TWinControl.GetDockClients(Index:Integer):TControl;
begin
{*
 00440F88    push        ebx
 00440F89    push        esi
 00440F8A    push        edi
 00440F8B    mov         edi,edx
 00440F8D    mov         ebx,eax
 00440F8F    mov         esi,dword ptr [ebx+178]
 00440F95    test        esi,esi
>00440F97    je          00440FA4
 00440F99    mov         edx,edi
 00440F9B    mov         eax,esi
 00440F9D    call        TList.Get
>00440FA2    jmp         00440FA6
 00440FA4    xor         eax,eax
 00440FA6    pop         edi
 00440FA7    pop         esi
 00440FA8    pop         ebx
 00440FA9    ret
*}
end;

//00440FAC
procedure TWinControl.GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);
begin
{*
 00440FAC    push        ebp
 00440FAD    mov         ebp,esp
 00440FAF    add         esp,0FFFFFFF8
 00440FB2    push        ebx
 00440FB3    push        esi
 00440FB4    push        edi
 00440FB5    mov         esi,dword ptr [ebp+0C]
 00440FB8    lea         edi,[ebp-8]
 00440FBB    movs        dword ptr [edi],dword ptr [esi]
 00440FBC    movs        dword ptr [edi],dword ptr [esi]
 00440FBD    mov         esi,ecx
 00440FBF    mov         edi,edx
 00440FC1    mov         ebx,eax
 00440FC3    push        esi
 00440FC4    mov         eax,ebx
 00440FC6    call        TWinControl.GetHandle
 00440FCB    push        eax
 00440FCC    call        user32.GetWindowRect
 00440FD1    push        0A
 00440FD3    push        0A
 00440FD5    push        esi
 00440FD6    call        user32.InflateRect
 00440FDB    cmp         word ptr [ebx+1D2],0
>00440FE3    je          00440FFE
 00440FE5    push        esi
 00440FE6    lea         eax,[ebp-8]
 00440FE9    push        eax
 00440FEA    mov         eax,dword ptr [ebp+8]
 00440FED    push        eax
 00440FEE    mov         ecx,edi
 00440FF0    mov         edx,ebx
 00440FF2    mov         eax,dword ptr [ebx+1D4]
 00440FF8    call        dword ptr [ebx+1D0]
 00440FFE    pop         edi
 00440FFF    pop         esi
 00441000    pop         ebx
 00441001    pop         ecx
 00441002    pop         ecx
 00441003    pop         ebp
 00441004    ret         8
*}
end;

//00441008
function TWinControl.GetVisibleDockClientCount:Integer;
begin
{*
 00441008    push        ebx
 00441009    push        esi
 0044100A    push        edi
 0044100B    mov         esi,eax
 0044100D    mov         eax,esi
 0044100F    call        TWinControl.GetDockClientCount
 00441014    mov         edi,eax
 00441016    test        edi,edi
>00441018    jle         0044103C
 0044101A    mov         ebx,edi
 0044101C    dec         ebx
 0044101D    cmp         ebx,0
>00441020    jl          0044103C
 00441022    mov         edx,ebx
 00441024    mov         eax,dword ptr [esi+178]
 0044102A    call        TList.Get
 0044102F    cmp         byte ptr [eax+57],0
>00441033    jne         00441036
 00441035    dec         edi
 00441036    dec         ebx
 00441037    cmp         ebx,0FFFFFFFF
>0044103A    jne         00441022
 0044103C    mov         eax,edi
 0044103E    pop         edi
 0044103F    pop         esi
 00441040    pop         ebx
 00441041    ret
*}
end;

//00441044
procedure TWinControl.sub_00441044;
begin
{*
 00441044    ret
*}
end;

//00441048
procedure TWinControl.CreateDockManager;
begin
{*
 00441048    push        ebx
 00441049    push        esi
 0044104A    mov         esi,edx
 0044104C    mov         ebx,eax
 0044104E    cmp         dword ptr [ebx+17C],0
>00441055    jne         00441087
 00441057    cmp         byte ptr [ebx+1A8],0
>0044105E    je          00441087
 00441060    cmp         byte ptr [ebx+1A7],0
>00441067    je          00441087
 00441069    mov         ecx,ebx
 0044106B    mov         dl,1
 0044106D    mov         eax,[005ACB6C]
 00441072    call        dword ptr [eax+24]
 00441075    mov         edx,eax
 00441077    test        edx,edx
>00441079    je          0044107E
 0044107B    sub         edx,0FFFFFF8C
 0044107E    mov         eax,esi
 00441080    call        @IntfCopy
>00441085    jmp         00441094
 00441087    mov         eax,esi
 00441089    mov         edx,dword ptr [ebx+17C]
 0044108F    call        @IntfCopy
 00441094    cmp         byte ptr [ebx+1F8],0
>0044109B    jne         004410A6
 0044109D    cmp         dword ptr [esi],0
>004410A0    jne         004410A6
 004410A2    xor         eax,eax
>004410A4    jmp         004410A8
 004410A6    mov         al,1
 004410A8    mov         byte ptr [ebx+1F8],al
 004410AE    pop         esi
 004410AF    pop         ebx
 004410B0    ret
*}
end;

//004410B4
procedure TWinControl.SetDockSite(Value:Boolean);
begin
{*
 004410B4    push        ebp
 004410B5    mov         ebp,esp
 004410B7    push        0
 004410B9    push        ebx
 004410BA    push        esi
 004410BB    push        edi
 004410BC    mov         ebx,edx
 004410BE    mov         edi,eax
 004410C0    xor         eax,eax
 004410C2    push        ebp
 004410C3    push        44115C
 004410C8    push        dword ptr fs:[eax]
 004410CB    mov         dword ptr fs:[eax],esp
 004410CE    cmp         bl,byte ptr [edi+1A8]
>004410D4    je          00441146
 004410D6    mov         byte ptr [edi+1A8],bl
 004410DC    test        byte ptr [edi+1C],10
>004410E0    jne         00441146
 004410E2    mov         edx,ebx
 004410E4    mov         eax,edi
 004410E6    call        RegisterDockSite
 004410EB    test        bl,bl
>004410ED    jne         0044110F
 004410EF    mov         eax,dword ptr [edi+178]
 004410F5    call        TObject.Free
 004410FA    xor         eax,eax
 004410FC    mov         dword ptr [edi+178],eax
 00441102    lea         eax,[edi+17C]
 00441108    call        @IntfClear
>0044110D    jmp         00441146
 0044110F    cmp         dword ptr [edi+178],0
>00441116    jne         0044112A
 00441118    mov         dl,1
 0044111A    mov         eax,[00417CEC];TList
 0044111F    call        TObject.Create
 00441124    mov         dword ptr [edi+178],eax
 0044112A    lea         edx,[ebp-4]
 0044112D    mov         eax,edi
 0044112F    mov         si,0FFC6
 00441133    call        @CallDynaInst
 00441138    mov         edx,dword ptr [ebp-4]
 0044113B    lea         eax,[edi+17C]
 00441141    call        @IntfCopy
 00441146    xor         eax,eax
 00441148    pop         edx
 00441149    pop         ecx
 0044114A    pop         ecx
 0044114B    mov         dword ptr fs:[eax],edx
 0044114E    push        441163
 00441153    lea         eax,[ebp-4]
 00441156    call        @IntfClear
 0044115B    ret
>0044115C    jmp         @HandleFinally
>00441161    jmp         00441153
 00441163    pop         edi
 00441164    pop         esi
 00441165    pop         ebx
 00441166    pop         ecx
 00441167    pop         ebp
 00441168    ret
*}
end;

//0044116C
procedure TWinControl.CMDockClient(var Message:TCMDockClient);
begin
{*
 0044116C    push        ebp
 0044116D    mov         ebp,esp
 0044116F    add         esp,0FFFFFFE8
 00441172    push        ebx
 00441173    push        esi
 00441174    push        edi
 00441175    mov         dword ptr [ebp-8],edx
 00441178    mov         dword ptr [ebp-4],eax
 0044117B    mov         eax,dword ptr [ebp-8]
 0044117E    cmp         dword ptr [eax+0C],0
>00441182    jne         00441250
 00441188    mov         eax,dword ptr [ebp-8]
 0044118B    mov         eax,dword ptr [eax+4]
 0044118E    lea         esi,[eax+44]
 00441191    lea         edi,[ebp-18]
 00441194    movs        dword ptr [edi],dword ptr [esi]
 00441195    movs        dword ptr [edi],dword ptr [esi]
 00441196    movs        dword ptr [edi],dword ptr [esi]
 00441197    movs        dword ptr [edi],dword ptr [esi]
 00441198    push        2
 0044119A    lea         eax,[ebp-18]
 0044119D    push        eax
 0044119E    mov         eax,dword ptr [ebp-4]
 004411A1    call        TWinControl.GetHandle
 004411A6    push        eax
 004411A7    push        0
 004411A9    call        user32.MapWindowPoints
 004411AE    mov         eax,dword ptr [ebp-4]
 004411B1    call        TWinControl.DisableAlign
 004411B6    xor         edx,edx
 004411B8    push        ebp
 004411B9    push        44122E
 004411BE    push        dword ptr fs:[edx]
 004411C1    mov         dword ptr fs:[edx],esp
 004411C4    mov         eax,dword ptr [ebp-8]
 004411C7    mov         eax,dword ptr [eax+4]
 004411CA    mov         eax,dword ptr [eax+38]
 004411CD    lea         ecx,[ebp-18]
 004411D0    mov         edx,dword ptr [ebp-4]
 004411D3    mov         si,0FFCC
 004411D7    call        @CallDynaInst
 004411DC    mov         eax,dword ptr [ebp-4]
 004411DF    cmp         byte ptr [eax+1A7],0
>004411E6    je          00441218
 004411E8    mov         eax,dword ptr [ebp-4]
 004411EB    cmp         dword ptr [eax+17C],0
>004411F2    je          00441218
 004411F4    mov         eax,dword ptr [ebp-8]
 004411F7    mov         eax,dword ptr [eax+4]
 004411FA    mov         edx,dword ptr [eax+58]
 004411FD    push        edx
 004411FE    mov         edx,dword ptr [ebp-8]
 00441201    mov         cl,byte ptr [eax+54]
 00441204    mov         edx,dword ptr [ebp-8]
 00441207    mov         edx,dword ptr [eax+38]
 0044120A    mov         eax,dword ptr [ebp-4]
 0044120D    mov         eax,dword ptr [eax+17C]
 00441213    mov         ebx,dword ptr [eax]
 00441215    call        dword ptr [ebx+18]
 00441218    xor         eax,eax
 0044121A    pop         edx
 0044121B    pop         ecx
 0044121C    pop         ecx
 0044121D    mov         dword ptr fs:[eax],edx
 00441220    push        441235
 00441225    mov         eax,dword ptr [ebp-4]
 00441228    call        TWinControl.EnableAlign
 0044122D    ret
>0044122E    jmp         @HandleFinally
>00441233    jmp         00441225
 00441235    mov         eax,dword ptr [ebp-4]
 00441238    call        GetParentForm
 0044123D    test        eax,eax
>0044123F    je          00441246
 00441241    call        TControl.BringToFront
 00441246    mov         eax,dword ptr [ebp-8]
 00441249    mov         dword ptr [eax+0C],1
 00441250    pop         edi
 00441251    pop         esi
 00441252    pop         ebx
 00441253    mov         esp,ebp
 00441255    pop         ebp
 00441256    ret
*}
end;

//00441258
procedure TWinControl.CMUnDockClient(var Message:TCMUnDockClient);
begin
{*
 00441258    xor         ecx,ecx
 0044125A    mov         dword ptr [edx+0C],ecx
 0044125D    cmp         byte ptr [eax+1A7],0
>00441264    je          0044127D
 00441266    cmp         dword ptr [eax+17C],0
>0044126D    je          0044127D
 0044126F    mov         edx,dword ptr [edx+8]
 00441272    mov         eax,dword ptr [eax+17C]
 00441278    mov         ecx,dword ptr [eax]
 0044127A    call        dword ptr [ecx+28]
 0044127D    ret
*}
end;

//00441280
procedure TWinControl.CMFloat(var Message:TCMFloat);
begin
{*
 00441280    push        ebp
 00441281    mov         ebp,esp
 00441283    add         esp,0FFFFFFF8
 00441286    push        ebx
 00441287    push        esi
 00441288    mov         ebx,edx
 0044128A    mov         dword ptr [ebp-4],eax
 0044128D    mov         eax,dword ptr [ebp-4]
 00441290    mov         edx,dword ptr [eax]
 00441292    call        dword ptr [edx+58]
 00441295    mov         esi,eax
 00441297    mov         eax,dword ptr [ebp-4]
 0044129A    call        TObject.ClassType
 0044129F    cmp         esi,eax
>004412A1    jne         004412F1
 004412A3    mov         eax,dword ptr [ebp-4]
 004412A6    mov         al,byte ptr [eax+57]
 004412A9    mov         byte ptr [ebp-5],al
 004412AC    xor         eax,eax
 004412AE    push        ebp
 004412AF    push        4412EA
 004412B4    push        dword ptr fs:[eax]
 004412B7    mov         dword ptr fs:[eax],esp
 004412BA    mov         eax,dword ptr [ebx+8]
 004412BD    lea         ecx,[eax+44]
 004412C0    xor         edx,edx
 004412C2    mov         eax,dword ptr [ebp-4]
 004412C5    mov         si,0FFCC
 004412C9    call        @CallDynaInst
 004412CE    xor         eax,eax
 004412D0    pop         edx
 004412D1    pop         ecx
 004412D2    pop         ecx
 004412D3    mov         dword ptr fs:[eax],edx
 004412D6    push        4412FB
 004412DB    cmp         byte ptr [ebp-5],0
>004412DF    je          004412E9
 004412E1    mov         eax,dword ptr [ebp-4]
 004412E4    call        TControl.BringToFront
 004412E9    ret
>004412EA    jmp         @HandleFinally
>004412EF    jmp         004412DB
 004412F1    mov         edx,ebx
 004412F3    mov         eax,dword ptr [ebp-4]
 004412F6    call        TControl.CMFloat
 004412FB    pop         esi
 004412FC    pop         ebx
 004412FD    pop         ecx
 004412FE    pop         ecx
 004412FF    pop         ebp
 00441300    ret
*}
end;

//00441304
procedure TWinControl.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 00441304    push        ebx
 00441305    push        ecx
 00441306    mov         byte ptr [esp],cl
 00441309    cmp         word ptr [eax+1DA],0
>00441311    je          00441329
 00441313    mov         cl,byte ptr [esp]
 00441316    push        ecx
 00441317    mov         ecx,edx
 00441319    mov         ebx,eax
 0044131B    mov         edx,eax
 0044131D    mov         eax,dword ptr [ebx+1DC]
 00441323    call        dword ptr [ebx+1D8]
 00441329    pop         edx
 0044132A    pop         ebx
 0044132B    ret
*}
end;

//0044132C
function TWinControl.DoKeyDown(var Message:TWMKey):Boolean;
begin
{*
 0044132C    push        ebx
 0044132D    push        esi
 0044132E    push        edi
 0044132F    push        ebp
 00441330    push        ecx
 00441331    mov         edi,edx
 00441333    mov         esi,eax
 00441335    mov         bl,1
 00441337    mov         eax,esi
 00441339    call        GetParentForm
 0044133E    mov         ebp,eax
 00441340    test        ebp,ebp
>00441342    je          0044135E
 00441344    cmp         esi,ebp
>00441346    je          0044135E
 00441348    cmp         byte ptr [ebp+22D],0
>0044134F    je          0044135E
 00441351    mov         edx,edi
 00441353    mov         eax,ebp
 00441355    call        TWinControl.DoKeyDown
 0044135A    test        al,al
>0044135C    jne         00441389
 0044135E    mov         eax,dword ptr [edi+8]
 00441361    call        KeyDataToShiftState
 00441366    mov         byte ptr [esp],al
 00441369    test        byte ptr [esi+51],10
>0044136D    jne         00441387
 0044136F    lea         edx,[edi+4]
 00441372    mov         cl,byte ptr [esp]
 00441375    mov         eax,esi
 00441377    mov         si,0FFBC
 0044137B    call        @CallDynaInst
 00441380    cmp         word ptr [edi+4],0
>00441385    je          00441389
 00441387    xor         ebx,ebx
 00441389    mov         eax,ebx
 0044138B    pop         edx
 0044138C    pop         ebp
 0044138D    pop         edi
 0044138E    pop         esi
 0044138F    pop         ebx
 00441390    ret
*}
end;

//00441394
procedure TWinControl.WMKeyDown(var Message:TWMKeyDown);
begin
{*
 00441394    push        ebx
 00441395    push        esi
 00441396    mov         esi,edx
 00441398    mov         ebx,eax
 0044139A    mov         edx,esi
 0044139C    mov         eax,ebx
 0044139E    call        TWinControl.DoKeyDown
 004413A3    test        al,al
>004413A5    jne         004413B0
 004413A7    mov         edx,esi
 004413A9    mov         eax,ebx
 004413AB    mov         ecx,dword ptr [eax]
 004413AD    call        dword ptr [ecx-10]
 004413B0    mov         dx,word ptr [esi+4]
 004413B4    mov         eax,ebx
 004413B6    call        TWinControl.UpdateUIState
 004413BB    pop         esi
 004413BC    pop         ebx
 004413BD    ret
*}
end;

//004413C0
procedure TWinControl.WMSysKeyDown(var Message:TWMKeyDown);
begin
{*
 004413C0    push        ebx
 004413C1    push        esi
 004413C2    mov         esi,edx
 004413C4    mov         ebx,eax
 004413C6    mov         edx,esi
 004413C8    mov         eax,ebx
 004413CA    call        TWinControl.DoKeyDown
 004413CF    test        al,al
>004413D1    jne         004413DC
 004413D3    mov         edx,esi
 004413D5    mov         eax,ebx
 004413D7    mov         ecx,dword ptr [eax]
 004413D9    call        dword ptr [ecx-10]
 004413DC    mov         dx,word ptr [esi+4]
 004413E0    mov         eax,ebx
 004413E2    call        TWinControl.UpdateUIState
 004413E7    pop         esi
 004413E8    pop         ebx
 004413E9    ret
*}
end;

//004413EC
procedure TWinControl.KeyUp(var Key:Word; Shift:TShiftState);
begin
{*
 004413EC    push        ebx
 004413ED    push        ecx
 004413EE    mov         byte ptr [esp],cl
 004413F1    cmp         word ptr [eax+1EA],0
>004413F9    je          00441411
 004413FB    mov         cl,byte ptr [esp]
 004413FE    push        ecx
 004413FF    mov         ecx,edx
 00441401    mov         ebx,eax
 00441403    mov         edx,eax
 00441405    mov         eax,dword ptr [ebx+1EC]
 0044140B    call        dword ptr [ebx+1E8]
 00441411    pop         edx
 00441412    pop         ebx
 00441413    ret
*}
end;

//00441414
function TWinControl.DoKeyUp(var Message:TWMKey):Boolean;
begin
{*
 00441414    push        ebx
 00441415    push        esi
 00441416    push        edi
 00441417    push        ebp
 00441418    push        ecx
 00441419    mov         edi,edx
 0044141B    mov         esi,eax
 0044141D    mov         bl,1
 0044141F    mov         eax,esi
 00441421    call        GetParentForm
 00441426    mov         ebp,eax
 00441428    test        ebp,ebp
>0044142A    je          00441446
 0044142C    cmp         esi,ebp
>0044142E    je          00441446
 00441430    cmp         byte ptr [ebp+22D],0
>00441437    je          00441446
 00441439    mov         edx,edi
 0044143B    mov         eax,ebp
 0044143D    call        TWinControl.DoKeyUp
 00441442    test        al,al
>00441444    jne         00441471
 00441446    mov         eax,dword ptr [edi+8]
 00441449    call        KeyDataToShiftState
 0044144E    mov         byte ptr [esp],al
 00441451    test        byte ptr [esi+51],10
>00441455    jne         0044146F
 00441457    lea         edx,[edi+4]
 0044145A    mov         cl,byte ptr [esp]
 0044145D    mov         eax,esi
 0044145F    mov         si,0FFBB
 00441463    call        @CallDynaInst
 00441468    cmp         word ptr [edi+4],0
>0044146D    je          00441471
 0044146F    xor         ebx,ebx
 00441471    mov         eax,ebx
 00441473    pop         edx
 00441474    pop         ebp
 00441475    pop         edi
 00441476    pop         esi
 00441477    pop         ebx
 00441478    ret
*}
end;

//0044147C
procedure TWinControl.WMKeyUp(var Message:TWMKeyUp);
begin
{*
 0044147C    push        ebx
 0044147D    push        esi
 0044147E    mov         esi,edx
 00441480    mov         ebx,eax
 00441482    mov         edx,esi
 00441484    mov         eax,ebx
 00441486    call        TWinControl.DoKeyUp
 0044148B    test        al,al
>0044148D    jne         00441498
 0044148F    mov         edx,esi
 00441491    mov         eax,ebx
 00441493    mov         ecx,dword ptr [eax]
 00441495    call        dword ptr [ecx-10]
 00441498    pop         esi
 00441499    pop         ebx
 0044149A    ret
*}
end;

//0044149C
procedure TWinControl.WMSysKeyUp(var Message:TWMKeyUp);
begin
{*
 0044149C    push        ebx
 0044149D    push        esi
 0044149E    mov         esi,edx
 004414A0    mov         ebx,eax
 004414A2    mov         edx,esi
 004414A4    mov         eax,ebx
 004414A6    call        TWinControl.DoKeyUp
 004414AB    test        al,al
>004414AD    jne         004414B8
 004414AF    mov         edx,esi
 004414B1    mov         eax,ebx
 004414B3    mov         ecx,dword ptr [eax]
 004414B5    call        dword ptr [ecx-10]
 004414B8    pop         esi
 004414B9    pop         ebx
 004414BA    ret
*}
end;

//004414BC
procedure TWinControl.KeyPress(var Key:Char);
begin
{*
 004414BC    push        ebx
 004414BD    cmp         word ptr [eax+1E2],0
>004414C5    je          004414D9
 004414C7    mov         ecx,edx
 004414C9    mov         ebx,eax
 004414CB    mov         edx,eax
 004414CD    mov         eax,dword ptr [ebx+1E4]
 004414D3    call        dword ptr [ebx+1E0]
 004414D9    pop         ebx
 004414DA    ret
*}
end;

//004414DC
function TWinControl.DoKeyPress(var Message:TWMKey):Boolean;
begin
{*
 004414DC    push        ebx
 004414DD    push        esi
 004414DE    push        edi
 004414DF    push        ebp
 004414E0    push        ecx
 004414E1    mov         edi,edx
 004414E3    mov         esi,eax
 004414E5    mov         bl,1
 004414E7    mov         eax,esi
 004414E9    call        GetParentForm
 004414EE    mov         ebp,eax
 004414F0    test        ebp,ebp
>004414F2    je          0044150E
 004414F4    cmp         esi,ebp
>004414F6    je          0044150E
 004414F8    cmp         byte ptr [ebp+22D],0
>004414FF    je          0044150E
 00441501    mov         edx,edi
 00441503    mov         eax,ebp
 00441505    call        TWinControl.DoKeyPress
 0044150A    test        al,al
>0044150C    jne         00441538
 0044150E    test        byte ptr [esi+51],10
>00441512    jne         00441536
 00441514    mov         al,byte ptr [edi+4]
 00441517    mov         byte ptr [esp],al
 0044151A    mov         edx,esp
 0044151C    mov         eax,esi
 0044151E    mov         si,0FFBA
 00441522    call        @CallDynaInst
 00441527    xor         eax,eax
 00441529    mov         al,byte ptr [esp]
 0044152C    mov         word ptr [edi+4],ax
 00441530    cmp         byte ptr [edi+4],0
>00441534    je          00441538
 00441536    xor         ebx,ebx
 00441538    mov         eax,ebx
 0044153A    pop         edx
 0044153B    pop         ebp
 0044153C    pop         edi
 0044153D    pop         esi
 0044153E    pop         ebx
 0044153F    ret
*}
end;

//00441540
procedure TWinControl.WMChar(var Message:TWMChar);
begin
{*
 00441540    push        ebx
 00441541    push        esi
 00441542    mov         esi,edx
 00441544    mov         ebx,eax
 00441546    mov         edx,esi
 00441548    mov         eax,ebx
 0044154A    call        TWinControl.DoKeyPress
 0044154F    test        al,al
>00441551    jne         0044155C
 00441553    mov         edx,esi
 00441555    mov         eax,ebx
 00441557    mov         ecx,dword ptr [eax]
 00441559    call        dword ptr [ecx-10]
 0044155C    pop         esi
 0044155D    pop         ebx
 0044155E    ret
*}
end;

//00441560
function TraverseControls(Container:TWinControl):Boolean;
begin
{*
 00441560    push        ebp
 00441561    mov         ebp,esp
 00441563    add         esp,0FFFFFFF8
 00441566    push        ebx
 00441567    push        esi
 00441568    push        edi
 00441569    mov         dword ptr [ebp-4],eax
 0044156C    mov         byte ptr [ebp-5],0
 00441570    mov         eax,dword ptr [ebp-4]
 00441573    cmp         byte ptr [eax+1A6],0
>0044157A    je          00441603
 00441580    mov         eax,dword ptr [ebp-4]
 00441583    call        TWinControl.GetControlCount
 00441588    mov         esi,eax
 0044158A    dec         esi
 0044158B    test        esi,esi
>0044158D    jl          00441603
 0044158F    inc         esi
 00441590    xor         edi,edi
 00441592    mov         edx,edi
 00441594    mov         eax,dword ptr [ebp-4]
 00441597    call        TWinControl.GetControl
 0044159C    mov         ebx,eax
 0044159E    cmp         byte ptr [ebx+57],0
>004415A2    je          004415FF
 004415A4    mov         eax,ebx
 004415A6    mov         edx,dword ptr [eax]
 004415A8    call        dword ptr [edx+50]
 004415AB    test        al,al
>004415AD    je          004415FF
 004415AF    test        byte ptr [ebx+52],1
>004415B3    je          004415D8
 004415B5    mov         eax,dword ptr [ebp+8]
 004415B8    mov         eax,dword ptr [eax-4]
 004415BB    mov         eax,dword ptr [eax+8]
 004415BE    push        eax
 004415BF    mov         eax,dword ptr [ebp+8]
 004415C2    mov         ecx,dword ptr [eax-4]
 004415C5    mov         ecx,dword ptr [ecx+4]
 004415C8    mov         edx,112
 004415CD    mov         eax,ebx
 004415CF    call        TControl.Perform
 004415D4    test        eax,eax
>004415D6    jne         004415F9
 004415D8    mov         eax,ebx
 004415DA    mov         edx,dword ptr ds:[4380F4];TWinControl
 004415E0    call        @IsClass
 004415E5    test        al,al
>004415E7    je          004415FF
 004415E9    mov         eax,dword ptr [ebp+8]
 004415EC    push        eax
 004415ED    mov         eax,ebx
 004415EF    call        TraverseControls
 004415F4    pop         ecx
 004415F5    test        al,al
>004415F7    je          004415FF
 004415F9    mov         byte ptr [ebp-5],1
>004415FD    jmp         00441603
 004415FF    inc         edi
 00441600    dec         esi
>00441601    jne         00441592
 00441603    mov         al,byte ptr [ebp-5]
 00441606    pop         edi
 00441607    pop         esi
 00441608    pop         ebx
 00441609    pop         ecx
 0044160A    pop         ecx
 0044160B    pop         ebp
 0044160C    ret
*}
end;

//00441610
procedure TWinControl.WMSysCommand(var Message:TWMSysCommand);
begin
{*
 00441610    push        ebp
 00441611    mov         ebp,esp
 00441613    push        ecx
 00441614    push        ebx
 00441615    push        esi
 00441616    mov         dword ptr [ebp-4],edx
 00441619    mov         ebx,eax
 0044161B    mov         eax,dword ptr [ebp-4]
 0044161E    mov         eax,dword ptr [eax+4]
 00441621    and         eax,0FFF0
 00441626    cmp         eax,0F100
>0044162B    jne         00441689
 0044162D    mov         eax,dword ptr [ebp-4]
 00441630    cmp         word ptr [eax+8],20
>00441635    je          00441689
 00441637    mov         eax,dword ptr [ebp-4]
 0044163A    cmp         word ptr [eax+8],2D
>0044163F    je          00441689
 00441641    mov         eax,dword ptr [ebx+180]
 00441647    push        eax
 00441648    call        user32.IsIconic
 0044164D    test        eax,eax
>0044164F    jne         00441689
 00441651    call        user32.GetCapture
 00441656    test        eax,eax
>00441658    jne         00441689
 0044165A    mov         eax,[005AE584];^Application:TApplication
 0044165F    mov         eax,dword ptr [eax]
 00441661    cmp         ebx,dword ptr [eax+44]
>00441664    je          00441689
 00441666    mov         eax,ebx
 00441668    call        GetParentForm
 0044166D    mov         esi,eax
 0044166F    test        esi,esi
>00441671    je          00441689
 00441673    mov         eax,dword ptr [ebp-4]
 00441676    push        eax
 00441677    xor         ecx,ecx
 00441679    mov         edx,0B017
 0044167E    mov         eax,esi
 00441680    call        TControl.Perform
 00441685    test        eax,eax
>00441687    jne         004416B2
 00441689    mov         eax,dword ptr [ebp-4]
 0044168C    mov         eax,dword ptr [eax+4]
 0044168F    and         eax,0FFF0
 00441694    cmp         eax,0F100
>00441699    jne         004416A8
 0044169B    push        ebp
 0044169C    mov         eax,ebx
 0044169E    call        TraverseControls
 004416A3    pop         ecx
 004416A4    test        al,al
>004416A6    jne         004416B2
 004416A8    mov         edx,dword ptr [ebp-4]
 004416AB    mov         eax,ebx
 004416AD    mov         ecx,dword ptr [eax]
 004416AF    call        dword ptr [ecx-10]
 004416B2    pop         esi
 004416B3    pop         ebx
 004416B4    pop         ecx
 004416B5    pop         ebp
 004416B6    ret
*}
end;

//004416B8
procedure TWinControl.WMVKeyToItem(var Message:TWMVKeyToItem);
begin
{*
 004416B8    push        ebx
 004416B9    push        esi
 004416BA    mov         ebx,edx
 004416BC    mov         esi,eax
 004416BE    mov         edx,ebx
 004416C0    mov         eax,dword ptr [ebx+8]
 004416C3    call        DoControlMsg
 004416C8    test        al,al
>004416CA    jne         004416D5
 004416CC    mov         edx,ebx
 004416CE    mov         eax,esi
 004416D0    mov         ecx,dword ptr [eax]
 004416D2    call        dword ptr [ecx-10]
 004416D5    pop         esi
 004416D6    pop         ebx
 004416D7    ret
*}
end;

//004416D8
procedure TWinControl.WMParentNotify(var Message:TWMParentNotify);
begin
{*
 004416D8    push        ebx
 004416D9    push        esi
 004416DA    push        edi
 004416DB    mov         ebx,edx
 004416DD    mov         edi,eax
 004416DF    mov         si,word ptr [ebx+4]
 004416E3    cmp         si,1
>004416E7    je          004416EF
 004416E9    cmp         si,2
>004416ED    jne         004416FD
 004416EF    mov         edx,ebx
 004416F1    mov         eax,dword ptr [ebx+8]
 004416F4    call        DoControlMsg
 004416F9    test        al,al
>004416FB    jne         00441706
 004416FD    mov         edx,ebx
 004416FF    mov         eax,edi
 00441701    mov         ecx,dword ptr [eax]
 00441703    call        dword ptr [ecx-10]
 00441706    pop         edi
 00441707    pop         esi
 00441708    pop         ebx
 00441709    ret
*}
end;

//0044170C
procedure TWinControl.WMVScroll(var Message:TWMVScroll);
begin
{*
 0044170C    push        ebx
 0044170D    push        esi
 0044170E    mov         ebx,edx
 00441710    mov         esi,eax
 00441712    mov         edx,ebx
 00441714    mov         eax,dword ptr [ebx+8]
 00441717    call        DoControlMsg
 0044171C    test        al,al
>0044171E    jne         00441729
 00441720    mov         edx,ebx
 00441722    mov         eax,esi
 00441724    mov         ecx,dword ptr [eax]
 00441726    call        dword ptr [ecx-10]
 00441729    pop         esi
 0044172A    pop         ebx
 0044172B    ret
*}
end;

//0044172C
procedure TWinControl.WMDestroy(var Message:TWMDestroy);
begin
{*
 0044172C    push        esi
 0044172D    mov         esi,eax
 0044172F    mov         eax,esi
 00441731    mov         ecx,dword ptr [eax]
 00441733    call        dword ptr [ecx-10]
 00441736    movzx       eax,word ptr ds:[5E0C1A];ControlAtom:TAtom
 0044173D    push        eax
 0044173E    mov         eax,dword ptr [esi+180]
 00441744    push        eax
 00441745    call        user32.RemovePropA
 0044174A    movzx       eax,word ptr ds:[5E0C18];WindowAtom:TAtom
 00441751    push        eax
 00441752    mov         eax,dword ptr [esi+180]
 00441758    push        eax
 00441759    call        user32.RemovePropA
 0044175E    pop         esi
 0044175F    ret
*}
end;

//00441760
procedure TWinControl.WMNCDestroy(var Message:TWMNCDestroy);
begin
{*
 00441760    push        esi
 00441761    mov         esi,eax
 00441763    mov         eax,esi
 00441765    mov         ecx,dword ptr [eax]
 00441767    call        dword ptr [ecx-10]
 0044176A    xor         eax,eax
 0044176C    mov         dword ptr [esi+180],eax
 00441772    mov         byte ptr [esi+1A6],0
 00441779    pop         esi
 0044177A    ret
*}
end;

//0044177C
procedure TWinControl.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 0044177C    push        esi
 0044177D    mov         esi,eax
 0044177F    test        byte ptr [esi+1C],10
>00441783    je          00441794
 00441785    cmp         dword ptr [esi+30],0
>00441789    je          00441794
 0044178B    mov         dword ptr [edx+0C],1
 00441792    pop         esi
 00441793    ret
 00441794    mov         eax,esi
 00441796    mov         ecx,dword ptr [eax]
 00441798    call        dword ptr [ecx-10]
 0044179B    pop         esi
 0044179C    ret
*}
end;

//004417A0
procedure TWinControl.PaletteChanged(Foreground:Boolean);
begin
{*
 004417A0    push        ebx
 004417A1    push        esi
 004417A2    push        edi
 004417A3    push        ebp
 004417A4    push        ecx
 004417A5    mov         byte ptr [esp],dl
 004417A8    mov         ebp,eax
 004417AA    mov         dl,byte ptr [esp]
 004417AD    mov         eax,ebp
 004417AF    call        TControl.PaletteChanged
 004417B4    mov         ebx,eax
 004417B6    cmp         byte ptr [ebp+57],0
>004417BA    je          004417ED
 004417BC    mov         eax,ebp
 004417BE    call        TWinControl.GetControlCount
 004417C3    mov         edi,eax
 004417C5    dec         edi
 004417C6    cmp         edi,0
>004417C9    jl          004417ED
 004417CB    test        byte ptr [esp],bl
>004417CE    jne         004417ED
 004417D0    mov         edx,edi
 004417D2    mov         eax,ebp
 004417D4    call        TWinControl.GetControl
 004417D9    mov         dl,byte ptr [esp]
 004417DC    mov         si,0FFD1
 004417E0    call        @CallDynaInst
 004417E5    or          bl,al
 004417E7    dec         edi
 004417E8    cmp         edi,0FFFFFFFF
>004417EB    jne         004417CB
 004417ED    mov         eax,ebx
 004417EF    pop         edx
 004417F0    pop         ebp
 004417F1    pop         edi
 004417F2    pop         esi
 004417F3    pop         ebx
 004417F4    ret
*}
end;

//004417F8
procedure TWinControl.WMQueryNewPalette(var Message:TMessage);
begin
{*
 004417F8    push        ebx
 004417F9    push        esi
 004417FA    push        edi
 004417FB    mov         edi,edx
 004417FD    mov         ebx,eax
 004417FF    or          word ptr [ebx+54],4
 00441804    mov         dl,1
 00441806    mov         eax,ebx
 00441808    mov         si,0FFD1
 0044180C    call        @CallDynaInst
 00441811    and         eax,7F
 00441814    mov         dword ptr [edi+0C],eax
 00441817    pop         edi
 00441818    pop         esi
 00441819    pop         ebx
 0044181A    ret
*}
end;

//0044181C
procedure TWinControl.WMPaletteChanged(var Message:TMessage);
begin
{*
 0044181C    push        ebx
 0044181D    push        esi
 0044181E    push        edi
 0044181F    mov         edi,edx
 00441821    mov         ebx,eax
 00441823    xor         edx,edx
 00441825    mov         eax,ebx
 00441827    mov         si,0FFD1
 0044182B    call        @CallDynaInst
 00441830    and         eax,7F
 00441833    mov         dword ptr [edi+0C],eax
 00441836    pop         edi
 00441837    pop         esi
 00441838    pop         ebx
 00441839    ret
*}
end;

//0044183C
procedure TWinControl.CMShowHintChanged(var Message:TMessage);
begin
{*
 0044183C    push        esi
 0044183D    mov         esi,eax
 0044183F    mov         eax,esi
 00441841    mov         ecx,dword ptr [eax]
 00441843    call        dword ptr [ecx-10]
 00441846    mov         dx,0B023
 0044184A    mov         eax,esi
 0044184C    call        TWinControl.NotifyControls
 00441851    pop         esi
 00441852    ret
*}
end;

//00441854
procedure TWinControl.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 00441854    push        ebx
 00441855    push        esi
 00441856    mov         esi,edx
 00441858    mov         ebx,eax
 0044185A    mov         edx,esi
 0044185C    mov         eax,ebx
 0044185E    call        TControl.CMBiDiModeChanged
 00441863    mov         eax,[005AE810];^SysLocale:TSysLocale
 00441868    cmp         byte ptr [eax+0D],0
>0044186C    je          0044187B
 0044186E    cmp         dword ptr [esi+4],0
>00441872    jne         0044187B
 00441874    mov         eax,ebx
 00441876    call        TWinControl.RecreateWnd
 0044187B    mov         dx,0B03D
 0044187F    mov         eax,ebx
 00441881    call        TWinControl.NotifyControls
 00441886    pop         esi
 00441887    pop         ebx
 00441888    ret
*}
end;

//0044188C
procedure TWinControl.CMEnter(var Message:TWMNoParams);
begin
{*
 0044188C    push        ebx
 0044188D    push        esi
 0044188E    mov         ebx,eax
 00441890    mov         eax,[005AE810];^SysLocale:TSysLocale
 00441895    cmp         byte ptr [eax+0D],0
>00441899    je          004418F0
 0044189B    mov         eax,ebx
 0044189D    call        TControl.UseRightToLeftReading
 004418A2    test        al,al
>004418A4    je          004418CC
 004418A6    mov         eax,[005AE584];^Application:TApplication
 004418AB    mov         eax,dword ptr [eax]
 004418AD    cmp         dword ptr [eax+38],0
>004418B1    je          004418F0
 004418B3    push        1
 004418B5    mov         eax,[005AE584];^Application:TApplication
 004418BA    mov         eax,dword ptr [eax]
 004418BC    mov         eax,dword ptr [eax+38]
 004418BF    call        @LStrToPChar
 004418C4    push        eax
 004418C5    call        user32.LoadKeyboardLayoutA
>004418CA    jmp         004418F0
 004418CC    mov         eax,[005AE584];^Application:TApplication
 004418D1    mov         eax,dword ptr [eax]
 004418D3    cmp         dword ptr [eax+3C],0
>004418D7    je          004418F0
 004418D9    push        1
 004418DB    mov         eax,[005AE584];^Application:TApplication
 004418E0    mov         eax,dword ptr [eax]
 004418E2    mov         eax,dword ptr [eax+3C]
 004418E5    call        @LStrToPChar
 004418EA    push        eax
 004418EB    call        user32.LoadKeyboardLayoutA
 004418F0    mov         eax,ebx
 004418F2    mov         si,0FFC2
 004418F6    call        @CallDynaInst
 004418FB    pop         esi
 004418FC    pop         ebx
 004418FD    ret
*}
end;

//00441900
procedure TWinControl.CMExit(var Message:TWMNoParams);
begin
{*
 00441900    push        esi
 00441901    mov         si,0FFC1
 00441905    call        @CallDynaInst
 0044190A    pop         esi
 0044190B    ret
*}
end;

//0044190C
procedure TWinControl.CMDesignHitTest(var Message:TWMMouse);
begin
{*
 0044190C    push        ebx
 0044190D    push        esi
 0044190E    mov         esi,edx
 00441910    mov         ebx,eax
 00441912    mov         edx,esi
 00441914    mov         eax,ebx
 00441916    call        TWinControl.IsControlMouseMsg
 0044191B    test        al,al
>0044191D    jne         00441928
 0044191F    mov         edx,esi
 00441921    mov         eax,ebx
 00441923    call        TControl.CMDesignHitTest
 00441928    pop         esi
 00441929    pop         ebx
 0044192A    ret
*}
end;

//0044192C
procedure TWinControl.CMChanged(var Message:TMessage);
begin
{*
 0044192C    push        ebx
 0044192D    mov         ecx,dword ptr [eax+30]
 00441930    test        ecx,ecx
>00441932    je          0044193C
 00441934    mov         ebx,ecx
 00441936    mov         eax,dword ptr [ebx+3C]
 00441939    call        dword ptr [ebx+38]
 0044193C    pop         ebx
 0044193D    ret
*}
end;

//00441940
procedure TWinControl.CMChildKey(var Message:TMessage);
begin
{*
 00441940    push        ebx
 00441941    mov         ecx,dword ptr [eax+30]
 00441944    test        ecx,ecx
>00441946    je          00441950
 00441948    mov         ebx,ecx
 0044194A    mov         eax,dword ptr [ebx+3C]
 0044194D    call        dword ptr [ebx+38]
 00441950    pop         ebx
 00441951    ret
*}
end;

//00441954
procedure TWinControl.CMDialogKey(var Message:TWMKey);
begin
{*
 00441954    call        TWinControl.Broadcast
 00441959    ret
*}
end;

//0044195C
procedure TWinControl.CMDialogChar(var Message:TWMKey);
begin
{*
 0044195C    call        TWinControl.Broadcast
 00441961    ret
*}
end;

//00441964
procedure TWinControl.CMFocusChanged(var Message:TCMFocusChanged);
begin
{*
 00441964    call        TWinControl.Broadcast
 00441969    ret
*}
end;

//0044196C
procedure TWinControl.CMVisibleChanged(var Message:TMessage);
begin
{*
 0044196C    push        ebx
 0044196D    mov         ebx,eax
 0044196F    cmp         byte ptr [ebx+57],0
>00441973    jne         00441984
 00441975    cmp         dword ptr [ebx+30],0
>00441979    je          00441984
 0044197B    xor         edx,edx
 0044197D    mov         eax,ebx
 0044197F    call        TWinControl.RemoveFocus
 00441984    test        byte ptr [ebx+1C],10
>00441988    je          00441990
 0044198A    test        byte ptr [ebx+51],4
>0044198E    je          00441997
 00441990    mov         eax,ebx
 00441992    call        TWinControl.UpdateControlState
 00441997    pop         ebx
 00441998    ret
*}
end;

//0044199C
procedure TWinControl.CMShowingChanged(var Message:TMessage);
begin
{*
 0044199C    xor         edx,edx
 0044199E    mov         dl,byte ptr [eax+1A6]
 004419A4    movzx       edx,word ptr [edx*2+5ACC2C]
 004419AC    push        edx
 004419AD    push        0
 004419AF    push        0
 004419B1    push        0
 004419B3    push        0
 004419B5    push        0
 004419B7    mov         eax,dword ptr [eax+180]
 004419BD    push        eax
 004419BE    call        user32.SetWindowPos
 004419C3    ret
*}
end;

//004419C4
procedure TWinControl.CMEnabledChanged(var Message:TMessage);
begin
{*
 004419C4    push        ebx
 004419C5    mov         ebx,eax
 004419C7    mov         eax,ebx
 004419C9    mov         edx,dword ptr [eax]
 004419CB    call        dword ptr [edx+50]
 004419CE    test        al,al
>004419D0    jne         004419E1
 004419D2    cmp         dword ptr [ebx+30],0
>004419D6    je          004419E1
 004419D8    xor         edx,edx
 004419DA    mov         eax,ebx
 004419DC    call        TWinControl.RemoveFocus
 004419E1    mov         eax,ebx
 004419E3    call        TWinControl.HandleAllocated
 004419E8    test        al,al
>004419EA    je          00441A0A
 004419EC    test        byte ptr [ebx+1C],10
>004419F0    jne         00441A0A
 004419F2    mov         eax,ebx
 004419F4    mov         edx,dword ptr [eax]
 004419F6    call        dword ptr [edx+50]
 004419F9    neg         al
 004419FB    sbb         eax,eax
 004419FD    push        eax
 004419FE    mov         eax,dword ptr [ebx+180]
 00441A04    push        eax
 00441A05    call        user32.EnableWindow
 00441A0A    pop         ebx
 00441A0B    ret
*}
end;

//00441A0C
procedure TWinControl.CMColorChanged(var Message:TMessage);
begin
{*
 00441A0C    push        ebx
 00441A0D    mov         ebx,eax
 00441A0F    mov         eax,ebx
 00441A11    call        TControl.CMColorChanged
 00441A16    mov         edx,dword ptr [ebx+70]
 00441A19    mov         eax,dword ptr [ebx+170]
 00441A1F    call        TBrush.SetColor
 00441A24    mov         dx,0B009
 00441A28    mov         eax,ebx
 00441A2A    call        TWinControl.NotifyControls
 00441A2F    pop         ebx
 00441A30    ret
*}
end;

//00441A34
procedure TWinControl.CMFontChanged(var Message:TMessage);
begin
{*
 00441A34    push        ebx
 00441A35    mov         ebx,eax
 00441A37    mov         eax,ebx
 00441A39    call        TControl.CMFontChanged
 00441A3E    mov         eax,ebx
 00441A40    call        TWinControl.HandleAllocated
 00441A45    test        al,al
>00441A47    je          00441A61
 00441A49    push        0
 00441A4B    mov         eax,dword ptr [ebx+68]
 00441A4E    call        TFont.GetHandle
 00441A53    mov         ecx,eax
 00441A55    mov         edx,30
 00441A5A    mov         eax,ebx
 00441A5C    call        TControl.Perform
 00441A61    mov         dx,0B008
 00441A65    mov         eax,ebx
 00441A67    call        TWinControl.NotifyControls
 00441A6C    pop         ebx
 00441A6D    ret
*}
end;

//00441A70
procedure TWinControl.CMCursorChanged(var Message:TMessage);
begin
{*
 00441A70    push        ebx
 00441A71    add         esp,0FFFFFFF8
 00441A74    mov         ebx,eax
 00441A76    call        user32.GetCapture
 00441A7B    test        eax,eax
>00441A7D    jne         00441AA9
 00441A7F    push        esp
 00441A80    call        user32.GetCursorPos
 00441A85    mov         eax,esp
 00441A87    xor         edx,edx
 00441A89    call        FindDragTarget
 00441A8E    cmp         ebx,eax
>00441A90    jne         00441AA9
 00441A92    push        1
 00441A94    mov         eax,ebx
 00441A96    call        TWinControl.GetHandle
 00441A9B    mov         ecx,eax
 00441A9D    mov         edx,20
 00441AA2    mov         eax,ebx
 00441AA4    call        TControl.Perform
 00441AA9    pop         ecx
 00441AAA    pop         edx
 00441AAB    pop         ebx
 00441AAC    ret
*}
end;

//00441AB0
procedure TWinControl.CMBorderChanged(var Message:TMessage);
begin
{*
 00441AB0    push        esi
 00441AB1    mov         esi,eax
 00441AB3    mov         eax,esi
 00441AB5    mov         ecx,dword ptr [eax]
 00441AB7    call        dword ptr [ecx-10]
 00441ABA    mov         eax,esi
 00441ABC    call        TWinControl.HandleAllocated
 00441AC1    test        al,al
>00441AC3    je          00441AEB
 00441AC5    push        37
 00441AC7    push        0
 00441AC9    push        0
 00441ACB    push        0
 00441ACD    push        0
 00441ACF    push        0
 00441AD1    mov         eax,esi
 00441AD3    call        TWinControl.GetHandle
 00441AD8    push        eax
 00441AD9    call        user32.SetWindowPos
 00441ADE    cmp         byte ptr [esi+57],0
>00441AE2    je          00441AEB
 00441AE4    mov         eax,esi
 00441AE6    mov         edx,dword ptr [eax]
 00441AE8    call        dword ptr [edx+7C]
 00441AEB    pop         esi
 00441AEC    ret
*}
end;

//00441AF0
procedure TWinControl.CMCtl3DChanged(var Message:TMessage);
begin
{*
 00441AF0    push        ebx
 00441AF1    mov         ebx,eax
 00441AF3    test        byte ptr [ebx+50],10
>00441AF7    je          00441B21
 00441AF9    cmp         dword ptr [ebx+30],0
>00441AFD    je          00441B21
 00441AFF    mov         eax,ebx
 00441B01    call        TWinControl.HandleAllocated
 00441B06    test        al,al
>00441B08    je          00441B21
 00441B0A    mov         eax,dword ptr [ebx+180]
 00441B10    push        eax
 00441B11    call        user32.IsWindowVisible
 00441B16    test        eax,eax
>00441B18    je          00441B21
 00441B1A    mov         eax,ebx
 00441B1C    call        TWinControl.InvalidateFrame
 00441B21    mov         dx,0B011
 00441B25    mov         eax,ebx
 00441B27    call        TWinControl.NotifyControls
 00441B2C    pop         ebx
 00441B2D    ret
*}
end;

//00441B30
procedure TWinControl.CMParentCtl3DChanged(var Message:TMessage);
begin
{*
 00441B30    push        ebx
 00441B31    mov         ebx,eax
 00441B33    cmp         byte ptr [ebx+1A9],0
>00441B3A    je          00441B6B
 00441B3C    cmp         dword ptr [edx+4],0
>00441B40    je          00441B54
 00441B42    cmp         dword ptr [edx+8],0
 00441B46    setne       al
 00441B49    mov         edx,eax
 00441B4B    mov         eax,ebx
 00441B4D    call        TWinControl.SetCtl3D
>00441B52    jmp         00441B64
 00441B54    mov         eax,dword ptr [ebx+30]
 00441B57    mov         dl,byte ptr [eax+1A5]
 00441B5D    mov         eax,ebx
 00441B5F    call        TWinControl.SetCtl3D
 00441B64    mov         byte ptr [ebx+1A9],1
 00441B6B    pop         ebx
 00441B6C    ret
*}
end;

//00441B70
procedure TWinControl.CMSysColorChange;
begin
{*
 00441B70    call        TWinControl.Broadcast
 00441B75    ret
*}
end;

//00441B78
procedure TWinControl.CMWinIniChange;
begin
{*
 00441B78    call        TWinControl.Broadcast
 00441B7D    ret
*}
end;

//00441B80
procedure TWinControl.CMFontChange;
begin
{*
 00441B80    call        TWinControl.Broadcast
 00441B85    ret
*}
end;

//00441B88
procedure TWinControl.CMTimeChange;
begin
{*
 00441B88    call        TWinControl.Broadcast
 00441B8D    ret
*}
end;

//00441B90
procedure TWinControl.CMDrag(var Message:TCMDrag);
begin
{*
 00441B90    push        ebx
 00441B91    push        esi
 00441B92    push        edi
 00441B93    push        ebp
 00441B94    add         esp,0FFFFFFF8
 00441B97    mov         ebx,edx
 00441B99    mov         esi,eax
 00441B9B    mov         edi,dword ptr [ebx+8]
 00441B9E    mov         al,byte ptr [ebx+4]
 00441BA1    sub         al,4
>00441BA3    jb          00441BAB
 00441BA5    dec         al
>00441BA7    je          00441BBD
>00441BA9    jmp         00441BE5
 00441BAB    cmp         dword ptr [edi+0C],0
>00441BAF    je          00441BE5
 00441BB1    mov         edx,ebx
 00441BB3    mov         eax,dword ptr [edi+0C]
 00441BB6    call        TControl.DoDragMsg
>00441BBB    jmp         00441BE5
 00441BBD    push        0
 00441BBF    lea         ecx,[esp+4]
 00441BC3    mov         edx,edi
 00441BC5    mov         eax,esi
 00441BC7    call        TControl.ScreenToClient
 00441BCC    lea         edx,[esp+4]
 00441BD0    xor         ecx,ecx
 00441BD2    mov         eax,esi
 00441BD4    call        TWinControl.ControlAtPos
 00441BD9    mov         ebp,eax
 00441BDB    mov         dword ptr [ebx+0C],ebp
 00441BDE    test        ebp,ebp
>00441BE0    jne         00441BE5
 00441BE2    mov         dword ptr [ebx+0C],esi
 00441BE5    pop         ecx
 00441BE6    pop         edx
 00441BE7    pop         ebp
 00441BE8    pop         edi
 00441BE9    pop         esi
 00441BEA    pop         ebx
 00441BEB    ret
*}
end;

//00441BEC
procedure TWinControl.CMControlListChange(var Message:TMessage);
begin
{*
 00441BEC    push        ebx
 00441BED    mov         ecx,dword ptr [eax+30]
 00441BF0    test        ecx,ecx
>00441BF2    je          00441BFC
 00441BF4    mov         ebx,ecx
 00441BF6    mov         eax,dword ptr [ebx+3C]
 00441BF9    call        dword ptr [ebx+38]
 00441BFC    pop         ebx
 00441BFD    ret
*}
end;

//00441C00
procedure TWinControl.CMSysFontChanged(var Message:TMessage);
begin
{*
 00441C00    push        ebx
 00441C01    push        esi
 00441C02    mov         esi,edx
 00441C04    mov         ebx,eax
 00441C06    mov         edx,esi
 00441C08    mov         eax,ebx
 00441C0A    call        TControl.CMSysFontChanged
 00441C0F    mov         edx,esi
 00441C11    mov         eax,ebx
 00441C13    call        TWinControl.Broadcast
 00441C18    pop         esi
 00441C19    pop         ebx
 00441C1A    ret
*}
end;

//00441C1C
function TWinControl.IsMenuKey(var Message:TWMKey):Boolean;
begin
{*
 00441C1C    push        ebx
 00441C1D    push        esi
 00441C1E    push        edi
 00441C1F    push        ebp
 00441C20    add         esp,0FFFFFFF8
 00441C23    mov         ebp,edx
 00441C25    mov         dword ptr [esp],eax
 00441C28    mov         byte ptr [esp+4],1
 00441C2D    mov         eax,dword ptr [esp]
 00441C30    test        byte ptr [eax+1C],10
>00441C34    jne         00441C8B
 00441C36    mov         ebx,dword ptr [esp]
 00441C39    test        ebx,ebx
>00441C3B    je          00441C6C
 00441C3D    mov         eax,ebx
 00441C3F    mov         si,0FFD6
 00441C43    call        @CallDynaInst
 00441C48    mov         edi,eax
 00441C4A    test        edi,edi
>00441C4C    je          00441C65
 00441C4E    cmp         dword ptr [edi+38],0
>00441C52    je          00441C65
 00441C54    mov         edx,ebp
 00441C56    mov         eax,edi
 00441C58    mov         si,0FFEF
 00441C5C    call        @CallDynaInst
 00441C61    test        al,al
>00441C63    jne         00441CA5
 00441C65    mov         ebx,dword ptr [ebx+30]
 00441C68    test        ebx,ebx
>00441C6A    jne         00441C3D
 00441C6C    mov         eax,dword ptr [esp]
 00441C6F    call        GetParentForm
 00441C74    mov         ebx,eax
 00441C76    test        ebx,ebx
>00441C78    je          00441C8B
 00441C7A    mov         edx,ebp
 00441C7C    mov         eax,ebx
 00441C7E    mov         si,0FFAB
 00441C82    call        @CallDynaInst
 00441C87    test        al,al
>00441C89    jne         00441CA5
 00441C8B    mov         ecx,dword ptr [ebp+8]
 00441C8E    movzx       edx,word ptr [ebp+4]
 00441C92    mov         eax,0B016
 00441C97    call        SendAppMessage
 00441C9C    test        eax,eax
>00441C9E    jne         00441CA5
 00441CA0    mov         byte ptr [esp+4],0
 00441CA5    mov         al,byte ptr [esp+4]
 00441CA9    pop         ecx
 00441CAA    pop         edx
 00441CAB    pop         ebp
 00441CAC    pop         edi
 00441CAD    pop         esi
 00441CAE    pop         ebx
 00441CAF    ret
*}
end;

//00441CB0
procedure TWinControl.CNKeyDown(var Message:TWMKeyDown);
begin
{*
 00441CB0    push        ebx
 00441CB1    push        esi
 00441CB2    push        edi
 00441CB3    mov         esi,edx
 00441CB5    mov         ebx,eax
 00441CB7    mov         dword ptr [esi+0C],1
 00441CBE    mov         dx,word ptr [esi+4]
 00441CC2    mov         eax,ebx
 00441CC4    call        TWinControl.UpdateUIState
 00441CC9    mov         edx,esi
 00441CCB    mov         eax,ebx
 00441CCD    call        TWinControl.IsMenuKey
 00441CD2    test        al,al
>00441CD4    jne         00441D8D
 00441CDA    test        byte ptr [ebx+1C],10
>00441CDE    jne         00441D88
 00441CE4    push        ebx
 00441CE5    movzx       ecx,word ptr [esi+4]
 00441CE9    mov         edx,0B02E
 00441CEE    mov         eax,ebx
 00441CF0    call        TControl.Perform
 00441CF5    test        eax,eax
>00441CF7    jne         00441D8D
 00441CFD    xor         edi,edi
 00441CFF    movzx       eax,word ptr [esi+4]
 00441D03    cmp         eax,1B
>00441D06    jg          00441D1B
>00441D08    je          00441D38
 00441D0A    sub         eax,3
>00441D0D    je          00441D38
 00441D0F    sub         eax,6
>00441D12    je          00441D2A
 00441D14    sub         eax,4
>00441D17    je          00441D38
>00441D19    jmp         00441D3D
 00441D1B    add         eax,0FFFFFFDB
 00441D1E    sub         eax,4
>00441D21    jb          00441D31
 00441D23    sub         eax,2
>00441D26    je          00441D38
>00441D28    jmp         00441D3D
 00441D2A    mov         edi,2
>00441D2F    jmp         00441D3D
 00441D31    mov         edi,1
>00441D36    jmp         00441D3D
 00441D38    mov         edi,4
 00441D3D    test        edi,edi
>00441D3F    je          00441D88
 00441D41    push        0
 00441D43    movzx       ecx,word ptr [esi+4]
 00441D47    mov         edx,0B01E
 00441D4C    mov         eax,ebx
 00441D4E    call        TControl.Perform
 00441D53    test        eax,eax
>00441D55    jne         00441D88
 00441D57    push        0
 00441D59    xor         ecx,ecx
 00441D5B    mov         edx,87
 00441D60    mov         eax,ebx
 00441D62    call        TControl.Perform
 00441D67    test        eax,edi
>00441D69    jne         00441D88
 00441D6B    mov         eax,dword ptr [esi+8]
 00441D6E    push        eax
 00441D6F    mov         eax,ebx
 00441D71    call        GetParentForm
 00441D76    movzx       ecx,word ptr [esi+4]
 00441D7A    mov         edx,0B005
 00441D7F    call        TControl.Perform
 00441D84    test        eax,eax
>00441D86    jne         00441D8D
 00441D88    xor         eax,eax
 00441D8A    mov         dword ptr [esi+0C],eax
 00441D8D    pop         edi
 00441D8E    pop         esi
 00441D8F    pop         ebx
 00441D90    ret
*}
end;

//00441D94
procedure TWinControl.CNKeyUp(var Message:TWMKeyUp);
begin
{*
 00441D94    push        ebx
 00441D95    push        esi
 00441D96    push        edi
 00441D97    mov         esi,edx
 00441D99    mov         ebx,eax
 00441D9B    test        byte ptr [ebx+1C],10
>00441D9F    jne         00441DE1
 00441DA1    mov         di,word ptr [esi+4]
 00441DA5    movzx       eax,di
 00441DA8    cmp         eax,1B
>00441DAB    jg          00441DC0
>00441DAD    je          00441DCD
 00441DAF    sub         eax,3
>00441DB2    je          00441DCD
 00441DB4    sub         eax,6
>00441DB7    je          00441DCD
 00441DB9    sub         eax,4
>00441DBC    je          00441DCD
>00441DBE    jmp         00441DE1
 00441DC0    add         eax,0FFFFFFDB
 00441DC3    sub         eax,4
>00441DC6    jb          00441DCD
 00441DC8    sub         eax,2
>00441DCB    jne         00441DE1
 00441DCD    push        0
 00441DCF    movzx       ecx,di
 00441DD2    mov         edx,0B01E
 00441DD7    mov         eax,ebx
 00441DD9    call        TControl.Perform
 00441DDE    mov         dword ptr [esi+0C],eax
 00441DE1    pop         edi
 00441DE2    pop         esi
 00441DE3    pop         ebx
 00441DE4    ret
*}
end;

//00441DE8
procedure TWinControl.CNChar(var Message:TWMChar);
begin
{*
 00441DE8    push        ebx
 00441DE9    push        esi
 00441DEA    mov         esi,edx
 00441DEC    mov         ebx,eax
 00441DEE    test        byte ptr [ebx+1C],10
>00441DF2    jne         00441E31
 00441DF4    mov         dword ptr [esi+0C],1
 00441DFB    push        0
 00441DFD    xor         ecx,ecx
 00441DFF    mov         edx,87
 00441E04    mov         eax,ebx
 00441E06    call        TControl.Perform
 00441E0B    test        al,80
>00441E0D    jne         00441E2C
 00441E0F    mov         eax,dword ptr [esi+8]
 00441E12    push        eax
 00441E13    mov         eax,ebx
 00441E15    call        GetParentForm
 00441E1A    movzx       ecx,word ptr [esi+4]
 00441E1E    mov         edx,0B006
 00441E23    call        TControl.Perform
 00441E28    test        eax,eax
>00441E2A    jne         00441E31
 00441E2C    xor         eax,eax
 00441E2E    mov         dword ptr [esi+0C],eax
 00441E31    pop         esi
 00441E32    pop         ebx
 00441E33    ret
*}
end;

//00441E34
procedure TWinControl.CNSysKeyDown(var Message:TWMKeyDown);
begin
{*
 00441E34    push        ebx
 00441E35    push        esi
 00441E36    mov         esi,edx
 00441E38    mov         ebx,eax
 00441E3A    mov         dword ptr [esi+0C],1
 00441E41    mov         edx,esi
 00441E43    mov         eax,ebx
 00441E45    call        TWinControl.IsMenuKey
 00441E4A    test        al,al
>00441E4C    jne         00441E8B
 00441E4E    test        byte ptr [ebx+1C],10
>00441E52    jne         00441E86
 00441E54    push        ebx
 00441E55    movzx       ecx,word ptr [esi+4]
 00441E59    mov         edx,0B02E
 00441E5E    mov         eax,ebx
 00441E60    call        TControl.Perform
 00441E65    test        eax,eax
>00441E67    jne         00441E8B
 00441E69    mov         eax,dword ptr [esi+8]
 00441E6C    push        eax
 00441E6D    mov         eax,ebx
 00441E6F    call        GetParentForm
 00441E74    movzx       ecx,word ptr [esi+4]
 00441E78    mov         edx,0B005
 00441E7D    call        TControl.Perform
 00441E82    test        eax,eax
>00441E84    jne         00441E8B
 00441E86    xor         eax,eax
 00441E88    mov         dword ptr [esi+0C],eax
 00441E8B    pop         esi
 00441E8C    pop         ebx
 00441E8D    ret
*}
end;

//00441E90
procedure TWinControl.CNSysChar(var Message:TWMChar);
begin
{*
 00441E90    push        ebx
 00441E91    push        esi
 00441E92    mov         esi,edx
 00441E94    mov         ebx,eax
 00441E96    test        byte ptr [ebx+1C],10
>00441E9A    jne         00441EBF
 00441E9C    cmp         word ptr [esi+4],20
>00441EA1    je          00441EBF
 00441EA3    mov         eax,dword ptr [esi+8]
 00441EA6    push        eax
 00441EA7    mov         eax,ebx
 00441EA9    call        GetParentForm
 00441EAE    movzx       ecx,word ptr [esi+4]
 00441EB2    mov         edx,0B006
 00441EB7    call        TControl.Perform
 00441EBC    mov         dword ptr [esi+0C],eax
 00441EBF    pop         esi
 00441EC0    pop         ebx
 00441EC1    ret
*}
end;

//00441EC4
procedure TWinControl.SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);
begin
{*
 00441EC4    push        ebp
 00441EC5    mov         ebp,esp
 00441EC7    add         esp,0FFFFFFC4
 00441ECA    push        ebx
 00441ECB    push        esi
 00441ECC    push        edi
 00441ECD    mov         edi,ecx
 00441ECF    mov         esi,edx
 00441ED1    mov         ebx,eax
 00441ED3    cmp         esi,dword ptr [ebx+40]
>00441ED6    jne         00441EF1
 00441ED8    cmp         edi,dword ptr [ebx+44]
>00441EDB    jne         00441EF1
 00441EDD    mov         eax,dword ptr [ebp+0C]
 00441EE0    cmp         eax,dword ptr [ebx+48]
>00441EE3    jne         00441EF1
 00441EE5    mov         eax,dword ptr [ebp+8]
 00441EE8    cmp         eax,dword ptr [ebx+4C]
>00441EEB    je          00441F92
 00441EF1    mov         eax,ebx
 00441EF3    call        TWinControl.HandleAllocated
 00441EF8    test        al,al
>00441EFA    je          00441F28
 00441EFC    mov         eax,dword ptr [ebx+180]
 00441F02    push        eax
 00441F03    call        user32.IsIconic
 00441F08    test        eax,eax
>00441F0A    jne         00441F28
 00441F0C    push        14
 00441F0E    mov         eax,dword ptr [ebp+8]
 00441F11    push        eax
 00441F12    mov         eax,dword ptr [ebp+0C]
 00441F15    push        eax
 00441F16    push        edi
 00441F17    push        esi
 00441F18    push        0
 00441F1A    mov         eax,dword ptr [ebx+180]
 00441F20    push        eax
 00441F21    call        user32.SetWindowPos
>00441F26    jmp         00441F80
 00441F28    mov         dword ptr [ebx+40],esi
 00441F2B    mov         dword ptr [ebx+44],edi
 00441F2E    mov         eax,dword ptr [ebp+0C]
 00441F31    mov         dword ptr [ebx+48],eax
 00441F34    mov         eax,dword ptr [ebp+8]
 00441F37    mov         dword ptr [ebx+4C],eax
 00441F3A    mov         eax,ebx
 00441F3C    call        TWinControl.HandleAllocated
 00441F41    test        al,al
>00441F43    je          00441F80
 00441F45    mov         dword ptr [ebp-2C],2C
 00441F4C    lea         eax,[ebp-2C]
 00441F4F    push        eax
 00441F50    mov         eax,dword ptr [ebx+180]
 00441F56    push        eax
 00441F57    call        user32.GetWindowPlacement
 00441F5C    lea         edx,[ebp-3C]
 00441F5F    mov         eax,ebx
 00441F61    call        TControl.GetBoundsRect
 00441F66    lea         esi,[ebp-3C]
 00441F69    lea         edi,[ebp-10]
 00441F6C    movs        dword ptr [edi],dword ptr [esi]
 00441F6D    movs        dword ptr [edi],dword ptr [esi]
 00441F6E    movs        dword ptr [edi],dword ptr [esi]
 00441F6F    movs        dword ptr [edi],dword ptr [esi]
 00441F70    lea         eax,[ebp-2C]
 00441F73    push        eax
 00441F74    mov         eax,dword ptr [ebx+180]
 00441F7A    push        eax
 00441F7B    call        user32.SetWindowPlacement
 00441F80    mov         eax,ebx
 00441F82    call        TControl.UpdateAnchorRules
 00441F87    mov         eax,ebx
 00441F89    mov         si,0FFD0
 00441F8D    call        @CallDynaInst
 00441F92    pop         edi
 00441F93    pop         esi
 00441F94    pop         ebx
 00441F95    mov         esp,ebp
 00441F97    pop         ebp
 00441F98    ret         8
*}
end;

//00441F9C
procedure TWinControl.ScaleControls(M:Integer; D:Integer);
begin
{*
 00441F9C    push        ebx
 00441F9D    push        esi
 00441F9E    push        edi
 00441F9F    push        ebp
 00441FA0    add         esp,0FFFFFFF8
 00441FA3    mov         dword ptr [esp+4],ecx
 00441FA7    mov         dword ptr [esp],edx
 00441FAA    mov         ebp,eax
 00441FAC    mov         eax,ebp
 00441FAE    call        TWinControl.GetControlCount
 00441FB3    mov         ebx,eax
 00441FB5    dec         ebx
 00441FB6    test        ebx,ebx
>00441FB8    jl          00441FDA
 00441FBA    inc         ebx
 00441FBB    xor         edi,edi
 00441FBD    mov         edx,edi
 00441FBF    mov         eax,ebp
 00441FC1    call        TWinControl.GetControl
 00441FC6    mov         ecx,dword ptr [esp+4]
 00441FCA    mov         edx,dword ptr [esp]
 00441FCD    mov         si,0FFEC
 00441FD1    call        @CallDynaInst
 00441FD6    inc         edi
 00441FD7    dec         ebx
>00441FD8    jne         00441FBD
 00441FDA    pop         ecx
 00441FDB    pop         edx
 00441FDC    pop         ebp
 00441FDD    pop         edi
 00441FDE    pop         esi
 00441FDF    pop         ebx
 00441FE0    ret
*}
end;

//00441FE4
procedure TWinControl.ChangeScale(M:Integer; D:Integer);
begin
{*
 00441FE4    push        ebp
 00441FE5    mov         ebp,esp
 00441FE7    push        ecx
 00441FE8    push        ebx
 00441FE9    push        esi
 00441FEA    mov         esi,ecx
 00441FEC    mov         ebx,edx
 00441FEE    mov         dword ptr [ebp-4],eax
 00441FF1    mov         eax,dword ptr [ebp-4]
 00441FF4    call        TWinControl.DisableAlign
 00441FF9    xor         eax,eax
 00441FFB    push        ebp
 00441FFC    push        442082
 00442001    push        dword ptr fs:[eax]
 00442004    mov         dword ptr fs:[eax],esp
 00442007    mov         ecx,esi
 00442009    mov         edx,ebx
 0044200B    mov         eax,dword ptr [ebp-4]
 0044200E    call        TWinControl.ScaleControls
 00442013    cmp         esi,ebx
>00442015    je          00442060
 00442017    mov         eax,dword ptr [ebp-4]
 0044201A    test        byte ptr [eax+1C],2
>0044201E    je          00442060
 00442020    mov         eax,dword ptr [ebp-4]
 00442023    test        byte ptr [eax+98],20
>0044202A    je          00442060
 0044202C    push        esi
 0044202D    push        ebx
 0044202E    mov         eax,dword ptr [ebp-4]
 00442031    mov         eax,dword ptr [eax+1FA]
 00442037    push        eax
 00442038    call        KERNEL32.MulDiv
 0044203D    mov         edx,dword ptr [ebp-4]
 00442040    mov         dword ptr [edx+1FA],eax
 00442046    push        esi
 00442047    push        ebx
 00442048    mov         eax,dword ptr [ebp-4]
 0044204B    mov         eax,dword ptr [eax+1FE]
 00442051    push        eax
 00442052    call        KERNEL32.MulDiv
 00442057    mov         edx,dword ptr [ebp-4]
 0044205A    mov         dword ptr [edx+1FE],eax
 00442060    mov         ecx,esi
 00442062    mov         edx,ebx
 00442064    mov         eax,dword ptr [ebp-4]
 00442067    call        TControl.ChangeScale
 0044206C    xor         eax,eax
 0044206E    pop         edx
 0044206F    pop         ecx
 00442070    pop         ecx
 00442071    mov         dword ptr fs:[eax],edx
 00442074    push        442089
 00442079    mov         eax,dword ptr [ebp-4]
 0044207C    call        TWinControl.EnableAlign
 00442081    ret
>00442082    jmp         @HandleFinally
>00442087    jmp         00442079
 00442089    pop         esi
 0044208A    pop         ebx
 0044208B    pop         ecx
 0044208C    pop         ebp
 0044208D    ret
*}
end;

//00442090
procedure TWinControl.ScrollBy(DeltaX:Integer; DeltaY:Integer);
begin
{*
 00442090    push        ebx
 00442091    push        esi
 00442092    push        edi
 00442093    push        ebp
 00442094    add         esp,0FFFFFFF4
 00442097    mov         dword ptr [esp+4],ecx
 0044209B    mov         dword ptr [esp],edx
 0044209E    mov         edi,eax
 004420A0    mov         ebx,dword ptr [edi+180]
 004420A6    test        ebx,ebx
>004420A8    je          004420B4
 004420AA    push        ebx
 004420AB    call        user32.IsWindowVisible
 004420B0    test        eax,eax
>004420B2    jne         004420B8
 004420B4    xor         eax,eax
>004420B6    jmp         004420BA
 004420B8    mov         al,1
 004420BA    mov         byte ptr [esp+8],al
 004420BE    cmp         byte ptr [esp+8],0
>004420C3    je          004420DF
 004420C5    push        0
 004420C7    push        0
 004420C9    mov         eax,dword ptr [esp+0C]
 004420CD    push        eax
 004420CE    mov         eax,dword ptr [esp+0C]
 004420D2    push        eax
 004420D3    mov         eax,dword ptr [edi+180]
 004420D9    push        eax
 004420DA    call        user32.ScrollWindow
 004420DF    mov         eax,edi
 004420E1    call        TWinControl.GetControlCount
 004420E6    mov         esi,eax
 004420E8    dec         esi
 004420E9    test        esi,esi
>004420EB    jl          00442159
 004420ED    inc         esi
 004420EE    xor         ebp,ebp
 004420F0    mov         edx,ebp
 004420F2    mov         eax,edi
 004420F4    call        TWinControl.GetControl
 004420F9    mov         ebx,eax
 004420FB    mov         eax,ebx
 004420FD    mov         edx,dword ptr ds:[4380F4];TWinControl
 00442103    call        @IsClass
 00442108    test        al,al
>0044210A    je          00442115
 0044210C    cmp         dword ptr [ebx+180],0
>00442113    jne         00442124
 00442115    mov         eax,dword ptr [esp]
 00442118    add         dword ptr [ebx+40],eax
 0044211B    mov         eax,dword ptr [esp+4]
 0044211F    add         dword ptr [ebx+44],eax
>00442122    jmp         00442155
 00442124    cmp         byte ptr [esp+8],0
>00442129    jne         00442155
 0044212B    push        14
 0044212D    mov         eax,ebx
 0044212F    mov         edx,dword ptr [eax+4C]
 00442132    push        edx
 00442133    mov         edx,dword ptr [eax+48]
 00442136    push        edx
 00442137    mov         edx,dword ptr [eax+44]
 0044213A    add         edx,dword ptr [esp+10]
 0044213E    push        edx
 0044213F    mov         edx,dword ptr [eax+40]
 00442142    add         edx,dword ptr [esp+10]
 00442146    push        edx
 00442147    push        0
 00442149    mov         eax,dword ptr [eax+180]
 0044214F    push        eax
 00442150    call        user32.SetWindowPos
 00442155    inc         ebp
 00442156    dec         esi
>00442157    jne         004420F0
 00442159    mov         eax,edi
 0044215B    call        TWinControl.Realign
 00442160    add         esp,0C
 00442163    pop         ebp
 00442164    pop         edi
 00442165    pop         esi
 00442166    pop         ebx
 00442167    ret
*}
end;

//00442168
procedure TWinControl.ShowControl(AControl:TControl);
begin
{*
 00442168    push        esi
 00442169    mov         esi,dword ptr [eax+30]
 0044216C    test        esi,esi
>0044216E    je          0044217C
 00442170    mov         edx,eax
 00442172    mov         eax,esi
 00442174    mov         ecx,dword ptr [eax]
 00442176    call        dword ptr [ecx+0C0]
 0044217C    pop         esi
 0044217D    ret
*}
end;

//00442180
procedure TWinControl.SetZOrderPosition(Position:Integer);
begin
{*
 00442180    push        ebx
 00442181    push        esi
 00442182    push        edi
 00442183    push        ebp
 00442184    mov         esi,edx
 00442186    mov         ebx,eax
 00442188    mov         eax,dword ptr [ebx+30]
 0044218B    test        eax,eax
>0044218D    je          00442252
 00442193    mov         edx,dword ptr [eax+198]
 00442199    test        edx,edx
>0044219B    je          004421A0
 0044219D    sub         esi,dword ptr [edx+8]
 004421A0    mov         eax,dword ptr [eax+19C]
 004421A6    mov         edx,ebx
 004421A8    call        TList.IndexOf
 004421AD    mov         edi,eax
 004421AF    test        edi,edi
>004421B1    jl          004421EB
 004421B3    mov         eax,dword ptr [ebx+30]
 004421B6    mov         edx,dword ptr [eax+19C]
 004421BC    mov         eax,dword ptr [edx+8]
 004421BF    test        esi,esi
>004421C1    jge         004421C5
 004421C3    xor         esi,esi
 004421C5    cmp         eax,esi
>004421C7    jg          004421CC
 004421C9    mov         esi,eax
 004421CB    dec         esi
 004421CC    cmp         edi,esi
>004421CE    je          004421EB
 004421D0    mov         eax,edx
 004421D2    mov         edx,edi
 004421D4    call        TList.Delete
 004421D9    mov         eax,dword ptr [ebx+30]
 004421DC    mov         eax,dword ptr [eax+19C]
 004421E2    mov         ecx,ebx
 004421E4    mov         edx,esi
 004421E6    call        TList.Insert
 004421EB    cmp         dword ptr [ebx+180],0
>004421F2    je          00442252
 004421F4    test        esi,esi
>004421F6    jne         004421FF
 004421F8    mov         eax,1
>004421FD    jmp         0044223B
 004421FF    mov         eax,dword ptr [ebx+30]
 00442202    mov         ebp,dword ptr [eax+19C]
 00442208    mov         eax,dword ptr [ebp+8]
 0044220B    dec         eax
 0044220C    cmp         esi,eax
>0044220E    jne         00442214
 00442210    xor         eax,eax
>00442212    jmp         0044223B
 00442214    cmp         edi,esi
>00442216    jge         00442229
 00442218    lea         edx,[esi+1]
 0044221B    mov         eax,ebp
 0044221D    call        TList.Get
 00442222    call        TWinControl.GetHandle
>00442227    jmp         0044223B
 00442229    cmp         edi,esi
>0044222B    jle         00442252
 0044222D    mov         eax,ebp
 0044222F    mov         edx,esi
 00442231    call        TList.Get
 00442236    call        TWinControl.GetHandle
 0044223B    push        3
 0044223D    push        0
 0044223F    push        0
 00442241    push        0
 00442243    push        0
 00442245    push        eax
 00442246    mov         eax,dword ptr [ebx+180]
 0044224C    push        eax
 0044224D    call        user32.SetWindowPos
 00442252    pop         ebp
 00442253    pop         edi
 00442254    pop         esi
 00442255    pop         ebx
 00442256    ret
*}
end;

//00442258
procedure TWinControl.SetZOrder(TopMost:Boolean);
begin
{*
 00442258    push        ebx
 00442259    push        esi
 0044225A    mov         ebx,dword ptr [eax+30]
 0044225D    test        ebx,ebx
>0044225F    je          0044228E
 00442261    test        dl,dl
>00442263    je          00442271
 00442265    mov         edx,dword ptr [ebx+19C]
 0044226B    mov         ecx,dword ptr [edx+8]
 0044226E    dec         ecx
>0044226F    jmp         00442273
 00442271    xor         ecx,ecx
 00442273    xor         edx,edx
 00442275    mov         esi,dword ptr [ebx+198]
 0044227B    test        esi,esi
>0044227D    je          00442282
 0044227F    mov         edx,dword ptr [esi+8]
 00442282    add         ecx,edx
 00442284    mov         edx,ecx
 00442286    call        TWinControl.SetZOrderPosition
 0044228B    pop         esi
 0044228C    pop         ebx
 0044228D    ret
 0044228E    mov         ecx,dword ptr [eax+180]
 00442294    test        ecx,ecx
>00442296    je          004422B4
 00442298    push        3
 0044229A    push        0
 0044229C    push        0
 0044229E    push        0
 004422A0    push        0
 004422A2    and         edx,7F
 004422A5    movzx       edx,word ptr [edx*2+5ACC30];WINDOWPOS
 004422AD    push        edx
 004422AE    push        ecx
 004422AF    call        user32.SetWindowPos
 004422B4    pop         esi
 004422B5    pop         ebx
 004422B6    ret
*}
end;

//004422B8
function TWinControl.GetDeviceContext(var WindowHandle:HWND):HDC;
begin
{*
 004422B8    push        ebx
 004422B9    push        esi
 004422BA    mov         esi,edx
 004422BC    mov         ebx,eax
 004422BE    test        byte ptr [ebx+1C],10
>004422C2    je          004422D7
 004422C4    push        12
 004422C6    push        0
 004422C8    mov         eax,ebx
 004422CA    call        TWinControl.GetHandle
 004422CF    push        eax
 004422D0    call        user32.GetDCEx
>004422D5    jmp         004422E4
 004422D7    mov         eax,ebx
 004422D9    call        TWinControl.GetHandle
 004422DE    push        eax
 004422DF    call        user32.GetDC
 004422E4    test        eax,eax
>004422E6    jne         004422FF
 004422E8    mov         ecx,dword ptr ds:[5AE544];^SWindowDCError:TResStringRec
 004422EE    mov         dl,1
 004422F0    mov         eax,[00417C30];EOutOfResources
 004422F5    call        Exception.CreateRes
 004422FA    call        @RaiseExcept
 004422FF    mov         edx,dword ptr [ebx+180]
 00442305    mov         dword ptr [esi],edx
 00442307    pop         esi
 00442308    pop         ebx
 00442309    ret
*}
end;

//0044230C
procedure TWinControl.Invalidate;
begin
{*
 0044230C    push        0
 0044230E    xor         ecx,ecx
 00442310    mov         edx,0B034
 00442315    call        TControl.Perform
 0044231A    ret
*}
end;

//0044231C
procedure TWinControl.CMInvalidate(var Message:TMessage);
begin
{*
 0044231C    push        ebx
 0044231D    push        esi
 0044231E    push        edi
 0044231F    mov         esi,edx
 00442321    mov         ebx,eax
 00442323    mov         eax,ebx
 00442325    call        TWinControl.HandleAllocated
 0044232A    test        al,al
>0044232C    je          004423A8
 0044232E    mov         eax,dword ptr [ebx+30]
 00442331    test        eax,eax
>00442333    je          00442346
 00442335    push        0
 00442337    mov         ecx,1
 0044233C    mov         edx,0B034
 00442341    call        TControl.Perform
 00442346    cmp         dword ptr [esi+4],0
>0044234A    jne         004423A8
 0044234C    test        byte ptr [ebx+50],40
 00442350    setne       al
 00442353    xor         al,1
 00442355    neg         al
 00442357    sbb         eax,eax
 00442359    push        eax
 0044235A    push        0
 0044235C    mov         eax,dword ptr [ebx+180]
 00442362    push        eax
 00442363    call        user32.InvalidateRect
 00442368    call        ThemeServices
 0044236D    call        TThemeServices.GetThemesEnabled
 00442372    test        al,al
>00442374    je          004423A8
 00442376    mov         eax,ebx
 00442378    call        TWinControl.GetControlCount
 0044237D    mov         edi,eax
 0044237F    dec         edi
 00442380    test        edi,edi
>00442382    jl          004423A8
 00442384    inc         edi
 00442385    xor         esi,esi
 00442387    mov         edx,esi
 00442389    mov         eax,ebx
 0044238B    call        TWinControl.GetControl
 00442390    test        byte ptr [eax+52],4
>00442394    je          004423A4
 00442396    mov         edx,esi
 00442398    mov         eax,ebx
 0044239A    call        TWinControl.GetControl
 0044239F    mov         edx,dword ptr [eax]
 004423A1    call        dword ptr [edx+7C]
 004423A4    inc         esi
 004423A5    dec         edi
>004423A6    jne         00442387
 004423A8    pop         edi
 004423A9    pop         esi
 004423AA    pop         ebx
 004423AB    ret
*}
end;

//004423AC
procedure TWinControl.Update;
begin
{*
 004423AC    push        ebx
 004423AD    mov         ebx,eax
 004423AF    mov         eax,ebx
 004423B1    call        TWinControl.HandleAllocated
 004423B6    test        al,al
>004423B8    je          004423C6
 004423BA    mov         eax,dword ptr [ebx+180]
 004423C0    push        eax
 004423C1    call        user32.UpdateWindow
 004423C6    pop         ebx
 004423C7    ret
*}
end;

//004423C8
procedure TWinControl.Repaint;
begin
{*
 004423C8    push        ebx
 004423C9    mov         ebx,eax
 004423CB    mov         eax,ebx
 004423CD    mov         edx,dword ptr [eax]
 004423CF    call        dword ptr [edx+7C]
 004423D2    mov         eax,ebx
 004423D4    mov         edx,dword ptr [eax]
 004423D6    call        dword ptr [edx+88]
 004423DC    pop         ebx
 004423DD    ret
*}
end;

//004423E0
procedure TWinControl.InvalidateFrame;
begin
{*
 004423E0    push        ebx
 004423E1    add         esp,0FFFFFFF0
 004423E4    mov         ebx,eax
 004423E6    mov         edx,esp
 004423E8    mov         eax,ebx
 004423EA    call        TControl.GetBoundsRect
 004423EF    push        1
 004423F1    push        1
 004423F3    lea         eax,[esp+8]
 004423F7    push        eax
 004423F8    call        user32.InflateRect
 004423FD    push        0FF
 004423FF    lea         eax,[esp+4]
 00442403    push        eax
 00442404    mov         eax,dword ptr [ebx+30]
 00442407    mov         eax,dword ptr [eax+180]
 0044240D    push        eax
 0044240E    call        user32.InvalidateRect
 00442413    add         esp,10
 00442416    pop         ebx
 00442417    ret
*}
end;

//00442418
procedure TWinControl.CanFocus;
begin
{*
 00442418    push        ebx
 00442419    push        esi
 0044241A    push        ecx
 0044241B    mov         ebx,eax
 0044241D    mov         byte ptr [esp],0
 00442421    mov         eax,ebx
 00442423    call        GetParentForm
 00442428    mov         esi,eax
 0044242A    test        esi,esi
>0044242C    je          0044244E
 0044242E    cmp         esi,ebx
>00442430    je          0044244A
 00442432    cmp         byte ptr [ebx+57],0
>00442436    je          0044244E
 00442438    mov         eax,ebx
 0044243A    mov         edx,dword ptr [eax]
 0044243C    call        dword ptr [edx+50]
 0044243F    test        al,al
>00442441    je          0044244E
 00442443    mov         ebx,dword ptr [ebx+30]
 00442446    cmp         esi,ebx
>00442448    jne         00442432
 0044244A    mov         byte ptr [esp],1
 0044244E    mov         al,byte ptr [esp]
 00442451    pop         edx
 00442452    pop         esi
 00442453    pop         ebx
 00442454    ret
*}
end;

//00442458
procedure TWinControl.SetFocus;
begin
{*
 00442458    push        ebx
 00442459    mov         ebx,eax
 0044245B    mov         eax,ebx
 0044245D    call        GetParentForm
 00442462    test        eax,eax
>00442464    je          0044246F
 00442466    mov         edx,ebx
 00442468    call        TCustomForm.FocusControl
 0044246D    pop         ebx
 0044246E    ret
 0044246F    cmp         dword ptr [ebx+190],0
>00442476    je          00442487
 00442478    mov         eax,ebx
 0044247A    call        TWinControl.GetHandle
 0044247F    push        eax
 00442480    call        user32.SetFocus
>00442485    jmp         0044248E
 00442487    mov         eax,ebx
 00442489    call        ValidParentForm
 0044248E    pop         ebx
 0044248F    ret
*}
end;

//00442490
procedure TWinControl.Focused;
begin
{*
 00442490    push        ebx
 00442491    mov         ebx,eax
 00442493    cmp         dword ptr [ebx+180],0
>0044249A    je          004424A9
 0044249C    call        user32.GetFocus
 004424A1    cmp         eax,dword ptr [ebx+180]
>004424A7    je          004424AD
 004424A9    xor         eax,eax
 004424AB    pop         ebx
 004424AC    ret
 004424AD    mov         al,1
 004424AF    pop         ebx
 004424B0    ret
*}
end;

//004424B4
procedure TWinControl.HandleNeeded;
begin
{*
 004424B4    push        ebx
 004424B5    mov         ebx,eax
 004424B7    cmp         dword ptr [ebx+180],0
>004424BE    jne         004424D6
 004424C0    mov         eax,dword ptr [ebx+30]
 004424C3    test        eax,eax
>004424C5    je          004424CC
 004424C7    call        TWinControl.HandleNeeded
 004424CC    mov         eax,ebx
 004424CE    mov         edx,dword ptr [eax]
 004424D0    call        dword ptr [edx+94]
 004424D6    pop         ebx
 004424D7    ret
*}
end;

//004424D8
function TWinControl.GetHandle:HWND;
begin
{*
 004424D8    push        ebx
 004424D9    mov         ebx,eax
 004424DB    mov         eax,ebx
 004424DD    call        TWinControl.HandleNeeded
 004424E2    mov         eax,dword ptr [ebx+180]
 004424E8    pop         ebx
 004424E9    ret
*}
end;

//004424EC
{*procedure sub_004424EC(?:?);
begin
 004424EC    push        ebx
 004424ED    push        esi
 004424EE    push        edi
 004424EF    push        ebp
 004424F0    mov         ebx,edx
 004424F2    mov         edi,eax
 004424F4    push        0
 004424F6    push        ebx
 004424F7    xor         ecx,ecx
 004424F9    mov         edx,7FFFFFFF
 004424FE    mov         eax,7FFFFFFF
 00442503    call        Bounds
 00442508    mov         eax,edi
 0044250A    call        TWinControl.GetControlCount
 0044250F    mov         esi,eax
 00442511    dec         esi
 00442512    test        esi,esi
>00442514    jl          0044257A
 00442516    inc         esi
 00442517    xor         ebp,ebp
 00442519    mov         edx,ebp
 0044251B    mov         eax,edi
 0044251D    call        TWinControl.GetControl
 00442522    cmp         byte ptr [eax+57],0;TControl.FVisible:Boolean
>00442526    jne         00442534
 00442528    test        byte ptr [eax+1C],10;TControl.FComponentState:TComponentState
>0044252C    je          00442576
 0044252E    test        byte ptr [eax+51],4;TControl.?f51:byte
>00442532    jne         00442576
 00442534    mov         edx,dword ptr [ebx]
 00442536    cmp         edx,dword ptr [eax+40];TControl.Left:Integer
>00442539    jle         00442540
 0044253B    mov         edx,dword ptr [eax+40];TControl.Left:Integer
 0044253E    mov         dword ptr [ebx],edx
 00442540    mov         edx,dword ptr [ebx+4]
 00442543    cmp         edx,dword ptr [eax+44];TControl.Top:Integer
>00442546    jle         0044254E
 00442548    mov         edx,dword ptr [eax+44];TControl.Top:Integer
 0044254B    mov         dword ptr [ebx+4],edx
 0044254E    mov         edx,dword ptr [eax+40];TControl.Left:Integer
 00442551    add         edx,dword ptr [eax+48];TControl.Width:Integer
 00442554    cmp         edx,dword ptr [ebx+8]
>00442557    jle         00442562
 00442559    mov         edx,dword ptr [eax+40];TControl.Left:Integer
 0044255C    add         edx,dword ptr [eax+48];TControl.Width:Integer
 0044255F    mov         dword ptr [ebx+8],edx
 00442562    mov         edx,dword ptr [eax+44];TControl.Top:Integer
 00442565    add         edx,dword ptr [eax+4C];TControl.Height:Integer
 00442568    cmp         edx,dword ptr [ebx+0C]
>0044256B    jle         00442576
 0044256D    mov         edx,dword ptr [eax+44];TControl.Top:Integer
 00442570    add         edx,dword ptr [eax+4C];TControl.Height:Integer
 00442573    mov         dword ptr [ebx+0C],edx
 00442576    inc         ebp
 00442577    dec         esi
>00442578    jne         00442519
 0044257A    pop         ebp
 0044257B    pop         edi
 0044257C    pop         esi
 0044257D    pop         ebx
 0044257E    ret
end;*}

//00442580
function TWinControl.GetClientOrigin:TPoint;
begin
{*
 00442580    push        ebx
 00442581    push        esi
 00442582    mov         ebx,edx
 00442584    mov         esi,eax
 00442586    xor         eax,eax
 00442588    mov         dword ptr [ebx],eax
 0044258A    xor         eax,eax
 0044258C    mov         dword ptr [ebx+4],eax
 0044258F    push        ebx
 00442590    mov         eax,esi
 00442592    call        TWinControl.GetHandle
 00442597    push        eax
 00442598    call        user32.ClientToScreen
 0044259D    pop         esi
 0044259E    pop         ebx
 0044259F    ret
*}
end;

//004425A0
function TWinControl.GetClientRect:TRect;
begin
{*
 004425A0    push        ebx
 004425A1    push        esi
 004425A2    mov         esi,edx
 004425A4    mov         ebx,eax
 004425A6    push        esi
 004425A7    mov         eax,ebx
 004425A9    call        TWinControl.GetHandle
 004425AE    push        eax
 004425AF    call        user32.GetClientRect
 004425B4    pop         esi
 004425B5    pop         ebx
 004425B6    ret
*}
end;

//004425B8
procedure TWinControl.AdjustSize;
begin
{*
 004425B8    push        ebx
 004425B9    push        esi
 004425BA    mov         ebx,eax
 004425BC    test        byte ptr [ebx+1C],1
>004425C0    jne         004425F5
 004425C2    mov         eax,ebx
 004425C4    call        TWinControl.HandleAllocated
 004425C9    test        al,al
>004425CB    je          004425F5
 004425CD    push        16
 004425CF    mov         eax,dword ptr [ebx+4C]
 004425D2    push        eax
 004425D3    mov         eax,dword ptr [ebx+48]
 004425D6    push        eax
 004425D7    push        0
 004425D9    push        0
 004425DB    push        0
 004425DD    mov         eax,ebx
 004425DF    call        TWinControl.GetHandle
 004425E4    push        eax
 004425E5    call        user32.SetWindowPos
 004425EA    mov         eax,ebx
 004425EC    mov         si,0FFD0
 004425F0    call        @CallDynaInst
 004425F5    pop         esi
 004425F6    pop         ebx
 004425F7    ret
*}
end;

//004425F8
procedure TWinControl.SetBorderWidth(Value:TBorderWidth);
begin
{*
 004425F8    cmp         edx,dword ptr [eax+16C]
>004425FE    je          00442614
 00442600    mov         dword ptr [eax+16C],edx
 00442606    push        0
 00442608    xor         ecx,ecx
 0044260A    mov         edx,0B03B
 0044260F    call        TControl.Perform
 00442614    ret
*}
end;

//00442618
procedure TWinControl.SetCtl3D(Value:Boolean);
begin
{*
 00442618    cmp         dl,byte ptr [eax+1A5]
>0044261E    je          0044263B
 00442620    mov         byte ptr [eax+1A5],dl
 00442626    mov         byte ptr [eax+1A9],0
 0044262D    push        0
 0044262F    xor         ecx,ecx
 00442631    mov         edx,0B010
 00442636    call        TControl.Perform
 0044263B    ret
*}
end;

//0044263C
function TWinControl.IsCtl3DStored(Value:Boolean):Boolean;
begin
{*
 0044263C    mov         al,byte ptr [eax+1A9]
 00442642    xor         al,1
 00442644    ret
*}
end;

//00442648
function TWinControl.GetTabOrder:TTabOrder;
begin
{*
 00442648    push        ebx
 00442649    push        esi
 0044264A    mov         ebx,eax
 0044264C    mov         esi,dword ptr [ebx+30]
 0044264F    test        esi,esi
>00442651    je          00442663
 00442653    mov         eax,dword ptr [esi+194]
 00442659    mov         edx,ebx
 0044265B    call        TList.IndexOf
 00442660    pop         esi
 00442661    pop         ebx
 00442662    ret
 00442663    or          eax,0FFFFFFFF
 00442666    pop         esi
 00442667    pop         ebx
 00442668    ret
*}
end;

//0044266C
procedure TWinControl.UpdateTabOrder(Value:TTabOrder);
begin
{*
 0044266C    push        ebx
 0044266D    push        esi
 0044266E    push        edi
 0044266F    push        ebp
 00442670    mov         esi,edx
 00442672    mov         ebx,eax
 00442674    mov         eax,ebx
 00442676    call        TWinControl.GetTabOrder
 0044267B    movsx       eax,ax
 0044267E    test        eax,eax
>00442680    jl          004426C0
 00442682    mov         edx,dword ptr [ebx+30]
 00442685    mov         ebp,dword ptr [edx+194]
 0044268B    mov         edx,dword ptr [ebp+8]
 0044268E    test        si,si
>00442691    jge         00442695
 00442693    xor         esi,esi
 00442695    movsx       ecx,si
 00442698    cmp         edx,ecx
>0044269A    jg          0044269F
 0044269C    mov         esi,edx
 0044269E    dec         esi
 0044269F    movsx       edi,si
 004426A2    cmp         eax,edi
>004426A4    je          004426C0
 004426A6    mov         edx,ebp
 004426A8    xchg        eax,edx
 004426A9    call        TList.Delete
 004426AE    mov         edx,edi
 004426B0    mov         eax,dword ptr [ebx+30]
 004426B3    mov         eax,dword ptr [eax+194]
 004426B9    mov         ecx,ebx
 004426BB    call        TList.Insert
 004426C0    pop         ebp
 004426C1    pop         edi
 004426C2    pop         esi
 004426C3    pop         ebx
 004426C4    ret
*}
end;

//004426C8
procedure TWinControl.SetTabOrder(Value:TTabOrder);
begin
{*
 004426C8    test        byte ptr [eax+54],8
>004426CC    je          004426D8
 004426CE    movsx       edx,dx
 004426D1    mov         dword ptr [eax+1A0],edx
 004426D7    ret
 004426D8    call        TWinControl.UpdateTabOrder
 004426DD    ret
*}
end;

//004426E0
procedure TWinControl.SetTabStop(Value:Boolean);
begin
{*
 004426E0    push        ebx
 004426E1    push        esi
 004426E2    mov         ebx,edx
 004426E4    mov         esi,eax
 004426E6    cmp         bl,byte ptr [esi+1A4]
>004426EC    je          0044273A
 004426EE    mov         byte ptr [esi+1A4],bl
 004426F4    mov         eax,esi
 004426F6    call        TWinControl.HandleAllocated
 004426FB    test        al,al
>004426FD    je          0044272A
 004426FF    push        0F0
 00442701    mov         eax,dword ptr [esi+180]
 00442707    push        eax
 00442708    call        user32.GetWindowLongA
 0044270D    and         eax,0FFFEFFFF
 00442712    test        bl,bl
>00442714    je          0044271B
 00442716    or          eax,10000
 0044271B    push        eax
 0044271C    push        0F0
 0044271E    mov         eax,dword ptr [esi+180]
 00442724    push        eax
 00442725    call        user32.SetWindowLongA
 0044272A    push        0
 0044272C    xor         ecx,ecx
 0044272E    mov         edx,0B028
 00442733    mov         eax,esi
 00442735    call        TControl.Perform
 0044273A    pop         esi
 0044273B    pop         ebx
 0044273C    ret
*}
end;

//00442740
procedure TWinControl.SetUseDockManager(Value:Boolean);
begin
{*
 00442740    push        ebp
 00442741    mov         ebp,esp
 00442743    push        0
 00442745    push        ebx
 00442746    push        esi
 00442747    mov         ebx,eax
 00442749    xor         eax,eax
 0044274B    push        ebp
 0044274C    push        4427A4
 00442751    push        dword ptr fs:[eax]
 00442754    mov         dword ptr fs:[eax],esp
 00442757    cmp         dl,byte ptr [ebx+1A7]
>0044275D    je          0044278E
 0044275F    mov         byte ptr [ebx+1A7],dl
 00442765    test        byte ptr [ebx+1C],10
 00442769    setne       al
 0044276C    xor         al,1
 0044276E    test        al,dl
>00442770    je          0044278E
 00442772    lea         edx,[ebp-4]
 00442775    mov         eax,ebx
 00442777    mov         si,0FFC6
 0044277B    call        @CallDynaInst
 00442780    mov         edx,dword ptr [ebp-4]
 00442783    lea         eax,[ebx+17C]
 00442789    call        @IntfCopy
 0044278E    xor         eax,eax
 00442790    pop         edx
 00442791    pop         ecx
 00442792    pop         ecx
 00442793    mov         dword ptr fs:[eax],edx
 00442796    push        4427AB
 0044279B    lea         eax,[ebp-4]
 0044279E    call        @IntfClear
 004427A3    ret
>004427A4    jmp         @HandleFinally
>004427A9    jmp         0044279B
 004427AB    pop         esi
 004427AC    pop         ebx
 004427AD    pop         ecx
 004427AE    pop         ebp
 004427AF    ret
*}
end;

//004427B0
function TWinControl.HandleAllocated:Boolean;
begin
{*
 004427B0    cmp         dword ptr [eax+180],0
 004427B7    setne       al
 004427BA    ret
*}
end;

//004427BC
procedure TWinControl.UpdateBounds;
begin
{*
 004427BC    push        ebx
 004427BD    push        esi
 004427BE    push        edi
 004427BF    add         esp,0FFFFFFC4
 004427C2    mov         ebx,eax
 004427C4    mov         eax,dword ptr [ebx+180]
 004427CA    push        eax
 004427CB    call        user32.IsIconic
 004427D0    test        eax,eax
>004427D2    je          004427F9
 004427D4    mov         dword ptr [esp+10],2C
 004427DC    lea         eax,[esp+10]
 004427E0    push        eax
 004427E1    mov         eax,dword ptr [ebx+180]
 004427E7    push        eax
 004427E8    call        user32.GetWindowPlacement
 004427ED    lea         esi,[esp+2C]
 004427F1    mov         edi,esp
 004427F3    movs        dword ptr [edi],dword ptr [esi]
 004427F4    movs        dword ptr [edi],dword ptr [esi]
 004427F5    movs        dword ptr [edi],dword ptr [esi]
 004427F6    movs        dword ptr [edi],dword ptr [esi]
>004427F7    jmp         00442806
 004427F9    push        esp
 004427FA    mov         eax,dword ptr [ebx+180]
 00442800    push        eax
 00442801    call        user32.GetWindowRect
 00442806    push        0F0
 00442808    mov         eax,dword ptr [ebx+180]
 0044280E    push        eax
 0044280F    call        user32.GetWindowLongA
 00442814    test        eax,40000000
>00442819    je          00442841
 0044281B    push        0F8
 0044281D    mov         eax,dword ptr [ebx+180]
 00442823    push        eax
 00442824    call        user32.GetWindowLongA
 00442829    mov         esi,eax
 0044282B    test        esi,esi
>0044282D    je          00442841
 0044282F    push        esp
 00442830    push        esi
 00442831    call        user32.ScreenToClient
 00442836    lea         eax,[esp+8]
 0044283A    push        eax
 0044283B    push        esi
 0044283C    call        user32.ScreenToClient
 00442841    mov         eax,dword ptr [esp]
 00442844    mov         dword ptr [ebx+40],eax
 00442847    mov         eax,dword ptr [esp+4]
 0044284B    mov         dword ptr [ebx+44],eax
 0044284E    mov         eax,dword ptr [esp+8]
 00442852    sub         eax,dword ptr [esp]
 00442855    mov         dword ptr [ebx+48],eax
 00442858    mov         eax,dword ptr [esp+0C]
 0044285C    sub         eax,dword ptr [esp+4]
 00442860    mov         dword ptr [ebx+4C],eax
 00442863    mov         eax,ebx
 00442865    call        TControl.UpdateAnchorRules
 0044286A    add         esp,3C
 0044286D    pop         edi
 0044286E    pop         esi
 0044286F    pop         ebx
 00442870    ret
*}
end;

//00442874
procedure TWinControl.GetTabOrderList(List:TList);
begin
{*
 00442874    push        ebx
 00442875    push        esi
 00442876    push        edi
 00442877    push        ebp
 00442878    add         esp,0FFFFFFF8
 0044287B    mov         dword ptr [esp],edx
 0044287E    mov         ebp,eax
 00442880    mov         eax,dword ptr [ebp+194]
 00442886    test        eax,eax
>00442888    je          004428CB
 0044288A    mov         edi,dword ptr [eax+8]
 0044288D    dec         edi
 0044288E    test        edi,edi
>00442890    jl          004428CB
 00442892    inc         edi
 00442893    mov         dword ptr [esp+4],0
 0044289B    mov         eax,dword ptr [ebp+194]
 004428A1    mov         edx,dword ptr [esp+4]
 004428A5    call        TList.Get
 004428AA    mov         ebx,eax
 004428AC    mov         edx,ebx
 004428AE    mov         eax,dword ptr [esp]
 004428B1    call        TList.Add
 004428B6    mov         edx,dword ptr [esp]
 004428B9    mov         eax,ebx
 004428BB    mov         si,0FFB4
 004428BF    call        @CallDynaInst
 004428C4    inc         dword ptr [esp+4]
 004428C8    dec         edi
>004428C9    jne         0044289B
 004428CB    pop         ecx
 004428CC    pop         edx
 004428CD    pop         ebp
 004428CE    pop         edi
 004428CF    pop         esi
 004428D0    pop         ebx
 004428D1    ret
*}
end;

//004428D4
function TWinControl.FindNextControl(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean; CheckParent:Boolean):TWinControl;
begin
{*
 004428D4    push        ebp
 004428D5    mov         ebp,esp
 004428D7    add         esp,0FFFFFFEC
 004428DA    push        ebx
 004428DB    push        esi
 004428DC    push        edi
 004428DD    mov         byte ptr [ebp-5],cl
 004428E0    mov         edi,edx
 004428E2    mov         dword ptr [ebp-4],eax
 004428E5    xor         eax,eax
 004428E7    mov         dword ptr [ebp-0C],eax
 004428EA    mov         dl,1
 004428EC    mov         eax,[00417CEC];TList
 004428F1    call        TObject.Create
 004428F6    mov         dword ptr [ebp-14],eax
 004428F9    xor         eax,eax
 004428FB    push        ebp
 004428FC    push        4429CA
 00442901    push        dword ptr fs:[eax]
 00442904    mov         dword ptr fs:[eax],esp
 00442907    mov         edx,dword ptr [ebp-14]
 0044290A    mov         eax,dword ptr [ebp-4]
 0044290D    mov         si,0FFB4
 00442911    call        @CallDynaInst
 00442916    mov         eax,dword ptr [ebp-14]
 00442919    cmp         dword ptr [eax+8],0
>0044291D    jle         004429B4
 00442923    mov         edx,edi
 00442925    mov         eax,dword ptr [ebp-14]
 00442928    call        TList.IndexOf
 0044292D    mov         dword ptr [ebp-10],eax
 00442930    cmp         dword ptr [ebp-10],0FFFFFFFF
>00442934    jne         0044294D
 00442936    cmp         byte ptr [ebp-5],0
>0044293A    je          00442948
 0044293C    mov         eax,dword ptr [ebp-14]
 0044293F    mov         eax,dword ptr [eax+8]
 00442942    dec         eax
 00442943    mov         dword ptr [ebp-10],eax
>00442946    jmp         0044294D
 00442948    xor         eax,eax
 0044294A    mov         dword ptr [ebp-10],eax
 0044294D    mov         ebx,dword ptr [ebp-10]
 00442950    cmp         byte ptr [ebp-5],0
>00442954    je          00442963
 00442956    inc         ebx
 00442957    mov         eax,dword ptr [ebp-14]
 0044295A    cmp         ebx,dword ptr [eax+8]
>0044295D    jne         0044296E
 0044295F    xor         ebx,ebx
>00442961    jmp         0044296E
 00442963    test        ebx,ebx
>00442965    jne         0044296D
 00442967    mov         eax,dword ptr [ebp-14]
 0044296A    mov         ebx,dword ptr [eax+8]
 0044296D    dec         ebx
 0044296E    mov         edx,ebx
 00442970    mov         eax,dword ptr [ebp-14]
 00442973    call        TList.Get
 00442978    mov         edi,eax
 0044297A    mov         eax,edi
 0044297C    mov         si,0FFB8
 00442980    call        @CallDynaInst
 00442985    test        al,al
>00442987    je          004429A9
 00442989    cmp         byte ptr [ebp+0C],0
>0044298D    je          00442998
 0044298F    cmp         byte ptr [edi+1A4],0
>00442996    je          004429A9
 00442998    cmp         byte ptr [ebp+8],0
>0044299C    je          004429A6
 0044299E    mov         eax,dword ptr [edi+30]
 004429A1    cmp         eax,dword ptr [ebp-4]
>004429A4    jne         004429A9
 004429A6    mov         dword ptr [ebp-0C],edi
 004429A9    cmp         dword ptr [ebp-0C],0
>004429AD    jne         004429B4
 004429AF    cmp         ebx,dword ptr [ebp-10]
>004429B2    jne         00442950
 004429B4    xor         eax,eax
 004429B6    pop         edx
 004429B7    pop         ecx
 004429B8    pop         ecx
 004429B9    mov         dword ptr fs:[eax],edx
 004429BC    push        4429D1
 004429C1    mov         eax,dword ptr [ebp-14]
 004429C4    call        TObject.Free
 004429C9    ret
>004429CA    jmp         @HandleFinally
>004429CF    jmp         004429C1
 004429D1    mov         eax,dword ptr [ebp-0C]
 004429D4    pop         edi
 004429D5    pop         esi
 004429D6    pop         ebx
 004429D7    mov         esp,ebp
 004429D9    pop         ebp
 004429DA    ret         8
*}
end;

//004429E0
procedure TWinControl.SelectNext(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean);
begin
{*
 004429E0    push        ebp
 004429E1    mov         ebp,esp
 004429E3    push        esi
 004429E4    mov         esi,edx
 004429E6    mov         edx,dword ptr [ebp+8]
 004429E9    push        edx
 004429EA    xor         dl,1
 004429ED    push        edx
 004429EE    mov         edx,esi
 004429F0    call        TWinControl.FindNextControl
 004429F5    mov         esi,eax
 004429F7    test        esi,esi
>004429F9    je          00442A05
 004429FB    mov         eax,esi
 004429FD    mov         edx,dword ptr [eax]
 004429FF    call        dword ptr [edx+0C4]
 00442A05    pop         esi
 00442A06    pop         ebp
 00442A07    ret         4
*}
end;

//00442A0C
procedure TWinControl.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00442A0C    push        ebp
 00442A0D    mov         ebp,esp
 00442A0F    add         esp,0FFFFFFF8
 00442A12    push        ebx
 00442A13    push        esi
 00442A14    mov         dword ptr [ebp-8],edx
 00442A17    mov         dword ptr [ebp-4],eax
 00442A1A    mov         eax,dword ptr [ebp-4]
 00442A1D    call        TWinControl.GetControlCount
 00442A22    mov         ebx,eax
 00442A24    dec         ebx
 00442A25    test        ebx,ebx
>00442A27    jl          00442A4A
 00442A29    inc         ebx
 00442A2A    xor         esi,esi
 00442A2C    mov         edx,esi
 00442A2E    mov         eax,dword ptr [ebp-4]
 00442A31    call        TWinControl.GetControl
 00442A36    mov         edx,dword ptr [eax+4]
 00442A39    cmp         edx,dword ptr [ebp-8]
>00442A3C    jne         00442A46
 00442A3E    mov         edx,eax
 00442A40    mov         eax,dword ptr [ebp+0C]
 00442A43    call        dword ptr [ebp+8]
 00442A46    inc         esi
 00442A47    dec         ebx
>00442A48    jne         00442A2C
 00442A4A    pop         esi
 00442A4B    pop         ebx
 00442A4C    pop         ecx
 00442A4D    pop         ecx
 00442A4E    pop         ebp
 00442A4F    ret         8
*}
end;

//00442A54
procedure TWinControl.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 00442A54    push        ebx
 00442A55    push        esi
 00442A56    mov         esi,ecx
 00442A58    mov         ebx,edx
 00442A5A    mov         eax,ebx
 00442A5C    mov         edx,dword ptr ds:[4380F4];TWinControl
 00442A62    call        @IsClass
 00442A67    test        al,al
>00442A69    je          00442A77
 00442A6B    mov         edx,esi
 00442A6D    mov         eax,ebx
 00442A6F    call        TWinControl.SetZOrderPosition
 00442A74    pop         esi
 00442A75    pop         ebx
 00442A76    ret
 00442A77    mov         eax,ebx
 00442A79    mov         edx,dword ptr ds:[437BA4];TControl
 00442A7F    call        @IsClass
 00442A84    test        al,al
>00442A86    je          00442A91
 00442A88    mov         edx,esi
 00442A8A    mov         eax,ebx
 00442A8C    call        TControl.SetZOrderPosition
 00442A91    pop         esi
 00442A92    pop         ebx
 00442A93    ret
*}
end;

//00442A94
procedure TWinControl.CanResize(var NewWidth:Integer; var NewHeight:Integer);
begin
{*
 00442A94    call        TControl.CanResize
 00442A99    ret
*}
end;

//00442A9C
procedure DoCalcConstraints(Control:TControl; var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 00442A9C    push        ebp
 00442A9D    mov         ebp,esp
 00442A9F    push        ebx
 00442AA0    push        esi
 00442AA1    push        edi
 00442AA2    mov         edi,edx
 00442AA4    mov         esi,eax
 00442AA6    mov         eax,dword ptr [esi+74]
 00442AA9    cmp         dword ptr [eax+14],0
>00442AAD    jbe         00442AB9
 00442AAF    mov         edx,dword ptr [esi+74]
 00442AB2    mov         edx,dword ptr [edx+14]
 00442AB5    mov         dword ptr [edi],edx
>00442AB7    jmp         00442ABD
 00442AB9    xor         edx,edx
 00442ABB    mov         dword ptr [edi],edx
 00442ABD    cmp         dword ptr [eax+10],0
>00442AC1    jbe         00442ACD
 00442AC3    mov         edx,dword ptr [esi+74]
 00442AC6    mov         edx,dword ptr [edx+10]
 00442AC9    mov         dword ptr [ecx],edx
>00442ACB    jmp         00442AD1
 00442ACD    xor         edx,edx
 00442ACF    mov         dword ptr [ecx],edx
 00442AD1    cmp         dword ptr [eax+0C],0
>00442AD5    jbe         00442AE4
 00442AD7    mov         edx,dword ptr [esi+74]
 00442ADA    mov         edx,dword ptr [edx+0C]
 00442ADD    mov         ebx,dword ptr [ebp+0C]
 00442AE0    mov         dword ptr [ebx],edx
>00442AE2    jmp         00442AEB
 00442AE4    mov         edx,dword ptr [ebp+0C]
 00442AE7    xor         ebx,ebx
 00442AE9    mov         dword ptr [edx],ebx
 00442AEB    cmp         dword ptr [eax+8],0
>00442AEF    jbe         00442AFE
 00442AF1    mov         eax,dword ptr [esi+74]
 00442AF4    mov         eax,dword ptr [eax+8]
 00442AF7    mov         edx,dword ptr [ebp+8]
 00442AFA    mov         dword ptr [edx],eax
>00442AFC    jmp         00442B05
 00442AFE    mov         eax,dword ptr [ebp+8]
 00442B01    xor         edx,edx
 00442B03    mov         dword ptr [eax],edx
 00442B05    mov         eax,dword ptr [ebp+0C]
 00442B08    push        eax
 00442B09    mov         eax,dword ptr [ebp+8]
 00442B0C    push        eax
 00442B0D    mov         edx,edi
 00442B0F    mov         eax,esi
 00442B11    mov         ebx,dword ptr [eax]
 00442B13    call        dword ptr [ebx+38]
 00442B16    pop         edi
 00442B17    pop         esi
 00442B18    pop         ebx
 00442B19    pop         ebp
 00442B1A    ret         8
*}
end;

//00442B20
procedure TWinControl.CalcConstraints(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 00442B20    push        ebp
 00442B21    mov         ebp,esp
 00442B23    add         esp,0FFFFFFA0
 00442B26    push        ebx
 00442B27    push        esi
 00442B28    push        edi
 00442B29    mov         dword ptr [ebp-8],ecx
 00442B2C    mov         dword ptr [ebp-4],edx
 00442B2F    mov         esi,eax
 00442B31    mov         eax,esi
 00442B33    call        TWinControl.HandleAllocated
 00442B38    test        al,al
>00442B3A    je          00442EE9
 00442B40    mov         eax,esi
 00442B42    call        TWinControl.GetControlCount
 00442B47    test        eax,eax
>00442B49    je          00442EE9
 00442B4F    lea         edx,[ebp-5D]
 00442B52    mov         eax,esi
 00442B54    mov         ecx,dword ptr [eax]
 00442B56    call        dword ptr [ecx+44]
 00442B59    lea         edx,[ebp-5D]
 00442B5C    mov         eax,esi
 00442B5E    mov         ecx,dword ptr [eax]
 00442B60    call        dword ptr [ecx+8C]
 00442B66    lea         eax,[ebp-5D]
 00442B69    push        eax
 00442B6A    call        user32.IsRectEmpty
 00442B6F    test        eax,eax
>00442B71    jne         00442EE9
 00442B77    mov         eax,dword ptr [esi+48]
 00442B7A    mov         edx,dword ptr [ebp-55]
 00442B7D    sub         edx,dword ptr [ebp-5D]
 00442B80    sub         eax,edx
 00442B82    mov         dword ptr [ebp-0C],eax
 00442B85    mov         edx,dword ptr [esi+4C]
 00442B88    mov         ecx,dword ptr [ebp-51]
 00442B8B    sub         ecx,dword ptr [ebp-59]
 00442B8E    sub         edx,ecx
 00442B90    mov         dword ptr [ebp-10],edx
 00442B93    mov         dword ptr [ebp-14],eax
 00442B96    mov         dword ptr [ebp-18],edx
 00442B99    mov         eax,dword ptr [ebp-4]
 00442B9C    cmp         dword ptr [eax],0
>00442B9F    jle         00442BA9
 00442BA1    mov         eax,dword ptr [ebp-4]
 00442BA4    mov         edx,dword ptr [ebp-0C]
 00442BA7    sub         dword ptr [eax],edx
 00442BA9    mov         eax,dword ptr [ebp-8]
 00442BAC    cmp         dword ptr [eax],0
>00442BAF    jle         00442BB9
 00442BB1    mov         eax,dword ptr [ebp-8]
 00442BB4    mov         edx,dword ptr [ebp-10]
 00442BB7    sub         dword ptr [eax],edx
 00442BB9    mov         eax,dword ptr [ebp+0C]
 00442BBC    cmp         dword ptr [eax],0
>00442BBF    jle         00442BC9
 00442BC1    mov         eax,dword ptr [ebp+0C]
 00442BC4    mov         edx,dword ptr [ebp-14]
 00442BC7    sub         dword ptr [eax],edx
 00442BC9    mov         eax,dword ptr [ebp+8]
 00442BCC    cmp         dword ptr [eax],0
>00442BCF    jle         00442BD9
 00442BD1    mov         eax,dword ptr [ebp+8]
 00442BD4    mov         edx,dword ptr [ebp-18]
 00442BD7    sub         dword ptr [eax],edx
 00442BD9    xor         ecx,ecx
 00442BDB    push        ebp
 00442BDC    push        442EE2
 00442BE1    push        dword ptr fs:[ecx]
 00442BE4    mov         dword ptr fs:[ecx],esp
 00442BE7    xor         eax,eax
 00442BE9    mov         dword ptr [ebp-20],eax
 00442BEC    xor         eax,eax
 00442BEE    mov         dword ptr [ebp-30],eax
 00442BF1    xor         eax,eax
 00442BF3    mov         dword ptr [ebp-24],eax
 00442BF6    xor         eax,eax
 00442BF8    mov         dword ptr [ebp-34],eax
 00442BFB    xor         eax,eax
 00442BFD    mov         dword ptr [ebp-28],eax
 00442C00    xor         eax,eax
 00442C02    mov         dword ptr [ebp-38],eax
 00442C05    xor         eax,eax
 00442C07    mov         dword ptr [ebp-2C],eax
 00442C0A    xor         eax,eax
 00442C0C    mov         dword ptr [ebp-3C],eax
 00442C0F    mov         eax,esi
 00442C11    call        TWinControl.GetControlCount
 00442C16    mov         edi,eax
 00442C18    dec         edi
 00442C19    test        edi,edi
>00442C1B    jl          00442E0C
 00442C21    inc         edi
 00442C22    mov         dword ptr [ebp-1C],0
 00442C29    mov         edx,dword ptr [ebp-1C]
 00442C2C    mov         eax,esi
 00442C2E    call        TWinControl.GetControl
 00442C33    mov         ebx,eax
 00442C35    cmp         byte ptr [ebx+57],0
>00442C39    jne         00442C4F
 00442C3B    test        byte ptr [ebx+1C],10
>00442C3F    je          00442E02
 00442C45    test        byte ptr [ebx+51],4
>00442C49    jne         00442E02
 00442C4F    lea         eax,[ebp-44]
 00442C52    push        eax
 00442C53    lea         eax,[ebp-4C]
 00442C56    push        eax
 00442C57    lea         ecx,[ebp-48]
 00442C5A    lea         edx,[ebp-40]
 00442C5D    mov         eax,ebx
 00442C5F    call        DoCalcConstraints
 00442C64    mov         al,byte ptr [ebx+5B]
 00442C67    sub         al,1
>00442C69    jb          00442C81
 00442C6B    sub         al,2
>00442C6D    jb          00442C75
 00442C6F    sub         al,2
>00442C71    je          00442C7B
>00442C73    jmp         00442CCA
 00442C75    mov         byte ptr [ebp-4D],1
>00442C79    jmp         00442CCE
 00442C7B    mov         byte ptr [ebp-4D],2
>00442C7F    jmp         00442CCE
 00442C81    mov         al,byte ptr [ebx+61]
 00442C84    and         al,byte ptr ds:[442EF4]
 00442C8A    mov         dl,byte ptr ds:[442EF4]
 00442C90    cmp         dl,al
>00442C92    jne         00442CC4
 00442C94    mov         byte ptr [ebp-4D],1
 00442C98    cmp         dword ptr [ebp-40],0
>00442C9C    jle         00442CAD
 00442C9E    mov         eax,dword ptr [ebp-55]
 00442CA1    sub         eax,dword ptr [ebp-5D]
 00442CA4    sub         eax,dword ptr [ebx+48]
 00442CA7    sub         eax,dword ptr [ebp-40]
 00442CAA    mov         dword ptr [ebp-40],eax
 00442CAD    cmp         dword ptr [ebp-44],0
>00442CB1    jle         00442CCE
 00442CB3    mov         eax,dword ptr [ebp-55]
 00442CB6    sub         eax,dword ptr [ebp-5D]
 00442CB9    add         eax,dword ptr [ebp-44]
 00442CBC    sub         eax,dword ptr [ebx+48]
 00442CBF    mov         dword ptr [ebp-44],eax
>00442CC2    jmp         00442CCE
 00442CC4    mov         byte ptr [ebp-4D],0
>00442CC8    jmp         00442CCE
 00442CCA    mov         byte ptr [ebp-4D],3
 00442CCE    mov         al,byte ptr [ebx+5B]
 00442CD1    sub         al,1
>00442CD3    jb          00442CE7
 00442CD5    add         al,0FE
 00442CD7    sub         al,2
>00442CD9    jb          00442CDF
>00442CDB    je          00442CE3
>00442CDD    jmp         00442D2C
 00442CDF    mov         al,1
>00442CE1    jmp         00442D2E
 00442CE3    mov         al,2
>00442CE5    jmp         00442D2E
 00442CE7    mov         al,byte ptr [ebx+61]
 00442CEA    and         al,byte ptr ds:[442EF8]
 00442CF0    mov         dl,byte ptr ds:[442EF8]
 00442CF6    cmp         dl,al
>00442CF8    jne         00442D28
 00442CFA    mov         al,1
 00442CFC    cmp         dword ptr [ebp-48],0
>00442D00    jle         00442D11
 00442D02    mov         edx,dword ptr [ebp-51]
 00442D05    sub         edx,dword ptr [ebp-59]
 00442D08    sub         edx,dword ptr [ebx+4C]
 00442D0B    sub         edx,dword ptr [ebp-48]
 00442D0E    mov         dword ptr [ebp-48],edx
 00442D11    cmp         dword ptr [ebp-4C],0
>00442D15    jle         00442D2E
 00442D17    mov         edx,dword ptr [ebp-51]
 00442D1A    sub         edx,dword ptr [ebp-59]
 00442D1D    add         edx,dword ptr [ebp-4C]
 00442D20    sub         edx,dword ptr [ebx+4C]
 00442D23    mov         dword ptr [ebp-4C],edx
>00442D26    jmp         00442D2E
 00442D28    xor         eax,eax
>00442D2A    jmp         00442D2E
 00442D2C    mov         al,3
 00442D2E    mov         dl,byte ptr [ebp-4D]
 00442D31    dec         edx
 00442D32    sub         dl,2
>00442D35    jb          00442D3B
>00442D37    je          00442D91
>00442D39    jmp         00442D9A
 00442D3B    cmp         dword ptr [ebp-40],0
>00442D3F    jle         00442D65
 00442D41    mov         edx,dword ptr [ebp-4]
 00442D44    mov         edx,dword ptr [edx]
 00442D46    cmp         edx,dword ptr [ebp-40]
>00442D49    jge         00442D65
 00442D4B    mov         edx,dword ptr [ebp-4]
 00442D4E    mov         ecx,dword ptr [ebp-40]
 00442D51    mov         dword ptr [edx],ecx
 00442D53    mov         edx,dword ptr [ebp-4]
 00442D56    mov         edx,dword ptr [edx]
 00442D58    cmp         edx,dword ptr [ebp-20]
>00442D5B    jle         00442D65
 00442D5D    mov         edx,dword ptr [ebp-4]
 00442D60    mov         edx,dword ptr [edx]
 00442D62    mov         dword ptr [ebp-20],edx
 00442D65    cmp         dword ptr [ebp-44],0
>00442D69    jle         00442D9A
 00442D6B    mov         edx,dword ptr [ebp+0C]
 00442D6E    mov         edx,dword ptr [edx]
 00442D70    cmp         edx,dword ptr [ebp-44]
>00442D73    jle         00442D9A
 00442D75    mov         edx,dword ptr [ebp+0C]
 00442D78    mov         ecx,dword ptr [ebp-44]
 00442D7B    mov         dword ptr [edx],ecx
 00442D7D    mov         edx,dword ptr [ebp+0C]
 00442D80    mov         edx,dword ptr [edx]
 00442D82    cmp         edx,dword ptr [ebp-24]
>00442D85    jle         00442D9A
 00442D87    mov         edx,dword ptr [ebp+0C]
 00442D8A    mov         edx,dword ptr [edx]
 00442D8C    mov         dword ptr [ebp-24],edx
>00442D8F    jmp         00442D9A
 00442D91    mov         edx,dword ptr [ebx+48]
 00442D94    add         dword ptr [ebp-30],edx
 00442D97    add         dword ptr [ebp-34],edx
 00442D9A    dec         eax
 00442D9B    sub         al,2
>00442D9D    jb          00442DA3
>00442D9F    je          00442DF9
>00442DA1    jmp         00442E02
 00442DA3    cmp         dword ptr [ebp-48],0
>00442DA7    jle         00442DCD
 00442DA9    mov         eax,dword ptr [ebp-8]
 00442DAC    mov         eax,dword ptr [eax]
 00442DAE    cmp         eax,dword ptr [ebp-48]
>00442DB1    jge         00442DCD
 00442DB3    mov         eax,dword ptr [ebp-8]
 00442DB6    mov         edx,dword ptr [ebp-48]
 00442DB9    mov         dword ptr [eax],edx
 00442DBB    mov         eax,dword ptr [ebp-8]
 00442DBE    mov         eax,dword ptr [eax]
 00442DC0    cmp         eax,dword ptr [ebp-28]
>00442DC3    jle         00442DCD
 00442DC5    mov         eax,dword ptr [ebp-8]
 00442DC8    mov         eax,dword ptr [eax]
 00442DCA    mov         dword ptr [ebp-28],eax
 00442DCD    cmp         dword ptr [ebp-4C],0
>00442DD1    jle         00442E02
 00442DD3    mov         eax,dword ptr [ebp+8]
 00442DD6    mov         eax,dword ptr [eax]
 00442DD8    cmp         eax,dword ptr [ebp-4C]
>00442DDB    jle         00442E02
 00442DDD    mov         eax,dword ptr [ebp+8]
 00442DE0    mov         edx,dword ptr [ebp-4C]
 00442DE3    mov         dword ptr [eax],edx
 00442DE5    mov         eax,dword ptr [ebp+8]
 00442DE8    mov         eax,dword ptr [eax]
 00442DEA    cmp         eax,dword ptr [ebp-2C]
>00442DED    jle         00442E02
 00442DEF    mov         eax,dword ptr [ebp+8]
 00442DF2    mov         eax,dword ptr [eax]
 00442DF4    mov         dword ptr [ebp-2C],eax
>00442DF7    jmp         00442E02
 00442DF9    mov         eax,dword ptr [ebx+4C]
 00442DFC    add         dword ptr [ebp-38],eax
 00442DFF    add         dword ptr [ebp-3C],eax
 00442E02    inc         dword ptr [ebp-1C]
 00442E05    dec         edi
>00442E06    jne         00442C29
 00442E0C    cmp         dword ptr [ebp-20],0
>00442E10    jle         00442E2A
 00442E12    mov         eax,dword ptr [ebp-20]
 00442E15    add         eax,dword ptr [ebp-30]
 00442E18    mov         edx,dword ptr [ebp-4]
 00442E1B    cmp         eax,dword ptr [edx]
>00442E1D    jle         00442E2A
 00442E1F    mov         eax,dword ptr [ebp-20]
 00442E22    add         eax,dword ptr [ebp-30]
 00442E25    mov         edx,dword ptr [ebp-4]
 00442E28    mov         dword ptr [edx],eax
 00442E2A    cmp         dword ptr [ebp-24],0
>00442E2E    jle         00442E50
 00442E30    mov         eax,dword ptr [ebp+0C]
 00442E33    cmp         dword ptr [eax],0
>00442E36    je          00442E45
 00442E38    mov         eax,dword ptr [ebp-24]
 00442E3B    add         eax,dword ptr [ebp-34]
 00442E3E    mov         edx,dword ptr [ebp+0C]
 00442E41    cmp         eax,dword ptr [edx]
>00442E43    jle         00442E50
 00442E45    mov         eax,dword ptr [ebp-24]
 00442E48    add         eax,dword ptr [ebp-34]
 00442E4B    mov         edx,dword ptr [ebp+0C]
 00442E4E    mov         dword ptr [edx],eax
 00442E50    cmp         dword ptr [ebp-28],0
>00442E54    jle         00442E6E
 00442E56    mov         eax,dword ptr [ebp-28]
 00442E59    add         eax,dword ptr [ebp-38]
 00442E5C    mov         edx,dword ptr [ebp-8]
 00442E5F    cmp         eax,dword ptr [edx]
>00442E61    jle         00442E6E
 00442E63    mov         eax,dword ptr [ebp-28]
 00442E66    add         eax,dword ptr [ebp-38]
 00442E69    mov         edx,dword ptr [ebp-8]
 00442E6C    mov         dword ptr [edx],eax
 00442E6E    cmp         dword ptr [ebp-2C],0
>00442E72    jle         00442E94
 00442E74    mov         eax,dword ptr [ebp+8]
 00442E77    cmp         dword ptr [eax],0
>00442E7A    je          00442E89
 00442E7C    mov         eax,dword ptr [ebp-2C]
 00442E7F    add         eax,dword ptr [ebp-3C]
 00442E82    mov         edx,dword ptr [ebp+8]
 00442E85    cmp         eax,dword ptr [edx]
>00442E87    jle         00442E94
 00442E89    mov         eax,dword ptr [ebp-2C]
 00442E8C    add         eax,dword ptr [ebp-3C]
 00442E8F    mov         edx,dword ptr [ebp+8]
 00442E92    mov         dword ptr [edx],eax
 00442E94    xor         eax,eax
 00442E96    pop         edx
 00442E97    pop         ecx
 00442E98    pop         ecx
 00442E99    mov         dword ptr fs:[eax],edx
 00442E9C    push        442EE9
 00442EA1    mov         eax,dword ptr [ebp-4]
 00442EA4    cmp         dword ptr [eax],0
>00442EA7    jle         00442EB1
 00442EA9    mov         eax,dword ptr [ebp-4]
 00442EAC    mov         edx,dword ptr [ebp-0C]
 00442EAF    add         dword ptr [eax],edx
 00442EB1    mov         eax,dword ptr [ebp-8]
 00442EB4    cmp         dword ptr [eax],0
>00442EB7    jle         00442EC1
 00442EB9    mov         eax,dword ptr [ebp-8]
 00442EBC    mov         edx,dword ptr [ebp-10]
 00442EBF    add         dword ptr [eax],edx
 00442EC1    mov         eax,dword ptr [ebp+0C]
 00442EC4    cmp         dword ptr [eax],0
>00442EC7    jle         00442ED1
 00442EC9    mov         eax,dword ptr [ebp+0C]
 00442ECC    mov         edx,dword ptr [ebp-14]
 00442ECF    add         dword ptr [eax],edx
 00442ED1    mov         eax,dword ptr [ebp+8]
 00442ED4    cmp         dword ptr [eax],0
>00442ED7    jle         00442EE1
 00442ED9    mov         eax,dword ptr [ebp+8]
 00442EDC    mov         edx,dword ptr [ebp-18]
 00442EDF    add         dword ptr [eax],edx
 00442EE1    ret
>00442EE2    jmp         @HandleFinally
>00442EE7    jmp         00442EA1
 00442EE9    pop         edi
 00442EEA    pop         esi
 00442EEB    pop         ebx
 00442EEC    mov         esp,ebp
 00442EEE    pop         ebp
 00442EEF    ret         8
*}
end;

//00442EFC
procedure TWinControl.ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 00442EFC    push        ebp
 00442EFD    mov         ebp,esp
 00442EFF    push        ebx
 00442F00    push        esi
 00442F01    push        edi
 00442F02    mov         edi,ecx
 00442F04    mov         esi,edx
 00442F06    mov         ebx,eax
 00442F08    mov         eax,dword ptr [ebp+0C]
 00442F0B    push        eax
 00442F0C    mov         eax,dword ptr [ebp+8]
 00442F0F    push        eax
 00442F10    mov         ecx,edi
 00442F12    mov         edx,esi
 00442F14    mov         eax,ebx
 00442F16    call        TWinControl.CalcConstraints
 00442F1B    mov         eax,dword ptr [ebp+0C]
 00442F1E    push        eax
 00442F1F    mov         eax,dword ptr [ebp+8]
 00442F22    push        eax
 00442F23    mov         ecx,edi
 00442F25    mov         edx,esi
 00442F27    mov         eax,ebx
 00442F29    call        TControl.ConstrainedResize
 00442F2E    pop         edi
 00442F2F    pop         esi
 00442F30    pop         ebx
 00442F31    pop         ebp
 00442F32    ret         8
*}
end;

//00442F38
procedure TWinControl.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 00442F38    push        ebx
 00442F39    push        esi
 00442F3A    push        edi
 00442F3B    mov         ebx,ecx
 00442F3D    mov         esi,edx
 00442F3F    mov         edi,eax
 00442F41    mov         ecx,ebx
 00442F43    mov         edx,esi
 00442F45    mov         eax,edi
 00442F47    call        TControl.ActionChange
 00442F4C    mov         eax,esi
 00442F4E    mov         edx,dword ptr ds:[44776C];TCustomAction
 00442F54    call        @IsClass
 00442F59    test        al,al
>00442F5B    je          00442F74
 00442F5D    test        bl,bl
>00442F5F    je          00442F6A
 00442F61    cmp         dword ptr [edi+158],0
>00442F68    jne         00442F74
 00442F6A    mov         edx,dword ptr [esi+74]
 00442F6D    mov         eax,edi
 00442F6F    call        TControl.SetHelpContext
 00442F74    pop         edi
 00442F75    pop         esi
 00442F76    pop         ebx
 00442F77    ret
*}
end;

//00442F78
procedure TWinControl.sub_0043DCE4;
begin
{*
 00442F78    mov         eax,[00437FB4];TWinControlActionLink
 00442F7D    ret
*}
end;

//00442F80
procedure TWinControl.AssignTo(Dest:TPersistent);
begin
{*
 00442F80    push        ebx
 00442F81    push        esi
 00442F82    mov         esi,edx
 00442F84    mov         ebx,eax
 00442F86    mov         edx,esi
 00442F88    mov         eax,ebx
 00442F8A    call        TControl.AssignTo
 00442F8F    mov         eax,esi
 00442F91    mov         edx,dword ptr ds:[44776C];TCustomAction
 00442F97    call        @IsClass
 00442F9C    test        al,al
>00442F9E    je          00442FAD
 00442FA0    mov         edx,dword ptr [ebx+158]
 00442FA6    mov         eax,esi
 00442FA8    mov         ecx,dword ptr [eax]
 00442FAA    call        dword ptr [ecx+48]
 00442FAD    pop         esi
 00442FAE    pop         ebx
 00442FAF    ret
*}
end;

//00442FB0
function TWinControl.CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 00442FB0    push        ebp
 00442FB1    mov         ebp,esp
 00442FB3    add         esp,0FFFFFFC8
 00442FB6    push        ebx
 00442FB7    push        esi
 00442FB8    push        edi
 00442FB9    mov         dword ptr [ebp-0C],ecx
 00442FBC    mov         dword ptr [ebp-8],edx
 00442FBF    mov         dword ptr [ebp-4],eax
 00442FC2    mov         byte ptr [ebp-0D],1
 00442FC6    mov         eax,dword ptr [ebp-4]
 00442FC9    call        TWinControl.HandleAllocated
 00442FCE    test        al,al
>00442FD0    je          00443172
 00442FD6    mov         eax,dword ptr [ebp-4]
 00442FD9    cmp         byte ptr [eax+5B],5
>00442FDD    je          00443172
 00442FE3    mov         eax,dword ptr [ebp-4]
 00442FE6    test        byte ptr [eax+1C],10
>00442FEA    je          00442FFC
 00442FEC    mov         eax,dword ptr [ebp-4]
 00442FEF    call        TWinControl.GetControlCount
 00442FF4    test        eax,eax
>00442FF6    jle         00443172
 00442FFC    lea         edx,[ebp-28]
 00442FFF    mov         eax,dword ptr [ebp-4]
 00443002    mov         ecx,dword ptr [eax]
 00443004    call        dword ptr [ecx+0B4]
 0044300A    lea         edx,[ebp-38]
 0044300D    mov         eax,dword ptr [ebp-4]
 00443010    mov         ecx,dword ptr [eax]
 00443012    call        dword ptr [ecx+44]
 00443015    lea         edx,[ebp-38]
 00443018    mov         eax,dword ptr [ebp-4]
 0044301B    mov         ecx,dword ptr [eax]
 0044301D    call        dword ptr [ecx+8C]
 00443023    mov         eax,dword ptr [ebp-4]
 00443026    call        TWinControl.DisableAlign
 0044302B    xor         ecx,ecx
 0044302D    push        ebp
 0044302E    push        4430DF
 00443033    push        dword ptr fs:[ecx]
 00443036    mov         dword ptr fs:[ecx],esp
 00443039    mov         eax,dword ptr [ebp-4]
 0044303C    call        TWinControl.GetControlCount
 00443041    mov         esi,eax
 00443043    dec         esi
 00443044    test        esi,esi
>00443046    jl          004430C1
 00443048    inc         esi
 00443049    mov         dword ptr [ebp-14],0
 00443050    mov         edx,dword ptr [ebp-14]
 00443053    mov         eax,dword ptr [ebp-4]
 00443056    call        TWinControl.GetControl
 0044305B    cmp         byte ptr [eax+57],0
>0044305F    jne         0044306D
 00443061    test        byte ptr [eax+1C],10
>00443065    je          004430BB
 00443067    test        byte ptr [eax+51],4
>0044306B    jne         004430BB
 0044306D    mov         edx,dword ptr [ebp-4]
 00443070    mov         dl,byte ptr [edx+5B]
 00443073    mov         ecx,edx
 00443075    test        cl,cl
>00443077    je          00443081
 00443079    add         cl,0FD
 0044307C    sub         cl,2
>0044307F    jae         00443089
 00443081    mov         edi,dword ptr [ebp-28]
 00443084    sub         edi,dword ptr [ebp-38]
>00443087    jmp         0044308B
 00443089    xor         edi,edi
 0044308B    sub         dl,3
>0044308E    jae         0044309B
 00443090    mov         edx,dword ptr [ebp-24]
 00443093    sub         edx,dword ptr [ebp-34]
 00443096    mov         dword ptr [ebp-18],edx
>00443099    jmp         004430A0
 0044309B    xor         edx,edx
 0044309D    mov         dword ptr [ebp-18],edx
 004430A0    mov         edx,dword ptr [eax+48]
 004430A3    push        edx
 004430A4    mov         edx,dword ptr [eax+4C]
 004430A7    push        edx
 004430A8    mov         ecx,dword ptr [eax+44]
 004430AB    sub         ecx,dword ptr [ebp-18]
 004430AE    mov         edx,dword ptr [eax+40]
 004430B1    sub         edx,edi
 004430B3    mov         ebx,dword ptr [eax]
 004430B5    call        dword ptr [ebx+84]
 004430BB    inc         dword ptr [ebp-14]
 004430BE    dec         esi
>004430BF    jne         00443050
 004430C1    xor         eax,eax
 004430C3    pop         edx
 004430C4    pop         ecx
 004430C5    pop         ecx
 004430C6    mov         dword ptr fs:[eax],edx
 004430C9    push        4430E6
 004430CE    mov         eax,dword ptr [ebp-4]
 004430D1    and         word ptr [eax+54],0FFFFFFEF
 004430D6    mov         eax,dword ptr [ebp-4]
 004430D9    call        TWinControl.EnableAlign
 004430DE    ret
>004430DF    jmp         @HandleFinally
>004430E4    jmp         004430CE
 004430E6    mov         eax,dword ptr [ebp-4]
 004430E9    mov         dl,byte ptr [eax+5B]
 004430EC    mov         eax,edx
 004430EE    test        al,al
>004430F0    je          004430F8
 004430F2    add         al,0FD
 004430F4    sub         al,2
>004430F6    jae         0044312F
 004430F8    mov         eax,dword ptr [ebp-20]
 004430FB    sub         eax,dword ptr [ebp-28]
 004430FE    test        eax,eax
>00443100    jle         00443128
 00443102    mov         ecx,dword ptr [ebp-4]
 00443105    add         eax,dword ptr [ecx+48]
 00443108    mov         ecx,dword ptr [ebp-30]
 0044310B    sub         ecx,dword ptr [ebp-38]
 0044310E    sub         eax,ecx
 00443110    mov         ecx,dword ptr [ebp-8]
 00443113    mov         dword ptr [ecx],eax
 00443115    cmp         dl,4
>00443118    jne         0044312F
 0044311A    mov         eax,dword ptr [ebp-4]
 0044311D    mov         si,0FFD0
 00443121    call        @CallDynaInst
>00443126    jmp         0044312F
 00443128    mov         eax,dword ptr [ebp-8]
 0044312B    xor         edx,edx
 0044312D    mov         dword ptr [eax],edx
 0044312F    mov         eax,dword ptr [ebp-4]
 00443132    mov         dl,byte ptr [eax+5B]
 00443135    mov         eax,edx
 00443137    sub         al,3
>00443139    jae         00443172
 0044313B    mov         eax,dword ptr [ebp-1C]
 0044313E    sub         eax,dword ptr [ebp-24]
 00443141    test        eax,eax
>00443143    jle         0044316B
 00443145    mov         ecx,dword ptr [ebp-4]
 00443148    add         eax,dword ptr [ecx+4C]
 0044314B    mov         ecx,dword ptr [ebp-2C]
 0044314E    sub         ecx,dword ptr [ebp-34]
 00443151    sub         eax,ecx
 00443153    mov         ecx,dword ptr [ebp-0C]
 00443156    mov         dword ptr [ecx],eax
 00443158    cmp         dl,2
>0044315B    jne         00443172
 0044315D    mov         eax,dword ptr [ebp-4]
 00443160    mov         si,0FFD0
 00443164    call        @CallDynaInst
>00443169    jmp         00443172
 0044316B    mov         eax,dword ptr [ebp-0C]
 0044316E    xor         edx,edx
 00443170    mov         dword ptr [eax],edx
 00443172    mov         al,byte ptr [ebp-0D]
 00443175    pop         edi
 00443176    pop         esi
 00443177    pop         ebx
 00443178    mov         esp,ebp
 0044317A    pop         ebp
 0044317B    ret
*}
end;

//0044317C
procedure TWinControl.WMNCCalcSize(var Message:TWMNCCalcSize);
begin
{*
 0044317C    push        ebx
 0044317D    push        esi
 0044317E    push        edi
 0044317F    mov         esi,edx
 00443181    mov         ebx,eax
 00443183    mov         edx,esi
 00443185    mov         eax,ebx
 00443187    mov         ecx,dword ptr [eax]
 00443189    call        dword ptr [ecx-10]
 0044318C    mov         eax,dword ptr [esi+8]
 0044318F    mov         esi,eax
 00443191    mov         eax,dword ptr [ebx+16C]
 00443197    neg         eax
 00443199    push        eax
 0044319A    mov         edx,dword ptr [ebx+16C]
 004431A0    neg         edx
 004431A2    push        eax
 004431A3    mov         edi,esi
 004431A5    push        edi
 004431A6    call        user32.InflateRect
 004431AB    cmp         byte ptr [ebx+165],0
>004431B2    je          00443205
 004431B4    xor         eax,eax
 004431B6    cmp         byte ptr [ebx+163],0
>004431BD    je          004431C5
 004431BF    add         eax,dword ptr [ebx+168]
 004431C5    cmp         byte ptr [ebx+164],0
>004431CC    je          004431D4
 004431CE    add         eax,dword ptr [ebx+168]
 004431D4    mov         esi,edi
 004431D6    test        byte ptr [ebx+162],1
>004431DD    je          004431E1
 004431DF    add         dword ptr [esi],eax
 004431E1    test        byte ptr [ebx+162],2
>004431E8    je          004431ED
 004431EA    add         dword ptr [esi+4],eax
 004431ED    test        byte ptr [ebx+162],4
>004431F4    je          004431F9
 004431F6    sub         dword ptr [esi+8],eax
 004431F9    test        byte ptr [ebx+162],8
>00443200    je          00443205
 00443202    sub         dword ptr [esi+0C],eax
 00443205    pop         edi
 00443206    pop         esi
 00443207    pop         ebx
 00443208    ret
*}
end;

//0044320C
procedure TWinControl.WMNCPaint(var Message:TMessage);
begin
{*
 0044320C    push        ebp
 0044320D    mov         ebp,esp
 0044320F    add         esp,0FFFFFFC4
 00443212    push        ebx
 00443213    push        esi
 00443214    push        edi
 00443215    mov         dword ptr [ebp-8],edx
 00443218    mov         dword ptr [ebp-4],eax
 0044321B    mov         eax,dword ptr [ebp-4]
 0044321E    cmp         byte ptr [eax+165],0
>00443225    jne         00443237
 00443227    mov         eax,dword ptr [ebp-4]
 0044322A    cmp         dword ptr [eax+16C],0
>00443231    jbe         00443479
 00443237    mov         eax,dword ptr [ebp-4]
 0044323A    call        TWinControl.GetHandle
 0044323F    push        eax
 00443240    call        user32.GetWindowDC
 00443245    mov         dword ptr [ebp-0C],eax
 00443248    xor         edx,edx
 0044324A    push        ebp
 0044324B    push        443472
 00443250    push        dword ptr fs:[edx]
 00443253    mov         dword ptr fs:[edx],esp
 00443256    lea         eax,[ebp-1C]
 00443259    push        eax
 0044325A    mov         eax,dword ptr [ebp-4]
 0044325D    call        TWinControl.GetHandle
 00443262    push        eax
 00443263    call        user32.GetClientRect
 00443268    lea         eax,[ebp-2C]
 0044326B    push        eax
 0044326C    mov         eax,dword ptr [ebp-4]
 0044326F    call        TWinControl.GetHandle
 00443274    push        eax
 00443275    call        user32.GetWindowRect
 0044327A    push        2
 0044327C    lea         eax,[ebp-2C]
 0044327F    push        eax
 00443280    mov         eax,dword ptr [ebp-4]
 00443283    call        TWinControl.GetHandle
 00443288    push        eax
 00443289    push        0
 0044328B    call        user32.MapWindowPoints
 00443290    mov         eax,dword ptr [ebp-28]
 00443293    neg         eax
 00443295    push        eax
 00443296    mov         eax,dword ptr [ebp-2C]
 00443299    neg         eax
 0044329B    push        eax
 0044329C    lea         eax,[ebp-1C]
 0044329F    push        eax
 004432A0    call        user32.OffsetRect
 004432A5    mov         eax,dword ptr [ebp-10]
 004432A8    push        eax
 004432A9    mov         eax,dword ptr [ebp-14]
 004432AC    push        eax
 004432AD    mov         eax,dword ptr [ebp-18]
 004432B0    push        eax
 004432B1    mov         eax,dword ptr [ebp-1C]
 004432B4    push        eax
 004432B5    mov         eax,dword ptr [ebp-0C]
 004432B8    push        eax
 004432B9    call        gdi32.ExcludeClipRect
 004432BE    lea         esi,[ebp-2C]
 004432C1    lea         edi,[ebp-3C]
 004432C4    movs        dword ptr [edi],dword ptr [esi]
 004432C5    movs        dword ptr [edi],dword ptr [esi]
 004432C6    movs        dword ptr [edi],dword ptr [esi]
 004432C7    movs        dword ptr [edi],dword ptr [esi]
 004432C8    mov         eax,dword ptr [ebp-4]
 004432CB    mov         eax,dword ptr [eax+16C]
 004432D1    push        eax
 004432D2    push        eax
 004432D3    lea         eax,[ebp-1C]
 004432D6    push        eax
 004432D7    call        user32.InflateRect
 004432DC    lea         esi,[ebp-1C]
 004432DF    lea         edi,[ebp-2C]
 004432E2    movs        dword ptr [edi],dword ptr [esi]
 004432E3    movs        dword ptr [edi],dword ptr [esi]
 004432E4    movs        dword ptr [edi],dword ptr [esi]
 004432E5    movs        dword ptr [edi],dword ptr [esi]
 004432E6    mov         eax,dword ptr [ebp-4]
 004432E9    cmp         byte ptr [eax+165],0
>004432F0    je          004433FE
 004432F6    xor         ebx,ebx
 004432F8    mov         eax,dword ptr [ebp-4]
 004432FB    cmp         byte ptr [eax+163],0
>00443302    je          0044330D
 00443304    mov         eax,dword ptr [ebp-4]
 00443307    add         ebx,dword ptr [eax+168]
 0044330D    mov         eax,dword ptr [ebp-4]
 00443310    cmp         byte ptr [eax+164],0
>00443317    je          00443322
 00443319    mov         eax,dword ptr [ebp-4]
 0044331C    add         ebx,dword ptr [eax+168]
 00443322    push        0F0
 00443324    mov         eax,dword ptr [ebp-4]
 00443327    call        TWinControl.GetHandle
 0044332C    push        eax
 0044332D    call        user32.GetWindowLongA
 00443332    mov         esi,eax
 00443334    mov         eax,dword ptr [ebp-4]
 00443337    test        byte ptr [eax+162],1
>0044333E    je          00443343
 00443340    sub         dword ptr [ebp-2C],ebx
 00443343    mov         eax,dword ptr [ebp-4]
 00443346    test        byte ptr [eax+162],2
>0044334D    je          00443352
 0044334F    sub         dword ptr [ebp-28],ebx
 00443352    mov         eax,dword ptr [ebp-4]
 00443355    test        byte ptr [eax+162],4
>0044335C    je          00443361
 0044335E    add         dword ptr [ebp-24],ebx
 00443361    test        esi,200000
>00443367    je          00443377
 00443369    push        14
 0044336B    mov         eax,[005AE32C]
 00443370    mov         eax,dword ptr [eax]
 00443372    call        eax
 00443374    add         dword ptr [ebp-24],eax
 00443377    mov         eax,dword ptr [ebp-4]
 0044337A    test        byte ptr [eax+162],8
>00443381    je          00443386
 00443383    add         dword ptr [ebp-20],ebx
 00443386    test        esi,100000
>0044338C    je          0044339C
 0044338E    push        15
 00443390    mov         eax,[005AE32C]
 00443395    mov         eax,dword ptr [eax]
 00443397    call        eax
 00443399    add         dword ptr [ebp-20],eax
 0044339C    mov         eax,dword ptr [ebp-4]
 0044339F    movzx       eax,byte ptr [eax+162]
 004433A6    mov         edx,dword ptr [ebp-4]
 004433A9    movzx       edx,byte ptr [edx+165]
 004433B0    or          eax,dword ptr [edx*4+5ACC54]
 004433B7    mov         edx,dword ptr [ebp-4]
 004433BA    movzx       edx,byte ptr [edx+1A5]
 004433C1    or          eax,dword ptr [edx*4+5ACC64]
 004433C8    or          eax,2000
 004433CD    push        eax
 004433CE    mov         eax,dword ptr [ebp-4]
 004433D1    movzx       eax,byte ptr [eax+163]
 004433D8    mov         eax,dword ptr [eax*4+5ACC34]
 004433DF    mov         edx,dword ptr [ebp-4]
 004433E2    movzx       edx,byte ptr [edx+164]
 004433E9    or          eax,dword ptr [edx*4+5ACC44]
 004433F0    push        eax
 004433F1    lea         eax,[ebp-2C]
 004433F4    push        eax
 004433F5    mov         eax,dword ptr [ebp-0C]
 004433F8    push        eax
 004433F9    call        user32.DrawEdge
 004433FE    mov         eax,dword ptr [ebp-20]
 00443401    push        eax
 00443402    mov         eax,dword ptr [ebp-24]
 00443405    push        eax
 00443406    mov         eax,dword ptr [ebp-28]
 00443409    push        eax
 0044340A    mov         eax,dword ptr [ebp-2C]
 0044340D    push        eax
 0044340E    mov         eax,dword ptr [ebp-0C]
 00443411    push        eax
 00443412    call        gdi32.IntersectClipRect
 00443417    lea         esi,[ebp-3C]
 0044341A    lea         edi,[ebp-2C]
 0044341D    movs        dword ptr [edi],dword ptr [esi]
 0044341E    movs        dword ptr [edi],dword ptr [esi]
 0044341F    movs        dword ptr [edi],dword ptr [esi]
 00443420    movs        dword ptr [edi],dword ptr [esi]
 00443421    mov         eax,dword ptr [ebp-28]
 00443424    neg         eax
 00443426    push        eax
 00443427    mov         eax,dword ptr [ebp-2C]
 0044342A    neg         eax
 0044342C    push        eax
 0044342D    lea         eax,[ebp-2C]
 00443430    push        eax
 00443431    call        user32.OffsetRect
 00443436    mov         eax,dword ptr [ebp-4]
 00443439    mov         eax,dword ptr [eax+170]
 0044343F    call        TBrush.GetHandle
 00443444    push        eax
 00443445    lea         eax,[ebp-2C]
 00443448    push        eax
 00443449    mov         eax,dword ptr [ebp-0C]
 0044344C    push        eax
 0044344D    call        user32.FillRect
 00443452    xor         eax,eax
 00443454    pop         edx
 00443455    pop         ecx
 00443456    pop         ecx
 00443457    mov         dword ptr fs:[eax],edx
 0044345A    push        443479
 0044345F    mov         eax,dword ptr [ebp-0C]
 00443462    push        eax
 00443463    mov         eax,dword ptr [ebp-4]
 00443466    call        TWinControl.GetHandle
 0044346B    push        eax
 0044346C    call        user32.ReleaseDC
 00443471    ret
>00443472    jmp         @HandleFinally
>00443477    jmp         0044345F
 00443479    mov         edx,dword ptr [ebp-8]
 0044347C    mov         eax,dword ptr [ebp-4]
 0044347F    mov         ecx,dword ptr [eax]
 00443481    call        dword ptr [ecx-10]
 00443484    call        ThemeServices
 00443489    call        TThemeServices.GetThemesEnabled
 0044348E    test        al,al
>00443490    je          004434AA
 00443492    mov         eax,dword ptr [ebp-4]
 00443495    test        byte ptr [eax+52],2
>00443499    je          004434AA
 0044349B    call        ThemeServices
 004434A0    xor         ecx,ecx
 004434A2    mov         edx,dword ptr [ebp-4]
 004434A5    call        TThemeServices.PaintBorder
 004434AA    pop         edi
 004434AB    pop         esi
 004434AC    pop         ebx
 004434AD    mov         esp,ebp
 004434AF    pop         ebp
 004434B0    ret
*}
end;

//004434B4
procedure TWinControl.WMContextMenu(var Message:TWMContextMenu);
begin
{*
 004434B4    push        ebx
 004434B5    push        esi
 004434B6    push        edi
 004434B7    add         esp,0FFFFFFF0
 004434BA    mov         ebx,edx
 004434BC    mov         esi,eax
 004434BE    cmp         dword ptr [ebx+0C],0
>004434C2    jne         00443518
 004434C4    push        0
 004434C6    lea         edx,[esp+0C]
 004434CA    mov         eax,dword ptr [ebx+8]
 004434CD    call        SmallPointToPoint
 004434D2    lea         edx,[esp+0C]
 004434D6    lea         ecx,[esp+4]
 004434DA    mov         eax,esi
 004434DC    call        TControl.ScreenToClient
 004434E1    lea         edx,[esp+4]
 004434E5    xor         ecx,ecx
 004434E7    mov         eax,esi
 004434E9    call        TWinControl.ControlAtPos
 004434EE    mov         edi,eax
 004434F0    test        edi,edi
>004434F2    je          00443509
 004434F4    mov         eax,dword ptr [ebx+8]
 004434F7    push        eax
 004434F8    xor         ecx,ecx
 004434FA    mov         edx,7B
 004434FF    mov         eax,edi
 00443501    call        TControl.Perform
 00443506    mov         dword ptr [ebx+0C],eax
 00443509    cmp         dword ptr [ebx+0C],0
>0044350D    jne         00443518
 0044350F    mov         edx,ebx
 00443511    mov         eax,esi
 00443513    call        TControl.WMContextMenu
 00443518    add         esp,10
 0044351B    pop         edi
 0044351C    pop         esi
 0044351D    pop         ebx
 0044351E    ret
*}
end;

//00443520
procedure TWinControl.UpdateUIState(CharCode:Word);
begin
{*
 00443520    push        ebx
 00443521    push        esi
 00443522    mov         esi,edx
 00443524    call        GetParentForm
 00443529    mov         ebx,eax
 0044352B    test        ebx,ebx
>0044352D    je          00443580
 0044352F    sub         si,9
>00443533    je          00443544
 00443535    sub         si,9
>00443539    je          00443563
 0044353B    add         esi,0FFFFFFED
 0044353E    sub         si,4
>00443542    jae         00443580
 00443544    push        0
 00443546    mov         dx,1
 0044354A    mov         ax,2
 0044354E    call        MakeLong
 00443553    mov         ecx,eax
 00443555    mov         edx,127
 0044355A    mov         eax,ebx
 0044355C    call        TControl.Perform
>00443561    jmp         00443580
 00443563    push        0
 00443565    mov         dx,2
 00443569    mov         ax,2
 0044356D    call        MakeLong
 00443572    mov         ecx,eax
 00443574    mov         edx,127
 00443579    mov         eax,ebx
 0044357B    call        TControl.Perform
 00443580    pop         esi
 00443581    pop         ebx
 00443582    ret
*}
end;

//00443584
procedure TWinControl.WMPrintClient(var Message:TWMPrintClient);
begin
{*
 00443584    push        esi
 00443585    mov         esi,eax
 00443587    cmp         dword ptr [edx+0C],1
>0044358B    je          004435AB
 0044358D    test        byte ptr [edx+8],1
>00443591    je          00443599
 00443593    cmp         byte ptr [esi+57],0
>00443597    je          004435A2
 00443599    mov         eax,esi
 0044359B    call        TWinControl.PaintHandler
>004435A0    jmp         004435B2
 004435A2    mov         eax,esi
 004435A4    mov         ecx,dword ptr [eax]
 004435A6    call        dword ptr [ecx-10]
 004435A9    pop         esi
 004435AA    ret
 004435AB    mov         eax,esi
 004435AD    mov         ecx,dword ptr [eax]
 004435AF    call        dword ptr [ecx-10]
 004435B2    pop         esi
 004435B3    ret
*}
end;

//004435B4
function TWinControl.GetParentBackground:Boolean;
begin
{*
 004435B4    test        byte ptr [eax+52],4
 004435B8    setne       al
 004435BB    ret
*}
end;

//004435BC
procedure TWinControl.SetParentBackground(Value:Boolean);
begin
{*
 004435BC    push        ebx
 004435BD    push        esi
 004435BE    mov         ebx,edx
 004435C0    mov         esi,eax
 004435C2    mov         eax,esi
 004435C4    call        TWinControl.GetParentBackground
 004435C9    cmp         bl,al
>004435CB    je          004435F2
 004435CD    test        bl,bl
>004435CF    je          004435DE
 004435D1    mov         eax,[004435F8]
 004435D6    or          eax,dword ptr [esi+50]
 004435D9    mov         dword ptr [esi+50],eax
>004435DC    jmp         004435EB
 004435DE    mov         eax,[004435F8]
 004435E3    not         eax
 004435E5    and         eax,dword ptr [esi+50]
 004435E8    mov         dword ptr [esi+50],eax
 004435EB    mov         eax,esi
 004435ED    mov         edx,dword ptr [eax]
 004435EF    call        dword ptr [edx+7C]
 004435F2    pop         esi
 004435F3    pop         ebx
 004435F4    ret
*}
end;

//004435FC
constructor TGraphicControl.Create(AOwner:TComponent);
begin
{*
 004435FC    push        ebp
 004435FD    mov         ebp,esp
 004435FF    push        ecx
 00443600    push        ebx
 00443601    push        esi
 00443602    test        dl,dl
>00443604    je          0044360E
 00443606    add         esp,0FFFFFFF0
 00443609    call        @ClassCreate
 0044360E    mov         byte ptr [ebp-1],dl
 00443611    mov         ebx,eax
 00443613    xor         edx,edx
 00443615    mov         eax,ebx
 00443617    call        TControl.Create
 0044361C    mov         dl,1
 0044361E    mov         eax,[00436FD4];TControlCanvas
 00443623    call        TCanvas.Create
 00443628    mov         esi,eax
 0044362A    mov         dword ptr [ebx+160],esi
 00443630    mov         eax,esi
 00443632    mov         edx,ebx
 00443634    call        TControlCanvas.SetControl
 00443639    mov         eax,ebx
 0044363B    cmp         byte ptr [ebp-1],0
>0044363F    je          00443650
 00443641    call        @AfterConstruction
 00443646    pop         dword ptr fs:[0]
 0044364D    add         esp,0C
 00443650    mov         eax,ebx
 00443652    pop         esi
 00443653    pop         ebx
 00443654    pop         ecx
 00443655    pop         ebp
 00443656    ret
*}
end;

//00443658
destructor TGraphicControl.Destroy;
begin
{*
 00443658    push        ebx
 00443659    push        esi
 0044365A    call        @BeforeDestruction
 0044365F    mov         ebx,edx
 00443661    mov         esi,eax
 00443663    cmp         esi,dword ptr ds:[5ACC28]
>00443669    jne         00443672
 0044366B    xor         eax,eax
 0044366D    call        SetCaptureControl
 00443672    mov         eax,dword ptr [esi+160]
 00443678    call        TObject.Free
 0044367D    mov         edx,ebx
 0044367F    and         dl,0FC
 00443682    mov         eax,esi
 00443684    call        TControl.Destroy
 00443689    test        bl,bl
>0044368B    jle         00443694
 0044368D    mov         eax,esi
 0044368F    call        @ClassDestroy
 00443694    pop         esi
 00443695    pop         ebx
 00443696    ret
*}
end;

//00443698
procedure TGraphicControl.WMPaint(var Message:TWMPaint);
begin
{*
 00443698    push        ebp
 00443699    mov         ebp,esp
 0044369B    push        ecx
 0044369C    push        ebx
 0044369D    mov         ebx,edx
 0044369F    mov         dword ptr [ebp-4],eax
 004436A2    cmp         dword ptr [ebx+4],0
>004436A6    je          0044373A
 004436AC    mov         eax,dword ptr [ebp-4]
 004436AF    mov         eax,dword ptr [eax+160]
 004436B5    call        TCanvas.Lock
 004436BA    xor         eax,eax
 004436BC    push        ebp
 004436BD    push        443733
 004436C2    push        dword ptr fs:[eax]
 004436C5    mov         dword ptr fs:[eax],esp
 004436C8    mov         edx,dword ptr [ebx+4]
 004436CB    mov         eax,dword ptr [ebp-4]
 004436CE    mov         eax,dword ptr [eax+160]
 004436D4    call        TCanvas.SetHandle
 004436D9    xor         eax,eax
 004436DB    push        ebp
 004436DC    push        443710
 004436E1    push        dword ptr fs:[eax]
 004436E4    mov         dword ptr fs:[eax],esp
 004436E7    mov         eax,dword ptr [ebp-4]
 004436EA    mov         edx,dword ptr [eax]
 004436EC    call        dword ptr [edx+8C]
 004436F2    xor         eax,eax
 004436F4    pop         edx
 004436F5    pop         ecx
 004436F6    pop         ecx
 004436F7    mov         dword ptr fs:[eax],edx
 004436FA    push        443717
 004436FF    mov         eax,dword ptr [ebp-4]
 00443702    mov         eax,dword ptr [eax+160]
 00443708    xor         edx,edx
 0044370A    call        TCanvas.SetHandle
 0044370F    ret
>00443710    jmp         @HandleFinally
>00443715    jmp         004436FF
 00443717    xor         eax,eax
 00443719    pop         edx
 0044371A    pop         ecx
 0044371B    pop         ecx
 0044371C    mov         dword ptr fs:[eax],edx
 0044371F    push        44373A
 00443724    mov         eax,dword ptr [ebp-4]
 00443727    mov         eax,dword ptr [eax+160]
 0044372D    call        TCanvas.Unlock
 00443732    ret
>00443733    jmp         @HandleFinally
>00443738    jmp         00443724
 0044373A    pop         ebx
 0044373B    pop         ecx
 0044373C    pop         ebp
 0044373D    ret
*}
end;

//00443740
procedure sub_00443740;
begin
{*
 00443740    ret
*}
end;

//00443744
constructor THintWindow.Create(AOwner:TComponent);
begin
{*
 00443744    push        ebx
 00443745    push        esi
 00443746    test        dl,dl
>00443748    je          00443752
 0044374A    add         esp,0FFFFFFF0
 0044374D    call        @ClassCreate
 00443752    mov         ebx,edx
 00443754    mov         esi,eax
 00443756    xor         edx,edx
 00443758    mov         eax,esi
 0044375A    call        TCustomControl.Create
 0044375F    mov         edx,80FFFF
 00443764    mov         eax,esi
 00443766    call        TControl.SetColor
 0044376B    mov         eax,[005AE7DC];^Screen:TScreen
 00443770    mov         eax,dword ptr [eax]
 00443772    mov         edx,dword ptr [eax+80]
 00443778    mov         eax,dword ptr [esi+208]
 0044377E    call        TCanvas.SetFont
 00443783    mov         eax,dword ptr [esi+208]
 00443789    mov         eax,dword ptr [eax+14]
 0044378C    mov         dl,1
 0044378E    call        TBrush.SetStyle
 00443793    mov         eax,esi
 00443795    test        bl,bl
>00443797    je          004437A8
 00443799    call        @AfterConstruction
 0044379E    pop         dword ptr fs:[0]
 004437A5    add         esp,0C
 004437A8    mov         eax,esi
 004437AA    pop         esi
 004437AB    pop         ebx
 004437AC    ret
*}
end;

//004437B0
procedure THintWindow.CreateParams(var Params:TCreateParams);
begin
{*
 004437B0    push        ebx
 004437B1    push        esi
 004437B2    mov         ebx,edx
 004437B4    mov         esi,eax
 004437B6    mov         edx,ebx
 004437B8    mov         eax,esi
 004437BA    call        TWinControl.CreateParams
 004437BF    mov         dword ptr [ebx+4],80800000
 004437C6    or          dword ptr [ebx+24],800
 004437CD    cmp         byte ptr ds:[5E0C10],0;NewStyleControls:Boolean
>004437D4    je          004437DD
 004437D6    mov         dword ptr [ebx+8],80
 004437DD    mov         edx,1
 004437E2    mov         eax,5
 004437E7    call        CheckWin32Version
 004437EC    test        al,al
>004437EE    je          004437F7
 004437F0    or          dword ptr [ebx+24],20000
 004437F7    cmp         byte ptr ds:[5E0C10],0;NewStyleControls:Boolean
>004437FE    je          00443807
 00443800    mov         dword ptr [ebx+8],80
 00443807    lea         edx,[ebx+8]
 0044380A    mov         eax,esi
 0044380C    call        TWinControl.AddBiDiModeExStyle
 00443811    pop         esi
 00443812    pop         ebx
 00443813    ret
*}
end;

//00443814
procedure THintWindow.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 00443814    mov         dword ptr [edx+0C],0FFFFFFFF
 0044381B    ret
*}
end;

//0044381C
procedure THintWindow.WMNCPaint(var Message:TMessage);
begin
{*
 0044381C    push        ebp
 0044381D    mov         ebp,esp
 0044381F    add         esp,0FFFFFFF8
 00443822    mov         dword ptr [ebp-4],eax
 00443825    mov         eax,dword ptr [ebp-4]
 00443828    call        TWinControl.GetHandle
 0044382D    push        eax
 0044382E    call        user32.GetWindowDC
 00443833    mov         dword ptr [ebp-8],eax
 00443836    xor         eax,eax
 00443838    push        ebp
 00443839    push        443872
 0044383E    push        dword ptr fs:[eax]
 00443841    mov         dword ptr fs:[eax],esp
 00443844    mov         edx,dword ptr [ebp-8]
 00443847    mov         eax,dword ptr [ebp-4]
 0044384A    mov         ecx,dword ptr [eax]
 0044384C    call        dword ptr [ecx+0CC]
 00443852    xor         eax,eax
 00443854    pop         edx
 00443855    pop         ecx
 00443856    pop         ecx
 00443857    mov         dword ptr fs:[eax],edx
 0044385A    push        443879
 0044385F    mov         eax,dword ptr [ebp-8]
 00443862    push        eax
 00443863    mov         eax,dword ptr [ebp-4]
 00443866    call        TWinControl.GetHandle
 0044386B    push        eax
 0044386C    call        user32.ReleaseDC
 00443871    ret
>00443872    jmp         @HandleFinally
>00443877    jmp         0044385F
 00443879    pop         ecx
 0044387A    pop         ecx
 0044387B    pop         ebp
 0044387C    ret
*}
end;

//00443880
procedure THintWindow.Paint;
begin
{*
 00443880    push        ebp
 00443881    mov         ebp,esp
 00443883    add         esp,0FFFFFFEC
 00443886    push        ebx
 00443887    xor         edx,edx
 00443889    mov         dword ptr [ebp-14],edx
 0044388C    mov         ebx,eax
 0044388E    xor         eax,eax
 00443890    push        ebp
 00443891    push        443919
 00443896    push        dword ptr fs:[eax]
 00443899    mov         dword ptr fs:[eax],esp
 0044389C    lea         edx,[ebp-10]
 0044389F    mov         eax,ebx
 004438A1    mov         ecx,dword ptr [eax]
 004438A3    call        dword ptr [ecx+44]
 004438A6    add         dword ptr [ebp-10],2
 004438AA    add         dword ptr [ebp-0C],2
 004438AE    mov         eax,[005AE7DC];^Screen:TScreen
 004438B3    mov         eax,dword ptr [eax]
 004438B5    mov         eax,dword ptr [eax+80]
 004438BB    mov         edx,dword ptr [eax+18]
 004438BE    mov         eax,dword ptr [ebx+208]
 004438C4    mov         eax,dword ptr [eax+0C]
 004438C7    call        TFont.SetColor
 004438CC    mov         eax,ebx
 004438CE    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 004438D3    or          eax,810
 004438D8    push        eax
 004438D9    lea         eax,[ebp-10]
 004438DC    push        eax
 004438DD    push        0FF
 004438DF    lea         edx,[ebp-14]
 004438E2    mov         eax,ebx
 004438E4    call        TControl.GetText
 004438E9    mov         eax,dword ptr [ebp-14]
 004438EC    call        @LStrToPChar
 004438F1    push        eax
 004438F2    mov         eax,dword ptr [ebx+208]
 004438F8    call        TCanvas.GetHandle
 004438FD    push        eax
 004438FE    call        user32.DrawTextA
 00443903    xor         eax,eax
 00443905    pop         edx
 00443906    pop         ecx
 00443907    pop         ecx
 00443908    mov         dword ptr fs:[eax],edx
 0044390B    push        443920
 00443910    lea         eax,[ebp-14]
 00443913    call        @LStrClr
 00443918    ret
>00443919    jmp         @HandleFinally
>0044391E    jmp         00443910
 00443920    pop         ebx
 00443921    mov         esp,ebp
 00443923    pop         ebp
 00443924    ret
*}
end;

//00443928
function THintWindow.IsHintMsg(var Msg:TMsg):Boolean;
begin
{*
 00443928    push        esi
 00443929    mov         eax,dword ptr [edx+4]
 0044392C    cmp         eax,100
>00443931    jb          0044393A
 00443933    cmp         eax,108
>00443938    jbe         00443988
 0044393A    mov         ecx,dword ptr [edx+4]
 0044393D    cmp         ecx,0B000
>00443943    je          00443988
 00443945    cmp         ecx,0B001
>0044394B    je          00443988
 0044394D    cmp         dword ptr [edx+4],0B016
>00443954    je          00443988
 00443956    cmp         dword ptr [edx+4],0B017
>0044395D    je          00443988
 0044395F    cmp         dword ptr [edx+4],111
>00443966    je          00443988
 00443968    mov         esi,dword ptr [edx+4]
 0044396B    cmp         esi,200
>00443971    jbe         0044397B
 00443973    cmp         esi,20A
>00443979    jbe         00443988
 0044397B    cmp         dword ptr [edx+4],0A0
>00443982    je          00443988
 00443984    xor         eax,eax
 00443986    pop         esi
 00443987    ret
 00443988    mov         al,1
 0044398A    pop         esi
 0044398B    ret
*}
end;

//0044398C
procedure THintWindow.ReleaseHandle;
begin
{*
 0044398C    call        TWinControl.DestroyHandle
 00443991    ret
*}
end;

//00443994
procedure THintWindow.CMTextChanged(var Message:TMessage);
begin
{*
 00443994    push        ebp
 00443995    mov         ebp,esp
 00443997    push        0
 00443999    push        0
 0044399B    push        esi
 0044399C    mov         esi,eax
 0044399E    xor         eax,eax
 004439A0    push        ebp
 004439A1    push        443A1F
 004439A6    push        dword ptr fs:[eax]
 004439A9    mov         dword ptr fs:[eax],esp
 004439AC    mov         eax,esi
 004439AE    mov         ecx,dword ptr [eax]
 004439B0    call        dword ptr [ecx-10]
 004439B3    cmp         byte ptr [esi+210],0
>004439BA    jne         00443A04
 004439BC    lea         edx,[ebp-4]
 004439BF    mov         eax,esi
 004439C1    call        TControl.GetText
 004439C6    mov         edx,dword ptr [ebp-4]
 004439C9    mov         eax,dword ptr [esi+208]
 004439CF    call        TCanvas.TextWidth
 004439D4    mov         edx,eax
 004439D6    add         edx,6
 004439D9    mov         eax,esi
 004439DB    call        TControl.SetWidth
 004439E0    lea         edx,[ebp-8]
 004439E3    mov         eax,esi
 004439E5    call        TControl.GetText
 004439EA    mov         edx,dword ptr [ebp-8]
 004439ED    mov         eax,dword ptr [esi+208]
 004439F3    call        TCanvas.TextHeight
 004439F8    mov         edx,eax
 004439FA    add         edx,4
 004439FD    mov         eax,esi
 004439FF    call        TControl.SetHeight
 00443A04    xor         eax,eax
 00443A06    pop         edx
 00443A07    pop         ecx
 00443A08    pop         ecx
 00443A09    mov         dword ptr fs:[eax],edx
 00443A0C    push        443A26
 00443A11    lea         eax,[ebp-8]
 00443A14    mov         edx,2
 00443A19    call        @LStrArrayClr
 00443A1E    ret
>00443A1F    jmp         @HandleFinally
>00443A24    jmp         00443A11
 00443A26    pop         esi
 00443A27    pop         ecx
 00443A28    pop         ecx
 00443A29    pop         ebp
 00443A2A    ret
*}
end;

//00443A2C
procedure THintWindow.ActivateHint(Rect:TRect; const AHint:AnsiString);
begin
{*
 00443A2C    push        ebp
 00443A2D    mov         ebp,esp
 00443A2F    add         esp,0FFFFFFE0
 00443A32    push        ebx
 00443A33    push        esi
 00443A34    push        edi
 00443A35    mov         esi,edx
 00443A37    lea         edi,[ebp-18]
 00443A3A    movs        dword ptr [edi],dword ptr [esi]
 00443A3B    movs        dword ptr [edi],dword ptr [esi]
 00443A3C    movs        dword ptr [edi],dword ptr [esi]
 00443A3D    movs        dword ptr [edi],dword ptr [esi]
 00443A3E    mov         ebx,ecx
 00443A40    mov         dword ptr [ebp-4],eax
 00443A43    mov         esi,dword ptr ds:[5AE7DC];^Screen:TScreen
 00443A49    mov         eax,dword ptr [ebp-4]
 00443A4C    mov         byte ptr [eax+210],1
 00443A53    xor         eax,eax
 00443A55    push        ebp
 00443A56    push        443C05
 00443A5B    push        dword ptr fs:[eax]
 00443A5E    mov         dword ptr fs:[eax],esp
 00443A61    mov         edx,ebx
 00443A63    mov         eax,dword ptr [ebp-4]
 00443A66    call        TControl.SetText
 00443A6B    add         dword ptr [ebp-0C],4
 00443A6F    lea         edx,[ebp-18]
 00443A72    mov         eax,dword ptr [ebp-4]
 00443A75    call        TControl.UpdateBoundsRect
 00443A7A    mov         eax,dword ptr [esi]
 00443A7C    call        TScreen.GetDesktopHeight
 00443A81    mov         edx,dword ptr [ebp-4]
 00443A84    mov         edx,dword ptr [edx+4C]
 00443A87    add         edx,dword ptr [ebp-14]
 00443A8A    cmp         eax,edx
>00443A8C    jge         00443A9E
 00443A8E    mov         eax,dword ptr [esi]
 00443A90    call        TScreen.GetDesktopHeight
 00443A95    mov         edx,dword ptr [ebp-4]
 00443A98    sub         eax,dword ptr [edx+4C]
 00443A9B    mov         dword ptr [ebp-14],eax
 00443A9E    mov         eax,dword ptr [esi]
 00443AA0    call        TScreen.GetDesktopWidth
 00443AA5    mov         edx,dword ptr [ebp-4]
 00443AA8    mov         edx,dword ptr [edx+48]
 00443AAB    add         edx,dword ptr [ebp-18]
 00443AAE    cmp         eax,edx
>00443AB0    jge         00443AC2
 00443AB2    mov         eax,dword ptr [esi]
 00443AB4    call        TScreen.GetDesktopWidth
 00443AB9    mov         edx,dword ptr [ebp-4]
 00443ABC    sub         eax,dword ptr [edx+48]
 00443ABF    mov         dword ptr [ebp-18],eax
 00443AC2    mov         eax,dword ptr [esi]
 00443AC4    call        TScreen.GetDesktopLeft
 00443AC9    cmp         eax,dword ptr [ebp-18]
>00443ACC    jle         00443AD8
 00443ACE    mov         eax,dword ptr [esi]
 00443AD0    call        TScreen.GetDesktopLeft
 00443AD5    mov         dword ptr [ebp-18],eax
 00443AD8    mov         eax,dword ptr [esi]
 00443ADA    call        TScreen.GetDesktopTop
 00443ADF    cmp         eax,dword ptr [ebp-0C]
>00443AE2    jle         00443AEE
 00443AE4    mov         eax,dword ptr [esi]
 00443AE6    call        TScreen.GetDesktopTop
 00443AEB    mov         dword ptr [ebp-0C],eax
 00443AEE    push        10
 00443AF0    mov         eax,dword ptr [ebp-4]
 00443AF3    mov         eax,dword ptr [eax+4C]
 00443AF6    push        eax
 00443AF7    mov         eax,dword ptr [ebp-4]
 00443AFA    mov         eax,dword ptr [eax+48]
 00443AFD    push        eax
 00443AFE    mov         eax,dword ptr [ebp-14]
 00443B01    push        eax
 00443B02    mov         eax,dword ptr [ebp-18]
 00443B05    push        eax
 00443B06    push        0FF
 00443B08    mov         eax,dword ptr [ebp-4]
 00443B0B    call        TWinControl.GetHandle
 00443B10    push        eax
 00443B11    call        user32.SetWindowPos
 00443B16    call        KERNEL32.GetTickCount
 00443B1B    mov         edx,dword ptr [ebp-4]
 00443B1E    sub         eax,dword ptr [edx+214]
 00443B24    cmp         eax,0FA
>00443B29    jbe         00443BB5
 00443B2F    mov         eax,ebx
 00443B31    call        @LStrLen
 00443B36    cmp         eax,64
>00443B39    jge         00443BB5
 00443B3B    cmp         dword ptr ds:[5ACB64],0
>00443B42    je          00443BB5
 00443B44    push        0
 00443B46    lea         eax,[ebp-8]
 00443B49    push        eax
 00443B4A    push        0
 00443B4C    push        1016
 00443B51    call        user32.SystemParametersInfoA
 00443B56    cmp         dword ptr [ebp-8],0
>00443B5A    je          00443BB5
 00443B5C    push        0
 00443B5E    lea         eax,[ebp-8]
 00443B61    push        eax
 00443B62    push        0
 00443B64    push        1018
 00443B69    call        user32.SystemParametersInfoA
 00443B6E    cmp         dword ptr [ebp-8],0
>00443B72    je          00443B78
 00443B74    mov         bl,2
>00443B76    jmp         00443B93
 00443B78    lea         edx,[ebp-20]
 00443B7B    mov         eax,[005E0C0C];Mouse:TMouse
 00443B80    call        TMouse.GetCursorPos
 00443B85    mov         eax,dword ptr [ebp-1C]
 00443B88    cmp         eax,dword ptr [ebp-14]
>00443B8B    jle         00443B91
 00443B8D    xor         ebx,ebx
>00443B8F    jmp         00443B93
 00443B91    mov         bl,1
 00443B93    xor         eax,eax
 00443B95    mov         al,bl
 00443B97    mov         eax,dword ptr [eax*4+5ACC6C]
 00443B9E    or          eax,40000
 00443BA3    push        eax
 00443BA4    push        64
 00443BA6    mov         eax,dword ptr [ebp-4]
 00443BA9    call        TWinControl.GetHandle
 00443BAE    push        eax
 00443BAF    call        dword ptr ds:[5ACB64]
 00443BB5    mov         eax,[005AE584];^Application:TApplication
 00443BBA    mov         eax,dword ptr [eax]
 00443BBC    mov         edx,dword ptr [eax+30]
 00443BBF    mov         eax,dword ptr [ebp-4]
 00443BC2    call        TWinControl.SetParentWindow
 00443BC7    push        4
 00443BC9    mov         eax,dword ptr [ebp-4]
 00443BCC    call        TWinControl.GetHandle
 00443BD1    push        eax
 00443BD2    call        user32.ShowWindow
 00443BD7    mov         eax,dword ptr [ebp-4]
 00443BDA    mov         edx,dword ptr [eax]
 00443BDC    call        dword ptr [edx+7C]
 00443BDF    xor         eax,eax
 00443BE1    pop         edx
 00443BE2    pop         ecx
 00443BE3    pop         ecx
 00443BE4    mov         dword ptr fs:[eax],edx
 00443BE7    push        443C0C
 00443BEC    call        KERNEL32.GetTickCount
 00443BF1    mov         edx,dword ptr [ebp-4]
 00443BF4    mov         dword ptr [edx+214],eax
 00443BFA    mov         eax,dword ptr [ebp-4]
 00443BFD    mov         byte ptr [eax+210],0
 00443C04    ret
>00443C05    jmp         @HandleFinally
>00443C0A    jmp         00443BEC
 00443C0C    pop         edi
 00443C0D    pop         esi
 00443C0E    pop         ebx
 00443C0F    mov         esp,ebp
 00443C11    pop         ebp
 00443C12    ret
*}
end;

//00443C14
procedure THintWindow.ActivateHintData(Rect:TRect; const AHint:AnsiString; AData:Pointer);
begin
{*
 00443C14    push        ebp
 00443C15    mov         ebp,esp
 00443C17    add         esp,0FFFFFFF0
 00443C1A    push        ebx
 00443C1B    push        esi
 00443C1C    push        edi
 00443C1D    mov         esi,edx
 00443C1F    lea         edi,[ebp-10]
 00443C22    movs        dword ptr [edi],dword ptr [esi]
 00443C23    movs        dword ptr [edi],dword ptr [esi]
 00443C24    movs        dword ptr [edi],dword ptr [esi]
 00443C25    movs        dword ptr [edi],dword ptr [esi]
 00443C26    lea         edx,[ebp-10]
 00443C29    mov         ebx,dword ptr [eax]
 00443C2B    call        dword ptr [ebx+0D0]
 00443C31    pop         edi
 00443C32    pop         esi
 00443C33    pop         ebx
 00443C34    mov         esp,ebp
 00443C36    pop         ebp
 00443C37    ret         4
*}
end;

//00443C3C
{*procedure sub_00443C3C(?:?; ?:?; ?:?);
begin
 00443C3C    push        ebp
 00443C3D    mov         ebp,esp
 00443C3F    push        ecx
 00443C40    push        ebx
 00443C41    push        esi
 00443C42    push        edi
 00443C43    mov         dword ptr [ebp-4],ecx
 00443C46    mov         edi,edx
 00443C48    mov         esi,eax
 00443C4A    mov         ebx,dword ptr [ebp+8]
 00443C4D    push        0
 00443C4F    push        ebx
 00443C50    mov         ecx,edi
 00443C52    xor         edx,edx
 00443C54    xor         eax,eax
 00443C56    call        Bounds
 00443C5B    mov         eax,esi
 00443C5D    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 00443C62    or          eax,0C10
 00443C67    push        eax
 00443C68    push        ebx
 00443C69    push        0FF
 00443C6B    mov         eax,dword ptr [ebp-4]
 00443C6E    call        @LStrToPChar
 00443C73    push        eax
 00443C74    mov         eax,dword ptr [esi+208];THintWindow.FCanvas:TCanvas
 00443C7A    call        TCanvas.GetHandle
 00443C7F    push        eax
 00443C80    call        user32.DrawTextA
 00443C85    add         dword ptr [ebx+8],6
 00443C89    add         dword ptr [ebx+0C],2
 00443C8D    pop         edi
 00443C8E    pop         esi
 00443C8F    pop         ebx
 00443C90    pop         ecx
 00443C91    pop         ebp
 00443C92    ret         8
end;*}

//00443C98
{*procedure sub_00443C98(?:?);
begin
 00443C98    push        ebx
 00443C99    push        esi
 00443C9A    add         esp,0FFFFFFE4
 00443C9D    mov         esi,edx
 00443C9F    mov         ebx,eax
 00443CA1    mov         eax,dword ptr [ebx+4C];THintWindow.Height:Integer
 00443CA4    push        eax
 00443CA5    lea         eax,[esp+4]
 00443CA9    push        eax
 00443CAA    mov         ecx,dword ptr [ebx+48];THintWindow.Width:Integer
 00443CAD    xor         edx,edx
 00443CAF    xor         eax,eax
 00443CB1    call        Bounds
 00443CB6    call        ThemeServices
 00443CBB    call        TThemeServices.GetThemesEnabled
 00443CC0    test        al,al
>00443CC2    jne         00443CD5
 00443CC4    push        0F
 00443CC6    push        1
 00443CC8    lea         eax,[esp+8]
 00443CCC    push        eax
 00443CCD    push        esi
 00443CCE    call        user32.DrawEdge
>00443CD3    jmp         00443CFC
 00443CD5    call        ThemeServices
 00443CDA    lea         ecx,[esp+10]
 00443CDE    mov         dl,1
 00443CE0    call        TThemeServices.GetElementDetails
 00443CE5    push        esp
 00443CE6    push        1
 00443CE8    push        0F
 00443CEA    push        0
 00443CEC    call        ThemeServices
 00443CF1    lea         ecx,[esp+20]
 00443CF5    mov         edx,esi
 00443CF7    call        TThemeServices.DrawEdge
 00443CFC    add         esp,1C
 00443CFF    pop         esi
 00443D00    pop         ebx
 00443D01    ret
end;*}

//00443D04
procedure THintWindow.WMPrint(var Message:TMessage);
begin
{*
 00443D04    push        ebx
 00443D05    push        esi
 00443D06    mov         esi,edx
 00443D08    mov         ebx,eax
 00443D0A    push        0
 00443D0C    mov         edx,dword ptr [esi+4]
 00443D0F    xor         ecx,ecx
 00443D11    mov         eax,ebx
 00443D13    call        TWinControl.PaintTo
 00443D18    mov         edx,dword ptr [esi+4]
 00443D1B    mov         eax,ebx
 00443D1D    mov         ecx,dword ptr [eax]
 00443D1F    call        dword ptr [ecx+0CC]
 00443D25    pop         esi
 00443D26    pop         ebx
 00443D27    ret
*}
end;

//00443D28
function ClientToWindow(Handle:HWND; X:Integer; Y:Integer):TPoint;
begin
{*
 00443D28    push        ebp
 00443D29    mov         ebp,esp
 00443D2B    add         esp,0FFFFFFE8
 00443D2E    push        ebx
 00443D2F    push        esi
 00443D30    mov         ebx,eax
 00443D32    mov         esi,dword ptr [ebp+8]
 00443D35    mov         dword ptr [ebp-8],edx
 00443D38    mov         dword ptr [ebp-4],ecx
 00443D3B    lea         eax,[ebp-8]
 00443D3E    push        eax
 00443D3F    push        ebx
 00443D40    call        user32.ClientToScreen
 00443D45    lea         eax,[ebp-18]
 00443D48    push        eax
 00443D49    push        ebx
 00443D4A    call        user32.GetWindowRect
 00443D4F    mov         eax,dword ptr [ebp-8]
 00443D52    sub         eax,dword ptr [ebp-18]
 00443D55    mov         dword ptr [esi],eax
 00443D57    mov         eax,dword ptr [ebp-4]
 00443D5A    sub         eax,dword ptr [ebp-14]
 00443D5D    mov         dword ptr [esi+4],eax
 00443D60    pop         esi
 00443D61    pop         ebx
 00443D62    mov         esp,ebp
 00443D64    pop         ebp
 00443D65    ret         4
*}
end;

//00443D68
procedure TDragImageList.CombineDragCursor;
begin
{*
 00443D68    push        ebp
 00443D69    mov         ebp,esp
 00443D6B    add         esp,0FFFFFFF4
 00443D6E    push        ebx
 00443D6F    mov         ebx,eax
 00443D71    cmp         word ptr [ebx+68],0FFFFFFFF
>00443D76    je          00443E2F
 00443D7C    push        1
 00443D7E    push        1
 00443D80    push        1
 00443D82    push        0E
 00443D84    mov         eax,[005AE32C]
 00443D89    mov         eax,dword ptr [eax]
 00443D8B    call        eax
 00443D8D    push        eax
 00443D8E    push        0D
 00443D90    mov         eax,[005AE32C]
 00443D95    mov         eax,dword ptr [eax]
 00443D97    call        eax
 00443D99    push        eax
 00443D9A    call        comctl32.ImageList_Create
 00443D9F    mov         dword ptr [ebp-4],eax
 00443DA2    xor         eax,eax
 00443DA4    push        ebp
 00443DA5    push        443E28
 00443DAA    push        dword ptr fs:[eax]
 00443DAD    mov         dword ptr fs:[eax],esp
 00443DB0    movsx       edx,word ptr [ebx+68]
 00443DB4    mov         eax,[005AE7DC];^Screen:TScreen
 00443DB9    mov         eax,dword ptr [eax]
 00443DBB    call        TScreen.GetCursors
 00443DC0    mov         edx,eax
 00443DC2    mov         eax,dword ptr [ebp-4]
 00443DC5    call        ImageList_AddIcon
 00443DCA    movsx       edx,word ptr [ebx+68]
 00443DCE    mov         eax,[005AE7DC];^Screen:TScreen
 00443DD3    mov         eax,dword ptr [eax]
 00443DD5    call        TScreen.GetCursors
 00443DDA    mov         edx,eax
 00443DDC    mov         eax,dword ptr [ebp-4]
 00443DDF    call        ImageList_AddIcon
 00443DE4    push        0
 00443DE6    push        0
 00443DE8    push        0
 00443DEA    mov         eax,dword ptr [ebp-4]
 00443DED    push        eax
 00443DEE    call        comctl32.ImageList_SetDragCursorImage
 00443DF3    lea         eax,[ebp-0C]
 00443DF6    push        eax
 00443DF7    push        0
 00443DF9    call        comctl32.ImageList_GetDragImage
 00443DFE    mov         eax,dword ptr [ebp-8]
 00443E01    push        eax
 00443E02    mov         eax,dword ptr [ebp-0C]
 00443E05    push        eax
 00443E06    push        1
 00443E08    mov         eax,dword ptr [ebp-4]
 00443E0B    push        eax
 00443E0C    call        comctl32.ImageList_SetDragCursorImage
 00443E11    xor         eax,eax
 00443E13    pop         edx
 00443E14    pop         ecx
 00443E15    pop         ecx
 00443E16    mov         dword ptr fs:[eax],edx
 00443E19    push        443E2F
 00443E1E    mov         eax,dword ptr [ebp-4]
 00443E21    push        eax
 00443E22    call        comctl32.ImageList_Destroy
 00443E27    ret
>00443E28    jmp         @HandleFinally
>00443E2D    jmp         00443E1E
 00443E2F    pop         ebx
 00443E30    mov         esp,ebp
 00443E32    pop         ebp
 00443E33    ret
*}
end;

//00443E34
function TDragImageList.SetDragImage(Index:Integer; HotSpotX:Integer; HotSpotY:Integer):Boolean;
begin
{*
 00443E34    push        ebp
 00443E35    mov         ebp,esp
 00443E37    push        ebx
 00443E38    push        esi
 00443E39    push        edi
 00443E3A    mov         edi,ecx
 00443E3C    mov         esi,edx
 00443E3E    mov         ebx,eax
 00443E40    mov         eax,ebx
 00443E42    call        TCustomImageList.HandleAllocated
 00443E47    test        al,al
>00443E49    je          00443E71
 00443E4B    mov         dword ptr [ebx+78],esi
 00443E4E    mov         dword ptr [ebx+70],edi
 00443E51    mov         eax,dword ptr [ebp+8]
 00443E54    mov         dword ptr [ebx+74],eax
 00443E57    mov         eax,dword ptr [ebp+8]
 00443E5A    push        eax
 00443E5B    push        edi
 00443E5C    push        esi
 00443E5D    mov         eax,ebx
 00443E5F    call        TCustomImageList.GetHandle
 00443E64    push        eax
 00443E65    call        comctl32.ImageList_BeginDrag
 00443E6A    mov         al,1
 00443E6C    mov         byte ptr [ebx+6A],al
>00443E6F    jmp         00443E73
 00443E71    xor         eax,eax
 00443E73    pop         edi
 00443E74    pop         esi
 00443E75    pop         ebx
 00443E76    pop         ebp
 00443E77    ret         4
*}
end;

//00443E7C
procedure TDragImageList.SetDragCursor(Value:TCursor);
begin
{*
 00443E7C    cmp         dx,word ptr [eax+68]
>00443E80    je          00443E91
 00443E82    mov         word ptr [eax+68],dx
 00443E86    cmp         byte ptr [eax+6A],0
>00443E8A    je          00443E91
 00443E8C    call        TDragImageList.CombineDragCursor
 00443E91    ret
*}
end;

//00443E94
function TDragImageList.BeginDrag(Window:HWND; X:Integer; Y:Integer):Boolean;
begin
{*
 00443E94    push        ebp
 00443E95    mov         ebp,esp
 00443E97    push        ecx
 00443E98    push        ebx
 00443E99    push        esi
 00443E9A    push        edi
 00443E9B    mov         dword ptr [ebp-4],ecx
 00443E9E    mov         edi,edx
 00443EA0    mov         esi,eax
 00443EA2    xor         ebx,ebx
 00443EA4    mov         eax,esi
 00443EA6    call        TCustomImageList.HandleAllocated
 00443EAB    test        al,al
>00443EAD    je          00443EEA
 00443EAF    cmp         byte ptr [esi+6A],0
>00443EB3    jne         00443EC6
 00443EB5    mov         eax,dword ptr [esi+74]
 00443EB8    push        eax
 00443EB9    mov         ecx,dword ptr [esi+70]
 00443EBC    mov         edx,dword ptr [esi+78]
 00443EBF    mov         eax,esi
 00443EC1    call        TDragImageList.SetDragImage
 00443EC6    mov         eax,esi
 00443EC8    call        TDragImageList.CombineDragCursor
 00443ECD    mov         eax,dword ptr [ebp+8]
 00443ED0    push        eax
 00443ED1    mov         ecx,dword ptr [ebp-4]
 00443ED4    mov         edx,edi
 00443ED6    mov         eax,esi
 00443ED8    call        TDragImageList.DragLock
 00443EDD    mov         ebx,eax
 00443EDF    test        bl,bl
>00443EE1    je          00443EEA
 00443EE3    push        0
 00443EE5    call        user32.ShowCursor
 00443EEA    mov         eax,ebx
 00443EEC    pop         edi
 00443EED    pop         esi
 00443EEE    pop         ebx
 00443EEF    pop         ecx
 00443EF0    pop         ebp
 00443EF1    ret         4
*}
end;

//00443EF4
function TDragImageList.DragLock(Window:HWND; XPos:Integer; YPos:Integer):Boolean;
begin
{*
 00443EF4    push        ebp
 00443EF5    mov         ebp,esp
 00443EF7    add         esp,0FFFFFFF4
 00443EFA    push        ebx
 00443EFB    push        esi
 00443EFC    push        edi
 00443EFD    mov         dword ptr [ebp-4],ecx
 00443F00    mov         esi,edx
 00443F02    mov         edi,eax
 00443F04    xor         ebx,ebx
 00443F06    mov         eax,edi
 00443F08    call        TCustomImageList.HandleAllocated
 00443F0D    test        al,al
>00443F0F    je          00443F4A
 00443F11    cmp         esi,dword ptr [edi+6C]
>00443F14    je          00443F4A
 00443F16    mov         eax,edi
 00443F18    call        TDragImageList.DragUnlock
 00443F1D    mov         ebx,esi
 00443F1F    mov         dword ptr [edi+6C],ebx
 00443F22    lea         eax,[ebp-0C]
 00443F25    push        eax
 00443F26    mov         ecx,dword ptr [ebp+8]
 00443F29    mov         edx,dword ptr [ebp-4]
 00443F2C    mov         eax,ebx
 00443F2E    call        ClientToWindow
 00443F33    mov         eax,dword ptr [ebp-8]
 00443F36    push        eax
 00443F37    mov         eax,dword ptr [ebp-0C]
 00443F3A    push        eax
 00443F3B    mov         eax,dword ptr [edi+6C]
 00443F3E    push        eax
 00443F3F    call        comctl32.ImageList_DragEnter
 00443F44    cmp         eax,1
 00443F47    sbb         ebx,ebx
 00443F49    inc         ebx
 00443F4A    mov         eax,ebx
 00443F4C    pop         edi
 00443F4D    pop         esi
 00443F4E    pop         ebx
 00443F4F    mov         esp,ebp
 00443F51    pop         ebp
 00443F52    ret         4
*}
end;

//00443F58
procedure TDragImageList.DragUnlock;
begin
{*
 00443F58    push        ebx
 00443F59    mov         ebx,eax
 00443F5B    mov         eax,ebx
 00443F5D    call        TCustomImageList.HandleAllocated
 00443F62    test        al,al
>00443F64    je          00443F7A
 00443F66    cmp         dword ptr [ebx+6C],0
>00443F6A    je          00443F7A
 00443F6C    mov         eax,dword ptr [ebx+6C]
 00443F6F    push        eax
 00443F70    call        comctl32.ImageList_DragLeave
 00443F75    xor         eax,eax
 00443F77    mov         dword ptr [ebx+6C],eax
 00443F7A    pop         ebx
 00443F7B    ret
*}
end;

//00443F7C
function TDragImageList.DragMove(X:Integer; Y:Integer):Boolean;
begin
{*
 00443F7C    push        ebx
 00443F7D    push        esi
 00443F7E    push        edi
 00443F7F    add         esp,0FFFFFFF8
 00443F82    mov         edi,ecx
 00443F84    mov         esi,edx
 00443F86    mov         ebx,eax
 00443F88    mov         eax,ebx
 00443F8A    call        TCustomImageList.HandleAllocated
 00443F8F    test        al,al
>00443F91    je          00443FB7
 00443F93    push        esp
 00443F94    mov         ecx,edi
 00443F96    mov         edx,esi
 00443F98    mov         eax,dword ptr [ebx+6C]
 00443F9B    call        ClientToWindow
 00443FA0    mov         eax,dword ptr [esp+4]
 00443FA4    push        eax
 00443FA5    mov         eax,dword ptr [esp+4]
 00443FA9    push        eax
 00443FAA    call        comctl32.ImageList_DragMove
 00443FAF    cmp         eax,1
 00443FB2    sbb         eax,eax
 00443FB4    inc         eax
>00443FB5    jmp         00443FB9
 00443FB7    xor         eax,eax
 00443FB9    pop         ecx
 00443FBA    pop         edx
 00443FBB    pop         edi
 00443FBC    pop         esi
 00443FBD    pop         ebx
 00443FBE    ret
*}
end;

//00443FC0
procedure TDragImageList.ShowDragImage;
begin
{*
 00443FC0    push        ebx
 00443FC1    mov         ebx,eax
 00443FC3    mov         eax,ebx
 00443FC5    call        TCustomImageList.HandleAllocated
 00443FCA    test        al,al
>00443FCC    je          00443FD5
 00443FCE    push        0FF
 00443FD0    call        comctl32.ImageList_DragShowNolock
 00443FD5    pop         ebx
 00443FD6    ret
*}
end;

//00443FD8
procedure TDragImageList.HideDragImage;
begin
{*
 00443FD8    push        ebx
 00443FD9    mov         ebx,eax
 00443FDB    mov         eax,ebx
 00443FDD    call        TCustomImageList.HandleAllocated
 00443FE2    test        al,al
>00443FE4    je          00443FED
 00443FE6    push        0
 00443FE8    call        comctl32.ImageList_DragShowNolock
 00443FED    pop         ebx
 00443FEE    ret
*}
end;

//00443FF0
function TDragImageList.EndDrag:Boolean;
begin
{*
 00443FF0    push        ebx
 00443FF1    push        esi
 00443FF2    mov         esi,eax
 00443FF4    mov         eax,esi
 00443FF6    call        TCustomImageList.HandleAllocated
 00443FFB    test        al,al
>00443FFD    je          0044402E
 00443FFF    cmp         byte ptr [esi+6A],0
>00444003    je          0044402E
 00444005    mov         eax,esi
 00444007    call        TDragImageList.DragUnlock
 0044400C    call        comctl32.ImageList_EndDrag
 00444011    cmp         eax,1
 00444014    sbb         ebx,ebx
 00444016    inc         ebx
 00444017    mov         byte ptr [esi+6A],0
 0044401B    or          edx,0FFFFFFFF
 0044401E    mov         eax,esi
 00444020    call        TDragImageList.SetDragCursor
 00444025    push        0FF
 00444027    call        user32.ShowCursor
>0044402C    jmp         00444030
 0044402E    xor         ebx,ebx
 00444030    mov         eax,ebx
 00444032    pop         esi
 00444033    pop         ebx
 00444034    ret
*}
end;

//00444038
constructor TCustomControl.Create(AOwner:TComponent);
begin
{*
 00444038    push        ebp
 00444039    mov         ebp,esp
 0044403B    push        ecx
 0044403C    push        ebx
 0044403D    push        esi
 0044403E    test        dl,dl
>00444040    je          0044404A
 00444042    add         esp,0FFFFFFF0
 00444045    call        @ClassCreate
 0044404A    mov         byte ptr [ebp-1],dl
 0044404D    mov         ebx,eax
 0044404F    xor         edx,edx
 00444051    mov         eax,ebx
 00444053    call        TWinControl.Create
 00444058    mov         dl,1
 0044405A    mov         eax,[00436FD4];TControlCanvas
 0044405F    call        TCanvas.Create
 00444064    mov         esi,eax
 00444066    mov         dword ptr [ebx+208],esi
 0044406C    mov         eax,esi
 0044406E    mov         edx,ebx
 00444070    call        TControlCanvas.SetControl
 00444075    mov         eax,ebx
 00444077    cmp         byte ptr [ebp-1],0
>0044407B    je          0044408C
 0044407D    call        @AfterConstruction
 00444082    pop         dword ptr fs:[0]
 00444089    add         esp,0C
 0044408C    mov         eax,ebx
 0044408E    pop         esi
 0044408F    pop         ebx
 00444090    pop         ecx
 00444091    pop         ebp
 00444092    ret
*}
end;

//00444094
destructor TCustomControl.Destroy;
begin
{*
 00444094    push        ebx
 00444095    push        esi
 00444096    call        @BeforeDestruction
 0044409B    mov         ebx,edx
 0044409D    mov         esi,eax
 0044409F    mov         eax,dword ptr [esi+208]
 004440A5    call        TObject.Free
 004440AA    mov         edx,ebx
 004440AC    and         dl,0FC
 004440AF    mov         eax,esi
 004440B1    call        TWinControl.Destroy
 004440B6    test        bl,bl
>004440B8    jle         004440C1
 004440BA    mov         eax,esi
 004440BC    call        @ClassDestroy
 004440C1    pop         esi
 004440C2    pop         ebx
 004440C3    ret
*}
end;

//004440C4
procedure TCustomControl.WMPaint(var Message:TWMPaint);
begin
{*
 004440C4    push        ebx
 004440C5    push        esi
 004440C6    mov         esi,edx
 004440C8    mov         ebx,eax
 004440CA    or          word ptr [ebx+54],100
 004440D0    mov         edx,esi
 004440D2    mov         eax,ebx
 004440D4    call        TWinControl.WMPaint
 004440D9    and         word ptr [ebx+54],0FEFF
 004440DF    pop         esi
 004440E0    pop         ebx
 004440E1    ret
*}
end;

//004440E4
procedure TCustomControl.PaintWindow(DC:HDC);
begin
{*
 004440E4    push        ebp
 004440E5    mov         ebp,esp
 004440E7    push        ecx
 004440E8    push        ebx
 004440E9    mov         ebx,edx
 004440EB    mov         dword ptr [ebp-4],eax
 004440EE    mov         eax,dword ptr [ebp-4]
 004440F1    mov         eax,dword ptr [eax+208]
 004440F7    call        TCanvas.Lock
 004440FC    xor         eax,eax
 004440FE    push        ebp
 004440FF    push        444182
 00444104    push        dword ptr fs:[eax]
 00444107    mov         dword ptr fs:[eax],esp
 0044410A    mov         eax,dword ptr [ebp-4]
 0044410D    mov         eax,dword ptr [eax+208]
 00444113    mov         edx,ebx
 00444115    call        TCanvas.SetHandle
 0044411A    xor         eax,eax
 0044411C    push        ebp
 0044411D    push        44415F
 00444122    push        dword ptr fs:[eax]
 00444125    mov         dword ptr fs:[eax],esp
 00444128    mov         eax,dword ptr [ebp-4]
 0044412B    mov         eax,dword ptr [eax+208]
 00444131    call        TControlCanvas.UpdateTextFlags
 00444136    mov         eax,dword ptr [ebp-4]
 00444139    mov         edx,dword ptr [eax]
 0044413B    call        dword ptr [edx+0C8]
 00444141    xor         eax,eax
 00444143    pop         edx
 00444144    pop         ecx
 00444145    pop         ecx
 00444146    mov         dword ptr fs:[eax],edx
 00444149    push        444166
 0044414E    mov         eax,dword ptr [ebp-4]
 00444151    mov         eax,dword ptr [eax+208]
 00444157    xor         edx,edx
 00444159    call        TCanvas.SetHandle
 0044415E    ret
>0044415F    jmp         @HandleFinally
>00444164    jmp         0044414E
 00444166    xor         eax,eax
 00444168    pop         edx
 00444169    pop         ecx
 0044416A    pop         ecx
 0044416B    mov         dword ptr fs:[eax],edx
 0044416E    push        444189
 00444173    mov         eax,dword ptr [ebp-4]
 00444176    mov         eax,dword ptr [eax+208]
 0044417C    call        TCanvas.Unlock
 00444181    ret
>00444182    jmp         @HandleFinally
>00444187    jmp         00444173
 00444189    pop         ebx
 0044418A    pop         ecx
 0044418B    pop         ebp
 0044418C    ret
*}
end;

//00444190
procedure sub_00444190;
begin
{*
 00444190    ret
*}
end;

//00444194
function NextVisibleZone(StartZone:TDockZone):TDockZone;
begin
{*
 00444194    push        ebx
 00444195    mov         ebx,eax
>00444197    jmp         0044419C
 00444199    mov         ebx,dword ptr [ebx+0C]
 0044419C    test        ebx,ebx
>0044419E    je          004441AB
 004441A0    mov         eax,ebx
 004441A2    call        TDockZone.GetVisible
 004441A7    test        al,al
>004441A9    je          00444199
 004441AB    mov         eax,ebx
 004441AD    pop         ebx
 004441AE    ret
*}
end;

//004441B0
function IsOrientationSet(Zone:TDockZone):Boolean;
begin
{*
 004441B0    mov         edx,dword ptr [eax+14]
 004441B3    test        edx,edx
>004441B5    je          004441BD
 004441B7    cmp         byte ptr [edx+10],0
>004441BB    jne         004441CE
 004441BD    mov         edx,dword ptr [eax+1C]
 004441C0    cmp         eax,dword ptr [edx+64]
>004441C3    jne         004441CB
 004441C5    cmp         byte ptr [eax+10],0
>004441C9    jne         004441CE
 004441CB    xor         eax,eax
 004441CD    ret
 004441CE    mov         al,1
 004441D0    ret
*}
end;

//004441D4
constructor TDockZone.Create(Tree:TDockTree);
begin
{*
 004441D4    test        dl,dl
>004441D6    je          004441E0
 004441D8    add         esp,0FFFFFFF0
 004441DB    call        @ClassCreate
 004441E0    mov         dword ptr [eax+1C],ecx
 004441E3    test        dl,dl
>004441E5    je          004441F6
 004441E7    call        @AfterConstruction
 004441EC    pop         dword ptr fs:[0]
 004441F3    add         esp,0C
 004441F6    ret
*}
end;

//004441F8
function TDockZone.GetChildCount:Integer;
begin
{*
 004441F8    xor         edx,edx
 004441FA    mov         eax,dword ptr [eax+8]
 004441FD    test        eax,eax
>004441FF    je          00444209
 00444201    mov         eax,dword ptr [eax+0C]
 00444204    inc         edx
 00444205    test        eax,eax
>00444207    jne         00444201
 00444209    mov         eax,edx
 0044420B    ret
*}
end;

//0044420C
function TDockZone.GetVisibleChildCount:Integer;
begin
{*
 0044420C    push        ebx
 0044420D    xor         ebx,ebx
 0044420F    call        TDockZone.FirstVisibleChild
 00444214    test        eax,eax
>00444216    je          00444222
 00444218    call        TDockZone.NextVisible
 0044421D    inc         ebx
 0044421E    test        eax,eax
>00444220    jne         00444218
 00444222    mov         eax,ebx
 00444224    pop         ebx
 00444225    ret
*}
end;

//00444228
function TDockZone.GetVisible:Boolean;
begin
{*
 00444228    push        ebx
 00444229    push        esi
 0044422A    mov         edx,dword ptr [eax+4]
 0044422D    test        edx,edx
>0044422F    je          00444236
 00444231    mov         bl,byte ptr [edx+57]
>00444234    jmp         00444257
 00444236    mov         bl,1
 00444238    call        TDockZone.FirstVisibleChild
 0044423D    mov         esi,eax
 0044423F    test        esi,esi
>00444241    je          00444255
 00444243    mov         eax,esi
 00444245    call        TDockZone.GetVisible
 0044424A    test        al,al
>0044424C    jne         00444257
 0044424E    mov         esi,dword ptr [esi+0C]
 00444251    test        esi,esi
>00444253    jne         00444243
 00444255    xor         ebx,ebx
 00444257    mov         eax,ebx
 00444259    pop         esi
 0044425A    pop         ebx
 0044425B    ret
*}
end;

//0044425C
function TDockZone.GetLimitBegin:Integer;
begin
{*
 0044425C    mov         edx,dword ptr [eax+1C]
 0044425F    cmp         eax,dword ptr [edx+64]
>00444262    jne         00444268
 00444264    mov         edx,eax
>00444266    jmp         0044426B
 00444268    mov         edx,dword ptr [eax+14]
 0044426B    mov         cl,byte ptr [edx+10]
 0044426E    cmp         cl,1
>00444271    jne         0044427E
 00444273    mov         edx,1
 00444278    call        TDockZone.GetTopLeft
 0044427D    ret
 0044427E    cmp         cl,2
>00444281    jne         0044428F
 00444283    mov         edx,2
 00444288    call        TDockZone.GetTopLeft
>0044428D    jmp         004442A2
 0044428F    xor         ecx,ecx
 00444291    mov         dl,1
 00444293    mov         eax,[00408B30];Exception
 00444298    call        Exception.Create
 0044429D    call        @RaiseExcept
 004442A2    ret
*}
end;

//004442A4
function TDockZone.GetLimitSize:Integer;
begin
{*
 004442A4    mov         edx,dword ptr [eax+1C]
 004442A7    cmp         eax,dword ptr [edx+64]
>004442AA    jne         004442B0
 004442AC    mov         edx,eax
>004442AE    jmp         004442B3
 004442B0    mov         edx,dword ptr [eax+14]
 004442B3    mov         cl,byte ptr [edx+10]
 004442B6    cmp         cl,1
>004442B9    jne         004442C6
 004442BB    mov         edx,1
 004442C0    call        TDockZone.GetHeightWidth
 004442C5    ret
 004442C6    cmp         cl,2
>004442C9    jne         004442D7
 004442CB    mov         edx,2
 004442D0    call        TDockZone.GetHeightWidth
>004442D5    jmp         004442EA
 004442D7    xor         ecx,ecx
 004442D9    mov         dl,1
 004442DB    mov         eax,[00408B30];Exception
 004442E0    call        Exception.Create
 004442E5    call        @RaiseExcept
 004442EA    ret
*}
end;

//004442EC
function TDockZone.GetTopLeft(Orient:Integer):Integer;
begin
{*
 004442EC    push        esi
 004442ED    push        edi
 004442EE    add         esp,0FFFFFFF0
 004442F1    mov         edi,edx
 004442F3    mov         esi,eax
 004442F5    mov         eax,esi
>004442F7    jmp         00444315
 004442F9    mov         ecx,edi
 004442FB    mov         edx,dword ptr [eax+14]
 004442FE    cmp         cl,byte ptr [edx+10]
>00444301    jne         00444313
 00444303    cmp         dword ptr [eax+18],0
>00444307    je          00444313
 00444309    mov         eax,dword ptr [eax+18]
 0044430C    call        TDockZone.GetZoneLimit
>00444311    jmp         00444351
 00444313    mov         eax,edx
 00444315    mov         edx,dword ptr [esi+1C]
 00444318    cmp         eax,dword ptr [edx+64]
>0044431B    jne         004442F9
 0044431D    mov         edx,esp
 0044431F    mov         eax,dword ptr [esi+1C]
 00444322    mov         eax,dword ptr [eax+14]
 00444325    mov         ecx,dword ptr [eax]
 00444327    call        dword ptr [ecx+44]
 0044432A    mov         edx,esp
 0044432C    mov         eax,dword ptr [esi+1C]
 0044432F    mov         eax,dword ptr [eax+14]
 00444332    mov         ecx,dword ptr [eax]
 00444334    call        dword ptr [ecx+8C]
 0044433A    mov         eax,edi
 0044433C    dec         al
>0044433E    je          00444349
 00444340    dec         al
>00444342    jne         0044434F
 00444344    mov         eax,dword ptr [esp]
>00444347    jmp         00444351
 00444349    mov         eax,dword ptr [esp+4]
>0044434D    jmp         00444351
 0044434F    xor         eax,eax
 00444351    add         esp,10
 00444354    pop         edi
 00444355    pop         esi
 00444356    ret
*}
end;

//00444358
function TDockZone.GetHeightWidth(Orient:Integer):Integer;
begin
{*
 00444358    push        ebx
 00444359    push        esi
 0044435A    push        edi
 0044435B    add         esp,0FFFFFFF0
 0044435E    mov         edi,edx
 00444360    mov         ebx,eax
 00444362    mov         eax,dword ptr [ebx+1C]
 00444365    cmp         ebx,dword ptr [eax+64]
>00444368    je          00444385
 0044436A    mov         eax,dword ptr [ebx+1C]
 0044436D    mov         esi,dword ptr [eax+64]
 00444370    cmp         esi,dword ptr [ebx+14]
>00444373    jne         004443BB
 00444375    cmp         dword ptr [ebx+4],0
>00444379    je          004443BB
 0044437B    mov         eax,esi
 0044437D    call        TDockZone.GetVisibleChildCount
 00444382    dec         eax
>00444383    jne         004443BB
 00444385    mov         edx,esp
 00444387    mov         eax,dword ptr [ebx+1C]
 0044438A    mov         eax,dword ptr [eax+14]
 0044438D    mov         ecx,dword ptr [eax]
 0044438F    call        dword ptr [ecx+44]
 00444392    mov         edx,esp
 00444394    mov         eax,dword ptr [ebx+1C]
 00444397    mov         eax,dword ptr [eax+14]
 0044439A    mov         ecx,dword ptr [eax]
 0044439C    call        dword ptr [ecx+8C]
 004443A2    mov         eax,edi
 004443A4    cmp         al,1
>004443A6    jne         004443B2
 004443A8    mov         eax,dword ptr [esp+0C]
 004443AC    sub         eax,dword ptr [esp+4]
>004443B0    jmp         00444401
 004443B2    mov         eax,dword ptr [esp+8]
 004443B6    sub         eax,dword ptr [esp]
>004443B9    jmp         00444401
 004443BB    mov         esi,ebx
>004443BD    jmp         004443E0
 004443BF    mov         edx,edi
 004443C1    mov         eax,dword ptr [esi+14]
 004443C4    cmp         dl,byte ptr [eax+10]
>004443C7    jne         004443DE
 004443C9    mov         eax,esi
 004443CB    call        TDockZone.GetZoneLimit
 004443D0    push        eax
 004443D1    mov         eax,esi
 004443D3    call        TDockZone.GetLimitBegin
 004443D8    pop         edx
 004443D9    xchg        eax,edx
 004443DA    sub         eax,edx
>004443DC    jmp         00444401
 004443DE    mov         esi,eax
 004443E0    mov         eax,dword ptr [ebx+1C]
 004443E3    cmp         esi,dword ptr [eax+64]
>004443E6    jne         004443BF
 004443E8    mov         ecx,edi
 004443EA    mov         eax,dword ptr [ebx+1C]
 004443ED    mov         edx,dword ptr [eax+64]
 004443F0    cmp         cl,byte ptr [edx+10]
>004443F3    jne         004443FA
 004443F5    mov         eax,dword ptr [eax+68]
>004443F8    jmp         00444401
 004443FA    mov         eax,edx
 004443FC    call        TDockZone.GetZoneLimit
 00444401    add         esp,10
 00444404    pop         edi
 00444405    pop         esi
 00444406    pop         ebx
 00444407    ret
*}
end;

//00444408
procedure TDockZone.ResetChildren;
begin
{*
 00444408    push        ebx
 00444409    push        esi
 0044440A    push        edi
 0044440B    mov         esi,eax
 0044440D    mov         eax,esi
 0044440F    call        TDockZone.GetVisibleChildCount
 00444414    test        eax,eax
>00444416    je          004444AB
 0044441C    cmp         byte ptr [esi+10],0
>00444420    je          004444AB
 00444426    mov         eax,esi
 00444428    call        TDockZone.FirstVisibleChild
 0044442D    mov         ebx,eax
 0044442F    mov         al,byte ptr [esi+10]
 00444432    dec         al
>00444434    je          0044443C
 00444436    dec         al
>00444438    je          0044444C
>0044443A    jmp         0044445C
 0044443C    mov         edx,1
 00444441    mov         eax,esi
 00444443    call        TDockZone.GetHeightWidth
 00444448    mov         edi,eax
>0044444A    jmp         0044445E
 0044444C    mov         edx,2
 00444451    mov         eax,esi
 00444453    call        TDockZone.GetHeightWidth
 00444458    mov         edi,eax
>0044445A    jmp         0044445E
 0044445C    xor         edi,edi
 0044445E    mov         eax,esi
 00444460    call        TDockZone.GetVisibleChildCount
 00444465    push        eax
 00444466    mov         eax,edi
 00444468    pop         edx
 00444469    mov         ecx,edx
 0044446B    cdq
 0044446C    idiv        eax,ecx
 0044446E    mov         esi,eax
 00444470    test        ebx,ebx
>00444472    je          004444AB
 00444474    cmp         dword ptr [ebx+0C],0
>00444478    jne         00444485
 0044447A    mov         edx,edi
 0044447C    mov         eax,ebx
 0044447E    call        TDockZone.SetZoneLimit
>00444483    jmp         00444497
 00444485    mov         eax,ebx
 00444487    call        TDockZone.GetLimitBegin
 0044448C    mov         edx,eax
 0044448E    add         edx,esi
 00444490    mov         eax,ebx
 00444492    call        TDockZone.SetZoneLimit
 00444497    mov         eax,ebx
 00444499    call        TDockZone.Update
 0044449E    mov         eax,ebx
 004444A0    call        TDockZone.NextVisible
 004444A5    mov         ebx,eax
 004444A7    test        ebx,ebx
>004444A9    jne         00444474
 004444AB    pop         edi
 004444AC    pop         esi
 004444AD    pop         ebx
 004444AE    ret
*}
end;

//004444B0
function TDockZone.GetControlName:AnsiString;
begin
{*
 004444B0    push        ebx
 004444B1    push        esi
 004444B2    push        edi
 004444B3    mov         esi,edx
 004444B5    mov         ebx,eax
 004444B7    mov         eax,esi
 004444B9    call        @LStrClr
 004444BE    mov         edi,dword ptr [ebx+4]
 004444C1    test        edi,edi
>004444C3    je          004444EF
 004444C5    cmp         dword ptr [edi+8],0
>004444C9    jne         004444E2
 004444CB    mov         ecx,dword ptr ds:[5AE424];^SDockedCtlNeedsName:TResStringRec
 004444D1    mov         dl,1
 004444D3    mov         eax,[00408B30];Exception
 004444D8    call        Exception.CreateRes
 004444DD    call        @RaiseExcept
 004444E2    mov         eax,esi
 004444E4    mov         edx,dword ptr [ebx+4]
 004444E7    mov         edx,dword ptr [edx+8]
 004444EA    call        @LStrAsg
 004444EF    pop         edi
 004444F0    pop         esi
 004444F1    pop         ebx
 004444F2    ret
*}
end;

//004444F4
function TDockZone.SetControlName(const Value:AnsiString):Boolean;
begin
{*
 004444F4    push        ebp
 004444F5    mov         ebp,esp
 004444F7    add         esp,0FFFFFFF4
 004444FA    push        ebx
 004444FB    push        esi
 004444FC    mov         ebx,eax
 004444FE    xor         eax,eax
 00444500    mov         dword ptr [ebp-8],eax
 00444503    mov         eax,dword ptr [ebx+1C]
 00444506    mov         dword ptr [ebp-0C],eax
 00444509    lea         ecx,[ebp-8]
 0044450C    mov         eax,dword ptr [ebp-0C]
 0044450F    mov         eax,dword ptr [eax+14]
 00444512    mov         si,0FFB9
 00444516    call        @CallDynaInst
 0044451B    cmp         dword ptr [ebp-8],0
 0044451F    setne       byte ptr [ebp-1]
 00444523    cmp         byte ptr [ebp-1],0
>00444527    je          0044456C
 00444529    mov         eax,dword ptr [ebp-0C]
 0044452C    mov         dword ptr [eax+38],ebx
 0044452F    xor         eax,eax
 00444531    push        ebp
 00444532    push        444565
 00444537    push        dword ptr fs:[eax]
 0044453A    mov         dword ptr fs:[eax],esp
 0044453D    push        0
 0044453F    mov         eax,dword ptr [ebp-0C]
 00444542    mov         edx,dword ptr [eax+14]
 00444545    xor         ecx,ecx
 00444547    mov         eax,dword ptr [ebp-8]
 0044454A    call        TControl.ManualDock
 0044454F    xor         eax,eax
 00444551    pop         edx
 00444552    pop         ecx
 00444553    pop         ecx
 00444554    mov         dword ptr fs:[eax],edx
 00444557    push        44456C
 0044455C    mov         eax,dword ptr [ebp-0C]
 0044455F    xor         edx,edx
 00444561    mov         dword ptr [eax+38],edx
 00444564    ret
>00444565    jmp         @HandleFinally
>0044456A    jmp         0044455C
 0044456C    mov         al,byte ptr [ebp-1]
 0044456F    pop         esi
 00444570    pop         ebx
 00444571    mov         esp,ebp
 00444573    pop         ebp
 00444574    ret
*}
end;

//00444578
function ParentNotLast:Boolean;
begin
{*
 00444578    push        ebp
 00444579    mov         ebp,esp
 0044457B    push        ebx
 0044457C    push        esi
 0044457D    xor         ebx,ebx
 0044457F    mov         eax,dword ptr [ebp+8]
 00444582    mov         eax,dword ptr [eax-4]
 00444585    mov         esi,dword ptr [eax+14]
 00444588    test        esi,esi
>0044458A    je          004445A2
 0044458C    mov         eax,esi
 0044458E    call        TDockZone.NextVisible
 00444593    test        eax,eax
>00444595    je          0044459B
 00444597    mov         bl,1
>00444599    jmp         004445A2
 0044459B    mov         esi,dword ptr [esi+14]
 0044459E    test        esi,esi
>004445A0    jne         0044458C
 004445A2    mov         eax,ebx
 004445A4    pop         esi
 004445A5    pop         ebx
 004445A6    pop         ebp
 004445A7    ret
*}
end;

//004445A8
procedure TDockZone.Update;
begin
{*
 004445A8    push        ebp
 004445A9    mov         ebp,esp
 004445AB    add         esp,0FFFFFFEC
 004445AE    push        ebx
 004445AF    push        esi
 004445B0    push        edi
 004445B1    mov         dword ptr [ebp-4],eax
 004445B4    mov         eax,dword ptr [ebp-4]
 004445B7    mov         eax,dword ptr [eax+4]
 004445BA    test        eax,eax
>004445BC    je          00444717
 004445C2    cmp         byte ptr [eax+57],0
>004445C6    je          00444717
 004445CC    mov         edx,dword ptr [ebp-4]
 004445CF    mov         edx,dword ptr [edx+1C]
 004445D2    cmp         dword ptr [edx+6C],0
>004445D6    jne         00444717
 004445DC    mov         edx,dword ptr [ebp-4]
 004445DF    mov         edx,dword ptr [edx+14]
 004445E2    mov         dl,byte ptr [edx+10]
 004445E5    mov         byte ptr [eax+9C],dl
 004445EB    mov         edx,2
 004445F0    mov         eax,dword ptr [ebp-4]
 004445F3    call        TDockZone.GetHeightWidth
 004445F8    mov         ebx,eax
 004445FA    mov         edx,1
 004445FF    mov         eax,dword ptr [ebp-4]
 00444602    call        TDockZone.GetHeightWidth
 00444607    mov         esi,eax
 00444609    push        ebp
 0044460A    call        ParentNotLast
 0044460F    pop         ecx
 00444610    test        al,al
>00444612    je          00444634
 00444614    mov         eax,dword ptr [ebp-4]
 00444617    mov         eax,dword ptr [eax+14]
 0044461A    cmp         byte ptr [eax+10],1
>0044461E    jne         0044462B
 00444620    mov         eax,dword ptr [ebp-4]
 00444623    mov         eax,dword ptr [eax+1C]
 00444626    sub         ebx,dword ptr [eax+0C]
>00444629    jmp         00444634
 0044462B    mov         eax,dword ptr [ebp-4]
 0044462E    mov         eax,dword ptr [eax+1C]
 00444631    sub         esi,dword ptr [eax+0C]
 00444634    mov         eax,dword ptr [ebp-4]
 00444637    call        TDockZone.NextVisible
 0044463C    test        eax,eax
>0044463E    jne         004446AE
 00444640    mov         eax,dword ptr [ebp-4]
 00444643    mov         eax,dword ptr [eax+14]
 00444646    mov         edx,dword ptr [ebp-4]
 00444649    mov         edx,dword ptr [edx+1C]
 0044464C    cmp         eax,dword ptr [edx+64]
>0044464F    je          0044467B
 00444651    mov         eax,dword ptr [ebp-4]
 00444654    mov         eax,dword ptr [eax+14]
 00444657    mov         al,byte ptr [eax+10]
 0044465A    mov         edx,dword ptr [ebp-4]
 0044465D    mov         edx,dword ptr [edx+1C]
 00444660    mov         edx,dword ptr [edx+64]
 00444663    cmp         al,byte ptr [edx+10]
>00444666    jne         0044467B
 00444668    mov         eax,dword ptr [ebp-4]
 0044466B    call        TDockZone.GetZoneLimit
 00444670    mov         edx,dword ptr [ebp-4]
 00444673    mov         edx,dword ptr [edx+1C]
 00444676    cmp         eax,dword ptr [edx+68]
>00444679    jl          004446AE
 0044467B    mov         eax,dword ptr [ebp-4]
 0044467E    mov         eax,dword ptr [eax+14]
 00444681    mov         al,byte ptr [eax+10]
 00444684    mov         edx,dword ptr [ebp-4]
 00444687    mov         edx,dword ptr [edx+1C]
 0044468A    mov         edx,dword ptr [edx+64]
 0044468D    cmp         al,byte ptr [edx+10]
>00444690    je          004446CE
 00444692    mov         eax,dword ptr [ebp-4]
 00444695    call        TDockZone.GetZoneLimit
 0044469A    mov         edi,eax
 0044469C    mov         eax,dword ptr [ebp-4]
 0044469F    mov         eax,dword ptr [eax+1C]
 004446A2    mov         eax,dword ptr [eax+64]
 004446A5    call        TDockZone.GetZoneLimit
 004446AA    cmp         edi,eax
>004446AC    jge         004446CE
 004446AE    mov         eax,dword ptr [ebp-4]
 004446B1    mov         eax,dword ptr [eax+14]
 004446B4    cmp         byte ptr [eax+10],1
>004446B8    jne         004446C5
 004446BA    mov         eax,dword ptr [ebp-4]
 004446BD    mov         eax,dword ptr [eax+1C]
 004446C0    sub         esi,dword ptr [eax+0C]
>004446C3    jmp         004446CE
 004446C5    mov         eax,dword ptr [ebp-4]
 004446C8    mov         eax,dword ptr [eax+1C]
 004446CB    sub         ebx,dword ptr [eax+0C]
 004446CE    push        esi
 004446CF    lea         eax,[ebp-14]
 004446D2    push        eax
 004446D3    mov         edx,1
 004446D8    mov         eax,dword ptr [ebp-4]
 004446DB    call        TDockZone.GetTopLeft
 004446E0    push        eax
 004446E1    mov         edx,2
 004446E6    mov         eax,dword ptr [ebp-4]
 004446E9    call        TDockZone.GetTopLeft
 004446EE    mov         ecx,ebx
 004446F0    pop         edx
 004446F1    call        Rect
 004446F6    lea         ecx,[ebp-14]
 004446F9    mov         eax,dword ptr [ebp-4]
 004446FC    mov         edx,dword ptr [eax+4]
 004446FF    mov         eax,dword ptr [ebp-4]
 00444702    mov         eax,dword ptr [eax+1C]
 00444705    mov         ebx,dword ptr [eax]
 00444707    call        dword ptr [ebx]
 00444709    lea         edx,[ebp-14]
 0044470C    mov         eax,dword ptr [ebp-4]
 0044470F    mov         eax,dword ptr [eax+4]
 00444712    call        TControl.SetBoundsRect
 00444717    pop         edi
 00444718    pop         esi
 00444719    pop         ebx
 0044471A    mov         esp,ebp
 0044471C    pop         ebp
 0044471D    ret
*}
end;

//00444720
function TDockZone.GetZoneLimit:Integer;
begin
{*
 00444720    push        ebx
 00444721    mov         ebx,eax
 00444723    mov         eax,ebx
 00444725    call        TDockZone.GetVisible
 0044472A    test        al,al
>0044472C    jne         00444742
 0044472E    mov         eax,ebx
 00444730    call        IsOrientationSet
 00444735    test        al,al
>00444737    je          00444742
 00444739    mov         eax,ebx
 0044473B    call        TDockZone.GetLimitBegin
 00444740    pop         ebx
 00444741    ret
 00444742    mov         eax,dword ptr [ebx+20]
 00444745    pop         ebx
 00444746    ret
*}
end;

//00444748
procedure TDockZone.SetZoneLimit(const Value:Integer);
begin
{*
 00444748    mov         dword ptr [eax+20],edx
 0044474B    ret
*}
end;

//0044474C
function GetLastChildZone(Zone:TDockZone):TDockZone;
begin
{*
 0044474C    mov         eax,dword ptr [eax+8]
>0044474F    jmp         00444753
 00444751    mov         eax,edx
 00444753    mov         edx,dword ptr [eax+0C]
 00444756    test        edx,edx
>00444758    jne         00444751
 0044475A    ret
*}
end;

//0044475C
procedure TDockZone.ExpandZoneLimit(NewLimit:Integer);
begin
{*
 0044475C    push        ebx
 0044475D    push        esi
 0044475E    mov         esi,edx
 00444760    mov         ebx,eax
 00444762    mov         edx,esi
 00444764    mov         eax,ebx
 00444766    call        TDockZone.SetZoneLimit
 0044476B    mov         ebx,dword ptr [ebx+8]
 0044476E    test        ebx,ebx
>00444770    je          00444792
 00444772    mov         eax,ebx
 00444774    call        TDockZone.GetChildCount
 00444779    test        eax,eax
>0044477B    jle         0044478B
 0044477D    mov         eax,ebx
 0044477F    call        GetLastChildZone
 00444784    mov         edx,esi
 00444786    call        TDockZone.ExpandZoneLimit
 0044478B    mov         ebx,dword ptr [ebx+0C]
 0044478E    test        ebx,ebx
>00444790    jne         00444772
 00444792    pop         esi
 00444793    pop         ebx
 00444794    ret
*}
end;

//00444798
procedure TDockZone.ResetZoneLimits;
begin
{*
 00444798    push        ebx
 00444799    push        esi
 0044479A    push        edi
 0044479B    mov         esi,eax
 0044479D    mov         ebx,dword ptr [esi+8]
 004447A0    test        ebx,ebx
>004447A2    je          004447F1
 004447A4    mov         eax,ebx
 004447A6    call        TDockZone.GetZoneLimit
 004447AB    mov         edi,eax
 004447AD    mov         eax,ebx
 004447AF    call        TDockZone.GetLimitBegin
 004447B4    cmp         edi,eax
>004447B6    jl          004447CC
 004447B8    mov         eax,ebx
 004447BA    call        TDockZone.GetZoneLimit
 004447BF    mov         edi,eax
 004447C1    mov         eax,esi
 004447C3    call        TDockZone.GetLimitSize
 004447C8    cmp         edi,eax
>004447CA    jle         004447E3
 004447CC    mov         eax,esi
 004447CE    call        TDockZone.ResetChildren
 004447D3    mov         eax,dword ptr [esi+1C]
 004447D6    push        eax
 004447D7    push        4462A8;TDockTree.UpdateZone
 004447DC    mov         edx,esi
 004447DE    call        TDockTree.ForEachAt
 004447E3    mov         eax,ebx
 004447E5    call        TDockZone.ResetZoneLimits
 004447EA    mov         ebx,dword ptr [ebx+0C]
 004447ED    test        ebx,ebx
>004447EF    jne         004447A4
 004447F1    pop         edi
 004447F2    pop         esi
 004447F3    pop         ebx
 004447F4    ret
*}
end;

//004447F8
function TDockZone.NextVisible:TDockZone;
begin
{*
 004447F8    mov         eax,dword ptr [eax+0C]
 004447FB    call        NextVisibleZone
 00444800    ret
*}
end;

//00444804
function TDockZone.PrevVisible:TDockZone;
begin
{*
 00444804    push        ebx
 00444805    mov         ebx,dword ptr [eax+18]
>00444808    jmp         0044480D
 0044480A    mov         ebx,dword ptr [ebx+18]
 0044480D    test        ebx,ebx
>0044480F    je          0044481C
 00444811    mov         eax,ebx
 00444813    call        TDockZone.GetVisible
 00444818    test        al,al
>0044481A    je          0044480A
 0044481C    mov         eax,ebx
 0044481E    pop         ebx
 0044481F    ret
*}
end;

//00444820
function TDockZone.FirstVisibleChild:TDockZone;
begin
{*
 00444820    mov         eax,dword ptr [eax+8]
 00444823    call        NextVisibleZone
 00444828    ret
*}
end;

//0044482C
constructor TDockTree.Create(DockSite:TWinControl);
begin
{*
 0044482C    push        ebp
 0044482D    mov         ebp,esp
 0044482F    add         esp,0FFFFFFF4
 00444832    push        ebx
 00444833    push        esi
 00444834    push        edi
 00444835    test        dl,dl
>00444837    je          00444841
 00444839    add         esp,0FFFFFFF0
 0044483C    call        @ClassCreate
 00444841    mov         dword ptr [ebp-0C],ecx
 00444844    mov         byte ptr [ebp-5],dl
 00444847    mov         dword ptr [ebp-4],eax
 0044484A    xor         edx,edx
 0044484C    mov         eax,dword ptr [ebp-4]
 0044484F    call        TObject.Create
 00444854    mov         eax,dword ptr [ebp-4]
 00444857    mov         dword ptr [eax+0C],4
 0044485E    mov         eax,dword ptr [ebp-4]
 00444861    mov         edx,dword ptr [ebp-0C]
 00444864    mov         dword ptr [eax+14],edx
 00444867    mov         eax,dword ptr [ebp-4]
 0044486A    mov         dword ptr [eax+70],40000
 00444871    mov         eax,dword ptr [ebp-4]
 00444874    mov         dword ptr [eax+18],0C
 0044487B    mov         eax,dword ptr [ebp-0C]
 0044487E    mov         al,byte ptr [eax+5B]
 00444881    cmp         al,1
>00444883    je          00444889
 00444885    cmp         al,2
>00444887    jne         0044488D
 00444889    xor         eax,eax
>0044488B    jmp         0044488F
 0044488D    mov         al,1
 0044488F    mov         edx,dword ptr [ebp-4]
 00444892    mov         byte ptr [edx+1C],al
 00444895    mov         ecx,dword ptr [ebp-4]
 00444898    mov         dl,1
 0044489A    mov         eax,[004388C8];TDockZone
 0044489F    call        TDockZone.Create
 004448A4    mov         edx,dword ptr [ebp-4]
 004448A7    mov         dword ptr [edx+64],eax
 004448AA    mov         dl,1
 004448AC    mov         eax,[00424798];TBrush
 004448B1    call        TBrush.Create
 004448B6    mov         ebx,eax
 004448B8    mov         eax,dword ptr [ebp-4]
 004448BB    mov         dword ptr [eax+10],ebx
 004448BE    mov         edx,0FFFFFF
 004448C3    xor         eax,eax
 004448C5    call        AllocPatternBitmap
 004448CA    mov         edx,eax
 004448CC    mov         eax,ebx
 004448CE    call        TBrush.SetBitmap
 004448D3    mov         eax,dword ptr [ebp-4]
 004448D6    call        TDockTree.BeginUpdate
 004448DB    xor         eax,eax
 004448DD    push        ebp
 004448DE    push        444938
 004448E3    push        dword ptr fs:[eax]
 004448E6    mov         dword ptr fs:[eax],esp
 004448E9    mov         eax,dword ptr [ebp-0C]
 004448EC    call        TWinControl.GetControlCount
 004448F1    mov         ebx,eax
 004448F3    dec         ebx
 004448F4    test        ebx,ebx
>004448F6    jl          00444917
 004448F8    inc         ebx
 004448F9    xor         esi,esi
 004448FB    push        0
 004448FD    mov         edx,esi
 004448FF    mov         eax,dword ptr [ebp-0C]
 00444902    call        TWinControl.GetControl
 00444907    mov         edx,eax
 00444909    mov         cl,3
 0044490B    mov         eax,dword ptr [ebp-4]
 0044490E    mov         edi,dword ptr [eax]
 00444910    call        dword ptr [edi+8]
 00444913    inc         esi
 00444914    dec         ebx
>00444915    jne         004448FB
 00444917    mov         eax,dword ptr [ebp-4]
 0044491A    mov         eax,dword ptr [eax+64]
 0044491D    call        TDockZone.ResetChildren
 00444922    xor         eax,eax
 00444924    pop         edx
 00444925    pop         ecx
 00444926    pop         ecx
 00444927    mov         dword ptr fs:[eax],edx
 0044492A    push        44493F
 0044492F    mov         eax,dword ptr [ebp-4]
 00444932    call        TDockTree.EndUpdate
 00444937    ret
>00444938    jmp         @HandleFinally
>0044493D    jmp         0044492F
 0044493F    mov         eax,dword ptr [ebp-0C]
 00444942    test        byte ptr [eax+1C],10
>00444946    jne         00444970
 00444948    mov         eax,dword ptr [ebp-4]
 0044494B    mov         edx,dword ptr [ebp-4]
 0044494E    mov         edx,dword ptr [edx+14]
 00444951    mov         ecx,dword ptr [edx+38]
 00444954    mov         dword ptr [eax+30],ecx
 00444957    mov         ecx,dword ptr [edx+3C]
 0044495A    mov         dword ptr [eax+34],ecx
 0044495D    mov         eax,dword ptr [ebp-4]
 00444960    mov         eax,dword ptr [eax+14]
 00444963    mov         edx,dword ptr [ebp-4]
 00444966    mov         dword ptr [eax+3C],edx
 00444969    mov         dword ptr [eax+38],4467D0;TDockTree.WindowProc
 00444970    mov         eax,dword ptr [ebp-4]
 00444973    cmp         byte ptr [ebp-5],0
>00444977    je          00444988
 00444979    call        @AfterConstruction
 0044497E    pop         dword ptr fs:[0]
 00444985    add         esp,0C
 00444988    mov         eax,dword ptr [ebp-4]
 0044498B    pop         edi
 0044498C    pop         esi
 0044498D    pop         ebx
 0044498E    mov         esp,ebp
 00444990    pop         ebp
 00444991    ret
*}
end;

//00444994
destructor TDockTree.Destroy;
begin
{*
 00444994    push        ebx
 00444995    push        esi
 00444996    call        @BeforeDestruction
 0044499B    mov         ebx,edx
 0044499D    mov         esi,eax
 0044499F    cmp         dword ptr [esi+30],0
>004449A3    je          004449BC
 004449A5    mov         eax,dword ptr [esi+14]
 004449A8    mov         edx,dword ptr [esi+30]
 004449AB    mov         dword ptr [eax+38],edx
 004449AE    mov         edx,dword ptr [esi+34]
 004449B1    mov         dword ptr [eax+3C],edx
 004449B4    xor         eax,eax
 004449B6    mov         dword ptr [esi+30],eax
 004449B9    mov         dword ptr [esi+34],eax
 004449BC    mov         edx,dword ptr [esi+64]
 004449BF    mov         eax,esi
 004449C1    call        TDockTree.PruneZone
 004449C6    mov         eax,dword ptr [esi+10]
 004449C9    call        TObject.Free
 004449CE    mov         edx,ebx
 004449D0    and         dl,0FC
 004449D3    mov         eax,esi
 004449D5    call        TObject.Destroy
 004449DA    test        bl,bl
>004449DC    jle         004449E5
 004449DE    mov         eax,esi
 004449E0    call        @ClassDestroy
 004449E5    pop         esi
 004449E6    pop         ebx
 004449E7    ret
*}
end;

//004449E8
procedure TDockTree.AdjustDockRect(Control:TControl; var ARect:TRect);
begin
{*
 004449E8    mov         eax,dword ptr [eax+14]
 004449EB    mov         al,byte ptr [eax+5B]
 004449EE    dec         eax
 004449EF    sub         al,2
>004449F1    jae         004449F7
 004449F3    add         dword ptr [ecx],0C
 004449F6    ret
 004449F7    add         dword ptr [ecx+4],0C
 004449FB    ret
*}
end;

//004449FC
procedure TDockTree.BeginUpdate;
begin
{*
 004449FC    inc         dword ptr [eax+6C]
 004449FF    ret
*}
end;

//00444A00
procedure TDockTree.EndUpdate;
begin
{*
 00444A00    dec         dword ptr [eax+6C]
 00444A03    cmp         dword ptr [eax+6C],0
>00444A07    jg          00444A13
 00444A09    xor         edx,edx
 00444A0B    mov         dword ptr [eax+6C],edx
 00444A0E    call        TDockTree.UpdateAll
 00444A13    ret
*}
end;

//00444A14
procedure DoFindControlZone(StartZone:TDockZone);
begin
{*
 00444A14    push        ebp
 00444A15    mov         ebp,esp
 00444A17    push        ebx
 00444A18    mov         ebx,eax
 00444A1A    mov         eax,dword ptr [ebp+8]
 00444A1D    mov         eax,dword ptr [eax-4]
 00444A20    cmp         eax,dword ptr [ebx+4]
>00444A23    jne         00444A2E
 00444A25    mov         eax,dword ptr [ebp+8]
 00444A28    mov         dword ptr [eax-8],ebx
 00444A2B    pop         ebx
 00444A2C    pop         ebp
 00444A2D    ret
 00444A2E    mov         eax,dword ptr [ebp+8]
 00444A31    cmp         dword ptr [eax-8],0
>00444A35    jne         00444A4A
 00444A37    cmp         dword ptr [ebx+0C],0
>00444A3B    je          00444A4A
 00444A3D    mov         eax,dword ptr [ebp+8]
 00444A40    push        eax
 00444A41    mov         eax,dword ptr [ebx+0C]
 00444A44    call        DoFindControlZone
 00444A49    pop         ecx
 00444A4A    mov         eax,dword ptr [ebp+8]
 00444A4D    cmp         dword ptr [eax-8],0
>00444A51    jne         00444A66
 00444A53    cmp         dword ptr [ebx+8],0
>00444A57    je          00444A66
 00444A59    mov         eax,dword ptr [ebp+8]
 00444A5C    push        eax
 00444A5D    mov         eax,dword ptr [ebx+8]
 00444A60    call        DoFindControlZone
 00444A65    pop         ecx
 00444A66    pop         ebx
 00444A67    pop         ebp
 00444A68    ret
*}
end;

//00444A6C
function TDockTree.FindControlZone(Control:TControl):TDockZone;
begin
{*
 00444A6C    push        ebp
 00444A6D    mov         ebp,esp
 00444A6F    add         esp,0FFFFFFF8
 00444A72    mov         dword ptr [ebp-4],edx
 00444A75    xor         edx,edx
 00444A77    mov         dword ptr [ebp-8],edx
 00444A7A    cmp         dword ptr [ebp-4],0
>00444A7E    je          00444A90
 00444A80    cmp         dword ptr [eax+64],0
>00444A84    je          00444A90
 00444A86    push        ebp
 00444A87    mov         eax,dword ptr [eax+64]
 00444A8A    call        DoFindControlZone
 00444A8F    pop         ecx
 00444A90    mov         eax,dword ptr [ebp-8]
 00444A93    pop         ecx
 00444A94    pop         ecx
 00444A95    pop         ebp
 00444A96    ret
*}
end;

//00444A98
procedure DoForEach(Zone:TDockZone);
begin
{*
 00444A98    push        ebp
 00444A99    mov         ebp,esp
 00444A9B    push        ebx
 00444A9C    push        esi
 00444A9D    mov         ebx,eax
 00444A9F    mov         eax,dword ptr [ebp+8]
 00444AA2    lea         esi,[eax+8]
 00444AA5    mov         edx,ebx
 00444AA7    mov         eax,dword ptr [esi+4]
 00444AAA    call        dword ptr [esi]
 00444AAC    mov         eax,dword ptr [ebx+0C]
 00444AAF    test        eax,eax
>00444AB1    je          00444ABD
 00444AB3    mov         edx,dword ptr [ebp+8]
 00444AB6    push        edx
 00444AB7    call        DoForEach
 00444ABC    pop         ecx
 00444ABD    mov         eax,dword ptr [ebx+8]
 00444AC0    test        eax,eax
>00444AC2    je          00444ACE
 00444AC4    mov         edx,dword ptr [ebp+8]
 00444AC7    push        edx
 00444AC8    call        DoForEach
 00444ACD    pop         ecx
 00444ACE    pop         esi
 00444ACF    pop         ebx
 00444AD0    pop         ebp
 00444AD1    ret
*}
end;

//00444AD4
procedure TDockTree.ForEachAt(Zone:TDockZone; Proc:TForEachZoneProc);
begin
{*
 00444AD4    push        ebp
 00444AD5    mov         ebp,esp
 00444AD7    test        edx,edx
>00444AD9    jne         00444ADE
 00444ADB    mov         edx,dword ptr [eax+64]
 00444ADE    push        ebp
 00444ADF    mov         eax,edx
 00444AE1    call        DoForEach
 00444AE6    pop         ecx
 00444AE7    pop         ebp
 00444AE8    ret         8
*}
end;

//00444AEC
{*procedure sub_00444AEC(?:?; ?:?; ?:?);
begin
 00444AEC    push        ebx
 00444AED    push        esi
 00444AEE    push        edi
 00444AEF    add         esp,0FFFFFFF0
 00444AF2    mov         esi,ecx
 00444AF4    call        TDockTree.FindControlZone
 00444AF9    mov         ebx,eax
 00444AFB    test        ebx,ebx
>00444AFD    jne         00444B0F
 00444AFF    mov         eax,esi
 00444B01    xor         ecx,ecx
 00444B03    mov         edx,10
 00444B08    call        @FillChar
>00444B0D    jmp         00444B56
 00444B0F    mov         edx,1
 00444B14    mov         eax,ebx
 00444B16    call        TDockZone.GetHeightWidth
 00444B1B    push        eax
 00444B1C    lea         eax,[esp+4]
 00444B20    push        eax
 00444B21    mov         edx,2
 00444B26    mov         eax,ebx
 00444B28    call        TDockZone.GetHeightWidth
 00444B2D    push        eax
 00444B2E    mov         edx,1
 00444B33    mov         eax,ebx
 00444B35    call        TDockZone.GetTopLeft
 00444B3A    push        eax
 00444B3B    mov         edx,2
 00444B40    mov         eax,ebx
 00444B42    call        TDockZone.GetTopLeft
 00444B47    pop         edx
 00444B48    pop         ecx
 00444B49    call        Rect
 00444B4E    mov         edi,esi
 00444B50    mov         esi,esp
 00444B52    movs        dword ptr [edi],dword ptr [esi]
 00444B53    movs        dword ptr [edi],dword ptr [esi]
 00444B54    movs        dword ptr [edi],dword ptr [esi]
 00444B55    movs        dword ptr [edi],dword ptr [esi]
 00444B56    add         esp,10
 00444B59    pop         edi
 00444B5A    pop         esi
 00444B5B    pop         ebx
 00444B5C    ret
end;*}

//00444B60
function TDockTree.HitTest(const MousePos:TPoint; var HTFlag:Integer):TControl;
begin
{*
 00444B60    call        TDockTree.InternalHitTest
 00444B65    test        eax,eax
>00444B67    je          00444B6D
 00444B69    mov         eax,dword ptr [eax+4]
 00444B6C    ret
 00444B6D    xor         eax,eax
 00444B6F    ret
*}
end;

//00444B70
{*procedure sub_00444B70(?:?; ?:?; ?:?);
begin
 00444B70    push        ebp
 00444B71    mov         ebp,esp
 00444B73    add         esp,0FFFFFFD0
 00444B76    push        ebx
 00444B77    push        esi
 00444B78    push        edi
 00444B79    mov         byte ptr [ebp-1],cl
 00444B7C    mov         esi,edx
 00444B7E    mov         ebx,eax
 00444B80    cmp         byte ptr [esi+57],0
>00444B84    je          00444D77
 00444B8A    mov         eax,dword ptr [ebx+38];TDockTree.FReplacementZone:TDockZone
 00444B8D    test        eax,eax
>00444B8F    je          00444B9E
 00444B91    mov         dword ptr [eax+4],esi;TDockZone.FChildControl:TControl
 00444B94    call        TDockZone.Update
>00444B99    jmp         00444D6F
 00444B9E    mov         eax,dword ptr [ebx+64];TDockTree.FTopZone:TDockZone
 00444BA1    cmp         dword ptr [eax+8],0;TDockZone.FChildZones:TDockZone
>00444BA5    jne         00444C4E
 00444BAB    lea         edx,[ebp-20]
 00444BAE    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 00444BB1    mov         ecx,dword ptr [eax]
 00444BB3    call        dword ptr [ecx+44];TWinControl.GetClientRect
 00444BB6    lea         edx,[ebp-20]
 00444BB9    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 00444BBC    mov         ecx,dword ptr [eax]
 00444BBE    call        dword ptr [ecx+8C];TWinControl.sub_0043E544
 00444BC4    mov         edi,dword ptr [ebp-18]
 00444BC7    sub         edi,dword ptr [ebp-20]
 00444BCA    mov         eax,dword ptr [ebp-14]
 00444BCD    sub         eax,dword ptr [ebp-1C]
 00444BD0    mov         dword ptr [ebp-10],eax
 00444BD3    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 00444BD6    cmp         byte ptr [eax+5C],0;TWinControl.FAutoSize:Boolean
>00444BDA    je          00444BF9
 00444BDC    test        edi,edi
>00444BDE    jne         00444BE9
 00444BE0    mov         eax,esi
 00444BE2    call        TControl.GetUndockWidth
 00444BE7    mov         edi,eax
 00444BE9    cmp         dword ptr [ebp-10],0
>00444BED    jne         00444BF9
 00444BEF    mov         eax,esi
 00444BF1    call        TControl.GetUndockHeight
 00444BF6    mov         dword ptr [ebp-10],eax
 00444BF9    mov         eax,dword ptr [ebp-10]
 00444BFC    push        eax
 00444BFD    lea         eax,[ebp-30]
 00444C00    push        eax
 00444C01    mov         ecx,edi
 00444C03    mov         edx,dword ptr [ebp-1C]
 00444C06    mov         eax,dword ptr [ebp-20]
 00444C09    call        Rect
 00444C0E    push        esi
 00444C0F    lea         esi,[ebp-30]
 00444C12    lea         edi,[ebp-20]
 00444C15    movs        dword ptr [edi],dword ptr [esi]
 00444C16    movs        dword ptr [edi],dword ptr [esi]
 00444C17    movs        dword ptr [edi],dword ptr [esi]
 00444C18    movs        dword ptr [edi],dword ptr [esi]
 00444C19    pop         esi
 00444C1A    lea         ecx,[ebp-20]
 00444C1D    mov         edx,esi
 00444C1F    mov         eax,ebx
 00444C21    mov         edi,dword ptr [eax]
 00444C23    call        dword ptr [edi];TDockTree.AdjustDockRect
 00444C25    lea         edx,[ebp-20]
 00444C28    mov         eax,esi
 00444C2A    call        TControl.SetBoundsRect
 00444C2F    mov         ecx,ebx
 00444C31    mov         dl,1
 00444C33    mov         eax,[004388C8];TDockZone
 00444C38    call        TDockZone.Create;TDockZone.Create
 00444C3D    mov         edx,dword ptr [ebx+64];TDockTree.FTopZone:TDockZone
 00444C40    mov         dword ptr [edx+8],eax;TDockZone.FChildZones:TDockZone
 00444C43    mov         dword ptr [eax+14],edx;TDockZone.FParentZone:TDockZone
 00444C46    mov         dword ptr [eax+4],esi;TDockZone.FChildControl:TControl
>00444C49    jmp         00444D6F
 00444C4E    mov         al,byte ptr [ebp-1]
 00444C51    test        al,al
>00444C53    je          00444C59
 00444C55    sub         al,5
>00444C57    jne         00444C5D
 00444C59    mov         byte ptr [ebp-1],4
 00444C5D    mov         edx,esi
 00444C5F    mov         eax,ebx
 00444C61    call        TDockTree.FindControlZone
 00444C66    test        eax,eax
>00444C68    je          00444C73
 00444C6A    mov         edx,eax
 00444C6C    mov         eax,ebx
 00444C6E    call        TDockTree.RemoveZone
 00444C73    mov         edx,dword ptr [ebp+8]
 00444C76    mov         eax,ebx
 00444C78    call        TDockTree.FindControlZone
 00444C7D    mov         dword ptr [ebp-8],eax
 00444C80    xor         eax,eax
 00444C82    mov         al,byte ptr [ebp-1]
 00444C85    mov         al,byte ptr [eax+5ACC78]
 00444C8B    mov         byte ptr [ebp-9],al
 00444C8E    mov         eax,dword ptr [ebx+64];TDockTree.FTopZone:TDockZone
 00444C91    call        TDockZone.GetChildCount
 00444C96    dec         eax
>00444C97    jne         00444D03
 00444C99    mov         edi,dword ptr [ebx+64];TDockTree.FTopZone:TDockZone
 00444C9C    mov         al,byte ptr [ebp-9]
 00444C9F    mov         byte ptr [edi+10],al;TDockZone.FOrientation:TDockOrientation
 00444CA2    mov         al,byte ptr [ebp-9]
 00444CA5    dec         al
>00444CA7    je          00444CAF
 00444CA9    dec         al
>00444CAB    je          00444CDA
>00444CAD    jmp         00444D03
 00444CAF    mov         eax,dword ptr [edi+8];TDockZone.FChildZones:TDockZone
 00444CB2    mov         edx,2
 00444CB7    call        TDockZone.GetHeightWidth
 00444CBC    mov         edx,eax
 00444CBE    mov         eax,edi
 00444CC0    call        TDockZone.SetZoneLimit
 00444CC5    mov         eax,dword ptr [ebx+64];TDockTree.FTopZone:TDockZone
 00444CC8    mov         eax,dword ptr [eax+8];TDockZone.FChildZones:TDockZone
 00444CCB    mov         edx,1
 00444CD0    call        TDockZone.GetHeightWidth
 00444CD5    mov         dword ptr [ebx+68],eax;TDockTree.FTopXYLimit:Integer
>00444CD8    jmp         00444D03
 00444CDA    mov         eax,dword ptr [edi+8];TDockZone.FChildZones:TDockZone
 00444CDD    mov         edx,1
 00444CE2    call        TDockZone.GetHeightWidth
 00444CE7    mov         edx,eax
 00444CE9    mov         eax,edi
 00444CEB    call        TDockZone.SetZoneLimit
 00444CF0    mov         eax,dword ptr [ebx+64];TDockTree.FTopZone:TDockZone
 00444CF3    mov         eax,dword ptr [eax+8];TDockZone.FChildZones:TDockZone
 00444CF6    mov         edx,2
 00444CFB    call        TDockZone.GetHeightWidth
 00444D00    mov         dword ptr [ebx+68],eax;TDockTree.FTopXYLimit:Integer
 00444D03    mov         ecx,ebx
 00444D05    mov         dl,1
 00444D07    mov         eax,[004388C8];TDockZone
 00444D0C    call        TDockZone.Create;TDockZone.Create
 00444D11    mov         dword ptr [eax+4],esi;TDockZone.FChildControl:TControl
 00444D14    cmp         dword ptr [ebp-8],0
>00444D18    je          00444D25
 00444D1A    mov         edx,dword ptr [ebp-8]
 00444D1D    mov         edx,dword ptr [edx+14];TDockZone.FParentZone:TDockZone
 00444D20    mov         dl,byte ptr [edx+10];TDockZone.FOrientation:TDockOrientation
>00444D23    jmp         00444D2B
 00444D25    mov         edx,dword ptr [ebx+64];TDockTree.FTopZone:TDockZone
 00444D28    mov         dl,byte ptr [edx+10];TDockZone.FOrientation:TDockOrientation
 00444D2B    cmp         byte ptr [ebp-9],0
>00444D2F    jne         00444D34
 00444D31    mov         byte ptr [ebp-9],dl
 00444D34    cmp         dl,byte ptr [ebp-9]
>00444D37    jne         00444D53
 00444D39    xor         edx,edx
 00444D3B    mov         dl,byte ptr [ebp-1]
 00444D3E    mov         dl,byte ptr [edx+5ACC80]
 00444D44    push        edx
 00444D45    mov         ecx,dword ptr [ebp-8]
 00444D48    mov         edx,eax
 00444D4A    mov         eax,ebx
 00444D4C    call        TDockTree.InsertSibling
>00444D51    jmp         00444D6F
 00444D53    mov         dl,byte ptr [ebp-9]
 00444D56    push        edx
 00444D57    xor         edx,edx
 00444D59    mov         dl,byte ptr [ebp-1]
 00444D5C    mov         dl,byte ptr [edx+5ACC80]
 00444D62    push        edx
 00444D63    mov         ecx,dword ptr [ebp-8]
 00444D66    mov         edx,eax
 00444D68    mov         eax,ebx
 00444D6A    call        TDockTree.InsertNewParent
 00444D6F    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 00444D72    mov         edx,dword ptr [eax]
 00444D74    call        dword ptr [edx+7C];TWinControl.Invalidate
 00444D77    pop         edi
 00444D78    pop         esi
 00444D79    pop         ebx
 00444D7A    mov         esp,ebp
 00444D7C    pop         ebp
 00444D7D    ret         4
end;*}

//00444D80
procedure TDockTree.InsertNewParent(NewZone:TDockZone; SiblingZone:TDockZone; ParentOrientation:TDockOrientation; InsertLast:Boolean);
begin
{*
 00444D80    push        ebp
 00444D81    mov         ebp,esp
 00444D83    push        ecx
 00444D84    push        ebx
 00444D85    push        esi
 00444D86    push        edi
 00444D87    mov         edi,ecx
 00444D89    mov         dword ptr [ebp-4],edx
 00444D8C    mov         esi,eax
 00444D8E    mov         ecx,esi
 00444D90    mov         dl,1
 00444D92    mov         eax,[004388C8];TDockZone
 00444D97    call        TDockZone.Create
 00444D9C    mov         ebx,eax
 00444D9E    mov         al,byte ptr [ebp+0C]
 00444DA1    mov         byte ptr [ebx+10],al
 00444DA4    test        edi,edi
>00444DA6    jne         00444E89
 00444DAC    mov         edx,dword ptr [esi+68]
 00444DAF    mov         eax,ebx
 00444DB1    call        TDockZone.SetZoneLimit
 00444DB6    mov         eax,dword ptr [esi+64]
 00444DB9    call        TDockZone.GetZoneLimit
 00444DBE    mov         dword ptr [esi+68],eax
 00444DC1    mov         al,byte ptr [ebp+0C]
 00444DC4    mov         byte ptr [esi+48],al
 00444DC7    xor         eax,eax
 00444DC9    mov         dword ptr [esi+40],eax
 00444DCC    mov         dword ptr [esi+44],3FE00000
 00444DD3    cmp         byte ptr [ebp+8],0
>00444DD7    je          00444E0C
 00444DD9    mov         eax,dword ptr [esi+64]
 00444DDC    mov         dword ptr [ebx+8],eax
 00444DDF    mov         eax,dword ptr [esi+64]
 00444DE2    mov         dword ptr [eax+14],ebx
 00444DE5    mov         edx,dword ptr [ebp-4]
 00444DE8    mov         dword ptr [eax+0C],edx
 00444DEB    mov         edx,dword ptr [ebp-4]
 00444DEE    mov         dword ptr [edx+18],eax
 00444DF1    mov         eax,dword ptr [ebp-4]
 00444DF4    mov         dword ptr [eax+14],ebx
 00444DF7    mov         dword ptr [esi+64],ebx
 00444DFA    push        esi
 00444DFB    push        445DF0;TDockTree.ScaleZone
 00444E00    mov         edx,dword ptr [ebx+8]
 00444E03    mov         eax,esi
 00444E05    call        TDockTree.ForEachAt
>00444E0A    jmp         00444E78
 00444E0C    mov         eax,dword ptr [ebp-4]
 00444E0F    mov         dword ptr [ebx+8],eax
 00444E12    mov         eax,dword ptr [esi+64]
 00444E15    mov         dword ptr [eax+14],ebx
 00444E18    mov         edx,dword ptr [ebp-4]
 00444E1B    mov         dword ptr [eax+18],edx
 00444E1E    mov         edx,dword ptr [ebp-4]
 00444E21    mov         dword ptr [edx+0C],eax
 00444E24    mov         eax,dword ptr [ebp-4]
 00444E27    mov         dword ptr [eax+14],ebx
 00444E2A    mov         dword ptr [esi+64],ebx
 00444E2D    push        esi
 00444E2E    push        445DF0;TDockTree.ScaleZone
 00444E33    mov         edx,dword ptr [ebx+8]
 00444E36    mov         eax,esi
 00444E38    call        TDockTree.ForEachAt
 00444E3D    mov         eax,dword ptr [esi+64]
 00444E40    call        TDockZone.GetZoneLimit
 00444E45    sar         eax,1
>00444E47    jns         00444E4C
 00444E49    adc         eax,0
 00444E4C    mov         dword ptr [esi+4C],eax
 00444E4F    push        esi
 00444E50    push        446174;TDockTree.ShiftZone
 00444E55    mov         edx,dword ptr [ebx+8]
 00444E58    mov         eax,esi
 00444E5A    call        TDockTree.ForEachAt
 00444E5F    mov         eax,dword ptr [esi+64]
 00444E62    call        TDockZone.GetZoneLimit
 00444E67    mov         edx,eax
 00444E69    sar         edx,1
>00444E6B    jns         00444E70
 00444E6D    adc         edx,0
 00444E70    mov         eax,dword ptr [ebp-4]
 00444E73    call        TDockZone.SetZoneLimit
 00444E78    push        esi
 00444E79    push        4462A8;TDockTree.UpdateZone
 00444E7E    xor         edx,edx
 00444E80    mov         eax,esi
 00444E82    call        TDockTree.ForEachAt
>00444E87    jmp         00444F00
 00444E89    mov         eax,edi
 00444E8B    call        TDockZone.GetZoneLimit
 00444E90    mov         edx,eax
 00444E92    mov         eax,ebx
 00444E94    call        TDockZone.SetZoneLimit
 00444E99    mov         eax,dword ptr [edi+14]
 00444E9C    mov         dword ptr [ebx+14],eax
 00444E9F    mov         eax,dword ptr [edi+18]
 00444EA2    mov         dword ptr [ebx+18],eax
 00444EA5    test        eax,eax
>00444EA7    je          00444EAC
 00444EA9    mov         dword ptr [eax+0C],ebx
 00444EAC    mov         eax,dword ptr [edi+0C]
 00444EAF    mov         dword ptr [ebx+0C],eax
 00444EB2    test        eax,eax
>00444EB4    je          00444EB9
 00444EB6    mov         dword ptr [eax+18],ebx
 00444EB9    mov         eax,dword ptr [ebx+14]
 00444EBC    cmp         edi,dword ptr [eax+8]
>00444EBF    jne         00444EC4
 00444EC1    mov         dword ptr [eax+8],ebx
 00444EC4    mov         eax,dword ptr [ebp-4]
 00444EC7    mov         dword ptr [eax+14],ebx
 00444ECA    mov         dword ptr [edi+14],ebx
 00444ECD    cmp         byte ptr [ebp+8],0
>00444ED1    je          00444EE9
 00444ED3    mov         dword ptr [ebx+8],edi
 00444ED6    xor         eax,eax
 00444ED8    mov         dword ptr [edi+18],eax
 00444EDB    mov         eax,dword ptr [ebp-4]
 00444EDE    mov         dword ptr [edi+0C],eax
 00444EE1    mov         eax,dword ptr [ebp-4]
 00444EE4    mov         dword ptr [eax+18],edi
>00444EE7    jmp         00444F00
 00444EE9    mov         eax,dword ptr [ebp-4]
 00444EEC    mov         dword ptr [ebx+8],eax
 00444EEF    mov         eax,dword ptr [ebp-4]
 00444EF2    mov         dword ptr [edi+18],eax
 00444EF5    xor         eax,eax
 00444EF7    mov         dword ptr [edi+0C],eax
 00444EFA    mov         eax,dword ptr [ebp-4]
 00444EFD    mov         dword ptr [eax+0C],edi
 00444F00    mov         eax,ebx
 00444F02    call        TDockZone.ResetChildren
 00444F07    mov         eax,ebx
 00444F09    call        TDockZone.ResetZoneLimits
 00444F0E    push        esi
 00444F0F    push        4462A8;TDockTree.UpdateZone
 00444F14    xor         edx,edx
 00444F16    mov         eax,esi
 00444F18    call        TDockTree.ForEachAt
 00444F1D    pop         edi
 00444F1E    pop         esi
 00444F1F    pop         ebx
 00444F20    pop         ecx
 00444F21    pop         ebp
 00444F22    ret         8
*}
end;

//00444F28
procedure TDockTree.InsertSibling(NewZone:TDockZone; SiblingZone:TDockZone; InsertLast:Boolean);
begin
{*
 00444F28    push        ebp
 00444F29    mov         ebp,esp
 00444F2B    push        ebx
 00444F2C    mov         ebx,ecx
 00444F2E    mov         ecx,dword ptr [ebp+8]
 00444F31    test        ebx,ebx
>00444F33    jne         00444F4A
 00444F35    mov         eax,dword ptr [eax+64]
 00444F38    mov         ebx,dword ptr [eax+8]
 00444F3B    test        cl,cl
>00444F3D    je          00444F4A
>00444F3F    jmp         00444F43
 00444F41    mov         ebx,eax
 00444F43    mov         eax,dword ptr [ebx+0C]
 00444F46    test        eax,eax
>00444F48    jne         00444F41
 00444F4A    test        cl,cl
>00444F4C    je          00444F69
 00444F4E    mov         eax,dword ptr [ebx+14]
 00444F51    mov         dword ptr [edx+14],eax
 00444F54    mov         dword ptr [edx+18],ebx
 00444F57    mov         eax,dword ptr [ebx+0C]
 00444F5A    mov         dword ptr [edx+0C],eax
 00444F5D    test        eax,eax
>00444F5F    je          00444F64
 00444F61    mov         dword ptr [eax+18],edx
 00444F64    mov         dword ptr [ebx+0C],edx
>00444F67    jmp         00444F8A
 00444F69    mov         dword ptr [edx+0C],ebx
 00444F6C    mov         eax,dword ptr [ebx+18]
 00444F6F    mov         dword ptr [edx+18],eax
 00444F72    test        eax,eax
>00444F74    je          00444F79
 00444F76    mov         dword ptr [eax+0C],edx
 00444F79    mov         dword ptr [ebx+18],edx
 00444F7C    mov         eax,dword ptr [ebx+14]
 00444F7F    mov         dword ptr [edx+14],eax
 00444F82    cmp         ebx,dword ptr [eax+8]
>00444F85    jne         00444F8A
 00444F87    mov         dword ptr [eax+8],edx
 00444F8A    mov         eax,dword ptr [ebx+14]
 00444F8D    call        TDockZone.ResetChildren
 00444F92    mov         eax,dword ptr [ebx+14]
 00444F95    call        TDockZone.ResetZoneLimits
 00444F9A    pop         ebx
 00444F9B    pop         ebp
 00444F9C    ret         4
*}
end;

//00444FA0
procedure DoFindZone(Zone:TDockZone);
begin
{*
 00444FA0    push        ebp
 00444FA1    mov         ebp,esp
 00444FA3    push        ebx
 00444FA4    push        esi
 00444FA5    push        edi
 00444FA6    mov         ebx,eax
 00444FA8    mov         eax,dword ptr [ebx+14]
 00444FAB    cmp         byte ptr [eax+10],1
>00444FAF    jne         00444FF5
 00444FB1    mov         eax,ebx
 00444FB3    call        TDockZone.GetZoneLimit
 00444FB8    mov         edx,dword ptr [ebp+8]
 00444FBB    mov         edx,dword ptr [edx-4]
 00444FBE    cmp         eax,dword ptr [edx+4]
>00444FC1    jl          00444FF5
 00444FC3    mov         eax,ebx
 00444FC5    call        TDockZone.GetZoneLimit
 00444FCA    mov         edx,dword ptr [ebp+8]
 00444FCD    mov         edx,dword ptr [edx-8]
 00444FD0    sub         eax,dword ptr [edx+0C]
 00444FD3    mov         edx,dword ptr [ebp+8]
 00444FD6    mov         edx,dword ptr [edx-4]
 00444FD9    cmp         eax,dword ptr [edx+4]
>00444FDC    jg          00444FF5
 00444FDE    mov         eax,dword ptr [ebp+8]
 00444FE1    mov         eax,dword ptr [eax-0C]
 00444FE4    mov         dword ptr [eax],12
 00444FEA    mov         eax,dword ptr [ebp+8]
 00444FED    mov         dword ptr [eax-10],ebx
>00444FF0    jmp         0044517D
 00444FF5    mov         eax,dword ptr [ebx+14]
 00444FF8    cmp         byte ptr [eax+10],2
>00444FFC    jne         00445040
 00444FFE    mov         eax,ebx
 00445000    call        TDockZone.GetZoneLimit
 00445005    mov         edx,dword ptr [ebp+8]
 00445008    mov         edx,dword ptr [edx-4]
 0044500B    cmp         eax,dword ptr [edx]
>0044500D    jl          00445040
 0044500F    mov         eax,ebx
 00445011    call        TDockZone.GetZoneLimit
 00445016    mov         edx,dword ptr [ebp+8]
 00445019    mov         edx,dword ptr [edx-8]
 0044501C    sub         eax,dword ptr [edx+0C]
 0044501F    mov         edx,dword ptr [ebp+8]
 00445022    mov         edx,dword ptr [edx-4]
 00445025    cmp         eax,dword ptr [edx]
>00445027    jg          00445040
 00445029    mov         eax,dword ptr [ebp+8]
 0044502C    mov         eax,dword ptr [eax-0C]
 0044502F    mov         dword ptr [eax],12
 00445035    mov         eax,dword ptr [ebp+8]
 00445038    mov         dword ptr [eax-10],ebx
>0044503B    jmp         0044517D
 00445040    cmp         dword ptr [ebx+4],0
>00445044    je          0044517D
 0044504A    mov         edx,1
 0044504F    mov         eax,ebx
 00445051    call        TDockZone.GetTopLeft
 00445056    mov         esi,eax
 00445058    mov         edx,2
 0044505D    mov         eax,ebx
 0044505F    call        TDockZone.GetTopLeft
 00445064    mov         edi,eax
 00445066    mov         eax,dword ptr [ebp+8]
 00445069    mov         eax,dword ptr [eax-8]
 0044506C    cmp         byte ptr [eax+1C],0
>00445070    je          00445104
 00445076    mov         eax,dword ptr [ebp+8]
 00445079    mov         eax,dword ptr [eax-4]
 0044507C    cmp         esi,dword ptr [eax+4]
>0044507F    jg          0044517D
 00445085    mov         eax,dword ptr [ebp+8]
 00445088    mov         eax,dword ptr [eax-4]
 0044508B    mov         eax,dword ptr [eax+4]
 0044508E    mov         edx,dword ptr [ebp+8]
 00445091    mov         edx,dword ptr [edx-8]
 00445094    add         esi,dword ptr [edx+18]
 00445097    cmp         eax,esi
>00445099    jg          0044517D
 0044509F    mov         eax,dword ptr [ebp+8]
 004450A2    mov         eax,dword ptr [eax-4]
 004450A5    cmp         edi,dword ptr [eax]
>004450A7    jg          0044517D
 004450AD    mov         edx,2
 004450B2    mov         eax,ebx
 004450B4    call        TDockZone.GetHeightWidth
 004450B9    add         edi,eax
 004450BB    mov         eax,dword ptr [ebp+8]
 004450BE    mov         eax,dword ptr [eax-4]
 004450C1    cmp         edi,dword ptr [eax]
>004450C3    jl          0044517D
 004450C9    mov         eax,dword ptr [ebp+8]
 004450CC    mov         dword ptr [eax-10],ebx
 004450CF    mov         eax,dword ptr [ebx+4]
 004450D2    mov         edx,dword ptr [eax+40]
 004450D5    add         edx,dword ptr [eax+48]
 004450D8    sub         edx,0F
 004450DB    mov         eax,dword ptr [ebp+8]
 004450DE    mov         eax,dword ptr [eax-4]
 004450E1    cmp         edx,dword ptr [eax]
>004450E3    jge         004450F6
 004450E5    mov         eax,dword ptr [ebp+8]
 004450E8    mov         eax,dword ptr [eax-0C]
 004450EB    mov         dword ptr [eax],14
>004450F1    jmp         0044517D
 004450F6    mov         eax,dword ptr [ebp+8]
 004450F9    mov         eax,dword ptr [eax-0C]
 004450FC    mov         dword ptr [eax],2
>00445102    jmp         0044517D
 00445104    mov         eax,dword ptr [ebp+8]
 00445107    mov         eax,dword ptr [eax-4]
 0044510A    cmp         edi,dword ptr [eax]
>0044510C    jg          0044517D
 0044510E    mov         eax,dword ptr [ebp+8]
 00445111    mov         eax,dword ptr [eax-4]
 00445114    mov         eax,dword ptr [eax]
 00445116    mov         edx,dword ptr [ebp+8]
 00445119    mov         edx,dword ptr [edx-8]
 0044511C    add         edi,dword ptr [edx+18]
 0044511F    cmp         eax,edi
>00445121    jg          0044517D
 00445123    mov         eax,dword ptr [ebp+8]
 00445126    mov         eax,dword ptr [eax-4]
 00445129    cmp         esi,dword ptr [eax+4]
>0044512C    jg          0044517D
 0044512E    mov         edx,1
 00445133    mov         eax,ebx
 00445135    call        TDockZone.GetHeightWidth
 0044513A    add         esi,eax
 0044513C    mov         eax,dword ptr [ebp+8]
 0044513F    mov         eax,dword ptr [eax-4]
 00445142    cmp         esi,dword ptr [eax+4]
>00445145    jl          0044517D
 00445147    mov         eax,dword ptr [ebp+8]
 0044514A    mov         dword ptr [eax-10],ebx
 0044514D    mov         eax,dword ptr [ebp+8]
 00445150    mov         eax,dword ptr [eax-4]
 00445153    mov         eax,dword ptr [eax+4]
 00445156    mov         edx,dword ptr [ebx+4]
 00445159    mov         edx,dword ptr [edx+44]
 0044515C    add         edx,0F
 0044515F    cmp         eax,edx
>00445161    jge         00445171
 00445163    mov         eax,dword ptr [ebp+8]
 00445166    mov         eax,dword ptr [eax-0C]
 00445169    mov         dword ptr [eax],14
>0044516F    jmp         0044517D
 00445171    mov         eax,dword ptr [ebp+8]
 00445174    mov         eax,dword ptr [eax-0C]
 00445177    mov         dword ptr [eax],2
 0044517D    mov         eax,dword ptr [ebp+8]
 00445180    cmp         dword ptr [eax-10],0
>00445184    jne         004451A2
 00445186    mov         eax,ebx
 00445188    call        TDockZone.NextVisible
 0044518D    test        eax,eax
>0044518F    je          004451A2
 00445191    mov         eax,dword ptr [ebp+8]
 00445194    push        eax
 00445195    mov         eax,ebx
 00445197    call        TDockZone.NextVisible
 0044519C    call        DoFindZone
 004451A1    pop         ecx
 004451A2    mov         eax,dword ptr [ebp+8]
 004451A5    cmp         dword ptr [eax-10],0
>004451A9    jne         004451C7
 004451AB    mov         eax,ebx
 004451AD    call        TDockZone.FirstVisibleChild
 004451B2    test        eax,eax
>004451B4    je          004451C7
 004451B6    mov         eax,dword ptr [ebp+8]
 004451B9    push        eax
 004451BA    mov         eax,ebx
 004451BC    call        TDockZone.FirstVisibleChild
 004451C1    call        DoFindZone
 004451C6    pop         ecx
 004451C7    pop         edi
 004451C8    pop         esi
 004451C9    pop         ebx
 004451CA    pop         ebp
 004451CB    ret
*}
end;

//004451CC
function FindControlAtPos(const Pos:TPoint):TControl;
begin
{*
 004451CC    push        ebp
 004451CD    mov         ebp,esp
 004451CF    add         esp,0FFFFFFE8
 004451D2    push        ebx
 004451D3    push        esi
 004451D4    push        edi
 004451D5    mov         edi,eax
 004451D7    mov         eax,dword ptr [ebp+8]
 004451DA    mov         eax,dword ptr [eax-8]
 004451DD    mov         eax,dword ptr [eax+14]
 004451E0    call        TWinControl.GetControlCount
 004451E5    mov         esi,eax
 004451E7    dec         esi
 004451E8    cmp         esi,0
>004451EB    jl          00445255
 004451ED    mov         eax,dword ptr [ebp+8]
 004451F0    mov         eax,dword ptr [eax-8]
 004451F3    mov         eax,dword ptr [eax+14]
 004451F6    mov         edx,esi
 004451F8    call        TWinControl.GetControl
 004451FD    mov         ebx,eax
 004451FF    cmp         byte ptr [ebx+57],0
>00445203    je          0044524F
 00445205    mov         eax,ebx
 00445207    mov         edx,dword ptr ds:[4380F4];TWinControl
 0044520D    call        @IsClass
 00445212    test        al,al
>00445214    je          0044521F
 00445216    cmp         byte ptr [ebx+1A6],0
>0044521D    je          0044524F
 0044521F    mov         edx,dword ptr [edi+4]
 00445222    sub         edx,dword ptr [ebx+44]
 00445225    mov         eax,dword ptr [edi]
 00445227    sub         eax,dword ptr [ebx+40]
 0044522A    lea         ecx,[ebp-8]
 0044522D    call        Point
 00445232    push        dword ptr [ebp-4]
 00445235    push        dword ptr [ebp-8]
 00445238    lea         edx,[ebp-18]
 0044523B    mov         eax,ebx
 0044523D    mov         ecx,dword ptr [eax]
 0044523F    call        dword ptr [ecx+44]
 00445242    lea         eax,[ebp-18]
 00445245    push        eax
 00445246    call        user32.PtInRect
 0044524B    test        eax,eax
>0044524D    jne         00445257
 0044524F    dec         esi
 00445250    cmp         esi,0FFFFFFFF
>00445253    jne         004451ED
 00445255    xor         ebx,ebx
 00445257    mov         eax,ebx
 00445259    pop         edi
 0044525A    pop         esi
 0044525B    pop         ebx
 0044525C    mov         esp,ebp
 0044525E    pop         ebp
 0044525F    ret
*}
end;

//00445260
function TDockTree.InternalHitTest(const MousePos:TPoint; var HTFlag:Integer):TDockZone;
begin
{*
 00445260    push        ebp
 00445261    mov         ebp,esp
 00445263    add         esp,0FFFFFFF0
 00445266    push        ebx
 00445267    mov         dword ptr [ebp-0C],ecx
 0044526A    mov         dword ptr [ebp-4],edx
 0044526D    mov         dword ptr [ebp-8],eax
 00445270    xor         eax,eax
 00445272    mov         dword ptr [ebp-10],eax
 00445275    mov         eax,dword ptr [ebp-0C]
 00445278    xor         edx,edx
 0044527A    mov         dword ptr [eax],edx
 0044527C    push        ebp
 0044527D    mov         eax,dword ptr [ebp-4]
 00445280    call        FindControlAtPos
 00445285    pop         ecx
 00445286    mov         ebx,eax
 00445288    test        ebx,ebx
>0044528A    je          004452B8
 0044528C    mov         eax,dword ptr [ebp-8]
 0044528F    mov         eax,dword ptr [eax+14]
 00445292    cmp         eax,dword ptr [ebx+0A0]
>00445298    jne         004452B8
 0044529A    mov         edx,ebx
 0044529C    mov         eax,dword ptr [ebp-8]
 0044529F    call        TDockTree.FindControlZone
 004452A4    mov         dword ptr [ebp-10],eax
 004452A7    cmp         dword ptr [ebp-10],0
>004452AB    je          004452DD
 004452AD    mov         eax,dword ptr [ebp-0C]
 004452B0    mov         dword ptr [eax],1
>004452B6    jmp         004452DD
 004452B8    mov         eax,dword ptr [ebp-8]
 004452BB    mov         eax,dword ptr [eax+64]
 004452BE    call        TDockZone.FirstVisibleChild
 004452C3    test        eax,eax
>004452C5    je          004452DD
 004452C7    test        ebx,ebx
>004452C9    jne         004452DD
 004452CB    push        ebp
 004452CC    mov         eax,dword ptr [ebp-8]
 004452CF    mov         eax,dword ptr [eax+64]
 004452D2    call        TDockZone.FirstVisibleChild
 004452D7    call        DoFindZone
 004452DC    pop         ecx
 004452DD    mov         eax,dword ptr [ebp-10]
 004452E0    pop         ebx
 004452E1    mov         esp,ebp
 004452E3    pop         ebp
 004452E4    ret
*}
end;

//004452E8
procedure ReadControlName(var ControlName:AnsiString);
begin
{*
 004452E8    push        ebp
 004452E9    mov         ebp,esp
 004452EB    push        ecx
 004452EC    push        ebx
 004452ED    push        esi
 004452EE    mov         ebx,eax
 004452F0    mov         eax,ebx
 004452F2    call        @LStrClr
 004452F7    lea         edx,[ebp-4]
 004452FA    mov         eax,dword ptr [ebp+8]
 004452FD    mov         eax,dword ptr [eax-4]
 00445300    mov         ecx,4
 00445305    mov         esi,dword ptr [eax]
 00445307    call        dword ptr [esi+0C]
 0044530A    cmp         dword ptr [ebp-4],0
>0044530E    jle         0044532A
 00445310    mov         eax,ebx
 00445312    mov         edx,dword ptr [ebp-4]
 00445315    call        @LStrSetLength
 0044531A    mov         edx,dword ptr [ebx]
 0044531C    mov         eax,dword ptr [ebp+8]
 0044531F    mov         eax,dword ptr [eax-4]
 00445322    mov         ecx,dword ptr [ebp-4]
 00445325    mov         ebx,dword ptr [eax]
 00445327    call        dword ptr [ebx+0C]
 0044532A    pop         esi
 0044532B    pop         ebx
 0044532C    pop         ecx
 0044532D    pop         ebp
 0044532E    ret
*}
end;

//00445330
procedure TDockTree.LoadFromStream(Stream:TStream);
begin
{*
 00445330    push        ebp
 00445331    mov         ebp,esp
 00445333    add         esp,0FFFFFFE0
 00445336    push        ebx
 00445337    push        esi
 00445338    push        edi
 00445339    xor         ecx,ecx
 0044533B    mov         dword ptr [ebp-0C],ecx
 0044533E    mov         dword ptr [ebp-4],edx
 00445341    mov         dword ptr [ebp-8],eax
 00445344    xor         eax,eax
 00445346    push        ebp
 00445347    push        445528
 0044534C    push        dword ptr fs:[eax]
 0044534F    mov         dword ptr fs:[eax],esp
 00445352    mov         eax,dword ptr [ebp-8]
 00445355    mov         edx,dword ptr [eax+64]
 00445358    mov         eax,dword ptr [ebp-8]
 0044535B    call        TDockTree.PruneZone
 00445360    mov         eax,dword ptr [ebp-8]
 00445363    call        TDockTree.BeginUpdate
 00445368    xor         edx,edx
 0044536A    push        ebp
 0044536B    push        44550B
 00445370    push        dword ptr fs:[edx]
 00445373    mov         dword ptr fs:[edx],esp
 00445376    lea         edx,[ebp-1C]
 00445379    mov         ecx,4
 0044537E    mov         eax,dword ptr [ebp-4]
 00445381    mov         ebx,dword ptr [eax]
 00445383    call        dword ptr [ebx+0C]
 00445386    lea         edx,[ebp-20]
 00445389    mov         ecx,4
 0044538E    mov         eax,dword ptr [ebp-4]
 00445391    mov         ebx,dword ptr [eax]
 00445393    call        dword ptr [ebx+0C]
 00445396    mov         edi,dword ptr [ebp-20]
 00445399    dec         edi
 0044539A    test        edi,edi
>0044539C    jl          004453F3
 0044539E    inc         edi
 0044539F    mov         dword ptr [ebp-1C],0
 004453A6    push        ebp
 004453A7    lea         eax,[ebp-0C]
 004453AA    call        ReadControlName
 004453AF    pop         ecx
 004453B0    cmp         dword ptr [ebp-0C],0
>004453B4    je          004453ED
 004453B6    lea         ecx,[ebp-10]
 004453B9    mov         eax,dword ptr [ebp-8]
 004453BC    mov         eax,dword ptr [eax+14]
 004453BF    mov         edx,dword ptr [ebp-0C]
 004453C2    mov         si,0FFB9
 004453C6    call        @CallDynaInst
 004453CB    cmp         dword ptr [ebp-10],0
>004453CF    je          004453ED
 004453D1    xor         edx,edx
 004453D3    mov         eax,dword ptr [ebp-10]
 004453D6    call        TControl.SetVisible
 004453DB    push        0
 004453DD    mov         eax,dword ptr [ebp-8]
 004453E0    mov         edx,dword ptr [eax+14]
 004453E3    xor         ecx,ecx
 004453E5    mov         eax,dword ptr [ebp-10]
 004453E8    call        TControl.ManualDock
 004453ED    inc         dword ptr [ebp-1C]
 004453F0    dec         edi
>004453F1    jne         004453A6
 004453F3    mov         eax,dword ptr [ebp-8]
 004453F6    lea         edx,[eax+68]
 004453F9    mov         ecx,4
 004453FE    mov         eax,dword ptr [ebp-4]
 00445401    mov         ebx,dword ptr [eax]
 00445403    call        dword ptr [ebx+0C]
 00445406    xor         eax,eax
 00445408    mov         dword ptr [ebp-18],eax
 0044540B    xor         esi,esi
 0044540D    lea         edx,[ebp-14]
 00445410    mov         ecx,4
 00445415    mov         eax,dword ptr [ebp-4]
 00445418    mov         ebx,dword ptr [eax]
 0044541A    call        dword ptr [ebx+0C]
 0044541D    mov         eax,dword ptr [ebp-14]
 00445420    cmp         eax,dword ptr ds:[5ACC88]
>00445426    je          004454F5
 0044542C    mov         ecx,dword ptr [ebp-8]
 0044542F    mov         dl,1
 00445431    mov         eax,[004388C8];TDockZone
 00445436    call        TDockZone.Create
 0044543B    mov         ebx,eax
 0044543D    lea         edx,[ebx+10]
 00445440    mov         ecx,1
 00445445    mov         eax,dword ptr [ebp-4]
 00445448    mov         edi,dword ptr [eax]
 0044544A    call        dword ptr [edi+0C]
 0044544D    lea         edx,[ebx+20]
 00445450    mov         ecx,4
 00445455    mov         eax,dword ptr [ebp-4]
 00445458    mov         edi,dword ptr [eax]
 0044545A    call        dword ptr [edi+0C]
 0044545D    push        ebp
 0044545E    lea         eax,[ebp-0C]
 00445461    call        ReadControlName
 00445466    pop         ecx
 00445467    cmp         dword ptr [ebp-0C],0
>0044546B    je          00445484
 0044546D    mov         edx,dword ptr [ebp-0C]
 00445470    mov         eax,ebx
 00445472    call        TDockZone.SetControlName
 00445477    test        al,al
>00445479    jne         00445484
 0044547B    mov         eax,ebx
 0044547D    call        TObject.Free
>00445482    jmp         0044540D
 00445484    cmp         dword ptr [ebp-14],0
>00445488    jne         00445492
 0044548A    mov         eax,dword ptr [ebp-8]
 0044548D    mov         dword ptr [eax+64],ebx
>00445490    jmp         004454E8
 00445492    mov         eax,dword ptr [ebp-14]
 00445495    cmp         eax,dword ptr [ebp-18]
>00445498    jne         004454A8
 0044549A    mov         dword ptr [esi+0C],ebx
 0044549D    mov         dword ptr [ebx+18],esi
 004454A0    mov         eax,dword ptr [esi+14]
 004454A3    mov         dword ptr [ebx+14],eax
>004454A6    jmp         004454E8
 004454A8    mov         eax,dword ptr [ebp-14]
 004454AB    cmp         eax,dword ptr [ebp-18]
>004454AE    jle         004454B8
 004454B0    mov         dword ptr [esi+8],ebx
 004454B3    mov         dword ptr [ebx+14],esi
>004454B6    jmp         004454E8
 004454B8    mov         eax,dword ptr [ebp-14]
 004454BB    cmp         eax,dword ptr [ebp-18]
>004454BE    jge         004454E8
 004454C0    mov         eax,esi
 004454C2    mov         edi,dword ptr [ebp-18]
 004454C5    sub         edi,dword ptr [ebp-14]
 004454C8    test        edi,edi
>004454CA    jle         004454DC
 004454CC    mov         dword ptr [ebp-1C],1
 004454D3    mov         eax,dword ptr [eax+14]
 004454D6    inc         dword ptr [ebp-1C]
 004454D9    dec         edi
>004454DA    jne         004454D3
 004454DC    mov         dword ptr [eax+0C],ebx
 004454DF    mov         dword ptr [ebx+18],eax
 004454E2    mov         eax,dword ptr [eax+14]
 004454E5    mov         dword ptr [ebx+14],eax
 004454E8    mov         eax,dword ptr [ebp-14]
 004454EB    mov         dword ptr [ebp-18],eax
 004454EE    mov         esi,ebx
>004454F0    jmp         0044540D
 004454F5    xor         eax,eax
 004454F7    pop         edx
 004454F8    pop         ecx
 004454F9    pop         ecx
 004454FA    mov         dword ptr fs:[eax],edx
 004454FD    push        445512
 00445502    mov         eax,dword ptr [ebp-8]
 00445505    call        TDockTree.EndUpdate
 0044550A    ret
>0044550B    jmp         @HandleFinally
>00445510    jmp         00445502
 00445512    xor         eax,eax
 00445514    pop         edx
 00445515    pop         ecx
 00445516    pop         ecx
 00445517    mov         dword ptr fs:[eax],edx
 0044551A    push        44552F
 0044551F    lea         eax,[ebp-0C]
 00445522    call        @LStrClr
 00445527    ret
>00445528    jmp         @HandleFinally
>0044552D    jmp         0044551F
 0044552F    pop         edi
 00445530    pop         esi
 00445531    pop         ebx
 00445532    mov         esp,ebp
 00445534    pop         ebp
 00445535    ret
*}
end;

//00445538
procedure DrawCloseButton(Left:Integer; Top:Integer);
begin
{*
 00445538    push        ebp
 00445539    mov         ebp,esp
 0044553B    add         esp,0FFFFFFF0
 0044553E    push        ebx
 0044553F    push        esi
 00445540    push        edi
 00445541    mov         esi,edx
 00445543    mov         ebx,eax
 00445545    push        0
 00445547    push        1
 00445549    mov         eax,dword ptr [ebp+8]
 0044554C    mov         eax,dword ptr [eax-8]
 0044554F    mov         edi,dword ptr [eax+18]
 00445552    mov         eax,edi
 00445554    add         eax,esi
 00445556    sub         eax,2
 00445559    push        eax
 0044555A    lea         eax,[ebp-10]
 0044555D    push        eax
 0044555E    mov         eax,dword ptr [ebp+8]
 00445561    mov         ecx,edi
 00445563    add         ecx,ebx
 00445565    sub         ecx,2
 00445568    mov         edx,esi
 0044556A    mov         eax,ebx
 0044556C    call        Bounds
 00445571    lea         eax,[ebp-10]
 00445574    push        eax
 00445575    mov         eax,dword ptr [ebp+8]
 00445578    mov         eax,dword ptr [eax-4]
 0044557B    call        TCanvas.GetHandle
 00445580    push        eax
 00445581    call        user32.DrawFrameControl
 00445586    pop         edi
 00445587    pop         esi
 00445588    pop         ebx
 00445589    mov         esp,ebp
 0044558B    pop         ebp
 0044558C    ret
*}
end;

//00445590
procedure DrawGrabberLine(Left:Integer; Top:Integer; Right:Integer; Bottom:Integer);
begin
{*
 00445590    push        ebp
 00445591    mov         ebp,esp
 00445593    push        ebx
 00445594    push        esi
 00445595    push        edi
 00445596    mov         esi,ecx
 00445598    mov         ebx,edx
 0044559A    mov         edi,eax
 0044559C    mov         eax,dword ptr [ebp+0C]
 0044559F    mov         eax,dword ptr [eax-4]
 004455A2    mov         eax,dword ptr [eax+10]
 004455A5    mov         edx,0FF000014
 004455AA    call        TPen.SetColor
 004455AF    mov         eax,dword ptr [ebp+0C]
 004455B2    mov         eax,dword ptr [eax-4]
 004455B5    mov         ecx,ebx
 004455B7    mov         edx,esi
 004455B9    call        TCanvas.MoveTo
 004455BE    mov         eax,dword ptr [ebp+0C]
 004455C1    mov         eax,dword ptr [eax-4]
 004455C4    mov         ecx,ebx
 004455C6    mov         edx,edi
 004455C8    call        TCanvas.LineTo
 004455CD    mov         eax,dword ptr [ebp+0C]
 004455D0    mov         eax,dword ptr [eax-4]
 004455D3    mov         ecx,dword ptr [ebp+8]
 004455D6    mov         edx,edi
 004455D8    call        TCanvas.LineTo
 004455DD    mov         eax,dword ptr [ebp+0C]
 004455E0    mov         eax,dword ptr [eax-4]
 004455E3    mov         eax,dword ptr [eax+10]
 004455E6    mov         edx,0FF000010
 004455EB    call        TPen.SetColor
 004455F0    mov         eax,dword ptr [ebp+0C]
 004455F3    mov         eax,dword ptr [eax-4]
 004455F6    mov         ecx,dword ptr [ebp+8]
 004455F9    mov         edx,esi
 004455FB    call        TCanvas.LineTo
 00445600    mov         ecx,ebx
 00445602    dec         ecx
 00445603    mov         eax,dword ptr [ebp+0C]
 00445606    mov         eax,dword ptr [eax-4]
 00445609    mov         edx,esi
 0044560B    call        TCanvas.LineTo
 00445610    pop         edi
 00445611    pop         esi
 00445612    pop         ebx
 00445613    pop         ebp
 00445614    ret         4
*}
end;

//00445618
procedure TDockTree.PaintDockFrame(Canvas:TCanvas; Control:TControl; const ARect:TRect);
begin
{*
 00445618    push        ebp
 00445619    mov         ebp,esp
 0044561B    add         esp,0FFFFFFF8
 0044561E    push        ebx
 0044561F    mov         dword ptr [ebp-4],edx
 00445622    mov         dword ptr [ebp-8],eax
 00445625    mov         ebx,dword ptr [ebp+8]
 00445628    mov         eax,dword ptr [ebp-8]
 0044562B    mov         eax,dword ptr [eax+14]
 0044562E    mov         al,byte ptr [eax+5B]
 00445631    dec         eax
 00445632    sub         al,2
>00445634    jae         0044568A
 00445636    push        ebp
 00445637    mov         edx,dword ptr [ebx+4]
 0044563A    inc         edx
 0044563B    mov         eax,dword ptr [ebx]
 0044563D    inc         eax
 0044563E    call        DrawCloseButton
 00445643    pop         ecx
 00445644    push        ebp
 00445645    mov         edx,dword ptr [ebx+0C]
 00445648    sub         edx,2
 0044564B    push        edx
 0044564C    mov         edx,dword ptr [ebx+4]
 0044564F    mov         ecx,dword ptr [ebp-8]
 00445652    add         edx,dword ptr [ecx+18]
 00445655    inc         edx
 00445656    mov         eax,dword ptr [ebx]
 00445658    mov         ecx,eax
 0044565A    add         ecx,5
 0044565D    add         eax,3
 00445660    call        DrawGrabberLine
 00445665    pop         ecx
 00445666    push        ebp
 00445667    mov         edx,dword ptr [ebx+0C]
 0044566A    sub         edx,2
 0044566D    push        edx
 0044566E    mov         edx,dword ptr [ebx+4]
 00445671    mov         ecx,dword ptr [ebp-8]
 00445674    add         edx,dword ptr [ecx+18]
 00445677    inc         edx
 00445678    mov         eax,dword ptr [ebx]
 0044567A    mov         ecx,eax
 0044567C    add         ecx,8
 0044567F    add         eax,6
 00445682    call        DrawGrabberLine
 00445687    pop         ecx
>00445688    jmp         004456EB
 0044568A    push        ebp
 0044568B    mov         eax,dword ptr [ebx+8]
 0044568E    mov         edx,dword ptr [ebp-8]
 00445691    sub         eax,dword ptr [edx+18]
 00445694    inc         eax
 00445695    mov         edx,dword ptr [ebx+4]
 00445698    inc         edx
 00445699    call        DrawCloseButton
 0044569E    pop         ecx
 0044569F    push        ebp
 004456A0    mov         eax,dword ptr [ebx+4]
 004456A3    mov         edx,eax
 004456A5    add         edx,5
 004456A8    push        edx
 004456A9    mov         ecx,dword ptr [ebx+8]
 004456AC    mov         edx,dword ptr [ebp-8]
 004456AF    sub         ecx,dword ptr [edx+18]
 004456B2    sub         ecx,2
 004456B5    mov         edx,eax
 004456B7    add         edx,3
 004456BA    mov         eax,dword ptr [ebx]
 004456BC    add         eax,2
 004456BF    call        DrawGrabberLine
 004456C4    pop         ecx
 004456C5    push        ebp
 004456C6    mov         eax,dword ptr [ebx+4]
 004456C9    mov         edx,eax
 004456CB    add         edx,8
 004456CE    push        edx
 004456CF    mov         ecx,dword ptr [ebx+8]
 004456D2    mov         edx,dword ptr [ebp-8]
 004456D5    sub         ecx,dword ptr [edx+18]
 004456D8    sub         ecx,2
 004456DB    mov         edx,eax
 004456DD    add         edx,6
 004456E0    mov         eax,dword ptr [ebx]
 004456E2    add         eax,2
 004456E5    call        DrawGrabberLine
 004456EA    pop         ecx
 004456EB    pop         ebx
 004456EC    pop         ecx
 004456ED    pop         ecx
 004456EE    pop         ebp
 004456EF    ret         4
*}
end;

//004456F4
procedure TDockTree.PaintSite(DC:HDC);
begin
{*
 004456F4    push        ebp
 004456F5    mov         ebp,esp
 004456F7    add         esp,0FFFFFFE4
 004456FA    push        ebx
 004456FB    push        esi
 004456FC    push        edi
 004456FD    mov         ebx,edx
 004456FF    mov         esi,eax
 00445701    mov         dl,1
 00445703    mov         eax,[00436FD4];TControlCanvas
 00445708    call        TCanvas.Create
 0044570D    mov         dword ptr [ebp-4],eax
 00445710    xor         eax,eax
 00445712    push        ebp
 00445713    push        44584A
 00445718    push        dword ptr fs:[eax]
 0044571B    mov         dword ptr fs:[eax],esp
 0044571E    mov         edx,dword ptr [esi+14]
 00445721    mov         eax,dword ptr [ebp-4]
 00445724    call        TControlCanvas.SetControl
 00445729    mov         eax,dword ptr [ebp-4]
 0044572C    call        TCanvas.Lock
 00445731    xor         eax,eax
 00445733    push        ebp
 00445734    push        44582D
 00445739    push        dword ptr fs:[eax]
 0044573C    mov         dword ptr fs:[eax],esp
 0044573F    mov         edx,ebx
 00445741    mov         eax,dword ptr [ebp-4]
 00445744    call        TCanvas.SetHandle
 00445749    xor         eax,eax
 0044574B    push        ebp
 0044574C    push        445810
 00445751    push        dword ptr fs:[eax]
 00445754    mov         dword ptr fs:[eax],esp
 00445757    mov         eax,dword ptr [esi+14]
 0044575A    call        TWinControl.GetControlCount
 0044575F    dec         eax
 00445760    test        eax,eax
>00445762    jl          004457F8
 00445768    inc         eax
 00445769    mov         dword ptr [ebp-0C],eax
 0044576C    mov         dword ptr [ebp-8],0
 00445773    mov         eax,dword ptr [esi+14]
 00445776    mov         edx,dword ptr [ebp-8]
 00445779    call        TWinControl.GetControl
 0044577E    mov         ebx,eax
 00445780    cmp         byte ptr [ebx+57],0
>00445784    je          004457EC
 00445786    mov         eax,dword ptr [ebx+0A0]
 0044578C    cmp         eax,dword ptr [esi+14]
>0044578F    jne         004457EC
 00445791    lea         edx,[ebp-1C]
 00445794    mov         eax,ebx
 00445796    call        TControl.GetBoundsRect
 0044579B    lea         ecx,[ebp-1C]
 0044579E    mov         edx,ebx
 004457A0    mov         eax,esi
 004457A2    mov         edi,dword ptr [eax]
 004457A4    call        dword ptr [edi]
 004457A6    mov         eax,dword ptr [ebp-1C]
 004457A9    sub         eax,dword ptr [ebx+40]
 004457AC    add         eax,eax
 004457AE    sub         dword ptr [ebp-1C],eax
 004457B1    mov         eax,dword ptr [ebp-18]
 004457B4    sub         eax,dword ptr [ebx+44]
 004457B7    add         eax,eax
 004457B9    sub         dword ptr [ebp-18],eax
 004457BC    mov         eax,dword ptr [ebx+48]
 004457BF    mov         edx,dword ptr [ebp-14]
 004457C2    sub         edx,dword ptr [ebp-1C]
 004457C5    sub         eax,edx
 004457C7    add         eax,eax
 004457C9    sub         dword ptr [ebp-14],eax
 004457CC    mov         eax,dword ptr [ebx+4C]
 004457CF    mov         edx,dword ptr [ebp-10]
 004457D2    sub         edx,dword ptr [ebp-18]
 004457D5    sub         eax,edx
 004457D7    add         eax,eax
 004457D9    sub         dword ptr [ebp-10],eax
 004457DC    lea         eax,[ebp-1C]
 004457DF    push        eax
 004457E0    mov         ecx,ebx
 004457E2    mov         edx,dword ptr [ebp-4]
 004457E5    mov         eax,esi
 004457E7    mov         ebx,dword ptr [eax]
 004457E9    call        dword ptr [ebx+10]
 004457EC    inc         dword ptr [ebp-8]
 004457EF    dec         dword ptr [ebp-0C]
>004457F2    jne         00445773
 004457F8    xor         eax,eax
 004457FA    pop         edx
 004457FB    pop         ecx
 004457FC    pop         ecx
 004457FD    mov         dword ptr fs:[eax],edx
 00445800    push        445817
 00445805    xor         edx,edx
 00445807    mov         eax,dword ptr [ebp-4]
 0044580A    call        TCanvas.SetHandle
 0044580F    ret
>00445810    jmp         @HandleFinally
>00445815    jmp         00445805
 00445817    xor         eax,eax
 00445819    pop         edx
 0044581A    pop         ecx
 0044581B    pop         ecx
 0044581C    mov         dword ptr fs:[eax],edx
 0044581F    push        445834
 00445824    mov         eax,dword ptr [ebp-4]
 00445827    call        TCanvas.Unlock
 0044582C    ret
>0044582D    jmp         @HandleFinally
>00445832    jmp         00445824
 00445834    xor         eax,eax
 00445836    pop         edx
 00445837    pop         ecx
 00445838    pop         ecx
 00445839    mov         dword ptr fs:[eax],edx
 0044583C    push        445851
 00445841    mov         eax,dword ptr [ebp-4]
 00445844    call        TObject.Free
 00445849    ret
>0044584A    jmp         @HandleFinally
>0044584F    jmp         00445841
 00445851    pop         edi
 00445852    pop         esi
 00445853    pop         ebx
 00445854    mov         esp,ebp
 00445856    pop         ebp
 00445857    ret
*}
end;

//00445858
{*procedure sub_00445858(?:?; ?:?; ?:?; ?:?);
begin
 00445858    push        ebp
 00445859    mov         ebp,esp
 0044585B    add         esp,0FFFFFFE4
 0044585E    push        ebx
 0044585F    push        esi
 00445860    push        edi
 00445861    mov         ebx,ecx
 00445863    mov         esi,eax
 00445865    mov         eax,dword ptr [esi+14];TDockTree.FDockSite:TWinControl
 00445868    call        TWinControl.GetVisibleDockClientCount
 0044586D    mov         edi,eax
 0044586F    test        ebx,ebx
>00445871    je          00445885
 00445873    cmp         byte ptr [ebx+9C],0
>0044587A    je          00445885
 0044587C    cmp         edi,2
>0044587F    jge         00445931
 00445885    mov         eax,dword ptr [esi+14];TDockTree.FDockSite:TWinControl
 00445888    call        TControl.GetClientHeight
 0044588D    push        eax
 0044588E    lea         eax,[ebp-1C]
 00445891    push        eax
 00445892    mov         eax,dword ptr [esi+14];TDockTree.FDockSite:TWinControl
 00445895    call        TControl.GetClientWidth
 0044589A    mov         ecx,eax
 0044589C    xor         edx,edx
 0044589E    xor         eax,eax
 004458A0    call        Bounds
 004458A5    mov         eax,dword ptr [ebp+8]
 004458A8    push        esi
 004458A9    push        edi
 004458AA    lea         esi,[ebp-1C]
 004458AD    mov         edi,eax
 004458AF    movs        dword ptr [edi],dword ptr [esi]
 004458B0    movs        dword ptr [edi],dword ptr [esi]
 004458B1    movs        dword ptr [edi],dword ptr [esi]
 004458B2    movs        dword ptr [edi],dword ptr [esi]
 004458B3    pop         edi
 004458B4    pop         esi
 004458B5    test        edi,edi
>004458B7    jle         004459AC
 004458BD    mov         al,byte ptr [ebp+0C]
 004458C0    dec         al
>004458C2    je          00445904
 004458C4    dec         al
>004458C6    je          0044591C
 004458C8    dec         al
>004458CA    je          004458D5
 004458CC    dec         al
>004458CE    je          004458ED
>004458D0    jmp         004459AC
 004458D5    mov         eax,dword ptr [ebp+8]
 004458D8    mov         eax,dword ptr [eax+8]
 004458DB    sar         eax,1
>004458DD    jns         004458E2
 004458DF    adc         eax,0
 004458E2    mov         edx,dword ptr [ebp+8]
 004458E5    mov         dword ptr [edx+8],eax
>004458E8    jmp         004459AC
 004458ED    mov         eax,dword ptr [ebp+8]
 004458F0    mov         eax,dword ptr [eax+8]
 004458F3    sar         eax,1
>004458F5    jns         004458FA
 004458F7    adc         eax,0
 004458FA    mov         edx,dword ptr [ebp+8]
 004458FD    mov         dword ptr [edx],eax
>004458FF    jmp         004459AC
 00445904    mov         eax,dword ptr [ebp+8]
 00445907    mov         eax,dword ptr [eax+0C]
 0044590A    sar         eax,1
>0044590C    jns         00445911
 0044590E    adc         eax,0
 00445911    mov         edx,dword ptr [ebp+8]
 00445914    mov         dword ptr [edx+0C],eax
>00445917    jmp         004459AC
 0044591C    mov         eax,dword ptr [ebp+8]
 0044591F    mov         eax,dword ptr [eax+0C]
 00445922    sar         eax,1
>00445924    jns         00445929
 00445926    adc         eax,0
 00445929    mov         edx,dword ptr [ebp+8]
 0044592C    mov         dword ptr [edx+4],eax
>0044592F    jmp         004459AC
 00445931    mov         eax,dword ptr [ebx+40]
 00445934    mov         dword ptr [ebp-4],eax
 00445937    mov         eax,dword ptr [ebx+44]
 0044593A    mov         dword ptr [ebp-8],eax
 0044593D    mov         eax,dword ptr [ebx+48]
 00445940    mov         edi,eax
 00445942    mov         edx,dword ptr [ebx+4C]
 00445945    mov         dword ptr [ebp-0C],edx
 00445948    mov         dl,byte ptr [ebp+0C]
 0044594B    add         dl,0FD
 0044594E    sub         dl,2
>00445951    jae         0044595E
 00445953    mov         edi,eax
 00445955    sar         edi,1
>00445957    jns         00445973
 00445959    adc         edi,0
>0044595C    jmp         00445973
 0044595E    mov         al,byte ptr [ebp+0C]
 00445961    dec         eax
 00445962    sub         al,2
>00445964    jae         00445973
 00445966    mov         eax,dword ptr [ebx+4C]
 00445969    sar         eax,1
>0044596B    jns         00445970
 0044596D    adc         eax,0
 00445970    mov         dword ptr [ebp-0C],eax
 00445973    mov         al,byte ptr [ebp+0C]
 00445976    sub         al,2
>00445978    je          00445983
 0044597A    sub         al,2
>0044597C    jne         00445989
 0044597E    add         dword ptr [ebp-4],edi
>00445981    jmp         00445989
 00445983    mov         eax,dword ptr [ebp-0C]
 00445986    add         dword ptr [ebp-8],eax
 00445989    mov         eax,dword ptr [ebp-0C]
 0044598C    push        eax
 0044598D    lea         eax,[ebp-1C]
 00445990    push        eax
 00445991    mov         ecx,edi
 00445993    mov         edx,dword ptr [ebp-8]
 00445996    mov         eax,dword ptr [ebp-4]
 00445999    call        Rect
 0044599E    mov         eax,dword ptr [ebp+8]
 004459A1    push        esi
 004459A2    lea         esi,[ebp-1C]
 004459A5    mov         edi,eax
 004459A7    movs        dword ptr [edi],dword ptr [esi]
 004459A8    movs        dword ptr [edi],dword ptr [esi]
 004459A9    movs        dword ptr [edi],dword ptr [esi]
 004459AA    movs        dword ptr [edi],dword ptr [esi]
 004459AB    pop         esi
 004459AC    push        2
 004459AE    mov         eax,dword ptr [ebp+8]
 004459B1    push        eax
 004459B2    push        0
 004459B4    mov         eax,dword ptr [esi+14];TDockTree.FDockSite:TWinControl
 004459B7    call        TWinControl.GetHandle
 004459BC    push        eax
 004459BD    call        user32.MapWindowPoints
 004459C2    pop         edi
 004459C3    pop         esi
 004459C4    pop         ebx
 004459C5    mov         esp,ebp
 004459C7    pop         ebp
 004459C8    ret         8
end;*}

//004459CC
procedure DoPrune(Zone:TDockZone);
begin
{*
 004459CC    push        ebp
 004459CD    mov         ebp,esp
 004459CF    push        ebx
 004459D0    mov         ebx,eax
 004459D2    mov         eax,dword ptr [ebx+0C]
 004459D5    test        eax,eax
>004459D7    je          004459E3
 004459D9    mov         edx,dword ptr [ebp+8]
 004459DC    push        edx
 004459DD    call        DoPrune
 004459E2    pop         ecx
 004459E3    mov         eax,dword ptr [ebx+8]
 004459E6    test        eax,eax
>004459E8    je          004459F4
 004459EA    mov         edx,dword ptr [ebp+8]
 004459ED    push        edx
 004459EE    call        DoPrune
 004459F3    pop         ecx
 004459F4    mov         eax,ebx
 004459F6    call        TObject.Free
 004459FB    pop         ebx
 004459FC    pop         ebp
 004459FD    ret
*}
end;

//00445A00
procedure TDockTree.PruneZone(Zone:TDockZone);
begin
{*
 00445A00    push        ebp
 00445A01    mov         ebp,esp
 00445A03    push        ebx
 00445A04    push        esi
 00445A05    mov         ebx,edx
 00445A07    mov         esi,eax
 00445A09    test        ebx,ebx
>00445A0B    je          00445A55
 00445A0D    mov         eax,dword ptr [ebx+8]
 00445A10    test        eax,eax
>00445A12    je          00445A1B
 00445A14    push        ebp
 00445A15    call        DoPrune
 00445A1A    pop         ecx
 00445A1B    mov         eax,dword ptr [ebx+18]
 00445A1E    test        eax,eax
>00445A20    je          00445A2A
 00445A22    mov         edx,dword ptr [ebx+0C]
 00445A25    mov         dword ptr [eax+0C],edx
>00445A28    jmp         00445A37
 00445A2A    mov         eax,dword ptr [ebx+14]
 00445A2D    test        eax,eax
>00445A2F    je          00445A37
 00445A31    mov         edx,dword ptr [ebx+0C]
 00445A34    mov         dword ptr [eax+8],edx
 00445A37    mov         eax,dword ptr [ebx+0C]
 00445A3A    test        eax,eax
>00445A3C    je          00445A44
 00445A3E    mov         edx,dword ptr [ebx+18]
 00445A41    mov         dword ptr [eax+18],edx
 00445A44    cmp         ebx,dword ptr [esi+64]
>00445A47    jne         00445A4E
 00445A49    xor         eax,eax
 00445A4B    mov         dword ptr [esi+64],eax
 00445A4E    mov         eax,ebx
 00445A50    call        TObject.Free
 00445A55    pop         esi
 00445A56    pop         ebx
 00445A57    pop         ebp
 00445A58    ret
*}
end;

//00445A5C
procedure TDockTree.RemoveControl(Control:TControl);
begin
{*
 00445A5C    push        ebx
 00445A5D    push        esi
 00445A5E    mov         esi,edx
 00445A60    mov         ebx,eax
 00445A62    mov         edx,esi
 00445A64    mov         eax,ebx
 00445A66    call        TDockTree.FindControlZone
 00445A6B    test        eax,eax
>00445A6D    je          00445A93
 00445A6F    cmp         eax,dword ptr [ebx+38]
>00445A72    jne         00445A7B
 00445A74    xor         edx,edx
 00445A76    mov         dword ptr [eax+4],edx
>00445A79    jmp         00445A84
 00445A7B    mov         edx,eax
 00445A7D    mov         eax,ebx
 00445A7F    call        TDockTree.RemoveZone
 00445A84    mov         byte ptr [esi+9C],0
 00445A8B    mov         eax,dword ptr [ebx+14]
 00445A8E    mov         edx,dword ptr [eax]
 00445A90    call        dword ptr [edx+7C]
 00445A93    pop         esi
 00445A94    pop         ebx
 00445A95    ret
*}
end;

//00445A98
procedure TDockTree.RemoveZone(Zone:TDockZone);
begin
{*
 00445A98    push        ebp
 00445A99    mov         ebp,esp
 00445A9B    xor         ecx,ecx
 00445A9D    push        ecx
 00445A9E    push        ecx
 00445A9F    push        ecx
 00445AA0    push        ecx
 00445AA1    push        ebx
 00445AA2    push        esi
 00445AA3    push        edi
 00445AA4    mov         ebx,edx
 00445AA6    mov         esi,eax
 00445AA8    xor         eax,eax
 00445AAA    push        ebp
 00445AAB    push        445D05
 00445AB0    push        dword ptr fs:[eax]
 00445AB3    mov         dword ptr fs:[eax],esp
 00445AB6    test        ebx,ebx
>00445AB8    jne         00445AF5
 00445ABA    lea         edx,[ebp-4]
 00445ABD    mov         eax,[005AE34C];^SDockTreeRemoveError:TResStringRec
 00445AC2    call        LoadStr
 00445AC7    lea         eax,[ebp-4]
 00445ACA    push        eax
 00445ACB    lea         edx,[ebp-8]
 00445ACE    mov         eax,[005AE194];^SDockZoneNotFound:TResStringRec
 00445AD3    call        LoadStr
 00445AD8    mov         edx,dword ptr [ebp-8]
 00445ADB    pop         eax
 00445ADC    call        @LStrCat
 00445AE1    mov         ecx,dword ptr [ebp-4]
 00445AE4    mov         dl,1
 00445AE6    mov         eax,[00408B30];Exception
 00445AEB    call        Exception.Create
 00445AF0    call        @RaiseExcept
 00445AF5    cmp         dword ptr [ebx+4],0
>00445AF9    jne         00445B36
 00445AFB    lea         edx,[ebp-0C]
 00445AFE    mov         eax,[005AE34C];^SDockTreeRemoveError:TResStringRec
 00445B03    call        LoadStr
 00445B08    lea         eax,[ebp-0C]
 00445B0B    push        eax
 00445B0C    lea         edx,[ebp-10]
 00445B0F    mov         eax,[005AE638];^SDockZoneHasNoCtl:TResStringRec
 00445B14    call        LoadStr
 00445B19    mov         edx,dword ptr [ebp-10]
 00445B1C    pop         eax
 00445B1D    call        @LStrCat
 00445B22    mov         ecx,dword ptr [ebp-0C]
 00445B25    mov         dl,1
 00445B27    mov         eax,[00408B30];Exception
 00445B2C    call        Exception.Create
 00445B31    call        @RaiseExcept
 00445B36    mov         eax,dword ptr [ebx+14]
 00445B39    call        TDockZone.GetChildCount
 00445B3E    cmp         eax,1
>00445B41    jne         00445B54
 00445B43    mov         eax,dword ptr [esi+64]
 00445B46    xor         edx,edx
 00445B48    mov         dword ptr [eax+8],edx
 00445B4B    mov         byte ptr [eax+10],0
>00445B4F    jmp         00445CE3
 00445B54    cmp         eax,2
>00445B57    jne         00445C8B
 00445B5D    mov         eax,dword ptr [ebx+18]
 00445B60    test        eax,eax
>00445B62    jne         00445B69
 00445B64    mov         edi,dword ptr [ebx+0C]
>00445B67    jmp         00445B6B
 00445B69    mov         edi,eax
 00445B6B    cmp         dword ptr [edi+4],0
>00445B6F    je          00445BD0
 00445B71    mov         edx,dword ptr [esi+64]
 00445B74    mov         eax,dword ptr [ebx+14]
 00445B77    cmp         edx,eax
>00445B79    jne         00445BA5
 00445B7B    mov         eax,dword ptr [esi+64]
 00445B7E    mov         dword ptr [eax+8],edi
 00445B81    xor         eax,eax
 00445B83    mov         dword ptr [edi+18],eax
 00445B86    xor         eax,eax
 00445B88    mov         dword ptr [edi+0C],eax
 00445B8B    mov         eax,dword ptr [esi+64]
 00445B8E    call        TDockZone.GetLimitSize
 00445B93    mov         edx,eax
 00445B95    mov         eax,edi
 00445B97    call        TDockZone.SetZoneLimit
 00445B9C    mov         eax,edi
 00445B9E    call        TDockZone.Update
>00445BA3    jmp         00445BBB
 00445BA5    mov         byte ptr [eax+10],0
 00445BA9    mov         edx,dword ptr [edi+4]
 00445BAC    mov         dword ptr [eax+4],edx
 00445BAF    xor         edx,edx
 00445BB1    mov         dword ptr [eax+8],edx
 00445BB4    mov         eax,edi
 00445BB6    call        TObject.Free
 00445BBB    push        esi
 00445BBC    push        4462A8;TDockTree.UpdateZone
 00445BC1    mov         edx,dword ptr [ebx+14]
 00445BC4    mov         eax,esi
 00445BC6    call        TDockTree.ForEachAt
>00445BCB    jmp         00445CE3
 00445BD0    mov         eax,dword ptr [ebx+14]
 00445BD3    cmp         eax,dword ptr [esi+64]
>00445BD6    jne         00445C13
 00445BD8    mov         edx,dword ptr [esi+68]
 00445BDB    mov         eax,edi
 00445BDD    call        TDockZone.ExpandZoneLimit
 00445BE2    mov         eax,dword ptr [esi+64]
 00445BE5    call        TDockZone.GetZoneLimit
 00445BEA    mov         dword ptr [esi+68],eax
 00445BED    mov         eax,dword ptr [esi+64]
 00445BF0    call        TObject.Free
 00445BF5    mov         dword ptr [esi+64],edi
 00445BF8    xor         eax,eax
 00445BFA    mov         dword ptr [edi+0C],eax
 00445BFD    xor         eax,eax
 00445BFF    mov         dword ptr [edi+18],eax
 00445C02    xor         eax,eax
 00445C04    mov         dword ptr [edi+14],eax
 00445C07    mov         eax,esi
 00445C09    call        TDockTree.UpdateAll
>00445C0E    jmp         00445CE3
 00445C13    mov         eax,dword ptr [ebx+14]
 00445C16    mov         eax,dword ptr [eax+18]
 00445C19    mov         edx,dword ptr [edi+8]
 00445C1C    mov         dword ptr [edx+18],eax
 00445C1F    test        eax,eax
>00445C21    jne         00445C31
 00445C23    mov         eax,dword ptr [edi+8]
 00445C26    mov         edx,dword ptr [ebx+14]
 00445C29    mov         edx,dword ptr [edx+14]
 00445C2C    mov         dword ptr [edx+8],eax
>00445C2F    jmp         00445C37
 00445C31    mov         edx,dword ptr [edi+8]
 00445C34    mov         dword ptr [eax+0C],edx
 00445C37    mov         eax,dword ptr [edi+8]
 00445C3A    mov         edx,dword ptr [ebx+14]
 00445C3D    mov         edx,dword ptr [edx+14]
 00445C40    mov         dword ptr [eax+14],edx
 00445C43    mov         eax,dword ptr [eax+0C]
 00445C46    mov         edx,dword ptr [ebx+14]
 00445C49    mov         edx,dword ptr [edx+14]
 00445C4C    mov         dword ptr [eax+14],edx
 00445C4F    cmp         dword ptr [eax+0C],0
>00445C53    jne         00445C43
 00445C55    mov         edx,dword ptr [ebx+14]
 00445C58    mov         edx,dword ptr [edx+0C]
 00445C5B    mov         dword ptr [eax+0C],edx
 00445C5E    cmp         dword ptr [eax+0C],0
>00445C62    je          00445C6A
 00445C64    mov         edx,dword ptr [eax+0C]
 00445C67    mov         dword ptr [edx+18],eax
 00445C6A    push        esi
 00445C6B    push        4462A8;TDockTree.UpdateZone
 00445C70    mov         edx,dword ptr [eax+14]
 00445C73    mov         eax,esi
 00445C75    call        TDockTree.ForEachAt
 00445C7A    mov         eax,dword ptr [ebx+14]
 00445C7D    call        TObject.Free
 00445C82    mov         eax,edi
 00445C84    call        TObject.Free
>00445C89    jmp         00445CE3
 00445C8B    mov         eax,dword ptr [ebx+18]
 00445C8E    test        eax,eax
>00445C90    jne         00445CAA
 00445C92    mov         eax,dword ptr [ebx+14]
 00445C95    mov         edx,dword ptr [ebx+0C]
 00445C98    mov         dword ptr [eax+8],edx
 00445C9B    mov         eax,dword ptr [ebx+0C]
 00445C9E    xor         edx,edx
 00445CA0    mov         dword ptr [eax+18],edx
 00445CA3    call        TDockZone.Update
>00445CA8    jmp         00445CD3
 00445CAA    mov         edx,dword ptr [ebx+0C]
 00445CAD    mov         dword ptr [eax+0C],edx
 00445CB0    mov         edx,dword ptr [ebx+0C]
 00445CB3    test        edx,edx
>00445CB5    je          00445CBA
 00445CB7    mov         dword ptr [edx+18],eax
 00445CBA    mov         eax,ebx
 00445CBC    call        TDockZone.GetZoneLimit
 00445CC1    mov         edx,eax
 00445CC3    mov         eax,dword ptr [ebx+18]
 00445CC6    call        TDockZone.ExpandZoneLimit
 00445CCB    mov         eax,dword ptr [ebx+18]
 00445CCE    call        TDockZone.Update
 00445CD3    push        esi
 00445CD4    push        4462A8;TDockTree.UpdateZone
 00445CD9    mov         edx,dword ptr [ebx+14]
 00445CDC    mov         eax,esi
 00445CDE    call        TDockTree.ForEachAt
 00445CE3    mov         eax,ebx
 00445CE5    call        TObject.Free
 00445CEA    xor         eax,eax
 00445CEC    pop         edx
 00445CED    pop         ecx
 00445CEE    pop         ecx
 00445CEF    mov         dword ptr fs:[eax],edx
 00445CF2    push        445D0C
 00445CF7    lea         eax,[ebp-10]
 00445CFA    mov         edx,4
 00445CFF    call        @LStrArrayClr
 00445D04    ret
>00445D05    jmp         @HandleFinally
>00445D0A    jmp         00445CF7
 00445D0C    pop         edi
 00445D0D    pop         esi
 00445D0E    pop         ebx
 00445D0F    mov         esp,ebp
 00445D11    pop         ebp
 00445D12    ret
*}
end;

//00445D14
procedure TDockTree.ResetBounds(Force:Boolean);
begin
{*
 00445D14    push        ebx
 00445D15    push        esi
 00445D16    push        edi
 00445D17    add         esp,0FFFFFFF0
 00445D1A    mov         ebx,edx
 00445D1C    mov         edi,eax
 00445D1E    mov         esi,dword ptr [edi+14]
 00445D21    test        byte ptr [esi+1C],1
>00445D25    jne         00445DE9
 00445D2B    cmp         dword ptr [edi+64],0
>00445D2F    je          00445DE9
 00445D35    mov         eax,esi
 00445D37    call        TWinControl.GetVisibleDockClientCount
 00445D3C    test        eax,eax
>00445D3E    jle         00445DE9
 00445D44    mov         edx,esp
 00445D46    mov         eax,dword ptr [edi+14]
 00445D49    mov         ecx,dword ptr [eax]
 00445D4B    call        dword ptr [ecx+44]
 00445D4E    mov         edx,esp
 00445D50    mov         eax,dword ptr [edi+14]
 00445D53    mov         ecx,dword ptr [eax]
 00445D55    call        dword ptr [ecx+8C]
 00445D5B    test        bl,bl
>00445D5D    jne         00445D72
 00445D5F    lea         edx,[edi+1D]
 00445D62    mov         eax,esp
 00445D64    mov         ecx,10
 00445D69    call        CompareMem
 00445D6E    test        al,al
>00445D70    jne         00445DE9
 00445D72    push        edi
 00445D73    lea         esi,[esp+4]
 00445D77    add         edi,1D
 00445D7A    movs        dword ptr [edi],dword ptr [esi]
 00445D7B    movs        dword ptr [edi],dword ptr [esi]
 00445D7C    movs        dword ptr [edi],dword ptr [esi]
 00445D7D    movs        dword ptr [edi],dword ptr [esi]
 00445D7E    pop         edi
 00445D7F    mov         eax,dword ptr [edi+64]
 00445D82    mov         dl,byte ptr [eax+10]
 00445D85    dec         dl
>00445D87    je          00445D8F
 00445D89    dec         dl
>00445D8B    je          00445DA8
>00445D8D    jmp         00445DBF
 00445D8F    mov         edx,dword ptr [esp+8]
 00445D93    sub         edx,dword ptr [esp]
 00445D96    call        TDockZone.SetZoneLimit
 00445D9B    mov         eax,dword ptr [esp+0C]
 00445D9F    sub         eax,dword ptr [esp+4]
 00445DA3    mov         dword ptr [edi+68],eax
>00445DA6    jmp         00445DBF
 00445DA8    mov         edx,dword ptr [esp+0C]
 00445DAC    sub         edx,dword ptr [esp+4]
 00445DB0    call        TDockZone.SetZoneLimit
 00445DB5    mov         eax,dword ptr [esp+8]
 00445DB9    sub         eax,dword ptr [esp]
 00445DBC    mov         dword ptr [edi+68],eax
 00445DBF    mov         eax,dword ptr [edi+14]
 00445DC2    call        TWinControl.GetDockClientCount
 00445DC7    test        eax,eax
>00445DC9    jle         00445DE9
 00445DCB    xor         edx,edx
 00445DCD    mov         eax,edi
 00445DCF    call        TDockTree.SetNewBounds
 00445DD4    cmp         dword ptr [edi+6C],0
>00445DD8    jne         00445DE9
 00445DDA    push        edi
 00445DDB    push        4462A8;TDockTree.UpdateZone
 00445DE0    xor         edx,edx
 00445DE2    mov         eax,edi
 00445DE4    call        TDockTree.ForEachAt
 00445DE9    add         esp,10
 00445DEC    pop         edi
 00445DED    pop         esi
 00445DEE    pop         ebx
 00445DEF    ret
*}
end;

//00445DF0
procedure TDockTree.ScaleZone(Zone:TDockZone);
begin
{*
 00445DF0    push        ebx
 00445DF1    push        esi
 00445DF2    push        ecx
 00445DF3    mov         ebx,edx
 00445DF5    mov         esi,eax
 00445DF7    test        ebx,ebx
>00445DF9    je          00445E28
 00445DFB    test        ebx,ebx
>00445DFD    je          00445E28
 00445DFF    mov         eax,dword ptr [ebx+14]
 00445E02    mov         al,byte ptr [eax+10]
 00445E05    cmp         al,byte ptr [esi+48]
>00445E08    jne         00445E28
 00445E0A    mov         eax,ebx
 00445E0C    call        TDockZone.GetZoneLimit
 00445E11    mov         dword ptr [esp],eax
 00445E14    fild        dword ptr [esp]
 00445E17    fmul        qword ptr [esi+40]
 00445E1A    call        @ROUND
 00445E1F    mov         edx,eax
 00445E21    mov         eax,ebx
 00445E23    call        TDockZone.SetZoneLimit
 00445E28    pop         edx
 00445E29    pop         esi
 00445E2A    pop         ebx
 00445E2B    ret
*}
end;

//00445E2C
procedure WriteControlName(ControlName:AnsiString);
begin
{*
 00445E2C    push        ebp
 00445E2D    mov         ebp,esp
 00445E2F    add         esp,0FFFFFFF8
 00445E32    push        ebx
 00445E33    mov         dword ptr [ebp-4],eax
 00445E36    mov         eax,dword ptr [ebp-4]
 00445E39    call        @LStrAddRef
 00445E3E    xor         eax,eax
 00445E40    push        ebp
 00445E41    push        445E97
 00445E46    push        dword ptr fs:[eax]
 00445E49    mov         dword ptr fs:[eax],esp
 00445E4C    mov         eax,dword ptr [ebp-4]
 00445E4F    call        @LStrLen
 00445E54    mov         dword ptr [ebp-8],eax
 00445E57    lea         edx,[ebp-8]
 00445E5A    mov         eax,dword ptr [ebp+8]
 00445E5D    mov         eax,dword ptr [eax-4]
 00445E60    mov         ecx,4
 00445E65    mov         ebx,dword ptr [eax]
 00445E67    call        dword ptr [ebx+10]
 00445E6A    cmp         dword ptr [ebp-8],0
>00445E6E    jle         00445E81
 00445E70    mov         edx,dword ptr [ebp-4]
 00445E73    mov         eax,dword ptr [ebp+8]
 00445E76    mov         eax,dword ptr [eax-4]
 00445E79    mov         ecx,dword ptr [ebp-8]
 00445E7C    mov         ebx,dword ptr [eax]
 00445E7E    call        dword ptr [ebx+10]
 00445E81    xor         eax,eax
 00445E83    pop         edx
 00445E84    pop         ecx
 00445E85    pop         ecx
 00445E86    mov         dword ptr fs:[eax],edx
 00445E89    push        445E9E
 00445E8E    lea         eax,[ebp-4]
 00445E91    call        @LStrClr
 00445E96    ret
>00445E97    jmp         @HandleFinally
>00445E9C    jmp         00445E8E
 00445E9E    pop         ebx
 00445E9F    pop         ecx
 00445EA0    pop         ecx
 00445EA1    pop         ebp
 00445EA2    ret
*}
end;

//00445EA4
procedure DoSaveZone(Zone:TDockZone; Level:Integer);
begin
{*
 00445EA4    push        ebp
 00445EA5    mov         ebp,esp
 00445EA7    add         esp,0FFFFFFF8
 00445EAA    push        ebx
 00445EAB    push        esi
 00445EAC    xor         ecx,ecx
 00445EAE    mov         dword ptr [ebp-8],ecx
 00445EB1    mov         dword ptr [ebp-4],edx
 00445EB4    mov         ebx,eax
 00445EB6    xor         eax,eax
 00445EB8    push        ebp
 00445EB9    push        445F53
 00445EBE    push        dword ptr fs:[eax]
 00445EC1    mov         dword ptr fs:[eax],esp
 00445EC4    lea         edx,[ebp-4]
 00445EC7    mov         eax,dword ptr [ebp+8]
 00445ECA    mov         eax,dword ptr [eax-4]
 00445ECD    mov         ecx,4
 00445ED2    mov         esi,dword ptr [eax]
 00445ED4    call        dword ptr [esi+10]
 00445ED7    lea         edx,[ebx+10]
 00445EDA    mov         eax,dword ptr [ebp+8]
 00445EDD    mov         eax,dword ptr [eax-4]
 00445EE0    mov         ecx,1
 00445EE5    mov         esi,dword ptr [eax]
 00445EE7    call        dword ptr [esi+10]
 00445EEA    lea         edx,[ebx+20]
 00445EED    mov         eax,dword ptr [ebp+8]
 00445EF0    mov         eax,dword ptr [eax-4]
 00445EF3    mov         ecx,4
 00445EF8    mov         esi,dword ptr [eax]
 00445EFA    call        dword ptr [esi+10]
 00445EFD    mov         eax,dword ptr [ebp+8]
 00445F00    push        eax
 00445F01    lea         edx,[ebp-8]
 00445F04    mov         eax,ebx
 00445F06    call        TDockZone.GetControlName
 00445F0B    mov         eax,dword ptr [ebp-8]
 00445F0E    call        WriteControlName
 00445F13    pop         ecx
 00445F14    mov         eax,dword ptr [ebx+8]
 00445F17    test        eax,eax
>00445F19    je          00445F29
 00445F1B    mov         edx,dword ptr [ebp+8]
 00445F1E    push        edx
 00445F1F    mov         edx,dword ptr [ebp-4]
 00445F22    inc         edx
 00445F23    call        DoSaveZone
 00445F28    pop         ecx
 00445F29    mov         eax,dword ptr [ebx+0C]
 00445F2C    test        eax,eax
>00445F2E    je          00445F3D
 00445F30    mov         edx,dword ptr [ebp+8]
 00445F33    push        edx
 00445F34    mov         edx,dword ptr [ebp-4]
 00445F37    call        DoSaveZone
 00445F3C    pop         ecx
 00445F3D    xor         eax,eax
 00445F3F    pop         edx
 00445F40    pop         ecx
 00445F41    pop         ecx
 00445F42    mov         dword ptr fs:[eax],edx
 00445F45    push        445F5A
 00445F4A    lea         eax,[ebp-8]
 00445F4D    call        @LStrClr
 00445F52    ret
>00445F53    jmp         @HandleFinally
>00445F58    jmp         00445F4A
 00445F5A    pop         esi
 00445F5B    pop         ebx
 00445F5C    pop         ecx
 00445F5D    pop         ecx
 00445F5E    pop         ebp
 00445F5F    ret
*}
end;

//00445F60
procedure TDockTree.SaveToStream(Stream:TStream);
begin
{*
 00445F60    push        ebp
 00445F61    mov         ebp,esp
 00445F63    add         esp,0FFFFFFEC
 00445F66    push        ebx
 00445F67    push        esi
 00445F68    push        edi
 00445F69    xor         ecx,ecx
 00445F6B    mov         dword ptr [ebp-14],ecx
 00445F6E    mov         dword ptr [ebp-4],edx
 00445F71    mov         dword ptr [ebp-8],eax
 00445F74    xor         eax,eax
 00445F76    push        ebp
 00445F77    push        446099
 00445F7C    push        dword ptr fs:[eax]
 00445F7F    mov         dword ptr fs:[eax],esp
 00445F82    mov         eax,dword ptr [ebp-8]
 00445F85    lea         edx,[eax+70]
 00445F88    mov         ecx,4
 00445F8D    mov         eax,dword ptr [ebp-4]
 00445F90    mov         ebx,dword ptr [eax]
 00445F92    call        dword ptr [ebx+10]
 00445F95    mov         dl,1
 00445F97    mov         eax,[00418350];TStringList
 00445F9C    call        TObject.Create
 00445FA1    mov         dword ptr [ebp-10],eax
 00445FA4    xor         eax,eax
 00445FA6    push        ebp
 00445FA7    push        446048
 00445FAC    push        dword ptr fs:[eax]
 00445FAF    mov         dword ptr fs:[eax],esp
 00445FB2    mov         eax,dword ptr [ebp-8]
 00445FB5    mov         eax,dword ptr [eax+14]
 00445FB8    call        TWinControl.GetDockClientCount
 00445FBD    mov         ebx,eax
 00445FBF    dec         ebx
 00445FC0    test        ebx,ebx
>00445FC2    jl          00445FF1
 00445FC4    inc         ebx
 00445FC5    xor         esi,esi
 00445FC7    mov         eax,dword ptr [ebp-8]
 00445FCA    mov         eax,dword ptr [eax+14]
 00445FCD    mov         edx,esi
 00445FCF    call        TWinControl.GetDockClients
 00445FD4    mov         edi,eax
 00445FD6    cmp         byte ptr [edi+57],0
>00445FDA    jne         00445FED
 00445FDC    cmp         dword ptr [edi+8],0
>00445FE0    je          00445FED
 00445FE2    mov         edx,dword ptr [edi+8]
 00445FE5    mov         eax,dword ptr [ebp-10]
 00445FE8    mov         ecx,dword ptr [eax]
 00445FEA    call        dword ptr [ecx+38]
 00445FED    inc         esi
 00445FEE    dec         ebx
>00445FEF    jne         00445FC7
 00445FF1    mov         eax,dword ptr [ebp-10]
 00445FF4    mov         edx,dword ptr [eax]
 00445FF6    call        dword ptr [edx+14]
 00445FF9    mov         dword ptr [ebp-0C],eax
 00445FFC    lea         edx,[ebp-0C]
 00445FFF    mov         ecx,4
 00446004    mov         eax,dword ptr [ebp-4]
 00446007    mov         ebx,dword ptr [eax]
 00446009    call        dword ptr [ebx+10]
 0044600C    mov         ebx,dword ptr [ebp-0C]
 0044600F    dec         ebx
 00446010    test        ebx,ebx
>00446012    jl          00446032
 00446014    inc         ebx
 00446015    xor         esi,esi
 00446017    push        ebp
 00446018    lea         ecx,[ebp-14]
 0044601B    mov         edx,esi
 0044601D    mov         eax,dword ptr [ebp-10]
 00446020    mov         edi,dword ptr [eax]
 00446022    call        dword ptr [edi+0C]
 00446025    mov         eax,dword ptr [ebp-14]
 00446028    call        WriteControlName
 0044602D    pop         ecx
 0044602E    inc         esi
 0044602F    dec         ebx
>00446030    jne         00446017
 00446032    xor         eax,eax
 00446034    pop         edx
 00446035    pop         ecx
 00446036    pop         ecx
 00446037    mov         dword ptr fs:[eax],edx
 0044603A    push        44604F
 0044603F    mov         eax,dword ptr [ebp-10]
 00446042    call        TObject.Free
 00446047    ret
>00446048    jmp         @HandleFinally
>0044604D    jmp         0044603F
 0044604F    mov         eax,dword ptr [ebp-8]
 00446052    lea         edx,[eax+68]
 00446055    mov         ecx,4
 0044605A    mov         eax,dword ptr [ebp-4]
 0044605D    mov         ebx,dword ptr [eax]
 0044605F    call        dword ptr [ebx+10]
 00446062    push        ebp
 00446063    mov         eax,dword ptr [ebp-8]
 00446066    mov         eax,dword ptr [eax+64]
 00446069    xor         edx,edx
 0044606B    call        DoSaveZone
 00446070    pop         ecx
 00446071    mov         edx,5ACC88
 00446076    mov         ecx,4
 0044607B    mov         eax,dword ptr [ebp-4]
 0044607E    mov         ebx,dword ptr [eax]
 00446080    call        dword ptr [ebx+10]
 00446083    xor         eax,eax
 00446085    pop         edx
 00446086    pop         ecx
 00446087    pop         ecx
 00446088    mov         dword ptr fs:[eax],edx
 0044608B    push        4460A0
 00446090    lea         eax,[ebp-14]
 00446093    call        @LStrClr
 00446098    ret
>00446099    jmp         @HandleFinally
>0044609E    jmp         00446090
 004460A0    pop         edi
 004460A1    pop         esi
 004460A2    pop         ebx
 004460A3    mov         esp,ebp
 004460A5    pop         ebp
 004460A6    ret
*}
end;

//004460A8
procedure DoSetNewBounds(Zone:TDockZone);
begin
{*
 004460A8    push        ebp
 004460A9    mov         ebp,esp
 004460AB    push        ebx
 004460AC    push        esi
 004460AD    mov         ebx,eax
 004460AF    test        ebx,ebx
>004460B1    je          00446129
 004460B3    mov         eax,ebx
 004460B5    call        TDockZone.NextVisible
 004460BA    test        eax,eax
>004460BC    jne         00446107
 004460BE    mov         eax,dword ptr [ebp+8]
 004460C1    mov         eax,dword ptr [eax-4]
 004460C4    cmp         ebx,dword ptr [eax+64]
>004460C7    je          00446107
 004460C9    mov         eax,ebx
 004460CB    call        TDockZone.GetVisible
 004460D0    test        al,al
>004460D2    je          00446107
 004460D4    mov         eax,dword ptr [ebp+8]
 004460D7    mov         eax,dword ptr [eax-4]
 004460DA    mov         eax,dword ptr [eax+64]
 004460DD    mov         esi,dword ptr [ebx+14]
 004460E0    cmp         eax,esi
>004460E2    jne         004460F6
 004460E4    mov         eax,dword ptr [ebp+8]
 004460E7    mov         eax,dword ptr [eax-4]
 004460EA    mov         edx,dword ptr [eax+68]
 004460ED    mov         eax,ebx
 004460EF    call        TDockZone.SetZoneLimit
>004460F4    jmp         00446107
 004460F6    mov         eax,dword ptr [esi+14]
 004460F9    call        TDockZone.GetZoneLimit
 004460FE    mov         edx,eax
 00446100    mov         eax,ebx
 00446102    call        TDockZone.SetZoneLimit
 00446107    mov         eax,dword ptr [ebp+8]
 0044610A    push        eax
 0044610B    mov         eax,ebx
 0044610D    call        TDockZone.FirstVisibleChild
 00446112    call        DoSetNewBounds
 00446117    pop         ecx
 00446118    mov         eax,dword ptr [ebp+8]
 0044611B    push        eax
 0044611C    mov         eax,ebx
 0044611E    call        TDockZone.NextVisible
 00446123    call        DoSetNewBounds
 00446128    pop         ecx
 00446129    pop         esi
 0044612A    pop         ebx
 0044612B    pop         ebp
 0044612C    ret
*}
end;

//00446130
procedure TDockTree.SetNewBounds(Zone:TDockZone);
begin
{*
 00446130    push        ebp
 00446131    mov         ebp,esp
 00446133    push        ecx
 00446134    mov         dword ptr [ebp-4],eax
 00446137    test        edx,edx
>00446139    jne         00446144
 0044613B    mov         eax,dword ptr [ebp-4]
 0044613E    mov         eax,dword ptr [eax+64]
 00446141    mov         edx,dword ptr [eax+8]
 00446144    push        ebp
 00446145    mov         eax,edx
 00446147    call        DoSetNewBounds
 0044614C    pop         ecx
 0044614D    mov         eax,dword ptr [ebp-4]
 00446150    mov         eax,dword ptr [eax+14]
 00446153    mov         edx,dword ptr [eax]
 00446155    call        dword ptr [edx+7C]
 00446158    pop         ecx
 00446159    pop         ebp
 0044615A    ret
*}
end;

//0044615C
procedure TDockTree.SetReplacingControl(Control:TControl);
begin
{*
 0044615C    push        ebx
 0044615D    push        esi
 0044615E    mov         esi,edx
 00446160    mov         ebx,eax
 00446162    mov         edx,esi
 00446164    mov         eax,ebx
 00446166    call        TDockTree.FindControlZone
 0044616B    mov         dword ptr [ebx+38],eax
 0044616E    pop         esi
 0044616F    pop         ebx
 00446170    ret
*}
end;

//00446174
procedure TDockTree.ShiftZone(Zone:TDockZone);
begin
{*
 00446174    push        ebx
 00446175    push        esi
 00446176    mov         ebx,edx
 00446178    mov         esi,eax
 0044617A    test        ebx,ebx
>0044617C    je          004461A1
 0044617E    cmp         ebx,dword ptr [esi+64]
>00446181    je          004461A1
 00446183    mov         eax,dword ptr [ebx+14]
 00446186    mov         al,byte ptr [eax+10]
 00446189    cmp         al,byte ptr [esi+48]
>0044618C    jne         004461A1
 0044618E    mov         eax,ebx
 00446190    call        TDockZone.GetZoneLimit
 00446195    mov         edx,eax
 00446197    add         edx,dword ptr [esi+4C]
 0044619A    mov         eax,ebx
 0044619C    call        TDockZone.SetZoneLimit
 004461A1    pop         esi
 004461A2    pop         ebx
 004461A3    ret
*}
end;

//004461A4
procedure TDockTree.SplitterMouseDown(OnZone:TDockZone; MousePos:TPoint);
begin
{*
 004461A4    push        ebx
 004461A5    push        esi
 004461A6    push        edi
 004461A7    add         esp,0FFFFFFF8
 004461AA    mov         esi,ecx
 004461AC    lea         edi,[esp]
 004461AF    movs        dword ptr [edi],dword ptr [esi]
 004461B0    movs        dword ptr [edi],dword ptr [esi]
 004461B1    mov         ebx,eax
 004461B3    mov         dword ptr [ebx+60],edx
 004461B6    mov         eax,dword ptr [ebx+14]
 004461B9    call        TWinControl.GetHandle
 004461BE    mov         edx,eax
 004461C0    mov         eax,[005E0C0C];Mouse:TMouse
 004461C5    call        TMouse.SetCapture
 004461CA    mov         eax,dword ptr [ebx+14]
 004461CD    call        TWinControl.GetHandle
 004461D2    mov         esi,eax
 004461D4    mov         dword ptr [ebx+5C],esi
 004461D7    push        412
 004461DC    push        0
 004461DE    push        esi
 004461DF    call        user32.GetDCEx
 004461E4    mov         dword ptr [ebx+58],eax
 004461E7    mov         eax,dword ptr [esp]
 004461EA    mov         dword ptr [ebx+50],eax
 004461ED    mov         eax,dword ptr [esp+4]
 004461F1    mov         dword ptr [ebx+54],eax
 004461F4    mov         eax,ebx
 004461F6    call        TDockTree.DrawSizeSplitter
 004461FB    pop         ecx
 004461FC    pop         edx
 004461FD    pop         edi
 004461FE    pop         esi
 004461FF    pop         ebx
 00446200    ret
*}
end;

//00446204
procedure TDockTree.SplitterMouseUp;
begin
{*
 00446204    push        ebx
 00446205    mov         ebx,eax
 00446207    xor         edx,edx
 00446209    mov         eax,[005E0C0C];Mouse:TMouse
 0044620E    call        TMouse.SetCapture
 00446213    mov         eax,ebx
 00446215    call        TDockTree.DrawSizeSplitter
 0044621A    mov         eax,dword ptr [ebx+58]
 0044621D    push        eax
 0044621E    mov         eax,dword ptr [ebx+5C]
 00446221    push        eax
 00446222    call        user32.ReleaseDC
 00446227    mov         eax,dword ptr [ebx+60]
 0044622A    mov         edx,dword ptr [eax+14]
 0044622D    cmp         byte ptr [edx+10],1
>00446231    jne         00446247
 00446233    mov         edx,dword ptr [ebx+0C]
 00446236    sar         edx,1
>00446238    jns         0044623D
 0044623A    adc         edx,0
 0044623D    add         edx,dword ptr [ebx+54]
 00446240    call        TDockZone.SetZoneLimit
>00446245    jmp         00446259
 00446247    mov         edx,dword ptr [ebx+0C]
 0044624A    sar         edx,1
>0044624C    jns         00446251
 0044624E    adc         edx,0
 00446251    add         edx,dword ptr [ebx+50]
 00446254    call        TDockZone.SetZoneLimit
 00446259    mov         eax,dword ptr [ebx+60]
 0044625C    mov         edx,dword ptr [eax+14]
 0044625F    mov         eax,ebx
 00446261    call        TDockTree.SetNewBounds
 00446266    push        ebx
 00446267    push        4462A8;TDockTree.UpdateZone
 0044626C    mov         eax,dword ptr [ebx+60]
 0044626F    mov         edx,dword ptr [eax+14]
 00446272    mov         eax,ebx
 00446274    call        TDockTree.ForEachAt
 00446279    xor         eax,eax
 0044627B    mov         dword ptr [ebx+60],eax
 0044627E    pop         ebx
 0044627F    ret
*}
end;

//00446280
procedure TDockTree.UpdateAll;
begin
{*
 00446280    push        ebx
 00446281    mov         ebx,eax
 00446283    cmp         dword ptr [ebx+6C],0
>00446287    jne         004462A4
 00446289    mov         eax,dword ptr [ebx+14]
 0044628C    call        TWinControl.GetDockClientCount
 00446291    test        eax,eax
>00446293    jle         004462A4
 00446295    push        ebx
 00446296    push        4462A8;TDockTree.UpdateZone
 0044629B    xor         edx,edx
 0044629D    mov         eax,ebx
 0044629F    call        TDockTree.ForEachAt
 004462A4    pop         ebx
 004462A5    ret
*}
end;

//004462A8
procedure TDockTree.UpdateZone(Zone:TDockZone);
begin
{*
 004462A8    cmp         dword ptr [eax+6C],0
>004462AC    jne         004462B5
 004462AE    mov         eax,edx
 004462B0    call        TDockZone.Update
 004462B5    ret
*}
end;

//004462B8
procedure TDockTree.DrawSizeSplitter;
begin
{*
 004462B8    push        ebx
 004462B9    push        esi
 004462BA    add         esp,0FFFFFFF0
 004462BD    mov         ebx,eax
 004462BF    mov         esi,dword ptr [ebx+60]
 004462C2    test        esi,esi
>004462C4    je          0044639B
 004462CA    mov         eax,dword ptr [esi+14]
 004462CD    cmp         byte ptr [eax+10],1
>004462D1    jne         00446316
 004462D3    mov         edx,2
 004462D8    mov         eax,esi
 004462DA    call        TDockZone.GetTopLeft
 004462DF    mov         dword ptr [esp],eax
 004462E2    mov         eax,dword ptr [ebx+0C]
 004462E5    sar         eax,1
>004462E7    jns         004462EC
 004462E9    adc         eax,0
 004462EC    mov         edx,dword ptr [ebx+54]
 004462EF    sub         edx,eax
 004462F1    mov         dword ptr [esp+4],edx
 004462F5    mov         edx,2
 004462FA    mov         eax,dword ptr [ebx+60]
 004462FD    call        TDockZone.GetHeightWidth
 00446302    add         eax,dword ptr [esp]
 00446305    mov         dword ptr [esp+8],eax
 00446309    mov         eax,dword ptr [esp+4]
 0044630D    add         eax,dword ptr [ebx+0C]
 00446310    mov         dword ptr [esp+0C],eax
>00446314    jmp         00446357
 00446316    mov         eax,dword ptr [ebx+0C]
 00446319    sar         eax,1
>0044631B    jns         00446320
 0044631D    adc         eax,0
 00446320    mov         edx,dword ptr [ebx+50]
 00446323    sub         edx,eax
 00446325    mov         dword ptr [esp],edx
 00446328    mov         edx,1
 0044632D    mov         eax,esi
 0044632F    call        TDockZone.GetTopLeft
 00446334    mov         dword ptr [esp+4],eax
 00446338    mov         eax,dword ptr [esp]
 0044633B    add         eax,dword ptr [ebx+0C]
 0044633E    mov         dword ptr [esp+8],eax
 00446342    mov         edx,1
 00446347    mov         eax,dword ptr [ebx+60]
 0044634A    call        TDockZone.GetHeightWidth
 0044634F    add         eax,dword ptr [esp+4]
 00446353    mov         dword ptr [esp+0C],eax
 00446357    mov         eax,dword ptr [ebx+10]
 0044635A    call        TBrush.GetHandle
 0044635F    push        eax
 00446360    mov         eax,dword ptr [ebx+58]
 00446363    push        eax
 00446364    call        gdi32.SelectObject
 00446369    mov         esi,eax
 0044636B    push        5A0049
 00446370    mov         ecx,dword ptr [esp+10]
 00446374    mov         edx,dword ptr [esp+8]
 00446378    sub         ecx,edx
 0044637A    push        ecx
 0044637B    mov         ecx,dword ptr [esp+10]
 0044637F    mov         eax,dword ptr [esp+8]
 00446383    sub         ecx,eax
 00446385    push        ecx
 00446386    push        edx
 00446387    push        eax
 00446388    mov         eax,dword ptr [ebx+58]
 0044638B    push        eax
 0044638C    call        gdi32.PatBlt
 00446391    push        esi
 00446392    mov         eax,dword ptr [ebx+58]
 00446395    push        eax
 00446396    call        gdi32.SelectObject
 0044639B    add         esp,10
 0044639E    pop         esi
 0044639F    pop         ebx
 004463A0    ret
*}
end;

//004463A4
procedure DoGetNextLimit(Zone:TDockZone);
begin
{*
 004463A4    push        ebp
 004463A5    mov         ebp,esp
 004463A7    push        ebx
 004463A8    push        esi
 004463A9    push        edi
 004463AA    mov         ebx,eax
 004463AC    mov         eax,dword ptr [ebp+8]
 004463AF    cmp         ebx,dword ptr [eax-4]
>004463B2    je          0044640D
 004463B4    mov         eax,dword ptr [ebx+14]
 004463B7    mov         al,byte ptr [eax+10]
 004463BA    mov         edx,dword ptr [ebp+8]
 004463BD    mov         edx,dword ptr [edx-4]
 004463C0    mov         edx,dword ptr [edx+14]
 004463C3    cmp         al,byte ptr [edx+10]
>004463C6    jne         0044640D
 004463C8    mov         eax,ebx
 004463CA    call        TDockZone.GetZoneLimit
 004463CF    mov         edi,eax
 004463D1    mov         eax,dword ptr [ebp+8]
 004463D4    mov         eax,dword ptr [eax-4]
 004463D7    call        TDockZone.GetZoneLimit
 004463DC    cmp         edi,eax
>004463DE    jle         0044640D
 004463E0    cmp         dword ptr [ebx+4],0
>004463E4    je          004463F3
 004463E6    mov         esi,dword ptr [ebx+4]
 004463E9    test        esi,esi
>004463EB    je          0044640D
 004463ED    cmp         byte ptr [esi+57],0
>004463F1    je          0044640D
 004463F3    mov         eax,ebx
 004463F5    call        TDockZone.GetZoneLimit
 004463FA    mov         edx,eax
 004463FC    mov         eax,dword ptr [ebp+8]
 004463FF    mov         eax,dword ptr [eax-8]
 00446402    call        Min
 00446407    mov         edx,dword ptr [ebp+8]
 0044640A    mov         dword ptr [edx-8],eax
 0044640D    mov         eax,dword ptr [ebx+0C]
 00446410    test        eax,eax
>00446412    je          0044641E
 00446414    mov         edx,dword ptr [ebp+8]
 00446417    push        edx
 00446418    call        DoGetNextLimit
 0044641D    pop         ecx
 0044641E    mov         eax,dword ptr [ebx+8]
 00446421    test        eax,eax
>00446423    je          0044642F
 00446425    mov         edx,dword ptr [ebp+8]
 00446428    push        edx
 00446429    call        DoGetNextLimit
 0044642E    pop         ecx
 0044642F    pop         edi
 00446430    pop         esi
 00446431    pop         ebx
 00446432    pop         ebp
 00446433    ret
*}
end;

//00446434
function TDockTree.GetNextLimit(AZone:TDockZone):Integer;
begin
{*
 00446434    push        ebp
 00446435    mov         ebp,esp
 00446437    add         esp,0FFFFFFF8
 0044643A    push        ebx
 0044643B    push        esi
 0044643C    mov         dword ptr [ebp-4],edx
 0044643F    mov         ebx,eax
 00446441    mov         eax,dword ptr [ebp-4]
 00446444    mov         esi,dword ptr [eax+0C]
 00446447    test        esi,esi
>00446449    je          00446457
 0044644B    mov         eax,esi
 0044644D    call        TDockZone.GetZoneLimit
 00446452    mov         dword ptr [ebp-8],eax
>00446455    jmp         0044646E
 00446457    mov         eax,dword ptr [ebp-4]
 0044645A    call        TDockZone.GetZoneLimit
 0044645F    mov         esi,eax
 00446461    mov         eax,dword ptr [ebp-4]
 00446464    call        TDockZone.GetLimitSize
 00446469    add         esi,eax
 0044646B    mov         dword ptr [ebp-8],esi
 0044646E    push        ebp
 0044646F    mov         eax,dword ptr [ebx+64]
 00446472    mov         eax,dword ptr [eax+8]
 00446475    call        DoGetNextLimit
 0044647A    pop         ecx
 0044647B    mov         eax,dword ptr [ebp-8]
 0044647E    pop         esi
 0044647F    pop         ebx
 00446480    pop         ecx
 00446481    pop         ecx
 00446482    pop         ebp
 00446483    ret
*}
end;

//00446484
function GetDockAlign(Client:TControl; DropCtl:TControl):TAlign;
begin
{*
 00446484    push        ebp
 00446485    mov         ebp,esp
 00446487    add         esp,0FFFFFFE0
 0044648A    push        ebx
 0044648B    push        esi
 0044648C    push        edi
 0044648D    mov         esi,edx
 0044648F    mov         edi,eax
 00446491    mov         bl,4
 00446493    test        esi,esi
>00446495    je          004464F7
 00446497    lea         edx,[ebp-10]
 0044649A    mov         eax,edi
 0044649C    call        TControl.GetBoundsRect
 004464A1    lea         edx,[ebp-20]
 004464A4    mov         eax,esi
 004464A6    call        TControl.GetBoundsRect
 004464AB    mov         eax,dword ptr [ebp-0C]
 004464AE    cmp         eax,dword ptr [ebp-1C]
>004464B1    jg          004464C7
 004464B3    mov         eax,dword ptr [ebp-4]
 004464B6    cmp         eax,dword ptr [ebp-14]
>004464B9    jge         004464C7
 004464BB    mov         eax,dword ptr [ebp-8]
 004464BE    cmp         eax,dword ptr [ebp-18]
>004464C1    jl          004464C7
 004464C3    mov         bl,1
>004464C5    jmp         004464F7
 004464C7    mov         eax,dword ptr [ebp-10]
 004464CA    cmp         eax,dword ptr [ebp-20]
>004464CD    jg          004464E3
 004464CF    mov         eax,dword ptr [ebp-8]
 004464D2    cmp         eax,dword ptr [ebp-18]
>004464D5    jge         004464E3
 004464D7    mov         eax,dword ptr [ebp-4]
 004464DA    cmp         eax,dword ptr [ebp-14]
>004464DD    jl          004464E3
 004464DF    mov         bl,3
>004464E1    jmp         004464F7
 004464E3    mov         eax,dword ptr [ebp-1C]
 004464E6    add         eax,dword ptr [ebp-14]
 004464E9    sar         eax,1
>004464EB    jns         004464F0
 004464ED    adc         eax,0
 004464F0    cmp         eax,dword ptr [ebp-0C]
>004464F3    jg          004464F7
 004464F5    mov         bl,2
 004464F7    mov         eax,ebx
 004464F9    pop         edi
 004464FA    pop         esi
 004464FB    pop         ebx
 004464FC    mov         esp,ebp
 004464FE    pop         ebp
 004464FF    ret
*}
end;

//00446500
procedure HideZone(const Zone:TDockZone);
begin
{*
 00446500    push        ebp
 00446501    mov         ebp,esp
 00446503    push        ebx
 00446504    push        esi
 00446505    mov         ebx,eax
 00446507    mov         eax,ebx
 00446509    call        IsOrientationSet
 0044650E    test        al,al
>00446510    je          00446523
 00446512    mov         eax,ebx
 00446514    call        TDockZone.GetLimitBegin
 00446519    mov         edx,dword ptr [ebx+20]
 0044651C    sub         edx,eax
 0044651E    mov         dword ptr [ebx+24],edx
>00446521    jmp         00446528
 00446523    xor         eax,eax
 00446525    mov         dword ptr [ebx+24],eax
 00446528    mov         esi,dword ptr [ebx+14]
 0044652B    test        esi,esi
>0044652D    je          00446547
 0044652F    mov         eax,esi
 00446531    call        TDockZone.GetVisible
 00446536    test        al,al
>00446538    jne         00446547
 0044653A    mov         eax,dword ptr [ebp+8]
 0044653D    push        eax
 0044653E    mov         eax,dword ptr [ebx+14]
 00446541    call        HideZone
 00446546    pop         ecx
 00446547    mov         eax,ebx
 00446549    call        TDockZone.PrevVisible
 0044654E    test        eax,eax
>00446550    je          00446561
 00446552    mov         eax,ebx
 00446554    call        TDockZone.PrevVisible
 00446559    mov         edx,dword ptr [ebx+20]
 0044655C    call        TDockZone.ExpandZoneLimit
 00446561    mov         eax,dword ptr [ebp+8]
 00446564    mov         eax,dword ptr [eax-4]
 00446567    push        eax
 00446568    push        4462A8;TDockTree.UpdateZone
 0044656D    mov         eax,dword ptr [ebp+8]
 00446570    mov         eax,dword ptr [eax-4]
 00446573    mov         edx,dword ptr [ebx+14]
 00446576    call        TDockTree.ForEachAt
 0044657B    pop         esi
 0044657C    pop         ebx
 0044657D    pop         ebp
 0044657E    ret
*}
end;

//00446580
procedure ShowZone(const Zone:TDockZone);
begin
{*
 00446580    push        ebp
 00446581    mov         ebp,esp
 00446583    push        ecx
 00446584    push        ebx
 00446585    push        esi
 00446586    push        edi
 00446587    mov         edi,eax
 00446589    mov         esi,dword ptr [edi+14]
 0044658C    test        esi,esi
>0044658E    je          004465B2
 00446590    mov         eax,dword ptr [ebp+8]
 00446593    mov         eax,dword ptr [eax-4]
 00446596    cmp         esi,dword ptr [eax+64]
>00446599    je          004465B2
 0044659B    mov         eax,esi
 0044659D    call        TDockZone.GetVisibleChildCount
 004465A2    dec         eax
>004465A3    jne         004465B2
 004465A5    mov         eax,dword ptr [ebp+8]
 004465A8    push        eax
 004465A9    mov         eax,dword ptr [edi+14]
 004465AC    call        ShowZone
 004465B1    pop         ecx
 004465B2    mov         eax,dword ptr [edi+14]
 004465B5    call        TDockZone.GetVisibleChildCount
 004465BA    dec         eax
>004465BB    je          004465C3
 004465BD    cmp         dword ptr [edi+24],0
>004465C1    jne         004465CA
 004465C3    mov         bl,1
>004465C5    jmp         0044668C
 004465CA    xor         ebx,ebx
 004465CC    mov         eax,dword ptr [ebp+8]
 004465CF    mov         eax,dword ptr [eax-4]
 004465D2    mov         eax,dword ptr [eax+18]
 004465D5    mov         edx,dword ptr [ebp+8]
 004465D8    mov         edx,dword ptr [edx-4]
 004465DB    add         eax,dword ptr [edx+0C]
 004465DE    add         eax,0E
 004465E1    mov         dword ptr [ebp-4],eax
 004465E4    mov         eax,edi
 004465E6    call        TDockZone.PrevVisible
 004465EB    test        eax,eax
>004465ED    je          0044664A
 004465EF    mov         eax,edi
 004465F1    call        TDockZone.PrevVisible
 004465F6    mov         esi,eax
 004465F8    mov         eax,esi
 004465FA    call        TDockZone.GetZoneLimit
 004465FF    push        eax
 00446600    mov         eax,esi
 00446602    call        TDockZone.GetLimitBegin
 00446607    pop         edx
 00446608    sub         edx,eax
 0044660A    sub         edx,dword ptr [edi+24]
 0044660D    cmp         edx,dword ptr [ebp-4]
>00446610    jge         00446616
 00446612    mov         bl,1
>00446614    jmp         0044668C
 00446616    mov         eax,esi
 00446618    call        TDockZone.GetZoneLimit
 0044661D    mov         edx,eax
 0044661F    sub         edx,dword ptr [edi+24]
 00446622    mov         eax,esi
 00446624    call        TDockZone.SetZoneLimit
 00446629    mov         eax,esi
 0044662B    call        TDockZone.GetZoneLimit
 00446630    mov         edx,eax
 00446632    add         edx,dword ptr [edi+24]
 00446635    mov         eax,edi
 00446637    call        TDockZone.SetZoneLimit
 0044663C    mov         eax,edi
 0044663E    call        TDockZone.PrevVisible
 00446643    call        TDockZone.ResetZoneLimits
>00446648    jmp         0044668C
 0044664A    mov         eax,edi
 0044664C    call        TDockZone.NextVisible
 00446651    test        eax,eax
>00446653    je          0044668C
 00446655    mov         eax,edi
 00446657    call        TDockZone.NextVisible
 0044665C    call        TDockZone.GetZoneLimit
 00446661    sub         eax,dword ptr [edi+24]
 00446664    cmp         eax,dword ptr [ebp-4]
>00446667    jge         0044666D
 00446669    mov         bl,1
>0044666B    jmp         0044668C
 0044666D    mov         eax,edi
 0044666F    call        TDockZone.GetLimitBegin
 00446674    mov         edx,eax
 00446676    add         edx,dword ptr [edi+24]
 00446679    mov         eax,edi
 0044667B    call        TDockZone.SetZoneLimit
 00446680    mov         eax,edi
 00446682    call        TDockZone.NextVisible
 00446687    call        TDockZone.ResetZoneLimits
 0044668C    test        bl,bl
>0044668E    je          00446698
 00446690    mov         eax,dword ptr [edi+14]
 00446693    call        TDockZone.ResetChildren
 00446698    mov         eax,dword ptr [ebp+8]
 0044669B    mov         eax,dword ptr [eax-4]
 0044669E    push        eax
 0044669F    push        4462A8;TDockTree.UpdateZone
 004466A4    mov         eax,dword ptr [ebp+8]
 004466A7    mov         eax,dword ptr [eax-4]
 004466AA    mov         edx,dword ptr [edi+14]
 004466AD    call        TDockTree.ForEachAt
 004466B2    pop         edi
 004466B3    pop         esi
 004466B4    pop         ebx
 004466B5    pop         ecx
 004466B6    pop         ebp
 004466B7    ret
*}
end;

//004466B8
procedure TDockTree.ControlVisibilityChanged(Control:TControl; Visible:Boolean);
begin
{*
 004466B8    push        ebp
 004466B9    mov         ebp,esp
 004466BB    add         esp,0FFFFFFF0
 004466BE    push        ebx
 004466BF    push        esi
 004466C0    mov         ebx,ecx
 004466C2    mov         esi,edx
 004466C4    mov         dword ptr [ebp-4],eax
 004466C7    mov         edx,esi
 004466C9    mov         eax,dword ptr [ebp-4]
 004466CC    call        TDockTree.FindControlZone
 004466D1    test        eax,eax
>004466D3    je          004466F6
 004466D5    test        bl,bl
>004466D7    je          004466E2
 004466D9    push        ebp
 004466DA    call        ShowZone
 004466DF    pop         ecx
>004466E0    jmp         004466E9
 004466E2    push        ebp
 004466E3    call        HideZone
 004466E8    pop         ecx
 004466E9    mov         eax,dword ptr [ebp-4]
 004466EC    mov         eax,dword ptr [eax+14]
 004466EF    mov         edx,dword ptr [eax]
 004466F1    call        dword ptr [edx+7C]
>004466F4    jmp         00446737
 004466F6    test        bl,bl
>004466F8    je          00446737
 004466FA    lea         ecx,[ebp-10]
 004466FD    mov         edx,dword ptr [esi+44]
 00446700    mov         eax,dword ptr [esi+40]
 00446703    call        Point
 00446708    lea         edx,[ebp-10]
 0044670B    lea         ecx,[ebp-8]
 0044670E    mov         eax,dword ptr [ebp-4]
 00446711    call        TDockTree.InternalHitTest
 00446716    test        eax,eax
>00446718    je          0044671F
 0044671A    mov         ebx,dword ptr [eax+4]
>0044671D    jmp         00446721
 0044671F    xor         ebx,ebx
 00446721    push        ebx
 00446722    mov         edx,ebx
 00446724    mov         eax,esi
 00446726    call        GetDockAlign
 0044672B    mov         ecx,eax
 0044672D    mov         edx,esi
 0044672F    mov         eax,dword ptr [ebp-4]
 00446732    mov         ebx,dword ptr [eax]
 00446734    call        dword ptr [ebx+8]
 00446737    pop         esi
 00446738    pop         ebx
 00446739    mov         esp,ebp
 0044673B    pop         ebp
 0044673C    ret
*}
end;

//00446740
procedure CalcSplitterPos;
begin
{*
 00446740    push        ebp
 00446741    mov         ebp,esp
 00446743    push        ebx
 00446744    push        esi
 00446745    push        edi
 00446746    mov         edi,dword ptr [ebp+8]
 00446749    add         edi,0FFFFFFFC
 0044674C    mov         eax,dword ptr [edi]
 0044674E    mov         ebx,dword ptr [eax+18]
 00446751    mov         eax,dword ptr [edi]
 00446753    mov         esi,dword ptr [eax+60]
 00446756    mov         eax,dword ptr [esi+14]
 00446759    cmp         byte ptr [eax+10],1
>0044675D    jne         00446795
 0044675F    mov         eax,esi
 00446761    mov         edx,1
 00446766    call        TDockZone.GetTopLeft
 0044676B    add         eax,ebx
 0044676D    mov         edx,dword ptr [edi]
 0044676F    cmp         eax,dword ptr [edx+54]
>00446772    jl          00446779
 00446774    mov         edx,dword ptr [edi]
 00446776    mov         dword ptr [edx+54],eax
 00446779    mov         eax,dword ptr [edi]
 0044677B    mov         edx,dword ptr [eax+60]
 0044677E    mov         eax,dword ptr [edi]
 00446780    call        TDockTree.GetNextLimit
 00446785    sub         eax,ebx
 00446787    mov         edx,dword ptr [edi]
 00446789    cmp         eax,dword ptr [edx+54]
>0044678C    jg          004467C9
 0044678E    mov         edx,dword ptr [edi]
 00446790    mov         dword ptr [edx+54],eax
>00446793    jmp         004467C9
 00446795    mov         eax,esi
 00446797    mov         edx,2
 0044679C    call        TDockZone.GetTopLeft
 004467A1    add         eax,ebx
 004467A3    mov         edx,dword ptr [edi]
 004467A5    cmp         eax,dword ptr [edx+50]
>004467A8    jl          004467AF
 004467AA    mov         edx,dword ptr [edi]
 004467AC    mov         dword ptr [edx+50],eax
 004467AF    mov         eax,dword ptr [edi]
 004467B1    mov         edx,dword ptr [eax+60]
 004467B4    mov         eax,dword ptr [edi]
 004467B6    call        TDockTree.GetNextLimit
 004467BB    sub         eax,ebx
 004467BD    mov         edx,dword ptr [edi]
 004467BF    cmp         eax,dword ptr [edx+50]
>004467C2    jg          004467C9
 004467C4    mov         edx,dword ptr [edi]
 004467C6    mov         dword ptr [edx+50],eax
 004467C9    pop         edi
 004467CA    pop         esi
 004467CB    pop         ebx
 004467CC    pop         ebp
 004467CD    ret
*}
end;

//004467D0
procedure TDockTree.WindowProc(var Message:TMessage);
begin
{*
 004467D0    push        ebp
 004467D1    mov         ebp,esp
 004467D3    add         esp,0FFFFFFB8
 004467D6    push        ebx
 004467D7    push        esi
 004467D8    push        edi
 004467D9    xor         ecx,ecx
 004467DB    mov         dword ptr [ebp-48],ecx
 004467DE    mov         ebx,edx
 004467E0    mov         dword ptr [ebp-4],eax
 004467E3    xor         eax,eax
 004467E5    push        ebp
 004467E6    push        446BA8
 004467EB    push        dword ptr fs:[eax]
 004467EE    mov         dword ptr fs:[eax],esp
 004467F1    mov         eax,dword ptr [ebx]
 004467F3    cmp         eax,202
>004467F8    jg          0044681C
>004467FA    je          0044699B
 00446800    sub         eax,20
>00446803    je          00446A0C
 00446809    sub         eax,1E0
>0044680E    je          00446859
 00446810    dec         eax
>00446811    je          004468EB
>00446817    jmp         00446B7D
 0044681C    sub         eax,203
>00446821    je          0044689C
 00446823    sub         eax,0AE2D
>00446828    je          00446AB3
 0044682E    sub         eax,12
>00446831    jne         00446B7D
 00446837    mov         eax,dword ptr [ebx+8]
 0044683A    cmp         dword ptr [eax],0B00B
>00446840    jne         00446B7D
 00446846    mov         ecx,dword ptr [eax+4]
 00446849    mov         edx,dword ptr [ebx+4]
 0044684C    mov         eax,dword ptr [ebp-4]
 0044684F    call        TDockTree.ControlVisibilityChanged
>00446854    jmp         00446B7D
 00446859    mov         eax,dword ptr [ebp-4]
 0044685C    cmp         dword ptr [eax+60],0
>00446860    je          00446B7D
 00446866    mov         eax,dword ptr [ebp-4]
 00446869    call        TDockTree.DrawSizeSplitter
 0044686E    lea         edx,[ebp-44]
 00446871    mov         eax,dword ptr [ebx+8]
 00446874    call        SmallPointToPoint
 00446879    mov         eax,dword ptr [ebp-4]
 0044687C    mov         edx,dword ptr [ebp-44]
 0044687F    mov         dword ptr [eax+50],edx
 00446882    mov         edx,dword ptr [ebp-40]
 00446885    mov         dword ptr [eax+54],edx
 00446888    push        ebp
 00446889    call        CalcSplitterPos
 0044688E    pop         ecx
 0044688F    mov         eax,dword ptr [ebp-4]
 00446892    call        TDockTree.DrawSizeSplitter
>00446897    jmp         00446B7D
 0044689C    lea         edx,[ebp-44]
 0044689F    mov         eax,dword ptr [ebx+8]
 004468A2    call        SmallPointToPoint
 004468A7    lea         edx,[ebp-44]
 004468AA    lea         ecx,[ebp-10]
 004468AD    mov         eax,dword ptr [ebp-4]
 004468B0    call        TDockTree.InternalHitTest
 004468B5    mov         esi,eax
 004468B7    test        esi,esi
>004468B9    je          00446B7D
 004468BF    cmp         dword ptr [esi+4],0
>004468C3    je          00446B7D
 004468C9    cmp         dword ptr [ebp-10],2
>004468CD    jne         00446B7D
 004468D3    call        CancelDrag
 004468D8    push        1
 004468DA    xor         ecx,ecx
 004468DC    xor         edx,edx
 004468DE    mov         eax,dword ptr [esi+4]
 004468E1    call        TControl.ManualDock
>004468E6    jmp         00446B7D
 004468EB    lea         edx,[ebp-0C]
 004468EE    mov         eax,dword ptr [ebx+8]
 004468F1    call        SmallPointToPoint
 004468F6    lea         ecx,[ebp-10]
 004468F9    lea         edx,[ebp-0C]
 004468FC    mov         eax,dword ptr [ebp-4]
 004468FF    call        TDockTree.InternalHitTest
 00446904    mov         esi,eax
 00446906    test        esi,esi
>00446908    je          00446B7D
 0044690E    cmp         dword ptr [ebp-10],12
>00446912    jne         00446926
 00446914    lea         ecx,[ebp-0C]
 00446917    mov         edx,esi
 00446919    mov         eax,dword ptr [ebp-4]
 0044691C    call        TDockTree.SplitterMouseDown
>00446921    jmp         00446B7D
 00446926    cmp         dword ptr [ebp-10],2
>0044692A    jne         00446B7D
 00446930    push        0
 00446932    push        203
 00446937    push        203
 0044693C    mov         eax,dword ptr [ebp-4]
 0044693F    mov         eax,dword ptr [eax+14]
 00446942    call        TWinControl.GetHandle
 00446947    push        eax
 00446948    lea         eax,[ebp-3C]
 0044694B    push        eax
 0044694C    call        user32.PeekMessageA
 00446951    test        eax,eax
>00446953    jne         00446972
 00446955    mov         eax,dword ptr [esi+4]
 00446958    mov         edx,dword ptr ds:[4380F4];TWinControl
 0044695E    call        @IsClass
 00446963    test        al,al
>00446965    je          00446972
 00446967    mov         eax,dword ptr [esi+4]
 0044696A    mov         edx,dword ptr [eax]
 0044696C    call        dword ptr [edx+0C4]
 00446972    mov         eax,dword ptr [esi+4]
 00446975    cmp         byte ptr [eax+9B],1
>0044697C    jne         00446B92
 00446982    cmp         byte ptr [eax+5D],1
>00446986    jne         00446B92
 0044698C    or          ecx,0FFFFFFFF
 0044698F    xor         edx,edx
 00446991    call        TControl.BeginDrag
>00446996    jmp         00446B92
 0044699B    mov         eax,dword ptr [ebp-4]
 0044699E    cmp         dword ptr [eax+60],0
>004469A2    jne         004469FF
 004469A4    lea         edx,[ebp-0C]
 004469A7    mov         eax,dword ptr [ebx+8]
 004469AA    call        SmallPointToPoint
 004469AF    lea         ecx,[ebp-10]
 004469B2    lea         edx,[ebp-0C]
 004469B5    mov         eax,dword ptr [ebp-4]
 004469B8    call        TDockTree.InternalHitTest
 004469BD    mov         esi,eax
 004469BF    test        esi,esi
>004469C1    je          00446B7D
 004469C7    cmp         dword ptr [ebp-10],14
>004469CB    jne         00446B7D
 004469D1    mov         edi,dword ptr [esi+4]
 004469D4    mov         eax,edi
 004469D6    mov         edx,dword ptr ds:[450CFC];TCustomForm
 004469DC    call        @IsClass
 004469E1    test        al,al
>004469E3    je          004469F1
 004469E5    mov         eax,edi
 004469E7    call        TCustomForm.Close
>004469EC    jmp         00446B7D
 004469F1    xor         edx,edx
 004469F3    mov         eax,edi
 004469F5    call        TControl.SetVisible
>004469FA    jmp         00446B7D
 004469FF    mov         eax,dword ptr [ebp-4]
 00446A02    call        TDockTree.SplitterMouseUp
>00446A07    jmp         00446B7D
 00446A0C    lea         eax,[ebp-0C]
 00446A0F    push        eax
 00446A10    call        user32.GetCursorPos
 00446A15    lea         ecx,[ebp-44]
 00446A18    lea         edx,[ebp-0C]
 00446A1B    mov         eax,dword ptr [ebp-4]
 00446A1E    mov         eax,dword ptr [eax+14]
 00446A21    call        TControl.ScreenToClient
 00446A26    mov         eax,dword ptr [ebp-44]
 00446A29    mov         dword ptr [ebp-0C],eax
 00446A2C    mov         eax,dword ptr [ebp-40]
 00446A2F    mov         dword ptr [ebp-8],eax
 00446A32    cmp         word ptr [ebx+8],1
>00446A37    jne         00446B7D
 00446A3D    mov         eax,dword ptr [ebp-4]
 00446A40    mov         eax,dword ptr [eax+14]
 00446A43    call        TWinControl.GetHandle
 00446A48    cmp         eax,dword ptr [ebx+4]
>00446A4B    jne         00446B7D
 00446A51    mov         eax,dword ptr [ebp-4]
 00446A54    mov         eax,dword ptr [eax+14]
 00446A57    call        TWinControl.GetVisibleDockClientCount
 00446A5C    test        eax,eax
>00446A5E    jle         00446B7D
 00446A64    lea         ecx,[ebp-10]
 00446A67    lea         edx,[ebp-0C]
 00446A6A    mov         eax,dword ptr [ebp-4]
 00446A6D    call        TDockTree.InternalHitTest
 00446A72    mov         esi,eax
 00446A74    test        esi,esi
>00446A76    je          00446B7D
 00446A7C    cmp         dword ptr [ebp-10],12
>00446A80    jne         00446B7D
 00446A86    mov         eax,dword ptr [esi+14]
 00446A89    movzx       eax,byte ptr [eax+10]
 00446A8D    movsx       edx,word ptr [eax*2+5ACC8C]
 00446A95    mov         eax,[005AE7DC];^Screen:TScreen
 00446A9A    mov         eax,dword ptr [eax]
 00446A9C    call        TScreen.GetCursors
 00446AA1    push        eax
 00446AA2    call        user32.SetCursor
 00446AA7    mov         dword ptr [ebx+0C],1
>00446AAE    jmp         00446B92
 00446AB3    mov         edx,ebx
 00446AB5    mov         esi,dword ptr [ebp-4]
 00446AB8    mov         eax,dword ptr [esi+34]
 00446ABB    call        dword ptr [esi+30]
 00446ABE    cmp         dword ptr [ebx+0C],0
>00446AC2    jne         00446B92
 00446AC8    lea         ecx,[ebp-10]
 00446ACB    mov         eax,dword ptr [ebx+8]
 00446ACE    lea         edx,[eax+28]
 00446AD1    mov         eax,dword ptr [ebp-4]
 00446AD4    mov         esi,dword ptr [eax]
 00446AD6    call        dword ptr [esi+4]
 00446AD9    mov         esi,eax
 00446ADB    cmp         dword ptr [ebp-10],12
>00446ADF    jne         00446AF1
 00446AE1    mov         eax,dword ptr [ebx+8]
 00446AE4    add         eax,38
 00446AE7    call        @LStrClr
>00446AEC    jmp         00446B92
 00446AF1    test        esi,esi
>00446AF3    je          00446B92
 00446AF9    mov         eax,dword ptr [ebp-10]
 00446AFC    sub         eax,2
>00446AFF    je          00446B0A
 00446B01    sub         eax,12
>00446B04    jne         00446B92
 00446B0A    lea         edx,[ebp-20]
 00446B0D    mov         eax,esi
 00446B0F    call        TControl.GetBoundsRect
 00446B14    lea         ecx,[ebp-20]
 00446B17    mov         edx,esi
 00446B19    mov         eax,dword ptr [ebp-4]
 00446B1C    mov         edi,dword ptr [eax]
 00446B1E    call        dword ptr [edi]
 00446B20    mov         eax,dword ptr [ebp-20]
 00446B23    sub         eax,dword ptr [esi+40]
 00446B26    add         eax,eax
 00446B28    sub         dword ptr [ebp-20],eax
 00446B2B    mov         eax,dword ptr [ebp-1C]
 00446B2E    sub         eax,dword ptr [esi+44]
 00446B31    add         eax,eax
 00446B33    sub         dword ptr [ebp-1C],eax
 00446B36    mov         eax,dword ptr [esi+48]
 00446B39    mov         edx,dword ptr [ebp-18]
 00446B3C    sub         edx,dword ptr [ebp-20]
 00446B3F    sub         eax,edx
 00446B41    add         eax,eax
 00446B43    sub         dword ptr [ebp-18],eax
 00446B46    mov         eax,dword ptr [esi+4C]
 00446B49    mov         edx,dword ptr [ebp-14]
 00446B4C    sub         edx,dword ptr [ebp-1C]
 00446B4F    sub         eax,edx
 00446B51    add         eax,eax
 00446B53    sub         dword ptr [ebp-14],eax
 00446B56    lea         edx,[ebp-48]
 00446B59    mov         eax,esi
 00446B5B    call        TControl.GetText
 00446B60    mov         edx,dword ptr [ebp-48]
 00446B63    mov         eax,dword ptr [ebx+8]
 00446B66    add         eax,38
 00446B69    call        @LStrAsg
 00446B6E    mov         eax,dword ptr [ebx+8]
 00446B71    lea         edi,[eax+18]
 00446B74    lea         esi,[ebp-20]
 00446B77    movs        dword ptr [edi],dword ptr [esi]
 00446B78    movs        dword ptr [edi],dword ptr [esi]
 00446B79    movs        dword ptr [edi],dword ptr [esi]
 00446B7A    movs        dword ptr [edi],dword ptr [esi]
>00446B7B    jmp         00446B92
 00446B7D    mov         eax,dword ptr [ebp-4]
 00446B80    cmp         word ptr [eax+32],0
>00446B85    je          00446B92
 00446B87    mov         edx,ebx
 00446B89    mov         ebx,dword ptr [ebp-4]
 00446B8C    mov         eax,dword ptr [ebx+34]
 00446B8F    call        dword ptr [ebx+30]
 00446B92    xor         eax,eax
 00446B94    pop         edx
 00446B95    pop         ecx
 00446B96    pop         ecx
 00446B97    mov         dword ptr fs:[eax],edx
 00446B9A    push        446BAF
 00446B9F    lea         eax,[ebp-48]
 00446BA2    call        @LStrClr
 00446BA7    ret
>00446BA8    jmp         @HandleFinally
>00446BAD    jmp         00446B9F
 00446BAF    pop         edi
 00446BB0    pop         esi
 00446BB1    pop         ebx
 00446BB2    mov         esp,ebp
 00446BB4    pop         ebp
 00446BB5    ret
*}
end;

//00446BB8
constructor TMouse.Create;
begin
{*
 00446BB8    push        ebx
 00446BB9    push        esi
 00446BBA    test        dl,dl
>00446BBC    je          00446BC6
 00446BBE    add         esp,0FFFFFFF0
 00446BC1    call        @ClassCreate
 00446BC6    mov         ebx,edx
 00446BC8    mov         esi,eax
 00446BCA    xor         edx,edx
 00446BCC    mov         eax,esi
 00446BCE    call        TObject.Create
 00446BD3    mov         byte ptr [esi+4],1
 00446BD7    mov         dword ptr [esi+8],5
 00446BDE    mov         eax,[005AE800]
 00446BE3    cmp         dword ptr [eax],2
>00446BE6    jne         00446BF2
 00446BE8    mov         eax,[005AE310]
 00446BED    cmp         dword ptr [eax],4
>00446BF0    jge         00446C1E
 00446BF2    mov         eax,[005AE800]
 00446BF7    cmp         dword ptr [eax],1
>00446BFA    jne         00446C1A
 00446BFC    mov         eax,[005AE310]
 00446C01    cmp         dword ptr [eax],4
>00446C04    jg          00446C1E
 00446C06    mov         eax,[005AE310]
 00446C0B    cmp         dword ptr [eax],4
>00446C0E    jne         00446C1A
 00446C10    mov         eax,[005AE618]
 00446C15    cmp         dword ptr [eax],0A
>00446C18    jge         00446C1E
 00446C1A    xor         eax,eax
>00446C1C    jmp         00446C20
 00446C1E    mov         al,1
 00446C20    mov         byte ptr [esi+0D],al
 00446C23    xor         edx,edx
 00446C25    mov         eax,esi
 00446C27    call        TMouse.SettingChanged
 00446C2C    mov         eax,esi
 00446C2E    test        bl,bl
>00446C30    je          00446C41
 00446C32    call        @AfterConstruction
 00446C37    pop         dword ptr fs:[0]
 00446C3E    add         esp,0C
 00446C41    mov         eax,esi
 00446C43    pop         esi
 00446C44    pop         ebx
 00446C45    ret
*}
end;

//00446C48
destructor TMouse.Destroy;
begin
{*
 00446C48    push        ebx
 00446C49    push        esi
 00446C4A    call        @BeforeDestruction
 00446C4F    mov         ebx,edx
 00446C51    mov         esi,eax
 00446C53    xor         edx,edx
 00446C55    mov         eax,esi
 00446C57    call        TMouse.SetCapture
 00446C5C    mov         edx,ebx
 00446C5E    and         dl,0FC
 00446C61    mov         eax,esi
 00446C63    call        TObject.Destroy
 00446C68    test        bl,bl
>00446C6A    jle         00446C73
 00446C6C    mov         eax,esi
 00446C6E    call        @ClassDestroy
 00446C73    pop         esi
 00446C74    pop         ebx
 00446C75    ret
*}
end;

//00446C78
function TMouse.GetCapture:HWND;
begin
{*
 00446C78    call        user32.GetCapture
 00446C7D    ret
*}
end;

//00446C80
function TMouse.GetCursorPos:TPoint;
begin
{*
 00446C80    push        ebx
 00446C81    mov         ebx,edx
 00446C83    push        ebx
 00446C84    call        user32.GetCursorPos
 00446C89    call        Win32Check
 00446C8E    pop         ebx
 00446C8F    ret
*}
end;

//00446C90
procedure TMouse.GetMouseData;
begin
{*
 00446C90    push        ebx
 00446C91    mov         ebx,eax
 00446C93    push        13
 00446C95    mov         eax,[005AE32C]
 00446C9A    mov         eax,dword ptr [eax]
 00446C9C    call        eax
 00446C9E    cmp         eax,1
 00446CA1    sbb         eax,eax
 00446CA3    inc         eax
 00446CA4    mov         byte ptr [ebx+0C],al
 00446CA7    pop         ebx
 00446CA8    ret
*}
end;

//00446CAC
procedure TMouse.GetNativeData;
begin
{*
 00446CAC    push        ebx
 00446CAD    push        esi
 00446CAE    mov         esi,eax
 00446CB0    push        4B
 00446CB2    mov         eax,[005AE32C]
 00446CB7    mov         eax,dword ptr [eax]
 00446CB9    call        eax
 00446CBB    cmp         eax,1
 00446CBE    sbb         ebx,ebx
 00446CC0    inc         ebx
 00446CC1    mov         byte ptr [esi+20],bl
 00446CC4    test        bl,bl
>00446CC6    je          00446CD7
 00446CC8    push        0
 00446CCA    lea         eax,[esi+10]
 00446CCD    push        eax
 00446CCE    push        0
 00446CD0    push        68
 00446CD2    call        user32.SystemParametersInfoA
 00446CD7    pop         esi
 00446CD8    pop         ebx
 00446CD9    ret
*}
end;

//00446CDC
procedure TMouse.GetRegisteredData;
begin
{*
 00446CDC    push        ebx
 00446CDD    push        ecx
 00446CDE    mov         ebx,eax
 00446CE0    push        esp
 00446CE1    lea         eax,[ebx+10]
 00446CE4    push        eax
 00446CE5    lea         ecx,[ebx+14]
 00446CE8    lea         edx,[ebx+24]
 00446CEB    lea         eax,[ebx+1C]
 00446CEE    call        HwndMSWheel
 00446CF3    mov         dword ptr [ebx+18],eax
 00446CF6    cmp         dword ptr [ebx+1C],0
 00446CFA    setne       al
 00446CFD    mov         byte ptr [ebx+20],al
 00446D00    pop         edx
 00446D01    pop         ebx
 00446D02    ret
*}
end;

//00446D04
procedure TMouse.SetCapture(const Value:HWND);
begin
{*
 00446D04    push        ebx
 00446D05    push        esi
 00446D06    mov         esi,edx
 00446D08    mov         ebx,eax
 00446D0A    mov         eax,ebx
 00446D0C    call        TMouse.GetCapture
 00446D11    cmp         esi,eax
>00446D13    je          00446D26
 00446D15    test        esi,esi
>00446D17    jne         00446D20
 00446D19    call        user32.ReleaseCapture
>00446D1E    jmp         00446D26
 00446D20    push        esi
 00446D21    call        user32.SetCapture
 00446D26    pop         esi
 00446D27    pop         ebx
 00446D28    ret
*}
end;

//00446D2C
procedure TMouse.SettingChanged(Setting:Integer);
begin
{*
 00446D2C    push        ebx
 00446D2D    mov         ebx,eax
 00446D2F    sub         edx,1
>00446D32    jb          00446D3B
 00446D34    sub         edx,67
>00446D37    je          00446D5A
>00446D39    jmp         00446D8B
 00446D3B    mov         eax,ebx
 00446D3D    call        TMouse.GetMouseData
 00446D42    cmp         byte ptr [ebx+0D],0
>00446D46    jne         00446D51
 00446D48    mov         eax,ebx
 00446D4A    call        TMouse.GetRegisteredData
>00446D4F    jmp         00446D8B
 00446D51    mov         eax,ebx
 00446D53    call        TMouse.GetNativeData
 00446D58    pop         ebx
 00446D59    ret
 00446D5A    cmp         byte ptr [ebx+20],0
>00446D5E    je          00446D8B
 00446D60    cmp         byte ptr [ebx+0D],0
>00446D64    je          00446D77
 00446D66    push        0
 00446D68    lea         eax,[ebx+10]
 00446D6B    push        eax
 00446D6C    push        0
 00446D6E    push        68
 00446D70    call        user32.SystemParametersInfoA
>00446D75    jmp         00446D8B
 00446D77    push        0
 00446D79    push        0
 00446D7B    mov         eax,dword ptr [ebx+14]
 00446D7E    push        eax
 00446D7F    mov         eax,dword ptr [ebx+18]
 00446D82    push        eax
 00446D83    call        user32.SendMessageA
 00446D88    mov         dword ptr [ebx+10],eax
 00446D8B    pop         ebx
 00446D8C    ret
*}
end;

//00446D90
procedure InitIMM32;
begin
{*
 00446D90    push        ebp
 00446D91    mov         ebp,esp
 00446D93    push        ecx
 00446D94    push        ebx
 00446D95    mov         eax,[005AE810];^SysLocale:TSysLocale
 00446D9A    cmp         byte ptr [eax+0C],0
>00446D9E    je          00446EFD
 00446DA4    push        8000
 00446DA9    call        KERNEL32.SetErrorMode
 00446DAE    mov         dword ptr [ebp-4],eax
 00446DB1    xor         eax,eax
 00446DB3    push        ebp
 00446DB4    push        446EF6
 00446DB9    push        dword ptr fs:[eax]
 00446DBC    mov         dword ptr fs:[eax],esp
 00446DBF    cmp         dword ptr ds:[5E0C60],0;_WINNLSEnableIME:function(val hwnd:Windows.HWND;val bool:System....
>00446DC6    jne         00446DE4
 00446DC8    push        446F04
 00446DCD    call        KERNEL32.GetModuleHandleA
 00446DD2    mov         ebx,eax
 00446DD4    push        446F0C
 00446DD9    push        ebx
 00446DDA    call        KERNEL32.GetProcAddress
 00446DDF    mov         [005E0C60],eax;_WINNLSEnableIME:function(val hwnd:Windows.HWND;val bool:System.LongBool)...
 00446DE4    cmp         dword ptr ds:[5ACC94],0
>00446DEB    jne         00446EDF
 00446DF1    push        446F1C
 00446DF6    call        KERNEL32.LoadLibraryA
 00446DFB    mov         [005ACC94],eax
 00446E00    cmp         dword ptr ds:[5ACC94],0
>00446E07    je          00446EDF
 00446E0D    push        446F28
 00446E12    mov         eax,[005ACC94]
 00446E17    push        eax
 00446E18    call        KERNEL32.GetProcAddress
 00446E1D    mov         [005E0C64],eax;_ImmGetContext:function(val hWnd:Windows.HWND):Imm.HIMC stdcall
 00446E22    push        446F38
 00446E27    mov         eax,[005ACC94]
 00446E2C    push        eax
 00446E2D    call        KERNEL32.GetProcAddress
 00446E32    mov         [005E0C68],eax;_ImmReleaseContext:function(val hWnd:Windows.HWND;val hImc:Imm.HIMC):Syst...
 00446E37    push        446F4C
 00446E3C    mov         eax,[005ACC94]
 00446E41    push        eax
 00446E42    call        KERNEL32.GetProcAddress
 00446E47    mov         [005E0C6C],eax;_ImmGetConversionStatus:function(val hImc:Imm.HIMC;var Conversion:Windows...
 00446E4C    push        446F64
 00446E51    mov         eax,[005ACC94]
 00446E56    push        eax
 00446E57    call        KERNEL32.GetProcAddress
 00446E5C    mov         [005E0C70],eax;_ImmSetConversionStatus:function(val hImc:Imm.HIMC;val Conversion:Windows...
 00446E61    push        446F7C
 00446E66    mov         eax,[005ACC94]
 00446E6B    push        eax
 00446E6C    call        KERNEL32.GetProcAddress
 00446E71    mov         [005E0C74],eax;_ImmSetOpenStatus:function(val hImc:Imm.HIMC;val fOpen:System.Boolean):Sy...
 00446E76    push        446F90
 00446E7B    mov         eax,[005ACC94]
 00446E80    push        eax
 00446E81    call        KERNEL32.GetProcAddress
 00446E86    mov         [005E0C78],eax;_ImmSetCompositionWindow:function(val hImc:Imm.HIMC;val lpCompForm:Imm.PC...
 00446E8B    push        446FA8
 00446E90    mov         eax,[005ACC94]
 00446E95    push        eax
 00446E96    call        KERNEL32.GetProcAddress
 00446E9B    mov         [005E0C7C],eax;_ImmSetCompositionFont:function(val hImc:Imm.HIMC;val lpLogfont:Windows.P...
 00446EA0    push        446FC0
 00446EA5    mov         eax,[005ACC94]
 00446EAA    push        eax
 00446EAB    call        KERNEL32.GetProcAddress
 00446EB0    mov         [005E0C80],eax;_ImmGetCompositionString:function(val hImc:Imm.HIMC;val dWord1:Windows.DW...
 00446EB5    push        446FDC
 00446EBA    mov         eax,[005ACC94]
 00446EBF    push        eax
 00446EC0    call        KERNEL32.GetProcAddress
 00446EC5    mov         [005E0C84],eax;_ImmIsIME:function(val hKl:Windows.HKL):System.Boolean stdcall
 00446ECA    push        446FE8
 00446ECF    mov         eax,[005ACC94]
 00446ED4    push        eax
 00446ED5    call        KERNEL32.GetProcAddress
 00446EDA    mov         [005E0C88],eax;_ImmNotifyIME:function(val hImc:Imm.HIMC;val dwAction:Windows.DWORD;val d...
 00446EDF    xor         eax,eax
 00446EE1    pop         edx
 00446EE2    pop         ecx
 00446EE3    pop         ecx
 00446EE4    mov         dword ptr fs:[eax],edx
 00446EE7    push        446EFD
 00446EEC    mov         eax,dword ptr [ebp-4]
 00446EEF    push        eax
 00446EF0    call        KERNEL32.SetErrorMode
 00446EF5    ret
>00446EF6    jmp         @HandleFinally
>00446EFB    jmp         00446EEC
 00446EFD    pop         ebx
 00446EFE    pop         ecx
 00446EFF    pop         ebp
 00446F00    ret
*}
end;

//00446FF8
function Win32NLSEnableIME(hWnd:HWND; Enable:Boolean):Boolean;
begin
{*
 00446FF8    cmp         dword ptr ds:[5E0C60],0;_WINNLSEnableIME:function(val hwnd:Windows.HWND;val bool:System....
>00446FFF    je          00447010
 00447001    cmp         dl,1
 00447004    cmc
 00447005    sbb         edx,edx
 00447007    push        edx
 00447008    push        eax
 00447009    call        dword ptr ds:[5E0C60]
 0044700F    ret
 00447010    xor         eax,eax
 00447012    ret
*}
end;

//00447014
procedure SetImeMode(hWnd:HWND; Mode:TImeMode);
begin
{*
 00447014    push        ebx
 00447015    push        esi
 00447016    push        edi
 00447017    add         esp,0FFFFFFF8
 0044701A    mov         ebx,edx
 0044701C    mov         esi,eax
 0044701E    mov         eax,[005AE810];^SysLocale:TSysLocale
 00447023    cmp         byte ptr [eax+0C],0
>00447027    je          004470E7
 0044702D    cmp         bl,3
>00447030    je          004470E7
 00447036    test        bl,bl
>00447038    jne         00447048
 0044703A    xor         edx,edx
 0044703C    mov         eax,esi
 0044703E    call        Win32NLSEnableIME
>00447043    jmp         004470E7
 00447048    mov         dl,1
 0044704A    mov         eax,esi
 0044704C    call        Win32NLSEnableIME
 00447051    cmp         dword ptr ds:[5ACC94],0
>00447058    je          004470E7
 0044705E    push        esi
 0044705F    call        dword ptr ds:[5E0C64]
 00447065    mov         edi,eax
 00447067    test        edi,edi
>00447069    je          004470E7
 0044706B    lea         eax,[esp+4]
 0044706F    push        eax
 00447070    lea         eax,[esp+4]
 00447074    push        eax
 00447075    push        edi
 00447076    call        dword ptr ds:[5E0C6C]
 0044707C    mov         eax,ebx
 0044707E    dec         al
>00447080    je          00447088
 00447082    dec         al
>00447084    je          00447093
>00447086    jmp         0044709E
 00447088    push        0
 0044708A    push        edi
 0044708B    call        dword ptr ds:[5E0C74]
>00447091    jmp         004470CE
 00447093    push        1
 00447095    push        edi
 00447096    call        dword ptr ds:[5E0C74]
>0044709C    jmp         004470CE
 0044709E    push        1
 004470A0    push        edi
 004470A1    call        dword ptr ds:[5E0C74]
 004470A7    lea         eax,[esp+4]
 004470AB    push        eax
 004470AC    lea         eax,[esp+4]
 004470B0    push        eax
 004470B1    push        edi
 004470B2    call        dword ptr ds:[5E0C6C]
 004470B8    mov         eax,dword ptr [esp]
 004470BB    and         eax,0FFFFFFF4
 004470BE    xor         edx,edx
 004470C0    mov         dl,bl
 004470C2    movzx       edx,byte ptr [edx+5ACC94]
 004470C9    or          eax,edx
 004470CB    mov         dword ptr [esp],eax
 004470CE    mov         eax,dword ptr [esp+4]
 004470D2    push        eax
 004470D3    mov         eax,dword ptr [esp+4]
 004470D7    push        eax
 004470D8    push        edi
 004470D9    call        dword ptr ds:[5E0C70]
 004470DF    push        edi
 004470E0    push        esi
 004470E1    call        dword ptr ds:[5E0C68]
 004470E7    pop         ecx
 004470E8    pop         edx
 004470E9    pop         edi
 004470EA    pop         esi
 004470EB    pop         ebx
 004470EC    ret
*}
end;

//004470F0
function Imm32IsIME(hKl:HKL):Boolean;
begin
{*
 004470F0    cmp         dword ptr ds:[5ACC94],0
>004470F7    je          00447101
 004470F9    push        eax
 004470FA    call        dword ptr ds:[5E0C84]
 00447100    ret
 00447101    xor         eax,eax
 00447103    ret
*}
end;

//00447104
procedure DoneControls;
begin
{*
 00447104    mov         eax,[005AE584];^Application:TApplication
 00447109    mov         eax,dword ptr [eax]
 0044710B    call        TObject.Free
 00447110    mov         eax,[005AE584];^Application:TApplication
 00447115    xor         edx,edx
 00447117    mov         dword ptr [eax],edx
 00447119    mov         eax,[005AE7DC];^Screen:TScreen
 0044711E    mov         eax,dword ptr [eax]
 00447120    call        TObject.Free
 00447125    mov         eax,[005AE7DC];^Screen:TScreen
 0044712A    xor         edx,edx
 0044712C    mov         dword ptr [eax],edx
 0044712E    mov         eax,[005E0C0C];Mouse:TMouse
 00447133    call        TObject.Free
 00447138    xor         eax,eax
 0044713A    mov         [005E0C0C],eax;Mouse:TMouse
 0044713F    mov         eax,[005E0C5C];CanvasList:TThreadList
 00447144    call        TObject.Free
 00447149    mov         ax,[005E0C1A];ControlAtom:TAtom
 0044714F    push        eax
 00447150    call        KERNEL32.GlobalDeleteAtom
 00447155    mov         eax,5E0C20;ControlAtomString:AnsiString
 0044715A    call        @LStrClr
 0044715F    mov         ax,[005E0C18];WindowAtom:TAtom
 00447165    push        eax
 00447166    call        KERNEL32.GlobalDeleteAtom
 0044716B    mov         eax,5E0C1C;WindowAtomString:AnsiString
 00447170    call        @LStrClr
 00447175    cmp         dword ptr ds:[5ACC94],0
>0044717C    je          00447189
 0044717E    mov         eax,[005ACC94]
 00447183    push        eax
 00447184    call        KERNEL32.FreeLibrary
 00447189    ret
*}
end;

//0044718C
procedure InitControls;
begin
{*
 0044718C    push        ebp
 0044718D    mov         ebp,esp
 0044718F    add         esp,0FFFFFFE0
 00447192    push        ebx
 00447193    xor         eax,eax
 00447195    mov         dword ptr [ebp-10],eax
 00447198    mov         dword ptr [ebp-4],eax
 0044719B    xor         eax,eax
 0044719D    push        ebp
 0044719E    push        447304
 004471A3    push        dword ptr fs:[eax]
 004471A6    mov         dword ptr fs:[eax],esp
 004471A9    lea         eax,[ebp-4]
 004471AC    push        eax
 004471AD    call        KERNEL32.GetCurrentProcessId
 004471B2    mov         dword ptr [ebp-0C],eax
 004471B5    mov         byte ptr [ebp-8],0
 004471B9    lea         edx,[ebp-0C]
 004471BC    xor         ecx,ecx
 004471BE    mov         eax,447318;'Delphi%.8X'
 004471C3    call        Format
 004471C8    mov         edx,dword ptr [ebp-4]
 004471CB    mov         eax,5E0C1C;WindowAtomString:AnsiString
 004471D0    call        @LStrAsg
 004471D5    mov         eax,[005E0C1C];WindowAtomString:AnsiString
 004471DA    call        @LStrToPChar
 004471DF    push        eax
 004471E0    call        KERNEL32.GlobalAddAtomA
 004471E5    mov         [005E0C18],ax;WindowAtom:TAtom
 004471EB    lea         eax,[ebp-10]
 004471EE    push        eax
 004471EF    mov         eax,[005AF664];gvar_005AF664
 004471F4    mov         dword ptr [ebp-20],eax
 004471F7    mov         byte ptr [ebp-1C],0
 004471FB    call        KERNEL32.GetCurrentThreadId
 00447200    mov         dword ptr [ebp-18],eax
 00447203    mov         byte ptr [ebp-14],0
 00447207    lea         edx,[ebp-20]
 0044720A    mov         ecx,1
 0044720F    mov         eax,44732C;'ControlOfs%.8X%.8X'
 00447214    call        Format
 00447219    mov         edx,dword ptr [ebp-10]
 0044721C    mov         eax,5E0C20;ControlAtomString:AnsiString
 00447221    call        @LStrAsg
 00447226    mov         eax,[005E0C20];ControlAtomString:AnsiString
 0044722B    call        @LStrToPChar
 00447230    push        eax
 00447231    call        KERNEL32.GlobalAddAtomA
 00447236    mov         [005E0C1A],ax;ControlAtom:TAtom
 0044723C    mov         eax,[005E0C20];ControlAtomString:AnsiString
 00447241    call        @LStrToPChar
 00447246    push        eax
 00447247    call        user32.RegisterWindowMessageA
 0044724C    mov         [005E0C24],eax;RM_GetObjectInstance:DWORD
 00447251    mov         dl,1
 00447253    mov         eax,[00417D50];TThreadList
 00447258    call        TThreadList.Create
 0044725D    mov         [005E0C5C],eax;CanvasList:TThreadList
 00447262    call        InitIMM32
 00447267    mov         dl,1
 00447269    mov         eax,[00438A98];TMouse
 0044726E    call        TMouse.Create
 00447273    mov         [005E0C0C],eax;Mouse:TMouse
 00447278    xor         ecx,ecx
 0044727A    mov         dl,1
 0044727C    mov         eax,[00451FD0];TScreen
 00447281    call        TScreen.Create
 00447286    mov         edx,dword ptr ds:[5AE7DC];^Screen:TScreen
 0044728C    mov         dword ptr [edx],eax
 0044728E    xor         ecx,ecx
 00447290    mov         dl,1
 00447292    mov         eax,[004520A8];TApplication
 00447297    call        TApplication.Create
 0044729C    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 004472A2    mov         dword ptr [edx],eax
 004472A4    mov         eax,[005AE584];^Application:TApplication
 004472A9    mov         eax,dword ptr [eax]
 004472AB    mov         dl,1
 004472AD    call        TApplication.SetShowHint
 004472B2    mov         ecx,438E0C;CursorToIdent:Boolean
 004472B7    mov         edx,438E1C;IdentToCursor:Boolean
 004472BC    mov         eax,[00436B7C];TCursor
 004472C1    call        RegisterIntegerConsts
 004472C6    push        447340
 004472CB    call        KERNEL32.GetModuleHandleA
 004472D0    mov         ebx,eax
 004472D2    test        ebx,ebx
>004472D4    je          004472E6
 004472D6    push        447348
 004472DB    push        ebx
 004472DC    call        KERNEL32.GetProcAddress
 004472E1    mov         [005ACB64],eax
 004472E6    xor         eax,eax
 004472E8    pop         edx
 004472E9    pop         ecx
 004472EA    pop         ecx
 004472EB    mov         dword ptr fs:[eax],edx
 004472EE    push        44730B
 004472F3    lea         eax,[ebp-10]
 004472F6    call        @LStrClr
 004472FB    lea         eax,[ebp-4]
 004472FE    call        @LStrClr
 00447303    ret
>00447304    jmp         @HandleFinally
>00447309    jmp         004472F3
 0044730B    pop         ebx
 0044730C    mov         esp,ebp
 0044730E    pop         ebp
 0044730F    ret
*}
end;

Initialization
//004473C0
{*
 004473C0    push        ebp
 004473C1    mov         ebp,esp
 004473C3    xor         eax,eax
 004473C5    push        ebp
 004473C6    push        447446
 004473CB    push        dword ptr fs:[eax]
 004473CE    mov         dword ptr fs:[eax],esp
 004473D1    sub         dword ptr ds:[5E0C14],1
>004473D8    jae         00447438
 004473DA    call        KERNEL32.GetVersion
 004473DF    and         eax,0FF
 004473E4    cmp         ax,4
 004473E8    setae       byte ptr ds:[5E0C10];NewStyleControls:Boolean
 004473EF    call        InitControls
 004473F4    mov         eax,[00437BA4];TControl
 004473F9    call        StartClassGroup
 004473FE    mov         eax,[00437BA4];TControl
 00447403    call        ActivateClassGroup
 00447408    mov         edx,dword ptr ds:[437BA4];TControl
 0044740E    mov         eax,[00448760];TCustomImageList
 00447413    call        GroupDescendentsWith
 00447418    mov         edx,dword ptr ds:[437BA4];TControl
 0044741E    mov         eax,[00447450];TContainedAction
 00447423    call        GroupDescendentsWith
 00447428    mov         edx,dword ptr ds:[437BA4];TControl
 0044742E    mov         eax,[00447574];TCustomActionList
 00447433    call        GroupDescendentsWith
 00447438    xor         eax,eax
 0044743A    pop         edx
 0044743B    pop         ecx
 0044743C    pop         ecx
 0044743D    mov         dword ptr fs:[eax],edx
 00447440    push        44744D
 00447445    ret
>00447446    jmp         @HandleFinally
>0044744B    jmp         00447445
 0044744D    pop         ebp
 0044744E    ret
*}
Finalization
//00447358
{*
 00447358    push        ebp
 00447359    mov         ebp,esp
 0044735B    xor         eax,eax
 0044735D    push        ebp
 0044735E    push        4473B7
 00447363    push        dword ptr fs:[eax]
 00447366    mov         dword ptr fs:[eax],esp
 00447369    inc         dword ptr ds:[5E0C14]
>0044736F    jne         004473A9
 00447371    mov         eax,5E0C50;DockSiteList:TList
 00447376    call        FreeAndNil
 0044737B    call        DoneControls
 00447380    mov         eax,5ACB78
 00447385    mov         ecx,16
 0044738A    mov         edx,dword ptr ds:[418F20];TIdentMapEntry
 00447390    call        @FinalizeArray
 00447395    mov         eax,5E0C20;ControlAtomString:AnsiString
 0044739A    call        @LStrClr
 0044739F    mov         eax,5E0C1C;WindowAtomString:AnsiString
 004473A4    call        @LStrClr
 004473A9    xor         eax,eax
 004473AB    pop         edx
 004473AC    pop         ecx
 004473AD    pop         ecx
 004473AE    mov         dword ptr fs:[eax],edx
 004473B1    push        4473BE
 004473B6    ret
>004473B7    jmp         @HandleFinally
>004473BC    jmp         004473B6
 004473BE    pop         ebp
 004473BF    ret
*}
end.